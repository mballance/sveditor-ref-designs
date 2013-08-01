/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand01_ind_09.s
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

    !Start with TL 1
    ta T_CHANGE_TO_TL1

    ! Set up ld/st area per thread
	ta	T_RD_THID   ! Result in %o1 = r9
	umul	%r9, 256, %r31
	setx	user_data_start, %r1, %r3
	add	%r31, %r3, %r31
    wr  %r0, 0x4, %asi

!Initialializing registers
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
	.word 0x81494000  ! 3: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0xc127e001  ! 8: STF_I	st	%f0, [0x0001, %r31]
	.word 0xc0d7e000  ! 9: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r0
	mov 0x30, %r30
	.word 0x99d0001e  ! 12: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xc037e001  ! 13: STH_I	sth	%r0, [%r31 + 0x0001]
	.word 0x8dd02032  ! 14: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x24700001  ! 25: BPLE	<illegal instruction>
	.word 0x9a7b2001  ! 28: SDIV_I	sdiv 	%r12, 0x0001, %r13
	mov 0x35, %r30
	.word 0x95d0001e  ! 31: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xdb3fe001  ! 32: STDF_I	std	%f13, [0x0001, %r31]
	.word 0x97d02034  ! 33: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x20800001  ! 34: BN	bn,a	<label_0x1>
	.word 0x24700001  ! 35: BPLE	<illegal instruction>
	.word 0xda57c000  ! 36: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0xda87e000  ! 37: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r13
	.word 0xdac7e030  ! 46: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x34700001  ! 49: BPG	<illegal instruction>
	.word 0xdad7e010  ! 54: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0xda57c000  ! 55: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8051000e  ! 62: UMUL_R	umul 	%r4, %r14, %r0
	.word 0x8d802000  ! 63: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81d02034  ! 64: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0xc13fc00e  ! 69: STDF_R	std	%f0, [%r14, %r31]
	.word 0x9151c000  ! 74: RDPR_TL	rdpr	%tl, %r8
	.word 0xd04fe001  ! 75: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x87802004  ! 76: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02031  ! 79: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8dd02033  ! 84: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x9248000d  ! 87: MULX_R	mulx 	%r0, %r13, %r9
	.word 0xd20fc000  ! 102: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0xd217c000  ! 111: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0xd20fe001  ! 112: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0xd24fe001  ! 113: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0xd20fe001  ! 118: LDUB_I	ldub	[%r31 + 0x0001], %r9
	mov 0x30, %r30
	.word 0x81d0001e  ! 119: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9f508000  ! 120: RDPR_TSTATE	rdpr	%tstate, %r15
	mov 0x34, %r30
	.word 0x95d0001e  ! 141: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x89d02034  ! 142: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	mov 0x30, %r30
	.word 0x9fd0001e  ! 147: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xdec7e010  ! 148: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97d02035  ! 152: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x91500000  ! 155: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xd117c000  ! 156: LDQF_R	-	[%r31, %r0], %f8
	ta	T_CHANGE_PRIV	! macro
	mov 0x35, %r30
	.word 0x91d0001e  ! 162: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd057e001  ! 163: LDSH_I	ldsh	[%r31 + 0x0001], %r8
	mov 0x35, %r30
	.word 0x89d0001e  ! 164: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93514000  ! 168: RDPR_TBA	rdpr	%tba, %r9
	.word 0x93d02030  ! 171: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xd327e001  ! 172: STF_I	st	%f9, [0x0001, %r31]
	.word 0x32700001  ! 173: BPNE	<illegal instruction>
	.word 0x28700001  ! 176: BPLEU	<illegal instruction>
	.word 0x24800001  ! 181: BLE	ble,a	<label_0x1>
	.word 0x36800001  ! 182: BGE	bge,a	<label_0x1>
	.word 0xd2cfe000  ! 183: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	mov 0x30, %r30
	.word 0x8bd0001e  ! 190: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd2c7e030  ! 193: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0x9f480000  ! 198: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x3a700001  ! 201: BPCC	<illegal instruction>
	.word 0xded7e000  ! 202: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r15
	.word 0x8d50c000  ! 203: RDPR_TT	rdpr	%tt, %r6
	mov 0x33, %r30
	.word 0x89d0001e  ! 204: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xcd27c00d  ! 209: STF_R	st	%f6, [%r13, %r31]
	.word 0x8c824005  ! 210: ADDcc_R	addcc 	%r9, %r5, %r6
	.word 0x9dd02034  ! 217: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xcc07c000  ! 220: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0xcc97e010  ! 221: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r6
	.word 0x93d02030  ! 228: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xccc7e010  ! 233: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	.word 0x9950c000  ! 234: RDPR_TT	rdpr	%tt, %r12
	.word 0xd85fe001  ! 235: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0x95a00542  ! 238: FSQRTd	fsqrt	
	.word 0x2a800001  ! 239: BCS	bcs,a	<label_0x1>
	.word 0xd4c804a0  ! 240: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x83d02035  ! 243: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x9551c000  ! 244: RDPR_TL	rdpr	%tl, %r10
	.word 0x95504000  ! 245: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 249: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x30, %r30
	.word 0x97d0001e  ! 254: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87d02034  ! 258: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 261: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd487e020  ! 264: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r10
	.word 0x34700001  ! 271: BPG	<illegal instruction>
	.word 0xd40fe001  ! 272: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0xd4cfe000  ! 273: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	mov 0x34, %r30
	.word 0x87d0001e  ! 276: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x87802054  ! 277: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xd48fe020  ! 284: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	mov 0x34, %r30
	.word 0x83d0001e  ! 285: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99504000  ! 286: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x8d802000  ! 287: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 290: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8bd02034  ! 301: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x83d02035  ! 304: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 311: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x34, %r30
	.word 0x87d0001e  ! 312: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x8bd0001e  ! 313: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x89d0001e  ! 314: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x8dd0001e  ! 321: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8fd02035  ! 326: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x28800001  ! 337: BLEU	bleu,a	<label_0x1>
	.word 0xd857c000  ! 344: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x8d802000  ! 349: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x904ba001  ! 350: MULX_I	mulx 	%r14, 0x0001, %r8
	.word 0xd0dfe030  ! 353: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	mov 0x35, %r30
	.word 0x89d0001e  ! 354: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd0d7e010  ! 377: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	.word 0x83d02034  ! 378: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x85d02034  ! 379: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x8883a001  ! 380: ADDcc_I	addcc 	%r14, 0x0001, %r4
	.word 0xc857e001  ! 381: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0xc9e34020  ! 390: CASA_I	casa	[%r13] 0x 1, %r0, %r4
	.word 0x8d802000  ! 393: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc897e020  ! 394: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r4
	.word 0xcde00020  ! 401: CASA_I	casa	[%r0] 0x 1, %r0, %r6
	.word 0xccc804a0  ! 402: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x36800001  ! 405: BGE	bge,a	<label_0x1>
	.word 0x26800001  ! 406: BL	bl,a	<label_0x1>
	.word 0x83a2c9ab  ! 415: FDIVs	fdivs	%f11, %f11, %f1
	.word 0xc2cfe000  ! 422: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0xc2c80e60  ! 431: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r1
	.word 0xc22fe001  ! 432: STB_I	stb	%r1, [%r31 + 0x0001]
	mov 0x33, %r30
	.word 0x83d0001e  ! 433: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x2a700001  ! 438: BPCS	<illegal instruction>
	.word 0x89d02030  ! 439: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x85d02035  ! 442: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xc2cfe000  ! 447: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0x9551c000  ! 456: RDPR_TL	rdpr	%tl, %r10
	.word 0xd40fe001  ! 459: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x87802010  ! 460: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x34, %r30
	.word 0x9bd0001e  ! 461: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 466: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89a0054e  ! 472: FSQRTd	fsqrt	
	.word 0xc80fe001  ! 475: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0xc8d00e40  ! 476: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r4
	.word 0xc817c000  ! 481: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x85a00541  ! 482: FSQRTd	fsqrt	
	.word 0x8d802000  ! 485: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802054  ! 488: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x8d802000  ! 493: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83a349cb  ! 494: FDIVd	fdivd	%f44, %f42, %f32
	.word 0xc2bfc02b  ! 497: STDA_R	stda	%r1, [%r31 + %r11] 0x01
	.word 0xc247e001  ! 498: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0x87802014  ! 513: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802016  ! 514: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x32, %r30
	.word 0x95d0001e  ! 515: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8679c00f  ! 518: SDIV_R	sdiv 	%r7, %r15, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89686001  ! 524: SDIVX_I	sdivx	%r1, 0x0001, %r4
	.word 0xc837c00f  ! 527: STH_R	sth	%r4, [%r31 + %r15]
	.word 0xc8cfe010  ! 528: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0xc83fc00f  ! 529: STD_R	std	%r4, [%r31 + %r15]
	mov 0x31, %r30
	.word 0x9fd0001e  ! 532: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 533: BPA	<illegal instruction>
	.word 0xc857c000  ! 536: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0xc887e030  ! 537: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r4
	mov 0x32, %r30
	.word 0x95d0001e  ! 538: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x34, %r30
	.word 0x89d0001e  ! 542: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc817c000  ! 543: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x87d02032  ! 544: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0xc8d804a0  ! 553: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x9bd02035  ! 556: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xc917c000  ! 559: LDQF_R	-	[%r31, %r0], %f4
	.word 0x8d480000  ! 562: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x916ac004  ! 569: SDIVX_R	sdivx	%r11, %r4, %r8
	.word 0xd08804a0  ! 570: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x91d02034  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd097e030  ! 576: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	.word 0xd097e020  ! 577: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0xd08804a0  ! 580: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0xd007e001  ! 581: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8d802000  ! 582: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x32800001  ! 586: BNE	bne,a	<label_0x1>
	.word 0xd127e001  ! 589: STF_I	st	%f8, [0x0001, %r31]
	.word 0xd1e3802a  ! 590: CASA_I	casa	[%r14] 0x 1, %r10, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x90d12001  ! 600: UMULcc_I	umulcc 	%r4, 0x0001, %r8
	.word 0xd197e001  ! 603: LDQFA_I	-	[%r31, 0x0001], %f8
	.word 0xd017e001  ! 604: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0xd0dfe010  ! 605: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0x94dbc000  ! 608: SMULcc_R	smulcc 	%r15, %r0, %r10
	.word 0x8cd9c001  ! 609: SMULcc_R	smulcc 	%r7, %r1, %r6
	.word 0x9dd02034  ! 618: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xcc0fe001  ! 621: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0xcc17c000  ! 622: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0x80026001  ! 623: ADD_I	add 	%r9, 0x0001, %r0
	.word 0xc0c004a0  ! 624: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	mov 0x35, %r30
	.word 0x89d0001e  ! 625: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x89d0001e  ! 628: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc0cfe020  ! 635: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r0
	.word 0x87802004  ! 636: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc0c004a0  ! 639: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0xc0800e60  ! 642: LDUWA_R	lduwa	[%r0, %r0] 0x73, %r0
	.word 0xc087e010  ! 645: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r0
	.word 0xc0c80e60  ! 646: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r0
	mov 0x35, %r30
	.word 0x8bd0001e  ! 649: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x9a50400e  ! 656: UMUL_R	umul 	%r1, %r14, %r13
	.word 0xdb27c00e  ! 657: STF_R	st	%f13, [%r14, %r31]
	.word 0x24800001  ! 658: BLE	ble,a	<label_0x1>
	.word 0x87802054  ! 659: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xda07c000  ! 662: LDUW_R	lduw	[%r31 + %r0], %r13
	mov 0x31, %r30
	.word 0x87d0001e  ! 663: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9150c000  ! 664: RDPR_TT	rdpr	%tt, %r8
	.word 0x87802014  ! 667: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd05fc000  ! 676: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x9fd02032  ! 689: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	mov 0x34, %r30
	.word 0x93d0001e  ! 690: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 691: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd007e001  ! 694: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x9dd02031  ! 695: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0xd0c004a0  ! 696: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xd0c7e000  ! 697: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	.word 0x28700001  ! 698: BPLEU	<illegal instruction>
	.word 0xd04fc000  ! 707: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xd087e010  ! 708: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r8
	.word 0xd117c000  ! 709: LDQF_R	-	[%r31, %r0], %f8
	.word 0x2a700001  ! 710: BPCS	<illegal instruction>
	.word 0xd097e000  ! 711: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0x83d02035  ! 714: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d698009  ! 717: SDIVX_R	sdivx	%r6, %r9, %r6
	.word 0x8d802004  ! 718: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcc97e000  ! 719: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x30700001  ! 725: BPA	<illegal instruction>
	.word 0x99a00564  ! 726: FSQRTq	fsqrt	
	.word 0x30800001  ! 733: BA	ba,a	<label_0x1>
	.word 0xd85fc000  ! 734: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8dfe020  ! 735: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	mov 0x35, %r30
	.word 0x9bd0001e  ! 736: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x9ba2c9a5  ! 739: FDIVs	fdivs	%f11, %f5, %f13
	.word 0x93d02031  ! 742: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xdac80e60  ! 749: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r13
	.word 0xdac7e010  ! 754: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0xdad804a0  ! 757: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xda97e000  ! 760: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0x36800001  ! 763: BGE	bge,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdac7e030  ! 771: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0xda0fe001  ! 772: LDUB_I	ldub	[%r31 + 0x0001], %r13
	mov 0x33, %r30
	.word 0x85d0001e  ! 777: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xda5fe001  ! 778: LDX_I	ldx	[%r31 + 0x0001], %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802010  ! 786: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87802045  ! 791: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xda57c000  ! 792: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x28800001  ! 793: BLEU	bleu,a	<label_0x1>
	.word 0x83d02035  ! 794: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x3e800001  ! 797: BVC	bvc,a	<label_0x1>
	.word 0xda8fe000  ! 798: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0xda17c000  ! 803: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x87802016  ! 804: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x32, %r30
	.word 0x81d0001e  ! 805: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 808: BLEU	bleu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xda57e001  ! 820: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0xdb17c000  ! 821: LDQF_R	-	[%r31, %r0], %f13
	.word 0x24800001  ! 826: BLE	ble,a	<label_0x1>
	mov 0x31, %r30
	.word 0x8fd0001e  ! 827: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x87802054  ! 828: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x8283a001  ! 829: ADDcc_I	addcc 	%r14, 0x0001, %r1
	.word 0x81d02033  ! 836: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0xc20fe001  ! 845: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0x86d0a001  ! 850: UMULcc_I	umulcc 	%r2, 0x0001, %r3
	mov 0x31, %r30
	.word 0x93d0001e  ! 859: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x9bd0001e  ! 862: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8fd0001e  ! 865: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2e800001  ! 871: BVS	bvs,a	<label_0x1>
	.word 0xc6d00e80  ! 878: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r3
	.word 0x87802016  ! 879: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x89d02031  ! 882: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0xc68fe020  ! 883: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0x8d802000  ! 884: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e800001  ! 887: BVC	bvc,a	<label_0x1>
	.word 0x8d802000  ! 888: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc65fe001  ! 893: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0x8d802004  ! 896: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x3e700001  ! 901: BPVC	<illegal instruction>
	.word 0xd6f9802e  ! 902: SWAPA_R	swapa	%r11, [%r6 + %r14] 0x01
	.word 0x8bd02034  ! 905: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x34800001  ! 906: BG	bg,a	<label_0x1>
	.word 0x95d02035  ! 911: Tcc_I	tg	icc_or_xcc, %r0 + 53
	mov 0x32, %r30
	.word 0x89d0001e  ! 912: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd607e001  ! 913: LDUW_I	lduw	[%r31 + 0x0001], %r11
	mov 0x35, %r30
	.word 0x93d0001e  ! 914: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd6d7e030  ! 915: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x97d02033  ! 922: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0xd63fe001  ! 923: STD_I	std	%r11, [%r31 + 0x0001]
	mov 0x32, %r30
	.word 0x99d0001e  ! 924: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x9a6a6001  ! 925: UDIVX_I	udivx 	%r9, 0x0001, %r13
	.word 0x8d802004  ! 926: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdac7e030  ! 927: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0xda87e020  ! 932: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r13
	.word 0xdadfe010  ! 935: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0xda8fe030  ! 938: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	mov 0x31, %r30
	.word 0x93d0001e  ! 939: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8fd02033  ! 940: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0xdac004a0  ! 943: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x81692001  ! 952: SDIVX_I	sdivx	%r4, 0x0001, %r0
	mov 0x35, %r30
	.word 0x95d0001e  ! 955: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc08004a0  ! 956: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r0
	mov 0x32, %r30
	.word 0x95d0001e  ! 959: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc0c804a0  ! 960: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x97d02034  ! 961: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0xc0d804a0  ! 966: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x8fd02034  ! 967: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x91d02033  ! 970: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc007e001  ! 971: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc00fe001  ! 972: LDUB_I	ldub	[%r31 + 0x0001], %r0
	.word 0xd9e00029  ! 983: CASA_I	casa	[%r0] 0x 1, %r9, %r12
	.word 0x87802004  ! 986: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 997: WRFPRS_I	wr	%r0, 0x0000, %fprs


.data
user_data_start:
	.xword	0xd9bfa99426db4f54
	.xword	0xc61e3599d0a7a38e
	.xword	0xe8e11f6cda58cd08
	.xword	0xd469b4cadfef6304
	.xword	0xfe640a078688cdc9
	.xword	0x021b4c0e561f6445
	.xword	0x328ab10a5099814c
	.xword	0xb6afa4c44a58cc26
	.xword	0xc718e7c455e1a0d6
	.xword	0x274918d8bcfa669c
	.xword	0x3a69ae77f2de4f72
	.xword	0xd97c88fa57c2f39b
	.xword	0xcb0d0f0ad85ca6d8
	.xword	0xf4173012a5bbac84
	.xword	0xc58a98841fd76f83
	.xword	0x1443eb316d5626ba
	.xword	0xf658be66c82779d7
	.xword	0x764a93dd0089e0a4
	.xword	0x267319deff4b9ba2
	.xword	0x4ef9d73ad42de9bd
	.xword	0x02a0612dc08de3db
	.xword	0x585321ea7ed06c54
	.xword	0xf915e9365864544e
	.xword	0x271767dca0338d16
	.xword	0xae56bf3a355852e6
	.xword	0x135bf9e8a475f8bd
	.xword	0xc5184da6f3188dd5
	.xword	0x4fd319d621a86534
	.xword	0x8a4bb29675c3bc5b
	.xword	0x9cd3abf0a496e94f
	.xword	0xa505c77f93899a76
	.xword	0xcff3e983c280a543
	.xword	0x90c3f23e62407914
	.xword	0xdc26c0fb456833dc
	.xword	0xf3f3c2d6c406cd17
	.xword	0x4614ffc2aa113f86
	.xword	0x5807a1e0f2ecadfa
	.xword	0x36b67563e9d4cfde
	.xword	0xda5ea879c33c5017
	.xword	0xa170ff4ab058db0f
	.xword	0x4b8ea5f4f2799335
	.xword	0xf1de8417f78e13a7
	.xword	0x568bb6620148d3ca
	.xword	0xd531f6ff1d463c3b
	.xword	0x59bdc6f18e3e23b9
	.xword	0x8a47b0bbc9d148aa
	.xword	0x7009c1bdf840693e
	.xword	0x2639867dc1acb55b
	.xword	0x39741e940ae48eb5
	.xword	0x81fd6f2e4af84e3d
	.xword	0xf95f8310c2aafef6
	.xword	0xdfbe707e9873c8ee
	.xword	0x6ed37f37bb659aa1
	.xword	0xe1026f2663c2ece5
	.xword	0x299f3fa721964d88
	.xword	0x2ab3e5e3aa5fa1e9
	.xword	0x209cbc20e6f3b244
	.xword	0xa941bd641d3f2682
	.xword	0x29724e8181b7d190
	.xword	0xa640b88cef39e231
	.xword	0x8f32ccff5b8729ef
	.xword	0x03eba2410281706f
	.xword	0x429aca9add8a691c
	.xword	0x069d5c73a02ed56b
	.xword	0x26e9393de2742d3d
	.xword	0x0ec2f1de06771ee1
	.xword	0xe580d615c7aca5fc
	.xword	0x691ae7e6e5c297a8
	.xword	0x2122199bae334594
	.xword	0x175cb15e77bc607a
	.xword	0x127172c1ec611a96
	.xword	0xff1f75390d5f4844
	.xword	0x820c2d96b88e441b
	.xword	0x58e0d583c84ac138
	.xword	0xce0bc4d0ba3652af
	.xword	0x7208544b7c2b197e
	.xword	0x0346e9162b4e7fdd
	.xword	0x85be86750aec0710
	.xword	0x3bfa2f482f9b9e1a
	.xword	0x2cc483cdbcef166a
	.xword	0x08fda66cfebc1680
	.xword	0x22c24ee5e81a0175
	.xword	0xfa3c6096447672d6
	.xword	0xfe316416eba2a03d
	.xword	0x8993516c4705cdf6
	.xword	0xa4dc7bea277fa6d2
	.xword	0x0e29f4487a5651a2
	.xword	0x38f6d1f177ac5b32
	.xword	0x5ae3a3ffadf6c75f
	.xword	0xe73772c6d635bb52
	.xword	0xa1c4f26b4fceffa8
	.xword	0xe014170484f548e5
	.xword	0xf4881c7dcec73632
	.xword	0x32c795ccb2396c08
	.xword	0x3d5a6a3dfe20e443
	.xword	0x826da5ffd8c49071
	.xword	0x608a1aa31ab96086
	.xword	0x67c7c439dc976871
	.xword	0x27235b5517c3c95c
	.xword	0x412d481561506585
	.xword	0x52ba2f5e961e1028
	.xword	0xb750dd76b54ca614
	.xword	0xd27d8740cd0038fd
	.xword	0x8099b0799abb07ef
	.xword	0x508f4a126353a510
	.xword	0x84b066909126b39c
	.xword	0x4c051b2cf78e163a
	.xword	0x91ee0cbafdded355
	.xword	0x29bc73289da7e0a4
	.xword	0x0ba4f0318959be58
	.xword	0x9d29335940521882
	.xword	0x39fbb7bf3cc0859f
	.xword	0x39bc8d2c1f1151ec
	.xword	0xc335a7b3cce5c0b7
	.xword	0x5c6c1f4a46f408c8
	.xword	0x43b7502996b2aaca
	.xword	0xa965ea3917984a9b
	.xword	0x391107262fc15493
	.xword	0xfa29cd40c1b9e61f
	.xword	0x6498df7eac8c39b4
	.xword	0x06cf8a272eef6108
	.xword	0x758621fedb33de4f
	.xword	0x52eb32337b3d1693
	.xword	0x996ff94b480c10c8
	.xword	0xb353abbbf1df9d19
	.xword	0x95360f4a0182ee43
	.xword	0x488d5f6fb64b6119
	.xword	0xe301c64a6871898f
	.xword	0x0f02804af72c9140
	.xword	0x82e0d40efc0768be
	.xword	0xf48c29c0f5631d3d
	.xword	0xf19a1bbd06dda8e4
	.xword	0xbb530b07a3ac887e
	.xword	0x95314e0689205713
	.xword	0x777ca4ae1414eed5
	.xword	0x09fdf3c6094376dc
	.xword	0x776bf964349d3451
	.xword	0x6b5d00f89822ad8c
	.xword	0xcd2409c974cccb66
	.xword	0xc263b96b8da8169d
	.xword	0x2d9e706b75ed38b0
	.xword	0x52dfd8567879e06a
	.xword	0x89b08d294d4decf5
	.xword	0xa66005e9a313f13b
	.xword	0x980d0ae950363971
	.xword	0xd4b6620de28911d3
	.xword	0x4f45a3dc54a0cf46
	.xword	0x51a822c29a3606c6
	.xword	0xeda05adddf374a23
	.xword	0xf4b6cf106f4e95fd
	.xword	0xb17ea5f9d58ee60d
	.xword	0x0936e47fce206edf
	.xword	0x4be64a07231b1a9f
	.xword	0xdaf2bbad7b209bcb
	.xword	0xe553d232c7256497
	.xword	0x50092e47a3444fb7
	.xword	0xfa6a36bfad37feab
	.xword	0x08a68ae9bc7b3c09
	.xword	0x454057c00db29ed5
	.xword	0x2a063c582f967fdf
	.xword	0xe9aab6e8ce29c675
	.xword	0x0999069303f7986c
	.xword	0xc6ab67b89d8f8933
	.xword	0x45bd78d3260d6788
	.xword	0x0d4214bb2747f6fd
	.xword	0x15c06338d96a282a
	.xword	0x275a5a5705f9a7a6
	.xword	0xb4eafeb8b1349c58
	.xword	0x0e0872db927678a4
	.xword	0xf5df01854877c99f
	.xword	0x0264292aaecaed69
	.xword	0x1fefb80563d4c760
	.xword	0xb9d46af64ce8c710
	.xword	0x3b06307d067905a0
	.xword	0x8f5983661943f2ff
	.xword	0x23f1bd9d0627b607
	.xword	0x4b1512f2c327cefa
	.xword	0xf4eb3fc632e0ed46
	.xword	0x0b843f152c754ced
	.xword	0x9d319700736e906e
	.xword	0x3200f53fb95d0c83
	.xword	0xe87baa23f2ea9b61
	.xword	0x4e074ad9f9def5f2
	.xword	0x77b1e91b4d5c3164
	.xword	0x870d816c9aae586b
	.xword	0x01dd4395d7df3602
	.xword	0x646852a947768256
	.xword	0x91ce0169ff5c86d6
	.xword	0xf392d18f99ba311e
	.xword	0xdb5fda28619b4e19
	.xword	0x9967b2bbcab66bc3
	.xword	0x637a35a0993708eb
	.xword	0xeb97906133e5d59a
	.xword	0xada7ce8f5e3da53e
	.xword	0xeaf49989435e339b
	.xword	0x855f38789db278cd
	.xword	0xc9c9c241c2525ed0
	.xword	0x9db9f30af160c97a
	.xword	0x32ad42cb7d63abc3
	.xword	0x805690b7a82dce7a
	.xword	0x5b059094b135c4bb
	.xword	0xc4527b34756d1e14
	.xword	0x17fd2cfd8c873deb
	.xword	0xac46f46f0edf9cc2
	.xword	0x2a5e43844cf069ac
	.xword	0x426d0c23953f8d9c
	.xword	0x3d3a2d9e1807bb4c
	.xword	0x14e760518bf2821f
	.xword	0x9d5747dc69b9a540
	.xword	0x591bda52e8b8a265
	.xword	0x1fed5a26b7d379bb
	.xword	0x86c5d31e20baae0c
	.xword	0x5078a9f2a3b97ee8
	.xword	0x2e8b572b90745660
	.xword	0x19a6b57a103506df
	.xword	0x5afedaaec60cd194
	.xword	0xa4ea272474d002e8
	.xword	0x87ed4894e064b912
	.xword	0x5a7016206da56a43
	.xword	0xe1dd565ec2d163c1
	.xword	0x982c422dc6ad7e85
	.xword	0x444a83d80a87db92
	.xword	0x45a5e54d68335243
	.xword	0xb8a2b7b4ebcfa216
	.xword	0x2815e6c9f5cf9105
	.xword	0x693d4a3a738a1cee
	.xword	0x82ecce3c09d072fd
	.xword	0xeb277b0f5e31a5d5
	.xword	0x36e53eea3e3b4ed9
	.xword	0x1a8484e03aeff22d
	.xword	0x1397c7c09f3fd508
	.xword	0x67c5df3afef8b6bb
	.xword	0xf17fcf56ace93df7
	.xword	0x1e433962c3c54273
	.xword	0x997cb02838a7872b
	.xword	0x9e196d81b9565f0b
	.xword	0xad25ebaff289a981
	.xword	0x8c809f0d93f69b5f
	.xword	0x4d37c02f050b563c
	.xword	0xd10d389415cdb4d3
	.xword	0xd6cf6a5d42468638
	.xword	0x027dca3132632d84
	.xword	0x14dda5bb19ea9ade
	.xword	0x95721f830bef5196
	.xword	0x061fc3ae355f4fff
	.xword	0x752b31fffbb9849c
	.xword	0x6359eff83ea25a8d
	.xword	0xec09bb0acea9e67f
	.xword	0x31be1b718f1e99d5
	.xword	0x2eb434265bbd7f33
	.xword	0x43dbe94a88f79f11
	.xword	0xeb897024f7e12e61
	.xword	0x37a048b93b78fb03
	.xword	0x39df375434d26099
	.xword	0x40712cebb6607a4f
	.xword	0x5dccdb92d12a6656


.text
    ta T_GOOD_TRAP
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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Tue Mar 30 09:54:34 2004
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
!!#     IJ_bind_thread_group("diag.j", 24, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 27, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!#     IJ_set_ropr_fld("diag.j", 33, ijdefault, Ft_Rs1, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 34, ijdefault, Ft_Rs2, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 35, ijdefault, Ft_Rd, "5'b0rrrr");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 38, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 41, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 42, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x45, 0x54}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 45, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 46, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 47, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 48, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_nontrap_ld, Fm_align_Simm13, "{0x0, 0x7}");
!!#     IJ_set_ropr_fld("diag.j", 52, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 53, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 58, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 59, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 65, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 69, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 72, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 73, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Weights
!!#     IJ_set_rvar("diag.j", 76, wt_high, "{6}");
!!#     IJ_set_rvar("diag.j", 77, wt_med,  "{3}");
!!#     IJ_set_rvar("diag.j", 78, wt_low,  "{1}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 82, th0,"!Initialializing registers\n");
!!#     for (k=0; k<3; k++) {
!!#         for (i = 0; i < 31; i++) {
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 86, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 88, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 91, th0,"\trestore\n");
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
!!#     IJ_printf  ("diag.j", 97, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 99, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 390, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_low
!!#         |  trap_asi     %rvar  wt_low
!!#         |  tcc          %rvar  wt_high
!!#         | ldst_excp     %rvar  wt_med
!!#         | ldstasi_excp  %rvar  wt_med
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
!!#      IJ_printf("diag.j", 438, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#      tUDIVX_I | tFDIVs | tFDIVd | tFDIVq | tSWAP_I | tSWAPA_R | tCASA_I |
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
