/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand01_ind_02.s
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

	setx 0x7f1ac730171303f0, %g1, %g0
	setx 0xe467918d4cd7dbc0, %g1, %g1
	setx 0xf452a4fc9ece41b2, %g1, %g2
	setx 0xa595d14a6ffef14f, %g1, %g3
	setx 0xe1e8c0be7791c115, %g1, %g4
	setx 0x58ac1b656c233a9c, %g1, %g5
	setx 0xd8923108953b69e6, %g1, %g6
	setx 0x6f5853ce28cc4a2a, %g1, %g7
	setx 0xdbce6b02e4c99b97, %g1, %r16
	setx 0x6ac10baa841b7d0b, %g1, %r17
	setx 0xecc7b32735e5c164, %g1, %r18
	setx 0x07c7ed8383a02c2d, %g1, %r19
	setx 0xead703f17aeb2ca9, %g1, %r20
	setx 0xd7c513f6a7eb8f1d, %g1, %r21
	setx 0x161931e41a64b6cf, %g1, %r22
	setx 0xfccd3e11fc3d9cbf, %g1, %r23
	setx 0xb2a83253b0e70ebe, %g1, %r24
	setx 0x9584683e6ef80f9f, %g1, %r25
	setx 0x54833c46e254fc30, %g1, %r26
	setx 0x3746e80b83fe5a4f, %g1, %r27
	setx 0x8c6898bfdbe0f81d, %g1, %r28
	setx 0x557441906dc5540c, %g1, %r29
	setx 0x17663edebf207bb4, %g1, %r30
	setx 0x0a2d120bfb62916a, %g1, %r31
	save
	setx 0x384bbfdec2dba3c7, %g1, %r16
	setx 0x8f1592c74bb249c8, %g1, %r17
	setx 0x28e3de079ce3a379, %g1, %r18
	setx 0x0026f643140baf3c, %g1, %r19
	setx 0x09a11d8b6eca8772, %g1, %r20
	setx 0x58e92614dd04a8e0, %g1, %r21
	setx 0x1e4cfffa596e120d, %g1, %r22
	setx 0x41712d7a3ff29e56, %g1, %r23
	setx 0xb327ef60281e9f0a, %g1, %r24
	setx 0xce52f1d1b3a66741, %g1, %r25
	setx 0xbaac0317a97b9bc9, %g1, %r26
	setx 0x6980494fa6ee5461, %g1, %r27
	setx 0x499680aec3b59630, %g1, %r28
	setx 0x43949fddcb47f4a3, %g1, %r29
	setx 0xcf996c4f2dbf20c3, %g1, %r30
	setx 0x304610e7585a5cd0, %g1, %r31
	save
	setx 0x58b8bdea91825422, %g1, %r16
	setx 0xa0c5db68c0cad4e0, %g1, %r17
	setx 0xeda6a7a11c5d55f0, %g1, %r18
	setx 0x876a47f9526be42a, %g1, %r19
	setx 0x99e28a6435151c33, %g1, %r20
	setx 0xf4ee33d89aec1ac4, %g1, %r21
	setx 0x7d6164af63960b7c, %g1, %r22
	setx 0x17dde98fc47b6aba, %g1, %r23
	setx 0x9ad6887bf8f5d0e3, %g1, %r24
	setx 0xc3ab8d70ffe20ff6, %g1, %r25
	setx 0xc02e5ba84a025f8c, %g1, %r26
	setx 0x7c508ded2790fc1d, %g1, %r27
	setx 0x10c4ce668aa92ea9, %g1, %r28
	setx 0xe381667f64296dc7, %g1, %r29
	setx 0x8be43a4b8d8da77e, %g1, %r30
	setx 0xf29ce5455dea14ca, %g1, %r31
	restore
	restore
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0xd05fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd087e010  ! 9: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r8
	.word 0xd087e000  ! 12: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r8
	.word 0xd017c000  ! 13: LDUH_R	lduh	[%r31 + %r0], %r8
	mov 0x34, %r30
	.word 0x9dd0001e  ! 26: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x81d0001e  ! 37: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x86802001  ! 42: ADDcc_I	addcc 	%r0, 0x0001, %r3
	mov 0x33, %r30
	.word 0x81d0001e  ! 45: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x91508000  ! 48: RDPR_TSTATE	rdpr	%tstate, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x36800001  ! 50: BGE	bge,a	<label_0x1>
	mov 0x30, %r30
	.word 0x87d0001e  ! 51: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x97d02032  ! 52: Tcc_I	tge	icc_or_xcc, %r0 + 50
	mov 0x35, %r30
	.word 0x91d0001e  ! 53: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8fd0001e  ! 54: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x93480000  ! 55: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x2e800001  ! 56: BVS	bvs,a	<label_0x1>
	mov 0x35, %r30
	.word 0x9dd0001e  ! 63: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x86d20005  ! 69: UMULcc_R	umulcc 	%r8, %r5, %r3
	mov 0x35, %r30
	.word 0x95d0001e  ! 72: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 73: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d02032  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc60fc000  ! 83: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0x87802045  ! 86: WRASI_I	wr	%r0, 0x0045, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9fd02032  ! 92: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0xc607e001  ! 93: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x81d02034  ! 94: Tcc_I	tn	icc_or_xcc, %r0 + 52
	mov 0x31, %r30
	.word 0x8dd0001e  ! 99: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc6cfe030  ! 100: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r3
	.word 0xc278e001  ! 101: SWAP_I	swap	%r1, [%r3 + 0x0001]
	.word 0x9dd02033  ! 102: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x96534003  ! 108: UMUL_R	umul 	%r13, %r3, %r11
	.word 0x8bd02034  ! 115: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0xd617e001  ! 116: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0xd65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x3c700001  ! 122: BPPOS	<illegal instruction>
	.word 0x97d02033  ! 123: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x87802045  ! 126: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xd687e010  ! 129: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r11
	.word 0x9d494000  ! 130: RDHPR_HTBA	rdhpr	%htba, %r14
	.word 0xdc4fe001  ! 143: LDSB_I	ldsb	[%r31 + 0x0001], %r14
	.word 0x8c53400a  ! 144: UMUL_R	umul 	%r13, %r10, %r6
	mov 0x32, %r30
	.word 0x81d0001e  ! 145: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x81d0001e  ! 146: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xcc8fe030  ! 147: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r6
	.word 0x8dd02033  ! 154: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x9fd02035  ! 157: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	mov 0x31, %r30
	.word 0x95d0001e  ! 160: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xcbe08020  ! 161: CASA_I	casa	[%r2] 0x 1, %r0, %r5
	mov 0x32, %r30
	.word 0x9fd0001e  ! 166: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xca0fc000  ! 169: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0x20700001  ! 174: BPN	<illegal instruction>
	mov 0x32, %r30
	.word 0x85d0001e  ! 177: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xcac804a0  ! 180: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0xca87e010  ! 187: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r5
	.word 0xcac004a0  ! 192: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	mov 0x33, %r30
	.word 0x9dd0001e  ! 193: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x9c00a001  ! 194: ADD_I	add 	%r2, 0x0001, %r14
	.word 0xdcc7e020  ! 195: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r14
	.word 0xdc0fc000  ! 196: LDUB_R	ldub	[%r31 + %r0], %r14
	mov 0x32, %r30
	.word 0x9bd0001e  ! 197: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xdc57c000  ! 200: LDSH_R	ldsh	[%r31 + %r0], %r14
	.word 0xdcdfe020  ! 201: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0x976a2001  ! 206: SDIVX_I	sdivx	%r8, 0x0001, %r11
	.word 0x2e700001  ! 207: BPVS	<illegal instruction>
	.word 0xd617e001  ! 214: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x9fd02032  ! 217: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x85d02031  ! 218: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x9dd02034  ! 221: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x26700001  ! 224: BPL	<illegal instruction>
	.word 0x36700001  ! 225: BPGE	<illegal instruction>
	.word 0xd687e010  ! 236: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r11
	.word 0x87802010  ! 237: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd607e001  ! 242: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x95d02032  ! 245: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0xd65fc000  ! 246: LDX_R	ldx	[%r31 + %r0], %r11
	mov 0x30, %r30
	.word 0x9bd0001e  ! 247: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 250: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8768c00a  ! 251: SDIVX_R	sdivx	%r3, %r10, %r3
	.word 0xc6c7e030  ! 254: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r3
	.word 0xc6c804a0  ! 255: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x98698007  ! 260: UDIVX_R	udivx 	%r6, %r7, %r12
	.word 0x96686001  ! 267: UDIVX_I	udivx 	%r1, 0x0001, %r11
	.word 0xd68fe010  ! 268: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0x87802010  ! 269: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9c49a001  ! 270: MULX_I	mulx 	%r6, 0x0001, %r14
	.word 0x32700001  ! 271: BPNE	<illegal instruction>
	.word 0x3a700001  ! 272: BPCC	<illegal instruction>
	.word 0x3e700001  ! 273: BPVC	<illegal instruction>
	.word 0x3a800001  ! 274: BCC	bcc,a	<label_0x1>
	.word 0x9878a001  ! 281: SDIV_I	sdiv 	%r2, 0x0001, %r12
	.word 0xd8dfe010  ! 284: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0xd8900e40  ! 285: LDUHA_R	lduha	[%r0, %r0] 0x72, %r12
	.word 0x2a800001  ! 288: BCS	bcs,a	<label_0x1>
	.word 0xd817e001  ! 289: LDUH_I	lduh	[%r31 + 0x0001], %r12
	.word 0x87802054  ! 290: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x91d02031  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9f51c000  ! 292: RDPR_TL	rdpr	%tl, %r15
	.word 0xde87e030  ! 299: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r15
	.word 0xded7e000  ! 300: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r15
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x33, %r30
	.word 0x9bd0001e  ! 317: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x9bd0001e  ! 320: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x95508000  ! 321: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xd447c000  ! 322: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x85d02031  ! 323: Tcc_I	tle	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x8bd0001e  ! 324: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd4d00e80  ! 325: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
	mov 0x33, %r30
	.word 0x81d0001e  ! 328: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x85d0001e  ! 333: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x9d50c000  ! 334: RDPR_TT	rdpr	%tt, %r14
	mov 0x32, %r30
	.word 0x83d0001e  ! 335: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x95d0001e  ! 338: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8ed0c003  ! 339: UMULcc_R	umulcc 	%r3, %r3, %r7
	.word 0xce9004a0  ! 340: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x34800001  ! 341: BG	bg,a	<label_0x1>
	.word 0xced7e000  ! 342: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
	.word 0x81d02031  ! 343: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0xced804a0  ! 348: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x85d0001e  ! 354: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 355: BVS	bvs,a	<label_0x1>
	.word 0xce97e030  ! 356: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r7
	.word 0x9fd02030  ! 357: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0x2e800001  ! 358: BVS	bvs,a	<label_0x1>
	.word 0xce4fc000  ! 361: LDSB_R	ldsb	[%r31 + %r0], %r7
	mov 0x32, %r30
	.word 0x8bd0001e  ! 366: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x93d0001e  ! 373: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9e83a001  ! 374: ADDcc_I	addcc 	%r14, 0x0001, %r15
	.word 0x8fd02030  ! 377: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x9dd0001e  ! 379: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xde07e001  ! 380: LDUW_I	lduw	[%r31 + 0x0001], %r15
	.word 0x99494000  ! 383: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x34700001  ! 384: BPG	<illegal instruction>
	.word 0xd8c004a0  ! 389: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x87802045  ! 390: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x20800001  ! 391: BN	bn,a	<label_0x1>
	.word 0xd847e001  ! 392: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0x8ba049e7  ! 393: FDIVq	dis not found

	.word 0xcafa4020  ! 394: SWAPA_R	swapa	%r5, [%r9 + %r0] 0x01
	.word 0x83d02033  ! 403: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x30, %r30
	.word 0x91d0001e  ! 411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x8dd0001e  ! 412: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87d02034  ! 413: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x24700001  ! 414: BPLE	<illegal instruction>
	.word 0x2c800001  ! 415: BNEG	bneg,a	<label_0x1>
	.word 0x8fd02034  ! 416: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	mov 0x32, %r30
	.word 0x8bd0001e  ! 421: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x99d0001e  ! 422: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca07e001  ! 424: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xd5e00026  ! 429: CASA_I	casa	[%r0] 0x 1, %r6, %r10
	.word 0xd40fc000  ! 430: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x24800001  ! 431: BLE	ble,a	<label_0x1>
	.word 0x90d3e001  ! 436: UMULcc_I	umulcc 	%r15, 0x0001, %r8
	.word 0xc4f8c02f  ! 437: SWAPA_R	swapa	%r2, [%r3 + %r15] 0x01
	.word 0x3a800001  ! 438: BCC	bcc,a	<label_0x1>
	.word 0x99d02031  ! 445: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	mov 0x30, %r30
	.word 0x9bd0001e  ! 446: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x97d0001e  ! 449: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e010  ! 452: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0xc4d7e000  ! 453: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	mov 0x35, %r30
	.word 0x9dd0001e  ! 456: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x3a700001  ! 457: BPCC	<illegal instruction>
	.word 0x9dd02031  ! 464: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x82026001  ! 465: ADD_I	add 	%r9, 0x0001, %r1
	.word 0x84d9400a  ! 468: SMULcc_R	smulcc 	%r5, %r10, %r2
	.word 0x87802004  ! 475: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2e800001  ! 480: BVS	bvs,a	<label_0x1>
	.word 0x89504000  ! 485: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x34800001  ! 490: BG	bg,a	<label_0x1>
	.word 0x9da1c9e2  ! 493: FDIVq	dis not found

	.word 0x9cdb0002  ! 506: SMULcc_R	smulcc 	%r12, %r2, %r14
	.word 0x8fd02031  ! 507: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	mov 0x31, %r30
	.word 0x8dd0001e  ! 518: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xdcc7e020  ! 527: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r14
	mov 0x34, %r30
	.word 0x9fd0001e  ! 528: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9a49e001  ! 531: MULX_I	mulx 	%r7, 0x0001, %r13
	.word 0xda17c000  ! 532: LDUH_R	lduh	[%r31 + %r0], %r13
	mov 0x32, %r30
	.word 0x97d0001e  ! 533: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xda9004a0  ! 534: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0xdad7e000  ! 537: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0xdadfe010  ! 540: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0xda8004a0  ! 545: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r13
	.word 0xda97e010  ! 546: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0x2e700001  ! 547: BPVS	<illegal instruction>
	.word 0x9351c000  ! 548: RDPR_TL	rdpr	%tl, %r9
	.word 0x3c800001  ! 555: BPOS	bpos,a	<label_0x1>
	.word 0x3a700001  ! 556: BPCC	<illegal instruction>
	.word 0x8448000a  ! 561: MULX_R	mulx 	%r0, %r10, %r2
	.word 0x92486001  ! 562: MULX_I	mulx 	%r1, 0x0001, %r9
	.word 0x87802016  ! 563: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xccfac02d  ! 566: SWAPA_R	swapa	%r6, [%r11 + %r13] 0x01
	.word 0x30800001  ! 569: BA	ba,a	<label_0x1>
	mov 0x30, %r30
	.word 0x93d0001e  ! 570: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x9dd0001e  ! 575: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xccc7e000  ! 576: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	.word 0xcc07e001  ! 581: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc4fe001  ! 588: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0xcc800e80  ! 589: LDUWA_R	lduwa	[%r0, %r0] 0x74, %r6
	.word 0x81508000  ! 590: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x2a800001  ! 593: BCS	bcs,a	<label_0x1>
	.word 0xc08fe000  ! 594: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0x85d02030  ! 597: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x8dd02033  ! 602: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x93d0001e  ! 605: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x95d0001e  ! 608: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87d02030  ! 609: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x99514000  ! 610: RDPR_TBA	rdpr	%tba, %r12
	.word 0xd8d7e030  ! 611: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
	.word 0x26800001  ! 624: BL	bl,a	<label_0x1>
	.word 0xd80fc000  ! 625: LDUB_R	ldub	[%r31 + %r0], %r12
	.word 0xd8dfe000  ! 628: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0xd88004a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r12
	.word 0x8b504000  ! 638: RDPR_TNPC	rdpr	%tnpc, %r5
	mov 0x30, %r30
	.word 0x83d0001e  ! 643: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 646: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xca57e001  ! 655: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0xca57c000  ! 656: LDSH_R	ldsh	[%r31 + %r0], %r5
	.word 0xcad7e020  ! 657: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r5
	.word 0x93d02035  ! 664: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xca8fe020  ! 665: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x89504000  ! 666: RDPR_TNPC	rdpr	%tnpc, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc8d80e60  ! 670: LDXA_R	ldxa	[%r0, %r0] 0x73, %r4
	.word 0xc80fe001  ! 671: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0xc80fc000  ! 676: LDUB_R	ldub	[%r31 + %r0], %r4
	.word 0xc817e001  ! 677: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0xc88fe020  ! 684: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	mov 0x33, %r30
	.word 0x87d0001e  ! 703: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc847e001  ! 704: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	mov 0x33, %r30
	.word 0x99d0001e  ! 705: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8c480000  ! 706: MULX_R	mulx 	%r0, %r0, %r6
	.word 0x84d32001  ! 707: UMULcc_I	umulcc 	%r12, 0x0001, %r2
	.word 0x9448000f  ! 718: MULX_R	mulx 	%r0, %r15, %r10
	.word 0xd4d7e030  ! 727: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0x26800001  ! 730: BL	bl,a	<label_0x1>
	.word 0xd4cfe000  ! 731: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	.word 0x30800001  ! 738: BA	ba,a	<label_0x1>
	.word 0xd457c000  ! 751: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0x28700001  ! 752: BPLEU	<illegal instruction>
	.word 0xd4c7e030  ! 755: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	.word 0xd48fe020  ! 756: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x28700001  ! 757: BPLEU	<illegal instruction>
	.word 0x9fd02034  ! 760: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0xd44fe001  ! 763: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x88d04001  ! 770: UMULcc_R	umulcc 	%r1, %r1, %r4
	.word 0x87d02031  ! 771: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x88c1e001  ! 772: ADDCcc_I	addccc 	%r7, 0x0001, %r4
	.word 0x9fd02033  ! 777: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x83d0001e  ! 787: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x85694002  ! 790: SDIVX_R	sdivx	%r5, %r2, %r2
	.word 0xc487e020  ! 799: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r2
	.word 0xca786001  ! 808: SWAP_I	swap	%r5, [%r1 + 0x0001]
	.word 0x87494000  ! 817: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x83a0c9e0  ! 820: FDIVq	dis not found

	mov 0x31, %r30
	.word 0x81d0001e  ! 821: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc2d80e80  ! 822: LDXA_R	ldxa	[%r0, %r0] 0x74, %r1
	.word 0xc2d00e80  ! 823: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r1
	.word 0x9fd02035  ! 824: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x9fd02034  ! 827: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0xc2d7e030  ! 832: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0x32800001  ! 833: BNE	bne,a	<label_0x1>
	.word 0x9e82400d  ! 834: ADDcc_R	addcc 	%r9, %r13, %r15
	mov 0x31, %r30
	.word 0x95d0001e  ! 835: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 838: BVS	bvs,a	<label_0x1>
	.word 0x83494000  ! 845: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x8ec3e001  ! 848: ADDCcc_I	addccc 	%r15, 0x0001, %r7
	mov 0x33, %r30
	.word 0x81d0001e  ! 851: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9e48a001  ! 854: MULX_I	mulx 	%r2, 0x0001, %r15
	.word 0xde800e40  ! 855: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r15
	.word 0xdecfe010  ! 856: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r15
	.word 0x2c800001  ! 857: BNEG	bneg,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdedfe020  ! 865: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r15
	.word 0xde57c000  ! 866: LDSH_R	ldsh	[%r31 + %r0], %r15
	.word 0xdecfe020  ! 867: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0xde900e40  ! 870: LDUHA_R	lduha	[%r0, %r0] 0x72, %r15
	.word 0x80016001  ! 871: ADD_I	add 	%r5, 0x0001, %r0
	.word 0xc087e020  ! 874: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r0
	.word 0x87802004  ! 875: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x22800001  ! 876: BE	be,a	<label_0x1>
	.word 0x24800001  ! 877: BLE	ble,a	<label_0x1>
	.word 0x8ed1e001  ! 880: UMULcc_I	umulcc 	%r7, 0x0001, %r7
	mov 0x30, %r30
	.word 0x8bd0001e  ! 881: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x89d02030  ! 882: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce8fe020  ! 886: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r7
	.word 0x95a389ad  ! 887: FDIVs	fdivs	%f14, %f13, %f10
	.word 0xd48fe010  ! 888: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x95d02033  ! 891: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0xd4c7e000  ! 892: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	.word 0x9fd02033  ! 905: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x8481800f  ! 906: ADDcc_R	addcc 	%r6, %r15, %r2
	.word 0x95d02033  ! 911: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0xc48fe030  ! 912: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r2
	.word 0xc4dfe030  ! 913: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0x34800001  ! 914: BG	bg,a	<label_0x1>
	.word 0xc417e001  ! 915: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0xc45fe001  ! 916: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x88490004  ! 917: MULX_R	mulx 	%r4, %r4, %r4
	.word 0xc857e001  ! 920: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0xc817c000  ! 921: LDUH_R	lduh	[%r31 + %r0], %r4
	mov 0x31, %r30
	.word 0x9bd0001e  ! 922: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8e53800f  ! 927: UMUL_R	umul 	%r14, %r15, %r7
	.word 0xce47e001  ! 928: LDSW_I	ldsw	[%r31 + 0x0001], %r7
	.word 0x806ae001  ! 929: UDIVX_I	udivx 	%r11, 0x0001, %r0
	.word 0xc007c000  ! 942: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0xc08fe000  ! 943: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0xc0d004a0  ! 944: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0xc007c000  ! 945: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x32800001  ! 946: BNE	bne,a	<label_0x1>
	.word 0xc0c804a0  ! 953: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0xc0cfe030  ! 956: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	.word 0x8bd02030  ! 963: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0xc047e001  ! 966: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0xc097e020  ! 969: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r0
	.word 0x8bd02030  ! 970: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x87802004  ! 977: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802045  ! 982: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x38700001  ! 983: BPGU	<illegal instruction>
	.word 0x89508000  ! 986: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xc8d804a0  ! 989: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0xc85fe001  ! 994: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0x93d02032  ! 995: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x88480000  ! 996: MULX_R	mulx 	%r0, %r0, %r4
	.word 0x98794002  ! 999: SDIV_R	sdiv 	%r5, %r2, %r12
	.word 0x9b508000  ! 1006: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x956a6001  ! 1007: SDIVX_I	sdivx	%r9, 0x0001, %r10
	.word 0x9fd02030  ! 1014: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0xd457e001  ! 1017: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	.word 0xd4d80e40  ! 1018: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x89d0001e  ! 1020: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd497e000  ! 1032: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd4d004a0  ! 1033: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xd44fc000  ! 1036: LDSB_R	ldsb	[%r31 + %r0], %r10
	mov 0x31, %r30
	.word 0x93d0001e  ! 1037: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e020  ! 1038: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	.word 0x9dd02030  ! 1039: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0xd4d804a0  ! 1040: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	mov 0x35, %r30
	.word 0x8dd0001e  ! 1041: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 1048: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9b494000  ! 1049: RDHPR_HTBA	rdhpr	%htba, %r13
	mov 0x31, %r30
	.word 0x9dd0001e  ! 1050: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x83d0001e  ! 1057: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x8fd0001e  ! 1066: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x95d0001e  ! 1067: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xda87e000  ! 1071: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r13
	.word 0x87802004  ! 1078: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdadfe000  ! 1079: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x26800001  ! 1084: BL	bl,a	<label_0x1>
	.word 0x947a0006  ! 1085: SDIV_R	sdiv 	%r8, %r6, %r10
	mov 0x35, %r30
	.word 0x9dd0001e  ! 1088: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x3a800001  ! 1097: BCC	bcc,a	<label_0x1>
	.word 0xd407c000  ! 1098: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0xd87a2001  ! 1099: SWAP_I	swap	%r12, [%r8 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x95d02031  ! 1101: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x91d02033  ! 1104: Tcc_I	ta	icc_or_xcc, %r0 + 51
	mov 0x33, %r30
	.word 0x95d0001e  ! 1105: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd847e001  ! 1115: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0xd88fe020  ! 1122: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
	.word 0x8bd02034  ! 1129: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	mov 0x35, %r30
	.word 0x85d0001e  ! 1134: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x83d02035  ! 1137: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x807a000d  ! 1138: SDIV_R	sdiv 	%r8, %r13, %r0
	mov 0x32, %r30
	.word 0x9dd0001e  ! 1143: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 1148: BPLEU	<illegal instruction>
	.word 0xc087e000  ! 1153: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r0
	.word 0x8e820009  ! 1154: ADDcc_R	addcc 	%r8, %r9, %r7
	mov 0x31, %r30
	.word 0x87d0001e  ! 1155: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x946b0001  ! 1156: UDIVX_R	udivx 	%r12, %r1, %r10
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1157: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x9dd02032  ! 1160: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0xd44fc000  ! 1169: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0x9bd02030  ! 1184: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd4dfe020  ! 1192: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x87802016  ! 1193: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x22700001  ! 1194: BPE	<illegal instruction>
	.word 0xd40fe001  ! 1195: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0xd407e001  ! 1200: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4d7e030  ! 1201: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0x20700001  ! 1202: BPN	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x26700001  ! 1206: BPL	<illegal instruction>
	.word 0x87802016  ! 1209: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81d02030  ! 1210: Tcc_I	tn	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd447c000  ! 1212: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x8dd02034  ! 1213: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x38800001  ! 1222: BGU	bgu,a	<label_0x1>
	.word 0xd487e030  ! 1227: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r10
	.word 0xcef8c02a  ! 1232: SWAPA_R	swapa	%r7, [%r3 + %r10] 0x01
	.word 0xce8fe030  ! 1233: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r7
	.word 0xce4fe001  ! 1236: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	mov 0x34, %r30
	.word 0x83d0001e  ! 1237: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x8dd0001e  ! 1238: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x9fd0001e  ! 1241: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xce17e001  ! 1255: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0xcecfe030  ! 1256: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r7
	.word 0x3c800001  ! 1257: BPOS	bpos,a	<label_0x1>
	.word 0x8da0c9a8  ! 1258: FDIVs	fdivs	%f3, %f8, %f6
	.word 0xcc87e030  ! 1261: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r6
	.word 0x2a800001  ! 1262: BCS	bcs,a	<label_0x1>
	.word 0xcc880e40  ! 1263: LDUBA_R	lduba	[%r0, %r0] 0x72, %r6
	.word 0x3e800001  ! 1266: BVC	bvc,a	<label_0x1>
	.word 0xcc4fe001  ! 1269: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0x95d02035  ! 1272: Tcc_I	tg	icc_or_xcc, %r0 + 53
	mov 0x35, %r30
	.word 0x99d0001e  ! 1273: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 1276: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xcc87e010  ! 1277: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r6
	.word 0xcc87e000  ! 1280: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r6
	.word 0xccc00e60  ! 1283: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r6
	.word 0xcc17e001  ! 1284: LDUH_I	lduh	[%r31 + 0x0001], %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8fd02035  ! 1290: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x97a349e1  ! 1291: FDIVq	dis not found

	.word 0x24700001  ! 1300: BPLE	<illegal instruction>
	.word 0xd6d7e030  ! 1301: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x81d02032  ! 1302: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xd6dfe010  ! 1305: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x81d02034  ! 1306: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0x81a049cb  ! 1309: FDIVd	fdivd	%f32, %f42, %f0
	.word 0xc0c7e000  ! 1310: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0xc097e010  ! 1311: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	mov 0x31, %r30
	.word 0x8bd0001e  ! 1314: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc0dfe020  ! 1317: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r0
	.word 0xde7ba001  ! 1318: SWAP_I	swap	%r15, [%r14 + 0x0001]
	.word 0x36800001  ! 1321: BGE	bge,a	<label_0x1>
	.word 0x89d02035  ! 1324: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0xde97e030  ! 1325: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r15
	.word 0xde8fe030  ! 1326: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r15
	.word 0x2a700001  ! 1331: BPCS	<illegal instruction>
	.word 0x99d02034  ! 1334: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	mov 0x35, %r30
	.word 0x83d0001e  ! 1335: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9bd02030  ! 1336: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	mov 0x34, %r30
	.word 0x89d0001e  ! 1339: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 1342: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xded7e020  ! 1345: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r15
	.word 0x83494000  ! 1346: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x85d02033  ! 1349: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xc29004a0  ! 1354: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x87d02031  ! 1357: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xc2dfe030  ! 1362: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	.word 0x2c800001  ! 1363: BNEG	bneg,a	<label_0x1>
	mov 0x30, %r30
	.word 0x8fd0001e  ! 1364: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc28804a0  ! 1365: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x9482400b  ! 1368: ADDcc_R	addcc 	%r9, %r11, %r10
	.word 0xd447e001  ! 1369: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x97d02030  ! 1370: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0xd457e001  ! 1371: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	.word 0x87d02035  ! 1378: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x28800001  ! 1379: BLEU	bleu,a	<label_0x1>
	.word 0xd4d80e40  ! 1382: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	.word 0x9c6b4005  ! 1387: UDIVX_R	udivx 	%r13, %r5, %r14
	.word 0x2e800001  ! 1388: BVS	bvs,a	<label_0x1>
	.word 0x30700001  ! 1391: BPA	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xdc47c000  ! 1401: LDSW_R	ldsw	[%r31 + %r0], %r14
	.word 0x28800001  ! 1408: BLEU	bleu,a	<label_0x1>
	.word 0x81d02032  ! 1413: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xdcc804a0  ! 1414: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	.word 0x92c3a001  ! 1415: ADDCcc_I	addccc 	%r14, 0x0001, %r9
	mov 0x30, %r30
	.word 0x85d0001e  ! 1416: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xd217e001  ! 1423: LDUH_I	lduh	[%r31 + 0x0001], %r9
	mov 0x30, %r30
	.word 0x8bd0001e  ! 1430: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd2dfe010  ! 1431: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0xd217e001  ! 1432: LDUH_I	lduh	[%r31 + 0x0001], %r9
	mov 0x30, %r30
	.word 0x9bd0001e  ! 1439: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd217e001  ! 1440: LDUH_I	lduh	[%r31 + 0x0001], %r9
	.word 0xd2cfe020  ! 1443: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x82816001  ! 1448: ADDcc_I	addcc 	%r5, 0x0001, %r1
	.word 0x81d02030  ! 1451: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x9bd02033  ! 1452: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x8bd02031  ! 1453: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xc297e010  ! 1460: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r1
	.word 0xc2880e80  ! 1463: LDUBA_R	lduba	[%r0, %r0] 0x74, %r1
	.word 0xc207e001  ! 1466: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xcefb4025  ! 1475: SWAPA_R	swapa	%r7, [%r13 + %r5] 0x01
	.word 0x32700001  ! 1478: BPNE	<illegal instruction>
	.word 0xce07c000  ! 1479: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0x87802045  ! 1480: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x28700001  ! 1485: BPLEU	<illegal instruction>
	.word 0x8f68a001  ! 1486: SDIVX_I	sdivx	%r2, 0x0001, %r7
	.word 0x81d02034  ! 1489: Tcc_I	tn	icc_or_xcc, %r0 + 52
	mov 0x33, %r30
	.word 0x87d0001e  ! 1496: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x97d0001e  ! 1501: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xce0fe001  ! 1502: LDUB_I	ldub	[%r31 + 0x0001], %r7
	mov 0x35, %r30
	.word 0x8bd0001e  ! 1503: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8adb0007  ! 1504: SMULcc_R	smulcc 	%r12, %r7, %r5
	mov 0x35, %r30
	.word 0x81d0001e  ! 1509: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xca4fe001  ! 1510: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	mov 0x30, %r30
	.word 0x83d0001e  ! 1511: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8dd02031  ! 1512: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x87802014  ! 1517: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802016  ! 1520: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x33, %r30
	.word 0x8fd0001e  ! 1523: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8a7ae001  ! 1526: SDIV_I	sdiv 	%r11, 0x0001, %r5
	.word 0xcadfe020  ! 1529: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	.word 0xca8fe020  ! 1532: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x8bd02034  ! 1535: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x2c800001  ! 1536: BNEG	bneg,a	<label_0x1>
	.word 0x24700001  ! 1541: BPLE	<illegal instruction>
	.word 0x87802004  ! 1548: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802054  ! 1549: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x2e800001  ! 1554: BVS	bvs,a	<label_0x1>
	.word 0xca47e001  ! 1555: LDSW_I	ldsw	[%r31 + 0x0001], %r5
	.word 0xca8fe030  ! 1556: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	mov 0x32, %r30
	.word 0x9bd0001e  ! 1561: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x9bd0001e  ! 1564: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xca8fe010  ! 1567: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0x8d684004  ! 1570: SDIVX_R	sdivx	%r1, %r4, %r6
	.word 0xcccfe030  ! 1573: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r6
	.word 0xccc7e030  ! 1574: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	mov 0x32, %r30
	.word 0x89d0001e  ! 1579: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x8dd0001e  ! 1586: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x9bd02035  ! 1593: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x8dd02031  ! 1594: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x87a0c9eb  ! 1595: FDIVq	dis not found

	.word 0x9dd02031  ! 1596: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0xc6dfe020  ! 1597: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0xc6d7e010  ! 1598: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
	.word 0xc687e000  ! 1601: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r3
	.word 0x9dd02032  ! 1610: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x87a309c3  ! 1613: FDIVd	fdivd	%f12, %f34, %f34
	.word 0xc64fe001  ! 1614: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0x87802004  ! 1615: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x35, %r30
	.word 0x9fd0001e  ! 1618: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xcc7a2001  ! 1627: SWAP_I	swap	%r6, [%r8 + 0x0001]
	.word 0x9d500000  ! 1632: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x8a794005  ! 1635: SDIV_R	sdiv 	%r5, %r5, %r5
	.word 0x906a6001  ! 1638: UDIVX_I	udivx 	%r9, 0x0001, %r8
	.word 0x8269c00c  ! 1639: UDIVX_R	udivx 	%r7, %r12, %r1
	.word 0x32800001  ! 1640: BNE	bne,a	<label_0x1>
	.word 0xc24fc000  ! 1645: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0xc247e001  ! 1648: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0x87802016  ! 1649: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8802e001  ! 1652: ADD_I	add 	%r11, 0x0001, %r4
	mov 0x33, %r30
	.word 0x85d0001e  ! 1653: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 1654: BPPOS	<illegal instruction>
	.word 0x28800001  ! 1661: BLEU	bleu,a	<label_0x1>
	.word 0xc857c000  ! 1666: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0x38700001  ! 1667: BPGU	<illegal instruction>
	.word 0x32700001  ! 1668: BPNE	<illegal instruction>
	.word 0xc88fe020  ! 1671: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	.word 0xc817e001  ! 1674: LDUH_I	lduh	[%r31 + 0x0001], %r4
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x8fd0001e  ! 1680: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 1683: BPN	<illegal instruction>
	.word 0x32700001  ! 1684: BPNE	<illegal instruction>
	mov 0x35, %r30
	.word 0x99d0001e  ! 1691: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x93500000  ! 1692: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x8a002001  ! 1693: ADD_I	add 	%r0, 0x0001, %r5
	.word 0xca4fe001  ! 1694: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0x91d02033  ! 1697: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x22800001  ! 1698: BE	be,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xcacfe000  ! 1702: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	.word 0x806b8003  ! 1703: UDIVX_R	udivx 	%r14, %r3, %r0
	.word 0xc08004a0  ! 1704: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r0
	.word 0xc08fe020  ! 1709: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r0
	.word 0x9ec22001  ! 1714: ADDCcc_I	addccc 	%r8, 0x0001, %r15
	mov 0x34, %r30
	.word 0x8fd0001e  ! 1715: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xde57c000  ! 1716: LDSH_R	ldsh	[%r31 + %r0], %r15
	.word 0x8d508000  ! 1721: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0xcc17e001  ! 1724: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0x97508000  ! 1725: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x81690003  ! 1726: SDIVX_R	sdivx	%r4, %r3, %r0
	.word 0x2e800001  ! 1727: BVS	bvs,a	<label_0x1>
	.word 0x9bd02031  ! 1728: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0xc00fc000  ! 1731: LDUB_R	ldub	[%r31 + %r0], %r0
	mov 0x33, %r30
	.word 0x81d0001e  ! 1734: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x85d02032  ! 1737: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0xc097e020  ! 1738: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r0
	.word 0x85d02031  ! 1739: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x85d02032  ! 1742: Tcc_I	tle	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc04fc000  ! 1746: LDSB_R	ldsb	[%r31 + %r0], %r0
	mov 0x32, %r30
	.word 0x9fd0001e  ! 1751: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc007c000  ! 1754: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x83508000  ! 1757: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0xc287e000  ! 1758: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r1
	.word 0x97d02033  ! 1759: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x95d02032  ! 1766: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x87802016  ! 1769: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802010  ! 1780: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc24fc000  ! 1781: LDSB_R	ldsb	[%r31 + %r0], %r1
	mov 0x30, %r30
	.word 0x9dd0001e  ! 1790: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x97d02032  ! 1795: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xdfe14028  ! 1800: CASA_I	casa	[%r5] 0x 1, %r8, %r15
	.word 0x8b6b4008  ! 1801: SDIVX_R	sdivx	%r13, %r8, %r5
	.word 0x93d02030  ! 1804: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xc6786001  ! 1805: SWAP_I	swap	%r3, [%r1 + 0x0001]
	.word 0x9a4a8000  ! 1812: MULX_R	mulx 	%r10, %r0, %r13
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83a309a5  ! 1814: FDIVs	fdivs	%f12, %f5, %f1
	.word 0xc2dfe000  ! 1819: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
	mov 0x34, %r30
	.word 0x9fd0001e  ! 1822: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8fd02033  ! 1825: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0xc287e020  ! 1828: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r1
	.word 0x9b6bc003  ! 1835: SDIVX_R	sdivx	%r15, %r3, %r13
	.word 0x844ba001  ! 1836: MULX_I	mulx 	%r14, 0x0001, %r2
	.word 0xc487e020  ! 1841: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r2
	.word 0x24800001  ! 1844: BLE	ble,a	<label_0x1>
	.word 0x87802004  ! 1847: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 1848: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8bd02030  ! 1853: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8a002001  ! 1856: ADD_I	add 	%r0, 0x0001, %r5
	.word 0xca8fe010  ! 1857: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0x8fd02033  ! 1862: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x884ae001  ! 1863: MULX_I	mulx 	%r11, 0x0001, %r4
	.word 0xc807c000  ! 1866: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x826ac005  ! 1867: UDIVX_R	udivx 	%r11, %r5, %r1
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x26700001  ! 1873: BPL	<illegal instruction>
	.word 0x38700001  ! 1874: BPGU	<illegal instruction>
	.word 0x24700001  ! 1877: BPLE	<illegal instruction>
	.word 0xc24fc000  ! 1878: LDSB_R	ldsb	[%r31 + %r0], %r1
	mov 0x33, %r30
	.word 0x9fd0001e  ! 1879: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8b504000  ! 1884: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x9fd02035  ! 1885: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x867a2001  ! 1888: SDIV_I	sdiv 	%r8, 0x0001, %r3
	.word 0x8c7aa001  ! 1893: SDIV_I	sdiv 	%r10, 0x0001, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83a389c1  ! 1899: FDIVd	fdivd	%f14, %f32, %f32
	.word 0x87d02030  ! 1906: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xc2c00e60  ! 1909: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r1
	.word 0x34800001  ! 1916: BG	bg,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x8fd0001e  ! 1920: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x81d0001e  ! 1921: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 1922: BPA	<illegal instruction>
	.word 0x3e700001  ! 1923: BPVC	<illegal instruction>
	.word 0x22800001  ! 1932: BE	be,a	<label_0x1>
	.word 0xc247c000  ! 1935: LDSW_R	ldsw	[%r31 + %r0], %r1
	mov 0x35, %r30
	.word 0x83d0001e  ! 1938: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc24fc000  ! 1958: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0x8fd02031  ! 1965: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xc2dfe020  ! 1976: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r1
	.word 0x87802045  ! 1981: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xdbe3402b  ! 1982: CASA_I	casa	[%r13] 0x 1, %r11, %r13
	.word 0xdac7e000  ! 1983: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0xdad004a0  ! 1984: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1989: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x95d02031  ! 1990: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0xda0fc000  ! 1991: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x97d02035  ! 1992: Tcc_I	tge	icc_or_xcc, %r0 + 53
	mov 0x30, %r30
	.word 0x95d0001e  ! 1999: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xdadfe020  ! 2000: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0xda97e010  ! 2001: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0x87802004  ! 2006: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x35, %r30
	.word 0x9bd0001e  ! 2007: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x87802045  ! 2008: WRASI_I	wr	%r0, 0x0045, %asi
	mov 0x35, %r30
	.word 0x8bd0001e  ! 2009: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x85d02031  ! 2010: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xda57c000  ! 2011: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0xda07c000  ! 2020: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0xda47e001  ! 2023: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0xda4fc000  ! 2026: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x97d02034  ! 2027: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0xda97e010  ! 2028: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0xdac7e000  ! 2029: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	mov 0x31, %r30
	.word 0x8dd0001e  ! 2030: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 2031: BN	bn,a	<label_0x1>
	.word 0x3e700001  ! 2032: BPVC	<illegal instruction>
	.word 0xdacfe000  ! 2043: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	.word 0x30800001  ! 2048: BA	ba,a	<label_0x1>
	mov 0x34, %r30
	.word 0x9dd0001e  ! 2053: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 2058: BPN	<illegal instruction>
	.word 0x3c800001  ! 2059: BPOS	bpos,a	<label_0x1>
	.word 0x36700001  ! 2060: BPGE	<illegal instruction>
	.word 0xda57e001  ! 2063: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0xda5fe001  ! 2066: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0xda47c000  ! 2071: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x99500000  ! 2074: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x9f500000  ! 2077: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x28700001  ! 2084: BPLEU	<illegal instruction>
	.word 0x8351c000  ! 2085: RDPR_TL	rdpr	%tl, %r1
	.word 0x87802045  ! 2088: WRASI_I	wr	%r0, 0x0045, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x3c700001  ! 2096: BPPOS	<illegal instruction>
	.word 0x9b508000  ! 2101: RDPR_TSTATE	rdpr	%tstate, %r13
	mov 0x30, %r30
	.word 0x87d0001e  ! 2102: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x81d02032  ! 2103: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x8d68000f  ! 2110: SDIVX_R	sdivx	%r0, %r15, %r6
	.word 0x91d02031  ! 2111: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x2e700001  ! 2114: BPVS	<illegal instruction>
	.word 0x3c700001  ! 2117: BPPOS	<illegal instruction>
	.word 0x916a6001  ! 2128: SDIVX_I	sdivx	%r9, 0x0001, %r8
	.word 0x99d02035  ! 2133: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0x8b50c000  ! 2134: RDPR_TT	rdpr	%tt, %r5
	.word 0x3a800001  ! 2135: BCC	bcc,a	<label_0x1>
	.word 0x87802016  ! 2144: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x3c800001  ! 2145: BPOS	bpos,a	<label_0x1>
	.word 0x81d02035  ! 2146: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0xca17c000  ! 2151: LDUH_R	lduh	[%r31 + %r0], %r5
	.word 0xca8004a0  ! 2154: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802016  ! 2156: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xca0fc000  ! 2159: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xcadfe020  ! 2162: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	.word 0x90c26001  ! 2163: ADDCcc_I	addccc 	%r9, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89696001  ! 2171: SDIVX_I	sdivx	%r5, 0x0001, %r4
	mov 0x30, %r30
	.word 0x81d0001e  ! 2172: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x97d0001e  ! 2175: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc8dfe000  ! 2176: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r4
	.word 0x80c16001  ! 2177: ADDCcc_I	addccc 	%r5, 0x0001, %r0
	.word 0x8d494000  ! 2180: RDHPR_HTBA	rdhpr	%htba, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc0fe001  ! 2188: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0xcccfe000  ! 2193: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r6
	.word 0x30700001  ! 2194: BPA	<illegal instruction>
	.word 0x3c800001  ! 2195: BPOS	bpos,a	<label_0x1>
	mov 0x35, %r30
	.word 0x95d0001e  ! 2196: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x85504000  ! 2197: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0xc4900e60  ! 2200: LDUHA_R	lduha	[%r0, %r0] 0x73, %r2
	.word 0x34700001  ! 2203: BPG	<illegal instruction>
	.word 0xc4d7e010  ! 2204: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r2
	.word 0xc407c000  ! 2205: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0xc48004a0  ! 2210: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r2
	.word 0xd6796001  ! 2217: SWAP_I	swap	%r11, [%r5 + 0x0001]
	.word 0xd687e020  ! 2222: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r11
	.word 0xd6d7e010  ! 2223: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x87802014  ! 2224: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x3e800001  ! 2225: BVC	bvc,a	<label_0x1>
	.word 0x95d02033  ! 2226: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x8bd02035  ! 2229: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802045  ! 2243: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x8e036001  ! 2244: ADD_I	add 	%r13, 0x0001, %r7
	mov 0x35, %r30
	.word 0x95d0001e  ! 2253: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 2254: BLE	ble,a	<label_0x1>
	.word 0xced004a0  ! 2257: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	mov 0x30, %r30
	.word 0x81d0001e  ! 2258: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xce0fc000  ! 2263: LDUB_R	ldub	[%r31 + %r0], %r7
	mov 0x35, %r30
	.word 0x95d0001e  ! 2268: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x81d02032  ! 2269: Tcc_I	tn	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x8bd0001e  ! 2281: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9dd0001e  ! 2284: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x3e700001  ! 2287: BPVC	<illegal instruction>
	.word 0x9fd02034  ! 2290: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x8fa249a4  ! 2293: FDIVs	fdivs	%f9, %f4, %f7
	.word 0x87802045  ! 2294: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xcecfe010  ! 2295: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r7
	.word 0xce07e001  ! 2296: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xce8fe030  ! 2297: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r7
	.word 0x8351c000  ! 2304: RDPR_TL	rdpr	%tl, %r1
	.word 0xc287e020  ! 2305: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r1
	.word 0x94796001  ! 2306: SDIV_I	sdiv 	%r5, 0x0001, %r10
	.word 0x97d02034  ! 2307: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x26700001  ! 2312: BPL	<illegal instruction>
	mov 0x30, %r30
	.word 0x89d0001e  ! 2313: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 2314: BPOS	bpos,a	<label_0x1>
	.word 0xd4d00e80  ! 2315: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
	.word 0x89d02033  ! 2322: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	mov 0x34, %r30
	.word 0x89d0001e  ! 2323: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd48fe020  ! 2326: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x87802045  ! 2329: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xd4d804a0  ! 2330: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd417e001  ! 2331: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0xd4c7e030  ! 2334: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	.word 0x8dd02033  ! 2341: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x9bd02035  ! 2344: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xd4c7e000  ! 2345: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	mov 0x30, %r30
	.word 0x89d0001e  ! 2348: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd48804a0  ! 2351: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x2e800001  ! 2352: BVS	bvs,a	<label_0x1>
	.word 0xd4d7e030  ! 2359: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	mov 0x32, %r30
	.word 0x95d0001e  ! 2362: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd457e001  ! 2363: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	.word 0xd4d00e40  ! 2366: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
	.word 0xd487e000  ! 2369: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r10
	.word 0xd497e010  ! 2370: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
	.word 0xd48fe000  ! 2371: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0xd447c000  ! 2372: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x2a700001  ! 2373: BPCS	<illegal instruction>
	.word 0x80d2a001  ! 2378: UMULcc_I	umulcc 	%r10, 0x0001, %r0
	.word 0x3a800001  ! 2379: BCC	bcc,a	<label_0x1>
	mov 0x35, %r30
	.word 0x89d0001e  ! 2384: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc09004a0  ! 2385: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0xc047c000  ! 2390: LDSW_R	ldsw	[%r31 + %r0], %r0
	mov 0x32, %r30
	.word 0x89d0001e  ! 2395: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x94c26001  ! 2398: ADDCcc_I	addccc 	%r9, 0x0001, %r10
	.word 0xd417e001  ! 2399: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0xd4dfe030  ! 2400: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x87d02032  ! 2405: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0xd407c000  ! 2406: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0xd4d7e000  ! 2409: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0x99d02033  ! 2410: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x9151c000  ! 2411: RDPR_TL	rdpr	%tl, %r8
	.word 0xd08fe030  ! 2414: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
	.word 0x2a800001  ! 2415: BCS	bcs,a	<label_0x1>
	.word 0xd047e001  ! 2416: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x94c12001  ! 2417: ADDCcc_I	addccc 	%r4, 0x0001, %r10
	.word 0x93500000  ! 2418: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x8a836001  ! 2421: ADDcc_I	addcc 	%r13, 0x0001, %r5
	.word 0xca0fe001  ! 2422: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0x91d02035  ! 2425: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd1e00028  ! 2426: CASA_I	casa	[%r0] 0x 1, %r8, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0x99d02031  ! 2432: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x95508000  ! 2435: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x97514000  ! 2440: RDPR_TBA	rdpr	%tba, %r11
	.word 0x38800001  ! 2441: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x99d0001e  ! 2457: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 2464: BE	be,a	<label_0x1>
	.word 0x9a51800a  ! 2465: UMUL_R	umul 	%r6, %r10, %r13
	.word 0x91494000  ! 2466: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x87802010  ! 2467: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x80528000  ! 2470: UMUL_R	umul 	%r10, %r0, %r0
	.word 0xc017c000  ! 2475: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc087e030  ! 2478: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r0
	.word 0x8fd02030  ! 2479: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xc087e000  ! 2488: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r0
	mov 0x31, %r30
	.word 0x81d0001e  ! 2489: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 2490: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc057c000  ! 2491: LDSH_R	ldsh	[%r31 + %r0], %r0
	.word 0xc007e001  ! 2492: LDUW_I	lduw	[%r31 + 0x0001], %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x984a4006  ! 2498: MULX_R	mulx 	%r9, %r6, %r12
	.word 0x99494000  ! 2501: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x95514000  ! 2502: RDPR_TBA	rdpr	%tba, %r10
	.word 0xd407e001  ! 2505: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8bd02032  ! 2506: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	mov 0x34, %r30
	.word 0x99d0001e  ! 2507: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9bd0001e  ! 2510: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 2511: BVS	bvs,a	<label_0x1>
	.word 0xd417e001  ! 2512: LDUH_I	lduh	[%r31 + 0x0001], %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd49004a0  ! 2520: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x36800001  ! 2523: BGE	bge,a	<label_0x1>
	.word 0x8283c004  ! 2524: ADDcc_R	addcc 	%r15, %r4, %r1
	.word 0x8bd02030  ! 2525: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0xc28fe020  ! 2536: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r1
	.word 0x93d02030  ! 2541: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xc28fe010  ! 2542: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	.word 0xc207e001  ! 2545: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x9dd02035  ! 2546: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x83d02033  ! 2547: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x847be001  ! 2548: SDIV_I	sdiv 	%r15, 0x0001, %r2
	.word 0x9450c00d  ! 2549: UMUL_R	umul 	%r3, %r13, %r10
	.word 0x28800001  ! 2566: BLEU	bleu,a	<label_0x1>
	mov 0x30, %r30
	.word 0x83d0001e  ! 2571: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd45fc000  ! 2572: LDX_R	ldx	[%r31 + %r0], %r10
	mov 0x35, %r30
	.word 0x87d0001e  ! 2573: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e010  ! 2574: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8cd2a001  ! 2582: UMULcc_I	umulcc 	%r10, 0x0001, %r6
	.word 0x81d02032  ! 2585: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x34700001  ! 2590: BPG	<illegal instruction>
	.word 0x3c700001  ! 2593: BPPOS	<illegal instruction>
	.word 0x3a700001  ! 2594: BPCC	<illegal instruction>
	.word 0x28700001  ! 2601: BPLEU	<illegal instruction>
	mov 0x35, %r30
	.word 0x97d0001e  ! 2606: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xcc0fc000  ! 2609: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x91d02033  ! 2610: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xcc0fc000  ! 2611: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0xccd7e000  ! 2612: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
	.word 0xccc7e020  ! 2613: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r6
	.word 0x9fd02032  ! 2614: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x8bd02030  ! 2621: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0xcc4fc000  ! 2622: LDSB_R	ldsb	[%r31 + %r0], %r6
	.word 0x89d02030  ! 2623: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x87802054  ! 2624: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x97690002  ! 2625: SDIVX_R	sdivx	%r4, %r2, %r11
	.word 0x97d02035  ! 2626: Tcc_I	tge	icc_or_xcc, %r0 + 53
	mov 0x30, %r30
	.word 0x81d0001e  ! 2631: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x99d02033  ! 2632: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 2633: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd6dfe020  ! 2640: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r11
	.word 0x87802010  ! 2641: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x36800001  ! 2646: BGE	bge,a	<label_0x1>
	.word 0x9951c000  ! 2651: RDPR_TL	rdpr	%tl, %r12
	.word 0x9d494000  ! 2652: RDHPR_HTBA	rdhpr	%htba, %r14
	.word 0xdc0fc000  ! 2655: LDUB_R	ldub	[%r31 + %r0], %r14
	.word 0x9ad36001  ! 2656: UMULcc_I	umulcc 	%r13, 0x0001, %r13
	.word 0x8a81e001  ! 2657: ADDcc_I	addcc 	%r7, 0x0001, %r5
	.word 0x3c800001  ! 2658: BPOS	bpos,a	<label_0x1>
	mov 0x30, %r30
	.word 0x8dd0001e  ! 2661: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xcac004a0  ! 2662: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x87802016  ! 2665: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x36700001  ! 2668: BPGE	<illegal instruction>
	.word 0x8fd02032  ! 2671: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0x8bd02030  ! 2676: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x87802010  ! 2679: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xca8fe030  ! 2686: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	.word 0xca97e010  ! 2687: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r5
	.word 0xca8fe020  ! 2694: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x8fd02034  ! 2695: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x81a389ea  ! 2696: FDIVq	dis not found

	.word 0x2e700001  ! 2697: BPVS	<illegal instruction>
	.word 0x2c700001  ! 2698: BPNEG	<illegal instruction>
	.word 0xc00fe001  ! 2699: LDUB_I	ldub	[%r31 + 0x0001], %r0
	.word 0xc08fe030  ! 2700: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r0
	.word 0xc047c000  ! 2709: LDSW_R	ldsw	[%r31 + %r0], %r0
	.word 0x87802054  ! 2710: WRASI_I	wr	%r0, 0x0054, %asi
	mov 0x34, %r30
	.word 0x8fd0001e  ! 2717: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x87802054  ! 2718: WRASI_I	wr	%r0, 0x0054, %asi
	mov 0x34, %r30
	.word 0x8dd0001e  ! 2719: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x8bd0001e  ! 2720: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x24700001  ! 2732: BPLE	<illegal instruction>
	.word 0xc08804a0  ! 2735: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	mov 0x30, %r30
	.word 0x99d0001e  ! 2736: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xdafbc025  ! 2737: SWAPA_R	swapa	%r13, [%r15 + %r5] 0x01
	.word 0x8cdb0007  ! 2738: SMULcc_R	smulcc 	%r12, %r7, %r6
	.word 0xcc07c000  ! 2743: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0xcc17c000  ! 2746: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0x8dd02030  ! 2747: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x8079e001  ! 2748: SDIV_I	sdiv 	%r7, 0x0001, %r0
	.word 0xc0c7e000  ! 2749: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0xc0c7e010  ! 2754: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0xc0dfe020  ! 2759: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r0
	.word 0xc0cfe030  ! 2762: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	.word 0xc007c000  ! 2763: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x26800001  ! 2764: BL	bl,a	<label_0x1>
	.word 0xc04fe001  ! 2765: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0x34700001  ! 2766: BPG	<illegal instruction>
	.word 0x8fd02032  ! 2767: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	mov 0x31, %r30
	.word 0x95d0001e  ! 2768: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x83500000  ! 2773: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x9dd02033  ! 2782: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x3a700001  ! 2785: BPCC	<illegal instruction>
	.word 0x83514000  ! 2786: RDPR_TBA	rdpr	%tba, %r1
	.word 0x9fd02030  ! 2789: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0xc2d00e80  ! 2790: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r1
	.word 0x9bd02032  ! 2793: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0xc287e030  ! 2794: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r1
	.word 0xc297e020  ! 2797: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3a800001  ! 2807: BCC	bcc,a	<label_0x1>
	mov 0x30, %r30
	.word 0x83d0001e  ! 2812: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802054  ! 2815: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x89480000  ! 2816: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0xc8cfe010  ! 2823: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0x99d02032  ! 2828: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	mov 0x34, %r30
	.word 0x99d0001e  ! 2831: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x85d0001e  ! 2838: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 2845: BPA	<illegal instruction>
	.word 0x81494000  ! 2846: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0xc007e001  ! 2847: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc0cfe020  ! 2850: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r0
	.word 0x36700001  ! 2851: BPGE	<illegal instruction>
	.word 0x3c800001  ! 2852: BPOS	bpos,a	<label_0x1>
	.word 0x87802010  ! 2853: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x99d02032  ! 2860: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	mov 0x35, %r30
	.word 0x81d0001e  ! 2877: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x95d02030  ! 2878: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x987a4006  ! 2883: SDIV_R	sdiv 	%r9, %r6, %r12
	.word 0x81d02032  ! 2890: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xd8d7e000  ! 2893: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x8fa309ab  ! 2900: FDIVs	fdivs	%f12, %f11, %f7
	.word 0x83d02034  ! 2903: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xcecfe000  ! 2904: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r7
	.word 0x91494000  ! 2907: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x26800001  ! 2908: BL	bl,a	<label_0x1>
	.word 0x36800001  ! 2911: BGE	bge,a	<label_0x1>
	.word 0x30800001  ! 2912: BA	ba,a	<label_0x1>
	.word 0x9bd02033  ! 2913: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0xd05fc000  ! 2932: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8fd02030  ! 2933: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xd09004a0  ! 2934: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd0c7e030  ! 2939: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0xd00fc000  ! 2950: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x9bd02030  ! 2953: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0xd04fe001  ! 2954: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x96688001  ! 2958: UDIVX_R	udivx 	%r2, %r1, %r11
	.word 0xd64fe001  ! 2959: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x87802004  ! 2966: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x99d02034  ! 2969: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x33, %r30
	.word 0x9dd0001e  ! 2973: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 2976: BNE	bne,a	<label_0x1>
	.word 0xd68804a0  ! 2977: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x87d02034  ! 2980: Tcc_I	tl	icc_or_xcc, %r0 + 52
	mov 0x32, %r30
	.word 0x95d0001e  ! 2983: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x89480000  ! 2984: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x93d02030  ! 2985: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x947b2001  ! 2990: SDIV_I	sdiv 	%r12, 0x0001, %r10
	mov 0x34, %r30
	.word 0x81d0001e  ! 2991: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 2998: BPA	<illegal instruction>
	.word 0x9d696001  ! 3001: SDIVX_I	sdivx	%r5, 0x0001, %r14
	.word 0xdc4fc000  ! 3004: LDSB_R	ldsb	[%r31 + %r0], %r14
	.word 0xdcc804a0  ! 3009: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	mov 0x30, %r30
	.word 0x8dd0001e  ! 3022: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x95d02032  ! 3023: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x24800001  ! 3024: BLE	ble,a	<label_0x1>
	.word 0xdcc804a0  ! 3031: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	.word 0x87802054  ! 3032: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x81508000  ! 3035: RDPR_TSTATE	rdpr	%tstate, %r0
	mov 0x31, %r30
	.word 0x8bd0001e  ! 3036: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x886a6001  ! 3039: UDIVX_I	udivx 	%r9, 0x0001, %r4
	.word 0x2a700001  ! 3040: BPCS	<illegal instruction>
	.word 0xc857c000  ! 3045: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0xc847e001  ! 3046: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0x8a480000  ! 3047: MULX_R	mulx 	%r0, %r0, %r5
	mov 0x34, %r30
	.word 0x8dd0001e  ! 3048: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x98504003  ! 3053: UMUL_R	umul 	%r1, %r3, %r12
	.word 0x81d02034  ! 3054: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0xd8cfe030  ! 3059: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0x9a49a001  ! 3070: MULX_I	mulx 	%r6, 0x0001, %r13
	.word 0xda97e000  ! 3073: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0xda4fc000  ! 3074: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x95a3c9e6  ! 3075: FDIVq	dis not found

	mov 0x31, %r30
	.word 0x99d0001e  ! 3078: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd417c000  ! 3085: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0xd48fe030  ! 3086: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x8ad3e001  ! 3091: UMULcc_I	umulcc 	%r15, 0x0001, %r5
	.word 0xca0fe001  ! 3094: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0x85d02033  ! 3097: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xcacfe010  ! 3098: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	.word 0x884ae001  ! 3103: MULX_I	mulx 	%r11, 0x0001, %r4
	mov 0x31, %r30
	.word 0x9dd0001e  ! 3108: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xc80fe001  ! 3109: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0xc85fc000  ! 3114: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x9080400d  ! 3119: ADDcc_R	addcc 	%r1, %r13, %r8
	.word 0xd0cfe000  ! 3126: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	.word 0x8051800f  ! 3133: UMUL_R	umul 	%r6, %r15, %r0
	.word 0x8d6b800d  ! 3134: SDIVX_R	sdivx	%r14, %r13, %r6
	.word 0x93d02032  ! 3143: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xcc87e000  ! 3144: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r6
	.word 0x93a289c4  ! 3147: FDIVd	fdivd	%f10, %f4, %f40
	.word 0x3a700001  ! 3148: BPCC	<illegal instruction>
	.word 0x8ba1c9c8  ! 3149: FDIVd	fdivd	%f38, %f8, %f36
	.word 0xcadfe030  ! 3158: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	mov 0x35, %r30
	.word 0x95d0001e  ! 3161: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 3168: BPNE	<illegal instruction>
	.word 0x8bd02030  ! 3171: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8a00a001  ! 3172: ADD_I	add 	%r2, 0x0001, %r5
	.word 0xcacfe020  ! 3173: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0xca4fc000  ! 3174: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x3a800001  ! 3175: BCC	bcc,a	<label_0x1>
	.word 0xca0fc000  ! 3188: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0x83d02033  ! 3193: Tcc_I	te	icc_or_xcc, %r0 + 51
	mov 0x34, %r30
	.word 0x91d0001e  ! 3198: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x9dd0001e  ! 3203: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x97480000  ! 3206: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd6cfe020  ! 3212: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0x846ba001  ! 3219: UDIVX_I	udivx 	%r14, 0x0001, %r2
	.word 0x8ad9400b  ! 3220: SMULcc_R	smulcc 	%r5, %r11, %r5
	.word 0x9e780004  ! 3221: SDIV_R	sdiv 	%r0, %r4, %r15
	.word 0x2a700001  ! 3222: BPCS	<illegal instruction>
	.word 0x22800001  ! 3227: BE	be,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8481400b  ! 3229: ADDcc_R	addcc 	%r5, %r11, %r2
	.word 0x9cc0a001  ! 3234: ADDCcc_I	addccc 	%r2, 0x0001, %r14
	.word 0x32800001  ! 3237: BNE	bne,a	<label_0x1>
	.word 0xdc5fe001  ! 3242: LDX_I	ldx	[%r31 + 0x0001], %r14
	.word 0x82782001  ! 3243: SDIV_I	sdiv 	%r0, 0x0001, %r1
	.word 0xc2cfe030  ! 3244: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	.word 0xc287e000  ! 3247: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r1
	.word 0xc20fe001  ! 3248: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0x8bd02031  ! 3251: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0x87d02031  ! 3252: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x8680800f  ! 3255: ADDcc_R	addcc 	%r2, %r15, %r3
	.word 0xc657c000  ! 3258: LDSH_R	ldsh	[%r31 + %r0], %r3
	.word 0xc697e000  ! 3267: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	mov 0x31, %r30
	.word 0x9dd0001e  ! 3268: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc6d804a0  ! 3270: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x93514000  ! 3273: RDPR_TBA	rdpr	%tba, %r9
	.word 0xd217c000  ! 3276: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x8b480000  ! 3289: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x26800001  ! 3290: BL	bl,a	<label_0x1>
	mov 0x35, %r30
	.word 0x85d0001e  ! 3291: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xcac7e020  ! 3294: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r5
	.word 0xca57c000  ! 3299: LDSH_R	ldsh	[%r31 + %r0], %r5
	mov 0x35, %r30
	.word 0x85d0001e  ! 3300: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x83d0001e  ! 3301: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9bd02033  ! 3304: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x9e6b2001  ! 3311: UDIVX_I	udivx 	%r12, 0x0001, %r15
	.word 0xded7e000  ! 3312: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r15
	.word 0x87802004  ! 3313: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87d02033  ! 3314: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x9969e001  ! 3315: SDIVX_I	sdivx	%r7, 0x0001, %r12
	mov 0x31, %r30
	.word 0x8dd0001e  ! 3322: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x9ac32001  ! 3323: ADDCcc_I	addccc 	%r12, 0x0001, %r13
	.word 0x97d02035  ! 3330: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x34800001  ! 3335: BG	bg,a	<label_0x1>
	.word 0x83d02032  ! 3336: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x95d02035  ! 3337: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x20800001  ! 3340: BN	bn,a	<label_0x1>
	.word 0x9bd02035  ! 3345: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xda0fe001  ! 3346: LDUB_I	ldub	[%r31 + 0x0001], %r13
	mov 0x35, %r30
	.word 0x91d0001e  ! 3347: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda17c000  ! 3350: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x85d02031  ! 3351: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x87802014  ! 3352: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x2e700001  ! 3355: BPVS	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x38800001  ! 3363: BGU	bgu,a	<label_0x1>
	mov 0x35, %r30
	.word 0x8fd0001e  ! 3364: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xda87e010  ! 3367: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r13
	.word 0x85514000  ! 3368: RDPR_TBA	rdpr	%tba, %r2
	.word 0x84d1e001  ! 3369: UMULcc_I	umulcc 	%r7, 0x0001, %r2
	.word 0x87802045  ! 3370: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x8dd02031  ! 3371: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x8fd02031  ! 3372: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xc4cfe000  ! 3373: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	mov 0x31, %r30
	.word 0x91d0001e  ! 3374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x97d0001e  ! 3383: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x97d0001e  ! 3392: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x88d12001  ! 3393: UMULcc_I	umulcc 	%r4, 0x0001, %r4
	.word 0xc817e001  ! 3394: LDUH_I	lduh	[%r31 + 0x0001], %r4
	mov 0x35, %r30
	.word 0x81d0001e  ! 3395: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 3396: BPOS	bpos,a	<label_0x1>
	.word 0xc897e000  ! 3397: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r4
	mov 0x32, %r30
	.word 0x81d0001e  ! 3400: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc85fc000  ! 3403: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x87802045  ! 3406: WRASI_I	wr	%r0, 0x0045, %asi
	mov 0x30, %r30
	.word 0x91d0001e  ! 3411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc807e001  ! 3412: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x81d02034  ! 3421: Tcc_I	tn	icc_or_xcc, %r0 + 52
	mov 0x33, %r30
	.word 0x8dd0001e  ! 3424: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 3433: BPLE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3c700001  ! 3441: BPPOS	<illegal instruction>
	.word 0xc88fe030  ! 3446: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0xc817c000  ! 3447: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x8bd02032  ! 3450: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x20800001  ! 3455: BN	bn,a	<label_0x1>
	mov 0x32, %r30
	.word 0x99d0001e  ! 3458: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xc85fc000  ! 3459: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x99d02033  ! 3460: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	mov 0x34, %r30
	.word 0x99d0001e  ! 3467: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xc84fe001  ! 3470: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc88fe020  ! 3471: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	.word 0xc88fe000  ! 3472: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
	mov 0x30, %r30
	.word 0x99d0001e  ! 3473: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 3474: BPLEU	<illegal instruction>
	.word 0x93d02033  ! 3475: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc8d7e000  ! 3476: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r4
	.word 0x847a800e  ! 3477: SDIV_R	sdiv 	%r10, %r14, %r2
	.word 0x81d02031  ! 3482: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0xc407c000  ! 3483: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x9bd02033  ! 3484: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x22700001  ! 3491: BPE	<illegal instruction>
	.word 0xc447c000  ! 3492: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0xc4c7e000  ! 3493: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	mov 0x35, %r30
	.word 0x89d0001e  ! 3494: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 3497: BNE	bne,a	<label_0x1>
	.word 0x9eda8000  ! 3498: SMULcc_R	smulcc 	%r10, %r0, %r15
	.word 0x99d02032  ! 3503: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0x3e700001  ! 3504: BPVC	<illegal instruction>
	.word 0xded00e60  ! 3505: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r15
	.word 0x8dd02035  ! 3510: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	mov 0x31, %r30
	.word 0x97d0001e  ! 3511: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9fd0001e  ! 3512: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 3513: BLE	ble,a	<label_0x1>
	.word 0x87802010  ! 3516: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87682001  ! 3521: SDIVX_I	sdivx	%r0, 0x0001, %r3
	.word 0xc697e030  ! 3522: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	mov 0x33, %r30
	.word 0x8dd0001e  ! 3525: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 3526: BPLEU	<illegal instruction>
	.word 0x34700001  ! 3527: BPG	<illegal instruction>
	.word 0xc64fe001  ! 3528: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0xc6d7e010  ! 3529: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
	.word 0x9ba189c0  ! 3530: FDIVd	fdivd	%f6, %f0, %f44
	.word 0x87d02032  ! 3537: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 3538: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802016  ! 3541: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x97d02031  ! 3548: Tcc_I	tge	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99d02030  ! 3550: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xda4fe001  ! 3552: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x82012001  ! 3553: ADD_I	add 	%r4, 0x0001, %r1
	.word 0xc2c7e000  ! 3556: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	.word 0xc207c000  ! 3557: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0x97a109aa  ! 3560: FDIVs	fdivs	%f4, %f10, %f11
	.word 0xd60fe001  ! 3561: LDUB_I	ldub	[%r31 + 0x0001], %r11
	.word 0x22800001  ! 3562: BE	be,a	<label_0x1>
	.word 0xd687e000  ! 3563: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r11
	.word 0x96784007  ! 3566: SDIV_R	sdiv 	%r1, %r7, %r11
	.word 0x38800001  ! 3567: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x36700001  ! 3571: BPGE	<illegal instruction>
	.word 0xd6cfe020  ! 3572: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0x8350c000  ! 3575: RDPR_TT	rdpr	%tt, %r1
	.word 0x20700001  ! 3576: BPN	<illegal instruction>
	.word 0x28800001  ! 3577: BLEU	bleu,a	<label_0x1>
	.word 0x9ada4003  ! 3578: SMULcc_R	smulcc 	%r9, %r3, %r13
	.word 0x866a0006  ! 3583: UDIVX_R	udivx 	%r8, %r6, %r3
	.word 0x984a8004  ! 3584: MULX_R	mulx 	%r10, %r4, %r12
	mov 0x30, %r30
	.word 0x93d0001e  ! 3587: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 3590: BLEU	bleu,a	<label_0x1>
	.word 0xd8c7e020  ! 3591: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0xd8cfe000  ! 3592: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0xd897e020  ! 3601: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x8dd02030  ! 3604: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x36700001  ! 3608: BPGE	<illegal instruction>
	.word 0x9a81a001  ! 3611: ADDcc_I	addcc 	%r6, 0x0001, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81d02030  ! 3613: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0xda47e001  ! 3614: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802004  ! 3618: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xda87e030  ! 3621: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r13
	.word 0x90d0800b  ! 3622: UMULcc_R	umulcc 	%r2, %r11, %r8
	.word 0x8a488008  ! 3625: MULX_R	mulx 	%r2, %r8, %r5
	.word 0xcad80e60  ! 3628: LDXA_R	ldxa	[%r0, %r0] 0x73, %r5
	.word 0xcad00e60  ! 3629: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r5
	.word 0xcad804a0  ! 3630: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x87d02034  ! 3631: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x8551c000  ! 3632: RDPR_TL	rdpr	%tl, %r2
	mov 0x30, %r30
	.word 0x87d0001e  ! 3635: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x986ac003  ! 3636: UDIVX_R	udivx 	%r11, %r3, %r12
	mov 0x31, %r30
	.word 0x97d0001e  ! 3637: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 3654: BPPOS	<illegal instruction>
	.word 0xd857c000  ! 3661: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x97d02032  ! 3662: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xd8d7e030  ! 3669: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
	.word 0xd85fe001  ! 3674: LDX_I	ldx	[%r31 + 0x0001], %r12
	mov 0x35, %r30
	.word 0x89d0001e  ! 3677: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd807e001  ! 3680: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8950c000  ! 3683: RDPR_TT	rdpr	%tt, %r4
	.word 0xc847c000  ! 3690: LDSW_R	ldsw	[%r31 + %r0], %r4
	mov 0x34, %r30
	.word 0x97d0001e  ! 3691: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc8d7e010  ! 3692: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r4
	.word 0xc857e001  ! 3697: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x8e494009  ! 3698: MULX_R	mulx 	%r5, %r9, %r7
	.word 0x89d02033  ! 3707: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x30700001  ! 3710: BPA	<illegal instruction>
	.word 0xce47c000  ! 3713: LDSW_R	ldsw	[%r31 + %r0], %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce07e001  ! 3715: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x9dd02035  ! 3716: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	mov 0x33, %r30
	.word 0x85d0001e  ! 3719: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x89d02033  ! 3720: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0xcec00e80  ! 3723: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r7
	.word 0x80d8400a  ! 3724: SMULcc_R	smulcc 	%r1, %r10, %r0
	.word 0xc087e020  ! 3729: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r0
	.word 0xc097e010  ! 3742: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0xc0c7e030  ! 3743: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	.word 0x9d6ba001  ! 3744: SDIVX_I	sdivx	%r14, 0x0001, %r14
	.word 0x8dd02030  ! 3747: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x32800001  ! 3748: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 3751: BN	bn,a	<label_0x1>
	.word 0xdc17e001  ! 3752: LDUH_I	lduh	[%r31 + 0x0001], %r14
	.word 0x34800001  ! 3755: BG	bg,a	<label_0x1>
	.word 0xdc57c000  ! 3756: LDSH_R	ldsh	[%r31 + %r0], %r14
	.word 0x87d02035  ! 3757: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0xdcd00e60  ! 3760: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r14
	.word 0x87802010  ! 3763: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8e49a001  ! 3764: MULX_I	mulx 	%r6, 0x0001, %r7
	.word 0xce97e020  ! 3765: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	.word 0x8dd02033  ! 3768: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x8c79c000  ! 3771: SDIV_R	sdiv 	%r7, %r0, %r6
	mov 0x31, %r30
	.word 0x81d0001e  ! 3772: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x89d02032  ! 3782: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0xcc5fe001  ! 3783: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0xcc8fe010  ! 3784: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	.word 0x83d02031  ! 3785: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8cdb000f  ! 3788: SMULcc_R	smulcc 	%r12, %r15, %r6
	mov 0x31, %r30
	.word 0x93d0001e  ! 3789: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 3790: BPLEU	<illegal instruction>
	.word 0x32700001  ! 3795: BPNE	<illegal instruction>
	mov 0x31, %r30
	.word 0x89d0001e  ! 3796: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x3e700001  ! 3797: BPVC	<illegal instruction>
	.word 0xca79e001  ! 3798: SWAP_I	swap	%r5, [%r7 + 0x0001]
	mov 0x35, %r30
	.word 0x8bd0001e  ! 3799: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x82802001  ! 3800: ADDcc_I	addcc 	%r0, 0x0001, %r1
	.word 0x3c800001  ! 3801: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc257c000  ! 3805: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0xc207c000  ! 3806: LDUW_R	lduw	[%r31 + %r0], %r1
	mov 0x32, %r30
	.word 0x85d0001e  ! 3807: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x9bd02030  ! 3810: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0xc24fe001  ! 3815: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0xc207e001  ! 3816: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x3a700001  ! 3827: BPCC	<illegal instruction>
	.word 0x32700001  ! 3830: BPNE	<illegal instruction>
	.word 0xc2d7e020  ! 3833: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	.word 0x93514000  ! 3838: RDPR_TBA	rdpr	%tba, %r9
	.word 0x9bd02031  ! 3841: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0xd257e001  ! 3844: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0xd2c7e020  ! 3845: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	.word 0x866b2001  ! 3848: UDIVX_I	udivx 	%r12, 0x0001, %r3
	.word 0x28700001  ! 3853: BPLEU	<illegal instruction>
	.word 0x9e78e001  ! 3854: SDIV_I	sdiv 	%r3, 0x0001, %r15
	.word 0x87802016  ! 3857: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xde4fc000  ! 3862: LDSB_R	ldsb	[%r31 + %r0], %r15
	mov 0x32, %r30
	.word 0x9bd0001e  ! 3869: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x89d02031  ! 3872: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x89d0001e  ! 3873: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8bd0001e  ! 3878: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xde07e001  ! 3879: LDUW_I	lduw	[%r31 + 0x0001], %r15
	.word 0x8fd02030  ! 3880: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xdedfe020  ! 3883: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r15
	.word 0xde5fe001  ! 3886: LDX_I	ldx	[%r31 + 0x0001], %r15
	mov 0x35, %r30
	.word 0x8bd0001e  ! 3889: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x89d02033  ! 3906: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0xde07e001  ! 3907: LDUW_I	lduw	[%r31 + 0x0001], %r15
	.word 0xde57e001  ! 3908: LDSH_I	ldsh	[%r31 + 0x0001], %r15
	.word 0xde97e000  ! 3911: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r15
	.word 0xdecfe000  ! 3916: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r15
	mov 0x34, %r30
	.word 0x8fd0001e  ! 3917: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x91a089ca  ! 3918: FDIVd	fdivd	%f2, %f10, %f8
	.word 0xd00fe001  ! 3921: LDUB_I	ldub	[%r31 + 0x0001], %r8
	.word 0x81a3c9c4  ! 3922: FDIVd	fdivd	%f46, %f4, %f0
	.word 0x93d02035  ! 3929: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x87802054  ! 3940: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x89508000  ! 3957: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xc817c000  ! 3958: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0xc807e001  ! 3959: LDUW_I	lduw	[%r31 + 0x0001], %r4
	mov 0x35, %r30
	.word 0x91d0001e  ! 3960: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x81d02035  ! 3962: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0xc8c7e010  ! 3963: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
	.word 0xc88fe030  ! 3966: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0xc88004a0  ! 3971: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r4
	mov 0x35, %r30
	.word 0x93d0001e  ! 3972: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8bd02030  ! 3975: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0xc88004a0  ! 3978: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r4
	.word 0xc8d7e010  ! 3979: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r4
	mov 0x30, %r30
	.word 0x89d0001e  ! 3980: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e020  ! 3983: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc857e001  ! 3984: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x93d02034  ! 3985: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x88686001  ! 3986: UDIVX_I	udivx 	%r1, 0x0001, %r4
	.word 0x8479400a  ! 3987: SDIV_R	sdiv 	%r5, %r10, %r2
	.word 0x3a700001  ! 3994: BPCC	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc4dfe010  ! 4008: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r2
	.word 0xc457c000  ! 4015: LDSH_R	ldsh	[%r31 + %r0], %r2
	mov 0x35, %r30
	.word 0x93d0001e  ! 4016: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 4019: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8bd02030  ! 4020: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x9fd02035  ! 4023: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	mov 0x32, %r30
	.word 0x8dd0001e  ! 4026: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc4cfe010  ! 4027: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	.word 0xc4d7e010  ! 4036: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r2
	.word 0xc4d804a0  ! 4037: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	mov 0x30, %r30
	.word 0x81d0001e  ! 4040: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8a6b6001  ! 4043: UDIVX_I	udivx 	%r13, 0x0001, %r5
	.word 0x2c800001  ! 4044: BNEG	bneg,a	<label_0x1>
	mov 0x32, %r30
	.word 0x95d0001e  ! 4047: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 4050: BNEG	bneg,a	<label_0x1>
	.word 0xcacfe010  ! 4051: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	.word 0x34800001  ! 4052: BG	bg,a	<label_0x1>
	.word 0xca8fe000  ! 4053: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	mov 0x30, %r30
	.word 0x91d0001e  ! 4058: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2a700001  ! 4061: BPCS	<illegal instruction>
	mov 0x30, %r30
	.word 0x8dd0001e  ! 4066: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x83d0001e  ! 4067: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97508000  ! 4070: RDPR_TSTATE	rdpr	%tstate, %r11
	mov 0x31, %r30
	.word 0x8fd0001e  ! 4071: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x95d02033  ! 4074: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x93494000  ! 4083: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0xd2d004a0  ! 4088: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x9fd02031  ! 4093: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x87802016  ! 4094: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x32, %r30
	.word 0x9bd0001e  ! 4097: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x95d02034  ! 4098: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0xda786001  ! 4101: SWAP_I	swap	%r13, [%r1 + 0x0001]
	.word 0xdad7e030  ! 4108: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0x2e700001  ! 4109: BPVS	<illegal instruction>
	.word 0x9d50c000  ! 4110: RDPR_TT	rdpr	%tt, %r14
	.word 0x81d02032  ! 4111: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xdc5fe001  ! 4112: LDX_I	ldx	[%r31 + 0x0001], %r14
	mov 0x30, %r30
	.word 0x99d0001e  ! 4119: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 4126: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99d02033  ! 4131: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	mov 0x31, %r30
	.word 0x85d0001e  ! 4132: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 4133: BCS	bcs,a	<label_0x1>
	.word 0xdc97e000  ! 4136: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r14
	.word 0x93d02034  ! 4137: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x91d02032  ! 4138: Tcc_I	ta	icc_or_xcc, %r0 + 50
	mov 0x34, %r30
	.word 0x8fd0001e  ! 4139: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xdc8004a0  ! 4142: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r14
	.word 0xdcc804a0  ! 4145: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	.word 0x89d02033  ! 4154: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	mov 0x32, %r30
	.word 0x85d0001e  ! 4159: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x964b6001  ! 4168: MULX_I	mulx 	%r13, 0x0001, %r11
	.word 0x99d02032  ! 4169: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	mov 0x31, %r30
	.word 0x9dd0001e  ! 4172: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x93480000  ! 4173: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	mov 0x30, %r30
	.word 0x9fd0001e  ! 4176: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x96794003  ! 4179: SDIV_R	sdiv 	%r5, %r3, %r11
	.word 0x20700001  ! 4184: BPN	<illegal instruction>
	.word 0x824b6001  ! 4189: MULX_I	mulx 	%r13, 0x0001, %r1
	.word 0xc2cfe010  ! 4196: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r1
	.word 0xc287e020  ! 4199: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r1
	.word 0xc257c000  ! 4200: LDSH_R	ldsh	[%r31 + %r0], %r1
	mov 0x34, %r30
	.word 0x8fd0001e  ! 4211: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc24fc000  ! 4212: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0x87802014  ! 4215: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc2d7e010  ! 4216: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	mov 0x32, %r30
	.word 0x91d0001e  ! 4219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 4220: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8e530000  ! 4223: UMUL_R	umul 	%r12, %r0, %r7
	.word 0xce5fc000  ! 4224: LDX_R	ldx	[%r31 + %r0], %r7
	mov 0x33, %r30
	.word 0x81d0001e  ! 4239: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xce4fe001  ! 4253: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0x8879e001  ! 4254: SDIV_I	sdiv 	%r7, 0x0001, %r4
	.word 0x95d02034  ! 4255: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x9dd02032  ! 4256: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x20700001  ! 4259: BPN	<illegal instruction>
	.word 0x9853400c  ! 4260: UMUL_R	umul 	%r13, %r12, %r12
	.word 0x8fd02031  ! 4263: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	mov 0x31, %r30
	.word 0x8fd0001e  ! 4266: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xd8d80e40  ! 4267: LDXA_R	ldxa	[%r0, %r0] 0x72, %r12
	.word 0x28700001  ! 4270: BPLEU	<illegal instruction>
	.word 0xd84fc000  ! 4275: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x3c800001  ! 4280: BPOS	bpos,a	<label_0x1>
	.word 0x30700001  ! 4281: BPA	<illegal instruction>
	.word 0xd857c000  ! 4282: LDSH_R	ldsh	[%r31 + %r0], %r12
	mov 0x34, %r30
	.word 0x95d0001e  ! 4283: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e000  ! 4284: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x26700001  ! 4285: BPL	<illegal instruction>
	mov 0x35, %r30
	.word 0x8bd0001e  ! 4286: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd807e001  ! 4287: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd847e001  ! 4288: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0x87802014  ! 4305: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd897e010  ! 4306: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x984ae001  ! 4307: MULX_I	mulx 	%r11, 0x0001, %r12
	mov 0x31, %r30
	.word 0x95d0001e  ! 4308: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x9d514000  ! 4309: RDPR_TBA	rdpr	%tba, %r14
	.word 0x9a7b8005  ! 4312: SDIV_R	sdiv 	%r14, %r5, %r13
	.word 0xd0fa4028  ! 4313: SWAPA_R	swapa	%r8, [%r9 + %r8] 0x01
	.word 0x9fd02030  ! 4314: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0xd0cfe010  ! 4317: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	.word 0xd0cfe030  ! 4318: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
	.word 0xd0d7e010  ! 4319: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	.word 0x3a800001  ! 4326: BCC	bcc,a	<label_0x1>
	.word 0xd08fe000  ! 4331: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0x81d02035  ! 4332: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x9ed84009  ! 4337: SMULcc_R	smulcc 	%r1, %r9, %r15
	.word 0x8b508000  ! 4338: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x8fd02033  ! 4341: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x847ba001  ! 4342: SDIV_I	sdiv 	%r14, 0x0001, %r2
	.word 0xc497e010  ! 4345: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r2
	.word 0xc4d7e030  ! 4346: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0x87802045  ! 4347: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x26700001  ! 4350: BPL	<illegal instruction>
	.word 0x36800001  ! 4353: BGE	bge,a	<label_0x1>
	.word 0x87802016  ! 4354: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xc4900e60  ! 4356: LDUHA_R	lduha	[%r0, %r0] 0x73, %r2
	.word 0x867b8006  ! 4363: SDIV_R	sdiv 	%r14, %r6, %r3
	.word 0xc6d7e030  ! 4364: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r3
	.word 0xc6cfe030  ! 4367: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r3
	.word 0x99a2c9ad  ! 4370: FDIVs	fdivs	%f11, %f13, %f12
	.word 0x87802054  ! 4373: WRASI_I	wr	%r0, 0x0054, %asi
	mov 0x30, %r30
	.word 0x93d0001e  ! 4378: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd88fe020  ! 4383: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
	.word 0x32800001  ! 4386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 4389: BG	bg,a	<label_0x1>
	.word 0xd897e020  ! 4390: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x24800001  ! 4391: BLE	ble,a	<label_0x1>
	.word 0x966a4000  ! 4400: UDIVX_R	udivx 	%r9, %r0, %r11
	.word 0x9268e001  ! 4401: UDIVX_I	udivx 	%r3, 0x0001, %r9
	.word 0x99d02031  ! 4402: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x9f514000  ! 4403: RDPR_TBA	rdpr	%tba, %r15
	.word 0x36800001  ! 4404: BGE	bge,a	<label_0x1>
	mov 0x34, %r30
	.word 0x8dd0001e  ! 4409: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xded804a0  ! 4412: LDXA_R	ldxa	[%r0, %r0] 0x25, %r15
	mov 0x30, %r30
	.word 0x99d0001e  ! 4413: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xde07c000  ! 4414: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0x83d02034  ! 4417: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9551c000  ! 4424: RDPR_TL	rdpr	%tl, %r10
	.word 0x9fa1c9c0  ! 4427: FDIVd	fdivd	%f38, %f0, %f46
	.word 0xdecfe020  ! 4430: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0xde5fe001  ! 4431: LDX_I	ldx	[%r31 + 0x0001], %r15
	.word 0x846a0005  ! 4438: UDIVX_R	udivx 	%r8, %r5, %r2
	.word 0x97d02031  ! 4441: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x87802016  ! 4444: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x32700001  ! 4450: BPNE	<illegal instruction>
	.word 0x87802010  ! 4457: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc4c7e030  ! 4458: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	mov 0x30, %r30
	.word 0x8bd0001e  ! 4459: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x8bd0001e  ! 4460: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 4467: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02033  ! 4468: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc40fc000  ! 4471: LDUB_R	ldub	[%r31 + %r0], %r2
	mov 0x30, %r30
	.word 0x87d0001e  ! 4476: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9cc06001  ! 4477: ADDCcc_I	addccc 	%r1, 0x0001, %r14
	.word 0x81d02035  ! 4478: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x87802014  ! 4479: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xdc0fc000  ! 4482: LDUB_R	ldub	[%r31 + %r0], %r14
	.word 0xdc07e001  ! 4483: LDUW_I	lduw	[%r31 + 0x0001], %r14
	.word 0x34800001  ! 4488: BG	bg,a	<label_0x1>
	mov 0x33, %r30
	.word 0x97d0001e  ! 4493: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x98c2a001  ! 4494: ADDCcc_I	addccc 	%r10, 0x0001, %r12
	.word 0x2e700001  ! 4495: BPVS	<illegal instruction>
	.word 0x9d508000  ! 4496: RDPR_TSTATE	rdpr	%tstate, %r14
	.word 0xdcdfe010  ! 4497: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r14
	.word 0x9d51c000  ! 4498: RDPR_TL	rdpr	%tl, %r14
	mov 0x34, %r30
	.word 0x8bd0001e  ! 4499: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x9ada4001  ! 4500: SMULcc_R	smulcc 	%r9, %r1, %r13
	.word 0x964ac005  ! 4501: MULX_R	mulx 	%r11, %r5, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdaf9002c  ! 4515: SWAPA_R	swapa	%r13, [%r4 + %r12] 0x01
	.word 0x87802004  ! 4518: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xda57c000  ! 4521: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x38800001  ! 4522: BGU	bgu,a	<label_0x1>
	.word 0x22700001  ! 4527: BPE	<illegal instruction>
	.word 0xdadfe000  ! 4528: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	mov 0x30, %r30
	.word 0x9fd0001e  ! 4529: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802014  ! 4531: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x85d02033  ! 4534: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x9278a001  ! 4535: SDIV_I	sdiv 	%r2, 0x0001, %r9
	.word 0xd297e000  ! 4540: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0xd2c7e010  ! 4541: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
	.word 0x9dd02033  ! 4548: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0xd2cfe010  ! 4549: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x8d500000  ! 4552: RDPR_TPC	rdpr	%tpc, %r6
	.word 0xcc8804a0  ! 4555: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0x8bd02034  ! 4556: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x8fa249ca  ! 4557: FDIVd	fdivd	%f40, %f10, %f38
	.word 0x99d02033  ! 4560: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x30800001  ! 4561: BA	ba,a	<label_0x1>
	mov 0x30, %r30
	.word 0x89d0001e  ! 4562: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 4565: BE	be,a	<label_0x1>
	.word 0xcedfe030  ! 4566: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	mov 0x34, %r30
	.word 0x83d0001e  ! 4569: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x9dd0001e  ! 4574: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xced004a0  ! 4577: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0xdde0402e  ! 4578: CASA_I	casa	[%r1] 0x 1, %r14, %r14
	.word 0xdc57e001  ! 4589: LDSH_I	ldsh	[%r31 + 0x0001], %r14
	.word 0x8fd02035  ! 4590: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x996b2001  ! 4597: SDIVX_I	sdivx	%r12, 0x0001, %r12
	.word 0x84036001  ! 4606: ADD_I	add 	%r13, 0x0001, %r2
	.word 0xc4c7e020  ! 4607: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0xc40fe001  ! 4608: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0x9651000e  ! 4609: UMUL_R	umul 	%r4, %r14, %r11
	.word 0xd657c000  ! 4610: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x83d02034  ! 4617: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802054  ! 4618: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x8dd02030  ! 4621: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x8ba249cf  ! 4622: FDIVd	fdivd	%f40, %f46, %f36
	mov 0x30, %r30
	.word 0x97d0001e  ! 4623: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x91d0001e  ! 4626: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca0fe001  ! 4627: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0xcac004a0  ! 4630: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0xca57e001  ! 4631: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0x9dd02032  ! 4634: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x8668000b  ! 4641: UDIVX_R	udivx 	%r0, %r11, %r3
	.word 0x2e800001  ! 4646: BVS	bvs,a	<label_0x1>
	mov 0x33, %r30
	.word 0x99d0001e  ! 4647: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 4648: BPGE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x28800001  ! 4652: BLEU	bleu,a	<label_0x1>
	.word 0x9fd02035  ! 4653: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xc6d80e60  ! 4656: LDXA_R	ldxa	[%r0, %r0] 0x73, %r3
	.word 0xc6c00e60  ! 4657: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r3
	.word 0x87d02034  ! 4658: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x8479800d  ! 4659: SDIV_R	sdiv 	%r6, %r13, %r2
	.word 0x91d02035  ! 4668: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc4900e40  ! 4669: LDUHA_R	lduha	[%r0, %r0] 0x72, %r2
	.word 0x87802014  ! 4672: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x36700001  ! 4673: BPGE	<illegal instruction>
	.word 0x3e700001  ! 4680: BPVC	<illegal instruction>
	mov 0x32, %r30
	.word 0x89d0001e  ! 4683: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 4698: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x95494000  ! 4705: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0xd4cfe030  ! 4708: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0xd417e001  ! 4709: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0xd40fe001  ! 4714: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x3e700001  ! 4715: BPVC	<illegal instruction>
	.word 0x2e700001  ! 4718: BPVS	<illegal instruction>
	.word 0x22800001  ! 4721: BE	be,a	<label_0x1>
	mov 0x35, %r30
	.word 0x81d0001e  ! 4724: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4725: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd4dfe030  ! 4726: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x2a700001  ! 4729: BPCS	<illegal instruction>
	.word 0x32700001  ! 4730: BPNE	<illegal instruction>
	.word 0x26700001  ! 4731: BPL	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x8bd0001e  ! 4733: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8ba089e5  ! 4734: FDIVq	dis not found

	mov 0x35, %r30
	.word 0x97d0001e  ! 4735: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xca87e030  ! 4736: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r5
	.word 0xca0fe001  ! 4745: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0xca8fe030  ! 4758: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	mov 0x30, %r30
	.word 0x95d0001e  ! 4763: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xca0fe001  ! 4764: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0xca47c000  ! 4767: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0xca0fe001  ! 4772: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0xca57e001  ! 4775: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0xcacfe010  ! 4776: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	.word 0x22800001  ! 4785: BE	be,a	<label_0x1>
	.word 0x2a700001  ! 4786: BPCS	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x2e800001  ! 4790: BVS	bvs,a	<label_0x1>
	.word 0x99d02032  ! 4791: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0xca47e001  ! 4792: LDSW_I	ldsw	[%r31 + 0x0001], %r5
	.word 0x87d02031  ! 4793: Tcc_I	tl	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4794: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xcac7e010  ! 4795: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x96d16001  ! 4796: UMULcc_I	umulcc 	%r5, 0x0001, %r11
	.word 0xd687e030  ! 4803: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r11
	.word 0xd64fc000  ! 4806: LDSB_R	ldsb	[%r31 + %r0], %r11
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd68fe010  ! 4810: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0xd6c7e010  ! 4811: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0xd647c000  ! 4812: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0x24700001  ! 4813: BPLE	<illegal instruction>
	.word 0x30700001  ! 4816: BPA	<illegal instruction>
	mov 0x34, %r30
	.word 0x81d0001e  ! 4817: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8f514000  ! 4818: RDPR_TBA	rdpr	%tba, %r7
	.word 0x87802004  ! 4819: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802054  ! 4826: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x36800001  ! 4827: BGE	bge,a	<label_0x1>
	.word 0xce57e001  ! 4830: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x87802004  ! 4831: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcec7e000  ! 4832: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
	.word 0x9a7a2001  ! 4835: SDIV_I	sdiv 	%r8, 0x0001, %r13
	.word 0xc5e2c029  ! 4838: CASA_I	casa	[%r11] 0x 1, %r9, %r2
	.word 0x947be001  ! 4841: SDIV_I	sdiv 	%r15, 0x0001, %r10
	.word 0x87d02031  ! 4850: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x8b508000  ! 4857: RDPR_TSTATE	rdpr	%tstate, %r5
	mov 0x34, %r30
	.word 0x91d0001e  ! 4864: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 4865: BPN	<illegal instruction>
	mov 0x33, %r30
	.word 0x8dd0001e  ! 4870: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xcadfe020  ! 4871: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802054  ! 4882: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xca07e001  ! 4887: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x81d02031  ! 4888: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0x20800001  ! 4893: BN	bn,a	<label_0x1>
	.word 0xcad7e030  ! 4894: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0xca4fc000  ! 4897: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0xca0fc000  ! 4902: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0x9c68c008  ! 4907: UDIVX_R	udivx 	%r3, %r8, %r14
	.word 0xdc4fc000  ! 4908: LDSB_R	ldsb	[%r31 + %r0], %r14
	.word 0x8bd02034  ! 4917: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0xdc87e010  ! 4920: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r14
	.word 0xd7e0c022  ! 4921: CASA_I	casa	[%r3] 0x 1, %r2, %r11
	mov 0x34, %r30
	.word 0x8dd0001e  ! 4922: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x89d0001e  ! 4923: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x96c3a001  ! 4924: ADDCcc_I	addccc 	%r14, 0x0001, %r11
	.word 0xd647e001  ! 4927: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x2a800001  ! 4934: BCS	bcs,a	<label_0x1>
	.word 0xd6dfe030  ! 4937: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0xd617e001  ! 4942: LDUH_I	lduh	[%r31 + 0x0001], %r11
	mov 0x34, %r30
	.word 0x85d0001e  ! 4945: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x95d0001e  ! 4946: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xd6d004a0  ! 4954: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x32800001  ! 4955: BNE	bne,a	<label_0x1>
	.word 0xd607e001  ! 4956: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd6d7e020  ! 4957: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0xd607c000  ! 4958: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x22700001  ! 4959: BPE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd607e001  ! 4965: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x3a800001  ! 4968: BCC	bcc,a	<label_0x1>
	.word 0xd617e001  ! 4971: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0xd6900e60  ! 4972: LDUHA_R	lduha	[%r0, %r0] 0x73, %r11
	.word 0x87802054  ! 4973: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xd6d7e000  ! 4982: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x86002001  ! 4985: ADD_I	add 	%r0, 0x0001, %r3
	.word 0xc65fc000  ! 4986: LDX_R	ldx	[%r31 + %r0], %r3
	mov 0x30, %r30
	.word 0x85d0001e  ! 4987: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x2e700001  ! 4990: BPVS	<illegal instruction>
	.word 0x38800001  ! 4991: BGU	bgu,a	<label_0x1>
	.word 0x84826001  ! 4996: ADDcc_I	addcc 	%r9, 0x0001, %r2
	.word 0x32800001  ! 4999: BNE	bne,a	<label_0x1>
	.word 0x8bd02032  ! 5000: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x3e800001  ! 5001: BVC	bvc,a	<label_0x1>
	.word 0x856ac005  ! 5008: SDIVX_R	sdivx	%r11, %r5, %r2
	mov 0x35, %r30
	.word 0x95d0001e  ! 5009: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc417c000  ! 5021: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x8a4a6001  ! 5022: MULX_I	mulx 	%r9, 0x0001, %r5
	.word 0xc6f98021  ! 5025: SWAPA_R	swapa	%r3, [%r6 + %r1] 0x01
	.word 0xc687e010  ! 5028: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r3
	.word 0xc647c000  ! 5031: LDSW_R	ldsw	[%r31 + %r0], %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02034  ! 5037: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc65fe001  ! 5044: LDX_I	ldx	[%r31 + 0x0001], %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc65fc000  ! 5048: LDX_R	ldx	[%r31 + %r0], %r3
	mov 0x35, %r30
	.word 0x83d0001e  ! 5049: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8bd02035  ! 5050: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x32800001  ! 5057: BNE	bne,a	<label_0x1>
	.word 0xc64fc000  ! 5070: LDSB_R	ldsb	[%r31 + %r0], %r3
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x30, %r30
	.word 0x89d0001e  ! 5076: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc68fe030  ! 5077: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	mov 0x31, %r30
	.word 0x93d0001e  ! 5078: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc6dfe000  ! 5081: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r3
	.word 0x9f51c000  ! 5082: RDPR_TL	rdpr	%tl, %r15
	.word 0xde47e001  ! 5083: LDSW_I	ldsw	[%r31 + 0x0001], %r15
	.word 0x9fd02032  ! 5084: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0xde17c000  ! 5085: LDUH_R	lduh	[%r31 + %r0], %r15
	.word 0x22700001  ! 5092: BPE	<illegal instruction>
	.word 0xde97e030  ! 5093: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r15
	mov 0x33, %r30
	.word 0x97d0001e  ! 5094: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 5097: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xde8fe010  ! 5098: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r15
	.word 0xde07c000  ! 5099: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0xded80e80  ! 5108: LDXA_R	ldxa	[%r0, %r0] 0x74, %r15
	.word 0x28700001  ! 5109: BPLEU	<illegal instruction>
	.word 0xde47c000  ! 5116: LDSW_R	ldsw	[%r31 + %r0], %r15
	mov 0x33, %r30
	.word 0x8bd0001e  ! 5119: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9fd02034  ! 5123: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0xcefac027  ! 5124: SWAPA_R	swapa	%r7, [%r11 + %r7] 0x01
	.word 0xced80e80  ! 5129: LDXA_R	ldxa	[%r0, %r0] 0x74, %r7
	mov 0x32, %r30
	.word 0x95d0001e  ! 5132: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xce5fe001  ! 5135: LDX_I	ldx	[%r31 + 0x0001], %r7
	.word 0xcecfe030  ! 5136: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r7
	mov 0x35, %r30
	.word 0x9dd0001e  ! 5143: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xcedfe020  ! 5148: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0xced7e000  ! 5150: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
	.word 0xcec004a0  ! 5155: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xce8fe010  ! 5166: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
	.word 0xce17c000  ! 5171: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x34800001  ! 5174: BG	bg,a	<label_0x1>
	.word 0xced804a0  ! 5175: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9679e001  ! 5189: SDIV_I	sdiv 	%r7, 0x0001, %r11
	.word 0x30800001  ! 5190: BA	ba,a	<label_0x1>
	.word 0x9b500000  ! 5191: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xdad7e010  ! 5192: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0xdad7e020  ! 5193: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0x9f500000  ! 5194: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x81a149a4  ! 5195: FDIVs	fdivs	%f5, %f4, %f0
	.word 0xc097e000  ! 5196: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r0
	.word 0x8bd02032  ! 5197: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0xc04fc000  ! 5200: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x3c800001  ! 5203: BPOS	bpos,a	<label_0x1>
	mov 0x30, %r30
	.word 0x9fd0001e  ! 5204: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81d02034  ! 5211: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0x87802045  ! 5212: WRASI_I	wr	%r0, 0x0045, %asi
	mov 0x35, %r30
	.word 0x8dd0001e  ! 5213: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc08004a0  ! 5214: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r0
	.word 0xc08804a0  ! 5221: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x95514000  ! 5222: RDPR_TBA	rdpr	%tba, %r10
	.word 0x8a488008  ! 5225: MULX_R	mulx 	%r2, %r8, %r5
	mov 0x35, %r30
	.word 0x83d0001e  ! 5226: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x3a800001  ! 5227: BCC	bcc,a	<label_0x1>
	mov 0x30, %r30
	.word 0x8bd0001e  ! 5228: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81504000  ! 5233: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x9fd02032  ! 5236: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0xc04fe001  ! 5239: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0x8a51800d  ! 5246: UMUL_R	umul 	%r6, %r13, %r5
	.word 0xca97e030  ! 5251: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r5
	.word 0x926b2001  ! 5254: UDIVX_I	udivx 	%r12, 0x0001, %r9
	.word 0xdc78a001  ! 5255: SWAP_I	swap	%r14, [%r2 + 0x0001]
	mov 0x30, %r30
	.word 0x85d0001e  ! 5258: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x9c00e001  ! 5259: ADD_I	add 	%r3, 0x0001, %r14
	.word 0x8c48000a  ! 5260: MULX_R	mulx 	%r0, %r10, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85d02031  ! 5270: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x9483a001  ! 5281: ADDcc_I	addcc 	%r14, 0x0001, %r10
	.word 0xd4cfe020  ! 5282: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
	.word 0xd497e020  ! 5283: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0x8bd02034  ! 5286: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0xd44fc000  ! 5287: LDSB_R	ldsb	[%r31 + %r0], %r10
	mov 0x33, %r30
	.word 0x95d0001e  ! 5288: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e010  ! 5291: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0xd457c000  ! 5294: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0x28800001  ! 5295: BLEU	bleu,a	<label_0x1>
	mov 0x34, %r30
	.word 0x83d0001e  ! 5298: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x89d02030  ! 5299: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x2a700001  ! 5301: BPCS	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	mov 0x31, %r30
	.word 0x81d0001e  ! 5303: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9b690005  ! 5308: SDIVX_R	sdivx	%r4, %r5, %r13
	.word 0xda0fc000  ! 5309: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0xdac7e020  ! 5314: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0x8a4a2001  ! 5317: MULX_I	mulx 	%r8, 0x0001, %r5
	.word 0x2e800001  ! 5318: BVS	bvs,a	<label_0x1>
	.word 0xca47c000  ! 5321: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0xca07e001  ! 5324: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x81d02035  ! 5325: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x97d02035  ! 5326: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0xca4fe001  ! 5329: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0x3e800001  ! 5330: BVC	bvc,a	<label_0x1>
	.word 0x81d02030  ! 5335: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x87802010  ! 5340: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xca5fe001  ! 5343: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x87802045  ! 5348: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x87802004  ! 5357: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802010  ! 5364: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93d02034  ! 5371: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xcacfe020  ! 5374: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0x8dd02032  ! 5377: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0xca8fe020  ! 5382: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x9d514000  ! 5383: RDPR_TBA	rdpr	%tba, %r14
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x30, %r30
	.word 0x8bd0001e  ! 5394: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xdc57c000  ! 5397: LDSH_R	ldsh	[%r31 + %r0], %r14
	.word 0xdc17e001  ! 5398: LDUH_I	lduh	[%r31 + 0x0001], %r14
	.word 0x87802004  ! 5411: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdc800e40  ! 5412: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r14
	.word 0x89d02031  ! 5415: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0x99d02032  ! 5416: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0x99d02033  ! 5423: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xdc5fe001  ! 5426: LDX_I	ldx	[%r31 + 0x0001], %r14
	.word 0x83d02033  ! 5433: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xdc47c000  ! 5436: LDSW_R	ldsw	[%r31 + %r0], %r14
	.word 0xdc5fe001  ! 5437: LDX_I	ldx	[%r31 + 0x0001], %r14
	.word 0xdc8fe020  ! 5440: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r14
	.word 0x92d9800c  ! 5443: SMULcc_R	smulcc 	%r6, %r12, %r9
	.word 0x8bd02030  ! 5446: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8fd02032  ! 5449: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0xd217c000  ! 5454: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x3e800001  ! 5457: BVC	bvc,a	<label_0x1>
	.word 0x9882e001  ! 5458: ADDcc_I	addcc 	%r11, 0x0001, %r12
	.word 0x97d02030  ! 5461: Tcc_I	tge	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95d02034  ! 5465: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0xd84fc000  ! 5468: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x9281c00b  ! 5469: ADDcc_R	addcc 	%r7, %r11, %r9
	.word 0x30700001  ! 5472: BPA	<illegal instruction>
	.word 0xd25fe001  ! 5477: LDX_I	ldx	[%r31 + 0x0001], %r9
	.word 0x20800001  ! 5480: BN	bn,a	<label_0x1>
	mov 0x33, %r30
	.word 0x97d0001e  ! 5483: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x97d02031  ! 5486: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x9e80e001  ! 5493: ADDcc_I	addcc 	%r3, 0x0001, %r15
	.word 0x89494000  ! 5502: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0xc84fe001  ! 5511: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8cfe030  ! 5516: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r4
	.word 0x99d02033  ! 5517: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 5518: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x33, %r30
	.word 0x91d0001e  ! 5521: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 5522: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc857c000  ! 5523: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0xc807e001  ! 5524: LDUW_I	lduw	[%r31 + 0x0001], %r4
	mov 0x31, %r30
	.word 0x85d0001e  ! 5529: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc887e030  ! 5532: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r4
	mov 0x34, %r30
	.word 0x81d0001e  ! 5533: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 5534: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x856be001  ! 5548: SDIVX_I	sdivx	%r15, 0x0001, %r2
	.word 0xc497e010  ! 5549: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r2
	.word 0xc457e001  ! 5568: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0xc44fc000  ! 5575: LDSB_R	ldsb	[%r31 + %r0], %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4dfe030  ! 5579: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0x87802010  ! 5588: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x32, %r30
	.word 0x95d0001e  ! 5589: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8fd02031  ! 5590: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xd3e1c024  ! 5591: CASA_I	casa	[%r7] 0x 1, %r4, %r9
	.word 0x28800001  ! 5598: BLEU	bleu,a	<label_0x1>
	.word 0x2a800001  ! 5603: BCS	bcs,a	<label_0x1>
	.word 0x8448e001  ! 5608: MULX_I	mulx 	%r3, 0x0001, %r2
	.word 0xc407e001  ! 5609: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc48804a0  ! 5612: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc447c000  ! 5615: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x85d02034  ! 5620: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0xc407e001  ! 5623: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc48004a0  ! 5630: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r2
	.word 0xc407c000  ! 5631: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x9e026001  ! 5632: ADD_I	add 	%r9, 0x0001, %r15
	.word 0x87802004  ! 5637: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xde07c000  ! 5638: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0x87802014  ! 5643: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x33, %r30
	.word 0x91d0001e  ! 5644: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x92d0a001  ! 5651: UMULcc_I	umulcc 	%r2, 0x0001, %r9
	.word 0x20700001  ! 5652: BPN	<illegal instruction>
	.word 0x8e53c00f  ! 5655: UMUL_R	umul 	%r15, %r15, %r7
	.word 0xce57c000  ! 5656: LDSH_R	ldsh	[%r31 + %r0], %r7
	.word 0x3e800001  ! 5659: BVC	bvc,a	<label_0x1>
	.word 0xce07e001  ! 5660: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x24800001  ! 5661: BLE	ble,a	<label_0x1>
	.word 0xcec7e030  ! 5664: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
	.word 0xce17c000  ! 5665: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x85504000  ! 5666: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x87802054  ! 5671: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xc4900e60  ! 5676: LDUHA_R	lduha	[%r0, %r0] 0x73, %r2
	.word 0xc4cfe000  ! 5677: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0x30800001  ! 5680: BA	ba,a	<label_0x1>
	.word 0x87802004  ! 5681: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc407c000  ! 5682: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x3e700001  ! 5683: BPVC	<illegal instruction>
	.word 0x80d0e001  ! 5690: UMULcc_I	umulcc 	%r3, 0x0001, %r0
	.word 0xc017c000  ! 5691: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xdcfb8029  ! 5694: SWAPA_R	swapa	%r14, [%r14 + %r9] 0x01
	.word 0x87802016  ! 5695: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xdc87e010  ! 5696: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r14
	.word 0xdccfe010  ! 5701: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r14
	.word 0x24700001  ! 5706: BPLE	<illegal instruction>
	.word 0x8e016001  ! 5709: ADD_I	add 	%r5, 0x0001, %r7
	.word 0x87d02030  ! 5714: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x20800001  ! 5715: BN	bn,a	<label_0x1>
	.word 0x93d02030  ! 5716: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xced7e010  ! 5717: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
	.word 0xce0fc000  ! 5726: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0x97508000  ! 5731: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x87802054  ! 5732: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x9ad12001  ! 5735: UMULcc_I	umulcc 	%r4, 0x0001, %r13
	.word 0x3a800001  ! 5736: BCC	bcc,a	<label_0x1>
	.word 0xda47c000  ! 5737: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0xda800e40  ! 5742: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r13
	mov 0x35, %r30
	.word 0x97d0001e  ! 5743: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87d02032  ! 5744: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x93d02034  ! 5745: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 5746: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8bd02033  ! 5747: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0xda5fe001  ! 5752: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0x87802016  ! 5753: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x2c700001  ! 5754: BPNEG	<illegal instruction>
	mov 0x33, %r30
	.word 0x95d0001e  ! 5755: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xda5fc000  ! 5756: LDX_R	ldx	[%r31 + %r0], %r13
	mov 0x33, %r30
	.word 0x9dd0001e  ! 5757: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xda57e001  ! 5760: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0xdad7e020  ! 5761: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0xda0fe001  ! 5762: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0x87802004  ! 5765: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x36800001  ! 5766: BGE	bge,a	<label_0x1>
	.word 0x8dd02031  ! 5769: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x87802016  ! 5770: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xda87e030  ! 5783: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r13
	.word 0x8b508000  ! 5784: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x91d02034  ! 5785: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9000a001  ! 5786: ADD_I	add 	%r2, 0x0001, %r8
	.word 0xc5e34024  ! 5787: CASA_I	casa	[%r13] 0x 1, %r4, %r2
	.word 0xc497e030  ! 5790: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r2
	.word 0xc4d00e60  ! 5791: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r2
	.word 0xc457c000  ! 5792: LDSH_R	ldsh	[%r31 + %r0], %r2
	.word 0xc4c7e000  ! 5799: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0x88c12001  ! 5804: ADDCcc_I	addccc 	%r4, 0x0001, %r4
	.word 0xc8cfe010  ! 5805: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0xc8d7e030  ! 5806: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x92d1c008  ! 5810: UMULcc_R	umulcc 	%r7, %r8, %r9
	.word 0x87802004  ! 5813: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd2d7e010  ! 5817: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
	.word 0xce7a6001  ! 5820: SWAP_I	swap	%r7, [%r9 + 0x0001]
	.word 0xcedfe000  ! 5821: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0xce8fe000  ! 5828: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r7
	.word 0x81480000  ! 5829: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x92780002  ! 5830: SDIV_R	sdiv 	%r0, %r2, %r9
	.word 0x89d02031  ! 5841: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0xd287e010  ! 5844: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r9
	.word 0xd2f80026  ! 5845: SWAPA_R	swapa	%r9, [%r0 + %r6] 0x01
	.word 0x8fd02033  ! 5848: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0xd257e001  ! 5849: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0xd207e001  ! 5850: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2d7e020  ! 5853: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r9
	.word 0x8dd02034  ! 5854: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x94816001  ! 5855: ADDcc_I	addcc 	%r5, 0x0001, %r10
	.word 0x22700001  ! 5860: BPE	<illegal instruction>
	.word 0xd40fe001  ! 5871: LDUB_I	ldub	[%r31 + 0x0001], %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x36800001  ! 5875: BGE	bge,a	<label_0x1>
	mov 0x34, %r30
	.word 0x9bd0001e  ! 5882: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd40fc000  ! 5886: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x92d84004  ! 5889: SMULcc_R	smulcc 	%r1, %r4, %r9
	.word 0xd2dfe000  ! 5890: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
	.word 0x2e800001  ! 5891: BVS	bvs,a	<label_0x1>
	.word 0x2e700001  ! 5892: BPVS	<illegal instruction>
	.word 0x9678400b  ! 5895: SDIV_R	sdiv 	%r1, %r11, %r11
	.word 0xd687e030  ! 5896: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r11
	.word 0xd6dfe010  ! 5897: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x34700001  ! 5898: BPG	<illegal instruction>
	.word 0x2a800001  ! 5899: BCS	bcs,a	<label_0x1>
	mov 0x34, %r30
	.word 0x81d0001e  ! 5902: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xd60fc000  ! 5905: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xd657c000  ! 5906: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x85500000  ! 5909: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x8fd02032  ! 5910: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0xc497e000  ! 5913: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r2
	.word 0x30800001  ! 5916: BA	ba,a	<label_0x1>
	.word 0xc45fc000  ! 5917: LDX_R	ldx	[%r31 + %r0], %r2
	mov 0x30, %r30
	.word 0x95d0001e  ! 5918: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8bd02033  ! 5919: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0xc48fe010  ! 5920: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	.word 0xd6fa8021  ! 5921: SWAPA_R	swapa	%r11, [%r10 + %r1] 0x01
	.word 0x9b50c000  ! 5922: RDPR_TT	rdpr	%tt, %r13
	.word 0xdadfe000  ! 5923: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	mov 0x33, %r30
	.word 0x8fd0001e  ! 5930: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xda5fe001  ! 5933: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0x84682001  ! 5938: UDIVX_I	udivx 	%r0, 0x0001, %r2
	mov 0x34, %r30
	.word 0x99d0001e  ! 5941: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc44fe001  ! 5947: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0xc487e020  ! 5948: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r2
	mov 0x35, %r30
	.word 0x83d0001e  ! 5949: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x89d0001e  ! 5950: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x964a0009  ! 5951: MULX_R	mulx 	%r8, %r9, %r11
	.word 0x91d02030  ! 5958: Tcc_I	ta	icc_or_xcc, %r0 + 48
	mov 0x31, %r30
	.word 0x91d0001e  ! 5959: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8fd02035  ! 5962: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x84806001  ! 5963: ADDcc_I	addcc 	%r1, 0x0001, %r2
	.word 0x83d02032  ! 5964: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x97a1c9ef  ! 5965: FDIVq	dis not found

	.word 0x87802016  ! 5968: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd64fc000  ! 5975: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0x32700001  ! 5982: BPNE	<illegal instruction>
	.word 0xd6900e60  ! 5983: LDUHA_R	lduha	[%r0, %r0] 0x73, %r11
	.word 0x9fd02035  ! 5984: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xd7e3c024  ! 5985: CASA_I	casa	[%r15] 0x 1, %r4, %r11
	.word 0x8fd02030  ! 5988: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xd64fe001  ! 5989: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd657c000  ! 5992: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x896b0009  ! 5993: SDIVX_R	sdivx	%r12, %r9, %r4
	.word 0x8a81a001  ! 5996: ADDcc_I	addcc 	%r6, 0x0001, %r5
	.word 0x26800001  ! 6005: BL	bl,a	<label_0x1>
	.word 0xca57e001  ! 6010: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0x88d08008  ! 6011: UMULcc_R	umulcc 	%r2, %r8, %r4
	mov 0x33, %r30
	.word 0x9bd0001e  ! 6012: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8d004a0  ! 6016: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	mov 0x34, %r30
	.word 0x85d0001e  ! 6017: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x9201a001  ! 6020: ADD_I	add 	%r6, 0x0001, %r9
	.word 0x87802010  ! 6023: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd28fe030  ! 6024: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0x2a800001  ! 6027: BCS	bcs,a	<label_0x1>
	.word 0xd297e030  ! 6032: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0x2e800001  ! 6033: BVS	bvs,a	<label_0x1>
	.word 0x99d02034  ! 6036: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x3a700001  ! 6037: BPCC	<illegal instruction>
	mov 0x32, %r30
	.word 0x99d0001e  ! 6038: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd2d004a0  ! 6041: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0xd25fc000  ! 6042: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x3c800001  ! 6047: BPOS	bpos,a	<label_0x1>
	.word 0x2e700001  ! 6048: BPVS	<illegal instruction>
	mov 0x30, %r30
	.word 0x8bd0001e  ! 6049: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd28804a0  ! 6050: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85d02030  ! 6054: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x84534007  ! 6055: UMUL_R	umul 	%r13, %r7, %r2
	.word 0x97d02035  ! 6056: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0xc487e010  ! 6057: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r2
	.word 0x8b508000  ! 6062: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0xca4fc000  ! 6065: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0xcacfe000  ! 6066: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	.word 0xca0fc000  ! 6069: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xcacfe030  ! 6070: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r5
	.word 0xcad7e020  ! 6071: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r5
	.word 0xda7ae001  ! 6072: SWAP_I	swap	%r13, [%r11 + 0x0001]
	.word 0x87802004  ! 6073: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x30, %r30
	.word 0x9dd0001e  ! 6074: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 6081: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x33, %r30
	.word 0x85d0001e  ! 6082: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x91d0001e  ! 6085: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86d10004  ! 6086: UMULcc_R	umulcc 	%r4, %r4, %r3
	.word 0xc68004a0  ! 6087: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r3
	mov 0x35, %r30
	.word 0x95d0001e  ! 6088: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802054  ! 6089: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x9dd02034  ! 6092: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xc6d7e000  ! 6093: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	.word 0x82d16001  ! 6096: UMULcc_I	umulcc 	%r5, 0x0001, %r1
	.word 0x87802004  ! 6101: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x3a700001  ! 6102: BPCC	<illegal instruction>
	.word 0x87802004  ! 6103: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc257c000  ! 6110: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0xc207e001  ! 6111: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x28800001  ! 6114: BLEU	bleu,a	<label_0x1>
	.word 0x20700001  ! 6115: BPN	<illegal instruction>
	.word 0xc2cfe020  ! 6116: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r1
	mov 0x30, %r30
	.word 0x83d0001e  ! 6117: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc20fc000  ! 6120: LDUB_R	ldub	[%r31 + %r0], %r1
	.word 0xc2d7e020  ! 6125: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	.word 0x97504000  ! 6128: RDPR_TNPC	rdpr	%tnpc, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x36700001  ! 6132: BPGE	<illegal instruction>
	mov 0x32, %r30
	.word 0x87d0001e  ! 6135: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x84d16001  ! 6136: UMULcc_I	umulcc 	%r5, 0x0001, %r2
	mov 0x33, %r30
	.word 0x9fd0001e  ! 6139: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc48fe010  ! 6144: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	.word 0x2a700001  ! 6145: BPCS	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x97d0001e  ! 6147: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc4d7e030  ! 6152: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0xc457e001  ! 6155: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x9878c00f  ! 6156: SDIV_R	sdiv 	%r3, %r15, %r12
	.word 0x92c1a001  ! 6167: ADDCcc_I	addccc 	%r6, 0x0001, %r9
	.word 0x9679800a  ! 6168: SDIV_R	sdiv 	%r6, %r10, %r11
	.word 0xd6dfe030  ! 6169: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0xd687e020  ! 6174: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r11
	.word 0x87802045  ! 6175: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x2c700001  ! 6178: BPNEG	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd647c000  ! 6180: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xd65fc000  ! 6181: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8da3c9c5  ! 6184: FDIVd	fdivd	%f46, %f36, %f6
	.word 0x93480000  ! 6185: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x24700001  ! 6190: BPLE	<illegal instruction>
	.word 0x89d02031  ! 6191: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0x8882c007  ! 6196: ADDcc_R	addcc 	%r11, %r7, %r4
	.word 0x2c700001  ! 6203: BPNEG	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x884ae001  ! 6211: MULX_I	mulx 	%r11, 0x0001, %r4
	.word 0x84802001  ! 6218: ADDcc_I	addcc 	%r0, 0x0001, %r2
	mov 0x34, %r30
	.word 0x99d0001e  ! 6219: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 6238: BPNE	<illegal instruction>
	.word 0xc4d80e80  ! 6243: LDXA_R	ldxa	[%r0, %r0] 0x74, %r2
	.word 0x22800001  ! 6254: BE	be,a	<label_0x1>
	mov 0x33, %r30
	.word 0x9dd0001e  ! 6259: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xc48804a0  ! 6266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc407e001  ! 6267: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x96696001  ! 6270: UDIVX_I	udivx 	%r5, 0x0001, %r11
	.word 0x9dd02035  ! 6271: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	mov 0x34, %r30
	.word 0x8bd0001e  ! 6278: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9fd0001e  ! 6279: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 6280: BPLE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81d02031  ! 6284: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0x95d02035  ! 6289: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x87d02030  ! 6292: Tcc_I	tl	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd6cfe000  ! 6296: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0x87802016  ! 6299: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd697e000  ! 6305: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0xd697e000  ! 6308: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x2c700001  ! 6309: BPNEG	<illegal instruction>
	.word 0x88da0003  ! 6312: SMULcc_R	smulcc 	%r8, %r3, %r4
	.word 0x87d02031  ! 6321: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x9682e001  ! 6326: ADDcc_I	addcc 	%r11, 0x0001, %r11
	.word 0xd6c7e030  ! 6329: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0x97d02032  ! 6330: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x95a249cf  ! 6331: FDIVd	fdivd	%f40, %f46, %f10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02034  ! 6337: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x967bc002  ! 6340: SDIV_R	sdiv 	%r15, %r2, %r11
	.word 0xd697e030  ! 6341: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
	mov 0x30, %r30
	.word 0x91d0001e  ! 6342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6dfe010  ! 6343: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x3c700001  ! 6350: BPPOS	<illegal instruction>
	.word 0xd4fa4026  ! 6351: SWAPA_R	swapa	%r10, [%r9 + %r6] 0x01
	.word 0xd4d7e000  ! 6352: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd457c000  ! 6353: LDSH_R	ldsh	[%r31 + %r0], %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0xd44fc000  ! 6357: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0xd48fe010  ! 6358: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	mov 0x34, %r30
	.word 0x9fd0001e  ! 6359: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xd44fe001  ! 6360: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x22700001  ! 6372: BPE	<illegal instruction>
	.word 0xd4d7e000  ! 6385: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd44fc000  ! 6386: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0xdcfb402b  ! 6389: SWAPA_R	swapa	%r14, [%r13 + %r11] 0x01
	.word 0xdcdfe020  ! 6390: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0xdc4fe001  ! 6391: LDSB_I	ldsb	[%r31 + 0x0001], %r14
	mov 0x32, %r30
	.word 0x8fd0001e  ! 6392: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 6393: BPLE	<illegal instruction>
	mov 0x34, %r30
	.word 0x81d0001e  ! 6394: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 6395: BLEU	bleu,a	<label_0x1>
	.word 0xdc07e001  ! 6398: LDUW_I	lduw	[%r31 + 0x0001], %r14
	.word 0x2e700001  ! 6405: BPVS	<illegal instruction>
	mov 0x35, %r30
	.word 0x85d0001e  ! 6408: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x99d0001e  ! 6409: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 6410: BN	bn,a	<label_0x1>
	mov 0x32, %r30
	.word 0x81d0001e  ! 6421: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 6424: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8dd02032  ! 6425: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x9bd02031  ! 6426: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x8e7ae001  ! 6429: SDIV_I	sdiv 	%r11, 0x0001, %r7
	.word 0x8568e001  ! 6432: SDIVX_I	sdivx	%r3, 0x0001, %r2
	.word 0x96d32001  ! 6433: UMULcc_I	umulcc 	%r12, 0x0001, %r11
	.word 0x3c700001  ! 6436: BPPOS	<illegal instruction>
	.word 0x9479c002  ! 6443: SDIV_R	sdiv 	%r7, %r2, %r10
	.word 0x3e800001  ! 6446: BVC	bvc,a	<label_0x1>
	.word 0x26800001  ! 6447: BL	bl,a	<label_0x1>
	.word 0xd4d004a0  ! 6450: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x92c36001  ! 6453: ADDCcc_I	addccc 	%r13, 0x0001, %r9
	.word 0xd28fe010  ! 6456: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0x8068c00e  ! 6457: UDIVX_R	udivx 	%r3, %r14, %r0
	.word 0x8bd02034  ! 6458: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x82786001  ! 6459: SDIV_I	sdiv 	%r1, 0x0001, %r1
	.word 0xcaf90020  ! 6462: SWAPA_R	swapa	%r5, [%r4 + %r0] 0x01
	.word 0xcadfe030  ! 6469: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	.word 0xcad7e010  ! 6470: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
	.word 0x8d480000  ! 6473: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x82c02001  ! 6480: ADDCcc_I	addccc 	%r0, 0x0001, %r1
	.word 0xc25fe001  ! 6483: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0xc2cfe030  ! 6484: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	mov 0x30, %r30
	.word 0x8dd0001e  ! 6485: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x3e700001  ! 6486: BPVC	<illegal instruction>
	.word 0x93480000  ! 6487: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xd287e030  ! 6488: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802045  ! 6494: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x36800001  ! 6499: BGE	bge,a	<label_0x1>
	.word 0x28800001  ! 6502: BLEU	bleu,a	<label_0x1>
	.word 0xd25fc000  ! 6509: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8dd02032  ! 6522: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0xd2cfe020  ! 6523: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0xd2dfe030  ! 6524: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0xd2c7e000  ! 6527: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	.word 0xd2c804a0  ! 6530: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x87802004  ! 6533: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd2880e80  ! 6534: LDUBA_R	lduba	[%r0, %r0] 0x74, %r9
	.word 0x28700001  ! 6535: BPLEU	<illegal instruction>
	mov 0x31, %r30
	.word 0x81d0001e  ! 6536: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xd20fc000  ! 6541: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0xd2d7e010  ! 6544: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
	mov 0x31, %r30
	.word 0x97d0001e  ! 6545: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xd25fe001  ! 6548: LDX_I	ldx	[%r31 + 0x0001], %r9
	.word 0x85514000  ! 6549: RDPR_TBA	rdpr	%tba, %r2
	.word 0x8dd02033  ! 6552: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0xc447c000  ! 6553: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x8fd02030  ! 6560: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xc4dfe030  ! 6561: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	mov 0x30, %r30
	.word 0x99d0001e  ! 6564: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x93514000  ! 6565: RDPR_TBA	rdpr	%tba, %r9
	.word 0xd247e001  ! 6566: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0xd25fc000  ! 6569: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd217c000  ! 6570: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0xd2c804a0  ! 6571: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0xd217e001  ! 6572: LDUH_I	lduh	[%r31 + 0x0001], %r9
	.word 0x3e700001  ! 6573: BPVC	<illegal instruction>
	mov 0x35, %r30
	.word 0x9fd0001e  ! 6576: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 6577: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcfe14020  ! 6587: CASA_I	casa	[%r5] 0x 1, %r0, %r7
	.word 0x83a1c9a8  ! 6588: FDIVs	fdivs	%f7, %f8, %f1
	.word 0xc217e001  ! 6595: LDUH_I	lduh	[%r31 + 0x0001], %r1
	mov 0x30, %r30
	.word 0x8fd0001e  ! 6596: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x87d0001e  ! 6599: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x85d02033  ! 6600: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xc2c80e40  ! 6601: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r1
	.word 0xc257c000  ! 6602: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0x82838001  ! 6605: ADDcc_R	addcc 	%r14, %r1, %r1
	.word 0xc29004a0  ! 6606: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0xc2d7e030  ! 6607: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0xc2900e60  ! 6610: LDUHA_R	lduha	[%r0, %r0] 0x73, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x95d02034  ! 6622: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x8fd02033  ! 6631: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x36700001  ! 6636: BPGE	<illegal instruction>
	.word 0xc2cfe000  ! 6637: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0xd4782001  ! 6638: SWAP_I	swap	%r10, [%r0 + 0x0001]
	.word 0x91d02031  ! 6643: Tcc_I	ta	icc_or_xcc, %r0 + 49
	mov 0x35, %r30
	.word 0x8dd0001e  ! 6644: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd417c000  ! 6647: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x9fd02035  ! 6648: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xd407e001  ! 6649: LDUW_I	lduw	[%r31 + 0x0001], %r10
	mov 0x35, %r30
	.word 0x9bd0001e  ! 6652: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x9ad3e001  ! 6653: UMULcc_I	umulcc 	%r15, 0x0001, %r13
	.word 0x93d02033  ! 6654: Tcc_I	tne	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x9bd0001e  ! 6655: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x92d34005  ! 6656: UMULcc_R	umulcc 	%r13, %r5, %r9
	.word 0x83d02033  ! 6657: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x97d02032  ! 6658: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xd217c000  ! 6659: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x28700001  ! 6664: BPLEU	<illegal instruction>
	.word 0x87802004  ! 6667: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x20700001  ! 6668: BPN	<illegal instruction>
	.word 0x9bd02031  ! 6669: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	mov 0x32, %r30
	.word 0x91d0001e  ! 6672: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d504000  ! 6673: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x95a309e9  ! 6678: FDIVq	dis not found

	.word 0x34700001  ! 6681: BPG	<illegal instruction>
	.word 0x8ad24009  ! 6686: UMULcc_R	umulcc 	%r9, %r9, %r5
	.word 0x24800001  ! 6689: BLE	ble,a	<label_0x1>
	.word 0x8fd02030  ! 6690: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xca87e030  ! 6695: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r5
	.word 0x8fd02034  ! 6698: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0xca17c000  ! 6701: LDUH_R	lduh	[%r31 + %r0], %r5
	.word 0xca0fc000  ! 6702: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xca5fe001  ! 6703: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x87802004  ! 6706: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcac7e000  ! 6707: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r5
	.word 0xca57c000  ! 6710: LDSH_R	ldsh	[%r31 + %r0], %r5
	.word 0xcacfe030  ! 6711: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r5
	.word 0xcad004a0  ! 6712: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	mov 0x35, %r30
	.word 0x81d0001e  ! 6713: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x94830001  ! 6716: ADDcc_R	addcc 	%r12, %r1, %r10
	mov 0x31, %r30
	.word 0x9bd0001e  ! 6719: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 6724: BG	bg,a	<label_0x1>
	.word 0x87802014  ! 6725: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95d02030  ! 6728: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x3e700001  ! 6729: BPVC	<illegal instruction>
	.word 0xd44fe001  ! 6736: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x9b514000  ! 6737: RDPR_TBA	rdpr	%tba, %r13
	.word 0xda07e001  ! 6738: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdadfe030  ! 6739: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x98006001  ! 6744: ADD_I	add 	%r1, 0x0001, %r12
	.word 0x91d02031  ! 6745: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9968c00b  ! 6748: SDIVX_R	sdivx	%r3, %r11, %r12
	.word 0x83514000  ! 6749: RDPR_TBA	rdpr	%tba, %r1
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc29004a0  ! 6753: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x89a149c9  ! 6754: FDIVd	fdivd	%f36, %f40, %f4
	.word 0x3e800001  ! 6755: BVC	bvc,a	<label_0x1>
	.word 0xc8c00e60  ! 6756: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x34800001  ! 6772: BG	bg,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x9d500000  ! 6774: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x9e690006  ! 6777: UDIVX_R	udivx 	%r4, %r6, %r15
	.word 0x34700001  ! 6778: BPG	<illegal instruction>
	mov 0x34, %r30
	.word 0x9dd0001e  ! 6779: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81d02031  ! 6780: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0xdec7e030  ! 6783: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r15
	.word 0x946a2001  ! 6784: UDIVX_I	udivx 	%r8, 0x0001, %r10
	mov 0x32, %r30
	.word 0x8dd0001e  ! 6785: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 6786: BGE	bge,a	<label_0x1>
	.word 0x2e700001  ! 6789: BPVS	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x22700001  ! 6794: BPE	<illegal instruction>
	.word 0x89a009a4  ! 6795: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xc88fe020  ! 6800: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	.word 0x24800001  ! 6807: BLE	ble,a	<label_0x1>
	.word 0xdbe14028  ! 6808: CASA_I	casa	[%r5] 0x 1, %r8, %r13
	mov 0x34, %r30
	.word 0x97d0001e  ! 6809: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x28700001  ! 6815: BPLEU	<illegal instruction>
	.word 0x26700001  ! 6816: BPL	<illegal instruction>
	.word 0xda87e030  ! 6819: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r13
	.word 0xda97e000  ! 6820: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0x8ad04006  ! 6821: UMULcc_R	umulcc 	%r1, %r6, %r5
	.word 0x85d02030  ! 6822: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0xca8fe000  ! 6825: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0x99514000  ! 6826: RDPR_TBA	rdpr	%tba, %r12
	.word 0xd8c7e000  ! 6831: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	.word 0xd817e001  ! 6836: LDUH_I	lduh	[%r31 + 0x0001], %r12
	.word 0xd8cfe010  ! 6845: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	mov 0x31, %r30
	.word 0x87d0001e  ! 6846: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x8fd0001e  ! 6847: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x85d02035  ! 6850: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xd8cfe020  ! 6851: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0x30800001  ! 6854: BA	ba,a	<label_0x1>
	.word 0x9a80a001  ! 6857: ADDcc_I	addcc 	%r2, 0x0001, %r13
	.word 0x22800001  ! 6858: BE	be,a	<label_0x1>
	mov 0x35, %r30
	.word 0x9fd0001e  ! 6859: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x93d0001e  ! 6860: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 6861: BCS	bcs,a	<label_0x1>
	.word 0x87802014  ! 6866: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x35, %r30
	.word 0x99d0001e  ! 6867: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xda97e030  ! 6882: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0xdac7e030  ! 6891: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	mov 0x33, %r30
	.word 0x8bd0001e  ! 6894: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 6903: BGE	bge,a	<label_0x1>
	.word 0x8fd02030  ! 6906: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x83d02035  ! 6907: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xda47e001  ! 6908: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0x2c800001  ! 6909: BNEG	bneg,a	<label_0x1>
	.word 0x9dd02035  ! 6914: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x85d02035  ! 6921: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0xda8004a0  ! 6922: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r13
	.word 0xda47e001  ! 6923: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0xda97e030  ! 6924: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	mov 0x31, %r30
	.word 0x93d0001e  ! 6925: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802045  ! 6926: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x87802004  ! 6929: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xda47e001  ! 6930: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0xda07c000  ! 6937: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x9882c00d  ! 6944: ADDcc_R	addcc 	%r11, %r13, %r12
	.word 0xd8cfe000  ! 6945: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0x32700001  ! 6946: BPNE	<illegal instruction>
	mov 0x34, %r30
	.word 0x89d0001e  ! 6947: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x87d02034  ! 6948: Tcc_I	tl	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd85fe001  ! 6954: LDX_I	ldx	[%r31 + 0x0001], %r12
	mov 0x35, %r30
	.word 0x87d0001e  ! 6955: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x97500000  ! 6956: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x9002e001  ! 6957: ADD_I	add 	%r11, 0x0001, %r8
	.word 0xd04fc000  ! 6964: LDSB_R	ldsb	[%r31 + %r0], %r8
	mov 0x30, %r30
	.word 0x91d0001e  ! 6967: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd087e000  ! 6968: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r8
	.word 0xd017c000  ! 6987: LDUH_R	lduh	[%r31 + %r0], %r8
	.word 0xd057c000  ! 6988: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x2e800001  ! 6991: BVS	bvs,a	<label_0x1>
	.word 0xda782001  ! 7002: SWAP_I	swap	%r13, [%r0 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xda17e001  ! 7020: LDUH_I	lduh	[%r31 + 0x0001], %r13
	.word 0xdac004a0  ! 7023: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x91d02035  ! 7024: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xda880e60  ! 7025: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	mov 0x35, %r30
	.word 0x81d0001e  ! 7030: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 7035: BPN	<illegal instruction>
	.word 0xda87e010  ! 7036: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81508000  ! 7040: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x9b480000  ! 7041: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	mov 0x30, %r30
	.word 0x93d0001e  ! 7042: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdacfe000  ! 7046: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	.word 0xda0fe001  ! 7051: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xdac804a0  ! 7068: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0xda0fe001  ! 7071: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0x95494000  ! 7072: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0xd2f9402b  ! 7077: SWAPA_R	swapa	%r9, [%r5 + %r11] 0x01
	.word 0xd247e001  ! 7078: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	mov 0x34, %r30
	.word 0x81d0001e  ! 7079: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x87d0001e  ! 7086: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd2dfe030  ! 7093: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0x8d6a8002  ! 7100: SDIVX_R	sdivx	%r10, %r2, %r6
	mov 0x34, %r30
	.word 0x8dd0001e  ! 7111: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xcc07c000  ! 7116: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0x8e480007  ! 7119: MULX_R	mulx 	%r0, %r7, %r7
	.word 0x884b800a  ! 7122: MULX_R	mulx 	%r14, %r10, %r4
	.word 0x2c800001  ! 7127: BNEG	bneg,a	<label_0x1>
	.word 0x87802054  ! 7132: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x81a249c9  ! 7137: FDIVd	fdivd	%f40, %f40, %f0
	.word 0xc09004a0  ! 7138: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x3c800001  ! 7139: BPOS	bpos,a	<label_0x1>
	.word 0xd47aa001  ! 7142: SWAP_I	swap	%r10, [%r10 + 0x0001]
	.word 0xd4c00e60  ! 7143: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
	mov 0x33, %r30
	.word 0x81d0001e  ! 7146: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9d6ae001  ! 7147: SDIVX_I	sdivx	%r11, 0x0001, %r14
	.word 0xdc07c000  ! 7148: LDUW_R	lduw	[%r31 + %r0], %r14
	.word 0xdcc7e030  ! 7151: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r14
	.word 0x81a189ce  ! 7152: FDIVd	fdivd	%f6, %f14, %f0
	.word 0xc05fc000  ! 7153: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc007e001  ! 7154: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x9e026001  ! 7155: ADD_I	add 	%r9, 0x0001, %r15
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdedfe020  ! 7161: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r15
	.word 0xde87e000  ! 7164: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r15
	.word 0x87d02031  ! 7169: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xdecfe000  ! 7170: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r15
	.word 0xde9004a0  ! 7171: LDUHA_R	lduha	[%r0, %r0] 0x25, %r15
	.word 0x89508000  ! 7172: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x9bd02032  ! 7177: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x87802054  ! 7182: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xc8800e60  ! 7183: LDUWA_R	lduwa	[%r0, %r0] 0x73, %r4
	.word 0xc887e030  ! 7184: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r4
	.word 0x81d02032  ! 7189: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x9dd02031  ! 7194: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x83480000  ! 7195: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	mov 0x30, %r30
	.word 0x8dd0001e  ! 7200: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x9fd02030  ! 7203: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	mov 0x30, %r30
	.word 0x87d0001e  ! 7204: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x83a289e7  ! 7207: FDIVq	dis not found

	.word 0x96d98000  ! 7212: SMULcc_R	smulcc 	%r6, %r0, %r11
	mov 0x30, %r30
	.word 0x93d0001e  ! 7215: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd6d7e030  ! 7220: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x2a800001  ! 7221: BCS	bcs,a	<label_0x1>
	.word 0xd64fe001  ! 7222: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x9b51c000  ! 7225: RDPR_TL	rdpr	%tl, %r13
	.word 0x3c800001  ! 7232: BPOS	bpos,a	<label_0x1>
	.word 0xdacfe000  ! 7235: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	.word 0xdacfe030  ! 7242: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x8a7ae001  ! 7243: SDIV_I	sdiv 	%r11, 0x0001, %r5
	.word 0xcac00e80  ! 7244: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r5
	.word 0xcad7e000  ! 7247: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0xca07c000  ! 7249: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0xcacfe020  ! 7250: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0xca97e010  ! 7251: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r5
	.word 0x816b2001  ! 7252: SDIVX_I	sdivx	%r12, 0x0001, %r0
	mov 0x30, %r30
	.word 0x81d0001e  ! 7257: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 7258: BPA	<illegal instruction>
	.word 0x81d02033  ! 7259: Tcc_I	tn	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x89d02035  ! 7263: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x87d02034  ! 7264: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0xcefa002e  ! 7269: SWAPA_R	swapa	%r7, [%r8 + %r14] 0x01
	.word 0x91d02030  ! 7274: Tcc_I	ta	icc_or_xcc, %r0 + 48
	mov 0x31, %r30
	.word 0x91d0001e  ! 7275: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x8bd0001e  ! 7276: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x89d02033  ! 7277: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x26700001  ! 7284: BPL	<illegal instruction>
	.word 0x91d02031  ! 7287: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8a7aa001  ! 7288: SDIV_I	sdiv 	%r10, 0x0001, %r5
	.word 0xca47c000  ! 7293: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x87d02031  ! 7294: Tcc_I	tl	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_PRIV	! macro
	.word 0xca97e020  ! 7298: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r5
	mov 0x31, %r30
	.word 0x81d0001e  ! 7301: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9fd0001e  ! 7304: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 7307: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xca800e40  ! 7314: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r5
	mov 0x35, %r30
	.word 0x8dd0001e  ! 7315: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x89d0001e  ! 7316: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x99d02035  ! 7317: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0x2c800001  ! 7330: BNEG	bneg,a	<label_0x1>
	.word 0x91d02031  ! 7333: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x2a700001  ! 7334: BPCS	<illegal instruction>
	.word 0x81d02034  ! 7335: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0xca0fc000  ! 7336: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xca07c000  ! 7339: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0xca5fc000  ! 7344: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xca0fe001  ! 7345: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0xcad7e020  ! 7348: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r5
	.word 0x3c800001  ! 7349: BPOS	bpos,a	<label_0x1>
	.word 0x8dd02035  ! 7360: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x8bd02030  ! 7367: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x9ed0c006  ! 7376: UMULcc_R	umulcc 	%r3, %r6, %r15
	mov 0x32, %r30
	.word 0x8dd0001e  ! 7379: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x87d0001e  ! 7380: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc4fa4021  ! 7383: SWAPA_R	swapa	%r2, [%r9 + %r1] 0x01
	.word 0x9f51c000  ! 7388: RDPR_TL	rdpr	%tl, %r15
	mov 0x33, %r30
	.word 0x89d0001e  ! 7389: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x95d0001e  ! 7392: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xde8fe020  ! 7397: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r15
	.word 0xde07c000  ! 7404: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0x30800001  ! 7405: BA	ba,a	<label_0x1>
	.word 0x8dd02030  ! 7406: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x3c700001  ! 7423: BPPOS	<illegal instruction>
	.word 0xde8fe030  ! 7424: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r15
	.word 0xdecfe020  ! 7425: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0x2a700001  ! 7428: BPCS	<illegal instruction>
	.word 0x8f480000  ! 7431: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x87802004  ! 7434: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xce47e001  ! 7435: LDSW_I	ldsw	[%r31 + 0x0001], %r7
	.word 0xce57e001  ! 7438: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0xce17c000  ! 7439: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xce87e000  ! 7442: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r7
	.word 0x36700001  ! 7443: BPGE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3c800001  ! 7453: BPOS	bpos,a	<label_0x1>
	.word 0xce0fc000  ! 7456: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0x87d02030  ! 7457: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xce4fe001  ! 7460: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0x85d02034  ! 7461: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0xce9004a0  ! 7462: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0xce57e001  ! 7465: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x886aa001  ! 7466: UDIVX_I	udivx 	%r10, 0x0001, %r4
	.word 0x82794000  ! 7467: SDIV_R	sdiv 	%r5, %r0, %r1
	.word 0x2c800001  ! 7476: BNEG	bneg,a	<label_0x1>
	.word 0x956b0008  ! 7477: SDIVX_R	sdivx	%r12, %r8, %r10
	.word 0xd4d7e030  ! 7478: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0xd487e030  ! 7479: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r10
	.word 0x83d02032  ! 7480: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8fd02034  ! 7481: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0xd45fc000  ! 7482: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd457c000  ! 7483: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0xd48fe010  ! 7486: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x99d02031  ! 7491: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0xd4800e60  ! 7492: LDUWA_R	lduwa	[%r0, %r0] 0x73, %r10
	.word 0x99d02031  ! 7493: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x8fd02031  ! 7496: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0x20700001  ! 7497: BPN	<illegal instruction>
	.word 0x93a0c9cd  ! 7498: FDIVd	fdivd	%f34, %f44, %f40
	.word 0xd247c000  ! 7499: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xd28fe010  ! 7500: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0x9a81a001  ! 7501: ADDcc_I	addcc 	%r6, 0x0001, %r13
	.word 0x87d02031  ! 7522: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x3e700001  ! 7523: BPVC	<illegal instruction>
	.word 0x97696001  ! 7524: SDIVX_I	sdivx	%r5, 0x0001, %r11
	.word 0x9d51c000  ! 7527: RDPR_TL	rdpr	%tl, %r14
	.word 0x91d02034  ! 7532: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9bd02032  ! 7539: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0xdc87e000  ! 7540: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r14
	.word 0x26700001  ! 7543: BPL	<illegal instruction>
	.word 0x95d02030  ! 7544: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x8b690008  ! 7549: SDIVX_R	sdivx	%r4, %r8, %r5
	.word 0x8f6aa001  ! 7552: SDIVX_I	sdivx	%r10, 0x0001, %r7
	.word 0xcec7e000  ! 7553: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
	.word 0x95480000  ! 7556: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x8e48e001  ! 7557: MULX_I	mulx 	%r3, 0x0001, %r7
	.word 0xce57e001  ! 7562: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x91d02035  ! 7567: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x35, %r30
	.word 0x99d0001e  ! 7570: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x99d0001e  ! 7571: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 7572: BA	ba,a	<label_0x1>
	.word 0xce57e001  ! 7573: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0xcec7e020  ! 7574: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	.word 0x24700001  ! 7575: BPLE	<illegal instruction>
	.word 0x3c700001  ! 7582: BPPOS	<illegal instruction>
	.word 0x32700001  ! 7583: BPNE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce47c000  ! 7589: LDSW_R	ldsw	[%r31 + %r0], %r7
	.word 0x89514000  ! 7592: RDPR_TBA	rdpr	%tba, %r4
	mov 0x31, %r30
	.word 0x91d0001e  ! 7597: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 7600: BVC	bvc,a	<label_0x1>
	.word 0x93d02032  ! 7609: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x9a816001  ! 7610: ADDcc_I	addcc 	%r5, 0x0001, %r13
	.word 0xda8fe010  ! 7613: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0xdac004a0  ! 7616: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x34800001  ! 7618: BG	bg,a	<label_0x1>
	.word 0x30800001  ! 7619: BA	ba,a	<label_0x1>
	.word 0x87d02035  ! 7620: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x2a700001  ! 7623: BPCS	<illegal instruction>
	.word 0x30700001  ! 7630: BPA	<illegal instruction>
	mov 0x32, %r30
	.word 0x8bd0001e  ! 7635: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xda17c000  ! 7638: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x87802010  ! 7639: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xdacfe020  ! 7642: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
	.word 0x30700001  ! 7649: BPA	<illegal instruction>
	.word 0xda07c000  ! 7654: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x82690009  ! 7655: UDIVX_R	udivx 	%r4, %r9, %r1
	.word 0x916be001  ! 7656: SDIVX_I	sdivx	%r15, 0x0001, %r8
	.word 0x9bd02032  ! 7657: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0xd0cfe010  ! 7658: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	.word 0x884b6001  ! 7659: MULX_I	mulx 	%r13, 0x0001, %r4
	.word 0x89514000  ! 7662: RDPR_TBA	rdpr	%tba, %r4
	.word 0xc8cfe000  ! 7667: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99500000  ! 7673: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x9083800a  ! 7678: ADDcc_R	addcc 	%r14, %r10, %r8
	mov 0x34, %r30
	.word 0x85d0001e  ! 7681: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 7684: BPE	<illegal instruction>
	.word 0x87802004  ! 7691: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x22800001  ! 7714: BE	be,a	<label_0x1>
	mov 0x35, %r30
	.word 0x85d0001e  ! 7717: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x86d34009  ! 7722: UMULcc_R	umulcc 	%r13, %r9, %r3
	.word 0xc6dfe010  ! 7723: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
	.word 0xc6d7e020  ! 7726: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0x9fd02032  ! 7729: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x2a700001  ! 7732: BPCS	<illegal instruction>
	.word 0xc68fe020  ! 7733: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0xc617c000  ! 7734: LDUH_R	lduh	[%r31 + %r0], %r3
	.word 0xc657e001  ! 7735: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	.word 0x9cd8c00b  ! 7738: SMULcc_R	smulcc 	%r3, %r11, %r14
	mov 0x34, %r30
	.word 0x97d0001e  ! 7739: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x26700001  ! 7741: BPL	<illegal instruction>
	.word 0x87802054  ! 7744: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xdcdfe020  ! 7745: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0x2c700001  ! 7746: BPNEG	<illegal instruction>
	.word 0x32700001  ! 7751: BPNE	<illegal instruction>
	.word 0x8750c000  ! 7772: RDPR_TT	rdpr	%tt, %r3
	.word 0x99d02034  ! 7773: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0xc6cfe020  ! 7776: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	.word 0x2a800001  ! 7777: BCS	bcs,a	<label_0x1>
	.word 0xc617e001  ! 7784: LDUH_I	lduh	[%r31 + 0x0001], %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8fd02035  ! 7792: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x89d02032  ! 7795: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0xc6d80e40  ! 7798: LDXA_R	ldxa	[%r0, %r0] 0x72, %r3
	.word 0xc657c000  ! 7801: LDSH_R	ldsh	[%r31 + %r0], %r3
	.word 0xd8f9c028  ! 7808: SWAPA_R	swapa	%r12, [%r7 + %r8] 0x01
	.word 0xd897e030  ! 7811: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x87802045  ! 7816: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x3a700001  ! 7823: BPCC	<illegal instruction>
	.word 0x85682001  ! 7824: SDIVX_I	sdivx	%r0, 0x0001, %r2
	.word 0xc447e001  ! 7825: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0x8d500000  ! 7826: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x87802004  ! 7829: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcc8804a0  ! 7830: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0x89d02032  ! 7835: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0xcc57e001  ! 7836: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0xcc8fe000  ! 7841: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
	.word 0x86da400e  ! 7844: SMULcc_R	smulcc 	%r9, %r14, %r3
	.word 0x89d02030  ! 7845: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x8f500000  ! 7858: RDPR_TPC	rdpr	%tpc, %r7
	.word 0xce5fc000  ! 7859: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x9d480000  ! 7864: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0x9a6a2001  ! 7865: UDIVX_I	udivx 	%r8, 0x0001, %r13
	.word 0x9269a001  ! 7866: UDIVX_I	udivx 	%r6, 0x0001, %r9
	.word 0xd24fc000  ! 7869: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0x20700001  ! 7870: BPN	<illegal instruction>
	mov 0x35, %r30
	.word 0x83d0001e  ! 7871: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x8dd0001e  ! 7872: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd2cfe010  ! 7873: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x916aa001  ! 7876: SDIVX_I	sdivx	%r10, 0x0001, %r8
	.word 0xd047e001  ! 7879: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x83a249e3  ! 7882: FDIVq	dis not found

	.word 0x2e800001  ! 7885: BVS	bvs,a	<label_0x1>
	.word 0xc2c804a0  ! 7888: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0xc207c000  ! 7889: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0x99d02031  ! 7890: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0xc207c000  ! 7893: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0xc28fe020  ! 7896: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r1
	.word 0xc287e020  ! 7897: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r1
	.word 0xd47b2001  ! 7898: SWAP_I	swap	%r10, [%r12 + 0x0001]
	.word 0x87802004  ! 7901: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 7902: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802016  ! 7907: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x80d3e001  ! 7908: UMULcc_I	umulcc 	%r15, 0x0001, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc0c7e010  ! 7910: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0x9879800a  ! 7911: SDIV_R	sdiv 	%r6, %r10, %r12
	.word 0xd8cfe000  ! 7912: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0xd897e030  ! 7917: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	ta	T_CHANGE_PRIV	! macro
	mov 0x30, %r30
	.word 0x9fd0001e  ! 7921: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x85d02033  ! 7924: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x87802054  ! 7925: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xd8cfe030  ! 7926: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0xd88004a0  ! 7927: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r12
	.word 0x38800001  ! 7932: BGU	bgu,a	<label_0x1>
	.word 0xd80fe001  ! 7933: LDUB_I	ldub	[%r31 + 0x0001], %r12
	mov 0x35, %r30
	.word 0x97d0001e  ! 7934: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xd887e030  ! 7937: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802010  ! 7939: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x31, %r30
	.word 0x89d0001e  ! 7942: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9da109e0  ! 7945: FDIVq	dis not found

	.word 0x81698008  ! 7946: SDIVX_R	sdivx	%r6, %r8, %r0
	.word 0x20800001  ! 7949: BN	bn,a	<label_0x1>
	.word 0xc08fe030  ! 7950: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r0
	.word 0x81d02030  ! 7951: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0xc0c7e000  ! 7952: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	mov 0x32, %r30
	.word 0x99d0001e  ! 7965: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 7966: BPNE	<illegal instruction>
	.word 0xc0d804a0  ! 7967: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x9ad1c00d  ! 7968: UMULcc_R	umulcc 	%r7, %r13, %r13
	.word 0xda97e020  ! 7973: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
	.word 0x85a089a3  ! 7974: FDIVs	fdivs	%f2, %f3, %f2
	.word 0xc447c000  ! 7975: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x88680002  ! 7982: UDIVX_R	udivx 	%r0, %r2, %r4
	mov 0x33, %r30
	.word 0x8fd0001e  ! 7987: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x85508000  ! 7988: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x99d02031  ! 7989: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x9cd9c008  ! 7992: SMULcc_R	smulcc 	%r7, %r8, %r14
	.word 0xdcd804a0  ! 7995: LDXA_R	ldxa	[%r0, %r0] 0x25, %r14
	.word 0xdc8fe030  ! 7996: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r14
	mov 0x30, %r30
	.word 0x89d0001e  ! 7997: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 7998: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdc17c000  ! 8002: LDUH_R	lduh	[%r31 + %r0], %r14
	.word 0x2e700001  ! 8005: BPVS	<illegal instruction>
	.word 0x83d02030  ! 8006: Tcc_I	te	icc_or_xcc, %r0 + 48
	mov 0x31, %r30
	.word 0x8fd0001e  ! 8009: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xdc4fc000  ! 8012: LDSB_R	ldsb	[%r31 + %r0], %r14
	.word 0xdc4fe001  ! 8015: LDSB_I	ldsb	[%r31 + 0x0001], %r14
	.word 0x87802054  ! 8018: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0xdcc7e000  ! 8019: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r14
	.word 0x83d02031  ! 8020: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xdcd7e020  ! 8023: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r14
	.word 0x87802045  ! 8024: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xdc17c000  ! 8029: LDUH_R	lduh	[%r31 + %r0], %r14
	.word 0x8dd02035  ! 8030: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x9c486001  ! 8031: MULX_I	mulx 	%r1, 0x0001, %r14
	.word 0x87d02034  ! 8032: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0xdc5fc000  ! 8033: LDX_R	ldx	[%r31 + %r0], %r14
	.word 0x9bd02033  ! 8034: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x886be001  ! 8035: UDIVX_I	udivx 	%r15, 0x0001, %r4
	mov 0x33, %r30
	.word 0x8dd0001e  ! 8040: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc817c000  ! 8043: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x95a289c1  ! 8044: FDIVd	fdivd	%f10, %f32, %f10
	.word 0x2e700001  ! 8049: BPVS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x28700001  ! 8079: BPLEU	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802010  ! 8089: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x34, %r30
	.word 0x89d0001e  ! 8090: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd48fe020  ! 8097: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	mov 0x34, %r30
	.word 0x9fd0001e  ! 8098: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81d02034  ! 8099: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0x3c700001  ! 8100: BPPOS	<illegal instruction>
	.word 0x9283a001  ! 8101: ADDcc_I	addcc 	%r14, 0x0001, %r9
	.word 0x93d02034  ! 8104: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x95d02031  ! 8109: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x9d494000  ! 8110: RDHPR_HTBA	rdhpr	%htba, %r14
	.word 0x93500000  ! 8111: RDPR_TPC	rdpr	%tpc, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8a49000c  ! 8115: MULX_R	mulx 	%r4, %r12, %r5
	.word 0x8bd02035  ! 8116: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0xca8804a0  ! 8117: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x8151c000  ! 8118: RDPR_TL	rdpr	%tl, %r0
	.word 0x87802010  ! 8123: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x95d02031  ! 8128: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x87802016  ! 8131: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc047e001  ! 8134: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0x824a6001  ! 8135: MULX_I	mulx 	%r9, 0x0001, %r1
	.word 0xc2cfe010  ! 8138: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r1
	.word 0xc2c7e000  ! 8145: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	.word 0xc2c7e020  ! 8154: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0x28800001  ! 8159: BLEU	bleu,a	<label_0x1>
	.word 0x91d02033  ! 8160: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8fd02031  ! 8163: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	mov 0x31, %r30
	.word 0x89d0001e  ! 8168: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc28004a0  ! 8169: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r1
	.word 0x8dd02035  ! 8176: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	mov 0x33, %r30
	.word 0x97d0001e  ! 8177: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc24fc000  ! 8182: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0x99500000  ! 8187: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xd8d80e40  ! 8188: LDXA_R	ldxa	[%r0, %r0] 0x72, %r12
	.word 0xd5e30028  ! 8189: CASA_I	casa	[%r12] 0x 1, %r8, %r10
	.word 0xd4c7e030  ! 8190: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	.word 0x93d02031  ! 8195: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xd417c000  ! 8196: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x34700001  ! 8205: BPG	<illegal instruction>
	.word 0xd44fe001  ! 8206: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0xd45fe001  ! 8209: LDX_I	ldx	[%r31 + 0x0001], %r10
	.word 0x34800001  ! 8220: BG	bg,a	<label_0x1>
	.word 0x95d02032  ! 8221: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x82d0000f  ! 8224: UMULcc_R	umulcc 	%r0, %r15, %r1
	.word 0xc297e010  ! 8225: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r1
	.word 0xc24fe001  ! 8226: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0x81d02035  ! 8233: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0xc20fe001  ! 8234: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0xc25fc000  ! 8235: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8550c000  ! 8236: RDPR_TT	rdpr	%tt, %r2
	mov 0x35, %r30
	.word 0x85d0001e  ! 8237: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc497e000  ! 8240: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r2
	.word 0x8f6b800e  ! 8245: SDIVX_R	sdivx	%r14, %r14, %r7
	.word 0x2c700001  ! 8254: BPNEG	<illegal instruction>
	.word 0xce47e001  ! 8255: LDSW_I	ldsw	[%r31 + 0x0001], %r7
	.word 0xcedfe000  ! 8258: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0xcecfe020  ! 8259: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r7
	.word 0x32700001  ! 8260: BPNE	<illegal instruction>
	.word 0xce8fe020  ! 8261: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r7
	.word 0x91d02034  ! 8262: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x3c700001  ! 8267: BPPOS	<illegal instruction>
	.word 0x2a700001  ! 8276: BPCS	<illegal instruction>
	mov 0x33, %r30
	.word 0x9bd0001e  ! 8279: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x87802045  ! 8284: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0xcec7e030  ! 8285: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
	.word 0x87d02030  ! 8288: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x87802010  ! 8289: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xcec004a0  ! 8292: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xce800e40  ! 8293: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r7
	.word 0xce800e60  ! 8296: LDUWA_R	lduwa	[%r0, %r0] 0x73, %r7
	.word 0x99d02030  ! 8297: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x8c79000e  ! 8302: SDIV_R	sdiv 	%r4, %r14, %r6
	.word 0x907b800e  ! 8303: SDIV_R	sdiv 	%r14, %r14, %r8
	.word 0x9750c000  ! 8320: RDPR_TT	rdpr	%tt, %r11
	.word 0x887aa001  ! 8321: SDIV_I	sdiv 	%r10, 0x0001, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802054  ! 8325: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x32700001  ! 8326: BPNE	<illegal instruction>
	.word 0x9fd02031  ! 8327: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x9fd02031  ! 8332: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0xc85fc000  ! 8335: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xc80fe001  ! 8336: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0x9fd02031  ! 8337: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0xc8800e80  ! 8338: LDUWA_R	lduwa	[%r0, %r0] 0x74, %r4
	.word 0x87802016  ! 8343: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8082c00a  ! 8344: ADDcc_R	addcc 	%r11, %r10, %r0
	.word 0x85d02033  ! 8345: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xc08004a0  ! 8350: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r0
	.word 0x89d02034  ! 8357: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xc087e030  ! 8358: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r0
	.word 0x99d02034  ! 8361: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0xc0c7e030  ! 8362: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	.word 0x906b8004  ! 8365: UDIVX_R	udivx 	%r14, %r4, %r8
	mov 0x30, %r30
	.word 0x97d0001e  ! 8368: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8ad30004  ! 8371: UMULcc_R	umulcc 	%r12, %r4, %r5
	.word 0x97a109e9  ! 8374: FDIVq	dis not found

	.word 0x9f500000  ! 8375: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x93d02034  ! 8376: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x95d02031  ! 8379: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0xdec7e020  ! 8382: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r15
	mov 0x32, %r30
	.word 0x8fd0001e  ! 8383: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x856ba001  ! 8384: SDIVX_I	sdivx	%r14, 0x0001, %r2
	.word 0x2c800001  ! 8395: BNEG	bneg,a	<label_0x1>
	.word 0xc497e020  ! 8396: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r2
	.word 0x9e032001  ! 8397: ADD_I	add 	%r12, 0x0001, %r15
	.word 0xde47c000  ! 8400: LDSW_R	ldsw	[%r31 + %r0], %r15
	.word 0x24800001  ! 8409: BLE	ble,a	<label_0x1>
	.word 0x87802016  ! 8410: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93d02032  ! 8413: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x98026001  ! 8418: ADD_I	add 	%r9, 0x0001, %r12
	mov 0x35, %r30
	.word 0x81d0001e  ! 8421: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 8422: Tcc_I	ta	icc_or_xcc, %r0 + 50
	mov 0x31, %r30
	.word 0x9dd0001e  ! 8423: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xd84fc000  ! 8426: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0xd85fe001  ! 8427: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0x83696001  ! 8432: SDIVX_I	sdivx	%r5, 0x0001, %r1
	.word 0x95d02035  ! 8443: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0xc247e001  ! 8444: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0x87d02032  ! 8449: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x9fd02031  ! 8452: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x8dd0001e  ! 8455: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc207e001  ! 8458: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x3c800001  ! 8459: BPOS	bpos,a	<label_0x1>
	.word 0x9350c000  ! 8460: RDPR_TT	rdpr	%tt, %r9
	.word 0x22800001  ! 8467: BE	be,a	<label_0x1>
	mov 0x32, %r30
	.word 0x95d0001e  ! 8468: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x97d02035  ! 8469: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0xd2d7e010  ! 8470: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
	.word 0x87802054  ! 8473: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x97a209c0  ! 8478: FDIVd	fdivd	%f8, %f0, %f42
	.word 0x866be001  ! 8479: UDIVX_I	udivx 	%r15, 0x0001, %r3
	.word 0xc697e010  ! 8486: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r3
	.word 0xc64fc000  ! 8493: LDSB_R	ldsb	[%r31 + %r0], %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8fa249ca  ! 8503: FDIVd	fdivd	%f40, %f10, %f38
	.word 0x82026001  ! 8504: ADD_I	add 	%r9, 0x0001, %r1
	.word 0x91d02035  ! 8509: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x20700001  ! 8510: BPN	<illegal instruction>
	.word 0x87802004  ! 8513: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xc28fe030  ! 8515: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	.word 0x83d02033  ! 8518: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc2dfe000  ! 8521: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
	.word 0xc2800e40  ! 8522: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r1
	.word 0xc20fc000  ! 8529: LDUB_R	ldub	[%r31 + %r0], %r1
	.word 0x92c0e001  ! 8530: ADDCcc_I	addccc 	%r3, 0x0001, %r9
	mov 0x32, %r30
	.word 0x8dd0001e  ! 8535: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd24fc000  ! 8538: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0x9079c009  ! 8541: SDIV_R	sdiv 	%r7, %r9, %r8
	.word 0x2a800001  ! 8546: BCS	bcs,a	<label_0x1>
	.word 0x36800001  ! 8547: BGE	bge,a	<label_0x1>
	.word 0x82508003  ! 8548: UMUL_R	umul 	%r2, %r3, %r1
	.word 0x24700001  ! 8551: BPLE	<illegal instruction>
	.word 0x95a2c9a0  ! 8552: FDIVs	fdivs	%f11, %f0, %f10
	.word 0x22800001  ! 8563: BE	be,a	<label_0x1>
	.word 0xd447c000  ! 8564: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x2a700001  ! 8565: BPCS	<illegal instruction>
	.word 0x84780005  ! 8576: SDIV_R	sdiv 	%r0, %r5, %r2
	.word 0xc4d004a0  ! 8581: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	mov 0x33, %r30
	.word 0x97d0001e  ! 8582: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc4d00e40  ! 8583: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r2
	mov 0x33, %r30
	.word 0x8bd0001e  ! 8584: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc44fe001  ! 8585: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0x90d12001  ! 8586: UMULcc_I	umulcc 	%r4, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd087e020  ! 8594: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r8
	.word 0xd04fe001  ! 8595: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x91504000  ! 8600: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x85d02031  ! 8601: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xd0dfe020  ! 8608: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	mov 0x30, %r30
	.word 0x95d0001e  ! 8609: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8b494000  ! 8610: RDHPR_HTBA	rdhpr	%htba, %r5
	mov 0x32, %r30
	.word 0x9dd0001e  ! 8615: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 8616: BVC	bvc,a	<label_0x1>
	.word 0x87480000  ! 8621: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	mov 0x33, %r30
	.word 0x9bd0001e  ! 8626: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x9fa309c8  ! 8627: FDIVd	fdivd	%f12, %f8, %f46
	.word 0xde17c000  ! 8636: LDUH_R	lduh	[%r31 + %r0], %r15
	.word 0xde17e001  ! 8641: LDUH_I	lduh	[%r31 + 0x0001], %r15
	.word 0x89a209a6  ! 8646: FDIVs	fdivs	%f8, %f6, %f4
	.word 0xc85fc000  ! 8651: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x9b6b0007  ! 8652: SDIVX_R	sdivx	%r12, %r7, %r13
	.word 0x9f480000  ! 8655: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x3c700001  ! 8658: BPPOS	<illegal instruction>
	.word 0xdedfe010  ! 8659: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r15
	.word 0x87802014  ! 8662: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc6fb802e  ! 8665: SWAPA_R	swapa	%r3, [%r14 + %r14] 0x01
	.word 0x827aa001  ! 8672: SDIV_I	sdiv 	%r10, 0x0001, %r1
	.word 0x9fd02030  ! 8685: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0xc257c000  ! 8686: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0x2e700001  ! 8691: BPVS	<illegal instruction>
	mov 0x30, %r30
	.word 0x97d0001e  ! 8700: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8fd02035  ! 8701: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xc2d7e030  ! 8702: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0x8bd02032  ! 8703: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x80482001  ! 8704: MULX_I	mulx 	%r0, 0x0001, %r0
	.word 0xc007c000  ! 8705: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x89d02032  ! 8710: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0xc0c00e40  ! 8711: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r0
	.word 0x38700001  ! 8716: BPGU	<illegal instruction>
	mov 0x33, %r30
	.word 0x9fd0001e  ! 8717: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc08004a0  ! 8720: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r0
	mov 0x31, %r30
	.word 0x9bd0001e  ! 8723: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x95d02035  ! 8726: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x97d02032  ! 8727: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xc0c7e000  ! 8728: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0x9dd02034  ! 8731: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0xcefb802d  ! 8732: SWAPA_R	swapa	%r7, [%r14 + %r13] 0x01
	.word 0x8dd02031  ! 8733: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x99d02032  ! 8740: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	mov 0x32, %r30
	.word 0x89d0001e  ! 8741: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xce87e020  ! 8744: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r7
	.word 0xce57e001  ! 8745: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x93d02032  ! 8748: Tcc_I	tne	icc_or_xcc, %r0 + 50
	mov 0x32, %r30
	.word 0x97d0001e  ! 8749: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x9bd02035  ! 8750: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x32700001  ! 8752: BPNE	<illegal instruction>
	.word 0xce87e020  ! 8757: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r7
	.word 0x87a049cb  ! 8760: FDIVd	fdivd	%f32, %f42, %f34
	mov 0x32, %r30
	.word 0x9bd0001e  ! 8761: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc617c000  ! 8762: LDUH_R	lduh	[%r31 + %r0], %r3
	.word 0x87802014  ! 8765: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x946a2001  ! 8766: UDIVX_I	udivx 	%r8, 0x0001, %r10
	.word 0x8dd02031  ! 8775: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0xd48fe010  ! 8780: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x3e700001  ! 8781: BPVC	<illegal instruction>
	.word 0x3a800001  ! 8784: BCC	bcc,a	<label_0x1>
	.word 0x8d51c000  ! 8785: RDPR_TL	rdpr	%tl, %r6
	.word 0x22700001  ! 8800: BPE	<illegal instruction>
	.word 0xcc8804a0  ! 8803: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	mov 0x34, %r30
	.word 0x9fd0001e  ! 8808: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xccd804a0  ! 8811: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	mov 0x32, %r30
	.word 0x93d0001e  ! 8812: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xccd004a0  ! 8817: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x83d02033  ! 8822: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x36700001  ! 8823: BPGE	<illegal instruction>
	.word 0x87d02034  ! 8830: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x827ac00c  ! 8835: SDIV_R	sdiv 	%r11, %r12, %r1
	.word 0x924aa001  ! 8842: MULX_I	mulx 	%r10, 0x0001, %r9
	.word 0x26700001  ! 8843: BPL	<illegal instruction>
	.word 0x24800001  ! 8846: BLE	ble,a	<label_0x1>
	.word 0x85d02031  ! 8851: Tcc_I	tle	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x87d0001e  ! 8854: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x99a149ce  ! 8855: FDIVd	fdivd	%f36, %f14, %f12
	.word 0xd8d80e80  ! 8856: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	.word 0x87802014  ! 8861: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd85fe001  ! 8868: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0x20800001  ! 8869: BN	bn,a	<label_0x1>
	.word 0xd8dfe030  ! 8870: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0x8f480000  ! 8873: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xcedfe020  ! 8874: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0xced004a0  ! 8877: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x87802004  ! 8882: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8dd02030  ! 8893: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x80d2a001  ! 8894: UMULcc_I	umulcc 	%r10, 0x0001, %r0
	.word 0x87d02031  ! 8895: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x30700001  ! 8896: BPA	<illegal instruction>
	.word 0xc0c80e40  ! 8903: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r0
	.word 0x984be001  ! 8906: MULX_I	mulx 	%r15, 0x0001, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89d02034  ! 8908: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xd807e001  ! 8911: LDUW_I	lduw	[%r31 + 0x0001], %r12
	mov 0x30, %r30
	.word 0x85d0001e  ! 8914: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 8917: BG	bg,a	<label_0x1>
	.word 0x87802010  ! 8918: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd84fe001  ! 8923: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0xd80fe001  ! 8928: LDUB_I	ldub	[%r31 + 0x0001], %r12
	mov 0x30, %r30
	.word 0x9dd0001e  ! 8933: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xd84fe001  ! 8943: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x26800001  ! 8944: BL	bl,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd80fe001  ! 8956: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x8a78400d  ! 8957: SDIV_R	sdiv 	%r1, %r13, %r5
	.word 0x85688009  ! 8958: SDIVX_R	sdivx	%r2, %r9, %r2
	.word 0x87d02031  ! 8961: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x95504000  ! 8962: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x9dd02030  ! 8963: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	mov 0x34, %r30
	.word 0x9dd0001e  ! 8976: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x92036001  ! 8981: ADD_I	add 	%r13, 0x0001, %r9
	.word 0x9adb8001  ! 8982: SMULcc_R	smulcc 	%r14, %r1, %r13
	mov 0x31, %r30
	.word 0x81d0001e  ! 8985: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 8986: BNE	bne,a	<label_0x1>
	.word 0x2c800001  ! 8991: BNEG	bneg,a	<label_0x1>
	.word 0xda4fe001  ! 8992: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x30700001  ! 8993: BPA	<illegal instruction>
	.word 0xda57c000  ! 8994: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0xda87e010  ! 8995: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r13
	.word 0xdadfe000  ! 8996: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0xdad00e80  ! 8999: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
	.word 0x22800001  ! 9002: BE	be,a	<label_0x1>
	.word 0xda17e001  ! 9003: LDUH_I	lduh	[%r31 + 0x0001], %r13
	.word 0x8bd02033  ! 9004: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0xda57e001  ! 9005: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x83d02033  ! 9008: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x3a800001  ! 9011: BCC	bcc,a	<label_0x1>
	.word 0x32800001  ! 9016: BNE	bne,a	<label_0x1>
	.word 0xda47c000  ! 9017: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0xda8004a0  ! 9018: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r13
	.word 0x956a6001  ! 9021: SDIVX_I	sdivx	%r9, 0x0001, %r10
	.word 0xd487e010  ! 9022: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r10
	.word 0x85d02033  ! 9025: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xd4c804a0  ! 9026: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02034  ! 9031: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 0x33, %r30
	.word 0x87d0001e  ! 9036: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x97a049a7  ! 9041: FDIVs	fdivs	%f1, %f7, %f11
	.word 0xd657c000  ! 9042: LDSH_R	ldsh	[%r31 + %r0], %r11
	mov 0x34, %r30
	.word 0x8fd0001e  ! 9043: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 9044: BE	be,a	<label_0x1>
	.word 0x92816001  ! 9045: ADDcc_I	addcc 	%r5, 0x0001, %r9
	.word 0xd247e001  ! 9046: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0xd207e001  ! 9047: LDUW_I	lduw	[%r31 + 0x0001], %r9
	mov 0x31, %r30
	.word 0x85d0001e  ! 9048: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x97d02030  ! 9055: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0x8669800f  ! 9058: UDIVX_R	udivx 	%r6, %r15, %r3
	.word 0xc65fe001  ! 9061: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0x9da009ed  ! 9062: FDIVq	dis not found

	.word 0xdcdfe020  ! 9063: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0xd1e24026  ! 9064: CASA_I	casa	[%r9] 0x 1, %r6, %r8
	mov 0x35, %r30
	.word 0x99d0001e  ! 9067: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 9068: BNE	bne,a	<label_0x1>
	.word 0x97a3c9a3  ! 9069: FDIVs	fdivs	%f15, %f3, %f11
	mov 0x30, %r30
	.word 0x8fd0001e  ! 9070: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x99d02033  ! 9075: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xd68fe010  ! 9076: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0xd6d7e030  ! 9077: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0xd6cfe010  ! 9084: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x91d02035  ! 9085: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x34, %r30
	.word 0x8fd0001e  ! 9086: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9950c000  ! 9087: RDPR_TT	rdpr	%tt, %r12
	mov 0x34, %r30
	.word 0x93d0001e  ! 9090: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 9093: BPN	<illegal instruction>
	.word 0x8bd02031  ! 9094: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xd887e030  ! 9097: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r12
	mov 0x33, %r30
	.word 0x99d0001e  ! 9102: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x8fd0001e  ! 9115: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 9116: BLEU	bleu,a	<label_0x1>
	.word 0x97494000  ! 9117: RDHPR_HTBA	rdhpr	%htba, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x34800001  ! 9125: BG	bg,a	<label_0x1>
	.word 0x9481a001  ! 9128: ADDcc_I	addcc 	%r6, 0x0001, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd447c000  ! 9132: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x24800001  ! 9133: BLE	ble,a	<label_0x1>
	.word 0x93d02034  ! 9140: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8f504000  ! 9141: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x3e700001  ! 9142: BPVC	<illegal instruction>
	.word 0x93d02032  ! 9149: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x9b68400d  ! 9150: SDIVX_R	sdivx	%r1, %r13, %r13
	.word 0x99494000  ! 9151: RDHPR_HTBA	rdhpr	%htba, %r12
	mov 0x30, %r30
	.word 0x81d0001e  ! 9154: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9680a001  ! 9157: ADDcc_I	addcc 	%r2, 0x0001, %r11
	.word 0x87802010  ! 9158: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8950c000  ! 9159: RDPR_TT	rdpr	%tt, %r4
	.word 0x87802016  ! 9166: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8c680009  ! 9167: UDIVX_R	udivx 	%r0, %r9, %r6
	.word 0xcccfe010  ! 9176: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r6
	.word 0x87802014  ! 9177: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93d02031  ! 9180: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x34800001  ! 9183: BG	bg,a	<label_0x1>
	.word 0x9f51c000  ! 9184: RDPR_TL	rdpr	%tl, %r15
	.word 0x8bd02032  ! 9187: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x38700001  ! 9188: BPGU	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xde8004a0  ! 9196: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r15
	.word 0x9a69a001  ! 9199: UDIVX_I	udivx 	%r6, 0x0001, %r13
	.word 0x9f494000  ! 9200: RDHPR_HTBA	rdhpr	%htba, %r15
	.word 0x89d02034  ! 9201: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xdecfe030  ! 9204: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r15
	mov 0x33, %r30
	.word 0x99d0001e  ! 9211: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x9b6aa001  ! 9214: SDIVX_I	sdivx	%r10, 0x0001, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8dd02030  ! 9222: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x9e832001  ! 9225: ADDcc_I	addcc 	%r12, 0x0001, %r15
	.word 0xdec7e010  ! 9226: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	.word 0x9fd02033  ! 9227: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	mov 0x35, %r30
	.word 0x89d0001e  ! 9228: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 9229: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x89a249c9  ! 9230: FDIVd	fdivd	%f40, %f40, %f4
	mov 0x34, %r30
	.word 0x9dd0001e  ! 9231: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xc8c80e40  ! 9236: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0xc847e001  ! 9237: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0xc817e001  ! 9240: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0xc847c000  ! 9243: LDSW_R	ldsw	[%r31 + %r0], %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0x9482a001  ! 9249: ADDcc_I	addcc 	%r10, 0x0001, %r10
	.word 0x91d02035  ! 9250: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x95d02030  ! 9259: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x3e800001  ! 9260: BVC	bvc,a	<label_0x1>
	.word 0xd447c000  ! 9261: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0xd40fe001  ! 9262: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0xd4cfe000  ! 9265: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81d02032  ! 9273: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x97d02035  ! 9274: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0xd48fe010  ! 9275: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x9fd02033  ! 9278: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x8d508000  ! 9279: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x22800001  ! 9280: BE	be,a	<label_0x1>
	.word 0xcccfe020  ! 9283: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r6
	mov 0x30, %r30
	.word 0x81d0001e  ! 9284: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8080000a  ! 9285: ADDcc_R	addcc 	%r0, %r10, %r0
	.word 0x91698000  ! 9286: SDIVX_R	sdivx	%r6, %r0, %r8
	.word 0x2e700001  ! 9291: BPVS	<illegal instruction>
	.word 0x87a109cb  ! 9292: FDIVd	fdivd	%f4, %f42, %f34
	.word 0x38800001  ! 9293: BGU	bgu,a	<label_0x1>
	mov 0x30, %r30
	.word 0x8fd0001e  ! 9294: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc6d7e030  ! 9295: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r3
	mov 0x30, %r30
	.word 0x8bd0001e  ! 9300: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 9305: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd9e3002a  ! 9308: CASA_I	casa	[%r12] 0x 1, %r10, %r12
	.word 0xd8d7e030  ! 9309: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
	.word 0xd887e000  ! 9314: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r12
	.word 0xd857e001  ! 9315: LDSH_I	ldsh	[%r31 + 0x0001], %r12
	.word 0x36800001  ! 9328: BGE	bge,a	<label_0x1>
	.word 0xd847e001  ! 9331: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0xd887e020  ! 9336: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r12
	.word 0x9fa3c9ea  ! 9339: FDIVq	dis not found

	.word 0x32800001  ! 9340: BNE	bne,a	<label_0x1>
	mov 0x34, %r30
	.word 0x91d0001e  ! 9343: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xde47c000  ! 9344: LDSW_R	ldsw	[%r31 + %r0], %r15
	.word 0xde880e80  ! 9347: LDUBA_R	lduba	[%r0, %r0] 0x74, %r15
	mov 0x32, %r30
	.word 0x9dd0001e  ! 9352: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8268c007  ! 9353: UDIVX_R	udivx 	%r3, %r7, %r1
	mov 0x33, %r30
	.word 0x8bd0001e  ! 9354: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x83d0001e  ! 9357: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc28004a0  ! 9360: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r1
	mov 0x34, %r30
	.word 0x91d0001e  ! 9361: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a149a0  ! 9362: FDIVs	fdivs	%f5, %f0, %f1
	.word 0xc297e020  ! 9365: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r1
	.word 0x9d494000  ! 9372: RDHPR_HTBA	rdhpr	%htba, %r14
	.word 0x89d02034  ! 9377: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x9f500000  ! 9378: RDPR_TPC	rdpr	%tpc, %r15
	.word 0xde47e001  ! 9379: LDSW_I	ldsw	[%r31 + 0x0001], %r15
	.word 0xdedfe010  ! 9380: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r15
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xde5fc000  ! 9382: LDX_R	ldx	[%r31 + %r0], %r15
	.word 0xdec7e000  ! 9385: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r15
	mov 0x34, %r30
	.word 0x87d0001e  ! 9386: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8051c008  ! 9391: UMUL_R	umul 	%r7, %r8, %r0
	.word 0xc08fe000  ! 9398: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0x83d02034  ! 9401: Tcc_I	te	icc_or_xcc, %r0 + 52
	mov 0x34, %r30
	.word 0x81d0001e  ! 9406: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x2a700001  ! 9407: BPCS	<illegal instruction>
	.word 0xc047e001  ! 9410: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0xd07b2001  ! 9414: SWAP_I	swap	%r8, [%r12 + 0x0001]
	.word 0x8ec16001  ! 9425: ADDCcc_I	addccc 	%r5, 0x0001, %r7
	.word 0xce4fc000  ! 9428: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x90484006  ! 9429: MULX_R	mulx 	%r1, %r6, %r8
	.word 0x2e800001  ! 9430: BVS	bvs,a	<label_0x1>
	.word 0x9da389af  ! 9431: FDIVs	fdivs	%f14, %f15, %f14
	.word 0xdccfe030  ! 9432: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r14
	.word 0x9b514000  ! 9433: RDPR_TBA	rdpr	%tba, %r13
	.word 0x34700001  ! 9434: BPG	<illegal instruction>
	.word 0xda97e000  ! 9435: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0xdad7e020  ! 9438: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0xda5fc000  ! 9447: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x34700001  ! 9454: BPG	<illegal instruction>
	.word 0x85d02032  ! 9467: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0xdad804a0  ! 9468: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xda17c000  ! 9473: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0xda4fe001  ! 9474: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x8e6ba001  ! 9477: UDIVX_I	udivx 	%r14, 0x0001, %r7
	.word 0x81514000  ! 9484: RDPR_TBA	rdpr	%tba, %r0
	.word 0x8da249ea  ! 9487: FDIVq	dis not found

	.word 0x87d02033  ! 9488: Tcc_I	tl	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x22700001  ! 9490: BPE	<illegal instruction>
	.word 0x2e800001  ! 9497: BVS	bvs,a	<label_0x1>
	.word 0xcc57c000  ! 9498: LDSH_R	ldsh	[%r31 + %r0], %r6
	.word 0x93d02033  ! 9499: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xccdfe030  ! 9504: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x8bd02033  ! 9512: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a289ca  ! 9516: FDIVd	fdivd	%f10, %f10, %f0
	mov 0x33, %r30
	.word 0x99d0001e  ! 9527: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8fd02033  ! 9528: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0xc0cfe010  ! 9533: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0x24800001  ! 9536: BLE	ble,a	<label_0x1>
	.word 0xc05fe001  ! 9537: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0x9cd3800a  ! 9538: UMULcc_R	umulcc 	%r14, %r10, %r14
	.word 0x8d508000  ! 9541: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x22800001  ! 9542: BE	be,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcc5fe001  ! 9554: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x9dd02033  ! 9557: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0xcc17e001  ! 9558: LDUH_I	lduh	[%r31 + 0x0001], %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xccdfe030  ! 9560: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	.word 0x8cd00005  ! 9561: UMULcc_R	umulcc 	%r0, %r5, %r6
	.word 0xcc17c000  ! 9562: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0x87802004  ! 9569: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81d02032  ! 9576: Tcc_I	tn	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcc5fe001  ! 9582: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x28700001  ! 9583: BPLEU	<illegal instruction>
	mov 0x33, %r30
	.word 0x91d0001e  ! 9586: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x8dd0001e  ! 9589: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x93a109ae  ! 9590: FDIVs	fdivs	%f4, %f14, %f9
	ta	T_CHANGE_PRIV	! macro
	.word 0x89a009ce  ! 9600: FDIVd	fdivd	%f0, %f14, %f4
	.word 0xc857c000  ! 9601: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0x8ba249e9  ! 9604: FDIVq	dis not found

	.word 0xca07e001  ! 9605: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x8ac32001  ! 9606: ADDCcc_I	addccc 	%r12, 0x0001, %r5
	.word 0x87d02034  ! 9607: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x87802045  ! 9608: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x8a6b8001  ! 9613: UDIVX_R	udivx 	%r14, %r1, %r5
	mov 0x33, %r30
	.word 0x9fd0001e  ! 9616: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xd87b6001  ! 9621: SWAP_I	swap	%r12, [%r13 + 0x0001]
	.word 0x8fd02032  ! 9622: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0x83d02031  ! 9625: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x26700001  ! 9626: BPL	<illegal instruction>
	.word 0xd857e001  ! 9627: LDSH_I	ldsh	[%r31 + 0x0001], %r12
	.word 0x9bd02030  ! 9628: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x99690001  ! 9647: SDIVX_R	sdivx	%r4, %r1, %r12
	.word 0xd85fc000  ! 9650: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd89004a0  ! 9653: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd80fe001  ! 9662: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x3c800001  ! 9663: BPOS	bpos,a	<label_0x1>
	.word 0x28800001  ! 9674: BLEU	bleu,a	<label_0x1>
	.word 0x8fa289cf  ! 9675: FDIVd	fdivd	%f10, %f46, %f38
	.word 0x9d514000  ! 9676: RDPR_TBA	rdpr	%tba, %r14
	.word 0x8600e001  ! 9677: ADD_I	add 	%r3, 0x0001, %r3
	.word 0x97d02031  ! 9678: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0xc6c804a0  ! 9687: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0xc6c7e010  ! 9690: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0xc65fc000  ! 9691: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x87802054  ! 9692: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x82838006  ! 9695: ADDcc_R	addcc 	%r14, %r6, %r1
	.word 0x2a700001  ! 9696: BPCS	<illegal instruction>
	.word 0xc217c000  ! 9697: LDUH_R	lduh	[%r31 + %r0], %r1
	mov 0x31, %r30
	.word 0x93d0001e  ! 9700: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8cc26001  ! 9703: ADDCcc_I	addccc 	%r9, 0x0001, %r6
	.word 0x9ad2e001  ! 9712: UMULcc_I	umulcc 	%r11, 0x0001, %r13
	.word 0x8a01e001  ! 9713: ADD_I	add 	%r7, 0x0001, %r5
	mov 0x35, %r30
	.word 0x9bd0001e  ! 9718: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x816a2001  ! 9721: SDIVX_I	sdivx	%r8, 0x0001, %r0
	.word 0x87500000  ! 9722: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8e7ba001  ! 9725: SDIV_I	sdiv 	%r14, 0x0001, %r7
	.word 0x32800001  ! 9728: BNE	bne,a	<label_0x1>
	.word 0xcec7e020  ! 9739: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	.word 0x9e83a001  ! 9746: ADDcc_I	addcc 	%r14, 0x0001, %r15
	.word 0x95d02030  ! 9747: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x9a4ac002  ! 9750: MULX_R	mulx 	%r11, %r2, %r13
	mov 0x31, %r30
	.word 0x95d0001e  ! 9751: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 9752: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 0x31, %r30
	.word 0x89d0001e  ! 9753: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8fa349ad  ! 9754: FDIVs	fdivs	%f13, %f13, %f7
	.word 0x99d02031  ! 9757: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x9450c008  ! 9760: UMUL_R	umul 	%r3, %r8, %r10
	.word 0x8fd02033  ! 9761: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	mov 0x34, %r30
	.word 0x81d0001e  ! 9764: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xd45fc000  ! 9765: LDX_R	ldx	[%r31 + %r0], %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x90012001  ! 9769: ADD_I	add 	%r4, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83d02032  ! 9775: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd007c000  ! 9776: LDUW_R	lduw	[%r31 + %r0], %r8
	.word 0x9c53c003  ! 9779: UMUL_R	umul 	%r15, %r3, %r14
	.word 0xdc07c000  ! 9780: LDUW_R	lduw	[%r31 + %r0], %r14
	.word 0xdc8fe000  ! 9781: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r14
	mov 0x33, %r30
	.word 0x9fd0001e  ! 9782: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 9785: BPNEG	<illegal instruction>
	.word 0x936b6001  ! 9786: SDIVX_I	sdivx	%r13, 0x0001, %r9
	.word 0xd20fe001  ! 9789: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x99d02031  ! 9790: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x9dd02030  ! 9791: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0xd297e010  ! 9796: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0xd2d7e020  ! 9799: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r9
	mov 0x33, %r30
	.word 0x8bd0001e  ! 9802: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd257e001  ! 9803: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0xd297e030  ! 9808: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0x34800001  ! 9811: BG	bg,a	<label_0x1>
	.word 0x9dd02030  ! 9820: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x8169e001  ! 9821: SDIVX_I	sdivx	%r7, 0x0001, %r0
	mov 0x35, %r30
	.word 0x9fd0001e  ! 9826: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 9827: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81d02034  ! 9830: Tcc_I	tn	icc_or_xcc, %r0 + 52
	mov 0x31, %r30
	.word 0x9bd0001e  ! 9831: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x97d0001e  ! 9834: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 9841: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc097e000  ! 9842: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r0
	.word 0x9bd02035  ! 9843: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x28800001  ! 9848: BLEU	bleu,a	<label_0x1>
	mov 0x33, %r30
	.word 0x89d0001e  ! 9849: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8dd02035  ! 9852: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x85d02033  ! 9855: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x95d02035  ! 9860: Tcc_I	tg	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x3a800001  ! 9862: BCC	bcc,a	<label_0x1>
	.word 0x22800001  ! 9863: BE	be,a	<label_0x1>
	.word 0x24800001  ! 9868: BLE	ble,a	<label_0x1>
	.word 0x8c494009  ! 9873: MULX_R	mulx 	%r5, %r9, %r6
	mov 0x35, %r30
	.word 0x87d0001e  ! 9874: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 9877: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x96d28003  ! 9878: UMULcc_R	umulcc 	%r10, %r3, %r11
	.word 0x32700001  ! 9879: BPNE	<illegal instruction>
	.word 0xd6dfe010  ! 9882: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x80d2c00d  ! 9885: UMULcc_R	umulcc 	%r11, %r13, %r0
	.word 0xc0cfe030  ! 9886: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	.word 0x9279a001  ! 9887: SDIV_I	sdiv 	%r6, 0x0001, %r9
	.word 0xd2d7e000  ! 9896: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r9
	.word 0xd2c7e020  ! 9911: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	.word 0x32800001  ! 9916: BNE	bne,a	<label_0x1>
	mov 0x30, %r30
	.word 0x95d0001e  ! 9921: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x99d0001e  ! 9924: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd2c80e80  ! 9932: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r9
	mov 0x32, %r30
	.word 0x9dd0001e  ! 9933: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x9dd0001e  ! 9934: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xd217e001  ! 9935: LDUH_I	lduh	[%r31 + 0x0001], %r9
	.word 0x96d3000b  ! 9936: UMULcc_R	umulcc 	%r12, %r11, %r11
	.word 0xd6d00e40  ! 9937: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
	.word 0x91d02033  ! 9940: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x20700001  ! 9947: BPN	<illegal instruction>
	.word 0x30800001  ! 9950: BA	ba,a	<label_0x1>
	.word 0x2a700001  ! 9951: BPCS	<illegal instruction>
	mov 0x35, %r30
	.word 0x9dd0001e  ! 9958: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xd68fe000  ! 9959: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0xd68004a0  ! 9960: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r11
	.word 0xd647c000  ! 9965: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0x22800001  ! 9966: BE	be,a	<label_0x1>
	.word 0x3c800001  ! 9967: BPOS	bpos,a	<label_0x1>
	.word 0x87802004  ! 9972: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd657e001  ! 9978: LDSH_I	ldsh	[%r31 + 0x0001], %r11
	.word 0xd657c000  ! 9981: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x90db400a  ! 9984: SMULcc_R	smulcc 	%r13, %r10, %r8
	.word 0x2a700001  ! 9985: BPCS	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x31, %r30
	.word 0x81d0001e  ! 9995: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x93d0001e  ! 9996: Tcc_R	tne	icc_or_xcc, %r0 + %r30


.data
user_data_start:
	.xword	0x21090022c04b73aa
	.xword	0x43fff3e1c586b54e
	.xword	0xc7b6f53655e93cfc
	.xword	0x074e3b79729b516f
	.xword	0x2c8b98315de79755
	.xword	0xed7795f5dfd6e029
	.xword	0x9f76b897668b609a
	.xword	0x990f354fb5db3a87
	.xword	0x1d15d7fa08444ecd
	.xword	0x907168ba675053c5
	.xword	0x8a1d4eba7ea4beb0
	.xword	0xabcd33483c88f3c8
	.xword	0x95075495e0b78f1c
	.xword	0x9769c5a30bd77329
	.xword	0xf0e543a896147a41
	.xword	0xa648e1a32e588ea3


.text
    ta T_GOOD_TRAP
.data
    .xword 0x0

#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Thu Mar 25 10:26:36 2004
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
!!#     // Weights
!!#     IJ_set_rvar("diag.j", 70, wt_high, "{6}");
!!#     IJ_set_rvar("diag.j", 71, wt_med,  "{3}");
!!#     IJ_set_rvar("diag.j", 72, wt_low,  "{1}");
!!# 
!!#     // Initialize registers ..
!!#     IJ_init_regs_by_setx ("diag.j", 75, th0, 3, 2, Rv_rand_64);
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 80, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 16; i++) {
!!#         IJ_printf  ("diag.j", 82, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 251, th0, $2);
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
!!# trap_asi : 
!!#     asi_load_r %ropr  Ro_traps_asi
!!# ;
!!# 
!!# wrasi : tWRASI_I %ropr  Ro_wrasi_i
!!# ;
!!# reg_tcc : tTcc_R %ropr  Ro_traps_r
!!#      { 
!!#      IJ_printf("diag.j", 293, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
