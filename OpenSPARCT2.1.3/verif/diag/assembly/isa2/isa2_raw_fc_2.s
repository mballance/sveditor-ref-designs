/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa2_raw_fc_2.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ /import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/focus/spc_basic_isa2.pl FOCUS_SEED=832373419"
.ident "BY somePerson ON Thu Jul 17 12:43:04 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa2_raw_fc_2.s,v 1.3 2007/07/05 21:59:44 drp Exp $"
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

!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x7,	%g2
	set	0xB,	%g3
	set	0x6,	%g4
	set	0x1,	%g5
	set	0xF,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x4,	%i1
	set	-0xA,	%i2
	set	-0x9,	%i3
	set	-0x6,	%i4
	set	-0x0,	%i5
	set	-0x0,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x779D567E,	%l0
	set	0x11135937,	%l1
	set	0x2926B2FF,	%l2
	set	0x6E1DCA5B,	%l3
	set	0x1F123E4B,	%l4
	set	0x3C9D1A3A,	%l5
	set	0x224814B3,	%l6
	!# Output registers
	set	0x0908,	%o0
	set	0x057A,	%o1
	set	0x0F37,	%o2
	set	0x0730,	%o3
	set	-0x1FBB,	%o4
	set	-0x0F1E,	%o5
	set	-0x1A84,	%o6
	set	0x0481,	%o7

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

	fsrc1s	%f0,	%f3
	subcc	%i0,	0x1D3A,	%g4
	brnz,a	%g4,	loop_1
	nop
	fmuld8ulx16	%f0,	%f10,	%f8
	andncc	%g4,	%g5,	%o7
loop_1:
	bneg,pt	%icc,	loop_2
	smulcc	%o7,	%i2,	%l1
	ldub	[%l7 + 0x0D],	%l0
	fmovdgu	%icc,	%f9,	%f1
loop_2:
	bgu,a	%xcc,	loop_3
	fsrc2	%f8,	%f4
	addccc	%l1,	%g7,	%g1
	nop
loop_3:
	fabsd	%f8,	%f6
	fbe,a	%fcc0,	loop_4
	fmovsvc	%xcc,	%f4,	%f14
	movrlz	%g1,	0x38A,	%i6
	sethi	0x1B1C,	%g2
loop_4:
	nop
	and	%i6,	%l3,	%i6
	tn	%xcc,	0x7
	udivcc	%i6,	0x014E,	%i0
	movre	%i0,	%g4,	%i3
	smul	%i3,	%l0,	%g6
	nop
	lduh	[%l7 + 0x14],	%i5
	fbug	%fcc2,	loop_5
	srlx	%g6,	0x1D,	%o4
	tl	%xcc,	0x3
	sra	%o4,	0x02,	%g1
loop_5:
	stw	%g1,	[%l7 + 0x40]
	addccc	%g1,	0x1816,	%l6
	fmovdge	%icc,	%f14,	%f7
	fmovdne	%icc,	%f10,	%f11
	ldub	[%l7 + 0x3A],	%g2
	stb	%l6,	[%l7 + 0x5F]
	fbuge	%fcc0,	loop_6
	nop
	setx loop_7, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	sth	%l6,	[%l7 + 0x64]
	xorcc	%l6,	%o3,	%i7
loop_6:
	tl	%icc,	0x2
loop_7:
	fand	%f8,	%f8,	%f12
	movl	%icc,	%l6,	%l1
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
	movleu	%xcc,	%i7,	%g6
	fmovdgu	%icc,	%f15,	%f7
	nop
loop_8:
	fblg,a	%fcc0,	loop_9
	stb	%g6,	[%l7 + 0x55]
	array32	%g6,	%o2,	%o5
	or	%o5,	%g2,	%i3
loop_9:
	tleu	%icc,	0x4
	fsrc1s	%f7,	%f2
	sllx	%i3,	%o4,	%i5
	andcc	%i5,	0x100F,	%o6
	fmovrse	%o6,	%f9,	%f8
	brgz	%o6,	loop_10
	sra	%o6,	0x19,	%o0
	ld	[%l7 + 0x10],	%f14
	movre	%o0,	%o6,	%l1
loop_10:
	sub	%l1,	0x1DF6,	%l2
	sth	%l2,	[%l7 + 0x20]
	ba,a	%icc,	loop_11
	ldub	[%l7 + 0x0A],	%l2
	sethi	0x0C06,	%i0
	movvc	%xcc,	%l2,	%i4
loop_11:
	tn	%xcc,	0x2
	orncc	%i4,	0x0973,	%o0
	stb	%o0,	[%l7 + 0x45]
	nop
	tl	%xcc,	0x5
	fpadd32s	%f8,	%f14,	%f9
	udivx	%o0,	0x0474,	%i4
	nop
	fpmerge	%f9,	%f7,	%f10
	brgz	%i4,	loop_12
	lduh	[%l7 + 0x74],	%g3
	movn	%icc,	%l1,	%o0
	movneg	%icc,	%i5,	%o5
loop_12:
	xor	%o5,	0x1B99,	%l4
	movg	%xcc,	%i3,	%g3
	fmovdgu	%icc,	%f14,	%f10
	srax	%g3,	0x1E,	%l5
	addc	%l5,	0x11A1,	%o0
	fmovdne	%icc,	%f4,	%f5
	fmovscc	%xcc,	%f5,	%f8
	orcc	%o0,	%g1,	%i6
	bcc,a	%xcc,	loop_13
	tg	%xcc,	0x5
	fmovrdgz	%i6,	%f6,	%f10
	addccc	%i6,	%i1,	%o5
loop_13:
	fabsd	%f10,	%f2
	orn	%o5,	%g6,	%i6
	movvs	%xcc,	%i0,	%g3
	ldd	[%l7 + 0x28],	%f4
	tcc	%icc,	0x3
	andcc	%g3,	0x1CB2,	%o0
	nop
	fands	%f8,	%f14,	%f6
	andn	%o0,	%i4,	%l5
	fbn,a	%fcc0,	loop_14
	fmovdvs	%xcc,	%f0,	%f12
	movre	%l5,	0x303,	%o7
	fmovd	%f10,	%f0
loop_14:
	nop
	smulcc	%o7,	0x08D1,	%l5
	sethi	0x0D3E,	%l4
	fbg	%fcc1,	loop_15
	stw	%l5,	[%l7 + 0x6C]
	fands	%f12,	%f0,	%f5
	fabss	%f5,	%f3
loop_15:
	movcc	%xcc,	%l4,	%i6
	nop
	ldx	[%l7 + 0x78],	%l5
	movneg	%icc,	%o7,	%o0
	orncc	%o0,	%o5,	%l5
	brlez	%l5,	loop_16
	fexpand	%f5,	%f8
	subccc	%l5,	%g3,	%l5
	std	%f10,	[%l7 + 0x10]
loop_16:
	fornot2s	%f5,	%f13,	%f1
	tg	%xcc,	0x1
	sllx	%l5,	%i6,	%o1
	tneg	%xcc,	0x5
	movne	%icc,	%o0,	%o1
	smulcc	%o1,	0x0CDA,	%o1
	fone	%f10
	xor	%o1,	0x0D02,	%o1
	smulcc	%o1,	0x095A,	%l5
	movgu	%xcc,	%l5,	%o1
	fmovsgu	%xcc,	%f10,	%f3
	fmovrdne	%o1,	%f14,	%f4
	lduh	[%l7 + 0x56],	%o1
	sub	%o1,	%o1,	%g5
	fcmple32	%f4,	%f12,	%g5
	tpos	%xcc,	0x4
	tle	%xcc,	0x6
	nop
	xorcc	%g5,	0x1E73,	%g5
	fcmpes	%fcc2,	%f12,	%f8
	xorcc	%g5,	%i2,	%g5
	tvs	%icc,	0x3
	taddcc	%g5,	0x077F,	%g5
	tcc	%icc,	0x4
	fcmpne16	%f4,	%f14,	%g5
	andncc	%g5,	%g7,	%g5
	movneg	%xcc,	%g5,	%l3
	movre	%l3,	0x3F9,	%l3
	movvs	%xcc,	%g4,	%l3
	fcmpeq16	%f4,	%f6,	%l3
	bcs	%xcc,	loop_17
	tne	%xcc,	0x6
	add	%l3,	%l0,	%l3
	tpos	%xcc,	0x3
loop_17:
	array32	%l3,	%l3,	%o3
	fbul	%fcc3,	loop_18
	srlx	%o3,	%l6,	%o3
	tsubcctv	%o3,	%o3,	%i7
	nop
loop_18:
	fmovsleu	%icc,	%f0,	%f13
	tge	%xcc,	0x4
	brlz,a	%i7,	loop_19
	orn	%i7,	0x044D,	%i7
	movrgez	%i7,	%i7,	%o2
	nop
loop_19:
	brgez,a	%o2,	loop_20
	ldub	[%l7 + 0x22],	%o2
	bge,a	%xcc,	loop_21
	movcs	%xcc,	%o2,	%g2
loop_20:
	fzeros	%f13
	movrgez	%g2,	0x32D,	%g2
loop_21:
	fbug	%fcc2,	loop_22
	bleu,a,pn	%xcc,	loop_23
	addcc	%g2,	0x0C87,	%g2
	udivcc	%g2,	0x15D6,	%g2
loop_22:
	movle	%xcc,	%g2,	%o4
loop_23:
	nop
	nop
	lduh	[%l7 + 0x42],	%o4
	movcs	%xcc,	%o4,	%o6
	movvc	%xcc,	%o6,	%l2
	sdivcc	%l2,	0x1DC5,	%l2
	ldsb	[%l7 + 0x69],	%l2
	fsrc1	%f4,	%f14
	movl	%xcc,	%l2,	%l1
	nop
	tcs	%icc,	0x4
	movle	%icc,	%l1,	%i5
	orncc	%i5,	%i5,	%i3
	ldsb	[%l7 + 0x6D],	%i3
	nop
	fandnot1	%f4,	%f2,	%f8
	fmovsvc	%xcc,	%f7,	%f12
	andncc	%i3,	%i3,	%g1
	std	%f8,	[%l7 + 0x58]
	nop
	std	%f8,	[%l7 + 0x18]
	tl	%icc,	0x5
	bvc,a,pn	%xcc,	loop_24
	nop
	fbl	%fcc2,	loop_25
	tne	%xcc,	0x6
loop_24:
	sdiv	%g1,	0x063A,	%g1
	tg	%xcc,	0x6
loop_25:
	fmul8x16au	%f12,	%f11,	%f10
	ldsh	[%l7 + 0x62],	%g1
	ldsb	[%l7 + 0x74],	%g1
	ldub	[%l7 + 0x49],	%g1
	addccc	%g1,	0x0B8D,	%g1
	addccc	%g1,	0x0C5D,	%g1
	fornot2	%f10,	%f14,	%f4
	fnot1	%f4,	%f2
	sdivcc	%g1,	0x146E,	%g1
	nop
	nop
	tsubcc	%g1,	0x1115,	%g1
	fmovsge	%icc,	%f14,	%f5
	fbug,a	%fcc1,	loop_26
	fble,a	%fcc2,	loop_27
	nop
	fmul8ulx16	%f4,	%f4,	%f12
loop_26:
	taddcc	%g1,	0x1C47,	%g1
loop_27:
	srax	%g1,	%g1,	%i1
	sll	%i1,	0x18,	%i1
	std	%f12,	[%l7 + 0x68]
	alignaddrl	%i1,	%g6,	%i1
	sdiv	%i1,	0x1C32,	%i1
	orncc	%i1,	%i1,	%i0
	bge,pt	%xcc,	loop_28
	movle	%xcc,	%i0,	%i4
	udiv	%i4,	0x02F3,	%i4
	xnorcc	%i4,	0x1F17,	%i4
loop_28:
	mulscc	%i4,	0x1FB9,	%i4
	xor	%i4,	0x1DFA,	%i4
	fbge,a	%fcc3,	loop_29
	fmovs	%f5,	%f8
	fornot1	%f12,	%f14,	%f8
	movge	%icc,	%l4,	%i4
loop_29:
	stb	%i4,	[%l7 + 0x24]
	movge	%xcc,	%i4,	%o7
	mulx	%o7,	0x0D2A,	%o7
	te	%icc,	0x6
	srlx	%o7,	%o5,	%o7
	fzeros	%f5
	std	%f8,	[%l7 + 0x48]
	mulx	%o7,	0x0A59,	%o7
	fba,a	%fcc0,	loop_30
	fmovdgu	%xcc,	%f13,	%f14
	movrgez	%o7,	%o7,	%g3
	orcc	%g3,	0x1172,	%g3
loop_30:
	fsrc1s	%f14,	%f4
	stw	%g3,	[%l7 + 0x2C]
	bcc	%icc,	loop_31
	movle	%icc,	%g3,	%i6
	nop
	stw	%i6,	[%l7 + 0x5C]
loop_31:
	sll	%i6,	0x07,	%i6
	tleu	%icc,	0x2
	tleu	%icc,	0x5
	nop
	fmovrslz	%i6,	%f10,	%f1
	movvs	%icc,	%i6,	%o0
	or	%o0,	%l5,	%o0
	udivcc	%o0,	0x0B80,	%o0
	xnorcc	%o0,	%o1,	%o0
	addccc	%o0,	%o0,	%i2
	subccc	%i2,	0x08D2,	%i2
	umul	%i2,	0x13E7,	%i2
	orn	%i2,	%g7,	%i2
	fxors	%f1,	%f3,	%f13
	movrne	%i2,	%i2,	%g5
	nop
	setx loop_32, %l0, %l1
	jmpl %l1, %g5
	bpos	%icc,	loop_33
	stx	%g5,	[%l7 + 0x20]
	fbu,a	%fcc2,	loop_34
loop_32:
	ld	[%l7 + 0x60],	%f8
loop_33:
	taddcctv	%g5,	0x1993,	%g5
	taddcc	%g5,	%g4,	%g5
loop_34:
	orcc	%g5,	0x119F,	%g5
	nop
	bcs,a,pn	%icc,	loop_35
	orn	%g5,	0x01C2,	%g5
	tvc	%icc,	0x7
	fbo,a	%fcc2,	loop_36
loop_35:
	fbul	%fcc2,	loop_37
	ldub	[%l7 + 0x0F],	%g5
	fmovsl	%xcc,	%f3,	%f4
loop_36:
	ld	[%l7 + 0x48],	%f13
loop_37:
	umulcc	%g5,	0x132A,	%g5
	stb	%g5,	[%l7 + 0x30]
	nop
	nop
	movne	%xcc,	%l0,	%g5
	tvc	%icc,	0x1
	sdiv	%g5,	0x14ED,	%g5
	movcc	%icc,	%g5,	%l3
	nop
	nop
	setx loop_38, %l0, %l1
	jmpl %l1, %l3
	ble,a	loop_39
	nop
	movrlz	%l3,	%l6,	%l3
loop_38:
	fornot1s	%f4,	%f14,	%f5
loop_39:
	tvc	%icc,	0x7
	sth	%l3,	[%l7 + 0x58]
	sethi	0x0F53,	%l3
	sdivcc	%l3,	0x00BB,	%l3
	fsrc2	%f8,	%f2
	brz,a	%l3,	loop_40
	movvs	%icc,	%o3,	%l3
	ldsh	[%l7 + 0x6C],	%l3
	xor	%l3,	0x0930,	%l3
loop_40:
	sth	%l3,	[%l7 + 0x6A]
	fbug,a	%fcc3,	loop_41
	smulcc	%l3,	%l3,	%i7
	stw	%i7,	[%l7 + 0x14]
	movrlez	%i7,	0x247,	%i7
loop_41:
	movre	%i7,	%i7,	%o2
	and	%o2,	%g2,	%o2
	subccc	%o2,	%o4,	%o2
	fxors	%f5,	%f15,	%f11
	fmovda	%icc,	%f9,	%f0
	sra	%o2,	%o2,	%o6
	nop
	fnot2	%f8,	%f2
	movrlz	%o6,	%l2,	%o6
	nop
	sth	%o6,	[%l7 + 0x6C]
	fpsub16	%f8,	%f2,	%f10
	movcs	%xcc,	%o6,	%l1
	bgu,a	%xcc,	loop_42
	movneg	%icc,	%i5,	%l1
	move	%icc,	%i3,	%l1
	smulcc	%l1,	0x0138,	%l1
loop_42:
	fzeros	%f0
	movle	%xcc,	%l1,	%g1
	movpos	%xcc,	%g6,	%g1
	ldub	[%l7 + 0x33],	%g1
	movl	%xcc,	%i1,	%g1
	fpadd16s	%f0,	%f3,	%f6
	stx	%g1,	[%l7 + 0x70]
	sll	%g1,	0x0A,	%g1
	fcmpgt16	%f10,	%f4,	%g1
	lduw	[%l7 + 0x44],	%g1
	addc	%g1,	0x1B16,	%g1
	sll	%g1,	0x12,	%g1
	nop
	tne	%xcc,	0x0
	movleu	%xcc,	%g1,	%i0
	tvc	%xcc,	0x7
	ta	%icc,	0x3
	mulx	%i0,	%i0,	%l4
	tn	%xcc,	0x3
	brgez	%l4,	loop_43
	sdiv	%l4,	0x0425,	%l4
	mulscc	%l4,	%i4,	%l4
	stb	%l4,	[%l7 + 0x4E]
loop_43:
	and	%l4,	%l4,	%o5
	alignaddrl	%o5,	%o5,	%o7
	tsubcctv	%o7,	%o7,	%g3
	tvs	%xcc,	0x4
	alignaddrl	%g3,	%i6,	%g3
	nop
	fbu	%fcc3,	loop_44
	taddcctv	%g3,	%g3,	%l5
	addcc	%l5,	0x02A2,	%l5
	movrlez	%l5,	0x331,	%l5
loop_44:
	sethi	0x1A6F,	%l5
	movcs	%icc,	%l5,	%o1
	fpadd16s	%f6,	%f13,	%f0
	mulx	%o1,	0x0542,	%o1
	fmovrslez	%o1,	%f1,	%f3
	tsubcctv	%o1,	%o0,	%o1
	nop
	ldub	[%l7 + 0x27],	%o1
	andcc	%o1,	%o1,	%g7
	std	%f10,	[%l7 + 0x40]
	addcc	%g7,	0x17A1,	%g7
	fandnot1	%f10,	%f14,	%f4
	tcs	%xcc,	0x4
	sra	%g7,	0x11,	%g7
	xnor	%g7,	0x0AC0,	%g7
	movvs	%icc,	%i2,	%g7
	smul	%g7,	0x0B66,	%g7
	srax	%g7,	%g7,	%g4
	movne	%xcc,	%l0,	%g4
	tsubcc	%g4,	0x04CE,	%g4
	fmovrdne	%g4,	%f4,	%f0
	lduw	[%l7 + 0x4C],	%g4
	fnand	%f0,	%f6,	%f6
	tne	%icc,	0x3
	alignaddr	%g4,	%g5,	%g4
	addc	%g4,	%g4,	%l6
	bcs,a,pn	%icc,	loop_45
	stb	%l6,	[%l7 + 0x7F]
	bleu,a	loop_46
	ta	%icc,	0x6
loop_45:
	movgu	%xcc,	%o3,	%l6
	fpsub32	%f6,	%f4,	%f6
loop_46:
	movrne	%l6,	0x2E7,	%l6
	movrgez	%l6,	%l3,	%l6
	fandnot1s	%f3,	%f6,	%f8
	nop
	fmovsle	%icc,	%f15,	%f3
	fcmpes	%fcc1,	%f10,	%f8
	fpadd32s	%f8,	%f4,	%f15
	brgz	%l6,	loop_47
	fmovrslz	%l6,	%f14,	%f4
	nop
	mova	%xcc,	%l6,	%i7
loop_47:
	fbe,a	%fcc2,	loop_48
	tpos	%icc,	0x7
	fcmpes	%fcc3,	%f4,	%f1
	fmovdg	%icc,	%f15,	%f3
loop_48:
	tg	%icc,	0x1
	movg	%xcc,	%i7,	%g2
	fandnot1	%f6,	%f8,	%f2
	sra	%g2,	0x13,	%g2
	bvs,pn	%xcc,	loop_49
	movge	%xcc,	%g2,	%o4
	tne	%icc,	0x1
	fpadd32	%f2,	%f8,	%f14
loop_49:
	andncc	%o4,	%o4,	%o2
	movge	%xcc,	%l2,	%o2
	subccc	%o2,	0x0098,	%o2
	movgu	%icc,	%o6,	%o2
	nop
	fbug	%fcc1,	loop_50
	fands	%f3,	%f1,	%f0
	movrlez	%o2,	%i5,	%o2
	fmul8x16au	%f0,	%f1,	%f0
loop_50:
	lduh	[%l7 + 0x40],	%o2
	tvs	%icc,	0x3
	fbule	%fcc2,	loop_51
	tpos	%icc,	0x6
	bl	loop_52
	ldsh	[%l7 + 0x10],	%o2
loop_51:
	taddcctv	%o2,	0x083A,	%o2
	tge	%xcc,	0x3
loop_52:
	sdivcc	%o2,	0x0830,	%o2
	tn	%xcc,	0x1
	stb	%o2,	[%l7 + 0x21]
	fcmple16	%f0,	%f10,	%o2
	lduh	[%l7 + 0x46],	%o2
	nop
	setx loop_53, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	array8	%o2,	%o2,	%i3
	fandnot1s	%f0,	%f14,	%f4
	orncc	%i3,	0x1281,	%i3
loop_53:
	ldsb	[%l7 + 0x39],	%i3
	brz	%i3,	loop_54
	alignaddr	%i3,	%i3,	%l1
	sdiv	%l1,	0x167C,	%l1
	movle	%xcc,	%g6,	%l1
loop_54:
	fornot2	%f0,	%f8,	%f2
	lduh	[%l7 + 0x5C],	%l1
	udiv	%l1,	0x0FFB,	%l1
	orncc	%l1,	%i1,	%l1
	brz	%l1,	loop_55
	subcc	%l1,	0x1C31,	%l1
	bneg,pt	%xcc,	loop_56
	udiv	%l1,	0x05F3,	%l1
loop_55:
	addccc	%l1,	0x1C65,	%l1
	srl	%l1,	0x17,	%l1
loop_56:
	ble	%icc,	loop_57
	ldub	[%l7 + 0x3D],	%l1
	movrne	%l1,	0x3EB,	%l1
	fbule	%fcc3,	loop_58
loop_57:
	sethi	0x1A49,	%l1
	andn	%l1,	0x0175,	%l1
	taddcctv	%l1,	0x1737,	%l1
loop_58:
	subcc	%l1,	0x0B0C,	%l1
	movrlez	%l1,	%l1,	%g1
	alignaddrl	%g1,	%g1,	%i0
	ta	%xcc,	0x6
	fpack32	%f2,	%f14,	%f4
	sub	%i0,	%i4,	%i0
	fabss	%f4,	%f14
	nop
	movvc	%xcc,	%l4,	%i0
	tn	%xcc,	0x5
	sub	%i0,	0x07F3,	%i0
	nop
	ldd	[%l7 + 0x18],	%f6
	lduh	[%l7 + 0x3E],	%i0
	ldx	[%l7 + 0x38],	%i0
	lduw	[%l7 + 0x68],	%i0
	fbue	%fcc1,	loop_59
	ldsw	[%l7 + 0x20],	%i0
	fzero	%f4
	fble	%fcc0,	loop_60
loop_59:
	sdivcc	%i0,	0x16BC,	%i0
	add	%i0,	%i0,	%o5
	smul	%o5,	%o5,	%o7
loop_60:
	fmovdg	%icc,	%f13,	%f4
	fbule	%fcc3,	loop_61
	fbl,a	%fcc3,	loop_62
	udiv	%o7,	0x1CE2,	%o7
	nop
loop_61:
	and	%o7,	%i6,	%o7
loop_62:
	subcc	%o7,	%g3,	%o7
	tpos	%xcc,	0x3
	move	%xcc,	%l5,	%o7
	movleu	%icc,	%o7,	%o0
	array32	%o0,	%o1,	%o0
	nop
	fzero	%f4
	ldx	[%l7 + 0x28],	%o0
	smul	%o0,	0x0145,	%o0
	movge	%xcc,	%o0,	%i2
	subc	%i2,	%g7,	%i2
	fornot1s	%f4,	%f5,	%f14
	and	%i2,	%l0,	%i2
	stx	%i2,	[%l7 + 0x40]
	fbo	%fcc3,	loop_63
	te	%xcc,	0x0
	fmovrdne	%i2,	%f4,	%f12
	brlez	%i2,	loop_64
loop_63:
	call	loop_65
	tvs	%xcc,	0x2
	orcc	%i2,	%i2,	%g5
loop_64:
	st	%f14,	[%l7 + 0x2C]
loop_65:
	ldd	[%l7 + 0x20],	%f4
	brz	%g5,	loop_66
	lduh	[%l7 + 0x2A],	%g5
	fbg,a	%fcc2,	loop_67
	orn	%g5,	0x1627,	%g5
loop_66:
	movl	%icc,	%g4,	%g5
	srl	%g5,	%o3,	%g5
loop_67:
	fbue	%fcc2,	loop_68
	fandnot2s	%f14,	%f7,	%f0
	movgu	%icc,	%l3,	%g5
	fsrc1	%f12,	%f0
loop_68:
	mulscc	%g5,	0x1FB5,	%g5
	st	%f0,	[%l7 + 0x1C]
	fmovrdgez	%g5,	%f10,	%f6
	subc	%g5,	0x11AD,	%g5
	subccc	%g5,	%g5,	%l6
	lduw	[%l7 + 0x64],	%l6
	fmovdle	%icc,	%f12,	%f6
	orncc	%l6,	0x12B6,	%l6
	movn	%icc,	%i7,	%l6
	nop
	setx loop_69, %l0, %l1
	jmpl %l1, %l6
	and	%l6,	%g2,	%l6
	andncc	%l6,	%o4,	%l6
	ldd	[%l7 + 0x78],	%f10
loop_69:
	ldsb	[%l7 + 0x45],	%l6
	stx	%l6,	[%l7 + 0x50]
	move	%icc,	%l2,	%l6
	sdivx	%l6,	0x1CC3,	%l6
	lduw	[%l7 + 0x78],	%l6
	subcc	%l6,	%l6,	%o6
	tgu	%xcc,	0x1
	tvs	%xcc,	0x4
	ldx	[%l7 + 0x40],	%o6
	ld	[%l7 + 0x38],	%f7
	tle	%icc,	0x2
	nop
	movge	%xcc,	%o6,	%i5
	xorcc	%i5,	0x1725,	%i5
	xorcc	%i5,	%o2,	%i5
	andncc	%i5,	%i5,	%i3
	fcmpeq16	%f6,	%f12,	%i3
	movvc	%xcc,	%g6,	%i3
	nop
	setx loop_70, %l0, %l1
	jmpl %l1, %i3
	stb	%i3,	[%l7 + 0x7C]
	sethi	0x1E71,	%i3
	nop
loop_70:
	stb	%i3,	[%l7 + 0x0F]
	tg	%xcc,	0x1
	fcmpgt16	%f6,	%f6,	%i3
	fcmpgt32	%f6,	%f8,	%i3
	tl	%xcc,	0x3
	fpadd32s	%f6,	%f0,	%f7
	orncc	%i3,	0x0D51,	%i3
	ldsw	[%l7 + 0x40],	%i3
	fandnot2	%f6,	%f2,	%f14
	nop
	fmuld8ulx16	%f7,	%f3,	%f2
	alignaddr	%i3,	%i3,	%i1
	bleu,a,pt	%icc,	loop_71
	movg	%icc,	%l1,	%i1
	bvs	loop_72
	movcs	%icc,	%g1,	%i1
loop_71:
	and	%i1,	0x121D,	%i1
	tge	%xcc,	0x5
loop_72:
	move	%icc,	%i4,	%i1
	popc	0x167B,	%i1
	andncc	%i1,	%l4,	%i1
	fbu,a	%fcc1,	loop_73
	tneg	%icc,	0x2
	stx	%i1,	[%l7 + 0x18]
	fmovrsne	%i1,	%f0,	%f2
loop_73:
	movre	%i1,	%i1,	%i0
	fmuld8sux16	%f2,	%f3,	%f2
	fmovspos	%icc,	%f13,	%f4
	fpadd16s	%f4,	%f14,	%f6
	nop
	movl	%xcc,	%o5,	%i0
	nop
	fmovdge	%xcc,	%f7,	%f5
	add	%i0,	0x0437,	%i0
	smul	%i0,	0x0245,	%i0
	tvc	%xcc,	0x2
	and	%i0,	%i6,	%i0
	popc	%i0,	%i0
	fnot1s	%f5,	%f15
	movl	%icc,	%i0,	%g3
	andcc	%g3,	0x1CC0,	%g3
	taddcc	%g3,	%l5,	%g3
	fnor	%f2,	%f12,	%f6
	udivx	%g3,	0x1501,	%g3
	fble,a	%fcc3,	loop_74
	fcmple32	%f6,	%f2,	%g3
	fpadd32	%f6,	%f2,	%f8
	nop
loop_74:
	and	%g3,	%o7,	%g3
	fmovrsgez	%g3,	%f13,	%f10
	movl	%xcc,	%o1,	%g3
	nop
	ld	[%l7 + 0x2C],	%f2
	fmul8x16al	%f10,	%f0,	%f2
	srl	%g3,	0x05,	%g3
	movg	%icc,	%g3,	%o0
	std	%f2,	[%l7 + 0x10]
	fsrc2s	%f10,	%f3
	bcs,pn	%xcc,	loop_75
	array8	%o0,	%g7,	%o0
	movrne	%o0,	0x0AF,	%o0
	fpadd32s	%f10,	%f7,	%f9
loop_75:
	nop
	fsrc2	%f2,	%f4
	movvc	%icc,	%o0,	%l0
	alignaddrl	%l0,	%l0,	%i2
	for	%f2,	%f14,	%f8
	std	%f8,	[%l7 + 0x40]
	subccc	%i2,	%i2,	%g4
	movle	%icc,	%o3,	%g4
	nop
	srax	%g4,	0x17,	%g4
	lduw	[%l7 + 0x60],	%g4
	bshuffle	%f8,	%f2,	%f10
	and	%g4,	%g4,	%l3
	fmovsn	%xcc,	%f9,	%f2
	lduh	[%l7 + 0x32],	%l3
	bcs,a,pn	%icc,	loop_76
	andn	%l3,	0x0095,	%l3
	srax	%l3,	0x0D,	%l3
	fnot1	%f10,	%f10
loop_76:
	fandnot2s	%f2,	%f12,	%f14
	tneg	%icc,	0x0
	ld	[%l7 + 0x2C],	%f3
	tsubcctv	%l3,	0x1386,	%l3
	fzero	%f10
	movg	%xcc,	%g5,	%l3
	nop
	movrgz	%l3,	0x27D,	%l3
	bvs,pn	%xcc,	loop_77
	tn	%icc,	0x7
	tsubcc	%l3,	%i7,	%l3
	xnor	%l3,	%l3,	%g2
loop_77:
	stx	%g2,	[%l7 + 0x58]
	te	%icc,	0x3
	umul	%g2,	0x0BE5,	%g2
	tle	%xcc,	0x0
	xorcc	%g2,	0x0A10,	%g2
	mova	%icc,	%g2,	%o4
	nop
	nop
	fbul,a	%fcc3,	loop_78
	fzero	%f10
	fbg	%fcc1,	loop_79
	tg	%icc,	0x5
loop_78:
	tn	%icc,	0x7
	be,a,pt	%icc,	loop_80
loop_79:
	smulcc	%o4,	%l2,	%o4
	fbug	%fcc3,	loop_81
	pdist	%f10,	%f8,	%f2
loop_80:
	taddcc	%o4,	0x1022,	%o4
	brgz	%o4,	loop_82
loop_81:
	fpsub32	%f2,	%f14,	%f6
	ldsb	[%l7 + 0x1D],	%o4
	andn	%o4,	0x158A,	%o4
loop_82:
	andncc	%o4,	%l6,	%o4
	ld	[%l7 + 0x78],	%f6
	orncc	%o4,	%o4,	%o6
	fands	%f14,	%f13,	%f5
	tsubcctv	%o6,	0x1598,	%o6
	ldsw	[%l7 + 0x14],	%o6
	smulcc	%o6,	%o6,	%o2
	movge	%xcc,	%i5,	%o2
	tl	%icc,	0x6
	nop
	sub	%o2,	%o2,	%g6
	ldx	[%l7 + 0x40],	%g6
	mulscc	%g6,	0x1EDB,	%g6
	sdivx	%g6,	0x057E,	%g6
	lduw	[%l7 + 0x14],	%g6
	alignaddrl	%g6,	%i3,	%g6
	ldx	[%l7 + 0x48],	%g6
	fmovsleu	%icc,	%f8,	%f1
	popc	%g6,	%g6
	nop
	setx loop_83, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	udiv	%g6,	0x1757,	%g6
	smulcc	%g6,	0x0D53,	%g6
	udivcc	%g6,	0x1CFD,	%g6
loop_83:
	udivx	%g6,	0x0487,	%g6
	movvs	%icc,	%g6,	%l1
	xorcc	%l1,	%g1,	%l1
	tpos	%xcc,	0x3
	tge	%xcc,	0x6
	array8	%l1,	%i4,	%l1
	srax	%l1,	%l1,	%l4
	subccc	%l4,	0x0C71,	%l4
	bg	%icc,	loop_84
	fones	%f1
	stx	%l4,	[%l7 + 0x50]
	ble,a	loop_85
loop_84:
	tg	%icc,	0x5
	fbue,a	%fcc0,	loop_86
	andn	%l4,	0x1CD7,	%l4
loop_85:
	orcc	%l4,	0x0FE4,	%l4
	fmovdge	%xcc,	%f4,	%f14
loop_86:
	array32	%l4,	%l4,	%i1
	tvc	%icc,	0x7
	movvc	%xcc,	%o5,	%i1
	ldd	[%l7 + 0x60],	%f12
	stx	%i1,	[%l7 + 0x30]
	movle	%icc,	%i1,	%i6
	array8	%i6,	%i0,	%i6
	srl	%i6,	0x0C,	%i6
	fbe	%fcc3,	loop_87
	bneg	%icc,	loop_88
	nop
	subcc	%i6,	%i6,	%l5
loop_87:
	array16	%l5,	%o7,	%l5
loop_88:
	nop
	fxor	%f6,	%f4,	%f0
	xorcc	%l5,	%l5,	%o1
	nop
	setx loop_89, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	andn	%o1,	0x1960,	%o1
	brgz,a	%o1,	loop_90
	mova	%xcc,	%g3,	%o1
loop_89:
	sethi	0x1BE0,	%o1
	fpsub16s	%f14,	%f14,	%f15
loop_90:
	fmovrdlez	%o1,	%f14,	%f10
	nop
	nop
	movcs	%xcc,	%o1,	%g7
	nop
	addc	%g7,	%g7,	%o0
	alignaddr	%o0,	%l0,	%o0
	sub	%o0,	%o0,	%i2
	stx	%i2,	[%l7 + 0x68]
	fmovspos	%xcc,	%f0,	%f7
	ba	loop_91
	fmovsvs	%xcc,	%f3,	%f6
	fmovrdgez	%i2,	%f12,	%f12
	movne	%icc,	%i2,	%o3
loop_91:
	alignaddr	%o3,	%g4,	%o3
	nop
	be,pn	%xcc,	loop_92
	orcc	%o3,	%g5,	%o3
	popc	%o3,	%o3
	tgu	%icc,	0x4
loop_92:
	sdivcc	%o3,	0x18F2,	%o3
	popc	0x0690,	%o3
	bn,a,pt	%xcc,	loop_93
	orcc	%o3,	0x0E12,	%o3
	stw	%o3,	[%l7 + 0x5C]
	bpos,a	%xcc,	loop_94
loop_93:
	andcc	%o3,	%i7,	%o3
	sdivx	%o3,	0x1F1E,	%o3
	fnot2s	%f6,	%f7
loop_94:
	sdivcc	%o3,	0x1159,	%o3
	fba	%fcc1,	loop_95
	sub	%o3,	%o3,	%l3
	nop
	nop
loop_95:
	umulcc	%l3,	%l3,	%g2
	te	%icc,	0x1
	subccc	%g2,	0x1BD4,	%g2
	sra	%g2,	%g2,	%l2
	ldsh	[%l7 + 0x54],	%l2
	xorcc	%l2,	0x0486,	%l2
	fbl	%fcc1,	loop_96
	udivx	%l2,	0x0DD4,	%l2
	bge,a,pt	%icc,	loop_97
	be	loop_98
loop_96:
	nop
	fbo	%fcc0,	loop_99
loop_97:
	ldsb	[%l7 + 0x76],	%l2
loop_98:
	fsrc2s	%f6,	%f14
	fmovsgu	%xcc,	%f5,	%f9
loop_99:
	subcc	%l2,	0x0552,	%l2
	sra	%l2,	0x1E,	%l2
	fbn	%fcc2,	loop_100
	brgz	%l2,	loop_101
	stx	%l2,	[%l7 + 0x58]
	bne	%icc,	loop_102
loop_100:
	fcmpeq32	%f12,	%f14,	%l2
loop_101:
	tvs	%xcc,	0x1
	ta	%xcc,	0x3
loop_102:
	nop
	movge	%icc,	%l2,	%l6
	srl	%l6,	0x06,	%l6
	tvc	%xcc,	0x7
	brgez,a	%l6,	loop_103
	tg	%xcc,	0x2
	nop
	bpos,pn	%icc,	loop_104
loop_103:
	fbul	%fcc2,	loop_105
	alignaddr	%l6,	%l6,	%o4
	lduw	[%l7 + 0x4C],	%o4
loop_104:
	udivx	%o4,	0x1B37,	%o4
loop_105:
	udiv	%o4,	0x1308,	%o4
	mova	%xcc,	%o4,	%o6
	fmovsle	%xcc,	%f9,	%f9
	tne	%xcc,	0x4
	nop
	subccc	%o6,	0x11CE,	%o6
	orncc	%o6,	%i5,	%o6
	sdivcc	%o6,	0x182E,	%o6
	movle	%icc,	%o6,	%o2
	ld	[%l7 + 0x0C],	%f2
	fcmpne32	%f12,	%f12,	%o2
	tg	%icc,	0x1
	lduh	[%l7 + 0x52],	%o2
	ldd	[%l7 + 0x28],	%f4
	nop
	pdist	%f12,	%f12,	%f6
	fmul8ulx16	%f6,	%f10,	%f8
	xnorcc	%o2,	%o2,	%i3
	st	%f9,	[%l7 + 0x34]
	fzeros	%f9
	nop
	movpos	%icc,	%g6,	%i3
	movvc	%icc,	%g1,	%i3
	array8	%i3,	%i3,	%i4
	tne	%xcc,	0x5
	movrlz	%i4,	%l1,	%i4
	ldsw	[%l7 + 0x38],	%i4
	orn	%i4,	0x1E13,	%i4
	fors	%f9,	%f6,	%f14
	fornot1s	%f14,	%f6,	%f9
	movpos	%icc,	%l4,	%i4
	ldsb	[%l7 + 0x73],	%i4
	movvc	%icc,	%o5,	%i4
	movvc	%xcc,	%i1,	%i4
	nop
	addc	%i4,	0x019F,	%i4
	fbu,a	%fcc0,	loop_106
	nop
	mulx	%i4,	%i4,	%i0
	nop
loop_106:
	fmovsne	%icc,	%f6,	%f2
	nop
	fmul8sux16	%f8,	%f10,	%f0
	tge	%icc,	0x7
	ba,pn	%xcc,	loop_107
	fnand	%f0,	%f8,	%f14
	movle	%xcc,	%i0,	%i6
	movn	%icc,	%o7,	%i6
loop_107:
	sub	%i6,	%l5,	%i6
	fpadd16s	%f2,	%f1,	%f5
	sllx	%i6,	0x1A,	%i6
	fmovdgu	%xcc,	%f3,	%f14
	brgez,a	%i6,	loop_108
	stw	%i6,	[%l7 + 0x48]
	fpsub32s	%f14,	%f0,	%f8
	nop
loop_108:
	subc	%i6,	0x103F,	%i6
	movle	%icc,	%g3,	%i6
	fxors	%f8,	%f5,	%f6
	nop
	fbge,a	%fcc2,	loop_109
	movrlez	%i6,	0x3C4,	%i6
	tcs	%xcc,	0x2
	ldd	[%l7 + 0x50],	%f4
loop_109:
	srl	%i6,	%o1,	%i6
	tleu	%xcc,	0x5
	orcc	%i6,	0x1096,	%i6
	fmuld8ulx16	%f6,	%f10,	%f4
	andn	%i6,	0x1CE9,	%i6
	taddcctv	%i6,	0x1F96,	%i6
	tneg	%xcc,	0x2
	andcc	%i6,	0x03DC,	%i6
	sethi	0x0077,	%i6
	fmovrslez	%i6,	%f15,	%f14
	udivx	%i6,	0x0BF5,	%i6
	tsubcc	%i6,	%i6,	%g7
	fnot2s	%f14,	%f3
	xorcc	%g7,	0x0C7A,	%g7
	array32	%g7,	%l0,	%g7
	fmul8x16	%f14,	%f8,	%f4
	nop
	nop
	setx loop_110, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	fbul	%fcc0,	loop_111
	sra	%g7,	%o0,	%g7
	tn	%xcc,	0x5
loop_110:
	tne	%xcc,	0x7
loop_111:
	taddcc	%g7,	%g7,	%i2
	fmovrdgz	%i2,	%f14,	%f8
	bge,a	%icc,	loop_112
	brgz,a	%i2,	loop_113
	andcc	%i2,	%g4,	%i2
	nop
loop_112:
	addcc	%i2,	0x1682,	%i2
loop_113:
	nop
	array8	%i2,	%i2,	%g5
	movne	%icc,	%g5,	%i7
	fmovdg	%xcc,	%f12,	%f11
	fmovs	%f11,	%f8
	lduh	[%l7 + 0x6A],	%i7
	stx	%i7,	[%l7 + 0x38]
	fmovrdlez	%i7,	%f14,	%f12
	brgz,a	%i7,	loop_114
	movg	%icc,	%i7,	%o3
	tsubcctv	%o3,	0x14FA,	%o3
	fbul	%fcc1,	loop_115
loop_114:
	tg	%xcc,	0x1
	movge	%icc,	%o3,	%l3
	taddcctv	%l3,	0x08C8,	%l3
loop_115:
	movl	%xcc,	%g2,	%l3
	nop
	mulscc	%l3,	0x04C8,	%l3
	orcc	%l3,	%l2,	%l3
	fbne	%fcc0,	loop_116
	smul	%l3,	%l6,	%l3
	fbul,a	%fcc2,	loop_117
	udiv	%l3,	0x1107,	%l3
loop_116:
	nop
	siam	0x3
loop_117:
	fbg	%fcc2,	loop_118
	lduh	[%l7 + 0x24],	%l3
	tcc	%xcc,	0x3
	fmovsg	%icc,	%f10,	%f4
loop_118:
	movg	%icc,	%o4,	%l3
	ldsb	[%l7 + 0x71],	%l3
	movn	%xcc,	%i5,	%l3
	nop
	fmovsvs	%icc,	%f13,	%f4
	st	%f4,	[%l7 + 0x50]
	orn	%l3,	0x11C7,	%l3
	fcmpgt32	%f12,	%f10,	%l3
	fmovscs	%icc,	%f2,	%f3
	fabsd	%f12,	%f6
	fmovdle	%xcc,	%f3,	%f5
	sdiv	%l3,	0x188A,	%l3
	subc	%l3,	0x178D,	%l3
	udiv	%l3,	0x109C,	%l3
	fors	%f5,	%f11,	%f3
	sethi	0x13A5,	%l3
	bl,pt	%xcc,	loop_119
	movg	%icc,	%l3,	%o6
	call	loop_120
	fbul,a	%fcc1,	loop_121
loop_119:
	fbe,a	%fcc0,	loop_122
	brlez	%o6,	loop_123
loop_120:
	fmovdg	%icc,	%f0,	%f7
loop_121:
	and	%o6,	%o6,	%o2
loop_122:
	addccc	%o2,	%g6,	%o2
loop_123:
	stx	%o2,	[%l7 + 0x70]
	stb	%o2,	[%l7 + 0x5A]
	mova	%xcc,	%o2,	%g1
	xorcc	%g1,	0x19BD,	%g1
	fpack16	%f12,	%f15
	srl	%g1,	0x1A,	%g1
	fsrc2	%f12,	%f2
	subcc	%g1,	0x1DAE,	%g1
	fmovsge	%icc,	%f13,	%f14
	ldsb	[%l7 + 0x65],	%g1
	std	%f12,	[%l7 + 0x38]
	for	%f12,	%f10,	%f4
	tvs	%xcc,	0x3
	fxnor	%f4,	%f10,	%f14
	array32	%g1,	%g1,	%i3
	fsrc1	%f14,	%f12
	fmovrsgez	%i3,	%f11,	%f15
	for	%f14,	%f8,	%f0
	tleu	%xcc,	0x5
	fsrc1s	%f15,	%f2
	alignaddr	%i3,	%i3,	%l1
	fmovsleu	%xcc,	%f10,	%f6
	fba	%fcc0,	loop_124
	movcs	%icc,	%l4,	%l1
	ldx	[%l7 + 0x48],	%l1
	subcc	%l1,	%l1,	%o5
loop_124:
	mulx	%o5,	%o5,	%i1
	tsubcc	%i1,	%i4,	%i1
	nop
	fbuge,a	%fcc3,	loop_125
	ldd	[%l7 + 0x38],	%f4
	stb	%i1,	[%l7 + 0x66]
	movrlz	%i1,	%i1,	%i0
loop_125:
	bvc,a	%icc,	loop_126
	orncc	%i0,	%o7,	%i0
	bleu,a	%xcc,	loop_127
	fmovdl	%icc,	%f5,	%f3
loop_126:
	alignaddr	%i0,	%i0,	%l5
	popc	%l5,	%l5
loop_127:
	movge	%icc,	%g3,	%l5
	fmovrslez	%l5,	%f8,	%f3
	nop
	nop
	fmovrsgz	%l5,	%f1,	%f2
	nop
	movneg	%icc,	%l5,	%o1
	fbul	%fcc2,	loop_128
	nop
	setx loop_129, %l0, %l1
	jmpl %l1, %o1
	xorcc	%o1,	0x08F2,	%o1
	fmovdcc	%icc,	%f3,	%f13
loop_128:
	fmovrdgz	%o1,	%f2,	%f14
loop_129:
	fmovrdgz	%o1,	%f10,	%f2
	tge	%xcc,	0x7
	fmovdleu	%icc,	%f13,	%f8
	bvs,a,pn	%icc,	loop_130
	andcc	%o1,	%i6,	%o1
	addccc	%o1,	%o1,	%l0
	srlx	%l0,	0x0F,	%l0
loop_130:
	movrgez	%l0,	0x009,	%l0
	ba,a,pt	%icc,	loop_131
	alignaddr	%l0,	%o0,	%l0
	alignaddr	%l0,	%g7,	%l0
	fandnot2	%f2,	%f14,	%f12
loop_131:
	popc	%l0,	%l0
	st	%f8,	[%l7 + 0x40]
	move	%icc,	%g4,	%l0
	alignaddr	%l0,	%l0,	%i2
	sllx	%i2,	%g5,	%i2
	ld	[%l7 + 0x30],	%f7
	alignaddr	%i2,	%i2,	%i7
	tcc	%xcc,	0x0
	alignaddr	%i7,	%o3,	%i7
	fbn,a	%fcc1,	loop_132
	lduh	[%l7 + 0x56],	%i7
	mulx	%i7,	%g2,	%i7
	array16	%i7,	%i7,	%l2
loop_132:
	fpadd16	%f12,	%f4,	%f0
	fbug,a	%fcc0,	loop_133
	fcmpeq32	%f0,	%f14,	%l2
	siam	0x1
	and	%l2,	%l6,	%l2
loop_133:
	ta	%xcc,	0x4
	fcmpne32	%f0,	%f14,	%l2
	tsubcc	%l2,	%o4,	%l2
	fmovrdlez	%l2,	%f6,	%f10
	sdiv	%l2,	0x1B31,	%l2
	stx	%l2,	[%l7 + 0x20]
	fmovdcs	%xcc,	%f3,	%f12
	sdivcc	%l2,	0x0752,	%l2
	subcc	%l2,	0x16AD,	%l2
	fpmerge	%f12,	%f0,	%f12
	subc	%l2,	0x016F,	%l2
	fmovrslez	%l2,	%f10,	%f2
	bleu,a,pn	%icc,	loop_134
	nop
	movg	%xcc,	%i5,	%l2
	tsubcctv	%l2,	0x16F1,	%l2
loop_134:
	tsubcctv	%l2,	0x043A,	%l2
	brgez,a	%l2,	loop_135
	fmuld8ulx16	%f2,	%f13,	%f8
	add	%l2,	0x0C8B,	%l2
	be	loop_136
loop_135:
	ldd	[%l7 + 0x28],	%f2
	nop
	orcc	%l2,	0x0EC2,	%l2
loop_136:
	movvs	%xcc,	%l3,	%l2
	array32	%l2,	%l2,	%o6
	taddcctv	%o6,	%o6,	%g6
	orncc	%g6,	0x130C,	%g6
	addc	%g6,	0x05E9,	%g6
	fmovscs	%xcc,	%f13,	%f10
	tge	%xcc,	0x4
	movge	%xcc,	%g6,	%o2
	orcc	%o2,	%g1,	%o2
	tsubcctv	%o2,	%i3,	%o2
	movne	%xcc,	%o2,	%l4
	fmul8x16	%f10,	%f8,	%f2
	movl	%xcc,	%l4,	%l1
	fcmple16	%f2,	%f14,	%l1
	orn	%l1,	%o5,	%l1
	addccc	%l1,	%l1,	%i4
	movre	%i4,	0x212,	%i4
	sll	%i4,	0x12,	%i4
	tcc	%icc,	0x1
	brnz,a	%i4,	loop_137
	bgu	loop_138
	tneg	%xcc,	0x5
	smulcc	%i4,	%i4,	%i1
loop_137:
	or	%i1,	%i1,	%o7
loop_138:
	fmovsne	%xcc,	%f3,	%f2
	for	%f2,	%f4,	%f0
	fmul8ulx16	%f0,	%f6,	%f14
	fbu,a	%fcc1,	loop_139
	brnz,a	%o7,	loop_140
	udivcc	%o7,	0x07FB,	%o7
	fands	%f2,	%f1,	%f6
loop_139:
	array8	%o7,	%i0,	%o7
loop_140:
	bvs,a	%xcc,	loop_141
	nop
	setx loop_142, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	nop
	andn	%o7,	0x018C,	%o7
loop_141:
	ldub	[%l7 + 0x3B],	%o7
loop_142:
	tge	%xcc,	0x1
	umul	%o7,	0x1D44,	%o7
	stw	%o7,	[%l7 + 0x6C]
	tneg	%xcc,	0x3
	movvc	%icc,	%o7,	%g3
	andn	%g3,	0x00A7,	%g3
	sdiv	%g3,	0x19F6,	%g3
	ld	[%l7 + 0x3C],	%f11
	ldsh	[%l7 + 0x7A],	%g3
	sdivx	%g3,	0x05CC,	%g3
	bgu	loop_143
	tle	%xcc,	0x3
	tl	%xcc,	0x4
	or	%g3,	0x01C4,	%g3
loop_143:
	fpadd16	%f14,	%f14,	%f10
	movn	%icc,	%g3,	%l5
	bg,a,pn	%icc,	loop_144
	ldsw	[%l7 + 0x78],	%l5
	andn	%l5,	%i6,	%l5
	movgu	%icc,	%l5,	%o1
loop_144:
	bcs,pt	%xcc,	loop_145
	nop
	or	%o1,	0x0F9B,	%o1
	andn	%o1,	0x061E,	%o1
loop_145:
	fbu,a	%fcc0,	loop_146
	sethi	0x0D58,	%o1
	fcmpne16	%f10,	%f6,	%o1
	tleu	%icc,	0x4
loop_146:
	ldub	[%l7 + 0x1A],	%o1
	popc	0x0537,	%o1
	tgu	%xcc,	0x4
	tsubcctv	%o1,	%o1,	%o0
	ldsh	[%l7 + 0x38],	%o0
	add	%o0,	%o0,	%g7
	tsubcctv	%g7,	%g7,	%g4
	stb	%g4,	[%l7 + 0x74]
	fcmpne16	%f10,	%f10,	%g4
	fmovs	%f6,	%f9
	call	loop_147
	fpack32	%f10,	%f6,	%f0
	orcc	%g4,	%g4,	%l0
	subcc	%l0,	0x1D95,	%l0
loop_147:
	orn	%l0,	%g5,	%l0
	movrne	%l0,	%l0,	%i2
	movne	%icc,	%i2,	%o3
	te	%icc,	0x4
	ldsw	[%l7 + 0x38],	%o3
	fbug,a	%fcc3,	loop_148
	bvc,a,pt	%icc,	loop_149
	ldub	[%l7 + 0x30],	%o3
	sdiv	%o3,	0x0D14,	%o3
loop_148:
	movleu	%xcc,	%g2,	%o3
loop_149:
	fcmpne16	%f0,	%f6,	%o3
	sdivcc	%o3,	0x0766,	%o3
	xorcc	%o3,	%o3,	%i7
	fmovrdne	%i7,	%f10,	%f12
	brgez	%i7,	loop_150
	xnorcc	%i7,	%i7,	%l6
	taddcc	%l6,	%l6,	%o4
	tle	%xcc,	0x5
loop_150:
	std	%f12,	[%l7 + 0x18]
	fornot1s	%f6,	%f11,	%f14
	fsrc1	%f12,	%f14
	movgu	%xcc,	%o4,	%i5
	bl,a	loop_151
	ld	[%l7 + 0x54],	%f0
	tleu	%icc,	0x5
	fmovdleu	%icc,	%f2,	%f3
loop_151:
	bge	loop_152
	bneg,pn	%icc,	loop_153
	ldsh	[%l7 + 0x34],	%i5
	movrlez	%i5,	0x31D,	%i5
loop_152:
	smul	%i5,	0x1015,	%i5
loop_153:
	fbe	%fcc0,	loop_154
	tgu	%icc,	0x7
	ldx	[%l7 + 0x20],	%i5
	fbg	%fcc0,	loop_155
loop_154:
	fmovsgu	%xcc,	%f0,	%f13
	fcmpgt32	%f12,	%f8,	%i5
	fbug,a	%fcc0,	loop_156
loop_155:
	fmovdle	%xcc,	%f12,	%f1
	fpmerge	%f1,	%f6,	%f10
	smulcc	%i5,	0x0B58,	%i5
loop_156:
	bn,a,pt	%icc,	loop_157
	fpsub32	%f10,	%f14,	%f2
	bneg,a,pn	%xcc,	loop_158
	fornot1s	%f1,	%f10,	%f3
loop_157:
	nop
	ldsh	[%l7 + 0x52],	%i5
loop_158:
	array32	%i5,	%l3,	%i5
	sethi	0x0A46,	%i5
	movrlez	%i5,	%i5,	%l2
	tgu	%xcc,	0x4
	sdivx	%l2,	0x17FB,	%l2
	sra	%l2,	%l2,	%o6
	movvc	%icc,	%o6,	%g6
	te	%xcc,	0x4
	tcs	%xcc,	0x2
	nop
	stb	%g6,	[%l7 + 0x1E]
	fbu	%fcc1,	loop_159
	movgu	%icc,	%g1,	%g6
	std	%f2,	[%l7 + 0x48]
	brlz	%g6,	loop_160
loop_159:
	fpadd32	%f2,	%f0,	%f2
	add	%g6,	0x1300,	%g6
	movvc	%icc,	%i3,	%g6
loop_160:
	movle	%icc,	%o2,	%g6
	addccc	%g6,	0x1554,	%g6
	fbue	%fcc3,	loop_161
	addccc	%g6,	0x01E6,	%g6
	bcs	%icc,	loop_162
	tsubcc	%g6,	0x1BAD,	%g6
loop_161:
	addc	%g6,	%l4,	%g6
	bn,a	%icc,	loop_163
loop_162:
	tle	%icc,	0x3
	bcc,pn	%icc,	loop_164
	nop
loop_163:
	brlez,a	%g6,	loop_165
	tvs	%xcc,	0x5
loop_164:
	taddcctv	%g6,	0x05C2,	%g6
	alignaddr	%g6,	%o5,	%g6
loop_165:
	tleu	%icc,	0x5
	udivx	%g6,	0x064D,	%g6
	movneg	%icc,	%l1,	%g6
	movpos	%icc,	%g6,	%i4
	array8	%i4,	%i4,	%i1
	ldx	[%l7 + 0x38],	%i1
	movrgez	%i1,	%i0,	%i1
	nop
	or	%i1,	0x1A9B,	%i1
	brgz,a	%i1,	loop_166
	fbug	%fcc3,	loop_167
	andn	%i1,	%o7,	%i1
	stw	%i1,	[%l7 + 0x08]
loop_166:
	fmovrde	%i1,	%f2,	%f6
loop_167:
	movcs	%xcc,	%i1,	%g3
	array32	%g3,	%i6,	%g3
	alignaddr	%g3,	%g3,	%l5
	fnot2	%f6,	%f12
	andcc	%l5,	%o1,	%l5
	fmul8x16	%f3,	%f0,	%f0
	tgu	%icc,	0x3
	fbe	%fcc2,	loop_168
	tneg	%icc,	0x0
	movne	%xcc,	%l5,	%o0
	movcs	%icc,	%o0,	%g7
loop_168:
	array32	%g7,	%g4,	%g7
	std	%f0,	[%l7 + 0x10]
	movleu	%icc,	%g7,	%g5
	bl,a	loop_169
	udiv	%g5,	0x15CF,	%g5
	movle	%icc,	%l0,	%g5
	movne	%icc,	%g5,	%i2
loop_169:
	subc	%i2,	%g2,	%i2
	fmovdge	%icc,	%f7,	%f1
	movl	%xcc,	%o3,	%i2
	std	%f0,	[%l7 + 0x18]
	ldub	[%l7 + 0x54],	%i2
	movpos	%icc,	%i2,	%i7
	stw	%i7,	[%l7 + 0x0C]
	stb	%i7,	[%l7 + 0x26]
	bn,a	loop_170
	bvs,a	%icc,	loop_171
	movvs	%icc,	%i7,	%l6
	udivcc	%l6,	0x1723,	%l6
loop_170:
	alignaddrl	%l6,	%l6,	%o4
loop_171:
	movvc	%xcc,	%l3,	%o4
	fones	%f1
	fsrc2s	%f1,	%f11
	fornot2s	%f1,	%f11,	%f5
	movn	%xcc,	%i5,	%o4
	fmovdneg	%xcc,	%f12,	%f4
	movre	%o4,	%l2,	%o4
	ldd	[%l7 + 0x78],	%f2
	bcc,a	loop_172
	sra	%o4,	%o6,	%o4
	fmovsle	%xcc,	%f8,	%f3
	xor	%o4,	0x14C9,	%o4
loop_172:
	udiv	%o4,	0x1F27,	%o4
	nop
	stb	%o4,	[%l7 + 0x0A]
	tge	%icc,	0x0
	bcs,a,pt	%icc,	loop_173
	fcmpgt16	%f0,	%f10,	%o4
	movvs	%xcc,	%o4,	%g1
	sllx	%g1,	%i3,	%g1
loop_173:
	ble,a	loop_174
	move	%xcc,	%o2,	%g1
	bpos	loop_175
	array16	%g1,	%l4,	%g1
loop_174:
	fzeros	%f3
	array8	%g1,	%g1,	%o5
loop_175:
	sethi	0x0FC3,	%o5
	nop
	taddcc	%o5,	%o5,	%l1
	tvs	%icc,	0x7
	fmovsn	%xcc,	%f15,	%f13
	sth	%l1,	[%l7 + 0x34]
	move	%xcc,	%g6,	%l1
	ldsb	[%l7 + 0x17],	%l1
	nop
	tsubcc	%l1,	0x1F5D,	%l1
	taddcctv	%l1,	%l1,	%i4
	nop
	movn	%icc,	%i4,	%i0
	movrlz	%i0,	%o7,	%i0
	umul	%i0,	0x072E,	%i0
	movvs	%xcc,	%i0,	%i1
	udivx	%i1,	0x1042,	%i1
	array32	%i1,	%i6,	%i1
	movrgez	%i1,	%i1,	%g3
	tleu	%xcc,	0x3
	mova	%xcc,	%o1,	%g3
	nop
	nop
	srlx	%g3,	%g3,	%l5
	srl	%l5,	0x06,	%l5
	fsrc2s	%f13,	%f2
	stb	%l5,	[%l7 + 0x33]
	udivx	%l5,	0x1B77,	%l5
	srlx	%l5,	0x1F,	%l5
	orn	%l5,	0x086C,	%l5
	fbne,a	%fcc0,	loop_176
	sll	%l5,	%o0,	%l5
	srlx	%l5,	0x14,	%l5
	orcc	%l5,	%g4,	%l5
loop_176:
	tneg	%icc,	0x5
	ld	[%l7 + 0x74],	%f0
	and	%l5,	%g7,	%l5
	fpackfix	%f0,	%f6
	movcc	%icc,	%l0,	%l5
	mova	%xcc,	%l5,	%g5
	movpos	%icc,	%g2,	%g5
	tl	%icc,	0x3
	fcmpd	%fcc3,	%f0,	%f6
	tneg	%xcc,	0x0
	subccc	%g5,	%o3,	%g5
	taddcctv	%g5,	0x1984,	%g5
	nop
	fmovdne	%icc,	%f6,	%f13
	fmovsge	%xcc,	%f15,	%f13
	array32	%g5,	%g5,	%i2
	brlz,a	%i2,	loop_177
	fblg,a	%fcc1,	loop_178
	or	%i2,	%i2,	%i7
	ldx	[%l7 + 0x68],	%i7
loop_177:
	nop
loop_178:
	udiv	%i7,	0x1B03,	%i7
	or	%i7,	0x03A5,	%i7
	std	%f6,	[%l7 + 0x40]
	taddcc	%i7,	0x0B20,	%i7
	nop
	nop
	tvs	%icc,	0x7
	andncc	%i7,	%l6,	%i7
	orncc	%i7,	0x033A,	%i7
	array8	%i7,	%i7,	%l3
	fmuld8sux16	%f13,	%f14,	%f4
	addc	%l3,	%i5,	%l3
	or	%l3,	%l2,	%l3
	movneg	%xcc,	%l3,	%o6
	nop
	andncc	%o6,	%o4,	%o6
	stx	%o6,	[%l7 + 0x38]
	fblg,a	%fcc2,	loop_179
	taddcc	%o6,	0x17CE,	%o6
	fmovdge	%icc,	%f5,	%f11
	fbl	%fcc3,	loop_180
loop_179:
	movneg	%icc,	%i3,	%o6
	fmovscs	%xcc,	%f7,	%f0
	ldsh	[%l7 + 0x0A],	%o6
loop_180:
	movrlz	%o6,	0x174,	%o6
	movre	%o6,	0x1DA,	%o6
	taddcctv	%o6,	0x0292,	%o6
	movrlz	%o6,	0x267,	%o6
	tsubcctv	%o6,	%o2,	%o6
	udiv	%o6,	0x1936,	%o6
	stb	%o6,	[%l7 + 0x0D]
	ld	[%l7 + 0x4C],	%f1
	tn	%xcc,	0x1
	orn	%o6,	%l4,	%o6
	movleu	%icc,	%o6,	%g1
	fcmpd	%fcc1,	%f6,	%f8
	tvs	%icc,	0x4
	addc	%g1,	0x12CC,	%g1
	ld	[%l7 + 0x30],	%f14
	orn	%g1,	0x0651,	%g1
	movn	%icc,	%o5,	%g1
	fones	%f0
	subcc	%g1,	0x1018,	%g1
	sdiv	%g1,	0x0E8C,	%g1
	taddcc	%g1,	0x0A53,	%g1
	sdiv	%g1,	0x1AFC,	%g1
	movneg	%xcc,	%g1,	%g6
	sllx	%g6,	%l1,	%g6
	tneg	%icc,	0x4
	tsubcc	%g6,	%i4,	%g6
	movleu	%icc,	%g6,	%o7
	tneg	%icc,	0x4
	andcc	%o7,	%o7,	%i0
	nop
	sub	%i0,	%i6,	%i0
	fbue,a	%fcc3,	loop_181
	orn	%i0,	%i1,	%i0
	brnz	%i0,	loop_182
	fmovsneg	%icc,	%f12,	%f11
loop_181:
	orncc	%i0,	%i0,	%o1
	xor	%o1,	0x04F2,	%o1
loop_182:
	movrne	%o1,	0x1E0,	%o1
	lduh	[%l7 + 0x0A],	%o1
	fmovsl	%xcc,	%f15,	%f13
	array32	%o1,	%o1,	%g3
	tneg	%xcc,	0x7
	fmovdne	%icc,	%f6,	%f15
	tcs	%xcc,	0x0
	lduw	[%l7 + 0x6C],	%g3
	fmovsvc	%xcc,	%f12,	%f9
	fpsub16	%f8,	%f12,	%f10
	orn	%g3,	%o0,	%g3
	and	%g3,	0x04B3,	%g3
	andn	%g3,	%g3,	%g4
	fmovda	%xcc,	%f0,	%f9
	orncc	%g4,	0x0B12,	%g4
	nop
	fpackfix	%f10,	%f3
	fba	%fcc3,	loop_183
	fmovrdgz	%g4,	%f8,	%f0
	bge,a,pt	%xcc,	loop_184
	movrlz	%g4,	%g4,	%g7
loop_183:
	move	%xcc,	%l0,	%g7
	ldsh	[%l7 + 0x70],	%g7
loop_184:
	movrne	%g7,	0x1AB,	%g7
	movvs	%xcc,	%l5,	%g7
	ld	[%l7 + 0x30],	%f1
	popc	0x1294,	%g7
	tgu	%icc,	0x4
	fblg,a	%fcc3,	loop_185
	subc	%g7,	0x18F8,	%g7
	array16	%g7,	%g2,	%g7
	umulcc	%g7,	%g7,	%o3
loop_185:
	movl	%icc,	%g5,	%o3
	fmovdleu	%icc,	%f8,	%f10
	movgu	%icc,	%i2,	%o3
	ldsw	[%l7 + 0x64],	%o3
	addcc	%o3,	0x0AFA,	%o3
	fmovdvc	%xcc,	%f15,	%f4
	brnz,a	%o3,	loop_186
	tvc	%icc,	0x4
	movrlez	%o3,	0x049,	%o3
	fbl	%fcc1,	loop_187
loop_186:
	tvc	%icc,	0x2
	ldub	[%l7 + 0x47],	%o3
	alignaddrl	%o3,	%l6,	%o3
loop_187:
	tpos	%icc,	0x5
	ldd	[%l7 + 0x20],	%f10
	stx	%o3,	[%l7 + 0x38]
	fpadd32	%f0,	%f0,	%f0
	nop
	setx loop_188, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	move	%xcc,	%i7,	%o3
	st	%f4,	[%l7 + 0x50]
	faligndata	%f0,	%f4,	%f8
loop_188:
	mulx	%o3,	0x0E8D,	%o3
	movrne	%o3,	0x2AD,	%o3
	tvc	%icc,	0x0
	array8	%o3,	%i5,	%o3
	movrgez	%o3,	0x2D2,	%o3
	fcmpgt32	%f8,	%f14,	%o3
	st	%f4,	[%l7 + 0x14]
	fcmpes	%fcc1,	%f13,	%f4
	addcc	%o3,	0x016C,	%o3
	fmovsvc	%icc,	%f6,	%f3
	nop
	bvs,a,pn	%icc,	loop_189
	fmovdl	%xcc,	%f6,	%f4
	ldd	[%l7 + 0x60],	%f14
	te	%icc,	0x0
loop_189:
	tl	%icc,	0x0
	fxnors	%f4,	%f5,	%f15
	tn	%xcc,	0x5
	orn	%o3,	%o3,	%l2
	sdivx	%l2,	0x1BFC,	%l2
	lduw	[%l7 + 0x30],	%l2
	xorcc	%l2,	0x06C5,	%l2
	ldd	[%l7 + 0x60],	%f12
	subcc	%l2,	0x0A49,	%l2
	nop
	andcc	%l2,	0x0039,	%l2
	fmovspos	%icc,	%f7,	%f10
	fbn	%fcc0,	loop_190
	fmovdge	%icc,	%f13,	%f5
	fmovdge	%xcc,	%f7,	%f9
	fmovrdgz	%l2,	%f8,	%f0
loop_190:
	tsubcc	%l2,	%l3,	%l2
	movrlz	%l2,	%o4,	%l2
	bgu,a	%xcc,	loop_191
	lduw	[%l7 + 0x5C],	%l2
	sethi	0x0700,	%l2
	movleu	%xcc,	%i3,	%l2
loop_191:
	nop
	andcc	%l2,	%l2,	%o2
	fmovd	%f0,	%f0
	alignaddr	%o2,	%o2,	%l4
	fmul8x16	%f9,	%f14,	%f4
	fmovscs	%icc,	%f9,	%f9
	ldsh	[%l7 + 0x2E],	%l4
	sra	%l4,	0x19,	%l4
	movrne	%l4,	%o6,	%l4
	fble,a	%fcc2,	loop_192
	nop
	setx loop_193, %l0, %l1
	jmpl %l1, %l4
	fmovsvc	%icc,	%f2,	%f4
	std	%f4,	[%l7 + 0x20]
loop_192:
	nop
loop_193:
	fbug,a	%fcc2,	loop_194
	srlx	%l4,	0x0B,	%l4
	srax	%l4,	0x14,	%l4
	tpos	%xcc,	0x6
loop_194:
	bl,pt	%icc,	loop_195
	orncc	%l4,	0x0B6C,	%l4
	andcc	%l4,	0x02C3,	%l4
	nop
loop_195:
	movcs	%icc,	%o5,	%l4
	array8	%l4,	%g1,	%l4
	mulx	%l4,	%l1,	%l4
	sth	%l4,	[%l7 + 0x24]
	sth	%l4,	[%l7 + 0x2C]
	tvs	%icc,	0x3
	bn,a,pn	%xcc,	loop_196
	te	%xcc,	0x2
	std	%f4,	[%l7 + 0x40]
	fbul,a	%fcc3,	loop_197
loop_196:
	tn	%icc,	0x7
	bn,a	loop_198
	fands	%f4,	%f9,	%f11
loop_197:
	tgu	%icc,	0x4
	popc	%l4,	%l4
loop_198:
	sth	%l4,	[%l7 + 0x40]
	array16	%l4,	%l4,	%i4
	bg	loop_199
	fmovsa	%icc,	%f11,	%f7
	fmovdvc	%xcc,	%f14,	%f3
	movcc	%icc,	%g6,	%i4
loop_199:
	fmovda	%icc,	%f7,	%f1
	nop
	tge	%xcc,	0x7
	movpos	%xcc,	%o7,	%i4
	movleu	%xcc,	%i6,	%i4
	nop
	popc	0x0925,	%i4
	fmovdle	%xcc,	%f0,	%f8
	fmul8ulx16	%f4,	%f12,	%f8
	andncc	%i4,	%i1,	%i4
	fpmerge	%f8,	%f4,	%f10
	nop
	fmul8x16au	%f8,	%f12,	%f14
	movl	%xcc,	%i4,	%i0
	stb	%i0,	[%l7 + 0x79]
	tcc	%icc,	0x7
	bshuffle	%f14,	%f0,	%f2
	fmovrdgz	%i0,	%f12,	%f0
	fbuge	%fcc2,	loop_200
	andcc	%i0,	0x0B02,	%i0
	tgu	%icc,	0x7
	lduw	[%l7 + 0x38],	%i0
loop_200:
	sdivcc	%i0,	0x0D1C,	%i0
	stx	%i0,	[%l7 + 0x20]
	fabsd	%f0,	%f14
	tg	%icc,	0x4
	smul	%i0,	0x0EF5,	%i0
	movle	%xcc,	%o1,	%i0
	movrlez	%i0,	0x347,	%i0
	movgu	%icc,	%i0,	%o0
	fble,a	%fcc3,	loop_201
	fmovrslez	%o0,	%f10,	%f14
	tl	%xcc,	0x1
	andncc	%o0,	%g3,	%o0
loop_201:
	bvs,a	loop_202
	array8	%o0,	%o0,	%g4
	movn	%xcc,	%g4,	%l0
	ldsw	[%l7 + 0x1C],	%l0
loop_202:
	fmovdpos	%xcc,	%f9,	%f10
	mova	%icc,	%l0,	%l5
	ta	%xcc,	0x6
	nop
	stb	%l5,	[%l7 + 0x54]
	udivx	%l5,	0x14FB,	%l5
	nop
	movn	%xcc,	%l5,	%g2
	popc	%g2,	%g2
	fornot2s	%f10,	%f5,	%f3
	movcc	%icc,	%g2,	%g7
	udivcc	%g7,	0x02C9,	%g7
	tn	%xcc,	0x3
	srl	%g7,	0x11,	%g7
	add	%g7,	%g5,	%g7
	tvc	%icc,	0x0
	orncc	%g7,	0x18C3,	%g7
	movrlz	%g7,	0x1F0,	%g7
	movle	%xcc,	%g7,	%i2
	and	%i2,	0x0BD2,	%i2
	movne	%xcc,	%l6,	%i2
	fmovsvs	%icc,	%f3,	%f12
	fcmpes	%fcc0,	%f12,	%f12
	nop
	fmovrdlz	%i2,	%f14,	%f2
	stb	%i2,	[%l7 + 0x39]
	fnot2s	%f12,	%f4
	srlx	%i2,	0x04,	%i2
	tcs	%icc,	0x0
	fnot2s	%f12,	%f0
	or	%i2,	0x0F58,	%i2
	ldsw	[%l7 + 0x68],	%i2
	be,a	loop_203
	sdivcc	%i2,	0x0573,	%i2
	subc	%i2,	0x04A4,	%i2
	fmul8x16au	%f12,	%f2,	%f6
loop_203:
	ldsb	[%l7 + 0x1A],	%i2
	sth	%i2,	[%l7 + 0x7C]
	movrgz	%i2,	0x125,	%i2
	tgu	%xcc,	0x3
	ldsb	[%l7 + 0x27],	%i2
	mulx	%i2,	%i7,	%i2
	std	%f6,	[%l7 + 0x58]
	movgu	%icc,	%i5,	%i2
	bge,a	%xcc,	loop_204
	sethi	0x0DDD,	%i2
	nop
	tcc	%icc,	0x4
loop_204:
	fornot2	%f6,	%f8,	%f0
	bn,a	%icc,	loop_205
	fmovsvc	%xcc,	%f1,	%f12
	std	%f0,	[%l7 + 0x18]
	movvs	%icc,	%i2,	%o3
loop_205:
	fones	%f12
	movcc	%xcc,	%l3,	%o3
	andcc	%o3,	%o4,	%o3
	nop
	movrgez	%o3,	0x056,	%o3
	fbge,a	%fcc1,	loop_206
	stb	%o3,	[%l7 + 0x1C]
	ldx	[%l7 + 0x68],	%o3
	addcc	%o3,	0x0A92,	%o3
loop_206:
	andcc	%o3,	0x1D24,	%o3
	fmovdge	%icc,	%f0,	%f6
	mulx	%o3,	%o3,	%i3
	st	%f6,	[%l7 + 0x50]
	movl	%xcc,	%l2,	%i3
	udiv	%i3,	0x1A1B,	%i3
	movcc	%icc,	%i3,	%o2
	movpos	%xcc,	%o6,	%o2
	movg	%xcc,	%o2,	%o5
	fmovrdne	%o5,	%f12,	%f2
	array8	%o5,	%g1,	%o5
	stb	%o5,	[%l7 + 0x0D]
	nop
	tvs	%icc,	0x3
	for	%f2,	%f4,	%f8
	stw	%o5,	[%l7 + 0x34]
	ldsh	[%l7 + 0x38],	%o5
	movrgez	%o5,	%o5,	%l1
	fsrc2	%f8,	%f6
	fbl	%fcc2,	loop_207
	movrgez	%l1,	0x1D5,	%l1
	bcc,pn	%xcc,	loop_208
	fandnot1	%f8,	%f0,	%f6
loop_207:
	addcc	%l1,	%l4,	%l1
	fcmple16	%f6,	%f8,	%l1
loop_208:
	nop
	and	%l1,	0x01DE,	%l1
	orncc	%l1,	0x140F,	%l1
	std	%f6,	[%l7 + 0x58]
	fba	%fcc0,	loop_209
	xor	%l1,	%l1,	%g6
	alignaddr	%g6,	%g6,	%o7
	ld	[%l7 + 0x50],	%f7
loop_209:
	nop
	ld	[%l7 + 0x0C],	%f7
	tgu	%icc,	0x7
	std	%f6,	[%l7 + 0x28]
	fmul8x16al	%f6,	%f9,	%f0
	sra	%o7,	0x12,	%o7
	tvc	%icc,	0x1
	alignaddr	%o7,	%o7,	%i6
	fpsub32	%f0,	%f8,	%f6
	tgu	%icc,	0x4
	fmovsleu	%icc,	%f7,	%f4
	fand	%f6,	%f12,	%f6
	udivx	%i6,	0x0AB1,	%i6
	fnor	%f6,	%f2,	%f0
	sdivcc	%i6,	0x1C98,	%i6
	fmovrde	%i6,	%f6,	%f12
	fcmpne32	%f12,	%f6,	%i6
	popc	%i6,	%i6
	lduh	[%l7 + 0x1E],	%i6
	sdiv	%i6,	0x14F5,	%i6
	srl	%i6,	%i6,	%i1
	sub	%i1,	0x096F,	%i1
	udivx	%i1,	0x1015,	%i1
	nop
	fbule,a	%fcc1,	loop_210
	nop
	st	%f4,	[%l7 + 0x58]
	fxors	%f4,	%f8,	%f8
loop_210:
	array8	%i1,	%i4,	%i1
	movvc	%xcc,	%o1,	%i1
	movcc	%icc,	%i1,	%i0
	fmovdvs	%icc,	%f2,	%f9
	fmovrsgez	%i0,	%f8,	%f6
	movrne	%i0,	%i0,	%g3
	fands	%f6,	%f7,	%f5
	array8	%g3,	%o0,	%g3
	nop
	setx loop_211, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	udivx	%g3,	0x1B92,	%g3
	nop
	move	%xcc,	%g3,	%g4
loop_211:
	fsrc2	%f12,	%f0
	smul	%g4,	%l0,	%g4
	umulcc	%g4,	0x1657,	%g4
	ble,a	loop_212
	fmovsle	%xcc,	%f1,	%f15
	ta	%icc,	0x0
	fmovrsgez	%g4,	%f8,	%f15
loop_212:
	nop
	movg	%icc,	%l5,	%g4
	bgu,pn	%xcc,	loop_213
	movvs	%xcc,	%g4,	%g2
	lduw	[%l7 + 0x08],	%g2
	movgu	%icc,	%g2,	%g5
loop_213:
	fpackfix	%f12,	%f4
	tvc	%icc,	0x5
	tge	%xcc,	0x1
	movrlez	%g5,	0x22E,	%g5
	movre	%g5,	%g5,	%g7
	smulcc	%g7,	0x026B,	%g7
	tneg	%xcc,	0x1
	movre	%g7,	%l6,	%g7
	fbl,a	%fcc3,	loop_214
	movvc	%icc,	%g7,	%i7
	fpadd32s	%f15,	%f1,	%f10
	alignaddr	%i7,	%i7,	%i5
loop_214:
	fcmpne32	%f12,	%f4,	%i5
	fbule,a	%fcc1,	loop_215
	bvc,pn	%icc,	loop_216
	sub	%i5,	%i2,	%i5
	fmul8x16al	%f10,	%f11,	%f2
loop_215:
	fnors	%f10,	%f11,	%f11
loop_216:
	ta	%xcc,	0x2
	nop
	tne	%xcc,	0x5
	movn	%xcc,	%i5,	%l3
	udivcc	%l3,	0x0610,	%l3
	movneg	%icc,	%o4,	%l3
	movrne	%l3,	0x0E8,	%l3
	alignaddrl	%l3,	%o3,	%l3
	fblg	%fcc2,	loop_217
	nop
	fandnot2s	%f11,	%f9,	%f5
	taddcctv	%l3,	0x0F6E,	%l3
loop_217:
	nop
	stb	%l3,	[%l7 + 0x6C]
	ldsb	[%l7 + 0x2E],	%l3
	be,a	loop_218
	xnor	%l3,	0x07BC,	%l3
	orcc	%l3,	0x1381,	%l3
	brlz,a	%l3,	loop_219
loop_218:
	tvc	%icc,	0x1
	bleu,pt	%icc,	loop_220
	fbu	%fcc0,	loop_221
loop_219:
	tn	%icc,	0x7
	fcmped	%fcc1,	%f2,	%f10
loop_220:
	tn	%xcc,	0x2
loop_221:
	fmovrdlez	%l3,	%f12,	%f2
	tsubcctv	%l3,	%l3,	%l2
	nop
	setx loop_222, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	nop
	nop
	xnorcc	%l2,	0x1BF5,	%l2
loop_222:
	tg	%xcc,	0x1
	fmovde	%icc,	%f2,	%f8
	subc	%l2,	%l2,	%i3
	fzeros	%f8
	fmovrsne	%i3,	%f7,	%f5
	movne	%xcc,	%o6,	%i3
	fmuld8sux16	%f5,	%f13,	%f8
	movneg	%icc,	%i3,	%o2
	sdivx	%o2,	0x0F04,	%o2
	smulcc	%o2,	%g1,	%o2
	movg	%icc,	%o2,	%o5
	nop
	srl	%o5,	%l4,	%o5
	fmovrdlez	%o5,	%f0,	%f0
	nop
	movne	%icc,	%o5,	%l1
	bcs,a	%icc,	loop_223
	tsubcctv	%l1,	0x02D6,	%l1
	fmovdle	%icc,	%f10,	%f7
	addcc	%l1,	0x1E50,	%l1
loop_223:
	movrlez	%l1,	0x364,	%l1
	ldub	[%l7 + 0x41],	%l1
	fblg	%fcc3,	loop_224
	fbge	%fcc0,	loop_225
	sll	%l1,	0x1A,	%l1
	fmovdleu	%icc,	%f7,	%f1
loop_224:
	fpsub16	%f0,	%f12,	%f0
loop_225:
	ld	[%l7 + 0x68],	%f0
	bl	loop_226
	te	%xcc,	0x7
	ldub	[%l7 + 0x18],	%l1
	stx	%l1,	[%l7 + 0x20]
loop_226:
	tvc	%xcc,	0x3
	andn	%l1,	%l1,	%g6
	bgu,a,pt	%icc,	loop_227
	stb	%g6,	[%l7 + 0x77]
	bpos,a	%icc,	loop_228
	stw	%g6,	[%l7 + 0x24]
loop_227:
	mova	%xcc,	%g6,	%o7
	ldsh	[%l7 + 0x28],	%o7
loop_228:
	movneg	%icc,	%i6,	%o7
	bvc,a,pt	%xcc,	loop_229
	std	%f0,	[%l7 + 0x40]
	srlx	%o7,	0x0E,	%o7
	stx	%o7,	[%l7 + 0x10]
loop_229:
	fbg	%fcc2,	loop_230
	srl	%o7,	0x11,	%o7
	fors	%f1,	%f4,	%f4
	popc	%o7,	%o7
loop_230:
	tleu	%xcc,	0x3
	nop
	fxnors	%f4,	%f10,	%f2
	xorcc	%o7,	0x137C,	%o7
	fabss	%f2,	%f4
	fmovrslz	%o7,	%f12,	%f12
	ldsh	[%l7 + 0x78],	%o7
	movrne	%o7,	%i4,	%o7
	umul	%o7,	%o7,	%o1
	umulcc	%o1,	0x04FE,	%o1
	fbul,a	%fcc2,	loop_231
	nop
	movrgz	%o1,	0x16F,	%o1
	ta	%xcc,	0x2
loop_231:
	tleu	%icc,	0x7
	fmovdn	%icc,	%f7,	%f10
	fmovsvs	%icc,	%f4,	%f5
	movrgez	%o1,	%i1,	%o1
	xorcc	%o1,	0x0AB6,	%o1
	srlx	%o1,	0x09,	%o1
	fbul	%fcc1,	loop_232
	nop
	nop
	tn	%xcc,	0x2
loop_232:
	fbn,a	%fcc3,	loop_233
	fmovsne	%xcc,	%f3,	%f15
	move	%icc,	%o1,	%i0
	nop
loop_233:
	fmovda	%icc,	%f7,	%f9
	alignaddr	%i0,	%i0,	%o0
	subccc	%o0,	%o0,	%g3
	subc	%g3,	0x1508,	%g3
	fbue	%fcc2,	loop_234
	fbn	%fcc2,	loop_235
	sllx	%g3,	0x1D,	%g3
	movrgz	%g3,	%g3,	%l0
loop_234:
	taddcc	%l0,	0x0D04,	%l0
loop_235:
	movgu	%icc,	%l5,	%l0
	fmovdcs	%icc,	%f12,	%f4
	movrlz	%l0,	0x12C,	%l0
	movcs	%icc,	%g4,	%l0
	fbe,a	%fcc3,	loop_236
	bg,pn	%xcc,	loop_237
	andncc	%l0,	%l0,	%g2
	bvc	loop_238
loop_236:
	fsrc2s	%f4,	%f2
loop_237:
	xorcc	%g2,	0x0BFD,	%g2
	movg	%xcc,	%g5,	%g2
loop_238:
	subccc	%g2,	0x1C04,	%g2
	bvs,a,pn	%xcc,	loop_239
	nop
	sra	%g2,	0x12,	%g2
	fcmpeq16	%f0,	%f0,	%g2
loop_239:
	brlez	%g2,	loop_240
	ldub	[%l7 + 0x53],	%g2
	bcc,a,pn	%xcc,	loop_241
	subcc	%g2,	0x1EC6,	%g2
loop_240:
	umulcc	%g2,	%l6,	%g2
	sdivcc	%g2,	0x17C8,	%g2
loop_241:
	bvs,a	%xcc,	loop_242
	sethi	0x027B,	%g2
	movcs	%xcc,	%g7,	%g2
	fnegs	%f4,	%f7
loop_242:
	udiv	%g2,	0x07A1,	%g2
	nop
	tsubcctv	%g2,	0x0BF1,	%g2
	tsubcctv	%g2,	%i7,	%g2
	smulcc	%g2,	%i2,	%g2
	fbule,a	%fcc3,	loop_243
	array8	%g2,	%i5,	%g2
	stb	%g2,	[%l7 + 0x69]
	andn	%g2,	0x095F,	%g2
loop_243:
	ldsw	[%l7 + 0x3C],	%g2
	ldsh	[%l7 + 0x1A],	%g2
	umul	%g2,	%o4,	%g2
	fmul8x16	%f4,	%f10,	%f2
	ldub	[%l7 + 0x5F],	%g2
	xorcc	%g2,	0x05FA,	%g2
	stx	%g2,	[%l7 + 0x08]
	umulcc	%g2,	%o3,	%g2
	siam	0x3
	bgu,a	%icc,	loop_244
	bneg	loop_245
	ldub	[%l7 + 0x77],	%g2
	fbo	%fcc2,	loop_246
loop_244:
	array8	%g2,	%l3,	%g2
loop_245:
	fblg	%fcc0,	loop_247
	ldsh	[%l7 + 0x7E],	%g2
loop_246:
	movre	%g2,	0x026,	%g2
	mulx	%g2,	0x18BE,	%g2
loop_247:
	fone	%f2
	movrlez	%g2,	%l2,	%g2
	fpadd32s	%f4,	%f1,	%f4
	fnor	%f2,	%f8,	%f8
	te	%icc,	0x7
	movle	%xcc,	%g2,	%o6
	mulscc	%o6,	0x1D36,	%o6
	subcc	%o6,	0x1BC8,	%o6
	smul	%o6,	0x0EC9,	%o6
	st	%f4,	[%l7 + 0x68]
	nop
	subcc	%o6,	%i3,	%o6
	fmovdneg	%xcc,	%f9,	%f4
	orncc	%o6,	0x136C,	%o6
	taddcctv	%o6,	0x01A2,	%o6
	tvc	%icc,	0x4
	subccc	%o6,	%o6,	%g1
	lduw	[%l7 + 0x6C],	%g1
	fbo	%fcc3,	loop_248
	lduw	[%l7 + 0x64],	%g1
	lduh	[%l7 + 0x6E],	%g1
	bneg,pt	%icc,	loop_249
loop_248:
	bcs,pt	%icc,	loop_250
	array8	%g1,	%g1,	%o2
	srl	%o2,	0x04,	%o2
loop_249:
	movge	%xcc,	%l4,	%o2
loop_250:
	fbg,a	%fcc2,	loop_251
	movne	%icc,	%o2,	%o5
	sdiv	%o5,	0x0643,	%o5
	lduw	[%l7 + 0x4C],	%o5
loop_251:
	te	%xcc,	0x3
	fmovsgu	%icc,	%f6,	%f10
	fsrc2	%f8,	%f10
	st	%f10,	[%l7 + 0x08]
	sdivcc	%o5,	0x0BCB,	%o5
	addccc	%o5,	%l1,	%o5
	bvc	%icc,	loop_252
	tpos	%xcc,	0x1
	fpsub32s	%f10,	%f8,	%f2
	fmovsn	%xcc,	%f13,	%f7
loop_252:
	movge	%xcc,	%g6,	%o5
	nop
	lduh	[%l7 + 0x78],	%o5
	tcs	%xcc,	0x2
	tn	%xcc,	0x1
	ldx	[%l7 + 0x48],	%o5
	lduw	[%l7 + 0x34],	%o5
	tl	%xcc,	0x1
	orncc	%o5,	%i6,	%o5
	tneg	%icc,	0x2
	srax	%o5,	%i4,	%o5
	ta	%xcc,	0x1
	sth	%o5,	[%l7 + 0x5A]
	nop
	fcmpeq16	%f8,	%f10,	%o5
	nop
	movrne	%o5,	0x0B5,	%o5
	ldsw	[%l7 + 0x78],	%o5
	bpos	%icc,	loop_253
	subc	%o5,	%o5,	%o7
	movne	%icc,	%o7,	%i1
	fmovrdgz	%i1,	%f6,	%f0
loop_253:
	movrgez	%i1,	%o1,	%i1
	tpos	%xcc,	0x0
	orncc	%i1,	0x11D1,	%i1
	sdivx	%i1,	0x0CA9,	%i1
	ldsb	[%l7 + 0x78],	%i1
	brgz,a	%i1,	loop_254
	sth	%i1,	[%l7 + 0x28]
	or	%i1,	%i1,	%i0
	nop
loop_254:
	fmuld8sux16	%f7,	%f6,	%f6
	tgu	%xcc,	0x4
	smul	%i0,	0x14ED,	%i0
	nop
	orncc	%i0,	%i0,	%o0
	fxors	%f7,	%f1,	%f5
	tl	%xcc,	0x0
	xor	%o0,	%o0,	%g3
	fcmpgt32	%f6,	%f2,	%g3
	ldsw	[%l7 + 0x4C],	%g3
	brgez,a	%g3,	loop_255
	ldd	[%l7 + 0x10],	%f2
	fmovsa	%xcc,	%f9,	%f9
	sra	%g3,	0x03,	%g3
loop_255:
	nop
	fand	%f6,	%f4,	%f12
	fexpand	%f9,	%f12
	fmovsge	%icc,	%f5,	%f13
	brgz,a	%g3,	loop_256
	fmovsa	%icc,	%f9,	%f6
	fcmple16	%f12,	%f12,	%g3
	xorcc	%g3,	%l5,	%g3
loop_256:
	fand	%f12,	%f4,	%f0
	movl	%icc,	%g4,	%g3
	smul	%g3,	%g3,	%l0
	tn	%xcc,	0x1
	fmovsneg	%xcc,	%f7,	%f12
	lduh	[%l7 + 0x50],	%l0
	mulx	%l0,	%l0,	%g5
	tsubcc	%g5,	0x0A1E,	%g5
	sdivcc	%g5,	0x141D,	%g5
	movrlez	%g5,	%g5,	%l6
	sra	%l6,	%g7,	%l6
	nop
	setx loop_257, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	fxnor	%f0,	%f10,	%f12
	fmovdleu	%xcc,	%f5,	%f7
	fandnot1	%f12,	%f0,	%f12
loop_257:
	xnor	%l6,	%i7,	%l6
	brz,a	%l6,	loop_258
	subccc	%l6,	%i2,	%l6
	fmovrsgz	%l6,	%f15,	%f12
	brgz	%l6,	loop_259
loop_258:
	fandnot2s	%f12,	%f13,	%f3
	smul	%l6,	0x0BC3,	%l6
	addccc	%l6,	0x0C3B,	%l6
loop_259:
	tg	%xcc,	0x5
	movgu	%xcc,	%l6,	%i5
	fnegs	%f3,	%f11
	movre	%i5,	%o4,	%i5
	sdivcc	%i5,	0x1DB2,	%i5
	ldub	[%l7 + 0x70],	%i5
	fnot1	%f12,	%f8
	bcs,pt	%xcc,	loop_260
	nop
	tn	%icc,	0x7
	udivcc	%i5,	0x15C7,	%i5
loop_260:
	movrgz	%i5,	%o3,	%i5
	nop
	setx loop_261, %l0, %l1
	jmpl %l1, %i5
	orn	%i5,	0x0103,	%i5
	and	%i5,	0x143F,	%i5
	movne	%xcc,	%l3,	%i5
loop_261:
	nop
	fbuge,a	%fcc2,	loop_262
	or	%i5,	0x1EBF,	%i5
	fcmpgt32	%f12,	%f0,	%i5
	sdivx	%i5,	0x1F44,	%i5
loop_262:
	and	%i5,	0x016D,	%i5
	te	%xcc,	0x6
	fabss	%f3,	%f6
	stw	%i5,	[%l7 + 0x34]
	stx	%i5,	[%l7 + 0x10]
	movleu	%icc,	%l2,	%i5
	bcs,a,pn	%xcc,	loop_263
	fzeros	%f3
	nop
	sllx	%i5,	0x1C,	%i5
loop_263:
	and	%i5,	%i5,	%g2
	fnot1s	%f3,	%f15
	nop
	setx loop_264, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	mulscc	%g2,	%g2,	%i3
	xnor	%i3,	%i3,	%o6
	fcmple32	%f12,	%f14,	%o6
loop_264:
	ld	[%l7 + 0x54],	%f10
	tsubcctv	%o6,	0x154E,	%o6
	movne	%xcc,	%o6,	%g1
	nop
	fmovspos	%xcc,	%f2,	%f6
	fxors	%f6,	%f4,	%f13
	subccc	%g1,	0x0EB1,	%g1
	sdivcc	%g1,	0x1337,	%g1
	orn	%g1,	0x046D,	%g1
	st	%f13,	[%l7 + 0x70]
	tne	%xcc,	0x6
	movn	%xcc,	%g1,	%l4
	sub	%l4,	%l4,	%o2
	movle	%xcc,	%l1,	%o2
	movpos	%icc,	%g6,	%o2
	lduh	[%l7 + 0x3E],	%o2
	mulscc	%o2,	%o2,	%i6
	movpos	%icc,	%i4,	%i6
	addccc	%i6,	0x1E05,	%i6
	sdivcc	%i6,	0x1946,	%i6
	udiv	%i6,	0x06EB,	%i6
	fcmple16	%f12,	%f12,	%i6
	array16	%i6,	%o5,	%i6
	umulcc	%i6,	%o7,	%i6
	xnor	%i6,	0x01CE,	%i6
	fexpand	%f13,	%f14
	subccc	%i6,	0x03AE,	%i6
	addcc	%i6,	0x1003,	%i6
	subc	%i6,	%i6,	%o1
	andcc	%o1,	%o1,	%i1
	bge,a	loop_265
	udivx	%i1,	0x132D,	%i1
	fble	%fcc1,	loop_266
	popc	0x1293,	%i1
loop_265:
	tne	%icc,	0x7
	umulcc	%i1,	%i0,	%i1
loop_266:
	tgu	%xcc,	0x6
	brz,a	%i1,	loop_267
	fmovrdgz	%i1,	%f10,	%f0
	tvs	%icc,	0x0
	movrgz	%i1,	0x1E9,	%i1
loop_267:
	movvc	%xcc,	%o0,	%i1
	bcc,a	%xcc,	loop_268
	fblg,a	%fcc0,	loop_269
	move	%xcc,	%l5,	%i1
	fmovdcc	%icc,	%f0,	%f10
loop_268:
	tn	%icc,	0x3
loop_269:
	movleu	%icc,	%i1,	%g4
	mulx	%g4,	0x1A19,	%g4
	bvs	loop_270
	fmovs	%f10,	%f6
	fmovspos	%xcc,	%f7,	%f1
	fnot2s	%f1,	%f5
loop_270:
	nop
	stb	%g4,	[%l7 + 0x4D]
	std	%f0,	[%l7 + 0x78]
	movcc	%icc,	%g3,	%g4
	tleu	%icc,	0x5
	fxors	%f1,	%f4,	%f8
	tgu	%icc,	0x5
	fmovsvs	%icc,	%f2,	%f9
	tle	%xcc,	0x0
	movge	%xcc,	%g4,	%l0
	movrlz	%l0,	0x3F1,	%l0
	tl	%icc,	0x7
	popc	%l0,	%l0
	lduw	[%l7 + 0x14],	%l0
	sth	%l0,	[%l7 + 0x1A]
	movrne	%l0,	0x272,	%l0
	ldx	[%l7 + 0x30],	%l0
	movpos	%icc,	%g5,	%l0
	fmovrslz	%l0,	%f0,	%f5
	fbge	%fcc1,	loop_271
	fmovrdne	%l0,	%f4,	%f12
	sllx	%l0,	%l0,	%g7
	andn	%g7,	%g7,	%i7
loop_271:
	nop
	sth	%i7,	[%l7 + 0x78]
	mulx	%i7,	%i2,	%i7
	bge,a,pt	%icc,	loop_272
	udivx	%i7,	0x094C,	%i7
	addcc	%i7,	0x07ED,	%i7
	movrne	%i7,	%l6,	%i7
loop_272:
	fmovdvs	%icc,	%f11,	%f9
	sra	%i7,	0x16,	%i7
	stx	%i7,	[%l7 + 0x48]
	fbne	%fcc3,	loop_273
	fzero	%f12
	sth	%i7,	[%l7 + 0x4C]
	fcmpd	%fcc2,	%f14,	%f8
loop_273:
	fblg	%fcc0,	loop_274
	xnorcc	%i7,	0x003B,	%i7
	tgu	%xcc,	0x2
	bge	%icc,	loop_275
loop_274:
	fandnot2s	%f9,	%f12,	%f9
	bpos,a	loop_276
	tvs	%xcc,	0x3
loop_275:
	movrgz	%i7,	0x052,	%i7
	sub	%i7,	%i7,	%o4
loop_276:
	fcmpne16	%f8,	%f14,	%o4
	tle	%xcc,	0x3
	fmovdne	%icc,	%f6,	%f0
	fmovrdlez	%o4,	%f8,	%f12
	fmovrdlez	%o4,	%f4,	%f8
	call	loop_277
	te	%xcc,	0x7
	addcc	%o4,	0x1FFF,	%o4
	tgu	%xcc,	0x7
loop_277:
	taddcctv	%o4,	0x0F45,	%o4
	bleu,pn	%xcc,	loop_278
	subccc	%o4,	0x17CA,	%o4
	sth	%o4,	[%l7 + 0x58]
	taddcctv	%o4,	%o3,	%o4
loop_278:
	stw	%o4,	[%l7 + 0x68]
	fnegs	%f0,	%f15
	fbul	%fcc2,	loop_279
	fmovrdgz	%o4,	%f12,	%f0
	movcs	%icc,	%l3,	%o4
	array8	%o4,	%l2,	%o4
loop_279:
	ldsh	[%l7 + 0x1C],	%o4
	fmovsne	%xcc,	%f9,	%f4
	nop
	tcc	%xcc,	0x5
	brgz	%o4,	loop_280
	fmovsle	%xcc,	%f13,	%f0
	for	%f0,	%f8,	%f8
	lduh	[%l7 + 0x1A],	%o4
loop_280:
	movneg	%icc,	%i5,	%o4
	fnor	%f8,	%f6,	%f4
	tcc	%icc,	0x5
	fornot2s	%f0,	%f8,	%f13
	fmovdleu	%xcc,	%f9,	%f15
	mulx	%o4,	%g2,	%o4
	tvs	%xcc,	0x2
	fandnot2	%f4,	%f8,	%f8
	udivx	%o4,	0x167C,	%o4
	nop
	tneg	%xcc,	0x7
	fmul8x16	%f15,	%f14,	%f6
	taddcctv	%o4,	%i3,	%o4
	ba,a	%xcc,	loop_281
	fandnot1s	%f15,	%f9,	%f11
	lduh	[%l7 + 0x10],	%o4
	fmovsl	%xcc,	%f2,	%f13
loop_281:
	tvc	%xcc,	0x7
	movleu	%icc,	%o6,	%o4
	fbge,a	%fcc3,	loop_282
	ldsb	[%l7 + 0x6B],	%o4
	te	%xcc,	0x1
	xnorcc	%o4,	0x1000,	%o4
loop_282:
	fbl	%fcc1,	loop_283
	fmul8x16al	%f13,	%f5,	%f6
	fmovdneg	%icc,	%f0,	%f4
	nop
loop_283:
	sth	%o4,	[%l7 + 0x2C]
	ldx	[%l7 + 0x10],	%o4
	taddcc	%o4,	0x104C,	%o4
	brgez	%o4,	loop_284
	lduw	[%l7 + 0x24],	%o4
	fcmple32	%f6,	%f2,	%o4
	fcmpne32	%f6,	%f0,	%o4
loop_284:
	ble,a,pt	%xcc,	loop_285
	movvc	%icc,	%o4,	%g1
	tg	%xcc,	0x6
	orncc	%g1,	%g1,	%l4
loop_285:
	fandnot2s	%f4,	%f11,	%f6
	fbg	%fcc3,	loop_286
	te	%xcc,	0x1
	fpadd16s	%f6,	%f13,	%f6
	tgu	%xcc,	0x4
loop_286:
	subcc	%l4,	0x068E,	%l4
	nop
	nop
	fmovsle	%xcc,	%f15,	%f10
	orcc	%l4,	%l1,	%l4
	fmovsl	%icc,	%f14,	%f11
	bge	%icc,	loop_287
	lduh	[%l7 + 0x30],	%l4
	brlez	%l4,	loop_288
	tn	%icc,	0x5
loop_287:
	lduw	[%l7 + 0x74],	%l4
	ba,a	loop_289
loop_288:
	tgu	%xcc,	0x5
	fmovde	%icc,	%f10,	%f14
	fnegd	%f6,	%f14
loop_289:
	tl	%icc,	0x5
	movrgz	%l4,	0x0AA,	%l4
	movrne	%l4,	0x094,	%l4
	srlx	%l4,	0x02,	%l4
	nop
	sethi	0x195A,	%l4
	xnorcc	%l4,	%l4,	%g6
	ba,a,pt	%icc,	loop_290
	andcc	%g6,	%o2,	%g6
	lduw	[%l7 + 0x44],	%g6
	fmovrslez	%g6,	%f14,	%f8
loop_290:
	subccc	%g6,	%i4,	%g6
	bgu	loop_291
	bleu	%xcc,	loop_292
	te	%xcc,	0x6
	xnorcc	%g6,	0x18A2,	%g6
loop_291:
	nop
loop_292:
	xor	%g6,	0x05C4,	%g6
	movre	%g6,	%o5,	%g6
	tcs	%icc,	0x1
	ldsw	[%l7 + 0x4C],	%g6
	movrlez	%g6,	0x33E,	%g6
	st	%f8,	[%l7 + 0x64]
	fandnot1	%f6,	%f14,	%f0
	nop
	orn	%g6,	%o7,	%g6
	movne	%icc,	%i6,	%g6
	tsubcctv	%g6,	%o1,	%g6
	smul	%g6,	%i0,	%g6
	umul	%g6,	%o0,	%g6
	ldsw	[%l7 + 0x44],	%g6
	tgu	%icc,	0x3
	fpsub16	%f0,	%f14,	%f12
	std	%f12,	[%l7 + 0x58]
	srlx	%g6,	%l5,	%g6
	mova	%xcc,	%g6,	%i1
	lduh	[%l7 + 0x22],	%i1
	movrlz	%i1,	0x264,	%i1
	sth	%i1,	[%l7 + 0x46]
	brlez,a	%i1,	loop_293
	movcc	%icc,	%i1,	%g3
	fmovdge	%icc,	%f4,	%f1
	alignaddrl	%g3,	%g3,	%g4
loop_293:
	tne	%icc,	0x4
	bne	%icc,	loop_294
	brnz,a	%g4,	loop_295
	fone	%f12
	addcc	%g4,	0x1764,	%g4
loop_294:
	fbl,a	%fcc1,	loop_296
loop_295:
	movpos	%xcc,	%g4,	%g5
	ld	[%l7 + 0x5C],	%f9
	or	%g5,	0x09E0,	%g5
loop_296:
	nop
	fcmpd	%fcc0,	%f0,	%f8
	fpadd16	%f8,	%f10,	%f8
	sth	%g5,	[%l7 + 0x1E]
	fabss	%f1,	%f9
	and	%g5,	0x1576,	%g5
	fabsd	%f8,	%f4
	fmovdcs	%icc,	%f6,	%f10
	alignaddrl	%g5,	%g5,	%l0
	bcc,pt	%xcc,	loop_297
	fbue	%fcc0,	loop_298
	mulx	%l0,	0x0E7A,	%l0
	xorcc	%l0,	0x1789,	%l0
loop_297:
	fbuge	%fcc1,	loop_299
loop_298:
	array8	%l0,	%l0,	%g7
	nop
	movpos	%icc,	%g7,	%i2
loop_299:
	movn	%icc,	%l6,	%i2
	smulcc	%i2,	0x0391,	%i2
	lduh	[%l7 + 0x12],	%i2
	orn	%i2,	%i2,	%i7
	movleu	%icc,	%i7,	%o3
	alignaddr	%o3,	%o3,	%l3
	srlx	%l3,	0x0F,	%l3
	stb	%l3,	[%l7 + 0x78]
	bl,pn	%icc,	loop_300
	ta	%icc,	0x6
	mulscc	%l3,	%l3,	%l2
	move	%icc,	%i5,	%l2
loop_300:
	sdiv	%l2,	0x08F9,	%l2
	ldd	[%l7 + 0x18],	%f2
	subc	%l2,	0x184D,	%l2
	lduw	[%l7 + 0x58],	%l2
	array16	%l2,	%l2,	%g2
	fcmpeq32	%f8,	%f8,	%g2
	sethi	0x1EDE,	%g2
	and	%g2,	0x0968,	%g2
	udivx	%g2,	0x1684,	%g2
	nop
	fmovde	%xcc,	%f15,	%f6
	fblg	%fcc0,	loop_301
	and	%g2,	%i3,	%g2
	fpmerge	%f6,	%f7,	%f14
	fbge	%fcc0,	loop_302
loop_301:
	move	%xcc,	%o6,	%g2
	fbu,a	%fcc1,	loop_303
	movpos	%xcc,	%g2,	%o4
loop_302:
	nop
	setx loop_304, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	andn	%o4,	%g1,	%o4
loop_303:
	movrlez	%o4,	0x0C4,	%o4
	movvc	%xcc,	%l1,	%o4
loop_304:
	movrlez	%o4,	0x022,	%o4
	nop
	movrlez	%o4,	0x3F6,	%o4
	fmovdpos	%icc,	%f11,	%f1
	movne	%xcc,	%o4,	%l4
	tneg	%icc,	0x2
	movneg	%xcc,	%l4,	%o2
	fbule	%fcc2,	loop_305
	mova	%icc,	%o2,	%i4
	andcc	%i4,	%o5,	%i4
	ldub	[%l7 + 0x49],	%i4
loop_305:
	array8	%i4,	%i4,	%o7
	movl	%xcc,	%i6,	%o7
	movne	%icc,	%o1,	%o7
	movrne	%o7,	%i0,	%o7
	fzero	%f14
	fxor	%f14,	%f0,	%f12
	fand	%f12,	%f14,	%f0
	st	%f1,	[%l7 + 0x5C]
	sdivcc	%o7,	0x0A66,	%o7
	umul	%o7,	0x0811,	%o7
	tge	%icc,	0x1
	subccc	%o7,	%o0,	%o7
	orcc	%o7,	0x0155,	%o7
	ldsh	[%l7 + 0x46],	%o7
	fmovsa	%icc,	%f3,	%f10
	bleu,pn	%xcc,	loop_306
	lduw	[%l7 + 0x38],	%o7
	orncc	%o7,	%l5,	%o7
	ldd	[%l7 + 0x68],	%f4
loop_306:
	movcs	%icc,	%g6,	%o7
	mova	%icc,	%o7,	%i1
	tsubcc	%i1,	0x0D63,	%i1
	fpadd32s	%f10,	%f1,	%f6
	orn	%i1,	0x0E9B,	%i1
	fbg	%fcc1,	loop_307
	stb	%i1,	[%l7 + 0x13]
	nop
	ldd	[%l7 + 0x78],	%f0
loop_307:
	movrne	%i1,	%g3,	%i1
	fmovscs	%icc,	%f0,	%f15
	movvs	%xcc,	%i1,	%g4
	alignaddr	%g4,	%g5,	%g4
	ldsb	[%l7 + 0x3D],	%g4
	fcmpne16	%f0,	%f0,	%g4
	xorcc	%g4,	0x042A,	%g4
	movrne	%g4,	%g4,	%l0
	ldx	[%l7 + 0x30],	%l0
	sub	%l0,	0x026F,	%l0
	nop
	ldsw	[%l7 + 0x70],	%l0
	ldsw	[%l7 + 0x50],	%l0
	fnot1	%f0,	%f8
	fsrc1s	%f15,	%f10
	bcc	loop_308
	fxnors	%f15,	%f14,	%f15
	andcc	%l0,	%g7,	%l0
	orncc	%l0,	0x0E45,	%l0
loop_308:
	movre	%l0,	%l0,	%l6
	andncc	%l6,	%i2,	%l6
	te	%icc,	0x4
	fabss	%f15,	%f0
	movcc	%xcc,	%l6,	%i7
	sdivcc	%i7,	0x149F,	%i7
	smulcc	%i7,	%o3,	%i7
	nop
	setx loop_309, %l0, %l1
	jmpl %l1, %i7
	addccc	%i7,	0x06F1,	%i7
	mulx	%i7,	%l3,	%i7
	srlx	%i7,	%i7,	%i5
loop_309:
	fnot2s	%f15,	%f13
	st	%f15,	[%l7 + 0x48]
	taddcctv	%i5,	0x0066,	%i5
	fabsd	%f0,	%f14
	fornot2s	%f15,	%f15,	%f1
	fmuld8ulx16	%f1,	%f1,	%f8
	alignaddr	%i5,	%l2,	%i5
	umulcc	%i5,	0x1383,	%i5
	srlx	%i5,	0x12,	%i5
	fmovrslz	%i5,	%f15,	%f14
	bge	loop_310
	tleu	%icc,	0x6
	be,pt	%xcc,	loop_311
	fmovdl	%icc,	%f5,	%f1
loop_310:
	nop
	umul	%i5,	%i3,	%i5
loop_311:
	popc	%i5,	%i5
	udivx	%i5,	0x0297,	%i5
	tn	%icc,	0x3
	sdivcc	%i5,	0x17E2,	%i5
	tgu	%xcc,	0x4
	nop
	fmovsge	%xcc,	%f8,	%f3
	st	%f3,	[%l7 + 0x74]
	fmovd	%f8,	%f10
	fnor	%f8,	%f0,	%f6
	stx	%i5,	[%l7 + 0x60]
	nop
	orncc	%i5,	0x05B0,	%i5
	tgu	%xcc,	0x1
	tsubcc	%i5,	0x1B8D,	%i5
	tneg	%xcc,	0x0
	be,a,pt	%icc,	loop_312
	lduh	[%l7 + 0x0C],	%i5
	movneg	%icc,	%o6,	%i5
	sdivcc	%i5,	0x0E5F,	%i5
loop_312:
	nop
	udiv	%i5,	0x04F2,	%i5
	brgez,a	%i5,	loop_313
	bge,a,pn	%icc,	loop_314
	bge	%icc,	loop_315
	fmovsle	%xcc,	%f14,	%f3
loop_313:
	fcmps	%fcc3,	%f5,	%f14
loop_314:
	andn	%i5,	0x1BC5,	%i5
loop_315:
	nop
	bcc	loop_316
	popc	%i5,	%i5
	ldx	[%l7 + 0x68],	%i5
	ta	%xcc,	0x0
loop_316:
	std	%f6,	[%l7 + 0x48]
	sdiv	%i5,	0x14BF,	%i5
	udiv	%i5,	0x1814,	%i5
	fbule	%fcc0,	loop_317
	sllx	%i5,	%i5,	%g2
	alignaddr	%g2,	%g1,	%g2
	std	%f6,	[%l7 + 0x68]
loop_317:
	nop
	movre	%g2,	0x0D8,	%g2
	sdiv	%g2,	0x0681,	%g2
	stx	%g2,	[%l7 + 0x78]
	sth	%g2,	[%l7 + 0x3C]
	tneg	%xcc,	0x4
	sdivcc	%g2,	0x1075,	%g2
	fnot1s	%f14,	%f9
	bl,pn	%icc,	loop_318
	bneg,a,pt	%icc,	loop_319
	tg	%icc,	0x1
	siam	0x3
loop_318:
	bcc,a,pt	%icc,	loop_320
loop_319:
	sdiv	%g2,	0x0849,	%g2
	tleu	%xcc,	0x6
	nop
loop_320:
	array32	%g2,	%l1,	%g2
	fmovsn	%icc,	%f15,	%f15
	fpadd16s	%f15,	%f11,	%f4
	nop
	orncc	%g2,	0x1BB9,	%g2
	fmovdgu	%xcc,	%f10,	%f0
	nop
	srl	%g2,	%o4,	%g2
	smul	%g2,	%l4,	%g2
	add	%g2,	%g2,	%o2
	fbne,a	%fcc3,	loop_321
	fxnors	%f0,	%f4,	%f10
	alignaddr	%o2,	%o2,	%o5
	udiv	%o5,	0x1DA0,	%o5
loop_321:
	movrgez	%o5,	%o5,	%i4
	call	loop_322
	fandnot1	%f6,	%f14,	%f8
	fsrc2	%f8,	%f6
	subcc	%i4,	%i4,	%i6
loop_322:
	lduw	[%l7 + 0x10],	%i6
	nop
	fornot2	%f8,	%f14,	%f14
	fpack16	%f14,	%f0
	nop
	fmovrdne	%i6,	%f2,	%f10
	movg	%xcc,	%o1,	%i6
	srlx	%i6,	0x06,	%i6
	fpadd16	%f10,	%f12,	%f8
	nop
	fabsd	%f8,	%f10
	movvs	%xcc,	%i0,	%i6
	subcc	%i6,	%o0,	%i6
	movrlez	%i6,	%l5,	%i6
	ldsh	[%l7 + 0x62],	%i6
	fpadd32	%f8,	%f0,	%f6
	tne	%icc,	0x5
	te	%icc,	0x7
	ldub	[%l7 + 0x65],	%i6
	orn	%i6,	0x0A63,	%i6
	fmovsvc	%xcc,	%f0,	%f15
	tvc	%xcc,	0x7
	fbo,a	%fcc1,	loop_323
	fbuge	%fcc1,	loop_324
	andn	%i6,	%g6,	%i6
	umul	%i6,	%i6,	%o7
loop_323:
	sra	%o7,	%g3,	%o7
loop_324:
	fornot2s	%f15,	%f4,	%f13
	add	%o7,	%i1,	%o7
	subccc	%o7,	0x02A6,	%o7
	movge	%xcc,	%o7,	%g5
	fmovs	%f13,	%f1
	nop
	tvs	%icc,	0x6
	taddcc	%g5,	0x0CA5,	%g5
	fbul	%fcc0,	loop_325
	fsrc1	%f6,	%f4
	ldsh	[%l7 + 0x38],	%g5
	xorcc	%g5,	%g5,	%g4
loop_325:
	nop
	andncc	%g4,	%g4,	%g7
	fbl	%fcc2,	loop_326
	ldsh	[%l7 + 0x16],	%g7
	tpos	%icc,	0x3
	fmovrsgz	%g7,	%f11,	%f11
loop_326:
	tg	%icc,	0x7
	movl	%xcc,	%g7,	%l0
	stw	%l0,	[%l7 + 0x20]
	nop
	nop
	nop
	be,pn	%icc,	loop_327
	ldub	[%l7 + 0x36],	%l0
	sub	%l0,	0x1235,	%l0
	movre	%l0,	0x0A8,	%l0
loop_327:
	xor	%l0,	0x0113,	%l0
	addcc	%l0,	%i2,	%l0
	brnz	%l0,	loop_328
	tgu	%xcc,	0x2
	fmovrdne	%l0,	%f8,	%f4
	fbul	%fcc3,	loop_329
loop_328:
	fmuld8sux16	%f11,	%f4,	%f2
	fbn,a	%fcc0,	loop_330
	movne	%icc,	%l6,	%l0
loop_329:
	movleu	%icc,	%l0,	%o3
	srlx	%o3,	0x0D,	%o3
loop_330:
	ldx	[%l7 + 0x38],	%o3
	movgu	%xcc,	%o3,	%l3
	ldsh	[%l7 + 0x74],	%l3
	tl	%xcc,	0x6
	brz,a	%l3,	loop_331
	addcc	%l3,	%l3,	%i7
	tsubcc	%i7,	0x0FE2,	%i7
	fzero	%f2
loop_331:
	xorcc	%i7,	%i7,	%l2
	tg	%icc,	0x7
	stx	%l2,	[%l7 + 0x30]
	sth	%l2,	[%l7 + 0x74]
	nop
	setx loop_332, %l0, %l1
	jmpl %l1, %l2
	faligndata	%f2,	%f4,	%f14
	ld	[%l7 + 0x48],	%f6
	ldsw	[%l7 + 0x48],	%l2
loop_332:
	nop
	fmovdneg	%icc,	%f15,	%f3
	srax	%l2,	0x0E,	%l2
	fnors	%f3,	%f2,	%f0
	orn	%l2,	0x0266,	%l2
	tne	%xcc,	0x1
	fba,a	%fcc1,	loop_333
	fpadd32	%f14,	%f12,	%f8
	nop
	fbue,a	%fcc3,	loop_334
loop_333:
	sra	%l2,	0x19,	%l2
	ldsh	[%l7 + 0x2C],	%l2
	tne	%xcc,	0x7
loop_334:
	fmul8x16	%f0,	%f6,	%f8
	xor	%l2,	%i3,	%l2
	fxors	%f0,	%f15,	%f9
	udivcc	%l2,	0x155C,	%l2
	ldsb	[%l7 + 0x4F],	%l2
	array32	%l2,	%o6,	%l2
	movvs	%icc,	%i5,	%l2
	nop
	movrne	%l2,	%l2,	%g1
	udivx	%g1,	0x0163,	%g1
	stx	%g1,	[%l7 + 0x28]
	srax	%g1,	0x1F,	%g1
	nop
	nop
	fbuge	%fcc0,	loop_335
	fmovsa	%icc,	%f14,	%f10
	fnot2	%f8,	%f12
	move	%xcc,	%g1,	%l1
loop_335:
	nop
	bn,pt	%xcc,	loop_336
	tl	%icc,	0x1
	movgu	%xcc,	%o4,	%l1
	udivcc	%l1,	0x0E04,	%l1
loop_336:
	fbuge,a	%fcc3,	loop_337
	sdiv	%l1,	0x1E64,	%l1
	add	%l1,	0x0ECA,	%l1
	fmovdpos	%icc,	%f7,	%f4
loop_337:
	udiv	%l1,	0x0914,	%l1
	fcmpd	%fcc1,	%f2,	%f10
	nop
	movcc	%xcc,	%l4,	%l1
	add	%l1,	0x12F4,	%l1
	andn	%l1,	%g2,	%l1
	ldub	[%l7 + 0x43],	%l1
	movcs	%icc,	%o2,	%l1
	fnot2	%f10,	%f8
	tsubcctv	%l1,	%o5,	%l1
	stx	%l1,	[%l7 + 0x20]
	tleu	%xcc,	0x4
	addccc	%l1,	%i4,	%l1
	movcc	%icc,	%l1,	%o1
	movpos	%xcc,	%i0,	%o1
	ldsb	[%l7 + 0x15],	%o1
	fbue,a	%fcc1,	loop_338
	fmovrdgz	%o1,	%f0,	%f2
	nop
	tsubcctv	%o1,	0x17A4,	%o1
loop_338:
	sllx	%o1,	%o1,	%o0
	movcc	%icc,	%l5,	%o0
	st	%f4,	[%l7 + 0x30]
	srl	%o0,	%g6,	%o0
	bge	loop_339
	fzero	%f2
	popc	%o0,	%o0
	udiv	%o0,	0x01E9,	%o0
loop_339:
	fcmple16	%f2,	%f8,	%o0
	fmovscs	%xcc,	%f3,	%f0
	fmovsa	%icc,	%f4,	%f11
	bpos,a,pt	%xcc,	loop_340
	brlez	%o0,	loop_341
	tpos	%xcc,	0x6
	bcc,pn	%xcc,	loop_342
loop_340:
	ldsb	[%l7 + 0x43],	%o0
loop_341:
	sra	%o0,	%o0,	%i6
	umulcc	%i6,	0x0E86,	%i6
loop_342:
	fnands	%f11,	%f1,	%f5
	sth	%i6,	[%l7 + 0x56]
	fbug	%fcc2,	loop_343
	sllx	%i6,	0x17,	%i6
	stb	%i6,	[%l7 + 0x40]
	fbuge	%fcc1,	loop_344
loop_343:
	nop
	setx loop_345, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	sdiv	%i6,	0x1B34,	%i6
	nop
	setx loop_346, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_344:
	bcc,pn	%xcc,	loop_347
loop_345:
	taddcctv	%i6,	%g3,	%i6
	fone	%f2
loop_346:
	tvc	%xcc,	0x0
loop_347:
	fzero	%f2
	sll	%i6,	%i6,	%i1
	bcc,a,pt	%xcc,	loop_348
	taddcc	%i1,	0x1897,	%i1
	nop
	nop
loop_348:
	tn	%icc,	0x5
	ldsw	[%l7 + 0x54],	%i1
	fbul	%fcc2,	loop_349
	movvs	%xcc,	%i1,	%o7
	movpos	%icc,	%o7,	%g5
	tvs	%icc,	0x1
loop_349:
	fcmple16	%f2,	%f2,	%g5
	ldub	[%l7 + 0x3A],	%g5
	mulx	%g5,	%g5,	%g4
	fmovrsne	%g4,	%f5,	%f4
	ldsb	[%l7 + 0x3E],	%g4
	mova	%icc,	%g4,	%g7
	movl	%xcc,	%i2,	%g7
	fmovsa	%icc,	%f4,	%f4
	fmovrslz	%g7,	%f7,	%f5
	fmovdcs	%icc,	%f11,	%f4
	subccc	%g7,	%l6,	%g7
	tsubcctv	%g7,	%g7,	%l0
	tneg	%icc,	0x4
	movle	%icc,	%o3,	%l0
	fmovsl	%icc,	%f8,	%f2
	xor	%l0,	0x00EE,	%l0
	movg	%icc,	%l0,	%l3
	fpsub16	%f2,	%f6,	%f14
	std	%f14,	[%l7 + 0x70]
	ldx	[%l7 + 0x78],	%l3
	lduh	[%l7 + 0x24],	%l3
	stx	%l3,	[%l7 + 0x70]
	fxnor	%f14,	%f10,	%f2
	nop
	ldub	[%l7 + 0x66],	%l3
	nop
	ldsb	[%l7 + 0x68],	%l3
	movl	%icc,	%l3,	%i7
	alignaddrl	%i7,	%i7,	%i3
	or	%i3,	%o6,	%i3
	popc	0x15F8,	%i3
	fmovrse	%i3,	%f9,	%f3
	nop
	or	%i3,	0x0EDC,	%i3
	fmovsn	%icc,	%f6,	%f3
	faligndata	%f2,	%f6,	%f0
	taddcctv	%i3,	0x066F,	%i3
	umulcc	%i3,	%i3,	%i5
	st	%f3,	[%l7 + 0x48]
	stb	%i5,	[%l7 + 0x19]
	ldub	[%l7 + 0x5B],	%i5
	pdist	%f0,	%f4,	%f8
	tsubcctv	%i5,	%l2,	%i5
	movrgz	%i5,	0x205,	%i5
	lduw	[%l7 + 0x68],	%i5
	xnor	%i5,	0x19B8,	%i5
	sth	%i5,	[%l7 + 0x52]
	tne	%icc,	0x4
	tneg	%xcc,	0x7
	fandnot1	%f8,	%f0,	%f2
	fcmpes	%fcc3,	%f7,	%f14
	ldd	[%l7 + 0x68],	%f8
	xorcc	%i5,	%g1,	%i5
	fmovrse	%i5,	%f5,	%f13
	brz	%i5,	loop_350
	fpsub16	%f2,	%f8,	%f12
	fmovsn	%icc,	%f14,	%f15
	tpos	%icc,	0x2
loop_350:
	umulcc	%i5,	0x0B0E,	%i5
	fpack32	%f12,	%f2,	%f8
	nop
	taddcc	%i5,	0x0E7A,	%i5
	movg	%xcc,	%o4,	%i5
	xnor	%i5,	%l4,	%i5
	nop
	fmovscs	%xcc,	%f8,	%f2
	ldd	[%l7 + 0x48],	%f6
	fmovdl	%xcc,	%f10,	%f14
	brlz,a	%i5,	loop_351
	movrlez	%i5,	0x1D3,	%i5
	movgu	%xcc,	%i5,	%g2
	umulcc	%g2,	0x1B6C,	%g2
loop_351:
	st	%f14,	[%l7 + 0x68]
	fone	%f8
	ldsw	[%l7 + 0x68],	%g2
	fsrc1	%f8,	%f4
	ldsw	[%l7 + 0x4C],	%g2
	ld	[%l7 + 0x54],	%f1
	subcc	%g2,	0x09FC,	%g2
	tcs	%icc,	0x6
	sll	%g2,	%g2,	%o2
	umul	%o2,	0x0227,	%o2
	bcc,a	%icc,	loop_352
	sth	%o2,	[%l7 + 0x60]
	sdiv	%o2,	0x165D,	%o2
	smul	%o2,	0x03EC,	%o2
loop_352:
	movvs	%xcc,	%o2,	%o5
	fcmpes	%fcc2,	%f14,	%f0
	bpos	loop_353
	fbu	%fcc2,	loop_354
	ld	[%l7 + 0x44],	%f3
	orn	%o5,	0x185B,	%o5
loop_353:
	orncc	%o5,	0x0684,	%o5
loop_354:
	fpadd32s	%f0,	%f1,	%f11
	subccc	%o5,	%o5,	%i4
	fmovrdlz	%i4,	%f10,	%f8
	ble,pn	%xcc,	loop_355
	popc	0x1066,	%i4
	xnor	%i4,	0x133B,	%i4
	movne	%icc,	%i4,	%l1
loop_355:
	mulx	%l1,	0x1EBA,	%l1
	lduh	[%l7 + 0x5A],	%l1
	for	%f8,	%f6,	%f12
	mulscc	%l1,	%l1,	%i0
	fmovrde	%i0,	%f0,	%f10
	mulscc	%i0,	%i0,	%o1
	xor	%o1,	%o1,	%l5
	fzeros	%f11
	tl	%icc,	0x0
	fmovsvs	%icc,	%f3,	%f1
	te	%icc,	0x5
	ldsh	[%l7 + 0x36],	%l5
	tl	%icc,	0x7
	ldsb	[%l7 + 0x62],	%l5
	ldd	[%l7 + 0x40],	%f10
	sdivx	%l5,	0x0B72,	%l5
	sdiv	%l5,	0x10BE,	%l5
	tleu	%xcc,	0x1
	smul	%l5,	%l5,	%g6
	movgu	%xcc,	%g6,	%o0
	movn	%xcc,	%o0,	%g3
	sll	%g3,	0x13,	%g3
	fbuge,a	%fcc2,	loop_356
	andcc	%g3,	0x06B8,	%g3
	movgu	%xcc,	%g3,	%i6
	xorcc	%i6,	0x0037,	%i6
loop_356:
	udiv	%i6,	0x04B1,	%i6
	tsubcc	%i6,	0x1E3B,	%i6
	srl	%i6,	%i6,	%i1
	xnorcc	%i1,	0x1F78,	%i1
	xnor	%i1,	0x1A85,	%i1
	movneg	%icc,	%i1,	%o7
	fcmped	%fcc0,	%f10,	%f8
	fpsub32	%f8,	%f0,	%f2
	fmovdcc	%icc,	%f14,	%f13
	fpadd16	%f2,	%f14,	%f8
	subc	%o7,	%o7,	%g5
	movrgez	%g5,	0x3A7,	%g5
	tle	%icc,	0x3
	movne	%xcc,	%g5,	%g4
	tne	%icc,	0x5
	nop
	stb	%g4,	[%l7 + 0x4B]
	ta	%icc,	0x5
	tg	%icc,	0x4
	tvs	%xcc,	0x2
	movneg	%xcc,	%i2,	%g4
	fmovrdgz	%g4,	%f0,	%f2
	ldx	[%l7 + 0x60],	%g4
	fba	%fcc3,	loop_357
	xnorcc	%g4,	0x144D,	%g4
	fbo	%fcc0,	loop_358
	fmovrsne	%g4,	%f6,	%f12
loop_357:
	movl	%xcc,	%g4,	%l6
	nop
loop_358:
	udivx	%l6,	0x1C8C,	%l6
	ld	[%l7 + 0x14],	%f6
	fbug	%fcc2,	loop_359
	ldsh	[%l7 + 0x5C],	%l6
	sdiv	%l6,	0x0B75,	%l6
	fmovsge	%xcc,	%f0,	%f13
loop_359:
	siam	0x5
	movrgz	%l6,	%g7,	%l6
	addccc	%l6,	%o3,	%l6
	umulcc	%l6,	%l6,	%l0
	tvc	%xcc,	0x1
	fmovdneg	%icc,	%f13,	%f11
	fmovdpos	%icc,	%f13,	%f10
	fmovrde	%l0,	%f14,	%f0
	array16	%l0,	%l0,	%l3
	movrgz	%l3,	%i7,	%l3
	movrlz	%l3,	0x19B,	%l3
	srlx	%l3,	%l3,	%o6
	ld	[%l7 + 0x58],	%f6
	faligndata	%f0,	%f14,	%f2
	brlz	%o6,	loop_360
	ld	[%l7 + 0x68],	%f14
	ldd	[%l7 + 0x10],	%f4
	xor	%o6,	0x11BB,	%o6
loop_360:
	nop
	tge	%xcc,	0x6
	fnor	%f2,	%f4,	%f6
	bge,a	loop_361
	nop
	fpack32	%f6,	%f4,	%f2
	fbge,a	%fcc0,	loop_362
loop_361:
	fblg,a	%fcc2,	loop_363
	sra	%o6,	0x02,	%o6
	te	%xcc,	0x1
loop_362:
	ldub	[%l7 + 0x08],	%o6
loop_363:
	fmovde	%xcc,	%f5,	%f12
	subcc	%o6,	%i3,	%o6
	tpos	%xcc,	0x6
	orcc	%o6,	%l2,	%o6
	sllx	%o6,	0x1F,	%o6
	ta	%xcc,	0x4
	fbn	%fcc2,	loop_364
	fnot2s	%f12,	%f15
	smul	%o6,	%o6,	%g1
	fba,a	%fcc1,	loop_365
loop_364:
	sdivx	%g1,	0x0DBF,	%g1
	fornot2s	%f12,	%f0,	%f3
	fand	%f2,	%f4,	%f8
loop_365:
	srax	%g1,	%g1,	%o4
	srl	%o4,	%l4,	%o4
	ldx	[%l7 + 0x18],	%o4
	xorcc	%o4,	0x0767,	%o4
	fmovdneg	%xcc,	%f1,	%f1
	addcc	%o4,	%o4,	%i5
	brlez,a	%i5,	loop_366
	srax	%i5,	0x0B,	%i5
	andcc	%i5,	0x1262,	%i5
	tvs	%icc,	0x4
loop_366:
	movrlez	%i5,	0x03F,	%i5
	tsubcc	%i5,	0x02EB,	%i5
	tne	%icc,	0x0
	movle	%xcc,	%g2,	%i5
	nop
	subc	%i5,	0x1422,	%i5
	movl	%xcc,	%i5,	%o2
	srax	%o2,	%o2,	%o5
	lduh	[%l7 + 0x54],	%o5
	tneg	%xcc,	0x0
	smulcc	%o5,	%i4,	%o5
	sth	%o5,	[%l7 + 0x0C]
	fmovsvc	%icc,	%f13,	%f13
	bneg,a	loop_367
	bn,a,pt	%xcc,	loop_368
	fmovscs	%xcc,	%f13,	%f11
	add	%o5,	0x0729,	%o5
loop_367:
	fpsub32s	%f11,	%f10,	%f11
loop_368:
	fba	%fcc3,	loop_369
	bl	%icc,	loop_370
	movcc	%icc,	%l1,	%o5
	tvs	%icc,	0x2
loop_369:
	ldd	[%l7 + 0x30],	%f12
loop_370:
	stb	%o5,	[%l7 + 0x1F]
	movg	%xcc,	%i0,	%o5
	ldd	[%l7 + 0x28],	%f0
	movn	%icc,	%o1,	%o5
	ldx	[%l7 + 0x60],	%o5
	sdiv	%o5,	0x13E1,	%o5
	fandnot1	%f8,	%f4,	%f12
	movneg	%xcc,	%o5,	%l5
	nop
	tne	%icc,	0x0
	fones	%f11
	popc	0x102E,	%l5
	mulx	%l5,	%g6,	%l5
	std	%f12,	[%l7 + 0x10]
	ldsb	[%l7 + 0x72],	%l5
	ldub	[%l7 + 0x5E],	%l5
	fbn,a	%fcc3,	loop_371
	sth	%l5,	[%l7 + 0x64]
	fors	%f11,	%f9,	%f3
	fcmpeq16	%f12,	%f14,	%l5
loop_371:
	xnor	%l5,	0x15B3,	%l5
	fsrc1	%f12,	%f8
	sethi	0x024D,	%l5
	movge	%icc,	%l5,	%o0
	fnors	%f3,	%f7,	%f13
	fandnot1	%f12,	%f6,	%f6
	nop
	ldsb	[%l7 + 0x4D],	%o0
	tne	%xcc,	0x7
	srl	%o0,	%o0,	%g3
	tcc	%icc,	0x5
	fabsd	%f6,	%f10
	fmovdpos	%xcc,	%f3,	%f8
	movpos	%icc,	%i6,	%g3
	sra	%g3,	%g3,	%i1
	fmovsge	%icc,	%f9,	%f7
	udivx	%i1,	0x03E6,	%i1
	movpos	%xcc,	%i1,	%o7
	nop
	mova	%xcc,	%g5,	%o7
	fcmpeq16	%f6,	%f8,	%o7
	fcmpeq16	%f6,	%f10,	%o7
	movre	%o7,	%o7,	%i2
	taddcctv	%i2,	%i2,	%g4
	ld	[%l7 + 0x58],	%f12
	bne,a,pn	%icc,	loop_372
	xor	%g4,	0x147D,	%g4
	add	%g4,	%g7,	%g4
	lduw	[%l7 + 0x4C],	%g4
loop_372:
	fmovdleu	%xcc,	%f15,	%f5
	nop
	sra	%g4,	0x16,	%g4
	umul	%g4,	%g4,	%o3
	std	%f6,	[%l7 + 0x48]
	sdivcc	%o3,	0x0B0F,	%o3
	sra	%o3,	%o3,	%l6
	fmovrslez	%l6,	%f0,	%f6
	fbn	%fcc1,	loop_373
	nop
	lduh	[%l7 + 0x1C],	%l6
	lduh	[%l7 + 0x40],	%l6
loop_373:
	ld	[%l7 + 0x40],	%f8
	stb	%l6,	[%l7 + 0x15]
	fbo	%fcc2,	loop_374
	ldd	[%l7 + 0x30],	%f14
	stx	%l6,	[%l7 + 0x08]
	std	%f6,	[%l7 + 0x38]
loop_374:
	umul	%l6,	0x15C1,	%l6
	movne	%xcc,	%l0,	%l6
	fabsd	%f6,	%f10
	tl	%xcc,	0x3
	fmovrdgez	%l6,	%f0,	%f0
	stw	%l6,	[%l7 + 0x6C]
	tsubcc	%l6,	%l6,	%i7
	tl	%xcc,	0x1
	tl	%icc,	0x7
	nop
	andn	%i7,	%l3,	%i7
	stw	%i7,	[%l7 + 0x44]
	fbge	%fcc0,	loop_375
	fzero	%f0
	tcs	%xcc,	0x6
	brlz	%i7,	loop_376
loop_375:
	tne	%icc,	0x3
	fmovdneg	%icc,	%f3,	%f8
	movn	%icc,	%i3,	%i7
loop_376:
	tvc	%xcc,	0x4
	fbo	%fcc1,	loop_377
	!movrlez	%i7,	%l2,	%i7
	fpackfix	%f0,	%f13
	ldd	[%l7 + 0x18],	%f10
loop_377:
	movle	%xcc,	%i7,	%o6
	nop
	tne	%xcc,	0x3
	orncc	%o6,	%g1,	%o6
	fmovrse	%o6,	%f2,	%f5
	mulscc	%o6,	%l4,	%o6
	nop
	movgu	%icc,	%o4,	%o6
	nop
	add	%o6,	%o6,	%g2
	stb	%g2,	[%l7 + 0x56]
	taddcc	%g2,	%g2,	%i5
	movrgz	%i5,	0x315,	%i5
	fmovscs	%icc,	%f15,	%f3
	lduh	[%l7 + 0x34],	%i5
	fnor	%f0,	%f4,	%f14
	fmovse	%xcc,	%f8,	%f14
	bcs	loop_378
	fxnors	%f14,	%f9,	%f7
	popc	0x15B2,	%i5
	nop
loop_378:
	st	%f7,	[%l7 + 0x78]
	movneg	%icc,	%o2,	%i5
	ba,a,pn	%xcc,	loop_379
	movrgez	%i5,	0x140,	%i5
	ldd	[%l7 + 0x08],	%f4
	fmovrslez	%i5,	%f11,	%f3
loop_379:
	fandnot1s	%f3,	%f5,	%f11
	fxnor	%f14,	%f12,	%f4
	movle	%xcc,	%i4,	%i5
	lduh	[%l7 + 0x4C],	%i5
	sra	%i5,	0x04,	%i5
	fnot2	%f4,	%f4
	srl	%i5,	%i5,	%l1
	ldx	[%l7 + 0x18],	%l1
	movvs	%icc,	%i0,	%l1
	umulcc	%l1,	%o1,	%l1
	bl,pn	%xcc,	loop_380
	fbo,a	%fcc2,	loop_381
	fxors	%f11,	%f9,	%f8
	fabss	%f8,	%f7
loop_380:
	fmovdgu	%xcc,	%f4,	%f14
loop_381:
	bgu	loop_382
	fmovrslz	%l1,	%f7,	%f5
	tsubcc	%l1,	%l1,	%o5
	ta	%icc,	0x5
loop_382:
	ldx	[%l7 + 0x30],	%o5
	udivx	%o5,	0x1CC8,	%o5
	brlz	%o5,	loop_383
	tleu	%xcc,	0x0
	udiv	%o5,	0x0642,	%o5
	srl	%o5,	0x19,	%o5
loop_383:
	tl	%icc,	0x5
	nop
	fxnors	%f5,	%f13,	%f6
	andncc	%o5,	%g6,	%o5
	subccc	%o5,	0x1841,	%o5
	nop
	fbuge	%fcc1,	loop_384
	stw	%o5,	[%l7 + 0x38]
	tvc	%icc,	0x6
	movle	%xcc,	%l5,	%o5
loop_384:
	lduh	[%l7 + 0x46],	%o5
	movrlez	%o5,	0x229,	%o5
	tl	%xcc,	0x6
	addcc	%o5,	0x0080,	%o5
	tsubcc	%o5,	%o0,	%o5
	stb	%o5,	[%l7 + 0x3E]
	addcc	%o5,	%o5,	%i6
	fzeros	%f6
	movl	%icc,	%g3,	%i6
	stb	%i6,	[%l7 + 0x0D]
	ldd	[%l7 + 0x18],	%f0
	ba	%xcc,	loop_385
	nop
	setx loop_386, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	tneg	%xcc,	0x5
	fornot1s	%f6,	%f9,	%f9
loop_385:
	tcs	%xcc,	0x5
loop_386:
	movcs	%icc,	%i1,	%i6
	fbu	%fcc2,	loop_387
	movle	%xcc,	%g5,	%i6
	addcc	%i6,	%i6,	%o7
	subccc	%o7,	%i2,	%o7
loop_387:
	mulx	%o7,	%g7,	%o7
	ldub	[%l7 + 0x77],	%o7
	bn	loop_388
	movrgez	%o7,	%o7,	%g4
	tvs	%icc,	0x6
	fmovsvs	%xcc,	%f3,	%f3
loop_388:
	udivx	%g4,	0x1851,	%g4
	fone	%f4
	movne	%icc,	%g4,	%o3
	be,pn	%xcc,	loop_389
	fnegd	%f4,	%f8
	fmovrdne	%o3,	%f4,	%f14
	ldx	[%l7 + 0x50],	%o3
loop_389:
	fmovspos	%xcc,	%f2,	%f1
	tleu	%xcc,	0x2
	brlz	%o3,	loop_390
	andn	%o3,	0x0003,	%o3
	lduw	[%l7 + 0x28],	%o3
	movne	%icc,	%l0,	%o3
loop_390:
	stb	%o3,	[%l7 + 0x39]
	fsrc2	%f14,	%f14
	st	%f1,	[%l7 + 0x40]
	st	%f1,	[%l7 + 0x4C]
	smulcc	%o3,	0x1238,	%o3
	alignaddr	%o3,	%l6,	%o3
	tvs	%xcc,	0x5
	fmovda	%xcc,	%f11,	%f8
	movre	%o3,	0x070,	%o3
	fcmps	%fcc3,	%f11,	%f14
	fbuge	%fcc2,	loop_391
	movle	%icc,	%o3,	%l3
	st	%f14,	[%l7 + 0x64]
	fmovdpos	%icc,	%f0,	%f5
loop_391:
	call	loop_392
	fbg,a	%fcc3,	loop_393
	tvc	%xcc,	0x7
	fbuge	%fcc0,	loop_394
loop_392:
	bcs,pt	%xcc,	loop_395
loop_393:
	udiv	%l3,	0x03D4,	%l3
	nop
loop_394:
	stw	%l3,	[%l7 + 0x4C]
loop_395:
	srlx	%l3,	0x0D,	%l3
	alignaddrl	%l3,	%i3,	%l3
	movrlez	%l3,	0x048,	%l3
	ldd	[%l7 + 0x08],	%f6
	brz,a	%l3,	loop_396
	stb	%l3,	[%l7 + 0x72]
	tleu	%icc,	0x0
	movne	%icc,	%l3,	%l2
loop_396:
	fbug,a	%fcc1,	loop_397
	bvs,a,pt	%xcc,	loop_398
	movrgez	%l2,	%l2,	%i7
	sllx	%i7,	0x16,	%i7
loop_397:
	ldsb	[%l7 + 0x67],	%i7
loop_398:
	tle	%icc,	0x6
	sub	%i7,	%i7,	%g1
	smul	%g1,	%g1,	%l4
	tcc	%icc,	0x6
	addccc	%l4,	0x0717,	%l4
	xnorcc	%l4,	0x17B8,	%l4
	fzeros	%f5
	srax	%l4,	0x0C,	%l4
	fornot2s	%f5,	%f2,	%f11
	sdivx	%l4,	0x1C99,	%l4
	fmovsge	%icc,	%f11,	%f12
	array16	%l4,	%l4,	%o4
	fcmps	%fcc2,	%f10,	%f6
	orncc	%o4,	0x1EBD,	%o4
	ta	%xcc,	0x3
	array8	%o4,	%o4,	%o6
	ldsb	[%l7 + 0x19],	%o6
	movvs	%xcc,	%o6,	%g2
	fmovrdgz	%g2,	%f12,	%f10
	mulscc	%g2,	%o2,	%g2
	movleu	%xcc,	%g2,	%i4
	or	%i4,	%i4,	%i5
	lduw	[%l7 + 0x24],	%i5
	tpos	%xcc,	0x0
	fpadd32	%f10,	%f2,	%f12
	nop
	andcc	%i5,	%i5,	%i0
	xnorcc	%i0,	%i0,	%o1
	ldsh	[%l7 + 0x34],	%o1
	sth	%o1,	[%l7 + 0x32]
	fbuge,a	%fcc1,	loop_399
	nop
	setx loop_400, %l0, %l1
	jmpl %l1, %o1
	array32	%o1,	%l1,	%o1
	sll	%o1,	%g6,	%o1
loop_399:
	movge	%icc,	%l5,	%o1
loop_400:
	nop
	tle	%icc,	0x2
	xor	%o1,	0x174E,	%o1
	movneg	%icc,	%o1,	%o0
	fone	%f12
	tpos	%icc,	0x4
	movgu	%icc,	%o0,	%o5
	sll	%o5,	0x18,	%o5
	bvs,a,pt	%xcc,	loop_401
	movrlz	%o5,	%g3,	%o5
	nop
	setx loop_402, %l0, %l1
	jmpl %l1, %o5
	array16	%o5,	%i1,	%o5
loop_401:
	or	%o5,	%o5,	%g5
	stb	%g5,	[%l7 + 0x5F]
loop_402:
	fbuge	%fcc0,	loop_403
	fmovscc	%icc,	%f1,	%f0
	for	%f12,	%f0,	%f8
	nop
loop_403:
	fmovde	%icc,	%f7,	%f11
	sll	%g5,	%g5,	%i6
	stw	%i6,	[%l7 + 0x54]
	movneg	%xcc,	%i6,	%i2
	ldx	[%l7 + 0x40],	%i2
	fmovsle	%xcc,	%f4,	%f0
	sth	%i2,	[%l7 + 0x12]
	ldd	[%l7 + 0x48],	%f4
	mulscc	%i2,	0x0C77,	%i2
	ldsb	[%l7 + 0x4B],	%i2
	tvs	%icc,	0x1
	srlx	%i2,	0x14,	%i2
	subccc	%i2,	%i2,	%g7
	fpadd32	%f8,	%f4,	%f2
	udiv	%g7,	0x11D0,	%g7
	nop
	nop
	ldsh	[%l7 + 0x2A],	%g7
	andncc	%g7,	%o7,	%g7
	fcmpd	%fcc3,	%f10,	%f12
	udivcc	%g7,	0x037B,	%g7
	brz,a	%g7,	loop_404
	fornot1s	%f0,	%f12,	%f7
	lduh	[%l7 + 0x68],	%g7
	nop
loop_404:
	tcc	%icc,	0x4
	udiv	%g7,	0x18A9,	%g7
	array16	%g7,	%g7,	%g4
	sth	%g4,	[%l7 + 0x16]
	st	%f7,	[%l7 + 0x60]
	movleu	%icc,	%g4,	%l0
	stb	%l0,	[%l7 + 0x42]
	fbl	%fcc3,	loop_405
	nop
	nop
	addccc	%l0,	%l6,	%l0
loop_405:
	umulcc	%l0,	%o3,	%l0
	fmovrdgez	%l0,	%f4,	%f12
	nop
	setx loop_406, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	orcc	%l0,	0x1FE1,	%l0
	brlez	%l0,	loop_407
	movgu	%icc,	%l0,	%i3
loop_406:
	move	%icc,	%l3,	%i3
	srl	%i3,	%l2,	%i3
loop_407:
	ldsw	[%l7 + 0x30],	%i3
	bne,a,pt	%xcc,	loop_408
	fands	%f7,	%f9,	%f3
	fsrc2	%f12,	%f2
	srlx	%i3,	%i7,	%i3
loop_408:
	fone	%f12
	fexpand	%f3,	%f14
	ldx	[%l7 + 0x48],	%i3
	sethi	0x034A,	%i3
	bleu,a	loop_409
	ldx	[%l7 + 0x70],	%i3
	fmovdg	%xcc,	%f14,	%f5
	fbuge,a	%fcc0,	loop_410
loop_409:
	fpsub32s	%f5,	%f3,	%f8
	array8	%i3,	%g1,	%i3
	udivcc	%i3,	0x1514,	%i3
loop_410:
	fble	%fcc2,	loop_411
	fmovsgu	%icc,	%f8,	%f12
	fmovsn	%xcc,	%f5,	%f4
	movleu	%xcc,	%l4,	%i3
loop_411:
	subcc	%i3,	%i3,	%o4
	move	%icc,	%o4,	%o6
	fnot2s	%f4,	%f8
	srl	%o6,	%o6,	%o2
	ld	[%l7 + 0x24],	%f4
	nop
	fmovrdne	%o2,	%f10,	%f4
	fmovspos	%icc,	%f3,	%f12
	ldub	[%l7 + 0x5C],	%o2
	fbug	%fcc3,	loop_412
	bpos	loop_413
	sllx	%o2,	%o2,	%g2
	movcc	%xcc,	%i4,	%g2
loop_412:
	ldx	[%l7 + 0x20],	%g2
loop_413:
	lduw	[%l7 + 0x68],	%g2
	fxors	%f12,	%f5,	%f4
	fmovrdlz	%g2,	%f12,	%f6
	stx	%g2,	[%l7 + 0x40]
	nop
	xor	%g2,	%i5,	%g2
	and	%g2,	%g2,	%i0
	brnz	%i0,	loop_414
	sub	%i0,	0x0357,	%i0
	fbo,a	%fcc3,	loop_415
	orcc	%i0,	%l1,	%i0
loop_414:
	nop
	setx loop_416, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	movgu	%icc,	%i0,	%g6
loop_415:
	fmovdn	%icc,	%f15,	%f10
	fcmple16	%f6,	%f0,	%g6
loop_416:
	tsubcc	%g6,	0x1440,	%g6
	fbe	%fcc2,	loop_417
	subcc	%g6,	0x0CCA,	%g6
	tge	%xcc,	0x1
	subccc	%g6,	0x04E8,	%g6
loop_417:
	movrlez	%g6,	%g6,	%l5
	sdivcc	%l5,	0x0304,	%l5
	nop
	subcc	%l5,	%l5,	%o1
	sdiv	%o1,	0x0883,	%o1
	fpack32	%f6,	%f6,	%f10
	ld	[%l7 + 0x24],	%f2
	ldx	[%l7 + 0x68],	%o1
	tgu	%icc,	0x4
	sth	%o1,	[%l7 + 0x08]
	fble	%fcc1,	loop_418
	brgez	%o1,	loop_419
	bge,a	loop_420
	nop
loop_418:
	fmovdl	%xcc,	%f2,	%f8
loop_419:
	addc	%o1,	0x078D,	%o1
loop_420:
	movne	%icc,	%o1,	%o0
	ta	%icc,	0x6
	brlez	%o0,	loop_421
	be,a	%icc,	loop_422
	nop
	sllx	%o0,	%g3,	%o0
loop_421:
	nop
loop_422:
	movrne	%o0,	%i1,	%o0
	tne	%icc,	0x4
	nop
	fbug,a	%fcc2,	loop_423
	movcs	%xcc,	%o0,	%o5
	subcc	%o5,	0x03CB,	%o5
	nop
loop_423:
	brgez	%o5,	loop_424
	fmul8sux16	%f10,	%f10,	%f2
	umulcc	%o5,	0x11A1,	%o5
	movn	%icc,	%g5,	%o5
loop_424:
	nop
	ldx	[%l7 + 0x48],	%o5
	lduh	[%l7 + 0x28],	%o5
	tvc	%xcc,	0x7
	movle	%icc,	%i6,	%o5
	ldsh	[%l7 + 0x42],	%o5
	lduw	[%l7 + 0x5C],	%o5
	umulcc	%o5,	0x05D5,	%o5
	fmovdge	%xcc,	%f1,	%f2
	fble	%fcc2,	loop_425
	tcc	%xcc,	0x5
	bvc,a,pn	%icc,	loop_426
	fzero	%f2
loop_425:
	ldub	[%l7 + 0x64],	%o5
	ldx	[%l7 + 0x68],	%o5
loop_426:
	fbug	%fcc1,	loop_427
	orn	%o5,	0x1045,	%o5
	fmovdl	%xcc,	%f8,	%f11
	fpack16	%f2,	%f10
loop_427:
	fmovsleu	%xcc,	%f12,	%f5
	movpos	%icc,	%o5,	%i2
	sllx	%i2,	0x09,	%i2
	subccc	%i2,	%o7,	%i2
	add	%i2,	%i2,	%g7
	tpos	%icc,	0x2
	te	%icc,	0x1
	fcmped	%fcc3,	%f10,	%f14
	movcc	%icc,	%g7,	%g4
	lduh	[%l7 + 0x5C],	%g4
	nop
	fmovsg	%icc,	%f11,	%f1
	sethi	0x1076,	%g4
	smul	%g4,	0x138A,	%g4
	nop
	movrlz	%g4,	0x101,	%g4
	bneg,a,pn	%xcc,	loop_428
	fmovrslez	%g4,	%f14,	%f5
	ldx	[%l7 + 0x58],	%g4
	bl,a,pt	%icc,	loop_429
loop_428:
	bn,a,pn	%icc,	loop_430
	movneg	%xcc,	%l6,	%g4
	tsubcctv	%g4,	0x125C,	%g4
loop_429:
	lduw	[%l7 + 0x78],	%g4
loop_430:
	std	%f14,	[%l7 + 0x28]
	subcc	%g4,	%g4,	%o3
	umul	%o3,	0x1A05,	%o3
	fmovdcs	%xcc,	%f14,	%f11
	bcs	loop_431
	ld	[%l7 + 0x68],	%f8
	fxors	%f11,	%f7,	%f15
	st	%f15,	[%l7 + 0x78]
loop_431:
	movleu	%icc,	%l0,	%o3
	fcmpgt32	%f14,	%f2,	%o3
	movrlez	%o3,	%l3,	%o3
	movre	%o3,	%l2,	%o3
	udivx	%o3,	0x0274,	%o3
	brnz	%o3,	loop_432
	movle	%xcc,	%o3,	%i7
	array16	%i7,	%i7,	%g1
	nop
loop_432:
	array16	%g1,	%g1,	%l4
	popc	%l4,	%l4
	and	%l4,	0x13D9,	%l4
	ldd	[%l7 + 0x28],	%f14
	bcs,pt	%xcc,	loop_433
	st	%f15,	[%l7 + 0x20]
	movne	%xcc,	%l4,	%i3
	sra	%i3,	%o4,	%i3
loop_433:
	lduw	[%l7 + 0x08],	%i3
	ldd	[%l7 + 0x60],	%f2
	xor	%i3,	0x0C3F,	%i3
	orn	%i3,	0x11B5,	%i3
	brgez	%i3,	loop_434
	fmovdcs	%icc,	%f15,	%f11
	movleu	%xcc,	%o6,	%i3
	tge	%xcc,	0x6
loop_434:
	fbn	%fcc1,	loop_435
	sdivx	%i3,	0x09E9,	%i3
	taddcc	%i3,	%i3,	%o2
	nop
loop_435:
	srlx	%o2,	0x15,	%o2
	fbu,a	%fcc1,	loop_436
	fcmple16	%f14,	%f2,	%o2
	andn	%o2,	%o2,	%i4
	fnors	%f11,	%f8,	%f0
loop_436:
	ldsh	[%l7 + 0x64],	%i4
	fors	%f0,	%f12,	%f7
	tg	%xcc,	0x7
	srax	%i4,	%i5,	%i4
	movg	%icc,	%g2,	%i4
	nop
	fmovrdgz	%i4,	%f8,	%f8
	ldx	[%l7 + 0x70],	%i4
	sdivcc	%i4,	0x05E4,	%i4
	nop
	fnands	%f7,	%f10,	%f2
	fexpand	%f2,	%f14
	tcs	%icc,	0x0
	bneg	%xcc,	loop_437
	movcs	%icc,	%l1,	%i4
	movle	%xcc,	%i4,	%i0
	movvs	%xcc,	%i0,	%g6
loop_437:
	fzero	%f8
	movrlez	%g6,	%l5,	%g6
	nop
	setx loop_438, %l0, %l1
	jmpl %l1, %g6
	fornot2	%f8,	%f10,	%f10
	sub	%g6,	0x05CD,	%g6
	fnegs	%f2,	%f5
loop_438:
	xnorcc	%g6,	0x0936,	%g6
	udivcc	%g6,	0x08CA,	%g6
	tvs	%icc,	0x0
	fmul8x16	%f2,	%f14,	%f10
	xnorcc	%g6,	0x0158,	%g6
	fpackfix	%f10,	%f11
	lduw	[%l7 + 0x70],	%g6
	andcc	%g6,	0x1DA6,	%g6
	nop
	nop
	fmovrslez	%g6,	%f13,	%f3
	srlx	%g6,	%g6,	%o1
	tle	%icc,	0x1
	movrlz	%o1,	%g3,	%o1
	movrne	%o1,	%i1,	%o1
	tcc	%xcc,	0x2
	fpadd32	%f10,	%f12,	%f10
	ldsw	[%l7 + 0x78],	%o1
	movne	%icc,	%o0,	%o1
	udivx	%o1,	0x0FA3,	%o1
	tvs	%icc,	0x4
	nop
	xnorcc	%o1,	%o1,	%g5
	fmovdleu	%icc,	%f1,	%f6
	movpos	%icc,	%g5,	%i6
	tcs	%icc,	0x6
	movrgz	%i6,	%i6,	%o5
	addc	%o5,	0x0F0A,	%o5
	fcmpgt16	%f10,	%f4,	%o5
	movcs	%icc,	%o7,	%o5
	nop
	brz,a	%o5,	loop_439
	std	%f10,	[%l7 + 0x10]
	tn	%icc,	0x4
	tleu	%xcc,	0x0
loop_439:
	fand	%f10,	%f14,	%f10
	tneg	%icc,	0x2
	xor	%o5,	%o5,	%i2
	fmovrsgez	%i2,	%f2,	%f1
	bgu,a	loop_440
	ble,a,pn	%icc,	loop_441
	ldsb	[%l7 + 0x5A],	%i2
	nop
loop_440:
	fsrc2	%f10,	%f8
loop_441:
	alignaddrl	%i2,	%g7,	%i2
	te	%icc,	0x5
	fpack32	%f10,	%f6,	%f14
	ldd	[%l7 + 0x78],	%f12
	nop
	tvc	%xcc,	0x3
	fmovdg	%icc,	%f12,	%f3
	fbne	%fcc2,	loop_442
	fmovrsgez	%i2,	%f11,	%f8
	movgu	%icc,	%l6,	%i2
	umulcc	%i2,	%i2,	%g4
loop_442:
	xnorcc	%g4,	0x0C13,	%g4
	udivcc	%g4,	0x08FD,	%g4
	st	%f8,	[%l7 + 0x70]
	fbug	%fcc0,	loop_443
	fandnot1	%f14,	%f10,	%f0
	brlz	%g4,	loop_444
	bn,a,pn	%icc,	loop_445
loop_443:
	movle	%icc,	%g4,	%l0
	bgu,a	loop_446
loop_444:
	xor	%l0,	0x1383,	%l0
loop_445:
	fand	%f0,	%f8,	%f0
	bge,pn	%xcc,	loop_447
loop_446:
	movvs	%icc,	%l0,	%l3
	srlx	%l3,	0x08,	%l3
	tneg	%icc,	0x6
loop_447:
	xorcc	%l3,	%l2,	%l3
	addcc	%l3,	%l3,	%o3
	st	%f8,	[%l7 + 0x4C]
	nop
	movleu	%xcc,	%i7,	%o3
	fmovsvs	%icc,	%f4,	%f13
	fornot2s	%f13,	%f7,	%f8
	ld	[%l7 + 0x78],	%f3
	fbne	%fcc1,	loop_448
	sth	%o3,	[%l7 + 0x70]
	sdivx	%o3,	0x1446,	%o3
	ldd	[%l7 + 0x78],	%f4
loop_448:
	fpack32	%f0,	%f2,	%f14
	fpadd32	%f14,	%f8,	%f14
	nop
	stb	%o3,	[%l7 + 0x1B]
	sth	%o3,	[%l7 + 0x64]
	bneg,a,pn	%xcc,	loop_449
	sth	%o3,	[%l7 + 0x34]
	sll	%o3,	%g1,	%o3
	fcmpne16	%f14,	%f2,	%o3
loop_449:
	nop
	and	%o3,	0x1218,	%o3
	fmovrslz	%o3,	%f5,	%f7
	tcc	%xcc,	0x3
	fmovdl	%xcc,	%f1,	%f6
	fornot1s	%f6,	%f1,	%f3
	bl,a	loop_450
	umulcc	%o3,	%l4,	%o3
	tcs	%xcc,	0x4
	movg	%icc,	%o4,	%o3
loop_450:
	brnz,a	%o3,	loop_451
	and	%o3,	%o3,	%o6
	nop
	taddcc	%o6,	%i3,	%o6
loop_451:
	fandnot1	%f14,	%f6,	%f0
	bge	loop_452
	bleu	%xcc,	loop_453
	sdivx	%o6,	0x1DC9,	%o6
	stx	%o6,	[%l7 + 0x58]
loop_452:
	fpadd32s	%f3,	%f15,	%f11
loop_453:
	movcs	%icc,	%o2,	%o6
	tvs	%xcc,	0x2
	movn	%icc,	%i5,	%o6
	bgu	loop_454
	mulscc	%o6,	%o6,	%g2
	movg	%xcc,	%g2,	%l1
	movne	%xcc,	%l1,	%i4
loop_454:
	array8	%i4,	%i4,	%i0
	fba,a	%fcc1,	loop_455
	fmovsgu	%icc,	%f13,	%f0
	brlez	%i0,	loop_456
	andn	%i0,	%l5,	%i0
loop_455:
	subc	%i0,	%i0,	%g6
	sdiv	%g6,	0x1667,	%g6
loop_456:
	andcc	%g6,	0x028D,	%g6
	array32	%g6,	%g3,	%g6
	fblg	%fcc0,	loop_457
	xnorcc	%g6,	%i1,	%g6
	be,pt	%icc,	loop_458
	fnand	%f0,	%f6,	%f2
loop_457:
	movge	%icc,	%g6,	%o0
	taddcc	%o0,	0x1103,	%o0
loop_458:
	fmovscc	%icc,	%f9,	%f2
	orncc	%o0,	0x0FC5,	%o0
	fbug,a	%fcc1,	loop_459
	orn	%o0,	%o0,	%o1
	fcmpgt16	%f2,	%f6,	%o1
	tne	%xcc,	0x2
loop_459:
	add	%o1,	%g5,	%o1
	movrlz	%o1,	%o1,	%i6
	ldx	[%l7 + 0x08],	%i6
	smulcc	%i6,	0x0DDD,	%i6
	popc	0x11ED,	%i6
	sethi	0x0BF1,	%i6
	fornot2	%f2,	%f8,	%f12
	fmul8x16au	%f2,	%f2,	%f8
	fmul8sux16	%f8,	%f6,	%f8
	sllx	%i6,	0x0B,	%i6
	ldsb	[%l7 + 0x67],	%i6
	tleu	%icc,	0x0
	sll	%i6,	%i6,	%o7
	add	%o7,	%o5,	%o7
	fnand	%f8,	%f6,	%f12
	lduw	[%l7 + 0x58],	%o7
	fcmpne32	%f12,	%f0,	%o7
	umulcc	%o7,	%g7,	%o7
	movleu	%xcc,	%l6,	%o7
	fmovd	%f12,	%f14
	sth	%o7,	[%l7 + 0x16]
	taddcctv	%o7,	0x1283,	%o7
	movre	%o7,	0x12F,	%o7
	tcc	%icc,	0x6
	lduh	[%l7 + 0x56],	%o7
	fble	%fcc0,	loop_460
	mulx	%o7,	0x1ECC,	%o7
	stb	%o7,	[%l7 + 0x41]
	move	%icc,	%i2,	%o7
loop_460:
	nop
	udivx	%o7,	0x1658,	%o7
	movrgez	%o7,	0x349,	%o7
	fsrc2s	%f2,	%f6
	tneg	%icc,	0x0
	bvs,pt	%icc,	loop_461
	nop
	fbn	%fcc3,	loop_462
	fones	%f2
loop_461:
	fpsub32s	%f2,	%f7,	%f10
	tvc	%icc,	0x2
loop_462:
	movge	%xcc,	%g4,	%o7
	stw	%o7,	[%l7 + 0x70]
	fmovrslz	%o7,	%f11,	%f13
	nop
	movcc	%xcc,	%o7,	%l0
	movn	%icc,	%l2,	%l0
	stx	%l0,	[%l7 + 0x28]
	fone	%f12
	ldub	[%l7 + 0x30],	%l0
	tvc	%xcc,	0x6
	fbuge	%fcc2,	loop_463
	ldx	[%l7 + 0x58],	%l0
	movrlez	%l0,	0x1BB,	%l0
	tn	%icc,	0x3
loop_463:
	tvc	%icc,	0x7
	fbg,a	%fcc0,	loop_464
	tcs	%xcc,	0x1
	tne	%xcc,	0x2
	sth	%l0,	[%l7 + 0x52]
loop_464:
	orncc	%l0,	0x03A0,	%l0
	ld	[%l7 + 0x24],	%f9
	andn	%l0,	%l3,	%l0
	addcc	%l0,	0x1B33,	%l0
	movne	%xcc,	%i7,	%l0
	fbg,a	%fcc0,	loop_465
	lduh	[%l7 + 0x78],	%l0
	sll	%l0,	0x0D,	%l0
	tcc	%xcc,	0x6
loop_465:
	nop
	fmovdpos	%xcc,	%f3,	%f1
	array8	%l0,	%g1,	%l0
	tl	%xcc,	0x5
	brnz	%l0,	loop_466
	subc	%l0,	0x110F,	%l0
	nop
	nop
loop_466:
	addc	%l0,	%l4,	%l0
	movleu	%xcc,	%l0,	%o4
	fmovse	%icc,	%f8,	%f7
	brz,a	%o4,	loop_467
	fmovsvs	%icc,	%f6,	%f2
	pdist	%f12,	%f2,	%f0
	movrgz	%o4,	%o4,	%o3
loop_467:
	be,a	%icc,	loop_468
	st	%f2,	[%l7 + 0x3C]
	movge	%icc,	%i3,	%o3
	popc	%o3,	%o3
loop_468:
	taddcctv	%o3,	0x0495,	%o3
	fmovdne	%icc,	%f13,	%f6
	ldd	[%l7 + 0x38],	%f10
	movg	%icc,	%o2,	%o3
	movcs	%icc,	%o3,	%i5
	fpsub16	%f0,	%f0,	%f0
	subcc	%i5,	0x16A3,	%i5
	fba	%fcc1,	loop_469
	nop
	setx loop_470, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	movne	%icc,	%i5,	%o6
	tsubcc	%o6,	%o6,	%g2
loop_469:
	srlx	%g2,	0x1E,	%g2
loop_470:
	taddcctv	%g2,	0x1D1B,	%g2
	fmul8ulx16	%f0,	%f10,	%f12
	movvs	%icc,	%g2,	%l1
	fbue,a	%fcc3,	loop_471
	movle	%icc,	%l1,	%i4
	srl	%i4,	0x10,	%i4
	movrgz	%i4,	0x1B4,	%i4
loop_471:
	or	%i4,	%l5,	%i4
	udiv	%i4,	0x0755,	%i4
	fmovrse	%i4,	%f11,	%f0
	andn	%i4,	0x171D,	%i4
	fblg	%fcc1,	loop_472
	add	%i4,	0x1E0A,	%i4
	fcmpeq16	%f12,	%f0,	%i4
	andcc	%i4,	%i4,	%i0
loop_472:
	tle	%xcc,	0x1
	fbl,a	%fcc2,	loop_473
	fsrc2	%f12,	%f14
	smulcc	%i0,	0x10EE,	%i0
	fcmpne16	%f12,	%f4,	%i0
loop_473:
	fcmpeq16	%f12,	%f10,	%i0
	sdiv	%i0,	0x09A1,	%i0
	fcmpes	%fcc1,	%f10,	%f4
	bcs,a,pt	%xcc,	loop_474
	udivx	%i0,	0x0867,	%i0
	movg	%xcc,	%i0,	%g3
	movvc	%icc,	%g3,	%i1
loop_474:
	ldsw	[%l7 + 0x70],	%i1
	fmovde	%icc,	%f3,	%f1
	ldub	[%l7 + 0x0B],	%i1
	fornot2s	%f1,	%f8,	%f0
	taddcctv	%i1,	0x1BBF,	%i1
	mova	%icc,	%i1,	%g6
	fmovsl	%xcc,	%f0,	%f9
	fmovs	%f9,	%f8
	fmuld8sux16	%f9,	%f11,	%f0
	fbge	%fcc2,	loop_475
	stb	%g6,	[%l7 + 0x51]
	and	%g6,	0x0B2E,	%g6
	fnot2	%f0,	%f10
loop_475:
	tg	%xcc,	0x7
	fpsub32	%f0,	%f14,	%f8
	bcc,a,pn	%xcc,	loop_476
	fmovrdlez	%g6,	%f2,	%f0
	xorcc	%g6,	%g6,	%o0
	tne	%xcc,	0x4
loop_476:
	movne	%xcc,	%o0,	%g5
	mova	%icc,	%g5,	%o1
	std	%f0,	[%l7 + 0x78]
	movneg	%icc,	%i6,	%o1
	ld	[%l7 + 0x7C],	%f6
	fmovspos	%xcc,	%f7,	%f11
	bvc,a	loop_477
	subcc	%o1,	%o5,	%o1
	fmovdle	%icc,	%f8,	%f3
	fxnor	%f0,	%f0,	%f0
loop_477:
	tvc	%icc,	0x6
	movcs	%xcc,	%g7,	%o1
	addccc	%o1,	%o1,	%l6
	fornot1s	%f3,	%f8,	%f3
	lduh	[%l7 + 0x78],	%l6
	fcmpgt16	%f0,	%f10,	%l6
	xnor	%l6,	0x0A4D,	%l6
	fandnot1s	%f3,	%f8,	%f7
	umulcc	%l6,	0x1308,	%l6
	fmovdneg	%icc,	%f1,	%f10
	tne	%xcc,	0x0
	tn	%icc,	0x2
	movvs	%icc,	%l6,	%i2
	nop
	nop
	fmovse	%xcc,	%f14,	%f3
	tne	%icc,	0x5
	ldsh	[%l7 + 0x6A],	%i2
	bneg,pt	%xcc,	loop_478
	tsubcctv	%i2,	%i2,	%g4
	lduh	[%l7 + 0x76],	%g4
	movl	%icc,	%g4,	%o7
loop_478:
	fnors	%f3,	%f3,	%f9
	ldsb	[%l7 + 0x0D],	%o7
	fzeros	%f9
	fmovsgu	%icc,	%f4,	%f15
	udivcc	%o7,	0x1427,	%o7
	and	%o7,	0x082B,	%o7
	fmovrdgez	%o7,	%f0,	%f4
	ldsh	[%l7 + 0x36],	%o7
	lduh	[%l7 + 0x0A],	%o7
	nop
	bcc,a,pn	%icc,	loop_479
	movle	%xcc,	%l2,	%o7
	sub	%o7,	0x1138,	%o7
	tsubcctv	%o7,	%o7,	%l3
loop_479:
	movg	%icc,	%i7,	%l3
	fpsub32	%f4,	%f0,	%f10
	fsrc2	%f10,	%f4
	tle	%icc,	0x1
	sethi	0x1020,	%l3
	nop
	call	loop_480
	fpsub16	%f10,	%f4,	%f8
	fbn	%fcc0,	loop_481
	umulcc	%l3,	0x00AB,	%l3
loop_480:
	movcs	%icc,	%g1,	%l3
	taddcc	%l3,	0x04A2,	%l3
loop_481:
	or	%l3,	%l4,	%l3
	xorcc	%l3,	0x10DB,	%l3
	srax	%l3,	%l0,	%l3
	sdivx	%l3,	0x0D8C,	%l3
	srlx	%l3,	0x17,	%l3
	udivcc	%l3,	0x0C2A,	%l3
	ldsh	[%l7 + 0x58],	%l3
	orncc	%l3,	0x1715,	%l3
	addcc	%l3,	0x1828,	%l3
	movrlz	%l3,	%o4,	%l3
	movl	%icc,	%i3,	%l3
	fmul8x16	%f15,	%f12,	%f14
	ldd	[%l7 + 0x60],	%f12
	udivx	%l3,	0x0B55,	%l3
	fmul8ulx16	%f14,	%f2,	%f8
	movre	%l3,	%l3,	%o2
	fmovrdne	%o2,	%f0,	%f4
	fmovda	%icc,	%f8,	%f13
	movne	%icc,	%o3,	%o2
	fmovdg	%icc,	%f1,	%f14
	stx	%o2,	[%l7 + 0x68]
	movvs	%xcc,	%o2,	%i5
	fxors	%f14,	%f1,	%f9
	udivcc	%i5,	0x0477,	%i5
	tl	%xcc,	0x0
	stw	%i5,	[%l7 + 0x70]
	xorcc	%i5,	0x0AC9,	%i5
	bcc	%icc,	loop_482
	std	%f4,	[%l7 + 0x10]
	te	%icc,	0x2
	fpsub32s	%f9,	%f2,	%f10
loop_482:
	popc	%i5,	%i5
	mova	%icc,	%i5,	%o6
	fornot1	%f4,	%f4,	%f6
	tl	%xcc,	0x0
	udiv	%o6,	0x044A,	%o6
	tl	%icc,	0x1
	tneg	%icc,	0x5
	fornot2	%f6,	%f8,	%f0
	ldx	[%l7 + 0x38],	%o6
	nop
	ldub	[%l7 + 0x29],	%o6
	std	%f0,	[%l7 + 0x50]
	nop
	orn	%o6,	0x1B7B,	%o6
	fmovd	%f0,	%f2
	movn	%icc,	%g2,	%o6
	bneg,pn	%icc,	loop_483
	alignaddrl	%o6,	%l1,	%o6
	sethi	0x15D1,	%o6
	sdiv	%o6,	0x1757,	%o6
loop_483:
	tsubcctv	%o6,	%l5,	%o6
	array32	%o6,	%i4,	%o6
	array8	%o6,	%o6,	%i0
	movneg	%xcc,	%g3,	%i0
	nop
	nop
	stw	%i0,	[%l7 + 0x50]
	bl,a	loop_484
	sth	%i0,	[%l7 + 0x36]
	orncc	%i0,	%i0,	%i1
	fbge,a	%fcc2,	loop_485
loop_484:
	tpos	%icc,	0x5
	umul	%i1,	%i1,	%g6
	fbn	%fcc0,	loop_486
loop_485:
	stw	%g6,	[%l7 + 0x48]
	movrlez	%g6,	0x229,	%g6
	st	%f10,	[%l7 + 0x34]
loop_486:
	fornot1s	%f10,	%f14,	%f3
	stw	%g6,	[%l7 + 0x28]
	fornot2	%f0,	%f6,	%f4
	tneg	%xcc,	0x4
	fmovrdgez	%g6,	%f4,	%f0
	movle	%icc,	%o0,	%g6
	andncc	%g6,	%g6,	%g5
	srlx	%g5,	0x1B,	%g5
	movne	%icc,	%g5,	%i6
	brgz,a	%i6,	loop_487
	fnand	%f0,	%f0,	%f14
	tneg	%icc,	0x7
	sth	%i6,	[%l7 + 0x62]
loop_487:
	bshuffle	%f14,	%f2,	%f10
	mulscc	%i6,	%i6,	%o5
	tle	%xcc,	0x2
	add	%o5,	%o5,	%g7
	sdivx	%g7,	0x0849,	%g7
	taddcctv	%g7,	0x154C,	%g7
	brlz	%g7,	loop_488
	subccc	%g7,	%o1,	%g7
	bneg	loop_489
	mova	%xcc,	%g7,	%l6
loop_488:
	fcmpgt32	%f10,	%f8,	%l6
	andcc	%l6,	0x1B5E,	%l6
loop_489:
	orcc	%l6,	0x175F,	%l6
	fandnot2s	%f3,	%f3,	%f2
	fmovsneg	%xcc,	%f8,	%f12
	array16	%l6,	%l6,	%i2
	nop
	stw	%i2,	[%l7 + 0x0C]
	taddcc	%i2,	%i2,	%g4
	fbul,a	%fcc1,	loop_490
	tvs	%icc,	0x0
	std	%f10,	[%l7 + 0x58]
	fandnot2	%f10,	%f12,	%f0
loop_490:
	be	%xcc,	loop_491
	bvc,pn	%xcc,	loop_492
	fbu,a	%fcc0,	loop_493
	sethi	0x1D3E,	%g4
loop_491:
	fmovrslez	%g4,	%f8,	%f15
loop_492:
	udiv	%g4,	0x015A,	%g4
loop_493:
	fbne,a	%fcc3,	loop_494
	be	loop_495
	ldsb	[%l7 + 0x13],	%g4
	umul	%g4,	%l2,	%g4
loop_494:
	bneg,a	loop_496
loop_495:
	ldsw	[%l7 + 0x34],	%g4
	fmovrdgez	%g4,	%f4,	%f2
	sllx	%g4,	0x0A,	%g4
loop_496:
	brlz,a	%g4,	loop_497
	bvs	loop_498
	fmovse	%xcc,	%f8,	%f6
	nop
	setx loop_499, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_497:
	fmovrdgez	%g4,	%f14,	%f2
loop_498:
	be,a	%icc,	loop_500
	addcc	%g4,	0x103A,	%g4
loop_499:
	ldub	[%l7 + 0x4A],	%g4
	bge	%icc,	loop_501
loop_500:
	brlez,a	%g4,	loop_502
	movpos	%icc,	%g4,	%o7
	movne	%xcc,	%i7,	%o7
loop_501:
	smul	%o7,	0x0BDC,	%o7
loop_502:
	lduh	[%l7 + 0x64],	%o7
	movre	%o7,	0x037,	%o7
	sub	%o7,	0x1AD8,	%o7
	fmovrsne	%o7,	%f4,	%f10
	movneg	%icc,	%o7,	%g1
	sethi	0x0659,	%g1
	movn	%icc,	%g1,	%l4
	fmovrslez	%l4,	%f5,	%f0
	fmovsleu	%icc,	%f9,	%f1
	movpos	%icc,	%l4,	%l0
	lduw	[%l7 + 0x34],	%l0
	movleu	%icc,	%o4,	%l0
	alignaddrl	%l0,	%i3,	%l0
	ldub	[%l7 + 0x7A],	%l0
	tg	%xcc,	0x4
	tvc	%icc,	0x1
	ldsw	[%l7 + 0x3C],	%l0
	tsubcctv	%l0,	0x114B,	%l0
	movrne	%l0,	0x3B4,	%l0
	nop
	fsrc2	%f2,	%f12
	stb	%l0,	[%l7 + 0x4E]
	nop
	ldub	[%l7 + 0x26],	%l0
	nop
	xnorcc	%l0,	0x1EA9,	%l0
	tg	%xcc,	0x6
	stx	%l0,	[%l7 + 0x50]
	addccc	%l0,	0x0146,	%l0
	fmovrsgez	%l0,	%f3,	%f7
	movcs	%icc,	%l0,	%l3
	addcc	%l3,	0x0C15,	%l3
	nop
	lduw	[%l7 + 0x58],	%l3
	nop
	stx	%l3,	[%l7 + 0x18]
	ta	%xcc,	0x6
	tvs	%xcc,	0x5
	fbul,a	%fcc1,	loop_503
	fmovrdgez	%l3,	%f14,	%f14
	taddcctv	%l3,	0x06F4,	%l3
	andncc	%l3,	%o3,	%l3
loop_503:
	movg	%xcc,	%l3,	%o2
	fandnot1s	%f7,	%f0,	%f5
	xnor	%o2,	%o2,	%i5
	fpmerge	%f5,	%f13,	%f2
	nop
	taddcc	%i5,	%i5,	%g2
	tvc	%xcc,	0x6
	fmovdne	%icc,	%f8,	%f8
	be,pt	%xcc,	loop_504
	smul	%g2,	%g2,	%l1
	stx	%l1,	[%l7 + 0x68]
	movpos	%xcc,	%l5,	%l1
loop_504:
	lduh	[%l7 + 0x3A],	%l1
	fbge,a	%fcc2,	loop_505
	umulcc	%l1,	%i4,	%l1
	tn	%icc,	0x7
	fmul8x16	%f8,	%f0,	%f8
loop_505:
	pdist	%f8,	%f6,	%f4
	tl	%icc,	0x0
	fmovse	%xcc,	%f8,	%f3
	movgu	%icc,	%o6,	%l1
	fmovrdlz	%l1,	%f14,	%f4
	and	%l1,	%g3,	%l1
	tle	%icc,	0x2
	movvs	%xcc,	%l1,	%i0
	movrne	%i0,	0x329,	%i0
	tvc	%icc,	0x2
	tsubcc	%i0,	0x0FCD,	%i0
	fandnot2	%f4,	%f0,	%f0
	ldx	[%l7 + 0x78],	%i0
	movge	%icc,	%i0,	%i1
	nop
	ta	%xcc,	0x5
	fmovdpos	%icc,	%f13,	%f3
	fmovsleu	%icc,	%f13,	%f6
	fmovrde	%i1,	%f14,	%f10
	std	%f10,	[%l7 + 0x38]
	smul	%i1,	%i1,	%o0
	movle	%icc,	%g6,	%o0
	faligndata	%f10,	%f6,	%f0
	tge	%icc,	0x4
	subcc	%o0,	0x0005,	%o0
	ldsh	[%l7 + 0x56],	%o0
	bshuffle	%f0,	%f12,	%f2
	fxor	%f2,	%f2,	%f14
	srlx	%o0,	0x03,	%o0
	tge	%xcc,	0x3
	udiv	%o0,	0x021C,	%o0
	andcc	%o0,	0x1BC7,	%o0
	movcs	%icc,	%g5,	%o0
	fones	%f6
	fcmpes	%fcc3,	%f13,	%f12
	tvs	%xcc,	0x3
	alignaddr	%o0,	%o0,	%i6
	movg	%icc,	%i6,	%o5
	tle	%xcc,	0x5
	nop
	stw	%o5,	[%l7 + 0x34]
	stw	%o5,	[%l7 + 0x4C]
	fbue,a	%fcc0,	loop_506
	add	%o5,	0x0B9E,	%o5
	srlx	%o5,	0x0B,	%o5
	fmovdne	%xcc,	%f7,	%f12
loop_506:
	fmovsleu	%xcc,	%f13,	%f11
	tvc	%xcc,	0x6
	sllx	%o5,	0x0F,	%o5
	fmovsa	%xcc,	%f12,	%f14
	fmovrdgez	%o5,	%f0,	%f6
	umul	%o5,	%o5,	%o1
	array8	%o1,	%o1,	%g7
	fornot2	%f6,	%f2,	%f2
	brnz,a	%g7,	loop_507
	movvc	%xcc,	%g7,	%l6
	sll	%l6,	%i2,	%l6
	addccc	%l6,	%l6,	%l2
loop_507:
	tsubcc	%l2,	0x0862,	%l2
	sth	%l2,	[%l7 + 0x64]
	nop
	udivcc	%l2,	0x09FE,	%l2
	array16	%l2,	%l2,	%g4
	fbn,a	%fcc1,	loop_508
	bn	loop_509
	subccc	%g4,	%i7,	%g4
	move	%xcc,	%g4,	%o7
loop_508:
	array8	%o7,	%o7,	%g1
loop_509:
	fmovdcs	%icc,	%f6,	%f3
	movrlz	%g1,	%l4,	%g1
	nop
	setx loop_510, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	fbn,a	%fcc2,	loop_511
	faligndata	%f2,	%f4,	%f0
	movgu	%icc,	%o4,	%g1
loop_510:
	movrlz	%g1,	0x0D0,	%g1
loop_511:
	ldsh	[%l7 + 0x2E],	%g1
	fmovsgu	%xcc,	%f1,	%f3
	be,a,pn	%icc,	loop_512
	xor	%g1,	%i3,	%g1
	movneg	%icc,	%l0,	%g1
	mulscc	%g1,	0x1A50,	%g1
loop_512:
	ble	loop_513
	movl	%xcc,	%g1,	%o3
	fmovscc	%xcc,	%f13,	%f7
	fnands	%f7,	%f3,	%f1
loop_513:
	add	%o3,	0x1C5E,	%o3
	be,pn	%xcc,	loop_514
	addccc	%o3,	%o3,	%l3
	tl	%xcc,	0x5
	srlx	%l3,	%l3,	%o2
loop_514:
	nop
	stb	%o2,	[%l7 + 0x47]
	nop
	umul	%o2,	%o2,	%i5
	fmovda	%xcc,	%f6,	%f9
	fmovdpos	%xcc,	%f11,	%f4
	tgu	%xcc,	0x4
	xnor	%i5,	0x0452,	%i5
	movrne	%i5,	0x19B,	%i5
	movrgez	%i5,	0x291,	%i5
	fmovdcc	%xcc,	%f8,	%f10
	ldx	[%l7 + 0x10],	%i5
	movrgz	%i5,	%i5,	%g2
	movcc	%icc,	%g2,	%l5
	movne	%xcc,	%i4,	%l5
	movrgez	%l5,	%o6,	%l5
	movneg	%icc,	%g3,	%l5
	movge	%xcc,	%l5,	%l1
	sth	%l1,	[%l7 + 0x50]
	bl,a,pt	%xcc,	loop_515
	taddcctv	%l1,	%i0,	%l1
	addcc	%l1,	%i1,	%l1
	add	%l1,	%l1,	%g6
loop_515:
	stw	%g6,	[%l7 + 0x7C]
	udiv	%g6,	0x18CD,	%g6
	bcs,a,pn	%icc,	loop_516
	sdiv	%g6,	0x1A7C,	%g6
	ldsb	[%l7 + 0x30],	%g6
	ldub	[%l7 + 0x1B],	%g6
loop_516:
	tgu	%xcc,	0x6
	nop
	movle	%xcc,	%g5,	%g6
	ldsw	[%l7 + 0x14],	%g6
	movvc	%xcc,	%o0,	%g6
	lduw	[%l7 + 0x58],	%g6
	fbo	%fcc1,	loop_517
	tvc	%icc,	0x2
	tleu	%icc,	0x5
	fmovs	%f10,	%f7
loop_517:
	fornot2s	%f10,	%f15,	%f7
	std	%f0,	[%l7 + 0x68]
	nop
	setx loop_518, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	ldx	[%l7 + 0x68],	%g6
	tsubcctv	%g6,	0x133A,	%g6
	and	%g6,	0x0E96,	%g6
loop_518:
	subccc	%g6,	0x0CBB,	%g6
	mulx	%g6,	%i6,	%g6
	tn	%icc,	0x1
	fbo	%fcc3,	loop_519
	lduw	[%l7 + 0x50],	%g6
	tcc	%xcc,	0x7
	fones	%f7
loop_519:
	udivx	%g6,	0x0EEC,	%g6
	udivx	%g6,	0x1393,	%g6
	movl	%icc,	%o5,	%g6
	sll	%g6,	0x11,	%g6
	sll	%g6,	%o1,	%g6
	fmovdg	%icc,	%f5,	%f4
	sdiv	%g6,	0x11A9,	%g6
	sethi	0x1C74,	%g6
	tge	%xcc,	0x2
	fmovsleu	%xcc,	%f15,	%f14
	tneg	%xcc,	0x6
	stw	%g6,	[%l7 + 0x18]
	movg	%icc,	%g7,	%g6
	fors	%f14,	%f5,	%f12
	mulx	%g6,	0x0801,	%g6
	fnand	%f0,	%f14,	%f6
	ldx	[%l7 + 0x18],	%g6
	sethi	0x0C5D,	%g6
	srax	%g6,	0x19,	%g6
	fornot2s	%f12,	%f12,	%f2
	fmovsn	%icc,	%f1,	%f11
	fcmped	%fcc1,	%f14,	%f0
	fxor	%f0,	%f2,	%f0
	sllx	%g6,	0x1E,	%g6
	fexpand	%f11,	%f8
	fmovdneg	%xcc,	%f3,	%f0
	brlz,a	%g6,	loop_520
	array32	%g6,	%i2,	%g6
	sethi	0x1139,	%g6
	subccc	%g6,	%g6,	%l6
loop_520:
	fbl,a	%fcc0,	loop_521
	sth	%l6,	[%l7 + 0x2C]
	fmovrdgz	%l6,	%f14,	%f4
	fcmps	%fcc1,	%f0,	%f6
loop_521:
	fnot2	%f4,	%f0
	xor	%l6,	%l2,	%l6
	ldd	[%l7 + 0x18],	%f8
	popc	0x01DA,	%l6
	fcmpne16	%f4,	%f0,	%l6
	fcmpgt16	%f4,	%f12,	%l6
	tg	%icc,	0x3
	move	%xcc,	%i7,	%l6
	ldsh	[%l7 + 0x18],	%l6
	tneg	%xcc,	0x2
	smulcc	%l6,	0x0672,	%l6
	taddcc	%l6,	%g4,	%l6
	nop
	lduh	[%l7 + 0x20],	%l6
	srlx	%l6,	0x00,	%l6
	std	%f4,	[%l7 + 0x08]
	fcmpgt32	%f4,	%f0,	%l6
	ldub	[%l7 + 0x56],	%l6
	bgu	loop_522
	alignaddrl	%l6,	%o7,	%l6
	bcs,a	%xcc,	loop_523
	movleu	%xcc,	%l4,	%l6
loop_522:
	tcs	%icc,	0x4
	fexpand	%f6,	%f14
loop_523:
	fmovrdlez	%l6,	%f2,	%f10
	or	%l6,	0x0AED,	%l6
	nop
	stx	%l6,	[%l7 + 0x70]
	tgu	%xcc,	0x1
	fbu,a	%fcc3,	loop_524
	tg	%xcc,	0x7
	lduw	[%l7 + 0x7C],	%l6
	bleu,a,pt	%icc,	loop_525
loop_524:
	st	%f6,	[%l7 + 0x30]
	tleu	%icc,	0x4
	sub	%l6,	0x04CC,	%l6
loop_525:
	movpos	%icc,	%l6,	%o4
	fmovdge	%xcc,	%f1,	%f8
	tvc	%xcc,	0x5
	fmul8x16al	%f8,	%f0,	%f2
	fmul8x16al	%f8,	%f10,	%f8
	sth	%o4,	[%l7 + 0x4E]
	movl	%xcc,	%i3,	%o4
	orn	%o4,	0x1436,	%o4
	orcc	%o4,	%o4,	%l0
	tl	%icc,	0x3
	movg	%icc,	%g1,	%l0
	subc	%l0,	0x011F,	%l0
	mulx	%l0,	0x032C,	%l0
	bleu,pn	%icc,	loop_526
	ldx	[%l7 + 0x58],	%l0
	bleu,a	loop_527
	array32	%l0,	%l0,	%o3
loop_526:
	fsrc2	%f8,	%f14
	lduh	[%l7 + 0x28],	%o3
loop_527:
	brz	%o3,	loop_528
	ldub	[%l7 + 0x79],	%o3
	call	loop_529
	fbn	%fcc2,	loop_530
loop_528:
	ta	%icc,	0x0
	ldsb	[%l7 + 0x52],	%o3
loop_529:
	movre	%o3,	%l3,	%o3
loop_530:
	smul	%o3,	%o2,	%o3
	bgu,a	%icc,	loop_531
	tsubcctv	%o3,	0x1AB5,	%o3
	sll	%o3,	%o3,	%i5
	fbug,a	%fcc3,	loop_532
loop_531:
	movvs	%icc,	%g2,	%i5
	udivx	%i5,	0x1B8F,	%i5
	nop
loop_532:
	alignaddrl	%i5,	%i5,	%i4
	andn	%i4,	%o6,	%i4
	fmul8ulx16	%f8,	%f12,	%f4
	movrlz	%i4,	%i4,	%g3
	movneg	%icc,	%g3,	%l5
	tpos	%xcc,	0x0
	xnor	%l5,	%l5,	%i0
	lduw	[%l7 + 0x40],	%i0
	bn,a	%xcc,	loop_533
	tcs	%icc,	0x5
	std	%f4,	[%l7 + 0x78]
	movn	%xcc,	%i1,	%i0
loop_533:
	subcc	%i0,	0x1B4C,	%i0
	movleu	%icc,	%l1,	%i0
	fmovsleu	%icc,	%f12,	%f13
	bcs,a,pt	%xcc,	loop_534
	movl	%icc,	%g5,	%i0
	brgz,a	%i0,	loop_535
	pdist	%f4,	%f8,	%f14
loop_534:
	ble,a	loop_536
	mulx	%i0,	%i0,	%o0
loop_535:
	fmovsne	%xcc,	%f3,	%f0
	nop
loop_536:
	movrgz	%o0,	%i6,	%o0
	addcc	%o0,	%o5,	%o0
	udiv	%o0,	0x1FE9,	%o0
	ldsh	[%l7 + 0x50],	%o0
	ldsw	[%l7 + 0x68],	%o0
	fnegd	%f14,	%f6
	fmovsl	%xcc,	%f6,	%f1
	alignaddr	%o0,	%o0,	%o1
	sra	%o1,	%g7,	%o1
	xorcc	%o1,	%i2,	%o1
	andn	%o1,	%o1,	%g6
	stb	%g6,	[%l7 + 0x0C]
	tleu	%xcc,	0x2
	call	loop_537
	bl	%xcc,	loop_538
	fmovdl	%icc,	%f15,	%f6
	tcs	%xcc,	0x1
loop_537:
	tle	%xcc,	0x2
loop_538:
	ldsb	[%l7 + 0x26],	%g6
	smul	%g6,	%g6,	%l2
	umulcc	%l2,	%l2,	%i7
	fpadd16	%f14,	%f6,	%f0
	fbge	%fcc2,	loop_539
	fcmpd	%fcc0,	%f10,	%f10
	fmovdleu	%xcc,	%f9,	%f6
	fnot2s	%f6,	%f9
loop_539:
	sth	%i7,	[%l7 + 0x42]
	alignaddr	%i7,	%g4,	%i7
	srl	%i7,	0x0C,	%i7
	fmovsvs	%icc,	%f0,	%f8
	fbul,a	%fcc0,	loop_540
	ldub	[%l7 + 0x2D],	%i7
	fnegs	%f8,	%f5
	bgu,a	%icc,	loop_541
loop_540:
	fnot1	%f10,	%f8
	nop
	fmovdvc	%icc,	%f0,	%f5
loop_541:
	fmovsleu	%icc,	%f0,	%f0
	stx	%i7,	[%l7 + 0x48]
	tcs	%xcc,	0x4
	ta	%icc,	0x4
	mulscc	%i7,	0x1B5B,	%i7
	fabsd	%f10,	%f8
	std	%f10,	[%l7 + 0x68]
	fabsd	%f10,	%f4
	popc	%i7,	%i7
	taddcctv	%i7,	0x013B,	%i7
	nop
	setx loop_542, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	sdiv	%i7,	0x1BC0,	%i7
	xnorcc	%i7,	%o7,	%i7
	fmovsn	%xcc,	%f0,	%f3
loop_542:
	bleu,pt	%xcc,	loop_543
	lduh	[%l7 + 0x64],	%i7
	fmovdg	%xcc,	%f8,	%f14
	ldsw	[%l7 + 0x48],	%i7
loop_543:
	movgu	%icc,	%i7,	%l4
	array16	%l4,	%l4,	%l6
	movcc	%icc,	%l6,	%i3
	fcmpeq32	%f10,	%f4,	%i3
	tgu	%icc,	0x7
	fnegd	%f10,	%f8
	fnot2s	%f14,	%f11
	fmovrslz	%i3,	%f4,	%f13
	stb	%i3,	[%l7 + 0x0D]
	ldsh	[%l7 + 0x24],	%i3
	add	%i3,	0x051D,	%i3
	fbl	%fcc0,	loop_544
	orn	%i3,	%o4,	%i3
	sll	%i3,	%g1,	%i3
	movge	%xcc,	%l0,	%i3
loop_544:
	fbe	%fcc0,	loop_545
	fandnot1s	%f13,	%f10,	%f14
	addcc	%i3,	0x07D5,	%i3
	nop
loop_545:
	nop
	fmuld8ulx16	%f14,	%f2,	%f2
	sth	%i3,	[%l7 + 0x78]
	movpos	%xcc,	%i3,	%l3
	mulx	%l3,	%l3,	%o2
	udivx	%o2,	0x13FB,	%o2
	mova	%xcc,	%o3,	%o2
	fpadd16	%f2,	%f8,	%f12
	movvs	%icc,	%o2,	%g2
	srlx	%g2,	0x02,	%g2
	fmovrdlez	%g2,	%f10,	%f0
	nop
	ta	%icc,	0x5
	taddcctv	%g2,	%i5,	%g2
	fmovdne	%xcc,	%f14,	%f12
	tg	%xcc,	0x0
	brnz,a	%g2,	loop_546
	subcc	%g2,	%g2,	%o6
	addccc	%o6,	%i4,	%o6
	nop
loop_546:
	fcmpgt16	%f0,	%f2,	%o6
	movneg	%xcc,	%g3,	%o6
	andcc	%o6,	%l5,	%o6
	fpackfix	%f0,	%f15
	fmovdvs	%icc,	%f15,	%f12
	fornot1	%f0,	%f14,	%f14
	movre	%o6,	%i1,	%o6
	fzeros	%f12
	ldsb	[%l7 + 0x58],	%o6
	subc	%o6,	0x028D,	%o6
	fone	%f14
	fmovdcc	%icc,	%f5,	%f5
	brgz	%o6,	loop_547
	subc	%o6,	%l1,	%o6
	alignaddr	%o6,	%o6,	%g5
	addccc	%g5,	%g5,	%i0
loop_547:
	ldub	[%l7 + 0x5A],	%i0
	brlz,a	%i0,	loop_548
	xnorcc	%i0,	0x0C41,	%i0
	orncc	%i0,	%i6,	%i0
	udivcc	%i0,	0x0E3D,	%i0
loop_548:
	fmovscc	%icc,	%f12,	%f7
	nop
	movge	%icc,	%o5,	%i0
	fmovdneg	%xcc,	%f1,	%f7
	fmovsg	%icc,	%f12,	%f9
	ta	%icc,	0x0
	nop
	fpadd16	%f14,	%f14,	%f4
	fnot2s	%f9,	%f4
	or	%i0,	0x187B,	%i0
	fandnot2	%f4,	%f0,	%f8
	lduh	[%l7 + 0x1C],	%i0
	movrlez	%i0,	%o0,	%i0
	fbule,a	%fcc3,	loop_549
	ldub	[%l7 + 0x29],	%i0
	orncc	%i0,	0x1E20,	%i0
	movn	%icc,	%i0,	%g7
loop_549:
	fmovdle	%xcc,	%f9,	%f12
	add	%g7,	%i2,	%g7
	xnorcc	%g7,	0x0B14,	%g7
	fcmpgt16	%f8,	%f12,	%g7
	sdivcc	%g7,	0x115C,	%g7
	mulx	%g7,	0x1327,	%g7
	fbue	%fcc1,	loop_550
	nop
	movrne	%g7,	%g7,	%o1
	movleu	%xcc,	%o1,	%g6
loop_550:
	sth	%g6,	[%l7 + 0x34]
	xorcc	%g6,	0x1C6A,	%g6
	te	%icc,	0x5
	ble,a	loop_551
	lduw	[%l7 + 0x2C],	%g6
	fcmpeq16	%f8,	%f6,	%g6
	taddcc	%g6,	0x0FC9,	%g6
loop_551:
	te	%icc,	0x1
	movge	%xcc,	%l2,	%g6
	movrne	%g6,	0x1AE,	%g6
	nop
	bvs,a,pn	%icc,	loop_552
	brlez,a	%g6,	loop_553
	xorcc	%g6,	%g6,	%g4
	fands	%f12,	%f6,	%f7
loop_552:
	subc	%g4,	%g4,	%o7
loop_553:
	fmuld8ulx16	%f7,	%f15,	%f4
	fandnot2	%f4,	%f12,	%f0
	brnz,a	%o7,	loop_554
	ldsw	[%l7 + 0x24],	%o7
	sdiv	%o7,	0x1CE6,	%o7
	tcc	%icc,	0x0
loop_554:
	nop
	fpsub16s	%f7,	%f11,	%f5
	fbl	%fcc0,	loop_555
	xnor	%o7,	%o7,	%i7
	move	%xcc,	%l4,	%i7
	ldsb	[%l7 + 0x28],	%i7
loop_555:
	fmovdvs	%xcc,	%f12,	%f2
	sth	%i7,	[%l7 + 0x48]
	tsubcc	%i7,	0x10CE,	%i7
	fmovdge	%xcc,	%f2,	%f0
	sth	%i7,	[%l7 + 0x20]
	fandnot1s	%f0,	%f4,	%f3
	addc	%i7,	0x0659,	%i7
	srl	%i7,	0x14,	%i7
	or	%i7,	0x08E3,	%i7
	srax	%i7,	%l6,	%i7
	udivcc	%i7,	0x0BB0,	%i7
	srl	%i7,	0x0D,	%i7
	subccc	%i7,	0x1CA1,	%i7
	st	%f3,	[%l7 + 0x5C]
	subc	%i7,	0x195E,	%i7
	nop
	fmovrslz	%i7,	%f15,	%f4
	movvs	%xcc,	%i7,	%o4
	fbe	%fcc1,	loop_556
	movleu	%icc,	%o4,	%g1
	sdiv	%g1,	0x01EF,	%g1
	nop
loop_556:
	smul	%g1,	0x0F0C,	%g1
	fcmps	%fcc3,	%f14,	%f1
	nop
	mulx	%g1,	%l0,	%g1
	lduh	[%l7 + 0x36],	%g1
	orcc	%g1,	0x078A,	%g1
	nop
	brnz,a	%g1,	loop_557
	nop
	xnorcc	%g1,	0x04A0,	%g1
	movle	%xcc,	%g1,	%i3
loop_557:
	array32	%i3,	%i3,	%l3
	lduw	[%l7 + 0x34],	%l3
	movneg	%icc,	%o3,	%l3
	nop
	fmovrslz	%l3,	%f14,	%f14
	and	%l3,	%l3,	%o2
	fcmpgt16	%f0,	%f14,	%o2
	orn	%o2,	0x1D4D,	%o2
	ld	[%l7 + 0x24],	%f1
	orn	%o2,	0x1BCA,	%o2
	stx	%o2,	[%l7 + 0x30]
	movg	%xcc,	%o2,	%i5
	movre	%i5,	0x26E,	%i5
	stx	%i5,	[%l7 + 0x08]
	sra	%i5,	0x1B,	%i5
	fmovsgu	%icc,	%f8,	%f0
	brlz	%i5,	loop_558
	movn	%icc,	%g2,	%i5
	sethi	0x1E5C,	%i5
	stb	%i5,	[%l7 + 0x59]
loop_558:
	sub	%i5,	0x022E,	%i5
	mulscc	%i5,	0x08EA,	%i5
	or	%i5,	%i4,	%i5
	nop
	movrlz	%i5,	0x232,	%i5
	fmovsn	%icc,	%f6,	%f15
	sdivcc	%i5,	0x0A5C,	%i5
	brnz	%i5,	loop_559
	st	%f15,	[%l7 + 0x2C]
	movleu	%icc,	%i5,	%g3
	ldd	[%l7 + 0x28],	%f2
loop_559:
	bn,a	loop_560
	brgz,a	%g3,	loop_561
	umul	%g3,	0x1B65,	%g3
	fmovscc	%icc,	%f6,	%f13
loop_560:
	stw	%g3,	[%l7 + 0x54]
loop_561:
	alignaddr	%g3,	%g3,	%l5
	alignaddrl	%l5,	%i1,	%l5
	tsubcctv	%l5,	0x0A82,	%l5
	and	%l5,	%l5,	%l1
	nop
	andcc	%l1,	%l1,	%o6
	ld	[%l7 + 0x5C],	%f4
	tsubcc	%o6,	0x05E7,	%o6
	ld	[%l7 + 0x08],	%f8
	addc	%o6,	0x171B,	%o6
	ldub	[%l7 + 0x58],	%o6
	movcc	%icc,	%g5,	%o6
	nop
	stw	%o6,	[%l7 + 0x78]
	fcmpeq32	%f0,	%f6,	%o6
	fone	%f0
	udivcc	%o6,	0x16DC,	%o6
	bgu,pn	%icc,	loop_562
	fblg,a	%fcc1,	loop_563
	popc	%o6,	%o6
	taddcctv	%o6,	0x0D81,	%o6
loop_562:
	tl	%xcc,	0x1
loop_563:
	sdiv	%o6,	0x0633,	%o6
	nop
	lduh	[%l7 + 0x6E],	%o6
	fmovsgu	%xcc,	%f11,	%f1
	nop
	sdivcc	%o6,	0x0B8C,	%o6
	addccc	%o6,	%i6,	%o6
	std	%f0,	[%l7 + 0x20]
	bvc,a	loop_564
	tge	%icc,	0x5
	taddcc	%o6,	%o5,	%o6
	fsrc1s	%f1,	%f15
loop_564:
	xorcc	%o6,	%o0,	%o6
	fbn	%fcc1,	loop_565
	ldub	[%l7 + 0x3E],	%o6
	brlz,a	%o6,	loop_566
	fbuge,a	%fcc1,	loop_567
loop_565:
	xnorcc	%o6,	0x06AA,	%o6
	stx	%o6,	[%l7 + 0x30]
loop_566:
	move	%icc,	%i0,	%o6
loop_567:
	nop
	taddcc	%o6,	0x0902,	%o6
	fpack32	%f0,	%f10,	%f6
	fbge	%fcc3,	loop_568
	sdivx	%o6,	0x0A2E,	%o6
	fmovrsne	%o6,	%f7,	%f11
	ldsb	[%l7 + 0x25],	%o6
loop_568:
	nop
	bvc,pn	%xcc,	loop_569
	fmovdle	%icc,	%f14,	%f14
	st	%f14,	[%l7 + 0x3C]
	fble	%fcc3,	loop_570
loop_569:
	movpos	%xcc,	%i2,	%o6
	movle	%icc,	%g7,	%o6
	fmul8sux16	%f6,	%f4,	%f8
loop_570:
	ldsh	[%l7 + 0x32],	%o6
	st	%f14,	[%l7 + 0x6C]
	fmovrde	%o6,	%f10,	%f0
	nop
	udivx	%o6,	0x09EB,	%o6
	movrne	%o6,	0x0D1,	%o6
	srlx	%o6,	0x0B,	%o6
	stw	%o6,	[%l7 + 0x58]
	fpackfix	%f0,	%f4
	xnorcc	%o6,	0x0E72,	%o6
	fands	%f14,	%f1,	%f3
	srax	%o6,	%o6,	%o1
	ld	[%l7 + 0x68],	%f13
	fcmpeq32	%f0,	%f4,	%o1
	fblg,a	%fcc3,	loop_571
	array16	%o1,	%o1,	%l2
	fnot1s	%f3,	%f0
	movg	%xcc,	%g6,	%l2
loop_571:
	fblg	%fcc2,	loop_572
	bshuffle	%f0,	%f0,	%f10
	smulcc	%l2,	0x121B,	%l2
	bleu,a	%icc,	loop_573
loop_572:
	fnot1s	%f3,	%f3
	tg	%xcc,	0x4
	brlez,a	%l2,	loop_574
loop_573:
	fnot1s	%f3,	%f12
	stw	%l2,	[%l7 + 0x34]
	and	%l2,	%l2,	%g4
loop_574:
	nop
	tg	%icc,	0x6
	xnor	%g4,	%g4,	%o7
	umul	%o7,	%o7,	%l4
	brz,a	%l4,	loop_575
	mova	%icc,	%l4,	%l6
	andcc	%l6,	0x09DD,	%l6
	tsubcctv	%l6,	0x13B6,	%l6
loop_575:
	movvc	%icc,	%i7,	%l6
	tpos	%icc,	0x3
	brnz,a	%l6,	loop_576
	ld	[%l7 + 0x18],	%f15
	fmovsneg	%xcc,	%f0,	%f10
	add	%l6,	%l6,	%o4
loop_576:
	movn	%icc,	%l0,	%o4
	orcc	%o4,	%g1,	%o4
	addc	%o4,	%i3,	%o4
	ldsb	[%l7 + 0x75],	%o4
	nop
	taddcc	%o4,	%o4,	%o3
	xnor	%o3,	0x195D,	%o3
	mulscc	%o3,	%l3,	%o3
	fmovda	%xcc,	%f2,	%f14
	fbue	%fcc2,	loop_577
	movrne	%o3,	0x06E,	%o3
	movrlz	%o3,	0x177,	%o3
	fbne	%fcc3,	loop_578
loop_577:
	tneg	%icc,	0x7
	andncc	%o3,	%o3,	%o2
	taddcctv	%o2,	%g2,	%o2
loop_578:
	umul	%o2,	0x0A1F,	%o2
	fmovrde	%o2,	%f14,	%f12
	lduw	[%l7 + 0x60],	%o2
	tgu	%icc,	0x7
	array16	%o2,	%i4,	%o2
	tge	%xcc,	0x5
	movl	%xcc,	%i5,	%o2
	tne	%xcc,	0x6
	umulcc	%o2,	0x0434,	%o2
	taddcc	%o2,	%o2,	%g3
	fmovsleu	%icc,	%f0,	%f9
	nop
	mulx	%g3,	%g3,	%i1
	fbl	%fcc2,	loop_579
	alignaddrl	%i1,	%i1,	%l5
	tg	%icc,	0x2
	nop
loop_579:
	fmovdgu	%xcc,	%f9,	%f8
	fbuge	%fcc0,	loop_580
	movvs	%xcc,	%l5,	%l1
	array8	%l1,	%l1,	%g5
	ld	[%l7 + 0x74],	%f10
loop_580:
	sethi	0x1307,	%g5
	fcmpgt16	%f12,	%f8,	%g5
	fors	%f8,	%f2,	%f12
	fnot2	%f12,	%f8
	brlez,a	%g5,	loop_581
	tle	%icc,	0x0
	fzeros	%f12
	sll	%g5,	%g5,	%i6
loop_581:
	sth	%i6,	[%l7 + 0x70]
	movne	%xcc,	%o5,	%i6
	fblg,a	%fcc1,	loop_582
	udivx	%i6,	0x0693,	%i6
	xnorcc	%i6,	%i6,	%o0
	mulx	%o0,	%i0,	%o0
loop_582:
	movrlz	%o0,	0x06E,	%o0
	std	%f12,	[%l7 + 0x40]
	fbue,a	%fcc0,	loop_583
	nop
	subc	%o0,	%o0,	%i2
	sth	%i2,	[%l7 + 0x2A]
loop_583:
	umulcc	%i2,	0x1BBA,	%i2
	stw	%i2,	[%l7 + 0x28]
	fbo,a	%fcc3,	loop_584
	stw	%i2,	[%l7 + 0x74]
	nop
	fmovde	%xcc,	%f6,	%f13
loop_584:
	fmul8x16al	%f13,	%f15,	%f10
	fnot2	%f10,	%f12
	stx	%i2,	[%l7 + 0x40]
	array32	%i2,	%g7,	%i2
	movgu	%xcc,	%o6,	%i2
	addc	%i2,	%o1,	%i2
	fzero	%f10
	udivx	%i2,	0x09D4,	%i2
	and	%i2,	%g6,	%i2
	nop
	addcc	%i2,	0x0D36,	%i2
	nop
	fmovrse	%i2,	%f10,	%f14
	subc	%i2,	%l2,	%i2
	ld	[%l7 + 0x34],	%f10
	movrne	%i2,	0x285,	%i2
	subc	%i2,	0x1666,	%i2
	tsubcctv	%i2,	0x1A24,	%i2
	array16	%i2,	%g4,	%i2
	nop
	fmovdge	%icc,	%f10,	%f2
	udivx	%i2,	0x01C6,	%i2
	movre	%i2,	%o7,	%i2
	fmovdvc	%xcc,	%f11,	%f2
	fandnot1	%f10,	%f14,	%f8
	sethi	0x050A,	%i2
	bl,pn	%xcc,	loop_585
	tn	%xcc,	0x3
	stb	%i2,	[%l7 + 0x46]
	fcmpes	%fcc2,	%f8,	%f6
loop_585:
	fbo	%fcc0,	loop_586
	sth	%i2,	[%l7 + 0x3C]
	fpsub32	%f8,	%f12,	%f6
	andn	%i2,	0x1F19,	%i2
loop_586:
	fpadd32s	%f6,	%f11,	%f8
	sth	%i2,	[%l7 + 0x3A]
	nop
	movne	%xcc,	%l4,	%i2
	fzero	%f6
	smul	%i2,	%i7,	%i2
	add	%i2,	0x14EC,	%i2
	fand	%f6,	%f6,	%f14
	add	%i2,	%i2,	%l6
	movne	%xcc,	%l0,	%l6
	fmovrsgez	%l6,	%f2,	%f11
	movleu	%xcc,	%g1,	%l6
	fpmerge	%f11,	%f13,	%f0
	or	%l6,	%l6,	%i3
	fbge	%fcc3,	loop_587
	te	%xcc,	0x6
	stw	%i3,	[%l7 + 0x6C]
	tneg	%xcc,	0x3
loop_587:
	fbule	%fcc2,	loop_588
	srlx	%i3,	0x19,	%i3
	subccc	%i3,	0x123C,	%i3
	movgu	%icc,	%i3,	%o4
loop_588:
	array8	%o4,	%l3,	%o4
	tsubcc	%o4,	0x19C1,	%o4
	movgu	%icc,	%o3,	%o4
	fcmple32	%f0,	%f4,	%o4
	smulcc	%o4,	0x1DE0,	%o4
	fnegs	%f11,	%f10
	sth	%o4,	[%l7 + 0x32]
	udivcc	%o4,	0x1FD0,	%o4
	ble,pt	%icc,	loop_589
	lduh	[%l7 + 0x6C],	%o4
	movne	%icc,	%o4,	%g2
	addcc	%g2,	0x0BAD,	%g2
loop_589:
	udivx	%g2,	0x07B8,	%g2
	sdiv	%g2,	0x06AD,	%g2
	nop
	movvc	%icc,	%g2,	%i4
	tle	%xcc,	0x2
	srlx	%i4,	%i4,	%i5
	nop
	move	%icc,	%o2,	%i5
	array8	%i5,	%g3,	%i5
	sll	%i5,	0x03,	%i5
	bvs	loop_590
	fbu,a	%fcc2,	loop_591
	nop
	mova	%icc,	%i1,	%i5
loop_590:
	xorcc	%i5,	%i5,	%l5
loop_591:
	fmovda	%icc,	%f0,	%f1
	fmovsvc	%icc,	%f6,	%f5
	tgu	%icc,	0x1
	nop
	tg	%xcc,	0x6
	fmovsa	%icc,	%f10,	%f1
	fmovscc	%xcc,	%f12,	%f7
	alignaddrl	%l5,	%l1,	%l5
	ldub	[%l7 + 0x62],	%l5
	sll	%l5,	%g5,	%l5
	movrgez	%l5,	0x0CB,	%l5
	fmovdpos	%icc,	%f13,	%f13
	movg	%icc,	%l5,	%o5
	brlz,a	%o5,	loop_592
	ld	[%l7 + 0x4C],	%f13
	fpsub32	%f0,	%f2,	%f10
	tvs	%xcc,	0x0
loop_592:
	movcs	%xcc,	%i6,	%o5
	lduh	[%l7 + 0x34],	%o5
	bg,a	loop_593
	stw	%o5,	[%l7 + 0x4C]
	nop
	fbug,a	%fcc2,	loop_594
loop_593:
	fnors	%f13,	%f6,	%f9
	andncc	%o5,	%o5,	%i0
	stb	%i0,	[%l7 + 0x20]
loop_594:
	srlx	%i0,	%o0,	%i0
	movvc	%icc,	%i0,	%g7
	movneg	%icc,	%g7,	%o6
	fnot2s	%f9,	%f4
	tn	%icc,	0x3
	fbne	%fcc2,	loop_595
	tcc	%xcc,	0x5
	orcc	%o6,	0x0B35,	%o6
	mulscc	%o6,	%o1,	%o6
loop_595:
	bvc,a,pt	%icc,	loop_596
	movgu	%icc,	%o6,	%g6
	fbne	%fcc2,	loop_597
	tcc	%xcc,	0x3
loop_596:
	ldd	[%l7 + 0x50],	%f0
	fmovrdlz	%g6,	%f2,	%f10
loop_597:
	ld	[%l7 + 0x3C],	%f0
	movg	%xcc,	%l2,	%g6
	mova	%xcc,	%g4,	%g6
	sub	%g6,	%g6,	%o7
	subccc	%o7,	0x112B,	%o7
	fpmerge	%f9,	%f6,	%f12
	orcc	%o7,	%o7,	%l4
	movcs	%icc,	%i7,	%l4
	subc	%l4,	0x1B8C,	%l4
	fmovsa	%xcc,	%f10,	%f6
	tn	%xcc,	0x5
	bshuffle	%f12,	%f4,	%f0
	tsubcc	%l4,	0x0A82,	%l4
	umul	%l4,	%l4,	%i2
	fabss	%f6,	%f0
	fpack16	%f0,	%f11
	fabss	%f6,	%f1
	ldx	[%l7 + 0x40],	%i2
	andncc	%i2,	%l0,	%i2
	movn	%xcc,	%i2,	%g1
	orncc	%g1,	%l6,	%g1
	fmovscs	%xcc,	%f3,	%f13
	srlx	%g1,	%g1,	%i3
	fbule,a	%fcc0,	loop_598
	fbge,a	%fcc1,	loop_599
	mulx	%i3,	%l3,	%i3
	taddcc	%i3,	%i3,	%o3
loop_598:
	xor	%o3,	0x0EA7,	%o3
loop_599:
	fpmerge	%f13,	%f3,	%f6
	sdivx	%o3,	0x1095,	%o3
	fmovspos	%xcc,	%f2,	%f5
	tne	%xcc,	0x1
	subcc	%o3,	%o3,	%o4
	nop
	bshuffle	%f6,	%f4,	%f0
	nop
	nop
	movre	%o4,	0x2D9,	%o4
	fmovsvs	%icc,	%f2,	%f1
	move	%xcc,	%o4,	%g2
	fmovdvc	%icc,	%f10,	%f4
	array16	%g2,	%g2,	%i4
	fpadd32	%f0,	%f12,	%f4
	bge,a,pt	%xcc,	loop_600
	std	%f4,	[%l7 + 0x78]
	nop
	movge	%icc,	%i4,	%o2
loop_600:
	tle	%icc,	0x4
	ba	%xcc,	loop_601
	movcs	%xcc,	%o2,	%g3
	array8	%g3,	%g3,	%i1
	fmovrdlz	%i1,	%f4,	%f12
loop_601:
	smul	%i1,	0x06CC,	%i1
	fpack32	%f12,	%f8,	%f8
	tle	%xcc,	0x6
	nop
	fcmps	%fcc2,	%f8,	%f13
	alignaddr	%i1,	%i1,	%i5
	fsrc2s	%f13,	%f10
	tvc	%xcc,	0x2
	movn	%xcc,	%l1,	%i5
	call	loop_602
	array16	%i5,	%g5,	%i5
	movpos	%icc,	%i5,	%l5
	move	%xcc,	%i6,	%l5
loop_602:
	fmovdleu	%xcc,	%f0,	%f7
	movcs	%icc,	%o5,	%l5
	xnorcc	%l5,	%o0,	%l5
	bge,pt	%icc,	loop_603
	ldsw	[%l7 + 0x44],	%l5
	stw	%l5,	[%l7 + 0x14]
	tpos	%icc,	0x1
loop_603:
	movcs	%icc,	%i0,	%l5
	fbul,a	%fcc2,	loop_604
	fbule,a	%fcc1,	loop_605
	xor	%l5,	%g7,	%l5
	mulx	%l5,	%l5,	%o1
loop_604:
	nop
	setx loop_606, %l0, %l1
	jmpl %l1, %o1
loop_605:
	lduw	[%l7 + 0x54],	%o1
	bge,pt	%icc,	loop_607
	std	%f8,	[%l7 + 0x60]
loop_606:
	lduh	[%l7 + 0x60],	%o1
	tcs	%xcc,	0x0
loop_607:
	sethi	0x1267,	%o1
	nop
	stx	%o1,	[%l7 + 0x30]
	movre	%o1,	%o1,	%o6
	alignaddr	%o6,	%o6,	%l2
	stx	%l2,	[%l7 + 0x20]
	fpack16	%f8,	%f11
	fmovsvc	%xcc,	%f8,	%f4
	fbu	%fcc3,	loop_608
	nop
	array16	%l2,	%g4,	%l2
	tsubcc	%l2,	0x0F15,	%l2
loop_608:
	fsrc2s	%f4,	%f12
	addc	%l2,	%l2,	%g6
	udiv	%g6,	0x14D2,	%g6
	movrlz	%g6,	%o7,	%g6
	bleu,a	%icc,	loop_609
	sth	%g6,	[%l7 + 0x32]
	ldx	[%l7 + 0x48],	%g6
	tneg	%icc,	0x7
loop_609:
	fnot1	%f8,	%f6
	fnors	%f4,	%f8,	%f12
	movvs	%xcc,	%i7,	%g6
	movge	%icc,	%l4,	%g6
	nop
	setx loop_610, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	xnor	%g6,	%g6,	%l0
	te	%xcc,	0x4
	fbe,a	%fcc0,	loop_611
loop_610:
	fmovsne	%xcc,	%f12,	%f5
	ldsb	[%l7 + 0x5E],	%l0
	sdivx	%l0,	0x16FF,	%l0
loop_611:
	tn	%xcc,	0x7
	fble,a	%fcc3,	loop_612
	fcmple16	%f8,	%f0,	%l0
	stx	%l0,	[%l7 + 0x38]
	array16	%l0,	%l0,	%i2
loop_612:
	tn	%xcc,	0x3
	ldsb	[%l7 + 0x36],	%i2
	taddcc	%i2,	0x09DB,	%i2
	fmovde	%xcc,	%f3,	%f14
	ldx	[%l7 + 0x70],	%i2
	taddcctv	%i2,	%i2,	%l6
	be,a,pt	%xcc,	loop_613
	udiv	%l6,	0x189B,	%l6
	subc	%l6,	%g1,	%l6
	fone	%f8
loop_613:
	movneg	%xcc,	%l6,	%l3
	st	%f14,	[%l7 + 0x70]
	stx	%l3,	[%l7 + 0x28]
	ld	[%l7 + 0x34],	%f10
	fzeros	%f14
	fandnot1s	%f14,	%f6,	%f4
	addcc	%l3,	%i3,	%l3
	movgu	%icc,	%o3,	%l3
	sub	%l3,	0x1F59,	%l3
	fmovda	%icc,	%f2,	%f14
	fornot1s	%f14,	%f0,	%f5
	std	%f8,	[%l7 + 0x08]
	ldx	[%l7 + 0x18],	%l3
	udivcc	%l3,	0x1E1E,	%l3
	stx	%l3,	[%l7 + 0x08]
	tsubcc	%l3,	0x0545,	%l3
	nop
	array32	%l3,	%l3,	%o4
	tneg	%xcc,	0x5
	fors	%f5,	%f13,	%f8
	fcmps	%fcc1,	%f9,	%f2
	fzero	%f8
	fnegd	%f8,	%f12
	ldd	[%l7 + 0x20],	%f12
	tl	%icc,	0x2
	fmovsgu	%icc,	%f15,	%f0
	umul	%o4,	0x17E7,	%o4
	nop
	add	%o4,	0x1295,	%o4
	srl	%o4,	0x0E,	%o4
	brgz	%o4,	loop_614
	smulcc	%o4,	%g2,	%o4
	udiv	%o4,	0x03FE,	%o4
	bneg,a,pn	%xcc,	loop_615
loop_614:
	nop
	setx loop_616, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	tgu	%icc,	0x1
	movvc	%xcc,	%i4,	%o4
loop_615:
	movvc	%xcc,	%o4,	%o2
loop_616:
	brgz	%o2,	loop_617
	fmovscs	%icc,	%f6,	%f9
	tvs	%icc,	0x4
	or	%o2,	%g3,	%o2
loop_617:
	umul	%o2,	%i1,	%o2
	alignaddr	%o2,	%o2,	%l1
	brz,a	%l1,	loop_618
	fmovsneg	%xcc,	%f2,	%f0
	movrlz	%l1,	%l1,	%g5
	stx	%g5,	[%l7 + 0x58]
loop_618:
	tcs	%xcc,	0x2
	sethi	0x0C80,	%g5
	sll	%g5,	%g5,	%i5
	sdivcc	%i5,	0x092A,	%i5
	nop
	fandnot1	%f8,	%f4,	%f4
	fmovsle	%icc,	%f9,	%f9
	udivcc	%i5,	0x004D,	%i5
	tcc	%icc,	0x4
	fmovrsgez	%i5,	%f5,	%f6
	addccc	%i5,	0x0A9A,	%i5
	sub	%i5,	%i6,	%i5
	or	%i5,	0x1E62,	%i5
	movcc	%icc,	%o5,	%i5
	addcc	%i5,	%o0,	%i5
	movleu	%xcc,	%i5,	%i0
	stb	%i0,	[%l7 + 0x44]
	fmuld8ulx16	%f6,	%f2,	%f4
	movcc	%icc,	%i0,	%g7
	fmovsge	%xcc,	%f15,	%f13
	nop
	stx	%g7,	[%l7 + 0x30]
	smul	%g7,	%l5,	%g7
	be,a,pn	%icc,	loop_619
	tneg	%icc,	0x0
	sra	%g7,	0x14,	%g7
	sethi	0x00CD,	%g7
loop_619:
	fzero	%f4
	xorcc	%g7,	0x0754,	%g7
	lduh	[%l7 + 0x64],	%g7
	tne	%icc,	0x0
	tsubcctv	%g7,	%g7,	%o1
	ldub	[%l7 + 0x7E],	%o1
	fornot2	%f4,	%f4,	%f14
	tcs	%icc,	0x6
	ldd	[%l7 + 0x20],	%f4
	addcc	%o1,	%o6,	%o1
	tg	%xcc,	0x6
	movg	%icc,	%o1,	%g4
	nop
	fandnot2	%f14,	%f10,	%f0
	movrlz	%g4,	0x294,	%g4
	ldx	[%l7 + 0x18],	%g4
	fmovsne	%xcc,	%f15,	%f13
	movle	%icc,	%l2,	%g4
	brgz	%g4,	loop_620
	andncc	%g4,	%o7,	%g4
	fmuld8sux16	%f13,	%f1,	%f4
	nop
loop_620:
	addccc	%g4,	%g4,	%i7
	mulx	%i7,	0x0C29,	%i7
	andncc	%i7,	%l4,	%i7
	umul	%i7,	0x1F8A,	%i7
	tg	%xcc,	0x5
	tsubcctv	%i7,	%i7,	%g6
	ldsb	[%l7 + 0x30],	%g6
	sdivcc	%g6,	0x15C6,	%g6
	addccc	%g6,	%l0,	%g6
	fmovdl	%icc,	%f2,	%f9
	ldsw	[%l7 + 0x28],	%g6
	fmovdvc	%xcc,	%f3,	%f3
	sub	%g6,	%i2,	%g6
	fmovdneg	%icc,	%f5,	%f11
	sdiv	%g6,	0x0549,	%g6
	andcc	%g6,	0x14E8,	%g6
	tn	%icc,	0x5
	subcc	%g6,	%g1,	%g6
	movvs	%icc,	%l6,	%g6
	subccc	%g6,	%i3,	%g6
	movvs	%icc,	%g6,	%o3
	orcc	%o3,	0x0E23,	%o3
	ldd	[%l7 + 0x58],	%f2
	sll	%o3,	0x19,	%o3
	fsrc2	%f4,	%f8
	fpmerge	%f11,	%f1,	%f10
	bg,pn	%xcc,	loop_621
	fabss	%f11,	%f3
	ldsh	[%l7 + 0x30],	%o3
	ldsh	[%l7 + 0x4A],	%o3
loop_621:
	fnot2	%f10,	%f8
	mulscc	%o3,	0x1508,	%o3
	array32	%o3,	%l3,	%o3
	tleu	%icc,	0x5
	xnor	%o3,	%o3,	%g2
	tsubcctv	%g2,	0x0E47,	%g2
	bvc,pn	%xcc,	loop_622
	bn	%xcc,	loop_623
	sdivcc	%g2,	0x0324,	%g2
	te	%icc,	0x1
loop_622:
	stb	%g2,	[%l7 + 0x4A]
loop_623:
	sdivcc	%g2,	0x1A47,	%g2
	std	%f10,	[%l7 + 0x60]
	nop
	subccc	%g2,	0x1907,	%g2
	ldsh	[%l7 + 0x2A],	%g2
	tsubcctv	%g2,	%i4,	%g2
	fmovsle	%icc,	%f13,	%f11
	fmovdcc	%xcc,	%f3,	%f5
	fxnors	%f5,	%f12,	%f0
	brlz,a	%g2,	loop_624
	orncc	%g2,	0x1DEE,	%g2
	ble,pt	%icc,	loop_625
	fmovrdlz	%g2,	%f6,	%f6
loop_624:
	fones	%f0
	sllx	%g2,	%o4,	%g2
loop_625:
	fmovdge	%xcc,	%f15,	%f1
	nop
	setx loop_626, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	fmuld8sux16	%f1,	%f5,	%f4
	fmovsn	%xcc,	%f14,	%f7
	stw	%g2,	[%l7 + 0x38]
loop_626:
	array16	%g2,	%g2,	%g3
	fpadd32s	%f7,	%f13,	%f15
	fmovsl	%icc,	%f0,	%f1
	fmovdcc	%icc,	%f0,	%f8
	movg	%xcc,	%i1,	%g3
	nop
	setx loop_627, %l0, %l1
	jmpl %l1, %g3
	sllx	%g3,	%o2,	%g3
	fbo,a	%fcc3,	loop_628
	nop
loop_627:
	array8	%g3,	%g3,	%l1
	tge	%xcc,	0x3
loop_628:
	andcc	%l1,	%l1,	%g5
	movgu	%xcc,	%g5,	%i6
	fmovdl	%icc,	%f10,	%f15
	siam	0x1
	tleu	%icc,	0x0
	ldd	[%l7 + 0x38],	%f6
	nop
	fbl	%fcc3,	loop_629
	fmul8x16	%f15,	%f12,	%f14
	fmovdcs	%xcc,	%f7,	%f3
	bneg,a	%icc,	loop_630
loop_629:
	mulscc	%i6,	%o5,	%i6
	ldsb	[%l7 + 0x71],	%i6
	fmovsle	%icc,	%f2,	%f8
loop_630:
	fands	%f8,	%f6,	%f6
	fmovrsgez	%i6,	%f4,	%f15
	fmovsa	%icc,	%f11,	%f0
	fmovrslez	%i6,	%f2,	%f5
	fnegs	%f5,	%f10
	andcc	%i6,	0x1986,	%i6
	fmovs	%f5,	%f8
	fblg,a	%fcc3,	loop_631
	movrlz	%i6,	%i6,	%o0
	nop
	subcc	%o0,	0x1491,	%o0
loop_631:
	movvc	%icc,	%i5,	%o0
	ld	[%l7 + 0x58],	%f14
	tn	%icc,	0x6
	movneg	%xcc,	%o0,	%i0
	st	%f5,	[%l7 + 0x58]
	nop
	fcmped	%fcc0,	%f2,	%f14
	move	%icc,	%i0,	%l5
	movrlez	%l5,	%l5,	%g7
	fmovsle	%xcc,	%f8,	%f5
	movrne	%g7,	0x0C7,	%g7
	movcc	%xcc,	%o6,	%g7
	tpos	%icc,	0x1
	fmovspos	%xcc,	%f5,	%f15
	movrlz	%g7,	%g7,	%o1
	fmovdleu	%icc,	%f15,	%f11
	subcc	%o1,	%l2,	%o1
	movpos	%xcc,	%o1,	%o7
	nop
	movre	%o7,	0x0E4,	%o7
	bgu,a,pt	%xcc,	loop_632
	udivcc	%o7,	0x1E8A,	%o7
	movcc	%icc,	%g4,	%o7
	ldub	[%l7 + 0x51],	%o7
loop_632:
	addcc	%o7,	0x105E,	%o7
	nop
	setx loop_633, %l0, %l1
	jmpl %l1, %o7
	xnor	%o7,	%o7,	%l4
	tg	%icc,	0x7
	array32	%l4,	%l4,	%i7
loop_633:
	ldsb	[%l7 + 0x67],	%i7
	taddcctv	%i7,	%i7,	%l0
	fsrc1	%f14,	%f6
	addcc	%l0,	%i2,	%l0
	array8	%l0,	%l0,	%g1
	fxors	%f11,	%f10,	%f4
	smul	%g1,	0x02A0,	%g1
	fmovdg	%icc,	%f3,	%f13
	ldsh	[%l7 + 0x1C],	%g1
	bn,a,pn	%xcc,	loop_634
	andn	%g1,	%g1,	%l6
	alignaddrl	%l6,	%l6,	%i3
	tne	%icc,	0x6
loop_634:
	taddcc	%i3,	0x08C7,	%i3
	fbe,a	%fcc0,	loop_635
	fxnor	%f14,	%f12,	%f2
	movgu	%icc,	%i3,	%g6
	movge	%icc,	%g6,	%l3
loop_635:
	tvs	%icc,	0x3
	te	%icc,	0x3
	movvc	%icc,	%o3,	%l3
	addcc	%l3,	%l3,	%i4
	sll	%i4,	0x0C,	%i4
	fbl,a	%fcc0,	loop_636
	nop
	andcc	%i4,	0x109C,	%i4
	movcs	%icc,	%i4,	%o4
loop_636:
	nop
	sll	%o4,	%o4,	%g2
	std	%f2,	[%l7 + 0x20]
	ld	[%l7 + 0x3C],	%f7
	subcc	%g2,	%i1,	%g2
	movpos	%icc,	%g2,	%o2
	tvc	%xcc,	0x3
	fmovsg	%icc,	%f10,	%f0
	sdivcc	%o2,	0x10F9,	%o2
	fmul8sux16	%f2,	%f0,	%f14
	ldsb	[%l7 + 0x57],	%o2
	movleu	%xcc,	%g3,	%o2
	sdiv	%o2,	0x11CF,	%o2
	movne	%icc,	%l1,	%o2
	udiv	%o2,	0x1F3C,	%o2
	subc	%o2,	%o2,	%g5
	fmovsleu	%xcc,	%f9,	%f5
	fpsub32	%f14,	%f8,	%f12
	fbne	%fcc2,	loop_637
	lduw	[%l7 + 0x08],	%g5
	ld	[%l7 + 0x7C],	%f9
	taddcc	%g5,	%g5,	%o5
loop_637:
	sdivx	%o5,	0x1BD1,	%o5
	nop
	orncc	%o5,	%i6,	%o5
	movgu	%xcc,	%i5,	%o5
	brz,a	%o5,	loop_638
	sdivx	%o5,	0x0935,	%o5
	fba,a	%fcc1,	loop_639
	ldx	[%l7 + 0x70],	%o5
loop_638:
	stx	%o5,	[%l7 + 0x40]
	st	%f5,	[%l7 + 0x14]
loop_639:
	fpadd32	%f12,	%f2,	%f6
	fandnot1s	%f5,	%f11,	%f9
	movvs	%icc,	%o0,	%o5
	subccc	%o5,	%i0,	%o5
	sdivcc	%o5,	0x0548,	%o5
	tle	%icc,	0x2
	sth	%o5,	[%l7 + 0x7E]
	fornot1s	%f9,	%f13,	%f12
	nop
	nop
	fmovda	%xcc,	%f4,	%f2
	nop
	bpos,a,pt	%xcc,	loop_640
	sdivx	%o5,	0x0172,	%o5
	tleu	%xcc,	0x6
	fmovdgu	%xcc,	%f1,	%f15
loop_640:
	ldsw	[%l7 + 0x7C],	%o5
	fbe,a	%fcc0,	loop_641
	movre	%o5,	0x000,	%o5
	fmovdpos	%xcc,	%f6,	%f2
	movvc	%xcc,	%o5,	%l5
loop_641:
	alignaddrl	%l5,	%l5,	%o6
	mulx	%o6,	%g7,	%o6
	fbue	%fcc3,	loop_642
	brlez	%o6,	loop_643
	sllx	%o6,	0x09,	%o6
	nop
	setx loop_644, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_642:
	taddcc	%o6,	%l2,	%o6
loop_643:
	fnot2	%f6,	%f0
	brgez	%o6,	loop_645
loop_644:
	tne	%xcc,	0x5
	fbue,a	%fcc2,	loop_646
	st	%f2,	[%l7 + 0x20]
loop_645:
	taddcctv	%o6,	%o6,	%o1
	movrlez	%o1,	%g4,	%o1
loop_646:
	ta	%icc,	0x4
	nop
	fmuld8ulx16	%f2,	%f15,	%f0
	fpsub32s	%f2,	%f2,	%f13
	udivcc	%o1,	0x1480,	%o1
	fpadd32s	%f13,	%f8,	%f5
	lduh	[%l7 + 0x36],	%o1
	stw	%o1,	[%l7 + 0x10]
	srlx	%o1,	%o7,	%o1
	movleu	%icc,	%l4,	%o1
	fmovspos	%icc,	%f10,	%f0
	orncc	%o1,	0x1297,	%o1
	ldsb	[%l7 + 0x6E],	%o1
	fmovsvs	%xcc,	%f4,	%f9
	fnegd	%f0,	%f10
	fbe	%fcc0,	loop_647
	array8	%o1,	%i7,	%o1
	ldsb	[%l7 + 0x0C],	%o1
	ld	[%l7 + 0x4C],	%f3
loop_647:
	stb	%o1,	[%l7 + 0x53]
	fmul8x16au	%f9,	%f2,	%f10
	subc	%o1,	0x00FD,	%o1
	te	%xcc,	0x4
	nop
	mulscc	%o1,	0x1719,	%o1
	bshuffle	%f10,	%f6,	%f14
	bneg,a	%icc,	loop_648
	fmovrdlz	%o1,	%f0,	%f2
	tsubcctv	%o1,	%o1,	%i2
	st	%f9,	[%l7 + 0x30]
loop_648:
	andcc	%i2,	%i2,	%l0
	tvs	%xcc,	0x2
	move	%icc,	%l0,	%g1
	nop
	fnands	%f9,	%f6,	%f0
	or	%g1,	%g1,	%l6
	xor	%l6,	%l6,	%i3
	fandnot1	%f2,	%f4,	%f6
	stw	%i3,	[%l7 + 0x0C]
	nop
	ldub	[%l7 + 0x0B],	%i3
	addcc	%i3,	0x1A91,	%i3
	tne	%xcc,	0x1
	fmovsneg	%icc,	%f4,	%f6
	array16	%i3,	%i3,	%g6
	tleu	%xcc,	0x3
	udiv	%g6,	0x184A,	%g6
	srax	%g6,	%o3,	%g6
	bvc,a	%xcc,	loop_649
	fandnot1s	%f6,	%f4,	%f2
	alignaddr	%g6,	%l3,	%g6
	fmul8ulx16	%f6,	%f2,	%f14
loop_649:
	movrne	%g6,	%i4,	%g6
	nop
	sth	%g6,	[%l7 + 0x18]
	movg	%icc,	%o4,	%g6
	sllx	%g6,	0x05,	%g6
	fmuld8ulx16	%f2,	%f5,	%f0
	nop
	tle	%icc,	0x1
	nop
	sub	%g6,	0x172A,	%g6
	stx	%g6,	[%l7 + 0x50]
	stb	%g6,	[%l7 + 0x56]
	umul	%g6,	0x16A4,	%g6
	bg,a	loop_650
	tle	%icc,	0x4
	subc	%g6,	0x16B1,	%g6
	movneg	%icc,	%g6,	%i1
loop_650:
	ld	[%l7 + 0x74],	%f3
	tsubcc	%i1,	%g2,	%i1
	andcc	%i1,	0x0F86,	%i1
	xor	%i1,	%g3,	%i1
	nop
	tne	%icc,	0x2
	tl	%icc,	0x6
	ldsb	[%l7 + 0x4B],	%i1
	ta	%xcc,	0x0
	mova	%icc,	%i1,	%l1
	nop
	array8	%l1,	%o2,	%l1
	tne	%icc,	0x1
	sllx	%l1,	0x07,	%l1
	movpos	%icc,	%l1,	%g5
	movneg	%xcc,	%i6,	%g5
	ldx	[%l7 + 0x50],	%g5
	brgz	%g5,	loop_651
	nop
	movneg	%icc,	%i5,	%g5
	udiv	%g5,	0x0595,	%g5
loop_651:
	sdivx	%g5,	0x012C,	%g5
	ldx	[%l7 + 0x70],	%g5
	fpadd16s	%f2,	%f15,	%f15
	nop
	fbo	%fcc1,	loop_652
	fbe,a	%fcc3,	loop_653
	brgz	%g5,	loop_654
	nop
loop_652:
	addc	%g5,	%o0,	%g5
loop_653:
	movvc	%xcc,	%i0,	%g5
loop_654:
	movcs	%xcc,	%o5,	%g5
	mova	%icc,	%g5,	%l5
	ld	[%l7 + 0x5C],	%f0
	ldub	[%l7 + 0x52],	%l5
	brz	%l5,	loop_655
	fbul	%fcc1,	loop_656
	xnor	%l5,	%l5,	%g7
	fmovdvs	%icc,	%f7,	%f15
loop_655:
	movrlz	%g7,	%g7,	%l2
loop_656:
	array8	%l2,	%l2,	%o6
	srax	%o6,	0x07,	%o6
	siam	0x0
	fbe,a	%fcc1,	loop_657
	ld	[%l7 + 0x30],	%f3
	ld	[%l7 + 0x68],	%f7
	tge	%icc,	0x2
loop_657:
	tleu	%xcc,	0x2
	fblg	%fcc2,	loop_658
	lduh	[%l7 + 0x12],	%o6
	sub	%o6,	%g4,	%o6
	ldsw	[%l7 + 0x34],	%o6
loop_658:
	umul	%o6,	0x17B4,	%o6
	fbu,a	%fcc2,	loop_659
	orncc	%o6,	0x043F,	%o6
	movle	%icc,	%o6,	%o7
	array32	%o7,	%o7,	%l4
loop_659:
	udiv	%l4,	0x1B7B,	%l4
	nop
	movcc	%icc,	%i7,	%l4
	orn	%l4,	%l4,	%o1
	movrne	%o1,	%i2,	%o1
	movrgz	%o1,	0x069,	%o1
	udivcc	%o1,	0x1696,	%o1
	tl	%xcc,	0x2
	fcmpes	%fcc0,	%f5,	%f8
	movre	%o1,	%l0,	%o1
	be,a	%xcc,	loop_660
	fornot2	%f0,	%f8,	%f4
	nop
	setx loop_661, %l0, %l1
	jmpl %l1, %o1
	movrne	%o1,	%o1,	%g1
loop_660:
	subc	%g1,	%l6,	%g1
	std	%f4,	[%l7 + 0x40]
loop_661:
	ld	[%l7 + 0x34],	%f0
	stb	%g1,	[%l7 + 0x1C]
	nop
	setx loop_662, %l0, %l1
	jmpl %l1, %g1
	addccc	%g1,	0x047A,	%g1
	fbul	%fcc3,	loop_663
	fmovdl	%icc,	%f9,	%f8
loop_662:
	tge	%xcc,	0x1
	fmovsvc	%icc,	%f3,	%f3
loop_663:
	ldx	[%l7 + 0x58],	%g1
	fmovdle	%xcc,	%f12,	%f3
	movg	%icc,	%i3,	%g1
	fbe	%fcc2,	loop_664
	fmovsleu	%xcc,	%f14,	%f0
	movneg	%icc,	%g1,	%o3
	ldub	[%l7 + 0x5C],	%o3
loop_664:
	andncc	%o3,	%l3,	%o3
	fbul,a	%fcc0,	loop_665
	sdivx	%o3,	0x0E81,	%o3
	srlx	%o3,	%o3,	%i4
	movrlz	%i4,	0x3AD,	%i4
loop_665:
	xorcc	%i4,	%i4,	%o4
	nop
	nop
	orcc	%o4,	%o4,	%g6
	movre	%g6,	0x1C0,	%g6
	tg	%xcc,	0x3
	ldd	[%l7 + 0x28],	%f6
	tge	%xcc,	0x2
	umul	%g6,	0x0374,	%g6
	fornot2	%f4,	%f4,	%f0
	st	%f0,	[%l7 + 0x10]
	nop
	mulscc	%g6,	%g6,	%g2
	nop
	andcc	%g2,	0x1E29,	%g2
	mova	%xcc,	%g2,	%g3
	movl	%xcc,	%g3,	%i1
	fnors	%f0,	%f2,	%f14
	lduw	[%l7 + 0x24],	%i1
	fmovsleu	%xcc,	%f11,	%f12
	nop
	xorcc	%i1,	0x16B4,	%i1
	tpos	%xcc,	0x1
	udivcc	%i1,	0x0F17,	%i1
	bleu	%xcc,	loop_666
	movre	%i1,	0x30F,	%i1
	movcc	%xcc,	%i1,	%o2
	fnor	%f0,	%f2,	%f14
loop_666:
	fbge	%fcc2,	loop_667
	fbn	%fcc2,	loop_668
	fcmpne32	%f14,	%f14,	%o2
	addcc	%o2,	%l1,	%o2
loop_667:
	fcmpne16	%f14,	%f2,	%o2
loop_668:
	array8	%o2,	%i6,	%o2
	fmuld8sux16	%f12,	%f2,	%f14
	orn	%o2,	%o2,	%i5
	fmovda	%icc,	%f6,	%f2
	nop
	mulscc	%i5,	0x17F3,	%i5
	nop
	udiv	%i5,	0x167E,	%i5
	sdiv	%i5,	0x1A0F,	%i5
	fsrc2	%f14,	%f6
	fmuld8ulx16	%f2,	%f14,	%f2
	fandnot2	%f2,	%f10,	%f12
	bcs	%xcc,	loop_669
	tsubcctv	%i5,	0x1C45,	%i5
	mulscc	%i5,	0x0D73,	%i5
	tsubcc	%i5,	0x17C0,	%i5
loop_669:
	andcc	%i5,	0x00D8,	%i5
	nop
	setx loop_670, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	alignaddr	%i5,	%i5,	%o0
	nop
	fmovdn	%icc,	%f9,	%f0
loop_670:
	nop
	smul	%o0,	%o0,	%i0
	movre	%i0,	%i0,	%o5
	fbule,a	%fcc0,	loop_671
	nop
	fmovrdne	%o5,	%f0,	%f12
	ta	%xcc,	0x6
loop_671:
	fmovsn	%icc,	%f6,	%f0
	xorcc	%o5,	%o5,	%g5
	bvc	%icc,	loop_672
	sth	%g5,	[%l7 + 0x58]
	nop
	bne,a	loop_673
loop_672:
	brz	%g5,	loop_674
	tge	%icc,	0x6
	ldd	[%l7 + 0x08],	%f2
loop_673:
	fmovsge	%xcc,	%f14,	%f4
loop_674:
	ldsb	[%l7 + 0x6A],	%g5
	tvc	%xcc,	0x3
	tvs	%icc,	0x5
	movcs	%icc,	%l5,	%g5
	subc	%g5,	%g5,	%g7
	sll	%g7,	%l2,	%g7
	stw	%g7,	[%l7 + 0x54]
	fcmps	%fcc2,	%f2,	%f14
	movre	%g7,	%g4,	%g7
	movg	%xcc,	%o6,	%g7
	movvc	%icc,	%g7,	%o7
	movvs	%icc,	%i7,	%o7
	movgu	%icc,	%o7,	%l4
	tcs	%xcc,	0x7
	sdivcc	%l4,	0x119F,	%l4
	brz,a	%l4,	loop_675
	stx	%l4,	[%l7 + 0x40]
	fornot1	%f12,	%f14,	%f12
	tleu	%xcc,	0x2
loop_675:
	tneg	%xcc,	0x5
	fmovdge	%icc,	%f7,	%f15
	faligndata	%f12,	%f0,	%f14
	fxnor	%f14,	%f14,	%f10
	tneg	%icc,	0x1
	xor	%l4,	0x027B,	%l4
	ldub	[%l7 + 0x61],	%l4
	fmovdleu	%icc,	%f15,	%f1
	udivcc	%l4,	0x1A58,	%l4
	nop
	tcc	%icc,	0x5
	fbul,a	%fcc3,	loop_676
	nop
	setx loop_677, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	bgu,a	loop_678
	taddcctv	%l4,	%l4,	%i2
loop_676:
	st	%f1,	[%l7 + 0x40]
loop_677:
	pdist	%f10,	%f6,	%f14
loop_678:
	tsubcctv	%i2,	%l0,	%i2
	bleu,a	loop_679
	orn	%i2,	%i2,	%o1
	fmovdvc	%icc,	%f2,	%f3
	sdivcc	%o1,	0x0219,	%o1
loop_679:
	tne	%icc,	0x7
	fmul8x16au	%f3,	%f2,	%f8
	sth	%o1,	[%l7 + 0x64]
	popc	%o1,	%o1
	move	%icc,	%o1,	%l6
	bvc,a,pt	%icc,	loop_680
	mulscc	%l6,	%l6,	%i3
	ble,pn	%xcc,	loop_681
	tpos	%icc,	0x1
loop_680:
	sth	%i3,	[%l7 + 0x70]
	nop
loop_681:
	xorcc	%i3,	%g1,	%i3
	xor	%i3,	0x1EA8,	%i3
	taddcc	%i3,	0x1BE3,	%i3
	subc	%i3,	%l3,	%i3
	andncc	%i3,	%i3,	%o3
	fba,a	%fcc1,	loop_682
	fmovsleu	%xcc,	%f3,	%f6
	tcc	%icc,	0x1
	andn	%o3,	%o3,	%i4
loop_682:
	fpack32	%f8,	%f10,	%f0
	sllx	%i4,	0x05,	%i4
	alignaddr	%i4,	%o4,	%i4
	fmovrde	%i4,	%f10,	%f6
	ldub	[%l7 + 0x69],	%i4
	tpos	%icc,	0x6
	fones	%f6
	ldsh	[%l7 + 0x36],	%i4
	fcmpeq32	%f6,	%f10,	%i4
	fnot2	%f6,	%f0
	mova	%icc,	%g6,	%i4
	fbn	%fcc2,	loop_683
	fcmps	%fcc2,	%f4,	%f14
	orncc	%i4,	%g2,	%i4
	umulcc	%i4,	0x0C00,	%i4
loop_683:
	ld	[%l7 + 0x18],	%f3
	brz	%i4,	loop_684
	st	%f14,	[%l7 + 0x14]
	add	%i4,	%i4,	%g3
	fsrc2	%f6,	%f0
loop_684:
	be,a	loop_685
	movle	%icc,	%g3,	%i1
	movcs	%icc,	%l1,	%i1
	fmovdn	%icc,	%f13,	%f8
loop_685:
	tge	%xcc,	0x5
	bpos,a,pn	%icc,	loop_686
	tge	%xcc,	0x3
	fmovsneg	%xcc,	%f13,	%f0
	ldsw	[%l7 + 0x34],	%i1
loop_686:
	fandnot2	%f6,	%f6,	%f6
	mova	%xcc,	%i1,	%i6
	array16	%i6,	%i6,	%o2
	fmovdgu	%icc,	%f3,	%f9
	andn	%o2,	0x014D,	%o2
	tgu	%xcc,	0x7
	xor	%o2,	0x007A,	%o2
	tneg	%icc,	0x5
	nop
	fxnor	%f6,	%f4,	%f10
	fmul8x16au	%f9,	%f6,	%f10
	movrgz	%o2,	%o2,	%i5
	movcs	%xcc,	%i5,	%o0
	addccc	%o0,	%o0,	%i0
	tcs	%xcc,	0x0
	tn	%icc,	0x7
	tvc	%xcc,	0x5
	fcmpeq16	%f10,	%f8,	%i0
	movrlz	%i0,	%i0,	%o5
	bne	loop_687
	movgu	%icc,	%l5,	%o5
	fmovrdgz	%o5,	%f4,	%f2
	fmovsge	%xcc,	%f6,	%f15
loop_687:
	tsubcctv	%o5,	%o5,	%g5
	fcmpne32	%f2,	%f6,	%g5
	andncc	%g5,	%g5,	%l2
	fmovscc	%xcc,	%f6,	%f0
	call	loop_688
	movre	%l2,	%l2,	%g4
	ldsb	[%l7 + 0x29],	%g4
	subcc	%g4,	%g4,	%o6
loop_688:
	ld	[%l7 + 0x6C],	%f7
	fmovd	%f2,	%f8
	srl	%o6,	%g7,	%o6
	fmovrdgz	%o6,	%f10,	%f0
	xnorcc	%o6,	0x115A,	%o6
	fpack16	%f0,	%f0
	ldsb	[%l7 + 0x46],	%o6
	ldsw	[%l7 + 0x5C],	%o6
	stx	%o6,	[%l7 + 0x38]
	alignaddrl	%o6,	%o6,	%i7
	nop
	std	%f0,	[%l7 + 0x28]
	movneg	%xcc,	%o7,	%i7
	taddcctv	%i7,	%i7,	%l4
	lduw	[%l7 + 0x78],	%l4
	udiv	%l4,	0x0E96,	%l4
	lduh	[%l7 + 0x20],	%l4
	fbe	%fcc2,	loop_689
	tgu	%icc,	0x6
	sllx	%l4,	0x06,	%l4
	for	%f0,	%f4,	%f6
loop_689:
	ld	[%l7 + 0x6C],	%f6
	alignaddrl	%l4,	%l0,	%l4
	fnors	%f0,	%f14,	%f2
	bg,a,pn	%icc,	loop_690
	fmovscc	%icc,	%f7,	%f2
	tsubcc	%l4,	0x0DAE,	%l4
	fxors	%f2,	%f15,	%f0
loop_690:
	andn	%l4,	%l4,	%i2
	udiv	%i2,	0x1606,	%i2
	fones	%f0
	stw	%i2,	[%l7 + 0x2C]
	addccc	%i2,	%o1,	%i2
	brlez,a	%i2,	loop_691
	fpadd16s	%f0,	%f3,	%f8
	or	%i2,	%i2,	%l6
	ldub	[%l7 + 0x28],	%l6
loop_691:
	fmovrdlz	%l6,	%f14,	%f10
	fcmpgt32	%f10,	%f8,	%l6
	fmovdge	%xcc,	%f10,	%f9
	tpos	%xcc,	0x6
	fba	%fcc0,	loop_692
	sdiv	%l6,	0x0AAD,	%l6
	brgz	%l6,	loop_693
	nop
loop_692:
	fone	%f10
	move	%icc,	%g1,	%l6
loop_693:
	tpos	%icc,	0x1
	nop
	movle	%xcc,	%l3,	%l6
	movrgz	%l6,	0x323,	%l6
	movleu	%icc,	%i3,	%l6
	movg	%icc,	%l6,	%o3
	sethi	0x1771,	%o3
	movpos	%icc,	%o4,	%o3
	nop
	fpmerge	%f9,	%f5,	%f4
	nop
	bl,pt	%icc,	loop_694
	std	%f4,	[%l7 + 0x50]
	stx	%o3,	[%l7 + 0x50]
	movg	%icc,	%o3,	%g6
loop_694:
	andcc	%g6,	%g2,	%g6
	std	%f4,	[%l7 + 0x78]
	srl	%g6,	%i4,	%g6
	movle	%xcc,	%g6,	%g3
	movneg	%icc,	%l1,	%g3
	taddcctv	%g3,	%i1,	%g3
	movrlz	%g3,	0x2D9,	%g3
	sdivx	%g3,	0x1808,	%g3
	tge	%xcc,	0x2
	xor	%g3,	%i6,	%g3
	movrgz	%g3,	%g3,	%o2
	tvc	%icc,	0x7
	nop
	tg	%xcc,	0x4
	addcc	%o2,	%i5,	%o2
	tneg	%xcc,	0x2
	addc	%o2,	0x124B,	%o2
	nop
	orncc	%o2,	0x1032,	%o2
	stx	%o2,	[%l7 + 0x10]
	fmuld8sux16	%f9,	%f14,	%f8
	fmovdne	%icc,	%f6,	%f10
	movre	%o2,	%o0,	%o2
	udivcc	%o2,	0x18C1,	%o2
	tleu	%xcc,	0x7
	nop
	alignaddr	%o2,	%i0,	%o2
	fpadd16s	%f10,	%f8,	%f5
	fmovs	%f5,	%f10
	nop
	fmovdcs	%icc,	%f11,	%f8
	tg	%icc,	0x6
	andcc	%o2,	0x1120,	%o2
	sll	%o2,	0x12,	%o2
	movleu	%icc,	%o2,	%l5
	or	%l5,	%l5,	%o5
	brz	%o5,	loop_695
	tcc	%icc,	0x6
	alignaddr	%o5,	%o5,	%g5
	udiv	%g5,	0x0D39,	%g5
loop_695:
	popc	0x0CDB,	%g5
	fmovdleu	%icc,	%f0,	%f10
	subccc	%g5,	%g5,	%l2
	addc	%l2,	0x1D83,	%l2
	mulx	%l2,	0x0E73,	%l2
	bn,pn	%icc,	loop_696
	nop
	fbule,a	%fcc0,	loop_697
	sth	%l2,	[%l7 + 0x16]
loop_696:
	mulx	%l2,	0x0E23,	%l2
	fmovdn	%xcc,	%f8,	%f12
loop_697:
	fmovsle	%xcc,	%f3,	%f12
	tsubcc	%l2,	0x164F,	%l2
	tsubcctv	%l2,	0x1017,	%l2
	movn	%xcc,	%g4,	%l2
	fxnor	%f8,	%f4,	%f8
	st	%f12,	[%l7 + 0x24]
	std	%f8,	[%l7 + 0x20]
	movrgez	%l2,	%g7,	%l2
	fxnor	%f8,	%f12,	%f14
	bn	%xcc,	loop_698
	ba,a	loop_699
	movvs	%icc,	%o6,	%l2
	fzeros	%f12
loop_698:
	add	%l2,	%l2,	%o7
loop_699:
	orncc	%o7,	0x0ACF,	%o7
	sethi	0x11D4,	%o7
	smulcc	%o7,	0x1975,	%o7
	subccc	%o7,	%i7,	%o7
	fmuld8sux16	%f12,	%f12,	%f12
	tle	%xcc,	0x1
	for	%f12,	%f8,	%f8
	nop
	ldsw	[%l7 + 0x74],	%o7
	fcmpne32	%f8,	%f8,	%o7
	fabss	%f12,	%f9
	smul	%o7,	%o7,	%l0
	fmul8sux16	%f8,	%f2,	%f12
	udivcc	%l0,	0x0FE9,	%l0
	ldub	[%l7 + 0x69],	%l0
	movl	%icc,	%l4,	%l0
	fmovd	%f12,	%f8
	bcc,a	loop_700
	call	loop_701
	nop
	fmuld8ulx16	%f12,	%f10,	%f2
loop_700:
	ld	[%l7 + 0x7C],	%f4
loop_701:
	sth	%l0,	[%l7 + 0x52]
	sll	%l0,	0x14,	%l0
	nop
	ldsb	[%l7 + 0x56],	%l0
	alignaddrl	%l0,	%o1,	%l0
	ta	%icc,	0x1
	fmovrdgz	%l0,	%f4,	%f12
	fmovsle	%icc,	%f2,	%f6
	ldx	[%l7 + 0x48],	%l0
	brgz,a	%l0,	loop_702
	movcc	%xcc,	%l0,	%i2
	sethi	0x09BC,	%i2
	movl	%icc,	%g1,	%i2
loop_702:
	lduw	[%l7 + 0x0C],	%i2
	fzero	%f12
	movcs	%xcc,	%i2,	%l3
	ta	%icc,	0x7
	ldsw	[%l7 + 0x44],	%l3
	smulcc	%l3,	%l3,	%i3
	nop
	mova	%icc,	%i3,	%l6
	tneg	%icc,	0x6
	sdivx	%l6,	0x0708,	%l6
	and	%l6,	%o4,	%l6
	mova	%icc,	%l6,	%o3
	fands	%f6,	%f11,	%f15
	bvs	%icc,	loop_703
	movleu	%xcc,	%o3,	%g2
	tne	%icc,	0x5
	ldx	[%l7 + 0x70],	%g2
loop_703:
	andn	%g2,	0x1DEF,	%g2
	tsubcc	%g2,	%i4,	%g2
	fmovde	%xcc,	%f1,	%f13
	nop
	sth	%g2,	[%l7 + 0x60]
	tn	%xcc,	0x5
	fnot2s	%f13,	%f11
	ldsw	[%l7 + 0x20],	%g2
	sethi	0x16A8,	%g2
	sethi	0x1B2A,	%g2
	bshuffle	%f12,	%f2,	%f8
	tvs	%xcc,	0x7
	and	%g2,	%g2,	%g6
	ldd	[%l7 + 0x50],	%f2
	or	%g6,	%l1,	%g6
	movre	%g6,	%g6,	%i1
	srlx	%i1,	0x11,	%i1
	nop
	fbo,a	%fcc1,	loop_704
	movcs	%xcc,	%i1,	%i6
	andncc	%i6,	%g3,	%i6
	movn	%xcc,	%i6,	%i5
loop_704:
	subccc	%i5,	%i5,	%o0
	tneg	%xcc,	0x4
	add	%o0,	%i0,	%o0
	nop
	andn	%o0,	0x003A,	%o0
	andn	%o0,	0x0436,	%o0
	tneg	%icc,	0x6
	sub	%o0,	0x15BE,	%o0
	xnor	%o0,	0x1F22,	%o0
	fands	%f13,	%f12,	%f12
	andncc	%o0,	%o2,	%o0
	sth	%o0,	[%l7 + 0x26]
	tne	%icc,	0x6
	tleu	%xcc,	0x0
	orn	%o0,	0x1F01,	%o0
	tg	%xcc,	0x7
	mulx	%o0,	%o0,	%l5
	movvc	%xcc,	%l5,	%o5
	movrne	%o5,	%o5,	%g5
	sth	%g5,	[%l7 + 0x6C]
	udivcc	%g5,	0x1899,	%g5
	ldsb	[%l7 + 0x46],	%g5
	umulcc	%g5,	%g5,	%g4
	fnot2	%f8,	%f0
	movneg	%icc,	%g4,	%g7
	bge,pn	%icc,	loop_705
	fmovdneg	%icc,	%f1,	%f2
	xorcc	%g7,	%o6,	%g7
	nop
loop_705:
	movg	%xcc,	%g7,	%l2
	addcc	%l2,	%i7,	%l2
	movl	%icc,	%l2,	%o7
	sth	%o7,	[%l7 + 0x1E]
	fmovd	%f8,	%f14
	fornot2	%f8,	%f6,	%f8
	smul	%o7,	%o7,	%l4
	fbue,a	%fcc2,	loop_706
	xnorcc	%l4,	%l4,	%o1
	fmul8ulx16	%f8,	%f8,	%f4
	movrgez	%o1,	%l0,	%o1
loop_706:
	ldub	[%l7 + 0x68],	%o1
	tcs	%icc,	0x7
	fornot2	%f4,	%f6,	%f8
	fbe	%fcc2,	loop_707
	ldsh	[%l7 + 0x58],	%o1
	fmovrsne	%o1,	%f15,	%f1
	umul	%o1,	0x1966,	%o1
loop_707:
	brgez,a	%o1,	loop_708
	alignaddrl	%o1,	%g1,	%o1
	fbuge	%fcc2,	loop_709
	tn	%icc,	0x4
loop_708:
	tn	%xcc,	0x7
	andn	%o1,	0x1A54,	%o1
loop_709:
	smul	%o1,	%i2,	%o1
	bg,a	%xcc,	loop_710
	ld	[%l7 + 0x5C],	%f5
	fnand	%f8,	%f8,	%f10
	fmovsa	%xcc,	%f1,	%f13
loop_710:
	nop
	array32	%o1,	%o1,	%l3
	tpos	%xcc,	0x2
	movl	%icc,	%i3,	%l3
	fornot2	%f10,	%f10,	%f2
	nop
	ble,a	%xcc,	loop_711
	fblg,a	%fcc0,	loop_712
	fmovrslz	%l3,	%f8,	%f4
	srl	%l3,	0x0C,	%l3
loop_711:
	fxors	%f4,	%f0,	%f2
loop_712:
	xor	%l3,	%l3,	%o4
	ba	%icc,	loop_713
	nop
	taddcc	%o4,	%o4,	%l6
	fpsub16s	%f2,	%f3,	%f7
loop_713:
	bn,a	%icc,	loop_714
	nop
	setx loop_715, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	tcc	%icc,	0x4
	srlx	%l6,	%o3,	%l6
loop_714:
	subc	%l6,	0x124F,	%l6
loop_715:
	sethi	0x1A35,	%l6
	fmovdleu	%xcc,	%f7,	%f15
	fxors	%f15,	%f2,	%f13
	ble,a,pn	%icc,	loop_716
	nop
	fmuld8sux16	%f13,	%f13,	%f14
	movpos	%xcc,	%i4,	%l6
loop_716:
	ble,a	loop_717
	movneg	%icc,	%g2,	%l6
	tne	%xcc,	0x0
	sll	%l6,	%l6,	%l1
loop_717:
	ldsb	[%l7 + 0x5C],	%l1
	nop
	ldsh	[%l7 + 0x28],	%l1
	fpsub32	%f14,	%f8,	%f12
	ta	%icc,	0x4
	fbue,a	%fcc1,	loop_718
	std	%f12,	[%l7 + 0x50]
	nop
	lduw	[%l7 + 0x6C],	%l1
loop_718:
	sth	%l1,	[%l7 + 0x7C]
	taddcc	%l1,	0x1206,	%l1
	brgz	%l1,	loop_719
	udiv	%l1,	0x0341,	%l1
	ld	[%l7 + 0x44],	%f1
	fbl,a	%fcc1,	loop_720
loop_719:
	nop
	fmovsn	%xcc,	%f13,	%f0
	lduh	[%l7 + 0x30],	%l1
loop_720:
	tcc	%icc,	0x2
	array16	%l1,	%l1,	%g6
	sllx	%g6,	0x12,	%g6
	array32	%g6,	%g6,	%i1
	ba	%icc,	loop_721
	udivcc	%i1,	0x1726,	%i1
	lduw	[%l7 + 0x18],	%i1
	subccc	%i1,	0x01DD,	%i1
loop_721:
	udiv	%i1,	0x066B,	%i1
	addcc	%i1,	0x17C3,	%i1
	popc	0x02BF,	%i1
	sub	%i1,	0x0CAC,	%i1
	ldsw	[%l7 + 0x3C],	%i1
	alignaddr	%i1,	%i1,	%g3
	nop
	ta	%xcc,	0x1
	fbuge,a	%fcc2,	loop_722
	fmovdvs	%icc,	%f2,	%f11
	movn	%icc,	%i6,	%g3
	ldx	[%l7 + 0x50],	%g3
loop_722:
	mova	%icc,	%i5,	%g3
	nop
	alignaddrl	%g3,	%i0,	%g3
	fbge,a	%fcc1,	loop_723
	fba,a	%fcc2,	loop_724
	xnorcc	%g3,	0x1820,	%g3
	fexpand	%f11,	%f0
loop_723:
	movrgz	%g3,	%g3,	%o2
loop_724:
	sth	%o2,	[%l7 + 0x2E]
	tl	%icc,	0x5
	tg	%xcc,	0x3
	tneg	%xcc,	0x1
	tne	%xcc,	0x6
	brlez,a	%o2,	loop_725
	fzeros	%f11
	fbuge	%fcc2,	loop_726
	fmovsvs	%xcc,	%f13,	%f3
loop_725:
	tg	%xcc,	0x3
	fmovspos	%xcc,	%f3,	%f8
loop_726:
	taddcc	%o2,	%o0,	%o2
	tgu	%icc,	0x2
	movn	%xcc,	%l5,	%o2
	nop
	andcc	%o2,	%o2,	%o5
	bleu,a,pn	%xcc,	loop_727
	bneg,pn	%xcc,	loop_728
	srl	%o5,	0x19,	%o5
	ldsw	[%l7 + 0x6C],	%o5
loop_727:
	bcc	loop_729
loop_728:
	fpadd32s	%f8,	%f0,	%f11
	xnor	%o5,	0x101A,	%o5
	tge	%xcc,	0x1
loop_729:
	fmovsleu	%icc,	%f5,	%f12
	movvc	%icc,	%o5,	%g5
	tsubcctv	%g5,	0x17EE,	%g5
	movgu	%xcc,	%g4,	%g5
	subcc	%g5,	%o6,	%g5
	fcmpne32	%f12,	%f6,	%g5
	and	%g5,	%g5,	%g7
	fmul8sux16	%f12,	%f10,	%f8
	ld	[%l7 + 0x14],	%f0
	array16	%g7,	%g7,	%i7
	movrlez	%i7,	%i7,	%l2
	tne	%xcc,	0x0
	stx	%l2,	[%l7 + 0x28]
	or	%l2,	0x0F5F,	%l2
	lduh	[%l7 + 0x42],	%l2
	andcc	%l2,	%o7,	%l2
	ldd	[%l7 + 0x48],	%f2
	alignaddr	%l2,	%l2,	%l4
	udivx	%l4,	0x1D3C,	%l4
	fnot2	%f8,	%f10
	be,pt	%xcc,	loop_730
	tne	%xcc,	0x1
	movrgez	%l4,	%l4,	%l0
	sll	%l0,	0x1E,	%l0
loop_730:
	sdivcc	%l0,	0x19EC,	%l0
	subcc	%l0,	%l0,	%g1
	stw	%g1,	[%l7 + 0x1C]
	sth	%g1,	[%l7 + 0x36]
	fmovdge	%icc,	%f4,	%f8
	umulcc	%g1,	0x183F,	%g1
	fandnot1s	%f8,	%f14,	%f9
	brlz,a	%g1,	loop_731
	movvs	%icc,	%i2,	%g1
	fmovrsne	%g1,	%f13,	%f7
	fzero	%f8
loop_731:
	srl	%g1,	0x17,	%g1
	movrne	%g1,	%o1,	%g1
	fmovrslez	%g1,	%f8,	%f11
	ldx	[%l7 + 0x70],	%g1
	nop
	tsubcc	%g1,	%g1,	%i3
	fcmpgt16	%f8,	%f8,	%i3
	xor	%i3,	0x00AB,	%i3
	tpos	%xcc,	0x5
	movleu	%icc,	%l3,	%i3
	tsubcc	%i3,	%o4,	%i3
	nop
	setx loop_732, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	movrlez	%i3,	%i3,	%o3
	fmovse	%xcc,	%f5,	%f8
	bshuffle	%f8,	%f10,	%f14
loop_732:
	siam	0x1
	nop
	tpos	%xcc,	0x0
	taddcctv	%o3,	0x0F54,	%o3
	movcc	%icc,	%o3,	%i4
	movl	%xcc,	%g2,	%i4
	xnorcc	%i4,	0x07F7,	%i4
	nop
	movgu	%xcc,	%i4,	%l6
	tsubcc	%l6,	%l6,	%l1
	xnorcc	%l1,	%g6,	%l1
	fmul8x16al	%f8,	%f3,	%f2
	fmovsge	%icc,	%f3,	%f11
	fnegd	%f2,	%f12
	ldx	[%l7 + 0x38],	%l1
	movl	%icc,	%l1,	%i1
	sdivx	%i1,	0x0357,	%i1
	ta	%xcc,	0x4
	pdist	%f2,	%f14,	%f0
	brgz,a	%i1,	loop_733
	sllx	%i1,	0x19,	%i1
	movpos	%xcc,	%i1,	%i6
	nop
loop_733:
	st	%f11,	[%l7 + 0x6C]
	xnor	%i6,	0x0ACC,	%i6
	ldsh	[%l7 + 0x34],	%i6
	sllx	%i6,	0x19,	%i6
	movrgez	%i6,	0x3A7,	%i6
	smulcc	%i6,	%i6,	%i5
	std	%f0,	[%l7 + 0x40]
	stb	%i5,	[%l7 + 0x0A]
	sllx	%i5,	%i5,	%i0
	alignaddrl	%i0,	%g3,	%i0
	ldx	[%l7 + 0x48],	%i0
	movcs	%icc,	%i0,	%o0
	move	%icc,	%l5,	%o0
	udivx	%o0,	0x0420,	%o0
	ldx	[%l7 + 0x68],	%o0
	nop
	nop
	brz,a	%o0,	loop_734
	addc	%o0,	0x094A,	%o0
	udiv	%o0,	0x1646,	%o0
	movvs	%xcc,	%o0,	%o2
loop_734:
	sdiv	%o2,	0x0A66,	%o2
	movrlez	%o2,	0x038,	%o2
	tge	%icc,	0x7
	sra	%o2,	0x01,	%o2
	xnor	%o2,	%o2,	%o5
	bshuffle	%f0,	%f12,	%f4
	nop
	setx loop_735, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	tvc	%icc,	0x0
	movge	%xcc,	%o5,	%g4
	fmovsle	%icc,	%f3,	%f15
loop_735:
	srl	%g4,	%g4,	%o6
	fnot2	%f4,	%f10
	brgez,a	%o6,	loop_736
	tpos	%icc,	0x3
	fandnot2s	%f15,	%f3,	%f15
	lduh	[%l7 + 0x5C],	%o6
loop_736:
	nop
	fcmpne16	%f4,	%f4,	%o6
	tge	%xcc,	0x2
	subccc	%o6,	0x1785,	%o6
	orncc	%o6,	0x0C13,	%o6
	st	%f15,	[%l7 + 0x0C]
	smulcc	%o6,	0x1265,	%o6
	nop
	tgu	%xcc,	0x2
	nop
	movneg	%xcc,	%g5,	%o6
	subc	%o6,	0x14F1,	%o6
	bn,a	loop_737
	tl	%xcc,	0x2
	movrne	%o6,	0x2BA,	%o6
	te	%xcc,	0x6
loop_737:
	array16	%o6,	%g7,	%o6
	or	%o6,	0x0FA0,	%o6
	nop
	fmovdge	%icc,	%f6,	%f12
	orcc	%o6,	0x0C53,	%o6
	tvs	%xcc,	0x3
	nop
	fmovrsne	%o6,	%f10,	%f10
	udivx	%o6,	0x1C1B,	%o6
	fblg,a	%fcc2,	loop_738
	nop
	fmovdge	%icc,	%f11,	%f11
	tleu	%xcc,	0x6
loop_738:
	tsubcctv	%o6,	%i7,	%o6
	udiv	%o6,	0x0D97,	%o6
	fbn	%fcc3,	loop_739
	add	%o6,	0x0F2B,	%o6
	sub	%o6,	%o7,	%o6
	tcs	%xcc,	0x3
loop_739:
	fnand	%f4,	%f0,	%f0
	lduh	[%l7 + 0x10],	%o6
	stx	%o6,	[%l7 + 0x70]
	fmovsa	%xcc,	%f5,	%f11
	andncc	%o6,	%o6,	%l2
	bcc,pn	%xcc,	loop_740
	xorcc	%l2,	0x08AC,	%l2
	orncc	%l2,	%l2,	%l4
	xnorcc	%l4,	0x1FFA,	%l4
loop_740:
	mulscc	%l4,	%l0,	%l4
	movle	%xcc,	%l4,	%i2
	smulcc	%i2,	0x14FF,	%i2
	fpsub16	%f0,	%f8,	%f8
	bvc	%icc,	loop_741
	fmovsneg	%xcc,	%f15,	%f13
	movcs	%xcc,	%o1,	%i2
	tcc	%xcc,	0x0
loop_741:
	stw	%i2,	[%l7 + 0x14]
	stx	%i2,	[%l7 + 0x60]
	xorcc	%i2,	%i2,	%g1
	movrne	%g1,	0x29C,	%g1
	srlx	%g1,	0x02,	%g1
	nop
	fpsub16	%f8,	%f10,	%f14
	tne	%icc,	0x3
	bneg,pt	%xcc,	loop_742
	sdivcc	%g1,	0x1BED,	%g1
	or	%g1,	0x0E0D,	%g1
	brz,a	%g1,	loop_743
loop_742:
	movvc	%xcc,	%g1,	%l3
	nop
	ldsh	[%l7 + 0x20],	%l3
loop_743:
	stx	%l3,	[%l7 + 0x30]
	nop
	tn	%icc,	0x4
	udivx	%l3,	0x117A,	%l3
	tsubcc	%l3,	%l3,	%o4
	fabsd	%f14,	%f10
	std	%f14,	[%l7 + 0x60]
	addc	%o4,	%i3,	%o4
	xnorcc	%o4,	0x1898,	%o4
	sethi	0x1CED,	%o4
	smulcc	%o4,	%o3,	%o4
	tleu	%xcc,	0x4
	ldsb	[%l7 + 0x3F],	%o4
	tg	%xcc,	0x5
	xorcc	%o4,	0x18E3,	%o4
	addcc	%o4,	0x0B3D,	%o4
	ldsw	[%l7 + 0x2C],	%o4
	movre	%o4,	0x29F,	%o4
	alignaddrl	%o4,	%g2,	%o4
	fmovd	%f14,	%f10
	and	%o4,	0x171E,	%o4
	ldsw	[%l7 + 0x40],	%o4
	be	%xcc,	loop_744
	array16	%o4,	%o4,	%i4
	fmovscs	%xcc,	%f6,	%f4
	movrlez	%i4,	0x2F8,	%i4
loop_744:
	andncc	%i4,	%l6,	%i4
	tgu	%icc,	0x1
	movpos	%icc,	%i4,	%g6
	fcmpes	%fcc3,	%f2,	%f12
	bcs,a	loop_745
	fbg,a	%fcc3,	loop_746
	bcc	loop_747
	udivx	%g6,	0x0A04,	%g6
loop_745:
	fmovdneg	%xcc,	%f0,	%f1
loop_746:
	sdivx	%g6,	0x17A5,	%g6
loop_747:
	fmovdne	%xcc,	%f3,	%f1
	fmovscc	%xcc,	%f4,	%f11
	std	%f14,	[%l7 + 0x20]
	brnz	%g6,	loop_748
	fmovdn	%xcc,	%f15,	%f10
	movneg	%icc,	%l1,	%g6
	andn	%g6,	%g6,	%i1
loop_748:
	movl	%icc,	%i6,	%i1
	subcc	%i1,	%i5,	%i1
	tvs	%icc,	0x6
	tsubcctv	%i1,	0x144D,	%i1
	movle	%icc,	%g3,	%i1
	stx	%i1,	[%l7 + 0x38]
	fmovrsgz	%i1,	%f4,	%f12
	brnz	%i1,	loop_749
	srl	%i1,	%i0,	%i1
	fcmpd	%fcc0,	%f14,	%f10
	stx	%i1,	[%l7 + 0x48]
loop_749:
	ldub	[%l7 + 0x23],	%i1
	bcs,pn	%icc,	loop_750
	smulcc	%i1,	%l5,	%i1
	bneg,a	loop_751
	movre	%i1,	0x391,	%i1
loop_750:
	alignaddrl	%i1,	%o0,	%i1
	andn	%i1,	0x0C32,	%i1
loop_751:
	alignaddr	%i1,	%o2,	%i1
	srlx	%i1,	0x10,	%i1
	fmovrslez	%i1,	%f1,	%f5
	fmovsleu	%icc,	%f9,	%f1
	ldd	[%l7 + 0x68],	%f10
	movge	%xcc,	%i1,	%o5
	bvc,pt	%icc,	loop_752
	movl	%icc,	%g4,	%o5
	fornot2s	%f1,	%f1,	%f11
	fmul8x16au	%f11,	%f3,	%f2
loop_752:
	sub	%o5,	%g5,	%o5
	fbug,a	%fcc2,	loop_753
	fone	%f2
	alignaddrl	%o5,	%g7,	%o5
	ldx	[%l7 + 0x38],	%o5
loop_753:
	nop
	fxors	%f11,	%f13,	%f6
	umul	%o5,	%i7,	%o5
	lduw	[%l7 + 0x40],	%o5
	mulx	%o5,	%o7,	%o5
	movle	%icc,	%o6,	%o5
	movn	%xcc,	%l2,	%o5
	siam	0x2
	tl	%icc,	0x3
	tle	%icc,	0x3
	fmovsne	%icc,	%f1,	%f9
	xorcc	%o5,	%l0,	%o5
	or	%o5,	0x156E,	%o5
	andncc	%o5,	%l4,	%o5
	sdiv	%o5,	0x1023,	%o5
	movcc	%xcc,	%o1,	%o5
	fmovsle	%icc,	%f1,	%f8
	umul	%o5,	0x0312,	%o5
	std	%f2,	[%l7 + 0x50]
	brz,a	%o5,	loop_754
	bcs,a	loop_755
	nop
	ba,a,pt	%xcc,	loop_756
loop_754:
	smul	%o5,	%o5,	%i2
loop_755:
	nop
	ldd	[%l7 + 0x68],	%f12
loop_756:
	ta	%xcc,	0x6
	movgu	%xcc,	%g1,	%i2
	udivx	%i2,	0x020F,	%i2
	ldsb	[%l7 + 0x1C],	%i2
	udivcc	%i2,	0x09EF,	%i2
	brlez,a	%i2,	loop_757
	te	%icc,	0x0
	tsubcc	%i2,	0x12AD,	%i2
	movn	%xcc,	%l3,	%i2
loop_757:
	mulx	%i2,	%i2,	%i3
	bge	%icc,	loop_758
	movcc	%icc,	%i3,	%o3
	ldsb	[%l7 + 0x51],	%o3
	sdiv	%o3,	0x117A,	%o3
loop_758:
	fabsd	%f2,	%f2
	movpos	%xcc,	%o3,	%g2
	stw	%g2,	[%l7 + 0x54]
	fmovrsgz	%g2,	%f9,	%f12
	ldsh	[%l7 + 0x1A],	%g2
	stb	%g2,	[%l7 + 0x08]
	fabss	%f12,	%f3
	sra	%g2,	0x04,	%g2
	bcc,a,pn	%xcc,	loop_759
	ldd	[%l7 + 0x10],	%f12
	tvc	%icc,	0x3
	tgu	%icc,	0x6
loop_759:
	and	%g2,	%g2,	%o4
	fones	%f12
	pdist	%f2,	%f14,	%f4
	movge	%icc,	%o4,	%l6
	nop
	fxnors	%f12,	%f0,	%f8
	stw	%l6,	[%l7 + 0x14]
	sllx	%l6,	%i4,	%l6
	ld	[%l7 + 0x58],	%f13
	stx	%l6,	[%l7 + 0x38]
	alignaddr	%l6,	%l6,	%l1
	subccc	%l1,	0x0101,	%l1
	xorcc	%l1,	%l1,	%g6
	sth	%g6,	[%l7 + 0x26]
	movrne	%g6,	0x0A4,	%g6
	mova	%icc,	%g6,	%i6
	ldd	[%l7 + 0x68],	%f14
	tleu	%icc,	0x1
	sth	%i6,	[%l7 + 0x12]
	xnorcc	%i6,	0x19AF,	%i6
	bneg,a,pn	%xcc,	loop_760
	tpos	%xcc,	0x6
	tn	%icc,	0x7
	tvs	%icc,	0x4
loop_760:
	nop
	array8	%i6,	%i6,	%i5
	std	%f4,	[%l7 + 0x28]
	fmovda	%icc,	%f1,	%f5
	sllx	%i5,	%i5,	%g3
	bge	%icc,	loop_761
	fmovrsne	%g3,	%f9,	%f15
	movrgz	%g3,	0x250,	%g3
	addccc	%g3,	%i0,	%g3
loop_761:
	move	%xcc,	%l5,	%g3
	addc	%g3,	0x1ED7,	%g3
	fmovsl	%icc,	%f15,	%f7
	addc	%g3,	0x1640,	%g3
	fpadd16	%f4,	%f10,	%f12
	and	%g3,	%o0,	%g3
	xnorcc	%g3,	%o2,	%g3
	brz,a	%g3,	loop_762
	fmovsneg	%icc,	%f1,	%f7
	fmul8sux16	%f12,	%f8,	%f14
	udivcc	%g3,	0x0E41,	%g3
loop_762:
	orcc	%g3,	0x0E07,	%g3
	ldub	[%l7 + 0x0F],	%g3
	nop
	tvc	%icc,	0x0
	tn	%icc,	0x4
	srax	%g3,	0x19,	%g3
	fbule	%fcc0,	loop_763
	fbl	%fcc1,	loop_764
	tge	%xcc,	0x2
	std	%f14,	[%l7 + 0x08]
loop_763:
	bgu,a,pt	%icc,	loop_765
loop_764:
	sth	%g3,	[%l7 + 0x42]
	fmovsn	%xcc,	%f11,	%f7
	or	%g3,	0x1D2F,	%g3
loop_765:
	nop
	taddcc	%g3,	%i1,	%g3
	tpos	%icc,	0x0
	movge	%xcc,	%g4,	%g3
	ldsw	[%l7 + 0x1C],	%g3
	fmovscs	%xcc,	%f12,	%f4
	smul	%g3,	%g5,	%g3
	te	%icc,	0x4
	nop
	sll	%g3,	%g3,	%g7
	or	%g7,	%i7,	%g7
	xor	%g7,	%g7,	%o7
	sdivcc	%o7,	0x104C,	%o7
	nop
	brgz,a	%o7,	loop_766
	orncc	%o7,	0x13EC,	%o7
	bl,a	%xcc,	loop_767
	fpsub32s	%f4,	%f2,	%f6
loop_766:
	fbuge	%fcc1,	loop_768
	fnot2	%f14,	%f6
loop_767:
	nop
	xorcc	%o7,	0x1A7E,	%o7
loop_768:
	nop
	sdivx	%o7,	0x1FA6,	%o7
	lduw	[%l7 + 0x50],	%o7
	nop
	tsubcctv	%o7,	%o7,	%o6
	fcmple32	%f14,	%f6,	%o6
	stw	%o6,	[%l7 + 0x50]
	udiv	%o6,	0x0127,	%o6
	fmovsge	%xcc,	%f10,	%f0
	movrgz	%o6,	%o6,	%l2
	srax	%l2,	%l2,	%l0
	brgez,a	%l0,	loop_769
	fandnot1s	%f0,	%f14,	%f0
	bleu	loop_770
	fmovrdgz	%l0,	%f12,	%f6
loop_769:
	ld	[%l7 + 0x4C],	%f13
	fmovrdgz	%l0,	%f4,	%f6
loop_770:
	movn	%xcc,	%l4,	%l0
	movge	%icc,	%o1,	%l0
	fnands	%f0,	%f8,	%f3
	array16	%l0,	%o5,	%l0
	andn	%l0,	0x188D,	%l0
	sth	%l0,	[%l7 + 0x60]
	sllx	%l0,	%l0,	%g1
	srax	%g1,	0x18,	%g1
	nop
	smulcc	%g1,	0x126E,	%g1
	tvc	%xcc,	0x3
	nop
	sub	%g1,	%g1,	%l3
	fmovdneg	%icc,	%f10,	%f7
	ldd	[%l7 + 0x50],	%f0
	fbg,a	%fcc0,	loop_771
	orcc	%l3,	%l3,	%i2
	fblg,a	%fcc2,	loop_772
	movrlez	%i2,	0x123,	%i2
loop_771:
	addccc	%i2,	0x1750,	%i2
	xnor	%i2,	0x0A7F,	%i2
loop_772:
	faligndata	%f6,	%f12,	%f12
	lduh	[%l7 + 0x22],	%i2
	bge,a,pt	%xcc,	loop_773
	nop
	setx loop_774, %l0, %l1
	jmpl %l1, %i2
	subc	%i2,	%i2,	%i3
	nop
	setx loop_775, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_773:
	fbul	%fcc1,	loop_776
loop_774:
	ldsh	[%l7 + 0x3E],	%i3
	brgez	%i3,	loop_777
loop_775:
	andcc	%i3,	0x00E8,	%i3
loop_776:
	nop
	fsrc2s	%f7,	%f6
loop_777:
	fcmped	%fcc0,	%f4,	%f0
	srlx	%i3,	0x1B,	%i3
	fxors	%f7,	%f12,	%f10
	orn	%i3,	0x0518,	%i3
	stw	%i3,	[%l7 + 0x7C]
	movvc	%icc,	%i3,	%o3
	smulcc	%o3,	%o3,	%g2
	mulx	%g2,	0x126E,	%g2
	mulx	%g2,	0x1625,	%g2
	fsrc2s	%f10,	%f13
	umul	%g2,	0x0E47,	%g2
	sll	%g2,	0x07,	%g2
	xor	%g2,	%g2,	%o4
	std	%f0,	[%l7 + 0x18]
	lduh	[%l7 + 0x78],	%o4
	fbule,a	%fcc2,	loop_778
	nop
	setx loop_779, %l0, %l1
	jmpl %l1, %o4
	fzero	%f0
	fnot1	%f0,	%f12
loop_778:
	sllx	%o4,	0x03,	%o4
loop_779:
	movle	%xcc,	%i4,	%o4
	fnands	%f10,	%f2,	%f10
	nop
	srax	%o4,	%o4,	%l6
	fsrc1s	%f10,	%f8
	fmovdg	%icc,	%f7,	%f1
	mulx	%l6,	0x1742,	%l6
	ldsw	[%l7 + 0x54],	%l6
	be,a	%xcc,	loop_780
	ldx	[%l7 + 0x68],	%l6
	brlz,a	%l6,	loop_781
	movneg	%icc,	%l1,	%l6
loop_780:
	movcs	%xcc,	%g6,	%l6
	be,a	%icc,	loop_782
loop_781:
	umulcc	%l6,	0x1257,	%l6
	fors	%f1,	%f15,	%f10
	movrgez	%l6,	%l6,	%i6
loop_782:
	te	%icc,	0x2
	nop
	orncc	%i6,	%i6,	%i5
	fmul8sux16	%f0,	%f8,	%f14
	tsubcctv	%i5,	%i0,	%i5
	bshuffle	%f14,	%f0,	%f4
	tleu	%xcc,	0x4
	smulcc	%i5,	0x04AF,	%i5
	ta	%icc,	0x0
	tn	%xcc,	0x4
	ldsb	[%l7 + 0x41],	%i5
	bcc,pt	%xcc,	loop_783
	fmovrdgz	%i5,	%f6,	%f0
	ldsh	[%l7 + 0x50],	%i5
	tcs	%xcc,	0x4
loop_783:
	ldsw	[%l7 + 0x1C],	%i5
	fpadd32s	%f10,	%f7,	%f15
	subc	%i5,	0x1229,	%i5
	alignaddrl	%i5,	%i5,	%l5
	fbule	%fcc3,	loop_784
	fmovsl	%icc,	%f9,	%f14
	movre	%l5,	0x398,	%l5
	ldub	[%l7 + 0x56],	%l5
loop_784:
	subcc	%l5,	0x1F3D,	%l5
	movre	%l5,	0x01F,	%l5
	taddcc	%l5,	0x1196,	%l5
	fnot2	%f0,	%f14
	fmovscc	%xcc,	%f13,	%f13
	brgz	%l5,	loop_785
	sdivx	%l5,	0x1399,	%l5
	orcc	%l5,	%l5,	%o0
	brgz,a	%o0,	loop_786
loop_785:
	fmovrdlz	%o0,	%f8,	%f12
	fnot1s	%f13,	%f14
	array8	%o0,	%o2,	%o0
loop_786:
	alignaddrl	%o0,	%o0,	%i1
	sdiv	%i1,	0x0B21,	%i1
	srax	%i1,	0x10,	%i1
	array16	%i1,	%i1,	%g4
	udivx	%g4,	0x164E,	%g4
	fmovscs	%xcc,	%f11,	%f5
	subccc	%g4,	0x1A92,	%g4
	bl,pn	%icc,	loop_787
	movcc	%icc,	%g5,	%g4
	movle	%xcc,	%g4,	%g3
	fpack32	%f12,	%f2,	%f6
loop_787:
	tgu	%icc,	0x0
	taddcctv	%g3,	%g3,	%i7
	st	%f5,	[%l7 + 0x24]
	mulx	%i7,	0x0D9E,	%i7
	nop
	nop
	array16	%i7,	%i7,	%g7
	bne,pt	%xcc,	loop_788
	fcmple32	%f6,	%f6,	%g7
	fmovdpos	%icc,	%f12,	%f5
	andcc	%g7,	%o7,	%g7
loop_788:
	movleu	%icc,	%g7,	%o6
	smul	%o6,	0x0D09,	%o6
	xnor	%o6,	0x1BC8,	%o6
	stb	%o6,	[%l7 + 0x45]
	movl	%xcc,	%o6,	%l2
	brlz	%l2,	loop_789
	fnot2s	%f5,	%f5
	taddcctv	%l2,	0x1864,	%l2
	tl	%icc,	0x4
loop_789:
	fmovrdgz	%l2,	%f8,	%f12
	ld	[%l7 + 0x1C],	%f12
	ldub	[%l7 + 0x14],	%l2
	sth	%l2,	[%l7 + 0x5E]
	tsubcc	%l2,	0x053A,	%l2
	stb	%l2,	[%l7 + 0x3E]
	tcs	%xcc,	0x6
	ld	[%l7 + 0x54],	%f5
	subccc	%l2,	%l4,	%l2
	fpack32	%f12,	%f14,	%f6
	sll	%l2,	%o1,	%l2
	array16	%l2,	%l2,	%o5
	fmovrsgz	%o5,	%f8,	%f9
	orncc	%o5,	0x10DF,	%o5
	addcc	%o5,	%l0,	%o5
	movn	%icc,	%g1,	%o5
	nop
	udivcc	%o5,	0x03E9,	%o5
	tg	%xcc,	0x3
	std	%f6,	[%l7 + 0x48]
	lduh	[%l7 + 0x1C],	%o5
	sra	%o5,	0x0C,	%o5
	fbo,a	%fcc0,	loop_790
	xnorcc	%o5,	%o5,	%l3
	nop
	array8	%l3,	%l3,	%i2
loop_790:
	fmovdgu	%icc,	%f3,	%f14
	tle	%icc,	0x3
	movrgez	%i2,	0x181,	%i2
	fnot2s	%f14,	%f7
	fbu,a	%fcc1,	loop_791
	movvs	%xcc,	%i3,	%i2
	fandnot1	%f6,	%f14,	%f2
	andn	%i2,	%i2,	%o3
loop_791:
	movleu	%icc,	%g2,	%o3
	tvc	%xcc,	0x7
	alignaddrl	%o3,	%o3,	%i4
	tvc	%icc,	0x7
	fmul8sux16	%f2,	%f6,	%f0
	stw	%i4,	[%l7 + 0x10]
	movle	%xcc,	%i4,	%o4
	ldub	[%l7 + 0x46],	%o4
	std	%f0,	[%l7 + 0x30]
	mulx	%o4,	%o4,	%l1
	brlz,a	%l1,	loop_792
	movgu	%xcc,	%l1,	%g6
	stx	%g6,	[%l7 + 0x48]
	fpadd16s	%f14,	%f14,	%f2
loop_792:
	movvs	%icc,	%l6,	%g6
	fmovdn	%icc,	%f12,	%f1
	fmovdg	%icc,	%f11,	%f11
	fbne,a	%fcc3,	loop_793
	ldsw	[%l7 + 0x10],	%g6
	bvs	%xcc,	loop_794
	tl	%xcc,	0x3
loop_793:
	stb	%g6,	[%l7 + 0x27]
	movcc	%xcc,	%g6,	%i6
loop_794:
	fbu	%fcc0,	loop_795
	be,pt	%icc,	loop_796
	ta	%icc,	0x1
	ldub	[%l7 + 0x1E],	%i6
loop_795:
	movrgz	%i6,	%i6,	%i0
loop_796:
	fcmple16	%f0,	%f12,	%i0
	andcc	%i0,	0x185F,	%i0
	tg	%xcc,	0x2
	tneg	%icc,	0x5
	subc	%i0,	0x1879,	%i0
	addccc	%i0,	%i5,	%i0
	ta	%xcc,	0x5
	ldsh	[%l7 + 0x2C],	%i0
	tvc	%xcc,	0x3
	udivx	%i0,	0x0C1D,	%i0
	movleu	%icc,	%l5,	%i0
	fornot1s	%f11,	%f9,	%f5
	smulcc	%i0,	0x0B76,	%i0
	bcc,a	loop_797
	mova	%xcc,	%o2,	%i0
	movrgez	%i0,	%o0,	%i0
	orcc	%i0,	0x1F4B,	%i0
loop_797:
	smul	%i0,	0x17D1,	%i0
	fmovdleu	%icc,	%f8,	%f1
	ld	[%l7 + 0x50],	%f0
	movl	%icc,	%i1,	%i0
	fbul	%fcc3,	loop_798
	fxor	%f0,	%f6,	%f4
	movrlz	%i0,	%i0,	%g5
	fcmpgt32	%f4,	%f0,	%g5
loop_798:
	fmovspos	%xcc,	%f2,	%f0
	tle	%icc,	0x7
	udivcc	%g5,	0x0336,	%g5
	stx	%g5,	[%l7 + 0x08]
	tneg	%xcc,	0x1
	array16	%g5,	%g4,	%g5
	ldd	[%l7 + 0x48],	%f12
	andncc	%g5,	%g3,	%g5
	movpos	%xcc,	%g5,	%i7
	ta	%icc,	0x3
	tn	%icc,	0x5
	bleu,pt	%icc,	loop_799
	smul	%i7,	0x1398,	%i7
	movrgez	%i7,	%i7,	%o7
	xnorcc	%o7,	0x190C,	%o7
loop_799:
	popc	%o7,	%o7
	sll	%o7,	%g7,	%o7
	orcc	%o7,	0x144C,	%o7
	fsrc1s	%f0,	%f3
	stw	%o7,	[%l7 + 0x54]
	fcmpes	%fcc1,	%f6,	%f6
	umulcc	%o7,	0x06EC,	%o7
	lduh	[%l7 + 0x14],	%o7
	mulx	%o7,	0x1BD9,	%o7
	fmovdle	%xcc,	%f3,	%f2
	tn	%icc,	0x6
	fmovdge	%icc,	%f2,	%f15
	ble,a	loop_800
	array32	%o7,	%o6,	%o7
	te	%icc,	0x0
	fabsd	%f4,	%f8
loop_800:
	nop
	bn,a,pn	%icc,	loop_801
	tne	%xcc,	0x6
	sdivcc	%o7,	0x10F8,	%o7
	add	%o7,	0x1A84,	%o7
loop_801:
	lduh	[%l7 + 0x4C],	%o7
	fmovdleu	%icc,	%f8,	%f5
	nop
	fblg,a	%fcc2,	loop_802
	nop
	nop
	fmul8x16al	%f5,	%f10,	%f12
loop_802:
	nop
	sth	%o7,	[%l7 + 0x7A]
	movpos	%xcc,	%o7,	%l4
	te	%icc,	0x7
	or	%l4,	0x1DBC,	%l4
	fxnors	%f5,	%f3,	%f7
	alignaddrl	%l4,	%l4,	%o1
	orn	%o1,	0x1E7D,	%o1
	fmul8sux16	%f12,	%f12,	%f12
	movrgz	%o1,	0x369,	%o1
	mova	%icc,	%o1,	%l2
	mulx	%l2,	%l2,	%l0
	std	%f12,	[%l7 + 0x48]
	fmuld8ulx16	%f7,	%f5,	%f14
	taddcctv	%l0,	%l0,	%g1
	fmovd	%f14,	%f12
	fzeros	%f7
	tcs	%icc,	0x0
	bneg,pt	%xcc,	loop_803
	stx	%g1,	[%l7 + 0x18]
	tsubcctv	%g1,	%g1,	%o5
	sth	%o5,	[%l7 + 0x08]
loop_803:
	andcc	%o5,	%l3,	%o5
	fbn,a	%fcc1,	loop_804
	xor	%o5,	0x19B8,	%o5
	alignaddrl	%o5,	%i3,	%o5
	fornot1s	%f7,	%f0,	%f10
loop_804:
	tge	%icc,	0x7
	std	%f14,	[%l7 + 0x70]
	siam	0x5
	fbne,a	%fcc3,	loop_805
	ble	%xcc,	loop_806
	tn	%xcc,	0x7
	te	%icc,	0x2
loop_805:
	nop
loop_806:
	bl,a,pt	%xcc,	loop_807
	fmovrslez	%o5,	%f13,	%f8
	stb	%o5,	[%l7 + 0x23]
	ba,pn	%xcc,	loop_808
loop_807:
	fmovdleu	%xcc,	%f13,	%f4
	bne,pn	%xcc,	loop_809
	fones	%f4
loop_808:
	tvc	%icc,	0x6
	movrgz	%o5,	%o5,	%i2
loop_809:
	tleu	%xcc,	0x4
	stx	%i2,	[%l7 + 0x48]
	tgu	%icc,	0x7
	fmovsne	%xcc,	%f3,	%f10
	xnorcc	%i2,	0x17C2,	%i2
	fabsd	%f14,	%f2
	tge	%icc,	0x1
	fmovdl	%icc,	%f0,	%f1
	stb	%i2,	[%l7 + 0x31]
	fmovde	%icc,	%f10,	%f8
	ldsw	[%l7 + 0x2C],	%i2
	ta	%icc,	0x2
	fornot1	%f14,	%f6,	%f12
	fbu,a	%fcc0,	loop_810
	udiv	%i2,	0x03D7,	%i2
	fcmple32	%f12,	%f6,	%i2
	movge	%xcc,	%i2,	%g2
loop_810:
	tpos	%icc,	0x3
	movge	%xcc,	%g2,	%o3
	nop
	addc	%o3,	0x0AD1,	%o3
	ldsb	[%l7 + 0x24],	%o3
	nop
	sth	%o3,	[%l7 + 0x3C]
	or	%o3,	%o3,	%i4
	fbu,a	%fcc3,	loop_811
	sdivcc	%i4,	0x1747,	%i4
	ldsh	[%l7 + 0x54],	%i4
	andncc	%i4,	%i4,	%o4
loop_811:
	smulcc	%o4,	0x10D9,	%o4
	fbne,a	%fcc3,	loop_812
	mova	%icc,	%l1,	%o4
	ldsb	[%l7 + 0x50],	%o4
	sub	%o4,	%l6,	%o4
loop_812:
	fbl	%fcc2,	loop_813
	ldd	[%l7 + 0x78],	%f14
	movrlez	%o4,	%g6,	%o4
	tne	%xcc,	0x3
loop_813:
	lduw	[%l7 + 0x78],	%o4
	fmovdl	%icc,	%f2,	%f4
	sub	%o4,	0x0082,	%o4
	lduh	[%l7 + 0x12],	%o4
	ld	[%l7 + 0x6C],	%f6
	sllx	%o4,	%o4,	%i6
	nop
	tsubcctv	%i6,	%i6,	%i5
	ble,pt	%icc,	loop_814
	mulscc	%i5,	%l5,	%i5
	movrne	%i5,	0x142,	%i5
	fbuge	%fcc0,	loop_815
loop_814:
	movle	%xcc,	%o2,	%i5
	fpsub32	%f12,	%f6,	%f4
	movvs	%xcc,	%o0,	%i5
loop_815:
	tleu	%xcc,	0x3
	nop
	movcc	%icc,	%i5,	%i1
	fcmpne32	%f4,	%f4,	%i1
	brnz	%i1,	loop_816
	fmovsneg	%icc,	%f4,	%f13
	srl	%i1,	0x09,	%i1
	movre	%i1,	%i1,	%i0
loop_816:
	smul	%i0,	%g4,	%i0
	fabsd	%f4,	%f8
	movvc	%xcc,	%g3,	%i0
	fbuge	%fcc0,	loop_817
	brz	%i0,	loop_818
	move	%xcc,	%i0,	%g5
	std	%f4,	[%l7 + 0x28]
loop_817:
	mulx	%g5,	%g5,	%i7
loop_818:
	fandnot1s	%f13,	%f10,	%f7
	addccc	%i7,	0x10F4,	%i7
	umulcc	%i7,	0x0D05,	%i7
	fble,a	%fcc3,	loop_819
	and	%i7,	0x0AFA,	%i7
	addccc	%i7,	%i7,	%g7
	std	%f4,	[%l7 + 0x70]
loop_819:
	popc	0x080F,	%g7
	ldub	[%l7 + 0x1F],	%g7
	bneg,pt	%icc,	loop_820
	sdiv	%g7,	0x1710,	%g7
	fandnot1	%f4,	%f14,	%f10
	bl,a,pn	%xcc,	loop_821
loop_820:
	movvs	%xcc,	%o6,	%g7
	move	%icc,	%o7,	%g7
	nop
loop_821:
	movneg	%xcc,	%g7,	%l4
	movl	%xcc,	%o1,	%l4
	movcc	%xcc,	%l4,	%l2
	tleu	%xcc,	0x1
	fcmpeq32	%f10,	%f6,	%l2
	fba	%fcc2,	loop_822
	brlez	%l2,	loop_823
	sethi	0x0094,	%l2
	andn	%l2,	0x1D64,	%l2
loop_822:
	fbl,a	%fcc2,	loop_824
loop_823:
	tsubcctv	%l2,	0x0252,	%l2
	xnor	%l2,	0x102A,	%l2
	movgu	%xcc,	%l0,	%l2
loop_824:
	fcmple32	%f10,	%f4,	%l2
	udivx	%l2,	0x0E92,	%l2
	lduh	[%l7 + 0x10],	%l2
	addccc	%l2,	0x0DED,	%l2
	fcmpne32	%f10,	%f12,	%l2
	bcc,a,pn	%icc,	loop_825
	popc	0x0AA4,	%l2
	srax	%l2,	0x11,	%l2
	tge	%icc,	0x0
loop_825:
	udiv	%l2,	0x1773,	%l2
	std	%f10,	[%l7 + 0x48]
	fmovrsne	%l2,	%f3,	%f15
	ldsh	[%l7 + 0x22],	%l2
	and	%l2,	%l2,	%g1
	xorcc	%g1,	0x0AAA,	%g1
	addcc	%g1,	0x00EE,	%g1
	mulscc	%g1,	0x1FF7,	%g1
	srax	%g1,	0x02,	%g1
	xnor	%g1,	0x07CA,	%g1
	fmovdne	%xcc,	%f10,	%f12
	fone	%f10
	fpack16	%f10,	%f0
	udivcc	%g1,	0x14C1,	%g1
	add	%g1,	0x126B,	%g1
	fmovdvc	%icc,	%f11,	%f9
	andncc	%g1,	%g1,	%l3
	fandnot1	%f10,	%f0,	%f12
	subc	%l3,	%l3,	%i3
	ld	[%l7 + 0x30],	%f1
	alignaddr	%i3,	%i3,	%o5
	sethi	0x15C6,	%o5
	fmovsneg	%xcc,	%f9,	%f12
	movpos	%icc,	%i2,	%o5
	sdivx	%o5,	0x153C,	%o5
	fmovsl	%xcc,	%f1,	%f7
	movcs	%icc,	%g2,	%o5
	nop
	fmovse	%xcc,	%f3,	%f4
	udiv	%o5,	0x1898,	%o5
	fand	%f12,	%f14,	%f4
	ldub	[%l7 + 0x23],	%o5
	ld	[%l7 + 0x40],	%f0
	tpos	%icc,	0x5
	move	%icc,	%o5,	%o3
	tcs	%icc,	0x6
	ldd	[%l7 + 0x68],	%f10
	bg	%xcc,	loop_826
	nop
	srl	%o3,	0x18,	%o3
	fmovscc	%icc,	%f2,	%f14
loop_826:
	udivcc	%o3,	0x18AF,	%o3
	tne	%xcc,	0x5
	bg,pn	%xcc,	loop_827
	bge	%icc,	loop_828
	ldsh	[%l7 + 0x56],	%o3
	fcmpne32	%f4,	%f10,	%o3
loop_827:
	nop
loop_828:
	xnor	%o3,	0x148F,	%o3
	movge	%xcc,	%i4,	%o3
	and	%o3,	0x0F23,	%o3
	fbne,a	%fcc0,	loop_829
	fmovscs	%xcc,	%f7,	%f2
	nop
	st	%f2,	[%l7 + 0x5C]
loop_829:
	nop
	setx loop_830, %l0, %l1
	jmpl %l1, %o3
	fmovrdgez	%o3,	%f2,	%f12
	bcs,a	%xcc,	loop_831
	andcc	%o3,	0x0909,	%o3
loop_830:
	movcc	%icc,	%l1,	%o3
	std	%f12,	[%l7 + 0x60]
loop_831:
	ble,pn	%xcc,	loop_832
	add	%o3,	%l6,	%o3
	move	%icc,	%o3,	%g6
	for	%f12,	%f14,	%f6
loop_832:
	ldd	[%l7 + 0x10],	%f4
	fmovsge	%icc,	%f6,	%f10
	andcc	%g6,	%g6,	%o4
	ld	[%l7 + 0x0C],	%f7
	nop
	movpos	%icc,	%i6,	%o4
	fmovspos	%icc,	%f1,	%f0
	orncc	%o4,	%l5,	%o4
	te	%xcc,	0x2
	taddcc	%o4,	%o4,	%o2
	fmovsg	%xcc,	%f0,	%f6
	brlz	%o2,	loop_833
	fmovrde	%o2,	%f14,	%f8
	movrgez	%o2,	0x3A9,	%o2
	sub	%o2,	%o0,	%o2
loop_833:
	pdist	%f8,	%f14,	%f2
	fxor	%f2,	%f6,	%f10
	lduw	[%l7 + 0x6C],	%o2
	ldd	[%l7 + 0x58],	%f4
	fbu	%fcc0,	loop_834
	fmovrsne	%o2,	%f15,	%f9
	movle	%xcc,	%o2,	%i5
	udivx	%i5,	0x08F6,	%i5
loop_834:
	fmovde	%xcc,	%f2,	%f13
	fmovrslz	%i5,	%f14,	%f1
	tn	%xcc,	0x5
	nop
	movrgez	%i5,	%i5,	%i1
	tsubcc	%i1,	%g4,	%i1
	bl	loop_835
	orcc	%i1,	0x05AC,	%i1
	addcc	%i1,	%g3,	%i1
	srl	%i1,	%i0,	%i1
loop_835:
	fbge	%fcc0,	loop_836
	bg	loop_837
	ldd	[%l7 + 0x40],	%f0
	movgu	%xcc,	%i1,	%g5
loop_836:
	fmovrslez	%g5,	%f2,	%f11
loop_837:
	nop
	movl	%xcc,	%g5,	%i7
	for	%f10,	%f6,	%f6
	nop
	fxor	%f6,	%f12,	%f0
	nop
	tsubcc	%i7,	%i7,	%o6
	movne	%icc,	%o6,	%o7
	movrlez	%o7,	0x29F,	%o7
	movne	%icc,	%g7,	%o7
	movrlz	%o7,	%o7,	%o1
	nop
	smulcc	%o1,	%l4,	%o1
	bne,a	loop_838
	fsrc1	%f0,	%f12
	bvc	%xcc,	loop_839
	stb	%o1,	[%l7 + 0x5D]
loop_838:
	bl,a,pn	%icc,	loop_840
	fornot2s	%f11,	%f1,	%f8
loop_839:
	ldx	[%l7 + 0x38],	%o1
	xnorcc	%o1,	%l0,	%o1
loop_840:
	fmovdg	%xcc,	%f8,	%f7
	andn	%o1,	0x1228,	%o1
	nop
	fcmpd	%fcc0,	%f14,	%f12
	mova	%xcc,	%o1,	%l2
	st	%f7,	[%l7 + 0x6C]
	bvc,a,pn	%xcc,	loop_841
	fcmpeq16	%f12,	%f12,	%l2
	ld	[%l7 + 0x44],	%f9
	fmovrdne	%l2,	%f2,	%f4
loop_841:
	taddcctv	%l2,	%l2,	%g1
	udivcc	%g1,	0x1BCD,	%g1
	fmul8x16al	%f7,	%f8,	%f2
	ldx	[%l7 + 0x68],	%g1
	fmovsa	%xcc,	%f15,	%f0
	xorcc	%g1,	0x0CDF,	%g1
	lduh	[%l7 + 0x7E],	%g1
	nop
	setx loop_842, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	bpos,pn	%xcc,	loop_843
	nop
	tcc	%xcc,	0x1
loop_842:
	fmovdn	%icc,	%f14,	%f7
loop_843:
	array32	%g1,	%l3,	%g1
	brlez,a	%g1,	loop_844
	st	%f7,	[%l7 + 0x4C]
	srl	%g1,	0x11,	%g1
	tl	%xcc,	0x1
loop_844:
	nop
	lduw	[%l7 + 0x54],	%g1
	movcs	%xcc,	%g1,	%i3
	smul	%i3,	%i3,	%i2
	fcmpd	%fcc3,	%f8,	%f0
	fmovsle	%xcc,	%f2,	%f15
	bg,a,pt	%xcc,	loop_845
	movne	%xcc,	%g2,	%i2
	addcc	%i2,	%i2,	%o5
	fbn,a	%fcc0,	loop_846
loop_845:
	orn	%o5,	0x04C1,	%o5
	fandnot2s	%f15,	%f12,	%f3
	orn	%o5,	%i4,	%o5
loop_846:
	fcmpgt16	%f0,	%f14,	%o5
	stb	%o5,	[%l7 + 0x3C]
	orn	%o5,	%o5,	%l1
	tl	%xcc,	0x1
	nop
	array8	%l1,	%l6,	%l1
	or	%l1,	%o3,	%l1
	nop
	nop
	bleu,a	loop_847
	movcc	%icc,	%l1,	%g6
	move	%icc,	%i6,	%g6
	nop
loop_847:
	fmovs	%f3,	%f11
	fsrc1	%f0,	%f2
	ldub	[%l7 + 0x4E],	%g6
	mova	%icc,	%g6,	%l5
	fmovs	%f3,	%f9
	movg	%xcc,	%l5,	%o4
	fmovrdlz	%o4,	%f0,	%f2
	nop
	setx loop_848, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	sdiv	%o4,	0x1CE4,	%o4
	addc	%o4,	%o0,	%o4
	subc	%o4,	%o2,	%o4
loop_848:
	smulcc	%o4,	0x15EB,	%o4
	ldx	[%l7 + 0x60],	%o4
	array16	%o4,	%o4,	%i5
	nop
	alignaddrl	%i5,	%g4,	%i5
	orn	%i5,	%i5,	%g3
	fornot1	%f2,	%f6,	%f14
	tg	%xcc,	0x0
	fone	%f14
	fbe,a	%fcc2,	loop_849
	tg	%xcc,	0x2
	movgu	%icc,	%i0,	%g3
	nop
loop_849:
	ldsw	[%l7 + 0x24],	%g3
	ldsh	[%l7 + 0x4E],	%g3
	tsubcctv	%g3,	0x19A7,	%g3
	fmovdcc	%icc,	%f12,	%f5
	movrgz	%g3,	%i1,	%g3
	fandnot1	%f14,	%f0,	%f4
	tl	%xcc,	0x1
	nop
	popc	0x1CF8,	%g3
	tgu	%icc,	0x0
	movcc	%icc,	%g3,	%g5
	udivcc	%g5,	0x1980,	%g5
	fmovsn	%icc,	%f15,	%f12
	sdiv	%g5,	0x109F,	%g5
	fcmpes	%fcc0,	%f14,	%f8
	tleu	%xcc,	0x1
	lduw	[%l7 + 0x34],	%g5
	nop
	nop
	array8	%g5,	%i7,	%g5
	tne	%icc,	0x1
	ldub	[%l7 + 0x23],	%g5
	orn	%g5,	0x0F15,	%g5
	fsrc2s	%f8,	%f8
	tpos	%icc,	0x5
	tgu	%icc,	0x2
	movrgez	%g5,	0x3E6,	%g5
	umul	%g5,	0x0C84,	%g5
	orcc	%g5,	%g5,	%o6
	mulscc	%o6,	0x18C9,	%o6
	addc	%o6,	0x0C8B,	%o6
	fmovsvc	%xcc,	%f12,	%f8
	fbue	%fcc0,	loop_850
	xorcc	%o6,	0x1F78,	%o6
	fxor	%f4,	%f4,	%f10
	movre	%o6,	0x3B4,	%o6
loop_850:
	nop
	orncc	%o6,	%g7,	%o6
	std	%f10,	[%l7 + 0x08]
	sdivcc	%o6,	0x0018,	%o6
	nop
	ldsb	[%l7 + 0x2B],	%o6
	tle	%xcc,	0x5
	sdiv	%o6,	0x1EAE,	%o6
	tn	%xcc,	0x0
	smul	%o6,	%o7,	%o6
	tgu	%xcc,	0x4
	or	%o6,	0x0CF6,	%o6
	xnor	%o6,	0x10F9,	%o6
	for	%f10,	%f12,	%f12
	fmovrdgez	%o6,	%f6,	%f14
	fmovrse	%o6,	%f12,	%f12
	nop
	andcc	%o6,	0x13A3,	%o6
	popc	%o6,	%o6
	tneg	%xcc,	0x2
	movn	%icc,	%l4,	%o6
	brgez,a	%o6,	loop_851
	umul	%o6,	%o6,	%l0
	nop
	stw	%l0,	[%l7 + 0x54]
loop_851:
	fzeros	%f12
	movge	%xcc,	%l0,	%o1
	lduw	[%l7 + 0x60],	%o1
	fbne,a	%fcc2,	loop_852
	ldsh	[%l7 + 0x3C],	%o1
	fmovrdgz	%o1,	%f0,	%f12
	fornot2	%f12,	%f14,	%f4
loop_852:
	st	%f12,	[%l7 + 0x0C]
	nop
	sllx	%o1,	%o1,	%l2
	ld	[%l7 + 0x58],	%f10
	be,a	loop_853
	fmovsgu	%icc,	%f15,	%f11
	stx	%l2,	[%l7 + 0x28]
	ldub	[%l7 + 0x2F],	%l2
loop_853:
	mulscc	%l2,	0x08B7,	%l2
	movcc	%xcc,	%l3,	%l2
	fmovdcc	%icc,	%f11,	%f4
	movne	%xcc,	%l2,	%g1
	fmovrsgez	%g1,	%f13,	%f0
	popc	%g1,	%g1
	tvc	%xcc,	0x3
	tvc	%xcc,	0x5
	fmovdge	%icc,	%f7,	%f6
	tcc	%icc,	0x5
	st	%f6,	[%l7 + 0x18]
	movge	%icc,	%i3,	%g1
	bge	%icc,	loop_854
	nop
	xor	%g1,	%g1,	%g2
	bleu,a	loop_855
loop_854:
	movrgz	%g2,	%g2,	%i2
	movrlz	%i2,	%i4,	%i2
	movn	%xcc,	%o5,	%i2
loop_855:
	taddcc	%i2,	%l6,	%i2
	bcs,pn	%icc,	loop_856
	nop
	fzero	%f4
	brgez,a	%i2,	loop_857
loop_856:
	nop
	orn	%i2,	%o3,	%i2
	udivcc	%i2,	0x0B75,	%i2
loop_857:
	ble,a,pt	%icc,	loop_858
	ba	%icc,	loop_859
	fmul8x16al	%f6,	%f0,	%f0
	movleu	%xcc,	%l1,	%i2
loop_858:
	ta	%icc,	0x3
loop_859:
	movle	%icc,	%i2,	%i6
	tvs	%icc,	0x6
	alignaddr	%i6,	%g6,	%i6
	fcmpes	%fcc2,	%f0,	%f9
	faligndata	%f0,	%f12,	%f10
	orncc	%i6,	0x0A21,	%i6
	fba,a	%fcc1,	loop_860
	fcmpgt32	%f10,	%f4,	%i6
	fblg	%fcc1,	loop_861
	mulx	%i6,	%l5,	%i6
loop_860:
	xorcc	%i6,	0x177B,	%i6
	fornot1	%f10,	%f0,	%f4
loop_861:
	movvc	%xcc,	%i6,	%o0
	fblg,a	%fcc2,	loop_862
	ta	%xcc,	0x3
	fbg	%fcc2,	loop_863
	movpos	%xcc,	%o2,	%o0
loop_862:
	fbu	%fcc2,	loop_864
	fmovrdne	%o0,	%f0,	%f14
loop_863:
	te	%icc,	0x3
	addcc	%o0,	0x08E4,	%o0
loop_864:
	stw	%o0,	[%l7 + 0x2C]
	fmovdleu	%xcc,	%f7,	%f6
	bshuffle	%f14,	%f10,	%f0
	ldub	[%l7 + 0x5A],	%o0
	fbo,a	%fcc0,	loop_865
	fpmerge	%f6,	%f15,	%f10
	move	%icc,	%o0,	%o4
	addccc	%o4,	%g4,	%o4
loop_865:
	movl	%xcc,	%i5,	%o4
	orn	%o4,	%o4,	%i0
	fmovsg	%icc,	%f11,	%f5
	ld	[%l7 + 0x7C],	%f14
	fxor	%f10,	%f8,	%f2
	stx	%i0,	[%l7 + 0x40]
	fand	%f2,	%f2,	%f8
	ld	[%l7 + 0x60],	%f1
	fnor	%f8,	%f2,	%f0
	nop
	fbge	%fcc3,	loop_866
	addcc	%i0,	%i1,	%i0
	tcc	%xcc,	0x1
	bpos,a,pt	%icc,	loop_867
loop_866:
	stx	%i0,	[%l7 + 0x68]
	bleu,a	loop_868
	subc	%i0,	0x0833,	%i0
loop_867:
	fbn,a	%fcc3,	loop_869
	movleu	%xcc,	%g3,	%i0
loop_868:
	stx	%i0,	[%l7 + 0x50]
	mulx	%i0,	0x00DE,	%i0
loop_869:
	tgu	%xcc,	0x5
	nop
	movle	%icc,	%i0,	%i7
	fxnors	%f5,	%f14,	%f4
	bgu,a,pt	%icc,	loop_870
	taddcc	%i7,	%g5,	%i7
	sllx	%i7,	%g7,	%i7
	alignaddrl	%i7,	%o7,	%i7
loop_870:
	nop
	taddcctv	%i7,	%l4,	%i7
	fmovrsgz	%i7,	%f4,	%f5
	movg	%xcc,	%i7,	%o6
	movre	%o6,	0x301,	%o6
	subcc	%o6,	0x19A1,	%o6
	nop
	setx loop_871, %l0, %l1
	jmpl %l1, %o6
	subcc	%o6,	0x1B88,	%o6
	nop
	tpos	%xcc,	0x2
loop_871:
	movl	%icc,	%o6,	%l0
	srax	%l0,	0x0C,	%l0
	tge	%xcc,	0x1
	ldsh	[%l7 + 0x10],	%l0
	bneg,a,pn	%xcc,	loop_872
	fsrc2s	%f5,	%f15
	tge	%icc,	0x3
	movrlz	%l0,	0x2BA,	%l0
loop_872:
	movge	%icc,	%o1,	%l0
	fmovsge	%xcc,	%f5,	%f14
	taddcctv	%l0,	0x0B8E,	%l0
	movneg	%icc,	%l3,	%l0
	bn	loop_873
	fbue,a	%fcc2,	loop_874
	bcc,pt	%xcc,	loop_875
	fmul8x16al	%f14,	%f6,	%f12
loop_873:
	tl	%xcc,	0x0
loop_874:
	alignaddrl	%l0,	%l2,	%l0
loop_875:
	movne	%icc,	%l0,	%i3
	sllx	%i3,	0x0A,	%i3
	te	%xcc,	0x1
	fsrc1s	%f14,	%f9
	addccc	%i3,	%g1,	%i3
	taddcc	%i3,	%i3,	%g2
	bge,a,pt	%icc,	loop_876
	tvc	%xcc,	0x1
	nop
	sll	%g2,	0x16,	%g2
loop_876:
	addccc	%g2,	0x0FB6,	%g2
	mulscc	%g2,	0x067D,	%g2
	fmovsvs	%icc,	%f13,	%f14
	srax	%g2,	0x19,	%g2
	orn	%g2,	%g2,	%i4
	brnz,a	%i4,	loop_877
	fcmpgt32	%f12,	%f10,	%i4
	fbo,a	%fcc0,	loop_878
	xnorcc	%i4,	%i4,	%o5
loop_877:
	nop
	fmovrsgz	%o5,	%f8,	%f7
loop_878:
	fpadd16	%f12,	%f10,	%f12
	lduh	[%l7 + 0x5A],	%o5
	tle	%icc,	0x2
	tvs	%icc,	0x4
	nop
	bvs	%icc,	loop_879
	movne	%icc,	%l6,	%o5
	subcc	%o5,	0x1DE2,	%o5
	fmovrdgz	%o5,	%f2,	%f2
loop_879:
	fnot2	%f2,	%f6
	fba	%fcc0,	loop_880
	sethi	0x1410,	%o5
	udivx	%o5,	0x188B,	%o5
	ldsw	[%l7 + 0x50],	%o5
loop_880:
	bgu,a,pn	%xcc,	loop_881
	fxors	%f7,	%f5,	%f3
	fpadd32s	%f3,	%f0,	%f7
	movvc	%xcc,	%o5,	%o3
loop_881:
	nop
	mulscc	%o3,	0x024F,	%o3
	move	%icc,	%o3,	%l1
	nop
	setx loop_882, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	tleu	%icc,	0x6
	udivcc	%l1,	0x0D8D,	%l1
	movn	%icc,	%l1,	%i2
loop_882:
	fpadd32s	%f7,	%f0,	%f12
	tgu	%icc,	0x0
	bvc,a,pn	%icc,	loop_883
	fexpand	%f12,	%f6
	stw	%i2,	[%l7 + 0x14]
	srl	%i2,	0x05,	%i2
loop_883:
	movvc	%icc,	%g6,	%i2
	fbl,a	%fcc3,	loop_884
	movrlz	%i2,	0x18D,	%i2
	fpadd16s	%f12,	%f5,	%f0
	sll	%i2,	0x09,	%i2
loop_884:
	bn,pn	%icc,	loop_885
	fble	%fcc2,	loop_886
	smulcc	%i2,	%i2,	%l5
	fbul,a	%fcc1,	loop_887
loop_885:
	sth	%l5,	[%l7 + 0x26]
loop_886:
	srl	%l5,	0x03,	%l5
	lduw	[%l7 + 0x58],	%l5
loop_887:
	stb	%l5,	[%l7 + 0x7E]
	taddcctv	%l5,	%i6,	%l5
	alignaddr	%l5,	%l5,	%o2
	mova	%xcc,	%o0,	%o2
	std	%f2,	[%l7 + 0x30]
	tsubcctv	%o2,	%g4,	%o2
	sdivx	%o2,	0x1FE3,	%o2
	fba,a	%fcc3,	loop_888
	ldsb	[%l7 + 0x49],	%o2
	be,a	%xcc,	loop_889
	fnot2	%f2,	%f6
loop_888:
	array16	%o2,	%o2,	%i5
	fnot2	%f2,	%f2
loop_889:
	nop
	popc	%i5,	%i5
	addccc	%i5,	%o4,	%i5
	or	%i5,	0x00ED,	%i5
	sth	%i5,	[%l7 + 0x42]
	stb	%i5,	[%l7 + 0x50]
	fmovdne	%xcc,	%f12,	%f9
	tleu	%icc,	0x7
	movcc	%icc,	%i5,	%i1
	tl	%xcc,	0x6
	smulcc	%i1,	0x121E,	%i1
	subcc	%i1,	%i1,	%g3
	movcs	%xcc,	%i0,	%g3
	smul	%g3,	0x1869,	%g3
	nop
	fmovda	%icc,	%f9,	%f15
	orcc	%g3,	0x1666,	%g3
	subccc	%g3,	0x0C40,	%g3
	fmovrdgez	%g3,	%f6,	%f2
	tcs	%xcc,	0x6
	movpos	%xcc,	%g5,	%g3
	ta	%xcc,	0x7
	fmovdl	%icc,	%f5,	%f3
	fbug,a	%fcc2,	loop_890
	ldsb	[%l7 + 0x50],	%g3
	fexpand	%f3,	%f6
	fors	%f3,	%f13,	%f5
loop_890:
	st	%f5,	[%l7 + 0x2C]
	xorcc	%g3,	0x0BCF,	%g3
	mova	%icc,	%g3,	%g7
	std	%f2,	[%l7 + 0x70]
	fmovse	%xcc,	%f4,	%f1
	move	%icc,	%o7,	%g7
	bcc,pn	%xcc,	loop_891
	movle	%xcc,	%l4,	%g7
	ldsb	[%l7 + 0x49],	%g7
	movrne	%g7,	0x187,	%g7
loop_891:
	tl	%xcc,	0x7
	fmovsneg	%icc,	%f14,	%f15
	ldsw	[%l7 + 0x7C],	%g7
	bleu,pn	%xcc,	loop_892
	sub	%g7,	%i7,	%g7
	nop
	ldx	[%l7 + 0x18],	%g7
loop_892:
	movn	%xcc,	%g7,	%o6
	lduw	[%l7 + 0x58],	%o6
	fmovrdgez	%o6,	%f6,	%f12
	fmovrslz	%o6,	%f3,	%f2
	stx	%o6,	[%l7 + 0x38]
	fmovrdlz	%o6,	%f12,	%f8
	sdiv	%o6,	0x1CCB,	%o6
	udiv	%o6,	0x0432,	%o6
	stb	%o6,	[%l7 + 0x17]
	nop
	ldsh	[%l7 + 0x4E],	%o6
	nop
	nop
	fcmple16	%f8,	%f0,	%o6
	tpos	%icc,	0x1
	movrlz	%o6,	%o1,	%o6
	fandnot1	%f8,	%f14,	%f0
	fbl,a	%fcc0,	loop_893
	orncc	%o6,	%l3,	%o6
	ld	[%l7 + 0x78],	%f7
	tsubcctv	%o6,	0x1DCB,	%o6
loop_893:
	smulcc	%o6,	%o6,	%l2
	udivcc	%l2,	0x1A1C,	%l2
	nop
	setx loop_894, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	fbn,a	%fcc1,	loop_895
	stw	%l2,	[%l7 + 0x7C]
	fbe	%fcc2,	loop_896
loop_894:
	tle	%icc,	0x3
loop_895:
	te	%xcc,	0x5
	fbule	%fcc3,	loop_897
loop_896:
	movvc	%icc,	%l2,	%l0
	fmovsa	%xcc,	%f7,	%f11
	taddcctv	%l0,	%g1,	%l0
loop_897:
	movpos	%icc,	%l0,	%i3
	lduh	[%l7 + 0x24],	%i3
	ta	%xcc,	0x6
	fpadd32	%f0,	%f14,	%f2
	or	%i3,	%i3,	%g2
	ldub	[%l7 + 0x7C],	%g2
	fmuld8ulx16	%f11,	%f12,	%f8
	add	%g2,	0x09C2,	%g2
	srax	%g2,	%i4,	%g2
	movrlz	%g2,	%g2,	%l6
	fcmple32	%f8,	%f0,	%l6
	fbg,a	%fcc3,	loop_898
	std	%f8,	[%l7 + 0x78]
	mulscc	%l6,	0x1BC9,	%l6
	nop
loop_898:
	ldsw	[%l7 + 0x4C],	%l6
	fmuld8sux16	%f11,	%f3,	%f2
	addcc	%l6,	0x025F,	%l6
	orn	%l6,	%o5,	%l6
	nop
	tge	%icc,	0x6
	tneg	%xcc,	0x1
	brlez	%l6,	loop_899
	fmul8ulx16	%f2,	%f8,	%f12
	move	%xcc,	%o3,	%l6
	nop
loop_899:
	movleu	%icc,	%l1,	%l6
	fands	%f11,	%f13,	%f15
	movrlez	%l6,	0x2A3,	%l6
	fmovdcs	%icc,	%f4,	%f4
	fbuge	%fcc0,	loop_900
	ldsh	[%l7 + 0x18],	%l6
	nop
	fbue,a	%fcc0,	loop_901
loop_900:
	fblg,a	%fcc1,	loop_902
	stw	%l6,	[%l7 + 0x1C]
	xnor	%l6,	%l6,	%g6
loop_901:
	nop
loop_902:
	fcmpne32	%f12,	%f12,	%g6
	sra	%g6,	%g6,	%i2
	lduw	[%l7 + 0x48],	%i2
	lduh	[%l7 + 0x14],	%i2
	ldsb	[%l7 + 0x76],	%i2
	or	%i2,	0x0702,	%i2
	fbne,a	%fcc3,	loop_903
	addcc	%i2,	0x1FC2,	%i2
	lduw	[%l7 + 0x18],	%i2
	sdiv	%i2,	0x0211,	%i2
loop_903:
	tvs	%icc,	0x6
	sll	%i2,	0x08,	%i2
	sll	%i2,	%i2,	%i6
	fnot2s	%f4,	%f15
	movvc	%icc,	%l5,	%i6
	subccc	%i6,	%i6,	%o0
	fblg	%fcc2,	loop_904
	nop
	addc	%o0,	%o0,	%g4
	movgu	%xcc,	%g4,	%o2
loop_904:
	fors	%f4,	%f2,	%f15
	smul	%o2,	%o4,	%o2
	bleu,a,pt	%icc,	loop_905
	taddcc	%o2,	0x1016,	%o2
	ldsh	[%l7 + 0x7E],	%o2
	ba,a	%xcc,	loop_906
loop_905:
	ta	%icc,	0x4
	ldsb	[%l7 + 0x2B],	%o2
	fba,a	%fcc1,	loop_907
loop_906:
	fmul8sux16	%f12,	%f6,	%f12
	fornot2s	%f15,	%f1,	%f2
	sdiv	%o2,	0x051F,	%o2
loop_907:
	tgu	%icc,	0x6
	ldsb	[%l7 + 0x50],	%o2
	movrgz	%o2,	%i5,	%o2
	fbue	%fcc2,	loop_908
	std	%f12,	[%l7 + 0x50]
	tleu	%icc,	0x5
	fmovsneg	%xcc,	%f4,	%f8
loop_908:
	popc	%o2,	%o2
	fsrc2s	%f8,	%f4
	fmul8x16	%f8,	%f10,	%f0
	brnz,a	%o2,	loop_909
	movn	%icc,	%i1,	%o2
	fbe	%fcc1,	loop_910
	fbne	%fcc2,	loop_911
loop_909:
	bleu	%xcc,	loop_912
	nop
loop_910:
	tge	%xcc,	0x7
loop_911:
	and	%o2,	0x1D70,	%o2
loop_912:
	fblg	%fcc2,	loop_913
	fmovsleu	%xcc,	%f4,	%f7
	movl	%xcc,	%i0,	%o2
	movpos	%xcc,	%o2,	%g5
loop_913:
	nop
	movrgz	%g5,	%g3,	%g5
	orn	%g5,	0x1C2C,	%g5
	lduh	[%l7 + 0x5C],	%g5
	movrlez	%g5,	0x3FB,	%g5
	srlx	%g5,	%g5,	%o7
	fmovs	%f7,	%f3
	fmovsneg	%icc,	%f14,	%f4
	ldx	[%l7 + 0x68],	%o7
	or	%o7,	0x0C49,	%o7
	fmovdn	%icc,	%f6,	%f7
	sdivcc	%o7,	0x0804,	%o7
	st	%f7,	[%l7 + 0x5C]
	ta	%icc,	0x4
	movrlz	%o7,	%o7,	%l4
	movcc	%xcc,	%l4,	%i7
	movvc	%icc,	%i7,	%g7
	movge	%icc,	%g7,	%o1
	srl	%o1,	0x03,	%o1
	nop
	fmovd	%f0,	%f8
	movneg	%xcc,	%l3,	%o1
	nop
	setx loop_914, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	tge	%xcc,	0x7
	fcmpeq32	%f0,	%f10,	%o1
	andncc	%o1,	%o6,	%o1
loop_914:
	brnz	%o1,	loop_915
	stw	%o1,	[%l7 + 0x58]
	tcs	%icc,	0x7
	fpadd32	%f0,	%f4,	%f14
loop_915:
	fmovsl	%xcc,	%f12,	%f3
	tge	%icc,	0x4
	orncc	%o1,	%l2,	%o1
	umulcc	%o1,	0x18D6,	%o1
	brgez	%o1,	loop_916
	nop
	fmovde	%xcc,	%f4,	%f2
	movvs	%icc,	%o1,	%g1
loop_916:
	movgu	%xcc,	%g1,	%l0
	subc	%l0,	%l0,	%i3
	nop
	setx loop_917, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	orn	%i3,	%i3,	%i4
	sth	%i4,	[%l7 + 0x72]
	nop
	setx loop_918, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_917:
	movrne	%i4,	%g2,	%i4
	movcc	%xcc,	%i4,	%o5
	fbn	%fcc0,	loop_919
loop_918:
	fbo	%fcc2,	loop_920
	ldsb	[%l7 + 0x7A],	%o5
	tne	%icc,	0x5
loop_919:
	fmovrde	%o5,	%f14,	%f10
loop_920:
	nop
	add	%o5,	%o3,	%o5
	array32	%o5,	%l1,	%o5
	sth	%o5,	[%l7 + 0x5C]
	sllx	%o5,	%o5,	%l6
	bcs	%xcc,	loop_921
	ldub	[%l7 + 0x67],	%l6
	alignaddrl	%l6,	%l6,	%g6
	tle	%xcc,	0x6
loop_921:
	tg	%xcc,	0x3
	fmovdcs	%xcc,	%f14,	%f2
	nop
	brlez	%g6,	loop_922
	ble	%xcc,	loop_923
	sdivcc	%g6,	0x0FDB,	%g6
	add	%g6,	0x06C6,	%g6
loop_922:
	lduw	[%l7 + 0x1C],	%g6
loop_923:
	add	%g6,	%i2,	%g6
	tpos	%xcc,	0x0
	movcc	%icc,	%l5,	%g6
	taddcc	%g6,	%g6,	%i6
	fpsub32s	%f2,	%f4,	%f9
	array32	%i6,	%o0,	%i6
	fbne	%fcc2,	loop_924
	nop
	setx loop_925, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	tne	%xcc,	0x6
	smul	%i6,	0x0B14,	%i6
loop_924:
	nop
loop_925:
	sub	%i6,	%g4,	%i6
	movg	%xcc,	%o4,	%i6
	tcc	%icc,	0x2
	fpsub32s	%f9,	%f6,	%f6
	fornot2	%f10,	%f6,	%f4
	fands	%f6,	%f4,	%f14
	tg	%xcc,	0x0
	add	%i6,	%i5,	%i6
	fpsub32s	%f14,	%f3,	%f13
	sdivx	%i6,	0x0E1D,	%i6
	xnor	%i6,	0x132D,	%i6
	tgu	%icc,	0x7
	ldsh	[%l7 + 0x68],	%i6
	movcc	%icc,	%i1,	%i6
	xnorcc	%i6,	%i6,	%i0
	sdivcc	%i0,	0x1275,	%i0
	std	%f4,	[%l7 + 0x68]
	fmovrdlez	%i0,	%f12,	%f8
	xnorcc	%i0,	%o2,	%i0
	fbule,a	%fcc2,	loop_926
	subc	%i0,	%i0,	%g3
	movcc	%xcc,	%g3,	%g5
	fmovsn	%icc,	%f14,	%f5
loop_926:
	addc	%g5,	%o7,	%g5
	for	%f8,	%f2,	%f6
	fsrc1s	%f5,	%f12
	fmovdn	%icc,	%f3,	%f3
	sth	%g5,	[%l7 + 0x2E]
	fmovsl	%icc,	%f13,	%f7
	fmovdle	%xcc,	%f7,	%f3
	xnor	%g5,	%g5,	%l4
	subc	%l4,	0x16CB,	%l4
	nop
	xor	%l4,	%i7,	%l4
	fsrc2	%f6,	%f12
	umulcc	%l4,	%g7,	%l4
	xorcc	%l4,	%l4,	%l3
	bpos,pt	%xcc,	loop_927
	fbug	%fcc1,	loop_928
	fones	%f3
	tne	%xcc,	0x2
loop_927:
	taddcc	%l3,	0x008A,	%l3
loop_928:
	fmul8x16al	%f3,	%f14,	%f12
	taddcc	%l3,	%l3,	%o6
	srax	%o6,	%l2,	%o6
	fpmerge	%f3,	%f7,	%f0
	fbu,a	%fcc3,	loop_929
	brlz	%o6,	loop_930
	udivcc	%o6,	0x0519,	%o6
	tsubcc	%o6,	%o6,	%o1
loop_929:
	fone	%f0
loop_930:
	srl	%o1,	0x16,	%o1
	andcc	%o1,	%g1,	%o1
	nop
	xnorcc	%o1,	%l0,	%o1
	move	%icc,	%i3,	%o1
	smul	%o1,	0x1B70,	%o1
	tvs	%xcc,	0x4
	or	%o1,	0x0823,	%o1
	movle	%icc,	%o1,	%g2
	nop
	movcs	%xcc,	%i4,	%g2
	subccc	%g2,	%g2,	%o3
	sdiv	%o3,	0x1773,	%o3
	addccc	%o3,	0x085C,	%o3
	umulcc	%o3,	0x15E9,	%o3
	fbu	%fcc3,	loop_931
	sll	%o3,	0x0B,	%o3
	ldsb	[%l7 + 0x2B],	%o3
	add	%o3,	%o3,	%l1
loop_931:
	sdiv	%l1,	0x1FAB,	%l1
	ldx	[%l7 + 0x38],	%l1
	std	%f0,	[%l7 + 0x70]
	tsubcctv	%l1,	0x065A,	%l1
	fmovdvc	%xcc,	%f4,	%f2
	ldsw	[%l7 + 0x1C],	%l1
	fpack32	%f0,	%f14,	%f14
	andn	%l1,	%l1,	%o5
	fmovdl	%xcc,	%f14,	%f9
	bgu,a,pn	%icc,	loop_932
	stx	%o5,	[%l7 + 0x20]
	xnorcc	%o5,	0x109D,	%o5
	fnot1	%f14,	%f6
loop_932:
	lduw	[%l7 + 0x10],	%o5
	ld	[%l7 + 0x14],	%f5
	array16	%o5,	%o5,	%l6
	st	%f9,	[%l7 + 0x34]
	movre	%l6,	%l6,	%i2
	tgu	%xcc,	0x6
	fble,a	%fcc0,	loop_933
	andn	%i2,	%l5,	%i2
	lduh	[%l7 + 0x1A],	%i2
	ba	loop_934
loop_933:
	udiv	%i2,	0x0B08,	%i2
	ta	%xcc,	0x1
	sdivx	%i2,	0x17D6,	%i2
loop_934:
	srlx	%i2,	0x1C,	%i2
	xnorcc	%i2,	0x1AAE,	%i2
	fmovsa	%xcc,	%f2,	%f9
	alignaddr	%i2,	%i2,	%g6
	addccc	%g6,	%g6,	%o0
	nop
	st	%f9,	[%l7 + 0x20]
	xnorcc	%o0,	0x064A,	%o0
	movrlez	%o0,	%g4,	%o0
	smulcc	%o0,	%o4,	%o0
	xnorcc	%o0,	%i5,	%o0
	tsubcc	%o0,	0x1FE9,	%o0
	umul	%o0,	%o0,	%i1
	alignaddr	%i1,	%i6,	%i1
	movge	%icc,	%i1,	%o2
	fmovdleu	%xcc,	%f14,	%f1
	nop
	movre	%o2,	0x0C9,	%o2
	tpos	%xcc,	0x1
	orncc	%o2,	%o2,	%i0
	fnors	%f1,	%f3,	%f7
	fmovscc	%icc,	%f1,	%f8
	sdivcc	%i0,	0x0C4B,	%i0
	fmovrslez	%i0,	%f12,	%f7
	fandnot2	%f14,	%f2,	%f0
	movpos	%icc,	%i0,	%g3
	smul	%g3,	0x1D09,	%g3
	ldsb	[%l7 + 0x65],	%g3
	fcmps	%fcc2,	%f2,	%f0
	orncc	%g3,	%g3,	%o7
	fcmple16	%f0,	%f6,	%o7
	orcc	%o7,	%g5,	%o7
	movrgez	%o7,	0x381,	%o7
	fmovsvs	%xcc,	%f5,	%f1
	movrgez	%o7,	0x234,	%o7
	mulx	%o7,	%o7,	%i7
	nop
	movn	%xcc,	%g7,	%i7
	st	%f1,	[%l7 + 0x78]
	tsubcctv	%i7,	0x1A45,	%i7
	nop
	andn	%i7,	0x14DB,	%i7
	alignaddrl	%i7,	%i7,	%l4
	fmovrdgez	%l4,	%f14,	%f2
	fcmpgt16	%f2,	%f12,	%l4
	sll	%l4,	%l3,	%l4
	ldsb	[%l7 + 0x5D],	%l4
	nop
	setx loop_935, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	fba	%fcc1,	loop_936
	nop
	nop
loop_935:
	andcc	%l4,	%l2,	%l4
loop_936:
	fbge	%fcc3,	loop_937
	addc	%l4,	%l4,	%o6
	xnor	%o6,	%o6,	%g1
	movrgz	%g1,	0x330,	%g1
loop_937:
	fmul8x16au	%f1,	%f11,	%f8
	nop
	tpos	%icc,	0x2
	fmovsle	%xcc,	%f8,	%f10
	alignaddrl	%g1,	%g1,	%l0
	tgu	%icc,	0x6
	nop
	udiv	%l0,	0x0808,	%l0
	orn	%l0,	0x1E36,	%l0
	tleu	%icc,	0x7
	fpadd32	%f8,	%f4,	%f8
	ta	%xcc,	0x0
	xnorcc	%l0,	0x08F2,	%l0
	umul	%l0,	0x1CFA,	%l0
	umulcc	%l0,	%i3,	%l0
	tl	%icc,	0x7
	addccc	%l0,	%l0,	%o1
	alignaddrl	%o1,	%o1,	%i4
	movle	%icc,	%g2,	%i4
	ld	[%l7 + 0x5C],	%f14
	addc	%i4,	%o3,	%i4
	xnor	%i4,	%i4,	%l1
	lduw	[%l7 + 0x38],	%l1
	addcc	%l1,	0x00E6,	%l1
	andn	%l1,	%l1,	%o5
	xorcc	%o5,	0x16BA,	%o5
	movrlez	%o5,	%l6,	%o5
	sth	%o5,	[%l7 + 0x1C]
	ldub	[%l7 + 0x23],	%o5
	ldub	[%l7 + 0x33],	%o5
	nop
	setx loop_938, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	fbule	%fcc0,	loop_939
	fmovdg	%icc,	%f9,	%f7
	lduw	[%l7 + 0x4C],	%o5
loop_938:
	ldsb	[%l7 + 0x7B],	%o5
loop_939:
	ldsw	[%l7 + 0x40],	%o5
	tvs	%icc,	0x3
	fbul	%fcc3,	loop_940
	sdivx	%o5,	0x1022,	%o5
	tvc	%xcc,	0x7
	st	%f7,	[%l7 + 0x54]
loop_940:
	subc	%o5,	%l5,	%o5
	fmovdleu	%xcc,	%f11,	%f2
	fcmpgt16	%f8,	%f12,	%o5
	movvc	%icc,	%o5,	%i2
	movl	%xcc,	%g6,	%i2
	fmovse	%icc,	%f3,	%f9
	stw	%i2,	[%l7 + 0x58]
	fba,a	%fcc3,	loop_941
	tneg	%xcc,	0x4
	srlx	%i2,	%g4,	%i2
	fcmpes	%fcc2,	%f7,	%f11
loop_941:
	ta	%icc,	0x3
	alignaddr	%i2,	%o4,	%i2
	popc	%i2,	%i2
	tpos	%xcc,	0x7
	fbg,a	%fcc1,	loop_942
	bpos,pt	%xcc,	loop_943
	bgu,a	loop_944
	nop
loop_942:
	subcc	%i2,	%i5,	%i2
loop_943:
	tcs	%icc,	0x2
loop_944:
	nop
	movg	%icc,	%i2,	%o0
	taddcctv	%o0,	0x1575,	%o0
	fnors	%f11,	%f9,	%f2
	nop
	ldd	[%l7 + 0x28],	%f2
	tgu	%icc,	0x5
	lduw	[%l7 + 0x58],	%o0
	addc	%o0,	0x1D1F,	%o0
	siam	0x7
	lduh	[%l7 + 0x2E],	%o0
	fmovdvs	%xcc,	%f3,	%f4
	movrne	%o0,	0x352,	%o0
	orcc	%o0,	%i6,	%o0
	move	%xcc,	%i1,	%o0
	std	%f8,	[%l7 + 0x18]
	ldx	[%l7 + 0x70],	%o0
	stb	%o0,	[%l7 + 0x40]
	ldsb	[%l7 + 0x63],	%o0
	or	%o0,	%o2,	%o0
	ldsb	[%l7 + 0x5B],	%o0
	bcc	loop_945
	taddcctv	%o0,	0x1834,	%o0
	fbu	%fcc0,	loop_946
	fsrc1s	%f4,	%f2
loop_945:
	nop
	setx loop_947, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	srax	%o0,	0x0B,	%o0
loop_946:
	lduh	[%l7 + 0x22],	%o0
	nop
loop_947:
	movge	%icc,	%i0,	%o0
	ldsb	[%l7 + 0x52],	%o0
	fmovrsne	%o0,	%f1,	%f5
	fmovrdlz	%o0,	%f14,	%f4
	move	%icc,	%o0,	%g3
	and	%g3,	%g5,	%g3
	nop
	siam	0x4
	tneg	%icc,	0x2
	fnors	%f5,	%f6,	%f10
	sdiv	%g3,	0x0B0A,	%g3
	pdist	%f4,	%f0,	%f6
	fnegs	%f10,	%f10
	fxors	%f10,	%f9,	%f8
	sth	%g3,	[%l7 + 0x34]
	tsubcc	%g3,	0x134B,	%g3
	srl	%g3,	0x0B,	%g3
	nop
	fnot2s	%f8,	%f3
	movrgz	%g3,	0x14B,	%g3
	ldd	[%l7 + 0x40],	%f2
	mova	%icc,	%o7,	%g3
	mova	%xcc,	%g7,	%g3
	array16	%g3,	%i7,	%g3
	fnand	%f6,	%f8,	%f14
	stw	%g3,	[%l7 + 0x64]
	fpadd16	%f14,	%f4,	%f0
	fbl,a	%fcc2,	loop_948
	subcc	%g3,	0x0CB7,	%g3
	alignaddr	%g3,	%g3,	%l3
	fmovdvs	%xcc,	%f15,	%f15
loop_948:
	tne	%xcc,	0x0
	fmovsl	%icc,	%f12,	%f3
	fmovdle	%xcc,	%f7,	%f1
	orncc	%l3,	%l3,	%l2
	addcc	%l2,	%l2,	%l4
	movrgz	%l4,	%o6,	%l4
	movneg	%icc,	%g1,	%l4
	subcc	%l4,	0x052F,	%l4
	umul	%l4,	%l4,	%i3
	nop
	fzeros	%f1
	movle	%xcc,	%i3,	%l0
	nop
	addc	%l0,	0x02A3,	%l0
	tl	%xcc,	0x3
	nop
	tle	%icc,	0x4
	fsrc1s	%f1,	%f8
	fmovdpos	%xcc,	%f8,	%f0
	and	%l0,	%o1,	%l0
	ldx	[%l7 + 0x40],	%l0
	stb	%l0,	[%l7 + 0x11]
	taddcctv	%l0,	0x0CE8,	%l0
	nop
	lduh	[%l7 + 0x3A],	%l0
	fbl,a	%fcc2,	loop_949
	for	%f0,	%f12,	%f14
	nop
	srlx	%l0,	%g2,	%l0
loop_949:
	tleu	%icc,	0x2
	taddcctv	%l0,	0x0B03,	%l0
	move	%xcc,	%l0,	%o3
	sth	%o3,	[%l7 + 0x44]
	mulscc	%o3,	0x170D,	%o3
	tl	%xcc,	0x0
	movleu	%xcc,	%i4,	%o3
	ld	[%l7 + 0x44],	%f1
	fmovrdgez	%o3,	%f6,	%f12
	movgu	%icc,	%l1,	%o3
	tgu	%icc,	0x2
	tn	%icc,	0x6
	fzero	%f12
	orcc	%o3,	%o3,	%l6
	tpos	%icc,	0x7
	ld	[%l7 + 0x1C],	%f5
	fmovse	%icc,	%f9,	%f0
	stb	%l6,	[%l7 + 0x51]
	subc	%l6,	%l6,	%l5
	movrne	%l5,	0x16B,	%l5
	mulx	%l5,	%l5,	%o5
	fzeros	%f0
	movn	%xcc,	%g6,	%o5
	fmovsa	%xcc,	%f8,	%f2
	nop
	nop
	fmovdgu	%icc,	%f0,	%f6
	nop
	smul	%o5,	%o5,	%g4
	nop
	tle	%icc,	0x5
	sdivcc	%g4,	0x0F5B,	%g4
	alignaddr	%g4,	%o4,	%g4
	nop
	setx loop_950, %l0, %l1
	jmpl %l1, %g4
	nop
	movvs	%icc,	%i5,	%g4
	stx	%g4,	[%l7 + 0x50]
loop_950:
	fmovdgu	%xcc,	%f4,	%f8
	sdivx	%g4,	0x0A04,	%g4
	lduw	[%l7 + 0x70],	%g4
	ba,a,pn	%icc,	loop_951
	fnor	%f12,	%f8,	%f2
	nop
	umulcc	%g4,	0x1ED0,	%g4
loop_951:
	brlz,a	%g4,	loop_952
	movgu	%xcc,	%g4,	%i2
	sdivx	%i2,	0x1537,	%i2
	orcc	%i2,	%i6,	%i2
loop_952:
	nop
	siam	0x1
	add	%i2,	0x042E,	%i2
	fbg	%fcc0,	loop_953
	andn	%i2,	%i2,	%i1
	ldsb	[%l7 + 0x0C],	%i1
	std	%f2,	[%l7 + 0x20]
loop_953:
	movre	%i1,	%o2,	%i1
	smulcc	%i1,	%i1,	%i0
	fbo	%fcc0,	loop_954
	tge	%icc,	0x0
	addc	%i0,	0x1E79,	%i0
	add	%i0,	%o0,	%i0
loop_954:
	movn	%xcc,	%g5,	%i0
	bcc,a,pt	%xcc,	loop_955
	fbo	%fcc3,	loop_956
	addccc	%i0,	%i0,	%o7
	alignaddrl	%o7,	%g7,	%o7
loop_955:
	tleu	%icc,	0x4
loop_956:
	movn	%xcc,	%o7,	%i7
	andncc	%i7,	%i7,	%g3
	sll	%g3,	0x10,	%g3
	fmovrslz	%g3,	%f5,	%f6
	nop
	ldsb	[%l7 + 0x3E],	%g3
	xnor	%g3,	0x0963,	%g3
	fbuge	%fcc3,	loop_957
	fornot2s	%f6,	%f8,	%f5
	brz,a	%g3,	loop_958
	srax	%g3,	%l3,	%g3
loop_957:
	tsubcc	%g3,	%g3,	%l2
	movg	%icc,	%l2,	%o6
loop_958:
	ldsb	[%l7 + 0x50],	%o6
	bleu,a	loop_959
	movrlz	%o6,	%o6,	%g1
	nop
	setx loop_960, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	fmovs	%f5,	%f6
loop_959:
	brgz,a	%g1,	loop_961
	orncc	%g1,	%l4,	%g1
loop_960:
	movgu	%xcc,	%g1,	%i3
	tsubcc	%i3,	0x0871,	%i3
loop_961:
	smulcc	%i3,	%i3,	%o1
	tpos	%xcc,	0x7
	ldub	[%l7 + 0x49],	%o1
	udivcc	%o1,	0x09EE,	%o1
	taddcc	%o1,	0x12D8,	%o1
	std	%f2,	[%l7 + 0x68]
	subc	%o1,	0x1F28,	%o1
	fcmpes	%fcc1,	%f1,	%f5
	lduw	[%l7 + 0x78],	%o1
	bcs,pn	%xcc,	loop_962
	subcc	%o1,	0x0DC5,	%o1
	orncc	%o1,	%o1,	%g2
	fmovd	%f2,	%f4
loop_962:
	add	%g2,	%l0,	%g2
	nop
	movgu	%icc,	%g2,	%i4
	addc	%i4,	%i4,	%l1
	fbu,a	%fcc3,	loop_963
	fmovsle	%icc,	%f11,	%f7
	fmovdcs	%icc,	%f14,	%f7
	tsubcctv	%l1,	0x06DA,	%l1
loop_963:
	taddcctv	%l1,	%l1,	%o3
	ldsw	[%l7 + 0x44],	%o3
	brz	%o3,	loop_964
	fmovse	%xcc,	%f6,	%f10
	fbule	%fcc2,	loop_965
	movrlez	%o3,	%o3,	%l6
loop_964:
	orcc	%l6,	%l5,	%l6
	smul	%l6,	0x1939,	%l6
loop_965:
	addccc	%l6,	%g6,	%l6
	tvc	%icc,	0x6
	fmul8sux16	%f2,	%f10,	%f6
	fbue	%fcc0,	loop_966
	nop
	movvc	%xcc,	%o5,	%l6
	te	%icc,	0x5
loop_966:
	fcmpd	%fcc2,	%f10,	%f2
	udivcc	%l6,	0x19C0,	%l6
	fexpand	%f10,	%f0
	taddcc	%l6,	0x03FC,	%l6
	fba,a	%fcc0,	loop_967
	tge	%icc,	0x3
	fzero	%f2
	fcmpgt16	%f2,	%f10,	%l6
loop_967:
	lduh	[%l7 + 0x0A],	%l6
	movl	%xcc,	%l6,	%o4
	alignaddrl	%o4,	%o4,	%i5
	bcs,a	%xcc,	loop_968
	alignaddrl	%i5,	%g4,	%i5
	tn	%xcc,	0x6
	fmul8ulx16	%f2,	%f0,	%f2
loop_968:
	addccc	%i5,	%i6,	%i5
	mulx	%i5,	0x0203,	%i5
	tneg	%xcc,	0x3
	sdiv	%i5,	0x1110,	%i5
	udivx	%i5,	0x0F15,	%i5
	ble,a	loop_969
	subc	%i5,	%i5,	%i2
	nop
	popc	0x0C48,	%i2
loop_969:
	nop
	orn	%i2,	0x1AB8,	%i2
	bl,a,pn	%xcc,	loop_970
	nop
	taddcctv	%i2,	%i2,	%o2
	fmovdl	%xcc,	%f0,	%f12
loop_970:
	nop
	srlx	%o2,	0x05,	%o2
	fmovd	%f2,	%f0
	sra	%o2,	0x14,	%o2
	fbule	%fcc0,	loop_971
	fnegd	%f2,	%f4
	bcs,a,pt	%icc,	loop_972
	lduh	[%l7 + 0x62],	%o2
loop_971:
	movgu	%icc,	%o2,	%i1
	movrgz	%i1,	0x005,	%i1
loop_972:
	nop
	fpack32	%f2,	%f12,	%f0
	fnors	%f12,	%f13,	%f2
	fmovsvc	%icc,	%f9,	%f11
	ldd	[%l7 + 0x58],	%f4
	movpos	%icc,	%o0,	%i1
	nop
	fors	%f11,	%f10,	%f4
	fmovdcs	%xcc,	%f11,	%f4
	sllx	%i1,	0x02,	%i1
	movpos	%xcc,	%g5,	%i1
	movl	%xcc,	%i0,	%i1
	ldub	[%l7 + 0x6F],	%i1
	movg	%icc,	%g7,	%i1
	tcs	%xcc,	0x2
	fsrc1	%f0,	%f6
	tpos	%icc,	0x4
	fbo	%fcc1,	loop_973
	ldub	[%l7 + 0x7F],	%i1
	orn	%i1,	0x091A,	%i1
	movleu	%xcc,	%i1,	%o7
loop_973:
	subcc	%o7,	%o7,	%i7
	orncc	%i7,	0x1AA6,	%i7
	fmovdneg	%icc,	%f5,	%f9
	udivx	%i7,	0x1BE3,	%i7
	ldd	[%l7 + 0x68],	%f10
	ta	%xcc,	0x7
	nop
	fandnot2	%f0,	%f12,	%f2
	fblg	%fcc2,	loop_974
	movge	%icc,	%l3,	%i7
	ldsw	[%l7 + 0x14],	%i7
	nop
loop_974:
	fnegs	%f9,	%f15
	ldub	[%l7 + 0x6C],	%i7
	ldx	[%l7 + 0x50],	%i7
	fmovscs	%icc,	%f8,	%f8
	movvs	%xcc,	%i7,	%g3
	sllx	%g3,	%g3,	%l2
	fzero	%f2
	ld	[%l7 + 0x34],	%f14
	nop
	fpackfix	%f2,	%f7
	movvs	%xcc,	%l2,	%o6
	fbuge	%fcc1,	loop_975
	smulcc	%o6,	0x181C,	%o6
	fmovd	%f2,	%f10
	alignaddr	%o6,	%l4,	%o6
loop_975:
	nop
	fmovdvc	%xcc,	%f11,	%f5
	ldsh	[%l7 + 0x4C],	%o6
	nop
	orncc	%o6,	0x1F42,	%o6
	addcc	%o6,	%g1,	%o6
	fnot1s	%f5,	%f2
	tneg	%xcc,	0x5
	udivcc	%o6,	0x0809,	%o6
	tsubcc	%o6,	0x09C5,	%o6
	subccc	%o6,	%i3,	%o6
	ldsb	[%l7 + 0x1D],	%o6
	xorcc	%o6,	0x1CAD,	%o6
	popc	0x07CD,	%o6
	udiv	%o6,	0x0279,	%o6
	taddcc	%o6,	%o6,	%o1
	movre	%o1,	%o1,	%l0
	nop
	tcs	%icc,	0x7
	movl	%xcc,	%g2,	%l0
	fmovrdlz	%l0,	%f14,	%f14
	tge	%icc,	0x5
	array16	%l0,	%i4,	%l0
	movl	%icc,	%l0,	%l1
	fmovdle	%xcc,	%f2,	%f3
	movrlez	%l1,	%l1,	%o3
	sll	%o3,	%l5,	%o3
	fornot2	%f14,	%f0,	%f14
	bpos,a	loop_976
	andncc	%o3,	%g6,	%o3
	tsubcctv	%o3,	%o3,	%o5
	tgu	%xcc,	0x2
loop_976:
	fsrc2s	%f3,	%f12
	fnot1s	%f3,	%f6
	movcc	%xcc,	%l6,	%o5
	movrgez	%o5,	%o5,	%o4
	array16	%o4,	%o4,	%g4
	sth	%g4,	[%l7 + 0x40]
	sll	%g4,	0x00,	%g4
	fmovdgu	%xcc,	%f2,	%f13
	srax	%g4,	%i6,	%g4
	sth	%g4,	[%l7 + 0x26]
	fsrc1s	%f13,	%f13
	brz,a	%g4,	loop_977
	sth	%g4,	[%l7 + 0x66]
	fpsub32s	%f13,	%f13,	%f7
	std	%f14,	[%l7 + 0x68]
loop_977:
	tvs	%xcc,	0x0
	sub	%g4,	0x0F00,	%g4
	tgu	%xcc,	0x5
	ldd	[%l7 + 0x38],	%f2
	faligndata	%f14,	%f2,	%f6
	ld	[%l7 + 0x10],	%f14
	nop
	movrgz	%g4,	%g4,	%i5
	movn	%icc,	%i5,	%i2
	fcmpd	%fcc2,	%f10,	%f12
	st	%f7,	[%l7 + 0x1C]
	udivx	%i2,	0x1F90,	%i2
	movpos	%icc,	%o2,	%i2
	fbu	%fcc1,	loop_978
	stw	%i2,	[%l7 + 0x5C]
	fnors	%f7,	%f1,	%f13
	fornot2	%f12,	%f8,	%f6
loop_978:
	sth	%i2,	[%l7 + 0x5E]
	umulcc	%i2,	%o0,	%i2
	fnot1s	%f13,	%f11
	tg	%icc,	0x6
	tg	%xcc,	0x7
	movge	%icc,	%i2,	%g5
	or	%g5,	%g5,	%i0
	taddcctv	%i0,	%i0,	%g7
	fcmpeq32	%f6,	%f4,	%g7
	tn	%icc,	0x7
	fxnor	%f6,	%f14,	%f12
	movrgz	%g7,	0x141,	%g7
	tneg	%icc,	0x7
	fmovsa	%xcc,	%f7,	%f2
	subc	%g7,	0x05CD,	%g7
	xor	%g7,	0x1E5F,	%g7
	add	%g7,	0x18AC,	%g7
	fbo,a	%fcc3,	loop_979
	array32	%g7,	%i1,	%g7
	xnor	%g7,	0x1777,	%g7
	srl	%g7,	%o7,	%g7
loop_979:
	bcs	loop_980
	tsubcc	%g7,	0x0482,	%g7
	sllx	%g7,	%g7,	%l3
	fmovse	%icc,	%f6,	%f3
loop_980:
	movrne	%l3,	%i7,	%l3
	bcs,a,pn	%icc,	loop_981
	brlz	%l3,	loop_982
	movpos	%icc,	%l3,	%g3
	ldsb	[%l7 + 0x6E],	%g3
loop_981:
	movne	%icc,	%l2,	%g3
loop_982:
	fors	%f3,	%f5,	%f15
	mulscc	%g3,	%l4,	%g3
	tpos	%icc,	0x2
	fzero	%f12
	movl	%xcc,	%g3,	%g1
	xnor	%g1,	%g1,	%i3
	sub	%i3,	%o6,	%i3
	brgez	%i3,	loop_983
	orn	%i3,	0x026D,	%i3
	umul	%i3,	0x0BED,	%i3
	call	loop_984
loop_983:
	smul	%i3,	0x1951,	%i3
	movn	%icc,	%i3,	%o1
	movl	%xcc,	%g2,	%o1
loop_984:
	nop
	ldsb	[%l7 + 0x21],	%o1
	fpack16	%f12,	%f0
	fabss	%f15,	%f12
	subc	%o1,	0x095F,	%o1
	taddcctv	%o1,	%o1,	%i4
	taddcctv	%i4,	%i4,	%l0
	nop
	nop
	stw	%l0,	[%l7 + 0x20]
	movpos	%xcc,	%l0,	%l1
	fpsub16	%f12,	%f8,	%f6
	tg	%icc,	0x5
	nop
	fbge	%fcc2,	loop_985
	fmovrsne	%l1,	%f3,	%f5
	siam	0x3
	fbu	%fcc1,	loop_986
loop_985:
	fmovdn	%xcc,	%f5,	%f4
	movne	%xcc,	%l5,	%l1
	fandnot1	%f6,	%f6,	%f4
loop_986:
	ldd	[%l7 + 0x78],	%f14
	movgu	%xcc,	%g6,	%l1
	movvs	%xcc,	%o3,	%l1
	fba,a	%fcc3,	loop_987
	nop
	movrgez	%l1,	0x10E,	%l1
	sethi	0x11E3,	%l1
loop_987:
	fba	%fcc1,	loop_988
	xorcc	%l1,	%l1,	%l6
	movg	%icc,	%l6,	%o5
	addccc	%o5,	%o5,	%o4
loop_988:
	tsubcctv	%o4,	%o4,	%i6
	movn	%xcc,	%i6,	%g4
	udivcc	%g4,	0x1F53,	%g4
	bleu	loop_989
	faligndata	%f4,	%f14,	%f2
	sub	%g4,	%g4,	%i5
	stx	%i5,	[%l7 + 0x48]
loop_989:
	tgu	%icc,	0x5
	lduh	[%l7 + 0x36],	%i5
	brgz,a	%i5,	loop_990
	fpadd32s	%f4,	%f0,	%f15
	orncc	%i5,	%i5,	%o2
	fmovsne	%xcc,	%f0,	%f3
loop_990:
	movrlz	%o2,	%o2,	%o0
	fxnors	%f3,	%f4,	%f14
	sllx	%o0,	%i2,	%o0
	fcmpne32	%f2,	%f8,	%o0
	movn	%icc,	%o0,	%g5
	ld	[%l7 + 0x6C],	%f5
	fandnot1	%f2,	%f8,	%f12
	move	%icc,	%g5,	%i0
	fcmple32	%f12,	%f0,	%i0
	fcmpgt16	%f12,	%f0,	%i0
	fcmpne16	%f12,	%f8,	%i0
	movcs	%xcc,	%i0,	%i1
	sth	%i1,	[%l7 + 0x3E]
	orncc	%i1,	0x130E,	%i1
	addccc	%i1,	%i1,	%o7
	subccc	%o7,	%o7,	%g7
	fcmpd	%fcc0,	%f4,	%f14
	ldsh	[%l7 + 0x70],	%g7
	addccc	%g7,	%g7,	%i7
	fbge,a	%fcc1,	loop_991
	nop
	lduw	[%l7 + 0x48],	%i7
	bne,a	loop_992
loop_991:
	be,pt	%xcc,	loop_993
	nop
	fble	%fcc3,	loop_994
loop_992:
	ldsw	[%l7 + 0x40],	%i7
loop_993:
	movvc	%icc,	%l3,	%i7
	udivcc	%i7,	0x018B,	%i7
loop_994:
	ldsw	[%l7 + 0x68],	%i7
	movrlez	%i7,	%l2,	%i7
	fble	%fcc0,	loop_995
	fmovsa	%icc,	%f13,	%f2
	fbl,a	%fcc3,	loop_996
	movg	%xcc,	%l4,	%i7
loop_995:
	nop
	fbn	%fcc1,	loop_997
loop_996:
	udiv	%i7,	0x1DC9,	%i7
	fbul,a	%fcc3,	loop_998
	nop
loop_997:
	tg	%icc,	0x6
	fbu,a	%fcc1,	loop_999
loop_998:
	smulcc	%i7,	0x17BD,	%i7
	movcs	%xcc,	%g3,	%i7
	tle	%xcc,	0x5
loop_999:
	smul	%i7,	0x088A,	%i7
	orn	%i7,	%i7,	%g1
	fbo,a	%fcc1,	loop_1000
	movgu	%icc,	%o6,	%g1
	sub	%g1,	0x088C,	%g1
	xor	%g1,	%i3,	%g1
loop_1000:
	fsrc1	%f14,	%f2
	xnorcc	%g1,	0x0091,	%g1
	fblg,a	%fcc1,	loop_1001
	stx	%g1,	[%l7 + 0x10]
	popc	0x0FD6,	%g1
	nop
loop_1001:
	fcmple16	%f14,	%f0,	%g1
	nop
	pdist	%f14,	%f10,	%f10
	taddcc	%g1,	0x07DA,	%g1
	sethi	0x0F5C,	%g1
	sub	%g1,	0x05BC,	%g1
	sth	%g1,	[%l7 + 0x40]
	movvc	%icc,	%g1,	%g2
	fmovrse	%g2,	%f12,	%f0
	xor	%g2,	0x0EBB,	%g2
	udivcc	%g2,	0x0583,	%g2
	bvc	loop_1002
	fmovsle	%xcc,	%f8,	%f3
	movleu	%icc,	%g2,	%o1
	fcmpeq16	%f10,	%f4,	%o1
loop_1002:
	fcmpne32	%f10,	%f6,	%o1
	bge,a,pn	%xcc,	loop_1003
	nop
	fabss	%f3,	%f12
	mulscc	%o1,	%o1,	%i4
loop_1003:
	movrlz	%i4,	%i4,	%l0
	tcs	%xcc,	0x5
	ldub	[%l7 + 0x7A],	%l0
	fbe,a	%fcc3,	loop_1004
	nop
	nop
	sdivcc	%l0,	0x1AE6,	%l0
loop_1004:
	sdivcc	%l0,	0x00B8,	%l0
	fpadd16	%f10,	%f12,	%f12
	ldx	[%l7 + 0x78],	%l0
	ldub	[%l7 + 0x3E],	%l0
	srl	%l0,	%l5,	%l0
	tneg	%xcc,	0x5
	fnot1	%f12,	%f12
	std	%f12,	[%l7 + 0x20]
	movpos	%xcc,	%g6,	%l0
	ldx	[%l7 + 0x10],	%l0
	tge	%xcc,	0x6
	ble,pt	%xcc,	loop_1005
	st	%f3,	[%l7 + 0x48]
	sdivx	%l0,	0x1454,	%l0
	movneg	%xcc,	%l0,	%o3
loop_1005:
	sdiv	%o3,	0x13E9,	%o3
	ldsw	[%l7 + 0x18],	%o3
	andn	%o3,	0x117D,	%o3
	nop
	fbule	%fcc1,	loop_1006
	movne	%xcc,	%l1,	%o3
	fmovse	%icc,	%f12,	%f6
	movgu	%xcc,	%l6,	%o3
loop_1006:
	tg	%xcc,	0x0
	tl	%icc,	0x2
	sdivcc	%o3,	0x1B53,	%o3
	subccc	%o3,	0x09AB,	%o3
	nop
	brlz,a	%o3,	loop_1007
	fpadd16	%f12,	%f10,	%f4
	movneg	%icc,	%o3,	%o5
	ble,a	%icc,	loop_1008
loop_1007:
	addcc	%o5,	%o5,	%o4
	ldsh	[%l7 + 0x5C],	%o4
	xor	%o4,	0x1474,	%o4
loop_1008:
	fmul8x16au	%f6,	%f0,	%f12
	stx	%o4,	[%l7 + 0x68]
	fmuld8ulx16	%f6,	%f9,	%f4
	brlz	%o4,	loop_1009
	xnorcc	%o4,	0x1B24,	%o4
	nop
	mulx	%o4,	0x13BA,	%o4
loop_1009:
	smulcc	%o4,	0x011B,	%o4
	stx	%o4,	[%l7 + 0x58]
	xor	%o4,	%o4,	%i6
	xnorcc	%i6,	%i6,	%g4
	bpos,a	loop_1010
	umul	%g4,	0x1C0C,	%g4
	stx	%g4,	[%l7 + 0x50]
	tg	%xcc,	0x2
loop_1010:
	fmovsneg	%xcc,	%f13,	%f11
	fnegd	%f4,	%f6
	and	%g4,	0x0994,	%g4
	movrgz	%g4,	%i5,	%g4
	andn	%g4,	%o2,	%g4
	fbo,a	%fcc1,	loop_1011
	popc	%g4,	%g4
	fnor	%f4,	%f8,	%f6
	nop
loop_1011:
	alignaddr	%g4,	%g4,	%i2
	tl	%xcc,	0x7
	tpos	%icc,	0x3
	fmovrslez	%i2,	%f5,	%f8
	nop
	orncc	%i2,	0x0B43,	%i2
	lduw	[%l7 + 0x2C],	%i2
	nop
	andcc	%i2,	%o0,	%i2
	andcc	%i2,	0x19BA,	%i2
	nop
	fxors	%f8,	%f7,	%f12
	fmovrslez	%i2,	%f6,	%f1
	fcmple16	%f6,	%f4,	%i2
	udivcc	%i2,	0x09CA,	%i2
	movrlez	%i2,	%g5,	%i2
	sub	%i2,	%i0,	%i2
	fandnot1s	%f1,	%f12,	%f0
	xnor	%i2,	%i2,	%i1
	xnorcc	%i1,	%i1,	%o7
	bl	%icc,	loop_1012
	smul	%o7,	0x0BB3,	%o7
	nop
	brlez	%o7,	loop_1013
loop_1012:
	array8	%o7,	%g7,	%o7
	fandnot1s	%f0,	%f11,	%f4
	array8	%o7,	%l3,	%o7
loop_1013:
	ldsb	[%l7 + 0x37],	%o7
	brnz,a	%o7,	loop_1014
	movvs	%icc,	%o7,	%l2
	fmul8sux16	%f6,	%f6,	%f6
	fbe	%fcc1,	loop_1015
loop_1014:
	tcs	%xcc,	0x7
	movvs	%icc,	%l2,	%l4
	fcmps	%fcc3,	%f13,	%f4
loop_1015:
	tsubcctv	%l4,	%l4,	%g3
	fble,a	%fcc3,	loop_1016
	ldd	[%l7 + 0x50],	%f0
	tle	%icc,	0x2
	bl,a	loop_1017
loop_1016:
	stb	%g3,	[%l7 + 0x23]
	tvc	%xcc,	0x3
	sdiv	%g3,	0x11C1,	%g3
loop_1017:
	fbuge	%fcc1,	loop_1018
	sdivx	%g3,	0x0A29,	%g3
	fxors	%f4,	%f0,	%f15
	fcmpgt32	%f6,	%f10,	%g3
loop_1018:
	array8	%g3,	%i7,	%g3
	tsubcctv	%g3,	%g3,	%o6
	nop
	fmovdneg	%xcc,	%f11,	%f15
	mova	%icc,	%i3,	%o6
	addcc	%o6,	0x1914,	%o6
	movl	%icc,	%g1,	%o6
	fcmpeq16	%f6,	%f12,	%o6
	umulcc	%o6,	%o6,	%g2
	ldx	[%l7 + 0x28],	%g2
	move	%icc,	%o1,	%g2
	fand	%f6,	%f12,	%f14
	fpack32	%f14,	%f12,	%f12
	movrne	%g2,	%i4,	%g2
	fandnot1	%f12,	%f4,	%f0
	fbne	%fcc1,	loop_1019
	tvs	%icc,	0x1
	tcs	%icc,	0x5
	nop
loop_1019:
	nop
	ldub	[%l7 + 0x25],	%g2
	fbul,a	%fcc1,	loop_1020
	lduh	[%l7 + 0x56],	%g2
	bgu,pt	%icc,	loop_1021
	lduh	[%l7 + 0x22],	%g2
loop_1020:
	popc	0x10C5,	%g2
	nop
loop_1021:
	nop
	srlx	%g2,	0x03,	%g2
	fmovdge	%xcc,	%f2,	%f9
	tvc	%icc,	0x1
	fmovdge	%xcc,	%f14,	%f6
	tg	%icc,	0x7
	fmovsneg	%icc,	%f7,	%f0
	movge	%icc,	%l5,	%g2
	xor	%g2,	0x1B31,	%g2
	alignaddr	%g2,	%g6,	%g2
	sethi	0x16A3,	%g2
	fxor	%f0,	%f10,	%f8
	fmovdcc	%xcc,	%f11,	%f4
	movre	%g2,	0x268,	%g2
	bgu,a	loop_1022
	nop
	fmovrdlez	%g2,	%f2,	%f10
	fbu,a	%fcc2,	loop_1023
loop_1022:
	fbue	%fcc0,	loop_1024
	fmovdleu	%icc,	%f0,	%f5
	sllx	%g2,	%g2,	%l0
loop_1023:
	tge	%xcc,	0x0
loop_1024:
	bl,pt	%icc,	loop_1025
	ldsw	[%l7 + 0x50],	%l0
	ldsb	[%l7 + 0x59],	%l0
	movleu	%xcc,	%l1,	%l0
loop_1025:
	fmovrsgz	%l0,	%f14,	%f9
	tleu	%xcc,	0x2
	fmovsgu	%xcc,	%f5,	%f12
	fble	%fcc1,	loop_1026
	movneg	%icc,	%l6,	%l0
	fblg	%fcc1,	loop_1027
	umulcc	%l0,	0x1B5B,	%l0
loop_1026:
	fmovsa	%icc,	%f9,	%f9
	srax	%l0,	%l0,	%o3
loop_1027:
	srax	%o3,	%o3,	%o5
	movgu	%icc,	%o4,	%o5
	ldd	[%l7 + 0x60],	%f8
	tn	%xcc,	0x7
	tle	%xcc,	0x5
	or	%o5,	%i6,	%o5
	ba,pn	%xcc,	loop_1028
	popc	0x1EAC,	%o5
	nop
	nop
loop_1028:
	movvc	%icc,	%i5,	%o5
	taddcc	%o5,	0x05A7,	%o5
	tcs	%icc,	0x7
	udivcc	%o5,	0x1D0F,	%o5
	fcmped	%fcc0,	%f10,	%f4
	tleu	%icc,	0x5
	andncc	%o5,	%o5,	%o2
	xnorcc	%o2,	0x008D,	%o2
	movn	%xcc,	%g4,	%o2
	fcmpne16	%f4,	%f4,	%o2
	fbul	%fcc3,	loop_1029
	fcmple16	%f4,	%f6,	%o2
	fmovsleu	%xcc,	%f9,	%f6
	bge,pn	%icc,	loop_1030
loop_1029:
	fmovdgu	%icc,	%f10,	%f8
	ldd	[%l7 + 0x20],	%f4
	pdist	%f4,	%f0,	%f8
loop_1030:
	smulcc	%o2,	0x1402,	%o2
	sll	%o2,	0x02,	%o2
	fmovsn	%icc,	%f0,	%f5
	smulcc	%o2,	0x0881,	%o2
	subcc	%o2,	%o0,	%o2
	fbule,a	%fcc2,	loop_1031
	for	%f8,	%f2,	%f0
	smul	%o2,	%g5,	%o2
	fbule,a	%fcc1,	loop_1032
loop_1031:
	fandnot2	%f0,	%f4,	%f8
	tg	%xcc,	0x6
	srl	%o2,	0x19,	%o2
loop_1032:
	fba	%fcc3,	loop_1033
	brnz	%o2,	loop_1034
	bg,a	loop_1035
	fba	%fcc3,	loop_1036
loop_1033:
	movrgez	%o2,	%o2,	%i0
loop_1034:
	movle	%icc,	%i0,	%i2
loop_1035:
	fnands	%f5,	%f12,	%f7
loop_1036:
	mulx	%i2,	0x13FB,	%i2
	fmovsleu	%icc,	%f14,	%f13
	sra	%i2,	0x07,	%i2
	smulcc	%i2,	%i1,	%i2
	or	%i2,	%g7,	%i2
	ldsh	[%l7 + 0x5E],	%i2
	lduh	[%l7 + 0x46],	%i2
	popc	0x1B61,	%i2
	and	%i2,	%i2,	%l3
	fpmerge	%f13,	%f1,	%f6
	sethi	0x073F,	%l3
	sll	%l3,	%l3,	%o7
	movle	%icc,	%l2,	%o7
	st	%f13,	[%l7 + 0x3C]
	tpos	%xcc,	0x1
	brlez	%o7,	loop_1037
	nop
	bleu,a	loop_1038
	tg	%xcc,	0x6
loop_1037:
	nop
	sdiv	%o7,	0x0CE5,	%o7
loop_1038:
	sllx	%o7,	%l4,	%o7
	popc	%o7,	%o7
	movrlz	%o7,	%o7,	%i7
	fsrc1	%f6,	%f14
	srl	%i7,	0x1B,	%i7
	te	%icc,	0x2
	andn	%i7,	%g3,	%i7
	tcs	%xcc,	0x5
	nop
	tleu	%xcc,	0x1
	fnot1s	%f13,	%f11
	fbule,a	%fcc0,	loop_1039
	movre	%i7,	0x12A,	%i7
	srax	%i7,	0x17,	%i7
	nop
loop_1039:
	ldsb	[%l7 + 0x59],	%i7
	lduw	[%l7 + 0x50],	%i7
	tge	%icc,	0x3
	alignaddrl	%i7,	%i7,	%i3
	orncc	%i3,	0x1712,	%i3
	taddcc	%i3,	%g1,	%i3
	sdivx	%i3,	0x0783,	%i3
	movrlez	%i3,	%o6,	%i3
	lduh	[%l7 + 0x3C],	%i3
	fmovscc	%icc,	%f8,	%f5
	tvc	%xcc,	0x5
	fpmerge	%f5,	%f15,	%f6
	umul	%i3,	0x14B7,	%i3
	addcc	%i3,	%o1,	%i3
	movrlez	%i3,	%i4,	%i3
	fbne,a	%fcc0,	loop_1040
	fmovdcc	%icc,	%f9,	%f8
	fnegs	%f8,	%f7
	ta	%xcc,	0x1
loop_1040:
	std	%f6,	[%l7 + 0x70]
	tcs	%xcc,	0x3
	sll	%i3,	%i3,	%l5
	brz	%l5,	loop_1041
	fpsub16s	%f8,	%f3,	%f12
	tvs	%xcc,	0x5
	sra	%l5,	%g6,	%l5
loop_1041:
	tcc	%icc,	0x7
	sll	%l5,	%g2,	%l5
	fcmple32	%f6,	%f14,	%l5
	fcmps	%fcc3,	%f15,	%f13
	sth	%l5,	[%l7 + 0x46]
	array8	%l5,	%l1,	%l5
	tsubcc	%l5,	%l6,	%l5
	brnz	%l5,	loop_1042
	subccc	%l5,	0x1E56,	%l5
	udivcc	%l5,	0x177E,	%l5
	fbg	%fcc2,	loop_1043
loop_1042:
	tcs	%xcc,	0x1
	bl	loop_1044
	ldub	[%l7 + 0x2C],	%l5
loop_1043:
	stw	%l5,	[%l7 + 0x24]
	xnor	%l5,	0x028E,	%l5
loop_1044:
	fmovs	%f13,	%f6
	fcmpgt16	%f6,	%f6,	%l5
	fbn	%fcc1,	loop_1045
	movvc	%icc,	%l0,	%l5
	fsrc2	%f6,	%f2
	fxnors	%f13,	%f4,	%f6
loop_1045:
	fsrc1	%f6,	%f10
	fba	%fcc1,	loop_1046
	fmovrde	%l5,	%f6,	%f10
	subcc	%l5,	%l5,	%o3
	sllx	%o3,	%o4,	%o3
loop_1046:
	nop
	tvc	%xcc,	0x5
	sll	%o3,	0x19,	%o3
	ldsb	[%l7 + 0x49],	%o3
	and	%o3,	%i6,	%o3
	ldub	[%l7 + 0x36],	%o3
	fcmpne16	%f10,	%f14,	%o3
	tl	%xcc,	0x5
	tl	%xcc,	0x1
	smulcc	%o3,	0x1E27,	%o3
	fabsd	%f10,	%f12
	sth	%o3,	[%l7 + 0x30]
	alignaddr	%o3,	%o3,	%i5
	tg	%xcc,	0x2
	fcmpd	%fcc1,	%f8,	%f4
	brz,a	%i5,	loop_1047
	tcs	%icc,	0x0
	movn	%icc,	%i5,	%o5
	fxors	%f6,	%f5,	%f10
loop_1047:
	stw	%o5,	[%l7 + 0x40]
	fpadd16	%f4,	%f0,	%f8
	movpos	%icc,	%g4,	%o5
	smulcc	%o5,	0x0DBC,	%o5
	fmovdg	%icc,	%f10,	%f10
	fpsub16s	%f10,	%f4,	%f3
	stx	%o5,	[%l7 + 0x48]
	fmovs	%f3,	%f1
	tcc	%icc,	0x4
	movl	%icc,	%o5,	%o0
	fpadd16s	%f3,	%f12,	%f11
	movge	%icc,	%g5,	%o0
	or	%o0,	%o2,	%o0
	fands	%f11,	%f14,	%f6
	xorcc	%o0,	%i0,	%o0
	fandnot2	%f8,	%f2,	%f0
	st	%f6,	[%l7 + 0x20]
	fpsub16	%f0,	%f8,	%f12
	fmovdgu	%icc,	%f2,	%f2
	movrne	%o0,	0x355,	%o0
	or	%o0,	%o0,	%i1
	xorcc	%i1,	0x1449,	%i1
	sdivx	%i1,	0x057A,	%i1
	fba	%fcc2,	loop_1048
	fmovrde	%i1,	%f12,	%f2
	movne	%xcc,	%i1,	%g7
	ldsw	[%l7 + 0x78],	%g7
loop_1048:
	ldsw	[%l7 + 0x7C],	%g7
	tpos	%xcc,	0x3
	call	loop_1049
	tne	%xcc,	0x2
	tn	%icc,	0x6
	fpadd32s	%f2,	%f5,	%f15
loop_1049:
	popc	%g7,	%g7
	fbue,a	%fcc0,	loop_1050
	stx	%g7,	[%l7 + 0x58]
	ld	[%l7 + 0x3C],	%f6
	stw	%g7,	[%l7 + 0x14]
loop_1050:
	tleu	%icc,	0x5
	tsubcctv	%g7,	%g7,	%i2
	ldub	[%l7 + 0x3F],	%i2
	ldsh	[%l7 + 0x6E],	%i2
	bge	loop_1051
	ldub	[%l7 + 0x36],	%i2
	sllx	%i2,	0x1A,	%i2
	stw	%i2,	[%l7 + 0x6C]
loop_1051:
	movgu	%xcc,	%l3,	%i2
	fbn	%fcc2,	loop_1052
	addcc	%i2,	%i2,	%l2
	fnegs	%f15,	%f12
	bn	loop_1053
loop_1052:
	st	%f15,	[%l7 + 0x50]
	te	%icc,	0x5
	nop
loop_1053:
	udiv	%l2,	0x154D,	%l2
	movg	%icc,	%l4,	%l2
	movn	%xcc,	%l2,	%o7
	alignaddrl	%o7,	%o7,	%g3
	brgz	%g3,	loop_1054
	nop
	udivcc	%g3,	0x1543,	%g3
	udivcc	%g3,	0x1CB5,	%g3
loop_1054:
	fmovrdne	%g3,	%f4,	%f12
	tgu	%xcc,	0x4
	fblg,a	%fcc3,	loop_1055
	bgu,pt	%xcc,	loop_1056
	tsubcc	%g3,	%i7,	%g3
	movrlez	%g3,	0x29A,	%g3
loop_1055:
	andcc	%g3,	%g3,	%g1
loop_1056:
	ldub	[%l7 + 0x50],	%g1
	fcmpgt32	%f12,	%f6,	%g1
	lduh	[%l7 + 0x5E],	%g1
	umul	%g1,	0x09AA,	%g1
	fcmpgt16	%f12,	%f2,	%g1
	umulcc	%g1,	%o6,	%g1
	fmovsneg	%xcc,	%f12,	%f4
	fbg,a	%fcc1,	loop_1057
	srax	%g1,	0x1A,	%g1
	srlx	%g1,	%g1,	%o1
	orncc	%o1,	0x08EC,	%o1
loop_1057:
	tpos	%icc,	0x7
	addcc	%o1,	0x04F1,	%o1
	xorcc	%o1,	0x1447,	%o1
	taddcctv	%o1,	%i4,	%o1
	nop
	fmovdgu	%icc,	%f7,	%f14
	fmovdcc	%xcc,	%f15,	%f11
	ld	[%l7 + 0x3C],	%f5
	ldub	[%l7 + 0x45],	%o1
	nop
	udiv	%o1,	0x09A5,	%o1
	nop
	nop
	movle	%icc,	%i3,	%o1
	ldsb	[%l7 + 0x5E],	%o1
	bshuffle	%f12,	%f12,	%f2
	fornot1s	%f11,	%f9,	%f12
	nop
	lduh	[%l7 + 0x60],	%o1
	ldsh	[%l7 + 0x22],	%o1
	mulscc	%o1,	0x1A8F,	%o1
	lduh	[%l7 + 0x0A],	%o1
	bvs,a	%xcc,	loop_1058
	orn	%o1,	0x1790,	%o1
	fandnot2s	%f12,	%f4,	%f13
	tcc	%icc,	0x7
loop_1058:
	addc	%o1,	0x03CE,	%o1
	fmul8x16	%f13,	%f2,	%f2
	fands	%f13,	%f8,	%f1
	fmovs	%f1,	%f0
	ldx	[%l7 + 0x70],	%o1
	movrgez	%o1,	0x130,	%o1
	nop
	tsubcc	%o1,	0x19EC,	%o1
	fpackfix	%f2,	%f7
	fmovrslz	%o1,	%f2,	%f8
	bn	%xcc,	loop_1059
	sub	%o1,	%g6,	%o1
	fmovdg	%icc,	%f7,	%f11
	xnor	%o1,	0x0180,	%o1
loop_1059:
	fmuld8sux16	%f11,	%f3,	%f4
	tgu	%xcc,	0x4
	sdiv	%o1,	0x0EC8,	%o1
	fbn	%fcc3,	loop_1060
	fmovdcc	%icc,	%f1,	%f5
	fpadd16s	%f5,	%f3,	%f1
	tvs	%xcc,	0x4
loop_1060:
	fblg	%fcc1,	loop_1061
	brz,a	%o1,	loop_1062
	sdivx	%o1,	0x1E58,	%o1
	sll	%o1,	0x07,	%o1
loop_1061:
	array8	%o1,	%o1,	%g2
loop_1062:
	array16	%g2,	%g2,	%l1
	ldx	[%l7 + 0x40],	%l1
	fnors	%f1,	%f8,	%f15
	nop
	setx loop_1063, %l0, %l1
	jmpl %l1, %l1
	ldx	[%l7 + 0x70],	%l1
	bgu,a	%icc,	loop_1064
	movvs	%icc,	%l6,	%l1
loop_1063:
	movvc	%icc,	%l1,	%l0
	tne	%xcc,	0x5
loop_1064:
	fmovrsgez	%l0,	%f0,	%f15
	nop
	setx loop_1065, %l0, %l1
	jmpl %l1, %l0
	popc	%l0,	%l0
	subccc	%l0,	%l5,	%l0
	ldd	[%l7 + 0x58],	%f10
loop_1065:
	std	%f4,	[%l7 + 0x78]
	fmovde	%icc,	%f3,	%f1
	fmovsge	%icc,	%f7,	%f13
	fpadd16	%f4,	%f12,	%f12
	fmovdl	%icc,	%f3,	%f4
	ldsw	[%l7 + 0x30],	%l0
	umul	%l0,	0x1F57,	%l0
	orncc	%l0,	0x1C5C,	%l0
	brgz,a	%l0,	loop_1066
	fmuld8ulx16	%f4,	%f7,	%f6
	fbn	%fcc0,	loop_1067
	fornot2s	%f4,	%f12,	%f8
loop_1066:
	add	%l0,	%l0,	%o4
	nop
loop_1067:
	alignaddr	%o4,	%o4,	%i6
	fmovrdlz	%i6,	%f6,	%f14
	nop
	tpos	%icc,	0x3
	nop
	tcs	%xcc,	0x5
	st	%f8,	[%l7 + 0x60]
	ldsh	[%l7 + 0x4A],	%i6
	xorcc	%i6,	0x01A5,	%i6
	fble,a	%fcc2,	loop_1068
	xorcc	%i6,	0x1B76,	%i6
	fmovrsgez	%i6,	%f11,	%f14
	nop
loop_1068:
	fxnor	%f14,	%f8,	%f2
	ldsh	[%l7 + 0x30],	%i6
	fbug,a	%fcc1,	loop_1069
	tge	%xcc,	0x4
	taddcctv	%i6,	%i6,	%o3
	nop
loop_1069:
	fbuge,a	%fcc3,	loop_1070
	fmovdcc	%xcc,	%f5,	%f11
	movre	%o3,	%i5,	%o3
	tvc	%xcc,	0x4
loop_1070:
	bgu,a,pn	%xcc,	loop_1071
	array16	%o3,	%o3,	%g4
	lduw	[%l7 + 0x20],	%g4
	fpackfix	%f2,	%f11
loop_1071:
	umulcc	%g4,	0x1AD5,	%g4
	movle	%icc,	%g4,	%o5
	fbe,a	%fcc2,	loop_1072
	move	%xcc,	%g5,	%o5
	ld	[%l7 + 0x6C],	%f12
	movcc	%xcc,	%o2,	%o5
loop_1072:
	fabsd	%f2,	%f2
	movrne	%o5,	%o5,	%i0
	fbu,a	%fcc2,	loop_1073
	stx	%i0,	[%l7 + 0x70]
	fzeros	%f11
	te	%icc,	0x5
loop_1073:
	movcc	%xcc,	%o0,	%i0
	orn	%i0,	0x1F91,	%i0
	tle	%icc,	0x2
	brnz	%i0,	loop_1074
	movrgz	%i0,	0x2ED,	%i0
	ldd	[%l7 + 0x28],	%f2
	subccc	%i0,	0x03C3,	%i0
loop_1074:
	xor	%i0,	%i1,	%i0
	udiv	%i0,	0x11B9,	%i0
	fornot1s	%f11,	%f6,	%f11
	brgz,a	%i0,	loop_1075
	fmovdleu	%icc,	%f1,	%f5
	fxnor	%f2,	%f0,	%f6
	ldub	[%l7 + 0x2E],	%i0
loop_1075:
	srl	%i0,	%i0,	%g7
	nop
	lduh	[%l7 + 0x28],	%g7
	fmovdcc	%xcc,	%f13,	%f10
	movvs	%icc,	%l3,	%g7
	andcc	%g7,	%i2,	%g7
	udivx	%g7,	0x082B,	%g7
	fmovrdlz	%g7,	%f12,	%f6
	fornot1s	%f10,	%f0,	%f12
	fcmpd	%fcc1,	%f14,	%f2
	ldd	[%l7 + 0x58],	%f10
	array16	%g7,	%l4,	%g7
	fmovd	%f2,	%f8
	andncc	%g7,	%l2,	%g7
	fmovdne	%icc,	%f11,	%f12
	sdivx	%g7,	0x1F6F,	%g7
	bpos,a	%icc,	loop_1076
	tn	%xcc,	0x6
	subcc	%g7,	0x059D,	%g7
	movvc	%icc,	%o7,	%g7
loop_1076:
	srlx	%g7,	0x07,	%g7
	fpack32	%f2,	%f4,	%f8
	nop
	subc	%g7,	%g7,	%i7
	xorcc	%i7,	%g3,	%i7
	movleu	%icc,	%o6,	%i7
	te	%xcc,	0x1
	nop
	brgz	%i7,	loop_1077
	xorcc	%i7,	%i7,	%g1
	sra	%g1,	0x03,	%g1
	bvc,a	%xcc,	loop_1078
loop_1077:
	popc	%g1,	%g1
	pdist	%f8,	%f12,	%f6
	lduw	[%l7 + 0x6C],	%g1
loop_1078:
	fmovrslz	%g1,	%f12,	%f8
	fbuge,a	%fcc1,	loop_1079
	movrlz	%g1,	%i4,	%g1
	movgu	%icc,	%i3,	%g1
	fbe,a	%fcc1,	loop_1080
loop_1079:
	fpack32	%f6,	%f10,	%f2
	array32	%g1,	%g1,	%g6
	tge	%icc,	0x5
loop_1080:
	movcs	%xcc,	%g6,	%o1
	lduh	[%l7 + 0x5C],	%o1
	movvc	%icc,	%g2,	%o1
	tge	%icc,	0x0
	alignaddr	%o1,	%l6,	%o1
	fabss	%f8,	%f15
	tcc	%icc,	0x1
	array16	%o1,	%o1,	%l1
	addcc	%l1,	%l5,	%l1
	fcmpgt32	%f2,	%f8,	%l1
	st	%f8,	[%l7 + 0x7C]
	add	%l1,	%l1,	%l0
	fsrc2s	%f8,	%f9
	fcmpd	%fcc3,	%f10,	%f0
	bne	loop_1081
	stb	%l0,	[%l7 + 0x79]
	ldsh	[%l7 + 0x44],	%l0
	nop
loop_1081:
	movpos	%icc,	%l0,	%o4
	stw	%o4,	[%l7 + 0x1C]
	bne,a	%xcc,	loop_1082
	lduh	[%l7 + 0x6C],	%o4
	sdivcc	%o4,	0x1713,	%o4
	movrlz	%o4,	%o4,	%i6
loop_1082:
	ld	[%l7 + 0x60],	%f3
	addccc	%i6,	0x0E24,	%i6
	nop
	array8	%i6,	%i6,	%i5
	nop
	setx loop_1083, %l0, %l1
	jmpl %l1, %i5
	add	%i5,	%i5,	%o3
	brgz,a	%o3,	loop_1084
	tneg	%xcc,	0x5
loop_1083:
	brlz	%o3,	loop_1085
	nop
loop_1084:
	tle	%xcc,	0x0
	fcmple16	%f0,	%f0,	%o3
loop_1085:
	te	%icc,	0x4
	lduh	[%l7 + 0x50],	%o3
	fmovscc	%icc,	%f15,	%f13
	fnor	%f0,	%f10,	%f6
	nop
	setx loop_1086, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	ldub	[%l7 + 0x10],	%o3
	fbug,a	%fcc3,	loop_1087
	fcmped	%fcc1,	%f8,	%f12
loop_1086:
	std	%f12,	[%l7 + 0x10]
	ldsw	[%l7 + 0x74],	%o3
loop_1087:
	fmovde	%xcc,	%f9,	%f4
	brnz	%o3,	loop_1088
	ld	[%l7 + 0x58],	%f3
	nop
	subcc	%o3,	0x1650,	%o3
loop_1088:
	array16	%o3,	%g4,	%o3
	nop
	addc	%o3,	0x19E4,	%o3
	bge,pn	%icc,	loop_1089
	movge	%icc,	%o3,	%g5
	brgz,a	%g5,	loop_1090
	movvc	%xcc,	%o2,	%g5
loop_1089:
	ldx	[%l7 + 0x18],	%g5
	movrlez	%g5,	0x1EF,	%g5
loop_1090:
	tcs	%xcc,	0x2
	fpadd16s	%f4,	%f13,	%f11
	fmovsge	%icc,	%f3,	%f9
	movrlz	%g5,	0x274,	%g5
	tsubcc	%g5,	0x0514,	%g5
	sra	%g5,	0x1D,	%g5
	movvc	%xcc,	%g5,	%o5
	taddcctv	%o5,	%o0,	%o5
	nop
	movvc	%xcc,	%o5,	%i1
	movl	%xcc,	%i1,	%i0
	tsubcc	%i0,	%l3,	%i0
	addccc	%i0,	0x122E,	%i0
	sethi	0x05E7,	%i0
	bvc,a	loop_1091
	tg	%xcc,	0x3
	movgu	%icc,	%i0,	%i2
	sethi	0x0D5F,	%i2
loop_1091:
	movl	%xcc,	%l4,	%i2
	movn	%icc,	%i2,	%l2
	tg	%xcc,	0x0
	ldd	[%l7 + 0x68],	%f8
	brgez	%l2,	loop_1092
	movrlez	%l2,	%l2,	%o7
	umul	%o7,	%g7,	%o7
	fornot2s	%f9,	%f15,	%f4
loop_1092:
	ld	[%l7 + 0x38],	%f5
	stw	%o7,	[%l7 + 0x74]
	fbuge	%fcc2,	loop_1093
	srlx	%o7,	0x18,	%o7
	lduw	[%l7 + 0x10],	%o7
	ld	[%l7 + 0x50],	%f0
loop_1093:
	nop
	udiv	%o7,	0x0D1B,	%o7
	srl	%o7,	0x06,	%o7
	fmovrdlz	%o7,	%f0,	%f12
	fmovrdne	%o7,	%f10,	%f10
	mulx	%o7,	%g3,	%o7
	tle	%icc,	0x6
	orncc	%o7,	0x0E82,	%o7
	fblg,a	%fcc2,	loop_1094
	sdivcc	%o7,	0x01C7,	%o7
	fmovrdgez	%o7,	%f14,	%f10
	nop
loop_1094:
	srlx	%o7,	%o7,	%o6
	subcc	%o6,	0x160B,	%o6
	umul	%o6,	0x00DB,	%o6
	stw	%o6,	[%l7 + 0x34]
	movl	%xcc,	%o6,	%i7
	or	%i7,	%i7,	%i4
	array8	%i4,	%i4,	%i3
	array16	%i3,	%g1,	%i3
	brgz,a	%i3,	loop_1095
	orncc	%i3,	%i3,	%g6
	ld	[%l7 + 0x5C],	%f4
	mulx	%g6,	0x13A8,	%g6
loop_1095:
	nop
	fsrc1s	%f4,	%f10
	xnor	%g6,	%g6,	%g2
	fpadd16s	%f4,	%f15,	%f14
	movcs	%icc,	%l6,	%g2
	siam	0x0
	sll	%g2,	0x03,	%g2
	movleu	%icc,	%g2,	%o1
	nop
	nop
	setx loop_1096, %l0, %l1
	jmpl %l1, %o1
	array32	%o1,	%l5,	%o1
	brgz,a	%o1,	loop_1097
	ta	%xcc,	0x0
loop_1096:
	nop
	tvc	%icc,	0x6
loop_1097:
	tsubcc	%o1,	%l1,	%o1
	movgu	%icc,	%o1,	%l0
	sllx	%l0,	0x09,	%l0
	sll	%l0,	%l0,	%o4
	brnz	%o4,	loop_1098
	mulx	%o4,	0x1AAE,	%o4
	fbule	%fcc2,	loop_1099
	ldd	[%l7 + 0x58],	%f10
loop_1098:
	alignaddr	%o4,	%i6,	%o4
	taddcc	%o4,	0x15EB,	%o4
loop_1099:
	movre	%o4,	0x240,	%o4
	movgu	%icc,	%i5,	%o4
	nop
	tsubcc	%o4,	0x160A,	%o4
	ldsh	[%l7 + 0x44],	%o4
	nop
	sth	%o4,	[%l7 + 0x6C]
	brlz	%o4,	loop_1100
	udivcc	%o4,	0x1AE6,	%o4
	movpos	%icc,	%g4,	%o4
	movrgez	%o4,	%o3,	%o4
loop_1100:
	fcmpne16	%f10,	%f14,	%o4
	fmovdpos	%icc,	%f1,	%f1
	ta	%xcc,	0x7
	umulcc	%o4,	0x057B,	%o4
	fmovrsgz	%o4,	%f11,	%f9
	bcc,pt	%xcc,	loop_1101
	fmovdg	%xcc,	%f2,	%f2
	lduw	[%l7 + 0x1C],	%o4
	tsubcctv	%o4,	0x1B53,	%o4
loop_1101:
	movvs	%icc,	%o2,	%o4
	nop
	setx loop_1102, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	fornot1	%f10,	%f10,	%f10
	andcc	%o4,	%g5,	%o4
	nop
loop_1102:
	mulx	%o4,	0x07B1,	%o4
	nop
	setx loop_1103, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	fnegd	%f10,	%f0
	udivx	%o4,	0x0EC9,	%o4
	or	%o4,	%o4,	%o0
loop_1103:
	sethi	0x108F,	%o0
	movrgez	%o0,	0x044,	%o0
	bcc,a	loop_1104
	udivx	%o0,	0x1C86,	%o0
	fbug,a	%fcc0,	loop_1105
	nop
loop_1104:
	popc	0x17E0,	%o0
	fnegs	%f2,	%f1
loop_1105:
	mulx	%o0,	0x0CB1,	%o0
	fmovd	%f10,	%f12
	fbne,a	%fcc0,	loop_1106
	stw	%o0,	[%l7 + 0x08]
	fcmpgt16	%f10,	%f8,	%o0
	ldsw	[%l7 + 0x70],	%o0
loop_1106:
	subc	%o0,	0x1D12,	%o0
	tvc	%icc,	0x3
	taddcc	%o0,	%o0,	%o5
	nop
	nop
	setx loop_1107, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	movneg	%xcc,	%i1,	%o5
	tvc	%xcc,	0x6
	fcmps	%fcc0,	%f9,	%f0
loop_1107:
	movcs	%icc,	%l3,	%o5
	movrne	%o5,	%o5,	%i0
	fnors	%f0,	%f0,	%f8
	fbue	%fcc1,	loop_1108
	tneg	%xcc,	0x4
	xnorcc	%i0,	0x0287,	%i0
	tcc	%icc,	0x5
loop_1108:
	ldd	[%l7 + 0x68],	%f14
	ldsw	[%l7 + 0x3C],	%i0
	smulcc	%i0,	0x06A2,	%i0
	movgu	%xcc,	%i0,	%l4
	fbule,a	%fcc1,	loop_1109
	fmovrslez	%l4,	%f4,	%f14
	fpadd16	%f10,	%f10,	%f10
	ldsb	[%l7 + 0x12],	%l4
loop_1109:
	fmovdn	%xcc,	%f7,	%f10
	nop
	movne	%icc,	%l4,	%i2
	sdivx	%i2,	0x08EB,	%i2
	umul	%i2,	%i2,	%l2
	tsubcc	%l2,	0x0900,	%l2
	bneg	loop_1110
	fmovse	%xcc,	%f13,	%f10
	fmovdvs	%xcc,	%f8,	%f11
	fpadd16s	%f11,	%f10,	%f4
loop_1110:
	movgu	%icc,	%l2,	%g7
	movle	%icc,	%g7,	%g3
	fmovrsgez	%g3,	%f13,	%f8
	nop
	movrgz	%g3,	0x1E1,	%g3
	tvs	%icc,	0x5
	fmuld8sux16	%f8,	%f9,	%f4
	fcmpeq32	%f4,	%f4,	%g3
	andcc	%g3,	%g3,	%o7
	fcmpeq32	%f4,	%f8,	%o7
	nop
	movle	%xcc,	%o7,	%o6
	stw	%o6,	[%l7 + 0x78]
	siam	0x7
	sth	%o6,	[%l7 + 0x32]
	fabss	%f8,	%f7
	sethi	0x1614,	%o6
	fmovrslz	%o6,	%f0,	%f8
	nop
	setx loop_1111, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	sra	%o6,	0x04,	%o6
	fmovdne	%icc,	%f15,	%f5
	bpos,a,pn	%icc,	loop_1112
loop_1111:
	andn	%o6,	0x1D0B,	%o6
	tge	%xcc,	0x7
	addccc	%o6,	0x1F4B,	%o6
loop_1112:
	stb	%o6,	[%l7 + 0x6D]
	array16	%o6,	%i7,	%o6
	fmovsl	%icc,	%f14,	%f4
	srax	%o6,	0x1E,	%o6
	and	%o6,	0x12EA,	%o6
	udivx	%o6,	0x130C,	%o6
	std	%f4,	[%l7 + 0x28]
	taddcc	%o6,	0x1000,	%o6
	fmovdn	%xcc,	%f13,	%f9
	movleu	%icc,	%o6,	%i4
	bpos	loop_1113
	movle	%icc,	%i4,	%g1
	brgz,a	%g1,	loop_1114
	fors	%f9,	%f10,	%f8
loop_1113:
	fmul8sux16	%f4,	%f14,	%f14
	movne	%icc,	%i3,	%g1
loop_1114:
	fble,a	%fcc1,	loop_1115
	st	%f8,	[%l7 + 0x48]
	fandnot2s	%f8,	%f2,	%f3
	orncc	%g1,	%g1,	%g6
loop_1115:
	smulcc	%g6,	0x12E6,	%g6
	move	%xcc,	%g6,	%l6
	fnot2s	%f3,	%f14
	sdivcc	%l6,	0x141E,	%l6
	fpsub32	%f14,	%f12,	%f14
	tcc	%xcc,	0x3
	fmovsn	%icc,	%f15,	%f8
	std	%f14,	[%l7 + 0x78]
	fbn	%fcc1,	loop_1116
	bvs,a,pt	%icc,	loop_1117
	stx	%l6,	[%l7 + 0x70]
	array32	%l6,	%l6,	%g2
loop_1116:
	add	%g2,	0x1114,	%g2
loop_1117:
	fmovdneg	%xcc,	%f1,	%f1
	movleu	%xcc,	%g2,	%l5
	movrlz	%l5,	%l1,	%l5
	movle	%icc,	%o1,	%l5
	udiv	%l5,	0x119D,	%l5
	udivx	%l5,	0x0564,	%l5
	fxor	%f14,	%f8,	%f6
	tne	%icc,	0x0
	array8	%l5,	%l0,	%l5
	movgu	%xcc,	%i6,	%l5
	fmovsvc	%xcc,	%f5,	%f12
	nop
	ta	%xcc,	0x3
	tpos	%xcc,	0x3
	sdivcc	%l5,	0x0810,	%l5
	fsrc1s	%f12,	%f9
	st	%f12,	[%l7 + 0x4C]
	taddcc	%l5,	0x0B65,	%l5
	nop
	fmovdneg	%xcc,	%f12,	%f11
	bl,a,pn	%xcc,	loop_1118
	ba	%icc,	loop_1119
	addcc	%l5,	0x0C7B,	%l5
	fbule	%fcc3,	loop_1120
loop_1118:
	fmovd	%f6,	%f8
loop_1119:
	smul	%l5,	0x0034,	%l5
	nop
loop_1120:
	array16	%l5,	%i5,	%l5
	fmovdne	%xcc,	%f2,	%f9
	nop
	movre	%l5,	%l5,	%g4
	fbue,a	%fcc0,	loop_1121
	movrlz	%g4,	0x32C,	%g4
	bn,a	%icc,	loop_1122
	movrgez	%g4,	0x199,	%g4
loop_1121:
	ldsw	[%l7 + 0x38],	%g4
	umulcc	%g4,	%g4,	%o3
loop_1122:
	fnot1	%f6,	%f10
	fmovsneg	%icc,	%f0,	%f10
	ldx	[%l7 + 0x68],	%o3
	fmovrdlez	%o3,	%f0,	%f6
	brnz	%o3,	loop_1123
	brgez,a	%o3,	loop_1124
	nop
	array32	%o3,	%o2,	%o3
loop_1123:
	nop
loop_1124:
	movvs	%icc,	%o3,	%g5
	smulcc	%g5,	%o4,	%g5
	subcc	%g5,	0x189F,	%g5
	smulcc	%g5,	%g5,	%o0
	tgu	%icc,	0x3
	brnz,a	%o0,	loop_1125
	sth	%o0,	[%l7 + 0x0E]
	stb	%o0,	[%l7 + 0x16]
	for	%f6,	%f0,	%f10
loop_1125:
	movcs	%icc,	%o0,	%i1
	fmovdl	%xcc,	%f6,	%f12
	movl	%xcc,	%l3,	%i1
	ldsw	[%l7 + 0x40],	%i1
	subc	%i1,	0x1368,	%i1
	stb	%i1,	[%l7 + 0x40]
	movpos	%xcc,	%o5,	%i1
	tn	%icc,	0x7
	addcc	%i1,	0x0BE6,	%i1
	nop
	fmovsvc	%xcc,	%f15,	%f6
	movrlz	%i1,	%i1,	%i0
	umulcc	%i0,	%i0,	%l4
	add	%l4,	%i2,	%l4
	stw	%l4,	[%l7 + 0x68]
	ldsb	[%l7 + 0x1C],	%l4
	bpos,pt	%icc,	loop_1126
	fmovscs	%xcc,	%f15,	%f0
	sethi	0x160D,	%l4
	bge	loop_1127
loop_1126:
	fpadd16	%f10,	%f4,	%f0
	tle	%xcc,	0x6
	andncc	%l4,	%l2,	%l4
loop_1127:
	ldd	[%l7 + 0x58],	%f0
	sdiv	%l4,	0x0A06,	%l4
	std	%f0,	[%l7 + 0x68]
	ldub	[%l7 + 0x6C],	%l4
	fble	%fcc2,	loop_1128
	orcc	%l4,	0x1E7B,	%l4
	movrgz	%l4,	0x34E,	%l4
	fsrc1	%f0,	%f14
loop_1128:
	tcc	%icc,	0x7
	movrne	%l4,	%g7,	%l4
	movrgez	%l4,	0x39E,	%l4
	or	%l4,	0x1050,	%l4
	fmovscs	%icc,	%f10,	%f2
	fcmpne16	%f0,	%f2,	%l4
	sth	%l4,	[%l7 + 0x7A]
	movl	%icc,	%g3,	%l4
	movcc	%xcc,	%l4,	%o7
	fpsub16s	%f2,	%f12,	%f0
	movl	%icc,	%o7,	%i7
	sdivcc	%i7,	0x11ED,	%i7
	alignaddrl	%i7,	%o6,	%i7
	fmovsl	%xcc,	%f10,	%f11
	sra	%i7,	0x02,	%i7
	fandnot1s	%f11,	%f9,	%f12
	ldub	[%l7 + 0x53],	%i7
	fmovdleu	%xcc,	%f7,	%f8
	fcmpeq16	%f0,	%f6,	%i7
	fabsd	%f0,	%f12
	fnegs	%f8,	%f5
	brz,a	%i7,	loop_1129
	andncc	%i7,	%i7,	%i4
	movne	%xcc,	%i4,	%i3
	ldsh	[%l7 + 0x6C],	%i3
loop_1129:
	fbue	%fcc2,	loop_1130
	fmovdcc	%icc,	%f15,	%f15
	fmovrdne	%i3,	%f2,	%f14
	mulx	%i3,	%g1,	%i3
loop_1130:
	tne	%icc,	0x7
	alignaddr	%i3,	%g6,	%i3
	sub	%i3,	0x1C86,	%i3
	xor	%i3,	%i3,	%l6
	fbe	%fcc0,	loop_1131
	nop
	fmovrslz	%l6,	%f4,	%f12
	subc	%l6,	%g2,	%l6
loop_1131:
	movre	%l6,	0x001,	%l6
	tsubcctv	%l6,	0x1BF5,	%l6
	orcc	%l6,	0x1C07,	%l6
	fsrc2s	%f12,	%f5
	nop
	setx loop_1132, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
	bge,a	loop_1133
	bcs,pt	%icc,	loop_1134
	fpadd16	%f14,	%f8,	%f6
loop_1132:
	fmovsvc	%xcc,	%f8,	%f10
loop_1133:
	movne	%icc,	%l6,	%l1
loop_1134:
	andncc	%l1,	%l1,	%o1
	fbe	%fcc2,	loop_1135
	nop
	nop
	setx loop_1136, %l0, %l1
	jmpl %l1, %o1
	brz,a	%o1,	loop_1137
loop_1135:
	bne,a	%icc,	loop_1138
	movrlez	%o1,	%l0,	%o1
loop_1136:
	xnor	%o1,	0x0810,	%o1
loop_1137:
	bpos,a,pt	%xcc,	loop_1139
loop_1138:
	orcc	%o1,	0x1FCD,	%o1
	udiv	%o1,	0x14B8,	%o1
	movrlez	%o1,	0x373,	%o1
loop_1139:
	fandnot2s	%f10,	%f10,	%f12
	bcs,a,pn	%xcc,	loop_1140
	fbne	%fcc3,	loop_1141
	movn	%icc,	%o1,	%i6
	bneg	loop_1142
loop_1140:
	ldsh	[%l7 + 0x30],	%i6
loop_1141:
	xnor	%i6,	%i6,	%i5
	movcc	%xcc,	%i5,	%l5
loop_1142:
	fcmpgt32	%f6,	%f14,	%l5
	nop
	movge	%xcc,	%g4,	%l5
	tpos	%xcc,	0x4
	nop
	tle	%icc,	0x3
	bge,a,pt	%icc,	loop_1143
	stx	%l5,	[%l7 + 0x60]
	umul	%l5,	%l5,	%o2
	sll	%o2,	%o2,	%o3
loop_1143:
	movvs	%xcc,	%o4,	%o3
	for	%f6,	%f12,	%f10
	alignaddrl	%o3,	%g5,	%o3
	sth	%o3,	[%l7 + 0x7A]
	sdiv	%o3,	0x0452,	%o3
	fnors	%f12,	%f14,	%f13
	udiv	%o3,	0x10B5,	%o3
	fpsub32s	%f13,	%f3,	%f12
	ta	%xcc,	0x7
	smul	%o3,	0x0978,	%o3
	nop
	nop
	brgez,a	%o3,	loop_1144
	movrne	%o3,	0x2ED,	%o3
	movn	%icc,	%o0,	%o3
	fmovsl	%icc,	%f3,	%f6
loop_1144:
	stw	%o3,	[%l7 + 0x44]
	addcc	%o3,	0x18B5,	%o3
	nop
	tvs	%icc,	0x0
	array8	%o3,	%l3,	%o3
	fmul8x16	%f6,	%f2,	%f12
	movne	%xcc,	%o3,	%o5
	bge,a,pt	%xcc,	loop_1145
	movcc	%icc,	%i1,	%o5
	faligndata	%f12,	%f8,	%f8
	stb	%o5,	[%l7 + 0x54]
loop_1145:
	sethi	0x1D28,	%o5
	addccc	%o5,	0x02A2,	%o5
	mova	%xcc,	%i0,	%o5
	bge,a,pt	%xcc,	loop_1146
	movrlez	%o5,	0x1CF,	%o5
	movneg	%xcc,	%o5,	%i2
	bneg,a	loop_1147
loop_1146:
	xor	%i2,	0x03A4,	%i2
	fmovrslz	%i2,	%f11,	%f1
	subc	%i2,	0x1541,	%i2
loop_1147:
	tl	%icc,	0x5
	alignaddrl	%i2,	%i2,	%l2
	nop
	fbe	%fcc1,	loop_1148
	bge,pn	%icc,	loop_1149
	fsrc1s	%f1,	%f15
	sdivcc	%l2,	0x15F9,	%l2
loop_1148:
	fmovsn	%icc,	%f5,	%f2
loop_1149:
	taddcctv	%l2,	0x0AAF,	%l2
	fmovdl	%icc,	%f6,	%f9
	fpsub32s	%f9,	%f13,	%f15
	fbne	%fcc3,	loop_1150
	orncc	%l2,	%g7,	%l2
	fbg,a	%fcc1,	loop_1151
	bne,a,pt	%icc,	loop_1152
loop_1150:
	bvc	loop_1153
	ldx	[%l7 + 0x68],	%l2
loop_1151:
	movge	%xcc,	%g3,	%l2
loop_1152:
	te	%icc,	0x1
loop_1153:
	tg	%xcc,	0x5
	call	loop_1154
	mulscc	%l2,	0x166F,	%l2
	fpadd16	%f8,	%f8,	%f6
	nop
loop_1154:
	fmovrsne	%l2,	%f3,	%f2
	fmovsleu	%xcc,	%f13,	%f13
	fpadd32	%f6,	%f14,	%f12
	fbe	%fcc1,	loop_1155
	sra	%l2,	0x09,	%l2
	ldsb	[%l7 + 0x1A],	%l2
	udivcc	%l2,	0x0D69,	%l2
loop_1155:
	orn	%l2,	0x0824,	%l2
	sdivx	%l2,	0x0C38,	%l2
	fandnot1	%f12,	%f8,	%f12
	alignaddrl	%l2,	%l4,	%l2
	movg	%icc,	%o7,	%l2
	tcc	%icc,	0x7
	movpos	%xcc,	%l2,	%o6
	array32	%o6,	%o6,	%i7
	tg	%icc,	0x3
	fbule	%fcc0,	loop_1156
	movcs	%xcc,	%i7,	%i4
	and	%i4,	%g1,	%i4
	tne	%xcc,	0x1
loop_1156:
	bpos,pn	%icc,	loop_1157
	movne	%xcc,	%g6,	%i4
	st	%f13,	[%l7 + 0x10]
	fmovdle	%icc,	%f15,	%f9
loop_1157:
	orcc	%i4,	%i4,	%i3
	nop
	fnot1s	%f9,	%f15
	subccc	%i3,	%i3,	%g2
	umulcc	%g2,	%g2,	%l6
	movl	%icc,	%l1,	%l6
	array8	%l6,	%l0,	%l6
	movcs	%xcc,	%o1,	%l6
	sth	%l6,	[%l7 + 0x7E]
	addccc	%l6,	0x1865,	%l6
	ldx	[%l7 + 0x40],	%l6
	fandnot1s	%f9,	%f13,	%f11
	fmul8sux16	%f12,	%f12,	%f4
	st	%f11,	[%l7 + 0x70]
	movrlez	%l6,	0x23D,	%l6
	movpos	%icc,	%l6,	%i6
	nop
	nop
	fbul	%fcc1,	loop_1158
	bg,a	loop_1159
	stx	%i6,	[%l7 + 0x30]
	udivx	%i6,	0x0D9A,	%i6
loop_1158:
	fmovsneg	%icc,	%f12,	%f15
loop_1159:
	mulscc	%i6,	0x07DF,	%i6
	orncc	%i6,	%i5,	%i6
	fmovsl	%icc,	%f3,	%f8
	alignaddrl	%i6,	%i6,	%g4
	brnz,a	%g4,	loop_1160
	std	%f4,	[%l7 + 0x30]
	movrne	%g4,	%g4,	%l5
	fnot1	%f4,	%f8
loop_1160:
	fmovrsne	%l5,	%f10,	%f11
	tcc	%xcc,	0x2
	fcmpeq32	%f4,	%f10,	%l5
	or	%l5,	0x01FC,	%l5
	sra	%l5,	%o2,	%l5
	orncc	%l5,	0x00C9,	%l5
	tn	%xcc,	0x6
	stb	%l5,	[%l7 + 0x71]
	subccc	%l5,	0x002E,	%l5
	array32	%l5,	%o4,	%l5
	fbuge	%fcc3,	loop_1161
	tge	%icc,	0x6
	ldd	[%l7 + 0x28],	%f2
	fmuld8ulx16	%f11,	%f11,	%f10
loop_1161:
	ldsh	[%l7 + 0x48],	%l5
	fors	%f11,	%f7,	%f12
	movleu	%xcc,	%g5,	%l5
	udiv	%l5,	0x1D3B,	%l5
	ldsb	[%l7 + 0x4E],	%l5
	add	%l5,	0x174F,	%l5
	sdiv	%l5,	0x1B83,	%l5
	bcs,a	%icc,	loop_1162
	alignaddr	%l5,	%l5,	%o0
	stx	%o0,	[%l7 + 0x70]
	fcmpgt32	%f10,	%f2,	%o0
loop_1162:
	fornot1s	%f12,	%f13,	%f15
	tl	%xcc,	0x0
	nop
	ldd	[%l7 + 0x60],	%f6
	ldx	[%l7 + 0x08],	%o0
	movleu	%xcc,	%l3,	%o0
	movne	%icc,	%o3,	%o0
	addc	%o0,	0x0BCB,	%o0
	bne,a,pt	%xcc,	loop_1163
	fpadd32s	%f15,	%f15,	%f4
	array32	%o0,	%o0,	%i1
	ldub	[%l7 + 0x41],	%i1
loop_1163:
	xor	%i1,	%i0,	%i1
	movrlz	%i1,	0x18B,	%i1
	movne	%xcc,	%o5,	%i1
	move	%icc,	%i2,	%i1
	tvs	%icc,	0x1
	movge	%icc,	%g7,	%i1
	or	%i1,	%i1,	%g3
	lduh	[%l7 + 0x0E],	%g3
	fpsub16	%f10,	%f6,	%f6
	array16	%g3,	%g3,	%l4
	tge	%icc,	0x2
	te	%xcc,	0x0
	sdiv	%l4,	0x0F4A,	%l4
	orn	%l4,	%l4,	%o7
	tcc	%icc,	0x6
	movgu	%icc,	%o7,	%l2
	brnz	%l2,	loop_1164
	tcs	%icc,	0x6
	tne	%icc,	0x4
	movrne	%l2,	0x23E,	%l2
loop_1164:
	movpos	%icc,	%l2,	%o6
	popc	%o6,	%o6
	xnor	%o6,	0x1D0A,	%o6
	ldd	[%l7 + 0x48],	%f2
	faligndata	%f6,	%f10,	%f0
	taddcctv	%o6,	%o6,	%i7
	fcmpes	%fcc3,	%f12,	%f10
	tneg	%xcc,	0x3
	ba	loop_1165
	lduw	[%l7 + 0x20],	%i7
	lduh	[%l7 + 0x42],	%i7
	nop
loop_1165:
	nop
	ldsb	[%l7 + 0x31],	%i7
	fpsub32s	%f10,	%f14,	%f10
	brgz,a	%i7,	loop_1166
	fandnot1s	%f10,	%f13,	%f1
	fmovsgu	%icc,	%f8,	%f11
	movgu	%icc,	%i7,	%g1
loop_1166:
	tcs	%xcc,	0x2
	nop
	nop
	movrne	%g1,	%g6,	%g1
	or	%g1,	%i4,	%g1
	sdivx	%g1,	0x017B,	%g1
	sethi	0x19D1,	%g1
	fcmped	%fcc0,	%f2,	%f4
	sra	%g1,	0x00,	%g1
	fbul	%fcc1,	loop_1167
	ldsb	[%l7 + 0x35],	%g1
	fmovrse	%g1,	%f14,	%f6
	fmovdne	%xcc,	%f12,	%f7
loop_1167:
	movrgz	%g1,	%g1,	%i3
	fbule	%fcc2,	loop_1168
	bleu,a	%icc,	loop_1169
	andncc	%i3,	%g2,	%i3
	srax	%i3,	%l1,	%i3
loop_1168:
	movg	%xcc,	%i3,	%l0
loop_1169:
	ta	%xcc,	0x6
	fbge	%fcc3,	loop_1170
	tleu	%xcc,	0x7
	nop
	fandnot2	%f4,	%f14,	%f6
loop_1170:
	siam	0x0
	movpos	%xcc,	%l0,	%o1
	tvs	%icc,	0x5
	brz,a	%o1,	loop_1171
	stb	%o1,	[%l7 + 0x70]
	tvs	%xcc,	0x1
	srl	%o1,	%l6,	%o1
loop_1171:
	movcc	%xcc,	%i5,	%o1
	st	%f7,	[%l7 + 0x5C]
	movn	%xcc,	%o1,	%i6
	fmul8ulx16	%f6,	%f2,	%f10
	nop
	orn	%i6,	0x1E38,	%i6
	sll	%i6,	0x01,	%i6
	orcc	%i6,	0x1BC1,	%i6
	fmovrslz	%i6,	%f5,	%f9
	fpadd16	%f10,	%f12,	%f0
	xnorcc	%i6,	%i6,	%g4
	nop
	nop
	bg,a,pt	%icc,	loop_1172
	movle	%xcc,	%g4,	%o2
	nop
	nop
loop_1172:
	fbo,a	%fcc2,	loop_1173
	nop
	orncc	%o2,	0x1486,	%o2
	tsubcc	%o2,	%o4,	%o2
loop_1173:
	fmovdcs	%icc,	%f8,	%f7
	add	%o2,	0x05EF,	%o2
	orn	%o2,	0x16DE,	%o2
	nop
	movrlz	%o2,	%g5,	%o2
	movrlz	%o2,	0x2FF,	%o2
	fmovsa	%icc,	%f1,	%f1
	fmovrdlez	%o2,	%f0,	%f10
	movrgz	%o2,	%o2,	%l5
	fbge	%fcc1,	loop_1174
	bcs,a,pt	%xcc,	loop_1175
	move	%icc,	%l5,	%l3
	fbu,a	%fcc3,	loop_1176
loop_1174:
	nop
loop_1175:
	addcc	%l3,	0x02DA,	%l3
	nop
loop_1176:
	fmovsg	%icc,	%f9,	%f13
	ldx	[%l7 + 0x58],	%l3
	fbo,a	%fcc3,	loop_1177
	movrlez	%l3,	0x040,	%l3
	fpsub32	%f10,	%f14,	%f14
	tge	%icc,	0x1
loop_1177:
	ldsh	[%l7 + 0x20],	%l3
	subcc	%l3,	%o3,	%l3
	for	%f14,	%f14,	%f6
	bg,pt	%xcc,	loop_1178
	stx	%l3,	[%l7 + 0x38]
	fornot1s	%f13,	%f15,	%f6
	fpack32	%f6,	%f6,	%f10
loop_1178:
	fpadd32	%f10,	%f14,	%f8
	sll	%l3,	%l3,	%o0
	nop
	movrlz	%o0,	%i0,	%o0
	fexpand	%f6,	%f8
	movrne	%o0,	0x025,	%o0
	fcmped	%fcc2,	%f8,	%f14
	ldsw	[%l7 + 0x0C],	%o0
	sub	%o0,	0x1231,	%o0
	popc	%o0,	%o0
	fpmerge	%f6,	%f10,	%f10
	ld	[%l7 + 0x5C],	%f11
	fbg	%fcc2,	loop_1179
	fbu,a	%fcc2,	loop_1180
	subcc	%o0,	%o0,	%o5
	xnorcc	%o5,	%o5,	%i2
loop_1179:
	fbne,a	%fcc0,	loop_1181
loop_1180:
	srlx	%i2,	0x14,	%i2
	te	%xcc,	0x4
	movrgz	%i2,	%g7,	%i2
loop_1181:
	fpsub32	%f10,	%f4,	%f10
	sllx	%i2,	%i2,	%i1
	movcs	%xcc,	%i1,	%g3
	fmovde	%icc,	%f7,	%f10
	bcs,a	loop_1182
	fmovdgu	%icc,	%f14,	%f8
	sdivcc	%g3,	0x0ACD,	%g3
	fcmpne32	%f10,	%f4,	%g3
loop_1182:
	fnegd	%f10,	%f12
	fbule	%fcc3,	loop_1183
	srlx	%g3,	0x01,	%g3
	fmovdcs	%icc,	%f2,	%f4
	fcmpeq16	%f10,	%f6,	%g3
loop_1183:
	bvs,a,pt	%icc,	loop_1184
	ld	[%l7 + 0x20],	%f12
	sdivx	%g3,	0x1B9D,	%g3
	sth	%g3,	[%l7 + 0x10]
loop_1184:
	smulcc	%g3,	%g3,	%l4
	nop
	smulcc	%l4,	0x0E2B,	%l4
	bl,a	loop_1185
	fcmpeq16	%f10,	%f0,	%l4
	nop
	fnot2s	%f4,	%f3
loop_1185:
	smul	%l4,	%o7,	%l4
	fbule	%fcc2,	loop_1186
	tneg	%icc,	0x5
	nop
	fmovda	%xcc,	%f14,	%f13
loop_1186:
	movl	%xcc,	%l2,	%l4
	movl	%icc,	%l4,	%o6
	fmul8x16al	%f13,	%f11,	%f4
	fmul8ulx16	%f4,	%f8,	%f12
	tne	%xcc,	0x6
	movle	%icc,	%i7,	%o6
	sllx	%o6,	%o6,	%g6
	movrlz	%g6,	0x289,	%g6
	tneg	%icc,	0x1
	alignaddrl	%g6,	%g6,	%i4
	bcs	%icc,	loop_1187
	movpos	%icc,	%i4,	%g1
	mova	%icc,	%g1,	%g2
	ldsb	[%l7 + 0x58],	%g2
loop_1187:
	stb	%g2,	[%l7 + 0x33]
	addcc	%g2,	%g2,	%l1
	tsubcc	%l1,	0x062A,	%l1
	nop
	bleu,pt	%xcc,	loop_1188
	movge	%icc,	%l1,	%i3
	fmovsneg	%icc,	%f1,	%f15
	fbule,a	%fcc3,	loop_1189
loop_1188:
	xorcc	%i3,	0x0F07,	%i3
	stb	%i3,	[%l7 + 0x7D]
	mova	%icc,	%i3,	%l0
loop_1189:
	fmovdn	%icc,	%f11,	%f0
	fba,a	%fcc3,	loop_1190
	popc	%l0,	%l0
	fmovsgu	%xcc,	%f15,	%f7
	udivx	%l0,	0x0C34,	%l0
loop_1190:
	movgu	%xcc,	%l0,	%l6
	tpos	%xcc,	0x4
	popc	%l6,	%l6
	fmovdvs	%xcc,	%f9,	%f0
	nop
	fmovscs	%icc,	%f4,	%f4
	fcmpgt16	%f12,	%f0,	%l6
	ldsb	[%l7 + 0x63],	%l6
	fnot2	%f12,	%f4
	sth	%l6,	[%l7 + 0x60]
	taddcctv	%l6,	0x0600,	%l6
	fmuld8ulx16	%f4,	%f2,	%f4
	tge	%icc,	0x2
	xnor	%l6,	0x12B7,	%l6
	sdiv	%l6,	0x0C89,	%l6
	taddcc	%l6,	%l6,	%i5
	alignaddrl	%i5,	%o1,	%i5
	tsubcctv	%i5,	%i6,	%i5
	bcc,pt	%icc,	loop_1191
	fmovrsgz	%i5,	%f5,	%f7
	umul	%i5,	%g4,	%i5
	smulcc	%i5,	0x0399,	%i5
loop_1191:
	fmovdleu	%icc,	%f10,	%f1
	fmul8sux16	%f4,	%f14,	%f6
	sub	%i5,	0x1108,	%i5
	bn,a,pt	%icc,	loop_1192
	faligndata	%f6,	%f4,	%f14
	tsubcc	%i5,	%i5,	%o4
	sllx	%o4,	%o4,	%g5
loop_1192:
	brlz,a	%g5,	loop_1193
	fmul8x16	%f1,	%f0,	%f6
	fmovsle	%xcc,	%f14,	%f15
	fmovsl	%icc,	%f15,	%f4
loop_1193:
	nop
	fcmpes	%fcc3,	%f8,	%f13
	andcc	%g5,	%g5,	%o2
	addc	%o2,	%o2,	%l5
	fmovsne	%icc,	%f8,	%f0
	stw	%l5,	[%l7 + 0x0C]
	xnorcc	%l5,	%l5,	%o3
	movle	%xcc,	%o3,	%l3
	movgu	%xcc,	%i0,	%l3
	array8	%l3,	%l3,	%o0
	array16	%o0,	%o5,	%o0
	addccc	%o0,	0x0897,	%o0
	nop
	fmovdge	%xcc,	%f6,	%f14
	movre	%o0,	0x306,	%o0
	tgu	%xcc,	0x5
	array32	%o0,	%o0,	%g7
	umul	%g7,	%i2,	%g7
	ldsw	[%l7 + 0x7C],	%g7
	movrlz	%g7,	0x2B0,	%g7
	nop
	ldsw	[%l7 + 0x58],	%g7
	fbl,a	%fcc1,	loop_1194
	orn	%g7,	%g7,	%i1
	fbo	%fcc3,	loop_1195
	movgu	%icc,	%i1,	%g3
loop_1194:
	stx	%g3,	[%l7 + 0x08]
	srax	%g3,	0x05,	%g3
loop_1195:
	fmovrdgez	%g3,	%f6,	%f6
	movvc	%icc,	%g3,	%o7
	sra	%o7,	0x14,	%o7
	be,a,pt	%icc,	loop_1196
	fandnot1	%f6,	%f4,	%f12
	tne	%xcc,	0x0
	or	%o7,	0x177A,	%o7
loop_1196:
	addc	%o7,	0x16E9,	%o7
	movrlez	%o7,	%l2,	%o7
	mulscc	%o7,	%o7,	%l4
	srl	%l4,	%i7,	%l4
	array32	%l4,	%l4,	%o6
	bleu,a	%xcc,	loop_1197
	brnz,a	%o6,	loop_1198
	ldx	[%l7 + 0x40],	%o6
	movge	%xcc,	%g6,	%o6
loop_1197:
	tg	%icc,	0x5
loop_1198:
	fnot1s	%f14,	%f6
	alignaddr	%o6,	%i4,	%o6
	udivcc	%o6,	0x0CCA,	%o6
	srlx	%o6,	%o6,	%g1
	movge	%icc,	%g2,	%g1
	fmuld8ulx16	%f14,	%f6,	%f8
	andcc	%g1,	0x1878,	%g1
	stw	%g1,	[%l7 + 0x40]
	movvc	%xcc,	%g1,	%l1
	fbge	%fcc2,	loop_1199
	ldsh	[%l7 + 0x2E],	%l1
	movre	%l1,	0x377,	%l1
	mulscc	%l1,	%l1,	%i3
loop_1199:
	subccc	%i3,	%i3,	%l0
	tcc	%xcc,	0x1
	fandnot2s	%f14,	%f1,	%f6
	te	%icc,	0x3
	ldub	[%l7 + 0x38],	%l0
	nop
	bvs,pt	%xcc,	loop_1200
	tvs	%icc,	0x6
	stx	%l0,	[%l7 + 0x08]
	te	%icc,	0x6
loop_1200:
	xnorcc	%l0,	0x0933,	%l0
	add	%l0,	%l0,	%l6
	fbn,a	%fcc3,	loop_1201
	ba	%xcc,	loop_1202
	sdiv	%l6,	0x063B,	%l6
	taddcc	%l6,	0x1786,	%l6
loop_1201:
	tneg	%icc,	0x5
loop_1202:
	sllx	%l6,	0x1D,	%l6
	ldsh	[%l7 + 0x38],	%l6
	fblg	%fcc0,	loop_1203
	fmovrsne	%l6,	%f10,	%f8
	fnors	%f8,	%f10,	%f12
	sdiv	%l6,	0x195A,	%l6
loop_1203:
	orncc	%l6,	%l6,	%o1
	pdist	%f8,	%f10,	%f4
	movpos	%xcc,	%o1,	%i6
	brgz,a	%i6,	loop_1204
	nop
	te	%xcc,	0x7
	!movrlz	%i6,	%g4,	%i6
loop_1204:
	tsubcctv	%i6,	%i6,	%i5
	ldub	[%l7 + 0x6E],	%i5
	fmovscc	%xcc,	%f0,	%f0
	ldx	[%l7 + 0x30],	%i5
	srl	%i5,	0x16,	%i5
	orncc	%i5,	0x15BF,	%i5
	movrlz	%i5,	0x1C6,	%i5
	ldsh	[%l7 + 0x42],	%i5
	andcc	%i5,	%i5,	%o4
	nop
	umul	%o4,	0x1407,	%o4
	ldsw	[%l7 + 0x68],	%o4
	ble,a	%xcc,	loop_1205
	andcc	%o4,	%o4,	%g5
	fmovsvs	%icc,	%f6,	%f7
	movgu	%xcc,	%g5,	%o2
loop_1205:
	movvs	%icc,	%o2,	%l5
	and	%l5,	%l5,	%o3
	add	%o3,	%o3,	%i0
	stb	%i0,	[%l7 + 0x1D]
	st	%f7,	[%l7 + 0x70]
	fbule,a	%fcc1,	loop_1206
	st	%f7,	[%l7 + 0x58]
	umul	%i0,	0x13D4,	%i0
	fba,a	%fcc1,	loop_1207
loop_1206:
	sdivcc	%i0,	0x0B26,	%i0
	alignaddr	%i0,	%i0,	%l3
	ldsw	[%l7 + 0x70],	%l3
loop_1207:
	tgu	%icc,	0x4
	fba	%fcc1,	loop_1208
	movl	%icc,	%l3,	%o5
	nop
	setx loop_1209, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	xnor	%o5,	0x12EB,	%o5
loop_1208:
	udivcc	%o5,	0x1C76,	%o5
	sethi	0x1E6E,	%o5
loop_1209:
	fmovrdne	%o5,	%f4,	%f10
	fmovrslez	%o5,	%f0,	%f5
	std	%f10,	[%l7 + 0x28]
	xor	%o5,	%o5,	%o0
	fbne,a	%fcc3,	loop_1210
	srax	%o0,	0x01,	%o0
	or	%o0,	%o0,	%i2
	movgu	%xcc,	%i2,	%g7
loop_1210:
	movpos	%xcc,	%i1,	%g7
	addccc	%g7,	0x0F41,	%g7
	brlez,a	%g7,	loop_1211
	fbe	%fcc3,	loop_1212
	and	%g7,	0x1C6A,	%g7
	stx	%g7,	[%l7 + 0x38]
loop_1211:
	fmul8x16	%f5,	%f6,	%f4
loop_1212:
	alignaddrl	%g7,	%g7,	%g3
	andn	%g3,	%l2,	%g3
	nop
	addccc	%g3,	%o7,	%g3
	mulx	%g3,	0x1F21,	%g3
	fnors	%f5,	%f1,	%f5
	fbe,a	%fcc3,	loop_1213
	for	%f4,	%f8,	%f8
	xnorcc	%g3,	%i7,	%g3
	taddcctv	%g3,	0x0D2D,	%g3
loop_1213:
	ldx	[%l7 + 0x70],	%g3
	array16	%g3,	%g3,	%l4
	tleu	%icc,	0x0
	array16	%l4,	%g6,	%l4
	nop
	movvc	%xcc,	%l4,	%i4
	ldx	[%l7 + 0x28],	%i4
	movleu	%xcc,	%i4,	%o6
	ldd	[%l7 + 0x20],	%f10
	sth	%o6,	[%l7 + 0x34]
	fnand	%f8,	%f0,	%f2
	subcc	%o6,	%g2,	%o6
	tge	%xcc,	0x0
	ldsh	[%l7 + 0x2A],	%o6
	fmovscs	%xcc,	%f9,	%f2
	smulcc	%o6,	0x05AE,	%o6
	movvc	%icc,	%o6,	%g1
	movrlz	%g1,	%g1,	%l1
	fbe,a	%fcc1,	loop_1214
	fnot2	%f2,	%f0
	nop
	setx loop_1215, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
	fnands	%f2,	%f7,	%f10
loop_1214:
	faligndata	%f2,	%f2,	%f2
	fpsub16	%f2,	%f2,	%f12
loop_1215:
	fmovsvc	%xcc,	%f7,	%f2
	tcs	%xcc,	0x5
	fbul,a	%fcc0,	loop_1216
	nop
	bcc	%icc,	loop_1217
	mulscc	%l1,	%l1,	%i3
loop_1216:
	movge	%icc,	%i3,	%l0
	fcmpne32	%f12,	%f14,	%l0
loop_1217:
	bvc,a	loop_1218
	udivx	%l0,	0x153F,	%l0
	nop
	movleu	%icc,	%l6,	%l0
loop_1218:
	sdiv	%l0,	0x15FA,	%l0
	tg	%icc,	0x3
	movvs	%xcc,	%l0,	%o1
	movrgz	%o1,	%g4,	%o1
	ldsb	[%l7 + 0x16],	%o1
	stx	%o1,	[%l7 + 0x20]
	fsrc2s	%f2,	%f13
	fxors	%f2,	%f13,	%f3
	bn,a	%icc,	loop_1219
	orncc	%o1,	%o1,	%i6
	fornot2	%f12,	%f14,	%f10
	fmuld8sux16	%f3,	%f8,	%f8
loop_1219:
	movvc	%icc,	%i6,	%i5
	or	%i5,	0x1B46,	%i5
	ldx	[%l7 + 0x70],	%i5
	tleu	%icc,	0x2
	array32	%i5,	%o4,	%i5
	sub	%i5,	%i5,	%g5
	sdivcc	%g5,	0x00A5,	%g5
	brlez	%g5,	loop_1220
	tsubcc	%g5,	0x1921,	%g5
	sdiv	%g5,	0x180C,	%g5
	sdivcc	%g5,	0x1310,	%g5
loop_1220:
	xnor	%g5,	0x1577,	%g5
	ba,a,pn	%xcc,	loop_1221
	ldsh	[%l7 + 0x7A],	%g5
	fbe,a	%fcc0,	loop_1222
	fmovscs	%xcc,	%f4,	%f13
loop_1221:
	add	%g5,	0x1B2C,	%g5
	stx	%g5,	[%l7 + 0x38]
loop_1222:
	movrne	%g5,	%o2,	%g5
	xnor	%g5,	0x04BA,	%g5
	movle	%icc,	%g5,	%l5
	smulcc	%l5,	%l5,	%o3
	fandnot2s	%f13,	%f14,	%f15
	movrlz	%o3,	0x2EF,	%o3
	fmuld8sux16	%f15,	%f4,	%f6
	fble,a	%fcc2,	loop_1223
	sllx	%o3,	%i0,	%o3
	nop
	movne	%xcc,	%o3,	%l3
loop_1223:
	andncc	%l3,	%o5,	%l3
	ld	[%l7 + 0x34],	%f15
	nop
	tleu	%xcc,	0x3
	movl	%icc,	%o0,	%l3
	fnot1s	%f15,	%f4
	nop
	movne	%xcc,	%i2,	%l3
	subc	%l3,	%l3,	%i1
	udivx	%i1,	0x1B46,	%i1
	tpos	%xcc,	0x0
	ldsb	[%l7 + 0x6E],	%i1
	array16	%i1,	%g7,	%i1
	fbn,a	%fcc3,	loop_1224
	taddcc	%i1,	%i1,	%l2
	ldd	[%l7 + 0x20],	%f12
	nop
loop_1224:
	orncc	%l2,	%o7,	%l2
	fbu,a	%fcc3,	loop_1225
	lduw	[%l7 + 0x3C],	%l2
	fcmpeq16	%f6,	%f6,	%l2
	nop
	setx loop_1226, %l0, %l1
	jmpl %l1, %l2
loop_1225:
	sllx	%l2,	%l2,	%i7
	movg	%icc,	%i7,	%g3
	nop
loop_1226:
	srl	%g3,	0x1D,	%g3
	fmovdpos	%xcc,	%f11,	%f13
	fcmpeq16	%f6,	%f8,	%g3
	te	%icc,	0x1
	lduh	[%l7 + 0x7C],	%g3
	fmovdleu	%icc,	%f6,	%f0
	ld	[%l7 + 0x20],	%f9
	add	%g3,	0x0C0D,	%g3
	andcc	%g3,	%g6,	%g3
	tl	%xcc,	0x7
	ble,a,pt	%xcc,	loop_1227
	sdiv	%g3,	0x08D6,	%g3
	ldsh	[%l7 + 0x52],	%g3
	and	%g3,	0x1B03,	%g3
loop_1227:
	fmovde	%xcc,	%f8,	%f9
	subccc	%g3,	0x118B,	%g3
	fpmerge	%f9,	%f7,	%f14
	brgez	%g3,	loop_1228
	tl	%xcc,	0x3
	tsubcctv	%g3,	0x0560,	%g3
	fba	%fcc3,	loop_1229
loop_1228:
	tg	%xcc,	0x7
	nop
	and	%g3,	0x1846,	%g3
loop_1229:
	ldsw	[%l7 + 0x28],	%g3
	stw	%g3,	[%l7 + 0x40]
	tleu	%xcc,	0x5
	bge,a,pt	%xcc,	loop_1230
	nop
	bneg	loop_1231
	st	%f9,	[%l7 + 0x2C]
loop_1230:
	sub	%g3,	%g3,	%l4
	movrlz	%l4,	0x1EB,	%l4
loop_1231:
	nop
	sub	%l4,	%l4,	%i4
	bg,a,pt	%icc,	loop_1232
	nop
	fble	%fcc2,	loop_1233
	sra	%i4,	0x1F,	%i4
loop_1232:
	nop
	xnor	%i4,	0x1715,	%i4
loop_1233:
	bleu,a	loop_1234
	fcmpne16	%f14,	%f12,	%i4
	siam	0x6
	lduh	[%l7 + 0x1C],	%i4
loop_1234:
	tsubcctv	%i4,	%g2,	%i4
	fbl	%fcc3,	loop_1235
	movle	%icc,	%i4,	%o6
	movl	%icc,	%g1,	%o6
	addcc	%o6,	0x05E7,	%o6
loop_1235:
	popc	0x0375,	%o6
	subc	%o6,	0x02C9,	%o6
	fpsub16	%f14,	%f8,	%f10
	fmovrdgz	%o6,	%f14,	%f6
	movcs	%icc,	%o6,	%l1
	fnot2	%f6,	%f10
	fornot1s	%f9,	%f8,	%f15
	fbne,a	%fcc2,	loop_1236
	tcc	%xcc,	0x6
	movpos	%xcc,	%i3,	%l1
	fnand	%f6,	%f8,	%f6
loop_1236:
	nop
	ta	%xcc,	0x5
	nop
	movcc	%icc,	%l6,	%l1
	nop
	orcc	%l1,	0x0599,	%l1
	fmul8ulx16	%f6,	%f10,	%f0
	fmul8x16	%f15,	%f4,	%f2
	movcc	%icc,	%l1,	%l0
	fcmple16	%f2,	%f2,	%l0
	fmovrsgz	%l0,	%f1,	%f4
	stw	%l0,	[%l7 + 0x0C]
	sub	%l0,	0x01F5,	%l0
	sllx	%l0,	0x08,	%l0
	ldx	[%l7 + 0x70],	%l0
	sdivx	%l0,	0x0B86,	%l0
	fabss	%f4,	%f15
	srax	%l0,	%l0,	%g4
	nop
	tgu	%xcc,	0x7
	mulscc	%g4,	%o1,	%g4
	nop
	xor	%g4,	0x1AEE,	%g4
	ldub	[%l7 + 0x7E],	%g4
	movneg	%xcc,	%g4,	%i6
	nop
	smul	%i6,	%o4,	%i6
	udivx	%i6,	0x14E6,	%i6
	fble,a	%fcc1,	loop_1237
	tge	%xcc,	0x7
	tpos	%xcc,	0x0
	brgez,a	%i6,	loop_1238
loop_1237:
	bpos,pt	%xcc,	loop_1239
	subcc	%i6,	%i6,	%i5
	ld	[%l7 + 0x14],	%f8
loop_1238:
	nop
loop_1239:
	bneg,pn	%xcc,	loop_1240
	tl	%xcc,	0x3
	stx	%i5,	[%l7 + 0x38]
	fbule,a	%fcc2,	loop_1241
loop_1240:
	bge,pt	%xcc,	loop_1242
	umul	%i5,	%i5,	%o2
	tvs	%xcc,	0x1
loop_1241:
	smul	%o2,	%g5,	%o2
loop_1242:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type    	: 685
!	Type f   	: 1904
!	Type cti   	: 1242
!	Type i   	: 4885
!	Type l   	: 1284
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xD0CEC65A
.word 0x15030D3E
.word 0x3E259125
.word 0x6D36063C
.word 0xC984DDB0
.word 0xB223A9BE
.word 0xB4509428
.word 0x475B3593
.word 0x09443E4F
.word 0x7BDC69E7
.word 0x12638115
.word 0xA7613FA7
.word 0x528DBC4D
.word 0x53D6AD38
.word 0xCB542C3F
.word 0x697F27B0
.word 0xAEC309FC
.word 0x2F2D4860
.word 0x0FF13691
.word 0x2591D403
.word 0x802E085C
.word 0x84EA9B8D
.word 0x51675BCA
.word 0x703B6F52
.word 0x09EC7643
.word 0x85E30FA3
.word 0xF97B18EC
.word 0xE9A2184B
.word 0x473DD994
.word 0x96F14B16
.word 0xD9B868A1
.word 0xDE9D3947
.word 0x60FC32C0
.word 0x281CA190
.word 0x3EED5946
.word 0x5E1E0AFC
.word 0xADBD365F
.word 0x71438EB4
.word 0x49DBBF49
.word 0x0FA8EA22
.word 0x33B76614
.word 0xCBEE2802
.word 0x4374722C
.word 0x13596A1B
.word 0x5D4AFE8A
.word 0x76A9864E
.word 0x52D56A15
.word 0xD2C14493
.word 0x7653F725
.word 0x14095718
.word 0xD76017A6
.word 0x060D7C09
.word 0x92B1812B
.word 0x6B64AAE1
.word 0xE26BB111
.word 0xB38B060E
.word 0x63A3E623
.word 0xF75C4389
.word 0xEBCC7E81
.word 0x8D64173A
.word 0xF1A34BC6
.word 0xF9EE2644
.word 0x0C09DBDE
.word 0x89B36CDF
.end
