/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_isa2mt_fail_fc_9.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa2.pl FOCUS_SEED=508719961"
.ident "BY somePerson ON Mon Aug  4 10:32:26 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: spc_isa2mt_fail_fc_9.s,v 1.3 2007/07/05 22:02:07 drp Exp $"
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
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	DIAG_DATA_AREA, %g1, %g3
	add	%l7, %g3, %l7

	cmp %l6, 0x0
	be main_t0
	nop
	cmp %l6, 0x1
	be main_t1
	nop
	cmp %l6, 0x2
	be main_t2
	nop
	cmp %l6, 0x3
	be main_t3
	nop
	cmp %l6, 0x4
	be main_t4
	nop
	cmp %l6, 0x5
	be main_t5
	nop
	cmp %l6, 0x6
	be main_t6
	nop
	cmp %l6, 0x7
	be main_t7
	nop
	EXIT_GOOD
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xA,	%g1
	set	0x3,	%g2
	set	0xD,	%g3
	set	0xA,	%g4
	set	0x7,	%g5
	set	0x1,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x5,	%i1
	set	-0x3,	%i2
	set	-0x7,	%i3
	set	-0xD,	%i4
	set	-0xF,	%i5
	set	-0xE,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x61828D4B,	%l0
	set	0x773BC5B2,	%l1
	set	0x30DED6E4,	%l2
	set	0x2D092289,	%l3
	set	0x05DA0401,	%l4
	set	0x08B42B8D,	%l5
	set	0x62F7D348,	%l6
	!# Output registers
	set	-0x1915,	%o0
	set	0x0C86,	%o1
	set	-0x06E1,	%o2
	set	-0x1613,	%o3
	set	-0x05AA,	%o4
	set	0x132A,	%o5
	set	0x0DE8,	%o6
	set	0x11D1,	%o7

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

	bvc,a,pn	%icc,	loop_1
loop_1:
	stw	%g3,	[%l7 + 0x28]
	sth	%l3,	[%l7 + 0x68]
	fsrc1	%f0,	%f12
	fbge	%fcc1,	loop_2
loop_2:
	movg	%xcc,	%l1,	%o5
	tvs	%icc,	0x0
	xnor	%l0,	0x1DA9,	%o4
	ldsb	[%l7 + 0x42],	%g7
	and	%i2,	0x03C8,	%o1
	bneg,a,pn	%xcc,	loop_3
loop_3:
	brz,a	%g1,	loop_4
loop_4:
	ldsb	[%l7 + 0x34],	%i7
	movcs	%xcc,	%g4,	%i6
	movrgez	%g2,	%g6,	%o6
	xor	%l4,	%o2,	%i5
	pdist	%f0,	%f0,	%f4
	fmovsg	%xcc,	%f15,	%f0
	mova	%xcc,	%o7,	%l2
	sdivcc	%g5,	0x0627,	%l5
	std	%f14,	[%l7 + 0x20]
	lduh	[%l7 + 0x14],	%i1
	fpack16	%f8,	%f3
	tsubcctv	%i3,	%i4,	%i0
	std	%f6,	[%l7 + 0x70]
	ldsb	[%l7 + 0x5C],	%o3
	movrlz	%o0,	0x2AB,	%g3
	fornot2s	%f5,	%f13,	%f4
	edge32	%l3,	%l1,	%o5
	fbl	%fcc1,	loop_5
loop_5:
	sra	%l6,	%l0,	%g7
	stb	%o4,	[%l7 + 0x20]
	sth	%o1,	[%l7 + 0x6C]
	fble,a	%fcc1,	loop_6
loop_6:
	stw	%g1,	[%l7 + 0x48]
	sth	%i7,	[%l7 + 0x34]
	tcs	%xcc,	0x7
	fsrc1	%f6,	%f8
	fbule,a	%fcc2,	loop_7
loop_7:
	tn	%icc,	0x6
	lduh	[%l7 + 0x1C],	%i2
	edge8l	%g4,	%g2,	%i6
	fnot2s	%f15,	%f0
	fbn	%fcc1,	loop_8
loop_8:
	ldsb	[%l7 + 0x4D],	%o6
	brlez,a	%l4,	loop_9
loop_9:
	stb	%o2,	[%l7 + 0x10]
	fexpand	%f15,	%f14
	nop
	setx loop_10, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_10:
	st	%f9,	[%l7 + 0x20]
	ldsb	[%l7 + 0x2A],	%g6
	ldx	[%l7 + 0x78],	%i5
	bne,a,pn	%xcc,	loop_11
loop_11:
	ldx	[%l7 + 0x10],	%o7
	tpos	%icc,	0x0
	fbu	%fcc0,	loop_12
loop_12:
	bvs,pt	%icc,	loop_13
loop_13:
	ld	[%l7 + 0x5C],	%f13
	fblg,a	%fcc1,	loop_14
loop_14:
	lduw	[%l7 + 0x28],	%l2
	ldub	[%l7 + 0x28],	%l5
	movvc	%xcc,	%g5,	%i1
	movrgez	%i3,	%i0,	%o3
	stb	%i4,	[%l7 + 0x7C]
	movn	%icc,	%o0,	%g3
	mulx	%l1,	0x1DA7,	%o5
	movcs	%xcc,	%l3,	%l0
	bneg,a,pn	%icc,	loop_15
loop_15:
	ldsb	[%l7 + 0x18],	%l6
	ta	%xcc,	0x5
	ldub	[%l7 + 0x5B],	%o4
	sra	%g7,	%o1,	%g1
	brz	%i2,	loop_16
loop_16:
	fbg	%fcc0,	loop_17
loop_17:
	ldd	[%l7 + 0x58],	%f2
	udivcc	%g4,	0x0EC9,	%i7
	tleu	%xcc,	0x2
	sra	%i6,	%g2,	%l4
	std	%f4,	[%l7 + 0x48]
	te	%icc,	0x4
	popc	0x1A2C,	%o6
	fbo	%fcc0,	loop_18
loop_18:
	fblg,a	%fcc3,	loop_19
loop_19:
	ldub	[%l7 + 0x7D],	%g6
	stx	%i5,	[%l7 + 0x28]
	tne	%icc,	0x1
	lduh	[%l7 + 0x5C],	%o2
	std	%f14,	[%l7 + 0x50]
	xnor	%l2,	0x16F7,	%o7
	sra	%l5,	%i1,	%g5
	fmovsneg	%xcc,	%f0,	%f13
	ldx	[%l7 + 0x18],	%i3
	faligndata	%f10,	%f14,	%f6
	brgz,a	%i0,	loop_20
loop_20:
	or	%o3,	0x16BF,	%i4
	sdivx	%g3,	0x153C,	%l1
	fnand	%f6,	%f4,	%f2
	std	%f8,	[%l7 + 0x70]
	call	loop_21
loop_21:
	tvs	%icc,	0x3
	brgez	%o0,	loop_22
loop_22:
	ldx	[%l7 + 0x38],	%l3
	ba	loop_23
loop_23:
	stb	%l0,	[%l7 + 0x14]
	stw	%o5,	[%l7 + 0x40]
	or	%o4,	%l6,	%g7
	movre	%o1,	%i2,	%g4
	fbu	%fcc0,	loop_24
loop_24:
	movge	%icc,	%i7,	%g1
	ble	%xcc,	loop_25
loop_25:
	ldsw	[%l7 + 0x70],	%i6
	srax	%l4,	%g2,	%g6
	bleu	%xcc,	loop_26
loop_26:
	ble,pn	%icc,	loop_27
loop_27:
	taddcc	%o6,	%o2,	%i5
	brnz,a	%o7,	loop_28
loop_28:
	ldx	[%l7 + 0x40],	%l5
	ld	[%l7 + 0x34],	%f11
	bgu,pt	%xcc,	loop_29
loop_29:
	edge16n	%i1,	%g5,	%l2
	sllx	%i3,	0x1B,	%i0
	brlz,a	%i4,	loop_30
loop_30:
	edge32n	%o3,	%l1,	%o0
	fcmpne16	%f4,	%f6,	%l3
	ldub	[%l7 + 0x19],	%l0
	udiv	%g3,	0x1883,	%o5
	popc	%l6,	%g7
	lduw	[%l7 + 0x30],	%o1
	ldx	[%l7 + 0x20],	%o4
	bvs,a,pn	%icc,	loop_31
loop_31:
	bvc,a	loop_32
loop_32:
	bcc	%xcc,	loop_33
loop_33:
	fmovrsne	%i2,	%f13,	%f8
	ldx	[%l7 + 0x38],	%g4
	ld	[%l7 + 0x2C],	%f15
	stw	%i7,	[%l7 + 0x2C]
	nop
	setx loop_34, %l0, %l1
	jmpl %l1, %g1
loop_34:
	fmovrdgez	%i6,	%f0,	%f10
	umulcc	%g2,	%g6,	%o6
	stb	%o2,	[%l7 + 0x63]
	fbl,a	%fcc0,	loop_35
loop_35:
	fmul8x16au	%f9,	%f6,	%f2
	subc	%i5,	0x0D20,	%l4
	stx	%l5,	[%l7 + 0x38]
	fnot2	%f0,	%f12
	ldd	[%l7 + 0x28],	%f6
	umulcc	%i1,	%g5,	%o7
	udiv	%l2,	0x15A4,	%i3
	fbug,a	%fcc0,	loop_36
loop_36:
	bcs,pn	%xcc,	loop_37
loop_37:
	brgez	%i0,	loop_38
loop_38:
	ldub	[%l7 + 0x1A],	%o3
	ld	[%l7 + 0x20],	%f13
	bge,a	%xcc,	loop_39
loop_39:
	lduh	[%l7 + 0x70],	%l1
	st	%f0,	[%l7 + 0x30]
	ldsh	[%l7 + 0x58],	%o0
	movcs	%icc,	%i4,	%l3
	edge16	%g3,	%l0,	%o5
	ldsw	[%l7 + 0x3C],	%g7
	bleu,pt	%xcc,	loop_40
loop_40:
	smul	%o1,	%o4,	%i2
	movg	%icc,	%l6,	%i7
	bleu,a,pt	%icc,	loop_41
loop_41:
	fble,a	%fcc3,	loop_42
loop_42:
	edge32n	%g4,	%i6,	%g1
	lduh	[%l7 + 0x7E],	%g2
	movne	%xcc,	%g6,	%o6
	xor	%o2,	0x1275,	%i5
	tsubcc	%l4,	0x14B4,	%i1
	fands	%f5,	%f6,	%f10
	call	loop_43
loop_43:
	fbu,a	%fcc3,	loop_44
loop_44:
	bn	loop_45
loop_45:
	nop
	setx loop_46, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_46:
	orncc	%g5,	0x1261,	%l5
	fmovrslz	%o7,	%f8,	%f11
	bcs	%xcc,	loop_47
loop_47:
	fbge	%fcc1,	loop_48
loop_48:
	tcc	%icc,	0x1
	tn	%xcc,	0x3
	stb	%i3,	[%l7 + 0x4D]
	sth	%l2,	[%l7 + 0x5C]
	brlez	%i0,	loop_49
loop_49:
	movvs	%xcc,	%o3,	%o0
	nop
	setx loop_50, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_50:
	std	%f0,	[%l7 + 0x58]
	sth	%i4,	[%l7 + 0x48]
	sll	%l3,	%l1,	%l0
	umul	%g3,	%g7,	%o5
	ldub	[%l7 + 0x6E],	%o4
	fcmpd	%fcc0,	%f0,	%f4
	bpos,a	%icc,	loop_51
loop_51:
	ldsb	[%l7 + 0x10],	%i2
	bvc,pt	%xcc,	loop_52
loop_52:
	bneg,a	loop_53
loop_53:
	fornot1s	%f2,	%f9,	%f5
	stx	%l6,	[%l7 + 0x40]
	bne,pt	%xcc,	loop_54
loop_54:
	stb	%i7,	[%l7 + 0x52]
	alignaddrl	%g4,	%o1,	%g1
	ldsh	[%l7 + 0x10],	%g2
	st	%f5,	[%l7 + 0x38]
	stb	%i6,	[%l7 + 0x63]
	fsrc2	%f6,	%f0
	bshuffle	%f0,	%f6,	%f6
	fbge	%fcc1,	loop_55
loop_55:
	ld	[%l7 + 0x7C],	%f6
	stb	%g6,	[%l7 + 0x19]
	srlx	%o2,	%o6,	%l4
	std	%f0,	[%l7 + 0x40]
	sth	%i5,	[%l7 + 0x78]
	addcc	%i1,	%l5,	%g5
	ld	[%l7 + 0x1C],	%f13
	tgu	%icc,	0x4
	ldsw	[%l7 + 0x7C],	%o7
	fpadd32s	%f4,	%f15,	%f14
	bg,pt	%xcc,	loop_56
loop_56:
	brgez	%l2,	loop_57
loop_57:
	fbul,a	%fcc2,	loop_58
loop_58:
	edge32l	%i0,	%i3,	%o0
	movpos	%xcc,	%i4,	%o3
	lduh	[%l7 + 0x24],	%l3
	bleu,a	loop_59
loop_59:
	ldx	[%l7 + 0x40],	%l0
	ldsb	[%l7 + 0x58],	%l1
	bpos,a	loop_60
loop_60:
	bcc,a,pn	%icc,	loop_61
loop_61:
	fxnors	%f9,	%f11,	%f10
	edge16n	%g3,	%g7,	%o4
	bgu,pn	%xcc,	loop_62
loop_62:
	smul	%o5,	0x1C53,	%l6
	stb	%i7,	[%l7 + 0x66]
	umulcc	%i2,	%o1,	%g4
	and	%g2,	%g1,	%i6
	xorcc	%g6,	%o6,	%o2
	tleu	%xcc,	0x2
	sub	%i5,	%l4,	%l5
	tn	%icc,	0x2
	fbne,a	%fcc1,	loop_63
loop_63:
	fbo	%fcc1,	loop_64
loop_64:
	fcmpd	%fcc2,	%f10,	%f12
	ldsb	[%l7 + 0x2B],	%g5
	ldx	[%l7 + 0x70],	%i1
	st	%f2,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x5A],	%o7
	lduh	[%l7 + 0x26],	%i0
	movvs	%xcc,	%i3,	%l2
	st	%f0,	[%l7 + 0x24]
	te	%icc,	0x6
	stb	%i4,	[%l7 + 0x6F]
	fba,a	%fcc3,	loop_65
loop_65:
	movneg	%icc,	%o3,	%l3
	sth	%o0,	[%l7 + 0x2A]
	orcc	%l0,	%l1,	%g3
	bleu	%icc,	loop_66
loop_66:
	ldsw	[%l7 + 0x38],	%g7
	lduh	[%l7 + 0x4C],	%o5
	fbg,a	%fcc0,	loop_67
loop_67:
	ldsh	[%l7 + 0x42],	%o4
	bshuffle	%f10,	%f8,	%f6
	edge16ln	%i7,	%l6,	%i2
	movg	%xcc,	%o1,	%g2
	sra	%g1,	%g4,	%i6
	fbue	%fcc2,	loop_68
loop_68:
	fmul8x16au	%f11,	%f7,	%f0
	xor	%g6,	0x1B5E,	%o6
	sth	%i5,	[%l7 + 0x70]
	or	%o2,	0x0C9F,	%l5
	ldsw	[%l7 + 0x7C],	%l4
	edge16	%i1,	%o7,	%g5
	lduw	[%l7 + 0x1C],	%i0
	taddcc	%i3,	0x1B18,	%l2
	ldsh	[%l7 + 0x70],	%o3
	subccc	%i4,	%l3,	%o0
	bne,pn	%icc,	loop_69
loop_69:
	st	%f0,	[%l7 + 0x44]
	fpadd32	%f10,	%f14,	%f0
	fbn	%fcc0,	loop_70
loop_70:
	fandnot2	%f6,	%f12,	%f6
	bne,a	loop_71
loop_71:
	fmovrslz	%l1,	%f5,	%f13
	movvc	%icc,	%l0,	%g3
	sth	%o5,	[%l7 + 0x18]
	ldub	[%l7 + 0x29],	%o4
	sdivcc	%i7,	0x19B4,	%l6
	sethi	0x0780,	%g7
	fbge,a	%fcc2,	loop_72
loop_72:
	movrgez	%o1,	0x368,	%i2
	bcs,pn	%xcc,	loop_73
loop_73:
	ldsb	[%l7 + 0x79],	%g1
	stb	%g4,	[%l7 + 0x4C]
	fmovda	%xcc,	%f10,	%f13
	fsrc1	%f14,	%f14
	ldsh	[%l7 + 0x48],	%g2
	st	%f14,	[%l7 + 0x44]
	stb	%g6,	[%l7 + 0x58]
	brlz,a	%o6,	loop_74
loop_74:
	stx	%i5,	[%l7 + 0x68]
	st	%f7,	[%l7 + 0x58]
	st	%f4,	[%l7 + 0x64]
	fbo,a	%fcc2,	loop_75
loop_75:
	movcs	%icc,	%i6,	%o2
	fmovsleu	%xcc,	%f15,	%f3
	edge32n	%l5,	%l4,	%o7
	and	%g5,	0x1610,	%i1
	tsubcc	%i0,	0x19B6,	%i3
	ldsw	[%l7 + 0x28],	%l2
	stx	%o3,	[%l7 + 0x58]
	fmovrde	%i4,	%f8,	%f6
	xor	%o0,	%l1,	%l3
	ldub	[%l7 + 0x2D],	%g3
	srax	%l0,	0x0E,	%o5
	lduh	[%l7 + 0x1A],	%i7
	fbuge,a	%fcc0,	loop_76
loop_76:
	stx	%l6,	[%l7 + 0x58]
	array32	%g7,	%o4,	%o1
	addcc	%g1,	0x1B4E,	%i2
	bcc,a	%xcc,	loop_77
loop_77:
	movrgz	%g2,	%g4,	%o6
	ldsb	[%l7 + 0x69],	%i5
	stb	%g6,	[%l7 + 0x6F]
	fbul	%fcc3,	loop_78
loop_78:
	ldsb	[%l7 + 0x0D],	%i6
	movrlz	%l5,	%o2,	%o7
	sub	%l4,	%i1,	%i0
	fbn,a	%fcc2,	loop_79
loop_79:
	orn	%i3,	%g5,	%l2
	fbul,a	%fcc0,	loop_80
loop_80:
	edge32	%o3,	%i4,	%l1
	ldx	[%l7 + 0x60],	%o0
	for	%f14,	%f0,	%f6
	fmovsvs	%xcc,	%f7,	%f11
	ldd	[%l7 + 0x50],	%f2
	subc	%g3,	%l3,	%l0
	fnand	%f14,	%f14,	%f14
	ldsw	[%l7 + 0x0C],	%i7
	subc	%o5,	0x1105,	%g7
	orn	%o4,	0x03EA,	%o1
	nop
	setx loop_81, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_81:
	movrgez	%l6,	%i2,	%g2
	addccc	%g1,	%o6,	%i5
	st	%f0,	[%l7 + 0x5C]
	stb	%g6,	[%l7 + 0x63]
	tsubcctv	%g4,	0x0D26,	%i6
	stx	%l5,	[%l7 + 0x10]
	be,a,pt	%icc,	loop_82
loop_82:
	ld	[%l7 + 0x38],	%f10
	fmovdvs	%xcc,	%f1,	%f7
	ld	[%l7 + 0x78],	%f8
	ldub	[%l7 + 0x2B],	%o2
	bleu,a	%xcc,	loop_83
loop_83:
	stw	%l4,	[%l7 + 0x2C]
	tge	%xcc,	0x6
	fbo	%fcc3,	loop_84
loop_84:
	fpadd32	%f8,	%f4,	%f12
	add	%i1,	0x1793,	%i0
	edge8n	%o7,	%i3,	%g5
	fmovscc	%xcc,	%f11,	%f4
	brgz	%l2,	loop_85
loop_85:
	sth	%i4,	[%l7 + 0x2A]
	fmovd	%f14,	%f8
	bneg,a,pt	%xcc,	loop_86
loop_86:
	brgez	%o3,	loop_87
loop_87:
	edge8l	%l1,	%o0,	%l3
	srlx	%g3,	%i7,	%l0
	edge8	%g7,	%o5,	%o4
	sethi	0x0C5A,	%o1
	taddcc	%l6,	%g2,	%i2
	bvs,pn	%icc,	loop_88
loop_88:
	fbuge,a	%fcc3,	loop_89
loop_89:
	lduh	[%l7 + 0x3E],	%g1
	ta	%xcc,	0x5
	fbge	%fcc2,	loop_90
loop_90:
	fones	%f11
	movvs	%xcc,	%o6,	%i5
	fble	%fcc2,	loop_91
loop_91:
	fmovs	%f2,	%f13
	edge8n	%g4,	%g6,	%l5
	fmul8sux16	%f12,	%f14,	%f10
	fbo	%fcc0,	loop_92
loop_92:
	fnot1	%f0,	%f0
	sethi	0x0789,	%i6
	brgez,a	%l4,	loop_93
loop_93:
	nop
	setx loop_94, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_94:
	fmovrde	%i1,	%f4,	%f0
	tsubcc	%i0,	0x1C29,	%o2
	bge,pn	%xcc,	loop_95
loop_95:
	ldub	[%l7 + 0x5F],	%i3
	bl,pn	%xcc,	loop_96
loop_96:
	fbo,a	%fcc2,	loop_97
loop_97:
	edge32	%g5,	%o7,	%l2
	bleu,pn	%icc,	loop_98
loop_98:
	taddcctv	%o3,	%l1,	%i4
	ldub	[%l7 + 0x47],	%o0
	ldd	[%l7 + 0x40],	%f12
	mova	%xcc,	%l3,	%g3
	bn,a,pn	%xcc,	loop_99
loop_99:
	edge16ln	%l0,	%g7,	%o5
	add	%i7,	0x0C43,	%o4
	lduh	[%l7 + 0x62],	%o1
	ldub	[%l7 + 0x49],	%g2
	bleu,a	%xcc,	loop_100
loop_100:
	fbge	%fcc2,	loop_101
loop_101:
	andn	%l6,	%g1,	%o6
	fba,a	%fcc1,	loop_102
loop_102:
	st	%f7,	[%l7 + 0x14]
	st	%f11,	[%l7 + 0x60]
	fbge	%fcc0,	loop_103
loop_103:
	fmovda	%icc,	%f3,	%f6
	movrlz	%i5,	%g4,	%i2
	stw	%g6,	[%l7 + 0x2C]
	lduh	[%l7 + 0x2E],	%l5
	fbo	%fcc3,	loop_104
loop_104:
	brnz,a	%i6,	loop_105
loop_105:
	ldub	[%l7 + 0x18],	%i1
	stb	%l4,	[%l7 + 0x31]
	movvs	%xcc,	%o2,	%i3
	call	loop_106
loop_106:
	st	%f14,	[%l7 + 0x14]
	fbu,a	%fcc3,	loop_107
loop_107:
	ldsh	[%l7 + 0x22],	%g5
	taddcctv	%o7,	%l2,	%i0
	fbule,a	%fcc0,	loop_108
loop_108:
	sethi	0x0441,	%l1
	fpadd32s	%f4,	%f11,	%f8
	orn	%i4,	%o0,	%l3
	nop
	setx loop_109, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_109:
	array16	%g3,	%l0,	%g7
	bpos,pn	%xcc,	loop_110
loop_110:
	lduw	[%l7 + 0x70],	%o3
	lduw	[%l7 + 0x3C],	%o5
	andcc	%o4,	0x0948,	%o1
	fbn	%fcc3,	loop_111
loop_111:
	lduw	[%l7 + 0x08],	%g2
	ldsh	[%l7 + 0x72],	%l6
	st	%f1,	[%l7 + 0x18]
	tleu	%xcc,	0x4
	fbule,a	%fcc0,	loop_112
loop_112:
	fbule	%fcc2,	loop_113
loop_113:
	mulscc	%g1,	%o6,	%i5
	fmovda	%xcc,	%f10,	%f0
	fba,a	%fcc3,	loop_114
loop_114:
	ldx	[%l7 + 0x40],	%i7
	fmovsneg	%xcc,	%f3,	%f0
	movrlz	%i2,	0x232,	%g6
	siam	0x4
	movg	%icc,	%g4,	%l5
	edge16ln	%i1,	%i6,	%o2
	sra	%i3,	%g5,	%o7
	st	%f11,	[%l7 + 0x54]
	fbne	%fcc0,	loop_115
loop_115:
	ldub	[%l7 + 0x43],	%l4
	bvs	%xcc,	loop_116
loop_116:
	fmovdleu	%xcc,	%f2,	%f8
	fbl	%fcc1,	loop_117
loop_117:
	fmovrsgez	%l2,	%f14,	%f7
	fbge	%fcc1,	loop_118
loop_118:
	ldsb	[%l7 + 0x2D],	%i0
	andn	%i4,	0x1890,	%o0
	mova	%xcc,	%l1,	%g3
	fbg	%fcc1,	loop_119
loop_119:
	edge32n	%l3,	%l0,	%o3
	fbl,a	%fcc0,	loop_120
loop_120:
	tsubcctv	%g7,	0x05BC,	%o5
	sdivcc	%o1,	0x138F,	%o4
	ldsw	[%l7 + 0x44],	%g2
	movrgz	%l6,	%g1,	%o6
	stb	%i7,	[%l7 + 0x7E]
	ldsh	[%l7 + 0x0C],	%i2
	fbug	%fcc2,	loop_121
loop_121:
	ld	[%l7 + 0x08],	%f10
	ldsh	[%l7 + 0x74],	%i5
	std	%f6,	[%l7 + 0x20]
	fmovrsne	%g6,	%f11,	%f9
	smulcc	%g4,	%i1,	%l5
	stb	%o2,	[%l7 + 0x4D]
	ld	[%l7 + 0x08],	%f4
	orn	%i3,	0x0BCF,	%i6
	fmovsl	%xcc,	%f4,	%f2
	udiv	%g5,	0x0DA0,	%o7
	st	%f1,	[%l7 + 0x38]
	brgz	%l2,	loop_122
loop_122:
	ldd	[%l7 + 0x70],	%f12
	be,pt	%icc,	loop_123
loop_123:
	ldsh	[%l7 + 0x38],	%l4
	sth	%i0,	[%l7 + 0x70]
	movl	%xcc,	%o0,	%i4
	lduw	[%l7 + 0x50],	%g3
	sdivx	%l3,	0x002A,	%l0
	bcc,a,pn	%xcc,	loop_124
loop_124:
	stw	%l1,	[%l7 + 0x18]
	fpsub16s	%f1,	%f0,	%f6
	fmovdcc	%xcc,	%f15,	%f3
	move	%icc,	%g7,	%o3
	fblg	%fcc3,	loop_125
loop_125:
	movcc	%xcc,	%o1,	%o4
	nop
	setx loop_126, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_126:
	addccc	%g2,	%o5,	%g1
	fbe	%fcc2,	loop_127
loop_127:
	stb	%l6,	[%l7 + 0x1D]
	lduw	[%l7 + 0x58],	%o6
	stw	%i7,	[%l7 + 0x7C]
	fbge,a	%fcc1,	loop_128
loop_128:
	movrne	%i5,	0x37A,	%i2
	array32	%g4,	%g6,	%l5
	ldsh	[%l7 + 0x36],	%o2
	stw	%i1,	[%l7 + 0x44]
	fbule	%fcc3,	loop_129
loop_129:
	fmovdn	%xcc,	%f13,	%f13
	movrne	%i3,	0x3F8,	%g5
	movrgez	%o7,	0x087,	%l2
	fbue	%fcc3,	loop_130
loop_130:
	fmovsleu	%xcc,	%f5,	%f7
	tgu	%icc,	0x2
	fbge,a	%fcc3,	loop_131
loop_131:
	stb	%l4,	[%l7 + 0x26]
	bge,pn	%xcc,	loop_132
loop_132:
	movre	%i6,	%i0,	%i4
	edge16l	%g3,	%o0,	%l0
	andn	%l3,	%l1,	%o3
	ldd	[%l7 + 0x48],	%f12
	fsrc1	%f10,	%f2
	ldx	[%l7 + 0x48],	%g7
	ldx	[%l7 + 0x70],	%o4
	st	%f1,	[%l7 + 0x34]
	ba	loop_133
loop_133:
	fbul,a	%fcc2,	loop_134
loop_134:
	ldsw	[%l7 + 0x18],	%o1
	sth	%o5,	[%l7 + 0x32]
	bl	loop_135
loop_135:
	ldd	[%l7 + 0x28],	%f4
	lduw	[%l7 + 0x0C],	%g2
	tvs	%xcc,	0x7
	smul	%g1,	%o6,	%i7
	edge8n	%l6,	%i5,	%g4
	bleu,a	%xcc,	loop_136
loop_136:
	st	%f0,	[%l7 + 0x40]
	bcc,a,pn	%xcc,	loop_137
loop_137:
	movleu	%xcc,	%i2,	%l5
	fmovsneg	%xcc,	%f11,	%f9
	bn,a,pt	%icc,	loop_138
loop_138:
	bg,pn	%icc,	loop_139
loop_139:
	smulcc	%o2,	0x0FB9,	%i1
	ldd	[%l7 + 0x18],	%f0
	xnorcc	%i3,	%g5,	%o7
	ldd	[%l7 + 0x50],	%f4
	nop
	setx loop_140, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_140:
	lduw	[%l7 + 0x60],	%g6
	orcc	%l4,	0x1E45,	%l2
	edge32	%i0,	%i6,	%g3
	sth	%o0,	[%l7 + 0x50]
	fbe	%fcc2,	loop_141
loop_141:
	ldd	[%l7 + 0x30],	%f0
	movleu	%xcc,	%l0,	%i4
	std	%f12,	[%l7 + 0x48]
	edge16ln	%l3,	%l1,	%g7
	fmovda	%icc,	%f14,	%f10
	move	%xcc,	%o4,	%o1
	tsubcc	%o3,	0x00C8,	%o5
	ldsw	[%l7 + 0x68],	%g1
	fble	%fcc2,	loop_142
loop_142:
	brgz,a	%o6,	loop_143
loop_143:
	fmul8ulx16	%f10,	%f8,	%f2
	stw	%g2,	[%l7 + 0x50]
	fblg	%fcc0,	loop_144
loop_144:
	ldub	[%l7 + 0x32],	%i7
	fmovsvc	%xcc,	%f10,	%f10
	ldx	[%l7 + 0x78],	%l6
	alignaddr	%g4,	%i5,	%l5
	fbe	%fcc1,	loop_145
loop_145:
	ldd	[%l7 + 0x78],	%f10
	taddcctv	%o2,	0x0AEE,	%i2
	st	%f15,	[%l7 + 0x08]
	bl,pt	%icc,	loop_146
loop_146:
	subc	%i1,	0x08D4,	%i3
	brgz,a	%g5,	loop_147
loop_147:
	mulx	%g6,	0x0F23,	%o7
	edge8	%l2,	%l4,	%i6
	xnor	%i0,	0x15FA,	%g3
	fsrc2	%f4,	%f6
	ta	%icc,	0x5
	srax	%o0,	%i4,	%l0
	fba,a	%fcc1,	loop_148
loop_148:
	tvs	%icc,	0x5
	movre	%l3,	%l1,	%g7
	taddcc	%o1,	0x1F2D,	%o3
	brlz,a	%o4,	loop_149
loop_149:
	mulscc	%g1,	0x12EF,	%o5
	bvc	loop_150
loop_150:
	bg,pn	%icc,	loop_151
loop_151:
	sdiv	%g2,	0x0CFD,	%o6
	movpos	%xcc,	%i7,	%l6
	fbu	%fcc3,	loop_152
loop_152:
	stb	%g4,	[%l7 + 0x0D]
	ld	[%l7 + 0x7C],	%f15
	ld	[%l7 + 0x2C],	%f12
	ba,pn	%xcc,	loop_153
loop_153:
	bgu	%xcc,	loop_154
loop_154:
	edge16n	%i5,	%o2,	%l5
	sth	%i1,	[%l7 + 0x36]
	ldsh	[%l7 + 0x2E],	%i3
	movrlez	%g5,	0x32E,	%g6
	pdist	%f6,	%f4,	%f14
	sdivcc	%i2,	0x1342,	%l2
	fbuge,a	%fcc0,	loop_155
loop_155:
	tgu	%icc,	0x6
	sdivx	%l4,	0x1669,	%o7
	bl,a	%icc,	loop_156
loop_156:
	fba	%fcc1,	loop_157
loop_157:
	fmovrdne	%i0,	%f6,	%f12
	fbo,a	%fcc3,	loop_158
loop_158:
	bcc,a	loop_159
loop_159:
	lduh	[%l7 + 0x64],	%i6
	tvs	%icc,	0x2
	sth	%g3,	[%l7 + 0x48]
	fbule	%fcc2,	loop_160
loop_160:
	fbne	%fcc3,	loop_161
loop_161:
	array16	%i4,	%o0,	%l3
	ld	[%l7 + 0x2C],	%f12
	call	loop_162
loop_162:
	bcs,a	loop_163
loop_163:
	ldsb	[%l7 + 0x3B],	%l0
	srl	%l1,	%g7,	%o1
	fbne	%fcc3,	loop_164
loop_164:
	orn	%o4,	0x1B36,	%o3
	ldsh	[%l7 + 0x5E],	%g1
	ldub	[%l7 + 0x67],	%g2
	fbo	%fcc0,	loop_165
loop_165:
	bge,a	%icc,	loop_166
loop_166:
	andcc	%o6,	0x0629,	%o5
	tsubcctv	%l6,	0x186C,	%i7
	ldsh	[%l7 + 0x7A],	%g4
	bneg,a,pt	%icc,	loop_167
loop_167:
	bleu,a,pt	%xcc,	loop_168
loop_168:
	bge,a,pn	%icc,	loop_169
loop_169:
	fbule	%fcc1,	loop_170
loop_170:
	edge32	%o2,	%i5,	%l5
	movgu	%icc,	%i1,	%i3
	alignaddrl	%g6,	%i2,	%g5
	ldd	[%l7 + 0x08],	%f2
	add	%l2,	0x155F,	%l4
	lduh	[%l7 + 0x0A],	%o7
	orncc	%i6,	0x026E,	%i0
	lduw	[%l7 + 0x70],	%i4
	sth	%g3,	[%l7 + 0x6C]
	xnor	%l3,	%l0,	%l1
	andn	%g7,	0x04BD,	%o1
	nop
	setx loop_171, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_171:
	fmovsle	%icc,	%f3,	%f13
	alignaddr	%o0,	%o4,	%o3
	stx	%g1,	[%l7 + 0x70]
	fble,a	%fcc1,	loop_172
loop_172:
	tge	%icc,	0x1
	fblg	%fcc2,	loop_173
loop_173:
	call	loop_174
loop_174:
	movcc	%xcc,	%g2,	%o6
	fmuld8sux16	%f4,	%f4,	%f14
	fmovrdgez	%o5,	%f2,	%f0
	stx	%i7,	[%l7 + 0x70]
	ldsh	[%l7 + 0x1C],	%l6
	stb	%g4,	[%l7 + 0x7E]
	lduh	[%l7 + 0x12],	%i5
	sllx	%o2,	%i1,	%i3
	brnz,a	%g6,	loop_175
loop_175:
	fbul	%fcc1,	loop_176
loop_176:
	fxors	%f3,	%f6,	%f11
	stb	%l5,	[%l7 + 0x1F]
	ldsw	[%l7 + 0x3C],	%i2
	movcs	%xcc,	%l2,	%g5
	ldd	[%l7 + 0x38],	%f10
	fcmpne16	%f4,	%f8,	%o7
	ldsh	[%l7 + 0x5C],	%l4
	fbuge	%fcc0,	loop_177
loop_177:
	edge16ln	%i6,	%i0,	%i4
	fblg	%fcc2,	loop_178
loop_178:
	bg	loop_179
loop_179:
	sdivx	%g3,	0x04A3,	%l0
	edge16	%l3,	%l1,	%o1
	bcs,pt	%icc,	loop_180
loop_180:
	fblg,a	%fcc0,	loop_181
loop_181:
	taddcctv	%g7,	%o0,	%o3
	movre	%g1,	0x3FF,	%o4
	fbul,a	%fcc1,	loop_182
loop_182:
	fbue	%fcc2,	loop_183
loop_183:
	taddcc	%g2,	%o6,	%o5
	movcs	%xcc,	%l6,	%g4
	mulx	%i7,	0x15AE,	%i5
	fmovsvc	%xcc,	%f3,	%f2
	andn	%o2,	%i1,	%g6
	ldd	[%l7 + 0x70],	%f2
	smul	%l5,	0x109E,	%i3
	fmovscs	%xcc,	%f1,	%f14
	st	%f2,	[%l7 + 0x14]
	fones	%f3
	edge8n	%l2,	%i2,	%o7
	ldsb	[%l7 + 0x1E],	%l4
	movcc	%icc,	%i6,	%g5
	ldsb	[%l7 + 0x55],	%i0
	fxor	%f2,	%f8,	%f14
	fbl	%fcc3,	loop_184
loop_184:
	bleu,a	loop_185
loop_185:
	movrlz	%g3,	%i4,	%l3
	ldsh	[%l7 + 0x3C],	%l0
	bne,pn	%icc,	loop_186
loop_186:
	lduh	[%l7 + 0x7E],	%l1
	fble,a	%fcc1,	loop_187
loop_187:
	udivx	%o1,	0x0B12,	%g7
	tcs	%xcc,	0x2
	sth	%o0,	[%l7 + 0x0C]
	ba,a	loop_188
loop_188:
	std	%f6,	[%l7 + 0x50]
	smul	%o3,	%g1,	%g2
	movleu	%xcc,	%o4,	%o6
	bpos,pn	%xcc,	loop_189
loop_189:
	ldsh	[%l7 + 0x24],	%o5
	st	%f2,	[%l7 + 0x30]
	sth	%l6,	[%l7 + 0x66]
	ldub	[%l7 + 0x2D],	%g4
	fbug	%fcc1,	loop_190
loop_190:
	brnz	%i7,	loop_191
loop_191:
	fbug,a	%fcc2,	loop_192
loop_192:
	ldx	[%l7 + 0x78],	%i5
	ld	[%l7 + 0x38],	%f8
	ldsh	[%l7 + 0x0C],	%i1
	fcmpgt16	%f12,	%f2,	%g6
	fzero	%f2
	fmuld8ulx16	%f4,	%f11,	%f0
	nop
	setx loop_193, %l0, %l1
	jmpl %l1, %o2
loop_193:
	fbug	%fcc1,	loop_194
loop_194:
	tleu	%xcc,	0x1
	ldx	[%l7 + 0x28],	%l5
	orn	%i3,	0x148B,	%l2
	ba,a,pt	%xcc,	loop_195
loop_195:
	tle	%xcc,	0x2
	ldd	[%l7 + 0x50],	%f6
	ldsw	[%l7 + 0x48],	%o7
	lduw	[%l7 + 0x0C],	%l4
	movge	%xcc,	%i6,	%g5
	sub	%i2,	%i0,	%i4
	bleu,a,pt	%icc,	loop_196
loop_196:
	ldd	[%l7 + 0x48],	%f8
	sllx	%g3,	%l3,	%l0
	stb	%o1,	[%l7 + 0x41]
	movrne	%g7,	0x085,	%o0
	or	%l1,	0x0590,	%o3
	fbl,a	%fcc2,	loop_197
loop_197:
	edge16n	%g2,	%o4,	%g1
	movcs	%icc,	%o5,	%l6
	andcc	%o6,	0x1C9F,	%i7
	movre	%g4,	0x28A,	%i5
	fbuge	%fcc0,	loop_198
loop_198:
	ldub	[%l7 + 0x6C],	%g6
	fmovspos	%icc,	%f9,	%f10
	andcc	%i1,	%o2,	%i3
	udiv	%l5,	0x01A0,	%o7
	ldsb	[%l7 + 0x7D],	%l4
	stb	%l2,	[%l7 + 0x46]
	ldsb	[%l7 + 0x3A],	%g5
	or	%i6,	0x0773,	%i2
	call	loop_199
loop_199:
	movre	%i0,	%g3,	%i4
	fpackfix	%f14,	%f7
	array8	%l0,	%o1,	%l3
	alignaddr	%o0,	%g7,	%l1
	ld	[%l7 + 0x20],	%f9
	tle	%xcc,	0x7
	ldsw	[%l7 + 0x54],	%g2
	movvc	%icc,	%o3,	%g1
	movl	%icc,	%o5,	%l6
	brnz,a	%o4,	loop_200
loop_200:
	stb	%o6,	[%l7 + 0x41]
	sdivx	%i7,	0x1C37,	%g4
	bge,a	loop_201
loop_201:
	fnands	%f12,	%f0,	%f9
	stx	%i5,	[%l7 + 0x58]
	ldub	[%l7 + 0x72],	%g6
	stw	%o2,	[%l7 + 0x0C]
	stx	%i3,	[%l7 + 0x30]
	lduw	[%l7 + 0x74],	%i1
	bleu,pn	%icc,	loop_202
loop_202:
	tn	%xcc,	0x5
	bcs,pt	%xcc,	loop_203
loop_203:
	ldsh	[%l7 + 0x22],	%o7
	addcc	%l5,	%l2,	%g5
	fmovrsgez	%l4,	%f14,	%f8
	movl	%icc,	%i2,	%i6
	ldsb	[%l7 + 0x4C],	%g3
	bvs	loop_204
loop_204:
	udivx	%i0,	0x1C60,	%i4
	brgez,a	%o1,	loop_205
loop_205:
	stw	%l0,	[%l7 + 0x7C]
	fbue,a	%fcc2,	loop_206
loop_206:
	fbule	%fcc1,	loop_207
loop_207:
	ldd	[%l7 + 0x50],	%f0
	addcc	%l3,	%o0,	%g7
	std	%f10,	[%l7 + 0x68]
	addccc	%g2,	0x1383,	%o3
	stx	%g1,	[%l7 + 0x10]
	ldsw	[%l7 + 0x0C],	%l1
	xor	%o5,	0x0C5C,	%l6
	bl,pn	%icc,	loop_208
loop_208:
	bge,a,pt	%icc,	loop_209
loop_209:
	ldd	[%l7 + 0x10],	%f2
	fbg,a	%fcc0,	loop_210
loop_210:
	stb	%o6,	[%l7 + 0x38]
	sllx	%o4,	0x15,	%i7
	alignaddr	%g4,	%i5,	%o2
	fbne,a	%fcc1,	loop_211
loop_211:
	udivx	%g6,	0x1B7C,	%i3
	ldsw	[%l7 + 0x10],	%i1
	ble,a	loop_212
loop_212:
	fbul,a	%fcc3,	loop_213
loop_213:
	edge8l	%o7,	%l5,	%l2
	movrgz	%g5,	0x0C0,	%l4
	mova	%xcc,	%i6,	%i2
	subc	%g3,	%i0,	%i4
	bvc,pn	%icc,	loop_214
loop_214:
	bg,a,pt	%icc,	loop_215
loop_215:
	ldsh	[%l7 + 0x5C],	%l0
	ldd	[%l7 + 0x38],	%f6
	edge32l	%o1,	%l3,	%g7
	fcmple16	%f8,	%f6,	%o0
	fblg	%fcc1,	loop_216
loop_216:
	fmovs	%f3,	%f7
	fbne,a	%fcc3,	loop_217
loop_217:
	fbul	%fcc1,	loop_218
loop_218:
	std	%f0,	[%l7 + 0x28]
	subcc	%o3,	0x1DF7,	%g1
	movcc	%icc,	%g2,	%o5
	ldx	[%l7 + 0x78],	%l1
	or	%o6,	%l6,	%i7
	edge32l	%g4,	%o4,	%o2
	movre	%g6,	%i5,	%i3
	bge	%icc,	loop_219
loop_219:
	fmovsneg	%xcc,	%f0,	%f11
	ldd	[%l7 + 0x38],	%f14
	movne	%icc,	%o7,	%l5
	udivcc	%l2,	0x1D8D,	%i1
	fcmpeq16	%f12,	%f14,	%g5
	fbuge	%fcc0,	loop_220
loop_220:
	ldx	[%l7 + 0x78],	%l4
	bne,a	loop_221
loop_221:
	ldsb	[%l7 + 0x22],	%i6
	ldx	[%l7 + 0x18],	%g3
	edge32	%i2,	%i4,	%l0
	stw	%i0,	[%l7 + 0x0C]
	bpos,a	loop_222
loop_222:
	lduh	[%l7 + 0x2E],	%l3
	edge32ln	%g7,	%o0,	%o1
	movne	%icc,	%g1,	%g2
	sdivx	%o3,	0x02A0,	%o5
	tsubcctv	%l1,	%l6,	%i7
	ba,pt	%icc,	loop_223
loop_223:
	movrlz	%o6,	%g4,	%o2
	bneg,a,pt	%xcc,	loop_224
loop_224:
	fmovsn	%xcc,	%f7,	%f6
	movrlz	%g6,	0x022,	%i5
	lduh	[%l7 + 0x58],	%o4
	fbl	%fcc3,	loop_225
loop_225:
	fba,a	%fcc3,	loop_226
loop_226:
	fnand	%f12,	%f6,	%f8
	bge,a	%icc,	loop_227
loop_227:
	fnand	%f4,	%f6,	%f2
	tne	%xcc,	0x4
	ldd	[%l7 + 0x70],	%f2
	ldsb	[%l7 + 0x10],	%i3
	movre	%o7,	0x372,	%l2
	stx	%l5,	[%l7 + 0x10]
	fble	%fcc2,	loop_228
loop_228:
	edge32	%i1,	%l4,	%i6
	std	%f10,	[%l7 + 0x60]
	stx	%g5,	[%l7 + 0x78]
	fbue	%fcc0,	loop_229
loop_229:
	ldd	[%l7 + 0x60],	%f10
	ldx	[%l7 + 0x08],	%i2
	tn	%icc,	0x7
	tl	%xcc,	0x2
	array32	%g3,	%i4,	%l0
	be	%xcc,	loop_230
loop_230:
	fbug,a	%fcc2,	loop_231
loop_231:
	xorcc	%l3,	0x0363,	%g7
	subcc	%i0,	0x0EDA,	%o1
	sub	%g1,	%g2,	%o0
	sth	%o5,	[%l7 + 0x34]
	ldx	[%l7 + 0x50],	%o3
	edge8	%l6,	%i7,	%l1
	movg	%icc,	%o6,	%g4
	movcs	%icc,	%o2,	%g6
	bcs	loop_232
loop_232:
	tn	%xcc,	0x3
	sth	%o4,	[%l7 + 0x6C]
	te	%xcc,	0x0
	or	%i5,	%o7,	%l2
	bgu,pn	%icc,	loop_233
loop_233:
	fbul,a	%fcc1,	loop_234
loop_234:
	ldd	[%l7 + 0x70],	%f4
	ldx	[%l7 + 0x18],	%i3
	ldsb	[%l7 + 0x32],	%i1
	stx	%l4,	[%l7 + 0x58]
	fbn,a	%fcc1,	loop_235
loop_235:
	call	loop_236
loop_236:
	bgu	loop_237
loop_237:
	movge	%xcc,	%l5,	%i6
	fmovsneg	%xcc,	%f10,	%f0
	lduh	[%l7 + 0x28],	%g5
	srax	%g3,	%i4,	%l0
	xorcc	%i2,	%l3,	%i0
	bpos,pn	%icc,	loop_238
loop_238:
	brlez,a	%g7,	loop_239
loop_239:
	bpos	%icc,	loop_240
loop_240:
	ldub	[%l7 + 0x18],	%g1
	brlz,a	%o1,	loop_241
loop_241:
	taddcctv	%o0,	0x123C,	%o5
	sdivx	%o3,	0x0CB1,	%g2
	bne,pn	%xcc,	loop_242
loop_242:
	fbge	%fcc3,	loop_243
loop_243:
	bleu,a,pn	%xcc,	loop_244
loop_244:
	brlz	%l6,	loop_245
loop_245:
	stx	%i7,	[%l7 + 0x48]
	bcc,a	loop_246
loop_246:
	array32	%o6,	%l1,	%g4
	tsubcctv	%o2,	%o4,	%g6
	stx	%i5,	[%l7 + 0x08]
	bcs,a	loop_247
loop_247:
	andcc	%l2,	%o7,	%i1
	fmovrsgz	%i3,	%f1,	%f2
	fcmpgt32	%f4,	%f4,	%l5
	st	%f8,	[%l7 + 0x30]
	fbule	%fcc0,	loop_248
loop_248:
	edge8	%i6,	%g5,	%l4
	stw	%i4,	[%l7 + 0x68]
	ldx	[%l7 + 0x28],	%g3
	udivcc	%i2,	0x169B,	%l3
	lduw	[%l7 + 0x40],	%l0
	nop
	setx loop_249, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_249:
	brnz,a	%g7,	loop_250
loop_250:
	movcc	%xcc,	%g1,	%o1
	tleu	%xcc,	0x6
	brnz	%i0,	loop_251
loop_251:
	fmovrslz	%o0,	%f9,	%f6
	bpos,a,pt	%xcc,	loop_252
loop_252:
	bg,pt	%icc,	loop_253
loop_253:
	lduw	[%l7 + 0x14],	%o5
	brz	%g2,	loop_254
loop_254:
	fcmpgt16	%f14,	%f4,	%l6
	fble,a	%fcc3,	loop_255
loop_255:
	stw	%o3,	[%l7 + 0x5C]
	bcc,a,pn	%xcc,	loop_256
loop_256:
	movge	%icc,	%i7,	%o6
	fbne,a	%fcc0,	loop_257
loop_257:
	udivx	%l1,	0x031E,	%g4
	bne,pt	%icc,	loop_258
loop_258:
	lduw	[%l7 + 0x18],	%o2
	ldx	[%l7 + 0x30],	%g6
	sth	%i5,	[%l7 + 0x5A]
	bneg,a,pn	%icc,	loop_259
loop_259:
	edge32n	%l2,	%o7,	%o4
	fbne	%fcc1,	loop_260
loop_260:
	fbge,a	%fcc2,	loop_261
loop_261:
	fblg	%fcc0,	loop_262
loop_262:
	bleu	loop_263
loop_263:
	st	%f6,	[%l7 + 0x14]
	lduw	[%l7 + 0x20],	%i1
	movn	%xcc,	%l5,	%i6
	fmovdpos	%icc,	%f2,	%f13
	srax	%i3,	0x09,	%g5
	movpos	%xcc,	%l4,	%i4
	nop
	setx loop_264, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_264:
	edge32ln	%g3,	%l3,	%i2
	brlez,a	%g7,	loop_265
loop_265:
	fcmpes	%fcc2,	%f15,	%f15
	srax	%g1,	%o1,	%l0
	fbule,a	%fcc2,	loop_266
loop_266:
	ldd	[%l7 + 0x20],	%f8
	add	%i0,	0x14E0,	%o0
	brlez,a	%g2,	loop_267
loop_267:
	bcc,a	%icc,	loop_268
loop_268:
	fmovrdlez	%l6,	%f6,	%f6
	fbul	%fcc2,	loop_269
loop_269:
	brgez	%o5,	loop_270
loop_270:
	nop
	setx loop_271, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_271:
	sdivcc	%o3,	0x0B57,	%o6
	bcs,a,pn	%xcc,	loop_272
loop_272:
	bneg,a	%icc,	loop_273
loop_273:
	fmovrslz	%l1,	%f8,	%f9
	sth	%i7,	[%l7 + 0x6A]
	fbule,a	%fcc2,	loop_274
loop_274:
	brgz,a	%g4,	loop_275
loop_275:
	fzero	%f8
	fsrc2	%f14,	%f14
	edge16l	%g6,	%o2,	%i5
	ldsb	[%l7 + 0x64],	%l2
	fbe	%fcc3,	loop_276
loop_276:
	stw	%o4,	[%l7 + 0x28]
	fxors	%f14,	%f14,	%f15
	fbg,a	%fcc1,	loop_277
loop_277:
	fsrc1s	%f14,	%f1
	fbge,a	%fcc1,	loop_278
loop_278:
	fcmple32	%f4,	%f8,	%o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 104
!	Type i   	: 321
!	Type cti   	: 278
!	Type l   	: 297
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
main_t1:

	!# Initialize registers ..

	!# Global registers
	set	0x0,	%g1
	set	0xD,	%g2
	set	0x2,	%g3
	set	0x0,	%g4
	set	0x6,	%g5
	set	0x6,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x8,	%i1
	set	-0x2,	%i2
	set	-0xC,	%i3
	set	-0x6,	%i4
	set	-0x7,	%i5
	set	-0xC,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x2B443C2B,	%l0
	set	0x728F39FD,	%l1
	set	0x16C704C3,	%l2
	set	0x257C46FF,	%l3
	set	0x1E2531A5,	%l4
	set	0x7000BB60,	%l5
	set	0x4E6C97EF,	%l6
	!# Output registers
	set	0x19A8,	%o0
	set	-0x0134,	%o1
	set	-0x03B7,	%o2
	set	0x09A0,	%o3
	set	-0x035F,	%o4
	set	0x0FE7,	%o5
	set	-0x07CC,	%o6
	set	0x0844,	%o7

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

	move	%xcc,	%l5,	%i1
	fcmps	%fcc3,	%f10,	%f15
	fbge	%fcc3,	loop_279
loop_279:
	fmovdvc	%icc,	%f9,	%f10
	fbu	%fcc2,	loop_280
loop_280:
	fmovrdgez	%i6,	%f12,	%f6
	st	%f13,	[%l7 + 0x24]
	fmovsl	%icc,	%f5,	%f10
	ld	[%l7 + 0x10],	%f6
	std	%f6,	[%l7 + 0x18]
	fba,a	%fcc0,	loop_281
loop_281:
	movcs	%icc,	%g5,	%l4
	tn	%xcc,	0x4
	smul	%i3,	0x1600,	%g3
	stx	%i4,	[%l7 + 0x30]
	movrlez	%l3,	%g7,	%i2
	ldub	[%l7 + 0x2B],	%g1
	fmovsa	%xcc,	%f8,	%f10
	array16	%o1,	%l0,	%i0
	ld	[%l7 + 0x60],	%f14
	mulx	%o0,	0x1F40,	%g2
	fnands	%f2,	%f0,	%f5
	addc	%o5,	0x0791,	%o3
	sdivcc	%l6,	0x0312,	%o6
	edge32	%l1,	%i7,	%g4
	fbg	%fcc2,	loop_282
loop_282:
	smul	%g6,	0x0490,	%i5
	fors	%f7,	%f1,	%f5
	movcc	%xcc,	%o2,	%l2
	movg	%xcc,	%o4,	%o7
	fmovsa	%xcc,	%f14,	%f11
	ld	[%l7 + 0x10],	%f14
	edge8n	%i1,	%i6,	%l5
	ldsh	[%l7 + 0x28],	%g5
	nop
	setx loop_283, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_283:
	ld	[%l7 + 0x70],	%f8
	fmovdge	%xcc,	%f11,	%f11
	fbo	%fcc0,	loop_284
loop_284:
	srlx	%i3,	0x1D,	%g3
	fmovse	%xcc,	%f12,	%f13
	fmovdle	%icc,	%f9,	%f12
	fcmpgt16	%f8,	%f4,	%i4
	stb	%l4,	[%l7 + 0x1A]
	subc	%g7,	%i2,	%l3
	fmovsle	%icc,	%f2,	%f0
	brlz	%g1,	loop_285
loop_285:
	fbule	%fcc0,	loop_286
loop_286:
	brgz,a	%o1,	loop_287
loop_287:
	lduw	[%l7 + 0x14],	%i0
	fmovrdgez	%l0,	%f6,	%f0
	edge16ln	%o0,	%g2,	%o3
	movneg	%icc,	%o5,	%o6
	fcmpeq32	%f4,	%f6,	%l6
	xnorcc	%i7,	%g4,	%l1
	fandnot2s	%f14,	%f15,	%f9
	fcmpes	%fcc2,	%f3,	%f9
	sth	%g6,	[%l7 + 0x5C]
	sth	%o2,	[%l7 + 0x38]
	fexpand	%f8,	%f14
	fpmerge	%f0,	%f9,	%f10
	std	%f2,	[%l7 + 0x78]
	fmovdle	%icc,	%f10,	%f8
	ldsw	[%l7 + 0x20],	%i5
	tne	%icc,	0x4
	bshuffle	%f12,	%f2,	%f10
	tn	%xcc,	0x2
	be	%xcc,	loop_288
loop_288:
	fmovrdlez	%o4,	%f10,	%f8
	fpadd32s	%f5,	%f8,	%f15
	fmovsn	%icc,	%f2,	%f11
	sra	%o7,	%l2,	%i6
	fornot1s	%f13,	%f7,	%f13
	fxors	%f12,	%f12,	%f4
	ld	[%l7 + 0x48],	%f14
	fba	%fcc3,	loop_289
loop_289:
	fbue	%fcc3,	loop_290
loop_290:
	fmovrdne	%l5,	%f14,	%f6
	brgez	%i1,	loop_291
loop_291:
	mulx	%g5,	%g3,	%i4
	ldsh	[%l7 + 0x20],	%l4
	std	%f8,	[%l7 + 0x08]
	st	%f10,	[%l7 + 0x40]
	fmovsneg	%icc,	%f4,	%f13
	fba,a	%fcc3,	loop_292
loop_292:
	fandnot1	%f8,	%f8,	%f12
	fmovsl	%icc,	%f0,	%f14
	ldd	[%l7 + 0x18],	%f8
	edge16ln	%g7,	%i2,	%l3
	fmovd	%f6,	%f12
	stx	%i3,	[%l7 + 0x38]
	tle	%icc,	0x2
	fcmpeq32	%f14,	%f4,	%o1
	tvs	%icc,	0x7
	bg,a	%xcc,	loop_293
loop_293:
	tvs	%xcc,	0x4
	fmovsneg	%icc,	%f8,	%f4
	orncc	%g1,	%l0,	%i0
	movge	%icc,	%g2,	%o0
	ldsh	[%l7 + 0x1C],	%o5
	fmovde	%xcc,	%f2,	%f3
	fxor	%f14,	%f12,	%f14
	movg	%icc,	%o3,	%l6
	fmovrdne	%o6,	%f10,	%f10
	stx	%g4,	[%l7 + 0x30]
	brz,a	%i7,	loop_294
loop_294:
	bne	%icc,	loop_295
loop_295:
	movrlez	%l1,	0x30A,	%g6
	tcs	%xcc,	0x0
	fpsub16s	%f0,	%f6,	%f10
	ldd	[%l7 + 0x70],	%f10
	fmovdg	%icc,	%f12,	%f15
	xor	%o2,	%i5,	%o7
	and	%o4,	0x089F,	%l2
	fmovda	%xcc,	%f14,	%f6
	fnegs	%f11,	%f3
	bge,a	loop_296
loop_296:
	ldub	[%l7 + 0x68],	%i6
	tge	%xcc,	0x4
	fmovrslez	%l5,	%f10,	%f3
	bgu	%xcc,	loop_297
loop_297:
	brgz,a	%g5,	loop_298
loop_298:
	fpsub16s	%f11,	%f10,	%f8
	subcc	%g3,	%i4,	%l4
	movrgez	%g7,	0x225,	%i1
	ldx	[%l7 + 0x30],	%i2
	bvs,pt	%icc,	loop_299
loop_299:
	std	%f0,	[%l7 + 0x18]
	fcmple16	%f0,	%f4,	%i3
	fcmpgt32	%f0,	%f2,	%l3
	subc	%o1,	0x1189,	%l0
	fmovsa	%xcc,	%f12,	%f3
	ta	%icc,	0x0
	sdiv	%i0,	0x02EC,	%g1
	fpsub32	%f8,	%f4,	%f14
	fmovrsne	%g2,	%f9,	%f4
	andcc	%o0,	0x0BEA,	%o5
	sth	%o3,	[%l7 + 0x62]
	bcs	%icc,	loop_300
loop_300:
	umulcc	%l6,	0x0637,	%o6
	std	%f6,	[%l7 + 0x68]
	fbule	%fcc0,	loop_301
loop_301:
	sth	%g4,	[%l7 + 0x68]
	fcmpne32	%f6,	%f10,	%i7
	movvc	%xcc,	%g6,	%l1
	fcmpgt32	%f0,	%f4,	%o2
	orncc	%i5,	%o4,	%o7
	fmovrsgez	%i6,	%f3,	%f12
	brlez,a	%l2,	loop_302
loop_302:
	fbug,a	%fcc3,	loop_303
loop_303:
	tneg	%xcc,	0x5
	tsubcctv	%g5,	0x0BF1,	%l5
	lduh	[%l7 + 0x0A],	%i4
	fcmpeq16	%f6,	%f6,	%l4
	lduw	[%l7 + 0x0C],	%g3
	lduh	[%l7 + 0x5C],	%i1
	bpos,a,pt	%icc,	loop_304
loop_304:
	lduh	[%l7 + 0x26],	%g7
	fsrc1s	%f0,	%f10
	lduh	[%l7 + 0x56],	%i2
	tleu	%icc,	0x1
	stb	%l3,	[%l7 + 0x0F]
	ldub	[%l7 + 0x5B],	%o1
	movpos	%icc,	%i3,	%i0
	movvs	%icc,	%g1,	%g2
	movrlez	%l0,	%o5,	%o3
	fmovse	%xcc,	%f6,	%f8
	umulcc	%l6,	%o0,	%o6
	fxnors	%f13,	%f1,	%f6
	bvs	loop_305
loop_305:
	fmovrdne	%i7,	%f10,	%f4
	std	%f14,	[%l7 + 0x70]
	fsrc2s	%f7,	%f2
	fbl,a	%fcc3,	loop_306
loop_306:
	fors	%f8,	%f5,	%f15
	fcmpne32	%f14,	%f14,	%g6
	lduh	[%l7 + 0x6E],	%g4
	ldub	[%l7 + 0x64],	%l1
	fbe	%fcc0,	loop_307
loop_307:
	sdivx	%o2,	0x1724,	%o4
	tg	%icc,	0x6
	sdiv	%o7,	0x0E52,	%i5
	fmovdcc	%icc,	%f2,	%f10
	fones	%f3
	ldsw	[%l7 + 0x3C],	%i6
	edge32	%l2,	%g5,	%l5
	smulcc	%i4,	%g3,	%l4
	st	%f13,	[%l7 + 0x5C]
	stb	%i1,	[%l7 + 0x72]
	stb	%i2,	[%l7 + 0x44]
	brlez	%g7,	loop_308
loop_308:
	sth	%l3,	[%l7 + 0x76]
	ldsh	[%l7 + 0x56],	%o1
	fmovsleu	%xcc,	%f12,	%f13
	fmovrslz	%i0,	%f2,	%f11
	smulcc	%i3,	0x1C81,	%g1
	fmovdge	%icc,	%f7,	%f15
	fmovdg	%icc,	%f8,	%f0
	fcmple32	%f8,	%f8,	%g2
	ld	[%l7 + 0x58],	%f3
	fnot2s	%f3,	%f12
	std	%f12,	[%l7 + 0x10]
	fmul8sux16	%f14,	%f14,	%f4
	bpos,a	%icc,	loop_309
loop_309:
	lduw	[%l7 + 0x7C],	%o5
	fmovdgu	%xcc,	%f0,	%f12
	lduw	[%l7 + 0x3C],	%o3
	movvc	%icc,	%l6,	%l0
	ldsb	[%l7 + 0x35],	%o0
	fsrc2s	%f13,	%f0
	bge,a,pn	%xcc,	loop_310
loop_310:
	fmovdne	%xcc,	%f9,	%f13
	fbne	%fcc2,	loop_311
loop_311:
	fandnot2	%f10,	%f6,	%f6
	fmovrdgz	%o6,	%f6,	%f0
	fmovsg	%icc,	%f8,	%f8
	movvs	%icc,	%i7,	%g6
	subcc	%l1,	%g4,	%o4
	movn	%xcc,	%o7,	%i5
	lduw	[%l7 + 0x68],	%o2
	fxnors	%f12,	%f6,	%f14
	bcs,pn	%xcc,	loop_312
loop_312:
	alignaddr	%i6,	%g5,	%l5
	fmovrslz	%l2,	%f8,	%f7
	subc	%g3,	%l4,	%i4
	edge8	%i1,	%g7,	%l3
	fpadd32	%f6,	%f10,	%f0
	fba,a	%fcc3,	loop_313
loop_313:
	fnor	%f2,	%f0,	%f14
	fmovd	%f6,	%f0
	sethi	0x1E46,	%i2
	stx	%i0,	[%l7 + 0x60]
	udivcc	%o1,	0x1512,	%i3
	fsrc2	%f12,	%f2
	alignaddr	%g2,	%o5,	%g1
	udivx	%o3,	0x02AE,	%l6
	fpsub32	%f10,	%f8,	%f10
	fxor	%f6,	%f6,	%f8
	fmovdvs	%xcc,	%f0,	%f12
	fbe,a	%fcc3,	loop_314
loop_314:
	ldsh	[%l7 + 0x22],	%o0
	fmovs	%f15,	%f9
	fmuld8ulx16	%f3,	%f8,	%f0
	ldsb	[%l7 + 0x3E],	%o6
	bgu,pt	%icc,	loop_315
loop_315:
	std	%f4,	[%l7 + 0x60]
	ld	[%l7 + 0x2C],	%f11
	fmovd	%f2,	%f4
	ble	loop_316
loop_316:
	fornot1s	%f15,	%f4,	%f3
	std	%f14,	[%l7 + 0x28]
	movvc	%icc,	%i7,	%l0
	andcc	%l1,	%g4,	%g6
	sth	%o7,	[%l7 + 0x2C]
	mulscc	%o4,	%o2,	%i5
	stw	%i6,	[%l7 + 0x7C]
	fbuge,a	%fcc2,	loop_317
loop_317:
	lduw	[%l7 + 0x40],	%g5
	st	%f2,	[%l7 + 0x3C]
	movle	%icc,	%l5,	%l2
	fmovde	%xcc,	%f0,	%f5
	fbo	%fcc0,	loop_318
loop_318:
	lduh	[%l7 + 0x2E],	%l4
	fabsd	%f2,	%f4
	fmovrslz	%i4,	%f11,	%f4
	fpsub16	%f2,	%f8,	%f12
	fnand	%f10,	%f14,	%f4
	bleu,a,pn	%xcc,	loop_319
loop_319:
	tleu	%icc,	0x3
	array32	%i1,	%g3,	%l3
	move	%xcc,	%g7,	%i0
	fmul8x16al	%f14,	%f15,	%f14
	stx	%o1,	[%l7 + 0x70]
	fmovda	%icc,	%f7,	%f1
	fmovdvs	%icc,	%f7,	%f15
	fbe	%fcc2,	loop_320
loop_320:
	fbue	%fcc0,	loop_321
loop_321:
	tvs	%icc,	0x2
	alignaddr	%i3,	%g2,	%o5
	tcs	%xcc,	0x5
	fnegs	%f13,	%f13
	bn,pt	%xcc,	loop_322
loop_322:
	call	loop_323
loop_323:
	edge8l	%i2,	%o3,	%l6
	std	%f2,	[%l7 + 0x20]
	movcc	%icc,	%g1,	%o6
	taddcc	%o0,	%l0,	%i7
	popc	0x1B7E,	%l1
	fbl,a	%fcc0,	loop_324
loop_324:
	fmul8x16	%f5,	%f12,	%f2
	andncc	%g6,	%g4,	%o7
	tcc	%xcc,	0x3
	fmovrdgez	%o2,	%f14,	%f12
	ta	%icc,	0x2
	ld	[%l7 + 0x28],	%f3
	bneg,a,pt	%icc,	loop_325
loop_325:
	siam	0x0
	for	%f14,	%f4,	%f14
	fpadd16	%f0,	%f14,	%f8
	addccc	%o4,	%i6,	%i5
	bn,a	loop_326
loop_326:
	movn	%icc,	%l5,	%g5
	stx	%l2,	[%l7 + 0x48]
	sth	%i4,	[%l7 + 0x42]
	fmovs	%f11,	%f5
	fmovrsne	%l4,	%f9,	%f11
	fmul8x16au	%f0,	%f8,	%f10
	movn	%xcc,	%i1,	%l3
	edge8	%g7,	%g3,	%i0
	stx	%i3,	[%l7 + 0x40]
	fmovdn	%icc,	%f0,	%f12
	movleu	%xcc,	%o1,	%g2
	ldsh	[%l7 + 0x0C],	%o5
	fmovrslz	%o3,	%f7,	%f11
	ldsb	[%l7 + 0x26],	%i2
	fmovrdgz	%g1,	%f12,	%f8
	fornot1	%f12,	%f6,	%f8
	fmuld8sux16	%f5,	%f1,	%f4
	ldsh	[%l7 + 0x18],	%l6
	edge16n	%o0,	%l0,	%o6
	andncc	%i7,	%g6,	%l1
	sethi	0x05E3,	%g4
	alignaddr	%o2,	%o7,	%o4
	fmovrsgez	%i5,	%f12,	%f5
	fandnot1s	%f10,	%f9,	%f13
	fcmpeq32	%f0,	%f2,	%i6
	ldsw	[%l7 + 0x7C],	%l5
	movne	%icc,	%g5,	%i4
	andn	%l4,	0x13FD,	%i1
	fpsub16s	%f13,	%f6,	%f1
	ldx	[%l7 + 0x70],	%l2
	fnot1s	%f4,	%f3
	std	%f2,	[%l7 + 0x18]
	pdist	%f8,	%f10,	%f12
	lduw	[%l7 + 0x1C],	%l3
	stx	%g3,	[%l7 + 0x58]
	fpmerge	%f7,	%f14,	%f6
	ldd	[%l7 + 0x28],	%f10
	fbule	%fcc0,	loop_327
loop_327:
	ldub	[%l7 + 0x78],	%g7
	stx	%i3,	[%l7 + 0x78]
	bcs,a	%xcc,	loop_328
loop_328:
	fmovsl	%icc,	%f11,	%f9
	udivcc	%o1,	0x1866,	%g2
	stw	%o5,	[%l7 + 0x34]
	stw	%o3,	[%l7 + 0x3C]
	fcmpd	%fcc0,	%f0,	%f4
	bcc,a,pt	%xcc,	loop_329
loop_329:
	fmovdcc	%icc,	%f2,	%f3
	fmul8x16au	%f1,	%f9,	%f4
	bgu,a,pn	%xcc,	loop_330
loop_330:
	sll	%i0,	%i2,	%l6
	tgu	%icc,	0x6
	lduw	[%l7 + 0x68],	%g1
	fxnors	%f10,	%f4,	%f13
	fcmpd	%fcc3,	%f8,	%f2
	ldx	[%l7 + 0x68],	%l0
	fcmpeq16	%f8,	%f14,	%o6
	mova	%xcc,	%i7,	%o0
	stx	%g6,	[%l7 + 0x48]
	addc	%l1,	0x0703,	%g4
	edge8	%o2,	%o7,	%i5
	fpsub16s	%f7,	%f4,	%f0
	fnot1s	%f3,	%f4
	fmovdl	%xcc,	%f2,	%f4
	movrlz	%o4,	%l5,	%i6
	bg,a,pt	%xcc,	loop_331
loop_331:
	be	loop_332
loop_332:
	fnands	%f12,	%f4,	%f2
	fble,a	%fcc3,	loop_333
loop_333:
	movcc	%xcc,	%g5,	%i4
	ld	[%l7 + 0x60],	%f9
	stb	%i1,	[%l7 + 0x12]
	fnegs	%f9,	%f15
	fmovdpos	%xcc,	%f11,	%f2
	fmovrse	%l4,	%f1,	%f9
	fxor	%f10,	%f4,	%f0
	fbule	%fcc3,	loop_334
loop_334:
	brgez,a	%l2,	loop_335
loop_335:
	nop
	setx loop_336, %l0, %l1
	jmpl %l1, %l3
loop_336:
	fmul8sux16	%f2,	%f6,	%f2
	fcmpes	%fcc1,	%f10,	%f9
	subc	%g7,	%g3,	%i3
	nop
	setx loop_337, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_337:
	fnot1s	%f3,	%f15
	faligndata	%f14,	%f8,	%f2
	fbge,a	%fcc2,	loop_338
loop_338:
	fmovsn	%icc,	%f15,	%f1
	ldsh	[%l7 + 0x4A],	%g2
	fpack16	%f12,	%f10
	srl	%o5,	%o3,	%i0
	tpos	%icc,	0x7
	brgez	%o1,	loop_339
loop_339:
	edge32	%i2,	%l6,	%g1
	stx	%l0,	[%l7 + 0x08]
	fmovrdlz	%i7,	%f12,	%f14
	fmovrslez	%o6,	%f4,	%f10
	fblg	%fcc2,	loop_340
loop_340:
	ldsb	[%l7 + 0x48],	%o0
	fmovd	%f14,	%f14
	fpadd16s	%f12,	%f3,	%f13
	fones	%f15
	fmovspos	%icc,	%f4,	%f15
	fmovdn	%xcc,	%f12,	%f9
	edge16l	%g6,	%g4,	%o2
	fnot1	%f4,	%f8
	fbu,a	%fcc3,	loop_341
loop_341:
	ba,a	loop_342
loop_342:
	fmovspos	%xcc,	%f1,	%f3
	for	%f14,	%f0,	%f12
	fbg	%fcc0,	loop_343
loop_343:
	popc	0x1D38,	%l1
	fmovrdlz	%o7,	%f4,	%f2
	tvs	%icc,	0x2
	movrlez	%o4,	0x28C,	%i5
	bleu	loop_344
loop_344:
	fmovscs	%icc,	%f8,	%f2
	add	%l5,	%i6,	%i4
	ldd	[%l7 + 0x30],	%f10
	std	%f4,	[%l7 + 0x48]
	sra	%i1,	%l4,	%l2
	fmovde	%xcc,	%f2,	%f8
	fmovsneg	%xcc,	%f11,	%f11
	movl	%xcc,	%l3,	%g5
	ld	[%l7 + 0x38],	%f7
	fmovsleu	%icc,	%f10,	%f12
	fmovsne	%xcc,	%f5,	%f12
	movrne	%g3,	%g7,	%g2
	ble,pn	%xcc,	loop_345
loop_345:
	bgu,a,pn	%xcc,	loop_346
loop_346:
	fmovsn	%xcc,	%f11,	%f15
	fmovdgu	%icc,	%f9,	%f13
	fbuge,a	%fcc3,	loop_347
loop_347:
	fnors	%f8,	%f15,	%f10
	bg,a	%xcc,	loop_348
loop_348:
	popc	%o5,	%o3
	sdivx	%i3,	0x0D81,	%i0
	orncc	%o1,	0x1D79,	%i2
	udiv	%g1,	0x0C58,	%l6
	fmovdleu	%xcc,	%f8,	%f13
	fcmpes	%fcc0,	%f14,	%f6
	ba	%xcc,	loop_349
loop_349:
	move	%xcc,	%i7,	%o6
	ble,a	loop_350
loop_350:
	fcmped	%fcc0,	%f10,	%f14
	lduw	[%l7 + 0x40],	%l0
	std	%f14,	[%l7 + 0x48]
	bgu,a,pn	%xcc,	loop_351
loop_351:
	orncc	%g6,	0x1262,	%g4
	fpackfix	%f6,	%f14
	srl	%o0,	0x1E,	%o2
	fmovrsne	%l1,	%f12,	%f7
	orcc	%o7,	0x0273,	%i5
	movleu	%xcc,	%l5,	%i6
	ble,a,pt	%xcc,	loop_352
loop_352:
	lduw	[%l7 + 0x10],	%i4
	call	loop_353
loop_353:
	fmovdl	%xcc,	%f4,	%f1
	movg	%xcc,	%i1,	%o4
	fnor	%f10,	%f12,	%f8
	fmul8sux16	%f10,	%f10,	%f4
	tn	%icc,	0x1
	fbo,a	%fcc2,	loop_354
loop_354:
	edge16	%l4,	%l3,	%g5
	te	%icc,	0x2
	fmul8sux16	%f0,	%f10,	%f6
	fbge	%fcc1,	loop_355
loop_355:
	smulcc	%g3,	%l2,	%g7
	call	loop_356
loop_356:
	ldsb	[%l7 + 0x7A],	%o5
	movcs	%icc,	%g2,	%i3
	fmovdne	%xcc,	%f5,	%f10
	pdist	%f10,	%f10,	%f12
	fbu	%fcc2,	loop_357
loop_357:
	sethi	0x15ED,	%i0
	ldsb	[%l7 + 0x5E],	%o3
	sth	%o1,	[%l7 + 0x72]
	movpos	%icc,	%i2,	%l6
	ld	[%l7 + 0x60],	%f14
	fbg	%fcc1,	loop_358
loop_358:
	fble,a	%fcc1,	loop_359
loop_359:
	ld	[%l7 + 0x38],	%f11
	fcmpd	%fcc3,	%f2,	%f0
	edge16n	%g1,	%i7,	%o6
	add	%g6,	%l0,	%o0
	fpadd32s	%f6,	%f13,	%f3
	brgz	%g4,	loop_360
loop_360:
	fnegs	%f11,	%f5
	fpackfix	%f2,	%f9
	addccc	%o2,	0x1FB5,	%l1
	ldd	[%l7 + 0x58],	%f8
	fpsub16s	%f5,	%f9,	%f10
	st	%f10,	[%l7 + 0x48]
	fbg	%fcc0,	loop_361
loop_361:
	edge32	%o7,	%l5,	%i6
	udivcc	%i5,	0x1CE5,	%i4
	bg,a	loop_362
loop_362:
	st	%f13,	[%l7 + 0x64]
	bleu	%xcc,	loop_363
loop_363:
	ldsh	[%l7 + 0x24],	%i1
	smul	%o4,	%l3,	%l4
	edge8	%g3,	%g5,	%g7
	lduw	[%l7 + 0x58],	%l2
	fbo	%fcc2,	loop_364
loop_364:
	bne,a	loop_365
loop_365:
	be,a,pn	%icc,	loop_366
loop_366:
	ldsb	[%l7 + 0x6B],	%o5
	fbe,a	%fcc2,	loop_367
loop_367:
	fmul8x16au	%f9,	%f4,	%f4
	ldd	[%l7 + 0x58],	%f14
	fbn	%fcc3,	loop_368
loop_368:
	fmovsne	%xcc,	%f6,	%f13
	ldsw	[%l7 + 0x7C],	%g2
	fsrc1s	%f2,	%f14
	movneg	%xcc,	%i3,	%i0
	bcs,a,pt	%icc,	loop_369
loop_369:
	te	%xcc,	0x4
	ldsw	[%l7 + 0x4C],	%o1
	fnors	%f2,	%f7,	%f0
	bg,a,pn	%icc,	loop_370
loop_370:
	fmovsvc	%xcc,	%f6,	%f15
	lduw	[%l7 + 0x7C],	%i2
	stw	%o3,	[%l7 + 0x58]
	move	%icc,	%g1,	%l6
	fbl	%fcc1,	loop_371
loop_371:
	tl	%icc,	0x5
	smul	%i7,	0x1725,	%g6
	tn	%xcc,	0x1
	pdist	%f10,	%f6,	%f0
	fmovsgu	%xcc,	%f15,	%f4
	tvs	%icc,	0x3
	fnot2	%f4,	%f6
	popc	%l0,	%o0
	lduw	[%l7 + 0x7C],	%g4
	xnor	%o2,	%l1,	%o6
	ldsb	[%l7 + 0x3E],	%o7
	fmovrsne	%l5,	%f6,	%f2
	nop
	setx loop_372, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_372:
	fbul	%fcc3,	loop_373
loop_373:
	ldd	[%l7 + 0x38],	%f4
	edge16n	%i6,	%i4,	%i1
	bpos,a,pn	%xcc,	loop_374
loop_374:
	ldsb	[%l7 + 0x0C],	%o4
	smulcc	%i5,	0x17FB,	%l3
	addcc	%l4,	%g5,	%g3
	movg	%xcc,	%g7,	%o5
	sth	%l2,	[%l7 + 0x22]
	fmul8x16au	%f3,	%f6,	%f14
	edge8l	%g2,	%i0,	%o1
	bne,a	loop_375
loop_375:
	bge,a,pn	%xcc,	loop_376
loop_376:
	fnegs	%f0,	%f1
	fmovda	%icc,	%f15,	%f5
	fbne	%fcc0,	loop_377
loop_377:
	fandnot1	%f10,	%f8,	%f10
	andcc	%i2,	%i3,	%o3
	bshuffle	%f4,	%f2,	%f6
	lduw	[%l7 + 0x6C],	%g1
	fmovrdgez	%l6,	%f12,	%f4
	movrgez	%i7,	0x179,	%g6
	popc	0x0E17,	%l0
	ld	[%l7 + 0x78],	%f0
	fcmped	%fcc0,	%f2,	%f4
	sub	%g4,	%o2,	%l1
	fbl	%fcc0,	loop_378
loop_378:
	ble,pt	%xcc,	loop_379
loop_379:
	fandnot1	%f0,	%f4,	%f12
	fmovdvc	%xcc,	%f9,	%f3
	ldx	[%l7 + 0x20],	%o0
	fcmple16	%f10,	%f10,	%o6
	fmovsneg	%xcc,	%f11,	%f2
	ld	[%l7 + 0x64],	%f10
	bneg,a	loop_380
loop_380:
	movneg	%xcc,	%o7,	%l5
	sra	%i4,	%i1,	%i6
	ldsh	[%l7 + 0x64],	%o4
	bvc,a	loop_381
loop_381:
	fblg	%fcc0,	loop_382
loop_382:
	fbule,a	%fcc3,	loop_383
loop_383:
	movleu	%xcc,	%l3,	%i5
	edge8n	%l4,	%g5,	%g7
	fnors	%f15,	%f12,	%f10
	fble	%fcc3,	loop_384
loop_384:
	taddcctv	%o5,	%l2,	%g3
	brgez	%i0,	loop_385
loop_385:
	call	loop_386
loop_386:
	movvc	%xcc,	%g2,	%o1
	srlx	%i2,	%i3,	%o3
	udivcc	%l6,	0x03C8,	%g1
	fornot1	%f2,	%f10,	%f8
	ldub	[%l7 + 0x30],	%g6
	st	%f3,	[%l7 + 0x38]
	fmovsne	%icc,	%f3,	%f8
	lduw	[%l7 + 0x34],	%l0
	fmovspos	%icc,	%f1,	%f11
	ldub	[%l7 + 0x4E],	%i7
	ldub	[%l7 + 0x7A],	%g4
	sra	%l1,	0x1B,	%o2
	smul	%o0,	0x11DF,	%o6
	fcmpne16	%f8,	%f2,	%o7
	fandnot2s	%f11,	%f12,	%f13
	edge32l	%i4,	%l5,	%i6
	bcc	%xcc,	loop_387
loop_387:
	bcc	%icc,	loop_388
loop_388:
	bg,pn	%xcc,	loop_389
loop_389:
	brlz	%i1,	loop_390
loop_390:
	bcs	%xcc,	loop_391
loop_391:
	stb	%l3,	[%l7 + 0x24]
	fcmpd	%fcc2,	%f2,	%f10
	and	%o4,	%i5,	%l4
	fble	%fcc2,	loop_392
loop_392:
	faligndata	%f2,	%f12,	%f0
	tne	%xcc,	0x0
	be,a,pn	%icc,	loop_393
loop_393:
	fmovsgu	%icc,	%f2,	%f8
	fmovrde	%g7,	%f6,	%f12
	fcmpd	%fcc0,	%f14,	%f14
	bvs,pn	%xcc,	loop_394
loop_394:
	fmovs	%f12,	%f8
	fmovsneg	%icc,	%f1,	%f9
	fmovdg	%icc,	%f2,	%f8
	tpos	%xcc,	0x2
	bn,pn	%icc,	loop_395
loop_395:
	subc	%o5,	%g5,	%g3
	fcmped	%fcc3,	%f4,	%f2
	edge8l	%i0,	%l2,	%g2
	ldsw	[%l7 + 0x38],	%o1
	st	%f9,	[%l7 + 0x58]
	movrlez	%i3,	%i2,	%l6
	ld	[%l7 + 0x6C],	%f3
	fnot1	%f8,	%f4
	fexpand	%f14,	%f0
	brgez	%g1,	loop_396
loop_396:
	fmovsle	%xcc,	%f10,	%f10
	tneg	%xcc,	0x5
	brgz,a	%g6,	loop_397
loop_397:
	ta	%icc,	0x3
	bneg	loop_398
loop_398:
	ldsh	[%l7 + 0x3A],	%o3
	bge,a	%xcc,	loop_399
loop_399:
	tgu	%icc,	0x6
	movne	%xcc,	%l0,	%i7
	and	%l1,	%g4,	%o2
	movcs	%icc,	%o6,	%o7
	bvs,a,pt	%xcc,	loop_400
loop_400:
	movrgz	%o0,	%l5,	%i6
	be,a,pt	%xcc,	loop_401
loop_401:
	fba,a	%fcc3,	loop_402
loop_402:
	fcmpd	%fcc3,	%f2,	%f6
	sllx	%i4,	0x13,	%i1
	move	%xcc,	%l3,	%o4
	movneg	%xcc,	%l4,	%g7
	edge8n	%i5,	%o5,	%g5
	fnot1s	%f5,	%f8
	fmovdge	%icc,	%f3,	%f3
	st	%f6,	[%l7 + 0x30]
	fmovrdgz	%g3,	%f14,	%f10
	ldsw	[%l7 + 0x28],	%i0
	stb	%g2,	[%l7 + 0x69]
	fmovrslez	%l2,	%f0,	%f15
	brz,a	%o1,	loop_403
loop_403:
	fbue	%fcc1,	loop_404
loop_404:
	ldsh	[%l7 + 0x46],	%i3
	fornot2s	%f12,	%f4,	%f14
	movrgz	%l6,	%i2,	%g6
	sllx	%g1,	%o3,	%i7
	fbl	%fcc1,	loop_405
loop_405:
	stx	%l1,	[%l7 + 0x70]
	bpos,a,pn	%xcc,	loop_406
loop_406:
	nop
	setx loop_407, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_407:
	ld	[%l7 + 0x38],	%f13
	fmovsn	%icc,	%f6,	%f12
	fands	%f9,	%f1,	%f14
	fmovdcs	%icc,	%f13,	%f12
	nop
	setx loop_408, %l0, %l1
	jmpl %l1, %l0
loop_408:
	lduw	[%l7 + 0x50],	%o2
	lduw	[%l7 + 0x60],	%o6
	fands	%f8,	%f7,	%f4
	movrne	%o7,	%o0,	%l5
	brlz	%g4,	loop_409
loop_409:
	siam	0x2
	tsubcc	%i4,	%i1,	%i6
	ldub	[%l7 + 0x7A],	%l3
	bl	loop_410
loop_410:
	sth	%o4,	[%l7 + 0x7A]
	orn	%l4,	%g7,	%o5
	fornot2	%f10,	%f0,	%f6
	fpackfix	%f4,	%f1
	bvs	%xcc,	loop_411
loop_411:
	tne	%xcc,	0x2
	subccc	%i5,	0x0C64,	%g3
	srl	%g5,	0x0C,	%g2
	stx	%i0,	[%l7 + 0x40]
	fmovsn	%icc,	%f11,	%f4
	fbul,a	%fcc3,	loop_412
loop_412:
	andcc	%l2,	0x1FA5,	%i3
	fmovrslz	%l6,	%f12,	%f15
	movne	%xcc,	%i2,	%o1
	orn	%g6,	0x06BB,	%g1
	tgu	%xcc,	0x5
	tneg	%xcc,	0x3
	ld	[%l7 + 0x2C],	%f7
	smul	%i7,	%o3,	%l1
	sub	%o2,	0x1A3C,	%o6
	fmovdneg	%icc,	%f8,	%f2
	lduh	[%l7 + 0x62],	%l0
	fmovs	%f15,	%f3
	fcmps	%fcc3,	%f10,	%f11
	tn	%xcc,	0x0
	fpsub16	%f10,	%f14,	%f0
	bneg,pn	%icc,	loop_413
loop_413:
	stw	%o7,	[%l7 + 0x10]
	fmovdneg	%icc,	%f6,	%f1
	smul	%o0,	%l5,	%i4
	ldd	[%l7 + 0x50],	%f12
	fmovsleu	%xcc,	%f15,	%f2
	subc	%g4,	%i1,	%l3
	brgz,a	%o4,	loop_414
loop_414:
	fcmped	%fcc1,	%f10,	%f2
	ldd	[%l7 + 0x78],	%f4
	tneg	%icc,	0x1
	fbge	%fcc0,	loop_415
loop_415:
	ldsb	[%l7 + 0x38],	%i6
	fmovsn	%xcc,	%f2,	%f8
	nop
	setx loop_416, %l0, %l1
	jmpl %l1, %g7
loop_416:
	edge8l	%o5,	%l4,	%g3
	for	%f12,	%f6,	%f8
	fornot1	%f6,	%f8,	%f0
	fcmpes	%fcc1,	%f3,	%f14
	fabsd	%f14,	%f4
	xnorcc	%g5,	0x08D6,	%i5
	fmovsge	%icc,	%f3,	%f0
	stx	%g2,	[%l7 + 0x68]
	fmovrdgez	%l2,	%f14,	%f10
	ldd	[%l7 + 0x08],	%f10
	ldsw	[%l7 + 0x50],	%i0
	tpos	%icc,	0x4
	sdivcc	%l6,	0x0123,	%i3
	fands	%f3,	%f7,	%f3
	fmovsvs	%icc,	%f8,	%f4
	edge16ln	%i2,	%g6,	%o1
	udiv	%g1,	0x0885,	%i7
	xor	%o3,	%l1,	%o2
	lduw	[%l7 + 0x18],	%l0
	fnot2	%f14,	%f0
	fpadd32	%f2,	%f12,	%f10
	or	%o6,	%o0,	%o7
	movrlez	%i4,	%l5,	%g4
	fmovrdgz	%i1,	%f0,	%f8
	bpos	%xcc,	loop_417
loop_417:
	ldx	[%l7 + 0x10],	%o4
	movrgz	%l3,	%g7,	%i6
	sdivx	%o5,	0x0404,	%l4
	movneg	%icc,	%g3,	%g5
	fcmple16	%f10,	%f10,	%g2
	tvs	%xcc,	0x1
	fmovrsne	%l2,	%f0,	%f1
	sethi	0x016D,	%i0
	movneg	%icc,	%i5,	%l6
	movneg	%icc,	%i3,	%i2
	stw	%o1,	[%l7 + 0x18]
	fmovrdne	%g1,	%f0,	%f2
	edge32	%g6,	%i7,	%l1
	fmul8x16al	%f15,	%f10,	%f6
	fbu	%fcc3,	loop_418
loop_418:
	alignaddr	%o3,	%l0,	%o2
	udiv	%o0,	0x114A,	%o7
	fbue	%fcc2,	loop_419
loop_419:
	fnot2s	%f0,	%f12
	subcc	%i4,	0x046B,	%l5
	bpos,pt	%xcc,	loop_420
loop_420:
	std	%f14,	[%l7 + 0x10]
	fabss	%f7,	%f2
	srl	%o6,	%g4,	%o4
	fmul8x16al	%f4,	%f9,	%f12
	ldub	[%l7 + 0x60],	%i1
	fandnot1s	%f13,	%f5,	%f9
	ldsh	[%l7 + 0x4E],	%g7
	edge32	%i6,	%l3,	%l4
	fmovsvs	%icc,	%f0,	%f14
	fbo	%fcc3,	loop_421
loop_421:
	fcmpne16	%f14,	%f10,	%o5
	call	loop_422
loop_422:
	fnegd	%f12,	%f6
	fzero	%f8
	fble,a	%fcc2,	loop_423
loop_423:
	xnor	%g5,	0x0E87,	%g2
	fmul8sux16	%f14,	%f2,	%f6
	fandnot2	%f8,	%f4,	%f10
	fpadd32s	%f2,	%f2,	%f4
	fors	%f12,	%f0,	%f11
	ldub	[%l7 + 0x26],	%g3
	fcmpne32	%f14,	%f4,	%i0
	ldd	[%l7 + 0x40],	%f10
	smul	%i5,	%l2,	%i3
	tvs	%icc,	0x3
	fmovdn	%xcc,	%f15,	%f8
	ldsh	[%l7 + 0x60],	%i2
	fpadd32s	%f14,	%f12,	%f13
	std	%f0,	[%l7 + 0x40]
	fmovse	%xcc,	%f1,	%f4
	tg	%icc,	0x5
	fcmpeq32	%f10,	%f2,	%o1
	xor	%g1,	0x12CD,	%g6
	ldsb	[%l7 + 0x2E],	%l6
	fbul,a	%fcc3,	loop_424
loop_424:
	fblg,a	%fcc2,	loop_425
loop_425:
	alignaddr	%i7,	%l1,	%l0
	lduh	[%l7 + 0x0C],	%o3
	sth	%o2,	[%l7 + 0x22]
	fmovspos	%icc,	%f3,	%f2
	ldub	[%l7 + 0x62],	%o7
	movcs	%icc,	%o0,	%i4
	fmovrse	%l5,	%f12,	%f8
	nop
	setx loop_426, %l0, %l1
	jmpl %l1, %g4
loop_426:
	fbul,a	%fcc1,	loop_427
loop_427:
	st	%f8,	[%l7 + 0x6C]
	fmuld8sux16	%f3,	%f3,	%f12
	fpadd32	%f10,	%f10,	%f4
	stx	%o4,	[%l7 + 0x10]
	fnot2s	%f13,	%f4
	stw	%i1,	[%l7 + 0x48]
	ldsb	[%l7 + 0x56],	%g7
	fblg,a	%fcc1,	loop_428
loop_428:
	faligndata	%f10,	%f0,	%f4
	fands	%f6,	%f1,	%f12
	fbge,a	%fcc2,	loop_429
loop_429:
	fmovdvs	%icc,	%f0,	%f6
	mova	%icc,	%o6,	%i6
	bleu	loop_430
loop_430:
	fmovrsgz	%l3,	%f4,	%f8
	bcs,a	%xcc,	loop_431
loop_431:
	fmuld8ulx16	%f11,	%f7,	%f2
	edge8l	%o5,	%g5,	%g2
	bneg,a	loop_432
loop_432:
	ldsh	[%l7 + 0x72],	%l4
	fmovscs	%xcc,	%f4,	%f2
	movre	%g3,	%i0,	%l2
	orncc	%i3,	%i2,	%o1
	fones	%f15
	fble,a	%fcc2,	loop_433
loop_433:
	edge16	%g1,	%i5,	%g6
	tleu	%xcc,	0x4
	ldd	[%l7 + 0x38],	%f0
	stb	%l6,	[%l7 + 0x55]
	xnor	%i7,	%l0,	%l1
	std	%f4,	[%l7 + 0x18]
	lduw	[%l7 + 0x5C],	%o3
	fexpand	%f6,	%f14
	tcc	%icc,	0x0
	fandnot1s	%f1,	%f13,	%f11
	fand	%f4,	%f12,	%f2
	movvc	%icc,	%o2,	%o0
	brgz,a	%i4,	loop_434
loop_434:
	lduw	[%l7 + 0x6C],	%l5
	xnorcc	%o7,	%g4,	%o4
	popc	%i1,	%g7
	ld	[%l7 + 0x78],	%f6
	fcmpne16	%f12,	%f12,	%i6
	fandnot1	%f4,	%f12,	%f10
	sth	%o6,	[%l7 + 0x22]
	fand	%f4,	%f0,	%f2
	ldsb	[%l7 + 0x0B],	%l3
	fmul8x16	%f6,	%f4,	%f8
	fpmerge	%f12,	%f12,	%f14
	srl	%g5,	0x1F,	%g2
	ldx	[%l7 + 0x18],	%o5
	sethi	0x104D,	%g3
	fbe	%fcc3,	loop_435
loop_435:
	edge16l	%i0,	%l4,	%i3
	umulcc	%i2,	0x1326,	%l2
	fmovrsgez	%g1,	%f7,	%f12
	sll	%i5,	0x09,	%g6
	fandnot2	%f12,	%f4,	%f0
	tne	%icc,	0x1
	edge16n	%o1,	%i7,	%l6
	fmovdleu	%xcc,	%f5,	%f14
	fmovdl	%xcc,	%f15,	%f8
	fmul8x16	%f6,	%f8,	%f8
	sdivx	%l0,	0x1AD0,	%l1
	movrlez	%o2,	0x3CC,	%o3
	std	%f14,	[%l7 + 0x68]
	edge8l	%i4,	%l5,	%o0
	movneg	%xcc,	%o7,	%g4
	fmovsne	%xcc,	%f10,	%f3
	st	%f10,	[%l7 + 0x08]
	xor	%i1,	0x1EE9,	%o4
	fmovrdne	%i6,	%f4,	%f14
	fmovse	%icc,	%f10,	%f14
	fsrc1s	%f7,	%f13
	fabss	%f7,	%f3
	fmovsgu	%xcc,	%f0,	%f9
	sethi	0x066A,	%o6
	fmuld8sux16	%f6,	%f4,	%f0
	brlez	%l3,	loop_436
loop_436:
	ldsh	[%l7 + 0x48],	%g7
	movrlz	%g5,	0x384,	%o5
	fnors	%f0,	%f2,	%f12
	ldub	[%l7 + 0x3A],	%g2
	bne,a,pn	%icc,	loop_437
loop_437:
	sth	%g3,	[%l7 + 0x74]
	array32	%i0,	%i3,	%i2
	fmovda	%xcc,	%f13,	%f14
	udivx	%l4,	0x05FA,	%l2
	fmovrsne	%g1,	%f14,	%f4
	fmuld8ulx16	%f10,	%f14,	%f12
	ldsb	[%l7 + 0x59],	%i5
	movneg	%icc,	%o1,	%i7
	tneg	%xcc,	0x4
	ldx	[%l7 + 0x78],	%g6
	fandnot2	%f8,	%f14,	%f0
	fmovdpos	%icc,	%f2,	%f7
	tle	%icc,	0x6
	fmovsvs	%icc,	%f5,	%f9
	bvc,a	%xcc,	loop_438
loop_438:
	fbu	%fcc1,	loop_439
loop_439:
	fnot2s	%f2,	%f2
	fpadd16	%f4,	%f0,	%f4
	bcs,pn	%icc,	loop_440
loop_440:
	fcmpeq32	%f0,	%f12,	%l0
	bne,a	loop_441
loop_441:
	ldsh	[%l7 + 0x16],	%l1
	lduh	[%l7 + 0x1E],	%o2
	siam	0x4
	movcc	%xcc,	%l6,	%i4
	fbe	%fcc0,	loop_442
loop_442:
	fcmpgt32	%f12,	%f12,	%l5
	fbge,a	%fcc2,	loop_443
loop_443:
	siam	0x6
	addc	%o0,	%o3,	%o7
	lduh	[%l7 + 0x34],	%i1
	fmovsa	%xcc,	%f9,	%f0
	xorcc	%g4,	%i6,	%o6
	ldub	[%l7 + 0x45],	%l3
	ldx	[%l7 + 0x60],	%g7
	brlz	%o4,	loop_444
loop_444:
	fmovdvc	%xcc,	%f9,	%f13
	fmovsne	%xcc,	%f15,	%f15
	tcs	%xcc,	0x1
	sth	%g5,	[%l7 + 0x5A]
	sdivx	%g2,	0x1104,	%g3
	bgu,pn	%icc,	loop_445
loop_445:
	fba,a	%fcc3,	loop_446
loop_446:
	or	%o5,	%i3,	%i0
	fblg	%fcc0,	loop_447
loop_447:
	stb	%l4,	[%l7 + 0x3B]
	fpadd16	%f6,	%f4,	%f14
	bneg,a	%xcc,	loop_448
loop_448:
	ldd	[%l7 + 0x48],	%f10
	edge8l	%i2,	%g1,	%l2
	stb	%o1,	[%l7 + 0x2A]
	brgz,a	%i7,	loop_449
loop_449:
	fbg,a	%fcc3,	loop_450
loop_450:
	ldub	[%l7 + 0x63],	%g6
	bleu	loop_451
loop_451:
	lduh	[%l7 + 0x38],	%l0
	bn,a	%xcc,	loop_452
loop_452:
	fmul8x16	%f1,	%f10,	%f8
	ldsh	[%l7 + 0x08],	%l1
	ldsb	[%l7 + 0x78],	%o2
	fpmerge	%f13,	%f6,	%f6
	lduh	[%l7 + 0x38],	%i5
	fand	%f12,	%f2,	%f14
	fpsub16s	%f8,	%f5,	%f5
	fmovdneg	%icc,	%f3,	%f2
	edge32l	%l6,	%l5,	%i4
	edge16l	%o3,	%o0,	%o7
	fcmple16	%f14,	%f6,	%i1
	smul	%g4,	0x172C,	%o6
	fnors	%f2,	%f12,	%f13
	fnand	%f4,	%f6,	%f12
	fnot1s	%f12,	%f11
	nop
	setx loop_453, %l0, %l1
	jmpl %l1, %i6
loop_453:
	stw	%l3,	[%l7 + 0x38]
	fnand	%f8,	%f8,	%f6
	bneg	%xcc,	loop_454
loop_454:
	fpackfix	%f6,	%f6
	fbuge	%fcc0,	loop_455
loop_455:
	fmul8x16au	%f9,	%f6,	%f10
	ldx	[%l7 + 0x38],	%g7
	ldsh	[%l7 + 0x2A],	%o4
	brgz	%g5,	loop_456
loop_456:
	fornot2	%f12,	%f8,	%f2
	sllx	%g3,	%g2,	%i3
	alignaddrl	%o5,	%l4,	%i0
	st	%f13,	[%l7 + 0x70]
	fbl	%fcc1,	loop_457
loop_457:
	faligndata	%f14,	%f6,	%f10
	addcc	%g1,	%l2,	%o1
	fmovrsne	%i7,	%f8,	%f11
	movrne	%i2,	%l0,	%g6
	fnor	%f8,	%f0,	%f2
	fnors	%f8,	%f12,	%f8
	taddcc	%l1,	%i5,	%l6
	fandnot1s	%f6,	%f8,	%f14
	fcmpes	%fcc3,	%f2,	%f1
	fbuge,a	%fcc0,	loop_458
loop_458:
	tle	%xcc,	0x6
	and	%l5,	%i4,	%o3
	fba	%fcc2,	loop_459
loop_459:
	tg	%xcc,	0x6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type f   	: 332
!	Type cti   	: 181
!	Type i   	: 282
!	Type l   	: 205
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
main_t2:

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0xE,	%g2
	set	0xC,	%g3
	set	0x4,	%g4
	set	0x7,	%g5
	set	0x1,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x1,	%i1
	set	-0xD,	%i2
	set	-0x7,	%i3
	set	-0x7,	%i4
	set	-0x8,	%i5
	set	-0x9,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x2AFAEE44,	%l0
	set	0x76D55C77,	%l1
	set	0x5CE01E9D,	%l2
	set	0x1F47A1CA,	%l3
	set	0x69116A43,	%l4
	set	0x09F048AA,	%l5
	set	0x5383DA15,	%l6
	!# Output registers
	set	-0x13B1,	%o0
	set	-0x0B53,	%o1
	set	0x0559,	%o2
	set	-0x103F,	%o3
	set	0x1D33,	%o4
	set	0x0E0A,	%o5
	set	-0x1A9A,	%o6
	set	-0x0A96,	%o7

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

	fmovsa	%icc,	%f0,	%f9
	tsubcctv	%o0,	%o2,	%i1
	sethi	0x180E,	%g4
	mova	%xcc,	%o6,	%o7
	ld	[%l7 + 0x48],	%f15
	fcmped	%fcc1,	%f12,	%f10
	fbo,a	%fcc3,	loop_460
loop_460:
	ta	%xcc,	0x7
	tvs	%icc,	0x7
	xnor	%l3,	%i6,	%g7
	udiv	%g5,	0x1AFB,	%o4
	fmul8x16al	%f2,	%f2,	%f14
	fcmple16	%f10,	%f2,	%g3
	sra	%i3,	0x09,	%g2
	movrgz	%o5,	%i0,	%l4
	brgez	%g1,	loop_461
loop_461:
	ld	[%l7 + 0x58],	%f6
	fmul8x16	%f2,	%f4,	%f0
	fmovdn	%xcc,	%f9,	%f15
	fpmerge	%f5,	%f13,	%f14
	movrlez	%l2,	%o1,	%i7
	udivcc	%l0,	0x039F,	%i2
	sth	%g6,	[%l7 + 0x6C]
	st	%f10,	[%l7 + 0x68]
	xnor	%i5,	0x0AE7,	%l6
	orcc	%l5,	%l1,	%o3
	array32	%o0,	%i4,	%i1
	orn	%o2,	0x1850,	%g4
	edge16ln	%o6,	%o7,	%l3
	movpos	%icc,	%g7,	%i6
	edge8ln	%o4,	%g5,	%i3
	sdivcc	%g3,	0x1008,	%o5
	tcc	%xcc,	0x6
	movgu	%icc,	%g2,	%i0
	udivx	%g1,	0x1BE4,	%l2
	array8	%l4,	%o1,	%i7
	addc	%l0,	%g6,	%i2
	fmul8ulx16	%f10,	%f2,	%f4
	tgu	%xcc,	0x3
	fmovdne	%xcc,	%f3,	%f13
	fbug	%fcc1,	loop_462
loop_462:
	ldub	[%l7 + 0x0E],	%l6
	nop
	setx loop_463, %l0, %l1
	jmpl %l1, %l5
loop_463:
	bcs	loop_464
loop_464:
	ldd	[%l7 + 0x18],	%f14
	sra	%l1,	%i5,	%o0
	sra	%i4,	0x02,	%i1
	edge32n	%o2,	%o3,	%o6
	st	%f12,	[%l7 + 0x48]
	brz	%g4,	loop_465
loop_465:
	nop
	setx loop_466, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_466:
	movvs	%icc,	%l3,	%g7
	stb	%o7,	[%l7 + 0x4A]
	fmul8x16au	%f9,	%f3,	%f0
	fcmps	%fcc0,	%f9,	%f15
	fmovsg	%xcc,	%f7,	%f15
	andcc	%i6,	%g5,	%i3
	movle	%xcc,	%o4,	%g3
	sllx	%g2,	0x14,	%o5
	ldsw	[%l7 + 0x08],	%i0
	brz,a	%l2,	loop_467
loop_467:
	lduw	[%l7 + 0x48],	%l4
	stb	%o1,	[%l7 + 0x0F]
	fones	%f12
	udivx	%g1,	0x0361,	%i7
	fbn	%fcc0,	loop_468
loop_468:
	orn	%l0,	%i2,	%l6
	ta	%xcc,	0x3
	tleu	%icc,	0x5
	movrgz	%g6,	0x2C8,	%l5
	movrlez	%i5,	0x04D,	%o0
	movrgz	%i4,	%l1,	%i1
	fmovsg	%xcc,	%f5,	%f2
	sub	%o2,	0x0AC6,	%o6
	movgu	%xcc,	%o3,	%g4
	movre	%l3,	0x050,	%o7
	ldx	[%l7 + 0x30],	%i6
	bvs,pn	%xcc,	loop_469
loop_469:
	sdiv	%g7,	0x0E51,	%i3
	ldsh	[%l7 + 0x64],	%o4
	bpos,a	%xcc,	loop_470
loop_470:
	nop
	setx loop_471, %l0, %l1
	jmpl %l1, %g3
loop_471:
	udiv	%g2,	0x139A,	%o5
	udivcc	%g5,	0x0607,	%l2
	movrgz	%i0,	%o1,	%g1
	addcc	%l4,	0x12CB,	%i7
	movg	%icc,	%l0,	%i2
	array32	%g6,	%l6,	%l5
	tge	%xcc,	0x2
	std	%f8,	[%l7 + 0x60]
	umul	%i5,	0x0071,	%o0
	lduh	[%l7 + 0x66],	%l1
	ldub	[%l7 + 0x79],	%i1
	fmul8ulx16	%f2,	%f0,	%f10
	udivx	%o2,	0x003D,	%o6
	tsubcc	%i4,	0x06EC,	%g4
	addccc	%l3,	0x0AE2,	%o3
	bpos	loop_472
loop_472:
	tne	%xcc,	0x6
	sth	%o7,	[%l7 + 0x46]
	mova	%xcc,	%i6,	%g7
	taddcctv	%o4,	%g3,	%g2
	sth	%i3,	[%l7 + 0x68]
	fnands	%f14,	%f2,	%f12
	fmovdvs	%xcc,	%f14,	%f11
	fnands	%f13,	%f14,	%f12
	fands	%f3,	%f6,	%f6
	bne	loop_473
loop_473:
	tg	%icc,	0x7
	orn	%g5,	0x0122,	%l2
	tle	%xcc,	0x4
	taddcctv	%o5,	%o1,	%g1
	fnors	%f7,	%f11,	%f4
	mova	%icc,	%i0,	%i7
	ldsw	[%l7 + 0x40],	%l4
	sra	%l0,	%i2,	%g6
	smul	%l5,	%i5,	%o0
	orn	%l6,	0x01B6,	%i1
	subcc	%o2,	%l1,	%i4
	lduw	[%l7 + 0x60],	%o6
	array16	%l3,	%o3,	%o7
	array8	%i6,	%g7,	%g4
	tleu	%xcc,	0x1
	alignaddrl	%o4,	%g2,	%i3
	tl	%xcc,	0x4
	fpack32	%f2,	%f0,	%f6
	tcs	%xcc,	0x4
	fnands	%f1,	%f15,	%f12
	fbul	%fcc3,	loop_474
loop_474:
	xorcc	%g5,	%g3,	%o5
	fsrc1s	%f14,	%f9
	tvc	%icc,	0x3
	andncc	%o1,	%g1,	%l2
	ldsw	[%l7 + 0x30],	%i0
	fnot2	%f10,	%f10
	andn	%i7,	%l4,	%i2
	addcc	%l0,	%l5,	%i5
	sdivcc	%g6,	0x011D,	%l6
	stx	%o0,	[%l7 + 0x40]
	movvc	%xcc,	%i1,	%o2
	fmul8sux16	%f8,	%f12,	%f2
	addcc	%i4,	0x0C70,	%l1
	fzeros	%f11
	fbn	%fcc3,	loop_475
loop_475:
	edge16ln	%o6,	%o3,	%l3
	sra	%o7,	0x15,	%g7
	xnorcc	%i6,	%g4,	%o4
	fmovscc	%icc,	%f7,	%f14
	ble,a,pn	%xcc,	loop_476
loop_476:
	add	%g2,	%i3,	%g3
	std	%f8,	[%l7 + 0x58]
	bvc	%icc,	loop_477
loop_477:
	fmovdcs	%icc,	%f14,	%f4
	movrgz	%g5,	%o5,	%g1
	pdist	%f10,	%f6,	%f0
	edge8	%l2,	%o1,	%i0
	fmovdg	%icc,	%f2,	%f14
	ba,a,pn	%xcc,	loop_478
loop_478:
	edge8	%i7,	%i2,	%l4
	tg	%icc,	0x5
	and	%l0,	0x0183,	%i5
	tvs	%icc,	0x5
	nop
	setx loop_479, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_479:
	addc	%g6,	%l5,	%o0
	fmovrsne	%i1,	%f14,	%f2
	ldsh	[%l7 + 0x48],	%l6
	fmovsvc	%xcc,	%f13,	%f11
	srlx	%i4,	%o2,	%o6
	mulx	%l1,	%o3,	%l3
	mulx	%o7,	%g7,	%g4
	fnands	%f7,	%f7,	%f1
	ld	[%l7 + 0x1C],	%f10
	sth	%o4,	[%l7 + 0x2E]
	fornot2	%f14,	%f8,	%f10
	subcc	%i6,	%i3,	%g3
	fandnot1s	%f6,	%f0,	%f12
	xnorcc	%g5,	0x137D,	%o5
	stw	%g2,	[%l7 + 0x3C]
	bvc	%xcc,	loop_480
loop_480:
	bvc,pt	%icc,	loop_481
loop_481:
	ldd	[%l7 + 0x20],	%f4
	fmovsne	%icc,	%f1,	%f3
	movcs	%icc,	%g1,	%l2
	smul	%i0,	%o1,	%i2
	fpsub32s	%f11,	%f8,	%f15
	edge16n	%l4,	%l0,	%i7
	tleu	%xcc,	0x5
	addccc	%i5,	%l5,	%o0
	sub	%g6,	0x07ED,	%l6
	srlx	%i1,	%o2,	%o6
	edge8l	%i4,	%l1,	%l3
	fbu	%fcc1,	loop_482
loop_482:
	fble	%fcc3,	loop_483
loop_483:
	movpos	%xcc,	%o3,	%g7
	movl	%xcc,	%g4,	%o7
	tge	%icc,	0x4
	st	%f8,	[%l7 + 0x6C]
	udivcc	%i6,	0x1FCC,	%i3
	sdivcc	%g3,	0x196A,	%g5
	sethi	0x06F9,	%o4
	fnegs	%f2,	%f14
	fbge	%fcc2,	loop_484
loop_484:
	sllx	%g2,	%g1,	%l2
	udivcc	%o5,	0x1D0B,	%i0
	sth	%o1,	[%l7 + 0x68]
	andcc	%i2,	%l0,	%i7
	fmovscs	%xcc,	%f0,	%f9
	ldd	[%l7 + 0x58],	%f12
	lduw	[%l7 + 0x6C],	%i5
	fzero	%f12
	fbl	%fcc0,	loop_485
loop_485:
	ldub	[%l7 + 0x6B],	%l4
	fpadd32	%f8,	%f0,	%f12
	fmovd	%f14,	%f10
	movvc	%xcc,	%l5,	%g6
	fsrc1s	%f15,	%f11
	fble	%fcc2,	loop_486
loop_486:
	fmovdcc	%xcc,	%f5,	%f6
	and	%o0,	%l6,	%o2
	ldd	[%l7 + 0x28],	%f6
	addccc	%i1,	%i4,	%o6
	sth	%l1,	[%l7 + 0x18]
	bcc	%xcc,	loop_487
loop_487:
	umulcc	%l3,	0x0CE4,	%o3
	subc	%g4,	%g7,	%o7
	std	%f0,	[%l7 + 0x60]
	fmovsn	%icc,	%f0,	%f6
	subc	%i3,	%g3,	%i6
	bg	%xcc,	loop_488
loop_488:
	movle	%icc,	%g5,	%o4
	fornot1s	%f5,	%f11,	%f8
	umul	%g2,	%g1,	%l2
	brnz,a	%i0,	loop_489
loop_489:
	fmovrsgez	%o1,	%f4,	%f13
	tl	%icc,	0x0
	sdivcc	%i2,	0x0E2F,	%o5
	xnorcc	%l0,	0x0E11,	%i7
	fbule	%fcc0,	loop_490
loop_490:
	edge16ln	%i5,	%l5,	%l4
	sllx	%o0,	%l6,	%o2
	movre	%i1,	%g6,	%i4
	fmovsvs	%icc,	%f4,	%f13
	brz	%l1,	loop_491
loop_491:
	stw	%l3,	[%l7 + 0x14]
	array8	%o3,	%o6,	%g7
	stb	%o7,	[%l7 + 0x77]
	bne	%icc,	loop_492
loop_492:
	fmovrsgez	%g4,	%f6,	%f13
	ldsh	[%l7 + 0x34],	%i3
	stw	%i6,	[%l7 + 0x74]
	fmovscs	%icc,	%f0,	%f14
	sethi	0x1CB7,	%g3
	fands	%f6,	%f8,	%f7
	tcs	%icc,	0x0
	tcc	%icc,	0x6
	fmovsvc	%icc,	%f9,	%f12
	tle	%icc,	0x5
	faligndata	%f10,	%f12,	%f14
	alignaddrl	%o4,	%g2,	%g5
	fornot1s	%f11,	%f13,	%f3
	taddcc	%l2,	%i0,	%o1
	bl,pt	%icc,	loop_493
loop_493:
	srl	%i2,	0x14,	%g1
	te	%xcc,	0x6
	bvs,a,pt	%xcc,	loop_494
loop_494:
	fmovdvs	%xcc,	%f12,	%f14
	movrlez	%o5,	%l0,	%i5
	movpos	%icc,	%l5,	%l4
	tvs	%xcc,	0x3
	fmovd	%f14,	%f0
	fexpand	%f0,	%f4
	fmovrslz	%o0,	%f5,	%f10
	ld	[%l7 + 0x60],	%f9
	smul	%l6,	0x18CD,	%o2
	tpos	%xcc,	0x2
	fmovsne	%xcc,	%f2,	%f3
	edge32	%i1,	%i7,	%g6
	movrne	%l1,	0x3F8,	%l3
	fpsub32	%f10,	%f4,	%f12
	fpmerge	%f11,	%f9,	%f12
	fpsub16s	%f10,	%f2,	%f3
	ldsw	[%l7 + 0x44],	%o3
	fmovdg	%xcc,	%f13,	%f2
	ldx	[%l7 + 0x78],	%o6
	fbne	%fcc3,	loop_495
loop_495:
	udiv	%i4,	0x049C,	%g7
	sllx	%g4,	%i3,	%i6
	alignaddrl	%o7,	%o4,	%g2
	fbg,a	%fcc1,	loop_496
loop_496:
	tvs	%icc,	0x3
	udivcc	%g5,	0x13DF,	%g3
	srl	%l2,	%o1,	%i2
	ldd	[%l7 + 0x08],	%f6
	tgu	%xcc,	0x0
	udivx	%i0,	0x1C7D,	%g1
	popc	0x0326,	%l0
	edge32	%i5,	%l5,	%l4
	fbue,a	%fcc1,	loop_497
loop_497:
	movn	%icc,	%o0,	%l6
	brlz	%o2,	loop_498
loop_498:
	ldsb	[%l7 + 0x1C],	%o5
	lduw	[%l7 + 0x20],	%i7
	stw	%i1,	[%l7 + 0x2C]
	sdiv	%g6,	0x1A2D,	%l3
	or	%l1,	0x1716,	%o6
	tge	%xcc,	0x7
	smulcc	%o3,	%g7,	%g4
	alignaddr	%i4,	%i6,	%o7
	xor	%i3,	0x1BDE,	%g2
	bgu,a,pt	%xcc,	loop_499
loop_499:
	addcc	%g5,	0x0FD5,	%g3
	fbl	%fcc0,	loop_500
loop_500:
	fble,a	%fcc3,	loop_501
loop_501:
	fmovdgu	%xcc,	%f0,	%f7
	ldsb	[%l7 + 0x59],	%l2
	edge32n	%o4,	%o1,	%i2
	tne	%xcc,	0x6
	edge16n	%g1,	%l0,	%i0
	tgu	%xcc,	0x5
	fmovsge	%xcc,	%f11,	%f0
	andn	%l5,	0x0C41,	%i5
	edge32	%o0,	%l6,	%o2
	xor	%o5,	%i7,	%i1
	fmuld8ulx16	%f15,	%f9,	%f8
	fmovsa	%icc,	%f2,	%f9
	taddcc	%l4,	0x1603,	%g6
	fabsd	%f10,	%f8
	movgu	%xcc,	%l3,	%l1
	movleu	%icc,	%o6,	%o3
	fands	%f10,	%f10,	%f5
	movgu	%xcc,	%g7,	%i4
	ta	%icc,	0x1
	movrne	%g4,	0x3A7,	%o7
	brz	%i6,	loop_502
loop_502:
	udivx	%g2,	0x1A19,	%i3
	sdivcc	%g5,	0x16A3,	%g3
	sllx	%l2,	0x1C,	%o1
	lduw	[%l7 + 0x5C],	%o4
	andcc	%i2,	0x1B54,	%g1
	xorcc	%i0,	0x12EE,	%l5
	bneg	loop_503
loop_503:
	fmovsleu	%icc,	%f10,	%f12
	udiv	%l0,	0x0682,	%i5
	edge32ln	%o0,	%l6,	%o5
	bn,pn	%xcc,	loop_504
loop_504:
	edge8n	%o2,	%i1,	%i7
	movgu	%xcc,	%g6,	%l3
	orcc	%l4,	0x0E08,	%l1
	udivx	%o6,	0x0EBF,	%g7
	fandnot1s	%f14,	%f15,	%f7
	edge16ln	%i4,	%g4,	%o7
	sethi	0x043C,	%i6
	addc	%g2,	0x1732,	%o3
	sra	%i3,	0x0A,	%g5
	mulscc	%l2,	0x18F4,	%o1
	sub	%g3,	0x090A,	%i2
	andn	%g1,	0x0ED1,	%o4
	array32	%i0,	%l0,	%l5
	ldx	[%l7 + 0x28],	%i5
	udivx	%o0,	0x1329,	%o5
	movrne	%l6,	0x199,	%i1
	tge	%xcc,	0x7
	fbg	%fcc3,	loop_505
loop_505:
	tcs	%icc,	0x5
	fcmps	%fcc1,	%f10,	%f2
	sub	%i7,	0x1B33,	%g6
	orncc	%o2,	0x0A42,	%l4
	edge16n	%l1,	%l3,	%g7
	stb	%o6,	[%l7 + 0x53]
	movrgz	%g4,	0x2A1,	%i4
	orn	%i6,	0x1994,	%g2
	tle	%xcc,	0x2
	tg	%icc,	0x5
	move	%xcc,	%o3,	%i3
	ldx	[%l7 + 0x10],	%o7
	brz,a	%l2,	loop_506
loop_506:
	fmovdleu	%xcc,	%f6,	%f3
	stb	%o1,	[%l7 + 0x10]
	tneg	%xcc,	0x0
	fbg,a	%fcc1,	loop_507
loop_507:
	bcc,a	loop_508
loop_508:
	orncc	%g5,	%g3,	%g1
	fmovdge	%icc,	%f15,	%f5
	edge32	%o4,	%i0,	%l0
	udivx	%l5,	0x199D,	%i5
	nop
	setx loop_509, %l0, %l1
	jmpl %l1, %i2
loop_509:
	and	%o0,	%o5,	%l6
	fmuld8ulx16	%f13,	%f15,	%f8
	fmovsleu	%xcc,	%f9,	%f2
	edge16	%i7,	%g6,	%i1
	fmul8ulx16	%f2,	%f2,	%f2
	movvs	%icc,	%l4,	%l1
	tne	%icc,	0x1
	movge	%xcc,	%o2,	%l3
	fmul8sux16	%f0,	%f6,	%f0
	bne,a	loop_510
loop_510:
	and	%g7,	%g4,	%i4
	ldx	[%l7 + 0x40],	%o6
	move	%icc,	%g2,	%o3
	fbug	%fcc0,	loop_511
loop_511:
	andn	%i6,	%o7,	%l2
	subcc	%o1,	%g5,	%i3
	tcs	%xcc,	0x0
	fpack16	%f10,	%f2
	ta	%icc,	0x4
	ta	%icc,	0x3
	edge8ln	%g3,	%o4,	%i0
	sllx	%g1,	%l0,	%i5
	brlez,a	%l5,	loop_512
loop_512:
	movgu	%xcc,	%o0,	%i2
	fcmpgt32	%f12,	%f14,	%o5
	subccc	%l6,	%i7,	%g6
	tcc	%icc,	0x2
	edge32	%i1,	%l1,	%l4
	stx	%o2,	[%l7 + 0x58]
	fsrc2	%f6,	%f14
	edge8	%l3,	%g7,	%i4
	te	%icc,	0x3
	movn	%xcc,	%g4,	%g2
	fornot1s	%f6,	%f9,	%f6
	tsubcc	%o6,	%o3,	%i6
	bpos,a,pn	%icc,	loop_513
loop_513:
	edge32	%o7,	%o1,	%l2
	fmovd	%f8,	%f8
	lduh	[%l7 + 0x0E],	%i3
	addc	%g3,	%g5,	%o4
	fbe	%fcc0,	loop_514
loop_514:
	fmul8ulx16	%f8,	%f12,	%f2
	ldsw	[%l7 + 0x38],	%g1
	ldub	[%l7 + 0x56],	%l0
	ld	[%l7 + 0x48],	%f15
	edge16	%i5,	%i0,	%o0
	tvs	%icc,	0x5
	movl	%icc,	%i2,	%o5
	fnors	%f13,	%f1,	%f5
	tsubcctv	%l6,	0x1EFA,	%i7
	add	%l5,	%i1,	%g6
	edge32	%l1,	%o2,	%l4
	stb	%g7,	[%l7 + 0x76]
	fsrc2s	%f3,	%f0
	edge32l	%l3,	%i4,	%g4
	mulscc	%o6,	%o3,	%i6
	tleu	%xcc,	0x5
	fpmerge	%f3,	%f0,	%f12
	tcc	%icc,	0x1
	array16	%o7,	%o1,	%l2
	fnor	%f8,	%f12,	%f12
	lduh	[%l7 + 0x3A],	%i3
	edge16ln	%g3,	%g5,	%g2
	edge8l	%g1,	%o4,	%i5
	tcc	%icc,	0x2
	brlez	%l0,	loop_515
loop_515:
	movvc	%icc,	%i0,	%i2
	movrlz	%o0,	0x275,	%o5
	ldsw	[%l7 + 0x70],	%l6
	andncc	%i7,	%i1,	%l5
	movne	%xcc,	%g6,	%l1
	mulscc	%o2,	0x13D1,	%l4
	tne	%icc,	0x7
	bn	loop_516
loop_516:
	addcc	%l3,	0x0050,	%i4
	tvs	%icc,	0x3
	srlx	%g4,	0x07,	%o6
	fsrc1s	%f1,	%f8
	bg,a,pn	%icc,	loop_517
loop_517:
	add	%g7,	%o3,	%i6
	movrne	%o7,	%o1,	%l2
	addc	%g3,	%g5,	%g2
	umul	%g1,	0x0D4A,	%i3
	umul	%o4,	0x0FEE,	%i5
	stx	%i0,	[%l7 + 0x10]
	movvs	%xcc,	%i2,	%o0
	fmovrde	%o5,	%f0,	%f0
	addccc	%l0,	%l6,	%i7
	subccc	%l5,	0x1EE8,	%g6
	tvs	%icc,	0x5
	fors	%f11,	%f8,	%f0
	fnot2s	%f13,	%f15
	mulx	%i1,	0x0608,	%l1
	fmovd	%f10,	%f14
	edge32l	%o2,	%l4,	%l3
	sth	%g4,	[%l7 + 0x70]
	edge32l	%i4,	%g7,	%o6
	fmovsl	%xcc,	%f2,	%f7
	sra	%i6,	%o3,	%o7
	tsubcc	%o1,	0x1297,	%g3
	tleu	%icc,	0x7
	movge	%xcc,	%g5,	%g2
	siam	0x5
	fbu,a	%fcc3,	loop_518
loop_518:
	srax	%l2,	0x10,	%i3
	movrgez	%g1,	%i5,	%i0
	bneg	%icc,	loop_519
loop_519:
	xor	%o4,	0x1511,	%o0
	sth	%i2,	[%l7 + 0x30]
	fpadd32s	%f3,	%f4,	%f3
	andcc	%o5,	0x191C,	%l0
	fmovdne	%icc,	%f12,	%f14
	fandnot1s	%f8,	%f12,	%f3
	tle	%icc,	0x0
	tsubcctv	%l6,	%l5,	%g6
	movcc	%xcc,	%i1,	%l1
	movpos	%xcc,	%o2,	%i7
	fpack32	%f4,	%f4,	%f6
	fmovde	%icc,	%f13,	%f2
	xorcc	%l4,	0x1056,	%l3
	movcs	%icc,	%g4,	%g7
	smulcc	%o6,	%i4,	%o3
	bleu,a,pn	%xcc,	loop_520
loop_520:
	tne	%xcc,	0x3
	addc	%o7,	0x1A45,	%i6
	xor	%o1,	0x1093,	%g5
	smul	%g2,	%l2,	%i3
	lduw	[%l7 + 0x68],	%g3
	movg	%xcc,	%g1,	%i0
	alignaddr	%o4,	%i5,	%i2
	ldsw	[%l7 + 0x70],	%o5
	mova	%xcc,	%l0,	%l6
	add	%l5,	%o0,	%i1
	sllx	%g6,	%o2,	%l1
	subccc	%l4,	0x08AC,	%i7
	edge8ln	%g4,	%l3,	%o6
	ldsh	[%l7 + 0x12],	%i4
	mulx	%o3,	%g7,	%o7
	fmovrsne	%o1,	%f13,	%f7
	tg	%icc,	0x2
	addccc	%g5,	0x1232,	%i6
	movrlz	%g2,	0x293,	%i3
	alignaddrl	%g3,	%l2,	%g1
	tneg	%icc,	0x7
	fbul	%fcc0,	loop_521
loop_521:
	sth	%i0,	[%l7 + 0x36]
	fble,a	%fcc3,	loop_522
loop_522:
	fnot2	%f4,	%f4
	movg	%xcc,	%o4,	%i5
	movrgez	%i2,	0x15D,	%l0
	orcc	%l6,	%o5,	%l5
	tle	%icc,	0x1
	smul	%o0,	%g6,	%o2
	movg	%xcc,	%i1,	%l1
	fxnors	%f8,	%f15,	%f11
	movl	%xcc,	%l4,	%g4
	bge,pn	%icc,	loop_523
loop_523:
	subcc	%l3,	0x1A0D,	%o6
	sub	%i4,	%i7,	%o3
	bvs,pn	%icc,	loop_524
loop_524:
	sth	%o7,	[%l7 + 0x2C]
	tsubcc	%g7,	%o1,	%i6
	sdivx	%g5,	0x1575,	%g2
	fmovrsgez	%i3,	%f15,	%f13
	fmovdcc	%icc,	%f14,	%f7
	fmovsvc	%icc,	%f5,	%f9
	subccc	%l2,	%g3,	%g1
	fbule,a	%fcc0,	loop_525
loop_525:
	sra	%o4,	0x18,	%i5
	tl	%icc,	0x4
	edge16n	%i0,	%l0,	%l6
	edge8l	%i2,	%l5,	%o0
	udivx	%o5,	0x1E76,	%o2
	taddcc	%g6,	0x0A68,	%i1
	xnorcc	%l4,	0x073B,	%g4
	brnz,a	%l3,	loop_526
loop_526:
	nop
	setx loop_527, %l0, %l1
	jmpl %l1, %l1
loop_527:
	movrgez	%o6,	%i7,	%o3
	fmovsa	%xcc,	%f6,	%f7
	udivx	%o7,	0x11BD,	%i4
	sllx	%g7,	%i6,	%o1
	fors	%f14,	%f4,	%f2
	brgz,a	%g5,	loop_528
loop_528:
	and	%i3,	%g2,	%g3
	fcmple32	%f2,	%f10,	%g1
	udivcc	%o4,	0x150C,	%l2
	ldsw	[%l7 + 0x3C],	%i0
	ldsw	[%l7 + 0x28],	%i5
	sra	%l0,	%i2,	%l5
	movn	%icc,	%o0,	%o5
	edge8ln	%o2,	%g6,	%i1
	tg	%icc,	0x3
	xorcc	%l4,	%l6,	%g4
	fmovrdgz	%l3,	%f12,	%f2
	movrlz	%o6,	0x07D,	%l1
	add	%i7,	0x1C5B,	%o7
	lduw	[%l7 + 0x60],	%o3
	movcs	%xcc,	%g7,	%i6
	fmovspos	%icc,	%f11,	%f8
	ldsh	[%l7 + 0x76],	%o1
	st	%f9,	[%l7 + 0x44]
	edge16	%i4,	%i3,	%g2
	tne	%xcc,	0x5
	subccc	%g5,	0x01D9,	%g3
	alignaddr	%g1,	%l2,	%o4
	movneg	%xcc,	%i0,	%i5
	ldd	[%l7 + 0x68],	%f4
	xnor	%i2,	%l0,	%l5
	fmovsn	%icc,	%f14,	%f13
	ldd	[%l7 + 0x50],	%f4
	siam	0x2
	udivx	%o5,	0x1C4A,	%o2
	alignaddrl	%g6,	%o0,	%i1
	addc	%l4,	%g4,	%l3
	stw	%o6,	[%l7 + 0x50]
	fmuld8sux16	%f10,	%f11,	%f6
	smul	%l1,	0x1048,	%i7
	tn	%xcc,	0x1
	movvc	%xcc,	%l6,	%o3
	movvc	%xcc,	%g7,	%i6
	lduh	[%l7 + 0x52],	%o1
	add	%i4,	%i3,	%g2
	edge32n	%o7,	%g3,	%g1
	array16	%g5,	%l2,	%o4
	movrne	%i0,	%i2,	%i5
	ldsb	[%l7 + 0x38],	%l5
	andncc	%l0,	%o2,	%g6
	fmovdl	%xcc,	%f10,	%f0
	umul	%o0,	0x0231,	%o5
	fmovrsne	%l4,	%f6,	%f3
	array16	%i1,	%l3,	%o6
	movleu	%icc,	%l1,	%i7
	fcmpgt16	%f4,	%f14,	%l6
	be	%xcc,	loop_529
loop_529:
	subc	%g4,	%g7,	%o3
	fbuge	%fcc2,	loop_530
loop_530:
	fands	%f3,	%f14,	%f4
	fmovrsgz	%o1,	%f13,	%f3
	fcmple32	%f4,	%f10,	%i6
	umul	%i3,	%i4,	%g2
	fandnot1	%f10,	%f2,	%f6
	sllx	%g3,	0x17,	%o7
	stx	%g5,	[%l7 + 0x70]
	movcs	%icc,	%l2,	%o4
	tle	%xcc,	0x3
	fnot1s	%f5,	%f6
	tge	%xcc,	0x6
	tsubcc	%g1,	0x0EE0,	%i0
	fnands	%f3,	%f10,	%f12
	movrlz	%i5,	%l5,	%i2
	lduh	[%l7 + 0x3A],	%l0
	edge16ln	%g6,	%o2,	%o0
	movrgz	%o5,	%l4,	%i1
	movle	%icc,	%l3,	%o6
	sdivx	%i7,	0x1356,	%l1
	stx	%g4,	[%l7 + 0x70]
	ld	[%l7 + 0x2C],	%f7
	bneg,pn	%xcc,	loop_531
loop_531:
	faligndata	%f12,	%f14,	%f8
	be,a	loop_532
loop_532:
	fxnor	%f12,	%f8,	%f10
	edge16l	%l6,	%g7,	%o3
	bvc,a,pt	%icc,	loop_533
loop_533:
	be,a	%xcc,	loop_534
loop_534:
	nop
	setx loop_535, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_535:
	tpos	%icc,	0x0
	fmovdgu	%icc,	%f0,	%f7
	andncc	%i6,	%i3,	%o1
	tge	%icc,	0x6
	or	%g2,	%g3,	%o7
	movcs	%xcc,	%i4,	%g5
	smul	%o4,	0x068B,	%l2
	or	%g1,	0x1E19,	%i0
	edge8n	%l5,	%i5,	%l0
	tvc	%xcc,	0x3
	udivcc	%g6,	0x0391,	%i2
	tsubcc	%o2,	%o0,	%o5
	st	%f7,	[%l7 + 0x48]
	sth	%l4,	[%l7 + 0x40]
	addcc	%l3,	%o6,	%i7
	sdivcc	%l1,	0x0627,	%i1
	fble,a	%fcc1,	loop_536
loop_536:
	addcc	%l6,	%g7,	%o3
	tl	%xcc,	0x2
	nop
	setx loop_537, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_537:
	movcs	%xcc,	%g4,	%i3
	srl	%i6,	0x05,	%o1
	fbuge,a	%fcc2,	loop_538
loop_538:
	array32	%g2,	%o7,	%g3
	addccc	%g5,	%o4,	%l2
	movneg	%xcc,	%i4,	%i0
	lduh	[%l7 + 0x18],	%g1
	nop
	setx loop_539, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_539:
	fmovrdgz	%l5,	%f4,	%f10
	movcs	%icc,	%i5,	%g6
	fbg,a	%fcc3,	loop_540
loop_540:
	fand	%f2,	%f4,	%f0
	smul	%i2,	0x108B,	%o2
	movvc	%xcc,	%o0,	%l0
	fmovdleu	%icc,	%f10,	%f8
	fmovdl	%xcc,	%f13,	%f2
	ld	[%l7 + 0x40],	%f14
	fbug,a	%fcc0,	loop_541
loop_541:
	taddcctv	%o5,	%l3,	%o6
	tge	%icc,	0x7
	tl	%icc,	0x7
	fpsub16s	%f15,	%f8,	%f7
	andncc	%l4,	%l1,	%i1
	ld	[%l7 + 0x34],	%f13
	ldub	[%l7 + 0x16],	%i7
	fbuge,a	%fcc0,	loop_542
loop_542:
	orcc	%g7,	0x0314,	%l6
	tne	%xcc,	0x5
	fmovrse	%o3,	%f4,	%f10
	ldub	[%l7 + 0x2B],	%g4
	tleu	%icc,	0x0
	and	%i6,	0x11C2,	%i3
	fcmps	%fcc0,	%f7,	%f6
	ldsh	[%l7 + 0x3E],	%o1
	tg	%xcc,	0x3
	stx	%g2,	[%l7 + 0x78]
	bn,a	loop_543
loop_543:
	xnorcc	%g3,	0x094D,	%o7
	edge16	%o4,	%g5,	%i4
	brz	%i0,	loop_544
loop_544:
	edge16l	%l2,	%g1,	%i5
	fsrc2s	%f12,	%f7
	fpsub16	%f2,	%f6,	%f6
	fmovd	%f6,	%f2
	brz	%g6,	loop_545
loop_545:
	smul	%i2,	%l5,	%o2
	movcs	%icc,	%o0,	%o5
	tleu	%xcc,	0x7
	sethi	0x0E77,	%l0
	movgu	%xcc,	%o6,	%l4
	array16	%l3,	%i1,	%l1
	tg	%xcc,	0x7
	sra	%g7,	%i7,	%o3
	or	%g4,	0x05F5,	%i6
	edge8l	%l6,	%o1,	%g2
	movgu	%xcc,	%g3,	%o7
	movvc	%icc,	%i3,	%o4
	st	%f15,	[%l7 + 0x38]
	ta	%xcc,	0x5
	fpmerge	%f12,	%f7,	%f8
	bvc,pn	%xcc,	loop_546
loop_546:
	sdivx	%i4,	0x1A90,	%i0
	addccc	%l2,	%g5,	%i5
	movn	%xcc,	%g1,	%i2
	edge16l	%l5,	%o2,	%o0
	fmovscs	%icc,	%f10,	%f8
	tsubcctv	%g6,	%l0,	%o5
	sub	%l4,	%o6,	%i1
	fpack32	%f14,	%f12,	%f4
	subcc	%l1,	%g7,	%l3
	tsubcctv	%i7,	0x10E1,	%g4
	orncc	%i6,	0x1A80,	%l6
	ldd	[%l7 + 0x30],	%f8
	stw	%o1,	[%l7 + 0x64]
	fbul	%fcc2,	loop_547
loop_547:
	tgu	%icc,	0x6
	addccc	%o3,	0x19BF,	%g3
	call	loop_548
loop_548:
	fnand	%f14,	%f0,	%f4
	movcc	%icc,	%o7,	%g2
	edge32l	%o4,	%i4,	%i0
	mova	%icc,	%i3,	%g5
	umul	%i5,	%g1,	%i2
	sub	%l2,	%l5,	%o0
	movrgz	%o2,	%l0,	%g6
	tcc	%xcc,	0x2
	edge8l	%o5,	%l4,	%o6
	fbug,a	%fcc0,	loop_549
loop_549:
	movrgz	%l1,	0x2D1,	%g7
	tvs	%xcc,	0x2
	ldd	[%l7 + 0x48],	%f10
	xor	%l3,	%i1,	%g4
	bge,a,pt	%icc,	loop_550
loop_550:
	array8	%i7,	%l6,	%i6
	movvc	%icc,	%o1,	%o3
	brgez	%g3,	loop_551
loop_551:
	tcs	%icc,	0x7
	te	%icc,	0x4
	edge32	%g2,	%o7,	%i4
	bgu,pn	%xcc,	loop_552
loop_552:
	std	%f14,	[%l7 + 0x20]
	mova	%icc,	%i0,	%i3
	nop
	setx loop_553, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_553:
	fxnor	%f12,	%f14,	%f4
	fmovse	%icc,	%f15,	%f14
	mulx	%g5,	0x15EF,	%i5
	bpos,a	%xcc,	loop_554
loop_554:
	fmovsl	%icc,	%f2,	%f1
	edge32n	%g1,	%o4,	%i2
	fxor	%f6,	%f2,	%f0
	tgu	%xcc,	0x5
	bneg	loop_555
loop_555:
	edge16l	%l2,	%l5,	%o2
	fmovsa	%xcc,	%f7,	%f6
	te	%icc,	0x7
	fors	%f15,	%f10,	%f7
	ble,a,pt	%xcc,	loop_556
loop_556:
	movneg	%icc,	%l0,	%o0
	srax	%g6,	%o5,	%o6
	fzero	%f4
	addccc	%l1,	%l4,	%l3
	edge32	%g7,	%g4,	%i7
	mova	%xcc,	%l6,	%i6
	ble	%icc,	loop_557
loop_557:
	movneg	%xcc,	%o1,	%o3
	ble,pn	%icc,	loop_558
loop_558:
	subccc	%i1,	%g3,	%o7
	andcc	%g2,	0x05A3,	%i0
	ta	%icc,	0x5
	fnand	%f4,	%f10,	%f2
	edge32	%i4,	%g5,	%i3
	ldsw	[%l7 + 0x50],	%i5
	tsubcc	%g1,	0x0D24,	%o4
	bcc	loop_559
loop_559:
	fxor	%f0,	%f6,	%f14
	lduh	[%l7 + 0x6E],	%l2
	add	%l5,	%o2,	%l0
	tvs	%icc,	0x3
	fornot2s	%f14,	%f3,	%f14
	fmovrsgz	%o0,	%f7,	%f12
	movgu	%xcc,	%i2,	%g6
	fandnot1s	%f1,	%f10,	%f14
	ldx	[%l7 + 0x38],	%o5
	sub	%o6,	0x045C,	%l4
	edge16l	%l1,	%l3,	%g7
	fabss	%f4,	%f13
	mulx	%i7,	%l6,	%i6
	tg	%xcc,	0x3
	subcc	%g4,	0x137B,	%o1
	tn	%xcc,	0x3
	bleu	loop_560
loop_560:
	fpadd32s	%f9,	%f8,	%f8
	fandnot2s	%f2,	%f11,	%f2
	fandnot2	%f8,	%f12,	%f2
	addccc	%i1,	0x0F03,	%g3
	edge32ln	%o3,	%o7,	%g2
	tge	%xcc,	0x6
	umulcc	%i4,	0x19BD,	%i0
	bleu,pn	%xcc,	loop_561
loop_561:
	movpos	%icc,	%g5,	%i5
	tcc	%xcc,	0x0
	udivcc	%i3,	0x1B9A,	%o4
	srl	%g1,	0x0E,	%l2
	smulcc	%o2,	%l0,	%l5
	fmovdle	%icc,	%f7,	%f12
	movcs	%icc,	%i2,	%g6
	edge16	%o5,	%o6,	%o0
	nop
	setx loop_562, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_562:
	movpos	%icc,	%l1,	%l3
	andn	%l4,	0x1E70,	%i7
	sdivx	%l6,	0x0D3A,	%g7
	xnorcc	%i6,	%g4,	%i1
	addc	%o1,	0x124F,	%g3
	andcc	%o3,	%o7,	%g2
	fmovde	%xcc,	%f12,	%f2
	bge,a,pt	%xcc,	loop_563
loop_563:
	ldsb	[%l7 + 0x08],	%i0
	sdivx	%g5,	0x0375,	%i4
	move	%icc,	%i5,	%o4
	tsubcc	%i3,	0x0D55,	%l2
	movrlz	%g1,	0x23E,	%l0
	ldsh	[%l7 + 0x0A],	%l5
	smul	%i2,	%g6,	%o5
	stw	%o2,	[%l7 + 0x44]
	edge32l	%o0,	%l1,	%l3
	movrlz	%l4,	0x31A,	%o6
	stx	%l6,	[%l7 + 0x38]
	and	%g7,	%i6,	%i7
	sdivx	%i1,	0x0A4A,	%g4
	sra	%o1,	%g3,	%o3
	srlx	%o7,	0x1F,	%g2
	fpsub32s	%f2,	%f14,	%f12
	sub	%i0,	%g5,	%i4
	ldsb	[%l7 + 0x54],	%o4
	faligndata	%f12,	%f12,	%f4
	andn	%i3,	0x13B3,	%l2
	ldd	[%l7 + 0x58],	%f12
	movvs	%icc,	%g1,	%l0
	tpos	%xcc,	0x2
	addccc	%i5,	%i2,	%g6
	tleu	%icc,	0x1
	bvs,a,pn	%icc,	loop_564
loop_564:
	fmovdg	%icc,	%f1,	%f8
	st	%f9,	[%l7 + 0x34]
	fsrc1s	%f11,	%f2
	ta	%icc,	0x3
	srax	%l5,	0x02,	%o2
	subccc	%o0,	%l1,	%o5
	udivx	%l4,	0x01BF,	%o6
	sll	%l3,	0x13,	%g7
	movle	%xcc,	%l6,	%i7
	sra	%i1,	0x02,	%i6
	stx	%o1,	[%l7 + 0x08]
	orncc	%g3,	%g4,	%o3
	mulx	%g2,	%i0,	%g5
	mova	%xcc,	%o7,	%i4
	ba,pt	%xcc,	loop_565
loop_565:
	fnot1s	%f11,	%f1
	subc	%o4,	%l2,	%i3
	fornot2	%f14,	%f14,	%f4
	tvs	%icc,	0x4
	stb	%g1,	[%l7 + 0x08]
	fands	%f15,	%f10,	%f3
	ta	%icc,	0x1
	fbl	%fcc2,	loop_566
loop_566:
	st	%f9,	[%l7 + 0x34]
	ld	[%l7 + 0x0C],	%f3
	smulcc	%l0,	%i2,	%i5
	subcc	%g6,	0x09A3,	%o2
	ldx	[%l7 + 0x48],	%o0
	ldsw	[%l7 + 0x08],	%l5
	sdivcc	%o5,	0x1A54,	%l1
	add	%o6,	0x0D49,	%l3
	udivx	%g7,	0x1105,	%l4
	tsubcc	%i7,	0x1A2A,	%l6
	tleu	%xcc,	0x3
	fpadd16s	%f7,	%f3,	%f2
	or	%i6,	0x0F39,	%i1
	edge8ln	%g3,	%g4,	%o1
	array8	%g2,	%o3,	%g5
	edge32n	%o7,	%i0,	%o4
	fpadd32	%f6,	%f8,	%f14
	fnors	%f13,	%f7,	%f11
	stb	%i4,	[%l7 + 0x13]
	brgz,a	%l2,	loop_567
loop_567:
	sra	%i3,	%l0,	%i2
	popc	0x1DF5,	%g1
	brlz,a	%g6,	loop_568
loop_568:
	mulscc	%i5,	%o0,	%o2
	fandnot2	%f2,	%f4,	%f2
	edge8n	%o5,	%l1,	%l5
	te	%xcc,	0x0
	sth	%l3,	[%l7 + 0x48]
	bg,a,pn	%xcc,	loop_569
loop_569:
	fornot2s	%f9,	%f14,	%f3
	popc	0x0130,	%o6
	srax	%l4,	0x01,	%i7
	tvs	%xcc,	0x0
	fpadd16s	%f11,	%f1,	%f11
	fbule,a	%fcc1,	loop_570
loop_570:
	fmovse	%icc,	%f13,	%f7
	movne	%xcc,	%l6,	%g7
	tgu	%xcc,	0x4
	tn	%icc,	0x6
	fbne,a	%fcc1,	loop_571
loop_571:
	andn	%i6,	0x00F6,	%i1
	edge16ln	%g3,	%g4,	%g2
	taddcc	%o1,	%g5,	%o3
	move	%icc,	%i0,	%o4
	lduw	[%l7 + 0x44],	%o7
	fzero	%f8
	sethi	0x021B,	%l2
	orn	%i4,	%i3,	%l0
	sllx	%g1,	0x05,	%g6
	edge32ln	%i2,	%o0,	%i5
	sdivx	%o2,	0x1207,	%l1
	stb	%o5,	[%l7 + 0x68]
	ldd	[%l7 + 0x40],	%f4
	fmul8x16au	%f11,	%f5,	%f6
	fone	%f4
	fxors	%f0,	%f5,	%f12
	sub	%l3,	%o6,	%l5
	brlz,a	%i7,	loop_572
loop_572:
	tneg	%icc,	0x5
	sethi	0x121A,	%l4
	tpos	%xcc,	0x5
	movl	%icc,	%l6,	%g7
	bleu,pn	%icc,	loop_573
loop_573:
	andn	%i1,	%i6,	%g3
	bvs	%icc,	loop_574
loop_574:
	sll	%g2,	0x0F,	%o1
	movne	%xcc,	%g4,	%o3
	andn	%i0,	0x17CA,	%o4
	fmovscc	%icc,	%f2,	%f14
	fmuld8ulx16	%f8,	%f12,	%f14
	movge	%icc,	%g5,	%l2
	brgez,a	%o7,	loop_575
loop_575:
	fbul,a	%fcc1,	loop_576
loop_576:
	edge16	%i3,	%i4,	%g1
	movg	%icc,	%l0,	%g6
	smulcc	%o0,	%i2,	%o2
	lduh	[%l7 + 0x32],	%l1
	tl	%icc,	0x6
	ldsw	[%l7 + 0x48],	%i5
	fmovs	%f8,	%f13
	fmovse	%xcc,	%f7,	%f3
	movcs	%xcc,	%l3,	%o6
	movrne	%o5,	%l5,	%l4
	fmovrdlz	%l6,	%f0,	%f0
	fmul8x16	%f13,	%f4,	%f8
	fmovsgu	%icc,	%f10,	%f12
	fexpand	%f7,	%f14
	fble,a	%fcc2,	loop_577
loop_577:
	tpos	%xcc,	0x4
	edge32l	%g7,	%i1,	%i6
	sub	%g3,	0x1C66,	%i7
	alignaddr	%g2,	%o1,	%o3
	sra	%g4,	%i0,	%g5
	stw	%l2,	[%l7 + 0x6C]
	edge8	%o7,	%i3,	%i4
	tl	%xcc,	0x3
	srlx	%g1,	%l0,	%g6
	movpos	%xcc,	%o4,	%i2
	andncc	%o0,	%l1,	%i5
	ld	[%l7 + 0x10],	%f6
	udivcc	%o2,	0x0E16,	%l3
	edge8n	%o5,	%l5,	%l4
	ldub	[%l7 + 0x0F],	%o6
	ldd	[%l7 + 0x08],	%f8
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type f   	: 184
!	Type cti   	: 118
!	Type i   	: 573
!	Type l   	: 125
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
main_t3:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0x0,	%g2
	set	0x3,	%g3
	set	0x3,	%g4
	set	0x2,	%g5
	set	0x5,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x3,	%i1
	set	-0x4,	%i2
	set	-0xA,	%i3
	set	-0x3,	%i4
	set	-0x6,	%i5
	set	-0x8,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x0F7DC7B1,	%l0
	set	0x354DED78,	%l1
	set	0x2B26FAA4,	%l2
	set	0x01276DC8,	%l3
	set	0x62B915D4,	%l4
	set	0x74ABDAB7,	%l5
	set	0x2D1794FA,	%l6
	!# Output registers
	set	-0x1B8C,	%o0
	set	-0x09A6,	%o1
	set	0x1885,	%o2
	set	-0x0409,	%o3
	set	0x0730,	%o4
	set	-0x0C0D,	%o5
	set	-0x1FC5,	%o6
	set	-0x0A6B,	%o7

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

	fandnot2s	%f4,	%f3,	%f11
	fmovsl	%xcc,	%f4,	%f11
	fmovspos	%xcc,	%f15,	%f3
	fcmple16	%f8,	%f2,	%l6
	move	%icc,	%i1,	%i6
	fbl,a	%fcc1,	loop_578
loop_578:
	brlz	%g7,	loop_579
loop_579:
	bleu,a,pt	%xcc,	loop_580
loop_580:
	bge,a	%icc,	loop_581
loop_581:
	fmovrdgez	%i7,	%f14,	%f0
	fcmpne32	%f0,	%f10,	%g3
	fmovdne	%xcc,	%f4,	%f8
	fmovdvc	%xcc,	%f3,	%f3
	fmovdleu	%xcc,	%f14,	%f13
	popc	%g2,	%o3
	siam	0x0
	fcmpes	%fcc2,	%f8,	%f4
	tcs	%xcc,	0x4
	fmovdg	%xcc,	%f1,	%f7
	fmovrde	%o1,	%f14,	%f0
	movrne	%i0,	0x2A3,	%g5
	fmuld8ulx16	%f15,	%f12,	%f12
	fmul8ulx16	%f0,	%f12,	%f12
	fmovsle	%icc,	%f10,	%f10
	fmovsg	%icc,	%f13,	%f14
	fmovda	%xcc,	%f9,	%f9
	fmul8x16al	%f8,	%f12,	%f0
	fsrc1	%f8,	%f10
	fmovsleu	%icc,	%f15,	%f4
	fmovsle	%xcc,	%f11,	%f14
	fnor	%f4,	%f14,	%f4
	fcmpeq16	%f2,	%f4,	%g4
	edge16n	%o7,	%i3,	%i4
	fcmple16	%f2,	%f4,	%l2
	bshuffle	%f8,	%f10,	%f8
	fcmple16	%f12,	%f8,	%l0
	tneg	%icc,	0x2
	bcs,a	loop_582
loop_582:
	pdist	%f8,	%f6,	%f2
	fbo,a	%fcc0,	loop_583
loop_583:
	st	%f5,	[%l7 + 0x08]
	orn	%g1,	%g6,	%o4
	fandnot1	%f4,	%f14,	%f14
	fpadd16	%f4,	%f0,	%f14
	fbule,a	%fcc1,	loop_584
loop_584:
	fmovd	%f10,	%f4
	fornot1	%f0,	%f12,	%f2
	bshuffle	%f0,	%f8,	%f8
	std	%f14,	[%l7 + 0x40]
	ba,a,pn	%icc,	loop_585
loop_585:
	ldd	[%l7 + 0x28],	%f0
	fornot1	%f0,	%f10,	%f0
	taddcc	%o0,	%l1,	%i5
	fandnot1s	%f2,	%f1,	%f1
	fornot1	%f8,	%f4,	%f2
	movcc	%icc,	%o2,	%l3
	bn	%xcc,	loop_586
loop_586:
	st	%f11,	[%l7 + 0x5C]
	tneg	%xcc,	0x4
	fmul8x16	%f10,	%f12,	%f0
	fbue,a	%fcc0,	loop_587
loop_587:
	fmovsle	%icc,	%f0,	%f11
	tvs	%xcc,	0x2
	tg	%xcc,	0x7
	ld	[%l7 + 0x48],	%f12
	fmul8ulx16	%f4,	%f6,	%f10
	fornot1	%f0,	%f8,	%f10
	for	%f2,	%f2,	%f4
	movneg	%xcc,	%o5,	%l5
	tcc	%icc,	0x7
	ldsh	[%l7 + 0x0E],	%i2
	faligndata	%f10,	%f12,	%f12
	fabss	%f10,	%f3
	fpadd32s	%f13,	%f12,	%f14
	fcmpgt16	%f4,	%f6,	%o6
	stw	%l6,	[%l7 + 0x1C]
	taddcctv	%l4,	0x09F9,	%i6
	fmovsneg	%xcc,	%f10,	%f9
	fmovdpos	%icc,	%f12,	%f12
	fbge,a	%fcc0,	loop_588
loop_588:
	fnot2	%f10,	%f14
	fsrc2	%f2,	%f14
	fmovrse	%i1,	%f7,	%f5
	fbu,a	%fcc3,	loop_589
loop_589:
	fandnot2s	%f7,	%f0,	%f4
	fand	%f0,	%f14,	%f10
	fnegs	%f10,	%f2
	lduw	[%l7 + 0x60],	%g7
	bvc	%icc,	loop_590
loop_590:
	fmovscc	%icc,	%f4,	%f0
	fmovrdne	%g3,	%f4,	%f8
	fmovrdlz	%g2,	%f14,	%f12
	fmovsneg	%icc,	%f13,	%f13
	fnot1s	%f15,	%f6
	sra	%o3,	%i7,	%i0
	movvs	%icc,	%g5,	%o1
	fzeros	%f0
	bge	%icc,	loop_591
loop_591:
	ldsh	[%l7 + 0x62],	%g4
	fmovse	%xcc,	%f10,	%f4
	fcmpgt32	%f6,	%f6,	%o7
	fpadd16s	%f5,	%f6,	%f14
	fnands	%f11,	%f6,	%f12
	tl	%xcc,	0x3
	fmovsl	%xcc,	%f1,	%f10
	fmovsn	%icc,	%f6,	%f11
	ldub	[%l7 + 0x3E],	%i4
	fmovda	%icc,	%f15,	%f14
	fmovdvc	%xcc,	%f11,	%f2
	fcmpne32	%f0,	%f10,	%i3
	fbe	%fcc1,	loop_592
loop_592:
	fornot2s	%f11,	%f15,	%f2
	fnors	%f12,	%f0,	%f14
	sth	%l0,	[%l7 + 0x72]
	edge16	%l2,	%g1,	%o4
	fcmpes	%fcc2,	%f3,	%f14
	tle	%xcc,	0x1
	stw	%g6,	[%l7 + 0x5C]
	std	%f10,	[%l7 + 0x30]
	brgz,a	%o0,	loop_593
loop_593:
	sdiv	%l1,	0x1321,	%i5
	movg	%xcc,	%o2,	%l3
	fexpand	%f10,	%f12
	fpack32	%f4,	%f2,	%f2
	movrlez	%l5,	%i2,	%o6
	move	%icc,	%o5,	%l4
	for	%f10,	%f10,	%f12
	fpsub16s	%f8,	%f9,	%f2
	fmovrsgz	%l6,	%f7,	%f15
	fcmpgt16	%f10,	%f6,	%i1
	stb	%i6,	[%l7 + 0x44]
	fmuld8ulx16	%f3,	%f1,	%f10
	stx	%g7,	[%l7 + 0x78]
	fmovspos	%xcc,	%f12,	%f12
	nop
	setx loop_594, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_594:
	and	%g3,	%o3,	%g2
	fmovsneg	%icc,	%f11,	%f7
	mulx	%i7,	%g5,	%o1
	fmovrdlz	%i0,	%f14,	%f14
	fmovrslz	%o7,	%f3,	%f11
	fpadd16s	%f11,	%f8,	%f8
	fbuge,a	%fcc2,	loop_595
loop_595:
	fnot2s	%f3,	%f3
	fmovd	%f8,	%f12
	fmovdleu	%xcc,	%f13,	%f9
	std	%f14,	[%l7 + 0x30]
	movrgez	%i4,	%i3,	%l0
	fmovrdgz	%l2,	%f14,	%f12
	fcmpeq32	%f2,	%f8,	%g4
	brz,a	%o4,	loop_596
loop_596:
	fble	%fcc0,	loop_597
loop_597:
	fbge	%fcc3,	loop_598
loop_598:
	taddcctv	%g6,	%g1,	%o0
	fmovrslez	%l1,	%f0,	%f5
	fmovscc	%icc,	%f3,	%f2
	fand	%f0,	%f4,	%f0
	fcmpd	%fcc0,	%f0,	%f14
	mulscc	%i5,	0x195F,	%o2
	fxnors	%f2,	%f0,	%f14
	ldsb	[%l7 + 0x57],	%l3
	siam	0x7
	taddcc	%l5,	%i2,	%o5
	stx	%o6,	[%l7 + 0x70]
	fmul8x16au	%f3,	%f3,	%f2
	siam	0x1
	fones	%f3
	stw	%l4,	[%l7 + 0x44]
	bpos,a,pt	%xcc,	loop_599
loop_599:
	fpadd32s	%f7,	%f0,	%f3
	bg	loop_600
loop_600:
	fabss	%f1,	%f3
	ba,a	%icc,	loop_601
loop_601:
	fmovdvs	%xcc,	%f6,	%f4
	bg	loop_602
loop_602:
	fandnot2	%f14,	%f4,	%f4
	array8	%i1,	%l6,	%g7
	fmovs	%f15,	%f11
	fcmpne16	%f10,	%f14,	%i6
	fmovrse	%g3,	%f8,	%f3
	faligndata	%f14,	%f14,	%f4
	fmovrslz	%g2,	%f7,	%f11
	fnot1s	%f3,	%f11
	tvc	%icc,	0x0
	fcmpgt16	%f14,	%f14,	%i7
	fnands	%f2,	%f13,	%f8
	fmovdneg	%icc,	%f7,	%f5
	fmovde	%xcc,	%f3,	%f2
	fnegd	%f12,	%f0
	ldub	[%l7 + 0x2E],	%o3
	fmovsa	%icc,	%f14,	%f4
	bl,pt	%icc,	loop_603
loop_603:
	ble,a	loop_604
loop_604:
	movpos	%xcc,	%o1,	%g5
	fbn,a	%fcc3,	loop_605
loop_605:
	edge16ln	%o7,	%i4,	%i0
	fmovdvc	%icc,	%f6,	%f13
	sra	%l0,	%l2,	%g4
	sethi	0x0274,	%o4
	fmovsg	%xcc,	%f1,	%f12
	sra	%g6,	%g1,	%i3
	movre	%l1,	%i5,	%o2
	fxnors	%f15,	%f12,	%f7
	edge8	%o0,	%l3,	%i2
	fmovde	%icc,	%f12,	%f10
	ldsw	[%l7 + 0x24],	%l5
	tcs	%icc,	0x5
	fcmped	%fcc0,	%f8,	%f0
	umulcc	%o6,	%o5,	%i1
	st	%f4,	[%l7 + 0x10]
	fmovrse	%l4,	%f2,	%f6
	fnors	%f4,	%f12,	%f6
	fbo,a	%fcc0,	loop_606
loop_606:
	lduw	[%l7 + 0x64],	%g7
	ldsh	[%l7 + 0x2C],	%l6
	tgu	%icc,	0x0
	ldsw	[%l7 + 0x40],	%g3
	edge16n	%g2,	%i7,	%i6
	fmovdneg	%xcc,	%f11,	%f9
	fmovrslez	%o3,	%f0,	%f3
	fmovde	%icc,	%f8,	%f9
	fmovs	%f9,	%f0
	fmovd	%f6,	%f6
	fmovsa	%xcc,	%f7,	%f12
	fcmps	%fcc1,	%f15,	%f10
	fpsub32	%f6,	%f8,	%f0
	fmovrdgez	%g5,	%f10,	%f6
	fmuld8sux16	%f1,	%f5,	%f10
	fsrc1	%f14,	%f10
	std	%f4,	[%l7 + 0x50]
	bg	%icc,	loop_607
loop_607:
	fmovrdlez	%o7,	%f10,	%f12
	fpack32	%f12,	%f8,	%f10
	ldub	[%l7 + 0x7A],	%i4
	edge8	%o1,	%l0,	%l2
	fmovsn	%icc,	%f10,	%f10
	fmovspos	%xcc,	%f13,	%f2
	fxnors	%f5,	%f8,	%f5
	movleu	%icc,	%i0,	%o4
	ldd	[%l7 + 0x58],	%f10
	fornot1s	%f15,	%f0,	%f9
	fands	%f9,	%f12,	%f7
	fmovsleu	%xcc,	%f13,	%f7
	fbule	%fcc0,	loop_608
loop_608:
	st	%f10,	[%l7 + 0x44]
	fmovrdgz	%g4,	%f8,	%f0
	fandnot2s	%f14,	%f1,	%f13
	fornot1s	%f3,	%f7,	%f2
	stw	%g6,	[%l7 + 0x34]
	fmovdvs	%xcc,	%f1,	%f4
	fandnot1s	%f12,	%f3,	%f4
	lduw	[%l7 + 0x18],	%i3
	fcmpeq32	%f6,	%f12,	%l1
	siam	0x1
	fcmps	%fcc3,	%f5,	%f14
	fpsub32	%f14,	%f4,	%f6
	taddcctv	%i5,	%o2,	%o0
	fcmple16	%f4,	%f0,	%g1
	fcmpgt32	%f4,	%f2,	%l3
	fmovdpos	%xcc,	%f15,	%f10
	fexpand	%f3,	%f10
	ldd	[%l7 + 0x50],	%f2
	fcmpgt32	%f2,	%f10,	%l5
	movvs	%xcc,	%i2,	%o5
	fsrc2	%f0,	%f6
	fmovsvc	%xcc,	%f12,	%f9
	te	%xcc,	0x5
	fmovsn	%xcc,	%f2,	%f7
	fmovrse	%o6,	%f0,	%f7
	fmovdneg	%icc,	%f4,	%f5
	fmovsg	%xcc,	%f14,	%f7
	bne	%icc,	loop_609
loop_609:
	fmovs	%f11,	%f13
	fmovdge	%icc,	%f2,	%f2
	fone	%f6
	fmovrslez	%i1,	%f1,	%f1
	fbe	%fcc3,	loop_610
loop_610:
	move	%icc,	%g7,	%l4
	bshuffle	%f12,	%f0,	%f0
	fmovrdlz	%l6,	%f2,	%f2
	umul	%g2,	%i7,	%i6
	std	%f12,	[%l7 + 0x18]
	st	%f4,	[%l7 + 0x38]
	stx	%g3,	[%l7 + 0x08]
	fmovsl	%xcc,	%f10,	%f2
	fandnot2	%f2,	%f6,	%f2
	fmovda	%xcc,	%f6,	%f5
	call	loop_611
loop_611:
	ldsb	[%l7 + 0x2A],	%g5
	brz	%o3,	loop_612
loop_612:
	fmovrde	%o7,	%f10,	%f4
	fxor	%f2,	%f2,	%f2
	bpos,pt	%xcc,	loop_613
loop_613:
	movrgez	%i4,	0x32E,	%l0
	alignaddr	%l2,	%o1,	%o4
	fpadd16s	%f8,	%f4,	%f12
	movleu	%icc,	%g4,	%i0
	fmul8x16au	%f15,	%f7,	%f0
	fmovsa	%icc,	%f6,	%f11
	fmovsn	%icc,	%f13,	%f7
	fmovdle	%icc,	%f13,	%f2
	movcs	%icc,	%i3,	%g6
	fmovs	%f11,	%f1
	fmul8x16al	%f13,	%f5,	%f10
	stx	%i5,	[%l7 + 0x30]
	fmovscc	%icc,	%f1,	%f2
	fcmple32	%f10,	%f10,	%o2
	fbl	%fcc0,	loop_614
loop_614:
	edge32ln	%o0,	%l1,	%g1
	fnegs	%f8,	%f14
	fmovse	%icc,	%f11,	%f2
	st	%f8,	[%l7 + 0x78]
	stx	%l3,	[%l7 + 0x50]
	bvs,a,pt	%xcc,	loop_615
loop_615:
	fpadd16	%f8,	%f4,	%f2
	fmovrslz	%i2,	%f7,	%f2
	fxnor	%f12,	%f14,	%f12
	fmul8x16au	%f13,	%f4,	%f10
	fone	%f4
	bgu,pt	%xcc,	loop_616
loop_616:
	xor	%l5,	0x11BF,	%o5
	fmovsne	%xcc,	%f5,	%f9
	fnors	%f8,	%f15,	%f14
	tneg	%xcc,	0x4
	fmovrsgez	%o6,	%f8,	%f14
	fpsub32s	%f12,	%f10,	%f1
	fnors	%f15,	%f2,	%f6
	fbne	%fcc0,	loop_617
loop_617:
	fmul8x16au	%f12,	%f12,	%f2
	subccc	%i1,	%l4,	%l6
	nop
	setx loop_618, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_618:
	fmovdpos	%icc,	%f2,	%f15
	edge16ln	%g7,	%g2,	%i6
	fandnot1	%f12,	%f0,	%f8
	fbule	%fcc0,	loop_619
loop_619:
	bcc,pn	%xcc,	loop_620
loop_620:
	fmovdpos	%xcc,	%f12,	%f3
	sllx	%g3,	0x17,	%g5
	bneg,pt	%icc,	loop_621
loop_621:
	fcmped	%fcc3,	%f2,	%f14
	fbne,a	%fcc3,	loop_622
loop_622:
	brlz,a	%i7,	loop_623
loop_623:
	fmovrde	%o3,	%f2,	%f6
	fnegd	%f10,	%f14
	srlx	%i4,	%l0,	%l2
	fcmple32	%f8,	%f14,	%o7
	fble,a	%fcc2,	loop_624
loop_624:
	ldub	[%l7 + 0x7C],	%o1
	fmovspos	%xcc,	%f6,	%f6
	fmovspos	%icc,	%f1,	%f14
	fxnor	%f8,	%f4,	%f6
	fcmpd	%fcc2,	%f12,	%f4
	stw	%o4,	[%l7 + 0x40]
	fnands	%f2,	%f3,	%f13
	edge32n	%g4,	%i3,	%i0
	ldd	[%l7 + 0x70],	%f4
	fcmpes	%fcc3,	%f10,	%f10
	st	%f11,	[%l7 + 0x24]
	fmovsne	%xcc,	%f14,	%f12
	fmuld8sux16	%f6,	%f2,	%f14
	fandnot2	%f10,	%f10,	%f12
	fcmpne32	%f8,	%f0,	%i5
	fbl,a	%fcc1,	loop_625
loop_625:
	bneg,pt	%icc,	loop_626
loop_626:
	tn	%icc,	0x4
	fbu	%fcc2,	loop_627
loop_627:
	fmul8x16au	%f3,	%f5,	%f0
	bne,a	%xcc,	loop_628
loop_628:
	fmovsg	%icc,	%f9,	%f3
	alignaddr	%g6,	%o2,	%l1
	sllx	%o0,	0x0A,	%g1
	fcmpeq32	%f4,	%f2,	%i2
	fmovrse	%l5,	%f3,	%f12
	fmul8x16au	%f8,	%f7,	%f8
	fmovsge	%icc,	%f2,	%f11
	fmovdle	%icc,	%f14,	%f12
	fnegd	%f0,	%f14
	fmovrslez	%o5,	%f4,	%f0
	andcc	%l3,	0x0AF2,	%i1
	bcs,pt	%icc,	loop_629
loop_629:
	fmovdcc	%xcc,	%f5,	%f5
	fnot1s	%f13,	%f7
	fornot2	%f12,	%f14,	%f2
	fmovdgu	%icc,	%f11,	%f9
	bvs,pn	%icc,	loop_630
loop_630:
	mova	%xcc,	%o6,	%l4
	fmovdgu	%icc,	%f8,	%f12
	fzero	%f10
	fcmps	%fcc1,	%f5,	%f0
	ldsw	[%l7 + 0x54],	%l6
	edge16n	%g2,	%g7,	%g3
	fmovrsgz	%i6,	%f2,	%f5
	nop
	setx loop_631, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_631:
	fmuld8sux16	%f0,	%f12,	%f0
	fcmple16	%f14,	%f2,	%i7
	fcmple16	%f8,	%f2,	%o3
	fmovd	%f0,	%f8
	siam	0x1
	fpsub32	%f0,	%f10,	%f4
	fpsub16s	%f12,	%f12,	%f5
	stb	%i4,	[%l7 + 0x7C]
	fornot2	%f8,	%f6,	%f14
	fnors	%f5,	%f12,	%f1
	fmovdneg	%xcc,	%f11,	%f2
	fmovrslez	%l0,	%f12,	%f2
	fandnot2	%f14,	%f10,	%f6
	fcmps	%fcc3,	%f13,	%f7
	fcmpgt32	%f10,	%f14,	%g5
	tpos	%icc,	0x4
	fmovda	%xcc,	%f15,	%f11
	fcmple32	%f12,	%f12,	%l2
	fors	%f0,	%f0,	%f10
	fmovsvs	%icc,	%f9,	%f15
	fba	%fcc3,	loop_632
loop_632:
	fmovdvs	%xcc,	%f13,	%f14
	fble	%fcc1,	loop_633
loop_633:
	ldd	[%l7 + 0x08],	%f4
	fexpand	%f5,	%f6
	fmovsvs	%xcc,	%f8,	%f0
	fmovrse	%o1,	%f4,	%f1
	fsrc1s	%f11,	%f3
	stw	%o7,	[%l7 + 0x74]
	fpsub32	%f14,	%f4,	%f8
	fmovsn	%icc,	%f7,	%f9
	fmovsg	%xcc,	%f4,	%f11
	fands	%f0,	%f3,	%f10
	fbue,a	%fcc0,	loop_634
loop_634:
	fmovrsgz	%g4,	%f9,	%f5
	stx	%o4,	[%l7 + 0x08]
	fmul8x16	%f10,	%f2,	%f0
	lduh	[%l7 + 0x26],	%i0
	fpsub16	%f4,	%f12,	%f8
	fcmped	%fcc0,	%f6,	%f0
	andncc	%i5,	%g6,	%i3
	fpadd32s	%f0,	%f3,	%f11
	fornot2	%f8,	%f0,	%f14
	fmovrdgz	%l1,	%f2,	%f8
	fands	%f9,	%f15,	%f11
	bl,pt	%icc,	loop_635
loop_635:
	ldd	[%l7 + 0x20],	%f8
	fnot2s	%f10,	%f5
	ld	[%l7 + 0x10],	%f15
	brz,a	%o2,	loop_636
loop_636:
	fmovdle	%icc,	%f0,	%f15
	fnot2s	%f8,	%f5
	fxnor	%f8,	%f12,	%f0
	fmovrdlz	%o0,	%f14,	%f14
	fxnor	%f2,	%f10,	%f14
	fmuld8sux16	%f2,	%f5,	%f0
	edge32	%i2,	%l5,	%g1
	addc	%l3,	%o5,	%o6
	fsrc2s	%f15,	%f15
	stx	%i1,	[%l7 + 0x20]
	fmovsvc	%icc,	%f0,	%f0
	fsrc1	%f8,	%f14
	fpadd32s	%f0,	%f5,	%f4
	sth	%l6,	[%l7 + 0x36]
	fmovrsgez	%g2,	%f4,	%f13
	fmovrdgez	%g7,	%f10,	%f8
	move	%icc,	%l4,	%g3
	fnand	%f8,	%f4,	%f14
	fmovsa	%xcc,	%f7,	%f6
	bne	loop_637
loop_637:
	fmovse	%xcc,	%f12,	%f0
	fandnot2	%f14,	%f8,	%f6
	edge8	%i6,	%o3,	%i7
	fcmped	%fcc3,	%f12,	%f4
	fnor	%f10,	%f0,	%f14
	lduh	[%l7 + 0x38],	%l0
	fpadd16	%f14,	%f0,	%f10
	pdist	%f2,	%f10,	%f4
	fba	%fcc2,	loop_638
loop_638:
	edge16n	%g5,	%i4,	%o1
	fblg,a	%fcc0,	loop_639
loop_639:
	orncc	%l2,	0x1E55,	%o7
	ldub	[%l7 + 0x08],	%g4
	addc	%o4,	0x0783,	%i5
	sra	%g6,	0x17,	%i0
	fmovdge	%icc,	%f2,	%f14
	fmovda	%icc,	%f7,	%f10
	fpsub32	%f4,	%f8,	%f8
	brlez	%i3,	loop_640
loop_640:
	orn	%l1,	%o0,	%i2
	fmul8x16	%f11,	%f8,	%f12
	fcmpgt16	%f2,	%f12,	%l5
	bneg,a	%xcc,	loop_641
loop_641:
	brlz	%g1,	loop_642
loop_642:
	lduw	[%l7 + 0x4C],	%o2
	ldd	[%l7 + 0x60],	%f8
	edge16	%l3,	%o6,	%i1
	fpadd16s	%f8,	%f0,	%f13
	fcmpes	%fcc1,	%f3,	%f0
	ble,a,pt	%icc,	loop_643
loop_643:
	fcmpd	%fcc2,	%f14,	%f8
	fmovdcc	%xcc,	%f7,	%f9
	tgu	%xcc,	0x5
	fmovsne	%xcc,	%f15,	%f8
	fornot2	%f0,	%f12,	%f2
	movrne	%o5,	%g2,	%g7
	fmovsne	%xcc,	%f5,	%f13
	tcc	%xcc,	0x7
	fmovrsne	%l4,	%f9,	%f14
	and	%g3,	0x0F02,	%l6
	fmovrdlz	%o3,	%f0,	%f14
	movneg	%xcc,	%i6,	%l0
	st	%f8,	[%l7 + 0x38]
	fmul8x16al	%f4,	%f14,	%f2
	fornot2	%f6,	%f12,	%f2
	fbu	%fcc3,	loop_644
loop_644:
	fmovdvc	%xcc,	%f3,	%f9
	fone	%f8
	fmovd	%f12,	%f8
	pdist	%f10,	%f12,	%f2
	fmovrdgz	%i7,	%f12,	%f4
	edge32n	%g5,	%i4,	%o1
	fmovdg	%icc,	%f14,	%f0
	fcmpgt32	%f10,	%f4,	%l2
	bleu,a	%xcc,	loop_645
loop_645:
	smul	%o7,	0x0D5B,	%o4
	taddcc	%g4,	0x1000,	%i5
	fnor	%f4,	%f6,	%f4
	lduh	[%l7 + 0x18],	%g6
	fmovdge	%icc,	%f2,	%f1
	fmovrdgez	%i0,	%f2,	%f12
	edge32n	%i3,	%l1,	%o0
	ldx	[%l7 + 0x30],	%i2
	fsrc2	%f10,	%f0
	faligndata	%f12,	%f14,	%f2
	fmovsleu	%icc,	%f2,	%f10
	fmovsgu	%icc,	%f4,	%f9
	fmovdle	%xcc,	%f8,	%f2
	fpack32	%f2,	%f14,	%f2
	andcc	%g1,	%o2,	%l3
	lduw	[%l7 + 0x5C],	%l5
	fmovdle	%icc,	%f3,	%f0
	fmul8x16	%f14,	%f10,	%f0
	fmovrdgz	%i1,	%f8,	%f8
	andn	%o6,	0x01C4,	%o5
	sdiv	%g7,	0x0975,	%g2
	fmul8x16	%f4,	%f0,	%f2
	sra	%g3,	%l6,	%l4
	fabsd	%f12,	%f12
	fmovdl	%xcc,	%f8,	%f9
	tn	%xcc,	0x4
	fmovrdlez	%i6,	%f2,	%f14
	movrne	%o3,	0x043,	%i7
	fornot2	%f4,	%f2,	%f12
	tcc	%xcc,	0x7
	fmovsa	%icc,	%f7,	%f12
	nop
	setx loop_646, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_646:
	fbu	%fcc1,	loop_647
loop_647:
	fpadd32	%f8,	%f6,	%f6
	fmovdge	%xcc,	%f12,	%f13
	fbule,a	%fcc2,	loop_648
loop_648:
	bneg,pt	%xcc,	loop_649
loop_649:
	edge8ln	%l0,	%i4,	%o1
	fxors	%f1,	%f14,	%f4
	ldsh	[%l7 + 0x46],	%l2
	fmovd	%f12,	%f14
	fands	%f10,	%f1,	%f8
	fpadd16s	%f13,	%f6,	%f3
	fnot1s	%f1,	%f7
	fcmpeq16	%f12,	%f0,	%o7
	fmovs	%f5,	%f9
	fsrc1s	%f5,	%f0
	fnot1s	%f2,	%f11
	movgu	%xcc,	%o4,	%g4
	ldx	[%l7 + 0x30],	%g5
	edge16ln	%i5,	%i0,	%g6
	array32	%i3,	%o0,	%l1
	fmuld8sux16	%f6,	%f4,	%f4
	fbl,a	%fcc1,	loop_650
loop_650:
	fmovrslez	%g1,	%f14,	%f3
	movge	%icc,	%i2,	%o2
	fsrc1	%f12,	%f0
	tle	%xcc,	0x2
	ldd	[%l7 + 0x38],	%f14
	fbo	%fcc1,	loop_651
loop_651:
	fnot1s	%f2,	%f0
	fbe,a	%fcc0,	loop_652
loop_652:
	stb	%l3,	[%l7 + 0x2A]
	fmovdcc	%xcc,	%f12,	%f7
	fandnot2	%f8,	%f8,	%f0
	fbl	%fcc3,	loop_653
loop_653:
	fmuld8sux16	%f0,	%f5,	%f0
	lduw	[%l7 + 0x10],	%i1
	fandnot2s	%f11,	%f3,	%f11
	fpadd32s	%f4,	%f3,	%f14
	fcmps	%fcc1,	%f4,	%f15
	sth	%o6,	[%l7 + 0x32]
	fmovdn	%icc,	%f15,	%f0
	array8	%o5,	%g7,	%g2
	faligndata	%f12,	%f14,	%f8
	nop
	setx loop_654, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_654:
	sll	%g3,	%l6,	%l5
	addc	%i6,	%o3,	%l4
	ldsh	[%l7 + 0x38],	%l0
	fcmple32	%f10,	%f0,	%i7
	fpsub32s	%f4,	%f0,	%f15
	fornot1	%f6,	%f10,	%f14
	fnegd	%f0,	%f8
	fnegd	%f10,	%f2
	siam	0x6
	fxor	%f8,	%f14,	%f0
	bge,pn	%xcc,	loop_655
loop_655:
	ldx	[%l7 + 0x58],	%i4
	fnand	%f12,	%f4,	%f6
	fbe,a	%fcc2,	loop_656
loop_656:
	fmovsg	%icc,	%f10,	%f11
	fcmpne16	%f8,	%f10,	%o1
	fmovdge	%xcc,	%f13,	%f11
	ldub	[%l7 + 0x39],	%l2
	fbg	%fcc3,	loop_657
loop_657:
	fpack16	%f6,	%f0
	fnegs	%f13,	%f6
	ldsb	[%l7 + 0x66],	%o7
	bcc,pn	%xcc,	loop_658
loop_658:
	tvc	%xcc,	0x5
	edge32n	%o4,	%g4,	%g5
	sllx	%i0,	0x17,	%g6
	movre	%i5,	0x2D6,	%i3
	fmovrdgez	%l1,	%f8,	%f4
	fmul8x16	%f10,	%f4,	%f14
	fmovrsne	%g1,	%f0,	%f15
	fmovda	%xcc,	%f13,	%f2
	fcmpes	%fcc0,	%f0,	%f6
	ldd	[%l7 + 0x58],	%f4
	nop
	setx loop_659, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_659:
	sdivcc	%i2,	0x1B34,	%o0
	fblg,a	%fcc0,	loop_660
loop_660:
	fmovrdgez	%o2,	%f10,	%f6
	movcc	%icc,	%i1,	%l3
	ldsh	[%l7 + 0x74],	%o6
	sdivcc	%g7,	0x0856,	%o5
	fpsub16s	%f14,	%f10,	%f7
	fmuld8sux16	%f5,	%f3,	%f10
	fpack32	%f0,	%f8,	%f0
	fxnor	%f8,	%f4,	%f0
	fmovdleu	%xcc,	%f15,	%f9
	fornot1	%f14,	%f8,	%f12
	movcs	%xcc,	%g3,	%l6
	fnors	%f13,	%f14,	%f7
	fpadd16	%f14,	%f0,	%f6
	fpadd32s	%f5,	%f14,	%f2
	bne,pt	%xcc,	loop_661
loop_661:
	fnand	%f12,	%f12,	%f14
	fmovsne	%icc,	%f10,	%f1
	nop
	setx loop_662, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_662:
	bshuffle	%f4,	%f2,	%f4
	sllx	%g2,	%i6,	%l5
	fpsub16	%f10,	%f12,	%f10
	fmovdneg	%icc,	%f12,	%f8
	stx	%o3,	[%l7 + 0x38]
	brnz	%l0,	loop_663
loop_663:
	fandnot2s	%f14,	%f8,	%f0
	fmovspos	%icc,	%f1,	%f15
	array32	%l4,	%i7,	%o1
	fnand	%f2,	%f4,	%f6
	fmovrdgz	%i4,	%f10,	%f14
	fexpand	%f9,	%f0
	fmovdvc	%icc,	%f7,	%f13
	lduw	[%l7 + 0x3C],	%l2
	smulcc	%o4,	0x0679,	%o7
	fzeros	%f14
	fmovde	%icc,	%f1,	%f14
	fors	%f11,	%f4,	%f1
	movne	%xcc,	%g5,	%i0
	fsrc1s	%f3,	%f2
	fmovdl	%xcc,	%f6,	%f12
	movrgz	%g4,	%i5,	%i3
	lduw	[%l7 + 0x7C],	%g6
	fnor	%f14,	%f8,	%f10
	mulx	%g1,	%l1,	%o0
	edge8ln	%i2,	%i1,	%o2
	fnor	%f4,	%f12,	%f10
	edge16n	%o6,	%l3,	%g7
	fmovdneg	%xcc,	%f14,	%f2
	ldd	[%l7 + 0x08],	%f4
	fandnot1s	%f9,	%f3,	%f15
	fmovscc	%xcc,	%f10,	%f12
	fxors	%f1,	%f15,	%f8
	movneg	%xcc,	%o5,	%l6
	lduw	[%l7 + 0x48],	%g3
	fandnot2s	%f12,	%f6,	%f11
	brnz	%g2,	loop_664
loop_664:
	srax	%l5,	%o3,	%i6
	nop
	setx loop_665, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_665:
	fpsub32	%f0,	%f2,	%f14
	ldsw	[%l7 + 0x20],	%l4
	and	%i7,	0x1DAD,	%l0
	udivcc	%i4,	0x1171,	%o1
	pdist	%f2,	%f10,	%f10
	fpadd16s	%f3,	%f9,	%f4
	movrlez	%o4,	0x2C3,	%o7
	fbul,a	%fcc2,	loop_666
loop_666:
	fzero	%f12
	bshuffle	%f6,	%f4,	%f2
	subccc	%l2,	%g5,	%g4
	sdiv	%i5,	0x085A,	%i3
	stb	%i0,	[%l7 + 0x69]
	ldsh	[%l7 + 0x36],	%g1
	add	%l1,	%o0,	%g6
	fmovscc	%icc,	%f9,	%f12
	bvc,a,pn	%xcc,	loop_667
loop_667:
	or	%i1,	0x036C,	%o2
	udiv	%i2,	0x081E,	%l3
	fzeros	%f14
	tpos	%icc,	0x1
	fmovdg	%icc,	%f1,	%f6
	or	%o6,	%o5,	%g7
	fmovdl	%icc,	%f10,	%f9
	fexpand	%f12,	%f8
	fcmpes	%fcc2,	%f10,	%f10
	fmuld8ulx16	%f11,	%f15,	%f10
	subcc	%l6,	%g3,	%l5
	std	%f2,	[%l7 + 0x08]
	edge16n	%o3,	%g2,	%l4
	fmovsl	%icc,	%f3,	%f3
	fcmpgt16	%f12,	%f2,	%i7
	fpadd16	%f8,	%f2,	%f14
	fmovsg	%xcc,	%f15,	%f6
	fors	%f1,	%f5,	%f6
	fmovrsne	%l0,	%f6,	%f10
	ldsh	[%l7 + 0x28],	%i4
	fornot2	%f2,	%f4,	%f12
	lduw	[%l7 + 0x50],	%i6
	fmovdl	%icc,	%f8,	%f1
	sdivx	%o1,	0x1F91,	%o4
	movrlz	%o7,	%g5,	%g4
	fmovdpos	%xcc,	%f14,	%f2
	fmovdn	%icc,	%f8,	%f12
	fnors	%f2,	%f15,	%f13
	for	%f14,	%f12,	%f2
	nop
	setx loop_668, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_668:
	stx	%l2,	[%l7 + 0x28]
	fornot1s	%f15,	%f15,	%f14
	ldd	[%l7 + 0x20],	%f4
	move	%icc,	%i3,	%i5
	fpadd16s	%f15,	%f9,	%f2
	fblg	%fcc3,	loop_669
loop_669:
	fbn	%fcc3,	loop_670
loop_670:
	ldsb	[%l7 + 0x1D],	%i0
	edge8	%g1,	%o0,	%g6
	bshuffle	%f4,	%f6,	%f10
	fbl,a	%fcc3,	loop_671
loop_671:
	fmovrslz	%l1,	%f1,	%f12
	fmovdl	%icc,	%f8,	%f15
	fpack16	%f12,	%f13
	fandnot1	%f6,	%f14,	%f10
	fnegs	%f9,	%f7
	fpadd32s	%f4,	%f6,	%f3
	bvs	%icc,	loop_672
loop_672:
	movleu	%xcc,	%o2,	%i2
	pdist	%f14,	%f12,	%f0
	fmovrdlez	%i1,	%f14,	%f4
	fxnors	%f12,	%f3,	%f14
	ble,a,pt	%xcc,	loop_673
loop_673:
	fbue	%fcc0,	loop_674
loop_674:
	ldsh	[%l7 + 0x0E],	%l3
	movl	%xcc,	%o5,	%g7
	fmovrsgez	%l6,	%f10,	%f2
	fmovrdlz	%o6,	%f2,	%f6
	fabsd	%f4,	%f12
	fpackfix	%f0,	%f14
	fmovdvc	%icc,	%f12,	%f13
	fcmps	%fcc2,	%f14,	%f13
	fpackfix	%f2,	%f13
	tleu	%icc,	0x7
	subcc	%g3,	%l5,	%o3
	st	%f2,	[%l7 + 0x44]
	and	%l4,	%i7,	%l0
	fxnors	%f9,	%f10,	%f11
	fpadd16s	%f9,	%f12,	%f3
	fornot1	%f6,	%f14,	%f6
	fcmpeq32	%f2,	%f8,	%g2
	fmovsle	%xcc,	%f10,	%f12
	fnegs	%f0,	%f8
	fmuld8ulx16	%f5,	%f9,	%f6
	fbne,a	%fcc2,	loop_675
loop_675:
	fcmpgt16	%f4,	%f4,	%i4
	fnot1s	%f12,	%f10
	bcs,pt	%icc,	loop_676
loop_676:
	ldsb	[%l7 + 0x3B],	%o1
	sllx	%o4,	0x03,	%o7
	fcmpgt32	%f4,	%f14,	%i6
	fandnot2s	%f14,	%f9,	%f14
	fmovdge	%icc,	%f10,	%f8
	ld	[%l7 + 0x08],	%f9
	fcmpeq16	%f10,	%f4,	%g5
	fbne	%fcc1,	loop_677
loop_677:
	st	%f14,	[%l7 + 0x78]
	sth	%l2,	[%l7 + 0x6C]
	fpsub32	%f6,	%f12,	%f14
	fbuge,a	%fcc1,	loop_678
loop_678:
	brgez	%i3,	loop_679
loop_679:
	fbo	%fcc2,	loop_680
loop_680:
	fcmpgt32	%f10,	%f10,	%g4
	fxnors	%f1,	%f8,	%f12
	popc	0x087C,	%i5
	ldx	[%l7 + 0x18],	%g1
	fnegd	%f14,	%f8
	fpsub32	%f4,	%f6,	%f12
	fnands	%f10,	%f12,	%f14
	fmovdge	%xcc,	%f1,	%f10
	fandnot2	%f8,	%f12,	%f8
	edge16ln	%i0,	%o0,	%g6
	st	%f8,	[%l7 + 0x44]
	fpack32	%f4,	%f10,	%f12
	fpadd32	%f8,	%f8,	%f4
	fbue	%fcc2,	loop_681
loop_681:
	fmovde	%xcc,	%f12,	%f14
	fsrc1s	%f7,	%f12
	bleu,pt	%icc,	loop_682
loop_682:
	tneg	%xcc,	0x1
	fmovdvs	%xcc,	%f8,	%f12
	fandnot1s	%f2,	%f13,	%f9
	ldx	[%l7 + 0x48],	%l1
	fcmpne16	%f0,	%f8,	%i2
	movrne	%o2,	%l3,	%o5
	fmovscs	%xcc,	%f14,	%f13
	fmovsvs	%icc,	%f5,	%f11
	tvs	%xcc,	0x1
	bleu	loop_683
loop_683:
	tvc	%xcc,	0x4
	fmul8sux16	%f14,	%f6,	%f8
	fmovdne	%xcc,	%f9,	%f2
	xor	%g7,	0x1B24,	%l6
	fmovscc	%icc,	%f15,	%f2
	fornot1s	%f2,	%f12,	%f4
	fabsd	%f10,	%f10
	te	%icc,	0x0
	ldsh	[%l7 + 0x62],	%i1
	umulcc	%g3,	0x01A5,	%l5
	fbug	%fcc3,	loop_684
loop_684:
	fcmple32	%f0,	%f0,	%o6
	fmovsne	%icc,	%f8,	%f8
	fbg,a	%fcc2,	loop_685
loop_685:
	fpmerge	%f7,	%f9,	%f12
	fmovsvc	%icc,	%f13,	%f9
	fmul8x16	%f5,	%f12,	%f2
	fpsub32s	%f8,	%f0,	%f1
	fmovdneg	%icc,	%f13,	%f3
	fcmple16	%f14,	%f2,	%o3
	fmovs	%f4,	%f6
	ld	[%l7 + 0x5C],	%f11
	fpack16	%f14,	%f10
	fabsd	%f14,	%f4
	fpadd32	%f10,	%f0,	%f4
	stx	%l4,	[%l7 + 0x30]
	fmovrdgz	%i7,	%f4,	%f14
	fone	%f6
	fbe,a	%fcc2,	loop_686
loop_686:
	fcmpgt32	%f0,	%f2,	%g2
	std	%f2,	[%l7 + 0x68]
	fmovsge	%icc,	%f12,	%f6
	bshuffle	%f8,	%f4,	%f2
	bcs	loop_687
loop_687:
	lduh	[%l7 + 0x7E],	%l0
	fmovrdlz	%i4,	%f4,	%f10
	fandnot1s	%f1,	%f5,	%f4
	ldsh	[%l7 + 0x42],	%o4
	fbul	%fcc2,	loop_688
loop_688:
	fxnor	%f2,	%f6,	%f8
	fcmped	%fcc1,	%f2,	%f8
	fmovrdgz	%o1,	%f0,	%f12
	edge32l	%i6,	%o7,	%l2
	fcmped	%fcc3,	%f2,	%f0
	fcmpeq16	%f12,	%f4,	%i3
	fmovrdne	%g5,	%f0,	%f0
	tn	%icc,	0x0
	fcmpne16	%f12,	%f2,	%i5
	ble,pt	%xcc,	loop_689
loop_689:
	fmul8x16	%f6,	%f4,	%f2
	lduh	[%l7 + 0x5A],	%g1
	stb	%g4,	[%l7 + 0x5E]
	ldx	[%l7 + 0x70],	%i0
	fabss	%f0,	%f0
	fcmpne16	%f2,	%f14,	%o0
	lduh	[%l7 + 0x52],	%l1
	orncc	%g6,	0x1C2F,	%o2
	ldx	[%l7 + 0x20],	%l3
	movre	%o5,	0x30F,	%g7
	fpsub32s	%f12,	%f15,	%f11
	ldd	[%l7 + 0x50],	%f6
	fmovdg	%xcc,	%f15,	%f15
	brgz,a	%l6,	loop_690
loop_690:
	bne,pn	%xcc,	loop_691
loop_691:
	stx	%i1,	[%l7 + 0x78]
	ble,a	%icc,	loop_692
loop_692:
	fmovrdlz	%g3,	%f4,	%f12
	fzeros	%f2
	fone	%f12
	fmovdneg	%xcc,	%f5,	%f14
	fcmpne32	%f4,	%f14,	%i2
	fmovrse	%o6,	%f3,	%f2
	fmovsvc	%xcc,	%f3,	%f9
	fbu	%fcc0,	loop_693
loop_693:
	movre	%l5,	%l4,	%o3
	fandnot2	%f4,	%f12,	%f2
	fnors	%f14,	%f15,	%f15
	fone	%f14
	fmovsne	%xcc,	%f6,	%f7
	orcc	%g2,	%l0,	%i4
	bvs	%icc,	loop_694
loop_694:
	fnand	%f2,	%f10,	%f14
	umulcc	%i7,	0x0008,	%o4
	alignaddr	%i6,	%o7,	%o1
	fpsub32	%f8,	%f14,	%f2
	lduw	[%l7 + 0x5C],	%i3
	edge8ln	%g5,	%i5,	%l2
	fmovdvc	%icc,	%f3,	%f10
	fmovde	%icc,	%f7,	%f10
	fmovspos	%xcc,	%f0,	%f6
	fnot2s	%f9,	%f6
	fmovsge	%xcc,	%f3,	%f0
	fcmpes	%fcc3,	%f5,	%f1
	fmul8x16au	%f15,	%f4,	%f0
	fandnot1s	%f1,	%f4,	%f13
	fmovscs	%icc,	%f2,	%f7
	srl	%g1,	%i0,	%g4
	ldx	[%l7 + 0x78],	%l1
	tsubcctv	%g6,	%o0,	%l3
	fmul8ulx16	%f0,	%f4,	%f2
	fnegs	%f8,	%f8
	fpadd32	%f8,	%f10,	%f14
	fandnot2	%f2,	%f2,	%f4
	fmovsvc	%icc,	%f5,	%f14
	brgez	%o5,	loop_695
loop_695:
	srax	%g7,	0x10,	%o2
	ldsb	[%l7 + 0x40],	%i1
	fbe	%fcc2,	loop_696
loop_696:
	fpackfix	%f10,	%f0
	fmovdvc	%xcc,	%f4,	%f10
	fmovdgu	%icc,	%f6,	%f7
	fmul8x16al	%f3,	%f10,	%f4
	fandnot2s	%f3,	%f7,	%f7
	bcs	%xcc,	loop_697
loop_697:
	tsubcctv	%g3,	%l6,	%i2
	fmul8ulx16	%f10,	%f10,	%f12
	fmul8sux16	%f0,	%f6,	%f2
	fands	%f4,	%f2,	%f0
	sdivx	%o6,	0x1F86,	%l5
	bshuffle	%f2,	%f6,	%f14
	fmul8x16al	%f8,	%f6,	%f14
	fbg	%fcc1,	loop_698
loop_698:
	fornot1	%f12,	%f10,	%f14
	fmovspos	%xcc,	%f10,	%f1
	movre	%o3,	%g2,	%l0
	ba,pt	%xcc,	loop_699
loop_699:
	fnors	%f3,	%f11,	%f11
	fmovrdgz	%l4,	%f4,	%f12
	fmovsne	%icc,	%f15,	%f7
	brnz	%i4,	loop_700
loop_700:
	fmovscs	%icc,	%f13,	%f12
	fnegd	%f8,	%f6
	std	%f6,	[%l7 + 0x18]
	fcmpgt16	%f8,	%f2,	%i7
	fmovdle	%icc,	%f3,	%f4
	fcmpd	%fcc1,	%f6,	%f10
	alignaddrl	%o4,	%o7,	%i6
	fcmped	%fcc1,	%f4,	%f6
	fnors	%f8,	%f6,	%f6
	fblg,a	%fcc1,	loop_701
loop_701:
	fmovdne	%icc,	%f14,	%f12
	fornot1s	%f1,	%f1,	%f12
	fcmped	%fcc3,	%f6,	%f6
	fbo	%fcc1,	loop_702
loop_702:
	fmovrdlz	%o1,	%f14,	%f8
	fexpand	%f13,	%f10
	fmovsn	%icc,	%f10,	%f1
	fmul8x16	%f2,	%f2,	%f2
	array8	%i3,	%i5,	%l2
	orcc	%g1,	%i0,	%g5
	movneg	%icc,	%l1,	%g4
	edge16l	%o0,	%g6,	%l3
	fmul8ulx16	%f14,	%f14,	%f4
	fcmped	%fcc2,	%f14,	%f6
	fmovse	%icc,	%f12,	%f10
	movrlz	%o5,	0x101,	%o2
	ldsh	[%l7 + 0x1A],	%i1
	fnor	%f6,	%f8,	%f4
	fmovdneg	%icc,	%f5,	%f12
	fnot1s	%f14,	%f11
	edge16l	%g3,	%l6,	%i2
	fzero	%f12
	fpadd16s	%f14,	%f8,	%f5
	ldsb	[%l7 + 0x63],	%g7
	fbg,a	%fcc3,	loop_703
loop_703:
	fmovdvc	%icc,	%f9,	%f4
	tg	%icc,	0x3
	edge32l	%l5,	%o3,	%g2
	mulx	%l0,	0x18D4,	%l4
	faligndata	%f2,	%f14,	%f0
	fones	%f1
	ba	%icc,	loop_704
loop_704:
	xnorcc	%o6,	0x1B44,	%i4
	fpmerge	%f0,	%f10,	%f2
	ldsb	[%l7 + 0x1F],	%i7
	fcmpgt16	%f6,	%f2,	%o7
	fzeros	%f10
	fmovrdlez	%i6,	%f2,	%f12
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type f   	: 577
!	Type cti   	: 127
!	Type i   	: 180
!	Type l   	: 116
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
main_t4:

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0xD,	%g2
	set	0x7,	%g3
	set	0x2,	%g4
	set	0x1,	%g5
	set	0xB,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x9,	%i1
	set	-0x3,	%i2
	set	-0xD,	%i3
	set	-0x5,	%i4
	set	-0xC,	%i5
	set	-0x2,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x2DAC14B5,	%l0
	set	0x79CD4D5A,	%l1
	set	0x33A14486,	%l2
	set	0x1CE14A42,	%l3
	set	0x04A9DC0D,	%l4
	set	0x232EA342,	%l5
	set	0x2BE8B4AB,	%l6
	!# Output registers
	set	0x057A,	%o0
	set	-0x0678,	%o1
	set	-0x0987,	%o2
	set	0x1E3E,	%o3
	set	-0x17ED,	%o4
	set	-0x07DD,	%o5
	set	0x0257,	%o6
	set	-0x1C30,	%o7

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

	bpos,a	loop_705
loop_705:
	call	loop_706
loop_706:
	fbge	%fcc0,	loop_707
loop_707:
	nop
	setx loop_708, %l0, %l1
	jmpl %l1, %o1
loop_708:
	edge32l	%i3,	%o4,	%i5
	fcmpne16	%f10,	%f8,	%g1
	alignaddr	%l2,	%g5,	%i0
	lduh	[%l7 + 0x68],	%g4
	bleu,pn	%xcc,	loop_709
loop_709:
	nop
	setx loop_710, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_710:
	stb	%l1,	[%l7 + 0x50]
	nop
	setx loop_711, %l0, %l1
	jmpl %l1, %g6
loop_711:
	fbuge,a	%fcc2,	loop_712
loop_712:
	fands	%f15,	%f3,	%f3
	fmovsg	%xcc,	%f1,	%f3
	fpmerge	%f4,	%f7,	%f4
	fpsub16s	%f7,	%f10,	%f11
	fba,a	%fcc1,	loop_713
loop_713:
	bleu,a,pn	%xcc,	loop_714
loop_714:
	tl	%icc,	0x5
	movrgez	%o0,	0x2D1,	%l3
	brlez,a	%o5,	loop_715
loop_715:
	bneg,a,pn	%icc,	loop_716
loop_716:
	bvc,a	%xcc,	loop_717
loop_717:
	nop
	setx loop_718, %l0, %l1
	jmpl %l1, %o2
loop_718:
	brlez	%g3,	loop_719
loop_719:
	ta	%icc,	0x4
	fbule	%fcc1,	loop_720
loop_720:
	fmovrdne	%l6,	%f2,	%f6
	add	%i1,	0x0FF0,	%i2
	ba,a	%icc,	loop_721
loop_721:
	fbe,a	%fcc2,	loop_722
loop_722:
	fxnor	%f14,	%f2,	%f4
	bg	%icc,	loop_723
loop_723:
	fba	%fcc2,	loop_724
loop_724:
	sth	%l5,	[%l7 + 0x1C]
	fcmps	%fcc0,	%f0,	%f0
	bgu,a	%xcc,	loop_725
loop_725:
	fbug	%fcc2,	loop_726
loop_726:
	fbl,a	%fcc0,	loop_727
loop_727:
	brlz,a	%g7,	loop_728
loop_728:
	nop
	setx loop_729, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_729:
	fbule,a	%fcc2,	loop_730
loop_730:
	fandnot2	%f10,	%f8,	%f4
	fbuge	%fcc0,	loop_731
loop_731:
	ta	%xcc,	0x1
	fble,a	%fcc2,	loop_732
loop_732:
	fmovsn	%icc,	%f3,	%f7
	fbge,a	%fcc2,	loop_733
loop_733:
	tcs	%icc,	0x2
	bleu,pn	%xcc,	loop_734
loop_734:
	fmovsvs	%icc,	%f6,	%f6
	fcmpgt32	%f12,	%f2,	%o3
	ble,a,pn	%xcc,	loop_735
loop_735:
	fmovdn	%icc,	%f15,	%f1
	nop
	setx loop_736, %l0, %l1
	jmpl %l1, %g2
loop_736:
	bleu,a	%xcc,	loop_737
loop_737:
	orn	%l0,	0x0B42,	%l4
	lduw	[%l7 + 0x3C],	%i4
	ldub	[%l7 + 0x0F],	%o6
	fornot2	%f14,	%f8,	%f4
	brz,a	%i7,	loop_738
loop_738:
	fbu	%fcc0,	loop_739
loop_739:
	ldsh	[%l7 + 0x72],	%o7
	movleu	%icc,	%i6,	%i3
	sdiv	%o1,	0x0063,	%o4
	fmovrse	%g1,	%f8,	%f2
	srl	%i5,	0x12,	%l2
	fmovrdgz	%i0,	%f14,	%f4
	bcs,pt	%xcc,	loop_740
loop_740:
	fbge,a	%fcc1,	loop_741
loop_741:
	fmovdg	%xcc,	%f14,	%f10
	brgez,a	%g5,	loop_742
loop_742:
	bgu	%xcc,	loop_743
loop_743:
	bpos,pt	%icc,	loop_744
loop_744:
	stx	%l1,	[%l7 + 0x18]
	fzero	%f2
	bne	loop_745
loop_745:
	lduh	[%l7 + 0x40],	%g6
	lduh	[%l7 + 0x7C],	%g4
	nop
	setx loop_746, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_746:
	movrgez	%l3,	%o5,	%o2
	movrgz	%o0,	0x106,	%l6
	tle	%icc,	0x3
	smul	%g3,	0x1660,	%i1
	tneg	%icc,	0x6
	bcc,a	loop_747
loop_747:
	stx	%l5,	[%l7 + 0x38]
	fbul,a	%fcc3,	loop_748
loop_748:
	fors	%f15,	%f10,	%f13
	ble	loop_749
loop_749:
	movrlz	%g7,	%o3,	%i2
	fbg	%fcc2,	loop_750
loop_750:
	fbug	%fcc1,	loop_751
loop_751:
	fbug	%fcc1,	loop_752
loop_752:
	xor	%l0,	0x1DAA,	%l4
	bn	loop_753
loop_753:
	tg	%icc,	0x4
	fbul,a	%fcc0,	loop_754
loop_754:
	stx	%i4,	[%l7 + 0x20]
	nop
	setx loop_755, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_755:
	fornot2s	%f10,	%f14,	%f15
	ldub	[%l7 + 0x0B],	%g2
	ba,a,pn	%icc,	loop_756
loop_756:
	brlez,a	%i7,	loop_757
loop_757:
	sethi	0x13DA,	%o6
	srl	%o7,	%i6,	%i3
	lduw	[%l7 + 0x4C],	%o4
	bg,a	loop_758
loop_758:
	fbug,a	%fcc1,	loop_759
loop_759:
	edge32	%o1,	%i5,	%l2
	sth	%g1,	[%l7 + 0x5E]
	bvc,a	%icc,	loop_760
loop_760:
	movcc	%xcc,	%g5,	%i0
	bl,a,pt	%xcc,	loop_761
loop_761:
	fsrc1s	%f5,	%f0
	fbule	%fcc1,	loop_762
loop_762:
	nop
	setx loop_763, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_763:
	fpack16	%f8,	%f0
	siam	0x2
	fbu,a	%fcc0,	loop_764
loop_764:
	addcc	%l1,	0x0B39,	%g4
	sub	%g6,	0x14C9,	%l3
	fmovdleu	%xcc,	%f0,	%f11
	sdiv	%o5,	0x1B93,	%o0
	bpos	loop_765
loop_765:
	nop
	setx loop_766, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_766:
	bleu,a	loop_767
loop_767:
	ldx	[%l7 + 0x30],	%o2
	ldsb	[%l7 + 0x60],	%l6
	bgu,pn	%icc,	loop_768
loop_768:
	fcmpne16	%f14,	%f2,	%i1
	ldsh	[%l7 + 0x1C],	%g3
	stb	%l5,	[%l7 + 0x0E]
	fmovdn	%icc,	%f0,	%f11
	movle	%icc,	%g7,	%i2
	brz,a	%o3,	loop_769
loop_769:
	fbule	%fcc0,	loop_770
loop_770:
	fbne,a	%fcc2,	loop_771
loop_771:
	lduh	[%l7 + 0x1E],	%l4
	fbug	%fcc3,	loop_772
loop_772:
	bpos,a	%icc,	loop_773
loop_773:
	fnors	%f5,	%f5,	%f15
	fba,a	%fcc2,	loop_774
loop_774:
	fmovsleu	%icc,	%f11,	%f2
	bneg,a,pt	%xcc,	loop_775
loop_775:
	stw	%i4,	[%l7 + 0x60]
	srlx	%l0,	%g2,	%i7
	brgz,a	%o7,	loop_776
loop_776:
	fba	%fcc3,	loop_777
loop_777:
	fmovdvc	%icc,	%f7,	%f4
	udivx	%o6,	0x1E40,	%i3
	bneg,a,pn	%xcc,	loop_778
loop_778:
	brlez	%i6,	loop_779
loop_779:
	bcc,a	loop_780
loop_780:
	fbule,a	%fcc1,	loop_781
loop_781:
	brnz	%o1,	loop_782
loop_782:
	nop
	setx loop_783, %l0, %l1
	jmpl %l1, %o4
loop_783:
	nop
	setx loop_784, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_784:
	taddcc	%i5,	0x0AAF,	%g1
	movleu	%xcc,	%g5,	%l2
	fmovde	%icc,	%f7,	%f9
	brlez,a	%i0,	loop_785
loop_785:
	edge8l	%g4,	%l1,	%g6
	fnegd	%f6,	%f14
	bcc,a	loop_786
loop_786:
	sth	%l3,	[%l7 + 0x7E]
	sdiv	%o5,	0x16D9,	%o2
	fbule	%fcc1,	loop_787
loop_787:
	movgu	%icc,	%l6,	%o0
	lduh	[%l7 + 0x42],	%i1
	ldsb	[%l7 + 0x70],	%g3
	lduw	[%l7 + 0x34],	%l5
	fmovrdlez	%g7,	%f0,	%f2
	fmovdvc	%xcc,	%f9,	%f9
	ld	[%l7 + 0x58],	%f10
	fbul	%fcc2,	loop_788
loop_788:
	ba,a,pt	%icc,	loop_789
loop_789:
	tge	%xcc,	0x3
	array16	%o3,	%i2,	%i4
	st	%f8,	[%l7 + 0x74]
	addcc	%l4,	0x03E7,	%g2
	tcc	%xcc,	0x3
	fbl,a	%fcc0,	loop_790
loop_790:
	fbg,a	%fcc3,	loop_791
loop_791:
	fcmpeq32	%f10,	%f8,	%l0
	nop
	setx loop_792, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_792:
	sub	%i7,	0x0530,	%o7
	brz	%o6,	loop_793
loop_793:
	bpos,a,pn	%xcc,	loop_794
loop_794:
	fmovdl	%xcc,	%f13,	%f15
	ldx	[%l7 + 0x78],	%i3
	bleu,pn	%icc,	loop_795
loop_795:
	fbul,a	%fcc3,	loop_796
loop_796:
	bpos,a,pt	%icc,	loop_797
loop_797:
	fbo,a	%fcc0,	loop_798
loop_798:
	ble	loop_799
loop_799:
	bl,a	loop_800
loop_800:
	fmovrslz	%i6,	%f8,	%f5
	fbo,a	%fcc3,	loop_801
loop_801:
	sethi	0x00F5,	%o1
	edge8	%i5,	%g1,	%o4
	for	%f8,	%f4,	%f6
	bcs	%icc,	loop_802
loop_802:
	edge8l	%g5,	%i0,	%l2
	nop
	setx loop_803, %l0, %l1
	jmpl %l1, %l1
loop_803:
	ld	[%l7 + 0x5C],	%f0
	fbue,a	%fcc1,	loop_804
loop_804:
	orncc	%g6,	0x1ACB,	%g4
	orcc	%o5,	0x0A14,	%o2
	movgu	%icc,	%l6,	%o0
	bvc,a,pn	%icc,	loop_805
loop_805:
	tcc	%xcc,	0x2
	fmuld8ulx16	%f3,	%f2,	%f6
	st	%f10,	[%l7 + 0x58]
	fmovrde	%l3,	%f4,	%f0
	nop
	setx loop_806, %l0, %l1
	jmpl %l1, %g3
loop_806:
	edge8n	%l5,	%i1,	%o3
	bcc,a	%icc,	loop_807
loop_807:
	fbn	%fcc2,	loop_808
loop_808:
	fba	%fcc0,	loop_809
loop_809:
	fmovsa	%icc,	%f10,	%f13
	bvs	loop_810
loop_810:
	bn	loop_811
loop_811:
	fzeros	%f12
	fbge	%fcc1,	loop_812
loop_812:
	movneg	%xcc,	%i2,	%i4
	fble,a	%fcc2,	loop_813
loop_813:
	fbug,a	%fcc3,	loop_814
loop_814:
	fbge,a	%fcc2,	loop_815
loop_815:
	ble,a	%icc,	loop_816
loop_816:
	tsubcc	%l4,	%g7,	%l0
	nop
	setx loop_817, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_817:
	fcmpeq32	%f8,	%f4,	%g2
	bpos	loop_818
loop_818:
	fbuge,a	%fcc1,	loop_819
loop_819:
	brnz	%o7,	loop_820
loop_820:
	subccc	%o6,	0x09AA,	%i7
	brgz,a	%i6,	loop_821
loop_821:
	bl,pt	%icc,	loop_822
loop_822:
	fmovdle	%xcc,	%f8,	%f15
	ldd	[%l7 + 0x20],	%f4
	lduw	[%l7 + 0x48],	%o1
	ldd	[%l7 + 0x58],	%f2
	fbne,a	%fcc2,	loop_823
loop_823:
	ldd	[%l7 + 0x68],	%f12
	fbe	%fcc2,	loop_824
loop_824:
	udivx	%i5,	0x0112,	%i3
	tneg	%xcc,	0x1
	ld	[%l7 + 0x34],	%f10
	brgz,a	%g1,	loop_825
loop_825:
	bgu,a,pt	%icc,	loop_826
loop_826:
	fmovsa	%xcc,	%f12,	%f8
	fbule	%fcc3,	loop_827
loop_827:
	edge8	%o4,	%i0,	%l2
	fmovrdlz	%l1,	%f8,	%f4
	fbe	%fcc1,	loop_828
loop_828:
	fmovsgu	%xcc,	%f5,	%f4
	fbule,a	%fcc1,	loop_829
loop_829:
	ldx	[%l7 + 0x10],	%g5
	mulx	%g4,	0x1836,	%g6
	fpack32	%f14,	%f2,	%f0
	bvc,a	%icc,	loop_830
loop_830:
	brgz	%o5,	loop_831
loop_831:
	brgez	%l6,	loop_832
loop_832:
	bn,pn	%icc,	loop_833
loop_833:
	alignaddrl	%o0,	%l3,	%o2
	add	%g3,	0x1391,	%i1
	bge	loop_834
loop_834:
	fbg,a	%fcc1,	loop_835
loop_835:
	mulx	%o3,	%l5,	%i2
	fbuge,a	%fcc1,	loop_836
loop_836:
	ble,a	loop_837
loop_837:
	addc	%l4,	0x1360,	%i4
	bne,a,pn	%icc,	loop_838
loop_838:
	fpmerge	%f0,	%f7,	%f14
	call	loop_839
loop_839:
	brnz	%l0,	loop_840
loop_840:
	movge	%xcc,	%g2,	%g7
	bn	loop_841
loop_841:
	ble	%icc,	loop_842
loop_842:
	brnz,a	%o6,	loop_843
loop_843:
	fbule,a	%fcc1,	loop_844
loop_844:
	fmovrdne	%i7,	%f6,	%f2
	fpack16	%f10,	%f1
	fmovs	%f15,	%f3
	brnz	%i6,	loop_845
loop_845:
	fbue	%fcc0,	loop_846
loop_846:
	fmovrdgz	%o7,	%f0,	%f12
	fba,a	%fcc1,	loop_847
loop_847:
	umul	%i5,	%i3,	%g1
	nop
	setx loop_848, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_848:
	fbne	%fcc3,	loop_849
loop_849:
	ba	loop_850
loop_850:
	fbne,a	%fcc3,	loop_851
loop_851:
	fzero	%f8
	fones	%f12
	fbu	%fcc3,	loop_852
loop_852:
	fbul,a	%fcc1,	loop_853
loop_853:
	ld	[%l7 + 0x28],	%f2
	bleu,a,pt	%icc,	loop_854
loop_854:
	ldub	[%l7 + 0x75],	%o1
	nop
	setx loop_855, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_855:
	fbule,a	%fcc2,	loop_856
loop_856:
	bn,a,pt	%icc,	loop_857
loop_857:
	ldsw	[%l7 + 0x28],	%o4
	fnot1	%f12,	%f10
	smul	%i0,	%l2,	%l1
	bpos,a	loop_858
loop_858:
	bn	loop_859
loop_859:
	stx	%g4,	[%l7 + 0x30]
	brz	%g6,	loop_860
loop_860:
	bcc	%xcc,	loop_861
loop_861:
	bne,pn	%xcc,	loop_862
loop_862:
	brgz,a	%g5,	loop_863
loop_863:
	bvs	%icc,	loop_864
loop_864:
	nop
	setx loop_865, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_865:
	bvs,a,pt	%xcc,	loop_866
loop_866:
	bcs	%icc,	loop_867
loop_867:
	brgz	%o5,	loop_868
loop_868:
	ba,a	%icc,	loop_869
loop_869:
	fbge,a	%fcc1,	loop_870
loop_870:
	ldsw	[%l7 + 0x38],	%o0
	fmuld8sux16	%f1,	%f15,	%f2
	fbug	%fcc2,	loop_871
loop_871:
	fbue,a	%fcc1,	loop_872
loop_872:
	nop
	setx loop_873, %l0, %l1
	jmpl %l1, %l3
loop_873:
	fbul,a	%fcc0,	loop_874
loop_874:
	fnot2s	%f3,	%f13
	fbu	%fcc1,	loop_875
loop_875:
	fbug,a	%fcc3,	loop_876
loop_876:
	fmovdn	%icc,	%f13,	%f12
	movpos	%icc,	%o2,	%l6
	addccc	%i1,	0x0842,	%o3
	sdiv	%l5,	0x15C8,	%g3
	fble,a	%fcc3,	loop_877
loop_877:
	fmovrdgz	%l4,	%f2,	%f12
	fbuge	%fcc2,	loop_878
loop_878:
	bshuffle	%f6,	%f14,	%f14
	ldsb	[%l7 + 0x19],	%i4
	fbn	%fcc2,	loop_879
loop_879:
	brgz	%i2,	loop_880
loop_880:
	tvs	%xcc,	0x1
	call	loop_881
loop_881:
	fbn	%fcc1,	loop_882
loop_882:
	fmovdn	%xcc,	%f8,	%f3
	bcs,pn	%xcc,	loop_883
loop_883:
	fbuge	%fcc0,	loop_884
loop_884:
	stx	%g2,	[%l7 + 0x70]
	fmovrde	%g7,	%f12,	%f4
	taddcctv	%o6,	0x0F89,	%i7
	brlez	%i6,	loop_885
loop_885:
	fmovrdlz	%l0,	%f0,	%f14
	fmul8sux16	%f8,	%f0,	%f12
	fsrc2s	%f11,	%f0
	call	loop_886
loop_886:
	fnor	%f2,	%f12,	%f0
	fandnot2s	%f5,	%f8,	%f12
	ldx	[%l7 + 0x18],	%i5
	fandnot1s	%f6,	%f10,	%f5
	sdiv	%i3,	0x10F9,	%o7
	fble	%fcc3,	loop_887
loop_887:
	fmovdgu	%xcc,	%f1,	%f6
	fbul	%fcc3,	loop_888
loop_888:
	bcc	%xcc,	loop_889
loop_889:
	stx	%o1,	[%l7 + 0x48]
	tpos	%xcc,	0x1
	brlez	%g1,	loop_890
loop_890:
	srax	%i0,	0x00,	%o4
	move	%xcc,	%l1,	%g4
	st	%f0,	[%l7 + 0x1C]
	be,pn	%xcc,	loop_891
loop_891:
	fnot1	%f6,	%f0
	ble	loop_892
loop_892:
	array8	%l2,	%g5,	%g6
	bcs,a	%icc,	loop_893
loop_893:
	ldub	[%l7 + 0x40],	%o0
	ldx	[%l7 + 0x60],	%l3
	brlz,a	%o2,	loop_894
loop_894:
	addcc	%o5,	%i1,	%l6
	bleu	%icc,	loop_895
loop_895:
	addccc	%l5,	%o3,	%l4
	bn,a	loop_896
loop_896:
	fbo	%fcc1,	loop_897
loop_897:
	edge8	%i4,	%i2,	%g3
	fbn	%fcc3,	loop_898
loop_898:
	bg,pn	%xcc,	loop_899
loop_899:
	edge8ln	%g7,	%g2,	%o6
	call	loop_900
loop_900:
	call	loop_901
loop_901:
	fmovdpos	%icc,	%f7,	%f5
	nop
	setx loop_902, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_902:
	andncc	%i6,	%l0,	%i5
	fbg,a	%fcc1,	loop_903
loop_903:
	xnor	%i7,	%o7,	%i3
	ble,a	%icc,	loop_904
loop_904:
	edge8n	%g1,	%o1,	%i0
	fexpand	%f15,	%f10
	array32	%l1,	%g4,	%o4
	nop
	setx loop_905, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_905:
	bgu,a	%xcc,	loop_906
loop_906:
	subccc	%g5,	%l2,	%o0
	edge32ln	%g6,	%l3,	%o5
	mulscc	%o2,	%l6,	%i1
	bl	%icc,	loop_907
loop_907:
	fbue	%fcc0,	loop_908
loop_908:
	movleu	%xcc,	%o3,	%l4
	and	%l5,	0x013B,	%i2
	ble	%icc,	loop_909
loop_909:
	subccc	%i4,	0x11B3,	%g3
	ld	[%l7 + 0x10],	%f11
	call	loop_910
loop_910:
	fbug,a	%fcc0,	loop_911
loop_911:
	fmovde	%icc,	%f10,	%f0
	mulx	%g7,	0x10F5,	%o6
	fbg	%fcc2,	loop_912
loop_912:
	ldsw	[%l7 + 0x5C],	%g2
	lduw	[%l7 + 0x6C],	%l0
	stw	%i5,	[%l7 + 0x18]
	brz	%i6,	loop_913
loop_913:
	orn	%i7,	%i3,	%o7
	bge,a	loop_914
loop_914:
	brlez,a	%g1,	loop_915
loop_915:
	udiv	%o1,	0x1DA9,	%i0
	fornot1s	%f8,	%f2,	%f0
	fbul,a	%fcc0,	loop_916
loop_916:
	bleu,pt	%icc,	loop_917
loop_917:
	call	loop_918
loop_918:
	ldsw	[%l7 + 0x68],	%g4
	sdivx	%o4,	0x18B3,	%g5
	fbe,a	%fcc3,	loop_919
loop_919:
	fmovdleu	%icc,	%f6,	%f4
	ldsw	[%l7 + 0x20],	%l2
	fbl	%fcc0,	loop_920
loop_920:
	movrlez	%l1,	%o0,	%g6
	subccc	%o5,	%l3,	%o2
	fbul	%fcc1,	loop_921
loop_921:
	srlx	%i1,	%l6,	%o3
	lduw	[%l7 + 0x24],	%l4
	fbne	%fcc1,	loop_922
loop_922:
	taddcctv	%i2,	0x06F1,	%i4
	alignaddr	%g3,	%g7,	%o6
	fbo	%fcc2,	loop_923
loop_923:
	fmovsa	%icc,	%f13,	%f12
	and	%g2,	0x0A93,	%l5
	fbg,a	%fcc0,	loop_924
loop_924:
	fmovspos	%xcc,	%f10,	%f4
	brgez	%l0,	loop_925
loop_925:
	fbuge,a	%fcc2,	loop_926
loop_926:
	brz	%i5,	loop_927
loop_927:
	edge16ln	%i6,	%i3,	%i7
	call	loop_928
loop_928:
	fmovd	%f8,	%f6
	fmovrslez	%g1,	%f2,	%f10
	be,pn	%xcc,	loop_929
loop_929:
	sub	%o7,	%o1,	%i0
	tle	%xcc,	0x3
	sth	%o4,	[%l7 + 0x3A]
	tne	%xcc,	0x4
	bn,pn	%icc,	loop_930
loop_930:
	smulcc	%g5,	%g4,	%l2
	bleu,a,pt	%icc,	loop_931
loop_931:
	call	loop_932
loop_932:
	fnand	%f12,	%f14,	%f12
	fbule	%fcc3,	loop_933
loop_933:
	stw	%o0,	[%l7 + 0x50]
	bg,a	%xcc,	loop_934
loop_934:
	fbue,a	%fcc0,	loop_935
loop_935:
	fpsub16s	%f2,	%f3,	%f4
	ble,a,pn	%icc,	loop_936
loop_936:
	fbule	%fcc0,	loop_937
loop_937:
	brlez,a	%g6,	loop_938
loop_938:
	bne,pt	%icc,	loop_939
loop_939:
	movge	%icc,	%o5,	%l3
	fmovsg	%xcc,	%f12,	%f7
	ble,pt	%xcc,	loop_940
loop_940:
	fbug	%fcc1,	loop_941
loop_941:
	nop
	setx loop_942, %l0, %l1
	jmpl %l1, %o2
loop_942:
	ba,a	loop_943
loop_943:
	movleu	%icc,	%l1,	%l6
	nop
	setx loop_944, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_944:
	fbg,a	%fcc3,	loop_945
loop_945:
	fba,a	%fcc1,	loop_946
loop_946:
	fmovsneg	%xcc,	%f15,	%f13
	fbg,a	%fcc1,	loop_947
loop_947:
	nop
	setx loop_948, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_948:
	be,pn	%xcc,	loop_949
loop_949:
	fmul8x16al	%f8,	%f6,	%f0
	tcs	%xcc,	0x6
	andncc	%i1,	%o3,	%l4
	fbuge	%fcc2,	loop_950
loop_950:
	smul	%i2,	0x0739,	%i4
	orcc	%g7,	%g3,	%o6
	alignaddrl	%g2,	%l5,	%l0
	ldub	[%l7 + 0x28],	%i5
	fbn,a	%fcc2,	loop_951
loop_951:
	nop
	setx loop_952, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_952:
	fbul	%fcc3,	loop_953
loop_953:
	movvs	%icc,	%i3,	%i7
	tg	%xcc,	0x0
	fcmps	%fcc3,	%f0,	%f11
	stw	%i6,	[%l7 + 0x1C]
	bgu,a,pn	%icc,	loop_954
loop_954:
	bn,a,pn	%xcc,	loop_955
loop_955:
	tl	%icc,	0x5
	nop
	setx loop_956, %l0, %l1
	jmpl %l1, %g1
loop_956:
	movle	%icc,	%o1,	%o7
	edge16	%o4,	%g5,	%i0
	bcs,pt	%xcc,	loop_957
loop_957:
	ldub	[%l7 + 0x68],	%g4
	edge16	%o0,	%g6,	%o5
	movrlz	%l3,	0x027,	%o2
	fpack32	%f8,	%f0,	%f2
	brz,a	%l2,	loop_958
loop_958:
	fba	%fcc1,	loop_959
loop_959:
	brgez	%l6,	loop_960
loop_960:
	udivx	%l1,	0x0892,	%o3
	orn	%l4,	%i2,	%i1
	fbg	%fcc0,	loop_961
loop_961:
	edge8	%i4,	%g3,	%g7
	bleu	loop_962
loop_962:
	addc	%g2,	%o6,	%l0
	bneg	loop_963
loop_963:
	ldx	[%l7 + 0x28],	%i5
	fbg,a	%fcc2,	loop_964
loop_964:
	fbe	%fcc3,	loop_965
loop_965:
	xnorcc	%i3,	0x1E06,	%i7
	fmovsl	%icc,	%f3,	%f5
	fmovdn	%xcc,	%f1,	%f15
	bpos	%xcc,	loop_966
loop_966:
	sub	%l5,	0x080A,	%g1
	udivx	%o1,	0x186A,	%o7
	fbge	%fcc3,	loop_967
loop_967:
	fbuge,a	%fcc0,	loop_968
loop_968:
	tneg	%icc,	0x4
	sub	%o4,	%i6,	%g5
	fornot2	%f6,	%f2,	%f8
	ldub	[%l7 + 0x74],	%i0
	fornot1	%f14,	%f12,	%f8
	udiv	%g4,	0x135E,	%g6
	bleu,a,pn	%xcc,	loop_969
loop_969:
	brlz	%o5,	loop_970
loop_970:
	movcc	%icc,	%l3,	%o0
	brnz,a	%l2,	loop_971
loop_971:
	fbn	%fcc3,	loop_972
loop_972:
	fbo,a	%fcc2,	loop_973
loop_973:
	te	%xcc,	0x2
	fbo	%fcc3,	loop_974
loop_974:
	ba,a	loop_975
loop_975:
	ldsw	[%l7 + 0x78],	%l6
	ldsw	[%l7 + 0x3C],	%l1
	fba,a	%fcc3,	loop_976
loop_976:
	brgez	%o3,	loop_977
loop_977:
	nop
	setx loop_978, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_978:
	fornot2	%f10,	%f2,	%f14
	bneg,pn	%xcc,	loop_979
loop_979:
	fbl,a	%fcc1,	loop_980
loop_980:
	bshuffle	%f0,	%f2,	%f4
	fmovsa	%icc,	%f11,	%f15
	call	loop_981
loop_981:
	xor	%l4,	%i2,	%o2
	nop
	setx loop_982, %l0, %l1
	jmpl %l1, %i4
loop_982:
	taddcc	%i1,	0x0C7D,	%g3
	std	%f10,	[%l7 + 0x58]
	bvs,pt	%icc,	loop_983
loop_983:
	stw	%g2,	[%l7 + 0x70]
	tsubcc	%g7,	%o6,	%l0
	fcmpgt32	%f2,	%f12,	%i5
	fmovsg	%icc,	%f8,	%f10
	tn	%xcc,	0x4
	st	%f2,	[%l7 + 0x5C]
	ba	%icc,	loop_984
loop_984:
	bneg	%xcc,	loop_985
loop_985:
	fmuld8ulx16	%f13,	%f14,	%f12
	ld	[%l7 + 0x08],	%f4
	ldx	[%l7 + 0x78],	%i7
	bcs,a,pn	%icc,	loop_986
loop_986:
	fmovsle	%icc,	%f3,	%f15
	fbul	%fcc2,	loop_987
loop_987:
	popc	%l5,	%i3
	fbl	%fcc3,	loop_988
loop_988:
	tvc	%xcc,	0x5
	brnz,a	%o1,	loop_989
loop_989:
	fbule	%fcc0,	loop_990
loop_990:
	sth	%o7,	[%l7 + 0x68]
	bcc	loop_991
loop_991:
	be,pt	%xcc,	loop_992
loop_992:
	brlez	%g1,	loop_993
loop_993:
	bvc,a,pt	%xcc,	loop_994
loop_994:
	fmovsleu	%xcc,	%f14,	%f5
	movpos	%icc,	%i6,	%o4
	st	%f12,	[%l7 + 0x1C]
	lduh	[%l7 + 0x4C],	%i0
	fba	%fcc2,	loop_995
loop_995:
	brlz	%g5,	loop_996
loop_996:
	bge,a,pn	%icc,	loop_997
loop_997:
	fcmple16	%f4,	%f12,	%g6
	bcc	loop_998
loop_998:
	fabss	%f3,	%f15
	ldsh	[%l7 + 0x0A],	%g4
	bneg,a,pn	%icc,	loop_999
loop_999:
	bl	%icc,	loop_1000
loop_1000:
	fbe,a	%fcc2,	loop_1001
loop_1001:
	tge	%xcc,	0x6
	bn,a	loop_1002
loop_1002:
	fcmpgt16	%f4,	%f2,	%o5
	ba	%icc,	loop_1003
loop_1003:
	brgz,a	%l3,	loop_1004
loop_1004:
	fmovscc	%xcc,	%f14,	%f2
	bgu,a,pt	%xcc,	loop_1005
loop_1005:
	call	loop_1006
loop_1006:
	bcc,pt	%xcc,	loop_1007
loop_1007:
	fba	%fcc2,	loop_1008
loop_1008:
	edge32	%l2,	%o0,	%l6
	fbg	%fcc3,	loop_1009
loop_1009:
	edge32ln	%l1,	%o3,	%l4
	bg,a	loop_1010
loop_1010:
	fbue,a	%fcc1,	loop_1011
loop_1011:
	fble,a	%fcc3,	loop_1012
loop_1012:
	fpack16	%f0,	%f6
	st	%f15,	[%l7 + 0x38]
	array32	%i2,	%i4,	%i1
	lduh	[%l7 + 0x2C],	%o2
	bleu,pt	%icc,	loop_1013
loop_1013:
	orn	%g3,	0x1DDC,	%g7
	ldsb	[%l7 + 0x1D],	%o6
	fnors	%f5,	%f2,	%f3
	ble,a	loop_1014
loop_1014:
	fba,a	%fcc3,	loop_1015
loop_1015:
	andncc	%g2,	%l0,	%i7
	brlez	%i5,	loop_1016
loop_1016:
	tn	%icc,	0x2
	fmul8ulx16	%f0,	%f8,	%f8
	tsubcc	%i3,	0x179A,	%o1
	ldsb	[%l7 + 0x37],	%o7
	bn,a	%xcc,	loop_1017
loop_1017:
	nop
	setx loop_1018, %l0, %l1
	jmpl %l1, %l5
loop_1018:
	lduw	[%l7 + 0x28],	%g1
	call	loop_1019
loop_1019:
	be,a,pn	%icc,	loop_1020
loop_1020:
	fands	%f1,	%f15,	%f14
	movrgez	%o4,	%i6,	%i0
	ldx	[%l7 + 0x48],	%g6
	edge8	%g4,	%g5,	%o5
	fbge	%fcc3,	loop_1021
loop_1021:
	bgu,pn	%xcc,	loop_1022
loop_1022:
	alignaddr	%l2,	%l3,	%o0
	fcmpeq16	%f2,	%f6,	%l1
	fcmpd	%fcc3,	%f0,	%f0
	fmovrslz	%o3,	%f2,	%f6
	fmovsn	%icc,	%f14,	%f7
	fmovdl	%xcc,	%f12,	%f5
	fbn,a	%fcc1,	loop_1023
loop_1023:
	bn,a,pn	%icc,	loop_1024
loop_1024:
	call	loop_1025
loop_1025:
	lduw	[%l7 + 0x28],	%l6
	fbe,a	%fcc0,	loop_1026
loop_1026:
	fbuge	%fcc0,	loop_1027
loop_1027:
	fbne,a	%fcc3,	loop_1028
loop_1028:
	or	%l4,	%i4,	%i1
	fzero	%f14
	bvc,a,pn	%xcc,	loop_1029
loop_1029:
	bneg	loop_1030
loop_1030:
	movcs	%xcc,	%o2,	%g3
	std	%f4,	[%l7 + 0x68]
	brlz,a	%g7,	loop_1031
loop_1031:
	fba	%fcc2,	loop_1032
loop_1032:
	fbl	%fcc1,	loop_1033
loop_1033:
	bvc,pn	%icc,	loop_1034
loop_1034:
	lduh	[%l7 + 0x1C],	%i2
	bneg,a,pn	%icc,	loop_1035
loop_1035:
	bpos,pt	%xcc,	loop_1036
loop_1036:
	nop
	setx loop_1037, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1037:
	bvc	%xcc,	loop_1038
loop_1038:
	fxors	%f13,	%f4,	%f6
	stx	%o6,	[%l7 + 0x38]
	nop
	setx loop_1039, %l0, %l1
	jmpl %l1, %g2
loop_1039:
	bg,a,pt	%xcc,	loop_1040
loop_1040:
	brlz,a	%l0,	loop_1041
loop_1041:
	fbug	%fcc2,	loop_1042
loop_1042:
	ldub	[%l7 + 0x0F],	%i7
	fornot2s	%f1,	%f6,	%f6
	fmovdvc	%xcc,	%f5,	%f6
	tgu	%xcc,	0x5
	fbul,a	%fcc0,	loop_1043
loop_1043:
	fbule	%fcc1,	loop_1044
loop_1044:
	bg,a,pn	%xcc,	loop_1045
loop_1045:
	fbule	%fcc3,	loop_1046
loop_1046:
	fpadd32s	%f11,	%f12,	%f15
	bcs,pt	%icc,	loop_1047
loop_1047:
	bn,pt	%xcc,	loop_1048
loop_1048:
	fmovdne	%icc,	%f5,	%f4
	ba,pn	%icc,	loop_1049
loop_1049:
	fbug	%fcc0,	loop_1050
loop_1050:
	fbuge	%fcc2,	loop_1051
loop_1051:
	fmovrsgez	%i3,	%f15,	%f9
	sdivcc	%i5,	0x0EFD,	%o7
	stb	%l5,	[%l7 + 0x5C]
	brz	%g1,	loop_1052
loop_1052:
	nop
	setx loop_1053, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1053:
	brlz,a	%o4,	loop_1054
loop_1054:
	be	loop_1055
loop_1055:
	bleu	loop_1056
loop_1056:
	fmul8ulx16	%f0,	%f8,	%f12
	fblg	%fcc0,	loop_1057
loop_1057:
	brnz	%o1,	loop_1058
loop_1058:
	sth	%i6,	[%l7 + 0x42]
	fmovscc	%xcc,	%f4,	%f6
	fmovrslez	%g6,	%f7,	%f0
	brgz	%i0,	loop_1059
loop_1059:
	fmovrslz	%g4,	%f0,	%f14
	edge8n	%g5,	%l2,	%o5
	st	%f3,	[%l7 + 0x64]
	bleu,pt	%icc,	loop_1060
loop_1060:
	fbu,a	%fcc0,	loop_1061
loop_1061:
	array8	%l3,	%l1,	%o0
	fbo	%fcc1,	loop_1062
loop_1062:
	fmovse	%icc,	%f10,	%f3
	fble,a	%fcc3,	loop_1063
loop_1063:
	lduw	[%l7 + 0x3C],	%l6
	brgez,a	%l4,	loop_1064
loop_1064:
	fbo,a	%fcc1,	loop_1065
loop_1065:
	ldsb	[%l7 + 0x0A],	%o3
	tne	%xcc,	0x2
	ba	loop_1066
loop_1066:
	movg	%xcc,	%i1,	%i4
	bpos	loop_1067
loop_1067:
	edge32	%o2,	%g7,	%g3
	fble	%fcc3,	loop_1068
loop_1068:
	fbg	%fcc2,	loop_1069
loop_1069:
	ldsh	[%l7 + 0x18],	%o6
	bcc,a,pn	%icc,	loop_1070
loop_1070:
	xorcc	%g2,	%i2,	%l0
	fpmerge	%f8,	%f3,	%f8
	fbn,a	%fcc0,	loop_1071
loop_1071:
	nop
	setx loop_1072, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1072:
	brlz,a	%i7,	loop_1073
loop_1073:
	fblg	%fcc1,	loop_1074
loop_1074:
	fbue,a	%fcc2,	loop_1075
loop_1075:
	fmul8x16au	%f14,	%f6,	%f10
	fmovrdgz	%i3,	%f0,	%f0
	fpackfix	%f0,	%f11
	movge	%icc,	%i5,	%l5
	fbne	%fcc2,	loop_1076
loop_1076:
	brlz	%o7,	loop_1077
loop_1077:
	bge,pn	%xcc,	loop_1078
loop_1078:
	fbul	%fcc3,	loop_1079
loop_1079:
	nop
	setx loop_1080, %l0, %l1
	jmpl %l1, %o4
loop_1080:
	fbne	%fcc3,	loop_1081
loop_1081:
	fcmpeq32	%f10,	%f8,	%g1
	fand	%f4,	%f8,	%f2
	movge	%icc,	%i6,	%g6
	umul	%i0,	%g4,	%o1
	tg	%icc,	0x3
	fcmpgt32	%f2,	%f12,	%l2
	addccc	%o5,	0x12E3,	%g5
	brlez,a	%l3,	loop_1082
loop_1082:
	fnot1	%f10,	%f4
	bcs,a,pn	%icc,	loop_1083
loop_1083:
	bn,a	%xcc,	loop_1084
loop_1084:
	movrgz	%o0,	%l6,	%l4
	fmovsleu	%xcc,	%f7,	%f8
	tn	%icc,	0x5
	orncc	%o3,	%l1,	%i1
	fbul	%fcc3,	loop_1085
loop_1085:
	array16	%o2,	%g7,	%g3
	fnot2	%f8,	%f2
	fbne	%fcc1,	loop_1086
loop_1086:
	bleu,pn	%xcc,	loop_1087
loop_1087:
	bge,pn	%xcc,	loop_1088
loop_1088:
	fbul	%fcc1,	loop_1089
loop_1089:
	bvc	loop_1090
loop_1090:
	brlz	%o6,	loop_1091
loop_1091:
	siam	0x3
	fpsub16s	%f3,	%f11,	%f1
	bcc,pt	%icc,	loop_1092
loop_1092:
	brz	%i4,	loop_1093
loop_1093:
	nop
	setx loop_1094, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1094:
	fnor	%f12,	%f4,	%f2
	bl,a,pt	%icc,	loop_1095
loop_1095:
	brnz,a	%g2,	loop_1096
loop_1096:
	sth	%i2,	[%l7 + 0x4E]
	movrgez	%l0,	%i3,	%i7
	fpsub32	%f2,	%f0,	%f8
	movrgez	%l5,	0x0B1,	%i5
	ldub	[%l7 + 0x72],	%o4
	movgu	%icc,	%g1,	%i6
	fbg,a	%fcc0,	loop_1097
loop_1097:
	stx	%o7,	[%l7 + 0x38]
	fbne	%fcc0,	loop_1098
loop_1098:
	fpadd16	%f14,	%f14,	%f4
	and	%g6,	0x0A0A,	%g4
	fnot2s	%f5,	%f10
	ldsh	[%l7 + 0x18],	%i0
	bg,pt	%xcc,	loop_1099
loop_1099:
	bg,pt	%icc,	loop_1100
loop_1100:
	sdiv	%o1,	0x1C8A,	%l2
	fandnot2s	%f0,	%f14,	%f4
	xorcc	%o5,	%l3,	%o0
	bvs,a	loop_1101
loop_1101:
	tsubcctv	%g5,	%l4,	%o3
	nop
	setx loop_1102, %l0, %l1
	jmpl %l1, %l1
loop_1102:
	fmul8x16al	%f3,	%f10,	%f6
	ble	%icc,	loop_1103
loop_1103:
	fbul,a	%fcc0,	loop_1104
loop_1104:
	fbuge,a	%fcc2,	loop_1105
loop_1105:
	ldsw	[%l7 + 0x70],	%l6
	fcmpne32	%f10,	%f14,	%o2
	tcs	%xcc,	0x2
	bn,a	%xcc,	loop_1106
loop_1106:
	fble	%fcc3,	loop_1107
loop_1107:
	fbne	%fcc1,	loop_1108
loop_1108:
	bleu,pt	%icc,	loop_1109
loop_1109:
	nop
	setx loop_1110, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1110:
	stw	%g7,	[%l7 + 0x18]
	fba	%fcc0,	loop_1111
loop_1111:
	fmovrde	%i1,	%f2,	%f8
	bcc,a	%xcc,	loop_1112
loop_1112:
	call	loop_1113
loop_1113:
	bneg	loop_1114
loop_1114:
	be,a	loop_1115
loop_1115:
	sub	%o6,	%g3,	%i4
	fbue,a	%fcc1,	loop_1116
loop_1116:
	fmovrse	%g2,	%f14,	%f4
	fbn,a	%fcc2,	loop_1117
loop_1117:
	movvs	%icc,	%l0,	%i3
	bge,a	%icc,	loop_1118
loop_1118:
	fbo,a	%fcc0,	loop_1119
loop_1119:
	ldx	[%l7 + 0x50],	%i7
	brz,a	%l5,	loop_1120
loop_1120:
	std	%f12,	[%l7 + 0x78]
	fpadd16s	%f1,	%f4,	%f7
	lduh	[%l7 + 0x4E],	%i2
	be	%xcc,	loop_1121
loop_1121:
	stw	%i5,	[%l7 + 0x1C]
	bvs,a,pt	%xcc,	loop_1122
loop_1122:
	brnz	%g1,	loop_1123
loop_1123:
	brlz	%o4,	loop_1124
loop_1124:
	fbul,a	%fcc3,	loop_1125
loop_1125:
	brnz,a	%i6,	loop_1126
loop_1126:
	fbuge	%fcc3,	loop_1127
loop_1127:
	stb	%o7,	[%l7 + 0x6E]
	fmovsvc	%icc,	%f14,	%f1
	smulcc	%g6,	%i0,	%o1
	ba	%xcc,	loop_1128
loop_1128:
	for	%f6,	%f8,	%f0
	fbug	%fcc3,	loop_1129
loop_1129:
	mova	%xcc,	%l2,	%g4
	fmovdl	%xcc,	%f3,	%f4
	ldsw	[%l7 + 0x4C],	%o5
	fbn,a	%fcc1,	loop_1130
loop_1130:
	fbn,a	%fcc3,	loop_1131
loop_1131:
	ba,a	loop_1132
loop_1132:
	sllx	%o0,	0x17,	%l3
	fmovdvc	%icc,	%f0,	%f6
	addccc	%g5,	%l4,	%o3
	stw	%l6,	[%l7 + 0x68]
	bgu,a	loop_1133
loop_1133:
	fbne,a	%fcc0,	loop_1134
loop_1134:
	brgez,a	%l1,	loop_1135
loop_1135:
	st	%f2,	[%l7 + 0x6C]
	bvc	%xcc,	loop_1136
loop_1136:
	fornot2s	%f11,	%f5,	%f3
	fcmpgt16	%f14,	%f2,	%g7
	fpackfix	%f0,	%f0
	brnz,a	%i1,	loop_1137
loop_1137:
	bvc,a	%icc,	loop_1138
loop_1138:
	ldsw	[%l7 + 0x48],	%o6
	stw	%o2,	[%l7 + 0x48]
	bleu,pt	%icc,	loop_1139
loop_1139:
	fmovdneg	%xcc,	%f7,	%f3
	nop
	setx loop_1140, %l0, %l1
	jmpl %l1, %g3
loop_1140:
	fba,a	%fcc0,	loop_1141
loop_1141:
	taddcc	%g2,	%l0,	%i3
	brgz	%i7,	loop_1142
loop_1142:
	brgz	%l5,	loop_1143
loop_1143:
	fbue	%fcc1,	loop_1144
loop_1144:
	fnot1s	%f5,	%f3
	udiv	%i2,	0x124E,	%i4
	bneg,pn	%xcc,	loop_1145
loop_1145:
	nop
	setx loop_1146, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1146:
	fbg,a	%fcc2,	loop_1147
loop_1147:
	fcmpgt16	%f8,	%f14,	%g1
	fcmple16	%f6,	%f6,	%o4
	bcc	loop_1148
loop_1148:
	bcs	loop_1149
loop_1149:
	fmovspos	%icc,	%f4,	%f14
	brnz,a	%i6,	loop_1150
loop_1150:
	ble,a	loop_1151
loop_1151:
	bcs,a	loop_1152
loop_1152:
	fbule	%fcc2,	loop_1153
loop_1153:
	sth	%i5,	[%l7 + 0x58]
	fblg,a	%fcc0,	loop_1154
loop_1154:
	fbl	%fcc1,	loop_1155
loop_1155:
	fmovdn	%xcc,	%f4,	%f6
	brlz	%o7,	loop_1156
loop_1156:
	brgez,a	%i0,	loop_1157
loop_1157:
	ldub	[%l7 + 0x4F],	%g6
	fabss	%f9,	%f8
	brlez,a	%l2,	loop_1158
loop_1158:
	tl	%icc,	0x2
	bg,a,pn	%icc,	loop_1159
loop_1159:
	ld	[%l7 + 0x0C],	%f7
	fbuge	%fcc0,	loop_1160
loop_1160:
	brz,a	%g4,	loop_1161
loop_1161:
	faligndata	%f0,	%f4,	%f8
	udivx	%o1,	0x0C46,	%o5
	xnorcc	%o0,	%g5,	%l3
	call	loop_1162
loop_1162:
	brgz,a	%l4,	loop_1163
loop_1163:
	fbul,a	%fcc2,	loop_1164
loop_1164:
	nop
	setx loop_1165, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1165:
	ld	[%l7 + 0x38],	%f9
	fba	%fcc3,	loop_1166
loop_1166:
	movre	%o3,	%l6,	%g7
	fpsub16	%f8,	%f4,	%f2
	bleu,a	%xcc,	loop_1167
loop_1167:
	edge16n	%l1,	%i1,	%o2
	lduw	[%l7 + 0x40],	%o6
	fnot2	%f4,	%f4
	fmul8sux16	%f2,	%f4,	%f0
	bvs	%xcc,	loop_1168
loop_1168:
	udivx	%g3,	0x1A77,	%l0
	fbu	%fcc1,	loop_1169
loop_1169:
	bg,a	%icc,	loop_1170
loop_1170:
	fbul,a	%fcc2,	loop_1171
loop_1171:
	fbl,a	%fcc1,	loop_1172
loop_1172:
	fbge,a	%fcc2,	loop_1173
loop_1173:
	fnot1	%f10,	%f8
	fbuge,a	%fcc1,	loop_1174
loop_1174:
	fbge,a	%fcc3,	loop_1175
loop_1175:
	sth	%g2,	[%l7 + 0x7E]
	fandnot2	%f6,	%f12,	%f12
	bleu,pn	%xcc,	loop_1176
loop_1176:
	lduh	[%l7 + 0x72],	%i3
	stw	%l5,	[%l7 + 0x44]
	bcs,a,pn	%icc,	loop_1177
loop_1177:
	fbul,a	%fcc0,	loop_1178
loop_1178:
	fbul	%fcc0,	loop_1179
loop_1179:
	nop
	setx loop_1180, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1180:
	st	%f7,	[%l7 + 0x18]
	fbul	%fcc1,	loop_1181
loop_1181:
	bvs,pn	%icc,	loop_1182
loop_1182:
	fbule	%fcc0,	loop_1183
loop_1183:
	bn,a,pt	%icc,	loop_1184
loop_1184:
	nop
	setx loop_1185, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1185:
	bvs,pt	%xcc,	loop_1186
loop_1186:
	bg,a,pt	%icc,	loop_1187
loop_1187:
	fzeros	%f3
	bl,pn	%icc,	loop_1188
loop_1188:
	movneg	%icc,	%i2,	%i4
	fble	%fcc3,	loop_1189
loop_1189:
	mulx	%i7,	%o4,	%g1
	orcc	%i5,	%i6,	%o7
	edge32l	%g6,	%i0,	%g4
	ldd	[%l7 + 0x60],	%f10
	bl,a,pt	%xcc,	loop_1190
loop_1190:
	bcc	loop_1191
loop_1191:
	fnot1s	%f15,	%f9
	fand	%f4,	%f8,	%f4
	tvs	%xcc,	0x1
	ba,a	%xcc,	loop_1192
loop_1192:
	ldsb	[%l7 + 0x2D],	%l2
	fbug	%fcc0,	loop_1193
loop_1193:
	ldub	[%l7 + 0x62],	%o5
	xnorcc	%o0,	0x1F7F,	%o1
	fble,a	%fcc2,	loop_1194
loop_1194:
	sdivcc	%l3,	0x038A,	%l4
	fmovsvc	%xcc,	%f3,	%f5
	fbg	%fcc1,	loop_1195
loop_1195:
	ba	loop_1196
loop_1196:
	bge,pn	%xcc,	loop_1197
loop_1197:
	fmovrde	%g5,	%f14,	%f14
	fxnor	%f8,	%f12,	%f10
	fmovscs	%icc,	%f12,	%f5
	ld	[%l7 + 0x78],	%f1
	brgz,a	%l6,	loop_1198
loop_1198:
	fcmple32	%f0,	%f4,	%g7
	bne,pn	%icc,	loop_1199
loop_1199:
	ldx	[%l7 + 0x50],	%o3
	sth	%l1,	[%l7 + 0x34]
	movre	%o2,	%o6,	%g3
	fbul,a	%fcc2,	loop_1200
loop_1200:
	fbne	%fcc1,	loop_1201
loop_1201:
	bneg,a,pt	%xcc,	loop_1202
loop_1202:
	brgz,a	%l0,	loop_1203
loop_1203:
	fmovsg	%xcc,	%f14,	%f11
	fzeros	%f13
	fmovsgu	%icc,	%f13,	%f2
	edge32	%g2,	%i3,	%l5
	fmovs	%f7,	%f11
	bgu,a	%icc,	loop_1204
loop_1204:
	tg	%icc,	0x2
	fbg,a	%fcc2,	loop_1205
loop_1205:
	bcc	loop_1206
loop_1206:
	orncc	%i2,	%i1,	%i7
	fbo,a	%fcc0,	loop_1207
loop_1207:
	fsrc1s	%f6,	%f4
	lduh	[%l7 + 0x4C],	%o4
	brlez	%g1,	loop_1208
loop_1208:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type f   	: 178
!	Type i   	: 197
!	Type cti   	: 504
!	Type l   	: 121
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
main_t5:

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0x2,	%g2
	set	0xE,	%g3
	set	0xA,	%g4
	set	0x5,	%g5
	set	0x3,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0xE,	%i3
	set	-0x0,	%i4
	set	-0xD,	%i5
	set	-0x5,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x5D5BE1B3,	%l0
	set	0x2C0D23F2,	%l1
	set	0x1E82DAE1,	%l2
	set	0x73BB95B7,	%l3
	set	0x3C34174A,	%l4
	set	0x4AE1EF36,	%l5
	set	0x53921908,	%l6
	!# Output registers
	set	-0x155F,	%o0
	set	-0x0D11,	%o1
	set	-0x1D68,	%o2
	set	0x1DA4,	%o3
	set	-0x1A24,	%o4
	set	0x108B,	%o5
	set	0x1ED3,	%o6
	set	0x0A40,	%o7

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

	brz	%i5,	loop_1209
loop_1209:
	ldd	[%l7 + 0x68],	%f4
	movvs	%xcc,	%i4,	%o7
	std	%f0,	[%l7 + 0x68]
	movge	%icc,	%i6,	%g6
	fmovdpos	%xcc,	%f7,	%f14
	fmul8ulx16	%f0,	%f8,	%f14
	movleu	%xcc,	%g4,	%i0
	fble	%fcc2,	loop_1210
loop_1210:
	fmul8x16au	%f8,	%f13,	%f4
	st	%f7,	[%l7 + 0x4C]
	ldd	[%l7 + 0x30],	%f0
	umul	%l2,	%o5,	%o1
	addcc	%o0,	0x1D23,	%l4
	tsubcctv	%g5,	0x1ADE,	%l6
	fmovse	%icc,	%f10,	%f1
	fands	%f6,	%f14,	%f8
	fmovrde	%g7,	%f8,	%f4
	tg	%xcc,	0x5
	fandnot2	%f10,	%f14,	%f2
	tn	%xcc,	0x3
	fbge	%fcc1,	loop_1211
loop_1211:
	fble,a	%fcc2,	loop_1212
loop_1212:
	movge	%xcc,	%o3,	%l1
	movrgez	%l3,	%o6,	%g3
	ta	%xcc,	0x0
	andcc	%l0,	%o2,	%i3
	bvs	%xcc,	loop_1213
loop_1213:
	tneg	%icc,	0x5
	xor	%g2,	0x0578,	%i2
	fmovrde	%i1,	%f2,	%f14
	movrne	%i7,	0x36C,	%l5
	tsubcctv	%o4,	%i5,	%i4
	movne	%xcc,	%o7,	%i6
	ba,a,pt	%icc,	loop_1214
loop_1214:
	andcc	%g1,	%g6,	%g4
	fmovdgu	%xcc,	%f7,	%f8
	tcs	%xcc,	0x4
	call	loop_1215
loop_1215:
	andcc	%i0,	%o5,	%l2
	tle	%icc,	0x3
	orncc	%o0,	%l4,	%g5
	fcmpes	%fcc3,	%f1,	%f14
	stw	%l6,	[%l7 + 0x28]
	fcmps	%fcc2,	%f7,	%f14
	sll	%g7,	%o1,	%o3
	addc	%l3,	0x186F,	%o6
	te	%icc,	0x0
	fmovrdlz	%g3,	%f6,	%f10
	popc	%l0,	%o2
	udivx	%i3,	0x0513,	%g2
	fcmpeq32	%f10,	%f6,	%i2
	stw	%l1,	[%l7 + 0x3C]
	fmovsvc	%icc,	%f15,	%f0
	ble,pt	%xcc,	loop_1216
loop_1216:
	movrlz	%i1,	0x04F,	%l5
	xor	%o4,	%i5,	%i4
	fmovse	%xcc,	%f10,	%f4
	srl	%i7,	0x0B,	%o7
	or	%g1,	%g6,	%i6
	movneg	%icc,	%g4,	%o5
	add	%i0,	0x17AE,	%o0
	fnot1	%f8,	%f8
	lduh	[%l7 + 0x58],	%l4
	fbue	%fcc1,	loop_1217
loop_1217:
	edge16n	%g5,	%l6,	%g7
	movneg	%icc,	%l2,	%o1
	fmovrde	%o3,	%f2,	%f12
	tge	%icc,	0x1
	fmovrdlez	%l3,	%f14,	%f4
	sub	%o6,	0x0528,	%g3
	srlx	%o2,	%l0,	%g2
	siam	0x2
	addccc	%i3,	0x0F18,	%i2
	addc	%i1,	0x0B5E,	%l1
	tpos	%icc,	0x5
	movgu	%icc,	%o4,	%l5
	udivx	%i4,	0x133A,	%i5
	fbo,a	%fcc1,	loop_1218
loop_1218:
	fmovrsgz	%o7,	%f0,	%f12
	tsubcctv	%g1,	%i7,	%i6
	and	%g4,	%g6,	%i0
	fmovsge	%icc,	%f15,	%f1
	subcc	%o5,	%l4,	%o0
	tg	%icc,	0x5
	ldsh	[%l7 + 0x68],	%l6
	alignaddr	%g7,	%g5,	%o1
	fnegs	%f8,	%f10
	ta	%xcc,	0x4
	fpsub32s	%f11,	%f7,	%f14
	nop
	setx loop_1219, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1219:
	fmul8sux16	%f8,	%f14,	%f10
	addccc	%o3,	0x11B5,	%l2
	sth	%l3,	[%l7 + 0x2E]
	movneg	%xcc,	%g3,	%o2
	alignaddr	%o6,	%g2,	%i3
	fmul8ulx16	%f2,	%f8,	%f2
	edge8l	%i2,	%i1,	%l0
	movrne	%o4,	0x337,	%l1
	tcs	%xcc,	0x4
	addc	%l5,	0x0453,	%i4
	array8	%o7,	%i5,	%g1
	sllx	%i6,	0x0E,	%g4
	alignaddrl	%g6,	%i7,	%i0
	be,a,pt	%xcc,	loop_1220
loop_1220:
	ld	[%l7 + 0x50],	%f0
	brnz,a	%l4,	loop_1221
loop_1221:
	sllx	%o5,	0x11,	%l6
	movleu	%icc,	%g7,	%o0
	fbe,a	%fcc3,	loop_1222
loop_1222:
	subcc	%o1,	0x1B70,	%o3
	and	%l2,	%g5,	%g3
	andncc	%l3,	%o2,	%g2
	tsubcctv	%o6,	%i3,	%i2
	fbl,a	%fcc2,	loop_1223
loop_1223:
	sra	%l0,	%o4,	%l1
	edge8ln	%i1,	%i4,	%l5
	ldsh	[%l7 + 0x76],	%o7
	sllx	%g1,	%i6,	%i5
	fmovse	%icc,	%f13,	%f11
	std	%f4,	[%l7 + 0x20]
	fcmple32	%f0,	%f14,	%g6
	fbg,a	%fcc1,	loop_1224
loop_1224:
	edge16	%g4,	%i7,	%l4
	fmovdgu	%xcc,	%f1,	%f14
	stb	%i0,	[%l7 + 0x17]
	fmovsvc	%xcc,	%f3,	%f0
	stw	%o5,	[%l7 + 0x74]
	fbul,a	%fcc0,	loop_1225
loop_1225:
	or	%g7,	0x1E89,	%l6
	add	%o1,	0x0AFF,	%o3
	subc	%l2,	0x1E8E,	%o0
	ld	[%l7 + 0x48],	%f13
	te	%icc,	0x5
	edge8n	%g5,	%g3,	%o2
	tsubcc	%l3,	0x0C7B,	%o6
	fnegd	%f0,	%f14
	mova	%xcc,	%g2,	%i2
	tl	%xcc,	0x0
	srlx	%i3,	0x1E,	%o4
	edge16n	%l0,	%l1,	%i1
	andcc	%i4,	0x15BB,	%o7
	srax	%l5,	%i6,	%g1
	tcc	%icc,	0x2
	ldub	[%l7 + 0x2F],	%i5
	ldx	[%l7 + 0x28],	%g6
	orcc	%g4,	%l4,	%i0
	fmovsvc	%icc,	%f15,	%f14
	fbl	%fcc1,	loop_1226
loop_1226:
	alignaddr	%i7,	%o5,	%l6
	umul	%g7,	%o1,	%o3
	fmovdg	%icc,	%f15,	%f2
	edge8l	%o0,	%g5,	%g3
	movge	%icc,	%l2,	%l3
	fmovrdgez	%o6,	%f0,	%f14
	movre	%g2,	0x325,	%o2
	srl	%i3,	0x1B,	%i2
	st	%f7,	[%l7 + 0x0C]
	movl	%xcc,	%l0,	%l1
	stw	%o4,	[%l7 + 0x18]
	sethi	0x0044,	%i4
	stb	%o7,	[%l7 + 0x64]
	ldsw	[%l7 + 0x30],	%i1
	movrlez	%i6,	0x053,	%l5
	lduw	[%l7 + 0x5C],	%g1
	fblg,a	%fcc2,	loop_1227
loop_1227:
	fbg,a	%fcc2,	loop_1228
loop_1228:
	umul	%i5,	%g6,	%l4
	andcc	%g4,	%i0,	%i7
	edge16l	%o5,	%g7,	%o1
	array32	%l6,	%o3,	%g5
	fxors	%f1,	%f8,	%f8
	tsubcc	%g3,	%o0,	%l3
	movpos	%xcc,	%o6,	%l2
	brgez	%g2,	loop_1229
loop_1229:
	bleu,a,pn	%icc,	loop_1230
loop_1230:
	ldub	[%l7 + 0x36],	%i3
	edge8n	%i2,	%o2,	%l1
	edge32l	%o4,	%l0,	%o7
	fbuge,a	%fcc3,	loop_1231
loop_1231:
	lduw	[%l7 + 0x10],	%i4
	fornot2	%f0,	%f6,	%f2
	subcc	%i1,	%i6,	%l5
	edge8	%g1,	%g6,	%l4
	movpos	%icc,	%g4,	%i5
	andn	%i0,	%i7,	%g7
	udiv	%o5,	0x041B,	%l6
	bne	loop_1232
loop_1232:
	movn	%icc,	%o1,	%g5
	fxors	%f8,	%f11,	%f13
	movleu	%icc,	%o3,	%g3
	bvc,pn	%xcc,	loop_1233
loop_1233:
	bne	loop_1234
loop_1234:
	fmuld8ulx16	%f10,	%f9,	%f4
	movpos	%xcc,	%o0,	%l3
	andncc	%o6,	%g2,	%l2
	fmovsg	%icc,	%f1,	%f12
	stx	%i2,	[%l7 + 0x68]
	array32	%o2,	%l1,	%i3
	fmovsvc	%xcc,	%f12,	%f8
	smulcc	%o4,	0x1CC1,	%o7
	smulcc	%l0,	0x0354,	%i4
	stb	%i1,	[%l7 + 0x6C]
	edge32	%l5,	%i6,	%g1
	fmovdne	%icc,	%f7,	%f11
	brlz,a	%l4,	loop_1235
loop_1235:
	ldsw	[%l7 + 0x70],	%g6
	edge8ln	%g4,	%i5,	%i7
	umul	%g7,	0x0522,	%o5
	tsubcctv	%l6,	%i0,	%o1
	ldsw	[%l7 + 0x40],	%o3
	fandnot1s	%f8,	%f9,	%f4
	array16	%g5,	%g3,	%o0
	st	%f11,	[%l7 + 0x58]
	tleu	%xcc,	0x7
	movge	%xcc,	%o6,	%g2
	fmovdpos	%icc,	%f3,	%f14
	tsubcctv	%l2,	0x108A,	%l3
	fxnors	%f4,	%f4,	%f1
	fba	%fcc0,	loop_1236
loop_1236:
	ldsb	[%l7 + 0x0A],	%o2
	fmovspos	%icc,	%f6,	%f6
	umul	%i2,	0x095C,	%l1
	bleu,a	loop_1237
loop_1237:
	move	%icc,	%o4,	%o7
	te	%icc,	0x2
	fmovdcs	%xcc,	%f7,	%f14
	nop
	setx loop_1238, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1238:
	movcc	%xcc,	%l0,	%i3
	fornot1	%f6,	%f12,	%f0
	srlx	%i4,	0x1D,	%l5
	movpos	%icc,	%i6,	%g1
	fcmpgt32	%f8,	%f2,	%i1
	lduw	[%l7 + 0x24],	%g6
	sra	%g4,	0x07,	%i5
	stx	%i7,	[%l7 + 0x30]
	fmovrdlz	%l4,	%f6,	%f10
	nop
	setx loop_1239, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1239:
	sll	%o5,	0x16,	%l6
	fmovsge	%icc,	%f11,	%f14
	fpadd32s	%f7,	%f6,	%f11
	movne	%icc,	%g7,	%i0
	udiv	%o3,	0x0AFD,	%o1
	fcmpne32	%f14,	%f10,	%g3
	edge16n	%o0,	%g5,	%g2
	edge16n	%o6,	%l2,	%l3
	edge32	%o2,	%i2,	%o4
	taddcctv	%o7,	%l1,	%i3
	lduw	[%l7 + 0x7C],	%l0
	brlez,a	%i4,	loop_1240
loop_1240:
	fmovsvc	%icc,	%f1,	%f15
	tgu	%xcc,	0x3
	movle	%xcc,	%i6,	%l5
	tcc	%xcc,	0x3
	tneg	%icc,	0x0
	tge	%xcc,	0x4
	andncc	%g1,	%i1,	%g4
	array16	%i5,	%g6,	%l4
	st	%f6,	[%l7 + 0x34]
	umul	%i7,	0x113B,	%o5
	andn	%l6,	0x05C3,	%i0
	sethi	0x15FD,	%g7
	fmovsge	%icc,	%f12,	%f3
	addcc	%o1,	0x0F0A,	%g3
	fmovsa	%xcc,	%f7,	%f1
	brgz,a	%o0,	loop_1241
loop_1241:
	fpsub32	%f0,	%f0,	%f10
	movleu	%icc,	%o3,	%g2
	stb	%o6,	[%l7 + 0x36]
	movrlz	%l2,	0x0B7,	%l3
	taddcc	%g5,	0x0746,	%o2
	fandnot2	%f4,	%f14,	%f0
	fmovrslez	%o4,	%f3,	%f3
	ldd	[%l7 + 0x30],	%f10
	fmovdle	%xcc,	%f7,	%f9
	fnegs	%f0,	%f12
	fands	%f0,	%f1,	%f7
	movle	%xcc,	%o7,	%i2
	ldsh	[%l7 + 0x10],	%l1
	brnz	%l0,	loop_1242
loop_1242:
	tvs	%icc,	0x7
	udivcc	%i3,	0x007E,	%i6
	addcc	%l5,	%g1,	%i1
	udiv	%g4,	0x1054,	%i5
	alignaddr	%i4,	%g6,	%l4
	fmovdg	%icc,	%f15,	%f11
	ldx	[%l7 + 0x58],	%o5
	stb	%i7,	[%l7 + 0x32]
	bcc,a,pt	%xcc,	loop_1243
loop_1243:
	nop
	setx loop_1244, %l0, %l1
	jmpl %l1, %l6
loop_1244:
	fxnors	%f4,	%f7,	%f3
	fmovsgu	%xcc,	%f6,	%f5
	movgu	%xcc,	%g7,	%i0
	srax	%g3,	0x16,	%o1
	movgu	%xcc,	%o0,	%o3
	orncc	%g2,	%o6,	%l2
	siam	0x1
	sdivcc	%g5,	0x1BFA,	%l3
	fbge	%fcc2,	loop_1245
loop_1245:
	movcc	%icc,	%o2,	%o7
	fmovsvc	%xcc,	%f4,	%f14
	edge8n	%o4,	%l1,	%i2
	movcc	%xcc,	%i3,	%l0
	tvc	%icc,	0x7
	fmovdcs	%icc,	%f13,	%f10
	stw	%l5,	[%l7 + 0x40]
	bleu,a	loop_1246
loop_1246:
	movre	%g1,	%i1,	%i6
	fnand	%f6,	%f2,	%f2
	tleu	%xcc,	0x1
	popc	%i5,	%i4
	bg,pt	%icc,	loop_1247
loop_1247:
	movleu	%xcc,	%g4,	%g6
	std	%f10,	[%l7 + 0x38]
	bpos	loop_1248
loop_1248:
	stb	%o5,	[%l7 + 0x3E]
	call	loop_1249
loop_1249:
	bge,a	loop_1250
loop_1250:
	movl	%icc,	%l4,	%i7
	tcs	%icc,	0x6
	tvs	%xcc,	0x1
	fmovdl	%xcc,	%f10,	%f13
	edge32	%g7,	%l6,	%i0
	orcc	%o1,	%g3,	%o3
	fnot2s	%f7,	%f2
	ldx	[%l7 + 0x70],	%g2
	array16	%o6,	%l2,	%g5
	fcmpne32	%f12,	%f4,	%o0
	brgez	%l3,	loop_1251
loop_1251:
	brlz	%o2,	loop_1252
loop_1252:
	andncc	%o7,	%o4,	%i2
	srl	%i3,	0x14,	%l1
	movrgez	%l5,	0x2F4,	%l0
	fmovscs	%xcc,	%f13,	%f15
	movrgz	%i1,	0x123,	%i6
	edge8	%g1,	%i4,	%i5
	orncc	%g6,	%g4,	%o5
	alignaddrl	%i7,	%g7,	%l6
	fxors	%f2,	%f8,	%f11
	tsubcc	%l4,	0x0CB7,	%o1
	movne	%xcc,	%i0,	%o3
	fmul8x16au	%f11,	%f1,	%f14
	movcs	%icc,	%g3,	%g2
	fmovd	%f8,	%f14
	addcc	%l2,	0x0A45,	%g5
	movrgez	%o6,	%o0,	%o2
	tge	%icc,	0x3
	fornot2s	%f7,	%f3,	%f14
	nop
	setx loop_1253, %l0, %l1
	jmpl %l1, %o7
loop_1253:
	brz	%l3,	loop_1254
loop_1254:
	movg	%icc,	%o4,	%i2
	array8	%i3,	%l1,	%l5
	sdivx	%i1,	0x0A62,	%i6
	orncc	%l0,	0x1631,	%i4
	ldsh	[%l7 + 0x44],	%g1
	fmul8ulx16	%f10,	%f6,	%f12
	tcs	%icc,	0x7
	fmovscs	%xcc,	%f10,	%f6
	movpos	%icc,	%g6,	%i5
	fmovdpos	%icc,	%f7,	%f6
	movrgez	%g4,	%o5,	%i7
	lduw	[%l7 + 0x70],	%g7
	fmovsleu	%xcc,	%f7,	%f11
	fbg,a	%fcc2,	loop_1255
loop_1255:
	fand	%f14,	%f6,	%f0
	sllx	%l6,	%o1,	%l4
	sll	%i0,	0x1A,	%o3
	srl	%g3,	0x06,	%g2
	bleu,a	loop_1256
loop_1256:
	fmovda	%icc,	%f8,	%f3
	smulcc	%g5,	0x063A,	%l2
	orn	%o0,	%o2,	%o6
	ldd	[%l7 + 0x60],	%f10
	xnor	%l3,	%o7,	%o4
	smul	%i2,	0x07CE,	%i3
	orcc	%l5,	0x033D,	%i1
	brnz,a	%l1,	loop_1257
loop_1257:
	movne	%icc,	%i6,	%i4
	fornot2	%f2,	%f12,	%f14
	ta	%xcc,	0x4
	movne	%icc,	%l0,	%g1
	fbul,a	%fcc3,	loop_1258
loop_1258:
	udivcc	%g6,	0x16EC,	%g4
	subccc	%i5,	0x1015,	%o5
	brgz	%i7,	loop_1259
loop_1259:
	lduh	[%l7 + 0x70],	%l6
	udiv	%o1,	0x14E9,	%l4
	sth	%i0,	[%l7 + 0x42]
	edge8l	%o3,	%g7,	%g2
	smul	%g5,	0x1C35,	%g3
	tgu	%xcc,	0x1
	brlez,a	%l2,	loop_1260
loop_1260:
	fandnot2	%f6,	%f14,	%f8
	fble	%fcc3,	loop_1261
loop_1261:
	orncc	%o2,	%o6,	%o0
	nop
	setx loop_1262, %l0, %l1
	jmpl %l1, %o7
loop_1262:
	fbu,a	%fcc2,	loop_1263
loop_1263:
	fmovdpos	%icc,	%f9,	%f11
	taddcctv	%o4,	0x1143,	%i2
	brgz,a	%i3,	loop_1264
loop_1264:
	fzero	%f10
	movre	%l5,	0x2B4,	%l3
	fandnot2s	%f11,	%f15,	%f3
	brnz	%i1,	loop_1265
loop_1265:
	movleu	%xcc,	%l1,	%i4
	fbge	%fcc2,	loop_1266
loop_1266:
	tleu	%icc,	0x7
	fornot1	%f14,	%f0,	%f8
	srlx	%l0,	0x03,	%i6
	fsrc2	%f8,	%f8
	movrlz	%g6,	%g4,	%i5
	movle	%xcc,	%g1,	%i7
	subcc	%l6,	%o1,	%o5
	ldsh	[%l7 + 0x10],	%l4
	sethi	0x103C,	%o3
	bn	%icc,	loop_1267
loop_1267:
	tle	%xcc,	0x3
	st	%f12,	[%l7 + 0x58]
	edge32ln	%g7,	%i0,	%g2
	fmovsa	%xcc,	%f8,	%f0
	edge32ln	%g3,	%g5,	%l2
	fmul8sux16	%f6,	%f0,	%f6
	tcs	%icc,	0x7
	ldx	[%l7 + 0x68],	%o2
	brlz	%o6,	loop_1268
loop_1268:
	edge32l	%o7,	%o0,	%i2
	tsubcctv	%i3,	%l5,	%o4
	fmovrsne	%i1,	%f14,	%f13
	movre	%l3,	0x03B,	%l1
	fbule,a	%fcc3,	loop_1269
loop_1269:
	fbule	%fcc2,	loop_1270
loop_1270:
	movle	%icc,	%i4,	%i6
	edge16l	%l0,	%g4,	%g6
	fmovrdgz	%g1,	%f10,	%f0
	edge16n	%i7,	%l6,	%i5
	fsrc1s	%f8,	%f6
	fmovda	%xcc,	%f13,	%f8
	tl	%icc,	0x3
	sth	%o1,	[%l7 + 0x12]
	ba,pn	%xcc,	loop_1271
loop_1271:
	fmovda	%icc,	%f11,	%f15
	array16	%l4,	%o5,	%g7
	movrgz	%o3,	%g2,	%g3
	movvs	%icc,	%i0,	%g5
	orn	%o2,	%l2,	%o7
	fcmpeq16	%f0,	%f10,	%o6
	sllx	%o0,	%i2,	%l5
	sdiv	%i3,	0x1078,	%i1
	bpos	%icc,	loop_1272
loop_1272:
	popc	0x17F4,	%l3
	sth	%l1,	[%l7 + 0x1E]
	st	%f8,	[%l7 + 0x50]
	faligndata	%f10,	%f0,	%f12
	array32	%o4,	%i4,	%i6
	movrlz	%g4,	0x129,	%l0
	tvs	%xcc,	0x2
	fmovspos	%xcc,	%f0,	%f2
	fmovrdlz	%g6,	%f2,	%f14
	alignaddr	%i7,	%l6,	%g1
	taddcc	%o1,	%i5,	%o5
	andcc	%l4,	0x056A,	%o3
	fmovrdne	%g2,	%f0,	%f14
	movn	%xcc,	%g3,	%i0
	movge	%icc,	%g7,	%g5
	edge8l	%l2,	%o7,	%o2
	alignaddrl	%o0,	%i2,	%o6
	movrne	%i3,	%l5,	%i1
	fmovdpos	%icc,	%f10,	%f1
	movneg	%icc,	%l3,	%o4
	st	%f3,	[%l7 + 0x10]
	mulscc	%l1,	0x18C0,	%i6
	ld	[%l7 + 0x68],	%f14
	movn	%xcc,	%g4,	%l0
	movcs	%xcc,	%i4,	%i7
	xnorcc	%l6,	%g1,	%o1
	fmovsleu	%icc,	%f2,	%f15
	fexpand	%f8,	%f0
	add	%i5,	0x108D,	%g6
	sth	%o5,	[%l7 + 0x68]
	udivcc	%o3,	0x1D85,	%l4
	edge8n	%g3,	%i0,	%g2
	edge16l	%g5,	%g7,	%o7
	smulcc	%l2,	0x1A01,	%o0
	edge32ln	%i2,	%o2,	%i3
	fandnot1s	%f7,	%f14,	%f10
	srlx	%l5,	%o6,	%l3
	mulx	%o4,	%i1,	%i6
	edge32l	%g4,	%l1,	%l0
	for	%f0,	%f12,	%f2
	fbule	%fcc3,	loop_1273
loop_1273:
	be,a,pn	%icc,	loop_1274
loop_1274:
	edge16ln	%i4,	%l6,	%g1
	te	%xcc,	0x3
	tgu	%xcc,	0x5
	movrlz	%i7,	%i5,	%o1
	movg	%icc,	%o5,	%o3
	subccc	%l4,	%g3,	%g6
	array16	%i0,	%g2,	%g7
	mulscc	%o7,	0x119E,	%g5
	movn	%icc,	%l2,	%o0
	sdivx	%i2,	0x1BD8,	%o2
	edge8ln	%l5,	%o6,	%i3
	movrne	%l3,	0x35F,	%o4
	tsubcctv	%i6,	0x1A99,	%i1
	fmovspos	%xcc,	%f9,	%f15
	fabss	%f11,	%f12
	fcmple32	%f0,	%f2,	%l1
	alignaddrl	%l0,	%g4,	%i4
	smulcc	%l6,	0x0728,	%i7
	st	%f7,	[%l7 + 0x64]
	array8	%g1,	%i5,	%o1
	fmovsl	%icc,	%f8,	%f1
	fmul8x16au	%f0,	%f2,	%f2
	andncc	%o5,	%l4,	%o3
	std	%f0,	[%l7 + 0x50]
	umulcc	%g6,	%g3,	%i0
	movle	%xcc,	%g7,	%o7
	nop
	setx loop_1275, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1275:
	orncc	%g5,	%l2,	%o0
	std	%f10,	[%l7 + 0x20]
	movcc	%icc,	%i2,	%g2
	bvs,a,pt	%xcc,	loop_1276
loop_1276:
	std	%f8,	[%l7 + 0x40]
	or	%o2,	%o6,	%i3
	udivcc	%l5,	0x0C95,	%o4
	array16	%i6,	%l3,	%i1
	movleu	%xcc,	%l0,	%l1
	movrgez	%g4,	%l6,	%i4
	edge32	%g1,	%i7,	%i5
	te	%xcc,	0x0
	andcc	%o5,	%l4,	%o1
	nop
	setx loop_1277, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1277:
	fbule,a	%fcc2,	loop_1278
loop_1278:
	fnors	%f12,	%f1,	%f13
	fmovsn	%xcc,	%f11,	%f7
	ldsh	[%l7 + 0x2A],	%g6
	fone	%f0
	popc	%o3,	%i0
	std	%f2,	[%l7 + 0x70]
	and	%g7,	0x0321,	%g3
	fnands	%f4,	%f2,	%f13
	orcc	%o7,	%g5,	%l2
	stx	%o0,	[%l7 + 0x70]
	ld	[%l7 + 0x20],	%f2
	edge32n	%i2,	%o2,	%g2
	fbg,a	%fcc2,	loop_1279
loop_1279:
	fbl	%fcc1,	loop_1280
loop_1280:
	alignaddrl	%o6,	%l5,	%i3
	fbl	%fcc3,	loop_1281
loop_1281:
	srax	%o4,	0x05,	%i6
	tpos	%icc,	0x6
	bg,pt	%xcc,	loop_1282
loop_1282:
	edge8	%l3,	%l0,	%i1
	movle	%xcc,	%l1,	%g4
	add	%i4,	0x0023,	%l6
	tge	%xcc,	0x7
	bvs,a	loop_1283
loop_1283:
	smul	%g1,	0x031B,	%i5
	fzero	%f6
	edge16l	%i7,	%o5,	%l4
	tl	%xcc,	0x3
	xnor	%g6,	0x01DA,	%o3
	fmuld8ulx16	%f4,	%f6,	%f0
	ldx	[%l7 + 0x70],	%o1
	alignaddrl	%g7,	%g3,	%o7
	fornot2	%f8,	%f6,	%f8
	edge32ln	%i0,	%g5,	%l2
	tge	%icc,	0x7
	fcmple16	%f8,	%f0,	%i2
	fmovdvs	%xcc,	%f10,	%f6
	fbe	%fcc3,	loop_1284
loop_1284:
	std	%f6,	[%l7 + 0x38]
	fbn,a	%fcc1,	loop_1285
loop_1285:
	sdivcc	%o2,	0x089A,	%o0
	brlez	%o6,	loop_1286
loop_1286:
	taddcctv	%l5,	%g2,	%i3
	edge8ln	%i6,	%l3,	%o4
	edge32ln	%l0,	%l1,	%i1
	fmovspos	%icc,	%f9,	%f3
	sth	%g4,	[%l7 + 0x4C]
	fands	%f6,	%f0,	%f13
	fexpand	%f10,	%f8
	fmovrsne	%i4,	%f10,	%f12
	ldd	[%l7 + 0x68],	%f6
	movg	%icc,	%g1,	%l6
	brlez	%i7,	loop_1287
loop_1287:
	stb	%o5,	[%l7 + 0x7F]
	sll	%l4,	0x11,	%g6
	tg	%icc,	0x4
	movcs	%icc,	%i5,	%o3
	call	loop_1288
loop_1288:
	fmovrdgez	%g7,	%f4,	%f10
	movrlz	%g3,	0x1F8,	%o1
	fcmpeq16	%f2,	%f4,	%i0
	add	%g5,	0x04D0,	%l2
	movl	%xcc,	%i2,	%o2
	ldsw	[%l7 + 0x34],	%o0
	orn	%o7,	%o6,	%l5
	umulcc	%i3,	%i6,	%g2
	fmovd	%f4,	%f14
	fcmped	%fcc2,	%f4,	%f8
	edge8	%l3,	%l0,	%l1
	fpackfix	%f6,	%f6
	fmul8sux16	%f8,	%f0,	%f4
	srax	%o4,	0x11,	%g4
	ldsh	[%l7 + 0x76],	%i4
	tge	%xcc,	0x2
	st	%f13,	[%l7 + 0x48]
	fba,a	%fcc3,	loop_1289
loop_1289:
	udivx	%i1,	0x1CDF,	%l6
	tn	%icc,	0x7
	movle	%xcc,	%i7,	%o5
	fcmpgt16	%f2,	%f12,	%g1
	fmovs	%f10,	%f8
	ldsb	[%l7 + 0x17],	%g6
	movge	%xcc,	%i5,	%o3
	movrne	%g7,	%g3,	%l4
	subc	%i0,	%o1,	%l2
	stw	%i2,	[%l7 + 0x08]
	movrgez	%o2,	0x1E1,	%g5
	fble	%fcc2,	loop_1290
loop_1290:
	movgu	%icc,	%o0,	%o7
	ldub	[%l7 + 0x4D],	%o6
	movre	%l5,	0x1B4,	%i6
	and	%i3,	0x062A,	%l3
	brnz	%l0,	loop_1291
loop_1291:
	tsubcc	%g2,	0x0E10,	%l1
	edge8n	%g4,	%i4,	%o4
	bvc,a,pn	%icc,	loop_1292
loop_1292:
	movcs	%icc,	%l6,	%i7
	addccc	%o5,	0x0702,	%i1
	ldd	[%l7 + 0x48],	%f0
	edge16	%g1,	%i5,	%o3
	fmovsne	%xcc,	%f10,	%f0
	fcmpgt32	%f10,	%f12,	%g6
	andncc	%g3,	%l4,	%i0
	brz	%o1,	loop_1293
loop_1293:
	movn	%icc,	%l2,	%i2
	fmovscs	%xcc,	%f14,	%f7
	ldd	[%l7 + 0x48],	%f2
	tl	%xcc,	0x0
	sdivcc	%o2,	0x0486,	%g5
	udivcc	%o0,	0x180E,	%o7
	movg	%xcc,	%g7,	%o6
	tsubcc	%i6,	%i3,	%l3
	movcs	%icc,	%l0,	%g2
	tcc	%xcc,	0x4
	fbuge	%fcc0,	loop_1294
loop_1294:
	edge16l	%l5,	%l1,	%g4
	sllx	%o4,	%i4,	%l6
	edge32n	%i7,	%i1,	%o5
	fblg	%fcc1,	loop_1295
loop_1295:
	fmovsvs	%xcc,	%f1,	%f4
	tge	%icc,	0x0
	movgu	%xcc,	%i5,	%g1
	st	%f4,	[%l7 + 0x30]
	fmovrsgez	%g6,	%f6,	%f10
	fbug,a	%fcc3,	loop_1296
loop_1296:
	fpsub32s	%f7,	%f8,	%f6
	movleu	%xcc,	%g3,	%l4
	andcc	%i0,	%o3,	%o1
	umul	%l2,	%o2,	%i2
	movn	%icc,	%g5,	%o0
	edge32ln	%o7,	%g7,	%o6
	edge32	%i3,	%l3,	%i6
	fmovrse	%l0,	%f10,	%f4
	movn	%xcc,	%l5,	%g2
	fmovdge	%icc,	%f4,	%f12
	andncc	%l1,	%g4,	%i4
	fmovsle	%icc,	%f3,	%f7
	ldsw	[%l7 + 0x4C],	%o4
	fbg,a	%fcc0,	loop_1297
loop_1297:
	sth	%l6,	[%l7 + 0x62]
	orncc	%i7,	%i1,	%o5
	ldsh	[%l7 + 0x32],	%g1
	ldx	[%l7 + 0x38],	%i5
	ldsb	[%l7 + 0x7E],	%g6
	srax	%g3,	0x12,	%i0
	fbl	%fcc0,	loop_1298
loop_1298:
	udiv	%o3,	0x09C3,	%o1
	fcmpeq16	%f10,	%f14,	%l4
	fnors	%f9,	%f11,	%f13
	addc	%o2,	0x1694,	%l2
	tl	%xcc,	0x2
	add	%g5,	%i2,	%o0
	call	loop_1299
loop_1299:
	sra	%o7,	%o6,	%i3
	stw	%g7,	[%l7 + 0x40]
	ldsb	[%l7 + 0x12],	%l3
	udivcc	%l0,	0x157C,	%l5
	movle	%xcc,	%g2,	%i6
	movrne	%l1,	%g4,	%o4
	fones	%f2
	fbul	%fcc0,	loop_1300
loop_1300:
	movrlez	%i4,	0x26D,	%i7
	fmovrslz	%i1,	%f13,	%f8
	udivcc	%l6,	0x1650,	%o5
	orcc	%i5,	0x057E,	%g1
	sll	%g6,	0x1F,	%i0
	movn	%xcc,	%g3,	%o3
	bgu,a	%xcc,	loop_1301
loop_1301:
	ld	[%l7 + 0x34],	%f15
	sll	%o1,	%o2,	%l2
	stb	%g5,	[%l7 + 0x22]
	alignaddr	%l4,	%i2,	%o0
	movn	%icc,	%o6,	%o7
	umul	%g7,	%i3,	%l0
	edge32ln	%l3,	%g2,	%i6
	edge32l	%l1,	%g4,	%o4
	fmovdg	%icc,	%f8,	%f8
	array8	%i4,	%l5,	%i7
	taddcc	%i1,	0x0C97,	%l6
	movrgez	%o5,	0x065,	%i5
	fxnor	%f6,	%f12,	%f0
	edge16	%g1,	%i0,	%g3
	and	%g6,	0x0469,	%o1
	mulx	%o2,	%o3,	%l2
	alignaddrl	%g5,	%i2,	%o0
	stx	%o6,	[%l7 + 0x38]
	fmovse	%icc,	%f7,	%f5
	edge32n	%l4,	%g7,	%i3
	stb	%l0,	[%l7 + 0x70]
	fmovrslez	%o7,	%f9,	%f5
	movrlez	%l3,	0x3EA,	%g2
	tgu	%xcc,	0x5
	fmovdneg	%icc,	%f11,	%f5
	bvc,a	loop_1302
loop_1302:
	brgez	%i6,	loop_1303
loop_1303:
	nop
	setx loop_1304, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1304:
	movrne	%l1,	%g4,	%o4
	brz,a	%i4,	loop_1305
loop_1305:
	fpadd32	%f12,	%f0,	%f0
	edge16l	%l5,	%i7,	%l6
	subccc	%i1,	0x1CCA,	%o5
	movrlez	%i5,	%i0,	%g3
	brlz,a	%g6,	loop_1306
loop_1306:
	alignaddr	%o1,	%g1,	%o2
	brgz,a	%o3,	loop_1307
loop_1307:
	tpos	%xcc,	0x7
	smul	%l2,	%i2,	%o0
	tvs	%xcc,	0x0
	movrne	%o6,	0x1AA,	%g5
	tne	%xcc,	0x6
	bpos,pt	%xcc,	loop_1308
loop_1308:
	movleu	%icc,	%l4,	%g7
	fbul	%fcc3,	loop_1309
loop_1309:
	tg	%xcc,	0x3
	fpsub32s	%f14,	%f9,	%f12
	lduw	[%l7 + 0x34],	%l0
	fmovdvs	%icc,	%f9,	%f4
	ldx	[%l7 + 0x10],	%o7
	fblg,a	%fcc3,	loop_1310
loop_1310:
	fandnot1	%f4,	%f0,	%f12
	fmovrsne	%l3,	%f13,	%f12
	sth	%g2,	[%l7 + 0x6A]
	fbule,a	%fcc0,	loop_1311
loop_1311:
	movrne	%i3,	%l1,	%g4
	movvs	%icc,	%o4,	%i6
	fmovdle	%icc,	%f13,	%f11
	sra	%i4,	%i7,	%l6
	brlez,a	%i1,	loop_1312
loop_1312:
	udivx	%o5,	0x0491,	%l5
	movpos	%icc,	%i0,	%g3
	edge8l	%g6,	%o1,	%i5
	fbu	%fcc3,	loop_1313
loop_1313:
	movcs	%xcc,	%o2,	%o3
	brlz,a	%g1,	loop_1314
loop_1314:
	tn	%icc,	0x6
	stw	%i2,	[%l7 + 0x4C]
	xorcc	%o0,	0x0435,	%o6
	nop
	setx loop_1315, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1315:
	taddcctv	%l2,	0x0120,	%g5
	orcc	%l4,	0x0D1B,	%l0
	mulscc	%g7,	%o7,	%l3
	fbn	%fcc1,	loop_1316
loop_1316:
	fmovdpos	%icc,	%f4,	%f9
	tsubcc	%g2,	%i3,	%g4
	sub	%o4,	0x1F35,	%l1
	fmovsg	%xcc,	%f0,	%f3
	movrlez	%i4,	%i7,	%l6
	tvs	%xcc,	0x1
	fmul8ulx16	%f0,	%f6,	%f14
	tge	%icc,	0x3
	edge16	%i6,	%i1,	%o5
	fcmped	%fcc2,	%f10,	%f10
	lduw	[%l7 + 0x28],	%l5
	movvc	%xcc,	%i0,	%g6
	add	%g3,	%o1,	%i5
	fnot1	%f8,	%f14
	fmovrslez	%o2,	%f8,	%f12
	xorcc	%o3,	%i2,	%o0
	subcc	%g1,	0x1973,	%o6
	srax	%l2,	0x07,	%g5
	popc	%l0,	%g7
	bneg,pn	%icc,	loop_1317
loop_1317:
	array32	%o7,	%l3,	%l4
	alignaddr	%i3,	%g4,	%o4
	fmovdvc	%icc,	%f0,	%f15
	ta	%icc,	0x1
	edge8	%l1,	%i4,	%i7
	fmovrdgez	%l6,	%f12,	%f8
	movcc	%icc,	%i6,	%g2
	fmovscs	%icc,	%f8,	%f0
	movge	%xcc,	%i1,	%o5
	fcmpne32	%f8,	%f14,	%l5
	movl	%icc,	%g6,	%i0
	bvc	loop_1318
loop_1318:
	edge8	%o1,	%i5,	%g3
	or	%o3,	%i2,	%o2
	umulcc	%g1,	%o6,	%l2
	fblg	%fcc1,	loop_1319
loop_1319:
	fone	%f0
	edge8ln	%g5,	%l0,	%g7
	array8	%o7,	%l3,	%o0
	edge8ln	%l4,	%i3,	%o4
	add	%g4,	0x01A6,	%l1
	subccc	%i4,	%i7,	%l6
	fand	%f8,	%f6,	%f14
	fpadd32s	%f11,	%f15,	%f4
	fmovrdne	%g2,	%f6,	%f8
	fbul	%fcc1,	loop_1320
loop_1320:
	fmovse	%icc,	%f11,	%f4
	orcc	%i6,	%o5,	%i1
	andcc	%l5,	0x0CBD,	%g6
	fmul8x16al	%f1,	%f5,	%f2
	subccc	%i0,	0x1992,	%o1
	siam	0x6
	tg	%xcc,	0x5
	sdiv	%i5,	0x0D73,	%o3
	fbg,a	%fcc2,	loop_1321
loop_1321:
	stw	%g3,	[%l7 + 0x28]
	lduh	[%l7 + 0x6C],	%i2
	and	%g1,	0x0B82,	%o2
	fblg	%fcc1,	loop_1322
loop_1322:
	ldub	[%l7 + 0x7B],	%l2
	stx	%o6,	[%l7 + 0x38]
	taddcc	%l0,	%g7,	%o7
	sth	%l3,	[%l7 + 0x10]
	sllx	%g5,	0x01,	%o0
	andcc	%l4,	%i3,	%g4
	movl	%icc,	%o4,	%l1
	brgz	%i7,	loop_1323
loop_1323:
	subcc	%l6,	%i4,	%g2
	fmovdg	%xcc,	%f12,	%f12
	stw	%i6,	[%l7 + 0x60]
	fmovrse	%i1,	%f6,	%f5
	be,pn	%icc,	loop_1324
loop_1324:
	fbug	%fcc0,	loop_1325
loop_1325:
	umul	%o5,	0x032A,	%l5
	movcs	%xcc,	%i0,	%g6
	ba,a	loop_1326
loop_1326:
	fmovse	%icc,	%f3,	%f3
	xor	%o1,	%i5,	%g3
	mova	%icc,	%i2,	%o3
	movrlez	%g1,	%o2,	%l2
	tg	%xcc,	0x5
	bpos,pt	%xcc,	loop_1327
loop_1327:
	smul	%l0,	%g7,	%o7
	st	%f12,	[%l7 + 0x38]
	ble,pt	%xcc,	loop_1328
loop_1328:
	alignaddrl	%l3,	%g5,	%o0
	taddcctv	%l4,	0x1372,	%i3
	orn	%o6,	0x1E78,	%g4
	sub	%o4,	0x0442,	%l1
	movpos	%xcc,	%i7,	%l6
	nop
	setx loop_1329, %l0, %l1
	jmpl %l1, %i4
loop_1329:
	fmovscs	%icc,	%f14,	%f1
	xorcc	%i6,	%i1,	%o5
	fblg,a	%fcc1,	loop_1330
loop_1330:
	fmovsgu	%icc,	%f7,	%f0
	xnor	%g2,	0x1166,	%l5
	movle	%icc,	%i0,	%o1
	fmovd	%f0,	%f2
	bl,a	%icc,	loop_1331
loop_1331:
	or	%i5,	0x1304,	%g6
	bg	%icc,	loop_1332
loop_1332:
	movn	%xcc,	%g3,	%i2
	mulx	%g1,	0x15F4,	%o3
	fone	%f0
	fmovdvc	%xcc,	%f3,	%f8
	andn	%o2,	0x1461,	%l0
	stx	%g7,	[%l7 + 0x48]
	taddcc	%o7,	%l3,	%g5
	brz	%l2,	loop_1333
loop_1333:
	taddcc	%l4,	0x1EE8,	%o0
	udivcc	%o6,	0x10D8,	%i3
	mova	%xcc,	%g4,	%l1
	tneg	%xcc,	0x4
	std	%f12,	[%l7 + 0x28]
	tle	%xcc,	0x4
	tpos	%xcc,	0x0
	subccc	%i7,	%o4,	%l6
	sllx	%i4,	%i6,	%o5
	array32	%g2,	%i1,	%i0
	st	%f6,	[%l7 + 0x68]
	alignaddrl	%l5,	%o1,	%i5
	fcmpne16	%f4,	%f4,	%g3
	ldsh	[%l7 + 0x52],	%g6
	smul	%i2,	%o3,	%o2
	udivcc	%l0,	0x148C,	%g1
	ldsw	[%l7 + 0x0C],	%g7
	subcc	%l3,	%g5,	%o7
	subcc	%l2,	%o0,	%o6
	ldsw	[%l7 + 0x74],	%l4
	std	%f10,	[%l7 + 0x30]
	orcc	%g4,	0x0E68,	%l1
	taddcc	%i7,	0x07FD,	%o4
	movge	%icc,	%i3,	%l6
	fmovs	%f9,	%f0
	fbul,a	%fcc2,	loop_1334
loop_1334:
	fblg,a	%fcc1,	loop_1335
loop_1335:
	movgu	%xcc,	%i4,	%i6
	tgu	%xcc,	0x2
	tne	%xcc,	0x1
	fmovdne	%xcc,	%f10,	%f12
	fpack32	%f12,	%f2,	%f0
	fmuld8sux16	%f1,	%f7,	%f10
	tl	%icc,	0x4
	fone	%f4
	orn	%g2,	0x0FD0,	%o5
	movne	%xcc,	%i1,	%l5
	udiv	%i0,	0x0E1E,	%o1
	fbuge	%fcc1,	loop_1336
loop_1336:
	bleu,a	%xcc,	loop_1337
loop_1337:
	movrgez	%i5,	0x1E3,	%g3
	bgu,pt	%xcc,	loop_1338
loop_1338:
	xor	%g6,	0x1070,	%o3
	std	%f10,	[%l7 + 0x08]
	udivcc	%i2,	0x0FFE,	%o2
	movge	%icc,	%l0,	%g7
	sra	%l3,	%g5,	%o7
	fornot2s	%f11,	%f0,	%f7
	movgu	%xcc,	%l2,	%o0
	or	%o6,	0x07EC,	%l4
	udiv	%g4,	0x073F,	%g1
	edge8ln	%i7,	%o4,	%l1
	tg	%xcc,	0x2
	movpos	%icc,	%l6,	%i3
	movneg	%xcc,	%i4,	%i6
	movle	%icc,	%o5,	%g2
	movrlez	%i1,	0x361,	%l5
	fpsub16	%f14,	%f6,	%f2
	fcmps	%fcc0,	%f5,	%f11
	tge	%xcc,	0x7
	srax	%o1,	0x1A,	%i5
	mova	%xcc,	%i0,	%g3
	edge16l	%o3,	%i2,	%o2
	alignaddrl	%g6,	%g7,	%l3
	movrlez	%l0,	%g5,	%l2
	tsubcctv	%o7,	%o0,	%l4
	subccc	%o6,	0x0F4B,	%g1
	edge16l	%i7,	%o4,	%g4
	std	%f10,	[%l7 + 0x18]
	movle	%icc,	%l6,	%l1
	edge16ln	%i3,	%i6,	%o5
	fbl,a	%fcc3,	loop_1339
loop_1339:
	tsubcc	%i4,	0x19CB,	%i1
	fcmpeq16	%f4,	%f6,	%l5
	fnegd	%f14,	%f0
	fmovde	%icc,	%f1,	%f14
	orncc	%o1,	%g2,	%i0
	be,a	%icc,	loop_1340
loop_1340:
	lduw	[%l7 + 0x38],	%g3
	movg	%icc,	%i5,	%i2
	movrgez	%o2,	0x1AC,	%o3
	brgz,a	%g6,	loop_1341
loop_1341:
	fcmple32	%f10,	%f8,	%g7
	or	%l0,	0x1491,	%g5
	fors	%f3,	%f10,	%f2
	ldub	[%l7 + 0x6E],	%l3
	stw	%l2,	[%l7 + 0x48]
	nop
	setx loop_1342, %l0, %l1
	jmpl %l1, %o7
loop_1342:
	fornot1s	%f2,	%f11,	%f6
	ldsh	[%l7 + 0x5C],	%o0
	fcmpes	%fcc1,	%f9,	%f0
	orncc	%o6,	0x095E,	%g1
	ble	%icc,	loop_1343
loop_1343:
	movleu	%xcc,	%i7,	%l4
	fmovsn	%icc,	%f2,	%f15
	movgu	%icc,	%o4,	%g4
	st	%f0,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x74],	%l6
	ldx	[%l7 + 0x50],	%i3
	movle	%xcc,	%l1,	%i6
	tcs	%icc,	0x4
	fmovse	%xcc,	%f14,	%f5
	bcs,a,pt	%xcc,	loop_1344
loop_1344:
	fabsd	%f6,	%f2
	movgu	%xcc,	%i4,	%o5
	subccc	%i1,	%o1,	%l5
	movvs	%xcc,	%i0,	%g3
	fba	%fcc3,	loop_1345
loop_1345:
	fcmpes	%fcc2,	%f10,	%f13
	fmovrsgz	%g2,	%f7,	%f5
	sdivcc	%i5,	0x10A4,	%o2
	fmovsg	%xcc,	%f7,	%f2
	movne	%xcc,	%o3,	%g6
	bg,pt	%icc,	loop_1346
loop_1346:
	st	%f1,	[%l7 + 0x60]
	xorcc	%g7,	%i2,	%l0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type f   	: 202
!	Type i   	: 541
!	Type cti   	: 138
!	Type l   	: 119
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
main_t6:

	!# Initialize registers ..

	!# Global registers
	set	0x8,	%g1
	set	0x3,	%g2
	set	0x3,	%g3
	set	0xB,	%g4
	set	0xF,	%g5
	set	0xA,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xF,	%i1
	set	-0xD,	%i2
	set	-0xB,	%i3
	set	-0xC,	%i4
	set	-0xB,	%i5
	set	-0xB,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x2FEB9BAB,	%l0
	set	0x30D01B00,	%l1
	set	0x7C8B6882,	%l2
	set	0x1226D818,	%l3
	set	0x5CD0A101,	%l4
	set	0x26313C2F,	%l5
	set	0x5C916F55,	%l6
	!# Output registers
	set	0x0D8A,	%o0
	set	0x024E,	%o1
	set	-0x1564,	%o2
	set	-0x16B7,	%o3
	set	0x1369,	%o4
	set	0x0124,	%o5
	set	-0x08C6,	%o6
	set	-0x0CCB,	%o7

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

	ldx	[%l7 + 0x38],	%l3
	array16	%l2,	%o7,	%o0
	ldsh	[%l7 + 0x6C],	%o6
	st	%f10,	[%l7 + 0x54]
	tgu	%icc,	0x1
	fnegs	%f14,	%f3
	ldsh	[%l7 + 0x12],	%g5
	fmovdge	%icc,	%f10,	%f8
	fmovspos	%icc,	%f0,	%f2
	ldsb	[%l7 + 0x23],	%g1
	stb	%i7,	[%l7 + 0x44]
	edge32ln	%o4,	%l4,	%l6
	nop
	setx loop_1347, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1347:
	sllx	%i3,	%g4,	%i6
	fcmple32	%f4,	%f12,	%i4
	brlez,a	%l1,	loop_1348
loop_1348:
	fmovd	%f8,	%f4
	ld	[%l7 + 0x0C],	%f15
	ld	[%l7 + 0x2C],	%f15
	st	%f8,	[%l7 + 0x18]
	std	%f8,	[%l7 + 0x58]
	stw	%o5,	[%l7 + 0x68]
	lduw	[%l7 + 0x18],	%o1
	bcc,pn	%icc,	loop_1349
loop_1349:
	lduw	[%l7 + 0x5C],	%i1
	ld	[%l7 + 0x14],	%f3
	edge32ln	%i0,	%l5,	%g2
	stb	%g3,	[%l7 + 0x45]
	ldx	[%l7 + 0x70],	%i5
	stx	%o2,	[%l7 + 0x28]
	stw	%g6,	[%l7 + 0x14]
	edge8n	%g7,	%i2,	%o3
	fbo	%fcc0,	loop_1350
loop_1350:
	fpmerge	%f9,	%f0,	%f0
	stb	%l3,	[%l7 + 0x78]
	fcmpes	%fcc2,	%f12,	%f0
	stw	%l2,	[%l7 + 0x44]
	fcmpeq32	%f8,	%f2,	%l0
	smul	%o0,	0x07A4,	%o6
	xnorcc	%g5,	0x1115,	%o7
	bgu,a,pt	%xcc,	loop_1351
loop_1351:
	subccc	%g1,	0x105D,	%i7
	mulscc	%o4,	0x1365,	%l4
	ldsh	[%l7 + 0x64],	%i3
	andcc	%g4,	%i6,	%l6
	popc	0x1AED,	%i4
	movcs	%xcc,	%l1,	%o1
	fbu,a	%fcc2,	loop_1352
loop_1352:
	ldx	[%l7 + 0x68],	%i1
	ldd	[%l7 + 0x50],	%f8
	siam	0x1
	stb	%i0,	[%l7 + 0x72]
	sdiv	%l5,	0x17FE,	%o5
	taddcc	%g2,	0x0858,	%g3
	edge8l	%i5,	%g6,	%o2
	fmovdne	%xcc,	%f11,	%f5
	std	%f2,	[%l7 + 0x28]
	ldx	[%l7 + 0x08],	%g7
	array8	%i2,	%o3,	%l3
	ld	[%l7 + 0x78],	%f8
	fsrc2s	%f10,	%f0
	sdivx	%l2,	0x1E10,	%o0
	tsubcctv	%o6,	%g5,	%o7
	edge32ln	%l0,	%i7,	%o4
	tleu	%xcc,	0x0
	lduw	[%l7 + 0x14],	%l4
	fbg	%fcc2,	loop_1353
loop_1353:
	ld	[%l7 + 0x14],	%f5
	st	%f12,	[%l7 + 0x48]
	lduw	[%l7 + 0x1C],	%i3
	fmovrdgez	%g4,	%f6,	%f4
	movleu	%icc,	%i6,	%l6
	stx	%i4,	[%l7 + 0x58]
	tvc	%icc,	0x2
	st	%f13,	[%l7 + 0x58]
	sll	%g1,	%l1,	%i1
	edge8l	%o1,	%i0,	%l5
	stb	%g2,	[%l7 + 0x78]
	ldsb	[%l7 + 0x40],	%g3
	st	%f0,	[%l7 + 0x60]
	udivx	%i5,	0x02A5,	%o5
	edge32l	%o2,	%g6,	%i2
	andn	%o3,	0x0C7F,	%l3
	fpack32	%f4,	%f8,	%f8
	ldub	[%l7 + 0x70],	%g7
	add	%o0,	0x00AD,	%l2
	andn	%g5,	0x1E9F,	%o7
	movrlez	%o6,	0x201,	%l0
	subccc	%o4,	0x071F,	%l4
	ldx	[%l7 + 0x70],	%i7
	stx	%g4,	[%l7 + 0x50]
	tvc	%xcc,	0x7
	ldsw	[%l7 + 0x14],	%i3
	xor	%l6,	%i4,	%g1
	ldsh	[%l7 + 0x10],	%i6
	edge32ln	%l1,	%o1,	%i1
	stb	%l5,	[%l7 + 0x1C]
	tne	%xcc,	0x1
	stx	%g2,	[%l7 + 0x10]
	ldsh	[%l7 + 0x14],	%i0
	stw	%i5,	[%l7 + 0x3C]
	srlx	%o5,	%o2,	%g3
	ld	[%l7 + 0x40],	%f6
	movne	%xcc,	%g6,	%i2
	addc	%o3,	%l3,	%g7
	bneg	loop_1354
loop_1354:
	andn	%l2,	0x1B36,	%g5
	lduw	[%l7 + 0x10],	%o0
	fornot1s	%f12,	%f0,	%f5
	fornot1s	%f2,	%f12,	%f10
	nop
	setx loop_1355, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1355:
	lduw	[%l7 + 0x24],	%o7
	subccc	%l0,	0x15E4,	%o4
	std	%f0,	[%l7 + 0x38]
	ldsh	[%l7 + 0x74],	%o6
	edge16n	%i7,	%g4,	%l4
	sllx	%i3,	0x10,	%l6
	te	%xcc,	0x3
	movge	%icc,	%g1,	%i6
	st	%f14,	[%l7 + 0x20]
	tpos	%icc,	0x1
	fzero	%f10
	fpack16	%f14,	%f6
	smulcc	%l1,	0x1F06,	%i4
	ldsb	[%l7 + 0x25],	%o1
	tpos	%icc,	0x0
	ldsb	[%l7 + 0x64],	%i1
	fmovsvc	%icc,	%f8,	%f9
	edge8ln	%l5,	%g2,	%i0
	ldsw	[%l7 + 0x34],	%o5
	std	%f12,	[%l7 + 0x20]
	edge8n	%i5,	%g3,	%o2
	ldd	[%l7 + 0x30],	%f0
	ld	[%l7 + 0x2C],	%f11
	fcmple16	%f14,	%f8,	%i2
	bpos	%icc,	loop_1356
loop_1356:
	array8	%g6,	%l3,	%o3
	edge32ln	%l2,	%g7,	%o0
	fornot2	%f2,	%f14,	%f2
	stb	%o7,	[%l7 + 0x1F]
	st	%f4,	[%l7 + 0x28]
	ldub	[%l7 + 0x12],	%l0
	ldsh	[%l7 + 0x1A],	%o4
	tpos	%xcc,	0x4
	ldsh	[%l7 + 0x44],	%g5
	nop
	setx loop_1357, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1357:
	stw	%i7,	[%l7 + 0x30]
	fmovsg	%icc,	%f2,	%f1
	stx	%o6,	[%l7 + 0x40]
	stx	%g4,	[%l7 + 0x40]
	tsubcctv	%l4,	%i3,	%l6
	movl	%icc,	%i6,	%g1
	tne	%icc,	0x5
	stb	%l1,	[%l7 + 0x0A]
	orn	%o1,	0x11F7,	%i1
	sth	%i4,	[%l7 + 0x76]
	fba	%fcc1,	loop_1358
loop_1358:
	tvs	%xcc,	0x0
	st	%f1,	[%l7 + 0x40]
	lduw	[%l7 + 0x24],	%g2
	andcc	%i0,	%l5,	%o5
	stb	%g3,	[%l7 + 0x0C]
	lduw	[%l7 + 0x5C],	%o2
	lduw	[%l7 + 0x54],	%i5
	ldsw	[%l7 + 0x50],	%i2
	lduh	[%l7 + 0x6C],	%l3
	stb	%o3,	[%l7 + 0x4C]
	stx	%g6,	[%l7 + 0x18]
	mulx	%l2,	%o0,	%g7
	stb	%o7,	[%l7 + 0x77]
	fabss	%f9,	%f1
	brz,a	%l0,	loop_1359
loop_1359:
	ldx	[%l7 + 0x08],	%o4
	addc	%i7,	%g5,	%o6
	brlez	%g4,	loop_1360
loop_1360:
	lduw	[%l7 + 0x28],	%i3
	tcc	%icc,	0x2
	udivcc	%l6,	0x1A59,	%i6
	ba,a,pn	%xcc,	loop_1361
loop_1361:
	sth	%l4,	[%l7 + 0x0E]
	mulx	%g1,	%l1,	%i1
	ldub	[%l7 + 0x68],	%o1
	ldsw	[%l7 + 0x7C],	%g2
	st	%f1,	[%l7 + 0x64]
	edge32	%i4,	%l5,	%o5
	stx	%g3,	[%l7 + 0x10]
	fmovdcs	%xcc,	%f14,	%f3
	lduh	[%l7 + 0x2C],	%o2
	std	%f4,	[%l7 + 0x40]
	lduh	[%l7 + 0x6C],	%i0
	stw	%i5,	[%l7 + 0x1C]
	st	%f13,	[%l7 + 0x18]
	fbe	%fcc3,	loop_1362
loop_1362:
	xnorcc	%i2,	0x1431,	%l3
	fbo	%fcc3,	loop_1363
loop_1363:
	stw	%g6,	[%l7 + 0x78]
	umulcc	%l2,	%o0,	%g7
	tl	%xcc,	0x1
	stx	%o7,	[%l7 + 0x28]
	alignaddrl	%l0,	%o3,	%o4
	movvs	%icc,	%i7,	%o6
	lduw	[%l7 + 0x2C],	%g4
	tgu	%xcc,	0x5
	edge8n	%i3,	%l6,	%i6
	umulcc	%l4,	0x11D6,	%g5
	fcmpeq32	%f2,	%f14,	%l1
	or	%i1,	0x1048,	%g1
	stx	%o1,	[%l7 + 0x50]
	std	%f6,	[%l7 + 0x50]
	ld	[%l7 + 0x7C],	%f0
	stx	%g2,	[%l7 + 0x20]
	fmovrslez	%l5,	%f2,	%f7
	edge8n	%o5,	%i4,	%g3
	st	%f13,	[%l7 + 0x14]
	xorcc	%o2,	0x1ED0,	%i0
	edge32ln	%i2,	%i5,	%g6
	stw	%l3,	[%l7 + 0x4C]
	udivx	%l2,	0x15E9,	%o0
	lduw	[%l7 + 0x70],	%g7
	std	%f6,	[%l7 + 0x48]
	fble,a	%fcc3,	loop_1364
loop_1364:
	ta	%xcc,	0x3
	movrlz	%l0,	%o7,	%o4
	fnot2	%f2,	%f14
	tge	%xcc,	0x2
	ldub	[%l7 + 0x72],	%o3
	fandnot2s	%f4,	%f3,	%f4
	tleu	%icc,	0x6
	xnor	%i7,	0x00C4,	%g4
	edge8l	%i3,	%l6,	%i6
	brgez	%l4,	loop_1365
loop_1365:
	ldd	[%l7 + 0x28],	%f10
	ldd	[%l7 + 0x58],	%f4
	tne	%icc,	0x4
	movcs	%icc,	%o6,	%g5
	fmul8ulx16	%f4,	%f10,	%f2
	ldsb	[%l7 + 0x0D],	%i1
	ld	[%l7 + 0x30],	%f4
	ldd	[%l7 + 0x60],	%f10
	fbne	%fcc1,	loop_1366
loop_1366:
	ldd	[%l7 + 0x28],	%f14
	sth	%l1,	[%l7 + 0x46]
	st	%f8,	[%l7 + 0x5C]
	bpos,pt	%icc,	loop_1367
loop_1367:
	ldsh	[%l7 + 0x38],	%g1
	movle	%xcc,	%g2,	%o1
	st	%f6,	[%l7 + 0x34]
	lduw	[%l7 + 0x20],	%l5
	tcs	%xcc,	0x5
	fmovs	%f7,	%f3
	ldub	[%l7 + 0x3D],	%i4
	fnot1	%f4,	%f12
	ldub	[%l7 + 0x5E],	%o5
	ldsw	[%l7 + 0x7C],	%o2
	ldx	[%l7 + 0x18],	%g3
	ldsw	[%l7 + 0x24],	%i2
	lduh	[%l7 + 0x5E],	%i5
	sth	%g6,	[%l7 + 0x36]
	lduh	[%l7 + 0x78],	%l3
	brgz	%l2,	loop_1368
loop_1368:
	stx	%i0,	[%l7 + 0x10]
	edge8l	%o0,	%l0,	%g7
	udivcc	%o4,	0x1F07,	%o3
	xnorcc	%i7,	0x0E56,	%g4
	lduh	[%l7 + 0x22],	%o7
	stx	%i3,	[%l7 + 0x40]
	std	%f4,	[%l7 + 0x18]
	ldd	[%l7 + 0x58],	%f0
	fmovrsne	%i6,	%f11,	%f8
	stw	%l6,	[%l7 + 0x2C]
	std	%f12,	[%l7 + 0x68]
	stw	%l4,	[%l7 + 0x38]
	ldsb	[%l7 + 0x59],	%o6
	tg	%icc,	0x5
	edge32ln	%g5,	%i1,	%g1
	faligndata	%f6,	%f6,	%f14
	xnorcc	%g2,	%o1,	%l1
	sra	%l5,	%i4,	%o5
	ldd	[%l7 + 0x30],	%f10
	fbuge,a	%fcc3,	loop_1369
loop_1369:
	subc	%g3,	%i2,	%i5
	fmovdleu	%icc,	%f9,	%f13
	fcmple32	%f12,	%f6,	%g6
	movne	%xcc,	%o2,	%l2
	lduh	[%l7 + 0x64],	%l3
	sth	%o0,	[%l7 + 0x42]
	fand	%f8,	%f6,	%f14
	lduw	[%l7 + 0x4C],	%l0
	fbug,a	%fcc3,	loop_1370
loop_1370:
	lduw	[%l7 + 0x64],	%i0
	movneg	%icc,	%g7,	%o3
	tgu	%icc,	0x7
	ldub	[%l7 + 0x15],	%i7
	ldsw	[%l7 + 0x10],	%g4
	lduw	[%l7 + 0x70],	%o4
	stw	%i3,	[%l7 + 0x7C]
	lduw	[%l7 + 0x60],	%o7
	ldsw	[%l7 + 0x60],	%i6
	st	%f5,	[%l7 + 0x3C]
	array32	%l6,	%o6,	%l4
	movrgez	%g5,	0x08D,	%g1
	tneg	%icc,	0x4
	ldx	[%l7 + 0x50],	%g2
	ldsw	[%l7 + 0x14],	%o1
	tle	%xcc,	0x2
	ldd	[%l7 + 0x08],	%f14
	stb	%l1,	[%l7 + 0x2E]
	edge8	%i1,	%i4,	%o5
	stx	%g3,	[%l7 + 0x10]
	ldsh	[%l7 + 0x26],	%i2
	sth	%l5,	[%l7 + 0x4E]
	std	%f2,	[%l7 + 0x68]
	st	%f3,	[%l7 + 0x68]
	edge8n	%i5,	%g6,	%l2
	and	%l3,	%o0,	%l0
	movvc	%icc,	%o2,	%g7
	fpackfix	%f8,	%f11
	ldsw	[%l7 + 0x2C],	%i0
	lduw	[%l7 + 0x50],	%i7
	std	%f12,	[%l7 + 0x20]
	fcmpeq16	%f6,	%f12,	%g4
	bge,a	%xcc,	loop_1371
loop_1371:
	st	%f0,	[%l7 + 0x2C]
	std	%f6,	[%l7 + 0x68]
	st	%f3,	[%l7 + 0x10]
	array8	%o3,	%o4,	%i3
	smulcc	%i6,	%l6,	%o6
	edge16ln	%l4,	%g5,	%o7
	sdiv	%g2,	0x1A18,	%o1
	st	%f0,	[%l7 + 0x08]
	lduh	[%l7 + 0x30],	%g1
	edge32	%l1,	%i1,	%i4
	stb	%o5,	[%l7 + 0x19]
	st	%f6,	[%l7 + 0x20]
	ldsb	[%l7 + 0x32],	%i2
	ldx	[%l7 + 0x28],	%l5
	lduh	[%l7 + 0x10],	%g3
	tn	%icc,	0x5
	add	%g6,	0x1847,	%l2
	mulscc	%l3,	0x1CF2,	%i5
	edge8l	%o0,	%o2,	%l0
	brlz,a	%g7,	loop_1372
loop_1372:
	lduh	[%l7 + 0x42],	%i0
	std	%f8,	[%l7 + 0x58]
	tl	%xcc,	0x4
	tneg	%icc,	0x7
	st	%f6,	[%l7 + 0x14]
	bvs,a,pt	%icc,	loop_1373
loop_1373:
	ldsw	[%l7 + 0x3C],	%i7
	mulscc	%g4,	%o4,	%o3
	stb	%i3,	[%l7 + 0x52]
	edge16	%i6,	%o6,	%l6
	tge	%xcc,	0x3
	st	%f10,	[%l7 + 0x44]
	tcc	%icc,	0x5
	st	%f11,	[%l7 + 0x2C]
	ldd	[%l7 + 0x30],	%f12
	ldsh	[%l7 + 0x0C],	%l4
	fbl,a	%fcc2,	loop_1374
loop_1374:
	fxor	%f10,	%f8,	%f14
	fpack16	%f6,	%f14
	st	%f4,	[%l7 + 0x10]
	ldd	[%l7 + 0x40],	%f2
	lduh	[%l7 + 0x0E],	%g5
	stb	%g2,	[%l7 + 0x1F]
	ldx	[%l7 + 0x78],	%o7
	ldub	[%l7 + 0x29],	%o1
	fmovsvs	%icc,	%f0,	%f0
	edge32l	%g1,	%l1,	%i1
	ldsh	[%l7 + 0x24],	%i4
	fcmps	%fcc1,	%f14,	%f5
	st	%f10,	[%l7 + 0x54]
	fmovsgu	%xcc,	%f6,	%f1
	fors	%f13,	%f15,	%f0
	fmovscs	%xcc,	%f10,	%f9
	lduw	[%l7 + 0x78],	%i2
	fpadd32s	%f4,	%f10,	%f1
	udivcc	%o5,	0x0C85,	%l5
	ldsw	[%l7 + 0x5C],	%g3
	ldub	[%l7 + 0x4B],	%l2
	ldsw	[%l7 + 0x6C],	%g6
	ldd	[%l7 + 0x60],	%f2
	srlx	%i5,	%o0,	%o2
	stw	%l3,	[%l7 + 0x30]
	movn	%icc,	%l0,	%g7
	fmovsvs	%icc,	%f4,	%f5
	edge8ln	%i0,	%i7,	%g4
	ldx	[%l7 + 0x20],	%o3
	brlz	%i3,	loop_1375
loop_1375:
	ldx	[%l7 + 0x70],	%i6
	movle	%icc,	%o6,	%l6
	st	%f9,	[%l7 + 0x6C]
	ld	[%l7 + 0x3C],	%f15
	ldsh	[%l7 + 0x7E],	%o4
	udivcc	%l4,	0x0D23,	%g2
	movne	%xcc,	%o7,	%o1
	bg,a	loop_1376
loop_1376:
	stx	%g1,	[%l7 + 0x60]
	ld	[%l7 + 0x78],	%f14
	sth	%l1,	[%l7 + 0x5E]
	ldsw	[%l7 + 0x58],	%i1
	subccc	%g5,	0x076C,	%i2
	smul	%o5,	%i4,	%l5
	tleu	%xcc,	0x7
	std	%f6,	[%l7 + 0x48]
	lduw	[%l7 + 0x2C],	%l2
	or	%g6,	0x0363,	%g3
	fands	%f9,	%f2,	%f9
	lduw	[%l7 + 0x24],	%o0
	std	%f12,	[%l7 + 0x38]
	sth	%i5,	[%l7 + 0x58]
	lduh	[%l7 + 0x68],	%o2
	ldub	[%l7 + 0x6A],	%l3
	popc	%l0,	%g7
	bshuffle	%f10,	%f8,	%f6
	orn	%i7,	%i0,	%o3
	st	%f15,	[%l7 + 0x3C]
	stx	%i3,	[%l7 + 0x28]
	fmovrsgz	%i6,	%f3,	%f7
	stx	%g4,	[%l7 + 0x18]
	ldd	[%l7 + 0x50],	%f12
	tcc	%icc,	0x3
	move	%icc,	%o6,	%o4
	orcc	%l4,	0x14D1,	%g2
	movl	%xcc,	%o7,	%o1
	movcs	%xcc,	%g1,	%l1
	std	%f8,	[%l7 + 0x68]
	ld	[%l7 + 0x24],	%f4
	fbu,a	%fcc0,	loop_1377
loop_1377:
	ldub	[%l7 + 0x3E],	%l6
	ldx	[%l7 + 0x20],	%i1
	fble	%fcc2,	loop_1378
loop_1378:
	taddcctv	%g5,	%i2,	%o5
	lduw	[%l7 + 0x1C],	%l5
	lduw	[%l7 + 0x14],	%l2
	stx	%g6,	[%l7 + 0x60]
	tg	%icc,	0x2
	fpack16	%f6,	%f8
	orncc	%g3,	%o0,	%i5
	lduh	[%l7 + 0x3A],	%i4
	std	%f6,	[%l7 + 0x20]
	fsrc2	%f2,	%f8
	fzeros	%f8
	lduh	[%l7 + 0x4A],	%o2
	sll	%l3,	%l0,	%i7
	ldx	[%l7 + 0x40],	%i0
	stb	%g7,	[%l7 + 0x6C]
	fmovsge	%xcc,	%f6,	%f13
	stw	%i3,	[%l7 + 0x08]
	ldsw	[%l7 + 0x38],	%o3
	addcc	%g4,	%i6,	%o4
	array8	%o6,	%l4,	%o7
	fandnot1s	%f8,	%f6,	%f11
	sth	%o1,	[%l7 + 0x7C]
	movgu	%icc,	%g2,	%l1
	stw	%l6,	[%l7 + 0x4C]
	sth	%i1,	[%l7 + 0x6A]
	fsrc2s	%f0,	%f8
	lduw	[%l7 + 0x34],	%g5
	lduh	[%l7 + 0x66],	%i2
	st	%f9,	[%l7 + 0x54]
	umulcc	%g1,	%l5,	%o5
	sth	%l2,	[%l7 + 0x14]
	te	%icc,	0x0
	bcs,pt	%icc,	loop_1379
loop_1379:
	stb	%g6,	[%l7 + 0x4E]
	ldsw	[%l7 + 0x10],	%g3
	ld	[%l7 + 0x4C],	%f7
	ld	[%l7 + 0x08],	%f4
	ld	[%l7 + 0x24],	%f10
	fmovrslez	%i5,	%f13,	%f3
	edge16	%i4,	%o0,	%o2
	fcmpeq16	%f8,	%f6,	%l3
	stw	%l0,	[%l7 + 0x54]
	stb	%i7,	[%l7 + 0x08]
	sth	%g7,	[%l7 + 0x48]
	stw	%i3,	[%l7 + 0x14]
	lduh	[%l7 + 0x2C],	%o3
	lduw	[%l7 + 0x44],	%i0
	st	%f11,	[%l7 + 0x74]
	sll	%i6,	0x17,	%g4
	bcc,pn	%icc,	loop_1380
loop_1380:
	movne	%xcc,	%o4,	%l4
	fxor	%f14,	%f2,	%f14
	movre	%o6,	0x262,	%o1
	stb	%g2,	[%l7 + 0x63]
	lduh	[%l7 + 0x1C],	%l1
	fmovsvs	%icc,	%f2,	%f9
	array16	%o7,	%l6,	%i1
	fmuld8ulx16	%f12,	%f4,	%f0
	st	%f7,	[%l7 + 0x34]
	ldsw	[%l7 + 0x44],	%g5
	tsubcc	%i2,	0x0FBB,	%l5
	movrlz	%g1,	%l2,	%g6
	stb	%g3,	[%l7 + 0x31]
	ldsb	[%l7 + 0x62],	%i5
	sethi	0x1177,	%i4
	brgz	%o5,	loop_1381
loop_1381:
	tgu	%icc,	0x0
	smul	%o0,	0x131F,	%l3
	fmovsleu	%icc,	%f14,	%f4
	sdiv	%o2,	0x1A8A,	%i7
	lduh	[%l7 + 0x56],	%l0
	tleu	%xcc,	0x6
	ldsb	[%l7 + 0x65],	%g7
	pdist	%f10,	%f4,	%f4
	fmovsgu	%xcc,	%f7,	%f8
	fandnot2s	%f7,	%f0,	%f5
	popc	%i3,	%i0
	sdivcc	%o3,	0x197F,	%i6
	fbg,a	%fcc2,	loop_1382
loop_1382:
	stx	%o4,	[%l7 + 0x30]
	fba,a	%fcc2,	loop_1383
loop_1383:
	edge16n	%l4,	%g4,	%o6
	ldd	[%l7 + 0x40],	%f10
	ldub	[%l7 + 0x26],	%g2
	stx	%l1,	[%l7 + 0x60]
	ldsh	[%l7 + 0x68],	%o1
	stb	%o7,	[%l7 + 0x4E]
	std	%f0,	[%l7 + 0x58]
	ldd	[%l7 + 0x20],	%f8
	ldsb	[%l7 + 0x16],	%i1
	orn	%l6,	%g5,	%i2
	srl	%g1,	%l5,	%g6
	fnot2s	%f10,	%f9
	ldsw	[%l7 + 0x48],	%g3
	std	%f12,	[%l7 + 0x48]
	te	%xcc,	0x5
	edge16n	%i5,	%l2,	%o5
	st	%f13,	[%l7 + 0x30]
	fnors	%f13,	%f13,	%f11
	and	%o0,	0x1DF3,	%l3
	bl,pt	%xcc,	loop_1384
loop_1384:
	sdiv	%o2,	0x1779,	%i7
	edge32	%l0,	%i4,	%g7
	ld	[%l7 + 0x14],	%f2
	bvs,pn	%xcc,	loop_1385
loop_1385:
	fmovsl	%xcc,	%f2,	%f6
	st	%f7,	[%l7 + 0x10]
	lduw	[%l7 + 0x64],	%i0
	ldx	[%l7 + 0x78],	%i3
	ld	[%l7 + 0x5C],	%f4
	sdivcc	%i6,	0x16E3,	%o3
	addcc	%o4,	%g4,	%l4
	xnorcc	%o6,	0x03A8,	%l1
	std	%f10,	[%l7 + 0x30]
	stb	%g2,	[%l7 + 0x32]
	st	%f15,	[%l7 + 0x78]
	sub	%o7,	0x0EFA,	%o1
	subc	%i1,	0x0594,	%g5
	lduw	[%l7 + 0x30],	%l6
	addcc	%g1,	%l5,	%g6
	ldsb	[%l7 + 0x3B],	%g3
	ldsw	[%l7 + 0x6C],	%i5
	ld	[%l7 + 0x14],	%f14
	ldd	[%l7 + 0x60],	%f8
	tsubcc	%l2,	0x192E,	%o5
	edge32	%o0,	%i2,	%l3
	ldsh	[%l7 + 0x7C],	%i7
	ld	[%l7 + 0x6C],	%f1
	std	%f2,	[%l7 + 0x68]
	stw	%l0,	[%l7 + 0x0C]
	ld	[%l7 + 0x6C],	%f15
	ldsh	[%l7 + 0x74],	%o2
	sethi	0x1DF2,	%i4
	sth	%i0,	[%l7 + 0x60]
	ldub	[%l7 + 0x17],	%g7
	ldx	[%l7 + 0x60],	%i3
	sdivcc	%o3,	0x1F16,	%i6
	ldsh	[%l7 + 0x2E],	%g4
	ldx	[%l7 + 0x20],	%o4
	ldsw	[%l7 + 0x34],	%l4
	std	%f8,	[%l7 + 0x28]
	std	%f2,	[%l7 + 0x08]
	sdivx	%o6,	0x12A7,	%l1
	lduh	[%l7 + 0x3C],	%o7
	movgu	%icc,	%o1,	%i1
	ld	[%l7 + 0x54],	%f11
	subc	%g2,	%g5,	%l6
	ldub	[%l7 + 0x1D],	%l5
	ldd	[%l7 + 0x38],	%f2
	edge8ln	%g1,	%g6,	%g3
	subccc	%l2,	0x168D,	%o5
	ldsh	[%l7 + 0x6A],	%o0
	fnot2s	%f8,	%f12
	movleu	%icc,	%i2,	%i5
	brgez,a	%i7,	loop_1386
loop_1386:
	lduh	[%l7 + 0x58],	%l0
	movn	%icc,	%l3,	%o2
	ldd	[%l7 + 0x10],	%f4
	movleu	%xcc,	%i4,	%g7
	nop
	setx loop_1387, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1387:
	std	%f10,	[%l7 + 0x60]
	addcc	%i0,	%i3,	%i6
	sth	%g4,	[%l7 + 0x32]
	ldsh	[%l7 + 0x3C],	%o4
	subc	%l4,	0x18FC,	%o3
	ta	%xcc,	0x7
	edge32ln	%l1,	%o6,	%o7
	lduh	[%l7 + 0x6A],	%i1
	ld	[%l7 + 0x70],	%f13
	fzero	%f12
	stx	%o1,	[%l7 + 0x50]
	lduh	[%l7 + 0x0E],	%g2
	edge32ln	%g5,	%l6,	%l5
	ldd	[%l7 + 0x08],	%f8
	bg,a,pt	%xcc,	loop_1388
loop_1388:
	edge16n	%g1,	%g6,	%g3
	ldx	[%l7 + 0x60],	%o5
	movrne	%l2,	0x270,	%i2
	ldd	[%l7 + 0x10],	%f10
	st	%f4,	[%l7 + 0x70]
	ldd	[%l7 + 0x60],	%f6
	ld	[%l7 + 0x34],	%f5
	ld	[%l7 + 0x7C],	%f11
	std	%f14,	[%l7 + 0x48]
	fnegs	%f8,	%f1
	brnz	%i5,	loop_1389
loop_1389:
	stw	%o0,	[%l7 + 0x58]
	ldsw	[%l7 + 0x5C],	%i7
	ldsb	[%l7 + 0x41],	%l0
	movvs	%icc,	%l3,	%i4
	edge32n	%o2,	%g7,	%i0
	ldsh	[%l7 + 0x32],	%i3
	lduh	[%l7 + 0x6E],	%g4
	ld	[%l7 + 0x6C],	%f1
	lduw	[%l7 + 0x64],	%o4
	ldub	[%l7 + 0x7D],	%l4
	ldx	[%l7 + 0x30],	%i6
	std	%f8,	[%l7 + 0x78]
	fmovdl	%xcc,	%f7,	%f9
	ldsb	[%l7 + 0x51],	%o3
	lduh	[%l7 + 0x32],	%l1
	stb	%o6,	[%l7 + 0x2A]
	std	%f8,	[%l7 + 0x20]
	fmovscs	%icc,	%f5,	%f8
	stx	%o7,	[%l7 + 0x68]
	stw	%i1,	[%l7 + 0x14]
	ldub	[%l7 + 0x72],	%o1
	fcmpgt16	%f0,	%f8,	%g5
	ldsb	[%l7 + 0x42],	%g2
	ldub	[%l7 + 0x33],	%l6
	sdiv	%l5,	0x1619,	%g6
	fsrc1	%f12,	%f10
	ldd	[%l7 + 0x10],	%f8
	edge8ln	%g1,	%o5,	%l2
	movrgz	%i2,	0x057,	%g3
	ldsb	[%l7 + 0x42],	%o0
	ldx	[%l7 + 0x58],	%i7
	fmovrslz	%i5,	%f13,	%f5
	ldsw	[%l7 + 0x50],	%l3
	sth	%l0,	[%l7 + 0x10]
	sth	%o2,	[%l7 + 0x48]
	andn	%g7,	%i4,	%i3
	sth	%g4,	[%l7 + 0x52]
	ldd	[%l7 + 0x28],	%f8
	xnor	%i0,	0x1720,	%l4
	fxor	%f4,	%f6,	%f8
	stx	%i6,	[%l7 + 0x60]
	fnot1s	%f15,	%f0
	ldsw	[%l7 + 0x5C],	%o4
	stb	%l1,	[%l7 + 0x1E]
	sllx	%o3,	0x16,	%o7
	tsubcctv	%i1,	%o1,	%g5
	lduw	[%l7 + 0x20],	%o6
	stb	%g2,	[%l7 + 0x5B]
	sth	%l6,	[%l7 + 0x7C]
	edge8n	%l5,	%g1,	%o5
	ld	[%l7 + 0x70],	%f13
	andncc	%l2,	%g6,	%g3
	movre	%i2,	0x3BA,	%i7
	lduh	[%l7 + 0x36],	%i5
	tsubcctv	%l3,	%l0,	%o2
	tne	%xcc,	0x0
	ldd	[%l7 + 0x30],	%f14
	lduh	[%l7 + 0x14],	%o0
	subc	%i4,	%g7,	%g4
	std	%f0,	[%l7 + 0x40]
	ld	[%l7 + 0x4C],	%f11
	fmul8x16	%f9,	%f14,	%f14
	ldd	[%l7 + 0x28],	%f2
	edge32n	%i3,	%l4,	%i0
	edge32ln	%i6,	%l1,	%o3
	stw	%o4,	[%l7 + 0x4C]
	fabsd	%f4,	%f10
	ldd	[%l7 + 0x28],	%f14
	st	%f6,	[%l7 + 0x1C]
	fmovrdlz	%i1,	%f12,	%f2
	edge32ln	%o1,	%o7,	%o6
	faligndata	%f10,	%f14,	%f8
	srl	%g2,	%g5,	%l5
	movgu	%xcc,	%l6,	%o5
	ldsw	[%l7 + 0x48],	%l2
	lduw	[%l7 + 0x34],	%g6
	ld	[%l7 + 0x74],	%f13
	fpadd16	%f10,	%f4,	%f8
	ldsw	[%l7 + 0x18],	%g1
	ldsb	[%l7 + 0x49],	%i2
	edge16l	%i7,	%g3,	%i5
	ldsh	[%l7 + 0x32],	%l3
	sth	%o2,	[%l7 + 0x30]
	sra	%o0,	0x04,	%l0
	lduw	[%l7 + 0x08],	%i4
	tgu	%xcc,	0x4
	or	%g7,	0x1CC9,	%g4
	ldsh	[%l7 + 0x24],	%i3
	ldub	[%l7 + 0x3A],	%i0
	ldsh	[%l7 + 0x20],	%l4
	brgz	%i6,	loop_1390
loop_1390:
	tpos	%xcc,	0x3
	fcmpes	%fcc2,	%f9,	%f4
	udivx	%o3,	0x1D03,	%l1
	movcc	%xcc,	%i1,	%o4
	ldx	[%l7 + 0x38],	%o1
	movn	%icc,	%o7,	%o6
	bgu,pt	%icc,	loop_1391
loop_1391:
	tvc	%xcc,	0x5
	ldsw	[%l7 + 0x70],	%g2
	ld	[%l7 + 0x28],	%f9
	udivx	%g5,	0x196B,	%l5
	st	%f0,	[%l7 + 0x18]
	stb	%l6,	[%l7 + 0x53]
	ldsw	[%l7 + 0x40],	%o5
	lduw	[%l7 + 0x78],	%l2
	st	%f12,	[%l7 + 0x54]
	bge,pn	%xcc,	loop_1392
loop_1392:
	tsubcctv	%g1,	%i2,	%i7
	ldsh	[%l7 + 0x34],	%g3
	fors	%f14,	%f4,	%f6
	stw	%g6,	[%l7 + 0x70]
	tsubcctv	%i5,	%o2,	%o0
	subccc	%l3,	0x19F3,	%i4
	ldsb	[%l7 + 0x66],	%l0
	fmovsl	%icc,	%f2,	%f5
	ldd	[%l7 + 0x20],	%f8
	bpos,a,pt	%xcc,	loop_1393
loop_1393:
	andcc	%g4,	0x1953,	%i3
	ldsh	[%l7 + 0x58],	%g7
	ldub	[%l7 + 0x3F],	%l4
	stw	%i6,	[%l7 + 0x1C]
	sth	%o3,	[%l7 + 0x2E]
	ldx	[%l7 + 0x38],	%i0
	ldsw	[%l7 + 0x7C],	%l1
	sll	%o4,	0x04,	%i1
	sth	%o7,	[%l7 + 0x76]
	fnands	%f14,	%f9,	%f0
	stb	%o1,	[%l7 + 0x0E]
	srl	%o6,	%g2,	%g5
	tgu	%icc,	0x2
	ldsh	[%l7 + 0x3E],	%l6
	sth	%o5,	[%l7 + 0x0E]
	std	%f6,	[%l7 + 0x18]
	edge16n	%l5,	%g1,	%i2
	ldx	[%l7 + 0x30],	%l2
	tsubcc	%g3,	0x16FD,	%i7
	st	%f15,	[%l7 + 0x40]
	fbu,a	%fcc0,	loop_1394
loop_1394:
	movneg	%xcc,	%g6,	%o2
	edge32ln	%i5,	%l3,	%o0
	movg	%icc,	%l0,	%g4
	tvs	%icc,	0x6
	sra	%i4,	0x0A,	%g7
	ldx	[%l7 + 0x08],	%i3
	movne	%icc,	%i6,	%o3
	fcmple16	%f2,	%f8,	%l4
	ldd	[%l7 + 0x08],	%f14
	brgz	%i0,	loop_1395
loop_1395:
	stb	%o4,	[%l7 + 0x0D]
	stx	%l1,	[%l7 + 0x30]
	movleu	%icc,	%o7,	%o1
	ldx	[%l7 + 0x48],	%o6
	fbne	%fcc0,	loop_1396
loop_1396:
	ld	[%l7 + 0x28],	%f9
	ld	[%l7 + 0x68],	%f8
	ldsb	[%l7 + 0x24],	%i1
	ld	[%l7 + 0x4C],	%f15
	mulscc	%g2,	0x136E,	%g5
	stw	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x78],	%o5
	fmovrslez	%l5,	%f8,	%f14
	movge	%xcc,	%i2,	%l2
	stw	%g3,	[%l7 + 0x58]
	mova	%xcc,	%g1,	%g6
	edge16	%i7,	%o2,	%i5
	tn	%xcc,	0x7
	subccc	%l3,	%l0,	%g4
	ld	[%l7 + 0x34],	%f12
	tne	%xcc,	0x1
	sth	%o0,	[%l7 + 0x0E]
	ldub	[%l7 + 0x7C],	%g7
	fbe,a	%fcc1,	loop_1397
loop_1397:
	lduw	[%l7 + 0x68],	%i3
	ldd	[%l7 + 0x08],	%f8
	edge8ln	%i6,	%o3,	%i4
	ldd	[%l7 + 0x58],	%f0
	lduh	[%l7 + 0x10],	%i0
	stx	%l4,	[%l7 + 0x08]
	sethi	0x0C6B,	%o4
	std	%f8,	[%l7 + 0x48]
	tsubcc	%l1,	0x1023,	%o1
	ldsh	[%l7 + 0x30],	%o7
	ldsh	[%l7 + 0x7E],	%i1
	andcc	%o6,	%g5,	%g2
	sth	%l6,	[%l7 + 0x70]
	sth	%l5,	[%l7 + 0x48]
	fbul,a	%fcc1,	loop_1398
loop_1398:
	tsubcc	%o5,	0x1AC2,	%i2
	ldx	[%l7 + 0x38],	%g3
	stb	%l2,	[%l7 + 0x14]
	ldub	[%l7 + 0x37],	%g1
	ldsw	[%l7 + 0x20],	%g6
	movne	%icc,	%i7,	%o2
	sth	%l3,	[%l7 + 0x4A]
	fbul	%fcc1,	loop_1399
loop_1399:
	subccc	%l0,	0x08DF,	%g4
	ld	[%l7 + 0x30],	%f6
	movrlez	%i5,	0x32F,	%o0
	lduh	[%l7 + 0x52],	%g7
	nop
	setx loop_1400, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1400:
	smul	%i3,	%o3,	%i4
	smulcc	%i6,	0x028D,	%l4
	stb	%i0,	[%l7 + 0x58]
	ld	[%l7 + 0x30],	%f3
	movvc	%icc,	%l1,	%o1
	stw	%o7,	[%l7 + 0x18]
	edge16n	%o4,	%o6,	%g5
	movre	%i1,	0x212,	%l6
	edge16ln	%l5,	%g2,	%i2
	stx	%o5,	[%l7 + 0x38]
	ldsh	[%l7 + 0x4A],	%g3
	fbn,a	%fcc0,	loop_1401
loop_1401:
	fsrc2s	%f3,	%f12
	ldd	[%l7 + 0x28],	%f6
	stb	%l2,	[%l7 + 0x72]
	ldsw	[%l7 + 0x68],	%g6
	xnorcc	%g1,	0x0FA3,	%o2
	std	%f8,	[%l7 + 0x78]
	and	%i7,	%l0,	%l3
	tpos	%icc,	0x0
	st	%f5,	[%l7 + 0x4C]
	tn	%icc,	0x3
	andn	%i5,	0x1B40,	%g4
	movn	%icc,	%g7,	%o0
	movrne	%o3,	%i3,	%i4
	lduw	[%l7 + 0x30],	%i6
	ld	[%l7 + 0x28],	%f7
	ldsh	[%l7 + 0x7E],	%i0
	movle	%xcc,	%l4,	%l1
	sdivcc	%o1,	0x1557,	%o4
	lduw	[%l7 + 0x74],	%o6
	ldsh	[%l7 + 0x10],	%o7
	movle	%icc,	%g5,	%i1
	pdist	%f6,	%f10,	%f4
	ld	[%l7 + 0x20],	%f12
	lduh	[%l7 + 0x18],	%l5
	tpos	%icc,	0x7
	ldx	[%l7 + 0x28],	%g2
	movne	%xcc,	%l6,	%i2
	movge	%xcc,	%g3,	%o5
	movneg	%icc,	%g6,	%g1
	lduw	[%l7 + 0x7C],	%o2
	stw	%l2,	[%l7 + 0x60]
	stb	%i7,	[%l7 + 0x18]
	edge16l	%l0,	%l3,	%g4
	lduh	[%l7 + 0x26],	%g7
	st	%f9,	[%l7 + 0x44]
	lduw	[%l7 + 0x5C],	%i5
	movcs	%xcc,	%o3,	%i3
	movrgez	%o0,	%i6,	%i4
	array16	%i0,	%l4,	%l1
	fmovs	%f3,	%f4
	addccc	%o1,	0x117B,	%o6
	stb	%o7,	[%l7 + 0x59]
	fbn	%fcc2,	loop_1402
loop_1402:
	udivx	%g5,	0x07A7,	%o4
	stw	%l5,	[%l7 + 0x54]
	orncc	%g2,	0x035C,	%l6
	fmovsvc	%xcc,	%f11,	%f1
	te	%icc,	0x5
	ldsb	[%l7 + 0x14],	%i1
	fbu	%fcc1,	loop_1403
loop_1403:
	fabss	%f9,	%f0
	lduh	[%l7 + 0x36],	%g3
	tcs	%icc,	0x0
	ldd	[%l7 + 0x18],	%f6
	edge32n	%i2,	%g6,	%o5
	movcc	%icc,	%g1,	%l2
	lduh	[%l7 + 0x18],	%o2
	ldsb	[%l7 + 0x51],	%l0
	xnorcc	%l3,	%i7,	%g7
	addc	%i5,	0x1936,	%g4
	array32	%i3,	%o3,	%i6
	ld	[%l7 + 0x10],	%f14
	srax	%o0,	0x06,	%i0
	tsubcc	%l4,	%i4,	%l1
	orcc	%o6,	0x012B,	%o7
	stb	%o1,	[%l7 + 0x70]
	bl,a	%xcc,	loop_1404
loop_1404:
	ldx	[%l7 + 0x50],	%o4
	movne	%icc,	%g5,	%l5
	stb	%g2,	[%l7 + 0x60]
	addccc	%l6,	%g3,	%i1
	edge8ln	%i2,	%g6,	%g1
	tpos	%icc,	0x6
	ldub	[%l7 + 0x65],	%o5
	st	%f0,	[%l7 + 0x40]
	fzero	%f6
	fabss	%f9,	%f5
	fmovrsgez	%l2,	%f7,	%f1
	ld	[%l7 + 0x48],	%f6
	ldx	[%l7 + 0x08],	%l0
	stb	%l3,	[%l7 + 0x44]
	umulcc	%o2,	%g7,	%i5
	tpos	%xcc,	0x0
	tvc	%icc,	0x6
	stx	%i7,	[%l7 + 0x70]
	ldd	[%l7 + 0x10],	%f0
	ldsw	[%l7 + 0x08],	%g4
	stx	%o3,	[%l7 + 0x20]
	or	%i6,	0x122E,	%o0
	fsrc1	%f10,	%f6
	ldsb	[%l7 + 0x59],	%i3
	ldsb	[%l7 + 0x3A],	%l4
	edge16ln	%i0,	%i4,	%l1
	ldsh	[%l7 + 0x5E],	%o6
	stw	%o7,	[%l7 + 0x10]
	lduw	[%l7 + 0x3C],	%o4
	ldub	[%l7 + 0x0C],	%g5
	ld	[%l7 + 0x1C],	%f9
	sdivx	%l5,	0x0BB9,	%o1
	and	%g2,	%g3,	%i1
	sth	%i2,	[%l7 + 0x0C]
	fmovsneg	%icc,	%f10,	%f9
	stb	%g6,	[%l7 + 0x15]
	fmovsle	%xcc,	%f1,	%f2
	ldd	[%l7 + 0x60],	%f0
	ldsh	[%l7 + 0x2C],	%l6
	orncc	%g1,	0x0DC1,	%o5
	std	%f14,	[%l7 + 0x50]
	bvs	%icc,	loop_1405
loop_1405:
	edge16n	%l2,	%l0,	%o2
	movrgz	%g7,	0x346,	%i5
	movvc	%icc,	%l3,	%i7
	ldx	[%l7 + 0x38],	%o3
	ba,a	loop_1406
loop_1406:
	umulcc	%g4,	%o0,	%i3
	xor	%l4,	%i0,	%i4
	addc	%i6,	%o6,	%l1
	ld	[%l7 + 0x34],	%f9
	sdiv	%o7,	0x130C,	%g5
	smul	%l5,	%o1,	%g2
	addcc	%g3,	%o4,	%i2
	alignaddr	%g6,	%l6,	%i1
	fbuge,a	%fcc2,	loop_1407
loop_1407:
	stw	%g1,	[%l7 + 0x54]
	lduw	[%l7 + 0x3C],	%l2
	std	%f14,	[%l7 + 0x28]
	stx	%l0,	[%l7 + 0x20]
	tcc	%icc,	0x2
	ldx	[%l7 + 0x10],	%o5
	stx	%o2,	[%l7 + 0x68]
	ld	[%l7 + 0x14],	%f10
	edge32	%i5,	%l3,	%i7
	alignaddr	%o3,	%g4,	%o0
	udivx	%i3,	0x0E1E,	%g7
	st	%f14,	[%l7 + 0x0C]
	stb	%l4,	[%l7 + 0x1A]
	sth	%i0,	[%l7 + 0x64]
	lduh	[%l7 + 0x7C],	%i4
	ldd	[%l7 + 0x18],	%f6
	fmovdcs	%xcc,	%f10,	%f14
	ldsh	[%l7 + 0x70],	%o6
	tgu	%xcc,	0x7
	ldsh	[%l7 + 0x4C],	%i6
	movcc	%xcc,	%l1,	%o7
	stx	%g5,	[%l7 + 0x40]
	ld	[%l7 + 0x58],	%f6
	fnot1	%f4,	%f4
	andn	%l5,	0x05CE,	%o1
	tpos	%xcc,	0x7
	edge32n	%g3,	%o4,	%i2
	ldsw	[%l7 + 0x20],	%g2
	lduh	[%l7 + 0x24],	%g6
	move	%xcc,	%l6,	%g1
	std	%f4,	[%l7 + 0x48]
	std	%f0,	[%l7 + 0x48]
	movrgez	%l2,	0x2BA,	%i1
	mova	%xcc,	%o5,	%l0
	ld	[%l7 + 0x4C],	%f10
	ldx	[%l7 + 0x38],	%o2
	tvc	%icc,	0x0
	subc	%i5,	0x01AF,	%i7
	stw	%l3,	[%l7 + 0x74]
	smulcc	%g4,	0x04D1,	%o0
	stx	%i3,	[%l7 + 0x18]
	movcc	%xcc,	%o3,	%l4
	lduw	[%l7 + 0x70],	%g7
	ld	[%l7 + 0x08],	%f11
	st	%f8,	[%l7 + 0x68]
	stb	%i4,	[%l7 + 0x5F]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type f   	: 101
!	Type cti   	: 61
!	Type i   	: 333
!	Type l   	: 505
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
main_t7:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x1,	%g2
	set	0x1,	%g3
	set	0x8,	%g4
	set	0xB,	%g5
	set	0xE,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x7,	%i1
	set	-0xD,	%i2
	set	-0xD,	%i3
	set	-0x2,	%i4
	set	-0x1,	%i5
	set	-0xD,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x5E44AA90,	%l0
	set	0x63C870E5,	%l1
	set	0x4958255D,	%l2
	set	0x41065520,	%l3
	set	0x1EEC67AE,	%l4
	set	0x28C759C0,	%l5
	set	0x1AFDFA13,	%l6
	!# Output registers
	set	0x1D81,	%o0
	set	0x19F2,	%o1
	set	-0x0F36,	%o2
	set	-0x0A2E,	%o3
	set	-0x0604,	%o4
	set	-0x054C,	%o5
	set	-0x11F7,	%o6
	set	0x0DE6,	%o7

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

	ldx	[%l7 + 0x40],	%o6
	fblg,a	%fcc1,	loop_1408
loop_1408:
	fbuge,a	%fcc0,	loop_1409
loop_1409:
	fmovrdlz	%i0,	%f4,	%f4
	fnor	%f10,	%f0,	%f8
	brgz	%i6,	loop_1410
loop_1410:
	fnors	%f7,	%f2,	%f0
	fbu,a	%fcc3,	loop_1411
loop_1411:
	brlez	%o7,	loop_1412
loop_1412:
	ba,pn	%xcc,	loop_1413
loop_1413:
	bpos,a,pt	%xcc,	loop_1414
loop_1414:
	fcmpne32	%f10,	%f8,	%g5
	stx	%l1,	[%l7 + 0x10]
	fpadd16	%f10,	%f0,	%f6
	fmovrslez	%o1,	%f6,	%f11
	movge	%icc,	%l5,	%o4
	fba,a	%fcc1,	loop_1415
loop_1415:
	fzero	%f2
	ldub	[%l7 + 0x34],	%g3
	addc	%i2,	%g2,	%g6
	fbu	%fcc2,	loop_1416
loop_1416:
	nop
	setx loop_1417, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1417:
	fnegs	%f14,	%f4
	fmovde	%xcc,	%f15,	%f5
	fnands	%f11,	%f10,	%f5
	ldsh	[%l7 + 0x6A],	%l6
	bcs,a	%xcc,	loop_1418
loop_1418:
	nop
	setx loop_1419, %l0, %l1
	jmpl %l1, %l2
loop_1419:
	fcmpeq16	%f12,	%f12,	%i1
	fmovsge	%xcc,	%f5,	%f6
	sth	%g1,	[%l7 + 0x24]
	fcmpne16	%f10,	%f12,	%l0
	siam	0x7
	siam	0x3
	fbo,a	%fcc0,	loop_1420
loop_1420:
	std	%f12,	[%l7 + 0x08]
	fbg,a	%fcc1,	loop_1421
loop_1421:
	fmovrsgez	%o5,	%f15,	%f2
	fbuge	%fcc1,	loop_1422
loop_1422:
	fmovdn	%xcc,	%f11,	%f0
	fbl	%fcc0,	loop_1423
loop_1423:
	brlez,a	%i5,	loop_1424
loop_1424:
	fmovrsne	%o2,	%f8,	%f7
	fpackfix	%f12,	%f12
	ldsh	[%l7 + 0x26],	%i7
	fbule,a	%fcc2,	loop_1425
loop_1425:
	fand	%f4,	%f14,	%f10
	std	%f6,	[%l7 + 0x70]
	fmovdcs	%xcc,	%f9,	%f2
	ld	[%l7 + 0x18],	%f9
	bne,a,pn	%icc,	loop_1426
loop_1426:
	fnand	%f14,	%f12,	%f8
	brnz	%g4,	loop_1427
loop_1427:
	fandnot1	%f6,	%f2,	%f12
	fbul	%fcc1,	loop_1428
loop_1428:
	bl,pt	%xcc,	loop_1429
loop_1429:
	fmovdpos	%icc,	%f0,	%f11
	fandnot1	%f12,	%f0,	%f14
	fmovsg	%xcc,	%f8,	%f10
	st	%f10,	[%l7 + 0x28]
	brgz	%o0,	loop_1430
loop_1430:
	fmovrdgez	%i3,	%f0,	%f12
	fbge	%fcc1,	loop_1431
loop_1431:
	fmovrsgz	%o3,	%f14,	%f10
	fbug,a	%fcc1,	loop_1432
loop_1432:
	lduw	[%l7 + 0x78],	%l4
	fbge	%fcc1,	loop_1433
loop_1433:
	brnz,a	%l3,	loop_1434
loop_1434:
	call	loop_1435
loop_1435:
	fmovrdlez	%i4,	%f14,	%f4
	fexpand	%f2,	%f6
	movcs	%icc,	%o6,	%g7
	fsrc1s	%f0,	%f6
	bpos	loop_1436
loop_1436:
	brz,a	%i6,	loop_1437
loop_1437:
	fornot1	%f6,	%f10,	%f6
	nop
	setx loop_1438, %l0, %l1
	jmpl %l1, %i0
loop_1438:
	fmovsne	%xcc,	%f4,	%f13
	fmovsg	%icc,	%f11,	%f3
	fblg,a	%fcc0,	loop_1439
loop_1439:
	fbu,a	%fcc2,	loop_1440
loop_1440:
	bg,pt	%xcc,	loop_1441
loop_1441:
	fxnors	%f7,	%f12,	%f0
	fbule,a	%fcc1,	loop_1442
loop_1442:
	lduw	[%l7 + 0x7C],	%o7
	call	loop_1443
loop_1443:
	edge8	%l1,	%g5,	%l5
	fmovrdgz	%o4,	%f14,	%f12
	fmovsn	%icc,	%f3,	%f9
	fmovscc	%icc,	%f15,	%f12
	fbl,a	%fcc3,	loop_1444
loop_1444:
	fpack16	%f8,	%f1
	fmovdvs	%icc,	%f14,	%f8
	bvc,a,pt	%icc,	loop_1445
loop_1445:
	udiv	%g3,	0x0AC8,	%i2
	fpmerge	%f5,	%f4,	%f4
	ldsw	[%l7 + 0x78],	%g2
	ldsw	[%l7 + 0x64],	%g6
	fmovdcs	%xcc,	%f9,	%f1
	brlez,a	%o1,	loop_1446
loop_1446:
	fbge,a	%fcc1,	loop_1447
loop_1447:
	bneg	%icc,	loop_1448
loop_1448:
	brgz	%l6,	loop_1449
loop_1449:
	std	%f14,	[%l7 + 0x60]
	fmul8x16au	%f7,	%f5,	%f4
	lduh	[%l7 + 0x28],	%i1
	stw	%g1,	[%l7 + 0x60]
	fmovsa	%xcc,	%f15,	%f13
	fsrc1s	%f12,	%f7
	ldsb	[%l7 + 0x2D],	%l2
	fabsd	%f14,	%f2
	brlz,a	%l0,	loop_1450
loop_1450:
	fmovrsne	%i5,	%f1,	%f8
	fbe,a	%fcc0,	loop_1451
loop_1451:
	bgu,a,pt	%xcc,	loop_1452
loop_1452:
	bleu,a,pt	%icc,	loop_1453
loop_1453:
	fmovse	%icc,	%f13,	%f6
	fones	%f0
	fabss	%f8,	%f2
	brgz,a	%o5,	loop_1454
loop_1454:
	fmovrsgez	%o2,	%f1,	%f5
	fmovsn	%icc,	%f8,	%f4
	fands	%f9,	%f2,	%f5
	fbuge	%fcc1,	loop_1455
loop_1455:
	brz,a	%i7,	loop_1456
loop_1456:
	fbuge,a	%fcc3,	loop_1457
loop_1457:
	nop
	setx loop_1458, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1458:
	ldsb	[%l7 + 0x6F],	%o0
	fcmple32	%f6,	%f2,	%i3
	bn,a,pn	%icc,	loop_1459
loop_1459:
	fmul8ulx16	%f14,	%f0,	%f14
	nop
	setx loop_1460, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1460:
	be,a	loop_1461
loop_1461:
	ldx	[%l7 + 0x78],	%o3
	fbg	%fcc2,	loop_1462
loop_1462:
	fbule,a	%fcc3,	loop_1463
loop_1463:
	fnot1s	%f3,	%f10
	fpack32	%f4,	%f12,	%f8
	bneg,pt	%xcc,	loop_1464
loop_1464:
	fmovdl	%xcc,	%f13,	%f13
	ld	[%l7 + 0x60],	%f0
	fbne,a	%fcc0,	loop_1465
loop_1465:
	fnors	%f13,	%f5,	%f8
	fmovsgu	%xcc,	%f11,	%f2
	ldsb	[%l7 + 0x18],	%g4
	brnz,a	%l3,	loop_1466
loop_1466:
	fpadd32	%f8,	%f12,	%f2
	ld	[%l7 + 0x24],	%f14
	fmuld8ulx16	%f13,	%f15,	%f2
	fmovsne	%icc,	%f15,	%f8
	ldd	[%l7 + 0x68],	%f6
	fbge,a	%fcc1,	loop_1467
loop_1467:
	fpsub16	%f6,	%f6,	%f10
	fbg	%fcc3,	loop_1468
loop_1468:
	fpackfix	%f6,	%f15
	nop
	setx loop_1469, %l0, %l1
	jmpl %l1, %l4
loop_1469:
	fbule	%fcc1,	loop_1470
loop_1470:
	nop
	setx loop_1471, %l0, %l1
	jmpl %l1, %i4
loop_1471:
	std	%f8,	[%l7 + 0x38]
	fornot2	%f6,	%f2,	%f2
	fbn	%fcc1,	loop_1472
loop_1472:
	fpackfix	%f4,	%f1
	fba,a	%fcc3,	loop_1473
loop_1473:
	be,a	loop_1474
loop_1474:
	fbuge,a	%fcc3,	loop_1475
loop_1475:
	fpadd16	%f10,	%f0,	%f4
	fmuld8ulx16	%f3,	%f15,	%f6
	fabsd	%f10,	%f8
	fands	%f9,	%f5,	%f0
	fbn	%fcc1,	loop_1476
loop_1476:
	fpadd16s	%f4,	%f3,	%f6
	brlez,a	%o6,	loop_1477
loop_1477:
	bcc,pt	%icc,	loop_1478
loop_1478:
	fpadd16	%f14,	%f4,	%f14
	fmovsne	%icc,	%f7,	%f14
	fbu,a	%fcc0,	loop_1479
loop_1479:
	fbne,a	%fcc2,	loop_1480
loop_1480:
	fornot2	%f14,	%f10,	%f4
	bgu,a	%xcc,	loop_1481
loop_1481:
	stb	%i6,	[%l7 + 0x28]
	fmovdge	%icc,	%f0,	%f0
	sth	%i0,	[%l7 + 0x6A]
	fsrc2	%f6,	%f6
	ld	[%l7 + 0x40],	%f14
	fmovsvs	%icc,	%f15,	%f1
	fcmpne32	%f2,	%f2,	%g7
	alignaddrl	%o7,	%l1,	%l5
	fmovrdlez	%o4,	%f4,	%f12
	fbug,a	%fcc2,	loop_1482
loop_1482:
	fmovrse	%g5,	%f2,	%f0
	fbu,a	%fcc2,	loop_1483
loop_1483:
	lduw	[%l7 + 0x74],	%i2
	fbge	%fcc0,	loop_1484
loop_1484:
	fmovrslez	%g2,	%f2,	%f8
	fmovrdgez	%g6,	%f2,	%f6
	fpadd16	%f14,	%f0,	%f0
	fmul8x16au	%f13,	%f2,	%f2
	fandnot2	%f6,	%f4,	%f14
	brz	%g3,	loop_1485
loop_1485:
	brnz,a	%l6,	loop_1486
loop_1486:
	tvc	%xcc,	0x5
	fpadd32	%f6,	%f4,	%f0
	fbg,a	%fcc3,	loop_1487
loop_1487:
	be	%icc,	loop_1488
loop_1488:
	fmovrdgz	%i1,	%f6,	%f6
	bvc,pn	%xcc,	loop_1489
loop_1489:
	fmovsgu	%xcc,	%f4,	%f12
	fbl	%fcc2,	loop_1490
loop_1490:
	ldsh	[%l7 + 0x26],	%g1
	fmovscs	%icc,	%f11,	%f7
	pdist	%f6,	%f12,	%f14
	fcmpeq16	%f6,	%f12,	%o1
	ldx	[%l7 + 0x78],	%l0
	fzero	%f0
	fnor	%f10,	%f0,	%f14
	fxnors	%f7,	%f11,	%f9
	bvs	%icc,	loop_1491
loop_1491:
	fble	%fcc0,	loop_1492
loop_1492:
	fornot2	%f6,	%f4,	%f12
	ldub	[%l7 + 0x5B],	%i5
	fbu	%fcc1,	loop_1493
loop_1493:
	bgu,a	%xcc,	loop_1494
loop_1494:
	fmovsgu	%icc,	%f8,	%f10
	fsrc1	%f10,	%f10
	nop
	setx loop_1495, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1495:
	bvs,a,pt	%xcc,	loop_1496
loop_1496:
	fbne	%fcc0,	loop_1497
loop_1497:
	fsrc1	%f14,	%f2
	fbule	%fcc0,	loop_1498
loop_1498:
	movrne	%o5,	%o2,	%i7
	bge	%xcc,	loop_1499
loop_1499:
	fcmpeq16	%f10,	%f6,	%o0
	fandnot1	%f4,	%f14,	%f2
	fmul8x16al	%f6,	%f7,	%f14
	fbug	%fcc0,	loop_1500
loop_1500:
	bge,a,pn	%icc,	loop_1501
loop_1501:
	bneg	loop_1502
loop_1502:
	fmovrde	%l2,	%f4,	%f0
	fbo	%fcc3,	loop_1503
loop_1503:
	fmovda	%icc,	%f12,	%f6
	movrlez	%i3,	0x0C3,	%g4
	fpadd32s	%f8,	%f6,	%f14
	bne,pt	%xcc,	loop_1504
loop_1504:
	fxors	%f13,	%f6,	%f1
	std	%f0,	[%l7 + 0x40]
	fmovsneg	%icc,	%f6,	%f3
	tg	%icc,	0x3
	fbn,a	%fcc3,	loop_1505
loop_1505:
	fmovdne	%xcc,	%f8,	%f1
	fbne	%fcc0,	loop_1506
loop_1506:
	fcmpes	%fcc2,	%f0,	%f5
	fbl,a	%fcc1,	loop_1507
loop_1507:
	fabss	%f3,	%f5
	fmovdvs	%icc,	%f11,	%f3
	fmovdneg	%icc,	%f1,	%f15
	fxnor	%f0,	%f8,	%f8
	fble	%fcc3,	loop_1508
loop_1508:
	fmovse	%icc,	%f11,	%f9
	fbule	%fcc2,	loop_1509
loop_1509:
	fmovrsne	%o3,	%f12,	%f14
	fbg,a	%fcc1,	loop_1510
loop_1510:
	fcmpeq16	%f8,	%f4,	%l3
	fbn,a	%fcc3,	loop_1511
loop_1511:
	brgez,a	%l4,	loop_1512
loop_1512:
	fnand	%f0,	%f4,	%f4
	bn,pt	%xcc,	loop_1513
loop_1513:
	bneg	loop_1514
loop_1514:
	fmovsl	%xcc,	%f6,	%f11
	brz	%o6,	loop_1515
loop_1515:
	fpsub32	%f12,	%f10,	%f4
	fbg,a	%fcc2,	loop_1516
loop_1516:
	umulcc	%i6,	0x0E9D,	%i0
	fsrc2s	%f5,	%f8
	bgu	%xcc,	loop_1517
loop_1517:
	bge,a	%xcc,	loop_1518
loop_1518:
	bgu	%xcc,	loop_1519
loop_1519:
	sllx	%i4,	%o7,	%l1
	bge	loop_1520
loop_1520:
	bpos	%xcc,	loop_1521
loop_1521:
	brnz	%l5,	loop_1522
loop_1522:
	ldsb	[%l7 + 0x46],	%o4
	fbn	%fcc3,	loop_1523
loop_1523:
	fmul8x16	%f10,	%f2,	%f12
	fnors	%f6,	%f6,	%f0
	fmovs	%f5,	%f5
	fornot1s	%f5,	%f2,	%f15
	lduw	[%l7 + 0x34],	%g5
	bg	loop_1524
loop_1524:
	fmovdleu	%xcc,	%f14,	%f4
	bg,a,pt	%icc,	loop_1525
loop_1525:
	nop
	setx loop_1526, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1526:
	smulcc	%g7,	0x173C,	%g2
	ba,a	loop_1527
loop_1527:
	lduw	[%l7 + 0x50],	%g6
	fmovd	%f8,	%f0
	sdiv	%i2,	0x0F87,	%g3
	fmovdne	%xcc,	%f8,	%f5
	be,pn	%xcc,	loop_1528
loop_1528:
	fmovspos	%xcc,	%f0,	%f11
	fmovdcs	%icc,	%f5,	%f12
	nop
	setx loop_1529, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1529:
	fmovdcs	%xcc,	%f2,	%f4
	brlez,a	%l6,	loop_1530
loop_1530:
	fmul8x16au	%f1,	%f12,	%f12
	fnot1	%f2,	%f4
	fsrc2	%f6,	%f2
	stb	%i1,	[%l7 + 0x17]
	fnors	%f5,	%f9,	%f13
	fpsub32s	%f11,	%f6,	%f2
	fmovrsgez	%g1,	%f0,	%f4
	fxnor	%f10,	%f6,	%f4
	fbg	%fcc3,	loop_1531
loop_1531:
	fpsub32	%f12,	%f12,	%f12
	ldub	[%l7 + 0x30],	%o1
	fbe	%fcc2,	loop_1532
loop_1532:
	fmovrsgez	%i5,	%f3,	%f10
	fornot2s	%f12,	%f7,	%f15
	fnors	%f13,	%f14,	%f13
	pdist	%f0,	%f14,	%f2
	bvc	loop_1533
loop_1533:
	fpadd16	%f12,	%f6,	%f14
	brgez,a	%l0,	loop_1534
loop_1534:
	fmovrse	%o5,	%f15,	%f12
	siam	0x2
	fmovdle	%icc,	%f5,	%f0
	nop
	setx loop_1535, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1535:
	fpsub32	%f12,	%f6,	%f0
	ldx	[%l7 + 0x60],	%i7
	fmovdn	%icc,	%f14,	%f5
	fbo	%fcc1,	loop_1536
loop_1536:
	fblg,a	%fcc3,	loop_1537
loop_1537:
	bl	loop_1538
loop_1538:
	std	%f14,	[%l7 + 0x28]
	fands	%f14,	%f1,	%f1
	be,a	%icc,	loop_1539
loop_1539:
	brlez	%o2,	loop_1540
loop_1540:
	bneg	%icc,	loop_1541
loop_1541:
	fmovrdlez	%o0,	%f2,	%f4
	ble,a,pt	%icc,	loop_1542
loop_1542:
	fcmped	%fcc0,	%f12,	%f10
	fpadd32	%f2,	%f4,	%f2
	ba	%xcc,	loop_1543
loop_1543:
	bvc,a	%icc,	loop_1544
loop_1544:
	brlz,a	%l2,	loop_1545
loop_1545:
	fmovrsgez	%g4,	%f1,	%f1
	fexpand	%f1,	%f2
	fbul,a	%fcc3,	loop_1546
loop_1546:
	std	%f12,	[%l7 + 0x70]
	bgu	loop_1547
loop_1547:
	fbne	%fcc0,	loop_1548
loop_1548:
	brgz,a	%o3,	loop_1549
loop_1549:
	ldub	[%l7 + 0x33],	%i3
	fornot2	%f10,	%f12,	%f2
	fandnot2	%f4,	%f10,	%f6
	fbl	%fcc0,	loop_1550
loop_1550:
	ldub	[%l7 + 0x5A],	%l4
	fone	%f8
	stb	%o6,	[%l7 + 0x0B]
	fbl	%fcc3,	loop_1551
loop_1551:
	fnegs	%f10,	%f15
	nop
	setx loop_1552, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1552:
	fbne,a	%fcc2,	loop_1553
loop_1553:
	fmovdl	%icc,	%f4,	%f14
	fble	%fcc3,	loop_1554
loop_1554:
	fbn,a	%fcc0,	loop_1555
loop_1555:
	fbo	%fcc0,	loop_1556
loop_1556:
	udivx	%i6,	0x1442,	%i0
	fmovdg	%icc,	%f4,	%f14
	ldsh	[%l7 + 0x46],	%i4
	pdist	%f12,	%f0,	%f12
	fnor	%f8,	%f6,	%f6
	bn,pn	%icc,	loop_1557
loop_1557:
	fcmpes	%fcc2,	%f13,	%f5
	sdiv	%l3,	0x009E,	%l1
	bg,a	loop_1558
loop_1558:
	fbne,a	%fcc2,	loop_1559
loop_1559:
	fble	%fcc3,	loop_1560
loop_1560:
	bvc,a	%xcc,	loop_1561
loop_1561:
	fandnot1	%f6,	%f0,	%f4
	nop
	setx loop_1562, %l0, %l1
	jmpl %l1, %l5
loop_1562:
	be,pn	%xcc,	loop_1563
loop_1563:
	fxor	%f0,	%f2,	%f14
	fmovd	%f14,	%f0
	fmovdvs	%xcc,	%f10,	%f3
	fbne,a	%fcc0,	loop_1564
loop_1564:
	fmovsge	%xcc,	%f13,	%f4
	bne,a	%xcc,	loop_1565
loop_1565:
	fcmple32	%f8,	%f10,	%o7
	bgu,a,pt	%xcc,	loop_1566
loop_1566:
	tsubcc	%o4,	%g5,	%g2
	nop
	setx loop_1567, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1567:
	fmovrdgz	%g6,	%f2,	%f14
	be	%icc,	loop_1568
loop_1568:
	fnor	%f6,	%f6,	%f2
	st	%f13,	[%l7 + 0x50]
	fbge	%fcc0,	loop_1569
loop_1569:
	brgz	%g7,	loop_1570
loop_1570:
	edge16n	%i2,	%l6,	%g3
	fmovrdgez	%g1,	%f6,	%f2
	sth	%i1,	[%l7 + 0x7A]
	fmovrse	%i5,	%f1,	%f11
	brgez	%o1,	loop_1571
loop_1571:
	nop
	setx loop_1572, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1572:
	fpadd32s	%f7,	%f10,	%f8
	fornot2s	%f0,	%f2,	%f9
	fsrc1s	%f3,	%f12
	fcmple32	%f0,	%f10,	%l0
	fmovd	%f4,	%f0
	fba	%fcc3,	loop_1573
loop_1573:
	nop
	setx loop_1574, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1574:
	fbu	%fcc2,	loop_1575
loop_1575:
	fmul8x16al	%f14,	%f7,	%f0
	fnors	%f14,	%f0,	%f12
	nop
	setx loop_1576, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1576:
	fmovsa	%icc,	%f5,	%f9
	fbule	%fcc2,	loop_1577
loop_1577:
	bcs,a	%icc,	loop_1578
loop_1578:
	brgez,a	%i7,	loop_1579
loop_1579:
	fbu,a	%fcc0,	loop_1580
loop_1580:
	brnz,a	%o2,	loop_1581
loop_1581:
	fbl,a	%fcc0,	loop_1582
loop_1582:
	bne,a	%icc,	loop_1583
loop_1583:
	fmovde	%xcc,	%f9,	%f9
	fmovdvc	%icc,	%f3,	%f10
	fmovs	%f0,	%f6
	sllx	%o5,	0x0A,	%l2
	bne,a,pn	%icc,	loop_1584
loop_1584:
	fble	%fcc3,	loop_1585
loop_1585:
	bvc,a	%xcc,	loop_1586
loop_1586:
	brlez,a	%g4,	loop_1587
loop_1587:
	fornot2s	%f13,	%f3,	%f10
	brgz	%o3,	loop_1588
loop_1588:
	bn,a,pn	%icc,	loop_1589
loop_1589:
	fmovdpos	%icc,	%f9,	%f14
	fornot2s	%f15,	%f7,	%f8
	nop
	setx loop_1590, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1590:
	ldsw	[%l7 + 0x08],	%i3
	ld	[%l7 + 0x40],	%f1
	fmovsg	%xcc,	%f12,	%f12
	fbne	%fcc1,	loop_1591
loop_1591:
	brz,a	%l4,	loop_1592
loop_1592:
	bvc	loop_1593
loop_1593:
	fbue,a	%fcc3,	loop_1594
loop_1594:
	bn	%xcc,	loop_1595
loop_1595:
	fmovsgu	%icc,	%f2,	%f2
	fors	%f8,	%f9,	%f14
	bleu,pn	%icc,	loop_1596
loop_1596:
	ldsh	[%l7 + 0x4A],	%o0
	fsrc1	%f14,	%f14
	fmovrslz	%i6,	%f4,	%f11
	fcmpgt32	%f6,	%f10,	%i0
	fbu	%fcc3,	loop_1597
loop_1597:
	fbue	%fcc1,	loop_1598
loop_1598:
	nop
	setx loop_1599, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1599:
	taddcctv	%i4,	%o6,	%l1
	fnegs	%f15,	%f9
	fsrc1s	%f11,	%f13
	fmul8x16al	%f10,	%f4,	%f4
	fble	%fcc3,	loop_1600
loop_1600:
	fmul8ulx16	%f10,	%f8,	%f4
	fxor	%f6,	%f14,	%f12
	fmovdpos	%icc,	%f12,	%f10
	bne	loop_1601
loop_1601:
	fmovde	%icc,	%f11,	%f11
	movre	%l3,	0x070,	%o7
	fbul	%fcc3,	loop_1602
loop_1602:
	fmovsn	%icc,	%f3,	%f15
	fors	%f6,	%f9,	%f10
	fmovdgu	%icc,	%f8,	%f2
	fmul8sux16	%f6,	%f0,	%f6
	bcc,a	loop_1603
loop_1603:
	fbul	%fcc3,	loop_1604
loop_1604:
	nop
	setx loop_1605, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1605:
	fbuge	%fcc1,	loop_1606
loop_1606:
	bvs,pn	%xcc,	loop_1607
loop_1607:
	fbn,a	%fcc0,	loop_1608
loop_1608:
	bcc,a	%xcc,	loop_1609
loop_1609:
	edge16	%l5,	%o4,	%g2
	fmovdcs	%icc,	%f1,	%f4
	fcmpeq32	%f2,	%f8,	%g5
	bvs	%icc,	loop_1610
loop_1610:
	brgz	%g7,	loop_1611
loop_1611:
	fmovde	%xcc,	%f11,	%f4
	fzeros	%f15
	fands	%f7,	%f13,	%f3
	bcc,a	loop_1612
loop_1612:
	fmuld8sux16	%f9,	%f4,	%f6
	fcmple16	%f12,	%f14,	%i2
	ba,a	loop_1613
loop_1613:
	bcc,a	%xcc,	loop_1614
loop_1614:
	ldub	[%l7 + 0x32],	%g6
	fmovrdgez	%l6,	%f4,	%f14
	bpos,a,pt	%icc,	loop_1615
loop_1615:
	fpadd16	%f4,	%f4,	%f2
	fnegd	%f12,	%f10
	ldub	[%l7 + 0x2E],	%g3
	ldd	[%l7 + 0x50],	%f8
	st	%f10,	[%l7 + 0x64]
	fbo	%fcc0,	loop_1616
loop_1616:
	fbule	%fcc3,	loop_1617
loop_1617:
	bneg,a	loop_1618
loop_1618:
	fbo	%fcc2,	loop_1619
loop_1619:
	stx	%g1,	[%l7 + 0x58]
	brgz	%i5,	loop_1620
loop_1620:
	fmuld8sux16	%f7,	%f13,	%f12
	fmovdne	%xcc,	%f7,	%f15
	ldsh	[%l7 + 0x0E],	%i1
	fcmpgt32	%f8,	%f8,	%l0
	fcmpne32	%f10,	%f10,	%i7
	fmul8x16	%f1,	%f0,	%f0
	fands	%f5,	%f14,	%f15
	fmovscs	%icc,	%f9,	%f6
	brgz,a	%o1,	loop_1621
loop_1621:
	fmovsleu	%xcc,	%f11,	%f1
	bl,a	loop_1622
loop_1622:
	fpack32	%f8,	%f0,	%f6
	fbuge	%fcc2,	loop_1623
loop_1623:
	stw	%o5,	[%l7 + 0x58]
	brlez,a	%o2,	loop_1624
loop_1624:
	fbn,a	%fcc1,	loop_1625
loop_1625:
	fmovsleu	%icc,	%f12,	%f0
	fcmpd	%fcc0,	%f12,	%f10
	nop
	setx loop_1626, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1626:
	nop
	setx loop_1627, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1627:
	fmovrdgz	%l2,	%f6,	%f4
	fmul8sux16	%f0,	%f0,	%f0
	taddcctv	%o3,	0x1CE2,	%i3
	fmovrdgez	%g4,	%f2,	%f6
	fmovsne	%icc,	%f1,	%f2
	bvc	%icc,	loop_1628
loop_1628:
	nop
	setx loop_1629, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1629:
	fbule,a	%fcc0,	loop_1630
loop_1630:
	ldsb	[%l7 + 0x1C],	%l4
	faligndata	%f12,	%f4,	%f14
	brlez	%o0,	loop_1631
loop_1631:
	fblg,a	%fcc3,	loop_1632
loop_1632:
	fblg,a	%fcc0,	loop_1633
loop_1633:
	fnegs	%f14,	%f6
	fpadd32s	%f5,	%f5,	%f2
	ldub	[%l7 + 0x26],	%i6
	sth	%i4,	[%l7 + 0x4A]
	fmovscc	%icc,	%f8,	%f14
	fand	%f12,	%f0,	%f14
	fmovsa	%icc,	%f14,	%f14
	bvc,pn	%icc,	loop_1634
loop_1634:
	fmovd	%f14,	%f0
	fmovsge	%xcc,	%f6,	%f5
	fmovsneg	%xcc,	%f13,	%f11
	be,pt	%xcc,	loop_1635
loop_1635:
	bneg,a	%icc,	loop_1636
loop_1636:
	fzeros	%f14
	bvs,a,pt	%icc,	loop_1637
loop_1637:
	fmul8x16	%f15,	%f10,	%f0
	fpmerge	%f8,	%f11,	%f10
	fandnot1s	%f4,	%f15,	%f0
	bne,pn	%xcc,	loop_1638
loop_1638:
	brgz,a	%i0,	loop_1639
loop_1639:
	fbl	%fcc0,	loop_1640
loop_1640:
	bl,a,pt	%xcc,	loop_1641
loop_1641:
	fmovdgu	%icc,	%f7,	%f6
	fbue,a	%fcc1,	loop_1642
loop_1642:
	fbug	%fcc3,	loop_1643
loop_1643:
	brlez	%o6,	loop_1644
loop_1644:
	fmovdcs	%icc,	%f15,	%f3
	fxnor	%f6,	%f10,	%f14
	ba,a,pt	%icc,	loop_1645
loop_1645:
	fsrc1	%f0,	%f12
	ba,pn	%xcc,	loop_1646
loop_1646:
	brz,a	%l3,	loop_1647
loop_1647:
	bvs,pt	%xcc,	loop_1648
loop_1648:
	fcmpgt32	%f10,	%f12,	%o7
	fmovdcs	%xcc,	%f1,	%f13
	udivx	%l5,	0x0AEF,	%l1
	fbne,a	%fcc1,	loop_1649
loop_1649:
	fand	%f0,	%f8,	%f6
	fmovde	%xcc,	%f9,	%f10
	fbue	%fcc0,	loop_1650
loop_1650:
	fbo	%fcc0,	loop_1651
loop_1651:
	fxor	%f14,	%f8,	%f4
	fpsub16s	%f10,	%f6,	%f6
	nop
	setx loop_1652, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1652:
	fxnors	%f13,	%f2,	%f10
	fmovrsgez	%o4,	%f15,	%f8
	fbge	%fcc2,	loop_1653
loop_1653:
	bpos,pt	%xcc,	loop_1654
loop_1654:
	bcc	loop_1655
loop_1655:
	bvc,a	%xcc,	loop_1656
loop_1656:
	movvc	%icc,	%g2,	%g5
	be	%icc,	loop_1657
loop_1657:
	brnz,a	%g7,	loop_1658
loop_1658:
	fmovsle	%xcc,	%f14,	%f4
	be,a,pt	%xcc,	loop_1659
loop_1659:
	fmovrslz	%g6,	%f3,	%f3
	fbe,a	%fcc2,	loop_1660
loop_1660:
	fpsub32	%f14,	%f14,	%f0
	bgu,a,pn	%xcc,	loop_1661
loop_1661:
	fmovdn	%xcc,	%f11,	%f4
	call	loop_1662
loop_1662:
	fone	%f6
	nop
	setx loop_1663, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1663:
	fmovsvc	%xcc,	%f13,	%f8
	fmovdne	%xcc,	%f6,	%f0
	bg,pt	%xcc,	loop_1664
loop_1664:
	fbuge,a	%fcc3,	loop_1665
loop_1665:
	stb	%l6,	[%l7 + 0x7C]
	fbug	%fcc2,	loop_1666
loop_1666:
	bcs,a,pn	%icc,	loop_1667
loop_1667:
	fexpand	%f11,	%f10
	bge,a	%xcc,	loop_1668
loop_1668:
	fxnor	%f8,	%f6,	%f8
	ldsb	[%l7 + 0x3B],	%i2
	bgu	loop_1669
loop_1669:
	fmovdcs	%xcc,	%f9,	%f11
	fbe	%fcc2,	loop_1670
loop_1670:
	bn,a	%xcc,	loop_1671
loop_1671:
	fbn	%fcc0,	loop_1672
loop_1672:
	fabss	%f1,	%f10
	siam	0x5
	ble,a,pn	%xcc,	loop_1673
loop_1673:
	ldsh	[%l7 + 0x42],	%g1
	fba,a	%fcc1,	loop_1674
loop_1674:
	subc	%i5,	0x1571,	%i1
	fbue,a	%fcc2,	loop_1675
loop_1675:
	nop
	setx loop_1676, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1676:
	fnor	%f8,	%f10,	%f2
	fbne	%fcc1,	loop_1677
loop_1677:
	fbue,a	%fcc2,	loop_1678
loop_1678:
	fornot1	%f8,	%f6,	%f10
	bge,a	%xcc,	loop_1679
loop_1679:
	fbge,a	%fcc0,	loop_1680
loop_1680:
	fmovrslz	%l0,	%f5,	%f13
	fmovrdgz	%g3,	%f10,	%f4
	bpos,pt	%icc,	loop_1681
loop_1681:
	fmovs	%f6,	%f11
	brlz	%o1,	loop_1682
loop_1682:
	fandnot2	%f2,	%f10,	%f14
	fandnot1	%f6,	%f0,	%f14
	fmovrdne	%o5,	%f8,	%f6
	fbg,a	%fcc0,	loop_1683
loop_1683:
	fmovdvs	%icc,	%f11,	%f5
	bg,a	%xcc,	loop_1684
loop_1684:
	fmul8x16	%f15,	%f8,	%f6
	brgez	%i7,	loop_1685
loop_1685:
	fcmpeq32	%f2,	%f12,	%o2
	bge,pt	%xcc,	loop_1686
loop_1686:
	brlez	%l2,	loop_1687
loop_1687:
	st	%f9,	[%l7 + 0x08]
	fones	%f13
	fmovsvs	%xcc,	%f2,	%f10
	fzeros	%f13
	fble	%fcc2,	loop_1688
loop_1688:
	fmovdg	%xcc,	%f12,	%f7
	bg,a	loop_1689
loop_1689:
	bneg,a	%xcc,	loop_1690
loop_1690:
	fandnot2s	%f11,	%f5,	%f4
	call	loop_1691
loop_1691:
	fcmple32	%f2,	%f4,	%i3
	lduw	[%l7 + 0x54],	%o3
	bcs,a,pn	%xcc,	loop_1692
loop_1692:
	bn,pn	%icc,	loop_1693
loop_1693:
	fble,a	%fcc1,	loop_1694
loop_1694:
	fcmpne16	%f10,	%f12,	%l4
	nop
	setx loop_1695, %l0, %l1
	jmpl %l1, %g4
loop_1695:
	fpadd32s	%f8,	%f8,	%f15
	ldsh	[%l7 + 0x7E],	%o0
	bgu,pt	%icc,	loop_1696
loop_1696:
	fmovrdlez	%i4,	%f10,	%f4
	fandnot2s	%f15,	%f7,	%f14
	brgez	%i0,	loop_1697
loop_1697:
	fands	%f1,	%f3,	%f5
	bg,a,pt	%xcc,	loop_1698
loop_1698:
	fba	%fcc0,	loop_1699
loop_1699:
	fnand	%f4,	%f0,	%f6
	fmovsn	%icc,	%f11,	%f11
	fmovsgu	%xcc,	%f5,	%f3
	fandnot1s	%f8,	%f4,	%f6
	fbe,a	%fcc0,	loop_1700
loop_1700:
	fexpand	%f0,	%f6
	brlez,a	%i6,	loop_1701
loop_1701:
	bgu,pt	%xcc,	loop_1702
loop_1702:
	fandnot1s	%f15,	%f6,	%f1
	udiv	%o6,	0x0ABF,	%l3
	bneg	loop_1703
loop_1703:
	fxnor	%f10,	%f12,	%f4
	bcc,a	%icc,	loop_1704
loop_1704:
	bpos,a,pn	%icc,	loop_1705
loop_1705:
	fbne	%fcc1,	loop_1706
loop_1706:
	fmovdvc	%xcc,	%f8,	%f0
	fmovsne	%icc,	%f1,	%f12
	fcmpes	%fcc1,	%f6,	%f15
	srax	%o7,	%l5,	%o4
	fmul8ulx16	%f2,	%f6,	%f2
	fmovsl	%icc,	%f13,	%f7
	fmovdcc	%icc,	%f2,	%f0
	fnot1	%f10,	%f8
	fpackfix	%f4,	%f1
	xnorcc	%l1,	0x1EF3,	%g2
	fbul	%fcc1,	loop_1707
loop_1707:
	bn,a,pn	%xcc,	loop_1708
loop_1708:
	bg,pn	%icc,	loop_1709
loop_1709:
	fnot1s	%f8,	%f8
	fnot2	%f2,	%f6
	siam	0x3
	bvc	%xcc,	loop_1710
loop_1710:
	fbue	%fcc3,	loop_1711
loop_1711:
	fcmpne16	%f4,	%f10,	%g5
	sth	%g7,	[%l7 + 0x46]
	brz,a	%l6,	loop_1712
loop_1712:
	fmovdg	%icc,	%f12,	%f10
	srax	%g6,	%i2,	%g1
	fmovsleu	%xcc,	%f11,	%f0
	fcmps	%fcc2,	%f10,	%f1
	ldsw	[%l7 + 0x58],	%i1
	fmovsgu	%xcc,	%f15,	%f11
	bcs,pt	%xcc,	loop_1713
loop_1713:
	bg,a	loop_1714
loop_1714:
	udivcc	%l0,	0x1BD7,	%g3
	ldsb	[%l7 + 0x6A],	%o1
	fmovrsne	%i5,	%f11,	%f14
	fba	%fcc1,	loop_1715
loop_1715:
	fnegd	%f12,	%f10
	brgz,a	%i7,	loop_1716
loop_1716:
	fzero	%f8
	fba,a	%fcc1,	loop_1717
loop_1717:
	bge,a,pt	%icc,	loop_1718
loop_1718:
	fmovscc	%xcc,	%f0,	%f13
	fmovsl	%icc,	%f14,	%f0
	fzero	%f8
	fnor	%f12,	%f8,	%f10
	nop
	setx loop_1719, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1719:
	fmovrdgz	%o5,	%f10,	%f12
	fbule	%fcc0,	loop_1720
loop_1720:
	ble,a,pt	%xcc,	loop_1721
loop_1721:
	std	%f0,	[%l7 + 0x10]
	fpackfix	%f10,	%f9
	tle	%xcc,	0x4
	fbuge	%fcc1,	loop_1722
loop_1722:
	tg	%icc,	0x6
	bleu,a,pt	%icc,	loop_1723
loop_1723:
	bcs,a	loop_1724
loop_1724:
	fbule	%fcc0,	loop_1725
loop_1725:
	bgu,a,pn	%icc,	loop_1726
loop_1726:
	brlez	%o2,	loop_1727
loop_1727:
	bvs,a,pt	%xcc,	loop_1728
loop_1728:
	bneg,a,pn	%xcc,	loop_1729
loop_1729:
	fmovsl	%xcc,	%f9,	%f13
	ldx	[%l7 + 0x40],	%i3
	brlez	%o3,	loop_1730
loop_1730:
	bneg	%xcc,	loop_1731
loop_1731:
	bneg	loop_1732
loop_1732:
	fcmps	%fcc0,	%f4,	%f3
	bpos,a	%icc,	loop_1733
loop_1733:
	brnz,a	%l4,	loop_1734
loop_1734:
	fmul8x16al	%f15,	%f14,	%f0
	lduw	[%l7 + 0x18],	%g4
	brlez	%l2,	loop_1735
loop_1735:
	fbue,a	%fcc3,	loop_1736
loop_1736:
	stb	%i4,	[%l7 + 0x60]
	alignaddrl	%i0,	%i6,	%o0
	fnot2s	%f9,	%f7
	fbe	%fcc1,	loop_1737
loop_1737:
	call	loop_1738
loop_1738:
	fbuge	%fcc0,	loop_1739
loop_1739:
	bneg,pn	%icc,	loop_1740
loop_1740:
	bne,pn	%icc,	loop_1741
loop_1741:
	fbg,a	%fcc0,	loop_1742
loop_1742:
	fbuge,a	%fcc2,	loop_1743
loop_1743:
	fmovrdlez	%l3,	%f8,	%f12
	fble	%fcc2,	loop_1744
loop_1744:
	fmovrde	%o6,	%f12,	%f8
	siam	0x5
	brgz,a	%l5,	loop_1745
loop_1745:
	brgez	%o7,	loop_1746
loop_1746:
	fmovdpos	%icc,	%f4,	%f7
	fnegd	%f8,	%f8
	fbue	%fcc3,	loop_1747
loop_1747:
	ble,a,pn	%xcc,	loop_1748
loop_1748:
	fbg,a	%fcc0,	loop_1749
loop_1749:
	nop
	setx loop_1750, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1750:
	ba	loop_1751
loop_1751:
	fbl,a	%fcc1,	loop_1752
loop_1752:
	fmovsvc	%icc,	%f15,	%f13
	fbl	%fcc2,	loop_1753
loop_1753:
	fmovdgu	%xcc,	%f6,	%f6
	fbge	%fcc1,	loop_1754
loop_1754:
	ld	[%l7 + 0x60],	%f15
	ldub	[%l7 + 0x11],	%o4
	bn,pt	%xcc,	loop_1755
loop_1755:
	brnz	%l1,	loop_1756
loop_1756:
	fzeros	%f11
	brgz,a	%g2,	loop_1757
loop_1757:
	ld	[%l7 + 0x44],	%f14
	fbg,a	%fcc0,	loop_1758
loop_1758:
	fnot2	%f10,	%f8
	fbug	%fcc0,	loop_1759
loop_1759:
	fbule	%fcc1,	loop_1760
loop_1760:
	bneg	loop_1761
loop_1761:
	fmovdcs	%icc,	%f8,	%f6
	fnot2	%f0,	%f14
	bvc,pn	%icc,	loop_1762
loop_1762:
	xor	%g7,	0x01E8,	%g5
	fone	%f8
	fmovrslez	%l6,	%f2,	%f13
	fbule	%fcc2,	loop_1763
loop_1763:
	fmovsne	%icc,	%f10,	%f4
	fmovse	%xcc,	%f12,	%f12
	fmovdcs	%xcc,	%f4,	%f5
	fmovdgu	%icc,	%f4,	%f10
	fcmpes	%fcc0,	%f3,	%f13
	fmovrdne	%g6,	%f2,	%f0
	brnz,a	%g1,	loop_1764
loop_1764:
	brnz,a	%i2,	loop_1765
loop_1765:
	fcmpne32	%f12,	%f12,	%l0
	brgez	%i1,	loop_1766
loop_1766:
	fmovsneg	%icc,	%f1,	%f5
	fornot2	%f14,	%f2,	%f14
	stb	%g3,	[%l7 + 0x5F]
	brnz	%o1,	loop_1767
loop_1767:
	fbe	%fcc2,	loop_1768
loop_1768:
	fcmpgt16	%f12,	%f14,	%i7
	fmovsvc	%icc,	%f0,	%f11
	ldub	[%l7 + 0x39],	%i5
	fbul,a	%fcc1,	loop_1769
loop_1769:
	brz,a	%o2,	loop_1770
loop_1770:
	fcmpne16	%f0,	%f14,	%o5
	fpsub16	%f0,	%f8,	%f12
	fmovdneg	%icc,	%f11,	%f15
	fble	%fcc0,	loop_1771
loop_1771:
	fpack32	%f0,	%f0,	%f0
	fnor	%f2,	%f0,	%f0
	fbne	%fcc0,	loop_1772
loop_1772:
	stw	%i3,	[%l7 + 0x60]
	nop
	setx loop_1773, %l0, %l1
	jmpl %l1, %o3
loop_1773:
	fmovsle	%xcc,	%f15,	%f2
	mulx	%l4,	0x1815,	%g4
	fcmps	%fcc1,	%f2,	%f12
	fmovrsne	%i4,	%f11,	%f10
	fmovrsne	%i0,	%f9,	%f5
	st	%f0,	[%l7 + 0x24]
	fnegd	%f4,	%f4
	fmovrsne	%i6,	%f2,	%f1
	fnors	%f8,	%f1,	%f5
	bpos,a	loop_1774
loop_1774:
	ba,pn	%icc,	loop_1775
loop_1775:
	fbg	%fcc3,	loop_1776
loop_1776:
	fbug,a	%fcc2,	loop_1777
loop_1777:
	fbg,a	%fcc3,	loop_1778
loop_1778:
	fnand	%f10,	%f4,	%f0
	fmovsleu	%xcc,	%f10,	%f12
	fbu,a	%fcc0,	loop_1779
loop_1779:
	fmovrdlez	%l2,	%f6,	%f12
	faligndata	%f2,	%f12,	%f14
	sth	%o0,	[%l7 + 0x4C]
	fmovd	%f6,	%f2
	brgz	%o6,	loop_1780
loop_1780:
	ldsb	[%l7 + 0x69],	%l5
	fbule,a	%fcc0,	loop_1781
loop_1781:
	fmovrslz	%o7,	%f15,	%f5
	brgz,a	%o4,	loop_1782
loop_1782:
	tge	%icc,	0x2
	for	%f4,	%f14,	%f0
	fabss	%f15,	%f5
	fnands	%f3,	%f7,	%f11
	brz	%l3,	loop_1783
loop_1783:
	fnegd	%f14,	%f4
	fandnot1s	%f15,	%f12,	%f15
	bn,a	%icc,	loop_1784
loop_1784:
	fbue	%fcc0,	loop_1785
loop_1785:
	bg	%xcc,	loop_1786
loop_1786:
	andn	%l1,	%g7,	%g2
	fmovdcs	%icc,	%f7,	%f15
	stb	%l6,	[%l7 + 0x7E]
	fbo,a	%fcc2,	loop_1787
loop_1787:
	bvc	loop_1788
loop_1788:
	sth	%g5,	[%l7 + 0x2C]
	fmovse	%icc,	%f4,	%f10
	fcmpes	%fcc3,	%f14,	%f2
	brlz	%g6,	loop_1789
loop_1789:
	bl	loop_1790
loop_1790:
	ldsb	[%l7 + 0x71],	%i2
	fmovrdlez	%g1,	%f8,	%f4
	nop
	setx loop_1791, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1791:
	be,a	loop_1792
loop_1792:
	nop
	setx loop_1793, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1793:
	fbne	%fcc1,	loop_1794
loop_1794:
	bvc,pn	%xcc,	loop_1795
loop_1795:
	ldd	[%l7 + 0x60],	%f12
	fmuld8sux16	%f13,	%f12,	%f4
	sdiv	%l0,	0x0017,	%i1
	fbg	%fcc3,	loop_1796
loop_1796:
	ba,a,pn	%xcc,	loop_1797
loop_1797:
	fbu	%fcc3,	loop_1798
loop_1798:
	fbg,a	%fcc3,	loop_1799
loop_1799:
	ldsh	[%l7 + 0x78],	%o1
	nop
	setx loop_1800, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1800:
	fornot2s	%f8,	%f9,	%f10
	pdist	%f8,	%f0,	%f2
	bvc	loop_1801
loop_1801:
	fmovdne	%xcc,	%f8,	%f10
	fcmped	%fcc3,	%f14,	%f0
	fmovrdlez	%i7,	%f12,	%f8
	fnands	%f1,	%f8,	%f9
	brnz	%i5,	loop_1802
loop_1802:
	bne	%xcc,	loop_1803
loop_1803:
	fble	%fcc1,	loop_1804
loop_1804:
	brlz	%o2,	loop_1805
loop_1805:
	fmovrslz	%o5,	%f12,	%f6
	bg	%xcc,	loop_1806
loop_1806:
	fnegd	%f0,	%f6
	fxnors	%f0,	%f7,	%f0
	brz	%g3,	loop_1807
loop_1807:
	fones	%f7
	fba	%fcc2,	loop_1808
loop_1808:
	ldub	[%l7 + 0x1C],	%i3
	fmovsl	%xcc,	%f5,	%f7
	srax	%o3,	%g4,	%l4
	fmovrdgz	%i0,	%f2,	%f8
	ldsw	[%l7 + 0x74],	%i4
	fmovse	%xcc,	%f11,	%f9
	fbo	%fcc0,	loop_1809
loop_1809:
	fandnot1	%f2,	%f12,	%f2
	stx	%i6,	[%l7 + 0x40]
	and	%l2,	%o6,	%o0
	fbug	%fcc2,	loop_1810
loop_1810:
	bcc,a	%icc,	loop_1811
loop_1811:
	fands	%f11,	%f14,	%f9
	fmovda	%icc,	%f2,	%f3
	fbl	%fcc3,	loop_1812
loop_1812:
	fnot2s	%f14,	%f12
	fmovdl	%xcc,	%f14,	%f2
	fmovdn	%xcc,	%f9,	%f15
	fcmpne32	%f10,	%f12,	%l5
	fbue	%fcc3,	loop_1813
loop_1813:
	fbuge,a	%fcc3,	loop_1814
loop_1814:
	ble,pn	%xcc,	loop_1815
loop_1815:
	bcc,a	loop_1816
loop_1816:
	fbuge	%fcc1,	loop_1817
loop_1817:
	fbul	%fcc0,	loop_1818
loop_1818:
	bgu,a,pt	%xcc,	loop_1819
loop_1819:
	ldx	[%l7 + 0x48],	%o4
	brnz	%l3,	loop_1820
loop_1820:
	udivx	%o7,	0x06BE,	%l1
	fmul8sux16	%f8,	%f8,	%f2
	fand	%f0,	%f8,	%f0
	fornot2	%f12,	%f2,	%f2
	srl	%g2,	%l6,	%g7
	nop
	setx loop_1821, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1821:
	call	loop_1822
loop_1822:
	fmovsge	%icc,	%f1,	%f13
	brgez,a	%g6,	loop_1823
loop_1823:
	fsrc1s	%f6,	%f5
	ble,pt	%icc,	loop_1824
loop_1824:
	fmovdne	%xcc,	%f2,	%f11
	fbne	%fcc0,	loop_1825
loop_1825:
	fmovsleu	%xcc,	%f13,	%f14
	fnegs	%f5,	%f11
	bcc,a,pt	%xcc,	loop_1826
loop_1826:
	ba,pn	%xcc,	loop_1827
loop_1827:
	fmovdcc	%icc,	%f1,	%f9
	bg,pn	%xcc,	loop_1828
loop_1828:
	fmuld8sux16	%f4,	%f4,	%f10
	fbug,a	%fcc0,	loop_1829
loop_1829:
	fornot1s	%f13,	%f6,	%f4
	fblg	%fcc2,	loop_1830
loop_1830:
	bleu,a,pn	%icc,	loop_1831
loop_1831:
	bshuffle	%f0,	%f12,	%f0
	fpsub16	%f0,	%f8,	%f2
	fandnot1	%f14,	%f4,	%f12
	bgu,a	%icc,	loop_1832
loop_1832:
	fandnot1s	%f14,	%f1,	%f0
	fsrc2s	%f0,	%f11
	sth	%i2,	[%l7 + 0x3A]
	for	%f6,	%f12,	%f14
	ld	[%l7 + 0x68],	%f15
	fbne,a	%fcc3,	loop_1833
loop_1833:
	fbl	%fcc0,	loop_1834
loop_1834:
	fpsub16	%f0,	%f10,	%f8
	bvc,a	%xcc,	loop_1835
loop_1835:
	fmovdle	%icc,	%f13,	%f12
	std	%f12,	[%l7 + 0x70]
	stb	%g1,	[%l7 + 0x15]
	fmovda	%xcc,	%f2,	%f4
	nop
	setx loop_1836, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1836:
	ble,a,pn	%xcc,	loop_1837
loop_1837:
	fsrc1s	%f3,	%f14
	nop
	setx loop_1838, %l0, %l1
	jmpl %l1, %l0
loop_1838:
	bg,a,pt	%xcc,	loop_1839
loop_1839:
	fmovse	%icc,	%f2,	%f10
	ldsh	[%l7 + 0x2A],	%g5
	stb	%i1,	[%l7 + 0x34]
	fbge,a	%fcc2,	loop_1840
loop_1840:
	fxors	%f6,	%f11,	%f13
	fmul8sux16	%f2,	%f12,	%f10
	fmul8sux16	%f14,	%f6,	%f12
	fbu	%fcc3,	loop_1841
loop_1841:
	subcc	%o1,	%i7,	%i5
	fcmple32	%f2,	%f14,	%o5
	brnz,a	%o2,	loop_1842
loop_1842:
	fmovrdgz	%i3,	%f12,	%f10
	fmovrslez	%g3,	%f11,	%f3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type f   	: 424
!	Type i   	: 44
!	Type cti   	: 435
!	Type l   	: 97
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x82AA739D
.word 0x38BA94D3
.word 0x57C8C527
.word 0xF210EB59
.word 0x28B6226B
.word 0x613206B9
.word 0x0B0DCC50
.word 0xAA4C4D36
.word 0xD509B41A
.word 0x3CDCD78A
.word 0xAC6C77BA
.word 0x3D273BBB
.word 0xF48A3547
.word 0xB02EAE31
.word 0xC51BD866
.word 0x967F6ACA
.word 0xCA70C628
.word 0xFC09CB56
.word 0x754A8FE8
.word 0x10244646
.word 0xDAD24436
.word 0xF39B5DE4
.word 0x340B6897
.word 0x8DD018AF
.word 0x7DDED9B2
.word 0x47BB0289
.word 0xC76F0324
.word 0x0E8A080C
.word 0xE6D97291
.word 0xD9F9FA28
.word 0xF174F783
.word 0x69DCB3F0
.word 0x6F183149
.word 0xC0DC24FF
.word 0x9CCF137D
.word 0x05DCDAB3
.word 0x30B2514E
.word 0x5424958A
.word 0x05CBFA00
.word 0x918DE85A
.word 0xE5D2F7B4
.word 0x0A4FEF43
.word 0xACDE6C84
.word 0x8481502C
.word 0xEBFF2E0A
.word 0x06564F18
.word 0x8A86C3AF
.word 0x4ABF2F05
.word 0x24FE6075
.word 0x13D87628
.word 0x74A95F4C
.word 0x80D8018E
.word 0x05324DB9
.word 0x2E18D734
.word 0x5DE49643
.word 0x8AC6C167
.word 0x579D50EA
.word 0x0B7F3587
.word 0xBC537047
.word 0x9DEB00F4
.word 0x5ED68EC4
.word 0x0FA92499
.word 0x20525B22
.word 0x36509A96
.end
