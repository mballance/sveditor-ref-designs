/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_cpqfill.s
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
#include "defines.h"
#include "nmacros.h"
#include "old_boot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */


	ta	T_RD_THID
	mov	%o1, %l7
	umul	%l7, 256, %l7


	!# Initialize registers ..

	!# Global registers
	set	0x8,	%g1
	set	0x7,	%g2
	set	0xE,	%g3
	set	0xB,	%g4
	set	0x8,	%g5
	set	0xE,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xB,	%i1
	set	-0x9,	%i2
	set	-0x2,	%i3
	set	-0x5,	%i4
	set	-0xD,	%i5
	set	-0xF,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x2C043118,	%l0
	set	0x7ACCC923,	%l1
	set	0x5882E0CE,	%l2
	set	0x5D489F2B,	%l3
	set	0x5845D569,	%l4
	set	0x23D0BAD9,	%l5
	set	0x08E07C09,	%l6
	!# Output registers
	set	0x0C01,	%o0
	set	0x0E67,	%o1
	set	-0x1ACC,	%o2
	set	0x1B5C,	%o3
	set	-0x1068,	%o4
	set	-0x0215,	%o5
	set	0x0C63,	%o6
	set	-0x1397,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	bne,pt	%icc,	loop_1
	fmovrsgz	%l0,	%f12,	%f2
	fbo	%fcc0,	loop_2
	fcmpne16	%f6,	%f12,	%o0
loop_1:
	call	loop_3
	fmovdgu	%xcc,	%f7,	%f2
loop_2:
	fmovrde	%o6,	%f8,	%f6
	fbo	%fcc2,	loop_4
loop_3:
	ldsw	[%l7 + 0x40],	%i4
	edge32ln	%g5,	%i5,	%g2
	srax	%o4,	%l1,	%g4
loop_4:
	movre	%l5,	%o5,	%i7
	orncc	%i3,	%g3,	%i2
	addccc	%o7,	%o3,	%g7
	fbge,a	%fcc2,	loop_5
	call	loop_6
	bg,a,pt	%icc,	loop_7
	fbul	%fcc0,	loop_8
loop_5:
	ldx	[%l7 + 0x38],	%i6
loop_6:
	lduh	[%l7 + 0x4C],	%g6
loop_7:
	bpos,pt	%icc,	loop_9
loop_8:
	movg	%xcc,	%o2,	%i1
	brgz,a	%l3,	loop_10
	sth	%i0,	[%l7 + 0x5C]
loop_9:
	bl,a	loop_11
	xorcc	%g1,	0x19ED,	%l2
loop_10:
	stb	%o1,	[%l7 + 0x64]
	fbn,a	%fcc1,	loop_12
loop_11:
	fbo	%fcc2,	loop_13
	fsrc1	%f6,	%f6
	fmovse	%icc,	%f11,	%f6
loop_12:
	edge32n	%l4,	%l0,	%o0
loop_13:
	edge32ln	%o6,	%i4,	%g5
	ldd	[%l7 + 0x38],	%f0
	subc	%i5,	%l6,	%o4
	bne,pn	%icc,	loop_14
	subcc	%l1,	0x0FD8,	%g4
	movcc	%icc,	%l5,	%o5
	fbul,a	%fcc0,	loop_15
loop_14:
	fandnot1	%f14,	%f14,	%f14
	fnot2	%f2,	%f0
	stw	%i7,	[%l7 + 0x64]
loop_15:
	add	%i3,	0x10B4,	%g3
	fbo	%fcc3,	loop_16
	fbn,a	%fcc2,	loop_17
	ldd	[%l7 + 0x28],	%f4
	fabsd	%f2,	%f8
loop_16:
	st	%f12,	[%l7 + 0x44]
loop_17:
	sdiv	%g2,	0x1BF1,	%o7
	fnot2s	%f12,	%f2
	xnorcc	%o3,	%g7,	%i2
	fcmple16	%f6,	%f2,	%i6
	ldx	[%l7 + 0x10],	%o2
	ba,a	loop_18
	fble	%fcc0,	loop_19
	popc	0x070D,	%i1
	add	%g6,	%l3,	%i0
loop_18:
	alignaddrl	%l2,	%g1,	%l4
loop_19:
	fandnot2s	%f1,	%f12,	%f8
	ldsb	[%l7 + 0x20],	%l0
	fmovdvs	%xcc,	%f4,	%f6
	fbn	%fcc0,	loop_20
	fmovrdne	%o1,	%f14,	%f4
	ldsw	[%l7 + 0x10],	%o6
	fbue,a	%fcc2,	loop_21
loop_20:
	set  0x0, %l0
	setx loop_22, %l0, %l1
	jmpl %l1, %o0
	fands	%f9,	%f2,	%f1
	umul	%i4,	0x0886,	%g5
loop_21:
	alignaddr	%l6,	%o4,	%i5
loop_22:
	xor	%l1,	0x0C71,	%l5
	bvc,a,pt	%icc,	loop_23
	fmul8sux16	%f0,	%f14,	%f6
	ldx	[%l7 + 0x40],	%g4
	xnor	%i7,	%i3,	%g3
loop_23:
	bl,a,pn	%xcc,	loop_24
	fbe	%fcc2,	loop_25
	alignaddrl	%g2,	%o5,	%o3
	movle	%xcc,	%o7,	%g7
loop_24:
	brgez,a	%i2,	loop_26
loop_25:
	ldsh	[%l7 + 0x42],	%i6
	brgz	%i1,	loop_27
	ldub	[%l7 + 0x5B],	%o2
loop_26:
	fcmpne16	%f4,	%f10,	%g6
	fblg,a	%fcc2,	loop_28
loop_27:
	std	%f14,	[%l7 + 0x28]
	sdivcc	%i0,	0x0F86,	%l3
	fmovdcc	%xcc,	%f12,	%f12
loop_28:
	mulx	%g1,	0x0EFC,	%l4
	fmovdcc	%xcc,	%f11,	%f14
	movleu	%xcc,	%l0,	%l2
	fbul	%fcc1,	loop_29
	bleu,pn	%icc,	loop_30
	stx	%o6,	[%l7 + 0x68]
	ldsh	[%l7 + 0x68],	%o1
loop_29:
	stw	%o0,	[%l7 + 0x58]
loop_30:
	fnot2s	%f6,	%f9
	lduh	[%l7 + 0x42],	%i4
	udiv	%g5,	0x08C0,	%o4
	alignaddrl	%l6,	%i5,	%l1
	std	%f10,	[%l7 + 0x28]
	udiv	%l5,	0x063C,	%g4
	call	loop_31
	fmovdpos	%xcc,	%f1,	%f12
	fbu,a	%fcc3,	loop_32
	ldd	[%l7 + 0x40],	%f0
loop_31:
	bneg,pt	%xcc,	loop_33
	fcmps	%fcc2,	%f14,	%f11
loop_32:
	stw	%i3,	[%l7 + 0x14]
	st	%f6,	[%l7 + 0x30]
loop_33:
	fba,a	%fcc0,	loop_34
	bcc,pn	%xcc,	loop_35
	movcc	%xcc,	%g3,	%i7
	fba	%fcc3,	loop_36
loop_34:
	fblg	%fcc3,	loop_37
loop_35:
	fmovdvs	%xcc,	%f0,	%f10
	addcc	%o5,	0x1416,	%o3
loop_36:
	movrlez	%o7,	0x017,	%g7
loop_37:
	fmovscs	%icc,	%f10,	%f3
	fble	%fcc2,	loop_38
	stw	%i2,	[%l7 + 0x44]
	fnand	%f6,	%f10,	%f4
	bn,a,pt	%icc,	loop_39
loop_38:
	brgez	%i6,	loop_40
	ld	[%l7 + 0x3C],	%f11
	subcc	%g2,	%o2,	%g6
loop_39:
	fmul8x16au	%f9,	%f0,	%f4
loop_40:
	sth	%i1,	[%l7 + 0x36]
	fmovdvs	%icc,	%f8,	%f11
	bg,a	loop_41
	brnz,a	%i0,	loop_42
	ldsb	[%l7 + 0x43],	%g1
	ldsw	[%l7 + 0x2C],	%l4
loop_41:
	stx	%l0,	[%l7 + 0x40]
loop_42:
	ldsw	[%l7 + 0x3C],	%l3
	movneg	%icc,	%l2,	%o1
	udivx	%o0,	0x10B8,	%i4
	movn	%icc,	%g5,	%o6
	lduw	[%l7 + 0x44],	%l6
	stw	%i5,	[%l7 + 0x1C]
	fmovdpos	%icc,	%f1,	%f9
	set  0x0, %l0
	setx loop_43, %l0, %l1
	jmpl %l1, %o4
	ldub	[%l7 + 0x34],	%l1
	edge16ln	%g4,	%l5,	%g3
	fmovde	%icc,	%f5,	%f12
loop_43:
	movcc	%xcc,	%i3,	%i7
	fbo	%fcc1,	loop_44
	fcmpd	%fcc1,	%f8,	%f10
	movcc	%icc,	%o5,	%o7
	fble,a	%fcc0,	loop_45
loop_44:
	stb	%g7,	[%l7 + 0x55]
	fxors	%f0,	%f11,	%f9
	fpack32	%f10,	%f8,	%f8
loop_45:
	xorcc	%o3,	%i2,	%g2
	ldub	[%l7 + 0x1E],	%i6
	stb	%g6,	[%l7 + 0x0A]
	fpsub32	%f6,	%f4,	%f12
	edge32	%i1,	%o2,	%g1
	fbl,a	%fcc3,	loop_46
	brz	%l4,	loop_47
	fmovdcc	%xcc,	%f10,	%f0
	fmovrslez	%i0,	%f1,	%f14
loop_46:
	fnor	%f14,	%f8,	%f10
loop_47:
	fbul	%fcc1,	loop_48
	fbug	%fcc3,	loop_49
	fmovrsgez	%l0,	%f5,	%f10
	lduw	[%l7 + 0x38],	%l2
loop_48:
	bvs,a	%icc,	loop_50
loop_49:
	fsrc1	%f2,	%f12
	edge32	%o1,	%l3,	%i4
	lduh	[%l7 + 0x38],	%g5
loop_50:
	brlz	%o6,	loop_51
	fbn,a	%fcc0,	loop_52
	stw	%o0,	[%l7 + 0x0C]
	xnorcc	%l6,	0x195B,	%o4
loop_51:
	fble,a	%fcc0,	loop_53
loop_52:
	fpsub32s	%f1,	%f15,	%f15
	fbne,a	%fcc0,	loop_54
	ld	[%l7 + 0x28],	%f6
loop_53:
	fmovrdlez	%l1,	%f12,	%f10
	fmovsle	%icc,	%f15,	%f1
loop_54:
	fbge,a	%fcc2,	loop_55
	ldsb	[%l7 + 0x62],	%i5
	fmovsle	%icc,	%f1,	%f4
	fandnot2	%f4,	%f14,	%f6
loop_55:
	ldx	[%l7 + 0x20],	%g4
	stx	%l5,	[%l7 + 0x08]
	edge32l	%i3,	%g3,	%i7
	fabss	%f9,	%f3
	subccc	%o7,	%o5,	%g7
	lduw	[%l7 + 0x74],	%i2
	lduw	[%l7 + 0x58],	%o3
	fpadd32	%f0,	%f14,	%f14
	alignaddrl	%g2,	%i6,	%i1
	movrlz	%g6,	0x08B,	%g1
	fpsub32s	%f12,	%f11,	%f13
	brz,a	%l4,	loop_56
	fblg,a	%fcc3,	loop_57
	fbue	%fcc1,	loop_58
	fpsub32	%f4,	%f2,	%f6
loop_56:
	fmovse	%icc,	%f9,	%f3
loop_57:
	srl	%i0,	%l0,	%o2
loop_58:
	brz	%l2,	loop_59
	ldsb	[%l7 + 0x2E],	%o1
	ldsb	[%l7 + 0x60],	%i4
	fbe	%fcc2,	loop_60
loop_59:
	lduh	[%l7 + 0x1E],	%g5
	fandnot2	%f2,	%f4,	%f6
	fmovscc	%xcc,	%f12,	%f6
loop_60:
	movl	%icc,	%o6,	%o0
	fmovdleu	%icc,	%f11,	%f4
	bge,pt	%icc,	loop_61
	and	%l6,	%o4,	%l3
	fones	%f1
	ldx	[%l7 + 0x30],	%i5
loop_61:
	fmovsge	%icc,	%f6,	%f14
	ldd	[%l7 + 0x38],	%f10
	edge16l	%l1,	%l5,	%i3
	fbu	%fcc2,	loop_62
	fble	%fcc3,	loop_63
	fmovrslez	%g3,	%f14,	%f7
	fmovsle	%xcc,	%f1,	%f4
loop_62:
	ldub	[%l7 + 0x64],	%i7
loop_63:
	fmul8x16au	%f1,	%f3,	%f12
	std	%f8,	[%l7 + 0x28]
	movg	%icc,	%g4,	%o7
	fcmple32	%f6,	%f10,	%g7
	bne,a,pn	%icc,	loop_64
	fbne	%fcc2,	loop_65
	fmuld8ulx16	%f5,	%f14,	%f10
	brlz	%i2,	loop_66
loop_64:
	fmovdne	%icc,	%f15,	%f3
loop_65:
	ldd	[%l7 + 0x78],	%f12
	stw	%o5,	[%l7 + 0x3C]
loop_66:
	movvc	%icc,	%o3,	%i6
	fbu	%fcc2,	loop_67
	fbul	%fcc3,	loop_68
	fmovdvs	%xcc,	%f9,	%f6
	fbule	%fcc1,	loop_69
loop_67:
	edge32	%g2,	%i1,	%g6
loop_68:
	ldsw	[%l7 + 0x7C],	%l4
	edge16n	%g1,	%i0,	%l0
loop_69:
	orn	%l2,	%o2,	%i4
	andcc	%o1,	%g5,	%o0
	ba,pt	%xcc,	loop_70
	edge8n	%l6,	%o4,	%o6
	fble	%fcc1,	loop_71
	bvs,pn	%icc,	loop_72
loop_70:
	fpack32	%f10,	%f0,	%f4
	ldsb	[%l7 + 0x7F],	%l3
loop_71:
	add	%l1,	0x1F3F,	%l5
loop_72:
	ldd	[%l7 + 0x08],	%f0
	srax	%i5,	0x04,	%g3
	fpsub32	%f12,	%f4,	%f0
	fmovdvc	%icc,	%f15,	%f15
	subcc	%i3,	0x046E,	%g4
	ble,a	loop_73
	stb	%o7,	[%l7 + 0x44]
	bl,a,pn	%icc,	loop_74
	for	%f8,	%f4,	%f6
loop_73:
	stw	%i7,	[%l7 + 0x5C]
	fmovsge	%icc,	%f11,	%f9
loop_74:
	fbge,a	%fcc2,	loop_75
	fone	%f10
	sth	%g7,	[%l7 + 0x38]
	ldsb	[%l7 + 0x7E],	%i2
loop_75:
	brgz,a	%o5,	loop_76
	brlz	%o3,	loop_77
	fcmpgt32	%f0,	%f8,	%i6
	stx	%i1,	[%l7 + 0x50]
loop_76:
	bge,a,pt	%xcc,	loop_78
loop_77:
	orncc	%g6,	%l4,	%g1
	stw	%i0,	[%l7 + 0x38]
	edge16n	%g2,	%l0,	%o2
loop_78:
	bvs,a	%xcc,	loop_79
	fmul8sux16	%f14,	%f8,	%f0
	sdivx	%i4,	0x0576,	%l2
	bge,a	%icc,	loop_80
loop_79:
	sub	%g5,	%o0,	%o1
	fmovrsne	%o4,	%f2,	%f9
	st	%f3,	[%l7 + 0x78]
loop_80:
	fmovrsgz	%o6,	%f9,	%f7
	fzero	%f8
	movpos	%icc,	%l6,	%l1
	movrne	%l3,	0x0CB,	%l5
	fcmpeq16	%f10,	%f8,	%g3
	ldx	[%l7 + 0x08],	%i5
	fmovscc	%xcc,	%f14,	%f7
	popc	%g4,	%i3
	fble	%fcc1,	loop_81
	movneg	%icc,	%i7,	%o7
	st	%f4,	[%l7 + 0x30]
	stb	%g7,	[%l7 + 0x0D]
loop_81:
	mulscc	%i2,	%o3,	%o5
	lduh	[%l7 + 0x0A],	%i6
	fornot2	%f2,	%f4,	%f0
	xor	%g6,	%l4,	%g1
	faligndata	%f12,	%f12,	%f10
	fbg	%fcc2,	loop_82
	fmuld8sux16	%f6,	%f8,	%f0
	stw	%i0,	[%l7 + 0x7C]
	fmovsg	%icc,	%f7,	%f9
loop_82:
	movvs	%xcc,	%g2,	%i1
	ldd	[%l7 + 0x50],	%f14
	sdiv	%o2,	0x1DF7,	%l0
	fbne,a	%fcc3,	loop_83
	stb	%l2,	[%l7 + 0x5F]
	fmovscc	%icc,	%f8,	%f14
	fcmpeq16	%f14,	%f6,	%g5
loop_83:
	std	%f4,	[%l7 + 0x50]
	be,pt	%xcc,	loop_84
	lduw	[%l7 + 0x14],	%o0
	bcc	%xcc,	loop_85
	andncc	%i4,	%o1,	%o4
loop_84:
	brgez	%l6,	loop_86
	ldub	[%l7 + 0x2E],	%l1
loop_85:
	ldd	[%l7 + 0x58],	%f2
	fnegs	%f8,	%f8
loop_86:
	fmul8x16	%f9,	%f14,	%f0
	fmovrsgz	%o6,	%f10,	%f12
	fmovrdne	%l5,	%f2,	%f8
	fbg,a	%fcc2,	loop_87
	brz,a	%g3,	loop_88
	ldsh	[%l7 + 0x40],	%l3
	sub	%g4,	%i5,	%i7
loop_87:
	fmovspos	%xcc,	%f13,	%f11
loop_88:
	fxnor	%f12,	%f4,	%f6
	bvc,a,pn	%icc,	loop_89
	popc	0x1E50,	%o7
	sll	%i3,	%i2,	%o3
	fbn	%fcc3,	loop_90
loop_89:
	brnz,a	%o5,	loop_91
	edge16ln	%g7,	%i6,	%g6
	udiv	%l4,	0x1EE3,	%i0
loop_90:
	sethi	0x129B,	%g1
loop_91:
	fxor	%f8,	%f14,	%f6
	fbu	%fcc1,	loop_92
	ldsh	[%l7 + 0x0A],	%i1
	brlez	%g2,	loop_93
	fsrc1	%f6,	%f6
loop_92:
	sub	%l0,	0x1F8C,	%o2
	ldsh	[%l7 + 0x12],	%l2
loop_93:
	smulcc	%o0,	0x07DE,	%i4
	fnot1	%f0,	%f6
	sllx	%o1,	%o4,	%l6
	fba,a	%fcc0,	loop_94
	fpadd32	%f0,	%f14,	%f12
	fbu,a	%fcc0,	loop_95
	stw	%g5,	[%l7 + 0x6C]
loop_94:
	fmovdne	%xcc,	%f14,	%f13
	fpack16	%f8,	%f8
loop_95:
	smul	%o6,	0x03ED,	%l5
	andn	%l1,	0x13E2,	%l3
	lduh	[%l7 + 0x0E],	%g4
	bneg,pn	%xcc,	loop_96
	fcmpgt16	%f8,	%f12,	%i5
	movneg	%xcc,	%i7,	%g3
	stb	%o7,	[%l7 + 0x10]
loop_96:
	brlz,a	%i2,	loop_97
	addccc	%o3,	0x12F3,	%o5
	sth	%g7,	[%l7 + 0x44]
	fxnors	%f13,	%f12,	%f12
loop_97:
	popc	0x0867,	%i6
	fbl,a	%fcc3,	loop_98
	be,a	%icc,	loop_99
	stx	%g6,	[%l7 + 0x08]
	fmovsgu	%icc,	%f11,	%f13
loop_98:
	movge	%xcc,	%l4,	%i3
loop_99:
	brlez	%i0,	loop_100
	fcmpeq16	%f8,	%f6,	%g1
	bl,pn	%xcc,	loop_101
	movcc	%icc,	%i1,	%g2
loop_100:
	ldsb	[%l7 + 0x13],	%l0
	sth	%l2,	[%l7 + 0x6A]
loop_101:
	call	loop_102
	movrgez	%o0,	%o2,	%o1
	srax	%o4,	%l6,	%i4
	fmovsge	%icc,	%f12,	%f11
loop_102:
	fcmpgt32	%f4,	%f6,	%g5
	fbue,a	%fcc2,	loop_103
	or	%l5,	%l1,	%o6
	edge32	%g4,	%l3,	%i5
	sth	%i7,	[%l7 + 0x62]
loop_103:
	fmovdg	%icc,	%f10,	%f6
	sth	%o7,	[%l7 + 0x2A]
	lduh	[%l7 + 0x6C],	%g3
	bne	loop_104
	ldsw	[%l7 + 0x0C],	%o3
	st	%f15,	[%l7 + 0x38]
	edge16	%i2,	%o5,	%i6
loop_104:
	be,a,pn	%xcc,	loop_105
	sth	%g6,	[%l7 + 0x3E]
	brnz	%l4,	loop_106
	alignaddrl	%i3,	%g7,	%g1
loop_105:
	bgu,a	%xcc,	loop_107
	stx	%i0,	[%l7 + 0x38]
loop_106:
	movvs	%icc,	%i1,	%g2
	movrlez	%l2,	0x270,	%l0
loop_107:
	std	%f12,	[%l7 + 0x18]
	fandnot1s	%f3,	%f9,	%f3
	fcmps	%fcc2,	%f14,	%f12
	ld	[%l7 + 0x34],	%f0
	st	%f0,	[%l7 + 0x1C]
	fcmpgt32	%f6,	%f4,	%o2
	fbe	%fcc1,	loop_108
	fmovdvs	%xcc,	%f12,	%f9
	movre	%o0,	0x160,	%o4
	fmovdpos	%xcc,	%f8,	%f14
loop_108:
	addcc	%l6,	0x14E9,	%o1
	fmovse	%xcc,	%f13,	%f14
	subcc	%g5,	0x016E,	%l5
	ldsb	[%l7 + 0x43],	%l1
	smulcc	%o6,	%g4,	%l3
	fbug	%fcc1,	loop_109
	fnot2	%f8,	%f0
	brz	%i5,	loop_110
	brgz,a	%i4,	loop_111
loop_109:
	lduw	[%l7 + 0x54],	%i7
	fandnot2	%f0,	%f6,	%f4
loop_110:
	bcc,a,pn	%xcc,	loop_112
loop_111:
	brgez,a	%o7,	loop_113
	fbul,a	%fcc0,	loop_114
	ld	[%l7 + 0x2C],	%f0
loop_112:
	edge8ln	%o3,	%g3,	%o5
loop_113:
	fmovsne	%xcc,	%f8,	%f0
loop_114:
	stb	%i2,	[%l7 + 0x65]
	movcc	%xcc,	%i6,	%l4
	ldsw	[%l7 + 0x74],	%g6
	smulcc	%g7,	%g1,	%i3
	andcc	%i1,	0x1174,	%g2
	edge8	%l2,	%l0,	%i0
	ldx	[%l7 + 0x18],	%o0
	fmuld8ulx16	%f0,	%f7,	%f10
	movrgz	%o4,	%o2,	%l6
	fbu,a	%fcc0,	loop_115
	andn	%o1,	0x039F,	%g5
	orncc	%l1,	%o6,	%l5
	ldd	[%l7 + 0x60],	%f4
loop_115:
	fmovrsgz	%l3,	%f6,	%f9
	lduh	[%l7 + 0x3E],	%g4
	fbo,a	%fcc1,	loop_116
	st	%f4,	[%l7 + 0x7C]
	movcc	%xcc,	%i5,	%i4
	movvs	%icc,	%o7,	%o3
loop_116:
	fpadd16	%f10,	%f4,	%f6
	movcc	%xcc,	%g3,	%o5
	ldd	[%l7 + 0x30],	%f4
	subc	%i2,	%i7,	%i6
	bl	loop_117
	bcs,a,pt	%xcc,	loop_118
	lduw	[%l7 + 0x0C],	%l4
	fmovrdne	%g6,	%f12,	%f2
loop_117:
	addccc	%g1,	0x10EB,	%g7
loop_118:
	edge32l	%i3,	%i1,	%l2
	fmuld8ulx16	%f1,	%f5,	%f14
	xnor	%g2,	%i0,	%o0
	movne	%icc,	%o4,	%o2
	fbul,a	%fcc2,	loop_119
	lduw	[%l7 + 0x5C],	%l0
	fbue	%fcc1,	loop_120
	fcmpeq16	%f2,	%f8,	%l6
loop_119:
	movneg	%icc,	%o1,	%l1
	fmovse	%xcc,	%f6,	%f3
loop_120:
	fmul8x16au	%f10,	%f9,	%f4
	std	%f4,	[%l7 + 0x40]
	fblg	%fcc3,	loop_121
	ldd	[%l7 + 0x10],	%f0
	fbue,a	%fcc2,	loop_122
	bvc	%icc,	loop_123
loop_121:
	fxors	%f4,	%f14,	%f0
	fmovrdlz	%o6,	%f0,	%f10
loop_122:
	stb	%g5,	[%l7 + 0x23]
loop_123:
	brgz	%l5,	loop_124
	movrne	%l3,	0x25E,	%i5
	movle	%xcc,	%g4,	%o7
	movrgz	%o3,	0x3F8,	%g3
loop_124:
	xnor	%i4,	%i2,	%i7
	srlx	%o5,	%l4,	%i6
	fbe,a	%fcc2,	loop_125
	alignaddr	%g1,	%g6,	%i3
	ld	[%l7 + 0x24],	%f4
	subc	%i1,	0x05D8,	%g7
loop_125:
	subccc	%l2,	%i0,	%g2
	sth	%o0,	[%l7 + 0x7A]
	set  0x0, %l0
	setx loop_126, %l0, %l1
	jmpl %l1, %o2
	ldd	[%l7 + 0x60],	%f10
	fmovrdlz	%l0,	%f0,	%f6
	ldsw	[%l7 + 0x4C],	%l6
loop_126:
	call	loop_127
	bl	%xcc,	loop_128
	fmovsvc	%xcc,	%f13,	%f7
	std	%f0,	[%l7 + 0x38]
loop_127:
	bcs,a	loop_129
loop_128:
	movcs	%icc,	%o1,	%o4
	sth	%o6,	[%l7 + 0x0A]
	ba,a,pt	%icc,	loop_130
loop_129:
	ld	[%l7 + 0x28],	%f3
	mulx	%l1,	0x090F,	%l5
	movle	%xcc,	%g5,	%l3
loop_130:
	sll	%i5,	%o7,	%g4
	fbue,a	%fcc1,	loop_131
	bn,pt	%xcc,	loop_132
	fmovsgu	%icc,	%f9,	%f9
	subcc	%o3,	%g3,	%i4
loop_131:
	ld	[%l7 + 0x78],	%f12
loop_132:
	movcs	%icc,	%i2,	%i7
	ble,a,pn	%icc,	loop_133
	lduh	[%l7 + 0x4E],	%o5
	fmovrdlez	%l4,	%f6,	%f12
	or	%i6,	%g1,	%i3
loop_133:
	smul	%g6,	0x03DC,	%i1
	edge32l	%g7,	%i0,	%l2
	movre	%o0,	0x29D,	%g2
	fcmple32	%f4,	%f8,	%l0
	be,a,pt	%icc,	loop_134
	fmovsvc	%xcc,	%f15,	%f10
	fbule,a	%fcc2,	loop_135
	movge	%xcc,	%l6,	%o2
loop_134:
	smulcc	%o1,	%o4,	%l1
	mova	%icc,	%o6,	%l5
loop_135:
	fnegd	%f6,	%f14
	lduw	[%l7 + 0x24],	%l3
	ldsw	[%l7 + 0x14],	%i5
	smulcc	%g5,	0x0F15,	%g4
	fbn,a	%fcc0,	loop_136
	ld	[%l7 + 0x70],	%f10
	brgz,a	%o3,	loop_137
	fcmpne16	%f10,	%f14,	%o7
loop_136:
	fmovdneg	%xcc,	%f8,	%f1
	subccc	%i4,	%i2,	%i7
loop_137:
	bcs,pn	%xcc,	loop_138
	movrne	%g3,	0x36F,	%o5
	andcc	%i6,	%g1,	%l4
	fba	%fcc3,	loop_139
loop_138:
	stw	%g6,	[%l7 + 0x18]
	ldub	[%l7 + 0x3A],	%i1
	fbu	%fcc0,	loop_140
loop_139:
	udiv	%g7,	0x038A,	%i3
	fnot2s	%f10,	%f2
	fmovrslz	%i0,	%f5,	%f0
loop_140:
	bne,a,pt	%icc,	loop_141
	fxnor	%f4,	%f0,	%f8
	sth	%o0,	[%l7 + 0x36]
	fnot1s	%f6,	%f10
loop_141:
	ldsb	[%l7 + 0x25],	%g2
	bvs,a,pn	%xcc,	loop_142
	movcs	%xcc,	%l2,	%l6
	brlz	%l0,	loop_143
	stx	%o1,	[%l7 + 0x08]
loop_142:
	set  0x0, %l0
	setx loop_144, %l0, %l1
	jmpl %l1, %o2
	ldub	[%l7 + 0x0E],	%l1
loop_143:
	bl,a,pn	%xcc,	loop_145
	movleu	%icc,	%o4,	%l5
loop_144:
	stw	%l3,	[%l7 + 0x64]
	ldsw	[%l7 + 0x78],	%i5
loop_145:
	ld	[%l7 + 0x68],	%f9
	fmovdne	%icc,	%f13,	%f9
	brz,a	%g5,	loop_146
	srl	%g4,	0x10,	%o6
	fmovsa	%xcc,	%f8,	%f10
	fbu	%fcc1,	loop_147
loop_146:
	fpadd16	%f14,	%f14,	%f6
	subc	%o7,	%o3,	%i2
	fzeros	%f10
loop_147:
	fmovsvc	%xcc,	%f8,	%f6
	stw	%i4,	[%l7 + 0x48]
	movn	%icc,	%g3,	%o5
	fsrc2s	%f7,	%f6
	fblg	%fcc3,	loop_148
	fcmpne16	%f10,	%f12,	%i6
	andcc	%g1,	0x12AA,	%i7
	fmovda	%icc,	%f6,	%f7
loop_148:
	fbn,a	%fcc2,	loop_149
	movcs	%icc,	%g6,	%i1
	edge16l	%l4,	%g7,	%i0
	fmovrdgez	%o0,	%f14,	%f6
loop_149:
	fbg	%fcc1,	loop_150
	xnorcc	%g2,	%i3,	%l2
	bvs	%xcc,	loop_151
	std	%f2,	[%l7 + 0x40]
loop_150:
	fmovrdlez	%l0,	%f4,	%f4
	std	%f10,	[%l7 + 0x10]
loop_151:
	fnot1	%f14,	%f14
	fabss	%f1,	%f13
	fnot1	%f14,	%f4
	stb	%o1,	[%l7 + 0x48]
	bcs,a	%icc,	loop_152
	bl,pn	%icc,	loop_153
	sth	%o2,	[%l7 + 0x1C]
	fmuld8ulx16	%f13,	%f14,	%f2
loop_152:
	brlez,a	%l1,	loop_154
loop_153:
	orncc	%l6,	%o4,	%l5
	fmul8x16au	%f10,	%f12,	%f10
	subccc	%l3,	0x1A44,	%i5
loop_154:
	fcmped	%fcc3,	%f12,	%f4
	movrlz	%g4,	0x127,	%g5
	fmovde	%xcc,	%f0,	%f4
	fmovsvc	%xcc,	%f1,	%f13
	fmovdne	%xcc,	%f10,	%f13
	subccc	%o6,	%o3,	%i2
	bne	loop_155
	fba	%fcc0,	loop_156
	srax	%o7,	0x19,	%i4
	fpsub16s	%f15,	%f7,	%f15
loop_155:
	movvc	%icc,	%o5,	%i6
loop_156:
	fbl	%fcc0,	loop_157
	addccc	%g1,	%g3,	%i7
	bg,a	loop_158
	std	%f0,	[%l7 + 0x70]
loop_157:
	sub	%i1,	%l4,	%g6
	ldsh	[%l7 + 0x78],	%i0
loop_158:
	brnz,a	%o0,	loop_159
	fmovscs	%icc,	%f3,	%f0
	fand	%f8,	%f12,	%f12
	edge16n	%g2,	%g7,	%l2
loop_159:
	ldx	[%l7 + 0x70],	%l0
	std	%f12,	[%l7 + 0x20]
	ldd	[%l7 + 0x40],	%f2
	fsrc1	%f4,	%f8
	edge16	%i3,	%o1,	%o2
	edge32l	%l6,	%o4,	%l5
	bvs,a,pt	%xcc,	loop_160
	ldsw	[%l7 + 0x18],	%l1
	ldsb	[%l7 + 0x44],	%i5
	fmovrsgz	%g4,	%f5,	%f11
loop_160:
	sth	%l3,	[%l7 + 0x66]
	mulx	%o6,	0x04FD,	%g5
	fbu,a	%fcc2,	loop_161
	ldx	[%l7 + 0x20],	%i2
	fornot1	%f12,	%f12,	%f8
	fmovrde	%o7,	%f14,	%f4
loop_161:
	fmovsne	%xcc,	%f1,	%f13
	fmovdg	%icc,	%f3,	%f7
	ldx	[%l7 + 0x08],	%o3
	bg,a	%xcc,	loop_162
	fmovrsgz	%o5,	%f7,	%f13
	fpadd16s	%f3,	%f14,	%f12
	ble,a,pt	%icc,	loop_163
loop_162:
	movrlz	%i4,	%g1,	%g3
	fbue,a	%fcc2,	loop_164
	ldx	[%l7 + 0x38],	%i7
loop_163:
	orn	%i6,	%l4,	%i1
	stb	%g6,	[%l7 + 0x49]
loop_164:
	std	%f6,	[%l7 + 0x10]
	edge16n	%i0,	%o0,	%g7
	fmovdpos	%xcc,	%f7,	%f0
	fbe,a	%fcc2,	loop_165
	movrlz	%g2,	0x0D7,	%l2
	bcs	%xcc,	loop_166
	ldub	[%l7 + 0x1E],	%i3
loop_165:
	ldsw	[%l7 + 0x6C],	%o1
	fmovdneg	%icc,	%f5,	%f14
loop_166:
	fcmpne16	%f12,	%f14,	%l0
	fbo,a	%fcc0,	loop_167
	fmovrdlez	%o2,	%f8,	%f6
	orncc	%o4,	0x03A1,	%l5
	fandnot1	%f2,	%f2,	%f4
loop_167:
	stb	%l1,	[%l7 + 0x33]
	srlx	%i5,	%l6,	%l3
	ldd	[%l7 + 0x70],	%f12
	edge32l	%g4,	%g5,	%i2
	fmovsa	%icc,	%f13,	%f9
	stx	%o7,	[%l7 + 0x08]
	movrlz	%o6,	0x1BF,	%o5
	std	%f8,	[%l7 + 0x68]
	sth	%i4,	[%l7 + 0x18]
	umulcc	%g1,	%g3,	%i7
	ldsw	[%l7 + 0x7C],	%o3
	stw	%i6,	[%l7 + 0x78]
	st	%f2,	[%l7 + 0x08]
	sth	%l4,	[%l7 + 0x50]
	movrlz	%g6,	0x25A,	%i1
	fmovsvc	%icc,	%f2,	%f11
	fmovdvs	%xcc,	%f4,	%f3
	fones	%f14
	st	%f14,	[%l7 + 0x74]
	std	%f2,	[%l7 + 0x58]
	fmovrsne	%o0,	%f3,	%f11
	ldd	[%l7 + 0x60],	%f2
	brlz,a	%g7,	loop_168
	umulcc	%i0,	0x1D77,	%l2
	edge32	%g2,	%o1,	%l0
	fnegs	%f10,	%f9
loop_168:
	st	%f14,	[%l7 + 0x2C]
	fmovdcc	%icc,	%f1,	%f2
	fble	%fcc0,	loop_169
	stb	%o2,	[%l7 + 0x47]
	movg	%icc,	%i3,	%o4
	bpos,a,pn	%icc,	loop_170
loop_169:
	brz	%l1,	loop_171
	ldx	[%l7 + 0x60],	%l5
	fmovdl	%xcc,	%f0,	%f1
loop_170:
	movcs	%xcc,	%l6,	%l3
loop_171:
	fnand	%f6,	%f6,	%f2
	ldsb	[%l7 + 0x1C],	%g4
	ldsw	[%l7 + 0x24],	%i5
	fmovrdlez	%i2,	%f14,	%f14
	fbe,a	%fcc3,	loop_172
	ld	[%l7 + 0x58],	%f12
	fnegs	%f0,	%f1
	fnor	%f10,	%f4,	%f4
loop_172:
	fbue	%fcc3,	loop_173
	brlez,a	%g5,	loop_174
	stx	%o7,	[%l7 + 0x28]
	fabsd	%f8,	%f6
loop_173:
	movge	%xcc,	%o6,	%o5
loop_174:
	add	%i4,	0x0951,	%g1
	fmovsne	%icc,	%f1,	%f5
	fsrc1	%f14,	%f4
	ldd	[%l7 + 0x58],	%f4
	mulscc	%g3,	0x1D2A,	%o3
	fpack32	%f14,	%f2,	%f8
	ble,pt	%xcc,	loop_175
	ldsh	[%l7 + 0x42],	%i6
	fbg,a	%fcc0,	loop_176
	fmovsleu	%xcc,	%f9,	%f9
loop_175:
	bvs	loop_177
	andncc	%i7,	%g6,	%l4
loop_176:
	ldsb	[%l7 + 0x69],	%i1
	stb	%g7,	[%l7 + 0x0A]
loop_177:
	fbul,a	%fcc1,	loop_178
	brlz	%i0,	loop_179
	bcs	loop_180
	fbuge,a	%fcc1,	loop_181
loop_178:
	fnands	%f7,	%f0,	%f5
loop_179:
	ldub	[%l7 + 0x56],	%o0
loop_180:
	fmovsvc	%xcc,	%f14,	%f13
loop_181:
	udivx	%g2,	0x08BE,	%o1
	std	%f4,	[%l7 + 0x60]
	fand	%f12,	%f0,	%f14
	ldsw	[%l7 + 0x10],	%l0
	sllx	%o2,	%l2,	%o4
	subc	%l1,	%l5,	%l6
	bcs,pn	%icc,	loop_182
	fsrc1s	%f1,	%f0
	fcmpeq16	%f6,	%f12,	%l3
	ldd	[%l7 + 0x50],	%f0
loop_182:
	fbl,a	%fcc1,	loop_183
	fbn,a	%fcc1,	loop_184
	fmovse	%icc,	%f10,	%f12
	ldsh	[%l7 + 0x56],	%i3
loop_183:
	or	%g4,	0x183B,	%i2
loop_184:
	ldd	[%l7 + 0x68],	%f6
	bvs,pn	%xcc,	loop_185
	fbul	%fcc2,	loop_186
	andn	%i5,	%g5,	%o6
	mulx	%o5,	0x071A,	%i4
loop_185:
	bpos,a	%icc,	loop_187
loop_186:
	fbg,a	%fcc0,	loop_188
	movg	%xcc,	%g1,	%g3
	movrlez	%o3,	0x22B,	%i6
loop_187:
	movrlez	%o7,	%i7,	%l4
loop_188:
	addcc	%i1,	%g7,	%i0
	fmovdvc	%icc,	%f8,	%f6
	fandnot1s	%f8,	%f15,	%f11
	faligndata	%f6,	%f0,	%f2
	lduh	[%l7 + 0x54],	%o0
	fpadd32	%f14,	%f14,	%f8
	edge16n	%g2,	%g6,	%l0
	fnot1	%f14,	%f0
	bg,a	loop_189
	ldsb	[%l7 + 0x7F],	%o1
	st	%f6,	[%l7 + 0x58]
	movne	%icc,	%l2,	%o2
loop_189:
	fmovdvs	%xcc,	%f10,	%f8
	std	%f2,	[%l7 + 0x28]
	fmovdcs	%icc,	%f0,	%f5
	bg	loop_190
	fmovsl	%icc,	%f11,	%f15
	fbe,a	%fcc3,	loop_191
	call	loop_192
loop_190:
	std	%f2,	[%l7 + 0x68]
	brgez	%o4,	loop_193
loop_191:
	movvc	%icc,	%l5,	%l1
loop_192:
	fba,a	%fcc0,	loop_194
	sth	%l6,	[%l7 + 0x54]
loop_193:
	ldsh	[%l7 + 0x48],	%l3
	sth	%i3,	[%l7 + 0x68]
loop_194:
	fbl,a	%fcc3,	loop_195
	fmovrdlez	%i2,	%f12,	%f8
	bvs,a,pt	%icc,	loop_196
	sth	%i5,	[%l7 + 0x34]
loop_195:
	ble,a	loop_197
	lduh	[%l7 + 0x60],	%g5
loop_196:
	fcmps	%fcc1,	%f2,	%f6
	fnot1	%f2,	%f10
loop_197:
	fpsub32s	%f6,	%f4,	%f13
	std	%f0,	[%l7 + 0x08]
	bne,a,pn	%icc,	loop_198
	fzero	%f12
	lduh	[%l7 + 0x26],	%o6
	udiv	%g4,	0x1B61,	%o5
loop_198:
	xnor	%i4,	%g1,	%g3
	bleu,pt	%xcc,	loop_199
	ldsw	[%l7 + 0x68],	%i6
	sra	%o3,	0x19,	%i7
	movne	%icc,	%o7,	%l4
loop_199:
	fpsub32	%f6,	%f0,	%f4
	stx	%i1,	[%l7 + 0x38]
	fsrc1	%f6,	%f0
	subcc	%g7,	0x00B8,	%i0
	ble	%icc,	loop_200
	fnands	%f4,	%f5,	%f15
	fmovdpos	%xcc,	%f13,	%f6
	ba	%xcc,	loop_201
loop_200:
	addccc	%o0,	0x1DAD,	%g6
	fcmpne16	%f10,	%f10,	%g2
	fpadd16s	%f5,	%f9,	%f14
loop_201:
	fsrc2	%f2,	%f6
	fmovdn	%xcc,	%f0,	%f2
	movrlz	%o1,	0x01A,	%l2
	mova	%icc,	%o2,	%o4
	edge16l	%l5,	%l1,	%l6
	fmovrslz	%l0,	%f2,	%f6
	fbule,a	%fcc1,	loop_202
	fmovrdlz	%l3,	%f6,	%f14
	fmovd	%f14,	%f8
	movg	%icc,	%i2,	%i5
loop_202:
	bcc,a,pn	%xcc,	loop_203
	ldsb	[%l7 + 0x59],	%g5
	edge16n	%i3,	%g4,	%o6
	bvc,pn	%xcc,	loop_204
loop_203:
	movn	%xcc,	%o5,	%i4
	movgu	%icc,	%g1,	%g3
	fandnot2s	%f2,	%f10,	%f0
loop_204:
	movne	%icc,	%i6,	%o3
	brlez,a	%o7,	loop_205
	ld	[%l7 + 0x40],	%f15
	ldsw	[%l7 + 0x48],	%l4
	for	%f8,	%f12,	%f8
loop_205:
	bl	loop_206
	mova	%icc,	%i1,	%i7
	fbul,a	%fcc2,	loop_207
	fmovrdlz	%i0,	%f6,	%f10
loop_206:
	movle	%icc,	%g7,	%o0
	ldsb	[%l7 + 0x2D],	%g2
loop_207:
	call	loop_208
	fmovsl	%xcc,	%f0,	%f4
	fmovdg	%icc,	%f7,	%f13
	xor	%o1,	0x1A83,	%g6
loop_208:
	ba,pn	%xcc,	loop_209
	movrlz	%l2,	%o4,	%o2
	fpadd32	%f6,	%f6,	%f4
	ld	[%l7 + 0x68],	%f14
loop_209:
	movl	%icc,	%l1,	%l6
	bleu,a	loop_210
	lduh	[%l7 + 0x38],	%l0
	fbe,a	%fcc3,	loop_211
	lduw	[%l7 + 0x74],	%l5
loop_210:
	fble	%fcc2,	loop_212
	bleu,pn	%xcc,	loop_213
loop_211:
	st	%f13,	[%l7 + 0x44]
	bg	%icc,	loop_214
loop_212:
	fbu	%fcc0,	loop_215
loop_213:
	fble	%fcc3,	loop_216
	ble	loop_217
loop_214:
	ldx	[%l7 + 0x30],	%l3
loop_215:
	fors	%f9,	%f8,	%f3
loop_216:
	lduh	[%l7 + 0x38],	%i2
loop_217:
	fmovscc	%xcc,	%f4,	%f5
	fmovsa	%icc,	%f14,	%f3
	fabsd	%f8,	%f2
	fbne,a	%fcc2,	loop_218
	brz	%i5,	loop_219
	fcmpd	%fcc3,	%f10,	%f6
	lduh	[%l7 + 0x08],	%g5
loop_218:
	ld	[%l7 + 0x1C],	%f15
loop_219:
	fnegs	%f8,	%f6
	brz,a	%g4,	loop_220
	bg	loop_221
	edge8	%i3,	%o5,	%o6
	mulscc	%g1,	0x1194,	%i4
loop_220:
	fnands	%f15,	%f8,	%f7
loop_221:
	subccc	%i6,	%o3,	%g3
	alignaddrl	%l4,	%i1,	%o7
	fmovde	%icc,	%f4,	%f9
	fmul8x16	%f7,	%f10,	%f2
	fbn	%fcc2,	loop_222
	fbg	%fcc2,	loop_223
	stb	%i7,	[%l7 + 0x16]
	fbo,a	%fcc1,	loop_224
loop_222:
	be,a,pn	%xcc,	loop_225
loop_223:
	udivcc	%g7,	0x0362,	%i0
	fbn	%fcc0,	loop_226
loop_224:
	srl	%o0,	%g2,	%o1
loop_225:
	bn,a	%xcc,	loop_227
	bcc,a,pn	%xcc,	loop_228
loop_226:
	brz,a	%g6,	loop_229
	alignaddr	%l2,	%o4,	%o2
loop_227:
	fcmpne32	%f2,	%f0,	%l1
loop_228:
	movre	%l6,	%l5,	%l3
loop_229:
	fxor	%f0,	%f10,	%f14
	xor	%l0,	0x1CA0,	%i5
	andn	%i2,	%g4,	%g5
	fpadd32	%f4,	%f12,	%f4
	ldx	[%l7 + 0x18],	%o5
	fmovrde	%o6,	%f6,	%f8
	fba	%fcc0,	loop_230
	fornot2s	%f10,	%f2,	%f7
	fcmple32	%f12,	%f4,	%g1
	fbule,a	%fcc2,	loop_231
loop_230:
	sth	%i4,	[%l7 + 0x1C]
	ldx	[%l7 + 0x28],	%i3
	fcmpne16	%f8,	%f8,	%o3
loop_231:
	fbuge,a	%fcc0,	loop_232
	stw	%g3,	[%l7 + 0x24]
	fmovdne	%icc,	%f10,	%f11
	fornot1	%f12,	%f0,	%f6
loop_232:
	fmovdge	%icc,	%f2,	%f6
	ld	[%l7 + 0x2C],	%f12
	sth	%l4,	[%l7 + 0x0C]
	lduw	[%l7 + 0x74],	%i6
	bpos,a,pt	%xcc,	loop_233
	stb	%i1,	[%l7 + 0x56]
	fcmpeq32	%f0,	%f4,	%o7
	faligndata	%f6,	%f6,	%f6
loop_233:
	brgz,a	%g7,	loop_234
	lduh	[%l7 + 0x7A],	%i0
	bpos	%xcc,	loop_235
	lduh	[%l7 + 0x0C],	%o0
loop_234:
	fnand	%f0,	%f10,	%f8
	fmul8x16au	%f2,	%f15,	%f8
loop_235:
	fmovrdgz	%g2,	%f8,	%f8
	udivx	%i7,	0x14AC,	%g6
	sth	%l2,	[%l7 + 0x28]
	movg	%icc,	%o4,	%o1
	fmovda	%xcc,	%f15,	%f15
	fabss	%f6,	%f11
	fcmpeq32	%f2,	%f0,	%o2
	mulx	%l1,	%l6,	%l3
	fmovsvc	%xcc,	%f2,	%f10
	srlx	%l0,	%i5,	%i2
	ldsh	[%l7 + 0x0A],	%l5
	ldsw	[%l7 + 0x40],	%g4
	smul	%g5,	0x13E6,	%o5
	std	%f14,	[%l7 + 0x18]
	lduw	[%l7 + 0x0C],	%o6
	udiv	%g1,	0x0E78,	%i3
	std	%f8,	[%l7 + 0x30]
	bcc,a	%xcc,	loop_236
	sll	%i4,	%o3,	%l4
	srax	%g3,	0x0E,	%i6
	ld	[%l7 + 0x74],	%f9
loop_236:
	fmovdcs	%icc,	%f5,	%f15
	mulscc	%o7,	%i1,	%g7
	ldub	[%l7 + 0x65],	%o0
	ldsw	[%l7 + 0x14],	%i0
	andn	%g2,	0x0A5E,	%i7
	ldsh	[%l7 + 0x74],	%g6
	fmovd	%f0,	%f8
	ldub	[%l7 + 0x25],	%l2
	movge	%xcc,	%o1,	%o2
	fbul	%fcc2,	loop_237
	edge16l	%o4,	%l6,	%l1
	movrgz	%l3,	%i5,	%l0
	stb	%i2,	[%l7 + 0x50]
loop_237:
	fmovrde	%l5,	%f4,	%f10
	lduw	[%l7 + 0x10],	%g5
	edge8ln	%g4,	%o5,	%g1
	fnot1s	%f10,	%f8
	ldub	[%l7 + 0x47],	%i3
	stx	%o6,	[%l7 + 0x70]
	or	%i4,	%o3,	%l4
	st	%f3,	[%l7 + 0x74]
	bneg,a	loop_238
	std	%f6,	[%l7 + 0x60]
	fabss	%f4,	%f14
	fsrc1s	%f15,	%f5
loop_238:
	or	%i6,	0x1CCF,	%g3
	be,pn	%xcc,	loop_239
	ldsb	[%l7 + 0x09],	%o7
	fbue	%fcc3,	loop_240
	fmuld8sux16	%f12,	%f6,	%f14
loop_239:
	bvc,a,pt	%icc,	loop_241
	fmovrslz	%i1,	%f9,	%f7
loop_240:
	fbue,a	%fcc3,	loop_242
	sdivcc	%o0,	0x058E,	%i0
loop_241:
	fornot1	%f12,	%f8,	%f6
	ldx	[%l7 + 0x08],	%g2
loop_242:
	std	%f12,	[%l7 + 0x70]
	lduw	[%l7 + 0x7C],	%g7
	set  0x0, %l0
	setx loop_243, %l0, %l1
	jmpl %l1, %g6
	brlz,a	%i7,	loop_244
	ldub	[%l7 + 0x2A],	%o1
	movge	%xcc,	%o2,	%o4
loop_243:
	bg,pt	%icc,	loop_245
loop_244:
	fmovrslz	%l6,	%f12,	%f11
	orncc	%l1,	%l2,	%i5
	fmovrsgez	%l3,	%f7,	%f14
loop_245:
	lduh	[%l7 + 0x4A],	%l0
	fpsub16s	%f11,	%f8,	%f11
	edge8	%l5,	%g5,	%i2
	edge16l	%o5,	%g4,	%i3
	ba,a	%icc,	loop_246
	movleu	%icc,	%o6,	%i4
	fmovscs	%xcc,	%f14,	%f10
	fcmple32	%f4,	%f8,	%o3
loop_246:
	movrgez	%l4,	%g1,	%i6
	umul	%o7,	0x084D,	%i1
	fbuge,a	%fcc3,	loop_247
	fmovdl	%xcc,	%f1,	%f7
	movne	%icc,	%g3,	%o0
	udiv	%g2,	0x1322,	%g7
loop_247:
	fmovsneg	%xcc,	%f6,	%f4
	lduw	[%l7 + 0x54],	%g6
	stw	%i7,	[%l7 + 0x44]
	stb	%o1,	[%l7 + 0x5D]
	fbul,a	%fcc1,	loop_248
	subcc	%o2,	%i0,	%l6
	ldub	[%l7 + 0x10],	%l1
	fmovsne	%icc,	%f11,	%f1
loop_248:
	add	%l2,	%i5,	%o4
	fmovsleu	%icc,	%f14,	%f15
	ldsb	[%l7 + 0x4E],	%l0
	mova	%icc,	%l5,	%g5
	bn	loop_249
	ld	[%l7 + 0x1C],	%f9
	fpadd16s	%f0,	%f13,	%f3
	ldsw	[%l7 + 0x2C],	%l3
loop_249:
	fbge,a	%fcc0,	loop_250
	fmovrslz	%i2,	%f6,	%f9
	bne,a,pt	%xcc,	loop_251
	fcmple16	%f0,	%f2,	%o5
loop_250:
	fpsub32	%f10,	%f10,	%f2
	ble,pn	%xcc,	loop_252
loop_251:
	srl	%g4,	%o6,	%i3
	fmovsgu	%icc,	%f9,	%f4
	fble	%fcc0,	loop_253
loop_252:
	fble,a	%fcc1,	loop_254
	movvc	%xcc,	%i4,	%l4
	ld	[%l7 + 0x48],	%f7
loop_253:
	ldsb	[%l7 + 0x43],	%o3
loop_254:
	fpadd32s	%f12,	%f8,	%f0
	movle	%icc,	%i6,	%g1
	fmovsne	%icc,	%f13,	%f13
	ldsb	[%l7 + 0x4B],	%i1
	bge	loop_255
	bcc,pt	%xcc,	loop_256
	edge16ln	%o7,	%o0,	%g3
	smul	%g7,	0x186D,	%g2
loop_255:
	fmul8x16	%f8,	%f6,	%f10
loop_256:
	bpos,a,pn	%xcc,	loop_257
	ldub	[%l7 + 0x4F],	%g6
	std	%f8,	[%l7 + 0x50]
	movn	%icc,	%o1,	%i7
loop_257:
	st	%f7,	[%l7 + 0x70]
	movvs	%icc,	%i0,	%o2
	ldsb	[%l7 + 0x5B],	%l1
	fmovsvc	%xcc,	%f7,	%f10
	ldsh	[%l7 + 0x0E],	%l6
	set  0x0, %l0
	setx loop_258, %l0, %l1
	jmpl %l1, %l2
	sll	%i5,	%l0,	%o4
	st	%f13,	[%l7 + 0x68]
	addc	%g5,	%l3,	%i2
loop_258:
	lduw	[%l7 + 0x70],	%l5
	fbg	%fcc2,	loop_259
	be,a	loop_260
	movpos	%icc,	%o5,	%o6
	fones	%f4
loop_259:
	fmovsn	%icc,	%f9,	%f13
loop_260:
	fmovrse	%i3,	%f8,	%f14
	movn	%xcc,	%i4,	%l4
	stx	%g4,	[%l7 + 0x60]
	edge16l	%o3,	%i6,	%g1
	stb	%o7,	[%l7 + 0x76]
	bpos,pt	%xcc,	loop_261
	ldub	[%l7 + 0x64],	%o0
	fcmple16	%f0,	%f10,	%i1
	fmovspos	%xcc,	%f3,	%f4
loop_261:
	ld	[%l7 + 0x2C],	%f8
	fzeros	%f13
	edge16n	%g3,	%g2,	%g6
	fblg	%fcc1,	loop_262
	movrgz	%g7,	%o1,	%i7
	bl,pt	%xcc,	loop_263
	fpadd16	%f14,	%f0,	%f12
loop_262:
	stb	%o2,	[%l7 + 0x25]
	brnz	%i0,	loop_264
loop_263:
	stx	%l1,	[%l7 + 0x70]
	brnz	%l2,	loop_265
	ldub	[%l7 + 0x74],	%i5
loop_264:
	fmovdcs	%xcc,	%f11,	%f11
	brgez,a	%l0,	loop_266
loop_265:
	fnot1	%f6,	%f2
	edge16n	%o4,	%l6,	%g5
	fmovrdne	%i2,	%f14,	%f2
loop_266:
	set  0x0, %l0
	setx loop_267, %l0, %l1
	jmpl %l1, %l3
	std	%f0,	[%l7 + 0x08]
	stx	%l5,	[%l7 + 0x60]
	fbule,a	%fcc2,	loop_268
loop_267:
	stb	%o6,	[%l7 + 0x5F]
	fmovse	%icc,	%f8,	%f3
	stw	%o5,	[%l7 + 0x24]
loop_268:
	sra	%i3,	0x0D,	%i4
	sethi	0x0BA7,	%l4
	be,a,pn	%icc,	loop_269
	brlz	%g4,	loop_270
	fmul8x16au	%f6,	%f13,	%f8
	ldd	[%l7 + 0x50],	%f6
loop_269:
	sth	%o3,	[%l7 + 0x46]
loop_270:
	brgez	%g1,	loop_271
	stw	%i6,	[%l7 + 0x4C]
	udivx	%o7,	0x0466,	%o0
	ld	[%l7 + 0x20],	%f9
loop_271:
	sth	%i1,	[%l7 + 0x50]
	andncc	%g3,	%g6,	%g7
	ldsb	[%l7 + 0x36],	%g2
	movge	%icc,	%o1,	%i7
	ldub	[%l7 + 0x75],	%i0
	brlz,a	%l1,	loop_272
	ldub	[%l7 + 0x0E],	%l2
	st	%f14,	[%l7 + 0x74]
	fbo	%fcc0,	loop_273
loop_272:
	ldd	[%l7 + 0x58],	%f10
	fmovrdgez	%i5,	%f6,	%f8
	fmovdcc	%icc,	%f7,	%f8
loop_273:
	ldx	[%l7 + 0x50],	%o2
	fmovdvs	%xcc,	%f12,	%f4
	ldub	[%l7 + 0x59],	%l0
	movvs	%icc,	%o4,	%g5
	fmovdg	%icc,	%f8,	%f14
	fbl	%fcc0,	loop_274
	fbue	%fcc0,	loop_275
	movgu	%icc,	%l6,	%l3
	stx	%l5,	[%l7 + 0x70]
loop_274:
	bn,a	%xcc,	loop_276
loop_275:
	set  0x0, %l0
	setx loop_277, %l0, %l1
	jmpl %l1, %o6
	fbge	%fcc0,	loop_278
	fbug	%fcc2,	loop_279
loop_276:
	fcmple32	%f4,	%f2,	%o5
loop_277:
	sdivcc	%i3,	0x001B,	%i2
loop_278:
	fmovdcs	%xcc,	%f0,	%f8
loop_279:
	fmovrdlez	%l4,	%f10,	%f0
	fbule	%fcc0,	loop_280
	ldd	[%l7 + 0x38],	%f8
	bl	loop_281
	lduw	[%l7 + 0x50],	%g4
loop_280:
	brz	%i4,	loop_282
	umulcc	%g1,	0x0E9F,	%i6
loop_281:
	ldsw	[%l7 + 0x24],	%o3
	call	loop_283
loop_282:
	fabss	%f14,	%f4
	movl	%xcc,	%o0,	%o7
	fmovrsne	%g3,	%f9,	%f12
loop_283:
	fmovdcc	%xcc,	%f9,	%f0
	fnegs	%f8,	%f14
	fpadd32s	%f13,	%f12,	%f12
	fmovdge	%xcc,	%f7,	%f9
	fbue,a	%fcc1,	loop_284
	bgu,a	%icc,	loop_285
	udivx	%i1,	0x1C3D,	%g6
	stw	%g2,	[%l7 + 0x60]
loop_284:
	movleu	%xcc,	%o1,	%i7
loop_285:
	fbul,a	%fcc0,	loop_286
	orn	%i0,	0x0CBB,	%l1
	mova	%xcc,	%l2,	%i5
	fmovdvc	%xcc,	%f0,	%f10
loop_286:
	fbg,a	%fcc3,	loop_287
	fmovdvs	%icc,	%f6,	%f12
	fands	%f0,	%f5,	%f13
	bge,a	loop_288
loop_287:
	srlx	%g7,	0x1D,	%o2
	fsrc2	%f2,	%f2
	stx	%l0,	[%l7 + 0x58]
loop_288:
	edge16l	%g5,	%o4,	%l6
	ldd	[%l7 + 0x60],	%f2
	xnorcc	%l5,	0x0178,	%l3
	popc	%o6,	%o5
	st	%f7,	[%l7 + 0x3C]
	andcc	%i2,	0x1E5B,	%l4
	bn,pt	%icc,	loop_289
	ldsh	[%l7 + 0x3C],	%g4
	fmovda	%icc,	%f5,	%f1
	fxnors	%f14,	%f13,	%f15
loop_289:
	fcmpgt32	%f8,	%f6,	%i4
	movge	%icc,	%i3,	%g1
	fmovd	%f4,	%f12
	edge32ln	%i6,	%o0,	%o3
	movge	%icc,	%g3,	%i1
	orncc	%o7,	0x0D1B,	%g2
	fandnot2s	%f7,	%f2,	%f6
	fble,a	%fcc0,	loop_290
	bpos,pn	%xcc,	loop_291
	bge,a,pn	%icc,	loop_292
	edge8l	%o1,	%g6,	%i7
loop_290:
	lduw	[%l7 + 0x14],	%i0
loop_291:
	bne,a,pn	%icc,	loop_293
loop_292:
	xnor	%l1,	%i5,	%g7
	alignaddr	%o2,	%l2,	%l0
	bgu	%icc,	loop_294
loop_293:
	bgu,a	loop_295
	ldsb	[%l7 + 0x4C],	%o4
	fsrc2	%f12,	%f0
loop_294:
	move	%icc,	%g5,	%l5
loop_295:
	udivx	%l6,	0x080C,	%o6
	fmovdl	%icc,	%f11,	%f1
	fcmps	%fcc2,	%f6,	%f5
	st	%f11,	[%l7 + 0x0C]
	fblg,a	%fcc1,	loop_296
	lduh	[%l7 + 0x28],	%l3
	ldsb	[%l7 + 0x5C],	%i2
	fpsub32	%f0,	%f6,	%f10
loop_296:
	ble,a,pn	%icc,	loop_297
	fmovscs	%xcc,	%f8,	%f2
	lduw	[%l7 + 0x48],	%o5
	fbue,a	%fcc0,	loop_298
loop_297:
	movn	%xcc,	%l4,	%g4
	fmovse	%icc,	%f5,	%f12
	fcmps	%fcc2,	%f13,	%f3
loop_298:
	bneg,a,pt	%icc,	loop_299
	bne	loop_300
	ldsw	[%l7 + 0x70],	%i4
	sth	%g1,	[%l7 + 0x16]
loop_299:
	movvc	%icc,	%i6,	%o0
loop_300:
	fmovsa	%icc,	%f13,	%f14


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xEE6EE56F
.word 0xB5B833FD
.word 0x9B934E51
.word 0x8F16565D
.word 0xA993701D
.word 0x1AACB9CE
.word 0x7D03106F
.word 0x76337105
.word 0x51BABC8F
.word 0xC8C3BF7C
.word 0x36BFBD65
.word 0x460D34A3
.word 0x389A83BB
.word 0x6D1B6705
.word 0xCBD182A5
.word 0xC52E2F61
.word 0x022CC5A0
.word 0xD34A6E06
.word 0x071FA50D
.word 0x22779859
.word 0x7ED2A6A5
.word 0x50284F6C
.word 0x93D6D159
.word 0x0FEA9706
.word 0x5F4686C0
.word 0x60C7DF95
.word 0xE95E5B49
.word 0x3C004CC1
.word 0xB8E69F3F
.word 0x7285FCB3
.word 0xEB2F1BD1
.word 0x4B06C4DF
.word 0xDE10C5B9
.word 0x1897DE69
.word 0x0C77670C
.word 0x19522CEB
.word 0xFE5463A1
.word 0xA74E18C3
.word 0xDF2F422F
.word 0x53DF8B5E
.word 0xB440830A
.word 0xE98E8B9C
.word 0xA387C9D8
.word 0xE2D4769D
.word 0x2412BF2D
.word 0xA83117C0
.word 0x67587F2A
.word 0x7C4E0B59
.word 0x8E61A2C8
.word 0x20DB3DA5
.word 0xD152136F
.word 0x3EEF1DF3
.word 0x5D97B2B0
.word 0x894FD1E3
.word 0xE20B204E
.word 0xE98C0A23
.word 0x4BDE32BA
.word 0xE8BC170F
.word 0xE1451091
.word 0x1F88D3C2
.word 0x82403863
.word 0x196A0E09
.word 0xC0D81C4E
.word 0xDE1DDF4C
.end
