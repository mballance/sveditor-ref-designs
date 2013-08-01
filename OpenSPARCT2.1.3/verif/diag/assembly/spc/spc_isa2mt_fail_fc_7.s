/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_isa2mt_fail_fc_7.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa2.pl FOCUS_SEED=182669290"
.ident "BY somePerson ON Mon Jul 28 21:43:58 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: spc_isa2mt_fail_fc_7.s,v 1.3 2007/07/05 22:02:06 drp Exp $"
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
	set	0x9,	%g2
	set	0xB,	%g3
	set	0x7,	%g4
	set	0xB,	%g5
	set	0xB,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x1,	%i1
	set	-0x8,	%i2
	set	-0x7,	%i3
	set	-0xC,	%i4
	set	-0xC,	%i5
	set	-0x9,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x239DEBDF,	%l0
	set	0x5FED6812,	%l1
	set	0x3BDD1866,	%l2
	set	0x3B58D95D,	%l3
	set	0x6DF0D9E6,	%l4
	set	0x4A014E05,	%l5
	set	0x7704F21D,	%l6
	!# Output registers
	set	-0x02EE,	%o0
	set	-0x08EB,	%o1
	set	0x02F7,	%o2
	set	-0x1CA3,	%o3
	set	0x0738,	%o4
	set	0x1C10,	%o5
	set	0x1C7A,	%o6
	set	0x01F8,	%o7

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

	bg,pn	%xcc,	loop_1
loop_1:
	fmovrsgez	%l1,	%f8,	%f10
	bcc,a	loop_2
loop_2:
	fblg,a	%fcc3,	loop_3
loop_3:
	bl,pn	%xcc,	loop_4
loop_4:
	stb	%i1,	[%l7 + 0x0E]
	edge8l	%g3,	%g1,	%i5
	lduw	[%l7 + 0x1C],	%o0
	bge,a,pn	%icc,	loop_5
loop_5:
	ldx	[%l7 + 0x48],	%l2
	umul	%i4,	0x1394,	%o1
	fba,a	%fcc2,	loop_6
loop_6:
	fbuge,a	%fcc3,	loop_7
loop_7:
	lduh	[%l7 + 0x2C],	%i6
	fmovdne	%icc,	%f13,	%f6
	srax	%i2,	0x03,	%g5
	bl,a	%xcc,	loop_8
loop_8:
	bneg,pt	%icc,	loop_9
loop_9:
	xor	%i0,	0x1FC8,	%i3
	fands	%f8,	%f13,	%f15
	lduh	[%l7 + 0x1E],	%o5
	array16	%l0,	%g4,	%g7
	bg,a,pt	%icc,	loop_10
loop_10:
	tcs	%xcc,	0x7
	ldub	[%l7 + 0x14],	%l4
	fmovdne	%xcc,	%f12,	%f14
	ldub	[%l7 + 0x75],	%l3
	ldx	[%l7 + 0x38],	%o4
	st	%f13,	[%l7 + 0x20]
	fmovdpos	%xcc,	%f14,	%f6
	udivx	%g2,	0x09E7,	%l5
	ld	[%l7 + 0x2C],	%f1
	ble,a,pn	%icc,	loop_11
loop_11:
	fmul8x16al	%f15,	%f6,	%f12
	te	%xcc,	0x3
	ldsb	[%l7 + 0x7C],	%o6
	ld	[%l7 + 0x10],	%f14
	te	%xcc,	0x1
	fzero	%f2
	bcs,pn	%icc,	loop_12
loop_12:
	stx	%g6,	[%l7 + 0x18]
	bcc,a	%icc,	loop_13
loop_13:
	stb	%o7,	[%l7 + 0x32]
	fcmple32	%f8,	%f0,	%i7
	udivx	%o3,	0x1727,	%l6
	bcc,a	%xcc,	loop_14
loop_14:
	ld	[%l7 + 0x70],	%f14
	st	%f0,	[%l7 + 0x18]
	std	%f4,	[%l7 + 0x20]
	lduw	[%l7 + 0x20],	%l1
	stw	%o2,	[%l7 + 0x78]
	ldsw	[%l7 + 0x48],	%i1
	ldd	[%l7 + 0x78],	%f0
	fba,a	%fcc0,	loop_15
loop_15:
	ldsb	[%l7 + 0x50],	%g3
	fblg	%fcc3,	loop_16
loop_16:
	bge,a,pn	%xcc,	loop_17
loop_17:
	lduh	[%l7 + 0x52],	%i5
	ldx	[%l7 + 0x78],	%o0
	ldd	[%l7 + 0x58],	%f12
	ld	[%l7 + 0x50],	%f1
	brlez	%g1,	loop_18
loop_18:
	bcs	%icc,	loop_19
loop_19:
	call	loop_20
loop_20:
	brlez,a	%i4,	loop_21
loop_21:
	fpadd16s	%f1,	%f12,	%f2
	ldsh	[%l7 + 0x14],	%l2
	subc	%i6,	%i2,	%o1
	nop
	setx loop_22, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_22:
	taddcc	%i0,	0x14B9,	%g5
	fbn,a	%fcc1,	loop_23
loop_23:
	bg,a	%icc,	loop_24
loop_24:
	lduh	[%l7 + 0x12],	%i3
	srlx	%l0,	%g4,	%g7
	edge8l	%o5,	%l4,	%l3
	movneg	%icc,	%g2,	%l5
	fnand	%f14,	%f12,	%f12
	fabss	%f6,	%f3
	ba,pt	%xcc,	loop_25
loop_25:
	ldub	[%l7 + 0x53],	%o6
	be,a,pn	%icc,	loop_26
loop_26:
	fbu	%fcc1,	loop_27
loop_27:
	array8	%g6,	%o7,	%o4
	edge32ln	%o3,	%i7,	%l1
	fornot2	%f14,	%f6,	%f14
	ldsb	[%l7 + 0x44],	%o2
	movcs	%xcc,	%l6,	%g3
	array16	%i5,	%i1,	%g1
	ldub	[%l7 + 0x49],	%o0
	ba,a	%xcc,	loop_28
loop_28:
	stx	%i4,	[%l7 + 0x68]
	array8	%i6,	%i2,	%o1
	for	%f10,	%f4,	%f8
	sdivcc	%l2,	0x08DD,	%i0
	movcc	%xcc,	%g5,	%l0
	brlz	%i3,	loop_29
loop_29:
	move	%xcc,	%g7,	%o5
	movle	%icc,	%l4,	%g4
	fbn	%fcc0,	loop_30
loop_30:
	stb	%g2,	[%l7 + 0x58]
	ldsb	[%l7 + 0x68],	%l3
	lduh	[%l7 + 0x40],	%o6
	brlez	%g6,	loop_31
loop_31:
	bne	loop_32
loop_32:
	popc	0x140E,	%l5
	stb	%o7,	[%l7 + 0x41]
	ldx	[%l7 + 0x60],	%o4
	tcc	%icc,	0x2
	bgu	%icc,	loop_33
loop_33:
	brz	%o3,	loop_34
loop_34:
	taddcc	%i7,	0x0D96,	%o2
	bcc,a,pn	%icc,	loop_35
loop_35:
	fbne	%fcc0,	loop_36
loop_36:
	ldsw	[%l7 + 0x40],	%l1
	or	%g3,	%l6,	%i5
	umulcc	%g1,	%i1,	%o0
	bleu	loop_37
loop_37:
	udiv	%i4,	0x1BBF,	%i2
	ldub	[%l7 + 0x7B],	%i6
	lduw	[%l7 + 0x74],	%o1
	fbne,a	%fcc1,	loop_38
loop_38:
	bleu	loop_39
loop_39:
	movne	%xcc,	%i0,	%g5
	fbge,a	%fcc1,	loop_40
loop_40:
	srl	%l2,	0x1E,	%l0
	fmovsne	%xcc,	%f6,	%f14
	fmovsa	%xcc,	%f12,	%f15
	fnot1	%f6,	%f4
	movrgez	%i3,	0x016,	%g7
	ldub	[%l7 + 0x30],	%l4
	stw	%g4,	[%l7 + 0x7C]
	movleu	%xcc,	%g2,	%l3
	tne	%xcc,	0x5
	srlx	%o5,	%o6,	%l5
	fmovdn	%xcc,	%f8,	%f3
	ldsh	[%l7 + 0x36],	%g6
	ldsb	[%l7 + 0x73],	%o4
	fmul8ulx16	%f12,	%f10,	%f8
	array16	%o7,	%i7,	%o2
	edge32	%l1,	%g3,	%l6
	fbul,a	%fcc2,	loop_41
loop_41:
	ldx	[%l7 + 0x60],	%i5
	sdiv	%o3,	0x0A9E,	%g1
	alignaddrl	%i1,	%i4,	%i2
	andn	%i6,	%o0,	%o1
	sth	%g5,	[%l7 + 0x42]
	std	%f2,	[%l7 + 0x08]
	stx	%i0,	[%l7 + 0x68]
	umul	%l2,	%i3,	%l0
	movge	%xcc,	%g7,	%l4
	stb	%g4,	[%l7 + 0x08]
	tgu	%xcc,	0x2
	fble	%fcc3,	loop_42
loop_42:
	lduh	[%l7 + 0x64],	%g2
	stb	%o5,	[%l7 + 0x6F]
	lduw	[%l7 + 0x1C],	%o6
	sdivcc	%l5,	0x0255,	%l3
	bl,pt	%icc,	loop_43
loop_43:
	brlz,a	%o4,	loop_44
loop_44:
	fbe	%fcc1,	loop_45
loop_45:
	array32	%o7,	%g6,	%i7
	fbuge	%fcc1,	loop_46
loop_46:
	be,a,pn	%icc,	loop_47
loop_47:
	ba,a	%icc,	loop_48
loop_48:
	stx	%o2,	[%l7 + 0x78]
	bn,a	loop_49
loop_49:
	subcc	%g3,	0x1AE7,	%l1
	movrlz	%l6,	0x0B7,	%i5
	mova	%icc,	%o3,	%g1
	st	%f8,	[%l7 + 0x50]
	tg	%icc,	0x6
	udivcc	%i4,	0x0C31,	%i2
	smulcc	%i6,	0x0386,	%o0
	fba,a	%fcc3,	loop_50
loop_50:
	stb	%o1,	[%l7 + 0x72]
	sdivx	%g5,	0x144D,	%i0
	stw	%l2,	[%l7 + 0x44]
	fmovde	%icc,	%f8,	%f4
	lduw	[%l7 + 0x5C],	%i3
	ldx	[%l7 + 0x60],	%l0
	bcc	%xcc,	loop_51
loop_51:
	fbue	%fcc1,	loop_52
loop_52:
	fbue,a	%fcc2,	loop_53
loop_53:
	xnor	%i1,	0x0893,	%g7
	fxnor	%f6,	%f2,	%f0
	taddcc	%l4,	0x0A99,	%g4
	bgu,a,pn	%icc,	loop_54
loop_54:
	bge,a	%xcc,	loop_55
loop_55:
	brgz	%o5,	loop_56
loop_56:
	movpos	%icc,	%o6,	%l5
	ldsh	[%l7 + 0x6E],	%l3
	fbule	%fcc0,	loop_57
loop_57:
	std	%f0,	[%l7 + 0x18]
	fbul,a	%fcc2,	loop_58
loop_58:
	and	%g2,	0x198E,	%o7
	st	%f4,	[%l7 + 0x74]
	stx	%g6,	[%l7 + 0x10]
	brlz	%o4,	loop_59
loop_59:
	fba	%fcc0,	loop_60
loop_60:
	fabsd	%f4,	%f12
	stb	%o2,	[%l7 + 0x62]
	move	%xcc,	%g3,	%i7
	fbul,a	%fcc0,	loop_61
loop_61:
	tge	%icc,	0x0
	stb	%l1,	[%l7 + 0x55]
	fbue	%fcc0,	loop_62
loop_62:
	fnot1	%f6,	%f8
	fbge,a	%fcc3,	loop_63
loop_63:
	fbge,a	%fcc2,	loop_64
loop_64:
	movre	%l6,	%o3,	%i5
	nop
	setx loop_65, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_65:
	tcc	%xcc,	0x1
	fpsub16s	%f1,	%f13,	%f15
	bvc,a,pt	%icc,	loop_66
loop_66:
	tpos	%icc,	0x6
	nop
	setx loop_67, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_67:
	ldsw	[%l7 + 0x4C],	%g1
	fblg,a	%fcc2,	loop_68
loop_68:
	sdiv	%i2,	0x11C7,	%i6
	fmovda	%icc,	%f14,	%f12
	ldx	[%l7 + 0x58],	%o0
	sllx	%i4,	0x10,	%g5
	stx	%o1,	[%l7 + 0x50]
	fbne,a	%fcc2,	loop_69
loop_69:
	ldsb	[%l7 + 0x12],	%i0
	fblg	%fcc1,	loop_70
loop_70:
	lduh	[%l7 + 0x28],	%i3
	stb	%l2,	[%l7 + 0x23]
	lduw	[%l7 + 0x4C],	%l0
	fmovdg	%xcc,	%f14,	%f0
	fmul8x16al	%f11,	%f6,	%f12
	ble	loop_71
loop_71:
	fbug	%fcc2,	loop_72
loop_72:
	tneg	%icc,	0x3
	nop
	setx loop_73, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_73:
	ld	[%l7 + 0x68],	%f5
	fmovdl	%icc,	%f11,	%f9
	move	%icc,	%g7,	%i1
	ldx	[%l7 + 0x78],	%l4
	ldsh	[%l7 + 0x14],	%o5
	fmovrdlez	%g4,	%f12,	%f10
	ldub	[%l7 + 0x48],	%o6
	be,pt	%xcc,	loop_74
loop_74:
	orncc	%l3,	%g2,	%o7
	sra	%l5,	0x08,	%g6
	fbug	%fcc2,	loop_75
loop_75:
	edge16l	%o4,	%o2,	%i7
	tle	%icc,	0x5
	std	%f8,	[%l7 + 0x18]
	bcc,a	loop_76
loop_76:
	or	%l1,	0x13AD,	%l6
	lduw	[%l7 + 0x3C],	%g3
	nop
	setx loop_77, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_77:
	tge	%xcc,	0x5
	ldub	[%l7 + 0x6B],	%o3
	movrgez	%i5,	%i2,	%i6
	bleu	%icc,	loop_78
loop_78:
	std	%f6,	[%l7 + 0x30]
	st	%f9,	[%l7 + 0x7C]
	addc	%o0,	0x0CE8,	%i4
	bcs	%icc,	loop_79
loop_79:
	brgez,a	%g5,	loop_80
loop_80:
	taddcctv	%o1,	0x1A9D,	%i0
	ldsw	[%l7 + 0x7C],	%g1
	fmovsl	%xcc,	%f6,	%f5
	fbug	%fcc1,	loop_81
loop_81:
	tcs	%xcc,	0x3
	ta	%xcc,	0x0
	addc	%i3,	0x17B6,	%l0
	fba,a	%fcc0,	loop_82
loop_82:
	bshuffle	%f4,	%f12,	%f6
	edge16l	%l2,	%i1,	%g7
	fbl,a	%fcc3,	loop_83
loop_83:
	fbo	%fcc2,	loop_84
loop_84:
	ba	%icc,	loop_85
loop_85:
	bcs	%xcc,	loop_86
loop_86:
	ldsb	[%l7 + 0x1B],	%o5
	ba,a,pn	%xcc,	loop_87
loop_87:
	fmovrdgz	%g4,	%f14,	%f4
	fones	%f11
	bvc	loop_88
loop_88:
	fmovda	%icc,	%f12,	%f7
	fbuge	%fcc3,	loop_89
loop_89:
	taddcctv	%l4,	0x1A8D,	%l3
	lduw	[%l7 + 0x60],	%o6
	ldx	[%l7 + 0x20],	%g2
	std	%f14,	[%l7 + 0x20]
	smulcc	%o7,	0x0FDA,	%l5
	movrlz	%o4,	%g6,	%o2
	tpos	%icc,	0x1
	bpos,pt	%xcc,	loop_90
loop_90:
	ldsb	[%l7 + 0x34],	%i7
	std	%f14,	[%l7 + 0x40]
	movg	%xcc,	%l1,	%l6
	bge,a	loop_91
loop_91:
	ldsb	[%l7 + 0x30],	%o3
	brlz,a	%g3,	loop_92
loop_92:
	stx	%i5,	[%l7 + 0x20]
	fbu,a	%fcc2,	loop_93
loop_93:
	brgez	%i6,	loop_94
loop_94:
	nop
	setx loop_95, %l0, %l1
	jmpl %l1, %i2
loop_95:
	edge32n	%i4,	%o0,	%g5
	addc	%i0,	%g1,	%o1
	stx	%i3,	[%l7 + 0x68]
	movvs	%xcc,	%l0,	%l2
	sethi	0x0B06,	%i1
	andn	%o5,	%g7,	%g4
	fbg	%fcc0,	loop_96
loop_96:
	move	%icc,	%l4,	%o6
	stb	%l3,	[%l7 + 0x21]
	ldx	[%l7 + 0x38],	%g2
	stx	%o7,	[%l7 + 0x18]
	std	%f14,	[%l7 + 0x70]
	fbe,a	%fcc0,	loop_97
loop_97:
	ldsw	[%l7 + 0x0C],	%l5
	brlez,a	%o4,	loop_98
loop_98:
	bpos,a	loop_99
loop_99:
	fbuge,a	%fcc1,	loop_100
loop_100:
	fbn	%fcc2,	loop_101
loop_101:
	bvc	%xcc,	loop_102
loop_102:
	ldx	[%l7 + 0x68],	%g6
	brz	%i7,	loop_103
loop_103:
	fbuge	%fcc3,	loop_104
loop_104:
	stx	%o2,	[%l7 + 0x30]
	st	%f7,	[%l7 + 0x14]
	fba,a	%fcc1,	loop_105
loop_105:
	andncc	%l1,	%o3,	%l6
	stb	%i5,	[%l7 + 0x37]
	srlx	%i6,	0x15,	%g3
	bge,a,pn	%xcc,	loop_106
loop_106:
	alignaddrl	%i2,	%i4,	%g5
	movle	%xcc,	%i0,	%g1
	ldd	[%l7 + 0x60],	%f12
	std	%f4,	[%l7 + 0x78]
	brz	%o0,	loop_107
loop_107:
	fone	%f14
	ldsh	[%l7 + 0x1A],	%i3
	fpsub32	%f4,	%f0,	%f10
	stb	%o1,	[%l7 + 0x0D]
	edge32n	%l0,	%i1,	%o5
	bne,a	loop_108
loop_108:
	sra	%l2,	0x0E,	%g7
	add	%g4,	%o6,	%l3
	alignaddrl	%l4,	%o7,	%g2
	lduh	[%l7 + 0x32],	%l5
	ld	[%l7 + 0x08],	%f10
	taddcc	%g6,	0x1140,	%o4
	ld	[%l7 + 0x70],	%f2
	ble	%xcc,	loop_109
loop_109:
	fbe	%fcc3,	loop_110
loop_110:
	subccc	%i7,	0x1594,	%l1
	bpos,pn	%icc,	loop_111
loop_111:
	fnot1s	%f5,	%f7
	st	%f4,	[%l7 + 0x48]
	subccc	%o3,	0x1EFE,	%o2
	fbuge	%fcc0,	loop_112
loop_112:
	ldsw	[%l7 + 0x3C],	%i5
	nop
	setx loop_113, %l0, %l1
	jmpl %l1, %l6
loop_113:
	andn	%g3,	%i2,	%i6
	ldsw	[%l7 + 0x08],	%i4
	st	%f9,	[%l7 + 0x20]
	fmovs	%f3,	%f12
	bpos	%xcc,	loop_114
loop_114:
	bpos,pt	%icc,	loop_115
loop_115:
	brlez,a	%g5,	loop_116
loop_116:
	srl	%g1,	0x13,	%i0
	subcc	%i3,	%o0,	%o1
	fbug	%fcc2,	loop_117
loop_117:
	brgz,a	%i1,	loop_118
loop_118:
	mulscc	%o5,	0x035C,	%l0
	fba	%fcc0,	loop_119
loop_119:
	edge32n	%g7,	%l2,	%g4
	fnands	%f11,	%f12,	%f13
	ldsw	[%l7 + 0x28],	%l3
	edge32n	%o6,	%l4,	%o7
	bl,a	%icc,	loop_120
loop_120:
	std	%f8,	[%l7 + 0x40]
	ldd	[%l7 + 0x68],	%f6
	fmovde	%xcc,	%f1,	%f13
	tle	%icc,	0x7
	movcc	%xcc,	%l5,	%g6
	lduh	[%l7 + 0x6E],	%o4
	bcs,a,pt	%icc,	loop_121
loop_121:
	ldsb	[%l7 + 0x32],	%i7
	fba	%fcc2,	loop_122
loop_122:
	bn,pt	%icc,	loop_123
loop_123:
	bne,pn	%icc,	loop_124
loop_124:
	fbue	%fcc2,	loop_125
loop_125:
	tn	%icc,	0x5
	fble,a	%fcc0,	loop_126
loop_126:
	bne,pn	%xcc,	loop_127
loop_127:
	bn,a	loop_128
loop_128:
	fors	%f15,	%f0,	%f0
	brgz,a	%g2,	loop_129
loop_129:
	lduw	[%l7 + 0x4C],	%l1
	fbul,a	%fcc0,	loop_130
loop_130:
	fornot1s	%f10,	%f2,	%f1
	sdivx	%o2,	0x190E,	%o3
	brlz	%i5,	loop_131
loop_131:
	tgu	%icc,	0x1
	bl,pt	%icc,	loop_132
loop_132:
	bvc,pt	%icc,	loop_133
loop_133:
	edge8	%g3,	%l6,	%i6
	fcmpne32	%f2,	%f4,	%i4
	fmovde	%xcc,	%f1,	%f1
	xnorcc	%g5,	%i2,	%i0
	tl	%xcc,	0x6
	fxors	%f7,	%f1,	%f10
	movne	%xcc,	%g1,	%o0
	brlez,a	%i3,	loop_134
loop_134:
	brlez	%o1,	loop_135
loop_135:
	bcs,a,pt	%xcc,	loop_136
loop_136:
	fble	%fcc2,	loop_137
loop_137:
	bl,pn	%icc,	loop_138
loop_138:
	std	%f8,	[%l7 + 0x40]
	ldx	[%l7 + 0x18],	%i1
	fbu,a	%fcc2,	loop_139
loop_139:
	ble,a	%xcc,	loop_140
loop_140:
	sdivcc	%l0,	0x148F,	%g7
	sdivx	%l2,	0x1AFE,	%o5
	edge8n	%l3,	%o6,	%l4
	ld	[%l7 + 0x44],	%f14
	andncc	%o7,	%g4,	%l5
	nop
	setx loop_141, %l0, %l1
	jmpl %l1, %g6
loop_141:
	tcs	%xcc,	0x5
	ldsb	[%l7 + 0x15],	%o4
	sra	%i7,	0x18,	%g2
	ldsw	[%l7 + 0x64],	%l1
	tgu	%icc,	0x2
	brz	%o3,	loop_142
loop_142:
	stx	%o2,	[%l7 + 0x70]
	edge32l	%g3,	%i5,	%l6
	stb	%i4,	[%l7 + 0x14]
	lduh	[%l7 + 0x56],	%g5
	ldd	[%l7 + 0x30],	%f6
	subccc	%i6,	%i0,	%g1
	stx	%o0,	[%l7 + 0x48]
	movl	%icc,	%i2,	%o1
	stx	%i1,	[%l7 + 0x68]
	subcc	%l0,	0x016D,	%i3
	bn,a	%icc,	loop_143
loop_143:
	subccc	%g7,	%o5,	%l3
	ldsw	[%l7 + 0x48],	%o6
	lduh	[%l7 + 0x0C],	%l4
	array16	%l2,	%g4,	%l5
	udivcc	%g6,	0x12F9,	%o7
	smul	%o4,	0x0504,	%i7
	tvs	%icc,	0x7
	edge8	%l1,	%o3,	%g2
	st	%f2,	[%l7 + 0x24]
	bne	loop_144
loop_144:
	brgez,a	%g3,	loop_145
loop_145:
	ldsb	[%l7 + 0x32],	%i5
	fxor	%f6,	%f6,	%f10
	edge32ln	%o2,	%i4,	%g5
	srax	%i6,	%l6,	%i0
	ldx	[%l7 + 0x18],	%g1
	ldsw	[%l7 + 0x74],	%o0
	fbug,a	%fcc3,	loop_146
loop_146:
	brgez	%i2,	loop_147
loop_147:
	udivcc	%i1,	0x1575,	%l0
	xor	%i3,	0x1BB3,	%g7
	call	loop_148
loop_148:
	edge8ln	%o5,	%o1,	%o6
	ld	[%l7 + 0x1C],	%f4
	movrne	%l4,	%l2,	%l3
	alignaddr	%g4,	%l5,	%g6
	fcmpeq32	%f2,	%f0,	%o7
	stx	%i7,	[%l7 + 0x70]
	fbule	%fcc2,	loop_149
loop_149:
	fbn	%fcc3,	loop_150
loop_150:
	sll	%l1,	%o3,	%g2
	fsrc1s	%f14,	%f11
	fbe,a	%fcc2,	loop_151
loop_151:
	movn	%icc,	%g3,	%o4
	brlez,a	%o2,	loop_152
loop_152:
	tneg	%icc,	0x2
	ld	[%l7 + 0x34],	%f13
	fbne	%fcc2,	loop_153
loop_153:
	tg	%xcc,	0x6
	mulx	%i4,	%i5,	%i6
	fbule	%fcc0,	loop_154
loop_154:
	array16	%g5,	%i0,	%l6
	sll	%g1,	0x1B,	%o0
	bl,a,pn	%icc,	loop_155
loop_155:
	andcc	%i2,	%i1,	%i3
	fbule,a	%fcc0,	loop_156
loop_156:
	stx	%g7,	[%l7 + 0x08]
	move	%xcc,	%o5,	%o1
	stb	%l0,	[%l7 + 0x4A]
	sllx	%l4,	%o6,	%l3
	fnand	%f8,	%f10,	%f12
	lduw	[%l7 + 0x7C],	%g4
	stw	%l5,	[%l7 + 0x7C]
	brlz,a	%l2,	loop_157
loop_157:
	fmul8sux16	%f14,	%f8,	%f6
	nop
	setx loop_158, %l0, %l1
	jmpl %l1, %o7
loop_158:
	bl,pt	%icc,	loop_159
loop_159:
	tne	%icc,	0x1
	ba,a	%icc,	loop_160
loop_160:
	sth	%g6,	[%l7 + 0x5E]
	subccc	%i7,	%o3,	%g2
	srlx	%g3,	%l1,	%o2
	brz	%o4,	loop_161
loop_161:
	brlz,a	%i4,	loop_162
loop_162:
	st	%f15,	[%l7 + 0x0C]
	lduw	[%l7 + 0x5C],	%i6
	ldd	[%l7 + 0x68],	%f10
	stw	%i5,	[%l7 + 0x24]
	ldub	[%l7 + 0x3E],	%i0
	brz	%l6,	loop_163
loop_163:
	srlx	%g1,	%g5,	%o0
	call	loop_164
loop_164:
	fblg,a	%fcc1,	loop_165
loop_165:
	std	%f12,	[%l7 + 0x30]
	ba,pt	%xcc,	loop_166
loop_166:
	fmovscc	%icc,	%f0,	%f8
	movgu	%xcc,	%i1,	%i2
	bleu,a	%xcc,	loop_167
loop_167:
	stb	%i3,	[%l7 + 0x2D]
	ba	%icc,	loop_168
loop_168:
	fmovdpos	%icc,	%f14,	%f13
	fpsub32s	%f14,	%f3,	%f7
	bleu,pt	%icc,	loop_169
loop_169:
	sdivcc	%g7,	0x191D,	%o1
	fbo,a	%fcc2,	loop_170
loop_170:
	fmovdl	%icc,	%f1,	%f14
	ldsh	[%l7 + 0x12],	%l0
	movg	%icc,	%l4,	%o5
	tsubcctv	%l3,	%o6,	%g4
	fbg	%fcc1,	loop_171
loop_171:
	nop
	setx loop_172, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_172:
	movneg	%xcc,	%l5,	%l2
	lduh	[%l7 + 0x40],	%o7
	fmovsne	%xcc,	%f2,	%f14
	stw	%i7,	[%l7 + 0x34]
	te	%xcc,	0x1
	sub	%o3,	%g6,	%g3
	sth	%l1,	[%l7 + 0x08]
	ba,a	%xcc,	loop_173
loop_173:
	std	%f0,	[%l7 + 0x08]
	fbe,a	%fcc0,	loop_174
loop_174:
	udiv	%g2,	0x1477,	%o4
	xnorcc	%o2,	0x1600,	%i6
	bvs,pt	%xcc,	loop_175
loop_175:
	ldx	[%l7 + 0x58],	%i4
	stx	%i5,	[%l7 + 0x48]
	fsrc1s	%f0,	%f1
	fmul8x16	%f1,	%f0,	%f10
	ldub	[%l7 + 0x6F],	%l6
	std	%f6,	[%l7 + 0x28]
	st	%f11,	[%l7 + 0x28]
	fmovsa	%xcc,	%f15,	%f3
	edge16n	%g1,	%g5,	%o0
	ldub	[%l7 + 0x17],	%i0
	sethi	0x10A1,	%i2
	move	%xcc,	%i3,	%g7
	fmovrdlz	%o1,	%f12,	%f0
	stx	%i1,	[%l7 + 0x78]
	alignaddrl	%l0,	%o5,	%l4
	nop
	setx loop_176, %l0, %l1
	jmpl %l1, %l3
loop_176:
	popc	%o6,	%g4
	tl	%icc,	0x3
	fones	%f1
	movvs	%xcc,	%l5,	%o7
	mova	%icc,	%i7,	%l2
	ld	[%l7 + 0x5C],	%f5
	brz	%g6,	loop_177
loop_177:
	movgu	%xcc,	%g3,	%o3
	ldd	[%l7 + 0x10],	%f0
	fbul,a	%fcc2,	loop_178
loop_178:
	fnot1s	%f7,	%f12
	movg	%xcc,	%g2,	%o4
	srlx	%o2,	%i6,	%i4
	sll	%l1,	%i5,	%l6
	ldd	[%l7 + 0x50],	%f8
	tpos	%xcc,	0x1
	ldsh	[%l7 + 0x66],	%g1
	bleu	loop_179
loop_179:
	stx	%g5,	[%l7 + 0x08]
	fmul8x16	%f11,	%f14,	%f2
	ldd	[%l7 + 0x60],	%f0
	fbu	%fcc1,	loop_180
loop_180:
	movre	%o0,	%i0,	%i2
	fsrc2s	%f8,	%f1
	ldsh	[%l7 + 0x12],	%i3
	bge,a,pt	%xcc,	loop_181
loop_181:
	ble,a	%icc,	loop_182
loop_182:
	fornot2s	%f2,	%f5,	%f14
	fone	%f12
	ldsb	[%l7 + 0x68],	%o1
	ldd	[%l7 + 0x10],	%f6
	xnor	%g7,	0x1CD1,	%i1
	nop
	setx loop_183, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_183:
	edge8n	%l0,	%o5,	%l3
	stw	%l4,	[%l7 + 0x48]
	fbug	%fcc3,	loop_184
loop_184:
	fbne	%fcc2,	loop_185
loop_185:
	lduw	[%l7 + 0x1C],	%g4
	movrgz	%o6,	0x1FC,	%l5
	fexpand	%f7,	%f10
	sra	%i7,	0x0C,	%o7
	sub	%l2,	%g3,	%g6
	ldx	[%l7 + 0x38],	%g2
	ble,a	%xcc,	loop_186
loop_186:
	ldx	[%l7 + 0x40],	%o4
	edge32n	%o3,	%o2,	%i4
	edge32n	%i6,	%i5,	%l1
	fble,a	%fcc0,	loop_187
loop_187:
	fmovsvc	%xcc,	%f4,	%f6
	sdiv	%g1,	0x0A8B,	%g5
	fxor	%f12,	%f14,	%f14
	fbug	%fcc0,	loop_188
loop_188:
	fpadd32	%f0,	%f2,	%f0
	movneg	%icc,	%o0,	%i0
	stb	%l6,	[%l7 + 0x24]
	fbne,a	%fcc0,	loop_189
loop_189:
	stw	%i2,	[%l7 + 0x58]
	stb	%i3,	[%l7 + 0x4D]
	tpos	%icc,	0x5
	ldub	[%l7 + 0x77],	%g7
	ldsh	[%l7 + 0x6A],	%i1
	call	loop_190
loop_190:
	movrlz	%o1,	0x19D,	%l0
	fbu,a	%fcc2,	loop_191
loop_191:
	add	%o5,	0x1CC4,	%l3
	brlz	%g4,	loop_192
loop_192:
	std	%f10,	[%l7 + 0x70]
	movn	%icc,	%l4,	%l5
	fbug,a	%fcc2,	loop_193
loop_193:
	sra	%i7,	0x01,	%o7
	edge16ln	%o6,	%l2,	%g3
	addc	%g2,	%g6,	%o4
	brz	%o2,	loop_194
loop_194:
	xor	%o3,	0x112A,	%i4
	fbule,a	%fcc2,	loop_195
loop_195:
	stw	%i5,	[%l7 + 0x78]
	stx	%i6,	[%l7 + 0x38]
	fnor	%f12,	%f12,	%f0
	sth	%g1,	[%l7 + 0x66]
	andncc	%g5,	%l1,	%o0
	fbl	%fcc0,	loop_196
loop_196:
	fble	%fcc3,	loop_197
loop_197:
	ldsb	[%l7 + 0x5D],	%i0
	ldd	[%l7 + 0x70],	%f0
	fbn,a	%fcc2,	loop_198
loop_198:
	stw	%i2,	[%l7 + 0x7C]
	edge8l	%l6,	%i3,	%g7
	lduh	[%l7 + 0x60],	%i1
	ldsw	[%l7 + 0x3C],	%l0
	st	%f14,	[%l7 + 0x58]
	tgu	%icc,	0x3
	taddcc	%o5,	0x0CBA,	%l3
	fmovsl	%icc,	%f3,	%f1
	stx	%o1,	[%l7 + 0x58]
	fbuge,a	%fcc1,	loop_199
loop_199:
	movrgz	%l4,	0x2F9,	%g4
	st	%f0,	[%l7 + 0x24]
	brz,a	%i7,	loop_200
loop_200:
	srl	%o7,	0x1F,	%l5
	taddcctv	%o6,	0x064F,	%l2
	stw	%g3,	[%l7 + 0x60]
	ldub	[%l7 + 0x55],	%g2
	srl	%g6,	%o4,	%o3
	udivx	%o2,	0x0264,	%i4
	orncc	%i6,	%i5,	%g5
	stb	%l1,	[%l7 + 0x1B]
	srax	%o0,	%i0,	%i2
	ldsw	[%l7 + 0x40],	%l6
	fbuge	%fcc2,	loop_201
loop_201:
	std	%f8,	[%l7 + 0x50]
	andcc	%i3,	%g7,	%g1
	nop
	setx loop_202, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_202:
	fba	%fcc3,	loop_203
loop_203:
	bvs,a,pt	%icc,	loop_204
loop_204:
	stx	%i1,	[%l7 + 0x68]
	taddcc	%l0,	0x1968,	%o5
	fbn	%fcc3,	loop_205
loop_205:
	ldx	[%l7 + 0x48],	%l3
	fblg	%fcc3,	loop_206
loop_206:
	edge8n	%l4,	%o1,	%g4
	edge32n	%o7,	%i7,	%o6
	fsrc2	%f6,	%f2
	fmovdcc	%xcc,	%f6,	%f8
	andn	%l2,	%l5,	%g3
	bg	loop_207
loop_207:
	movvc	%icc,	%g2,	%o4
	movrlez	%g6,	0x23B,	%o3
	ldx	[%l7 + 0x70],	%o2
	bl,a	loop_208
loop_208:
	ldsh	[%l7 + 0x2C],	%i6
	ldx	[%l7 + 0x40],	%i4
	orncc	%g5,	0x0768,	%i5
	sethi	0x171B,	%o0
	fble,a	%fcc3,	loop_209
loop_209:
	orn	%l1,	0x1DE8,	%i2
	ldd	[%l7 + 0x08],	%f2
	movleu	%xcc,	%l6,	%i3
	stb	%g7,	[%l7 + 0x41]
	ldd	[%l7 + 0x78],	%f4
	fbule	%fcc3,	loop_210
loop_210:
	srlx	%i0,	0x18,	%g1
	ldx	[%l7 + 0x40],	%i1
	bcs,pt	%xcc,	loop_211
loop_211:
	movre	%l0,	0x024,	%l3
	lduw	[%l7 + 0x20],	%l4
	nop
	setx loop_212, %l0, %l1
	jmpl %l1, %o5
loop_212:
	bcc,a,pn	%xcc,	loop_213
loop_213:
	fbo	%fcc2,	loop_214
loop_214:
	lduw	[%l7 + 0x50],	%g4
	bn,pn	%icc,	loop_215
loop_215:
	fones	%f7
	edge8ln	%o7,	%o1,	%i7
	xor	%o6,	0x0F41,	%l5
	edge16l	%g3,	%g2,	%o4
	fbe	%fcc0,	loop_216
loop_216:
	ldx	[%l7 + 0x50],	%l2
	edge16n	%o3,	%g6,	%i6
	bvc,a,pn	%xcc,	loop_217
loop_217:
	ldsh	[%l7 + 0x4A],	%i4
	bvc,a	loop_218
loop_218:
	fcmped	%fcc1,	%f6,	%f2
	movrgz	%g5,	%i5,	%o0
	stx	%l1,	[%l7 + 0x08]
	fnors	%f15,	%f4,	%f5
	movcc	%xcc,	%i2,	%o2
	ldsb	[%l7 + 0x38],	%i3
	fmovdneg	%xcc,	%f4,	%f1
	bvc,a	%xcc,	loop_219
loop_219:
	bgu	loop_220
loop_220:
	andn	%g7,	%i0,	%l6
	ldsh	[%l7 + 0x14],	%g1
	fba	%fcc1,	loop_221
loop_221:
	fones	%f2
	tg	%icc,	0x7
	te	%icc,	0x3
	stx	%l0,	[%l7 + 0x20]
	bg,a	loop_222
loop_222:
	sth	%l3,	[%l7 + 0x0A]
	brz	%l4,	loop_223
loop_223:
	std	%f10,	[%l7 + 0x60]
	brgez,a	%i1,	loop_224
loop_224:
	brlz	%g4,	loop_225
loop_225:
	bne,a	loop_226
loop_226:
	fbug,a	%fcc3,	loop_227
loop_227:
	fbn,a	%fcc1,	loop_228
loop_228:
	nop
	setx loop_229, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_229:
	nop
	setx loop_230, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_230:
	movrlz	%o7,	%o5,	%i7
	udivcc	%o1,	0x02F5,	%l5
	fmovsge	%xcc,	%f1,	%f0
	brgez,a	%g3,	loop_231
loop_231:
	tge	%icc,	0x5
	edge16ln	%o6,	%g2,	%o4
	brgz,a	%o3,	loop_232
loop_232:
	edge32	%g6,	%i6,	%i4
	stw	%l2,	[%l7 + 0x10]
	tvc	%xcc,	0x1
	lduw	[%l7 + 0x0C],	%g5
	fbue	%fcc0,	loop_233
loop_233:
	fmovrde	%i5,	%f2,	%f2
	sethi	0x1649,	%l1
	bne,pt	%icc,	loop_234
loop_234:
	std	%f10,	[%l7 + 0x50]
	lduw	[%l7 + 0x74],	%o0
	lduw	[%l7 + 0x30],	%i2
	sth	%i3,	[%l7 + 0x2A]
	ldsh	[%l7 + 0x40],	%g7
	sth	%i0,	[%l7 + 0x56]
	ldd	[%l7 + 0x68],	%f8
	ldsb	[%l7 + 0x34],	%l6
	bleu	loop_235
loop_235:
	be	%xcc,	loop_236
loop_236:
	fandnot1s	%f14,	%f14,	%f0
	bl	%xcc,	loop_237
loop_237:
	ld	[%l7 + 0x60],	%f6
	bge,a	%xcc,	loop_238
loop_238:
	sra	%g1,	%o2,	%l0
	ldd	[%l7 + 0x60],	%f0
	ldsw	[%l7 + 0x74],	%l4
	ldsw	[%l7 + 0x08],	%l3
	stx	%i1,	[%l7 + 0x28]
	xorcc	%g4,	%o7,	%i7
	movrgez	%o1,	%o5,	%l5
	fcmpne32	%f14,	%f8,	%o6
	movre	%g2,	0x053,	%g3
	ba,a	loop_239
loop_239:
	fbg	%fcc2,	loop_240
loop_240:
	fble	%fcc3,	loop_241
loop_241:
	andn	%o4,	%o3,	%i6
	std	%f8,	[%l7 + 0x58]
	bleu,a	%xcc,	loop_242
loop_242:
	fmovdg	%icc,	%f12,	%f6
	ld	[%l7 + 0x2C],	%f5
	fba,a	%fcc1,	loop_243
loop_243:
	nop
	setx loop_244, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_244:
	fmovdcc	%xcc,	%f2,	%f9
	edge8ln	%g6,	%l2,	%g5
	bvc,pn	%icc,	loop_245
loop_245:
	stw	%i5,	[%l7 + 0x30]
	st	%f3,	[%l7 + 0x4C]
	stx	%i4,	[%l7 + 0x10]
	ld	[%l7 + 0x30],	%f6
	be	loop_246
loop_246:
	fornot1s	%f8,	%f2,	%f4
	movgu	%icc,	%o0,	%l1
	st	%f8,	[%l7 + 0x60]
	ldsw	[%l7 + 0x0C],	%i2
	fmovsl	%icc,	%f3,	%f0
	fbne	%fcc3,	loop_247
loop_247:
	stb	%g7,	[%l7 + 0x73]
	movleu	%xcc,	%i3,	%l6
	subcc	%i0,	0x0D5F,	%o2
	alignaddr	%g1,	%l0,	%l3
	or	%l4,	%i1,	%g4
	movle	%xcc,	%o7,	%o1
	tcs	%icc,	0x1
	fpack16	%f6,	%f8
	ldsb	[%l7 + 0x23],	%o5
	sth	%i7,	[%l7 + 0x40]
	tl	%icc,	0x4
	stx	%l5,	[%l7 + 0x18]
	fmovscs	%icc,	%f14,	%f11
	fmovrse	%g2,	%f13,	%f2
	sth	%o6,	[%l7 + 0x20]
	lduh	[%l7 + 0x2A],	%g3
	lduw	[%l7 + 0x50],	%o3
	call	loop_248
loop_248:
	movvs	%xcc,	%i6,	%o4
	tsubcctv	%l2,	0x0C0E,	%g6
	ldsh	[%l7 + 0x44],	%g5
	lduh	[%l7 + 0x48],	%i5
	ld	[%l7 + 0x14],	%f11
	fmovsvs	%icc,	%f13,	%f13
	fbu	%fcc3,	loop_249
loop_249:
	move	%icc,	%i4,	%l1
	lduw	[%l7 + 0x48],	%o0
	ldx	[%l7 + 0x20],	%i2
	bpos	loop_250
loop_250:
	bgu	loop_251
loop_251:
	movrgez	%i3,	%l6,	%g7
	movvc	%xcc,	%o2,	%i0
	fmovsg	%icc,	%f15,	%f5
	or	%l0,	0x014D,	%g1
	stx	%l3,	[%l7 + 0x70]
	edge8ln	%l4,	%g4,	%o7
	array16	%o1,	%i1,	%i7
	bvc	%icc,	loop_252
loop_252:
	movneg	%icc,	%l5,	%o5
	ta	%xcc,	0x0
	edge16n	%g2,	%g3,	%o3
	ld	[%l7 + 0x40],	%f13
	lduw	[%l7 + 0x7C],	%o6
	st	%f15,	[%l7 + 0x2C]
	lduw	[%l7 + 0x58],	%i6
	ba,a	%icc,	loop_253
loop_253:
	bne,a,pn	%xcc,	loop_254
loop_254:
	tgu	%icc,	0x2
	stx	%l2,	[%l7 + 0x30]
	ta	%xcc,	0x0
	smulcc	%o4,	0x1520,	%g5
	ld	[%l7 + 0x50],	%f7
	move	%xcc,	%i5,	%i4
	ldsb	[%l7 + 0x44],	%g6
	andncc	%l1,	%o0,	%i2
	bpos,a,pn	%icc,	loop_255
loop_255:
	bneg,a,pn	%icc,	loop_256
loop_256:
	fblg	%fcc3,	loop_257
loop_257:
	add	%l6,	%g7,	%i3
	fbn,a	%fcc2,	loop_258
loop_258:
	stx	%i0,	[%l7 + 0x68]
	fbge	%fcc2,	loop_259
loop_259:
	xor	%l0,	%g1,	%l3
	lduw	[%l7 + 0x70],	%o2
	bpos,a,pt	%xcc,	loop_260
loop_260:
	std	%f12,	[%l7 + 0x08]
	movre	%g4,	0x08A,	%o7
	movne	%icc,	%l4,	%o1
	brz	%i1,	loop_261
loop_261:
	ldx	[%l7 + 0x50],	%i7
	edge16l	%o5,	%l5,	%g2
	edge8l	%o3,	%g3,	%i6
	ldx	[%l7 + 0x50],	%l2
	stx	%o4,	[%l7 + 0x18]
	fbo	%fcc1,	loop_262
loop_262:
	udiv	%g5,	0x0152,	%o6
	bvs,a	loop_263
loop_263:
	fbule,a	%fcc2,	loop_264
loop_264:
	ble,pn	%xcc,	loop_265
loop_265:
	edge32ln	%i5,	%i4,	%l1
	ta	%xcc,	0x3
	lduw	[%l7 + 0x6C],	%o0
	nop
	setx loop_266, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_266:
	fzeros	%f11
	srlx	%i2,	0x11,	%g6
	movneg	%xcc,	%g7,	%i3
	brlez,a	%l6,	loop_267
loop_267:
	std	%f8,	[%l7 + 0x78]
	sdivcc	%l0,	0x142E,	%i0
	edge16	%l3,	%o2,	%g4
	fbul,a	%fcc1,	loop_268
loop_268:
	st	%f4,	[%l7 + 0x28]
	fpadd32	%f12,	%f14,	%f12
	andncc	%o7,	%g1,	%l4
	lduh	[%l7 + 0x7C],	%i1
	udiv	%o1,	0x0928,	%i7
	te	%xcc,	0x1
	lduh	[%l7 + 0x52],	%o5
	ldx	[%l7 + 0x68],	%g2
	bge,a,pt	%xcc,	loop_269
loop_269:
	edge8l	%o3,	%l5,	%i6
	addccc	%l2,	0x156F,	%o4
	fandnot1s	%f9,	%f2,	%f3
	fpadd16	%f0,	%f8,	%f0
	taddcc	%g5,	%g3,	%o6
	fbge,a	%fcc2,	loop_270
loop_270:
	nop
	setx loop_271, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_271:
	edge32l	%i4,	%i5,	%o0
	orcc	%i2,	%g6,	%l1
	xnor	%g7,	0x1C5B,	%l6
	fpackfix	%f2,	%f1
	ld	[%l7 + 0x3C],	%f5
	fbule,a	%fcc0,	loop_272
loop_272:
	udivx	%i3,	0x05F7,	%i0
	fmovdn	%icc,	%f6,	%f7
	array16	%l0,	%l3,	%g4
	fbul,a	%fcc0,	loop_273
loop_273:
	ld	[%l7 + 0x0C],	%f12
	ldx	[%l7 + 0x18],	%o2
	movneg	%xcc,	%g1,	%o7
	sth	%l4,	[%l7 + 0x70]
	bpos,pt	%xcc,	loop_274
loop_274:
	fbu,a	%fcc2,	loop_275
loop_275:
	ldsh	[%l7 + 0x30],	%o1
	fbne	%fcc1,	loop_276
loop_276:
	ble	loop_277
loop_277:
	stw	%i1,	[%l7 + 0x70]
	sth	%o5,	[%l7 + 0x2E]
	pdist	%f2,	%f14,	%f2
	bleu,a	%xcc,	loop_278
loop_278:
	ldub	[%l7 + 0x76],	%i7
	tgu	%icc,	0x4
	ldsh	[%l7 + 0x1E],	%o3
	bg	%icc,	loop_279
loop_279:
	fbn	%fcc2,	loop_280
loop_280:
	bne,pt	%xcc,	loop_281
loop_281:
	movneg	%icc,	%l5,	%i6
	lduh	[%l7 + 0x36],	%g2
	edge8	%o4,	%l2,	%g3
	lduw	[%l7 + 0x64],	%o6
	fbg	%fcc2,	loop_282
loop_282:
	ldx	[%l7 + 0x28],	%g5
	bg,a,pt	%xcc,	loop_283
loop_283:
	fbug,a	%fcc3,	loop_284
loop_284:
	bcs,pt	%xcc,	loop_285
loop_285:
	fbu	%fcc2,	loop_286
loop_286:
	std	%f0,	[%l7 + 0x08]
	tneg	%icc,	0x2
	movrgz	%i4,	0x3D4,	%o0
	bpos,a,pt	%xcc,	loop_287
loop_287:
	fandnot2	%f4,	%f14,	%f2
	fbe	%fcc3,	loop_288
loop_288:
	lduh	[%l7 + 0x1E],	%i2
	ldub	[%l7 + 0x18],	%g6
	ldx	[%l7 + 0x68],	%i5
	array8	%g7,	%l1,	%l6
	tvc	%icc,	0x4
	ldx	[%l7 + 0x48],	%i3
	bn,pn	%xcc,	loop_289
loop_289:
	tg	%xcc,	0x7
	tleu	%xcc,	0x5
	ld	[%l7 + 0x30],	%f8
	fblg,a	%fcc1,	loop_290
loop_290:
	smul	%i0,	%l0,	%g4
	bl,a	loop_291
loop_291:
	std	%f14,	[%l7 + 0x50]
	movleu	%xcc,	%l3,	%g1
	sub	%o7,	0x02F8,	%o2
	sth	%l4,	[%l7 + 0x2A]
	fbue,a	%fcc0,	loop_292
loop_292:
	lduw	[%l7 + 0x54],	%o1
	fbuge,a	%fcc0,	loop_293
loop_293:
	brgz,a	%i1,	loop_294
loop_294:
	brgez,a	%o5,	loop_295
loop_295:
	sdivcc	%o3,	0x1521,	%i7
	fbuge	%fcc2,	loop_296
loop_296:
	nop
	setx loop_297, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_297:
	ld	[%l7 + 0x44],	%f3
	fbuge,a	%fcc2,	loop_298
loop_298:
	bvs,pt	%icc,	loop_299
loop_299:
	addcc	%i6,	0x0EEA,	%l5
	andcc	%g2,	0x09D5,	%l2
	stb	%o4,	[%l7 + 0x48]
	tsubcc	%o6,	%g3,	%i4
	movge	%icc,	%o0,	%g5
	brlz	%g6,	loop_300
loop_300:
	alignaddr	%i2,	%g7,	%l1
	brgz	%i5,	loop_301
loop_301:
	fbuge,a	%fcc3,	loop_302
loop_302:
	fblg,a	%fcc2,	loop_303
loop_303:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 98
!	Type i   	: 307
!	Type cti   	: 303
!	Type l   	: 292
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
main_t1:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0xB,	%g2
	set	0x0,	%g3
	set	0xA,	%g4
	set	0x3,	%g5
	set	0xE,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x8,	%i1
	set	-0x8,	%i2
	set	-0x9,	%i3
	set	-0xD,	%i4
	set	-0x0,	%i5
	set	-0x5,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x366BD0C6,	%l0
	set	0x08AE29B5,	%l1
	set	0x77682210,	%l2
	set	0x3DB32E97,	%l3
	set	0x3455306B,	%l4
	set	0x466F744D,	%l5
	set	0x55E03CDA,	%l6
	!# Output registers
	set	0x0ACB,	%o0
	set	-0x0781,	%o1
	set	0x0413,	%o2
	set	-0x16F9,	%o3
	set	-0x1833,	%o4
	set	-0x1F0D,	%o5
	set	-0x1CBC,	%o6
	set	-0x0D69,	%o7

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

	bg,a	loop_304
loop_304:
	lduh	[%l7 + 0x7A],	%i3
	fornot2s	%f11,	%f6,	%f5
	ldd	[%l7 + 0x28],	%f0
	lduw	[%l7 + 0x44],	%l6
	fsrc1s	%f4,	%f7
	popc	0x1F7A,	%l0
	fsrc2s	%f4,	%f5
	fcmpgt16	%f2,	%f6,	%i0
	fmovsneg	%xcc,	%f14,	%f7
	ldx	[%l7 + 0x20],	%l3
	andncc	%g4,	%o7,	%o2
	call	loop_305
loop_305:
	fands	%f2,	%f15,	%f14
	orcc	%l4,	0x02C6,	%o1
	movrgz	%i1,	%o5,	%g1
	andcc	%o3,	0x03CE,	%i7
	fnors	%f14,	%f8,	%f1
	umul	%l5,	%g2,	%l2
	fmovrde	%i6,	%f8,	%f10
	faligndata	%f4,	%f10,	%f0
	ldd	[%l7 + 0x18],	%f10
	movl	%icc,	%o6,	%g3
	fmovrde	%i4,	%f14,	%f14
	fmovdneg	%xcc,	%f15,	%f15
	nop
	setx loop_306, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_306:
	fmovsl	%icc,	%f13,	%f9
	ldsb	[%l7 + 0x30],	%o0
	ldsh	[%l7 + 0x34],	%g5
	fmovsgu	%icc,	%f5,	%f0
	fpsub16	%f14,	%f2,	%f4
	tcc	%xcc,	0x3
	lduh	[%l7 + 0x12],	%o4
	xnor	%i2,	%g6,	%g7
	fpadd16	%f14,	%f10,	%f14
	fornot2s	%f7,	%f8,	%f8
	bgu	%icc,	loop_307
loop_307:
	fbo	%fcc1,	loop_308
loop_308:
	bvc,a	loop_309
loop_309:
	sllx	%l1,	%i5,	%l6
	brnz,a	%l0,	loop_310
loop_310:
	bgu	%icc,	loop_311
loop_311:
	fsrc2s	%f8,	%f5
	fcmped	%fcc3,	%f4,	%f8
	brlez	%i0,	loop_312
loop_312:
	brgez	%l3,	loop_313
loop_313:
	fmovscc	%xcc,	%f13,	%f6
	srlx	%i3,	0x04,	%o7
	fnegd	%f14,	%f14
	xnor	%g4,	0x1339,	%l4
	tvc	%xcc,	0x5
	fbe,a	%fcc1,	loop_314
loop_314:
	tleu	%icc,	0x4
	brz,a	%o2,	loop_315
loop_315:
	ta	%icc,	0x2
	lduh	[%l7 + 0x3A],	%o1
	ldsh	[%l7 + 0x3E],	%i1
	fbul	%fcc3,	loop_316
loop_316:
	bcc,pt	%icc,	loop_317
loop_317:
	stx	%g1,	[%l7 + 0x28]
	std	%f10,	[%l7 + 0x58]
	fmovrdgz	%o5,	%f0,	%f12
	stx	%i7,	[%l7 + 0x78]
	movl	%icc,	%l5,	%o3
	movvc	%icc,	%g2,	%l2
	fbne	%fcc1,	loop_318
loop_318:
	ld	[%l7 + 0x2C],	%f15
	xorcc	%i6,	%o6,	%i4
	ldub	[%l7 + 0x59],	%o0
	tsubcc	%g5,	0x00A9,	%g3
	ta	%xcc,	0x1
	fmovsvc	%icc,	%f7,	%f1
	ldd	[%l7 + 0x48],	%f0
	ldsb	[%l7 + 0x0A],	%i2
	tneg	%icc,	0x4
	ldsw	[%l7 + 0x70],	%g6
	fnors	%f4,	%f10,	%f15
	tneg	%icc,	0x5
	fbl	%fcc3,	loop_319
loop_319:
	array16	%o4,	%l1,	%g7
	call	loop_320
loop_320:
	fandnot2	%f0,	%f8,	%f0
	nop
	setx loop_321, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_321:
	smul	%l6,	%i5,	%l0
	fmovscs	%xcc,	%f6,	%f14
	sllx	%i0,	%l3,	%o7
	tcs	%icc,	0x4
	bne,a,pt	%icc,	loop_322
loop_322:
	fxors	%f8,	%f13,	%f7
	fornot2	%f10,	%f4,	%f10
	fmovsg	%xcc,	%f8,	%f15
	movne	%xcc,	%g4,	%l4
	fmovrse	%o2,	%f6,	%f9
	fmovdne	%icc,	%f14,	%f9
	edge32l	%o1,	%i1,	%i3
	sdiv	%g1,	0x00F9,	%o5
	sth	%i7,	[%l7 + 0x4C]
	fpack32	%f0,	%f0,	%f12
	fxnors	%f5,	%f4,	%f5
	faligndata	%f10,	%f8,	%f6
	movrgez	%l5,	0x3EA,	%o3
	fmovsne	%icc,	%f12,	%f6
	movrgz	%l2,	%i6,	%o6
	edge32n	%i4,	%o0,	%g5
	fbug,a	%fcc0,	loop_323
loop_323:
	ldsw	[%l7 + 0x6C],	%g2
	edge8l	%i2,	%g3,	%g6
	nop
	setx loop_324, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_324:
	brz	%l1,	loop_325
loop_325:
	edge8ln	%o4,	%g7,	%l6
	brlez	%i5,	loop_326
loop_326:
	bgu,a,pt	%icc,	loop_327
loop_327:
	stx	%l0,	[%l7 + 0x48]
	fbne	%fcc0,	loop_328
loop_328:
	std	%f4,	[%l7 + 0x08]
	tcs	%icc,	0x2
	fmovrdlz	%l3,	%f6,	%f6
	fmovdne	%icc,	%f0,	%f9
	ble	%xcc,	loop_329
loop_329:
	fsrc1	%f2,	%f10
	stb	%o7,	[%l7 + 0x6B]
	faligndata	%f6,	%f14,	%f4
	fpadd16	%f8,	%f4,	%f4
	ldx	[%l7 + 0x20],	%g4
	bleu,pn	%xcc,	loop_330
loop_330:
	fbl	%fcc1,	loop_331
loop_331:
	xorcc	%l4,	%i0,	%o2
	ldx	[%l7 + 0x28],	%o1
	fandnot1	%f2,	%f10,	%f8
	fabss	%f5,	%f6
	movrne	%i3,	%i1,	%g1
	fbuge,a	%fcc2,	loop_332
loop_332:
	brnz	%o5,	loop_333
loop_333:
	ta	%icc,	0x1
	edge16ln	%i7,	%o3,	%l2
	fnor	%f0,	%f14,	%f14
	fba,a	%fcc2,	loop_334
loop_334:
	ld	[%l7 + 0x28],	%f15
	fbg,a	%fcc0,	loop_335
loop_335:
	bshuffle	%f2,	%f8,	%f2
	ld	[%l7 + 0x4C],	%f8
	movn	%icc,	%i6,	%o6
	orncc	%i4,	0x1F7D,	%l5
	ble,pt	%icc,	loop_336
loop_336:
	fxnors	%f11,	%f0,	%f9
	ldd	[%l7 + 0x48],	%f4
	fmovda	%xcc,	%f7,	%f1
	fsrc2	%f4,	%f6
	bvs	loop_337
loop_337:
	fandnot2s	%f15,	%f15,	%f1
	movle	%xcc,	%g5,	%g2
	fmovscc	%xcc,	%f13,	%f10
	edge16n	%o0,	%i2,	%g6
	lduh	[%l7 + 0x6A],	%g3
	fsrc1	%f10,	%f4
	fmovscc	%icc,	%f7,	%f13
	fbule	%fcc0,	loop_338
loop_338:
	fmovscs	%xcc,	%f4,	%f3
	ld	[%l7 + 0x34],	%f13
	tcs	%icc,	0x6
	bne,pn	%icc,	loop_339
loop_339:
	lduw	[%l7 + 0x70],	%o4
	fones	%f9
	st	%f2,	[%l7 + 0x30]
	std	%f4,	[%l7 + 0x18]
	pdist	%f0,	%f12,	%f12
	movle	%xcc,	%g7,	%l6
	movge	%xcc,	%i5,	%l0
	sll	%l3,	0x0E,	%o7
	sub	%g4,	0x15D1,	%l1
	popc	%i0,	%l4
	ld	[%l7 + 0x18],	%f9
	fbg,a	%fcc2,	loop_340
loop_340:
	ldd	[%l7 + 0x58],	%f8
	fcmpgt16	%f14,	%f4,	%o2
	fmovrse	%o1,	%f9,	%f10
	stw	%i1,	[%l7 + 0x4C]
	stx	%g1,	[%l7 + 0x38]
	fnot2s	%f2,	%f13
	fandnot1s	%f13,	%f13,	%f11
	sth	%o5,	[%l7 + 0x1E]
	lduh	[%l7 + 0x1E],	%i7
	fxors	%f10,	%f3,	%f12
	fmovsvc	%icc,	%f4,	%f8
	fmovdleu	%xcc,	%f5,	%f13
	sth	%i3,	[%l7 + 0x50]
	fpsub16	%f8,	%f14,	%f12
	fbe	%fcc3,	loop_341
loop_341:
	fmovsne	%icc,	%f5,	%f7
	bcs	%icc,	loop_342
loop_342:
	addc	%o3,	%l2,	%i6
	fsrc1s	%f14,	%f15
	movvc	%icc,	%i4,	%o6
	tsubcc	%l5,	%g5,	%o0
	ble,a	loop_343
loop_343:
	brgz,a	%g2,	loop_344
loop_344:
	siam	0x1
	fbue,a	%fcc2,	loop_345
loop_345:
	udiv	%i2,	0x096A,	%g3
	lduh	[%l7 + 0x48],	%g6
	fmovrdlz	%g7,	%f4,	%f14
	bg	%icc,	loop_346
loop_346:
	fmovsne	%xcc,	%f1,	%f11
	fxnors	%f11,	%f8,	%f9
	fnegd	%f0,	%f4
	for	%f10,	%f8,	%f0
	alignaddrl	%l6,	%o4,	%l0
	fbu	%fcc0,	loop_347
loop_347:
	ldub	[%l7 + 0x78],	%l3
	andn	%o7,	%g4,	%i5
	sethi	0x1CB7,	%l1
	brz,a	%l4,	loop_348
loop_348:
	ldsh	[%l7 + 0x5C],	%o2
	fornot1s	%f8,	%f9,	%f14
	fbuge,a	%fcc0,	loop_349
loop_349:
	fornot2	%f12,	%f12,	%f8
	movpos	%icc,	%i0,	%o1
	fbge,a	%fcc2,	loop_350
loop_350:
	stw	%i1,	[%l7 + 0x20]
	fmovdn	%xcc,	%f0,	%f8
	fpadd32	%f2,	%f12,	%f4
	movvc	%icc,	%o5,	%g1
	fone	%f0
	movrlz	%i3,	0x228,	%i7
	fandnot1s	%f10,	%f14,	%f1
	fmul8x16au	%f14,	%f2,	%f12
	movle	%icc,	%o3,	%i6
	nop
	setx loop_351, %l0, %l1
	jmpl %l1, %i4
loop_351:
	fmovscs	%xcc,	%f5,	%f13
	bn,a	%xcc,	loop_352
loop_352:
	ld	[%l7 + 0x30],	%f3
	umulcc	%l2,	0x0270,	%o6
	bl,a	%xcc,	loop_353
loop_353:
	alignaddrl	%g5,	%o0,	%l5
	tl	%icc,	0x4
	ldsw	[%l7 + 0x74],	%i2
	fmovsn	%xcc,	%f7,	%f5
	umul	%g3,	0x19DA,	%g2
	ldsw	[%l7 + 0x64],	%g6
	fone	%f14
	fbul,a	%fcc0,	loop_354
loop_354:
	add	%l6,	0x03C1,	%o4
	array32	%g7,	%l0,	%o7
	or	%g4,	0x0FC3,	%l3
	fmovrdlz	%i5,	%f14,	%f6
	movrgez	%l1,	%o2,	%i0
	stx	%l4,	[%l7 + 0x58]
	fxors	%f12,	%f10,	%f4
	fcmpgt16	%f6,	%f2,	%o1
	tvs	%xcc,	0x3
	fcmped	%fcc1,	%f10,	%f10
	fbule	%fcc1,	loop_355
loop_355:
	tcs	%icc,	0x0
	nop
	setx loop_356, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_356:
	fnor	%f12,	%f12,	%f12
	fbl	%fcc2,	loop_357
loop_357:
	sra	%i1,	0x0A,	%g1
	be,a	loop_358
loop_358:
	brgez	%i3,	loop_359
loop_359:
	tcs	%xcc,	0x6
	sth	%o5,	[%l7 + 0x38]
	srax	%i7,	0x00,	%i6
	bn,a,pn	%xcc,	loop_360
loop_360:
	fpsub16s	%f13,	%f10,	%f12
	fornot2s	%f2,	%f1,	%f8
	st	%f14,	[%l7 + 0x50]
	sra	%o3,	0x01,	%i4
	fcmple32	%f12,	%f0,	%o6
	movge	%xcc,	%g5,	%l2
	array16	%l5,	%i2,	%g3
	fmovsne	%icc,	%f2,	%f5
	mulx	%o0,	%g2,	%g6
	lduw	[%l7 + 0x18],	%o4
	movrlez	%l6,	0x19C,	%l0
	fbe,a	%fcc3,	loop_361
loop_361:
	sth	%g7,	[%l7 + 0x2E]
	fsrc2	%f2,	%f0
	sth	%g4,	[%l7 + 0x10]
	addccc	%o7,	0x18E3,	%i5
	ldsh	[%l7 + 0x7C],	%l3
	for	%f6,	%f12,	%f0
	ldx	[%l7 + 0x10],	%l1
	st	%f13,	[%l7 + 0x10]
	fpsub16	%f14,	%f0,	%f10
	edge16n	%i0,	%o2,	%l4
	fzeros	%f14
	ldsh	[%l7 + 0x68],	%o1
	fnors	%f0,	%f6,	%f12
	sdivcc	%i1,	0x1E19,	%i3
	fcmped	%fcc1,	%f10,	%f0
	smulcc	%g1,	%o5,	%i7
	edge16	%i6,	%o3,	%o6
	fandnot2	%f4,	%f2,	%f4
	fcmple16	%f10,	%f12,	%i4
	fmovdgu	%icc,	%f7,	%f14
	fcmpes	%fcc2,	%f6,	%f2
	edge32l	%l2,	%l5,	%g5
	fcmpne16	%f14,	%f10,	%i2
	bge	%xcc,	loop_362
loop_362:
	fmovsne	%xcc,	%f11,	%f14
	stb	%g3,	[%l7 + 0x75]
	bn,pt	%icc,	loop_363
loop_363:
	fnegd	%f0,	%f6
	fmovrsgz	%g2,	%f15,	%f6
	fmovsn	%icc,	%f2,	%f11
	bleu,pt	%xcc,	loop_364
loop_364:
	fmovd	%f10,	%f10
	fbo,a	%fcc1,	loop_365
loop_365:
	st	%f3,	[%l7 + 0x50]
	fand	%f10,	%f8,	%f6
	edge8	%g6,	%o0,	%l6
	ldub	[%l7 + 0x6C],	%o4
	fcmpne16	%f14,	%f4,	%g7
	andncc	%l0,	%o7,	%g4
	st	%f4,	[%l7 + 0x58]
	fbl	%fcc3,	loop_366
loop_366:
	fmovdvc	%xcc,	%f0,	%f7
	edge8l	%l3,	%l1,	%i0
	subc	%i5,	0x0B73,	%l4
	fpack16	%f14,	%f1
	fbul,a	%fcc3,	loop_367
loop_367:
	xor	%o1,	%i1,	%o2
	movcc	%xcc,	%i3,	%g1
	fmovrslz	%o5,	%f10,	%f1
	fmul8x16al	%f13,	%f7,	%f10
	bl,a,pt	%xcc,	loop_368
loop_368:
	fmovs	%f7,	%f11
	udivcc	%i6,	0x0562,	%i7
	fmovrdlz	%o6,	%f2,	%f2
	fnot1	%f0,	%f6
	fornot1	%f4,	%f2,	%f10
	sllx	%o3,	0x0F,	%i4
	fcmpne16	%f14,	%f0,	%l5
	ldub	[%l7 + 0x24],	%g5
	movrne	%l2,	%i2,	%g3
	edge8	%g6,	%g2,	%o0
	fornot2	%f6,	%f2,	%f14
	lduw	[%l7 + 0x64],	%o4
	ldsw	[%l7 + 0x28],	%l6
	andn	%g7,	0x0CF4,	%o7
	fmul8ulx16	%f2,	%f6,	%f14
	fmovscc	%icc,	%f5,	%f0
	edge32l	%g4,	%l3,	%l1
	fpackfix	%f10,	%f15
	subcc	%i0,	%l0,	%l4
	fandnot1s	%f5,	%f2,	%f3
	fornot2	%f14,	%f12,	%f10
	fcmpne32	%f0,	%f0,	%o1
	ldsw	[%l7 + 0x5C],	%i1
	st	%f3,	[%l7 + 0x34]
	fmovsa	%xcc,	%f3,	%f8
	be,a	loop_369
loop_369:
	ld	[%l7 + 0x3C],	%f1
	fmul8ulx16	%f10,	%f14,	%f6
	and	%i5,	0x13F1,	%o2
	bg	loop_370
loop_370:
	andcc	%i3,	0x1EC3,	%g1
	movl	%xcc,	%i6,	%o5
	fbu,a	%fcc3,	loop_371
loop_371:
	tge	%xcc,	0x6
	bneg,a	%icc,	loop_372
loop_372:
	xnorcc	%o6,	%o3,	%i7
	fbul	%fcc2,	loop_373
loop_373:
	fmovdleu	%icc,	%f14,	%f15
	ldsb	[%l7 + 0x34],	%l5
	ldx	[%l7 + 0x70],	%i4
	fnot2	%f4,	%f14
	lduh	[%l7 + 0x0A],	%g5
	fcmpeq16	%f4,	%f4,	%i2
	st	%f14,	[%l7 + 0x64]
	fpadd16s	%f2,	%f9,	%f1
	sethi	0x010E,	%g3
	mova	%xcc,	%g6,	%l2
	edge8	%g2,	%o0,	%o4
	sth	%l6,	[%l7 + 0x12]
	fmovscc	%xcc,	%f5,	%f2
	fnot1s	%f2,	%f6
	fnands	%f0,	%f8,	%f8
	lduh	[%l7 + 0x16],	%o7
	movrlez	%g7,	%g4,	%l3
	and	%i0,	%l1,	%l4
	ldsw	[%l7 + 0x70],	%o1
	tsubcctv	%l0,	%i5,	%i1
	ldx	[%l7 + 0x10],	%i3
	ldx	[%l7 + 0x68],	%o2
	tleu	%icc,	0x2
	movpos	%xcc,	%g1,	%o5
	movl	%icc,	%o6,	%o3
	fbe,a	%fcc2,	loop_374
loop_374:
	stb	%i6,	[%l7 + 0x41]
	fblg,a	%fcc1,	loop_375
loop_375:
	std	%f6,	[%l7 + 0x38]
	edge16	%i7,	%l5,	%i4
	ldub	[%l7 + 0x2A],	%i2
	fmovd	%f0,	%f14
	smulcc	%g5,	0x1E07,	%g3
	fpackfix	%f12,	%f1
	tg	%icc,	0x7
	te	%xcc,	0x2
	bge,a	%xcc,	loop_376
loop_376:
	fpsub32s	%f6,	%f3,	%f9
	fmovsle	%icc,	%f7,	%f2
	brgez,a	%g6,	loop_377
loop_377:
	taddcc	%g2,	%l2,	%o4
	fmul8x16	%f2,	%f0,	%f10
	fmovrsgz	%o0,	%f9,	%f3
	fmovsne	%xcc,	%f6,	%f0
	fpadd16s	%f5,	%f3,	%f7
	udivx	%o7,	0x0A31,	%g7
	brlz	%g4,	loop_378
loop_378:
	movrgz	%l6,	0x0AE,	%i0
	smulcc	%l3,	0x01ED,	%l1
	fnors	%f2,	%f5,	%f9
	fbul,a	%fcc2,	loop_379
loop_379:
	edge16ln	%l4,	%l0,	%i5
	edge8	%o1,	%i3,	%i1
	fpack16	%f6,	%f11
	andn	%g1,	%o2,	%o5
	fblg	%fcc2,	loop_380
loop_380:
	fxnor	%f2,	%f2,	%f4
	sra	%o3,	%i6,	%i7
	stx	%l5,	[%l7 + 0x70]
	ld	[%l7 + 0x60],	%f1
	lduw	[%l7 + 0x24],	%o6
	srl	%i4,	0x13,	%g5
	fpsub32	%f8,	%f14,	%f10
	fcmpes	%fcc1,	%f1,	%f9
	tcc	%xcc,	0x3
	tsubcc	%i2,	%g6,	%g3
	lduw	[%l7 + 0x38],	%l2
	ldub	[%l7 + 0x71],	%o4
	ldsw	[%l7 + 0x60],	%o0
	movre	%o7,	0x0C4,	%g2
	srax	%g7,	%l6,	%g4
	fcmpes	%fcc2,	%f8,	%f6
	fmovdneg	%icc,	%f15,	%f4
	movrgz	%l3,	%i0,	%l4
	fmovrslz	%l0,	%f10,	%f5
	move	%icc,	%l1,	%o1
	edge32ln	%i3,	%i5,	%i1
	ba,pn	%icc,	loop_381
loop_381:
	fmovdvs	%xcc,	%f0,	%f12
	bgu,pn	%icc,	loop_382
loop_382:
	ldx	[%l7 + 0x28],	%o2
	fsrc2	%f4,	%f8
	tne	%xcc,	0x2
	sth	%g1,	[%l7 + 0x70]
	ba,a	loop_383
loop_383:
	fnand	%f12,	%f14,	%f6
	ble,pt	%icc,	loop_384
loop_384:
	fbuge	%fcc1,	loop_385
loop_385:
	ld	[%l7 + 0x30],	%f8
	fand	%f10,	%f0,	%f2
	fbl	%fcc1,	loop_386
loop_386:
	fbn,a	%fcc3,	loop_387
loop_387:
	fbo,a	%fcc3,	loop_388
loop_388:
	movcs	%xcc,	%o3,	%i6
	fnegs	%f4,	%f10
	fbne,a	%fcc2,	loop_389
loop_389:
	ld	[%l7 + 0x28],	%f3
	srlx	%i7,	%o5,	%l5
	add	%i4,	0x0DEA,	%o6
	fnegd	%f10,	%f4
	sll	%i2,	%g6,	%g5
	edge8	%g3,	%o4,	%o0
	fmovrse	%o7,	%f1,	%f2
	brz	%g2,	loop_390
loop_390:
	sdivcc	%g7,	0x0F3C,	%l6
	fmovrdlz	%l2,	%f8,	%f4
	tcs	%xcc,	0x0
	sdivcc	%l3,	0x1FF1,	%g4
	fmovrsne	%i0,	%f12,	%f6
	fmovrdlez	%l0,	%f0,	%f12
	fmovdcs	%icc,	%f4,	%f10
	stx	%l4,	[%l7 + 0x08]
	fmovdn	%xcc,	%f4,	%f6
	st	%f10,	[%l7 + 0x5C]
	fandnot2s	%f7,	%f5,	%f12
	std	%f4,	[%l7 + 0x68]
	fand	%f6,	%f14,	%f2
	brgz,a	%l1,	loop_391
loop_391:
	umul	%o1,	%i5,	%i1
	lduw	[%l7 + 0x14],	%o2
	fbule	%fcc3,	loop_392
loop_392:
	ldd	[%l7 + 0x20],	%f14
	edge16	%i3,	%o3,	%i6
	st	%f11,	[%l7 + 0x14]
	ldx	[%l7 + 0x10],	%i7
	fornot1	%f4,	%f14,	%f2
	sth	%o5,	[%l7 + 0x78]
	fmovsleu	%xcc,	%f13,	%f9
	fmovrdlez	%g1,	%f10,	%f0
	fmovsl	%xcc,	%f10,	%f0
	lduh	[%l7 + 0x74],	%i4
	fmovsvc	%xcc,	%f15,	%f11
	fmovrdgez	%o6,	%f0,	%f4
	udiv	%l5,	0x15ED,	%i2
	fmovsneg	%xcc,	%f14,	%f9
	fnor	%f6,	%f6,	%f0
	fmovdvs	%xcc,	%f2,	%f1
	fcmpne16	%f4,	%f0,	%g6
	addc	%g3,	%g5,	%o4
	fbu	%fcc1,	loop_393
loop_393:
	sth	%o0,	[%l7 + 0x3A]
	fcmpd	%fcc1,	%f10,	%f0
	fcmps	%fcc1,	%f6,	%f14
	fand	%f0,	%f2,	%f10
	fbo,a	%fcc2,	loop_394
loop_394:
	fcmps	%fcc1,	%f8,	%f4
	fmovsvc	%icc,	%f11,	%f0
	fble	%fcc3,	loop_395
loop_395:
	fcmps	%fcc3,	%f4,	%f10
	fbn	%fcc2,	loop_396
loop_396:
	fbule	%fcc1,	loop_397
loop_397:
	fbule	%fcc3,	loop_398
loop_398:
	smul	%o7,	%g7,	%g2
	fmovs	%f15,	%f3
	ldd	[%l7 + 0x68],	%f10
	edge16ln	%l2,	%l3,	%l6
	mova	%xcc,	%g4,	%l0
	fsrc2s	%f8,	%f13
	ldsh	[%l7 + 0x62],	%l4
	tneg	%icc,	0x1
	tvs	%xcc,	0x7
	xnorcc	%l1,	%o1,	%i5
	fmovdvs	%xcc,	%f9,	%f14
	fsrc1	%f6,	%f4
	sth	%i0,	[%l7 + 0x62]
	ldx	[%l7 + 0x50],	%o2
	sth	%i1,	[%l7 + 0x30]
	tgu	%icc,	0x7
	orn	%o3,	0x11F3,	%i6
	nop
	setx loop_399, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_399:
	udivx	%i3,	0x146E,	%o5
	udivcc	%g1,	0x1CCE,	%i4
	bvs,a,pn	%xcc,	loop_400
loop_400:
	ldd	[%l7 + 0x20],	%f10
	ldd	[%l7 + 0x60],	%f2
	edge32	%i7,	%l5,	%i2
	fornot1	%f2,	%f4,	%f4
	subcc	%o6,	%g6,	%g5
	fmovscc	%icc,	%f14,	%f1
	smulcc	%o4,	%g3,	%o0
	bge,a,pt	%icc,	loop_401
loop_401:
	bn,pn	%xcc,	loop_402
loop_402:
	fmovdleu	%icc,	%f1,	%f3
	movne	%icc,	%o7,	%g7
	fbg	%fcc2,	loop_403
loop_403:
	edge32	%l2,	%g2,	%l3
	sra	%g4,	0x08,	%l0
	brlez	%l4,	loop_404
loop_404:
	nop
	setx loop_405, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_405:
	ldub	[%l7 + 0x56],	%l6
	bl,a,pt	%xcc,	loop_406
loop_406:
	fbo	%fcc3,	loop_407
loop_407:
	ldx	[%l7 + 0x50],	%l1
	bcs,a,pn	%icc,	loop_408
loop_408:
	te	%icc,	0x0
	subcc	%o1,	%i5,	%o2
	fnot1	%f14,	%f10
	ldd	[%l7 + 0x18],	%f12
	stw	%i1,	[%l7 + 0x48]
	edge16	%i0,	%o3,	%i3
	fmovrsgez	%i6,	%f6,	%f10
	fmovs	%f12,	%f1
	fmovdleu	%xcc,	%f4,	%f0
	lduw	[%l7 + 0x48],	%g1
	ldd	[%l7 + 0x70],	%f2
	stw	%i4,	[%l7 + 0x14]
	movleu	%icc,	%o5,	%l5
	fbuge,a	%fcc3,	loop_409
loop_409:
	movcc	%icc,	%i7,	%o6
	ldsb	[%l7 + 0x21],	%g6
	bge,pt	%xcc,	loop_410
loop_410:
	ldub	[%l7 + 0x27],	%i2
	fcmpeq32	%f14,	%f0,	%g5
	movrgez	%o4,	0x0A8,	%g3
	fbl,a	%fcc3,	loop_411
loop_411:
	movcs	%xcc,	%o0,	%o7
	fmovrdne	%l2,	%f2,	%f12
	sth	%g7,	[%l7 + 0x6C]
	xorcc	%l3,	0x0095,	%g4
	mulx	%l0,	0x0C73,	%l4
	ldd	[%l7 + 0x68],	%f0
	fmovrdgz	%g2,	%f12,	%f14
	bcc,a,pt	%icc,	loop_412
loop_412:
	fmovde	%xcc,	%f11,	%f1
	fmovrslez	%l6,	%f1,	%f7
	st	%f12,	[%l7 + 0x1C]
	edge16n	%l1,	%i5,	%o1
	movneg	%icc,	%i1,	%i0
	fpadd32	%f14,	%f14,	%f10
	bne,pn	%xcc,	loop_413
loop_413:
	fpsub16s	%f4,	%f7,	%f5
	fmovrsgez	%o3,	%f15,	%f2
	lduw	[%l7 + 0x20],	%i3
	taddcc	%i6,	%g1,	%i4
	fbue,a	%fcc3,	loop_414
loop_414:
	fmul8x16	%f10,	%f2,	%f0
	ldsw	[%l7 + 0x1C],	%o2
	fcmple32	%f12,	%f0,	%o5
	fone	%f6
	tl	%xcc,	0x1
	bn,a,pt	%xcc,	loop_415
loop_415:
	array32	%l5,	%o6,	%g6
	fbuge	%fcc1,	loop_416
loop_416:
	movvs	%xcc,	%i2,	%g5
	ldub	[%l7 + 0x48],	%o4
	bcc,pn	%xcc,	loop_417
loop_417:
	movrlez	%g3,	0x210,	%i7
	fcmpeq16	%f6,	%f8,	%o0
	fmovsn	%xcc,	%f9,	%f14
	std	%f4,	[%l7 + 0x08]
	ld	[%l7 + 0x14],	%f13
	fblg,a	%fcc1,	loop_418
loop_418:
	edge16n	%l2,	%g7,	%l3
	move	%icc,	%g4,	%o7
	movle	%icc,	%l0,	%g2
	fpadd32	%f2,	%f2,	%f2
	fbge,a	%fcc3,	loop_419
loop_419:
	edge32l	%l6,	%l1,	%l4
	nop
	setx loop_420, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_420:
	fcmpes	%fcc2,	%f4,	%f0
	fpadd16	%f0,	%f8,	%f2
	addc	%o1,	%i5,	%i0
	addccc	%i1,	0x112E,	%o3
	fzero	%f0
	brlz,a	%i6,	loop_421
loop_421:
	sdivx	%i3,	0x08F4,	%i4
	sth	%g1,	[%l7 + 0x5A]
	fnot2	%f2,	%f12
	fmovs	%f13,	%f11
	st	%f12,	[%l7 + 0x18]
	fnands	%f9,	%f10,	%f11
	fornot2	%f0,	%f4,	%f8
	fbue,a	%fcc2,	loop_422
loop_422:
	fmovsge	%icc,	%f6,	%f0
	ldsb	[%l7 + 0x7A],	%o2
	fbul,a	%fcc1,	loop_423
loop_423:
	movvs	%xcc,	%l5,	%o5
	fors	%f11,	%f14,	%f11
	tl	%icc,	0x7
	stb	%o6,	[%l7 + 0x12]
	tsubcctv	%g6,	%i2,	%o4
	call	loop_424
loop_424:
	ldsh	[%l7 + 0x24],	%g3
	movrlez	%g5,	%i7,	%o0
	movvs	%xcc,	%g7,	%l3
	bcs,a	%xcc,	loop_425
loop_425:
	fmovdcs	%xcc,	%f3,	%f8
	umulcc	%g4,	%l2,	%l0
	fmovdge	%icc,	%f7,	%f5
	fmovsn	%xcc,	%f1,	%f7
	fornot1	%f0,	%f10,	%f6
	st	%f15,	[%l7 + 0x58]
	fsrc1s	%f5,	%f2
	fcmpeq32	%f2,	%f2,	%g2
	andncc	%o7,	%l1,	%l6
	bcc,a,pn	%xcc,	loop_426
loop_426:
	nop
	setx loop_427, %l0, %l1
	jmpl %l1, %o1
loop_427:
	movcs	%xcc,	%l4,	%i0
	fba	%fcc1,	loop_428
loop_428:
	udiv	%i1,	0x07D0,	%i5
	fbne,a	%fcc1,	loop_429
loop_429:
	sth	%o3,	[%l7 + 0x2A]
	st	%f12,	[%l7 + 0x4C]
	ldx	[%l7 + 0x30],	%i3
	movrlz	%i4,	0x07D,	%g1
	fpsub16s	%f1,	%f15,	%f14
	brz,a	%i6,	loop_430
loop_430:
	ld	[%l7 + 0x5C],	%f5
	fpmerge	%f6,	%f4,	%f6
	edge32ln	%l5,	%o5,	%o2
	tg	%xcc,	0x7
	fmovrdne	%o6,	%f8,	%f6
	fcmpes	%fcc1,	%f10,	%f13
	popc	%g6,	%i2
	bneg,a	%icc,	loop_431
loop_431:
	lduh	[%l7 + 0x6A],	%o4
	tvs	%icc,	0x5
	be,pt	%icc,	loop_432
loop_432:
	fmovsl	%xcc,	%f0,	%f14
	fnand	%f2,	%f2,	%f6
	subcc	%g5,	0x07A0,	%g3
	edge8ln	%o0,	%i7,	%l3
	std	%f14,	[%l7 + 0x78]
	fones	%f1
	sdivcc	%g4,	0x1D2E,	%g7
	ldx	[%l7 + 0x38],	%l0
	fblg,a	%fcc1,	loop_433
loop_433:
	andcc	%g2,	%o7,	%l1
	movn	%xcc,	%l2,	%o1
	fxors	%f4,	%f11,	%f13
	srax	%l4,	%l6,	%i0
	fnegd	%f4,	%f2
	fnands	%f14,	%f6,	%f9
	call	loop_434
loop_434:
	fmovsle	%xcc,	%f3,	%f11
	fmovdcs	%icc,	%f12,	%f11
	edge8l	%i5,	%i1,	%o3
	fsrc2	%f0,	%f14
	edge8ln	%i3,	%g1,	%i4
	movn	%xcc,	%l5,	%i6
	sth	%o2,	[%l7 + 0x1A]
	udivx	%o6,	0x014E,	%g6
	tne	%icc,	0x5
	movn	%xcc,	%o5,	%o4
	tneg	%xcc,	0x3
	fmovda	%xcc,	%f6,	%f9
	fba	%fcc1,	loop_435
loop_435:
	edge8n	%i2,	%g5,	%g3
	fbul	%fcc2,	loop_436
loop_436:
	edge32ln	%i7,	%o0,	%l3
	lduh	[%l7 + 0x7A],	%g7
	fbe,a	%fcc3,	loop_437
loop_437:
	st	%f6,	[%l7 + 0x28]
	std	%f14,	[%l7 + 0x18]
	fsrc1	%f12,	%f12
	alignaddrl	%l0,	%g4,	%g2
	fmovsleu	%xcc,	%f5,	%f12
	fbo	%fcc2,	loop_438
loop_438:
	mulx	%l1,	0x1C1D,	%o7
	fmul8x16au	%f8,	%f15,	%f4
	sdiv	%l2,	0x00AB,	%l4
	fmovrsgz	%o1,	%f2,	%f1
	ldsh	[%l7 + 0x3C],	%i0
	ldub	[%l7 + 0x33],	%i5
	addc	%l6,	0x0A41,	%i1
	nop
	setx loop_439, %l0, %l1
	jmpl %l1, %i3
loop_439:
	sra	%o3,	%g1,	%i4
	fmovsleu	%xcc,	%f0,	%f15
	brz,a	%i6,	loop_440
loop_440:
	fbuge	%fcc3,	loop_441
loop_441:
	fmovrsgez	%o2,	%f5,	%f1
	fmul8ulx16	%f8,	%f14,	%f0
	udivx	%l5,	0x14EF,	%o6
	fmuld8sux16	%f7,	%f0,	%f6
	sllx	%g6,	0x1B,	%o5
	stw	%o4,	[%l7 + 0x54]
	fcmpes	%fcc3,	%f11,	%f2
	fpack32	%f4,	%f10,	%f12
	brgez	%i2,	loop_442
loop_442:
	fbge	%fcc0,	loop_443
loop_443:
	ldsh	[%l7 + 0x24],	%g5
	fmovrsne	%i7,	%f15,	%f6
	taddcc	%o0,	%l3,	%g3
	stb	%l0,	[%l7 + 0x52]
	fbe	%fcc2,	loop_444
loop_444:
	ldsw	[%l7 + 0x78],	%g4
	movcc	%xcc,	%g2,	%l1
	tvs	%icc,	0x5
	bpos,pn	%icc,	loop_445
loop_445:
	sdivcc	%g7,	0x03E7,	%o7
	srlx	%l4,	0x09,	%o1
	fxnors	%f12,	%f9,	%f13
	fone	%f4
	fbge,a	%fcc0,	loop_446
loop_446:
	fxors	%f5,	%f12,	%f11
	ldx	[%l7 + 0x60],	%l2
	stx	%i5,	[%l7 + 0x50]
	fabss	%f6,	%f12
	fmul8x16au	%f13,	%f11,	%f8
	lduh	[%l7 + 0x40],	%i0
	ta	%xcc,	0x1
	fnegs	%f13,	%f13
	fmovrsgez	%l6,	%f9,	%f13
	fmovdl	%xcc,	%f0,	%f10
	bge,a,pt	%xcc,	loop_447
loop_447:
	brz	%i1,	loop_448
loop_448:
	ldub	[%l7 + 0x41],	%o3
	ldsb	[%l7 + 0x33],	%g1
	fornot2s	%f14,	%f6,	%f4
	movvc	%icc,	%i3,	%i6
	fbug	%fcc2,	loop_449
loop_449:
	fblg,a	%fcc1,	loop_450
loop_450:
	fbg	%fcc1,	loop_451
loop_451:
	stw	%i4,	[%l7 + 0x64]
	move	%icc,	%o2,	%o6
	std	%f4,	[%l7 + 0x08]
	edge16ln	%g6,	%o5,	%o4
	ldsw	[%l7 + 0x10],	%l5
	brgez	%g5,	loop_452
loop_452:
	fbuge,a	%fcc1,	loop_453
loop_453:
	fmovsvc	%icc,	%f1,	%f12
	fmovdge	%icc,	%f5,	%f9
	fsrc2	%f4,	%f4
	movg	%xcc,	%i7,	%o0
	fandnot2s	%f1,	%f5,	%f4
	fbge	%fcc0,	loop_454
loop_454:
	fzeros	%f15
	fone	%f4
	umulcc	%i2,	0x0CB0,	%l3
	ldsw	[%l7 + 0x2C],	%l0
	movneg	%icc,	%g4,	%g3
	fzeros	%f5
	movrgz	%l1,	%g7,	%o7
	sllx	%g2,	0x01,	%o1
	fornot1s	%f8,	%f1,	%f14
	andcc	%l4,	0x1C57,	%i5
	ldsb	[%l7 + 0x4F],	%l2
	ldsb	[%l7 + 0x65],	%i0
	brlez,a	%l6,	loop_455
loop_455:
	st	%f1,	[%l7 + 0x30]
	fcmpes	%fcc0,	%f0,	%f0
	tg	%xcc,	0x5
	lduh	[%l7 + 0x7C],	%o3
	fcmpgt16	%f14,	%f6,	%g1
	bpos,pn	%xcc,	loop_456
loop_456:
	subcc	%i3,	0x0E91,	%i6
	ld	[%l7 + 0x3C],	%f15
	fbug,a	%fcc0,	loop_457
loop_457:
	array8	%i1,	%o2,	%o6
	fbue	%fcc2,	loop_458
loop_458:
	fmovdl	%xcc,	%f3,	%f9
	ldd	[%l7 + 0x18],	%f2
	tge	%icc,	0x7
	fornot2	%f8,	%f12,	%f2
	fzero	%f6
	std	%f4,	[%l7 + 0x78]
	movne	%xcc,	%i4,	%g6
	sra	%o4,	%l5,	%o5
	array32	%i7,	%o0,	%i2
	fbl	%fcc3,	loop_459
loop_459:
	bpos,a	loop_460
loop_460:
	fmovrde	%g5,	%f8,	%f6
	sth	%l0,	[%l7 + 0x32]
	fmovd	%f6,	%f12
	ble,pn	%icc,	loop_461
loop_461:
	brgz,a	%g4,	loop_462
loop_462:
	fpadd16s	%f10,	%f14,	%f5
	bneg,a,pt	%xcc,	loop_463
loop_463:
	fmovsn	%icc,	%f14,	%f5
	fmovsl	%xcc,	%f14,	%f1
	movvc	%xcc,	%l3,	%g3
	bcs,a,pn	%icc,	loop_464
loop_464:
	fmovdgu	%xcc,	%f2,	%f9
	fnot2s	%f12,	%f12
	fmovdcc	%icc,	%f1,	%f10
	fbo,a	%fcc3,	loop_465
loop_465:
	fbne,a	%fcc1,	loop_466
loop_466:
	subcc	%g7,	0x1BA8,	%o7
	stx	%g2,	[%l7 + 0x28]
	fmul8x16al	%f7,	%f8,	%f10
	edge32n	%o1,	%l1,	%l4
	fbe,a	%fcc3,	loop_467
loop_467:
	tn	%icc,	0x0
	ldd	[%l7 + 0x78],	%f10
	fmovdge	%xcc,	%f14,	%f4
	st	%f2,	[%l7 + 0x3C]
	nop
	setx loop_468, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_468:
	fmovsn	%xcc,	%f12,	%f15
	sub	%l2,	0x10BA,	%i0
	brlz,a	%l6,	loop_469
loop_469:
	andn	%o3,	0x0D48,	%g1
	fnot1s	%f15,	%f15
	fsrc2	%f10,	%f6
	std	%f0,	[%l7 + 0x10]
	fmul8x16au	%f3,	%f15,	%f10
	stw	%i3,	[%l7 + 0x1C]
	fornot1	%f0,	%f0,	%f14
	ldsb	[%l7 + 0x09],	%i5
	tn	%icc,	0x2
	ldsh	[%l7 + 0x4A],	%i1
	movneg	%icc,	%o2,	%i6
	ldsw	[%l7 + 0x28],	%i4
	move	%xcc,	%g6,	%o6
	srl	%o4,	0x02,	%o5
	brz	%l5,	loop_470
loop_470:
	fmovda	%xcc,	%f14,	%f4
	std	%f10,	[%l7 + 0x08]
	edge16ln	%i7,	%o0,	%i2
	nop
	setx loop_471, %l0, %l1
	jmpl %l1, %g5
loop_471:
	fcmpeq32	%f4,	%f10,	%g4
	ldd	[%l7 + 0x50],	%f8
	xorcc	%l0,	0x1FD5,	%l3
	sub	%g7,	0x10B6,	%o7
	fbn,a	%fcc1,	loop_472
loop_472:
	nop
	setx loop_473, %l0, %l1
	jmpl %l1, %g2
loop_473:
	bcs,a,pt	%icc,	loop_474
loop_474:
	be,a,pt	%xcc,	loop_475
loop_475:
	ldsh	[%l7 + 0x5C],	%o1
	movneg	%xcc,	%l1,	%g3
	xorcc	%l2,	%i0,	%l6
	ldsw	[%l7 + 0x74],	%l4
	ldd	[%l7 + 0x20],	%f10
	ldsb	[%l7 + 0x47],	%o3
	std	%f2,	[%l7 + 0x10]
	fzero	%f8
	fmul8ulx16	%f4,	%f2,	%f12
	fsrc2s	%f2,	%f7
	fmul8x16al	%f10,	%f6,	%f2
	udivx	%g1,	0x0BE8,	%i5
	st	%f9,	[%l7 + 0x40]
	fbne	%fcc0,	loop_476
loop_476:
	fmovdl	%xcc,	%f10,	%f10
	ldsw	[%l7 + 0x58],	%i3
	ldub	[%l7 + 0x1E],	%i1
	lduh	[%l7 + 0x14],	%o2
	fpack16	%f6,	%f3
	movrne	%i6,	%i4,	%g6
	ldsw	[%l7 + 0x3C],	%o4
	lduw	[%l7 + 0x20],	%o5
	std	%f4,	[%l7 + 0x60]
	fmuld8sux16	%f4,	%f12,	%f12
	brgez,a	%l5,	loop_477
loop_477:
	fmovsgu	%xcc,	%f14,	%f1
	fmovde	%icc,	%f11,	%f11
	ldsh	[%l7 + 0x24],	%i7
	addc	%o0,	0x1DF0,	%o6
	bneg	loop_478
loop_478:
	fmul8x16au	%f11,	%f14,	%f2
	alignaddrl	%i2,	%g4,	%g5
	fmuld8ulx16	%f4,	%f4,	%f14
	fcmpes	%fcc3,	%f4,	%f11
	andcc	%l3,	0x0780,	%g7
	mulscc	%o7,	0x0A63,	%l0
	movn	%xcc,	%g2,	%l1
	fmovdleu	%icc,	%f7,	%f2
	bgu	%icc,	loop_479
loop_479:
	fandnot2	%f8,	%f14,	%f6
	array32	%g3,	%l2,	%o1
	fbne,a	%fcc2,	loop_480
loop_480:
	srl	%l6,	0x05,	%i0
	movgu	%icc,	%o3,	%l4
	brgz	%g1,	loop_481
loop_481:
	st	%f7,	[%l7 + 0x10]
	fbg	%fcc3,	loop_482
loop_482:
	stw	%i3,	[%l7 + 0x60]
	movg	%icc,	%i1,	%o2
	fmovsvc	%xcc,	%f5,	%f6
	fble,a	%fcc1,	loop_483
loop_483:
	fmovrslz	%i5,	%f2,	%f10
	fpsub16	%f14,	%f2,	%f10
	tn	%xcc,	0x1
	bvs,pt	%icc,	loop_484
loop_484:
	stw	%i4,	[%l7 + 0x38]
	fpmerge	%f0,	%f12,	%f2
	andcc	%i6,	%g6,	%o4
	ldsb	[%l7 + 0x5D],	%l5
	st	%f13,	[%l7 + 0x20]
	fbul	%fcc1,	loop_485
loop_485:
	stx	%i7,	[%l7 + 0x58]
	fzero	%f8
	stw	%o0,	[%l7 + 0x30]
	fmovdne	%xcc,	%f5,	%f10
	andcc	%o5,	%o6,	%i2
	lduw	[%l7 + 0x10],	%g4
	fcmps	%fcc3,	%f3,	%f14
	tge	%icc,	0x6
	st	%f10,	[%l7 + 0x68]
	edge16	%g5,	%g7,	%l3
	brz	%o7,	loop_486
loop_486:
	brlez	%g2,	loop_487
loop_487:
	xor	%l1,	0x138F,	%l0
	tneg	%xcc,	0x4
	fandnot2s	%f12,	%f2,	%f12
	fmovdg	%icc,	%f11,	%f5
	fnot1	%f8,	%f8
	fmovsn	%icc,	%f0,	%f10
	ble,a,pt	%icc,	loop_488
loop_488:
	sth	%l2,	[%l7 + 0x70]
	fzero	%f2
	sra	%g3,	0x02,	%l6
	movneg	%xcc,	%i0,	%o3
	bleu	%xcc,	loop_489
loop_489:
	fmovsge	%xcc,	%f5,	%f13
	tneg	%xcc,	0x7
	bg	%icc,	loop_490
loop_490:
	fmovdleu	%xcc,	%f6,	%f0
	stx	%l4,	[%l7 + 0x08]
	fcmpd	%fcc3,	%f6,	%f0
	sllx	%o1,	0x09,	%i3
	edge8l	%i1,	%g1,	%o2
	movneg	%icc,	%i4,	%i6
	stb	%i5,	[%l7 + 0x4C]
	fpackfix	%f4,	%f4
	fnegs	%f9,	%f11
	movvs	%xcc,	%o4,	%l5
	fbuge,a	%fcc1,	loop_491
loop_491:
	fxnor	%f2,	%f14,	%f4
	sub	%g6,	0x0962,	%o0
	bg	loop_492
loop_492:
	bne	%icc,	loop_493
loop_493:
	bl,a	loop_494
loop_494:
	fbule,a	%fcc0,	loop_495
loop_495:
	stx	%o5,	[%l7 + 0x70]
	orcc	%i7,	%i2,	%g4
	addcc	%g5,	%o6,	%l3
	addccc	%o7,	%g7,	%g2
	fmuld8ulx16	%f8,	%f6,	%f0
	ldsh	[%l7 + 0x16],	%l0
	tvc	%icc,	0x3
	addcc	%l2,	0x1988,	%l1
	fbue	%fcc1,	loop_496
loop_496:
	fpack16	%f12,	%f5
	movrne	%l6,	0x3AC,	%g3
	ldsb	[%l7 + 0x30],	%o3
	ldd	[%l7 + 0x28],	%f2
	orn	%l4,	%i0,	%i3
	fsrc2	%f14,	%f4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type f   	: 316
!	Type i   	: 289
!	Type cti   	: 193
!	Type l   	: 202
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
main_t2:

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0x7,	%g2
	set	0x4,	%g3
	set	0x3,	%g4
	set	0x4,	%g5
	set	0x5,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x7,	%i1
	set	-0xF,	%i2
	set	-0x3,	%i3
	set	-0x7,	%i4
	set	-0x7,	%i5
	set	-0xE,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x08BC0D68,	%l0
	set	0x1FD19D31,	%l1
	set	0x16384C65,	%l2
	set	0x052F0966,	%l3
	set	0x236FA62F,	%l4
	set	0x28C2DC2A,	%l5
	set	0x59D84575,	%l6
	!# Output registers
	set	-0x1B3C,	%o0
	set	-0x0F10,	%o1
	set	-0x03FF,	%o2
	set	0x106F,	%o3
	set	-0x14C0,	%o4
	set	0x083C,	%o5
	set	0x0F39,	%o6
	set	-0x0D8B,	%o7

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

	movrgez	%i1,	%g1,	%o2
	lduh	[%l7 + 0x1E],	%i4
	fmovscs	%xcc,	%f8,	%f9
	movl	%xcc,	%o1,	%i5
	mulx	%i6,	%l5,	%g6
	fornot2s	%f0,	%f11,	%f5
	fcmpne16	%f2,	%f8,	%o0
	movre	%o4,	%i7,	%o5
	fmul8x16	%f10,	%f4,	%f2
	stx	%i2,	[%l7 + 0x70]
	fmul8x16	%f2,	%f14,	%f14
	sllx	%g4,	0x12,	%o6
	movcs	%icc,	%g5,	%l3
	edge8n	%o7,	%g7,	%g2
	bleu,a,pt	%xcc,	loop_497
loop_497:
	for	%f8,	%f10,	%f0
	array32	%l2,	%l1,	%l0
	umulcc	%g3,	%l6,	%o3
	movcc	%xcc,	%i0,	%i3
	xnor	%l4,	0x18CF,	%i1
	edge32n	%o2,	%g1,	%o1
	udivcc	%i5,	0x0DF7,	%i4
	fbl	%fcc1,	loop_498
loop_498:
	be	%xcc,	loop_499
loop_499:
	sdiv	%l5,	0x07AD,	%g6
	ldsb	[%l7 + 0x43],	%o0
	ldsb	[%l7 + 0x37],	%o4
	mulscc	%i6,	0x1706,	%o5
	tl	%xcc,	0x0
	sub	%i7,	%g4,	%o6
	fcmpeq32	%f6,	%f14,	%g5
	tn	%xcc,	0x7
	sethi	0x1539,	%i2
	fbug	%fcc1,	loop_500
loop_500:
	be	%xcc,	loop_501
loop_501:
	stw	%o7,	[%l7 + 0x3C]
	ldx	[%l7 + 0x08],	%l3
	fxnors	%f0,	%f11,	%f13
	movcc	%xcc,	%g7,	%g2
	movrlez	%l1,	%l0,	%l2
	movrgez	%g3,	0x21D,	%o3
	bpos,a	loop_502
loop_502:
	fbue,a	%fcc2,	loop_503
loop_503:
	ldsw	[%l7 + 0x28],	%i0
	bn,a,pt	%icc,	loop_504
loop_504:
	subcc	%l6,	%i3,	%i1
	mulscc	%l4,	%o2,	%o1
	orcc	%g1,	0x1E71,	%i5
	edge16l	%i4,	%l5,	%o0
	te	%icc,	0x3
	udivx	%o4,	0x1937,	%i6
	orn	%g6,	%i7,	%g4
	fmovrsgz	%o6,	%f2,	%f11
	udivx	%g5,	0x0806,	%i2
	edge8n	%o7,	%l3,	%g7
	tl	%icc,	0x7
	add	%g2,	%o5,	%l0
	fmovdvs	%xcc,	%f2,	%f3
	fmovsne	%xcc,	%f3,	%f6
	fmuld8sux16	%f7,	%f6,	%f8
	array16	%l1,	%l2,	%o3
	xor	%g3,	%i0,	%i3
	movvc	%icc,	%i1,	%l6
	fcmped	%fcc3,	%f6,	%f10
	fpackfix	%f8,	%f7
	umulcc	%o2,	0x0706,	%o1
	array8	%l4,	%i5,	%i4
	movrlz	%l5,	%o0,	%g1
	edge32n	%i6,	%o4,	%g6
	tleu	%xcc,	0x2
	fmovsgu	%xcc,	%f11,	%f2
	xor	%g4,	%i7,	%o6
	movvs	%icc,	%i2,	%o7
	move	%icc,	%g5,	%g7
	fmovsvc	%xcc,	%f0,	%f11
	tneg	%xcc,	0x7
	subccc	%g2,	%l3,	%l0
	array8	%l1,	%o5,	%o3
	umul	%l2,	0x0A4C,	%g3
	fmovrdlez	%i0,	%f2,	%f8
	movcc	%icc,	%i1,	%i3
	fmovsgu	%xcc,	%f8,	%f2
	fsrc1s	%f2,	%f3
	stx	%o2,	[%l7 + 0x60]
	edge32l	%o1,	%l6,	%i5
	lduh	[%l7 + 0x4A],	%l4
	faligndata	%f12,	%f0,	%f0
	xnor	%i4,	%l5,	%g1
	nop
	setx loop_505, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_505:
	fmovdge	%xcc,	%f8,	%f12
	movre	%o0,	%o4,	%g6
	fpsub16s	%f6,	%f13,	%f3
	subccc	%g4,	%i6,	%i7
	andcc	%i2,	%o7,	%g5
	srl	%o6,	%g7,	%g2
	movcc	%xcc,	%l3,	%l0
	stb	%o5,	[%l7 + 0x4F]
	sdivcc	%o3,	0x02EA,	%l2
	ldub	[%l7 + 0x20],	%l1
	movrlz	%i0,	0x20C,	%i1
	umulcc	%g3,	%o2,	%i3
	bpos,pt	%xcc,	loop_506
loop_506:
	umulcc	%l6,	0x1A85,	%i5
	fpadd32	%f8,	%f2,	%f10
	stw	%o1,	[%l7 + 0x34]
	nop
	setx loop_507, %l0, %l1
	jmpl %l1, %l4
loop_507:
	edge32l	%l5,	%i4,	%g1
	ldsb	[%l7 + 0x4A],	%o0
	siam	0x1
	tsubcc	%g6,	%o4,	%i6
	fabss	%f13,	%f8
	tne	%xcc,	0x4
	udivcc	%i7,	0x14B2,	%i2
	nop
	setx loop_508, %l0, %l1
	jmpl %l1, %o7
loop_508:
	movpos	%xcc,	%g4,	%g5
	movneg	%xcc,	%g7,	%o6
	movle	%xcc,	%g2,	%l3
	movrgz	%o5,	%o3,	%l2
	fbe,a	%fcc1,	loop_509
loop_509:
	fblg,a	%fcc2,	loop_510
loop_510:
	bvs,a,pn	%xcc,	loop_511
loop_511:
	stw	%l0,	[%l7 + 0x14]
	fmovrde	%i0,	%f6,	%f4
	bvc	loop_512
loop_512:
	std	%f14,	[%l7 + 0x10]
	edge8n	%i1,	%g3,	%l1
	fmovsleu	%icc,	%f13,	%f7
	movrne	%i3,	%o2,	%l6
	andcc	%o1,	%i5,	%l5
	tvc	%xcc,	0x2
	fmovdne	%xcc,	%f6,	%f5
	lduh	[%l7 + 0x16],	%l4
	movcc	%icc,	%i4,	%o0
	sethi	0x1B77,	%g1
	tge	%icc,	0x1
	movle	%icc,	%g6,	%i6
	tsubcctv	%i7,	0x1BC4,	%i2
	fba,a	%fcc2,	loop_513
loop_513:
	fxors	%f5,	%f11,	%f10
	mulscc	%o4,	%o7,	%g5
	edge16l	%g7,	%o6,	%g2
	fbug	%fcc3,	loop_514
loop_514:
	movrlz	%l3,	%g4,	%o5
	fbul,a	%fcc3,	loop_515
loop_515:
	lduh	[%l7 + 0x20],	%l2
	tn	%icc,	0x2
	srax	%o3,	%l0,	%i0
	movg	%xcc,	%g3,	%l1
	edge32	%i1,	%i3,	%l6
	lduw	[%l7 + 0x2C],	%o2
	tleu	%xcc,	0x2
	tcs	%xcc,	0x6
	bcs,pn	%xcc,	loop_516
loop_516:
	tvc	%xcc,	0x3
	tvs	%icc,	0x2
	fmovrde	%i5,	%f6,	%f8
	sub	%o1,	0x02D2,	%l4
	edge16	%l5,	%i4,	%g1
	movgu	%icc,	%g6,	%o0
	edge32n	%i7,	%i6,	%o4
	nop
	setx loop_517, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_517:
	fnot1	%f2,	%f10
	movneg	%xcc,	%o7,	%g5
	tvc	%xcc,	0x1
	alignaddr	%i2,	%g7,	%o6
	srlx	%g2,	%g4,	%o5
	array32	%l3,	%o3,	%l0
	ldd	[%l7 + 0x70],	%f12
	fandnot2s	%f10,	%f4,	%f8
	fabsd	%f10,	%f2
	fnot1	%f2,	%f2
	alignaddr	%i0,	%l2,	%l1
	fbule,a	%fcc2,	loop_518
loop_518:
	smul	%i1,	%i3,	%g3
	udivcc	%o2,	0x11A0,	%i5
	sethi	0x0FAD,	%l6
	fbu	%fcc2,	loop_519
loop_519:
	sdivx	%l4,	0x02B7,	%l5
	umul	%o1,	0x0BAC,	%g1
	brlz,a	%g6,	loop_520
loop_520:
	fmul8x16au	%f14,	%f4,	%f0
	orn	%i4,	0x0212,	%i7
	fmovsvs	%xcc,	%f0,	%f15
	ldsw	[%l7 + 0x0C],	%i6
	tvc	%icc,	0x3
	subcc	%o4,	0x1091,	%o7
	sdivcc	%g5,	0x13FA,	%i2
	edge16ln	%o0,	%g7,	%g2
	tn	%icc,	0x3
	ble,a,pt	%icc,	loop_521
loop_521:
	fors	%f0,	%f14,	%f0
	smul	%g4,	%o5,	%l3
	movre	%o6,	0x3DB,	%o3
	tg	%xcc,	0x1
	sth	%i0,	[%l7 + 0x22]
	brlez,a	%l0,	loop_522
loop_522:
	subc	%l1,	%i1,	%l2
	ldub	[%l7 + 0x22],	%i3
	tsubcc	%g3,	%o2,	%l6
	tg	%xcc,	0x1
	ldsb	[%l7 + 0x3C],	%i5
	andncc	%l5,	%l4,	%o1
	bne	%icc,	loop_523
loop_523:
	lduw	[%l7 + 0x44],	%g1
	edge16	%i4,	%i7,	%g6
	tpos	%xcc,	0x7
	edge32n	%o4,	%o7,	%i6
	movneg	%icc,	%g5,	%i2
	tvc	%xcc,	0x3
	sethi	0x11AD,	%o0
	stw	%g7,	[%l7 + 0x54]
	edge8	%g4,	%g2,	%l3
	tpos	%icc,	0x1
	subccc	%o5,	%o3,	%o6
	fexpand	%f8,	%f6
	orn	%l0,	%l1,	%i1
	taddcctv	%i0,	0x0E02,	%l2
	lduh	[%l7 + 0x32],	%g3
	tgu	%xcc,	0x1
	movvs	%icc,	%o2,	%i3
	edge32ln	%l6,	%l5,	%l4
	fnot1	%f10,	%f6
	fbug,a	%fcc0,	loop_524
loop_524:
	taddcc	%o1,	0x02F6,	%g1
	and	%i5,	%i7,	%i4
	array32	%o4,	%o7,	%i6
	fmovdneg	%xcc,	%f15,	%f13
	siam	0x1
	bn,pt	%xcc,	loop_525
loop_525:
	edge32	%g6,	%g5,	%i2
	edge16ln	%o0,	%g4,	%g2
	udiv	%g7,	0x0AEE,	%o5
	lduw	[%l7 + 0x68],	%l3
	ldsw	[%l7 + 0x60],	%o6
	movrgez	%o3,	%l0,	%i1
	ldub	[%l7 + 0x1B],	%i0
	array16	%l1,	%g3,	%l2
	sllx	%o2,	0x06,	%i3
	tsubcctv	%l6,	%l4,	%l5
	smulcc	%o1,	0x0686,	%i5
	fors	%f14,	%f10,	%f4
	bcs,a,pn	%icc,	loop_526
loop_526:
	move	%icc,	%i7,	%i4
	taddcc	%o4,	%o7,	%g1
	add	%g6,	0x0E86,	%g5
	move	%xcc,	%i2,	%i6
	array32	%o0,	%g2,	%g7
	bvs,a	%icc,	loop_527
loop_527:
	sth	%o5,	[%l7 + 0x28]
	srl	%g4,	0x0B,	%o6
	fbe	%fcc2,	loop_528
loop_528:
	fsrc2s	%f7,	%f3
	fpack16	%f4,	%f2
	udivcc	%l3,	0x0AA9,	%o3
	movpos	%icc,	%i1,	%i0
	array16	%l0,	%l1,	%l2
	xnorcc	%g3,	%o2,	%l6
	ldsb	[%l7 + 0x6E],	%i3
	ba,a	%icc,	loop_529
loop_529:
	alignaddrl	%l4,	%l5,	%o1
	movvc	%xcc,	%i7,	%i4
	faligndata	%f8,	%f10,	%f4
	or	%o4,	0x08D2,	%o7
	ldsh	[%l7 + 0x74],	%i5
	movle	%icc,	%g6,	%g1
	std	%f2,	[%l7 + 0x28]
	sth	%i2,	[%l7 + 0x14]
	movleu	%icc,	%g5,	%i6
	movcc	%xcc,	%g2,	%g7
	stb	%o0,	[%l7 + 0x43]
	nop
	setx loop_530, %l0, %l1
	jmpl %l1, %o5
loop_530:
	movrne	%g4,	%o6,	%l3
	fornot1s	%f8,	%f0,	%f15
	fnands	%f8,	%f15,	%f4
	lduh	[%l7 + 0x62],	%i1
	addc	%o3,	%l0,	%l1
	be,a,pt	%icc,	loop_531
loop_531:
	and	%l2,	%i0,	%g3
	sdivx	%l6,	0x11D1,	%o2
	std	%f14,	[%l7 + 0x60]
	orcc	%l4,	0x0516,	%l5
	edge16n	%i3,	%i7,	%o1
	tvs	%xcc,	0x4
	srax	%o4,	%i4,	%o7
	alignaddr	%i5,	%g1,	%i2
	subcc	%g5,	0x174C,	%i6
	fornot2s	%f2,	%f3,	%f14
	tl	%xcc,	0x1
	movre	%g2,	0x34E,	%g7
	srax	%o0,	0x06,	%g6
	move	%icc,	%o5,	%o6
	xorcc	%l3,	%g4,	%i1
	tne	%xcc,	0x7
	addc	%l0,	%o3,	%l1
	fmovda	%icc,	%f0,	%f11
	fcmple16	%f8,	%f2,	%l2
	addcc	%i0,	%l6,	%o2
	fornot2s	%f7,	%f13,	%f0
	ld	[%l7 + 0x7C],	%f1
	bvs,a,pn	%xcc,	loop_532
loop_532:
	brlz,a	%l4,	loop_533
loop_533:
	mulscc	%l5,	0x1EA5,	%i3
	edge8ln	%g3,	%o1,	%o4
	subcc	%i4,	%i7,	%o7
	edge8n	%g1,	%i2,	%i5
	fcmple16	%f8,	%f4,	%i6
	xor	%g2,	0x1CEC,	%g5
	bl,a	%icc,	loop_534
loop_534:
	ldx	[%l7 + 0x10],	%g7
	array16	%o0,	%g6,	%o5
	bpos,pn	%xcc,	loop_535
loop_535:
	fmovsne	%xcc,	%f7,	%f14
	taddcctv	%l3,	%g4,	%i1
	fsrc2s	%f0,	%f4
	movrgez	%o6,	0x11C,	%o3
	edge16l	%l0,	%l2,	%i0
	xor	%l1,	0x19CF,	%l6
	movneg	%icc,	%l4,	%o2
	subcc	%i3,	0x1573,	%g3
	sll	%o1,	0x0C,	%l5
	movneg	%xcc,	%i4,	%i7
	stx	%o4,	[%l7 + 0x40]
	edge32n	%o7,	%g1,	%i2
	fbn	%fcc1,	loop_536
loop_536:
	ld	[%l7 + 0x48],	%f4
	fmovdneg	%icc,	%f0,	%f12
	subccc	%i5,	0x172C,	%g2
	fbu,a	%fcc3,	loop_537
loop_537:
	edge8	%i6,	%g5,	%g7
	fmovdneg	%icc,	%f4,	%f6
	edge8n	%g6,	%o0,	%o5
	move	%xcc,	%g4,	%l3
	ldd	[%l7 + 0x78],	%f12
	fmovdn	%icc,	%f0,	%f14
	alignaddrl	%i1,	%o3,	%o6
	sethi	0x028C,	%l0
	ldsh	[%l7 + 0x10],	%i0
	subcc	%l2,	%l6,	%l4
	and	%o2,	%l1,	%i3
	andncc	%g3,	%l5,	%i4
	sub	%o1,	0x1BA4,	%o4
	brgez	%o7,	loop_538
loop_538:
	bn,a,pn	%icc,	loop_539
loop_539:
	ta	%xcc,	0x7
	ldub	[%l7 + 0x61],	%i7
	array32	%g1,	%i5,	%g2
	bgu,a,pt	%xcc,	loop_540
loop_540:
	orncc	%i2,	%i6,	%g7
	fmovsleu	%xcc,	%f3,	%f6
	lduw	[%l7 + 0x38],	%g5
	and	%o0,	0x0B9B,	%g6
	tl	%xcc,	0x5
	alignaddrl	%o5,	%g4,	%i1
	movrgez	%l3,	%o6,	%o3
	udiv	%i0,	0x1C9C,	%l2
	movge	%icc,	%l0,	%l4
	andncc	%o2,	%l6,	%l1
	brz,a	%i3,	loop_541
loop_541:
	lduw	[%l7 + 0x34],	%l5
	movpos	%icc,	%i4,	%o1
	fbug	%fcc3,	loop_542
loop_542:
	tgu	%icc,	0x0
	tne	%icc,	0x4
	movne	%xcc,	%g3,	%o4
	move	%xcc,	%o7,	%g1
	ldsw	[%l7 + 0x54],	%i5
	mulscc	%g2,	0x14A4,	%i7
	ld	[%l7 + 0x3C],	%f11
	fxnors	%f4,	%f7,	%f5
	fmovsvc	%icc,	%f7,	%f4
	ld	[%l7 + 0x30],	%f6
	sethi	0x0E00,	%i6
	brgz	%i2,	loop_543
loop_543:
	movleu	%xcc,	%g5,	%o0
	brz	%g7,	loop_544
loop_544:
	tl	%icc,	0x3
	movrlez	%g6,	%o5,	%g4
	fandnot2s	%f3,	%f7,	%f15
	array8	%l3,	%o6,	%o3
	edge8ln	%i1,	%l2,	%i0
	mova	%icc,	%l4,	%o2
	fcmpd	%fcc1,	%f14,	%f8
	edge32n	%l6,	%l0,	%i3
	std	%f4,	[%l7 + 0x78]
	sth	%l5,	[%l7 + 0x16]
	umul	%i4,	0x1075,	%l1
	tg	%icc,	0x1
	tvs	%icc,	0x5
	pdist	%f4,	%f4,	%f4
	brgez,a	%o1,	loop_545
loop_545:
	fmovdvc	%xcc,	%f8,	%f14
	ldsh	[%l7 + 0x38],	%o4
	tcc	%xcc,	0x7
	bneg,pn	%xcc,	loop_546
loop_546:
	ldd	[%l7 + 0x28],	%f0
	taddcctv	%g3,	%o7,	%g1
	stx	%i5,	[%l7 + 0x28]
	tcc	%icc,	0x4
	std	%f4,	[%l7 + 0x20]
	sllx	%g2,	%i6,	%i2
	udiv	%g5,	0x0F80,	%i7
	sdivx	%o0,	0x0BA4,	%g7
	ldsb	[%l7 + 0x58],	%g6
	ta	%xcc,	0x4
	fnot1	%f0,	%f14
	movg	%xcc,	%o5,	%l3
	sethi	0x1AD1,	%g4
	st	%f10,	[%l7 + 0x44]
	edge32ln	%o6,	%o3,	%l2
	fmovsle	%icc,	%f12,	%f10
	brgez,a	%i1,	loop_547
loop_547:
	tg	%icc,	0x3
	movrgez	%i0,	0x204,	%o2
	fmovspos	%xcc,	%f2,	%f14
	fmovdl	%icc,	%f7,	%f15
	edge32l	%l6,	%l4,	%i3
	tne	%icc,	0x6
	fcmpgt32	%f0,	%f2,	%l0
	mulx	%i4,	%l1,	%l5
	subc	%o1,	%o4,	%o7
	fbu	%fcc2,	loop_548
loop_548:
	subcc	%g3,	%i5,	%g2
	stx	%i6,	[%l7 + 0x68]
	xnorcc	%g1,	%i2,	%i7
	fmovspos	%icc,	%f14,	%f9
	movrgez	%g5,	0x390,	%g7
	fzero	%f10
	edge32	%g6,	%o0,	%o5
	movl	%icc,	%g4,	%l3
	sll	%o6,	%l2,	%i1
	fandnot1	%f4,	%f4,	%f4
	orn	%i0,	0x1FFB,	%o3
	std	%f0,	[%l7 + 0x10]
	srlx	%o2,	0x02,	%l4
	movgu	%icc,	%i3,	%l6
	nop
	setx loop_549, %l0, %l1
	jmpl %l1, %l0
loop_549:
	addc	%i4,	0x05DC,	%l1
	movne	%icc,	%l5,	%o4
	movgu	%xcc,	%o1,	%g3
	subc	%o7,	0x01F4,	%i5
	movleu	%xcc,	%i6,	%g1
	edge16ln	%g2,	%i7,	%i2
	fornot2s	%f1,	%f4,	%f11
	orncc	%g7,	0x1F09,	%g6
	edge32n	%g5,	%o5,	%o0
	and	%l3,	%o6,	%l2
	tn	%icc,	0x0
	nop
	setx loop_550, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_550:
	lduw	[%l7 + 0x34],	%g4
	move	%icc,	%i0,	%o3
	sra	%i1,	%o2,	%l4
	subcc	%i3,	%l0,	%l6
	movcs	%xcc,	%l1,	%i4
	mova	%icc,	%l5,	%o1
	subccc	%g3,	%o7,	%i5
	ldd	[%l7 + 0x40],	%f2
	stw	%i6,	[%l7 + 0x28]
	movrgez	%o4,	0x261,	%g2
	fsrc2s	%f8,	%f11
	mova	%icc,	%i7,	%i2
	udiv	%g7,	0x1238,	%g1
	addcc	%g5,	%g6,	%o0
	fmovsgu	%xcc,	%f15,	%f11
	mulscc	%o5,	0x1FD8,	%l3
	fbo,a	%fcc3,	loop_551
loop_551:
	bg,a,pt	%xcc,	loop_552
loop_552:
	fnot2	%f0,	%f2
	tcs	%icc,	0x0
	fmovsgu	%icc,	%f11,	%f8
	fbo	%fcc3,	loop_553
loop_553:
	edge8l	%o6,	%g4,	%i0
	edge8ln	%l2,	%i1,	%o2
	or	%l4,	0x0ADA,	%o3
	fbg	%fcc1,	loop_554
loop_554:
	udiv	%l0,	0x1537,	%i3
	faligndata	%f10,	%f14,	%f2
	srax	%l1,	%i4,	%l5
	movre	%o1,	%l6,	%o7
	fpadd32	%f8,	%f6,	%f0
	sllx	%g3,	0x1C,	%i5
	lduw	[%l7 + 0x2C],	%o4
	bg,a	%icc,	loop_555
loop_555:
	sth	%g2,	[%l7 + 0x34]
	xor	%i7,	%i6,	%g7
	taddcc	%g1,	0x17D7,	%i2
	nop
	setx loop_556, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_556:
	ldsw	[%l7 + 0x58],	%g6
	xorcc	%g5,	0x069E,	%o0
	movvs	%xcc,	%o5,	%l3
	movl	%icc,	%o6,	%i0
	edge16	%l2,	%i1,	%o2
	sub	%g4,	%l4,	%l0
	tpos	%icc,	0x5
	tl	%xcc,	0x2
	fblg,a	%fcc3,	loop_557
loop_557:
	movgu	%xcc,	%o3,	%i3
	ldd	[%l7 + 0x70],	%f6
	siam	0x4
	tn	%icc,	0x1
	addccc	%i4,	%l1,	%o1
	fmuld8sux16	%f7,	%f0,	%f6
	fba,a	%fcc2,	loop_558
loop_558:
	alignaddrl	%l6,	%l5,	%o7
	ld	[%l7 + 0x1C],	%f5
	sll	%i5,	%o4,	%g2
	edge16ln	%i7,	%i6,	%g3
	movrlz	%g1,	%i2,	%g6
	tn	%xcc,	0x3
	movleu	%xcc,	%g5,	%o0
	te	%icc,	0x2
	andcc	%g7,	%o5,	%l3
	tg	%icc,	0x2
	brlez	%i0,	loop_559
loop_559:
	fmuld8sux16	%f5,	%f10,	%f12
	fpsub32s	%f12,	%f6,	%f11
	tpos	%xcc,	0x1
	fmul8x16	%f1,	%f0,	%f4
	edge16ln	%l2,	%i1,	%o2
	orcc	%g4,	0x0F30,	%l4
	tvs	%xcc,	0x1
	tne	%xcc,	0x3
	movvs	%xcc,	%o6,	%l0
	stb	%o3,	[%l7 + 0x68]
	fandnot2	%f14,	%f2,	%f10
	edge32l	%i4,	%l1,	%i3
	fornot1	%f4,	%f2,	%f10
	edge8	%o1,	%l6,	%o7
	taddcc	%i5,	%o4,	%g2
	fmovde	%xcc,	%f10,	%f13
	edge8	%i7,	%i6,	%g3
	and	%l5,	%i2,	%g1
	sth	%g6,	[%l7 + 0x1A]
	tcs	%icc,	0x0
	andcc	%g5,	0x0B1C,	%g7
	fmovdgu	%icc,	%f15,	%f14
	fnands	%f1,	%f1,	%f8
	bl,a	loop_560
loop_560:
	tsubcctv	%o0,	%l3,	%i0
	movcs	%icc,	%l2,	%i1
	tvc	%icc,	0x0
	edge8n	%o5,	%g4,	%o2
	subccc	%l4,	0x0193,	%o6
	fcmpne16	%f12,	%f14,	%o3
	edge8ln	%l0,	%i4,	%l1
	bvs	%icc,	loop_561
loop_561:
	fmovsn	%xcc,	%f2,	%f0
	bcs,a,pt	%xcc,	loop_562
loop_562:
	orncc	%i3,	%l6,	%o1
	movl	%xcc,	%o7,	%o4
	edge8ln	%g2,	%i7,	%i6
	movle	%icc,	%i5,	%l5
	andn	%i2,	0x01C7,	%g3
	mulx	%g1,	%g6,	%g5
	array16	%g7,	%l3,	%i0
	sethi	0x0E3D,	%l2
	movl	%icc,	%o0,	%i1
	popc	%g4,	%o5
	movvs	%xcc,	%l4,	%o2
	fbule	%fcc2,	loop_563
loop_563:
	fmovsleu	%icc,	%f9,	%f8
	movcs	%icc,	%o3,	%o6
	movrgez	%l0,	0x172,	%l1
	smulcc	%i3,	0x00D7,	%l6
	lduw	[%l7 + 0x64],	%o1
	fandnot1	%f12,	%f10,	%f12
	fmovsneg	%xcc,	%f1,	%f5
	brnz	%o7,	loop_564
loop_564:
	xnorcc	%i4,	%g2,	%i7
	taddcctv	%i6,	%i5,	%o4
	edge16l	%l5,	%i2,	%g3
	andcc	%g1,	%g5,	%g6
	tge	%icc,	0x1
	fnegs	%f2,	%f3
	mulx	%g7,	%i0,	%l2
	fpadd32	%f12,	%f6,	%f8
	fmovsn	%icc,	%f11,	%f13
	udiv	%l3,	0x1B95,	%i1
	ldsb	[%l7 + 0x4E],	%g4
	fsrc1	%f2,	%f8
	alignaddr	%o0,	%l4,	%o2
	lduh	[%l7 + 0x44],	%o5
	fmovsvs	%xcc,	%f2,	%f7
	bn	%icc,	loop_565
loop_565:
	addc	%o3,	0x0534,	%l0
	tvc	%icc,	0x6
	addcc	%o6,	0x1521,	%l1
	sllx	%l6,	0x04,	%o1
	edge8n	%o7,	%i4,	%g2
	fmovsa	%icc,	%f1,	%f3
	edge8n	%i3,	%i6,	%i5
	movrgez	%o4,	%l5,	%i7
	be	loop_566
loop_566:
	srlx	%g3,	0x08,	%g1
	sethi	0x08CB,	%i2
	edge32n	%g6,	%g7,	%g5
	tne	%xcc,	0x2
	udivcc	%i0,	0x0487,	%l2
	orcc	%l3,	%g4,	%i1
	fmul8x16au	%f4,	%f14,	%f2
	ba,a,pn	%xcc,	loop_567
loop_567:
	movne	%xcc,	%o0,	%l4
	movn	%xcc,	%o2,	%o3
	andn	%l0,	%o5,	%o6
	fxors	%f12,	%f4,	%f6
	fbule	%fcc0,	loop_568
loop_568:
	movrlez	%l1,	%o1,	%l6
	sllx	%o7,	0x09,	%i4
	xorcc	%i3,	0x1A5F,	%g2
	lduw	[%l7 + 0x50],	%i5
	ld	[%l7 + 0x10],	%f13
	bvc	loop_569
loop_569:
	fble,a	%fcc0,	loop_570
loop_570:
	subc	%i6,	%o4,	%i7
	andncc	%l5,	%g3,	%i2
	brgez	%g6,	loop_571
loop_571:
	fcmps	%fcc1,	%f3,	%f0
	fabsd	%f12,	%f12
	edge16	%g1,	%g5,	%g7
	orcc	%i0,	0x1178,	%l3
	alignaddr	%l2,	%i1,	%g4
	movg	%xcc,	%o0,	%l4
	fmul8sux16	%f10,	%f12,	%f12
	tge	%xcc,	0x1
	edge32ln	%o2,	%o3,	%o5
	edge32n	%l0,	%o6,	%l1
	tcc	%icc,	0x5
	edge32ln	%l6,	%o7,	%o1
	sdivx	%i4,	0x0798,	%g2
	tneg	%icc,	0x4
	stx	%i5,	[%l7 + 0x58]
	fnor	%f4,	%f8,	%f14
	mulscc	%i3,	0x0862,	%i6
	fpsub32s	%f11,	%f6,	%f15
	movrne	%i7,	%o4,	%l5
	tsubcc	%g3,	%i2,	%g6
	fbg	%fcc3,	loop_572
loop_572:
	sub	%g5,	%g7,	%g1
	tge	%icc,	0x4
	tn	%xcc,	0x0
	stb	%i0,	[%l7 + 0x5F]
	movcc	%icc,	%l2,	%i1
	tpos	%xcc,	0x6
	and	%l3,	%g4,	%l4
	fbue	%fcc1,	loop_573
loop_573:
	tn	%xcc,	0x2
	tcc	%icc,	0x6
	movrlez	%o2,	%o0,	%o3
	umul	%o5,	%o6,	%l1
	edge32l	%l6,	%l0,	%o7
	fpadd16	%f2,	%f8,	%f4
	ldd	[%l7 + 0x48],	%f14
	tvs	%icc,	0x0
	tge	%xcc,	0x6
	smul	%o1,	%i4,	%i5
	edge16n	%g2,	%i3,	%i6
	xnorcc	%o4,	0x182A,	%l5
	edge8n	%i7,	%g3,	%g6
	bgu,a,pt	%icc,	loop_574
loop_574:
	ldx	[%l7 + 0x20],	%i2
	fbg	%fcc1,	loop_575
loop_575:
	alignaddr	%g7,	%g1,	%g5
	lduw	[%l7 + 0x54],	%i0
	ldub	[%l7 + 0x6F],	%l2
	stb	%l3,	[%l7 + 0x40]
	fbo	%fcc2,	loop_576
loop_576:
	tpos	%xcc,	0x0
	lduw	[%l7 + 0x38],	%g4
	subcc	%i1,	%o2,	%o0
	bvc,pn	%icc,	loop_577
loop_577:
	taddcctv	%o3,	0x1958,	%l4
	or	%o5,	%o6,	%l6
	smulcc	%l0,	%o7,	%l1
	subc	%o1,	0x1737,	%i4
	sth	%g2,	[%l7 + 0x12]
	movle	%icc,	%i3,	%i6
	fmovrslz	%o4,	%f3,	%f5
	edge16l	%i5,	%l5,	%g3
	edge8ln	%i7,	%i2,	%g6
	fbuge	%fcc2,	loop_578
loop_578:
	tpos	%xcc,	0x1
	movrgz	%g7,	%g5,	%g1
	popc	%i0,	%l2
	move	%xcc,	%l3,	%g4
	alignaddrl	%o2,	%i1,	%o0
	movvs	%icc,	%l4,	%o5
	lduw	[%l7 + 0x14],	%o6
	siam	0x5
	fbo	%fcc0,	loop_579
loop_579:
	movvs	%icc,	%o3,	%l0
	tsubcc	%l6,	0x090C,	%l1
	edge16	%o7,	%i4,	%o1
	sub	%i3,	0x1A4E,	%i6
	fandnot2s	%f11,	%f13,	%f6
	move	%icc,	%o4,	%g2
	fmovdcs	%xcc,	%f7,	%f2
	tl	%xcc,	0x5
	mulscc	%i5,	0x1B09,	%l5
	smul	%i7,	%g3,	%g6
	edge32ln	%g7,	%i2,	%g1
	fble	%fcc3,	loop_580
loop_580:
	orn	%i0,	0x120C,	%g5
	fmovrdgez	%l2,	%f14,	%f14
	bne	%icc,	loop_581
loop_581:
	lduh	[%l7 + 0x28],	%g4
	fsrc2s	%f6,	%f10
	stw	%l3,	[%l7 + 0x78]
	tsubcctv	%i1,	0x0A83,	%o2
	andcc	%l4,	%o0,	%o6
	fpsub16	%f4,	%f4,	%f10
	fpsub16	%f0,	%f0,	%f8
	udivx	%o3,	0x0FD4,	%o5
	umul	%l6,	0x17D9,	%l0
	srlx	%l1,	%i4,	%o7
	fors	%f12,	%f10,	%f7
	std	%f10,	[%l7 + 0x68]
	fcmpne32	%f4,	%f8,	%o1
	fmovrsgz	%i3,	%f5,	%f5
	ba,pn	%xcc,	loop_582
loop_582:
	movrlz	%i6,	%o4,	%i5
	srlx	%l5,	%i7,	%g2
	fcmpeq32	%f0,	%f6,	%g3
	srlx	%g7,	0x14,	%g6
	movrlez	%g1,	%i2,	%i0
	fcmpgt32	%f12,	%f8,	%l2
	tne	%xcc,	0x3
	sth	%g5,	[%l7 + 0x28]
	popc	%l3,	%i1
	movge	%xcc,	%g4,	%o2
	edge32	%l4,	%o6,	%o3
	fands	%f1,	%f15,	%f15
	ld	[%l7 + 0x6C],	%f3
	fmovsge	%xcc,	%f1,	%f3
	fba	%fcc0,	loop_583
loop_583:
	bneg	loop_584
loop_584:
	stb	%o5,	[%l7 + 0x78]
	fbl,a	%fcc2,	loop_585
loop_585:
	mova	%xcc,	%l6,	%o0
	andncc	%l0,	%l1,	%i4
	fbule	%fcc2,	loop_586
loop_586:
	tl	%xcc,	0x7
	ldub	[%l7 + 0x16],	%o1
	orcc	%o7,	0x1D1A,	%i3
	ldsh	[%l7 + 0x60],	%o4
	xor	%i6,	0x0057,	%l5
	fbne	%fcc0,	loop_587
loop_587:
	lduw	[%l7 + 0x30],	%i7
	tg	%xcc,	0x1
	taddcctv	%g2,	%g3,	%i5
	fcmpeq32	%f12,	%f4,	%g6
	taddcctv	%g7,	%i2,	%i0
	xnor	%l2,	%g5,	%g1
	bge,a	loop_588
loop_588:
	fcmpes	%fcc0,	%f13,	%f7
	brgz	%l3,	loop_589
loop_589:
	stb	%g4,	[%l7 + 0x10]
	edge32ln	%i1,	%o2,	%o6
	lduh	[%l7 + 0x3E],	%o3
	xorcc	%o5,	%l6,	%l4
	ldsw	[%l7 + 0x34],	%o0
	fpadd16s	%f4,	%f2,	%f15
	fcmple16	%f4,	%f14,	%l0
	movcc	%xcc,	%l1,	%o1
	fmovdne	%icc,	%f10,	%f15
	movg	%xcc,	%i4,	%i3
	movpos	%xcc,	%o7,	%i6
	sth	%l5,	[%l7 + 0x4C]
	tle	%icc,	0x0
	tne	%xcc,	0x2
	fsrc1s	%f0,	%f0
	faligndata	%f6,	%f6,	%f2
	tleu	%xcc,	0x1
	popc	0x1A24,	%o4
	tn	%xcc,	0x6
	tvc	%icc,	0x0
	fmovspos	%xcc,	%f13,	%f0
	bgu,a,pn	%xcc,	loop_590
loop_590:
	edge32l	%g2,	%i7,	%g3
	udivcc	%g6,	0x18FB,	%i5
	mulscc	%g7,	%i2,	%i0
	sth	%g5,	[%l7 + 0x56]
	fmul8x16au	%f1,	%f12,	%f0
	fble	%fcc2,	loop_591
loop_591:
	bcs,a	%xcc,	loop_592
loop_592:
	andcc	%g1,	0x0940,	%l2
	stw	%g4,	[%l7 + 0x5C]
	tpos	%xcc,	0x4
	popc	%l3,	%i1
	tpos	%xcc,	0x3
	nop
	setx loop_593, %l0, %l1
	jmpl %l1, %o6
loop_593:
	edge8ln	%o2,	%o5,	%l6
	fmovdle	%xcc,	%f0,	%f11
	fmovdvc	%icc,	%f10,	%f4
	fpadd32s	%f4,	%f7,	%f9
	ldd	[%l7 + 0x38],	%f10
	movrlez	%l4,	%o3,	%o0
	fxnor	%f14,	%f2,	%f0
	movrgz	%l1,	%l0,	%i4
	array32	%i3,	%o7,	%i6
	fcmpes	%fcc3,	%f2,	%f8
	movl	%xcc,	%l5,	%o4
	fandnot1	%f10,	%f12,	%f4
	sdivcc	%g2,	0x1F0F,	%o1
	tpos	%icc,	0x4
	sdivx	%g3,	0x0D99,	%g6
	movrgez	%i7,	0x069,	%i5
	fmul8x16al	%f1,	%f0,	%f2
	subcc	%i2,	0x003F,	%g7
	fmovrdgez	%g5,	%f4,	%f8
	bleu	%xcc,	loop_594
loop_594:
	udivx	%i0,	0x0157,	%l2
	andcc	%g4,	0x1154,	%l3
	tleu	%icc,	0x7
	st	%f4,	[%l7 + 0x38]
	sub	%i1,	%o6,	%g1
	udiv	%o2,	0x0840,	%l6
	fmovrsgez	%l4,	%f8,	%f7
	edge32	%o3,	%o5,	%l1
	te	%xcc,	0x1
	ba,a,pn	%icc,	loop_595
loop_595:
	tne	%xcc,	0x6
	ldub	[%l7 + 0x19],	%o0
	smul	%l0,	0x1625,	%i3
	brgz	%i4,	loop_596
loop_596:
	edge16ln	%o7,	%i6,	%o4
	brgz,a	%l5,	loop_597
loop_597:
	ldsb	[%l7 + 0x33],	%o1
	lduw	[%l7 + 0x38],	%g2
	movcs	%icc,	%g6,	%i7
	or	%g3,	0x070A,	%i5
	subcc	%g7,	%g5,	%i2
	taddcc	%i0,	0x118C,	%g4
	edge8ln	%l3,	%i1,	%l2
	ldsb	[%l7 + 0x31],	%g1
	smul	%o6,	%o2,	%l4
	mulx	%l6,	0x19EB,	%o3
	edge8ln	%l1,	%o5,	%l0
	stw	%i3,	[%l7 + 0x50]
	ldsw	[%l7 + 0x38],	%o0
	fandnot2s	%f15,	%f15,	%f6
	edge8ln	%o7,	%i4,	%i6
	array32	%l5,	%o1,	%o4
	stw	%g2,	[%l7 + 0x08]
	fmovdl	%xcc,	%f8,	%f10
	movrlz	%i7,	%g3,	%i5
	xor	%g6,	%g5,	%g7
	addccc	%i2,	0x0203,	%i0
	te	%icc,	0x1
	fmul8ulx16	%f14,	%f6,	%f2
	tcs	%xcc,	0x4
	fsrc2	%f8,	%f8
	edge8ln	%l3,	%i1,	%g4
	sdivx	%g1,	0x1B72,	%o6
	mova	%icc,	%l2,	%l4
	and	%o2,	%l6,	%l1
	orncc	%o5,	0x1E3D,	%o3
	movge	%icc,	%l0,	%i3
	fmovrde	%o7,	%f14,	%f12
	mulx	%i4,	0x026C,	%o0
	movpos	%icc,	%i6,	%l5
	edge16n	%o1,	%o4,	%g2
	movg	%icc,	%i7,	%g3
	faligndata	%f10,	%f2,	%f6
	tn	%icc,	0x1
	fxor	%f8,	%f14,	%f4
	movrlz	%g6,	%i5,	%g7
	move	%icc,	%i2,	%g5
	udiv	%l3,	0x151A,	%i0
	movg	%icc,	%g4,	%i1
	smulcc	%g1,	0x0F60,	%l2
	fnegd	%f10,	%f0
	srax	%l4,	0x1A,	%o6
	bn,pt	%icc,	loop_598
loop_598:
	fmovdvc	%xcc,	%f1,	%f14
	fbge,a	%fcc1,	loop_599
loop_599:
	ld	[%l7 + 0x38],	%f11
	udivcc	%l6,	0x071E,	%l1
	tcs	%icc,	0x0
	movrlz	%o5,	0x077,	%o3
	mova	%icc,	%o2,	%i3
	brlz,a	%l0,	loop_600
loop_600:
	movle	%icc,	%i4,	%o0
	bgu,a	loop_601
loop_601:
	bg,a	loop_602
loop_602:
	subcc	%i6,	0x17CC,	%o7
	edge16ln	%l5,	%o4,	%g2
	brgez	%i7,	loop_603
loop_603:
	movleu	%xcc,	%o1,	%g3
	orcc	%g6,	%g7,	%i2
	sllx	%g5,	%l3,	%i0
	tleu	%xcc,	0x6
	mova	%xcc,	%i5,	%g4
	stw	%i1,	[%l7 + 0x5C]
	sth	%g1,	[%l7 + 0x74]
	stb	%l4,	[%l7 + 0x11]
	tneg	%xcc,	0x1
	tne	%xcc,	0x5
	movrne	%l2,	0x322,	%l6
	orn	%o6,	0x030E,	%o5
	ldsw	[%l7 + 0x1C],	%o3
	movrne	%l1,	%i3,	%l0
	bpos,a	loop_604
loop_604:
	sth	%i4,	[%l7 + 0x6E]
	fmovscs	%xcc,	%f2,	%f12
	fmovsgu	%xcc,	%f9,	%f6
	fpackfix	%f8,	%f13
	tg	%xcc,	0x7
	umul	%o0,	0x04A4,	%i6
	edge32l	%o7,	%o2,	%o4
	smulcc	%g2,	%l5,	%i7
	ldsw	[%l7 + 0x1C],	%o1
	fbne,a	%fcc3,	loop_605
loop_605:
	smul	%g3,	%g7,	%g6
	tle	%icc,	0x1
	faligndata	%f8,	%f8,	%f6
	umul	%i2,	%l3,	%g5
	subc	%i5,	%g4,	%i0
	movrlez	%i1,	0x2AF,	%g1
	edge32	%l2,	%l4,	%l6
	xor	%o6,	0x155D,	%o3
	xor	%o5,	0x1971,	%i3
	movpos	%icc,	%l0,	%l1
	bcs,a,pn	%icc,	loop_606
loop_606:
	bvs,a,pt	%xcc,	loop_607
loop_607:
	tvs	%xcc,	0x7
	popc	%i4,	%o0
	movn	%icc,	%o7,	%o2
	faligndata	%f14,	%f8,	%f4
	subcc	%i6,	%o4,	%l5
	bvc	%icc,	loop_608
loop_608:
	xnorcc	%g2,	%i7,	%o1
	sth	%g7,	[%l7 + 0x4E]
	array32	%g3,	%i2,	%l3
	array32	%g5,	%g6,	%g4
	movrgez	%i0,	%i5,	%g1
	mulscc	%i1,	%l4,	%l6
	edge8l	%o6,	%o3,	%o5
	fxnors	%f4,	%f12,	%f0
	fmovsneg	%xcc,	%f4,	%f1
	orn	%l2,	0x056C,	%l0
	umulcc	%l1,	%i3,	%i4
	sra	%o7,	%o0,	%i6
	fmul8x16au	%f0,	%f0,	%f12
	ldd	[%l7 + 0x60],	%f10
	tleu	%icc,	0x2
	fone	%f6
	array16	%o4,	%l5,	%g2
	movleu	%xcc,	%o2,	%o1
	popc	0x0835,	%i7
	fbge	%fcc1,	loop_609
loop_609:
	fornot2	%f0,	%f12,	%f8
	lduh	[%l7 + 0x3C],	%g3
	ldub	[%l7 + 0x4B],	%g7
	stb	%i2,	[%l7 + 0x39]
	tle	%xcc,	0x7
	fcmpes	%fcc3,	%f12,	%f0
	lduw	[%l7 + 0x7C],	%l3
	movg	%xcc,	%g5,	%g4
	fcmple16	%f14,	%f2,	%g6
	ldd	[%l7 + 0x28],	%f4
	fmovsleu	%icc,	%f3,	%f11
	edge16ln	%i5,	%g1,	%i0
	andn	%l4,	%i1,	%l6
	ldd	[%l7 + 0x18],	%f0
	std	%f0,	[%l7 + 0x50]
	fmovs	%f7,	%f1
	subc	%o6,	%o5,	%o3
	fnands	%f2,	%f12,	%f3
	andncc	%l0,	%l2,	%i3
	sll	%l1,	0x06,	%i4
	fmovdpos	%icc,	%f12,	%f15
	andcc	%o0,	0x0111,	%o7
	ldsb	[%l7 + 0x0A],	%i6
	ldsw	[%l7 + 0x74],	%o4
	brnz	%l5,	loop_610
loop_610:
	movle	%icc,	%g2,	%o1
	bge,a,pn	%xcc,	loop_611
loop_611:
	ldx	[%l7 + 0x48],	%i7
	movrgz	%g3,	%g7,	%i2
	fcmple16	%f8,	%f10,	%o2
	fcmped	%fcc3,	%f6,	%f2
	fcmpeq32	%f4,	%f6,	%l3
	xor	%g5,	%g6,	%i5
	movne	%icc,	%g4,	%g1
	fmovdgu	%icc,	%f4,	%f7
	ldsb	[%l7 + 0x63],	%i0
	udiv	%l4,	0x1A76,	%i1
	fmovdcc	%xcc,	%f6,	%f6
	fmovsn	%icc,	%f3,	%f10
	lduw	[%l7 + 0x74],	%l6
	fbug,a	%fcc0,	loop_612
loop_612:
	movne	%xcc,	%o6,	%o3
	ta	%icc,	0x1
	std	%f14,	[%l7 + 0x18]
	umul	%l0,	%o5,	%l2
	fmovrdlz	%i3,	%f14,	%f0
	udiv	%l1,	0x03E1,	%o0
	alignaddr	%i4,	%i6,	%o7
	movpos	%icc,	%l5,	%o4
	fmovrslez	%g2,	%f15,	%f6
	fbug,a	%fcc2,	loop_613
loop_613:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type f   	: 174
!	Type cti   	: 117
!	Type i   	: 579
!	Type l   	: 130
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
main_t3:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x3,	%g2
	set	0x9,	%g3
	set	0x7,	%g4
	set	0xA,	%g5
	set	0xF,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x1,	%i1
	set	-0xF,	%i2
	set	-0x2,	%i3
	set	-0xF,	%i4
	set	-0xA,	%i5
	set	-0x0,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x7C2BA8C3,	%l0
	set	0x4CAC021E,	%l1
	set	0x4E139272,	%l2
	set	0x7D712526,	%l3
	set	0x6CB399BF,	%l4
	set	0x0CF6A75A,	%l5
	set	0x312EB0C8,	%l6
	!# Output registers
	set	0x121F,	%o0
	set	-0x1F28,	%o1
	set	-0x156B,	%o2
	set	-0x0D48,	%o3
	set	-0x1748,	%o4
	set	-0x19C9,	%o5
	set	-0x1490,	%o6
	set	0x18B2,	%o7

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

	edge32n	%o1,	%g3,	%g7
	sth	%i2,	[%l7 + 0x74]
	ld	[%l7 + 0x64],	%f10
	fmovsge	%icc,	%f12,	%f5
	fands	%f10,	%f8,	%f9
	fmovsneg	%icc,	%f14,	%f0
	fmovrdne	%i7,	%f2,	%f2
	fnors	%f0,	%f5,	%f10
	fpsub16	%f0,	%f10,	%f6
	fcmpne16	%f8,	%f12,	%l3
	fnands	%f0,	%f12,	%f14
	xorcc	%o2,	%g5,	%i5
	brz,a	%g6,	loop_614
loop_614:
	fpsub32s	%f13,	%f15,	%f2
	fcmpeq32	%f0,	%f0,	%g1
	and	%g4,	0x12A3,	%l4
	fpsub16	%f0,	%f12,	%f8
	fmovrdgez	%i0,	%f0,	%f6
	fmovdpos	%xcc,	%f1,	%f8
	fcmped	%fcc1,	%f2,	%f0
	fmovdcc	%xcc,	%f10,	%f11
	fnegd	%f8,	%f12
	fmovdg	%icc,	%f15,	%f6
	fornot1s	%f7,	%f6,	%f15
	fmovrde	%l6,	%f14,	%f6
	fcmpgt16	%f2,	%f10,	%i1
	fones	%f0
	std	%f8,	[%l7 + 0x70]
	fmul8ulx16	%f6,	%f10,	%f10
	fcmpeq32	%f10,	%f6,	%o3
	fbuge	%fcc2,	loop_615
loop_615:
	taddcc	%l0,	%o6,	%l2
	fpackfix	%f12,	%f4
	fmul8ulx16	%f4,	%f0,	%f4
	fmovrse	%o5,	%f10,	%f8
	pdist	%f10,	%f12,	%f14
	fmovdcs	%icc,	%f11,	%f12
	array32	%l1,	%i3,	%i4
	fbug,a	%fcc2,	loop_616
loop_616:
	ld	[%l7 + 0x74],	%f0
	tge	%xcc,	0x7
	fmovrsgz	%i6,	%f0,	%f9
	fzero	%f10
	ldx	[%l7 + 0x28],	%o0
	bl	loop_617
loop_617:
	sub	%l5,	0x000B,	%o4
	movrgez	%g2,	%o1,	%o7
	fpsub16s	%f14,	%f11,	%f7
	ldub	[%l7 + 0x37],	%g7
	stb	%g3,	[%l7 + 0x50]
	mulx	%i7,	0x0C9C,	%i2
	ldx	[%l7 + 0x28],	%l3
	movcc	%xcc,	%o2,	%i5
	faligndata	%f8,	%f10,	%f14
	smul	%g5,	0x1080,	%g6
	addccc	%g4,	%l4,	%i0
	fmovsne	%icc,	%f1,	%f6
	fbuge,a	%fcc3,	loop_618
loop_618:
	for	%f10,	%f4,	%f0
	stb	%g1,	[%l7 + 0x2D]
	fmovsgu	%icc,	%f10,	%f15
	fabsd	%f6,	%f10
	ldub	[%l7 + 0x46],	%i1
	orncc	%l6,	%o3,	%l0
	brnz,a	%l2,	loop_619
loop_619:
	faligndata	%f0,	%f12,	%f14
	fnand	%f10,	%f4,	%f6
	fmovdpos	%icc,	%f0,	%f3
	fpadd32	%f2,	%f2,	%f2
	fpack32	%f8,	%f2,	%f14
	bvs,a,pn	%icc,	loop_620
loop_620:
	fbo,a	%fcc2,	loop_621
loop_621:
	fzero	%f14
	fmovrde	%o5,	%f12,	%f14
	or	%o6,	%i3,	%l1
	fbule,a	%fcc0,	loop_622
loop_622:
	stb	%i4,	[%l7 + 0x18]
	edge32n	%o0,	%i6,	%o4
	fsrc2s	%f0,	%f8
	bcc,a,pn	%xcc,	loop_623
loop_623:
	fors	%f13,	%f14,	%f6
	faligndata	%f12,	%f0,	%f2
	fabsd	%f2,	%f12
	fand	%f4,	%f4,	%f12
	fmul8ulx16	%f4,	%f14,	%f2
	fmovsg	%xcc,	%f6,	%f3
	stb	%g2,	[%l7 + 0x30]
	fmovdcs	%icc,	%f13,	%f9
	call	loop_624
loop_624:
	ldx	[%l7 + 0x48],	%l5
	fmovde	%icc,	%f3,	%f14
	bpos	%xcc,	loop_625
loop_625:
	bvs,a,pt	%icc,	loop_626
loop_626:
	fbug,a	%fcc3,	loop_627
loop_627:
	fmovrdne	%o1,	%f8,	%f8
	fmuld8sux16	%f8,	%f8,	%f8
	stw	%o7,	[%l7 + 0x10]
	movpos	%icc,	%g3,	%i7
	fmovrdlz	%i2,	%f2,	%f12
	fba	%fcc2,	loop_628
loop_628:
	fmovsg	%icc,	%f10,	%f0
	bvs	loop_629
loop_629:
	sra	%g7,	%o2,	%l3
	fnot1	%f14,	%f12
	fmovrdgez	%g5,	%f12,	%f2
	fxnors	%f12,	%f9,	%f6
	stx	%i5,	[%l7 + 0x18]
	fmovspos	%xcc,	%f13,	%f10
	alignaddr	%g4,	%l4,	%g6
	fmovsa	%xcc,	%f4,	%f15
	fmovscc	%xcc,	%f13,	%f13
	fcmpgt32	%f10,	%f2,	%g1
	fcmpd	%fcc1,	%f0,	%f10
	fnegs	%f3,	%f11
	fzero	%f12
	lduw	[%l7 + 0x20],	%i0
	fmovrslez	%i1,	%f5,	%f14
	bvs,a,pn	%xcc,	loop_630
loop_630:
	fmovrdlz	%o3,	%f4,	%f14
	brlz	%l0,	loop_631
loop_631:
	fornot1	%f12,	%f6,	%f8
	fmovdn	%icc,	%f6,	%f14
	array16	%l6,	%o5,	%l2
	fmovdg	%icc,	%f3,	%f13
	addc	%o6,	%l1,	%i3
	bleu,a	loop_632
loop_632:
	taddcc	%o0,	0x0002,	%i4
	fnot2	%f6,	%f6
	edge8l	%i6,	%o4,	%l5
	fmovrslez	%o1,	%f11,	%f12
	fmovdg	%xcc,	%f12,	%f14
	tne	%icc,	0x6
	bleu,a,pn	%icc,	loop_633
loop_633:
	fmovrsgz	%g2,	%f10,	%f0
	fxor	%f8,	%f6,	%f10
	fmul8x16au	%f5,	%f15,	%f6
	fbo	%fcc0,	loop_634
loop_634:
	fmovrsgez	%o7,	%f8,	%f10
	ldsb	[%l7 + 0x7D],	%i7
	fmovsneg	%xcc,	%f10,	%f13
	brgez	%i2,	loop_635
loop_635:
	fmul8x16al	%f7,	%f5,	%f8
	move	%icc,	%g3,	%g7
	fmovsa	%xcc,	%f7,	%f1
	fpadd32	%f8,	%f0,	%f0
	sth	%o2,	[%l7 + 0x12]
	fmul8sux16	%f0,	%f10,	%f2
	fabsd	%f2,	%f10
	fcmple32	%f8,	%f10,	%l3
	fandnot1	%f0,	%f6,	%f8
	fpsub16	%f8,	%f6,	%f4
	fmovsgu	%xcc,	%f14,	%f10
	lduw	[%l7 + 0x38],	%g5
	ld	[%l7 + 0x58],	%f4
	fmovsleu	%xcc,	%f13,	%f0
	edge8	%i5,	%l4,	%g6
	or	%g1,	0x1A23,	%i0
	tgu	%xcc,	0x1
	ldsb	[%l7 + 0x73],	%g4
	fmovsleu	%xcc,	%f3,	%f7
	fabsd	%f0,	%f12
	fbn,a	%fcc1,	loop_636
loop_636:
	fpadd32	%f12,	%f2,	%f10
	fnegd	%f4,	%f2
	fnegd	%f2,	%f14
	fbn	%fcc1,	loop_637
loop_637:
	sth	%i1,	[%l7 + 0x6E]
	lduh	[%l7 + 0x6A],	%o3
	std	%f6,	[%l7 + 0x10]
	fcmple16	%f14,	%f10,	%l0
	fnor	%f14,	%f0,	%f12
	fmul8sux16	%f10,	%f2,	%f14
	sllx	%l6,	0x04,	%l2
	andcc	%o6,	%o5,	%i3
	fmovrdlez	%l1,	%f4,	%f12
	fnegd	%f12,	%f6
	fnot2	%f4,	%f10
	fmovrse	%i4,	%f3,	%f3
	fandnot2s	%f8,	%f10,	%f3
	faligndata	%f4,	%f14,	%f6
	fxor	%f8,	%f4,	%f0
	fabsd	%f0,	%f4
	fmovrsgz	%i6,	%f9,	%f7
	movre	%o4,	%l5,	%o0
	fbo,a	%fcc1,	loop_638
loop_638:
	fxnor	%f12,	%f4,	%f0
	fmovs	%f5,	%f5
	brnz,a	%o1,	loop_639
loop_639:
	fands	%f11,	%f3,	%f4
	fmovsvs	%xcc,	%f14,	%f8
	fabss	%f7,	%f5
	fmovse	%icc,	%f1,	%f2
	fmovdpos	%icc,	%f2,	%f1
	fbu	%fcc1,	loop_640
loop_640:
	stx	%g2,	[%l7 + 0x10]
	fpack16	%f6,	%f2
	fcmple16	%f6,	%f12,	%o7
	fnot1	%f4,	%f10
	fornot2	%f14,	%f2,	%f2
	ba,pt	%xcc,	loop_641
loop_641:
	fpsub32	%f8,	%f12,	%f12
	fcmple32	%f10,	%f8,	%i2
	fmovdvs	%icc,	%f3,	%f8
	fcmple16	%f14,	%f4,	%g3
	mulx	%g7,	0x1328,	%o2
	fmovdle	%icc,	%f2,	%f3
	sdivcc	%l3,	0x132A,	%g5
	fmovrde	%i5,	%f10,	%f8
	fmovdgu	%xcc,	%f11,	%f8
	fands	%f9,	%f8,	%f12
	xnor	%l4,	0x112F,	%g6
	lduh	[%l7 + 0x3C],	%g1
	tsubcctv	%i7,	0x0B55,	%g4
	brz,a	%i1,	loop_642
loop_642:
	edge8n	%i0,	%l0,	%o3
	lduh	[%l7 + 0x38],	%l2
	fexpand	%f15,	%f12
	edge32n	%l6,	%o6,	%i3
	fnegs	%f6,	%f12
	fandnot2	%f4,	%f10,	%f8
	fbule	%fcc0,	loop_643
loop_643:
	fcmped	%fcc0,	%f4,	%f0
	fexpand	%f0,	%f12
	udiv	%o5,	0x0505,	%i4
	fmovsa	%xcc,	%f11,	%f8
	fnands	%f10,	%f3,	%f0
	std	%f14,	[%l7 + 0x78]
	fxnors	%f0,	%f6,	%f5
	fnot2	%f10,	%f4
	fors	%f14,	%f6,	%f7
	fmovrdlz	%l1,	%f6,	%f0
	fandnot2s	%f10,	%f9,	%f1
	fmul8sux16	%f14,	%f4,	%f6
	fpsub32s	%f8,	%f13,	%f1
	pdist	%f0,	%f0,	%f10
	fnand	%f10,	%f14,	%f4
	stw	%i6,	[%l7 + 0x5C]
	fmovscc	%xcc,	%f3,	%f6
	srl	%l5,	%o0,	%o1
	fnors	%f1,	%f4,	%f7
	siam	0x3
	bg,pn	%icc,	loop_644
loop_644:
	ldd	[%l7 + 0x28],	%f14
	fcmpgt32	%f14,	%f12,	%g2
	subcc	%o7,	0x05D3,	%o4
	ba,a,pt	%xcc,	loop_645
loop_645:
	siam	0x2
	fpackfix	%f2,	%f4
	fmovscs	%icc,	%f8,	%f2
	fandnot2s	%f12,	%f8,	%f15
	fpsub16s	%f2,	%f6,	%f4
	lduw	[%l7 + 0x4C],	%g3
	st	%f3,	[%l7 + 0x6C]
	fmovsne	%icc,	%f10,	%f1
	fandnot1	%f10,	%f12,	%f2
	fmovdcc	%xcc,	%f2,	%f3
	fpadd32	%f10,	%f0,	%f8
	fxnors	%f5,	%f13,	%f8
	fmul8x16au	%f1,	%f12,	%f6
	fmovsvs	%icc,	%f10,	%f8
	fornot1	%f0,	%f2,	%f6
	fxors	%f12,	%f3,	%f14
	edge8ln	%g7,	%i2,	%l3
	fmovsgu	%xcc,	%f15,	%f5
	fcmpd	%fcc2,	%f12,	%f4
	lduh	[%l7 + 0x7E],	%g5
	call	loop_646
loop_646:
	ldx	[%l7 + 0x28],	%i5
	fxor	%f2,	%f8,	%f12
	movrgz	%o2,	%l4,	%g6
	tcc	%xcc,	0x3
	fand	%f6,	%f12,	%f2
	fmovd	%f10,	%f14
	fbe,a	%fcc3,	loop_647
loop_647:
	edge16ln	%i7,	%g4,	%i1
	fcmple32	%f12,	%f0,	%i0
	fmovdgu	%icc,	%f14,	%f3
	fmovdcs	%icc,	%f3,	%f15
	edge8l	%g1,	%l0,	%o3
	std	%f2,	[%l7 + 0x60]
	fmovsneg	%xcc,	%f0,	%f13
	fmovdvc	%icc,	%f2,	%f5
	tne	%icc,	0x4
	tcc	%icc,	0x7
	fble,a	%fcc3,	loop_648
loop_648:
	fone	%f14
	fmovsne	%xcc,	%f5,	%f4
	fmuld8sux16	%f7,	%f0,	%f10
	bcs	%xcc,	loop_649
loop_649:
	fmul8x16	%f4,	%f10,	%f0
	fmovdleu	%xcc,	%f3,	%f2
	st	%f2,	[%l7 + 0x2C]
	fpadd16s	%f10,	%f12,	%f14
	for	%f14,	%f14,	%f4
	fcmps	%fcc1,	%f7,	%f3
	fxor	%f8,	%f6,	%f6
	te	%icc,	0x0
	sethi	0x1D4B,	%l6
	fmovscs	%xcc,	%f4,	%f5
	edge32n	%l2,	%i3,	%o6
	fmovdleu	%xcc,	%f7,	%f11
	fbul,a	%fcc0,	loop_650
loop_650:
	fmovrdgz	%i4,	%f12,	%f14
	srlx	%l1,	%i6,	%l5
	fands	%f3,	%f0,	%f6
	fnot2s	%f14,	%f3
	fble,a	%fcc1,	loop_651
loop_651:
	fands	%f12,	%f13,	%f2
	alignaddr	%o0,	%o5,	%o1
	fcmpd	%fcc2,	%f2,	%f14
	fbu,a	%fcc0,	loop_652
loop_652:
	sra	%g2,	0x0D,	%o7
	fmovdcc	%icc,	%f14,	%f2
	fpadd16s	%f3,	%f13,	%f7
	lduh	[%l7 + 0x36],	%g3
	bl	%xcc,	loop_653
loop_653:
	fnor	%f2,	%f0,	%f2
	siam	0x4
	taddcc	%g7,	0x1799,	%i2
	sllx	%o4,	0x12,	%l3
	edge32l	%i5,	%g5,	%l4
	fands	%f7,	%f2,	%f1
	lduw	[%l7 + 0x60],	%g6
	sth	%o2,	[%l7 + 0x74]
	fnot1s	%f2,	%f2
	fmovscs	%icc,	%f5,	%f5
	lduw	[%l7 + 0x38],	%i7
	fmovrdlez	%g4,	%f12,	%f4
	fcmpeq32	%f12,	%f2,	%i0
	fxors	%f12,	%f11,	%f3
	sllx	%g1,	%i1,	%l0
	fpsub32	%f14,	%f6,	%f6
	fornot1	%f14,	%f10,	%f0
	fmovspos	%icc,	%f9,	%f2
	movcc	%icc,	%o3,	%l2
	array32	%l6,	%i3,	%i4
	fpack16	%f2,	%f8
	fzero	%f4
	fones	%f13
	fone	%f14
	fmovs	%f7,	%f14
	fpack16	%f12,	%f10
	fmovrdne	%l1,	%f10,	%f10
	fble	%fcc3,	loop_654
loop_654:
	ba,a	%xcc,	loop_655
loop_655:
	fmovdg	%xcc,	%f9,	%f7
	fmovd	%f2,	%f0
	movneg	%xcc,	%i6,	%l5
	bg,a,pt	%xcc,	loop_656
loop_656:
	fands	%f5,	%f3,	%f15
	tn	%icc,	0x3
	fmovdcs	%icc,	%f12,	%f13
	movl	%icc,	%o6,	%o5
	st	%f4,	[%l7 + 0x68]
	fcmpeq16	%f2,	%f8,	%o0
	andcc	%g2,	%o1,	%g3
	fpsub16	%f12,	%f6,	%f4
	fandnot1	%f10,	%f8,	%f0
	fmovsgu	%xcc,	%f13,	%f10
	lduw	[%l7 + 0x0C],	%g7
	tgu	%xcc,	0x1
	fmovsneg	%icc,	%f9,	%f5
	lduw	[%l7 + 0x70],	%o7
	movrne	%i2,	0x284,	%o4
	fnot1	%f10,	%f4
	fmovdne	%icc,	%f11,	%f10
	fbn	%fcc1,	loop_657
loop_657:
	tne	%icc,	0x4
	sth	%i5,	[%l7 + 0x64]
	srlx	%l3,	0x12,	%g5
	movre	%l4,	0x060,	%o2
	fones	%f4
	fsrc1s	%f10,	%f13
	fcmpgt32	%f12,	%f6,	%i7
	fmovsl	%xcc,	%f9,	%f10
	fmovdge	%icc,	%f1,	%f9
	fmuld8ulx16	%f6,	%f7,	%f14
	fmovdcs	%xcc,	%f5,	%f2
	fandnot1s	%f6,	%f10,	%f8
	ldx	[%l7 + 0x10],	%g4
	fcmpgt32	%f8,	%f4,	%i0
	fcmpgt32	%f4,	%f2,	%g6
	ldsb	[%l7 + 0x40],	%i1
	udivcc	%g1,	0x143A,	%o3
	be	loop_658
loop_658:
	ta	%icc,	0x5
	fandnot2s	%f12,	%f9,	%f9
	fcmple16	%f12,	%f4,	%l0
	ldd	[%l7 + 0x68],	%f6
	andcc	%l6,	%l2,	%i3
	nop
	setx loop_659, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_659:
	ldx	[%l7 + 0x08],	%l1
	ta	%icc,	0x6
	fmuld8ulx16	%f9,	%f3,	%f6
	st	%f13,	[%l7 + 0x50]
	fcmpne16	%f2,	%f12,	%i4
	fsrc1	%f10,	%f2
	fcmpd	%fcc2,	%f8,	%f10
	ldsb	[%l7 + 0x79],	%l5
	fcmped	%fcc2,	%f12,	%f2
	movre	%o6,	%o5,	%o0
	fmovsvc	%xcc,	%f11,	%f7
	ldub	[%l7 + 0x71],	%g2
	fmovse	%xcc,	%f0,	%f9
	fnors	%f4,	%f13,	%f1
	fzeros	%f13
	fmovsleu	%icc,	%f6,	%f4
	umulcc	%o1,	%g3,	%g7
	ldsw	[%l7 + 0x54],	%o7
	ldx	[%l7 + 0x28],	%i6
	edge32n	%o4,	%i5,	%l3
	fmovdge	%xcc,	%f10,	%f4
	tge	%icc,	0x3
	fmovde	%xcc,	%f5,	%f0
	fnot1	%f14,	%f0
	ble,a	%xcc,	loop_660
loop_660:
	fmovsge	%xcc,	%f11,	%f14
	fmovsneg	%xcc,	%f12,	%f0
	ldd	[%l7 + 0x50],	%f0
	fnot2	%f14,	%f0
	fmovdl	%icc,	%f7,	%f8
	fmovdg	%xcc,	%f3,	%f11
	ld	[%l7 + 0x24],	%f3
	movleu	%xcc,	%g5,	%l4
	ldsb	[%l7 + 0x6F],	%i2
	bleu,a	loop_661
loop_661:
	ldx	[%l7 + 0x28],	%i7
	fmovdne	%xcc,	%f14,	%f14
	fmovrsgz	%g4,	%f5,	%f15
	mulscc	%o2,	0x0444,	%i0
	ld	[%l7 + 0x4C],	%f11
	or	%g6,	0x1AD0,	%g1
	ba,a	%icc,	loop_662
loop_662:
	ldd	[%l7 + 0x48],	%f10
	alignaddr	%o3,	%i1,	%l6
	fmuld8sux16	%f0,	%f2,	%f14
	fmovdneg	%icc,	%f3,	%f5
	ldd	[%l7 + 0x48],	%f2
	fpsub32	%f14,	%f8,	%f10
	ldub	[%l7 + 0x79],	%l0
	bn,a,pn	%xcc,	loop_663
loop_663:
	fxnor	%f4,	%f14,	%f6
	fxor	%f4,	%f14,	%f10
	tl	%icc,	0x3
	fmovdneg	%xcc,	%f10,	%f5
	fbuge	%fcc2,	loop_664
loop_664:
	fcmps	%fcc2,	%f7,	%f3
	fmovd	%f0,	%f6
	fmovrsgez	%l2,	%f15,	%f11
	fpsub32s	%f2,	%f5,	%f13
	fmovrsgz	%i3,	%f12,	%f0
	fmovdleu	%icc,	%f12,	%f3
	array8	%l1,	%l5,	%i4
	bne,a	%icc,	loop_665
loop_665:
	fabss	%f11,	%f5
	fmovdge	%xcc,	%f9,	%f4
	tn	%icc,	0x6
	bgu,a	loop_666
loop_666:
	fbne,a	%fcc1,	loop_667
loop_667:
	fmovdneg	%xcc,	%f1,	%f0
	sll	%o6,	%o0,	%o5
	fmul8ulx16	%f0,	%f14,	%f6
	srl	%g2,	%g3,	%g7
	fors	%f2,	%f10,	%f10
	fmovdge	%xcc,	%f0,	%f10
	fmovdge	%xcc,	%f0,	%f13
	fcmpeq32	%f10,	%f14,	%o1
	edge32n	%o7,	%i6,	%i5
	edge8ln	%l3,	%g5,	%o4
	fandnot1s	%f4,	%f7,	%f14
	bvc	loop_668
loop_668:
	tle	%xcc,	0x6
	fpackfix	%f14,	%f4
	fpsub16s	%f7,	%f15,	%f9
	fnot1	%f6,	%f6
	fzeros	%f2
	fbl	%fcc2,	loop_669
loop_669:
	fmovsn	%icc,	%f11,	%f14
	tsubcc	%l4,	0x0CA7,	%i2
	movne	%icc,	%g4,	%i7
	alignaddrl	%o2,	%g6,	%g1
	subc	%i0,	0x0CD3,	%o3
	fnot1	%f0,	%f14
	fba	%fcc3,	loop_670
loop_670:
	fbul	%fcc1,	loop_671
loop_671:
	fsrc2s	%f11,	%f1
	fpsub32s	%f4,	%f2,	%f10
	fbue,a	%fcc0,	loop_672
loop_672:
	orn	%i1,	0x07D6,	%l6
	fand	%f0,	%f12,	%f12
	fmovsvs	%xcc,	%f9,	%f6
	ldd	[%l7 + 0x38],	%f12
	fcmple16	%f2,	%f10,	%l0
	fpadd32s	%f15,	%f0,	%f13
	movgu	%icc,	%i3,	%l1
	fnot2s	%f1,	%f13
	fmovdg	%xcc,	%f9,	%f6
	fand	%f8,	%f10,	%f6
	fmovdge	%xcc,	%f9,	%f0
	alignaddr	%l2,	%l5,	%o6
	bl,a	loop_673
loop_673:
	tsubcctv	%o0,	%o5,	%g2
	stb	%i4,	[%l7 + 0x1F]
	fmovsle	%icc,	%f9,	%f15
	fandnot1	%f12,	%f10,	%f4
	fba	%fcc2,	loop_674
loop_674:
	fmuld8sux16	%f1,	%f1,	%f4
	sdivcc	%g7,	0x1070,	%g3
	st	%f1,	[%l7 + 0x70]
	movpos	%icc,	%o1,	%o7
	ldsh	[%l7 + 0x0A],	%i5
	srl	%l3,	0x07,	%g5
	fxor	%f4,	%f4,	%f14
	bpos,a,pt	%icc,	loop_675
loop_675:
	fmul8sux16	%f12,	%f0,	%f0
	fsrc2s	%f5,	%f1
	fsrc2s	%f2,	%f14
	sth	%i6,	[%l7 + 0x40]
	fbuge	%fcc0,	loop_676
loop_676:
	fpadd16	%f2,	%f10,	%f0
	fmovdne	%xcc,	%f5,	%f3
	fabss	%f3,	%f9
	edge8l	%l4,	%i2,	%o4
	bne	loop_677
loop_677:
	stw	%g4,	[%l7 + 0x24]
	fbge	%fcc0,	loop_678
loop_678:
	fpack16	%f2,	%f9
	fornot1	%f12,	%f2,	%f4
	fcmpeq32	%f14,	%f0,	%o2
	fcmpeq32	%f12,	%f14,	%g6
	edge8n	%i7,	%i0,	%o3
	stb	%g1,	[%l7 + 0x25]
	ble,pn	%icc,	loop_679
loop_679:
	fxor	%f14,	%f4,	%f8
	fmovsleu	%icc,	%f2,	%f0
	movrgz	%l6,	%l0,	%i1
	fnegs	%f12,	%f3
	fnot1	%f6,	%f6
	fnot1s	%f7,	%f14
	fmovrdgz	%i3,	%f4,	%f12
	fands	%f1,	%f13,	%f11
	movle	%icc,	%l2,	%l5
	fpadd16	%f8,	%f6,	%f12
	fmovsl	%xcc,	%f6,	%f8
	fmovda	%icc,	%f8,	%f1
	std	%f10,	[%l7 + 0x60]
	fmovdneg	%xcc,	%f6,	%f9
	array32	%o6,	%o0,	%l1
	ldd	[%l7 + 0x68],	%f0
	tl	%icc,	0x5
	brgez,a	%o5,	loop_680
loop_680:
	fexpand	%f12,	%f10
	fandnot2	%f14,	%f4,	%f2
	fmovrdlz	%i4,	%f10,	%f8
	fbn,a	%fcc0,	loop_681
loop_681:
	fors	%f12,	%f9,	%f3
	fcmple32	%f14,	%f6,	%g7
	fxnors	%f10,	%f7,	%f1
	fmovsleu	%icc,	%f15,	%f12
	ldsh	[%l7 + 0x4C],	%g3
	ldub	[%l7 + 0x72],	%o1
	movcc	%icc,	%o7,	%g2
	fnors	%f9,	%f6,	%f1
	tg	%xcc,	0x5
	bvs	loop_682
loop_682:
	be,a	%xcc,	loop_683
loop_683:
	fabsd	%f4,	%f2
	fmovdn	%xcc,	%f8,	%f6
	stx	%l3,	[%l7 + 0x60]
	brlz	%i5,	loop_684
loop_684:
	movn	%icc,	%g5,	%i6
	addc	%l4,	0x11AB,	%i2
	fmul8x16al	%f6,	%f4,	%f4
	stb	%g4,	[%l7 + 0x4B]
	fnot2s	%f1,	%f11
	fmovrse	%o4,	%f0,	%f9
	ldsb	[%l7 + 0x23],	%o2
	faligndata	%f14,	%f8,	%f10
	lduh	[%l7 + 0x44],	%g6
	or	%i0,	0x0A5D,	%i7
	brlz	%o3,	loop_685
loop_685:
	fmovdn	%icc,	%f15,	%f7
	bl,pn	%icc,	loop_686
loop_686:
	tgu	%icc,	0x2
	fxnors	%f2,	%f4,	%f11
	ldub	[%l7 + 0x26],	%g1
	fpadd32	%f0,	%f6,	%f12
	ldsw	[%l7 + 0x5C],	%l0
	fnand	%f10,	%f12,	%f4
	fcmpes	%fcc2,	%f11,	%f12
	fbge,a	%fcc2,	loop_687
loop_687:
	fmovda	%xcc,	%f15,	%f10
	fpsub32s	%f14,	%f3,	%f3
	fnors	%f14,	%f5,	%f2
	fmul8ulx16	%f4,	%f6,	%f8
	bcs	loop_688
loop_688:
	fpack16	%f8,	%f3
	fmovdneg	%icc,	%f13,	%f15
	fbuge	%fcc0,	loop_689
loop_689:
	fmovsvc	%icc,	%f14,	%f6
	fmovdgu	%icc,	%f0,	%f9
	fcmpd	%fcc3,	%f2,	%f8
	fcmpes	%fcc2,	%f14,	%f15
	fcmps	%fcc1,	%f10,	%f6
	fbu	%fcc0,	loop_690
loop_690:
	taddcctv	%l6,	0x10A0,	%i1
	brgz,a	%l2,	loop_691
loop_691:
	fmul8sux16	%f0,	%f4,	%f0
	fmovsleu	%icc,	%f4,	%f10
	fmovrsne	%i3,	%f7,	%f1
	st	%f15,	[%l7 + 0x7C]
	bl,pn	%xcc,	loop_692
loop_692:
	ldsw	[%l7 + 0x14],	%l5
	fxor	%f8,	%f6,	%f8
	fmovrdlz	%o6,	%f14,	%f8
	be,a,pn	%icc,	loop_693
loop_693:
	fxor	%f14,	%f0,	%f8
	taddcc	%o0,	%o5,	%l1
	fmovsvs	%xcc,	%f11,	%f13
	stw	%i4,	[%l7 + 0x28]
	fmul8sux16	%f10,	%f6,	%f0
	fmovdl	%icc,	%f2,	%f7
	fmovsge	%xcc,	%f3,	%f4
	andncc	%g3,	%g7,	%o1
	fmovsne	%icc,	%f8,	%f10
	edge8l	%g2,	%l3,	%o7
	ld	[%l7 + 0x18],	%f2
	ldsw	[%l7 + 0x20],	%i5
	fpadd16s	%f6,	%f12,	%f0
	fmovdge	%icc,	%f1,	%f2
	ldd	[%l7 + 0x68],	%f8
	fmovdn	%icc,	%f4,	%f15
	fmovs	%f15,	%f5
	fpmerge	%f13,	%f0,	%f10
	fnegd	%f2,	%f10
	fmovsleu	%xcc,	%f4,	%f3
	fmovrdgz	%g5,	%f0,	%f4
	fmul8sux16	%f10,	%f2,	%f2
	fmovrdgz	%l4,	%f4,	%f2
	bcc,pt	%icc,	loop_694
loop_694:
	fblg	%fcc2,	loop_695
loop_695:
	fcmped	%fcc2,	%f4,	%f12
	fnor	%f14,	%f2,	%f12
	fble,a	%fcc2,	loop_696
loop_696:
	fmuld8sux16	%f8,	%f12,	%f10
	fmovsl	%icc,	%f1,	%f11
	stb	%i6,	[%l7 + 0x7E]
	fmovsa	%icc,	%f14,	%f13
	fcmple16	%f14,	%f10,	%i2
	fmovsleu	%icc,	%f5,	%f13
	fcmpeq16	%f10,	%f4,	%o4
	faligndata	%f12,	%f2,	%f6
	lduh	[%l7 + 0x24],	%g4
	fmul8x16al	%f5,	%f11,	%f10
	fxors	%f3,	%f12,	%f3
	stw	%o2,	[%l7 + 0x68]
	fsrc2	%f0,	%f14
	brgz	%i0,	loop_697
loop_697:
	fabsd	%f2,	%f2
	ldsh	[%l7 + 0x5C],	%g6
	fabss	%f3,	%f10
	stw	%i7,	[%l7 + 0x60]
	bleu,a	%xcc,	loop_698
loop_698:
	fmovsne	%icc,	%f7,	%f5
	fcmpd	%fcc0,	%f8,	%f12
	subcc	%o3,	0x0CAB,	%l0
	mova	%icc,	%g1,	%i1
	orncc	%l2,	0x02EA,	%i3
	fmovdcs	%xcc,	%f6,	%f8
	ldsb	[%l7 + 0x6E],	%l5
	tvs	%icc,	0x2
	fbge,a	%fcc2,	loop_699
loop_699:
	ldsb	[%l7 + 0x18],	%l6
	lduh	[%l7 + 0x3C],	%o6
	fnors	%f13,	%f0,	%f14
	move	%icc,	%o0,	%l1
	ldub	[%l7 + 0x34],	%o5
	mova	%icc,	%i4,	%g3
	nop
	setx loop_700, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_700:
	stx	%g7,	[%l7 + 0x48]
	fandnot1s	%f12,	%f3,	%f15
	ldsw	[%l7 + 0x3C],	%o1
	fmovda	%icc,	%f1,	%f0
	fbn	%fcc1,	loop_701
loop_701:
	fcmped	%fcc3,	%f2,	%f6
	ldub	[%l7 + 0x42],	%g2
	fcmped	%fcc3,	%f14,	%f12
	tge	%xcc,	0x5
	addc	%l3,	0x0131,	%i5
	bneg,a	%xcc,	loop_702
loop_702:
	addcc	%o7,	0x0F80,	%g5
	fmovdpos	%xcc,	%f8,	%f2
	fmovdne	%xcc,	%f13,	%f9
	fmovscs	%icc,	%f14,	%f14
	fmovrsgez	%l4,	%f0,	%f5
	xor	%i2,	0x10C6,	%i6
	be,a	%icc,	loop_703
loop_703:
	fxnor	%f4,	%f4,	%f4
	sth	%o4,	[%l7 + 0x70]
	andn	%g4,	%o2,	%g6
	fandnot1s	%f8,	%f5,	%f0
	fcmpgt32	%f2,	%f2,	%i7
	fmovrdlz	%i0,	%f8,	%f8
	fxor	%f6,	%f2,	%f2
	bpos	loop_704
loop_704:
	fabss	%f12,	%f13
	fcmps	%fcc1,	%f0,	%f7
	fpsub32	%f0,	%f4,	%f12
	stx	%l0,	[%l7 + 0x78]
	udiv	%o3,	0x039F,	%g1
	ldub	[%l7 + 0x79],	%i1
	addccc	%l2,	0x0335,	%i3
	addcc	%l5,	%o6,	%o0
	fmovdleu	%xcc,	%f9,	%f13
	fcmpd	%fcc2,	%f0,	%f14
	fmovsleu	%xcc,	%f0,	%f12
	fcmpes	%fcc3,	%f0,	%f15
	fmovdg	%xcc,	%f5,	%f6
	xor	%l6,	%o5,	%l1
	fpsub16s	%f9,	%f0,	%f1
	fmovsg	%xcc,	%f15,	%f10
	edge16l	%i4,	%g7,	%o1
	ldsb	[%l7 + 0x5D],	%g2
	orncc	%g3,	0x04C6,	%l3
	fmul8ulx16	%f8,	%f6,	%f6
	xor	%i5,	0x1296,	%g5
	fmovrslez	%l4,	%f10,	%f14
	sub	%o7,	%i6,	%i2
	edge16	%o4,	%o2,	%g6
	fnegd	%f0,	%f4
	fnot2s	%f9,	%f5
	fmovde	%icc,	%f10,	%f9
	fnot1	%f10,	%f4
	bleu,a,pt	%icc,	loop_705
loop_705:
	fcmple16	%f8,	%f14,	%g4
	fmovrdgez	%i0,	%f4,	%f14
	xor	%i7,	%o3,	%g1
	fbge,a	%fcc0,	loop_706
loop_706:
	fpackfix	%f4,	%f14
	fornot1	%f2,	%f6,	%f0
	fmovsleu	%icc,	%f10,	%f10
	fmovsa	%icc,	%f7,	%f0
	pdist	%f14,	%f6,	%f0
	fnors	%f14,	%f14,	%f6
	udivcc	%l0,	0x0925,	%i1
	std	%f0,	[%l7 + 0x10]
	umulcc	%i3,	%l2,	%o6
	fandnot2	%f0,	%f0,	%f14
	fnot1s	%f6,	%f10
	ba	%xcc,	loop_707
loop_707:
	fornot1	%f10,	%f12,	%f8
	brgz,a	%o0,	loop_708
loop_708:
	lduh	[%l7 + 0x58],	%l5
	fnegs	%f14,	%f13
	tl	%xcc,	0x2
	sub	%o5,	0x05F6,	%l1
	fzero	%f0
	bneg,a,pt	%icc,	loop_709
loop_709:
	fmovrdlz	%l6,	%f14,	%f12
	nop
	setx loop_710, %l0, %l1
	jmpl %l1, %i4
loop_710:
	st	%f12,	[%l7 + 0x4C]
	fpackfix	%f4,	%f12
	fpadd32s	%f8,	%f8,	%f10
	brz	%o1,	loop_711
loop_711:
	fmovrsgz	%g7,	%f11,	%f13
	fpadd32s	%f9,	%f9,	%f2
	fnand	%f4,	%f6,	%f10
	for	%f12,	%f0,	%f14
	andncc	%g2,	%g3,	%i5
	fmovdvc	%icc,	%f14,	%f9
	fmovdg	%icc,	%f12,	%f11
	fnot1	%f0,	%f8
	fnot2	%f6,	%f14
	fmovdgu	%xcc,	%f2,	%f14
	fblg	%fcc3,	loop_712
loop_712:
	fandnot1s	%f13,	%f0,	%f7
	fxor	%f2,	%f12,	%f14
	fexpand	%f2,	%f2
	fmovdg	%xcc,	%f4,	%f0
	fmovdl	%xcc,	%f6,	%f7
	ble,a	loop_713
loop_713:
	fands	%f11,	%f1,	%f11
	fmovsgu	%xcc,	%f13,	%f9
	ldub	[%l7 + 0x28],	%g5
	fmuld8ulx16	%f15,	%f9,	%f2
	fmovdvc	%icc,	%f1,	%f0
	fabss	%f5,	%f10
	fcmple32	%f12,	%f14,	%l4
	fbug	%fcc0,	loop_714
loop_714:
	fmovdcc	%xcc,	%f6,	%f6
	ldsb	[%l7 + 0x37],	%o7
	fpsub32s	%f3,	%f9,	%f0
	addccc	%l3,	0x0667,	%i2
	ldub	[%l7 + 0x2F],	%o4
	brgz,a	%i6,	loop_715
loop_715:
	movcs	%xcc,	%g6,	%g4
	ld	[%l7 + 0x54],	%f7
	fmovrdlez	%i0,	%f2,	%f6
	fsrc2s	%f11,	%f2
	ldsh	[%l7 + 0x3C],	%i7
	fsrc1s	%f3,	%f6
	orcc	%o3,	%o2,	%l0
	fors	%f14,	%f13,	%f12
	nop
	setx loop_716, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_716:
	fmovrdlz	%i1,	%f12,	%f4
	bne,pn	%icc,	loop_717
loop_717:
	fbug	%fcc3,	loop_718
loop_718:
	ldsw	[%l7 + 0x68],	%g1
	edge32l	%i3,	%o6,	%l2
	fexpand	%f12,	%f2
	fnegs	%f0,	%f15
	fnot1	%f14,	%f0
	fornot1s	%f3,	%f12,	%f12
	fpack32	%f6,	%f14,	%f8
	movvc	%xcc,	%l5,	%o0
	fbu,a	%fcc3,	loop_719
loop_719:
	fmovsl	%icc,	%f8,	%f5
	fbg,a	%fcc2,	loop_720
loop_720:
	bgu,a,pt	%icc,	loop_721
loop_721:
	movneg	%xcc,	%l1,	%o5
	fmovrdgez	%l6,	%f2,	%f14
	ldsw	[%l7 + 0x78],	%o1
	fmovsn	%icc,	%f4,	%f14
	bvc,pn	%icc,	loop_722
loop_722:
	brnz,a	%g7,	loop_723
loop_723:
	fnot2	%f12,	%f14
	mulx	%i4,	%g3,	%g2
	fmovrse	%i5,	%f8,	%f10
	ta	%icc,	0x6
	std	%f10,	[%l7 + 0x60]
	fmul8ulx16	%f4,	%f8,	%f4
	fbule	%fcc3,	loop_724
loop_724:
	ldsh	[%l7 + 0x7A],	%l4
	fbe,a	%fcc1,	loop_725
loop_725:
	fcmps	%fcc1,	%f2,	%f11
	fmul8x16au	%f15,	%f9,	%f14
	tne	%xcc,	0x2
	ba,a,pt	%icc,	loop_726
loop_726:
	ldsb	[%l7 + 0x3F],	%g5
	nop
	setx loop_727, %l0, %l1
	jmpl %l1, %o7
loop_727:
	fmul8x16	%f13,	%f2,	%f2
	fpsub16	%f6,	%f8,	%f10
	fmovsg	%xcc,	%f6,	%f12
	fsrc2	%f2,	%f2
	ldd	[%l7 + 0x48],	%f12
	fmovrslz	%i2,	%f11,	%f2
	fmovrsne	%o4,	%f10,	%f13
	tleu	%xcc,	0x6
	fxors	%f4,	%f5,	%f2
	fnegs	%f13,	%f3
	fnegd	%f12,	%f10
	std	%f6,	[%l7 + 0x58]
	fmovscc	%icc,	%f10,	%f10
	fpmerge	%f11,	%f4,	%f12
	tvc	%xcc,	0x6
	fpsub32	%f6,	%f8,	%f12
	ld	[%l7 + 0x68],	%f7
	fmovsg	%xcc,	%f8,	%f9
	stw	%l3,	[%l7 + 0x54]
	fandnot1	%f12,	%f12,	%f4
	fba,a	%fcc2,	loop_728
loop_728:
	ble,pt	%xcc,	loop_729
loop_729:
	fmovda	%icc,	%f12,	%f3
	fmovde	%xcc,	%f0,	%f0
	tsubcc	%i6,	%g4,	%g6
	orn	%i7,	0x0C7C,	%i0
	fble	%fcc1,	loop_730
loop_730:
	fmovdle	%icc,	%f0,	%f4
	fpsub16s	%f7,	%f10,	%f13
	fmovdvc	%xcc,	%f12,	%f9
	sub	%o3,	0x1E79,	%o2
	fnot2s	%f0,	%f1
	fpsub16	%f4,	%f14,	%f6
	fmul8x16au	%f3,	%f14,	%f0
	fandnot1	%f14,	%f14,	%f8
	fmovdpos	%icc,	%f3,	%f12
	udiv	%i1,	0x0FEE,	%l0
	fornot2	%f12,	%f12,	%f4
	bpos,pn	%icc,	loop_731
loop_731:
	fnot1	%f10,	%f0
	bvs	loop_732
loop_732:
	smul	%g1,	%o6,	%l2
	stb	%l5,	[%l7 + 0x17]
	fba	%fcc1,	loop_733
loop_733:
	fpack16	%f10,	%f12
	mova	%xcc,	%o0,	%i3
	fnand	%f4,	%f14,	%f2
	for	%f14,	%f8,	%f6
	edge32	%o5,	%l1,	%l6
	fbue,a	%fcc3,	loop_734
loop_734:
	fnegd	%f14,	%f14
	fbg,a	%fcc2,	loop_735
loop_735:
	fmovsg	%xcc,	%f13,	%f13
	ldd	[%l7 + 0x30],	%f4
	st	%f11,	[%l7 + 0x20]
	fpadd16	%f0,	%f4,	%f6
	fpack32	%f6,	%f6,	%f4
	mulscc	%o1,	0x1833,	%i4
	fpadd32	%f6,	%f12,	%f0
	ldub	[%l7 + 0x49],	%g7
	bleu	loop_736
loop_736:
	st	%f12,	[%l7 + 0x6C]
	edge16ln	%g3,	%i5,	%l4
	bshuffle	%f6,	%f0,	%f4
	fmovsl	%xcc,	%f2,	%f8
	lduh	[%l7 + 0x2E],	%g2
	fcmpeq16	%f12,	%f12,	%o7
	fmovdcs	%xcc,	%f10,	%f12
	nop
	setx loop_737, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_737:
	fmul8x16au	%f8,	%f11,	%f14
	fmovrdlz	%i2,	%f0,	%f4
	sra	%g5,	0x19,	%o4
	fzero	%f4
	brgz	%l3,	loop_738
loop_738:
	fpack16	%f6,	%f10
	faligndata	%f6,	%f14,	%f8
	fornot1s	%f0,	%f3,	%f15
	fmovdgu	%icc,	%f3,	%f7
	fnors	%f14,	%f7,	%f11
	fmovsne	%xcc,	%f10,	%f8
	bpos,a	%icc,	loop_739
loop_739:
	addc	%i6,	%g6,	%g4
	bvc,pt	%icc,	loop_740
loop_740:
	fabss	%f3,	%f4
	fbug	%fcc1,	loop_741
loop_741:
	fnegd	%f10,	%f8
	fbu	%fcc1,	loop_742
loop_742:
	stx	%i7,	[%l7 + 0x08]
	fbuge,a	%fcc1,	loop_743
loop_743:
	fbue,a	%fcc2,	loop_744
loop_744:
	fcmpes	%fcc1,	%f5,	%f0
	ldsw	[%l7 + 0x08],	%i0
	bl,a	loop_745
loop_745:
	movn	%icc,	%o2,	%i1
	fmovsa	%icc,	%f9,	%f15
	tpos	%icc,	0x0
	fcmpd	%fcc0,	%f4,	%f0
	lduh	[%l7 + 0x32],	%l0
	fabsd	%f10,	%f14
	udiv	%o3,	0x0912,	%o6
	sllx	%l2,	%g1,	%o0
	fsrc2s	%f7,	%f11
	bvc	%xcc,	loop_746
loop_746:
	fnegs	%f15,	%f15
	edge32	%l5,	%o5,	%i3
	fornot2s	%f0,	%f5,	%f0
	fsrc2s	%f3,	%f2
	bleu,a	%icc,	loop_747
loop_747:
	fpsub16	%f4,	%f10,	%f2
	fxnor	%f14,	%f8,	%f14
	subccc	%l6,	0x13E6,	%o1
	bgu,pn	%xcc,	loop_748
loop_748:
	fnor	%f10,	%f14,	%f14
	fmovdle	%icc,	%f1,	%f15
	ldub	[%l7 + 0x1C],	%l1
	fcmpgt32	%f8,	%f14,	%i4
	fpadd16s	%f6,	%f7,	%f5
	fand	%f8,	%f10,	%f14
	fors	%f4,	%f2,	%f2
	fmovdn	%icc,	%f14,	%f3
	sth	%g7,	[%l7 + 0x6C]
	faligndata	%f8,	%f10,	%f10
	fmuld8sux16	%f9,	%f0,	%f8
	xnorcc	%i5,	0x1D6E,	%l4
	stb	%g3,	[%l7 + 0x1B]
	fpmerge	%f0,	%f11,	%f10
	fmovdleu	%icc,	%f3,	%f11
	fmovsvc	%icc,	%f6,	%f12
	fmovscc	%xcc,	%f12,	%f4
	fcmple16	%f0,	%f0,	%g2
	fmovsn	%xcc,	%f8,	%f6
	fsrc1s	%f4,	%f9
	fxnor	%f2,	%f4,	%f14
	tl	%icc,	0x4
	movrlez	%o7,	%g5,	%i2
	array32	%l3,	%o4,	%i6
	fmovrdne	%g4,	%f14,	%f10
	orn	%i7,	0x1903,	%i0
	fmovsne	%xcc,	%f14,	%f5
	fmul8ulx16	%f8,	%f0,	%f6
	ld	[%l7 + 0x64],	%f3
	andcc	%o2,	%g6,	%i1
	fmovdne	%xcc,	%f15,	%f3
	edge32ln	%o3,	%l0,	%l2
	fcmped	%fcc1,	%f0,	%f8
	movleu	%icc,	%o6,	%o0
	fmovsn	%icc,	%f2,	%f0
	fmovrsgz	%g1,	%f9,	%f1
	movrgez	%l5,	0x2D4,	%i3
	fmul8x16	%f4,	%f12,	%f2
	fmovsneg	%xcc,	%f6,	%f6
	fpadd16s	%f13,	%f2,	%f14
	tneg	%xcc,	0x2
	fsrc1s	%f11,	%f9
	fandnot2s	%f2,	%f5,	%f15
	fmovd	%f6,	%f14
	ldd	[%l7 + 0x28],	%f2
	sll	%l6,	0x0E,	%o5
	fmuld8sux16	%f2,	%f12,	%f12
	tne	%icc,	0x4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type f   	: 554
!	Type cti   	: 135
!	Type i   	: 180
!	Type l   	: 131
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
main_t4:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0xF,	%g2
	set	0x8,	%g3
	set	0x4,	%g4
	set	0xF,	%g5
	set	0x9,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xB,	%i1
	set	-0x7,	%i2
	set	-0x1,	%i3
	set	-0x3,	%i4
	set	-0xB,	%i5
	set	-0x0,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x4382F69E,	%l0
	set	0x5B86032F,	%l1
	set	0x46B60FA2,	%l2
	set	0x5A809D8E,	%l3
	set	0x52EBF257,	%l4
	set	0x240066AA,	%l5
	set	0x3767C67A,	%l6
	!# Output registers
	set	0x1163,	%o0
	set	0x04F9,	%o1
	set	-0x0466,	%o2
	set	0x1B8C,	%o3
	set	0x0330,	%o4
	set	0x13AD,	%o5
	set	0x04AD,	%o6
	set	0x08DF,	%o7

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

	ble,a,pn	%icc,	loop_749
loop_749:
	brnz,a	%o1,	loop_750
loop_750:
	fmovrsgez	%l1,	%f11,	%f5
	mulx	%i4,	%g7,	%l4
	ldd	[%l7 + 0x68],	%f10
	bleu,pn	%xcc,	loop_751
loop_751:
	fzeros	%f7
	stx	%g3,	[%l7 + 0x20]
	and	%i5,	0x125A,	%g2
	fcmpd	%fcc0,	%f2,	%f0
	fmovsle	%icc,	%f5,	%f6
	alignaddrl	%o7,	%g5,	%l3
	bleu	loop_752
loop_752:
	be,pn	%xcc,	loop_753
loop_753:
	bvc,a	loop_754
loop_754:
	fbule,a	%fcc2,	loop_755
loop_755:
	fbule,a	%fcc0,	loop_756
loop_756:
	ble,a	%icc,	loop_757
loop_757:
	nop
	setx loop_758, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_758:
	fpack32	%f14,	%f2,	%f14
	smulcc	%i2,	0x0763,	%i6
	brlz,a	%g4,	loop_759
loop_759:
	tle	%icc,	0x0
	fba	%fcc0,	loop_760
loop_760:
	ldub	[%l7 + 0x39],	%o4
	nop
	setx loop_761, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_761:
	bvs,pn	%xcc,	loop_762
loop_762:
	bvs	loop_763
loop_763:
	stx	%i0,	[%l7 + 0x70]
	stb	%o2,	[%l7 + 0x27]
	nop
	setx loop_764, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_764:
	std	%f6,	[%l7 + 0x60]
	umul	%g6,	0x1FBC,	%i1
	fbue	%fcc0,	loop_765
loop_765:
	bvc,a,pt	%xcc,	loop_766
loop_766:
	brgez,a	%o3,	loop_767
loop_767:
	bneg,a,pt	%xcc,	loop_768
loop_768:
	be	%xcc,	loop_769
loop_769:
	bpos	%xcc,	loop_770
loop_770:
	fbug,a	%fcc0,	loop_771
loop_771:
	bl	loop_772
loop_772:
	taddcctv	%l0,	%l2,	%o6
	fabss	%f1,	%f5
	stw	%i7,	[%l7 + 0x60]
	ldx	[%l7 + 0x78],	%o0
	nop
	setx loop_773, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_773:
	fmovdvc	%icc,	%f4,	%f10
	ble	%icc,	loop_774
loop_774:
	fbo,a	%fcc3,	loop_775
loop_775:
	fmovdcc	%xcc,	%f11,	%f1
	nop
	setx loop_776, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_776:
	andncc	%l5,	%g1,	%i3
	fbul	%fcc1,	loop_777
loop_777:
	fble	%fcc3,	loop_778
loop_778:
	edge32ln	%o5,	%l6,	%l1
	edge16	%o1,	%g7,	%i4
	fbg	%fcc2,	loop_779
loop_779:
	nop
	setx loop_780, %l0, %l1
	jmpl %l1, %l4
loop_780:
	faligndata	%f8,	%f14,	%f14
	lduh	[%l7 + 0x1A],	%i5
	subccc	%g2,	0x0603,	%o7
	fbule	%fcc3,	loop_781
loop_781:
	fba,a	%fcc0,	loop_782
loop_782:
	bgu	loop_783
loop_783:
	bvc,a	loop_784
loop_784:
	bn,a	%xcc,	loop_785
loop_785:
	subcc	%g3,	0x0D72,	%g5
	fbo	%fcc1,	loop_786
loop_786:
	fbue,a	%fcc1,	loop_787
loop_787:
	tneg	%icc,	0x5
	st	%f8,	[%l7 + 0x20]
	ldub	[%l7 + 0x30],	%l3
	fbue	%fcc3,	loop_788
loop_788:
	brlz	%i6,	loop_789
loop_789:
	fsrc2s	%f4,	%f11
	fxnors	%f7,	%f8,	%f0
	te	%xcc,	0x2
	fandnot2	%f10,	%f6,	%f0
	nop
	setx loop_790, %l0, %l1
	jmpl %l1, %i2
loop_790:
	bvc,pn	%icc,	loop_791
loop_791:
	edge8ln	%o4,	%i0,	%g4
	fba,a	%fcc1,	loop_792
loop_792:
	brlz	%o2,	loop_793
loop_793:
	fbug,a	%fcc3,	loop_794
loop_794:
	fsrc2	%f14,	%f12
	fpadd16	%f4,	%f0,	%f0
	lduh	[%l7 + 0x16],	%i1
	ldsb	[%l7 + 0x75],	%g6
	srlx	%o3,	0x1B,	%l0
	fbuge	%fcc2,	loop_795
loop_795:
	sth	%o6,	[%l7 + 0x4A]
	fone	%f8
	fbu	%fcc0,	loop_796
loop_796:
	ble,a	loop_797
loop_797:
	edge8ln	%i7,	%o0,	%l5
	bneg,pt	%icc,	loop_798
loop_798:
	tvs	%icc,	0x1
	brz	%g1,	loop_799
loop_799:
	xorcc	%i3,	%o5,	%l2
	fnands	%f5,	%f2,	%f8
	ldub	[%l7 + 0x5D],	%l1
	bcc	loop_800
loop_800:
	nop
	setx loop_801, %l0, %l1
	jmpl %l1, %o1
loop_801:
	fbge	%fcc0,	loop_802
loop_802:
	ba,a	loop_803
loop_803:
	fandnot2	%f6,	%f8,	%f8
	fble,a	%fcc1,	loop_804
loop_804:
	fbuge,a	%fcc0,	loop_805
loop_805:
	fblg,a	%fcc3,	loop_806
loop_806:
	fbuge,a	%fcc1,	loop_807
loop_807:
	bvs,pn	%icc,	loop_808
loop_808:
	bgu,a	loop_809
loop_809:
	fmovsle	%icc,	%f4,	%f10
	fmovd	%f12,	%f4
	fbug	%fcc3,	loop_810
loop_810:
	bgu,a,pt	%xcc,	loop_811
loop_811:
	movleu	%xcc,	%l6,	%i4
	orncc	%l4,	%i5,	%g7
	xnor	%g2,	0x1A70,	%o7
	fbul	%fcc1,	loop_812
loop_812:
	brlz	%g3,	loop_813
loop_813:
	fbne	%fcc3,	loop_814
loop_814:
	bpos	loop_815
loop_815:
	bcc,pn	%xcc,	loop_816
loop_816:
	fmul8sux16	%f14,	%f6,	%f2
	fbne	%fcc0,	loop_817
loop_817:
	brnz,a	%g5,	loop_818
loop_818:
	be,pn	%icc,	loop_819
loop_819:
	fbu	%fcc2,	loop_820
loop_820:
	fblg,a	%fcc3,	loop_821
loop_821:
	fblg,a	%fcc3,	loop_822
loop_822:
	ldsh	[%l7 + 0x64],	%l3
	fbule,a	%fcc3,	loop_823
loop_823:
	fmovdcc	%icc,	%f12,	%f5
	brgz	%i6,	loop_824
loop_824:
	fmovdpos	%xcc,	%f7,	%f0
	fba	%fcc2,	loop_825
loop_825:
	stw	%o4,	[%l7 + 0x44]
	sth	%i0,	[%l7 + 0x40]
	nop
	setx loop_826, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_826:
	std	%f2,	[%l7 + 0x20]
	brnz	%i2,	loop_827
loop_827:
	fmovd	%f0,	%f2
	fmovd	%f8,	%f2
	movrgez	%o2,	0x245,	%i1
	fornot2	%f4,	%f0,	%f2
	sth	%g6,	[%l7 + 0x5C]
	addcc	%g4,	%o3,	%l0
	bcs,a	%xcc,	loop_828
loop_828:
	bvs	loop_829
loop_829:
	fbue	%fcc1,	loop_830
loop_830:
	fbg	%fcc0,	loop_831
loop_831:
	fzeros	%f12
	bge,a	loop_832
loop_832:
	bneg,pt	%xcc,	loop_833
loop_833:
	fpadd32	%f12,	%f14,	%f14
	fmovrsgz	%o6,	%f12,	%f3
	fpadd16s	%f13,	%f10,	%f15
	bvc	%xcc,	loop_834
loop_834:
	ba,a	loop_835
loop_835:
	fbu,a	%fcc2,	loop_836
loop_836:
	brlz	%i7,	loop_837
loop_837:
	bn	loop_838
loop_838:
	nop
	setx loop_839, %l0, %l1
	jmpl %l1, %o0
loop_839:
	fbge,a	%fcc3,	loop_840
loop_840:
	tsubcctv	%l5,	0x18D2,	%i3
	st	%f5,	[%l7 + 0x2C]
	fandnot1	%f10,	%f6,	%f0
	bleu,a	loop_841
loop_841:
	bn	%icc,	loop_842
loop_842:
	fpsub32s	%f15,	%f12,	%f15
	udiv	%g1,	0x092A,	%l2
	orcc	%o5,	%l1,	%l6
	brgz,a	%i4,	loop_843
loop_843:
	fands	%f4,	%f7,	%f2
	bg,a	loop_844
loop_844:
	fblg	%fcc0,	loop_845
loop_845:
	fbo,a	%fcc2,	loop_846
loop_846:
	brz,a	%o1,	loop_847
loop_847:
	udivcc	%i5,	0x0636,	%l4
	ldd	[%l7 + 0x30],	%f4
	bne,a	loop_848
loop_848:
	bl	%xcc,	loop_849
loop_849:
	fbl	%fcc1,	loop_850
loop_850:
	fblg	%fcc1,	loop_851
loop_851:
	fbe	%fcc3,	loop_852
loop_852:
	fbu,a	%fcc2,	loop_853
loop_853:
	brlz,a	%g7,	loop_854
loop_854:
	bl,pn	%xcc,	loop_855
loop_855:
	call	loop_856
loop_856:
	fmuld8sux16	%f4,	%f12,	%f2
	nop
	setx loop_857, %l0, %l1
	jmpl %l1, %g2
loop_857:
	fmovdpos	%xcc,	%f9,	%f14
	bl,a,pt	%xcc,	loop_858
loop_858:
	bcs,a,pt	%xcc,	loop_859
loop_859:
	bl	%icc,	loop_860
loop_860:
	brgz	%g3,	loop_861
loop_861:
	ba,pn	%icc,	loop_862
loop_862:
	fbug	%fcc0,	loop_863
loop_863:
	fmovscc	%icc,	%f9,	%f7
	fba	%fcc0,	loop_864
loop_864:
	lduw	[%l7 + 0x58],	%g5
	andncc	%l3,	%o7,	%i6
	fmovdge	%xcc,	%f10,	%f2
	tn	%xcc,	0x0
	tsubcctv	%o4,	%i2,	%o2
	bneg,a,pn	%icc,	loop_865
loop_865:
	fbne,a	%fcc0,	loop_866
loop_866:
	be,pt	%icc,	loop_867
loop_867:
	call	loop_868
loop_868:
	fble,a	%fcc2,	loop_869
loop_869:
	fandnot2s	%f4,	%f13,	%f4
	fandnot2s	%f5,	%f14,	%f10
	movrne	%i1,	0x02E,	%g6
	movl	%xcc,	%g4,	%o3
	fsrc1	%f6,	%f2
	fbl,a	%fcc3,	loop_870
loop_870:
	move	%icc,	%i0,	%o6
	edge32n	%i7,	%l0,	%o0
	nop
	setx loop_871, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_871:
	ba,pn	%icc,	loop_872
loop_872:
	ble,a,pt	%icc,	loop_873
loop_873:
	bne,a,pt	%icc,	loop_874
loop_874:
	bge	%icc,	loop_875
loop_875:
	movn	%icc,	%l5,	%i3
	fbug,a	%fcc2,	loop_876
loop_876:
	fmovrse	%g1,	%f12,	%f2
	fbule	%fcc1,	loop_877
loop_877:
	fcmple16	%f0,	%f4,	%o5
	fbug,a	%fcc1,	loop_878
loop_878:
	fbue,a	%fcc3,	loop_879
loop_879:
	ba	loop_880
loop_880:
	addc	%l2,	%l1,	%i4
	fmovscs	%xcc,	%f0,	%f4
	bne,a,pn	%icc,	loop_881
loop_881:
	stx	%o1,	[%l7 + 0x28]
	fsrc1	%f8,	%f12
	fbl,a	%fcc2,	loop_882
loop_882:
	fmovrslez	%l6,	%f2,	%f12
	fbue	%fcc3,	loop_883
loop_883:
	fble	%fcc2,	loop_884
loop_884:
	fpsub32s	%f12,	%f3,	%f5
	bn,a	%icc,	loop_885
loop_885:
	movre	%l4,	%i5,	%g7
	fmovrslz	%g2,	%f10,	%f0
	ld	[%l7 + 0x14],	%f2
	fbo,a	%fcc3,	loop_886
loop_886:
	tgu	%icc,	0x7
	bgu	%xcc,	loop_887
loop_887:
	fbn	%fcc2,	loop_888
loop_888:
	nop
	setx loop_889, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_889:
	stb	%g5,	[%l7 + 0x6D]
	brlez,a	%g3,	loop_890
loop_890:
	fornot1	%f10,	%f2,	%f12
	tgu	%icc,	0x2
	bvs,a,pt	%xcc,	loop_891
loop_891:
	bvc,a	%xcc,	loop_892
loop_892:
	fmovdpos	%xcc,	%f12,	%f11
	fmovrsgez	%o7,	%f8,	%f14
	edge8l	%l3,	%i6,	%o4
	and	%o2,	%i2,	%g6
	ldsb	[%l7 + 0x16],	%i1
	fbue	%fcc2,	loop_893
loop_893:
	fbge,a	%fcc0,	loop_894
loop_894:
	fbne	%fcc0,	loop_895
loop_895:
	fmovsl	%xcc,	%f12,	%f13
	ldsw	[%l7 + 0x5C],	%o3
	bne,a,pn	%xcc,	loop_896
loop_896:
	ld	[%l7 + 0x7C],	%f11
	brgz	%g4,	loop_897
loop_897:
	bcs	%icc,	loop_898
loop_898:
	brlez,a	%o6,	loop_899
loop_899:
	fblg,a	%fcc0,	loop_900
loop_900:
	fbug,a	%fcc0,	loop_901
loop_901:
	ba,a	loop_902
loop_902:
	for	%f0,	%f12,	%f2
	bl,a,pt	%icc,	loop_903
loop_903:
	fba,a	%fcc0,	loop_904
loop_904:
	nop
	setx loop_905, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_905:
	sth	%i7,	[%l7 + 0x4C]
	brz,a	%l0,	loop_906
loop_906:
	fbl	%fcc0,	loop_907
loop_907:
	fpsub32	%f2,	%f2,	%f6
	ble	loop_908
loop_908:
	ble,a,pt	%xcc,	loop_909
loop_909:
	fbl,a	%fcc3,	loop_910
loop_910:
	ldsw	[%l7 + 0x34],	%o0
	movrlz	%l5,	%i0,	%i3
	bl,a,pt	%xcc,	loop_911
loop_911:
	call	loop_912
loop_912:
	edge8	%o5,	%l2,	%l1
	bpos,a	%icc,	loop_913
loop_913:
	fmovspos	%icc,	%f0,	%f12
	fbn	%fcc0,	loop_914
loop_914:
	movn	%xcc,	%g1,	%o1
	bvs,a,pn	%icc,	loop_915
loop_915:
	ldsb	[%l7 + 0x40],	%l6
	bneg,a,pt	%icc,	loop_916
loop_916:
	bleu,pn	%icc,	loop_917
loop_917:
	bvs,pn	%xcc,	loop_918
loop_918:
	ldsh	[%l7 + 0x5E],	%i4
	fbule	%fcc3,	loop_919
loop_919:
	bcs,pt	%xcc,	loop_920
loop_920:
	bn,a,pt	%icc,	loop_921
loop_921:
	fmovsvc	%xcc,	%f8,	%f3
	tcc	%icc,	0x7
	fmovrdlz	%i5,	%f8,	%f10
	tpos	%xcc,	0x0
	lduw	[%l7 + 0x64],	%l4
	array16	%g7,	%g2,	%g3
	fmovdg	%xcc,	%f4,	%f9
	call	loop_922
loop_922:
	tsubcctv	%o7,	%l3,	%i6
	alignaddrl	%g5,	%o2,	%o4
	fbe	%fcc2,	loop_923
loop_923:
	ldub	[%l7 + 0x70],	%i2
	stb	%i1,	[%l7 + 0x66]
	fmovsn	%icc,	%f4,	%f12
	st	%f4,	[%l7 + 0x74]
	fblg,a	%fcc3,	loop_924
loop_924:
	fmovdvc	%xcc,	%f13,	%f11
	be,a,pt	%xcc,	loop_925
loop_925:
	fbne,a	%fcc3,	loop_926
loop_926:
	fmul8ulx16	%f14,	%f0,	%f2
	fba,a	%fcc3,	loop_927
loop_927:
	ldsh	[%l7 + 0x4E],	%o3
	ldsh	[%l7 + 0x32],	%g4
	st	%f6,	[%l7 + 0x4C]
	bcs	%icc,	loop_928
loop_928:
	st	%f11,	[%l7 + 0x40]
	bcc,a,pn	%xcc,	loop_929
loop_929:
	bge,pn	%xcc,	loop_930
loop_930:
	fbul	%fcc3,	loop_931
loop_931:
	movrgz	%o6,	0x15B,	%g6
	fpsub16s	%f7,	%f14,	%f10
	fmovdcc	%icc,	%f9,	%f13
	fmovsn	%icc,	%f9,	%f10
	fble	%fcc0,	loop_932
loop_932:
	ldub	[%l7 + 0x4A],	%i7
	fbu,a	%fcc0,	loop_933
loop_933:
	fpsub16	%f14,	%f8,	%f12
	fpsub16	%f4,	%f4,	%f10
	tvc	%xcc,	0x5
	std	%f6,	[%l7 + 0x58]
	fmovsl	%xcc,	%f0,	%f2
	ldd	[%l7 + 0x18],	%f2
	nop
	setx loop_934, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_934:
	fmovsvs	%icc,	%f3,	%f6
	tneg	%xcc,	0x5
	fbue	%fcc1,	loop_935
loop_935:
	movl	%icc,	%l0,	%o0
	fcmpne16	%f12,	%f12,	%l5
	srax	%i0,	0x1E,	%i3
	nop
	setx loop_936, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_936:
	be	%icc,	loop_937
loop_937:
	fxor	%f14,	%f14,	%f14
	bpos,a	loop_938
loop_938:
	fbuge	%fcc1,	loop_939
loop_939:
	fzero	%f0
	bne,a,pn	%icc,	loop_940
loop_940:
	bne,pt	%icc,	loop_941
loop_941:
	stw	%o5,	[%l7 + 0x64]
	fcmpgt32	%f6,	%f6,	%l1
	std	%f12,	[%l7 + 0x10]
	fmovrsgz	%g1,	%f14,	%f8
	fmovdn	%icc,	%f14,	%f12
	brgez,a	%o1,	loop_942
loop_942:
	fbul,a	%fcc0,	loop_943
loop_943:
	fmovsa	%xcc,	%f6,	%f11
	bneg	loop_944
loop_944:
	tl	%xcc,	0x2
	stx	%l2,	[%l7 + 0x58]
	bn,a	loop_945
loop_945:
	sth	%l6,	[%l7 + 0x32]
	fble,a	%fcc1,	loop_946
loop_946:
	and	%i4,	%l4,	%i5
	andn	%g7,	0x1F33,	%g3
	fcmpes	%fcc2,	%f8,	%f10
	brgz,a	%g2,	loop_947
loop_947:
	tpos	%icc,	0x3
	fsrc1s	%f7,	%f14
	ldsb	[%l7 + 0x1F],	%o7
	edge32	%l3,	%i6,	%o2
	bpos,pt	%icc,	loop_948
loop_948:
	fbe	%fcc1,	loop_949
loop_949:
	be,a,pt	%xcc,	loop_950
loop_950:
	fbule,a	%fcc2,	loop_951
loop_951:
	fble	%fcc0,	loop_952
loop_952:
	brlez	%g5,	loop_953
loop_953:
	ba,a,pt	%icc,	loop_954
loop_954:
	subcc	%o4,	%i1,	%i2
	bgu,pt	%icc,	loop_955
loop_955:
	fbl	%fcc2,	loop_956
loop_956:
	brlez,a	%o3,	loop_957
loop_957:
	bshuffle	%f2,	%f10,	%f4
	bgu,pt	%xcc,	loop_958
loop_958:
	fmovsl	%icc,	%f5,	%f11
	nop
	setx loop_959, %l0, %l1
	jmpl %l1, %o6
loop_959:
	bg	%icc,	loop_960
loop_960:
	fmovspos	%xcc,	%f1,	%f15
	edge32l	%g4,	%i7,	%l0
	fmul8x16al	%f4,	%f5,	%f14
	fmovsleu	%icc,	%f14,	%f5
	fmovdge	%xcc,	%f10,	%f4
	nop
	setx loop_961, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_961:
	fcmpgt16	%f4,	%f12,	%g6
	call	loop_962
loop_962:
	brnz,a	%l5,	loop_963
loop_963:
	fba,a	%fcc2,	loop_964
loop_964:
	ba	loop_965
loop_965:
	fbo,a	%fcc3,	loop_966
loop_966:
	sllx	%i0,	0x09,	%o0
	fmovrdlz	%o5,	%f14,	%f2
	fba	%fcc2,	loop_967
loop_967:
	std	%f6,	[%l7 + 0x60]
	bcs	loop_968
loop_968:
	edge16ln	%l1,	%i3,	%g1
	fble,a	%fcc1,	loop_969
loop_969:
	brgz	%l2,	loop_970
loop_970:
	fmovd	%f8,	%f4
	lduw	[%l7 + 0x38],	%o1
	fbug,a	%fcc2,	loop_971
loop_971:
	brz,a	%i4,	loop_972
loop_972:
	fbn,a	%fcc2,	loop_973
loop_973:
	taddcc	%l4,	%i5,	%l6
	bvc,a	%xcc,	loop_974
loop_974:
	fmul8x16au	%f13,	%f3,	%f10
	fmovrsgez	%g3,	%f8,	%f0
	bcc,a	%icc,	loop_975
loop_975:
	fpsub16s	%f3,	%f10,	%f1
	nop
	setx loop_976, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_976:
	bge,a	%xcc,	loop_977
loop_977:
	brz	%g2,	loop_978
loop_978:
	bvc,a,pt	%xcc,	loop_979
loop_979:
	movleu	%icc,	%o7,	%g7
	fbn,a	%fcc1,	loop_980
loop_980:
	alignaddrl	%i6,	%o2,	%g5
	ldsb	[%l7 + 0x23],	%o4
	brlz,a	%l3,	loop_981
loop_981:
	subcc	%i1,	0x1982,	%i2
	ld	[%l7 + 0x40],	%f8
	fzero	%f14
	lduh	[%l7 + 0x38],	%o3
	brnz	%g4,	loop_982
loop_982:
	fba	%fcc1,	loop_983
loop_983:
	fxnors	%f14,	%f0,	%f1
	bcs	%icc,	loop_984
loop_984:
	ldsb	[%l7 + 0x3A],	%o6
	nop
	setx loop_985, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_985:
	brgz	%l0,	loop_986
loop_986:
	fbe	%fcc1,	loop_987
loop_987:
	fmovda	%xcc,	%f7,	%f7
	ldsw	[%l7 + 0x14],	%i7
	movrlz	%l5,	0x08A,	%g6
	lduw	[%l7 + 0x10],	%i0
	be	loop_988
loop_988:
	ldub	[%l7 + 0x1F],	%o0
	fbo	%fcc3,	loop_989
loop_989:
	ldsh	[%l7 + 0x3E],	%l1
	fpsub16s	%f12,	%f1,	%f12
	fmovscc	%xcc,	%f13,	%f14
	fbug,a	%fcc2,	loop_990
loop_990:
	fbne	%fcc3,	loop_991
loop_991:
	bcc,a,pn	%xcc,	loop_992
loop_992:
	stw	%o5,	[%l7 + 0x4C]
	ldub	[%l7 + 0x7E],	%g1
	umulcc	%i3,	0x0B7C,	%l2
	brgz	%o1,	loop_993
loop_993:
	fbu,a	%fcc0,	loop_994
loop_994:
	ldd	[%l7 + 0x40],	%f14
	andn	%i4,	%i5,	%l4
	smul	%l6,	0x11B0,	%g3
	bgu,a	loop_995
loop_995:
	edge8ln	%o7,	%g2,	%g7
	ble,a,pn	%xcc,	loop_996
loop_996:
	edge16	%i6,	%g5,	%o2
	bgu,a	%icc,	loop_997
loop_997:
	fpadd32	%f6,	%f0,	%f10
	fcmped	%fcc2,	%f8,	%f4
	fbg	%fcc1,	loop_998
loop_998:
	fba,a	%fcc2,	loop_999
loop_999:
	tl	%xcc,	0x7
	std	%f8,	[%l7 + 0x08]
	nop
	setx loop_1000, %l0, %l1
	jmpl %l1, %l3
loop_1000:
	std	%f8,	[%l7 + 0x68]
	movleu	%icc,	%o4,	%i1
	ble,a,pn	%xcc,	loop_1001
loop_1001:
	bgu	loop_1002
loop_1002:
	fcmpeq32	%f8,	%f14,	%i2
	fbne,a	%fcc2,	loop_1003
loop_1003:
	fbg,a	%fcc0,	loop_1004
loop_1004:
	bcs	loop_1005
loop_1005:
	ldsw	[%l7 + 0x40],	%g4
	edge8ln	%o6,	%o3,	%i7
	nop
	setx loop_1006, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1006:
	movg	%xcc,	%l5,	%g6
	fbl,a	%fcc2,	loop_1007
loop_1007:
	fornot1s	%f7,	%f8,	%f12
	fba,a	%fcc0,	loop_1008
loop_1008:
	ldd	[%l7 + 0x48],	%f2
	fbue	%fcc2,	loop_1009
loop_1009:
	andncc	%l0,	%o0,	%l1
	ld	[%l7 + 0x44],	%f3
	movrne	%o5,	%g1,	%i0
	fcmpes	%fcc2,	%f0,	%f4
	bvc	loop_1010
loop_1010:
	ta	%icc,	0x6
	ldsh	[%l7 + 0x14],	%l2
	fbge	%fcc3,	loop_1011
loop_1011:
	ble,pn	%icc,	loop_1012
loop_1012:
	fbul,a	%fcc1,	loop_1013
loop_1013:
	ldd	[%l7 + 0x30],	%f10
	bl	%xcc,	loop_1014
loop_1014:
	andn	%i3,	0x08E1,	%i4
	fbl	%fcc0,	loop_1015
loop_1015:
	brlez	%i5,	loop_1016
loop_1016:
	bpos,a,pt	%icc,	loop_1017
loop_1017:
	brgez	%o1,	loop_1018
loop_1018:
	stx	%l6,	[%l7 + 0x78]
	bpos,pn	%xcc,	loop_1019
loop_1019:
	bneg,a,pt	%xcc,	loop_1020
loop_1020:
	fmovrsgz	%l4,	%f6,	%f14
	nop
	setx loop_1021, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1021:
	movrlz	%g3,	0x02E,	%o7
	fmovsne	%xcc,	%f0,	%f7
	srlx	%g2,	%i6,	%g5
	bcc	loop_1022
loop_1022:
	fmovda	%xcc,	%f9,	%f2
	brlz	%g7,	loop_1023
loop_1023:
	fpsub16	%f8,	%f0,	%f12
	xnorcc	%o2,	%o4,	%i1
	fblg,a	%fcc2,	loop_1024
loop_1024:
	brlez,a	%l3,	loop_1025
loop_1025:
	bneg,pn	%xcc,	loop_1026
loop_1026:
	taddcctv	%g4,	%o6,	%o3
	tg	%xcc,	0x4
	brlz	%i2,	loop_1027
loop_1027:
	fble,a	%fcc1,	loop_1028
loop_1028:
	tsubcctv	%i7,	%g6,	%l0
	fbl,a	%fcc3,	loop_1029
loop_1029:
	fnegd	%f10,	%f4
	fbl	%fcc3,	loop_1030
loop_1030:
	tl	%icc,	0x4
	bvs,a,pt	%icc,	loop_1031
loop_1031:
	fcmps	%fcc0,	%f15,	%f12
	movcs	%xcc,	%o0,	%l1
	movvs	%icc,	%l5,	%o5
	tcs	%xcc,	0x0
	lduh	[%l7 + 0x3E],	%g1
	stw	%l2,	[%l7 + 0x2C]
	te	%xcc,	0x4
	edge16l	%i3,	%i4,	%i0
	fmovda	%icc,	%f0,	%f7
	fble,a	%fcc3,	loop_1032
loop_1032:
	fba	%fcc1,	loop_1033
loop_1033:
	ba,pt	%icc,	loop_1034
loop_1034:
	fmovrdlz	%o1,	%f12,	%f14
	st	%f13,	[%l7 + 0x6C]
	nop
	setx loop_1035, %l0, %l1
	jmpl %l1, %i5
loop_1035:
	stw	%l6,	[%l7 + 0x58]
	bge,a	%icc,	loop_1036
loop_1036:
	ldsw	[%l7 + 0x14],	%g3
	bne	%icc,	loop_1037
loop_1037:
	ldub	[%l7 + 0x7A],	%o7
	ldd	[%l7 + 0x30],	%f10
	ldd	[%l7 + 0x70],	%f12
	fcmpeq32	%f8,	%f0,	%g2
	fbue,a	%fcc3,	loop_1038
loop_1038:
	fbul,a	%fcc0,	loop_1039
loop_1039:
	fbul	%fcc0,	loop_1040
loop_1040:
	ba	loop_1041
loop_1041:
	siam	0x5
	brgez,a	%l4,	loop_1042
loop_1042:
	tvc	%xcc,	0x6
	fmovsg	%xcc,	%f4,	%f2
	brnz,a	%g5,	loop_1043
loop_1043:
	xnorcc	%i6,	%o2,	%g7
	fbe,a	%fcc2,	loop_1044
loop_1044:
	fbne,a	%fcc3,	loop_1045
loop_1045:
	tle	%icc,	0x7
	be,pt	%icc,	loop_1046
loop_1046:
	movcs	%xcc,	%i1,	%l3
	lduh	[%l7 + 0x20],	%g4
	fbu	%fcc2,	loop_1047
loop_1047:
	fbne,a	%fcc2,	loop_1048
loop_1048:
	lduh	[%l7 + 0x78],	%o4
	srlx	%o6,	0x04,	%i2
	fcmpes	%fcc3,	%f12,	%f5
	fbl	%fcc3,	loop_1049
loop_1049:
	call	loop_1050
loop_1050:
	srl	%i7,	0x1D,	%g6
	bl,pn	%xcc,	loop_1051
loop_1051:
	nop
	setx loop_1052, %l0, %l1
	jmpl %l1, %o3
loop_1052:
	fpadd16s	%f4,	%f15,	%f4
	call	loop_1053
loop_1053:
	fba	%fcc2,	loop_1054
loop_1054:
	stb	%o0,	[%l7 + 0x38]
	fbe	%fcc3,	loop_1055
loop_1055:
	bl,a	loop_1056
loop_1056:
	bg,a	loop_1057
loop_1057:
	fble	%fcc0,	loop_1058
loop_1058:
	andcc	%l1,	0x004F,	%l0
	ld	[%l7 + 0x78],	%f8
	fpack32	%f6,	%f14,	%f6
	bg,a,pn	%icc,	loop_1059
loop_1059:
	fbne,a	%fcc1,	loop_1060
loop_1060:
	fble,a	%fcc1,	loop_1061
loop_1061:
	alignaddrl	%l5,	%o5,	%l2
	array8	%g1,	%i4,	%i3
	andn	%o1,	0x0A95,	%i5
	fmovdcc	%icc,	%f4,	%f13
	brnz	%l6,	loop_1062
loop_1062:
	lduh	[%l7 + 0x22],	%g3
	andn	%o7,	0x182E,	%g2
	ldsb	[%l7 + 0x0D],	%l4
	call	loop_1063
loop_1063:
	subcc	%i0,	0x06D3,	%i6
	brlz,a	%g5,	loop_1064
loop_1064:
	bn	%xcc,	loop_1065
loop_1065:
	bgu,a,pn	%icc,	loop_1066
loop_1066:
	bvc,a	%xcc,	loop_1067
loop_1067:
	brgz	%o2,	loop_1068
loop_1068:
	fbu	%fcc3,	loop_1069
loop_1069:
	fmovsa	%icc,	%f1,	%f7
	fexpand	%f7,	%f10
	fcmpeq16	%f8,	%f14,	%i1
	fbn	%fcc1,	loop_1070
loop_1070:
	bneg,a,pn	%xcc,	loop_1071
loop_1071:
	bg	loop_1072
loop_1072:
	fmovdcc	%icc,	%f14,	%f5
	bvs,pn	%icc,	loop_1073
loop_1073:
	bcs	%icc,	loop_1074
loop_1074:
	fmovdleu	%icc,	%f12,	%f11
	fmovdn	%xcc,	%f14,	%f12
	fandnot1	%f4,	%f6,	%f0
	sdivx	%g7,	0x010F,	%l3
	fmul8x16al	%f9,	%f9,	%f8
	fmovsneg	%xcc,	%f1,	%f7
	fbne	%fcc3,	loop_1075
loop_1075:
	movleu	%icc,	%o4,	%o6
	sllx	%i2,	0x0E,	%i7
	edge32	%g4,	%o3,	%o0
	bge,pt	%xcc,	loop_1076
loop_1076:
	bgu,pn	%icc,	loop_1077
loop_1077:
	edge16n	%g6,	%l1,	%l0
	tcs	%xcc,	0x6
	fpack16	%f12,	%f2
	brlez	%l5,	loop_1078
loop_1078:
	bg,a,pn	%icc,	loop_1079
loop_1079:
	fmul8x16	%f14,	%f6,	%f2
	fnands	%f12,	%f15,	%f5
	movge	%xcc,	%o5,	%l2
	fblg,a	%fcc0,	loop_1080
loop_1080:
	st	%f11,	[%l7 + 0x4C]
	nop
	setx loop_1081, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1081:
	fmovscc	%xcc,	%f8,	%f9
	ldsh	[%l7 + 0x6C],	%i4
	add	%i3,	%g1,	%i5
	fmovsvs	%icc,	%f9,	%f6
	fsrc2s	%f11,	%f10
	bl	loop_1082
loop_1082:
	bvc,a,pn	%icc,	loop_1083
loop_1083:
	fabss	%f12,	%f0
	bvc,a,pt	%xcc,	loop_1084
loop_1084:
	brlez	%l6,	loop_1085
loop_1085:
	brgz,a	%o1,	loop_1086
loop_1086:
	fmovda	%icc,	%f15,	%f15
	lduh	[%l7 + 0x08],	%g3
	fandnot2s	%f1,	%f6,	%f8
	fbule	%fcc3,	loop_1087
loop_1087:
	stb	%g2,	[%l7 + 0x47]
	bgu,pt	%xcc,	loop_1088
loop_1088:
	fmovsleu	%xcc,	%f3,	%f15
	movl	%xcc,	%o7,	%i0
	mulscc	%l4,	%g5,	%i6
	bvc	loop_1089
loop_1089:
	fmovscs	%icc,	%f10,	%f12
	bge	loop_1090
loop_1090:
	fbn,a	%fcc0,	loop_1091
loop_1091:
	bneg,a	loop_1092
loop_1092:
	ldsw	[%l7 + 0x34],	%i1
	bgu,a,pn	%xcc,	loop_1093
loop_1093:
	fandnot2s	%f11,	%f9,	%f3
	addc	%g7,	0x1392,	%o2
	bvs,pn	%icc,	loop_1094
loop_1094:
	fpsub16	%f10,	%f6,	%f4
	lduh	[%l7 + 0x78],	%l3
	fpsub32s	%f6,	%f14,	%f13
	fpackfix	%f8,	%f12
	fnor	%f12,	%f2,	%f0
	fmovdgu	%icc,	%f11,	%f15
	lduw	[%l7 + 0x2C],	%o4
	brlz,a	%o6,	loop_1095
loop_1095:
	alignaddr	%i2,	%i7,	%o3
	bvs,a,pn	%icc,	loop_1096
loop_1096:
	fbn,a	%fcc2,	loop_1097
loop_1097:
	bge	loop_1098
loop_1098:
	brz,a	%g4,	loop_1099
loop_1099:
	movrgez	%g6,	0x148,	%o0
	ba,a,pn	%icc,	loop_1100
loop_1100:
	array16	%l1,	%l0,	%o5
	nop
	setx loop_1101, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1101:
	fabsd	%f6,	%f10
	bge	loop_1102
loop_1102:
	bcc	loop_1103
loop_1103:
	call	loop_1104
loop_1104:
	bvs,a,pn	%icc,	loop_1105
loop_1105:
	fmovsl	%icc,	%f0,	%f13
	fbuge	%fcc1,	loop_1106
loop_1106:
	movre	%l2,	0x2A8,	%i4
	bl,pn	%icc,	loop_1107
loop_1107:
	fmovdvc	%icc,	%f14,	%f6
	nop
	setx loop_1108, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1108:
	ld	[%l7 + 0x78],	%f9
	bcc	loop_1109
loop_1109:
	bneg,a	%xcc,	loop_1110
loop_1110:
	fbuge	%fcc2,	loop_1111
loop_1111:
	ldsw	[%l7 + 0x40],	%i3
	ldub	[%l7 + 0x5C],	%l5
	fmul8x16	%f2,	%f2,	%f12
	ldub	[%l7 + 0x26],	%i5
	fsrc2	%f14,	%f4
	fbu,a	%fcc1,	loop_1112
loop_1112:
	lduh	[%l7 + 0x4C],	%g1
	fmuld8ulx16	%f10,	%f14,	%f12
	fnot1s	%f6,	%f12
	call	loop_1113
loop_1113:
	fbuge,a	%fcc1,	loop_1114
loop_1114:
	tcs	%xcc,	0x4
	sub	%o1,	%l6,	%g3
	bcc,pt	%xcc,	loop_1115
loop_1115:
	tg	%icc,	0x5
	bg,pn	%xcc,	loop_1116
loop_1116:
	nop
	setx loop_1117, %l0, %l1
	jmpl %l1, %g2
loop_1117:
	fmovsl	%icc,	%f15,	%f4
	fbuge,a	%fcc2,	loop_1118
loop_1118:
	bleu	%icc,	loop_1119
loop_1119:
	bgu	%icc,	loop_1120
loop_1120:
	fors	%f7,	%f10,	%f4
	nop
	setx loop_1121, %l0, %l1
	jmpl %l1, %o7
loop_1121:
	movre	%l4,	0x151,	%g5
	fbul	%fcc1,	loop_1122
loop_1122:
	brgz	%i0,	loop_1123
loop_1123:
	fbug	%fcc0,	loop_1124
loop_1124:
	fble,a	%fcc2,	loop_1125
loop_1125:
	fbg	%fcc3,	loop_1126
loop_1126:
	fand	%f10,	%f12,	%f2
	bleu,pn	%icc,	loop_1127
loop_1127:
	movrlz	%i6,	%g7,	%o2
	fbul,a	%fcc3,	loop_1128
loop_1128:
	taddcctv	%l3,	0x00B8,	%o4
	bne,a,pn	%icc,	loop_1129
loop_1129:
	ble,pn	%xcc,	loop_1130
loop_1130:
	call	loop_1131
loop_1131:
	bcc	%icc,	loop_1132
loop_1132:
	fmovrdgz	%o6,	%f0,	%f4
	edge32ln	%i2,	%i7,	%i1
	edge16	%o3,	%g4,	%g6
	add	%o0,	0x1EFE,	%l1
	brgez,a	%o5,	loop_1133
loop_1133:
	edge16n	%l0,	%i4,	%i3
	bleu	loop_1134
loop_1134:
	ldd	[%l7 + 0x08],	%f10
	bne,pn	%icc,	loop_1135
loop_1135:
	be,a	%icc,	loop_1136
loop_1136:
	fbo,a	%fcc3,	loop_1137
loop_1137:
	orn	%l5,	%i5,	%l2
	bn	%xcc,	loop_1138
loop_1138:
	bleu,pn	%xcc,	loop_1139
loop_1139:
	addcc	%o1,	%l6,	%g1
	brnz,a	%g2,	loop_1140
loop_1140:
	fornot2	%f10,	%f0,	%f2
	edge16ln	%o7,	%l4,	%g3
	bge,a,pn	%xcc,	loop_1141
loop_1141:
	call	loop_1142
loop_1142:
	ldsh	[%l7 + 0x3C],	%i0
	stx	%i6,	[%l7 + 0x30]
	nop
	setx loop_1143, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1143:
	fbge	%fcc3,	loop_1144
loop_1144:
	stx	%g7,	[%l7 + 0x68]
	fbne,a	%fcc2,	loop_1145
loop_1145:
	fbo,a	%fcc0,	loop_1146
loop_1146:
	bl	loop_1147
loop_1147:
	orcc	%o2,	%l3,	%g5
	fbu	%fcc0,	loop_1148
loop_1148:
	bgu,a	loop_1149
loop_1149:
	stb	%o6,	[%l7 + 0x55]
	fones	%f3
	fble,a	%fcc1,	loop_1150
loop_1150:
	fbne	%fcc2,	loop_1151
loop_1151:
	bvs,a	%icc,	loop_1152
loop_1152:
	bcc	%icc,	loop_1153
loop_1153:
	fmovd	%f2,	%f10
	tcc	%icc,	0x3
	brz	%o4,	loop_1154
loop_1154:
	bn,pt	%icc,	loop_1155
loop_1155:
	movrgz	%i7,	%i1,	%i2
	fbn	%fcc3,	loop_1156
loop_1156:
	smulcc	%g4,	0x1227,	%g6
	brlz,a	%o0,	loop_1157
loop_1157:
	fba	%fcc1,	loop_1158
loop_1158:
	edge8	%l1,	%o5,	%l0
	bcs,pt	%icc,	loop_1159
loop_1159:
	brlz,a	%o3,	loop_1160
loop_1160:
	ble,a,pt	%xcc,	loop_1161
loop_1161:
	fnand	%f0,	%f2,	%f6
	bl	loop_1162
loop_1162:
	fba	%fcc1,	loop_1163
loop_1163:
	fone	%f6
	fbo,a	%fcc3,	loop_1164
loop_1164:
	ldub	[%l7 + 0x1D],	%i4
	fbe	%fcc3,	loop_1165
loop_1165:
	movgu	%xcc,	%i3,	%i5
	fbo,a	%fcc3,	loop_1166
loop_1166:
	fbl,a	%fcc3,	loop_1167
loop_1167:
	sdiv	%l2,	0x18C5,	%l5
	bn,a	%icc,	loop_1168
loop_1168:
	edge16n	%o1,	%g1,	%l6
	fbg	%fcc3,	loop_1169
loop_1169:
	fornot2s	%f10,	%f4,	%f4
	fmul8x16	%f8,	%f2,	%f8
	fbo,a	%fcc0,	loop_1170
loop_1170:
	edge16	%o7,	%g2,	%g3
	fbuge	%fcc0,	loop_1171
loop_1171:
	orcc	%l4,	%i6,	%i0
	fble,a	%fcc0,	loop_1172
loop_1172:
	fnegd	%f4,	%f4
	edge16n	%g7,	%o2,	%g5
	pdist	%f4,	%f8,	%f4
	fbule,a	%fcc3,	loop_1173
loop_1173:
	ldsb	[%l7 + 0x1B],	%o6
	fbuge	%fcc0,	loop_1174
loop_1174:
	brgz	%o4,	loop_1175
loop_1175:
	nop
	setx loop_1176, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1176:
	std	%f6,	[%l7 + 0x68]
	fmuld8sux16	%f9,	%f2,	%f0
	lduw	[%l7 + 0x20],	%l3
	bpos,a	loop_1177
loop_1177:
	fbe,a	%fcc0,	loop_1178
loop_1178:
	fbge	%fcc0,	loop_1179
loop_1179:
	bge,pn	%xcc,	loop_1180
loop_1180:
	brgz	%i1,	loop_1181
loop_1181:
	fmovsa	%icc,	%f7,	%f14
	fones	%f6
	bleu	loop_1182
loop_1182:
	ldsw	[%l7 + 0x08],	%i2
	bn	loop_1183
loop_1183:
	fbge	%fcc0,	loop_1184
loop_1184:
	ld	[%l7 + 0x0C],	%f9
	fcmped	%fcc1,	%f10,	%f14
	tleu	%xcc,	0x5
	fba	%fcc2,	loop_1185
loop_1185:
	nop
	setx loop_1186, %l0, %l1
	jmpl %l1, %i7
loop_1186:
	fbn	%fcc0,	loop_1187
loop_1187:
	fmovrdne	%g6,	%f6,	%f14
	fbue,a	%fcc2,	loop_1188
loop_1188:
	subccc	%g4,	0x1F93,	%l1
	brgez,a	%o5,	loop_1189
loop_1189:
	bcs,a	loop_1190
loop_1190:
	fba	%fcc3,	loop_1191
loop_1191:
	nop
	setx loop_1192, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1192:
	nop
	setx loop_1193, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1193:
	fbe	%fcc3,	loop_1194
loop_1194:
	nop
	setx loop_1195, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1195:
	fpsub16s	%f4,	%f8,	%f3
	bleu	loop_1196
loop_1196:
	bn,a	%icc,	loop_1197
loop_1197:
	ldsw	[%l7 + 0x6C],	%l0
	bvc,a,pn	%xcc,	loop_1198
loop_1198:
	fbg	%fcc2,	loop_1199
loop_1199:
	nop
	setx loop_1200, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1200:
	fba	%fcc2,	loop_1201
loop_1201:
	be,a	%xcc,	loop_1202
loop_1202:
	alignaddr	%o0,	%o3,	%i3
	fbu	%fcc1,	loop_1203
loop_1203:
	fble,a	%fcc3,	loop_1204
loop_1204:
	fbl,a	%fcc3,	loop_1205
loop_1205:
	tpos	%icc,	0x2
	brlez	%i5,	loop_1206
loop_1206:
	ldd	[%l7 + 0x48],	%f10
	fblg,a	%fcc2,	loop_1207
loop_1207:
	nop
	setx loop_1208, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1208:
	sllx	%i4,	%l2,	%l5
	brgez,a	%o1,	loop_1209
loop_1209:
	fmovdge	%icc,	%f14,	%f15
	edge16n	%l6,	%g1,	%o7
	fbne,a	%fcc3,	loop_1210
loop_1210:
	udiv	%g2,	0x1C22,	%l4
	brgez,a	%g3,	loop_1211
loop_1211:
	fba	%fcc3,	loop_1212
loop_1212:
	fzero	%f8
	fpsub16	%f6,	%f12,	%f2
	lduw	[%l7 + 0x74],	%i6
	nop
	setx loop_1213, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1213:
	bvs,pt	%icc,	loop_1214
loop_1214:
	bgu,a	loop_1215
loop_1215:
	bvs,a	%xcc,	loop_1216
loop_1216:
	sllx	%g7,	%i0,	%g5
	nop
	setx loop_1217, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1217:
	fors	%f5,	%f0,	%f14
	add	%o2,	0x18B6,	%o6
	fcmpeq32	%f10,	%f10,	%l3
	bvc,a,pn	%icc,	loop_1218
loop_1218:
	fbo	%fcc3,	loop_1219
loop_1219:
	fba	%fcc0,	loop_1220
loop_1220:
	fbe	%fcc0,	loop_1221
loop_1221:
	fpackfix	%f8,	%f12
	bvs,a,pt	%xcc,	loop_1222
loop_1222:
	fbge,a	%fcc0,	loop_1223
loop_1223:
	fandnot2s	%f0,	%f12,	%f9
	fmovrsgez	%i1,	%f9,	%f2
	bn	%xcc,	loop_1224
loop_1224:
	fnot1	%f14,	%f0
	bge	%xcc,	loop_1225
loop_1225:
	stx	%o4,	[%l7 + 0x20]
	bneg	%xcc,	loop_1226
loop_1226:
	bvc	%icc,	loop_1227
loop_1227:
	fcmpne32	%f8,	%f2,	%i2
	brgz,a	%i7,	loop_1228
loop_1228:
	fnot1s	%f1,	%f5
	ldsw	[%l7 + 0x68],	%g6
	bl,pt	%icc,	loop_1229
loop_1229:
	bneg,a	loop_1230
loop_1230:
	ldsh	[%l7 + 0x10],	%g4
	ta	%icc,	0x4
	call	loop_1231
loop_1231:
	for	%f6,	%f10,	%f6
	smul	%l1,	%o5,	%l0
	tle	%xcc,	0x2
	ba,a,pn	%xcc,	loop_1232
loop_1232:
	movpos	%icc,	%o3,	%i3
	fcmpne32	%f2,	%f4,	%o0
	nop
	setx loop_1233, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1233:
	bvc,a	%xcc,	loop_1234
loop_1234:
	fbg	%fcc2,	loop_1235
loop_1235:
	movre	%i5,	%l2,	%i4
	brlez,a	%l5,	loop_1236
loop_1236:
	nop
	setx loop_1237, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1237:
	brgez,a	%o1,	loop_1238
loop_1238:
	bleu,a	loop_1239
loop_1239:
	ldsh	[%l7 + 0x28],	%g1
	ldx	[%l7 + 0x18],	%l6
	fbn,a	%fcc1,	loop_1240
loop_1240:
	fmovdvs	%xcc,	%f9,	%f4
	fmovdg	%icc,	%f6,	%f12
	nop
	setx loop_1241, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1241:
	fbn	%fcc3,	loop_1242
loop_1242:
	andcc	%g2,	0x14A3,	%o7
	bne	%icc,	loop_1243
loop_1243:
	edge16n	%l4,	%i6,	%g3
	bcs,a,pn	%icc,	loop_1244
loop_1244:
	fmovdcs	%icc,	%f10,	%f11
	fands	%f14,	%f1,	%f10
	lduh	[%l7 + 0x3C],	%i0
	st	%f11,	[%l7 + 0x18]
	bg,a,pn	%icc,	loop_1245
loop_1245:
	ldsb	[%l7 + 0x62],	%g7
	brz,a	%o2,	loop_1246
loop_1246:
	lduh	[%l7 + 0x36],	%g5
	brlz	%l3,	loop_1247
loop_1247:
	call	loop_1248
loop_1248:
	tn	%icc,	0x1
	fmul8x16	%f6,	%f4,	%f8
	fnand	%f8,	%f4,	%f14
	stx	%i1,	[%l7 + 0x70]
	fmovdvs	%icc,	%f13,	%f5
	stw	%o4,	[%l7 + 0x7C]
	bgu,a,pn	%icc,	loop_1249
loop_1249:
	fcmpne16	%f8,	%f6,	%i2
	bn	loop_1250
loop_1250:
	movne	%xcc,	%o6,	%i7
	fbul	%fcc2,	loop_1251
loop_1251:
	fcmple16	%f12,	%f4,	%g4
	stx	%l1,	[%l7 + 0x38]
	fbue,a	%fcc0,	loop_1252
loop_1252:
	nop
	setx loop_1253, %l0, %l1
	jmpl %l1, %g6
loop_1253:
	bge,pn	%icc,	loop_1254
loop_1254:
	fabss	%f1,	%f4
	tneg	%xcc,	0x0
	bneg	%icc,	loop_1255
loop_1255:
	fbn,a	%fcc1,	loop_1256
loop_1256:
	bvs,a,pn	%icc,	loop_1257
loop_1257:
	fcmple16	%f8,	%f2,	%l0
	ble	loop_1258
loop_1258:
	fmovsne	%icc,	%f6,	%f13
	subcc	%o3,	0x0B01,	%i3
	stb	%o0,	[%l7 + 0x39]
	bge,pt	%xcc,	loop_1259
loop_1259:
	fnegs	%f3,	%f14
	bpos,a	%icc,	loop_1260
loop_1260:
	ld	[%l7 + 0x08],	%f13
	bcc,a,pn	%icc,	loop_1261
loop_1261:
	edge8	%i5,	%o5,	%i4
	bleu,a,pn	%xcc,	loop_1262
loop_1262:
	fbne,a	%fcc0,	loop_1263
loop_1263:
	udivx	%l5,	0x1616,	%o1
	fornot2s	%f5,	%f0,	%f7
	bgu,a,pt	%xcc,	loop_1264
loop_1264:
	fbge,a	%fcc3,	loop_1265
loop_1265:
	fbg	%fcc1,	loop_1266
loop_1266:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type f   	: 191
!	Type i   	: 167
!	Type cti   	: 518
!	Type l   	: 124
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
main_t5:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0xC,	%g2
	set	0x7,	%g3
	set	0xB,	%g4
	set	0x8,	%g5
	set	0xB,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x1,	%i1
	set	-0xD,	%i2
	set	-0x4,	%i3
	set	-0x8,	%i4
	set	-0x4,	%i5
	set	-0x5,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x2AD25982,	%l0
	set	0x7B54A1DB,	%l1
	set	0x5E93E9E2,	%l2
	set	0x0F90C51C,	%l3
	set	0x29BAE888,	%l4
	set	0x5A86E1EB,	%l5
	set	0x5D7E953E,	%l6
	!# Output registers
	set	-0x18B9,	%o0
	set	-0x1388,	%o1
	set	-0x134C,	%o2
	set	0x18D8,	%o3
	set	0x18E2,	%o4
	set	-0x18E8,	%o5
	set	0x09D2,	%o6
	set	0x078D,	%o7

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

	subc	%g1,	%l6,	%l2
	orn	%o7,	0x07E0,	%l4
	bshuffle	%f8,	%f4,	%f6
	fbue,a	%fcc0,	loop_1267
loop_1267:
	subccc	%g2,	0x0770,	%i6
	or	%g3,	%g7,	%o2
	tg	%icc,	0x6
	smulcc	%i0,	0x10D3,	%l3
	sth	%i1,	[%l7 + 0x66]
	srl	%g5,	%o4,	%i2
	brgz	%i7,	loop_1268
loop_1268:
	mulx	%o6,	0x08BE,	%l1
	tn	%xcc,	0x5
	fpsub16s	%f15,	%f15,	%f6
	stx	%g4,	[%l7 + 0x28]
	ta	%xcc,	0x5
	or	%g6,	0x0084,	%o3
	nop
	setx loop_1269, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1269:
	fmovrde	%l0,	%f2,	%f6
	fmovdneg	%xcc,	%f5,	%f7
	xorcc	%i3,	%i5,	%o0
	ldsb	[%l7 + 0x2A],	%o5
	orcc	%l5,	%o1,	%i4
	mulx	%l6,	0x0729,	%l2
	fnot2	%f10,	%f4
	andn	%o7,	%g1,	%g2
	fornot2s	%f15,	%f9,	%f0
	sth	%l4,	[%l7 + 0x12]
	fpsub16	%f6,	%f10,	%f10
	tle	%icc,	0x3
	edge8ln	%g3,	%g7,	%o2
	ldd	[%l7 + 0x30],	%f10
	taddcc	%i0,	0x16FB,	%l3
	udivcc	%i6,	0x130D,	%g5
	andn	%i1,	0x00D5,	%o4
	subccc	%i2,	%o6,	%l1
	edge32l	%g4,	%i7,	%g6
	fmovsa	%xcc,	%f13,	%f11
	ldsh	[%l7 + 0x66],	%l0
	movrgez	%i3,	0x2F4,	%o3
	movne	%icc,	%i5,	%o0
	for	%f0,	%f2,	%f10
	ldsw	[%l7 + 0x24],	%l5
	bgu	loop_1270
loop_1270:
	fbe,a	%fcc1,	loop_1271
loop_1271:
	movn	%xcc,	%o5,	%i4
	std	%f10,	[%l7 + 0x78]
	movvs	%xcc,	%o1,	%l6
	fpackfix	%f6,	%f6
	edge32ln	%o7,	%l2,	%g2
	tg	%icc,	0x4
	udivcc	%l4,	0x12F1,	%g1
	sethi	0x1114,	%g3
	fbge,a	%fcc2,	loop_1272
loop_1272:
	subcc	%o2,	%g7,	%l3
	or	%i0,	%g5,	%i1
	stw	%i6,	[%l7 + 0x48]
	ldd	[%l7 + 0x08],	%f6
	bneg	loop_1273
loop_1273:
	brgz	%i2,	loop_1274
loop_1274:
	srl	%o4,	0x0D,	%l1
	fmovrsgez	%g4,	%f15,	%f8
	tneg	%xcc,	0x2
	fmovdn	%xcc,	%f11,	%f6
	movrlz	%o6,	%i7,	%l0
	sdivcc	%i3,	0x1EB7,	%g6
	array8	%o3,	%i5,	%o0
	stb	%l5,	[%l7 + 0x67]
	movrgz	%o5,	%i4,	%l6
	nop
	setx loop_1275, %l0, %l1
	jmpl %l1, %o1
loop_1275:
	fxnors	%f8,	%f4,	%f7
	fcmple32	%f2,	%f12,	%l2
	movcc	%xcc,	%g2,	%o7
	add	%g1,	%l4,	%o2
	ldsw	[%l7 + 0x30],	%g3
	lduw	[%l7 + 0x28],	%l3
	sth	%i0,	[%l7 + 0x64]
	movneg	%icc,	%g5,	%i1
	fmovsgu	%xcc,	%f6,	%f6
	fmuld8ulx16	%f13,	%f12,	%f2
	andncc	%g7,	%i2,	%i6
	mulscc	%l1,	0x12C8,	%g4
	fone	%f4
	fmovscc	%xcc,	%f1,	%f2
	bpos,a	%xcc,	loop_1276
loop_1276:
	brgz	%o6,	loop_1277
loop_1277:
	addc	%o4,	0x16ED,	%i7
	brnz	%i3,	loop_1278
loop_1278:
	stx	%l0,	[%l7 + 0x30]
	bne	%xcc,	loop_1279
loop_1279:
	udivx	%g6,	0x1F98,	%i5
	xnorcc	%o3,	%o0,	%o5
	edge8n	%l5,	%i4,	%l6
	fpmerge	%f7,	%f15,	%f10
	smulcc	%l2,	%o1,	%o7
	fexpand	%f4,	%f14
	fmovdpos	%xcc,	%f7,	%f6
	fmul8x16au	%f12,	%f8,	%f8
	lduw	[%l7 + 0x14],	%g2
	tpos	%icc,	0x3
	tn	%icc,	0x1
	std	%f0,	[%l7 + 0x48]
	xnorcc	%l4,	0x0982,	%g1
	tne	%icc,	0x6
	fbug	%fcc3,	loop_1280
loop_1280:
	ble,pt	%icc,	loop_1281
loop_1281:
	ld	[%l7 + 0x48],	%f11
	tgu	%xcc,	0x1
	fmul8x16al	%f1,	%f2,	%f4
	tpos	%xcc,	0x1
	movrne	%o2,	%l3,	%i0
	fmovda	%icc,	%f12,	%f8
	popc	0x0A15,	%g3
	fbule	%fcc1,	loop_1282
loop_1282:
	bg	%icc,	loop_1283
loop_1283:
	and	%i1,	%g7,	%g5
	fxor	%f6,	%f12,	%f14
	ld	[%l7 + 0x68],	%f13
	movgu	%xcc,	%i2,	%i6
	fmul8x16al	%f1,	%f6,	%f4
	tcs	%xcc,	0x6
	movre	%g4,	%o6,	%l1
	movn	%icc,	%i7,	%i3
	ld	[%l7 + 0x74],	%f4
	andcc	%l0,	%g6,	%o4
	tg	%icc,	0x5
	edge32l	%i5,	%o0,	%o3
	srlx	%l5,	%i4,	%o5
	sllx	%l2,	%l6,	%o7
	tpos	%icc,	0x5
	tge	%icc,	0x6
	movg	%xcc,	%o1,	%g2
	tle	%icc,	0x1
	fpsub32	%f0,	%f14,	%f6
	tle	%xcc,	0x7
	te	%xcc,	0x5
	ta	%xcc,	0x5
	sub	%l4,	%o2,	%g1
	tgu	%xcc,	0x0
	edge32l	%l3,	%i0,	%i1
	movrgez	%g3,	0x214,	%g7
	tcs	%icc,	0x5
	sra	%i2,	0x16,	%i6
	subc	%g4,	0x1A10,	%g5
	fmuld8ulx16	%f1,	%f11,	%f4
	fbug	%fcc2,	loop_1284
loop_1284:
	tgu	%icc,	0x1
	tcc	%xcc,	0x3
	taddcctv	%o6,	0x0F73,	%l1
	fandnot2s	%f10,	%f3,	%f5
	fmovdne	%icc,	%f12,	%f15
	ldsb	[%l7 + 0x4D],	%i7
	bne,a,pt	%xcc,	loop_1285
loop_1285:
	addc	%l0,	0x11A3,	%i3
	movl	%xcc,	%g6,	%o4
	ta	%icc,	0x7
	edge32ln	%o0,	%i5,	%o3
	fble,a	%fcc2,	loop_1286
loop_1286:
	edge32l	%i4,	%l5,	%o5
	subccc	%l2,	0x1FFC,	%l6
	sra	%o7,	%g2,	%o1
	movle	%xcc,	%l4,	%o2
	fmovsl	%xcc,	%f6,	%f7
	movge	%icc,	%g1,	%i0
	stx	%i1,	[%l7 + 0x60]
	mulx	%g3,	%l3,	%i2
	fbul	%fcc3,	loop_1287
loop_1287:
	lduw	[%l7 + 0x3C],	%g7
	fbne	%fcc0,	loop_1288
loop_1288:
	tvc	%icc,	0x0
	fmovsg	%xcc,	%f9,	%f12
	ldx	[%l7 + 0x28],	%g4
	ldsw	[%l7 + 0x70],	%g5
	xnorcc	%o6,	%l1,	%i7
	fmovs	%f10,	%f5
	array32	%i6,	%l0,	%i3
	tsubcctv	%g6,	%o4,	%o0
	fbule,a	%fcc1,	loop_1289
loop_1289:
	bg,a	loop_1290
loop_1290:
	tcc	%xcc,	0x7
	edge32ln	%i5,	%i4,	%l5
	ldd	[%l7 + 0x20],	%f2
	nop
	setx loop_1291, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1291:
	tleu	%xcc,	0x2
	ldsb	[%l7 + 0x12],	%o3
	fzeros	%f10
	nop
	setx loop_1292, %l0, %l1
	jmpl %l1, %o5
loop_1292:
	tvs	%xcc,	0x5
	brz	%l6,	loop_1293
loop_1293:
	bvs,pn	%icc,	loop_1294
loop_1294:
	fbuge	%fcc1,	loop_1295
loop_1295:
	brgez,a	%l2,	loop_1296
loop_1296:
	edge16ln	%g2,	%o1,	%o7
	taddcctv	%l4,	0x07EF,	%g1
	tcc	%xcc,	0x4
	movgu	%xcc,	%i0,	%o2
	popc	0x065A,	%g3
	nop
	setx loop_1297, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1297:
	tne	%xcc,	0x3
	move	%xcc,	%i1,	%i2
	tvc	%icc,	0x1
	fnot1s	%f7,	%f1
	subccc	%l3,	%g4,	%g5
	udivx	%o6,	0x0F7B,	%l1
	fxor	%f14,	%f8,	%f4
	array8	%i7,	%i6,	%g7
	movpos	%xcc,	%i3,	%l0
	fmovs	%f10,	%f3
	tneg	%xcc,	0x3
	smulcc	%g6,	%o4,	%i5
	mova	%icc,	%i4,	%o0
	fcmpeq16	%f4,	%f10,	%o3
	array16	%l5,	%o5,	%l2
	andncc	%g2,	%l6,	%o7
	sdiv	%l4,	0x19AC,	%g1
	tneg	%icc,	0x7
	tn	%xcc,	0x0
	tleu	%icc,	0x7
	ldx	[%l7 + 0x30],	%o1
	fnot1	%f2,	%f4
	bvc,a,pt	%xcc,	loop_1298
loop_1298:
	brz,a	%o2,	loop_1299
loop_1299:
	orncc	%i0,	%i1,	%i2
	fcmpgt16	%f10,	%f0,	%g3
	andn	%g4,	%l3,	%o6
	fpadd16	%f10,	%f12,	%f14
	fmovdpos	%xcc,	%f12,	%f10
	fmovdcc	%icc,	%f2,	%f12
	movl	%xcc,	%g5,	%i7
	tsubcc	%l1,	0x166F,	%g7
	brnz	%i6,	loop_1300
loop_1300:
	andncc	%i3,	%g6,	%l0
	stx	%o4,	[%l7 + 0x68]
	umul	%i5,	%i4,	%o3
	fmovspos	%xcc,	%f15,	%f3
	fmovrde	%o0,	%f8,	%f8
	subccc	%l5,	0x1F3D,	%l2
	fnor	%f14,	%f10,	%f2
	st	%f11,	[%l7 + 0x60]
	udiv	%g2,	0x0DB4,	%o5
	movvs	%xcc,	%o7,	%l4
	edge16n	%l6,	%g1,	%o2
	movn	%icc,	%o1,	%i0
	srl	%i2,	0x00,	%g3
	or	%i1,	0x187B,	%l3
	ld	[%l7 + 0x3C],	%f10
	movn	%icc,	%o6,	%g5
	andncc	%g4,	%l1,	%g7
	movpos	%xcc,	%i6,	%i3
	fble,a	%fcc1,	loop_1301
loop_1301:
	fnot2	%f0,	%f2
	fbg	%fcc3,	loop_1302
loop_1302:
	and	%i7,	%g6,	%l0
	fmul8x16	%f5,	%f14,	%f6
	edge8l	%i5,	%i4,	%o4
	movleu	%xcc,	%o0,	%o3
	and	%l2,	%l5,	%g2
	ldsh	[%l7 + 0x60],	%o7
	array32	%o5,	%l4,	%g1
	mulx	%o2,	%l6,	%i0
	fzeros	%f7
	brgez,a	%i2,	loop_1303
loop_1303:
	movneg	%xcc,	%o1,	%g3
	or	%l3,	0x06FE,	%o6
	xor	%g5,	0x1372,	%g4
	fbuge,a	%fcc0,	loop_1304
loop_1304:
	std	%f2,	[%l7 + 0x40]
	mulx	%l1,	%g7,	%i1
	bneg	%xcc,	loop_1305
loop_1305:
	and	%i6,	0x02A4,	%i3
	stx	%i7,	[%l7 + 0x70]
	brz	%g6,	loop_1306
loop_1306:
	ba,a	%xcc,	loop_1307
loop_1307:
	srax	%i5,	0x02,	%l0
	fandnot2s	%f6,	%f0,	%f14
	ldsh	[%l7 + 0x70],	%o4
	addc	%i4,	0x03B2,	%o3
	bcc,a	%xcc,	loop_1308
loop_1308:
	fmul8ulx16	%f2,	%f10,	%f14
	stw	%l2,	[%l7 + 0x68]
	sra	%o0,	%g2,	%o7
	fmovse	%xcc,	%f14,	%f15
	movcc	%icc,	%o5,	%l4
	movleu	%xcc,	%l5,	%o2
	fands	%f10,	%f14,	%f1
	ldx	[%l7 + 0x50],	%l6
	bcs,a,pn	%xcc,	loop_1309
loop_1309:
	fnot2	%f8,	%f0
	te	%icc,	0x7
	sdiv	%i0,	0x085E,	%i2
	movrlz	%o1,	0x34C,	%g1
	edge16ln	%g3,	%o6,	%l3
	move	%xcc,	%g4,	%g5
	edge8ln	%g7,	%i1,	%l1
	nop
	setx loop_1310, %l0, %l1
	jmpl %l1, %i3
loop_1310:
	fmovsneg	%icc,	%f13,	%f11
	movle	%icc,	%i7,	%g6
	srax	%i5,	0x06,	%i6
	tsubcctv	%l0,	0x1C73,	%o4
	fmovspos	%icc,	%f15,	%f3
	taddcctv	%i4,	%l2,	%o3
	edge16n	%o0,	%o7,	%o5
	tpos	%icc,	0x1
	subccc	%l4,	0x0894,	%g2
	brgez,a	%o2,	loop_1311
loop_1311:
	lduh	[%l7 + 0x3C],	%l6
	movpos	%icc,	%i0,	%l5
	lduh	[%l7 + 0x7A],	%i2
	sub	%g1,	%g3,	%o6
	lduw	[%l7 + 0x1C],	%o1
	udivcc	%g4,	0x02E8,	%l3
	nop
	setx loop_1312, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1312:
	fbge	%fcc2,	loop_1313
loop_1313:
	stb	%g5,	[%l7 + 0x49]
	ldsh	[%l7 + 0x72],	%g7
	brgez,a	%i1,	loop_1314
loop_1314:
	edge8l	%l1,	%i7,	%i3
	udivcc	%i5,	0x1DCC,	%i6
	movg	%icc,	%g6,	%o4
	ldsw	[%l7 + 0x34],	%l0
	fmovrslz	%l2,	%f4,	%f11
	fbu,a	%fcc1,	loop_1315
loop_1315:
	tneg	%icc,	0x1
	tneg	%xcc,	0x1
	umul	%o3,	0x16E6,	%i4
	bvc,a,pt	%xcc,	loop_1316
loop_1316:
	movrgz	%o0,	0x068,	%o5
	and	%l4,	%o7,	%g2
	fand	%f6,	%f0,	%f8
	fblg	%fcc2,	loop_1317
loop_1317:
	subc	%o2,	%l6,	%l5
	edge16ln	%i0,	%i2,	%g3
	sdivcc	%o6,	0x077F,	%g1
	movle	%icc,	%o1,	%l3
	lduh	[%l7 + 0x30],	%g5
	movrlz	%g7,	0x3E6,	%i1
	orn	%l1,	0x1DF1,	%g4
	movleu	%icc,	%i3,	%i7
	ldsh	[%l7 + 0x34],	%i5
	fmovdl	%icc,	%f13,	%f10
	ldsb	[%l7 + 0x37],	%i6
	fmovscc	%icc,	%f6,	%f11
	udivcc	%o4,	0x099F,	%l0
	mulscc	%l2,	0x1F63,	%o3
	movrgz	%i4,	0x128,	%g6
	edge16l	%o0,	%o5,	%l4
	mulscc	%o7,	0x0B51,	%o2
	addcc	%l6,	0x05E9,	%g2
	fbne	%fcc0,	loop_1318
loop_1318:
	edge32	%i0,	%i2,	%g3
	umulcc	%o6,	0x0205,	%l5
	orcc	%o1,	%g1,	%l3
	lduh	[%l7 + 0x7C],	%g7
	tneg	%icc,	0x2
	fsrc1	%f12,	%f12
	fnands	%f14,	%f8,	%f1
	brgz	%g5,	loop_1319
loop_1319:
	fones	%f2
	tl	%xcc,	0x5
	edge16l	%i1,	%g4,	%i3
	movneg	%xcc,	%l1,	%i5
	movvc	%xcc,	%i7,	%i6
	tsubcc	%o4,	%l0,	%o3
	movrne	%l2,	0x1F0,	%i4
	tl	%icc,	0x2
	lduw	[%l7 + 0x40],	%g6
	fmovdvs	%icc,	%f3,	%f13
	addcc	%o0,	0x0D7B,	%l4
	fba,a	%fcc0,	loop_1320
loop_1320:
	fmovsg	%icc,	%f12,	%f3
	xnor	%o7,	%o2,	%l6
	fbuge	%fcc3,	loop_1321
loop_1321:
	st	%f9,	[%l7 + 0x20]
	brnz,a	%o5,	loop_1322
loop_1322:
	andcc	%g2,	0x0B0F,	%i2
	movvs	%icc,	%g3,	%o6
	smulcc	%l5,	0x0678,	%o1
	mulx	%g1,	0x1269,	%l3
	tl	%icc,	0x6
	edge8ln	%i0,	%g5,	%g7
	tsubcc	%i1,	0x16AC,	%i3
	addccc	%g4,	0x0F53,	%l1
	tpos	%icc,	0x3
	fbge,a	%fcc0,	loop_1323
loop_1323:
	lduh	[%l7 + 0x56],	%i7
	st	%f14,	[%l7 + 0x4C]
	xor	%i6,	%o4,	%i5
	tpos	%icc,	0x5
	fmovrsgez	%o3,	%f6,	%f10
	subc	%l0,	%i4,	%l2
	andncc	%g6,	%o0,	%l4
	edge16	%o7,	%l6,	%o5
	srlx	%g2,	0x00,	%o2
	srlx	%g3,	%i2,	%o6
	sllx	%o1,	%l5,	%l3
	movvs	%xcc,	%i0,	%g5
	movre	%g7,	%g1,	%i1
	movvc	%icc,	%g4,	%l1
	ldsb	[%l7 + 0x45],	%i3
	edge16	%i7,	%o4,	%i5
	fbu,a	%fcc1,	loop_1324
loop_1324:
	movrlz	%o3,	%i6,	%i4
	popc	0x0657,	%l0
	bvs,pt	%xcc,	loop_1325
loop_1325:
	bneg,a,pt	%icc,	loop_1326
loop_1326:
	movrgz	%l2,	0x27C,	%g6
	ta	%icc,	0x2
	fmovsleu	%xcc,	%f3,	%f9
	fmul8x16au	%f2,	%f14,	%f0
	movl	%icc,	%o0,	%o7
	brlz,a	%l4,	loop_1327
loop_1327:
	tsubcc	%o5,	%g2,	%o2
	andcc	%l6,	0x00E9,	%g3
	tleu	%icc,	0x7
	edge16n	%i2,	%o6,	%o1
	stb	%l3,	[%l7 + 0x6A]
	umul	%i0,	%g5,	%g7
	movneg	%xcc,	%l5,	%i1
	edge32n	%g1,	%g4,	%i3
	ldsw	[%l7 + 0x50],	%l1
	ba,pn	%xcc,	loop_1328
loop_1328:
	sdivcc	%o4,	0x18E0,	%i7
	tneg	%icc,	0x3
	movrgz	%i5,	%i6,	%o3
	movrgz	%l0,	0x1D2,	%i4
	tle	%icc,	0x1
	udiv	%l2,	0x18B9,	%g6
	ldsb	[%l7 + 0x44],	%o7
	fzero	%f4
	xnorcc	%o0,	0x1C46,	%l4
	tn	%icc,	0x3
	add	%o5,	%o2,	%l6
	fmovrdlez	%g3,	%f8,	%f2
	fblg	%fcc3,	loop_1329
loop_1329:
	fandnot1s	%f13,	%f10,	%f15
	movrne	%g2,	%i2,	%o6
	xnorcc	%o1,	%l3,	%i0
	fbn,a	%fcc1,	loop_1330
loop_1330:
	stb	%g7,	[%l7 + 0x40]
	subcc	%g5,	%l5,	%i1
	ld	[%l7 + 0x3C],	%f1
	edge32l	%g1,	%i3,	%l1
	tne	%xcc,	0x0
	xnor	%g4,	0x1CE1,	%i7
	bvc	loop_1331
loop_1331:
	fpsub16s	%f4,	%f8,	%f6
	sethi	0x0C98,	%o4
	tcc	%xcc,	0x5
	lduh	[%l7 + 0x18],	%i6
	movrlz	%i5,	%l0,	%i4
	orcc	%l2,	0x1E2E,	%g6
	subccc	%o3,	0x04B4,	%o7
	fbule	%fcc0,	loop_1332
loop_1332:
	movneg	%xcc,	%o0,	%l4
	fmovsa	%xcc,	%f10,	%f9
	fbe	%fcc1,	loop_1333
loop_1333:
	taddcctv	%o5,	%l6,	%o2
	edge8n	%g2,	%g3,	%i2
	movrgez	%o6,	0x277,	%o1
	movrlez	%i0,	%g7,	%g5
	andcc	%l5,	%l3,	%g1
	fabsd	%f12,	%f10
	fbge	%fcc3,	loop_1334
loop_1334:
	fmovrslz	%i3,	%f13,	%f13
	umul	%i1,	%l1,	%g4
	tpos	%xcc,	0x2
	fcmple32	%f4,	%f14,	%o4
	sdivx	%i6,	0x1095,	%i5
	xor	%l0,	%i4,	%i7
	fandnot2	%f2,	%f6,	%f2
	sethi	0x14C5,	%g6
	fble	%fcc1,	loop_1335
loop_1335:
	ld	[%l7 + 0x1C],	%f4
	tleu	%xcc,	0x3
	brlz	%l2,	loop_1336
loop_1336:
	tl	%xcc,	0x1
	and	%o7,	0x168B,	%o0
	fmovdvs	%icc,	%f3,	%f1
	or	%o3,	%l4,	%l6
	movl	%icc,	%o5,	%g2
	andcc	%g3,	0x0CDF,	%o2
	ldsh	[%l7 + 0x3C],	%o6
	alignaddr	%o1,	%i0,	%i2
	edge8	%g7,	%g5,	%l3
	fmovsn	%xcc,	%f2,	%f12
	bge	%xcc,	loop_1337
loop_1337:
	fnegd	%f0,	%f14
	ldx	[%l7 + 0x28],	%g1
	bneg,a,pn	%xcc,	loop_1338
loop_1338:
	bpos,a,pt	%icc,	loop_1339
loop_1339:
	fnegs	%f9,	%f3
	sdivx	%l5,	0x16AB,	%i3
	stw	%i1,	[%l7 + 0x68]
	fbl,a	%fcc0,	loop_1340
loop_1340:
	tcs	%xcc,	0x7
	orn	%g4,	0x0C5D,	%o4
	fbne,a	%fcc2,	loop_1341
loop_1341:
	smulcc	%i6,	0x1731,	%l1
	mulx	%i5,	0x03F8,	%i4
	fmovsleu	%xcc,	%f0,	%f9
	tl	%icc,	0x0
	umulcc	%l0,	%g6,	%i7
	fmovdle	%xcc,	%f6,	%f6
	movn	%icc,	%l2,	%o7
	fmovrsgez	%o3,	%f9,	%f1
	tcc	%xcc,	0x4
	mova	%xcc,	%o0,	%l4
	fbu,a	%fcc1,	loop_1342
loop_1342:
	movl	%xcc,	%l6,	%g2
	tgu	%xcc,	0x7
	edge32ln	%g3,	%o5,	%o2
	ldx	[%l7 + 0x18],	%o6
	bl	loop_1343
loop_1343:
	fornot1	%f2,	%f2,	%f12
	fmovsleu	%icc,	%f5,	%f3
	tneg	%icc,	0x1
	udiv	%o1,	0x1894,	%i2
	ld	[%l7 + 0x1C],	%f8
	sth	%i0,	[%l7 + 0x74]
	udiv	%g7,	0x03BF,	%l3
	lduw	[%l7 + 0x48],	%g5
	or	%g1,	%i3,	%i1
	tge	%xcc,	0x6
	lduh	[%l7 + 0x72],	%l5
	alignaddrl	%g4,	%i6,	%o4
	movrne	%l1,	0x0BB,	%i5
	brgez,a	%l0,	loop_1344
loop_1344:
	edge32l	%g6,	%i4,	%l2
	edge16n	%o7,	%i7,	%o3
	mova	%icc,	%l4,	%l6
	mulscc	%g2,	%g3,	%o0
	srlx	%o2,	%o6,	%o1
	movn	%xcc,	%o5,	%i2
	ldd	[%l7 + 0x78],	%f6
	subc	%i0,	0x15B3,	%l3
	fcmpgt16	%f6,	%f14,	%g5
	edge16	%g7,	%i3,	%g1
	fmul8x16	%f6,	%f14,	%f8
	fmovsl	%xcc,	%f9,	%f13
	movre	%i1,	%l5,	%i6
	xorcc	%o4,	%g4,	%l1
	bneg,pn	%icc,	loop_1345
loop_1345:
	sub	%i5,	%l0,	%i4
	tsubcc	%l2,	%g6,	%o7
	fnegs	%f5,	%f3
	movrgez	%i7,	%o3,	%l4
	mulscc	%g2,	%l6,	%o0
	movneg	%xcc,	%o2,	%o6
	xorcc	%g3,	%o5,	%i2
	ldd	[%l7 + 0x28],	%f10
	srlx	%i0,	0x1A,	%l3
	tcs	%icc,	0x3
	movrne	%o1,	%g7,	%g5
	alignaddr	%g1,	%i3,	%l5
	fmovdgu	%xcc,	%f4,	%f15
	ldub	[%l7 + 0x1F],	%i1
	movn	%xcc,	%i6,	%g4
	movrlz	%l1,	0x196,	%o4
	fmovrse	%l0,	%f11,	%f3
	bleu	%xcc,	loop_1346
loop_1346:
	edge32ln	%i4,	%i5,	%l2
	fbe,a	%fcc3,	loop_1347
loop_1347:
	movle	%xcc,	%o7,	%g6
	subcc	%i7,	0x0F20,	%l4
	popc	0x0EA4,	%g2
	lduh	[%l7 + 0x6C],	%o3
	edge32l	%l6,	%o2,	%o0
	addcc	%g3,	0x003F,	%o6
	ldx	[%l7 + 0x48],	%i2
	movneg	%xcc,	%o5,	%l3
	array16	%o1,	%g7,	%i0
	orncc	%g1,	0x1F87,	%i3
	movre	%g5,	%i1,	%l5
	lduh	[%l7 + 0x1C],	%i6
	subc	%g4,	%l1,	%o4
	tcc	%xcc,	0x0
	std	%f8,	[%l7 + 0x08]
	ldx	[%l7 + 0x78],	%i4
	ldd	[%l7 + 0x10],	%f0
	fand	%f12,	%f4,	%f12
	movcs	%xcc,	%l0,	%i5
	fmovsgu	%icc,	%f10,	%f14
	orcc	%l2,	0x13CF,	%g6
	tsubcctv	%i7,	0x1438,	%o7
	bvs,a,pt	%icc,	loop_1348
loop_1348:
	tg	%icc,	0x1
	mulx	%g2,	0x05D3,	%o3
	and	%l6,	%o2,	%l4
	ta	%xcc,	0x5
	fpsub32s	%f7,	%f0,	%f12
	subc	%o0,	%o6,	%g3
	movrne	%o5,	0x1AB,	%l3
	bvs,pn	%icc,	loop_1349
loop_1349:
	subccc	%o1,	%i2,	%g7
	fornot1s	%f5,	%f4,	%f12
	subccc	%g1,	%i3,	%i0
	tcs	%xcc,	0x4
	subc	%i1,	%g5,	%l5
	udivx	%g4,	0x1783,	%i6
	brlz,a	%l1,	loop_1350
loop_1350:
	movre	%o4,	%l0,	%i4
	andncc	%l2,	%g6,	%i7
	tneg	%xcc,	0x3
	smulcc	%i5,	%o7,	%o3
	edge16n	%g2,	%l6,	%o2
	sra	%o0,	%l4,	%o6
	bleu,a	%icc,	loop_1351
loop_1351:
	fcmpgt16	%f12,	%f14,	%o5
	fmovdgu	%icc,	%f14,	%f13
	fpsub16s	%f8,	%f5,	%f10
	ta	%xcc,	0x6
	fmovrse	%g3,	%f11,	%f1
	andncc	%o1,	%l3,	%g7
	tgu	%icc,	0x2
	fnegs	%f0,	%f7
	movg	%xcc,	%g1,	%i3
	edge8ln	%i2,	%i1,	%i0
	sdivx	%g5,	0x0816,	%l5
	addccc	%i6,	0x05A1,	%l1
	brz,a	%g4,	loop_1352
loop_1352:
	movre	%o4,	%l0,	%l2
	fcmpgt32	%f0,	%f14,	%g6
	tne	%xcc,	0x0
	ld	[%l7 + 0x44],	%f5
	fcmped	%fcc3,	%f0,	%f2
	ldx	[%l7 + 0x70],	%i4
	fsrc1s	%f11,	%f5
	or	%i5,	%i7,	%o3
	ldx	[%l7 + 0x70],	%g2
	subc	%o7,	0x1EF8,	%l6
	edge8l	%o0,	%l4,	%o6
	stb	%o2,	[%l7 + 0x08]
	bpos	loop_1353
loop_1353:
	fcmpeq16	%f0,	%f12,	%o5
	movneg	%icc,	%o1,	%l3
	ba,a,pt	%icc,	loop_1354
loop_1354:
	fpack32	%f14,	%f10,	%f4
	lduw	[%l7 + 0x30],	%g3
	movge	%icc,	%g1,	%g7
	sra	%i2,	%i3,	%i1
	fsrc1	%f6,	%f0
	edge8n	%g5,	%i0,	%i6
	tleu	%icc,	0x4
	edge16ln	%l5,	%l1,	%g4
	umul	%l0,	%l2,	%o4
	te	%icc,	0x4
	call	loop_1355
loop_1355:
	brnz	%i4,	loop_1356
loop_1356:
	edge8	%g6,	%i5,	%o3
	edge16n	%i7,	%g2,	%o7
	xnorcc	%o0,	0x1373,	%l6
	alignaddrl	%l4,	%o6,	%o5
	movpos	%icc,	%o1,	%o2
	movrgez	%l3,	%g1,	%g7
	stx	%g3,	[%l7 + 0x70]
	andncc	%i3,	%i1,	%g5
	tsubcc	%i0,	%i6,	%l5
	ldsw	[%l7 + 0x30],	%l1
	bleu,a	loop_1357
loop_1357:
	movrne	%g4,	%l0,	%l2
	add	%i2,	%o4,	%i4
	movvs	%xcc,	%g6,	%i5
	fmovrdlz	%i7,	%f12,	%f8
	andncc	%g2,	%o3,	%o7
	te	%xcc,	0x2
	sdivx	%l6,	0x1CD7,	%l4
	tn	%xcc,	0x1
	bcc,a	loop_1358
loop_1358:
	fmovsg	%icc,	%f14,	%f5
	subc	%o0,	%o6,	%o5
	lduh	[%l7 + 0x26],	%o1
	siam	0x4
	bne,a	%xcc,	loop_1359
loop_1359:
	array8	%o2,	%g1,	%l3
	fba	%fcc3,	loop_1360
loop_1360:
	array32	%g7,	%g3,	%i1
	std	%f0,	[%l7 + 0x10]
	fcmpd	%fcc1,	%f2,	%f12
	movrgez	%g5,	0x398,	%i0
	fandnot1	%f2,	%f12,	%f8
	fnors	%f7,	%f9,	%f2
	movcs	%xcc,	%i6,	%i3
	movrgez	%l1,	0x33B,	%g4
	brz	%l0,	loop_1361
loop_1361:
	fmovdg	%icc,	%f10,	%f9
	ldsh	[%l7 + 0x72],	%l5
	call	loop_1362
loop_1362:
	sub	%l2,	0x136D,	%o4
	ldsw	[%l7 + 0x50],	%i4
	mulscc	%g6,	%i2,	%i7
	movvc	%xcc,	%g2,	%o3
	bleu,pn	%icc,	loop_1363
loop_1363:
	st	%f1,	[%l7 + 0x1C]
	edge16l	%o7,	%l6,	%i5
	ldd	[%l7 + 0x10],	%f6
	fbn	%fcc3,	loop_1364
loop_1364:
	xorcc	%o0,	0x0B00,	%l4
	movn	%xcc,	%o5,	%o1
	movleu	%xcc,	%o6,	%g1
	subc	%l3,	%o2,	%g7
	fornot1	%f14,	%f0,	%f4
	fmovsneg	%xcc,	%f2,	%f13
	ldub	[%l7 + 0x12],	%g3
	orncc	%i1,	0x153C,	%i0
	andncc	%i6,	%i3,	%g5
	bg	loop_1365
loop_1365:
	ldsw	[%l7 + 0x58],	%g4
	add	%l0,	%l5,	%l1
	fbo,a	%fcc2,	loop_1366
loop_1366:
	movcc	%xcc,	%o4,	%l2
	mova	%icc,	%i4,	%i2
	tne	%xcc,	0x7
	fbge,a	%fcc2,	loop_1367
loop_1367:
	or	%i7,	%g2,	%o3
	movrne	%o7,	0x14A,	%l6
	movpos	%icc,	%i5,	%g6
	sra	%o0,	%l4,	%o5
	edge8n	%o6,	%o1,	%l3
	brlz,a	%g1,	loop_1368
loop_1368:
	tcs	%xcc,	0x6
	fpadd32	%f8,	%f2,	%f10
	te	%xcc,	0x7
	mova	%xcc,	%o2,	%g3
	movrlz	%g7,	%i0,	%i1
	xnorcc	%i3,	0x14D4,	%i6
	movvs	%xcc,	%g5,	%g4
	fmovsneg	%xcc,	%f9,	%f11
	fmovdleu	%xcc,	%f13,	%f8
	ldub	[%l7 + 0x32],	%l0
	sdiv	%l5,	0x02FD,	%l1
	sdivcc	%l2,	0x0991,	%i4
	stw	%o4,	[%l7 + 0x14]
	fands	%f2,	%f4,	%f2
	tge	%icc,	0x5
	sllx	%i2,	0x1A,	%g2
	fmovrdgez	%i7,	%f12,	%f10
	fmovdvs	%xcc,	%f3,	%f0
	fmovdg	%icc,	%f12,	%f12
	edge8ln	%o7,	%o3,	%i5
	edge8n	%g6,	%l6,	%l4
	move	%xcc,	%o5,	%o0
	taddcctv	%o6,	%o1,	%g1
	tsubcctv	%l3,	0x1461,	%g3
	fbe	%fcc0,	loop_1369
loop_1369:
	stb	%o2,	[%l7 + 0x4A]
	tne	%xcc,	0x4
	bcs,a,pn	%icc,	loop_1370
loop_1370:
	fcmpeq16	%f4,	%f14,	%i0
	fmovdcs	%xcc,	%f14,	%f6
	mulscc	%i1,	%i3,	%g7
	ldd	[%l7 + 0x20],	%f0
	fmovsa	%icc,	%f0,	%f1
	stx	%i6,	[%l7 + 0x20]
	and	%g5,	%g4,	%l0
	ld	[%l7 + 0x68],	%f1
	fbule	%fcc0,	loop_1371
loop_1371:
	andcc	%l1,	%l2,	%i4
	udiv	%l5,	0x1F02,	%i2
	brz,a	%g2,	loop_1372
loop_1372:
	alignaddr	%o4,	%o7,	%o3
	subccc	%i7,	0x0B8F,	%i5
	call	loop_1373
loop_1373:
	ble,a	%xcc,	loop_1374
loop_1374:
	edge16ln	%l6,	%l4,	%g6
	movneg	%xcc,	%o5,	%o0
	stx	%o6,	[%l7 + 0x38]
	te	%icc,	0x3
	fmul8x16au	%f15,	%f4,	%f0
	ldub	[%l7 + 0x5F],	%o1
	stx	%g1,	[%l7 + 0x58]
	movne	%xcc,	%l3,	%o2
	movpos	%icc,	%g3,	%i0
	umul	%i3,	%g7,	%i6
	edge8	%i1,	%g4,	%l0
	movne	%xcc,	%l1,	%l2
	sdivx	%i4,	0x0C1E,	%l5
	fbule	%fcc2,	loop_1375
loop_1375:
	fmovsn	%xcc,	%f15,	%f12
	stb	%i2,	[%l7 + 0x0F]
	fmovrsgez	%g5,	%f2,	%f13
	fmovrslez	%o4,	%f12,	%f15
	movrlez	%g2,	0x204,	%o7
	tcs	%xcc,	0x7
	movgu	%icc,	%i7,	%i5
	fandnot2s	%f4,	%f11,	%f2
	movvs	%xcc,	%l6,	%o3
	tle	%icc,	0x0
	fmovd	%f8,	%f14
	fble,a	%fcc0,	loop_1376
loop_1376:
	movge	%xcc,	%l4,	%g6
	ta	%xcc,	0x7
	and	%o5,	0x02A8,	%o0
	edge32n	%o6,	%o1,	%l3
	bvs,a,pt	%icc,	loop_1377
loop_1377:
	fzero	%f12
	subcc	%g1,	0x1EC3,	%g3
	sethi	0x1625,	%i0
	udiv	%i3,	0x0969,	%o2
	tg	%xcc,	0x6
	sdiv	%g7,	0x0AA3,	%i1
	mulx	%i6,	0x0649,	%l0
	edge32	%l1,	%g4,	%i4
	movle	%icc,	%l5,	%l2
	ble,a,pn	%icc,	loop_1378
loop_1378:
	edge8n	%i2,	%o4,	%g5
	be	%icc,	loop_1379
loop_1379:
	movle	%icc,	%o7,	%i7
	edge16	%i5,	%g2,	%o3
	smulcc	%l4,	%g6,	%o5
	tvs	%xcc,	0x7
	fbne,a	%fcc2,	loop_1380
loop_1380:
	tgu	%icc,	0x6
	srax	%l6,	%o6,	%o0
	movvs	%xcc,	%l3,	%o1
	tgu	%icc,	0x7
	movn	%icc,	%g3,	%i0
	movleu	%icc,	%g1,	%i3
	tsubcctv	%g7,	%o2,	%i6
	fpadd32	%f6,	%f6,	%f2
	ldd	[%l7 + 0x78],	%f0
	movre	%i1,	0x05F,	%l1
	srlx	%l0,	%g4,	%i4
	edge16l	%l5,	%i2,	%o4
	fmovrdne	%l2,	%f4,	%f0
	brlz	%g5,	loop_1381
loop_1381:
	stb	%i7,	[%l7 + 0x3B]
	tgu	%icc,	0x2
	tn	%icc,	0x1
	lduh	[%l7 + 0x1E],	%o7
	srl	%i5,	%g2,	%o3
	fnand	%f2,	%f10,	%f12
	tvc	%xcc,	0x7
	fandnot1s	%f9,	%f14,	%f3
	fnegs	%f5,	%f2
	tle	%xcc,	0x0
	edge32n	%l4,	%o5,	%l6
	fbul	%fcc2,	loop_1382
loop_1382:
	brgz,a	%o6,	loop_1383
loop_1383:
	move	%icc,	%o0,	%g6
	fmovspos	%icc,	%f3,	%f9
	xor	%l3,	%o1,	%g3
	fxors	%f13,	%f0,	%f1
	edge8n	%i0,	%g1,	%g7
	movcs	%icc,	%o2,	%i6
	fpadd16	%f12,	%f8,	%f12
	fbe	%fcc2,	loop_1384
loop_1384:
	tl	%xcc,	0x2
	orcc	%i3,	0x1DAE,	%i1
	fmovsn	%xcc,	%f4,	%f8
	movrlez	%l1,	0x1E8,	%l0
	add	%g4,	0x19DF,	%l5
	movrgz	%i2,	0x3E8,	%i4
	orncc	%o4,	0x1E65,	%g5
	movvc	%icc,	%i7,	%o7
	taddcctv	%i5,	0x13CE,	%g2
	tg	%xcc,	0x1
	fmovdleu	%xcc,	%f0,	%f5
	udivcc	%l2,	0x1504,	%l4
	orn	%o5,	%l6,	%o3
	movre	%o6,	0x00A,	%o0
	movrgez	%g6,	0x235,	%o1
	stx	%g3,	[%l7 + 0x30]
	subc	%l3,	%i0,	%g7
	tcs	%xcc,	0x0
	addcc	%o2,	%i6,	%g1
	tvc	%icc,	0x2
	movrlez	%i3,	%l1,	%l0
	movleu	%icc,	%i1,	%l5
	fzero	%f4
	fmovd	%f2,	%f2
	fbg,a	%fcc1,	loop_1385
loop_1385:
	bpos,a	loop_1386
loop_1386:
	lduw	[%l7 + 0x1C],	%g4
	movgu	%xcc,	%i2,	%i4
	tvs	%icc,	0x7
	subc	%o4,	0x1CCD,	%g5
	ta	%icc,	0x3
	taddcc	%o7,	%i5,	%i7
	movne	%icc,	%g2,	%l4
	xnor	%l2,	%o5,	%o3
	udivcc	%l6,	0x1C2F,	%o0
	array32	%o6,	%o1,	%g6
	stb	%l3,	[%l7 + 0x77]
	orcc	%i0,	%g3,	%o2
	edge32l	%g7,	%i6,	%g1
	sra	%i3,	0x1C,	%l1
	movn	%icc,	%i1,	%l0
	edge8l	%g4,	%i2,	%l5
	fsrc1s	%f15,	%f9
	movgu	%icc,	%o4,	%i4
	fbug,a	%fcc2,	loop_1387
loop_1387:
	popc	%g5,	%i5
	movrne	%o7,	%i7,	%l4
	ldsw	[%l7 + 0x48],	%g2
	movrlz	%o5,	%o3,	%l2
	bneg	%xcc,	loop_1388
loop_1388:
	fbl	%fcc3,	loop_1389
loop_1389:
	brlez	%o0,	loop_1390
loop_1390:
	array32	%l6,	%o1,	%o6
	fmul8sux16	%f6,	%f10,	%f0
	fbug	%fcc3,	loop_1391
loop_1391:
	fbul	%fcc0,	loop_1392
loop_1392:
	tvc	%icc,	0x3
	subcc	%g6,	0x1545,	%i0
	taddcctv	%l3,	%g3,	%g7
	movl	%icc,	%i6,	%o2
	bne,pt	%xcc,	loop_1393
loop_1393:
	taddcctv	%i3,	0x11DC,	%l1
	sdiv	%g1,	0x0B85,	%i1
	or	%l0,	0x02BF,	%i2
	te	%xcc,	0x1
	srlx	%g4,	0x0D,	%o4
	udiv	%l5,	0x1B22,	%g5
	movgu	%xcc,	%i5,	%i4
	movpos	%icc,	%i7,	%o7
	fornot1s	%f9,	%f12,	%f2
	fbu	%fcc3,	loop_1394
loop_1394:
	edge16n	%g2,	%o5,	%o3
	ldx	[%l7 + 0x38],	%l2
	tgu	%xcc,	0x1
	ta	%icc,	0x1
	xnorcc	%o0,	0x1EC6,	%l4
	fble,a	%fcc3,	loop_1395
loop_1395:
	edge8n	%l6,	%o6,	%g6
	orcc	%o1,	0x0B9E,	%l3
	addc	%g3,	%g7,	%i0
	tle	%icc,	0x0
	mulscc	%i6,	%i3,	%o2
	bgu	loop_1396
loop_1396:
	ble,a,pt	%xcc,	loop_1397
loop_1397:
	alignaddr	%g1,	%i1,	%l0
	edge8ln	%l1,	%g4,	%i2
	fpsub32	%f4,	%f12,	%f14
	tvs	%icc,	0x6
	udivx	%l5,	0x10BC,	%g5
	tleu	%icc,	0x6
	fble,a	%fcc0,	loop_1398
loop_1398:
	sllx	%o4,	%i5,	%i4
	ldsb	[%l7 + 0x34],	%i7
	lduw	[%l7 + 0x74],	%o7
	lduw	[%l7 + 0x60],	%g2
	movrne	%o5,	%l2,	%o0
	fnegs	%f15,	%f7
	move	%xcc,	%o3,	%l6
	ldsw	[%l7 + 0x78],	%l4
	fmovrdgez	%o6,	%f10,	%f4
	or	%g6,	%l3,	%o1
	edge8l	%g7,	%i0,	%g3
	movpos	%xcc,	%i6,	%o2
	brlz,a	%g1,	loop_1399
loop_1399:
	add	%i1,	%i3,	%l1
	sllx	%l0,	%g4,	%l5
	stw	%i2,	[%l7 + 0x18]
	fmovdle	%xcc,	%f12,	%f5
	fmovdvs	%icc,	%f0,	%f0
	andncc	%g5,	%o4,	%i5
	movvc	%icc,	%i7,	%i4
	movg	%icc,	%o7,	%g2
	fpsub16s	%f6,	%f0,	%f13
	edge32	%l2,	%o0,	%o5
	add	%o3,	%l4,	%l6
	orn	%g6,	0x1485,	%o6
	movrgz	%l3,	%g7,	%i0
	sub	%g3,	%o1,	%o2
	edge32	%i6,	%i1,	%i3
	edge8l	%g1,	%l0,	%g4
	smulcc	%l1,	%l5,	%i2
	srl	%o4,	%g5,	%i7
	ldx	[%l7 + 0x70],	%i5
	edge16l	%o7,	%i4,	%g2
	tleu	%xcc,	0x6
	fmovsge	%icc,	%f12,	%f13
	orcc	%l2,	0x1778,	%o0
	orcc	%o3,	%l4,	%o5
	fbl	%fcc1,	loop_1400
loop_1400:
	fmovrdlez	%l6,	%f10,	%f10
	fbug	%fcc3,	loop_1401
loop_1401:
	stb	%g6,	[%l7 + 0x30]
	fcmpgt32	%f12,	%f2,	%l3
	edge32n	%g7,	%o6,	%g3
	te	%icc,	0x3
	fmuld8sux16	%f14,	%f2,	%f2
	sth	%i0,	[%l7 + 0x16]
	taddcctv	%o2,	0x06F6,	%i6
	ld	[%l7 + 0x24],	%f2
	stx	%o1,	[%l7 + 0x70]
	movvc	%xcc,	%i3,	%i1
	movl	%xcc,	%g1,	%l0
	fmovrsgz	%l1,	%f12,	%f2
	tcs	%xcc,	0x3
	fmovscc	%icc,	%f7,	%f9
	tleu	%icc,	0x0
	tvs	%xcc,	0x5
	lduw	[%l7 + 0x54],	%g4
	fmovsle	%xcc,	%f7,	%f2
	srlx	%l5,	0x04,	%i2
	tsubcc	%g5,	%i7,	%i5
	fzero	%f6
	fmovsa	%xcc,	%f9,	%f14
	smul	%o4,	%i4,	%o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type f   	: 163
!	Type cti   	: 135
!	Type i   	: 582
!	Type l   	: 120
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
main_t6:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0x0,	%g2
	set	0xD,	%g3
	set	0xD,	%g4
	set	0xC,	%g5
	set	0x9,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xF,	%i1
	set	-0x3,	%i2
	set	-0x9,	%i3
	set	-0xB,	%i4
	set	-0x3,	%i5
	set	-0x9,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x36EAB56B,	%l0
	set	0x53DCB4E2,	%l1
	set	0x6DE41F12,	%l2
	set	0x0F55D0AE,	%l3
	set	0x6D99D254,	%l4
	set	0x79D97BB1,	%l5
	set	0x4E548EFE,	%l6
	!# Output registers
	set	-0x0604,	%o0
	set	-0x09E7,	%o1
	set	-0x1538,	%o2
	set	0x0F08,	%o3
	set	0x19DF,	%o4
	set	0x19E8,	%o5
	set	-0x08FB,	%o6
	set	-0x1A69,	%o7

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

	stx	%g2,	[%l7 + 0x58]
	movg	%icc,	%l2,	%o0
	ld	[%l7 + 0x70],	%f8
	stb	%l4,	[%l7 + 0x6C]
	ldd	[%l7 + 0x50],	%f0
	lduw	[%l7 + 0x28],	%o5
	fbg,a	%fcc0,	loop_1402
loop_1402:
	lduh	[%l7 + 0x2C],	%o3
	stb	%g6,	[%l7 + 0x64]
	ldx	[%l7 + 0x08],	%l6
	ld	[%l7 + 0x60],	%f15
	edge16	%g7,	%l3,	%o6
	stw	%g3,	[%l7 + 0x18]
	array8	%o2,	%i0,	%o1
	fnot1s	%f5,	%f5
	movl	%xcc,	%i6,	%i3
	fpsub16	%f12,	%f2,	%f12
	stx	%i1,	[%l7 + 0x68]
	bl	loop_1403
loop_1403:
	tvc	%icc,	0x6
	fbge,a	%fcc0,	loop_1404
loop_1404:
	ldsw	[%l7 + 0x50],	%l0
	sth	%g1,	[%l7 + 0x7A]
	fbge	%fcc2,	loop_1405
loop_1405:
	tcc	%icc,	0x7
	sth	%g4,	[%l7 + 0x1A]
	stx	%l1,	[%l7 + 0x78]
	orcc	%i2,	%g5,	%i7
	fcmps	%fcc2,	%f6,	%f13
	ld	[%l7 + 0x74],	%f6
	ldd	[%l7 + 0x58],	%f0
	stb	%i5,	[%l7 + 0x57]
	sdivx	%l5,	0x18D8,	%o4
	fsrc2s	%f7,	%f1
	fone	%f2
	fexpand	%f7,	%f0
	lduh	[%l7 + 0x7C],	%i4
	edge16l	%g2,	%o7,	%o0
	stw	%l2,	[%l7 + 0x64]
	xnor	%l4,	%o3,	%o5
	fabsd	%f2,	%f4
	fmovsg	%xcc,	%f9,	%f12
	sth	%g6,	[%l7 + 0x6E]
	fmovrdgez	%l6,	%f0,	%f10
	stb	%l3,	[%l7 + 0x2D]
	stx	%g7,	[%l7 + 0x68]
	ldsw	[%l7 + 0x2C],	%o6
	tg	%icc,	0x0
	ldsh	[%l7 + 0x76],	%o2
	add	%g3,	%i0,	%o1
	ldub	[%l7 + 0x0C],	%i3
	popc	0x17CC,	%i1
	ldsb	[%l7 + 0x38],	%i6
	ldd	[%l7 + 0x08],	%f0
	taddcctv	%l0,	%g1,	%g4
	ldd	[%l7 + 0x48],	%f12
	ldub	[%l7 + 0x6C],	%i2
	lduw	[%l7 + 0x1C],	%l1
	ldsw	[%l7 + 0x3C],	%i7
	srlx	%g5,	%i5,	%l5
	ldub	[%l7 + 0x2B],	%o4
	alignaddrl	%i4,	%o7,	%o0
	fandnot1	%f2,	%f6,	%f0
	tcc	%xcc,	0x0
	tn	%xcc,	0x5
	ldsb	[%l7 + 0x54],	%g2
	ldsw	[%l7 + 0x1C],	%l4
	fbn	%fcc3,	loop_1406
loop_1406:
	fornot2	%f8,	%f6,	%f12
	alignaddr	%l2,	%o3,	%g6
	lduh	[%l7 + 0x5C],	%o5
	ldsh	[%l7 + 0x5A],	%l3
	movrlz	%l6,	%o6,	%g7
	movge	%icc,	%g3,	%o2
	stb	%o1,	[%l7 + 0x6D]
	stx	%i0,	[%l7 + 0x50]
	ldsb	[%l7 + 0x68],	%i3
	alignaddrl	%i6,	%l0,	%g1
	alignaddrl	%g4,	%i1,	%l1
	ldub	[%l7 + 0x1E],	%i7
	std	%f4,	[%l7 + 0x10]
	st	%f10,	[%l7 + 0x1C]
	tleu	%xcc,	0x3
	tl	%xcc,	0x4
	std	%f2,	[%l7 + 0x68]
	ldx	[%l7 + 0x38],	%i2
	ble,a,pt	%xcc,	loop_1407
loop_1407:
	tsubcctv	%g5,	%l5,	%i5
	ldsb	[%l7 + 0x52],	%i4
	lduw	[%l7 + 0x78],	%o7
	fnegd	%f6,	%f4
	movvc	%xcc,	%o4,	%o0
	orncc	%l4,	0x1F9F,	%l2
	stb	%o3,	[%l7 + 0x67]
	stb	%g2,	[%l7 + 0x43]
	xnor	%g6,	%l3,	%o5
	ldub	[%l7 + 0x39],	%l6
	sra	%g7,	%g3,	%o6
	andn	%o1,	0x1D02,	%o2
	for	%f0,	%f14,	%f10
	add	%i0,	%i6,	%l0
	array8	%i3,	%g4,	%g1
	stw	%i1,	[%l7 + 0x10]
	lduh	[%l7 + 0x2E],	%l1
	fmovsleu	%icc,	%f2,	%f14
	ldsh	[%l7 + 0x0A],	%i2
	stw	%g5,	[%l7 + 0x0C]
	nop
	setx loop_1408, %l0, %l1
	jmpl %l1, %l5
loop_1408:
	brlz,a	%i7,	loop_1409
loop_1409:
	fmovsvs	%icc,	%f7,	%f13
	fmovdvc	%icc,	%f11,	%f10
	lduw	[%l7 + 0x6C],	%i5
	ld	[%l7 + 0x44],	%f6
	mulx	%o7,	0x1164,	%i4
	ldsb	[%l7 + 0x4E],	%o4
	array8	%l4,	%l2,	%o0
	lduh	[%l7 + 0x1A],	%g2
	stb	%o3,	[%l7 + 0x09]
	udivx	%l3,	0x0B43,	%g6
	fbu,a	%fcc3,	loop_1410
loop_1410:
	lduh	[%l7 + 0x66],	%l6
	stw	%g7,	[%l7 + 0x30]
	movge	%icc,	%o5,	%g3
	ld	[%l7 + 0x48],	%f13
	movrlez	%o6,	%o1,	%o2
	tsubcc	%i0,	%l0,	%i3
	edge32l	%g4,	%g1,	%i6
	stw	%i1,	[%l7 + 0x0C]
	popc	%i2,	%l1
	movvs	%icc,	%l5,	%g5
	ldd	[%l7 + 0x40],	%f14
	ldsb	[%l7 + 0x41],	%i7
	alignaddrl	%o7,	%i4,	%o4
	movrgz	%l4,	%i5,	%o0
	stb	%l2,	[%l7 + 0x5B]
	srax	%o3,	%l3,	%g6
	movn	%icc,	%g2,	%g7
	sth	%o5,	[%l7 + 0x66]
	tn	%icc,	0x2
	stw	%l6,	[%l7 + 0x50]
	tcc	%xcc,	0x5
	ldd	[%l7 + 0x28],	%f12
	ldd	[%l7 + 0x30],	%f14
	udiv	%g3,	0x0D59,	%o6
	bshuffle	%f12,	%f6,	%f4
	fbu	%fcc2,	loop_1411
loop_1411:
	movge	%icc,	%o2,	%i0
	ld	[%l7 + 0x1C],	%f15
	brlez,a	%o1,	loop_1412
loop_1412:
	ldsh	[%l7 + 0x1A],	%i3
	stx	%g4,	[%l7 + 0x78]
	pdist	%f14,	%f10,	%f14
	te	%xcc,	0x5
	xnor	%g1,	0x02A8,	%l0
	ldsb	[%l7 + 0x11],	%i6
	sra	%i1,	%i2,	%l5
	sdiv	%g5,	0x1E71,	%l1
	ldsb	[%l7 + 0x72],	%i7
	ldd	[%l7 + 0x58],	%f14
	nop
	setx loop_1413, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1413:
	ld	[%l7 + 0x10],	%f3
	srlx	%o7,	%i4,	%o4
	fnands	%f3,	%f2,	%f11
	ldx	[%l7 + 0x48],	%l4
	ldd	[%l7 + 0x38],	%f8
	ta	%icc,	0x6
	array32	%o0,	%l2,	%i5
	udivx	%o3,	0x153B,	%g6
	addccc	%l3,	%g7,	%g2
	tle	%icc,	0x5
	ldsw	[%l7 + 0x08],	%l6
	sth	%g3,	[%l7 + 0x4E]
	ldsw	[%l7 + 0x3C],	%o5
	sth	%o2,	[%l7 + 0x62]
	sethi	0x13CE,	%i0
	ldub	[%l7 + 0x1C],	%o6
	fcmpgt16	%f14,	%f10,	%i3
	stw	%g4,	[%l7 + 0x18]
	fpsub16	%f14,	%f4,	%f12
	ldsb	[%l7 + 0x1F],	%o1
	ldx	[%l7 + 0x68],	%g1
	lduw	[%l7 + 0x60],	%i6
	ldd	[%l7 + 0x78],	%f8
	fnot1s	%f7,	%f1
	ldx	[%l7 + 0x70],	%l0
	brgz,a	%i1,	loop_1414
loop_1414:
	lduh	[%l7 + 0x56],	%i2
	mova	%xcc,	%g5,	%l1
	movne	%icc,	%l5,	%o7
	stw	%i4,	[%l7 + 0x54]
	stx	%i7,	[%l7 + 0x40]
	ldsb	[%l7 + 0x0B],	%l4
	edge8n	%o0,	%l2,	%i5
	ldsb	[%l7 + 0x18],	%o4
	lduh	[%l7 + 0x56],	%g6
	stw	%o3,	[%l7 + 0x34]
	edge32	%l3,	%g7,	%l6
	ld	[%l7 + 0x34],	%f15
	st	%f5,	[%l7 + 0x4C]
	taddcctv	%g2,	0x1AA3,	%g3
	fmovsgu	%icc,	%f5,	%f5
	ldd	[%l7 + 0x20],	%f10
	edge32	%o2,	%o5,	%o6
	srl	%i3,	%i0,	%g4
	stb	%o1,	[%l7 + 0x0F]
	ldx	[%l7 + 0x08],	%i6
	stw	%l0,	[%l7 + 0x10]
	ldd	[%l7 + 0x48],	%f0
	ldsw	[%l7 + 0x78],	%i1
	stb	%g1,	[%l7 + 0x7C]
	ld	[%l7 + 0x18],	%f14
	tcs	%icc,	0x5
	lduw	[%l7 + 0x44],	%g5
	sth	%i2,	[%l7 + 0x3A]
	fbge,a	%fcc0,	loop_1415
loop_1415:
	fcmpgt32	%f10,	%f0,	%l5
	subccc	%o7,	%i4,	%i7
	stb	%l4,	[%l7 + 0x33]
	ldd	[%l7 + 0x78],	%f12
	fmovsleu	%icc,	%f12,	%f11
	fcmple32	%f0,	%f6,	%l1
	fmovrdgz	%l2,	%f8,	%f10
	ldsw	[%l7 + 0x10],	%o0
	sdivx	%o4,	0x0B1D,	%i5
	ld	[%l7 + 0x68],	%f9
	sdivcc	%o3,	0x0B62,	%l3
	ldx	[%l7 + 0x10],	%g6
	ldsb	[%l7 + 0x13],	%l6
	stw	%g7,	[%l7 + 0x70]
	fmovscs	%icc,	%f14,	%f14
	udivcc	%g3,	0x16F0,	%g2
	bvc	loop_1416
loop_1416:
	ldsb	[%l7 + 0x4D],	%o2
	fmovdge	%icc,	%f11,	%f7
	std	%f14,	[%l7 + 0x08]
	array32	%o5,	%i3,	%i0
	fbule	%fcc1,	loop_1417
loop_1417:
	tvs	%icc,	0x5
	fcmple16	%f12,	%f2,	%g4
	lduw	[%l7 + 0x5C],	%o1
	st	%f11,	[%l7 + 0x64]
	fmovsg	%icc,	%f6,	%f6
	lduh	[%l7 + 0x24],	%i6
	movvs	%icc,	%l0,	%o6
	ld	[%l7 + 0x40],	%f6
	subc	%g1,	0x1F21,	%i1
	st	%f13,	[%l7 + 0x60]
	edge32	%i2,	%g5,	%o7
	ldsb	[%l7 + 0x0E],	%i4
	smulcc	%l5,	0x1D91,	%l4
	movgu	%icc,	%i7,	%l1
	movrgez	%l2,	%o0,	%i5
	stx	%o4,	[%l7 + 0x48]
	ldx	[%l7 + 0x40],	%o3
	stb	%l3,	[%l7 + 0x33]
	orcc	%g6,	%l6,	%g7
	stw	%g3,	[%l7 + 0x6C]
	fmovdvs	%xcc,	%f13,	%f4
	std	%f2,	[%l7 + 0x40]
	movvs	%icc,	%g2,	%o5
	stb	%i3,	[%l7 + 0x5E]
	std	%f8,	[%l7 + 0x58]
	movrne	%i0,	%o2,	%g4
	lduh	[%l7 + 0x16],	%o1
	ldsb	[%l7 + 0x4F],	%i6
	ldub	[%l7 + 0x3A],	%l0
	fble,a	%fcc0,	loop_1418
loop_1418:
	fmovrslez	%g1,	%f15,	%f3
	sllx	%o6,	%i1,	%g5
	umulcc	%i2,	%i4,	%l5
	bcs,a,pt	%xcc,	loop_1419
loop_1419:
	ld	[%l7 + 0x28],	%f10
	move	%xcc,	%l4,	%i7
	udivcc	%l1,	0x03A5,	%l2
	fabss	%f11,	%f4
	ldub	[%l7 + 0x63],	%o7
	ld	[%l7 + 0x70],	%f12
	ldsb	[%l7 + 0x56],	%i5
	std	%f2,	[%l7 + 0x78]
	ldsb	[%l7 + 0x11],	%o4
	ldsh	[%l7 + 0x26],	%o3
	lduw	[%l7 + 0x58],	%o0
	fbo,a	%fcc2,	loop_1420
loop_1420:
	ldsb	[%l7 + 0x43],	%g6
	ldd	[%l7 + 0x10],	%f0
	st	%f9,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x5E],	%l3
	movcs	%xcc,	%l6,	%g7
	fmovsa	%xcc,	%f4,	%f12
	sth	%g3,	[%l7 + 0x66]
	movcs	%xcc,	%o5,	%i3
	movg	%icc,	%g2,	%o2
	sethi	0x041B,	%g4
	fbn,a	%fcc3,	loop_1421
loop_1421:
	ldsb	[%l7 + 0x2C],	%i0
	udivcc	%o1,	0x1AD9,	%l0
	ldsb	[%l7 + 0x28],	%g1
	movvs	%xcc,	%i6,	%i1
	bneg,pt	%icc,	loop_1422
loop_1422:
	lduw	[%l7 + 0x68],	%o6
	ldsb	[%l7 + 0x4A],	%i2
	std	%f10,	[%l7 + 0x38]
	ld	[%l7 + 0x28],	%f9
	stx	%g5,	[%l7 + 0x48]
	fmuld8ulx16	%f6,	%f11,	%f10
	fmovdvc	%xcc,	%f13,	%f7
	fmovrsne	%l5,	%f4,	%f9
	bcc,a,pt	%icc,	loop_1423
loop_1423:
	sth	%i4,	[%l7 + 0x36]
	ldub	[%l7 + 0x48],	%i7
	ldsh	[%l7 + 0x1C],	%l1
	lduh	[%l7 + 0x7A],	%l2
	ldd	[%l7 + 0x48],	%f14
	fxors	%f1,	%f12,	%f3
	fmuld8sux16	%f11,	%f3,	%f14
	ldsw	[%l7 + 0x68],	%l4
	ldd	[%l7 + 0x58],	%f4
	fbue,a	%fcc2,	loop_1424
loop_1424:
	ldsw	[%l7 + 0x54],	%i5
	sra	%o7,	%o4,	%o0
	stx	%g6,	[%l7 + 0x48]
	ldsb	[%l7 + 0x4D],	%o3
	tle	%icc,	0x2
	smul	%l3,	%l6,	%g7
	fmovda	%icc,	%f11,	%f12
	xorcc	%g3,	%o5,	%g2
	addccc	%o2,	0x17D7,	%g4
	stb	%i3,	[%l7 + 0x4A]
	sra	%i0,	0x19,	%o1
	ldsw	[%l7 + 0x74],	%g1
	ldsw	[%l7 + 0x20],	%l0
	ldub	[%l7 + 0x57],	%i6
	tvc	%xcc,	0x2
	and	%i1,	%o6,	%g5
	andcc	%i2,	%l5,	%i4
	stx	%i7,	[%l7 + 0x68]
	fornot1	%f14,	%f0,	%f12
	movrlez	%l2,	0x086,	%l1
	movn	%icc,	%i5,	%o7
	fbne,a	%fcc2,	loop_1425
loop_1425:
	udivcc	%l4,	0x142A,	%o0
	lduw	[%l7 + 0x68],	%g6
	ld	[%l7 + 0x5C],	%f5
	st	%f3,	[%l7 + 0x10]
	fmovdn	%xcc,	%f9,	%f11
	lduh	[%l7 + 0x20],	%o3
	ldsb	[%l7 + 0x55],	%o4
	fmovscc	%icc,	%f10,	%f8
	xnorcc	%l6,	%g7,	%g3
	ldsw	[%l7 + 0x68],	%l3
	stb	%g2,	[%l7 + 0x4D]
	add	%o2,	%g4,	%o5
	orn	%i3,	%i0,	%o1
	addc	%l0,	0x1B4A,	%i6
	std	%f4,	[%l7 + 0x50]
	ldub	[%l7 + 0x39],	%i1
	movgu	%xcc,	%o6,	%g1
	lduw	[%l7 + 0x08],	%g5
	fcmple32	%f8,	%f14,	%i2
	tgu	%xcc,	0x4
	lduh	[%l7 + 0x24],	%l5
	movvs	%xcc,	%i4,	%i7
	lduh	[%l7 + 0x4C],	%l2
	stb	%l1,	[%l7 + 0x6F]
	stx	%i5,	[%l7 + 0x60]
	xnor	%l4,	0x015C,	%o7
	fmovrse	%o0,	%f13,	%f13
	ldub	[%l7 + 0x12],	%g6
	tgu	%xcc,	0x2
	stx	%o3,	[%l7 + 0x78]
	addcc	%o4,	%g7,	%l6
	stx	%l3,	[%l7 + 0x40]
	ldsw	[%l7 + 0x6C],	%g2
	fbu	%fcc1,	loop_1426
loop_1426:
	ldx	[%l7 + 0x58],	%g3
	stx	%o2,	[%l7 + 0x48]
	movne	%xcc,	%o5,	%g4
	ldsb	[%l7 + 0x47],	%i3
	bgu	%icc,	loop_1427
loop_1427:
	stb	%o1,	[%l7 + 0x6E]
	st	%f13,	[%l7 + 0x0C]
	edge32l	%i0,	%l0,	%i6
	st	%f11,	[%l7 + 0x68]
	fmul8x16au	%f11,	%f3,	%f0
	ldsw	[%l7 + 0x48],	%i1
	bshuffle	%f10,	%f10,	%f4
	bg,pt	%icc,	loop_1428
loop_1428:
	bvc,a	loop_1429
loop_1429:
	stx	%o6,	[%l7 + 0x68]
	tcc	%icc,	0x4
	popc	0x1775,	%g1
	alignaddr	%g5,	%l5,	%i2
	ldsh	[%l7 + 0x30],	%i4
	nop
	setx loop_1430, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1430:
	stb	%i7,	[%l7 + 0x68]
	fble	%fcc2,	loop_1431
loop_1431:
	add	%l2,	%i5,	%l1
	st	%f4,	[%l7 + 0x50]
	ld	[%l7 + 0x70],	%f4
	st	%f5,	[%l7 + 0x1C]
	sth	%l4,	[%l7 + 0x34]
	movleu	%xcc,	%o7,	%g6
	fornot2s	%f4,	%f6,	%f12
	fmovrsgez	%o0,	%f1,	%f10
	tgu	%xcc,	0x3
	stb	%o4,	[%l7 + 0x3F]
	std	%f0,	[%l7 + 0x10]
	movrgez	%o3,	0x038,	%l6
	tn	%xcc,	0x6
	bcc,pt	%xcc,	loop_1432
loop_1432:
	bvs,a	loop_1433
loop_1433:
	ldsh	[%l7 + 0x78],	%g7
	stx	%l3,	[%l7 + 0x70]
	tle	%xcc,	0x6
	sdivcc	%g2,	0x059E,	%g3
	move	%icc,	%o5,	%g4
	sllx	%i3,	%o1,	%o2
	fpadd32	%f0,	%f2,	%f4
	fpadd16s	%f3,	%f0,	%f0
	movcs	%xcc,	%l0,	%i0
	udiv	%i6,	0x0725,	%o6
	ldd	[%l7 + 0x08],	%f12
	te	%icc,	0x6
	stw	%g1,	[%l7 + 0x54]
	lduw	[%l7 + 0x78],	%g5
	subc	%l5,	0x08C4,	%i2
	sth	%i4,	[%l7 + 0x3A]
	ldd	[%l7 + 0x60],	%f12
	stb	%i1,	[%l7 + 0x77]
	bn,pn	%xcc,	loop_1434
loop_1434:
	st	%f8,	[%l7 + 0x38]
	fbule	%fcc0,	loop_1435
loop_1435:
	ldsw	[%l7 + 0x30],	%l2
	andn	%i7,	0x1BDA,	%l1
	ldub	[%l7 + 0x54],	%i5
	fbule,a	%fcc0,	loop_1436
loop_1436:
	ldsb	[%l7 + 0x0E],	%l4
	stw	%g6,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x30],	%o0
	addc	%o4,	%o3,	%o7
	sth	%g7,	[%l7 + 0x0A]
	udivcc	%l6,	0x02D4,	%g2
	lduw	[%l7 + 0x24],	%l3
	mova	%icc,	%o5,	%g4
	ldub	[%l7 + 0x1C],	%i3
	ldsw	[%l7 + 0x20],	%g3
	ldd	[%l7 + 0x28],	%f2
	ld	[%l7 + 0x18],	%f11
	ldsw	[%l7 + 0x24],	%o1
	ldd	[%l7 + 0x78],	%f12
	ldsb	[%l7 + 0x7F],	%l0
	te	%xcc,	0x3
	std	%f14,	[%l7 + 0x60]
	ldsh	[%l7 + 0x44],	%i0
	bn,a	loop_1437
loop_1437:
	bvc,pn	%icc,	loop_1438
loop_1438:
	ldsb	[%l7 + 0x79],	%i6
	movrgz	%o2,	%o6,	%g5
	stb	%g1,	[%l7 + 0x14]
	stb	%i2,	[%l7 + 0x08]
	sth	%l5,	[%l7 + 0x68]
	stw	%i4,	[%l7 + 0x2C]
	stw	%i1,	[%l7 + 0x6C]
	lduw	[%l7 + 0x4C],	%i7
	ld	[%l7 + 0x58],	%f3
	ba,a,pt	%icc,	loop_1439
loop_1439:
	ld	[%l7 + 0x14],	%f9
	edge8	%l1,	%i5,	%l2
	fbo	%fcc3,	loop_1440
loop_1440:
	stb	%l4,	[%l7 + 0x48]
	st	%f7,	[%l7 + 0x44]
	stw	%g6,	[%l7 + 0x74]
	for	%f0,	%f4,	%f12
	sth	%o0,	[%l7 + 0x24]
	subccc	%o4,	%o3,	%g7
	ldsh	[%l7 + 0x3C],	%o7
	ldd	[%l7 + 0x40],	%f4
	tpos	%xcc,	0x3
	std	%f6,	[%l7 + 0x78]
	array16	%g2,	%l3,	%o5
	ldsh	[%l7 + 0x60],	%l6
	sth	%i3,	[%l7 + 0x52]
	sth	%g4,	[%l7 + 0x66]
	std	%f6,	[%l7 + 0x18]
	movle	%xcc,	%o1,	%l0
	stw	%i0,	[%l7 + 0x44]
	edge16	%i6,	%o2,	%g3
	st	%f8,	[%l7 + 0x14]
	te	%xcc,	0x5
	movcc	%xcc,	%g5,	%o6
	fnor	%f4,	%f10,	%f4
	fbuge,a	%fcc2,	loop_1441
loop_1441:
	fxor	%f4,	%f0,	%f2
	tvc	%xcc,	0x1
	fmovrslz	%i2,	%f6,	%f15
	lduw	[%l7 + 0x70],	%l5
	ldsh	[%l7 + 0x50],	%g1
	stx	%i4,	[%l7 + 0x60]
	subc	%i7,	%i1,	%i5
	xnorcc	%l1,	%l4,	%g6
	fnegd	%f10,	%f10
	sth	%o0,	[%l7 + 0x34]
	movrgz	%l2,	0x394,	%o3
	lduw	[%l7 + 0x50],	%g7
	ldsw	[%l7 + 0x10],	%o7
	stx	%g2,	[%l7 + 0x78]
	fmovrdgz	%l3,	%f2,	%f4
	ldd	[%l7 + 0x08],	%f10
	xnor	%o4,	0x0B5B,	%o5
	move	%icc,	%i3,	%g4
	fmovsgu	%xcc,	%f10,	%f13
	ld	[%l7 + 0x2C],	%f2
	bl,a,pn	%xcc,	loop_1442
loop_1442:
	stx	%o1,	[%l7 + 0x10]
	ld	[%l7 + 0x68],	%f2
	ldub	[%l7 + 0x0A],	%l6
	movcs	%xcc,	%i0,	%i6
	ldsw	[%l7 + 0x60],	%l0
	fpadd32	%f14,	%f4,	%f0
	brlz,a	%o2,	loop_1443
loop_1443:
	std	%f0,	[%l7 + 0x28]
	lduw	[%l7 + 0x54],	%g5
	stx	%o6,	[%l7 + 0x08]
	st	%f15,	[%l7 + 0x0C]
	bvs,a,pn	%icc,	loop_1444
loop_1444:
	stw	%g3,	[%l7 + 0x68]
	edge8l	%l5,	%g1,	%i4
	fmovdneg	%icc,	%f6,	%f5
	edge16ln	%i7,	%i2,	%i5
	movrne	%i1,	%l1,	%g6
	bne,pn	%xcc,	loop_1445
loop_1445:
	st	%f9,	[%l7 + 0x7C]
	ldd	[%l7 + 0x50],	%f2
	ldub	[%l7 + 0x6A],	%o0
	edge8	%l4,	%o3,	%l2
	fbg,a	%fcc2,	loop_1446
loop_1446:
	ldsh	[%l7 + 0x0E],	%o7
	ldub	[%l7 + 0x14],	%g2
	sth	%l3,	[%l7 + 0x1A]
	fmovse	%icc,	%f8,	%f8
	array8	%o4,	%o5,	%i3
	sllx	%g4,	0x15,	%g7
	brgez,a	%l6,	loop_1447
loop_1447:
	brgz	%i0,	loop_1448
loop_1448:
	fnot2s	%f13,	%f13
	lduw	[%l7 + 0x2C],	%i6
	xorcc	%l0,	0x10C5,	%o1
	ldsb	[%l7 + 0x7A],	%o2
	ld	[%l7 + 0x0C],	%f15
	ldsh	[%l7 + 0x7E],	%o6
	fandnot2s	%f4,	%f9,	%f3
	stb	%g5,	[%l7 + 0x79]
	andn	%g3,	0x1997,	%g1
	add	%i4,	0x0F8F,	%i7
	bg,a,pn	%xcc,	loop_1449
loop_1449:
	fmovrdgz	%l5,	%f12,	%f4
	ldsh	[%l7 + 0x16],	%i2
	fpack32	%f4,	%f4,	%f2
	std	%f14,	[%l7 + 0x68]
	stx	%i5,	[%l7 + 0x38]
	tn	%icc,	0x3
	lduh	[%l7 + 0x60],	%l1
	stw	%g6,	[%l7 + 0x20]
	ldsh	[%l7 + 0x6E],	%i1
	fmovdvc	%xcc,	%f1,	%f8
	st	%f4,	[%l7 + 0x28]
	fnot2	%f10,	%f14
	stw	%l4,	[%l7 + 0x64]
	st	%f5,	[%l7 + 0x10]
	bcc	%icc,	loop_1450
loop_1450:
	fandnot2s	%f4,	%f0,	%f6
	ldx	[%l7 + 0x40],	%o3
	array16	%l2,	%o0,	%g2
	sth	%o7,	[%l7 + 0x3E]
	sth	%l3,	[%l7 + 0x6E]
	st	%f5,	[%l7 + 0x44]
	sth	%o4,	[%l7 + 0x50]
	ldsb	[%l7 + 0x24],	%i3
	fblg	%fcc2,	loop_1451
loop_1451:
	ldsb	[%l7 + 0x66],	%g4
	brlez,a	%o5,	loop_1452
loop_1452:
	lduw	[%l7 + 0x28],	%l6
	ldsb	[%l7 + 0x19],	%i0
	faligndata	%f12,	%f4,	%f2
	stw	%g7,	[%l7 + 0x38]
	stw	%l0,	[%l7 + 0x24]
	ldub	[%l7 + 0x72],	%o1
	andn	%o2,	0x0A32,	%o6
	bcs,a	%xcc,	loop_1453
loop_1453:
	stb	%i6,	[%l7 + 0x4F]
	pdist	%f10,	%f6,	%f0
	lduh	[%l7 + 0x24],	%g3
	fbge	%fcc3,	loop_1454
loop_1454:
	ldd	[%l7 + 0x20],	%f4
	fmovrdlez	%g1,	%f10,	%f14
	te	%xcc,	0x5
	lduh	[%l7 + 0x18],	%i4
	lduw	[%l7 + 0x38],	%i7
	stb	%g5,	[%l7 + 0x30]
	sdivcc	%i2,	0x18B9,	%l5
	udivx	%i5,	0x193B,	%l1
	edge16l	%i1,	%l4,	%o3
	fornot1s	%f1,	%f5,	%f10
	fbuge	%fcc0,	loop_1455
loop_1455:
	stx	%l2,	[%l7 + 0x10]
	tleu	%xcc,	0x1
	fmovsa	%xcc,	%f0,	%f14
	stx	%g6,	[%l7 + 0x48]
	edge32	%g2,	%o0,	%o7
	fbl,a	%fcc1,	loop_1456
loop_1456:
	movge	%xcc,	%o4,	%l3
	ldsb	[%l7 + 0x32],	%i3
	subccc	%o5,	%l6,	%g4
	nop
	setx loop_1457, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1457:
	ld	[%l7 + 0x18],	%f15
	tle	%icc,	0x2
	tn	%icc,	0x2
	lduh	[%l7 + 0x18],	%g7
	ldx	[%l7 + 0x28],	%l0
	sth	%i0,	[%l7 + 0x14]
	lduh	[%l7 + 0x5C],	%o1
	ldx	[%l7 + 0x38],	%o6
	fpsub16	%f6,	%f12,	%f14
	stb	%o2,	[%l7 + 0x31]
	ldsb	[%l7 + 0x36],	%g3
	lduh	[%l7 + 0x48],	%g1
	ldd	[%l7 + 0x50],	%f2
	ldsh	[%l7 + 0x5C],	%i4
	ldx	[%l7 + 0x58],	%i7
	ldub	[%l7 + 0x5A],	%i6
	bvc,a	loop_1458
loop_1458:
	stb	%i2,	[%l7 + 0x0E]
	movrgez	%g5,	%l5,	%i5
	stb	%l1,	[%l7 + 0x35]
	smul	%l4,	%o3,	%l2
	movrgz	%i1,	%g6,	%o0
	movpos	%icc,	%o7,	%g2
	fmovdn	%xcc,	%f7,	%f11
	lduw	[%l7 + 0x0C],	%o4
	ld	[%l7 + 0x10],	%f14
	stw	%l3,	[%l7 + 0x78]
	ld	[%l7 + 0x20],	%f7
	std	%f4,	[%l7 + 0x18]
	ldsb	[%l7 + 0x55],	%i3
	addcc	%l6,	%g4,	%g7
	srlx	%o5,	0x08,	%l0
	ldd	[%l7 + 0x70],	%f14
	fcmple16	%f12,	%f2,	%o1
	stb	%i0,	[%l7 + 0x64]
	fpadd16	%f4,	%f6,	%f2
	stb	%o6,	[%l7 + 0x25]
	ldx	[%l7 + 0x40],	%o2
	ld	[%l7 + 0x10],	%f12
	fmovrsgez	%g1,	%f3,	%f3
	alignaddr	%i4,	%g3,	%i7
	sth	%i6,	[%l7 + 0x20]
	movcc	%xcc,	%i2,	%l5
	std	%f0,	[%l7 + 0x28]
	ldx	[%l7 + 0x78],	%i5
	stx	%l1,	[%l7 + 0x28]
	bl,a	%xcc,	loop_1459
loop_1459:
	stw	%g5,	[%l7 + 0x78]
	ldd	[%l7 + 0x60],	%f12
	ldub	[%l7 + 0x26],	%o3
	movcs	%xcc,	%l4,	%l2
	andn	%g6,	0x0C71,	%i1
	ble,a	loop_1460
loop_1460:
	std	%f12,	[%l7 + 0x60]
	stb	%o0,	[%l7 + 0x18]
	ldsb	[%l7 + 0x50],	%o7
	fnot1s	%f5,	%f1
	ldsh	[%l7 + 0x2E],	%g2
	st	%f14,	[%l7 + 0x68]
	lduw	[%l7 + 0x68],	%l3
	lduh	[%l7 + 0x50],	%i3
	fmovdgu	%xcc,	%f11,	%f4
	addcc	%l6,	%g4,	%g7
	ldub	[%l7 + 0x16],	%o4
	mova	%icc,	%o5,	%o1
	movvs	%icc,	%l0,	%i0
	bcc	%icc,	loop_1461
loop_1461:
	st	%f7,	[%l7 + 0x64]
	ldsw	[%l7 + 0x28],	%o2
	fbg,a	%fcc3,	loop_1462
loop_1462:
	for	%f8,	%f0,	%f14
	st	%f0,	[%l7 + 0x64]
	fornot2	%f14,	%f12,	%f4
	fmovsn	%icc,	%f8,	%f10
	andncc	%o6,	%i4,	%g3
	fmovdcc	%icc,	%f14,	%f2
	nop
	setx loop_1463, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1463:
	ldub	[%l7 + 0x21],	%i7
	array32	%i6,	%g1,	%l5
	ldub	[%l7 + 0x49],	%i5
	ldsb	[%l7 + 0x2B],	%l1
	movn	%icc,	%g5,	%o3
	ldx	[%l7 + 0x60],	%i2
	fba,a	%fcc1,	loop_1464
loop_1464:
	edge16	%l2,	%l4,	%g6
	ldub	[%l7 + 0x0D],	%o0
	ldd	[%l7 + 0x60],	%f8
	fbule,a	%fcc3,	loop_1465
loop_1465:
	bvs,pt	%icc,	loop_1466
loop_1466:
	ldub	[%l7 + 0x0A],	%i1
	edge16l	%o7,	%g2,	%i3
	st	%f10,	[%l7 + 0x3C]
	fsrc2s	%f0,	%f9
	sdiv	%l6,	0x07FB,	%l3
	stw	%g4,	[%l7 + 0x40]
	st	%f9,	[%l7 + 0x40]
	ldd	[%l7 + 0x38],	%f10
	tleu	%icc,	0x0
	lduw	[%l7 + 0x0C],	%g7
	fmovrde	%o4,	%f6,	%f14
	stw	%o5,	[%l7 + 0x5C]
	lduh	[%l7 + 0x74],	%o1
	sth	%l0,	[%l7 + 0x34]
	stw	%i0,	[%l7 + 0x64]
	fba,a	%fcc3,	loop_1467
loop_1467:
	ldx	[%l7 + 0x60],	%o2
	ldd	[%l7 + 0x78],	%f0
	array16	%o6,	%i4,	%g3
	edge32n	%i6,	%i7,	%g1
	fmovsn	%xcc,	%f15,	%f8
	stw	%l5,	[%l7 + 0x44]
	ldd	[%l7 + 0x30],	%f14
	bshuffle	%f8,	%f0,	%f12
	taddcctv	%i5,	0x02AF,	%g5
	subccc	%l1,	0x177C,	%o3
	edge32n	%l2,	%l4,	%i2
	tsubcctv	%g6,	%o0,	%o7
	bvc,pt	%xcc,	loop_1468
loop_1468:
	array8	%i1,	%g2,	%l6
	ldub	[%l7 + 0x4C],	%l3
	bshuffle	%f4,	%f0,	%f6
	stw	%i3,	[%l7 + 0x30]
	st	%f13,	[%l7 + 0x0C]
	ldx	[%l7 + 0x18],	%g4
	array16	%g7,	%o4,	%o1
	ldsw	[%l7 + 0x10],	%o5
	ldsb	[%l7 + 0x38],	%l0
	andncc	%i0,	%o6,	%o2
	lduh	[%l7 + 0x74],	%i4
	bgu,a,pn	%xcc,	loop_1469
loop_1469:
	lduw	[%l7 + 0x0C],	%i6
	edge8ln	%i7,	%g1,	%l5
	lduh	[%l7 + 0x46],	%g3
	fbge,a	%fcc0,	loop_1470
loop_1470:
	move	%icc,	%g5,	%i5
	lduw	[%l7 + 0x2C],	%l1
	stb	%o3,	[%l7 + 0x62]
	fcmped	%fcc1,	%f8,	%f2
	tl	%icc,	0x3
	lduh	[%l7 + 0x7A],	%l2
	ldsw	[%l7 + 0x34],	%l4
	fbug	%fcc2,	loop_1471
loop_1471:
	stb	%i2,	[%l7 + 0x2E]
	edge8n	%o0,	%o7,	%g6
	ldsh	[%l7 + 0x36],	%g2
	ta	%icc,	0x1
	fmovsne	%icc,	%f11,	%f14
	ld	[%l7 + 0x44],	%f2
	fble	%fcc2,	loop_1472
loop_1472:
	ldx	[%l7 + 0x10],	%i1
	ldx	[%l7 + 0x40],	%l6
	lduh	[%l7 + 0x32],	%l3
	or	%i3,	%g7,	%o4
	stx	%o1,	[%l7 + 0x10]
	array8	%g4,	%l0,	%i0
	std	%f0,	[%l7 + 0x30]
	smul	%o5,	%o6,	%o2
	xorcc	%i4,	0x09DC,	%i7
	brz	%g1,	loop_1473
loop_1473:
	tcs	%icc,	0x6
	stb	%l5,	[%l7 + 0x30]
	srlx	%g3,	0x16,	%g5
	ldsw	[%l7 + 0x7C],	%i5
	ldx	[%l7 + 0x60],	%i6
	ldd	[%l7 + 0x40],	%f6
	fcmpeq16	%f12,	%f0,	%o3
	fsrc1	%f14,	%f0
	alignaddr	%l2,	%l1,	%i2
	ldsw	[%l7 + 0x64],	%l4
	ldsw	[%l7 + 0x24],	%o7
	bpos,a	loop_1474
loop_1474:
	fmovrsne	%o0,	%f2,	%f13
	fcmpgt16	%f10,	%f14,	%g6
	lduh	[%l7 + 0x2C],	%i1
	tne	%icc,	0x2
	stw	%l6,	[%l7 + 0x70]
	and	%l3,	0x01DF,	%i3
	lduh	[%l7 + 0x1A],	%g2
	fxnors	%f10,	%f4,	%f14
	ldub	[%l7 + 0x1F],	%g7
	xnor	%o1,	%g4,	%o4
	st	%f13,	[%l7 + 0x3C]
	fbn	%fcc3,	loop_1475
loop_1475:
	and	%i0,	0x05C4,	%o5
	fbne	%fcc1,	loop_1476
loop_1476:
	sth	%l0,	[%l7 + 0x4C]
	bl	%icc,	loop_1477
loop_1477:
	lduw	[%l7 + 0x24],	%o6
	ldsh	[%l7 + 0x1C],	%i4
	movrlez	%i7,	%o2,	%g1
	movleu	%icc,	%l5,	%g3
	movgu	%xcc,	%g5,	%i5
	ldd	[%l7 + 0x68],	%f0
	lduw	[%l7 + 0x38],	%i6
	stb	%l2,	[%l7 + 0x25]
	sth	%l1,	[%l7 + 0x20]
	lduh	[%l7 + 0x46],	%o3
	tn	%xcc,	0x5
	tvc	%xcc,	0x1
	sdivx	%i2,	0x10A4,	%o7
	ldd	[%l7 + 0x60],	%f4
	std	%f10,	[%l7 + 0x58]
	mulscc	%l4,	%g6,	%o0
	ld	[%l7 + 0x64],	%f9
	ldsw	[%l7 + 0x1C],	%l6
	fmovdne	%icc,	%f0,	%f3
	stb	%l3,	[%l7 + 0x5C]
	st	%f1,	[%l7 + 0x40]
	movl	%icc,	%i1,	%g2
	be,pn	%icc,	loop_1478
loop_1478:
	fmovsvc	%xcc,	%f4,	%f15
	andn	%i3,	%o1,	%g7
	sth	%g4,	[%l7 + 0x5A]
	lduw	[%l7 + 0x48],	%i0
	fmovscc	%xcc,	%f7,	%f15
	movcs	%icc,	%o5,	%o4
	lduw	[%l7 + 0x70],	%l0
	fornot2	%f6,	%f4,	%f10
	st	%f0,	[%l7 + 0x58]
	ldd	[%l7 + 0x18],	%f10
	std	%f14,	[%l7 + 0x18]
	tg	%icc,	0x7
	orcc	%i4,	0x1845,	%o6
	bgu,pt	%icc,	loop_1479
loop_1479:
	te	%xcc,	0x7
	ldd	[%l7 + 0x68],	%f4
	stb	%o2,	[%l7 + 0x0A]
	ldsw	[%l7 + 0x34],	%i7
	addcc	%l5,	%g3,	%g1
	stb	%i5,	[%l7 + 0x41]
	ldd	[%l7 + 0x68],	%f14
	fmovrsgez	%i6,	%f11,	%f5
	stx	%g5,	[%l7 + 0x30]
	orcc	%l1,	%l2,	%i2
	bvc,a,pt	%icc,	loop_1480
loop_1480:
	ldub	[%l7 + 0x5F],	%o3
	fble,a	%fcc1,	loop_1481
loop_1481:
	bgu,pt	%xcc,	loop_1482
loop_1482:
	st	%f3,	[%l7 + 0x74]
	st	%f7,	[%l7 + 0x70]
	ldsb	[%l7 + 0x38],	%o7
	stw	%g6,	[%l7 + 0x50]
	stb	%o0,	[%l7 + 0x3C]
	ldub	[%l7 + 0x53],	%l6
	lduw	[%l7 + 0x2C],	%l4
	ld	[%l7 + 0x68],	%f1
	ldsb	[%l7 + 0x1A],	%i1
	ld	[%l7 + 0x10],	%f0
	movgu	%icc,	%l3,	%i3
	bvc	loop_1483
loop_1483:
	edge32n	%g2,	%g7,	%o1
	ld	[%l7 + 0x18],	%f12
	ldsw	[%l7 + 0x28],	%g4
	ba,a,pn	%icc,	loop_1484
loop_1484:
	ld	[%l7 + 0x4C],	%f9
	ldd	[%l7 + 0x38],	%f6
	lduh	[%l7 + 0x7A],	%o5
	ldsh	[%l7 + 0x10],	%i0
	taddcc	%o4,	0x1E43,	%i4
	fornot2	%f0,	%f8,	%f8
	ldsb	[%l7 + 0x4F],	%l0
	ld	[%l7 + 0x1C],	%f15
	lduw	[%l7 + 0x38],	%o6
	sth	%o2,	[%l7 + 0x1A]
	std	%f6,	[%l7 + 0x78]
	movn	%xcc,	%l5,	%g3
	ldsh	[%l7 + 0x44],	%g1
	stw	%i5,	[%l7 + 0x38]
	stb	%i6,	[%l7 + 0x43]
	ldsh	[%l7 + 0x66],	%g5
	std	%f10,	[%l7 + 0x28]
	taddcctv	%l1,	0x12B9,	%i7
	lduh	[%l7 + 0x52],	%l2
	array8	%o3,	%i2,	%g6
	ldub	[%l7 + 0x4B],	%o0
	ldsb	[%l7 + 0x72],	%o7
	edge8ln	%l6,	%l4,	%l3
	fmovd	%f6,	%f8
	movgu	%xcc,	%i3,	%g2
	fcmps	%fcc1,	%f15,	%f9
	umulcc	%i1,	0x0E4E,	%g7
	sdivcc	%g4,	0x1331,	%o5
	sth	%o1,	[%l7 + 0x76]
	ldsb	[%l7 + 0x56],	%o4
	fpadd16s	%f9,	%f9,	%f2
	tg	%xcc,	0x3
	st	%f12,	[%l7 + 0x4C]
	ldsw	[%l7 + 0x54],	%i4
	sdivcc	%i0,	0x1390,	%o6
	fbug,a	%fcc0,	loop_1485
loop_1485:
	sth	%l0,	[%l7 + 0x18]
	st	%f8,	[%l7 + 0x08]
	sth	%l5,	[%l7 + 0x44]
	fornot1	%f2,	%f2,	%f8
	and	%o2,	%g1,	%g3
	sth	%i5,	[%l7 + 0x76]
	movrlez	%g5,	%l1,	%i7
	ldub	[%l7 + 0x62],	%l2
	ldub	[%l7 + 0x4F],	%o3
	stx	%i2,	[%l7 + 0x48]
	ldd	[%l7 + 0x30],	%f12
	tl	%icc,	0x6
	stx	%g6,	[%l7 + 0x48]
	stx	%i6,	[%l7 + 0x60]
	andcc	%o0,	%o7,	%l6
	edge32	%l3,	%i3,	%g2
	stb	%l4,	[%l7 + 0x76]
	tn	%icc,	0x6
	std	%f10,	[%l7 + 0x20]
	movvs	%icc,	%g7,	%g4
	ldd	[%l7 + 0x60],	%f10
	fsrc1	%f0,	%f10
	bleu	%icc,	loop_1486
loop_1486:
	ldx	[%l7 + 0x30],	%o5
	udiv	%i1,	0x022C,	%o4
	ld	[%l7 + 0x1C],	%f6
	ldd	[%l7 + 0x48],	%f2
	lduh	[%l7 + 0x4C],	%o1
	umulcc	%i0,	0x0567,	%i4
	stb	%o6,	[%l7 + 0x66]
	ldsb	[%l7 + 0x34],	%l5
	mova	%xcc,	%o2,	%g1
	addcc	%l0,	0x0300,	%g3
	array32	%g5,	%l1,	%i7
	ldub	[%l7 + 0x30],	%l2
	movcc	%xcc,	%i5,	%i2
	ldd	[%l7 + 0x28],	%f14
	ld	[%l7 + 0x40],	%f10
	sth	%o3,	[%l7 + 0x56]
	fmovsleu	%icc,	%f6,	%f4
	movpos	%icc,	%g6,	%i6
	ldd	[%l7 + 0x38],	%f2
	lduw	[%l7 + 0x68],	%o0
	movcs	%xcc,	%l6,	%l3
	ldx	[%l7 + 0x58],	%i3
	stb	%o7,	[%l7 + 0x54]
	lduw	[%l7 + 0x08],	%g2
	sth	%l4,	[%l7 + 0x34]
	sth	%g7,	[%l7 + 0x70]
	stb	%o5,	[%l7 + 0x55]
	ldub	[%l7 + 0x7D],	%i1
	fxor	%f12,	%f6,	%f6
	sdivcc	%o4,	0x1685,	%o1
	tpos	%icc,	0x1
	brgz	%g4,	loop_1487
loop_1487:
	ldub	[%l7 + 0x35],	%i0
	subccc	%i4,	0x04ED,	%l5
	ldd	[%l7 + 0x10],	%f0
	movcs	%xcc,	%o2,	%g1
	mova	%icc,	%o6,	%l0
	sth	%g3,	[%l7 + 0x56]
	tg	%xcc,	0x3
	fmovdge	%xcc,	%f1,	%f4
	lduh	[%l7 + 0x1C],	%l1
	ldub	[%l7 + 0x1D],	%g5
	fmovrsgez	%i7,	%f13,	%f6
	movneg	%icc,	%l2,	%i2
	ldd	[%l7 + 0x70],	%f8
	ld	[%l7 + 0x10],	%f0
	movg	%xcc,	%o3,	%g6
	brlez	%i5,	loop_1488
loop_1488:
	bne,a	%xcc,	loop_1489
loop_1489:
	ldsh	[%l7 + 0x18],	%i6
	stx	%o0,	[%l7 + 0x78]
	or	%l3,	%l6,	%o7
	fand	%f0,	%f0,	%f4
	st	%f4,	[%l7 + 0x24]
	tg	%icc,	0x2
	orncc	%i3,	0x1134,	%l4
	tneg	%xcc,	0x6
	addcc	%g2,	0x1B0C,	%o5
	lduh	[%l7 + 0x42],	%i1
	st	%f14,	[%l7 + 0x24]
	stw	%o4,	[%l7 + 0x10]
	fmul8sux16	%f0,	%f12,	%f4
	fcmpes	%fcc3,	%f1,	%f14
	ld	[%l7 + 0x30],	%f12
	fones	%f3
	fbu	%fcc2,	loop_1490
loop_1490:
	xnor	%o1,	%g4,	%i0
	subcc	%i4,	%g7,	%o2
	array32	%l5,	%o6,	%g1
	fmovsleu	%xcc,	%f2,	%f11
	fnot1	%f12,	%f0
	orcc	%g3,	0x0D5F,	%l0
	and	%l1,	%i7,	%g5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type f   	: 118
!	Type cti   	: 89
!	Type i   	: 282
!	Type l   	: 511
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
main_t7:

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x9,	%g2
	set	0x6,	%g3
	set	0x1,	%g4
	set	0x9,	%g5
	set	0xE,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x3,	%i1
	set	-0x4,	%i2
	set	-0x5,	%i3
	set	-0xF,	%i4
	set	-0x2,	%i5
	set	-0xB,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x05B6333C,	%l0
	set	0x043227D7,	%l1
	set	0x7445CC89,	%l2
	set	0x6083771C,	%l3
	set	0x7120AA2D,	%l4
	set	0x004D5D9B,	%l5
	set	0x068FBA22,	%l6
	!# Output registers
	set	-0x118D,	%o0
	set	0x1286,	%o1
	set	0x01F2,	%o2
	set	-0x1F15,	%o3
	set	0x1398,	%o4
	set	-0x1549,	%o5
	set	0x00F3,	%o6
	set	0x01D3,	%o7

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

	std	%f4,	[%l7 + 0x28]
	ble,a	%icc,	loop_1491
loop_1491:
	fbe	%fcc3,	loop_1492
loop_1492:
	nop
	setx loop_1493, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1493:
	bne,pt	%icc,	loop_1494
loop_1494:
	nop
	setx loop_1495, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1495:
	bg	loop_1496
loop_1496:
	ldx	[%l7 + 0x40],	%l2
	bpos,a	loop_1497
loop_1497:
	fmul8x16au	%f0,	%f2,	%f6
	fmovda	%xcc,	%f12,	%f12
	fnands	%f3,	%f14,	%f2
	fmovsneg	%icc,	%f1,	%f1
	fnegd	%f4,	%f12
	fpadd16s	%f15,	%f11,	%f0
	fbn	%fcc1,	loop_1498
loop_1498:
	fand	%f14,	%f8,	%f12
	mulscc	%o3,	%g6,	%i2
	fble,a	%fcc2,	loop_1499
loop_1499:
	bn	loop_1500
loop_1500:
	fmuld8sux16	%f12,	%f10,	%f6
	fbu,a	%fcc2,	loop_1501
loop_1501:
	fones	%f0
	ba,pt	%xcc,	loop_1502
loop_1502:
	fnegs	%f15,	%f10
	fmovscs	%icc,	%f12,	%f3
	fmovsneg	%icc,	%f14,	%f12
	fands	%f12,	%f0,	%f12
	fmovsge	%xcc,	%f5,	%f12
	std	%f12,	[%l7 + 0x50]
	fone	%f0
	nop
	setx loop_1503, %l0, %l1
	jmpl %l1, %i5
loop_1503:
	fmovdg	%xcc,	%f15,	%f11
	bg,a,pt	%icc,	loop_1504
loop_1504:
	fpsub32	%f8,	%f2,	%f4
	fmovrsgz	%i6,	%f0,	%f3
	fnors	%f10,	%f8,	%f7
	fbn	%fcc3,	loop_1505
loop_1505:
	fbuge	%fcc3,	loop_1506
loop_1506:
	nop
	setx loop_1507, %l0, %l1
	jmpl %l1, %o0
loop_1507:
	fba	%fcc2,	loop_1508
loop_1508:
	ldsw	[%l7 + 0x70],	%l6
	fbne	%fcc3,	loop_1509
loop_1509:
	bcs,a,pt	%xcc,	loop_1510
loop_1510:
	be,a,pn	%xcc,	loop_1511
loop_1511:
	mulscc	%l3,	%o7,	%i3
	fpmerge	%f2,	%f5,	%f14
	call	loop_1512
loop_1512:
	fmovda	%xcc,	%f12,	%f1
	bvs,pt	%xcc,	loop_1513
loop_1513:
	fsrc2	%f12,	%f8
	fbug,a	%fcc1,	loop_1514
loop_1514:
	bcs,pt	%icc,	loop_1515
loop_1515:
	fmovrdlz	%g2,	%f8,	%f6
	fpackfix	%f6,	%f0
	fblg,a	%fcc0,	loop_1516
loop_1516:
	nop
	setx loop_1517, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1517:
	fmovsneg	%xcc,	%f6,	%f8
	fbl	%fcc1,	loop_1518
loop_1518:
	bneg,a,pt	%xcc,	loop_1519
loop_1519:
	fble	%fcc1,	loop_1520
loop_1520:
	fmovrsgz	%o5,	%f1,	%f14
	fbne,a	%fcc3,	loop_1521
loop_1521:
	ba,a,pt	%xcc,	loop_1522
loop_1522:
	bneg,a,pn	%icc,	loop_1523
loop_1523:
	fnot1	%f10,	%f12
	stx	%l4,	[%l7 + 0x20]
	fbuge	%fcc0,	loop_1524
loop_1524:
	fnegd	%f8,	%f2
	edge16	%i1,	%o4,	%o1
	te	%xcc,	0x0
	fxor	%f0,	%f6,	%f10
	fmovrdgz	%i0,	%f4,	%f0
	nop
	setx loop_1525, %l0, %l1
	jmpl %l1, %g4
loop_1525:
	ble,a	loop_1526
loop_1526:
	fandnot2	%f4,	%f2,	%f6
	bgu,pn	%xcc,	loop_1527
loop_1527:
	nop
	setx loop_1528, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1528:
	fmovda	%xcc,	%f1,	%f7
	faligndata	%f10,	%f0,	%f12
	fmovd	%f10,	%f8
	fnot1	%f6,	%f6
	fbue	%fcc0,	loop_1529
loop_1529:
	fbge	%fcc3,	loop_1530
loop_1530:
	nop
	setx loop_1531, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1531:
	fmovrdgez	%i4,	%f4,	%f14
	brlz	%o2,	loop_1532
loop_1532:
	fblg	%fcc1,	loop_1533
loop_1533:
	brz	%l5,	loop_1534
loop_1534:
	fors	%f10,	%f15,	%f8
	fmovdvs	%icc,	%f15,	%f1
	fxor	%f2,	%f6,	%f8
	bcc	%icc,	loop_1535
loop_1535:
	fbge	%fcc2,	loop_1536
loop_1536:
	nop
	setx loop_1537, %l0, %l1
	jmpl %l1, %o6
loop_1537:
	taddcc	%g1,	%g7,	%l0
	be,pt	%xcc,	loop_1538
loop_1538:
	brlez	%g3,	loop_1539
loop_1539:
	fmovdvc	%icc,	%f0,	%f10
	fbue	%fcc3,	loop_1540
loop_1540:
	brz,a	%i7,	loop_1541
loop_1541:
	fmovdpos	%icc,	%f5,	%f7
	fornot2	%f2,	%f4,	%f8
	bl,a,pt	%icc,	loop_1542
loop_1542:
	fzeros	%f6
	fnot2s	%f2,	%f10
	lduh	[%l7 + 0x2C],	%g5
	fzero	%f12
	fmul8x16	%f8,	%f12,	%f2
	fcmpd	%fcc2,	%f6,	%f14
	fnands	%f5,	%f9,	%f10
	nop
	setx loop_1543, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1543:
	ldx	[%l7 + 0x10],	%l1
	fbuge,a	%fcc0,	loop_1544
loop_1544:
	fmovse	%xcc,	%f6,	%f9
	ld	[%l7 + 0x74],	%f15
	fmovrslez	%o3,	%f14,	%f7
	fmovrdlez	%l2,	%f12,	%f14
	bneg,pn	%xcc,	loop_1545
loop_1545:
	brz,a	%i2,	loop_1546
loop_1546:
	fbo,a	%fcc3,	loop_1547
loop_1547:
	add	%g6,	0x1642,	%i6
	fnot2s	%f11,	%f5
	brnz,a	%o0,	loop_1548
loop_1548:
	fxnor	%f0,	%f10,	%f12
	nop
	setx loop_1549, %l0, %l1
	jmpl %l1, %l6
loop_1549:
	fmuld8sux16	%f12,	%f7,	%f10
	fmovdvs	%icc,	%f2,	%f11
	fcmpes	%fcc2,	%f10,	%f15
	fbuge	%fcc3,	loop_1550
loop_1550:
	fmovrsgez	%i5,	%f6,	%f9
	ble,pt	%icc,	loop_1551
loop_1551:
	fmovd	%f14,	%f0
	fbn	%fcc1,	loop_1552
loop_1552:
	brnz	%o7,	loop_1553
loop_1553:
	fmovdgu	%xcc,	%f5,	%f3
	brnz,a	%i3,	loop_1554
loop_1554:
	fmovsneg	%xcc,	%f6,	%f5
	fmovsneg	%xcc,	%f6,	%f8
	be,a,pn	%icc,	loop_1555
loop_1555:
	brnz	%l3,	loop_1556
loop_1556:
	bgu,a,pn	%xcc,	loop_1557
loop_1557:
	faligndata	%f0,	%f6,	%f6
	bpos,a	loop_1558
loop_1558:
	fands	%f1,	%f14,	%f0
	st	%f15,	[%l7 + 0x7C]
	fxnors	%f14,	%f1,	%f15
	brgez	%o5,	loop_1559
loop_1559:
	nop
	setx loop_1560, %l0, %l1
	jmpl %l1, %g2
loop_1560:
	fcmpgt16	%f0,	%f14,	%l4
	fbn	%fcc0,	loop_1561
loop_1561:
	nop
	setx loop_1562, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1562:
	bcs	loop_1563
loop_1563:
	bvc,pn	%icc,	loop_1564
loop_1564:
	bvc,pt	%xcc,	loop_1565
loop_1565:
	fbug,a	%fcc2,	loop_1566
loop_1566:
	fmovsge	%icc,	%f14,	%f15
	st	%f11,	[%l7 + 0x44]
	fbue,a	%fcc3,	loop_1567
loop_1567:
	fnors	%f0,	%f0,	%f11
	fbe,a	%fcc2,	loop_1568
loop_1568:
	st	%f1,	[%l7 + 0x60]
	movgu	%xcc,	%o4,	%i1
	brlez,a	%i0,	loop_1569
loop_1569:
	fmovsn	%icc,	%f6,	%f13
	xorcc	%g4,	0x0A9C,	%i4
	bvs,pn	%xcc,	loop_1570
loop_1570:
	fbne	%fcc3,	loop_1571
loop_1571:
	fand	%f0,	%f10,	%f2
	fbn	%fcc3,	loop_1572
loop_1572:
	bvc,a,pn	%icc,	loop_1573
loop_1573:
	fmovdcs	%icc,	%f5,	%f14
	fbul	%fcc3,	loop_1574
loop_1574:
	fcmps	%fcc2,	%f4,	%f13
	bneg,pt	%xcc,	loop_1575
loop_1575:
	ba	%icc,	loop_1576
loop_1576:
	fbul	%fcc3,	loop_1577
loop_1577:
	fbne,a	%fcc0,	loop_1578
loop_1578:
	bcs,a	loop_1579
loop_1579:
	fbug	%fcc3,	loop_1580
loop_1580:
	fbul	%fcc3,	loop_1581
loop_1581:
	fmovrdgez	%o1,	%f14,	%f2
	fmovrse	%o2,	%f5,	%f5
	fbue	%fcc3,	loop_1582
loop_1582:
	stx	%l5,	[%l7 + 0x40]
	fmovsg	%icc,	%f13,	%f8
	std	%f10,	[%l7 + 0x18]
	brz,a	%o6,	loop_1583
loop_1583:
	fone	%f6
	brlez	%g7,	loop_1584
loop_1584:
	bvc	%icc,	loop_1585
loop_1585:
	fble	%fcc1,	loop_1586
loop_1586:
	fmovdcc	%xcc,	%f14,	%f0
	bg	%xcc,	loop_1587
loop_1587:
	fcmpeq16	%f2,	%f0,	%l0
	fornot1s	%f3,	%f10,	%f11
	fbo	%fcc1,	loop_1588
loop_1588:
	fands	%f5,	%f13,	%f13
	fmovsn	%xcc,	%f14,	%f13
	ble	%xcc,	loop_1589
loop_1589:
	fbl,a	%fcc0,	loop_1590
loop_1590:
	movle	%icc,	%g1,	%g3
	fbge	%fcc0,	loop_1591
loop_1591:
	andncc	%g5,	%l1,	%o3
	fmovdg	%xcc,	%f1,	%f3
	fbu,a	%fcc2,	loop_1592
loop_1592:
	brlz,a	%i7,	loop_1593
loop_1593:
	xnor	%l2,	0x1101,	%i2
	stx	%i6,	[%l7 + 0x10]
	fbne	%fcc0,	loop_1594
loop_1594:
	fabss	%f0,	%f5
	brnz	%o0,	loop_1595
loop_1595:
	bl,a,pt	%xcc,	loop_1596
loop_1596:
	fbu	%fcc3,	loop_1597
loop_1597:
	fbe,a	%fcc3,	loop_1598
loop_1598:
	bge,pt	%xcc,	loop_1599
loop_1599:
	fmovdge	%icc,	%f14,	%f15
	fmovsn	%xcc,	%f6,	%f1
	bcc,a,pt	%xcc,	loop_1600
loop_1600:
	brz	%g6,	loop_1601
loop_1601:
	fmovrsne	%i5,	%f12,	%f12
	fba	%fcc1,	loop_1602
loop_1602:
	fnot2	%f0,	%f2
	fmovdgu	%xcc,	%f0,	%f3
	fbue	%fcc3,	loop_1603
loop_1603:
	brnz,a	%l6,	loop_1604
loop_1604:
	fsrc1	%f8,	%f2
	fbg	%fcc3,	loop_1605
loop_1605:
	fbg	%fcc1,	loop_1606
loop_1606:
	fmovdle	%xcc,	%f8,	%f1
	fcmpgt32	%f10,	%f6,	%i3
	bleu,pn	%icc,	loop_1607
loop_1607:
	ba,a,pt	%icc,	loop_1608
loop_1608:
	fmul8ulx16	%f6,	%f10,	%f10
	fmovdg	%icc,	%f3,	%f11
	fmovsgu	%xcc,	%f0,	%f9
	fcmpne32	%f4,	%f14,	%o7
	ldd	[%l7 + 0x40],	%f8
	fbe,a	%fcc0,	loop_1609
loop_1609:
	fbl,a	%fcc3,	loop_1610
loop_1610:
	fmovse	%icc,	%f11,	%f5
	fmovsvs	%xcc,	%f0,	%f8
	subc	%o5,	%l3,	%l4
	ble	%xcc,	loop_1611
loop_1611:
	fmovrsgez	%o4,	%f10,	%f3
	fmovdl	%icc,	%f7,	%f2
	brlez,a	%i1,	loop_1612
loop_1612:
	fba	%fcc0,	loop_1613
loop_1613:
	bgu,a,pt	%icc,	loop_1614
loop_1614:
	nop
	setx loop_1615, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1615:
	bvc	loop_1616
loop_1616:
	bl,a,pn	%icc,	loop_1617
loop_1617:
	fbu,a	%fcc0,	loop_1618
loop_1618:
	for	%f6,	%f4,	%f12
	ldx	[%l7 + 0x60],	%i0
	fmuld8ulx16	%f3,	%f12,	%f2
	bcc,a,pn	%icc,	loop_1619
loop_1619:
	bcc,a	%xcc,	loop_1620
loop_1620:
	ldsh	[%l7 + 0x46],	%g4
	fbue	%fcc3,	loop_1621
loop_1621:
	movgu	%xcc,	%i4,	%g2
	fmovdge	%xcc,	%f13,	%f13
	fexpand	%f7,	%f4
	fmovdl	%icc,	%f0,	%f5
	fmovdgu	%xcc,	%f5,	%f13
	fmovrslz	%o1,	%f8,	%f7
	fbule	%fcc0,	loop_1622
loop_1622:
	bl	loop_1623
loop_1623:
	ldsb	[%l7 + 0x0A],	%o2
	edge16	%l5,	%g7,	%l0
	fpadd32	%f10,	%f8,	%f2
	fmovsge	%icc,	%f0,	%f12
	fbge	%fcc3,	loop_1624
loop_1624:
	ble	loop_1625
loop_1625:
	fmovdne	%icc,	%f13,	%f4
	fornot2	%f14,	%f10,	%f6
	fbule,a	%fcc1,	loop_1626
loop_1626:
	fpadd32s	%f5,	%f8,	%f6
	andcc	%o6,	0x0EDC,	%g3
	brgz,a	%g1,	loop_1627
loop_1627:
	fmovsa	%icc,	%f14,	%f6
	fnot1s	%f11,	%f12
	fblg	%fcc2,	loop_1628
loop_1628:
	ba,a,pt	%xcc,	loop_1629
loop_1629:
	bcc,a	%xcc,	loop_1630
loop_1630:
	fbge,a	%fcc1,	loop_1631
loop_1631:
	fmovdleu	%xcc,	%f4,	%f11
	bcs,pn	%icc,	loop_1632
loop_1632:
	fmovdpos	%xcc,	%f11,	%f6
	fsrc2s	%f8,	%f11
	nop
	setx loop_1633, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1633:
	fmovs	%f11,	%f8
	ldsh	[%l7 + 0x70],	%g5
	ldub	[%l7 + 0x09],	%l1
	fbo	%fcc2,	loop_1634
loop_1634:
	brgz,a	%o3,	loop_1635
loop_1635:
	fba	%fcc1,	loop_1636
loop_1636:
	for	%f2,	%f2,	%f0
	ldsh	[%l7 + 0x7C],	%l2
	ldub	[%l7 + 0x47],	%i2
	fmovsvc	%xcc,	%f3,	%f3
	fba,a	%fcc2,	loop_1637
loop_1637:
	std	%f14,	[%l7 + 0x60]
	nop
	setx loop_1638, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1638:
	fbule,a	%fcc3,	loop_1639
loop_1639:
	fble	%fcc1,	loop_1640
loop_1640:
	fone	%f10
	ble	loop_1641
loop_1641:
	fpack16	%f10,	%f8
	fbne	%fcc1,	loop_1642
loop_1642:
	fxors	%f1,	%f1,	%f2
	sth	%i7,	[%l7 + 0x4A]
	nop
	setx loop_1643, %l0, %l1
	jmpl %l1, %o0
loop_1643:
	fandnot1s	%f13,	%f2,	%f2
	movcc	%xcc,	%g6,	%i6
	fba	%fcc3,	loop_1644
loop_1644:
	fmovdpos	%icc,	%f7,	%f10
	fmovscc	%icc,	%f13,	%f11
	fmuld8sux16	%f12,	%f4,	%f8
	sth	%i5,	[%l7 + 0x20]
	fmovsge	%icc,	%f6,	%f13
	fcmpeq32	%f8,	%f10,	%l6
	fxnors	%f12,	%f9,	%f6
	ldx	[%l7 + 0x08],	%i3
	brgez,a	%o5,	loop_1645
loop_1645:
	bneg,pn	%xcc,	loop_1646
loop_1646:
	bn	%icc,	loop_1647
loop_1647:
	brlez,a	%o7,	loop_1648
loop_1648:
	fpsub32	%f0,	%f0,	%f2
	fble,a	%fcc2,	loop_1649
loop_1649:
	fxors	%f14,	%f9,	%f6
	fbne	%fcc3,	loop_1650
loop_1650:
	fmovsa	%xcc,	%f2,	%f1
	ldx	[%l7 + 0x28],	%l3
	bneg,pn	%xcc,	loop_1651
loop_1651:
	fnand	%f6,	%f6,	%f0
	fmovrdlz	%l4,	%f6,	%f8
	fnegd	%f4,	%f12
	bn,pn	%xcc,	loop_1652
loop_1652:
	fnot1	%f14,	%f12
	fmovda	%xcc,	%f12,	%f9
	fpadd32	%f12,	%f10,	%f6
	brlez,a	%o4,	loop_1653
loop_1653:
	brgez	%i0,	loop_1654
loop_1654:
	fbo,a	%fcc3,	loop_1655
loop_1655:
	fmovrde	%g4,	%f4,	%f14
	fpack32	%f6,	%f6,	%f10
	fmovrse	%i1,	%f11,	%f4
	fnegd	%f0,	%f14
	bvc,a	loop_1656
loop_1656:
	brlz,a	%i4,	loop_1657
loop_1657:
	fblg,a	%fcc1,	loop_1658
loop_1658:
	fbul,a	%fcc0,	loop_1659
loop_1659:
	fsrc1	%f8,	%f2
	bneg,a	%icc,	loop_1660
loop_1660:
	brlez,a	%g2,	loop_1661
loop_1661:
	fbue,a	%fcc2,	loop_1662
loop_1662:
	fpsub16s	%f12,	%f11,	%f13
	nop
	setx loop_1663, %l0, %l1
	jmpl %l1, %o2
loop_1663:
	bshuffle	%f12,	%f14,	%f14
	fmovdpos	%icc,	%f5,	%f5
	brz,a	%o1,	loop_1664
loop_1664:
	fpsub32	%f6,	%f6,	%f2
	fnot2	%f2,	%f0
	std	%f14,	[%l7 + 0x50]
	bcc,pn	%xcc,	loop_1665
loop_1665:
	andcc	%l5,	%l0,	%g7
	bcs	loop_1666
loop_1666:
	be	loop_1667
loop_1667:
	fmovdvc	%icc,	%f11,	%f14
	brlez,a	%o6,	loop_1668
loop_1668:
	stb	%g1,	[%l7 + 0x53]
	fmovdleu	%icc,	%f3,	%f14
	fbe	%fcc3,	loop_1669
loop_1669:
	fmovdcs	%icc,	%f3,	%f14
	fble,a	%fcc1,	loop_1670
loop_1670:
	fsrc1s	%f14,	%f8
	bne,pn	%xcc,	loop_1671
loop_1671:
	brlz	%g5,	loop_1672
loop_1672:
	fbue,a	%fcc3,	loop_1673
loop_1673:
	addc	%g3,	%l1,	%l2
	fnot2s	%f4,	%f4
	brgz	%o3,	loop_1674
loop_1674:
	fmovdvc	%xcc,	%f6,	%f5
	fmovsleu	%icc,	%f3,	%f2
	sth	%i7,	[%l7 + 0x6A]
	bcc,a,pn	%xcc,	loop_1675
loop_1675:
	nop
	setx loop_1676, %l0, %l1
	jmpl %l1, %i2
loop_1676:
	fbug,a	%fcc3,	loop_1677
loop_1677:
	be,a,pt	%xcc,	loop_1678
loop_1678:
	fcmpd	%fcc3,	%f2,	%f14
	fblg,a	%fcc3,	loop_1679
loop_1679:
	fbo,a	%fcc1,	loop_1680
loop_1680:
	fmovdneg	%icc,	%f2,	%f6
	fmovdneg	%icc,	%f15,	%f1
	ba	%xcc,	loop_1681
loop_1681:
	edge8ln	%o0,	%i6,	%i5
	fsrc1	%f4,	%f14
	tl	%icc,	0x5
	brgez,a	%g6,	loop_1682
loop_1682:
	bneg	loop_1683
loop_1683:
	fbule,a	%fcc2,	loop_1684
loop_1684:
	fornot2	%f6,	%f0,	%f14
	fmovsa	%icc,	%f6,	%f9
	nop
	setx loop_1685, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1685:
	brnz,a	%l6,	loop_1686
loop_1686:
	bleu	loop_1687
loop_1687:
	fandnot2	%f8,	%f12,	%f0
	bge,a	loop_1688
loop_1688:
	fxors	%f0,	%f9,	%f2
	fexpand	%f7,	%f2
	ldsh	[%l7 + 0x0A],	%o5
	fbuge,a	%fcc2,	loop_1689
loop_1689:
	fcmpd	%fcc2,	%f10,	%f10
	fxnors	%f14,	%f12,	%f11
	fmovsvc	%icc,	%f4,	%f15
	fmovdn	%xcc,	%f0,	%f6
	call	loop_1690
loop_1690:
	fcmped	%fcc1,	%f4,	%f4
	bleu,pn	%icc,	loop_1691
loop_1691:
	fbge	%fcc1,	loop_1692
loop_1692:
	fbo	%fcc0,	loop_1693
loop_1693:
	fmovse	%icc,	%f11,	%f10
	brgz,a	%i3,	loop_1694
loop_1694:
	fcmpes	%fcc0,	%f6,	%f11
	bne	%xcc,	loop_1695
loop_1695:
	bleu	loop_1696
loop_1696:
	fmovd	%f4,	%f12
	fbo	%fcc2,	loop_1697
loop_1697:
	fblg,a	%fcc3,	loop_1698
loop_1698:
	fzeros	%f1
	stx	%o7,	[%l7 + 0x40]
	fones	%f10
	fmul8ulx16	%f4,	%f2,	%f4
	fbo	%fcc1,	loop_1699
loop_1699:
	fbg,a	%fcc3,	loop_1700
loop_1700:
	fmovrsgez	%l3,	%f13,	%f15
	fbule,a	%fcc1,	loop_1701
loop_1701:
	brlz,a	%o4,	loop_1702
loop_1702:
	fbe	%fcc2,	loop_1703
loop_1703:
	fbge	%fcc3,	loop_1704
loop_1704:
	fbug,a	%fcc2,	loop_1705
loop_1705:
	fmovscs	%xcc,	%f0,	%f4
	fmovsa	%xcc,	%f0,	%f4
	fcmple32	%f8,	%f10,	%i0
	fandnot2s	%f5,	%f5,	%f13
	edge32ln	%l4,	%i1,	%g4
	fbul	%fcc2,	loop_1706
loop_1706:
	bneg,a	loop_1707
loop_1707:
	fands	%f0,	%f12,	%f14
	array16	%g2,	%o2,	%i4
	fmovdcs	%icc,	%f1,	%f3
	brgez,a	%o1,	loop_1708
loop_1708:
	ba,a,pt	%icc,	loop_1709
loop_1709:
	edge16	%l5,	%g7,	%l0
	fxor	%f0,	%f14,	%f2
	fbue	%fcc0,	loop_1710
loop_1710:
	fbug,a	%fcc0,	loop_1711
loop_1711:
	bvc,a	loop_1712
loop_1712:
	fmovse	%xcc,	%f4,	%f12
	fbl	%fcc2,	loop_1713
loop_1713:
	fba,a	%fcc3,	loop_1714
loop_1714:
	bgu,pt	%icc,	loop_1715
loop_1715:
	nop
	setx loop_1716, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1716:
	pdist	%f10,	%f2,	%f2
	fmovrsgez	%o6,	%f10,	%f15
	fbu	%fcc3,	loop_1717
loop_1717:
	bneg	%icc,	loop_1718
loop_1718:
	stx	%g5,	[%l7 + 0x30]
	brlez,a	%g3,	loop_1719
loop_1719:
	for	%f12,	%f14,	%f14
	ldd	[%l7 + 0x58],	%f8
	ldsw	[%l7 + 0x18],	%g1
	siam	0x7
	fxor	%f2,	%f12,	%f8
	bge,a,pt	%xcc,	loop_1720
loop_1720:
	fmovd	%f8,	%f12
	fbe	%fcc2,	loop_1721
loop_1721:
	fsrc2	%f2,	%f10
	bg,a	%xcc,	loop_1722
loop_1722:
	fmovrdne	%l1,	%f12,	%f0
	stx	%l2,	[%l7 + 0x70]
	bvs,a	loop_1723
loop_1723:
	fmul8ulx16	%f12,	%f10,	%f2
	brnz	%o3,	loop_1724
loop_1724:
	brlez	%i7,	loop_1725
loop_1725:
	bcc,a	loop_1726
loop_1726:
	brnz	%i2,	loop_1727
loop_1727:
	fba,a	%fcc1,	loop_1728
loop_1728:
	fcmps	%fcc1,	%f11,	%f12
	fnot1	%f14,	%f2
	fbe	%fcc1,	loop_1729
loop_1729:
	bcs,a	loop_1730
loop_1730:
	fornot2s	%f9,	%f12,	%f11
	ld	[%l7 + 0x28],	%f11
	fandnot1s	%f10,	%f6,	%f1
	be,pn	%xcc,	loop_1731
loop_1731:
	bne	%icc,	loop_1732
loop_1732:
	fornot2	%f10,	%f2,	%f4
	fmovsle	%icc,	%f0,	%f9
	be,pt	%icc,	loop_1733
loop_1733:
	fmovdvs	%icc,	%f7,	%f5
	bcc,a,pt	%icc,	loop_1734
loop_1734:
	fble	%fcc0,	loop_1735
loop_1735:
	fmovsg	%icc,	%f2,	%f6
	fcmpd	%fcc0,	%f4,	%f6
	stb	%i6,	[%l7 + 0x34]
	fcmpeq32	%f10,	%f0,	%o0
	fmovdn	%xcc,	%f3,	%f4
	fmovdne	%icc,	%f6,	%f0
	call	loop_1736
loop_1736:
	fcmple32	%f2,	%f12,	%i5
	brnz	%g6,	loop_1737
loop_1737:
	fsrc2	%f8,	%f10
	fandnot2s	%f12,	%f13,	%f8
	fsrc2	%f10,	%f0
	brlz	%l6,	loop_1738
loop_1738:
	fnand	%f0,	%f10,	%f4
	bl,a	%icc,	loop_1739
loop_1739:
	brnz	%o5,	loop_1740
loop_1740:
	ld	[%l7 + 0x64],	%f15
	fblg,a	%fcc2,	loop_1741
loop_1741:
	std	%f2,	[%l7 + 0x08]
	bl	loop_1742
loop_1742:
	ble	%icc,	loop_1743
loop_1743:
	fbne	%fcc1,	loop_1744
loop_1744:
	stx	%o7,	[%l7 + 0x58]
	fpackfix	%f8,	%f9
	fnands	%f13,	%f13,	%f5
	fmovd	%f12,	%f0
	edge8l	%i3,	%l3,	%i0
	fabss	%f11,	%f4
	movcc	%xcc,	%l4,	%o4
	fmul8x16	%f10,	%f0,	%f6
	nop
	setx loop_1745, %l0, %l1
	jmpl %l1, %i1
loop_1745:
	ld	[%l7 + 0x74],	%f6
	fmovsneg	%icc,	%f11,	%f11
	bl	loop_1746
loop_1746:
	fmovsne	%icc,	%f13,	%f0
	fbule	%fcc2,	loop_1747
loop_1747:
	fcmpeq16	%f0,	%f4,	%g2
	nop
	setx loop_1748, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1748:
	ldsb	[%l7 + 0x59],	%o2
	fcmpeq32	%f10,	%f14,	%i4
	nop
	setx loop_1749, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1749:
	stx	%g4,	[%l7 + 0x40]
	ba,pn	%icc,	loop_1750
loop_1750:
	fbg,a	%fcc1,	loop_1751
loop_1751:
	fblg	%fcc3,	loop_1752
loop_1752:
	bgu	%icc,	loop_1753
loop_1753:
	smulcc	%l5,	%o1,	%l0
	bcc,pt	%icc,	loop_1754
loop_1754:
	fmovdn	%icc,	%f11,	%f4
	fpack32	%f2,	%f4,	%f4
	fbo,a	%fcc0,	loop_1755
loop_1755:
	brlz,a	%o6,	loop_1756
loop_1756:
	fcmpne16	%f2,	%f6,	%g7
	add	%g3,	0x0163,	%g1
	fmovsvc	%icc,	%f7,	%f15
	fbo,a	%fcc3,	loop_1757
loop_1757:
	fbuge,a	%fcc1,	loop_1758
loop_1758:
	bgu,a	loop_1759
loop_1759:
	fandnot2s	%f11,	%f1,	%f9
	fmovscs	%xcc,	%f9,	%f7
	brlz	%g5,	loop_1760
loop_1760:
	fxors	%f4,	%f3,	%f11
	fmovdl	%icc,	%f8,	%f1
	ldsw	[%l7 + 0x70],	%l1
	fmovrslz	%o3,	%f2,	%f4
	brz,a	%i7,	loop_1761
loop_1761:
	bge,a	%xcc,	loop_1762
loop_1762:
	fbg	%fcc2,	loop_1763
loop_1763:
	stb	%i2,	[%l7 + 0x4C]
	ldub	[%l7 + 0x4A],	%i6
	nop
	setx loop_1764, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1764:
	nop
	setx loop_1765, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1765:
	fbl	%fcc0,	loop_1766
loop_1766:
	fmovrsne	%l2,	%f11,	%f5
	brgz	%i5,	loop_1767
loop_1767:
	for	%f14,	%f2,	%f0
	fpsub32s	%f10,	%f0,	%f5
	tneg	%icc,	0x1
	fbl,a	%fcc1,	loop_1768
loop_1768:
	fmovda	%icc,	%f8,	%f1
	fexpand	%f4,	%f6
	fmovrse	%g6,	%f11,	%f8
	ldsh	[%l7 + 0x36],	%l6
	fmovdn	%xcc,	%f12,	%f3
	fba	%fcc2,	loop_1769
loop_1769:
	bn,pn	%icc,	loop_1770
loop_1770:
	bcs,pn	%xcc,	loop_1771
loop_1771:
	fnand	%f2,	%f8,	%f2
	fbul,a	%fcc3,	loop_1772
loop_1772:
	fbo,a	%fcc2,	loop_1773
loop_1773:
	sra	%o5,	0x0B,	%o7
	fpackfix	%f0,	%f12
	andcc	%i3,	%o0,	%l3
	bshuffle	%f10,	%f12,	%f6
	fmovspos	%icc,	%f1,	%f0
	fcmple16	%f6,	%f0,	%i0
	fxor	%f10,	%f12,	%f8
	stb	%l4,	[%l7 + 0x58]
	nop
	setx loop_1774, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1774:
	bpos,a	%xcc,	loop_1775
loop_1775:
	fnors	%f13,	%f1,	%f10
	orncc	%o4,	0x1923,	%g2
	fbul	%fcc2,	loop_1776
loop_1776:
	fornot1	%f14,	%f2,	%f0
	bn,a,pn	%icc,	loop_1777
loop_1777:
	fmovdcs	%icc,	%f11,	%f4
	fmovsa	%icc,	%f7,	%f14
	fmovrdgez	%o2,	%f0,	%f14
	sth	%i1,	[%l7 + 0x7E]
	fba,a	%fcc0,	loop_1778
loop_1778:
	nop
	setx loop_1779, %l0, %l1
	jmpl %l1, %g4
loop_1779:
	bleu	%xcc,	loop_1780
loop_1780:
	fmovsvs	%xcc,	%f8,	%f3
	fcmpeq32	%f14,	%f14,	%l5
	brlz,a	%o1,	loop_1781
loop_1781:
	ldsb	[%l7 + 0x70],	%i4
	fmovrde	%l0,	%f4,	%f6
	fmovscs	%icc,	%f4,	%f2
	bgu,pt	%xcc,	loop_1782
loop_1782:
	brgez	%o6,	loop_1783
loop_1783:
	nop
	setx loop_1784, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1784:
	fnegd	%f0,	%f12
	fbul,a	%fcc0,	loop_1785
loop_1785:
	brnz,a	%g7,	loop_1786
loop_1786:
	fmovdvc	%icc,	%f13,	%f11
	brgez,a	%g3,	loop_1787
loop_1787:
	bgu,pn	%icc,	loop_1788
loop_1788:
	fmovdleu	%xcc,	%f2,	%f11
	bcc,pt	%xcc,	loop_1789
loop_1789:
	fbu,a	%fcc1,	loop_1790
loop_1790:
	fbo,a	%fcc0,	loop_1791
loop_1791:
	fmovs	%f4,	%f14
	fabsd	%f2,	%f14
	fabsd	%f14,	%f8
	fmovspos	%xcc,	%f7,	%f6
	brgez,a	%g1,	loop_1792
loop_1792:
	ld	[%l7 + 0x08],	%f1
	fsrc1s	%f10,	%f7
	fbul,a	%fcc1,	loop_1793
loop_1793:
	ldsh	[%l7 + 0x14],	%g5
	fmovrslez	%l1,	%f15,	%f8
	ldsb	[%l7 + 0x37],	%o3
	brlez	%i2,	loop_1794
loop_1794:
	fcmple16	%f8,	%f12,	%i6
	movre	%i7,	%i5,	%l2
	nop
	setx loop_1795, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1795:
	fors	%f0,	%f6,	%f5
	fpack16	%f0,	%f0
	fmovsgu	%xcc,	%f3,	%f5
	fmovsn	%icc,	%f3,	%f11
	fmovdneg	%icc,	%f3,	%f4
	fmovrde	%g6,	%f0,	%f10
	fbuge,a	%fcc0,	loop_1796
loop_1796:
	edge8	%o5,	%l6,	%o7
	fxor	%f0,	%f2,	%f14
	fmovdn	%icc,	%f3,	%f12
	bvs,a,pt	%icc,	loop_1797
loop_1797:
	fxors	%f3,	%f2,	%f12
	fmovdl	%icc,	%f4,	%f6
	fbue	%fcc3,	loop_1798
loop_1798:
	fmovdvc	%icc,	%f11,	%f3
	fpsub32s	%f2,	%f6,	%f10
	be	%xcc,	loop_1799
loop_1799:
	be,a,pt	%icc,	loop_1800
loop_1800:
	ldd	[%l7 + 0x40],	%f0
	nop
	setx loop_1801, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1801:
	brgz,a	%o0,	loop_1802
loop_1802:
	fmovde	%xcc,	%f11,	%f3
	fors	%f1,	%f7,	%f14
	fmovrdne	%l3,	%f12,	%f10
	nop
	setx loop_1803, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1803:
	fbue,a	%fcc0,	loop_1804
loop_1804:
	fbge	%fcc1,	loop_1805
loop_1805:
	ldub	[%l7 + 0x69],	%i3
	stx	%l4,	[%l7 + 0x38]
	fblg	%fcc3,	loop_1806
loop_1806:
	fpsub32	%f10,	%f14,	%f0
	ld	[%l7 + 0x08],	%f7
	fmovsne	%xcc,	%f2,	%f2
	fble,a	%fcc2,	loop_1807
loop_1807:
	fbuge	%fcc3,	loop_1808
loop_1808:
	fbn	%fcc0,	loop_1809
loop_1809:
	fbug	%fcc0,	loop_1810
loop_1810:
	fmovspos	%xcc,	%f4,	%f11
	fbe	%fcc1,	loop_1811
loop_1811:
	tneg	%icc,	0x1
	fandnot2	%f2,	%f6,	%f6
	fbo	%fcc0,	loop_1812
loop_1812:
	fba	%fcc1,	loop_1813
loop_1813:
	bn,a	%icc,	loop_1814
loop_1814:
	fbo	%fcc2,	loop_1815
loop_1815:
	fbu	%fcc3,	loop_1816
loop_1816:
	fbul	%fcc3,	loop_1817
loop_1817:
	orncc	%o4,	%g2,	%o2
	bge	loop_1818
loop_1818:
	ba,a	%xcc,	loop_1819
loop_1819:
	movneg	%icc,	%i1,	%i0
	ldsw	[%l7 + 0x4C],	%l5
	fnor	%f12,	%f2,	%f4
	nop
	setx loop_1820, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1820:
	ldub	[%l7 + 0x4B],	%g4
	fbne,a	%fcc3,	loop_1821
loop_1821:
	movvs	%xcc,	%i4,	%l0
	fba,a	%fcc3,	loop_1822
loop_1822:
	ldx	[%l7 + 0x68],	%o6
	ldub	[%l7 + 0x53],	%g7
	fbge,a	%fcc0,	loop_1823
loop_1823:
	fpack16	%f10,	%f14
	fandnot2	%f4,	%f4,	%f14
	st	%f7,	[%l7 + 0x14]
	fmovdle	%xcc,	%f1,	%f8
	fbne,a	%fcc3,	loop_1824
loop_1824:
	nop
	setx loop_1825, %l0, %l1
	jmpl %l1, %g3
loop_1825:
	bl	loop_1826
loop_1826:
	fors	%f13,	%f0,	%f5
	fmovscs	%xcc,	%f7,	%f0
	nop
	setx loop_1827, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1827:
	fpackfix	%f0,	%f4
	fone	%f6
	fbuge,a	%fcc0,	loop_1828
loop_1828:
	fpmerge	%f0,	%f5,	%f14
	fbug	%fcc1,	loop_1829
loop_1829:
	stw	%o1,	[%l7 + 0x08]
	stb	%g5,	[%l7 + 0x0A]
	fmovdcs	%xcc,	%f2,	%f12
	bshuffle	%f12,	%f8,	%f0
	fbug,a	%fcc2,	loop_1830
loop_1830:
	fbl,a	%fcc3,	loop_1831
loop_1831:
	bvc,a	loop_1832
loop_1832:
	fnot2s	%f7,	%f11
	fcmped	%fcc0,	%f12,	%f14
	fbu,a	%fcc2,	loop_1833
loop_1833:
	fone	%f2
	fmovsge	%icc,	%f12,	%f13
	fzero	%f0
	fnot1	%f8,	%f2
	bne,a,pn	%icc,	loop_1834
loop_1834:
	call	loop_1835
loop_1835:
	fmul8ulx16	%f2,	%f8,	%f2
	fandnot2s	%f4,	%f1,	%f11
	fmovrdgez	%l1,	%f2,	%f0
	brnz,a	%g1,	loop_1836
loop_1836:
	ld	[%l7 + 0x7C],	%f14
	fnegd	%f12,	%f14
	nop
	setx loop_1837, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1837:
	fmovsneg	%xcc,	%f5,	%f3
	bpos	loop_1838
loop_1838:
	fbg	%fcc3,	loop_1839
loop_1839:
	sub	%o3,	%i6,	%i7
	fabsd	%f10,	%f6
	lduh	[%l7 + 0x7A],	%i5
	brgez	%i2,	loop_1840
loop_1840:
	fmovsg	%xcc,	%f14,	%f10
	fmul8x16	%f3,	%f12,	%f2
	brgz,a	%g6,	loop_1841
loop_1841:
	bneg	loop_1842
loop_1842:
	fpadd32	%f4,	%f14,	%f4
	stw	%l2,	[%l7 + 0x58]
	bpos,a	loop_1843
loop_1843:
	sth	%o5,	[%l7 + 0x4E]
	brgez,a	%l6,	loop_1844
loop_1844:
	stb	%o0,	[%l7 + 0x52]
	fpackfix	%f2,	%f7
	bgu	%xcc,	loop_1845
loop_1845:
	fsrc1s	%f15,	%f1
	ble,pn	%xcc,	loop_1846
loop_1846:
	fmovscs	%icc,	%f14,	%f15
	brz	%o7,	loop_1847
loop_1847:
	fbge	%fcc2,	loop_1848
loop_1848:
	fmovrse	%i3,	%f15,	%f11
	ldub	[%l7 + 0x0D],	%l3
	fmovspos	%xcc,	%f4,	%f14
	be	%icc,	loop_1849
loop_1849:
	st	%f14,	[%l7 + 0x74]
	fbule,a	%fcc0,	loop_1850
loop_1850:
	fmovrdlz	%o4,	%f10,	%f12
	fbul	%fcc0,	loop_1851
loop_1851:
	fmovdne	%xcc,	%f12,	%f0
	fpsub32s	%f10,	%f2,	%f7
	fmovscc	%xcc,	%f0,	%f10
	fble	%fcc2,	loop_1852
loop_1852:
	fors	%f12,	%f5,	%f7
	fmovsle	%xcc,	%f7,	%f14
	fbe	%fcc2,	loop_1853
loop_1853:
	be,a	loop_1854
loop_1854:
	ldsh	[%l7 + 0x2A],	%g2
	fcmpne32	%f10,	%f6,	%o2
	fnot1s	%f13,	%f11
	bcs	loop_1855
loop_1855:
	movg	%xcc,	%l4,	%i0
	brz	%i1,	loop_1856
loop_1856:
	brlz	%l5,	loop_1857
loop_1857:
	fmovsa	%xcc,	%f9,	%f1
	be,a	loop_1858
loop_1858:
	call	loop_1859
loop_1859:
	bneg,pn	%icc,	loop_1860
loop_1860:
	brgez,a	%g4,	loop_1861
loop_1861:
	be,a	%icc,	loop_1862
loop_1862:
	fmovsleu	%icc,	%f3,	%f10
	bpos,a	loop_1863
loop_1863:
	brlez,a	%l0,	loop_1864
loop_1864:
	bg	%xcc,	loop_1865
loop_1865:
	lduw	[%l7 + 0x3C],	%i4
	fpadd16s	%f2,	%f6,	%f7
	bcs	%xcc,	loop_1866
loop_1866:
	fnands	%f3,	%f7,	%f3
	fpsub32s	%f10,	%f3,	%f4
	fpsub16s	%f3,	%f15,	%f3
	brlz	%g7,	loop_1867
loop_1867:
	fcmple16	%f14,	%f14,	%o6
	sdivcc	%g3,	0x0D8E,	%o1
	fbule,a	%fcc0,	loop_1868
loop_1868:
	fnot2s	%f14,	%f14
	fmovrde	%l1,	%f8,	%f8
	fbn	%fcc2,	loop_1869
loop_1869:
	fmovsn	%xcc,	%f12,	%f3
	fpack16	%f0,	%f5
	brgez,a	%g5,	loop_1870
loop_1870:
	fmovdneg	%icc,	%f12,	%f3
	ldub	[%l7 + 0x63],	%o3
	stx	%i6,	[%l7 + 0x38]
	bl,pt	%icc,	loop_1871
loop_1871:
	nop
	setx loop_1872, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1872:
	fbug	%fcc0,	loop_1873
loop_1873:
	fmovsl	%icc,	%f3,	%f10
	fnegs	%f4,	%f1
	bcc	%icc,	loop_1874
loop_1874:
	fbge	%fcc1,	loop_1875
loop_1875:
	fmul8ulx16	%f14,	%f12,	%f0
	nop
	setx loop_1876, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1876:
	fmul8x16au	%f11,	%f2,	%f8
	be	%xcc,	loop_1877
loop_1877:
	bpos	loop_1878
loop_1878:
	fbe,a	%fcc3,	loop_1879
loop_1879:
	fcmps	%fcc2,	%f3,	%f15
	fmovs	%f2,	%f4
	call	loop_1880
loop_1880:
	bl,pn	%icc,	loop_1881
loop_1881:
	popc	%g1,	%i5
	brlez,a	%i7,	loop_1882
loop_1882:
	fbuge,a	%fcc2,	loop_1883
loop_1883:
	fcmple16	%f8,	%f10,	%i2
	bcc,pn	%icc,	loop_1884
loop_1884:
	fbule	%fcc2,	loop_1885
loop_1885:
	fbo	%fcc0,	loop_1886
loop_1886:
	fbne	%fcc1,	loop_1887
loop_1887:
	ld	[%l7 + 0x3C],	%f10
	be,a,pt	%icc,	loop_1888
loop_1888:
	fpsub32	%f8,	%f12,	%f0
	fbue	%fcc3,	loop_1889
loop_1889:
	brz,a	%g6,	loop_1890
loop_1890:
	fmovdvc	%icc,	%f6,	%f1
	bleu,pt	%xcc,	loop_1891
loop_1891:
	fbne,a	%fcc2,	loop_1892
loop_1892:
	ldub	[%l7 + 0x0E],	%o5
	fsrc2	%f14,	%f6
	fbul	%fcc3,	loop_1893
loop_1893:
	fornot2s	%f5,	%f1,	%f14
	fcmpes	%fcc2,	%f3,	%f13
	movpos	%xcc,	%l6,	%l2
	bneg,pt	%icc,	loop_1894
loop_1894:
	brnz,a	%o7,	loop_1895
loop_1895:
	bge,pn	%icc,	loop_1896
loop_1896:
	ba,pt	%icc,	loop_1897
loop_1897:
	fbue,a	%fcc0,	loop_1898
loop_1898:
	bl	loop_1899
loop_1899:
	fones	%f0
	fxnors	%f14,	%f9,	%f9
	fmovrse	%i3,	%f11,	%f4
	bn,a	loop_1900
loop_1900:
	brlz,a	%o0,	loop_1901
loop_1901:
	nop
	setx loop_1902, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1902:
	fmul8x16au	%f10,	%f8,	%f4
	fbl,a	%fcc3,	loop_1903
loop_1903:
	fexpand	%f6,	%f10
	for	%f0,	%f10,	%f10
	fbe	%fcc1,	loop_1904
loop_1904:
	bpos	loop_1905
loop_1905:
	bcs,a	loop_1906
loop_1906:
	fxor	%f4,	%f14,	%f14
	fnegd	%f0,	%f8
	fmovsleu	%icc,	%f10,	%f13
	bleu,a	%icc,	loop_1907
loop_1907:
	fblg,a	%fcc2,	loop_1908
loop_1908:
	fcmpeq16	%f0,	%f0,	%l3
	fbule	%fcc3,	loop_1909
loop_1909:
	fmul8x16	%f5,	%f8,	%f6
	stb	%o4,	[%l7 + 0x34]
	fxors	%f9,	%f12,	%f6
	fbe,a	%fcc1,	loop_1910
loop_1910:
	bl,a,pn	%icc,	loop_1911
loop_1911:
	fbu,a	%fcc0,	loop_1912
loop_1912:
	fcmple32	%f10,	%f2,	%o2
	fmovdle	%xcc,	%f15,	%f6
	mova	%icc,	%l4,	%g2
	faligndata	%f14,	%f8,	%f8
	ldsb	[%l7 + 0x29],	%i0
	fbue	%fcc1,	loop_1913
loop_1913:
	fbne,a	%fcc2,	loop_1914
loop_1914:
	fnand	%f10,	%f2,	%f8
	fmovrsgez	%l5,	%f14,	%f1
	nop
	setx loop_1915, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1915:
	fmovdcc	%icc,	%f0,	%f11
	fba	%fcc3,	loop_1916
loop_1916:
	bpos,a,pt	%icc,	loop_1917
loop_1917:
	brz,a	%i1,	loop_1918
loop_1918:
	fmovscc	%icc,	%f11,	%f1
	fmovrdgz	%l0,	%f0,	%f14
	fnot1	%f2,	%f0
	movpos	%icc,	%i4,	%g7
	stx	%o6,	[%l7 + 0x10]
	sth	%g3,	[%l7 + 0x32]
	fmovrslz	%o1,	%f4,	%f2
	fmovsne	%xcc,	%f13,	%f12
	fmovrslez	%l1,	%f11,	%f1
	fbo	%fcc1,	loop_1919
loop_1919:
	fmovsne	%xcc,	%f14,	%f8
	bgu,a,pt	%icc,	loop_1920
loop_1920:
	fornot1	%f6,	%f12,	%f10
	brgez	%g4,	loop_1921
loop_1921:
	brlez	%o3,	loop_1922
loop_1922:
	fpsub16	%f12,	%f8,	%f12
	fbge,a	%fcc1,	loop_1923
loop_1923:
	bn	loop_1924
loop_1924:
	fba,a	%fcc3,	loop_1925
loop_1925:
	fmovdle	%icc,	%f6,	%f15
	ba	loop_1926
loop_1926:
	fbne	%fcc3,	loop_1927
loop_1927:
	fcmpne32	%f4,	%f2,	%g5
	fpsub32s	%f15,	%f11,	%f0
	fandnot1	%f0,	%f2,	%f0
	bvs,pn	%icc,	loop_1928
loop_1928:
	fmovrdne	%i6,	%f4,	%f4
	ba,a,pn	%icc,	loop_1929
loop_1929:
	fbo,a	%fcc0,	loop_1930
loop_1930:
	fmovrdne	%i5,	%f12,	%f10
	fbn,a	%fcc1,	loop_1931
loop_1931:
	fpadd16	%f10,	%f12,	%f12
	st	%f4,	[%l7 + 0x30]
	fbule	%fcc1,	loop_1932
loop_1932:
	fabss	%f4,	%f0
	fbg	%fcc1,	loop_1933
loop_1933:
	fornot1	%f2,	%f8,	%f14
	fnegd	%f0,	%f4
	fnot2	%f2,	%f12
	nop
	setx loop_1934, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1934:
	fmovdvs	%icc,	%f14,	%f11
	lduw	[%l7 + 0x38],	%i7
	fnot2s	%f10,	%f6
	bl	%icc,	loop_1935
loop_1935:
	bvc	%icc,	loop_1936
loop_1936:
	fbg	%fcc1,	loop_1937
loop_1937:
	brlez	%i2,	loop_1938
loop_1938:
	brgz,a	%g1,	loop_1939
loop_1939:
	fcmple16	%f10,	%f0,	%o5
	bleu,pt	%icc,	loop_1940
loop_1940:
	taddcc	%g6,	%l2,	%l6
	fbug,a	%fcc2,	loop_1941
loop_1941:
	fabss	%f14,	%f12
	fmovsgu	%icc,	%f9,	%f12
	stx	%i3,	[%l7 + 0x78]
	brz	%o0,	loop_1942
loop_1942:
	std	%f0,	[%l7 + 0x28]
	brz	%o7,	loop_1943
loop_1943:
	fble,a	%fcc3,	loop_1944
loop_1944:
	movre	%l3,	0x3A6,	%o4
	nop
	setx loop_1945, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1945:
	fabsd	%f2,	%f0
	fmovrdne	%l4,	%f10,	%f0
	ld	[%l7 + 0x24],	%f11
	fmovsn	%icc,	%f2,	%f15
	fmovsvc	%xcc,	%f1,	%f11
	fbge	%fcc3,	loop_1946
loop_1946:
	bne,a	%xcc,	loop_1947
loop_1947:
	fnor	%f14,	%f4,	%f6
	fbug,a	%fcc2,	loop_1948
loop_1948:
	lduh	[%l7 + 0x08],	%o2
	fmovdvs	%xcc,	%f4,	%f12
	fbn,a	%fcc0,	loop_1949
loop_1949:
	ldsh	[%l7 + 0x64],	%g2
	bcs,a,pt	%xcc,	loop_1950
loop_1950:
	fmovrdlz	%i0,	%f10,	%f14
	fmovd	%f10,	%f14
	fzeros	%f8
	fmovdn	%icc,	%f3,	%f4
	fornot1s	%f0,	%f10,	%f4
	call	loop_1951
loop_1951:
	fbo	%fcc3,	loop_1952
loop_1952:
	fcmped	%fcc2,	%f0,	%f6
	fmovsg	%icc,	%f5,	%f10
	ble,a	%icc,	loop_1953
loop_1953:
	nop
	setx loop_1954, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1954:
	ba	loop_1955
loop_1955:
	fbule	%fcc0,	loop_1956
loop_1956:
	fmul8ulx16	%f2,	%f4,	%f12
	fxnors	%f0,	%f14,	%f14
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type f   	: 399
!	Type i   	: 46
!	Type cti   	: 466
!	Type l   	: 89
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x3B7D6784
.word 0xA33913BE
.word 0x8D3B2538
.word 0x728EE04C
.word 0xD3CFD8C0
.word 0x9ED6D394
.word 0x4DF4087F
.word 0x89F518E8
.word 0x880EEA51
.word 0x6514DBAA
.word 0x63FEC58D
.word 0x66FB4BC5
.word 0x689B9465
.word 0x0C69D43C
.word 0xB766D813
.word 0x14DAE992
.word 0x85DCB240
.word 0xB96440E6
.word 0x58E73060
.word 0x88E232C5
.word 0x01C7DB40
.word 0xF7B9F0DF
.word 0xFDA907C6
.word 0x640F0292
.word 0x72146544
.word 0xE849453B
.word 0x75AA107F
.word 0xD298077F
.word 0xE6309460
.word 0x0F8A28FA
.word 0x8891BDFE
.word 0x7A59EF7C
.word 0xD1B3EA91
.word 0xB6A043AD
.word 0x03954F2E
.word 0x1FF05C35
.word 0x5824DF40
.word 0x4805B1A5
.word 0x623F225F
.word 0x176CE203
.word 0x4DBECBA0
.word 0x74E32998
.word 0x3F362CAF
.word 0x61EC9345
.word 0x7B0EED46
.word 0x8BD82756
.word 0x20C191DA
.word 0x81470DB7
.word 0xD6317DAE
.word 0x741AA905
.word 0x99C50258
.word 0x0ECA478F
.word 0xF28112F5
.word 0x99D8F407
.word 0x92DB40E0
.word 0x54E7CEF6
.word 0x9EA0F584
.word 0x91C34FF7
.word 0xB297E14E
.word 0xE80C5AC1
.word 0xC0368F37
.word 0xCB08CE96
.word 0xB869B88A
.word 0x2A41B898
.end
