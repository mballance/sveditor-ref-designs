/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_isa2mt_fail_fc_11.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa2.pl FOCUS_SEED=164301366"
.ident "BY somePerson ON Mon Aug  4 10:33:27 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: spc_isa2mt_fail_fc_11.s,v 1.3 2007/07/05 22:02:04 drp Exp $"
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
	set	0x0,	%g1
	set	0x7,	%g2
	set	0xB,	%g3
	set	0xB,	%g4
	set	0x4,	%g5
	set	0x4,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x7,	%i1
	set	-0x5,	%i2
	set	-0xC,	%i3
	set	-0x3,	%i4
	set	-0xA,	%i5
	set	-0x9,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x5CFAF985,	%l0
	set	0x03421EA3,	%l1
	set	0x58E2E93C,	%l2
	set	0x11A7990F,	%l3
	set	0x3A4A7063,	%l4
	set	0x69DA4BB3,	%l5
	set	0x2DAF6528,	%l6
	!# Output registers
	set	0x0208,	%o0
	set	0x1984,	%o1
	set	0x0DC9,	%o2
	set	-0x13FC,	%o3
	set	0x06DC,	%o4
	set	-0x02CF,	%o5
	set	-0x0B9A,	%o6
	set	-0x06B9,	%o7

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

	edge16n	%o0,	%g2,	%o1
	fmovrslez	%l6,	%f6,	%f13
	lduh	[%l7 + 0x28],	%l0
	fbule,a	%fcc0,	loop_1
loop_1:
	bgu,pt	%icc,	loop_2
loop_2:
	orncc	%o4,	0x0558,	%l3
	stx	%l5,	[%l7 + 0x38]
	sdivx	%l2,	0x13A9,	%l4
	lduh	[%l7 + 0x26],	%g3
	udivcc	%g1,	0x19D2,	%g5
	sdivx	%i0,	0x18D3,	%i5
	bcc,a	loop_3
loop_3:
	ldx	[%l7 + 0x68],	%o5
	movpos	%icc,	%g4,	%o6
	st	%f0,	[%l7 + 0x4C]
	tle	%xcc,	0x5
	lduh	[%l7 + 0x32],	%g7
	sdiv	%i7,	0x01AD,	%i3
	ba	loop_4
loop_4:
	fbule,a	%fcc1,	loop_5
loop_5:
	srax	%i4,	0x12,	%o7
	brgez,a	%o3,	loop_6
loop_6:
	tg	%icc,	0x4
	or	%i2,	%g6,	%l1
	sdivx	%o2,	0x0E38,	%i1
	ldub	[%l7 + 0x6D],	%i6
	fbl,a	%fcc0,	loop_7
loop_7:
	fmovsa	%xcc,	%f12,	%f2
	nop
	setx loop_8, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_8:
	stw	%o0,	[%l7 + 0x78]
	nop
	setx loop_9, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_9:
	srax	%o1,	%g2,	%l0
	lduw	[%l7 + 0x48],	%o4
	edge16	%l6,	%l5,	%l2
	ldsb	[%l7 + 0x18],	%l4
	std	%f6,	[%l7 + 0x08]
	movn	%xcc,	%g3,	%g1
	array16	%l3,	%g5,	%i5
	srax	%i0,	0x14,	%g4
	fpsub16s	%f15,	%f9,	%f13
	ldsw	[%l7 + 0x24],	%o6
	fabsd	%f2,	%f6
	ldsh	[%l7 + 0x42],	%o5
	be,a,pn	%xcc,	loop_10
loop_10:
	fbue,a	%fcc2,	loop_11
loop_11:
	fbn	%fcc1,	loop_12
loop_12:
	movl	%icc,	%i7,	%g7
	te	%xcc,	0x7
	ldd	[%l7 + 0x70],	%f8
	fbn	%fcc2,	loop_13
loop_13:
	fcmped	%fcc3,	%f8,	%f2
	ldd	[%l7 + 0x28],	%f2
	ldx	[%l7 + 0x48],	%i3
	st	%f13,	[%l7 + 0x54]
	stx	%o7,	[%l7 + 0x48]
	smulcc	%i4,	0x0042,	%o3
	bne,a,pt	%xcc,	loop_14
loop_14:
	fblg,a	%fcc0,	loop_15
loop_15:
	stx	%g6,	[%l7 + 0x40]
	brgz	%i2,	loop_16
loop_16:
	umulcc	%l1,	0x0E3E,	%o2
	brnz,a	%i1,	loop_17
loop_17:
	fpack32	%f6,	%f14,	%f12
	sdiv	%o0,	0x0BCF,	%o1
	tg	%xcc,	0x3
	ldub	[%l7 + 0x45],	%i6
	ld	[%l7 + 0x64],	%f15
	edge32	%l0,	%o4,	%l6
	ba,a,pn	%xcc,	loop_18
loop_18:
	std	%f12,	[%l7 + 0x10]
	be,a,pn	%icc,	loop_19
loop_19:
	lduh	[%l7 + 0x36],	%l5
	smulcc	%l2,	0x198C,	%g2
	sth	%l4,	[%l7 + 0x18]
	bne	%icc,	loop_20
loop_20:
	subcc	%g1,	%g3,	%l3
	movn	%icc,	%i5,	%i0
	movvc	%xcc,	%g4,	%g5
	fbue	%fcc2,	loop_21
loop_21:
	movg	%icc,	%o6,	%i7
	movrgez	%g7,	%i3,	%o7
	stx	%i4,	[%l7 + 0x10]
	fmovdg	%xcc,	%f0,	%f3
	stb	%o5,	[%l7 + 0x09]
	bvs,pn	%xcc,	loop_22
loop_22:
	movrgez	%g6,	%i2,	%o3
	sllx	%o2,	0x19,	%l1
	ldsw	[%l7 + 0x1C],	%i1
	movleu	%icc,	%o1,	%i6
	tn	%icc,	0x3
	fbule	%fcc2,	loop_23
loop_23:
	andncc	%l0,	%o4,	%o0
	tsubcc	%l6,	%l5,	%g2
	add	%l2,	%g1,	%l4
	std	%f0,	[%l7 + 0x68]
	fmovd	%f14,	%f10
	fnor	%f0,	%f0,	%f0
	ld	[%l7 + 0x5C],	%f11
	fmovrsgz	%g3,	%f6,	%f8
	ldx	[%l7 + 0x28],	%i5
	brnz	%l3,	loop_24
loop_24:
	ldsh	[%l7 + 0x0C],	%g4
	fbo	%fcc3,	loop_25
loop_25:
	fandnot2s	%f13,	%f6,	%f7
	ldub	[%l7 + 0x6C],	%g5
	stw	%i0,	[%l7 + 0x1C]
	fbo	%fcc0,	loop_26
loop_26:
	mulscc	%o6,	0x0D9B,	%i7
	ld	[%l7 + 0x34],	%f14
	orn	%g7,	%i3,	%i4
	fornot1	%f6,	%f14,	%f12
	lduw	[%l7 + 0x34],	%o7
	ldsh	[%l7 + 0x66],	%g6
	tl	%icc,	0x1
	fmul8x16	%f7,	%f0,	%f14
	move	%xcc,	%i2,	%o3
	fbuge	%fcc1,	loop_27
loop_27:
	ldsw	[%l7 + 0x28],	%o2
	popc	0x19ED,	%o5
	stx	%i1,	[%l7 + 0x38]
	fmul8x16al	%f12,	%f15,	%f0
	orcc	%o1,	%i6,	%l1
	bvc	loop_28
loop_28:
	nop
	setx loop_29, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_29:
	ldub	[%l7 + 0x5A],	%o4
	fpack32	%f2,	%f10,	%f14
	fmovsgu	%icc,	%f9,	%f9
	fbe,a	%fcc3,	loop_30
loop_30:
	fzero	%f14
	fmovsa	%xcc,	%f4,	%f10
	ldub	[%l7 + 0x4B],	%o0
	mulscc	%l6,	%l0,	%g2
	edge16l	%l5,	%l2,	%g1
	sll	%g3,	%i5,	%l4
	fbo,a	%fcc2,	loop_31
loop_31:
	fnor	%f4,	%f0,	%f2
	ldsh	[%l7 + 0x6C],	%l3
	fmovdge	%xcc,	%f10,	%f1
	srlx	%g5,	%g4,	%i0
	add	%o6,	%i7,	%g7
	movge	%xcc,	%i3,	%i4
	andn	%o7,	%g6,	%i2
	movvc	%xcc,	%o3,	%o5
	lduh	[%l7 + 0x5A],	%i1
	smul	%o1,	0x175D,	%o2
	fcmpne32	%f12,	%f4,	%i6
	bpos,a,pn	%icc,	loop_32
loop_32:
	ldd	[%l7 + 0x20],	%f0
	bge	%xcc,	loop_33
loop_33:
	addcc	%l1,	%o4,	%o0
	fpack32	%f6,	%f14,	%f0
	lduh	[%l7 + 0x10],	%l6
	add	%g2,	%l0,	%l2
	ld	[%l7 + 0x38],	%f10
	fbe,a	%fcc2,	loop_34
loop_34:
	ldsh	[%l7 + 0x34],	%l5
	bleu,a,pn	%xcc,	loop_35
loop_35:
	alignaddr	%g1,	%i5,	%l4
	fbule	%fcc0,	loop_36
loop_36:
	ldub	[%l7 + 0x16],	%l3
	array32	%g3,	%g5,	%i0
	nop
	setx loop_37, %l0, %l1
	jmpl %l1, %o6
loop_37:
	bl,a,pt	%icc,	loop_38
loop_38:
	edge32n	%i7,	%g4,	%g7
	udiv	%i3,	0x0627,	%o7
	ldx	[%l7 + 0x68],	%i4
	fcmpeq16	%f2,	%f6,	%g6
	fmovdvs	%icc,	%f13,	%f14
	edge32l	%i2,	%o5,	%i1
	fnands	%f14,	%f1,	%f5
	fbule	%fcc2,	loop_39
loop_39:
	fmovdleu	%xcc,	%f4,	%f13
	bn,a	loop_40
loop_40:
	add	%o1,	0x1DA4,	%o2
	sllx	%i6,	%l1,	%o3
	bge,a	loop_41
loop_41:
	sth	%o4,	[%l7 + 0x1C]
	fbg,a	%fcc1,	loop_42
loop_42:
	tle	%icc,	0x4
	brnz,a	%l6,	loop_43
loop_43:
	stw	%g2,	[%l7 + 0x40]
	stx	%l0,	[%l7 + 0x38]
	fbo	%fcc3,	loop_44
loop_44:
	bge,a	loop_45
loop_45:
	tcc	%icc,	0x1
	fbg	%fcc2,	loop_46
loop_46:
	fsrc1s	%f14,	%f2
	fbu	%fcc1,	loop_47
loop_47:
	fmovsgu	%icc,	%f10,	%f14
	bn	loop_48
loop_48:
	srlx	%o0,	0x12,	%l2
	ldd	[%l7 + 0x28],	%f12
	movg	%icc,	%l5,	%g1
	ldx	[%l7 + 0x08],	%l4
	movge	%icc,	%i5,	%l3
	ldsw	[%l7 + 0x18],	%g5
	movn	%xcc,	%g3,	%o6
	std	%f6,	[%l7 + 0x28]
	movvs	%icc,	%i7,	%g4
	sth	%g7,	[%l7 + 0x7C]
	tvs	%icc,	0x0
	ldsh	[%l7 + 0x2E],	%i3
	edge16l	%i0,	%i4,	%g6
	and	%o7,	0x1A0A,	%o5
	array8	%i1,	%i2,	%o1
	bvc	%icc,	loop_49
loop_49:
	sll	%i6,	0x1D,	%o2
	ldx	[%l7 + 0x50],	%l1
	movvs	%xcc,	%o4,	%o3
	ta	%icc,	0x3
	fcmpne32	%f0,	%f10,	%g2
	bg,a	%icc,	loop_50
loop_50:
	te	%icc,	0x5
	fble	%fcc0,	loop_51
loop_51:
	popc	0x0162,	%l6
	edge16ln	%l0,	%o0,	%l5
	fbl	%fcc0,	loop_52
loop_52:
	lduh	[%l7 + 0x14],	%l2
	edge16ln	%l4,	%i5,	%g1
	fbl	%fcc1,	loop_53
loop_53:
	tgu	%xcc,	0x4
	bge,a,pn	%xcc,	loop_54
loop_54:
	taddcctv	%g5,	%l3,	%g3
	tneg	%xcc,	0x5
	sth	%i7,	[%l7 + 0x12]
	mulx	%g4,	0x1D4F,	%g7
	fmovspos	%xcc,	%f2,	%f8
	edge32n	%i3,	%o6,	%i4
	movpos	%icc,	%g6,	%o7
	fmovdleu	%icc,	%f1,	%f6
	edge32	%o5,	%i1,	%i2
	ldsw	[%l7 + 0x44],	%i0
	bcs,pn	%xcc,	loop_55
loop_55:
	ldsb	[%l7 + 0x1D],	%i6
	bleu	loop_56
loop_56:
	ldsh	[%l7 + 0x7A],	%o1
	tsubcc	%o2,	0x1B9C,	%o4
	ldsh	[%l7 + 0x7C],	%l1
	array8	%g2,	%l6,	%l0
	tl	%xcc,	0x5
	lduw	[%l7 + 0x38],	%o3
	movre	%o0,	0x33F,	%l5
	ldsw	[%l7 + 0x30],	%l4
	tpos	%icc,	0x6
	st	%f2,	[%l7 + 0x10]
	addc	%i5,	0x1EE1,	%g1
	fmul8x16au	%f6,	%f4,	%f6
	lduh	[%l7 + 0x1E],	%l2
	tl	%icc,	0x4
	ldsw	[%l7 + 0x0C],	%g5
	brlz	%g3,	loop_57
loop_57:
	brlz	%i7,	loop_58
loop_58:
	tsubcctv	%l3,	0x091B,	%g7
	fone	%f8
	or	%i3,	0x09DE,	%g4
	brgez	%i4,	loop_59
loop_59:
	movre	%o6,	0x280,	%g6
	addcc	%o5,	%o7,	%i1
	fnot1	%f8,	%f8
	lduh	[%l7 + 0x0C],	%i0
	taddcctv	%i6,	%o1,	%i2
	ldsb	[%l7 + 0x5D],	%o4
	edge16n	%o2,	%g2,	%l6
	sth	%l0,	[%l7 + 0x0A]
	fmovrdlz	%o3,	%f10,	%f12
	bcc,pt	%icc,	loop_60
loop_60:
	srlx	%o0,	0x17,	%l5
	andncc	%l4,	%i5,	%g1
	mulx	%l1,	%g5,	%l2
	fmovrsgz	%g3,	%f13,	%f10
	umulcc	%i7,	%g7,	%l3
	fbuge,a	%fcc2,	loop_61
loop_61:
	movcs	%xcc,	%i3,	%i4
	movgu	%xcc,	%g4,	%o6
	ba,pt	%xcc,	loop_62
loop_62:
	xorcc	%g6,	0x172C,	%o5
	addcc	%i1,	%i0,	%i6
	fbo	%fcc3,	loop_63
loop_63:
	lduh	[%l7 + 0x18],	%o7
	sdiv	%o1,	0x0544,	%o4
	tle	%xcc,	0x3
	call	loop_64
loop_64:
	sth	%o2,	[%l7 + 0x7C]
	bg,pt	%xcc,	loop_65
loop_65:
	bneg	loop_66
loop_66:
	ldx	[%l7 + 0x60],	%i2
	nop
	setx loop_67, %l0, %l1
	jmpl %l1, %l6
loop_67:
	movg	%icc,	%g2,	%o3
	fba,a	%fcc1,	loop_68
loop_68:
	fmovse	%icc,	%f2,	%f11
	tsubcctv	%o0,	0x14EB,	%l5
	sth	%l4,	[%l7 + 0x32]
	edge32	%l0,	%g1,	%l1
	tg	%xcc,	0x5
	lduh	[%l7 + 0x5C],	%g5
	fnot2	%f14,	%f6
	fbe,a	%fcc3,	loop_69
loop_69:
	bgu	%xcc,	loop_70
loop_70:
	brgz	%l2,	loop_71
loop_71:
	ldsh	[%l7 + 0x64],	%i5
	addcc	%i7,	%g7,	%g3
	brgz,a	%l3,	loop_72
loop_72:
	fcmps	%fcc0,	%f5,	%f12
	edge8n	%i4,	%i3,	%g4
	sth	%o6,	[%l7 + 0x26]
	ldub	[%l7 + 0x6E],	%g6
	movle	%xcc,	%i1,	%o5
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
	ldx	[%l7 + 0x68],	%i6
	tsubcctv	%i0,	0x1297,	%o7
	bpos,a,pt	%xcc,	loop_74
loop_74:
	array8	%o1,	%o4,	%o2
	subc	%i2,	0x0EB7,	%l6
	andn	%g2,	%o0,	%l5
	stw	%l4,	[%l7 + 0x74]
	taddcctv	%l0,	%g1,	%o3
	edge32	%l1,	%g5,	%l2
	fmovsge	%icc,	%f2,	%f13
	srax	%i7,	%i5,	%g7
	sra	%g3,	0x0A,	%i4
	fmovdl	%xcc,	%f12,	%f10
	std	%f10,	[%l7 + 0x78]
	lduh	[%l7 + 0x60],	%l3
	ldsw	[%l7 + 0x10],	%i3
	bvs,a,pt	%icc,	loop_75
loop_75:
	tge	%icc,	0x7
	stx	%o6,	[%l7 + 0x50]
	ldub	[%l7 + 0x45],	%g4
	addc	%g6,	0x0EEB,	%i1
	movge	%icc,	%i6,	%o5
	bpos,pt	%xcc,	loop_76
loop_76:
	stb	%i0,	[%l7 + 0x40]
	bne,a,pn	%icc,	loop_77
loop_77:
	std	%f14,	[%l7 + 0x10]
	ldsh	[%l7 + 0x64],	%o1
	fzeros	%f12
	bne	%xcc,	loop_78
loop_78:
	fbo,a	%fcc3,	loop_79
loop_79:
	fmul8ulx16	%f0,	%f12,	%f6
	nop
	setx loop_80, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_80:
	ldx	[%l7 + 0x68],	%o4
	brgz,a	%o7,	loop_81
loop_81:
	fabsd	%f2,	%f12
	smulcc	%i2,	0x07A2,	%l6
	stw	%g2,	[%l7 + 0x30]
	ldsh	[%l7 + 0x28],	%o2
	fbe,a	%fcc1,	loop_82
loop_82:
	edge32	%o0,	%l4,	%l0
	brgz,a	%g1,	loop_83
loop_83:
	bpos,a	loop_84
loop_84:
	fbne,a	%fcc2,	loop_85
loop_85:
	smulcc	%o3,	%l5,	%g5
	stw	%l1,	[%l7 + 0x18]
	fbule	%fcc2,	loop_86
loop_86:
	tvc	%xcc,	0x5
	ldx	[%l7 + 0x68],	%l2
	stx	%i7,	[%l7 + 0x08]
	tsubcc	%g7,	%i5,	%g3
	fnot2s	%f14,	%f14
	xnorcc	%l3,	%i3,	%i4
	fbne,a	%fcc0,	loop_87
loop_87:
	bgu	%icc,	loop_88
loop_88:
	ldub	[%l7 + 0x0C],	%g4
	movrlz	%g6,	%i1,	%o6
	tcs	%xcc,	0x5
	ldub	[%l7 + 0x6A],	%o5
	sth	%i6,	[%l7 + 0x60]
	tne	%xcc,	0x4
	tl	%icc,	0x6
	brgez,a	%o1,	loop_89
loop_89:
	array32	%i0,	%o7,	%i2
	lduw	[%l7 + 0x50],	%l6
	stw	%g2,	[%l7 + 0x3C]
	lduw	[%l7 + 0x70],	%o2
	movrlz	%o0,	0x1AD,	%l4
	fornot1	%f12,	%f6,	%f6
	fmovdneg	%xcc,	%f12,	%f8
	nop
	setx loop_90, %l0, %l1
	jmpl %l1, %o4
loop_90:
	ldd	[%l7 + 0x48],	%f14
	fmovrdlez	%g1,	%f10,	%f0
	alignaddrl	%l0,	%o3,	%g5
	st	%f6,	[%l7 + 0x10]
	ldsb	[%l7 + 0x75],	%l1
	xor	%l5,	%l2,	%g7
	array16	%i7,	%g3,	%i5
	fbg	%fcc2,	loop_91
loop_91:
	sth	%l3,	[%l7 + 0x20]
	bl	loop_92
loop_92:
	fmovdneg	%icc,	%f8,	%f14
	ldsw	[%l7 + 0x0C],	%i4
	ldsb	[%l7 + 0x3F],	%i3
	ldub	[%l7 + 0x62],	%g4
	bshuffle	%f0,	%f0,	%f0
	stb	%i1,	[%l7 + 0x34]
	st	%f15,	[%l7 + 0x4C]
	std	%f6,	[%l7 + 0x78]
	stb	%o6,	[%l7 + 0x1B]
	ldd	[%l7 + 0x10],	%f4
	tn	%xcc,	0x1
	edge32l	%o5,	%i6,	%g6
	ldsb	[%l7 + 0x52],	%o1
	ldsb	[%l7 + 0x3E],	%i0
	fpadd16	%f2,	%f14,	%f8
	stb	%o7,	[%l7 + 0x61]
	addccc	%i2,	%g2,	%o2
	ldd	[%l7 + 0x70],	%f8
	stx	%o0,	[%l7 + 0x68]
	brgez	%l4,	loop_93
loop_93:
	ldsw	[%l7 + 0x18],	%l6
	stw	%o4,	[%l7 + 0x54]
	addc	%g1,	%l0,	%g5
	fornot2	%f10,	%f0,	%f0
	move	%icc,	%l1,	%o3
	stb	%l2,	[%l7 + 0x1E]
	stw	%g7,	[%l7 + 0x3C]
	sdivcc	%i7,	0x04A3,	%l5
	edge16n	%g3,	%l3,	%i4
	call	loop_94
loop_94:
	addc	%i3,	%g4,	%i5
	ldub	[%l7 + 0x4E],	%o6
	alignaddr	%o5,	%i6,	%i1
	bpos,pn	%xcc,	loop_95
loop_95:
	std	%f2,	[%l7 + 0x10]
	fble	%fcc0,	loop_96
loop_96:
	taddcctv	%o1,	0x1BEA,	%g6
	udivx	%o7,	0x19FE,	%i2
	fbu	%fcc0,	loop_97
loop_97:
	ldsw	[%l7 + 0x08],	%g2
	movre	%o2,	%o0,	%i0
	fnegs	%f9,	%f12
	ldsb	[%l7 + 0x47],	%l4
	fble	%fcc3,	loop_98
loop_98:
	tn	%xcc,	0x0
	stx	%o4,	[%l7 + 0x60]
	tneg	%xcc,	0x4
	fbn	%fcc1,	loop_99
loop_99:
	brgez	%g1,	loop_100
loop_100:
	xnorcc	%l0,	%l6,	%l1
	edge32l	%o3,	%l2,	%g5
	stw	%g7,	[%l7 + 0x5C]
	ba,a,pt	%xcc,	loop_101
loop_101:
	ldd	[%l7 + 0x08],	%f0
	sub	%i7,	%l5,	%g3
	edge8l	%i4,	%l3,	%g4
	ldub	[%l7 + 0x4B],	%i3
	edge16	%i5,	%o5,	%o6
	fors	%f4,	%f3,	%f2
	stx	%i6,	[%l7 + 0x38]
	stb	%o1,	[%l7 + 0x3D]
	bneg	loop_102
loop_102:
	fmuld8sux16	%f12,	%f1,	%f0
	ldsb	[%l7 + 0x08],	%i1
	mova	%xcc,	%o7,	%g6
	and	%g2,	%o2,	%i2
	movpos	%icc,	%o0,	%i0
	bvc,a	%icc,	loop_103
loop_103:
	ldx	[%l7 + 0x48],	%o4
	stw	%g1,	[%l7 + 0x6C]
	bleu	loop_104
loop_104:
	movrlez	%l0,	%l6,	%l1
	stw	%o3,	[%l7 + 0x4C]
	ldsb	[%l7 + 0x6D],	%l2
	ldx	[%l7 + 0x70],	%l4
	tl	%icc,	0x4
	ld	[%l7 + 0x14],	%f0
	stb	%g5,	[%l7 + 0x6D]
	smul	%i7,	%l5,	%g3
	std	%f0,	[%l7 + 0x68]
	ldsb	[%l7 + 0x68],	%i4
	stb	%g7,	[%l7 + 0x36]
	fbe,a	%fcc0,	loop_105
loop_105:
	nop
	setx loop_106, %l0, %l1
	jmpl %l1, %g4
loop_106:
	ldub	[%l7 + 0x62],	%i3
	fmovdvc	%icc,	%f3,	%f2
	lduw	[%l7 + 0x44],	%i5
	sethi	0x010B,	%o5
	ldsh	[%l7 + 0x48],	%l3
	bn	loop_107
loop_107:
	mulx	%i6,	0x0A79,	%o1
	srlx	%i1,	%o7,	%g6
	st	%f3,	[%l7 + 0x18]
	stx	%g2,	[%l7 + 0x20]
	fbn,a	%fcc2,	loop_108
loop_108:
	stb	%o6,	[%l7 + 0x0C]
	fbne,a	%fcc2,	loop_109
loop_109:
	stw	%o2,	[%l7 + 0x24]
	stx	%o0,	[%l7 + 0x38]
	movleu	%xcc,	%i2,	%i0
	smulcc	%o4,	%l0,	%l6
	fmuld8sux16	%f9,	%f13,	%f8
	movgu	%icc,	%g1,	%o3
	tl	%icc,	0x6
	ldub	[%l7 + 0x73],	%l1
	srl	%l2,	%g5,	%i7
	smul	%l5,	%l4,	%g3
	stx	%i4,	[%l7 + 0x08]
	addcc	%g4,	0x0EC9,	%i3
	fmovsgu	%xcc,	%f1,	%f11
	fbue	%fcc2,	loop_110
loop_110:
	fnot1s	%f3,	%f12
	nop
	setx loop_111, %l0, %l1
	jmpl %l1, %g7
loop_111:
	bcc,pt	%xcc,	loop_112
loop_112:
	sdivx	%o5,	0x00C1,	%i5
	fcmpes	%fcc2,	%f1,	%f9
	xnorcc	%i6,	%l3,	%o1
	fbue	%fcc0,	loop_113
loop_113:
	array16	%i1,	%g6,	%g2
	lduw	[%l7 + 0x70],	%o6
	stx	%o7,	[%l7 + 0x50]
	stx	%o0,	[%l7 + 0x20]
	fbne	%fcc1,	loop_114
loop_114:
	st	%f14,	[%l7 + 0x48]
	umulcc	%o2,	0x0B23,	%i2
	st	%f14,	[%l7 + 0x58]
	edge8	%o4,	%l0,	%i0
	brlz	%l6,	loop_115
loop_115:
	nop
	setx loop_116, %l0, %l1
	jmpl %l1, %g1
loop_116:
	brgz,a	%l1,	loop_117
loop_117:
	xor	%o3,	0x0191,	%g5
	bneg,a,pn	%xcc,	loop_118
loop_118:
	bvc	loop_119
loop_119:
	fbne,a	%fcc0,	loop_120
loop_120:
	ldub	[%l7 + 0x74],	%l2
	brnz	%i7,	loop_121
loop_121:
	movl	%icc,	%l5,	%l4
	and	%i4,	%g4,	%i3
	ld	[%l7 + 0x44],	%f13
	tleu	%icc,	0x3
	fbuge,a	%fcc0,	loop_122
loop_122:
	stw	%g7,	[%l7 + 0x70]
	addccc	%o5,	%g3,	%i5
	ldd	[%l7 + 0x78],	%f2
	fbne	%fcc0,	loop_123
loop_123:
	ldd	[%l7 + 0x08],	%f10
	xorcc	%l3,	%o1,	%i1
	ldsb	[%l7 + 0x69],	%g6
	st	%f14,	[%l7 + 0x40]
	fmovsvs	%xcc,	%f6,	%f6
	tleu	%xcc,	0x6
	brgz,a	%i6,	loop_124
loop_124:
	fmovs	%f7,	%f15
	taddcctv	%g2,	%o7,	%o6
	array32	%o2,	%i2,	%o0
	bne,pt	%xcc,	loop_125
loop_125:
	bn,a,pn	%icc,	loop_126
loop_126:
	nop
	setx loop_127, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_127:
	ldsb	[%l7 + 0x4A],	%o4
	fbuge,a	%fcc2,	loop_128
loop_128:
	brnz	%l0,	loop_129
loop_129:
	ldx	[%l7 + 0x68],	%i0
	brz	%g1,	loop_130
loop_130:
	bne	loop_131
loop_131:
	fbge,a	%fcc0,	loop_132
loop_132:
	udivcc	%l6,	0x1B8B,	%o3
	tge	%icc,	0x1
	nop
	setx loop_133, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_133:
	ldsb	[%l7 + 0x48],	%g5
	srax	%l1,	%i7,	%l5
	bl,a	loop_134
loop_134:
	ba,a	%icc,	loop_135
loop_135:
	fmovdcc	%xcc,	%f3,	%f11
	bn	loop_136
loop_136:
	ldsb	[%l7 + 0x10],	%l2
	movvc	%xcc,	%i4,	%g4
	bpos,a,pt	%icc,	loop_137
loop_137:
	fmovdle	%xcc,	%f6,	%f8
	stx	%i3,	[%l7 + 0x10]
	sdivx	%l4,	0x18FD,	%o5
	sdivx	%g7,	0x06AC,	%g3
	fblg,a	%fcc1,	loop_138
loop_138:
	bvc,a,pt	%icc,	loop_139
loop_139:
	fbg,a	%fcc3,	loop_140
loop_140:
	ldx	[%l7 + 0x68],	%l3
	stx	%i5,	[%l7 + 0x50]
	ldx	[%l7 + 0x38],	%i1
	sth	%o1,	[%l7 + 0x18]
	lduw	[%l7 + 0x10],	%i6
	srl	%g6,	%o7,	%o6
	brnz	%g2,	loop_141
loop_141:
	movvc	%xcc,	%o2,	%i2
	brgez,a	%o0,	loop_142
loop_142:
	stx	%o4,	[%l7 + 0x20]
	fnegs	%f8,	%f12
	fnot2	%f0,	%f12
	umul	%l0,	0x070E,	%g1
	fbg	%fcc1,	loop_143
loop_143:
	fbo,a	%fcc1,	loop_144
loop_144:
	edge8l	%i0,	%l6,	%g5
	ldsb	[%l7 + 0x3A],	%o3
	fandnot1	%f6,	%f4,	%f10
	fmovdle	%icc,	%f13,	%f13
	st	%f5,	[%l7 + 0x38]
	edge8l	%l1,	%i7,	%l5
	fbul	%fcc0,	loop_145
loop_145:
	fbule,a	%fcc3,	loop_146
loop_146:
	stw	%l2,	[%l7 + 0x40]
	ldsw	[%l7 + 0x4C],	%g4
	tsubcctv	%i4,	%i3,	%o5
	std	%f2,	[%l7 + 0x10]
	andncc	%l4,	%g7,	%g3
	st	%f12,	[%l7 + 0x0C]
	lduw	[%l7 + 0x0C],	%l3
	tge	%xcc,	0x1
	fbo,a	%fcc2,	loop_147
loop_147:
	fbu	%fcc2,	loop_148
loop_148:
	xor	%i5,	%o1,	%i1
	tcs	%icc,	0x2
	ldd	[%l7 + 0x70],	%f14
	brz	%g6,	loop_149
loop_149:
	movgu	%icc,	%i6,	%o6
	fbul	%fcc3,	loop_150
loop_150:
	edge8ln	%o7,	%g2,	%i2
	fcmped	%fcc2,	%f0,	%f10
	fbuge	%fcc3,	loop_151
loop_151:
	bge	loop_152
loop_152:
	bcc	loop_153
loop_153:
	fbug	%fcc0,	loop_154
loop_154:
	alignaddr	%o2,	%o0,	%l0
	edge16ln	%o4,	%g1,	%i0
	fblg,a	%fcc2,	loop_155
loop_155:
	fcmple16	%f0,	%f6,	%l6
	ldd	[%l7 + 0x08],	%f2
	bvs	%xcc,	loop_156
loop_156:
	nop
	setx loop_157, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_157:
	movge	%icc,	%o3,	%g5
	fmovscs	%xcc,	%f11,	%f8
	fones	%f8
	ta	%xcc,	0x0
	brgz,a	%l1,	loop_158
loop_158:
	for	%f0,	%f6,	%f0
	bn,pn	%xcc,	loop_159
loop_159:
	bpos	loop_160
loop_160:
	popc	%l5,	%l2
	movrne	%i7,	%i4,	%i3
	stw	%o5,	[%l7 + 0x60]
	bne,a	%icc,	loop_161
loop_161:
	tge	%icc,	0x2
	bpos,a,pt	%xcc,	loop_162
loop_162:
	stx	%g4,	[%l7 + 0x38]
	fmovsgu	%icc,	%f3,	%f4
	lduh	[%l7 + 0x34],	%l4
	umul	%g7,	%g3,	%i5
	ldsb	[%l7 + 0x71],	%o1
	ldsh	[%l7 + 0x60],	%i1
	brnz	%g6,	loop_163
loop_163:
	ld	[%l7 + 0x34],	%f11
	fbn,a	%fcc0,	loop_164
loop_164:
	std	%f6,	[%l7 + 0x18]
	fbu	%fcc2,	loop_165
loop_165:
	nop
	setx loop_166, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_166:
	ldsw	[%l7 + 0x30],	%l3
	bcs	%icc,	loop_167
loop_167:
	movn	%xcc,	%i6,	%o6
	brgz	%o7,	loop_168
loop_168:
	fand	%f0,	%f10,	%f12
	fbge	%fcc0,	loop_169
loop_169:
	bne,pt	%icc,	loop_170
loop_170:
	edge16ln	%i2,	%o2,	%g2
	stb	%l0,	[%l7 + 0x56]
	movneg	%xcc,	%o4,	%o0
	fbule,a	%fcc3,	loop_171
loop_171:
	fbuge	%fcc1,	loop_172
loop_172:
	st	%f0,	[%l7 + 0x7C]
	fbuge	%fcc2,	loop_173
loop_173:
	edge8l	%i0,	%l6,	%o3
	orn	%g1,	0x1162,	%g5
	ldsw	[%l7 + 0x58],	%l5
	st	%f14,	[%l7 + 0x48]
	andn	%l1,	%l2,	%i4
	nop
	setx loop_174, %l0, %l1
	jmpl %l1, %i7
loop_174:
	std	%f4,	[%l7 + 0x70]
	ldub	[%l7 + 0x7C],	%o5
	fcmpd	%fcc0,	%f10,	%f6
	movcc	%icc,	%g4,	%l4
	fnegd	%f12,	%f0
	be,a,pt	%icc,	loop_175
loop_175:
	brgz,a	%g7,	loop_176
loop_176:
	tvs	%icc,	0x1
	movcs	%icc,	%g3,	%i5
	bcc,a	%xcc,	loop_177
loop_177:
	fmovse	%xcc,	%f9,	%f8
	lduw	[%l7 + 0x6C],	%i3
	nop
	setx loop_178, %l0, %l1
	jmpl %l1, %i1
loop_178:
	alignaddrl	%g6,	%o1,	%l3
	tcc	%icc,	0x2
	movpos	%xcc,	%i6,	%o7
	bleu	loop_179
loop_179:
	fmovde	%icc,	%f3,	%f2
	nop
	setx loop_180, %l0, %l1
	jmpl %l1, %i2
loop_180:
	edge32l	%o6,	%o2,	%g2
	bl,a,pn	%icc,	loop_181
loop_181:
	bge,pt	%icc,	loop_182
loop_182:
	movpos	%icc,	%l0,	%o0
	sub	%i0,	%o4,	%o3
	fbuge	%fcc3,	loop_183
loop_183:
	move	%icc,	%g1,	%l6
	movne	%xcc,	%l5,	%g5
	or	%l1,	0x0E0C,	%i4
	tvc	%xcc,	0x5
	add	%i7,	%o5,	%l2
	xnorcc	%g4,	%l4,	%g7
	std	%f12,	[%l7 + 0x28]
	edge16	%g3,	%i3,	%i1
	movleu	%xcc,	%g6,	%o1
	subc	%i5,	%l3,	%i6
	st	%f7,	[%l7 + 0x10]
	ld	[%l7 + 0x64],	%f6
	bn,a,pn	%icc,	loop_184
loop_184:
	fmovdn	%xcc,	%f9,	%f2
	edge32l	%o7,	%o6,	%i2
	move	%icc,	%g2,	%o2
	ldx	[%l7 + 0x50],	%l0
	movle	%xcc,	%o0,	%o4
	std	%f4,	[%l7 + 0x70]
	ldx	[%l7 + 0x30],	%i0
	lduh	[%l7 + 0x4A],	%g1
	udivcc	%l6,	0x1CD3,	%o3
	brlez,a	%l5,	loop_185
loop_185:
	array8	%l1,	%i4,	%i7
	fmovdge	%xcc,	%f11,	%f5
	movcc	%xcc,	%o5,	%g5
	tcc	%icc,	0x2
	fmovde	%icc,	%f2,	%f8
	bneg,a,pn	%icc,	loop_186
loop_186:
	movrgz	%g4,	0x1FC,	%l2
	subc	%g7,	0x09E7,	%g3
	brz,a	%l4,	loop_187
loop_187:
	ldd	[%l7 + 0x20],	%f6
	fxnors	%f2,	%f7,	%f6
	fbn	%fcc0,	loop_188
loop_188:
	fmovd	%f12,	%f2
	bge,a,pn	%xcc,	loop_189
loop_189:
	ldx	[%l7 + 0x60],	%i3
	taddcc	%i1,	%g6,	%i5
	fmul8ulx16	%f8,	%f4,	%f10
	movpos	%xcc,	%o1,	%l3
	edge8l	%i6,	%o7,	%i2
	ldx	[%l7 + 0x30],	%g2
	fbu,a	%fcc3,	loop_190
loop_190:
	srl	%o2,	0x16,	%l0
	tn	%xcc,	0x5
	fbl	%fcc2,	loop_191
loop_191:
	ld	[%l7 + 0x54],	%f8
	movleu	%icc,	%o0,	%o4
	ldd	[%l7 + 0x68],	%f0
	stb	%i0,	[%l7 + 0x63]
	stw	%g1,	[%l7 + 0x68]
	or	%o6,	%l6,	%l5
	ldsh	[%l7 + 0x4A],	%l1
	lduh	[%l7 + 0x44],	%i4
	movpos	%xcc,	%o3,	%o5
	fbul	%fcc2,	loop_192
loop_192:
	fsrc2	%f10,	%f4
	fbe	%fcc1,	loop_193
loop_193:
	bvc	%icc,	loop_194
loop_194:
	nop
	setx loop_195, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_195:
	andcc	%i7,	0x0E73,	%g5
	brgez,a	%l2,	loop_196
loop_196:
	lduw	[%l7 + 0x74],	%g7
	bvs,pn	%icc,	loop_197
loop_197:
	xnorcc	%g4,	%g3,	%i3
	tpos	%xcc,	0x1
	sth	%i1,	[%l7 + 0x5A]
	tvs	%icc,	0x4
	ba,a,pt	%xcc,	loop_198
loop_198:
	ldsh	[%l7 + 0x50],	%g6
	fba	%fcc2,	loop_199
loop_199:
	lduw	[%l7 + 0x40],	%i5
	smulcc	%l4,	0x1ADD,	%l3
	movn	%icc,	%i6,	%o7
	fbl	%fcc2,	loop_200
loop_200:
	bneg,pn	%icc,	loop_201
loop_201:
	udivcc	%o1,	0x1A00,	%g2
	edge32ln	%o2,	%l0,	%o0
	stx	%o4,	[%l7 + 0x08]
	mulx	%i0,	0x001C,	%g1
	sll	%i2,	%o6,	%l6
	movrlez	%l1,	%i4,	%l5
	fbug,a	%fcc2,	loop_202
loop_202:
	srl	%o5,	%i7,	%g5
	edge8n	%l2,	%g7,	%g4
	movrne	%o3,	0x288,	%i3
	ldsw	[%l7 + 0x24],	%g3
	lduw	[%l7 + 0x34],	%g6
	bl	loop_203
loop_203:
	fbe,a	%fcc3,	loop_204
loop_204:
	movrgez	%i5,	%l4,	%l3
	srlx	%i6,	%i1,	%o1
	lduh	[%l7 + 0x24],	%g2
	edge8n	%o7,	%o2,	%o0
	bg	%icc,	loop_205
loop_205:
	move	%xcc,	%l0,	%i0
	std	%f14,	[%l7 + 0x70]
	tsubcctv	%o4,	0x1D8C,	%i2
	ldd	[%l7 + 0x58],	%f4
	siam	0x3
	umulcc	%g1,	%l6,	%o6
	edge32l	%i4,	%l5,	%o5
	ldub	[%l7 + 0x43],	%i7
	edge8n	%g5,	%l1,	%g7
	bcs,pn	%xcc,	loop_206
loop_206:
	std	%f4,	[%l7 + 0x30]
	movcs	%icc,	%g4,	%o3
	sll	%i3,	0x19,	%l2
	ldx	[%l7 + 0x38],	%g3
	ldd	[%l7 + 0x68],	%f2
	nop
	setx loop_207, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_207:
	tgu	%icc,	0x2
	fbug	%fcc0,	loop_208
loop_208:
	bge,a,pt	%xcc,	loop_209
loop_209:
	tneg	%xcc,	0x3
	nop
	setx loop_210, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_210:
	stb	%g6,	[%l7 + 0x44]
	andncc	%i5,	%l3,	%l4
	stx	%i1,	[%l7 + 0x10]
	udivcc	%o1,	0x1365,	%g2
	fcmps	%fcc3,	%f13,	%f9
	andncc	%o7,	%i6,	%o2
	bcs,pn	%xcc,	loop_211
loop_211:
	ld	[%l7 + 0x30],	%f8
	edge16n	%o0,	%i0,	%l0
	xorcc	%o4,	%i2,	%g1
	and	%o6,	%i4,	%l6
	alignaddr	%l5,	%i7,	%g5
	sdivcc	%o5,	0x04ED,	%l1
	tcc	%icc,	0x4
	edge8l	%g4,	%o3,	%i3
	taddcctv	%g7,	%g3,	%g6
	fblg,a	%fcc3,	loop_212
loop_212:
	mulscc	%l2,	0x0827,	%i5
	ld	[%l7 + 0x10],	%f5
	fpsub16	%f6,	%f4,	%f14
	andn	%l4,	0x16A6,	%i1
	lduw	[%l7 + 0x58],	%l3
	subcc	%g2,	%o7,	%i6
	and	%o1,	%o2,	%i0
	brnz,a	%o0,	loop_213
loop_213:
	fornot2	%f14,	%f10,	%f8
	alignaddr	%o4,	%i2,	%g1
	edge8l	%o6,	%l0,	%l6
	ldsh	[%l7 + 0x40],	%i4
	ldub	[%l7 + 0x70],	%i7
	bg,a,pt	%icc,	loop_214
loop_214:
	fmovdne	%xcc,	%f3,	%f2
	stb	%l5,	[%l7 + 0x69]
	lduh	[%l7 + 0x4A],	%g5
	movl	%xcc,	%o5,	%g4
	brnz	%o3,	loop_215
loop_215:
	bcs,a,pn	%icc,	loop_216
loop_216:
	sethi	0x0DA8,	%l1
	tpos	%xcc,	0x3
	st	%f11,	[%l7 + 0x78]
	ldsb	[%l7 + 0x4D],	%g7
	sth	%i3,	[%l7 + 0x0A]
	stx	%g6,	[%l7 + 0x40]
	subccc	%g3,	0x1258,	%i5
	fmovscs	%icc,	%f3,	%f7
	fbe	%fcc2,	loop_217
loop_217:
	bn,pt	%icc,	loop_218
loop_218:
	brz	%l4,	loop_219
loop_219:
	call	loop_220
loop_220:
	movge	%icc,	%l2,	%l3
	fbuge	%fcc1,	loop_221
loop_221:
	xnorcc	%i1,	0x1F6D,	%o7
	ldx	[%l7 + 0x50],	%i6
	fblg	%fcc3,	loop_222
loop_222:
	taddcctv	%o1,	%o2,	%g2
	fmovsle	%xcc,	%f15,	%f3
	std	%f14,	[%l7 + 0x78]
	brlez,a	%o0,	loop_223
loop_223:
	fbe,a	%fcc1,	loop_224
loop_224:
	ba,pn	%xcc,	loop_225
loop_225:
	lduw	[%l7 + 0x18],	%o4
	add	%i0,	0x0675,	%i2
	bpos	%icc,	loop_226
loop_226:
	bvs,a	loop_227
loop_227:
	bcc,a	loop_228
loop_228:
	fmovdne	%xcc,	%f4,	%f8
	fbule,a	%fcc2,	loop_229
loop_229:
	movpos	%xcc,	%o6,	%l0
	fbne	%fcc2,	loop_230
loop_230:
	fcmped	%fcc2,	%f6,	%f6
	edge16	%g1,	%i4,	%i7
	stw	%l6,	[%l7 + 0x08]
	fmovsne	%icc,	%f9,	%f2
	ldsw	[%l7 + 0x20],	%l5
	fmuld8ulx16	%f15,	%f7,	%f10
	movne	%icc,	%o5,	%g4
	fbl	%fcc3,	loop_231
loop_231:
	movneg	%icc,	%g5,	%l1
	st	%f5,	[%l7 + 0x6C]
	bvc,pt	%xcc,	loop_232
loop_232:
	nop
	setx loop_233, %l0, %l1
	jmpl %l1, %g7
loop_233:
	st	%f9,	[%l7 + 0x28]
	xor	%i3,	0x17D2,	%g6
	alignaddrl	%o3,	%g3,	%i5
	edge16ln	%l2,	%l3,	%i1
	fnor	%f2,	%f14,	%f8
	ldsb	[%l7 + 0x16],	%o7
	lduw	[%l7 + 0x14],	%i6
	stx	%o1,	[%l7 + 0x18]
	alignaddrl	%l4,	%g2,	%o2
	edge16	%o0,	%i0,	%i2
	st	%f7,	[%l7 + 0x2C]
	alignaddr	%o4,	%l0,	%g1
	mova	%icc,	%o6,	%i7
	ldub	[%l7 + 0x0B],	%i4
	nop
	setx loop_234, %l0, %l1
	jmpl %l1, %l6
loop_234:
	ldub	[%l7 + 0x32],	%l5
	edge8l	%o5,	%g5,	%g4
	bn	%icc,	loop_235
loop_235:
	fpsub16s	%f1,	%f2,	%f6
	ble,a,pn	%xcc,	loop_236
loop_236:
	tsubcctv	%l1,	%i3,	%g6
	ldub	[%l7 + 0x14],	%o3
	stw	%g3,	[%l7 + 0x24]
	edge8	%i5,	%l2,	%g7
	fmovsne	%icc,	%f0,	%f6
	tge	%icc,	0x0
	bn,a,pt	%xcc,	loop_237
loop_237:
	brlz	%i1,	loop_238
loop_238:
	smul	%o7,	%l3,	%o1
	be,pn	%icc,	loop_239
loop_239:
	std	%f10,	[%l7 + 0x08]
	fpsub16	%f14,	%f0,	%f2
	stw	%i6,	[%l7 + 0x48]
	fbg,a	%fcc3,	loop_240
loop_240:
	ldsb	[%l7 + 0x4F],	%g2
	stx	%o2,	[%l7 + 0x38]
	fones	%f4
	lduh	[%l7 + 0x3A],	%l4
	lduw	[%l7 + 0x10],	%o0
	stb	%i2,	[%l7 + 0x6F]
	ldsw	[%l7 + 0x70],	%o4
	fbn	%fcc2,	loop_241
loop_241:
	ldd	[%l7 + 0x40],	%f8
	fxnors	%f13,	%f1,	%f1
	mulx	%l0,	%g1,	%i0
	udivcc	%i7,	0x18F1,	%o6
	edge16n	%l6,	%l5,	%o5
	bl,a,pn	%icc,	loop_242
loop_242:
	movre	%i4,	%g4,	%l1
	sllx	%g5,	0x1F,	%g6
	fbug,a	%fcc3,	loop_243
loop_243:
	nop
	setx loop_244, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_244:
	stx	%i3,	[%l7 + 0x30]
	mulx	%g3,	%i5,	%o3
	ldx	[%l7 + 0x50],	%g7
	bl	%xcc,	loop_245
loop_245:
	sethi	0x0FD7,	%i1
	edge16ln	%o7,	%l3,	%l2
	edge16ln	%o1,	%g2,	%i6
	sth	%o2,	[%l7 + 0x4E]
	array8	%l4,	%o0,	%i2
	ldub	[%l7 + 0x72],	%l0
	tne	%xcc,	0x7
	fmovdg	%icc,	%f4,	%f11
	and	%g1,	%o4,	%i0
	popc	0x199B,	%i7
	ldsw	[%l7 + 0x20],	%o6
	fbul	%fcc2,	loop_246
loop_246:
	fxor	%f10,	%f2,	%f6
	lduw	[%l7 + 0x1C],	%l5
	mulscc	%l6,	0x0E4D,	%o5
	fbne,a	%fcc2,	loop_247
loop_247:
	fsrc2	%f2,	%f10
	move	%icc,	%i4,	%g4
	ldsw	[%l7 + 0x20],	%l1
	fnot2	%f2,	%f12
	stb	%g6,	[%l7 + 0x6E]
	sll	%g5,	%i3,	%i5
	edge32ln	%g3,	%o3,	%i1
	stw	%o7,	[%l7 + 0x54]
	fbug,a	%fcc3,	loop_248
loop_248:
	ldsw	[%l7 + 0x48],	%l3
	brgez	%g7,	loop_249
loop_249:
	std	%f8,	[%l7 + 0x38]
	fmovd	%f2,	%f14
	ble,pt	%xcc,	loop_250
loop_250:
	tsubcc	%l2,	%g2,	%o1
	st	%f14,	[%l7 + 0x44]
	nop
	setx loop_251, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_251:
	ldsh	[%l7 + 0x36],	%o2
	subcc	%i6,	0x0878,	%l4
	addccc	%o0,	0x1525,	%i2
	ldsw	[%l7 + 0x3C],	%g1
	st	%f13,	[%l7 + 0x08]
	std	%f2,	[%l7 + 0x30]
	ld	[%l7 + 0x20],	%f1
	ldsw	[%l7 + 0x68],	%o4
	fpmerge	%f0,	%f7,	%f0
	stw	%i0,	[%l7 + 0x6C]
	ldx	[%l7 + 0x48],	%l0
	sdivx	%i7,	0x1E2A,	%l5
	std	%f8,	[%l7 + 0x58]
	fbe,a	%fcc0,	loop_252
loop_252:
	fsrc2s	%f9,	%f5
	sth	%o6,	[%l7 + 0x62]
	be	loop_253
loop_253:
	fbge,a	%fcc1,	loop_254
loop_254:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 110
!	Type cti   	: 254
!	Type i   	: 346
!	Type l   	: 290
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
main_t1:

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x3,	%g2
	set	0x0,	%g3
	set	0xA,	%g4
	set	0x2,	%g5
	set	0xC,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xA,	%i1
	set	-0xD,	%i2
	set	-0xE,	%i3
	set	-0xF,	%i4
	set	-0xC,	%i5
	set	-0xF,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x08C8539E,	%l0
	set	0x303F9DE6,	%l1
	set	0x41EFB7BA,	%l2
	set	0x2B468C73,	%l3
	set	0x21D70C46,	%l4
	set	0x30A553A9,	%l5
	set	0x66B08BE3,	%l6
	!# Output registers
	set	0x0BFC,	%o0
	set	0x0BDA,	%o1
	set	0x0093,	%o2
	set	-0x1AF5,	%o3
	set	0x19E7,	%o4
	set	0x0340,	%o5
	set	-0x1DC1,	%o6
	set	-0x1C8F,	%o7

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

	tgu	%icc,	0x7
	bl,a,pt	%xcc,	loop_255
loop_255:
	mova	%xcc,	%o5,	%l6
	stw	%g4,	[%l7 + 0x08]
	edge16ln	%l1,	%g6,	%i4
	fmovsle	%icc,	%f15,	%f15
	fbo,a	%fcc3,	loop_256
loop_256:
	andn	%i3,	0x191E,	%g5
	smul	%g3,	%i5,	%i1
	tcc	%xcc,	0x3
	ldub	[%l7 + 0x75],	%o3
	tgu	%icc,	0x5
	fpack16	%f6,	%f3
	fand	%f2,	%f14,	%f4
	movrgez	%l3,	0x388,	%o7
	be	loop_257
loop_257:
	movg	%icc,	%g7,	%l2
	xor	%o1,	%g2,	%o2
	ld	[%l7 + 0x24],	%f8
	smul	%l4,	%i6,	%i2
	xnor	%g1,	%o0,	%i0
	ldsw	[%l7 + 0x0C],	%l0
	fabsd	%f14,	%f2
	nop
	setx loop_258, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_258:
	fmovdl	%icc,	%f14,	%f9
	fmovdpos	%icc,	%f8,	%f9
	be	%icc,	loop_259
loop_259:
	fmovdl	%xcc,	%f9,	%f13
	ldsw	[%l7 + 0x2C],	%o4
	lduh	[%l7 + 0x4A],	%i7
	fmovdleu	%icc,	%f13,	%f6
	fbe	%fcc3,	loop_260
loop_260:
	tpos	%icc,	0x6
	fbne,a	%fcc0,	loop_261
loop_261:
	edge8n	%o6,	%l5,	%l6
	fone	%f8
	fmovdvs	%icc,	%f7,	%f11
	fzero	%f6
	fmovsneg	%icc,	%f11,	%f11
	orcc	%o5,	0x018F,	%l1
	edge16l	%g4,	%i4,	%i3
	fblg	%fcc3,	loop_262
loop_262:
	ldsb	[%l7 + 0x35],	%g5
	fmovse	%icc,	%f6,	%f2
	ldsb	[%l7 + 0x26],	%g6
	fmovse	%xcc,	%f15,	%f4
	stx	%g3,	[%l7 + 0x58]
	taddcctv	%i5,	0x0245,	%o3
	addcc	%i1,	0x0F2C,	%l3
	fors	%f9,	%f2,	%f7
	ldsw	[%l7 + 0x5C],	%g7
	movvc	%xcc,	%l2,	%o1
	stw	%g2,	[%l7 + 0x58]
	fcmps	%fcc0,	%f5,	%f15
	andn	%o2,	%o7,	%l4
	edge8ln	%i2,	%i6,	%o0
	fbo,a	%fcc2,	loop_263
loop_263:
	fmovdvc	%xcc,	%f1,	%f12
	siam	0x2
	fmovrsgz	%i0,	%f9,	%f7
	fmovdvc	%xcc,	%f8,	%f9
	edge32	%l0,	%g1,	%o4
	fsrc1	%f8,	%f0
	fmovdneg	%icc,	%f8,	%f13
	fmovsle	%xcc,	%f3,	%f4
	fbule	%fcc2,	loop_264
loop_264:
	tsubcctv	%i7,	%o6,	%l5
	fmovd	%f12,	%f14
	fba	%fcc0,	loop_265
loop_265:
	popc	%o5,	%l6
	sth	%l1,	[%l7 + 0x4C]
	fmovsgu	%xcc,	%f13,	%f9
	mova	%icc,	%g4,	%i3
	fbuge	%fcc3,	loop_266
loop_266:
	brlz	%g5,	loop_267
loop_267:
	tsubcc	%g6,	0x0E91,	%i4
	edge16l	%i5,	%o3,	%i1
	movre	%g3,	0x2F5,	%l3
	andcc	%g7,	0x08FD,	%l2
	brlez	%o1,	loop_268
loop_268:
	movpos	%icc,	%o2,	%g2
	tvs	%icc,	0x4
	array32	%l4,	%i2,	%i6
	edge32ln	%o7,	%o0,	%l0
	fors	%f15,	%f4,	%f10
	movre	%i0,	0x258,	%g1
	bl,pt	%xcc,	loop_269
loop_269:
	sub	%i7,	0x044E,	%o6
	movn	%xcc,	%l5,	%o5
	fmovrdgz	%l6,	%f14,	%f8
	srl	%o4,	%l1,	%g4
	smul	%g5,	%i3,	%i4
	lduw	[%l7 + 0x40],	%i5
	bvs	%xcc,	loop_270
loop_270:
	addc	%g6,	%o3,	%g3
	fmovscc	%xcc,	%f13,	%f10
	std	%f4,	[%l7 + 0x58]
	nop
	setx loop_271, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_271:
	fnot2s	%f12,	%f11
	srlx	%l3,	0x01,	%g7
	ld	[%l7 + 0x10],	%f11
	fbo,a	%fcc2,	loop_272
loop_272:
	sth	%l2,	[%l7 + 0x74]
	movne	%xcc,	%o1,	%o2
	sth	%i1,	[%l7 + 0x6C]
	movle	%xcc,	%l4,	%i2
	orcc	%g2,	0x013C,	%i6
	xorcc	%o7,	%l0,	%i0
	fmovdge	%icc,	%f9,	%f14
	ldsb	[%l7 + 0x48],	%g1
	fabss	%f6,	%f15
	ldd	[%l7 + 0x78],	%f10
	bshuffle	%f14,	%f2,	%f2
	bneg	%icc,	loop_273
loop_273:
	fsrc2	%f8,	%f4
	sth	%o0,	[%l7 + 0x3C]
	fmovscc	%icc,	%f13,	%f5
	fmovspos	%xcc,	%f10,	%f8
	fmovdneg	%icc,	%f11,	%f14
	fblg,a	%fcc3,	loop_274
loop_274:
	fone	%f10
	fmovdgu	%icc,	%f11,	%f5
	srlx	%o6,	%l5,	%i7
	udivcc	%l6,	0x09EC,	%o5
	fornot1	%f12,	%f4,	%f14
	stb	%o4,	[%l7 + 0x6F]
	ldsh	[%l7 + 0x78],	%l1
	movre	%g5,	0x0BF,	%i3
	ble,a	%icc,	loop_275
loop_275:
	fpmerge	%f2,	%f7,	%f0
	alignaddr	%i4,	%i5,	%g6
	tgu	%icc,	0x3
	fmovrse	%g4,	%f3,	%f0
	sth	%o3,	[%l7 + 0x62]
	brlez,a	%g3,	loop_276
loop_276:
	fmovdg	%icc,	%f1,	%f9
	st	%f15,	[%l7 + 0x4C]
	and	%g7,	0x14C0,	%l3
	array16	%o1,	%l2,	%o2
	movgu	%icc,	%i1,	%l4
	bvs	%icc,	loop_277
loop_277:
	brgz,a	%i2,	loop_278
loop_278:
	fmovrslez	%g2,	%f4,	%f12
	fpadd16	%f10,	%f0,	%f12
	for	%f12,	%f6,	%f0
	fnot1s	%f2,	%f11
	fmovdg	%xcc,	%f11,	%f10
	udiv	%i6,	0x1C80,	%l0
	ldx	[%l7 + 0x48],	%i0
	stw	%g1,	[%l7 + 0x7C]
	fmovdne	%xcc,	%f3,	%f9
	fmovsvs	%xcc,	%f12,	%f6
	lduw	[%l7 + 0x48],	%o7
	bvs,a	loop_279
loop_279:
	movg	%xcc,	%o0,	%l5
	fpadd32s	%f8,	%f14,	%f9
	tl	%xcc,	0x3
	bvs,pt	%xcc,	loop_280
loop_280:
	fmovd	%f0,	%f12
	stw	%i7,	[%l7 + 0x64]
	edge8n	%l6,	%o5,	%o6
	ldx	[%l7 + 0x18],	%l1
	array16	%g5,	%o4,	%i3
	fmovsgu	%xcc,	%f4,	%f14
	ldsw	[%l7 + 0x0C],	%i5
	tcc	%icc,	0x3
	brz	%i4,	loop_281
loop_281:
	brgez,a	%g4,	loop_282
loop_282:
	ldub	[%l7 + 0x09],	%g6
	tvs	%xcc,	0x6
	ldd	[%l7 + 0x40],	%f2
	xor	%g3,	0x1F79,	%o3
	orn	%g7,	%o1,	%l2
	fnot1	%f8,	%f2
	addcc	%l3,	%o2,	%i1
	tgu	%icc,	0x5
	ldub	[%l7 + 0x57],	%l4
	fmovrslz	%g2,	%f1,	%f0
	fcmpne32	%f14,	%f4,	%i6
	fnot1	%f8,	%f6
	ldx	[%l7 + 0x58],	%l0
	edge16ln	%i2,	%i0,	%o7
	fmuld8sux16	%f10,	%f7,	%f12
	fmovsneg	%xcc,	%f12,	%f6
	ldd	[%l7 + 0x68],	%f14
	ld	[%l7 + 0x40],	%f12
	sub	%g1,	%l5,	%i7
	fcmpeq16	%f10,	%f0,	%l6
	ldsb	[%l7 + 0x11],	%o5
	ldsb	[%l7 + 0x3C],	%o0
	fbo,a	%fcc1,	loop_283
loop_283:
	tg	%xcc,	0x3
	sth	%o6,	[%l7 + 0x70]
	ldd	[%l7 + 0x28],	%f14
	fnegd	%f14,	%f10
	movgu	%xcc,	%g5,	%o4
	orcc	%l1,	%i3,	%i5
	sth	%i4,	[%l7 + 0x5C]
	xor	%g4,	%g6,	%g3
	bpos,pn	%xcc,	loop_284
loop_284:
	fmul8x16al	%f0,	%f7,	%f14
	fcmple32	%f0,	%f10,	%g7
	lduh	[%l7 + 0x5A],	%o1
	andcc	%o3,	0x1D21,	%l3
	fmovsn	%icc,	%f3,	%f8
	ldsb	[%l7 + 0x78],	%o2
	fmovsne	%icc,	%f3,	%f10
	bneg,a,pn	%xcc,	loop_285
loop_285:
	bpos,pt	%xcc,	loop_286
loop_286:
	subcc	%i1,	0x00E5,	%l2
	orcc	%l4,	0x0613,	%g2
	ldub	[%l7 + 0x43],	%i6
	fbue,a	%fcc2,	loop_287
loop_287:
	ldsh	[%l7 + 0x72],	%i2
	fmovsvc	%icc,	%f6,	%f5
	edge32ln	%i0,	%l0,	%g1
	fnot2s	%f0,	%f3
	fmovde	%xcc,	%f2,	%f11
	fbu,a	%fcc1,	loop_288
loop_288:
	call	loop_289
loop_289:
	or	%l5,	0x1683,	%i7
	mova	%xcc,	%o7,	%l6
	xor	%o5,	%o0,	%g5
	movcs	%icc,	%o4,	%l1
	nop
	setx loop_290, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_290:
	fmuld8sux16	%f3,	%f8,	%f14
	bleu	loop_291
loop_291:
	nop
	setx loop_292, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_292:
	fxnor	%f4,	%f12,	%f2
	ble,a	%icc,	loop_293
loop_293:
	ld	[%l7 + 0x54],	%f6
	sllx	%o6,	0x05,	%i5
	andcc	%i3,	%g4,	%g6
	fbu,a	%fcc1,	loop_294
loop_294:
	fpsub32s	%f2,	%f1,	%f0
	srax	%g3,	%g7,	%i4
	ble,a,pn	%xcc,	loop_295
loop_295:
	fnot2s	%f11,	%f5
	fmul8x16al	%f7,	%f13,	%f12
	sub	%o3,	%l3,	%o2
	ld	[%l7 + 0x48],	%f7
	ldsw	[%l7 + 0x78],	%o1
	movvc	%xcc,	%l2,	%l4
	xnorcc	%g2,	0x0245,	%i6
	ldub	[%l7 + 0x57],	%i1
	subcc	%i0,	%l0,	%i2
	ldub	[%l7 + 0x4F],	%l5
	move	%xcc,	%g1,	%i7
	fmovrdne	%o7,	%f4,	%f8
	fmovda	%xcc,	%f0,	%f7
	fones	%f6
	lduw	[%l7 + 0x64],	%o5
	nop
	setx loop_296, %l0, %l1
	jmpl %l1, %l6
loop_296:
	stx	%g5,	[%l7 + 0x58]
	fnot1s	%f11,	%f8
	bg,a,pn	%icc,	loop_297
loop_297:
	siam	0x4
	fmovdl	%xcc,	%f0,	%f15
	brlz,a	%o0,	loop_298
loop_298:
	sth	%o4,	[%l7 + 0x4C]
	sth	%o6,	[%l7 + 0x22]
	call	loop_299
loop_299:
	be,a	loop_300
loop_300:
	movvc	%xcc,	%i5,	%i3
	fsrc1	%f6,	%f2
	fpack16	%f14,	%f8
	std	%f4,	[%l7 + 0x20]
	bge	%xcc,	loop_301
loop_301:
	sub	%g4,	0x061F,	%l1
	ldsh	[%l7 + 0x1E],	%g3
	fnor	%f4,	%f2,	%f4
	sllx	%g7,	0x14,	%i4
	stb	%g6,	[%l7 + 0x3E]
	fmovdpos	%xcc,	%f0,	%f9
	ldsh	[%l7 + 0x14],	%o3
	fmul8sux16	%f2,	%f14,	%f2
	fbl	%fcc2,	loop_302
loop_302:
	andcc	%o2,	0x04DE,	%l3
	sth	%l2,	[%l7 + 0x12]
	fpadd16	%f10,	%f12,	%f10
	udiv	%l4,	0x074E,	%g2
	st	%f0,	[%l7 + 0x4C]
	movrlz	%i6,	%i1,	%i0
	ldsb	[%l7 + 0x5E],	%o1
	edge32n	%l0,	%i2,	%g1
	sth	%l5,	[%l7 + 0x70]
	fba	%fcc0,	loop_303
loop_303:
	fcmped	%fcc2,	%f2,	%f6
	fmovsleu	%icc,	%f2,	%f2
	movrlz	%o7,	0x217,	%i7
	fmovdgu	%xcc,	%f6,	%f10
	movl	%icc,	%l6,	%o5
	lduw	[%l7 + 0x0C],	%g5
	fmovrsgz	%o0,	%f12,	%f8
	movrgez	%o6,	0x050,	%o4
	fcmpne16	%f14,	%f4,	%i3
	edge16n	%i5,	%g4,	%l1
	fcmpne32	%f12,	%f10,	%g7
	sll	%i4,	%g3,	%o3
	st	%f6,	[%l7 + 0x54]
	bcs,a	loop_304
loop_304:
	movrgz	%g6,	0x39A,	%l3
	std	%f6,	[%l7 + 0x60]
	fones	%f6
	movcc	%xcc,	%o2,	%l4
	fnot2	%f8,	%f2
	faligndata	%f14,	%f14,	%f0
	stw	%g2,	[%l7 + 0x0C]
	brgez,a	%i6,	loop_305
loop_305:
	fba	%fcc0,	loop_306
loop_306:
	bvc,pn	%xcc,	loop_307
loop_307:
	move	%xcc,	%i1,	%l2
	brz,a	%o1,	loop_308
loop_308:
	fbue,a	%fcc1,	loop_309
loop_309:
	fmovsleu	%icc,	%f14,	%f9
	fxnor	%f8,	%f0,	%f0
	fmovrslz	%i0,	%f12,	%f13
	mulscc	%l0,	%i2,	%l5
	stx	%g1,	[%l7 + 0x38]
	stb	%o7,	[%l7 + 0x1C]
	subcc	%l6,	%i7,	%o5
	alignaddrl	%o0,	%o6,	%g5
	ldsb	[%l7 + 0x49],	%o4
	and	%i3,	0x0F97,	%i5
	lduw	[%l7 + 0x48],	%g4
	ble,a	%xcc,	loop_310
loop_310:
	fble,a	%fcc0,	loop_311
loop_311:
	mova	%icc,	%l1,	%g7
	ld	[%l7 + 0x38],	%f7
	ldub	[%l7 + 0x37],	%i4
	movcs	%icc,	%o3,	%g6
	bpos	%xcc,	loop_312
loop_312:
	edge32n	%g3,	%l3,	%l4
	fmovdcc	%xcc,	%f9,	%f0
	fornot1s	%f13,	%f1,	%f0
	sra	%g2,	0x15,	%o2
	bpos,pt	%xcc,	loop_313
loop_313:
	lduh	[%l7 + 0x26],	%i1
	fmovdn	%xcc,	%f0,	%f13
	fcmpne32	%f8,	%f2,	%l2
	tcs	%icc,	0x0
	lduw	[%l7 + 0x10],	%i6
	sdiv	%o1,	0x1A3F,	%l0
	ldsw	[%l7 + 0x2C],	%i0
	fmovscc	%icc,	%f2,	%f12
	sll	%l5,	0x19,	%i2
	fbo	%fcc3,	loop_314
loop_314:
	fmovs	%f13,	%f7
	sth	%o7,	[%l7 + 0x5C]
	fxors	%f10,	%f11,	%f1
	bge,a	%icc,	loop_315
loop_315:
	ldub	[%l7 + 0x26],	%l6
	stw	%i7,	[%l7 + 0x54]
	brz	%o5,	loop_316
loop_316:
	fsrc2s	%f2,	%f3
	bgu,pn	%xcc,	loop_317
loop_317:
	stb	%g1,	[%l7 + 0x5F]
	alignaddrl	%o6,	%o0,	%o4
	movrgez	%i3,	%i5,	%g4
	movcs	%xcc,	%l1,	%g7
	addcc	%g5,	0x032D,	%o3
	sdivcc	%g6,	0x15E7,	%g3
	std	%f8,	[%l7 + 0x48]
	brgz,a	%i4,	loop_318
loop_318:
	stw	%l4,	[%l7 + 0x50]
	fmovscc	%xcc,	%f15,	%f11
	ldd	[%l7 + 0x78],	%f8
	movre	%l3,	0x347,	%o2
	andcc	%i1,	0x1EC4,	%g2
	bcs,a,pn	%xcc,	loop_319
loop_319:
	ld	[%l7 + 0x54],	%f2
	udivx	%l2,	0x04C6,	%o1
	andcc	%i6,	%l0,	%i0
	sra	%i2,	0x0B,	%l5
	fxor	%f0,	%f14,	%f2
	srlx	%l6,	0x1D,	%o7
	sethi	0x1D64,	%i7
	bl,a	%xcc,	loop_320
loop_320:
	movvc	%icc,	%g1,	%o6
	array16	%o5,	%o0,	%i3
	lduh	[%l7 + 0x4E],	%i5
	edge32l	%g4,	%l1,	%o4
	tge	%xcc,	0x3
	tne	%xcc,	0x6
	smulcc	%g5,	%g7,	%g6
	ldx	[%l7 + 0x18],	%g3
	fmovrdne	%o3,	%f6,	%f12
	or	%i4,	%l3,	%o2
	fornot2	%f12,	%f0,	%f14
	fbu,a	%fcc1,	loop_321
loop_321:
	fcmpeq16	%f4,	%f14,	%i1
	fpack32	%f8,	%f8,	%f8
	addc	%l4,	0x1CB5,	%l2
	lduw	[%l7 + 0x6C],	%g2
	fsrc2s	%f0,	%f10
	ldsh	[%l7 + 0x6E],	%i6
	fmovspos	%icc,	%f15,	%f6
	bn,a	loop_322
loop_322:
	sra	%l0,	%i0,	%o1
	sethi	0x010C,	%i2
	fnot2	%f0,	%f0
	edge16ln	%l5,	%o7,	%i7
	edge32ln	%l6,	%g1,	%o5
	fpackfix	%f14,	%f12
	fcmpeq16	%f4,	%f0,	%o6
	tneg	%icc,	0x2
	lduw	[%l7 + 0x24],	%o0
	fpsub16s	%f3,	%f11,	%f8
	fbn	%fcc2,	loop_323
loop_323:
	xnorcc	%i5,	%i3,	%l1
	lduh	[%l7 + 0x3C],	%o4
	stw	%g5,	[%l7 + 0x34]
	fba	%fcc3,	loop_324
loop_324:
	ldsb	[%l7 + 0x75],	%g4
	fbul	%fcc3,	loop_325
loop_325:
	tle	%xcc,	0x3
	fnot1s	%f7,	%f6
	fmovrdlez	%g7,	%f4,	%f6
	movvc	%icc,	%g3,	%g6
	fors	%f0,	%f15,	%f11
	lduh	[%l7 + 0x2A],	%o3
	ldd	[%l7 + 0x48],	%f8
	fone	%f10
	fcmped	%fcc2,	%f14,	%f0
	fnot2s	%f12,	%f10
	ldd	[%l7 + 0x10],	%f8
	movrgez	%i4,	0x062,	%o2
	udivx	%i1,	0x0F0D,	%l4
	fabss	%f3,	%f9
	fcmpeq32	%f14,	%f2,	%l3
	movvs	%xcc,	%l2,	%i6
	stx	%g2,	[%l7 + 0x48]
	ldsb	[%l7 + 0x62],	%l0
	tsubcc	%o1,	%i0,	%l5
	fmovsvs	%icc,	%f13,	%f12
	ld	[%l7 + 0x0C],	%f8
	ldsw	[%l7 + 0x38],	%i2
	addc	%i7,	0x05F7,	%l6
	ldub	[%l7 + 0x6A],	%g1
	stx	%o5,	[%l7 + 0x70]
	array32	%o6,	%o7,	%i5
	ldsh	[%l7 + 0x64],	%o0
	ld	[%l7 + 0x0C],	%f8
	sll	%i3,	0x0D,	%l1
	fmovsge	%xcc,	%f14,	%f12
	array8	%g5,	%g4,	%g7
	fxor	%f10,	%f0,	%f10
	ldub	[%l7 + 0x6A],	%o4
	fmovsa	%icc,	%f4,	%f12
	tle	%icc,	0x7
	ld	[%l7 + 0x1C],	%f10
	bge,pt	%xcc,	loop_326
loop_326:
	bn,a	loop_327
loop_327:
	udivx	%g3,	0x059B,	%o3
	orncc	%i4,	%g6,	%o2
	xor	%l4,	%i1,	%l3
	fmovdl	%xcc,	%f1,	%f8
	movne	%icc,	%i6,	%l2
	fxnor	%f6,	%f0,	%f10
	fcmpeq32	%f12,	%f14,	%g2
	st	%f10,	[%l7 + 0x44]
	brlz,a	%l0,	loop_328
loop_328:
	fmovdvc	%xcc,	%f15,	%f14
	tle	%xcc,	0x0
	edge32n	%i0,	%o1,	%i2
	bleu	%xcc,	loop_329
loop_329:
	bg,a	loop_330
loop_330:
	popc	%l5,	%l6
	stx	%i7,	[%l7 + 0x28]
	fnot2s	%f1,	%f13
	fbo	%fcc1,	loop_331
loop_331:
	sub	%o5,	%o6,	%o7
	movcs	%xcc,	%i5,	%o0
	sth	%g1,	[%l7 + 0x6C]
	std	%f4,	[%l7 + 0x68]
	movle	%xcc,	%i3,	%l1
	bneg,pt	%icc,	loop_332
loop_332:
	tpos	%xcc,	0x0
	st	%f7,	[%l7 + 0x5C]
	movre	%g5,	%g4,	%g7
	fabss	%f13,	%f11
	tleu	%icc,	0x1
	fxnors	%f2,	%f4,	%f11
	sll	%o4,	%o3,	%g3
	udivcc	%g6,	0x114B,	%o2
	fandnot2s	%f10,	%f11,	%f10
	array16	%i4,	%i1,	%l4
	movvc	%icc,	%i6,	%l3
	bneg,pt	%icc,	loop_333
loop_333:
	bpos	%xcc,	loop_334
loop_334:
	fmul8x16al	%f12,	%f8,	%f10
	ld	[%l7 + 0x24],	%f13
	nop
	setx loop_335, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_335:
	fcmpd	%fcc2,	%f10,	%f0
	ldsb	[%l7 + 0x15],	%l2
	fbule	%fcc0,	loop_336
loop_336:
	movrlez	%g2,	%i0,	%o1
	siam	0x0
	ldsw	[%l7 + 0x24],	%i2
	add	%l0,	0x14F5,	%l6
	ba,a	loop_337
loop_337:
	fxnors	%f9,	%f8,	%f15
	fcmped	%fcc0,	%f2,	%f6
	movrgz	%l5,	%o5,	%i7
	ta	%xcc,	0x2
	xnor	%o7,	0x1E99,	%o6
	nop
	setx loop_338, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_338:
	movl	%xcc,	%o0,	%g1
	fmovdpos	%xcc,	%f13,	%f6
	fmovsleu	%xcc,	%f4,	%f2
	brlez	%i5,	loop_339
loop_339:
	edge16l	%l1,	%i3,	%g5
	fornot2	%f4,	%f4,	%f12
	mulx	%g7,	%g4,	%o3
	stx	%g3,	[%l7 + 0x78]
	lduh	[%l7 + 0x66],	%o4
	brlz	%g6,	loop_340
loop_340:
	fmovdcs	%icc,	%f9,	%f8
	addcc	%o2,	%i1,	%i4
	fmul8x16	%f5,	%f6,	%f12
	ldsw	[%l7 + 0x4C],	%i6
	movcs	%xcc,	%l4,	%l2
	stb	%l3,	[%l7 + 0x61]
	ldd	[%l7 + 0x60],	%f4
	tvs	%xcc,	0x3
	ld	[%l7 + 0x08],	%f6
	fpadd16s	%f2,	%f8,	%f5
	brlez,a	%i0,	loop_341
loop_341:
	ta	%icc,	0x2
	tleu	%icc,	0x7
	fcmple16	%f10,	%f14,	%o1
	ba,pn	%icc,	loop_342
loop_342:
	umul	%g2,	0x0C00,	%l0
	bge,a,pt	%icc,	loop_343
loop_343:
	fmovsg	%icc,	%f8,	%f5
	fmovscs	%xcc,	%f13,	%f7
	fbule	%fcc0,	loop_344
loop_344:
	ba	loop_345
loop_345:
	movneg	%xcc,	%l6,	%i2
	fsrc1	%f4,	%f0
	brgez,a	%o5,	loop_346
loop_346:
	bpos,a	loop_347
loop_347:
	array32	%l5,	%i7,	%o7
	brnz,a	%o0,	loop_348
loop_348:
	fmovscs	%xcc,	%f1,	%f14
	brnz,a	%g1,	loop_349
loop_349:
	movrgez	%o6,	%i5,	%l1
	stx	%i3,	[%l7 + 0x60]
	ld	[%l7 + 0x64],	%f12
	fornot2s	%f11,	%f2,	%f6
	bgu,a	%xcc,	loop_350
loop_350:
	faligndata	%f8,	%f6,	%f8
	bgu,a,pn	%xcc,	loop_351
loop_351:
	fmovsg	%xcc,	%f13,	%f14
	srlx	%g7,	%g5,	%g4
	fmovrdne	%g3,	%f2,	%f14
	umul	%o3,	%o4,	%g6
	fand	%f6,	%f6,	%f6
	fnot2	%f4,	%f8
	tge	%icc,	0x6
	umulcc	%i1,	0x02BC,	%i4
	subccc	%i6,	0x19E5,	%l4
	tge	%icc,	0x1
	andncc	%l2,	%l3,	%o2
	array16	%o1,	%i0,	%l0
	fmovrsgez	%g2,	%f12,	%f4
	fbue,a	%fcc0,	loop_352
loop_352:
	stw	%l6,	[%l7 + 0x6C]
	fbul	%fcc3,	loop_353
loop_353:
	fpackfix	%f2,	%f9
	fcmple16	%f10,	%f14,	%i2
	fnot1	%f6,	%f6
	ldsb	[%l7 + 0x1C],	%o5
	edge16	%i7,	%l5,	%o7
	ldx	[%l7 + 0x60],	%g1
	xor	%o0,	%o6,	%l1
	fabss	%f12,	%f0
	ldd	[%l7 + 0x20],	%f8
	alignaddr	%i5,	%g7,	%g5
	fand	%f0,	%f10,	%f14
	ldub	[%l7 + 0x6E],	%i3
	fmul8sux16	%f6,	%f0,	%f0
	std	%f12,	[%l7 + 0x48]
	ldsh	[%l7 + 0x18],	%g3
	movvs	%icc,	%o3,	%o4
	stw	%g4,	[%l7 + 0x10]
	movle	%icc,	%i1,	%g6
	fpack16	%f12,	%f14
	fbug,a	%fcc1,	loop_354
loop_354:
	ldsh	[%l7 + 0x10],	%i6
	ld	[%l7 + 0x64],	%f15
	fbug,a	%fcc2,	loop_355
loop_355:
	edge16l	%i4,	%l2,	%l4
	fandnot1	%f4,	%f6,	%f4
	movrlz	%o2,	0x0D4,	%l3
	movrgz	%i0,	%l0,	%g2
	brgez,a	%l6,	loop_356
loop_356:
	ldsb	[%l7 + 0x4E],	%i2
	ldsw	[%l7 + 0x1C],	%o1
	fones	%f8
	sethi	0x1DB6,	%i7
	stb	%o5,	[%l7 + 0x57]
	nop
	setx loop_357, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_357:
	ldsw	[%l7 + 0x48],	%o7
	fmovrdne	%l5,	%f12,	%f14
	fbe	%fcc1,	loop_358
loop_358:
	movcc	%xcc,	%g1,	%o0
	pdist	%f6,	%f12,	%f2
	ld	[%l7 + 0x28],	%f12
	ldsh	[%l7 + 0x0E],	%l1
	brlz	%i5,	loop_359
loop_359:
	stx	%o6,	[%l7 + 0x58]
	bpos,pt	%icc,	loop_360
loop_360:
	srax	%g5,	%g7,	%g3
	movvc	%icc,	%o3,	%i3
	movg	%xcc,	%o4,	%i1
	bne,pt	%icc,	loop_361
loop_361:
	te	%xcc,	0x5
	movl	%xcc,	%g4,	%g6
	ba,a	loop_362
loop_362:
	lduh	[%l7 + 0x48],	%i4
	movrlez	%i6,	%l4,	%l2
	fmovsn	%xcc,	%f0,	%f1
	sth	%l3,	[%l7 + 0x6A]
	fpmerge	%f3,	%f13,	%f14
	bl,a	%xcc,	loop_363
loop_363:
	ldsw	[%l7 + 0x08],	%o2
	fmovdge	%xcc,	%f7,	%f9
	lduh	[%l7 + 0x46],	%l0
	fmovsg	%xcc,	%f2,	%f12
	brz,a	%i0,	loop_364
loop_364:
	movne	%icc,	%g2,	%i2
	fpack32	%f2,	%f10,	%f0
	fornot2s	%f4,	%f11,	%f2
	fmul8ulx16	%f10,	%f4,	%f14
	movrgz	%o1,	%i7,	%o5
	udiv	%l6,	0x0E4A,	%l5
	fmovsge	%xcc,	%f10,	%f9
	lduh	[%l7 + 0x50],	%g1
	brlez,a	%o0,	loop_365
loop_365:
	bcc,a	loop_366
loop_366:
	ld	[%l7 + 0x7C],	%f7
	fmovrslz	%o7,	%f5,	%f13
	sdivcc	%l1,	0x1056,	%i5
	movvc	%xcc,	%o6,	%g5
	move	%icc,	%g7,	%g3
	sth	%i3,	[%l7 + 0x62]
	array16	%o4,	%o3,	%g4
	fmovdneg	%icc,	%f4,	%f7
	ldx	[%l7 + 0x58],	%g6
	edge8n	%i1,	%i6,	%l4
	fbule	%fcc0,	loop_367
loop_367:
	tsubcc	%i4,	0x0488,	%l2
	ldub	[%l7 + 0x09],	%l3
	smulcc	%o2,	%i0,	%g2
	fbne	%fcc2,	loop_368
loop_368:
	fmovsn	%xcc,	%f13,	%f3
	brlz	%i2,	loop_369
loop_369:
	sub	%l0,	0x08BE,	%o1
	lduh	[%l7 + 0x6E],	%i7
	fornot1s	%f2,	%f8,	%f8
	edge8n	%o5,	%l6,	%g1
	orcc	%l5,	0x138F,	%o0
	fmovdgu	%xcc,	%f0,	%f5
	fabsd	%f8,	%f4
	fpsub32s	%f6,	%f15,	%f5
	edge8	%o7,	%i5,	%l1
	fmovdle	%icc,	%f3,	%f1
	fbule,a	%fcc2,	loop_370
loop_370:
	stw	%g5,	[%l7 + 0x10]
	brlz	%o6,	loop_371
loop_371:
	fcmple16	%f14,	%f14,	%g3
	fbge,a	%fcc3,	loop_372
loop_372:
	srl	%g7,	0x0F,	%o4
	edge8	%o3,	%g4,	%g6
	orcc	%i3,	%i6,	%i1
	fcmpgt16	%f4,	%f12,	%l4
	ldx	[%l7 + 0x08],	%i4
	fmovrdlz	%l3,	%f6,	%f0
	bpos,pt	%icc,	loop_373
loop_373:
	nop
	setx loop_374, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_374:
	tsubcc	%o2,	%i0,	%l2
	xor	%i2,	0x18B3,	%g2
	ldsh	[%l7 + 0x4C],	%o1
	tneg	%icc,	0x7
	bcs	loop_375
loop_375:
	stx	%l0,	[%l7 + 0x40]
	fmul8ulx16	%f14,	%f10,	%f0
	udivx	%o5,	0x0581,	%l6
	subcc	%g1,	%l5,	%i7
	tn	%icc,	0x6
	subc	%o0,	0x162D,	%o7
	fmovsgu	%xcc,	%f3,	%f15
	ldx	[%l7 + 0x60],	%i5
	fpack16	%f6,	%f11
	ldub	[%l7 + 0x23],	%l1
	movcc	%xcc,	%g5,	%g3
	sth	%o6,	[%l7 + 0x52]
	srax	%o4,	%o3,	%g7
	lduw	[%l7 + 0x24],	%g4
	fcmpeq16	%f6,	%f6,	%g6
	addc	%i6,	0x1151,	%i3
	stx	%i1,	[%l7 + 0x68]
	fmuld8sux16	%f3,	%f10,	%f12
	sth	%i4,	[%l7 + 0x2C]
	stb	%l4,	[%l7 + 0x34]
	fmovsn	%icc,	%f5,	%f14
	tneg	%icc,	0x4
	tcs	%icc,	0x4
	ld	[%l7 + 0x28],	%f2
	faligndata	%f10,	%f2,	%f4
	stw	%l3,	[%l7 + 0x10]
	edge32n	%i0,	%o2,	%i2
	udiv	%g2,	0x1981,	%l2
	fcmpgt32	%f2,	%f10,	%o1
	fmovde	%xcc,	%f12,	%f0
	sra	%o5,	%l0,	%g1
	tvc	%xcc,	0x7
	fcmpne16	%f4,	%f14,	%l5
	fpadd16s	%f12,	%f2,	%f0
	movcs	%xcc,	%i7,	%l6
	ldsw	[%l7 + 0x08],	%o0
	edge16l	%i5,	%l1,	%g5
	movrlez	%o7,	0x3A7,	%g3
	te	%xcc,	0x4
	fmovscs	%xcc,	%f14,	%f9
	lduw	[%l7 + 0x08],	%o6
	stx	%o4,	[%l7 + 0x18]
	ta	%icc,	0x5
	nop
	setx loop_376, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_376:
	ldsb	[%l7 + 0x42],	%o3
	fornot2s	%f2,	%f11,	%f1
	tvs	%xcc,	0x4
	bleu,a,pt	%xcc,	loop_377
loop_377:
	add	%g7,	%g6,	%i6
	fzero	%f10
	xorcc	%g4,	%i3,	%i4
	fmovdg	%xcc,	%f7,	%f11
	lduh	[%l7 + 0x5C],	%i1
	nop
	setx loop_378, %l0, %l1
	jmpl %l1, %l3
loop_378:
	fmovrdlz	%i0,	%f6,	%f0
	bneg,pn	%xcc,	loop_379
loop_379:
	fmovsgu	%icc,	%f8,	%f13
	stb	%l4,	[%l7 + 0x56]
	fbu	%fcc2,	loop_380
loop_380:
	stw	%o2,	[%l7 + 0x50]
	for	%f14,	%f4,	%f8
	fmovsge	%icc,	%f9,	%f15
	stw	%g2,	[%l7 + 0x54]
	fors	%f12,	%f1,	%f4
	sth	%i2,	[%l7 + 0x56]
	ta	%icc,	0x7
	brgez,a	%l2,	loop_381
loop_381:
	andncc	%o5,	%o1,	%l0
	bcc	%icc,	loop_382
loop_382:
	fandnot1s	%f10,	%f4,	%f13
	std	%f2,	[%l7 + 0x70]
	fmovdcc	%icc,	%f12,	%f4
	stx	%l5,	[%l7 + 0x50]
	fbg	%fcc3,	loop_383
loop_383:
	movrlez	%g1,	0x287,	%l6
	fbn	%fcc2,	loop_384
loop_384:
	siam	0x0
	ldd	[%l7 + 0x38],	%f6
	fnor	%f0,	%f12,	%f14
	subc	%i7,	%i5,	%l1
	array16	%o0,	%o7,	%g3
	ldsh	[%l7 + 0x6A],	%g5
	nop
	setx loop_385, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_385:
	lduw	[%l7 + 0x70],	%o4
	tvs	%xcc,	0x3
	popc	0x12F3,	%o3
	fnand	%f8,	%f0,	%f10
	fmovdg	%xcc,	%f9,	%f0
	mulx	%g7,	0x063E,	%o6
	ta	%xcc,	0x5
	tg	%xcc,	0x3
	umulcc	%g6,	0x193B,	%g4
	bl,pt	%xcc,	loop_386
loop_386:
	be,a,pn	%xcc,	loop_387
loop_387:
	fpadd32s	%f14,	%f8,	%f2
	addccc	%i3,	0x0459,	%i4
	xorcc	%i1,	0x1752,	%l3
	fcmped	%fcc1,	%f4,	%f10
	fcmpgt16	%f10,	%f10,	%i0
	std	%f0,	[%l7 + 0x40]
	fcmped	%fcc1,	%f6,	%f12
	brlz	%i6,	loop_388
loop_388:
	udiv	%l4,	0x19BC,	%g2
	ldsw	[%l7 + 0x38],	%o2
	ldsw	[%l7 + 0x70],	%l2
	stb	%o5,	[%l7 + 0x62]
	nop
	setx loop_389, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_389:
	siam	0x6
	fabsd	%f10,	%f12
	nop
	setx loop_390, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_390:
	subc	%o1,	0x010B,	%l0
	fpackfix	%f8,	%f4
	fones	%f2
	fmovsg	%xcc,	%f11,	%f15
	nop
	setx loop_391, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_391:
	fxors	%f8,	%f11,	%f0
	edge32	%i2,	%g1,	%l5
	fbug,a	%fcc0,	loop_392
loop_392:
	tg	%xcc,	0x7
	movvs	%icc,	%l6,	%i7
	ldsw	[%l7 + 0x28],	%l1
	fmovsvs	%xcc,	%f6,	%f6
	lduh	[%l7 + 0x24],	%i5
	ldx	[%l7 + 0x28],	%o7
	bl,pn	%icc,	loop_393
loop_393:
	subccc	%g3,	0x18E5,	%o0
	bneg,a	loop_394
loop_394:
	fmovrde	%o4,	%f10,	%f14
	stw	%g5,	[%l7 + 0x60]
	ldd	[%l7 + 0x18],	%f8
	subcc	%g7,	0x0074,	%o3
	edge8	%g6,	%o6,	%i3
	fbu	%fcc2,	loop_395
loop_395:
	fnor	%f8,	%f10,	%f0
	ble	%xcc,	loop_396
loop_396:
	ba	loop_397
loop_397:
	fbug,a	%fcc0,	loop_398
loop_398:
	fmovsvs	%icc,	%f12,	%f14
	fnand	%f4,	%f14,	%f8
	bvc,a	%xcc,	loop_399
loop_399:
	fbul,a	%fcc3,	loop_400
loop_400:
	ld	[%l7 + 0x70],	%f8
	bvs,pn	%icc,	loop_401
loop_401:
	brz,a	%i4,	loop_402
loop_402:
	fbge	%fcc0,	loop_403
loop_403:
	bgu,a,pn	%xcc,	loop_404
loop_404:
	fmovrdgz	%g4,	%f8,	%f10
	nop
	setx loop_405, %l0, %l1
	jmpl %l1, %i1
loop_405:
	ldub	[%l7 + 0x6C],	%i0
	smul	%i6,	0x11D3,	%l4
	ldsw	[%l7 + 0x44],	%l3
	fbg	%fcc3,	loop_406
loop_406:
	fmovs	%f6,	%f6
	edge16n	%o2,	%g2,	%o5
	fba,a	%fcc2,	loop_407
loop_407:
	fmovscc	%icc,	%f1,	%f0
	fbn,a	%fcc0,	loop_408
loop_408:
	fornot2s	%f2,	%f12,	%f8
	nop
	setx loop_409, %l0, %l1
	jmpl %l1, %l2
loop_409:
	nop
	setx loop_410, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_410:
	umul	%l0,	%o1,	%g1
	fblg	%fcc0,	loop_411
loop_411:
	te	%xcc,	0x0
	fornot2s	%f5,	%f14,	%f3
	fzero	%f4
	fmul8x16al	%f6,	%f14,	%f4
	fones	%f2
	bn	loop_412
loop_412:
	bl	loop_413
loop_413:
	fnor	%f0,	%f0,	%f2
	fbl	%fcc2,	loop_414
loop_414:
	srax	%l5,	%i2,	%i7
	addccc	%l1,	%l6,	%i5
	tcc	%xcc,	0x3
	ldub	[%l7 + 0x4C],	%o7
	bvc,a	loop_415
loop_415:
	bl,pn	%xcc,	loop_416
loop_416:
	fcmpne16	%f14,	%f0,	%o0
	fpsub32	%f4,	%f2,	%f0
	fmul8sux16	%f2,	%f12,	%f12
	stb	%g3,	[%l7 + 0x3C]
	fsrc2s	%f0,	%f12
	array8	%o4,	%g7,	%g5
	fpmerge	%f3,	%f1,	%f10
	sethi	0x00E5,	%g6
	fpadd32	%f6,	%f6,	%f6
	sll	%o6,	%o3,	%i4
	movleu	%xcc,	%i3,	%i1
	fpadd32	%f0,	%f10,	%f2
	st	%f5,	[%l7 + 0x5C]
	bpos	%xcc,	loop_417
loop_417:
	subcc	%g4,	0x1CDB,	%i0
	tl	%icc,	0x0
	fcmps	%fcc0,	%f12,	%f13
	fornot1	%f8,	%f10,	%f8
	ldsh	[%l7 + 0x52],	%l4
	fmovsvc	%icc,	%f0,	%f5
	ld	[%l7 + 0x38],	%f14
	subcc	%i6,	0x05F3,	%l3
	fsrc2	%f12,	%f8
	fsrc2s	%f7,	%f5
	tcs	%xcc,	0x0
	xnor	%o2,	0x0053,	%g2
	bshuffle	%f8,	%f14,	%f12
	fmovdcc	%icc,	%f5,	%f6
	ld	[%l7 + 0x1C],	%f13
	brgz	%l2,	loop_418
loop_418:
	brnz	%o5,	loop_419
loop_419:
	ldsb	[%l7 + 0x5A],	%l0
	and	%o1,	%l5,	%g1
	fcmpgt16	%f10,	%f6,	%i2
	fmul8x16au	%f13,	%f5,	%f10
	siam	0x5
	taddcctv	%l1,	%l6,	%i5
	fsrc1	%f6,	%f2
	bg,a,pt	%icc,	loop_420
loop_420:
	ldub	[%l7 + 0x45],	%i7
	brnz,a	%o7,	loop_421
loop_421:
	call	loop_422
loop_422:
	brgez	%o0,	loop_423
loop_423:
	ld	[%l7 + 0x38],	%f7
	fmovdleu	%icc,	%f0,	%f10
	fcmpgt32	%f4,	%f8,	%g3
	ldsh	[%l7 + 0x14],	%o4
	fornot1s	%f15,	%f11,	%f8
	sth	%g5,	[%l7 + 0x14]
	taddcc	%g7,	0x10B9,	%g6
	addc	%o6,	0x0B72,	%i4
	tn	%xcc,	0x0
	ldsw	[%l7 + 0x64],	%i3
	fnands	%f10,	%f4,	%f7
	fmovrdlz	%i1,	%f0,	%f4
	fnot2s	%f10,	%f4
	ldx	[%l7 + 0x20],	%g4
	fpadd16	%f10,	%f6,	%f2
	fmovdn	%icc,	%f9,	%f15
	bvs,a	loop_424
loop_424:
	sdiv	%i0,	0x1A5B,	%l4
	fmovdl	%xcc,	%f1,	%f10
	edge32l	%o3,	%l3,	%o2
	fbn	%fcc2,	loop_425
loop_425:
	bneg,pt	%icc,	loop_426
loop_426:
	fxnor	%f0,	%f2,	%f10
	and	%g2,	%l2,	%o5
	sth	%l0,	[%l7 + 0x70]
	ldsb	[%l7 + 0x1E],	%o1
	movre	%i6,	%l5,	%g1
	movrgz	%i2,	0x07E,	%l1
	ldsb	[%l7 + 0x57],	%i5
	tcc	%icc,	0x3
	udivx	%l6,	0x165C,	%i7
	edge8n	%o7,	%o0,	%g3
	fmovspos	%xcc,	%f7,	%f10
	fblg	%fcc1,	loop_427
loop_427:
	fba,a	%fcc1,	loop_428
loop_428:
	bn,pt	%xcc,	loop_429
loop_429:
	fnors	%f10,	%f1,	%f11
	fmovdpos	%xcc,	%f12,	%f8
	fandnot2	%f2,	%f10,	%f10
	lduh	[%l7 + 0x20],	%g5
	udivcc	%o4,	0x1F75,	%g6
	popc	0x12F5,	%g7
	bne,a	loop_430
loop_430:
	siam	0x0
	movcc	%icc,	%o6,	%i4
	edge8n	%i1,	%i3,	%g4
	fmovrdlez	%l4,	%f2,	%f10
	movleu	%xcc,	%i0,	%l3
	bne,a,pt	%icc,	loop_431
loop_431:
	fmovrdgz	%o2,	%f6,	%f8
	addcc	%g2,	%l2,	%o3
	movgu	%xcc,	%o5,	%l0
	ldsh	[%l7 + 0x28],	%o1
	brlez,a	%l5,	loop_432
loop_432:
	faligndata	%f10,	%f14,	%f6
	ldd	[%l7 + 0x58],	%f8
	ldd	[%l7 + 0x68],	%f12
	brgez	%i6,	loop_433
loop_433:
	tge	%xcc,	0x1
	edge8	%i2,	%g1,	%l1
	fmuld8sux16	%f4,	%f11,	%f14
	xor	%l6,	0x0B81,	%i7
	bl	%xcc,	loop_434
loop_434:
	fmovrsgz	%o7,	%f9,	%f11
	brgez,a	%o0,	loop_435
loop_435:
	fbug,a	%fcc3,	loop_436
loop_436:
	fmovdvc	%icc,	%f8,	%f9
	lduw	[%l7 + 0x64],	%g3
	tg	%xcc,	0x4
	fpack32	%f6,	%f2,	%f8
	ld	[%l7 + 0x7C],	%f13
	fmul8x16au	%f9,	%f12,	%f8
	fmovrdne	%i5,	%f14,	%f8
	ldd	[%l7 + 0x60],	%f0
	movge	%xcc,	%o4,	%g5
	edge16ln	%g6,	%g7,	%o6
	movrgez	%i4,	0x116,	%i3
	fornot1	%f6,	%f6,	%f10
	lduh	[%l7 + 0x4E],	%i1
	bgu,a	%xcc,	loop_437
loop_437:
	ldsb	[%l7 + 0x58],	%g4
	brlez,a	%l4,	loop_438
loop_438:
	fabsd	%f0,	%f10
	and	%l3,	0x05A7,	%i0
	fmovdgu	%icc,	%f14,	%f13
	bcc,a	%icc,	loop_439
loop_439:
	sth	%g2,	[%l7 + 0x28]
	fxor	%f12,	%f14,	%f8
	brnz	%l2,	loop_440
loop_440:
	tcc	%icc,	0x5
	xnor	%o3,	%o5,	%o2
	fbuge	%fcc0,	loop_441
loop_441:
	tsubcctv	%o1,	%l5,	%l0
	movrlez	%i2,	0x080,	%g1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type f   	: 285
!	Type cti   	: 187
!	Type i   	: 316
!	Type l   	: 212
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
main_t2:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0xA,	%g2
	set	0xA,	%g3
	set	0x2,	%g4
	set	0x1,	%g5
	set	0x8,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x1,	%i1
	set	-0xD,	%i2
	set	-0xE,	%i3
	set	-0x7,	%i4
	set	-0x2,	%i5
	set	-0x4,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x1AD31E3E,	%l0
	set	0x7C199E87,	%l1
	set	0x372F4571,	%l2
	set	0x1587B82D,	%l3
	set	0x311CEC29,	%l4
	set	0x457F598F,	%l5
	set	0x46A967BB,	%l6
	!# Output registers
	set	-0x0CB5,	%o0
	set	-0x14CF,	%o1
	set	-0x1EA6,	%o2
	set	-0x14C6,	%o3
	set	0x10F8,	%o4
	set	-0x0B42,	%o5
	set	-0x05D9,	%o6
	set	0x1CE7,	%o7

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

	stw	%l1,	[%l7 + 0x50]
	sdivx	%i6,	0x0042,	%l6
	movvs	%xcc,	%i7,	%o7
	movrgz	%o0,	0x088,	%g3
	tgu	%icc,	0x2
	tleu	%icc,	0x4
	orncc	%i5,	%o4,	%g5
	edge32	%g7,	%o6,	%i4
	siam	0x4
	tge	%icc,	0x4
	orcc	%i3,	%i1,	%g4
	andn	%l4,	%g6,	%i0
	tn	%xcc,	0x7
	movrgez	%l3,	%g2,	%l2
	ldub	[%l7 + 0x1E],	%o3
	st	%f8,	[%l7 + 0x20]
	fmul8x16al	%f10,	%f9,	%f12
	movvs	%xcc,	%o2,	%o5
	stx	%l5,	[%l7 + 0x60]
	ld	[%l7 + 0x74],	%f8
	lduw	[%l7 + 0x54],	%l0
	ldub	[%l7 + 0x5C],	%o1
	call	loop_442
loop_442:
	faligndata	%f12,	%f14,	%f6
	st	%f11,	[%l7 + 0x3C]
	mulscc	%i2,	0x1A54,	%l1
	mulscc	%i6,	%l6,	%g1
	fcmpeq32	%f2,	%f8,	%o7
	ldd	[%l7 + 0x18],	%f8
	sllx	%o0,	%g3,	%i7
	fpsub32s	%f1,	%f11,	%f0
	fnor	%f4,	%f0,	%f6
	xnor	%i5,	%o4,	%g7
	ba,a	loop_443
loop_443:
	fmovrslez	%o6,	%f5,	%f7
	fmul8sux16	%f0,	%f14,	%f0
	edge32	%g5,	%i4,	%i1
	ba,a	loop_444
loop_444:
	popc	0x01DA,	%i3
	fmovdleu	%xcc,	%f0,	%f9
	nop
	setx loop_445, %l0, %l1
	jmpl %l1, %g4
loop_445:
	bvs,a	%icc,	loop_446
loop_446:
	udivx	%l4,	0x07BD,	%i0
	stx	%g6,	[%l7 + 0x10]
	fnor	%f2,	%f8,	%f6
	sub	%l3,	%g2,	%o3
	ldsh	[%l7 + 0x30],	%l2
	udivx	%o2,	0x19F4,	%l5
	fnors	%f0,	%f11,	%f2
	brgz	%l0,	loop_447
loop_447:
	tcc	%xcc,	0x0
	udivcc	%o5,	0x0DF6,	%o1
	ld	[%l7 + 0x50],	%f1
	lduh	[%l7 + 0x40],	%i2
	stb	%l1,	[%l7 + 0x63]
	bl	loop_448
loop_448:
	ldsw	[%l7 + 0x34],	%l6
	movcc	%icc,	%g1,	%i6
	tn	%icc,	0x3
	stx	%o0,	[%l7 + 0x68]
	fcmpd	%fcc0,	%f12,	%f8
	tg	%icc,	0x5
	tvc	%icc,	0x1
	tle	%icc,	0x2
	sdiv	%g3,	0x0108,	%o7
	fmovsa	%icc,	%f11,	%f0
	brgez	%i7,	loop_449
loop_449:
	movne	%xcc,	%o4,	%i5
	fbu,a	%fcc1,	loop_450
loop_450:
	fbl,a	%fcc0,	loop_451
loop_451:
	fmovdl	%xcc,	%f3,	%f0
	ldsw	[%l7 + 0x08],	%o6
	alignaddrl	%g5,	%i4,	%i1
	ldx	[%l7 + 0x40],	%i3
	bshuffle	%f0,	%f8,	%f10
	stx	%g7,	[%l7 + 0x28]
	umul	%l4,	0x1CD3,	%i0
	edge32l	%g4,	%l3,	%g2
	nop
	setx loop_452, %l0, %l1
	jmpl %l1, %g6
loop_452:
	array8	%o3,	%o2,	%l2
	ldub	[%l7 + 0x0D],	%l5
	movg	%icc,	%o5,	%o1
	movrlz	%i2,	%l1,	%l6
	tl	%xcc,	0x3
	fmuld8sux16	%f12,	%f5,	%f0
	fpack32	%f6,	%f6,	%f12
	udiv	%g1,	0x15F0,	%i6
	fones	%f6
	fmovrdlz	%o0,	%f8,	%f6
	fmul8ulx16	%f14,	%f4,	%f12
	ldub	[%l7 + 0x11],	%g3
	fbu,a	%fcc0,	loop_453
loop_453:
	tl	%xcc,	0x5
	subccc	%l0,	%i7,	%o7
	ldx	[%l7 + 0x60],	%o4
	tn	%xcc,	0x0
	fcmpgt16	%f8,	%f10,	%i5
	fbule	%fcc1,	loop_454
loop_454:
	tsubcc	%g5,	%o6,	%i1
	srlx	%i3,	%g7,	%l4
	lduw	[%l7 + 0x24],	%i4
	tn	%xcc,	0x1
	orncc	%g4,	0x1833,	%i0
	or	%g2,	0x0D7A,	%l3
	movne	%icc,	%o3,	%g6
	tsubcctv	%o2,	%l5,	%o5
	tvc	%icc,	0x4
	fmul8x16	%f7,	%f4,	%f2
	srax	%o1,	0x15,	%i2
	movvs	%xcc,	%l1,	%l6
	fpadd32	%f8,	%f12,	%f8
	fandnot1s	%f7,	%f4,	%f7
	fbe,a	%fcc1,	loop_455
loop_455:
	srax	%l2,	%i6,	%g1
	mova	%icc,	%g3,	%o0
	nop
	setx loop_456, %l0, %l1
	jmpl %l1, %l0
loop_456:
	fmuld8sux16	%f4,	%f9,	%f6
	fmovd	%f0,	%f4
	edge32ln	%o7,	%o4,	%i7
	ldub	[%l7 + 0x7D],	%i5
	mulx	%o6,	%g5,	%i1
	fbuge,a	%fcc0,	loop_457
loop_457:
	sdivcc	%i3,	0x0682,	%l4
	taddcctv	%g7,	%i4,	%g4
	nop
	setx loop_458, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_458:
	orncc	%i0,	0x0B9B,	%l3
	edge16n	%g2,	%o3,	%o2
	fbo,a	%fcc2,	loop_459
loop_459:
	stx	%l5,	[%l7 + 0x30]
	fmovsne	%icc,	%f6,	%f7
	movrlz	%o5,	%o1,	%g6
	tl	%xcc,	0x7
	ld	[%l7 + 0x50],	%f0
	edge8n	%i2,	%l1,	%l2
	addc	%l6,	0x1B27,	%i6
	fmovscc	%xcc,	%f2,	%f1
	movre	%g3,	%g1,	%l0
	bl,a	loop_460
loop_460:
	tcs	%xcc,	0x0
	udivx	%o7,	0x0A40,	%o0
	movcc	%xcc,	%i7,	%i5
	fmovrde	%o4,	%f10,	%f14
	fmovspos	%icc,	%f0,	%f2
	taddcc	%o6,	%g5,	%i3
	xorcc	%i1,	%l4,	%g7
	sra	%i4,	%g4,	%i0
	bvc,pn	%xcc,	loop_461
loop_461:
	ldub	[%l7 + 0x1D],	%l3
	array32	%g2,	%o3,	%o2
	edge8	%o5,	%l5,	%o1
	fmovsgu	%icc,	%f0,	%f8
	array8	%i2,	%l1,	%g6
	stx	%l6,	[%l7 + 0x50]
	movle	%xcc,	%l2,	%i6
	xnor	%g1,	%l0,	%o7
	udiv	%g3,	0x11E5,	%i7
	bg,pt	%icc,	loop_462
loop_462:
	movrgz	%i5,	%o4,	%o6
	fmovdleu	%icc,	%f8,	%f0
	array8	%o0,	%g5,	%i3
	orn	%l4,	%i1,	%i4
	taddcc	%g4,	0x074E,	%i0
	mulx	%l3,	0x0D1C,	%g2
	brnz,a	%g7,	loop_463
loop_463:
	array8	%o3,	%o2,	%l5
	move	%xcc,	%o1,	%i2
	orncc	%o5,	%l1,	%g6
	fnands	%f14,	%f0,	%f13
	movgu	%icc,	%l6,	%i6
	stx	%l2,	[%l7 + 0x78]
	fmovrde	%l0,	%f0,	%f2
	edge32l	%g1,	%g3,	%o7
	orcc	%i5,	%o4,	%i7
	fpsub32	%f6,	%f0,	%f14
	or	%o0,	0x047E,	%g5
	movgu	%icc,	%o6,	%i3
	addcc	%i1,	%i4,	%g4
	sll	%i0,	%l4,	%g2
	tne	%icc,	0x0
	movleu	%xcc,	%l3,	%g7
	fmovdcs	%xcc,	%f5,	%f6
	nop
	setx loop_464, %l0, %l1
	jmpl %l1, %o3
loop_464:
	tneg	%icc,	0x4
	sll	%l5,	0x09,	%o1
	tsubcctv	%o2,	0x05D2,	%o5
	fmovrse	%i2,	%f0,	%f4
	fmovdpos	%xcc,	%f8,	%f4
	orcc	%l1,	0x01DF,	%g6
	edge32n	%l6,	%i6,	%l0
	sethi	0x1BEC,	%l2
	lduh	[%l7 + 0x2C],	%g1
	pdist	%f12,	%f2,	%f4
	fmovrse	%o7,	%f10,	%f10
	movre	%g3,	0x21E,	%i5
	movl	%icc,	%o4,	%i7
	lduw	[%l7 + 0x24],	%o0
	tvs	%icc,	0x7
	nop
	setx loop_465, %l0, %l1
	jmpl %l1, %g5
loop_465:
	xnor	%i3,	0x08D8,	%i1
	fxors	%f13,	%f9,	%f5
	fmovsn	%xcc,	%f0,	%f14
	sllx	%o6,	0x1D,	%i4
	ld	[%l7 + 0x78],	%f1
	fcmped	%fcc2,	%f0,	%f12
	xor	%i0,	%g4,	%g2
	fpadd32s	%f6,	%f14,	%f0
	movge	%icc,	%l4,	%l3
	umulcc	%o3,	%l5,	%o1
	bn,pt	%xcc,	loop_466
loop_466:
	mulx	%g7,	%o2,	%o5
	ldsh	[%l7 + 0x14],	%l1
	popc	%i2,	%l6
	fbug	%fcc0,	loop_467
loop_467:
	subcc	%i6,	%g6,	%l0
	sdiv	%l2,	0x14C3,	%o7
	fexpand	%f14,	%f8
	movrgez	%g1,	%i5,	%g3
	fnegs	%f12,	%f3
	edge32	%o4,	%i7,	%g5
	umulcc	%o0,	%i3,	%o6
	movneg	%xcc,	%i1,	%i4
	movge	%icc,	%i0,	%g4
	xor	%l4,	0x11A8,	%l3
	andncc	%g2,	%l5,	%o3
	fcmps	%fcc3,	%f2,	%f10
	mulx	%g7,	0x192B,	%o2
	and	%o1,	%l1,	%o5
	tl	%xcc,	0x3
	edge32l	%i2,	%l6,	%i6
	bg,pt	%icc,	loop_468
loop_468:
	tvc	%icc,	0x5
	movcs	%xcc,	%l0,	%l2
	fmovrdlz	%g6,	%f12,	%f8
	ldd	[%l7 + 0x48],	%f12
	orncc	%g1,	0x0DB8,	%o7
	srax	%g3,	%i5,	%o4
	stb	%g5,	[%l7 + 0x6A]
	tgu	%icc,	0x7
	ta	%xcc,	0x1
	edge8	%o0,	%i3,	%i7
	sra	%o6,	0x11,	%i1
	fmovsge	%xcc,	%f0,	%f5
	subccc	%i4,	%g4,	%l4
	fmovrslez	%l3,	%f5,	%f0
	fmul8x16au	%f6,	%f8,	%f0
	tcs	%xcc,	0x3
	mulx	%g2,	%l5,	%i0
	fmul8sux16	%f6,	%f2,	%f4
	fmovsvc	%icc,	%f10,	%f6
	st	%f10,	[%l7 + 0x2C]
	addcc	%g7,	%o3,	%o2
	sth	%o1,	[%l7 + 0x48]
	movleu	%icc,	%o5,	%l1
	alignaddr	%l6,	%i6,	%l0
	sll	%i2,	0x02,	%l2
	edge8l	%g6,	%g1,	%o7
	edge16n	%i5,	%o4,	%g3
	fbo	%fcc2,	loop_469
loop_469:
	tneg	%icc,	0x1
	fnot1s	%f15,	%f5
	fmovsgu	%icc,	%f5,	%f1
	fmovsge	%xcc,	%f12,	%f12
	ba,a	%xcc,	loop_470
loop_470:
	fmovrde	%g5,	%f10,	%f10
	addc	%i3,	0x1B91,	%o0
	fmovd	%f12,	%f8
	ldd	[%l7 + 0x68],	%f12
	lduh	[%l7 + 0x7A],	%o6
	fnegs	%f3,	%f1
	movleu	%xcc,	%i1,	%i7
	bvc,a,pn	%icc,	loop_471
loop_471:
	ldd	[%l7 + 0x70],	%f6
	ld	[%l7 + 0x20],	%f2
	lduw	[%l7 + 0x48],	%i4
	fnor	%f0,	%f12,	%f12
	stx	%l4,	[%l7 + 0x78]
	srlx	%l3,	0x00,	%g2
	movleu	%icc,	%g4,	%l5
	fbg	%fcc0,	loop_472
loop_472:
	udivcc	%i0,	0x0F28,	%o3
	be,a,pn	%xcc,	loop_473
loop_473:
	bge,a	%xcc,	loop_474
loop_474:
	fmovrde	%g7,	%f0,	%f6
	stw	%o2,	[%l7 + 0x68]
	lduw	[%l7 + 0x24],	%o1
	sethi	0x099A,	%l1
	fxnors	%f13,	%f14,	%f10
	te	%icc,	0x7
	srlx	%l6,	%o5,	%i6
	ldsw	[%l7 + 0x44],	%l0
	alignaddr	%i2,	%g6,	%g1
	tg	%icc,	0x3
	te	%icc,	0x4
	fmovdle	%xcc,	%f13,	%f9
	fsrc1s	%f6,	%f1
	fmovdvs	%xcc,	%f0,	%f6
	ld	[%l7 + 0x38],	%f15
	movvs	%xcc,	%l2,	%i5
	movne	%xcc,	%o4,	%o7
	orncc	%g5,	0x1F3C,	%g3
	array32	%i3,	%o0,	%o6
	subcc	%i1,	%i4,	%l4
	sethi	0x135B,	%l3
	edge16n	%g2,	%i7,	%l5
	movrlez	%g4,	0x0CC,	%o3
	fmul8x16au	%f7,	%f14,	%f8
	subccc	%g7,	%i0,	%o1
	ldsh	[%l7 + 0x1E],	%o2
	edge8	%l6,	%l1,	%i6
	xor	%l0,	0x1CDE,	%o5
	edge8n	%i2,	%g6,	%g1
	subcc	%i5,	%o4,	%o7
	fmovdleu	%icc,	%f6,	%f15
	movne	%icc,	%l2,	%g3
	fmovrdne	%i3,	%f8,	%f10
	orncc	%o0,	%o6,	%i1
	ta	%xcc,	0x6
	bvc,a,pt	%icc,	loop_475
loop_475:
	ta	%icc,	0x2
	edge32	%i4,	%l4,	%l3
	ldsw	[%l7 + 0x1C],	%g2
	fmovdg	%icc,	%f14,	%f10
	movge	%icc,	%g5,	%l5
	faligndata	%f14,	%f2,	%f4
	movg	%xcc,	%i7,	%g4
	lduh	[%l7 + 0x56],	%g7
	fnand	%f2,	%f4,	%f10
	fbule,a	%fcc0,	loop_476
loop_476:
	fmovdleu	%icc,	%f5,	%f13
	srl	%o3,	0x07,	%i0
	fbg	%fcc1,	loop_477
loop_477:
	fmovdl	%xcc,	%f7,	%f12
	movne	%icc,	%o1,	%l6
	fornot1s	%f1,	%f8,	%f14
	movrgz	%o2,	0x16A,	%l1
	ldsb	[%l7 + 0x7D],	%l0
	st	%f8,	[%l7 + 0x0C]
	udiv	%i6,	0x0BDC,	%o5
	bleu	%icc,	loop_478
loop_478:
	popc	%g6,	%i2
	movrne	%i5,	0x261,	%g1
	ldsh	[%l7 + 0x66],	%o4
	edge32l	%l2,	%o7,	%i3
	fbne	%fcc0,	loop_479
loop_479:
	ldub	[%l7 + 0x46],	%o0
	fmovrsgez	%o6,	%f4,	%f9
	fnot2	%f2,	%f10
	fmovse	%icc,	%f12,	%f14
	taddcctv	%g3,	%i4,	%i1
	movne	%icc,	%l3,	%g2
	sth	%g5,	[%l7 + 0x4C]
	fmovsne	%icc,	%f3,	%f14
	xnorcc	%l4,	0x10AC,	%l5
	udiv	%i7,	0x0A02,	%g7
	edge32n	%g4,	%o3,	%i0
	fpmerge	%f5,	%f14,	%f2
	movleu	%xcc,	%o1,	%l6
	edge32n	%l1,	%l0,	%i6
	movvs	%icc,	%o5,	%g6
	ld	[%l7 + 0x58],	%f12
	fxor	%f4,	%f4,	%f8
	fble	%fcc2,	loop_480
loop_480:
	addccc	%i2,	0x01D2,	%o2
	addccc	%i5,	%o4,	%l2
	fba,a	%fcc1,	loop_481
loop_481:
	addc	%g1,	%o7,	%o0
	ldx	[%l7 + 0x30],	%o6
	sllx	%i3,	0x14,	%i4
	edge32n	%g3,	%i1,	%l3
	ble,pn	%icc,	loop_482
loop_482:
	subc	%g2,	0x0808,	%l4
	fcmpeq32	%f10,	%f2,	%l5
	udiv	%g5,	0x0F50,	%i7
	lduh	[%l7 + 0x3A],	%g7
	st	%f7,	[%l7 + 0x64]
	movpos	%xcc,	%o3,	%g4
	lduh	[%l7 + 0x42],	%i0
	pdist	%f12,	%f8,	%f2
	fmovdg	%icc,	%f14,	%f8
	movrgz	%l6,	0x053,	%l1
	fmovscs	%xcc,	%f5,	%f1
	edge16ln	%l0,	%o1,	%i6
	movneg	%icc,	%o5,	%i2
	te	%xcc,	0x7
	tl	%xcc,	0x6
	fmovsa	%xcc,	%f5,	%f9
	mova	%icc,	%g6,	%o2
	fmovdvs	%icc,	%f3,	%f4
	move	%xcc,	%o4,	%l2
	tle	%xcc,	0x4
	lduh	[%l7 + 0x4A],	%i5
	bneg,pt	%xcc,	loop_483
loop_483:
	fone	%f0
	move	%icc,	%g1,	%o7
	tleu	%xcc,	0x1
	bge,a	%icc,	loop_484
loop_484:
	fbl	%fcc3,	loop_485
loop_485:
	std	%f10,	[%l7 + 0x50]
	fbul,a	%fcc0,	loop_486
loop_486:
	sth	%o0,	[%l7 + 0x2E]
	edge16	%i3,	%o6,	%g3
	movge	%xcc,	%i1,	%i4
	and	%l3,	0x0D16,	%l4
	sdivx	%l5,	0x0957,	%g5
	fone	%f8
	sll	%g2,	%i7,	%g7
	xorcc	%o3,	0x1376,	%i0
	bcs	%icc,	loop_487
loop_487:
	tneg	%xcc,	0x7
	movrgez	%g4,	0x068,	%l1
	edge8n	%l0,	%o1,	%i6
	movne	%xcc,	%l6,	%i2
	movre	%o5,	0x3B3,	%g6
	bge,a,pn	%icc,	loop_488
loop_488:
	fone	%f0
	fmovrdgez	%o2,	%f0,	%f8
	sra	%o4,	%i5,	%l2
	sdivcc	%o7,	0x0F75,	%o0
	ldsb	[%l7 + 0x1A],	%g1
	edge16n	%o6,	%i3,	%i1
	fmovscc	%xcc,	%f1,	%f2
	st	%f15,	[%l7 + 0x68]
	array16	%g3,	%l3,	%i4
	fcmple32	%f6,	%f8,	%l4
	tsubcctv	%l5,	0x1F4A,	%g5
	mova	%icc,	%i7,	%g2
	edge16n	%g7,	%o3,	%i0
	bcc,a	loop_489
loop_489:
	orn	%g4,	0x00C9,	%l0
	udiv	%l1,	0x19D7,	%i6
	tl	%icc,	0x6
	tgu	%xcc,	0x7
	lduh	[%l7 + 0x52],	%l6
	movpos	%icc,	%i2,	%o1
	bneg,pn	%xcc,	loop_490
loop_490:
	edge32ln	%g6,	%o5,	%o2
	ldsb	[%l7 + 0x56],	%i5
	fba	%fcc1,	loop_491
loop_491:
	edge16ln	%l2,	%o7,	%o4
	nop
	setx loop_492, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_492:
	sll	%o0,	%g1,	%i3
	fba,a	%fcc1,	loop_493
loop_493:
	fmul8ulx16	%f12,	%f12,	%f0
	movl	%xcc,	%i1,	%g3
	fmovsgu	%xcc,	%f4,	%f3
	sra	%o6,	%i4,	%l3
	tsubcc	%l4,	%g5,	%i7
	std	%f8,	[%l7 + 0x70]
	ldsw	[%l7 + 0x68],	%g2
	smulcc	%l5,	%g7,	%i0
	movg	%xcc,	%o3,	%g4
	udivx	%l1,	0x1DC6,	%l0
	movrgez	%i6,	0x010,	%i2
	sdiv	%o1,	0x0D5C,	%g6
	ldd	[%l7 + 0x48],	%f10
	udivx	%l6,	0x1330,	%o5
	movle	%icc,	%o2,	%i5
	movgu	%xcc,	%o7,	%l2
	popc	%o0,	%g1
	movrne	%o4,	%i1,	%g3
	udivx	%o6,	0x1F36,	%i3
	movl	%xcc,	%i4,	%l3
	smul	%l4,	%i7,	%g2
	andcc	%l5,	0x055C,	%g5
	stb	%i0,	[%l7 + 0x5E]
	fmuld8ulx16	%f11,	%f3,	%f4
	taddcc	%g7,	0x1238,	%g4
	tvc	%icc,	0x2
	sethi	0x1B07,	%o3
	bvc,a,pn	%icc,	loop_494
loop_494:
	smulcc	%l0,	0x1937,	%i6
	ba,pt	%xcc,	loop_495
loop_495:
	tsubcctv	%i2,	0x03AA,	%o1
	srlx	%g6,	%l6,	%o5
	fmovdleu	%icc,	%f0,	%f5
	fmovs	%f1,	%f11
	umul	%o2,	%l1,	%i5
	fandnot1s	%f5,	%f7,	%f1
	sllx	%l2,	%o0,	%g1
	addc	%o4,	%o7,	%i1
	edge16l	%o6,	%g3,	%i3
	sra	%i4,	0x1B,	%l4
	fmovrslez	%i7,	%f14,	%f4
	andn	%g2,	0x0BFC,	%l3
	movn	%xcc,	%l5,	%i0
	ldub	[%l7 + 0x53],	%g7
	xor	%g5,	%o3,	%g4
	sdiv	%i6,	0x1EBD,	%i2
	ld	[%l7 + 0x64],	%f2
	edge16n	%l0,	%o1,	%l6
	ldd	[%l7 + 0x70],	%f8
	bg,a	%xcc,	loop_496
loop_496:
	umulcc	%g6,	%o2,	%o5
	fmovdl	%icc,	%f13,	%f8
	array32	%l1,	%l2,	%o0
	tge	%icc,	0x0
	movrne	%g1,	%o4,	%i5
	movn	%icc,	%i1,	%o6
	fxors	%f11,	%f9,	%f9
	movg	%icc,	%g3,	%i3
	edge32l	%i4,	%l4,	%i7
	sllx	%g2,	%o7,	%l3
	edge16n	%i0,	%l5,	%g5
	fmovspos	%icc,	%f13,	%f4
	array16	%o3,	%g7,	%g4
	fmovsl	%icc,	%f9,	%f9
	movgu	%xcc,	%i6,	%i2
	bneg,a,pt	%xcc,	loop_497
loop_497:
	xnor	%o1,	0x04BE,	%l0
	tne	%xcc,	0x7
	tvc	%xcc,	0x6
	udiv	%l6,	0x1F97,	%g6
	tn	%xcc,	0x7
	ldd	[%l7 + 0x50],	%f6
	sth	%o2,	[%l7 + 0x40]
	andncc	%o5,	%l1,	%l2
	mulx	%g1,	%o4,	%i5
	tneg	%xcc,	0x7
	fnegs	%f4,	%f3
	for	%f4,	%f8,	%f4
	nop
	setx loop_498, %l0, %l1
	jmpl %l1, %i1
loop_498:
	sth	%o6,	[%l7 + 0x12]
	movne	%icc,	%g3,	%i3
	for	%f0,	%f12,	%f12
	bne	loop_499
loop_499:
	stx	%o0,	[%l7 + 0x08]
	addc	%i4,	0x1B06,	%i7
	fpadd16s	%f2,	%f8,	%f10
	addc	%l4,	%g2,	%l3
	std	%f10,	[%l7 + 0x68]
	fmovrdlez	%i0,	%f0,	%f4
	fpackfix	%f6,	%f14
	subcc	%o7,	%g5,	%o3
	fcmpeq16	%f8,	%f2,	%l5
	sth	%g7,	[%l7 + 0x28]
	srax	%i6,	0x1B,	%g4
	xnor	%o1,	%i2,	%l6
	srax	%g6,	0x0B,	%o2
	movgu	%icc,	%l0,	%o5
	fcmple16	%f2,	%f8,	%l1
	tcc	%xcc,	0x5
	edge32	%l2,	%g1,	%o4
	subcc	%i1,	0x0103,	%i5
	movleu	%icc,	%g3,	%o6
	tcs	%icc,	0x2
	udivcc	%i3,	0x088E,	%i4
	xnorcc	%i7,	%l4,	%g2
	umul	%l3,	0x10D2,	%o0
	xnorcc	%o7,	%g5,	%o3
	fors	%f6,	%f14,	%f15
	edge8ln	%i0,	%l5,	%g7
	edge8	%g4,	%o1,	%i2
	movre	%l6,	0x2B3,	%i6
	tcs	%xcc,	0x2
	sth	%o2,	[%l7 + 0x1C]
	tvs	%xcc,	0x7
	fmovde	%icc,	%f5,	%f0
	movrne	%g6,	%l0,	%o5
	movpos	%icc,	%l1,	%g1
	tvc	%xcc,	0x5
	orn	%l2,	%o4,	%i1
	stb	%i5,	[%l7 + 0x21]
	popc	0x11F8,	%g3
	movpos	%xcc,	%i3,	%i4
	smul	%o6,	0x145D,	%i7
	smulcc	%g2,	%l4,	%o0
	andn	%o7,	0x16E8,	%g5
	ta	%xcc,	0x4
	lduw	[%l7 + 0x6C],	%l3
	fmul8x16al	%f11,	%f13,	%f14
	srax	%i0,	0x1C,	%o3
	movvc	%icc,	%l5,	%g4
	fmovdge	%icc,	%f5,	%f8
	edge16	%o1,	%i2,	%g7
	movre	%i6,	0x10D,	%l6
	movge	%xcc,	%g6,	%l0
	tl	%icc,	0x0
	fmovse	%xcc,	%f1,	%f9
	fpack16	%f12,	%f9
	fand	%f14,	%f6,	%f10
	bleu,a	loop_500
loop_500:
	ldub	[%l7 + 0x50],	%o2
	fpack16	%f4,	%f6
	movgu	%xcc,	%o5,	%l1
	ldsh	[%l7 + 0x1A],	%g1
	movcs	%xcc,	%l2,	%i1
	ldd	[%l7 + 0x38],	%f14
	edge8n	%i5,	%o4,	%g3
	move	%icc,	%i4,	%o6
	tl	%icc,	0x4
	stw	%i3,	[%l7 + 0x5C]
	array8	%g2,	%i7,	%l4
	fabss	%f8,	%f15
	fbne	%fcc3,	loop_501
loop_501:
	fpadd32	%f6,	%f8,	%f8
	ta	%icc,	0x2
	sub	%o7,	%g5,	%l3
	ldub	[%l7 + 0x63],	%i0
	movrlz	%o0,	0x287,	%o3
	fmovsg	%xcc,	%f2,	%f7
	stx	%g4,	[%l7 + 0x28]
	std	%f14,	[%l7 + 0x50]
	srlx	%o1,	0x0A,	%l5
	movcc	%icc,	%i2,	%i6
	tvs	%xcc,	0x1
	tg	%icc,	0x5
	ldsw	[%l7 + 0x14],	%l6
	ldsw	[%l7 + 0x7C],	%g7
	movge	%icc,	%l0,	%g6
	bl,a,pn	%icc,	loop_502
loop_502:
	move	%xcc,	%o5,	%l1
	fmovsneg	%icc,	%f3,	%f15
	fcmpne32	%f2,	%f2,	%o2
	fmovsvc	%xcc,	%f3,	%f12
	ta	%xcc,	0x3
	ld	[%l7 + 0x78],	%f7
	taddcctv	%g1,	%l2,	%i1
	ldsw	[%l7 + 0x20],	%i5
	nop
	setx loop_503, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_503:
	movvc	%icc,	%o4,	%g3
	fsrc2s	%f14,	%f7
	fnot2s	%f15,	%f15
	tcs	%icc,	0x0
	and	%i4,	0x0D48,	%i3
	ld	[%l7 + 0x74],	%f8
	movvs	%xcc,	%g2,	%o6
	subc	%l4,	0x1E3F,	%i7
	bneg,a,pt	%xcc,	loop_504
loop_504:
	movgu	%icc,	%o7,	%g5
	movl	%icc,	%l3,	%i0
	mova	%xcc,	%o3,	%o0
	tgu	%xcc,	0x0
	movrgz	%o1,	%l5,	%i2
	taddcc	%g4,	%i6,	%g7
	andcc	%l0,	%g6,	%l6
	edge32n	%l1,	%o5,	%o2
	movleu	%xcc,	%g1,	%i1
	edge8ln	%l2,	%i5,	%o4
	smulcc	%g3,	0x039A,	%i3
	udivx	%g2,	0x1C59,	%i4
	array32	%o6,	%i7,	%o7
	fpadd16	%f4,	%f10,	%f2
	xor	%l4,	0x0F0D,	%g5
	move	%xcc,	%i0,	%l3
	sethi	0x0A41,	%o3
	orn	%o0,	0x1911,	%l5
	bneg,a	%icc,	loop_505
loop_505:
	ldd	[%l7 + 0x60],	%f2
	tneg	%icc,	0x3
	sra	%i2,	%g4,	%i6
	brz,a	%g7,	loop_506
loop_506:
	sra	%o1,	0x1B,	%l0
	tg	%icc,	0x4
	sdiv	%g6,	0x0BA3,	%l6
	fba	%fcc2,	loop_507
loop_507:
	andn	%l1,	%o2,	%g1
	te	%icc,	0x4
	movge	%icc,	%o5,	%l2
	addc	%i1,	%o4,	%g3
	movrlz	%i5,	0x2FB,	%i3
	fnors	%f1,	%f6,	%f6
	movle	%icc,	%i4,	%g2
	bpos	%xcc,	loop_508
loop_508:
	fnegd	%f10,	%f2
	fnegd	%f2,	%f8
	fexpand	%f6,	%f12
	ldsw	[%l7 + 0x68],	%i7
	umul	%o6,	%o7,	%g5
	fbg,a	%fcc0,	loop_509
loop_509:
	edge16l	%i0,	%l4,	%l3
	add	%o0,	0x16AC,	%l5
	fnor	%f2,	%f4,	%f8
	movge	%xcc,	%o3,	%i2
	taddcctv	%g4,	0x07B5,	%g7
	movrgz	%o1,	%i6,	%l0
	edge16	%l6,	%l1,	%g6
	fbge,a	%fcc1,	loop_510
loop_510:
	fmovsvc	%icc,	%f1,	%f15
	taddcctv	%g1,	%o5,	%o2
	fbuge,a	%fcc2,	loop_511
loop_511:
	sdivx	%i1,	0x045D,	%o4
	array16	%l2,	%i5,	%g3
	stb	%i3,	[%l7 + 0x0F]
	fmovrdne	%g2,	%f8,	%f0
	lduw	[%l7 + 0x74],	%i4
	array16	%i7,	%o6,	%o7
	ldub	[%l7 + 0x1D],	%i0
	orn	%l4,	%g5,	%l3
	edge8n	%l5,	%o3,	%o0
	add	%i2,	0x0FF2,	%g7
	fmovscc	%icc,	%f3,	%f1
	movcs	%icc,	%o1,	%i6
	edge32	%l0,	%l6,	%g4
	tleu	%icc,	0x7
	movrlez	%g6,	0x233,	%g1
	bcs,pn	%xcc,	loop_512
loop_512:
	orncc	%l1,	0x04DD,	%o5
	movleu	%xcc,	%i1,	%o2
	lduw	[%l7 + 0x70],	%o4
	umulcc	%i5,	0x16B6,	%l2
	umul	%g3,	0x012F,	%i3
	alignaddr	%i4,	%i7,	%o6
	tl	%xcc,	0x5
	ldsw	[%l7 + 0x68],	%o7
	movrlz	%i0,	%l4,	%g2
	umulcc	%l3,	%l5,	%g5
	srl	%o3,	0x00,	%o0
	xor	%i2,	0x0424,	%o1
	tn	%icc,	0x2
	tne	%icc,	0x6
	tpos	%xcc,	0x2
	st	%f12,	[%l7 + 0x44]
	fnands	%f13,	%f7,	%f9
	xnorcc	%g7,	%i6,	%l6
	stb	%l0,	[%l7 + 0x20]
	movleu	%xcc,	%g6,	%g4
	andncc	%g1,	%l1,	%o5
	fpack32	%f8,	%f10,	%f0
	movrgez	%i1,	%o4,	%i5
	tvs	%xcc,	0x1
	fmovdle	%xcc,	%f0,	%f5
	tpos	%icc,	0x3
	edge16ln	%o2,	%g3,	%l2
	fornot2s	%f7,	%f11,	%f12
	fbule,a	%fcc0,	loop_513
loop_513:
	fones	%f6
	fornot2	%f2,	%f6,	%f4
	movl	%xcc,	%i4,	%i3
	movg	%icc,	%i7,	%o7
	fandnot2	%f0,	%f2,	%f4
	brgez,a	%o6,	loop_514
loop_514:
	mulx	%i0,	%g2,	%l4
	ld	[%l7 + 0x0C],	%f5
	movrlz	%l3,	%l5,	%o3
	fexpand	%f11,	%f8
	xor	%g5,	0x191E,	%o0
	brgez,a	%i2,	loop_515
loop_515:
	movne	%xcc,	%g7,	%i6
	fmovdge	%xcc,	%f14,	%f0
	fmovrde	%o1,	%f10,	%f4
	sth	%l0,	[%l7 + 0x4E]
	fsrc1s	%f11,	%f10
	fmovdcc	%xcc,	%f6,	%f6
	mova	%icc,	%l6,	%g4
	sethi	0x152F,	%g1
	ldsw	[%l7 + 0x4C],	%l1
	ldsh	[%l7 + 0x7C],	%g6
	mulx	%i1,	0x16B8,	%o5
	ldsw	[%l7 + 0x70],	%o4
	movrgez	%o2,	%i5,	%l2
	movg	%xcc,	%i4,	%g3
	movl	%xcc,	%i3,	%o7
	mova	%xcc,	%i7,	%o6
	brz,a	%g2,	loop_516
loop_516:
	fbe,a	%fcc3,	loop_517
loop_517:
	bl	loop_518
loop_518:
	fbne,a	%fcc1,	loop_519
loop_519:
	fcmps	%fcc2,	%f2,	%f14
	sub	%l4,	0x1A44,	%l3
	fpsub16s	%f5,	%f0,	%f10
	movle	%xcc,	%l5,	%o3
	fandnot1	%f2,	%f14,	%f14
	st	%f3,	[%l7 + 0x18]
	orcc	%i0,	0x1904,	%g5
	bne,a,pt	%icc,	loop_520
loop_520:
	taddcc	%o0,	0x0FC3,	%i2
	srl	%g7,	0x11,	%o1
	fbe,a	%fcc1,	loop_521
loop_521:
	ldub	[%l7 + 0x31],	%l0
	ta	%icc,	0x5
	fbge	%fcc2,	loop_522
loop_522:
	sth	%i6,	[%l7 + 0x46]
	udivcc	%l6,	0x0E76,	%g1
	sdiv	%g4,	0x0D48,	%l1
	tvc	%xcc,	0x3
	movneg	%xcc,	%g6,	%o5
	ba,a	%icc,	loop_523
loop_523:
	movcs	%icc,	%o4,	%i1
	udiv	%o2,	0x065E,	%l2
	tgu	%icc,	0x1
	bleu	%icc,	loop_524
loop_524:
	lduw	[%l7 + 0x64],	%i5
	fbo,a	%fcc0,	loop_525
loop_525:
	movvc	%icc,	%g3,	%i4
	andn	%i3,	0x1A15,	%i7
	sethi	0x0796,	%o7
	fbe,a	%fcc1,	loop_526
loop_526:
	fmovsn	%xcc,	%f4,	%f3
	fcmpne32	%f6,	%f8,	%o6
	mulscc	%l4,	0x1CCA,	%g2
	sethi	0x1E1B,	%l3
	sth	%o3,	[%l7 + 0x18]
	udivx	%l5,	0x13CC,	%i0
	bne	%xcc,	loop_527
loop_527:
	bge,a,pt	%xcc,	loop_528
loop_528:
	fmovdvs	%xcc,	%f2,	%f6
	fmovrslez	%o0,	%f3,	%f11
	ba,a	%icc,	loop_529
loop_529:
	movl	%xcc,	%i2,	%g7
	udivcc	%o1,	0x0EEA,	%g5
	fpsub32	%f2,	%f14,	%f10
	fbne,a	%fcc3,	loop_530
loop_530:
	movle	%xcc,	%l0,	%l6
	sra	%g1,	0x03,	%g4
	fmovsvs	%icc,	%f5,	%f13
	fcmple32	%f10,	%f8,	%i6
	ldub	[%l7 + 0x0A],	%l1
	movg	%icc,	%g6,	%o5
	stx	%i1,	[%l7 + 0x10]
	bneg	%icc,	loop_531
loop_531:
	fmovsne	%xcc,	%f9,	%f7
	brlez	%o2,	loop_532
loop_532:
	fbug	%fcc3,	loop_533
loop_533:
	fbge,a	%fcc0,	loop_534
loop_534:
	tcs	%icc,	0x4
	udiv	%o4,	0x1574,	%l2
	fmovdvs	%icc,	%f15,	%f12
	edge16n	%g3,	%i4,	%i3
	bne,a,pt	%xcc,	loop_535
loop_535:
	ld	[%l7 + 0x08],	%f11
	movrgz	%i7,	%i5,	%o7
	bn,a,pn	%icc,	loop_536
loop_536:
	fbuge	%fcc3,	loop_537
loop_537:
	movrgz	%l4,	0x282,	%o6
	fxnor	%f8,	%f8,	%f0
	fone	%f14
	edge32n	%g2,	%l3,	%o3
	fmovrsgz	%i0,	%f12,	%f5
	udiv	%l5,	0x054D,	%i2
	xor	%g7,	0x1D65,	%o0
	sth	%g5,	[%l7 + 0x78]
	tneg	%icc,	0x4
	fmovsvc	%icc,	%f13,	%f7
	movle	%icc,	%o1,	%l0
	andn	%l6,	%g4,	%g1
	call	loop_538
loop_538:
	fzero	%f2
	edge16n	%l1,	%g6,	%o5
	movrlez	%i1,	0x218,	%o2
	ldsh	[%l7 + 0x16],	%o4
	tvc	%xcc,	0x3
	movcs	%xcc,	%l2,	%i6
	tne	%xcc,	0x7
	fmovrdne	%g3,	%f6,	%f14
	mulx	%i3,	0x162D,	%i4
	movcc	%xcc,	%i5,	%i7
	fmovrse	%l4,	%f2,	%f1
	tleu	%icc,	0x4
	fmovda	%xcc,	%f0,	%f14
	subccc	%o6,	0x0BAF,	%o7
	fmovrde	%g2,	%f2,	%f0
	ba,pn	%icc,	loop_539
loop_539:
	lduw	[%l7 + 0x40],	%l3
	xor	%o3,	0x13FF,	%l5
	stx	%i2,	[%l7 + 0x10]
	ld	[%l7 + 0x50],	%f1
	edge8n	%i0,	%g7,	%g5
	faligndata	%f4,	%f2,	%f0
	fmovrslz	%o1,	%f12,	%f9
	ldsh	[%l7 + 0x7C],	%l0
	smulcc	%o0,	0x17DE,	%l6
	fnot1s	%f6,	%f5
	srlx	%g1,	0x10,	%g4
	fpack16	%f4,	%f5
	ldd	[%l7 + 0x48],	%f2
	ldub	[%l7 + 0x27],	%g6
	fbe	%fcc3,	loop_540
loop_540:
	ldsw	[%l7 + 0x6C],	%l1
	fmovsleu	%xcc,	%f0,	%f9
	subcc	%o5,	%o2,	%o4
	tge	%xcc,	0x6
	bge,pt	%xcc,	loop_541
loop_541:
	movneg	%xcc,	%l2,	%i1
	tleu	%xcc,	0x0
	std	%f4,	[%l7 + 0x28]
	te	%icc,	0x2
	tneg	%xcc,	0x7
	call	loop_542
loop_542:
	tle	%xcc,	0x0
	bn,a,pt	%icc,	loop_543
loop_543:
	bvs,pt	%xcc,	loop_544
loop_544:
	fba,a	%fcc0,	loop_545
loop_545:
	tle	%xcc,	0x2
	edge32l	%g3,	%i3,	%i6
	xor	%i4,	0x0874,	%i5
	ld	[%l7 + 0x78],	%f5
	fsrc2	%f10,	%f2
	movrgz	%l4,	%i7,	%o6
	subc	%o7,	0x1BDC,	%g2
	tvs	%icc,	0x0
	edge8n	%o3,	%l3,	%l5
	movvs	%xcc,	%i0,	%i2
	tvs	%xcc,	0x1
	brgez	%g5,	loop_546
loop_546:
	edge16n	%g7,	%l0,	%o1
	mulscc	%o0,	0x1333,	%g1
	mulx	%l6,	%g6,	%g4
	orn	%l1,	0x1C32,	%o2
	alignaddr	%o4,	%o5,	%l2
	fandnot1s	%f9,	%f10,	%f8
	andcc	%g3,	%i1,	%i3
	srlx	%i4,	0x0D,	%i6
	movrlz	%i5,	%l4,	%o6
	ldsb	[%l7 + 0x0F],	%o7
	movgu	%xcc,	%i7,	%g2
	ble,pt	%xcc,	loop_547
loop_547:
	fmul8x16al	%f11,	%f0,	%f8
	bpos,a	loop_548
loop_548:
	fnegs	%f0,	%f5
	or	%o3,	%l5,	%l3
	fmovrsne	%i2,	%f0,	%f5
	fmovrdgz	%i0,	%f14,	%f2
	fcmpne16	%f12,	%f8,	%g5
	fnot1	%f14,	%f6
	movle	%icc,	%l0,	%g7
	xnorcc	%o0,	0x1142,	%o1
	taddcctv	%l6,	0x170B,	%g1
	movvc	%xcc,	%g4,	%l1
	stx	%g6,	[%l7 + 0x38]
	edge16	%o4,	%o2,	%l2
	sdivx	%g3,	0x0CFF,	%o5
	udiv	%i1,	0x10C8,	%i4
	st	%f4,	[%l7 + 0x24]
	fmovdn	%icc,	%f5,	%f9
	tgu	%icc,	0x1
	edge8ln	%i6,	%i3,	%i5
	udivcc	%l4,	0x1A15,	%o7
	fblg,a	%fcc0,	loop_549
loop_549:
	orcc	%i7,	%g2,	%o3
	movre	%l5,	%o6,	%l3
	ldd	[%l7 + 0x78],	%f4
	array16	%i0,	%g5,	%l0
	movneg	%icc,	%g7,	%o0
	xorcc	%o1,	0x0D8F,	%l6
	movneg	%icc,	%g1,	%g4
	movleu	%xcc,	%l1,	%g6
	movpos	%xcc,	%o4,	%i2
	tpos	%icc,	0x6
	taddcc	%l2,	0x1A47,	%o2
	bcs,pt	%xcc,	loop_550
loop_550:
	umulcc	%g3,	0x1219,	%o5
	edge16n	%i1,	%i6,	%i3
	mova	%icc,	%i4,	%l4
	ld	[%l7 + 0x68],	%f8
	ldsb	[%l7 + 0x36],	%o7
	addccc	%i5,	0x1D9E,	%i7
	tgu	%xcc,	0x4
	movvs	%xcc,	%g2,	%l5
	sdivx	%o3,	0x1D97,	%l3
	mulx	%i0,	0x116D,	%g5
	tvs	%xcc,	0x7
	udivcc	%o6,	0x1BCC,	%g7
	srlx	%o0,	0x15,	%l0
	fbge	%fcc1,	loop_551
loop_551:
	movrne	%l6,	%o1,	%g4
	edge8	%l1,	%g6,	%o4
	sethi	0x129B,	%g1
	bcs,a	loop_552
loop_552:
	srlx	%i2,	%o2,	%l2
	movrgez	%o5,	%g3,	%i6
	fcmple16	%f6,	%f12,	%i3
	fpmerge	%f1,	%f5,	%f10
	movn	%icc,	%i1,	%l4
	tvc	%xcc,	0x3
	srax	%i4,	%i5,	%o7
	brlez,a	%i7,	loop_553
loop_553:
	fmovscc	%xcc,	%f7,	%f11
	movle	%icc,	%g2,	%l5
	popc	0x0B89,	%o3
	tn	%icc,	0x7
	tpos	%xcc,	0x2
	te	%icc,	0x6
	bneg,a	%icc,	loop_554
loop_554:
	xnor	%i0,	0x143A,	%g5
	movrlz	%o6,	%g7,	%o0
	fmul8sux16	%f10,	%f6,	%f14
	smulcc	%l0,	%l6,	%l3
	xnor	%o1,	%l1,	%g6
	edge32n	%o4,	%g1,	%g4
	tn	%xcc,	0x5
	movvs	%xcc,	%o2,	%l2
	alignaddr	%o5,	%i2,	%g3
	ld	[%l7 + 0x48],	%f13
	fmul8x16al	%f4,	%f4,	%f6
	fpackfix	%f2,	%f11
	fmovrse	%i3,	%f14,	%f7
	smul	%i6,	%i1,	%l4
	subc	%i4,	0x0319,	%o7
	brlez,a	%i5,	loop_555
loop_555:
	fmovde	%xcc,	%f8,	%f9
	lduh	[%l7 + 0x2A],	%i7
	ldd	[%l7 + 0x68],	%f0
	tleu	%icc,	0x6
	ldsb	[%l7 + 0x76],	%g2
	andncc	%l5,	%i0,	%g5
	tle	%icc,	0x0
	edge16n	%o3,	%g7,	%o6
	movpos	%xcc,	%l0,	%l6
	sra	%l3,	%o1,	%l1
	lduh	[%l7 + 0x3A],	%o0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type f   	: 191
!	Type cti   	: 114
!	Type i   	: 556
!	Type l   	: 139
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
main_t3:

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0x0,	%g2
	set	0xE,	%g3
	set	0x7,	%g4
	set	0x0,	%g5
	set	0xB,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xC,	%i1
	set	-0xD,	%i2
	set	-0x1,	%i3
	set	-0xB,	%i4
	set	-0x3,	%i5
	set	-0xB,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x1C57FBB9,	%l0
	set	0x48A80FDA,	%l1
	set	0x2473B99F,	%l2
	set	0x21AE16AC,	%l3
	set	0x74C268C9,	%l4
	set	0x1EA5F008,	%l5
	set	0x4B419827,	%l6
	!# Output registers
	set	-0x1D2D,	%o0
	set	0x1340,	%o1
	set	-0x03D9,	%o2
	set	-0x028F,	%o3
	set	-0x0841,	%o4
	set	-0x11F1,	%o5
	set	0x17EC,	%o6
	set	0x00A7,	%o7

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

	fmovdne	%icc,	%f7,	%f4
	fandnot1	%f8,	%f6,	%f4
	fpadd16s	%f14,	%f5,	%f9
	movvc	%icc,	%o4,	%g1
	fcmpd	%fcc3,	%f8,	%f6
	fsrc2	%f14,	%f10
	ld	[%l7 + 0x7C],	%f13
	fmul8ulx16	%f4,	%f8,	%f6
	lduw	[%l7 + 0x08],	%g4
	bcc,pt	%icc,	loop_556
loop_556:
	fmovdle	%icc,	%f4,	%f4
	fmul8ulx16	%f10,	%f8,	%f2
	fornot1s	%f13,	%f9,	%f4
	tl	%icc,	0x2
	addc	%g6,	0x09DD,	%o2
	fandnot1s	%f1,	%f10,	%f4
	fnot2	%f8,	%f14
	fpadd32s	%f6,	%f1,	%f14
	taddcctv	%o5,	0x1A6B,	%l2
	fnor	%f8,	%f10,	%f8
	fmovrdne	%g3,	%f4,	%f2
	and	%i3,	%i6,	%i1
	tne	%icc,	0x6
	st	%f8,	[%l7 + 0x50]
	fnot1s	%f1,	%f7
	ldsw	[%l7 + 0x50],	%i2
	fnands	%f7,	%f12,	%f10
	fzeros	%f6
	ldx	[%l7 + 0x18],	%l4
	fmovdpos	%xcc,	%f3,	%f1
	bne	loop_557
loop_557:
	bge,pt	%xcc,	loop_558
loop_558:
	tne	%xcc,	0x6
	ldsh	[%l7 + 0x5A],	%i4
	fcmpne16	%f4,	%f14,	%i5
	array16	%o7,	%i7,	%g2
	fmovsg	%xcc,	%f7,	%f13
	fands	%f2,	%f14,	%f4
	orn	%l5,	0x1DBD,	%g5
	fpack32	%f8,	%f8,	%f10
	fmovrde	%i0,	%f0,	%f0
	fmovde	%icc,	%f9,	%f5
	fmovrde	%g7,	%f6,	%f8
	fmovse	%icc,	%f15,	%f5
	fblg,a	%fcc0,	loop_559
loop_559:
	fcmpeq32	%f6,	%f14,	%o6
	stx	%o3,	[%l7 + 0x28]
	fnegd	%f14,	%f6
	fmovdge	%icc,	%f2,	%f9
	faligndata	%f4,	%f2,	%f12
	fpack32	%f8,	%f6,	%f12
	fmovsle	%icc,	%f9,	%f8
	fmovd	%f14,	%f8
	andcc	%l6,	%l0,	%o1
	array32	%l1,	%o0,	%o4
	fcmple16	%f0,	%f10,	%g1
	fxor	%f10,	%f4,	%f0
	fmovsvc	%xcc,	%f0,	%f9
	ldd	[%l7 + 0x20],	%f2
	move	%xcc,	%g4,	%l3
	umulcc	%o2,	%g6,	%o5
	fmovscs	%icc,	%f3,	%f12
	udiv	%g3,	0x1E4E,	%l2
	bcc,a	loop_560
loop_560:
	fnot2s	%f9,	%f0
	tcs	%icc,	0x2
	bleu,a	loop_561
loop_561:
	edge32n	%i3,	%i6,	%i1
	stb	%l4,	[%l7 + 0x35]
	andn	%i2,	%i4,	%o7
	fmovdneg	%icc,	%f4,	%f9
	fmovrsgz	%i5,	%f4,	%f12
	fandnot1s	%f13,	%f10,	%f2
	fpsub16	%f10,	%f6,	%f6
	fandnot2	%f8,	%f2,	%f6
	fmuld8sux16	%f10,	%f14,	%f2
	fmovrsgez	%i7,	%f12,	%f12
	fbg	%fcc0,	loop_562
loop_562:
	fmovrslez	%g2,	%f10,	%f8
	fmovsvs	%icc,	%f1,	%f12
	fcmpeq16	%f8,	%f2,	%l5
	edge8	%i0,	%g5,	%g7
	fzero	%f4
	fandnot1s	%f9,	%f0,	%f9
	fands	%f12,	%f0,	%f0
	bshuffle	%f10,	%f12,	%f8
	fpack32	%f8,	%f12,	%f2
	fpack32	%f2,	%f4,	%f2
	ldsh	[%l7 + 0x2C],	%o3
	fmovdneg	%icc,	%f8,	%f5
	bne	loop_563
loop_563:
	fmovde	%icc,	%f10,	%f15
	bvc,pn	%xcc,	loop_564
loop_564:
	tne	%icc,	0x5
	brz	%l6,	loop_565
loop_565:
	fnot1	%f4,	%f14
	array16	%o6,	%l0,	%l1
	fmovsge	%icc,	%f12,	%f8
	fabsd	%f2,	%f10
	array16	%o0,	%o4,	%o1
	fmovdcs	%icc,	%f8,	%f15
	fones	%f8
	fcmpes	%fcc3,	%f6,	%f13
	siam	0x6
	fxor	%f8,	%f12,	%f8
	edge32ln	%g4,	%g1,	%l3
	fbue,a	%fcc0,	loop_566
loop_566:
	fbul,a	%fcc3,	loop_567
loop_567:
	fcmps	%fcc0,	%f3,	%f13
	fmovsle	%icc,	%f6,	%f0
	fnors	%f3,	%f0,	%f0
	fmul8ulx16	%f2,	%f10,	%f4
	sdivx	%g6,	0x0EF6,	%o2
	fexpand	%f6,	%f0
	tpos	%xcc,	0x7
	fmovrsgz	%g3,	%f1,	%f2
	fpadd16	%f2,	%f10,	%f6
	nop
	setx loop_568, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_568:
	fnot2	%f2,	%f10
	sll	%o5,	0x01,	%l2
	tvs	%xcc,	0x0
	fandnot1s	%f3,	%f0,	%f7
	bneg	%xcc,	loop_569
loop_569:
	fsrc1s	%f11,	%f11
	or	%i3,	0x06AC,	%i6
	fornot2s	%f10,	%f3,	%f10
	orn	%l4,	0x0724,	%i1
	stw	%i2,	[%l7 + 0x60]
	fnot2s	%f3,	%f13
	fpsub32	%f12,	%f0,	%f12
	fmuld8sux16	%f7,	%f12,	%f2
	fmovsne	%xcc,	%f14,	%f5
	sllx	%o7,	%i4,	%i7
	fmovspos	%icc,	%f1,	%f12
	brz	%g2,	loop_570
loop_570:
	fmovrdne	%i5,	%f10,	%f4
	fcmps	%fcc3,	%f15,	%f15
	andcc	%l5,	0x1D8A,	%g5
	fmovsneg	%icc,	%f0,	%f7
	fnor	%f12,	%f6,	%f14
	fandnot2	%f14,	%f4,	%f2
	fpadd32s	%f9,	%f5,	%f5
	fcmpeq16	%f2,	%f10,	%g7
	fands	%f10,	%f3,	%f5
	fmovrdgz	%o3,	%f8,	%f2
	fnot1s	%f1,	%f4
	fmovsge	%xcc,	%f10,	%f6
	ldub	[%l7 + 0x1B],	%i0
	be,a,pn	%xcc,	loop_571
loop_571:
	fmovrsgz	%l6,	%f8,	%f3
	lduh	[%l7 + 0x72],	%l0
	fandnot1s	%f4,	%f15,	%f8
	fabsd	%f6,	%f2
	ldsb	[%l7 + 0x79],	%o6
	fbl	%fcc3,	loop_572
loop_572:
	movge	%icc,	%o0,	%o4
	fcmpeq16	%f10,	%f6,	%l1
	ldd	[%l7 + 0x08],	%f6
	std	%f10,	[%l7 + 0x10]
	fmuld8sux16	%f15,	%f5,	%f8
	fmovdgu	%icc,	%f10,	%f1
	fcmpeq32	%f12,	%f12,	%g4
	movrlz	%o1,	0x3AA,	%g1
	fxor	%f10,	%f0,	%f14
	fmuld8ulx16	%f11,	%f5,	%f14
	lduh	[%l7 + 0x5E],	%l3
	fsrc2s	%f15,	%f8
	sdivcc	%g6,	0x182B,	%o2
	fba	%fcc0,	loop_573
loop_573:
	fmovdvc	%icc,	%f6,	%f11
	sdivcc	%g3,	0x0D1B,	%l2
	fmovda	%icc,	%f15,	%f5
	st	%f14,	[%l7 + 0x10]
	fnot1s	%f3,	%f14
	fmovdcs	%xcc,	%f15,	%f2
	fbuge,a	%fcc0,	loop_574
loop_574:
	array32	%o5,	%i6,	%i3
	fmovrslz	%i1,	%f6,	%f7
	tg	%icc,	0x0
	te	%xcc,	0x0
	fpack16	%f0,	%f12
	move	%icc,	%i2,	%o7
	fmovrse	%i4,	%f13,	%f9
	fzero	%f4
	fxor	%f4,	%f12,	%f12
	fbn	%fcc1,	loop_575
loop_575:
	movrgez	%i7,	%l4,	%i5
	tvc	%xcc,	0x3
	fnors	%f15,	%f4,	%f12
	fmovsleu	%xcc,	%f15,	%f14
	fnor	%f6,	%f2,	%f2
	fornot2s	%f3,	%f8,	%f0
	fmovdn	%icc,	%f10,	%f1
	movre	%g2,	%l5,	%g7
	fmovsne	%xcc,	%f0,	%f13
	movl	%icc,	%g5,	%o3
	fmovsne	%xcc,	%f0,	%f0
	std	%f0,	[%l7 + 0x50]
	stw	%i0,	[%l7 + 0x0C]
	fmovdle	%xcc,	%f13,	%f5
	fpsub16s	%f4,	%f13,	%f14
	movg	%icc,	%l0,	%o6
	fmovsgu	%icc,	%f5,	%f1
	fandnot2s	%f2,	%f12,	%f11
	faligndata	%f4,	%f10,	%f8
	lduw	[%l7 + 0x28],	%o0
	fmovrse	%o4,	%f8,	%f13
	ldd	[%l7 + 0x58],	%f12
	fmovrslz	%l1,	%f1,	%f10
	fnands	%f14,	%f2,	%f0
	stb	%g4,	[%l7 + 0x22]
	lduh	[%l7 + 0x5A],	%l6
	fmovrdne	%g1,	%f2,	%f10
	movg	%xcc,	%l3,	%g6
	edge8	%o2,	%g3,	%l2
	ble,pn	%xcc,	loop_576
loop_576:
	fmovsgu	%icc,	%f9,	%f1
	fmovsge	%icc,	%f8,	%f6
	fmovdvs	%icc,	%f3,	%f11
	ldx	[%l7 + 0x50],	%o1
	ta	%xcc,	0x6
	fmovda	%xcc,	%f5,	%f0
	for	%f2,	%f14,	%f2
	fbl,a	%fcc3,	loop_577
loop_577:
	fzero	%f2
	edge32	%i6,	%i3,	%o5
	fmovsa	%xcc,	%f1,	%f15
	fxnors	%f15,	%f13,	%f8
	sth	%i1,	[%l7 + 0x1A]
	ldx	[%l7 + 0x70],	%o7
	fbu,a	%fcc3,	loop_578
loop_578:
	fornot1s	%f0,	%f13,	%f13
	sra	%i2,	%i4,	%i7
	ldd	[%l7 + 0x28],	%f0
	fones	%f2
	fnor	%f14,	%f6,	%f4
	mulscc	%i5,	%l4,	%l5
	fmovrdlez	%g2,	%f4,	%f6
	fornot2	%f2,	%f0,	%f8
	fbne	%fcc0,	loop_579
loop_579:
	fmovsvc	%xcc,	%f0,	%f14
	ldsh	[%l7 + 0x10],	%g7
	brlez,a	%g5,	loop_580
loop_580:
	nop
	setx loop_581, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_581:
	fpmerge	%f0,	%f15,	%f4
	fmovrsgz	%o3,	%f14,	%f3
	movrlez	%i0,	%l0,	%o0
	fabss	%f4,	%f14
	fmovrslez	%o4,	%f8,	%f6
	sdiv	%o6,	0x1211,	%g4
	fpack16	%f12,	%f7
	fandnot2	%f12,	%f2,	%f0
	fmul8x16	%f4,	%f14,	%f12
	lduh	[%l7 + 0x66],	%l1
	fmovdcs	%icc,	%f10,	%f8
	fpsub16s	%f14,	%f6,	%f10
	brlez,a	%g1,	loop_582
loop_582:
	fmovrsgez	%l3,	%f15,	%f14
	fblg	%fcc1,	loop_583
loop_583:
	fcmpeq16	%f0,	%f4,	%l6
	fcmpeq32	%f6,	%f4,	%g6
	fbo	%fcc2,	loop_584
loop_584:
	stw	%o2,	[%l7 + 0x7C]
	fmul8x16al	%f12,	%f13,	%f14
	taddcctv	%l2,	0x00A4,	%g3
	fcmpne16	%f4,	%f4,	%i6
	brlz	%i3,	loop_585
loop_585:
	fone	%f6
	fbge,a	%fcc0,	loop_586
loop_586:
	bge,a,pt	%xcc,	loop_587
loop_587:
	lduh	[%l7 + 0x60],	%o5
	fmul8x16	%f9,	%f2,	%f2
	fnot2	%f10,	%f0
	fpack32	%f12,	%f4,	%f6
	bpos,pn	%xcc,	loop_588
loop_588:
	bpos,pn	%icc,	loop_589
loop_589:
	fxor	%f10,	%f6,	%f14
	edge32	%o1,	%i1,	%o7
	edge32n	%i4,	%i7,	%i5
	fmovsa	%icc,	%f4,	%f5
	srlx	%i2,	0x16,	%l4
	movrgez	%l5,	0x1C8,	%g2
	fpsub32	%f10,	%f10,	%f10
	bpos,a	loop_590
loop_590:
	st	%f4,	[%l7 + 0x50]
	movrgez	%g5,	0x1DE,	%o3
	fornot2	%f6,	%f2,	%f8
	movg	%xcc,	%g7,	%l0
	bgu,pn	%xcc,	loop_591
loop_591:
	fmovrsgez	%o0,	%f2,	%f2
	ldub	[%l7 + 0x3D],	%o4
	fpadd32	%f4,	%f6,	%f6
	ldd	[%l7 + 0x60],	%f0
	brlez	%o6,	loop_592
loop_592:
	fands	%f8,	%f10,	%f13
	andncc	%i0,	%g4,	%l1
	mulscc	%g1,	0x01BB,	%l3
	fmovrsne	%g6,	%f12,	%f6
	fandnot1	%f8,	%f14,	%f12
	brgez	%o2,	loop_593
loop_593:
	ld	[%l7 + 0x4C],	%f11
	fpsub16s	%f4,	%f10,	%f13
	stw	%l2,	[%l7 + 0x20]
	fpsub16s	%f13,	%f12,	%f13
	fmovsleu	%icc,	%f8,	%f2
	bcs	%icc,	loop_594
loop_594:
	fmovsn	%icc,	%f6,	%f12
	bcc,a	%icc,	loop_595
loop_595:
	tsubcc	%l6,	0x1757,	%i6
	fone	%f14
	fcmpeq16	%f8,	%f8,	%i3
	fmovsa	%xcc,	%f15,	%f12
	fnot1s	%f12,	%f5
	ldub	[%l7 + 0x6E],	%g3
	fpack16	%f2,	%f9
	brz,a	%o1,	loop_596
loop_596:
	fmul8x16au	%f3,	%f3,	%f0
	xor	%i1,	%o7,	%i4
	fmovrdgz	%i7,	%f0,	%f6
	fmovda	%icc,	%f2,	%f6
	udivcc	%o5,	0x14CC,	%i5
	tle	%icc,	0x5
	fpack16	%f2,	%f15
	sth	%l4,	[%l7 + 0x76]
	fmovs	%f3,	%f14
	fcmped	%fcc2,	%f12,	%f14
	fmuld8ulx16	%f12,	%f11,	%f8
	tsubcc	%i2,	%g2,	%l5
	orcc	%o3,	0x133A,	%g7
	andn	%l0,	%o0,	%o4
	edge16ln	%o6,	%i0,	%g5
	brlez	%l1,	loop_597
loop_597:
	fcmpes	%fcc2,	%f7,	%f5
	fbu,a	%fcc2,	loop_598
loop_598:
	fmovdcs	%xcc,	%f12,	%f0
	fcmpgt16	%f10,	%f12,	%g4
	stw	%l3,	[%l7 + 0x30]
	umulcc	%g1,	0x116D,	%g6
	lduh	[%l7 + 0x60],	%l2
	stb	%o2,	[%l7 + 0x7E]
	st	%f3,	[%l7 + 0x28]
	std	%f6,	[%l7 + 0x08]
	std	%f6,	[%l7 + 0x30]
	xor	%l6,	0x019E,	%i6
	fpadd16s	%f5,	%f0,	%f2
	bpos,a	%xcc,	loop_599
loop_599:
	brz,a	%g3,	loop_600
loop_600:
	fnot1	%f0,	%f6
	brnz	%i3,	loop_601
loop_601:
	fmovrsne	%i1,	%f12,	%f12
	bvs	loop_602
loop_602:
	fmovscs	%xcc,	%f8,	%f10
	fmovrdgez	%o1,	%f10,	%f12
	andcc	%i4,	0x04F2,	%i7
	fcmpd	%fcc1,	%f4,	%f12
	bcs,a	loop_603
loop_603:
	fors	%f8,	%f10,	%f8
	fpadd32s	%f10,	%f7,	%f13
	edge8ln	%o5,	%o7,	%l4
	fand	%f4,	%f8,	%f10
	fmovs	%f4,	%f6
	array16	%i5,	%g2,	%l5
	fnot1s	%f2,	%f10
	std	%f4,	[%l7 + 0x38]
	fmovspos	%icc,	%f0,	%f7
	tg	%xcc,	0x5
	fandnot1s	%f0,	%f3,	%f12
	fpsub32s	%f10,	%f3,	%f4
	ldub	[%l7 + 0x61],	%i2
	stb	%g7,	[%l7 + 0x3D]
	fmul8sux16	%f4,	%f0,	%f8
	fmovdne	%icc,	%f14,	%f5
	fmovsg	%xcc,	%f13,	%f6
	fbue	%fcc1,	loop_604
loop_604:
	edge8n	%l0,	%o3,	%o0
	fxor	%f6,	%f14,	%f0
	fmovsneg	%xcc,	%f7,	%f13
	lduh	[%l7 + 0x3E],	%o4
	fpsub32	%f10,	%f8,	%f2
	fexpand	%f0,	%f0
	addc	%i0,	0x1437,	%g5
	fmovrde	%l1,	%f0,	%f12
	fandnot2	%f8,	%f2,	%f4
	srlx	%g4,	%l3,	%o6
	fmovsvs	%xcc,	%f3,	%f0
	fors	%f14,	%f14,	%f0
	fmuld8ulx16	%f11,	%f2,	%f6
	tle	%icc,	0x4
	ldsb	[%l7 + 0x16],	%g1
	stb	%g6,	[%l7 + 0x5C]
	fmovda	%xcc,	%f14,	%f1
	fbl,a	%fcc3,	loop_605
loop_605:
	fmul8x16au	%f7,	%f8,	%f6
	fsrc2s	%f9,	%f1
	fmovsle	%icc,	%f5,	%f4
	brgz,a	%o2,	loop_606
loop_606:
	brlz,a	%l6,	loop_607
loop_607:
	fmul8x16	%f7,	%f10,	%f6
	fmovsn	%xcc,	%f2,	%f12
	fxnors	%f15,	%f0,	%f4
	fmul8x16au	%f12,	%f1,	%f4
	fnegd	%f12,	%f0
	st	%f11,	[%l7 + 0x2C]
	fmovrsne	%l2,	%f4,	%f8
	fbu	%fcc0,	loop_608
loop_608:
	tsubcctv	%g3,	%i6,	%i1
	ld	[%l7 + 0x60],	%f10
	fmovrdlez	%i3,	%f14,	%f4
	mova	%icc,	%o1,	%i4
	fxnor	%f6,	%f2,	%f2
	fmovdpos	%icc,	%f7,	%f12
	fandnot2	%f6,	%f4,	%f8
	stw	%i7,	[%l7 + 0x0C]
	fmovsneg	%icc,	%f3,	%f14
	fmovdgu	%xcc,	%f6,	%f3
	fmovspos	%icc,	%f2,	%f4
	fones	%f2
	edge8n	%o7,	%l4,	%o5
	pdist	%f6,	%f14,	%f10
	fcmpgt32	%f6,	%f8,	%g2
	stb	%i5,	[%l7 + 0x72]
	fmovrdne	%l5,	%f10,	%f8
	tne	%xcc,	0x1
	fsrc1	%f10,	%f8
	udivx	%g7,	0x106C,	%i2
	lduw	[%l7 + 0x2C],	%o3
	fbg,a	%fcc1,	loop_609
loop_609:
	xnorcc	%l0,	0x184B,	%o4
	fmovrsgz	%o0,	%f11,	%f0
	add	%i0,	0x140A,	%g5
	stx	%l1,	[%l7 + 0x50]
	fbul	%fcc3,	loop_610
loop_610:
	fors	%f12,	%f13,	%f14
	fsrc2s	%f14,	%f1
	fsrc1s	%f2,	%f8
	smul	%l3,	0x1F44,	%o6
	fnot1	%f4,	%f14
	stw	%g1,	[%l7 + 0x7C]
	edge32l	%g4,	%o2,	%l6
	ldd	[%l7 + 0x60],	%f2
	fmuld8sux16	%f6,	%f15,	%f6
	stb	%g6,	[%l7 + 0x71]
	orn	%l2,	%g3,	%i6
	fpmerge	%f2,	%f8,	%f0
	fmovdl	%xcc,	%f10,	%f2
	fmovrdgz	%i3,	%f4,	%f0
	bne	loop_611
loop_611:
	fxnors	%f5,	%f0,	%f8
	fmovspos	%icc,	%f0,	%f14
	te	%icc,	0x1
	fmovdle	%xcc,	%f0,	%f13
	tleu	%icc,	0x2
	fbul	%fcc0,	loop_612
loop_612:
	ldx	[%l7 + 0x70],	%i1
	ldub	[%l7 + 0x55],	%i4
	fnands	%f8,	%f1,	%f5
	fbl	%fcc3,	loop_613
loop_613:
	addccc	%i7,	%o1,	%l4
	fmul8x16al	%f8,	%f6,	%f4
	fpadd32s	%f0,	%f4,	%f6
	fbue	%fcc2,	loop_614
loop_614:
	st	%f12,	[%l7 + 0x34]
	sth	%o7,	[%l7 + 0x2A]
	fandnot1s	%f4,	%f11,	%f0
	brlz,a	%g2,	loop_615
loop_615:
	move	%xcc,	%i5,	%l5
	movneg	%xcc,	%o5,	%g7
	fmovrdgez	%o3,	%f12,	%f14
	stw	%i2,	[%l7 + 0x48]
	fpsub32s	%f0,	%f15,	%f7
	bneg	loop_616
loop_616:
	movrlz	%o4,	0x037,	%l0
	fmovsvc	%icc,	%f13,	%f7
	fmovsvc	%xcc,	%f7,	%f12
	fcmpne16	%f10,	%f0,	%o0
	movrlz	%g5,	%l1,	%l3
	fabss	%f6,	%f9
	nop
	setx loop_617, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_617:
	movleu	%xcc,	%i0,	%o6
	fmovdvs	%xcc,	%f8,	%f13
	bn,a	%icc,	loop_618
loop_618:
	movrgez	%g4,	%g1,	%l6
	bl	loop_619
loop_619:
	fcmps	%fcc0,	%f14,	%f10
	fabsd	%f12,	%f6
	ldsb	[%l7 + 0x29],	%o2
	nop
	setx loop_620, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_620:
	fcmps	%fcc3,	%f0,	%f12
	sdivx	%l2,	0x190E,	%g6
	brlez,a	%i6,	loop_621
loop_621:
	fbn	%fcc0,	loop_622
loop_622:
	fornot2	%f10,	%f14,	%f10
	fcmpeq16	%f0,	%f8,	%i3
	array32	%g3,	%i4,	%i1
	fsrc2	%f6,	%f14
	fsrc2	%f0,	%f12
	fpadd16s	%f12,	%f4,	%f6
	fmovdne	%icc,	%f7,	%f12
	fors	%f12,	%f2,	%f10
	fbule,a	%fcc0,	loop_623
loop_623:
	fmovdcc	%icc,	%f1,	%f3
	fmovsg	%icc,	%f3,	%f7
	fmovrsgz	%i7,	%f10,	%f8
	fpsub16s	%f0,	%f2,	%f12
	bne,pn	%icc,	loop_624
loop_624:
	fmovrslz	%o1,	%f15,	%f8
	fmovdn	%icc,	%f4,	%f0
	udiv	%o7,	0x0291,	%l4
	fcmpgt16	%f14,	%f6,	%i5
	fmovrdgz	%g2,	%f8,	%f0
	fmovsvc	%icc,	%f14,	%f15
	nop
	setx loop_625, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_625:
	call	loop_626
loop_626:
	fsrc1	%f6,	%f2
	brlz	%o5,	loop_627
loop_627:
	fpack16	%f10,	%f11
	bvs	loop_628
loop_628:
	smul	%g7,	0x0326,	%l5
	addccc	%i2,	0x005A,	%o3
	fbl	%fcc2,	loop_629
loop_629:
	edge16	%l0,	%o0,	%g5
	movl	%xcc,	%l1,	%l3
	ldd	[%l7 + 0x10],	%f6
	movl	%xcc,	%i0,	%o6
	fmovsgu	%icc,	%f15,	%f6
	fmovrse	%g4,	%f13,	%f3
	ldx	[%l7 + 0x18],	%o4
	fnegs	%f5,	%f11
	fsrc2s	%f10,	%f4
	bshuffle	%f0,	%f12,	%f6
	andcc	%l6,	%g1,	%l2
	fmovrsgz	%o2,	%f12,	%f10
	movne	%xcc,	%i6,	%i3
	bgu,a,pn	%xcc,	loop_630
loop_630:
	fzeros	%f15
	ldx	[%l7 + 0x60],	%g3
	ldsw	[%l7 + 0x70],	%i4
	fandnot1s	%f10,	%f8,	%f0
	nop
	setx loop_631, %l0, %l1
	jmpl %l1, %i1
loop_631:
	fbug,a	%fcc2,	loop_632
loop_632:
	brgez	%i7,	loop_633
loop_633:
	andncc	%o1,	%g6,	%l4
	fmovsg	%xcc,	%f2,	%f1
	fmovrslez	%i5,	%f0,	%f0
	fcmpeq32	%f6,	%f8,	%g2
	bg	loop_634
loop_634:
	ldub	[%l7 + 0x6B],	%o7
	fmovsg	%xcc,	%f9,	%f13
	fzeros	%f7
	fcmpeq32	%f2,	%f2,	%g7
	fmovrdgz	%o5,	%f8,	%f2
	fcmpne32	%f4,	%f12,	%l5
	fexpand	%f8,	%f10
	ldsb	[%l7 + 0x3B],	%o3
	movvs	%icc,	%l0,	%i2
	fmovdpos	%icc,	%f0,	%f13
	fandnot2s	%f9,	%f1,	%f14
	ldd	[%l7 + 0x38],	%f4
	fmovdcc	%xcc,	%f8,	%f6
	fcmps	%fcc3,	%f7,	%f1
	movvs	%xcc,	%g5,	%o0
	fabss	%f5,	%f8
	fmovscc	%xcc,	%f12,	%f10
	siam	0x0
	edge8n	%l3,	%l1,	%i0
	brnz	%g4,	loop_635
loop_635:
	fexpand	%f7,	%f12
	fcmpne32	%f0,	%f6,	%o6
	fsrc1s	%f11,	%f2
	sdivx	%l6,	0x1764,	%g1
	fmovsle	%icc,	%f9,	%f4
	movn	%icc,	%l2,	%o2
	bcs,a,pt	%icc,	loop_636
loop_636:
	bvc,a,pt	%xcc,	loop_637
loop_637:
	fmovrse	%i6,	%f7,	%f12
	fmovsge	%xcc,	%f15,	%f0
	fmul8x16au	%f9,	%f2,	%f4
	fcmple16	%f2,	%f12,	%o4
	ldsb	[%l7 + 0x46],	%i3
	fmovde	%icc,	%f7,	%f1
	ldsw	[%l7 + 0x7C],	%g3
	fzero	%f8
	fbuge,a	%fcc0,	loop_638
loop_638:
	fmul8sux16	%f8,	%f4,	%f14
	edge16ln	%i4,	%i1,	%i7
	fmovsneg	%icc,	%f13,	%f5
	fmovde	%xcc,	%f6,	%f6
	fpadd32	%f12,	%f4,	%f14
	fmovrsne	%o1,	%f5,	%f4
	bg,pt	%xcc,	loop_639
loop_639:
	udiv	%l4,	0x0735,	%i5
	fandnot2s	%f2,	%f12,	%f0
	fmovsne	%xcc,	%f15,	%f0
	fands	%f2,	%f0,	%f1
	fmovsgu	%xcc,	%f7,	%f9
	brnz,a	%g6,	loop_640
loop_640:
	ldsh	[%l7 + 0x5C],	%g2
	fxnor	%f8,	%f10,	%f12
	orn	%o7,	%g7,	%l5
	be,a,pn	%icc,	loop_641
loop_641:
	fmovsneg	%icc,	%f1,	%f5
	sll	%o5,	%o3,	%l0
	call	loop_642
loop_642:
	fmovrsgz	%g5,	%f3,	%f11
	tneg	%icc,	0x2
	faligndata	%f2,	%f0,	%f4
	edge8ln	%i2,	%l3,	%l1
	tne	%icc,	0x4
	bcc,a,pn	%icc,	loop_643
loop_643:
	fpadd16s	%f2,	%f3,	%f6
	fmovscs	%icc,	%f15,	%f9
	ldd	[%l7 + 0x38],	%f10
	fcmpgt32	%f0,	%f2,	%o0
	andn	%g4,	0x0A4F,	%i0
	fxor	%f14,	%f0,	%f4
	movrlz	%l6,	0x095,	%o6
	fornot2s	%f6,	%f14,	%f3
	fabsd	%f14,	%f14
	fnands	%f0,	%f7,	%f8
	for	%f2,	%f10,	%f0
	brlez,a	%g1,	loop_644
loop_644:
	fones	%f7
	fors	%f15,	%f7,	%f11
	fmovdneg	%xcc,	%f12,	%f7
	movn	%icc,	%o2,	%i6
	fpadd16	%f12,	%f8,	%f14
	fcmple16	%f10,	%f0,	%l2
	fexpand	%f13,	%f4
	mulx	%i3,	0x1906,	%o4
	lduw	[%l7 + 0x68],	%i4
	ta	%xcc,	0x5
	fornot2	%f6,	%f14,	%f0
	fmovsvc	%icc,	%f0,	%f12
	pdist	%f4,	%f6,	%f10
	fmovdvs	%xcc,	%f8,	%f10
	fsrc1s	%f9,	%f11
	fmul8x16au	%f7,	%f14,	%f2
	movrgez	%g3,	%i7,	%i1
	fmovsge	%xcc,	%f13,	%f13
	and	%o1,	0x17C2,	%i5
	fcmpeq32	%f8,	%f0,	%g6
	edge16ln	%l4,	%o7,	%g2
	sth	%l5,	[%l7 + 0x16]
	siam	0x2
	fors	%f0,	%f14,	%f10
	fmovscc	%icc,	%f12,	%f1
	fbuge	%fcc0,	loop_645
loop_645:
	fands	%f14,	%f4,	%f7
	ldx	[%l7 + 0x50],	%g7
	edge8n	%o3,	%l0,	%g5
	fpsub16	%f8,	%f4,	%f6
	fcmple32	%f14,	%f12,	%i2
	sth	%o5,	[%l7 + 0x22]
	fnor	%f8,	%f8,	%f0
	fbuge	%fcc3,	loop_646
loop_646:
	fxor	%f4,	%f2,	%f2
	fmovscc	%xcc,	%f14,	%f11
	fxor	%f10,	%f10,	%f8
	fone	%f14
	mulscc	%l3,	0x0C77,	%l1
	bg,pn	%xcc,	loop_647
loop_647:
	fsrc1s	%f14,	%f4
	fmovda	%icc,	%f11,	%f3
	ld	[%l7 + 0x64],	%f13
	fblg,a	%fcc2,	loop_648
loop_648:
	alignaddr	%o0,	%g4,	%i0
	std	%f12,	[%l7 + 0x38]
	fmovrsgez	%o6,	%f5,	%f8
	fmovdpos	%xcc,	%f9,	%f1
	fmovrdgz	%g1,	%f6,	%f2
	for	%f10,	%f14,	%f12
	fmovdpos	%icc,	%f13,	%f12
	fmovscs	%xcc,	%f9,	%f4
	udiv	%l6,	0x1D09,	%i6
	fmovdcs	%icc,	%f6,	%f1
	fmovd	%f0,	%f2
	bne	loop_649
loop_649:
	fmovsvc	%xcc,	%f4,	%f5
	fmovrdne	%l2,	%f2,	%f2
	fmovdpos	%icc,	%f11,	%f8
	fabss	%f9,	%f14
	for	%f12,	%f8,	%f10
	fsrc2s	%f7,	%f9
	fbl,a	%fcc1,	loop_650
loop_650:
	fpack16	%f8,	%f10
	fbuge	%fcc1,	loop_651
loop_651:
	movl	%icc,	%o2,	%i3
	std	%f14,	[%l7 + 0x38]
	fmul8sux16	%f10,	%f6,	%f12
	brz	%i4,	loop_652
loop_652:
	brlez	%g3,	loop_653
loop_653:
	nop
	setx loop_654, %l0, %l1
	jmpl %l1, %i7
loop_654:
	stx	%o4,	[%l7 + 0x30]
	mulscc	%o1,	%i1,	%g6
	fmovrde	%l4,	%f6,	%f10
	fnands	%f10,	%f3,	%f1
	ba,pt	%xcc,	loop_655
loop_655:
	fmovda	%icc,	%f13,	%f2
	stx	%i5,	[%l7 + 0x48]
	sth	%o7,	[%l7 + 0x1C]
	fcmped	%fcc0,	%f2,	%f8
	ta	%xcc,	0x6
	ldub	[%l7 + 0x2B],	%g2
	stb	%l5,	[%l7 + 0x21]
	fnegd	%f8,	%f10
	xor	%g7,	%o3,	%g5
	orcc	%i2,	%o5,	%l3
	fnot2s	%f3,	%f7
	fmul8ulx16	%f8,	%f4,	%f6
	movrgez	%l0,	0x0ED,	%l1
	bg	loop_656
loop_656:
	fpack16	%f12,	%f3
	fmovrsgz	%o0,	%f4,	%f7
	fmovdl	%xcc,	%f1,	%f5
	fnor	%f2,	%f8,	%f14
	fnot1	%f4,	%f2
	fmovdcs	%xcc,	%f2,	%f12
	call	loop_657
loop_657:
	ldsh	[%l7 + 0x2A],	%g4
	movleu	%icc,	%o6,	%i0
	fcmple16	%f6,	%f12,	%g1
	fnands	%f4,	%f7,	%f1
	xnorcc	%i6,	%l2,	%l6
	fmul8ulx16	%f4,	%f4,	%f14
	sth	%o2,	[%l7 + 0x3A]
	tgu	%icc,	0x0
	fmovsleu	%xcc,	%f11,	%f1
	st	%f4,	[%l7 + 0x4C]
	st	%f14,	[%l7 + 0x10]
	fbg	%fcc0,	loop_658
loop_658:
	fpackfix	%f0,	%f7
	fmuld8ulx16	%f0,	%f5,	%f4
	tg	%icc,	0x1
	ldub	[%l7 + 0x19],	%i3
	bvs	loop_659
loop_659:
	fornot1	%f0,	%f2,	%f12
	nop
	setx loop_660, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_660:
	fbn,a	%fcc2,	loop_661
loop_661:
	popc	%i4,	%i7
	fmovdg	%xcc,	%f4,	%f13
	movleu	%icc,	%o4,	%g3
	ldub	[%l7 + 0x7B],	%i1
	edge32ln	%o1,	%l4,	%i5
	faligndata	%f14,	%f6,	%f8
	fsrc1	%f14,	%f12
	fmovdvs	%icc,	%f5,	%f3
	fornot2s	%f15,	%f3,	%f11
	bgu,a,pt	%icc,	loop_662
loop_662:
	fmovsa	%icc,	%f7,	%f8
	fmovrsgez	%o7,	%f1,	%f1
	fmovsn	%icc,	%f2,	%f8
	fmovdvc	%icc,	%f12,	%f0
	fmovrslez	%g6,	%f5,	%f15
	fmul8ulx16	%f10,	%f4,	%f8
	fnegd	%f6,	%f12
	fpackfix	%f10,	%f5
	fsrc2	%f0,	%f8
	fmovdne	%xcc,	%f12,	%f2
	sethi	0x089E,	%g2
	fabsd	%f6,	%f6
	edge8l	%l5,	%g7,	%o3
	ldd	[%l7 + 0x08],	%f4
	brlz,a	%g5,	loop_663
loop_663:
	bn	%xcc,	loop_664
loop_664:
	ld	[%l7 + 0x08],	%f11
	taddcc	%o5,	0x0F3D,	%l3
	movvs	%icc,	%l0,	%l1
	sethi	0x1AB4,	%o0
	brnz,a	%g4,	loop_665
loop_665:
	ld	[%l7 + 0x5C],	%f5
	fpackfix	%f10,	%f6
	edge8n	%o6,	%i0,	%g1
	fmovsa	%icc,	%f14,	%f4
	fmovs	%f5,	%f11
	bpos,a	loop_666
loop_666:
	fmuld8sux16	%f7,	%f8,	%f4
	fcmpne32	%f4,	%f12,	%i2
	ldsw	[%l7 + 0x64],	%i6
	fors	%f5,	%f8,	%f5
	fmovsvc	%xcc,	%f14,	%f8
	udivx	%l6,	0x0403,	%o2
	mulscc	%i3,	0x1205,	%i4
	movneg	%icc,	%l2,	%i7
	fzero	%f8
	fmovrdne	%o4,	%f14,	%f6
	pdist	%f10,	%f0,	%f8
	mulx	%i1,	%o1,	%g3
	fcmpne32	%f14,	%f12,	%i5
	faligndata	%f14,	%f12,	%f10
	for	%f2,	%f6,	%f12
	fmovdvc	%icc,	%f2,	%f14
	fmovsneg	%icc,	%f4,	%f5
	fone	%f8
	ldsb	[%l7 + 0x66],	%l4
	fnor	%f4,	%f14,	%f8
	bvc	%xcc,	loop_667
loop_667:
	for	%f4,	%f6,	%f14
	array8	%o7,	%g2,	%l5
	fnegd	%f14,	%f8
	fpmerge	%f5,	%f7,	%f6
	fmovsgu	%icc,	%f14,	%f10
	orcc	%g6,	0x00AD,	%g7
	orncc	%o3,	0x19C4,	%o5
	lduh	[%l7 + 0x4A],	%g5
	fzeros	%f10
	std	%f2,	[%l7 + 0x20]
	fnot1s	%f12,	%f13
	brgez,a	%l0,	loop_668
loop_668:
	fexpand	%f13,	%f14
	ldsw	[%l7 + 0x64],	%l1
	lduh	[%l7 + 0x24],	%l3
	fpack16	%f10,	%f6
	movrgez	%o0,	%g4,	%o6
	fmovrdgez	%i0,	%f14,	%f10
	fnor	%f14,	%f12,	%f2
	bgu,a,pn	%xcc,	loop_669
loop_669:
	movleu	%xcc,	%i2,	%g1
	smul	%i6,	0x0C75,	%o2
	fcmps	%fcc2,	%f13,	%f11
	fnot1	%f10,	%f4
	fbge,a	%fcc0,	loop_670
loop_670:
	nop
	setx loop_671, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_671:
	fmovrsgz	%i3,	%f5,	%f7
	fmovdcs	%xcc,	%f3,	%f3
	fxnor	%f14,	%f6,	%f6
	fxors	%f14,	%f13,	%f8
	lduw	[%l7 + 0x70],	%l6
	orcc	%l2,	%i4,	%i7
	fmovsg	%xcc,	%f9,	%f12
	fmovdleu	%icc,	%f9,	%f0
	taddcc	%i1,	0x0781,	%o4
	ldsh	[%l7 + 0x2E],	%o1
	fnegs	%f7,	%f15
	fone	%f10
	fbul,a	%fcc0,	loop_672
loop_672:
	or	%g3,	0x0CD2,	%l4
	fpmerge	%f12,	%f3,	%f10
	fexpand	%f10,	%f2
	tpos	%icc,	0x1
	lduh	[%l7 + 0x0A],	%o7
	fmovdcc	%icc,	%f13,	%f9
	fsrc1s	%f0,	%f14
	tgu	%xcc,	0x4
	fcmpeq32	%f4,	%f10,	%g2
	ld	[%l7 + 0x74],	%f15
	lduw	[%l7 + 0x60],	%l5
	movn	%icc,	%i5,	%g6
	bl,a	%xcc,	loop_673
loop_673:
	stb	%o3,	[%l7 + 0x09]
	fmovspos	%xcc,	%f1,	%f5
	fmovdpos	%icc,	%f5,	%f10
	fba	%fcc2,	loop_674
loop_674:
	fmovsg	%icc,	%f6,	%f8
	fmul8x16au	%f7,	%f6,	%f12
	fmovrslez	%g7,	%f7,	%f0
	sdiv	%g5,	0x1AB7,	%o5
	fmovsa	%icc,	%f13,	%f10
	fzero	%f14
	mova	%icc,	%l1,	%l0
	array8	%o0,	%l3,	%g4
	fmovrdlz	%i0,	%f6,	%f6
	fandnot1	%f14,	%f4,	%f4
	ldub	[%l7 + 0x6C],	%o6
	brlz,a	%g1,	loop_675
loop_675:
	fpadd32s	%f14,	%f13,	%f1
	tgu	%xcc,	0x1
	fmovdleu	%icc,	%f4,	%f6
	fmovsne	%xcc,	%f7,	%f11
	fcmpeq16	%f2,	%f2,	%i2
	fmovdge	%icc,	%f8,	%f13
	fmovdvs	%xcc,	%f6,	%f1
	fxors	%f12,	%f13,	%f6
	fmovdneg	%xcc,	%f11,	%f14
	edge8ln	%i6,	%i3,	%o2
	fsrc2s	%f0,	%f4
	fmovda	%icc,	%f2,	%f12
	orn	%l6,	%l2,	%i7
	fzeros	%f14
	addcc	%i1,	%i4,	%o4
	fmovdneg	%icc,	%f13,	%f14
	fmul8x16al	%f1,	%f6,	%f8
	fpadd32s	%f13,	%f11,	%f13
	fandnot2	%f12,	%f14,	%f14
	sdiv	%o1,	0x1211,	%g3
	fmovsn	%icc,	%f5,	%f0
	fmovrsgz	%o7,	%f15,	%f2
	fsrc2	%f4,	%f12
	fcmpgt32	%f6,	%f6,	%g2
	fabsd	%f2,	%f12
	tge	%xcc,	0x4
	fzeros	%f14
	fmovdle	%icc,	%f15,	%f6
	edge8	%l5,	%i5,	%g6
	fmovdge	%xcc,	%f6,	%f0
	fblg,a	%fcc1,	loop_676
loop_676:
	bpos,a,pt	%icc,	loop_677
loop_677:
	orcc	%l4,	%o3,	%g5
	fbug,a	%fcc3,	loop_678
loop_678:
	brlz,a	%g7,	loop_679
loop_679:
	faligndata	%f14,	%f8,	%f6
	edge16n	%l1,	%o5,	%l0
	fcmple32	%f8,	%f8,	%o0
	move	%icc,	%g4,	%l3
	fxnor	%f10,	%f10,	%f0
	fcmpeq32	%f8,	%f12,	%i0
	fcmpne32	%f8,	%f0,	%g1
	sth	%o6,	[%l7 + 0x1E]
	sdivcc	%i6,	0x101D,	%i2
	fmovspos	%icc,	%f14,	%f13
	movn	%icc,	%o2,	%i3
	fpadd16s	%f8,	%f12,	%f6
	fmovs	%f13,	%f8
	fmovdvs	%xcc,	%f10,	%f3
	fmovdcs	%xcc,	%f0,	%f7
	fmovdvs	%xcc,	%f14,	%f5
	fpack16	%f6,	%f7
	fmovsvc	%xcc,	%f1,	%f9
	tl	%icc,	0x3
	fcmpne32	%f10,	%f6,	%l6
	fmovrsne	%i7,	%f10,	%f12
	fmovsneg	%xcc,	%f4,	%f7
	movgu	%xcc,	%i1,	%i4
	tsubcc	%o4,	%l2,	%o1
	fmul8x16au	%f9,	%f0,	%f8
	ldsh	[%l7 + 0x3E],	%g3
	fpack32	%f12,	%f14,	%f0
	fmovdg	%icc,	%f9,	%f11
	fnand	%f14,	%f2,	%f12
	fmovscs	%icc,	%f8,	%f2
	fpadd16s	%f15,	%f11,	%f13
	addc	%o7,	%l5,	%i5
	fpadd32	%f2,	%f8,	%f12
	ldub	[%l7 + 0x4D],	%g2
	fnor	%f14,	%f6,	%f2
	fcmpes	%fcc0,	%f4,	%f0
	sdivx	%l4,	0x07BD,	%o3
	fxnor	%f0,	%f12,	%f14
	fbe,a	%fcc2,	loop_680
loop_680:
	fblg	%fcc3,	loop_681
loop_681:
	edge32l	%g5,	%g7,	%l1
	bn,pt	%xcc,	loop_682
loop_682:
	ldub	[%l7 + 0x6F],	%g6
	fones	%f8
	edge16l	%o5,	%o0,	%g4
	fpack32	%f4,	%f4,	%f0
	fnors	%f3,	%f0,	%f0
	sdivx	%l0,	0x1C0B,	%l3
	std	%f4,	[%l7 + 0x48]
	fmovrdlz	%g1,	%f12,	%f14
	fcmpeq16	%f8,	%f6,	%o6
	fornot2s	%f1,	%f6,	%f0
	std	%f10,	[%l7 + 0x08]
	ldub	[%l7 + 0x44],	%i6
	fmovdle	%icc,	%f1,	%f12
	st	%f3,	[%l7 + 0x18]
	movcc	%icc,	%i0,	%i2
	fcmpes	%fcc0,	%f15,	%f7
	fmovrsgez	%i3,	%f8,	%f12
	fmovdleu	%icc,	%f8,	%f12
	andn	%l6,	%i7,	%o2
	fmovrslz	%i4,	%f0,	%f13
	fmovdg	%icc,	%f13,	%f7
	fbe	%fcc1,	loop_683
loop_683:
	fmovrse	%i1,	%f1,	%f2
	fbue	%fcc3,	loop_684
loop_684:
	udiv	%o4,	0x1891,	%l2
	fornot2s	%f7,	%f1,	%f13
	fbne	%fcc3,	loop_685
loop_685:
	xnor	%o1,	%g3,	%o7
	tn	%xcc,	0x4
	fcmps	%fcc1,	%f9,	%f6
	st	%f6,	[%l7 + 0x10]
	fmovdne	%icc,	%f3,	%f1
	fmovscs	%icc,	%f8,	%f13
	st	%f4,	[%l7 + 0x54]
	fmul8ulx16	%f14,	%f12,	%f14
	fmovda	%icc,	%f8,	%f0
	movn	%icc,	%i5,	%g2
	alignaddrl	%l4,	%l5,	%g5
	fbg	%fcc1,	loop_686
loop_686:
	movrlez	%o3,	0x330,	%g7
	fcmpeq32	%f6,	%f10,	%l1
	fmovsleu	%xcc,	%f7,	%f5
	fcmpes	%fcc3,	%f10,	%f1
	fmovscs	%icc,	%f13,	%f14
	st	%f5,	[%l7 + 0x40]
	fmovdl	%icc,	%f11,	%f14
	fpsub16	%f10,	%f4,	%f14
	ldsh	[%l7 + 0x74],	%o5
	fornot2	%f2,	%f0,	%f14
	ld	[%l7 + 0x30],	%f14
	std	%f0,	[%l7 + 0x48]
	fmovdcs	%icc,	%f13,	%f3
	fpadd16s	%f9,	%f1,	%f8
	ldd	[%l7 + 0x58],	%f2
	brgz	%g6,	loop_687
loop_687:
	fsrc1	%f2,	%f12
	subccc	%o0,	0x125A,	%l0
	fmul8ulx16	%f10,	%f10,	%f0
	fzero	%f12
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type f   	: 543
!	Type cti   	: 132
!	Type i   	: 199
!	Type l   	: 126
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
main_t4:

	!# Initialize registers ..

	!# Global registers
	set	0xD,	%g1
	set	0xC,	%g2
	set	0x4,	%g3
	set	0xD,	%g4
	set	0xC,	%g5
	set	0x6,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xF,	%i1
	set	-0x2,	%i2
	set	-0xE,	%i3
	set	-0x5,	%i4
	set	-0x3,	%i5
	set	-0x9,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x0A935E8F,	%l0
	set	0x33011FC5,	%l1
	set	0x3DCADEDB,	%l2
	set	0x2E59760C,	%l3
	set	0x13822A4B,	%l4
	set	0x39782D21,	%l5
	set	0x13F20A82,	%l6
	!# Output registers
	set	-0x07E1,	%o0
	set	-0x0960,	%o1
	set	-0x1A60,	%o2
	set	0x1D27,	%o3
	set	0x18E5,	%o4
	set	-0x159E,	%o5
	set	-0x1BC7,	%o6
	set	-0x0715,	%o7

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

	bvs	loop_688
loop_688:
	brgez	%g4,	loop_689
loop_689:
	fbuge	%fcc3,	loop_690
loop_690:
	fpsub16	%f10,	%f6,	%f2
	bcc,a,pt	%xcc,	loop_691
loop_691:
	fblg	%fcc3,	loop_692
loop_692:
	fsrc2	%f4,	%f0
	nop
	setx loop_693, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_693:
	stx	%g1,	[%l7 + 0x78]
	brnz	%o6,	loop_694
loop_694:
	fmovspos	%xcc,	%f6,	%f2
	bleu,a,pn	%xcc,	loop_695
loop_695:
	fcmpne16	%f4,	%f8,	%i6
	fbu,a	%fcc2,	loop_696
loop_696:
	ldsh	[%l7 + 0x0A],	%l3
	fmovsvs	%xcc,	%f1,	%f10
	fmovdl	%icc,	%f11,	%f2
	nop
	setx loop_697, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_697:
	fnands	%f4,	%f14,	%f4
	movcs	%icc,	%i2,	%i3
	nop
	setx loop_698, %l0, %l1
	jmpl %l1, %i0
loop_698:
	movge	%icc,	%l6,	%i7
	ble,a	%icc,	loop_699
loop_699:
	bcs,a,pn	%xcc,	loop_700
loop_700:
	fbg	%fcc2,	loop_701
loop_701:
	fbo,a	%fcc2,	loop_702
loop_702:
	brlez,a	%i4,	loop_703
loop_703:
	call	loop_704
loop_704:
	move	%xcc,	%i1,	%o4
	brnz	%o2,	loop_705
loop_705:
	fbne	%fcc0,	loop_706
loop_706:
	fmovdne	%xcc,	%f3,	%f1
	fmovsge	%icc,	%f2,	%f6
	lduh	[%l7 + 0x62],	%l2
	fands	%f8,	%f2,	%f10
	tvs	%icc,	0x1
	fmul8sux16	%f8,	%f4,	%f6
	bne,pn	%xcc,	loop_707
loop_707:
	movrgez	%g3,	0x104,	%o1
	bcs,a	loop_708
loop_708:
	stx	%i5,	[%l7 + 0x18]
	ldd	[%l7 + 0x58],	%f2
	fblg,a	%fcc0,	loop_709
loop_709:
	fblg,a	%fcc3,	loop_710
loop_710:
	fmovdl	%icc,	%f12,	%f3
	fpackfix	%f12,	%f11
	fbn,a	%fcc2,	loop_711
loop_711:
	fbge,a	%fcc3,	loop_712
loop_712:
	mulx	%o7,	0x1DA3,	%g2
	fblg	%fcc3,	loop_713
loop_713:
	be	%icc,	loop_714
loop_714:
	fbue,a	%fcc1,	loop_715
loop_715:
	brlz	%l4,	loop_716
loop_716:
	tvs	%icc,	0x4
	movrlez	%l5,	0x24E,	%g5
	xnorcc	%g7,	0x09C5,	%o3
	lduh	[%l7 + 0x4E],	%l1
	bpos	%icc,	loop_717
loop_717:
	fbule,a	%fcc1,	loop_718
loop_718:
	fbne	%fcc0,	loop_719
loop_719:
	bcc,a	loop_720
loop_720:
	brz,a	%g6,	loop_721
loop_721:
	bleu,pt	%xcc,	loop_722
loop_722:
	fbuge	%fcc0,	loop_723
loop_723:
	ble,a,pt	%icc,	loop_724
loop_724:
	fbu,a	%fcc3,	loop_725
loop_725:
	fbul,a	%fcc0,	loop_726
loop_726:
	fbue	%fcc2,	loop_727
loop_727:
	fmovdvs	%xcc,	%f8,	%f7
	brnz,a	%o5,	loop_728
loop_728:
	edge8n	%l0,	%g4,	%o0
	fbne	%fcc0,	loop_729
loop_729:
	bge,a	loop_730
loop_730:
	fxnors	%f10,	%f5,	%f13
	fbn	%fcc0,	loop_731
loop_731:
	fbge	%fcc2,	loop_732
loop_732:
	bleu,a	loop_733
loop_733:
	movgu	%xcc,	%g1,	%o6
	fmul8x16al	%f8,	%f0,	%f10
	ldsb	[%l7 + 0x74],	%i6
	edge16n	%i2,	%i3,	%i0
	brnz,a	%l6,	loop_734
loop_734:
	ldd	[%l7 + 0x40],	%f6
	ba,a	loop_735
loop_735:
	ba,a,pn	%xcc,	loop_736
loop_736:
	fmovspos	%icc,	%f5,	%f11
	andn	%i7,	%l3,	%i1
	brgz,a	%i4,	loop_737
loop_737:
	be	%xcc,	loop_738
loop_738:
	fbule,a	%fcc1,	loop_739
loop_739:
	xor	%o4,	0x1A84,	%l2
	brgez	%g3,	loop_740
loop_740:
	stx	%o1,	[%l7 + 0x70]
	fbue	%fcc2,	loop_741
loop_741:
	movre	%i5,	0x1BA,	%o7
	ldsw	[%l7 + 0x54],	%g2
	brnz,a	%o2,	loop_742
loop_742:
	fcmpeq32	%f0,	%f2,	%l4
	fcmple32	%f0,	%f14,	%l5
	fbul	%fcc3,	loop_743
loop_743:
	stb	%g7,	[%l7 + 0x12]
	ba,a	%icc,	loop_744
loop_744:
	fnot2s	%f12,	%f6
	fmovdl	%icc,	%f2,	%f4
	edge8l	%o3,	%g5,	%g6
	nop
	setx loop_745, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_745:
	fmovsleu	%icc,	%f9,	%f3
	movneg	%xcc,	%l1,	%l0
	stw	%g4,	[%l7 + 0x54]
	fbn	%fcc2,	loop_746
loop_746:
	fmovsn	%xcc,	%f7,	%f8
	fxors	%f2,	%f1,	%f2
	fbue,a	%fcc2,	loop_747
loop_747:
	ldub	[%l7 + 0x6C],	%o5
	nop
	setx loop_748, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_748:
	edge16	%o0,	%o6,	%i6
	for	%f10,	%f2,	%f14
	tge	%xcc,	0x0
	fmovd	%f0,	%f2
	fbul,a	%fcc2,	loop_749
loop_749:
	bvc,a	%xcc,	loop_750
loop_750:
	call	loop_751
loop_751:
	fpsub32	%f8,	%f4,	%f6
	fbo,a	%fcc1,	loop_752
loop_752:
	bl,a	loop_753
loop_753:
	fble	%fcc2,	loop_754
loop_754:
	fmovrsgez	%g1,	%f11,	%f5
	stx	%i3,	[%l7 + 0x60]
	fbule	%fcc2,	loop_755
loop_755:
	fbe,a	%fcc2,	loop_756
loop_756:
	brlez	%i2,	loop_757
loop_757:
	fexpand	%f5,	%f2
	tl	%icc,	0x4
	faligndata	%f12,	%f12,	%f8
	fmovsvs	%icc,	%f14,	%f2
	nop
	setx loop_758, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_758:
	brz	%l6,	loop_759
loop_759:
	lduw	[%l7 + 0x7C],	%i0
	fcmpne32	%f14,	%f0,	%l3
	fmovrsne	%i1,	%f14,	%f14
	siam	0x4
	movne	%xcc,	%i7,	%i4
	fcmple16	%f4,	%f4,	%l2
	fandnot2s	%f6,	%f1,	%f1
	bne,pt	%icc,	loop_760
loop_760:
	bgu,a,pt	%xcc,	loop_761
loop_761:
	fbg	%fcc0,	loop_762
loop_762:
	st	%f9,	[%l7 + 0x40]
	bgu,a,pt	%icc,	loop_763
loop_763:
	nop
	setx loop_764, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_764:
	call	loop_765
loop_765:
	fbue,a	%fcc3,	loop_766
loop_766:
	fmovdn	%icc,	%f3,	%f0
	movle	%xcc,	%o4,	%g3
	xnorcc	%o1,	%i5,	%o7
	edge16l	%o2,	%g2,	%l5
	ble	loop_767
loop_767:
	nop
	setx loop_768, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_768:
	edge32l	%g7,	%l4,	%o3
	fbge	%fcc2,	loop_769
loop_769:
	fbu	%fcc0,	loop_770
loop_770:
	fbl,a	%fcc1,	loop_771
loop_771:
	fbuge	%fcc1,	loop_772
loop_772:
	faligndata	%f6,	%f14,	%f14
	fpack32	%f4,	%f10,	%f10
	fbo,a	%fcc0,	loop_773
loop_773:
	movvc	%xcc,	%g5,	%g6
	stx	%l0,	[%l7 + 0x68]
	movneg	%icc,	%g4,	%l1
	fpack32	%f14,	%f12,	%f4
	fzeros	%f7
	ble,pn	%icc,	loop_774
loop_774:
	bvs	loop_775
loop_775:
	fbl	%fcc0,	loop_776
loop_776:
	bge	loop_777
loop_777:
	fcmpne16	%f8,	%f6,	%o5
	fbug	%fcc3,	loop_778
loop_778:
	bvs	loop_779
loop_779:
	nop
	setx loop_780, %l0, %l1
	jmpl %l1, %o0
loop_780:
	bge	%xcc,	loop_781
loop_781:
	fbug,a	%fcc2,	loop_782
loop_782:
	brgz	%i6,	loop_783
loop_783:
	fbug	%fcc3,	loop_784
loop_784:
	bpos	%icc,	loop_785
loop_785:
	bvs,a,pt	%xcc,	loop_786
loop_786:
	nop
	setx loop_787, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_787:
	bg	loop_788
loop_788:
	fxnors	%f14,	%f1,	%f9
	bleu,a,pn	%xcc,	loop_789
loop_789:
	fmovd	%f6,	%f4
	edge32n	%o6,	%i3,	%g1
	fands	%f0,	%f15,	%f8
	bcs,pt	%icc,	loop_790
loop_790:
	movg	%icc,	%l6,	%i0
	umulcc	%l3,	0x181E,	%i2
	fblg	%fcc1,	loop_791
loop_791:
	brlz,a	%i1,	loop_792
loop_792:
	brlz,a	%i4,	loop_793
loop_793:
	bne,pn	%icc,	loop_794
loop_794:
	subc	%i7,	0x00D3,	%o4
	andcc	%g3,	%o1,	%i5
	ldub	[%l7 + 0x70],	%l2
	fbu,a	%fcc0,	loop_795
loop_795:
	lduw	[%l7 + 0x68],	%o2
	fmovdge	%icc,	%f13,	%f14
	ldd	[%l7 + 0x70],	%f0
	fbo,a	%fcc0,	loop_796
loop_796:
	bgu,a	loop_797
loop_797:
	movcs	%xcc,	%g2,	%o7
	movn	%xcc,	%g7,	%l5
	lduh	[%l7 + 0x36],	%o3
	bge	%icc,	loop_798
loop_798:
	movgu	%xcc,	%l4,	%g6
	bn,pn	%icc,	loop_799
loop_799:
	tpos	%xcc,	0x0
	ldsh	[%l7 + 0x18],	%g5
	stb	%l0,	[%l7 + 0x75]
	nop
	setx loop_800, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_800:
	st	%f3,	[%l7 + 0x54]
	sllx	%l1,	0x1E,	%o5
	fmovsgu	%icc,	%f8,	%f0
	fbuge,a	%fcc1,	loop_801
loop_801:
	ble,pt	%icc,	loop_802
loop_802:
	fbuge,a	%fcc0,	loop_803
loop_803:
	fba	%fcc1,	loop_804
loop_804:
	bne,pt	%xcc,	loop_805
loop_805:
	fbge	%fcc3,	loop_806
loop_806:
	bpos	%icc,	loop_807
loop_807:
	lduh	[%l7 + 0x3E],	%o0
	nop
	setx loop_808, %l0, %l1
	jmpl %l1, %i6
loop_808:
	bneg,a,pt	%icc,	loop_809
loop_809:
	ba	%icc,	loop_810
loop_810:
	bge,a,pt	%xcc,	loop_811
loop_811:
	edge8n	%o6,	%i3,	%g1
	be,a,pn	%xcc,	loop_812
loop_812:
	fmovda	%icc,	%f0,	%f13
	fmovsneg	%xcc,	%f12,	%f14
	move	%xcc,	%g4,	%i0
	brgz,a	%l3,	loop_813
loop_813:
	fbl	%fcc0,	loop_814
loop_814:
	fbge	%fcc0,	loop_815
loop_815:
	fpack32	%f2,	%f0,	%f8
	tge	%xcc,	0x7
	bgu,pt	%xcc,	loop_816
loop_816:
	movne	%icc,	%l6,	%i2
	fcmpgt32	%f0,	%f8,	%i1
	ldsb	[%l7 + 0x7F],	%i4
	fcmple16	%f4,	%f12,	%o4
	tvs	%icc,	0x4
	subccc	%g3,	%o1,	%i5
	stb	%i7,	[%l7 + 0x48]
	fbl,a	%fcc0,	loop_817
loop_817:
	tne	%xcc,	0x5
	fbe,a	%fcc3,	loop_818
loop_818:
	ldsw	[%l7 + 0x0C],	%l2
	tge	%icc,	0x1
	nop
	setx loop_819, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_819:
	fones	%f8
	fbu,a	%fcc2,	loop_820
loop_820:
	brgz	%o2,	loop_821
loop_821:
	ta	%icc,	0x5
	fmovsg	%xcc,	%f2,	%f7
	ldx	[%l7 + 0x10],	%g2
	fcmpne32	%f0,	%f2,	%g7
	mulx	%o7,	%l5,	%l4
	fbge,a	%fcc0,	loop_822
loop_822:
	fbo	%fcc0,	loop_823
loop_823:
	st	%f15,	[%l7 + 0x2C]
	st	%f15,	[%l7 + 0x60]
	fbl,a	%fcc2,	loop_824
loop_824:
	fbug,a	%fcc2,	loop_825
loop_825:
	fba,a	%fcc3,	loop_826
loop_826:
	mulx	%o3,	%g6,	%l0
	popc	%g5,	%l1
	ldd	[%l7 + 0x60],	%f8
	stx	%o0,	[%l7 + 0x50]
	fmovsleu	%xcc,	%f0,	%f0
	fpsub32s	%f14,	%f1,	%f2
	ta	%xcc,	0x4
	bpos,pt	%xcc,	loop_827
loop_827:
	fcmpne16	%f12,	%f12,	%o5
	ldsb	[%l7 + 0x18],	%o6
	fbl,a	%fcc0,	loop_828
loop_828:
	fmul8ulx16	%f0,	%f0,	%f4
	call	loop_829
loop_829:
	brlz,a	%i3,	loop_830
loop_830:
	lduw	[%l7 + 0x68],	%g1
	bge,a,pn	%xcc,	loop_831
loop_831:
	be,pn	%icc,	loop_832
loop_832:
	bl	loop_833
loop_833:
	fbl	%fcc2,	loop_834
loop_834:
	stw	%i6,	[%l7 + 0x54]
	umulcc	%i0,	0x09A8,	%l3
	sth	%l6,	[%l7 + 0x78]
	movvs	%icc,	%i2,	%g4
	udiv	%i4,	0x14CC,	%o4
	fsrc1	%f14,	%f12
	fbe	%fcc1,	loop_835
loop_835:
	fbge	%fcc2,	loop_836
loop_836:
	movcs	%icc,	%g3,	%o1
	bvs	loop_837
loop_837:
	nop
	setx loop_838, %l0, %l1
	jmpl %l1, %i5
loop_838:
	bleu,a,pt	%xcc,	loop_839
loop_839:
	ba,a,pt	%xcc,	loop_840
loop_840:
	fmovse	%xcc,	%f7,	%f0
	bpos	loop_841
loop_841:
	fmovd	%f2,	%f4
	bvs,a,pn	%icc,	loop_842
loop_842:
	and	%i1,	0x042D,	%l2
	smul	%o2,	0x1993,	%g2
	edge16n	%i7,	%o7,	%g7
	fbul,a	%fcc1,	loop_843
loop_843:
	bne,pt	%icc,	loop_844
loop_844:
	ldd	[%l7 + 0x18],	%f12
	fmovse	%icc,	%f3,	%f2
	stb	%l4,	[%l7 + 0x55]
	fands	%f13,	%f3,	%f5
	fbo,a	%fcc1,	loop_845
loop_845:
	bl,a,pn	%xcc,	loop_846
loop_846:
	subc	%o3,	%l5,	%g6
	nop
	setx loop_847, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_847:
	xnor	%l0,	%g5,	%o0
	bcc,a,pt	%xcc,	loop_848
loop_848:
	brgz	%o5,	loop_849
loop_849:
	ble,a,pt	%icc,	loop_850
loop_850:
	bshuffle	%f14,	%f2,	%f14
	orn	%o6,	0x0F50,	%l1
	fmovrsne	%g1,	%f10,	%f2
	fbne	%fcc3,	loop_851
loop_851:
	bcs,a	loop_852
loop_852:
	fbo,a	%fcc1,	loop_853
loop_853:
	fpackfix	%f6,	%f10
	fmovs	%f0,	%f9
	be,pn	%icc,	loop_854
loop_854:
	st	%f4,	[%l7 + 0x78]
	fble	%fcc3,	loop_855
loop_855:
	bne,pt	%xcc,	loop_856
loop_856:
	bshuffle	%f4,	%f8,	%f0
	fble,a	%fcc2,	loop_857
loop_857:
	fbul	%fcc3,	loop_858
loop_858:
	lduw	[%l7 + 0x3C],	%i6
	ble,a,pn	%xcc,	loop_859
loop_859:
	fmul8ulx16	%f4,	%f10,	%f10
	sth	%i3,	[%l7 + 0x58]
	fxors	%f6,	%f5,	%f2
	bcc,a,pt	%xcc,	loop_860
loop_860:
	ba,a,pn	%xcc,	loop_861
loop_861:
	be	%icc,	loop_862
loop_862:
	fbg	%fcc3,	loop_863
loop_863:
	move	%icc,	%l3,	%i0
	subcc	%l6,	%g4,	%i4
	tsubcctv	%o4,	%g3,	%o1
	fbge	%fcc1,	loop_864
loop_864:
	array16	%i5,	%i2,	%l2
	fble,a	%fcc1,	loop_865
loop_865:
	fbne,a	%fcc3,	loop_866
loop_866:
	fble	%fcc1,	loop_867
loop_867:
	popc	0x05FE,	%o2
	bne	loop_868
loop_868:
	fmovrslz	%g2,	%f14,	%f7
	bvs	loop_869
loop_869:
	st	%f10,	[%l7 + 0x50]
	fmuld8ulx16	%f11,	%f11,	%f10
	tgu	%xcc,	0x2
	brgz,a	%i1,	loop_870
loop_870:
	bpos,a	loop_871
loop_871:
	lduh	[%l7 + 0x0C],	%o7
	fmovsg	%icc,	%f14,	%f2
	fmul8x16	%f15,	%f12,	%f4
	fnot1s	%f7,	%f6
	fmovsg	%icc,	%f2,	%f10
	fbo	%fcc2,	loop_872
loop_872:
	fba	%fcc1,	loop_873
loop_873:
	fmovsne	%xcc,	%f1,	%f6
	andncc	%g7,	%i7,	%l4
	bpos,a	%icc,	loop_874
loop_874:
	ble	%icc,	loop_875
loop_875:
	bge,a,pn	%icc,	loop_876
loop_876:
	be	loop_877
loop_877:
	fbne,a	%fcc0,	loop_878
loop_878:
	fba	%fcc1,	loop_879
loop_879:
	smulcc	%l5,	%g6,	%l0
	nop
	setx loop_880, %l0, %l1
	jmpl %l1, %o3
loop_880:
	fbg,a	%fcc3,	loop_881
loop_881:
	fbe	%fcc1,	loop_882
loop_882:
	fmovs	%f10,	%f13
	lduh	[%l7 + 0x14],	%o0
	bge,a	%xcc,	loop_883
loop_883:
	fbue,a	%fcc1,	loop_884
loop_884:
	fbg,a	%fcc1,	loop_885
loop_885:
	smulcc	%o5,	0x0A0F,	%o6
	alignaddr	%g5,	%l1,	%g1
	udiv	%i6,	0x1428,	%i3
	fpsub16s	%f13,	%f4,	%f13
	edge16ln	%i0,	%l3,	%g4
	be,a,pt	%icc,	loop_886
loop_886:
	nop
	setx loop_887, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_887:
	brlz	%l6,	loop_888
loop_888:
	fbl,a	%fcc2,	loop_889
loop_889:
	tpos	%xcc,	0x3
	fbne,a	%fcc2,	loop_890
loop_890:
	fpadd16s	%f5,	%f9,	%f1
	ldsb	[%l7 + 0x30],	%i4
	fbg,a	%fcc0,	loop_891
loop_891:
	tl	%icc,	0x2
	fmovrsgz	%o4,	%f6,	%f4
	movrgez	%o1,	%g3,	%i2
	bpos,pt	%icc,	loop_892
loop_892:
	edge8	%i5,	%l2,	%o2
	fbul,a	%fcc1,	loop_893
loop_893:
	brlz,a	%i1,	loop_894
loop_894:
	fbue	%fcc1,	loop_895
loop_895:
	ldd	[%l7 + 0x20],	%f14
	fnor	%f2,	%f12,	%f2
	fbu,a	%fcc2,	loop_896
loop_896:
	ble,a	%icc,	loop_897
loop_897:
	fmovrsgz	%o7,	%f8,	%f4
	fmovsn	%icc,	%f0,	%f1
	fors	%f11,	%f3,	%f8
	fpsub16	%f0,	%f4,	%f14
	fbge,a	%fcc2,	loop_898
loop_898:
	tn	%icc,	0x1
	andcc	%g7,	0x071D,	%g2
	fbu,a	%fcc2,	loop_899
loop_899:
	bleu,a,pn	%xcc,	loop_900
loop_900:
	fble	%fcc2,	loop_901
loop_901:
	fpadd32s	%f14,	%f8,	%f3
	fbue,a	%fcc3,	loop_902
loop_902:
	ble,pt	%icc,	loop_903
loop_903:
	stb	%l4,	[%l7 + 0x40]
	brlez	%i7,	loop_904
loop_904:
	fba	%fcc3,	loop_905
loop_905:
	fnands	%f11,	%f5,	%f4
	bcs,a,pt	%xcc,	loop_906
loop_906:
	ble	%xcc,	loop_907
loop_907:
	fbe,a	%fcc1,	loop_908
loop_908:
	sdivx	%l5,	0x1E21,	%g6
	brgez	%o3,	loop_909
loop_909:
	fbn,a	%fcc0,	loop_910
loop_910:
	tpos	%xcc,	0x3
	bn	loop_911
loop_911:
	andn	%o0,	0x1F07,	%o5
	fbn	%fcc0,	loop_912
loop_912:
	movcc	%xcc,	%l0,	%o6
	array32	%g5,	%l1,	%g1
	brlz	%i3,	loop_913
loop_913:
	fmovsa	%icc,	%f12,	%f8
	fbe	%fcc0,	loop_914
loop_914:
	ldsb	[%l7 + 0x5D],	%i0
	bpos,pt	%icc,	loop_915
loop_915:
	bpos,a	loop_916
loop_916:
	lduw	[%l7 + 0x50],	%i6
	fmovdcs	%xcc,	%f10,	%f8
	bg,a	%icc,	loop_917
loop_917:
	bleu	%xcc,	loop_918
loop_918:
	array32	%l3,	%g4,	%l6
	fnot1	%f14,	%f2
	fbu,a	%fcc0,	loop_919
loop_919:
	brnz,a	%i4,	loop_920
loop_920:
	fbug	%fcc1,	loop_921
loop_921:
	fbu,a	%fcc0,	loop_922
loop_922:
	tne	%xcc,	0x0
	std	%f0,	[%l7 + 0x58]
	st	%f12,	[%l7 + 0x70]
	fbo,a	%fcc0,	loop_923
loop_923:
	fpsub16s	%f15,	%f5,	%f7
	fbl	%fcc0,	loop_924
loop_924:
	fbge,a	%fcc1,	loop_925
loop_925:
	smulcc	%o1,	0x07A6,	%g3
	fmovrslez	%i2,	%f2,	%f12
	ldsh	[%l7 + 0x5A],	%o4
	fba	%fcc1,	loop_926
loop_926:
	movvs	%icc,	%l2,	%o2
	st	%f9,	[%l7 + 0x74]
	fbl	%fcc1,	loop_927
loop_927:
	brz	%i5,	loop_928
loop_928:
	fba	%fcc0,	loop_929
loop_929:
	movge	%xcc,	%i1,	%o7
	bl	%icc,	loop_930
loop_930:
	fbu,a	%fcc2,	loop_931
loop_931:
	udiv	%g7,	0x143F,	%l4
	udiv	%i7,	0x08F2,	%l5
	fbug	%fcc2,	loop_932
loop_932:
	ldsw	[%l7 + 0x7C],	%g2
	bcs,a,pt	%icc,	loop_933
loop_933:
	edge32ln	%g6,	%o3,	%o0
	st	%f3,	[%l7 + 0x50]
	sth	%o5,	[%l7 + 0x24]
	brgez,a	%l0,	loop_934
loop_934:
	fbne,a	%fcc2,	loop_935
loop_935:
	fandnot1	%f10,	%f4,	%f12
	fmovdne	%icc,	%f15,	%f15
	fblg,a	%fcc0,	loop_936
loop_936:
	brlez,a	%o6,	loop_937
loop_937:
	fble,a	%fcc1,	loop_938
loop_938:
	fxor	%f14,	%f4,	%f6
	bvs,pn	%xcc,	loop_939
loop_939:
	xor	%l1,	0x1FD0,	%g5
	ldsw	[%l7 + 0x40],	%i3
	bge,pt	%xcc,	loop_940
loop_940:
	alignaddrl	%i0,	%g1,	%i6
	fba,a	%fcc1,	loop_941
loop_941:
	fmovdge	%xcc,	%f13,	%f5
	nop
	setx loop_942, %l0, %l1
	jmpl %l1, %g4
loop_942:
	edge32	%l3,	%l6,	%o1
	bgu,a	%xcc,	loop_943
loop_943:
	fcmpne16	%f10,	%f0,	%g3
	edge16l	%i2,	%i4,	%l2
	fcmps	%fcc0,	%f6,	%f2
	fpack32	%f10,	%f0,	%f4
	fbug,a	%fcc0,	loop_944
loop_944:
	bge,pt	%xcc,	loop_945
loop_945:
	movrlz	%o4,	0x190,	%i5
	fbo	%fcc0,	loop_946
loop_946:
	fands	%f1,	%f15,	%f1
	mova	%icc,	%i1,	%o7
	ble,pt	%icc,	loop_947
loop_947:
	movrgz	%o2,	%l4,	%i7
	bn,a	%xcc,	loop_948
loop_948:
	lduw	[%l7 + 0x10],	%l5
	bgu,a	%xcc,	loop_949
loop_949:
	srl	%g7,	%g6,	%g2
	bge,a,pn	%xcc,	loop_950
loop_950:
	bgu,a	loop_951
loop_951:
	fmovsle	%icc,	%f15,	%f10
	std	%f0,	[%l7 + 0x50]
	bleu	%xcc,	loop_952
loop_952:
	brlz,a	%o0,	loop_953
loop_953:
	movge	%icc,	%o3,	%o5
	bne	loop_954
loop_954:
	lduw	[%l7 + 0x0C],	%o6
	fsrc2s	%f8,	%f8
	ble	%xcc,	loop_955
loop_955:
	fabss	%f0,	%f2
	bne,pn	%xcc,	loop_956
loop_956:
	fba	%fcc1,	loop_957
loop_957:
	tcc	%xcc,	0x3
	smul	%l0,	0x0A22,	%l1
	nop
	setx loop_958, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_958:
	brgez	%i3,	loop_959
loop_959:
	fmovdpos	%xcc,	%f11,	%f11
	ldd	[%l7 + 0x78],	%f6
	fabss	%f1,	%f15
	fxnors	%f0,	%f0,	%f1
	lduh	[%l7 + 0x10],	%g5
	bge,a,pt	%xcc,	loop_960
loop_960:
	brnz,a	%g1,	loop_961
loop_961:
	lduh	[%l7 + 0x46],	%i6
	call	loop_962
loop_962:
	bcc,a,pn	%xcc,	loop_963
loop_963:
	fcmpgt32	%f4,	%f8,	%i0
	fble,a	%fcc1,	loop_964
loop_964:
	fbg	%fcc2,	loop_965
loop_965:
	brlez	%g4,	loop_966
loop_966:
	movgu	%xcc,	%l6,	%l3
	bvc,a,pt	%icc,	loop_967
loop_967:
	bneg,a,pt	%xcc,	loop_968
loop_968:
	nop
	setx loop_969, %l0, %l1
	jmpl %l1, %g3
loop_969:
	movneg	%icc,	%o1,	%i4
	lduh	[%l7 + 0x2A],	%i2
	bne	loop_970
loop_970:
	fcmpgt16	%f0,	%f8,	%l2
	ba,pn	%xcc,	loop_971
loop_971:
	edge32n	%i5,	%o4,	%o7
	ldsw	[%l7 + 0x28],	%i1
	fbo,a	%fcc1,	loop_972
loop_972:
	bne,a,pt	%icc,	loop_973
loop_973:
	umulcc	%l4,	0x1753,	%i7
	tsubcc	%l5,	0x0DDA,	%o2
	fbug,a	%fcc1,	loop_974
loop_974:
	fbue	%fcc0,	loop_975
loop_975:
	fmovrdgez	%g7,	%f2,	%f6
	tsubcc	%g2,	%g6,	%o3
	sdivx	%o0,	0x011E,	%o5
	stx	%o6,	[%l7 + 0x08]
	be,pn	%icc,	loop_976
loop_976:
	ld	[%l7 + 0x14],	%f2
	bcs,a,pt	%icc,	loop_977
loop_977:
	bn,a	%xcc,	loop_978
loop_978:
	alignaddrl	%l1,	%l0,	%g5
	taddcc	%i3,	%i6,	%g1
	srlx	%g4,	%l6,	%i0
	fbg	%fcc2,	loop_979
loop_979:
	ldx	[%l7 + 0x28],	%g3
	stw	%o1,	[%l7 + 0x60]
	bneg,a,pt	%xcc,	loop_980
loop_980:
	fnand	%f6,	%f6,	%f10
	fba	%fcc1,	loop_981
loop_981:
	bg,pt	%xcc,	loop_982
loop_982:
	fbule,a	%fcc3,	loop_983
loop_983:
	bl	loop_984
loop_984:
	fblg	%fcc1,	loop_985
loop_985:
	ble,a	%xcc,	loop_986
loop_986:
	brlz,a	%l3,	loop_987
loop_987:
	ld	[%l7 + 0x50],	%f6
	bvc,a,pt	%icc,	loop_988
loop_988:
	array8	%i2,	%i4,	%i5
	fba	%fcc1,	loop_989
loop_989:
	addccc	%o4,	%l2,	%i1
	ba,a,pt	%xcc,	loop_990
loop_990:
	stw	%o7,	[%l7 + 0x14]
	bpos,a,pn	%icc,	loop_991
loop_991:
	add	%l4,	0x0F44,	%l5
	fbne,a	%fcc1,	loop_992
loop_992:
	bneg,a	loop_993
loop_993:
	tleu	%xcc,	0x0
	lduw	[%l7 + 0x24],	%o2
	bpos,pt	%icc,	loop_994
loop_994:
	ba,pt	%icc,	loop_995
loop_995:
	sdivx	%i7,	0x173E,	%g7
	ldd	[%l7 + 0x50],	%f10
	fmovsn	%xcc,	%f6,	%f9
	fbne	%fcc2,	loop_996
loop_996:
	movneg	%icc,	%g6,	%g2
	fbu	%fcc3,	loop_997
loop_997:
	sdiv	%o3,	0x033C,	%o0
	ldsb	[%l7 + 0x5C],	%o6
	ldd	[%l7 + 0x28],	%f0
	fbl,a	%fcc2,	loop_998
loop_998:
	stb	%l1,	[%l7 + 0x5C]
	bg,a,pt	%xcc,	loop_999
loop_999:
	bleu,a,pt	%icc,	loop_1000
loop_1000:
	and	%l0,	0x1F80,	%o5
	mova	%icc,	%g5,	%i6
	fbne	%fcc0,	loop_1001
loop_1001:
	nop
	setx loop_1002, %l0, %l1
	jmpl %l1, %g1
loop_1002:
	edge8l	%i3,	%g4,	%i0
	fbl	%fcc0,	loop_1003
loop_1003:
	fpadd16	%f0,	%f6,	%f10
	ldsb	[%l7 + 0x10],	%l6
	brlz	%o1,	loop_1004
loop_1004:
	fbge	%fcc3,	loop_1005
loop_1005:
	ld	[%l7 + 0x6C],	%f9
	fcmpeq16	%f14,	%f6,	%g3
	brgez,a	%l3,	loop_1006
loop_1006:
	movrlez	%i2,	0x11B,	%i4
	tleu	%icc,	0x4
	fxnors	%f10,	%f8,	%f0
	fmovrslez	%o4,	%f2,	%f6
	nop
	setx loop_1007, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1007:
	call	loop_1008
loop_1008:
	nop
	setx loop_1009, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1009:
	bvs,a	loop_1010
loop_1010:
	fbge	%fcc3,	loop_1011
loop_1011:
	fands	%f12,	%f7,	%f7
	fbn	%fcc0,	loop_1012
loop_1012:
	bneg,a	%xcc,	loop_1013
loop_1013:
	bl,a	%icc,	loop_1014
loop_1014:
	fmovdvc	%xcc,	%f11,	%f3
	movrne	%l2,	%i5,	%i1
	bneg,a,pt	%xcc,	loop_1015
loop_1015:
	array32	%o7,	%l4,	%l5
	xnorcc	%i7,	0x17E3,	%o2
	movgu	%xcc,	%g7,	%g6
	xor	%o3,	0x0B3F,	%g2
	nop
	setx loop_1016, %l0, %l1
	jmpl %l1, %o6
loop_1016:
	stw	%o0,	[%l7 + 0x50]
	nop
	setx loop_1017, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1017:
	ldsw	[%l7 + 0x5C],	%l0
	edge8ln	%o5,	%l1,	%i6
	srl	%g1,	0x15,	%i3
	bl,a,pt	%xcc,	loop_1018
loop_1018:
	bg,a	%icc,	loop_1019
loop_1019:
	fornot1	%f8,	%f10,	%f12
	fpadd16	%f4,	%f0,	%f2
	nop
	setx loop_1020, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1020:
	fbne,a	%fcc0,	loop_1021
loop_1021:
	nop
	setx loop_1022, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1022:
	alignaddr	%g4,	%i0,	%l6
	bl,a	%icc,	loop_1023
loop_1023:
	sll	%g5,	0x1F,	%o1
	bpos	loop_1024
loop_1024:
	fabss	%f10,	%f2
	fmovdvs	%icc,	%f12,	%f15
	brgez,a	%l3,	loop_1025
loop_1025:
	bge	%xcc,	loop_1026
loop_1026:
	fmovsle	%xcc,	%f2,	%f2
	fbne	%fcc3,	loop_1027
loop_1027:
	ldsw	[%l7 + 0x14],	%g3
	tge	%xcc,	0x3
	fbug	%fcc2,	loop_1028
loop_1028:
	bneg,a,pt	%icc,	loop_1029
loop_1029:
	bvc,a,pt	%icc,	loop_1030
loop_1030:
	bleu,pn	%icc,	loop_1031
loop_1031:
	taddcc	%i2,	0x1654,	%i4
	fblg,a	%fcc1,	loop_1032
loop_1032:
	fbue	%fcc2,	loop_1033
loop_1033:
	fmovsn	%icc,	%f8,	%f10
	fbu	%fcc3,	loop_1034
loop_1034:
	ldx	[%l7 + 0x60],	%o4
	nop
	setx loop_1035, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1035:
	bne	%icc,	loop_1036
loop_1036:
	fbn	%fcc1,	loop_1037
loop_1037:
	bvc,a	%xcc,	loop_1038
loop_1038:
	sethi	0x1469,	%i5
	ble,a,pt	%icc,	loop_1039
loop_1039:
	be	%icc,	loop_1040
loop_1040:
	fxors	%f3,	%f11,	%f2
	bvs	loop_1041
loop_1041:
	brgz	%l2,	loop_1042
loop_1042:
	fbne,a	%fcc3,	loop_1043
loop_1043:
	fbn,a	%fcc1,	loop_1044
loop_1044:
	lduw	[%l7 + 0x7C],	%o7
	fbul	%fcc3,	loop_1045
loop_1045:
	fmovdge	%xcc,	%f1,	%f7
	bl,pt	%xcc,	loop_1046
loop_1046:
	fbge,a	%fcc3,	loop_1047
loop_1047:
	fbug,a	%fcc2,	loop_1048
loop_1048:
	umulcc	%l4,	0x010B,	%i1
	bvs,a	loop_1049
loop_1049:
	stb	%i7,	[%l7 + 0x6C]
	fcmpne16	%f14,	%f2,	%l5
	fbul,a	%fcc3,	loop_1050
loop_1050:
	brz,a	%o2,	loop_1051
loop_1051:
	edge8	%g6,	%o3,	%g2
	bl,a,pt	%icc,	loop_1052
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
	fmovsvs	%xcc,	%f11,	%f12
	popc	0x0F92,	%g7
	be	%icc,	loop_1054
loop_1054:
	movvs	%xcc,	%o6,	%o0
	umulcc	%l0,	0x1009,	%l1
	brz	%o5,	loop_1055
loop_1055:
	fbge,a	%fcc1,	loop_1056
loop_1056:
	fbe,a	%fcc1,	loop_1057
loop_1057:
	fmul8ulx16	%f8,	%f2,	%f2
	fmovscc	%xcc,	%f7,	%f3
	ldsh	[%l7 + 0x6C],	%g1
	fbg,a	%fcc1,	loop_1058
loop_1058:
	ldd	[%l7 + 0x68],	%f6
	bvc,a	%xcc,	loop_1059
loop_1059:
	fbuge	%fcc1,	loop_1060
loop_1060:
	fabss	%f5,	%f1
	movgu	%xcc,	%i6,	%i3
	call	loop_1061
loop_1061:
	fbo	%fcc1,	loop_1062
loop_1062:
	addc	%g4,	%i0,	%l6
	fpsub32	%f6,	%f6,	%f8
	fblg,a	%fcc3,	loop_1063
loop_1063:
	sth	%o1,	[%l7 + 0x14]
	fba	%fcc3,	loop_1064
loop_1064:
	fbul,a	%fcc1,	loop_1065
loop_1065:
	movrgz	%g5,	%g3,	%l3
	stw	%i2,	[%l7 + 0x68]
	srax	%i4,	%i5,	%o4
	bpos,a	%xcc,	loop_1066
loop_1066:
	fbne	%fcc3,	loop_1067
loop_1067:
	fblg,a	%fcc1,	loop_1068
loop_1068:
	brgz	%o7,	loop_1069
loop_1069:
	sdiv	%l2,	0x1CEF,	%l4
	ta	%icc,	0x0
	fbe,a	%fcc0,	loop_1070
loop_1070:
	bl,a,pn	%icc,	loop_1071
loop_1071:
	fmovscs	%xcc,	%f3,	%f14
	bge	%xcc,	loop_1072
loop_1072:
	fbug	%fcc0,	loop_1073
loop_1073:
	sdivcc	%i1,	0x0F9B,	%l5
	fbuge	%fcc0,	loop_1074
loop_1074:
	fmovsvc	%xcc,	%f11,	%f9
	fbe	%fcc3,	loop_1075
loop_1075:
	fabss	%f2,	%f4
	movneg	%icc,	%o2,	%i7
	fcmpes	%fcc3,	%f6,	%f0
	bne	loop_1076
loop_1076:
	umulcc	%g6,	0x113B,	%o3
	fbl	%fcc1,	loop_1077
loop_1077:
	fbo	%fcc0,	loop_1078
loop_1078:
	movleu	%xcc,	%g2,	%g7
	bgu	loop_1079
loop_1079:
	fblg	%fcc3,	loop_1080
loop_1080:
	ldx	[%l7 + 0x18],	%o0
	brlez,a	%l0,	loop_1081
loop_1081:
	bneg	%xcc,	loop_1082
loop_1082:
	fbule	%fcc1,	loop_1083
loop_1083:
	xorcc	%l1,	0x0418,	%o6
	std	%f10,	[%l7 + 0x70]
	tge	%icc,	0x7
	nop
	setx loop_1084, %l0, %l1
	jmpl %l1, %o5
loop_1084:
	fmul8x16	%f12,	%f4,	%f6
	fmovde	%icc,	%f2,	%f13
	fbn	%fcc1,	loop_1085
loop_1085:
	ldsh	[%l7 + 0x2A],	%i6
	fbo,a	%fcc1,	loop_1086
loop_1086:
	bgu,a	%icc,	loop_1087
loop_1087:
	bvs,a	loop_1088
loop_1088:
	fbu,a	%fcc0,	loop_1089
loop_1089:
	orn	%i3,	%g1,	%g4
	ld	[%l7 + 0x78],	%f1
	orn	%l6,	0x1507,	%o1
	fblg,a	%fcc1,	loop_1090
loop_1090:
	bgu,pn	%icc,	loop_1091
loop_1091:
	sllx	%i0,	0x0F,	%g3
	ldx	[%l7 + 0x20],	%l3
	ta	%icc,	0x5
	ble	loop_1092
loop_1092:
	fbg	%fcc3,	loop_1093
loop_1093:
	fbl	%fcc1,	loop_1094
loop_1094:
	fbue,a	%fcc3,	loop_1095
loop_1095:
	bvc	loop_1096
loop_1096:
	fmovrdlz	%g5,	%f4,	%f8
	nop
	setx loop_1097, %l0, %l1
	jmpl %l1, %i2
loop_1097:
	fpsub32s	%f4,	%f0,	%f4
	fabsd	%f2,	%f0
	bneg,pt	%icc,	loop_1098
loop_1098:
	fblg,a	%fcc2,	loop_1099
loop_1099:
	ba,a	loop_1100
loop_1100:
	fexpand	%f7,	%f8
	sth	%i5,	[%l7 + 0x7C]
	ldx	[%l7 + 0x18],	%i4
	fone	%f6
	bcc,a	%icc,	loop_1101
loop_1101:
	tn	%icc,	0x3
	sdivcc	%o7,	0x0995,	%o4
	fbue,a	%fcc1,	loop_1102
loop_1102:
	stx	%l2,	[%l7 + 0x18]
	bn,pt	%icc,	loop_1103
loop_1103:
	fmovse	%icc,	%f6,	%f11
	nop
	setx loop_1104, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1104:
	fcmps	%fcc3,	%f13,	%f4
	fmul8sux16	%f6,	%f12,	%f0
	fbul	%fcc3,	loop_1105
loop_1105:
	ldsh	[%l7 + 0x42],	%l4
	fbg,a	%fcc1,	loop_1106
loop_1106:
	fbuge	%fcc1,	loop_1107
loop_1107:
	taddcc	%i1,	%l5,	%i7
	bgu,a	%icc,	loop_1108
loop_1108:
	ldd	[%l7 + 0x48],	%f14
	fbn	%fcc1,	loop_1109
loop_1109:
	ldd	[%l7 + 0x60],	%f12
	ldsh	[%l7 + 0x14],	%o2
	brgz,a	%g6,	loop_1110
loop_1110:
	stw	%g2,	[%l7 + 0x40]
	fba,a	%fcc3,	loop_1111
loop_1111:
	bge,a,pn	%icc,	loop_1112
loop_1112:
	brz	%o3,	loop_1113
loop_1113:
	fmovrde	%o0,	%f8,	%f0
	tn	%xcc,	0x2
	fbo	%fcc1,	loop_1114
loop_1114:
	ldsb	[%l7 + 0x5E],	%l0
	fmovdl	%icc,	%f9,	%f15
	tl	%icc,	0x2
	tneg	%icc,	0x3
	movvs	%xcc,	%l1,	%g7
	bcc	loop_1115
loop_1115:
	fxnors	%f10,	%f11,	%f8
	bvc,a,pt	%xcc,	loop_1116
loop_1116:
	bvc,a,pn	%xcc,	loop_1117
loop_1117:
	fmovrse	%o5,	%f1,	%f9
	fbug	%fcc2,	loop_1118
loop_1118:
	xor	%o6,	%i3,	%i6
	std	%f14,	[%l7 + 0x78]
	fbn	%fcc1,	loop_1119
loop_1119:
	fbu	%fcc1,	loop_1120
loop_1120:
	fnegs	%f14,	%f1
	fmovrslz	%g1,	%f11,	%f0
	ble,a,pt	%xcc,	loop_1121
loop_1121:
	fbul	%fcc2,	loop_1122
loop_1122:
	ldsh	[%l7 + 0x34],	%g4
	movl	%xcc,	%o1,	%i0
	ldd	[%l7 + 0x48],	%f6
	bvs	%xcc,	loop_1123
loop_1123:
	nop
	setx loop_1124, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1124:
	bne,a,pn	%xcc,	loop_1125
loop_1125:
	fmovdneg	%icc,	%f2,	%f13
	movrne	%g3,	0x274,	%l3
	st	%f8,	[%l7 + 0x20]
	fxnors	%f0,	%f4,	%f15
	fnor	%f14,	%f0,	%f10
	lduw	[%l7 + 0x38],	%g5
	andncc	%i2,	%i5,	%i4
	fands	%f15,	%f15,	%f0
	fblg,a	%fcc1,	loop_1126
loop_1126:
	ba,pn	%icc,	loop_1127
loop_1127:
	fbl	%fcc0,	loop_1128
loop_1128:
	fbuge,a	%fcc3,	loop_1129
loop_1129:
	fmovse	%icc,	%f6,	%f2
	brlez	%l6,	loop_1130
loop_1130:
	fmovsgu	%icc,	%f11,	%f1
	bleu	loop_1131
loop_1131:
	tpos	%xcc,	0x0
	brgz	%o7,	loop_1132
loop_1132:
	fbne,a	%fcc0,	loop_1133
loop_1133:
	call	loop_1134
loop_1134:
	movvc	%xcc,	%l2,	%o4
	fbul	%fcc3,	loop_1135
loop_1135:
	bcs,a,pn	%icc,	loop_1136
loop_1136:
	fbue	%fcc2,	loop_1137
loop_1137:
	bvc	%icc,	loop_1138
loop_1138:
	brgz,a	%i1,	loop_1139
loop_1139:
	subccc	%l4,	0x193A,	%l5
	brgz	%i7,	loop_1140
loop_1140:
	fbne,a	%fcc1,	loop_1141
loop_1141:
	fbug,a	%fcc1,	loop_1142
loop_1142:
	fpack16	%f10,	%f14
	for	%f2,	%f8,	%f8
	bge,a	%xcc,	loop_1143
loop_1143:
	stx	%o2,	[%l7 + 0x08]
	sdivcc	%g6,	0x0D79,	%o3
	bleu,a,pn	%xcc,	loop_1144
loop_1144:
	orncc	%o0,	0x1138,	%l0
	movne	%xcc,	%l1,	%g7
	smul	%o5,	%o6,	%i3
	ble	%icc,	loop_1145
loop_1145:
	bg,a,pn	%icc,	loop_1146
loop_1146:
	fexpand	%f11,	%f2
	ba,a,pt	%xcc,	loop_1147
loop_1147:
	fbne,a	%fcc3,	loop_1148
loop_1148:
	brnz,a	%g2,	loop_1149
loop_1149:
	brnz,a	%i6,	loop_1150
loop_1150:
	bcc	%icc,	loop_1151
loop_1151:
	fpack32	%f0,	%f14,	%f6
	sth	%g4,	[%l7 + 0x32]
	stx	%g1,	[%l7 + 0x30]
	bpos,a,pn	%icc,	loop_1152
loop_1152:
	fpsub32	%f6,	%f14,	%f4
	ldsb	[%l7 + 0x42],	%o1
	brnz	%g3,	loop_1153
loop_1153:
	ldsh	[%l7 + 0x16],	%l3
	fxnors	%f2,	%f7,	%f9
	ldsh	[%l7 + 0x50],	%i0
	fmovrdgez	%g5,	%f6,	%f12
	fble,a	%fcc2,	loop_1154
loop_1154:
	fbuge,a	%fcc0,	loop_1155
loop_1155:
	fpackfix	%f2,	%f10
	fcmpne16	%f14,	%f0,	%i5
	fpackfix	%f14,	%f2
	lduh	[%l7 + 0x36],	%i2
	fmovscs	%xcc,	%f4,	%f15
	tneg	%xcc,	0x2
	fmovrdgez	%i4,	%f2,	%f2
	tvs	%icc,	0x6
	ble,a	%icc,	loop_1156
loop_1156:
	lduh	[%l7 + 0x16],	%o7
	bshuffle	%f8,	%f12,	%f12
	srlx	%l2,	0x13,	%l6
	fbg	%fcc0,	loop_1157
loop_1157:
	fbe	%fcc0,	loop_1158
loop_1158:
	fbl	%fcc3,	loop_1159
loop_1159:
	fcmpgt16	%f14,	%f12,	%i1
	fmovscs	%icc,	%f6,	%f3
	andn	%l4,	0x09DB,	%o4
	bcs,a,pt	%xcc,	loop_1160
loop_1160:
	brlez,a	%i7,	loop_1161
loop_1161:
	movne	%xcc,	%l5,	%o2
	bpos,pn	%xcc,	loop_1162
loop_1162:
	ldd	[%l7 + 0x60],	%f12
	fbuge	%fcc1,	loop_1163
loop_1163:
	fpack16	%f4,	%f1
	fbn,a	%fcc3,	loop_1164
loop_1164:
	st	%f3,	[%l7 + 0x5C]
	fmovdleu	%xcc,	%f8,	%f1
	bvs,a,pn	%icc,	loop_1165
loop_1165:
	ldsw	[%l7 + 0x08],	%g6
	brgez,a	%o0,	loop_1166
loop_1166:
	taddcc	%o3,	%l0,	%l1
	ldsw	[%l7 + 0x08],	%g7
	bvs,a,pn	%icc,	loop_1167
loop_1167:
	fcmped	%fcc1,	%f8,	%f6
	fcmpgt32	%f8,	%f0,	%o5
	ldx	[%l7 + 0x30],	%i3
	fbu,a	%fcc2,	loop_1168
loop_1168:
	srl	%o6,	0x1B,	%g2
	fcmpd	%fcc3,	%f4,	%f12
	fornot1	%f10,	%f12,	%f8
	srlx	%i6,	%g1,	%o1
	fbg	%fcc0,	loop_1169
loop_1169:
	fbu,a	%fcc3,	loop_1170
loop_1170:
	st	%f9,	[%l7 + 0x68]
	fmul8sux16	%f10,	%f10,	%f0
	fbue,a	%fcc1,	loop_1171
loop_1171:
	st	%f7,	[%l7 + 0x18]
	brz	%g4,	loop_1172
loop_1172:
	fandnot1	%f10,	%f12,	%f8
	bge,a,pn	%icc,	loop_1173
loop_1173:
	edge32l	%l3,	%g3,	%g5
	call	loop_1174
loop_1174:
	fmovdgu	%xcc,	%f8,	%f1
	ldd	[%l7 + 0x30],	%f6
	bl,a,pt	%icc,	loop_1175
loop_1175:
	sra	%i0,	0x0E,	%i5
	fmovdne	%icc,	%f13,	%f9
	fbuge	%fcc1,	loop_1176
loop_1176:
	ba,pt	%icc,	loop_1177
loop_1177:
	bcc	%icc,	loop_1178
loop_1178:
	for	%f4,	%f12,	%f12
	fmovsneg	%icc,	%f1,	%f15
	bne,a	%icc,	loop_1179
loop_1179:
	ldsw	[%l7 + 0x60],	%i2
	bge,a	%xcc,	loop_1180
loop_1180:
	ble,a,pn	%xcc,	loop_1181
loop_1181:
	fmovsge	%icc,	%f5,	%f13
	bpos,a	loop_1182
loop_1182:
	fba,a	%fcc0,	loop_1183
loop_1183:
	brgz,a	%o7,	loop_1184
loop_1184:
	brgz	%l2,	loop_1185
loop_1185:
	sdiv	%l6,	0x14DD,	%i4
	movcs	%xcc,	%l4,	%o4
	bn,pn	%xcc,	loop_1186
loop_1186:
	fpadd32	%f4,	%f0,	%f4
	call	loop_1187
loop_1187:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type f   	: 188
!	Type i   	: 187
!	Type cti   	: 500
!	Type l   	: 125
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
main_t5:

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x1,	%g2
	set	0x9,	%g3
	set	0x5,	%g4
	set	0x8,	%g5
	set	0x8,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x5,	%i1
	set	-0x9,	%i2
	set	-0x0,	%i3
	set	-0xE,	%i4
	set	-0x9,	%i5
	set	-0xC,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x19044775,	%l0
	set	0x60264F0A,	%l1
	set	0x315A96D4,	%l2
	set	0x31F1D38C,	%l3
	set	0x41454F13,	%l4
	set	0x734B9A9B,	%l5
	set	0x084DA71B,	%l6
	!# Output registers
	set	-0x036C,	%o0
	set	0x01F3,	%o1
	set	-0x0C61,	%o2
	set	0x1C71,	%o3
	set	-0x0F96,	%o4
	set	-0x17D4,	%o5
	set	-0x0FAC,	%o6
	set	0x0752,	%o7

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

	brgez,a	%i1,	loop_1188
loop_1188:
	ldsw	[%l7 + 0x18],	%l5
	sub	%o2,	%g6,	%i7
	movvs	%icc,	%o0,	%l0
	sdiv	%o3,	0x051B,	%g7
	bleu	%xcc,	loop_1189
loop_1189:
	addcc	%l1,	%i3,	%o6
	ldsb	[%l7 + 0x59],	%g2
	array32	%o5,	%i6,	%o1
	st	%f4,	[%l7 + 0x34]
	orcc	%g4,	0x1231,	%l3
	for	%f14,	%f0,	%f8
	smul	%g1,	0x1E30,	%g5
	edge32ln	%i0,	%g3,	%i5
	movrgez	%o7,	0x3B0,	%i2
	tge	%icc,	0x2
	fmovrdgez	%l2,	%f2,	%f8
	array16	%i4,	%l4,	%l6
	fcmpgt16	%f6,	%f6,	%i1
	add	%l5,	%o4,	%g6
	siam	0x6
	popc	%o2,	%o0
	fpadd32	%f2,	%f2,	%f8
	addc	%i7,	0x1B0A,	%l0
	mulscc	%o3,	%g7,	%l1
	movleu	%icc,	%o6,	%g2
	movvc	%icc,	%o5,	%i3
	be,a	loop_1190
loop_1190:
	nop
	setx loop_1191, %l0, %l1
	jmpl %l1, %o1
loop_1191:
	fsrc2s	%f9,	%f0
	sethi	0x18A0,	%i6
	fbug	%fcc3,	loop_1192
loop_1192:
	movrlez	%l3,	0x124,	%g1
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
	st	%f10,	[%l7 + 0x54]
	edge16	%g5,	%g4,	%i0
	fbne,a	%fcc3,	loop_1194
loop_1194:
	stb	%g3,	[%l7 + 0x34]
	ldx	[%l7 + 0x48],	%o7
	fzero	%f12
	fand	%f2,	%f4,	%f4
	or	%i5,	%i2,	%i4
	fbul	%fcc2,	loop_1195
loop_1195:
	edge8	%l4,	%l6,	%i1
	bn,a,pn	%xcc,	loop_1196
loop_1196:
	fcmpne32	%f4,	%f10,	%l5
	tcc	%xcc,	0x5
	movcc	%xcc,	%o4,	%l2
	stw	%g6,	[%l7 + 0x7C]
	fmovrsne	%o2,	%f14,	%f10
	stb	%o0,	[%l7 + 0x39]
	ldd	[%l7 + 0x68],	%f12
	movleu	%xcc,	%l0,	%i7
	fmovde	%xcc,	%f8,	%f4
	fpack16	%f4,	%f8
	lduh	[%l7 + 0x50],	%g7
	st	%f12,	[%l7 + 0x68]
	fmovrdgez	%o3,	%f6,	%f10
	movge	%icc,	%o6,	%l1
	srax	%g2,	%o5,	%i3
	bneg,a	%icc,	loop_1197
loop_1197:
	orcc	%o1,	%i6,	%l3
	smulcc	%g1,	%g4,	%g5
	movn	%xcc,	%i0,	%o7
	array16	%g3,	%i2,	%i5
	fbl,a	%fcc2,	loop_1198
loop_1198:
	add	%i4,	%l4,	%l6
	subccc	%l5,	%o4,	%l2
	bpos,pn	%icc,	loop_1199
loop_1199:
	fmovdle	%xcc,	%f6,	%f8
	ldsb	[%l7 + 0x31],	%g6
	taddcctv	%o2,	%o0,	%i1
	sth	%l0,	[%l7 + 0x12]
	smulcc	%g7,	0x12B9,	%i7
	fnegd	%f6,	%f0
	bne	loop_1200
loop_1200:
	ldub	[%l7 + 0x59],	%o3
	movcc	%xcc,	%l1,	%g2
	umulcc	%o5,	0x0679,	%i3
	tvs	%icc,	0x5
	subccc	%o1,	0x1F0C,	%i6
	ldsh	[%l7 + 0x1E],	%o6
	ld	[%l7 + 0x0C],	%f8
	array8	%g1,	%l3,	%g5
	tle	%xcc,	0x6
	movneg	%icc,	%g4,	%i0
	movvc	%icc,	%o7,	%i2
	fcmpne32	%f8,	%f12,	%i5
	fpmerge	%f8,	%f8,	%f2
	edge32ln	%i4,	%l4,	%l6
	udivx	%l5,	0x1A69,	%o4
	movrlz	%g3,	0x14A,	%l2
	siam	0x6
	udivx	%o2,	0x1C78,	%o0
	tneg	%icc,	0x0
	fcmps	%fcc1,	%f4,	%f15
	srax	%i1,	%l0,	%g7
	movgu	%xcc,	%g6,	%i7
	move	%icc,	%o3,	%g2
	fpadd32s	%f10,	%f2,	%f2
	fmovsneg	%xcc,	%f12,	%f14
	edge16	%l1,	%i3,	%o1
	udivx	%o5,	0x0DEA,	%i6
	add	%g1,	%o6,	%g5
	movrlez	%g4,	0x2D0,	%l3
	movpos	%icc,	%i0,	%o7
	fcmple32	%f0,	%f4,	%i2
	sllx	%i5,	0x08,	%l4
	add	%i4,	0x01F2,	%l5
	movrgez	%o4,	0x13E,	%g3
	fmovs	%f2,	%f15
	fmul8x16	%f14,	%f12,	%f10
	bvs,a,pn	%xcc,	loop_1201
loop_1201:
	umul	%l2,	0x1C38,	%l6
	sdiv	%o2,	0x0DAB,	%o0
	sra	%l0,	0x15,	%g7
	lduw	[%l7 + 0x38],	%i1
	edge8	%g6,	%i7,	%g2
	ldsh	[%l7 + 0x60],	%o3
	stb	%l1,	[%l7 + 0x6A]
	edge16	%o1,	%i3,	%i6
	srax	%g1,	0x0A,	%o5
	brlez	%g5,	loop_1202
loop_1202:
	tne	%xcc,	0x6
	tn	%icc,	0x3
	stx	%o6,	[%l7 + 0x30]
	movrne	%l3,	0x29B,	%g4
	fabsd	%f14,	%f12
	ld	[%l7 + 0x5C],	%f7
	umulcc	%o7,	%i2,	%i0
	lduw	[%l7 + 0x50],	%i5
	movre	%i4,	%l5,	%l4
	edge16ln	%o4,	%l2,	%l6
	tcc	%xcc,	0x1
	orn	%g3,	%o2,	%o0
	fbne,a	%fcc1,	loop_1203
loop_1203:
	bcs	loop_1204
loop_1204:
	fmovsge	%icc,	%f9,	%f14
	st	%f0,	[%l7 + 0x5C]
	stb	%l0,	[%l7 + 0x31]
	fxnor	%f2,	%f4,	%f0
	movre	%i1,	%g6,	%g7
	movpos	%xcc,	%g2,	%o3
	xor	%i7,	%o1,	%i3
	ldsh	[%l7 + 0x4C],	%l1
	fmovscs	%xcc,	%f0,	%f14
	mulx	%g1,	%i6,	%o5
	orncc	%o6,	0x03A5,	%g5
	lduw	[%l7 + 0x74],	%g4
	tne	%icc,	0x2
	tsubcc	%o7,	0x13FF,	%i2
	ldsb	[%l7 + 0x2F],	%l3
	faligndata	%f4,	%f2,	%f10
	umulcc	%i5,	%i4,	%l5
	addc	%i0,	0x0EA6,	%o4
	fcmpne32	%f4,	%f4,	%l2
	be,a,pt	%xcc,	loop_1205
loop_1205:
	udivcc	%l4,	0x1F24,	%l6
	movvs	%xcc,	%g3,	%o0
	addccc	%o2,	%i1,	%g6
	edge8n	%l0,	%g7,	%o3
	sra	%g2,	%o1,	%i7
	ldub	[%l7 + 0x52],	%l1
	umulcc	%i3,	%i6,	%o5
	bvs,a	%icc,	loop_1206
loop_1206:
	tneg	%xcc,	0x4
	mova	%xcc,	%o6,	%g1
	movleu	%xcc,	%g4,	%o7
	tsubcc	%i2,	0x110D,	%l3
	ldx	[%l7 + 0x50],	%g5
	movrgz	%i5,	%l5,	%i4
	andn	%i0,	0x0172,	%o4
	fbu,a	%fcc1,	loop_1207
loop_1207:
	stb	%l4,	[%l7 + 0x42]
	ldd	[%l7 + 0x58],	%f6
	andncc	%l6,	%l2,	%g3
	andcc	%o2,	0x145D,	%i1
	fmovscc	%xcc,	%f14,	%f1
	stx	%o0,	[%l7 + 0x48]
	movl	%icc,	%l0,	%g6
	brnz,a	%g7,	loop_1208
loop_1208:
	ldsw	[%l7 + 0x2C],	%o3
	fzeros	%f2
	ld	[%l7 + 0x24],	%f2
	edge16	%g2,	%o1,	%i7
	fands	%f6,	%f3,	%f3
	mulscc	%i3,	0x18C2,	%i6
	tsubcc	%l1,	0x1033,	%o6
	udivx	%g1,	0x1AE6,	%o5
	brlez,a	%o7,	loop_1209
loop_1209:
	udivcc	%i2,	0x18A1,	%g4
	subcc	%g5,	0x189A,	%i5
	tpos	%xcc,	0x3
	fzeros	%f9
	edge16n	%l5,	%l3,	%i4
	or	%i0,	0x02C3,	%o4
	tcs	%xcc,	0x1
	lduh	[%l7 + 0x0E],	%l4
	tsubcc	%l6,	%l2,	%o2
	sdivcc	%g3,	0x1E98,	%i1
	edge8n	%o0,	%g6,	%l0
	taddcc	%o3,	0x1E3F,	%g2
	tleu	%icc,	0x4
	or	%o1,	0x1715,	%g7
	add	%i3,	0x1796,	%i6
	edge16n	%l1,	%o6,	%i7
	mulx	%g1,	0x1972,	%o5
	fbn,a	%fcc3,	loop_1210
loop_1210:
	andn	%i2,	0x1067,	%g4
	fnot2s	%f14,	%f12
	fbule,a	%fcc0,	loop_1211
loop_1211:
	sethi	0x0B72,	%g5
	ble,a,pn	%icc,	loop_1212
loop_1212:
	be,a,pn	%xcc,	loop_1213
loop_1213:
	udivcc	%o7,	0x0578,	%i5
	movneg	%xcc,	%l3,	%i4
	array8	%l5,	%i0,	%o4
	fpadd32s	%f4,	%f5,	%f2
	addcc	%l4,	%l6,	%l2
	movvs	%icc,	%g3,	%o2
	fmovda	%icc,	%f5,	%f9
	tcs	%xcc,	0x3
	udiv	%o0,	0x06B3,	%i1
	tgu	%xcc,	0x7
	srl	%g6,	0x0B,	%o3
	fbug	%fcc3,	loop_1214
loop_1214:
	tl	%icc,	0x7
	fmovsvc	%xcc,	%f8,	%f12
	st	%f13,	[%l7 + 0x5C]
	tneg	%icc,	0x5
	udivx	%l0,	0x1909,	%g2
	fmovsneg	%icc,	%f12,	%f0
	fmovdpos	%icc,	%f15,	%f6
	sra	%g7,	%o1,	%i6
	addccc	%l1,	0x0D9A,	%i3
	stx	%i7,	[%l7 + 0x78]
	or	%g1,	0x11C9,	%o5
	tneg	%xcc,	0x7
	fba,a	%fcc0,	loop_1215
loop_1215:
	movcc	%xcc,	%i2,	%g4
	fcmpd	%fcc2,	%f6,	%f0
	fmovd	%f0,	%f4
	add	%g5,	%o6,	%o7
	stb	%i5,	[%l7 + 0x73]
	fxnors	%f5,	%f13,	%f8
	orcc	%i4,	0x0E56,	%l5
	fmuld8sux16	%f9,	%f1,	%f10
	movn	%xcc,	%i0,	%l3
	fmovscc	%icc,	%f6,	%f11
	fnors	%f0,	%f4,	%f1
	tvc	%xcc,	0x3
	mova	%icc,	%o4,	%l6
	addc	%l4,	0x187C,	%g3
	tsubcctv	%l2,	%o2,	%i1
	fble,a	%fcc3,	loop_1216
loop_1216:
	fmovrde	%g6,	%f12,	%f2
	movre	%o3,	%o0,	%l0
	lduh	[%l7 + 0x32],	%g2
	ld	[%l7 + 0x10],	%f0
	edge16	%g7,	%i6,	%o1
	fmovdcc	%icc,	%f2,	%f8
	fsrc2	%f2,	%f14
	movge	%xcc,	%i3,	%l1
	ldub	[%l7 + 0x79],	%i7
	edge32l	%g1,	%i2,	%g4
	fbu,a	%fcc0,	loop_1217
loop_1217:
	array16	%o5,	%g5,	%o6
	tcs	%xcc,	0x5
	tn	%icc,	0x7
	fornot2	%f12,	%f4,	%f4
	faligndata	%f6,	%f10,	%f0
	stx	%i5,	[%l7 + 0x18]
	fble,a	%fcc0,	loop_1218
loop_1218:
	movne	%icc,	%i4,	%l5
	fmovdpos	%icc,	%f4,	%f11
	edge16l	%i0,	%l3,	%o4
	movpos	%xcc,	%o7,	%l6
	tneg	%xcc,	0x6
	move	%xcc,	%g3,	%l4
	tge	%icc,	0x0
	smul	%o2,	%i1,	%l2
	fsrc1	%f2,	%f12
	add	%g6,	0x17E2,	%o3
	tne	%icc,	0x2
	edge16	%o0,	%l0,	%g2
	brlez	%g7,	loop_1219
loop_1219:
	fcmpgt16	%f2,	%f6,	%i6
	tne	%icc,	0x6
	fbug	%fcc2,	loop_1220
loop_1220:
	srlx	%o1,	0x08,	%i3
	ldub	[%l7 + 0x67],	%i7
	tpos	%xcc,	0x7
	movrgz	%g1,	%l1,	%g4
	ta	%icc,	0x0
	edge8	%o5,	%g5,	%i2
	movle	%icc,	%i5,	%i4
	orn	%o6,	%i0,	%l5
	fmovdvc	%xcc,	%f6,	%f3
	fble,a	%fcc3,	loop_1221
loop_1221:
	edge8ln	%l3,	%o7,	%l6
	tneg	%icc,	0x5
	stb	%o4,	[%l7 + 0x14]
	and	%g3,	%o2,	%i1
	fpackfix	%f14,	%f4
	ldsw	[%l7 + 0x4C],	%l2
	sdivcc	%l4,	0x1F09,	%o3
	fpack32	%f0,	%f6,	%f14
	fcmpne32	%f4,	%f6,	%o0
	fone	%f0
	srl	%l0,	0x1F,	%g6
	srl	%g2,	%i6,	%o1
	ldx	[%l7 + 0x40],	%g7
	lduh	[%l7 + 0x7C],	%i3
	and	%g1,	%l1,	%i7
	stw	%g4,	[%l7 + 0x4C]
	sethi	0x1AF0,	%o5
	srax	%g5,	0x15,	%i5
	fbul,a	%fcc0,	loop_1222
loop_1222:
	xnor	%i2,	%i4,	%o6
	add	%l5,	0x1928,	%l3
	edge32ln	%o7,	%l6,	%i0
	fble,a	%fcc2,	loop_1223
loop_1223:
	fxors	%f6,	%f14,	%f5
	lduw	[%l7 + 0x30],	%o4
	fbg,a	%fcc0,	loop_1224
loop_1224:
	movn	%icc,	%g3,	%i1
	ldd	[%l7 + 0x48],	%f14
	movge	%xcc,	%o2,	%l4
	movrgez	%o3,	%o0,	%l2
	st	%f15,	[%l7 + 0x48]
	fbul,a	%fcc1,	loop_1225
loop_1225:
	fbul	%fcc2,	loop_1226
loop_1226:
	udivx	%l0,	0x0079,	%g6
	ldd	[%l7 + 0x08],	%f2
	srlx	%g2,	0x00,	%i6
	andn	%o1,	%g7,	%i3
	movrgez	%l1,	%g1,	%g4
	orn	%i7,	%o5,	%i5
	st	%f15,	[%l7 + 0x0C]
	srax	%g5,	0x11,	%i2
	brlez	%i4,	loop_1227
loop_1227:
	orncc	%o6,	%l3,	%l5
	and	%o7,	%i0,	%o4
	fand	%f12,	%f14,	%f12
	udiv	%l6,	0x10D7,	%i1
	ldub	[%l7 + 0x40],	%g3
	fmovda	%icc,	%f6,	%f8
	ldsh	[%l7 + 0x52],	%l4
	or	%o2,	0x1A35,	%o0
	sdivcc	%l2,	0x1FFD,	%o3
	fabss	%f14,	%f12
	ld	[%l7 + 0x10],	%f1
	orncc	%l0,	%g2,	%i6
	tneg	%icc,	0x0
	array8	%g6,	%g7,	%i3
	fpsub16	%f2,	%f6,	%f0
	array8	%o1,	%l1,	%g4
	bl,pt	%xcc,	loop_1228
loop_1228:
	orcc	%g1,	%o5,	%i7
	fornot2	%f12,	%f0,	%f4
	fpadd32s	%f10,	%f13,	%f2
	sdivx	%i5,	0x0D47,	%g5
	fmul8sux16	%f0,	%f12,	%f2
	subc	%i4,	%i2,	%l3
	ldsw	[%l7 + 0x2C],	%o6
	movn	%icc,	%l5,	%o7
	fmovscs	%icc,	%f1,	%f15
	siam	0x4
	edge32l	%o4,	%l6,	%i1
	ldx	[%l7 + 0x20],	%i0
	udiv	%l4,	0x1FF7,	%o2
	xor	%g3,	0x02C4,	%l2
	fornot2	%f4,	%f8,	%f2
	movvs	%icc,	%o3,	%o0
	fpadd16s	%f13,	%f5,	%f12
	subcc	%g2,	0x046A,	%i6
	fcmps	%fcc3,	%f13,	%f3
	srlx	%l0,	%g6,	%i3
	movrgz	%o1,	%l1,	%g7
	fba	%fcc0,	loop_1229
loop_1229:
	brlz	%g1,	loop_1230
loop_1230:
	fmuld8sux16	%f3,	%f10,	%f4
	fcmpgt32	%f4,	%f8,	%g4
	tpos	%icc,	0x6
	movrlez	%o5,	0x1D6,	%i7
	lduw	[%l7 + 0x50],	%g5
	fcmpes	%fcc3,	%f6,	%f3
	movre	%i4,	0x251,	%i5
	and	%i2,	%l3,	%o6
	ldsw	[%l7 + 0x44],	%o7
	umul	%o4,	0x11BF,	%l5
	fba,a	%fcc3,	loop_1231
loop_1231:
	add	%i1,	0x05A6,	%i0
	bgu	loop_1232
loop_1232:
	alignaddrl	%l6,	%o2,	%g3
	andncc	%l4,	%o3,	%o0
	fmovsneg	%xcc,	%f1,	%f11
	edge16ln	%l2,	%g2,	%i6
	edge16ln	%l0,	%i3,	%o1
	subccc	%g6,	%g7,	%g1
	movle	%icc,	%l1,	%o5
	fbug,a	%fcc3,	loop_1233
loop_1233:
	ba	loop_1234
loop_1234:
	tpos	%xcc,	0x1
	fmovspos	%icc,	%f7,	%f4
	tvc	%xcc,	0x7
	te	%icc,	0x1
	movneg	%xcc,	%g4,	%i7
	fmovsle	%xcc,	%f1,	%f0
	edge32ln	%g5,	%i5,	%i4
	udivx	%i2,	0x0AEE,	%l3
	and	%o6,	%o7,	%o4
	sll	%i1,	%l5,	%l6
	fnot1	%f14,	%f10
	edge16	%o2,	%i0,	%g3
	move	%xcc,	%o3,	%o0
	movrlez	%l4,	%g2,	%i6
	stw	%l2,	[%l7 + 0x68]
	andncc	%i3,	%l0,	%g6
	ldsh	[%l7 + 0x62],	%o1
	edge32ln	%g1,	%g7,	%o5
	fcmpne16	%f10,	%f6,	%g4
	fmovsvc	%icc,	%f1,	%f10
	andncc	%l1,	%g5,	%i5
	fmovdgu	%xcc,	%f13,	%f10
	andn	%i7,	0x0FA0,	%i2
	addcc	%i4,	%o6,	%l3
	ldub	[%l7 + 0x55],	%o7
	sra	%o4,	0x15,	%l5
	edge8n	%l6,	%i1,	%i0
	tsubcc	%o2,	%o3,	%o0
	fble	%fcc2,	loop_1235
loop_1235:
	sdivx	%g3,	0x07F3,	%g2
	ldd	[%l7 + 0x10],	%f2
	fmuld8ulx16	%f14,	%f3,	%f14
	popc	0x077C,	%l4
	movne	%icc,	%l2,	%i6
	stw	%l0,	[%l7 + 0x60]
	tleu	%icc,	0x3
	subc	%g6,	%i3,	%o1
	brgez	%g7,	loop_1236
loop_1236:
	alignaddr	%g1,	%g4,	%l1
	ta	%xcc,	0x6
	tleu	%xcc,	0x2
	fmovsn	%xcc,	%f6,	%f8
	fexpand	%f9,	%f10
	fandnot1	%f4,	%f14,	%f8
	movle	%xcc,	%o5,	%g5
	movvs	%xcc,	%i5,	%i2
	taddcc	%i4,	0x118F,	%o6
	bl,pn	%icc,	loop_1237
loop_1237:
	edge32ln	%i7,	%o7,	%l3
	fmuld8sux16	%f11,	%f7,	%f8
	sll	%l5,	%l6,	%o4
	fcmpes	%fcc3,	%f6,	%f2
	ldsb	[%l7 + 0x0A],	%i0
	movg	%icc,	%i1,	%o2
	edge32ln	%o0,	%g3,	%o3
	fpadd32	%f10,	%f8,	%f14
	fcmpeq32	%f8,	%f10,	%l4
	tcs	%xcc,	0x5
	edge32ln	%l2,	%g2,	%l0
	ldx	[%l7 + 0x60],	%g6
	move	%xcc,	%i3,	%o1
	bneg	loop_1238
loop_1238:
	stx	%i6,	[%l7 + 0x48]
	fmovdg	%icc,	%f7,	%f15
	bne,pn	%xcc,	loop_1239
loop_1239:
	tsubcctv	%g7,	0x097D,	%g1
	tle	%xcc,	0x4
	udivcc	%l1,	0x0BF0,	%o5
	ldsw	[%l7 + 0x64],	%g4
	fmovsleu	%xcc,	%f0,	%f9
	udiv	%i5,	0x1D79,	%i2
	fmovrdgz	%g5,	%f12,	%f10
	fmovscs	%icc,	%f1,	%f6
	tleu	%xcc,	0x6
	or	%o6,	%i4,	%o7
	ble,pn	%xcc,	loop_1240
loop_1240:
	sra	%i7,	0x0F,	%l5
	movgu	%icc,	%l6,	%l3
	tcs	%icc,	0x5
	faligndata	%f0,	%f2,	%f12
	edge8n	%i0,	%i1,	%o4
	addccc	%o2,	%g3,	%o0
	udiv	%l4,	0x1A27,	%l2
	movleu	%xcc,	%o3,	%g2
	stb	%l0,	[%l7 + 0x0B]
	fmul8x16	%f0,	%f0,	%f4
	fbe	%fcc1,	loop_1241
loop_1241:
	fornot1s	%f2,	%f1,	%f4
	edge8n	%g6,	%i3,	%o1
	movre	%i6,	0x256,	%g1
	edge8l	%l1,	%o5,	%g4
	subccc	%g7,	%i5,	%g5
	fxnors	%f10,	%f1,	%f2
	stx	%o6,	[%l7 + 0x60]
	bvs,a,pn	%xcc,	loop_1242
loop_1242:
	edge16ln	%i4,	%i2,	%i7
	bcs	loop_1243
loop_1243:
	smulcc	%l5,	0x1E32,	%l6
	udivcc	%l3,	0x01C2,	%o7
	fcmped	%fcc2,	%f10,	%f4
	smulcc	%i0,	0x17EE,	%o4
	bleu,pn	%xcc,	loop_1244
loop_1244:
	subcc	%o2,	0x0E82,	%g3
	nop
	setx loop_1245, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1245:
	fmul8ulx16	%f8,	%f4,	%f4
	stx	%o0,	[%l7 + 0x08]
	tne	%icc,	0x5
	tne	%icc,	0x7
	movcc	%xcc,	%i1,	%l4
	smulcc	%l2,	0x0781,	%g2
	orn	%l0,	0x0808,	%o3
	ldsh	[%l7 + 0x1A],	%g6
	movcs	%icc,	%o1,	%i6
	alignaddrl	%g1,	%i3,	%o5
	fone	%f14
	movge	%xcc,	%l1,	%g4
	nop
	setx loop_1246, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1246:
	movcc	%xcc,	%g7,	%i5
	sra	%g5,	%i4,	%i2
	fmovdcc	%xcc,	%f3,	%f12
	taddcctv	%o6,	0x140F,	%i7
	srl	%l6,	%l3,	%l5
	movge	%xcc,	%o7,	%o4
	tge	%xcc,	0x1
	fabsd	%f14,	%f14
	srax	%i0,	0x04,	%o2
	srl	%g3,	%o0,	%l4
	array16	%l2,	%i1,	%g2
	std	%f8,	[%l7 + 0x08]
	stw	%o3,	[%l7 + 0x34]
	fands	%f7,	%f3,	%f7
	movne	%xcc,	%l0,	%g6
	add	%i6,	0x1150,	%g1
	andn	%o1,	0x17AA,	%o5
	umul	%i3,	0x1985,	%l1
	sdivcc	%g4,	0x0DBF,	%g7
	tcs	%xcc,	0x2
	st	%f13,	[%l7 + 0x34]
	ldsb	[%l7 + 0x38],	%g5
	udivx	%i4,	0x159F,	%i5
	addcc	%o6,	%i7,	%l6
	fmovsne	%xcc,	%f11,	%f7
	bge,pt	%xcc,	loop_1247
loop_1247:
	fmovsge	%icc,	%f0,	%f3
	fnot1s	%f10,	%f3
	edge8l	%i2,	%l5,	%l3
	fzero	%f10
	stb	%o7,	[%l7 + 0x4D]
	and	%o4,	0x1C5A,	%i0
	stw	%g3,	[%l7 + 0x3C]
	tcc	%xcc,	0x0
	movl	%icc,	%o0,	%o2
	udivx	%l4,	0x0568,	%l2
	tcs	%icc,	0x3
	movcc	%xcc,	%i1,	%g2
	tn	%xcc,	0x1
	movcs	%icc,	%o3,	%l0
	andcc	%g6,	0x1580,	%i6
	tneg	%icc,	0x4
	fbne,a	%fcc3,	loop_1248
loop_1248:
	tneg	%icc,	0x0
	fmovdgu	%icc,	%f13,	%f9
	umul	%o1,	%g1,	%i3
	fmovdn	%icc,	%f5,	%f3
	orncc	%l1,	0x0192,	%o5
	fnors	%f1,	%f12,	%f11
	movrlz	%g7,	0x373,	%g4
	xnorcc	%g5,	%i5,	%o6
	fmovsa	%icc,	%f10,	%f0
	stx	%i4,	[%l7 + 0x70]
	nop
	setx loop_1249, %l0, %l1
	jmpl %l1, %l6
loop_1249:
	fmovsa	%icc,	%f9,	%f14
	movrlz	%i2,	%i7,	%l5
	ta	%xcc,	0x1
	mova	%xcc,	%l3,	%o4
	fbn	%fcc2,	loop_1250
loop_1250:
	edge16	%o7,	%i0,	%o0
	fbule	%fcc2,	loop_1251
loop_1251:
	edge8n	%g3,	%l4,	%l2
	fand	%f0,	%f14,	%f2
	movge	%xcc,	%o2,	%i1
	fpadd16s	%f6,	%f0,	%f1
	movrlez	%g2,	0x239,	%o3
	fnors	%f14,	%f15,	%f11
	sdivx	%g6,	0x0715,	%i6
	alignaddr	%l0,	%g1,	%i3
	brlez	%o1,	loop_1252
loop_1252:
	fmovdcs	%xcc,	%f4,	%f1
	movg	%icc,	%o5,	%l1
	fmovdcs	%xcc,	%f15,	%f5
	array16	%g4,	%g7,	%i5
	movrne	%o6,	0x2CC,	%g5
	std	%f0,	[%l7 + 0x58]
	stw	%l6,	[%l7 + 0x24]
	edge16n	%i4,	%i7,	%l5
	fbu	%fcc1,	loop_1253
loop_1253:
	bne,pt	%xcc,	loop_1254
loop_1254:
	edge16l	%i2,	%l3,	%o4
	st	%f2,	[%l7 + 0x64]
	fmovde	%icc,	%f12,	%f7
	bg,pn	%xcc,	loop_1255
loop_1255:
	fmovscs	%icc,	%f3,	%f10
	smul	%i0,	0x0D90,	%o0
	edge16ln	%g3,	%l4,	%l2
	bl,a	%icc,	loop_1256
loop_1256:
	nop
	setx loop_1257, %l0, %l1
	jmpl %l1, %o7
loop_1257:
	sdiv	%o2,	0x0BDC,	%i1
	array8	%g2,	%g6,	%o3
	andncc	%l0,	%g1,	%i6
	movn	%icc,	%o1,	%i3
	fornot1	%f0,	%f8,	%f0
	array8	%l1,	%g4,	%g7
	fmul8x16	%f4,	%f12,	%f2
	edge8n	%o5,	%o6,	%i5
	sdivx	%l6,	0x1178,	%i4
	xnor	%i7,	%g5,	%l5
	fmovrse	%l3,	%f12,	%f9
	tge	%xcc,	0x2
	subccc	%i2,	%o4,	%i0
	movvs	%xcc,	%g3,	%o0
	alignaddr	%l4,	%l2,	%o7
	edge8n	%i1,	%g2,	%g6
	fbu,a	%fcc3,	loop_1258
loop_1258:
	fcmpne32	%f10,	%f0,	%o2
	move	%xcc,	%l0,	%g1
	fcmpes	%fcc0,	%f12,	%f3
	tneg	%xcc,	0x1
	addccc	%i6,	0x0144,	%o3
	movle	%xcc,	%o1,	%i3
	fcmpd	%fcc1,	%f10,	%f6
	fbn,a	%fcc1,	loop_1259
loop_1259:
	lduh	[%l7 + 0x4E],	%g4
	ldd	[%l7 + 0x18],	%f2
	lduh	[%l7 + 0x76],	%l1
	tg	%xcc,	0x0
	fmovrdgez	%g7,	%f0,	%f0
	sra	%o5,	0x0C,	%i5
	ldsb	[%l7 + 0x0F],	%l6
	sth	%o6,	[%l7 + 0x40]
	fand	%f14,	%f10,	%f12
	fbuge,a	%fcc3,	loop_1260
loop_1260:
	movrgez	%i7,	0x2C2,	%g5
	andncc	%i4,	%l5,	%i2
	edge8ln	%l3,	%o4,	%i0
	fxor	%f4,	%f6,	%f14
	fmovdpos	%xcc,	%f12,	%f4
	movgu	%xcc,	%o0,	%l4
	taddcc	%g3,	%o7,	%i1
	fmul8x16	%f13,	%f4,	%f12
	fcmps	%fcc2,	%f2,	%f6
	lduw	[%l7 + 0x10],	%l2
	srax	%g2,	%g6,	%l0
	tge	%xcc,	0x7
	fpack16	%f6,	%f0
	nop
	setx loop_1261, %l0, %l1
	jmpl %l1, %o2
loop_1261:
	tvc	%xcc,	0x4
	umulcc	%g1,	0x0DCD,	%i6
	movcc	%xcc,	%o1,	%o3
	bvc	%xcc,	loop_1262
loop_1262:
	mulscc	%i3,	%g4,	%g7
	nop
	setx loop_1263, %l0, %l1
	jmpl %l1, %l1
loop_1263:
	bpos,a	%xcc,	loop_1264
loop_1264:
	fabsd	%f2,	%f6
	edge8	%o5,	%i5,	%o6
	fmovscs	%xcc,	%f15,	%f7
	stw	%l6,	[%l7 + 0x1C]
	st	%f7,	[%l7 + 0x3C]
	brnz	%i7,	loop_1265
loop_1265:
	fands	%f2,	%f2,	%f9
	sth	%i4,	[%l7 + 0x28]
	std	%f2,	[%l7 + 0x40]
	movrlz	%l5,	0x347,	%g5
	edge32	%l3,	%o4,	%i0
	fpmerge	%f1,	%f10,	%f4
	ldsh	[%l7 + 0x5C],	%o0
	orn	%l4,	0x1DD0,	%i2
	smulcc	%o7,	0x0A09,	%i1
	bpos,a	%icc,	loop_1266
loop_1266:
	tsubcc	%l2,	0x0E45,	%g3
	fpsub32	%f14,	%f10,	%f8
	movre	%g2,	%l0,	%o2
	alignaddr	%g1,	%i6,	%o1
	taddcc	%g6,	%i3,	%o3
	movgu	%icc,	%g4,	%l1
	fpsub16	%f2,	%f10,	%f4
	movneg	%icc,	%o5,	%i5
	taddcc	%g7,	%o6,	%l6
	movcc	%icc,	%i4,	%l5
	fmovsneg	%icc,	%f11,	%f3
	edge16l	%i7,	%g5,	%o4
	edge8	%l3,	%i0,	%o0
	alignaddrl	%l4,	%o7,	%i1
	tle	%xcc,	0x5
	tgu	%xcc,	0x0
	array8	%i2,	%g3,	%g2
	stb	%l0,	[%l7 + 0x57]
	fmovrsgz	%l2,	%f8,	%f6
	umul	%g1,	0x13E2,	%o2
	edge32n	%i6,	%o1,	%i3
	tsubcctv	%g6,	0x0824,	%g4
	movre	%l1,	0x3B3,	%o5
	orn	%o3,	%i5,	%g7
	brgez	%l6,	loop_1267
loop_1267:
	edge16	%o6,	%l5,	%i7
	movge	%xcc,	%g5,	%o4
	sll	%i4,	0x16,	%i0
	fmovdvc	%icc,	%f2,	%f12
	addc	%o0,	%l4,	%o7
	tg	%xcc,	0x0
	tsubcc	%l3,	0x13F1,	%i1
	edge16ln	%i2,	%g3,	%l0
	udivx	%g2,	0x154F,	%g1
	edge8n	%o2,	%i6,	%l2
	array16	%o1,	%i3,	%g6
	ldd	[%l7 + 0x50],	%f2
	ldd	[%l7 + 0x30],	%f0
	movl	%icc,	%l1,	%o5
	movcs	%icc,	%o3,	%g4
	tcc	%icc,	0x0
	srl	%g7,	%i5,	%o6
	ldub	[%l7 + 0x2E],	%l6
	tsubcc	%l5,	%g5,	%i7
	sdivx	%i4,	0x123A,	%i0
	fnot2s	%f4,	%f10
	addc	%o4,	%o0,	%l4
	fsrc2s	%f14,	%f8
	sth	%o7,	[%l7 + 0x68]
	fbue	%fcc1,	loop_1268
loop_1268:
	tsubcc	%i1,	%i2,	%g3
	fbl,a	%fcc2,	loop_1269
loop_1269:
	andn	%l0,	%g2,	%l3
	movgu	%xcc,	%g1,	%i6
	brz,a	%l2,	loop_1270
loop_1270:
	fbuge,a	%fcc1,	loop_1271
loop_1271:
	tneg	%icc,	0x0
	bvs,a,pn	%xcc,	loop_1272
loop_1272:
	orn	%o1,	%o2,	%i3
	brlz,a	%g6,	loop_1273
loop_1273:
	fbo	%fcc1,	loop_1274
loop_1274:
	movneg	%icc,	%o5,	%l1
	addccc	%g4,	%g7,	%o3
	fmul8x16	%f1,	%f4,	%f14
	lduh	[%l7 + 0x70],	%o6
	tl	%xcc,	0x3
	fmul8x16al	%f1,	%f14,	%f12
	ld	[%l7 + 0x50],	%f1
	be	%xcc,	loop_1275
loop_1275:
	sethi	0x138D,	%l6
	fbg,a	%fcc3,	loop_1276
loop_1276:
	andncc	%l5,	%i5,	%i7
	ldsh	[%l7 + 0x24],	%i4
	tgu	%icc,	0x4
	fornot1	%f12,	%f6,	%f0
	or	%g5,	0x0F36,	%o4
	sdivx	%i0,	0x0C9D,	%o0
	taddcctv	%l4,	0x1CF1,	%i1
	sdivcc	%o7,	0x12F0,	%i2
	mova	%xcc,	%l0,	%g3
	ldd	[%l7 + 0x50],	%f14
	fmovrslz	%g2,	%f0,	%f14
	std	%f8,	[%l7 + 0x20]
	xor	%l3,	%g1,	%i6
	ta	%xcc,	0x7
	tcc	%icc,	0x3
	fmovdge	%xcc,	%f6,	%f5
	edge16	%o1,	%o2,	%i3
	udiv	%g6,	0x10C2,	%o5
	fmovspos	%xcc,	%f12,	%f6
	xnor	%l1,	0x1E23,	%l2
	fmuld8sux16	%f0,	%f15,	%f2
	fba	%fcc1,	loop_1277
loop_1277:
	movrgez	%g7,	%o3,	%o6
	array32	%l6,	%g4,	%l5
	movne	%xcc,	%i7,	%i4
	edge16l	%g5,	%i5,	%o4
	orncc	%i0,	%o0,	%i1
	fmovsl	%icc,	%f8,	%f13
	udivcc	%l4,	0x1A7B,	%i2
	fmul8x16au	%f7,	%f14,	%f8
	sllx	%l0,	0x03,	%g3
	subcc	%o7,	0x1952,	%l3
	subc	%g1,	0x08D7,	%g2
	bl	loop_1278
loop_1278:
	mova	%xcc,	%i6,	%o1
	edge8ln	%o2,	%i3,	%g6
	umulcc	%o5,	0x06A0,	%l1
	umul	%g7,	0x0C62,	%l2
	movrgez	%o3,	%o6,	%g4
	tne	%icc,	0x2
	stw	%l5,	[%l7 + 0x60]
	st	%f7,	[%l7 + 0x1C]
	fsrc2s	%f10,	%f8
	fbue,a	%fcc0,	loop_1279
loop_1279:
	bgu	loop_1280
loop_1280:
	xor	%l6,	0x0396,	%i4
	tneg	%icc,	0x0
	fmovrdne	%g5,	%f4,	%f12
	sethi	0x0E6D,	%i5
	xor	%i7,	%o4,	%o0
	addccc	%i1,	0x0D08,	%i0
	movrgz	%i2,	%l0,	%g3
	fbuge,a	%fcc1,	loop_1281
loop_1281:
	be	%icc,	loop_1282
loop_1282:
	fpack32	%f0,	%f14,	%f14
	fbul,a	%fcc0,	loop_1283
loop_1283:
	edge32l	%l4,	%l3,	%o7
	tneg	%xcc,	0x2
	movneg	%xcc,	%g2,	%i6
	udiv	%o1,	0x067B,	%g1
	fmul8ulx16	%f6,	%f2,	%f10
	ldsw	[%l7 + 0x64],	%i3
	fmovse	%xcc,	%f3,	%f7
	edge8n	%o2,	%g6,	%l1
	srlx	%o5,	0x17,	%l2
	andcc	%g7,	%o6,	%g4
	sll	%o3,	0x1C,	%l6
	brnz,a	%i4,	loop_1284
loop_1284:
	srax	%l5,	0x10,	%g5
	ldsh	[%l7 + 0x44],	%i5
	mulx	%i7,	%o0,	%i1
	fbge	%fcc0,	loop_1285
loop_1285:
	xor	%i0,	0x07A2,	%o4
	taddcc	%l0,	%g3,	%l4
	lduh	[%l7 + 0x56],	%l3
	fblg	%fcc2,	loop_1286
loop_1286:
	fmovscs	%xcc,	%f7,	%f0
	subccc	%o7,	%i2,	%g2
	movre	%i6,	%g1,	%o1
	tne	%xcc,	0x7
	orncc	%o2,	0x0D3F,	%g6
	fnor	%f8,	%f8,	%f2
	sub	%i3,	%o5,	%l1
	tcc	%icc,	0x7
	ld	[%l7 + 0x44],	%f2
	fbge,a	%fcc3,	loop_1287
loop_1287:
	fone	%f2
	ldsh	[%l7 + 0x4A],	%l2
	bpos,pn	%xcc,	loop_1288
loop_1288:
	andncc	%o6,	%g4,	%o3
	tl	%xcc,	0x5
	and	%g7,	0x0980,	%l6
	fmul8ulx16	%f8,	%f2,	%f14
	move	%xcc,	%l5,	%g5
	tn	%xcc,	0x0
	mulscc	%i5,	%i7,	%o0
	ldsw	[%l7 + 0x1C],	%i1
	sll	%i0,	0x0D,	%o4
	te	%icc,	0x3
	srlx	%i4,	0x11,	%g3
	fxnor	%f2,	%f2,	%f8
	or	%l0,	%l4,	%l3
	addc	%o7,	%g2,	%i6
	orncc	%g1,	0x16DC,	%o1
	andcc	%o2,	0x1921,	%g6
	lduh	[%l7 + 0x26],	%i3
	stw	%o5,	[%l7 + 0x7C]
	and	%i2,	0x13E0,	%l2
	movn	%icc,	%l1,	%o6
	ldsh	[%l7 + 0x3A],	%g4
	edge16	%g7,	%o3,	%l6
	fmovdleu	%xcc,	%f11,	%f4
	fcmpd	%fcc0,	%f4,	%f8
	std	%f2,	[%l7 + 0x60]
	bcc,pn	%icc,	loop_1289
loop_1289:
	xnor	%l5,	0x0CB6,	%g5
	ldsh	[%l7 + 0x08],	%i5
	edge8	%i7,	%o0,	%i1
	fmovd	%f10,	%f6
	brgz,a	%o4,	loop_1290
loop_1290:
	smulcc	%i4,	0x0AB5,	%g3
	fbo	%fcc2,	loop_1291
loop_1291:
	fmovdn	%icc,	%f13,	%f14
	fmovrdlez	%l0,	%f12,	%f8
	tgu	%xcc,	0x4
	tne	%icc,	0x4
	fxors	%f6,	%f8,	%f11
	mulx	%i0,	%l4,	%o7
	for	%f0,	%f0,	%f4
	tsubcc	%l3,	%i6,	%g2
	brnz	%g1,	loop_1292
loop_1292:
	bgu,a,pt	%xcc,	loop_1293
loop_1293:
	movvc	%xcc,	%o1,	%o2
	edge32l	%g6,	%o5,	%i3
	sllx	%i2,	%l1,	%o6
	addccc	%l2,	0x028E,	%g4
	taddcctv	%g7,	0x0CCD,	%o3
	ldd	[%l7 + 0x78],	%f8
	edge16l	%l5,	%g5,	%i5
	movvs	%xcc,	%l6,	%o0
	siam	0x1
	fbul,a	%fcc3,	loop_1294
loop_1294:
	bcs,a	%icc,	loop_1295
loop_1295:
	srax	%i7,	0x1F,	%o4
	brgz,a	%i4,	loop_1296
loop_1296:
	tl	%icc,	0x7
	fpadd16	%f4,	%f4,	%f10
	bg,a	%icc,	loop_1297
loop_1297:
	tcc	%icc,	0x1
	edge16	%i1,	%l0,	%g3
	fcmpne32	%f0,	%f2,	%i0
	smulcc	%l4,	%o7,	%i6
	tsubcctv	%g2,	%l3,	%g1
	movge	%icc,	%o2,	%g6
	fpsub32s	%f14,	%f2,	%f5
	movrne	%o5,	%o1,	%i3
	movre	%i2,	0x391,	%l1
	movvs	%icc,	%l2,	%g4
	fmovrdgz	%o6,	%f12,	%f10
	srl	%o3,	0x03,	%g7
	fmovdn	%icc,	%f12,	%f9
	xor	%l5,	0x1770,	%i5
	movneg	%icc,	%g5,	%l6
	stb	%o0,	[%l7 + 0x5E]
	fxnor	%f6,	%f2,	%f10
	bvs,a	%icc,	loop_1298
loop_1298:
	popc	%i7,	%i4
	tleu	%icc,	0x0
	st	%f4,	[%l7 + 0x20]
	fpadd32s	%f15,	%f5,	%f7
	or	%o4,	0x0576,	%l0
	addcc	%i1,	%i0,	%l4
	tsubcc	%g3,	0x14C9,	%i6
	orncc	%g2,	0x1A82,	%o7
	or	%g1,	%o2,	%g6
	andcc	%l3,	%o5,	%i3
	fmovsleu	%xcc,	%f0,	%f6
	fnot2	%f10,	%f10
	call	loop_1299
loop_1299:
	fba,a	%fcc1,	loop_1300
loop_1300:
	taddcc	%i2,	0x1E87,	%l1
	bvc,a,pn	%icc,	loop_1301
loop_1301:
	andcc	%l2,	%o1,	%o6
	fbge	%fcc2,	loop_1302
loop_1302:
	fmovsvc	%icc,	%f10,	%f3
	srax	%g4,	%o3,	%g7
	ldsh	[%l7 + 0x6C],	%l5
	edge8l	%g5,	%l6,	%i5
	tle	%xcc,	0x2
	fmovsleu	%icc,	%f11,	%f1
	smul	%i7,	%i4,	%o0
	fcmple32	%f14,	%f14,	%l0
	move	%icc,	%o4,	%i0
	fmovscs	%xcc,	%f11,	%f9
	ldsw	[%l7 + 0x54],	%l4
	fpmerge	%f9,	%f7,	%f14
	movgu	%icc,	%g3,	%i6
	fpack16	%f8,	%f10
	fbue,a	%fcc1,	loop_1303
loop_1303:
	edge16ln	%g2,	%o7,	%i1
	addc	%o2,	0x16FF,	%g6
	sdiv	%l3,	0x1740,	%o5
	edge32l	%i3,	%i2,	%g1
	stb	%l1,	[%l7 + 0x7D]
	fpsub16s	%f10,	%f14,	%f5
	tl	%icc,	0x3
	tge	%icc,	0x5
	fbne,a	%fcc2,	loop_1304
loop_1304:
	umul	%l2,	%o6,	%o1
	movvc	%xcc,	%o3,	%g4
	sub	%g7,	%g5,	%l5
	udivcc	%l6,	0x07FB,	%i5
	bvs	loop_1305
loop_1305:
	edge16l	%i7,	%i4,	%l0
	bl,pn	%xcc,	loop_1306
loop_1306:
	nop
	setx loop_1307, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1307:
	movrlz	%o0,	0x191,	%o4
	andcc	%l4,	0x0DDB,	%g3
	ldsh	[%l7 + 0x3E],	%i0
	pdist	%f14,	%f8,	%f0
	ldd	[%l7 + 0x30],	%f6
	faligndata	%f14,	%f0,	%f12
	edge8	%i6,	%g2,	%i1
	movvs	%xcc,	%o2,	%o7
	fandnot1s	%f5,	%f9,	%f3
	ldsw	[%l7 + 0x28],	%g6
	fmovsa	%icc,	%f6,	%f3
	fxor	%f10,	%f0,	%f14
	edge16	%l3,	%o5,	%i2
	fcmpne32	%f2,	%f8,	%g1
	movrgez	%l1,	0x1E2,	%i3
	fbue,a	%fcc2,	loop_1308
loop_1308:
	fmovdneg	%icc,	%f6,	%f2
	movrgez	%o6,	%o1,	%o3
	std	%f6,	[%l7 + 0x08]
	movrne	%g4,	%g7,	%g5
	mova	%xcc,	%l2,	%l6
	xorcc	%i5,	%i7,	%l5
	tneg	%icc,	0x0
	brlez	%l0,	loop_1309
loop_1309:
	bpos	%xcc,	loop_1310
loop_1310:
	subcc	%i4,	%o0,	%l4
	fmovdcs	%icc,	%f7,	%f1
	srlx	%g3,	%o4,	%i0
	ldsb	[%l7 + 0x1D],	%g2
	edge16n	%i6,	%o2,	%o7
	edge32	%g6,	%i1,	%o5
	tle	%xcc,	0x2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type f   	: 195
!	Type i   	: 554
!	Type cti   	: 123
!	Type l   	: 128
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
main_t6:

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x4,	%g2
	set	0xA,	%g3
	set	0x4,	%g4
	set	0x6,	%g5
	set	0xE,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x3,	%i1
	set	-0xC,	%i2
	set	-0xA,	%i3
	set	-0xC,	%i4
	set	-0x5,	%i5
	set	-0xC,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x7E815CD7,	%l0
	set	0x6DDA04EB,	%l1
	set	0x544AFE97,	%l2
	set	0x431398E8,	%l3
	set	0x54C3B486,	%l4
	set	0x2D1BE565,	%l5
	set	0x5DFD2C88,	%l6
	!# Output registers
	set	0x12A5,	%o0
	set	0x0B59,	%o1
	set	0x08A9,	%o2
	set	-0x1807,	%o3
	set	-0x159C,	%o4
	set	0x0F56,	%o5
	set	-0x02AB,	%o6
	set	0x0D04,	%o7

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

	move	%icc,	%l3,	%g1
	stb	%l1,	[%l7 + 0x58]
	ldub	[%l7 + 0x5C],	%i2
	movn	%icc,	%o6,	%i3
	sdiv	%o3,	0x0864,	%g4
	ldub	[%l7 + 0x58],	%g7
	movrlez	%g5,	%o1,	%l6
	stb	%i5,	[%l7 + 0x7D]
	brgz	%i7,	loop_1311
loop_1311:
	ldx	[%l7 + 0x40],	%l2
	sdiv	%l0,	0x1D04,	%i4
	ldsb	[%l7 + 0x56],	%l5
	andn	%o0,	%g3,	%o4
	lduh	[%l7 + 0x50],	%i0
	movrgez	%g2,	%i6,	%o2
	udiv	%l4,	0x0CF4,	%g6
	sth	%i1,	[%l7 + 0x16]
	edge32	%o5,	%l3,	%o7
	tcc	%xcc,	0x5
	tge	%icc,	0x5
	fpmerge	%f15,	%f6,	%f14
	or	%l1,	%i2,	%o6
	orn	%i3,	%g1,	%g4
	edge32ln	%g7,	%g5,	%o1
	fbue	%fcc3,	loop_1312
loop_1312:
	ldd	[%l7 + 0x18],	%f8
	edge32n	%l6,	%i5,	%o3
	orcc	%i7,	0x10CB,	%l0
	tvc	%icc,	0x1
	brgez,a	%l2,	loop_1313
loop_1313:
	movle	%icc,	%i4,	%l5
	sth	%g3,	[%l7 + 0x1C]
	ldd	[%l7 + 0x30],	%f0
	taddcc	%o4,	0x04C8,	%o0
	edge16ln	%g2,	%i0,	%i6
	ldd	[%l7 + 0x68],	%f0
	stx	%l4,	[%l7 + 0x38]
	sth	%o2,	[%l7 + 0x4C]
	ldub	[%l7 + 0x59],	%i1
	ld	[%l7 + 0x30],	%f4
	movrne	%g6,	0x22E,	%o5
	std	%f2,	[%l7 + 0x38]
	ldub	[%l7 + 0x76],	%o7
	andcc	%l3,	%i2,	%l1
	lduw	[%l7 + 0x58],	%o6
	lduw	[%l7 + 0x28],	%i3
	ldsh	[%l7 + 0x1E],	%g1
	ldsh	[%l7 + 0x5A],	%g4
	ldsb	[%l7 + 0x75],	%g7
	fmovdcc	%icc,	%f14,	%f8
	array8	%g5,	%l6,	%i5
	stw	%o3,	[%l7 + 0x3C]
	ldsh	[%l7 + 0x52],	%i7
	stx	%l0,	[%l7 + 0x70]
	lduh	[%l7 + 0x46],	%o1
	bvc,pn	%icc,	loop_1314
loop_1314:
	ldd	[%l7 + 0x08],	%f8
	edge8ln	%i4,	%l2,	%g3
	ldx	[%l7 + 0x10],	%o4
	ldx	[%l7 + 0x18],	%l5
	movn	%xcc,	%g2,	%i0
	st	%f6,	[%l7 + 0x70]
	mova	%xcc,	%o0,	%i6
	sdivcc	%l4,	0x04EA,	%o2
	fnegs	%f15,	%f8
	lduh	[%l7 + 0x38],	%i1
	movrgez	%g6,	%o5,	%o7
	ldd	[%l7 + 0x38],	%f10
	std	%f0,	[%l7 + 0x38]
	stx	%l3,	[%l7 + 0x40]
	nop
	setx loop_1315, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1315:
	ldx	[%l7 + 0x18],	%l1
	ldsb	[%l7 + 0x47],	%o6
	movre	%i3,	0x146,	%i2
	xorcc	%g1,	0x08BF,	%g4
	edge8ln	%g7,	%l6,	%g5
	ldx	[%l7 + 0x48],	%o3
	lduw	[%l7 + 0x4C],	%i5
	ldsb	[%l7 + 0x13],	%i7
	ldsh	[%l7 + 0x08],	%l0
	fzero	%f12
	lduh	[%l7 + 0x5C],	%o1
	orncc	%i4,	%g3,	%l2
	fpsub32	%f8,	%f14,	%f10
	stx	%o4,	[%l7 + 0x78]
	ldx	[%l7 + 0x38],	%g2
	fmovsne	%xcc,	%f7,	%f10
	edge8n	%l5,	%i0,	%o0
	edge8n	%i6,	%o2,	%i1
	and	%l4,	0x107C,	%g6
	ldd	[%l7 + 0x48],	%f14
	fmul8x16au	%f12,	%f4,	%f12
	ldsw	[%l7 + 0x2C],	%o5
	stw	%l3,	[%l7 + 0x68]
	stw	%o7,	[%l7 + 0x38]
	stw	%l1,	[%l7 + 0x68]
	fmovsge	%xcc,	%f7,	%f13
	ldsw	[%l7 + 0x40],	%i3
	lduh	[%l7 + 0x10],	%o6
	stw	%i2,	[%l7 + 0x44]
	sth	%g4,	[%l7 + 0x68]
	ldsb	[%l7 + 0x7A],	%g1
	stx	%l6,	[%l7 + 0x60]
	stb	%g7,	[%l7 + 0x34]
	bvs,a,pt	%xcc,	loop_1316
loop_1316:
	mulx	%g5,	%i5,	%i7
	ldub	[%l7 + 0x74],	%l0
	stb	%o3,	[%l7 + 0x26]
	st	%f1,	[%l7 + 0x50]
	sethi	0x05BF,	%i4
	fzero	%f0
	st	%f6,	[%l7 + 0x5C]
	tsubcc	%o1,	%l2,	%g3
	lduw	[%l7 + 0x5C],	%g2
	lduh	[%l7 + 0x6A],	%o4
	fpack32	%f0,	%f0,	%f4
	stb	%i0,	[%l7 + 0x33]
	stx	%l5,	[%l7 + 0x20]
	fxnors	%f2,	%f13,	%f1
	ldsb	[%l7 + 0x5F],	%i6
	stw	%o2,	[%l7 + 0x08]
	ldsh	[%l7 + 0x08],	%i1
	fmovdg	%icc,	%f3,	%f11
	fnand	%f8,	%f0,	%f0
	movcc	%xcc,	%l4,	%g6
	lduh	[%l7 + 0x52],	%o5
	tneg	%icc,	0x3
	sdiv	%o0,	0x1653,	%l3
	stw	%o7,	[%l7 + 0x30]
	edge8ln	%i3,	%l1,	%i2
	edge32n	%o6,	%g4,	%l6
	movrlez	%g1,	0x2EB,	%g7
	ldx	[%l7 + 0x08],	%i5
	tsubcc	%i7,	%l0,	%g5
	ldsb	[%l7 + 0x0E],	%o3
	ldsh	[%l7 + 0x42],	%o1
	sth	%l2,	[%l7 + 0x76]
	st	%f11,	[%l7 + 0x74]
	fbu,a	%fcc0,	loop_1317
loop_1317:
	movvc	%icc,	%i4,	%g2
	pdist	%f10,	%f12,	%f8
	ldd	[%l7 + 0x10],	%f0
	sth	%g3,	[%l7 + 0x74]
	fbl	%fcc1,	loop_1318
loop_1318:
	lduh	[%l7 + 0x12],	%i0
	addcc	%l5,	0x036C,	%o4
	andncc	%i6,	%o2,	%l4
	movrlz	%g6,	0x2DB,	%o5
	stw	%o0,	[%l7 + 0x10]
	st	%f10,	[%l7 + 0x54]
	fpsub16	%f12,	%f10,	%f2
	ldsw	[%l7 + 0x6C],	%i1
	bvs,pn	%icc,	loop_1319
loop_1319:
	stw	%l3,	[%l7 + 0x2C]
	tvs	%icc,	0x3
	srl	%o7,	0x10,	%l1
	stw	%i2,	[%l7 + 0x30]
	or	%o6,	0x032D,	%i3
	ld	[%l7 + 0x10],	%f8
	ldub	[%l7 + 0x69],	%g4
	stx	%g1,	[%l7 + 0x30]
	bl,pn	%xcc,	loop_1320
loop_1320:
	movrlez	%l6,	0x08F,	%g7
	add	%i5,	%i7,	%g5
	std	%f0,	[%l7 + 0x78]
	st	%f1,	[%l7 + 0x24]
	stb	%o3,	[%l7 + 0x77]
	lduw	[%l7 + 0x34],	%o1
	mova	%icc,	%l2,	%l0
	xor	%i4,	0x0A2D,	%g3
	ldsw	[%l7 + 0x20],	%i0
	ldx	[%l7 + 0x40],	%l5
	ldsw	[%l7 + 0x08],	%o4
	stx	%i6,	[%l7 + 0x70]
	movg	%xcc,	%g2,	%o2
	stb	%g6,	[%l7 + 0x50]
	lduw	[%l7 + 0x40],	%l4
	ldub	[%l7 + 0x76],	%o0
	sth	%o5,	[%l7 + 0x2A]
	tgu	%xcc,	0x3
	andncc	%l3,	%i1,	%l1
	lduh	[%l7 + 0x2C],	%o7
	fandnot1s	%f6,	%f13,	%f14
	andn	%i2,	0x053A,	%o6
	tle	%xcc,	0x1
	fmovdleu	%xcc,	%f13,	%f6
	std	%f4,	[%l7 + 0x18]
	ldd	[%l7 + 0x20],	%f10
	fnot1	%f12,	%f2
	edge8	%g4,	%g1,	%i3
	fmovsa	%xcc,	%f14,	%f7
	edge8	%l6,	%i5,	%g7
	fcmped	%fcc2,	%f10,	%f10
	stw	%i7,	[%l7 + 0x48]
	lduh	[%l7 + 0x66],	%g5
	st	%f8,	[%l7 + 0x28]
	andn	%o1,	%o3,	%l0
	fbue	%fcc1,	loop_1321
loop_1321:
	smulcc	%i4,	%g3,	%l2
	mulx	%l5,	0x10A4,	%o4
	ldsw	[%l7 + 0x4C],	%i0
	addc	%g2,	0x0066,	%o2
	movg	%icc,	%i6,	%l4
	fmovdpos	%icc,	%f13,	%f6
	lduh	[%l7 + 0x0A],	%o0
	lduw	[%l7 + 0x70],	%o5
	std	%f2,	[%l7 + 0x10]
	umul	%g6,	%l3,	%i1
	movrgez	%l1,	%i2,	%o6
	umul	%g4,	%g1,	%o7
	movge	%icc,	%l6,	%i3
	tgu	%xcc,	0x5
	stx	%i5,	[%l7 + 0x40]
	sth	%g7,	[%l7 + 0x2A]
	movn	%xcc,	%i7,	%g5
	ld	[%l7 + 0x30],	%f6
	movle	%icc,	%o1,	%l0
	ldx	[%l7 + 0x68],	%i4
	andncc	%g3,	%l2,	%o3
	st	%f13,	[%l7 + 0x58]
	brgez	%l5,	loop_1322
loop_1322:
	fbul,a	%fcc0,	loop_1323
loop_1323:
	stw	%o4,	[%l7 + 0x10]
	ld	[%l7 + 0x48],	%f4
	movneg	%xcc,	%i0,	%g2
	ldsw	[%l7 + 0x70],	%o2
	stx	%i6,	[%l7 + 0x08]
	movleu	%xcc,	%l4,	%o5
	sth	%o0,	[%l7 + 0x6E]
	subccc	%g6,	0x0827,	%i1
	tleu	%icc,	0x7
	lduh	[%l7 + 0x52],	%l1
	alignaddr	%i2,	%l3,	%o6
	fmovrsgez	%g1,	%f15,	%f6
	ldsh	[%l7 + 0x6C],	%g4
	fmovscc	%icc,	%f10,	%f15
	fmovsn	%icc,	%f10,	%f6
	movvc	%xcc,	%l6,	%o7
	ldub	[%l7 + 0x50],	%i3
	fmovspos	%icc,	%f9,	%f2
	orncc	%g7,	0x1EF3,	%i7
	movcs	%xcc,	%g5,	%o1
	st	%f9,	[%l7 + 0x38]
	stb	%i5,	[%l7 + 0x35]
	movleu	%xcc,	%l0,	%g3
	lduw	[%l7 + 0x4C],	%i4
	ldsw	[%l7 + 0x3C],	%o3
	srlx	%l5,	0x16,	%l2
	fbge,a	%fcc1,	loop_1324
loop_1324:
	ldub	[%l7 + 0x1D],	%o4
	tge	%icc,	0x3
	te	%icc,	0x1
	ldsh	[%l7 + 0x4C],	%g2
	fpmerge	%f6,	%f8,	%f2
	edge8	%i0,	%i6,	%l4
	fmovdcc	%icc,	%f15,	%f9
	udivcc	%o2,	0x053C,	%o0
	ldd	[%l7 + 0x50],	%f6
	fmovrdgz	%g6,	%f4,	%f10
	ld	[%l7 + 0x0C],	%f2
	stb	%o5,	[%l7 + 0x46]
	move	%xcc,	%i1,	%l1
	ldd	[%l7 + 0x08],	%f8
	subccc	%l3,	0x0ED5,	%o6
	edge8l	%g1,	%i2,	%g4
	movre	%o7,	0x026,	%l6
	fnors	%f4,	%f14,	%f8
	stx	%g7,	[%l7 + 0x70]
	fbge,a	%fcc1,	loop_1325
loop_1325:
	sth	%i3,	[%l7 + 0x20]
	ldub	[%l7 + 0x2B],	%i7
	movrgez	%o1,	%g5,	%l0
	fbuge,a	%fcc3,	loop_1326
loop_1326:
	ldsw	[%l7 + 0x30],	%g3
	sth	%i4,	[%l7 + 0x4E]
	fmovsneg	%xcc,	%f8,	%f6
	ldd	[%l7 + 0x10],	%f10
	orn	%o3,	0x15AF,	%l5
	movne	%xcc,	%l2,	%i5
	st	%f7,	[%l7 + 0x68]
	fmovrde	%o4,	%f8,	%f2
	tvc	%xcc,	0x4
	ldsh	[%l7 + 0x30],	%i0
	movvc	%xcc,	%i6,	%l4
	ldd	[%l7 + 0x70],	%f4
	lduw	[%l7 + 0x64],	%o2
	std	%f2,	[%l7 + 0x30]
	movpos	%xcc,	%g2,	%g6
	ld	[%l7 + 0x70],	%f8
	mova	%icc,	%o0,	%i1
	ldub	[%l7 + 0x6D],	%l1
	edge16n	%l3,	%o6,	%o5
	ldd	[%l7 + 0x48],	%f12
	ld	[%l7 + 0x0C],	%f5
	std	%f14,	[%l7 + 0x28]
	tpos	%xcc,	0x5
	ldsh	[%l7 + 0x1C],	%g1
	ldsb	[%l7 + 0x7B],	%i2
	fmovsg	%xcc,	%f10,	%f5
	ldsb	[%l7 + 0x23],	%o7
	sth	%g4,	[%l7 + 0x60]
	xorcc	%g7,	0x049D,	%i3
	ldd	[%l7 + 0x10],	%f0
	subc	%l6,	%i7,	%o1
	stw	%l0,	[%l7 + 0x0C]
	sllx	%g3,	%i4,	%g5
	andcc	%l5,	%l2,	%o3
	lduw	[%l7 + 0x44],	%o4
	tvs	%xcc,	0x6
	fblg	%fcc3,	loop_1327
loop_1327:
	fmovsle	%xcc,	%f1,	%f12
	brgz,a	%i5,	loop_1328
loop_1328:
	alignaddrl	%i0,	%i6,	%l4
	movgu	%xcc,	%g2,	%o2
	edge16l	%g6,	%o0,	%i1
	lduh	[%l7 + 0x44],	%l1
	ldub	[%l7 + 0x2D],	%l3
	edge32	%o6,	%o5,	%g1
	lduw	[%l7 + 0x4C],	%o7
	lduw	[%l7 + 0x4C],	%i2
	fzero	%f8
	ldsb	[%l7 + 0x7A],	%g7
	smul	%i3,	0x0B72,	%g4
	addccc	%i7,	%l6,	%l0
	stx	%g3,	[%l7 + 0x40]
	sth	%o1,	[%l7 + 0x1E]
	bleu,a	loop_1329
loop_1329:
	movg	%xcc,	%i4,	%g5
	ldsw	[%l7 + 0x44],	%l2
	ldsb	[%l7 + 0x1B],	%o3
	fmul8x16au	%f9,	%f9,	%f14
	sth	%l5,	[%l7 + 0x1C]
	stb	%i5,	[%l7 + 0x15]
	stw	%o4,	[%l7 + 0x60]
	te	%xcc,	0x0
	lduw	[%l7 + 0x54],	%i0
	fpadd32	%f0,	%f8,	%f4
	ldx	[%l7 + 0x08],	%l4
	ldsb	[%l7 + 0x73],	%g2
	edge8n	%o2,	%g6,	%o0
	lduh	[%l7 + 0x30],	%i6
	lduh	[%l7 + 0x4A],	%i1
	edge8l	%l3,	%l1,	%o6
	ldx	[%l7 + 0x60],	%o5
	ldsb	[%l7 + 0x6D],	%g1
	mova	%icc,	%o7,	%g7
	std	%f0,	[%l7 + 0x40]
	udivx	%i2,	0x1C3B,	%i3
	stx	%i7,	[%l7 + 0x20]
	stx	%g4,	[%l7 + 0x40]
	sdivx	%l6,	0x0F3E,	%g3
	movne	%icc,	%l0,	%i4
	std	%f6,	[%l7 + 0x10]
	lduw	[%l7 + 0x18],	%o1
	edge16ln	%l2,	%g5,	%o3
	ldub	[%l7 + 0x23],	%i5
	addcc	%o4,	%i0,	%l4
	tge	%xcc,	0x1
	tcs	%xcc,	0x3
	sra	%l5,	%o2,	%g2
	std	%f4,	[%l7 + 0x10]
	andncc	%g6,	%o0,	%i1
	std	%f12,	[%l7 + 0x10]
	lduw	[%l7 + 0x3C],	%l3
	ldsw	[%l7 + 0x10],	%i6
	ld	[%l7 + 0x0C],	%f4
	umulcc	%o6,	0x1748,	%o5
	ldsh	[%l7 + 0x18],	%g1
	udiv	%l1,	0x0390,	%o7
	stx	%g7,	[%l7 + 0x78]
	ldsb	[%l7 + 0x75],	%i3
	std	%f10,	[%l7 + 0x50]
	fandnot2s	%f11,	%f6,	%f9
	ld	[%l7 + 0x10],	%f10
	add	%i2,	0x0B1A,	%g4
	ld	[%l7 + 0x48],	%f1
	ldsw	[%l7 + 0x50],	%i7
	movleu	%xcc,	%l6,	%l0
	ldsb	[%l7 + 0x2E],	%g3
	bcc,pn	%xcc,	loop_1330
loop_1330:
	stw	%o1,	[%l7 + 0x50]
	ldd	[%l7 + 0x70],	%f8
	movleu	%xcc,	%i4,	%l2
	ldx	[%l7 + 0x28],	%o3
	fpadd32s	%f2,	%f6,	%f13
	lduh	[%l7 + 0x70],	%g5
	edge16ln	%o4,	%i0,	%i5
	lduh	[%l7 + 0x0C],	%l4
	umul	%o2,	%l5,	%g6
	nop
	setx loop_1331, %l0, %l1
	jmpl %l1, %o0
loop_1331:
	tgu	%xcc,	0x0
	ldx	[%l7 + 0x50],	%g2
	ldsb	[%l7 + 0x5B],	%l3
	tcc	%xcc,	0x7
	fmovse	%xcc,	%f14,	%f8
	bgu,a	%xcc,	loop_1332
loop_1332:
	fbe	%fcc0,	loop_1333
loop_1333:
	stx	%i1,	[%l7 + 0x60]
	sth	%i6,	[%l7 + 0x2A]
	tvs	%xcc,	0x0
	fsrc2	%f8,	%f0
	ldsh	[%l7 + 0x12],	%o6
	ldsb	[%l7 + 0x25],	%g1
	edge16n	%l1,	%o5,	%g7
	stw	%o7,	[%l7 + 0x08]
	edge8	%i2,	%i3,	%i7
	stb	%g4,	[%l7 + 0x31]
	ldd	[%l7 + 0x18],	%f10
	ldx	[%l7 + 0x30],	%l0
	lduw	[%l7 + 0x68],	%l6
	sllx	%o1,	%g3,	%i4
	ldd	[%l7 + 0x20],	%f8
	xnorcc	%l2,	0x0E0F,	%g5
	std	%f2,	[%l7 + 0x50]
	movrne	%o4,	0x0EF,	%o3
	st	%f2,	[%l7 + 0x6C]
	sth	%i5,	[%l7 + 0x46]
	fbo	%fcc0,	loop_1334
loop_1334:
	tn	%icc,	0x5
	ldsw	[%l7 + 0x34],	%i0
	st	%f6,	[%l7 + 0x64]
	sth	%l4,	[%l7 + 0x28]
	lduh	[%l7 + 0x0E],	%l5
	tleu	%icc,	0x4
	alignaddrl	%o2,	%g6,	%g2
	ta	%xcc,	0x5
	fands	%f5,	%f15,	%f5
	lduw	[%l7 + 0x18],	%o0
	ldsw	[%l7 + 0x10],	%i1
	tn	%xcc,	0x0
	fornot2	%f0,	%f6,	%f14
	st	%f5,	[%l7 + 0x6C]
	ldd	[%l7 + 0x68],	%f8
	ldub	[%l7 + 0x7E],	%i6
	ldsh	[%l7 + 0x34],	%l3
	fmovsle	%xcc,	%f0,	%f2
	stx	%o6,	[%l7 + 0x28]
	ldsb	[%l7 + 0x2F],	%l1
	fmovrdne	%g1,	%f10,	%f14
	sth	%g7,	[%l7 + 0x3A]
	ldx	[%l7 + 0x70],	%o5
	movgu	%xcc,	%o7,	%i2
	movge	%icc,	%i3,	%i7
	srax	%l0,	%g4,	%o1
	fmovsn	%icc,	%f12,	%f15
	stx	%l6,	[%l7 + 0x18]
	sth	%i4,	[%l7 + 0x24]
	ldsb	[%l7 + 0x3E],	%g3
	edge32	%l2,	%g5,	%o4
	sth	%o3,	[%l7 + 0x1E]
	srl	%i5,	0x0A,	%i0
	stw	%l4,	[%l7 + 0x54]
	std	%f12,	[%l7 + 0x10]
	brlez,a	%o2,	loop_1335
loop_1335:
	ldsw	[%l7 + 0x0C],	%l5
	movl	%xcc,	%g6,	%o0
	ldd	[%l7 + 0x70],	%f8
	lduh	[%l7 + 0x42],	%g2
	st	%f6,	[%l7 + 0x70]
	fpadd32s	%f8,	%f2,	%f6
	bg,pt	%icc,	loop_1336
loop_1336:
	andcc	%i1,	%l3,	%o6
	fxnors	%f2,	%f1,	%f10
	bvc,pt	%xcc,	loop_1337
loop_1337:
	movleu	%icc,	%l1,	%i6
	ldsb	[%l7 + 0x24],	%g1
	fandnot1s	%f9,	%f10,	%f7
	ldx	[%l7 + 0x78],	%g7
	bpos,a	%xcc,	loop_1338
loop_1338:
	ldsh	[%l7 + 0x12],	%o5
	fmovsa	%xcc,	%f6,	%f4
	ba	%xcc,	loop_1339
loop_1339:
	fsrc2	%f12,	%f2
	orncc	%o7,	0x17F8,	%i2
	sth	%i7,	[%l7 + 0x60]
	tpos	%xcc,	0x1
	fcmpgt32	%f0,	%f8,	%l0
	ta	%icc,	0x2
	fornot2	%f14,	%f0,	%f14
	stw	%i3,	[%l7 + 0x44]
	ld	[%l7 + 0x40],	%f12
	ldx	[%l7 + 0x68],	%o1
	sdiv	%g4,	0x0A67,	%l6
	std	%f8,	[%l7 + 0x68]
	fmovrse	%g3,	%f14,	%f7
	bvc,pt	%icc,	loop_1340
loop_1340:
	popc	%i4,	%l2
	fba,a	%fcc0,	loop_1341
loop_1341:
	stx	%g5,	[%l7 + 0x40]
	lduh	[%l7 + 0x20],	%o3
	stw	%o4,	[%l7 + 0x7C]
	ldd	[%l7 + 0x70],	%f0
	ldsh	[%l7 + 0x1E],	%i0
	bgu,pn	%xcc,	loop_1342
loop_1342:
	nop
	setx loop_1343, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1343:
	fsrc2s	%f7,	%f15
	tsubcctv	%l4,	%i5,	%l5
	ld	[%l7 + 0x40],	%f2
	alignaddrl	%g6,	%o0,	%o2
	ldsw	[%l7 + 0x24],	%g2
	st	%f2,	[%l7 + 0x40]
	lduw	[%l7 + 0x64],	%i1
	ldsh	[%l7 + 0x3E],	%l3
	srlx	%l1,	%i6,	%g1
	fbule	%fcc0,	loop_1344
loop_1344:
	stw	%g7,	[%l7 + 0x50]
	ldsw	[%l7 + 0x24],	%o5
	srl	%o6,	0x05,	%o7
	stx	%i7,	[%l7 + 0x60]
	std	%f8,	[%l7 + 0x10]
	ldsh	[%l7 + 0x0A],	%i2
	fba,a	%fcc2,	loop_1345
loop_1345:
	edge8ln	%l0,	%i3,	%o1
	movle	%xcc,	%l6,	%g3
	andncc	%i4,	%g4,	%l2
	udiv	%o3,	0x1F76,	%g5
	fnegd	%f12,	%f6
	movleu	%icc,	%o4,	%l4
	ldd	[%l7 + 0x50],	%f0
	ldx	[%l7 + 0x60],	%i0
	ldsb	[%l7 + 0x2F],	%i5
	tvc	%icc,	0x0
	ldsw	[%l7 + 0x44],	%g6
	std	%f4,	[%l7 + 0x20]
	ldsh	[%l7 + 0x5C],	%o0
	std	%f10,	[%l7 + 0x68]
	fnors	%f13,	%f5,	%f4
	fbg,a	%fcc3,	loop_1346
loop_1346:
	movge	%icc,	%l5,	%o2
	stx	%g2,	[%l7 + 0x20]
	ldx	[%l7 + 0x18],	%l3
	stb	%l1,	[%l7 + 0x7F]
	ldsh	[%l7 + 0x26],	%i6
	ldd	[%l7 + 0x70],	%f2
	ldsb	[%l7 + 0x5E],	%g1
	lduh	[%l7 + 0x26],	%i1
	ldsw	[%l7 + 0x78],	%g7
	stx	%o5,	[%l7 + 0x58]
	sth	%o6,	[%l7 + 0x12]
	andncc	%i7,	%o7,	%i2
	ldub	[%l7 + 0x0D],	%l0
	xnorcc	%i3,	0x16FC,	%o1
	tpos	%icc,	0x6
	ldx	[%l7 + 0x78],	%g3
	fmovd	%f14,	%f0
	ldsb	[%l7 + 0x7D],	%i4
	lduw	[%l7 + 0x70],	%l6
	stw	%l2,	[%l7 + 0x68]
	umulcc	%o3,	0x1CD9,	%g5
	edge16n	%o4,	%l4,	%i0
	orcc	%g4,	%i5,	%o0
	edge16n	%l5,	%o2,	%g6
	fmovscc	%icc,	%f6,	%f0
	stb	%g2,	[%l7 + 0x6B]
	for	%f4,	%f12,	%f14
	umul	%l1,	0x060E,	%i6
	lduh	[%l7 + 0x78],	%l3
	movle	%icc,	%i1,	%g1
	tsubcc	%g7,	0x08FD,	%o5
	add	%i7,	%o7,	%i2
	ldsb	[%l7 + 0x66],	%o6
	fmovdg	%xcc,	%f15,	%f5
	sdivx	%i3,	0x0126,	%l0
	movrne	%g3,	0x001,	%i4
	movne	%xcc,	%l6,	%l2
	fnand	%f4,	%f8,	%f8
	sdivx	%o3,	0x1E53,	%g5
	fzero	%f8
	fmovsgu	%xcc,	%f15,	%f6
	mulx	%o4,	0x15BA,	%l4
	fsrc1s	%f7,	%f14
	ldd	[%l7 + 0x50],	%f2
	fmovscs	%icc,	%f15,	%f10
	movleu	%icc,	%i0,	%o1
	lduw	[%l7 + 0x24],	%g4
	andcc	%o0,	%i5,	%l5
	ldx	[%l7 + 0x78],	%o2
	xnor	%g6,	%l1,	%g2
	ldsh	[%l7 + 0x70],	%i6
	tneg	%icc,	0x7
	stb	%i1,	[%l7 + 0x7D]
	sth	%g1,	[%l7 + 0x76]
	std	%f14,	[%l7 + 0x18]
	tsubcctv	%g7,	0x197F,	%l3
	ldd	[%l7 + 0x50],	%f8
	addc	%i7,	0x08BC,	%o7
	ld	[%l7 + 0x34],	%f3
	subcc	%o5,	0x1841,	%i2
	ldx	[%l7 + 0x08],	%i3
	fbge	%fcc2,	loop_1347
loop_1347:
	stb	%o6,	[%l7 + 0x18]
	ldsw	[%l7 + 0x10],	%g3
	std	%f8,	[%l7 + 0x70]
	st	%f6,	[%l7 + 0x10]
	movn	%icc,	%l0,	%i4
	ta	%icc,	0x3
	nop
	setx loop_1348, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1348:
	stb	%l6,	[%l7 + 0x27]
	ld	[%l7 + 0x64],	%f9
	edge32n	%l2,	%o3,	%g5
	edge16	%l4,	%o4,	%o1
	ldub	[%l7 + 0x4A],	%i0
	edge16n	%g4,	%o0,	%l5
	andn	%o2,	0x1840,	%g6
	bge,a	loop_1349
loop_1349:
	ldsw	[%l7 + 0x44],	%i5
	fba	%fcc2,	loop_1350
loop_1350:
	ldx	[%l7 + 0x50],	%g2
	bcc,a,pt	%icc,	loop_1351
loop_1351:
	ldx	[%l7 + 0x40],	%l1
	udivx	%i1,	0x16CE,	%g1
	ldx	[%l7 + 0x60],	%g7
	umulcc	%l3,	0x18DA,	%i7
	fors	%f7,	%f11,	%f3
	fnors	%f14,	%f15,	%f8
	ldd	[%l7 + 0x18],	%f14
	lduh	[%l7 + 0x0A],	%o7
	edge32l	%i6,	%i2,	%i3
	st	%f14,	[%l7 + 0x70]
	tsubcc	%o5,	%g3,	%l0
	sth	%i4,	[%l7 + 0x58]
	ldsw	[%l7 + 0x40],	%o6
	fcmpes	%fcc3,	%f12,	%f3
	and	%l6,	0x19B8,	%l2
	stb	%g5,	[%l7 + 0x4A]
	bn,a	%xcc,	loop_1352
loop_1352:
	xorcc	%o3,	%o4,	%l4
	ldub	[%l7 + 0x1E],	%i0
	xorcc	%o1,	%o0,	%g4
	ld	[%l7 + 0x60],	%f6
	lduw	[%l7 + 0x10],	%l5
	edge8l	%o2,	%i5,	%g2
	lduw	[%l7 + 0x50],	%l1
	tg	%xcc,	0x1
	sdiv	%i1,	0x1777,	%g6
	ldub	[%l7 + 0x6E],	%g7
	tl	%icc,	0x6
	std	%f6,	[%l7 + 0x78]
	ldsw	[%l7 + 0x7C],	%g1
	sdivcc	%i7,	0x0BD2,	%o7
	fpadd32s	%f0,	%f13,	%f12
	te	%icc,	0x0
	stx	%i6,	[%l7 + 0x18]
	ldd	[%l7 + 0x20],	%f4
	fbne	%fcc3,	loop_1353
loop_1353:
	edge8	%l3,	%i3,	%o5
	ldx	[%l7 + 0x78],	%g3
	movl	%xcc,	%l0,	%i2
	ldub	[%l7 + 0x7F],	%o6
	array16	%l6,	%l2,	%g5
	fmovdleu	%icc,	%f14,	%f15
	ldub	[%l7 + 0x5A],	%o3
	tneg	%icc,	0x3
	ldd	[%l7 + 0x48],	%f4
	ldsh	[%l7 + 0x54],	%i4
	movn	%xcc,	%l4,	%i0
	std	%f10,	[%l7 + 0x58]
	ldsw	[%l7 + 0x24],	%o4
	stw	%o1,	[%l7 + 0x68]
	orcc	%o0,	%g4,	%o2
	sth	%l5,	[%l7 + 0x6C]
	ldx	[%l7 + 0x70],	%g2
	orcc	%i5,	0x0D55,	%i1
	stw	%g6,	[%l7 + 0x54]
	ld	[%l7 + 0x24],	%f6
	std	%f6,	[%l7 + 0x70]
	st	%f13,	[%l7 + 0x3C]
	fcmpeq16	%f10,	%f2,	%l1
	ldsh	[%l7 + 0x7A],	%g1
	stw	%i7,	[%l7 + 0x28]
	fmovdge	%icc,	%f7,	%f11
	lduw	[%l7 + 0x48],	%o7
	tg	%xcc,	0x7
	ld	[%l7 + 0x54],	%f13
	edge8n	%i6,	%g7,	%i3
	taddcctv	%l3,	0x1A3E,	%g3
	ldsh	[%l7 + 0x46],	%o5
	lduw	[%l7 + 0x38],	%l0
	lduw	[%l7 + 0x3C],	%i2
	xorcc	%o6,	%l2,	%l6
	st	%f1,	[%l7 + 0x40]
	alignaddr	%o3,	%g5,	%l4
	te	%icc,	0x0
	nop
	setx loop_1354, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1354:
	xnor	%i0,	%o4,	%i4
	bvc,pt	%xcc,	loop_1355
loop_1355:
	fbug,a	%fcc3,	loop_1356
loop_1356:
	ldx	[%l7 + 0x60],	%o0
	fmul8x16	%f10,	%f0,	%f14
	tle	%xcc,	0x0
	array16	%g4,	%o1,	%o2
	smul	%l5,	0x035D,	%i5
	ld	[%l7 + 0x24],	%f14
	sth	%g2,	[%l7 + 0x20]
	sth	%g6,	[%l7 + 0x76]
	lduw	[%l7 + 0x24],	%l1
	ldsh	[%l7 + 0x3E],	%i1
	ldsb	[%l7 + 0x52],	%g1
	ble,pn	%xcc,	loop_1357
loop_1357:
	xnorcc	%o7,	%i7,	%g7
	ld	[%l7 + 0x40],	%f4
	bcs	loop_1358
loop_1358:
	sth	%i3,	[%l7 + 0x70]
	fmovdgu	%xcc,	%f5,	%f8
	lduw	[%l7 + 0x68],	%l3
	st	%f9,	[%l7 + 0x5C]
	fnand	%f12,	%f6,	%f2
	umulcc	%g3,	%o5,	%i6
	orn	%i2,	%o6,	%l0
	lduh	[%l7 + 0x0A],	%l6
	bshuffle	%f0,	%f12,	%f0
	ld	[%l7 + 0x28],	%f5
	ldd	[%l7 + 0x60],	%f6
	ld	[%l7 + 0x28],	%f11
	sethi	0x1F5C,	%l2
	movle	%xcc,	%g5,	%l4
	ldd	[%l7 + 0x60],	%f12
	edge32l	%o3,	%o4,	%i0
	ta	%icc,	0x6
	xor	%i4,	%o0,	%g4
	taddcc	%o2,	%l5,	%i5
	fpsub32	%f0,	%f10,	%f10
	movrgz	%o1,	%g2,	%g6
	std	%f4,	[%l7 + 0x60]
	edge16l	%i1,	%g1,	%l1
	ldub	[%l7 + 0x7C],	%i7
	orn	%o7,	%g7,	%i3
	xorcc	%g3,	0x08BA,	%l3
	lduw	[%l7 + 0x5C],	%o5
	ldsb	[%l7 + 0x7B],	%i2
	array32	%i6,	%l0,	%o6
	edge16n	%l2,	%l6,	%l4
	ldd	[%l7 + 0x60],	%f14
	fmovrsgez	%g5,	%f0,	%f14
	ldx	[%l7 + 0x28],	%o3
	ld	[%l7 + 0x34],	%f4
	st	%f2,	[%l7 + 0x3C]
	ldsh	[%l7 + 0x1A],	%i0
	lduw	[%l7 + 0x08],	%o4
	edge8	%o0,	%g4,	%i4
	tl	%icc,	0x3
	std	%f12,	[%l7 + 0x18]
	ldub	[%l7 + 0x60],	%o2
	srax	%i5,	0x02,	%o1
	fmovsle	%icc,	%f0,	%f12
	tge	%icc,	0x1
	std	%f4,	[%l7 + 0x20]
	ldsb	[%l7 + 0x5B],	%l5
	fbule	%fcc1,	loop_1359
loop_1359:
	sth	%g2,	[%l7 + 0x36]
	sth	%i1,	[%l7 + 0x42]
	tsubcc	%g1,	%l1,	%i7
	orncc	%o7,	0x028C,	%g6
	fmovdge	%xcc,	%f10,	%f14
	fbe	%fcc0,	loop_1360
loop_1360:
	movvs	%xcc,	%g7,	%g3
	bneg,a	%xcc,	loop_1361
loop_1361:
	fmovrdgez	%l3,	%f6,	%f6
	fbge	%fcc3,	loop_1362
loop_1362:
	stw	%o5,	[%l7 + 0x50]
	ldsw	[%l7 + 0x70],	%i3
	orncc	%i6,	0x1C6B,	%i2
	ldsw	[%l7 + 0x5C],	%l0
	ldsh	[%l7 + 0x08],	%o6
	tleu	%icc,	0x5
	fbu	%fcc0,	loop_1363
loop_1363:
	movcc	%xcc,	%l2,	%l6
	ldsb	[%l7 + 0x26],	%g5
	st	%f9,	[%l7 + 0x30]
	lduw	[%l7 + 0x24],	%o3
	ld	[%l7 + 0x44],	%f0
	std	%f0,	[%l7 + 0x40]
	udivcc	%i0,	0x1960,	%l4
	fsrc1s	%f5,	%f3
	fmovs	%f12,	%f1
	brnz	%o4,	loop_1364
loop_1364:
	ldd	[%l7 + 0x38],	%f4
	fbul,a	%fcc2,	loop_1365
loop_1365:
	edge32	%o0,	%i4,	%g4
	lduw	[%l7 + 0x20],	%o2
	ldsh	[%l7 + 0x6E],	%o1
	stx	%i5,	[%l7 + 0x10]
	edge8l	%l5,	%i1,	%g2
	taddcc	%l1,	0x0238,	%i7
	fbne,a	%fcc3,	loop_1366
loop_1366:
	mulx	%g1,	%o7,	%g7
	bgu,pn	%xcc,	loop_1367
loop_1367:
	stb	%g3,	[%l7 + 0x14]
	ldub	[%l7 + 0x53],	%g6
	movcs	%xcc,	%l3,	%i3
	bpos,pn	%xcc,	loop_1368
loop_1368:
	ldd	[%l7 + 0x28],	%f0
	taddcctv	%o5,	0x1CAB,	%i6
	stb	%i2,	[%l7 + 0x64]
	stw	%l0,	[%l7 + 0x44]
	tn	%icc,	0x7
	fpsub32s	%f4,	%f15,	%f14
	fnegd	%f2,	%f6
	tcs	%icc,	0x7
	std	%f8,	[%l7 + 0x20]
	call	loop_1369
loop_1369:
	fmovrdne	%l2,	%f8,	%f10
	fmovs	%f12,	%f9
	sth	%o6,	[%l7 + 0x56]
	orcc	%g5,	0x0F39,	%l6
	taddcctv	%i0,	%l4,	%o3
	movneg	%icc,	%o0,	%i4
	lduh	[%l7 + 0x4C],	%g4
	fbue,a	%fcc0,	loop_1370
loop_1370:
	fpadd32	%f0,	%f8,	%f2
	edge16	%o2,	%o4,	%o1
	ldd	[%l7 + 0x08],	%f0
	orn	%l5,	0x1A79,	%i5
	alignaddrl	%g2,	%l1,	%i7
	mulx	%g1,	%o7,	%g7
	ldub	[%l7 + 0x35],	%i1
	fmovdneg	%icc,	%f7,	%f11
	and	%g3,	%l3,	%i3
	tvs	%icc,	0x3
	smul	%o5,	0x0F6E,	%g6
	ld	[%l7 + 0x54],	%f0
	addc	%i2,	%l0,	%l2
	ldub	[%l7 + 0x28],	%o6
	ld	[%l7 + 0x48],	%f6
	st	%f2,	[%l7 + 0x10]
	ldsw	[%l7 + 0x50],	%g5
	umul	%i6,	0x0C50,	%l6
	fmovdvs	%icc,	%f5,	%f2
	movne	%icc,	%i0,	%o3
	lduw	[%l7 + 0x08],	%l4
	lduh	[%l7 + 0x34],	%o0
	lduh	[%l7 + 0x7E],	%i4
	lduh	[%l7 + 0x64],	%o2
	stb	%g4,	[%l7 + 0x14]
	lduw	[%l7 + 0x58],	%o4
	movle	%icc,	%o1,	%i5
	stx	%g2,	[%l7 + 0x30]
	st	%f12,	[%l7 + 0x6C]
	ldsb	[%l7 + 0x77],	%l1
	ldsh	[%l7 + 0x66],	%l5
	ld	[%l7 + 0x08],	%f8
	sth	%i7,	[%l7 + 0x5C]
	orncc	%g1,	0x0425,	%g7
	bneg,a	loop_1371
loop_1371:
	edge16	%o7,	%g3,	%i1
	ld	[%l7 + 0x44],	%f7
	fcmps	%fcc0,	%f8,	%f0
	array32	%i3,	%o5,	%l3
	stx	%g6,	[%l7 + 0x50]
	movne	%icc,	%i2,	%l0
	stx	%l2,	[%l7 + 0x30]
	ldsw	[%l7 + 0x30],	%o6
	fxor	%f6,	%f0,	%f2
	fpadd32	%f12,	%f8,	%f4
	fcmpgt16	%f2,	%f4,	%g5
	srl	%i6,	%i0,	%o3
	fandnot2s	%f6,	%f4,	%f13
	ld	[%l7 + 0x38],	%f13
	xorcc	%l4,	0x1E16,	%o0
	lduh	[%l7 + 0x62],	%i4
	mova	%icc,	%o2,	%l6
	andcc	%o4,	0x16F7,	%o1
	ldd	[%l7 + 0x28],	%f2
	fandnot2s	%f6,	%f5,	%f9
	tsubcc	%i5,	0x08F8,	%g4
	lduh	[%l7 + 0x72],	%g2
	sth	%l5,	[%l7 + 0x0E]
	sll	%l1,	0x0F,	%i7
	edge32n	%g7,	%o7,	%g3
	movcs	%xcc,	%i1,	%i3
	sth	%o5,	[%l7 + 0x58]
	ldub	[%l7 + 0x41],	%g1
	fsrc2	%f12,	%f0
	fors	%f5,	%f5,	%f7
	ldub	[%l7 + 0x10],	%l3
	sll	%i2,	%g6,	%l0
	movg	%xcc,	%l2,	%o6
	fzero	%f2
	faligndata	%f10,	%f10,	%f2
	addc	%g5,	0x13C6,	%i6
	fcmple16	%f0,	%f2,	%o3
	fmovsvc	%xcc,	%f2,	%f3
	sth	%l4,	[%l7 + 0x26]
	fmovsa	%xcc,	%f12,	%f8
	smulcc	%o0,	0x19AE,	%i0
	tvs	%xcc,	0x6
	movle	%icc,	%i4,	%o2
	fones	%f5
	ldsh	[%l7 + 0x6C],	%o4
	st	%f11,	[%l7 + 0x38]
	mulscc	%o1,	%i5,	%l6
	std	%f4,	[%l7 + 0x58]
	movn	%xcc,	%g4,	%l5
	brlz,a	%g2,	loop_1372
loop_1372:
	stx	%i7,	[%l7 + 0x40]
	ldsw	[%l7 + 0x6C],	%l1
	sdivcc	%g7,	0x0A79,	%g3
	subcc	%i1,	%o7,	%i3
	ldsb	[%l7 + 0x66],	%g1
	ldsh	[%l7 + 0x46],	%o5
	ta	%icc,	0x5
	fand	%f4,	%f2,	%f6
	brz	%i2,	loop_1373
loop_1373:
	ldd	[%l7 + 0x48],	%f14
	stx	%g6,	[%l7 + 0x40]
	bgu,a,pn	%icc,	loop_1374
loop_1374:
	ldub	[%l7 + 0x5E],	%l0
	ld	[%l7 + 0x5C],	%f2
	fmul8sux16	%f6,	%f10,	%f4
	ldsb	[%l7 + 0x4A],	%l3
	popc	%l2,	%g5
	stw	%o6,	[%l7 + 0x38]
	array8	%i6,	%o3,	%o0
	ta	%xcc,	0x3
	ld	[%l7 + 0x74],	%f0
	tpos	%icc,	0x3
	movrgz	%l4,	0x3CE,	%i4
	udivx	%i0,	0x19B3,	%o2
	lduh	[%l7 + 0x44],	%o1
	fmovrde	%i5,	%f0,	%f6
	movleu	%xcc,	%o4,	%g4
	std	%f8,	[%l7 + 0x48]
	movge	%icc,	%l5,	%l6
	ldub	[%l7 + 0x3D],	%i7
	ldx	[%l7 + 0x08],	%g2
	sth	%g7,	[%l7 + 0x1C]
	ldd	[%l7 + 0x48],	%f4
	fmovrse	%l1,	%f0,	%f13
	ld	[%l7 + 0x68],	%f7
	movrgz	%i1,	%o7,	%i3
	sra	%g3,	0x00,	%g1
	stx	%i2,	[%l7 + 0x30]
	movcc	%xcc,	%g6,	%l0
	movcs	%xcc,	%o5,	%l2
	ldsw	[%l7 + 0x40],	%l3
	fmovdvc	%xcc,	%f6,	%f8
	sethi	0x0CEF,	%g5
	fmovrde	%o6,	%f10,	%f12
	tpos	%icc,	0x5
	tle	%xcc,	0x6
	movrne	%o3,	%o0,	%i6
	fornot2s	%f2,	%f6,	%f10
	ldx	[%l7 + 0x60],	%l4
	stb	%i0,	[%l7 + 0x5A]
	movrgez	%i4,	%o2,	%i5
	movrlz	%o1,	0x099,	%g4
	ba,pt	%xcc,	loop_1375
loop_1375:
	ldx	[%l7 + 0x40],	%o4
	taddcc	%l5,	0x04A1,	%i7
	ldsb	[%l7 + 0x56],	%g2
	sth	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x18],	%g7
	addcc	%l1,	0x03D8,	%i1
	ldsw	[%l7 + 0x68],	%o7
	movneg	%icc,	%g3,	%i3
	ldsh	[%l7 + 0x5A],	%g1
	stw	%g6,	[%l7 + 0x64]
	ld	[%l7 + 0x30],	%f3
	stx	%i2,	[%l7 + 0x60]
	ldub	[%l7 + 0x23],	%l0
	ldub	[%l7 + 0x32],	%o5
	lduh	[%l7 + 0x28],	%l3
	ldsh	[%l7 + 0x0E],	%g5
	xnor	%l2,	0x1DB3,	%o3
	fcmpne16	%f12,	%f6,	%o6
	fnand	%f14,	%f6,	%f2
	ldsw	[%l7 + 0x28],	%o0
	tle	%icc,	0x7
	std	%f8,	[%l7 + 0x40]
	sth	%i6,	[%l7 + 0x34]
	sth	%l4,	[%l7 + 0x6A]
	tge	%xcc,	0x7
	lduh	[%l7 + 0x5C],	%i0
	ldsh	[%l7 + 0x3C],	%o2
	edge16l	%i5,	%o1,	%g4
	st	%f13,	[%l7 + 0x78]
	udiv	%o4,	0x0F15,	%l5
	tleu	%icc,	0x1
	subc	%i4,	0x1276,	%g2
	movrne	%l6,	%g7,	%i7
	sub	%l1,	0x0E35,	%o7
	tvs	%icc,	0x6
	sth	%i1,	[%l7 + 0x76]
	lduw	[%l7 + 0x50],	%g3
	alignaddr	%g1,	%g6,	%i2
	ldub	[%l7 + 0x34],	%i3
	ldd	[%l7 + 0x28],	%f8
	fmovrslz	%l0,	%f12,	%f0
	edge8n	%l3,	%o5,	%l2
	ldub	[%l7 + 0x5A],	%o3
	xorcc	%g5,	0x0E32,	%o6
	ldd	[%l7 + 0x60],	%f0
	fbe,a	%fcc0,	loop_1376
loop_1376:
	fornot2	%f2,	%f0,	%f14
	st	%f3,	[%l7 + 0x40]
	movrlz	%o0,	%i6,	%l4
	lduw	[%l7 + 0x4C],	%i0
	st	%f6,	[%l7 + 0x10]
	lduw	[%l7 + 0x70],	%i5
	stw	%o1,	[%l7 + 0x44]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type f   	: 115
!	Type cti   	: 66
!	Type i   	: 337
!	Type l   	: 482
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
main_t7:

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0x6,	%g2
	set	0x3,	%g3
	set	0xB,	%g4
	set	0x9,	%g5
	set	0x9,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xF,	%i1
	set	-0x1,	%i2
	set	-0x5,	%i3
	set	-0xA,	%i4
	set	-0xB,	%i5
	set	-0xF,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x0F858E8E,	%l0
	set	0x65F36640,	%l1
	set	0x5FE0D85C,	%l2
	set	0x040980F6,	%l3
	set	0x742327FB,	%l4
	set	0x7B8B881E,	%l5
	set	0x46EDF027,	%l6
	!# Output registers
	set	0x1198,	%o0
	set	-0x1687,	%o1
	set	0x0BDB,	%o2
	set	0x1092,	%o3
	set	0x0E68,	%o4
	set	0x1C16,	%o5
	set	-0x1206,	%o6
	set	0x08D6,	%o7

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

	fmul8x16au	%f5,	%f2,	%f0
	brgez,a	%g4,	loop_1377
loop_1377:
	fmovsle	%icc,	%f0,	%f2
	brgez,a	%o4,	loop_1378
loop_1378:
	mulscc	%o2,	%l5,	%g2
	fmul8x16al	%f10,	%f6,	%f4
	fmovrse	%l6,	%f8,	%f1
	fxnor	%f6,	%f14,	%f4
	fcmpd	%fcc3,	%f12,	%f14
	fornot1	%f12,	%f8,	%f12
	stb	%g7,	[%l7 + 0x7D]
	fmovrde	%i4,	%f6,	%f12
	nop
	setx loop_1379, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1379:
	fmovsle	%icc,	%f10,	%f4
	be,a,pn	%icc,	loop_1380
loop_1380:
	ldsb	[%l7 + 0x25],	%l1
	fnegs	%f6,	%f0
	bvs,a	loop_1381
loop_1381:
	be,a,pn	%xcc,	loop_1382
loop_1382:
	fmovrdlz	%o7,	%f14,	%f0
	fbge	%fcc1,	loop_1383
loop_1383:
	fbule,a	%fcc2,	loop_1384
loop_1384:
	fbu,a	%fcc2,	loop_1385
loop_1385:
	brlz	%i7,	loop_1386
loop_1386:
	fmovrse	%g3,	%f1,	%f6
	bcs,a,pn	%icc,	loop_1387
loop_1387:
	brlez,a	%i1,	loop_1388
loop_1388:
	edge8n	%g6,	%i2,	%i3
	brlez,a	%g1,	loop_1389
loop_1389:
	fcmpne32	%f8,	%f12,	%l3
	bpos,a,pn	%xcc,	loop_1390
loop_1390:
	fblg	%fcc2,	loop_1391
loop_1391:
	fbuge	%fcc1,	loop_1392
loop_1392:
	fcmpes	%fcc1,	%f8,	%f4
	fbul	%fcc0,	loop_1393
loop_1393:
	fbe	%fcc3,	loop_1394
loop_1394:
	fbge,a	%fcc1,	loop_1395
loop_1395:
	fmuld8ulx16	%f5,	%f12,	%f4
	fbuge,a	%fcc1,	loop_1396
loop_1396:
	fornot1	%f10,	%f2,	%f6
	brgez,a	%l0,	loop_1397
loop_1397:
	ldsh	[%l7 + 0x24],	%l2
	ld	[%l7 + 0x3C],	%f10
	movne	%xcc,	%o5,	%o3
	bneg	%xcc,	loop_1398
loop_1398:
	fble,a	%fcc3,	loop_1399
loop_1399:
	fbuge	%fcc2,	loop_1400
loop_1400:
	brgez,a	%o6,	loop_1401
loop_1401:
	fzeros	%f3
	fblg	%fcc0,	loop_1402
loop_1402:
	fornot2s	%f2,	%f4,	%f15
	fble	%fcc1,	loop_1403
loop_1403:
	fbn,a	%fcc2,	loop_1404
loop_1404:
	fmovse	%icc,	%f14,	%f12
	bcs,a,pt	%xcc,	loop_1405
loop_1405:
	fcmpes	%fcc3,	%f13,	%f0
	fmul8x16	%f3,	%f14,	%f4
	fnands	%f0,	%f4,	%f7
	brz	%g5,	loop_1406
loop_1406:
	fmovdvs	%xcc,	%f14,	%f14
	brz	%i6,	loop_1407
loop_1407:
	brgz	%o0,	loop_1408
loop_1408:
	fbug,a	%fcc2,	loop_1409
loop_1409:
	fpadd16s	%f3,	%f14,	%f12
	fand	%f10,	%f6,	%f14
	fcmps	%fcc0,	%f3,	%f7
	fmovsgu	%xcc,	%f2,	%f7
	fnor	%f10,	%f2,	%f2
	fmovdl	%icc,	%f12,	%f12
	bvs,a	%xcc,	loop_1410
loop_1410:
	fors	%f8,	%f13,	%f13
	fmovsle	%icc,	%f9,	%f15
	fnors	%f8,	%f11,	%f14
	stw	%i0,	[%l7 + 0x44]
	fmovrde	%l4,	%f10,	%f2
	fmul8ulx16	%f0,	%f14,	%f6
	ble,pn	%xcc,	loop_1411
loop_1411:
	fmovrsgez	%o1,	%f2,	%f2
	fone	%f0
	fbg,a	%fcc1,	loop_1412
loop_1412:
	brlz	%i5,	loop_1413
loop_1413:
	fbue	%fcc0,	loop_1414
loop_1414:
	fbue,a	%fcc3,	loop_1415
loop_1415:
	fmovsle	%icc,	%f12,	%f7
	fmovsneg	%icc,	%f3,	%f8
	movleu	%xcc,	%g4,	%o4
	ba	%xcc,	loop_1416
loop_1416:
	fsrc1	%f8,	%f14
	fandnot2	%f14,	%f6,	%f12
	fmovrse	%o2,	%f3,	%f15
	fpack16	%f14,	%f1
	ldsb	[%l7 + 0x6C],	%l5
	bneg,a,pt	%xcc,	loop_1417
loop_1417:
	fbo,a	%fcc1,	loop_1418
loop_1418:
	bshuffle	%f14,	%f8,	%f12
	fpadd32s	%f2,	%f2,	%f10
	brz	%g2,	loop_1419
loop_1419:
	fxnors	%f9,	%f5,	%f6
	bcc,a,pt	%xcc,	loop_1420
loop_1420:
	fmovrslez	%l6,	%f10,	%f3
	fnand	%f6,	%f12,	%f0
	bn	%xcc,	loop_1421
loop_1421:
	bl,pt	%xcc,	loop_1422
loop_1422:
	call	loop_1423
loop_1423:
	fmovrslez	%g7,	%f10,	%f7
	bgu,pn	%xcc,	loop_1424
loop_1424:
	fxnor	%f12,	%f4,	%f6
	fmovsge	%icc,	%f14,	%f1
	fxnors	%f7,	%f1,	%f12
	fmovdcc	%icc,	%f5,	%f1
	call	loop_1425
loop_1425:
	fors	%f6,	%f9,	%f2
	brlez	%i4,	loop_1426
loop_1426:
	fmovsn	%xcc,	%f4,	%f7
	fnand	%f4,	%f2,	%f12
	ble,a	loop_1427
loop_1427:
	fmovrslez	%o7,	%f14,	%f15
	brlez,a	%i7,	loop_1428
loop_1428:
	fandnot1	%f4,	%f12,	%f0
	fmovdle	%icc,	%f3,	%f7
	fmovdne	%xcc,	%f8,	%f2
	brnz	%l1,	loop_1429
loop_1429:
	bcc,pt	%icc,	loop_1430
loop_1430:
	fmovdpos	%icc,	%f11,	%f2
	udivcc	%i1,	0x15F6,	%g3
	faligndata	%f12,	%f12,	%f12
	fbo	%fcc3,	loop_1431
loop_1431:
	fmovrslez	%i2,	%f7,	%f14
	fpsub32s	%f0,	%f11,	%f13
	nop
	setx loop_1432, %l0, %l1
	jmpl %l1, %i3
loop_1432:
	sdivx	%g1,	0x0682,	%l3
	fmovsle	%icc,	%f4,	%f15
	brgz,a	%l0,	loop_1433
loop_1433:
	fnand	%f10,	%f10,	%f12
	bn,a,pn	%icc,	loop_1434
loop_1434:
	fors	%f10,	%f10,	%f10
	fbe	%fcc2,	loop_1435
loop_1435:
	bleu,pt	%xcc,	loop_1436
loop_1436:
	fcmpd	%fcc3,	%f8,	%f4
	fbg,a	%fcc0,	loop_1437
loop_1437:
	fmovde	%icc,	%f14,	%f3
	edge32ln	%g6,	%l2,	%o5
	fexpand	%f6,	%f6
	fones	%f5
	bpos,a	loop_1438
loop_1438:
	bgu	%icc,	loop_1439
loop_1439:
	brnz,a	%o3,	loop_1440
loop_1440:
	brnz	%g5,	loop_1441
loop_1441:
	pdist	%f10,	%f4,	%f12
	pdist	%f4,	%f6,	%f0
	fbul	%fcc0,	loop_1442
loop_1442:
	bne,pn	%icc,	loop_1443
loop_1443:
	fpadd32s	%f7,	%f11,	%f12
	nop
	setx loop_1444, %l0, %l1
	jmpl %l1, %o6
loop_1444:
	fbu	%fcc0,	loop_1445
loop_1445:
	bvs,pt	%icc,	loop_1446
loop_1446:
	fbne,a	%fcc2,	loop_1447
loop_1447:
	fmovsneg	%xcc,	%f1,	%f4
	fbg,a	%fcc0,	loop_1448
loop_1448:
	fbu	%fcc1,	loop_1449
loop_1449:
	brnz,a	%o0,	loop_1450
loop_1450:
	fpadd32s	%f13,	%f7,	%f11
	bge,pn	%icc,	loop_1451
loop_1451:
	fbo	%fcc2,	loop_1452
loop_1452:
	fandnot2	%f6,	%f14,	%f8
	fpackfix	%f10,	%f12
	fmovsne	%icc,	%f12,	%f0
	fbule	%fcc0,	loop_1453
loop_1453:
	fzero	%f0
	be	%xcc,	loop_1454
loop_1454:
	call	loop_1455
loop_1455:
	fmovrdne	%i6,	%f0,	%f0
	fcmpne16	%f4,	%f4,	%l4
	fbo	%fcc1,	loop_1456
loop_1456:
	brgez,a	%i0,	loop_1457
loop_1457:
	bl,a,pt	%xcc,	loop_1458
loop_1458:
	bne	loop_1459
loop_1459:
	ldsb	[%l7 + 0x69],	%i5
	fbg	%fcc2,	loop_1460
loop_1460:
	fand	%f10,	%f10,	%f8
	nop
	setx loop_1461, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1461:
	fbug,a	%fcc2,	loop_1462
loop_1462:
	bcc,a,pn	%xcc,	loop_1463
loop_1463:
	nop
	setx loop_1464, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1464:
	fpmerge	%f8,	%f9,	%f2
	fmovdvc	%icc,	%f8,	%f4
	fmovdleu	%xcc,	%f2,	%f3
	fcmpes	%fcc1,	%f3,	%f4
	fbne	%fcc2,	loop_1465
loop_1465:
	fornot1s	%f14,	%f15,	%f0
	fbo,a	%fcc0,	loop_1466
loop_1466:
	fandnot1	%f4,	%f12,	%f12
	brz,a	%o1,	loop_1467
loop_1467:
	fbge	%fcc0,	loop_1468
loop_1468:
	fpackfix	%f10,	%f8
	fpack32	%f0,	%f14,	%f6
	bshuffle	%f10,	%f10,	%f0
	fbne	%fcc0,	loop_1469
loop_1469:
	fmovrse	%o4,	%f9,	%f15
	ldx	[%l7 + 0x58],	%o2
	edge32	%l5,	%g4,	%l6
	ldsb	[%l7 + 0x78],	%g2
	movpos	%icc,	%g7,	%o7
	fmovsneg	%icc,	%f6,	%f5
	fsrc1s	%f0,	%f14
	fnot1	%f6,	%f6
	nop
	setx loop_1470, %l0, %l1
	jmpl %l1, %i7
loop_1470:
	nop
	setx loop_1471, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1471:
	for	%f12,	%f6,	%f6
	fmovdleu	%xcc,	%f8,	%f7
	brgez,a	%i4,	loop_1472
loop_1472:
	be	%icc,	loop_1473
loop_1473:
	faligndata	%f2,	%f4,	%f10
	bne,a,pt	%xcc,	loop_1474
loop_1474:
	fnors	%f10,	%f6,	%f9
	fpadd16	%f12,	%f2,	%f12
	nop
	setx loop_1475, %l0, %l1
	jmpl %l1, %i1
loop_1475:
	stb	%l1,	[%l7 + 0x61]
	fbug	%fcc2,	loop_1476
loop_1476:
	fmovdvs	%xcc,	%f0,	%f3
	brgz,a	%g3,	loop_1477
loop_1477:
	fbl,a	%fcc2,	loop_1478
loop_1478:
	ble,a,pn	%icc,	loop_1479
loop_1479:
	fmovrslez	%i2,	%f13,	%f14
	fpack32	%f10,	%f2,	%f2
	fand	%f12,	%f6,	%f2
	brlz,a	%i3,	loop_1480
loop_1480:
	fmovrdgez	%g1,	%f12,	%f0
	bvc,pt	%xcc,	loop_1481
loop_1481:
	fornot2s	%f9,	%f11,	%f5
	fbue,a	%fcc2,	loop_1482
loop_1482:
	fmovrsgz	%l3,	%f3,	%f13
	fblg	%fcc2,	loop_1483
loop_1483:
	bcc,pt	%icc,	loop_1484
loop_1484:
	stb	%l0,	[%l7 + 0x70]
	edge16l	%l2,	%g6,	%o3
	brz,a	%o5,	loop_1485
loop_1485:
	call	loop_1486
loop_1486:
	fpadd32s	%f9,	%f12,	%f9
	xor	%g5,	%o6,	%i6
	fbue,a	%fcc3,	loop_1487
loop_1487:
	fxnors	%f0,	%f11,	%f13
	fnands	%f14,	%f9,	%f1
	ble,a	%xcc,	loop_1488
loop_1488:
	ldsw	[%l7 + 0x28],	%o0
	fmovsg	%xcc,	%f3,	%f5
	fxors	%f0,	%f10,	%f14
	fmovsl	%icc,	%f2,	%f3
	pdist	%f14,	%f14,	%f6
	be,a	%xcc,	loop_1489
loop_1489:
	fabsd	%f0,	%f12
	bpos,pn	%xcc,	loop_1490
loop_1490:
	fcmpgt16	%f6,	%f4,	%i0
	bn,a	loop_1491
loop_1491:
	brgz,a	%l4,	loop_1492
loop_1492:
	fble	%fcc1,	loop_1493
loop_1493:
	nop
	setx loop_1494, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1494:
	fbue	%fcc3,	loop_1495
loop_1495:
	bneg	%xcc,	loop_1496
loop_1496:
	brz	%o1,	loop_1497
loop_1497:
	fbule	%fcc0,	loop_1498
loop_1498:
	fbe,a	%fcc3,	loop_1499
loop_1499:
	fpackfix	%f12,	%f2
	fbug,a	%fcc1,	loop_1500
loop_1500:
	std	%f2,	[%l7 + 0x58]
	bvs,pn	%icc,	loop_1501
loop_1501:
	fand	%f8,	%f4,	%f2
	std	%f2,	[%l7 + 0x08]
	xor	%i5,	%o4,	%o2
	fnand	%f12,	%f10,	%f14
	fbul	%fcc1,	loop_1502
loop_1502:
	tleu	%xcc,	0x0
	fmovsvs	%icc,	%f2,	%f7
	for	%f0,	%f6,	%f10
	fmovdpos	%icc,	%f0,	%f6
	lduw	[%l7 + 0x6C],	%g4
	bcc	loop_1503
loop_1503:
	fmuld8ulx16	%f12,	%f15,	%f12
	bneg,pt	%xcc,	loop_1504
loop_1504:
	lduw	[%l7 + 0x60],	%l5
	faligndata	%f14,	%f6,	%f14
	fmovrdgez	%l6,	%f10,	%f8
	fbue,a	%fcc1,	loop_1505
loop_1505:
	fbug	%fcc2,	loop_1506
loop_1506:
	fornot2	%f2,	%f10,	%f4
	bleu,a	%icc,	loop_1507
loop_1507:
	fandnot1	%f10,	%f8,	%f0
	bg,a,pt	%icc,	loop_1508
loop_1508:
	fexpand	%f8,	%f4
	fbg,a	%fcc0,	loop_1509
loop_1509:
	fmovsvc	%xcc,	%f15,	%f4
	fornot1	%f2,	%f8,	%f8
	ldsh	[%l7 + 0x32],	%g2
	fnot2s	%f11,	%f9
	fmul8sux16	%f12,	%f8,	%f8
	bl,pn	%xcc,	loop_1510
loop_1510:
	fblg,a	%fcc2,	loop_1511
loop_1511:
	fmovsgu	%icc,	%f6,	%f13
	fbne,a	%fcc1,	loop_1512
loop_1512:
	sth	%o7,	[%l7 + 0x30]
	bvs	%icc,	loop_1513
loop_1513:
	nop
	setx loop_1514, %l0, %l1
	jmpl %l1, %g7
loop_1514:
	lduw	[%l7 + 0x3C],	%i7
	ldsw	[%l7 + 0x1C],	%i4
	fpmerge	%f15,	%f10,	%f10
	fandnot2s	%f4,	%f5,	%f6
	bpos,a	loop_1515
loop_1515:
	fmul8ulx16	%f14,	%f8,	%f0
	lduw	[%l7 + 0x18],	%i1
	fmovde	%xcc,	%f1,	%f3
	fbule	%fcc1,	loop_1516
loop_1516:
	fbn,a	%fcc3,	loop_1517
loop_1517:
	fmovsn	%xcc,	%f1,	%f14
	fcmpd	%fcc1,	%f4,	%f4
	fpack16	%f2,	%f5
	fmovdleu	%icc,	%f7,	%f12
	ba	loop_1518
loop_1518:
	fandnot1	%f0,	%f14,	%f8
	pdist	%f12,	%f14,	%f14
	fors	%f11,	%f10,	%f3
	fmovsg	%icc,	%f3,	%f7
	brnz	%l1,	loop_1519
loop_1519:
	fornot2	%f8,	%f10,	%f2
	brgez	%g3,	loop_1520
loop_1520:
	fone	%f10
	nop
	setx loop_1521, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1521:
	fornot2	%f12,	%f12,	%f2
	fbule	%fcc1,	loop_1522
loop_1522:
	fba	%fcc1,	loop_1523
loop_1523:
	fexpand	%f5,	%f2
	stb	%i3,	[%l7 + 0x7C]
	fbuge	%fcc0,	loop_1524
loop_1524:
	ba,a	loop_1525
loop_1525:
	bl	loop_1526
loop_1526:
	bvc	%icc,	loop_1527
loop_1527:
	brlez,a	%i2,	loop_1528
loop_1528:
	bpos,a	%icc,	loop_1529
loop_1529:
	brlz,a	%g1,	loop_1530
loop_1530:
	brgez	%l0,	loop_1531
loop_1531:
	fmovrslz	%l3,	%f1,	%f8
	fmovde	%icc,	%f9,	%f4
	fcmple32	%f14,	%f12,	%l2
	bpos,a,pn	%xcc,	loop_1532
loop_1532:
	bneg,a	%icc,	loop_1533
loop_1533:
	ba,a,pn	%icc,	loop_1534
loop_1534:
	be,a	%icc,	loop_1535
loop_1535:
	brgez,a	%o3,	loop_1536
loop_1536:
	bvs,a,pn	%icc,	loop_1537
loop_1537:
	fmovsge	%icc,	%f11,	%f11
	fmovdneg	%icc,	%f5,	%f2
	fcmped	%fcc1,	%f8,	%f4
	bn,pn	%icc,	loop_1538
loop_1538:
	fpackfix	%f14,	%f12
	fnot1	%f2,	%f2
	fnot2s	%f13,	%f9
	fbn,a	%fcc0,	loop_1539
loop_1539:
	fmovrdlz	%o5,	%f10,	%f10
	bleu,a	loop_1540
loop_1540:
	fpadd16s	%f7,	%f14,	%f2
	call	loop_1541
loop_1541:
	fmovs	%f13,	%f0
	fbn,a	%fcc0,	loop_1542
loop_1542:
	fzeros	%f6
	fbne	%fcc2,	loop_1543
loop_1543:
	fmovscs	%icc,	%f15,	%f2
	fpack16	%f2,	%f14
	bge,a,pn	%xcc,	loop_1544
loop_1544:
	bl,pt	%icc,	loop_1545
loop_1545:
	fbn	%fcc2,	loop_1546
loop_1546:
	fmovdl	%xcc,	%f10,	%f10
	brnz,a	%g6,	loop_1547
loop_1547:
	bcs	loop_1548
loop_1548:
	fmovsvc	%icc,	%f10,	%f15
	ble,pn	%icc,	loop_1549
loop_1549:
	fbu,a	%fcc2,	loop_1550
loop_1550:
	fbuge	%fcc1,	loop_1551
loop_1551:
	fzero	%f0
	bne	%xcc,	loop_1552
loop_1552:
	ble,a	loop_1553
loop_1553:
	bne,pt	%xcc,	loop_1554
loop_1554:
	fmovdne	%icc,	%f5,	%f7
	be,pt	%icc,	loop_1555
loop_1555:
	fmovdge	%xcc,	%f6,	%f12
	fmovsvc	%icc,	%f1,	%f6
	nop
	setx loop_1556, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1556:
	fand	%f6,	%f6,	%f6
	fmovsge	%xcc,	%f9,	%f7
	bleu,a	%icc,	loop_1557
loop_1557:
	ba	loop_1558
loop_1558:
	fbu	%fcc2,	loop_1559
loop_1559:
	fsrc1	%f0,	%f0
	fpsub32	%f10,	%f2,	%f0
	fble	%fcc3,	loop_1560
loop_1560:
	fmovscc	%xcc,	%f2,	%f9
	bl,a	%icc,	loop_1561
loop_1561:
	fmovdpos	%xcc,	%f4,	%f7
	fcmpne32	%f8,	%f14,	%g5
	fmovsne	%xcc,	%f8,	%f3
	fmovdvs	%icc,	%f14,	%f10
	fbuge,a	%fcc3,	loop_1562
loop_1562:
	fpack32	%f10,	%f4,	%f8
	srax	%i6,	%o6,	%o0
	fble,a	%fcc0,	loop_1563
loop_1563:
	fmovrsgez	%l4,	%f1,	%f7
	fpsub16	%f0,	%f0,	%f2
	fornot1s	%f3,	%f12,	%f5
	fbule,a	%fcc3,	loop_1564
loop_1564:
	fbge	%fcc0,	loop_1565
loop_1565:
	bcs,a,pt	%icc,	loop_1566
loop_1566:
	brlez,a	%i0,	loop_1567
loop_1567:
	fmovrsgez	%i5,	%f4,	%f7
	fmovrdlz	%o4,	%f2,	%f6
	fpsub32s	%f6,	%f7,	%f10
	ldsw	[%l7 + 0x78],	%o2
	std	%f14,	[%l7 + 0x10]
	bge	%icc,	loop_1568
loop_1568:
	fbug	%fcc3,	loop_1569
loop_1569:
	fabss	%f15,	%f8
	brlz,a	%o1,	loop_1570
loop_1570:
	fbl	%fcc2,	loop_1571
loop_1571:
	bcc,pn	%icc,	loop_1572
loop_1572:
	fpsub16	%f8,	%f4,	%f12
	lduh	[%l7 + 0x2C],	%l5
	fbue	%fcc2,	loop_1573
loop_1573:
	addc	%g4,	%g2,	%l6
	fpsub16s	%f10,	%f6,	%f0
	fbule	%fcc0,	loop_1574
loop_1574:
	te	%icc,	0x2
	fmovda	%xcc,	%f3,	%f8
	stw	%o7,	[%l7 + 0x70]
	brlez,a	%g7,	loop_1575
loop_1575:
	fbne	%fcc2,	loop_1576
loop_1576:
	fpsub16s	%f5,	%f12,	%f3
	brgz	%i4,	loop_1577
loop_1577:
	nop
	setx loop_1578, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1578:
	tsubcctv	%i7,	0x0D2A,	%i1
	brgez	%l1,	loop_1579
loop_1579:
	bgu	loop_1580
loop_1580:
	fmul8x16au	%f0,	%f13,	%f8
	nop
	setx loop_1581, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1581:
	fbe	%fcc2,	loop_1582
loop_1582:
	brgz,a	%g3,	loop_1583
loop_1583:
	fmovrsgz	%i2,	%f14,	%f13
	fornot2	%f10,	%f0,	%f10
	bg,a,pn	%icc,	loop_1584
loop_1584:
	ba	loop_1585
loop_1585:
	fba	%fcc3,	loop_1586
loop_1586:
	siam	0x4
	movcs	%icc,	%g1,	%l0
	fornot1	%f4,	%f14,	%f6
	fmul8ulx16	%f6,	%f8,	%f8
	fblg	%fcc2,	loop_1587
loop_1587:
	bvc,a	loop_1588
loop_1588:
	brlz	%l3,	loop_1589
loop_1589:
	movpos	%icc,	%i3,	%l2
	fmul8x16al	%f1,	%f6,	%f14
	fandnot2	%f4,	%f12,	%f8
	bvc,pt	%xcc,	loop_1590
loop_1590:
	ldsb	[%l7 + 0x63],	%o5
	ldx	[%l7 + 0x70],	%o3
	bpos	%icc,	loop_1591
loop_1591:
	nop
	setx loop_1592, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1592:
	fand	%f6,	%f14,	%f0
	fbo,a	%fcc2,	loop_1593
loop_1593:
	alignaddr	%g5,	%g6,	%i6
	fmovdle	%xcc,	%f12,	%f3
	fble,a	%fcc3,	loop_1594
loop_1594:
	fmovrslz	%o6,	%f12,	%f1
	fmul8x16au	%f11,	%f15,	%f8
	fbug,a	%fcc3,	loop_1595
loop_1595:
	sth	%l4,	[%l7 + 0x5E]
	st	%f1,	[%l7 + 0x0C]
	bneg	%icc,	loop_1596
loop_1596:
	stx	%i0,	[%l7 + 0x78]
	bg,a,pn	%icc,	loop_1597
loop_1597:
	brgz	%i5,	loop_1598
loop_1598:
	fmovsneg	%icc,	%f0,	%f7
	fandnot1s	%f8,	%f2,	%f15
	sllx	%o0,	0x0E,	%o2
	ld	[%l7 + 0x34],	%f3
	fzeros	%f14
	fbule	%fcc0,	loop_1599
loop_1599:
	lduh	[%l7 + 0x38],	%o4
	bn,a	loop_1600
loop_1600:
	fnors	%f12,	%f14,	%f5
	stb	%l5,	[%l7 + 0x29]
	brlz	%g4,	loop_1601
loop_1601:
	fnand	%f8,	%f0,	%f4
	fabsd	%f8,	%f6
	bgu,a	loop_1602
loop_1602:
	fmovdcc	%icc,	%f13,	%f4
	fbe	%fcc1,	loop_1603
loop_1603:
	be	loop_1604
loop_1604:
	fmovdgu	%icc,	%f7,	%f3
	fmovdleu	%icc,	%f14,	%f12
	fzero	%f8
	fmovsgu	%xcc,	%f4,	%f12
	fmovda	%icc,	%f14,	%f2
	bleu,a	loop_1605
loop_1605:
	fcmpd	%fcc2,	%f10,	%f4
	nop
	setx loop_1606, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1606:
	ldub	[%l7 + 0x6B],	%g2
	fmovda	%icc,	%f2,	%f0
	fandnot2	%f14,	%f0,	%f8
	fnegd	%f2,	%f8
	fnegd	%f10,	%f4
	fbug	%fcc0,	loop_1607
loop_1607:
	fmovrse	%o1,	%f7,	%f6
	ldsw	[%l7 + 0x34],	%l6
	bne,pn	%icc,	loop_1608
loop_1608:
	fmovdneg	%xcc,	%f1,	%f0
	stw	%g7,	[%l7 + 0x18]
	fba,a	%fcc2,	loop_1609
loop_1609:
	fmovrslz	%i4,	%f0,	%f1
	fandnot1	%f14,	%f2,	%f10
	fbu,a	%fcc2,	loop_1610
loop_1610:
	ldsw	[%l7 + 0x5C],	%i7
	bg	%icc,	loop_1611
loop_1611:
	fble,a	%fcc0,	loop_1612
loop_1612:
	fmovdn	%xcc,	%f15,	%f2
	fba,a	%fcc3,	loop_1613
loop_1613:
	brnz	%o7,	loop_1614
loop_1614:
	fandnot2	%f12,	%f14,	%f8
	fbul	%fcc1,	loop_1615
loop_1615:
	fnors	%f3,	%f15,	%f11
	nop
	setx loop_1616, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1616:
	edge32ln	%l1,	%i1,	%g3
	fbuge	%fcc1,	loop_1617
loop_1617:
	bge,a	loop_1618
loop_1618:
	fornot1	%f2,	%f14,	%f6
	fcmple16	%f0,	%f12,	%g1
	sth	%l0,	[%l7 + 0x40]
	nop
	setx loop_1619, %l0, %l1
	jmpl %l1, %l3
loop_1619:
	lduh	[%l7 + 0x66],	%i3
	fbue,a	%fcc1,	loop_1620
loop_1620:
	bcc,pn	%icc,	loop_1621
loop_1621:
	bleu	%xcc,	loop_1622
loop_1622:
	stx	%i2,	[%l7 + 0x28]
	bg,a	loop_1623
loop_1623:
	fbug,a	%fcc3,	loop_1624
loop_1624:
	fornot1s	%f15,	%f8,	%f5
	fbuge,a	%fcc2,	loop_1625
loop_1625:
	ldd	[%l7 + 0x40],	%f14
	fmovsne	%xcc,	%f7,	%f14
	fbe	%fcc2,	loop_1626
loop_1626:
	fba	%fcc2,	loop_1627
loop_1627:
	nop
	setx loop_1628, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1628:
	fmovdpos	%icc,	%f11,	%f6
	ble	loop_1629
loop_1629:
	brgez	%l2,	loop_1630
loop_1630:
	fmovrsgez	%o5,	%f0,	%f14
	nop
	setx loop_1631, %l0, %l1
	jmpl %l1, %g5
loop_1631:
	fpack32	%f14,	%f0,	%f2
	fbg,a	%fcc2,	loop_1632
loop_1632:
	fbul,a	%fcc2,	loop_1633
loop_1633:
	fmovdvs	%xcc,	%f2,	%f8
	bgu,a	loop_1634
loop_1634:
	fbue,a	%fcc3,	loop_1635
loop_1635:
	fornot2	%f4,	%f10,	%f0
	bgu,a	loop_1636
loop_1636:
	mulx	%o3,	0x1914,	%g6
	fmovsneg	%icc,	%f7,	%f9
	fmovdne	%xcc,	%f14,	%f3
	fmovsvc	%icc,	%f7,	%f2
	fmuld8ulx16	%f1,	%f9,	%f6
	bn,pt	%xcc,	loop_1637
loop_1637:
	fbne	%fcc3,	loop_1638
loop_1638:
	fbne	%fcc2,	loop_1639
loop_1639:
	sth	%o6,	[%l7 + 0x52]
	fmul8sux16	%f8,	%f12,	%f12
	siam	0x3
	fcmpeq16	%f8,	%f0,	%l4
	nop
	setx loop_1640, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1640:
	fandnot1	%f4,	%f12,	%f12
	fbuge	%fcc2,	loop_1641
loop_1641:
	edge16ln	%i0,	%i5,	%i6
	fbue,a	%fcc2,	loop_1642
loop_1642:
	fble	%fcc1,	loop_1643
loop_1643:
	ldsw	[%l7 + 0x34],	%o0
	xor	%o2,	0x0B10,	%l5
	lduw	[%l7 + 0x14],	%g4
	fone	%f2
	fmovrslz	%o4,	%f3,	%f12
	movle	%xcc,	%o1,	%l6
	fmovsge	%xcc,	%f1,	%f12
	edge8l	%g2,	%i4,	%g7
	fbul	%fcc3,	loop_1644
loop_1644:
	fbn	%fcc3,	loop_1645
loop_1645:
	fmovdneg	%icc,	%f13,	%f13
	smulcc	%o7,	%i7,	%l1
	fxor	%f14,	%f12,	%f4
	bne,a,pt	%xcc,	loop_1646
loop_1646:
	fcmpgt16	%f4,	%f0,	%i1
	fcmpeq32	%f14,	%f4,	%g3
	fbo	%fcc0,	loop_1647
loop_1647:
	fcmpd	%fcc2,	%f8,	%f12
	fcmpes	%fcc1,	%f15,	%f14
	bn,pt	%icc,	loop_1648
loop_1648:
	fmovd	%f2,	%f14
	bvs,a,pt	%xcc,	loop_1649
loop_1649:
	fmovrdgez	%g1,	%f2,	%f4
	lduw	[%l7 + 0x60],	%l0
	fbue	%fcc0,	loop_1650
loop_1650:
	fmovdge	%xcc,	%f0,	%f4
	fcmpes	%fcc0,	%f8,	%f14
	fbne,a	%fcc1,	loop_1651
loop_1651:
	bpos	%xcc,	loop_1652
loop_1652:
	fmovdn	%icc,	%f3,	%f15
	sth	%i3,	[%l7 + 0x44]
	ldub	[%l7 + 0x5E],	%i2
	nop
	setx loop_1653, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1653:
	brgez	%l3,	loop_1654
loop_1654:
	ba	loop_1655
loop_1655:
	fmovrdlez	%o5,	%f2,	%f14
	movne	%xcc,	%l2,	%o3
	fmovscc	%icc,	%f12,	%f0
	bleu,a,pt	%icc,	loop_1656
loop_1656:
	std	%f14,	[%l7 + 0x38]
	fcmple16	%f12,	%f4,	%g6
	fmovsvc	%icc,	%f15,	%f14
	fandnot2s	%f14,	%f12,	%f12
	bleu,a	loop_1657
loop_1657:
	fpadd16	%f0,	%f10,	%f14
	fnands	%f2,	%f15,	%f6
	fandnot2	%f0,	%f10,	%f14
	fpsub16	%f14,	%f12,	%f2
	fmovrsne	%o6,	%f13,	%f13
	fmovdcc	%icc,	%f9,	%f10
	bneg,a	loop_1658
loop_1658:
	fbe	%fcc1,	loop_1659
loop_1659:
	bcc	%xcc,	loop_1660
loop_1660:
	stx	%g5,	[%l7 + 0x30]
	bneg,pt	%xcc,	loop_1661
loop_1661:
	fbo,a	%fcc3,	loop_1662
loop_1662:
	ldd	[%l7 + 0x60],	%f10
	fexpand	%f5,	%f4
	ble,pt	%icc,	loop_1663
loop_1663:
	bn,pt	%xcc,	loop_1664
loop_1664:
	fxnor	%f14,	%f0,	%f10
	fbne	%fcc3,	loop_1665
loop_1665:
	fcmple32	%f12,	%f0,	%l4
	fmovdvc	%icc,	%f10,	%f4
	bvs,a,pn	%icc,	loop_1666
loop_1666:
	bcc,a	loop_1667
loop_1667:
	bcs,a	loop_1668
loop_1668:
	fsrc1	%f8,	%f6
	fcmps	%fcc3,	%f3,	%f7
	fble,a	%fcc3,	loop_1669
loop_1669:
	brlez	%i5,	loop_1670
loop_1670:
	brlz,a	%i0,	loop_1671
loop_1671:
	fbu,a	%fcc0,	loop_1672
loop_1672:
	ldsw	[%l7 + 0x10],	%i6
	std	%f12,	[%l7 + 0x30]
	fmovdleu	%icc,	%f10,	%f9
	fmovdneg	%icc,	%f5,	%f0
	fandnot1	%f6,	%f14,	%f2
	bcs,pt	%xcc,	loop_1673
loop_1673:
	fabsd	%f6,	%f2
	brgz,a	%o2,	loop_1674
loop_1674:
	fbu,a	%fcc0,	loop_1675
loop_1675:
	bcc,pt	%icc,	loop_1676
loop_1676:
	fpsub32	%f4,	%f12,	%f12
	fmovdleu	%icc,	%f13,	%f14
	call	loop_1677
loop_1677:
	bne,pn	%icc,	loop_1678
loop_1678:
	fnot1s	%f15,	%f11
	fcmpne32	%f2,	%f14,	%l5
	bl,pn	%xcc,	loop_1679
loop_1679:
	fbg,a	%fcc1,	loop_1680
loop_1680:
	fbu,a	%fcc3,	loop_1681
loop_1681:
	brz	%o0,	loop_1682
loop_1682:
	fnegd	%f10,	%f2
	fmul8sux16	%f2,	%f14,	%f14
	fmovsgu	%xcc,	%f8,	%f4
	fnegs	%f10,	%f15
	fbg	%fcc3,	loop_1683
loop_1683:
	brgez	%g4,	loop_1684
loop_1684:
	bleu,pn	%xcc,	loop_1685
loop_1685:
	xnor	%o1,	0x0FF0,	%o4
	fmovrsgez	%l6,	%f5,	%f1
	brz	%i4,	loop_1686
loop_1686:
	fbo	%fcc2,	loop_1687
loop_1687:
	fbg,a	%fcc3,	loop_1688
loop_1688:
	bleu,pt	%xcc,	loop_1689
loop_1689:
	nop
	setx loop_1690, %l0, %l1
	jmpl %l1, %g7
loop_1690:
	nop
	setx loop_1691, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1691:
	fbne,a	%fcc2,	loop_1692
loop_1692:
	for	%f0,	%f8,	%f6
	nop
	setx loop_1693, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1693:
	bleu,a,pn	%icc,	loop_1694
loop_1694:
	fba	%fcc2,	loop_1695
loop_1695:
	fblg	%fcc0,	loop_1696
loop_1696:
	bpos	%xcc,	loop_1697
loop_1697:
	fbule	%fcc3,	loop_1698
loop_1698:
	faligndata	%f14,	%f0,	%f2
	brlez,a	%o7,	loop_1699
loop_1699:
	fbn	%fcc3,	loop_1700
loop_1700:
	fmovscc	%xcc,	%f6,	%f8
	bleu	%xcc,	loop_1701
loop_1701:
	bgu,a	%xcc,	loop_1702
loop_1702:
	fpsub32s	%f14,	%f13,	%f7
	fornot2s	%f14,	%f0,	%f5
	bcs,a,pt	%icc,	loop_1703
loop_1703:
	fnand	%f6,	%f2,	%f0
	fpsub16	%f0,	%f4,	%f4
	faligndata	%f10,	%f6,	%f4
	bgu,pt	%icc,	loop_1704
loop_1704:
	brz	%g2,	loop_1705
loop_1705:
	fmovde	%xcc,	%f6,	%f10
	fmul8x16al	%f1,	%f11,	%f12
	fba,a	%fcc2,	loop_1706
loop_1706:
	bn,pn	%xcc,	loop_1707
loop_1707:
	be,a	%xcc,	loop_1708
loop_1708:
	fbuge,a	%fcc0,	loop_1709
loop_1709:
	ldsw	[%l7 + 0x20],	%i7
	siam	0x5
	fnegs	%f14,	%f9
	nop
	setx loop_1710, %l0, %l1
	jmpl %l1, %i1
loop_1710:
	ldd	[%l7 + 0x20],	%f6
	fxnors	%f15,	%f1,	%f6
	fmovdg	%icc,	%f15,	%f1
	brgez,a	%g3,	loop_1711
loop_1711:
	brlz	%g1,	loop_1712
loop_1712:
	std	%f10,	[%l7 + 0x68]
	fbu,a	%fcc0,	loop_1713
loop_1713:
	stw	%l0,	[%l7 + 0x0C]
	bvs,pt	%xcc,	loop_1714
loop_1714:
	lduh	[%l7 + 0x40],	%i3
	fbug	%fcc2,	loop_1715
loop_1715:
	fmovsge	%xcc,	%f4,	%f7
	fmovsge	%xcc,	%f4,	%f15
	fbge,a	%fcc2,	loop_1716
loop_1716:
	fbug,a	%fcc2,	loop_1717
loop_1717:
	siam	0x3
	fbue,a	%fcc1,	loop_1718
loop_1718:
	fbu	%fcc2,	loop_1719
loop_1719:
	fcmpes	%fcc0,	%f7,	%f1
	fmovdn	%icc,	%f7,	%f11
	fandnot2	%f12,	%f14,	%f2
	nop
	setx loop_1720, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1720:
	be,a,pt	%icc,	loop_1721
loop_1721:
	brgz	%l1,	loop_1722
loop_1722:
	fnegd	%f0,	%f14
	fornot1s	%f8,	%f2,	%f13
	fbne	%fcc3,	loop_1723
loop_1723:
	bvc	%xcc,	loop_1724
loop_1724:
	fbue	%fcc0,	loop_1725
loop_1725:
	bgu,a	loop_1726
loop_1726:
	bl,pn	%icc,	loop_1727
loop_1727:
	fcmpne16	%f8,	%f6,	%l3
	movcc	%xcc,	%o5,	%i2
	fmovse	%xcc,	%f1,	%f0
	brlez,a	%o3,	loop_1728
loop_1728:
	fba,a	%fcc0,	loop_1729
loop_1729:
	fandnot1	%f12,	%f10,	%f10
	std	%f12,	[%l7 + 0x70]
	fmovrdne	%l2,	%f0,	%f2
	fble	%fcc3,	loop_1730
loop_1730:
	fmovsvc	%xcc,	%f15,	%f1
	fbge	%fcc3,	loop_1731
loop_1731:
	ba,pt	%icc,	loop_1732
loop_1732:
	fabss	%f11,	%f14
	fbuge	%fcc3,	loop_1733
loop_1733:
	fmovdneg	%icc,	%f5,	%f5
	movleu	%icc,	%g6,	%o6
	fpsub32s	%f13,	%f6,	%f5
	fmovde	%icc,	%f13,	%f3
	brgez	%l4,	loop_1734
loop_1734:
	fnot2s	%f7,	%f2
	fcmped	%fcc2,	%f6,	%f10
	fnot1s	%f1,	%f2
	bcs,a,pt	%icc,	loop_1735
loop_1735:
	or	%g5,	%i5,	%i0
	fmovdle	%xcc,	%f12,	%f11
	fmovdne	%xcc,	%f2,	%f3
	fmul8x16	%f8,	%f14,	%f2
	fmul8sux16	%f8,	%f6,	%f10
	brz,a	%i6,	loop_1736
loop_1736:
	fcmps	%fcc2,	%f4,	%f4
	bg,pn	%xcc,	loop_1737
loop_1737:
	fbe,a	%fcc3,	loop_1738
loop_1738:
	fcmpgt32	%f4,	%f14,	%l5
	fmovrdgez	%o0,	%f12,	%f2
	ldsw	[%l7 + 0x08],	%o2
	fmovse	%xcc,	%f0,	%f14
	ldx	[%l7 + 0x58],	%o1
	bl,a,pn	%xcc,	loop_1739
loop_1739:
	brlez,a	%g4,	loop_1740
loop_1740:
	fmovsne	%xcc,	%f15,	%f1
	fbul	%fcc3,	loop_1741
loop_1741:
	bne	%icc,	loop_1742
loop_1742:
	std	%f14,	[%l7 + 0x68]
	fmovdpos	%icc,	%f0,	%f15
	brz	%o4,	loop_1743
loop_1743:
	fsrc1	%f14,	%f10
	fpack16	%f2,	%f9
	fbug	%fcc3,	loop_1744
loop_1744:
	fmovrslz	%l6,	%f15,	%f15
	fbug	%fcc1,	loop_1745
loop_1745:
	bg,a	loop_1746
loop_1746:
	fornot2	%f6,	%f0,	%f0
	brlez,a	%i4,	loop_1747
loop_1747:
	fabsd	%f8,	%f2
	brz,a	%g7,	loop_1748
loop_1748:
	brnz,a	%g2,	loop_1749
loop_1749:
	fcmpgt32	%f4,	%f12,	%i7
	fmovd	%f6,	%f0
	fmuld8sux16	%f5,	%f10,	%f8
	stx	%o7,	[%l7 + 0x38]
	ld	[%l7 + 0x60],	%f13
	ldub	[%l7 + 0x42],	%i1
	fbe	%fcc3,	loop_1750
loop_1750:
	bge	%icc,	loop_1751
loop_1751:
	bne	%xcc,	loop_1752
loop_1752:
	fble,a	%fcc3,	loop_1753
loop_1753:
	fnor	%f12,	%f14,	%f14
	bge	loop_1754
loop_1754:
	fble	%fcc2,	loop_1755
loop_1755:
	fbug,a	%fcc2,	loop_1756
loop_1756:
	fba,a	%fcc1,	loop_1757
loop_1757:
	fmovsge	%icc,	%f9,	%f14
	fmovda	%icc,	%f5,	%f2
	ble,pt	%icc,	loop_1758
loop_1758:
	fbuge,a	%fcc2,	loop_1759
loop_1759:
	brnz	%g1,	loop_1760
loop_1760:
	ba,a	loop_1761
loop_1761:
	lduh	[%l7 + 0x38],	%g3
	fmul8sux16	%f4,	%f12,	%f12
	fbg,a	%fcc1,	loop_1762
loop_1762:
	bne	%icc,	loop_1763
loop_1763:
	edge8l	%l0,	%l1,	%l3
	fmovs	%f5,	%f13
	stb	%o5,	[%l7 + 0x43]
	fba	%fcc2,	loop_1764
loop_1764:
	fba	%fcc0,	loop_1765
loop_1765:
	fbl	%fcc3,	loop_1766
loop_1766:
	bvc	loop_1767
loop_1767:
	sdivcc	%i3,	0x043B,	%o3
	brz,a	%i2,	loop_1768
loop_1768:
	bge,pt	%icc,	loop_1769
loop_1769:
	fpsub16	%f10,	%f8,	%f4
	call	loop_1770
loop_1770:
	fba	%fcc0,	loop_1771
loop_1771:
	ba,pt	%icc,	loop_1772
loop_1772:
	fbe,a	%fcc1,	loop_1773
loop_1773:
	fmovsn	%icc,	%f4,	%f3
	bcc,a	%icc,	loop_1774
loop_1774:
	ldub	[%l7 + 0x6A],	%l2
	fmovdneg	%icc,	%f6,	%f8
	fpackfix	%f14,	%f4
	brgz	%g6,	loop_1775
loop_1775:
	fbne	%fcc3,	loop_1776
loop_1776:
	fbl	%fcc3,	loop_1777
loop_1777:
	fpsub32	%f14,	%f10,	%f4
	ble,a,pt	%icc,	loop_1778
loop_1778:
	fble,a	%fcc3,	loop_1779
loop_1779:
	fmovrslez	%o6,	%f1,	%f2
	sdiv	%l4,	0x1F1E,	%g5
	fmovsne	%icc,	%f11,	%f9
	bl,pn	%icc,	loop_1780
loop_1780:
	fbue,a	%fcc2,	loop_1781
loop_1781:
	pdist	%f4,	%f2,	%f14
	siam	0x7
	ldsw	[%l7 + 0x44],	%i5
	fbe,a	%fcc3,	loop_1782
loop_1782:
	std	%f4,	[%l7 + 0x18]
	brnz	%i6,	loop_1783
loop_1783:
	fornot1s	%f3,	%f5,	%f9
	fmovdvc	%xcc,	%f6,	%f7
	nop
	setx loop_1784, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1784:
	fmovsa	%xcc,	%f10,	%f0
	bneg,a,pt	%icc,	loop_1785
loop_1785:
	fcmpeq16	%f0,	%f2,	%i0
	stx	%o0,	[%l7 + 0x78]
	fbuge,a	%fcc3,	loop_1786
loop_1786:
	fmovdcc	%icc,	%f7,	%f13
	fbn	%fcc1,	loop_1787
loop_1787:
	fbg,a	%fcc2,	loop_1788
loop_1788:
	bcc,pn	%icc,	loop_1789
loop_1789:
	fcmps	%fcc2,	%f1,	%f11
	ba,a,pn	%xcc,	loop_1790
loop_1790:
	udivx	%l5,	0x0630,	%o1
	fsrc1	%f12,	%f6
	fnand	%f10,	%f10,	%f2
	brlez	%g4,	loop_1791
loop_1791:
	smulcc	%o4,	0x0C82,	%l6
	ldsb	[%l7 + 0x7E],	%o2
	pdist	%f10,	%f6,	%f0
	fabss	%f5,	%f12
	bl	loop_1792
loop_1792:
	bg,a,pn	%xcc,	loop_1793
loop_1793:
	fcmpeq16	%f2,	%f6,	%i4
	bgu,a	loop_1794
loop_1794:
	ble	%xcc,	loop_1795
loop_1795:
	stw	%g2,	[%l7 + 0x74]
	fmovda	%icc,	%f10,	%f1
	stb	%g7,	[%l7 + 0x3B]
	ld	[%l7 + 0x08],	%f15
	lduw	[%l7 + 0x18],	%i7
	fmovsle	%icc,	%f13,	%f8
	fpadd32	%f2,	%f10,	%f2
	fand	%f4,	%f12,	%f2
	fbl	%fcc1,	loop_1796
loop_1796:
	fnor	%f4,	%f10,	%f12
	bg	loop_1797
loop_1797:
	fnot2s	%f15,	%f1
	brlz	%o7,	loop_1798
loop_1798:
	std	%f2,	[%l7 + 0x58]
	fbg,a	%fcc1,	loop_1799
loop_1799:
	ba,a,pn	%icc,	loop_1800
loop_1800:
	ldx	[%l7 + 0x50],	%i1
	ldx	[%l7 + 0x28],	%g3
	fba	%fcc2,	loop_1801
loop_1801:
	fbge	%fcc2,	loop_1802
loop_1802:
	tsubcc	%g1,	0x18CC,	%l0
	fcmpne32	%f10,	%f10,	%l1
	bvc	%xcc,	loop_1803
loop_1803:
	fba	%fcc3,	loop_1804
loop_1804:
	fmovdle	%icc,	%f11,	%f13
	lduh	[%l7 + 0x2A],	%l3
	fmovsl	%xcc,	%f6,	%f9
	tvc	%xcc,	0x5
	fors	%f9,	%f5,	%f13
	brlez,a	%i3,	loop_1805
loop_1805:
	bge	loop_1806
loop_1806:
	stw	%o3,	[%l7 + 0x60]
	lduw	[%l7 + 0x14],	%i2
	fbn	%fcc0,	loop_1807
loop_1807:
	ble,pt	%icc,	loop_1808
loop_1808:
	fmovsneg	%xcc,	%f12,	%f5
	fcmple16	%f6,	%f0,	%l2
	fmovscs	%xcc,	%f15,	%f13
	fbne,a	%fcc0,	loop_1809
loop_1809:
	fornot1s	%f10,	%f12,	%f7
	fone	%f4
	ldub	[%l7 + 0x41],	%g6
	stb	%o5,	[%l7 + 0x2E]
	ldub	[%l7 + 0x17],	%l4
	fpadd16s	%f11,	%f2,	%f13
	fbul,a	%fcc0,	loop_1810
loop_1810:
	nop
	setx loop_1811, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1811:
	bge,a,pt	%icc,	loop_1812
loop_1812:
	std	%f0,	[%l7 + 0x50]
	edge8l	%g5,	%o6,	%i6
	fpadd32	%f6,	%f12,	%f4
	ld	[%l7 + 0x1C],	%f13
	srax	%i5,	%i0,	%o0
	fbl,a	%fcc0,	loop_1813
loop_1813:
	call	loop_1814
loop_1814:
	fbu	%fcc0,	loop_1815
loop_1815:
	smul	%o1,	0x18AE,	%g4
	fnor	%f10,	%f4,	%f0
	brlez	%o4,	loop_1816
loop_1816:
	be	%xcc,	loop_1817
loop_1817:
	bcs,a	%icc,	loop_1818
loop_1818:
	bn,a	loop_1819
loop_1819:
	fands	%f3,	%f1,	%f0
	fandnot1	%f6,	%f10,	%f12
	fbuge,a	%fcc0,	loop_1820
loop_1820:
	bg,pt	%xcc,	loop_1821
loop_1821:
	fandnot1s	%f13,	%f0,	%f7
	fnor	%f10,	%f10,	%f2
	brnz,a	%l5,	loop_1822
loop_1822:
	fba	%fcc1,	loop_1823
loop_1823:
	bl	loop_1824
loop_1824:
	nop
	setx loop_1825, %l0, %l1
	jmpl %l1, %o2
loop_1825:
	fbo,a	%fcc3,	loop_1826
loop_1826:
	bleu,a	%icc,	loop_1827
loop_1827:
	fnot1	%f8,	%f14
	nop
	setx loop_1828, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1828:
	fmovsn	%icc,	%f1,	%f15
	faligndata	%f6,	%f14,	%f14
	movcc	%xcc,	%i4,	%g2
	bne,a,pt	%xcc,	loop_1829
loop_1829:
	fandnot2	%f14,	%f0,	%f0
	fcmpgt16	%f10,	%f0,	%l6
	ba,pt	%icc,	loop_1830
loop_1830:
	st	%f13,	[%l7 + 0x20]
	movrlez	%i7,	%o7,	%i1
	fpsub32	%f2,	%f8,	%f0
	fmovrdlez	%g3,	%f14,	%f8
	fpmerge	%f13,	%f7,	%f8
	fzero	%f12
	fnor	%f14,	%f6,	%f10
	st	%f1,	[%l7 + 0x3C]
	fandnot2s	%f5,	%f15,	%f15
	fmovsn	%xcc,	%f4,	%f10
	fbg	%fcc1,	loop_1831
loop_1831:
	fbug,a	%fcc3,	loop_1832
loop_1832:
	fmovsneg	%xcc,	%f14,	%f11
	fmovsneg	%icc,	%f12,	%f14
	fbl	%fcc0,	loop_1833
loop_1833:
	umul	%g7,	0x0F70,	%l0
	fors	%f3,	%f12,	%f2
	fbuge	%fcc2,	loop_1834
loop_1834:
	fbu	%fcc1,	loop_1835
loop_1835:
	fbg,a	%fcc2,	loop_1836
loop_1836:
	ldd	[%l7 + 0x10],	%f8
	fbu,a	%fcc0,	loop_1837
loop_1837:
	bvs	%xcc,	loop_1838
loop_1838:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type f   	: 402
!	Type i   	: 46
!	Type cti   	: 462
!	Type l   	: 90
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x404B3577
.word 0xBB1EB32D
.word 0x4B380C68
.word 0x0744738E
.word 0x0D9689F6
.word 0x13C1C40F
.word 0x3DDA9717
.word 0x2E3DF9BC
.word 0x854D179B
.word 0x78704B39
.word 0x773ADCA5
.word 0xB4B3CA52
.word 0xB0F7A99E
.word 0xB4954DCF
.word 0x4E52D734
.word 0x53F17F43
.word 0x8130C178
.word 0x0A328064
.word 0x2686F44A
.word 0x67C4B3B8
.word 0x32A766BA
.word 0xBC5F52AC
.word 0xE836230E
.word 0x813FD40F
.word 0x4979503C
.word 0xD99508D8
.word 0xDD53E433
.word 0xF9002A21
.word 0x992EF6C6
.word 0x64847997
.word 0x87865D50
.word 0x7EB1F614
.word 0x8FF5E984
.word 0x20E149B3
.word 0xD31F4B3F
.word 0x4C08F23A
.word 0xDEC07BF0
.word 0x9560D5D1
.word 0x47A086AF
.word 0x2C34657E
.word 0xC85F6FF7
.word 0xD7F7A3C4
.word 0x56BAD5DE
.word 0xE51F29BD
.word 0x26624231
.word 0xD67C2757
.word 0xB8A8443E
.word 0x1F710F5C
.word 0x302D3DCC
.word 0x703C1074
.word 0x6B800EEE
.word 0xB48986CC
.word 0x8452564E
.word 0x943C2004
.word 0xAEF75BC9
.word 0x46402684
.word 0xFBD52BE0
.word 0xF9A4C519
.word 0x7871F7FF
.word 0x5590AA50
.word 0x9E8D9F8F
.word 0xFAB45BA3
.word 0xD9CCEBA8
.word 0x405B8A30
.end
