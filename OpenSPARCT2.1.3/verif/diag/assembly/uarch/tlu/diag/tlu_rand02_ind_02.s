/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand02_ind_02.s
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
	.word 0x9a82e001  ! 1: ADDcc_I	addcc 	%r11, 0x0001, %r13
	.word 0x87802054  ! 2: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x8d802000  ! 3: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x90d3e001  ! 4: UMULcc_I	umulcc 	%r15, 0x0001, %r8
	.word 0xd08004a0  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r8
	.word 0xd047e001  ! 6: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 9: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x966bc00a  ! 11: UDIVX_R	udivx 	%r15, %r10, %r11
DS_0:
	.word 0x32800001  ! 13: BNE	bne,a	<label_0x1>
	.word 0xcf33e001  ! 13: STQF_I	-	%f7, [0x0001, %r15]
	.word 0x91458000  ! 12: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd097e030  ! 13: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd08fe020  ! 15: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	mov 0x35, %r30
	.word 0x95d0001e  ! 16: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8ac1a001  ! 17: ADDCcc_I	addccc 	%r6, 0x0001, %r5
	.word 0xca7fe001  ! 18: SWAP_I	swap	%r5, [%r31 + 0x0001]
DS_1:
	.word 0x20800001  ! 20: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b28307  ! 19: ALLIGNADDRESS	alignaddr	%r10, %r7, %r9
	.word 0xd217e001  ! 20: LDUH_I	lduh	[%r31 + 0x0001], %r9
	.word 0x87802088  ! 21: WRASI_I	wr	%r0, 0x0088, %asi
	mov 0x30, %r30
	.word 0x95d0001e  ! 22: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd28004a0  ! 23: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r9
	.word 0xd317c000  ! 24: LDQF_R	-	[%r31, %r0], %f9
	.word 0x38800001  ! 25: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x36700001  ! 27: BPGE	<illegal instruction>
	.word 0x24700001  ! 28: BPLE	<illegal instruction>
	mov 0x30, %r30
	.word 0x81d0001e  ! 29: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x81d0001e  ! 30: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x9bd0001e  ! 31: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 32: BLE	ble,a	<label_0x1>
DS_2:
	.word 0x32800001  ! 34: BNE	bne,a	<label_0x1>
	.word 0xc330a001  ! 34: STQF_I	-	%f1, [0x0001, %r2]
	.word 0x99458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r12
	mov 0x35, %r30
	.word 0x9fd0001e  ! 34: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9a800000  ! 35: ADDcc_R	addcc 	%r0, %r0, %r13
	.word 0x9bd02032  ! 36: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x8d9028c5  ! 37: WRPR_PSTATE_I	wrpr	%r0, 0x08c5, %pstate
	.word 0x8d902a88  ! 38: WRPR_PSTATE_I	wrpr	%r0, 0x0a88, %pstate
	.word 0x9e504002  ! 39: UMUL_R	umul 	%r1, %r2, %r15
	mov 0x32, %r30
	.word 0x85d0001e  ! 40: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d90204a  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x004a, %pstate
	.word 0x91d02031  ! 42: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8e492001  ! 43: MULX_I	mulx 	%r4, 0x0001, %r7
	.word 0x83a08d28  ! 44: FsMULd	fsmuld	%f2, %f8, %f32
	.word 0x90db8007  ! 45: SMULcc_R	smulcc 	%r14, %r7, %r8
	.word 0x81a00542  ! 46: FSQRTd	fsqrt	
DS_3:
	.word 0x32800001  ! 48: BNE	bne,a	<label_0x1>
	.word 0xd933a001  ! 48: STQF_I	-	%f12, [0x0001, %r14]
	.word 0x93458000  ! 47: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x85d02032  ! 48: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0xd247c000  ! 49: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902607  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x0607, %pstate
	.word 0x9ba149e9  ! 52: FDIVq	dis not found

DS_4:
	.word 0x32800001  ! 54: BNE	bne,a	<label_0x1>
	.word 0xcf31a001  ! 54: STQF_I	-	%f7, [0x0001, %r6]
	.word 0x91458000  ! 53: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d902cc3  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x0cc3, %pstate
DS_5:
	.word 0x34800001  ! 56: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b1430d  ! 55: ALLIGNADDRESS	alignaddr	%r5, %r13, %r10
DS_6:
	.word 0x22800001  ! 57: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb0430a  ! 56: ALLIGNADDRESS	alignaddr	%r1, %r10, %r13
	.word 0x87802004  ! 57: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9dd02032  ! 58: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x30800001  ! 59: BA	ba,a	<label_0x1>
	.word 0x91686001  ! 60: SDIVX_I	sdivx	%r1, 0x0001, %r8
	.word 0xd0c7e000  ! 61: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	.word 0xd0d004a0  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd08804a0  ! 63: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0xd097e010  ! 64: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0x90db8005  ! 65: SMULcc_R	smulcc 	%r14, %r5, %r8
	.word 0xd0cfe020  ! 66: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
	.word 0x8cd2a001  ! 67: UMULcc_I	umulcc 	%r10, 0x0001, %r6
	.word 0x8d802000  ! 68: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0xccdfe030  ! 70: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	.word 0x97d02032  ! 71: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x9bd02031  ! 72: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
DS_7:
	.word 0x34800001  ! 75: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db08301  ! 74: ALLIGNADDRESS	alignaddr	%r2, %r1, %r14
	.word 0x81b28fe2  ! 75: FONES	fones	%f0
	.word 0x9e68c00e  ! 76: UDIVX_R	udivx 	%r3, %r14, %r15
	.word 0x87802014  ! 77: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xded00e60  ! 78: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r15
	.word 0x8d802000  ! 79: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_8:
	.word 0x22800001  ! 81: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b14308  ! 80: ALLIGNADDRESS	alignaddr	%r5, %r8, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ba000c3  ! 82: FNEGd	fnegd	%f34, %f36
	.word 0xca9fc020  ! 83: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0xcaffc023  ! 84: SWAPA_R	swapa	%r5, [%r31 + %r3] 0x01
	.word 0x9f508000  ! 85: RDPR_TSTATE	rdpr	%tstate, %r15
	ta	T_CHANGE_NONHPRIV	! macro
DS_9:
	.word 0x34800001  ! 88: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db00304  ! 87: ALLIGNADDRESS	alignaddr	%r0, %r4, %r14
	.word 0xdc9fe001  ! 88: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r14
	.word 0x8bd02030  ! 89: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x97d0001e  ! 91: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 92: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9020cd  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x00cd, %pstate
	.word 0xdc8004a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r14
	.word 0x87802004  ! 95: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x85d02033  ! 96: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x85d02034  ! 97: Tcc_I	tle	icc_or_xcc, %r0 + 52
DS_10:
	.word 0x32800001  ! 99: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x91b3c300  ! 98: ALLIGNADDRESS	alignaddr	%r15, %r0, %r8
	.word 0x87802004  ! 99: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x92026001  ! 100: ADD_I	add 	%r9, 0x0001, %r9
	.word 0xd21fe001  ! 101: LDD_I	ldd	[%r31 + 0x0001], %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9d50c000  ! 103: RDPR_TT	rdpr	%tt, %r14
	mov 0x30, %r30
	.word 0x89d0001e  ! 104: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9ba28d24  ! 105: FsMULd	fsmuld	%f10, %f4, %f44
	.word 0xdaffc024  ! 106: SWAPA_R	swapa	%r13, [%r31 + %r4] 0x01
	.word 0x8d802004  ! 107: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xda8804a0  ! 108: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	mov 0x35, %r30
	.word 0x81d0001e  ! 109: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xdaffc024  ! 110: SWAPA_R	swapa	%r13, [%r31 + %r4] 0x01
	.word 0xda3fc004  ! 111: STD_R	std	%r13, [%r31 + %r4]
	mov 0x31, %r30
	.word 0x9fd0001e  ! 112: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 113: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 114: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87a389a1  ! 115: FDIVs	fdivs	%f14, %f1, %f3
	.word 0x8c814008  ! 116: ADDcc_R	addcc 	%r5, %r8, %r6
	.word 0xcc9fc020  ! 117: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802016  ! 119: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x96d06001  ! 120: UMULcc_I	umulcc 	%r1, 0x0001, %r11
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902c1c  ! 122: WRPR_PSTATE_I	wrpr	%r0, 0x0c1c, %pstate
	.word 0x94026001  ! 123: ADD_I	add 	%r9, 0x0001, %r10
	.word 0xd4d804a0  ! 124: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x86496001  ! 125: MULX_I	mulx 	%r5, 0x0001, %r3
	.word 0xc6c004a0  ! 126: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0x8d902e92  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x0e92, %pstate
	.word 0xc7e7c028  ! 128: CASA_I	casa	[%r31] 0x 1, %r8, %r3
	.word 0x81d02033  ! 129: Tcc_I	tn	icc_or_xcc, %r0 + 51
DS_11:
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
	.word 0xc932400f  ! 131: STQF_R	-	%f4, [%r15, %r9]
	.word 0x8f458000  ! 130: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d802000  ! 131: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802045  ! 132: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xcf17c000  ! 133: LDQF_R	-	[%r31, %r0], %f7
	.word 0x8ac22001  ! 134: ADDCcc_I	addccc 	%r8, 0x0001, %r5
	.word 0x8d902444  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x0444, %pstate
	.word 0xca7fe001  ! 136: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x20800001  ! 137: BN	bn,a	<label_0x1>
	.word 0x8d902019  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0019, %pstate
	.word 0x3e800001  ! 139: BVC	bvc,a	<label_0x1>
	.word 0xca3fe001  ! 140: STD_I	std	%r5, [%r31 + 0x0001]
	.word 0xcad804a0  ! 141: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802088  ! 143: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x36700001  ! 144: BPGE	<illegal instruction>
	.word 0x96d2c000  ! 145: UMULcc_R	umulcc 	%r11, %r0, %r11
	.word 0x8da01a67  ! 146: FqTOi	fqtoi	
	mov 0x30, %r30
	.word 0x93d0001e  ! 147: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x85a00569  ! 148: FSQRTq	fsqrt	
DS_12:
	.word 0x34800001  ! 150: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b1430b  ! 149: ALLIGNADDRESS	alignaddr	%r5, %r11, %r1
	.word 0xc2c004a0  ! 150: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0xc2dfe000  ! 151: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
	.word 0x9b514000  ! 152: RDPR_TBA	rdpr	%tba, %r13
	.word 0x966aa001  ! 153: UDIVX_I	udivx 	%r10, 0x0001, %r11
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a209ab  ! 156: FDIVs	fdivs	%f8, %f11, %f10
	.word 0x99d02030  ! 157: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x85a3cd23  ! 158: FsMULd	fsmuld	%f15, %f34, %f2
	.word 0x82804004  ! 159: ADDcc_R	addcc 	%r1, %r4, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902a41  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x0a41, %pstate
	.word 0x38800001  ! 162: BGU	bgu,a	<label_0x1>
DS_13:
	.word 0x32800001  ! 164: BNE	bne,a	<label_0x1>
	.word 0xc730e001  ! 164: STQF_I	-	%f3, [0x0001, %r3]
	.word 0x95458000  ! 163: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd407c000  ! 164: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0xd417c000  ! 165: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x9ad8800d  ! 166: SMULcc_R	smulcc 	%r2, %r13, %r13
	.word 0x8d902099  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0099, %pstate
	.word 0x89a14d2f  ! 168: FsMULd	fsmuld	%f5, %f46, %f4
	.word 0x38700001  ! 169: BPGU	<illegal instruction>
	.word 0xc88fe030  ! 170: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0x8d9028c7  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0x8bd02033  ! 172: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x8d90205a  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x31, %r30
	.word 0x8dd0001e  ! 176: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87a0056c  ! 177: FSQRTq	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902288  ! 179: WRPR_PSTATE_I	wrpr	%r0, 0x0288, %pstate
	.word 0xc61fc000  ! 180: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x38700001  ! 181: BPGU	<illegal instruction>
	.word 0x88682001  ! 182: UDIVX_I	udivx 	%r0, 0x0001, %r4
	.word 0x91d02034  ! 183: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x3c800001  ! 184: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93d02035  ! 186: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x9951c000  ! 187: RDPR_TL	rdpr	%tl, %r12
	.word 0x8d902a9f  ! 188: WRPR_PSTATE_I	wrpr	%r0, 0x0a9f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd84fe001  ! 190: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x8d90209d  ! 191: WRPR_PSTATE_I	wrpr	%r0, 0x009d, %pstate
	.word 0x36700001  ! 192: BPGE	<illegal instruction>
	.word 0x8d902214  ! 193: WRPR_PSTATE_I	wrpr	%r0, 0x0214, %pstate
	.word 0x9fa00560  ! 194: FSQRTq	fsqrt	
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87500000  ! 196: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8bd02031  ! 197: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xc6d7e020  ! 198: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0xc73fc000  ! 199: STDF_R	std	%f3, [%r0, %r31]
	.word 0x8db3cfe9  ! 200: FONES	fones	%f6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcd37c009  ! 202: STQF_R	-	%f6, [%r9, %r31]
	.word 0x8d9020cc  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0x8d902406  ! 204: WRPR_PSTATE_I	wrpr	%r0, 0x0406, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a00569  ! 206: FSQRTq	fsqrt	
	.word 0x9c518008  ! 207: UMUL_R	umul 	%r6, %r8, %r14
	.word 0xdcdfe020  ! 208: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0x87802004  ! 209: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802080  ! 210: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90205d  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
	.word 0x8c51000b  ! 213: UMUL_R	umul 	%r4, %r11, %r6
	.word 0xccd004a0  ! 214: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x8d902207  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x0207, %pstate
	.word 0x38700001  ! 216: BPGU	<illegal instruction>
	.word 0x8bd02033  ! 217: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x8ad24001  ! 218: UMULcc_R	umulcc 	%r9, %r1, %r5
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xcac004a0  ! 221: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	mov 0x33, %r30
	.word 0x87d0001e  ! 222: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802004  ! 224: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x30, %r30
	.word 0x8dd0001e  ! 225: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcac7e010  ! 227: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0xca4fc000  ! 228: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x9ba389ad  ! 229: FDIVs	fdivs	%f14, %f13, %f13
	.word 0x22700001  ! 230: BPE	<illegal instruction>
	.word 0x8d902ec2  ! 231: WRPR_PSTATE_I	wrpr	%r0, 0x0ec2, %pstate
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a08  ! 234: WRPR_PSTATE_I	wrpr	%r0, 0x0a08, %pstate
	mov 0x34, %r30
	.word 0x93d0001e  ! 235: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 236: Tcc_I	te	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0xdb37e001  ! 238: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8d902882  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x0882, %pstate
DS_14:
	.word 0x32800001  ! 241: BNE	bne,a	<label_0x1>
	.word 0xdd300001  ! 241: STQF_R	-	%f14, [%r1, %r0]
	.word 0x8f458000  ! 240: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x97a34dcd  ! 241: FdMULq	fdmulq	
	.word 0x8d902ecd  ! 242: WRPR_PSTATE_I	wrpr	%r0, 0x0ecd, %pstate
	mov 0x35, %r30
	.word 0x91d0001e  ! 243: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 244: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9848c00e  ! 245: MULX_R	mulx 	%r3, %r14, %r12
	.word 0x81d02034  ! 246: Tcc_I	tn	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x90798000  ! 249: SDIV_R	sdiv 	%r6, %r0, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87d02032  ! 251: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x81d02032  ! 252: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x8d90240c  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x040c, %pstate
	.word 0x96826001  ! 254: ADDcc_I	addcc 	%r9, 0x0001, %r11
	.word 0x8d902255  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x28700001  ! 256: BPLEU	<illegal instruction>
DS_15:
	.word 0x32800001  ! 258: BNE	bne,a	<label_0x1>
	.word 0xd330a001  ! 258: STQF_I	-	%f9, [0x0001, %r2]
	.word 0x8b458000  ! 257: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x38800001  ! 258: BGU	bgu,a	<label_0x1>
	mov 0x35, %r30
	.word 0x8bd0001e  ! 259: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 260: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x3e800001  ! 261: BVC	bvc,a	<label_0x1>
	.word 0x9b500000  ! 262: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xda8004a0  ! 263: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r13
	.word 0x8d902ade  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xda8004a0  ! 267: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r13
	.word 0x84486001  ! 268: MULX_I	mulx 	%r1, 0x0001, %r2
	mov 0x33, %r30
	.word 0x97d0001e  ! 269: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x89a089a1  ! 271: FDIVs	fdivs	%f2, %f1, %f4
	ta	T_CHANGE_PRIV	! macro
	mov 0x33, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e19  ! 274: WRPR_PSTATE_I	wrpr	%r0, 0x0e19, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc93fe001  ! 276: STDF_I	std	%f4, [0x0001, %r31]
	.word 0xc847c000  ! 277: LDSW_R	ldsw	[%r31 + %r0], %r4
	.word 0x8d902406  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x0406, %pstate
	.word 0x9e800005  ! 279: ADDcc_R	addcc 	%r0, %r5, %r15
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83a2cdca  ! 281: FdMULq	fdmulq	
	.word 0x8fd02034  ! 282: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x8d90221f  ! 283: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x87802010  ! 284: WRASI_I	wr	%r0, 0x0010, %asi
DS_16:
	.word 0x34800001  ! 286: BG	bg,a	<label_0x1>
	.word 0xdf33a001  ! 286: STQF_I	-	%f15, [0x0001, %r14]
	.word 0x9b458000  ! 285: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xdad7e010  ! 286: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0x8b51c000  ! 287: RDPR_TL	rdpr	%tl, %r5
	.word 0x8d90280d  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x080d, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcbe7c02a  ! 290: CASA_I	casa	[%r31] 0x 1, %r10, %r5
	.word 0x3e700001  ! 291: BPVC	<illegal instruction>
	.word 0x24700001  ! 292: BPLE	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x9c012001  ! 294: ADD_I	add 	%r4, 0x0001, %r14
	.word 0xdcd804a0  ! 295: LDXA_R	ldxa	[%r0, %r0] 0x25, %r14
	.word 0x8d902a08  ! 296: WRPR_PSTATE_I	wrpr	%r0, 0x0a08, %pstate
	.word 0x8cc12001  ! 297: ADDCcc_I	addccc 	%r4, 0x0001, %r6
	.word 0x8d902c53  ! 298: WRPR_PSTATE_I	wrpr	%r0, 0x0c53, %pstate
	.word 0x82d0c00a  ! 299: UMULcc_R	umulcc 	%r3, %r10, %r1
	.word 0x8bd02030  ! 300: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x90da400c  ! 301: SMULcc_R	smulcc 	%r9, %r12, %r8
	.word 0x9ba049ed  ! 302: FDIVq	dis not found

	.word 0x8adbc009  ! 303: SMULcc_R	smulcc 	%r15, %r9, %r5
	.word 0x95d02033  ! 304: Tcc_I	tg	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802000  ! 306: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8052400d  ! 307: UMUL_R	umul 	%r9, %r13, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9e6be001  ! 310: UDIVX_I	udivx 	%r15, 0x0001, %r15
	.word 0x8d902207  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x0207, %pstate
	.word 0x87802054  ! 312: WRASI_I	wr	%r0, 0x0054, %asi
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x33, %r30
	.word 0x9dd0001e  ! 314: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8a4a6001  ! 315: MULX_I	mulx 	%r9, 0x0001, %r5
	.word 0xca8fe030  ! 316: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x32, %r30
	.word 0x83d0001e  ! 318: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_17:
	.word 0x22800001  ! 320: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db10307  ! 319: ALLIGNADDRESS	alignaddr	%r4, %r7, %r6
	mov 0x34, %r30
	.word 0x8fd0001e  ! 320: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
DS_18:
	.word 0x22800001  ! 322: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db3c305  ! 321: ALLIGNADDRESS	alignaddr	%r15, %r5, %r14
	.word 0x81a00564  ! 322: FSQRTq	fsqrt	
	.word 0x8d902498  ! 323: WRPR_PSTATE_I	wrpr	%r0, 0x0498, %pstate
	.word 0xc017e001  ! 324: LDUH_I	lduh	[%r31 + 0x0001], %r0
	.word 0x3c800001  ! 325: BPOS	bpos,a	<label_0x1>
	mov 0x31, %r30
	.word 0x85d0001e  ! 326: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x38700001  ! 327: BPGU	<illegal instruction>
	.word 0x8da01a66  ! 328: FqTOi	fqtoi	
	.word 0x93b20fe1  ! 329: FONES	fones	%f9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd2d80e60  ! 331: LDXA_R	ldxa	[%r0, %r0] 0x73, %r9
	.word 0x83a000cb  ! 332: FNEGd	fnegd	%f42, %f32
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a000cb  ! 334: FNEGd	fnegd	%f42, %f42
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x90012001  ! 336: ADD_I	add 	%r4, 0x0001, %r8
	.word 0x93a01a69  ! 337: FqTOi	fqtoi	
	.word 0x8d902c91  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x0c91, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd3e7c029  ! 340: CASA_I	casa	[%r31] 0x 1, %r9, %r9
	.word 0x36800001  ! 341: BGE	bge,a	<label_0x1>
	.word 0x8d902e59  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x0e59, %pstate
	.word 0x907b6001  ! 343: SDIV_I	sdiv 	%r13, 0x0001, %r8
	.word 0x8d902e11  ! 344: WRPR_PSTATE_I	wrpr	%r0, 0x0e11, %pstate
	.word 0xd0d004a0  ! 345: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x8d9020d2  ! 346: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
	.word 0x8d902c96  ! 347: WRPR_PSTATE_I	wrpr	%r0, 0x0c96, %pstate
	.word 0x2e700001  ! 348: BPVS	<illegal instruction>
	.word 0x24700001  ! 349: BPLE	<illegal instruction>
	.word 0x8d902080  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0080, %pstate
	.word 0xd13fe001  ! 351: STDF_I	std	%f8, [0x0001, %r31]
	.word 0xd0c004a0  ! 352: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x83d0001e  ! 354: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8069c00a  ! 355: UDIVX_R	udivx 	%r7, %r10, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc05fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc1e7c02a  ! 358: CASA_I	casa	[%r31] 0x 1, %r10, %r0
	.word 0xc08004a0  ! 359: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r0
	.word 0x8fd02030  ! 360: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x81a389ca  ! 361: FDIVd	fdivd	%f14, %f10, %f0
	.word 0xc07fe001  ! 362: SWAP_I	swap	%r0, [%r31 + 0x0001]
	mov 0x34, %r30
	.word 0x93d0001e  ! 363: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3a700001  ! 366: BPCC	<illegal instruction>
	.word 0x3c700001  ! 367: BPPOS	<illegal instruction>
	.word 0x9b514000  ! 368: RDPR_TBA	rdpr	%tba, %r13
	.word 0x2a700001  ! 369: BPCS	<illegal instruction>
	.word 0x8d802004  ! 370: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8078a001  ! 371: SDIV_I	sdiv 	%r2, 0x0001, %r0
	.word 0x8d802004  ! 372: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc01fe001  ! 373: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x85b20fe4  ! 374: FONES	fones	%f2
	.word 0x8b504000  ! 375: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x9350c000  ! 376: RDPR_TT	rdpr	%tt, %r9
	ta	T_CHANGE_NONPRIV	! macro
DS_19:
	.word 0x22800001  ! 379: BE	be,a	<label_0x1>
	.word 0xd930a001  ! 379: STQF_I	-	%f12, [0x0001, %r2]
	.word 0x95458000  ! 378: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x99d02030  ! 379: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802004  ! 381: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x91b18fec  ! 383: FONES	fones	%f8
	.word 0x2e800001  ! 384: BVS	bvs,a	<label_0x1>
	.word 0x8d9020d6  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x00d6, %pstate
	.word 0x8d902c10  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x0c10, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x34800001  ! 388: BG	bg,a	<label_0x1>
	.word 0x91494000  ! 389: RDHPR_HTBA	rdhpr	%htba, %r8
DS_20:
	.word 0x20800001  ! 391: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b1c301  ! 390: ALLIGNADDRESS	alignaddr	%r7, %r1, %r12
	.word 0x87802016  ! 391: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd8d80e40  ! 392: LDXA_R	ldxa	[%r0, %r0] 0x72, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x28700001  ! 394: BPLEU	<illegal instruction>
	.word 0x8dd02032  ! 395: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x8d902cc8  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0cc8, %pstate
	.word 0xd8900e60  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x73, %r12
	.word 0x9ac2a001  ! 398: ADDCcc_I	addccc 	%r10, 0x0001, %r13
	mov 0x30, %r30
	.word 0x83d0001e  ! 399: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9a50c00d  ! 400: UMUL_R	umul 	%r3, %r13, %r13
	mov 0x33, %r30
	.word 0x8dd0001e  ! 401: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 402: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9c7ae001  ! 403: SDIV_I	sdiv 	%r11, 0x0001, %r14
	.word 0xdc8004a0  ! 404: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r14
	.word 0x32800001  ! 405: BNE	bne,a	<label_0x1>
	.word 0x87a01a6a  ! 406: FqTOi	fqtoi	
	.word 0x38700001  ! 407: BPGU	<illegal instruction>
	.word 0x8d902e91  ! 408: WRPR_PSTATE_I	wrpr	%r0, 0x0e91, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902202  ! 410: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
	.word 0x92db800e  ! 411: SMULcc_R	smulcc 	%r14, %r14, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd28fe010  ! 413: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0x8f69a001  ! 414: SDIVX_I	sdivx	%r6, 0x0001, %r7
	.word 0x83480000  ! 415: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x8d902408  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x0408, %pstate
	.word 0x8f696001  ! 417: SDIVX_I	sdivx	%r5, 0x0001, %r7
	.word 0x97d02033  ! 418: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x8d902617  ! 419: WRPR_PSTATE_I	wrpr	%r0, 0x0617, %pstate
	.word 0x8d9026d1  ! 420: WRPR_PSTATE_I	wrpr	%r0, 0x06d1, %pstate
	.word 0x34800001  ! 421: BG	bg,a	<label_0x1>
	.word 0x8603a001  ! 422: ADD_I	add 	%r14, 0x0001, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9cd20005  ! 424: UMULcc_R	umulcc 	%r8, %r5, %r14
	.word 0xdd27c005  ! 425: STF_R	st	%f14, [%r5, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdc87e030  ! 427: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r14
	.word 0x87802016  ! 428: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87d02032  ! 429: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x926b2001  ! 430: UDIVX_I	udivx 	%r12, 0x0001, %r9
	.word 0x9e4a000d  ! 431: MULX_R	mulx 	%r8, %r13, %r15
	.word 0x87802016  ! 432: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902c86  ! 433: WRPR_PSTATE_I	wrpr	%r0, 0x0c86, %pstate
	.word 0x97d02031  ! 434: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x32800001  ! 435: BNE	bne,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87d02032  ! 437: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x8d802004  ! 438: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x85d02034  ! 439: Tcc_I	tle	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x9bd0001e  ! 441: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d90244c  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
	.word 0x884b800e  ! 443: MULX_R	mulx 	%r14, %r14, %r4
	.word 0x8d802000  ! 444: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8bd02033  ! 445: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0xc887e000  ! 446: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r4
	.word 0x8d480000  ! 447: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x81a0056a  ! 448: FSQRTq	fsqrt	
	.word 0x8d902209  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x0209, %pstate
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 452: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x33, %r30
	.word 0x93d0001e  ! 453: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	mov 0x33, %r30
	.word 0x99d0001e  ! 455: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d902a89  ! 456: WRPR_PSTATE_I	wrpr	%r0, 0x0a89, %pstate
	.word 0x2c700001  ! 457: BPNEG	<illegal instruction>
	.word 0xc0d7e030  ! 458: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r0
	.word 0x9fd02034  ! 459: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0xc1e7c02a  ! 460: CASA_I	casa	[%r31] 0x 1, %r10, %r0
	.word 0xc08804a0  ! 461: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x8d902c95  ! 462: WRPR_PSTATE_I	wrpr	%r0, 0x0c95, %pstate
	.word 0x9ad3c00d  ! 463: UMULcc_R	umulcc 	%r15, %r13, %r13
	.word 0x20700001  ! 464: BPN	<illegal instruction>
	.word 0x8480a001  ! 465: ADDcc_I	addcc 	%r2, 0x0001, %r2
	.word 0x87802004  ! 466: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9ed26001  ! 467: UMULcc_I	umulcc 	%r9, 0x0001, %r15
DS_21:
	.word 0x34800001  ! 469: BG	bg,a	<label_0x1>
	.word 0xd332a001  ! 469: STQF_I	-	%f9, [0x0001, %r10]
	.word 0x89458000  ! 468: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc88fe030  ! 469: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0x87802016  ! 470: WRASI_I	wr	%r0, 0x0016, %asi
DS_22:
	.word 0x32800001  ! 472: BNE	bne,a	<label_0x1>
	.word 0xdf306001  ! 472: STQF_I	-	%f15, [0x0001, %r1]
	.word 0x97458000  ! 471: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd637c00d  ! 472: STH_R	sth	%r11, [%r31 + %r13]
	mov 0x32, %r30
	.word 0x9bd0001e  ! 473: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x97a34d29  ! 474: FsMULd	fsmuld	%f13, %f40, %f42
	.word 0x9fa349cb  ! 475: FDIVd	fdivd	%f44, %f42, %f46
	.word 0xdfe7c02b  ! 476: CASA_I	casa	[%r31] 0x 1, %r11, %r15
	.word 0xde800e40  ! 477: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r15
	.word 0x926b6001  ! 478: UDIVX_I	udivx 	%r13, 0x0001, %r9
	.word 0x8d902845  ! 479: WRPR_PSTATE_I	wrpr	%r0, 0x0845, %pstate
	.word 0x99a00540  ! 480: FSQRTd	fsqrt	
	.word 0x80d14003  ! 481: UMULcc_R	umulcc 	%r5, %r3, %r0
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x887a6001  ! 483: SDIV_I	sdiv 	%r9, 0x0001, %r4
	.word 0x8bd02035  ! 484: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x9fa00566  ! 485: FSQRTq	fsqrt	
DS_23:
	.word 0x32800001  ! 487: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b2830e  ! 486: ALLIGNADDRESS	alignaddr	%r10, %r14, %r9
	.word 0x8d902e02  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0e02, %pstate
DS_24:
	.word 0x34800001  ! 489: BG	bg,a	<label_0x1>
	.word 0xcb326001  ! 489: STQF_I	-	%f5, [0x0001, %r9]
	.word 0x9b458000  ! 488: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902e1a  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	mov 0x34, %r30
	.word 0x8fd0001e  ! 490: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8da249e4  ! 491: FDIVq	dis not found

	ta	T_CHANGE_HPRIV	! macro
	.word 0x96528009  ! 493: UMUL_R	umul 	%r10, %r9, %r11
	mov 0x30, %r30
	.word 0x95d0001e  ! 494: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x93d0001e  ! 495: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9751c000  ! 496: RDPR_TL	rdpr	%tl, %r11
	.word 0x36700001  ! 497: BPGE	<illegal instruction>
	.word 0xd737c009  ! 498: STQF_R	-	%f11, [%r9, %r31]
	.word 0x8d902a8d  ! 499: WRPR_PSTATE_I	wrpr	%r0, 0x0a8d, %pstate
	.word 0x85514000  ! 500: RDPR_TBA	rdpr	%tba, %r2
	.word 0xc407c000  ! 501: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x3a800001  ! 502: BCC	bcc,a	<label_0x1>
	mov 0x32, %r30
	.word 0x91d0001e  ! 503: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 504: BG	bg,a	<label_0x1>
	.word 0xc4d7e030  ! 505: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
DS_25:
	.word 0x22800001  ! 507: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b2c30d  ! 506: ALLIGNADDRESS	alignaddr	%r11, %r13, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802054  ! 508: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x98796001  ! 509: SDIV_I	sdiv 	%r5, 0x0001, %r12
	.word 0x8fa309a7  ! 510: FDIVs	fdivs	%f12, %f7, %f7
	.word 0x85a10d26  ! 511: FsMULd	fsmuld	%f4, %f6, %f2
	.word 0x9bd02033  ! 512: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x9a036001  ! 513: ADD_I	add 	%r13, 0x0001, %r13
	.word 0x83d02031  ! 514: Tcc_I	te	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x91d0001e  ! 515: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9020d7  ! 516: WRPR_PSTATE_I	wrpr	%r0, 0x00d7, %pstate
	ta	T_CHANGE_TO_TL1	! macro
DS_26:
	.word 0x32800001  ! 519: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b2030c  ! 518: ALLIGNADDRESS	alignaddr	%r8, %r12, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd407c000  ! 520: LDUW_R	lduw	[%r31 + %r0], %r10
	mov 0x30, %r30
	.word 0x97d0001e  ! 521: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8fa1c9e7  ! 522: FDIVq	dis not found

	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xce07c000  ! 525: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0x8d902a96  ! 526: WRPR_PSTATE_I	wrpr	%r0, 0x0a96, %pstate
	.word 0x8bb08fe6  ! 527: FONES	fones	%f5
	.word 0xca27e001  ! 528: STW_I	stw	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcb37e001  ! 530: STQF_I	-	%f5, [0x0001, %r31]
	.word 0x82832001  ! 531: ADDcc_I	addcc 	%r12, 0x0001, %r1
	.word 0x95d02034  ! 532: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x9ba3c9ec  ! 533: FDIVq	dis not found

	.word 0x95d02031  ! 534: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0xda4fe001  ! 535: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0xda5fe001  ! 536: LDX_I	ldx	[%r31 + 0x0001], %r13
	mov 0x31, %r30
	.word 0x97d0001e  ! 537: Tcc_R	tge	icc_or_xcc, %r0 + %r30
DS_27:
	.word 0x34800001  ! 539: BG	bg,a	<label_0x1>
	.word 0xcb32400c  ! 539: STQF_R	-	%f5, [%r12, %r9]
	.word 0x8d458000  ! 538: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8601a001  ! 539: ADD_I	add 	%r6, 0x0001, %r3
	.word 0x93d02030  ! 540: Tcc_I	tne	icc_or_xcc, %r0 + 48
DS_28:
	.word 0x32800001  ! 542: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb34301  ! 541: ALLIGNADDRESS	alignaddr	%r13, %r1, %r5
	.word 0x89a309c4  ! 542: FDIVd	fdivd	%f12, %f4, %f4
	ta	T_CHANGE_PRIV	! macro
	.word 0x8b504000  ! 544: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x8d802004  ! 545: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x34, %r30
	.word 0x89d0001e  ! 546: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 547: BNEG	bneg,a	<label_0x1>
	.word 0x8d90248b  ! 548: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
	.word 0x8da0054a  ! 549: FSQRTd	fsqrt	
	.word 0x8cd1c00f  ! 550: UMULcc_R	umulcc 	%r7, %r15, %r6
	.word 0x95504000  ! 551: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x8d902ad2  ! 552: WRPR_PSTATE_I	wrpr	%r0, 0x0ad2, %pstate
	.word 0x87514000  ! 553: RDPR_TBA	rdpr	%tba, %r3
	mov 0x32, %r30
	.word 0x9bd0001e  ! 554: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc6ffc02f  ! 555: SWAPA_R	swapa	%r3, [%r31 + %r15] 0x01
	.word 0x87802080  ! 556: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x85d02030  ! 557: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x87d02034  ! 558: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x38800001  ! 559: BGU	bgu,a	<label_0x1>
	.word 0x864a2001  ! 560: MULX_I	mulx 	%r8, 0x0001, %r3
	mov 0x31, %r30
	.word 0x95d0001e  ! 561: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x81b20fe4  ! 562: FONES	fones	%f0
	.word 0x84820009  ! 563: ADDcc_R	addcc 	%r8, %r9, %r2
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc597e001  ! 565: LDQFA_I	-	[%r31, 0x0001], %f2
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 568: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc447e001  ! 569: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0xc4c00e80  ! 570: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r2
	.word 0x34800001  ! 571: BG	bg,a	<label_0x1>
	.word 0x87d02031  ! 572: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x93d02031  ! 573: Tcc_I	tne	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x93d0001e  ! 574: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90205e  ! 575: WRPR_PSTATE_I	wrpr	%r0, 0x005e, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802004  ! 578: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x95a18dc5  ! 579: FdMULq	fdmulq	
	ta	T_CHANGE_TO_TL1	! macro
DS_29:
	.word 0x20800001  ! 582: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb20305  ! 581: ALLIGNADDRESS	alignaddr	%r8, %r5, %r5
	.word 0x3e700001  ! 582: BPVC	<illegal instruction>
	.word 0x8a794001  ! 583: SDIV_R	sdiv 	%r5, %r1, %r5
	.word 0x95b28fe3  ! 584: FONES	fones	%f10
	.word 0x8d90208a  ! 585: WRPR_PSTATE_I	wrpr	%r0, 0x008a, %pstate
	.word 0xd53fc003  ! 586: STDF_R	std	%f10, [%r3, %r31]
DS_30:
	.word 0x34800001  ! 588: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db30306  ! 587: ALLIGNADDRESS	alignaddr	%r12, %r6, %r6
	.word 0x91514000  ! 588: RDPR_TBA	rdpr	%tba, %r8
	.word 0x3c700001  ! 589: BPPOS	<illegal instruction>
	.word 0x944b2001  ! 590: MULX_I	mulx 	%r12, 0x0001, %r10
	mov 0x34, %r30
	.word 0x8bd0001e  ! 591: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 592: BPNE	<illegal instruction>
	.word 0x8d802000  ! 593: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x98d8c003  ! 595: SMULcc_R	smulcc 	%r3, %r3, %r12
	.word 0x24700001  ! 596: BPLE	<illegal instruction>
	.word 0x3a800001  ! 597: BCC	bcc,a	<label_0x1>
	.word 0xd83fe001  ! 598: STD_I	std	%r12, [%r31 + 0x0001]
	.word 0x92d24006  ! 599: UMULcc_R	umulcc 	%r9, %r6, %r9
	.word 0x91480000  ! 600: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd097e000  ! 601: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
DS_31:
	.word 0x34800001  ! 603: BG	bg,a	<label_0x1>
	.word 0xcb326001  ! 603: STQF_I	-	%f5, [0x0001, %r9]
	.word 0x93458000  ! 602: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d9024c5  ! 603: WRPR_PSTATE_I	wrpr	%r0, 0x04c5, %pstate
	.word 0xd287e020  ! 604: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r9
	mov 0x35, %r30
	.word 0x85d0001e  ! 605: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8682e001  ! 606: ADDcc_I	addcc 	%r11, 0x0001, %r3
	.word 0x9c03e001  ! 607: ADD_I	add 	%r15, 0x0001, %r14
	.word 0x86d18005  ! 608: UMULcc_R	umulcc 	%r6, %r5, %r3
	.word 0x87802004  ! 609: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8fd02033  ! 610: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x8d802004  ! 611: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97d02031  ! 612: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x967a400e  ! 613: SDIV_R	sdiv 	%r9, %r14, %r11
	.word 0x9bd02035  ! 614: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9fa1cdc5  ! 616: FdMULq	fdmulq	
	.word 0x8d902ed0  ! 617: WRPR_PSTATE_I	wrpr	%r0, 0x0ed0, %pstate
	.word 0xde1fc000  ! 618: LDD_R	ldd	[%r31 + %r0], %r15
	.word 0x87802054  ! 619: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xde1fe001  ! 620: LDD_I	ldd	[%r31 + 0x0001], %r15
	.word 0x8d902c53  ! 621: WRPR_PSTATE_I	wrpr	%r0, 0x0c53, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802004  ! 624: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x30, %r30
	.word 0x8fd0001e  ! 625: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9078a001  ! 626: SDIV_I	sdiv 	%r2, 0x0001, %r8
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x84da4004  ! 628: SMULcc_R	smulcc 	%r9, %r4, %r2
	.word 0x8750c000  ! 629: RDPR_TT	rdpr	%tt, %r3
DS_32:
	.word 0x20800001  ! 631: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb04309  ! 630: ALLIGNADDRESS	alignaddr	%r1, %r9, %r5
	.word 0x8b504000  ! 631: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0xcb3fc009  ! 632: STDF_R	std	%f5, [%r9, %r31]
	.word 0x9f50c000  ! 633: RDPR_TT	rdpr	%tt, %r15
DS_33:
	.word 0x22800001  ! 635: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b34300  ! 634: ALLIGNADDRESS	alignaddr	%r13, %r0, %r0
	.word 0x8d902216  ! 635: WRPR_PSTATE_I	wrpr	%r0, 0x0216, %pstate
	.word 0x9ba38d2b  ! 636: FsMULd	fsmuld	%f14, %f42, %f44
DS_34:
	.word 0x20800001  ! 638: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b14303  ! 637: ALLIGNADDRESS	alignaddr	%r5, %r3, %r1
	.word 0x8ba01a6c  ! 638: FqTOi	fqtoi	
	.word 0xca7fe001  ! 639: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0xca87e000  ! 640: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r5
	.word 0x9da14dc8  ! 641: FdMULq	fdmulq	
	.word 0x8ba01a61  ! 642: FqTOi	fqtoi	
	mov 0x30, %r30
	.word 0x8dd0001e  ! 643: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x85b04fe4  ! 644: FONES	fones	%f2
	.word 0x85d02031  ! 645: Tcc_I	tle	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc4dfe000  ! 647: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	.word 0x9fa24dcf  ! 648: FdMULq	fdmulq	
	.word 0x8d9022c0  ! 649: WRPR_PSTATE_I	wrpr	%r0, 0x02c0, %pstate
	mov 0x34, %r30
	.word 0x83d0001e  ! 650: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xde900e40  ! 651: LDUHA_R	lduha	[%r0, %r0] 0x72, %r15
	.word 0x87802045  ! 652: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xde8804a0  ! 653: LDUBA_R	lduba	[%r0, %r0] 0x25, %r15
	mov 0x35, %r30
	.word 0x8fd0001e  ! 654: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xde8fe000  ! 655: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r15
	.word 0x97a3cdcf  ! 656: FdMULq	fdmulq	
	.word 0x34800001  ! 657: BG	bg,a	<label_0x1>
	.word 0x26800001  ! 658: BL	bl,a	<label_0x1>
	.word 0x8d9022c5  ! 659: WRPR_PSTATE_I	wrpr	%r0, 0x02c5, %pstate
	.word 0x9f494000  ! 660: RDHPR_HTBA	rdhpr	%htba, %r15
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9c52000b  ! 662: UMUL_R	umul 	%r8, %r11, %r14
	.word 0x82682001  ! 663: UDIVX_I	udivx 	%r0, 0x0001, %r1
	.word 0x87802088  ! 664: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x20800001  ! 665: BN	bn,a	<label_0x1>
	.word 0x8d90245b  ! 666: WRPR_PSTATE_I	wrpr	%r0, 0x045b, %pstate
	.word 0x32700001  ! 667: BPNE	<illegal instruction>
	.word 0x8d902285  ! 668: WRPR_PSTATE_I	wrpr	%r0, 0x0285, %pstate
	.word 0x22800001  ! 669: BE	be,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 671: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f508000  ! 672: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0xdedfe010  ! 673: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r15
	mov 0x35, %r30
	.word 0x85d0001e  ! 674: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x3e700001  ! 675: BPVC	<illegal instruction>
	.word 0x85a01a68  ! 676: FqTOi	fqtoi	
	.word 0x2c800001  ! 677: BNEG	bneg,a	<label_0x1>
	.word 0x90518008  ! 678: UMUL_R	umul 	%r6, %r8, %r8
	.word 0xd0d7e000  ! 679: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	.word 0x2a800001  ! 680: BCS	bcs,a	<label_0x1>
	.word 0xd0d004a0  ! 681: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	mov 0x30, %r30
	.word 0x85d0001e  ! 682: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8bd02033  ! 683: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x26800001  ! 684: BL	bl,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ec2a001  ! 686: ADDCcc_I	addccc 	%r10, 0x0001, %r7
	.word 0x88d88004  ! 687: SMULcc_R	smulcc 	%r2, %r4, %r4
	.word 0x8680e001  ! 688: ADDcc_I	addcc 	%r3, 0x0001, %r3
	.word 0xc6d004a0  ! 689: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90201f  ! 691: WRPR_PSTATE_I	wrpr	%r0, 0x001f, %pstate
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc62fc004  ! 693: STB_R	stb	%r3, [%r31 + %r4]
	.word 0x8d802000  ! 694: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8a7b800c  ! 695: SDIV_R	sdiv 	%r14, %r12, %r5
	.word 0x99508000  ! 696: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x99d02034  ! 697: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x8d902e0d  ! 698: WRPR_PSTATE_I	wrpr	%r0, 0x0e0d, %pstate
	mov 0x33, %r30
	.word 0x81d0001e  ! 699: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902805  ! 700: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
	.word 0x887b000f  ! 701: SDIV_R	sdiv 	%r12, %r15, %r4
	.word 0xc9e7c02f  ! 702: CASA_I	casa	[%r31] 0x 1, %r15, %r4
	.word 0xc927e001  ! 703: STF_I	st	%f4, [0x0001, %r31]
	.word 0x8d902e0a  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
DS_35:
	.word 0x32800001  ! 706: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b3c304  ! 705: ALLIGNADDRESS	alignaddr	%r15, %r4, %r10
	.word 0xd527e001  ! 706: STF_I	st	%f10, [0x0001, %r31]
	.word 0x9c48a001  ! 707: MULX_I	mulx 	%r2, 0x0001, %r14
	mov 0x33, %r30
	.word 0x95d0001e  ! 708: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 709: BN	bn,a	<label_0x1>
DS_36:
	.word 0x32800001  ! 711: BNE	bne,a	<label_0x1>
	.word 0xc9318006  ! 711: STQF_R	-	%f4, [%r6, %r6]
	.word 0x85458000  ! 710: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc487e000  ! 711: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r2
	.word 0x9fb20fe4  ! 712: FONES	fones	%f15
	.word 0x8d90264e  ! 713: WRPR_PSTATE_I	wrpr	%r0, 0x064e, %pstate
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xdec004a0  ! 715: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r15
	.word 0xdfe7c024  ! 716: CASA_I	casa	[%r31] 0x 1, %r4, %r15
	ta	T_CHANGE_TO_TL1	! macro
DS_37:
	.word 0x34800001  ! 719: BG	bg,a	<label_0x1>
	.word 0xdf30800d  ! 719: STQF_R	-	%f15, [%r13, %r2]
	.word 0x99458000  ! 718: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87802016  ! 719: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802010  ! 720: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x90686001  ! 721: UDIVX_I	udivx 	%r1, 0x0001, %r8
	mov 0x34, %r30
	.word 0x9bd0001e  ! 722: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8868e001  ! 724: UDIVX_I	udivx 	%r3, 0x0001, %r4
	.word 0xc8c80e40  ! 725: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0x8d90245a  ! 726: WRPR_PSTATE_I	wrpr	%r0, 0x045a, %pstate
	.word 0x8950c000  ! 727: RDPR_TT	rdpr	%tt, %r4
	.word 0x9c696001  ! 728: UDIVX_I	udivx 	%r5, 0x0001, %r14
	.word 0x96682001  ! 729: UDIVX_I	udivx 	%r0, 0x0001, %r11
	.word 0x82796001  ! 730: SDIV_I	sdiv 	%r5, 0x0001, %r1
	.word 0x9a49c001  ! 731: MULX_R	mulx 	%r7, %r1, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902e89  ! 733: WRPR_PSTATE_I	wrpr	%r0, 0x0e89, %pstate
	ta	T_CHANGE_TO_TL1	! macro
DS_38:
	.word 0x22800001  ! 736: BE	be,a	<label_0x1>
	.word 0xcd33c006  ! 736: STQF_R	-	%f6, [%r6, %r15]
	.word 0x93458000  ! 735: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x9682a001  ! 736: ADDcc_I	addcc 	%r10, 0x0001, %r11
	mov 0x35, %r30
	.word 0x8bd0001e  ! 737: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd6c00e60  ! 738: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r11
	.word 0x8d90204d  ! 739: WRPR_PSTATE_I	wrpr	%r0, 0x004d, %pstate
	.word 0x3a700001  ! 740: BPCC	<illegal instruction>
	.word 0x9081e001  ! 741: ADDcc_I	addcc 	%r7, 0x0001, %r8
	.word 0x8d802000  ! 742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x2c800001  ! 743: BNEG	bneg,a	<label_0x1>
	.word 0x8fd02035  ! 744: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	mov 0x35, %r30
	.word 0x8dd0001e  ! 745: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d90248d  ! 746: WRPR_PSTATE_I	wrpr	%r0, 0x048d, %pstate
	.word 0xd09004a0  ! 747: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd08fe000  ! 748: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0x8d902e81  ! 749: WRPR_PSTATE_I	wrpr	%r0, 0x0e81, %pstate
DS_39:
	.word 0x32800001  ! 751: BNE	bne,a	<label_0x1>
	.word 0xd9322001  ! 751: STQF_I	-	%f12, [0x0001, %r8]
	.word 0x81458000  ! 750: RD_SOFTINT_REG	stbar
	.word 0x984a4001  ! 751: MULX_R	mulx 	%r9, %r1, %r12
DS_40:
	.word 0x32800001  ! 753: BNE	bne,a	<label_0x1>
	.word 0xd1316001  ! 753: STQF_I	-	%f8, [0x0001, %r5]
	.word 0x9d458000  ! 752: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0xdcc80e40  ! 753: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r14
	.word 0x98832001  ! 754: ADDcc_I	addcc 	%r12, 0x0001, %r12
	.word 0xd997e001  ! 755: LDQFA_I	-	[%r31, 0x0001], %f12
	mov 0x33, %r30
	.word 0x85d0001e  ! 756: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8750c000  ! 757: RDPR_TT	rdpr	%tt, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83d02035  ! 759: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d902c90  ! 760: WRPR_PSTATE_I	wrpr	%r0, 0x0c90, %pstate
	.word 0x87a3c9a5  ! 761: FDIVs	fdivs	%f15, %f5, %f3
	.word 0xc68804a0  ! 762: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc69fe001  ! 763: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0x34700001  ! 764: BPG	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x34800001  ! 766: BG	bg,a	<label_0x1>
	.word 0x8d902445  ! 767: WRPR_PSTATE_I	wrpr	%r0, 0x0445, %pstate
	.word 0x81494000  ! 768: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x8d902c9d  ! 769: WRPR_PSTATE_I	wrpr	%r0, 0x0c9d, %pstate
	.word 0x8d902ac9  ! 770: WRPR_PSTATE_I	wrpr	%r0, 0x0ac9, %pstate
	.word 0xc0d00e60  ! 771: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r0
	.word 0x8da109e8  ! 772: FDIVq	dis not found

DS_41:
	.word 0x32800001  ! 774: BNE	bne,a	<label_0x1>
	.word 0xc932e001  ! 774: STQF_I	-	%f4, [0x0001, %r11]
	.word 0x87458000  ! 773: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x97494000  ! 774: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x2e700001  ! 775: BPVS	<illegal instruction>
	.word 0x8d9022db  ! 776: WRPR_PSTATE_I	wrpr	%r0, 0x02db, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd6cfe020  ! 778: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0x3c700001  ! 779: BPPOS	<illegal instruction>
	.word 0x8d902416  ! 780: WRPR_PSTATE_I	wrpr	%r0, 0x0416, %pstate
	.word 0x81a0056e  ! 781: FSQRTq	fsqrt	
	.word 0x8fa00549  ! 782: FSQRTd	fsqrt	
	mov 0x35, %r30
	.word 0x81d0001e  ! 783: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8b494000  ! 784: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x87802088  ! 785: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xcacfe020  ! 786: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0x8d902e5d  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8e82c008  ! 789: ADDcc_R	addcc 	%r11, %r8, %r7
	.word 0x9c7a6001  ! 790: SDIV_I	sdiv 	%r9, 0x0001, %r14
	.word 0x8d802004  ! 791: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x85514000  ! 792: RDPR_TBA	rdpr	%tba, %r2
	mov 0x32, %r30
	.word 0x8dd0001e  ! 793: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902aca  ! 794: WRPR_PSTATE_I	wrpr	%r0, 0x0aca, %pstate
	.word 0x99a000cc  ! 795: FNEGd	fnegd	%f12, %f12
	.word 0x95a3c9aa  ! 796: FDIVs	fdivs	%f15, %f10, %f10
	.word 0x87802054  ! 797: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x8d902ad7  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x0ad7, %pstate
	ta	T_CHANGE_HPRIV	! macro
	mov 0x35, %r30
	.word 0x8dd0001e  ! 800: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x89d0001e  ! 801: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9ba00569  ! 802: FSQRTq	fsqrt	
	.word 0x87802010  ! 803: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x89508000  ! 804: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x93a14d23  ! 805: FsMULd	fsmuld	%f5, %f34, %f40
	.word 0x8151c000  ! 806: RDPR_TL	rdpr	%tl, %r0
	.word 0x9a02e001  ! 807: ADD_I	add 	%r11, 0x0001, %r13
	.word 0x2a700001  ! 808: BPCS	<illegal instruction>
DS_42:
	.word 0x32800001  ! 810: BNE	bne,a	<label_0x1>
	.word 0xcd304009  ! 810: STQF_R	-	%f6, [%r9, %r1]
	.word 0x81458000  ! 809: RD_SOFTINT_REG	stbar
	.word 0xc0dfe010  ! 810: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r0
	.word 0x8d500000  ! 811: RDPR_TPC	rdpr	%tpc, %r6
	.word 0xccd7e030  ! 812: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	.word 0x95a00569  ! 813: FSQRTq	fsqrt	
	.word 0x9c4b6001  ! 814: MULX_I	mulx 	%r13, 0x0001, %r14
	.word 0x8d802000  ! 815: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x2a800001  ! 816: BCS	bcs,a	<label_0x1>
	.word 0x8cd0e001  ! 817: UMULcc_I	umulcc 	%r3, 0x0001, %r6
	.word 0x8d802000  ! 818: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a149e1  ! 819: FDIVq	dis not found

	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902801  ! 821: WRPR_PSTATE_I	wrpr	%r0, 0x0801, %pstate
DS_43:
	.word 0x32800001  ! 823: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b04306  ! 822: ALLIGNADDRESS	alignaddr	%r1, %r6, %r3
	.word 0x8b69e001  ! 823: SDIVX_I	sdivx	%r7, 0x0001, %r5
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902841  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x0841, %pstate
	.word 0xca57c000  ! 826: LDSH_R	ldsh	[%r31 + %r0], %r5
	.word 0x24700001  ! 827: BPLE	<illegal instruction>
	.word 0x89d02030  ! 828: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x8d902e04  ! 829: WRPR_PSTATE_I	wrpr	%r0, 0x0e04, %pstate
	.word 0x9ad8400c  ! 830: SMULcc_R	smulcc 	%r1, %r12, %r13
DS_44:
	.word 0x32800001  ! 832: BNE	bne,a	<label_0x1>
	.word 0xdb33400a  ! 832: STQF_R	-	%f13, [%r10, %r13]
	.word 0x99458000  ! 831: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd80fe001  ! 832: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x9b500000  ! 833: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x8d902c8d  ! 834: WRPR_PSTATE_I	wrpr	%r0, 0x0c8d, %pstate
	.word 0xda7fe001  ! 835: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x8d902083  ! 836: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
	.word 0x8d902083  ! 837: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
	.word 0xdaffc02a  ! 838: SWAPA_R	swapa	%r13, [%r31 + %r10] 0x01
	.word 0xda7fe001  ! 839: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x8d902e9d  ! 840: WRPR_PSTATE_I	wrpr	%r0, 0x0e9d, %pstate
	.word 0x8d494000  ! 841: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x87802004  ! 842: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02035  ! 843: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xcde7c02a  ! 844: CASA_I	casa	[%r31] 0x 1, %r10, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc97e000  ! 846: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	.word 0xcc7fe001  ! 847: SWAP_I	swap	%r6, [%r31 + 0x0001]
	mov 0x34, %r30
	.word 0x85d0001e  ! 848: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 849: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91b00fea  ! 850: FONES	fones	%f8
	.word 0x98032001  ! 851: ADD_I	add 	%r12, 0x0001, %r12
	.word 0x9fa000c3  ! 852: FNEGd	fnegd	%f34, %f46
	.word 0x97d02032  ! 853: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x89a0056d  ! 854: FSQRTq	fsqrt	
	.word 0x8ad00009  ! 855: UMULcc_R	umulcc 	%r0, %r9, %r5
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d6a6001  ! 857: SDIVX_I	sdivx	%r9, 0x0001, %r6
	mov 0x30, %r30
	.word 0x89d0001e  ! 858: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x85d0001e  ! 859: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xcc97e030  ! 860: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r6
	ta	T_CHANGE_NONHPRIV	! macro
DS_45:
	.word 0x22800001  ! 863: BE	be,a	<label_0x1>
	.word 0xc1308005  ! 863: STQF_R	-	%f0, [%r5, %r2]
	.word 0x87458000  ! 862: RD_SOFTINT_REG	rd	%softint, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x98d0e001  ! 864: UMULcc_I	umulcc 	%r3, 0x0001, %r12
	.word 0xd8c004a0  ! 865: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x87802088  ! 866: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x97a109c8  ! 867: FDIVd	fdivd	%f4, %f8, %f42
	.word 0x93686001  ! 868: SDIVX_I	sdivx	%r1, 0x0001, %r9
	.word 0xd327e001  ! 869: STF_I	st	%f9, [0x0001, %r31]
	.word 0xd247c000  ! 870: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0x8d500000  ! 871: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x28700001  ! 872: BPLEU	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9028d3  ! 874: WRPR_PSTATE_I	wrpr	%r0, 0x08d3, %pstate
	.word 0x9f51c000  ! 875: RDPR_TL	rdpr	%tl, %r15
	ta	T_CHANGE_HPRIV	! macro
	mov 0x35, %r30
	.word 0x9bd0001e  ! 877: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d90288c  ! 878: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0x87d02031  ! 879: Tcc_I	tl	icc_or_xcc, %r0 + 49
DS_46:
	.word 0x20800001  ! 881: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b10305  ! 880: ALLIGNADDRESS	alignaddr	%r4, %r5, %r4
	.word 0x89a00547  ! 881: FSQRTd	fsqrt	
	.word 0x8d802000  ! 882: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc8cfe030  ! 883: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r4
DS_47:
	.word 0x34800001  ! 885: BG	bg,a	<label_0x1>
	.word 0xdd318000  ! 885: STQF_R	-	%f14, [%r0, %r6]
	.word 0x9d458000  ! 884: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x97a000cc  ! 885: FNEGd	fnegd	%f12, %f42
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x89494000  ! 889: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x8d902291  ! 890: WRPR_PSTATE_I	wrpr	%r0, 0x0291, %pstate
	.word 0x88486001  ! 891: MULX_I	mulx 	%r1, 0x0001, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9f480000  ! 893: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x91d02033  ! 894: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xde9fe001  ! 895: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	.word 0xde9004a0  ! 896: LDUHA_R	lduha	[%r0, %r0] 0x25, %r15
	.word 0x95d02031  ! 897: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x87a289e0  ! 898: FDIVq	dis not found

	.word 0x8d902cdf  ! 899: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	.word 0x8d802000  ! 900: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24800001  ! 901: BLE	ble,a	<label_0x1>
	.word 0x87802045  ! 902: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x8d802000  ! 903: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95514000  ! 905: RDPR_TBA	rdpr	%tba, %r10
	mov 0x31, %r30
	.word 0x85d0001e  ! 906: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 907: BVS	bvs,a	<label_0x1>
	.word 0x9600a001  ! 908: ADD_I	add 	%r2, 0x0001, %r11
	.word 0x8d9026ce  ! 909: WRPR_PSTATE_I	wrpr	%r0, 0x06ce, %pstate
	.word 0x94794003  ! 910: SDIV_R	sdiv 	%r5, %r3, %r10
	.word 0x87802004  ! 911: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9ec06001  ! 912: ADDCcc_I	addccc 	%r1, 0x0001, %r15
	.word 0x8d902018  ! 913: WRPR_PSTATE_I	wrpr	%r0, 0x0018, %pstate
	.word 0xde57e001  ! 914: LDSH_I	ldsh	[%r31 + 0x0001], %r15
	.word 0xde9fc020  ! 915: LDDA_R	ldda	[%r31, %r0] 0x01, %r15
	mov 0x35, %r30
	.word 0x8fd0001e  ! 916: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8da0c9c2  ! 917: FDIVd	fdivd	%f34, %f2, %f6
	.word 0x8d802000  ! 918: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcde7c022  ! 919: CASA_I	casa	[%r31] 0x 1, %r2, %r6
	.word 0x8d902a51  ! 920: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9ed02001  ! 922: UMULcc_I	umulcc 	%r0, 0x0001, %r15
	.word 0xde2fc002  ! 923: STB_R	stb	%r15, [%r31 + %r2]
	.word 0x8e816001  ! 924: ADDcc_I	addcc 	%r5, 0x0001, %r7
	.word 0x91a209c8  ! 925: FDIVd	fdivd	%f8, %f8, %f8
	.word 0x87802014  ! 926: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902440  ! 927: WRPR_PSTATE_I	wrpr	%r0, 0x0440, %pstate
	.word 0x8d90208d  ! 928: WRPR_PSTATE_I	wrpr	%r0, 0x008d, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8c7a2001  ! 930: SDIV_I	sdiv 	%r8, 0x0001, %r6
	.word 0xcc97e000  ! 931: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	.word 0x8cd2a001  ! 932: UMULcc_I	umulcc 	%r10, 0x0001, %r6
	.word 0xcc3fe001  ! 933: STD_I	std	%r6, [%r31 + 0x0001]
	.word 0xcd37e001  ! 934: STQF_I	-	%f6, [0x0001, %r31]
	.word 0x8d90264f  ! 935: WRPR_PSTATE_I	wrpr	%r0, 0x064f, %pstate
	.word 0x92c26001  ! 936: ADDCcc_I	addccc 	%r9, 0x0001, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9026c9  ! 938: WRPR_PSTATE_I	wrpr	%r0, 0x06c9, %pstate
	.word 0x9fa08d2d  ! 939: FsMULd	fsmuld	%f2, %f44, %f46
	.word 0xdfe7c02d  ! 940: CASA_I	casa	[%r31] 0x 1, %r13, %r15
	.word 0x2c800001  ! 941: BNEG	bneg,a	<label_0x1>
	.word 0xde900e60  ! 942: LDUHA_R	lduha	[%r0, %r0] 0x73, %r15
	.word 0x9c00e001  ! 943: ADD_I	add 	%r3, 0x0001, %r14
	mov 0x33, %r30
	.word 0x9fd0001e  ! 944: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xdc27e001  ! 945: STW_I	stw	%r14, [%r31 + 0x0001]
DS_48:
	.word 0x32800001  ! 947: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9db14308  ! 946: ALLIGNADDRESS	alignaddr	%r5, %r8, %r14
	.word 0x8d902418  ! 947: WRPR_PSTATE_I	wrpr	%r0, 0x0418, %pstate
	.word 0x8c822001  ! 948: ADDcc_I	addcc 	%r8, 0x0001, %r6
	.word 0xcd37e001  ! 949: STQF_I	-	%f6, [0x0001, %r31]
	mov 0x33, %r30
	.word 0x97d0001e  ! 950: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x99a01a61  ! 951: FqTOi	fqtoi	
	.word 0x87802088  ! 952: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x8da000ca  ! 954: FNEGd	fnegd	%f10, %f6
	.word 0x87d02035  ! 955: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x85688005  ! 956: SDIVX_R	sdivx	%r2, %r5, %r2
	mov 0x31, %r30
	.word 0x87d0001e  ! 957: Tcc_R	tl	icc_or_xcc, %r0 + %r30
DS_49:
	.word 0x32800001  ! 959: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b24305  ! 958: ALLIGNADDRESS	alignaddr	%r9, %r5, %r2
	.word 0xc4880e40  ! 959: LDUBA_R	lduba	[%r0, %r0] 0x72, %r2
	.word 0xc42fc005  ! 960: STB_R	stb	%r2, [%r31 + %r5]
	.word 0x8b514000  ! 961: RDPR_TBA	rdpr	%tba, %r5
	.word 0xca9004a0  ! 962: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xcaffc025  ! 963: SWAPA_R	swapa	%r5, [%r31 + %r5] 0x01
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8681400a  ! 965: ADDcc_R	addcc 	%r5, %r10, %r3
	.word 0x9fd02035  ! 966: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	mov 0x33, %r30
	.word 0x9bd0001e  ! 967: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x90d3c005  ! 968: UMULcc_R	umulcc 	%r15, %r5, %r8
	.word 0xd127c005  ! 969: STF_R	st	%f8, [%r5, %r31]
	.word 0x3e700001  ! 970: BPVC	<illegal instruction>
	.word 0x96c36001  ! 971: ADDCcc_I	addccc 	%r13, 0x0001, %r11
	.word 0x81504000  ! 972: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0xc0800e80  ! 973: LDUWA_R	lduwa	[%r0, %r0] 0x74, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902c8f  ! 975: WRPR_PSTATE_I	wrpr	%r0, 0x0c8f, %pstate
	.word 0x8ba20dc2  ! 976: FdMULq	fdmulq	
	.word 0x8d902ad3  ! 977: WRPR_PSTATE_I	wrpr	%r0, 0x0ad3, %pstate
	.word 0x2c800001  ! 978: BNEG	bneg,a	<label_0x1>
	.word 0x85d02031  ! 979: Tcc_I	tle	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x93d0001e  ! 980: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcad00e40  ! 981: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r5
	.word 0x8d902883  ! 982: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	.word 0x9f494000  ! 983: RDHPR_HTBA	rdhpr	%htba, %r15
DS_50:
	.word 0x34800001  ! 985: BG	bg,a	<label_0x1>
	.word 0xc7334001  ! 985: STQF_R	-	%f3, [%r1, %r13]
	.word 0x91458000  ! 984: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd09fc020  ! 985: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0xd00fc000  ! 986: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0xd09fc020  ! 987: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0x28700001  ! 988: BPLEU	<illegal instruction>
	.word 0x8d902287  ! 989: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
	.word 0x8d802004  ! 990: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90285d  ! 991: WRPR_PSTATE_I	wrpr	%r0, 0x085d, %pstate
	.word 0x9750c000  ! 992: RDPR_TT	rdpr	%tt, %r11
	mov 0x32, %r30
	.word 0x8fd0001e  ! 993: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xd737e001  ! 994: STQF_I	-	%f11, [0x0001, %r31]
DS_51:
	.word 0x34800001  ! 996: BG	bg,a	<label_0x1>
	.word 0xc1322001  ! 996: STQF_I	-	%f0, [0x0001, %r8]
	.word 0x91458000  ! 995: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x97a01a6d  ! 996: FqTOi	fqtoi	
	.word 0xd69fc020  ! 997: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x8d9028c2  ! 998: WRPR_PSTATE_I	wrpr	%r0, 0x08c2, %pstate


.data
user_data_start:
	.xword	0xdd60eeb3f70e4d60
	.xword	0x3d2796eb5aedcd3c
	.xword	0xffacb3d0410e7ead
	.xword	0xeb69416b1384fd3f
	.xword	0x95cd04d2f95c00ca
	.xword	0xae0f8bc751e04c5e
	.xword	0x71dd468b410ac44f
	.xword	0x6c989ed29a1c2afd
	.xword	0x3198dd369e73df77
	.xword	0xcdb3a16329859e85
	.xword	0x7da53b9445a34356
	.xword	0x41db79be235a6970
	.xword	0x3ee97e1e1afeef4d
	.xword	0xaa615a978a5f31cd
	.xword	0x9d90654783afc0c3
	.xword	0xea24bf73e46d3533
	.xword	0x199de3563d6eeb5c
	.xword	0x49bb8ce5f3d7a9a1
	.xword	0x529801220e527fbc
	.xword	0xb4e8443e88be504e
	.xword	0xbd339ea8861de652
	.xword	0xeffe53e5f9bb910d
	.xword	0x5877a6b7e9d7542e
	.xword	0x57f3db3322e9177b
	.xword	0x1800abd3dc322c95
	.xword	0x5fa1dd07bc0d67b2
	.xword	0x6748cadaac9bc98b
	.xword	0x091ea34dc986288d
	.xword	0xd858878c109ffb7c
	.xword	0x0a7c1e0db9b81699
	.xword	0x7f3a3c956b525d4f
	.xword	0x6694eb531e657799
	.xword	0xc3c69d0f9718b7a3
	.xword	0x5b3d6769dfa6f0b8
	.xword	0x644391315fb57523
	.xword	0x0a7cce53eaf98bad
	.xword	0x49b3c9f3a30ea07b
	.xword	0x1b6120908a1ac67e
	.xword	0x3c4fe74f20b8e723
	.xword	0xb2656fcb8070cb81
	.xword	0x09aad7c32ab24fb6
	.xword	0x4395937fa9320482
	.xword	0x3fb031285fc0042c
	.xword	0x6db9e621e6b4bc99
	.xword	0x41d0e5a8100e3aec
	.xword	0x84cd59dadcfcf4f9
	.xword	0xaaa1ef12d22642b0
	.xword	0x92832ff4a7c43905
	.xword	0x4812b5d771137731
	.xword	0x6e3375724b0506c6
	.xword	0xb280caaf4a810029
	.xword	0xaa34cffbfa02abef
	.xword	0x2f4f25a7b7105ab3
	.xword	0xebe4190092ec2d7e
	.xword	0x5a8cc967479e9e7c
	.xword	0xa35ae623486bf5ae
	.xword	0xb5272bd9efe01f4d
	.xword	0xb943ac85a451d44b
	.xword	0x63b8d9b8019c6715
	.xword	0x1a90e7f86237ebc9
	.xword	0x040062b575218c2d
	.xword	0x8402eb507fa3f88c
	.xword	0x1e1aec6fc56495c6
	.xword	0x64eccbdf9f287000
	.xword	0x37b9f23a503698a3
	.xword	0x72685a1f671edf9c
	.xword	0xd0ea0713c403655a
	.xword	0xb5156cdd50c6fae7
	.xword	0x0d9fce9f72e58b84
	.xword	0x11582616b045890f
	.xword	0xb8a2d348b04c4ab3
	.xword	0xeb7aa07a789f5ec4
	.xword	0xb27cdb5ad362f821
	.xword	0xdd3333e354b39ab1
	.xword	0xbd6e9605b21c9fb2
	.xword	0x4610c5dbec336f23
	.xword	0x60933ff1b2b9b11e
	.xword	0x4fe85ab92a8e66b8
	.xword	0x092b31b3885a2f78
	.xword	0xd95f72a1b685c62d
	.xword	0xf086e78e43f68c05
	.xword	0x5ed7b9482d50ec68
	.xword	0x6c3fa49ab0b82728
	.xword	0xfe135723984f9c9b
	.xword	0x15aaa74b61fdef65
	.xword	0x4625065e3d7cee08
	.xword	0x8400460d90685353
	.xword	0xde52307028523b05
	.xword	0xe5ba7a90c7be72c8
	.xword	0x7d7cd0a154ebf368
	.xword	0x5988ce0f35ffaf8d
	.xword	0xd73bc3ec0196805a
	.xword	0xbc673d47365f0cd5
	.xword	0x8ed039ba4aa464a5
	.xword	0x023fbab920338b7a
	.xword	0xa101bc1d6ab0fed9
	.xword	0x74c6ce79d7a1d42a
	.xword	0xcd9bc21e0f472dd2
	.xword	0xb700902733a7539b
	.xword	0x44edfb9e1371a0dd
	.xword	0xdd655e225ab263fb
	.xword	0x53dde5264f43b022
	.xword	0x5fc0738e5026767c
	.xword	0xbebfdd5f591dd061
	.xword	0x97967a9ef3910d1d
	.xword	0xa2f68799eb7da013
	.xword	0x17384d357cdfc5c4
	.xword	0x0e0f2fcb998051b3
	.xword	0xb8a7ecf9b8d332be
	.xword	0xbf81186cefceadf6
	.xword	0x772d0fb4f4484dce
	.xword	0xe9ce418e9f361a77
	.xword	0x15106e0775bee865
	.xword	0xdaaac3ff4afd97a2
	.xword	0x84f72b9004f1c392
	.xword	0xa55b4927525af591
	.xword	0xb0ebcfedc6eb6c57
	.xword	0xfa11b86b16e6cd1f
	.xword	0xed1071055606c01a
	.xword	0x29269f125a40cb4e
	.xword	0x47f61c79e0c21dd7
	.xword	0x62862cacbfee80c2
	.xword	0x109b8149029cc0d7
	.xword	0xe0a0d24877636146
	.xword	0x14c383109c97cb8e
	.xword	0xb4dfad5703cc1479
	.xword	0x9a202b8c858b31a3
	.xword	0x58ce5b0734363f5d
	.xword	0xac91d61dff395e88
	.xword	0x2783797d6c242159
	.xword	0xa960d7933ec274f0
	.xword	0x84e1a70c5e5c96f1
	.xword	0xac104cd9ae5ba59e
	.xword	0x8e6a447605c7f3ec
	.xword	0x3343d016e75668b6
	.xword	0x4b2df6af4e906864
	.xword	0x562243caa569b925
	.xword	0x95ad9f66adff7616
	.xword	0x1af42abda1e88bba
	.xword	0xe1d512eaf96843af
	.xword	0x0726740947f77cdd
	.xword	0x0cfeefdc7de1e603
	.xword	0xd585850b8006c39c
	.xword	0xdfb1f1a3ae2849d3
	.xword	0xb78247b3fe5eb3d3
	.xword	0x70a6ae87da0737a7
	.xword	0xcebc42c6e14dcbe4
	.xword	0x469a03ec24880ab7
	.xword	0x57859c752fb7b015
	.xword	0x24f1d1a0380c960c
	.xword	0x720697516ba10ec7
	.xword	0x28b13639c45e2a33
	.xword	0x2687fda118f1a54b
	.xword	0xe749996891a32815
	.xword	0xf93204827e16fab2
	.xword	0x8dfe909340c2010f
	.xword	0x44367bf12d7537c4
	.xword	0x512a91b69666226e
	.xword	0x3ab2e918ea700ddd
	.xword	0xe66d452fa1c02662
	.xword	0x7e9ec92642dfd550
	.xword	0x7bee55b4d2171f5a
	.xword	0xe5dae12b0529927a
	.xword	0xc936fb3d85b9bc14
	.xword	0x96ee72c9b9f90c75
	.xword	0x548e7735c37e26a9
	.xword	0x3d57ced6dc0d8e76
	.xword	0x9c0a2681b7ac2336
	.xword	0x997be0a6af817a17
	.xword	0xf7770f7716e907fa
	.xword	0x0f80f76ac4308417
	.xword	0xa9472c42ba2d80ba
	.xword	0xd18a727bce49646f
	.xword	0xffee10ecb2aa8490
	.xword	0xf1a3b3c427e7967b
	.xword	0x10217174d0f04c1d
	.xword	0x691f93b939c191b5
	.xword	0xdf9015a34a9cff75
	.xword	0xb189c68ba3268673
	.xword	0x54ed132cefea8135
	.xword	0xfdd945991eec59f1
	.xword	0x3819d5b5a284fe7f
	.xword	0x24e3ae974def79dc
	.xword	0x02d41e85694cca43
	.xword	0x2bc28a2253a295e0
	.xword	0x8bb4f1168f10fb22
	.xword	0xdd178d3fdc44d807
	.xword	0x579ceb1e3171dc21
	.xword	0xa3c832e49ce2d25d
	.xword	0xee9e1666039a3756
	.xword	0xecf96a25b8ebe284
	.xword	0x41134cf7953977be
	.xword	0x84cface242b8291c
	.xword	0xbfb602c5c6afb01f
	.xword	0x001fbdc7ac394c5c
	.xword	0x2c0ea4ce45d0bb90
	.xword	0x291ef630443dbe88
	.xword	0x3c9de458d288ea6b
	.xword	0x74cef4ef54afd0b5
	.xword	0xc0ad216c5fdc2b07
	.xword	0x7badbbfcae308893
	.xword	0x07257d61a143c32a
	.xword	0x97c213b49d17d549
	.xword	0x59a22825d6c64c97
	.xword	0x43906b8590ec5ce7
	.xword	0x331b6727ad5072d7
	.xword	0x3b0317cdc2f6cb69
	.xword	0x7419ec79cb0d9723
	.xword	0xcb8d83889db26aad
	.xword	0x3653108a8f2c4fb1
	.xword	0xc5cbdde131a7a25e
	.xword	0x6925eb682881b392
	.xword	0x7fd782440a17bedf
	.xword	0xb93ef08ff70b2286
	.xword	0xa1036ade138d98cc
	.xword	0x1d6949babed070ea
	.xword	0xad9cf00870df0d51
	.xword	0x6acc1d68df1a9cbf
	.xword	0x65252a58a9c15cc3
	.xword	0x0bdefae41ea0ce28
	.xword	0x63c18d80acdf3e1b
	.xword	0x9eb88669d8ed26ea
	.xword	0xe3876e772a003449
	.xword	0xdf08383c1785ff69
	.xword	0x37e251b0350869a2
	.xword	0x657b896907e279a3
	.xword	0xb0ecd13323562687
	.xword	0xe41541f4355850bf
	.xword	0x08c520df5b8cdec8
	.xword	0x5b87df9753dd621a
	.xword	0xb1b58cee5c22cc82
	.xword	0xdecee27a353448ca
	.xword	0x6b47cb608d726a28
	.xword	0xfc6510f8c17ce5a6
	.xword	0x105ac9a7d9865d1f
	.xword	0x5a8c369f15f729e1
	.xword	0xa332050389101e48
	.xword	0xbdc1129ba176fd90
	.xword	0xfd19131c9840eff7
	.xword	0xa73a4f84d2171935
	.xword	0x63c6f007f118b1cb
	.xword	0x93842bdbc388aebc
	.xword	0xa7e3783d714bb32c
	.xword	0x6ee0d32207d8a474
	.xword	0xd1c5647cc11f3c7c
	.xword	0x362b23935893d92f
	.xword	0x96e3da549c307548
	.xword	0xf82ad695da8345db
	.xword	0x6318ff65edc89e3b
	.xword	0xb34b91dd39dfe120
	.xword	0x372597e0eb3084e7
	.xword	0x8eb798a99f640f70
	.xword	0x08a332168b8c8187
	.xword	0x4aff1447b9456198
	.xword	0x0d3acc863edb46da
	.xword	0xf794ff766794be30


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Fri Apr  2 17:08:27 2004
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
