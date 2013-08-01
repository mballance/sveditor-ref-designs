/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand01_ind_11.s
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
    inc %o4;\
    umul %o4, 2, %o5;\
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
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
    umul %i7, 2, %l1;\
    inc %o5;\
    umul %i5, 2, %l3;\
    inc %o3;\
    save; \
    restore; \
    done ;\
    nop; 
#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    umul %i7, 2, %l1;\
    inc %o5;\
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
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
#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
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
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    retry;\
    nop; nop

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
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    retry;\
    nop; nop

#define H_HT0_Watchdog_Reset_0x02
#define My_HT0_Watchdog_Reset_0x02 \
    setx Watchdog_Reset_Handler, %g1, %g2 ;\
    jmp %g2;\
    nop

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


#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop


#include "hboot.s"
.global user_data_start
.text
.global main
main:

    !Start with TL 1
    !ta T_CHANGE_TO_TL1

    ! Set up ld/st area per thread
	ta	T_RD_THID
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
	.word 0x2a800001  ! 7: BCS	bcs,a	<label_0x1>
	.word 0x9c6ba001  ! 8: UDIVX_I	udivx 	%r14, 0x0001, %r14
	.word 0x8d802004  ! 11: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 14: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x34800001  ! 15: BG	bg,a	<label_0x1>
	.word 0xdcc7e010  ! 16: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r14
	.word 0x904b0007  ! 19: MULX_R	mulx 	%r12, %r7, %r8
	.word 0xd05fe001  ! 20: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0xd0c00e60  ! 21: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0x26800001  ! 24: BL	bl,a	<label_0x1>
	mov 0x34, %r30
	.word 0x93d0001e  ! 25: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd017e001  ! 30: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0xd137e001  ! 31: STQF_I	-	%f8, [0x0001, %r31]
	.word 0x9fd02031  ! 36: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x36700001  ! 37: BPGE	<illegal instruction>
	.word 0xd007c000  ! 38: LDUW_R	lduw	[%r31 + %r0], %r8
	.word 0x24800001  ! 39: BLE	ble,a	<label_0x1>
	mov 0x35, %r30
	.word 0x9bd0001e  ! 42: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd05fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x97d02035  ! 46: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x3a800001  ! 47: BCC	bcc,a	<label_0x1>
	.word 0x947a0009  ! 48: SDIV_R	sdiv 	%r8, %r9, %r10
	.word 0x8848400e  ! 49: MULX_R	mulx 	%r1, %r14, %r4
	.word 0xc807c000  ! 50: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0xc857c000  ! 57: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0x9dd02032  ! 60: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0xc8c80e40  ! 63: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0x85d02035  ! 64: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x8ba0056c  ! 67: FSQRTq	fsqrt	
	.word 0xca800b60  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcacfe020  ! 80: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0xcac004a0  ! 81: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	mov 0x35, %r30
	.word 0x91d0001e  ! 82: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca07c000  ! 91: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0x32800001  ! 94: BNE	bne,a	<label_0x1>
	.word 0x2e700001  ! 95: BPVS	<illegal instruction>
	.word 0xca800c40  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r5
	.word 0x8fd02034  ! 99: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	mov 0x33, %r30
	.word 0x91d0001e  ! 100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81a189a7  ! 103: FDIVs	fdivs	%f6, %f7, %f0
	mov 0x31, %r30
	.word 0x81d0001e  ! 104: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc0c7e010  ! 105: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0x91d02032  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9dd02031  ! 111: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	mov 0x31, %r30
	.word 0x85d0001e  ! 112: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 117: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9bd02034  ! 118: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0x95d02032  ! 119: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x864b4007  ! 124: MULX_R	mulx 	%r13, %r7, %r3
	mov 0x35, %r30
	.word 0x89d0001e  ! 127: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc6c7e030  ! 128: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r3
	.word 0xc65fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x9950c000  ! 130: RDPR_TT	rdpr	%tt, %r12
	.word 0x2e800001  ! 139: BVS	bvs,a	<label_0x1>
	.word 0xd8c7e010  ! 150: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0xd817e001  ! 153: LDUH_I	lduh	[%r31 + 0x0001], %r12
	.word 0x9b514000  ! 154: RDPR_TBA	rdpr	%tba, %r13
	mov 0x33, %r30
	.word 0x8dd0001e  ! 157: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xdac7e000  ! 158: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0x91d02033  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda0fc000  ! 172: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0xda0fe001  ! 175: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xda8008a0  ! 176: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x38800001  ! 181: BGU	bgu,a	<label_0x1>
	.word 0x99d02032  ! 186: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0xdabfc027  ! 191: STDA_R	stda	%r13, [%r31 + %r7] 0x01
	.word 0x30800001  ! 196: BA	ba,a	<label_0x1>
	.word 0xda27c007  ! 205: STW_R	stw	%r13, [%r31 + %r7]
	.word 0xda97e030  ! 208: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x3e800001  ! 211: BVC	bvc,a	<label_0x1>
	.word 0xdacfe010  ! 220: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
	.word 0xdadfe010  ! 223: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x87d02035  ! 224: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x93d02033  ! 225: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xdac004a0  ! 228: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81d02032  ! 230: Tcc_I	tn	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3c800001  ! 238: BPOS	bpos,a	<label_0x1>
	.word 0x807a6001  ! 241: SDIV_I	sdiv 	%r9, 0x0001, %r0
	mov 0x35, %r30
	.word 0x9dd0001e  ! 244: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xc0d004a0  ! 249: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0x2a700001  ! 252: BPCS	<illegal instruction>
	.word 0xc0c804a0  ! 253: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x87802010  ! 254: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc07fe001  ! 259: SWAP_I	swap	%r0, [%r31 + 0x0001]
	mov 0x30, %r30
	.word 0x8fd0001e  ! 266: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8cd14008  ! 269: UMULcc_R	umulcc 	%r5, %r8, %r6
	.word 0x24700001  ! 276: BPLE	<illegal instruction>
	.word 0xccc7e000  ! 277: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	mov 0x32, %r30
	.word 0x89d0001e  ! 280: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 281: BVC	bvc,a	<label_0x1>
	.word 0x87802016  ! 286: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x2e700001  ! 291: BPVS	<illegal instruction>
	.word 0xccc7e020  ! 292: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r6
	.word 0x9fa00543  ! 293: FSQRTd	fsqrt	
	.word 0xdf17c000  ! 302: LDQF_R	-	[%r31, %r0], %f15
	.word 0xde8008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x816b2001  ! 308: SDIVX_I	sdivx	%r12, 0x0001, %r0
	.word 0xc127c003  ! 309: STF_R	st	%f0, [%r3, %r31]
	.word 0xc0cfe020  ! 320: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc017c000  ! 324: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc017c000  ! 325: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc08fe000  ! 330: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0x93d02030  ! 331: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xc04fc000  ! 332: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x89a00560  ! 333: FSQRTq	fsqrt	
	.word 0x8d500000  ! 342: RDPR_TPC	rdpr	%tpc, %r6
	.word 0xcccfe000  ! 343: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r6
	mov 0x33, %r30
	.word 0x93d0001e  ! 346: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x9bd0001e  ! 349: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xcde7c020  ! 356: CASA_I	casa	[%r31] 0x 1, %r0, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc47e001  ! 364: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0xcd27e001  ! 365: STF_I	st	%f6, [0x0001, %r31]
	.word 0xccdfe010  ! 366: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r6
	.word 0x8d802004  ! 371: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x32, %r30
	.word 0x83d0001e  ! 374: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 381: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x3e800001  ! 386: BVC	bvc,a	<label_0x1>
	mov 0x31, %r30
	.word 0x9dd0001e  ! 389: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8da189aa  ! 390: FDIVs	fdivs	%f6, %f10, %f6
	.word 0x87802004  ! 391: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xccdfe020  ! 392: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0x8fd02031  ! 393: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x9bd0001e  ! 398: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x89a0c9ab  ! 399: FDIVs	fdivs	%f3, %f11, %f4
	.word 0x8d494000  ! 404: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0xccdfe010  ! 425: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r6
	mov 0x35, %r30
	.word 0x87d0001e  ! 432: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xcc17c000  ! 433: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0xcc880e80  ! 434: LDUBA_R	lduba	[%r0, %r0] 0x74, %r6
	.word 0xccc7e000  ! 435: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	.word 0xcc7fe001  ! 436: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x8ba089e1  ! 439: FDIVq	dis not found

	.word 0x28800001  ! 444: BLEU	bleu,a	<label_0x1>
	mov 0x34, %r30
	.word 0x81d0001e  ! 447: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9ba00561  ! 448: FSQRTq	fsqrt	
	.word 0xda5fc000  ! 449: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x95d02034  ! 454: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x82d16001  ! 463: UMULcc_I	umulcc 	%r5, 0x0001, %r1
	.word 0x88c22001  ! 468: ADDCcc_I	addccc 	%r8, 0x0001, %r4
	.word 0x876ac009  ! 471: SDIVX_R	sdivx	%r11, %r9, %r3
	.word 0x89d02033  ! 474: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0xc68008a0  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc617e001  ! 478: LDUH_I	lduh	[%r31 + 0x0001], %r3
	.word 0xc60fc000  ! 479: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0xc68008a0  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8b6ac00f  ! 487: SDIVX_R	sdivx	%r11, %r15, %r5
	.word 0xca97e000  ! 488: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0xca8008a0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x95d02030  ! 492: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x87802016  ! 495: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xca8008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	mov 0x33, %r30
	.word 0x8fd0001e  ! 497: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xcacfe010  ! 508: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	.word 0x24700001  ! 509: BPLE	<illegal instruction>
	.word 0x9d6ba001  ! 512: SDIVX_I	sdivx	%r14, 0x0001, %r14
	.word 0x80c36001  ! 513: ADDCcc_I	addccc 	%r13, 0x0001, %r0
	mov 0x31, %r30
	.word 0x8bd0001e  ! 516: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc0c7e030  ! 521: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	.word 0xc097e010  ! 522: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0x84012001  ! 523: ADD_I	add 	%r4, 0x0001, %r2
	.word 0xc447c000  ! 526: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x89d02030  ! 527: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	mov 0x33, %r30
	.word 0x9dd0001e  ! 530: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x3e700001  ! 531: BPVC	<illegal instruction>
	.word 0xc447e001  ! 532: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0xc4800bc0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	.word 0x97500000  ! 540: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xd68008a0  ! 547: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd797e001  ! 548: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x9fd02035  ! 549: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x36800001  ! 552: BGE	bge,a	<label_0x1>
	.word 0x8d802000  ! 559: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd63fc00f  ! 568: STD_R	std	%r11, [%r31 + %r15]
	.word 0x8d802000  ! 571: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99d02030  ! 572: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x81a189c7  ! 573: FDIVd	fdivd	%f6, %f38, %f0
	.word 0x97504000  ! 576: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xd657c000  ! 577: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0xd697e010  ! 578: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x24700001  ! 583: BPLE	<illegal instruction>
	.word 0xd65fc000  ! 584: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8cc32001  ! 593: ADDCcc_I	addccc 	%r12, 0x0001, %r6
	.word 0x8d802000  ! 594: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcccfe010  ! 603: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r6
	.word 0x38800001  ! 606: BGU	bgu,a	<label_0x1>
	.word 0xcc77e001  ! 607: STX_I	stx	%r6, [%r31 + 0x0001]
	.word 0xccdfe030  ! 608: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	mov 0x31, %r30
	.word 0x83d0001e  ! 613: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8bd02030  ! 616: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x9fd02030  ! 623: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0xcc8fe030  ! 628: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r6
	.word 0xccbfe001  ! 633: STDA_I	stda	%r6, [%r31 + 0x0001] %asi
	.word 0xcc5fc000  ! 638: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc0fe001  ! 641: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0x8d802004  ! 644: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcc0fe001  ! 649: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0xcc07e001  ! 652: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc5fc000  ! 653: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc07e001  ! 654: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x8483a001  ! 657: ADDcc_I	addcc 	%r14, 0x0001, %r2
	.word 0x87802004  ! 660: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc48008a0  ! 665: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8f480000  ! 668: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	mov 0x33, %r30
	.word 0x99d0001e  ! 669: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 670: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02032  ! 675: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xcec004a0  ! 678: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x91504000  ! 685: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x9f50c000  ! 690: RDPR_TT	rdpr	%tt, %r15
	.word 0x8d802004  ! 695: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97d02032  ! 702: Tcc_I	tge	icc_or_xcc, %r0 + 50
	mov 0x35, %r30
	.word 0x9bd0001e  ! 703: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xdf97e001  ! 706: LDQFA_I	-	[%r31, 0x0001], %f15
	.word 0x36700001  ! 707: BPGE	<illegal instruction>
	.word 0x95a1c9ad  ! 708: FDIVs	fdivs	%f7, %f13, %f10
	.word 0x86d9800c  ! 721: SMULcc_R	smulcc 	%r6, %r12, %r3
	.word 0xc63fc00c  ! 730: STD_R	std	%r3, [%r31 + %r12]
	.word 0x28700001  ! 731: BPLEU	<illegal instruction>
	.word 0x9ed2a001  ! 732: UMULcc_I	umulcc 	%r10, 0x0001, %r15
	.word 0x9a68a001  ! 733: UDIVX_I	udivx 	%r2, 0x0001, %r13
	.word 0xdad00e80  ! 742: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
	.word 0x83d02035  ! 743: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9fd02035  ! 749: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x8bd02031  ! 750: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x8dd0001e  ! 751: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 752: BPPOS	<illegal instruction>
	.word 0xda8008a0  ! 753: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	mov 0x35, %r30
	.word 0x89d0001e  ! 756: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xda07e001  ! 759: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x96d1c006  ! 760: UMULcc_R	umulcc 	%r7, %r6, %r11
	.word 0x91d02030  ! 761: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8fd02033  ! 770: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0xd6d7e030  ! 781: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x8fd02033  ! 784: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x87802080  ! 785: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9151c000  ! 786: RDPR_TL	rdpr	%tl, %r8
	.word 0xd097e030  ! 787: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	.word 0xd0d7e020  ! 788: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	.word 0x91508000  ! 793: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x2c700001  ! 796: BPNEG	<illegal instruction>
	.word 0x896a6001  ! 801: SDIVX_I	sdivx	%r9, 0x0001, %r4
	.word 0x2a700001  ! 802: BPCS	<illegal instruction>
	.word 0x26800001  ! 805: BL	bl,a	<label_0x1>
	mov 0x32, %r30
	.word 0x87d0001e  ! 810: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc8dfe020  ! 811: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r4
	.word 0x36700001  ! 812: BPGE	<illegal instruction>
	.word 0xc817c000  ! 817: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x2a700001  ! 820: BPCS	<illegal instruction>
	.word 0xc897e030  ! 821: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r4
	mov 0x33, %r30
	.word 0x85d0001e  ! 826: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e000  ! 827: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	.word 0xc89004a0  ! 828: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x8bd02031  ! 831: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xc997e001  ! 832: LDQFA_I	-	[%r31, 0x0001], %f4
	.word 0x20800001  ! 835: BN	bn,a	<label_0x1>
	.word 0x9a4be001  ! 836: MULX_I	mulx 	%r15, 0x0001, %r13
	mov 0x32, %r30
	.word 0x9bd0001e  ! 841: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 842: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xda4fe001  ! 847: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0xda800b20  ! 848: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r13
	.word 0x94804000  ! 853: ADDcc_R	addcc 	%r1, %r0, %r10
	.word 0x9151c000  ! 854: RDPR_TL	rdpr	%tl, %r8
	.word 0x93a00566  ! 857: FSQRTq	fsqrt	
	.word 0x8dd02032  ! 858: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x87d02032  ! 859: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x2c700001  ! 862: BPNEG	<illegal instruction>
	.word 0x36700001  ! 863: BPGE	<illegal instruction>
	mov 0x33, %r30
	.word 0x9bd0001e  ! 866: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x90826001  ! 867: ADDcc_I	addcc 	%r9, 0x0001, %r8
	.word 0xd017c000  ! 868: LDUH_R	lduh	[%r31 + %r0], %r8
	mov 0x32, %r30
	.word 0x85d0001e  ! 873: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 876: BPNE	<illegal instruction>
	.word 0xd0900e80  ! 887: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
	.word 0x86796001  ! 896: SDIV_I	sdiv 	%r5, 0x0001, %r3
	.word 0x95a089e5  ! 897: FDIVq	dis not found

	mov 0x31, %r30
	.word 0x91d0001e  ! 900: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd48008a0  ! 901: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd417e001  ! 906: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0x8d802004  ! 907: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 908: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 915: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd517c000  ! 922: LDQF_R	-	[%r31, %r0], %f10
	mov 0x30, %r30
	.word 0x85d0001e  ! 927: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xd40fc000  ! 932: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x22700001  ! 937: BPE	<illegal instruction>
	.word 0x38800001  ! 938: BGU	bgu,a	<label_0x1>
	.word 0x87802088  ! 939: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x22800001  ! 940: BE	be,a	<label_0x1>
	.word 0x904a4001  ! 947: MULX_R	mulx 	%r9, %r1, %r8
	.word 0x26700001  ! 952: BPL	<illegal instruction>
	.word 0x87802088  ! 953: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd04fe001  ! 958: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xd0d7e030  ! 959: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	.word 0xd057c000  ! 964: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x32800001  ! 965: BNE	bne,a	<label_0x1>
	.word 0xd0c7e030  ! 974: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0x98022001  ! 975: ADD_I	add 	%r8, 0x0001, %r12
	.word 0x30800001  ! 978: BA	ba,a	<label_0x1>
	.word 0x93d02034  ! 979: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xd80fe001  ! 982: LDUB_I	ldub	[%r31 + 0x0001], %r12
	mov 0x31, %r30
	.word 0x95d0001e  ! 983: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd897e030  ! 984: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x9950c000  ! 985: RDPR_TT	rdpr	%tt, %r12
	.word 0x8bd02031  ! 986: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	mov 0x31, %r30
	.word 0x91d0001e  ! 989: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 992: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x22800001  ! 993: BE	be,a	<label_0x1>
	.word 0x32700001  ! 998: BPNE	<illegal instruction>
	.word 0xd937e001  ! 999: STQF_I	-	%f12, [0x0001, %r31]
	.word 0xd937c001  ! 1000: STQF_R	-	%f12, [%r1, %r31]
	.word 0xd88fe000  ! 1003: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0xd9e7c021  ! 1004: CASA_I	casa	[%r31] 0x 1, %r1, %r12
	.word 0x9da0056c  ! 1005: FSQRTq	fsqrt	
	.word 0xdc800b40  ! 1012: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r14
	.word 0x87802016  ! 1019: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x89d02030  ! 1020: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0xdd37c00c  ! 1025: STQF_R	-	%f14, [%r12, %r31]
	.word 0xdc07c000  ! 1026: LDUW_R	lduw	[%r31 + %r0], %r14
	.word 0xdcc804a0  ! 1031: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	.word 0x9fd02035  ! 1034: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x9a52c00d  ! 1035: UMUL_R	umul 	%r11, %r13, %r13
	.word 0x3e800001  ! 1038: BVC	bvc,a	<label_0x1>
	.word 0x36700001  ! 1041: BPGE	<illegal instruction>
	.word 0x8bd02031  ! 1042: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xdabfe001  ! 1043: STDA_I	stda	%r13, [%r31 + 0x0001] %asi
	.word 0x8dd02030  ! 1046: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 1047: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x8dd0001e  ! 1054: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x93d0001e  ! 1056: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdaffc02d  ! 1057: SWAPA_R	swapa	%r13, [%r31 + %r13] 0x01
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdb97e001  ! 1065: LDQFA_I	-	[%r31, 0x0001], %f13
	.word 0x34700001  ! 1066: BPG	<illegal instruction>
	.word 0xdb37e001  ! 1069: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8fd02033  ! 1072: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xda27e001  ! 1086: STW_I	stw	%r13, [%r31 + 0x0001]
	mov 0x32, %r30
	.word 0x97d0001e  ! 1087: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x99a0056a  ! 1088: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0xd8dfe000  ! 1090: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	mov 0x30, %r30
	.word 0x91d0001e  ! 1091: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 1092: BVC	bvc,a	<label_0x1>
	mov 0x33, %r30
	.word 0x87d0001e  ! 1099: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd8c7e000  ! 1100: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	.word 0x3a800001  ! 1101: BCC	bcc,a	<label_0x1>
	.word 0xd897e020  ! 1104: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x22700001  ! 1105: BPE	<illegal instruction>
	.word 0xd80fe001  ! 1112: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x8dd02033  ! 1119: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x81d02035  ! 1128: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 1129: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd807e001  ! 1130: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd88fe010  ! 1131: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	.word 0xd80fc000  ! 1132: LDUB_R	ldub	[%r31 + %r0], %r12
	.word 0xd937c00a  ! 1133: STQF_R	-	%f12, [%r10, %r31]
	.word 0x95d02031  ! 1134: Tcc_I	tg	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x9bd0001e  ! 1137: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x8bd0001e  ! 1138: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 1139: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd8ffc02a  ! 1140: SWAPA_R	swapa	%r12, [%r31 + %r10] 0x01
	.word 0xd8cfe010  ! 1141: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0x2a700001  ! 1146: BPCS	<illegal instruction>
	.word 0x9e7ac000  ! 1149: SDIV_R	sdiv 	%r11, %r0, %r15
	.word 0x85480000  ! 1150: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x8d802004  ! 1151: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93494000  ! 1153: RDHPR_HTBA	rdhpr	%htba, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0xd28008a0  ! 1157: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2d004a0  ! 1160: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0xd327c000  ! 1161: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2d7e020  ! 1162: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r9
	.word 0x8d802000  ! 1163: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd327c000  ! 1166: STF_R	st	%f9, [%r0, %r31]
	.word 0x22800001  ! 1167: BE	be,a	<label_0x1>
	.word 0xd327c000  ! 1168: STF_R	st	%f9, [%r0, %r31]
	.word 0xd317c000  ! 1171: LDQF_R	-	[%r31, %r0], %f9
	.word 0x8d802000  ! 1172: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x38800001  ! 1175: BGU	bgu,a	<label_0x1>
	mov 0x31, %r30
	.word 0x89d0001e  ! 1182: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 1183: BN	bn,a	<label_0x1>
	.word 0xd2d7e000  ! 1188: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r9
	mov 0x30, %r30
	.word 0x97d0001e  ! 1189: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8e49a001  ! 1198: MULX_I	mulx 	%r6, 0x0001, %r7
	.word 0x9401e001  ! 1201: ADD_I	add 	%r7, 0x0001, %r10
	.word 0x2c800001  ! 1202: BNEG	bneg,a	<label_0x1>
	.word 0xd4d7e030  ! 1203: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	mov 0x35, %r30
	.word 0x83d0001e  ! 1204: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 1207: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xd4d7e020  ! 1208: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4cfe010  ! 1213: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
	mov 0x32, %r30
	.word 0x89d0001e  ! 1216: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x97d0001e  ! 1217: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x85d02030  ! 1218: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x8dd02031  ! 1221: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x3a700001  ! 1226: BPCC	<illegal instruction>
	.word 0x8dd02030  ! 1227: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x97d0001e  ! 1229: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x89d0001e  ! 1230: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd4880e60  ! 1233: LDUBA_R	lduba	[%r0, %r0] 0x73, %r10
	.word 0x8d802000  ! 1234: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x32, %r30
	.word 0x95d0001e  ! 1235: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8ed8400f  ! 1236: SMULcc_R	smulcc 	%r1, %r15, %r7
	.word 0x99d02031  ! 1241: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x81d02031  ! 1244: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0x87802080  ! 1249: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xce4fc000  ! 1256: LDSB_R	ldsb	[%r31 + %r0], %r7
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1257: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8253c001  ! 1260: UMUL_R	umul 	%r15, %r1, %r1
	.word 0xc27fe001  ! 1261: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0xc397e001  ! 1262: LDQFA_I	-	[%r31, 0x0001], %f1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2d7e000  ! 1270: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	mov 0x34, %r30
	.word 0x83d0001e  ! 1271: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 1274: BLE	ble,a	<label_0x1>
	mov 0x35, %r30
	.word 0x97d0001e  ! 1275: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x85d02034  ! 1276: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x8cd28002  ! 1279: UMULcc_R	umulcc 	%r10, %r2, %r6
	.word 0xcc57c000  ! 1280: LDSH_R	ldsh	[%r31 + %r0], %r6
	.word 0x9480a001  ! 1281: ADDcc_I	addcc 	%r2, 0x0001, %r10
	.word 0xd4d7e030  ! 1282: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0x97698004  ! 1283: SDIVX_R	sdivx	%r6, %r4, %r11
	.word 0x87802014  ! 1284: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd657c000  ! 1285: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x3e700001  ! 1292: BPVC	<illegal instruction>
	.word 0x9c528004  ! 1293: UMUL_R	umul 	%r10, %r4, %r14
	mov 0x30, %r30
	.word 0x91d0001e  ! 1304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x34700001  ! 1309: BPG	<illegal instruction>
	.word 0xdc57e001  ! 1312: LDSH_I	ldsh	[%r31 + 0x0001], %r14
	.word 0x34700001  ! 1313: BPG	<illegal instruction>
	.word 0x97d02032  ! 1316: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x87802080  ! 1317: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xdc3fe001  ! 1318: STD_I	std	%r14, [%r31 + 0x0001]
	.word 0xdc97e000  ! 1319: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r14
	.word 0xdc97e020  ! 1320: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r14
	.word 0xdc97e000  ! 1321: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r14
	.word 0x93a00542  ! 1324: FSQRTd	fsqrt	
	.word 0xd27fe001  ! 1329: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0x8d802000  ! 1332: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9dd02035  ! 1339: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0xd327c002  ! 1344: STF_R	st	%f9, [%r2, %r31]
	.word 0x87802004  ! 1347: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9ba0c9cf  ! 1352: FDIVd	fdivd	%f34, %f46, %f44
	mov 0x34, %r30
	.word 0x95d0001e  ! 1357: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x87d0001e  ! 1358: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 1359: BCS	bcs,a	<label_0x1>
	.word 0x34700001  ! 1360: BPG	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87d02033  ! 1372: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x87802010  ! 1373: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xdac7e000  ! 1374: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0xda4fc000  ! 1377: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0xda8008a0  ! 1378: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x9e784008  ! 1381: SDIV_R	sdiv 	%r1, %r8, %r15
	.word 0xdebfe001  ! 1384: STDA_I	stda	%r15, [%r31 + 0x0001] %asi
	.word 0x8c016001  ! 1385: ADD_I	add 	%r5, 0x0001, %r6
	.word 0x8d802000  ! 1388: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02032  ! 1389: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xcc8fe000  ! 1392: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 1396: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 1399: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc0fe001  ! 1400: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0xcc5fc000  ! 1401: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x85d02033  ! 1402: Tcc_I	tle	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x9dd0001e  ! 1403: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xcc8008a0  ! 1412: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x24800001  ! 1415: BLE	ble,a	<label_0x1>
	mov 0x32, %r30
	.word 0x83d0001e  ! 1416: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xcc57e001  ! 1423: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	mov 0x30, %r30
	.word 0x95d0001e  ! 1436: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 1441: BLEU	bleu,a	<label_0x1>
	.word 0x91d02031  ! 1442: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x896b8001  ! 1447: SDIVX_R	sdivx	%r14, %r1, %r4
	.word 0xc857e001  ! 1448: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	mov 0x34, %r30
	.word 0x85d0001e  ! 1451: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8dd02032  ! 1456: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 1458: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f514000  ! 1459: RDPR_TBA	rdpr	%tba, %r7
	.word 0xce17c000  ! 1460: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x9fd02034  ! 1463: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 1473: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce17c000  ! 1476: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xce8008a0  ! 1477: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce3fc001  ! 1480: STD_R	std	%r7, [%r31 + %r1]
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1481: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x91d0001e  ! 1482: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87d02034  ! 1485: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0xcfe7c021  ! 1490: CASA_I	casa	[%r31] 0x 1, %r1, %r7
	mov 0x35, %r30
	.word 0x83d0001e  ! 1491: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xce17c000  ! 1492: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xce07e001  ! 1495: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x8dd02030  ! 1500: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x95d02033  ! 1501: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0xcedfe000  ! 1508: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0xce8008a0  ! 1509: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x876a0005  ! 1512: SDIVX_R	sdivx	%r8, %r5, %r3
	.word 0x9b51c000  ! 1515: RDPR_TL	rdpr	%tl, %r13
	.word 0xda4fe001  ! 1518: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0xda5fe001  ! 1523: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0xdaffc025  ! 1524: SWAPA_R	swapa	%r13, [%r31 + %r5] 0x01
	.word 0x95688001  ! 1531: SDIVX_R	sdivx	%r2, %r1, %r10
	.word 0x99d02034  ! 1534: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0xd4d7e000  ! 1537: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	mov 0x30, %r30
	.word 0x91d0001e  ! 1542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd40fe001  ! 1543: LDUB_I	ldub	[%r31 + 0x0001], %r10
	mov 0x33, %r30
	.word 0x87d0001e  ! 1544: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd597e001  ! 1545: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x8bd02032  ! 1546: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x30700001  ! 1547: BPA	<illegal instruction>
	mov 0x31, %r30
	.word 0x85d0001e  ! 1552: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x87d0001e  ! 1553: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x81a349e7  ! 1554: FDIVq	dis not found

	.word 0x28700001  ! 1559: BPLEU	<illegal instruction>
	.word 0xc00fc000  ! 1560: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x2c700001  ! 1561: BPNEG	<illegal instruction>
	.word 0xc127c007  ! 1562: STF_R	st	%f0, [%r7, %r31]
	.word 0x81a0056a  ! 1563: FSQRTq	fsqrt	
	.word 0xc0c7e030  ! 1566: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	.word 0x87802010  ! 1569: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x89a2c9eb  ! 1570: FDIVq	dis not found

	.word 0x827b6001  ! 1571: SDIV_I	sdiv 	%r13, 0x0001, %r1
	.word 0xc2d804a0  ! 1574: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0xc207c000  ! 1579: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0x2e700001  ! 1586: BPVS	<illegal instruction>
	.word 0x91d02032  ! 1589: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc247c000  ! 1590: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0xc28804a0  ! 1595: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0xc20fc000  ! 1606: LDUB_R	ldub	[%r31 + %r0], %r1
	.word 0x91d02033  ! 1609: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc28008a0  ! 1612: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	mov 0x34, %r30
	.word 0x91d0001e  ! 1613: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1614: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2cfe000  ! 1622: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0x20800001  ! 1623: BN	bn,a	<label_0x1>
	.word 0x87802004  ! 1624: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x3a800001  ! 1625: BCC	bcc,a	<label_0x1>
	.word 0xc397e001  ! 1632: LDQFA_I	-	[%r31, 0x0001], %f1
	.word 0xc2c7e020  ! 1633: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0x2e800001  ! 1634: BVS	bvs,a	<label_0x1>
	.word 0xc2d00e80  ! 1635: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r1
	.word 0x87a00561  ! 1640: FSQRTq	fsqrt	
	.word 0x97d02031  ! 1641: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0xc62fc001  ! 1642: STB_R	stb	%r3, [%r31 + %r1]
	.word 0x22700001  ! 1645: BPE	<illegal instruction>
	.word 0xc6d004a0  ! 1646: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0xc6c7e030  ! 1647: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r3
	.word 0xc68008a0  ! 1648: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc697e000  ! 1649: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	.word 0x91a0c9c4  ! 1652: FDIVd	fdivd	%f34, %f4, %f8
	.word 0x28800001  ! 1657: BLEU	bleu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99d02035  ! 1663: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0xd08008a0  ! 1666: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0c7e000  ! 1667: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	.word 0xd08008a0  ! 1670: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x89a349ef  ! 1671: FDIVq	dis not found

	.word 0xc80fc000  ! 1674: LDUB_R	ldub	[%r31 + %r0], %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc857e001  ! 1682: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x30800001  ! 1683: BA	ba,a	<label_0x1>
	mov 0x30, %r30
	.word 0x81d0001e  ! 1688: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 1693: BNE	bne,a	<label_0x1>
	.word 0x9dd02033  ! 1694: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x2c700001  ! 1697: BPNEG	<illegal instruction>
	.word 0xc8d7e030  ! 1698: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r4
	.word 0xc8d7e020  ! 1699: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	.word 0x8d50c000  ! 1714: RDPR_TT	rdpr	%tt, %r6
	.word 0xcc8fe000  ! 1715: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
	.word 0x8d802004  ! 1716: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x34, %r30
	.word 0x87d0001e  ! 1719: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xcc8008a0  ! 1720: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	mov 0x31, %r30
	.word 0x9bd0001e  ! 1723: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8c6a0005  ! 1726: UDIVX_R	udivx 	%r8, %r5, %r6
	mov 0x30, %r30
	.word 0x89d0001e  ! 1731: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xcc8fe010  ! 1732: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	.word 0xcc47e001  ! 1733: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99d02034  ! 1743: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0xccdfe020  ! 1744: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 1750: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc800be0  ! 1751: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r6
	.word 0xcc17e001  ! 1754: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0xcc07c000  ! 1757: LDUW_R	lduw	[%r31 + %r0], %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x30700001  ! 1759: BPA	<illegal instruction>
	.word 0xcc8fe020  ! 1766: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r6
	.word 0xcd27e001  ! 1775: STF_I	st	%f6, [0x0001, %r31]
	.word 0xcccfe000  ! 1784: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r6
	.word 0x38700001  ! 1787: BPGU	<illegal instruction>
	.word 0x8bd02031  ! 1788: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xcc4fe001  ! 1791: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	mov 0x34, %r30
	.word 0x9bd0001e  ! 1792: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x94d12001  ! 1797: UMULcc_I	umulcc 	%r4, 0x0001, %r10
	.word 0xd517c000  ! 1798: LDQF_R	-	[%r31, %r0], %f10
	.word 0x91d02035  ! 1803: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x26800001  ! 1804: BL	bl,a	<label_0x1>
	.word 0xd417c000  ! 1805: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x93d02033  ! 1806: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d802004  ! 1809: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd517c000  ! 1814: LDQF_R	-	[%r31, %r0], %f10
	.word 0xd417c000  ! 1819: LDUH_R	lduh	[%r31 + %r0], %r10
	mov 0x35, %r30
	.word 0x9bd0001e  ! 1820: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd45fe001  ! 1821: LDX_I	ldx	[%r31 + 0x0001], %r10
	.word 0xd537e001  ! 1822: STQF_I	-	%f10, [0x0001, %r31]
	mov 0x30, %r30
	.word 0x8dd0001e  ! 1823: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x90d0000a  ! 1828: UMULcc_R	umulcc 	%r0, %r10, %r8
	.word 0x22800001  ! 1829: BE	be,a	<label_0x1>
	.word 0xd0dfe020  ! 1834: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0xd0800ba0  ! 1837: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r8
	mov 0x32, %r30
	.word 0x93d0001e  ! 1842: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd117c000  ! 1843: LDQF_R	-	[%r31, %r0], %f8
	.word 0xd08008a0  ! 1848: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd117c000  ! 1849: LDQF_R	-	[%r31, %r0], %f8
	.word 0xd047e001  ! 1852: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x8dd02032  ! 1859: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	mov 0x33, %r30
	.word 0x89d0001e  ! 1862: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd0dfe010  ! 1865: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0xd097e020  ! 1870: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0xd0cfe020  ! 1879: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
	.word 0xd0cfe000  ! 1880: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	.word 0xd0dfe010  ! 1883: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0x8bd02031  ! 1894: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0x30700001  ! 1895: BPA	<illegal instruction>
	mov 0x32, %r30
	.word 0x8dd0001e  ! 1896: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x81d0001e  ! 1899: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1900: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd0800ac0  ! 1904: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1905: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd00fe001  ! 1910: LDUB_I	ldub	[%r31 + 0x0001], %r8
	.word 0x36800001  ! 1911: BGE	bge,a	<label_0x1>
	.word 0x85500000  ! 1912: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x85d02033  ! 1915: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x806b8007  ! 1920: UDIVX_R	udivx 	%r14, %r7, %r0
	.word 0xc0c7e010  ! 1925: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0xc05fe001  ! 1930: LDX_I	ldx	[%r31 + 0x0001], %r0
	mov 0x30, %r30
	.word 0x81d0001e  ! 1935: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc00fe001  ! 1936: LDUB_I	ldub	[%r31 + 0x0001], %r0
	.word 0xc057c000  ! 1939: LDSH_R	ldsh	[%r31 + %r0], %r0
	.word 0x8d802000  ! 1942: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x26700001  ! 1947: BPL	<illegal instruction>
	.word 0x32800001  ! 1948: BNE	bne,a	<label_0x1>
	.word 0x85d02035  ! 1949: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x8bd02030  ! 1950: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0xc0d7e000  ! 1951: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r0
	.word 0xc0d7e020  ! 1954: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	.word 0xc0c7e000  ! 1957: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0x8dd02033  ! 1960: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x8551c000  ! 1963: RDPR_TL	rdpr	%tl, %r2
	.word 0xc517c000  ! 1974: LDQF_R	-	[%r31, %r0], %f2
	.word 0xc48008a0  ! 1975: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x9dd02031  ! 1980: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x3c800001  ! 1985: BPOS	bpos,a	<label_0x1>
	.word 0xc4d7e000  ! 1986: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0x8481a001  ! 1989: ADDcc_I	addcc 	%r6, 0x0001, %r2
	.word 0xc48fe000  ! 1990: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r2
	.word 0x30800001  ! 1991: BA	ba,a	<label_0x1>
	.word 0xc4cfe010  ! 1992: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	.word 0xc457e001  ! 1993: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0xc4cfe000  ! 1994: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0xc43fc007  ! 2003: STD_R	std	%r2, [%r31 + %r7]
	mov 0x30, %r30
	.word 0x85d0001e  ! 2008: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x996b6001  ! 2009: SDIVX_I	sdivx	%r13, 0x0001, %r12
	.word 0x8f696001  ! 2026: SDIVX_I	sdivx	%r5, 0x0001, %r7
	.word 0x8d802000  ! 2029: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcec804a0  ! 2030: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0xce800bc0  ! 2037: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r7
	.word 0xce27c007  ! 2044: STW_R	stw	%r7, [%r31 + %r7]
	mov 0x31, %r30
	.word 0x83d0001e  ! 2045: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x95d02034  ! 2048: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x83a089aa  ! 2051: FDIVs	fdivs	%f2, %f10, %f1
	.word 0x36800001  ! 2052: BGE	bge,a	<label_0x1>
	.word 0xc337c00a  ! 2053: STQF_R	-	%f1, [%r10, %r31]
	.word 0xc2c7e000  ! 2064: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	.word 0x85d02035  ! 2065: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x87802004  ! 2068: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x30800001  ! 2069: BA	ba,a	<label_0x1>
	.word 0x3e800001  ! 2072: BVC	bvc,a	<label_0x1>
	.word 0xc2cfe000  ! 2073: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	mov 0x32, %r30
	.word 0x9fd0001e  ! 2074: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x806b4009  ! 2077: UDIVX_R	udivx 	%r13, %r9, %r0
	.word 0x8d802004  ! 2078: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc0800b80  ! 2081: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r0
	.word 0xc0cfe010  ! 2082: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0x90d0c00d  ! 2083: UMULcc_R	umulcc 	%r3, %r13, %r8
	.word 0xd08008a0  ! 2088: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	mov 0x35, %r30
	.word 0x99d0001e  ! 2093: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x85d02034  ! 2094: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x3c800001  ! 2095: BPOS	bpos,a	<label_0x1>
	.word 0xd05fc000  ! 2100: LDX_R	ldx	[%r31 + %r0], %r8
	mov 0x34, %r30
	.word 0x99d0001e  ! 2101: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd0ffc02d  ! 2102: SWAPA_R	swapa	%r8, [%r31 + %r13] 0x01
	.word 0x3a800001  ! 2107: BCC	bcc,a	<label_0x1>
	.word 0xd05fc000  ! 2112: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x9dd02031  ! 2121: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 2122: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89d02030  ! 2123: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0xd0ffc02d  ! 2126: SWAPA_R	swapa	%r8, [%r31 + %r13] 0x01
	.word 0x28700001  ! 2127: BPLEU	<illegal instruction>
	mov 0x34, %r30
	.word 0x9bd0001e  ! 2128: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd0c7e030  ! 2130: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0xd0800bc0  ! 2133: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
	.word 0x90c1e001  ! 2134: ADDCcc_I	addccc 	%r7, 0x0001, %r8
	.word 0x38700001  ! 2137: BPGU	<illegal instruction>
	.word 0xd007e001  ! 2138: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd0c7e020  ! 2141: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0x8cd32001  ! 2142: UMULcc_I	umulcc 	%r12, 0x0001, %r6
	.word 0x8d802004  ! 2143: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x32, %r30
	.word 0x8fd0001e  ! 2146: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9ac26001  ! 2151: ADDCcc_I	addccc 	%r9, 0x0001, %r13
	.word 0xdad7e000  ! 2152: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0x81d02030  ! 2155: Tcc_I	tn	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x32700001  ! 2161: BPNE	<illegal instruction>
	.word 0x89d02030  ! 2162: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x91d02032  ! 2167: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x24700001  ! 2172: BPLE	<illegal instruction>
	.word 0x8dd02035  ! 2175: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xda97e010  ! 2183: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0xda07c000  ! 2186: LDUW_R	lduw	[%r31 + %r0], %r13
	mov 0x30, %r30
	.word 0x9fd0001e  ! 2191: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3e800001  ! 2199: BVC	bvc,a	<label_0x1>
	mov 0x34, %r30
	.word 0x95d0001e  ! 2200: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 2205: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x824a4003  ! 2209: MULX_R	mulx 	%r9, %r3, %r1
	mov 0x35, %r30
	.word 0x89d0001e  ! 2210: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc25fc000  ! 2211: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc2c7e020  ! 2214: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0xc28fe030  ! 2215: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	.word 0xc24fe001  ! 2218: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0xc397e001  ! 2221: LDQFA_I	-	[%r31, 0x0001], %f1
	.word 0x81d02030  ! 2222: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x9478a001  ! 2225: SDIV_I	sdiv 	%r2, 0x0001, %r10
	.word 0xd44fe001  ! 2230: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0xd45fc000  ! 2232: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802080  ! 2233: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802080  ! 2235: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81d02032  ! 2236: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x89504000  ! 2237: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0xc927e001  ! 2238: STF_I	st	%f4, [0x0001, %r31]
	.word 0x8d802000  ! 2245: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8c53c00c  ! 2248: UMUL_R	umul 	%r15, %r12, %r6
	.word 0x8dd02034  ! 2249: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x8d802004  ! 2250: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcc17e001  ! 2251: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0xccd7e030  ! 2254: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	mov 0x33, %r30
	.word 0x89d0001e  ! 2257: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9dd02035  ! 2260: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x824ba001  ! 2263: MULX_I	mulx 	%r14, 0x0001, %r1
	.word 0x9dd02034  ! 2264: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	mov 0x32, %r30
	.word 0x83d0001e  ! 2265: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc2c804a0  ! 2266: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0x8253800c  ! 2271: UMUL_R	umul 	%r14, %r12, %r1
	.word 0x8d802000  ! 2274: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc2d7e020  ! 2275: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	mov 0x33, %r30
	.word 0x99d0001e  ! 2286: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8fd02032  ! 2287: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0xc2ffc02c  ! 2290: SWAPA_R	swapa	%r1, [%r31 + %r12] 0x01
	mov 0x33, %r30
	.word 0x8bd0001e  ! 2293: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc217c000  ! 2294: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x87802004  ! 2295: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc2c7e020  ! 2296: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0xc20fe001  ! 2303: LDUB_I	ldub	[%r31 + 0x0001], %r1
	mov 0x33, %r30
	.word 0x9dd0001e  ! 2304: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xc337e001  ! 2307: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x9d480000  ! 2310: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x32800001  ! 2326: BNE	bne,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9fd02030  ! 2328: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0xdd37c00c  ! 2329: STQF_R	-	%f14, [%r12, %r31]
	.word 0x98508000  ! 2330: UMUL_R	umul 	%r2, %r0, %r12
	.word 0x24700001  ! 2331: BPLE	<illegal instruction>
	.word 0xd84fe001  ! 2338: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	mov 0x31, %r30
	.word 0x81d0001e  ! 2339: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xd8800a60  ! 2340: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
	.word 0x86d1c008  ! 2353: UMULcc_R	umulcc 	%r7, %r8, %r3
	.word 0x97d02031  ! 2354: Tcc_I	tge	icc_or_xcc, %r0 + 49
	mov 0x31, %r30
	.word 0x8dd0001e  ! 2355: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x85d0001e  ! 2356: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02034  ! 2364: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x2a800001  ! 2365: BCS	bcs,a	<label_0x1>
	.word 0xc6d7e020  ! 2366: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0x34800001  ! 2367: BG	bg,a	<label_0x1>
	.word 0x8d802000  ! 2368: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9cd16001  ! 2371: UMULcc_I	umulcc 	%r5, 0x0001, %r14
	.word 0x8fa0054a  ! 2376: FSQRTd	fsqrt	
	.word 0xcf17c000  ! 2379: LDQF_R	-	[%r31, %r0], %f7
	.word 0x9dd02032  ! 2380: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0xce07c000  ! 2385: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0x80782001  ! 2386: SDIV_I	sdiv 	%r0, 0x0001, %r0
	.word 0x8d692001  ! 2393: SDIVX_I	sdivx	%r4, 0x0001, %r6
	.word 0x89d02034  ! 2394: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 2397: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc8008a0  ! 2398: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x9602e001  ! 2401: ADD_I	add 	%r11, 0x0001, %r11
	.word 0x9bd02035  ! 2426: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xd63fe001  ! 2427: STD_I	std	%r11, [%r31 + 0x0001]
	.word 0xd737e001  ! 2428: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x2e800001  ! 2429: BVS	bvs,a	<label_0x1>
	.word 0x94802001  ! 2430: ADDcc_I	addcc 	%r0, 0x0001, %r10
	.word 0x22700001  ! 2431: BPE	<illegal instruction>
	mov 0x30, %r30
	.word 0x91d0001e  ! 2438: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 2439: BNE	bne,a	<label_0x1>
	mov 0x35, %r30
	.word 0x9bd0001e  ! 2440: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd4dfe030  ! 2445: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x9ec22001  ! 2446: ADDCcc_I	addccc 	%r8, 0x0001, %r15
	.word 0xded7e030  ! 2447: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r15
	.word 0xde07c000  ! 2448: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0x8dd02030  ! 2449: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0xde47e001  ! 2463: LDSW_I	ldsw	[%r31 + 0x0001], %r15
	.word 0x95d02035  ! 2470: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x82500003  ! 2475: UMUL_R	umul 	%r0, %r3, %r1
	.word 0xc2dfe020  ! 2482: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r1
	.word 0xc2d804a0  ! 2489: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0xc23fc003  ! 2492: STD_R	std	%r1, [%r31 + %r3]
	.word 0xc28008a0  ! 2493: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc28008a0  ! 2498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2cfe020  ! 2505: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r1
	.word 0x24700001  ! 2506: BPLE	<illegal instruction>
	mov 0x32, %r30
	.word 0x99d0001e  ! 2509: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xc2c7e000  ! 2510: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	.word 0xc217c000  ! 2511: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x87a049af  ! 2512: FDIVs	fdivs	%f1, %f15, %f3
	.word 0xc64fe001  ! 2515: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	mov 0x30, %r30
	.word 0x93d0001e  ! 2518: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc617c000  ! 2519: LDUH_R	lduh	[%r31 + %r0], %r3
	.word 0xc6880e40  ! 2520: LDUBA_R	lduba	[%r0, %r0] 0x72, %r3
	mov 0x35, %r30
	.word 0x87d0001e  ! 2527: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc727e001  ! 2528: STF_I	st	%f3, [0x0001, %r31]
	.word 0x8550c000  ! 2531: RDPR_TT	rdpr	%tt, %r2
	.word 0x85d02035  ! 2532: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xc537c00f  ! 2535: STQF_R	-	%f2, [%r15, %r31]
	.word 0xc417e001  ! 2540: LDUH_I	lduh	[%r31 + 0x0001], %r2
	mov 0x34, %r30
	.word 0x95d0001e  ! 2541: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 2542: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9550c000  ! 2545: RDPR_TT	rdpr	%tt, %r10
	.word 0x28700001  ! 2546: BPLEU	<illegal instruction>
	mov 0x33, %r30
	.word 0x9fd0001e  ! 2551: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd48008a0  ! 2553: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87802089  ! 2564: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81d02032  ! 2565: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xd527e001  ! 2566: STF_I	st	%f10, [0x0001, %r31]
	mov 0x30, %r30
	.word 0x97d0001e  ! 2571: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x8fd0001e  ! 2576: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xd48804a0  ! 2577: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x3c700001  ! 2580: BPPOS	<illegal instruction>
	.word 0xd4c80e60  ! 2593: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0xd43fc00f  ! 2594: STD_R	std	%r10, [%r31 + %r15]
	mov 0x30, %r30
	.word 0x8bd0001e  ! 2601: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x9fd0001e  ! 2602: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9d51c000  ! 2611: RDPR_TL	rdpr	%tl, %r14
	.word 0x8d802004  ! 2612: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 2613: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdcdfe030  ! 2616: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r14
	.word 0xdc8008a0  ! 2617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x90d8400f  ! 2618: SMULcc_R	smulcc 	%r1, %r15, %r8
	mov 0x30, %r30
	.word 0x93d0001e  ! 2619: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd08804a0  ! 2620: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	mov 0x34, %r30
	.word 0x8dd0001e  ! 2629: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x93d0001e  ! 2636: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x85d0001e  ! 2641: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 2644: BL	bl,a	<label_0x1>
	.word 0x87802004  ! 2645: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x30, %r30
	.word 0x99d0001e  ! 2650: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d514000  ! 2651: RDPR_TBA	rdpr	%tba, %r6
	.word 0x9083e001  ! 2652: ADDcc_I	addcc 	%r15, 0x0001, %r8
	.word 0xd05fc000  ! 2659: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x906ac00b  ! 2660: UDIVX_R	udivx 	%r11, %r11, %r8
	mov 0x32, %r30
	.word 0x9dd0001e  ! 2661: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xd017c000  ! 2662: LDUH_R	lduh	[%r31 + %r0], %r8
	.word 0x2a700001  ! 2663: BPCS	<illegal instruction>
	.word 0xd127e001  ! 2666: STF_I	st	%f8, [0x0001, %r31]
	.word 0xd047e001  ! 2667: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0xd007c000  ! 2670: LDUW_R	lduw	[%r31 + %r0], %r8
	.word 0x9c68e001  ! 2671: UDIVX_I	udivx 	%r3, 0x0001, %r14
	.word 0x8d802004  ! 2672: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdc07c000  ! 2675: LDUW_R	lduw	[%r31 + %r0], %r14
	.word 0xdd37c00b  ! 2678: STQF_R	-	%f14, [%r11, %r31]
	.word 0xdc4fe001  ! 2679: LDSB_I	ldsb	[%r31 + 0x0001], %r14
	.word 0x87d02031  ! 2680: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xdcd7e000  ! 2681: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdd37c00b  ! 2685: STQF_R	-	%f14, [%r11, %r31]
	.word 0x97a00563  ! 2704: FSQRTq	fsqrt	
	.word 0xd64fc000  ! 2707: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0x9e006001  ! 2708: ADD_I	add 	%r1, 0x0001, %r15
	.word 0xdf37e001  ! 2719: STQF_I	-	%f15, [0x0001, %r31]
	.word 0xdf27c003  ! 2720: STF_R	st	%f15, [%r3, %r31]
	.word 0xded004a0  ! 2721: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	.word 0x8bd02035  ! 2722: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0xded7e000  ! 2727: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r15
	.word 0xde8008a0  ! 2732: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	mov 0x34, %r30
	.word 0x93d0001e  ! 2733: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x83d0001e  ! 2734: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xde17e001  ! 2735: LDUH_I	lduh	[%r31 + 0x0001], %r15
	mov 0x31, %r30
	.word 0x8dd0001e  ! 2740: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2741: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9dd02034  ! 2744: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xde4fe001  ! 2745: LDSB_I	ldsb	[%r31 + 0x0001], %r15
	.word 0x9551c000  ! 2746: RDPR_TL	rdpr	%tl, %r10
	.word 0x8d802004  ! 2747: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd45fc000  ! 2748: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4d004a0  ! 2751: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xd4ffc023  ! 2754: SWAPA_R	swapa	%r10, [%r31 + %r3] 0x01
	.word 0x3c700001  ! 2761: BPPOS	<illegal instruction>
	.word 0xd4880e40  ! 2762: LDUBA_R	lduba	[%r0, %r0] 0x72, %r10
	.word 0x87802010  ! 2763: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x30, %r30
	.word 0x9bd0001e  ! 2767: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2780: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4d7e000  ! 2788: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd48008a0  ! 2789: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x3e700001  ! 2792: BPVC	<illegal instruction>
	mov 0x33, %r30
	.word 0x9bd0001e  ! 2793: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x3a700001  ! 2798: BPCC	<illegal instruction>
	.word 0xd4800a60  ! 2801: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
	.word 0xd427c003  ! 2802: STW_R	stw	%r10, [%r31 + %r3]
	.word 0xd44fe001  ! 2805: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x90d02001  ! 2810: UMULcc_I	umulcc 	%r0, 0x0001, %r8
	.word 0x8449c00b  ! 2811: MULX_R	mulx 	%r7, %r11, %r2
	mov 0x34, %r30
	.word 0x91d0001e  ! 2818: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4d7e000  ! 2821: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0x87d02031  ! 2822: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xc48fe020  ! 2823: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	.word 0x20700001  ! 2826: BPN	<illegal instruction>
	.word 0xc4d7e010  ! 2827: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r2
	.word 0xc48fe030  ! 2828: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x85d02031  ! 2832: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xc48fe020  ! 2833: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	mov 0x32, %r30
	.word 0x83d0001e  ! 2838: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x95514000  ! 2841: RDPR_TBA	rdpr	%tba, %r10
	.word 0xd457c000  ! 2842: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0x8d802000  ! 2843: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd537e001  ! 2848: STQF_I	-	%f10, [0x0001, %r31]
	.word 0xd4d7e030  ! 2863: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0xd45fc000  ! 2864: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x20800001  ! 2865: BN	bn,a	<label_0x1>
	.word 0x89d02035  ! 2870: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x95d02035  ! 2871: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x9350c000  ! 2874: RDPR_TT	rdpr	%tt, %r9
	.word 0x8fd02031  ! 2875: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0x8b500000  ! 2876: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x8d6a2001  ! 2879: SDIVX_I	sdivx	%r8, 0x0001, %r6
	.word 0x2c700001  ! 2888: BPNEG	<illegal instruction>
	.word 0x85480000  ! 2889: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0xc527e001  ! 2890: STF_I	st	%f2, [0x0001, %r31]
	.word 0x95d02033  ! 2891: Tcc_I	tg	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x34800001  ! 2895: BG	bg,a	<label_0x1>
	.word 0xc4dfe020  ! 2896: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	ta	T_CHANGE_PRIV	! macro
	mov 0x34, %r30
	.word 0x97d0001e  ! 2898: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81514000  ! 2901: RDPR_TBA	rdpr	%tba, %r0
	.word 0x9fa3c9ad  ! 2908: FDIVs	fdivs	%f15, %f13, %f15
	.word 0xde800c00  ! 2909: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r15
	.word 0x93d02030  ! 2912: Tcc_I	tne	icc_or_xcc, %r0 + 48
	mov 0x35, %r30
	.word 0x97d0001e  ! 2919: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xde8fe020  ! 2920: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r15
	mov 0x33, %r30
	.word 0x8dd0001e  ! 2925: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x9bd02032  ! 2926: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	mov 0x30, %r30
	.word 0x87d0001e  ! 2929: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x8bd0001e  ! 2930: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xdecfe020  ! 2933: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0x34700001  ! 2936: BPG	<illegal instruction>
	.word 0x8d802004  ! 2939: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x34800001  ! 2940: BG	bg,a	<label_0x1>
	.word 0x8bd02030  ! 2953: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0xde27c00d  ! 2954: STW_R	stw	%r15, [%r31 + %r13]
	.word 0x81508000  ! 2955: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0xc08fe030  ! 2960: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r0
	.word 0xc0800ae0  ! 2965: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r0
	.word 0x99d02031  ! 2972: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x83480000  ! 2973: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x83d02034  ! 2974: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc217c000  ! 2977: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x36700001  ! 2986: BPGE	<illegal instruction>
	.word 0xc2c004a0  ! 2991: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0x8d802000  ! 2992: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc327e001  ! 2993: STF_I	st	%f1, [0x0001, %r31]
	.word 0x8fd02034  ! 2994: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x89a0c9e4  ! 3001: FDIVq	dis not found

	.word 0xc897e020  ! 3002: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r4
	.word 0xc9e7c024  ! 3003: CASA_I	casa	[%r31] 0x 1, %r4, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a0054a  ! 3009: FSQRTd	fsqrt	
	.word 0xc8c7e010  ! 3010: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
	mov 0x30, %r30
	.word 0x83d0001e  ! 3013: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8fd0001e  ! 3014: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 3015: BNE	bne,a	<label_0x1>
	.word 0x87802080  ! 3020: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02033  ! 3021: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc88fe010  ! 3022: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r4
	.word 0xc807c000  ! 3023: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0xc80fe001  ! 3026: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0xc847e001  ! 3029: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0xc8cfe010  ! 3032: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc937e001  ! 3034: STQF_I	-	%f4, [0x0001, %r31]
	.word 0xc897e010  ! 3041: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	.word 0x34800001  ! 3044: BG	bg,a	<label_0x1>
	.word 0xc8dfe020  ! 3045: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r4
	.word 0xc85fe001  ! 3046: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0x99d02031  ! 3049: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x80d8000d  ! 3050: SMULcc_R	smulcc 	%r0, %r13, %r0
	.word 0x34800001  ! 3053: BG	bg,a	<label_0x1>
	mov 0x31, %r30
	.word 0x99d0001e  ! 3056: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 3057: BA	ba,a	<label_0x1>
	mov 0x33, %r30
	.word 0x9dd0001e  ! 3058: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x30700001  ! 3072: BPA	<illegal instruction>
	mov 0x32, %r30
	.word 0x87d0001e  ! 3077: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc127e001  ! 3078: STF_I	st	%f0, [0x0001, %r31]
	.word 0xc017c000  ! 3079: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc08008a0  ! 3080: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0c7e030  ! 3081: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	mov 0x32, %r30
	.word 0x91d0001e  ! 3088: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8fd0001e  ! 3093: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc097e010  ! 3098: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0xc04fc000  ! 3109: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0xc197e001  ! 3110: LDQFA_I	-	[%r31, 0x0001], %f0
	.word 0x9e49a001  ! 3111: MULX_I	mulx 	%r6, 0x0001, %r15
	.word 0xded7e000  ! 3112: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r15
	.word 0x95d02031  ! 3115: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0xdf17c000  ! 3116: LDQF_R	-	[%r31, %r0], %f15
	.word 0x93a00561  ! 3121: FSQRTq	fsqrt	
	.word 0x86d38001  ! 3122: UMULcc_R	umulcc 	%r14, %r1, %r3
	.word 0x85a3c9ae  ! 3123: FDIVs	fdivs	%f15, %f14, %f2
	.word 0xc4dfe000  ! 3132: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	.word 0x83d02034  ! 3133: Tcc_I	te	icc_or_xcc, %r0 + 52
	mov 0x33, %r30
	.word 0x95d0001e  ! 3136: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 3139: BNE	bne,a	<label_0x1>
	.word 0xc517c000  ! 3148: LDQF_R	-	[%r31, %r0], %f2
	.word 0x93d02035  ! 3153: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xc48008a0  ! 3154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4d7e030  ! 3159: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0xc4dfe020  ! 3162: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	.word 0xc48804a0  ! 3169: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc597e001  ! 3172: LDQFA_I	-	[%r31, 0x0001], %f2
	.word 0xc44fe001  ! 3177: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0xc5e7c02e  ! 3178: CASA_I	casa	[%r31] 0x 1, %r14, %r2
	mov 0x35, %r30
	.word 0x8bd0001e  ! 3179: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc457c000  ! 3186: LDSH_R	ldsh	[%r31 + %r0], %r2
	.word 0x8d802000  ! 3187: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x36800001  ! 3192: BGE	bge,a	<label_0x1>
	.word 0x85d02035  ! 3195: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xc48804a0  ! 3200: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	mov 0x30, %r30
	.word 0x95d0001e  ! 3205: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 3210: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc457e001  ! 3211: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x904a8007  ! 3218: MULX_R	mulx 	%r10, %r7, %r8
	.word 0x8d802000  ! 3229: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x36700001  ! 3230: BPGE	<illegal instruction>
	.word 0xd0800ac0  ! 3231: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0x99a209cb  ! 3232: FDIVd	fdivd	%f8, %f42, %f12
	.word 0x83500000  ! 3233: RDPR_TPC	rdpr	%tpc, %r1
	.word 0xc33fc00b  ! 3234: STDF_R	std	%f1, [%r11, %r31]
	.word 0xc24fe001  ! 3239: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0xc20fe001  ! 3240: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0xc257e001  ! 3241: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	.word 0x97a249c9  ! 3246: FDIVd	fdivd	%f40, %f40, %f42
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd60fe001  ! 3252: LDUB_I	ldub	[%r31 + 0x0001], %r11
	.word 0xd797e001  ! 3259: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x91d02031  ! 3260: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd6dfe010  ! 3261: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0xd737c009  ! 3264: STQF_R	-	%f11, [%r9, %r31]
	.word 0x9d6bc007  ! 3265: SDIVX_R	sdivx	%r15, %r7, %r14
	.word 0xdc8fe030  ! 3266: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r14
	.word 0xdcc004a0  ! 3267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
	.word 0xdd37e001  ! 3268: STQF_I	-	%f14, [0x0001, %r31]
	.word 0xdc800c60  ! 3269: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r14
	.word 0xdcc7e030  ! 3270: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r14
	.word 0xdcd804a0  ! 3271: LDXA_R	ldxa	[%r0, %r0] 0x25, %r14
	.word 0x24800001  ! 3274: BLE	ble,a	<label_0x1>
	.word 0x89d02030  ! 3285: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	mov 0x35, %r30
	.word 0x9fd0001e  ! 3288: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x87d0001e  ! 3289: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xdc8008a0  ! 3292: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x95d02034  ! 3299: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0xdc0fc000  ! 3308: LDUB_R	ldub	[%r31 + %r0], %r14
	.word 0x8d802004  ! 3311: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97d02034  ! 3318: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x9ba0054c  ! 3319: FSQRTd	fsqrt	
	.word 0xdacfe030  ! 3320: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0xdac004a0  ! 3321: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0xda57e001  ! 3324: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0xda8008a0  ! 3327: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x85d02034  ! 3330: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0xda8008a0  ! 3339: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8ad9c00f  ! 3340: SMULcc_R	smulcc 	%r7, %r15, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x8e69c001  ! 3344: UDIVX_R	udivx 	%r7, %r1, %r7
	.word 0x87802004  ! 3347: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xce27c001  ! 3348: STW_R	stw	%r7, [%r31 + %r1]
	.word 0x8a780001  ! 3349: SDIV_R	sdiv 	%r0, %r1, %r5
	.word 0x2c700001  ! 3352: BPNEG	<illegal instruction>
	.word 0x8169a001  ! 3353: SDIVX_I	sdivx	%r6, 0x0001, %r0
	.word 0xc05fe001  ! 3354: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0x87802016  ! 3357: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc027e001  ! 3362: STW_I	stw	%r0, [%r31 + 0x0001]
	.word 0x24700001  ! 3363: BPLE	<illegal instruction>
	.word 0xc0d7e000  ! 3364: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r0
	.word 0xc127e001  ! 3373: STF_I	st	%f0, [0x0001, %r31]
	.word 0xc08008a0  ! 3374: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc047e001  ! 3377: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0x3c700001  ! 3378: BPPOS	<illegal instruction>
	.word 0xc057c000  ! 3385: LDSH_R	ldsh	[%r31 + %r0], %r0
	.word 0xc077c001  ! 3390: STX_R	stx	%r0, [%r31 + %r1]
	mov 0x34, %r30
	.word 0x95d0001e  ! 3391: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8da289ae  ! 3392: FDIVs	fdivs	%f10, %f14, %f6
	.word 0x87d02031  ! 3393: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x966b6001  ! 3398: UDIVX_I	udivx 	%r13, 0x0001, %r11
	.word 0x3a800001  ! 3399: BCC	bcc,a	<label_0x1>
	.word 0xd6cfe030  ! 3402: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x87802004  ! 3407: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x89d02034  ! 3412: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xd6cfe010  ! 3421: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x98d18003  ! 3426: UMULcc_R	umulcc 	%r6, %r3, %r12
	mov 0x32, %r30
	.word 0x95d0001e  ! 3433: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xd8c7e020  ! 3435: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0x83514000  ! 3440: RDPR_TBA	rdpr	%tba, %r1
	.word 0x864b4002  ! 3445: MULX_R	mulx 	%r13, %r2, %r3
	.word 0x8dd02034  ! 3448: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0xc69004a0  ! 3449: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x9bd02031  ! 3452: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0xc6c7e010  ! 3457: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0x95d02031  ! 3458: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 3459: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9bd02032  ! 3460: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	mov 0x34, %r30
	.word 0x8dd0001e  ! 3461: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x9fd02035  ! 3464: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xc68fe000  ! 3465: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	mov 0x31, %r30
	.word 0x95d0001e  ! 3466: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc6cfe000  ! 3469: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r3
	.word 0xc6bfe001  ! 3470: STDA_I	stda	%r3, [%r31 + 0x0001] %asi
	.word 0xc6900e40  ! 3471: LDUHA_R	lduha	[%r0, %r0] 0x72, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2c700001  ! 3485: BPNEG	<illegal instruction>
	.word 0x844be001  ! 3486: MULX_I	mulx 	%r15, 0x0001, %r2
	.word 0x8cd2c000  ! 3489: UMULcc_R	umulcc 	%r11, %r0, %r6
	.word 0xccbfe001  ! 3492: STDA_I	stda	%r6, [%r31 + 0x0001] %asi
	.word 0xcc57e001  ! 3495: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0x96686001  ! 3496: UDIVX_I	udivx 	%r1, 0x0001, %r11
	.word 0x87802080  ! 3497: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd647e001  ! 3498: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x30800001  ! 3509: BA	ba,a	<label_0x1>
	.word 0xd65fc000  ! 3510: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd697e010  ! 3515: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0xd68fe030  ! 3528: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x98696001  ! 3533: UDIVX_I	udivx 	%r5, 0x0001, %r12
	.word 0x2c800001  ! 3534: BNEG	bneg,a	<label_0x1>
	.word 0x81500000  ! 3537: RDPR_TPC	rdpr	%tpc, %r0
	mov 0x33, %r30
	.word 0x91d0001e  ! 3538: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97494000  ! 3545: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x3a700001  ! 3548: BPCC	<illegal instruction>
	mov 0x31, %r30
	.word 0x83d0001e  ! 3553: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x91d0001e  ! 3554: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 3555: BPNEG	<illegal instruction>
	.word 0xd68008a0  ! 3556: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8481400b  ! 3557: ADDcc_R	addcc 	%r5, %r11, %r2
	mov 0x30, %r30
	.word 0x87d0001e  ! 3558: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc4d7e010  ! 3563: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r2
	.word 0x3c800001  ! 3564: BPOS	bpos,a	<label_0x1>
	.word 0x97514000  ! 3569: RDPR_TBA	rdpr	%tba, %r11
	.word 0x9fd02035  ! 3574: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xd6800ba0  ! 3575: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
	.word 0xd65fc000  ! 3576: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd737e001  ! 3577: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x8d480000  ! 3580: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0xcc47e001  ! 3581: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	mov 0x31, %r30
	.word 0x83d0001e  ! 3582: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8bd02035  ! 3583: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x99a089e4  ! 3586: FDIVq	dis not found

	mov 0x30, %r30
	.word 0x97d0001e  ! 3587: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x97d02034  ! 3588: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x8dd02032  ! 3591: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0xd937c004  ! 3592: STQF_R	-	%f12, [%r4, %r31]
	.word 0x2c800001  ! 3593: BNEG	bneg,a	<label_0x1>
	.word 0xd897e010  ! 3594: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x8d68a001  ! 3597: SDIVX_I	sdivx	%r2, 0x0001, %r6
	.word 0xcc8008a0  ! 3602: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	mov 0x30, %r30
	.word 0x99d0001e  ! 3605: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x91d0001e  ! 3606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc2fc004  ! 3607: STB_R	stb	%r6, [%r31 + %r4]
	.word 0x836b000f  ! 3608: SDIVX_R	sdivx	%r12, %r15, %r1
	.word 0x8dd02031  ! 3611: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x99d02033  ! 3612: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x8d802004  ! 3619: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc247c000  ! 3620: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0xc2cfe020  ! 3629: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r1
	.word 0x81d02030  ! 3630: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0xc2dfe000  ! 3633: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
	.word 0xc327c00f  ! 3638: STF_R	st	%f1, [%r15, %r31]
	mov 0x34, %r30
	.word 0x8bd0001e  ! 3643: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc2d7e010  ! 3644: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0x24700001  ! 3645: BPLE	<illegal instruction>
	.word 0xc297e010  ! 3646: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r1
	.word 0x8dd02031  ! 3653: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 3656: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e700001  ! 3663: BPVC	<illegal instruction>
	.word 0x99d02031  ! 3664: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0xc247e001  ! 3665: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9a68a001  ! 3667: UDIVX_I	udivx 	%r2, 0x0001, %r13
	.word 0xda5fe001  ! 3668: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0xda07e001  ! 3677: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e020  ! 3684: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0x81d02035  ! 3693: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x22700001  ! 3698: BPE	<illegal instruction>
	.word 0xda9004a0  ! 3699: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x93a309e3  ! 3702: FDIVq	dis not found

	.word 0xd207c000  ! 3703: LDUW_R	lduw	[%r31 + %r0], %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd327c003  ! 3711: STF_R	st	%f9, [%r3, %r31]
	mov 0x34, %r30
	.word 0x9dd0001e  ! 3712: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xd28fe000  ! 3713: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x9a6bc005  ! 3714: UDIVX_R	udivx 	%r15, %r5, %r13
	.word 0x9ba289a0  ! 3715: FDIVs	fdivs	%f10, %f0, %f13
	.word 0xdad7e010  ! 3716: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0xda47e001  ! 3717: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0x85d02030  ! 3720: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x87802089  ! 3725: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81d02034  ! 3732: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0xda47c000  ! 3735: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x9bd02034  ! 3736: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0xdad804a0  ! 3737: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x8a7a0000  ! 3738: SDIV_R	sdiv 	%r8, %r0, %r5
	.word 0x38800001  ! 3741: BGU	bgu,a	<label_0x1>
	.word 0x98032001  ! 3742: ADD_I	add 	%r12, 0x0001, %r12
	.word 0x85d02031  ! 3743: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x34800001  ! 3748: BG	bg,a	<label_0x1>
	.word 0x87802016  ! 3749: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802088  ! 3750: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd8800b40  ! 3751: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r12
	.word 0x36700001  ! 3754: BPGE	<illegal instruction>
	.word 0xd8800b20  ! 3755: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r12
	mov 0x30, %r30
	.word 0x9bd0001e  ! 3756: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e020  ! 3759: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0xd897e010  ! 3762: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x8d802000  ! 3769: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd87fe001  ! 3770: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0xd88008a0  ! 3777: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x2c800001  ! 3778: BNEG	bneg,a	<label_0x1>
	.word 0xd937c000  ! 3785: STQF_R	-	%f12, [%r0, %r31]
	.word 0xd807c000  ! 3790: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0xd8d7e000  ! 3799: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd897e020  ! 3809: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x87d0001e  ! 3817: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x87d0001e  ! 3820: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd807e001  ! 3821: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd80fe001  ! 3822: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x8dd02030  ! 3827: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	mov 0x30, %r30
	.word 0x89d0001e  ! 3830: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x89d02035  ! 3831: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x87d02033  ! 3832: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0xd85fe001  ! 3833: LDX_I	ldx	[%r31 + 0x0001], %r12
	ta	T_CHANGE_HPRIV	! macro
	mov 0x33, %r30
	.word 0x81d0001e  ! 3849: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 3850: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd937e001  ! 3851: STQF_I	-	%f12, [0x0001, %r31]
	.word 0x8680c00f  ! 3854: ADDcc_R	addcc 	%r3, %r15, %r3
	.word 0xc60fe001  ! 3855: LDUB_I	ldub	[%r31 + 0x0001], %r3
	mov 0x30, %r30
	.word 0x97d0001e  ! 3860: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 3869: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x26800001  ! 3872: BL	bl,a	<label_0x1>
	.word 0x9ad20001  ! 3873: UMULcc_R	umulcc 	%r8, %r1, %r13
	.word 0x8d802004  ! 3876: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x2e700001  ! 3879: BPVS	<illegal instruction>
	.word 0xdb97e001  ! 3888: LDQFA_I	-	[%r31, 0x0001], %f13
	mov 0x31, %r30
	.word 0x85d0001e  ! 3891: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xda5fe001  ! 3892: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0x9d6b2001  ! 3899: SDIVX_I	sdivx	%r12, 0x0001, %r14
	mov 0x30, %r30
	.word 0x9dd0001e  ! 3900: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xdc07e001  ! 3901: LDUW_I	lduw	[%r31 + 0x0001], %r14
	.word 0x3c800001  ! 3902: BPOS	bpos,a	<label_0x1>
	.word 0x3e800001  ! 3903: BVC	bvc,a	<label_0x1>
	.word 0x9449a001  ! 3912: MULX_I	mulx 	%r6, 0x0001, %r10
	.word 0xd44fe001  ! 3913: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x87802010  ! 3914: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x3c700001  ! 3915: BPPOS	<illegal instruction>
	.word 0x87802089  ! 3916: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802080  ! 3919: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9f50c000  ! 3922: RDPR_TT	rdpr	%tt, %r15
	.word 0xde07c000  ! 3925: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0x8d802004  ! 3928: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802088  ! 3933: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9750c000  ! 3934: RDPR_TT	rdpr	%tt, %r11
	mov 0x32, %r30
	.word 0x89d0001e  ! 3935: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x81d02035  ! 3936: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0xd6800b60  ! 3939: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
	mov 0x33, %r30
	.word 0x83d0001e  ! 3946: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81d02031  ! 3947: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0xd677c001  ! 3948: STX_R	stx	%r11, [%r31 + %r1]
	mov 0x35, %r30
	.word 0x8fd0001e  ! 3949: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 3952: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd607c000  ! 3957: LDUW_R	lduw	[%r31 + %r0], %r11
	mov 0x32, %r30
	.word 0x85d0001e  ! 3960: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x8fd0001e  ! 3961: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x87d02035  ! 3962: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x8603e001  ! 3963: ADD_I	add 	%r15, 0x0001, %r3
	.word 0xc67fe001  ! 3964: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0xc647c000  ! 3965: LDSW_R	ldsw	[%r31 + %r0], %r3
	.word 0xc637c001  ! 3968: STH_R	sth	%r3, [%r31 + %r1]
	.word 0xc6880e40  ! 3969: LDUBA_R	lduba	[%r0, %r0] 0x72, %r3
	mov 0x30, %r30
	.word 0x81d0001e  ! 3970: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 3977: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc6c804a0  ! 3978: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0xc657e001  ! 3995: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	.word 0xc647e001  ! 3996: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x87802004  ! 3997: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc6d7e000  ! 4005: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	.word 0x3a800001  ! 4008: BCC	bcc,a	<label_0x1>
	.word 0x91d02035  ! 4009: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0xc717c000  ! 4011: LDQF_R	-	[%r31, %r0], %f3
	.word 0x80d0e001  ! 4012: UMULcc_I	umulcc 	%r3, 0x0001, %r0
	.word 0x95d02031  ! 4015: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x9dd02033  ! 4016: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0xc08fe000  ! 4017: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	mov 0x30, %r30
	.word 0x9dd0001e  ! 4022: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81d02032  ! 4025: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x32700001  ! 4030: BPNE	<illegal instruction>
	.word 0xc197e001  ! 4033: LDQFA_I	-	[%r31, 0x0001], %f0
	.word 0x8dd02035  ! 4036: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0xc057e001  ! 4037: LDSH_I	ldsh	[%r31 + 0x0001], %r0
	.word 0xc08fe020  ! 4038: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r0
	.word 0x9c7aa001  ! 4047: SDIV_I	sdiv 	%r10, 0x0001, %r14
	.word 0x87802010  ! 4048: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xdc57c000  ! 4055: LDSH_R	ldsh	[%r31 + %r0], %r14
	.word 0x85d02033  ! 4056: Tcc_I	tle	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x81d0001e  ! 4057: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xdc4fe001  ! 4060: LDSB_I	ldsb	[%r31 + 0x0001], %r14
	.word 0x87d02034  ! 4061: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x8e02e001  ! 4062: ADD_I	add 	%r11, 0x0001, %r7
	.word 0xce07c000  ! 4065: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0x87802089  ! 4070: WRASI_I	wr	%r0, 0x0089, %asi
	mov 0x33, %r30
	.word 0x99d0001e  ! 4075: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x89d0001e  ! 4076: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 4077: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x30700001  ! 4080: BPA	<illegal instruction>
	.word 0xce77c001  ! 4085: STX_R	stx	%r7, [%r31 + %r1]
	.word 0x87802004  ! 4086: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d51c000  ! 4091: RDPR_TL	rdpr	%tl, %r6
	.word 0xcc4fe001  ! 4092: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0xcc07c000  ! 4093: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0xcd37e001  ! 4094: STQF_I	-	%f6, [0x0001, %r31]
	.word 0x83d02032  ! 4099: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xcc4fe001  ! 4100: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0x83d02035  ! 4105: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x30800001  ! 4106: BA	ba,a	<label_0x1>
	.word 0xcc57e001  ! 4111: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0xcd27e001  ! 4112: STF_I	st	%f6, [0x0001, %r31]
	.word 0xcd27e001  ! 4115: STF_I	st	%f6, [0x0001, %r31]
	.word 0x2c800001  ! 4116: BNEG	bneg,a	<label_0x1>
	.word 0xcc5fe001  ! 4121: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x9d480000  ! 4122: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0xdcd7e020  ! 4127: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r14
	.word 0xdc4fc000  ! 4136: LDSB_R	ldsb	[%r31 + %r0], %r14
	.word 0xdd37c001  ! 4141: STQF_R	-	%f14, [%r1, %r31]
	.word 0x8d802004  ! 4142: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdc8fe030  ! 4143: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r14
	.word 0xdcd7e000  ! 4144: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r14
	.word 0x24700001  ! 4153: BPLE	<illegal instruction>
	.word 0xdcdfe030  ! 4156: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r14
	.word 0xdc97e010  ! 4159: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r14
	mov 0x35, %r30
	.word 0x87d0001e  ! 4162: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x89d0001e  ! 4169: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x85692001  ! 4170: SDIVX_I	sdivx	%r4, 0x0001, %r2
	.word 0x3e700001  ! 4171: BPVC	<illegal instruction>
	.word 0xc48008a0  ! 4172: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x92810003  ! 4173: ADDcc_R	addcc 	%r4, %r3, %r9
	.word 0xd28fe030  ! 4174: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0xd247e001  ! 4175: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0xd28fe000  ! 4176: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x97d02034  ! 4179: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0xd2ffc023  ! 4186: SWAPA_R	swapa	%r9, [%r31 + %r3] 0x01
	.word 0x36800001  ! 4187: BGE	bge,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89d02035  ! 4191: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0xd2dfe030  ! 4194: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0x806b6001  ! 4197: UDIVX_I	udivx 	%r13, 0x0001, %r0
	.word 0x24700001  ! 4202: BPLE	<illegal instruction>
	.word 0xc08fe000  ! 4203: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0xc117c000  ! 4204: LDQF_R	-	[%r31, %r0], %f0
	ta	T_CHANGE_PRIV	! macro
	.word 0x2c800001  ! 4206: BNEG	bneg,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2e700001  ! 4218: BPVS	<illegal instruction>
	.word 0x9c006001  ! 4223: ADD_I	add 	%r1, 0x0001, %r14
	.word 0x22700001  ! 4232: BPE	<illegal instruction>
	.word 0xdcd004a0  ! 4233: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	.word 0xdccfe020  ! 4236: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r14
	.word 0xdc5fc000  ! 4237: LDX_R	ldx	[%r31 + %r0], %r14
	.word 0x26800001  ! 4244: BL	bl,a	<label_0x1>
	mov 0x31, %r30
	.word 0x85d0001e  ! 4247: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x81d0001e  ! 4252: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x97690008  ! 4253: SDIVX_R	sdivx	%r4, %r8, %r11
	.word 0x8d802000  ! 4256: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8bd02033  ! 4257: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0xd6cfe030  ! 4258: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x8fd02034  ! 4265: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	mov 0x34, %r30
	.word 0x9fd0001e  ! 4268: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x91d0001e  ! 4271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 4272: BPPOS	<illegal instruction>
	.word 0x99d02033  ! 4273: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xd7e7c028  ! 4274: CASA_I	casa	[%r31] 0x 1, %r8, %r11
	.word 0x97d02035  ! 4275: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 4276: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x35, %r30
	.word 0x81d0001e  ! 4279: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x996a2001  ! 4280: SDIVX_I	sdivx	%r8, 0x0001, %r12
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x89d0001e  ! 4290: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd8c7e010  ! 4293: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0xd87fe001  ! 4296: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0x84816001  ! 4299: ADDcc_I	addcc 	%r5, 0x0001, %r2
	.word 0xc4800b60  ! 4300: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r2
	mov 0x33, %r30
	.word 0x9dd0001e  ! 4301: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 4308: BPLE	<illegal instruction>
	.word 0x9351c000  ! 4309: RDPR_TL	rdpr	%tl, %r9
	.word 0xd257e001  ! 4312: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	mov 0x32, %r30
	.word 0x8dd0001e  ! 4315: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8dd02031  ! 4316: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0xd23fe001  ! 4317: STD_I	std	%r9, [%r31 + 0x0001]
	mov 0x34, %r30
	.word 0x81d0001e  ! 4320: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xd2d804a0  ! 4321: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xd207c000  ! 4322: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0x8ba309c0  ! 4323: FDIVd	fdivd	%f12, %f0, %f36
	.word 0x8d802004  ! 4326: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcb97e001  ! 4327: LDQFA_I	-	[%r31, 0x0001], %f5
	.word 0xcacfe000  ! 4328: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	.word 0xcad7e010  ! 4329: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
	mov 0x33, %r30
	.word 0x95d0001e  ! 4332: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xcadfe010  ! 4333: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
	.word 0xcadfe000  ! 4340: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r5
	.word 0xcadfe030  ! 4355: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	.word 0x9dd02032  ! 4364: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x87802010  ! 4365: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xca97e000  ! 4366: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0x97d02035  ! 4367: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0xcb27c000  ! 4370: STF_R	st	%f5, [%r0, %r31]
	mov 0x31, %r30
	.word 0x9dd0001e  ! 4371: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 4374: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xca8008a0  ! 4381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xcac80e60  ! 4382: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r5
	.word 0xca0fe001  ! 4383: LDUB_I	ldub	[%r31 + 0x0001], %r5
	mov 0x31, %r30
	.word 0x93d0001e  ! 4384: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x8bd0001e  ! 4387: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x87d02030  ! 4388: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x24700001  ! 4393: BPLE	<illegal instruction>
	.word 0xca97e020  ! 4396: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r5
	.word 0x87802004  ! 4397: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02030  ! 4398: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xca5fe001  ! 4403: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x8bd02032  ! 4404: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x97d02031  ! 4409: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0xca800ac0  ! 4414: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r5
	.word 0x87d02034  ! 4419: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0xcad80e80  ! 4422: LDXA_R	ldxa	[%r0, %r0] 0x74, %r5
	.word 0xca8008a0  ! 4423: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x22800001  ! 4430: BE	be,a	<label_0x1>
	.word 0x9a83400c  ! 4437: ADDcc_R	addcc 	%r13, %r12, %r13
	.word 0x90d30001  ! 4438: UMULcc_R	umulcc 	%r12, %r1, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x3c800001  ! 4450: BPOS	bpos,a	<label_0x1>
	.word 0xd00fc000  ! 4451: LDUB_R	ldub	[%r31 + %r0], %r8
	mov 0x32, %r30
	.word 0x85d0001e  ! 4456: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 4461: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd057e001  ! 4462: LDSH_I	ldsh	[%r31 + 0x0001], %r8
	.word 0x89514000  ! 4463: RDPR_TBA	rdpr	%tba, %r4
	.word 0x87802004  ! 4466: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x98c12001  ! 4467: ADDCcc_I	addccc 	%r4, 0x0001, %r12
	mov 0x34, %r30
	.word 0x95d0001e  ! 4468: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x81d02030  ! 4469: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x9bd02031  ! 4474: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0xd88008a0  ! 4475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	mov 0x30, %r30
	.word 0x93d0001e  ! 4478: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd84fc000  ! 4479: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0xd88804a0  ! 4482: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x8ed32001  ! 4483: UMULcc_I	umulcc 	%r12, 0x0001, %r7
	.word 0x87802016  ! 4484: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9fd02033  ! 4485: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x946ae001  ! 4486: UDIVX_I	udivx 	%r11, 0x0001, %r10
	mov 0x33, %r30
	.word 0x9bd0001e  ! 4491: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd44fe001  ! 4500: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x91d02034  ! 4501: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd527c001  ! 4502: STF_R	st	%f10, [%r1, %r31]
	.word 0xd407e001  ! 4503: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8da149ae  ! 4508: FDIVs	fdivs	%f5, %f14, %f6
	.word 0x87d02031  ! 4509: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xcc47e001  ! 4512: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0x8cd00004  ! 4513: UMULcc_R	umulcc 	%r0, %r4, %r6
	.word 0x22800001  ! 4514: BE	be,a	<label_0x1>
	.word 0x32800001  ! 4515: BNE	bne,a	<label_0x1>
	.word 0x30700001  ! 4516: BPA	<illegal instruction>
	.word 0xcde7c024  ! 4519: CASA_I	casa	[%r31] 0x 1, %r4, %r6
	.word 0xcde7c024  ! 4522: CASA_I	casa	[%r31] 0x 1, %r4, %r6
	.word 0x3a700001  ! 4523: BPCC	<illegal instruction>
	.word 0x86db800a  ! 4524: SMULcc_R	smulcc 	%r14, %r10, %r3
	mov 0x32, %r30
	.word 0x99d0001e  ! 4525: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xc627e001  ! 4526: STW_I	stw	%r3, [%r31 + 0x0001]
	mov 0x33, %r30
	.word 0x9fd0001e  ! 4529: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc68fe010  ! 4531: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
	.word 0xc6cfe030  ! 4532: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r3
	.word 0xc64fc000  ! 4533: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0x3e700001  ! 4536: BPVC	<illegal instruction>
	.word 0x87d02032  ! 4539: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0xc6800aa0  ! 4540: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r3
	.word 0x8dd02034  ! 4541: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0xc677e001  ! 4542: STX_I	stx	%r3, [%r31 + 0x0001]
	.word 0xc65fc000  ! 4545: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x8e802001  ! 4546: ADDcc_I	addcc 	%r0, 0x0001, %r7
	.word 0xcedfe010  ! 4553: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0xce97e010  ! 4554: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r7
	.word 0xceffc02a  ! 4555: SWAPA_R	swapa	%r7, [%r31 + %r10] 0x01
	.word 0x87802014  ! 4560: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xcedfe000  ! 4561: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0xce4fe001  ! 4562: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0xceffc02a  ! 4563: SWAPA_R	swapa	%r7, [%r31 + %r10] 0x01
	.word 0xce5fc000  ! 4564: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x856b6001  ! 4565: SDIVX_I	sdivx	%r13, 0x0001, %r2
	.word 0x87d02035  ! 4568: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0xc4bfc02a  ! 4575: STDA_R	stda	%r2, [%r31 + %r10] 0x01
	.word 0x8d802000  ! 4576: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x80c0e001  ! 4579: ADDCcc_I	addccc 	%r3, 0x0001, %r0
	.word 0xc0ffc02a  ! 4584: SWAPA_R	swapa	%r0, [%r31 + %r10] 0x01
	.word 0x20700001  ! 4585: BPN	<illegal instruction>
	.word 0x9b51c000  ! 4590: RDPR_TL	rdpr	%tl, %r13
	.word 0x2a700001  ! 4593: BPCS	<illegal instruction>
	.word 0xda07e001  ! 4596: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdac004a0  ! 4601: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0xda17e001  ! 4602: LDUH_I	lduh	[%r31 + 0x0001], %r13
	.word 0xda77c00a  ! 4603: STX_R	stx	%r13, [%r31 + %r10]
	.word 0x85d02030  ! 4610: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0xda8008a0  ! 4613: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x97a00569  ! 4616: FSQRTq	fsqrt	
	.word 0xd65fe001  ! 4621: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0x9fd02033  ! 4632: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0xd7e7c029  ! 4635: CASA_I	casa	[%r31] 0x 1, %r9, %r11
	.word 0xd797e001  ! 4636: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x9bd02035  ! 4637: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xd617c000  ! 4640: LDUH_R	lduh	[%r31 + %r0], %r11
	mov 0x35, %r30
	.word 0x81d0001e  ! 4641: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9edb0005  ! 4642: SMULcc_R	smulcc 	%r12, %r5, %r15
	mov 0x34, %r30
	.word 0x87d0001e  ! 4643: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8fd02030  ! 4646: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xdedfe000  ! 4649: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r15
	.word 0xde8008a0  ! 4652: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x32800001  ! 4655: BNE	bne,a	<label_0x1>
	.word 0x9b51c000  ! 4656: RDPR_TL	rdpr	%tl, %r13
	.word 0x28700001  ! 4659: BPLEU	<illegal instruction>
	.word 0x89a00543  ! 4660: FSQRTd	fsqrt	
	.word 0xc8cfe020  ! 4663: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r4
	.word 0xc85fc000  ! 4666: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x99d02033  ! 4667: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xc8800be0  ! 4670: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r4
	.word 0xc927c003  ! 4671: STF_R	st	%f4, [%r3, %r31]
	.word 0x986bc00a  ! 4672: UDIVX_R	udivx 	%r15, %r10, %r12
	.word 0x9479000e  ! 4677: SDIV_R	sdiv 	%r4, %r14, %r10
	.word 0x3a800001  ! 4684: BCC	bcc,a	<label_0x1>
	.word 0xd4d004a0  ! 4685: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xd45fe001  ! 4686: LDX_I	ldx	[%r31 + 0x0001], %r10
	.word 0xd4c7e030  ! 4687: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	mov 0x31, %r30
	.word 0x99d0001e  ! 4688: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x99d02033  ! 4689: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x9edb0009  ! 4692: SMULcc_R	smulcc 	%r12, %r9, %r15
	.word 0x8a7be001  ! 4697: SDIV_I	sdiv 	%r15, 0x0001, %r5
	.word 0x99514000  ! 4698: RDPR_TBA	rdpr	%tba, %r12
	.word 0xd807e001  ! 4699: LDUW_I	lduw	[%r31 + 0x0001], %r12
	mov 0x33, %r30
	.word 0x93d0001e  ! 4700: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8c7e010  ! 4701: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0x8fd02033  ! 4704: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x83d0001e  ! 4705: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9fa00549  ! 4706: FSQRTd	fsqrt	
	.word 0xde97e000  ! 4707: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r15
	.word 0x9dd02033  ! 4708: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x83d0001e  ! 4711: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x94836001  ! 4712: ADDcc_I	addcc 	%r13, 0x0001, %r10
	mov 0x32, %r30
	.word 0x97d0001e  ! 4713: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xd4c004a0  ! 4714: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x8951c000  ! 4723: RDPR_TL	rdpr	%tl, %r4
	.word 0xc807e001  ! 4726: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc8cfe010  ! 4729: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0xc88804a0  ! 4730: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0x84006001  ! 4731: ADD_I	add 	%r1, 0x0001, %r2
	.word 0x8f480000  ! 4732: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	mov 0x35, %r30
	.word 0x91d0001e  ! 4733: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 4734: BNEG	bneg,a	<label_0x1>
	.word 0xcf17c000  ! 4745: LDQF_R	-	[%r31, %r0], %f7
	.word 0x36700001  ! 4746: BPGE	<illegal instruction>
	.word 0xce4fc000  ! 4747: LDSB_R	ldsb	[%r31 + %r0], %r7
	mov 0x30, %r30
	.word 0x81d0001e  ! 4752: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xcec7e020  ! 4753: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	.word 0x85d02034  ! 4754: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 4755: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce800ac0  ! 4758: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r7
	.word 0x8d802000  ! 4759: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x81d0001e  ! 4760: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 4763: BNE	bne,a	<label_0x1>
	.word 0x2e800001  ! 4768: BVS	bvs,a	<label_0x1>
	.word 0x8d802004  ! 4773: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xce4fe001  ! 4774: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0x3a700001  ! 4775: BPCC	<illegal instruction>
	.word 0xcedfe030  ! 4776: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	.word 0xce47e001  ! 4779: LDSW_I	ldsw	[%r31 + 0x0001], %r7
	.word 0x30800001  ! 4782: BA	ba,a	<label_0x1>
	.word 0xce17c000  ! 4783: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x87802016  ! 4784: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xcecfe000  ! 4787: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r7
	.word 0xcedfe000  ! 4794: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	mov 0x33, %r30
	.word 0x81d0001e  ! 4795: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 4798: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce8008a0  ! 4801: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcec7e000  ! 4802: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
	.word 0xce9004a0  ! 4803: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x28700001  ! 4806: BPLEU	<illegal instruction>
	.word 0xce8008a0  ! 4807: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8d802000  ! 4810: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x8fd0001e  ! 4815: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9751c000  ! 4816: RDPR_TL	rdpr	%tl, %r11
	.word 0x8d802004  ! 4833: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81a3c9ce  ! 4835: FDIVd	fdivd	%f46, %f14, %f0
	.word 0x34800001  ! 4842: BG	bg,a	<label_0x1>
	.word 0x8d802000  ! 4843: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9ad2c00b  ! 4844: UMULcc_R	umulcc 	%r11, %r11, %r13
	mov 0x30, %r30
	.word 0x87d0001e  ! 4845: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xda4fe001  ! 4846: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0xda4fc000  ! 4847: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x26700001  ! 4848: BPL	<illegal instruction>
	.word 0x93d02030  ! 4857: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xda4fc000  ! 4858: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x90784002  ! 4863: SDIV_R	sdiv 	%r1, %r2, %r8
	.word 0x8a4be001  ! 4864: MULX_I	mulx 	%r15, 0x0001, %r5
	.word 0xca5fe001  ! 4867: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x9fd02032  ! 4868: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x99494000  ! 4869: RDHPR_HTBA	rdhpr	%htba, %r12
	mov 0x34, %r30
	.word 0x89d0001e  ! 4872: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd8c00e40  ! 4877: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r12
	.word 0x3c800001  ! 4878: BPOS	bpos,a	<label_0x1>
	.word 0x30700001  ! 4879: BPA	<illegal instruction>
	.word 0xd88fe030  ! 4882: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x32800001  ! 4884: BNE	bne,a	<label_0x1>
	.word 0x9fd02031  ! 4885: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x8da00549  ! 4886: FSQRTd	fsqrt	
	.word 0x86498004  ! 4887: MULX_R	mulx 	%r6, %r4, %r3
	.word 0x26700001  ! 4888: BPL	<illegal instruction>
	.word 0x9203e001  ! 4891: ADD_I	add 	%r15, 0x0001, %r9
	mov 0x30, %r30
	.word 0x97d0001e  ! 4892: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8bd02031  ! 4893: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xd327e001  ! 4902: STF_I	st	%f9, [0x0001, %r31]
	.word 0xd247e001  ! 4903: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0x9da00567  ! 4904: FSQRTq	fsqrt	
	.word 0x97d02033  ! 4907: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0xdc17c000  ! 4908: LDUH_R	lduh	[%r31 + %r0], %r14
	.word 0x2e700001  ! 4909: BPVS	<illegal instruction>
	.word 0xdc800a60  ! 4910: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r14
	.word 0x98d2400e  ! 4913: UMULcc_R	umulcc 	%r9, %r14, %r12
	.word 0xd8800c20  ! 4916: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r12
	.word 0xd817c000  ! 4917: LDUH_R	lduh	[%r31 + %r0], %r12
	.word 0xd847c000  ! 4922: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x9bd02031  ! 4923: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x93d0001e  ! 4928: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x98500004  ! 4929: UMUL_R	umul 	%r0, %r4, %r12
	mov 0x32, %r30
	.word 0x9fd0001e  ! 4930: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xd897e030  ! 4935: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	mov 0x34, %r30
	.word 0x87d0001e  ! 4936: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd8c7e000  ! 4945: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd847c000  ! 4947: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x8bd02035  ! 4948: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x3c800001  ! 4953: BPOS	bpos,a	<label_0x1>
	.word 0xd857c000  ! 4954: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x93d02030  ! 4959: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x87802004  ! 4966: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd937c004  ! 4969: STQF_R	-	%f12, [%r4, %r31]
	.word 0x96d2c001  ! 4976: UMULcc_R	umulcc 	%r11, %r1, %r11
	.word 0xd6d804a0  ! 4979: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x84d0400d  ! 4980: UMULcc_R	umulcc 	%r1, %r13, %r2
	.word 0x8d802000  ! 4981: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3a800001  ! 4984: BCC	bcc,a	<label_0x1>
	.word 0x99480000  ! 4985: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0xd8ffc02d  ! 4992: SWAPA_R	swapa	%r12, [%r31 + %r13] 0x01
	.word 0xd8dfe020  ! 4993: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x87680006  ! 4996: SDIVX_R	sdivx	%r0, %r6, %r3


.global user_data_start
.data
user_data_start:
	.xword	0xdbeff44d34b488db
	.xword	0x5af7e2770be23b84
	.xword	0x176594685507482e
	.xword	0xb34a976393bfa83b
	.xword	0x23f0858bf11aefbe
	.xword	0x8894b717d8c52e63
	.xword	0x2850b0820ec073a0
	.xword	0x069b81b6ef036aae
	.xword	0x8f57f98d57ead305
	.xword	0xaaf5dc8b83bee014
	.xword	0x864d1ca83efe7d40
	.xword	0x79dd53b418e4885c
	.xword	0x858a255e3081619b
	.xword	0x385fd308ee568940
	.xword	0x80ae7b187331a215
	.xword	0xf381421feecb9e64
	.xword	0x1aad0b7a692ef5a9
	.xword	0xe06d0c0e846eb706
	.xword	0x5520d2ed6033d110
	.xword	0x56d75a726550abe5
	.xword	0x58e06b70743990e0
	.xword	0x45e8dfd214a2125f
	.xword	0xa4762378267f430a
	.xword	0x5ac694823134e024
	.xword	0x8fb263785f04bf58
	.xword	0xf1e7ff0d56a8409d
	.xword	0x5e161adbde088ceb
	.xword	0xbdb186ef8b9c453f
	.xword	0x3a6a9844de208263
	.xword	0x92716fb287916451
	.xword	0x6cb7277e1a5320b2
	.xword	0x14d53723ff8c5bde
	.xword	0xf8d50324b90423cb
	.xword	0xd1fac2964704bcbe
	.xword	0xad0d27aa05b2bc13
	.xword	0x24d3473574719ea9
	.xword	0xb4aebef6d77a6cf2
	.xword	0xf2585c7cb398c639
	.xword	0x34015133a3d47738
	.xword	0xf6761cf641958d0e
	.xword	0xb72dae38a4cf088c
	.xword	0xed6687614facdc23
	.xword	0x2b061ab1a9754bfd
	.xword	0xa59c8959c71f1e38
	.xword	0x8a442f5bf16f6c35
	.xword	0x2db81e58970a81a8
	.xword	0x144abccafe1ca1f4
	.xword	0xd60d47fb36a0ffba
	.xword	0x03e55387494805ef
	.xword	0xb9471f69dc517c20
	.xword	0x2855e78a30a48c02
	.xword	0xfd0ecf0dc2460f80
	.xword	0x9ce88f62f94ee939
	.xword	0x57e5d848a63840e2
	.xword	0x591a185c13a51704
	.xword	0xe4747082eeabffdd
	.xword	0x7dade1e427693220
	.xword	0x0ff65b39c1d5db62
	.xword	0x0d84d27b5b7418f6
	.xword	0xa365f90b570cfa2a
	.xword	0xada78b434b9aa8dd
	.xword	0x6535d9aa22fd748b
	.xword	0xccdf634d5a90f50a
	.xword	0xd4793dc86f30a8ec
	.xword	0x0832206201fe6ca2
	.xword	0xef72d9cce463e730
	.xword	0x9443ddd74a49bb6c
	.xword	0x663e0d6d0a482650
	.xword	0xf89c247ffcafa5ec
	.xword	0x9543e2f48638ea59
	.xword	0x09c05efea8b327a3
	.xword	0x1b78161a31c4762b
	.xword	0xa2aae339657fd66e
	.xword	0xf5dc28ea28cf8a76
	.xword	0x26c128bc5f084746
	.xword	0x1e3cc54203ba7cbe
	.xword	0xf774113f55565fec
	.xword	0xae89bab0f1ca98f5
	.xword	0x27a26635d2837429
	.xword	0x5e4262e1941d5fa8
	.xword	0xda02a6cb5504cf76
	.xword	0x10624caa4ad27a0b
	.xword	0xb24d24b177adcc61
	.xword	0xc7b24bdf704b854d
	.xword	0xe4bd833f5d048aff
	.xword	0x68fb9c670bfc741b
	.xword	0x464652b9b265efc5
	.xword	0x9c6b560528f8bd03
	.xword	0xc3cea8c083e481b6
	.xword	0xca96f81601d37087
	.xword	0x9b1ff7011d50df02
	.xword	0x6e9a200d49265124
	.xword	0x86112bf61ba31a51
	.xword	0x5353f82bd2ae4c0c
	.xword	0xe9e54007cfd15fe6
	.xword	0xb506cb7db9704b54
	.xword	0xe5424cad6bbb1c9d
	.xword	0xd105f944ea84e86c
	.xword	0xc410facc21cadd5f
	.xword	0x3585a1a17b16c5c4
	.xword	0xf577fc11acae3dea
	.xword	0x023371f198060497
	.xword	0x5d3d46a0e437ea5b
	.xword	0x8d5217ba92515353
	.xword	0xdf32a5177d820902
	.xword	0xbcaf2c5aeb74d732
	.xword	0x392216568d7bb4cd
	.xword	0x3827b4ab04ee4b3d
	.xword	0xa2937f9776870ff7
	.xword	0x4b452a22cccb672e
	.xword	0xac5e987f43154f27
	.xword	0xff67ec6b039999dc
	.xword	0x4d9f578b43837f5e
	.xword	0x83041a14599b5c43
	.xword	0x70dcec15218a317c
	.xword	0x809d51aef57b70fd
	.xword	0xe21a285f5e59b396
	.xword	0x619809599cbcd60a
	.xword	0x2f6be98339945e0c
	.xword	0xeadd2ccb3483963e
	.xword	0x2d8ce0b69ecaa21a
	.xword	0xd5db7fe2cd0022f4
	.xword	0x0a3c7982f03089e4
	.xword	0xa6a3285c9b8a2e73
	.xword	0x8fea5fbd6608d251
	.xword	0x6c1b16d828ccfe59
	.xword	0x94d759ab7e3dd4b9
	.xword	0x6aa8efa6b36ab928
	.xword	0x33d607832c857722
	.xword	0x80ff6deead029e29
	.xword	0xcc3162edd932a650
	.xword	0xf11e880fb1d5eb36
	.xword	0x3072002c74ef9110
	.xword	0xdc1824984a178182
	.xword	0x7bfbbbf3f23e901e
	.xword	0xfdd668fe80894c06
	.xword	0xb9fbbcd0b762f576
	.xword	0xd149f3780339bf06
	.xword	0x1b63f3645dd36383
	.xword	0x353ac7f86c06788f
	.xword	0xb8ffb40d73991e84
	.xword	0x3bd6f87c6ffb8522
	.xword	0x6f22e7c5bd75254c
	.xword	0xaf88a14e8f801ab4
	.xword	0x188a03bc921702bc
	.xword	0x63f0723f6f23cd8e
	.xword	0xa6cade2f7625805a
	.xword	0x4fbd0032122f41aa
	.xword	0x7115c5db1c262c47
	.xword	0x058bea179dcead6e
	.xword	0xb7241b4243884c38
	.xword	0x6b34ab9dfb1580a5
	.xword	0x038a5f96a26aa478
	.xword	0xf11c5d5f3c93b4a7
	.xword	0x81ca2bfd58986d04
	.xword	0x5d1563b8ea041256
	.xword	0xb7fae0e9c998658e
	.xword	0x10dde5f2dd6f77bc
	.xword	0xd850359319073305
	.xword	0x71570651d82a4d71
	.xword	0xf6deb3737fd164dd
	.xword	0x392a1b6cd2d49119
	.xword	0x6c671406758cb907
	.xword	0x730e1e9d6ae0be6c
	.xword	0x98cbb4930fa42dfb
	.xword	0x0e4e910bce9d3ce7
	.xword	0xa0f5383dbb092bf5
	.xword	0xb16e8afc6384dd9a
	.xword	0xa27ae72ec31238d9
	.xword	0x84b2fbff2a957a81
	.xword	0x4a895118aa9b3d79
	.xword	0x295487219b072254
	.xword	0x9a5f330e1df43f47
	.xword	0x4e9fbed177824742
	.xword	0xe1bf4d5f55c0a594
	.xword	0x28b049a3beb3ca0d
	.xword	0xdca170e67c563950
	.xword	0xc05263058743698a
	.xword	0x775272b250cc9747
	.xword	0xcb7494f61788ebf5
	.xword	0x78307436e5e774ef
	.xword	0x42fe5caca19ddf62
	.xword	0xc24af33b42d2d8d2
	.xword	0x96bc6adf6b9fa952
	.xword	0xa6c54756120de4c7
	.xword	0x80232c024a25046e
	.xword	0xa8cbb0d9fa09a939
	.xword	0xeb482e2e2980a124
	.xword	0x0608e52a5e06a9ce
	.xword	0x6ce3a631f04ee3ba
	.xword	0x006c94e1b2749fa8
	.xword	0x5a0fbf206ce3cc91
	.xword	0x2a781356aaeba939
	.xword	0xc733157331ae31c7
	.xword	0xf1d0f0fb9c3f1968
	.xword	0x1f3cf2cb3baf6398
	.xword	0xf47eb7c235377e56
	.xword	0x97544b64183251f4
	.xword	0xd02122e62154e2bb
	.xword	0xd7eb3d39fa44e475
	.xword	0xadda62b060a0a1f1
	.xword	0xe627cc4beca848bd
	.xword	0xb83c5eb7d97c97a5
	.xword	0x4725de4ec52af82c
	.xword	0x2df4933802438e06
	.xword	0xee7d93409411b420
	.xword	0x9c92a8705acb8f1f
	.xword	0x51508fa3a9acbf3c
	.xword	0x7e7a46e7f1c7369e
	.xword	0xf64632d0a26e7239
	.xword	0x14cd1bbcca66ae82
	.xword	0x3d58b5abadb75527
	.xword	0x8c3b165edbe88ec1
	.xword	0xbe4071bc7ec37418
	.xword	0x77c58e9118032618
	.xword	0xfb771698b16744fb
	.xword	0x52a151d99997ebd0
	.xword	0x67e2442014d2d093
	.xword	0xe9319630af4fb623
	.xword	0xa459cb14fbd1fed2
	.xword	0x244115ee44eeba7a
	.xword	0xea7077bed8c21145
	.xword	0x67bf46167a8637ce
	.xword	0xefb69791adc78005
	.xword	0xb049cca7b5eea16d
	.xword	0xb5c960914240cee3
	.xword	0x25c831e5f0c92b3e
	.xword	0x0f3da385b3e70ec2
	.xword	0x7dbc7fae6b91c03b
	.xword	0x9d85055c2fa6640a
	.xword	0x7c609265196839c4
	.xword	0xaecb37ccc301c86c
	.xword	0x5546e7a2187b9fb7
	.xword	0xb1f09cd3462de45d
	.xword	0x50e111bf79ebee05
	.xword	0x05b5ec29ebc6daf7
	.xword	0xf15f6fde7b6b4d17
	.xword	0x6db0e7c1ffadb076
	.xword	0xdab40fbae786cd5e
	.xword	0x6cf8986528bea748
	.xword	0xaa857a91755824b5
	.xword	0xb20b389d29fcb623
	.xword	0xc41aa53850cd6ed3
	.xword	0x6a81a3f9d14bee42
	.xword	0xfe3dbeadb8fadbc1
	.xword	0x3348d91ae7bc1aed
	.xword	0x8741adde110e5f1b
	.xword	0x6d75bd5421a444a0
	.xword	0x7343bcb0f3e8efd1
	.xword	0x055b4cbca8889960
	.xword	0x8690ad702467416c
	.xword	0x963a3eb275ccc227
	.xword	0x60c46b6b54e7d96f
	.xword	0x225c1206186dfd94
	.xword	0x9658e9a566a0656e
	.xword	0xec1d0fa41d81716a


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

#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Thu Apr  8 12:20:45 2004
!!#  */
!!# 
!!# %%section c_declarations
!!# 
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
!!#     IJ_bind_thread_group("diag.j", 22, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 25, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!#     IJ_set_ropr_fld("diag.j", 31, ijdefault, Ft_Rs1, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 32, ijdefault, Ft_Rs2, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 33, ijdefault, Ft_Rd, "5'b0rrrr");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 36, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 39, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 40, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 43, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 44, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 45, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 46, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 48, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 49, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 50, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 54, Ro_nontrap_ld, Fm_align_Simm13, "{0x0, 0x7}");
!!#     IJ_set_ropr_fld("diag.j", 55, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 59, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 65, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 71, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 72, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 75, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Weights
!!#     IJ_set_rvar("diag.j", 79, wt_high, "{6}");
!!#     IJ_set_rvar("diag.j", 80, wt_med,  "{3}");
!!#     IJ_set_rvar("diag.j", 81, wt_low,  "{1}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 85, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<3; k++) {
!!#         for (i = 0; i < 31; i++) {
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 89, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 91, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 94, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 97, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 100, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
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
!!#     IJ_printf  ("diag.j", 106, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 108, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 520, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_low
!!#         |  trap_asi     %rvar  wt_low
!!#         |  tcc          %rvar  wt_high
!!#         | ldst_excp     %rvar  wt_med
!!#         | ldstasi_excp  %rvar  wt_med
!!#         | ldstasi_excp_z  %rvar  wt_low
!!#         | change_mode   %rvar  wt_low
!!#         | alu           %rvar  wt_med
!!#         | br            %rvar  wt_med
!!#         | wrasi         %rvar  wt_low
!!#         | splash_fprs   %rvar  wt_low
!!#         | stores        %rvar  wt_low
!!# ;
!!# 
!!# change_mode :   
!!#       tCHANGE_NONPRIV 
!!#     | tCHANGE_PRIV 
!!#     | tCHANGE_NONHPRIV
!!#     | tCHANGE_HPRIV 
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
!!# trap_asi : 
!!#     asi_load_r %ropr  Ro_traps_asi
!!# ;
!!# 
!!# wrasi : tWRASI_I %ropr  Ro_wrasi_i
!!# ;
!!# reg_tcc : tTcc_R %ropr  Ro_traps_r
!!#      { 
!!#      IJ_printf("diag.j", 569, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      }
!!# ;
!!# 
!!# tcc :
!!#      tTcc_I %ropr  Ro_traps_i  
!!#      | reg_tcc
!!# 
!!# ;
!!# 
!!# ldst_excp : mLDST_EXCP
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
!!#      tFSQRTq | tFSQRTd 
!!# ;
!!# 
!!# br :     tBA | tBN | tBNE | tBE | tBG | tBLE | tBGE | tBL | tBGU  | tBLEU |
!!#          tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBPA | tBPN | tBPNE |
!!#          tBPE | tBPG | tBPLE | tBPGE | tBPL | tBPGU | tBPLEU | tBPCC | tBPCS |
!!#          tBPPOS | tBPNEG | tBPVC | tBPVS
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

