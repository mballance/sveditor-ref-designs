/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand02_ind_07.s
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

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0 \
    rdpr %tnpc, %g2; \
    save;  \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    restore; \
    illtrap;\
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
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
#define H_T0_Trap_Instruction_3
#define My_T0_Trap_Instruction_3 \
    inc %l3;\
    inc %o3;\
    umul %o3, 2, %o4;\
    inc %i3;\
    save ;\
    restore ;\
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
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
#define H_T1_Trap_Instruction_1
#define My_T1_Trap_Instruction_1 \
    umul %o4, 2, %o5;\
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    illtrap;\
    retry
#define H_T1_Trap_Instruction_2
#define My_T1_Trap_Instruction_2 \
    inc %o3;\
    umul %o3, 2, %o4;\
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
#define H_T1_Trap_Instruction_3
#define My_T1_Trap_Instruction_3 \
    inc %l3;\
    inc %o3;\
    umul %o3, 2, %o4;\
    inc %i3;\
    save ;\
    restore ;\
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
    save;  \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    restore; \
    illtrap;\
    retry
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5 \
    call htrap_5_ext;\
    nop; retry;\
    nop; nop; nop; nop; nop

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    umul %i7, 4, %g1;\
    inc %o6;\
    umul %i4, 3, %l3;\
    inc %g6;\
    save ;\
    restore ;\
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    umul %i0, 4, %g1;\
    inc %o6;\
    ba 1f; \
    rdhpr %htstate, %g3;\
    2: done; \
    1: ba 2b;\
    wrhpr %g3, 1, %htstate;nop

#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    inc %l5;\
    dec %g3;\
    umul %i5, 4, %g5;\
    save; \
    restore;\
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
    save; \
    restore;\
    done; \
    nop; nop
#define H_HT0_Division_By_Zero
#define My_HT0_Division_By_Zero \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_T1_Division_By_Zero_0x28
#define My_H_T1_Division_By_Zero_0x28 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero\
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop

#define H_T1_Fp_Exception_Other_0x22
#define My_H_T1_Fp_Exception_Other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_T1_Privileged_Opcode_0x11
#define SUN_H_T1_Privileged_Opcode_0x11 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
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
    call wdog_2_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
    umul %i0, 4, %g1;\
    not %g0, %g2; \
    ba 1f; \
    illtrap; \
    2: done; \
    nop; \
    1: ba 2b; \
    ldx [%g2], %g3

#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
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
	ldx [%r31+240], %r30
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
	ldx [%r31+240], %r30
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
	ldx [%r31+240], %r30
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
	.word 0x91a00566  ! 1: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0x24700001  ! 3: BPLE	<illegal instruction>
DS_0:
	.word 0x20800001  ! 5: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b08309  ! 4: ALLIGNADDRESS	alignaddr	%r2, %r9, %r0
	.word 0x8d902ade  ! 5: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	.word 0x8d802004  ! 6: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc0cfe010  ! 7: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0x9ed3e001  ! 8: UMULcc_I	umulcc 	%r15, 0x0001, %r15
	.word 0x81982247  ! 9: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0247, %hpstate
	.word 0xded004a0  ! 10: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	.word 0x8d902002  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x0002, %pstate
	.word 0x81982d5b  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0x26700001  ! 13: BPL	<illegal instruction>
	.word 0x85480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x8da089ea  ! 15: FDIVq	dis not found

	.word 0x8d902083  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc27e001  ! 18: STW_I	stw	%r6, [%r31 + 0x0001]
	.word 0x89a289e0  ! 19: FDIVq	dis not found

	.word 0x8d90208e  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x008e, %pstate
	.word 0x8d802004  ! 21: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x95a00541  ! 22: FSQRTd	fsqrt	
	.word 0x81504000  ! 23: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x81514000  ! 24: RDPR_TBA	rdpr	%tba, %r0
	.word 0xc13fc001  ! 25: STDF_R	std	%f0, [%r1, %r31]
	.word 0xc0900e80  ! 26: LDUHA_R	lduha	[%r0, %r0] 0x74, %r0
	.word 0x8d902acb  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x0acb, %pstate
	.word 0x91480000  ! 28: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x2e700001  ! 29: BPVS	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd037c001  ! 31: STH_R	sth	%r8, [%r31 + %r1]
	.word 0xd0dfe010  ! 32: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0xd07fe001  ! 33: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x2a800001  ! 34: BCS	bcs,a	<label_0x1>
	.word 0x827ae001  ! 35: SDIV_I	sdiv 	%r11, 0x0001, %r1
	.word 0x81982d0a  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0a, %hpstate
	.word 0x97d02031  ! 37: Tcc_I	tge	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc2d004a0  ! 40: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x89a089ea  ! 41: FDIVq	dis not found

	.word 0xc817c000  ! 42: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0xc88008a0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8d9020cf  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x00cf, %pstate
	.word 0xc88008a0  ! 45: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x81480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x819824d8  ! 47: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d8, %hpstate
	.word 0x81982e41  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
	.word 0xc0d80e80  ! 49: LDXA_R	ldxa	[%r0, %r0] 0x74, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802080  ! 51: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d802000  ! 52: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b6b2001  ! 53: SDIVX_I	sdivx	%r12, 0x0001, %r13
	.word 0x8d802000  ! 54: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198248c  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048c, %hpstate
DS_1:
	.word 0x32800001  ! 57: BNE	bne,a	<label_0x1>
	.word 0xc332c009  ! 57: STQF_R	-	%f1, [%r9, %r11]
	.word 0x93458000  ! 56: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8e6a8008  ! 57: UDIVX_R	udivx 	%r10, %r8, %r7
	.word 0x8d802000  ! 58: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8680e001  ! 59: ADDcc_I	addcc 	%r3, 0x0001, %r3
DS_2:
	.word 0x32800001  ! 61: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b1c303  ! 60: ALLIGNADDRESS	alignaddr	%r7, %r3, %r1
	.word 0xc2800c00  ! 61: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r1
	.word 0x91d02032  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91a1cd25  ! 63: FsMULd	fsmuld	%f7, %f36, %f8
	.word 0x20800001  ! 64: BN	bn,a	<label_0x1>
	.word 0xd08008a0  ! 65: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x9c4ac009  ! 66: MULX_R	mulx 	%r11, %r9, %r14
	.word 0x8d902085  ! 67: WRPR_PSTATE_I	wrpr	%r0, 0x0085, %pstate
	.word 0x8dd02031  ! 68: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 70: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdc8fe030  ! 71: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r14
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
DS_3:
	.word 0x22800001  ! 75: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b3c303  ! 74: ALLIGNADDRESS	alignaddr	%r15, %r3, %r11
DS_4:
	.word 0x34800001  ! 76: BG	bg,a	<label_0x1>
	.word 0xc1306001  ! 76: STQF_I	-	%f0, [0x0001, %r1]
	.word 0x91458000  ! 75: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x83a2c9eb  ! 76: FDIVq	dis not found

	.word 0xc327c00b  ! 77: STF_R	st	%f1, [%r11, %r31]
	.word 0x9d508000  ! 78: RDPR_TSTATE	rdpr	%tstate, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdcd7e010  ! 80: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r14
	.word 0x8fa1cdc9  ! 81: FdMULq	fdmulq	
	.word 0xcedfe010  ! 82: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0x8d802000  ! 83: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e700001  ! 84: BPVC	<illegal instruction>
	.word 0x3e700001  ! 85: BPVC	<illegal instruction>
	.word 0x9a686001  ! 86: UDIVX_I	udivx 	%r1, 0x0001, %r13
	ta	T_CHANGE_PRIV	! macro
DS_5:
	.word 0x32800001  ! 89: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x99b28300  ! 88: ALLIGNADDRESS	alignaddr	%r10, %r0, %r12
	.word 0xd82fc000  ! 89: STB_R	stb	%r12, [%r31 + %r0]
	.word 0x9da01a6d  ! 90: FqTOi	fqtoi	
	mov 0x32, %r30
	.word 0x91d0001e  ! 91: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 92: BG	bg,a	<label_0x1>
	.word 0x819821c5  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c5, %hpstate
	.word 0x8198215d  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015d, %hpstate
	.word 0x81982a55  ! 95: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a55, %hpstate
DS_6:
	.word 0x22800001  ! 97: BE	be,a	<label_0x1>
	.word 0xdd338004  ! 97: STQF_R	-	%f14, [%r4, %r14]
	.word 0x99458000  ! 96: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd807e001  ! 98: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87802004  ! 99: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9020d9  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 103: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8198240e  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040e, %hpstate
	.word 0x36800001  ! 105: BGE	bge,a	<label_0x1>
	.word 0x81a189a1  ! 106: FDIVs	fdivs	%f6, %f1, %f0
	.word 0x9679c007  ! 107: SDIV_R	sdiv 	%r7, %r7, %r11
	.word 0x81982c97  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c97, %hpstate
	.word 0x8f494000  ! 109: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0x8d902a44  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x0a44, %pstate
	.word 0xce800a60  ! 111: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r7
	.word 0x81d02035  ! 112: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0xce8008a0  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8000e001  ! 114: ADD_I	add 	%r3, 0x0001, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc0d804a0  ! 116: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
DS_7:
	.word 0x22800001  ! 118: BE	be,a	<label_0x1>
	.word 0xd9300009  ! 118: STQF_R	-	%f12, [%r9, %r0]
	.word 0x8f458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xcf97e001  ! 118: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x81a000c6  ! 119: FNEGd	fnegd	%f6, %f0
	.word 0x84022001  ! 120: ADD_I	add 	%r8, 0x0001, %r2
	.word 0x8d90264b  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x064b, %pstate
	.word 0x87802014  ! 122: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982c81  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c81, %hpstate
	.word 0xc41fe001  ! 124: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0x9fa00dce  ! 125: FdMULq	fdmulq	
	.word 0x3a800001  ! 126: BCC	bcc,a	<label_0x1>
	.word 0x83d02032  ! 127: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x81a1cd2e  ! 128: FsMULd	fsmuld	%f7, %f14, %f0
	.word 0x819829c2  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
	.word 0xc117c000  ! 130: LDQF_R	-	[%r31, %r0], %f0
	.word 0xc0c80e40  ! 131: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r0
	.word 0x8ad16001  ! 132: UMULcc_I	umulcc 	%r5, 0x0001, %r5
	.word 0x87d02035  ! 133: Tcc_I	tl	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcb27e001  ! 135: STF_I	st	%f5, [0x0001, %r31]
	.word 0xca900e60  ! 136: LDUHA_R	lduha	[%r0, %r0] 0x73, %r5
DS_8:
	.word 0x32800001  ! 138: BNE	bne,a	<label_0x1>
	.word 0xcf326001  ! 138: STQF_I	-	%f7, [0x0001, %r9]
	.word 0x8b458000  ! 137: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x84c3a001  ! 138: ADDCcc_I	addccc 	%r14, 0x0001, %r2
	.word 0xc457e001  ! 139: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x8d902cc1  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x0cc1, %pstate
	.word 0x8d902e46  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0e46, %pstate
	.word 0x9a832001  ! 142: ADDcc_I	addcc 	%r12, 0x0001, %r13
	.word 0x9c00a001  ! 143: ADD_I	add 	%r2, 0x0001, %r14
	ta	T_CHANGE_NONHPRIV	! macro
DS_9:
	.word 0x22800001  ! 146: BE	be,a	<label_0x1>
	illtrap
	.word 0x85b20301  ! 145: ALLIGNADDRESS	alignaddr	%r8, %r1, %r2
	.word 0xc48008a0  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x38700001  ! 147: BPGU	<illegal instruction>
	.word 0x844a8005  ! 148: MULX_R	mulx 	%r10, %r5, %r2
	.word 0xc48fe030  ! 149: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r2
	.word 0x22700001  ! 150: BPE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
DS_10:
	.word 0x20800001  ! 153: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb0c304  ! 152: ALLIGNADDRESS	alignaddr	%r3, %r4, %r5
	.word 0x9fd02030  ! 153: Tcc_I	tvc	icc_or_xcc, %r0 + 48
DS_11:
	.word 0x22800001  ! 155: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b08304  ! 154: ALLIGNADDRESS	alignaddr	%r2, %r4, %r1
	.word 0x26700001  ! 155: BPL	<illegal instruction>
DS_12:
	.word 0x20800001  ! 157: BN	bn,a	<label_0x1>
	.word 0xd7320007  ! 157: STQF_R	-	%f11, [%r7, %r8]
	.word 0x81458000  ! 156: RD_SOFTINT_REG	stbar
	.word 0x8198211b  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011b, %hpstate
	.word 0x87802016  ! 158: WRASI_I	wr	%r0, 0x0016, %asi
DS_13:
	.word 0x34800001  ! 160: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b30301  ! 159: ALLIGNADDRESS	alignaddr	%r12, %r1, %r10
	.word 0x85500000  ! 160: RDPR_TPC	rdpr	%tpc, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x35, %r30
	.word 0x81d0001e  ! 162: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x86786001  ! 163: SDIV_I	sdiv 	%r1, 0x0001, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 165: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x819826d1  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d1, %hpstate
	.word 0x8a504006  ! 167: UMUL_R	umul 	%r1, %r6, %r5
	.word 0x8d802004  ! 168: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x32700001  ! 169: BPNE	<illegal instruction>
	.word 0x8ba0054d  ! 170: FSQRTd	fsqrt	
	.word 0x8d902e5d  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	.word 0xca9004a0  ! 172: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x8d802004  ! 173: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982e93  ! 175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e93, %hpstate
	.word 0x8b6bc002  ! 176: SDIVX_R	sdivx	%r15, %r2, %r5
DS_14:
	.word 0x22800001  ! 178: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db3430e  ! 177: ALLIGNADDRESS	alignaddr	%r13, %r14, %r14
	.word 0xdcdfe030  ! 178: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r14
DS_15:
	.word 0x22800001  ! 180: BE	be,a	<label_0x1>
	.word 0xdf31e001  ! 180: STQF_I	-	%f15, [0x0001, %r7]
	.word 0x9b458000  ! 179: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8198235c  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035c, %hpstate
	mov 0x30, %r30
	.word 0x87d0001e  ! 181: Tcc_R	tl	icc_or_xcc, %r0 + %r30
DS_16:
	.word 0x20800001  ! 183: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b00304  ! 182: ALLIGNADDRESS	alignaddr	%r0, %r4, %r9
	.word 0x81982a08  ! 183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a08, %hpstate
	.word 0xd2c004a0  ! 184: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8d902486  ! 185: WRPR_PSTATE_I	wrpr	%r0, 0x0486, %pstate
	mov 0x33, %r30
	.word 0x8bd0001e  ! 186: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x819824d4  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d4, %hpstate
	.word 0xd23fc004  ! 188: STD_R	std	%r9, [%r31 + %r4]
	mov 0x31, %r30
	.word 0x9fd0001e  ! 189: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x884b6001  ! 190: MULX_I	mulx 	%r13, 0x0001, %r4
	mov 0x34, %r30
	.word 0x9bd0001e  ! 191: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x91d0001e  ! 192: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 193: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xc9e7c024  ! 194: CASA_I	casa	[%r31] 0x 1, %r4, %r4
	.word 0x85a3c9cb  ! 195: FDIVd	fdivd	%f46, %f42, %f2
	.word 0xc48008a0  ! 196: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x87802089  ! 197: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc4800bc0  ! 198: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
DS_17:
	.word 0x22800001  ! 200: BE	be,a	<label_0x1>
	.word 0xd133c00b  ! 200: STQF_R	-	%f8, [%r11, %r15]
	.word 0x9b458000  ! 199: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902a4f  ! 200: WRPR_PSTATE_I	wrpr	%r0, 0x0a4f, %pstate
	.word 0x87802016  ! 201: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9ba0056f  ! 202: FSQRTq	fsqrt	
	.word 0x8ba309e1  ! 203: FDIVq	dis not found

	.word 0x88d9c006  ! 204: SMULcc_R	smulcc 	%r7, %r6, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 206: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902888  ! 207: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	mov 0x35, %r30
	.word 0x87d0001e  ! 208: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x91a38dce  ! 209: FdMULq	fdmulq	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9551c000  ! 211: RDPR_TL	rdpr	%tl, %r10
	.word 0x88782001  ! 212: SDIV_I	sdiv 	%r0, 0x0001, %r4
	.word 0x8d902c52  ! 213: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
	.word 0x91480000  ! 214: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802014  ! 216: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982297  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0297, %hpstate
	.word 0x8d902c8f  ! 218: WRPR_PSTATE_I	wrpr	%r0, 0x0c8f, %pstate
	.word 0x8198278a  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078a, %hpstate
	.word 0x8198238c  ! 220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038c, %hpstate
	.word 0x8d90221c  ! 221: WRPR_PSTATE_I	wrpr	%r0, 0x021c, %pstate
DS_18:
	.word 0x20800001  ! 223: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b1430d  ! 222: ALLIGNADDRESS	alignaddr	%r5, %r13, %r9
	.word 0x8d902cc5  ! 223: WRPR_PSTATE_I	wrpr	%r0, 0x0cc5, %pstate
	.word 0xd2ffc02d  ! 224: SWAPA_R	swapa	%r9, [%r31 + %r13] 0x01
	.word 0x8d802000  ! 225: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd28fe030  ! 226: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	mov 0x31, %r30
	.word 0x8bd0001e  ! 227: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd27fe001  ! 228: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0x3a700001  ! 229: BPCC	<illegal instruction>
	.word 0x8d902698  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x0698, %pstate
	.word 0x8d902058  ! 231: WRPR_PSTATE_I	wrpr	%r0, 0x0058, %pstate
	mov 0x34, %r30
	.word 0x81d0001e  ! 232: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
DS_19:
	.word 0x34800001  ! 236: BG	bg,a	<label_0x1>
	illtrap
	.word 0x89b14300  ! 235: ALLIGNADDRESS	alignaddr	%r5, %r0, %r4
	.word 0xc8d804a0  ! 236: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x9f500000  ! 237: RDPR_TPC	rdpr	%tpc, %r15
	.word 0xde8008a0  ! 238: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x30800001  ! 239: BA	ba,a	<label_0x1>
	.word 0x82826001  ! 240: ADDcc_I	addcc 	%r9, 0x0001, %r1
	.word 0xc2c80e40  ! 241: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r1
	.word 0xc20fe001  ! 242: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0x87d02034  ! 243: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x9c79c00f  ! 244: SDIV_R	sdiv 	%r7, %r15, %r14
	.word 0xdc9fe001  ! 245: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r14
	.word 0x9fa0c9c3  ! 246: FDIVd	fdivd	%f34, %f34, %f46
	.word 0x99d02031  ! 247: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	mov 0x31, %r30
	.word 0x8bd0001e  ! 248: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x2a700001  ! 249: BPCS	<illegal instruction>
	.word 0x83a289e6  ! 250: FDIVq	dis not found

	.word 0xc28804a0  ! 251: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0xc27fe001  ! 252: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x90d9c00b  ! 253: SMULcc_R	smulcc 	%r7, %r11, %r8
	.word 0x8d90244a  ! 254: WRPR_PSTATE_I	wrpr	%r0, 0x044a, %pstate
	.word 0x9a79c008  ! 255: SDIV_R	sdiv 	%r7, %r8, %r13
	.word 0x81982b00  ! 256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b00, %hpstate
	.word 0x99d02031  ! 257: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x8dd0001e  ! 259: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 261: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x819828c2  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c2, %hpstate
	.word 0x3a800001  ! 263: BCC	bcc,a	<label_0x1>
	.word 0x8c81c006  ! 264: ADDcc_R	addcc 	%r7, %r6, %r6
	.word 0x85a000c8  ! 265: FNEGd	fnegd	%f8, %f2
	.word 0x95d02033  ! 266: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x8d902ac7  ! 267: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
	.word 0x81982b1b  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1b, %hpstate
	.word 0x81982117  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0117, %hpstate
	.word 0x8da01a65  ! 270: FqTOi	fqtoi	
	mov 0x35, %r30
	.word 0x85d0001e  ! 271: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x3a800001  ! 272: BCC	bcc,a	<label_0x1>
	.word 0x8d9020d7  ! 273: WRPR_PSTATE_I	wrpr	%r0, 0x00d7, %pstate
	mov 0x35, %r30
	.word 0x97d0001e  ! 274: Tcc_R	tge	icc_or_xcc, %r0 + %r30
DS_20:
	.word 0x34800001  ! 276: BG	bg,a	<label_0x1>
	.word 0xd9322001  ! 276: STQF_I	-	%f12, [0x0001, %r8]
	.word 0x97458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x91a00544  ! 276: FSQRTd	fsqrt	
	.word 0x9bd02031  ! 277: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x81982d13  ! 278: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0x8d902a0b  ! 279: WRPR_PSTATE_I	wrpr	%r0, 0x0a0b, %pstate
	.word 0xd09fc020  ! 280: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0x8d802000  ! 281: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9020d7  ! 282: WRPR_PSTATE_I	wrpr	%r0, 0x00d7, %pstate
	.word 0xd0800c40  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r8
	.word 0xd09fe001  ! 284: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	.word 0x9c6b4004  ! 285: UDIVX_R	udivx 	%r13, %r4, %r14
	.word 0x8d902213  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x0213, %pstate
	.word 0x8d802004  ! 287: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902699  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0699, %pstate
	.word 0xdc07e001  ! 289: LDUW_I	lduw	[%r31 + 0x0001], %r14
	.word 0x8d902a1d  ! 290: WRPR_PSTATE_I	wrpr	%r0, 0x0a1d, %pstate
	.word 0x91514000  ! 291: RDPR_TBA	rdpr	%tba, %r8
	.word 0xd0c80e60  ! 292: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0x88d3a001  ! 293: UMULcc_I	umulcc 	%r14, 0x0001, %r4
	mov 0x32, %r30
	.word 0x95d0001e  ! 294: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x97d0001e  ! 295: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8d902485  ! 296: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0x9d500000  ! 297: RDPR_TPC	rdpr	%tpc, %r14
	.word 0xdc900e40  ! 298: LDUHA_R	lduha	[%r0, %r0] 0x72, %r14
	.word 0x824ae001  ! 299: MULX_I	mulx 	%r11, 0x0001, %r1
	.word 0x93494000  ! 300: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x8d802000  ! 301: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3a700001  ! 302: BPCC	<illegal instruction>
	.word 0x8d90209f  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x009f, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2a700001  ! 305: BPCS	<illegal instruction>
	.word 0xd28fe030  ! 306: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0x8d902e89  ! 307: WRPR_PSTATE_I	wrpr	%r0, 0x0e89, %pstate
	mov 0x32, %r30
	.word 0x95d0001e  ! 308: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 309: BG	bg,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d9028c6  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x08c6, %pstate
	.word 0x97500000  ! 312: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x9483a001  ! 313: ADDcc_I	addcc 	%r14, 0x0001, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd427c004  ! 315: STW_R	stw	%r10, [%r31 + %r4]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97d02032  ! 317: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x9ba0056a  ! 318: FSQRTq	fsqrt	
	.word 0x85a3cdc7  ! 319: FdMULq	fdmulq	
	mov 0x35, %r30
	.word 0x85d0001e  ! 320: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x89a000c7  ! 322: FNEGd	fnegd	%f38, %f4
	.word 0xc81fc000  ! 323: LDD_R	ldd	[%r31 + %r0], %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802080  ! 325: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x2c700001  ! 326: BPNEG	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982ec3  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0xc917c000  ! 329: LDQF_R	-	[%r31, %r0], %f4
	.word 0x8d902c80  ! 330: WRPR_PSTATE_I	wrpr	%r0, 0x0c80, %pstate
	.word 0xc8dfe020  ! 331: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r4
DS_21:
	.word 0x22800001  ! 333: BE	be,a	<label_0x1>
	.word 0xc930800b  ! 333: STQF_R	-	%f4, [%r11, %r2]
	.word 0x97458000  ! 332: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d902c1f  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x0c1f, %pstate
	.word 0x884b6001  ! 334: MULX_I	mulx 	%r13, 0x0001, %r4
	.word 0x93a14d25  ! 335: FsMULd	fsmuld	%f5, %f36, %f40
	.word 0x8198245f  ! 336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
	.word 0x84826001  ! 337: ADDcc_I	addcc 	%r9, 0x0001, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93d02034  ! 339: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xc4bfc025  ! 340: STDA_R	stda	%r2, [%r31 + %r5] 0x01
	.word 0x8d9024d1  ! 341: WRPR_PSTATE_I	wrpr	%r0, 0x04d1, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x8dd0001e  ! 343: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc5e7c025  ! 344: CASA_I	casa	[%r31] 0x 1, %r5, %r2
	.word 0x87802004  ! 345: WRASI_I	wr	%r0, 0x0004, %asi
DS_22:
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb0830a  ! 346: ALLIGNADDRESS	alignaddr	%r2, %r10, %r15
	mov 0x31, %r30
	.word 0x9bd0001e  ! 347: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x89d0001e  ! 348: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 349: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xde1fc000  ! 350: LDD_R	ldd	[%r31 + %r0], %r15
	.word 0x82022001  ! 351: ADD_I	add 	%r8, 0x0001, %r1
	.word 0x8d90261d  ! 352: WRPR_PSTATE_I	wrpr	%r0, 0x061d, %pstate
	.word 0x87802004  ! 353: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x97d02032  ! 354: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x8d902e5d  ! 355: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99d02034  ! 357: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 358: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9fd02032  ! 359: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0xc22fc00a  ! 360: STB_R	stb	%r1, [%r31 + %r10]
	.word 0x38700001  ! 361: BPGU	<illegal instruction>
	.word 0x8d902084  ! 362: WRPR_PSTATE_I	wrpr	%r0, 0x0084, %pstate
	.word 0xc227c00a  ! 363: STW_R	stw	%r1, [%r31 + %r10]
	.word 0xc21fe001  ! 364: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0x81a0056a  ! 365: FSQRTq	fsqrt	
	.word 0x20700001  ! 366: BPN	<illegal instruction>
	.word 0x8d9020c0  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x00c0, %pstate
	.word 0x8e79e001  ! 368: SDIV_I	sdiv 	%r7, 0x0001, %r7
	.word 0x95508000  ! 369: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x87802004  ! 370: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9fa3c9e4  ! 371: FDIVq	dis not found

	mov 0x31, %r30
	.word 0x85d0001e  ! 372: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xdedfe010  ! 373: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r15
	.word 0x8d902c4b  ! 374: WRPR_PSTATE_I	wrpr	%r0, 0x0c4b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x916b6001  ! 376: SDIVX_I	sdivx	%r13, 0x0001, %r8
	.word 0x8c48000a  ! 377: MULX_R	mulx 	%r0, %r10, %r6
	.word 0x3e800001  ! 378: BVC	bvc,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x36800001  ! 380: BGE	bge,a	<label_0x1>
	.word 0xcde7c02a  ! 381: CASA_I	casa	[%r31] 0x 1, %r10, %r6
	.word 0x8ec0a001  ! 382: ADDCcc_I	addccc 	%r2, 0x0001, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x9a82e001  ! 384: ADDcc_I	addcc 	%r11, 0x0001, %r13
	.word 0x8d802000  ! 385: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x30800001  ! 386: BA	ba,a	<label_0x1>
DS_23:
	.word 0x34800001  ! 388: BG	bg,a	<label_0x1>
	.word 0xc9306001  ! 388: STQF_I	-	%f4, [0x0001, %r1]
	.word 0x8f458000  ! 387: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x87802080  ! 388: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xcecfe030  ! 389: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r7
	.word 0x8fa01a66  ! 390: FqTOi	fqtoi	
DS_24:
	.word 0x32800001  ! 392: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb08306  ! 391: ALLIGNADDRESS	alignaddr	%r2, %r6, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdb27c006  ! 393: STF_R	st	%f13, [%r6, %r31]
	.word 0x89a24d29  ! 394: FsMULd	fsmuld	%f9, %f40, %f4
	.word 0x32800001  ! 395: BNE	bne,a	<label_0x1>
	.word 0x81d02033  ! 396: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x20800001  ! 397: BN	bn,a	<label_0x1>
	.word 0x9dd02031  ! 398: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802016  ! 400: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802000  ! 401: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 402: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8e528001  ! 403: UMUL_R	umul 	%r10, %r1, %r7
	.word 0xcebfc021  ! 404: STDA_R	stda	%r7, [%r31 + %r1] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
DS_25:
	.word 0x34800001  ! 407: BG	bg,a	<label_0x1>
	.word 0xc132a001  ! 407: STQF_I	-	%f0, [0x0001, %r10]
	.word 0x8d458000  ! 406: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc8008a0  ! 407: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	mov 0x35, %r30
	.word 0x9bd0001e  ! 408: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x87d0001e  ! 409: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x99a389e6  ! 410: FDIVq	dis not found

DS_26:
	.word 0x32800001  ! 412: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb10304  ! 411: ALLIGNADDRESS	alignaddr	%r4, %r4, %r13
	.word 0x91d02035  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xdad7e000  ! 413: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0x81982b1f  ! 414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1f, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
DS_27:
	.word 0x20800001  ! 417: BN	bn,a	<label_0x1>
	.word 0xd733400d  ! 417: STQF_R	-	%f11, [%r13, %r13]
	.word 0x9f458000  ! 416: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x20700001  ! 417: BPN	<illegal instruction>
	.word 0xde8008a0  ! 418: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d802004  ! 419: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982d56  ! 420: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d56, %hpstate
	.word 0x87d02030  ! 421: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xde8008a0  ! 422: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x81982cdd  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdd, %hpstate
	.word 0x85d02033  ! 424: Tcc_I	tle	icc_or_xcc, %r0 + 51
DS_28:
	.word 0x32800001  ! 426: BNE	bne,a	<label_0x1>
	.word 0xdf32a001  ! 426: STQF_I	-	%f15, [0x0001, %r10]
	.word 0x89458000  ! 425: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc82fc00d  ! 426: STB_R	stb	%r4, [%r31 + %r13]
DS_29:
	.word 0x22800001  ! 428: BE	be,a	<label_0x1>
	.word 0xd733c005  ! 428: STQF_R	-	%f11, [%r5, %r15]
	.word 0x81458000  ! 427: RD_SOFTINT_REG	stbar
	ta	T_CHANGE_PRIV	! macro
	.word 0x87d02035  ! 429: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x81982482  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0482, %hpstate
	.word 0x8d902c9f  ! 431: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0x9da000cb  ! 432: FNEGd	fnegd	%f42, %f14
	.word 0x9fa289a8  ! 433: FDIVs	fdivs	%f10, %f8, %f15
	.word 0xde47e001  ! 434: LDSW_I	ldsw	[%r31 + 0x0001], %r15
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982058  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0058, %hpstate
	.word 0xde4fe001  ! 437: LDSB_I	ldsb	[%r31 + 0x0001], %r15
	.word 0x8d902203  ! 438: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0xdec7e020  ! 439: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r15
	.word 0x81982e8e  ! 440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
	.word 0x9ed2a001  ! 441: UMULcc_I	umulcc 	%r10, 0x0001, %r15
	.word 0x8e52400e  ! 442: UMUL_R	umul 	%r9, %r14, %r7
DS_30:
	.word 0x34800001  ! 444: BG	bg,a	<label_0x1>
	illtrap
	.word 0x97b1c307  ! 443: ALLIGNADDRESS	alignaddr	%r7, %r7, %r11
	.word 0xd68008a0  ! 444: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x819822c6  ! 445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c6, %hpstate
	.word 0x81982bc3  ! 446: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc3, %hpstate
	.word 0x83a2c9af  ! 447: FDIVs	fdivs	%f11, %f15, %f1
DS_31:
	.word 0x34800001  ! 449: BG	bg,a	<label_0x1>
	.word 0xc333a001  ! 449: STQF_I	-	%f1, [0x0001, %r14]
	.word 0x93458000  ! 448: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x81982759  ! 449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0759, %hpstate
	.word 0x36800001  ! 450: BGE	bge,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802016  ! 452: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902a48  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x0a48, %pstate
	.word 0x8d802000  ! 454: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x30700001  ! 455: BPA	<illegal instruction>
	.word 0x8d90280b  ! 456: WRPR_PSTATE_I	wrpr	%r0, 0x080b, %pstate
	.word 0x8d90264e  ! 457: WRPR_PSTATE_I	wrpr	%r0, 0x064e, %pstate
	.word 0x83d02031  ! 458: Tcc_I	te	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x9fd0001e  ! 459: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x87802004  ! 461: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x89d02032  ! 462: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0xd337c00f  ! 463: STQF_R	-	%f9, [%r15, %r31]
	.word 0x844b0004  ! 464: MULX_R	mulx 	%r12, %r4, %r2
	.word 0x819825d1  ! 465: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d1, %hpstate
	mov 0x34, %r30
	.word 0x85d0001e  ! 466: Tcc_R	tle	icc_or_xcc, %r0 + %r30
DS_32:
	.word 0x20800001  ! 468: BN	bn,a	<label_0x1>
	.word 0xc332e001  ! 468: STQF_I	-	%f1, [0x0001, %r11]
	.word 0x93458000  ! 467: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d9028db  ! 468: WRPR_PSTATE_I	wrpr	%r0, 0x08db, %pstate
	.word 0x9bd02030  ! 469: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x8198279b  ! 470: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079b, %hpstate
	.word 0x24700001  ! 471: BPLE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8ba10dc0  ! 473: FdMULq	fdmulq	
	.word 0x8d9024d0  ! 474: WRPR_PSTATE_I	wrpr	%r0, 0x04d0, %pstate
	.word 0x8d902c85  ! 475: WRPR_PSTATE_I	wrpr	%r0, 0x0c85, %pstate
	.word 0x8d9024cd  ! 476: WRPR_PSTATE_I	wrpr	%r0, 0x04cd, %pstate
	.word 0x81982144  ! 477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0144, %hpstate
	.word 0x8d902c54  ! 478: WRPR_PSTATE_I	wrpr	%r0, 0x0c54, %pstate
	.word 0xca5fe001  ! 479: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x8d9022d6  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x02d6, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xca27e001  ! 482: STW_I	stw	%r5, [%r31 + 0x0001]
	.word 0x8d902447  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0447, %pstate
	.word 0x81982852  ! 484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
	.word 0x84c0a001  ! 485: ADDCcc_I	addccc 	%r2, 0x0001, %r2
	.word 0x8d902489  ! 486: WRPR_PSTATE_I	wrpr	%r0, 0x0489, %pstate
	.word 0xc457e001  ! 487: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8ba0056d  ! 489: FSQRTq	fsqrt	
	.word 0x81982789  ! 490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0789, %hpstate
	.word 0xca880e80  ! 491: LDUBA_R	lduba	[%r0, %r0] 0x74, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95d02030  ! 493: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0xcb37c00d  ! 494: STQF_R	-	%f5, [%r13, %r31]
	.word 0x85a00567  ! 495: FSQRTq	fsqrt	
	.word 0x87802089  ! 496: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc4800c00  ! 499: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a349a4  ! 501: FDIVs	fdivs	%f13, %f4, %f3
	.word 0x864ae001  ! 502: MULX_I	mulx 	%r11, 0x0001, %r3
	.word 0x8e7b800c  ! 503: SDIV_R	sdiv 	%r14, %r12, %r7
	.word 0x9350c000  ! 504: RDPR_TT	rdpr	%tt, %r9
	mov 0x35, %r30
	.word 0x97d0001e  ! 505: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x90782001  ! 506: SDIV_I	sdiv 	%r0, 0x0001, %r8
	.word 0x9ba01a61  ! 507: FqTOi	fqtoi	
	.word 0x906b800c  ! 508: UDIVX_R	udivx 	%r14, %r12, %r8
	.word 0x9ad2e001  ! 509: UMULcc_I	umulcc 	%r11, 0x0001, %r13
	.word 0x8198279d  ! 510: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079d, %hpstate
	.word 0x91a01a6a  ! 511: FqTOi	fqtoi	
	.word 0xd09fe001  ! 512: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 514: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87a000cb  ! 515: FNEGd	fnegd	%f42, %f34
	.word 0x844a4009  ! 516: MULX_R	mulx 	%r9, %r9, %r2
	.word 0xc48008a0  ! 517: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc48fe010  ! 519: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	.word 0xc537c009  ! 520: STQF_R	-	%f2, [%r9, %r31]
	.word 0x3a800001  ! 521: BCC	bcc,a	<label_0x1>
	.word 0x99d02035  ! 522: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0xc48804a0  ! 523: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	mov 0x32, %r30
	.word 0x9dd0001e  ! 524: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d902a51  ! 525: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0x8cd9800d  ! 526: SMULcc_R	smulcc 	%r6, %r13, %r6
DS_33:
	.word 0x20800001  ! 528: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb1830b  ! 527: ALLIGNADDRESS	alignaddr	%r6, %r11, %r7
	.word 0x81982341  ! 528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0341, %hpstate
	mov 0x30, %r30
	.word 0x91d0001e  ! 529: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198270f  ! 530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0x87494000  ! 531: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xc6800b00  ! 532: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r3
	.word 0x96814004  ! 533: ADDcc_R	addcc 	%r5, %r4, %r11
	.word 0x82806001  ! 534: ADDcc_I	addcc 	%r1, 0x0001, %r1
	.word 0x2c700001  ! 535: BPNEG	<illegal instruction>
	.word 0x8d802004  ! 536: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x38700001  ! 537: BPGU	<illegal instruction>
	.word 0x8d902690  ! 538: WRPR_PSTATE_I	wrpr	%r0, 0x0690, %pstate
	.word 0x85a00565  ! 539: FSQRTq	fsqrt	
	.word 0x81982949  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0949, %hpstate
DS_34:
	.word 0x20800001  ! 542: BN	bn,a	<label_0x1>
	.word 0xc131e001  ! 542: STQF_I	-	%f0, [0x0001, %r7]
	.word 0x95458000  ! 541: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd41fc000  ! 542: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x84c16001  ! 543: ADDCcc_I	addccc 	%r5, 0x0001, %r2
DS_35:
	.word 0x34800001  ! 545: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b1c309  ! 544: ALLIGNADDRESS	alignaddr	%r7, %r9, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd4c804a0  ! 546: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x87802004  ! 547: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x33, %r30
	.word 0x83d0001e  ! 548: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 549: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x36700001  ! 550: BPGE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x97a10d20  ! 552: FsMULd	fsmuld	%f4, %f0, %f42
	.word 0x8d902092  ! 553: WRPR_PSTATE_I	wrpr	%r0, 0x0092, %pstate
	.word 0xd64fc000  ! 554: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0x936b0006  ! 555: SDIVX_R	sdivx	%r12, %r6, %r9
	.word 0x83d02030  ! 556: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d9022c4  ! 557: WRPR_PSTATE_I	wrpr	%r0, 0x02c4, %pstate
	.word 0xd297e000  ! 558: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0xd2800ba0  ! 559: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
	.word 0x8d902e0a  ! 560: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
	.word 0x9ad26001  ! 561: UMULcc_I	umulcc 	%r9, 0x0001, %r13
DS_36:
	.word 0x34800001  ! 563: BG	bg,a	<label_0x1>
	.word 0xd931000d  ! 563: STQF_R	-	%f12, [%r13, %r4]
	.word 0x93458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8f692001  ! 563: SDIVX_I	sdivx	%r4, 0x0001, %r7
	.word 0xceffc02d  ! 564: SWAPA_R	swapa	%r7, [%r31 + %r13] 0x01
	.word 0xce800c00  ! 565: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r7
	.word 0x81982bdd  ! 566: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdd, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 568: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce9fe001  ! 569: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x2a800001  ! 571: BCS	bcs,a	<label_0x1>
	.word 0xce8008a0  ! 572: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x9269c003  ! 573: UDIVX_R	udivx 	%r7, %r3, %r9
	.word 0x9481a001  ! 574: ADDcc_I	addcc 	%r6, 0x0001, %r10
	.word 0x8d902c46  ! 575: WRPR_PSTATE_I	wrpr	%r0, 0x0c46, %pstate
DS_37:
	.word 0x32800001  ! 577: BNE	bne,a	<label_0x1>
	.word 0xdb312001  ! 577: STQF_I	-	%f13, [0x0001, %r4]
	.word 0x93458000  ! 576: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x87802088  ! 577: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902048  ! 578: WRPR_PSTATE_I	wrpr	%r0, 0x0048, %pstate
	mov 0x31, %r30
	.word 0x83d0001e  ! 579: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9ba18d20  ! 580: FsMULd	fsmuld	%f6, %f0, %f44
	ta	T_CHANGE_PRIV	! macro
	.word 0xda8008a0  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x956a4008  ! 583: SDIVX_R	sdivx	%r9, %r8, %r10
	.word 0x8d902ac6  ! 584: WRPR_PSTATE_I	wrpr	%r0, 0x0ac6, %pstate
	.word 0xd4800c60  ! 585: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
	.word 0x82810005  ! 586: ADDcc_R	addcc 	%r4, %r5, %r1
	.word 0x8d802004  ! 587: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902a41  ! 589: WRPR_PSTATE_I	wrpr	%r0, 0x0a41, %pstate
	.word 0xc28fe030  ! 590: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	.word 0x8dd02034  ! 591: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902495  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0x85a3cd24  ! 594: FsMULd	fsmuld	%f15, %f4, %f2
	.word 0x87802004  ! 595: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2c800001  ! 596: BNEG	bneg,a	<label_0x1>
	mov 0x33, %r30
	.word 0x87d0001e  ! 597: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc49004a0  ! 598: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x87802004  ! 599: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 600: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4c804a0  ! 601: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0xc4ffc024  ! 602: SWAPA_R	swapa	%r2, [%r31 + %r4] 0x01
	.word 0x9d51c000  ! 603: RDPR_TL	rdpr	%tl, %r14
	.word 0x8478c000  ! 604: SDIV_R	sdiv 	%r3, %r0, %r2
	.word 0x87802004  ! 605: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x34, %r30
	.word 0x87d0001e  ! 606: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a149c3  ! 608: FDIVd	fdivd	%f36, %f34, %f42
	.word 0x8d802000  ! 609: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
DS_38:
	.word 0x20800001  ! 612: BN	bn,a	<label_0x1>
	.word 0xc1312001  ! 612: STQF_I	-	%f0, [0x0001, %r4]
	.word 0x91458000  ! 611: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d802000  ! 612: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93a3c9ad  ! 614: FDIVs	fdivs	%f15, %f13, %f9
	.word 0x8d90284b  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x084b, %pstate
	.word 0x8d902a4e  ! 616: WRPR_PSTATE_I	wrpr	%r0, 0x0a4e, %pstate
DS_39:
	.word 0x32800001  ! 618: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x99b04309  ! 617: ALLIGNADDRESS	alignaddr	%r1, %r9, %r12
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x30, %r30
	.word 0x8dd0001e  ! 619: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd88804a0  ! 620: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x8d802004  ! 621: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81a00545  ! 622: FSQRTd	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc127e001  ! 624: STF_I	st	%f0, [0x0001, %r31]
	.word 0xc01fe001  ! 625: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x81982f88  ! 626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
	.word 0x34700001  ! 627: BPG	<illegal instruction>
	mov 0x30, %r30
	.word 0x97d0001e  ! 628: Tcc_R	tge	icc_or_xcc, %r0 + %r30
DS_40:
	.word 0x32800001  ! 630: BNE	bne,a	<label_0x1>
	.word 0xc7326001  ! 630: STQF_I	-	%f3, [0x0001, %r9]
	.word 0x8d458000  ! 629: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xccdfe030  ! 630: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
DS_41:
	.word 0x34800001  ! 632: BG	bg,a	<label_0x1>
	.word 0xd7322001  ! 632: STQF_I	-	%f11, [0x0001, %r8]
	.word 0x93458000  ! 631: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x81982ddf  ! 632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddf, %hpstate
	.word 0x81982f0a  ! 633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0a, %hpstate
	.word 0x8678c003  ! 634: SDIV_R	sdiv 	%r3, %r3, %r3
	mov 0x35, %r30
	.word 0x89d0001e  ! 635: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x85d02034  ! 636: Tcc_I	tle	icc_or_xcc, %r0 + 52
DS_42:
	.word 0x20800001  ! 638: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db10305  ! 637: ALLIGNADDRESS	alignaddr	%r4, %r5, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81d02032  ! 639: Tcc_I	tn	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc8008a0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x9351c000  ! 642: RDPR_TL	rdpr	%tl, %r9
	.word 0xd2800bc0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r9
	.word 0x8d802000  ! 644: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd28fe010  ! 645: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0xd25fc000  ! 646: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd33fc005  ! 647: STDF_R	std	%f9, [%r5, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x20800001  ! 649: BN	bn,a	<label_0x1>
	.word 0x8d902243  ! 650: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0x98680005  ! 651: UDIVX_R	udivx 	%r0, %r5, %r12
	.word 0x81a24dcc  ! 652: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a01a66  ! 654: FqTOi	fqtoi	
	.word 0x8d902a55  ! 655: WRPR_PSTATE_I	wrpr	%r0, 0x0a55, %pstate
	.word 0x8d9020da  ! 656: WRPR_PSTATE_I	wrpr	%r0, 0x00da, %pstate
	mov 0x34, %r30
	.word 0x9fd0001e  ! 657: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902a80  ! 658: WRPR_PSTATE_I	wrpr	%r0, 0x0a80, %pstate
	.word 0x867b8002  ! 659: SDIV_R	sdiv 	%r14, %r2, %r3
	.word 0x93d02033  ! 660: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87802014  ! 661: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x38800001  ! 662: BGU	bgu,a	<label_0x1>
	.word 0x8d902a9d  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x0a9d, %pstate
	.word 0xc67fe001  ! 664: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x83a0056c  ! 665: FSQRTq	fsqrt	
	.word 0x85d02031  ! 666: Tcc_I	tle	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 668: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198229d  ! 669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
	.word 0x8d902acb  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x0acb, %pstate
	.word 0xc28008a0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x93a209c1  ! 672: FDIVd	fdivd	%f8, %f32, %f40
	.word 0xd21fe001  ! 673: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x81982b93  ! 674: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b93, %hpstate
	.word 0x8d902243  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0x9b508000  ! 676: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x8198254f  ! 677: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054f, %hpstate
	.word 0xda800aa0  ! 678: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r13
DS_43:
	.word 0x32800001  ! 680: BNE	bne,a	<label_0x1>
	.word 0xc130e001  ! 680: STQF_I	-	%f0, [0x0001, %r3]
	.word 0x99458000  ! 679: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x91a000cf  ! 680: FNEGd	fnegd	%f46, %f8
	.word 0x8198240c  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040c, %hpstate
	.word 0x8d802000  ! 682: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd0c804a0  ! 683: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0xd127c00f  ! 684: STF_R	st	%f8, [%r15, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a01a6a  ! 686: FqTOi	fqtoi	
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x8fd0001e  ! 688: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc6c804a0  ! 689: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x9cd36001  ! 690: UMULcc_I	umulcc 	%r13, 0x0001, %r14
	.word 0xdc8804a0  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x25, %r14
	.word 0xdc8fe010  ! 692: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r14
	.word 0x8d90225b  ! 693: WRPR_PSTATE_I	wrpr	%r0, 0x025b, %pstate
	.word 0xdcd004a0  ! 694: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	.word 0x9283000f  ! 695: ADDcc_R	addcc 	%r12, %r15, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x97d02030  ! 697: Tcc_I	tge	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902e9a  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x0e9a, %pstate
	.word 0x81982602  ! 700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0602, %hpstate
DS_44:
	.word 0x20800001  ! 702: BN	bn,a	<label_0x1>
	.word 0xd931400b  ! 702: STQF_R	-	%f12, [%r11, %r5]
	.word 0x81458000  ! 701: RD_SOFTINT_REG	stbar
DS_45:
	.word 0x32800001  ! 703: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b20309  ! 702: ALLIGNADDRESS	alignaddr	%r8, %r9, %r9
	.word 0x95d02034  ! 703: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0xd22fe001  ! 704: STB_I	stb	%r9, [%r31 + 0x0001]
	.word 0xd28008a0  ! 705: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d902e53  ! 706: WRPR_PSTATE_I	wrpr	%r0, 0x0e53, %pstate
	.word 0xd257c000  ! 707: LDSH_R	ldsh	[%r31 + %r0], %r9
	mov 0x33, %r30
	.word 0x81d0001e  ! 708: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xd207e001  ! 709: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd3e7c029  ! 710: CASA_I	casa	[%r31] 0x 1, %r9, %r9
	.word 0x819820da  ! 711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00da, %hpstate
	.word 0x8fd02031  ! 712: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0x8a83400c  ! 713: ADDcc_R	addcc 	%r13, %r12, %r5
	.word 0x9ba309cf  ! 714: FDIVd	fdivd	%f12, %f46, %f44
	.word 0x9a68e001  ! 715: UDIVX_I	udivx 	%r3, 0x0001, %r13
	.word 0xda8804a0  ! 716: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x81982f8c  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8c, %hpstate
	.word 0x8d90285f  ! 718: WRPR_PSTATE_I	wrpr	%r0, 0x085f, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdb27e001  ! 720: STF_I	st	%f13, [0x0001, %r31]
	.word 0xda8804a0  ! 721: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x28800001  ! 722: BLEU	bleu,a	<label_0x1>
	.word 0x8d90244d  ! 723: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0x8368a001  ! 724: SDIVX_I	sdivx	%r2, 0x0001, %r1
	.word 0x8b6ae001  ! 725: SDIVX_I	sdivx	%r11, 0x0001, %r5
	.word 0x819822dd  ! 726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dd, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x94d3e001  ! 728: UMULcc_I	umulcc 	%r15, 0x0001, %r10
	.word 0xd43fc00f  ! 729: STD_R	std	%r10, [%r31 + %r15]
	.word 0x81a049cc  ! 730: FDIVd	fdivd	%f32, %f12, %f0
	.word 0x8d9024c5  ! 731: WRPR_PSTATE_I	wrpr	%r0, 0x04c5, %pstate
	.word 0x9bd02032  ! 732: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x95a349e3  ! 733: FDIVq	dis not found

	.word 0x81982710  ! 734: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0710, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4d804a0  ! 736: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x81982a8f  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8f, %hpstate
	mov 0x33, %r30
	.word 0x85d0001e  ! 738: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x97a209ea  ! 739: FDIVq	dis not found

	.word 0x2e700001  ! 740: BPVS	<illegal instruction>
	.word 0xd69fe001  ! 741: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0xd69004a0  ! 742: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
DS_46:
	.word 0x20800001  ! 744: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db0c305  ! 743: ALLIGNADDRESS	alignaddr	%r3, %r5, %r6
	.word 0xcccfe020  ! 744: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r6
	.word 0x8d902e08  ! 745: WRPR_PSTATE_I	wrpr	%r0, 0x0e08, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802010  ! 747: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x26800001  ! 748: BL	bl,a	<label_0x1>
	.word 0xcd37e001  ! 749: STQF_I	-	%f6, [0x0001, %r31]
	.word 0x9c7ae001  ! 750: SDIV_I	sdiv 	%r11, 0x0001, %r14
DS_47:
	.word 0x32800001  ! 752: BNE	bne,a	<label_0x1>
	.word 0xc333c004  ! 752: STQF_R	-	%f1, [%r4, %r15]
	.word 0x9b458000  ! 751: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x95a289e3  ! 752: FDIVq	dis not found

	mov 0x32, %r30
	.word 0x9bd0001e  ! 753: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x9fd02031  ! 754: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0xd4c004a0  ! 755: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
DS_48:
	.word 0x20800001  ! 757: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb28306  ! 756: ALLIGNADDRESS	alignaddr	%r10, %r6, %r5
	.word 0x8d9020c1  ! 757: WRPR_PSTATE_I	wrpr	%r0, 0x00c1, %pstate
	.word 0xcaffc026  ! 758: SWAPA_R	swapa	%r5, [%r31 + %r6] 0x01
	.word 0x96812001  ! 759: ADDcc_I	addcc 	%r4, 0x0001, %r11
	mov 0x30, %r30
	.word 0x81d0001e  ! 760: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 761: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x93d0001e  ! 762: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8198201c  ! 763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001c, %hpstate
	.word 0xd657c000  ! 764: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0xd6c00e80  ! 765: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	.word 0xd67fe001  ! 766: SWAP_I	swap	%r11, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x89d0001e  ! 768: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 769: BNE	bne,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8e00a001  ! 771: ADD_I	add 	%r2, 0x0001, %r7
	.word 0x2e800001  ! 772: BVS	bvs,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x32, %r30
	.word 0x93d0001e  ! 774: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x95480000  ! 775: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
DS_49:
	.word 0x34800001  ! 777: BG	bg,a	<label_0x1>
	.word 0xc3302001  ! 777: STQF_I	-	%f1, [0x0001, %r0]
	.word 0x9f458000  ! 776: RD_SOFTINT_REG	rd	%softint, %r15
DS_50:
	.word 0x34800001  ! 778: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b28307  ! 777: ALLIGNADDRESS	alignaddr	%r10, %r7, %r9
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL0	! macro
DS_51:
	.word 0x32800001  ! 781: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb30306  ! 780: ALLIGNADDRESS	alignaddr	%r12, %r6, %r7
	.word 0x97a18d23  ! 781: FsMULd	fsmuld	%f6, %f34, %f42
	.word 0x93a3c9c5  ! 782: FDIVd	fdivd	%f46, %f36, %f40
	.word 0x81982988  ! 783: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0988, %hpstate
	.word 0x9d50c000  ! 784: RDPR_TT	rdpr	%tt, %r14
	.word 0x986be001  ! 785: UDIVX_I	udivx 	%r15, 0x0001, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd87fe001  ! 787: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0x8d802004  ! 788: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8da0cd2d  ! 789: FsMULd	fsmuld	%f3, %f44, %f6
	.word 0xccc7e030  ! 790: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	mov 0x32, %r30
	.word 0x83d0001e  ! 791: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcc8008a0  ! 795: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x93686001  ! 796: SDIVX_I	sdivx	%r1, 0x0001, %r9
	.word 0x8d802000  ! 797: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8bd02032  ! 798: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8a79c00b  ! 800: SDIV_R	sdiv 	%r7, %r11, %r5
	.word 0xca8008a0  ! 801: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
DS_52:
	.word 0x32800001  ! 803: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b0030d  ! 802: ALLIGNADDRESS	alignaddr	%r0, %r13, %r3
	.word 0x81982e5d  ! 803: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5d, %hpstate
	.word 0x8ba000c4  ! 804: FNEGd	fnegd	%f4, %f36
	.word 0x87802080  ! 805: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93d02031  ! 806: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xcb27e001  ! 807: STF_I	st	%f5, [0x0001, %r31]
	.word 0x8d802000  ! 808: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_53:
	.word 0x34800001  ! 810: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8bb30306  ! 809: ALLIGNADDRESS	alignaddr	%r12, %r6, %r5
	.word 0x8d902cd0  ! 810: WRPR_PSTATE_I	wrpr	%r0, 0x0cd0, %pstate
	.word 0x8d902610  ! 811: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0x9ba349ac  ! 812: FDIVs	fdivs	%f13, %f12, %f13
	.word 0x3a800001  ! 813: BCC	bcc,a	<label_0x1>
	.word 0x87802004  ! 814: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93a0054e  ! 815: FSQRTd	fsqrt	
	.word 0xd2800aa0  ! 816: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r9
DS_54:
	.word 0x34800001  ! 818: BG	bg,a	<label_0x1>
	.word 0xcf30a001  ! 818: STQF_I	-	%f7, [0x0001, %r2]
	.word 0x83458000  ! 817: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d902e1f  ! 818: WRPR_PSTATE_I	wrpr	%r0, 0x0e1f, %pstate
	mov 0x32, %r30
	.word 0x89d0001e  ! 819: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x82016001  ! 820: ADD_I	add 	%r5, 0x0001, %r1
	.word 0xc2ffc02e  ! 821: SWAPA_R	swapa	%r1, [%r31 + %r14] 0x01
	.word 0xc2d80e60  ! 822: LDXA_R	ldxa	[%r0, %r0] 0x73, %r1
	.word 0x97a2cd29  ! 823: FsMULd	fsmuld	%f11, %f40, %f42
	.word 0x90db0004  ! 824: SMULcc_R	smulcc 	%r12, %r4, %r8
	.word 0xd0d80e40  ! 825: LDXA_R	ldxa	[%r0, %r0] 0x72, %r8
	ta	T_CHANGE_HPRIV	! macro
DS_55:
	.word 0x20800001  ! 828: BN	bn,a	<label_0x1>
	.word 0xd930a001  ! 828: STQF_I	-	%f12, [0x0001, %r2]
	.word 0x8f458000  ! 827: RD_SOFTINT_REG	rd	%softint, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xce07c000  ! 829: LDUW_R	lduw	[%r31 + %r0], %r7
	mov 0x30, %r30
	.word 0x93d0001e  ! 830: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_56:
	.word 0x22800001  ! 832: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b38306  ! 831: ALLIGNADDRESS	alignaddr	%r14, %r6, %r10
	.word 0x9f50c000  ! 832: RDPR_TT	rdpr	%tt, %r15
	.word 0x3a700001  ! 833: BPCC	<illegal instruction>
	.word 0x9ed24004  ! 834: UMULcc_R	umulcc 	%r9, %r4, %r15
	.word 0x819826c0  ! 835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c0, %hpstate
	mov 0x32, %r30
	.word 0x9bd0001e  ! 836: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x32, %r30
	.word 0x8fd0001e  ! 838: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x93d0001e  ! 839: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_57:
	.word 0x22800001  ! 841: BE	be,a	<label_0x1>
	.word 0xc3300000  ! 841: STQF_R	-	%f1, [%r0, %r0]
	.word 0x93458000  ! 840: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x876a000a  ! 841: SDIVX_R	sdivx	%r8, %r10, %r3
	.word 0x904a800b  ! 842: MULX_R	mulx 	%r10, %r11, %r8
	.word 0x26700001  ! 843: BPL	<illegal instruction>
DS_58:
	.word 0x22800001  ! 845: BE	be,a	<label_0x1>
	.word 0xd931e001  ! 845: STQF_I	-	%f12, [0x0001, %r7]
	.word 0x8d458000  ! 844: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcd27e001  ! 845: STF_I	st	%f6, [0x0001, %r31]
	.word 0x8d802000  ! 846: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 848: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x34, %r30
	.word 0x87d0001e  ! 849: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xcc1fe001  ! 850: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982fc3  ! 851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc3, %hpstate
	.word 0x90822001  ! 852: ADDcc_I	addcc 	%r8, 0x0001, %r8
	.word 0xd137e001  ! 853: STQF_I	-	%f8, [0x0001, %r31]
	.word 0x81982d44  ! 854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
DS_59:
	.word 0x20800001  ! 856: BN	bn,a	<label_0x1>
	.word 0xcf30400c  ! 856: STQF_R	-	%f7, [%r12, %r1]
	.word 0x8f458000  ! 855: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x82782001  ! 856: SDIV_I	sdiv 	%r0, 0x0001, %r1
DS_60:
	.word 0x32800001  ! 858: BNE	bne,a	<label_0x1>
	.word 0xcd32e001  ! 858: STQF_I	-	%f6, [0x0001, %r11]
	.word 0x83458000  ! 857: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc29004a0  ! 858: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x8d90245a  ! 859: WRPR_PSTATE_I	wrpr	%r0, 0x045a, %pstate
	.word 0x8da18d25  ! 860: FsMULd	fsmuld	%f6, %f36, %f6
	.word 0x9950c000  ! 861: RDPR_TT	rdpr	%tt, %r12
	.word 0xd89fe001  ! 862: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xd897e020  ! 863: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x864b2001  ! 864: MULX_I	mulx 	%r12, 0x0001, %r3
	.word 0x87a00547  ! 865: FSQRTd	fsqrt	
	.word 0x87802016  ! 866: WRASI_I	wr	%r0, 0x0016, %asi
DS_61:
	.word 0x32800001  ! 868: BNE	bne,a	<label_0x1>
	.word 0xcb322001  ! 868: STQF_I	-	%f5, [0x0001, %r8]
	.word 0x8f458000  ! 867: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d902a92  ! 868: WRPR_PSTATE_I	wrpr	%r0, 0x0a92, %pstate
	.word 0x8d90245d  ! 869: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	mov 0x35, %r30
	.word 0x85d0001e  ! 870: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 871: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcf27e001  ! 872: STF_I	st	%f7, [0x0001, %r31]
	.word 0xce57c000  ! 873: LDSH_R	ldsh	[%r31 + %r0], %r7
DS_62:
	.word 0x22800001  ! 875: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b0030e  ! 874: ALLIGNADDRESS	alignaddr	%r0, %r14, %r11
	.word 0x8c7be001  ! 875: SDIV_I	sdiv 	%r15, 0x0001, %r6
	.word 0xccc80e80  ! 876: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r6
	.word 0x9b494000  ! 877: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x81982fda  ! 878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fda, %hpstate
DS_63:
	.word 0x34800001  ! 880: BG	bg,a	<label_0x1>
	.word 0xcb31e001  ! 880: STQF_I	-	%f5, [0x0001, %r7]
	.word 0x8b458000  ! 879: RD_SOFTINT_REG	rd	%softint, %r5
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87a0056e  ! 882: FSQRTq	fsqrt	
	.word 0x8198230c  ! 883: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030c, %hpstate
	.word 0x93a349a2  ! 884: FDIVs	fdivs	%f13, %f2, %f9
	.word 0x8d902442  ! 885: WRPR_PSTATE_I	wrpr	%r0, 0x0442, %pstate
	.word 0x9dd02034  ! 886: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xd23fe001  ! 887: STD_I	std	%r9, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982fc9  ! 889: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc9, %hpstate
	.word 0x88494006  ! 890: MULX_R	mulx 	%r5, %r6, %r4
	.word 0x8d802000  ! 891: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9bd02031  ! 892: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x8198279f  ! 893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0x8ba24dc8  ! 894: FdMULq	fdmulq	
	.word 0x8d9022d5  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x02d5, %pstate
	.word 0x8e7ba001  ! 896: SDIV_I	sdiv 	%r14, 0x0001, %r7
	.word 0x20800001  ! 897: BN	bn,a	<label_0x1>
	.word 0x99a00d25  ! 898: FsMULd	fsmuld	%f0, %f36, %f12
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
DS_64:
	.word 0x32800001  ! 902: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x91b00306  ! 901: ALLIGNADDRESS	alignaddr	%r0, %r6, %r8
	.word 0x81494000  ! 902: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0xc08008a0  ! 903: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x866ba001  ! 905: UDIVX_I	udivx 	%r14, 0x0001, %r3
	.word 0x81982f5b  ! 906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	.word 0x8d902a16  ! 907: WRPR_PSTATE_I	wrpr	%r0, 0x0a16, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
DS_65:
	.word 0x34800001  ! 910: BG	bg,a	<label_0x1>
	.word 0xd330c00b  ! 910: STQF_R	-	%f9, [%r11, %r3]
	.word 0x85458000  ! 909: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4d7e020  ! 910: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r2
	.word 0x8d802004  ! 911: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8198238d  ! 912: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038d, %hpstate
	mov 0x33, %r30
	.word 0x95d0001e  ! 913: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc48804a0  ! 914: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc5e7c02b  ! 915: CASA_I	casa	[%r31] 0x 1, %r11, %r2
	.word 0xc4cfe010  ! 916: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	.word 0x8d9024dc  ! 917: WRPR_PSTATE_I	wrpr	%r0, 0x04dc, %pstate
	.word 0x819822cb  ! 918: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cb, %hpstate
	.word 0x8d90260a  ! 919: WRPR_PSTATE_I	wrpr	%r0, 0x060a, %pstate
	.word 0x86c2a001  ! 920: ADDCcc_I	addccc 	%r10, 0x0001, %r3
	.word 0x81982958  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0958, %hpstate
	.word 0x8ad00002  ! 922: UMULcc_R	umulcc 	%r0, %r2, %r5
	.word 0xca3fc002  ! 923: STD_R	std	%r5, [%r31 + %r2]
	.word 0x8d902649  ! 924: WRPR_PSTATE_I	wrpr	%r0, 0x0649, %pstate
	.word 0x8d902ecc  ! 925: WRPR_PSTATE_I	wrpr	%r0, 0x0ecc, %pstate
	.word 0x9b50c000  ! 926: RDPR_TT	rdpr	%tt, %r13
	.word 0x8079e001  ! 927: SDIV_I	sdiv 	%r7, 0x0001, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902083  ! 929: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
	.word 0x96002001  ! 930: ADD_I	add 	%r0, 0x0001, %r11
	.word 0xd6d80e80  ! 931: LDXA_R	ldxa	[%r0, %r0] 0x74, %r11
	.word 0x8d902c89  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x0c89, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x92500005  ! 934: UMUL_R	umul 	%r0, %r5, %r9
	.word 0xd2bfc025  ! 935: STDA_R	stda	%r9, [%r31 + %r5] 0x01
	.word 0x98d04003  ! 936: UMULcc_R	umulcc 	%r1, %r3, %r12
	.word 0x81982515  ! 937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0515, %hpstate
	.word 0x8198259e  ! 938: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
	.word 0x8198281b  ! 939: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0x8d802004  ! 940: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x86c3a001  ! 941: ADDCcc_I	addccc 	%r14, 0x0001, %r3
	.word 0x81982f83  ! 942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f83, %hpstate
	.word 0x8d902a54  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x0a54, %pstate
	.word 0xc627c003  ! 944: STW_R	stw	%r3, [%r31 + %r3]
	.word 0x807b0001  ! 945: SDIV_R	sdiv 	%r12, %r1, %r0
	.word 0xc0d804a0  ! 946: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x8d90244b  ! 947: WRPR_PSTATE_I	wrpr	%r0, 0x044b, %pstate
	.word 0x8d90288b  ! 948: WRPR_PSTATE_I	wrpr	%r0, 0x088b, %pstate
	.word 0x34800001  ! 949: BG	bg,a	<label_0x1>
	.word 0x8bd02031  ! 950: Tcc_I	tcs	icc_or_xcc, %r0 + 49
DS_66:
	.word 0x32800001  ! 952: BNE	bne,a	<label_0x1>
	.word 0xdd332001  ! 952: STQF_I	-	%f14, [0x0001, %r12]
	.word 0x9b458000  ! 951: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902011  ! 952: WRPR_PSTATE_I	wrpr	%r0, 0x0011, %pstate
	ta	T_CHANGE_HPRIV	! macro
	mov 0x33, %r30
	.word 0x81d0001e  ! 954: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 955: BPOS	bpos,a	<label_0x1>
	.word 0x3e800001  ! 956: BVC	bvc,a	<label_0x1>
	.word 0x8d9020de  ! 957: WRPR_PSTATE_I	wrpr	%r0, 0x00de, %pstate
	.word 0xdb97e001  ! 958: LDQFA_I	-	[%r31, 0x0001], %f13
	ta	T_CHANGE_PRIV	! macro
	.word 0xda57c000  ! 960: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x2e800001  ! 961: BVS	bvs,a	<label_0x1>
	.word 0xdad804a0  ! 962: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x8d802004  ! 963: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 964: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdaffc021  ! 965: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
	.word 0x81982092  ! 966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0092, %hpstate
DS_67:
	.word 0x34800001  ! 968: BG	bg,a	<label_0x1>
	.word 0xc333c002  ! 968: STQF_R	-	%f1, [%r2, %r15]
	.word 0x9b458000  ! 967: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x99a01a61  ! 968: FqTOi	fqtoi	
	.word 0x81982906  ! 969: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0906, %hpstate
	.word 0xd88008a0  ! 970: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81982f53  ! 971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f53, %hpstate
	.word 0xd8800c00  ! 972: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
	.word 0x89d02032  ! 973: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0x8fd02030  ! 974: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x8e6bc009  ! 975: UDIVX_R	udivx 	%r15, %r9, %r7
	.word 0x38800001  ! 976: BGU	bgu,a	<label_0x1>
	.word 0x8d902009  ! 977: WRPR_PSTATE_I	wrpr	%r0, 0x0009, %pstate
	.word 0x8d90220d  ! 978: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	.word 0x36700001  ! 979: BPGE	<illegal instruction>
	.word 0x8683c004  ! 980: ADDcc_R	addcc 	%r15, %r4, %r3
	.word 0x81982b4a  ! 981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4a, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x82d26001  ! 983: UMULcc_I	umulcc 	%r9, 0x0001, %r1
DS_68:
	.word 0x20800001  ! 985: BN	bn,a	<label_0x1>
	.word 0xcb326001  ! 985: STQF_I	-	%f5, [0x0001, %r9]
	.word 0x8f458000  ! 984: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x81982dc7  ! 985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	.word 0x8fa18d25  ! 986: FsMULd	fsmuld	%f6, %f36, %f38
	.word 0x819822d2  ! 987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d2, %hpstate
	.word 0xce37c005  ! 988: STH_R	sth	%r7, [%r31 + %r5]
	.word 0x96c32001  ! 989: ADDCcc_I	addccc 	%r12, 0x0001, %r11
	.word 0x81a20dc4  ! 990: FdMULq	fdmulq	
	.word 0x8080c006  ! 991: ADDcc_R	addcc 	%r3, %r6, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90228c  ! 993: WRPR_PSTATE_I	wrpr	%r0, 0x028c, %pstate
	.word 0x91d02031  ! 994: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81d02032  ! 995: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x9049c001  ! 996: MULX_R	mulx 	%r7, %r1, %r8
DS_69:
	.word 0x34800001  ! 998: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b10305  ! 997: ALLIGNADDRESS	alignaddr	%r4, %r5, %r8
DS_70:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b38304  ! 998: ALLIGNADDRESS	alignaddr	%r14, %r4, %r0
	.word 0x8198298a  ! 999: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
	.word 0x8dd02034  ! 1000: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x81982a95  ! 1001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
	.word 0x81982c12  ! 1002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c12, %hpstate
	.word 0x87802010  ! 1003: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8e49c000  ! 1004: MULX_R	mulx 	%r7, %r0, %r7
	.word 0x22700001  ! 1005: BPE	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x97d02033  ! 1007: Tcc_I	tge	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
DS_71:
	.word 0x34800001  ! 1010: BG	bg,a	<label_0x1>
	.word 0xc933800b  ! 1010: STQF_R	-	%f4, [%r11, %r14]
	.word 0x91458000  ! 1009: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x91a3c9cf  ! 1010: FDIVd	fdivd	%f46, %f46, %f8
	.word 0x89494000  ! 1011: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x8d802000  ! 1012: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902a59  ! 1014: WRPR_PSTATE_I	wrpr	%r0, 0x0a59, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8dfe010  ! 1016: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a3c9ca  ! 1018: FDIVd	fdivd	%f46, %f10, %f4
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982c4a  ! 1021: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
	.word 0x8449800d  ! 1022: MULX_R	mulx 	%r6, %r13, %r2
	.word 0x906be001  ! 1023: UDIVX_I	udivx 	%r15, 0x0001, %r8
	.word 0xd08008a0  ! 1024: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd077e001  ! 1025: STX_I	stx	%r8, [%r31 + 0x0001]
	.word 0xd07fe001  ! 1026: SWAP_I	swap	%r8, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85a149ec  ! 1029: FDIVq	dis not found

	.word 0x8d802004  ! 1030: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982581  ! 1031: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0581, %hpstate
	.word 0xc48804a0  ! 1032: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0x9b6aa001  ! 1033: SDIVX_I	sdivx	%r10, 0x0001, %r13
	.word 0x9d50c000  ! 1034: RDPR_TT	rdpr	%tt, %r14
	.word 0x8d902644  ! 1035: WRPR_PSTATE_I	wrpr	%r0, 0x0644, %pstate
	.word 0x8ba00566  ! 1036: FSQRTq	fsqrt	
	.word 0xca800c20  ! 1037: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r5
	.word 0x97d02031  ! 1038: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x89a249cc  ! 1039: FDIVd	fdivd	%f40, %f12, %f4
	.word 0x81982207  ! 1040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0207, %hpstate
DS_72:
	.word 0x34800001  ! 1042: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db00304  ! 1041: ALLIGNADDRESS	alignaddr	%r0, %r4, %r6
	.word 0x9dd02031  ! 1042: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x3e800001  ! 1043: BVC	bvc,a	<label_0x1>
DS_73:
	.word 0x34800001  ! 1045: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb2430f  ! 1044: ALLIGNADDRESS	alignaddr	%r9, %r15, %r15
	.word 0x9882c003  ! 1045: ADDcc_R	addcc 	%r11, %r3, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd89fc020  ! 1047: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xd88008a0  ! 1048: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x916ba001  ! 1049: SDIVX_I	sdivx	%r14, 0x0001, %r8
	.word 0x89d02033  ! 1050: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x847ae001  ! 1051: SDIV_I	sdiv 	%r11, 0x0001, %r2
	.word 0x87802004  ! 1052: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc537c003  ! 1054: STQF_R	-	%f2, [%r3, %r31]
	.word 0x81a149ad  ! 1055: FDIVs	fdivs	%f5, %f13, %f0
	mov 0x35, %r30
	.word 0x99d0001e  ! 1056: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d90284b  ! 1057: WRPR_PSTATE_I	wrpr	%r0, 0x084b, %pstate
	.word 0x8d9020cc  ! 1058: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0x81982b13  ! 1059: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
DS_74:
	.word 0x20800001  ! 1061: BN	bn,a	<label_0x1>
	.word 0xc1304007  ! 1061: STQF_R	-	%f0, [%r7, %r1]
	.word 0x89458000  ! 1060: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d802000  ! 1061: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc88fe000  ! 1062: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
	.word 0x87802004  ! 1063: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc88008a0  ! 1064: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x9ba01a66  ! 1065: FqTOi	fqtoi	
	.word 0xdb3fe001  ! 1066: STDF_I	std	%f13, [0x0001, %r31]
	.word 0x8d902a83  ! 1067: WRPR_PSTATE_I	wrpr	%r0, 0x0a83, %pstate
	.word 0x87802004  ! 1068: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xda8008a0  ! 1069: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d90285e  ! 1070: WRPR_PSTATE_I	wrpr	%r0, 0x085e, %pstate
	.word 0x80c3a001  ! 1071: ADDCcc_I	addccc 	%r14, 0x0001, %r0
	mov 0x31, %r30
	.word 0x89d0001e  ! 1072: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9b508000  ! 1073: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x8d90204e  ! 1074: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
	.word 0xdb27e001  ! 1075: STF_I	st	%f13, [0x0001, %r31]
	.word 0x9fa309c7  ! 1076: FDIVd	fdivd	%f12, %f38, %f46
	.word 0x8449c009  ! 1077: MULX_R	mulx 	%r7, %r9, %r2
	.word 0x8d9028d0  ! 1078: WRPR_PSTATE_I	wrpr	%r0, 0x08d0, %pstate
	.word 0x819822c7  ! 1079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0x87d02034  ! 1080: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x8c012001  ! 1081: ADD_I	add 	%r4, 0x0001, %r6
	.word 0x8d902096  ! 1082: WRPR_PSTATE_I	wrpr	%r0, 0x0096, %pstate
	.word 0x9750c000  ! 1083: RDPR_TT	rdpr	%tt, %r11
	.word 0x91514000  ! 1084: RDPR_TBA	rdpr	%tba, %r8
	.word 0x87802014  ! 1085: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982145  ! 1086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0145, %hpstate
	.word 0x9a53000c  ! 1087: UMUL_R	umul 	%r12, %r12, %r13
	.word 0x8d802004  ! 1088: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9022c5  ! 1089: WRPR_PSTATE_I	wrpr	%r0, 0x02c5, %pstate
	.word 0x8d802000  ! 1090: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90261e  ! 1091: WRPR_PSTATE_I	wrpr	%r0, 0x061e, %pstate
	mov 0x35, %r30
	.word 0x89d0001e  ! 1092: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x836a6001  ! 1093: SDIVX_I	sdivx	%r9, 0x0001, %r1
	.word 0x81982dcc  ! 1094: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcc, %hpstate
	.word 0xc21fc000  ! 1095: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x9c4a8004  ! 1096: MULX_R	mulx 	%r10, %r4, %r14
	mov 0x32, %r30
	.word 0x87d0001e  ! 1097: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d9020c5  ! 1098: WRPR_PSTATE_I	wrpr	%r0, 0x00c5, %pstate
	.word 0x8d902ccd  ! 1099: WRPR_PSTATE_I	wrpr	%r0, 0x0ccd, %pstate
	.word 0xdc8fe010  ! 1100: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r14
	.word 0x87802088  ! 1101: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9a79a001  ! 1102: SDIV_I	sdiv 	%r6, 0x0001, %r13
	.word 0x8d802000  ! 1103: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x8dd0001e  ! 1104: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xda47e001  ! 1105: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0x91a00561  ! 1106: FSQRTq	fsqrt	
	.word 0x819823d4  ! 1107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d4, %hpstate
	.word 0xd0d7e030  ! 1108: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	.word 0xd08008a0  ! 1109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d902e4a  ! 1110: WRPR_PSTATE_I	wrpr	%r0, 0x0e4a, %pstate
	.word 0x87d02033  ! 1111: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0xd01fe001  ! 1112: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x8b514000  ! 1113: RDPR_TBA	rdpr	%tba, %r5
	.word 0x927b8000  ! 1114: SDIV_R	sdiv 	%r14, %r0, %r9
	.word 0x876a4005  ! 1115: SDIVX_R	sdivx	%r9, %r5, %r3
	mov 0x30, %r30
	.word 0x9fd0001e  ! 1116: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9bd02030  ! 1117: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0xc68008a0  ! 1118: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	mov 0x35, %r30
	.word 0x95d0001e  ! 1119: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95a0056b  ! 1121: FSQRTq	fsqrt	
	.word 0x864a8009  ! 1122: MULX_R	mulx 	%r10, %r9, %r3
	.word 0x81982a10  ! 1123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a10, %hpstate
	.word 0x8d902646  ! 1124: WRPR_PSTATE_I	wrpr	%r0, 0x0646, %pstate
	.word 0xc68008a0  ! 1125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x9f50c000  ! 1126: RDPR_TT	rdpr	%tt, %r15
	.word 0x8198249a  ! 1127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049a, %hpstate
	.word 0x34800001  ! 1128: BG	bg,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95d02030  ! 1130: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x36700001  ! 1131: BPGE	<illegal instruction>
	.word 0x87802016  ! 1132: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xdec804a0  ! 1133: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r15
	.word 0x8d902600  ! 1134: WRPR_PSTATE_I	wrpr	%r0, 0x0600, %pstate
	.word 0x87802016  ! 1135: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x95a00561  ! 1136: FSQRTq	fsqrt	
	.word 0xd4c80e40  ! 1137: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
	.word 0x8d90289e  ! 1138: WRPR_PSTATE_I	wrpr	%r0, 0x089e, %pstate
	.word 0x8d902850  ! 1139: WRPR_PSTATE_I	wrpr	%r0, 0x0850, %pstate
	.word 0x8f508000  ! 1140: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x28800001  ! 1141: BLEU	bleu,a	<label_0x1>
	.word 0x807b8006  ! 1142: SDIV_R	sdiv 	%r14, %r6, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 1144: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc08008a0  ! 1145: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x9fa000ca  ! 1146: FNEGd	fnegd	%f10, %f46
	mov 0x35, %r30
	.word 0x8dd0001e  ! 1147: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 1150: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x32, %r30
	.word 0x8dd0001e  ! 1151: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 1152: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8da289ef  ! 1153: FDIVq	dis not found

	mov 0x35, %r30
	.word 0x91d0001e  ! 1154: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95d02031  ! 1155: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0xccffc02f  ! 1156: SWAPA_R	swapa	%r6, [%r31 + %r15] 0x01
	.word 0xccc7e010  ! 1157: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
DS_75:
	.word 0x32800001  ! 1159: BNE	bne,a	<label_0x1>
	.word 0xd932400c  ! 1159: STQF_R	-	%f12, [%r12, %r9]
	.word 0x85458000  ! 1158: RD_SOFTINT_REG	rd	%softint, %r2
	mov 0x33, %r30
	.word 0x83d0001e  ! 1159: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982c80  ! 1160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
	.word 0x8d802000  ! 1161: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc417e001  ! 1162: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0x9fa209ea  ! 1163: FDIVq	dis not found

	.word 0xdf27c00a  ! 1164: STF_R	st	%f15, [%r10, %r31]
	.word 0x96d14003  ! 1165: UMULcc_R	umulcc 	%r5, %r3, %r11
	.word 0xd60fe001  ! 1166: LDUB_I	ldub	[%r31 + 0x0001], %r11
	.word 0x9448c00e  ! 1167: MULX_R	mulx 	%r3, %r14, %r10
	.word 0xd4d80e80  ! 1168: LDXA_R	ldxa	[%r0, %r0] 0x74, %r10
	.word 0x8b6be001  ! 1169: SDIVX_I	sdivx	%r15, 0x0001, %r5
	.word 0x88492001  ! 1170: MULX_I	mulx 	%r4, 0x0001, %r4
	.word 0x8fa000c1  ! 1171: FNEGd	fnegd	%f32, %f38
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902c52  ! 1173: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
	.word 0x9e82c001  ! 1174: ADDcc_R	addcc 	%r11, %r1, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xded004a0  ! 1176: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02032  ! 1179: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0xde8008a0  ! 1181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
DS_76:
	.word 0x34800001  ! 1183: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b28300  ! 1182: ALLIGNADDRESS	alignaddr	%r10, %r0, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2c7e020  ! 1184: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	mov 0x35, %r30
	.word 0x89d0001e  ! 1185: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9b480000  ! 1186: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x2a700001  ! 1187: BPCS	<illegal instruction>
	.word 0x93a049a7  ! 1188: FDIVs	fdivs	%f1, %f7, %f9
	mov 0x33, %r30
	.word 0x83d0001e  ! 1189: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 1190: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902a8b  ! 1191: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
	.word 0x8ba000cd  ! 1192: FNEGd	fnegd	%f44, %f36
	.word 0x92c0a001  ! 1193: ADDCcc_I	addccc 	%r2, 0x0001, %r9
	.word 0x8dd02030  ! 1194: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x8d90281e  ! 1195: WRPR_PSTATE_I	wrpr	%r0, 0x081e, %pstate
	.word 0x82c12001  ! 1196: ADDCcc_I	addccc 	%r4, 0x0001, %r1
	mov 0x35, %r30
	.word 0x8bd0001e  ! 1197: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc297e000  ! 1198: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r1
	.word 0x8fa00544  ! 1199: FSQRTd	fsqrt	
	.word 0x8d902414  ! 1200: WRPR_PSTATE_I	wrpr	%r0, 0x0414, %pstate
	.word 0xced7e020  ! 1201: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	mov 0x35, %r30
	.word 0x83d0001e  ! 1202: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_77:
	.word 0x34800001  ! 1204: BG	bg,a	<label_0x1>
	.word 0xcf33a001  ! 1204: STQF_I	-	%f7, [0x0001, %r14]
	.word 0x8b458000  ! 1203: RD_SOFTINT_REG	rd	%softint, %r5
	mov 0x31, %r30
	.word 0x83d0001e  ! 1204: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90269f  ! 1205: WRPR_PSTATE_I	wrpr	%r0, 0x069f, %pstate
	.word 0x8d802000  ! 1206: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982803  ! 1207: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	.word 0x8000e001  ! 1208: ADD_I	add 	%r3, 0x0001, %r0
	.word 0x2c800001  ! 1209: BNEG	bneg,a	<label_0x1>
	.word 0x8350c000  ! 1210: RDPR_TT	rdpr	%tt, %r1
	.word 0x81982306  ! 1211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
	.word 0x26700001  ! 1212: BPL	<illegal instruction>
	.word 0x89508000  ! 1213: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xc89fc020  ! 1214: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
DS_78:
	.word 0x22800001  ! 1218: BE	be,a	<label_0x1>
	.word 0xc732a001  ! 1218: STQF_I	-	%f3, [0x0001, %r10]
	.word 0x99458000  ! 1217: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x3a800001  ! 1218: BCC	bcc,a	<label_0x1>
	.word 0x99d02032  ! 1219: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0x8d902483  ! 1220: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0xd8d7e020  ! 1221: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0x81982bc5  ! 1222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc5, %hpstate
	.word 0x8d9028db  ! 1223: WRPR_PSTATE_I	wrpr	%r0, 0x08db, %pstate
	mov 0x35, %r30
	.word 0x87d0001e  ! 1224: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x81982796  ! 1225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0796, %hpstate
	.word 0x8fd02033  ! 1226: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x97d02030  ! 1227: Tcc_I	tge	icc_or_xcc, %r0 + 48
DS_79:
	.word 0x20800001  ! 1229: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b0030e  ! 1228: ALLIGNADDRESS	alignaddr	%r0, %r14, %r9
	.word 0x8d902804  ! 1229: WRPR_PSTATE_I	wrpr	%r0, 0x0804, %pstate
	.word 0x22700001  ! 1230: BPE	<illegal instruction>
	.word 0x8d902251  ! 1231: WRPR_PSTATE_I	wrpr	%r0, 0x0251, %pstate
	.word 0x9d480000  ! 1232: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0x9da38dc8  ! 1233: FdMULq	fdmulq	
	.word 0x93d02034  ! 1234: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xdcd7e000  ! 1235: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r14
	.word 0x20800001  ! 1236: BN	bn,a	<label_0x1>
	.word 0x864ac008  ! 1237: MULX_R	mulx 	%r11, %r8, %r3
	.word 0xc64fc000  ! 1238: LDSB_R	ldsb	[%r31 + %r0], %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982811  ! 1240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0811, %hpstate
	.word 0x97a0056e  ! 1241: FSQRTq	fsqrt	
	.word 0x93686001  ! 1242: SDIVX_I	sdivx	%r1, 0x0001, %r9
	.word 0x8d902a82  ! 1243: WRPR_PSTATE_I	wrpr	%r0, 0x0a82, %pstate
	.word 0x8d902cc2  ! 1244: WRPR_PSTATE_I	wrpr	%r0, 0x0cc2, %pstate
	.word 0x82812001  ! 1245: ADDcc_I	addcc 	%r4, 0x0001, %r1
	.word 0x84d34007  ! 1246: UMULcc_R	umulcc 	%r13, %r7, %r2
	.word 0x8fa189e6  ! 1247: FDIVq	dis not found

	.word 0x91d02033  ! 1248: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xce27e001  ! 1249: STW_I	stw	%r7, [%r31 + 0x0001]
	.word 0x8198214a  ! 1250: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014a, %hpstate
	.word 0xcec7e020  ! 1251: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	.word 0x87802014  ! 1252: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xce8804a0  ! 1253: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0xce8008a0  ! 1254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcec7e020  ! 1255: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	mov 0x33, %r30
	.word 0x81d0001e  ! 1256: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9cd32001  ! 1257: UMULcc_I	umulcc 	%r12, 0x0001, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 1259: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_80:
	.word 0x34800001  ! 1261: BG	bg,a	<label_0x1>
	illtrap
	.word 0x89b24309  ! 1260: ALLIGNADDRESS	alignaddr	%r9, %r9, %r4
	.word 0x80d8000c  ! 1261: SMULcc_R	smulcc 	%r0, %r12, %r0
	.word 0x9f480000  ! 1262: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0xde9fe001  ! 1263: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	.word 0x9f480000  ! 1264: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x8d902647  ! 1265: WRPR_PSTATE_I	wrpr	%r0, 0x0647, %pstate
	.word 0x8d90265a  ! 1266: WRPR_PSTATE_I	wrpr	%r0, 0x065a, %pstate
DS_81:
	.word 0x34800001  ! 1268: BG	bg,a	<label_0x1>
	.word 0xd9314001  ! 1268: STQF_R	-	%f12, [%r1, %r5]
	.word 0x93458000  ! 1267: RD_SOFTINT_REG	rd	%softint, %r9
DS_82:
	.word 0x32800001  ! 1269: BNE	bne,a	<label_0x1>
	.word 0xc333e001  ! 1269: STQF_I	-	%f1, [0x0001, %r15]
	.word 0x9b458000  ! 1268: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d802004  ! 1269: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9c81000a  ! 1271: ADDcc_R	addcc 	%r4, %r10, %r14
	.word 0x9ba000cc  ! 1272: FNEGd	fnegd	%f12, %f44
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d9028dd  ! 1274: WRPR_PSTATE_I	wrpr	%r0, 0x08dd, %pstate
	.word 0x90792001  ! 1275: SDIV_I	sdiv 	%r4, 0x0001, %r8
	mov 0x31, %r30
	.word 0x85d0001e  ! 1276: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xd1e7c02c  ! 1277: CASA_I	casa	[%r31] 0x 1, %r12, %r8
	.word 0x89d02034  ! 1278: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x819828c5  ! 1279: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c5, %hpstate
	.word 0x9e02a001  ! 1280: ADD_I	add 	%r10, 0x0001, %r15
	.word 0xdf27e001  ! 1281: STF_I	st	%f15, [0x0001, %r31]
	.word 0x8cc26001  ! 1282: ADDCcc_I	addccc 	%r9, 0x0001, %r6
	.word 0x97a30dc6  ! 1283: FdMULq	fdmulq	
	.word 0x8479c007  ! 1284: SDIV_R	sdiv 	%r7, %r7, %r2
	.word 0x9da00549  ! 1285: FSQRTd	fsqrt	
	mov 0x35, %r30
	.word 0x99d0001e  ! 1286: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8c022001  ! 1287: ADD_I	add 	%r8, 0x0001, %r6
	.word 0x8d902cca  ! 1288: WRPR_PSTATE_I	wrpr	%r0, 0x0cca, %pstate
	.word 0x8d902044  ! 1289: WRPR_PSTATE_I	wrpr	%r0, 0x0044, %pstate
	.word 0x8d802000  ! 1290: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc17c000  ! 1291: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0xcc800a60  ! 1292: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r6
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x85d0001e  ! 1294: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 1295: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xcc3fc009  ! 1296: STD_R	std	%r6, [%r31 + %r9]
	.word 0x81982102  ! 1297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0102, %hpstate
	.word 0x3e800001  ! 1298: BVC	bvc,a	<label_0x1>
	.word 0x22800001  ! 1299: BE	be,a	<label_0x1>
	.word 0xcc9fe001  ! 1300: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0xcc800a60  ! 1301: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r6
	.word 0x8ed36001  ! 1302: UMULcc_I	umulcc 	%r13, 0x0001, %r7
	mov 0x30, %r30
	.word 0x91d0001e  ! 1303: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce880e60  ! 1304: LDUBA_R	lduba	[%r0, %r0] 0x73, %r7
	.word 0xce8fe020  ! 1305: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r7
	.word 0x8d90249d  ! 1306: WRPR_PSTATE_I	wrpr	%r0, 0x049d, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902cde  ! 1308: WRPR_PSTATE_I	wrpr	%r0, 0x0cde, %pstate
	.word 0x826bc00e  ! 1309: UDIVX_R	udivx 	%r15, %r14, %r1
	.word 0xc22fc00e  ! 1310: STB_R	stb	%r1, [%r31 + %r14]
	.word 0x8d902488  ! 1311: WRPR_PSTATE_I	wrpr	%r0, 0x0488, %pstate
	.word 0xc397e001  ! 1312: LDQFA_I	-	[%r31, 0x0001], %f1
	.word 0x8c834008  ! 1313: ADDcc_R	addcc 	%r13, %r8, %r6
	.word 0x8c4b6001  ! 1314: MULX_I	mulx 	%r13, 0x0001, %r6
	.word 0x91d02034  ! 1315: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8e68c008  ! 1316: UDIVX_R	udivx 	%r3, %r8, %r7
	.word 0xce8008a0  ! 1317: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	mov 0x31, %r30
	.word 0x8fd0001e  ! 1318: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
DS_83:
	.word 0x22800001  ! 1320: BE	be,a	<label_0x1>
	.word 0xd3304008  ! 1320: STQF_R	-	%f9, [%r8, %r1]
	.word 0x87458000  ! 1319: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x96508004  ! 1320: UMUL_R	umul 	%r2, %r4, %r11
DS_84:
	.word 0x32800001  ! 1322: BNE	bne,a	<label_0x1>
	.word 0xcd330009  ! 1322: STQF_R	-	%f6, [%r9, %r12]
	.word 0x87458000  ! 1321: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x9403a001  ! 1322: ADD_I	add 	%r14, 0x0001, %r10
	.word 0xd597e001  ! 1323: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x9c4b0003  ! 1324: MULX_R	mulx 	%r12, %r3, %r14
	.word 0x8d902e18  ! 1325: WRPR_PSTATE_I	wrpr	%r0, 0x0e18, %pstate
	.word 0x819829cd  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cd, %hpstate
	.word 0x20800001  ! 1327: BN	bn,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	mov 0x33, %r30
	.word 0x9bd0001e  ! 1329: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xdcd804a0  ! 1330: LDXA_R	ldxa	[%r0, %r0] 0x25, %r14
	.word 0x81982e8f  ! 1331: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
	.word 0x87802014  ! 1332: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902089  ! 1334: WRPR_PSTATE_I	wrpr	%r0, 0x0089, %pstate
	.word 0xdc8008a0  ! 1335: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x84d02001  ! 1336: UMULcc_I	umulcc 	%r0, 0x0001, %r2
	.word 0x9f504000  ! 1337: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0x9669c005  ! 1338: UDIVX_R	udivx 	%r7, %r5, %r11
	.word 0x8d802004  ! 1339: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd6800ac0  ! 1341: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
	.word 0x81d02035  ! 1342: Tcc_I	tn	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a5d  ! 1344: WRPR_PSTATE_I	wrpr	%r0, 0x0a5d, %pstate
	.word 0x8848000c  ! 1345: MULX_R	mulx 	%r0, %r12, %r4
	.word 0x8da000c9  ! 1346: FNEGd	fnegd	%f40, %f6
	.word 0x32800001  ! 1347: BNE	bne,a	<label_0x1>
	.word 0xcd37c009  ! 1348: STQF_R	-	%f6, [%r9, %r31]
	.word 0xcc9004a0  ! 1349: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0x91d02035  ! 1350: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8edb8000  ! 1351: SMULcc_R	smulcc 	%r14, %r0, %r7
	.word 0x8d9022dc  ! 1352: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	.word 0x8d802004  ! 1353: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xce9fc020  ! 1354: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0xce8008a0  ! 1355: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802014  ! 1356: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xce97e000  ! 1357: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0xce8008a0  ! 1359: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce2fe001  ! 1360: STB_I	stb	%r7, [%r31 + 0x0001]
	.word 0xce9fe001  ! 1361: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0xce800b80  ! 1362: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r7
	mov 0x31, %r30
	.word 0x95d0001e  ! 1363: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x819820ca  ! 1364: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ca, %hpstate
	.word 0xce37c000  ! 1365: STH_R	sth	%r7, [%r31 + %r0]
	.word 0x81982c58  ! 1366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c58, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xcf37e001  ! 1368: STQF_I	-	%f7, [0x0001, %r31]
	.word 0x8d902201  ! 1369: WRPR_PSTATE_I	wrpr	%r0, 0x0201, %pstate
DS_85:
	.word 0x22800001  ! 1371: BE	be,a	<label_0x1>
	.word 0xc332000b  ! 1371: STQF_R	-	%f1, [%r11, %r8]
	.word 0x8f458000  ! 1370: RD_SOFTINT_REG	rd	%softint, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x8350c000  ! 1372: RDPR_TT	rdpr	%tt, %r1
	.word 0x9c79e001  ! 1373: SDIV_I	sdiv 	%r7, 0x0001, %r14
DS_86:
	.word 0x20800001  ! 1375: BN	bn,a	<label_0x1>
	.word 0xd731c006  ! 1375: STQF_R	-	%f11, [%r6, %r7]
	.word 0x99458000  ! 1374: RD_SOFTINT_REG	rd	%softint, %r12
DS_87:
	.word 0x22800001  ! 1376: BE	be,a	<label_0x1>
	.word 0xcb33a001  ! 1376: STQF_I	-	%f5, [0x0001, %r14]
	.word 0x9d458000  ! 1375: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8c6a8005  ! 1376: UDIVX_R	udivx 	%r10, %r5, %r6
	.word 0x8d9028c2  ! 1377: WRPR_PSTATE_I	wrpr	%r0, 0x08c2, %pstate
	.word 0xccc004a0  ! 1378: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x996a0004  ! 1380: SDIVX_R	sdivx	%r8, %r4, %r12
DS_88:
	.word 0x32800001  ! 1382: BNE	bne,a	<label_0x1>
	.word 0xc332400b  ! 1382: STQF_R	-	%f1, [%r11, %r9]
	.word 0x89458000  ! 1381: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x83d02031  ! 1382: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8cd00008  ! 1383: UMULcc_R	umulcc 	%r0, %r8, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982d54  ! 1385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d54, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d51c000  ! 1387: RDPR_TL	rdpr	%tl, %r6
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x33, %r30
	.word 0x93d0001e  ! 1389: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9b6b4006  ! 1390: SDIVX_R	sdivx	%r13, %r6, %r13
	.word 0x9c83000a  ! 1391: ADDcc_R	addcc 	%r12, %r10, %r14
	.word 0x87802080  ! 1392: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802014  ! 1393: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982b00  ! 1394: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b00, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x8bd0001e  ! 1396: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 1397: BGU	bgu,a	<label_0x1>
	.word 0x81982f43  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	.word 0x3c800001  ! 1399: BPOS	bpos,a	<label_0x1>
	.word 0xdd3fc00a  ! 1400: STDF_R	std	%f14, [%r10, %r31]
	.word 0x99514000  ! 1401: RDPR_TBA	rdpr	%tba, %r12
	.word 0x9a530007  ! 1402: UMUL_R	umul 	%r12, %r7, %r13
	.word 0x81982a90  ! 1403: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a90, %hpstate
	.word 0xdad7e020  ! 1404: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0x87d02032  ! 1405: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x8d902a4b  ! 1406: WRPR_PSTATE_I	wrpr	%r0, 0x0a4b, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982758  ! 1408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0758, %hpstate
	.word 0xdad7e030  ! 1409: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0x8768400a  ! 1410: SDIVX_R	sdivx	%r1, %r10, %r3
	.word 0x87802004  ! 1411: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902c0e  ! 1412: WRPR_PSTATE_I	wrpr	%r0, 0x0c0e, %pstate
	.word 0xc69fc020  ! 1413: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0xc68fe030  ! 1414: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	.word 0x81982fcc  ! 1415: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcc, %hpstate
	.word 0x8d9020c6  ! 1416: WRPR_PSTATE_I	wrpr	%r0, 0x00c6, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc6cfe020  ! 1418: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	.word 0x8c798005  ! 1419: SDIV_R	sdiv 	%r6, %r5, %r6
	.word 0xcc9004a0  ! 1420: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0xcc7fe001  ! 1421: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x8879a001  ! 1422: SDIV_I	sdiv 	%r6, 0x0001, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8c804a0  ! 1424: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0x26800001  ! 1425: BL	bl,a	<label_0x1>
	.word 0x8d902846  ! 1426: WRPR_PSTATE_I	wrpr	%r0, 0x0846, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc84fc000  ! 1428: LDSB_R	ldsb	[%r31 + %r0], %r4
	.word 0x819826d4  ! 1429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d4, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e95  ! 1431: WRPR_PSTATE_I	wrpr	%r0, 0x0e95, %pstate
	.word 0x81982c5c  ! 1432: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5c, %hpstate
	.word 0xc927c005  ! 1433: STF_R	st	%f4, [%r5, %r31]
	.word 0xc857e001  ! 1434: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x32800001  ! 1435: BNE	bne,a	<label_0x1>
	.word 0x95d02030  ! 1436: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x916a0002  ! 1437: SDIVX_R	sdivx	%r8, %r2, %r8
	.word 0x8d90260b  ! 1438: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0x8483a001  ! 1439: ADDcc_I	addcc 	%r14, 0x0001, %r2
	.word 0xc527c002  ! 1440: STF_R	st	%f2, [%r2, %r31]
	.word 0xc48008a0  ! 1441: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x83d02034  ! 1442: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x20700001  ! 1444: BPN	<illegal instruction>
	.word 0x87802089  ! 1445: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc437e001  ! 1446: STH_I	sth	%r2, [%r31 + 0x0001]
	.word 0xc527e001  ! 1447: STF_I	st	%f2, [0x0001, %r31]
	.word 0x9a484002  ! 1448: MULX_R	mulx 	%r1, %r2, %r13
	.word 0x8d902895  ! 1449: WRPR_PSTATE_I	wrpr	%r0, 0x0895, %pstate
	.word 0x3e700001  ! 1450: BPVC	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902a8c  ! 1452: WRPR_PSTATE_I	wrpr	%r0, 0x0a8c, %pstate
	.word 0x8ed02001  ! 1453: UMULcc_I	umulcc 	%r0, 0x0001, %r7
	.word 0x8d902257  ! 1454: WRPR_PSTATE_I	wrpr	%r0, 0x0257, %pstate
	.word 0x32700001  ! 1455: BPNE	<illegal instruction>
	.word 0x82534001  ! 1456: UMUL_R	umul 	%r13, %r1, %r1
	.word 0x87802088  ! 1457: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802016  ! 1458: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc337c001  ! 1459: STQF_R	-	%f1, [%r1, %r31]
	.word 0x9ba00549  ! 1460: FSQRTd	fsqrt	
	.word 0xda3fe001  ! 1461: STD_I	std	%r13, [%r31 + 0x0001]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802004  ! 1463: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x819820ce  ! 1464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	.word 0x81a3c9a1  ! 1465: FDIVs	fdivs	%f15, %f1, %f0
	.word 0xc07fe001  ! 1466: SWAP_I	swap	%r0, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x38700001  ! 1469: BPGU	<illegal instruction>
	.word 0x83d02035  ! 1470: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 1471: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
DS_89:
	.word 0x34800001  ! 1474: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b1c303  ! 1473: ALLIGNADDRESS	alignaddr	%r7, %r3, %r2
	.word 0x8d802000  ! 1474: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97a0cd26  ! 1475: FsMULd	fsmuld	%f3, %f6, %f42
	ta	T_CHANGE_HPRIV	! macro
	.word 0x86006001  ! 1477: ADD_I	add 	%r1, 0x0001, %r3
	.word 0x9d500000  ! 1478: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x81a3cdc3  ! 1479: FdMULq	fdmulq	
	.word 0x82832001  ! 1480: ADDcc_I	addcc 	%r12, 0x0001, %r1
	.word 0x824ba001  ! 1481: MULX_I	mulx 	%r14, 0x0001, %r1
	ta	T_CHANGE_PRIV	! macro
	mov 0x33, %r30
	.word 0x85d0001e  ! 1483: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc247e001  ! 1484: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	mov 0x32, %r30
	.word 0x83d0001e  ! 1485: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982853  ! 1486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0853, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 1488: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_90:
	.word 0x34800001  ! 1490: BG	bg,a	<label_0x1>
	.word 0xd531c00a  ! 1490: STQF_R	-	%f10, [%r10, %r7]
	.word 0x99458000  ! 1489: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x85d02034  ! 1490: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x26800001  ! 1491: BL	bl,a	<label_0x1>
	.word 0x81982812  ! 1492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0812, %hpstate
	.word 0x81982653  ! 1493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0653, %hpstate
	.word 0x89d02030  ! 1494: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x32700001  ! 1495: BPNE	<illegal instruction>
	.word 0x97d02030  ! 1496: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0x81a0cd2b  ! 1497: FsMULd	fsmuld	%f3, %f42, %f0
	mov 0x31, %r30
	.word 0x81d0001e  ! 1498: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc127c00b  ! 1499: STF_R	st	%f0, [%r11, %r31]
	.word 0x99a349c1  ! 1500: FDIVd	fdivd	%f44, %f32, %f12
	.word 0x8d802004  ! 1501: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x32, %r30
	.word 0x97d0001e  ! 1502: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x819822d8  ! 1503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d8, %hpstate
	.word 0x8bd02031  ! 1504: Tcc_I	tcs	icc_or_xcc, %r0 + 49
DS_91:
	.word 0x34800001  ! 1506: BG	bg,a	<label_0x1>
	illtrap
	.word 0x89b0830c  ! 1505: ALLIGNADDRESS	alignaddr	%r2, %r12, %r4
	.word 0x8d9028c3  ! 1506: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
	.word 0xc927e001  ! 1507: STF_I	st	%f4, [0x0001, %r31]
	.word 0x8fa0056f  ! 1508: FSQRTq	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x896a400e  ! 1510: SDIVX_R	sdivx	%r9, %r14, %r4
	.word 0x3c700001  ! 1511: BPPOS	<illegal instruction>
	.word 0x8d902491  ! 1512: WRPR_PSTATE_I	wrpr	%r0, 0x0491, %pstate
	.word 0x87802080  ! 1513: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 1515: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982ed4  ! 1516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
	.word 0x8d802000  ! 1517: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x34, %r30
	.word 0x93d0001e  ! 1518: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02030  ! 1520: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x87802004  ! 1521: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87514000  ! 1523: RDPR_TBA	rdpr	%tba, %r3
	.word 0x86c1e001  ! 1524: ADDCcc_I	addccc 	%r7, 0x0001, %r3
	.word 0xc607c000  ! 1525: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0x8d902044  ! 1526: WRPR_PSTATE_I	wrpr	%r0, 0x0044, %pstate
	.word 0x88c36001  ! 1527: ADDCcc_I	addccc 	%r13, 0x0001, %r4
	.word 0xc897e000  ! 1528: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r4
	.word 0x8f508000  ! 1529: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x8d902488  ! 1530: WRPR_PSTATE_I	wrpr	%r0, 0x0488, %pstate
	.word 0x9b50c000  ! 1531: RDPR_TT	rdpr	%tt, %r13
	.word 0x87802088  ! 1532: WRASI_I	wr	%r0, 0x0088, %asi
	mov 0x35, %r30
	.word 0x9bd0001e  ! 1533: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902208  ! 1535: WRPR_PSTATE_I	wrpr	%r0, 0x0208, %pstate
	.word 0xdacfe030  ! 1536: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x81982d4e  ! 1537: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4e, %hpstate
	.word 0x8d902cd0  ! 1538: WRPR_PSTATE_I	wrpr	%r0, 0x0cd0, %pstate
	.word 0x8cd1400b  ! 1539: UMULcc_R	umulcc 	%r5, %r11, %r6
DS_92:
	.word 0x34800001  ! 1541: BG	bg,a	<label_0x1>
	.word 0xc1322001  ! 1541: STQF_I	-	%f0, [0x0001, %r8]
	.word 0x8b458000  ! 1540: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x819824cd  ! 1541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cd, %hpstate
	.word 0x24700001  ! 1542: BPLE	<illegal instruction>
	.word 0x20800001  ! 1543: BN	bn,a	<label_0x1>
	.word 0x8d90225d  ! 1544: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	.word 0x8d902cdc  ! 1545: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	.word 0x87802014  ! 1546: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x30, %r30
	.word 0x83d0001e  ! 1547: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902e84  ! 1548: WRPR_PSTATE_I	wrpr	%r0, 0x0e84, %pstate
	.word 0x8d902041  ! 1549: WRPR_PSTATE_I	wrpr	%r0, 0x0041, %pstate
	.word 0x86686001  ! 1550: UDIVX_I	udivx 	%r1, 0x0001, %r3
	.word 0x85d02034  ! 1551: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x99a109c6  ! 1552: FDIVd	fdivd	%f4, %f6, %f12
	.word 0x99a349e2  ! 1553: FDIVq	dis not found

	.word 0x8d802000  ! 1554: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982b82  ! 1555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982dc2  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc2, %hpstate
	mov 0x34, %r30
	.word 0x99d0001e  ! 1558: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 1559: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81982f16  ! 1560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f16, %hpstate
	.word 0x84c06001  ! 1561: ADDCcc_I	addccc 	%r1, 0x0001, %r2
	.word 0x8d802000  ! 1562: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 1563: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc48008a0  ! 1564: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x847be001  ! 1565: SDIV_I	sdiv 	%r15, 0x0001, %r2
	.word 0x924b4004  ! 1566: MULX_R	mulx 	%r13, %r4, %r9
	.word 0x8d902e54  ! 1567: WRPR_PSTATE_I	wrpr	%r0, 0x0e54, %pstate
	.word 0x3e700001  ! 1568: BPVC	<illegal instruction>
	.word 0xd33fc004  ! 1569: STDF_R	std	%f9, [%r4, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87d02034  ! 1571: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 1572: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x956ba001  ! 1573: SDIVX_I	sdivx	%r14, 0x0001, %r10
	.word 0xd527e001  ! 1574: STF_I	st	%f10, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982d82  ! 1576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	.word 0xd48008a0  ! 1577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x99d02034  ! 1578: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x8d902ac4  ! 1579: WRPR_PSTATE_I	wrpr	%r0, 0x0ac4, %pstate
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x8dd0001e  ! 1581: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 1582: BG	bg,a	<label_0x1>
	.word 0x87802080  ! 1583: WRASI_I	wr	%r0, 0x0080, %asi
	mov 0x30, %r30
	.word 0x8fd0001e  ! 1584: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
DS_93:
	.word 0x32800001  ! 1586: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b0430e  ! 1585: ALLIGNADDRESS	alignaddr	%r1, %r14, %r3
	.word 0x8d802000  ! 1586: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982d09  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d09, %hpstate
	.word 0xc60fe001  ! 1588: LDUB_I	ldub	[%r31 + 0x0001], %r3
	.word 0x99a000cc  ! 1589: FNEGd	fnegd	%f12, %f12
	.word 0x8d802000  ! 1590: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x904ac00d  ! 1591: MULX_R	mulx 	%r11, %r13, %r8
	.word 0xd127e001  ! 1592: STF_I	st	%f8, [0x0001, %r31]
	.word 0xd08008a0  ! 1593: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x81982e8a  ! 1594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
	.word 0xd07fe001  ! 1595: SWAP_I	swap	%r8, [%r31 + 0x0001]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd0dfe030  ! 1597: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x85514000  ! 1598: RDPR_TBA	rdpr	%tba, %r2
	.word 0xc4c7e010  ! 1599: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x8bd02033  ! 1600: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x819824c0  ! 1601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c0, %hpstate
	.word 0xc4d7e000  ! 1602: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0x9b6b4009  ! 1603: SDIVX_R	sdivx	%r13, %r9, %r13
	.word 0x87802010  ! 1604: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xdb97e001  ! 1605: LDQFA_I	-	[%r31, 0x0001], %f13
	mov 0x32, %r30
	.word 0x97d0001e  ! 1606: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x99d0001e  ! 1607: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x806be001  ! 1608: UDIVX_I	udivx 	%r15, 0x0001, %r0
	.word 0x9b6a4003  ! 1609: SDIVX_R	sdivx	%r9, %r3, %r13
	.word 0xda8008a0  ! 1610: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8198200a  ! 1611: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000a, %hpstate
	.word 0x8d90204b  ! 1612: WRPR_PSTATE_I	wrpr	%r0, 0x004b, %pstate
	.word 0xda800c00  ! 1613: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r13
	.word 0x81982d50  ! 1614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802016  ! 1616: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d9028cc  ! 1618: WRPR_PSTATE_I	wrpr	%r0, 0x08cc, %pstate
	.word 0x8da000ce  ! 1619: FNEGd	fnegd	%f14, %f6
	.word 0x84494002  ! 1620: MULX_R	mulx 	%r5, %r2, %r2
	.word 0x87802080  ! 1621: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982187  ! 1622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0187, %hpstate
	.word 0x3c700001  ! 1623: BPPOS	<illegal instruction>
	.word 0x8d902a53  ! 1624: WRPR_PSTATE_I	wrpr	%r0, 0x0a53, %pstate
	.word 0x8e48a001  ! 1625: MULX_I	mulx 	%r2, 0x0001, %r7
	.word 0x91a01a6a  ! 1626: FqTOi	fqtoi	
	.word 0x8d9020c0  ! 1627: WRPR_PSTATE_I	wrpr	%r0, 0x00c0, %pstate
	.word 0x819829d6  ! 1628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d6, %hpstate
	.word 0x81982b0f  ! 1629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	.word 0x97a00545  ! 1630: FSQRTd	fsqrt	
	.word 0x8b682001  ! 1631: SDIVX_I	sdivx	%r0, 0x0001, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcad004a0  ! 1633: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x81982319  ! 1634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0319, %hpstate
	.word 0xca800b80  ! 1635: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r5
	.word 0x84d8400d  ! 1636: SMULcc_R	smulcc 	%r1, %r13, %r2
	ta	T_CHANGE_TO_TL0	! macro
DS_94:
	.word 0x32800001  ! 1639: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b0c30f  ! 1638: ALLIGNADDRESS	alignaddr	%r3, %r15, %r0
	.word 0x8198269c  ! 1639: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069c, %hpstate
	.word 0x8650000a  ! 1640: UMUL_R	umul 	%r0, %r10, %r3
	.word 0x8198229d  ! 1641: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
	.word 0x97a01a68  ! 1642: FqTOi	fqtoi	
	.word 0x87802004  ! 1643: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 1644: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6800c20  ! 1645: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	.word 0xd797e001  ! 1646: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0xd727e001  ! 1647: STF_I	st	%f11, [0x0001, %r31]
	.word 0x8d90248b  ! 1648: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
	.word 0xd6800c60  ! 1649: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
	.word 0xd727e001  ! 1650: STF_I	st	%f11, [0x0001, %r31]
	.word 0x83a089a2  ! 1651: FDIVs	fdivs	%f2, %f2, %f1
DS_95:
	.word 0x20800001  ! 1653: BN	bn,a	<label_0x1>
	.word 0xcd338005  ! 1653: STQF_R	-	%f6, [%r5, %r14]
	.word 0x85458000  ! 1652: RD_SOFTINT_REG	rd	%softint, %r2
	mov 0x30, %r30
	.word 0x89d0001e  ! 1653: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 1654: BPOS	bpos,a	<label_0x1>
	.word 0x87802004  ! 1655: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x31, %r30
	.word 0x99d0001e  ! 1656: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x81982f8b  ! 1657: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8b, %hpstate
	.word 0x81a04dc2  ! 1658: FdMULq	fdmulq	
	.word 0x81a249ae  ! 1659: FDIVs	fdivs	%f9, %f14, %f0
	.word 0x8551c000  ! 1660: RDPR_TL	rdpr	%tl, %r2
	.word 0x81a10d2b  ! 1661: FsMULd	fsmuld	%f4, %f42, %f0
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x87d0001e  ! 1663: Tcc_R	tl	icc_or_xcc, %r0 + %r30
DS_96:
	.word 0x20800001  ! 1665: BN	bn,a	<label_0x1>
	.word 0xc7336001  ! 1665: STQF_I	-	%f3, [0x0001, %r13]
	.word 0x91458000  ! 1664: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd0800c40  ! 1665: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r8
	.word 0x8168e001  ! 1666: SDIVX_I	sdivx	%r3, 0x0001, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802016  ! 1668: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802010  ! 1669: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc0cfe020  ! 1670: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r0
	.word 0x95508000  ! 1671: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xd4d7e020  ! 1672: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0x996a6001  ! 1673: SDIVX_I	sdivx	%r9, 0x0001, %r12
	.word 0x87500000  ! 1674: RDPR_TPC	rdpr	%tpc, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198289f  ! 1676: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0x97a1c9e6  ! 1677: FDIVq	dis not found

	.word 0xd737e001  ! 1678: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x28700001  ! 1679: BPLEU	<illegal instruction>
DS_97:
	.word 0x32800001  ! 1681: BNE	bne,a	<label_0x1>
	.word 0xd530e001  ! 1681: STQF_I	-	%f10, [0x0001, %r3]
	.word 0x83458000  ! 1680: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x91696001  ! 1681: SDIVX_I	sdivx	%r5, 0x0001, %r8
	.word 0x8d902856  ! 1682: WRPR_PSTATE_I	wrpr	%r0, 0x0856, %pstate
	.word 0x819828d7  ! 1683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d7, %hpstate
	.word 0x99d02030  ! 1684: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x87802014  ! 1685: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd0800ba0  ! 1686: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r8
	.word 0x9bd02035  ! 1687: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x3c700001  ! 1688: BPPOS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99d02034  ! 1690: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0xd037c006  ! 1691: STH_R	sth	%r8, [%r31 + %r6]
	.word 0x8d902adc  ! 1692: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	.word 0x92534001  ! 1693: UMUL_R	umul 	%r13, %r1, %r9
	.word 0x8d802004  ! 1694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802089  ! 1696: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d90265d  ! 1697: WRPR_PSTATE_I	wrpr	%r0, 0x065d, %pstate
	.word 0xd2ffc021  ! 1698: SWAPA_R	swapa	%r9, [%r31 + %r1] 0x01
	.word 0x8d902856  ! 1699: WRPR_PSTATE_I	wrpr	%r0, 0x0856, %pstate
	.word 0x26800001  ! 1700: BL	bl,a	<label_0x1>
	.word 0xd2c7e030  ! 1701: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0xd25fc000  ! 1702: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9a016001  ! 1703: ADD_I	add 	%r5, 0x0001, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x946b6001  ! 1705: UDIVX_I	udivx 	%r13, 0x0001, %r10
	.word 0x84d14003  ! 1706: UMULcc_R	umulcc 	%r5, %r3, %r2
	.word 0x91a01a64  ! 1707: FqTOi	fqtoi	
	.word 0x8d902c40  ! 1708: WRPR_PSTATE_I	wrpr	%r0, 0x0c40, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8dd02034  ! 1710: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x8d902046  ! 1711: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	.word 0x8d90249b  ! 1712: WRPR_PSTATE_I	wrpr	%r0, 0x049b, %pstate
	.word 0xd05fe001  ! 1713: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0xd047c000  ! 1714: LDSW_R	ldsw	[%r31 + %r0], %r8
	.word 0x8d902417  ! 1715: WRPR_PSTATE_I	wrpr	%r0, 0x0417, %pstate
	.word 0x8a00a001  ! 1716: ADD_I	add 	%r2, 0x0001, %r5
	.word 0x9d494000  ! 1717: RDHPR_HTBA	rdhpr	%htba, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902c01  ! 1719: WRPR_PSTATE_I	wrpr	%r0, 0x0c01, %pstate
	.word 0x81982103  ! 1720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0103, %hpstate
	.word 0x83d02032  ! 1721: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8f500000  ! 1722: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x9da00565  ! 1723: FSQRTq	fsqrt	
	.word 0x81982590  ! 1724: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0590, %hpstate
	.word 0x81982111  ! 1725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0111, %hpstate
	.word 0x9c492001  ! 1726: MULX_I	mulx 	%r4, 0x0001, %r14
	.word 0x9469c005  ! 1727: UDIVX_R	udivx 	%r7, %r5, %r10
	.word 0x81982540  ! 1728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0540, %hpstate
	.word 0xd447e001  ! 1729: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x819824c6  ! 1730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	.word 0x20700001  ! 1731: BPN	<illegal instruction>
	.word 0x96832001  ! 1732: ADDcc_I	addcc 	%r12, 0x0001, %r11
	.word 0x8d902046  ! 1733: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	.word 0xd727c005  ! 1734: STF_R	st	%f11, [%r5, %r31]
	.word 0x8d9028c6  ! 1735: WRPR_PSTATE_I	wrpr	%r0, 0x08c6, %pstate
	.word 0x8082e001  ! 1736: ADDcc_I	addcc 	%r11, 0x0001, %r0
	.word 0x8d802000  ! 1737: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b51c000  ! 1738: RDPR_TL	rdpr	%tl, %r13
	.word 0x97d02031  ! 1739: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x81982b88  ! 1740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b88, %hpstate
	mov 0x30, %r30
	.word 0x95d0001e  ! 1741: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x9f51c000  ! 1742: RDPR_TL	rdpr	%tl, %r15
	.word 0x8849c000  ! 1743: MULX_R	mulx 	%r7, %r0, %r4
	.word 0xc897e030  ! 1744: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r4
	.word 0xc8d804a0  ! 1745: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x81982dd3  ! 1746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd3, %hpstate
	.word 0x3c700001  ! 1747: BPPOS	<illegal instruction>
DS_98:
	.word 0x32800001  ! 1749: BNE	bne,a	<label_0x1>
	.word 0xd7314004  ! 1749: STQF_R	-	%f11, [%r4, %r5]
	.word 0x9b458000  ! 1748: RD_SOFTINT_REG	rd	%softint, %r13
DS_99:
	.word 0x32800001  ! 1750: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb24308  ! 1749: ALLIGNADDRESS	alignaddr	%r9, %r8, %r7
	ta	T_CHANGE_NONHPRIV	! macro
DS_100:
	.word 0x22800001  ! 1752: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb00304  ! 1751: ALLIGNADDRESS	alignaddr	%r0, %r4, %r15
	.word 0xdec804a0  ! 1752: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r15
	ta	T_CHANGE_TO_TL0	! macro
DS_101:
	.word 0x34800001  ! 1755: BG	bg,a	<label_0x1>
	.word 0xdd30000a  ! 1755: STQF_R	-	%f14, [%r10, %r0]
	.word 0x9b458000  ! 1754: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x24700001  ! 1755: BPLE	<illegal instruction>
	.word 0xdb27c00a  ! 1756: STF_R	st	%f13, [%r10, %r31]
	.word 0x99a1cd2c  ! 1757: FsMULd	fsmuld	%f7, %f12, %f12
	.word 0x8d90229e  ! 1758: WRPR_PSTATE_I	wrpr	%r0, 0x029e, %pstate
	.word 0xd857c000  ! 1759: LDSH_R	ldsh	[%r31 + %r0], %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd89fe001  ! 1761: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xd8ffc02c  ! 1762: SWAPA_R	swapa	%r12, [%r31 + %r12] 0x01
	ta	T_CHANGE_PRIV	! macro
	.word 0x8b514000  ! 1764: RDPR_TBA	rdpr	%tba, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 1766: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x36700001  ! 1767: BPGE	<illegal instruction>
	.word 0x32700001  ! 1768: BPNE	<illegal instruction>
	.word 0x87802089  ! 1769: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d9024d2  ! 1770: WRPR_PSTATE_I	wrpr	%r0, 0x04d2, %pstate
	.word 0x92524005  ! 1771: UMUL_R	umul 	%r9, %r5, %r9
	.word 0xd237c005  ! 1772: STH_R	sth	%r9, [%r31 + %r5]
	.word 0x81a38d2a  ! 1773: FsMULd	fsmuld	%f14, %f10, %f0
	.word 0x98820009  ! 1774: ADDcc_R	addcc 	%r8, %r9, %r12
	.word 0xd93fc009  ! 1775: STDF_R	std	%f12, [%r9, %r31]
	.word 0x2a800001  ! 1776: BCS	bcs,a	<label_0x1>
	.word 0xd897e010  ! 1777: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x8d802004  ! 1778: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x89d02033  ! 1779: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x9d69800b  ! 1780: SDIVX_R	sdivx	%r6, %r11, %r14
	.word 0x9fd02035  ! 1781: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xdc57e001  ! 1782: LDSH_I	ldsh	[%r31 + 0x0001], %r14
	.word 0x8d902088  ! 1783: WRPR_PSTATE_I	wrpr	%r0, 0x0088, %pstate
	.word 0x2c700001  ! 1784: BPNEG	<illegal instruction>
	.word 0x36700001  ! 1785: BPGE	<illegal instruction>
	.word 0x8d902c42  ! 1786: WRPR_PSTATE_I	wrpr	%r0, 0x0c42, %pstate
DS_102:
	.word 0x20800001  ! 1788: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b18302  ! 1787: ALLIGNADDRESS	alignaddr	%r6, %r2, %r10
	mov 0x32, %r30
	.word 0x8bd0001e  ! 1788: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 1789: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802000  ! 1790: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802010  ! 1791: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x867a6001  ! 1792: SDIV_I	sdiv 	%r9, 0x0001, %r3
	.word 0xc697e000  ! 1793: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	.word 0x81982106  ! 1794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0106, %hpstate
	.word 0xc68008a0  ! 1795: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc68008a0  ! 1796: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc61fc000  ! 1797: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc6bfe001  ! 1798: STDA_I	stda	%r3, [%r31 + 0x0001] %asi
	.word 0x85d02033  ! 1799: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x83a14d24  ! 1800: FsMULd	fsmuld	%f5, %f4, %f32
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198270f  ! 1802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	mov 0x33, %r30
	.word 0x83d0001e  ! 1803: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x95d02033  ! 1804: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0xc327c004  ! 1805: STF_R	st	%f1, [%r4, %r31]
	.word 0x8d902a5b  ! 1806: WRPR_PSTATE_I	wrpr	%r0, 0x0a5b, %pstate
	.word 0x8d802004  ! 1807: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc2d80e40  ! 1808: LDXA_R	ldxa	[%r0, %r0] 0x72, %r1
	.word 0x8d902051  ! 1809: WRPR_PSTATE_I	wrpr	%r0, 0x0051, %pstate
	.word 0x886b400c  ! 1810: UDIVX_R	udivx 	%r13, %r12, %r4
	.word 0x91a000c7  ! 1811: FNEGd	fnegd	%f38, %f8
	mov 0x30, %r30
	.word 0x83d0001e  ! 1812: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8bd02030  ! 1814: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x9cd0a001  ! 1815: UMULcc_I	umulcc 	%r2, 0x0001, %r14
	.word 0x819828c5  ! 1816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c5, %hpstate
	.word 0xdcdfe020  ! 1817: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0x81982e59  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e59, %hpstate
	ta	T_CHANGE_HPRIV	! macro
DS_103:
	.word 0x20800001  ! 1821: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b2430c  ! 1820: ALLIGNADDRESS	alignaddr	%r9, %r12, %r12
	.word 0xd88008a0  ! 1821: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_104:
	.word 0x20800001  ! 1823: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b2430b  ! 1822: ALLIGNADDRESS	alignaddr	%r9, %r11, %r10
	.word 0x9b508000  ! 1823: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x8d902210  ! 1824: WRPR_PSTATE_I	wrpr	%r0, 0x0210, %pstate
	.word 0x81982186  ! 1825: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
	.word 0x81982054  ! 1826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0054, %hpstate
	.word 0x89494000  ! 1827: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x8d902e5b  ! 1828: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	.word 0x8f690004  ! 1829: SDIVX_R	sdivx	%r4, %r4, %r7
	.word 0x86692001  ! 1830: UDIVX_I	udivx 	%r4, 0x0001, %r3
	.word 0x8a824005  ! 1831: ADDcc_R	addcc 	%r9, %r5, %r5
	.word 0x81982893  ! 1832: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0893, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
DS_105:
	.word 0x34800001  ! 1836: BG	bg,a	<label_0x1>
	illtrap
	.word 0x97b0030c  ! 1835: ALLIGNADDRESS	alignaddr	%r0, %r12, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d9020ce  ! 1837: WRPR_PSTATE_I	wrpr	%r0, 0x00ce, %pstate
DS_106:
	.word 0x32800001  ! 1839: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db20305  ! 1838: ALLIGNADDRESS	alignaddr	%r8, %r5, %r6
	.word 0x8da14d20  ! 1839: FsMULd	fsmuld	%f5, %f0, %f6
	.word 0x8d802000  ! 1840: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198289c  ! 1842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089c, %hpstate
	.word 0x3e800001  ! 1843: BVC	bvc,a	<label_0x1>
	.word 0x819829c8  ! 1844: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x89a0056b  ! 1846: FSQRTq	fsqrt	
	.word 0x9ba00564  ! 1847: FSQRTq	fsqrt	
	.word 0x87802080  ! 1848: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8881c003  ! 1849: ADDcc_R	addcc 	%r7, %r3, %r4
	.word 0x8d90261a  ! 1850: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
	.word 0x8e798005  ! 1851: SDIV_R	sdiv 	%r6, %r5, %r7
	.word 0x24800001  ! 1852: BLE	ble,a	<label_0x1>
	.word 0x8d902ad0  ! 1853: WRPR_PSTATE_I	wrpr	%r0, 0x0ad0, %pstate
	.word 0x81982758  ! 1854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0758, %hpstate
DS_107:
	.word 0x22800001  ! 1856: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b00306  ! 1855: ALLIGNADDRESS	alignaddr	%r0, %r6, %r1
	.word 0x2e700001  ! 1856: BPVS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
DS_108:
	.word 0x34800001  ! 1859: BG	bg,a	<label_0x1>
	.word 0xdd30400c  ! 1859: STQF_R	-	%f14, [%r12, %r1]
	.word 0x93458000  ! 1858: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x81982c09  ! 1859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c09, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x819828d4  ! 1861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
DS_109:
	.word 0x32800001  ! 1863: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b38305  ! 1862: ALLIGNADDRESS	alignaddr	%r14, %r5, %r1
	.word 0x97a000c3  ! 1863: FNEGd	fnegd	%f34, %f42
	mov 0x31, %r30
	.word 0x99d0001e  ! 1864: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd6cfe030  ! 1865: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0xd68008a0  ! 1866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x89d02032  ! 1867: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0x8fa089c6  ! 1868: FDIVd	fdivd	%f2, %f6, %f38
	.word 0x87802088  ! 1869: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802010  ! 1870: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91a2cdc9  ! 1871: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9022cf  ! 1874: WRPR_PSTATE_I	wrpr	%r0, 0x02cf, %pstate
	.word 0x24700001  ! 1875: BPLE	<illegal instruction>
	.word 0x8d802000  ! 1876: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_110:
	.word 0x20800001  ! 1878: BN	bn,a	<label_0x1>
	.word 0xd9326001  ! 1878: STQF_I	-	%f12, [0x0001, %r9]
	.word 0x9b458000  ! 1877: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xdbe7c029  ! 1878: CASA_I	casa	[%r31] 0x 1, %r9, %r13
	.word 0x26700001  ! 1879: BPL	<illegal instruction>
	.word 0xda1fe001  ! 1880: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x85d02034  ! 1881: Tcc_I	tle	icc_or_xcc, %r0 + 52
DS_111:
	.word 0x22800001  ! 1883: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db2c30c  ! 1882: ALLIGNADDRESS	alignaddr	%r11, %r12, %r6
	.word 0xcc8008a0  ! 1883: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d802000  ! 1884: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x886a8009  ! 1885: UDIVX_R	udivx 	%r10, %r9, %r4
	.word 0x9151c000  ! 1886: RDPR_TL	rdpr	%tl, %r8
	.word 0x8d902a16  ! 1887: WRPR_PSTATE_I	wrpr	%r0, 0x0a16, %pstate
	.word 0x8d902e02  ! 1888: WRPR_PSTATE_I	wrpr	%r0, 0x0e02, %pstate
	mov 0x31, %r30
	.word 0x97d0001e  ! 1889: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 1890: BNE	bne,a	<label_0x1>
	.word 0x81982413  ! 1891: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0413, %hpstate
	.word 0xd08008a0  ! 1892: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x2c800001  ! 1893: BNEG	bneg,a	<label_0x1>
	.word 0x8d802000  ! 1894: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99a00542  ! 1895: FSQRTd	fsqrt	
	.word 0x8d902cca  ! 1896: WRPR_PSTATE_I	wrpr	%r0, 0x0cca, %pstate
	.word 0xd85fe001  ! 1897: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0xd8d00e40  ! 1898: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r12
DS_112:
	.word 0x32800001  ! 1900: BNE	bne,a	<label_0x1>
	.word 0xc3318008  ! 1900: STQF_R	-	%f1, [%r8, %r6]
	.word 0x9f458000  ! 1899: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0xde8008a0  ! 1900: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0xde800ae0  ! 1901: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r15
	.word 0xde7fe001  ! 1902: SWAP_I	swap	%r15, [%r31 + 0x0001]
DS_113:
	.word 0x20800001  ! 1904: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b0c30f  ! 1903: ALLIGNADDRESS	alignaddr	%r3, %r15, %r4
	.word 0xc807c000  ! 1904: LDUW_R	lduw	[%r31 + %r0], %r4
	ta	T_CHANGE_PRIV	! macro
DS_114:
	.word 0x34800001  ! 1907: BG	bg,a	<label_0x1>
	.word 0xd130c007  ! 1907: STQF_R	-	%f8, [%r7, %r3]
	.word 0x81458000  ! 1906: RD_SOFTINT_REG	stbar
	.word 0x8d902007  ! 1907: WRPR_PSTATE_I	wrpr	%r0, 0x0007, %pstate
	.word 0x8da389ae  ! 1908: FDIVs	fdivs	%f14, %f14, %f6
	ta	T_CHANGE_PRIV	! macro
	.word 0x8198234c  ! 1910: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034c, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f504000  ! 1912: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0xdedfe000  ! 1913: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r15
	.word 0x83a01a67  ! 1914: FqTOi	fqtoi	
	.word 0x8d902842  ! 1915: WRPR_PSTATE_I	wrpr	%r0, 0x0842, %pstate
	.word 0xc2cfe000  ! 1916: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0xc23fe001  ! 1917: STD_I	std	%r1, [%r31 + 0x0001]
	.word 0xc28804a0  ! 1918: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	mov 0x30, %r30
	.word 0x87d0001e  ! 1919: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x3e700001  ! 1921: BPVC	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982808  ! 1923: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0808, %hpstate
	.word 0xc33fe001  ! 1924: STDF_I	std	%f1, [0x0001, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc2d00e40  ! 1926: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r1
	.word 0x8d902e92  ! 1927: WRPR_PSTATE_I	wrpr	%r0, 0x0e92, %pstate
DS_115:
	.word 0x22800001  ! 1929: BE	be,a	<label_0x1>
	.word 0xc533a001  ! 1929: STQF_I	-	%f2, [0x0001, %r14]
	.word 0x9f458000  ! 1928: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8d902c88  ! 1929: WRPR_PSTATE_I	wrpr	%r0, 0x0c88, %pstate
	.word 0x81982212  ! 1930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0212, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982d5e  ! 1932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0x8da000ca  ! 1933: FNEGd	fnegd	%f10, %f6
	.word 0x906ba001  ! 1934: UDIVX_I	udivx 	%r14, 0x0001, %r8
	.word 0x8ba01a62  ! 1935: FqTOi	fqtoi	
	mov 0x33, %r30
	.word 0x8fd0001e  ! 1936: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9da14dc0  ! 1937: FdMULq	fdmulq	
DS_116:
	.word 0x32800001  ! 1939: BNE	bne,a	<label_0x1>
	.word 0xd331400e  ! 1939: STQF_R	-	%f9, [%r14, %r5]
	.word 0x83458000  ! 1938: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d902684  ! 1939: WRPR_PSTATE_I	wrpr	%r0, 0x0684, %pstate
	.word 0xc24fe001  ! 1940: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0x9e492001  ! 1941: MULX_I	mulx 	%r4, 0x0001, %r15
	.word 0x87514000  ! 1942: RDPR_TBA	rdpr	%tba, %r3
	.word 0x93d02035  ! 1943: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8198255b  ! 1944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055b, %hpstate
	.word 0xc68008a0  ! 1945: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x927a2001  ! 1946: SDIV_I	sdiv 	%r8, 0x0001, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x92806001  ! 1948: ADDcc_I	addcc 	%r1, 0x0001, %r9
	.word 0x819825c4  ! 1949: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c4, %hpstate
DS_117:
	.word 0x32800001  ! 1951: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb28300  ! 1950: ALLIGNADDRESS	alignaddr	%r10, %r0, %r5
	.word 0x99a0056a  ! 1951: FSQRTq	fsqrt	
	.word 0xd81fe001  ! 1952: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0xd8c7e010  ! 1953: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0x89d02035  ! 1954: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x9ba289ca  ! 1955: FDIVd	fdivd	%f10, %f10, %f44
	.word 0x88c32001  ! 1956: ADDCcc_I	addccc 	%r12, 0x0001, %r4
	.word 0xc937c00a  ! 1957: STQF_R	-	%f4, [%r10, %r31]
	.word 0x81982389  ! 1958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0389, %hpstate
	.word 0x8198245f  ! 1959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
	.word 0x8d90289c  ! 1960: WRPR_PSTATE_I	wrpr	%r0, 0x089c, %pstate
	.word 0x8d802004  ! 1961: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902e93  ! 1962: WRPR_PSTATE_I	wrpr	%r0, 0x0e93, %pstate
	.word 0x80690001  ! 1963: UDIVX_R	udivx 	%r4, %r1, %r0
	.word 0x9fd02031  ! 1964: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x819820c8  ! 1965: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c8, %hpstate
	.word 0x99d02030  ! 1966: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x8d802004  ! 1967: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982ec5  ! 1968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec5, %hpstate
	.word 0x8d802000  ! 1969: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x26700001  ! 1970: BPL	<illegal instruction>
	mov 0x35, %r30
	.word 0x95d0001e  ! 1971: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d902859  ! 1972: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
	.word 0x8d9020db  ! 1973: WRPR_PSTATE_I	wrpr	%r0, 0x00db, %pstate
	.word 0xc08008a0  ! 1974: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d902a45  ! 1975: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	.word 0x8d902a86  ! 1976: WRPR_PSTATE_I	wrpr	%r0, 0x0a86, %pstate
	.word 0xc0d7e010  ! 1977: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r0
	.word 0x8669e001  ! 1978: UDIVX_I	udivx 	%r7, 0x0001, %r3
	.word 0xc737c001  ! 1979: STQF_R	-	%f3, [%r1, %r31]
	.word 0x867a4002  ! 1980: SDIV_R	sdiv 	%r9, %r2, %r3
	.word 0xc6ffc022  ! 1981: SWAPA_R	swapa	%r3, [%r31 + %r2] 0x01
	.word 0x9c49c00d  ! 1982: MULX_R	mulx 	%r7, %r13, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x22800001  ! 1984: BE	be,a	<label_0x1>
	.word 0x81982cd5  ! 1985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd5, %hpstate
DS_118:
	.word 0x22800001  ! 1987: BE	be,a	<label_0x1>
	.word 0xd930e001  ! 1987: STQF_I	-	%f12, [0x0001, %r3]
	.word 0x8f458000  ! 1986: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xce4fc000  ! 1987: LDSB_R	ldsb	[%r31 + %r0], %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcecfe030  ! 1989: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r7
	.word 0x924b2001  ! 1990: MULX_I	mulx 	%r12, 0x0001, %r9
	.word 0x97a309e2  ! 1991: FDIVq	dis not found

	.word 0x8d90289b  ! 1992: WRPR_PSTATE_I	wrpr	%r0, 0x089b, %pstate
	.word 0x8d802000  ! 1993: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902cca  ! 1994: WRPR_PSTATE_I	wrpr	%r0, 0x0cca, %pstate
	.word 0x8d902218  ! 1995: WRPR_PSTATE_I	wrpr	%r0, 0x0218, %pstate
	.word 0xd637c002  ! 1996: STH_R	sth	%r11, [%r31 + %r2]
	.word 0xd6880e40  ! 1997: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
DS_119:
	.word 0x20800001  ! 1999: BN	bn,a	<label_0x1>
	.word 0xd7302001  ! 1999: STQF_I	-	%f11, [0x0001, %r0]
	.word 0x89458000  ! 1998: RD_SOFTINT_REG	rd	%softint, %r4
DS_120:
	.word 0x22800001  ! 2000: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db14303  ! 1999: ALLIGNADDRESS	alignaddr	%r5, %r3, %r6
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982852  ! 2002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
	mov 0x30, %r30
	.word 0x81d0001e  ! 2003: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 2004: BE	be,a	<label_0x1>
	.word 0x8c78e001  ! 2005: SDIV_I	sdiv 	%r3, 0x0001, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9026d7  ! 2007: WRPR_PSTATE_I	wrpr	%r0, 0x06d7, %pstate
	.word 0x83a3cdce  ! 2008: FdMULq	fdmulq	
	.word 0x26800001  ! 2009: BL	bl,a	<label_0x1>
	.word 0xc23fe001  ! 2010: STD_I	std	%r1, [%r31 + 0x0001]
	.word 0x819823df  ! 2011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03df, %hpstate
	.word 0xc2cfe000  ! 2012: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0x83514000  ! 2013: RDPR_TBA	rdpr	%tba, %r1
	.word 0xc2c004a0  ! 2014: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0x81982d59  ! 2015: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	.word 0x8d902c51  ! 2016: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
	.word 0xc327e001  ! 2017: STF_I	st	%f1, [0x0001, %r31]
	.word 0xc297e000  ! 2018: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r1
	.word 0xc257c000  ! 2019: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0x87802014  ! 2020: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902803  ! 2023: WRPR_PSTATE_I	wrpr	%r0, 0x0803, %pstate
	.word 0xc2800ae0  ! 2024: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r1
	.word 0x8dd02030  ! 2025: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xc2ffc02e  ! 2026: SWAPA_R	swapa	%r1, [%r31 + %r14] 0x01
	.word 0x9ba08dc9  ! 2027: FdMULq	fdmulq	
	.word 0x81982541  ! 2028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0541, %hpstate
	.word 0x87802014  ! 2029: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xda8008a0  ! 2030: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x81982908  ! 2031: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
	.word 0x94496001  ! 2032: MULX_I	mulx 	%r5, 0x0001, %r10
	.word 0x8bd02032  ! 2033: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x87802016  ! 2034: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902a40  ! 2035: WRPR_PSTATE_I	wrpr	%r0, 0x0a40, %pstate
	.word 0x9fa000c2  ! 2036: FNEGd	fnegd	%f2, %f46
DS_121:
	.word 0x22800001  ! 2038: BE	be,a	<label_0x1>
	.word 0xc3302001  ! 2038: STQF_I	-	%f1, [0x0001, %r0]
	.word 0x91458000  ! 2037: RD_SOFTINT_REG	rd	%softint, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01a66  ! 2039: FqTOi	fqtoi	
	.word 0x819827d2  ! 2040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d2, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
DS_122:
	.word 0x32800001  ! 2043: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b2830f  ! 2042: ALLIGNADDRESS	alignaddr	%r10, %r15, %r11
	.word 0xd617c000  ! 2043: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0xd6c004a0  ! 2044: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0x81982693  ! 2045: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0693, %hpstate
	.word 0x8ba08dc8  ! 2046: FdMULq	fdmulq	
	.word 0x8d9024d5  ! 2047: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	mov 0x32, %r30
	.word 0x97d0001e  ! 2048: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982387  ! 2049: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0387, %hpstate
	.word 0x86d18008  ! 2050: UMULcc_R	umulcc 	%r6, %r8, %r3
	.word 0xc6d7e010  ! 2051: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
	.word 0x81982e44  ! 2052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e44, %hpstate
	.word 0xc6ffc028  ! 2053: SWAPA_R	swapa	%r3, [%r31 + %r8] 0x01
	mov 0x35, %r30
	.word 0x81d0001e  ! 2054: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9e026001  ! 2055: ADD_I	add 	%r9, 0x0001, %r15
	.word 0xdec7e010  ! 2056: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	.word 0xdecfe020  ! 2057: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0x9c83e001  ! 2058: ADDcc_I	addcc 	%r15, 0x0001, %r14
	.word 0x836b800e  ! 2059: SDIVX_R	sdivx	%r14, %r14, %r1
	.word 0xc28008a0  ! 2060: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8d802004  ! 2061: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x99504000  ! 2062: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x81982441  ! 2063: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0441, %hpstate
	.word 0xd8800ae0  ! 2064: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b6ae001  ! 2066: SDIVX_I	sdivx	%r11, 0x0001, %r5
	.word 0xcb27c00e  ! 2067: STF_R	st	%f5, [%r14, %r31]
	.word 0xcac7e000  ! 2068: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r5
	.word 0x81982705  ! 2069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0705, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xca800b80  ! 2071: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r5
	.word 0x96d0a001  ! 2072: UMULcc_I	umulcc 	%r2, 0x0001, %r11
	.word 0x8c68a001  ! 2073: UDIVX_I	udivx 	%r2, 0x0001, %r6
	.word 0x86498009  ! 2074: MULX_R	mulx 	%r6, %r9, %r3
	.word 0xc68008a0  ! 2075: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x87a349e3  ! 2076: FDIVq	dis not found

	.word 0x8d90208b  ! 2077: WRPR_PSTATE_I	wrpr	%r0, 0x008b, %pstate
	.word 0x8d90240b  ! 2078: WRPR_PSTATE_I	wrpr	%r0, 0x040b, %pstate
	.word 0x9852c002  ! 2079: UMUL_R	umul 	%r11, %r2, %r12
	.word 0x87802004  ! 2080: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802088  ! 2081: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902459  ! 2082: WRPR_PSTATE_I	wrpr	%r0, 0x0459, %pstate
	.word 0xd807c000  ! 2083: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0x8d90204b  ! 2084: WRPR_PSTATE_I	wrpr	%r0, 0x004b, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9020de  ! 2086: WRPR_PSTATE_I	wrpr	%r0, 0x00de, %pstate
	.word 0x819825de  ! 2087: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05de, %hpstate
	.word 0xd88804a0  ! 2088: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x8d902e96  ! 2089: WRPR_PSTATE_I	wrpr	%r0, 0x0e96, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c4b8002  ! 2091: MULX_R	mulx 	%r14, %r2, %r6
	.word 0x8d9020df  ! 2092: WRPR_PSTATE_I	wrpr	%r0, 0x00df, %pstate
	.word 0x9b51c000  ! 2093: RDPR_TL	rdpr	%tl, %r13
	mov 0x35, %r30
	.word 0x87d0001e  ! 2094: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xda5fe001  ! 2095: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0x87802089  ! 2096: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x95a0054d  ! 2097: FSQRTd	fsqrt	
	.word 0x8d902091  ! 2098: WRPR_PSTATE_I	wrpr	%r0, 0x0091, %pstate
	mov 0x35, %r30
	.word 0x81d0001e  ! 2099: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902000  ! 2100: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	.word 0xd44fc000  ! 2101: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0x91a38dc6  ! 2102: FdMULq	fdmulq	
	.word 0x87802014  ! 2103: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x85692001  ! 2104: SDIVX_I	sdivx	%r4, 0x0001, %r2
	.word 0xc497e000  ! 2105: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r2
DS_123:
	.word 0x20800001  ! 2107: BN	bn,a	<label_0x1>
	.word 0xc732800a  ! 2107: STQF_R	-	%f3, [%r10, %r10]
	.word 0x91458000  ! 2106: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd0d00e60  ! 2107: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x30, %r30
	.word 0x9bd0001e  ! 2109: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd0dfe030  ! 2110: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x819824ce  ! 2111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
	.word 0x8d9020d2  ! 2112: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
	.word 0xd08fe020  ! 2113: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	.word 0x936a6001  ! 2114: SDIVX_I	sdivx	%r9, 0x0001, %r9
	.word 0x87802089  ! 2115: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982402  ! 2117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0402, %hpstate
	.word 0x8c7b000d  ! 2118: SDIV_R	sdiv 	%r12, %r13, %r6
	.word 0x81982a9b  ! 2119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xcc8008a0  ! 2120: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x81982a45  ! 2121: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a45, %hpstate
	.word 0x81982e98  ! 2122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0xcc800b40  ! 2123: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r6
	.word 0xccd004a0  ! 2124: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8fd02032  ! 2126: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0x80d18004  ! 2127: UMULcc_R	umulcc 	%r6, %r4, %r0
	.word 0x95504000  ! 2128: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x8d802000  ! 2129: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd44fe001  ! 2130: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802014  ! 2132: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x819827c9  ! 2133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c9, %hpstate
	.word 0xd4ffc024  ! 2134: SWAPA_R	swapa	%r10, [%r31 + %r4] 0x01
	.word 0x9f6bc008  ! 2135: SDIVX_R	sdivx	%r15, %r8, %r15
	.word 0xdf37e001  ! 2136: STQF_I	-	%f15, [0x0001, %r31]
	.word 0xdec7e010  ! 2137: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	ta	T_CHANGE_PRIV	! macro
DS_124:
	.word 0x20800001  ! 2140: BN	bn,a	<label_0x1>
	.word 0xd333c00c  ! 2140: STQF_R	-	%f9, [%r12, %r15]
	.word 0x87458000  ! 2139: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8d9028ce  ! 2140: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	mov 0x31, %r30
	.word 0x85d0001e  ! 2141: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc64fe001  ! 2144: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	ta	T_CHANGE_PRIV	! macro
	mov 0x31, %r30
	.word 0x8fd0001e  ! 2146: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 2147: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc697e020  ! 2148: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	.word 0x81982d1f  ! 2149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1f, %hpstate
	.word 0xc67fe001  ! 2150: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x82c1e001  ! 2151: ADDCcc_I	addccc 	%r7, 0x0001, %r1
	.word 0xc2dfe030  ! 2152: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	.word 0x8d802000  ! 2153: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9a486001  ! 2155: MULX_I	mulx 	%r1, 0x0001, %r13
	.word 0x20800001  ! 2156: BN	bn,a	<label_0x1>
	.word 0x24700001  ! 2157: BPLE	<illegal instruction>
	.word 0xdaffc02c  ! 2158: SWAPA_R	swapa	%r13, [%r31 + %r12] 0x01
DS_125:
	.word 0x20800001  ! 2160: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db30300  ! 2159: ALLIGNADDRESS	alignaddr	%r12, %r0, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcd97e001  ! 2161: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x83a01a61  ! 2162: FqTOi	fqtoi	
	.word 0x9448c005  ! 2163: MULX_R	mulx 	%r3, %r5, %r10
	.word 0x8fa389c6  ! 2164: FDIVd	fdivd	%f14, %f6, %f38
	.word 0x8d902e4a  ! 2165: WRPR_PSTATE_I	wrpr	%r0, 0x0e4a, %pstate
	.word 0x8fa309e1  ! 2166: FDIVq	dis not found

	.word 0xceffc021  ! 2167: SWAPA_R	swapa	%r7, [%r31 + %r1] 0x01
	.word 0xce77c001  ! 2168: STX_R	stx	%r7, [%r31 + %r1]
	.word 0xce800ae0  ! 2169: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
DS_126:
	.word 0x34800001  ! 2171: BG	bg,a	<label_0x1>
	.word 0xc7330009  ! 2171: STQF_R	-	%f3, [%r9, %r12]
	.word 0x87458000  ! 2170: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x34700001  ! 2171: BPG	<illegal instruction>
DS_127:
	.word 0x22800001  ! 2173: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b1c300  ! 2172: ALLIGNADDRESS	alignaddr	%r7, %r0, %r12
	.word 0x8d902642  ! 2173: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
DS_128:
	.word 0x32800001  ! 2175: BNE	bne,a	<label_0x1>
	.word 0xdb32a001  ! 2175: STQF_I	-	%f13, [0x0001, %r10]
	.word 0x8b458000  ! 2174: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x85a389c0  ! 2175: FDIVd	fdivd	%f14, %f0, %f2
	.word 0x99508000  ! 2176: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x81982b5a  ! 2177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
	.word 0xd917c000  ! 2178: LDQF_R	-	[%r31, %r0], %f12
	.word 0x87802004  ! 2179: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982099  ! 2180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0099, %hpstate
	.word 0x81982fcb  ! 2181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcb, %hpstate
DS_129:
	.word 0x34800001  ! 2183: BG	bg,a	<label_0x1>
	.word 0xc130400e  ! 2183: STQF_R	-	%f0, [%r14, %r1]
	.word 0x85458000  ! 2182: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x9dd02030  ! 2183: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0xc537e001  ! 2184: STQF_I	-	%f2, [0x0001, %r31]
	.word 0x8d802000  ! 2185: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982557  ! 2186: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0557, %hpstate
	.word 0xc427c00e  ! 2187: STW_R	stw	%r2, [%r31 + %r14]
	.word 0x8d902cdf  ! 2188: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	.word 0x9150c000  ! 2189: RDPR_TT	rdpr	%tt, %r8
	.word 0x81a049c9  ! 2190: FDIVd	fdivd	%f32, %f40, %f0
	.word 0x847b2001  ! 2191: SDIV_I	sdiv 	%r12, 0x0001, %r2
	.word 0x819827c0  ! 2192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c0, %hpstate
DS_130:
	.word 0x32800001  ! 2194: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b08306  ! 2193: ALLIGNADDRESS	alignaddr	%r2, %r6, %r10
	.word 0x819824d0  ! 2194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d0, %hpstate
	.word 0x81982d08  ! 2195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
	.word 0x8dd02031  ! 2196: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81d02032  ! 2198: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 2199: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x94d22001  ! 2200: UMULcc_I	umulcc 	%r8, 0x0001, %r10
DS_131:
	.word 0x22800001  ! 2202: BE	be,a	<label_0x1>
	.word 0xc7330007  ! 2202: STQF_R	-	%f3, [%r7, %r12]
	.word 0x91458000  ! 2201: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd08008a0  ! 2202: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0d7e010  ! 2203: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	.word 0x8dd02033  ! 2204: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x22700001  ! 2205: BPE	<illegal instruction>
	.word 0xd057e001  ! 2206: LDSH_I	ldsh	[%r31 + 0x0001], %r8
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x98db8004  ! 2209: SMULcc_R	smulcc 	%r14, %r4, %r12
	.word 0x8d902c97  ! 2210: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
	.word 0x81982440  ! 2211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0440, %hpstate
	.word 0x8e4bc00f  ! 2212: MULX_R	mulx 	%r15, %r15, %r7
	.word 0x8d902c03  ! 2213: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	.word 0xcedfe000  ! 2214: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0x8b696001  ! 2215: SDIVX_I	sdivx	%r5, 0x0001, %r5
	.word 0x8d9028db  ! 2216: WRPR_PSTATE_I	wrpr	%r0, 0x08db, %pstate
	.word 0xcad7e030  ! 2217: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
DS_132:
	.word 0x22800001  ! 2219: BE	be,a	<label_0x1>
	.word 0xc733400f  ! 2219: STQF_R	-	%f3, [%r15, %r13]
	.word 0x93458000  ! 2218: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x81982c1a  ! 2219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1a, %hpstate
	mov 0x33, %r30
	.word 0x95d0001e  ! 2220: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 2221: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd2d7e020  ! 2222: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r9
	mov 0x33, %r30
	.word 0x9dd0001e  ! 2223: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x9951c000  ! 2224: RDPR_TL	rdpr	%tl, %r12
	.word 0x9453000b  ! 2225: UMUL_R	umul 	%r12, %r11, %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9fa000c8  ! 2227: FNEGd	fnegd	%f8, %f46
	.word 0x94db8002  ! 2228: SMULcc_R	smulcc 	%r14, %r2, %r10
	mov 0x34, %r30
	.word 0x85d0001e  ! 2229: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8b500000  ! 2230: RDPR_TPC	rdpr	%tpc, %r5
	.word 0xcb17c000  ! 2231: LDQF_R	-	[%r31, %r0], %f5
DS_133:
	.word 0x20800001  ! 2233: BN	bn,a	<label_0x1>
	.word 0xd131a001  ! 2233: STQF_I	-	%f8, [0x0001, %r6]
	.word 0x95458000  ! 2232: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd41fe001  ! 2233: LDD_I	ldd	[%r31 + 0x0001], %r10
DS_134:
	.word 0x32800001  ! 2235: BNE	bne,a	<label_0x1>
	.word 0xcb328009  ! 2235: STQF_R	-	%f5, [%r9, %r10]
	.word 0x89458000  ! 2234: RD_SOFTINT_REG	rd	%softint, %r4
DS_135:
	.word 0x34800001  ! 2236: BG	bg,a	<label_0x1>
	.word 0xd7302001  ! 2236: STQF_I	-	%f11, [0x0001, %r0]
	.word 0x85458000  ! 2235: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8169a001  ! 2236: SDIVX_I	sdivx	%r6, 0x0001, %r0
	.word 0x8d902ed7  ! 2237: WRPR_PSTATE_I	wrpr	%r0, 0x0ed7, %pstate
	.word 0x81982002  ! 2238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0002, %hpstate
	.word 0x9f50c000  ! 2239: RDPR_TT	rdpr	%tt, %r15
	.word 0x87802089  ! 2240: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902e1f  ! 2241: WRPR_PSTATE_I	wrpr	%r0, 0x0e1f, %pstate
	.word 0x8d902c1e  ! 2242: WRPR_PSTATE_I	wrpr	%r0, 0x0c1e, %pstate
	.word 0x8d6b4004  ! 2243: SDIVX_R	sdivx	%r13, %r4, %r6
	.word 0x8079a001  ! 2244: SDIV_I	sdiv 	%r6, 0x0001, %r0
	.word 0x8ba34dc0  ! 2245: FdMULq	fdmulq	
	.word 0xca880e40  ! 2246: LDUBA_R	lduba	[%r0, %r0] 0x72, %r5
	.word 0x81982113  ! 2247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0113, %hpstate
	.word 0x81982556  ! 2248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0556, %hpstate
DS_136:
	.word 0x22800001  ! 2250: BE	be,a	<label_0x1>
	illtrap
	.word 0x89b2c30e  ! 2249: ALLIGNADDRESS	alignaddr	%r11, %r14, %r4
	.word 0xc8800c60  ! 2250: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r4
	.word 0xc937e001  ! 2251: STQF_I	-	%f4, [0x0001, %r31]
	.word 0x95d02033  ! 2252: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x9bd02031  ! 2253: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0xc857c000  ! 2254: LDSH_R	ldsh	[%r31 + %r0], %r4
DS_137:
	.word 0x22800001  ! 2256: BE	be,a	<label_0x1>
	.word 0xd331c004  ! 2256: STQF_R	-	%f9, [%r4, %r7]
	.word 0x8d458000  ! 2255: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xccc80e60  ! 2256: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r6
	.word 0x8d902a9d  ! 2257: WRPR_PSTATE_I	wrpr	%r0, 0x0a9d, %pstate
	.word 0x8d802000  ! 2258: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902ecc  ! 2259: WRPR_PSTATE_I	wrpr	%r0, 0x0ecc, %pstate
	mov 0x35, %r30
	.word 0x89d0001e  ! 2260: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8198290e  ! 2261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090e, %hpstate
	.word 0x9478400f  ! 2262: SDIV_R	sdiv 	%r1, %r15, %r10
	.word 0xd527e001  ! 2263: STF_I	st	%f10, [0x0001, %r31]
	.word 0x8d902e00  ! 2264: WRPR_PSTATE_I	wrpr	%r0, 0x0e00, %pstate
	.word 0xd407e001  ! 2265: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x24800001  ! 2266: BLE	ble,a	<label_0x1>
	.word 0xd48008a0  ! 2267: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8da01a6f  ! 2268: FqTOi	fqtoi	
	.word 0x8198290f  ! 2269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090f, %hpstate
	.word 0x8d9024c2  ! 2270: WRPR_PSTATE_I	wrpr	%r0, 0x04c2, %pstate
	.word 0xcc8008a0  ! 2271: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x99a04dc1  ! 2272: FdMULq	fdmulq	
	.word 0x84792001  ! 2273: SDIV_I	sdiv 	%r4, 0x0001, %r2
	.word 0x94d32001  ! 2274: UMULcc_I	umulcc 	%r12, 0x0001, %r10
	.word 0xd4d7e020  ! 2275: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0x8e7a6001  ! 2276: SDIV_I	sdiv 	%r9, 0x0001, %r7
DS_138:
	.word 0x22800001  ! 2278: BE	be,a	<label_0x1>
	.word 0xdb322001  ! 2278: STQF_I	-	%f13, [0x0001, %r8]
	.word 0x9f458000  ! 2277: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x9f686001  ! 2278: SDIVX_I	sdivx	%r1, 0x0001, %r15
	.word 0x93a249a2  ! 2279: FDIVs	fdivs	%f9, %f2, %f9
DS_139:
	.word 0x32800001  ! 2281: BNE	bne,a	<label_0x1>
	.word 0xd9324006  ! 2281: STQF_R	-	%f12, [%r6, %r9]
	.word 0x91458000  ! 2280: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8198265b  ! 2281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065b, %hpstate
	.word 0x87802004  ! 2282: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02035  ! 2284: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x89a189c2  ! 2285: FDIVd	fdivd	%f6, %f2, %f4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc89004a0  ! 2287: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x8d90224d  ! 2288: WRPR_PSTATE_I	wrpr	%r0, 0x024d, %pstate
	.word 0x9169c004  ! 2289: SDIVX_R	sdivx	%r7, %r4, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd127c004  ! 2291: STF_R	st	%f8, [%r4, %r31]
	.word 0x9601a001  ! 2292: ADD_I	add 	%r6, 0x0001, %r11
	.word 0x83504000  ! 2293: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x819828d7  ! 2294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d7, %hpstate
	.word 0x9cd24005  ! 2295: UMULcc_R	umulcc 	%r9, %r5, %r14
	.word 0x9dd02034  ! 2296: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xdcd00e80  ! 2297: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 2299: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d90261c  ! 2300: WRPR_PSTATE_I	wrpr	%r0, 0x061c, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 2302: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83a08dc9  ! 2303: FdMULq	fdmulq	
	.word 0x84d3e001  ! 2304: UMULcc_I	umulcc 	%r15, 0x0001, %r2
	.word 0x8d494000  ! 2305: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x8d902e08  ! 2306: WRPR_PSTATE_I	wrpr	%r0, 0x0e08, %pstate
	.word 0x3c700001  ! 2307: BPPOS	<illegal instruction>
	.word 0x9f69a001  ! 2308: SDIVX_I	sdivx	%r6, 0x0001, %r15
	.word 0x81982ac8  ! 2309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac8, %hpstate
	.word 0xde8008a0  ! 2310: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0xde8008a0  ! 2311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x3a800001  ! 2312: BCC	bcc,a	<label_0x1>
	.word 0x81982012  ! 2313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0012, %hpstate
	.word 0x819820c6  ! 2314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c6, %hpstate
	.word 0x8883800b  ! 2315: ADDcc_R	addcc 	%r14, %r11, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc88fe030  ! 2317: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0x8b6a0003  ! 2318: SDIVX_R	sdivx	%r8, %r3, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x95d02032  ! 2320: Tcc_I	tg	icc_or_xcc, %r0 + 50
	mov 0x35, %r30
	.word 0x93d0001e  ! 2321: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2322: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24800001  ! 2323: BLE	ble,a	<label_0x1>
	mov 0x31, %r30
	.word 0x9dd0001e  ! 2324: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xca4fe001  ! 2325: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	mov 0x35, %r30
	.word 0x9fd0001e  ! 2326: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x819827c9  ! 2327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c9, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802089  ! 2330: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802004  ! 2331: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2a700001  ! 2332: BPCS	<illegal instruction>
	.word 0x86d1c00b  ! 2333: UMULcc_R	umulcc 	%r7, %r11, %r3
DS_140:
	.word 0x34800001  ! 2335: BG	bg,a	<label_0x1>
	.word 0xc731e001  ! 2335: STQF_I	-	%f3, [0x0001, %r7]
	.word 0x99458000  ! 2334: RD_SOFTINT_REG	rd	%softint, %r12
	mov 0x35, %r30
	.word 0x8fd0001e  ! 2335: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 2336: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d902a03  ! 2337: WRPR_PSTATE_I	wrpr	%r0, 0x0a03, %pstate
	.word 0x8d802000  ! 2338: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x35, %r30
	.word 0x97d0001e  ! 2339: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x89d02031  ! 2340: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0x9dd02034  ! 2341: Tcc_I	tpos	icc_or_xcc, %r0 + 52
DS_141:
	.word 0x22800001  ! 2343: BE	be,a	<label_0x1>
	.word 0xc933000b  ! 2343: STQF_R	-	%f4, [%r11, %r12]
	.word 0x8b458000  ! 2342: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x87802004  ! 2343: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9028d7  ! 2344: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
	.word 0x8d802004  ! 2345: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_142:
	.word 0x34800001  ! 2347: BG	bg,a	<label_0x1>
	.word 0xd5306001  ! 2347: STQF_I	-	%f10, [0x0001, %r1]
	.word 0x81458000  ! 2346: RD_SOFTINT_REG	stbar
	.word 0x8d90281a  ! 2347: WRPR_PSTATE_I	wrpr	%r0, 0x081a, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982fd1  ! 2349: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	.word 0x80822001  ! 2350: ADDcc_I	addcc 	%r8, 0x0001, %r0
	.word 0x8d9026d4  ! 2351: WRPR_PSTATE_I	wrpr	%r0, 0x06d4, %pstate
	.word 0x8d802004  ! 2352: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc0800ae0  ! 2353: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r0
	mov 0x32, %r30
	.word 0x8dd0001e  ! 2354: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2355: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc0dfe010  ! 2356: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r0
DS_143:
	.word 0x22800001  ! 2358: BE	be,a	<label_0x1>
	.word 0xd932c00b  ! 2358: STQF_R	-	%f12, [%r11, %r11]
	.word 0x8d458000  ! 2357: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x3e800001  ! 2358: BVC	bvc,a	<label_0x1>
	.word 0x8a4b000d  ! 2359: MULX_R	mulx 	%r12, %r13, %r5
	.word 0x81982c8d  ! 2360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8d, %hpstate
	.word 0x81982e13  ! 2361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e13, %hpstate
	.word 0x95d02031  ! 2362: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x81982e07  ! 2363: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e07, %hpstate
	.word 0x956b2001  ! 2364: SDIVX_I	sdivx	%r12, 0x0001, %r10
	.word 0xd4800b40  ! 2365: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r10
	.word 0x81982184  ! 2366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0184, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
DS_144:
	.word 0x20800001  ! 2369: BN	bn,a	<label_0x1>
	illtrap
	.word 0x97b00305  ! 2368: ALLIGNADDRESS	alignaddr	%r0, %r5, %r11
	ta	T_CHANGE_HPRIV	! macro
	.word 0x94d10009  ! 2370: UMULcc_R	umulcc 	%r4, %r9, %r10
	.word 0x96d3c00d  ! 2371: UMULcc_R	umulcc 	%r15, %r13, %r11
	.word 0xd6d804a0  ! 2372: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8fd02030  ! 2373: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 2374: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902659  ! 2375: WRPR_PSTATE_I	wrpr	%r0, 0x0659, %pstate
	.word 0x9e510008  ! 2376: UMUL_R	umul 	%r4, %r8, %r15
	.word 0x87802016  ! 2377: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x83d02031  ! 2378: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x81982e9c  ! 2379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9c, %hpstate
	.word 0x8198259b  ! 2380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059b, %hpstate
	.word 0xde8008a0  ! 2381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x83a00542  ! 2382: FSQRTd	fsqrt	
	.word 0x8ac12001  ! 2383: ADDCcc_I	addccc 	%r4, 0x0001, %r5
	.word 0xca8804a0  ! 2384: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0xca3fc002  ! 2385: STD_R	std	%r5, [%r31 + %r2]
	.word 0x8d902885  ! 2386: WRPR_PSTATE_I	wrpr	%r0, 0x0885, %pstate
	.word 0x81982e11  ! 2387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e11, %hpstate
	.word 0x89a000c1  ! 2388: FNEGd	fnegd	%f32, %f4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc8ffc021  ! 2390: SWAPA_R	swapa	%r4, [%r31 + %r1] 0x01
	.word 0x38800001  ! 2391: BGU	bgu,a	<label_0x1>
	.word 0xc817c000  ! 2392: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0xc8c7e010  ! 2393: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
	.word 0xc937e001  ! 2394: STQF_I	-	%f4, [0x0001, %r31]
	.word 0x8f500000  ! 2395: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x8d90265a  ! 2396: WRPR_PSTATE_I	wrpr	%r0, 0x065a, %pstate
	.word 0xce0fc000  ! 2397: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0x8d90200e  ! 2398: WRPR_PSTATE_I	wrpr	%r0, 0x000e, %pstate
	.word 0x8d902059  ! 2399: WRPR_PSTATE_I	wrpr	%r0, 0x0059, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9fa000c7  ! 2401: FNEGd	fnegd	%f38, %f46
	.word 0x8d802000  ! 2402: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x80832001  ! 2404: ADDcc_I	addcc 	%r12, 0x0001, %r0
	.word 0x92c32001  ! 2405: ADDCcc_I	addccc 	%r12, 0x0001, %r9
	.word 0xd21fc000  ! 2406: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x87802014  ! 2407: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd3e7c027  ! 2408: CASA_I	casa	[%r31] 0x 1, %r7, %r9
	.word 0x81982056  ! 2409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0056, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd29fc020  ! 2411: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0x30800001  ! 2412: BA	ba,a	<label_0x1>
	.word 0x2a700001  ! 2413: BPCS	<illegal instruction>
	.word 0x8d802000  ! 2414: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd21fc000  ! 2415: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x819821df  ! 2416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
	.word 0x8683c007  ! 2417: ADDcc_R	addcc 	%r15, %r7, %r3
	.word 0x81982917  ! 2418: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0917, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89d02035  ! 2420: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x95d02030  ! 2421: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0xc6d00e80  ! 2422: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r3
	.word 0x83a0054e  ! 2423: FSQRTd	fsqrt	
	.word 0x987b2001  ! 2424: SDIV_I	sdiv 	%r12, 0x0001, %r12
DS_145:
	.word 0x20800001  ! 2426: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb28302  ! 2425: ALLIGNADDRESS	alignaddr	%r10, %r2, %r7
	.word 0x9a808004  ! 2426: ADDcc_R	addcc 	%r2, %r4, %r13
	.word 0x9dd02030  ! 2427: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 2428: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xda57c000  ! 2429: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x87682001  ! 2430: SDIVX_I	sdivx	%r0, 0x0001, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02033  ! 2432: Tcc_I	te	icc_or_xcc, %r0 + 51
	mov 0x32, %r30
	.word 0x85d0001e  ! 2433: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc6cfe010  ! 2434: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	.word 0x8d802000  ! 2435: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x9bd0001e  ! 2437: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc65fe001  ! 2438: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0xc677e001  ! 2439: STX_I	stx	%r3, [%r31 + 0x0001]
	.word 0x88692001  ! 2440: UDIVX_I	udivx 	%r4, 0x0001, %r4
	.word 0x8e7bc00f  ! 2441: SDIV_R	sdiv 	%r15, %r15, %r7
	mov 0x32, %r30
	.word 0x9dd0001e  ! 2442: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xce8008a0  ! 2443: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcf17c000  ! 2445: LDQF_R	-	[%r31, %r0], %f7
	.word 0x97a389ac  ! 2446: FDIVs	fdivs	%f14, %f12, %f11
	.word 0x97500000  ! 2447: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x81982414  ! 2448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0414, %hpstate
	.word 0x9469a001  ! 2449: UDIVX_I	udivx 	%r6, 0x0001, %r10
	.word 0x9fd02033  ! 2450: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x81982545  ! 2451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0545, %hpstate
	.word 0x8a6b8008  ! 2452: UDIVX_R	udivx 	%r14, %r8, %r5
	.word 0x9fd02030  ! 2453: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x866ba001  ! 2455: UDIVX_I	udivx 	%r14, 0x0001, %r3
	.word 0x9a6b400c  ! 2456: UDIVX_R	udivx 	%r13, %r12, %r13
	.word 0xdad804a0  ! 2457: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xdaffc02c  ! 2458: SWAPA_R	swapa	%r13, [%r31 + %r12] 0x01
	.word 0xda800b60  ! 2459: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r13
	.word 0x2c700001  ! 2460: BPNEG	<illegal instruction>
	.word 0xda8008a0  ! 2461: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
DS_146:
	.word 0x20800001  ! 2463: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b30302  ! 2462: ALLIGNADDRESS	alignaddr	%r12, %r2, %r10
	.word 0x87d02031  ! 2463: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x91494000  ! 2464: RDHPR_HTBA	rdhpr	%htba, %r8
	mov 0x33, %r30
	.word 0x95d0001e  ! 2465: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d90229a  ! 2466: WRPR_PSTATE_I	wrpr	%r0, 0x029a, %pstate
DS_147:
	.word 0x32800001  ! 2468: BNE	bne,a	<label_0x1>
	.word 0xcb30400f  ! 2468: STQF_R	-	%f5, [%r15, %r1]
	.word 0x8b458000  ! 2467: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d802000  ! 2468: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 2469: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9026cd  ! 2471: WRPR_PSTATE_I	wrpr	%r0, 0x06cd, %pstate
	.word 0xca5fc000  ! 2472: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xcad80e60  ! 2473: LDXA_R	ldxa	[%r0, %r0] 0x73, %r5
	.word 0x81982a87  ! 2474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0xcadfe020  ! 2475: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	.word 0xca27c00f  ! 2476: STW_R	stw	%r5, [%r31 + %r15]
	.word 0x8d802000  ! 2477: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x34700001  ! 2478: BPG	<illegal instruction>
	.word 0x3c700001  ! 2479: BPPOS	<illegal instruction>
	mov 0x30, %r30
	.word 0x9dd0001e  ! 2480: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x9a492001  ! 2481: MULX_I	mulx 	%r4, 0x0001, %r13
	mov 0x35, %r30
	.word 0x85d0001e  ! 2482: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8b494000  ! 2483: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x81982207  ! 2484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0207, %hpstate
DS_148:
	.word 0x34800001  ! 2486: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b28306  ! 2485: ALLIGNADDRESS	alignaddr	%r10, %r6, %r1
	.word 0x81982046  ! 2486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0046, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc27fe001  ! 2488: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x8d802000  ! 2489: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc27fe001  ! 2491: SWAP_I	swap	%r1, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8da00560  ! 2493: FSQRTq	fsqrt	
	.word 0xccc00e60  ! 2494: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r6
	.word 0x2c800001  ! 2495: BNEG	bneg,a	<label_0x1>
	.word 0x81982649  ! 2496: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0649, %hpstate
	mov 0x33, %r30
	.word 0x99d0001e  ! 2497: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d90261d  ! 2498: WRPR_PSTATE_I	wrpr	%r0, 0x061d, %pstate
	.word 0x9ac16001  ! 2499: ADDCcc_I	addccc 	%r5, 0x0001, %r13
	.word 0x8198264a  ! 2500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064a, %hpstate
	.word 0xdaffc020  ! 2501: SWAPA_R	swapa	%r13, [%r31 + %r0] 0x01
	.word 0x86822001  ! 2502: ADDcc_I	addcc 	%r8, 0x0001, %r3
	.word 0x8198278f  ! 2503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078f, %hpstate
	.word 0xc6ffc020  ! 2504: SWAPA_R	swapa	%r3, [%r31 + %r0] 0x01
	.word 0xc6d7e010  ! 2505: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
	.word 0x91a389a4  ! 2506: FDIVs	fdivs	%f14, %f4, %f8
	.word 0xd0c7e020  ! 2507: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
DS_149:
	.word 0x20800001  ! 2509: BN	bn,a	<label_0x1>
	.word 0xd1314004  ! 2509: STQF_R	-	%f8, [%r4, %r5]
	.word 0x8f458000  ! 2508: RD_SOFTINT_REG	rd	%softint, %r7
DS_150:
	.word 0x22800001  ! 2510: BE	be,a	<label_0x1>
	.word 0xc732e001  ! 2510: STQF_I	-	%f3, [0x0001, %r11]
	.word 0x8b458000  ! 2509: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xcaffc024  ! 2510: SWAPA_R	swapa	%r5, [%r31 + %r4] 0x01
	.word 0x28800001  ! 2511: BLEU	bleu,a	<label_0x1>
	.word 0x8ba000c7  ! 2512: FNEGd	fnegd	%f38, %f36
	.word 0x87802080  ! 2513: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9481e001  ! 2514: ADDcc_I	addcc 	%r7, 0x0001, %r10
	.word 0x8d802000  ! 2515: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982016  ! 2516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0016, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4800c80  ! 2518: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0xd4d7e030  ! 2519: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0xd4c804a0  ! 2520: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0xd497e000  ! 2522: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd4c00e60  ! 2523: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
	.word 0xd537c007  ! 2524: STQF_R	-	%f10, [%r7, %r31]
	.word 0xd48008a0  ! 2525: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d902e9a  ! 2526: WRPR_PSTATE_I	wrpr	%r0, 0x0e9a, %pstate
	.word 0xd4ffc027  ! 2527: SWAPA_R	swapa	%r10, [%r31 + %r7] 0x01
	.word 0xd417e001  ! 2528: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0x96c1a001  ! 2529: ADDCcc_I	addccc 	%r6, 0x0001, %r11
DS_151:
	.word 0x22800001  ! 2531: BE	be,a	<label_0x1>
	illtrap
	.word 0x85b38309  ! 2530: ALLIGNADDRESS	alignaddr	%r14, %r9, %r2
	.word 0x8d802004  ! 2531: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x96832001  ! 2533: ADDcc_I	addcc 	%r12, 0x0001, %r11
	.word 0xd727c009  ! 2534: STF_R	st	%f11, [%r9, %r31]
	.word 0xd727e001  ! 2535: STF_I	st	%f11, [0x0001, %r31]
	.word 0x8d9020dd  ! 2536: WRPR_PSTATE_I	wrpr	%r0, 0x00dd, %pstate
	.word 0xd647e001  ! 2537: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x85508000  ! 2538: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x8ad0a001  ! 2539: UMULcc_I	umulcc 	%r2, 0x0001, %r5
	.word 0x8d9022c7  ! 2540: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0x8d902e43  ! 2541: WRPR_PSTATE_I	wrpr	%r0, 0x0e43, %pstate
	.word 0x30800001  ! 2542: BA	ba,a	<label_0x1>
	.word 0x81982992  ! 2543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0992, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x3e700001  ! 2545: BPVC	<illegal instruction>
	.word 0x8d802000  ! 2546: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xca2fc009  ! 2547: STB_R	stb	%r5, [%r31 + %r9]
	.word 0xca1fe001  ! 2548: LDD_I	ldd	[%r31 + 0x0001], %r5
	ta	T_CHANGE_PRIV	! macro
	mov 0x31, %r30
	.word 0x89d0001e  ! 2550: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d902216  ! 2551: WRPR_PSTATE_I	wrpr	%r0, 0x0216, %pstate
	.word 0x9dd02031  ! 2552: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802010  ! 2554: WRASI_I	wr	%r0, 0x0010, %asi
DS_152:
	.word 0x34800001  ! 2556: BG	bg,a	<label_0x1>
	.word 0xd5332001  ! 2556: STQF_I	-	%f10, [0x0001, %r12]
	.word 0x85458000  ! 2555: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8d902c00  ! 2556: WRPR_PSTATE_I	wrpr	%r0, 0x0c00, %pstate
	.word 0x8d50c000  ! 2557: RDPR_TT	rdpr	%tt, %r6
	.word 0xcc7fe001  ! 2558: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x9d504000  ! 2559: RDPR_TNPC	rdpr	%tnpc, %r14
	.word 0xdc27c009  ! 2560: STW_R	stw	%r14, [%r31 + %r9]
	.word 0xdc57c000  ! 2561: LDSH_R	ldsh	[%r31 + %r0], %r14
	.word 0xdd3fc009  ! 2562: STDF_R	std	%f14, [%r9, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84c0e001  ! 2564: ADDCcc_I	addccc 	%r3, 0x0001, %r2
	.word 0x819821ca  ! 2565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ca, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819824cc  ! 2567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cc, %hpstate
	mov 0x30, %r30
	.word 0x9fd0001e  ! 2568: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc48008a0  ! 2569: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8d902c04  ! 2570: WRPR_PSTATE_I	wrpr	%r0, 0x0c04, %pstate
DS_153:
	.word 0x32800001  ! 2572: BNE	bne,a	<label_0x1>
	.word 0xd5312001  ! 2572: STQF_I	-	%f10, [0x0001, %r4]
	.word 0x87458000  ! 2571: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc6bfc029  ! 2572: STDA_R	stda	%r3, [%r31 + %r9] 0x01
	.word 0x81982d1b  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1b, %hpstate
	.word 0x9edb8002  ! 2574: SMULcc_R	smulcc 	%r14, %r2, %r15
	.word 0x8da00560  ! 2575: FSQRTq	fsqrt	
	.word 0x99a01a6f  ! 2576: FqTOi	fqtoi	
DS_154:
	.word 0x34800001  ! 2578: BG	bg,a	<label_0x1>
	.word 0xd7324004  ! 2578: STQF_R	-	%f11, [%r4, %r9]
	.word 0x91458000  ! 2577: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x89d02031  ! 2578: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0xd08804a0  ! 2579: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x85d02033  ! 2580: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x95d02035  ! 2581: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x81982cc2  ! 2582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
	.word 0x96784009  ! 2583: SDIV_R	sdiv 	%r1, %r9, %r11
	.word 0xd61fc000  ! 2584: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x806a6001  ! 2585: UDIVX_I	udivx 	%r9, 0x0001, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc07fe001  ! 2587: SWAP_I	swap	%r0, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x9878000b  ! 2589: SDIV_R	sdiv 	%r0, %r11, %r12
	.word 0x8d902a8f  ! 2590: WRPR_PSTATE_I	wrpr	%r0, 0x0a8f, %pstate
	.word 0x9678e001  ! 2591: SDIV_I	sdiv 	%r3, 0x0001, %r11
	.word 0x87802014  ! 2592: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902295  ! 2593: WRPR_PSTATE_I	wrpr	%r0, 0x0295, %pstate
DS_155:
	.word 0x32800001  ! 2595: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b00304  ! 2594: ALLIGNADDRESS	alignaddr	%r0, %r4, %r10
	.word 0x8e7ba001  ! 2595: SDIV_I	sdiv 	%r14, 0x0001, %r7
	.word 0x8d802000  ! 2596: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce880e80  ! 2597: LDUBA_R	lduba	[%r0, %r0] 0x74, %r7
	.word 0x9fd02032  ! 2598: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x81982ed6  ! 2599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed6, %hpstate
	.word 0x8d90260b  ! 2600: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0x81982e81  ! 2601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e81, %hpstate
	.word 0x99a009e5  ! 2602: FDIVq	dis not found

	.word 0xd83fe001  ! 2603: STD_I	std	%r12, [%r31 + 0x0001]
	.word 0x8d902c1f  ! 2604: WRPR_PSTATE_I	wrpr	%r0, 0x0c1f, %pstate
	.word 0xd81fe001  ! 2605: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0x81982f99  ! 2606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0x904b0004  ! 2607: MULX_R	mulx 	%r12, %r4, %r8
	.word 0xd05fc000  ! 2608: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd09004a0  ! 2609: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x87d02033  ! 2610: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x81982e92  ! 2611: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e92, %hpstate
	.word 0x9480c00e  ! 2612: ADDcc_R	addcc 	%r3, %r14, %r10
	.word 0x95a189a2  ! 2613: FDIVs	fdivs	%f6, %f2, %f10
	.word 0xd4c7e000  ! 2614: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd4800b60  ! 2616: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r10
	.word 0xd4cfe000  ! 2617: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	.word 0x87802004  ! 2618: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9c6b6001  ! 2619: UDIVX_I	udivx 	%r13, 0x0001, %r14
	.word 0xdcd004a0  ! 2620: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	.word 0x81982281  ! 2621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0281, %hpstate
	.word 0x93d02034  ! 2622: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x864be001  ! 2623: MULX_I	mulx 	%r15, 0x0001, %r3
	.word 0x8d902ac3  ! 2624: WRPR_PSTATE_I	wrpr	%r0, 0x0ac3, %pstate
	.word 0x8d9020dd  ! 2625: WRPR_PSTATE_I	wrpr	%r0, 0x00dd, %pstate
	.word 0x8ada4008  ! 2626: SMULcc_R	smulcc 	%r9, %r8, %r5
DS_156:
	.word 0x22800001  ! 2628: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b30302  ! 2627: ALLIGNADDRESS	alignaddr	%r12, %r2, %r10
	.word 0x2e800001  ! 2628: BVS	bvs,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198210d  ! 2631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010d, %hpstate
	.word 0x97a000cd  ! 2632: FNEGd	fnegd	%f44, %f42
	mov 0x32, %r30
	.word 0x83d0001e  ! 2633: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982d13  ! 2634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0x8198259b  ! 2635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059b, %hpstate
	.word 0xd6cfe000  ! 2636: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0x8d90221d  ! 2637: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	ta	T_CHANGE_TO_TL0	! macro
DS_157:
	.word 0x34800001  ! 2640: BG	bg,a	<label_0x1>
	.word 0xcf312001  ! 2640: STQF_I	-	%f7, [0x0001, %r4]
	.word 0x93458000  ! 2639: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd28fe020  ! 2640: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	.word 0xd28008a0  ! 2641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d90220e  ! 2642: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x97d02031  ! 2645: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x97a00540  ! 2646: FSQRTd	fsqrt	
	.word 0x906a4009  ! 2647: UDIVX_R	udivx 	%r9, %r9, %r8
	.word 0xd09004a0  ! 2648: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd097e030  ! 2649: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	.word 0x81982908  ! 2650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
	.word 0x97a00568  ! 2651: FSQRTq	fsqrt	
	.word 0x90782001  ! 2652: SDIV_I	sdiv 	%r0, 0x0001, %r8
	.word 0xd0d00e80  ! 2653: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r8
	.word 0x8d902897  ! 2654: WRPR_PSTATE_I	wrpr	%r0, 0x0897, %pstate
	.word 0xd05fc000  ! 2655: LDX_R	ldx	[%r31 + %r0], %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982785  ! 2657: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
	.word 0x819821dc  ! 2658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dc, %hpstate
	.word 0x36800001  ! 2659: BGE	bge,a	<label_0x1>
	.word 0x81982e07  ! 2660: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e07, %hpstate
	.word 0xd0900e60  ! 2661: LDUHA_R	lduha	[%r0, %r0] 0x73, %r8
	.word 0x8bd02030  ! 2662: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8d902246  ! 2663: WRPR_PSTATE_I	wrpr	%r0, 0x0246, %pstate
	.word 0xd047e001  ! 2664: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0xd03fe001  ! 2665: STD_I	std	%r8, [%r31 + 0x0001]
	.word 0xd01fe001  ! 2666: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x8f6a000a  ! 2667: SDIVX_R	sdivx	%r8, %r10, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902887  ! 2669: WRPR_PSTATE_I	wrpr	%r0, 0x0887, %pstate
	.word 0x87802089  ! 2670: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xcec7e010  ! 2671: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	.word 0xcedfe030  ! 2672: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	.word 0xcedfe000  ! 2673: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	mov 0x33, %r30
	.word 0x93d0001e  ! 2674: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f6bc00b  ! 2675: SDIVX_R	sdivx	%r15, %r11, %r7
	.word 0x8283a001  ! 2676: ADDcc_I	addcc 	%r14, 0x0001, %r1
	.word 0x8d902202  ! 2677: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
	.word 0x82c0a001  ! 2678: ADDCcc_I	addccc 	%r2, 0x0001, %r1
	.word 0xc327e001  ! 2679: STF_I	st	%f1, [0x0001, %r31]
	.word 0xc2d804a0  ! 2680: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	mov 0x32, %r30
	.word 0x87d0001e  ! 2681: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802088  ! 2683: WRASI_I	wr	%r0, 0x0088, %asi
	mov 0x32, %r30
	.word 0x8bd0001e  ! 2684: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 2685: BL	bl,a	<label_0x1>
DS_158:
	.word 0x20800001  ! 2687: BN	bn,a	<label_0x1>
	.word 0xc5330009  ! 2687: STQF_R	-	%f2, [%r9, %r12]
	.word 0x81458000  ! 2686: RD_SOFTINT_REG	stbar
	.word 0x8d902c53  ! 2687: WRPR_PSTATE_I	wrpr	%r0, 0x0c53, %pstate
	.word 0xc09fc020  ! 2688: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0xc127e001  ! 2689: STF_I	st	%f0, [0x0001, %r31]
	.word 0xc127e001  ! 2690: STF_I	st	%f0, [0x0001, %r31]
DS_159:
	.word 0x32800001  ! 2692: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb20301  ! 2691: ALLIGNADDRESS	alignaddr	%r8, %r1, %r5
	.word 0x9e79c001  ! 2692: SDIV_R	sdiv 	%r7, %r1, %r15
	.word 0x26700001  ! 2693: BPL	<illegal instruction>
	.word 0x8d902a82  ! 2694: WRPR_PSTATE_I	wrpr	%r0, 0x0a82, %pstate
	.word 0xde8008a0  ! 2695: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x32800001  ! 2696: BNE	bne,a	<label_0x1>
	.word 0x81a189a9  ! 2697: FDIVs	fdivs	%f6, %f9, %f0
	.word 0x904a2001  ! 2698: MULX_I	mulx 	%r8, 0x0001, %r8
	.word 0x81982e50  ! 2699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e50, %hpstate
DS_160:
	.word 0x20800001  ! 2701: BN	bn,a	<label_0x1>
	.word 0xdf30e001  ! 2701: STQF_I	-	%f15, [0x0001, %r3]
	.word 0x99458000  ! 2700: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd8d7e010  ! 2701: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
	.word 0xd88804a0  ! 2702: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x8d902e18  ! 2703: WRPR_PSTATE_I	wrpr	%r0, 0x0e18, %pstate
	.word 0x82d0000f  ! 2704: UMULcc_R	umulcc 	%r0, %r15, %r1
	mov 0x31, %r30
	.word 0x97d0001e  ! 2705: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc28008a0  ! 2706: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x9bd02035  ! 2707: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x8d902017  ! 2708: WRPR_PSTATE_I	wrpr	%r0, 0x0017, %pstate
	.word 0x81982e8b  ! 2709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
	mov 0x33, %r30
	.word 0x8fd0001e  ! 2710: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc327c00f  ! 2711: STF_R	st	%f1, [%r15, %r31]
	.word 0x8d9028c8  ! 2712: WRPR_PSTATE_I	wrpr	%r0, 0x08c8, %pstate
	.word 0x8198281f  ! 2713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081f, %hpstate
	.word 0x97a049e4  ! 2714: FDIVq	dis not found

	.word 0x85a24dcf  ! 2715: FdMULq	fdmulq	
	.word 0x8b514000  ! 2716: RDPR_TBA	rdpr	%tba, %r5
	.word 0x9c68e001  ! 2717: UDIVX_I	udivx 	%r3, 0x0001, %r14
	.word 0x8fd02035  ! 2718: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x81982d8c  ! 2719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902013  ! 2721: WRPR_PSTATE_I	wrpr	%r0, 0x0013, %pstate
	.word 0x9f69a001  ! 2722: SDIVX_I	sdivx	%r6, 0x0001, %r15
	.word 0x8d9028d9  ! 2723: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0xde1fe001  ! 2724: LDD_I	ldd	[%r31 + 0x0001], %r15
	.word 0x9c7aa001  ! 2725: SDIV_I	sdiv 	%r10, 0x0001, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99a049e8  ! 2727: FDIVq	dis not found

DS_161:
	.word 0x34800001  ! 2729: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b14304  ! 2728: ALLIGNADDRESS	alignaddr	%r5, %r4, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90229c  ! 2730: WRPR_PSTATE_I	wrpr	%r0, 0x029c, %pstate
	.word 0x8d902448  ! 2731: WRPR_PSTATE_I	wrpr	%r0, 0x0448, %pstate
	.word 0x8e6ac004  ! 2732: UDIVX_R	udivx 	%r11, %r4, %r7
	.word 0x81982f81  ! 2733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f81, %hpstate
	.word 0x8d9026d0  ! 2734: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0xcfe7c024  ! 2735: CASA_I	casa	[%r31] 0x 1, %r4, %r7
	.word 0xcedfe010  ! 2736: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0x81982f1d  ! 2737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1d, %hpstate
	.word 0x2a800001  ! 2738: BCS	bcs,a	<label_0x1>
	.word 0xce9fc020  ! 2739: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x9fd02032  ! 2740: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9cd88005  ! 2743: SMULcc_R	smulcc 	%r2, %r5, %r14
	.word 0x8d802000  ! 2744: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8c686001  ! 2745: UDIVX_I	udivx 	%r1, 0x0001, %r6
	.word 0x93d02030  ! 2746: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x84c0e001  ! 2747: ADDCcc_I	addccc 	%r3, 0x0001, %r2
	.word 0x87802089  ! 2748: WRASI_I	wr	%r0, 0x0089, %asi
DS_162:
	.word 0x20800001  ! 2750: BN	bn,a	<label_0x1>
	.word 0xcd31000b  ! 2750: STQF_R	-	%f6, [%r11, %r4]
	.word 0x91458000  ! 2749: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x2c800001  ! 2750: BNEG	bneg,a	<label_0x1>
	.word 0x8d9026d7  ! 2751: WRPR_PSTATE_I	wrpr	%r0, 0x06d7, %pstate
	.word 0x81982105  ! 2752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0105, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x28800001  ! 2754: BLEU	bleu,a	<label_0x1>
DS_163:
	.word 0x34800001  ! 2756: BG	bg,a	<label_0x1>
	.word 0xd130400e  ! 2756: STQF_R	-	%f8, [%r14, %r1]
	.word 0x99458000  ! 2755: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x96c3e001  ! 2756: ADDCcc_I	addccc 	%r15, 0x0001, %r11
	.word 0x8fa01a6c  ! 2757: FqTOi	fqtoi	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902299  ! 2759: WRPR_PSTATE_I	wrpr	%r0, 0x0299, %pstate
	.word 0x26700001  ! 2760: BPL	<illegal instruction>
	.word 0x946b400b  ! 2761: UDIVX_R	udivx 	%r13, %r11, %r10
	.word 0x87802004  ! 2762: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x26800001  ! 2764: BL	bl,a	<label_0x1>
	.word 0x2c700001  ! 2765: BPNEG	<illegal instruction>
	mov 0x35, %r30
	.word 0x8fd0001e  ! 2766: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c538000  ! 2768: UMUL_R	umul 	%r14, %r0, %r6
	.word 0x9c816001  ! 2769: ADDcc_I	addcc 	%r5, 0x0001, %r14
	.word 0x816ac006  ! 2770: SDIVX_R	sdivx	%r11, %r6, %r0
	.word 0x84824008  ! 2771: ADDcc_R	addcc 	%r9, %r8, %r2
	.word 0x8b68a001  ! 2772: SDIVX_I	sdivx	%r2, 0x0001, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcaffc028  ! 2774: SWAPA_R	swapa	%r5, [%r31 + %r8] 0x01
	.word 0x99d02031  ! 2775: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x8d90244f  ! 2776: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
	.word 0x91a0c9aa  ! 2777: FDIVs	fdivs	%f3, %f10, %f8
	.word 0xd097e010  ! 2778: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0x80486001  ! 2779: MULX_I	mulx 	%r1, 0x0001, %r0
	.word 0x97d02035  ! 2780: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x8d9020cc  ! 2781: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0x96c2e001  ! 2782: ADDCcc_I	addccc 	%r11, 0x0001, %r11
	.word 0x24800001  ! 2783: BLE	ble,a	<label_0x1>
	.word 0x8d802000  ! 2784: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x34, %r30
	.word 0x85d0001e  ! 2785: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xd68804a0  ! 2786: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd6c7e020  ! 2787: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0x81500000  ! 2788: RDPR_TPC	rdpr	%tpc, %r0
	.word 0xc08008a0  ! 2789: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d90284d  ! 2790: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
	.word 0x81982d91  ! 2791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d91, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8da149a5  ! 2793: FDIVs	fdivs	%f5, %f5, %f6
	.word 0x886b8006  ! 2794: UDIVX_R	udivx 	%r14, %r6, %r4
	.word 0xc847e001  ! 2795: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	mov 0x33, %r30
	.word 0x81d0001e  ! 2796: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc88008a0  ! 2798: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x9350c000  ! 2799: RDPR_TT	rdpr	%tt, %r9
	.word 0x9083c004  ! 2800: ADDcc_R	addcc 	%r15, %r4, %r8
	.word 0x8d90220e  ! 2801: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	mov 0x33, %r30
	.word 0x95d0001e  ! 2802: Tcc_R	tg	icc_or_xcc, %r0 + %r30
DS_164:
	.word 0x20800001  ! 2804: BN	bn,a	<label_0x1>
	.word 0xcb310007  ! 2804: STQF_R	-	%f5, [%r7, %r4]
	.word 0x81458000  ! 2803: RD_SOFTINT_REG	stbar
	.word 0xc0c804a0  ! 2804: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0xc08fe000  ! 2805: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0x8fa109c0  ! 2806: FDIVd	fdivd	%f4, %f0, %f38
	.word 0xceffc020  ! 2807: SWAPA_R	swapa	%r7, [%r31 + %r0] 0x01
	.word 0x2c700001  ! 2808: BPNEG	<illegal instruction>
	mov 0x30, %r30
	.word 0x83d0001e  ! 2809: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x2e700001  ! 2811: BPVS	<illegal instruction>
	.word 0x95d02031  ! 2812: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0xcec804a0  ! 2813: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x9d480000  ! 2814: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0xdc800ac0  ! 2815: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r14
	.word 0x8d9020c6  ! 2816: WRPR_PSTATE_I	wrpr	%r0, 0x00c6, %pstate
	.word 0x81982e5f  ! 2817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5f, %hpstate
DS_165:
	.word 0x34800001  ! 2819: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b2830c  ! 2818: ALLIGNADDRESS	alignaddr	%r10, %r12, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd08fe020  ! 2820: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9e820001  ! 2822: ADDcc_R	addcc 	%r8, %r1, %r15
	.word 0xde800b80  ! 2823: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r15
DS_166:
	.word 0x20800001  ! 2825: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b3030b  ! 2824: ALLIGNADDRESS	alignaddr	%r12, %r11, %r0
	.word 0x85d02034  ! 2825: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x8d902c98  ! 2826: WRPR_PSTATE_I	wrpr	%r0, 0x0c98, %pstate
	.word 0xc077e001  ! 2827: STX_I	stx	%r0, [%r31 + 0x0001]
	.word 0x81982e9a  ! 2828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9a, %hpstate
	.word 0xc0ffc02b  ! 2829: SWAPA_R	swapa	%r0, [%r31 + %r11] 0x01
	.word 0x9351c000  ! 2830: RDPR_TL	rdpr	%tl, %r9
	.word 0xd2ffc02b  ! 2831: SWAPA_R	swapa	%r9, [%r31 + %r11] 0x01
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83508000  ! 2833: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x81982d46  ! 2834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d46, %hpstate
	.word 0x87508000  ! 2835: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x3c700001  ! 2836: BPPOS	<illegal instruction>
	.word 0x93686001  ! 2837: SDIVX_I	sdivx	%r1, 0x0001, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x98036001  ! 2839: ADD_I	add 	%r13, 0x0001, %r12
	.word 0x81982999  ! 2840: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0999, %hpstate
	.word 0x8d902c92  ! 2841: WRPR_PSTATE_I	wrpr	%r0, 0x0c92, %pstate
	.word 0x30700001  ! 2842: BPA	<illegal instruction>
	.word 0x95a00564  ! 2843: FSQRTq	fsqrt	
	.word 0x90c26001  ! 2844: ADDCcc_I	addccc 	%r9, 0x0001, %r8
	.word 0x8198224e  ! 2845: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024e, %hpstate
	.word 0x8d902c49  ! 2846: WRPR_PSTATE_I	wrpr	%r0, 0x0c49, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd097e030  ! 2848: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	.word 0xd0c004a0  ! 2849: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xd0800c00  ! 2850: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
	.word 0x89d02033  ! 2851: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0xd0c80e80  ! 2852: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r8
	.word 0x9fa289a9  ! 2853: FDIVs	fdivs	%f10, %f9, %f15
	.word 0x81982285  ! 2854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0285, %hpstate
	.word 0x87802080  ! 2855: WRASI_I	wr	%r0, 0x0080, %asi
	mov 0x34, %r30
	.word 0x9dd0001e  ! 2856: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d9028d0  ! 2857: WRPR_PSTATE_I	wrpr	%r0, 0x08d0, %pstate
	.word 0x81982344  ! 2858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0344, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x83d0001e  ! 2860: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97d02033  ! 2861: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x87688001  ! 2862: SDIVX_R	sdivx	%r2, %r1, %r3
	.word 0xc6c804a0  ! 2863: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x9878a001  ! 2864: SDIV_I	sdiv 	%r2, 0x0001, %r12
	.word 0x8d9024d5  ! 2865: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	.word 0xd877e001  ! 2866: STX_I	stx	%r12, [%r31 + 0x0001]
	.word 0x3a700001  ! 2867: BPCC	<illegal instruction>
	.word 0x2a700001  ! 2868: BPCS	<illegal instruction>
	.word 0x8d902a1d  ! 2869: WRPR_PSTATE_I	wrpr	%r0, 0x0a1d, %pstate
	.word 0x916b800b  ! 2870: SDIVX_R	sdivx	%r14, %r11, %r8
	mov 0x35, %r30
	.word 0x89d0001e  ! 2871: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x8fd0001e  ! 2872: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x81982bc4  ! 2873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc4, %hpstate
	.word 0x8ba00566  ! 2874: FSQRTq	fsqrt	
	mov 0x35, %r30
	.word 0x91d0001e  ! 2875: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 2876: BPPOS	<illegal instruction>
	.word 0x81982086  ! 2877: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0xca27c006  ! 2878: STW_R	stw	%r5, [%r31 + %r6]
	.word 0x38800001  ! 2879: BGU	bgu,a	<label_0x1>
	.word 0x9279e001  ! 2880: SDIV_I	sdiv 	%r7, 0x0001, %r9
	.word 0x8d802000  ! 2881: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x9fd0001e  ! 2882: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81982810  ! 2883: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
DS_167:
	.word 0x22800001  ! 2885: BE	be,a	<label_0x1>
	illtrap
	.word 0x85b28306  ! 2884: ALLIGNADDRESS	alignaddr	%r10, %r6, %r2
	.word 0x8ad06001  ! 2885: UMULcc_I	umulcc 	%r1, 0x0001, %r5
	.word 0x8d802000  ! 2886: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcbe7c026  ! 2887: CASA_I	casa	[%r31] 0x 1, %r6, %r5
	mov 0x32, %r30
	.word 0x87d0001e  ! 2888: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x95d02033  ! 2889: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x87802089  ! 2890: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90224e  ! 2892: WRPR_PSTATE_I	wrpr	%r0, 0x024e, %pstate
	.word 0x8d902a9c  ! 2893: WRPR_PSTATE_I	wrpr	%r0, 0x0a9c, %pstate
	.word 0xca1fe001  ! 2894: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0x8ba34dc4  ! 2895: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982119  ! 2899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0119, %hpstate
DS_168:
	.word 0x22800001  ! 2901: BE	be,a	<label_0x1>
	.word 0xcb32400c  ! 2901: STQF_R	-	%f5, [%r12, %r9]
	.word 0x95458000  ! 2900: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8d902ad4  ! 2901: WRPR_PSTATE_I	wrpr	%r0, 0x0ad4, %pstate
DS_169:
	.word 0x34800001  ! 2903: BG	bg,a	<label_0x1>
	.word 0xdf338004  ! 2903: STQF_R	-	%f15, [%r4, %r14]
	.word 0x89458000  ! 2902: RD_SOFTINT_REG	rd	%softint, %r4
	mov 0x30, %r30
	.word 0x9bd0001e  ! 2903: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc87fe001  ! 2904: SWAP_I	swap	%r4, [%r31 + 0x0001]
DS_170:
	.word 0x32800001  ! 2906: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b0830b  ! 2905: ALLIGNADDRESS	alignaddr	%r2, %r11, %r4
	.word 0x24700001  ! 2906: BPLE	<illegal instruction>
	.word 0x26700001  ! 2907: BPL	<illegal instruction>
	.word 0xc84fe001  ! 2908: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0x81982108  ! 2909: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0108, %hpstate
	.word 0x819827de  ! 2910: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07de, %hpstate
DS_171:
	.word 0x22800001  ! 2912: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b1c30b  ! 2911: ALLIGNADDRESS	alignaddr	%r7, %r11, %r11
	.word 0x93682001  ! 2912: SDIVX_I	sdivx	%r0, 0x0001, %r9
	.word 0x8d802004  ! 2913: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x96022001  ! 2914: ADD_I	add 	%r8, 0x0001, %r11
	.word 0xd64fe001  ! 2915: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8680400c  ! 2917: ADDcc_R	addcc 	%r1, %r12, %r3
	.word 0x8fd02030  ! 2918: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x844a2001  ! 2919: MULX_I	mulx 	%r8, 0x0001, %r2
	.word 0x8d9024c8  ! 2920: WRPR_PSTATE_I	wrpr	%r0, 0x04c8, %pstate
	.word 0xc537c00c  ! 2921: STQF_R	-	%f2, [%r12, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc4d80e40  ! 2923: LDXA_R	ldxa	[%r0, %r0] 0x72, %r2
	.word 0x964ae001  ! 2924: MULX_I	mulx 	%r11, 0x0001, %r11
	.word 0x8d902a9f  ! 2925: WRPR_PSTATE_I	wrpr	%r0, 0x0a9f, %pstate
	.word 0x81982adc  ! 2926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adc, %hpstate
	.word 0x8d902681  ! 2927: WRPR_PSTATE_I	wrpr	%r0, 0x0681, %pstate
	.word 0x9fd02033  ! 2928: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x97508000  ! 2929: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x81494000  ! 2930: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x81982405  ! 2931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0405, %hpstate
	.word 0xc08804a0  ! 2932: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x8d802000  ! 2933: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc137e001  ! 2934: STQF_I	-	%f0, [0x0001, %r31]
	.word 0x26800001  ! 2935: BL	bl,a	<label_0x1>
	.word 0x81a000c0  ! 2936: FNEGd	fnegd	%f0, %f0
	.word 0x81982986  ! 2937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0986, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x31, %r30
	.word 0x81d0001e  ! 2939: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 2940: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85a24d24  ! 2942: FsMULd	fsmuld	%f9, %f4, %f2
	.word 0x8198290d  ! 2943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090d, %hpstate
	.word 0x8d802000  ! 2944: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc527e001  ! 2945: STF_I	st	%f2, [0x0001, %r31]
	.word 0x81982b4a  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4a, %hpstate
	.word 0x8d9022d0  ! 2947: WRPR_PSTATE_I	wrpr	%r0, 0x02d0, %pstate
	.word 0x8d902017  ! 2948: WRPR_PSTATE_I	wrpr	%r0, 0x0017, %pstate
	mov 0x33, %r30
	.word 0x87d0001e  ! 2949: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
DS_172:
	.word 0x32800001  ! 2952: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x99b38301  ! 2951: ALLIGNADDRESS	alignaddr	%r14, %r1, %r12
	.word 0x8a4a4000  ! 2952: MULX_R	mulx 	%r9, %r0, %r5
	mov 0x32, %r30
	.word 0x87d0001e  ! 2953: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xca8008a0  ! 2954: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x83d02032  ! 2955: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x87802089  ! 2956: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902415  ! 2957: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
DS_173:
	.word 0x22800001  ! 2959: BE	be,a	<label_0x1>
	.word 0xc733a001  ! 2959: STQF_I	-	%f3, [0x0001, %r14]
	.word 0x9b458000  ! 2958: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x24800001  ! 2959: BLE	ble,a	<label_0x1>
	.word 0x20800001  ! 2960: BN	bn,a	<label_0x1>
	.word 0x87802014  ! 2961: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x83a0c9ab  ! 2962: FDIVs	fdivs	%f3, %f11, %f1
	.word 0x819827ce  ! 2963: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ce, %hpstate
	.word 0x28700001  ! 2964: BPLEU	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc20fe001  ! 2966: LDUB_I	ldub	[%r31 + 0x0001], %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819824cb  ! 2968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cb, %hpstate
	.word 0xc217e001  ! 2969: LDUH_I	lduh	[%r31 + 0x0001], %r1
	.word 0x89a0056c  ! 2970: FSQRTq	fsqrt	
	.word 0x95a1c9a7  ! 2971: FDIVs	fdivs	%f7, %f7, %f10
	.word 0x8d802000  ! 2972: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 2973: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x96d0c00b  ! 2975: UMULcc_R	umulcc 	%r3, %r11, %r11
	.word 0x81982410  ! 2976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0410, %hpstate
	.word 0x91a109c0  ! 2977: FDIVd	fdivd	%f4, %f0, %f8
	.word 0xd0dfe000  ! 2978: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0x87802080  ! 2979: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd007c000  ! 2980: LDUW_R	lduw	[%r31 + %r0], %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x94806001  ! 2982: ADDcc_I	addcc 	%r1, 0x0001, %r10
	.word 0x83d02034  ! 2983: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802014  ! 2984: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd40fe001  ! 2985: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x819821c9  ! 2986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c9, %hpstate
	.word 0xd4dfe010  ! 2987: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x846bc00f  ! 2988: UDIVX_R	udivx 	%r15, %r15, %r2
	mov 0x30, %r30
	.word 0x8dd0001e  ! 2989: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 2990: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d9028d6  ! 2991: WRPR_PSTATE_I	wrpr	%r0, 0x08d6, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e1d  ! 2993: WRPR_PSTATE_I	wrpr	%r0, 0x0e1d, %pstate
	.word 0x8198211f  ! 2994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011f, %hpstate
	.word 0xc48008a0  ! 2995: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982298  ! 2996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0298, %hpstate
	.word 0xc44fe001  ! 2997: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0x8d902419  ! 2998: WRPR_PSTATE_I	wrpr	%r0, 0x0419, %pstate
	.word 0x819822c7  ! 2999: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0x8d802000  ! 3000: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24700001  ! 3001: BPLE	<illegal instruction>
	.word 0x9ec22001  ! 3002: ADDCcc_I	addccc 	%r8, 0x0001, %r15
	.word 0x81982d9e  ! 3003: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9e, %hpstate
	.word 0x8d902ac1  ! 3004: WRPR_PSTATE_I	wrpr	%r0, 0x0ac1, %pstate
	.word 0x8198219c  ! 3005: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019c, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81d02035  ! 3007: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x8d9026c5  ! 3008: WRPR_PSTATE_I	wrpr	%r0, 0x06c5, %pstate
	.word 0x87802010  ! 3009: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9fd02032  ! 3010: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x87d02032  ! 3011: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x8f6ac00a  ! 3012: SDIVX_R	sdivx	%r11, %r10, %r7
	.word 0x2e800001  ! 3013: BVS	bvs,a	<label_0x1>
	.word 0xcf3fc00a  ! 3014: STDF_R	std	%f7, [%r10, %r31]
	.word 0xce2fe001  ! 3015: STB_I	stb	%r7, [%r31 + 0x0001]
	.word 0x8a81e001  ! 3016: ADDcc_I	addcc 	%r7, 0x0001, %r5
	.word 0x8198221b  ! 3017: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021b, %hpstate
	.word 0x8ba000ce  ! 3018: FNEGd	fnegd	%f14, %f36
	.word 0x85d02035  ! 3019: Tcc_I	tle	icc_or_xcc, %r0 + 53
	mov 0x33, %r30
	.word 0x97d0001e  ! 3020: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8d90285d  ! 3021: WRPR_PSTATE_I	wrpr	%r0, 0x085d, %pstate
	.word 0x8d902887  ! 3022: WRPR_PSTATE_I	wrpr	%r0, 0x0887, %pstate
	mov 0x32, %r30
	.word 0x87d0001e  ! 3023: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xca27e001  ! 3024: STW_I	stw	%r5, [%r31 + 0x0001]
	.word 0x8d9026c1  ! 3025: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8da2c9ab  ! 3027: FDIVs	fdivs	%f11, %f11, %f6
	.word 0x8d90208f  ! 3028: WRPR_PSTATE_I	wrpr	%r0, 0x008f, %pstate
	.word 0x87802010  ! 3029: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8fa009a7  ! 3030: FDIVs	fdivs	%f0, %f7, %f7
	.word 0x97d02032  ! 3031: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x81982b89  ! 3032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b89, %hpstate
	.word 0xced004a0  ! 3033: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x867b6001  ! 3034: SDIV_I	sdiv 	%r13, 0x0001, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902442  ! 3036: WRPR_PSTATE_I	wrpr	%r0, 0x0442, %pstate
	.word 0x96786001  ! 3037: SDIV_I	sdiv 	%r1, 0x0001, %r11
	.word 0xd6d004a0  ! 3038: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd6cfe010  ! 3039: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x8d802004  ! 3040: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x31, %r30
	.word 0x85d0001e  ! 3041: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8198239b  ! 3042: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039b, %hpstate
	.word 0x8d902a4b  ! 3043: WRPR_PSTATE_I	wrpr	%r0, 0x0a4b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 3045: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x819828dc  ! 3046: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
	.word 0x81982e0e  ! 3047: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0e, %hpstate
	.word 0x8d802000  ! 3048: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982fcd  ! 3050: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcd, %hpstate
	.word 0x81982643  ! 3051: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0643, %hpstate
	.word 0x8d802000  ! 3052: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
DS_174:
	.word 0x22800001  ! 3055: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b2830d  ! 3054: ALLIGNADDRESS	alignaddr	%r10, %r13, %r10
	.word 0xd457c000  ! 3055: LDSH_R	ldsh	[%r31 + %r0], %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x86d32001  ! 3057: UMULcc_I	umulcc 	%r12, 0x0001, %r3
	.word 0x89500000  ! 3058: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x8d9024de  ! 3059: WRPR_PSTATE_I	wrpr	%r0, 0x04de, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc88fe030  ! 3061: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0x8a680009  ! 3062: UDIVX_R	udivx 	%r0, %r9, %r5
	.word 0x81982f82  ! 3063: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f82, %hpstate
	.word 0x95d02032  ! 3064: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x8d90249e  ! 3065: WRPR_PSTATE_I	wrpr	%r0, 0x049e, %pstate
	.word 0x81d02033  ! 3066: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x85480000  ! 3067: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x26800001  ! 3068: BL	bl,a	<label_0x1>
	.word 0x96c22001  ! 3069: ADDCcc_I	addccc 	%r8, 0x0001, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0xd6c80e80  ! 3071: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r11
	.word 0x81982adf  ! 3072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0x9b6b6001  ! 3073: SDIVX_I	sdivx	%r13, 0x0001, %r13
	.word 0x8198249c  ! 3074: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049c, %hpstate
	.word 0x9e808009  ! 3075: ADDcc_R	addcc 	%r2, %r9, %r15
	.word 0x8d68e001  ! 3076: SDIVX_I	sdivx	%r3, 0x0001, %r6
	.word 0x8f682001  ! 3077: SDIVX_I	sdivx	%r0, 0x0001, %r7
	.word 0xcf27e001  ! 3078: STF_I	st	%f7, [0x0001, %r31]
	.word 0x81982107  ! 3079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
	.word 0x91a009cd  ! 3080: FDIVd	fdivd	%f0, %f44, %f8
	mov 0x31, %r30
	.word 0x81d0001e  ! 3081: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982b94  ! 3082: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b94, %hpstate
	.word 0x92d1800d  ! 3083: UMULcc_R	umulcc 	%r6, %r13, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982f9d  ! 3085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9d, %hpstate
	mov 0x34, %r30
	.word 0x89d0001e  ! 3086: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd24fe001  ! 3088: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902ad3  ! 3090: WRPR_PSTATE_I	wrpr	%r0, 0x0ad3, %pstate
	mov 0x32, %r30
	.word 0x8fd0001e  ! 3091: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8198240f  ! 3092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040f, %hpstate
	.word 0x846b6001  ! 3093: UDIVX_I	udivx 	%r13, 0x0001, %r2
	.word 0x83a000ca  ! 3094: FNEGd	fnegd	%f10, %f32
	.word 0x90d1000a  ! 3095: UMULcc_R	umulcc 	%r4, %r10, %r8
	.word 0x99d02033  ! 3096: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x8c79a001  ! 3097: SDIV_I	sdiv 	%r6, 0x0001, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcc800ba0  ! 3099: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r6
	mov 0x30, %r30
	.word 0x81d0001e  ! 3100: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xccc804a0  ! 3101: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x819825ce  ! 3102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90229a  ! 3104: WRPR_PSTATE_I	wrpr	%r0, 0x029a, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982514  ! 3106: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
	.word 0x9c4ba001  ! 3107: MULX_I	mulx 	%r14, 0x0001, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdcd7e010  ! 3109: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r14
	.word 0x8d902a49  ! 3110: WRPR_PSTATE_I	wrpr	%r0, 0x0a49, %pstate
	mov 0x33, %r30
	.word 0x85d0001e  ! 3111: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdcd80e80  ! 3113: LDXA_R	ldxa	[%r0, %r0] 0x74, %r14
	.word 0x89500000  ! 3114: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x8a794004  ! 3115: SDIV_R	sdiv 	%r5, %r4, %r5
	.word 0x84d18005  ! 3116: UMULcc_R	umulcc 	%r6, %r5, %r2
	.word 0x8d902412  ! 3117: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	.word 0xc5e7c025  ! 3118: CASA_I	casa	[%r31] 0x 1, %r5, %r2
	.word 0x8d802000  ! 3119: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc40fc000  ! 3120: LDUB_R	ldub	[%r31 + %r0], %r2
	.word 0xc44fe001  ! 3121: LDSB_I	ldsb	[%r31 + 0x0001], %r2
DS_175:
	.word 0x32800001  ! 3123: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9fb14303  ! 3122: ALLIGNADDRESS	alignaddr	%r5, %r3, %r15
	.word 0xde8804a0  ! 3123: LDUBA_R	lduba	[%r0, %r0] 0x25, %r15
	.word 0xde1fe001  ! 3124: LDD_I	ldd	[%r31 + 0x0001], %r15
	.word 0xde9004a0  ! 3125: LDUHA_R	lduha	[%r0, %r0] 0x25, %r15
	.word 0xde8008a0  ! 3126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d802000  ! 3127: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x887ba001  ! 3128: SDIV_I	sdiv 	%r14, 0x0001, %r4
	.word 0x976aa001  ! 3129: SDIVX_I	sdivx	%r10, 0x0001, %r11
	.word 0xd73fe001  ! 3130: STDF_I	std	%f11, [0x0001, %r31]
	mov 0x33, %r30
	.word 0x91d0001e  ! 3131: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 3132: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd61fc000  ! 3133: LDD_R	ldd	[%r31 + %r0], %r11
	mov 0x31, %r30
	.word 0x97d0001e  ! 3134: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x92784002  ! 3135: SDIV_R	sdiv 	%r1, %r2, %r9
	.word 0x819825dc  ! 3136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dc, %hpstate
	.word 0x9dd02033  ! 3137: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x8d902e82  ! 3138: WRPR_PSTATE_I	wrpr	%r0, 0x0e82, %pstate
	.word 0x8e7a4007  ! 3139: SDIV_R	sdiv 	%r9, %r7, %r7
	.word 0x85504000  ! 3140: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x28700001  ! 3141: BPLEU	<illegal instruction>
	.word 0x8d902e06  ! 3142: WRPR_PSTATE_I	wrpr	%r0, 0x0e06, %pstate
	.word 0x9a806001  ! 3143: ADDcc_I	addcc 	%r1, 0x0001, %r13
	.word 0x8d902e4f  ! 3144: WRPR_PSTATE_I	wrpr	%r0, 0x0e4f, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9fa000c2  ! 3146: FNEGd	fnegd	%f2, %f46
DS_176:
	.word 0x34800001  ! 3148: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b38301  ! 3147: ALLIGNADDRESS	alignaddr	%r14, %r1, %r10
	.word 0xd4d00e40  ! 3148: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
	.word 0x8d902a93  ! 3149: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
	.word 0x9f494000  ! 3150: RDHPR_HTBA	rdhpr	%htba, %r15
	.word 0x8168e001  ! 3151: SDIVX_I	sdivx	%r3, 0x0001, %r0
	.word 0x90dbc00a  ! 3152: SMULcc_R	smulcc 	%r15, %r10, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802088  ! 3154: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x2e800001  ! 3155: BVS	bvs,a	<label_0x1>
	.word 0x8e7b400c  ! 3156: SDIV_R	sdiv 	%r13, %r12, %r7
	.word 0x8d902240  ! 3157: WRPR_PSTATE_I	wrpr	%r0, 0x0240, %pstate
	.word 0x95a34d25  ! 3158: FsMULd	fsmuld	%f13, %f36, %f10
	.word 0x8d802000  ! 3159: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 3160: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902812  ! 3161: WRPR_PSTATE_I	wrpr	%r0, 0x0812, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd53fe001  ! 3163: STDF_I	std	%f10, [0x0001, %r31]
	.word 0xd4cfe010  ! 3164: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
	.word 0xd48008a0  ! 3165: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x81982e52  ! 3166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
	mov 0x34, %r30
	.word 0x85d0001e  ! 3167: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x81982d5a  ! 3168: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5a, %hpstate
	.word 0x867b400e  ! 3169: SDIV_R	sdiv 	%r13, %r14, %r3
	.word 0x8d902243  ! 3170: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	mov 0x31, %r30
	.word 0x89d0001e  ! 3171: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x81982491  ! 3172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0491, %hpstate
	.word 0xc6c004a0  ! 3173: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0xc68fe020  ! 3174: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0xc6ffc02e  ! 3175: SWAPA_R	swapa	%r3, [%r31 + %r14] 0x01
	mov 0x33, %r30
	.word 0x85d0001e  ! 3176: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x38700001  ! 3177: BPGU	<illegal instruction>
	.word 0x8198245e  ! 3178: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045e, %hpstate
DS_177:
	.word 0x20800001  ! 3180: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85b0030b  ! 3179: ALLIGNADDRESS	alignaddr	%r0, %r11, %r2
	.word 0xc4c804a0  ! 3180: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0x8c808003  ! 3181: ADDcc_R	addcc 	%r2, %r3, %r6
	.word 0x9fd02031  ! 3182: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0xcc0fc000  ! 3183: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x819821df  ! 3184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
	.word 0x81982712  ! 3185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0712, %hpstate
	.word 0x87d02032  ! 3186: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x8198288a  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088a, %hpstate
	.word 0x8d902c91  ! 3188: WRPR_PSTATE_I	wrpr	%r0, 0x0c91, %pstate
	.word 0x8d9022c5  ! 3189: WRPR_PSTATE_I	wrpr	%r0, 0x02c5, %pstate
	.word 0x30700001  ! 3190: BPA	<illegal instruction>
	.word 0xccc7e030  ! 3191: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x81504000  ! 3192: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x8d9022c4  ! 3193: WRPR_PSTATE_I	wrpr	%r0, 0x02c4, %pstate
	.word 0x26700001  ! 3194: BPL	<illegal instruction>
DS_178:
	.word 0x22800001  ! 3196: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b3830a  ! 3195: ALLIGNADDRESS	alignaddr	%r14, %r10, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x867b2001  ! 3197: SDIV_I	sdiv 	%r12, 0x0001, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 3199: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982197  ! 3200: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0197, %hpstate
	.word 0xc73fe001  ! 3201: STDF_I	std	%f3, [0x0001, %r31]
	mov 0x34, %r30
	.word 0x8bd0001e  ! 3202: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc6800c20  ! 3203: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r3
DS_179:
	.word 0x34800001  ! 3205: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9bb04306  ! 3204: ALLIGNADDRESS	alignaddr	%r1, %r6, %r13
	.word 0x8ac0a001  ! 3205: ADDCcc_I	addccc 	%r2, 0x0001, %r5
	.word 0xcb97e001  ! 3206: LDQFA_I	-	[%r31, 0x0001], %f5
	.word 0x93a189a2  ! 3207: FDIVs	fdivs	%f6, %f2, %f9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902ada  ! 3209: WRPR_PSTATE_I	wrpr	%r0, 0x0ada, %pstate
	mov 0x35, %r30
	.word 0x85d0001e  ! 3210: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d902c4f  ! 3211: WRPR_PSTATE_I	wrpr	%r0, 0x0c4f, %pstate
	.word 0x8d802004  ! 3212: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8ba00dc9  ! 3213: FdMULq	fdmulq	
	.word 0x8bd02031  ! 3214: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0x38700001  ! 3215: BPGU	<illegal instruction>
	.word 0xcaffc029  ! 3216: SWAPA_R	swapa	%r5, [%r31 + %r9] 0x01
	.word 0x80788009  ! 3217: SDIV_R	sdiv 	%r2, %r9, %r0
	mov 0x32, %r30
	.word 0x91d0001e  ! 3218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982c8a  ! 3219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8a, %hpstate
	mov 0x30, %r30
	.word 0x97d0001e  ! 3220: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc0800aa0  ! 3221: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r0
	.word 0xc027c009  ! 3222: STW_R	stw	%r0, [%r31 + %r9]
	.word 0x97a00544  ! 3223: FSQRTd	fsqrt	
	.word 0x9ec02001  ! 3224: ADDCcc_I	addccc 	%r0, 0x0001, %r15
	.word 0x944a2001  ! 3225: MULX_I	mulx 	%r8, 0x0001, %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982f9f  ! 3227: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9f, %hpstate
	.word 0xd527e001  ! 3228: STF_I	st	%f10, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
DS_180:
	.word 0x22800001  ! 3231: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db3c307  ! 3230: ALLIGNADDRESS	alignaddr	%r15, %r7, %r14
	.word 0xdccfe030  ! 3231: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r14
	.word 0x8d9028d0  ! 3232: WRPR_PSTATE_I	wrpr	%r0, 0x08d0, %pstate
	.word 0x8d90201d  ! 3233: WRPR_PSTATE_I	wrpr	%r0, 0x001d, %pstate
	.word 0x81982502  ! 3234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0502, %hpstate
	.word 0x8b68c005  ! 3235: SDIVX_R	sdivx	%r3, %r5, %r5
	.word 0xcb3fc005  ! 3236: STDF_R	std	%f5, [%r5, %r31]
	.word 0x95d02034  ! 3237: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x8d802004  ! 3238: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcad004a0  ! 3239: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	mov 0x34, %r30
	.word 0x95d0001e  ! 3240: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d902499  ! 3241: WRPR_PSTATE_I	wrpr	%r0, 0x0499, %pstate
	.word 0x81982b1a  ! 3242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1a, %hpstate
	.word 0x8d90221e  ! 3243: WRPR_PSTATE_I	wrpr	%r0, 0x021e, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802010  ! 3245: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xca7fe001  ! 3246: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x93d02032  ! 3247: Tcc_I	tne	icc_or_xcc, %r0 + 50
	mov 0x33, %r30
	.word 0x87d0001e  ! 3248: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x81982cc8  ! 3249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc8, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xca0fe001  ! 3252: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0x81982314  ! 3253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0314, %hpstate
	.word 0x87802010  ! 3254: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9b514000  ! 3255: RDPR_TBA	rdpr	%tba, %r13
	.word 0x9a6bc007  ! 3256: UDIVX_R	udivx 	%r15, %r7, %r13
	.word 0x81982eda  ! 3257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eda, %hpstate
	.word 0xdb27e001  ! 3258: STF_I	st	%f13, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdac804a0  ! 3260: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x9fa01a6b  ! 3261: FqTOi	fqtoi	
	ta	T_CHANGE_PRIV	! macro
	.word 0xde800c80  ! 3263: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r15
	.word 0x81982858  ! 3264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
	.word 0x8198275d  ! 3265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
	.word 0xde800ac0  ! 3266: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r15
	.word 0xde7fe001  ! 3267: SWAP_I	swap	%r15, [%r31 + 0x0001]
	.word 0x8198249f  ! 3268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049f, %hpstate
	.word 0x8da00567  ! 3269: FSQRTq	fsqrt	
	.word 0xcc800c40  ! 3270: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
	.word 0xcd27e001  ! 3271: STF_I	st	%f6, [0x0001, %r31]
	.word 0x81982c90  ! 3272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c90, %hpstate
	.word 0x84c3a001  ! 3273: ADDCcc_I	addccc 	%r14, 0x0001, %r2
	.word 0x26700001  ! 3274: BPL	<illegal instruction>
	.word 0x87802088  ! 3275: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc5e7c027  ! 3276: CASA_I	casa	[%r31] 0x 1, %r7, %r2
	.word 0x91d02031  ! 3277: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc49fe001  ! 3278: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x96d0000c  ! 3280: UMULcc_R	umulcc 	%r0, %r12, %r11
	.word 0x8d802000  ! 3281: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd61fc000  ! 3282: LDD_R	ldd	[%r31 + %r0], %r11
	mov 0x33, %r30
	.word 0x99d0001e  ! 3283: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d902a9f  ! 3284: WRPR_PSTATE_I	wrpr	%r0, 0x0a9f, %pstate
	.word 0x87802080  ! 3285: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d90201b  ! 3286: WRPR_PSTATE_I	wrpr	%r0, 0x001b, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x30700001  ! 3288: BPA	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95d02031  ! 3290: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x38800001  ! 3291: BGU	bgu,a	<label_0x1>
	.word 0x81982047  ! 3292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0047, %hpstate
	.word 0x81982799  ! 3293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0799, %hpstate
	.word 0x95d02034  ! 3294: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x8d902c0d  ! 3295: WRPR_PSTATE_I	wrpr	%r0, 0x0c0d, %pstate
	.word 0x87a10dca  ! 3296: FdMULq	fdmulq	
	.word 0x9ac02001  ! 3297: ADDCcc_I	addccc 	%r0, 0x0001, %r13
	.word 0x91a01a6d  ! 3298: FqTOi	fqtoi	
	.word 0xd0d004a0  ! 3299: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd0d004a0  ! 3300: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd0c004a0  ! 3301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x9a6a4002  ! 3302: UDIVX_R	udivx 	%r9, %r2, %r13
	.word 0x9c492001  ! 3303: MULX_I	mulx 	%r4, 0x0001, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdcdfe020  ! 3305: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0x81982f8e  ! 3306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8e, %hpstate
	.word 0x8d802000  ! 3307: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdcd7e030  ! 3308: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9024dc  ! 3310: WRPR_PSTATE_I	wrpr	%r0, 0x04dc, %pstate
	.word 0xdde7c022  ! 3311: CASA_I	casa	[%r31] 0x 1, %r2, %r14
	.word 0xdc8008a0  ! 3312: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0xdd27c002  ! 3313: STF_R	st	%f14, [%r2, %r31]
	.word 0xdcd7e020  ! 3314: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r14
	.word 0x8d802000  ! 3315: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90208c  ! 3316: WRPR_PSTATE_I	wrpr	%r0, 0x008c, %pstate
	.word 0xdcbfc022  ! 3317: STDA_R	stda	%r14, [%r31 + %r2] 0x01
	.word 0x8d802004  ! 3318: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a000c6  ! 3320: FNEGd	fnegd	%f6, %f10
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9022c6  ! 3322: WRPR_PSTATE_I	wrpr	%r0, 0x02c6, %pstate
	.word 0x3a800001  ! 3323: BCC	bcc,a	<label_0x1>
	.word 0x89508000  ! 3324: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x819825de  ! 3325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05de, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
DS_181:
	.word 0x20800001  ! 3328: BN	bn,a	<label_0x1>
	illtrap
	.word 0x97b0030f  ! 3327: ALLIGNADDRESS	alignaddr	%r0, %r15, %r11
	.word 0x2e700001  ! 3328: BPVS	<illegal instruction>
	.word 0xd6d7e010  ! 3329: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x8d902e9a  ! 3330: WRPR_PSTATE_I	wrpr	%r0, 0x0e9a, %pstate
	.word 0x24700001  ! 3331: BPLE	<illegal instruction>
DS_182:
	.word 0x20800001  ! 3333: BN	bn,a	<label_0x1>
	.word 0xc7332001  ! 3333: STQF_I	-	%f3, [0x0001, %r12]
	.word 0x8b458000  ! 3332: RD_SOFTINT_REG	rd	%softint, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198234d  ! 3334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
	.word 0x97d02035  ! 3335: Tcc_I	tge	icc_or_xcc, %r0 + 53
DS_183:
	.word 0x20800001  ! 3337: BN	bn,a	<label_0x1>
	.word 0xd332e001  ! 3337: STQF_I	-	%f9, [0x0001, %r11]
	.word 0x95458000  ! 3336: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x984b0007  ! 3337: MULX_R	mulx 	%r12, %r7, %r12
	.word 0x2a800001  ! 3338: BCS	bcs,a	<label_0x1>
	.word 0x819825cb  ! 3339: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cb, %hpstate
	.word 0x8d902a5d  ! 3340: WRPR_PSTATE_I	wrpr	%r0, 0x0a5d, %pstate
	.word 0x819822cf  ! 3341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cf, %hpstate
DS_184:
	.word 0x32800001  ! 3343: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b24305  ! 3342: ALLIGNADDRESS	alignaddr	%r9, %r5, %r1
	.word 0xc27fe001  ! 3343: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x9fa049c8  ! 3344: FDIVd	fdivd	%f32, %f8, %f46
	.word 0x8d90260c  ! 3345: WRPR_PSTATE_I	wrpr	%r0, 0x060c, %pstate
	.word 0x81982bce  ! 3346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bce, %hpstate
	.word 0x85d02031  ! 3347: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x819828c2  ! 3348: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c2, %hpstate
	.word 0xde8008a0  ! 3349: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d802000  ! 3350: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdf3fe001  ! 3351: STDF_I	std	%f15, [0x0001, %r31]
	.word 0x81982e5f  ! 3352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5f, %hpstate
	.word 0xdec7e010  ! 3353: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	.word 0x8d90244a  ! 3354: WRPR_PSTATE_I	wrpr	%r0, 0x044a, %pstate
	.word 0xdec7e020  ! 3355: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r15
	.word 0x84792001  ! 3356: SDIV_I	sdiv 	%r4, 0x0001, %r2
	.word 0x819823ca  ! 3357: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ca, %hpstate
	.word 0x81982593  ! 3358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0593, %hpstate
	.word 0x93a00540  ! 3359: FSQRTd	fsqrt	
	.word 0x8d90280c  ! 3360: WRPR_PSTATE_I	wrpr	%r0, 0x080c, %pstate
	.word 0xd337e001  ! 3361: STQF_I	-	%f9, [0x0001, %r31]
	mov 0x33, %r30
	.word 0x9bd0001e  ! 3362: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x87a000c2  ! 3363: FNEGd	fnegd	%f2, %f34
	.word 0x8d90220f  ! 3364: WRPR_PSTATE_I	wrpr	%r0, 0x020f, %pstate
DS_185:
	.word 0x22800001  ! 3366: BE	be,a	<label_0x1>
	.word 0xdf302001  ! 3366: STQF_I	-	%f15, [0x0001, %r0]
	.word 0x8b458000  ! 3365: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x83d02033  ! 3366: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x856a800a  ! 3367: SDIVX_R	sdivx	%r10, %r10, %r2
DS_186:
	.word 0x34800001  ! 3369: BG	bg,a	<label_0x1>
	.word 0xc731000c  ! 3369: STQF_R	-	%f3, [%r12, %r4]
	.word 0x99458000  ! 3368: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd88008a0  ! 3369: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd937c00c  ! 3371: STQF_R	-	%f12, [%r12, %r31]
	.word 0x81982f1b  ! 3372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1b, %hpstate
	.word 0x9b680005  ! 3373: SDIVX_R	sdivx	%r0, %r5, %r13
	.word 0xda1fc000  ! 3374: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xda1fe001  ! 3375: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x81982241  ! 3376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0241, %hpstate
	.word 0x81982148  ! 3377: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0148, %hpstate
	.word 0x8d802000  ! 3378: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdb27e001  ! 3379: STF_I	st	%f13, [0x0001, %r31]
	.word 0xda0fc000  ! 3380: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0xdacfe030  ! 3381: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x81982998  ! 3382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
	mov 0x32, %r30
	.word 0x9bd0001e  ! 3383: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x9f50c000  ! 3384: RDPR_TT	rdpr	%tt, %r15
	.word 0x824a8001  ! 3385: MULX_R	mulx 	%r10, %r1, %r1
	.word 0x8d9026c4  ! 3386: WRPR_PSTATE_I	wrpr	%r0, 0x06c4, %pstate
	.word 0x819828cd  ! 3387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
	ta	T_CHANGE_HPRIV	! macro
DS_187:
	.word 0x34800001  ! 3390: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b1c302  ! 3389: ALLIGNADDRESS	alignaddr	%r7, %r2, %r2
DS_188:
	.word 0x34800001  ! 3391: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b24305  ! 3390: ALLIGNADDRESS	alignaddr	%r9, %r5, %r3
	.word 0x8ba24d26  ! 3391: FsMULd	fsmuld	%f9, %f6, %f36
	.word 0xca900e40  ! 3392: LDUHA_R	lduha	[%r0, %r0] 0x72, %r5
	mov 0x34, %r30
	.word 0x9bd0001e  ! 3393: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8fa00547  ! 3394: FSQRTd	fsqrt	
	.word 0x2a700001  ! 3395: BPCS	<illegal instruction>
	.word 0x2c700001  ! 3396: BPNEG	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xce9004a0  ! 3398: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902047  ! 3400: WRPR_PSTATE_I	wrpr	%r0, 0x0047, %pstate
	.word 0x827ac00c  ! 3401: SDIV_R	sdiv 	%r11, %r12, %r1
	.word 0xc2cfe020  ! 3402: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r1
	.word 0x9048e001  ! 3403: MULX_I	mulx 	%r3, 0x0001, %r8
	.word 0x97d02030  ! 3404: Tcc_I	tge	icc_or_xcc, %r0 + 48
	mov 0x31, %r30
	.word 0x93d0001e  ! 3405: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x827bc004  ! 3406: SDIV_R	sdiv 	%r15, %r4, %r1
	.word 0x8350c000  ! 3407: RDPR_TT	rdpr	%tt, %r1
	.word 0x9ba28dc1  ! 3408: FdMULq	fdmulq	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91a00545  ! 3410: FSQRTd	fsqrt	
	mov 0x33, %r30
	.word 0x9bd0001e  ! 3411: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d9028ca  ! 3412: WRPR_PSTATE_I	wrpr	%r0, 0x08ca, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xd097e010  ! 3415: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0x3a800001  ! 3416: BCC	bcc,a	<label_0x1>
	.word 0xd0d804a0  ! 3417: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 3419: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8ba04d28  ! 3420: FsMULd	fsmuld	%f1, %f8, %f36
DS_189:
	.word 0x34800001  ! 3422: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b1c30f  ! 3421: ALLIGNADDRESS	alignaddr	%r7, %r15, %r9
	.word 0x87d02035  ! 3422: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x81982452  ! 3423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0452, %hpstate
	.word 0xd2d7e030  ! 3424: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r9
	.word 0x87504000  ! 3425: RDPR_TNPC	rdpr	%tnpc, %r3
DS_190:
	.word 0x22800001  ! 3427: BE	be,a	<label_0x1>
	.word 0xc933000d  ! 3427: STQF_R	-	%f4, [%r13, %r12]
	.word 0x99458000  ! 3426: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x93a20dc9  ! 3427: FdMULq	fdmulq	
	.word 0x896b4001  ! 3428: SDIVX_R	sdivx	%r13, %r1, %r4
	.word 0xc8d7e020  ! 3429: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	mov 0x35, %r30
	.word 0x85d0001e  ! 3430: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x87a28d2e  ! 3431: FsMULd	fsmuld	%f10, %f14, %f34
	.word 0xc6d804a0  ! 3432: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
DS_191:
	.word 0x34800001  ! 3434: BG	bg,a	<label_0x1>
	.word 0xd930800d  ! 3434: STQF_R	-	%f12, [%r13, %r2]
	.word 0x93458000  ! 3433: RD_SOFTINT_REG	rd	%softint, %r9
DS_192:
	.word 0x34800001  ! 3435: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b0c30b  ! 3434: ALLIGNADDRESS	alignaddr	%r3, %r11, %r8
	.word 0x8d802000  ! 3435: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91a18dc3  ! 3436: FdMULq	fdmulq	
	.word 0x8ad9c007  ! 3437: SMULcc_R	smulcc 	%r7, %r7, %r5
DS_193:
	.word 0x20800001  ! 3439: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db0c30f  ! 3438: ALLIGNADDRESS	alignaddr	%r3, %r15, %r6
	.word 0xcd27c00f  ! 3439: STF_R	st	%f6, [%r15, %r31]
	.word 0x81982119  ! 3440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0119, %hpstate
	.word 0x819822c7  ! 3441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0x819827d8  ! 3442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d8, %hpstate
	.word 0x95d02033  ! 3443: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x9a78400a  ! 3444: SDIV_R	sdiv 	%r1, %r10, %r13
	.word 0xda800c60  ! 3445: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
	.word 0xda880e40  ! 3446: LDUBA_R	lduba	[%r0, %r0] 0x72, %r13
	.word 0x93d02033  ! 3447: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87d02035  ! 3448: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0xdad7e030  ! 3449: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0x8d9024cb  ! 3450: WRPR_PSTATE_I	wrpr	%r0, 0x04cb, %pstate
	.word 0x85a01a68  ! 3451: FqTOi	fqtoi	
	.word 0x9e4b0006  ! 3452: MULX_R	mulx 	%r12, %r6, %r15
	.word 0x9dd02030  ! 3453: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x8d902acc  ! 3454: WRPR_PSTATE_I	wrpr	%r0, 0x0acc, %pstate
	.word 0x8d902e1b  ! 3455: WRPR_PSTATE_I	wrpr	%r0, 0x0e1b, %pstate
	.word 0x8d902ed6  ! 3456: WRPR_PSTATE_I	wrpr	%r0, 0x0ed6, %pstate
	.word 0x8198255b  ! 3457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055b, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8453c00c  ! 3459: UMUL_R	umul 	%r15, %r12, %r2
	.word 0xc48008a0  ! 3460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x80c36001  ! 3461: ADDCcc_I	addccc 	%r13, 0x0001, %r0
	.word 0xc08008a0  ! 3462: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8ed0800f  ! 3463: UMULcc_R	umulcc 	%r2, %r15, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x26700001  ! 3465: BPL	<illegal instruction>
	.word 0x8d9026c5  ! 3466: WRPR_PSTATE_I	wrpr	%r0, 0x06c5, %pstate
	.word 0x8d802000  ! 3467: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce57e001  ! 3468: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x38700001  ! 3469: BPGU	<illegal instruction>
	.word 0xce800aa0  ! 3470: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r7
	.word 0x81982d04  ! 3471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
	.word 0x8d902e5d  ! 3472: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	mov 0x30, %r30
	.word 0x8bd0001e  ! 3473: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8198289f  ! 3474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0x81982f55  ! 3475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
DS_194:
	.word 0x32800001  ! 3477: BNE	bne,a	<label_0x1>
	.word 0xd330000c  ! 3477: STQF_R	-	%f9, [%r12, %r0]
	.word 0x8d458000  ! 3476: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x81982284  ! 3477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0284, %hpstate
	.word 0x81982359  ! 3478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0359, %hpstate
	.word 0xccd004a0  ! 3479: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819823c3  ! 3481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c3, %hpstate
	.word 0x9fa00564  ! 3482: FSQRTq	fsqrt	
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x90dac004  ! 3484: SMULcc_R	smulcc 	%r11, %r4, %r8
DS_195:
	.word 0x34800001  ! 3486: BG	bg,a	<label_0x1>
	.word 0xdd304003  ! 3486: STQF_R	-	%f14, [%r3, %r1]
	.word 0x9b458000  ! 3485: RD_SOFTINT_REG	rd	%softint, %r13
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x85d0001e  ! 3488: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x81982dc8  ! 3489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc8, %hpstate
	.word 0xda8fe030  ! 3490: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x2c800001  ! 3491: BNEG	bneg,a	<label_0x1>
	.word 0xda7fe001  ! 3492: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x819823d0  ! 3493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d0, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81d02035  ! 3495: Tcc_I	tn	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x89a249c8  ! 3497: FDIVd	fdivd	%f40, %f8, %f4
	.word 0x8d902c17  ! 3498: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
	.word 0x87802004  ! 3499: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902c0d  ! 3500: WRPR_PSTATE_I	wrpr	%r0, 0x0c0d, %pstate
	.word 0x8198228a  ! 3501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028a, %hpstate
	.word 0xc89fe001  ! 3502: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x81982f9c  ! 3503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9c, %hpstate
DS_196:
	.word 0x32800001  ! 3505: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b2830d  ! 3504: ALLIGNADDRESS	alignaddr	%r10, %r13, %r3
	.word 0x8d90204b  ! 3505: WRPR_PSTATE_I	wrpr	%r0, 0x004b, %pstate
	.word 0x87802080  ! 3506: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc69004a0  ! 3507: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x9a828004  ! 3508: ADDcc_R	addcc 	%r10, %r4, %r13
	.word 0x90682001  ! 3509: UDIVX_I	udivx 	%r0, 0x0001, %r8
	.word 0xd137c004  ! 3510: STQF_R	-	%f8, [%r4, %r31]
	.word 0x85d02033  ! 3511: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x8d90241a  ! 3512: WRPR_PSTATE_I	wrpr	%r0, 0x041a, %pstate
	.word 0x8d51c000  ! 3513: RDPR_TL	rdpr	%tl, %r6
	.word 0xccffc024  ! 3514: SWAPA_R	swapa	%r6, [%r31 + %r4] 0x01
	.word 0x8bd02034  ! 3515: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x38800001  ! 3516: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x96482001  ! 3518: MULX_I	mulx 	%r0, 0x0001, %r11
	.word 0xd6d804a0  ! 3519: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	mov 0x30, %r30
	.word 0x8dd0001e  ! 3520: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd6c804a0  ! 3521: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x8dd02034  ! 3522: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x9281a001  ! 3523: ADDcc_I	addcc 	%r6, 0x0001, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90289e  ! 3525: WRPR_PSTATE_I	wrpr	%r0, 0x089e, %pstate
	.word 0x8d902ad0  ! 3526: WRPR_PSTATE_I	wrpr	%r0, 0x0ad0, %pstate
	.word 0x2a700001  ! 3527: BPCS	<illegal instruction>
	.word 0x8da00544  ! 3528: FSQRTd	fsqrt	
	.word 0x8198279e  ! 3529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
	.word 0xcc97e000  ! 3530: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc4fc000  ! 3532: LDSB_R	ldsb	[%r31 + %r0], %r6
	.word 0xcc77e001  ! 3533: STX_I	stx	%r6, [%r31 + 0x0001]
	mov 0x30, %r30
	.word 0x87d0001e  ! 3534: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	mov 0x31, %r30
	.word 0x81d0001e  ! 3536: Tcc_R	tn	icc_or_xcc, %r0 + %r30
DS_197:
	.word 0x34800001  ! 3538: BG	bg,a	<label_0x1>
	.word 0xc331400b  ! 3538: STQF_R	-	%f1, [%r11, %r5]
	.word 0x91458000  ! 3537: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8cc02001  ! 3538: ADDCcc_I	addccc 	%r0, 0x0001, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc8008a0  ! 3540: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	mov 0x32, %r30
	.word 0x85d0001e  ! 3541: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 3542: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8da01a60  ! 3543: FqTOi	fqtoi	
	.word 0x81982a06  ! 3544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a06, %hpstate
	.word 0x8d902214  ! 3545: WRPR_PSTATE_I	wrpr	%r0, 0x0214, %pstate
	.word 0x8d504000  ! 3546: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x876b800a  ! 3547: SDIVX_R	sdivx	%r14, %r10, %r3
	.word 0x89500000  ! 3548: RDPR_TPC	rdpr	%tpc, %r4
	.word 0xc9e7c02a  ! 3549: CASA_I	casa	[%r31] 0x 1, %r10, %r4
	.word 0x85a2cd25  ! 3550: FsMULd	fsmuld	%f11, %f36, %f2
	.word 0xc4d7e000  ! 3551: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0xc48008a0  ! 3552: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x28700001  ! 3553: BPLEU	<illegal instruction>
DS_198:
	.word 0x20800001  ! 3555: BN	bn,a	<label_0x1>
	.word 0xd933e001  ! 3555: STQF_I	-	%f12, [0x0001, %r15]
	.word 0x9b458000  ! 3554: RD_SOFTINT_REG	rd	%softint, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9fa2cd26  ! 3556: FsMULd	fsmuld	%f11, %f6, %f46
	.word 0x8ba0054e  ! 3557: FSQRTd	fsqrt	
	.word 0x8681400e  ! 3558: ADDcc_R	addcc 	%r5, %r14, %r3
	.word 0x8d9024dc  ! 3559: WRPR_PSTATE_I	wrpr	%r0, 0x04dc, %pstate
	.word 0xc6dfe020  ! 3560: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0x32800001  ! 3561: BNE	bne,a	<label_0x1>
	.word 0x8d902004  ! 3562: WRPR_PSTATE_I	wrpr	%r0, 0x0004, %pstate
	.word 0x8d802004  ! 3563: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x9fd0001e  ! 3565: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982fd3  ! 3568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9dd02030  ! 3570: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x83d02034  ! 3571: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc727c00e  ! 3572: STF_R	st	%f3, [%r14, %r31]
	.word 0xc68fe020  ! 3573: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0x85500000  ! 3574: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x3e700001  ! 3575: BPVC	<illegal instruction>
	.word 0x81982083  ! 3576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0083, %hpstate
	.word 0xc5e7c02e  ! 3577: CASA_I	casa	[%r31] 0x 1, %r14, %r2
	.word 0xc4c7e030  ! 3578: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0x9282c009  ! 3579: ADDcc_R	addcc 	%r11, %r9, %r9
	.word 0x8d802004  ! 3580: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd2900e40  ! 3581: LDUHA_R	lduha	[%r0, %r0] 0x72, %r9
	.word 0x81982156  ! 3582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0156, %hpstate
	.word 0x819822dd  ! 3583: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dd, %hpstate
	.word 0xd28008a0  ! 3584: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d902a0b  ! 3585: WRPR_PSTATE_I	wrpr	%r0, 0x0a0b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	mov 0x33, %r30
	.word 0x9bd0001e  ! 3588: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x33, %r30
	.word 0x8bd0001e  ! 3590: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x836ac006  ! 3591: SDIVX_R	sdivx	%r11, %r6, %r1
	.word 0x9b494000  ! 3592: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x95a38d2e  ! 3593: FsMULd	fsmuld	%f14, %f14, %f10
	.word 0x8d902ec2  ! 3594: WRPR_PSTATE_I	wrpr	%r0, 0x0ec2, %pstate
	.word 0xd44fe001  ! 3595: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x8d802004  ! 3596: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x2e700001  ! 3597: BPVS	<illegal instruction>
	.word 0xd43fe001  ! 3598: STD_I	std	%r10, [%r31 + 0x0001]
	.word 0x98db800d  ! 3599: SMULcc_R	smulcc 	%r14, %r13, %r12
	.word 0x80d22001  ! 3600: UMULcc_I	umulcc 	%r8, 0x0001, %r0
	.word 0x8198235d  ! 3601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
	.word 0x8d902a09  ! 3602: WRPR_PSTATE_I	wrpr	%r0, 0x0a09, %pstate
	.word 0x93514000  ! 3603: RDPR_TBA	rdpr	%tba, %r9
	.word 0xd2c7e030  ! 3604: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0x8dd02031  ! 3605: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x827ba001  ! 3606: SDIV_I	sdiv 	%r14, 0x0001, %r1
	.word 0x8198209d  ! 3607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009d, %hpstate
	.word 0x8198260b  ! 3608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060b, %hpstate
	.word 0x91d02033  ! 3609: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982f48  ! 3611: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
	.word 0xc327c00d  ! 3612: STF_R	st	%f1, [%r13, %r31]
	.word 0x81982c19  ! 3613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c19, %hpstate
	.word 0x8da289ca  ! 3614: FDIVd	fdivd	%f10, %f10, %f6
	.word 0x87d02033  ! 3615: Tcc_I	tl	icc_or_xcc, %r0 + 51
	mov 0x35, %r30
	.word 0x81d0001e  ! 3616: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xcc8008a0  ! 3617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x81982896  ! 3618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
	.word 0xcd27e001  ! 3619: STF_I	st	%f6, [0x0001, %r31]
	.word 0x90c02001  ! 3620: ADDCcc_I	addccc 	%r0, 0x0001, %r8
	.word 0x81d02033  ! 3621: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x8d902a99  ! 3622: WRPR_PSTATE_I	wrpr	%r0, 0x0a99, %pstate
	.word 0x81982545  ! 3623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0545, %hpstate
	.word 0x827b000c  ! 3624: SDIV_R	sdiv 	%r12, %r12, %r1
	mov 0x31, %r30
	.word 0x9fd0001e  ! 3625: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc3e7c02c  ! 3626: CASA_I	casa	[%r31] 0x 1, %r12, %r1
	.word 0x94d3c00c  ! 3627: UMULcc_R	umulcc 	%r15, %r12, %r10
	.word 0xd4d80e60  ! 3628: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
	.word 0xd4d80e80  ! 3629: LDXA_R	ldxa	[%r0, %r0] 0x74, %r10
	.word 0xd447e001  ! 3630: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x9ac12001  ! 3631: ADDCcc_I	addccc 	%r4, 0x0001, %r13
	.word 0x819824d7  ! 3632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d7, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x24700001  ! 3634: BPLE	<illegal instruction>
	.word 0x85a00544  ! 3635: FSQRTd	fsqrt	
	.word 0x8d902a1a  ! 3636: WRPR_PSTATE_I	wrpr	%r0, 0x0a1a, %pstate
	.word 0xc4ffc024  ! 3637: SWAPA_R	swapa	%r2, [%r31 + %r4] 0x01
	.word 0x8d902810  ! 3638: WRPR_PSTATE_I	wrpr	%r0, 0x0810, %pstate
	.word 0x83a00562  ! 3639: FSQRTq	fsqrt	
	.word 0x8d902000  ! 3640: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	.word 0x8d902289  ! 3641: WRPR_PSTATE_I	wrpr	%r0, 0x0289, %pstate
	mov 0x32, %r30
	.word 0x97d0001e  ! 3642: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x85a30d22  ! 3643: FsMULd	fsmuld	%f12, %f2, %f2
	.word 0x819827c8  ! 3644: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c8, %hpstate
	.word 0x8198279e  ! 3645: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
	.word 0x81982655  ! 3646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0655, %hpstate
	mov 0x34, %r30
	.word 0x81d0001e  ! 3647: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9150c000  ! 3648: RDPR_TT	rdpr	%tt, %r8
	.word 0x819820df  ! 3649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00df, %hpstate
	.word 0xd007e001  ! 3650: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8d90288c  ! 3651: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0x83a00543  ! 3652: FSQRTd	fsqrt	
	.word 0x81a0056a  ! 3653: FSQRTq	fsqrt	
	.word 0x22800001  ! 3654: BE	be,a	<label_0x1>
	.word 0x9fd02031  ! 3655: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x87802004  ! 3656: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982f8a  ! 3657: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8a, %hpstate
	.word 0x819828ca  ! 3658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
DS_199:
	.word 0x20800001  ! 3660: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85b0830c  ! 3659: ALLIGNADDRESS	alignaddr	%r2, %r12, %r2
	.word 0xc40fc000  ! 3660: LDUB_R	ldub	[%r31 + %r0], %r2
	.word 0x8d90221a  ! 3661: WRPR_PSTATE_I	wrpr	%r0, 0x021a, %pstate
	.word 0xc4c7e010  ! 3662: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	mov 0x34, %r30
	.word 0x97d0001e  ! 3663: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8452400c  ! 3664: UMUL_R	umul 	%r9, %r12, %r2
	.word 0x93a28d22  ! 3665: FsMULd	fsmuld	%f10, %f2, %f40
	.word 0x8d902c4f  ! 3666: WRPR_PSTATE_I	wrpr	%r0, 0x0c4f, %pstate
	.word 0x8d9026c4  ! 3667: WRPR_PSTATE_I	wrpr	%r0, 0x06c4, %pstate
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x91d0001e  ! 3669: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd2c7e030  ! 3670: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
DS_200:
	.word 0x34800001  ! 3672: BG	bg,a	<label_0x1>
	.word 0xc730000b  ! 3672: STQF_R	-	%f3, [%r11, %r0]
	.word 0x97458000  ! 3671: RD_SOFTINT_REG	rd	%softint, %r11
DS_201:
	.word 0x34800001  ! 3673: BG	bg,a	<label_0x1>
	.word 0xd332c001  ! 3673: STQF_R	-	%f9, [%r1, %r11]
	.word 0x89458000  ! 3672: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x9bd02031  ! 3673: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x34800001  ! 3674: BG	bg,a	<label_0x1>
	.word 0x9da309c6  ! 3675: FDIVd	fdivd	%f12, %f6, %f14
	.word 0x8d90240e  ! 3676: WRPR_PSTATE_I	wrpr	%r0, 0x040e, %pstate
	.word 0x2e700001  ! 3677: BPVS	<illegal instruction>
	.word 0x95a0056b  ! 3678: FSQRTq	fsqrt	
	.word 0xd44fc000  ! 3679: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0x8d902e4b  ! 3680: WRPR_PSTATE_I	wrpr	%r0, 0x0e4b, %pstate
	.word 0x924be001  ! 3681: MULX_I	mulx 	%r15, 0x0001, %r9
	.word 0x89a00565  ! 3682: FSQRTq	fsqrt	
	.word 0x87802014  ! 3683: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8449a001  ! 3684: MULX_I	mulx 	%r6, 0x0001, %r2
	.word 0x22700001  ! 3685: BPE	<illegal instruction>
	.word 0x3e700001  ! 3686: BPVC	<illegal instruction>
DS_202:
	.word 0x20800001  ! 3688: BN	bn,a	<label_0x1>
	.word 0xc9334000  ! 3688: STQF_R	-	%f4, [%r0, %r13]
	.word 0x9b458000  ! 3687: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902c12  ! 3688: WRPR_PSTATE_I	wrpr	%r0, 0x0c12, %pstate
	.word 0x94c02001  ! 3689: ADDCcc_I	addccc 	%r0, 0x0001, %r10
	.word 0x8d902e1d  ! 3690: WRPR_PSTATE_I	wrpr	%r0, 0x0e1d, %pstate
	.word 0xd4bfe001  ! 3691: STDA_I	stda	%r10, [%r31 + 0x0001] %asi
	.word 0xd497e010  ! 3692: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
	.word 0xd4c7e010  ! 3693: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	mov 0x35, %r30
	.word 0x93d0001e  ! 3694: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd41fe001  ! 3695: LDD_I	ldd	[%r31 + 0x0001], %r10
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd41fe001  ! 3698: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0x8ed2c00e  ! 3699: UMULcc_R	umulcc 	%r11, %r14, %r7
	.word 0xce1fc000  ! 3700: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x819825c2  ! 3701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c2, %hpstate
	.word 0x8d802000  ! 3702: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95d02035  ! 3703: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x81982513  ! 3704: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0513, %hpstate
	.word 0x99d02035  ! 3705: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0x81982c8a  ! 3706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8a, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce4fe001  ! 3708: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	mov 0x33, %r30
	.word 0x81d0001e  ! 3709: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982f4f  ! 3710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
	.word 0x30700001  ! 3711: BPA	<illegal instruction>
	mov 0x32, %r30
	.word 0x8bd0001e  ! 3712: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xcec7e000  ! 3713: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
	.word 0x8d9028d7  ! 3714: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
	.word 0x97a08dc1  ! 3715: FdMULq	fdmulq	
	.word 0x8d802000  ! 3716: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_203:
	.word 0x22800001  ! 3718: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b38306  ! 3717: ALLIGNADDRESS	alignaddr	%r14, %r6, %r12
	mov 0x32, %r30
	.word 0x9fd0001e  ! 3718: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902688  ! 3719: WRPR_PSTATE_I	wrpr	%r0, 0x0688, %pstate
	.word 0x8d90284e  ! 3720: WRPR_PSTATE_I	wrpr	%r0, 0x084e, %pstate
DS_204:
	.word 0x22800001  ! 3722: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db18302  ! 3721: ALLIGNADDRESS	alignaddr	%r6, %r2, %r6
	.word 0xcc8008a0  ! 3722: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	mov 0x35, %r30
	.word 0x97d0001e  ! 3723: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xcc800ba0  ! 3724: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r6
	.word 0xcc7fe001  ! 3725: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x8d802000  ! 3726: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc800c40  ! 3727: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
	.word 0x8ad98004  ! 3728: SMULcc_R	smulcc 	%r6, %r4, %r5
	.word 0x8d902e13  ! 3729: WRPR_PSTATE_I	wrpr	%r0, 0x0e13, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcb27c004  ! 3731: STF_R	st	%f5, [%r4, %r31]
	.word 0x8f69a001  ! 3732: SDIVX_I	sdivx	%r6, 0x0001, %r7
	.word 0x99480000  ! 3733: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x966ac007  ! 3734: UDIVX_R	udivx 	%r11, %r7, %r11
DS_205:
	.word 0x34800001  ! 3736: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b00302  ! 3735: ALLIGNADDRESS	alignaddr	%r0, %r2, %r9
	.word 0xd3e7c022  ! 3736: CASA_I	casa	[%r31] 0x 1, %r2, %r9
	.word 0xd2cfe020  ! 3737: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x87802004  ! 3738: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8da309e2  ! 3739: FDIVq	dis not found

	.word 0xcccfe000  ! 3740: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc900e40  ! 3742: LDUHA_R	lduha	[%r0, %r0] 0x72, %r6
	.word 0xcc57e001  ! 3743: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0x91d02035  ! 3744: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x35, %r30
	.word 0x9dd0001e  ! 3745: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x8bd0001e  ! 3746: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xcc3fe001  ! 3747: STD_I	std	%r6, [%r31 + 0x0001]
	.word 0xcd37c002  ! 3748: STQF_R	-	%f6, [%r2, %r31]
	.word 0x22800001  ! 3749: BE	be,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9028d9  ! 3751: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0xcc8fe010  ! 3752: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	.word 0x87802089  ! 3753: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xcd27c002  ! 3754: STF_R	st	%f6, [%r2, %r31]
	.word 0x8d902814  ! 3755: WRPR_PSTATE_I	wrpr	%r0, 0x0814, %pstate
	.word 0x3c800001  ! 3756: BPOS	bpos,a	<label_0x1>
	.word 0xcc8008a0  ! 3757: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x87802004  ! 3758: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982293  ! 3759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0293, %hpstate
DS_206:
	.word 0x32800001  ! 3761: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb2c309  ! 3760: ALLIGNADDRESS	alignaddr	%r11, %r9, %r7
	.word 0x8d902c43  ! 3761: WRPR_PSTATE_I	wrpr	%r0, 0x0c43, %pstate
	.word 0x8d802004  ! 3762: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x34700001  ! 3763: BPG	<illegal instruction>
	.word 0xcecfe030  ! 3764: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r7
	.word 0x8a4a0008  ! 3765: MULX_R	mulx 	%r8, %r8, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90245a  ! 3767: WRPR_PSTATE_I	wrpr	%r0, 0x045a, %pstate
	.word 0x81500000  ! 3768: RDPR_TPC	rdpr	%tpc, %r0
	.word 0x8d902403  ! 3769: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0x8d902ccb  ! 3770: WRPR_PSTATE_I	wrpr	%r0, 0x0ccb, %pstate
	.word 0x90820009  ! 3771: ADDcc_R	addcc 	%r8, %r9, %r8
	.word 0x38800001  ! 3772: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 3774: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8649e001  ! 3775: MULX_I	mulx 	%r7, 0x0001, %r3
	.word 0x95d02031  ! 3776: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8d902c9a  ! 3777: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9022ca  ! 3780: WRPR_PSTATE_I	wrpr	%r0, 0x02ca, %pstate
	mov 0x33, %r30
	.word 0x81d0001e  ! 3781: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x91a000c4  ! 3782: FNEGd	fnegd	%f4, %f8
	.word 0xd09fe001  ! 3783: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	.word 0x8d902001  ! 3784: WRPR_PSTATE_I	wrpr	%r0, 0x0001, %pstate
	.word 0x9e4b8007  ! 3785: MULX_R	mulx 	%r14, %r7, %r15
	.word 0xdec7e010  ! 3786: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	.word 0x80d98008  ! 3787: SMULcc_R	smulcc 	%r6, %r8, %r0
	.word 0xc137c008  ! 3788: STQF_R	-	%f0, [%r8, %r31]
	.word 0xc0cfe000  ! 3789: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
	.word 0x866ae001  ! 3790: UDIVX_I	udivx 	%r11, 0x0001, %r3
	.word 0xc67fe001  ! 3791: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x8d90289a  ! 3792: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
DS_207:
	.word 0x20800001  ! 3794: BN	bn,a	<label_0x1>
	.word 0xd3336001  ! 3794: STQF_I	-	%f9, [0x0001, %r13]
	.word 0x9f458000  ! 3793: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x84032001  ! 3794: ADD_I	add 	%r12, 0x0001, %r2
DS_208:
	.word 0x22800001  ! 3796: BE	be,a	<label_0x1>
	.word 0xd1322001  ! 3796: STQF_I	-	%f8, [0x0001, %r8]
	.word 0x99458000  ! 3795: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8bd02030  ! 3797: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8198225c  ! 3798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025c, %hpstate
	.word 0x8ad24008  ! 3799: UMULcc_R	umulcc 	%r9, %r8, %r5
	.word 0xcac80e60  ! 3800: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r5
	.word 0xca8008a0  ! 3801: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d902a00  ! 3802: WRPR_PSTATE_I	wrpr	%r0, 0x0a00, %pstate
	.word 0x87802016  ! 3803: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982310  ! 3804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0310, %hpstate
	.word 0x8dd02031  ! 3805: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x99d02033  ! 3806: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xcad7e000  ! 3807: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r5
	.word 0x8d902857  ! 3808: WRPR_PSTATE_I	wrpr	%r0, 0x0857, %pstate
	.word 0x8bd02033  ! 3809: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x8d902e89  ! 3810: WRPR_PSTATE_I	wrpr	%r0, 0x0e89, %pstate
	.word 0xca7fe001  ! 3811: SWAP_I	swap	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982a5f  ! 3813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
	.word 0xca8008a0  ! 3814: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x996be001  ! 3815: SDIVX_I	sdivx	%r15, 0x0001, %r12
	.word 0x81982907  ! 3816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0907, %hpstate
	.word 0x98002001  ! 3817: ADD_I	add 	%r0, 0x0001, %r12
	mov 0x31, %r30
	.word 0x91d0001e  ! 3818: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902252  ! 3819: WRPR_PSTATE_I	wrpr	%r0, 0x0252, %pstate
	.word 0x8883800b  ! 3820: ADDcc_R	addcc 	%r14, %r11, %r4
	.word 0x97a08d2f  ! 3821: FsMULd	fsmuld	%f2, %f46, %f42
	.word 0x9d50c000  ! 3822: RDPR_TT	rdpr	%tt, %r14
	.word 0x8d9026d3  ! 3823: WRPR_PSTATE_I	wrpr	%r0, 0x06d3, %pstate
	.word 0x904a4002  ! 3824: MULX_R	mulx 	%r9, %r2, %r8
	.word 0xd0900e80  ! 3825: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
	.word 0x85a0054d  ! 3826: FSQRTd	fsqrt	
	.word 0x81982852  ! 3827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
	.word 0x81982a0a  ! 3828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0xc48008a0  ! 3829: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc5e7c02d  ! 3830: CASA_I	casa	[%r31] 0x 1, %r13, %r2
	.word 0x806ae001  ! 3831: UDIVX_I	udivx 	%r11, 0x0001, %r0
	.word 0xc09fc020  ! 3832: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x8d802000  ! 3833: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc09004a0  ! 3834: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc08008a0  ! 3836: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	mov 0x35, %r30
	.word 0x87d0001e  ! 3837: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc0c804a0  ! 3838: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x9a53000b  ! 3839: UMUL_R	umul 	%r12, %r11, %r13
	.word 0xda7fe001  ! 3840: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x8a4a2001  ! 3841: MULX_I	mulx 	%r8, 0x0001, %r5
DS_209:
	.word 0x22800001  ! 3843: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b38303  ! 3842: ALLIGNADDRESS	alignaddr	%r14, %r3, %r0
	.word 0xc127c003  ! 3843: STF_R	st	%f0, [%r3, %r31]
	mov 0x33, %r30
	.word 0x81d0001e  ! 3844: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 3845: BGE	bge,a	<label_0x1>
	.word 0x8d902c16  ! 3846: WRPR_PSTATE_I	wrpr	%r0, 0x0c16, %pstate
	.word 0x93d02035  ! 3847: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8f508000  ! 3848: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x85d02031  ! 3849: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xced80e60  ! 3850: LDXA_R	ldxa	[%r0, %r0] 0x73, %r7
	.word 0x8d802000  ! 3851: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_210:
	.word 0x20800001  ! 3853: BN	bn,a	<label_0x1>
	.word 0xd931a001  ! 3853: STQF_I	-	%f12, [0x0001, %r6]
	.word 0x97458000  ! 3852: RD_SOFTINT_REG	rd	%softint, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90280c  ! 3854: WRPR_PSTATE_I	wrpr	%r0, 0x080c, %pstate
	.word 0xd61fe001  ! 3855: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0x24700001  ! 3856: BPLE	<illegal instruction>
	.word 0x8d902699  ! 3857: WRPR_PSTATE_I	wrpr	%r0, 0x0699, %pstate
	.word 0x8d902652  ! 3858: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
	.word 0x99d02035  ! 3859: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0xd727e001  ! 3860: STF_I	st	%f11, [0x0001, %r31]
	mov 0x35, %r30
	.word 0x93d0001e  ! 3861: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xd6ffc023  ! 3863: SWAPA_R	swapa	%r11, [%r31 + %r3] 0x01
	.word 0x87802004  ! 3864: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802089  ! 3865: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x97a2c9a4  ! 3866: FDIVs	fdivs	%f11, %f4, %f11
	.word 0x99a01a6c  ! 3867: FqTOi	fqtoi	
	.word 0x85a349c1  ! 3868: FDIVd	fdivd	%f44, %f32, %f2
	.word 0xc537e001  ! 3869: STQF_I	-	%f2, [0x0001, %r31]
	.word 0x87802004  ! 3870: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc417e001  ! 3871: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0x89a3c9ac  ! 3872: FDIVs	fdivs	%f15, %f12, %f4
	.word 0xc88fe000  ! 3873: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902e93  ! 3875: WRPR_PSTATE_I	wrpr	%r0, 0x0e93, %pstate
	.word 0x82c2e001  ! 3876: ADDCcc_I	addccc 	%r11, 0x0001, %r1
	mov 0x32, %r30
	.word 0x87d0001e  ! 3877: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 3878: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc2c7e010  ! 3879: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r1
	.word 0xc2d004a0  ! 3880: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x87802014  ! 3881: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc27fe001  ! 3882: SWAP_I	swap	%r1, [%r31 + 0x0001]
	mov 0x31, %r30
	.word 0x95d0001e  ! 3883: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc3e7c02c  ! 3884: CASA_I	casa	[%r31] 0x 1, %r12, %r1
	.word 0x8bd02031  ! 3885: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xc2d804a0  ! 3886: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0x96d36001  ! 3887: UMULcc_I	umulcc 	%r13, 0x0001, %r11
	.word 0x9950c000  ! 3888: RDPR_TT	rdpr	%tt, %r12
	.word 0x98c2e001  ! 3889: ADDCcc_I	addccc 	%r11, 0x0001, %r12
DS_211:
	.word 0x34800001  ! 3891: BG	bg,a	<label_0x1>
	.word 0xc930e001  ! 3891: STQF_I	-	%f4, [0x0001, %r3]
	.word 0x9b458000  ! 3890: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x81982e0f  ! 3891: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0f, %hpstate
	.word 0x8d802000  ! 3892: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x2e800001  ! 3893: BVS	bvs,a	<label_0x1>
	.word 0xdb27e001  ! 3894: STF_I	st	%f13, [0x0001, %r31]
	.word 0xdb27e001  ! 3895: STF_I	st	%f13, [0x0001, %r31]
	.word 0x8e80c001  ! 3896: ADDcc_R	addcc 	%r3, %r1, %r7
	.word 0x9bd02034  ! 3897: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0xce9004a0  ! 3898: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0xce97e020  ! 3899: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982918  ! 3901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
	.word 0x87802088  ! 3902: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xcf17c000  ! 3903: LDQF_R	-	[%r31, %r0], %f7
	.word 0xcf27e001  ! 3904: STF_I	st	%f7, [0x0001, %r31]
	.word 0x819826dc  ! 3905: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dc, %hpstate
	.word 0xcec7e010  ! 3906: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	.word 0x8d902e4c  ! 3907: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
	.word 0x81982fd5  ! 3908: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd5, %hpstate
	.word 0x8d9028d7  ! 3909: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
	mov 0x31, %r30
	.word 0x97d0001e  ! 3910: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x95d0001e  ! 3911: Tcc_R	tg	icc_or_xcc, %r0 + %r30
DS_212:
	.word 0x34800001  ! 3913: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db14305  ! 3912: ALLIGNADDRESS	alignaddr	%r5, %r5, %r14
	.word 0x8d90244c  ! 3913: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
	.word 0x9dd02034  ! 3914: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	mov 0x32, %r30
	.word 0x91d0001e  ! 3915: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8751c000  ! 3917: RDPR_TL	rdpr	%tl, %r3
	.word 0xc6dfe010  ! 3918: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
	.word 0xc67fe001  ! 3919: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x89a01a65  ! 3920: FqTOi	fqtoi	
	.word 0x2e700001  ! 3921: BPVS	<illegal instruction>
	.word 0xc8ffc025  ! 3922: SWAPA_R	swapa	%r4, [%r31 + %r5] 0x01
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902857  ! 3924: WRPR_PSTATE_I	wrpr	%r0, 0x0857, %pstate
	.word 0x90dbc00a  ! 3925: SMULcc_R	smulcc 	%r15, %r10, %r8
	mov 0x35, %r30
	.word 0x8dd0001e  ! 3926: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8198288d  ! 3927: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088d, %hpstate
	.word 0xd05fe001  ! 3928: LDX_I	ldx	[%r31 + 0x0001], %r8
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x35, %r30
	.word 0x8fd0001e  ! 3930: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87480000  ! 3932: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x87802016  ! 3933: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9da0056e  ! 3934: FSQRTq	fsqrt	
	.word 0x9878a001  ! 3935: SDIV_I	sdiv 	%r2, 0x0001, %r12
	.word 0x93a00563  ! 3936: FSQRTq	fsqrt	
	.word 0x8151c000  ! 3937: RDPR_TL	rdpr	%tl, %r0
	.word 0x8d902650  ! 3938: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0x99500000  ! 3939: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x30800001  ! 3940: BA	ba,a	<label_0x1>
	.word 0x8d902c0f  ! 3941: WRPR_PSTATE_I	wrpr	%r0, 0x0c0f, %pstate
	.word 0xd88008a0  ! 3942: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x9ba00568  ! 3943: FSQRTq	fsqrt	
	.word 0x9ba109e1  ! 3944: FDIVq	dis not found

	.word 0x87802088  ! 3945: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x92d14002  ! 3946: UMULcc_R	umulcc 	%r5, %r2, %r9
	.word 0x9e518002  ! 3947: UMUL_R	umul 	%r6, %r2, %r15
	.word 0x8198220e  ! 3948: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020e, %hpstate
	mov 0x30, %r30
	.word 0x8dd0001e  ! 3949: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xdeffc022  ! 3950: SWAPA_R	swapa	%r15, [%r31 + %r2] 0x01
	.word 0xde97e030  ! 3951: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdfe7c022  ! 3953: CASA_I	casa	[%r31] 0x 1, %r2, %r15
	.word 0x9bd02030  ! 3954: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x30700001  ! 3955: BPA	<illegal instruction>
	.word 0xde7fe001  ! 3956: SWAP_I	swap	%r15, [%r31 + 0x0001]
	.word 0x99d02034  ! 3957: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x2e800001  ! 3958: BVS	bvs,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90249c  ! 3960: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
	.word 0x8d902490  ! 3961: WRPR_PSTATE_I	wrpr	%r0, 0x0490, %pstate
	.word 0x87802080  ! 3962: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8198258a  ! 3963: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058a, %hpstate
	.word 0x8d802004  ! 3964: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x9da01a61  ! 3966: FqTOi	fqtoi	
	.word 0x8d90208a  ! 3967: WRPR_PSTATE_I	wrpr	%r0, 0x008a, %pstate
	mov 0x33, %r30
	.word 0x9fd0001e  ! 3968: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8a802001  ! 3969: ADDcc_I	addcc 	%r0, 0x0001, %r5
DS_213:
	.word 0x22800001  ! 3971: BE	be,a	<label_0x1>
	.word 0xd530a001  ! 3971: STQF_I	-	%f10, [0x0001, %r2]
	.word 0x97458000  ! 3970: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d902889  ! 3971: WRPR_PSTATE_I	wrpr	%r0, 0x0889, %pstate
	mov 0x31, %r30
	.word 0x93d0001e  ! 3972: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90228e  ! 3974: WRPR_PSTATE_I	wrpr	%r0, 0x028e, %pstate
	.word 0xd6800c60  ! 3975: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
	.word 0x8d902a46  ! 3976: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
	.word 0x8d9024d3  ! 3977: WRPR_PSTATE_I	wrpr	%r0, 0x04d3, %pstate
	.word 0x81a00549  ! 3978: FSQRTd	fsqrt	
	.word 0x8d902c1c  ! 3979: WRPR_PSTATE_I	wrpr	%r0, 0x0c1c, %pstate
	.word 0x34800001  ! 3980: BG	bg,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8a818006  ! 3982: ADDcc_R	addcc 	%r6, %r6, %r5
	.word 0x24700001  ! 3983: BPLE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xca8008a0  ! 3985: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca800bc0  ! 3986: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r5
	.word 0x95a3cd29  ! 3987: FsMULd	fsmuld	%f15, %f40, %f10
	.word 0x8d902003  ! 3988: WRPR_PSTATE_I	wrpr	%r0, 0x0003, %pstate
	.word 0x8d902804  ! 3989: WRPR_PSTATE_I	wrpr	%r0, 0x0804, %pstate
	.word 0x8d90201b  ! 3990: WRPR_PSTATE_I	wrpr	%r0, 0x001b, %pstate
	.word 0x8d902e58  ! 3991: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0x87d02032  ! 3992: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 3993: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x99a0054f  ! 3995: FSQRTd	fsqrt	
	.word 0x9602a001  ! 3996: ADD_I	add 	%r10, 0x0001, %r11
	.word 0x8d802000  ! 3997: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd6800c00  ! 3999: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	mov 0x33, %r30
	.word 0x99d0001e  ! 4002: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x81982953  ! 4003: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0953, %hpstate
	.word 0x87802004  ! 4004: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902802  ! 4006: WRPR_PSTATE_I	wrpr	%r0, 0x0802, %pstate
	.word 0x81982d01  ! 4007: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d01, %hpstate
	.word 0x8ed1400b  ! 4008: UMULcc_R	umulcc 	%r5, %r11, %r7
	.word 0x30700001  ! 4009: BPA	<illegal instruction>
	.word 0x85d02035  ! 4010: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xcf37e001  ! 4011: STQF_I	-	%f7, [0x0001, %r31]
	.word 0x8dd02032  ! 4012: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0xce7fe001  ! 4013: SWAP_I	swap	%r7, [%r31 + 0x0001]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce8008a0  ! 4015: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x904a0000  ! 4016: MULX_R	mulx 	%r8, %r0, %r8
	.word 0x81982854  ! 4017: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0854, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd1e7c020  ! 4019: CASA_I	casa	[%r31] 0x 1, %r0, %r8
	.word 0x81a2c9a2  ! 4020: FDIVs	fdivs	%f11, %f2, %f0
	.word 0xc0d00e60  ! 4021: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r0
	.word 0xc0c804a0  ! 4022: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x81982b1d  ! 4023: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0x8d802000  ! 4024: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc0880e80  ! 4025: LDUBA_R	lduba	[%r0, %r0] 0x74, %r0
	.word 0x99a34d25  ! 4026: FsMULd	fsmuld	%f13, %f36, %f12
	.word 0x9fa0056b  ! 4027: FSQRTq	fsqrt	
	.word 0xde3fc00b  ! 4028: STD_R	std	%r15, [%r31 + %r11]
	.word 0x976a6001  ! 4029: SDIVX_I	sdivx	%r9, 0x0001, %r11
	.word 0xd727c00b  ! 4030: STF_R	st	%f11, [%r11, %r31]
	.word 0x20700001  ! 4031: BPN	<illegal instruction>
	.word 0xd6c7e010  ! 4032: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0x84c02001  ! 4033: ADDCcc_I	addccc 	%r0, 0x0001, %r2
	.word 0x81982c4a  ! 4034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
	.word 0xc42fe001  ! 4035: STB_I	stb	%r2, [%r31 + 0x0001]
	.word 0x8fa2c9c9  ! 4036: FDIVd	fdivd	%f42, %f40, %f38
	.word 0x24700001  ! 4037: BPLE	<illegal instruction>
	.word 0xcf3fc009  ! 4038: STDF_R	std	%f7, [%r9, %r31]
	.word 0x8bd02032  ! 4039: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x84694004  ! 4040: UDIVX_R	udivx 	%r5, %r4, %r2
	.word 0x844a2001  ! 4041: MULX_I	mulx 	%r8, 0x0001, %r2
	.word 0x83d02033  ! 4042: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_214:
	.word 0x32800001  ! 4044: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b30302  ! 4043: ALLIGNADDRESS	alignaddr	%r12, %r2, %r0
	.word 0x846ac00c  ! 4044: UDIVX_R	udivx 	%r11, %r12, %r2
	.word 0x8198238b  ! 4045: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038b, %hpstate
	.word 0x82c1a001  ! 4046: ADDCcc_I	addccc 	%r6, 0x0001, %r1
	.word 0x8fd02034  ! 4047: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	mov 0x30, %r30
	.word 0x95d0001e  ! 4048: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc28008a0  ! 4049: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81d02032  ! 4050: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x9e834009  ! 4051: ADDcc_R	addcc 	%r13, %r9, %r15
	.word 0x81982a4a  ! 4052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
	.word 0xdecfe020  ! 4053: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0xde97e010  ! 4054: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r15
	.word 0x819826d6  ! 4055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d6, %hpstate
	.word 0x81982202  ! 4056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0202, %hpstate
	.word 0x83494000  ! 4057: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0xc2c004a0  ! 4058: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982782  ! 4060: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0782, %hpstate
	.word 0x9481000a  ! 4061: ADDcc_R	addcc 	%r4, %r10, %r10
	.word 0xd4ffc02a  ! 4062: SWAPA_R	swapa	%r10, [%r31 + %r10] 0x01
DS_215:
	.word 0x34800001  ! 4064: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db04307  ! 4063: ALLIGNADDRESS	alignaddr	%r1, %r7, %r14
	.word 0x916ba001  ! 4064: SDIVX_I	sdivx	%r14, 0x0001, %r8
DS_216:
	.word 0x22800001  ! 4066: BE	be,a	<label_0x1>
	.word 0xc132a001  ! 4066: STQF_I	-	%f0, [0x0001, %r10]
	.word 0x95458000  ! 4065: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd4d004a0  ! 4066: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x84d1a001  ! 4067: UMULcc_I	umulcc 	%r6, 0x0001, %r2
	.word 0x8d902e89  ! 4068: WRPR_PSTATE_I	wrpr	%r0, 0x0e89, %pstate
	.word 0x8ba309c8  ! 4069: FDIVd	fdivd	%f12, %f8, %f36
	.word 0x9d480000  ! 4070: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819822c1  ! 4072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c1, %hpstate
	.word 0xdc9fc020  ! 4073: LDDA_R	ldda	[%r31, %r0] 0x01, %r14
	.word 0xdd27c008  ! 4074: STF_R	st	%f14, [%r8, %r31]
	.word 0x8fa01a6d  ! 4075: FqTOi	fqtoi	
	.word 0x87d02033  ! 4076: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x87802088  ! 4077: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99a01a6c  ! 4078: FqTOi	fqtoi	
DS_217:
	.word 0x22800001  ! 4080: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b3830b  ! 4079: ALLIGNADDRESS	alignaddr	%r14, %r11, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x20800001  ! 4081: BN	bn,a	<label_0x1>
	.word 0x9ba389c7  ! 4082: FDIVd	fdivd	%f14, %f38, %f44
DS_218:
	.word 0x34800001  ! 4084: BG	bg,a	<label_0x1>
	.word 0xcf302001  ! 4084: STQF_I	-	%f7, [0x0001, %r0]
	.word 0x8b458000  ! 4083: RD_SOFTINT_REG	rd	%softint, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x96d0c001  ! 4085: UMULcc_R	umulcc 	%r3, %r1, %r11
	.word 0x927ac00a  ! 4086: SDIV_R	sdiv 	%r11, %r10, %r9
	.word 0xd29fe001  ! 4087: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	.word 0x819828cc  ! 4088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
	.word 0x87802010  ! 4089: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x28700001  ! 4091: BPLEU	<illegal instruction>
	.word 0xd2c804a0  ! 4092: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x8c484001  ! 4093: MULX_R	mulx 	%r1, %r1, %r6
	.word 0x806b400a  ! 4094: UDIVX_R	udivx 	%r13, %r10, %r0
	.word 0x20800001  ! 4095: BN	bn,a	<label_0x1>
	.word 0x2a700001  ! 4096: BPCS	<illegal instruction>
	.word 0x8d902a11  ! 4097: WRPR_PSTATE_I	wrpr	%r0, 0x0a11, %pstate
	.word 0x85d02030  ! 4098: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x81982f04  ! 4099: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f04, %hpstate
	.word 0x8fd02035  ! 4100: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xc08008a0  ! 4101: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	mov 0x31, %r30
	.word 0x97d0001e  ! 4102: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x94826001  ! 4103: ADDcc_I	addcc 	%r9, 0x0001, %r10
	.word 0x87a000c6  ! 4104: FNEGd	fnegd	%f6, %f34
	.word 0x8d802004  ! 4105: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc737c006  ! 4106: STQF_R	-	%f3, [%r6, %r31]
	.word 0x81982747  ! 4107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0747, %hpstate
	.word 0xc67fe001  ! 4108: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0xc6c7e010  ! 4109: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0x9bd02035  ! 4110: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x34700001  ! 4112: BPG	<illegal instruction>
	.word 0x81982601  ! 4113: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0601, %hpstate
	.word 0xc6cfe030  ! 4114: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r3
	.word 0x9fd02033  ! 4115: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x81982505  ! 4116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0505, %hpstate
	.word 0x8d90268b  ! 4117: WRPR_PSTATE_I	wrpr	%r0, 0x068b, %pstate
	.word 0x24700001  ! 4118: BPLE	<illegal instruction>
	.word 0xc6dfe000  ! 4119: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r3
	.word 0x36800001  ! 4120: BGE	bge,a	<label_0x1>
	.word 0x81982b59  ! 4121: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b59, %hpstate
	.word 0x8f480000  ! 4122: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xce1fe001  ! 4123: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0x8d90261a  ! 4124: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
	.word 0x9ba3c9e6  ! 4125: FDIVq	dis not found

	.word 0xda8008a0  ! 4126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
DS_219:
	.word 0x34800001  ! 4128: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b0c304  ! 4127: ALLIGNADDRESS	alignaddr	%r3, %r4, %r0
	.word 0xc09004a0  ! 4128: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	mov 0x30, %r30
	.word 0x9fd0001e  ! 4129: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x826b0003  ! 4130: UDIVX_R	udivx 	%r12, %r3, %r1
	.word 0xc2d7e000  ! 4131: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	.word 0xc297e030  ! 4132: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r1
	.word 0x8fd02032  ! 4133: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	mov 0x30, %r30
	.word 0x9dd0001e  ! 4134: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x9dd02033  ! 4135: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0xc337c003  ! 4136: STQF_R	-	%f1, [%r3, %r31]
	.word 0x81982713  ! 4137: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0713, %hpstate
	.word 0xc27fe001  ! 4138: SWAP_I	swap	%r1, [%r31 + 0x0001]
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85a1c9c5  ! 4141: FDIVd	fdivd	%f38, %f36, %f2
	.word 0x9b50c000  ! 4142: RDPR_TT	rdpr	%tt, %r13
	.word 0x81982807  ! 4143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
	.word 0x819827df  ! 4144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0xda8804a0  ! 4145: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x8369e001  ! 4146: SDIVX_I	sdivx	%r7, 0x0001, %r1
	.word 0xc2c804a0  ! 4147: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0xc28008a0  ! 4148: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
DS_220:
	.word 0x22800001  ! 4150: BE	be,a	<label_0x1>
	.word 0xc333c007  ! 4150: STQF_R	-	%f1, [%r7, %r15]
	.word 0x8f458000  ! 4149: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d902411  ! 4150: WRPR_PSTATE_I	wrpr	%r0, 0x0411, %pstate
	.word 0x8d9020c8  ! 4151: WRPR_PSTATE_I	wrpr	%r0, 0x00c8, %pstate
	.word 0x81982302  ! 4152: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0302, %hpstate
	.word 0x91d02034  ! 4153: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xce800b40  ! 4154: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r7
	.word 0xceffc027  ! 4155: SWAPA_R	swapa	%r7, [%r31 + %r7] 0x01
	mov 0x34, %r30
	.word 0x97d0001e  ! 4156: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x96482001  ! 4157: MULX_I	mulx 	%r0, 0x0001, %r11
	.word 0x22700001  ! 4158: BPE	<illegal instruction>
	.word 0x81982bc3  ! 4159: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc3, %hpstate
	.word 0xd6dfe030  ! 4160: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x81982cd7  ! 4161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
DS_221:
	.word 0x34800001  ! 4163: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b2c309  ! 4162: ALLIGNADDRESS	alignaddr	%r11, %r9, %r2
DS_222:
	.word 0x32800001  ! 4164: BNE	bne,a	<label_0x1>
	.word 0xd7314003  ! 4164: STQF_R	-	%f11, [%r3, %r5]
	.word 0x99458000  ! 4163: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x96496001  ! 4164: MULX_I	mulx 	%r5, 0x0001, %r11
	.word 0x8d802000  ! 4165: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6ffc023  ! 4166: SWAPA_R	swapa	%r11, [%r31 + %r3] 0x01
	.word 0x8d500000  ! 4167: RDPR_TPC	rdpr	%tpc, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x24800001  ! 4169: BLE	ble,a	<label_0x1>
	.word 0x26800001  ! 4170: BL	bl,a	<label_0x1>
	.word 0x819824c5  ! 4171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c5, %hpstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x34, %r30
	.word 0x8bd0001e  ! 4173: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8f500000  ! 4174: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x87802004  ! 4175: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9026d5  ! 4176: WRPR_PSTATE_I	wrpr	%r0, 0x06d5, %pstate
	.word 0x87802004  ! 4177: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xce9fc020  ! 4179: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0xce800c40  ! 4180: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r7
	.word 0x81982e0e  ! 4181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0e, %hpstate
	.word 0x9468e001  ! 4182: UDIVX_I	udivx 	%r3, 0x0001, %r10
	.word 0xd48804a0  ! 4183: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x8d802000  ! 4184: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198264c  ! 4185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064c, %hpstate
	.word 0xd4c004a0  ! 4186: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x9551c000  ! 4187: RDPR_TL	rdpr	%tl, %r10
	.word 0x20700001  ! 4188: BPN	<illegal instruction>
	.word 0x8468a001  ! 4189: UDIVX_I	udivx 	%r2, 0x0001, %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x907a2001  ! 4191: SDIV_I	sdiv 	%r8, 0x0001, %r8
	.word 0x95d02033  ! 4192: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x8ed1000f  ! 4193: UMULcc_R	umulcc 	%r4, %r15, %r7
	.word 0x8d902203  ! 4194: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0x8d902401  ! 4195: WRPR_PSTATE_I	wrpr	%r0, 0x0401, %pstate
	.word 0x8198200c  ! 4196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0x9448c006  ! 4197: MULX_R	mulx 	%r3, %r6, %r10
	.word 0xd4d804a0  ! 4198: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x81a01a6e  ! 4199: FqTOi	fqtoi	
DS_223:
	.word 0x32800001  ! 4201: BNE	bne,a	<label_0x1>
	.word 0xc3326001  ! 4201: STQF_I	-	%f1, [0x0001, %r9]
	.word 0x9d458000  ! 4200: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x9bd02031  ! 4201: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x87802004  ! 4202: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982048  ! 4204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0048, %hpstate
	.word 0x819828ca  ! 4205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
	.word 0x8cc22001  ! 4206: ADDCcc_I	addccc 	%r8, 0x0001, %r6
	.word 0x819821dc  ! 4207: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dc, %hpstate
	.word 0x8f500000  ! 4208: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x81982a8b  ! 4209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8b, %hpstate
	.word 0x8d902cc3  ! 4210: WRPR_PSTATE_I	wrpr	%r0, 0x0cc3, %pstate
	.word 0x8d902a13  ! 4211: WRPR_PSTATE_I	wrpr	%r0, 0x0a13, %pstate
	.word 0x8fd02035  ! 4212: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x85a0054e  ! 4213: FSQRTd	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982b5f  ! 4215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5f, %hpstate
	mov 0x35, %r30
	.word 0x93d0001e  ! 4216: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83508000  ! 4217: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0xc2dfe030  ! 4218: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	.word 0x85d02035  ! 4219: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xc33fc00e  ! 4220: STDF_R	std	%f1, [%r14, %r31]
	.word 0x83d02035  ! 4221: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d902ac1  ! 4222: WRPR_PSTATE_I	wrpr	%r0, 0x0ac1, %pstate
	.word 0x87802080  ! 4223: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d9026c1  ! 4224: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0x804ae001  ! 4225: MULX_I	mulx 	%r11, 0x0001, %r0
	.word 0x3e800001  ! 4226: BVC	bvc,a	<label_0x1>
	.word 0x8d90208c  ! 4227: WRPR_PSTATE_I	wrpr	%r0, 0x008c, %pstate
	.word 0xc0d80e40  ! 4228: LDXA_R	ldxa	[%r0, %r0] 0x72, %r0
	.word 0xc0ffc02e  ! 4229: SWAPA_R	swapa	%r0, [%r31 + %r14] 0x01
	.word 0x93d02033  ! 4230: Tcc_I	tne	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90205a  ! 4232: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	.word 0xc0d804a0  ! 4233: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x81982dd6  ! 4234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd6, %hpstate
	.word 0xc01fc000  ! 4235: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x819829c5  ! 4236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c5, %hpstate
	.word 0x81982900  ! 4237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
	.word 0x89a000cb  ! 4238: FNEGd	fnegd	%f42, %f4
	.word 0x819829d4  ! 4239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d4, %hpstate
	.word 0x26800001  ! 4240: BL	bl,a	<label_0x1>
	.word 0xc8d004a0  ! 4241: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x81982d1d  ! 4242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1d, %hpstate
	.word 0x819829de  ! 4243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0x81982399  ! 4244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0399, %hpstate
	.word 0xc8900e80  ! 4245: LDUHA_R	lduha	[%r0, %r0] 0x74, %r4
	.word 0x87a00541  ! 4246: FSQRTd	fsqrt	
	.word 0x93d02035  ! 4247: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x22700001  ! 4248: BPE	<illegal instruction>
	.word 0x87802004  ! 4249: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d90268d  ! 4250: WRPR_PSTATE_I	wrpr	%r0, 0x068d, %pstate
	.word 0x95a189c6  ! 4251: FDIVd	fdivd	%f6, %f6, %f10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802014  ! 4253: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x97a249c4  ! 4254: FDIVd	fdivd	%f40, %f4, %f42
	ta	T_CHANGE_PRIV	! macro
DS_224:
	.word 0x32800001  ! 4257: BNE	bne,a	<label_0x1>
	.word 0xdd328002  ! 4257: STQF_R	-	%f14, [%r2, %r10]
	.word 0x91458000  ! 4256: RD_SOFTINT_REG	rd	%softint, %r8
DS_225:
	.word 0x34800001  ! 4258: BG	bg,a	<label_0x1>
	.word 0xd931c007  ! 4258: STQF_R	-	%f12, [%r7, %r7]
	.word 0x9f458000  ! 4257: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x87802010  ! 4258: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xde8fe010  ! 4259: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r15
DS_226:
	.word 0x32800001  ! 4261: BNE	bne,a	<label_0x1>
	.word 0xcd306001  ! 4261: STQF_I	-	%f6, [0x0001, %r1]
	.word 0x99458000  ! 4260: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x20700001  ! 4261: BPN	<illegal instruction>
	.word 0xd937c007  ! 4262: STQF_R	-	%f12, [%r7, %r31]
	.word 0x8d90200f  ! 4263: WRPR_PSTATE_I	wrpr	%r0, 0x000f, %pstate
	.word 0x2e800001  ! 4264: BVS	bvs,a	<label_0x1>
	.word 0xd817c000  ! 4265: LDUH_R	lduh	[%r31 + %r0], %r12
	.word 0x8449a001  ! 4266: MULX_I	mulx 	%r6, 0x0001, %r2
DS_227:
	.word 0x22800001  ! 4268: BE	be,a	<label_0x1>
	.word 0xd532000c  ! 4268: STQF_R	-	%f10, [%r12, %r8]
	.word 0x83458000  ! 4267: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x2c700001  ! 4268: BPNEG	<illegal instruction>
	.word 0xc277c00c  ! 4269: STX_R	stx	%r1, [%r31 + %r12]
	.word 0x8198229b  ! 4270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029b, %hpstate
	.word 0x8198214b  ! 4271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014b, %hpstate
	.word 0x92786001  ! 4272: SDIV_I	sdiv 	%r1, 0x0001, %r9
	.word 0x8d902012  ! 4273: WRPR_PSTATE_I	wrpr	%r0, 0x0012, %pstate
	.word 0x8d9020c8  ! 4274: WRPR_PSTATE_I	wrpr	%r0, 0x00c8, %pstate
	.word 0x8ba000c5  ! 4275: FNEGd	fnegd	%f36, %f36
	.word 0x87a00546  ! 4276: FSQRTd	fsqrt	
	.word 0x3c800001  ! 4277: BPOS	bpos,a	<label_0x1>
	.word 0x8d902c4c  ! 4278: WRPR_PSTATE_I	wrpr	%r0, 0x0c4c, %pstate
	.word 0x8d90260d  ! 4279: WRPR_PSTATE_I	wrpr	%r0, 0x060d, %pstate
	.word 0x9c804001  ! 4280: ADDcc_R	addcc 	%r1, %r1, %r14
	.word 0x896bc004  ! 4281: SDIVX_R	sdivx	%r15, %r4, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc8d7e030  ! 4283: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r4
	.word 0xc8c7e020  ! 4284: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0x8d902e85  ! 4285: WRPR_PSTATE_I	wrpr	%r0, 0x0e85, %pstate
	.word 0x89d02030  ! 4286: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x34800001  ! 4287: BG	bg,a	<label_0x1>
	.word 0x8da10d20  ! 4288: FsMULd	fsmuld	%f4, %f0, %f6
	.word 0x84518008  ! 4289: UMUL_R	umul 	%r6, %r8, %r2
	.word 0x85a30dc4  ! 4290: FdMULq	fdmulq	
	.word 0x8951c000  ! 4291: RDPR_TL	rdpr	%tl, %r4
	.word 0x8d902a58  ! 4292: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	.word 0x2c800001  ! 4293: BNEG	bneg,a	<label_0x1>
	.word 0xc857e001  ! 4294: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x89a049e6  ! 4295: FDIVq	dis not found

	.word 0x9e50c000  ! 4296: UMUL_R	umul 	%r3, %r0, %r15
	.word 0xde800ae0  ! 4297: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r15
	.word 0x81982544  ! 4298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
	.word 0x81982fc8  ! 4299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc8, %hpstate
	.word 0xde800be0  ! 4300: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r15
	mov 0x30, %r30
	.word 0x93d0001e  ! 4301: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x97504000  ! 4302: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x819826dd  ! 4303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dd, %hpstate
	.word 0xd68008a0  ! 4304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x9fd02031  ! 4305: Tcc_I	tvc	icc_or_xcc, %r0 + 49
DS_228:
	.word 0x32800001  ! 4307: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b00300  ! 4306: ALLIGNADDRESS	alignaddr	%r0, %r0, %r2
	.word 0x819828d9  ! 4307: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xc40fc000  ! 4308: LDUB_R	ldub	[%r31 + %r0], %r2
	mov 0x34, %r30
	.word 0x9dd0001e  ! 4309: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x9a4a6001  ! 4310: MULX_I	mulx 	%r9, 0x0001, %r13
	mov 0x34, %r30
	.word 0x95d0001e  ! 4311: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 4312: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xdacfe030  ! 4313: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x9ba18d25  ! 4314: FsMULd	fsmuld	%f6, %f36, %f44
	.word 0x8d9022cc  ! 4315: WRPR_PSTATE_I	wrpr	%r0, 0x02cc, %pstate
	mov 0x31, %r30
	.word 0x93d0001e  ! 4316: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85a209cc  ! 4318: FDIVd	fdivd	%f8, %f12, %f2
	.word 0xc527c00c  ! 4319: STF_R	st	%f2, [%r12, %r31]
	.word 0xc4ffc02c  ! 4320: SWAPA_R	swapa	%r2, [%r31 + %r12] 0x01
	.word 0xc48008a0  ! 4321: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x996a000a  ! 4322: SDIVX_R	sdivx	%r8, %r10, %r12
	.word 0x81480000  ! 4323: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xc007e001  ! 4324: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x9d6bc001  ! 4325: SDIVX_R	sdivx	%r15, %r1, %r14
	.word 0x87802004  ! 4326: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8a6b400b  ! 4327: UDIVX_R	udivx 	%r13, %r11, %r5
	.word 0xca77e001  ! 4328: STX_I	stx	%r5, [%r31 + 0x0001]
	.word 0x9bd02035  ! 4329: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x9879800d  ! 4330: SDIV_R	sdiv 	%r6, %r13, %r12
	.word 0x9ac02001  ! 4331: ADDCcc_I	addccc 	%r0, 0x0001, %r13
	.word 0x8d90224f  ! 4332: WRPR_PSTATE_I	wrpr	%r0, 0x024f, %pstate
	.word 0x81a349c3  ! 4333: FDIVd	fdivd	%f44, %f34, %f0
	.word 0xc09fc020  ! 4334: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x8d802000  ! 4335: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc1e7c023  ! 4337: CASA_I	casa	[%r31] 0x 1, %r3, %r0
	.word 0x8f69a001  ! 4338: SDIVX_I	sdivx	%r6, 0x0001, %r7
	.word 0x88688003  ! 4339: UDIVX_R	udivx 	%r2, %r3, %r4
	.word 0x81a24dce  ! 4340: FdMULq	fdmulq	
	mov 0x31, %r30
	.word 0x85d0001e  ! 4341: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8bd02034  ! 4342: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x8052c00c  ! 4343: UMUL_R	umul 	%r11, %r12, %r0
	.word 0xc04fc000  ! 4344: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x8a82a001  ! 4345: ADDcc_I	addcc 	%r10, 0x0001, %r5
	.word 0xcac804a0  ! 4346: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0xca9fc020  ! 4347: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0x83a000c9  ! 4348: FNEGd	fnegd	%f40, %f32
	.word 0xc227c009  ! 4349: STW_R	stw	%r1, [%r31 + %r9]
	.word 0x8d902ad4  ! 4350: WRPR_PSTATE_I	wrpr	%r0, 0x0ad4, %pstate
	.word 0x8d902acf  ! 4351: WRPR_PSTATE_I	wrpr	%r0, 0x0acf, %pstate
	.word 0x8dd02030  ! 4352: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xc2ffc029  ! 4353: SWAPA_R	swapa	%r1, [%r31 + %r9] 0x01
	.word 0x8198219a  ! 4354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019a, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3e700001  ! 4356: BPVC	<illegal instruction>
DS_229:
	.word 0x32800001  ! 4358: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb10307  ! 4357: ALLIGNADDRESS	alignaddr	%r4, %r7, %r13
	.word 0x99d02035  ! 4358: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0xdb37c007  ! 4359: STQF_R	-	%f13, [%r7, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 4361: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xda7fe001  ! 4362: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0xda8fe000  ! 4363: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0x93494000  ! 4364: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x87802004  ! 4365: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02031  ! 4366: Tcc_I	ta	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x91d0001e  ! 4367: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95a00547  ! 4368: FSQRTd	fsqrt	
	.word 0x819828c0  ! 4369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
	.word 0x8d802000  ! 4370: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8079e001  ! 4371: SDIV_I	sdiv 	%r7, 0x0001, %r0
	.word 0x956a2001  ! 4372: SDIVX_I	sdivx	%r8, 0x0001, %r10
	.word 0x3e800001  ! 4373: BVC	bvc,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819829c8  ! 4375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
	.word 0x8e800003  ! 4376: ADDcc_R	addcc 	%r0, %r3, %r7
	mov 0x32, %r30
	.word 0x85d0001e  ! 4377: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8da2cdc6  ! 4378: FdMULq	fdmulq	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x24800001  ! 4380: BLE	ble,a	<label_0x1>
DS_230:
	.word 0x20800001  ! 4382: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb00309  ! 4381: ALLIGNADDRESS	alignaddr	%r0, %r9, %r7
DS_231:
	.word 0x22800001  ! 4383: BE	be,a	<label_0x1>
	.word 0xc5308006  ! 4383: STQF_R	-	%f2, [%r6, %r2]
	.word 0x81458000  ! 4382: RD_SOFTINT_REG	stbar
	.word 0x97a0c9cf  ! 4383: FDIVd	fdivd	%f34, %f46, %f42
	.word 0x81982905  ! 4384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0905, %hpstate
	.word 0x81a00561  ! 4385: FSQRTq	fsqrt	
	.word 0xc01fe001  ! 4386: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x81982e84  ! 4387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e84, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982a45  ! 4389: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a45, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc027c001  ! 4391: STW_R	stw	%r0, [%r31 + %r1]
	.word 0x8d802000  ! 4392: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8868a001  ! 4393: UDIVX_I	udivx 	%r2, 0x0001, %r4
	.word 0x97d02034  ! 4394: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x8d902642  ! 4395: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
	.word 0xc81fe001  ! 4396: LDD_I	ldd	[%r31 + 0x0001], %r4
	.word 0x8d802004  ! 4397: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x31, %r30
	.word 0x83d0001e  ! 4398: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4400: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81982fcf  ! 4401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x24700001  ! 4403: BPLE	<illegal instruction>
	.word 0x8d902081  ! 4404: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	.word 0x9150c000  ! 4405: RDPR_TT	rdpr	%tt, %r8
	.word 0x36800001  ! 4406: BGE	bge,a	<label_0x1>
DS_232:
	.word 0x32800001  ! 4408: BNE	bne,a	<label_0x1>
	.word 0xd5336001  ! 4408: STQF_I	-	%f10, [0x0001, %r13]
	.word 0x85458000  ! 4407: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x9f480000  ! 4408: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
DS_233:
	.word 0x34800001  ! 4410: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b1430c  ! 4409: ALLIGNADDRESS	alignaddr	%r5, %r12, %r9
	.word 0xd327e001  ! 4410: STF_I	st	%f9, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802089  ! 4412: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802000  ! 4413: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802016  ! 4414: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802089  ! 4417: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8bd02032  ! 4419: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0x2c700001  ! 4421: BPNEG	<illegal instruction>
	.word 0x8198244d  ! 4422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044d, %hpstate
	.word 0x81982711  ! 4423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0711, %hpstate
	mov 0x33, %r30
	.word 0x99d0001e  ! 4424: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 4425: BNEG	bneg,a	<label_0x1>
	.word 0x8d802000  ! 4426: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 4427: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x86828007  ! 4428: ADDcc_R	addcc 	%r10, %r7, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83d02030  ! 4430: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 4431: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802010  ! 4432: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc6c7e000  ! 4433: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0xc6d804a0  ! 4434: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x8ba0cdc7  ! 4435: FdMULq	fdmulq	
	.word 0x8d9020c3  ! 4436: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
	.word 0x85d02031  ! 4437: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x99d02034  ! 4438: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0xcbe7c027  ! 4439: CASA_I	casa	[%r31] 0x 1, %r7, %r5
	.word 0x8d802000  ! 4440: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x984aa001  ! 4441: MULX_I	mulx 	%r10, 0x0001, %r12
	.word 0x8fa049cb  ! 4442: FDIVd	fdivd	%f32, %f42, %f38
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xce8008a0  ! 4444: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8da049c0  ! 4445: FDIVd	fdivd	%f32, %f0, %f6
DS_234:
	.word 0x22800001  ! 4447: BE	be,a	<label_0x1>
	.word 0xc333400e  ! 4447: STQF_R	-	%f1, [%r14, %r13]
	.word 0x97458000  ! 4446: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d902c57  ! 4447: WRPR_PSTATE_I	wrpr	%r0, 0x0c57, %pstate
	.word 0xd737c00e  ! 4448: STQF_R	-	%f11, [%r14, %r31]
	mov 0x31, %r30
	.word 0x97d0001e  ! 4449: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 4450: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8198204c  ! 4451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004c, %hpstate
	.word 0xd737c00e  ! 4452: STQF_R	-	%f11, [%r14, %r31]
	.word 0xd6bfc02e  ! 4453: STDA_R	stda	%r11, [%r31 + %r14] 0x01
DS_235:
	.word 0x22800001  ! 4455: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb04306  ! 4454: ALLIGNADDRESS	alignaddr	%r1, %r6, %r13
	.word 0x8d902cd0  ! 4455: WRPR_PSTATE_I	wrpr	%r0, 0x0cd0, %pstate
	.word 0x9a4bc001  ! 4456: MULX_R	mulx 	%r15, %r1, %r13
	.word 0x9f480000  ! 4457: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x81982f5d  ! 4458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5d, %hpstate
	.word 0x81982945  ! 4459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0945, %hpstate
	.word 0x8f500000  ! 4460: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x87802010  ! 4461: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9ba0054b  ! 4462: FSQRTd	fsqrt	
	.word 0x87802088  ! 4463: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x85a000c5  ! 4464: FNEGd	fnegd	%f36, %f2
DS_236:
	.word 0x22800001  ! 4466: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b0030f  ! 4465: ALLIGNADDRESS	alignaddr	%r0, %r15, %r8
	.word 0x85504000  ! 4466: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x9282a001  ! 4467: ADDcc_I	addcc 	%r10, 0x0001, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802010  ! 4469: WRASI_I	wr	%r0, 0x0010, %asi
DS_237:
	.word 0x22800001  ! 4471: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b34300  ! 4470: ALLIGNADDRESS	alignaddr	%r13, %r0, %r3
	.word 0xc6c004a0  ! 4471: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0x8d902c51  ! 4472: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
	.word 0x99a109a6  ! 4473: FDIVs	fdivs	%f4, %f6, %f12
	ta	T_CHANGE_PRIV	! macro
	.word 0xd88008a0  ! 4475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802080  ! 4476: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8198240a  ! 4477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040a, %hpstate
	.word 0x38800001  ! 4478: BGU	bgu,a	<label_0x1>
	.word 0x85a24dca  ! 4479: FdMULq	fdmulq	
	.word 0xc5e7c02a  ! 4480: CASA_I	casa	[%r31] 0x 1, %r10, %r2
	.word 0x89a00561  ! 4481: FSQRTq	fsqrt	
	mov 0x33, %r30
	.word 0x9fd0001e  ! 4482: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8adb4008  ! 4483: SMULcc_R	smulcc 	%r13, %r8, %r5
	.word 0x9050c006  ! 4484: UMUL_R	umul 	%r3, %r6, %r8
	.word 0x9469c002  ! 4485: UDIVX_R	udivx 	%r7, %r2, %r10
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4486: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d90269d  ! 4487: WRPR_PSTATE_I	wrpr	%r0, 0x069d, %pstate
	.word 0x93a01a61  ! 4488: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02031  ! 4490: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802010  ! 4491: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9bd02035  ! 4492: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xd2800c80  ! 4493: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r9
	mov 0x34, %r30
	.word 0x9dd0001e  ! 4494: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x86816001  ! 4495: ADDcc_I	addcc 	%r5, 0x0001, %r3
	mov 0x30, %r30
	.word 0x81d0001e  ! 4496: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d90204a  ! 4497: WRPR_PSTATE_I	wrpr	%r0, 0x004a, %pstate
	ta	T_CHANGE_HPRIV	! macro
DS_238:
	.word 0x34800001  ! 4500: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b14304  ! 4499: ALLIGNADDRESS	alignaddr	%r5, %r4, %r10
	.word 0xd4c7e020  ! 4500: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8b514000  ! 4503: RDPR_TBA	rdpr	%tba, %r5
	.word 0x87504000  ! 4504: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x8d902e02  ! 4505: WRPR_PSTATE_I	wrpr	%r0, 0x0e02, %pstate
	.word 0x819825c3  ! 4506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c3, %hpstate
	.word 0x81982f12  ! 4507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
	mov 0x35, %r30
	.word 0x93d0001e  ! 4508: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982245  ! 4509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0245, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc7e7c024  ! 4511: CASA_I	casa	[%r31] 0x 1, %r4, %r3
	.word 0x93a2cd2f  ! 4512: FsMULd	fsmuld	%f11, %f46, %f40
	.word 0xd29fc020  ! 4513: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0x8edb800d  ! 4514: SMULcc_R	smulcc 	%r14, %r13, %r7
	.word 0x97a209a4  ! 4515: FDIVs	fdivs	%f8, %f4, %f11
	.word 0x87802004  ! 4516: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x96db000c  ! 4517: SMULcc_R	smulcc 	%r12, %r12, %r11
	.word 0x87d02032  ! 4518: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x2e700001  ! 4519: BPVS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x3c800001  ! 4521: BPOS	bpos,a	<label_0x1>
	.word 0x81982b95  ! 4522: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b95, %hpstate
	.word 0x8d802000  ! 4523: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802016  ! 4524: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x35, %r30
	.word 0x9bd0001e  ! 4525: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d9024c0  ! 4526: WRPR_PSTATE_I	wrpr	%r0, 0x04c0, %pstate
	mov 0x35, %r30
	.word 0x9bd0001e  ! 4527: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd6800ac0  ! 4528: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
	.word 0x8bd02030  ! 4529: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8198275e  ! 4530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075e, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 4532: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8ba0054b  ! 4533: FSQRTd	fsqrt	
	.word 0x8fd02033  ! 4534: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x81982880  ! 4535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
	.word 0x36800001  ! 4536: BGE	bge,a	<label_0x1>
	.word 0x8d9024d8  ! 4537: WRPR_PSTATE_I	wrpr	%r0, 0x04d8, %pstate
	.word 0xcbe7c02b  ! 4538: CASA_I	casa	[%r31] 0x 1, %r11, %r5
	mov 0x35, %r30
	.word 0x81d0001e  ! 4539: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcacfe000  ! 4541: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	.word 0x2e800001  ! 4542: BVS	bvs,a	<label_0x1>
	.word 0x8d802000  ! 4543: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b508000  ! 4544: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x92d84008  ! 4545: SMULcc_R	smulcc 	%r1, %r8, %r9
	.word 0x8ba00540  ! 4546: FSQRTd	fsqrt	
	.word 0x98022001  ! 4547: ADD_I	add 	%r8, 0x0001, %r12
	.word 0x87802088  ! 4548: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d802000  ! 4549: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3c800001  ! 4550: BPOS	bpos,a	<label_0x1>
	.word 0x87802089  ! 4551: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99d02035  ! 4553: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x3a700001  ! 4555: BPCC	<illegal instruction>
	.word 0x8d902ec4  ! 4556: WRPR_PSTATE_I	wrpr	%r0, 0x0ec4, %pstate
	.word 0x81982b1d  ! 4557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0x8b504000  ! 4558: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x8d90224e  ! 4559: WRPR_PSTATE_I	wrpr	%r0, 0x024e, %pstate
	.word 0x8d9028cb  ! 4560: WRPR_PSTATE_I	wrpr	%r0, 0x08cb, %pstate
	mov 0x35, %r30
	.word 0x9fd0001e  ! 4561: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xca8fe000  ! 4562: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0xca800c00  ! 4563: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r5
	.word 0x8d9026c1  ! 4564: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0x81982405  ! 4565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0405, %hpstate
	.word 0xcb27c000  ! 4566: STF_R	st	%f5, [%r0, %r31]
	.word 0x8198295b  ! 4567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095b, %hpstate
	.word 0x8d902017  ! 4568: WRPR_PSTATE_I	wrpr	%r0, 0x0017, %pstate
	mov 0x33, %r30
	.word 0x8dd0001e  ! 4569: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 4570: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81d02032  ! 4571: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xca1fe001  ! 4572: LDD_I	ldd	[%r31 + 0x0001], %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902252  ! 4574: WRPR_PSTATE_I	wrpr	%r0, 0x0252, %pstate
DS_239:
	.word 0x22800001  ! 4576: BE	be,a	<label_0x1>
	.word 0xc5304004  ! 4576: STQF_R	-	%f2, [%r4, %r1]
	.word 0x89458000  ! 4575: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8e4b4006  ! 4576: MULX_R	mulx 	%r13, %r6, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8078a001  ! 4578: SDIV_I	sdiv 	%r2, 0x0001, %r0
DS_240:
	.word 0x22800001  ! 4580: BE	be,a	<label_0x1>
	.word 0xcb322001  ! 4580: STQF_I	-	%f5, [0x0001, %r8]
	.word 0x89458000  ! 4579: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x81982bd4  ! 4580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd4, %hpstate
	.word 0x91a00567  ! 4581: FSQRTq	fsqrt	
	.word 0x81982e12  ! 4582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8bd02035  ! 4584: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x81982218  ! 4585: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0218, %hpstate
	.word 0x9078e001  ! 4586: SDIV_I	sdiv 	%r3, 0x0001, %r8
	.word 0x8d902041  ! 4587: WRPR_PSTATE_I	wrpr	%r0, 0x0041, %pstate
	.word 0x867a800f  ! 4588: SDIV_R	sdiv 	%r10, %r15, %r3
	.word 0x8ed18008  ! 4589: UMULcc_R	umulcc 	%r6, %r8, %r7
	.word 0x32800001  ! 4590: BNE	bne,a	<label_0x1>
	.word 0xcec7e000  ! 4591: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
	.word 0x95d02030  ! 4592: Tcc_I	tg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02032  ! 4594: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_241:
	.word 0x20800001  ! 4596: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b18305  ! 4595: ALLIGNADDRESS	alignaddr	%r6, %r5, %r10
	.word 0x8198211e  ! 4596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011e, %hpstate
	.word 0xd4c804a0  ! 4597: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91a00549  ! 4598: FSQRTd	fsqrt	
	.word 0x8d802004  ! 4599: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8ac1a001  ! 4600: ADDCcc_I	addccc 	%r6, 0x0001, %r5
	.word 0x86c22001  ! 4601: ADDCcc_I	addccc 	%r8, 0x0001, %r3
	.word 0xc627c009  ! 4602: STW_R	stw	%r3, [%r31 + %r9]
	.word 0x93d02031  ! 4603: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x97508000  ! 4604: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x87802089  ! 4605: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x3a700001  ! 4606: BPCC	<illegal instruction>
DS_242:
	.word 0x20800001  ! 4608: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85b34306  ! 4607: ALLIGNADDRESS	alignaddr	%r13, %r6, %r2
	.word 0xc4dfe020  ! 4608: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	.word 0x81982c02  ! 4609: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
	.word 0x97a000c8  ! 4610: FNEGd	fnegd	%f8, %f42
	.word 0x9fa049e7  ! 4611: FDIVq	dis not found

DS_243:
	.word 0x20800001  ! 4613: BN	bn,a	<label_0x1>
	.word 0xdb334002  ! 4613: STQF_R	-	%f13, [%r2, %r13]
	.word 0x87458000  ! 4612: RD_SOFTINT_REG	rd	%softint, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0056c  ! 4614: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd727e001  ! 4616: STF_I	st	%f11, [0x0001, %r31]
	.word 0x81982419  ! 4617: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0419, %hpstate
	.word 0x81982205  ! 4618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0205, %hpstate
	.word 0x8d9028c9  ! 4619: WRPR_PSTATE_I	wrpr	%r0, 0x08c9, %pstate
	.word 0xd68008a0  ! 4620: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6c004a0  ! 4621: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd67fe001  ! 4622: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x81982d0e  ! 4623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0e, %hpstate
DS_244:
	.word 0x20800001  ! 4625: BN	bn,a	<label_0x1>
	.word 0xcf30400c  ! 4625: STQF_R	-	%f7, [%r12, %r1]
	.word 0x93458000  ! 4624: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x87802010  ! 4625: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd2c804a0  ! 4626: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x8f68e001  ! 4627: SDIVX_I	sdivx	%r3, 0x0001, %r7
	.word 0x87802089  ! 4628: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x3e800001  ! 4629: BVC	bvc,a	<label_0x1>
	.word 0x8d802004  ! 4630: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x819820d9  ! 4631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d9, %hpstate
	.word 0x98d0000c  ! 4632: UMULcc_R	umulcc 	%r0, %r12, %r12
	.word 0x819829cd  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cd, %hpstate
	.word 0x81982f4f  ! 4634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902a50  ! 4636: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	.word 0x9083800f  ! 4637: ADDcc_R	addcc 	%r14, %r15, %r8
	.word 0x9b500000  ! 4638: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xda8008a0  ! 4639: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8fd02032  ! 4640: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0x9e6aa001  ! 4641: UDIVX_I	udivx 	%r10, 0x0001, %r15
	.word 0x90dac00c  ! 4642: SMULcc_R	smulcc 	%r11, %r12, %r8
	.word 0xd03fe001  ! 4643: STD_I	std	%r8, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9c500005  ! 4645: UMUL_R	umul 	%r0, %r5, %r14
	.word 0x8ba01a67  ! 4646: FqTOi	fqtoi	
	.word 0x81982409  ! 4647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0409, %hpstate
	.word 0x8c4b2001  ! 4648: MULX_I	mulx 	%r12, 0x0001, %r6
	.word 0x81982a05  ! 4649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a05, %hpstate
	.word 0x8d902ac2  ! 4650: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x8d902cd6  ! 4651: WRPR_PSTATE_I	wrpr	%r0, 0x0cd6, %pstate
	.word 0xccdfe000  ! 4652: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81d02035  ! 4654: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x8d90220e  ! 4655: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0xcc37c007  ! 4656: STH_R	sth	%r6, [%r31 + %r7]
	.word 0xccd804a0  ! 4657: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0xcc5fc000  ! 4658: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xccd80e40  ! 4659: LDXA_R	ldxa	[%r0, %r0] 0x72, %r6
	mov 0x30, %r30
	.word 0x89d0001e  ! 4660: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x86d18009  ! 4662: UMULcc_R	umulcc 	%r6, %r9, %r3
	.word 0x8da00d2a  ! 4663: FsMULd	fsmuld	%f0, %f10, %f6
	.word 0x81d02033  ! 4664: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x81982c05  ! 4665: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c05, %hpstate
	.word 0x9fa189c5  ! 4666: FDIVd	fdivd	%f6, %f36, %f46
	.word 0xdfe7c025  ! 4667: CASA_I	casa	[%r31] 0x 1, %r5, %r15
	.word 0x81982441  ! 4668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0441, %hpstate
	.word 0x87802004  ! 4669: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802089  ! 4670: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x85a01a6c  ! 4671: FqTOi	fqtoi	
	mov 0x33, %r30
	.word 0x9dd0001e  ! 4672: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81982f49  ! 4673: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f49, %hpstate
	.word 0x8d902286  ! 4674: WRPR_PSTATE_I	wrpr	%r0, 0x0286, %pstate
	.word 0x9e6a0001  ! 4675: UDIVX_R	udivx 	%r8, %r1, %r15
	.word 0xde0fc000  ! 4676: LDUB_R	ldub	[%r31 + %r0], %r15
	mov 0x33, %r30
	.word 0x91d0001e  ! 4677: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xde8fe000  ! 4678: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r15
	.word 0x87802089  ! 4679: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9dd02034  ! 4680: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xdec7e020  ! 4681: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r15
	.word 0x3e700001  ! 4682: BPVC	<illegal instruction>
	.word 0xdec7e020  ! 4683: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r15
	.word 0x8d902cd2  ! 4684: WRPR_PSTATE_I	wrpr	%r0, 0x0cd2, %pstate
DS_245:
	.word 0x22800001  ! 4686: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb24309  ! 4685: ALLIGNADDRESS	alignaddr	%r9, %r9, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902e59  ! 4687: WRPR_PSTATE_I	wrpr	%r0, 0x0e59, %pstate
	.word 0x93a0054c  ! 4688: FSQRTd	fsqrt	
	.word 0x95a20d29  ! 4689: FsMULd	fsmuld	%f8, %f40, %f10
	.word 0x87802004  ! 4690: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd527e001  ! 4691: STF_I	st	%f10, [0x0001, %r31]
	.word 0x8198280e  ! 4692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080e, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	mov 0x33, %r30
	.word 0x97d0001e  ! 4694: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x99a149e4  ! 4695: FDIVq	dis not found

	.word 0x81a0056c  ! 4696: FSQRTq	fsqrt	
	.word 0x8dd02035  ! 4697: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 4698: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc08008a0  ! 4699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x819821cf  ! 4700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cf, %hpstate
	.word 0x97d02035  ! 4701: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x8f6b2001  ! 4702: SDIVX_I	sdivx	%r12, 0x0001, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0xce1fe001  ! 4704: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0x8d692001  ! 4705: SDIVX_I	sdivx	%r4, 0x0001, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x26700001  ! 4707: BPL	<illegal instruction>
	.word 0x8d902c03  ! 4708: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	.word 0x9e820002  ! 4709: ADDcc_R	addcc 	%r8, %r2, %r15
	.word 0x8d902a16  ! 4710: WRPR_PSTATE_I	wrpr	%r0, 0x0a16, %pstate
	.word 0xdfe7c022  ! 4711: CASA_I	casa	[%r31] 0x 1, %r2, %r15
	.word 0x8368400a  ! 4712: SDIVX_R	sdivx	%r1, %r10, %r1
	.word 0xc3e7c02a  ! 4713: CASA_I	casa	[%r31] 0x 1, %r10, %r1
	.word 0x81982bc0  ! 4714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc0, %hpstate
	.word 0x34700001  ! 4715: BPG	<illegal instruction>
	.word 0x20700001  ! 4716: BPN	<illegal instruction>
	.word 0x8d902a8e  ! 4717: WRPR_PSTATE_I	wrpr	%r0, 0x0a8e, %pstate
	.word 0x90c16001  ! 4718: ADDCcc_I	addccc 	%r5, 0x0001, %r8
	mov 0x32, %r30
	.word 0x83d0001e  ! 4719: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9ba34d25  ! 4720: FsMULd	fsmuld	%f13, %f36, %f44
	.word 0x8d68800f  ! 4721: SDIVX_R	sdivx	%r2, %r15, %r6
	.word 0x87802080  ! 4722: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8198214d  ! 4723: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014d, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 4725: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198249b  ! 4726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049b, %hpstate
	.word 0x8d802004  ! 4727: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 4728: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97504000  ! 4729: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xd67fe001  ! 4730: SWAP_I	swap	%r11, [%r31 + 0x0001]
	mov 0x32, %r30
	.word 0x81d0001e  ! 4731: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x80d3a001  ! 4732: UMULcc_I	umulcc 	%r14, 0x0001, %r0
	.word 0x32800001  ! 4733: BNE	bne,a	<label_0x1>
	.word 0x8d9026c5  ! 4734: WRPR_PSTATE_I	wrpr	%r0, 0x06c5, %pstate
	.word 0xc01fc000  ! 4735: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x86482001  ! 4736: MULX_I	mulx 	%r0, 0x0001, %r3
	.word 0xc68008a0  ! 4737: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x81982b92  ! 4738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc727c00f  ! 4740: STF_R	st	%f3, [%r15, %r31]
	.word 0x26800001  ! 4741: BL	bl,a	<label_0x1>
	.word 0x81982512  ! 4742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0512, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902000  ! 4744: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	.word 0xc6800ae0  ! 4745: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r3
DS_246:
	.word 0x34800001  ! 4747: BG	bg,a	<label_0x1>
	.word 0xdb312001  ! 4747: STQF_I	-	%f13, [0x0001, %r4]
	.word 0x8d458000  ! 4746: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8d90200a  ! 4747: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	.word 0x83a3c9ee  ! 4748: FDIVq	dis not found

	.word 0x8d90289e  ! 4749: WRPR_PSTATE_I	wrpr	%r0, 0x089e, %pstate
	.word 0xc20fe001  ! 4750: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0xc2c7e020  ! 4751: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc2c004a0  ! 4753: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0x8951c000  ! 4754: RDPR_TL	rdpr	%tl, %r4
	.word 0x81982a9d  ! 4755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9d, %hpstate
	.word 0xc88804a0  ! 4756: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0x96da400c  ! 4757: SMULcc_R	smulcc 	%r9, %r12, %r11
	.word 0x83a00546  ! 4758: FSQRTd	fsqrt	
	.word 0x8198270e  ! 4759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070e, %hpstate
	.word 0x9769e001  ! 4760: SDIVX_I	sdivx	%r7, 0x0001, %r11
	.word 0x8d90281f  ! 4761: WRPR_PSTATE_I	wrpr	%r0, 0x081f, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd727c006  ! 4763: STF_R	st	%f11, [%r6, %r31]
	.word 0x93d02031  ! 4764: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8ed2c005  ! 4765: UMULcc_R	umulcc 	%r11, %r5, %r7
	.word 0x38700001  ! 4766: BPGU	<illegal instruction>
	.word 0x8d9022de  ! 4767: WRPR_PSTATE_I	wrpr	%r0, 0x02de, %pstate
	.word 0x8d902c5f  ! 4768: WRPR_PSTATE_I	wrpr	%r0, 0x0c5f, %pstate
	.word 0x87802014  ! 4769: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902cdb  ! 4770: WRPR_PSTATE_I	wrpr	%r0, 0x0cdb, %pstate
	.word 0x87802010  ! 4771: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xced7e020  ! 4773: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x34, %r30
	.word 0x8bd0001e  ! 4775: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 4777: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8fa01a62  ! 4778: FqTOi	fqtoi	
	.word 0x8fd02032  ! 4779: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0xcf3fc002  ! 4780: STDF_R	std	%f7, [%r2, %r31]
	.word 0x819826cd  ! 4781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cd, %hpstate
	.word 0x8d902e03  ! 4782: WRPR_PSTATE_I	wrpr	%r0, 0x0e03, %pstate
	.word 0x38700001  ! 4783: BPGU	<illegal instruction>
	.word 0x8d902e9c  ! 4784: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91a0c9c8  ! 4786: FDIVd	fdivd	%f34, %f8, %f8
	.word 0x99d02035  ! 4787: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x9668c003  ! 4789: UDIVX_R	udivx 	%r3, %r3, %r11
	.word 0x81a00565  ! 4790: FSQRTq	fsqrt	
	.word 0x9e4a400c  ! 4791: MULX_R	mulx 	%r9, %r12, %r15
	.word 0x8a4b8004  ! 4792: MULX_R	mulx 	%r14, %r4, %r5
	.word 0xcadfe010  ! 4793: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
	.word 0x8d90241a  ! 4794: WRPR_PSTATE_I	wrpr	%r0, 0x041a, %pstate
	.word 0x81982059  ! 4795: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0059, %hpstate
	.word 0x8d902243  ! 4796: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982240  ! 4798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0240, %hpstate
	mov 0x33, %r30
	.word 0x89d0001e  ! 4799: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90229b  ! 4801: WRPR_PSTATE_I	wrpr	%r0, 0x029b, %pstate
	.word 0x8068e001  ! 4802: UDIVX_I	udivx 	%r3, 0x0001, %r0
	.word 0x94da800a  ! 4803: SMULcc_R	smulcc 	%r10, %r10, %r10
	.word 0x91a1c9ef  ! 4804: FDIVq	dis not found

	.word 0x99d02032  ! 4805: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	mov 0x30, %r30
	.word 0x8dd0001e  ! 4806: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd04fe001  ! 4807: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91a08d29  ! 4809: FsMULd	fsmuld	%f2, %f40, %f8
	.word 0x24700001  ! 4810: BPLE	<illegal instruction>
	.word 0x81982549  ! 4811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0549, %hpstate
	.word 0x8d90288c  ! 4812: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0x9ba01a65  ! 4813: FqTOi	fqtoi	
DS_247:
	.word 0x20800001  ! 4815: BN	bn,a	<label_0x1>
	.word 0xc331a001  ! 4815: STQF_I	-	%f1, [0x0001, %r6]
	.word 0x8d458000  ! 4814: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc57e001  ! 4815: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0xccc80e80  ! 4816: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r6
	.word 0x8ba00560  ! 4817: FSQRTq	fsqrt	
	.word 0x38700001  ! 4818: BPGU	<illegal instruction>
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4819: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a47  ! 4821: WRPR_PSTATE_I	wrpr	%r0, 0x0a47, %pstate
	.word 0x97d02032  ! 4822: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xcad80e80  ! 4823: LDXA_R	ldxa	[%r0, %r0] 0x74, %r5
	.word 0x80c26001  ! 4824: ADDCcc_I	addccc 	%r9, 0x0001, %r0
	.word 0x987b6001  ! 4825: SDIV_I	sdiv 	%r13, 0x0001, %r12
	.word 0x81982251  ! 4826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0251, %hpstate
	mov 0x32, %r30
	.word 0x87d0001e  ! 4827: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd8d004a0  ! 4828: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
DS_248:
	.word 0x20800001  ! 4830: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9fb14302  ! 4829: ALLIGNADDRESS	alignaddr	%r5, %r2, %r15
	.word 0x8d902a96  ! 4830: WRPR_PSTATE_I	wrpr	%r0, 0x0a96, %pstate
	.word 0xdf37e001  ! 4831: STQF_I	-	%f15, [0x0001, %r31]
	.word 0x30800001  ! 4832: BA	ba,a	<label_0x1>
	.word 0x984b4002  ! 4833: MULX_R	mulx 	%r13, %r2, %r12
	.word 0x8d902c57  ! 4834: WRPR_PSTATE_I	wrpr	%r0, 0x0c57, %pstate
	.word 0xd84fc000  ! 4835: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0xd8d7e020  ! 4836: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0x87802004  ! 4837: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d90205d  ! 4838: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
	.word 0x20700001  ! 4839: BPN	<illegal instruction>
	.word 0x89a01a66  ! 4840: FqTOi	fqtoi	
	.word 0xc8800c00  ! 4841: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r4
	.word 0xc8800ae0  ! 4842: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8c7e030  ! 4844: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r4
	.word 0xc8800be0  ! 4845: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r4
	.word 0xc83fc006  ! 4846: STD_R	std	%r4, [%r31 + %r6]
DS_249:
	.word 0x34800001  ! 4848: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db38303  ! 4847: ALLIGNADDRESS	alignaddr	%r14, %r3, %r6
	.word 0x8d902412  ! 4848: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	.word 0x8d90261b  ! 4849: WRPR_PSTATE_I	wrpr	%r0, 0x061b, %pstate
DS_250:
	.word 0x34800001  ! 4851: BG	bg,a	<label_0x1>
	.word 0xdf338002  ! 4851: STQF_R	-	%f15, [%r2, %r14]
	.word 0x85458000  ! 4850: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8d802004  ! 4851: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90228c  ! 4852: WRPR_PSTATE_I	wrpr	%r0, 0x028c, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
DS_251:
	.word 0x34800001  ! 4855: BG	bg,a	<label_0x1>
	.word 0xd733e001  ! 4855: STQF_I	-	%f11, [0x0001, %r15]
	.word 0x99458000  ! 4854: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x93494000  ! 4855: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x944a800e  ! 4856: MULX_R	mulx 	%r10, %r14, %r10
	.word 0xd537c00e  ! 4857: STQF_R	-	%f10, [%r14, %r31]
	.word 0x8083a001  ! 4858: ADDcc_I	addcc 	%r14, 0x0001, %r0
	.word 0x36800001  ! 4859: BGE	bge,a	<label_0x1>
	.word 0x87802016  ! 4860: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x36800001  ! 4861: BGE	bge,a	<label_0x1>
	mov 0x33, %r30
	.word 0x99d0001e  ! 4862: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802004  ! 4864: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x89a349cc  ! 4865: FDIVd	fdivd	%f44, %f12, %f4
	.word 0xc937c00c  ! 4866: STQF_R	-	%f4, [%r12, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8c69e001  ! 4868: UDIVX_I	udivx 	%r7, 0x0001, %r6
	.word 0xcd27e001  ! 4869: STF_I	st	%f6, [0x0001, %r31]
	.word 0x81982ccd  ! 4870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccd, %hpstate
	mov 0x33, %r30
	.word 0x9bd0001e  ! 4871: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d9022ca  ! 4872: WRPR_PSTATE_I	wrpr	%r0, 0x02ca, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982ecb  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	.word 0x81982898  ! 4875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0898, %hpstate
	.word 0xcde7c02c  ! 4876: CASA_I	casa	[%r31] 0x 1, %r12, %r6
DS_252:
	.word 0x32800001  ! 4878: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b24301  ! 4877: ALLIGNADDRESS	alignaddr	%r9, %r1, %r10
	.word 0x8d902601  ! 4878: WRPR_PSTATE_I	wrpr	%r0, 0x0601, %pstate
	.word 0x8d802000  ! 4879: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8969400e  ! 4881: SDIVX_R	sdivx	%r5, %r14, %r4
	.word 0xc937e001  ! 4882: STQF_I	-	%f4, [0x0001, %r31]
	.word 0x81508000  ! 4883: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x8448e001  ! 4884: MULX_I	mulx 	%r3, 0x0001, %r2
	.word 0x22700001  ! 4885: BPE	<illegal instruction>
	.word 0x9da189a8  ! 4886: FDIVs	fdivs	%f6, %f8, %f14
	.word 0x81982b5d  ! 4887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5d, %hpstate
	.word 0x81982c4a  ! 4888: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
	.word 0x97500000  ! 4889: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x85a289a4  ! 4890: FDIVs	fdivs	%f10, %f4, %f2
	.word 0xc4c7e020  ! 4891: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0x87802014  ! 4892: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc537c004  ! 4893: STQF_R	-	%f2, [%r4, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x9bd0001e  ! 4895: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x81982edb  ! 4896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edb, %hpstate
	.word 0x81982806  ! 4897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0806, %hpstate
	.word 0x8dd02030  ! 4898: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xc49004a0  ! 4899: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x81a01a62  ! 4900: FqTOi	fqtoi	
	.word 0x819827dc  ! 4901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dc, %hpstate
	.word 0x8ba30d24  ! 4902: FsMULd	fsmuld	%f12, %f4, %f36
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 4904: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xca9004a0  ! 4905: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x81982acc  ! 4906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acc, %hpstate
	.word 0x97d02032  ! 4907: Tcc_I	tge	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x93d0001e  ! 4909: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcac7e010  ! 4910: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x87802004  ! 4911: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcb27e001  ! 4913: STF_I	st	%f5, [0x0001, %r31]
	.word 0x924b2001  ! 4914: MULX_I	mulx 	%r12, 0x0001, %r9
	.word 0x819824dc  ! 4915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dc, %hpstate
	mov 0x34, %r30
	.word 0x8dd0001e  ! 4916: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8851c004  ! 4918: UMUL_R	umul 	%r7, %r4, %r4
	.word 0xc8800aa0  ! 4919: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r4
	.word 0x8d9020c8  ! 4920: WRPR_PSTATE_I	wrpr	%r0, 0x00c8, %pstate
	.word 0x86834005  ! 4921: ADDcc_R	addcc 	%r13, %r5, %r3
	.word 0x95504000  ! 4922: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x92d80001  ! 4923: SMULcc_R	smulcc 	%r0, %r1, %r9
	.word 0x20800001  ! 4924: BN	bn,a	<label_0x1>
	.word 0x8d902e56  ! 4925: WRPR_PSTATE_I	wrpr	%r0, 0x0e56, %pstate
	.word 0xd297e010  ! 4926: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	mov 0x33, %r30
	.word 0x91d0001e  ! 4927: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a189a7  ! 4928: FDIVs	fdivs	%f6, %f7, %f8
	.word 0x81982780  ! 4929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0780, %hpstate
	.word 0x82c02001  ! 4930: ADDCcc_I	addccc 	%r0, 0x0001, %r1
	.word 0x81982ac2  ! 4931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 4933: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902815  ! 4934: WRPR_PSTATE_I	wrpr	%r0, 0x0815, %pstate
	mov 0x32, %r30
	.word 0x81d0001e  ! 4935: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc22fc007  ! 4936: STB_R	stb	%r1, [%r31 + %r7]
	.word 0xc2c7e020  ! 4937: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0x8d902c09  ! 4938: WRPR_PSTATE_I	wrpr	%r0, 0x0c09, %pstate
	.word 0x91a01a6c  ! 4939: FqTOi	fqtoi	
	.word 0x89d02034  ! 4940: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xd05fc000  ! 4941: LDX_R	ldx	[%r31 + %r0], %r8
DS_253:
	.word 0x32800001  ! 4943: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db38303  ! 4942: ALLIGNADDRESS	alignaddr	%r14, %r3, %r6
	.word 0x8d90241f  ! 4943: WRPR_PSTATE_I	wrpr	%r0, 0x041f, %pstate
	.word 0xcc8008a0  ! 4944: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x85494000  ! 4945: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x8d902c10  ! 4946: WRPR_PSTATE_I	wrpr	%r0, 0x0c10, %pstate
	.word 0xc497e020  ! 4947: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r2
	.word 0x81982583  ! 4948: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0583, %hpstate
	.word 0x83a309ae  ! 4949: FDIVs	fdivs	%f12, %f14, %f1
	.word 0x90d38009  ! 4950: UMULcc_R	umulcc 	%r14, %r9, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x96c3a001  ! 4952: ADDCcc_I	addccc 	%r14, 0x0001, %r11
	mov 0x34, %r30
	.word 0x85d0001e  ! 4953: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x87d0001e  ! 4954: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x89d02034  ! 4955: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x8d902ade  ! 4956: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	.word 0x8d902496  ! 4957: WRPR_PSTATE_I	wrpr	%r0, 0x0496, %pstate
	.word 0xd68fe030  ! 4958: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x81982483  ! 4959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0483, %hpstate
	.word 0x8d902403  ! 4960: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0xd6d804a0  ! 4961: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	ta	T_CHANGE_NONPRIV	! macro
DS_254:
	.word 0x22800001  ! 4964: BE	be,a	<label_0x1>
	.word 0xd530e001  ! 4964: STQF_I	-	%f10, [0x0001, %r3]
	.word 0x83458000  ! 4963: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc33fe001  ! 4964: STDF_I	std	%f1, [0x0001, %r31]
DS_255:
	.word 0x22800001  ! 4966: BE	be,a	<label_0x1>
	.word 0xd930a001  ! 4966: STQF_I	-	%f12, [0x0001, %r2]
	.word 0x83458000  ! 4965: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d902c41  ! 4966: WRPR_PSTATE_I	wrpr	%r0, 0x0c41, %pstate
	.word 0x81a00563  ! 4967: FSQRTq	fsqrt	
DS_256:
	.word 0x32800001  ! 4969: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x91b2430b  ! 4968: ALLIGNADDRESS	alignaddr	%r9, %r11, %r8
	.word 0x8d902689  ! 4969: WRPR_PSTATE_I	wrpr	%r0, 0x0689, %pstate
	mov 0x32, %r30
	.word 0x93d0001e  ! 4970: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902a9b  ! 4971: WRPR_PSTATE_I	wrpr	%r0, 0x0a9b, %pstate
DS_257:
	.word 0x34800001  ! 4973: BG	bg,a	<label_0x1>
	.word 0xdf33e001  ! 4973: STQF_I	-	%f15, [0x0001, %r15]
	.word 0x8f458000  ! 4972: RD_SOFTINT_REG	rd	%softint, %r7
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcf37e001  ! 4975: STQF_I	-	%f7, [0x0001, %r31]
	.word 0x8d802004  ! 4976: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce17c000  ! 4978: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x9e484003  ! 4979: MULX_R	mulx 	%r1, %r3, %r15
	.word 0x866b2001  ! 4980: UDIVX_I	udivx 	%r12, 0x0001, %r3
	.word 0xc68008a0  ! 4981: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc7e7c023  ! 4982: CASA_I	casa	[%r31] 0x 1, %r3, %r3
	.word 0x8da149cf  ! 4983: FDIVd	fdivd	%f36, %f46, %f6
	.word 0xccffc02f  ! 4984: SWAPA_R	swapa	%r6, [%r31 + %r15] 0x01
	.word 0x819825d9  ! 4985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d9, %hpstate
	.word 0xcc47e001  ! 4986: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0x3e800001  ! 4987: BVC	bvc,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982a51  ! 4989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a51, %hpstate
	.word 0x8fa00546  ! 4990: FSQRTd	fsqrt	
	.word 0x91a34d20  ! 4991: FsMULd	fsmuld	%f13, %f0, %f8
	.word 0x819829c7  ! 4992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0x87802016  ! 4993: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x89d02033  ! 4994: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x3a800001  ! 4995: BCC	bcc,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9649e001  ! 4997: MULX_I	mulx 	%r7, 0x0001, %r11
	.word 0xd6d804a0  ! 4998: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11


.data
user_data_start:
	.xword	0x989a645bc475c8c9
	.xword	0x4b4157382b8b6143
	.xword	0xfaa91aca809bcea9
	.xword	0x2c10a3cd0542452e
	.xword	0x2f78a6c815bc8941
	.xword	0xb0d76f2afde41e9b
	.xword	0x7b9130646406a044
	.xword	0xa97fcf26b23234b2
	.xword	0xb2cec56bc0d27d47
	.xword	0xd1cfed29002a5e78
	.xword	0x1b93cb2f0cc479f5
	.xword	0xe910c5745ffe6514
	.xword	0x4aaa6b42d1d41467
	.xword	0x79c88a4c3381f89e
	.xword	0xe9fb1dc03b6c397c
	.xword	0x00b44e9d46d2e62f
	.xword	0x1c700423c7e3a8bc
	.xword	0xf8b303a02fe97912
	.xword	0xaa552dc3699e3fa7
	.xword	0x9e348c0aa9a8ff55
	.xword	0xd0c820673630e82f
	.xword	0x60a6b32a5d3121b1
	.xword	0xa187a00291e3dfbb
	.xword	0x613f6c3bbbbd84dd
	.xword	0x4b4365e56a545c52
	.xword	0x49dba3adc17f72c7
	.xword	0xf6e053e3cb5efd92
	.xword	0x25460b2a096ebbe0
	.xword	0x2867ba6b988d88bf
	.xword	0x1d7970cfd521141d
	.xword	0x6cb992a839b5216a
	.xword	0xcbefa6fa4beedaf6
	.xword	0x072b859e6229e72d
	.xword	0x29354cd58b32552a
	.xword	0xde09c32eccea450e
	.xword	0x1f7fd5937af62e3a
	.xword	0x207c9a0031fb22b0
	.xword	0xbc707997fd04e47e
	.xword	0x9c88ea128550141b
	.xword	0x73776e678d5e0413
	.xword	0x0999c3833f38acb6
	.xword	0x986154809528ca19
	.xword	0x4e6f6eb35833cc3d
	.xword	0x808d0881190e4ba1
	.xword	0xbea18cecb8ae0aa1
	.xword	0x736b9b0810b0d639
	.xword	0xd81a22903a7b59a1
	.xword	0xf4c05e45476989de
	.xword	0xd747ebff0e8a64bf
	.xword	0x496e64ba93b07d83
	.xword	0x177b3e7e054e551c
	.xword	0xf688d0a553168bd2
	.xword	0xcf24d1f2809f287f
	.xword	0x5b00a036871cb164
	.xword	0xc02dc70a1b2e0cc2
	.xword	0xde5c9963499a42c3
	.xword	0xe42895fef686f6a8
	.xword	0x48de89a821b944d7
	.xword	0x3fc238208918249f
	.xword	0x338ba6d1433851e0
	.xword	0xbebc4f4af15eb84f
	.xword	0x5227a1ca74fc81b2
	.xword	0xe67daf1048ae02c8
	.xword	0xb839deaaa19a8807
	.xword	0xdfa3f4f4bb958cc1
	.xword	0x3b18ad54a95dd8c3
	.xword	0x5c1a20da8fc0cd87
	.xword	0xa193de31f7903f23
	.xword	0xfca9523734a8a595
	.xword	0x316abca5404e8041
	.xword	0x815cf48fd8f2ac10
	.xword	0xffe1e500da9b547e
	.xword	0x01e8a1e8bf2d223c
	.xword	0x7edbdc17d3f7a8c2
	.xword	0x9aaf2b6f2e4a2cea
	.xword	0xaf9ea874a84eb1d3
	.xword	0x1c4325cfe039b4a2
	.xword	0x3829af822d12c958
	.xword	0xc7ba48083f2e654a
	.xword	0xf803e1dfa57b5795
	.xword	0xfeb5999e90ebe3c2
	.xword	0x675cbed69de7e434
	.xword	0x8d4ea9453c1cee7d
	.xword	0xf62f55dbba9c3b3e
	.xword	0x2cacbe9a3a9e0b3e
	.xword	0x9283b08c7e165952
	.xword	0x12e0c8f9ce3afa54
	.xword	0x85d6e7d27b622171
	.xword	0xcb558251d43f0734
	.xword	0x36a36bd697852573
	.xword	0xbaa60e0a0b364312
	.xword	0x06a997803c971108
	.xword	0x60a408977d9150db
	.xword	0x5585c1e728ad6cfa
	.xword	0x5b0c8b6021adee98
	.xword	0x40bbf6f0dd069e0b
	.xword	0xc0636b9c3a337131
	.xword	0x68171d733635206d
	.xword	0xed01e6649f50077b
	.xword	0x5d3a51835a3520b0
	.xword	0x70deb0a8fadbfa7d
	.xword	0x8a463c4d43e1d1de
	.xword	0xbedc5df4f02db280
	.xword	0x3ccb6804e58298c1
	.xword	0x5f0b42134b935813
	.xword	0x06914bd5293d954d
	.xword	0xa56f5518e829f8e8
	.xword	0xd70bf7221808468d
	.xword	0x9fd4274f307c0697
	.xword	0x68d92142af393d98
	.xword	0x1d25888d51dabd6c
	.xword	0x73282dbf5fb9726c
	.xword	0x670e6f382e2cd749
	.xword	0xc5b8f97dcab228e0
	.xword	0xb065369bc075f9bf
	.xword	0x2e7d202926606c0e
	.xword	0xf55c091a81a93e30
	.xword	0xbe89cc77c4518b5a
	.xword	0x48b58af2c0e0fb99
	.xword	0xad113731f557e75b
	.xword	0xe6ff22352f232817
	.xword	0x6c165dae9e1acc85
	.xword	0x2968366b2093075a
	.xword	0x8c073fb0ed5b9b6f
	.xword	0xc5100a52d7bd4d17
	.xword	0x471f03d0ac62bf49
	.xword	0x10da922e565e1069
	.xword	0xc7334b8ffb09c2e7
	.xword	0x422276674c16541e
	.xword	0x4ff620bd057be5e0
	.xword	0x70cbef70a155d17a
	.xword	0x86c14806af39eead
	.xword	0x37105e6b46f092c6
	.xword	0x51001b34243644f5
	.xword	0x5eedd7c11176d6a9
	.xword	0x8e650fa36da9a7eb
	.xword	0xc3175562f59fdaeb
	.xword	0xd089e4d3f3d30280
	.xword	0xc2b14f8649b5fdc0
	.xword	0x6f0244e18ccea162
	.xword	0x9bde8cf52c85d31a
	.xword	0x90ab5865e6d9729d
	.xword	0x23a21296ae9d6f50
	.xword	0x2fa4552ba85d6207
	.xword	0xaab8f52db3b896e8
	.xword	0x57a1f9259930f38f
	.xword	0xc122a919c7f19a67
	.xword	0x2b95e0d74b1d8292
	.xword	0xab32777906809119
	.xword	0x7a283ebf4f738ebe
	.xword	0x84b84169a88f1131
	.xword	0x3962d6a34daf86f0
	.xword	0xfee0dd7e8717caba
	.xword	0xba5bee5b8e97ee92
	.xword	0x8e11297734dca7e8
	.xword	0x2cc097fa15afa451
	.xword	0x66a3bd39cf9031b8
	.xword	0xb9910eebe3d5be6c
	.xword	0x445b728ef80d7d70
	.xword	0xc7043a7638a7f32c
	.xword	0x42585989cdbab3ce
	.xword	0x39052752f68c7cad
	.xword	0xf052f9889b388442
	.xword	0x6b939a77a0136631
	.xword	0x49bbb1961778cada
	.xword	0xfa723c446f73a8f0
	.xword	0x83002ee783e22e90
	.xword	0x15ddf46520019ba9
	.xword	0xe9a4c7ec981a56e6
	.xword	0x6e05a6b0df1ec937
	.xword	0x1a979173de8a88b6
	.xword	0x58523386db6cb624
	.xword	0xe2faaebea51803f1
	.xword	0xac3f33d7a1d584b7
	.xword	0x4ad715c929a3b589
	.xword	0x025f6093acf3330c
	.xword	0x2697ff9eeceee8bf
	.xword	0x89da43b16e67cd08
	.xword	0xb353cd3ad2d7e742
	.xword	0xcf1b30ce03071cf6
	.xword	0x22711981b7cf7ff3
	.xword	0x49b3a4107a72ecbf
	.xword	0xd068bea0f4e5b62e
	.xword	0x9cb7148fd8f057a1
	.xword	0x2888eb3e6e68fe7f
	.xword	0xa7faecff95eaf14a
	.xword	0xe948ec40b28765f9
	.xword	0xebf79d6741b19f8c
	.xword	0xdf7a71525d98c2ee
	.xword	0x9587211628028d4d
	.xword	0x7a8178b0c1184fab
	.xword	0xc3420fcd6d148c75
	.xword	0xf03f06f8cdc1b6de
	.xword	0xd1b629ecb1aaf8d9
	.xword	0xc8c818d14cbbdfc5
	.xword	0xcde3f219ef88d106
	.xword	0x9b73e92cd6281d7a
	.xword	0xc2b28c73dba9d774
	.xword	0x8286c645f6f3bb94
	.xword	0x85d9d84e06dca853
	.xword	0x13a89cf13894cda3
	.xword	0xd5a49f77dcbe2146
	.xword	0x41fd34b538aea35a
	.xword	0x0779cce5bae898fa
	.xword	0x7d647aca48e6fecc
	.xword	0x27ac41388a76e7a5
	.xword	0x326090326275a24c
	.xword	0xa97bddd50cdba926
	.xword	0xd436c70cbe3fb8ac
	.xword	0x3cc42c7937bcb4f2
	.xword	0xb042dd4af86094a0
	.xword	0xa1e368f934f8ebb5
	.xword	0xd7021af6f43320ea
	.xword	0xac72f23bc415079c
	.xword	0xfa900bbf82035910
	.xword	0x50275742bbf902b0
	.xword	0x619e0a19ad7131e1
	.xword	0x1dbfce544f99cb1a
	.xword	0x15475b87b3d55c83
	.xword	0xc570b50d78bc262f
	.xword	0xaeef3bd2d816bd0a
	.xword	0xc0d6be6bcd089286
	.xword	0x8b2b7d5097541a2e
	.xword	0x056ffa5bc06a4b60
	.xword	0x17e6e2abecbfdc5a
	.xword	0x4048c2921b2b0908
	.xword	0x76ad55573b091035
	.xword	0x79ca9505ec09962c
	.xword	0xe027f9c604e85f2c
	.xword	0x5153231c256f5878
	.xword	0xe1cc7cd72d562ec1
	.xword	0x3174ac324bfc5b8d
	.xword	0x52a4a85fb2f9bb1d
	.xword	0x233b8f5c58d64a3d
	.xword	0xd09164d3f2b37d73
	.xword	0xdc784d3faf78d74b
	.xword	0x3f483b92afb5b774
	.xword	0x993facf4e38509a7
	.xword	0xe7c73cf03fee833d
	.xword	0x6067758849c04522
	.xword	0x3fc726e157bc49fa
	.xword	0xf398b9d891b0591b
	.xword	0xa7540378d86393be
	.xword	0xfd0a1f06e189d6b3
	.xword	0xb971f96c49488f18
	.xword	0x058394519d0ee3c7
	.xword	0xae1fd81dc3e91969
	.xword	0xb7adc696f148715f
	.xword	0x4fb4467f1891f03c
	.xword	0x0c1d2a1722f4360d
	.xword	0xd5d1d7a7ad602fd0
	.xword	0x3c0ac76628140065
	.xword	0x0f1c2f4a27ac8c55
	.xword	0x6d9abb9fb55b3d11
	.xword	0x85904b8b693bddf6
	.xword	0x801be5bf3b9accb6


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Wed Apr  7 18:31:45 2004
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!#     int label = 0;
!!# 
!!# #define HTRAPS	0
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#     IJ_bind_thread_group("diag.j", 30, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 33, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!#     IJ_set_ropr_fld("diag.j", 39, ijdefault, Ft_Rs1, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 40, ijdefault, Ft_Rs2, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 41, ijdefault, Ft_Rd, "5'b0rrrr");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 44, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 47, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 48, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 52, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 53, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 54, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 58, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 59, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x7}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 73, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 74, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 75, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 78, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 79, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 80, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 83, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 88, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 91, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 92, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rrrrr");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 95,"{10}");
!!#     IJ_set_rvar("diag.j", 96, wt_high, "{60}");
!!#     IJ_set_rvar("diag.j", 97, wt_med,  "{30}");
!!#     IJ_set_rvar("diag.j", 98, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 102, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<3; k++) {
!!#         for (i = 0; i < 31; i++) {
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 106, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 108, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 111, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 114, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 117, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
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
!!#     IJ_printf  ("diag.j", 123, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 125, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 558, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_low
!!#         |  trap_asi     %rvar  wt_low
!!#         |  tcc          %rvar  wt_med
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
!!#         | stores        %rvar  wt_low
!!# ;
!!# 
!!# change_mode :   
!!#       tCHANGE_NONPRIV 
!!#     | tCHANGE_PRIV 
!!#     | tCHANGE_NONHPRIV
!!#     | tCHANGE_HPRIV 
!!#     //| tCHANGE_TO_TL1 
!!#     | tCHANGE_TO_TL0 
!!# ;
!!# 
!!# trap_asr :
!!#       tRDPR_TPC 
!!#     | tRDPR_TSTATE 
!!#     | tRDPR_TT
!!#     | tRDPR_TNPC
!!#     | tRDPR_TBA
!!#     | tRDPR_TL
!!#     | tRDHPR_HTBA
!!#     | tRDHPR_HPSTATE
!!# ;
!!# 
!!# splash_fprs :
!!#     tWRFPRS_I %ropr  Ro_wrfprs
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
!!#      IJ_printf("diag.j", 619, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#      tADD_I | tADDcc_R | tADDcc_I | tADDCcc_I |
!!#      tMULX_R | tMULX_I | tUMUL_R | tUMULcc_R | tUMULcc_I |
!!#      tSMULcc_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I |  tUDIVX_R |
!!#      tUDIVX_I | tFDIVs | tFDIVd | tFDIVq | tSWAP_I %ropr  Ro_ldst_ptr |
!!#      tSWAPA_R %ropr  Ro_ldst_ptr | tCASA_I %ropr  Ro_ldst_ptr |
!!#      tFSQRTq | tFSQRTd | tFsMULd | tFdMULq | tFqTOi | tFNEGd //| tFONES
!!# ;
!!# 
!!# br :     tBA | tBLE | tBGE | tBL | tBGU  | tBLEU | tBN | tBNE | tBE | tBG |
!!#          tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBPA | tBPN | tBPNE |
!!#          tBPE | tBPG | tBPLE | tBPGE | tBPL | tBPGU | tBPLEU | tBPCC | tBPCS |
!!#          tBPPOS | tBPNEG | tBPVC | tBPVS
!!# ;
!!# 
!!# branches : br | br_badelay ;
!!# 
!!# br_badelay : tRD_SOFTINT_REG 
!!#     {
!!#         IJ_printf("diag.j", 703, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 704,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 705,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#     } | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 708, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 709,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_printf("diag.j", 710, th0, "\tilltrap\n");
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
