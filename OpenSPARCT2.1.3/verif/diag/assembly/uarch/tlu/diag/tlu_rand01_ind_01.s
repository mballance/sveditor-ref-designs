/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand01_ind_01.s
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
    save; \
    restore; \
    done ;\
    nop; nop; nop; nop; nop
#define H_T1_Trap_Instruction_1
#define My_T1_Trap_Instruction_1 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_T1_Trap_Instruction_2
#define My_T1_Trap_Instruction_2 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_T1_Trap_Instruction_3
#define My_T1_Trap_Instruction_3 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_T1_Trap_Instruction_4
#define My_T1_Trap_Instruction_4 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop

#define H_HT0_Trap_Instruction_0 
#define My_HT0_Trap_Instruction_0 \
    save; \
    restore; \
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Trap_Instruction_2
#define My_HT0_Trap_Instruction_2 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Trap_Instruction_3
#define My_HT0_Trap_Instruction_3 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Trap_Instruction_4
#define My_HT0_Trap_Instruction_4 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    save; \
    restore; \
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_Fp_exception_other_0x22
#define My_HT0_Fp_exception_other_0x22 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop
	
#include "hboot.s"
.text
.global main
main:

    !Start with TL 1
    ta T_CHANGE_TO_TL1

    ! Set up ld/st area per thread
	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	user_data_start, %g1, %g3
	add	%l7, %g3, %l7

! Register init code

	setx 0xc2bca5a1ead703f1, %g1, %g0
	setx 0x7aeb2ca91ca302ef, %g1, %g1
	setx 0xb327ef60281e9f0a, %g1, %g2
	setx 0xce52f1d1b3a66741, %g1, %g3
	setx 0xbaac0317a97b9bc9, %g1, %g4
	setx 0x6980494fa6ee5461, %g1, %g5
	setx 0x499680aec3b59630, %g1, %g6
	setx 0x43949fddcb47f4a3, %g1, %g7
	setx 0xcf996c4f2dbf20c3, %g1, %r16
	setx 0x304610e7585a5cd0, %g1, %r17
	setx 0x58b8bdea91825422, %g1, %r18
	setx 0xa0c5db68c0cad4e0, %g1, %r19
	setx 0xeda6a7a11c5d55f0, %g1, %r20
	setx 0x876a47f9526be42a, %g1, %r21
	setx 0x99e28a6435151c33, %g1, %r22
	setx 0xf4ee33d89aec1ac4, %g1, %r23
	setx 0x7d6164af63960b7c, %g1, %r24
	setx 0x17dde98fc47b6aba, %g1, %r25
	setx 0x9ad6887bf8f5d0e3, %g1, %r26
	setx 0xc3ab8d70ffe20ff6, %g1, %r27
	setx 0xc02e5ba84a025f8c, %g1, %r28
	setx 0x7c508ded2790fc1d, %g1, %r29
	setx 0x10c4ce668aa92ea9, %g1, %r30
	setx 0xe381667f64296dc7, %g1, %r31
	save
	setx 0x8be43a4b8d8da77e, %g1, %r16
	setx 0xf29ce5455dea14ca, %g1, %r17
	setx 0x1976792221dd0074, %g1, %r18
	setx 0x21090022c04b73aa, %g1, %r19
	setx 0x0c801b9e7e2c1019, %g1, %r20
	setx 0xe877730e1027522e, %g1, %r21
	setx 0x8b25a1d422789004, %g1, %r22
	setx 0x02e9928777690a27, %g1, %r23
	setx 0x6953ec3beb0eb030, %g1, %r24
	setx 0xa33238ea211a835e, %g1, %r25
	setx 0xc7faa196654c584c, %g1, %r26
	setx 0x6c1719d27f4445fd, %g1, %r27
	setx 0xbdeb1a2e59876deb, %g1, %r28
	setx 0xe6c1086711adb70c, %g1, %r29
	setx 0xa2b8c0c7bb8b5353, %g1, %r30
	setx 0xe1d4ebe583f86944, %g1, %r31
	save
	setx 0x256f6bdb827594a0, %g1, %r16
	setx 0xba4dfeccb29d0286, %g1, %r17
	setx 0xd948057971a00356, %g1, %r18
	setx 0x82c4dc861be665e7, %g1, %r19
	setx 0x5de694a67332f62e, %g1, %r20
	setx 0x4cd867e2f0309b59, %g1, %r21
	setx 0x8f2a8c6a43bd8522, %g1, %r22
	setx 0x7e7bf981b60bd31d, %g1, %r23
	setx 0xdd9d80c99418ec76, %g1, %r24
	setx 0x640930dfd3c1eeb7, %g1, %r25
	setx 0xd9e1c58011ae4bfd, %g1, %r26
	setx 0xbf3b6710996e57ac, %g1, %r27
	setx 0x32530f37814e089e, %g1, %r28
	setx 0xe28ce2e28e1facbb, %g1, %r29
	setx 0xad1a23fc138a5e57, %g1, %r30
	setx 0x03a5ba207bab7b5f, %g1, %r31
	restore
	restore
	mov 0x35, %r30
	.word 0x83504000  ! 3: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x36700001  ! 12: BPGE	<illegal instruction>
	.word 0x26800001  ! 19: BL	bl,a	<label_0x1>
	.word 0x99d02033  ! 34: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x9050800f  ! 45: UMUL_R	umul 	%r2, %r15, %r8
	.word 0x8a81e001  ! 46: ADDcc_I	addcc 	%r7, 0x0001, %r5
	.word 0x3e800001  ! 57: BVC	bvc,a	<label_0x1>
	.word 0x9fd02035  ! 60: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x85d02030  ! 85: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x9150c000  ! 86: RDPR_TT	rdpr	%tt, %r8
	.word 0x24800001  ! 87: BLE	ble,a	<label_0x1>
	.word 0xd0d02001  ! 88: LDSHA_I	ldsha	[%r0, + 0x0001] %asi, %r8
	.word 0x22700001  ! 93: BPE	<illegal instruction>
	.word 0xd0c80291  ! 94: LDSBA_R	ldsba	[%r0, %r17] 0x14, %r8
	.word 0x9e510001  ! 103: UMUL_R	umul 	%r4, %r1, %r15
	mov 0x30, %r30
	.word 0x9bd0001e  ! 104: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd8782001  ! 111: SWAP_I	swap	%r12, [%r0 + 0x0001]
	mov 0x35, %r30
	.word 0x9bd0001e  ! 116: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8fd0001e  ! 123: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 134: BPOS	bpos,a	<label_0x1>
	.word 0x2c800001  ! 139: BNEG	bneg,a	<label_0x1>
	.word 0xd847c000  ! 140: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x2a800001  ! 145: BCS	bcs,a	<label_0x1>
	.word 0x836ba001  ! 154: SDIVX_I	sdivx	%r14, 0x0001, %r1
	.word 0x2c800001  ! 157: BNEG	bneg,a	<label_0x1>
	mov 0x35, %r30
	.word 0x81d0001e  ! 166: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 185: BGU	bgu,a	<label_0x1>
	.word 0xc207c000  ! 208: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0xc20fc000  ! 211: LDUB_R	ldub	[%r31 + %r0], %r1
	.word 0xc25fe001  ! 212: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0x87802004  ! 229: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x30, %r30
	.word 0x97d0001e  ! 238: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x81d0001e  ! 267: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x97d0001e  ! 268: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x90684009  ! 271: UDIVX_R	udivx 	%r1, %r9, %r8
	.word 0x87d02032  ! 280: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x87802054  ! 289: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xd007e001  ! 294: LDUW_I	lduw	[%r31 + 0x0001], %r8
	mov 0x30, %r30
	.word 0x9fd0001e  ! 295: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x99d0001e  ! 296: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x97d0001e  ! 301: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x9d69e001  ! 304: SDIVX_I	sdivx	%r7, 0x0001, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8bd02034  ! 340: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0xd4796001  ! 353: SWAP_I	swap	%r10, [%r5 + 0x0001]
	mov 0x35, %r30
	.word 0x97d0001e  ! 358: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x946ae001  ! 359: UDIVX_I	udivx 	%r11, 0x0001, %r10
	.word 0x3c700001  ! 366: BPPOS	<illegal instruction>
	.word 0x3c700001  ! 367: BPPOS	<illegal instruction>
	mov 0x31, %r30
	.word 0x97d0001e  ! 372: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x83d0001e  ! 377: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 406: BL	bl,a	<label_0x1>
	.word 0x8dd02031  ! 407: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0xc6f90029  ! 414: SWAPA_R	swapa	%r3, [%r4 + %r9] 0x01
	.word 0xc607e001  ! 429: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc657e001  ! 434: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	mov 0x35, %r30
	.word 0x8fd0001e  ! 439: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc6882001  ! 450: LDUBA_I	lduba	[%r0, + 0x0001] %asi, %r3
	.word 0x8dd02030  ! 455: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x81d02034  ! 474: Tcc_I	tn	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87d02035  ! 488: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x2e700001  ! 489: BPVS	<illegal instruction>
	.word 0x9fd02031  ! 496: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x20800001  ! 507: BN	bn,a	<label_0x1>
	.word 0x94d1e001  ! 508: UMULcc_I	umulcc 	%r7, 0x0001, %r10
	.word 0x91d02034  ! 509: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x92682001  ! 510: UDIVX_I	udivx 	%r0, 0x0001, %r9
	.word 0x97d02032  ! 513: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x9fd02033  ! 514: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 529: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x33, %r30
	.word 0x9bd0001e  ! 532: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x94d26001  ! 533: UMULcc_I	umulcc 	%r9, 0x0001, %r10
	.word 0x87a009e0  ! 536: FDIVq	dis not found

	.word 0x87802016  ! 539: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc6c02001  ! 544: LDSWA_I	ldswa	[%r0, + 0x0001] %asi, %r3
	mov 0x30, %r30
	.word 0x95d0001e  ! 563: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x20800001  ! 571: BN	bn,a	<label_0x1>
	mov 0x33, %r30
	.word 0x89d0001e  ! 572: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 579: BPOS	bpos,a	<label_0x1>
	.word 0x97d02031  ! 586: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0xc60fc000  ! 597: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0xc6d82001  ! 598: LDXA_I	ldxa	[%r0, + 0x0001] %asi, %r3
	.word 0xc6882001  ! 601: LDUBA_I	lduba	[%r0, + 0x0001] %asi, %r3
	.word 0x36700001  ! 606: BPGE	<illegal instruction>
	.word 0x88828009  ! 609: ADDcc_R	addcc 	%r10, %r9, %r4
	.word 0x24800001  ! 614: BLE	ble,a	<label_0x1>
	.word 0x3a800001  ! 615: BCC	bcc,a	<label_0x1>
	.word 0x89d02030  ! 618: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x92002001  ! 621: ADD_I	add 	%r0, 0x0001, %r9
	.word 0x30700001  ! 622: BPA	<illegal instruction>
	.word 0x85d02035  ! 631: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xd247c000  ! 638: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0x97d02030  ! 643: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0xd25fe001  ! 666: LDX_I	ldx	[%r31 + 0x0001], %r9
	mov 0x33, %r30
	.word 0x8bd0001e  ! 675: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x87d0001e  ! 690: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd24fc000  ! 695: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0xd25fc000  ! 698: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x24800001  ! 701: BLE	ble,a	<label_0x1>
	.word 0x89d02031  ! 704: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0x87802004  ! 717: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x32, %r30
	.word 0x81d0001e  ! 718: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8202a001  ! 780: ADD_I	add 	%r10, 0x0001, %r1
	.word 0x26800001  ! 817: BL	bl,a	<label_0x1>
	.word 0x8dd02031  ! 818: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x2a800001  ! 819: BCS	bcs,a	<label_0x1>
	.word 0x93500000  ! 820: RDPR_TPC	rdpr	%tpc, %r9
	mov 0x30, %r30
	.word 0x85d0001e  ! 835: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8fd0001e  ! 846: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x99d02033  ! 847: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xd2d02001  ! 848: LDSHA_I	ldsha	[%r0, + 0x0001] %asi, %r9
	.word 0xd247e001  ! 851: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0x944b0009  ! 852: MULX_R	mulx 	%r12, %r9, %r10
	.word 0x89d02035  ! 853: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x24700001  ! 856: BPLE	<illegal instruction>
	.word 0x8e782001  ! 863: SDIV_I	sdiv 	%r0, 0x0001, %r7
	.word 0x9c4be001  ! 884: MULX_I	mulx 	%r15, 0x0001, %r14
	.word 0x87802010  ! 889: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x2c800001  ! 890: BNEG	bneg,a	<label_0x1>
	.word 0x9ba149ca  ! 901: FDIVd	fdivd	%f36, %f10, %f44
	.word 0xda57c000  ! 906: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0xda57c000  ! 927: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8e79e001  ! 932: SDIV_I	sdiv 	%r7, 0x0001, %r7
	.word 0xce4fe001  ! 939: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0xce0fc000  ! 950: LDUB_R	ldub	[%r31 + %r0], %r7
	mov 0x30, %r30
	.word 0x8fd0001e  ! 959: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x82d16001  ! 962: UMULcc_I	umulcc 	%r5, 0x0001, %r1
	mov 0x31, %r30
	.word 0x85d0001e  ! 973: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x87802054  ! 980: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x3e700001  ! 995: BPVC	<illegal instruction>


.data
user_data_start:
	.xword	0x249615e83e8f6650
	.xword	0x881f5923f8466c52
	.xword	0x04461c361e9ed943
	.xword	0xe86a0cd7b842e088
	.xword	0x9f9c38affec93dda
	.xword	0x150f2df8fbb816b7
	.xword	0xb5573066003687c3
	.xword	0xf791216fe8757a24
	.xword	0x0a9b78fe1a0e768d
	.xword	0xfa6df29b0cb5f22b
	.xword	0x606e7090d404079c
	.xword	0x8d42a31be36e06ae
	.xword	0x6b0204e7a1422697
	.xword	0x4d0ca9ade5b65648
	.xword	0x0451f55c1ba24929
	.xword	0xa05f431f777d2fa2


.text
    ta T_GOOD_TRAP
.data
    .xword 0x0

#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Thu Mar 25 09:21:39 2004
!!#  */
!!# 
!!# %%section c_declarations
!!# 
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
!!#     IJ_bind_thread_group("diag.j", 22, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 25, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     // Register usage - use 0-28 //
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
!!#     IJ_set_ropr_fld("diag.j", 39, Ro_wrasi_i, Ft_Rs1, "{0x0}");
!!#     IJ_set_ropr_fld("diag.j", 40, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x45, 0x54}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 43, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 44, Ro_nontrap_ldasi, Ft_Rs1, "{0x0}");
!!#     IJ_set_ropr_fld("diag.j", 45, Ro_nontrap_ldasi, Ft_Rs2, "{0x31}");
!!#     IJ_set_ropr_fld("diag.j", 46, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 49, Ro_nontrap_ld, Fm_align_Simm13, "{0x0, 0x7}");
!!#     IJ_set_ropr_fld("diag.j", 50, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 54, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 55, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_trap_ldasi, Ft_Simm13, "{0}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 59, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 65, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 66, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // Weights
!!#     IJ_set_rvar("diag.j", 69, wt_high, "{6}");
!!#     IJ_set_rvar("diag.j", 70, wt_med,  "{3}");
!!#     IJ_set_rvar("diag.j", 71, wt_low,  "{1}");
!!# 
!!#     // Initialize registers ..
!!#     IJ_init_regs_by_setx ("diag.j", 74, th0, 3, 2, Rv_rand_64);
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 79, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 16; i++) {
!!#         IJ_printf  ("diag.j", 81, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 225, th0, $2);
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
!!# trap_asi : mTRAP_ASI
!!#     asi_load_r %ropr  Ro_traps_asi |
!!#     asi_load_i %ropr  Ro_traps_asi
!!# ;
!!# 
!!# wrasi : tWRASI_I %ropr  Ro_wrasi_i
!!# 
!!# reg_tcc : tTcc_R %ropr  Ro_traps_r
!!#      { 
!!#      IJ_printf("diag.j", 268, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!# ldstasi_excp : mLDSTASI_EXCP
!!#         asi_load_r %ropr  Ro_nontrap_ldasi |
!!#         asi_load_r %ropr  Ro_nontrap_ldasi 
!!# ;
!!# 
!!# ldds: tLDD_R | tLDD_I | tLDDA_I  | tLDDA_R
!!# ;
!!# 
!!# stds:  tSTDA_R | tSTDA_I | tSTD_R | tSTD_I
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R 
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I 
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
!!#      tUDIVX_I | tFDIVs | tFDIVd | tFDIVq | tSWAP_I | tSWAPA_R | tCASA_I
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
