/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand02_ind_03.s
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
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
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
	mov 0x33, %r30
	.word 0x9dd0001e  ! 1: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d9028d5  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x08d5, %pstate
	.word 0x8d802000  ! 3: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87d02032  ! 4: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x9ba000ca  ! 5: FNEGd	fnegd	%f10, %f44
	.word 0x8d902a46  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
	.word 0x87802010  ! 7: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802004  ! 8: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xda17c000  ! 9: LDUH_R	lduh	[%r31 + %r0], %r13
DS_0:
	.word 0x22800001  ! 11: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b2c30d  ! 10: ALLIGNADDRESS	alignaddr	%r11, %r13, %r10
	.word 0x8d902809  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x0809, %pstate
	.word 0x8d902299  ! 12: WRPR_PSTATE_I	wrpr	%r0, 0x0299, %pstate
	.word 0xd40fe001  ! 13: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x3c800001  ! 14: BPOS	bpos,a	<label_0x1>
	.word 0x93d02032  ! 15: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d480000  ! 16: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x8d902ac8  ! 17: WRPR_PSTATE_I	wrpr	%r0, 0x0ac8, %pstate
	.word 0xcc3fe001  ! 18: STD_I	std	%r6, [%r31 + 0x0001]
	.word 0x99a1cdc7  ! 19: FdMULq	fdmulq	
	.word 0x8d902448  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0448, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x2e800001  ! 22: BVS	bvs,a	<label_0x1>
	.word 0x9283c006  ! 23: ADDcc_R	addcc 	%r15, %r6, %r9
	.word 0x8d902648  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	mov 0x32, %r30
	.word 0x9bd0001e  ! 25: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
DS_1:
	.word 0x22800001  ! 29: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db2430a  ! 28: ALLIGNADDRESS	alignaddr	%r9, %r10, %r14
	.word 0x91d02033  ! 29: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d9020c5  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x00c5, %pstate
	.word 0x8d902e03  ! 31: WRPR_PSTATE_I	wrpr	%r0, 0x0e03, %pstate
	.word 0x8d902092  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x0092, %pstate
DS_2:
	.word 0x20800001  ! 34: BN	bn,a	<label_0x1>
	.word 0xd133e001  ! 34: STQF_I	-	%f8, [0x0001, %r15]
	.word 0x87458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8d902a86  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x0a86, %pstate
	.word 0x8052000c  ! 35: UMUL_R	umul 	%r8, %r12, %r0
	.word 0x8d90268a  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x068a, %pstate
	.word 0x36700001  ! 37: BPGE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL1	! macro
DS_3:
	.word 0x22800001  ! 41: BE	be,a	<label_0x1>
	.word 0xc131a001  ! 41: STQF_I	-	%f0, [0x0001, %r6]
	.word 0x97458000  ! 40: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x9fa00549  ! 41: FSQRTd	fsqrt	
	.word 0x2a800001  ! 42: BCS	bcs,a	<label_0x1>
DS_4:
	.word 0x20800001  ! 44: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb0c307  ! 43: ALLIGNADDRESS	alignaddr	%r3, %r7, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8cd04001  ! 45: UMULcc_R	umulcc 	%r1, %r1, %r6
	.word 0x98d10003  ! 46: UMULcc_R	umulcc 	%r4, %r3, %r12
	.word 0x8d902646  ! 47: WRPR_PSTATE_I	wrpr	%r0, 0x0646, %pstate
	.word 0x92006001  ! 48: ADD_I	add 	%r1, 0x0001, %r9
	.word 0x89d02034  ! 49: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xd28fe030  ! 50: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0x81a389c0  ! 51: FDIVd	fdivd	%f14, %f0, %f0
	.word 0x9d50c000  ! 52: RDPR_TT	rdpr	%tt, %r14
	.word 0x9dd02032  ! 53: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 54: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x32700001  ! 55: BPNE	<illegal instruction>
	.word 0x8d9024c1  ! 56: WRPR_PSTATE_I	wrpr	%r0, 0x04c1, %pstate
	.word 0x82c22001  ! 57: ADDCcc_I	addccc 	%r8, 0x0001, %r1
	.word 0xc23fc000  ! 58: STD_R	std	%r1, [%r31 + %r0]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc257e001  ! 60: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	ta	T_CHANGE_NONHPRIV	! macro
DS_5:
	.word 0x34800001  ! 63: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb0030e  ! 62: ALLIGNADDRESS	alignaddr	%r0, %r14, %r7
	.word 0x8d902848  ! 63: WRPR_PSTATE_I	wrpr	%r0, 0x0848, %pstate
	.word 0x9ba04dca  ! 64: FdMULq	fdmulq	
	.word 0x8a7b0000  ! 65: SDIV_R	sdiv 	%r12, %r0, %r5
	.word 0xca9fc020  ! 66: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0x87802004  ! 67: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca27e001  ! 69: STW_I	stw	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcac00e40  ! 71: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r5
	.word 0xcaffc020  ! 72: SWAPA_R	swapa	%r5, [%r31 + %r0] 0x01
	.word 0xca5fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x8a83e001  ! 74: ADDcc_I	addcc 	%r15, 0x0001, %r5
DS_6:
	.word 0x22800001  ! 76: BE	be,a	<label_0x1>
	.word 0xcd32800e  ! 76: STQF_R	-	%f6, [%r14, %r10]
	.word 0x9d458000  ! 75: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0xdde7c02e  ! 76: CASA_I	casa	[%r31] 0x 1, %r14, %r14
	.word 0x87802004  ! 77: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdd37c00e  ! 78: STQF_R	-	%f14, [%r14, %r31]
	mov 0x31, %r30
	.word 0x95d0001e  ! 79: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d90221a  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x021a, %pstate
	.word 0x9e4ba001  ! 81: MULX_I	mulx 	%r14, 0x0001, %r15
	.word 0x887aa001  ! 82: SDIV_I	sdiv 	%r10, 0x0001, %r4
	.word 0xc897e010  ! 83: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9fa289e4  ! 85: FDIVq	dis not found

	.word 0x34800001  ! 86: BG	bg,a	<label_0x1>
	.word 0xde87e000  ! 87: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r15
	.word 0xdf17c000  ! 88: LDQF_R	-	[%r31, %r0], %f15
	.word 0x95a00540  ! 89: FSQRTd	fsqrt	
	.word 0xd417c000  ! 90: LDUH_R	lduh	[%r31 + %r0], %r10
	mov 0x32, %r30
	.word 0x8dd0001e  ! 91: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 92: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9769a001  ! 93: SDIVX_I	sdivx	%r6, 0x0001, %r11
	.word 0x81d02035  ! 94: Tcc_I	tn	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902c49  ! 96: WRPR_PSTATE_I	wrpr	%r0, 0x0c49, %pstate
	.word 0xd687e030  ! 97: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r11
	.word 0x8d802004  ! 98: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902c55  ! 99: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	.word 0xd687e030  ! 100: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r11
	.word 0x80828000  ! 101: ADDcc_R	addcc 	%r10, %r0, %r0
	.word 0xc01fc000  ! 102: LDD_R	ldd	[%r31 + %r0], %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc137c000  ! 104: STQF_R	-	%f0, [%r0, %r31]
	.word 0x83a00543  ! 105: FSQRTd	fsqrt	
DS_7:
	.word 0x22800001  ! 107: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb1c303  ! 106: ALLIGNADDRESS	alignaddr	%r7, %r3, %r7
	.word 0x89682001  ! 107: SDIVX_I	sdivx	%r0, 0x0001, %r4
	.word 0x8d802000  ! 108: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x80d08004  ! 109: UMULcc_R	umulcc 	%r2, %r4, %r0
	.word 0x9cc2a001  ! 110: ADDCcc_I	addccc 	%r10, 0x0001, %r14
	.word 0x87802004  ! 111: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x866ba001  ! 112: UDIVX_I	udivx 	%r14, 0x0001, %r3
	.word 0x32700001  ! 113: BPNE	<illegal instruction>
DS_8:
	.word 0x20800001  ! 115: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87b30301  ! 114: ALLIGNADDRESS	alignaddr	%r12, %r1, %r3
	.word 0x91d02030  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9e53000a  ! 116: UMUL_R	umul 	%r12, %r10, %r15
	.word 0x83a009c8  ! 117: FDIVd	fdivd	%f0, %f8, %f32
	.word 0x8480c000  ! 118: ADDcc_R	addcc 	%r3, %r0, %r2
	.word 0x86822001  ! 119: ADDcc_I	addcc 	%r8, 0x0001, %r3
	.word 0xc727c000  ! 120: STF_R	st	%f3, [%r0, %r31]
	mov 0x31, %r30
	.word 0x89d0001e  ! 121: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc727c000  ! 122: STF_R	st	%f3, [%r0, %r31]
	.word 0x89d02034  ! 123: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x8b514000  ! 124: RDPR_TBA	rdpr	%tba, %r5
	.word 0xcbe7c020  ! 125: CASA_I	casa	[%r31] 0x 1, %r0, %r5
	.word 0x8cc1a001  ! 126: ADDCcc_I	addccc 	%r6, 0x0001, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xccc004a0  ! 128: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0xccd80e60  ! 129: LDXA_R	ldxa	[%r0, %r0] 0x73, %r6
	.word 0x87802014  ! 130: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xccd004a0  ! 131: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
DS_9:
	.word 0x32800001  ! 133: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b2c300  ! 132: ALLIGNADDRESS	alignaddr	%r11, %r0, %r3
	.word 0xc727e001  ! 133: STF_I	st	%f3, [0x0001, %r31]
	mov 0x31, %r30
	.word 0x9bd0001e  ! 134: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc647c000  ! 135: LDSW_R	ldsw	[%r31 + %r0], %r3
	.word 0x9dd02033  ! 136: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	mov 0x32, %r30
	.word 0x89d0001e  ! 137: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d902692  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0692, %pstate
	.word 0x9fd02032  ! 139: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x30700001  ! 140: BPA	<illegal instruction>
	.word 0x8d902a0e  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0a0e, %pstate
	mov 0x32, %r30
	.word 0x87d0001e  ! 142: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x806a8007  ! 143: UDIVX_R	udivx 	%r10, %r7, %r0
	.word 0x8d902859  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
	.word 0x8452000d  ! 145: UMUL_R	umul 	%r8, %r13, %r2
	.word 0x87a00545  ! 146: FSQRTd	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902808  ! 148: WRPR_PSTATE_I	wrpr	%r0, 0x0808, %pstate
	.word 0x85504000  ! 149: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x8d90201e  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x001e, %pstate
	.word 0x85500000  ! 151: RDPR_TPC	rdpr	%tpc, %r2
DS_10:
	.word 0x34800001  ! 153: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b0c302  ! 152: ALLIGNADDRESS	alignaddr	%r3, %r2, %r1
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x3e800001  ! 154: BVC	bvc,a	<label_0x1>
	.word 0x9cdb0005  ! 155: SMULcc_R	smulcc 	%r12, %r5, %r14
	.word 0x96486001  ! 156: MULX_I	mulx 	%r1, 0x0001, %r11
	.word 0x87802004  ! 157: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9fd02031  ! 159: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	mov 0x35, %r30
	.word 0x9bd0001e  ! 160: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d902408  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x0408, %pstate
	.word 0xd727c005  ! 162: STF_R	st	%f11, [%r5, %r31]
	.word 0x8d902a12  ! 163: WRPR_PSTATE_I	wrpr	%r0, 0x0a12, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802088  ! 165: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd7e7c025  ! 166: CASA_I	casa	[%r31] 0x 1, %r5, %r11
	.word 0x9d500000  ! 167: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x32800001  ! 168: BNE	bne,a	<label_0x1>
	.word 0x88d08005  ! 169: UMULcc_R	umulcc 	%r2, %r5, %r4
	.word 0x26700001  ! 170: BPL	<illegal instruction>
	.word 0xc8c804a0  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
DS_11:
	.word 0x32800001  ! 173: BNE	bne,a	<label_0x1>
	.word 0xdd30c00e  ! 173: STQF_R	-	%f14, [%r14, %r3]
	.word 0x95458000  ! 172: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x94d18003  ! 173: UMULcc_R	umulcc 	%r6, %r3, %r10
	.word 0x81b1cfec  ! 174: FONES	fones	%f0
	.word 0x84498007  ! 175: MULX_R	mulx 	%r6, %r7, %r2
	.word 0x8d902488  ! 176: WRPR_PSTATE_I	wrpr	%r0, 0x0488, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x98d0000e  ! 178: UMULcc_R	umulcc 	%r0, %r14, %r12
	.word 0x9ec2e001  ! 179: ADDCcc_I	addccc 	%r11, 0x0001, %r15
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x30700001  ! 181: BPA	<illegal instruction>
	.word 0xde57e001  ! 182: LDSH_I	ldsh	[%r31 + 0x0001], %r15
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x95b10feb  ! 184: FONES	fones	%f10
	ta	T_CHANGE_PRIV	! macro
	.word 0x896a6001  ! 186: SDIVX_I	sdivx	%r9, 0x0001, %r4
	.word 0x87802088  ! 187: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902ed6  ! 188: WRPR_PSTATE_I	wrpr	%r0, 0x0ed6, %pstate
	.word 0x9b6b800d  ! 189: SDIVX_R	sdivx	%r14, %r13, %r13
	.word 0xda97e000  ! 190: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
DS_12:
	.word 0x22800001  ! 192: BE	be,a	<label_0x1>
	.word 0xd7336001  ! 192: STQF_I	-	%f11, [0x0001, %r13]
	.word 0x9d458000  ! 191: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8d802004  ! 192: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 193: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x30800001  ! 194: BA	ba,a	<label_0x1>
	.word 0xdc5fe001  ! 195: LDX_I	ldx	[%r31 + 0x0001], %r14
DS_13:
	.word 0x22800001  ! 197: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b1030f  ! 196: ALLIGNADDRESS	alignaddr	%r4, %r15, %r9
	.word 0x8d802000  ! 197: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85b28fe7  ! 198: FONES	fones	%f2
	.word 0xc4c804a0  ! 199: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0xc47fe001  ! 200: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0xc4900e40  ! 201: LDUHA_R	lduha	[%r0, %r0] 0x72, %r2
	.word 0x87802080  ! 202: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8c814000  ! 203: ADDcc_R	addcc 	%r5, %r0, %r6
	.word 0xcc97e000  ! 204: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	.word 0x8d902a9e  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0a9e, %pstate
	.word 0xcd37c000  ! 206: STQF_R	-	%f6, [%r0, %r31]
	mov 0x33, %r30
	.word 0x8dd0001e  ! 207: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x83a389c4  ! 208: FDIVd	fdivd	%f14, %f4, %f32
	.word 0x9d6a800b  ! 209: SDIVX_R	sdivx	%r10, %r11, %r14
	.word 0x92834009  ! 210: ADDcc_R	addcc 	%r13, %r9, %r9
	.word 0x8ad1a001  ! 211: UMULcc_I	umulcc 	%r6, 0x0001, %r5
	.word 0x80814000  ! 212: ADDcc_R	addcc 	%r5, %r0, %r0
	.word 0x87802004  ! 213: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc007c000  ! 215: LDUW_R	lduw	[%r31 + %r0], %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a000c7  ! 217: FNEGd	fnegd	%f38, %f10
	.word 0xd4c804a0  ! 218: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x38800001  ! 219: BGU	bgu,a	<label_0x1>
	.word 0x97a01a65  ! 220: FqTOi	fqtoi	
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9d50c000  ! 222: RDPR_TT	rdpr	%tt, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x9c79000b  ! 224: SDIV_R	sdiv 	%r4, %r11, %r14
	.word 0x91b10fe3  ! 225: FONES	fones	%f8
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd137c003  ! 227: STQF_R	-	%f8, [%r3, %r31]
	.word 0x87802088  ! 228: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99a0056c  ! 229: FSQRTq	fsqrt	
	.word 0x97504000  ! 230: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xd6ffc02c  ! 231: SWAPA_R	swapa	%r11, [%r31 + %r12] 0x01
	.word 0xd6c004a0  ! 232: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd6dfe020  ! 233: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r11
	.word 0x8b690006  ! 234: SDIVX_R	sdivx	%r4, %r6, %r5
	.word 0x8d90221c  ! 235: WRPR_PSTATE_I	wrpr	%r0, 0x021c, %pstate
	.word 0xca3fe001  ! 236: STD_I	std	%r5, [%r31 + 0x0001]
	.word 0x886be001  ! 237: UDIVX_I	udivx 	%r15, 0x0001, %r4
	.word 0x9d50c000  ! 238: RDPR_TT	rdpr	%tt, %r14
	.word 0x8d902a19  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x0a19, %pstate
	.word 0x99a3c9c0  ! 240: FDIVd	fdivd	%f46, %f0, %f12
	.word 0x8d902ecf  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x0ecf, %pstate
	.word 0x9dd02030  ! 242: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x8000a001  ! 243: ADD_I	add 	%r2, 0x0001, %r0
	.word 0x97d02030  ! 244: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0xc08804a0  ! 245: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x8d902cc8  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x0cc8, %pstate
	.word 0x856b0004  ! 247: SDIVX_R	sdivx	%r12, %r4, %r2
	.word 0x8d90200b  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x000b, %pstate
	.word 0xc41fe001  ! 249: LDD_I	ldd	[%r31 + 0x0001], %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fa00567  ! 251: FSQRTq	fsqrt	
	.word 0x8d802000  ! 252: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802045  ! 253: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x8ada000f  ! 254: SMULcc_R	smulcc 	%r8, %r15, %r5
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x99d02033  ! 256: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	mov 0x33, %r30
	.word 0x95d0001e  ! 257: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xca3fe001  ! 258: STD_I	std	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 260: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9ba00562  ! 261: FSQRTq	fsqrt	
DS_14:
	.word 0x20800001  ! 263: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b30306  ! 262: ALLIGNADDRESS	alignaddr	%r12, %r6, %r12
	.word 0x34800001  ! 263: BG	bg,a	<label_0x1>
	.word 0x8d902ace  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x0ace, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd88804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	mov 0x33, %r30
	.word 0x87d0001e  ! 267: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9fa00565  ! 268: FSQRTq	fsqrt	
	.word 0xde87e010  ! 269: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r15
	.word 0x8d9026d7  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x06d7, %pstate
	.word 0x3c800001  ! 271: BPOS	bpos,a	<label_0x1>
	.word 0x8d902e5e  ! 272: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	.word 0x9769a001  ! 273: SDIVX_I	sdivx	%r6, 0x0001, %r11
	.word 0xd677e001  ! 274: STX_I	stx	%r11, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902cd5  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x0cd5, %pstate
	.word 0xd737c005  ! 278: STQF_R	-	%f11, [%r5, %r31]
	.word 0x94c0e001  ! 279: ADDCcc_I	addccc 	%r3, 0x0001, %r10
	.word 0x87802004  ! 280: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802004  ! 281: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81d02033  ! 282: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x9ed3c008  ! 283: UMULcc_R	umulcc 	%r15, %r8, %r15
	.word 0x87a10dca  ! 284: FdMULq	fdmulq	
	.word 0x99a0056f  ! 285: FSQRTq	fsqrt	
	.word 0x99d02031  ! 286: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x9b6b6001  ! 287: SDIVX_I	sdivx	%r13, 0x0001, %r13
	.word 0x8d90285d  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x085d, %pstate
	.word 0x89a000cf  ! 289: FNEGd	fnegd	%f46, %f4
	.word 0x9a4b400f  ! 290: MULX_R	mulx 	%r13, %r15, %r13
	.word 0xdb37e001  ! 291: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8d902cd3  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0cd3, %pstate
	.word 0xdac7e020  ! 293: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0x8280000a  ! 294: ADDcc_R	addcc 	%r0, %r10, %r1
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9c812001  ! 297: ADDcc_I	addcc 	%r4, 0x0001, %r14
DS_15:
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b3c30a  ! 298: ALLIGNADDRESS	alignaddr	%r15, %r10, %r0
	.word 0x8d9020ca  ! 299: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a1c  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x0a1c, %pstate
	.word 0x3a700001  ! 302: BPCC	<illegal instruction>
	.word 0x87a000c2  ! 303: FNEGd	fnegd	%f2, %f34
	.word 0x83d02031  ! 304: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x84796001  ! 305: SDIV_I	sdiv 	%r5, 0x0001, %r2
	.word 0x2a800001  ! 306: BCS	bcs,a	<label_0x1>
	.word 0xc4ffc022  ! 307: SWAPA_R	swapa	%r2, [%r31 + %r2] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc527e001  ! 309: STF_I	st	%f2, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x3e700001  ! 311: BPVC	<illegal instruction>
DS_16:
	.word 0x22800001  ! 313: BE	be,a	<label_0x1>
	.word 0xd332a001  ! 313: STQF_I	-	%f9, [0x0001, %r10]
	.word 0x87458000  ! 312: RD_SOFTINT_REG	rd	%softint, %r3
	mov 0x35, %r30
	.word 0x8bd0001e  ! 313: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x9dd02033  ! 314: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	mov 0x31, %r30
	.word 0x87d0001e  ! 315: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9da349a0  ! 316: FDIVs	fdivs	%f13, %f0, %f14
DS_17:
	.word 0x20800001  ! 318: BN	bn,a	<label_0x1>
	.word 0xcd32a001  ! 318: STQF_I	-	%f6, [0x0001, %r10]
	.word 0x95458000  ! 317: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8a68c000  ! 318: UDIVX_R	udivx 	%r3, %r0, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81d02034  ! 320: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0xcac804a0  ! 321: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0x86d9c00d  ! 322: SMULcc_R	smulcc 	%r7, %r13, %r3
	.word 0xc67fe001  ! 323: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x8d902691  ! 324: WRPR_PSTATE_I	wrpr	%r0, 0x0691, %pstate
	.word 0x95514000  ! 325: RDPR_TBA	rdpr	%tba, %r10
	.word 0x8d902411  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x0411, %pstate
	.word 0x836b2001  ! 327: SDIVX_I	sdivx	%r12, 0x0001, %r1
	.word 0xc29004a0  ! 328: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
DS_18:
	.word 0x20800001  ! 332: BN	bn,a	<label_0x1>
	.word 0xc133400f  ! 332: STQF_R	-	%f0, [%r15, %r13]
	.word 0x97458000  ! 331: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd68fe030  ! 332: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x8a82000d  ! 333: ADDcc_R	addcc 	%r8, %r13, %r5
	.word 0x8f514000  ! 334: RDPR_TBA	rdpr	%tba, %r7
	.word 0x3c800001  ! 335: BPOS	bpos,a	<label_0x1>
	.word 0xce87e010  ! 336: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r7
	.word 0x98788004  ! 337: SDIV_R	sdiv 	%r2, %r4, %r12
	ta	T_CHANGE_NONPRIV	! macro
DS_19:
	.word 0x32800001  ! 340: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b1030c  ! 339: ALLIGNADDRESS	alignaddr	%r4, %r12, %r3
	.word 0x87802016  ! 340: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902cd1  ! 341: WRPR_PSTATE_I	wrpr	%r0, 0x0cd1, %pstate
	.word 0x9e82e001  ! 342: ADDcc_I	addcc 	%r11, 0x0001, %r15
	.word 0x867a4003  ! 343: SDIV_R	sdiv 	%r9, %r3, %r3
	.word 0x91a00566  ! 344: FSQRTq	fsqrt	
	.word 0x8d802004  ! 345: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_20:
	.word 0x22800001  ! 347: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb3c30e  ! 346: ALLIGNADDRESS	alignaddr	%r15, %r14, %r5
	.word 0x8f500000  ! 347: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x8dd02034  ! 348: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	mov 0x32, %r30
	.word 0x89d0001e  ! 349: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8ba2cdc1  ! 350: FdMULq	fdmulq	
	.word 0x8d802004  ! 351: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90228f  ! 352: WRPR_PSTATE_I	wrpr	%r0, 0x028f, %pstate
	.word 0x8d902e16  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0e16, %pstate
	.word 0x8dd02030  ! 354: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xca8804a0  ! 355: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x9083400f  ! 356: ADDcc_R	addcc 	%r13, %r15, %r8
	mov 0x31, %r30
	.word 0x99d0001e  ! 357: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 358: BPLEU	<illegal instruction>
	mov 0x33, %r30
	.word 0x87d0001e  ! 359: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d902a04  ! 360: WRPR_PSTATE_I	wrpr	%r0, 0x0a04, %pstate
	.word 0xd09fe001  ! 361: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	.word 0xd137e001  ! 362: STQF_I	-	%f8, [0x0001, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd127c00f  ! 364: STF_R	st	%f8, [%r15, %r31]
	.word 0x8d902092  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x0092, %pstate
	.word 0x99d02033  ! 366: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x9cd10007  ! 367: UMULcc_R	umulcc 	%r4, %r7, %r14
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x99d0001e  ! 369: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x38700001  ! 370: BPGU	<illegal instruction>
	.word 0x81a1cd21  ! 371: FsMULd	fsmuld	%f7, %f32, %f0
	.word 0x8081400c  ! 372: ADDcc_R	addcc 	%r5, %r12, %r0
	.word 0x8a82800c  ! 373: ADDcc_R	addcc 	%r10, %r12, %r5
	mov 0x35, %r30
	.word 0x87d0001e  ! 374: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 375: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xcad804a0  ! 376: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0xca7fe001  ! 377: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x9dd02031  ! 378: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 381: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8669a001  ! 382: UDIVX_I	udivx 	%r6, 0x0001, %r3
	.word 0x9a83a001  ! 383: ADDcc_I	addcc 	%r14, 0x0001, %r13
	.word 0xdaffc02c  ! 384: SWAPA_R	swapa	%r13, [%r31 + %r12] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x99d02032  ! 387: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0x87802088  ! 388: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802004  ! 389: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902890  ! 390: WRPR_PSTATE_I	wrpr	%r0, 0x0890, %pstate
	.word 0x8d902e91  ! 391: WRPR_PSTATE_I	wrpr	%r0, 0x0e91, %pstate
	.word 0x97b2cfe8  ! 392: FONES	fones	%f11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 394: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd68fe000  ! 395: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0x9679a001  ! 396: SDIV_I	sdiv 	%r6, 0x0001, %r11
	.word 0xd67fe001  ! 397: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xd617e001  ! 398: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x8d902851  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x0851, %pstate
	.word 0x2e700001  ! 400: BPVS	<illegal instruction>
	.word 0x8fd02034  ! 401: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd68004a0  ! 403: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r11
	.word 0x81a089e1  ! 404: FDIVq	dis not found

	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802014  ! 406: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc0ffc021  ! 407: SWAPA_R	swapa	%r0, [%r31 + %r1] 0x01
	.word 0x86da8007  ! 408: SMULcc_R	smulcc 	%r10, %r7, %r3
	.word 0x8d90208a  ! 409: WRPR_PSTATE_I	wrpr	%r0, 0x008a, %pstate
	mov 0x33, %r30
	.word 0x85d0001e  ! 410: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 411: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x806b8005  ! 412: UDIVX_R	udivx 	%r14, %r5, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902894  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x0894, %pstate
	.word 0x87802045  ! 415: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x807b2001  ! 416: SDIV_I	sdiv 	%r12, 0x0001, %r0
	.word 0xc0d7e020  ! 417: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	.word 0xc1e7c025  ! 418: CASA_I	casa	[%r31] 0x 1, %r5, %r0
	.word 0x8ba30dc3  ! 419: FdMULq	fdmulq	
	.word 0x97d02030  ! 420: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0x8d480000  ! 421: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x907b4003  ! 422: SDIV_R	sdiv 	%r13, %r3, %r8
	.word 0xd137c003  ! 423: STQF_R	-	%f8, [%r3, %r31]
	.word 0x24800001  ! 424: BLE	ble,a	<label_0x1>
	.word 0xd1e7c023  ! 425: CASA_I	casa	[%r31] 0x 1, %r3, %r8
	.word 0x28800001  ! 426: BLEU	bleu,a	<label_0x1>
	.word 0x9969800f  ! 427: SDIVX_R	sdivx	%r6, %r15, %r12
	.word 0x9a69a001  ! 428: UDIVX_I	udivx 	%r6, 0x0001, %r13
	.word 0x8d902cc6  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x0cc6, %pstate
	mov 0x32, %r30
	.word 0x99d0001e  ! 430: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 431: BPGE	<illegal instruction>
	.word 0x90c3e001  ! 432: ADDCcc_I	addccc 	%r15, 0x0001, %r8
	mov 0x33, %r30
	.word 0x8fd0001e  ! 433: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 434: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd127e001  ! 435: STF_I	st	%f8, [0x0001, %r31]
	.word 0x93a28dcd  ! 436: FdMULq	fdmulq	
DS_21:
	.word 0x32800001  ! 438: BNE	bne,a	<label_0x1>
	.word 0xc933400e  ! 438: STQF_R	-	%f4, [%r14, %r13]
	.word 0x81458000  ! 437: RD_SOFTINT_REG	stbar
	.word 0x8d902e58  ! 438: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0x8550c000  ! 439: RDPR_TT	rdpr	%tt, %r2
	.word 0x85d02035  ! 440: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x9ba049a9  ! 441: FDIVs	fdivs	%f1, %f9, %f13
	mov 0x35, %r30
	.word 0x81d0001e  ! 442: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9ba14d2d  ! 443: FsMULd	fsmuld	%f5, %f44, %f44
	.word 0x88694009  ! 444: UDIVX_R	udivx 	%r5, %r9, %r4
	mov 0x35, %r30
	.word 0x8dd0001e  ! 445: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 446: BN	bn,a	<label_0x1>
	.word 0x8fa000c6  ! 447: FNEGd	fnegd	%f6, %f38
	.word 0x8d9022c0  ! 448: WRPR_PSTATE_I	wrpr	%r0, 0x02c0, %pstate
	mov 0x33, %r30
	.word 0x8fd0001e  ! 449: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x80006001  ! 450: ADD_I	add 	%r1, 0x0001, %r0
	.word 0x8c4ac005  ! 451: MULX_R	mulx 	%r11, %r5, %r6
	.word 0x87514000  ! 452: RDPR_TBA	rdpr	%tba, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc737c005  ! 454: STQF_R	-	%f3, [%r5, %r31]
	.word 0x89a0054b  ! 455: FSQRTd	fsqrt	
	.word 0x22800001  ! 456: BE	be,a	<label_0x1>
	.word 0x8d902a92  ! 457: WRPR_PSTATE_I	wrpr	%r0, 0x0a92, %pstate
	.word 0x87802004  ! 458: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x85d0001e  ! 461: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x83a000cd  ! 462: FNEGd	fnegd	%f44, %f32
	.word 0xc2c7e030  ! 463: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r1
	.word 0x8d802000  ! 464: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a11  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x0a11, %pstate
	mov 0x35, %r30
	.word 0x9fd0001e  ! 467: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc29fc020  ! 468: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0x8d902cdc  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	.word 0x22700001  ! 470: BPE	<illegal instruction>
	.word 0x9a82a001  ! 471: ADDcc_I	addcc 	%r10, 0x0001, %r13
	.word 0x8d90261d  ! 472: WRPR_PSTATE_I	wrpr	%r0, 0x061d, %pstate
	.word 0x984ac004  ! 473: MULX_R	mulx 	%r11, %r4, %r12
	.word 0x8d902657  ! 474: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0x8da18d20  ! 475: FsMULd	fsmuld	%f6, %f0, %f6
	.word 0xcc8fe020  ! 476: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r6
	.word 0x8d802000  ! 477: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba209c6  ! 479: FDIVd	fdivd	%f8, %f6, %f36
	.word 0x87802080  ! 480: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xcb97e001  ! 481: LDQFA_I	-	[%r31, 0x0001], %f5
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90268c  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x068c, %pstate
	mov 0x34, %r30
	.word 0x8bd0001e  ! 484: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d902cdf  ! 485: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	.word 0x8d902ec2  ! 486: WRPR_PSTATE_I	wrpr	%r0, 0x0ec2, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9880e001  ! 488: ADDcc_I	addcc 	%r3, 0x0001, %r12
	.word 0x8e534009  ! 489: UMUL_R	umul 	%r13, %r9, %r7
	.word 0x96db0009  ! 490: SMULcc_R	smulcc 	%r12, %r9, %r11
	.word 0xd67fe001  ! 491: SWAP_I	swap	%r11, [%r31 + 0x0001]
DS_22:
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b20304  ! 492: ALLIGNADDRESS	alignaddr	%r8, %r4, %r12
	.word 0x8d802000  ! 493: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x30800001  ! 494: BA	ba,a	<label_0x1>
	.word 0x36800001  ! 495: BGE	bge,a	<label_0x1>
	.word 0xd8d804a0  ! 496: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x82782001  ! 497: SDIV_I	sdiv 	%r0, 0x0001, %r1
	mov 0x33, %r30
	.word 0x91d0001e  ! 498: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_23:
	.word 0x22800001  ! 500: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b04306  ! 499: ALLIGNADDRESS	alignaddr	%r1, %r6, %r3
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x85d0001e  ! 502: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc6cfe010  ! 503: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	.word 0x8ac06001  ! 504: ADDCcc_I	addccc 	%r1, 0x0001, %r5
	.word 0x87802080  ! 505: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xcad00e80  ! 506: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r5
	.word 0x80026001  ! 507: ADD_I	add 	%r9, 0x0001, %r0
	.word 0x8eda400f  ! 508: SMULcc_R	smulcc 	%r9, %r15, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x32700001  ! 510: BPNE	<illegal instruction>
	.word 0xcf17c000  ! 511: LDQF_R	-	[%r31, %r0], %f7
	.word 0x8801a001  ! 512: ADD_I	add 	%r6, 0x0001, %r4
	.word 0x96480009  ! 513: MULX_R	mulx 	%r0, %r9, %r11
	ta	T_CHANGE_HPRIV	! macro
	mov 0x35, %r30
	.word 0x9bd0001e  ! 515: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x89d02034  ! 517: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x95a000cd  ! 518: FNEGd	fnegd	%f44, %f10
	.word 0x8d802004  ! 519: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd4c80e80  ! 521: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r10
	.word 0xd43fe001  ! 522: STD_I	std	%r10, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8a78a001  ! 524: SDIV_I	sdiv 	%r2, 0x0001, %r5
	.word 0x2c700001  ! 525: BPNEG	<illegal instruction>
	.word 0x8d802000  ! 526: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_24:
	.word 0x20800001  ! 528: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb34303  ! 527: ALLIGNADDRESS	alignaddr	%r13, %r3, %r7
	.word 0x87a00d21  ! 528: FsMULd	fsmuld	%f0, %f32, %f34
	.word 0x95d02032  ! 529: Tcc_I	tg	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc677e001  ! 531: STX_I	stx	%r3, [%r31 + 0x0001]
	.word 0xc68004a0  ! 532: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r3
DS_25:
	.word 0x20800001  ! 534: BN	bn,a	<label_0x1>
	.word 0xc7332001  ! 534: STQF_I	-	%f3, [0x0001, %r12]
	.word 0x8b458000  ! 533: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca47c000  ! 534: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x32700001  ! 535: BPNE	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x26700001  ! 539: BPL	<illegal instruction>
	.word 0x8853400f  ! 540: UMUL_R	umul 	%r13, %r15, %r4
	.word 0x8d802000  ! 541: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x8bd0001e  ! 543: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc937c00f  ! 544: STQF_R	-	%f4, [%r15, %r31]
	.word 0x87802088  ! 545: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8a78a001  ! 546: SDIV_I	sdiv 	%r2, 0x0001, %r5
	.word 0xca8fe000  ! 547: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0x93a149e7  ! 548: FDIVq	dis not found

	.word 0x2c700001  ! 549: BPNEG	<illegal instruction>
	.word 0xd20fc000  ! 550: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0x9ed02001  ! 551: UMULcc_I	umulcc 	%r0, 0x0001, %r15
DS_26:
	.word 0x22800001  ! 553: BE	be,a	<label_0x1>
	.word 0xcb336001  ! 553: STQF_I	-	%f5, [0x0001, %r13]
	.word 0x8b458000  ! 552: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x93a089ec  ! 553: FDIVq	dis not found

	.word 0x9069e001  ! 554: UDIVX_I	udivx 	%r7, 0x0001, %r8
	mov 0x34, %r30
	.word 0x89d0001e  ! 555: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
DS_27:
	.word 0x32800001  ! 557: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b28303  ! 556: ALLIGNADDRESS	alignaddr	%r10, %r3, %r0
	.word 0x9e7ba001  ! 557: SDIV_I	sdiv 	%r14, 0x0001, %r15
	.word 0x87802045  ! 558: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x9a49e001  ! 559: MULX_I	mulx 	%r7, 0x0001, %r13
DS_28:
	.word 0x22800001  ! 561: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b0c303  ! 560: ALLIGNADDRESS	alignaddr	%r3, %r3, %r1
	.word 0xc257e001  ! 561: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	.word 0x81d02031  ! 562: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0x38700001  ! 563: BPGU	<illegal instruction>
	mov 0x31, %r30
	.word 0x9dd0001e  ! 564: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xc21fc000  ! 565: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x8d902a8d  ! 566: WRPR_PSTATE_I	wrpr	%r0, 0x0a8d, %pstate
	.word 0x87802088  ! 567: WRASI_I	wr	%r0, 0x0088, %asi
DS_29:
	.word 0x34800001  ! 569: BG	bg,a	<label_0x1>
	.word 0xdd31a001  ! 569: STQF_I	-	%f14, [0x0001, %r6]
	.word 0x91458000  ! 568: RD_SOFTINT_REG	rd	%softint, %r8
DS_30:
	.word 0x22800001  ! 570: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b0830f  ! 569: ALLIGNADDRESS	alignaddr	%r2, %r15, %r12
	mov 0x30, %r30
	.word 0x81d0001e  ! 570: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8dd02031  ! 571: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x8d902c5c  ! 572: WRPR_PSTATE_I	wrpr	%r0, 0x0c5c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd8c804a0  ! 574: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x95d02031  ! 575: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8e6a2001  ! 576: UDIVX_I	udivx 	%r8, 0x0001, %r7
	.word 0xcfe7c02f  ! 577: CASA_I	casa	[%r31] 0x 1, %r15, %r7
	mov 0x30, %r30
	.word 0x9dd0001e  ! 578: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xcf27e001  ! 579: STF_I	st	%f7, [0x0001, %r31]
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802010  ! 582: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xce77e001  ! 584: STX_I	stx	%r7, [%r31 + 0x0001]
	mov 0x31, %r30
	.word 0x81d0001e  ! 585: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9bd02032  ! 586: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x8d500000  ! 587: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x91d02030  ! 588: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a249c0  ! 590: FDIVd	fdivd	%f40, %f0, %f10
DS_31:
	.word 0x34800001  ! 592: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b14304  ! 591: ALLIGNADDRESS	alignaddr	%r5, %r4, %r9
	mov 0x34, %r30
	.word 0x87d0001e  ! 592: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd2880e40  ! 593: LDUBA_R	lduba	[%r0, %r0] 0x72, %r9
	.word 0x9dd02032  ! 594: Tcc_I	tpos	icc_or_xcc, %r0 + 50
DS_32:
	.word 0x22800001  ! 596: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb00301  ! 595: ALLIGNADDRESS	alignaddr	%r0, %r1, %r7
	.word 0x9cd14006  ! 596: UMULcc_R	umulcc 	%r5, %r6, %r14
	.word 0x20800001  ! 597: BN	bn,a	<label_0x1>
	.word 0xdc87e020  ! 598: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r14
	.word 0x86d0000b  ! 599: UMULcc_R	umulcc 	%r0, %r11, %r3
	mov 0x33, %r30
	.word 0x85d0001e  ! 600: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d902e45  ! 601: WRPR_PSTATE_I	wrpr	%r0, 0x0e45, %pstate
	.word 0x92d8c009  ! 602: SMULcc_R	smulcc 	%r3, %r9, %r9
	.word 0x87a0c9e7  ! 603: FDIVq	dis not found

	.word 0xc6d00e80  ! 604: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r3
	.word 0xc68804a0  ! 605: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0x8d902e5f  ! 606: WRPR_PSTATE_I	wrpr	%r0, 0x0e5f, %pstate
	.word 0x8d902415  ! 607: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
	.word 0xc61fe001  ! 608: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0xc737e001  ! 609: STQF_I	-	%f3, [0x0001, %r31]
	mov 0x35, %r30
	.word 0x8bd0001e  ! 610: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x32, %r30
	.word 0x85d0001e  ! 612: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 613: BN	bn,a	<label_0x1>
	.word 0xc6cfe020  ! 614: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	mov 0x31, %r30
	.word 0x9fd0001e  ! 615: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x93d0001e  ! 617: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x9fd0001e  ! 618: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x84492001  ! 619: MULX_I	mulx 	%r4, 0x0001, %r2
	.word 0x84036001  ! 620: ADD_I	add 	%r13, 0x0001, %r2
DS_33:
	.word 0x20800001  ! 622: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b10301  ! 621: ALLIGNADDRESS	alignaddr	%r4, %r1, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 623: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x32, %r30
	.word 0x95d0001e  ! 624: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 625: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8b50c000  ! 626: RDPR_TT	rdpr	%tt, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x9fa01a6f  ! 628: FqTOi	fqtoi	
DS_34:
	.word 0x34800001  ! 630: BG	bg,a	<label_0x1>
	.word 0xcb33a001  ! 630: STQF_I	-	%f5, [0x0001, %r14]
	.word 0x95458000  ! 629: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x93a30dc1  ! 630: FdMULq	fdmulq	
	.word 0x87802080  ! 631: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x88830006  ! 632: ADDcc_R	addcc 	%r12, %r6, %r4
	.word 0xc8880e80  ! 633: LDUBA_R	lduba	[%r0, %r0] 0x74, %r4
	.word 0x8d9028dc  ! 634: WRPR_PSTATE_I	wrpr	%r0, 0x08dc, %pstate
	.word 0x87802004  ! 635: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 636: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc8d7e010  ! 637: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r4
	.word 0x3c700001  ! 638: BPPOS	<illegal instruction>
	.word 0x99500000  ! 639: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8fb24fe7  ! 640: FONES	fones	%f7
	.word 0x8d90220d  ! 641: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	mov 0x30, %r30
	.word 0x91d0001e  ! 642: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802045  ! 643: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x9a818009  ! 644: ADDcc_R	addcc 	%r6, %r9, %r13
	.word 0x87802010  ! 645: WRASI_I	wr	%r0, 0x0010, %asi
DS_35:
	.word 0x20800001  ! 647: BN	bn,a	<label_0x1>
	.word 0xc9308007  ! 647: STQF_R	-	%f4, [%r7, %r2]
	.word 0x91458000  ! 646: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d9022c7  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0x83a00563  ! 648: FSQRTq	fsqrt	
	.word 0x8fd02031  ! 649: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xc27fe001  ! 650: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x9bd02035  ! 651: Tcc_I	tcc	icc_or_xcc, %r0 + 53
DS_36:
	.word 0x34800001  ! 653: BG	bg,a	<label_0x1>
	.word 0xdb314000  ! 653: STQF_R	-	%f13, [%r0, %r5]
	.word 0x8f458000  ! 652: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x867b6001  ! 653: SDIV_I	sdiv 	%r13, 0x0001, %r3
	.word 0x87802004  ! 654: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02031  ! 655: Tcc_I	tne	icc_or_xcc, %r0 + 49
DS_37:
	.word 0x32800001  ! 657: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b14306  ! 656: ALLIGNADDRESS	alignaddr	%r5, %r6, %r2
	.word 0x22800001  ! 657: BE	be,a	<label_0x1>
	.word 0x8d902a1d  ! 658: WRPR_PSTATE_I	wrpr	%r0, 0x0a1d, %pstate
	.word 0xc437c006  ! 659: STH_R	sth	%r2, [%r31 + %r6]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90209f  ! 661: WRPR_PSTATE_I	wrpr	%r0, 0x009f, %pstate
	.word 0x98c32001  ! 662: ADDCcc_I	addccc 	%r12, 0x0001, %r12
	.word 0x95d02033  ! 663: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0xd927e001  ! 664: STF_I	st	%f12, [0x0001, %r31]
DS_38:
	.word 0x32800001  ! 666: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b0c30d  ! 665: ALLIGNADDRESS	alignaddr	%r3, %r13, %r9
	.word 0x8d902acf  ! 666: WRPR_PSTATE_I	wrpr	%r0, 0x0acf, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90224c  ! 669: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cd2800f  ! 671: UMULcc_R	umulcc 	%r10, %r15, %r6
	.word 0xcd27e001  ! 672: STF_I	st	%f6, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87d02033  ! 675: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0xcc5fc000  ! 676: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x97500000  ! 677: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x87802010  ! 678: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9ed8c007  ! 679: SMULcc_R	smulcc 	%r3, %r7, %r15
	.word 0x9a83800b  ! 680: ADDcc_R	addcc 	%r14, %r11, %r13
	.word 0x8d802004  ! 681: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x32, %r30
	.word 0x9dd0001e  ! 682: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xdacfe010  ! 683: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xda9fe001  ! 686: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 688: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x99d0001e  ! 689: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x95d02035  ! 690: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x2c800001  ! 691: BNEG	bneg,a	<label_0x1>
	.word 0x32700001  ! 692: BPNE	<illegal instruction>
	.word 0xda2fc00b  ! 693: STB_R	stb	%r13, [%r31 + %r11]
DS_39:
	.word 0x34800001  ! 695: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb1830e  ! 694: ALLIGNADDRESS	alignaddr	%r6, %r14, %r15
	.word 0x97a00547  ! 695: FSQRTd	fsqrt	
	.word 0x90d22001  ! 696: UMULcc_I	umulcc 	%r8, 0x0001, %r8
	mov 0x30, %r30
	.word 0x81d0001e  ! 697: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9fd02035  ! 698: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xd09004a0  ! 699: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x9402e001  ! 700: ADD_I	add 	%r11, 0x0001, %r10
	.word 0x95480000  ! 701: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x8fa0c9e1  ! 702: FDIVq	dis not found

	.word 0xced004a0  ! 703: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0xce8804a0  ! 704: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0xce17c000  ! 705: LDUH_R	lduh	[%r31 + %r0], %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802045  ! 707: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x8a81c004  ! 708: ADDcc_R	addcc 	%r7, %r4, %r5
DS_40:
	.word 0x20800001  ! 710: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b30301  ! 709: ALLIGNADDRESS	alignaddr	%r12, %r1, %r12
	.word 0x8d902e1d  ! 710: WRPR_PSTATE_I	wrpr	%r0, 0x0e1d, %pstate
DS_41:
	.word 0x20800001  ! 712: BN	bn,a	<label_0x1>
	.word 0xcf33000d  ! 712: STQF_R	-	%f7, [%r13, %r12]
	.word 0x9b458000  ! 711: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x83b00fe5  ! 712: FONES	fones	%f1
	.word 0x9da2c9c7  ! 713: FDIVd	fdivd	%f42, %f38, %f14
	.word 0x8d902844  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x0844, %pstate
DS_42:
	.word 0x20800001  ! 716: BN	bn,a	<label_0x1>
	.word 0xc3328006  ! 716: STQF_R	-	%f1, [%r6, %r10]
	.word 0x93458000  ! 715: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d902008  ! 716: WRPR_PSTATE_I	wrpr	%r0, 0x0008, %pstate
DS_43:
	.word 0x20800001  ! 718: BN	bn,a	<label_0x1>
	.word 0xdd326001  ! 718: STQF_I	-	%f14, [0x0001, %r9]
	.word 0x87458000  ! 717: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc65fc000  ! 718: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x2c800001  ! 719: BNEG	bneg,a	<label_0x1>
	mov 0x34, %r30
	.word 0x8fd0001e  ! 720: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9ad26001  ! 721: UMULcc_I	umulcc 	%r9, 0x0001, %r13
	.word 0x91a000cf  ! 722: FNEGd	fnegd	%f46, %f8
	.word 0x8d902ac0  ! 723: WRPR_PSTATE_I	wrpr	%r0, 0x0ac0, %pstate
	.word 0x8d90249e  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x049e, %pstate
DS_44:
	.word 0x32800001  ! 726: BNE	bne,a	<label_0x1>
	.word 0xd9328004  ! 726: STQF_R	-	%f12, [%r4, %r10]
	.word 0x93458000  ! 725: RD_SOFTINT_REG	rd	%softint, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd2c7e030  ! 727: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0xd2900e80  ! 728: LDUHA_R	lduha	[%r0, %r0] 0x74, %r9
	.word 0x9083a001  ! 729: ADDcc_I	addcc 	%r14, 0x0001, %r8
	.word 0x87b38fee  ! 730: FONES	fones	%f3
	.word 0x8d802000  ! 731: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc737e001  ! 732: STQF_I	-	%f3, [0x0001, %r31]
	.word 0xc6c804a0  ! 733: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0xc6ffc02e  ! 734: SWAPA_R	swapa	%r3, [%r31 + %r14] 0x01
	.word 0xc6c804a0  ! 735: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x8d90260c  ! 736: WRPR_PSTATE_I	wrpr	%r0, 0x060c, %pstate
	.word 0xc697e020  ! 737: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x33, %r30
	.word 0x89d0001e  ! 739: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
DS_45:
	.word 0x20800001  ! 741: BN	bn,a	<label_0x1>
	.word 0xc732e001  ! 741: STQF_I	-	%f3, [0x0001, %r11]
	.word 0x95458000  ! 740: RD_SOFTINT_REG	rd	%softint, %r10
	mov 0x31, %r30
	.word 0x8bd0001e  ! 741: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d902e07  ! 742: WRPR_PSTATE_I	wrpr	%r0, 0x0e07, %pstate
	.word 0x87a18dce  ! 743: FdMULq	fdmulq	
	.word 0xc69004a0  ! 744: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x9b68c006  ! 745: SDIVX_R	sdivx	%r3, %r6, %r13
	.word 0xda1fe001  ! 746: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x9ad08000  ! 747: UMULcc_R	umulcc 	%r2, %r0, %r13
	.word 0x8c7b2001  ! 748: SDIV_I	sdiv 	%r12, 0x0001, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x824ba001  ! 751: MULX_I	mulx 	%r14, 0x0001, %r1
	mov 0x30, %r30
	.word 0x87d0001e  ! 752: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9d514000  ! 753: RDPR_TBA	rdpr	%tba, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8681c00f  ! 757: ADDcc_R	addcc 	%r7, %r15, %r3
	.word 0x8d508000  ! 758: RDPR_TSTATE	rdpr	%tstate, %r6
DS_46:
	.word 0x20800001  ! 760: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b38302  ! 759: ALLIGNADDRESS	alignaddr	%r14, %r2, %r1
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x35, %r30
	.word 0x85d0001e  ! 761: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802000  ! 763: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9bd02031  ! 765: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x9bd02034  ! 766: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc327e001  ! 768: STF_I	st	%f1, [0x0001, %r31]
	.word 0x95d02033  ! 769: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x89d02031  ! 770: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0x99a00562  ! 771: FSQRTq	fsqrt	
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802004  ! 773: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 774: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902656  ! 775: WRPR_PSTATE_I	wrpr	%r0, 0x0656, %pstate
	.word 0xd927e001  ! 776: STF_I	st	%f12, [0x0001, %r31]
	.word 0x87802014  ! 777: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8248a001  ! 778: MULX_I	mulx 	%r2, 0x0001, %r1
	.word 0x8bd02035  ! 779: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x85a00567  ! 780: FSQRTq	fsqrt	
	.word 0xc4c7e030  ! 781: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0x8d902a58  ! 782: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	.word 0xc477e001  ! 783: STX_I	stx	%r2, [%r31 + 0x0001]
	.word 0x91514000  ! 784: RDPR_TBA	rdpr	%tba, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87a00542  ! 786: FSQRTd	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc6ffc022  ! 788: SWAPA_R	swapa	%r3, [%r31 + %r2] 0x01
	.word 0x38700001  ! 789: BPGU	<illegal instruction>
	.word 0x87802004  ! 790: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x98d36001  ! 791: UMULcc_I	umulcc 	%r13, 0x0001, %r12
	.word 0xd817e001  ! 792: LDUH_I	lduh	[%r31 + 0x0001], %r12
	mov 0x33, %r30
	.word 0x89d0001e  ! 793: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x8dd0001e  ! 794: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902c93  ! 796: WRPR_PSTATE_I	wrpr	%r0, 0x0c93, %pstate
	.word 0x2c800001  ! 797: BNEG	bneg,a	<label_0x1>
	.word 0x8f494000  ! 798: RDHPR_HTBA	rdhpr	%htba, %r7
	ta	T_CHANGE_NONHPRIV	! macro
DS_47:
	.word 0x20800001  ! 801: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b00305  ! 800: ALLIGNADDRESS	alignaddr	%r0, %r5, %r12
	.word 0xd927e001  ! 801: STF_I	st	%f12, [0x0001, %r31]
	.word 0xd927c005  ! 802: STF_R	st	%f12, [%r5, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd927e001  ! 804: STF_I	st	%f12, [0x0001, %r31]
	.word 0x8d902a46  ! 805: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
	.word 0x847a6001  ! 806: SDIV_I	sdiv 	%r9, 0x0001, %r2
	mov 0x32, %r30
	.word 0x9bd0001e  ! 807: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d90269e  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x069e, %pstate
	.word 0x8dd02032  ! 809: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x9851c001  ! 810: UMUL_R	umul 	%r7, %r1, %r12
	.word 0x87802004  ! 811: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d90200a  ! 812: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	.word 0x8d90204b  ! 813: WRPR_PSTATE_I	wrpr	%r0, 0x004b, %pstate
DS_48:
	.word 0x20800001  ! 815: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87b1030a  ! 814: ALLIGNADDRESS	alignaddr	%r4, %r10, %r3
	.word 0x8d802000  ! 815: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 816: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x35, %r30
	.word 0x83d0001e  ! 817: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8b68e001  ! 818: SDIVX_I	sdivx	%r3, 0x0001, %r5
	.word 0x9da0054b  ! 819: FSQRTd	fsqrt	
	.word 0x87802045  ! 820: WRASI_I	wr	%r0, 0x0045, %asi
DS_49:
	.word 0x32800001  ! 822: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b0430f  ! 821: ALLIGNADDRESS	alignaddr	%r1, %r15, %r3
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902653  ! 823: WRPR_PSTATE_I	wrpr	%r0, 0x0653, %pstate
	.word 0xc697e030  ! 824: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	.word 0x83d02035  ! 825: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x98d1e001  ! 826: UMULcc_I	umulcc 	%r7, 0x0001, %r12
	.word 0x8d51c000  ! 827: RDPR_TL	rdpr	%tl, %r6
	.word 0x38700001  ! 828: BPGU	<illegal instruction>
	.word 0x34800001  ! 829: BG	bg,a	<label_0x1>
	.word 0x92d98007  ! 830: SMULcc_R	smulcc 	%r6, %r7, %r9
	.word 0x91a000c5  ! 831: FNEGd	fnegd	%f36, %f8
DS_50:
	.word 0x34800001  ! 833: BG	bg,a	<label_0x1>
	.word 0xc932400c  ! 833: STQF_R	-	%f4, [%r12, %r9]
	.word 0x93458000  ! 832: RD_SOFTINT_REG	rd	%softint, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802004  ! 834: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x97d02034  ! 835: Tcc_I	tge	icc_or_xcc, %r0 + 52
DS_51:
	.word 0x34800001  ! 837: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b2c303  ! 836: ALLIGNADDRESS	alignaddr	%r11, %r3, %r3
	.word 0xc737c003  ! 837: STQF_R	-	%f3, [%r3, %r31]
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x95d02032  ! 839: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x2e700001  ! 840: BPVS	<illegal instruction>
	.word 0x8d902ed2  ! 841: WRPR_PSTATE_I	wrpr	%r0, 0x0ed2, %pstate
	.word 0x87d02035  ! 842: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0xc797e001  ! 843: LDQFA_I	-	[%r31, 0x0001], %f3
	mov 0x30, %r30
	.word 0x9fd0001e  ! 844: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9e52c00f  ! 845: UMUL_R	umul 	%r11, %r15, %r15
	.word 0x8fa000ca  ! 846: FNEGd	fnegd	%f10, %f38
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x85a00543  ! 848: FSQRTd	fsqrt	
	.word 0x8d802000  ! 849: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc49004a0  ! 850: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x2e800001  ! 851: BVS	bvs,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902485  ! 853: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0x8ad0e001  ! 854: UMULcc_I	umulcc 	%r3, 0x0001, %r5
	.word 0x87d02032  ! 855: Tcc_I	tl	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ba28d28  ! 857: FsMULd	fsmuld	%f10, %f8, %f36
	.word 0x8d50c000  ! 858: RDPR_TT	rdpr	%tt, %r6
	.word 0x2e700001  ! 859: BPVS	<illegal instruction>
	.word 0x87802004  ! 860: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x996a6001  ! 861: SDIVX_I	sdivx	%r9, 0x0001, %r12
	.word 0xd8c7e010  ! 862: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0xd88004a0  ! 863: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r12
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd8d7e000  ! 865: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x99a000c3  ! 866: FNEGd	fnegd	%f34, %f12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8c7a2001  ! 868: SDIV_I	sdiv 	%r8, 0x0001, %r6
	.word 0x87802004  ! 869: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x946be001  ! 870: UDIVX_I	udivx 	%r15, 0x0001, %r10
	.word 0xd447e001  ! 871: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x87504000  ! 872: RDPR_TNPC	rdpr	%tnpc, %r3
DS_52:
	.word 0x34800001  ! 874: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b0830e  ! 873: ALLIGNADDRESS	alignaddr	%r2, %r14, %r12
	.word 0x87802014  ! 874: WRASI_I	wr	%r0, 0x0014, %asi
DS_53:
	.word 0x20800001  ! 876: BN	bn,a	<label_0x1>
	.word 0xc133400f  ! 876: STQF_R	-	%f0, [%r15, %r13]
	.word 0x83458000  ! 875: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x83a0056d  ! 876: FSQRTq	fsqrt	
	.word 0x8d902a03  ! 877: WRPR_PSTATE_I	wrpr	%r0, 0x0a03, %pstate
	.word 0x9ad18007  ! 878: UMULcc_R	umulcc 	%r6, %r7, %r13
	.word 0x8fd02034  ! 879: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x9e81000a  ! 880: ADDcc_R	addcc 	%r4, %r10, %r15
	.word 0x9da0056b  ! 881: FSQRTq	fsqrt	
	.word 0xdd27c00b  ! 882: STF_R	st	%f14, [%r11, %r31]
DS_54:
	.word 0x34800001  ! 884: BG	bg,a	<label_0x1>
	.word 0xdd302001  ! 884: STQF_I	-	%f14, [0x0001, %r0]
	.word 0x95458000  ! 883: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x38700001  ! 884: BPGU	<illegal instruction>
	.word 0x8150c000  ! 885: RDPR_TT	rdpr	%tt, %r0
	.word 0xc0bfc02b  ! 886: STDA_R	stda	%r0, [%r31 + %r11] 0x01
	.word 0x9fa149a2  ! 887: FDIVs	fdivs	%f5, %f2, %f15
	.word 0x97696001  ! 888: SDIVX_I	sdivx	%r5, 0x0001, %r11
	.word 0x8d90281a  ! 889: WRPR_PSTATE_I	wrpr	%r0, 0x081a, %pstate
	.word 0x9d494000  ! 890: RDHPR_HTBA	rdhpr	%htba, %r14
	.word 0x864be001  ! 891: MULX_I	mulx 	%r15, 0x0001, %r3
	.word 0x87802010  ! 892: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d90264a  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x064a, %pstate
	.word 0x38700001  ! 894: BPGU	<illegal instruction>
	.word 0xc61fe001  ! 895: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0xc6d804a0  ! 896: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x87d02035  ! 897: Tcc_I	tl	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8bb28fe8  ! 899: FONES	fones	%f5
	.word 0x8d802000  ! 900: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcabfe001  ! 901: STDA_I	stda	%r5, [%r31 + 0x0001] %asi
DS_55:
	.word 0x32800001  ! 903: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b1430b  ! 902: ALLIGNADDRESS	alignaddr	%r5, %r11, %r9
	.word 0x95a109ed  ! 903: FDIVq	dis not found

	.word 0xd447e001  ! 904: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x8d902adf  ! 905: WRPR_PSTATE_I	wrpr	%r0, 0x0adf, %pstate
	.word 0x9f504000  ! 906: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0xded004a0  ! 907: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	.word 0xde1fc000  ! 908: LDD_R	ldd	[%r31 + %r0], %r15
	.word 0x9ba000c2  ! 909: FNEGd	fnegd	%f2, %f44
	.word 0x94c2a001  ! 910: ADDCcc_I	addccc 	%r10, 0x0001, %r10
	.word 0x9200a001  ! 911: ADD_I	add 	%r2, 0x0001, %r9
	.word 0xd27fe001  ! 912: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0x8a510005  ! 913: UMUL_R	umul 	%r4, %r5, %r5
	.word 0x87802014  ! 914: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x30, %r30
	.word 0x99d0001e  ! 915: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8da209ed  ! 916: FDIVq	dis not found

	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e80  ! 918: WRPR_PSTATE_I	wrpr	%r0, 0x0e80, %pstate
	.word 0x95508000  ! 919: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x8d802000  ! 920: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 921: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4c7e010  ! 922: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	ta	T_CHANGE_PRIV	! macro
DS_56:
	.word 0x22800001  ! 925: BE	be,a	<label_0x1>
	.word 0xc332a001  ! 925: STQF_I	-	%f1, [0x0001, %r10]
	.word 0x89458000  ! 924: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc8cfe010  ! 925: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0x8d902cc0  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x0cc0, %pstate
	.word 0x8d802004  ! 927: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc927c00d  ! 928: STF_R	st	%f4, [%r13, %r31]
	.word 0xc88804a0  ! 929: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902cdd  ! 931: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0x30700001  ! 932: BPA	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8c7e000  ! 934: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	.word 0x83a00565  ! 935: FSQRTq	fsqrt	
	.word 0x9fd02034  ! 936: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x906bc005  ! 937: UDIVX_R	udivx 	%r15, %r5, %r8
	.word 0x8bd02035  ! 938: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902ac7  ! 940: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
	.word 0x896ac007  ! 941: SDIVX_R	sdivx	%r11, %r7, %r4
DS_57:
	.word 0x22800001  ! 943: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb0830d  ! 942: ALLIGNADDRESS	alignaddr	%r2, %r13, %r15
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xdf37e001  ! 944: STQF_I	-	%f15, [0x0001, %r31]
	.word 0x9da30d2a  ! 945: FsMULd	fsmuld	%f12, %f10, %f14
	.word 0x20800001  ! 946: BN	bn,a	<label_0x1>
	.word 0x8951c000  ! 947: RDPR_TL	rdpr	%tl, %r4
	.word 0x87a000cd  ! 948: FNEGd	fnegd	%f44, %f34
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802010  ! 950: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d90204a  ! 951: WRPR_PSTATE_I	wrpr	%r0, 0x004a, %pstate
DS_58:
	.word 0x34800001  ! 953: BG	bg,a	<label_0x1>
	.word 0xc5328009  ! 953: STQF_R	-	%f2, [%r9, %r10]
	.word 0x9d458000  ! 952: RD_SOFTINT_REG	rd	%softint, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902005  ! 954: WRPR_PSTATE_I	wrpr	%r0, 0x0005, %pstate
	.word 0xdd27e001  ! 955: STF_I	st	%f14, [0x0001, %r31]
	.word 0xdc4fc000  ! 956: LDSB_R	ldsb	[%r31 + %r0], %r14
	.word 0xdc1fc000  ! 957: LDD_R	ldd	[%r31 + %r0], %r14
	.word 0xdcd7e020  ! 958: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r14
	.word 0x87a28dcd  ! 959: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc68804a0  ! 961: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc6d7e020  ! 963: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0xc6c7e000  ! 964: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0x8d9026ca  ! 965: WRPR_PSTATE_I	wrpr	%r0, 0x06ca, %pstate
	.word 0x83a0054a  ! 966: FSQRTd	fsqrt	
	.word 0x9da3cdc5  ! 967: FdMULq	fdmulq	
	.word 0x8d902e06  ! 968: WRPR_PSTATE_I	wrpr	%r0, 0x0e06, %pstate
	.word 0xdc8804a0  ! 969: LDUBA_R	lduba	[%r0, %r0] 0x25, %r14
	.word 0x24700001  ! 970: BPLE	<illegal instruction>
	.word 0x896be001  ! 971: SDIVX_I	sdivx	%r15, 0x0001, %r4
	.word 0x8d902e54  ! 972: WRPR_PSTATE_I	wrpr	%r0, 0x0e54, %pstate
	.word 0x81480000  ! 973: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x97480000  ! 974: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd6ffc025  ! 975: SWAPA_R	swapa	%r11, [%r31 + %r5] 0x01
	.word 0x90492001  ! 976: MULX_I	mulx 	%r4, 0x0001, %r8
	.word 0xd0cfe010  ! 977: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	.word 0x9b51c000  ! 978: RDPR_TL	rdpr	%tl, %r13
	mov 0x31, %r30
	.word 0x9dd0001e  ! 979: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xda9fe001  ! 980: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0x8881800f  ! 981: ADDcc_R	addcc 	%r6, %r15, %r4
	.word 0x38800001  ! 982: BGU	bgu,a	<label_0x1>
	.word 0x8d902a0e  ! 983: WRPR_PSTATE_I	wrpr	%r0, 0x0a0e, %pstate
DS_59:
	.word 0x34800001  ! 985: BG	bg,a	<label_0x1>
	.word 0xcb324003  ! 985: STQF_R	-	%f5, [%r3, %r9]
	.word 0x87458000  ! 984: RD_SOFTINT_REG	rd	%softint, %r3
	mov 0x31, %r30
	.word 0x95d0001e  ! 985: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc67fe001  ! 986: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x9f500000  ! 987: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x96db800b  ! 988: SMULcc_R	smulcc 	%r14, %r11, %r11
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x32, %r30
	.word 0x9dd0001e  ! 990: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3a700001  ! 992: BPCC	<illegal instruction>
	.word 0x8d90208b  ! 993: WRPR_PSTATE_I	wrpr	%r0, 0x008b, %pstate
DS_60:
	.word 0x34800001  ! 995: BG	bg,a	<label_0x1>
	.word 0xd1306001  ! 995: STQF_I	-	%f8, [0x0001, %r1]
	.word 0x8d458000  ! 994: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x9650c004  ! 995: UMUL_R	umul 	%r3, %r4, %r11
	.word 0x87802016  ! 996: WRASI_I	wr	%r0, 0x0016, %asi
DS_61:
	.word 0x22800001  ! 998: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b1830c  ! 997: ALLIGNADDRESS	alignaddr	%r6, %r12, %r3
	.word 0x30800001  ! 998: BA	ba,a	<label_0x1>


.data
user_data_start:
	.xword	0x0bca49739dc92f50
	.xword	0x0d0a933fab3bff62
	.xword	0x7458aae94dba45c3
	.xword	0x93a35a333e51cb7c
	.xword	0xe8c6b5b8691c8de0
	.xword	0xdfc2d6a3020a4ab0
	.xword	0x68c51a5d9d74dc7c
	.xword	0x98fac56b1e81e35d
	.xword	0x559bf41efc91548a
	.xword	0x3231e903894c21d8
	.xword	0xb7803e7118feb865
	.xword	0x0ae0b8061cb9ee1a
	.xword	0xb86bb4f2e141412a
	.xword	0x33f52e4cdae891ee
	.xword	0x37448b696bbd54f5
	.xword	0xcf6aa10c8bf7c08f
	.xword	0x5c1dcc297b4470d3
	.xword	0x200c65c0dc88772d
	.xword	0x29f1ed9505b449ed
	.xword	0x42cd3dc125de6d63
	.xword	0xa4b32a360899cf44
	.xword	0x55732179b251595e
	.xword	0x22959c3f383d4045
	.xword	0x964fd0e311fb7859
	.xword	0xf28ce5ee2db99ab1
	.xword	0x8c3cf45c881240e2
	.xword	0x9bf36b1edd313dea
	.xword	0x836a0fdd2d07a711
	.xword	0x4ccefaabd015bc55
	.xword	0xcb8811d5473f0326
	.xword	0x9e9bf6d9e074017a
	.xword	0x87214fbd47a6662a
	.xword	0xab4debdc5a0b468c
	.xword	0xf3bf12a6d7a67cfa
	.xword	0x8f4e54b02e6e0739
	.xword	0x3933c44372d6bda7
	.xword	0x9f13c4ccaa33b590
	.xword	0xc3235f2a9f533b8e
	.xword	0x0bbafad7b2ad65c8
	.xword	0x1a397a74d4de41cb
	.xword	0x99842e1fda0e6a49
	.xword	0xdc5caad305e729a4
	.xword	0x1977d1b487edbf76
	.xword	0xd2ab99714aeb2208
	.xword	0x9fff77d1f1a53a07
	.xword	0x46e0d6a2b084b7c8
	.xword	0x77746263e72503c4
	.xword	0xfa47e0beb1049493
	.xword	0x774c98b8765e95ff
	.xword	0xeefe67a8dc6a8e6a
	.xword	0x083efb2d0f92ec74
	.xword	0x812589c5c9d674dd
	.xword	0xe882a7a8ebfdefd4
	.xword	0x4c76c318a526c827
	.xword	0xdfc2405bf884d70f
	.xword	0xf2c12625723d83a3
	.xword	0xfde80bd846800bb2
	.xword	0x7f9987d3f7ffe060
	.xword	0xa32e2a45ce58864e
	.xword	0x502db43855174b3d
	.xword	0xc70c12384082f480
	.xword	0x79fb7f9d4e1c9462
	.xword	0x2d361f5ab76e1184
	.xword	0xacad5865a8026d8c
	.xword	0x9b04130599530f68
	.xword	0x8ed4803a9615a27f
	.xword	0xb3096e89aad27af5
	.xword	0x98a3a40ad24cb491
	.xword	0x1f5ab69291ed2c95
	.xword	0x83e8063b78951921
	.xword	0x28bfc6ed05bcca4c
	.xword	0x2c6ebc5bb8feb213
	.xword	0x5494d2b2653266a0
	.xword	0x51d4d2ccdd076322
	.xword	0x95cd729102ba6525
	.xword	0x12411a6d770436eb
	.xword	0xad5c95f3b96cf8b9
	.xword	0x9add41e435a350c0
	.xword	0x82a43f63de8a79bf
	.xword	0x24bb3dee4587e1b8
	.xword	0x9dd1b8e63d07df13
	.xword	0x96a60e5e4bdaa660
	.xword	0x6a157947163ad7fe
	.xword	0x9cc91c75acc753e1
	.xword	0xd041dbe2bda134a4
	.xword	0x8c3dbc12bda6adaa
	.xword	0x90d3b3a11aae50a6
	.xword	0x78871857c8f618a7
	.xword	0xd1891b0f752e96d8
	.xword	0x50b06dfacb751bd4
	.xword	0x4bb47d2e1d5b167a
	.xword	0x9d3b1b97c94ee426
	.xword	0xbac676d2995db7f7
	.xword	0x80a84ac79ef82363
	.xword	0xfefa3776d0fd8baf
	.xword	0x9d81f21e49a13ba6
	.xword	0x4e777609b79b842a
	.xword	0x049596c34ba36e8a
	.xword	0x54b2a97d757f530b
	.xword	0x34774bf808bd0475
	.xword	0x6233fc6903685123
	.xword	0x0adba14096175e8a
	.xword	0xa2639c0150768995
	.xword	0xc5c1a93edd2617bb
	.xword	0xbffbf83c0752b64c
	.xword	0x2fff8726db6bd115
	.xword	0x62f4db74f463d7a5
	.xword	0x2a5878b554b89c20
	.xword	0x105724a6498f28d0
	.xword	0xbcc8093af2f17995
	.xword	0x8c20b51fb09b082a
	.xword	0x30d0ba8d22d27099
	.xword	0xeaa4a3133b3926be
	.xword	0x5f0ef5dcaf612ff8
	.xword	0x4e0910c3b254a95e
	.xword	0x5ea3b8134a9cd588
	.xword	0x48a85db75c50f760
	.xword	0xd03d7434dd4a560e
	.xword	0xc3c17c77ab0c169b
	.xword	0x2f4fade5d97ba8ac
	.xword	0xa158d66c1ce1f153
	.xword	0xfce990b75db87f1f
	.xword	0x5976c593150364cf
	.xword	0x78475cabfb442b64
	.xword	0x32d99335de9e89c2
	.xword	0x52af46824b470356
	.xword	0xecf8be0f51d19750
	.xword	0xc88169e47c3ca987
	.xword	0x4b230ade581b11f1
	.xword	0xd7451aed709c15b7
	.xword	0xf8f685d2768335a8
	.xword	0x71b77b30f66b7cb6
	.xword	0xcaa5d2aa068d5bbc
	.xword	0xfe4fddaa8c3d0fe4
	.xword	0xb0ac48d48ec7d1ea
	.xword	0xb28ae4c513bb38db
	.xword	0x5a52ded9c6b3d217
	.xword	0xf2ae9906ddcdbfa4
	.xword	0x8c3314b6114523aa
	.xword	0x12726287affc2141
	.xword	0x8ee3223a3570f506
	.xword	0xc6ae7b17c2a9d561
	.xword	0xe81464da9c5af597
	.xword	0xb52572ff0c5ea1a4
	.xword	0xa97ee640b9945dc5
	.xword	0x8a248bcbe222d979
	.xword	0x54836c2d2bfd1bc6
	.xword	0xed6483b57ccdc560
	.xword	0xb6299fa512ab646d
	.xword	0xfd824d73406634ac
	.xword	0x3a35497531b02b8f
	.xword	0x5f865281d7cadbfe
	.xword	0x0a41127fc7f7b2fb
	.xword	0x8bbac66c456b0210
	.xword	0xc5fd39a3b1d6cd76
	.xword	0xa5c789504fae16fa
	.xword	0xb19a2bd25515678a
	.xword	0x11e8a10705f78e7b
	.xword	0x7e47f58192823ecf
	.xword	0x873da51d70ea5ecd
	.xword	0xd30e1306dc92ca77
	.xword	0xad391264acd03bc4
	.xword	0xb532caeefd454c92
	.xword	0x5d5c89ccfe4b863b
	.xword	0x0803222fc6759e36
	.xword	0xf39d668c161a0133
	.xword	0x3e93937012e7dad0
	.xword	0xda15d6d84f6d9736
	.xword	0xbf5ef17bdc91aeac
	.xword	0xaa26a1155cba8e04
	.xword	0xdd2e75f777f27259
	.xword	0x680e9753d3f952a9
	.xword	0x750995fa70379c48
	.xword	0x1fd18aa98855cdf5
	.xword	0xcd412d37431659e4
	.xword	0xe6db09c76780e138
	.xword	0x55336527d6bc0331
	.xword	0x70aec0a97a66089c
	.xword	0x3a525c1311553140
	.xword	0x7f5170dd8346e040
	.xword	0xefde9c1181433f73
	.xword	0xcc677ebee773c555
	.xword	0xbd5b829270f813da
	.xword	0x41fcb73f84c145d6
	.xword	0x30624116d3803d6d
	.xword	0x561892fc180679b9
	.xword	0xf7feba5a8df3a2a3
	.xword	0x9fdf1d31512e67bd
	.xword	0x8decccfffc71ad08
	.xword	0x43aab693b0be8c25
	.xword	0x76403a18eea0f123
	.xword	0xb58e924b9badd246
	.xword	0xd7bdd6fadac53878
	.xword	0x6a04bf8969d43a68
	.xword	0x92f2fcd91ea53cde
	.xword	0x469d1552a2f8b0a4
	.xword	0xbc36c1d33b34873f
	.xword	0x1d86d7779aae2123
	.xword	0x8cdbd43f967ffc01
	.xword	0x823a1b9807427b5c
	.xword	0x83f7361aedb31354
	.xword	0x2dd16e02ba71ea22
	.xword	0x3126851a0c639ac2
	.xword	0xf3656dc8f17a2384
	.xword	0x2b05aa76b5742fbb
	.xword	0xe2d4cfff00704b7b
	.xword	0xd1050df1a3948e1b
	.xword	0xf566cc981a30d557
	.xword	0x51d5d3b01894d5d8
	.xword	0x16b7f6679a6d94a0
	.xword	0x86fd10054dd87719
	.xword	0x4521a86b1d1de5fb
	.xword	0x90956cfcded67cbc
	.xword	0xe51a8afcb047c7da
	.xword	0x39b7e764e3634af8
	.xword	0xba471faca9cb9010
	.xword	0x5e53b98f2214ad8f
	.xword	0x7cfe8ef84a9687ed
	.xword	0x6903aefb70706b57
	.xword	0x3350d0ebe04dfc03
	.xword	0x4719ad3071824ab1
	.xword	0xce883157e983d202
	.xword	0x876a9fb0c3d1cb48
	.xword	0x2c813797082011be
	.xword	0xc1cda178e3cfba5c
	.xword	0x8d3436fabd57c6a3
	.xword	0x79cd7d30c212b872
	.xword	0xc8a2743a1a5b6bfd
	.xword	0x5d4efeaf03cf5104
	.xword	0xd54706d0267dd26e
	.xword	0x75c67805daddb33a
	.xword	0x2a2038bc52679cfd
	.xword	0x6c0ddc6a9785be33
	.xword	0xd4acdb9a7e8eb68a
	.xword	0xd543270aea622ccd
	.xword	0x6a8d526c33ab6328
	.xword	0x030522b62972e9d7
	.xword	0x15710963e5b59fa6
	.xword	0x12fb99295623f882
	.xword	0xf3148e439f234147
	.xword	0x8052eb35f2c278e9
	.xword	0x76f847c5536a6420
	.xword	0xb607bc16760ed73b
	.xword	0xab2471f03305be8b
	.xword	0xf6fe051feb3aba6d
	.xword	0xddb7ee7378d62df8
	.xword	0x3ee5e30baca58ae2
	.xword	0xc7e53fac2177d22e
	.xword	0xa4da0fa5d876f173
	.xword	0xb1eaacc7d0dc50ac
	.xword	0x1d065161659e58fe
	.xword	0x3e2454a33e199a36
	.xword	0x42cfd6b4d452e863
	.xword	0x1152c196b201385f
	.xword	0xbe8dfaa08f3dd42f
	.xword	0xe19e385fcadc16ed


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Mon Apr  5 10:02:09 2004
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
!!#     IJ_bind_thread_group("diag.j", 28, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 31, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!#     IJ_set_ropr_fld("diag.j", 37, ijdefault, Ft_Rs1, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 38, ijdefault, Ft_Rs2, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 39, ijdefault, Ft_Rd, "5'b0rrrr");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 42, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 45, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 46, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x45, 0x54, 0x80, 0x88, }");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 49, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 50, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 52, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 55, Ro_nontrap_ld, Fm_align_Simm13, "{0x0, 0x7}");
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 71, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 72, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 73, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 80, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 81, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 84,"{10}");
!!#     IJ_set_rvar("diag.j", 85, wt_high, "{60}");
!!#     IJ_set_rvar("diag.j", 86, wt_med,  "{30}");
!!#     IJ_set_rvar("diag.j", 87, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 91, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<3; k++) {
!!#         for (i = 0; i < 31; i++) {
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 95, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 97, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 100, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 103, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 106, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
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
!!#     IJ_printf  ("diag.j", 112, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 114, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 537, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_low
!!#         |  trap_asi     %rvar  wt_low
!!#         |  tcc          %rvar  wt_med
!!#         | ldst_excp     %rvar  wt_low
!!#         | ldstasi_excp  %rvar  wt_low
!!#         | change_mode   %rvar  wt_med
!!#         | alu           %rvar  wt_high
!!#         | branches      %rvar  wt_med
!!#         | wrasi         %rvar  wt_low
!!#         | splash_fprs   %rvar  wt_low
!!#         | splash_pstate %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!# ;
!!# 
!!# change_mode :   
!!#       tCHANGE_NONPRIV 
!!#     | tCHANGE_PRIV 
!!#     | tCHANGE_NONHPRIV
!!#     | tCHANGE_HPRIV 
!!#     | tCHANGE_TO_TL1 
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
!!# trap_asi : 
!!#     asi_load_r %ropr  Ro_traps_asi
!!# ;
!!# 
!!# wrasi : tWRASI_I %ropr  Ro_wrasi_i
!!# ;
!!# reg_tcc : tTcc_R %ropr  Ro_traps_r
!!#      { 
!!#      IJ_printf("diag.j", 592, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!# asi_load_i: tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDUWA_I
!!#             | tLDXA_I
!!# ;
!!# 
!!# asi_load_r:tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDUWA_R
!!#             | tLDXA_R 
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
!!#      tFSQRTq | tFSQRTd | tFsMULd | tFdMULq | tFqTOi | tFNEGd | tFONES
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
!!#         IJ_printf("diag.j", 675, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 676,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 677,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#     } | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 680, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 681,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_printf("diag.j", 682, th0, "\tilltrap\n");
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
