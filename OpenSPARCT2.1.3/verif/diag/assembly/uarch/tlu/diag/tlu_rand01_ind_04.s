/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand01_ind_04.s
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
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore; \
    nop; nop
#define H_T1_Trap_Instruction_1
#define My_T1_Trap_Instruction_1 \
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    illtrap;\
    retry ;\
    nop; nop; 
#define H_T1_Trap_Instruction_2
#define My_T1_Trap_Instruction_2 \
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore; \
    nop; nop
#define H_T1_Trap_Instruction_3
#define My_T1_Trap_Instruction_3 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_T1_Trap_Instruction_4
#define My_T1_Trap_Instruction_4 \
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry ;\
    illtrap; \
    nop; nop
#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    sdiv    %r2, %r10, %r0; \
    retry ;\
    nop; nop

#define H_HT0_Trap_Instruction_0 
#define My_HT0_Trap_Instruction_0 \
    save; \
    restore; \
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore; nop; nop 
#define H_HT0_Trap_Instruction_2
#define My_HT0_Trap_Instruction_2 \
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    sdiv    %r2, %r0, %r0; \
    retry ;\
    nop; nop
#define H_HT0_Trap_Instruction_3
#define My_HT0_Trap_Instruction_3 \
    rdpr %tnpc, %g2; \
    illtrap ;\
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry ;\
    nop; nop
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
    rd %pc, %g2; \
    add %g2, 28, %g2;\
    rdpr %tl, %g3;\
    inc %g3;\
    wrpr %g3, %tl; \
    wrpr %g2, %tpc;\
    retry; done
#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    save ;\
    restore ;\
    done ;\
    nop; nop; nop; nop; nop
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore; \
    nop; nop
#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop; nop; nop;
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop; nop; nop;
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop; nop; nop;
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
    rdpr %tpc, %g2; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tnpc; \
    retry ;\
    nop; nop
#define H_HT0_Fp_exception_other_0x22
#define My_HT0_Fp_exception_other_0x22 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_HT0_Division_By_Zero
#define My_HT0_Division_By_Zero \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_T1_Division_By_Zero_0x28
#define My_H_T1_Division_By_Zero_0x28 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_T1_Fp_Exception_Other_0x22
#define My_H_T1_Fp_Exception_Other_0x22 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop
#define H_T1_Privileged_Opcode_0x11
#define SUN_H_T1_Privileged_Opcode_0x11 \
    save; \
    restore;\
    done; \
    nop; nop; nop; nop; nop

#define H_T1_Fp_Disabled_0x20
#define My_H_T1_Fp_Disabled_0x20 \
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    retry;\
    nop; nop; nop; nop; nop


#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
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
	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	user_data_start, %g1, %g3
	add	%l7, %g3, %l7

! Register init code

	setx 0xd6fe33dd7edfd459, %g1, %g0
	setx 0xa18628ae745539eb, %g1, %g1
	setx 0x2c9968e98cdc6c22, %g1, %g2
	setx 0x53e384e91893f2f7, %g1, %g3
	setx 0xdaf214c3693e8326, %g1, %g4
	setx 0xafe22c3381b3748d, %g1, %g5
	setx 0x42bf9a8111aa8e37, %g1, %g6
	setx 0xbf7458b64a209357, %g1, %g7
	setx 0x0fe7d96629acd853, %g1, %r16
	setx 0x74affce812c7b3d3, %g1, %r17
	setx 0x42e1e2c11f6495fb, %g1, %r18
	setx 0x2df86a2b843e039e, %g1, %r19
	setx 0x34626a76887e6105, %g1, %r20
	setx 0xc101161c2d235086, %g1, %r21
	setx 0x41b65e3f5b73c266, %g1, %r22
	setx 0xf5fb1f30ec60daa5, %g1, %r23
	setx 0xc18cdd7753825239, %g1, %r24
	setx 0xb15811da06cabf0b, %g1, %r25
	setx 0xa1371bd005b0c2bb, %g1, %r26
	setx 0x0d2516eb1c023ca5, %g1, %r27
	setx 0xfb98dfedaedab534, %g1, %r28
	setx 0x2c6033f9901ca97d, %g1, %r29
	setx 0x87284011883bd71c, %g1, %r30
	setx 0x87a4e9ccf06030e7, %g1, %r31
	save
	setx 0xe14d9e0c62dfde4b, %g1, %r16
	setx 0xe2cece062fc69525, %g1, %r17
	setx 0x98b780ae759ba66e, %g1, %r18
	setx 0x17a737b4c3c40c03, %g1, %r19
	setx 0xbecaafac065559a3, %g1, %r20
	setx 0xfaf5b5f482e0a83b, %g1, %r21
	setx 0xc80aaae8e94ac55e, %g1, %r22
	setx 0x00cd3e9b3ba05d5d, %g1, %r23
	setx 0xab34b23cf10f8ecc, %g1, %r24
	setx 0x332848b39e47b5b1, %g1, %r25
	setx 0xc2b563bf09a354a0, %g1, %r26
	setx 0xb18322b8fcafb945, %g1, %r27
	setx 0x6b9ffcf89b09c5d5, %g1, %r28
	setx 0x66ce20023a6ca1ee, %g1, %r29
	setx 0x37f948a694c46ef8, %g1, %r30
	setx 0x8ac9fcca4c738f28, %g1, %r31
	save
	setx 0x27bcedaa0d08f2c5, %g1, %r16
	setx 0xe6375e969382f89f, %g1, %r17
	setx 0xd2e19e1b5c3098d3, %g1, %r18
	setx 0xeb06c196cf7cc2b6, %g1, %r19
	setx 0xc3225004113850e7, %g1, %r20
	setx 0x9d7dd08727552a26, %g1, %r21
	setx 0x1e8d75aa7cdf2373, %g1, %r22
	setx 0x0e945324d7b1f617, %g1, %r23
	setx 0x7ecfcf8278028170, %g1, %r24
	setx 0x5120890fa7b5d0a9, %g1, %r25
	setx 0x3fd14ac961f5599c, %g1, %r26
	setx 0x9643178003c8787e, %g1, %r27
	setx 0x8134bc30c10cb878, %g1, %r28
	setx 0x47b5a05869de9eb5, %g1, %r29
	setx 0x1041444f6aee1488, %g1, %r30
	setx 0xe3d4e3efaa9b7ca0, %g1, %r31
	restore
	restore
	.word 0xc2c7e030  ! 3: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r1
	.word 0x97d02031  ! 4: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x81d02035  ! 5: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 8: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9bd02032  ! 23: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 30: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x986a6001  ! 33: UDIVX_I	udivx 	%r9, 0x0001, %r12
	.word 0xd84fe001  ! 36: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x9ac02001  ! 41: ADDCcc_I	addccc 	%r0, 0x0001, %r13
	.word 0x22800001  ! 46: BE	be,a	<label_0x1>
	.word 0xda17c000  ! 51: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0xda0fe001  ! 56: LDUB_I	ldub	[%r31 + 0x0001], %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95d02031  ! 62: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0x87802014  ! 66: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802014  ! 67: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93d02032  ! 72: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x24800001  ! 73: BLE	ble,a	<label_0x1>
	mov 0x32, %r30
	.word 0x87d0001e  ! 74: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x88c26001  ! 75: ADDCcc_I	addccc 	%r9, 0x0001, %r4
	.word 0x8b500000  ! 76: RDPR_TPC	rdpr	%tpc, %r5
	.word 0xca57e001  ! 81: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0x8bd02032  ! 84: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8768e001  ! 86: SDIVX_I	sdivx	%r3, 0x0001, %r3
	.word 0x2e700001  ! 87: BPVS	<illegal instruction>
	.word 0xc647c000  ! 88: LDSW_R	ldsw	[%r31 + %r0], %r3
	.word 0x32800001  ! 95: BNE	bne,a	<label_0x1>
	.word 0x9882400a  ! 96: ADDcc_R	addcc 	%r9, %r10, %r12
	.word 0x2c800001  ! 97: BNEG	bneg,a	<label_0x1>
	.word 0x3c700001  ! 100: BPPOS	<illegal instruction>
	.word 0xd84fe001  ! 101: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0xd817c000  ! 102: LDUH_R	lduh	[%r31 + %r0], %r12
	.word 0x87802016  ! 105: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x34, %r30
	.word 0x97d0001e  ! 108: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87802045  ! 109: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xd847e001  ! 114: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0x2c800001  ! 119: BNEG	bneg,a	<label_0x1>
	.word 0x2e700001  ! 126: BPVS	<illegal instruction>
	.word 0xd897e020  ! 129: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0xd89004a0  ! 130: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd897e030  ! 131: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x8cd3a001  ! 136: UMULcc_I	umulcc 	%r14, 0x0001, %r6
	mov 0x32, %r30
	.word 0x87d0001e  ! 139: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xccc7e000  ! 142: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	mov 0x34, %r30
	.word 0x93d0001e  ! 143: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8cda800c  ! 146: SMULcc_R	smulcc 	%r10, %r12, %r6
	.word 0x8d802000  ! 157: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x87d0001e  ! 162: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8068c00b  ! 165: UDIVX_R	udivx 	%r3, %r11, %r0
	.word 0xc087e000  ! 174: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r0
	.word 0xc0dfe010  ! 177: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r0
	.word 0x9c036001  ! 180: ADD_I	add 	%r13, 0x0001, %r14
	.word 0x87802004  ! 183: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x31, %r30
	.word 0x9fd0001e  ! 186: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 187: BLEU	bleu,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x80832001  ! 189: ADDcc_I	addcc 	%r12, 0x0001, %r0
	.word 0x87d02033  ! 190: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x87802014  ! 193: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9d504000  ! 194: RDPR_TNPC	rdpr	%tnpc, %r14
	.word 0xdc8fe010  ! 197: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r14
	.word 0xdc5fc000  ! 204: LDX_R	ldx	[%r31 + %r0], %r14
	.word 0xdcd7e010  ! 205: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r14
	.word 0x8d802004  ! 208: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x35, %r30
	.word 0x87d0001e  ! 226: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xdc0fc000  ! 227: LDUB_R	ldub	[%r31 + %r0], %r14
	.word 0xdcd7e030  ! 230: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r14
	.word 0xd0fb0027  ! 231: SWAPA_R	swapa	%r8, [%r12 + %r7] 0x01
	mov 0x30, %r30
	.word 0x9dd0001e  ! 232: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x87a309c3  ! 237: FDIVd	fdivd	%f12, %f34, %f34
	.word 0xc617c000  ! 240: LDUH_R	lduh	[%r31 + %r0], %r3
	mov 0x34, %r30
	.word 0x93d0001e  ! 253: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8fd02030  ! 254: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x9ed2e001  ! 255: UMULcc_I	umulcc 	%r11, 0x0001, %r15
	.word 0x9569a001  ! 256: SDIVX_I	sdivx	%r6, 0x0001, %r10
	.word 0xd487e010  ! 259: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r10
	mov 0x35, %r30
	.word 0x8bd0001e  ! 262: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd497e030  ! 263: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x91500000  ! 266: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xd017c000  ! 275: LDUH_R	lduh	[%r31 + %r0], %r8
	.word 0x93d02035  ! 282: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x87802016  ! 283: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd00fc000  ! 286: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0xd0dfe020  ! 289: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x8fa049ab  ! 292: FDIVs	fdivs	%f1, %f11, %f7
	.word 0x98dbc003  ! 293: SMULcc_R	smulcc 	%r15, %r3, %r12
	mov 0x32, %r30
	.word 0x99d0001e  ! 302: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd887e030  ! 305: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r12
	mov 0x34, %r30
	.word 0x83d0001e  ! 306: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x89a089c7  ! 307: FDIVd	fdivd	%f2, %f38, %f4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc847c000  ! 311: LDSW_R	ldsw	[%r31 + %r0], %r4
	.word 0x8d802004  ! 320: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x32800001  ! 323: BNE	bne,a	<label_0x1>
	.word 0x2e700001  ! 324: BPVS	<illegal instruction>
	.word 0x87802054  ! 327: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x38700001  ! 330: BPGU	<illegal instruction>
	.word 0xc80fc000  ! 337: LDUB_R	ldub	[%r31 + %r0], %r4
	.word 0xc857c000  ! 340: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0xc897e010  ! 341: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	mov 0x32, %r30
	.word 0x89d0001e  ! 352: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x89d0001e  ! 355: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 356: BLE	ble,a	<label_0x1>
	mov 0x34, %r30
	.word 0x8bd0001e  ! 359: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 360: BG	bg,a	<label_0x1>
	.word 0xc1e24024  ! 361: CASA_I	casa	[%r9] 0x 1, %r4, %r0
	.word 0x30700001  ! 364: BPA	<illegal instruction>
	.word 0x3e700001  ! 365: BPVC	<illegal instruction>
	.word 0xc08804a0  ! 366: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x9f480000  ! 371: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x9750c000  ! 372: RDPR_TT	rdpr	%tt, %r11
	.word 0xd6c804a0  ! 377: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0xd6cfe000  ! 378: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0x9e7a8004  ! 383: SDIV_R	sdiv 	%r10, %r4, %r15
	.word 0xde57e001  ! 388: LDSH_I	ldsh	[%r31 + 0x0001], %r15
	.word 0xdec7e010  ! 389: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	.word 0x22800001  ! 396: BE	be,a	<label_0x1>
	.word 0x38700001  ! 397: BPGU	<illegal instruction>
	.word 0x88d24003  ! 402: UMULcc_R	umulcc 	%r9, %r3, %r4
	mov 0x34, %r30
	.word 0x9bd0001e  ! 413: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc847c000  ! 416: LDSW_R	ldsw	[%r31 + %r0], %r4
	.word 0x976be001  ! 425: SDIVX_I	sdivx	%r15, 0x0001, %r11
	mov 0x32, %r30
	.word 0x95d0001e  ! 426: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd65fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd60fc000  ! 428: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x83d02030  ! 429: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xd6900e60  ! 436: LDUHA_R	lduha	[%r0, %r0] 0x73, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x87d02033  ! 442: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x87802014  ! 443: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x83698006  ! 444: SDIVX_R	sdivx	%r6, %r6, %r1
	.word 0x80812001  ! 461: ADDcc_I	addcc 	%r4, 0x0001, %r0
	.word 0xc097e020  ! 462: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r0
	.word 0xc087e020  ! 465: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r0
	.word 0x2c800001  ! 468: BNEG	bneg,a	<label_0x1>
	.word 0xc08fe010  ! 471: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
	.word 0x88d3a001  ! 472: UMULcc_I	umulcc 	%r14, 0x0001, %r4
	.word 0x36700001  ! 475: BPGE	<illegal instruction>
	.word 0x3a700001  ! 478: BPCC	<illegal instruction>
	.word 0xc89004a0  ! 481: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x32700001  ! 482: BPNE	<illegal instruction>
	.word 0xc80fc000  ! 483: LDUB_R	ldub	[%r31 + %r0], %r4
	.word 0x9fd02032  ! 484: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x85d02034  ! 489: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x8a528007  ! 496: UMUL_R	umul 	%r10, %r7, %r5
	.word 0x9bd02031  ! 513: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x91d02031  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x89d02032  ! 519: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0x89a309ed  ! 520: FDIVq	dis not found

	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc80fc000  ! 522: LDUB_R	ldub	[%r31 + %r0], %r4
	.word 0x3a700001  ! 525: BPCC	<illegal instruction>
	.word 0x8bd02034  ! 526: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x9a81c00a  ! 527: ADDcc_R	addcc 	%r7, %r10, %r13
	mov 0x33, %r30
	.word 0x8dd0001e  ! 530: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 531: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x30700001  ! 532: BPA	<illegal instruction>
	.word 0x98c02001  ! 533: ADDCcc_I	addccc 	%r0, 0x0001, %r12
	.word 0x20700001  ! 536: BPN	<illegal instruction>
	.word 0x927aa001  ! 541: SDIV_I	sdiv 	%r10, 0x0001, %r9
	.word 0xd2d004a0  ! 542: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x8d802004  ! 547: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x3a700001  ! 552: BPCC	<illegal instruction>
	.word 0x32800001  ! 555: BNE	bne,a	<label_0x1>
	.word 0xd207c000  ! 556: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0xd2c804a0  ! 557: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x944a6001  ! 558: MULX_I	mulx 	%r9, 0x0001, %r10
	.word 0xd4d7e000  ! 563: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0x89d02030  ! 566: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x91d02034  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 0x34, %r30
	.word 0x8dd0001e  ! 572: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 575: BPGE	<illegal instruction>
	.word 0x20800001  ! 576: BN	bn,a	<label_0x1>
	.word 0xd48fe030  ! 581: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x87802010  ! 584: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd417c000  ! 587: LDUH_R	lduh	[%r31 + %r0], %r10
	mov 0x31, %r30
	.word 0x9fd0001e  ! 588: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xd40fc000  ! 589: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x8edbc004  ! 592: SMULcc_R	smulcc 	%r15, %r4, %r7
	.word 0xce17c000  ! 593: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xce07e001  ! 596: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x95d02030  ! 603: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0xced7e030  ! 604: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r7
	.word 0x38700001  ! 605: BPGU	<illegal instruction>
	.word 0x9c78a001  ! 610: SDIV_I	sdiv 	%r2, 0x0001, %r14
	.word 0xdcd7e030  ! 611: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdc87e000  ! 615: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r14
	.word 0x8d802004  ! 618: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x24700001  ! 623: BPLE	<illegal instruction>
	.word 0x28700001  ! 624: BPLEU	<illegal instruction>
	mov 0x32, %r30
	.word 0x93d0001e  ! 633: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdc8fe020  ! 634: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r14
	mov 0x32, %r30
	.word 0x8fd0001e  ! 635: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xdc57e001  ! 638: LDSH_I	ldsh	[%r31 + 0x0001], %r14
	mov 0x31, %r30
	.word 0x99d0001e  ! 641: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x98c1e001  ! 644: ADDCcc_I	addccc 	%r7, 0x0001, %r12
	.word 0x8b51c000  ! 647: RDPR_TL	rdpr	%tl, %r5
	.word 0x87802054  ! 650: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x83d02033  ! 655: Tcc_I	te	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x8dd0001e  ! 658: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 659: BPNEG	<illegal instruction>
	.word 0x87802004  ! 668: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcadfe030  ! 673: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	mov 0x31, %r30
	.word 0x99d0001e  ! 674: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x807b6001  ! 675: SDIV_I	sdiv 	%r13, 0x0001, %r0
	mov 0x30, %r30
	.word 0x99d0001e  ! 676: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x2e700001  ! 681: BPVS	<illegal instruction>
	.word 0xc087e020  ! 686: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r0
	mov 0x33, %r30
	.word 0x97d0001e  ! 687: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc007e001  ! 688: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x3e700001  ! 689: BPVC	<illegal instruction>
	.word 0xc0cfe030  ! 696: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	.word 0x8d802000  ! 697: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x22800001  ! 708: BE	be,a	<label_0x1>
	mov 0x34, %r30
	.word 0x8dd0001e  ! 713: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8e698005  ! 714: UDIVX_R	udivx 	%r6, %r5, %r7
	.word 0x87802014  ! 723: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802054  ! 724: WRASI_I	wr	%r0, 0x0054, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9d686001  ! 726: SDIVX_I	sdivx	%r1, 0x0001, %r14
	.word 0x9fd02034  ! 727: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0xdc47c000  ! 730: LDSW_R	ldsw	[%r31 + %r0], %r14
	.word 0xdc47c000  ! 739: LDSW_R	ldsw	[%r31 + %r0], %r14
	.word 0x844a4007  ! 748: MULX_R	mulx 	%r9, %r7, %r2
	.word 0x8d802004  ! 749: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc447e001  ! 762: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0xc4800e60  ! 763: LDUWA_R	lduwa	[%r0, %r0] 0x73, %r2
	mov 0x30, %r30
	.word 0x9dd0001e  ! 766: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x97d02035  ! 767: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0xc4d804a0  ! 768: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x8d802004  ! 769: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87504000  ! 770: RDPR_TNPC	rdpr	%tnpc, %r3
	mov 0x35, %r30
	.word 0x99d0001e  ! 779: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x85480000  ! 782: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0xc40fe001  ! 783: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0x93d02031  ! 784: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x9351c000  ! 791: RDPR_TL	rdpr	%tl, %r9
	.word 0xd257c000  ! 794: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x32800001  ! 795: BNE	bne,a	<label_0x1>
	.word 0xd287e000  ! 798: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r9
	.word 0xd2cfe010  ! 805: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	mov 0x32, %r30
	.word 0x81d0001e  ! 806: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x99d0001e  ! 809: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x9dd02033  ! 814: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0xd247e001  ! 815: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0x98d34001  ! 816: UMULcc_R	umulcc 	%r13, %r1, %r12
	.word 0xd857e001  ! 823: LDSH_I	ldsh	[%r31 + 0x0001], %r12
	mov 0x35, %r30
	.word 0x9bd0001e  ! 828: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95d02031  ! 838: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8c812001  ! 841: ADDcc_I	addcc 	%r4, 0x0001, %r6
	.word 0x9f50c000  ! 844: RDPR_TT	rdpr	%tt, %r15
	.word 0x84786001  ! 845: SDIV_I	sdiv 	%r1, 0x0001, %r2
	.word 0x26700001  ! 846: BPL	<illegal instruction>
	.word 0x9dd02035  ! 851: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x9f514000  ! 856: RDPR_TBA	rdpr	%tba, %r15
	.word 0xdecfe020  ! 861: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0xdec7e000  ! 868: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r15
	.word 0x89504000  ! 871: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x86db4004  ! 872: SMULcc_R	smulcc 	%r13, %r4, %r3
	mov 0x31, %r30
	.word 0x95d0001e  ! 881: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x83d0001e  ! 882: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x82782001  ! 889: SDIV_I	sdiv 	%r0, 0x0001, %r1
	.word 0x36700001  ! 894: BPGE	<illegal instruction>
	.word 0xc2c7e020  ! 899: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc287e030  ! 903: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r1
	.word 0x8680c00f  ! 908: ADDcc_R	addcc 	%r3, %r15, %r3
	mov 0x35, %r30
	.word 0x91d0001e  ! 915: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc687e030  ! 922: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r3
	.word 0xc64fc000  ! 927: LDSB_R	ldsb	[%r31 + %r0], %r3
	mov 0x35, %r30
	.word 0x8fd0001e  ! 928: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9a6bc00b  ! 931: UDIVX_R	udivx 	%r15, %r11, %r13
	.word 0x9fd02032  ! 932: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0xdacfe020  ! 933: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
	mov 0x32, %r30
	.word 0x9dd0001e  ! 942: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 945: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87802004  ! 948: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdadfe030  ! 955: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x916a000a  ! 958: SDIVX_R	sdivx	%r8, %r10, %r8
	.word 0x26800001  ! 965: BL	bl,a	<label_0x1>
	.word 0x20700001  ! 966: BPN	<illegal instruction>
	.word 0xd007c000  ! 967: LDUW_R	lduw	[%r31 + %r0], %r8
	.word 0xd04fe001  ! 972: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xd0d7e000  ! 975: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	mov 0x34, %r30
	.word 0x85d0001e  ! 980: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2c800001  ! 982: BNEG	bneg,a	<label_0x1>
	.word 0x80c3e001  ! 985: ADDCcc_I	addccc 	%r15, 0x0001, %r0
	.word 0x95d02034  ! 986: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0xc087e000  ! 987: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r0
	.word 0xc0d7e030  ! 988: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r0
	.word 0x8dd02030  ! 989: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xc047e001  ! 990: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0x34800001  ! 997: BG	bg,a	<label_0x1>


.data
user_data_start:
	.xword	0x6b523bc2166e4157
	.xword	0x108857e27318e966
	.xword	0xbb24f42dc0aaf89f
	.xword	0xc63648496a4b5ad7
	.xword	0x3d407cc92da15eb0
	.xword	0x2a3a3965b86ffaf9
	.xword	0xd6aa1e82fabdc2fc
	.xword	0x0b99260f892bbfdc
	.xword	0xedc816f885b79f24
	.xword	0x3297127592690542
	.xword	0xa38eee6adae4bcb2
	.xword	0x6d483aec9242284d
	.xword	0xeb62a7041d440c01
	.xword	0x93f5320d47146f35
	.xword	0xd89cff044c979100
	.xword	0x8da421ae217aef37


.text
    ta T_GOOD_TRAP
.data
    .xword 0x0

#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Fri Mar 26 09:04:23 2004
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
!!#     IJ_set_ropr_fld("diag.j", 40, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x45, 0x54}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 43, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 44, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 45, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
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
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 65, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 67, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 71, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Weights
!!#     IJ_set_rvar("diag.j", 74, wt_high, "{6}");
!!#     IJ_set_rvar("diag.j", 75, wt_med,  "{3}");
!!#     IJ_set_rvar("diag.j", 76, wt_low,  "{1}");
!!# 
!!#     // Initialize registers ..
!!#     IJ_init_regs_by_setx ("diag.j", 79, th0, 3, 2, Rv_rand_64);
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 84, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 16; i++) {
!!#         IJ_printf  ("diag.j", 86, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 277, th0, $2);
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
!!#      IJ_printf("diag.j", 324, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
