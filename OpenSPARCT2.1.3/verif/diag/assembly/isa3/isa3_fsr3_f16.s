/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f16.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f16.s,v 1.1 2007/05/11 17:22:27 drp Exp $"
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

mov %l7, %g1
wrpr %g0, 0x0, %cwp
mov %g1, %l7
wrpr %g0, 0x1, %cwp
mov %g1, %l7
wrpr %g0, 0x2, %cwp
mov %g1, %l7
wrpr %g0, 0x3, %cwp
mov %g1, %l7
wrpr %g0, 0x4, %cwp
mov %g1, %l7
wrpr %g0, 0x5, %cwp
mov %g1, %l7
wrpr %g0, 0x6, %cwp
mov %g1, %l7
wrpr %g0, 0x7, %cwp
mov %g1, %l7
	nop
	setx	0x3D5344448050952B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0xD,	%g2
	set	0xD,	%g3
	set	0xC,	%g4
	set	0xE,	%g5
	set	0x9,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0x5,	%i3
	set	-0x9,	%i4
	set	-0x2,	%i5
	set	-0x1,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x661B4E3E,	%l0
	set	0x4632BFBC,	%l1
	set	0x0F290CF2,	%l2
	set	0x258069F0,	%l3
	set	0x46561A73,	%l4
	set	0x7B5FD024,	%l5
	set	0x1037FBBD,	%l6
	!# Output registers
	set	-0x05EE,	%o0
	set	0x19A4,	%o1
	set	0x14F0,	%o2
	set	0x14AE,	%o3
	set	0x183E,	%o4
	set	-0x123C,	%o5
	set	-0x1A72,	%o6
	set	0x15EC,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x27C63616DBF4B2AC)
	INIT_TH_FP_REG(%l7,%f2,0xEFBB5B3633E0C60F)
	INIT_TH_FP_REG(%l7,%f4,0x970FEF1E6B1F936F)
	INIT_TH_FP_REG(%l7,%f6,0xCDBD7472A716187E)
	INIT_TH_FP_REG(%l7,%f8,0xAB0697BE1F55D103)
	INIT_TH_FP_REG(%l7,%f10,0x755B1EDD73ABCC1F)
	INIT_TH_FP_REG(%l7,%f12,0x64789D51835283E6)
	INIT_TH_FP_REG(%l7,%f14,0x0AA24B08FBD34BFE)
	INIT_TH_FP_REG(%l7,%f16,0xCC45F62449B7C939)
	INIT_TH_FP_REG(%l7,%f18,0xA18FBA734DAE5A5F)
	INIT_TH_FP_REG(%l7,%f20,0xA3A637825EFF224D)
	INIT_TH_FP_REG(%l7,%f22,0x146AA959835B07EB)
	INIT_TH_FP_REG(%l7,%f24,0x1613E2EC2CF87A1F)
	INIT_TH_FP_REG(%l7,%f26,0x29191525A14ED3E2)
	INIT_TH_FP_REG(%l7,%f28,0x1254B57D98F5F3A7)
	INIT_TH_FP_REG(%l7,%f30,0x53DE239BFBE7056E)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x622, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fmul8ulx16	%f20,	%f30,	%f12
	srlx	%l2,	0x18,	%i2
	movvc	%xcc,	%i0,	%o4
	tne	%icc,	0x1
	bleu,pt	%xcc,	loop_1
	sdiv	%i5,	0x12D5,	%i6
	tcs	%icc,	0x1
	te	%icc,	0x5
loop_1:
	move	%xcc,	%i4,	%l0
	tne	%xcc,	0x7
	subc	%g2,	%i3,	%g5
	nop
	setx	loop_2,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldub	[%l7 + 0x4E],	%o7
	taddcc	%o1,	0x0C4C,	%o0
	or	%l6,	%l4,	%g7
loop_2:
	fornot1s	%f8,	%f22,	%f8
	fmovrdgez	%o6,	%f26,	%f16
	alignaddr	%i1,	%l1,	%g1
	array32	%o2,	%g3,	%g6
	mova	%icc,	%o3,	%g4
	fcmpne32	%f16,	%f4,	%l5
	stw	%o5,	[%l7 + 0x40]
	fands	%f18,	%f16,	%f19
	fmovdge	%icc,	%f5,	%f3
	bvs,a,pt	%xcc,	loop_3
	edge8	%l3,	%l2,	%i2
	tsubcc	%i7,	0x1576,	%o4
	sethi	0x0BA0,	%i0
loop_3:
	fnor	%f16,	%f4,	%f12
	mulscc	%i5,	0x04CD,	%i6
	fbne,a	%fcc0,	loop_4
	movneg	%icc,	%i4,	%l0
	set	0x10, %i2
	swapa	[%l7 + %i2] 0x80,	%i3
loop_4:
	alignaddr	%g5,	%o7,	%o1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x34] %asi,	%o0
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f16
	srlx	%l6,	0x1E,	%g2
	set	0x4C, %g6
	swapa	[%l7 + %g6] 0x10,	%g7
	fandnot1	%f0,	%f20,	%f28
	popc	0x1E9E,	%l4
	movcc	%icc,	%i1,	%l1
	srax	%o6,	%o2,	%g3
	membar	0x7E
	bl,a,pn	%icc,	loop_5
	sub	%g1,	0x19FA,	%o3
	xorcc	%g4,	0x1C92,	%g6
	sll	%l5,	%l3,	%l2
loop_5:
	tl	%icc,	0x7
	array8	%o5,	%i7,	%o4
	fmovdvs	%xcc,	%f2,	%f9
	sra	%i0,	%i2,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a,pn	%icc,	loop_6
	addccc	%i6,	%i4,	%i3
	sdivx	%l0,	0x0B1B,	%o7
	taddcc	%g5,	0x0762,	%o1
loop_6:
	tge	%icc,	0x5
	orn	%l6,	0x0673,	%o0
	fsrc2	%f6,	%f30
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f0
	set	0x69, %l3
	ldsba	[%l7 + %l3] 0x19,	%g2
	fbne,a	%fcc2,	loop_7
	fnor	%f22,	%f14,	%f20
	edge32	%g7,	%i1,	%l4
	xnor	%o6,	%o2,	%g3
loop_7:
	subccc	%l1,	%o3,	%g1
	set	0x09, %l6
	ldsba	[%l7 + %l6] 0x88,	%g4
	andcc	%l5,	0x12F2,	%l3
	mova	%xcc,	%l2,	%g6
	add	%i7,	%o4,	%i0
	sra	%o5,	0x0C,	%i5
	fandnot1s	%f6,	%f29,	%f24
	nop
	setx loop_8, %l0, %l1
	jmpl %l1, %i2
	tgu	%xcc,	0x1
	movneg	%icc,	%i6,	%i4
	sir	0x1D7E
loop_8:
	smulcc	%i3,	0x154A,	%l0
	tcc	%icc,	0x3
	sra	%g5,	%o7,	%o1
	mulx	%o0,	%g2,	%g7
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x14] %asi,	%l6
	bcc,pt	%icc,	loop_9
	udivcc	%i1,	0x0356,	%l4
	alignaddr	%o6,	%g3,	%o2
	array8	%l1,	%g1,	%g4
loop_9:
	fandnot2s	%f0,	%f5,	%f9
	fmul8ulx16	%f20,	%f22,	%f18
	fble	%fcc2,	loop_10
	bleu	loop_11
	tcs	%icc,	0x5
	move	%icc,	%l5,	%o3
loop_10:
	srlx	%l2,	%l3,	%g6
loop_11:
	sllx	%i7,	0x17,	%o4
	ldstub	[%l7 + 0x12],	%o5
	orcc	%i0,	0x1E67,	%i5
	fmovda	%icc,	%f31,	%f29
	tge	%icc,	0x4
	tpos	%icc,	0x2
	edge16n	%i6,	%i2,	%i3
	sdivx	%l0,	0x11BD,	%i4
	fcmpeq32	%f22,	%f10,	%g5
	fbu,a	%fcc1,	loop_12
	tg	%xcc,	0x0
	swap	[%l7 + 0x20],	%o1
	movleu	%icc,	%o0,	%o7
loop_12:
	nop
	set	0x64, %g5
	stwa	%g7,	[%l7 + %g5] 0x81
	udivx	%g2,	0x1C40,	%l6
	taddcc	%i1,	0x0653,	%l4
	movpos	%xcc,	%o6,	%g3
	movl	%icc,	%o2,	%g1
	fpsub16	%f2,	%f14,	%f28
	movcs	%icc,	%l1,	%g4
	movrgez	%o3,	%l5,	%l2
	tg	%xcc,	0x1
	edge16ln	%g6,	%i7,	%l3
	movrne	%o4,	0x2AF,	%i0
	te	%icc,	0x6
	fornot1s	%f4,	%f13,	%f14
	bn,a,pt	%icc,	loop_13
	movge	%icc,	%i5,	%i6
	fbule,a	%fcc2,	loop_14
	swap	[%l7 + 0x2C],	%o5
loop_13:
	tn	%icc,	0x5
	fnors	%f28,	%f17,	%f15
loop_14:
	fbe,a	%fcc0,	loop_15
	popc	0x0067,	%i2
	xnor	%i3,	0x116C,	%i4
	bne,a,pn	%icc,	loop_16
loop_15:
	edge32n	%g5,	%o1,	%l0
	xor	%o0,	0x03F1,	%g7
	fbge,a	%fcc3,	loop_17
loop_16:
	movne	%icc,	%o7,	%g2
	sdivx	%i1,	0x1E9F,	%l6
	fnegs	%f19,	%f3
loop_17:
	fpack32	%f10,	%f24,	%f18
	ldub	[%l7 + 0x7F],	%l4
	popc	%g3,	%o2
	nop
	set	0x32, %l4
	lduh	[%l7 + %l4],	%g1
	fpack32	%f12,	%f6,	%f8
	fsrc2	%f18,	%f26
	movrgez	%o6,	%l1,	%o3
	xnorcc	%g4,	0x18E8,	%l5
	edge16	%l2,	%g6,	%l3
	udivx	%i7,	0x18C6,	%i0
	addc	%i5,	0x1421,	%i6
	ldstub	[%l7 + 0x11],	%o4
	fbn	%fcc0,	loop_18
	array16	%o5,	%i2,	%i4
	andncc	%g5,	%i3,	%o1
	edge8	%l0,	%o0,	%g7
loop_18:
	edge8	%o7,	%i1,	%g2
	addc	%l4,	0x138E,	%g3
	set	0x36, %g1
	lduba	[%l7 + %g1] 0x0c,	%l6
	fbue	%fcc0,	loop_19
	andncc	%o2,	%o6,	%g1
	brz	%l1,	loop_20
	tl	%icc,	0x6
loop_19:
	fbn	%fcc0,	loop_21
	ta	%icc,	0x0
loop_20:
	fcmpeq32	%f6,	%f0,	%g4
	fandnot1s	%f28,	%f15,	%f24
loop_21:
	stw	%l5,	[%l7 + 0x54]
	taddcctv	%l2,	%g6,	%l3
	edge32l	%i7,	%i0,	%i5
	edge32ln	%o3,	%i6,	%o5
	fand	%f30,	%f6,	%f30
	fpack32	%f14,	%f18,	%f2
	tleu	%icc,	0x6
	mulx	%i2,	%o4,	%g5
	movrgez	%i4,	%o1,	%l0
	fnot2	%f24,	%f12
	edge32	%o0,	%g7,	%i3
	tvs	%icc,	0x2
	movgu	%icc,	%i1,	%g2
	smulcc	%l4,	0x0214,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f5,	%f4
	fstoi	%f4,	%f1
	fnands	%f25,	%f5,	%f2
	tcc	%icc,	0x7
	fble,a	%fcc0,	loop_22
	brz	%l6,	loop_23
	xor	%o2,	%o6,	%o7
	sdiv	%l1,	0x025C,	%g4
loop_22:
	nop
	setx	0x80485E58,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_23:
	smul	%l5,	%l2,	%g6
	tvs	%xcc,	0x2
	nop
	set	0x24, %g3
	stw	%l3,	[%l7 + %g3]
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x14,	%i6
	edge32l	%i0,	%g1,	%o3
	sdiv	%i5,	0x15AE,	%i6
	fcmpeq32	%f8,	%f24,	%o5
	fmovdcs	%icc,	%f29,	%f27
	edge32ln	%o4,	%g5,	%i4
	alignaddrl	%o1,	%l0,	%o0
	bl,a	loop_24
	fmovrdgz	%i2,	%f18,	%f26
	umulcc	%g7,	%i1,	%g2
	sub	%i3,	%l4,	%g3
loop_24:
	movne	%icc,	%o2,	%l6
	bn,a,pt	%xcc,	loop_25
	fmovdleu	%xcc,	%f13,	%f10
	orcc	%o7,	%o6,	%l1
	fmovdg	%icc,	%f22,	%f12
loop_25:
	fnors	%f25,	%f3,	%f5
	movrne	%l5,	0x28D,	%l2
	brgez,a	%g6,	loop_26
	flush	%l7 + 0x08
	fnor	%f24,	%f26,	%f16
	fmovdn	%icc,	%f21,	%f19
loop_26:
	orcc	%l3,	%i7,	%i0
	movrgz	%g4,	0x399,	%o3
	edge32n	%g1,	%i6,	%i5
	tcc	%icc,	0x3
	wr	%g0,	0xe2,	%asi
	stha	%o4,	[%l7 + 0x20] %asi
	membar	#Sync
	fabss	%f24,	%f27
	fbule	%fcc3,	loop_27
	lduw	[%l7 + 0x58],	%o5
	tsubcc	%i4,	0x0E00,	%g5
	fmovrsne	%l0,	%f10,	%f19
loop_27:
	nop
	set	0x58, %i6
	stba	%o1,	[%l7 + %i6] 0xe2
	membar	#Sync
	fmovd	%f28,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i2,	%o0
	udivcc	%i1,	0x0C80,	%g2
	taddcc	%g7,	%l4,	%g3
	udivx	%o2,	0x1F7B,	%i3
	movg	%icc,	%o7,	%o6
	nop
	setx	0x58C17279F168AF69,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xBDF91D9DB69551FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f8,	%f0
	lduh	[%l7 + 0x38],	%l6
	sll	%l1,	0x0D,	%l2
	movrlz	%l5,	0x097,	%g6
	srlx	%i7,	%i0,	%g4
	edge32l	%l3,	%o3,	%g1
	array8	%i6,	%i5,	%o4
	fmovscc	%icc,	%f30,	%f28
	array8	%o5,	%i4,	%g5
	edge16	%l0,	%o1,	%o0
	edge8l	%i2,	%i1,	%g7
	edge8n	%g2,	%l4,	%o2
	ta	%icc,	0x6
	ldsw	[%l7 + 0x58],	%g3
	fmovdle	%xcc,	%f13,	%f23
	taddcc	%i3,	0x1B3B,	%o7
	nop
	fitos	%f0,	%f23
	fstox	%f23,	%f4
	fxtos	%f4,	%f5
	mulx	%o6,	%l6,	%l2
	edge8n	%l5,	%g6,	%l1
	subccc	%i0,	%i7,	%g4
	movge	%icc,	%o3,	%g1
	fbne	%fcc1,	loop_28
	edge16	%l3,	%i5,	%i6
	stb	%o4,	[%l7 + 0x6F]
	for	%f22,	%f26,	%f14
loop_28:
	ld	[%l7 + 0x70],	%f27
	fble,a	%fcc3,	loop_29
	addc	%o5,	0x1B90,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f21,	%f8
loop_29:
	tpos	%xcc,	0x3
	tl	%xcc,	0x7
	xorcc	%i4,	%o1,	%o0
	edge16l	%i2,	%l0,	%i1
	sra	%g2,	0x16,	%g7
	bleu,a	loop_30
	tge	%xcc,	0x5
	tleu	%xcc,	0x4
	set	0x3D, %l2
	lduba	[%l7 + %l2] 0x80,	%o2
loop_30:
	fmul8x16	%f5,	%f2,	%f24
	fnegd	%f22,	%f24
	popc	0x0A17,	%l4
	add	%g3,	%o7,	%o6
	tcc	%icc,	0x7
	ba,a,pt	%icc,	loop_31
	fpadd16s	%f29,	%f9,	%f21
	tneg	%icc,	0x6
	subc	%i3,	0x1144,	%l6
loop_31:
	movg	%xcc,	%l2,	%g6
	movn	%icc,	%l5,	%i0
	taddcc	%i7,	%g4,	%o3
	fsrc2	%f14,	%f8
	fbul	%fcc0,	loop_32
	movl	%xcc,	%l1,	%l3
	ble,pn	%xcc,	loop_33
	movg	%icc,	%i5,	%i6
loop_32:
	fxor	%f24,	%f30,	%f30
	fmovdneg	%icc,	%f4,	%f25
loop_33:
	movn	%icc,	%o4,	%o5
	tge	%icc,	0x1
	movrlz	%g5,	%i4,	%g1
	movpos	%icc,	%o1,	%i2
	tcc	%icc,	0x2
	for	%f26,	%f20,	%f28
	smul	%l0,	0x10B7,	%o0
	fmovsg	%xcc,	%f14,	%f2
	brz,a	%g2,	loop_34
	array16	%i1,	%o2,	%g7
	fmovdvc	%icc,	%f29,	%f21
	bcc,a	%xcc,	loop_35
loop_34:
	fbl	%fcc3,	loop_36
	udivx	%g3,	0x0842,	%o7
	fmovdcc	%xcc,	%f30,	%f27
loop_35:
	taddcc	%o6,	0x1F77,	%l4
loop_36:
	xnor	%l6,	0x1AD9,	%l2
	sub	%i3,	%l5,	%g6
	xnorcc	%i0,	%g4,	%o3
	tvs	%xcc,	0x6
	nop
	setx	loop_37,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%icc,	%l1,	%l3
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f25
	movvs	%xcc,	%i5,	%i6
loop_37:
	fxnor	%f20,	%f2,	%f12
	fbe	%fcc1,	loop_38
	movgu	%icc,	%o4,	%o5
	tcc	%icc,	0x6
	addcc	%g5,	%i4,	%i7
loop_38:
	movneg	%icc,	%o1,	%g1
	tne	%xcc,	0x4
	nop
	setx	0x00400C11,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	movvc	%icc,	%l0,	%o0
	bcs	%xcc,	loop_39
	srax	%g2,	0x0E,	%i2
	edge16ln	%o2,	%g7,	%i1
	tne	%xcc,	0x2
loop_39:
	movge	%xcc,	%g3,	%o7
	movl	%xcc,	%o6,	%l6
	fbg,a	%fcc0,	loop_40
	movpos	%icc,	%l2,	%i3
	smul	%l4,	%g6,	%l5
	call	loop_41
loop_40:
	srl	%i0,	%g4,	%o3
	or	%l3,	0x0B2A,	%l1
	srlx	%i6,	%i5,	%o5
loop_41:
	lduh	[%l7 + 0x4C],	%g5
	fabss	%f30,	%f6
	membar	0x37
	fmul8ulx16	%f26,	%f4,	%f10
	fnegs	%f29,	%f11
	orncc	%i4,	0x046A,	%o4
	set	0x2B, %i3
	ldsba	[%l7 + %i3] 0x0c,	%i7
	movleu	%icc,	%o1,	%g1
	xorcc	%o0,	%g2,	%l0
	movrlz	%i2,	%o2,	%i1
	sir	0x0BE0
	edge32l	%g3,	%g7,	%o6
	xnorcc	%l6,	%o7,	%i3
	srax	%l4,	%l2,	%g6
	stb	%l5,	[%l7 + 0x75]
	movrlz	%g4,	%i0,	%l3
	sethi	0x11A2,	%o3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%i6
	ldub	[%l7 + 0x65],	%i5
	nop
	setx	0xF936115A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x7752282F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f27,	%f19
	fmovde	%icc,	%f28,	%f31
	subc	%l1,	%o5,	%g5
	edge32n	%o4,	%i7,	%i4
	fbl,a	%fcc3,	loop_42
	and	%g1,	0x1F77,	%o1
	lduh	[%l7 + 0x46],	%g2
	umul	%o0,	0x0DC1,	%i2
loop_42:
	orncc	%o2,	%i1,	%g3
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x38] %asi,	%f24
	fabsd	%f18,	%f8
	set	0x2C, %l1
	stwa	%g7,	[%l7 + %l1] 0x27
	membar	#Sync
	edge16n	%o6,	%l0,	%o7
	movvc	%icc,	%l6,	%i3
	lduh	[%l7 + 0x32],	%l4
	tleu	%icc,	0x2
	fmul8x16au	%f27,	%f18,	%f10
	movpos	%xcc,	%g6,	%l5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g4
	subcc	%l2,	%l3,	%i0
	fmovrse	%o3,	%f12,	%f8
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x10
	bpos	%icc,	loop_43
	sdiv	%i6,	0x0AC9,	%i5
	fbo,a	%fcc0,	loop_44
	udiv	%l1,	0x05BB,	%o5
loop_43:
	sethi	0x0130,	%o4
	nop
	setx	0x7BD2374920646E3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_44:
	tle	%xcc,	0x2
	sra	%g5,	%i4,	%g1
	fbo	%fcc0,	loop_45
	fbne,a	%fcc2,	loop_46
	movg	%icc,	%o1,	%i7
	fnors	%f15,	%f13,	%f25
loop_45:
	fpsub32	%f28,	%f22,	%f0
loop_46:
	edge8n	%o0,	%g2,	%o2
	movrgez	%i1,	%g3,	%i2
	movle	%icc,	%o6,	%l0
	ldd	[%l7 + 0x78],	%f6
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movvc	%icc,	%o7,	%l6
	fpack32	%f16,	%f24,	%f4
	orn	%i3,	%l4,	%g6
	movvs	%icc,	%g7,	%l5
	fbuge	%fcc0,	loop_47
	fabsd	%f2,	%f26
	fandnot1	%f12,	%f10,	%f6
	edge8ln	%g4,	%l3,	%l2
loop_47:
	addc	%o3,	%i0,	%i5
	fmovsvs	%xcc,	%f20,	%f2
	fbge	%fcc1,	loop_48
	brgez,a	%l1,	loop_49
	edge8l	%o5,	%o4,	%g5
	bcs,a,pn	%xcc,	loop_50
loop_48:
	tg	%icc,	0x1
loop_49:
	bcc,a	%xcc,	loop_51
	array32	%i6,	%i4,	%o1
loop_50:
	movcc	%xcc,	%i7,	%g1
	fmul8x16au	%f24,	%f25,	%f4
loop_51:
	movre	%g2,	0x3CB,	%o0
	subcc	%i1,	%o2,	%g3
	fba,a	%fcc3,	loop_52
	movvc	%xcc,	%o6,	%l0
	or	%i2,	%o7,	%l6
	pdist	%f24,	%f16,	%f0
loop_52:
	edge8	%l4,	%i3,	%g7
	fmovse	%icc,	%f3,	%f22
	ble,a	loop_53
	edge16ln	%g6,	%g4,	%l3
	fmul8x16au	%f14,	%f5,	%f16
	popc	%l5,	%o3
loop_53:
	tge	%xcc,	0x2
	fbg	%fcc3,	loop_54
	sth	%i0,	[%l7 + 0x62]
	nop
	setx	0xBE479C77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f27
	wr	%g0,	0x18,	%asi
	sta	%f24,	[%l7 + 0x20] %asi
loop_54:
	fmovs	%f28,	%f30
	fmovda	%xcc,	%f28,	%f9
	fors	%f24,	%f21,	%f9
	subc	%i5,	%l1,	%o5
	edge8	%o4,	%g5,	%i6
	nop
	setx	0x9078154E,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	movpos	%xcc,	%l2,	%i4
	fone	%f10
	nop
	fitos	%f0,	%f11
	fstox	%f11,	%f30
	fxtos	%f30,	%f20
	tsubcctv	%i7,	0x1F69,	%o1
	tsubcc	%g2,	%g1,	%o0
	fpmerge	%f22,	%f21,	%f28
	movgu	%xcc,	%o2,	%i1
	move	%icc,	%g3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f5,	%f4
	tgu	%xcc,	0x4
	movrlz	%i2,	0x3D8,	%o7
	fmovsle	%xcc,	%f27,	%f0
	fbuge	%fcc1,	loop_55
	nop
	set	0x20, %o4
	ldsw	[%l7 + %o4],	%l6
	andncc	%o6,	%l4,	%g7
	fxors	%f7,	%f26,	%f8
loop_55:
	bn,a,pn	%xcc,	loop_56
	tcc	%icc,	0x3
	taddcctv	%g6,	%i3,	%l3
	fmovdl	%xcc,	%f15,	%f8
loop_56:
	andncc	%g4,	%l5,	%o3
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i0
	fnot1	%f22,	%f18
	fmovdn	%icc,	%f13,	%f31
	fmul8x16al	%f11,	%f5,	%f18
	move	%icc,	%l1,	%i5
	subccc	%o5,	0x196A,	%o4
	movvc	%xcc,	%i6,	%g5
	or	%l2,	%i7,	%o1
	movcc	%xcc,	%i4,	%g2
	xor	%g1,	0x08C8,	%o2
	nop
	fitod	%f15,	%f18
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f20
	fmovrde	%o0,	%f16,	%f8
	array8	%i1,	%g3,	%l0
	fmovd	%f8,	%f0
	edge32ln	%i2,	%l6,	%o7
	fmovrdgez	%o6,	%f2,	%f26
	lduw	[%l7 + 0x28],	%l4
	fmovrdlez	%g6,	%f30,	%f4
	sdiv	%g7,	0x01A6,	%i3
	ldub	[%l7 + 0x64],	%g4
	tne	%icc,	0x0
	wr	%g0,	0xe2,	%asi
	stxa	%l3,	[%l7 + 0x60] %asi
	membar	#Sync
	taddcc	%l5,	%o3,	%l1
	fmovrdgez	%i0,	%f8,	%f10
	bg,a,pn	%xcc,	loop_57
	ldd	[%l7 + 0x20],	%i4
	edge32	%o5,	%i6,	%g5
	xorcc	%l2,	%o4,	%i7
loop_57:
	tcc	%icc,	0x0
	nop
	fitos	%f13,	%f21
	fstox	%f21,	%f4
	fxtos	%f4,	%f25
	tne	%xcc,	0x3
	subc	%i4,	0x1B61,	%g2
	brgz,a	%o1,	loop_58
	nop
	setx loop_59, %l0, %l1
	jmpl %l1, %o2
	fmovrdgez	%g1,	%f12,	%f20
	tvc	%xcc,	0x6
loop_58:
	brnz,a	%o0,	loop_60
loop_59:
	edge8l	%i1,	%l0,	%i2
	set	0x18, %g2
	lda	[%l7 + %g2] 0x89,	%f0
loop_60:
	ldsb	[%l7 + 0x28],	%g3
	fbuge	%fcc2,	loop_61
	fpmerge	%f27,	%f9,	%f18
	set	0x16, %i4
	ldsba	[%l7 + %i4] 0x15,	%l6
loop_61:
	mulx	%o6,	%l4,	%g6
	fbue	%fcc1,	loop_62
	stbar
	andncc	%o7,	%g7,	%i3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x14] %asi,	%g4
loop_62:
	orcc	%l5,	0x08B4,	%l3
	movgu	%xcc,	%l1,	%i0
	sub	%o3,	%i5,	%o5
	bl,a	loop_63
	edge32ln	%i6,	%g5,	%l2
	tn	%xcc,	0x2
	ldsb	[%l7 + 0x23],	%o4
loop_63:
	edge32l	%i7,	%g2,	%o1
	fmovdcs	%xcc,	%f16,	%f7
	movleu	%xcc,	%i4,	%g1
	movgu	%icc,	%o0,	%i1
	add	%l0,	%i2,	%o2
	edge16	%l6,	%o6,	%g3
	alignaddrl	%l4,	%g6,	%g7
	nop
	setx	0xE2041055728B1E24,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC29C70DD762332E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f26,	%f4
	xnorcc	%o7,	%i3,	%g4
	tsubcc	%l5,	%l3,	%i0
	fmovde	%icc,	%f9,	%f2
	fbu,a	%fcc2,	loop_64
	andcc	%o3,	%l1,	%o5
	addcc	%i6,	%g5,	%l2
	andncc	%o4,	%i5,	%i7
loop_64:
	ldsb	[%l7 + 0x74],	%o1
	movcc	%icc,	%g2,	%i4
	andncc	%o0,	%g1,	%i1
	tleu	%icc,	0x0
	tvs	%xcc,	0x2
	nop
	setx loop_65, %l0, %l1
	jmpl %l1, %i2
	movvs	%xcc,	%o2,	%l0
	brnz	%o6,	loop_66
	mulx	%l6,	%g3,	%g6
loop_65:
	tne	%icc,	0x4
	edge8l	%g7,	%l4,	%i3
loop_66:
	fba,a	%fcc2,	loop_67
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2b,	%asi
	stxa	%o7,	[%l7 + 0x50] %asi
	membar	#Sync
loop_67:
	fmul8x16al	%f27,	%f17,	%f28
	brlz	%g4,	loop_68
	orncc	%l3,	%i0,	%o3
	taddcctv	%l5,	0x1330,	%o5
	andn	%i6,	0x0405,	%l1
loop_68:
	movvc	%icc,	%l2,	%g5
	fbug	%fcc2,	loop_69
	sth	%o4,	[%l7 + 0x32]
	edge32ln	%i7,	%o1,	%i5
	umulcc	%g2,	%o0,	%g1
loop_69:
	srax	%i1,	0x09,	%i2
	membar	0x79
	popc	%i4,	%l0
	movpos	%xcc,	%o6,	%o2
	fandnot1s	%f7,	%f0,	%f5
	fnand	%f28,	%f18,	%f14
	nop
	fitos	%f0,	%f26
	fstox	%f26,	%f10
	andcc	%g3,	%l6,	%g7
	movcs	%icc,	%l4,	%i3
	pdist	%f12,	%f10,	%f10
	fmovsgu	%xcc,	%f27,	%f23
	addccc	%g6,	0x11FC,	%o7
	movrne	%g4,	0x1A1,	%i0
	bneg,a,pt	%xcc,	loop_70
	edge8ln	%l3,	%o3,	%o5
	set	0x44, %o5
	lda	[%l7 + %o5] 0x89,	%f23
loop_70:
	fpack16	%f0,	%f6
	bcc,pt	%icc,	loop_71
	fmovsvc	%icc,	%f3,	%f27
	nop
	setx	0xD1B31FED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x5A84E3CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f12,	%f19
	edge8	%i6,	%l5,	%l1
loop_71:
	fmuld8sux16	%f9,	%f12,	%f30
	srlx	%g5,	%o4,	%i7
	edge8l	%l2,	%o1,	%g2
	sethi	0x0208,	%o0
	bge,a	loop_72
	alignaddr	%g1,	%i5,	%i1
	smul	%i4,	0x07E7,	%i2
	movrgz	%o6,	0x153,	%l0
loop_72:
	subccc	%g3,	0x03AE,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g7,	%l4,	%i3
	fmovdge	%xcc,	%f26,	%f10
	srl	%g6,	0x02,	%o7
	sdivx	%l6,	0x0ED3,	%g4
	fmul8sux16	%f18,	%f20,	%f8
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tsubcctv	%i0,	0x16E9,	%o3
	fandnot1	%f24,	%f28,	%f0
	tg	%xcc,	0x5
	brlez	%l3,	loop_73
	movl	%xcc,	%i6,	%l5
	sdivx	%l1,	0x18F1,	%o5
	nop
	setx	0x50789D5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
loop_73:
	tcs	%icc,	0x1
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tcs	%xcc,	0x6
	tcc	%icc,	0x4
	subccc	%o4,	%i7,	%g5
	edge32	%l2,	%o1,	%o0
	swap	[%l7 + 0x60],	%g1
	subcc	%g2,	%i5,	%i4
	addcc	%i2,	0x0C1F,	%i1
	ldstub	[%l7 + 0x63],	%o6
	andncc	%g3,	%o2,	%g7
	fbug	%fcc2,	loop_74
	addc	%l0,	0x0634,	%l4
	edge16n	%i3,	%g6,	%l6
	nop
	setx	loop_75,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_74:
	prefetch	[%l7 + 0x34],	 0x2
	edge16	%g4,	%i0,	%o3
	tcs	%xcc,	0x5
loop_75:
	sdivcc	%o7,	0x1650,	%i6
	umul	%l3,	%l5,	%l1
	movl	%icc,	%o5,	%i7
	array16	%o4,	%g5,	%l2
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x0c,	 0x1
	fmovsvc	%xcc,	%f22,	%f6
	orncc	%o1,	0x1CFE,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i5,	%i4
	and	%i2,	0x14A7,	%g1
	faligndata	%f8,	%f4,	%f30
	nop
	fitod	%f21,	%f28
	addc	%i1,	0x02FA,	%o6
	movg	%xcc,	%g3,	%o2
	array32	%l0,	%l4,	%g7
	ldsb	[%l7 + 0x44],	%g6
	udivcc	%i3,	0x0128,	%l6
	fpack32	%f0,	%f6,	%f16
	ldd	[%l7 + 0x20],	%f26
	orn	%i0,	%o3,	%g4
	fmovsn	%icc,	%f24,	%f1
	fmovrsne	%o7,	%f20,	%f20
	set	0x38, %o2
	ldxa	[%g0 + %o2] 0x4f,	%i6
	movrne	%l5,	0x0E4,	%l1
	fbul,a	%fcc3,	loop_76
	nop
	setx loop_77, %l0, %l1
	jmpl %l1, %l3
	fmovsleu	%xcc,	%f8,	%f14
	movcs	%xcc,	%o5,	%o4
loop_76:
	xnorcc	%g5,	%i7,	%l2
loop_77:
	ta	%icc,	0x1
	ldd	[%l7 + 0x08],	%f26
	set	0x43, %i5
	ldstuba	[%l7 + %i5] 0x04,	%o1
	xnor	%g2,	0x1FB2,	%o0
	ldsh	[%l7 + 0x36],	%i5
	sdivx	%i2,	0x0FD3,	%g1
	edge32l	%i4,	%i1,	%o6
	membar	0x20
	umulcc	%o2,	%g3,	%l4
	nop
	setx	0xB1ADEB538048223D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movvs	%xcc,	%l0,	%g6
	fcmple16	%f24,	%f4,	%i3
	tge	%xcc,	0x5
	movrlez	%l6,	%g7,	%i0
	udivx	%g4,	0x1CB2,	%o3
	fbug,a	%fcc1,	loop_78
	edge8l	%i6,	%l5,	%l1
	addccc	%o7,	0x1531,	%l3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x41] %asi,	%o5
loop_78:
	array8	%g5,	%i7,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o1,	%g2,	%o4
	fmovrslz	%i5,	%f4,	%f5
	udivx	%o0,	0x0C7A,	%i2
	movre	%g1,	0x21A,	%i1
	fmovdcc	%icc,	%f10,	%f25
	bneg,a,pn	%icc,	loop_79
	fcmpne16	%f4,	%f4,	%i4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o6,	%g3
loop_79:
	sir	0x1F23
	edge8l	%l4,	%o2,	%g6
	and	%i3,	%l6,	%g7
	set	0x62, %o0
	lduba	[%l7 + %o0] 0x19,	%i0
	swap	[%l7 + 0x4C],	%g4
	fblg	%fcc3,	loop_80
	stw	%l0,	[%l7 + 0x40]
	fpsub16s	%f19,	%f17,	%f22
	sdiv	%o3,	0x01EC,	%i6
loop_80:
	bneg	%icc,	loop_81
	edge16n	%l5,	%l1,	%l3
	tl	%icc,	0x6
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x81,	%o5
loop_81:
	lduh	[%l7 + 0x08],	%g5
	tgu	%xcc,	0x4
	fble,a	%fcc2,	loop_82
	and	%o7,	%i7,	%o1
	tcs	%xcc,	0x2
	movvc	%icc,	%g2,	%l2
loop_82:
	taddcctv	%i5,	%o0,	%i2
	bl,a,pt	%xcc,	loop_83
	fmul8ulx16	%f28,	%f16,	%f2
	tcc	%xcc,	0x5
	taddcc	%g1,	%o4,	%i4
loop_83:
	nop
	setx loop_84, %l0, %l1
	jmpl %l1, %o6
	movl	%icc,	%g3,	%l4
	nop
	setx	0x7075B4BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	sdivcc	%i1,	0x122E,	%g6
loop_84:
	movre	%o2,	0x3EE,	%l6
	srl	%g7,	%i3,	%i0
	fbe,a	%fcc1,	loop_85
	edge16n	%l0,	%g4,	%i6
	movg	%xcc,	%l5,	%l1
	move	%icc,	%l3,	%o5
loop_85:
	fmovsleu	%xcc,	%f17,	%f24
	tleu	%xcc,	0x5
	tl	%xcc,	0x1
	movvc	%icc,	%o3,	%o7
	fmovdcs	%icc,	%f12,	%f6
	movrne	%g5,	0x080,	%i7
	movcs	%icc,	%o1,	%g2
	sllx	%i5,	%o0,	%l2
	movrgz	%i2,	0x26B,	%o4
	srlx	%g1,	%o6,	%g3
	tneg	%xcc,	0x4
	nop
	setx	0xC7500E39584ABAFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f30
	fmovdle	%xcc,	%f21,	%f16
	tg	%xcc,	0x3
	and	%i4,	0x03DB,	%i1
	mulscc	%g6,	0x133E,	%l4
	stb	%o2,	[%l7 + 0x7A]
	tle	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%l6
	fblg,a	%fcc2,	loop_86
	movcc	%icc,	%i3,	%g7
	brnz	%l0,	loop_87
	fmovsa	%icc,	%f19,	%f27
loop_86:
	membar	0x23
	sir	0x14C6
loop_87:
	nop
	setx	0x3B3B059079A52887,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1E873B26DA1C9CB7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f8,	%f28
	movn	%xcc,	%i0,	%i6
	fmovdne	%xcc,	%f31,	%f31
	tsubcctv	%g4,	%l1,	%l3
	movn	%icc,	%l5,	%o5
	fbl,a	%fcc0,	loop_88
	edge16n	%o7,	%o3,	%i7
	for	%f20,	%f4,	%f0
	ldd	[%l7 + 0x68],	%f10
loop_88:
	movrlez	%o1,	%g2,	%g5
	orcc	%i5,	0x0BD2,	%o0
	and	%i2,	0x1147,	%l2
	set	0x48, %g4
	swapa	[%l7 + %g4] 0x0c,	%o4
	wr	%g0,	0x88,	%asi
	sta	%f8,	[%l7 + 0x6C] %asi
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf8
	membar	#Sync
	faligndata	%f16,	%f0,	%f20
	tgu	%xcc,	0x7
	nop
	setx	0x004C5753,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	taddcctv	%o6,	%g1,	%g3
	bl,a,pn	%xcc,	loop_89
	nop
	setx	0x3164E1F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xE6860E35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f18,	%f26
	tl	%icc,	0x1
	alignaddr	%i4,	%i1,	%l4
loop_89:
	bge,a	loop_90
	brlez	%o2,	loop_91
	movpos	%xcc,	%l6,	%i3
	mulscc	%g6,	%l0,	%i0
loop_90:
	sra	%i6,	%g7,	%g4
loop_91:
	umulcc	%l3,	%l5,	%l1
	mova	%icc,	%o5,	%o3
	fbue	%fcc2,	loop_92
	fmovsg	%icc,	%f4,	%f31
	fnands	%f8,	%f19,	%f2
	tgu	%icc,	0x5
loop_92:
	srl	%i7,	0x07,	%o7
	sethi	0x1531,	%o1
	edge16ln	%g2,	%i5,	%g5
	addcc	%i2,	%l2,	%o4
	movle	%icc,	%o6,	%g1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x38] %asi,	%g3
	edge16n	%o0,	%i1,	%i4
	sub	%l4,	0x121C,	%o2
	fnegs	%f24,	%f30
	nop
	setx	0x7D937D2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x5352491C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f17,	%f13
	set	0x63, %o3
	ldsba	[%l7 + %o3] 0x04,	%l6
	ta	%xcc,	0x7
	fbl,a	%fcc1,	loop_93
	alignaddrl	%g6,	%l0,	%i3
	fmovsneg	%icc,	%f1,	%f20
	fnegd	%f12,	%f14
loop_93:
	subccc	%i6,	%i0,	%g4
	subcc	%l3,	%l5,	%l1
	movre	%o5,	0x3C4,	%o3
	fmovrdgz	%g7,	%f2,	%f10
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%o1
	edge16n	%o7,	%i5,	%g2
	array8	%g5,	%i2,	%o4
	movge	%icc,	%l2,	%g1
	movneg	%icc,	%g3,	%o0
	edge8l	%i1,	%o6,	%l4
	orncc	%o2,	0x0377,	%l6
	bge,a,pt	%icc,	loop_94
	and	%g6,	0x05A1,	%i4
	tl	%icc,	0x7
	brlez	%i3,	loop_95
loop_94:
	subc	%i6,	0x070E,	%l0
	fmovscc	%icc,	%f30,	%f28
	array32	%i0,	%l3,	%g4
loop_95:
	sir	0x0509
	fpsub16s	%f30,	%f19,	%f20
	edge32n	%l1,	%o5,	%l5
	edge32	%o3,	%g7,	%i7
	xorcc	%o7,	%i5,	%g2
	edge16n	%o1,	%i2,	%g5
	tge	%icc,	0x4
	fmovsleu	%xcc,	%f12,	%f26
	addc	%l2,	%g1,	%g3
	fbu,a	%fcc1,	loop_96
	array16	%o0,	%o4,	%o6
	edge32ln	%l4,	%i1,	%o2
	edge32l	%g6,	%l6,	%i3
loop_96:
	edge32n	%i6,	%l0,	%i4
	array16	%i0,	%g4,	%l1
	orncc	%o5,	%l5,	%l3
	movcc	%xcc,	%g7,	%i7
	fbl,a	%fcc3,	loop_97
	tvs	%xcc,	0x2
	addcc	%o3,	%i5,	%o7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%g2
loop_97:
	fmul8sux16	%f2,	%f16,	%f10
	andcc	%o1,	0x1148,	%g5
	edge16n	%i2,	%l2,	%g3
	udivx	%g1,	0x09DD,	%o0
	subccc	%o6,	0x1659,	%l4
	edge8	%i1,	%o4,	%g6
	sllx	%l6,	%o2,	%i3
	sdivx	%l0,	0x0B34,	%i4
	sub	%i6,	0x0324,	%g4
	fmovscc	%xcc,	%f29,	%f17
	edge32n	%l1,	%o5,	%i0
	popc	0x0EB7,	%l5
	smul	%g7,	%i7,	%l3
	edge8ln	%o3,	%i5,	%g2
	bl	loop_98
	addcc	%o7,	%o1,	%g5
	tge	%icc,	0x4
	sdiv	%i2,	0x19D6,	%g3
loop_98:
	nop
	set	0x60, %o7
	stb	%l2,	[%l7 + %o7]
	wr	%g0,	0x19,	%asi
	stha	%o0,	[%l7 + 0x6E] %asi
	sdiv	%o6,	0x0050,	%g1
	bl,a	loop_99
	array16	%l4,	%o4,	%g6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x46] %asi,	%i1
loop_99:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x10] %asi,	%o2
	sra	%l6,	0x0E,	%l0
	udivx	%i3,	0x0EE5,	%i4
	fmovrdlez	%g4,	%f2,	%f14
	nop
	setx	0x630AF9D6D295DC36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x9B237B81665DD214,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f14,	%f22
	call	loop_100
	bpos,a,pt	%xcc,	loop_101
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x1
loop_100:
	te	%xcc,	0x1
loop_101:
	bgu,a	%icc,	loop_102
	fmovspos	%xcc,	%f17,	%f28
	move	%icc,	%i6,	%l1
	subcc	%o5,	0x1850,	%l5
loop_102:
	nop
	setx loop_103, %l0, %l1
	jmpl %l1, %i0
	taddcc	%i7,	0x0428,	%g7
	bshuffle	%f12,	%f22,	%f18
	udiv	%o3,	0x035B,	%l3
loop_103:
	tvc	%icc,	0x0
	xorcc	%i5,	%g2,	%o1
	fbn	%fcc3,	loop_104
	fmovspos	%xcc,	%f1,	%f20
	srlx	%o7,	0x14,	%i2
	movg	%xcc,	%g3,	%l2
loop_104:
	tvs	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x2
	movrlez	%o0,	%g5,	%g1
	sllx	%o6,	%o4,	%l4
	nop
	set	0x58, %i0
	ldsh	[%l7 + %i0],	%i1
	nop
	setx	0x86E7158C1BEA78DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f24
	andncc	%g6,	%l6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i3,	0x1361,	%i4
	udivcc	%g4,	0x05AF,	%o2
	sdiv	%i6,	0x0DEF,	%l1
	or	%l5,	%o5,	%i7
	udiv	%i0,	0x00C2,	%o3
	lduw	[%l7 + 0x4C],	%g7
	movrlez	%l3,	%g2,	%o1
	movleu	%xcc,	%i5,	%i2
	brlez,a	%g3,	loop_105
	sub	%o7,	0x1291,	%o0
	fmovrdgez	%l2,	%f16,	%f16
	sdiv	%g1,	0x17DF,	%g5
loop_105:
	be,a,pt	%icc,	loop_106
	movrlz	%o4,	0x150,	%o6
	taddcctv	%i1,	%g6,	%l6
	flush	%l7 + 0x4C
loop_106:
	fxor	%f18,	%f8,	%f20
	add	%l0,	0x1BCA,	%l4
	fpsub16s	%f24,	%f8,	%f25
	tl	%icc,	0x2
	sir	0x00BF
	ble	loop_107
	orn	%i3,	0x1CC3,	%i4
	nop
	setx	0x3550E139E06882C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fpackfix	%f0,	%f10
loop_107:
	taddcc	%g4,	%i6,	%l1
	fmovde	%icc,	%f21,	%f2
	fors	%f2,	%f19,	%f23
	tle	%xcc,	0x3
	fornot2	%f0,	%f24,	%f20
	movge	%xcc,	%o2,	%l5
	xor	%i7,	0x1691,	%o5
	tpos	%icc,	0x6
	nop
	setx loop_108, %l0, %l1
	jmpl %l1, %i0
	andcc	%o3,	%l3,	%g7
	edge32n	%o1,	%g2,	%i5
	ble,pn	%xcc,	loop_109
loop_108:
	fmovsle	%icc,	%f11,	%f19
	wr	%g0,	0x11,	%asi
	sta	%f0,	[%l7 + 0x2C] %asi
loop_109:
	edge8l	%i2,	%o7,	%g3
	addccc	%l2,	0x1FC7,	%g1
	array8	%o0,	%g5,	%o4
	tpos	%icc,	0x3
	stx	%i1,	[%l7 + 0x30]
	bn	%xcc,	loop_110
	movleu	%icc,	%o6,	%l6
	bcs	loop_111
	subcc	%g6,	0x1771,	%l4
loop_110:
	addcc	%l0,	0x033D,	%i3
	fxnor	%f6,	%f0,	%f18
loop_111:
	taddcctv	%i4,	0x09EF,	%i6
	fbne	%fcc2,	loop_112
	mova	%xcc,	%g4,	%l1
	fmovsleu	%xcc,	%f13,	%f5
	ldstub	[%l7 + 0x7C],	%o2
loop_112:
	fabsd	%f12,	%f24
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f6
	stbar
	movvc	%icc,	%i7,	%o5
	sethi	0x00AA,	%l5
	tg	%xcc,	0x5
	fornot2	%f6,	%f28,	%f30
	nop
	fitos	%f13,	%f9
	popc	%o3,	%i0
	movn	%icc,	%g7,	%l3
	movvs	%xcc,	%g2,	%i5
	fmovrde	%o1,	%f0,	%f10
	tvs	%xcc,	0x0
	fbu	%fcc0,	loop_113
	tvs	%icc,	0x3
	sth	%i2,	[%l7 + 0x4A]
	sub	%g3,	0x0C16,	%l2
loop_113:
	fmovsvc	%xcc,	%f6,	%f27
	fpadd32s	%f9,	%f12,	%f4
	andcc	%g1,	0x1ECE,	%o7
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%f0
	tl	%xcc,	0x7
	pdist	%f18,	%f0,	%f28
	bpos,a,pn	%xcc,	loop_114
	smulcc	%o0,	0x153C,	%g5
	prefetch	[%l7 + 0x58],	 0x1
	set	0x7F, %i2
	lduba	[%l7 + %i2] 0x18,	%o4
loop_114:
	tg	%icc,	0x0
	tsubcc	%i1,	0x1B50,	%l6
	tcc	%icc,	0x1
	orncc	%o6,	0x173A,	%g6
	bge,a	loop_115
	edge32	%l0,	%i3,	%l4
	addc	%i4,	%i6,	%g4
	fmovde	%icc,	%f30,	%f2
loop_115:
	andncc	%l1,	%o2,	%o5
	fnor	%f4,	%f6,	%f2
	movrne	%l5,	%o3,	%i7
	sub	%g7,	%i0,	%l3
	movg	%xcc,	%i5,	%o1
	brz,a	%i2,	loop_116
	xor	%g3,	0x08BA,	%g2
	xnorcc	%g1,	%l2,	%o0
	sdivcc	%o7,	0x1E8E,	%g5
loop_116:
	movg	%icc,	%o4,	%i1
	movrlz	%o6,	%l6,	%l0
	fmovdgu	%xcc,	%f28,	%f15
	bvs,a	%icc,	loop_117
	movge	%icc,	%g6,	%i3
	movcc	%icc,	%l4,	%i4
	fmovdge	%xcc,	%f13,	%f20
loop_117:
	be,a,pn	%icc,	loop_118
	tne	%icc,	0x5
	tgu	%icc,	0x7
	set	0x40, %g6
	lda	[%l7 + %g6] 0x80,	%f5
loop_118:
	sllx	%i6,	0x03,	%g4
	sllx	%o2,	%l1,	%l5
	fabsd	%f18,	%f4
	movvc	%icc,	%o5,	%o3
	movgu	%icc,	%g7,	%i0
	edge32n	%l3,	%i7,	%i5
	xorcc	%o1,	0x185D,	%g3
	bleu,a	%icc,	loop_119
	sdivx	%i2,	0x0D16,	%g2
	fpadd16	%f8,	%f30,	%f8
	nop
	setx	loop_120,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_119:
	xorcc	%g1,	%o0,	%o7
	addccc	%l2,	0x129B,	%g5
	edge16n	%o4,	%o6,	%i1
loop_120:
	fornot2s	%f22,	%f19,	%f24
	array16	%l6,	%l0,	%g6
	fmuld8ulx16	%f15,	%f1,	%f24
	membar	0x45
	fpsub32	%f10,	%f14,	%f28
	tleu	%xcc,	0x7
	alignaddrl	%i3,	%l4,	%i6
	tpos	%icc,	0x3
	fmovspos	%xcc,	%f21,	%f24
	movrgez	%g4,	%o2,	%l1
	fmul8x16	%f14,	%f2,	%f20
	srl	%l5,	%i4,	%o3
	fmovdcc	%xcc,	%f2,	%f23
	alignaddr	%o5,	%g7,	%l3
	movn	%icc,	%i7,	%i0
	edge32l	%o1,	%g3,	%i2
	tn	%icc,	0x4
	xnorcc	%i5,	%g2,	%g1
	or	%o7,	0x0AF3,	%l2
	taddcc	%o0,	%g5,	%o6
	movgu	%xcc,	%o4,	%i1
	tgu	%icc,	0x5
	orcc	%l0,	0x1C27,	%l6
	lduh	[%l7 + 0x18],	%g6
	move	%icc,	%l4,	%i6
	stb	%g4,	[%l7 + 0x77]
	alignaddr	%i3,	%o2,	%l1
	edge16	%i4,	%o3,	%o5
	bgu	%xcc,	loop_121
	fandnot1s	%f19,	%f30,	%f5
	popc	0x0B9A,	%l5
	sll	%g7,	0x1E,	%l3
loop_121:
	and	%i0,	%i7,	%g3
	sir	0x1C35
	edge16ln	%i2,	%o1,	%g2
	fmul8x16al	%f11,	%f11,	%f30
	fmovrde	%g1,	%f0,	%f18
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f2
	fmovrsgz	%i5,	%f23,	%f23
	popc	0x1661,	%o7
	mova	%xcc,	%o0,	%g5
	array16	%o6,	%l2,	%o4
	tvc	%icc,	0x5
	sdivcc	%i1,	0x0475,	%l0
	taddcc	%g6,	0x05CA,	%l4
	andn	%l6,	0x0D1A,	%g4
	fnegs	%f3,	%f18
	fmovrdgez	%i6,	%f8,	%f30
	fble,a	%fcc2,	loop_122
	udivcc	%o2,	0x1992,	%i3
	edge32	%l1,	%i4,	%o3
	edge8l	%o5,	%g7,	%l3
loop_122:
	tsubcctv	%l5,	%i7,	%g3
	ldsh	[%l7 + 0x48],	%i0
	call	loop_123
	movcc	%icc,	%i2,	%g2
	tn	%icc,	0x0
	edge32	%o1,	%i5,	%o7
loop_123:
	fnegd	%f30,	%f10
	bcs,pt	%icc,	loop_124
	array16	%g1,	%g5,	%o6
	te	%xcc,	0x3
	subcc	%o0,	0x1F48,	%l2
loop_124:
	tneg	%icc,	0x1
	edge16n	%i1,	%o4,	%g6
	te	%icc,	0x1
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%l0
	brnz,a	%l6,	loop_125
	andcc	%g4,	0x173D,	%i6
	fxor	%f16,	%f12,	%f4
	fmovsn	%icc,	%f5,	%f6
loop_125:
	fmuld8ulx16	%f3,	%f23,	%f14
	nop
	setx	0xB527436A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xD5B0111A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f0,	%f9
	fmovdn	%xcc,	%f28,	%f16
	nop
	setx	0x90754FB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f15
	edge32l	%o2,	%l4,	%i3
	fbuge,a	%fcc2,	loop_126
	fmovsge	%icc,	%f30,	%f0
	edge8l	%l1,	%o3,	%i4
	sra	%o5,	0x0D,	%g7
loop_126:
	ldstub	[%l7 + 0x7D],	%l3
	orncc	%i7,	0x07BB,	%l5
	popc	%g3,	%i2
	stx	%g2,	[%l7 + 0x20]
	sub	%i0,	0x0139,	%i5
	fcmpgt16	%f10,	%f6,	%o1
	movleu	%xcc,	%g1,	%g5
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x3C] %asi
	movne	%icc,	%o6,	%o0
	movge	%icc,	%l2,	%i1
	tneg	%icc,	0x4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o7
	nop
	setx	0x8C40ED19,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x60A07933,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f28,	%f27
	fbue	%fcc0,	loop_127
	movg	%icc,	%o4,	%g6
	movcc	%icc,	%l6,	%g4
	edge16n	%l0,	%i6,	%l4
loop_127:
	brgz	%i3,	loop_128
	lduw	[%l7 + 0x10],	%l1
	orncc	%o2,	%o3,	%i4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x19] %asi,	%o5
loop_128:
	call	loop_129
	fmovsvs	%xcc,	%f20,	%f26
	array8	%l3,	%g7,	%l5
	edge16l	%g3,	%i2,	%i7
loop_129:
	fmovdleu	%xcc,	%f18,	%f5
	movcs	%icc,	%i0,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f10,	[%l7 + 0x2C] %asi
	xnorcc	%o1,	0x0E1C,	%i5
	brlez,a	%g1,	loop_130
	fsrc2s	%f30,	%f1
	bleu	%xcc,	loop_131
	edge32n	%o6,	%g5,	%l2
loop_130:
	xnorcc	%i1,	0x1C49,	%o7
	fabss	%f3,	%f17
loop_131:
	fbo	%fcc2,	loop_132
	edge16ln	%o0,	%o4,	%l6
	nop
	setx	0x80540E31,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	fbule	%fcc2,	loop_133
loop_132:
	sethi	0x08E8,	%g6
	edge8n	%l0,	%g4,	%i6
	edge16n	%i3,	%l1,	%o2
loop_133:
	tleu	%xcc,	0x1
	movre	%l4,	0x2B0,	%i4
	bcc,pn	%icc,	loop_134
	array8	%o3,	%l3,	%g7
	edge32ln	%l5,	%o5,	%i2
	fabss	%f5,	%f27
loop_134:
	nop
	fitod	%f8,	%f4
	fdtox	%f4,	%f28
	tl	%xcc,	0x2
	movvc	%icc,	%i7,	%i0
	srax	%g3,	0x09,	%o1
	umulcc	%i5,	0x0146,	%g1
	fmuld8sux16	%f4,	%f9,	%f6
	be,a	loop_135
	fmovsvs	%xcc,	%f11,	%f9
	fmovrslz	%o6,	%f4,	%f29
	fmovdle	%icc,	%f27,	%f13
loop_135:
	umulcc	%g2,	%g5,	%i1
	tsubcc	%l2,	%o7,	%o4
	srax	%o0,	0x0B,	%l6
	taddcc	%g6,	0x1180,	%g4
	fandnot1s	%f0,	%f1,	%f22
	fbue,a	%fcc0,	loop_136
	array8	%i6,	%l0,	%i3
	nop
	set	0x6D, %l6
	ldub	[%l7 + %l6],	%l1
	bpos,pn	%icc,	loop_137
loop_136:
	bge	loop_138
	sdivcc	%l4,	0x0006,	%i4
	movcs	%icc,	%o2,	%l3
loop_137:
	movcs	%icc,	%g7,	%o3
loop_138:
	bvc	%xcc,	loop_139
	brlez,a	%o5,	loop_140
	bpos	%icc,	loop_141
	fmovsne	%xcc,	%f17,	%f14
loop_139:
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f23
loop_140:
	fpackfix	%f4,	%f27
loop_141:
	fmovrde	%l5,	%f28,	%f26
	addccc	%i7,	%i0,	%g3
	fbue,a	%fcc1,	loop_142
	edge8n	%i2,	%i5,	%g1
	srax	%o6,	0x06,	%g2
	fnands	%f4,	%f4,	%f23
loop_142:
	movg	%icc,	%g5,	%i1
	te	%xcc,	0x1
	ldsw	[%l7 + 0x10],	%l2
	fba,a	%fcc1,	loop_143
	orn	%o7,	0x0B60,	%o4
	movn	%xcc,	%o1,	%l6
	fpadd16	%f26,	%f12,	%f8
loop_143:
	and	%o0,	0x0EB9,	%g6
	umul	%g4,	0x0497,	%i6
	sdivx	%l0,	0x12F6,	%i3
	bpos,a	loop_144
	nop
	setx	0x8125168A84470921,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f0
	and	%l4,	%l1,	%o2
	alignaddrl	%l3,	%i4,	%o3
loop_144:
	tg	%xcc,	0x7
	fornot1s	%f15,	%f27,	%f29
	stx	%g7,	[%l7 + 0x28]
	edge16	%l5,	%o5,	%i0
	edge8ln	%i7,	%g3,	%i2
	stx	%i5,	[%l7 + 0x40]
	taddcctv	%o6,	0x1C04,	%g1
	fcmpne16	%f0,	%f4,	%g5
	umul	%i1,	0x0D8A,	%l2
	tge	%xcc,	0x3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x64] %asi,	%f25
	movre	%o7,	0x3AA,	%g2
	array8	%o1,	%l6,	%o0
	popc	%g6,	%o4
	nop
	fitos	%f7,	%f5
	fstoi	%f5,	%f19
	movneg	%xcc,	%i6,	%g4
	fpackfix	%f24,	%f1
	umul	%l0,	0x1EDA,	%i3
	fmovdg	%xcc,	%f5,	%f6
	ta	%xcc,	0x1
	addc	%l1,	0x1C69,	%o2
	andn	%l4,	%l3,	%i4
	popc	0x1ACB,	%g7
	movleu	%xcc,	%l5,	%o3
	tcc	%xcc,	0x4
	movcs	%icc,	%i0,	%i7
	tvc	%icc,	0x2
	tl	%icc,	0x4
	stb	%g3,	[%l7 + 0x3C]
	addcc	%o5,	%i2,	%o6
	tl	%icc,	0x6
	fmovsle	%xcc,	%f22,	%f4
	fmovsg	%xcc,	%f24,	%f20
	stw	%g1,	[%l7 + 0x2C]
	umul	%i5,	0x02F9,	%i1
	movg	%icc,	%g5,	%o7
	movpos	%xcc,	%l2,	%g2
	sra	%l6,	%o0,	%g6
	fornot1	%f28,	%f4,	%f22
	movrgez	%o1,	%o4,	%g4
	fbge,a	%fcc3,	loop_145
	tgu	%xcc,	0x0
	smul	%i6,	%i3,	%l1
	srl	%o2,	0x07,	%l4
loop_145:
	fcmpeq16	%f2,	%f4,	%l3
	fbge	%fcc0,	loop_146
	fornot1	%f22,	%f8,	%f18
	move	%icc,	%l0,	%g7
	tleu	%xcc,	0x7
loop_146:
	tg	%icc,	0x0
	movrne	%i4,	%o3,	%l5
	membar	0x2B
	orcc	%i7,	%g3,	%o5
	ldub	[%l7 + 0x3B],	%i2
	andn	%o6,	0x122D,	%g1
	fmovrdlz	%i5,	%f0,	%f14
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x38] %asi,	%i0
	ldsh	[%l7 + 0x66],	%g5
	edge16	%o7,	%i1,	%g2
	pdist	%f14,	%f8,	%f18
	fmul8x16au	%f4,	%f14,	%f0
	alignaddr	%l2,	%o0,	%l6
	sdiv	%o1,	0x1FC3,	%g6
	add	%g4,	0x08D4,	%i6
	tge	%xcc,	0x0
	fmovd	%f6,	%f0
	fmovse	%icc,	%f27,	%f28
	ldsh	[%l7 + 0x1E],	%i3
	tcs	%icc,	0x4
	fmovdcc	%icc,	%f11,	%f10
	subccc	%o4,	%l1,	%l4
	udivcc	%l3,	0x0088,	%o2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x35] %asi,	%l0
	brgz	%g7,	loop_147
	tneg	%icc,	0x6
	orncc	%i4,	%o3,	%i7
	tle	%icc,	0x0
loop_147:
	smul	%g3,	0x0AF3,	%o5
	movrne	%l5,	%o6,	%i2
	subcc	%i5,	0x192D,	%i0
	taddcc	%g5,	%g1,	%i1
	movpos	%icc,	%o7,	%g2
	te	%icc,	0x6
	fcmple16	%f6,	%f16,	%o0
	movge	%xcc,	%l6,	%o1
	orncc	%g6,	0x1AFA,	%g4
	addcc	%l2,	%i3,	%o4
	fabsd	%f14,	%f20
	brgez	%i6,	loop_148
	brgz	%l4,	loop_149
	fpack32	%f0,	%f8,	%f12
	alignaddrl	%l1,	%l3,	%l0
loop_148:
	fmovdleu	%icc,	%f5,	%f6
loop_149:
	sra	%o2,	0x0B,	%g7
	fpadd32	%f8,	%f16,	%f14
	movneg	%icc,	%i4,	%o3
	movgu	%xcc,	%i7,	%g3
	tl	%xcc,	0x4
	fba,a	%fcc0,	loop_150
	srax	%o5,	0x06,	%l5
	andncc	%o6,	%i2,	%i0
	fbule	%fcc0,	loop_151
loop_150:
	movg	%xcc,	%g5,	%i5
	set	0x4C, %l3
	sta	%f14,	[%l7 + %l3] 0x0c
loop_151:
	subc	%g1,	%o7,	%g2
	and	%o0,	%i1,	%o1
	umul	%g6,	0x0E19,	%l6
	mova	%xcc,	%g4,	%i3
	edge32	%o4,	%i6,	%l2
	fbuge,a	%fcc3,	loop_152
	movgu	%xcc,	%l1,	%l4
	tpos	%icc,	0x4
	movge	%icc,	%l0,	%l3
loop_152:
	movge	%xcc,	%g7,	%o2
	ldsb	[%l7 + 0x0D],	%i4
	stbar
	fxnor	%f2,	%f22,	%f22
	sll	%i7,	%g3,	%o5
	mulx	%o3,	%l5,	%o6
	te	%icc,	0x3
	sdiv	%i0,	0x07B1,	%g5
	edge32l	%i5,	%i2,	%g1
	stx	%o7,	[%l7 + 0x78]
	movge	%icc,	%o0,	%g2
	ba,pn	%xcc,	loop_153
	movcs	%icc,	%o1,	%i1
	srlx	%g6,	%l6,	%i3
	nop
	fitos	%f3,	%f27
	fstox	%f27,	%f12
	fxtos	%f12,	%f15
loop_153:
	addccc	%o4,	0x0270,	%i6
	fmovdgu	%icc,	%f8,	%f31
	tn	%icc,	0x2
	subccc	%g4,	0x00CD,	%l1
	set	0x5A, %g5
	ldstuba	[%l7 + %g5] 0x10,	%l4
	taddcctv	%l2,	%l0,	%l3
	sth	%o2,	[%l7 + 0x4C]
	srax	%i4,	0x08,	%g7
	orcc	%i7,	0x1A2A,	%g3
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x15,	%f0
	umulcc	%o5,	%l5,	%o3
	fornot1s	%f15,	%f22,	%f15
	set	0x72, %g1
	ldsba	[%l7 + %g1] 0x19,	%o6
	fbe,a	%fcc2,	loop_154
	umulcc	%i0,	0x08A5,	%g5
	fmovrse	%i2,	%f19,	%f27
	xorcc	%g1,	%i5,	%o7
loop_154:
	sdiv	%o0,	0x09EC,	%o1
	movrlez	%i1,	0x3E9,	%g6
	and	%l6,	%g2,	%o4
	fmovs	%f13,	%f7
	tl	%xcc,	0x0
	bcs,a,pt	%xcc,	loop_155
	movre	%i6,	0x3DE,	%g4
	smul	%i3,	0x0501,	%l1
	nop
	fitos	%f13,	%f7
	fstod	%f7,	%f28
loop_155:
	nop
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	smulcc	%l4,	0x09C1,	%l2
	fmovsvs	%icc,	%f1,	%f13
	tn	%xcc,	0x0
	edge16	%l0,	%l3,	%o2
	xor	%g7,	%i7,	%g3
	brgez,a	%i4,	loop_156
	fand	%f2,	%f20,	%f4
	movrgz	%l5,	0x027,	%o3
	edge8l	%o6,	%i0,	%o5
loop_156:
	alignaddr	%g5,	%i2,	%g1
	sllx	%i5,	0x0B,	%o7
	te	%icc,	0x2
	edge8n	%o1,	%o0,	%i1
	tneg	%xcc,	0x6
	fcmpeq16	%f10,	%f6,	%g6
	edge16n	%g2,	%l6,	%i6
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f16
	fxtod	%f16,	%f28
	add	%l7,	0x44,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x10,	%g4,	%o4
	tcc	%xcc,	0x4
	bneg	%icc,	loop_157
	fmovsvc	%icc,	%f8,	%f5
	edge16	%i3,	%l1,	%l2
	array32	%l0,	%l3,	%o2
loop_157:
	movne	%xcc,	%l4,	%g7
	ble,pn	%xcc,	loop_158
	edge16n	%i7,	%g3,	%i4
	sdiv	%l5,	0x10B8,	%o6
	sdivcc	%o3,	0x0D93,	%o5
loop_158:
	addccc	%i0,	0x1F70,	%i2
	call	loop_159
	orncc	%g5,	%g1,	%i5
	sdiv	%o7,	0x0BED,	%o1
	nop
	setx	0x12D75AFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x5F82CAD0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f31,	%f25
loop_159:
	xorcc	%o0,	0x1AE7,	%i1
	fcmple32	%f24,	%f10,	%g2
	edge32l	%l6,	%i6,	%g6
	movrlz	%g4,	%o4,	%l1
	tleu	%xcc,	0x0
	movcs	%xcc,	%l2,	%i3
	orn	%l0,	%o2,	%l3
	movrlez	%l4,	%g7,	%g3
	subccc	%i4,	%l5,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x3
	xnorcc	%o3,	0x0DAB,	%o5
	movrlz	%i7,	%i0,	%i2
	nop
	fitod	%f10,	%f24
	fdtox	%f24,	%f4
	srl	%g1,	0x1D,	%g5
	smulcc	%i5,	0x0C9D,	%o1
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xeb,	%o6
	fnot1s	%f27,	%f21
	udivcc	%i1,	0x07FE,	%g2
	fmovrslez	%l6,	%f13,	%f1
	or	%i6,	0x0935,	%g6
	sllx	%o0,	%g4,	%o4
	fmovdcs	%icc,	%f19,	%f31
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16l	%l1,	%l2,	%l0
	sdivx	%o2,	0x140E,	%i3
	sdivcc	%l3,	0x15C9,	%l4
	fmovdvs	%icc,	%f28,	%f19
	fmuld8sux16	%f0,	%f12,	%f28
	sdivcc	%g3,	0x1022,	%i4
	srax	%g7,	%l5,	%o6
	movrlz	%o3,	0x2CD,	%i7
	movleu	%xcc,	%i0,	%i2
	array16	%o5,	%g1,	%i5
	edge16ln	%o1,	%o7,	%i1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x15,	%f16
	smulcc	%g2,	%l6,	%i6
	faligndata	%f8,	%f8,	%f26
	tcc	%icc,	0x0
	ldd	[%l7 + 0x30],	%f4
	fmovdl	%icc,	%f6,	%f16
	set	0x10, %l2
	stwa	%g5,	[%l7 + %l2] 0xea
	membar	#Sync
	edge16l	%g6,	%o0,	%o4
	edge8ln	%g4,	%l1,	%l2
	xnorcc	%l0,	%i3,	%l3
	edge8	%l4,	%o2,	%g3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%l5
	andncc	%o6,	%i4,	%i7
	tvc	%icc,	0x3
	tneg	%xcc,	0x3
	membar	0x5E
	fcmpgt16	%f20,	%f24,	%o3
	edge8l	%i2,	%i0,	%o5
	add	%i5,	%o1,	%o7
	be,a	%icc,	loop_160
	movl	%icc,	%i1,	%g1
	smul	%g2,	0x0BB4,	%i6
	nop
	fitos	%f7,	%f14
	fstoi	%f14,	%f29
loop_160:
	swap	[%l7 + 0x40],	%g5
	tgu	%icc,	0x6
	fbo	%fcc0,	loop_161
	movrgez	%l6,	%o0,	%g6
	umulcc	%g4,	0x0816,	%l1
	edge8ln	%o4,	%l0,	%i3
loop_161:
	nop
	set	0x6C, %i3
	ldstuba	[%l7 + %i3] 0x11,	%l3
	sll	%l2,	%l4,	%o2
	array16	%g3,	%g7,	%l5
	add	%o6,	0x0D18,	%i7
	nop
	fitos	%f13,	%f8
	fstod	%f8,	%f6
	fmovsle	%xcc,	%f16,	%f4
	udivcc	%i4,	0x1D47,	%i2
	fors	%f30,	%f15,	%f11
	movrlz	%o3,	0x141,	%o5
	sir	0x0AD9
	brgz,a	%i5,	loop_162
	bneg,a	loop_163
	edge16l	%i0,	%o1,	%o7
	fmul8x16au	%f1,	%f12,	%f18
loop_162:
	tvs	%icc,	0x7
loop_163:
	bvs,a,pn	%icc,	loop_164
	movrgez	%i1,	0x139,	%g1
	tge	%icc,	0x4
	bvs,a	loop_165
loop_164:
	fmovrsgz	%i6,	%f11,	%f22
	andncc	%g5,	%l6,	%o0
	fmovsvc	%icc,	%f11,	%f26
loop_165:
	fmovrdlz	%g2,	%f30,	%f20
	tl	%xcc,	0x0
	nop
	fitos	%f5,	%f21
	fstod	%f21,	%f8
	sll	%g4,	%l1,	%o4
	sdivx	%g6,	0x0857,	%l0
	udivx	%i3,	0x0C28,	%l3
	array16	%l2,	%l4,	%g3
	fmovsg	%icc,	%f10,	%f3
	fmovdgu	%xcc,	%f15,	%f19
	bneg,a	%xcc,	loop_166
	addc	%g7,	0x1672,	%l5
	array32	%o6,	%o2,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_166:
	alignaddrl	%i2,	%i7,	%o5
	xnor	%o3,	%i0,	%o1
	movcs	%xcc,	%o7,	%i5
	array16	%g1,	%i6,	%g5
	smulcc	%l6,	0x0A00,	%i1
	fmul8sux16	%f28,	%f20,	%f28
	nop
	setx	loop_167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2	%f14,	%f0
	array8	%o0,	%g2,	%g4
	andn	%o4,	%g6,	%l1
loop_167:
	xor	%i3,	%l0,	%l2
	sdivcc	%l4,	0x0240,	%l3
	bpos,pn	%xcc,	loop_168
	stb	%g3,	[%l7 + 0x3C]
	andncc	%g7,	%o6,	%o2
	popc	%l5,	%i2
loop_168:
	movneg	%icc,	%i7,	%o5
	set	0x74, %i6
	stba	%o3,	[%l7 + %i6] 0x18
	addccc	%i0,	0x0CA9,	%i4
	add	%o1,	0x0012,	%i5
	movl	%xcc,	%g1,	%i6
	movcs	%icc,	%g5,	%l6
	sra	%i1,	0x1F,	%o7
	udiv	%g2,	0x1D8A,	%g4
	or	%o0,	0x11EC,	%g6
	tvs	%icc,	0x4
	fbug,a	%fcc2,	loop_169
	udivcc	%o4,	0x0E5D,	%l1
	edge8ln	%i3,	%l2,	%l4
	fnot2	%f22,	%f2
loop_169:
	sdivx	%l0,	0x011F,	%l3
	bpos,pn	%icc,	loop_170
	andn	%g3,	%o6,	%o2
	movne	%icc,	%l5,	%i2
	movre	%i7,	%o5,	%o3
loop_170:
	tsubcc	%g7,	0x0DC0,	%i4
	alignaddr	%o1,	%i0,	%g1
	alignaddr	%i6,	%i5,	%l6
	subcc	%i1,	0x0ECF,	%g5
	movg	%xcc,	%o7,	%g4
	subccc	%g2,	%g6,	%o0
	sdiv	%o4,	0x0626,	%i3
	fbul	%fcc1,	loop_171
	fble	%fcc0,	loop_172
	udivx	%l1,	0x0D5B,	%l2
	mulscc	%l0,	%l4,	%g3
loop_171:
	fmovde	%icc,	%f14,	%f10
loop_172:
	movvs	%icc,	%o6,	%l3
	umulcc	%o2,	0x06D0,	%i2
	fpadd32	%f2,	%f30,	%f18
	array32	%l5,	%i7,	%o5
	fba	%fcc1,	loop_173
	movne	%xcc,	%o3,	%i4
	sra	%o1,	0x18,	%i0
	wr	%g0,	0x10,	%asi
	sta	%f25,	[%l7 + 0x60] %asi
loop_173:
	addc	%g7,	%i6,	%i5
	tl	%xcc,	0x2
	brgez	%g1,	loop_174
	tsubcctv	%l6,	%i1,	%o7
	movg	%xcc,	%g4,	%g2
	edge16n	%g5,	%g6,	%o0
loop_174:
	subcc	%i3,	%l1,	%l2
	sdivcc	%o4,	0x1D8F,	%l0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g3,	%o6
	fmovdne	%xcc,	%f17,	%f25
	andcc	%l3,	%l4,	%o2
	lduw	[%l7 + 0x20],	%l5
	xnorcc	%i2,	0x0DC3,	%o5
	fmovdpos	%icc,	%f5,	%f3
	movgu	%xcc,	%o3,	%i7
	fmovda	%xcc,	%f20,	%f6
	movge	%icc,	%i4,	%o1
	array32	%g7,	%i6,	%i0
	addccc	%g1,	0x0B97,	%i5
	edge16	%i1,	%o7,	%g4
	bvc,pn	%icc,	loop_175
	edge8ln	%l6,	%g5,	%g2
	fmuld8sux16	%f20,	%f27,	%f4
	edge32n	%g6,	%o0,	%i3
loop_175:
	fmovrde	%l1,	%f14,	%f2
	edge8ln	%l2,	%o4,	%l0
	movneg	%xcc,	%o6,	%g3
	fpsub32s	%f4,	%f2,	%f6
	movvc	%xcc,	%l4,	%o2
	movvc	%icc,	%l3,	%i2
	tge	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f30,	%f10
	sth	%l5,	[%l7 + 0x22]
	movvs	%icc,	%o5,	%o3
	nop
	setx	0x7E70E30540682192,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	bn,a	loop_176
	bpos,a,pn	%xcc,	loop_177
	fnot2	%f6,	%f0
	edge8n	%i4,	%i7,	%g7
loop_176:
	and	%i6,	%o1,	%g1
loop_177:
	movrlez	%i0,	0x038,	%i1
	fmovda	%icc,	%f24,	%f0
	fmovrdlez	%i5,	%f10,	%f0
	tl	%xcc,	0x6
	fmovdvs	%xcc,	%f15,	%f18
	edge8	%o7,	%l6,	%g4
	movrlez	%g5,	%g6,	%g2
	mulscc	%i3,	%o0,	%l1
	ble	loop_178
	flush	%l7 + 0x1C
	tvs	%xcc,	0x5
	movrlez	%o4,	%l0,	%l2
loop_178:
	movneg	%icc,	%o6,	%g3
	movpos	%xcc,	%o2,	%l4
	nop
	fitos	%f0,	%f5
	fstoi	%f5,	%f2
	ld	[%l7 + 0x60],	%f7
	fsrc1	%f30,	%f20
	te	%icc,	0x3
	sir	0x08FD
	nop
	setx	0x4B621EA4104B80CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fandnot1	%f4,	%f28,	%f8
	fone	%f10
	add	%l3,	%i2,	%l5
	fandnot1s	%f31,	%f3,	%f18
	fmovdle	%xcc,	%f0,	%f2
	umulcc	%o5,	0x1EE3,	%i4
	xnor	%o3,	0x0185,	%g7
	fmovsl	%xcc,	%f22,	%f5
	move	%xcc,	%i6,	%o1
	tvs	%xcc,	0x1
	andn	%i7,	%g1,	%i1
	tcc	%xcc,	0x3
	fbug	%fcc2,	loop_179
	movre	%i5,	0x33E,	%i0
	addccc	%l6,	0x0CE8,	%g4
	edge32ln	%o7,	%g6,	%g2
loop_179:
	taddcc	%i3,	0x1582,	%o0
	udiv	%l1,	0x0DEC,	%o4
	nop
	setx	loop_180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16n	%g5,	%l0,	%o6
	fnot2	%f28,	%f4
	faligndata	%f18,	%f28,	%f28
loop_180:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovdcc	%icc,	%f19,	%f29
	nop
	set	0x62, %l1
	ldub	[%l7 + %l1],	%l2
	fandnot1	%f0,	%f18,	%f2
	udivcc	%o2,	0x0493,	%l4
	sir	0x1FF1
	movre	%g3,	0x2AF,	%l3
	move	%icc,	%i2,	%l5
	stbar
	mulscc	%o5,	%i4,	%g7
	movrgez	%i6,	%o3,	%i7
	ldsw	[%l7 + 0x48],	%g1
	xnorcc	%i1,	0x12AA,	%o1
	set	0x34, %l5
	lda	[%l7 + %l5] 0x10,	%f6
	brz,a	%i0,	loop_181
	addc	%l6,	0x10AC,	%i5
	nop
	fitod	%f8,	%f24
	fdtoi	%f24,	%f26
	nop
	setx	0x506F372D,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_181:
	nop
	fitos	%f5,	%f27
	fstox	%f27,	%f14
	fxtos	%f14,	%f23
	bg,a,pn	%icc,	loop_182
	movvs	%xcc,	%o7,	%g4
	tge	%icc,	0x3
	edge32ln	%g2,	%i3,	%g6
loop_182:
	array32	%o0,	%o4,	%g5
	wr	%g0,	0x52,	%asi
	stxa	%l1,	[%g0 + 0x220] %asi
	udivcc	%o6,	0x0BE0,	%l0
	taddcc	%o2,	0x096C,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f0,	%f0
	fdtoi	%f0,	%f26
	movcc	%xcc,	%l4,	%g3
	array32	%l3,	%i2,	%l5
	movgu	%icc,	%i4,	%o5
	sub	%g7,	0x1F0F,	%i6
	edge32n	%i7,	%g1,	%i1
	tpos	%xcc,	0x1
	subccc	%o3,	%o1,	%l6
	udivx	%i0,	0x04A7,	%o7
	bcs	%xcc,	loop_183
	fmovrse	%g4,	%f18,	%f0
	bn	loop_184
	or	%i5,	%g2,	%g6
loop_183:
	tcc	%xcc,	0x6
	fzeros	%f17
loop_184:
	mulscc	%o0,	0x0740,	%i3
	nop
	setx	0xB1D7EDBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xEFD4276E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f20,	%f13
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x0c,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xE123C03B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f6
	fbne,a	%fcc0,	loop_185
	nop
	setx	loop_186,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x0
	bvs,pn	%icc,	loop_187
loop_185:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_186:
	membar	0x61
	sdiv	%l1,	0x1F4C,	%o4
loop_187:
	bne	loop_188
	be	%icc,	loop_189
	edge16ln	%l0,	%o2,	%l2
	stb	%l4,	[%l7 + 0x18]
loop_188:
	movcc	%xcc,	%g3,	%l3
loop_189:
	fmul8x16al	%f1,	%f23,	%f26
	fmovsne	%xcc,	%f28,	%f13
	wr	%g0,	0x89,	%asi
	stxa	%o6,	[%l7 + 0x48] %asi
	srlx	%i2,	0x01,	%i4
	fmovrdgez	%o5,	%f8,	%f6
	tpos	%xcc,	0x4
	fmul8x16al	%f6,	%f31,	%f8
	bpos	%xcc,	loop_190
	edge8l	%l5,	%i6,	%g7
	move	%xcc,	%i7,	%i1
	orn	%g1,	%o3,	%o1
loop_190:
	nop
	setx	0xD204DB74117D52A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f26
	set	0x30, %g2
	stwa	%i0,	[%l7 + %g2] 0x18
	taddcctv	%o7,	0x0FC5,	%g4
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f8
	wr	%g0,	0xe2,	%asi
	stha	%i5,	[%l7 + 0x5A] %asi
	membar	#Sync
	fmovscc	%xcc,	%f27,	%f21
	addccc	%l6,	0x05C7,	%g2
	movvc	%xcc,	%g6,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%i3,	%f6,	%f7
	set	0x60, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0x3
	tleu	%icc,	0x4
	fmovs	%f22,	%f27
	movle	%icc,	%l1,	%l0
	movvs	%xcc,	%o2,	%l2
	orcc	%o4,	0x0180,	%g3
	array32	%l4,	%o6,	%i2
	fmovrslz	%i4,	%f21,	%f12
	fbul,a	%fcc1,	loop_191
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 0x0
	tne	%icc,	0x1
	tn	%icc,	0x6
loop_191:
	fbuge	%fcc1,	loop_192
	movvs	%xcc,	%o5,	%l3
	movrgz	%i6,	%l5,	%i7
	srlx	%i1,	0x15,	%g7
loop_192:
	nop
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x30] %asi,	%g0
	smulcc	%o1,	0x083F,	%i0
	edge16	%o3,	%o7,	%i5
	sllx	%l6,	%g2,	%g6
	movcs	%xcc,	%o0,	%i3
	tleu	%xcc,	0x6
	sllx	%g4,	%g5,	%l1
	tge	%icc,	0x6
	te	%icc,	0x6
	brz,a	%o2,	loop_193
	udivx	%l0,	0x01B4,	%o4
	udivcc	%l2,	0x06ED,	%l4
	edge16	%g3,	%o6,	%i2
loop_193:
	movl	%icc,	%i4,	%o5
	fbn,a	%fcc1,	loop_194
	movrgez	%i6,	%l5,	%i7
	fblg,a	%fcc2,	loop_195
	smulcc	%l3,	0x1DBF,	%i1
loop_194:
	fmovdle	%xcc,	%f10,	%f28
	movneg	%icc,	%g1,	%g7
loop_195:
	srlx	%i0,	%o3,	%o1
	movvc	%icc,	%i5,	%l6
	fba	%fcc3,	loop_196
	edge8	%g2,	%g6,	%o7
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f8
	edge8ln	%o0,	%i3,	%g5
loop_196:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	%icc,	loop_197
	sll	%l1,	%g4,	%o2
	stb	%o4,	[%l7 + 0x50]
	fba	%fcc0,	loop_198
loop_197:
	fabsd	%f22,	%f12
	popc	0x0EAD,	%l2
	sdivcc	%l0,	0x1836,	%l4
loop_198:
	movvs	%xcc,	%g3,	%o6
	subccc	%i2,	%o5,	%i4
	fone	%f18
	fexpand	%f17,	%f16
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x3E] %asi,	%i6
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f8
	fxtod	%f8,	%f8
	brlz	%i7,	loop_199
	fnot2s	%f18,	%f17
	fmovsne	%xcc,	%f23,	%f16
	tsubcctv	%l5,	%l3,	%i1
loop_199:
	tg	%icc,	0x7
	be,a	%icc,	loop_200
	addcc	%g7,	%i0,	%g1
	ba,a	%icc,	loop_201
	bl,a,pn	%xcc,	loop_202
loop_200:
	nop
	setx	0xD3F17596,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x1637BD81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f10,	%f0
	umul	%o3,	0x0128,	%i5
loop_201:
	subccc	%o1,	0x0D08,	%g2
loop_202:
	fsrc1	%f2,	%f20
	tge	%icc,	0x6
	edge8	%g6,	%o7,	%o0
	movvc	%icc,	%l6,	%g5
	bvs,a	%icc,	loop_203
	fmovsvs	%xcc,	%f16,	%f30
	tcc	%xcc,	0x7
	movgu	%icc,	%l1,	%g4
loop_203:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x62] %asi,	%o2
	fcmpne16	%f12,	%f10,	%o4
	tneg	%xcc,	0x0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i3,	%l2
	fmovdvc	%icc,	%f16,	%f14
	tcc	%icc,	0x2
	movcc	%icc,	%l0,	%l4
	tg	%xcc,	0x4
	movcs	%xcc,	%g3,	%i2
	fmovdn	%xcc,	%f8,	%f14
	edge16ln	%o6,	%o5,	%i6
	fpsub16	%f24,	%f24,	%f12
	fabsd	%f22,	%f6
	nop
	setx	0xD68C417D904848C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fblg	%fcc0,	loop_204
	brlz,a	%i4,	loop_205
	movg	%xcc,	%i7,	%l5
	ta	%xcc,	0x3
loop_204:
	movre	%l3,	0x14F,	%g7
loop_205:
	nop
	fitos	%f3,	%f11
	fstoi	%f11,	%f26
	fmovde	%icc,	%f28,	%f15
	movge	%xcc,	%i1,	%g1
	sdivcc	%i0,	0x1556,	%o3
	bvs,pn	%icc,	loop_206
	stb	%o1,	[%l7 + 0x11]
	ldstub	[%l7 + 0x3E],	%i5
	smul	%g2,	%o7,	%g6
loop_206:
	fmovsgu	%xcc,	%f15,	%f3
	orncc	%l6,	0x1B35,	%g5
	edge16	%o0,	%l1,	%g4
	fcmpgt16	%f24,	%f16,	%o2
	sdiv	%o4,	0x1B73,	%l2
	edge16	%l0,	%i3,	%g3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x10,	%f0
	edge32ln	%i2,	%o6,	%o5
	sra	%l4,	%i6,	%i4
	alignaddr	%i7,	%l3,	%g7
	edge32l	%i1,	%g1,	%i0
	tle	%xcc,	0x0
	movge	%xcc,	%l5,	%o1
	fmovdcs	%icc,	%f16,	%f9
	edge16n	%o3,	%i5,	%o7
	tge	%xcc,	0x7
	tleu	%xcc,	0x3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x2c,	%g6
	set	0x0C, %o2
	stha	%l6,	[%l7 + %o2] 0x04
	fexpand	%f0,	%f10
	set	0x0E, %o0
	lduha	[%l7 + %o0] 0x89,	%g2
	tle	%xcc,	0x2
	subcc	%o0,	%l1,	%g4
	set	0x40, %i7
	prefetcha	[%l7 + %i7] 0x80,	 0x0
	tleu	%icc,	0x5
	udiv	%g5,	0x07B2,	%l2
	tcs	%icc,	0x4
	alignaddrl	%l0,	%i3,	%g3
	umul	%i2,	0x149C,	%o4
	fones	%f24
	movg	%xcc,	%o6,	%o5
	set	0x2F, %o1
	ldsba	[%l7 + %o1] 0x11,	%i6
	movrlz	%i4,	0x3FE,	%l4
	set	0x0B, %g4
	stba	%l3,	[%l7 + %g4] 0x27
	membar	#Sync
	swap	[%l7 + 0x10],	%g7
	bgu,pn	%icc,	loop_207
	mulx	%i7,	0x1229,	%g1
	smulcc	%i0,	0x0002,	%l5
	tvc	%xcc,	0x2
loop_207:
	fbue	%fcc1,	loop_208
	sll	%i1,	%o1,	%o3
	membar	0x48
	tcs	%icc,	0x0
loop_208:
	fbn	%fcc3,	loop_209
	tsubcctv	%o7,	%i5,	%l6
	srl	%g6,	%o0,	%l1
	bcc,a,pt	%xcc,	loop_210
loop_209:
	alignaddr	%g2,	%g4,	%o2
	edge32ln	%g5,	%l0,	%l2
	membar	0x01
loop_210:
	tsubcctv	%i3,	0x151F,	%i2
	srl	%g3,	%o6,	%o5
	movn	%xcc,	%o4,	%i4
	flush	%l7 + 0x18
	andcc	%i6,	0x1838,	%l3
	prefetch	[%l7 + 0x58],	 0x0
	edge32	%l4,	%g7,	%g1
	sdivcc	%i0,	0x1559,	%i7
	fcmpne16	%f2,	%f6,	%l5
	edge16l	%o1,	%o3,	%o7
	edge8	%i1,	%l6,	%i5
	umul	%o0,	0x1B8A,	%l1
	fmovscc	%xcc,	%f22,	%f8
	fnor	%f12,	%f4,	%f22
	mulx	%g2,	0x1017,	%g4
	srl	%o2,	0x19,	%g5
	movneg	%xcc,	%l0,	%g6
	fbue,a	%fcc0,	loop_211
	addc	%l2,	%i3,	%i2
	fzero	%f30
	fabsd	%f0,	%f16
loop_211:
	sll	%o6,	0x1C,	%o5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x44] %asi,	%o4
	fbne	%fcc1,	loop_212
	fbge,a	%fcc3,	loop_213
	movpos	%icc,	%g3,	%i6
	edge32	%i4,	%l4,	%l3
loop_212:
	addccc	%g1,	%i0,	%g7
loop_213:
	addcc	%i7,	0x0D29,	%o1
	subcc	%l5,	%o7,	%i1
	srlx	%l6,	%o3,	%o0
	fbuge,a	%fcc2,	loop_214
	fbule	%fcc1,	loop_215
	brlez	%l1,	loop_216
	fmovrde	%g2,	%f30,	%f8
loop_214:
	fones	%f28
loop_215:
	udivcc	%g4,	0x12F2,	%o2
loop_216:
	addccc	%i5,	%g5,	%l0
	move	%icc,	%g6,	%i3
	fmul8sux16	%f6,	%f8,	%f16
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x5F] %asi,	%i2
	ld	[%l7 + 0x60],	%f19
	fmovrsgez	%o6,	%f22,	%f30
	srlx	%o5,	0x1D,	%o4
	fands	%f25,	%f27,	%f1
	mulx	%g3,	0x0363,	%l2
	subc	%i6,	%l4,	%l3
	movre	%i4,	0x21B,	%g1
	edge16ln	%g7,	%i0,	%i7
	mulx	%l5,	0x00C6,	%o1
	fnands	%f16,	%f2,	%f1
	edge8n	%i1,	%o7,	%l6
	fabsd	%f14,	%f10
	tneg	%icc,	0x1
	fmovrslz	%o0,	%f22,	%f2
	addcc	%o3,	0x0E71,	%g2
	fmovrdgez	%l1,	%f12,	%f4
	subc	%g4,	%o2,	%i5
	edge16ln	%g5,	%l0,	%g6
	addccc	%i2,	%i3,	%o6
	xorcc	%o4,	0x0D30,	%g3
	bgu,a,pn	%xcc,	loop_217
	nop
	setx	0x63EC205F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x3274219C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f30,	%f10
	fcmpeq16	%f0,	%f0,	%o5
	fors	%f1,	%f13,	%f14
loop_217:
	fcmple32	%f22,	%f8,	%l2
	movre	%i6,	0x142,	%l4
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f28
	and	%l3,	0x0AF8,	%i4
	nop
	setx	0x105373D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	tle	%xcc,	0x0
	tne	%xcc,	0x6
	sdiv	%g1,	0x0820,	%g7
	taddcctv	%i0,	0x0023,	%l5
	ldstub	[%l7 + 0x16],	%i7
	fbne,a	%fcc2,	loop_218
	sllx	%i1,	0x0A,	%o7
	fpack32	%f2,	%f0,	%f14
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f27
loop_218:
	srax	%l6,	%o0,	%o1
	fbug	%fcc2,	loop_219
	andcc	%g2,	%o3,	%g4
	or	%o2,	0x02D9,	%i5
	array32	%g5,	%l0,	%l1
loop_219:
	fbuge	%fcc3,	loop_220
	xnor	%g6,	%i3,	%i2
	xnorcc	%o4,	%g3,	%o5
	fmovda	%icc,	%f27,	%f27
loop_220:
	nop
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x16,	%f0
	tvs	%xcc,	0x4
	ld	[%l7 + 0x50],	%f4
	ldub	[%l7 + 0x4B],	%l2
	fxnor	%f22,	%f24,	%f22
	ldsb	[%l7 + 0x27],	%i6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l4
	movrgz	%l3,	0x0B6,	%o6
	bne,a	%icc,	loop_221
	tsubcc	%i4,	%g1,	%g7
	movgu	%icc,	%l5,	%i7
	move	%xcc,	%i0,	%i1
loop_221:
	stbar
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x58] %asi,	%f7
	udivx	%o7,	0x00FE,	%l6
	edge8l	%o0,	%o1,	%o3
	xnorcc	%g4,	0x0E18,	%g2
	subcc	%i5,	%g5,	%o2
	ldx	[%l7 + 0x08],	%l1
	lduh	[%l7 + 0x0E],	%l0
	tne	%icc,	0x4
	sdiv	%i3,	0x0E15,	%i2
	addc	%o4,	%g6,	%g3
	fbne,a	%fcc2,	loop_222
	umul	%l2,	0x12C6,	%i6
	xorcc	%o5,	0x0331,	%l3
	sub	%l4,	%i4,	%o6
loop_222:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g7,	0x12,	%l5
	udivcc	%g1,	0x03FE,	%i0
	ta	%xcc,	0x6
	alignaddr	%i1,	%o7,	%l6
	edge32	%o0,	%i7,	%o1
	fnor	%f22,	%f20,	%f8
	set	0x7C, %o7
	sta	%f17,	[%l7 + %o7] 0x80
	bl	loop_223
	subcc	%g4,	0x13BC,	%o3
	nop
	setx	0x706244F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x55E6676A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f3,	%f5
	and	%g2,	0x1D55,	%i5
loop_223:
	ldd	[%l7 + 0x40],	%f14
	edge32	%g5,	%l1,	%l0
	xnor	%i3,	0x1958,	%i2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16n	%o2,	%o4,	%g6
	orn	%g3,	%l2,	%o5
	tne	%xcc,	0x7
	bvc,a,pt	%icc,	loop_224
	fbl,a	%fcc0,	loop_225
	ldd	[%l7 + 0x18],	%f30
	move	%icc,	%i6,	%l4
loop_224:
	nop
	setx	0x5DD28B4903F94FD7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xFCF18317AED9FC87,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f16,	%f2
loop_225:
	bleu,a	loop_226
	bl	%icc,	loop_227
	array8	%l3,	%i4,	%o6
	movre	%g7,	0x2B1,	%g1
loop_226:
	fba	%fcc0,	loop_228
loop_227:
	edge8l	%l5,	%i0,	%o7
	bpos,pn	%xcc,	loop_229
	array16	%i1,	%o0,	%l6
loop_228:
	orcc	%o1,	0x0289,	%i7
	orcc	%g4,	%g2,	%o3
loop_229:
	fexpand	%f4,	%f6
	xorcc	%i5,	%g5,	%l0
	fmovdcc	%icc,	%f7,	%f6
	fbn	%fcc0,	loop_230
	sdivcc	%l1,	0x1172,	%i3
	movcc	%xcc,	%i2,	%o4
	fsrc2s	%f19,	%f24
loop_230:
	fmovscc	%icc,	%f12,	%f18
	nop
	setx	0xC259AF9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x6909FD64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f20,	%f11
	movneg	%icc,	%g6,	%o2
	bg,pn	%xcc,	loop_231
	movrlz	%l2,	0x14B,	%g3
	brgez,a	%o5,	loop_232
	addc	%i6,	0x12C6,	%l3
loop_231:
	bl,a	%xcc,	loop_233
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f9
loop_232:
	andn	%i4,	%o6,	%g7
	brlez,a	%g1,	loop_234
loop_233:
	ld	[%l7 + 0x68],	%f26
	edge16l	%l5,	%i0,	%l4
	sllx	%o7,	%i1,	%l6
loop_234:
	xnorcc	%o0,	0x0FC8,	%o1
	fbl	%fcc3,	loop_235
	edge8ln	%i7,	%g2,	%g4
	fmovdne	%icc,	%f22,	%f19
	movrgez	%o3,	0x159,	%g5
loop_235:
	udivcc	%l0,	0x011E,	%l1
	sir	0x135C
	edge32l	%i5,	%i3,	%i2
	srl	%g6,	0x1C,	%o2
	bcc,a,pt	%icc,	loop_236
	fbl,a	%fcc3,	loop_237
	nop
	setx	loop_238,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x1
loop_236:
	bleu,a	%icc,	loop_239
loop_237:
	fxor	%f16,	%f30,	%f22
loop_238:
	popc	0x1901,	%o4
	fmovsg	%icc,	%f16,	%f13
loop_239:
	sra	%l2,	%g3,	%o5
	ldd	[%l7 + 0x10],	%f22
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	bcc,pt	%icc,	loop_240
	movrgez	%l3,	%i4,	%o6
	set	0x3F, %i0
	stba	%g1,	[%l7 + %i0] 0x2b
	membar	#Sync
loop_240:
	tneg	%xcc,	0x2
	tcc	%xcc,	0x3
	taddcc	%g7,	0x13EB,	%l5
	set	0x60, %i2
	lduba	[%l7 + %i2] 0x80,	%l4
	xnor	%o7,	%i1,	%i0
	bcs,a,pn	%xcc,	loop_241
	sdivx	%o0,	0x039C,	%l6
	fmovdleu	%xcc,	%f22,	%f28
	xor	%i7,	%o1,	%g4
loop_241:
	orcc	%o3,	0x1385,	%g2
	edge16n	%l0,	%l1,	%i5
	tgu	%icc,	0x3
	fbg,a	%fcc3,	loop_242
	edge32l	%i3,	%i2,	%g6
	movre	%g5,	0x29D,	%o4
	membar	0x4E
loop_242:
	bg,pn	%xcc,	loop_243
	ldsw	[%l7 + 0x24],	%o2
	fmovdn	%xcc,	%f26,	%f1
	edge32ln	%g3,	%o5,	%l2
loop_243:
	ble	%icc,	loop_244
	nop
	setx	0x8AF77F0A82F4CD0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xA8DC8FC06B8AF320,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f12,	%f4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x4A] %asi,	%l3
loop_244:
	fmovsneg	%xcc,	%f21,	%f12
	fornot2	%f8,	%f26,	%f10
	tsubcc	%i6,	%i4,	%g1
	movl	%xcc,	%o6,	%l5
	set	0x54, %g6
	swapa	[%l7 + %g6] 0x18,	%l4
	udivx	%g7,	0x1762,	%o7
	ba,pt	%icc,	loop_245
	tvc	%xcc,	0x3
	fbuge	%fcc2,	loop_246
	subc	%i1,	%i0,	%o0
loop_245:
	move	%xcc,	%l6,	%i7
	movgu	%xcc,	%o1,	%o3
loop_246:
	nop
	set	0x5D, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g4
	fxor	%f30,	%f0,	%f20
	udiv	%g2,	0x14B7,	%l0
	sll	%l1,	%i5,	%i3
	andn	%g6,	0x1A70,	%g5
	tl	%icc,	0x2
	bneg,pn	%xcc,	loop_247
	sub	%o4,	0x13F9,	%i2
	fmovd	%f22,	%f26
	tsubcctv	%g3,	%o5,	%o2
loop_247:
	movrne	%l2,	%i6,	%l3
	bgu,a,pn	%icc,	loop_248
	sdiv	%i4,	0x1C03,	%o6
	stb	%l5,	[%l7 + 0x67]
	xnorcc	%g1,	%g7,	%l4
loop_248:
	movrlez	%i1,	0x36A,	%i0
	nop
	set	0x40, %i1
	stx	%o7,	[%l7 + %i1]
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%l6
	edge16l	%o0,	%o1,	%i7
	bleu,a,pn	%xcc,	loop_249
	tl	%icc,	0x0
	taddcc	%o3,	%g2,	%l0
	st	%f20,	[%l7 + 0x4C]
loop_249:
	fmul8sux16	%f14,	%f6,	%f12
	ldstub	[%l7 + 0x2D],	%l1
	ldub	[%l7 + 0x73],	%i5
	sra	%g4,	0x14,	%i3
	orcc	%g5,	0x19C8,	%o4
	srlx	%g6,	%i2,	%g3
	stx	%o2,	[%l7 + 0x38]
	brlez,a	%l2,	loop_250
	fabsd	%f10,	%f4
	fpsub16s	%f28,	%f10,	%f25
	fpack32	%f28,	%f28,	%f8
loop_250:
	fmovsa	%icc,	%f22,	%f23
	set	0x10, %l6
	stwa	%o5,	[%l7 + %l6] 0xe2
	membar	#Sync
	edge16ln	%l3,	%i4,	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%g1
	fblg	%fcc1,	loop_251
	udivcc	%l5,	0x15EC,	%l4
	sth	%g7,	[%l7 + 0x40]
	bneg,a,pn	%xcc,	loop_252
loop_251:
	sllx	%i1,	0x10,	%o7
	nop
	setx	loop_253,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1s	%f25,	%f21,	%f17
loop_252:
	addc	%i0,	%l6,	%o1
	fmovsa	%icc,	%f25,	%f9
loop_253:
	nop
	setx	0x8DA28BD1900D56CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x90E4E598EF434DA5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f4,	%f16
	stbar
	smul	%i7,	%o0,	%o3
	srax	%l0,	0x09,	%g2
	fmovdvs	%icc,	%f21,	%f20
	fbg	%fcc3,	loop_254
	taddcctv	%l1,	0x1B89,	%i5
	fnegs	%f0,	%f9
	xnor	%g4,	%g5,	%o4
loop_254:
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f6
	edge8ln	%g6,	%i2,	%i3
	srl	%g3,	0x11,	%l2
	tvc	%icc,	0x0
	stx	%o2,	[%l7 + 0x30]
	movgu	%icc,	%o5,	%i4
	move	%xcc,	%o6,	%i6
	tvs	%xcc,	0x6
	array16	%l3,	%g1,	%l5
	edge16l	%g7,	%i1,	%o7
	fbo,a	%fcc3,	loop_255
	movrne	%i0,	0x0AF,	%l6
	tgu	%icc,	0x6
	tneg	%icc,	0x7
loop_255:
	stbar
	fmovdgu	%icc,	%f24,	%f2
	nop
	set	0x10, %g5
	std	%f22,	[%l7 + %g5]
	sir	0x01A5
	edge8	%o1,	%l4,	%i7
	edge32n	%o3,	%l0,	%o0
	addccc	%l1,	0x0804,	%i5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x1A] %asi,	%g2
	fxnors	%f22,	%f6,	%f26
	te	%icc,	0x5
	ta	%xcc,	0x7
	tge	%xcc,	0x1
	swap	[%l7 + 0x54],	%g4
	sll	%g5,	0x0C,	%o4
	sra	%g6,	%i2,	%g3
	sdivx	%i3,	0x08FE,	%l2
	taddcc	%o2,	0x01E3,	%o5
	array8	%o6,	%i6,	%i4
	movvs	%icc,	%g1,	%l3
	fbne	%fcc1,	loop_256
	edge32ln	%g7,	%l5,	%o7
	subccc	%i0,	0x1083,	%i1
	nop
	setx	loop_257,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_256:
	tne	%icc,	0x6
	tcs	%icc,	0x0
	subccc	%o1,	0x0720,	%l6
loop_257:
	bgu,pt	%icc,	loop_258
	nop
	setx	0xA675BF97,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xFEDC419A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f18,	%f8
	sethi	0x1960,	%i7
	wr	%g0,	0x88,	%asi
	sta	%f5,	[%l7 + 0x34] %asi
loop_258:
	bpos,pt	%icc,	loop_259
	edge32n	%l4,	%l0,	%o3
	srax	%l1,	%o0,	%i5
	ldd	[%l7 + 0x50],	%g2
loop_259:
	edge32n	%g5,	%o4,	%g6
	sll	%g4,	%g3,	%i3
	te	%icc,	0x2
	movgu	%icc,	%i2,	%l2
	movcs	%xcc,	%o5,	%o2
	andn	%i6,	%i4,	%g1
	fbue,a	%fcc1,	loop_260
	movgu	%xcc,	%l3,	%g7
	sdivcc	%o6,	0x06D8,	%o7
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%l5
loop_260:
	nop
	setx	0x52A57BF2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xE26305F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f13,	%f11
	set	0x78, %l3
	ldswa	[%l7 + %l3] 0x11,	%i1
	umul	%i0,	0x1F4E,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x3
	edge8l	%l6,	%i7,	%l4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o3
	swap	[%l7 + 0x3C],	%l0
	mova	%xcc,	%o0,	%l1
	fmovda	%xcc,	%f23,	%f22
	fpsub32	%f8,	%f20,	%f4
	movrgez	%i5,	0x073,	%g5
	fabss	%f5,	%f15
	tge	%icc,	0x2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	fbl	%fcc2,	loop_261
	orcc	%g2,	%g4,	%g3
	membar	0x1C
	fmovspos	%xcc,	%f30,	%f18
loop_261:
	movge	%xcc,	%i3,	%g6
	te	%xcc,	0x3
	addcc	%l2,	0x184B,	%o5
	set	0x2E, %l4
	stba	%o2,	[%l7 + %l4] 0x19
	bneg,pt	%xcc,	loop_262
	edge32ln	%i2,	%i6,	%i4
	fnot2s	%f18,	%f27
	srax	%g1,	%g7,	%o6
loop_262:
	tvs	%xcc,	0x4
	edge8ln	%o7,	%l5,	%i1
	fmovs	%f21,	%f30
	std	%f18,	[%l7 + 0x68]
	fmovse	%xcc,	%f26,	%f10
	stbar
	fmovrdne	%i0,	%f12,	%f14
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%l3
	ldd	[%l7 + 0x20],	%i6
	movle	%xcc,	%i7,	%o3
	bleu,a	loop_263
	smulcc	%l0,	0x0222,	%l4
	fbl,a	%fcc1,	loop_264
	mova	%icc,	%o0,	%l1
loop_263:
	nop
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xe3,	%g4
loop_264:
	fandnot1s	%f30,	%f7,	%f26
	movne	%icc,	%o4,	%g2
	fblg,a	%fcc3,	loop_265
	tvc	%icc,	0x3
	umul	%g4,	%i5,	%g3
	sdivcc	%g6,	0x18F7,	%i3
loop_265:
	bleu,a	loop_266
	tg	%xcc,	0x0
	addcc	%o5,	%o2,	%l2
	sll	%i2,	0x0B,	%i6
loop_266:
	edge8n	%g1,	%g7,	%o6
	nop
	setx	0x0EBC43C345AABC8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xC45C2AD74DCDA5A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f4,	%f30
	sra	%o7,	%l5,	%i1
	xor	%i0,	0x1E14,	%i4
	tneg	%icc,	0x1
	edge16	%l3,	%l6,	%i7
	sllx	%o3,	%o1,	%l4
	smul	%o0,	0x068E,	%l1
	tle	%xcc,	0x2
	tl	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g5,	0x1681,	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g2,	%g4
	nop
	setx	0xEEA61484404F7BFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovse	%xcc,	%f13,	%f23
	movrlz	%l0,	0x00A,	%g3
	tleu	%icc,	0x6
	edge16ln	%g6,	%i5,	%o5
	wr	%g0,	0x0c,	%asi
	sta	%f10,	[%l7 + 0x3C] %asi
	fpadd16	%f12,	%f26,	%f30
	nop
	setx	0x0B38B30E3F1681C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f20
	tsubcc	%o2,	%l2,	%i3
	sub	%i2,	%i6,	%g7
	ldsw	[%l7 + 0x4C],	%g1
	addcc	%o6,	%o7,	%i1
	movle	%icc,	%l5,	%i4
	addc	%l3,	%i0,	%i7
	edge32l	%l6,	%o3,	%l4
	brgez	%o1,	loop_267
	tg	%xcc,	0x1
	fmovrdlez	%o0,	%f30,	%f14
	smul	%g5,	%o4,	%g2
loop_267:
	fmul8sux16	%f12,	%f6,	%f8
	sdivcc	%g4,	0x1CD4,	%l1
	ba,pn	%xcc,	loop_268
	mulscc	%l0,	0x102B,	%g6
	fmovrde	%i5,	%f10,	%f6
	mova	%icc,	%g3,	%o5
loop_268:
	tsubcc	%o2,	0x06AB,	%i3
	edge32	%l2,	%i2,	%i6
	nop
	setx	0xF4C96FBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xFD1F0410,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f23,	%f18
	subccc	%g7,	0x1F01,	%g1
	fcmpgt32	%f2,	%f22,	%o7
	nop
	setx	0xBEAE3F9B92CFF7E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xCF71B022F4868B90,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f4,	%f24
	nop
	fitos	%f4,	%f1
	fstoi	%f1,	%f0
	edge16l	%i1,	%o6,	%l5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x78] %asi,	%l3
	edge32ln	%i4,	%i0,	%i7
	tpos	%icc,	0x0
	movge	%icc,	%o3,	%l4
	bge,pn	%xcc,	loop_269
	nop
	setx	0x07B6A7FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x8042A9F4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f22,	%f18
	fmovs	%f7,	%f26
	tn	%icc,	0x1
loop_269:
	fbule,a	%fcc1,	loop_270
	bgu,a	%icc,	loop_271
	array32	%l6,	%o1,	%o0
	sll	%o4,	0x1D,	%g5
loop_270:
	movle	%xcc,	%g4,	%l1
loop_271:
	membar	0x76
	smulcc	%l0,	%g6,	%g2
	tn	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	sta	%f27,	[%l7 + 0x18] %asi
	fpack16	%f6,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x5
	fmovsle	%xcc,	%f18,	%f0
	orcc	%i5,	%o5,	%g3
	orcc	%i3,	0x0EDC,	%l2
	bvs,pn	%icc,	loop_272
	bgu,pt	%icc,	loop_273
	mulx	%i2,	%i6,	%g7
	fcmpgt32	%f24,	%f8,	%g1
loop_272:
	sdivx	%o7,	0x17AD,	%o2
loop_273:
	lduw	[%l7 + 0x44],	%o6
	nop
	setx loop_274, %l0, %l1
	jmpl %l1, %l5
	movrgz	%i1,	0x3B1,	%i4
	tg	%xcc,	0x2
	andn	%i0,	0x0ECE,	%i7
loop_274:
	umul	%l3,	0x114C,	%l4
	edge8n	%l6,	%o3,	%o1
	movrne	%o4,	0x12B,	%g5
	fmovdneg	%xcc,	%f17,	%f17
	tcs	%xcc,	0x4
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f10
	sra	%o0,	0x0B,	%l1
	mulx	%g4,	%l0,	%g2
	bpos,a,pt	%xcc,	loop_275
	tsubcctv	%g6,	%i5,	%g3
	andncc	%o5,	%i3,	%l2
	tcs	%icc,	0x7
loop_275:
	mova	%xcc,	%i6,	%i2
	edge16n	%g7,	%o7,	%o2
	addccc	%o6,	0x1A6C,	%l5
	mulscc	%i1,	%i4,	%g1
	stbar
	nop
	setx	0xF9EDA478,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x965C2C7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f4,	%f9
	movrlez	%i7,	%l3,	%i0
	and	%l4,	0x1397,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f20,	%f22,	%f10
	tne	%xcc,	0x3
	fbule	%fcc1,	loop_276
	mova	%icc,	%o1,	%o4
	xor	%l6,	0x1EBE,	%o0
	tle	%xcc,	0x7
loop_276:
	orcc	%l1,	0x1B70,	%g4
	fmovdn	%xcc,	%f8,	%f8
	fpadd32	%f20,	%f10,	%f26
	nop
	setx	0xA0477E4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	edge32n	%l0,	%g5,	%g2
	nop
	setx	0xF62E7344AFC1666E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x79FEAF79CD7ADBF2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f10,	%f12
	umul	%i5,	0x1171,	%g6
	xor	%o5,	0x0F44,	%g3
	bneg,a,pn	%icc,	loop_277
	bn,pt	%xcc,	loop_278
	addcc	%l2,	%i6,	%i3
	movn	%xcc,	%g7,	%o7
loop_277:
	te	%xcc,	0x7
loop_278:
	fnor	%f18,	%f16,	%f6
	nop
	setx	0x6BD67A6B9075B714,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	subc	%i2,	0x1C3B,	%o2
	udiv	%l5,	0x198C,	%i1
	udivx	%i4,	0x05CE,	%o6
	edge32	%i7,	%l3,	%g1
	fbu	%fcc0,	loop_279
	tneg	%xcc,	0x5
	udivx	%l4,	0x1658,	%o3
	fpack16	%f22,	%f12
loop_279:
	subccc	%i0,	%o4,	%o1
	brlez	%l6,	loop_280
	nop
	setx	0x660B52AF0EEAE9A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x25765137B594DD42,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f26,	%f6
	fbo,a	%fcc1,	loop_281
	movne	%icc,	%o0,	%l1
loop_280:
	umul	%g4,	0x027E,	%g5
	fornot2s	%f29,	%f12,	%f10
loop_281:
	udivx	%l0,	0x1D45,	%i5
	addcc	%g2,	%g6,	%o5
	std	%f12,	[%l7 + 0x20]
	fone	%f26
	swap	[%l7 + 0x44],	%g3
	fblg	%fcc3,	loop_282
	fmovd	%f22,	%f30
	sdiv	%i6,	0x0B4D,	%l2
	movneg	%xcc,	%i3,	%g7
loop_282:
	ta	%xcc,	0x1
	xor	%o7,	%o2,	%i2
	edge16l	%l5,	%i4,	%o6
	ldsh	[%l7 + 0x78],	%i1
	ldsh	[%l7 + 0x6E],	%l3
	fbule	%fcc3,	loop_283
	movrlez	%i7,	%g1,	%l4
	fbe,a	%fcc1,	loop_284
	fornot2s	%f23,	%f29,	%f3
loop_283:
	taddcctv	%o3,	%o4,	%i0
	bg,a,pt	%icc,	loop_285
loop_284:
	edge8	%l6,	%o0,	%l1
	ldd	[%l7 + 0x48],	%f18
	xnor	%o1,	0x10A8,	%g4
loop_285:
	sdiv	%g5,	0x16EC,	%l0
	tgu	%xcc,	0x3
	movrgez	%i5,	0x191,	%g6
	edge32l	%g2,	%g3,	%o5
	movvs	%icc,	%i6,	%i3
	tle	%xcc,	0x3
	edge16	%g7,	%l2,	%o7
	edge16ln	%o2,	%l5,	%i2
	edge8n	%i4,	%o6,	%l3
	movrgz	%i1,	%i7,	%g1
	or	%o3,	%l4,	%o4
	fmovdgu	%icc,	%f20,	%f20
	mulx	%l6,	0x0201,	%o0
	edge32	%l1,	%i0,	%o1
	tge	%xcc,	0x7
	umul	%g5,	%g4,	%l0
	addc	%g6,	%g2,	%i5
	tsubcc	%o5,	0x0248,	%i6
	mova	%icc,	%i3,	%g3
	sllx	%l2,	%o7,	%o2
	fbug,a	%fcc3,	loop_286
	movge	%xcc,	%g7,	%i2
	sethi	0x1745,	%l5
	bge	%icc,	loop_287
loop_286:
	nop
	fitos	%f5,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f21
	ldsb	[%l7 + 0x12],	%o6
	bgu	loop_288
loop_287:
	edge8l	%i4,	%l3,	%i7
	movrlez	%g1,	0x144,	%i1
	fcmple16	%f18,	%f26,	%l4
loop_288:
	bl	loop_289
	mulx	%o3,	%o4,	%l6
	mulscc	%o0,	%i0,	%l1
	movre	%g5,	%o1,	%l0
loop_289:
	fbue	%fcc2,	loop_290
	sra	%g4,	0x0C,	%g2
	sllx	%i5,	0x09,	%g6
	fnands	%f6,	%f23,	%f30
loop_290:
	fmovsge	%icc,	%f4,	%f7
	sllx	%o5,	0x04,	%i6
	mulx	%g3,	%l2,	%i3
	smulcc	%o7,	0x0A1B,	%o2
	udivcc	%i2,	0x1420,	%g7
	movvc	%icc,	%l5,	%o6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge8	%l3,	%i4,	%i7
	fabss	%f18,	%f14
	stx	%g1,	[%l7 + 0x50]
	andcc	%l4,	%o3,	%o4
	wr	%g0,	0x88,	%asi
	sta	%f20,	[%l7 + 0x5C] %asi
	edge32n	%i1,	%l6,	%i0
	edge8ln	%l1,	%g5,	%o0
	andn	%l0,	%g4,	%g2
	flush	%l7 + 0x2C
	udivcc	%i5,	0x02B4,	%g6
	fblg	%fcc2,	loop_291
	bge	%xcc,	loop_292
	mulx	%o5,	0x07C5,	%i6
	sir	0x09E8
loop_291:
	fbo	%fcc2,	loop_293
loop_292:
	fmovrslez	%g3,	%f14,	%f0
	brgez,a	%o1,	loop_294
	te	%xcc,	0x5
loop_293:
	sethi	0x027F,	%i3
	set	0x75, %g3
	ldstuba	[%l7 + %g3] 0x19,	%l2
loop_294:
	andn	%o2,	0x03B8,	%o7
	tneg	%icc,	0x4
	fnegd	%f30,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x4
	fmovsa	%xcc,	%f15,	%f13
	movvc	%icc,	%i2,	%l5
	movrgz	%o6,	0x0A6,	%g7
	add	%l3,	%i7,	%g1
	and	%i4,	%l4,	%o3
	array8	%i1,	%o4,	%i0
	bvs	%xcc,	loop_295
	fmovdleu	%icc,	%f4,	%f28
	alignaddrl	%l6,	%l1,	%o0
	fsrc1	%f28,	%f14
loop_295:
	fcmpne32	%f16,	%f28,	%l0
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x18,	 0x2
	pdist	%f28,	%f16,	%f24
	tne	%icc,	0x0
	tn	%icc,	0x0
	fand	%f26,	%f10,	%f0
	fbl	%fcc1,	loop_296
	array8	%g2,	%i5,	%g4
	pdist	%f24,	%f16,	%f14
	movrne	%o5,	%i6,	%g3
loop_296:
	andcc	%o1,	0x009E,	%g6
	array16	%i3,	%o2,	%o7
	brlz,a	%l2,	loop_297
	xnor	%i2,	%l5,	%o6
	andn	%g7,	0x0043,	%i7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x26] %asi,	%g1
loop_297:
	subcc	%i4,	%l3,	%l4
	te	%xcc,	0x7
	edge32l	%o3,	%i1,	%i0
	edge8	%o4,	%l6,	%o0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x70] %asi,	%l1
	movrlz	%g5,	%g2,	%i5
	fbug,a	%fcc1,	loop_298
	stb	%l0,	[%l7 + 0x52]
	andcc	%o5,	0x1D38,	%g4
	fnegd	%f22,	%f2
loop_298:
	te	%xcc,	0x7
	brnz,a	%g3,	loop_299
	edge16l	%o1,	%i6,	%g6
	tvs	%icc,	0x2
	std	%f24,	[%l7 + 0x08]
loop_299:
	array16	%o2,	%i3,	%o7
	edge32n	%i2,	%l2,	%l5
	call	loop_300
	fabss	%f10,	%f9
	sir	0x0875
	alignaddr	%o6,	%g7,	%g1
loop_300:
	fmovrdgz	%i4,	%f6,	%f4
	movpos	%xcc,	%i7,	%l3
	fbule	%fcc0,	loop_301
	nop
	setx	0x1C982672B19D76D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x505527D6C30F0052,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f22,	%f28
	xnorcc	%o3,	0x19ED,	%i1
	flush	%l7 + 0x74
loop_301:
	srax	%l4,	0x07,	%i0
	movrne	%o4,	0x201,	%o0
	alignaddr	%l1,	%g5,	%g2
	movle	%xcc,	%l6,	%l0
	movre	%o5,	%g4,	%g3
	fandnot1s	%f11,	%f29,	%f14
	fornot2s	%f19,	%f14,	%f19
	edge32l	%i5,	%o1,	%i6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x48] %asi,	%g6
	fmovrsgz	%i3,	%f16,	%f6
	subcc	%o7,	%o2,	%i2
	sir	0x1890
	fmovrse	%l5,	%f11,	%f23
	srlx	%l2,	0x13,	%o6
	fbl,a	%fcc1,	loop_302
	nop
	set	0x70, %l2
	stx	%g7,	[%l7 + %l2]
	move	%xcc,	%g1,	%i7
	movcc	%icc,	%i4,	%l3
loop_302:
	popc	0x16E8,	%o3
	movrlez	%l4,	0x3C6,	%i0
	sdivx	%o4,	0x0A48,	%o0
	andn	%l1,	%g5,	%g2
	ld	[%l7 + 0x4C],	%f7
	brgz,a	%l6,	loop_303
	fmovdge	%icc,	%f19,	%f22
	fpadd32s	%f10,	%f19,	%f11
	fabss	%f1,	%f17
loop_303:
	move	%xcc,	%i1,	%l0
	orcc	%g4,	%g3,	%i5
	set	0x78, %i6
	swapa	[%l7 + %i6] 0x18,	%o5
	sethi	0x16D8,	%o1
	movleu	%xcc,	%i6,	%i3
	smul	%o7,	%g6,	%o2
	fnegs	%f16,	%f9
	fpsub16	%f6,	%f24,	%f24
	fmovsgu	%icc,	%f7,	%f1
	subccc	%l5,	0x0379,	%l2
	srlx	%o6,	0x0B,	%g7
	nop
	fitos	%f3,	%f2
	fstod	%f2,	%f2
	edge8n	%g1,	%i2,	%i4
	ta	%icc,	0x4
	nop
	setx	0xB8763BACAC3349AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f24
	tge	%icc,	0x5
	tgu	%xcc,	0x4
	fbu,a	%fcc0,	loop_304
	movrgez	%i7,	0x14D,	%l3
	movrgez	%l4,	%i0,	%o4
	movl	%icc,	%o3,	%l1
loop_304:
	xnorcc	%o0,	%g5,	%l6
	smulcc	%i1,	%l0,	%g4
	edge32	%g3,	%i5,	%o5
	edge8l	%o1,	%i6,	%i3
	movcc	%icc,	%o7,	%g6
	xnor	%o2,	%l5,	%g2
	and	%o6,	0x09BA,	%l2
	nop
	setx	loop_305,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%g1,	0x285,	%i2
	fbue	%fcc2,	loop_306
	fmovsg	%xcc,	%f8,	%f5
loop_305:
	xor	%g7,	%i4,	%l3
	movpos	%icc,	%i7,	%i0
loop_306:
	tle	%icc,	0x7
	alignaddr	%l4,	%o3,	%o4
	orn	%l1,	0x1C66,	%o0
	addcc	%g5,	%i1,	%l6
	fblg,a	%fcc0,	loop_307
	array32	%g4,	%g3,	%l0
	addccc	%o5,	%o1,	%i5
	membar	0x0C
loop_307:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%i3
	movvs	%icc,	%o7,	%i6
	bcc,a,pn	%xcc,	loop_308
	sir	0x1116
	fmovspos	%icc,	%f10,	%f24
	movl	%icc,	%g6,	%o2
loop_308:
	edge16ln	%l5,	%o6,	%g2
	membar	0x2F
	tl	%xcc,	0x3
	sra	%l2,	0x1C,	%g1
	fmovdge	%icc,	%f17,	%f31
	addcc	%i2,	%i4,	%l3
	fnot2s	%f17,	%f5
	nop
	fitos	%f0,	%f30
	fstoi	%f30,	%f7
	tvc	%icc,	0x0
	edge32l	%i7,	%g7,	%l4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o3
	fbe	%fcc3,	loop_309
	movg	%xcc,	%o4,	%l1
	movcs	%icc,	%o0,	%g5
	set	0x44, %i3
	lduha	[%l7 + %i3] 0x11,	%i0
loop_309:
	sub	%l6,	%g4,	%i1
	brgez	%g3,	loop_310
	tn	%icc,	0x7
	fmovse	%icc,	%f19,	%f26
	bne,pn	%xcc,	loop_311
loop_310:
	movrgez	%l0,	%o5,	%o1
	nop
	set	0x28, %l1
	stx	%i5,	[%l7 + %l1]
	xor	%o7,	%i3,	%i6
loop_311:
	array8	%g6,	%l5,	%o2
	movvc	%xcc,	%g2,	%o6
	udivcc	%g1,	0x0600,	%l2
	fcmple32	%f30,	%f12,	%i4
	edge32n	%i2,	%i7,	%g7
	taddcctv	%l3,	0x182A,	%o3
	fpsub16	%f0,	%f0,	%f10
	ldsw	[%l7 + 0x18],	%l4
	movrgz	%o4,	%l1,	%g5
	sllx	%o0,	0x03,	%l6
	fmovdge	%icc,	%f27,	%f23
	srax	%g4,	0x1D,	%i0
	ldub	[%l7 + 0x1E],	%g3
	fpmerge	%f5,	%f2,	%f28
	udivcc	%l0,	0x1890,	%i1
	orncc	%o1,	%i5,	%o7
	tcs	%xcc,	0x6
	set	0x1E, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i3
	move	%icc,	%o5,	%i6
	edge32n	%l5,	%g6,	%g2
	tneg	%xcc,	0x0
	sdiv	%o6,	0x13F5,	%o2
	stx	%l2,	[%l7 + 0x30]
	fmovsne	%icc,	%f20,	%f23
	mulx	%g1,	%i4,	%i2
	subccc	%g7,	%i7,	%o3
	sll	%l4,	%o4,	%l3
	mulscc	%l1,	0x0253,	%g5
	sir	0x195F
	tne	%icc,	0x1
	fcmpeq32	%f16,	%f6,	%o0
	alignaddr	%l6,	%g4,	%i0
	movrne	%g3,	0x0F8,	%i1
	nop
	setx	0x7EF65346,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x00D56B30,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f6,	%f16
	subccc	%l0,	%i5,	%o7
	tvc	%xcc,	0x5
	array32	%o1,	%o5,	%i3
	tg	%xcc,	0x1
	movgu	%xcc,	%i6,	%l5
	mova	%icc,	%g2,	%g6
	movrlz	%o6,	%o2,	%g1
	fbg,a	%fcc2,	loop_312
	fbul,a	%fcc3,	loop_313
	edge16ln	%i4,	%i2,	%g7
	bpos,a	loop_314
loop_312:
	std	%f28,	[%l7 + 0x50]
loop_313:
	orncc	%l2,	0x1008,	%o3
	fmovdvs	%xcc,	%f4,	%f25
loop_314:
	tgu	%xcc,	0x3
	movg	%xcc,	%i7,	%o4
	tleu	%icc,	0x0
	edge16	%l4,	%l1,	%l3
	tcs	%xcc,	0x0
	fmuld8sux16	%f15,	%f0,	%f8
	subcc	%g5,	%o0,	%l6
	bgu	%xcc,	loop_315
	tn	%icc,	0x5
	movvs	%icc,	%i0,	%g3
	nop
	setx	0x45CB0071,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xA931B9DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f12,	%f30
loop_315:
	fbn,a	%fcc3,	loop_316
	tpos	%xcc,	0x4
	udivx	%g4,	0x0BA2,	%l0
	sra	%i5,	0x1F,	%o7
loop_316:
	fpadd32	%f12,	%f0,	%f2
	sllx	%i1,	%o5,	%i3
	movvs	%icc,	%i6,	%o1
	addc	%l5,	0x1718,	%g6
	sir	0x1B1B
	addc	%o6,	%g2,	%o2
	fblg	%fcc0,	loop_317
	te	%xcc,	0x0
	bshuffle	%f2,	%f22,	%f22
	srax	%g1,	0x00,	%i4
loop_317:
	tgu	%xcc,	0x1
	sdiv	%i2,	0x161E,	%l2
	andn	%g7,	0x0FE0,	%i7
	fnand	%f24,	%f2,	%f30
	sdivx	%o4,	0x0D42,	%o3
	fabsd	%f10,	%f2
	std	%f4,	[%l7 + 0x28]
	brgez,a	%l1,	loop_318
	bvc	loop_319
	xnorcc	%l4,	0x0EF9,	%l3
	nop
	setx	0x0209CB0B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x9B75969E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f4,	%f21
loop_318:
	tle	%xcc,	0x0
loop_319:
	popc	%o0,	%l6
	fmovdvs	%xcc,	%f10,	%f19
	tl	%xcc,	0x6
	edge32l	%g5,	%i0,	%g4
	array16	%g3,	%i5,	%l0
	fmovrdlez	%o7,	%f16,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i1,	%i3
	fbo,a	%fcc3,	loop_320
	fmovscc	%xcc,	%f22,	%f24
	sdivx	%i6,	0x16E7,	%o1
	edge16	%o5,	%g6,	%o6
loop_320:
	fbe	%fcc0,	loop_321
	te	%xcc,	0x4
	fxors	%f9,	%f31,	%f0
	movrlz	%g2,	%l5,	%o2
loop_321:
	array8	%i4,	%g1,	%l2
	edge32l	%g7,	%i7,	%o4
	sdiv	%i2,	0x16CF,	%o3
	nop
	setx	loop_322,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x1
	edge32l	%l1,	%l4,	%o0
	array32	%l3,	%l6,	%g5
loop_322:
	xor	%g4,	0x1965,	%i0
	fands	%f25,	%f23,	%f22
	tne	%icc,	0x0
	fbug,a	%fcc3,	loop_323
	tcs	%icc,	0x6
	fmovdgu	%icc,	%f4,	%f10
	tl	%icc,	0x5
loop_323:
	ldsw	[%l7 + 0x7C],	%g3
	tvs	%icc,	0x2
	tleu	%xcc,	0x5
	fbo,a	%fcc2,	loop_324
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x59],	%i5
	xor	%l0,	0x1908,	%o7
loop_324:
	sethi	0x12D0,	%i3
	fmovdvc	%xcc,	%f1,	%f14
	fbuge	%fcc1,	loop_325
	fmovspos	%xcc,	%f5,	%f16
	movcs	%xcc,	%i6,	%o1
	sir	0x1F69
loop_325:
	fba	%fcc3,	loop_326
	edge8	%i1,	%g6,	%o5
	movrne	%o6,	0x050,	%l5
	nop
	setx	loop_327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_326:
	taddcc	%g2,	%o2,	%g1
	bcc	%xcc,	loop_328
	fxnors	%f2,	%f0,	%f30
loop_327:
	movn	%xcc,	%i4,	%l2
	fba	%fcc1,	loop_329
loop_328:
	ta	%icc,	0x0
	fnegd	%f20,	%f28
	tle	%xcc,	0x5
loop_329:
	edge8ln	%g7,	%i7,	%o4
	set	0x16, %o4
	lduha	[%l7 + %o4] 0x89,	%o3
	sll	%i2,	0x0D,	%l1
	bne	loop_330
	sdivx	%l4,	0x15E3,	%l3
	tne	%icc,	0x2
	edge32l	%o0,	%g5,	%g4
loop_330:
	movl	%icc,	%l6,	%g3
	movvc	%xcc,	%i0,	%i5
	sethi	0x045B,	%o7
	movrne	%i3,	0x093,	%l0
	sub	%o1,	%i6,	%g6
	nop
	setx	0x67D64BB330680BDD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	ldd	[%l7 + 0x60],	%f8
	fpadd16s	%f30,	%f12,	%f25
	stx	%o5,	[%l7 + 0x78]
	fmovdn	%icc,	%f28,	%f9
	ble	%xcc,	loop_331
	taddcctv	%i1,	0x094F,	%o6
	xor	%g2,	0x0E38,	%o2
	nop
	setx	0xA07568BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
loop_331:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x6C] %asi,	%f22
	movcc	%icc,	%l5,	%g1
	fmovdleu	%xcc,	%f18,	%f12
	orncc	%l2,	0x16A6,	%i4
	orcc	%i7,	%o4,	%o3
	move	%icc,	%i2,	%l1
	sra	%g7,	0x14,	%l3
	nop
	setx	loop_332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%o0,	%g5,	%l4
	smulcc	%l6,	%g3,	%i0
	tcc	%icc,	0x5
loop_332:
	edge32ln	%g4,	%i5,	%i3
	orncc	%l0,	0x1ABC,	%o7
	edge8l	%o1,	%g6,	%i6
	ldsb	[%l7 + 0x5F],	%i1
	ldsh	[%l7 + 0x2E],	%o6
	call	loop_333
	movleu	%xcc,	%o5,	%g2
	orncc	%l5,	0x1616,	%g1
	nop
	set	0x4A, %g2
	sth	%l2,	[%l7 + %g2]
loop_333:
	tn	%icc,	0x5
	fpadd32	%f20,	%f20,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%o2,	%i7
	tcc	%xcc,	0x6
	fcmple16	%f20,	%f20,	%o4
	fcmple32	%f4,	%f26,	%o3
	nop
	fitos	%f6,	%f25
	fstox	%f25,	%f28
	andn	%i2,	%l1,	%i4
	tvc	%icc,	0x7
	stw	%l3,	[%l7 + 0x1C]
	edge16ln	%g7,	%g5,	%l4
	nop
	set	0x08, %l0
	ldstub	[%l7 + %l0],	%o0
	sll	%l6,	%g3,	%g4
	move	%icc,	%i5,	%i0
	fnands	%f26,	%f29,	%f2
	fandnot1s	%f30,	%f4,	%f27
	fmovrslz	%i3,	%f15,	%f26
	sdiv	%o7,	0x062F,	%o1
	xnor	%g6,	%i6,	%l0
	sdivx	%i1,	0x096D,	%o5
	fmovdgu	%xcc,	%f28,	%f29
	ldx	[%l7 + 0x30],	%g2
	edge16	%o6,	%l5,	%g1
	fbu,a	%fcc1,	loop_334
	mulx	%o2,	%i7,	%l2
	xnor	%o4,	0x17C0,	%i2
	srl	%l1,	0x18,	%o3
loop_334:
	nop
	setx	0x33EB76D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xB942FFC0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f28,	%f11
	wr	%g0,	0xea,	%asi
	stba	%i4,	[%l7 + 0x1F] %asi
	membar	#Sync
	subc	%l3,	%g7,	%g5
	array32	%o0,	%l6,	%g3
	nop
	set	0x38, %o5
	stx	%l4,	[%l7 + %o5]
	fmovdcc	%icc,	%f22,	%f19
	bcc,a	%xcc,	loop_335
	sll	%g4,	%i5,	%i0
	movg	%icc,	%o7,	%o1
	fbule	%fcc0,	loop_336
loop_335:
	edge8ln	%i3,	%i6,	%g6
	tcc	%icc,	0x4
	fmovdvs	%icc,	%f6,	%f14
loop_336:
	orcc	%l0,	%i1,	%o5
	sdiv	%o6,	0x1A42,	%l5
	movrlez	%g1,	%g2,	%i7
	fpackfix	%f6,	%f18
	fpadd16s	%f16,	%f7,	%f14
	fnot1	%f18,	%f24
	movne	%icc,	%o2,	%o4
	edge8	%l2,	%l1,	%i2
	fxnor	%f2,	%f18,	%f2
	sdivx	%o3,	0x1CEB,	%l3
	mova	%xcc,	%g7,	%i4
	move	%xcc,	%o0,	%l6
	fmovdg	%xcc,	%f0,	%f12
	st	%f13,	[%l7 + 0x78]
	fornot2s	%f8,	%f4,	%f7
	orncc	%g5,	%l4,	%g3
	tpos	%icc,	0x4
	fbug,a	%fcc0,	loop_337
	sir	0x0F27
	nop
	setx loop_338, %l0, %l1
	jmpl %l1, %i5
	array8	%g4,	%o7,	%o1
loop_337:
	std	%f16,	[%l7 + 0x38]
	tvs	%icc,	0x1
loop_338:
	tl	%icc,	0x0
	sra	%i0,	0x0A,	%i6
	sdivx	%i3,	0x10C9,	%g6
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x14,	%l0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i1
	set	0x76, %i4
	stba	%l5,	[%l7 + %i4] 0x2b
	membar	#Sync
	std	%f8,	[%l7 + 0x68]
	edge32n	%o6,	%g1,	%g2
	fmovdn	%xcc,	%f22,	%f29
	sll	%i7,	0x16,	%o2
	edge32ln	%l2,	%o4,	%l1
	fmovdle	%icc,	%f7,	%f21
	tg	%icc,	0x3
	edge16	%o3,	%i2,	%g7
	or	%i4,	%o0,	%l6
	bcc,a	%xcc,	loop_339
	orcc	%l3,	%g5,	%l4
	movre	%i5,	%g4,	%o7
	movrlz	%o1,	%g3,	%i6
loop_339:
	fmovdcs	%icc,	%f2,	%f14
	fmul8sux16	%f16,	%f16,	%f14
	tpos	%icc,	0x5
	srax	%i3,	%i0,	%g6
	edge16ln	%l0,	%o5,	%l5
	movn	%xcc,	%i1,	%o6
	movg	%icc,	%g1,	%g2
	movrlz	%o2,	0x09A,	%l2
	fmovrdlez	%o4,	%f26,	%f26
	srl	%l1,	0x17,	%o3
	tl	%icc,	0x4
	add	%i7,	0x1F60,	%i2
	movl	%icc,	%i4,	%o0
	fbne,a	%fcc0,	loop_340
	ldx	[%l7 + 0x28],	%l6
	edge16n	%g7,	%l3,	%l4
	set	0x4C, %o0
	ldswa	[%l7 + %o0] 0x19,	%i5
loop_340:
	fpsub16s	%f7,	%f20,	%f26
	fmovdn	%icc,	%f9,	%f23
	edge8l	%g4,	%o7,	%o1
	fble	%fcc1,	loop_341
	fsrc1	%f4,	%f12
	st	%f10,	[%l7 + 0x40]
	edge8l	%g5,	%g3,	%i3
loop_341:
	movl	%xcc,	%i6,	%i0
	movrlz	%g6,	%l0,	%o5
	fpackfix	%f6,	%f9
	andn	%i1,	0x0817,	%l5
	fornot2	%f10,	%f28,	%f22
	srax	%o6,	%g2,	%g1
	bpos	%xcc,	loop_342
	move	%xcc,	%o2,	%o4
	lduh	[%l7 + 0x3C],	%l2
	sth	%o3,	[%l7 + 0x2C]
loop_342:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f30,	%f24
	fmovsleu	%xcc,	%f3,	%f27
	ldsb	[%l7 + 0x41],	%l1
	membar	0x29
	fsrc1	%f6,	%f24
	subc	%i7,	0x11D7,	%i4
	fsrc2s	%f1,	%f14
	sethi	0x10DE,	%o0
	addcc	%l6,	%i2,	%g7
	nop
	set	0x38, %i7
	sth	%l4,	[%l7 + %i7]
	brgz	%l3,	loop_343
	sub	%i5,	%g4,	%o1
	lduh	[%l7 + 0x7E],	%o7
	stbar
loop_343:
	movvc	%xcc,	%g5,	%i3
	srl	%i6,	%i0,	%g3
	bneg,a,pt	%icc,	loop_344
	srax	%g6,	%l0,	%i1
	umulcc	%o5,	0x1E30,	%l5
	tcs	%xcc,	0x5
loop_344:
	fmul8ulx16	%f28,	%f12,	%f16
	tvs	%xcc,	0x5
	taddcctv	%o6,	%g1,	%o2
	movl	%xcc,	%o4,	%g2
	brgz,a	%l2,	loop_345
	movneg	%icc,	%o3,	%l1
	te	%icc,	0x3
	srl	%i4,	%o0,	%l6
loop_345:
	movgu	%icc,	%i2,	%i7
	and	%l4,	%l3,	%i5
	edge16n	%g7,	%o1,	%g4
	st	%f28,	[%l7 + 0x70]
	add	%o7,	0x132C,	%g5
	stw	%i3,	[%l7 + 0x74]
	edge32	%i0,	%g3,	%i6
	movpos	%icc,	%l0,	%g6
	orcc	%o5,	%l5,	%i1
	edge16l	%g1,	%o2,	%o4
	tl	%icc,	0x3
	orcc	%o6,	%g2,	%l2
	nop
	fitos	%f4,	%f19
	fstoi	%f19,	%f24
	xnor	%l1,	%o3,	%o0
	subccc	%l6,	%i4,	%i2
	smul	%i7,	%l3,	%l4
	nop
	set	0x6E, %o1
	sth	%g7,	[%l7 + %o1]
	sll	%i5,	0x19,	%g4
	bge,pt	%icc,	loop_346
	movn	%xcc,	%o1,	%g5
	taddcc	%o7,	0x0E67,	%i3
	sdiv	%i0,	0x1375,	%g3
loop_346:
	fcmple32	%f24,	%f30,	%i6
	movvc	%xcc,	%l0,	%g6
	fornot2	%f14,	%f16,	%f14
	fmovdpos	%xcc,	%f16,	%f8
	tne	%icc,	0x5
	tpos	%icc,	0x6
	subccc	%o5,	0x0BBA,	%l5
	fmovsneg	%icc,	%f4,	%f0
	subccc	%g1,	%i1,	%o4
	udivcc	%o2,	0x03FD,	%o6
	stb	%l2,	[%l7 + 0x2A]
	sth	%g2,	[%l7 + 0x60]
	edge32l	%l1,	%o0,	%l6
	fmul8ulx16	%f30,	%f4,	%f10
	and	%i4,	0x0A38,	%o3
	edge32l	%i2,	%l3,	%i7
	swap	[%l7 + 0x38],	%l4
	subccc	%i5,	%g4,	%g7
	fexpand	%f6,	%f28
	tvs	%icc,	0x5
	ldd	[%l7 + 0x68],	%f10
	taddcc	%o1,	%g5,	%i3
	orncc	%o7,	0x1BDF,	%g3
	movcc	%xcc,	%i0,	%i6
	fpadd32s	%f21,	%f26,	%f20
	nop
	setx	0x120E5ACE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xC7258282,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f15,	%f29
	addc	%l0,	0x0278,	%o5
	sdivcc	%g6,	0x0A05,	%g1
	fbg	%fcc2,	loop_347
	nop
	setx	0x969AE254,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x9556C8FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f0,	%f21
	edge16l	%i1,	%l5,	%o2
	addcc	%o6,	0x03BE,	%o4
loop_347:
	smulcc	%l2,	%g2,	%o0
	tpos	%xcc,	0x3
	bneg,a	%icc,	loop_348
	edge16l	%l6,	%l1,	%o3
	sdivcc	%i4,	0x0FB3,	%l3
	brlez,a	%i7,	loop_349
loop_348:
	fmovrslez	%l4,	%f27,	%f6
	brnz,a	%i2,	loop_350
	nop
	setx	0x746723F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x0DAFE305,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f30,	%f9
loop_349:
	addcc	%i5,	0x1819,	%g7
	andncc	%g4,	%o1,	%i3
loop_350:
	fbn,a	%fcc0,	loop_351
	bgu,a,pn	%xcc,	loop_352
	stbar
	srax	%g5,	%g3,	%o7
loop_351:
	nop
	fitod	%f28,	%f28
loop_352:
	fmovdneg	%icc,	%f19,	%f1
	orcc	%i0,	%l0,	%o5
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x11,	 0x2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i1
	addccc	%g6,	%l5,	%o2
	edge16ln	%o4,	%o6,	%g2
	set	0x60, %o3
	lda	[%l7 + %o3] 0x04,	%f13
	fnot2	%f8,	%f8
	prefetch	[%l7 + 0x70],	 0x2
	st	%f8,	[%l7 + 0x40]
	fmovsge	%xcc,	%f31,	%f25
	set	0x08, %g4
	stwa	%l2,	[%l7 + %g4] 0x88
	tpos	%xcc,	0x2
	sra	%l6,	0x09,	%l1
	xnor	%o3,	0x01CE,	%i4
	te	%xcc,	0x1
	udiv	%l3,	0x0B17,	%i7
	fmovsvc	%icc,	%f22,	%f13
	smulcc	%o0,	%i2,	%l4
	movg	%icc,	%i5,	%g4
	movleu	%xcc,	%g7,	%o1
	sdiv	%g5,	0x01A4,	%g3
	bpos,a,pt	%icc,	loop_353
	fmovsa	%xcc,	%f2,	%f23
	nop
	setx	0xE114F25130D1DAA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f4
	fbn	%fcc1,	loop_354
loop_353:
	edge32	%i3,	%i0,	%l0
	std	%f18,	[%l7 + 0x50]
	nop
	setx	0x9AF17FE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xB699AB3D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f4,	%f26
loop_354:
	udivx	%o7,	0x013D,	%o5
	orn	%i6,	%g1,	%i1
	fbo,a	%fcc1,	loop_355
	movleu	%xcc,	%g6,	%o2
	tl	%icc,	0x6
	alignaddr	%o4,	%o6,	%g2
loop_355:
	bgu	loop_356
	fmovrdlez	%l5,	%f20,	%f28
	fandnot2s	%f20,	%f15,	%f20
	fmovsge	%xcc,	%f12,	%f19
loop_356:
	tvs	%xcc,	0x4
	sub	%l2,	%l6,	%l1
	lduh	[%l7 + 0x62],	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i4,	%i7,	%l3
	fandnot1	%f6,	%f30,	%f4
	movrlz	%i2,	0x37D,	%l4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i5
	sethi	0x1A8C,	%g4
	tge	%xcc,	0x7
	fmovspos	%icc,	%f25,	%f20
	movcc	%icc,	%g7,	%o0
	sll	%g5,	%g3,	%o1
	fmovrsgez	%i0,	%f29,	%f22
	fsrc2	%f18,	%f26
	tvc	%xcc,	0x6
	movrne	%l0,	0x3BC,	%i3
	tcs	%xcc,	0x2
	fornot2	%f2,	%f10,	%f8
	smulcc	%o7,	%o5,	%g1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i6,	%i1
	movcc	%xcc,	%o2,	%g6
	xnor	%o4,	%g2,	%l5
	xnorcc	%o6,	0x0FEA,	%l6
	fbge,a	%fcc1,	loop_357
	fpadd16	%f8,	%f14,	%f28
	sdivx	%l2,	0x0402,	%l1
	tgu	%xcc,	0x3
loop_357:
	fmuld8sux16	%f6,	%f9,	%f16
	edge16l	%i4,	%o3,	%i7
	andn	%i2,	0x00E1,	%l3
	ba,a,pn	%icc,	loop_358
	nop
	setx	0x7A7E20C88A1B0A75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5122FF1CE67F9E70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f6,	%f10
	tg	%icc,	0x0
	nop
	fitos	%f19,	%f8
loop_358:
	orncc	%i5,	%g4,	%g7
	orcc	%l4,	0x0028,	%g5
	move	%xcc,	%o0,	%o1
	stx	%g3,	[%l7 + 0x78]
	wr	%g0,	0x22,	%asi
	stxa	%l0,	[%l7 + 0x50] %asi
	membar	#Sync
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x19,	%i2
	tsubcctv	%i0,	%o5,	%g1
	movrgez	%o7,	0x087,	%i1
	stx	%i6,	[%l7 + 0x30]
	ldd	[%l7 + 0x58],	%o2
	subccc	%g6,	%o4,	%g2
	ba,a,pn	%icc,	loop_359
	tneg	%icc,	0x6
	movvs	%xcc,	%l5,	%o6
	fmovsgu	%icc,	%f2,	%f26
loop_359:
	move	%xcc,	%l6,	%l1
	fmul8ulx16	%f2,	%f0,	%f12
	fcmpne32	%f24,	%f28,	%l2
	fexpand	%f4,	%f18
	fba,a	%fcc0,	loop_360
	nop
	setx	loop_361,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%o3,	%i7,	%i4
	smulcc	%l3,	%i5,	%g4
loop_360:
	ta	%xcc,	0x3
loop_361:
	nop
	fitos	%f6,	%f20
	fstod	%f20,	%f30
	tgu	%icc,	0x3
	ldub	[%l7 + 0x19],	%g7
	nop
	fitod	%f0,	%f16
	ldd	[%l7 + 0x70],	%f10
	edge32ln	%i2,	%l4,	%o0
	movgu	%xcc,	%g5,	%g3
	set	0x0C, %i2
	stwa	%o1,	[%l7 + %i2] 0x2b
	membar	#Sync
	fbuge,a	%fcc0,	loop_362
	umulcc	%i3,	0x173F,	%l0
	andcc	%i0,	0x07F4,	%o5
	brgez,a	%g1,	loop_363
loop_362:
	ldsb	[%l7 + 0x61],	%i1
	set	0x18, %o7
	ldsba	[%l7 + %o7] 0x04,	%i6
loop_363:
	movvc	%icc,	%o7,	%o2
	andncc	%g6,	%g2,	%l5
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x22,	%o4
	tvs	%icc,	0x0
	te	%xcc,	0x2
	fpadd16s	%f17,	%f9,	%f29
	fexpand	%f13,	%f2
	movne	%icc,	%o6,	%l6
	edge16l	%l1,	%l2,	%i7
	stx	%i4,	[%l7 + 0x18]
	tgu	%xcc,	0x1
	membar	0x16
	orn	%o3,	0x1093,	%l3
	edge8	%g4,	%i5,	%i2
	or	%g7,	%o0,	%l4
	tle	%xcc,	0x7
	ta	%icc,	0x0
	membar	0x73
	swap	[%l7 + 0x58],	%g3
	fmuld8sux16	%f15,	%f16,	%f28
	sdivx	%o1,	0x0F51,	%g5
	fmovdge	%xcc,	%f4,	%f13
	nop
	setx	0x5EC4F4C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f5
	tle	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%i3
	fcmpne16	%f20,	%f10,	%l0
	fandnot2	%f24,	%f8,	%f20
	fpack32	%f22,	%f8,	%f12
	tsubcctv	%o5,	%g1,	%i1
	fnand	%f10,	%f6,	%f8
	srlx	%i6,	0x1E,	%o7
	fbuge,a	%fcc0,	loop_364
	movrgez	%i0,	%g6,	%g2
	brlz,a	%o2,	loop_365
	fbn	%fcc1,	loop_366
loop_364:
	te	%icc,	0x0
	tne	%icc,	0x6
loop_365:
	subc	%o4,	0x1F38,	%l5
loop_366:
	fnegd	%f26,	%f0
	addccc	%o6,	%l6,	%l1
	edge8l	%i7,	%l2,	%i4
	tne	%xcc,	0x1
	srl	%o3,	%l3,	%i5
	fmovsvc	%icc,	%f14,	%f24
	addcc	%i2,	0x0189,	%g7
	edge32n	%o0,	%l4,	%g3
	movne	%xcc,	%g4,	%o1
	mulx	%g5,	%l0,	%i3
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f22
	fble	%fcc1,	loop_367
	array8	%o5,	%i1,	%i6
	mulscc	%o7,	%i0,	%g6
	edge16ln	%g1,	%o2,	%o4
loop_367:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x64] %asi,	%g2
	bneg,pn	%icc,	loop_368
	sra	%l5,	%l6,	%l1
	fmovrdlz	%o6,	%f8,	%f22
	fsrc1	%f12,	%f18
loop_368:
	flush	%l7 + 0x18
	movrgz	%l2,	0x3EA,	%i7
	bgu	loop_369
	sir	0x02F9
	movneg	%xcc,	%o3,	%i4
	mulscc	%i5,	%l3,	%i2
loop_369:
	nop
	fitod	%f2,	%f12
	fdtos	%f12,	%f21
	sub	%g7,	0x1D86,	%o0
	edge32ln	%l4,	%g4,	%g3
	subcc	%o1,	%g5,	%l0
	set	0x38, %g7
	ldxa	[%g0 + %g7] 0x20,	%o5
	fmovdvc	%xcc,	%f26,	%f19
	tl	%xcc,	0x6
	smul	%i3,	0x02D4,	%i6
	fandnot1s	%f29,	%f16,	%f17
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movvs	%icc,	%o7,	%i0
	nop
	setx	0x24C6E036A8577594,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x941D5F185AA807F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f20,	%f20
	subcc	%i1,	%g6,	%o2
	fsrc2s	%f8,	%f3
	movge	%icc,	%g1,	%o4
	edge16	%g2,	%l6,	%l5
	fmovsn	%xcc,	%f28,	%f19
	tpos	%icc,	0x7
	tvc	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f29,	%f13
	mulx	%o6,	%l2,	%l1
	popc	%i7,	%o3
	fxnors	%f9,	%f15,	%f28
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	movrne	%i4,	0x3C2,	%l3
	fmovrsgz	%i2,	%f30,	%f14
	array8	%o0,	%l4,	%g4
	fmovsvs	%xcc,	%f19,	%f10
	sdiv	%g7,	0x1D96,	%o1
	orcc	%g3,	0x082C,	%l0
	addc	%o5,	0x059C,	%g5
	array8	%i3,	%o7,	%i0
	movvc	%icc,	%i6,	%g6
	tvc	%icc,	0x3
	ble,a	%xcc,	loop_370
	addcc	%i1,	%g1,	%o2
	movle	%xcc,	%g2,	%o4
	movrlz	%l6,	0x09A,	%o6
loop_370:
	fsrc2	%f20,	%f22
	fmul8x16al	%f5,	%f25,	%f30
	tg	%xcc,	0x6
	set	0x08, %i1
	stba	%l2,	[%l7 + %i1] 0x81
	mulx	%l5,	0x11DD,	%l1
	lduh	[%l7 + 0x30],	%o3
	movcs	%icc,	%i7,	%i4
	fmovsvs	%icc,	%f10,	%f16
	tge	%icc,	0x2
	nop
	setx loop_371, %l0, %l1
	jmpl %l1, %l3
	addc	%i2,	%i5,	%l4
	orcc	%o0,	0x0829,	%g7
	bvs,a	%icc,	loop_372
loop_371:
	addccc	%g4,	%o1,	%l0
	fmovdne	%icc,	%f6,	%f2
	srax	%o5,	0x00,	%g3
loop_372:
	nop
	set	0x63, %g5
	ldstuba	[%l7 + %g5] 0x11,	%g5
	tpos	%xcc,	0x7
	fbn,a	%fcc0,	loop_373
	edge8	%i3,	%o7,	%i6
	tsubcc	%g6,	0x188C,	%i1
	fsrc1	%f10,	%f20
loop_373:
	sub	%i0,	%g1,	%o2
	tne	%icc,	0x2
	fsrc2s	%f4,	%f30
	addccc	%g2,	0x1ABB,	%o4
	movg	%icc,	%l6,	%l2
	bne,pt	%icc,	loop_374
	flush	%l7 + 0x6C
	fbl,a	%fcc3,	loop_375
	orn	%o6,	%l1,	%l5
loop_374:
	ta	%xcc,	0x7
	movrlez	%o3,	0x18D,	%i7
loop_375:
	movre	%i4,	0x25A,	%i2
	ba,a	%xcc,	loop_376
	bge,pt	%icc,	loop_377
	srax	%l3,	0x1A,	%l4
	fmul8x16	%f28,	%f2,	%f16
loop_376:
	bn,a,pt	%xcc,	loop_378
loop_377:
	bcc	loop_379
	fnot1	%f10,	%f0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o0,	%g7
loop_378:
	fnands	%f16,	%f6,	%f11
loop_379:
	nop
	fitos	%f4,	%f5
	move	%xcc,	%g4,	%i5
	nop
	setx	loop_380,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2	%f28,	%f18
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%l0
loop_380:
	faligndata	%f24,	%f10,	%f18
	edge32ln	%g3,	%o5,	%g5
	taddcctv	%i3,	0x1EFF,	%i6
	brlz,a	%g6,	loop_381
	ldsw	[%l7 + 0x1C],	%i1
	sdivcc	%i0,	0x022F,	%g1
	movg	%xcc,	%o2,	%o7
loop_381:
	tsubcc	%g2,	0x05D6,	%l6
	lduw	[%l7 + 0x2C],	%l2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x22] %asi,	%o4
	nop
	setx loop_382, %l0, %l1
	jmpl %l1, %o6
	fmovsa	%xcc,	%f12,	%f5
	xorcc	%l1,	%l5,	%o3
	edge8	%i4,	%i7,	%l3
loop_382:
	tsubcctv	%i2,	0x1852,	%o0
	sdiv	%l4,	0x148F,	%g4
	edge32l	%i5,	%o1,	%g7
	fbo,a	%fcc3,	loop_383
	umulcc	%g3,	%l0,	%o5
	edge32ln	%i3,	%i6,	%g5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i1,	%i0
loop_383:
	edge32l	%g1,	%g6,	%o7
	movrgz	%o2,	0x162,	%l6
	nop
	setx loop_384, %l0, %l1
	jmpl %l1, %l2
	fone	%f4
	array32	%g2,	%o6,	%o4
	fpadd32	%f20,	%f6,	%f30
loop_384:
	fone	%f4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l1
	bl,a,pt	%icc,	loop_385
	movvc	%icc,	%o3,	%i4
	sdiv	%l5,	0x1B59,	%i7
	udivcc	%i2,	0x178D,	%l3
loop_385:
	subcc	%l4,	0x0CBD,	%g4
	tge	%icc,	0x7
	bcc,a,pn	%xcc,	loop_386
	fmul8x16	%f13,	%f0,	%f30
	addccc	%i5,	%o1,	%o0
	fmul8x16au	%f2,	%f7,	%f22
loop_386:
	srlx	%g7,	0x01,	%l0
	movl	%icc,	%o5,	%i3
	fmovdleu	%icc,	%f24,	%f3
	umul	%g3,	%g5,	%i1
	subccc	%i0,	%g1,	%g6
	fnot2	%f16,	%f30
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f29
	std	%f0,	[%l7 + 0x50]
	brgz	%i6,	loop_387
	fors	%f0,	%f8,	%f25
	taddcc	%o7,	%l6,	%o2
	fxnor	%f22,	%f26,	%f16
loop_387:
	addc	%g2,	0x1A58,	%l2
	add	%o4,	0x0E4D,	%l1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%o6
	fcmpgt16	%f22,	%f24,	%i4
	popc	0x198C,	%o3
	ld	[%l7 + 0x70],	%f6
	tne	%xcc,	0x5
	srax	%l5,	%i2,	%l3
	movg	%icc,	%l4,	%g4
	edge16	%i7,	%o1,	%o0
	fmovrdlez	%g7,	%f30,	%f8
	fmovde	%icc,	%f20,	%f4
	orncc	%i5,	0x03F3,	%o5
	fmovsge	%icc,	%f29,	%f3
	brgz	%l0,	loop_388
	edge16ln	%i3,	%g5,	%i1
	addc	%i0,	%g3,	%g1
	fpadd16	%f22,	%f14,	%f2
loop_388:
	fmul8sux16	%f24,	%f22,	%f18
	andcc	%g6,	%o7,	%l6
	bpos,a	%xcc,	loop_389
	orn	%i6,	%o2,	%l2
	popc	%g2,	%l1
	brgz,a	%o6,	loop_390
loop_389:
	sllx	%i4,	0x06,	%o3
	mulx	%o4,	%i2,	%l5
	alignaddrl	%l3,	%g4,	%i7
loop_390:
	movgu	%icc,	%o1,	%l4
	fbul,a	%fcc2,	loop_391
	umul	%o0,	0x0E4B,	%i5
	fmovs	%f3,	%f23
	movgu	%xcc,	%g7,	%l0
loop_391:
	array32	%o5,	%g5,	%i1
	movcs	%icc,	%i3,	%g3
	subc	%g1,	%i0,	%g6
	sll	%l6,	0x19,	%i6
	fbule	%fcc3,	loop_392
	fpsub32	%f18,	%f4,	%f28
	bpos,pn	%icc,	loop_393
	fbug,a	%fcc1,	loop_394
loop_392:
	fbul	%fcc1,	loop_395
	tne	%icc,	0x5
loop_393:
	fmovdleu	%xcc,	%f9,	%f1
loop_394:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x50] %asi,	%o2
loop_395:
	flush	%l7 + 0x7C
	sdivcc	%l2,	0x0044,	%g2
	fnors	%f9,	%f18,	%f15
	addccc	%l1,	0x0E63,	%o7
	fbn	%fcc2,	loop_396
	subcc	%i4,	%o3,	%o4
	umulcc	%i2,	%l5,	%o6
	fmovdne	%xcc,	%f9,	%f8
loop_396:
	bcs,pt	%xcc,	loop_397
	xorcc	%l3,	0x170D,	%g4
	tcs	%xcc,	0x3
	brgz,a	%o1,	loop_398
loop_397:
	taddcc	%i7,	0x1F8D,	%l4
	be	loop_399
	movleu	%icc,	%i5,	%g7
loop_398:
	fmovdleu	%xcc,	%f15,	%f28
	array16	%o0,	%o5,	%g5
loop_399:
	te	%icc,	0x6
	tpos	%icc,	0x4
	and	%i1,	0x1E33,	%l0
	move	%xcc,	%g3,	%g1
	edge8l	%i0,	%i3,	%l6
	fpackfix	%f26,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g6,	%i6,	%o2
	fabsd	%f30,	%f10
	ble,a,pn	%icc,	loop_400
	be,a,pt	%xcc,	loop_401
	orncc	%g2,	%l2,	%l1
	st	%f2,	[%l7 + 0x58]
loop_400:
	fbul	%fcc2,	loop_402
loop_401:
	fmovse	%icc,	%f7,	%f21
	sdiv	%o7,	0x1163,	%i4
	subc	%o3,	0x0082,	%i2
loop_402:
	sdivcc	%l5,	0x06C2,	%o4
	array8	%o6,	%l3,	%o1
	addc	%g4,	0x12B4,	%l4
	fands	%f15,	%f3,	%f12
	edge8l	%i5,	%i7,	%o0
	fmovdle	%xcc,	%f19,	%f11
	orncc	%g7,	0x1C1E,	%g5
	fmovda	%icc,	%f5,	%f16
	tvc	%icc,	0x6
	fpadd16	%f16,	%f22,	%f14
	fmovsge	%icc,	%f29,	%f5
	orcc	%o5,	0x153D,	%i1
	set	0x2E, %l3
	stha	%g3,	[%l7 + %l3] 0x11
	edge16n	%l0,	%g1,	%i3
	movrne	%i0,	0x38F,	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i6,	%l6
	alignaddrl	%g2,	%o2,	%l2
	edge32l	%o7,	%i4,	%o3
	movge	%xcc,	%l1,	%l5
	nop
	setx	0xF06AA899,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fabsd	%f18,	%f16
	ldstub	[%l7 + 0x4C],	%i2
	te	%xcc,	0x4
	fbuge	%fcc3,	loop_403
	ldsb	[%l7 + 0x55],	%o6
	te	%xcc,	0x0
	edge32l	%o4,	%l3,	%o1
loop_403:
	orcc	%l4,	0x0648,	%g4
	movgu	%xcc,	%i7,	%i5
	be,a	%xcc,	loop_404
	ta	%xcc,	0x5
	add	%o0,	0x0A2A,	%g7
	ldx	[%l7 + 0x78],	%o5
loop_404:
	add	%g5,	0x0AC0,	%i1
	fmul8x16au	%f24,	%f25,	%f30
	tgu	%icc,	0x0
	tvs	%icc,	0x6
	tge	%icc,	0x3
	sethi	0x12DB,	%l0
	swap	[%l7 + 0x68],	%g1
	sdivx	%i3,	0x0BED,	%g3
	stb	%i0,	[%l7 + 0x13]
	fand	%f4,	%f28,	%f20
	tge	%xcc,	0x0
	fbg,a	%fcc0,	loop_405
	bg,pt	%icc,	loop_406
	fnegs	%f29,	%f24
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
loop_405:
	brgez	%l6,	loop_407
loop_406:
	bne,a,pt	%icc,	loop_408
	smul	%g6,	0x1BDB,	%o2
	ba,a	%xcc,	loop_409
loop_407:
	movre	%l2,	0x2A3,	%g2
loop_408:
	tgu	%xcc,	0x5
	fbo	%fcc2,	loop_410
loop_409:
	fmovrsne	%i4,	%f17,	%f16
	bpos,a	loop_411
	fornot2s	%f15,	%f24,	%f10
loop_410:
	fmovrslz	%o3,	%f31,	%f3
	fmovrsgez	%o7,	%f4,	%f29
loop_411:
	edge32	%l5,	%l1,	%i2
	ldub	[%l7 + 0x08],	%o4
	fcmpne32	%f20,	%f4,	%l3
	edge16	%o6,	%o1,	%l4
	tleu	%xcc,	0x1
	orn	%i7,	%i5,	%g4
	movvs	%icc,	%g7,	%o5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x11,	%f16
	fmovrdlez	%g5,	%f8,	%f30
	ldd	[%l7 + 0x58],	%f16
	tne	%xcc,	0x4
	movrgz	%o0,	%l0,	%i1
	udivx	%i3,	0x1B65,	%g3
	edge8l	%g1,	%i6,	%i0
	xnorcc	%g6,	%o2,	%l6
	fmovsg	%xcc,	%f12,	%f16
	fba,a	%fcc2,	loop_412
	udiv	%l2,	0x1161,	%g2
	tsubcctv	%i4,	0x1445,	%o7
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x168] %asi,	%l5 ripped by fixASI40.pl ripped by fixASI40.pl
loop_412:
	subc	%l1,	0x146F,	%o3
	edge16	%i2,	%o4,	%o6
	fnot2s	%f2,	%f22
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o1,	%l3
	edge32ln	%l4,	%i7,	%g4
	subcc	%i5,	0x0151,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc1,	loop_413
	movn	%icc,	%o5,	%o0
	pdist	%f4,	%f22,	%f28
	fmovsleu	%xcc,	%f7,	%f17
loop_413:
	mulx	%g5,	%l0,	%i1
	movg	%icc,	%i3,	%g3
	and	%g1,	%i6,	%g6
	tgu	%icc,	0x6
	tcs	%xcc,	0x4
	orcc	%o2,	%l6,	%i0
	edge32	%g2,	%i4,	%l2
	movne	%xcc,	%o7,	%l5
	move	%xcc,	%l1,	%i2
	sllx	%o4,	%o6,	%o1
	movg	%icc,	%o3,	%l3
	be,pn	%xcc,	loop_414
	nop
	setx	0xBD1A6F00E0733C15,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fornot1s	%f23,	%f26,	%f28
	movrgz	%l4,	0x047,	%g4
loop_414:
	edge32l	%i7,	%i5,	%o5
	lduw	[%l7 + 0x74],	%o0
	sdiv	%g5,	0x0F94,	%l0
	brlez,a	%g7,	loop_415
	tgu	%xcc,	0x6
	edge8	%i3,	%g3,	%i1
	fblg,a	%fcc0,	loop_416
loop_415:
	nop
	setx	loop_417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	pdist	%f2,	%f16,	%f16
	nop
	fitos	%f25,	%f11
loop_416:
	movgu	%icc,	%g1,	%i6
loop_417:
	nop
	set	0x65, %l6
	stba	%g6,	[%l7 + %l6] 0x04
	subc	%l6,	0x1509,	%i0
	sethi	0x12AF,	%o2
	or	%g2,	0x1B57,	%l2
	tvs	%icc,	0x5
	fbn	%fcc1,	loop_418
	orncc	%i4,	%o7,	%l5
	edge8ln	%i2,	%o4,	%l1
	movleu	%xcc,	%o6,	%o1
loop_418:
	fbn,a	%fcc0,	loop_419
	sub	%l3,	0x0827,	%o3
	mulscc	%g4,	%l4,	%i5
	movrlez	%i7,	0x184,	%o0
loop_419:
	fmovrdgz	%g5,	%f20,	%f16
	smul	%l0,	%o5,	%g7
	fbn	%fcc3,	loop_420
	srl	%g3,	0x03,	%i1
	fandnot1	%f2,	%f22,	%f16
	tsubcctv	%g1,	0x1324,	%i6
loop_420:
	andcc	%g6,	%i3,	%l6
	udiv	%o2,	0x09DF,	%i0
	fbo,a	%fcc2,	loop_421
	movcs	%icc,	%g2,	%i4
	wr	%g0,	0x0c,	%asi
	stha	%l2,	[%l7 + 0x74] %asi
loop_421:
	bvs	%icc,	loop_422
	fmovscs	%xcc,	%f9,	%f1
	xorcc	%l5,	%o7,	%i2
	fbo,a	%fcc1,	loop_423
loop_422:
	subc	%l1,	0x1A6F,	%o6
	udivcc	%o1,	0x16D3,	%o4
	brz,a	%l3,	loop_424
loop_423:
	fcmpeq16	%f26,	%f30,	%o3
	fmovdl	%xcc,	%f26,	%f30
	fands	%f12,	%f16,	%f13
loop_424:
	nop
	setx	0x1AA0CA10,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC882F393,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f30,	%f31
	tpos	%xcc,	0x5
	sllx	%l4,	0x0E,	%i5
	be,a,pn	%xcc,	loop_425
	sir	0x032B
	fbuge	%fcc1,	loop_426
	fbo	%fcc3,	loop_427
loop_425:
	orcc	%i7,	0x0527,	%o0
	mulx	%g4,	%l0,	%o5
loop_426:
	taddcctv	%g7,	%g3,	%g5
loop_427:
	edge32l	%g1,	%i1,	%i6
	nop
	setx	loop_428,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_429, %l0, %l1
	jmpl %l1, %i3
	sethi	0x1771,	%g6
	edge16l	%l6,	%o2,	%i0
loop_428:
	fmovspos	%xcc,	%f21,	%f19
loop_429:
	fbuge,a	%fcc1,	loop_430
	movvs	%icc,	%g2,	%i4
	smul	%l5,	%o7,	%l2
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x2F] %asi,	%i2
loop_430:
	movn	%xcc,	%o6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o4,	%o1,	%o3
	tg	%xcc,	0x7
	fcmpgt16	%f20,	%f14,	%l3
	tg	%xcc,	0x4
	alignaddrl	%i5,	%l4,	%o0
	taddcc	%g4,	%i7,	%l0
	sdiv	%o5,	0x0BF0,	%g7
	tcc	%icc,	0x0
	fmovrsgz	%g3,	%f30,	%f3
	movle	%xcc,	%g5,	%i1
	nop
	set	0x78, %g1
	std	%f2,	[%l7 + %g1]
	udivcc	%i6,	0x1025,	%g1
	fabsd	%f24,	%f28
	membar	0x1B
	tle	%xcc,	0x6
	edge16n	%g6,	%l6,	%o2
	array32	%i0,	%g2,	%i3
	bleu,pn	%icc,	loop_431
	membar	0x2C
	fbug,a	%fcc0,	loop_432
	ld	[%l7 + 0x54],	%f25
loop_431:
	movg	%icc,	%i4,	%l5
	ld	[%l7 + 0x78],	%f5
loop_432:
	orcc	%l2,	0x0E47,	%o7
	ld	[%l7 + 0x38],	%f31
	fmovdn	%icc,	%f3,	%f28
	taddcctv	%i2,	%o6,	%o4
	addcc	%o1,	%o3,	%l1
	or	%i5,	%l4,	%o0
	for	%f8,	%f24,	%f30
	movrlz	%g4,	%i7,	%l0
	fnegd	%f4,	%f22
	movrgez	%o5,	%g7,	%g3
	tge	%xcc,	0x2
	umul	%g5,	%i1,	%l3
	tg	%xcc,	0x5
	sdiv	%i6,	0x1474,	%g6
	stx	%l6,	[%l7 + 0x20]
	fxor	%f14,	%f20,	%f30
	movn	%xcc,	%o2,	%g1
	fmovdn	%xcc,	%f7,	%f2
	ta	%xcc,	0x2
	fmuld8sux16	%f16,	%f26,	%f28
	movle	%icc,	%g2,	%i0
	movrgez	%i3,	%l5,	%i4
	fabss	%f16,	%f13
	orcc	%o7,	%l2,	%i2
	and	%o6,	0x0E07,	%o4
	edge16	%o3,	%o1,	%i5
	edge16ln	%l1,	%l4,	%o0
	bne	%xcc,	loop_433
	edge8	%g4,	%l0,	%i7
	nop
	setx loop_434, %l0, %l1
	jmpl %l1, %g7
	sra	%g3,	%o5,	%i1
loop_433:
	fcmpne32	%f14,	%f18,	%l3
	edge32	%g5,	%i6,	%l6
loop_434:
	movcs	%xcc,	%o2,	%g1
	or	%g6,	%i0,	%i3
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x1A] %asi,	%g2
	movre	%l5,	0x060,	%i4
	udiv	%o7,	0x1CD0,	%i2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	fmovscc	%xcc,	%f11,	%f21
	movcs	%xcc,	%l2,	%o4
	movne	%xcc,	%o3,	%i5
	movl	%xcc,	%l1,	%o1
	tge	%xcc,	0x0
	fmovrsne	%l4,	%f20,	%f19
	tvs	%icc,	0x4
	array8	%g4,	%o0,	%l0
	andncc	%g7,	%g3,	%i7
	alignaddrl	%o5,	%l3,	%i1
	movcc	%icc,	%g5,	%l6
	edge32	%i6,	%g1,	%g6
	movneg	%icc,	%i0,	%i3
	tge	%xcc,	0x6
	bcc	loop_435
	movcc	%xcc,	%g2,	%o2
	edge16	%l5,	%o7,	%i4
	movn	%icc,	%i2,	%l2
loop_435:
	fxors	%f7,	%f20,	%f8
	movne	%xcc,	%o4,	%o3
	fmovrsne	%o6,	%f18,	%f23
	set	0x78, %g3
	swapa	[%l7 + %g3] 0x11,	%l1
	fnot2	%f12,	%f26
	fxnor	%f0,	%f20,	%f28
	array32	%o1,	%l4,	%i5
	tg	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x6
	alignaddrl	%g4,	%o0,	%g7
	edge32l	%l0,	%i7,	%o5
	orn	%l3,	%g3,	%g5
	fbu,a	%fcc0,	loop_436
	tcc	%xcc,	0x5
	edge8n	%i1,	%l6,	%g1
	nop
	set	0x0D, %l2
	ldsb	[%l7 + %l2],	%g6
loop_436:
	ldd	[%l7 + 0x50],	%i0
	tvs	%xcc,	0x0
	subcc	%i6,	0x0230,	%g2
	lduh	[%l7 + 0x78],	%i3
	edge32n	%l5,	%o2,	%i4
	srax	%o7,	0x13,	%l2
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x81,	%o4
	std	%f2,	[%l7 + 0x38]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f28,	%f26,	%f4
	andcc	%i2,	0x103F,	%o6
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x19,	%o3
	fzero	%f0
	fmovrdgez	%l1,	%f26,	%f20
	sdivcc	%l4,	0x05A3,	%o1
	tsubcc	%g4,	0x0476,	%i5
	lduw	[%l7 + 0x38],	%o0
	fbul	%fcc0,	loop_437
	edge32l	%g7,	%l0,	%o5
	fabsd	%f2,	%f2
	fba	%fcc3,	loop_438
loop_437:
	tne	%xcc,	0x1
	movrgez	%l3,	0x30E,	%g3
	array32	%i7,	%i1,	%l6
loop_438:
	xor	%g5,	%g6,	%i0
	wr	%g0,	0xe2,	%asi
	stxa	%g1,	[%l7 + 0x78] %asi
	membar	#Sync
	movre	%i6,	0x2A7,	%i3
	sra	%g2,	0x12,	%l5
	edge32ln	%o2,	%i4,	%o7
	tsubcc	%l2,	0x15D2,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o6,	%o3
	fbule,a	%fcc1,	loop_439
	tl	%xcc,	0x1
	alignaddr	%i2,	%l4,	%o1
	subcc	%l1,	%g4,	%o0
loop_439:
	fpadd16	%f16,	%f0,	%f26
	nop
	fitos	%f12,	%f23
	fstod	%f23,	%f30
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f28
	tpos	%icc,	0x4
	fmovs	%f0,	%f27
	fzero	%f24
	fmul8x16au	%f21,	%f27,	%f14
	edge16ln	%i5,	%g7,	%o5
	fmovdg	%xcc,	%f10,	%f23
	fmovspos	%icc,	%f0,	%f18
	xor	%l3,	%g3,	%i7
	fmovrdgez	%i1,	%f24,	%f14
	ta	%xcc,	0x1
	sub	%l6,	%l0,	%g6
	flush	%l7 + 0x2C
	edge32	%g5,	%i0,	%g1
	edge16l	%i6,	%g2,	%i3
	movg	%icc,	%o2,	%i4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%o7
	movrgz	%l5,	0x3EA,	%l2
	fmovsn	%icc,	%f28,	%f26
	nop
	setx	0x3040F653,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	ldsw	[%l7 + 0x40],	%o4
	andn	%o3,	%i2,	%o6
	alignaddrl	%l4,	%l1,	%g4
	stx	%o1,	[%l7 + 0x40]
	xor	%i5,	%g7,	%o0
	movrne	%l3,	%o5,	%i7
	movvc	%xcc,	%i1,	%l6
	movn	%icc,	%g3,	%l0
	edge16n	%g5,	%g6,	%g1
	tg	%xcc,	0x0
	bl	loop_440
	sdivcc	%i0,	0x0A62,	%i6
	stx	%i3,	[%l7 + 0x38]
	nop
	set	0x08, %l1
	ldstub	[%l7 + %l1],	%o2
loop_440:
	or	%g2,	0x1243,	%o7
	membar	0x37
	fmovdvc	%icc,	%f8,	%f1
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x2
	fmovrde	%l5,	%f24,	%f22
	edge16	%o4,	%l2,	%o3
	edge8l	%i2,	%o6,	%l1
	subccc	%g4,	0x1522,	%o1
	alignaddrl	%i5,	%l4,	%g7
	add	%o0,	0x0FD3,	%o5
	fmovs	%f27,	%f28
	edge32	%i7,	%i1,	%l6
	movn	%xcc,	%g3,	%l3
	edge16ln	%g5,	%l0,	%g6
	taddcc	%g1,	0x160F,	%i6
	xorcc	%i3,	0x0882,	%i0
	fmovsg	%xcc,	%f13,	%f25
	orn	%o2,	0x09B1,	%g2
	move	%icc,	%o7,	%i4
	set	0x27, %o4
	stba	%o4,	[%l7 + %o4] 0x11
	movg	%icc,	%l2,	%l5
	membar	0x6C
	tl	%xcc,	0x2
	tle	%icc,	0x2
	edge8n	%i2,	%o3,	%o6
	orncc	%l1,	0x1F0A,	%g4
	movne	%xcc,	%i5,	%l4
	ldx	[%l7 + 0x28],	%o1
	fandnot2	%f0,	%f2,	%f28
	bn,pn	%xcc,	loop_441
	pdist	%f0,	%f24,	%f18
	subccc	%o0,	%g7,	%i7
	edge8	%o5,	%l6,	%g3
loop_441:
	mulx	%i1,	%g5,	%l0
	movle	%xcc,	%l3,	%g1
	tpos	%xcc,	0x7
	fmovsne	%icc,	%f16,	%f2
	alignaddr	%i6,	%i3,	%g6
	wr	%g0,	0x10,	%asi
	stba	%i0,	[%l7 + 0x17] %asi
	mulscc	%g2,	%o7,	%o2
	subccc	%i4,	%l2,	%l5
	tpos	%icc,	0x4
	fmovrslz	%o4,	%f13,	%f22
	fcmpeq16	%f16,	%f16,	%o3
	stw	%i2,	[%l7 + 0x5C]
	stx	%o6,	[%l7 + 0x38]
	fmovrslez	%g4,	%f8,	%f23
	fbule	%fcc3,	loop_442
	fblg,a	%fcc3,	loop_443
	tne	%icc,	0x4
	fblg	%fcc3,	loop_444
loop_442:
	tl	%xcc,	0x4
loop_443:
	fnor	%f18,	%f2,	%f30
	taddcctv	%i5,	0x1DAB,	%l1
loop_444:
	sth	%o1,	[%l7 + 0x22]
	ldstub	[%l7 + 0x08],	%o0
	movl	%xcc,	%g7,	%l4
	subc	%i7,	0x1081,	%l6
	fbug	%fcc0,	loop_445
	tg	%icc,	0x0
	membar	0x58
	bg,pn	%xcc,	loop_446
loop_445:
	fcmpgt16	%f16,	%f20,	%o5
	udivx	%g3,	0x0457,	%i1
	nop
	fitos	%f0,	%f8
	fstod	%f8,	%f2
loop_446:
	fbe,a	%fcc2,	loop_447
	fpmerge	%f27,	%f15,	%f28
	ldsh	[%l7 + 0x38],	%l0
	movn	%xcc,	%g5,	%l3
loop_447:
	fnot1	%f20,	%f16
	bpos,a,pn	%xcc,	loop_448
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f28
	brlez,a	%i6,	loop_449
	fba,a	%fcc0,	loop_450
loop_448:
	taddcc	%i3,	%g6,	%i0
	movleu	%xcc,	%g1,	%o7
loop_449:
	fbue	%fcc3,	loop_451
loop_450:
	fmovrdgez	%g2,	%f16,	%f22
	tvs	%icc,	0x6
	movle	%icc,	%i4,	%l2
loop_451:
	stbar
	subccc	%o2,	%l5,	%o3
	bneg,a	loop_452
	ld	[%l7 + 0x24],	%f16
	movcc	%icc,	%o4,	%o6
	sllx	%i2,	%g4,	%l1
loop_452:
	add	%o1,	0x1536,	%o0
	fmul8ulx16	%f24,	%f0,	%f14
	movrlez	%i5,	0x2E1,	%g7
	membar	0x01
	tcc	%xcc,	0x6
	pdist	%f8,	%f10,	%f24
	fones	%f7
	xor	%i7,	0x177C,	%l4
	tsubcctv	%l6,	%o5,	%g3
	orncc	%l0,	0x14AE,	%i1
	ba,a	loop_453
	sra	%g5,	%i6,	%l3
	nop
	setx	0x486C4D3E243B8749,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x7E315C4475682BBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f26
	sethi	0x0095,	%i3
loop_453:
	fmovdpos	%icc,	%f14,	%f0
	move	%xcc,	%g6,	%g1
	edge8ln	%i0,	%g2,	%i4
	popc	0x0E17,	%l2
	movvc	%icc,	%o2,	%l5
	edge16n	%o3,	%o4,	%o6
	movn	%icc,	%i2,	%g4
	orn	%l1,	%o7,	%o0
	tpos	%xcc,	0x7
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%g7
	fmovrslez	%i5,	%f25,	%f27
	fmovsvs	%xcc,	%f13,	%f21
	movcc	%icc,	%i7,	%l6
	subccc	%l4,	%o5,	%l0
	edge8l	%i1,	%g5,	%g3
	sll	%i6,	%l3,	%g6
	move	%xcc,	%g1,	%i3
	edge32l	%g2,	%i4,	%i0
	xnorcc	%l2,	%o2,	%o3
	fmovrslz	%l5,	%f7,	%f14
	edge16	%o4,	%o6,	%g4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x35] %asi,	%l1
	orncc	%i2,	%o7,	%o0
	movrlz	%o1,	0x3EA,	%i5
	bge	loop_454
	fmovde	%icc,	%f10,	%f26
	tcc	%xcc,	0x3
	fmovrsgez	%i7,	%f17,	%f25
loop_454:
	srl	%l6,	0x12,	%g7
	fmovdgu	%icc,	%f0,	%f31
	sdiv	%o5,	0x034F,	%l4
	movpos	%icc,	%l0,	%i1
	sllx	%g3,	0x1F,	%g5
	set	0x66, %g2
	lduba	[%l7 + %g2] 0x88,	%i6
	edge32	%g6,	%l3,	%g1
	set	0x60, %o6
	ldsba	[%l7 + %o6] 0x14,	%g2
	sdiv	%i3,	0x1564,	%i0
	stx	%l2,	[%l7 + 0x50]
	fpack32	%f30,	%f16,	%f6
	fblg,a	%fcc0,	loop_455
	fmovsl	%xcc,	%f16,	%f10
	fones	%f28
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i4
loop_455:
	edge16	%o3,	%l5,	%o4
	movge	%xcc,	%o2,	%g4
	movvs	%icc,	%l1,	%i2
	stbar
	bleu,a	loop_456
	array32	%o6,	%o0,	%o7
	tle	%icc,	0x1
	sub	%o1,	0x0EAA,	%i5
loop_456:
	fzeros	%f28
	tcc	%icc,	0x7
	set	0x28, %l0
	sta	%f22,	[%l7 + %l0] 0x10
	movre	%l6,	%i7,	%o5
	udivx	%l4,	0x18F6,	%g7
	subc	%i1,	%g3,	%g5
	sra	%i6,	%g6,	%l3
	tcs	%icc,	0x1
	be,a,pn	%xcc,	loop_457
	nop
	set	0x62, %i5
	ldstub	[%l7 + %i5],	%g1
	flush	%l7 + 0x60
	fbg,a	%fcc0,	loop_458
loop_457:
	ble,a	loop_459
	taddcc	%l0,	%i3,	%g2
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x44] %asi,	%i0
loop_458:
	smulcc	%i4,	%l2,	%o3
loop_459:
	tleu	%icc,	0x4
	edge8	%l5,	%o4,	%o2
	movrgez	%l1,	0x12F,	%g4
	stx	%o6,	[%l7 + 0x40]
	bne,a	loop_460
	fbl,a	%fcc3,	loop_461
	fmovrdgez	%o0,	%f26,	%f12
	ld	[%l7 + 0x3C],	%f1
loop_460:
	sethi	0x117F,	%i2
loop_461:
	fmovdcs	%icc,	%f26,	%f20
	bg,a,pn	%icc,	loop_462
	edge16n	%o1,	%i5,	%l6
	movgu	%icc,	%i7,	%o7
	fornot1	%f22,	%f16,	%f0
loop_462:
	fpadd32s	%f23,	%f18,	%f5
	prefetch	[%l7 + 0x50],	 0x1
	sdivx	%l4,	0x0406,	%o5
	fornot2	%f26,	%f24,	%f26
	srl	%i1,	0x16,	%g3
	fba,a	%fcc3,	loop_463
	movrgz	%g5,	%g7,	%g6
	fmovsne	%xcc,	%f23,	%f28
	set	0x2C, %o5
	stha	%l3,	[%l7 + %o5] 0x2f
	membar	#Sync
loop_463:
	movre	%i6,	0x099,	%g1
	set	0x56, %i4
	lduha	[%l7 + %i4] 0x04,	%i3
	set	0x44, %i7
	stwa	%g2,	[%l7 + %i7] 0x88
	movrlz	%i0,	0x215,	%i4
	movcc	%xcc,	%l0,	%o3
	fpadd32	%f10,	%f26,	%f20
	wr	%g0,	0x11,	%asi
	stwa	%l2,	[%l7 + 0x64] %asi
	taddcctv	%l5,	0x0EE8,	%o4
	fmovs	%f24,	%f26
	movrne	%o2,	%g4,	%o6
	ldstub	[%l7 + 0x76],	%l1
	edge16ln	%i2,	%o0,	%i5
	wr	%g0,	0xe3,	%asi
	stwa	%l6,	[%l7 + 0x20] %asi
	membar	#Sync
	subccc	%i7,	0x0DF4,	%o1
	movgu	%icc,	%o7,	%o5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%i1
	fmovspos	%xcc,	%f21,	%f24
	sra	%g3,	%l4,	%g7
	xorcc	%g5,	0x10B7,	%g6
	movrne	%l3,	%g1,	%i3
	tvs	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4C] %asi,	%g2
	fpsub32s	%f8,	%f13,	%f0
	orncc	%i0,	0x1F23,	%i6
	sll	%l0,	0x14,	%o3
	fmovscs	%xcc,	%f12,	%f5
	sra	%i4,	%l2,	%l5
	be	%xcc,	loop_464
	fpsub16s	%f4,	%f20,	%f4
	set	0x32, %o0
	lduha	[%l7 + %o0] 0x04,	%o2
loop_464:
	bpos,a	loop_465
	tneg	%xcc,	0x0
	fmovdge	%icc,	%f26,	%f9
	te	%xcc,	0x1
loop_465:
	fandnot2s	%f18,	%f30,	%f9
	ldx	[%l7 + 0x40],	%g4
	fbg	%fcc1,	loop_466
	brlez,a	%o6,	loop_467
	sdivcc	%o4,	0x0352,	%l1
	fbn,a	%fcc2,	loop_468
loop_466:
	lduw	[%l7 + 0x40],	%i2
loop_467:
	nop
	setx	loop_469,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdleu	%icc,	%f5,	%f29
loop_468:
	andncc	%i5,	%o0,	%i7
	andcc	%o1,	%l6,	%o5
loop_469:
	orncc	%i1,	%g3,	%l4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	taddcc	%g7,	%g5,	%g6
	tvs	%icc,	0x7
	wr	%g0,	0x11,	%asi
	stba	%l3,	[%l7 + 0x74] %asi
	bvc,a	loop_470
	fnand	%f20,	%f4,	%f10
	call	loop_471
	alignaddrl	%o7,	%g1,	%g2
loop_470:
	brz,a	%i3,	loop_472
	fmovrslez	%i0,	%f18,	%f19
loop_471:
	be,a	loop_473
	sll	%l0,	%i6,	%i4
loop_472:
	srax	%l2,	0x1C,	%o3
	sub	%o2,	0x0F8C,	%l5
loop_473:
	swap	[%l7 + 0x40],	%g4
	pdist	%f14,	%f12,	%f12
	fmovrsgez	%o4,	%f20,	%f10
	movgu	%icc,	%o6,	%l1
	stw	%i2,	[%l7 + 0x74]
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x0c,	 0x0
	alignaddrl	%i7,	%o0,	%l6
	tsubcctv	%o1,	%i1,	%g3
	fpadd32s	%f19,	%f28,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%l4,	%g7
	tgu	%icc,	0x6
	sra	%g5,	%g6,	%l3
	edge32l	%o5,	%g1,	%o7
	movleu	%xcc,	%g2,	%i0
	sdivx	%l0,	0x141C,	%i3
	tge	%xcc,	0x5
	fmovrdlez	%i4,	%f24,	%f22
	sdivcc	%l2,	0x14D4,	%i6
	sdivx	%o3,	0x0517,	%l5
	tvc	%icc,	0x7
	set	0x6C, %o1
	ldsha	[%l7 + %o1] 0x0c,	%g4
	edge32ln	%o4,	%o2,	%o6
	subcc	%l1,	%i2,	%i7
	orncc	%i5,	0x1DA9,	%o0
	ldsh	[%l7 + 0x4E],	%o1
	fmul8ulx16	%f30,	%f22,	%f20
	subccc	%l6,	%g3,	%i1
	fmovdvs	%xcc,	%f6,	%f9
	tn	%xcc,	0x3
	edge32n	%g7,	%l4,	%g5
	and	%g6,	0x1E5E,	%o5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x2C] %asi,	%f22
	tl	%xcc,	0x3
	bcs,a	%icc,	loop_474
	fmovsgu	%icc,	%f21,	%f4
	movrlez	%l3,	%o7,	%g1
	fpadd16	%f26,	%f20,	%f10
loop_474:
	edge16	%g2,	%l0,	%i3
	movneg	%xcc,	%i0,	%i4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x24] %asi,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i6,	%l2
	tgu	%xcc,	0x4
	movleu	%icc,	%l5,	%o3
	set	0x7A, %o3
	lduha	[%l7 + %o3] 0x80,	%o4
	fornot2	%f30,	%f22,	%f6
	orcc	%o2,	%g4,	%l1
	set	0x42, %i0
	ldsba	[%l7 + %i0] 0x0c,	%o6
	and	%i2,	%i7,	%i5
	srax	%o1,	%o0,	%g3
	tcs	%xcc,	0x6
	orncc	%i1,	%g7,	%l6
	fbg,a	%fcc2,	loop_475
	movleu	%xcc,	%g5,	%l4
	mova	%xcc,	%o5,	%g6
	nop
	setx	0xEE2052F130567A7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_475:
	movrgz	%l3,	%g1,	%g2
	andn	%l0,	%i3,	%o7
	srl	%i4,	%i6,	%i0
	or	%l2,	%o3,	%o4
	movrgz	%o2,	%g4,	%l1
	tg	%icc,	0x4
	movl	%icc,	%l5,	%o6
	or	%i7,	0x06BB,	%i5
	orn	%i2,	%o1,	%g3
	umul	%i1,	0x1C27,	%g7
	st	%f11,	[%l7 + 0x50]
	fones	%f15
	addc	%o0,	%l6,	%l4
	udivx	%g5,	0x0986,	%g6
	brgz,a	%l3,	loop_476
	subc	%o5,	%g1,	%g2
	movg	%icc,	%i3,	%l0
	edge16l	%o7,	%i4,	%i0
loop_476:
	edge16n	%i6,	%o3,	%o4
	fcmpgt16	%f0,	%f30,	%l2
	fmovrdgz	%g4,	%f6,	%f18
	taddcctv	%l1,	0x1ED1,	%l5
	mulx	%o6,	%i7,	%i5
	bge	%xcc,	loop_477
	tn	%xcc,	0x6
	tvc	%icc,	0x3
	sir	0x094A
loop_477:
	tne	%xcc,	0x2
	bge,a	loop_478
	srlx	%i2,	%o1,	%o2
	umul	%i1,	0x014B,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_478:
	fxnors	%f22,	%f23,	%f0
	movcc	%xcc,	%g7,	%l6
	ldx	[%l7 + 0x78],	%o0
	smulcc	%g5,	0x1396,	%l4
	movgu	%icc,	%g6,	%o5
	ldx	[%l7 + 0x48],	%g1
	fmovdneg	%xcc,	%f14,	%f29
	srlx	%g2,	0x1B,	%i3
	edge8n	%l0,	%l3,	%i4
	srlx	%o7,	%i6,	%i0
	fors	%f31,	%f9,	%f21
	fbg,a	%fcc2,	loop_479
	fmovsvs	%xcc,	%f8,	%f6
	xorcc	%o3,	0x0F17,	%l2
	edge32ln	%o4,	%g4,	%l5
loop_479:
	umul	%o6,	0x1C7D,	%l1
	nop
	setx	loop_480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%i7,	%i5,	%i2
	movne	%xcc,	%o1,	%o2
	orncc	%i1,	%g3,	%l6
loop_480:
	fnor	%f24,	%f16,	%f4
	fble,a	%fcc1,	loop_481
	movn	%icc,	%o0,	%g7
	set	0x5C, %g4
	ldsha	[%l7 + %g4] 0x11,	%g5
loop_481:
	tn	%icc,	0x4
	fpsub16s	%f26,	%f20,	%f13
	tgu	%xcc,	0x2
	smulcc	%l4,	0x1730,	%o5
	movre	%g6,	0x175,	%g2
	bcc,a	loop_482
	fmovrdlez	%g1,	%f20,	%f28
	sir	0x1229
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_482:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%l3
	fandnot2s	%f3,	%f18,	%f16
	orn	%l0,	%o7,	%i6
	edge32	%i4,	%i0,	%l2
	std	%f28,	[%l7 + 0x18]
	nop
	setx	0xD0636E8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	smulcc	%o4,	0x17B3,	%g4
	sllx	%l5,	%o3,	%l1
	fzeros	%f25
	movrlz	%i7,	0x35C,	%o6
	taddcctv	%i5,	%o1,	%o2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	movcs	%xcc,	%g3,	%l6
	smulcc	%i1,	0x0C8E,	%o0
	edge8l	%g5,	%g7,	%l4
	bl,pn	%icc,	loop_483
	movrne	%g6,	%o5,	%g2
	fmovdvs	%icc,	%f0,	%f13
	st	%f3,	[%l7 + 0x38]
loop_483:
	andn	%i3,	0x0037,	%l3
	fmovsgu	%icc,	%f29,	%f1
	set	0x34, %i2
	lda	[%l7 + %i2] 0x0c,	%f4
	bne,a	loop_484
	sub	%g1,	%o7,	%l0
	tcc	%icc,	0x3
	set	0x08, %o7
	stxa	%i6,	[%l7 + %o7] 0x80
loop_484:
	ba,pn	%xcc,	loop_485
	addccc	%i4,	%i0,	%l2
	fpadd32s	%f25,	%f27,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_485:
	movl	%xcc,	%o4,	%g4
	fmovse	%xcc,	%f17,	%f29
	sllx	%o3,	%l5,	%l1
	tvc	%icc,	0x6
	lduw	[%l7 + 0x0C],	%o6
	stbar
	edge16n	%i5,	%o1,	%i7
	fornot2	%f0,	%f20,	%f8
	mulscc	%o2,	0x1658,	%g3
	sra	%l6,	0x0E,	%i2
	taddcc	%i1,	%o0,	%g5
	wr	%g0,	0x88,	%asi
	sta	%f13,	[%l7 + 0x68] %asi
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l4
	mulx	%g6,	0x0E08,	%g7
	nop
	setx	0x19DAC653,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x5982B131,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f15,	%f27
	mova	%xcc,	%g2,	%i3
	fblg	%fcc3,	loop_486
	orncc	%l3,	0x1BEE,	%o5
	movl	%xcc,	%g1,	%o7
	fbne	%fcc3,	loop_487
loop_486:
	movcc	%icc,	%l0,	%i4
	fornot1	%f16,	%f16,	%f2
	flush	%l7 + 0x28
loop_487:
	taddcc	%i6,	%l2,	%i0
	st	%f23,	[%l7 + 0x68]
	tgu	%icc,	0x2
	movgu	%icc,	%o4,	%o3
	tg	%xcc,	0x6
	udivx	%l5,	0x13E8,	%g4
	fmuld8sux16	%f2,	%f11,	%f10
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x19,	 0x3
	fmovrde	%i5,	%f14,	%f30
	fcmpeq16	%f20,	%f20,	%l1
	ldstub	[%l7 + 0x57],	%i7
	srax	%o2,	%g3,	%l6
	orn	%o1,	0x18BF,	%i1
	fpadd16	%f16,	%f10,	%f24
	andn	%o0,	0x0462,	%g5
	fmovdvs	%xcc,	%f18,	%f1
	bleu,a	loop_488
	edge16n	%i2,	%l4,	%g6
	fnot2	%f26,	%f12
	edge8ln	%g2,	%i3,	%g7
loop_488:
	fpadd32	%f2,	%f24,	%f20
	movvs	%xcc,	%o5,	%g1
	fandnot2s	%f25,	%f3,	%f21
	fpmerge	%f11,	%f14,	%f2
	subc	%l3,	%l0,	%o7
	tn	%icc,	0x6
	fmovse	%xcc,	%f11,	%f8
	membar	0x36
	orcc	%i6,	0x1251,	%i4
	orcc	%l2,	%o4,	%i0
	fcmpgt16	%f30,	%f26,	%o3
	fmovrsgz	%l5,	%f20,	%f14
	brnz	%g4,	loop_489
	edge32ln	%o6,	%i5,	%l1
	edge16l	%i7,	%o2,	%l6
	srlx	%o1,	%g3,	%o0
loop_489:
	movcs	%icc,	%i1,	%g5
	and	%i2,	0x060E,	%g6
	stb	%g2,	[%l7 + 0x55]
	srax	%l4,	0x08,	%i3
	umul	%o5,	0x0F32,	%g1
	addccc	%g7,	0x0BB6,	%l3
	brgez	%l0,	loop_490
	ldstub	[%l7 + 0x60],	%o7
	fxnor	%f4,	%f30,	%f6
	subcc	%i6,	%i4,	%l2
loop_490:
	stx	%o4,	[%l7 + 0x08]
	srlx	%i0,	0x0E,	%l5
	edge8ln	%g4,	%o6,	%o3
	fcmpeq16	%f24,	%f14,	%l1
	ldsb	[%l7 + 0x7D],	%i7
	wr	%g0,	0xe2,	%asi
	stha	%i5,	[%l7 + 0x6E] %asi
	membar	#Sync
	movvc	%xcc,	%l6,	%o1
	bpos,a,pt	%icc,	loop_491
	movpos	%xcc,	%g3,	%o0
	fbl	%fcc2,	loop_492
	udivx	%i1,	0x0EAE,	%o2
loop_491:
	tl	%xcc,	0x1
	orn	%i2,	0x1960,	%g5
loop_492:
	xor	%g6,	0x1DDB,	%l4
	fbu	%fcc0,	loop_493
	fbuge	%fcc1,	loop_494
	fbn	%fcc0,	loop_495
	orn	%g2,	%o5,	%i3
loop_493:
	nop
	setx	0x626EABF003092833,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x7CDCA44268CE24EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f0,	%f24
loop_494:
	edge8ln	%g7,	%g1,	%l0
loop_495:
	fmul8x16au	%f26,	%f19,	%f2
	movle	%xcc,	%l3,	%o7
	fpadd16s	%f9,	%f25,	%f10
	fcmpeq16	%f20,	%f2,	%i6
	movgu	%icc,	%l2,	%i4
	fbge,a	%fcc1,	loop_496
	fblg	%fcc1,	loop_497
	or	%o4,	%i0,	%l5
	nop
	fitos	%f8,	%f12
	fstox	%f12,	%f12
loop_496:
	subcc	%g4,	%o3,	%o6
loop_497:
	ldub	[%l7 + 0x7A],	%l1
	udivcc	%i7,	0x0E6B,	%i5
	movvc	%icc,	%o1,	%l6
	movrlez	%g3,	0x1DB,	%i1
	subccc	%o2,	%o0,	%i2
	tsubcctv	%g5,	0x1AAD,	%l4
	fnegd	%f4,	%f22
	addc	%g2,	%o5,	%i3
	addccc	%g6,	0x045F,	%g1
	movl	%xcc,	%g7,	%l3
	addcc	%l0,	%o7,	%l2
	udiv	%i6,	0x1CAF,	%i4
	sdivcc	%i0,	0x0C08,	%o4
	fbule	%fcc1,	loop_498
	fnot1	%f8,	%f14
	tg	%xcc,	0x6
	fmovde	%icc,	%f19,	%f13
loop_498:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%g4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fsrc2s	%f14,	%f27
	fpadd16	%f20,	%f30,	%f16
	ldstub	[%l7 + 0x1D],	%o6
	add	%l1,	%i7,	%i5
	for	%f24,	%f14,	%f10
	sethi	0x02C9,	%o1
	tcs	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_499,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xor	%l6,	0x0449,	%l5
	ble,pn	%icc,	loop_500
	stb	%i1,	[%l7 + 0x32]
loop_499:
	tgu	%icc,	0x0
	andcc	%g3,	0x07DD,	%o0
loop_500:
	movn	%icc,	%i2,	%o2
	tcs	%icc,	0x3
	subccc	%g5,	%g2,	%l4
	fzeros	%f31
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f10
	movre	%o5,	0x109,	%i3
	nop
	setx	0x4C3018FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x391E444E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f29,	%f15
	movcs	%icc,	%g1,	%g6
	tvc	%icc,	0x3
	fpsub16s	%f28,	%f29,	%f16
	movne	%xcc,	%l3,	%l0
	fbul,a	%fcc0,	loop_501
	bvc,a	loop_502
	alignaddr	%g7,	%o7,	%l2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x78] %asi,	%i4
loop_501:
	udivcc	%i6,	0x14DA,	%o4
loop_502:
	call	loop_503
	ldd	[%l7 + 0x10],	%g4
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_503:
	addc	%i0,	%o6,	%l1
	ldsw	[%l7 + 0x38],	%o3
	nop
	fitod	%f30,	%f28
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%i5
	smulcc	%l6,	%l5,	%i1
	bl,a	loop_504
	or	%g3,	0x1564,	%o0
	smul	%i2,	0x0713,	%o2
	sdivcc	%o1,	0x19F8,	%g5
loop_504:
	tneg	%xcc,	0x1
	nop
	setx	0x53081C3EB8CC2EB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x6CC655C6FE68B731,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f10,	%f30
	move	%icc,	%l4,	%g2
	sethi	0x1CAB,	%o5
	movrlz	%i3,	%g6,	%l3
	swap	[%l7 + 0x30],	%g1
	nop
	setx	0x09249AA65A0F1431,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xA2E62045348E7175,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f12,	%f30
	tge	%xcc,	0x1
	tsubcctv	%g7,	%o7,	%l0
	andcc	%i4,	%i6,	%l2
	tle	%xcc,	0x1
	addcc	%g4,	%i0,	%o4
	tleu	%icc,	0x3
	fmovrdgz	%o6,	%f20,	%f2
	fbule	%fcc2,	loop_505
	udivcc	%o3,	0x0A0E,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i7,	%i5,	%l5
loop_505:
	udivcc	%l6,	0x1D3F,	%g3
	nop
	setx	0x50D1BA0F7A0860B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xA40CE6130C8C8733,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f28,	%f22
	movrlez	%o0,	0x093,	%i1
	or	%i2,	%o2,	%g5
	and	%l4,	0x1A79,	%g2
	movle	%xcc,	%o5,	%o1
	te	%xcc,	0x6
	set	0x3C, %i1
	lda	[%l7 + %i1] 0x18,	%f13
	stb	%g6,	[%l7 + 0x0E]
	fsrc1s	%f24,	%f13
	fmovsneg	%icc,	%f26,	%f13
	xnorcc	%l3,	%i3,	%g1
	bgu,pn	%icc,	loop_506
	swap	[%l7 + 0x38],	%o7
	sth	%l0,	[%l7 + 0x5E]
	sdiv	%g7,	0x0ACA,	%i4
loop_506:
	fbuge	%fcc1,	loop_507
	st	%f27,	[%l7 + 0x50]
	movrlz	%l2,	%i6,	%i0
	tleu	%xcc,	0x0
loop_507:
	orcc	%g4,	0x1519,	%o4
	bleu,pn	%icc,	loop_508
	fornot1	%f16,	%f18,	%f6
	fmovrdlz	%o6,	%f8,	%f4
	call	loop_509
loop_508:
	ldx	[%l7 + 0x28],	%o3
	bgu,a,pt	%icc,	loop_510
	fcmpne16	%f8,	%f14,	%l1
loop_509:
	mulx	%i5,	%l5,	%i7
	fcmpne16	%f18,	%f8,	%l6
loop_510:
	array32	%g3,	%o0,	%i2
	fone	%f20
	tl	%icc,	0x4
	fmovdpos	%icc,	%f17,	%f6
	edge8n	%o2,	%i1,	%g5
	fandnot1s	%f14,	%f7,	%f1
	bge,a	%icc,	loop_511
	fbn,a	%fcc1,	loop_512
	xorcc	%l4,	0x1026,	%g2
	fmovde	%icc,	%f21,	%f28
loop_511:
	fmovrse	%o1,	%f14,	%f10
loop_512:
	nop
	set	0x44, %g5
	ldswa	[%l7 + %g5] 0x80,	%o5
	fxors	%f27,	%f8,	%f9
	nop
	setx	0xA78373511C9D8628,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f22
	xor	%g6,	%i3,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	%icc,	loop_513
	movg	%xcc,	%l3,	%l0
	addcc	%g7,	%i4,	%o7
	tn	%icc,	0x2
loop_513:
	sdivcc	%i6,	0x1EC8,	%l2
	for	%f24,	%f10,	%f16
	fbue	%fcc1,	loop_514
	fxnor	%f14,	%f8,	%f16
	orn	%i0,	%o4,	%g4
	set	0x20, %l3
	swapa	[%l7 + %l3] 0x11,	%o3
loop_514:
	fcmpgt32	%f10,	%f4,	%l1
	fcmple32	%f6,	%f24,	%i5
	movrne	%l5,	%i7,	%o6
	fmovsvc	%xcc,	%f3,	%f10
	nop
	setx	0x76C829219CEC62F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x959E00C3607904BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f10,	%f16
	movrgz	%g3,	0x2BA,	%l6
	tn	%xcc,	0x2
	sllx	%i2,	0x1A,	%o0
	fbul	%fcc0,	loop_515
	stw	%o2,	[%l7 + 0x58]
	brgez	%i1,	loop_516
	fmul8ulx16	%f2,	%f4,	%f26
loop_515:
	flush	%l7 + 0x50
	addcc	%l4,	0x1DCB,	%g2
loop_516:
	tg	%xcc,	0x3
	sdivcc	%g5,	0x03D1,	%o5
	fpadd16s	%f20,	%f30,	%f25
	ldstub	[%l7 + 0x60],	%g6
	movvc	%xcc,	%i3,	%g1
	movne	%xcc,	%l3,	%l0
	wr	%g0,	0x80,	%asi
	stxa	%o1,	[%l7 + 0x40] %asi
	add	%g7,	%i4,	%i6
	udiv	%l2,	0x16E4,	%o7
	array32	%o4,	%g4,	%o3
	bneg	%xcc,	loop_517
	tg	%xcc,	0x4
	movne	%icc,	%l1,	%i0
	tn	%xcc,	0x0
loop_517:
	fandnot2	%f8,	%f30,	%f8
	stw	%i5,	[%l7 + 0x4C]
	movgu	%icc,	%l5,	%o6
	call	loop_518
	fone	%f18
	movleu	%xcc,	%g3,	%i7
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f6
loop_518:
	and	%i2,	0x1BC9,	%o0
	tgu	%xcc,	0x3
	sethi	0x0616,	%l6
	add	%i1,	%o2,	%l4
	fbo,a	%fcc0,	loop_519
	nop
	fitos	%f2,	%f25
	fstod	%f25,	%f6
	srl	%g5,	%o5,	%g6
	tl	%icc,	0x2
loop_519:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%g2
	andn	%i3,	0x0EBE,	%l3
	brgz	%l0,	loop_520
	fmul8ulx16	%f24,	%f18,	%f28
	te	%icc,	0x4
	sdivx	%g1,	0x1FE5,	%g7
loop_520:
	fbul,a	%fcc2,	loop_521
	ld	[%l7 + 0x4C],	%f7
	array32	%o1,	%i4,	%i6
	movneg	%xcc,	%l2,	%o4
loop_521:
	nop
	set	0x54, %g7
	stba	%g4,	[%l7 + %g7] 0x2b
	membar	#Sync
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x1f,	%f0
	xnorcc	%o3,	%o7,	%l1
	edge8	%i5,	%l5,	%o6
	array8	%i0,	%i7,	%i2
	fmovsn	%xcc,	%f2,	%f19
	ta	%icc,	0x2
	set	0x38, %l4
	ldswa	[%l7 + %l4] 0x81,	%g3
	ldx	[%l7 + 0x48],	%o0
	mova	%xcc,	%l6,	%i1
	edge8n	%o2,	%l4,	%o5
	set	0x08, %g3
	lduha	[%l7 + %g3] 0x81,	%g5
	subcc	%g2,	0x1E0D,	%g6
	array8	%l3,	%l0,	%g1
	movg	%icc,	%g7,	%i3
	membar	0x17
	mulscc	%i4,	0x0A8D,	%i6
	tle	%xcc,	0x4
	brgz,a	%o1,	loop_522
	tpos	%xcc,	0x1
	edge16l	%o4,	%l2,	%g4
	bne,pt	%xcc,	loop_523
loop_522:
	brnz	%o7,	loop_524
	be,pt	%icc,	loop_525
	movg	%xcc,	%l1,	%o3
loop_523:
	fbu,a	%fcc1,	loop_526
loop_524:
	tg	%icc,	0x1
loop_525:
	tvs	%icc,	0x7
	fmovdn	%icc,	%f16,	%f24
loop_526:
	nop
	setx	0x5DCDD2D7C07075D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fbl	%fcc2,	loop_527
	tgu	%icc,	0x3
	orn	%i5,	%o6,	%i0
	tg	%icc,	0x3
loop_527:
	movne	%icc,	%l5,	%i7
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x14,	 0x1
	sdivcc	%i2,	0x186F,	%o0
	sll	%i1,	0x18,	%o2
	fble,a	%fcc1,	loop_528
	edge8ln	%l4,	%o5,	%l6
	edge32n	%g5,	%g6,	%l3
	mulx	%g2,	0x1AAF,	%l0
loop_528:
	ldsb	[%l7 + 0x23],	%g7
	fbne,a	%fcc0,	loop_529
	array8	%i3,	%g1,	%i6
	movrlz	%o1,	0x21C,	%i4
	ldub	[%l7 + 0x4F],	%l2
loop_529:
	tne	%xcc,	0x5
	fmovspos	%xcc,	%f23,	%f5
	edge16	%o4,	%o7,	%g4
	udivx	%o3,	0x0974,	%l1
	fmovrdlz	%o6,	%f0,	%f0
	fnor	%f4,	%f18,	%f10
	fbo	%fcc2,	loop_530
	fpsub32	%f8,	%f28,	%f30
	fmovspos	%xcc,	%f3,	%f2
	fcmple16	%f6,	%f10,	%i5
loop_530:
	or	%l5,	%i0,	%i7
	tneg	%icc,	0x5
	edge16n	%i2,	%g3,	%o0
	stb	%i1,	[%l7 + 0x7F]
	addcc	%o2,	%l4,	%o5
	tpos	%xcc,	0x2
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x16,	%f0
	udiv	%g5,	0x0DDD,	%g6
	movneg	%icc,	%l3,	%l6
	tsubcc	%g2,	%g7,	%i3
	brgz	%g1,	loop_531
	tsubcctv	%l0,	0x0B6A,	%o1
	edge32n	%i4,	%l2,	%i6
	fpsub32	%f6,	%f12,	%f26
loop_531:
	fpack32	%f24,	%f26,	%f22
	popc	0x1977,	%o4
	swap	[%l7 + 0x30],	%g4
	or	%o3,	0x1A9C,	%o7
	fmovdl	%icc,	%f29,	%f7
	movrne	%o6,	0x0CD,	%i5
	sdiv	%l5,	0x1914,	%l1
	taddcc	%i7,	0x04CD,	%i2
	move	%xcc,	%i0,	%o0
	tge	%xcc,	0x2
	tvc	%xcc,	0x4
	orncc	%g3,	%i1,	%o2
	tleu	%icc,	0x1
	popc	0x02CF,	%l4
	movrgz	%g5,	0x121,	%o5
	xnor	%l3,	%l6,	%g2
	nop
	setx	0x5FA5D51E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x7940200A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f0,	%f24
	bgu,a	loop_532
	sdiv	%g6,	0x1A53,	%i3
	or	%g1,	0x08DE,	%l0
	subc	%o1,	0x05BD,	%g7
loop_532:
	bn,a,pt	%xcc,	loop_533
	movne	%icc,	%i4,	%l2
	tge	%xcc,	0x2
	membar	0x54
loop_533:
	movne	%xcc,	%o4,	%i6
	fmovsle	%icc,	%f19,	%f25
	srax	%g4,	0x0E,	%o7
	subcc	%o6,	0x051C,	%i5
	and	%o3,	0x1134,	%l1
	mova	%icc,	%l5,	%i2
	orn	%i7,	%o0,	%i0
	swap	[%l7 + 0x08],	%g3
	srax	%i1,	0x0E,	%l4
	ldd	[%l7 + 0x28],	%f8
	fbule	%fcc2,	loop_534
	sra	%o2,	0x08,	%o5
	ldx	[%l7 + 0x50],	%l3
	edge8ln	%g5,	%l6,	%g6
loop_534:
	fones	%f27
	ta	%xcc,	0x4
	bl,a,pn	%icc,	loop_535
	edge16n	%i3,	%g1,	%g2
	movcc	%icc,	%l0,	%g7
	fmovrdgez	%o1,	%f16,	%f20
loop_535:
	tg	%icc,	0x4
	ta	%xcc,	0x4
	xor	%i4,	0x1869,	%l2
	tg	%icc,	0x7
	fmul8sux16	%f14,	%f2,	%f12
	movn	%xcc,	%o4,	%g4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%i6
	tvs	%xcc,	0x3
	andn	%o6,	0x0793,	%o7
	fbe,a	%fcc1,	loop_536
	sir	0x0AB7
	fbn,a	%fcc0,	loop_537
	fmovrdlz	%i5,	%f28,	%f30
loop_536:
	fbn	%fcc1,	loop_538
	tge	%xcc,	0x4
loop_537:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x54] %asi,	%l1
loop_538:
	fmovsne	%xcc,	%f10,	%f17
	alignaddrl	%o3,	%i2,	%l5
	alignaddrl	%o0,	%i0,	%i7
	udiv	%g3,	0x0901,	%l4
	bge,a,pt	%icc,	loop_539
	umulcc	%i1,	0x0074,	%o5
	edge32l	%l3,	%g5,	%o2
	mulscc	%l6,	%g6,	%g1
loop_539:
	movvs	%xcc,	%i3,	%l0
	alignaddrl	%g7,	%o1,	%i4
	umul	%l2,	0x00BC,	%o4
	xnorcc	%g4,	%i6,	%g2
	tg	%xcc,	0x5
	fcmpeq32	%f28,	%f6,	%o6
	bge,a	loop_540
	fbe	%fcc2,	loop_541
	andcc	%i5,	%l1,	%o7
	lduw	[%l7 + 0x10],	%i2
loop_540:
	fxnors	%f31,	%f8,	%f27
loop_541:
	edge32ln	%o3,	%o0,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i0,	%g3,	%l4
	fmovdgu	%xcc,	%f21,	%f16
	srlx	%i7,	%i1,	%o5
	tvs	%icc,	0x5
	te	%icc,	0x7
	fnor	%f24,	%f14,	%f14
	edge16n	%g5,	%o2,	%l3
	srlx	%g6,	0x0C,	%g1
	fpadd32s	%f26,	%f22,	%f22
	xor	%l6,	%i3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l0,	0x0415,	%o1
	lduw	[%l7 + 0x28],	%i4
	fmovdgu	%icc,	%f15,	%f23
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fnot1s	%f7,	%f28
	fmul8x16	%f5,	%f28,	%f16
	tgu	%icc,	0x5
	array16	%l2,	%g4,	%o4
	movpos	%xcc,	%g2,	%o6
	movpos	%icc,	%i5,	%l1
	fmovsn	%icc,	%f6,	%f6
	fbul,a	%fcc0,	loop_542
	movrlez	%o7,	0x031,	%i2
	fbne	%fcc2,	loop_543
	edge8ln	%i6,	%o0,	%l5
loop_542:
	nop
	set	0x70, %i3
	lda	[%l7 + %i3] 0x04,	%f22
loop_543:
	add	%o3,	%g3,	%i0
	addccc	%i7,	%l4,	%i1
	movgu	%icc,	%o5,	%g5
	edge32	%l3,	%o2,	%g1
	mulx	%l6,	0x1966,	%i3
	tcs	%icc,	0x6
	bn,a,pt	%icc,	loop_544
	movg	%xcc,	%g6,	%l0
	bg	%icc,	loop_545
	fmovdn	%icc,	%f24,	%f17
loop_544:
	fmul8x16	%f30,	%f8,	%f12
	flush	%l7 + 0x4C
loop_545:
	edge8n	%g7,	%i4,	%l2
	tg	%xcc,	0x5
	movneg	%icc,	%o1,	%g4
	xor	%o4,	%g2,	%i5
	tg	%icc,	0x3
	mulscc	%l1,	%o7,	%o6
	movge	%icc,	%i6,	%i2
	fbug,a	%fcc0,	loop_546
	sra	%l5,	0x18,	%o3
	fornot2s	%f11,	%f18,	%f19
	tl	%icc,	0x7
loop_546:
	fmul8ulx16	%f26,	%f30,	%f28
	array16	%g3,	%o0,	%i7
	fnor	%f14,	%f2,	%f14
	movne	%icc,	%i0,	%l4
	fbl,a	%fcc1,	loop_547
	fbue	%fcc3,	loop_548
	movvc	%icc,	%o5,	%i1
	prefetch	[%l7 + 0x7C],	 0x2
loop_547:
	edge16ln	%l3,	%g5,	%o2
loop_548:
	bpos	loop_549
	movcs	%xcc,	%l6,	%i3
	fexpand	%f18,	%f16
	movcs	%xcc,	%g1,	%g6
loop_549:
	stb	%l0,	[%l7 + 0x3A]
	flush	%l7 + 0x6C
	fbg,a	%fcc3,	loop_550
	fands	%f15,	%f7,	%f19
	fpsub32	%f16,	%f22,	%f0
	movrgz	%i4,	%l2,	%o1
loop_550:
	bcc,a	%xcc,	loop_551
	fmovse	%icc,	%f27,	%f19
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%g4
loop_551:
	mulscc	%g7,	%g2,	%i5
	edge32n	%l1,	%o7,	%o4
	popc	%i6,	%o6
	srax	%l5,	%i2,	%g3
	movn	%icc,	%o3,	%o0
	udivx	%i0,	0x0E5F,	%i7
	movleu	%icc,	%l4,	%i1
	brlez,a	%o5,	loop_552
	lduh	[%l7 + 0x74],	%l3
	fexpand	%f12,	%f2
	nop
	fitod	%f15,	%f8
loop_552:
	andn	%g5,	%o2,	%i3
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x0c,	 0x2
	tgu	%xcc,	0x7
	fmovrdgz	%g6,	%f2,	%f18
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x70] %asi,	%g1
	fmovrdlez	%l0,	%f30,	%f20
	bpos	loop_553
	xnorcc	%i4,	%o1,	%g4
	edge32l	%l2,	%g7,	%g2
	fpackfix	%f8,	%f15
loop_553:
	fmovsle	%icc,	%f4,	%f27
	membar	0x03
	movpos	%xcc,	%i5,	%l1
	bgu,pt	%icc,	loop_554
	brlz,a	%o7,	loop_555
	fmovdvc	%xcc,	%f7,	%f13
	edge32n	%i6,	%o6,	%o4
loop_554:
	fmovsleu	%xcc,	%f6,	%f7
loop_555:
	bg	loop_556
	stx	%l5,	[%l7 + 0x58]
	sllx	%g3,	0x05,	%i2
	subcc	%o3,	0x00CD,	%o0
loop_556:
	tn	%icc,	0x7
	edge16	%i0,	%i7,	%i1
	sir	0x03A2
	swap	[%l7 + 0x08],	%o5
	wr	%g0,	0x10,	%asi
	stwa	%l4,	[%l7 + 0x54] %asi
	fmovscc	%xcc,	%f14,	%f25
	taddcctv	%g5,	%o2,	%l3
	edge16l	%i3,	%l6,	%g1
	tleu	%xcc,	0x7
	movrne	%l0,	0x263,	%i4
	sdiv	%o1,	0x13CC,	%g6
	fmovdcc	%xcc,	%f17,	%f13
	orncc	%l2,	0x0C12,	%g7
	bpos	loop_557
	ldx	[%l7 + 0x48],	%g4
	sth	%i5,	[%l7 + 0x1E]
	movcc	%xcc,	%g2,	%l1
loop_557:
	ta	%xcc,	0x3
	fcmpgt32	%f16,	%f30,	%i6
	nop
	setx	0x704535C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x40] %asi,	%o7
	orn	%o4,	0x0177,	%l5
	fbg	%fcc2,	loop_558
	fone	%f2
	addccc	%o6,	%g3,	%i2
	movgu	%icc,	%o3,	%i0
loop_558:
	fbn	%fcc0,	loop_559
	nop
	setx	0x4291BF85E0C103D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB780CA094BE2D1B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f16,	%f20
	stx	%o0,	[%l7 + 0x50]
	ta	%icc,	0x5
loop_559:
	fandnot1	%f30,	%f18,	%f28
	fmul8sux16	%f2,	%f22,	%f2
	fmul8x16al	%f13,	%f28,	%f14
	stx	%i7,	[%l7 + 0x48]
	subc	%i1,	%o5,	%l4
	fmovdle	%xcc,	%f14,	%f11
	fcmpeq16	%f8,	%f18,	%o2
	bgu,a,pn	%xcc,	loop_560
	movcs	%xcc,	%l3,	%i3
	fzeros	%f4
	addccc	%l6,	0x1399,	%g1
loop_560:
	fzero	%f30
	fmovdcc	%icc,	%f5,	%f3
	nop
	setx loop_561, %l0, %l1
	jmpl %l1, %l0
	movrlz	%i4,	%o1,	%g6
	sub	%l2,	%g5,	%g7
	tgu	%icc,	0x0
loop_561:
	bcs,a	loop_562
	sth	%g4,	[%l7 + 0x66]
	ba,a	loop_563
	bcs,a	loop_564
loop_562:
	fcmpne32	%f24,	%f16,	%i5
	addcc	%l1,	%g2,	%i6
loop_563:
	andn	%o4,	%o7,	%o6
loop_564:
	sethi	0x1DC9,	%g3
	orn	%l5,	%i2,	%i0
	flush	%l7 + 0x58
	sethi	0x19C7,	%o3
	alignaddr	%o0,	%i1,	%i7
	nop
	setx	0xFE0C18EC1E2D1F36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x5FE7A3234EF76D8D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f2,	%f16
	fbo,a	%fcc3,	loop_565
	bge,pn	%xcc,	loop_566
	tle	%icc,	0x6
	smulcc	%l4,	0x18B8,	%o2
loop_565:
	fnegs	%f7,	%f25
loop_566:
	fand	%f26,	%f16,	%f4
	edge16l	%l3,	%i3,	%o5
	alignaddrl	%g1,	%l6,	%i4
	tcs	%icc,	0x3
	fnot1	%f12,	%f24
	ldstub	[%l7 + 0x6A],	%o1
	wr	%g0,	0x0c,	%asi
	stba	%l0,	[%l7 + 0x16] %asi
	sll	%l2,	0x1F,	%g6
	nop
	setx	0xF6FFA5F84B3F4391,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC67875F6F93399D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f28,	%f6
	brgez,a	%g5,	loop_567
	ba,a	%icc,	loop_568
	movl	%icc,	%g4,	%g7
	smulcc	%l1,	0x13F9,	%g2
loop_567:
	movcc	%icc,	%i5,	%i6
loop_568:
	taddcc	%o7,	0x0523,	%o6
	array8	%g3,	%l5,	%i2
	fmovdleu	%xcc,	%f23,	%f5
	edge32n	%i0,	%o3,	%o0
	te	%xcc,	0x5
	tne	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	stba	%o4,	[%l7 + 0x62] %asi
	move	%icc,	%i7,	%l4
	bl	%icc,	loop_569
	sethi	0x115B,	%i1
	movcc	%icc,	%l3,	%i3
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%o2
loop_569:
	popc	0x0059,	%g1
	st	%f26,	[%l7 + 0x14]
	edge16n	%l6,	%o5,	%o1
	movvs	%xcc,	%i4,	%l2
	addcc	%g6,	%l0,	%g4
	popc	%g5,	%g7
	st	%f9,	[%l7 + 0x78]
	tn	%icc,	0x6
	fnot1s	%f0,	%f8
	movrgez	%l1,	%g2,	%i6
	umulcc	%o7,	0x1D7F,	%i5
	edge16n	%g3,	%l5,	%i2
	andncc	%o6,	%i0,	%o3
	fornot1	%f2,	%f24,	%f24
	fmovrdlez	%o4,	%f14,	%f18
	edge16	%o0,	%i7,	%i1
	sethi	0x1BCC,	%l4
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x0c,	%f0
	tne	%icc,	0x7
	fbne,a	%fcc3,	loop_570
	popc	%i3,	%l3
	taddcctv	%o2,	%l6,	%g1
	movleu	%icc,	%o1,	%o5
loop_570:
	nop
	setx loop_571, %l0, %l1
	jmpl %l1, %i4
	sdiv	%g6,	0x097A,	%l2
	pdist	%f14,	%f10,	%f28
	fmul8x16au	%f6,	%f13,	%f20
loop_571:
	std	%f10,	[%l7 + 0x30]
	fmul8ulx16	%f6,	%f12,	%f0
	or	%l0,	0x01DF,	%g4
	taddcctv	%g5,	%l1,	%g2
	ldsh	[%l7 + 0x08],	%i6
	orcc	%g7,	0x026E,	%o7
	flush	%l7 + 0x18
	movneg	%icc,	%g3,	%l5
	fmovscc	%xcc,	%f22,	%f22
	ldd	[%l7 + 0x40],	%f4
	udiv	%i2,	0x05A8,	%o6
	nop
	fitos	%f11,	%f9
	fstox	%f9,	%f24
	fxtos	%f24,	%f5
	bleu,a	%icc,	loop_572
	udiv	%i5,	0x16E1,	%i0
	sdivcc	%o3,	0x1631,	%o4
	movpos	%xcc,	%i7,	%o0
loop_572:
	orn	%i1,	0x0745,	%l4
	srax	%i3,	0x1F,	%l3
	fmovsne	%icc,	%f18,	%f3
	fabsd	%f18,	%f6
	stbar
	movne	%icc,	%l6,	%o2
	movrgez	%g1,	%o5,	%o1
	edge8ln	%i4,	%l2,	%g6
	fzeros	%f27
	tneg	%xcc,	0x1
	set	0x4C, %g2
	stba	%g4,	[%l7 + %g2] 0xea
	membar	#Sync
	tle	%xcc,	0x0
	sll	%g5,	0x1D,	%l0
	tn	%xcc,	0x0
	te	%xcc,	0x1
	movgu	%xcc,	%g2,	%l1
	and	%i6,	0x1FB0,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o7,	%l5,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f5,	%f12
	fpadd32s	%f0,	%f18,	%f2
	set	0x60, %o6
	stba	%o6,	[%l7 + %o6] 0x11
	fcmpeq32	%f24,	%f30,	%i2
	tl	%icc,	0x5
	stw	%i0,	[%l7 + 0x70]
	fmovrsne	%i5,	%f8,	%f4
	sdivcc	%o3,	0x0722,	%i7
	andncc	%o4,	%i1,	%o0
	nop
	setx	loop_573,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxnors	%f28,	%f21,	%f4
	fbn	%fcc0,	loop_574
	andcc	%i3,	%l3,	%l4
loop_573:
	and	%o2,	%g1,	%l6
	udivcc	%o5,	0x0155,	%o1
loop_574:
	orn	%i4,	0x050B,	%g6
	movg	%icc,	%l2,	%g5
	fmovdne	%xcc,	%f10,	%f23
	edge8ln	%g4,	%g2,	%l0
	umulcc	%i6,	0x1D22,	%g7
	movleu	%icc,	%o7,	%l1
	movrne	%g3,	%o6,	%i2
	fbge	%fcc1,	loop_575
	xnor	%l5,	0x084A,	%i0
	subcc	%i5,	0x0232,	%i7
	fxor	%f8,	%f4,	%f2
loop_575:
	fnot1s	%f30,	%f0
	fmovspos	%xcc,	%f16,	%f4
	edge16l	%o4,	%o3,	%o0
	nop
	setx	0x11634AA51409AE5B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x034E18A5F9CAD33D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f30,	%f14
	edge32l	%i1,	%i3,	%l3
	edge16n	%l4,	%g1,	%o2
	tpos	%icc,	0x5
	fbue,a	%fcc3,	loop_576
	fmovsn	%icc,	%f27,	%f3
	edge32ln	%o5,	%l6,	%o1
	fornot2	%f16,	%f10,	%f16
loop_576:
	sra	%g6,	%i4,	%g5
	ta	%xcc,	0x3
	fone	%f16
	set	0x40, %o4
	lda	[%l7 + %o4] 0x14,	%f23
	fmovsn	%icc,	%f25,	%f5
	umulcc	%l2,	%g2,	%l0
	bcs,a,pn	%icc,	loop_577
	array8	%i6,	%g7,	%o7
	fornot2s	%f20,	%f29,	%f8
	bvc	loop_578
loop_577:
	orncc	%g4,	%l1,	%o6
	xnor	%i2,	%g3,	%i0
	nop
	setx	loop_579,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_578:
	udiv	%l5,	0x0622,	%i5
	fcmpeq32	%f12,	%f28,	%i7
	tl	%icc,	0x3
loop_579:
	edge16	%o3,	%o0,	%o4
	fbo,a	%fcc1,	loop_580
	fones	%f23
	ldd	[%l7 + 0x60],	%f4
	tgu	%xcc,	0x2
loop_580:
	andncc	%i1,	%i3,	%l3
	sir	0x0D30
	sra	%g1,	%l4,	%o2
	bge,a,pt	%icc,	loop_581
	udivx	%l6,	0x0D5B,	%o1
	tneg	%icc,	0x7
	edge16	%o5,	%g6,	%i4
loop_581:
	fxor	%f8,	%f0,	%f20
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x4C] %asi,	%g5
	tne	%icc,	0x3
	st	%f11,	[%l7 + 0x34]
	tn	%xcc,	0x3
	ldsw	[%l7 + 0x18],	%l2
	sethi	0x09D4,	%g2
	fbe,a	%fcc1,	loop_582
	fmovrsgz	%l0,	%f17,	%f8
	flush	%l7 + 0x7C
	and	%g7,	0x08DD,	%o7
loop_582:
	ld	[%l7 + 0x38],	%f18
	subcc	%i6,	%g4,	%o6
	st	%f21,	[%l7 + 0x54]
	and	%i2,	0x1C85,	%g3
	fble,a	%fcc1,	loop_583
	fcmple32	%f14,	%f26,	%i0
	ldsw	[%l7 + 0x74],	%l1
	smulcc	%l5,	%i5,	%i7
loop_583:
	be,a	%icc,	loop_584
	sir	0x08EE
	fornot2s	%f6,	%f7,	%f1
	xor	%o0,	%o3,	%o4
loop_584:
	popc	%i3,	%l3
	fmovda	%xcc,	%f7,	%f1
	stw	%g1,	[%l7 + 0x08]
	fbne	%fcc0,	loop_585
	movrgz	%i1,	%l4,	%o2
	alignaddr	%l6,	%o1,	%g6
	fbu,a	%fcc0,	loop_586
loop_585:
	fnand	%f10,	%f30,	%f24
	movre	%i4,	0x398,	%o5
	sllx	%g5,	0x11,	%g2
loop_586:
	popc	%l2,	%l0
	andn	%o7,	%g7,	%g4
	mova	%xcc,	%i6,	%o6
	movrne	%g3,	0x3C4,	%i2
	mulx	%l1,	0x0585,	%i0
	edge8n	%l5,	%i7,	%o0
	fzeros	%f24
	set	0x16, %l0
	lduba	[%l7 + %l0] 0x89,	%i5
	fmovrsgz	%o3,	%f30,	%f0
	xorcc	%o4,	0x156B,	%l3
	movrlez	%i3,	0x1F5,	%g1
	umul	%i1,	%o2,	%l4
	prefetch	[%l7 + 0x60],	 0x1
	std	%f12,	[%l7 + 0x50]
	movgu	%xcc,	%o1,	%g6
	edge32l	%i4,	%o5,	%l6
	smulcc	%g2,	0x0C83,	%g5
	orn	%l2,	0x1AFE,	%o7
	set	0x24, %o5
	ldsha	[%l7 + %o5] 0x19,	%l0
	movl	%xcc,	%g7,	%i6
	fsrc1s	%f28,	%f18
	array16	%g4,	%o6,	%i2
	tpos	%xcc,	0x2
	fbule,a	%fcc3,	loop_587
	alignaddr	%g3,	%i0,	%l5
	fmovrsgez	%l1,	%f16,	%f24
	edge16ln	%i7,	%i5,	%o0
loop_587:
	nop
	set	0x54, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o4
	bpos,pt	%icc,	loop_588
	tcc	%icc,	0x2
	xnorcc	%l3,	%i3,	%g1
	udivx	%o3,	0x1AE1,	%o2
loop_588:
	movneg	%xcc,	%i1,	%l4
	sub	%o1,	%g6,	%o5
	subc	%i4,	0x1851,	%g2
	fbug	%fcc1,	loop_589
	udivcc	%l6,	0x001A,	%l2
	tcc	%icc,	0x0
	sllx	%o7,	%l0,	%g7
loop_589:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%g5
	fmovsneg	%icc,	%f4,	%f24
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%o6
	movg	%icc,	%g4,	%g3
	sra	%i0,	0x02,	%l5
	subc	%l1,	0x0757,	%i7
	ld	[%l7 + 0x7C],	%f8
	fbu,a	%fcc1,	loop_590
	tge	%icc,	0x3
	sll	%i2,	0x16,	%o0
	set	0x48, %i5
	ldswa	[%l7 + %i5] 0x15,	%i5
loop_590:
	fbug	%fcc0,	loop_591
	fnor	%f14,	%f0,	%f30
	sth	%o4,	[%l7 + 0x48]
	or	%l3,	0x02D8,	%i3
loop_591:
	fbge,a	%fcc3,	loop_592
	sdivx	%o3,	0x0568,	%g1
	edge32ln	%i1,	%o2,	%o1
	mulscc	%g6,	0x156A,	%o5
loop_592:
	fand	%f12,	%f2,	%f22
	sllx	%i4,	%g2,	%l4
	fbule	%fcc1,	loop_593
	fbu,a	%fcc2,	loop_594
	orn	%l2,	0x1C1E,	%l6
	smulcc	%l0,	0x1560,	%o7
loop_593:
	taddcctv	%g7,	0x067C,	%g5
loop_594:
	and	%o6,	0x098C,	%i6
	sethi	0x1EE2,	%g4
	edge32ln	%g3,	%l5,	%l1
	tsubcc	%i0,	0x0A3F,	%i2
	movg	%icc,	%o0,	%i7
	movleu	%xcc,	%o4,	%i5
	tg	%xcc,	0x5
	tneg	%xcc,	0x3
	xor	%i3,	%o3,	%g1
	udiv	%i1,	0x0160,	%l3
	tcc	%xcc,	0x3
	set	0x72, %o0
	stba	%o1,	[%l7 + %o0] 0x19
	set	0x14, %o2
	lduwa	[%l7 + %o2] 0x11,	%o2
	andn	%g6,	0x1CB8,	%o5
	fbl,a	%fcc3,	loop_595
	sllx	%i4,	0x00,	%g2
	mova	%icc,	%l4,	%l2
	fmovrdgz	%l6,	%f20,	%f6
loop_595:
	fmovrsne	%o7,	%f3,	%f5
	fornot2	%f22,	%f14,	%f20
	fmovsneg	%xcc,	%f2,	%f1
	edge16	%g7,	%l0,	%g5
	ldd	[%l7 + 0x20],	%f4
	fbu	%fcc1,	loop_596
	taddcc	%o6,	0x1F01,	%g4
	ble,a,pn	%icc,	loop_597
	subcc	%g3,	%l5,	%l1
loop_596:
	movre	%i6,	0x1A3,	%i2
	fpadd32	%f14,	%f30,	%f4
loop_597:
	tpos	%icc,	0x2
	fpackfix	%f2,	%f21
	and	%i0,	0x14C8,	%i7
	nop
	set	0x48, %o1
	lduw	[%l7 + %o1],	%o4
	tg	%icc,	0x7
	tg	%icc,	0x2
	umulcc	%o0,	0x1793,	%i5
	mulx	%o3,	0x0461,	%i3
	fmovrdlz	%g1,	%f8,	%f28
	edge32ln	%l3,	%o1,	%o2
	movg	%xcc,	%i1,	%g6
	movrgez	%o5,	%g2,	%i4
	ldstub	[%l7 + 0x78],	%l4
	tpos	%icc,	0x1
	bg,a	%icc,	loop_598
	fmovscc	%xcc,	%f7,	%f17
	tpos	%icc,	0x4
	movrgez	%l2,	0x167,	%l6
loop_598:
	array16	%o7,	%l0,	%g5
	call	loop_599
	array32	%g7,	%g4,	%o6
	movpos	%icc,	%g3,	%l5
	array16	%l1,	%i6,	%i2
loop_599:
	te	%xcc,	0x1
	andncc	%i0,	%o4,	%o0
	fmul8ulx16	%f8,	%f30,	%f6
	flush	%l7 + 0x44
	fxor	%f28,	%f14,	%f20
	movgu	%icc,	%i5,	%o3
	fbu	%fcc0,	loop_600
	add	%i7,	%g1,	%i3
	fxnor	%f20,	%f12,	%f22
	fbue	%fcc0,	loop_601
loop_600:
	nop
	fitos	%f11,	%f27
	movl	%icc,	%o1,	%o2
	array8	%i1,	%g6,	%o5
loop_601:
	fmovrse	%l3,	%f22,	%f12
	movrlez	%i4,	%g2,	%l2
	fmovrslz	%l6,	%f22,	%f22
	fmul8x16au	%f31,	%f27,	%f20
	taddcctv	%l4,	%o7,	%g5
	edge8l	%g7,	%l0,	%o6
	brlez,a	%g4,	loop_602
	array16	%l5,	%l1,	%i6
	fnot1s	%f3,	%f1
	fpsub16	%f0,	%f4,	%f26
loop_602:
	fsrc1	%f10,	%f12
	fcmpgt32	%f12,	%f6,	%i2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%o4
	addcc	%o0,	0x1619,	%i5
	movpos	%xcc,	%o3,	%g3
	bge	loop_603
	nop
	fitod	%f2,	%f14
	fdtoi	%f14,	%f13
	fmovsne	%icc,	%f7,	%f2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%g1
loop_603:
	orncc	%o1,	%o2,	%i1
	subcc	%i3,	%o5,	%g6
	fmovrsgz	%l3,	%f27,	%f10
	wr	%g0,	0x88,	%asi
	stha	%i4,	[%l7 + 0x2E] %asi
	fbuge,a	%fcc2,	loop_604
	fmovsl	%xcc,	%f4,	%f7
	tsubcc	%g2,	%l2,	%l6
	tleu	%icc,	0x4
loop_604:
	nop
	set	0x72, %i7
	ldsha	[%l7 + %i7] 0x10,	%l4
	umul	%g5,	0x0819,	%o7
	addccc	%g7,	0x05CC,	%o6
	srax	%l0,	%l5,	%g4
	edge16ln	%i6,	%l1,	%i2
	tsubcctv	%i0,	0x10A5,	%o4
	xnor	%i5,	0x1EDC,	%o0
	movle	%xcc,	%g3,	%o3
	ld	[%l7 + 0x54],	%f16
	fbul,a	%fcc2,	loop_605
	add	%i7,	0x147F,	%g1
	fblg,a	%fcc1,	loop_606
	andcc	%o2,	0x0FA1,	%o1
loop_605:
	edge32l	%i1,	%i3,	%o5
	movcc	%xcc,	%l3,	%g6
loop_606:
	or	%i4,	%l2,	%l6
	fmul8ulx16	%f14,	%f12,	%f28
	udivx	%l4,	0x145B,	%g5
	fmovdgu	%icc,	%f9,	%f30
	fpsub16s	%f12,	%f16,	%f8
	tn	%icc,	0x6
	orcc	%o7,	%g7,	%g2
	tneg	%icc,	0x0
	edge16	%l0,	%l5,	%o6
	nop
	setx	0x94E92661376D78BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xBA7DF4A9D63E07B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f18,	%f26
	sethi	0x05DB,	%g4
	fmovrse	%l1,	%f24,	%f3
	fmovdgu	%icc,	%f19,	%f7
	nop
	setx	0xD89E0D57A1D935B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x8CFF750A485DDA7B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f16,	%f20
	ta	%xcc,	0x4
	edge16l	%i2,	%i6,	%i0
	mulscc	%i5,	%o0,	%g3
	tl	%icc,	0x6
	edge32	%o3,	%i7,	%g1
	umulcc	%o2,	%o4,	%o1
	fmovsne	%icc,	%f21,	%f24
	fmovdpos	%xcc,	%f24,	%f6
	bcs	%xcc,	loop_607
	edge8	%i1,	%i3,	%o5
	srl	%l3,	0x14,	%i4
	fmovrsgz	%g6,	%f24,	%f15
loop_607:
	movrgez	%l2,	%l4,	%g5
	lduw	[%l7 + 0x4C],	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x11,	%o7,	%g2
	edge8ln	%l0,	%l5,	%o6
	fbug,a	%fcc1,	loop_608
	faligndata	%f0,	%f4,	%f16
	alignaddrl	%g4,	%l1,	%g7
	add	%i6,	%i2,	%i5
loop_608:
	xorcc	%o0,	0x1B2B,	%g3
	tpos	%icc,	0x0
	add	%o3,	%i7,	%i0
	edge32n	%o2,	%g1,	%o1
	mova	%icc,	%o4,	%i3
	tleu	%xcc,	0x2
	movcc	%xcc,	%i1,	%l3
	fnot1s	%f24,	%f3
	movleu	%xcc,	%o5,	%g6
	srl	%l2,	%i4,	%l4
	movneg	%xcc,	%g5,	%l6
	wr	%g0,	0x20,	%asi
	stxa	%g2,	[%g0 + 0x38] %asi
	udiv	%o7,	0x0CDF,	%l5
	add	%l0,	%o6,	%l1
	subcc	%g7,	%i6,	%i2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x38] %asi,	%i5
	ldd	[%l7 + 0x20],	%o0
	fmovsgu	%icc,	%f27,	%f29
	fmovsle	%icc,	%f10,	%f16
	sth	%g3,	[%l7 + 0x2E]
	movvc	%xcc,	%g4,	%o3
	fba	%fcc3,	loop_609
	orn	%i7,	%o2,	%g1
	mulx	%i0,	%o1,	%o4
	fmovdge	%xcc,	%f31,	%f27
loop_609:
	andn	%i3,	%i1,	%o5
	fsrc1	%f14,	%f8
	brlz	%g6,	loop_610
	movgu	%xcc,	%l3,	%i4
	addcc	%l2,	%g5,	%l6
	movgu	%xcc,	%g2,	%o7
loop_610:
	move	%xcc,	%l4,	%l5
	fmovdneg	%xcc,	%f3,	%f21
	sdivx	%o6,	0x14AF,	%l0
	bn	%xcc,	loop_611
	ldsh	[%l7 + 0x40],	%l1
	fmovrdgz	%i6,	%f26,	%f6
	movrgz	%i2,	%i5,	%o0
loop_611:
	array32	%g7,	%g4,	%g3
	edge16	%i7,	%o2,	%g1
	srax	%i0,	%o3,	%o4
	edge32ln	%o1,	%i3,	%i1
	orn	%o5,	0x0373,	%g6
	fxnor	%f16,	%f20,	%f0
	edge8ln	%i4,	%l2,	%g5
	movn	%xcc,	%l3,	%l6
	fmovsle	%icc,	%f10,	%f11
	array16	%o7,	%g2,	%l4
	tcc	%xcc,	0x0
	fmovdne	%icc,	%f14,	%f9
	xnor	%o6,	%l5,	%l1
	fbe,a	%fcc3,	loop_612
	fbg,a	%fcc2,	loop_613
	andn	%i6,	0x1C7A,	%i2
	edge16n	%i5,	%o0,	%l0
loop_612:
	te	%xcc,	0x0
loop_613:
	edge32ln	%g4,	%g3,	%i7
	fmovsl	%xcc,	%f8,	%f18
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
	fornot2	%f22,	%f30,	%f30
	fpsub16s	%f6,	%f28,	%f1
	array16	%g7,	%g1,	%o3
	movrgez	%o4,	0x3FA,	%i0
	pdist	%f24,	%f6,	%f4
	popc	0x1797,	%o1
	movrgez	%i3,	%i1,	%o5
	alignaddrl	%g6,	%l2,	%g5
	sdivcc	%l3,	0x1AF3,	%i4
	movleu	%icc,	%l6,	%o7
	andcc	%l4,	%o6,	%g2
	nop
	setx	0xD264E478AB361ACF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA0E4F7B26AEE2121,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f4,	%f8
	mova	%icc,	%l5,	%i6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	movcs	%icc,	%i5,	%o0
	alignaddr	%i2,	%l0,	%g3
	fmovdvs	%icc,	%f19,	%f4
	fxnor	%f18,	%f6,	%f28
	tleu	%icc,	0x7
	movvc	%icc,	%g4,	%i7
	brlz,a	%g7,	loop_614
	tsubcc	%g1,	%o2,	%o4
	fpsub16s	%f18,	%f20,	%f13
	edge8ln	%i0,	%o1,	%o3
loop_614:
	bn	%xcc,	loop_615
	andn	%i3,	%o5,	%g6
	edge16n	%i1,	%g5,	%l2
	bl,a,pn	%icc,	loop_616
loop_615:
	fmovrdne	%i4,	%f18,	%f14
	fbe,a	%fcc1,	loop_617
	movrne	%l6,	0x099,	%l3
loop_616:
	edge16ln	%o7,	%l4,	%o6
	set	0x6E, %i0
	stba	%g2,	[%l7 + %i0] 0x11
loop_617:
	sdivx	%i6,	0x0B53,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f29,	%f0,	%f2
	fpsub16	%f6,	%f26,	%f4
	movrgz	%i5,	%l1,	%i2
	fornot1s	%f12,	%f27,	%f19
	call	loop_618
	bleu,pt	%xcc,	loop_619
	nop
	set	0x3C, %g4
	stb	%o0,	[%l7 + %g4]
	ldx	[%l7 + 0x48],	%g3
loop_618:
	movle	%icc,	%g4,	%i7
loop_619:
	ta	%xcc,	0x3
	st	%f22,	[%l7 + 0x20]
	movneg	%icc,	%l0,	%g1
	orcc	%o2,	%o4,	%g7
	te	%icc,	0x0
	nop
	setx	loop_620,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%o1,	0x16D5,	%o3
	std	%f28,	[%l7 + 0x08]
	fbn,a	%fcc0,	loop_621
loop_620:
	alignaddr	%i0,	%i3,	%o5
	fbug,a	%fcc2,	loop_622
	xorcc	%g6,	0x15BB,	%i1
loop_621:
	tcs	%icc,	0x0
	addcc	%g5,	0x1148,	%l2
loop_622:
	movcs	%xcc,	%i4,	%l6
	ble	loop_623
	movre	%o7,	%l3,	%l4
	fpackfix	%f8,	%f22
	fbo,a	%fcc0,	loop_624
loop_623:
	movgu	%icc,	%o6,	%g2
	orncc	%l5,	%i5,	%i6
	fmovde	%xcc,	%f25,	%f26
loop_624:
	array32	%l1,	%i2,	%o0
	tge	%icc,	0x5
	movvs	%xcc,	%g4,	%i7
	umulcc	%g3,	%l0,	%g1
	taddcctv	%o4,	%g7,	%o1
	edge32	%o2,	%i0,	%i3
	movn	%xcc,	%o3,	%g6
	bge,a,pt	%xcc,	loop_625
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f30
	fxtod	%f30,	%f24
	ble,a	loop_626
	sub	%i1,	%g5,	%l2
loop_625:
	tg	%xcc,	0x4
	fandnot2s	%f4,	%f30,	%f10
loop_626:
	edge16ln	%o5,	%l6,	%o7
	popc	0x1458,	%i4
	set	0x74, %o3
	sta	%f6,	[%l7 + %o3] 0x10
	umulcc	%l3,	%o6,	%g2
	edge8n	%l5,	%i5,	%l4
	tg	%icc,	0x6
	nop
	fitos	%f17,	%f4
	edge16	%l1,	%i6,	%i2
	fpack16	%f0,	%f20
	tvc	%xcc,	0x1
	fmovdg	%xcc,	%f23,	%f22
	mova	%xcc,	%g4,	%i7
	tne	%xcc,	0x5
	fbn,a	%fcc2,	loop_627
	movcs	%xcc,	%g3,	%l0
	xor	%g1,	%o4,	%o0
	and	%g7,	%o1,	%o2
loop_627:
	fxnors	%f18,	%f30,	%f23
	lduh	[%l7 + 0x3C],	%i3
	edge8n	%o3,	%g6,	%i0
	mulscc	%i1,	0x0289,	%g5
	fbul	%fcc1,	loop_628
	fexpand	%f25,	%f10
	fbe,a	%fcc3,	loop_629
	fmovsgu	%icc,	%f9,	%f9
loop_628:
	edge32n	%o5,	%l2,	%l6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o7
loop_629:
	fbne,a	%fcc2,	loop_630
	edge32	%i4,	%l3,	%g2
	fmovdgu	%icc,	%f11,	%f10
	tleu	%icc,	0x1
loop_630:
	fmul8sux16	%f0,	%f12,	%f8
	movcs	%xcc,	%l5,	%o6
	set	0x64, %o7
	lda	[%l7 + %o7] 0x14,	%f18
	edge8n	%l4,	%l1,	%i6
	sth	%i5,	[%l7 + 0x74]
	movg	%icc,	%g4,	%i2
	array16	%i7,	%l0,	%g1
	orncc	%o4,	%g3,	%g7
	brlz,a	%o0,	loop_631
	ldub	[%l7 + 0x20],	%o2
	for	%f14,	%f22,	%f4
	andn	%o1,	%o3,	%i3
loop_631:
	fblg	%fcc3,	loop_632
	ldub	[%l7 + 0x08],	%i0
	sth	%i1,	[%l7 + 0x38]
	fmovdl	%xcc,	%f30,	%f14
loop_632:
	fabss	%f12,	%f19
	taddcc	%g5,	0x1259,	%o5
	brz,a	%g6,	loop_633
	sethi	0x185D,	%l6
	tg	%xcc,	0x1
	tg	%xcc,	0x2
loop_633:
	fmovdvs	%xcc,	%f19,	%f9
	edge16n	%l2,	%o7,	%i4
	ldsw	[%l7 + 0x60],	%g2
	nop
	fitos	%f12,	%f7
	fstox	%f7,	%f10
	fxtos	%f10,	%f9
	movre	%l3,	%l5,	%l4
	brnz,a	%l1,	loop_634
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f12
	brlz	%i6,	loop_635
	nop
	setx	0x9E1FB8C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x53890B74,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f22,	%f25
loop_634:
	sdiv	%o6,	0x16C1,	%g4
	tleu	%xcc,	0x4
loop_635:
	brz,a	%i2,	loop_636
	movneg	%xcc,	%i7,	%l0
	subccc	%i5,	%g1,	%o4
	addc	%g3,	0x15D3,	%g7
loop_636:
	fmul8x16au	%f2,	%f9,	%f18
	mulx	%o0,	%o1,	%o2
	movg	%icc,	%o3,	%i0
	edge32n	%i1,	%i3,	%o5
	fsrc1	%f2,	%f2
	fnot1s	%f5,	%f22
	movcc	%icc,	%g5,	%g6
	be,a,pn	%xcc,	loop_637
	fnot1s	%f19,	%f18
	flush	%l7 + 0x38
	edge8n	%l6,	%l2,	%i4
loop_637:
	sllx	%g2,	0x0D,	%l3
	bleu,pn	%xcc,	loop_638
	fmovdcs	%icc,	%f2,	%f10
	srl	%l5,	0x10,	%o7
	fnor	%f30,	%f2,	%f16
loop_638:
	ta	%xcc,	0x0
	subc	%l1,	%i6,	%l4
	sdiv	%g4,	0x002B,	%i2
	fbuge,a	%fcc2,	loop_639
	fxor	%f10,	%f8,	%f22
	te	%xcc,	0x5
	tleu	%icc,	0x4
loop_639:
	edge16	%i7,	%l0,	%o6
	movne	%icc,	%i5,	%o4
	fbule,a	%fcc2,	loop_640
	stx	%g3,	[%l7 + 0x58]
	fcmpeq32	%f20,	%f14,	%g7
	movvs	%xcc,	%g1,	%o1
loop_640:
	nop
	wr	%g0,	0x18,	%asi
	stba	%o0,	[%l7 + 0x68] %asi
	fmovse	%icc,	%f5,	%f18
	movgu	%icc,	%o3,	%o2
	fbg	%fcc1,	loop_641
	movrlez	%i0,	%i3,	%o5
	andcc	%i1,	0x1186,	%g5
	movvc	%xcc,	%l6,	%g6
loop_641:
	fmovsle	%icc,	%f30,	%f18
	andn	%l2,	0x0EC8,	%i4
	ldsh	[%l7 + 0x4C],	%g2
	mulx	%l3,	0x15F0,	%o7
	fnot1	%f16,	%f2
	tneg	%xcc,	0x3
	call	loop_642
	mulx	%l1,	%i6,	%l5
	udivcc	%l4,	0x028D,	%i2
	tvc	%icc,	0x1
loop_642:
	fpsub16s	%f30,	%f15,	%f27
	subccc	%g4,	0x0C3C,	%i7
	movgu	%xcc,	%l0,	%o6
	fble,a	%fcc2,	loop_643
	movvs	%xcc,	%o4,	%g3
	mova	%icc,	%i5,	%g7
	umul	%o1,	%o0,	%o3
loop_643:
	alignaddrl	%g1,	%o2,	%i3
	fmovsle	%icc,	%f26,	%f6
	edge8n	%i0,	%o5,	%i1
	nop
	setx	0xE4628C340A59AA90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f30
	add	%g5,	%g6,	%l2
	fsrc2s	%f24,	%f28
	fmovdne	%xcc,	%f20,	%f6
	tcc	%xcc,	0x6
	wr	%g0,	0x27,	%asi
	stxa	%i4,	[%l7 + 0x30] %asi
	membar	#Sync
	orn	%g2,	%l3,	%l6
	tcc	%xcc,	0x4
	edge8n	%l1,	%i6,	%o7
	fmovsleu	%icc,	%f31,	%f11
	addcc	%l4,	%i2,	%g4
	ta	%icc,	0x5
	and	%i7,	0x11D9,	%l5
	ldstub	[%l7 + 0x41],	%o6
	nop
	setx	loop_644,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcs	%xcc,	loop_645
	fnor	%f0,	%f10,	%f20
	tcs	%icc,	0x4
loop_644:
	tcs	%xcc,	0x2
loop_645:
	fcmpeq16	%f30,	%f18,	%o4
	ldx	[%l7 + 0x20],	%l0
	flush	%l7 + 0x78
	set	0x0C, %g6
	lduwa	[%l7 + %g6] 0x89,	%i5
	tneg	%icc,	0x5
	fsrc1	%f16,	%f16
	edge8ln	%g7,	%g3,	%o0
	fandnot1s	%f31,	%f9,	%f16
	fmovs	%f1,	%f18
	smul	%o3,	%g1,	%o1
	bleu,a,pn	%icc,	loop_646
	xorcc	%o2,	0x00AC,	%i3
	ldd	[%l7 + 0x10],	%f0
	ldd	[%l7 + 0x10],	%i0
loop_646:
	nop
	fitos	%f7,	%f17
	fstox	%f17,	%f14
	fxtos	%f14,	%f21
	smul	%o5,	%i1,	%g6
	addc	%l2,	%g5,	%g2
	andcc	%l3,	%i4,	%l6
	tl	%xcc,	0x2
	ldd	[%l7 + 0x50],	%f28
	fornot1s	%f25,	%f24,	%f2
	set	0x14, %i2
	sta	%f9,	[%l7 + %i2] 0x0c
	fand	%f0,	%f4,	%f2
	bleu	%xcc,	loop_647
	fbn	%fcc3,	loop_648
	fmovsle	%xcc,	%f27,	%f24
	fbe	%fcc1,	loop_649
loop_647:
	subc	%l1,	0x0907,	%o7
loop_648:
	fmovde	%xcc,	%f24,	%f19
	fmovrdgz	%i6,	%f20,	%f24
loop_649:
	nop
	setx loop_650, %l0, %l1
	jmpl %l1, %l4
	lduh	[%l7 + 0x76],	%i2
	call	loop_651
	movrgez	%g4,	0x056,	%i7
loop_650:
	andncc	%o6,	%l5,	%o4
	ba,a,pt	%icc,	loop_652
loop_651:
	stw	%i5,	[%l7 + 0x4C]
	fands	%f7,	%f11,	%f11
	set	0x72, %g5
	ldsha	[%l7 + %g5] 0x89,	%l0
loop_652:
	movre	%g3,	0x0A0,	%o0
	tge	%icc,	0x3
	edge8ln	%o3,	%g7,	%o1
	nop
	fitos	%f4,	%f23
	fstox	%f23,	%f26
	fxtos	%f26,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g1,	%i3,	%o2
	ld	[%l7 + 0x28],	%f5
	fpsub32	%f16,	%f6,	%f24
	nop
	setx	loop_653,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	pdist	%f8,	%f30,	%f8
	smul	%o5,	0x0950,	%i0
	xor	%g6,	%l2,	%g5
loop_653:
	edge32ln	%i1,	%l3,	%g2
	movpos	%xcc,	%i4,	%l6
	tsubcctv	%l1,	%o7,	%l4
	tleu	%xcc,	0x6
	nop
	setx loop_654, %l0, %l1
	jmpl %l1, %i6
	tl	%xcc,	0x3
	tvc	%xcc,	0x3
	umulcc	%g4,	%i2,	%i7
loop_654:
	lduh	[%l7 + 0x1A],	%l5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o6
	srlx	%o4,	%i5,	%l0
	fmovsleu	%icc,	%f7,	%f8
	subcc	%o0,	%o3,	%g3
	brnz,a	%g7,	loop_655
	tsubcctv	%g1,	%i3,	%o2
	movre	%o5,	0x002,	%i0
	tge	%icc,	0x6
loop_655:
	tn	%xcc,	0x1
	fba	%fcc2,	loop_656
	ld	[%l7 + 0x44],	%f2
	edge16l	%g6,	%o1,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_656:
	sethi	0x1E90,	%i1
	fnot1	%f2,	%f18
	tvc	%xcc,	0x5
	fors	%f27,	%f12,	%f0
	addccc	%l2,	0x08F1,	%l3
	tle	%icc,	0x4
	fnot1	%f30,	%f22
	subc	%i4,	%l6,	%l1
	tvs	%icc,	0x7
	fpadd32	%f28,	%f20,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f29,	%f8
	set	0x60, %i1
	lduwa	[%l7 + %i1] 0x14,	%g2
	tge	%icc,	0x5
	fbue	%fcc3,	loop_657
	fmovdn	%xcc,	%f10,	%f2
	tgu	%xcc,	0x0
	flush	%l7 + 0x70
loop_657:
	andcc	%l4,	0x1E4F,	%o7
	fandnot2s	%f2,	%f17,	%f3
	movpos	%xcc,	%g4,	%i2
	andcc	%i7,	%l5,	%i6
	ldd	[%l7 + 0x60],	%o4
	andn	%i5,	0x162F,	%l0
	tl	%xcc,	0x5
	mulx	%o6,	0x189F,	%o0
	edge16l	%g3,	%o3,	%g7
	or	%i3,	%g1,	%o2
	bn,a	loop_658
	ldsb	[%l7 + 0x3D],	%i0
	fbge	%fcc1,	loop_659
	nop
	setx	loop_660,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_658:
	sra	%o5,	0x1F,	%g6
	smul	%g5,	0x1356,	%i1
loop_659:
	ble,a	%icc,	loop_661
loop_660:
	sir	0x13C7
	fone	%f28
	fbge,a	%fcc0,	loop_662
loop_661:
	fbu,a	%fcc3,	loop_663
	fmovrsne	%o1,	%f28,	%f20
	stw	%l3,	[%l7 + 0x10]
loop_662:
	edge16l	%i4,	%l2,	%l1
loop_663:
	fmovrslez	%l6,	%f21,	%f30
	movg	%xcc,	%g2,	%o7
	ldsw	[%l7 + 0x5C],	%g4
	edge8l	%i2,	%i7,	%l5
	tleu	%xcc,	0x5
	andcc	%i6,	0x06A8,	%o4
	movgu	%icc,	%i5,	%l4
	std	%f16,	[%l7 + 0x40]
	subc	%o6,	%o0,	%l0
	movgu	%icc,	%o3,	%g3
	fcmpeq16	%f28,	%f12,	%g7
	edge16l	%i3,	%g1,	%i0
	movpos	%xcc,	%o5,	%o2
	edge32	%g5,	%g6,	%i1
	sub	%l3,	0x1DA3,	%o1
	movn	%icc,	%l2,	%i4
	orn	%l6,	0x1474,	%l1
	ldsb	[%l7 + 0x5F],	%o7
	movcs	%xcc,	%g2,	%g4
	sdiv	%i7,	0x07FE,	%l5
	fmovsgu	%xcc,	%f29,	%f27
	fmovd	%f0,	%f16
	fpadd16s	%f18,	%f31,	%f22
	tvc	%icc,	0x3
	mulscc	%i6,	0x113F,	%i2
	set	0x78, %g7
	stwa	%i5,	[%l7 + %g7] 0x11
	smulcc	%o4,	0x0583,	%o6
	andcc	%o0,	0x162E,	%l4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x1E] %asi,	%l0
	ldsh	[%l7 + 0x56],	%g3
	movge	%icc,	%o3,	%i3
	fbo,a	%fcc2,	loop_664
	fzeros	%f13
	mova	%icc,	%g7,	%g1
	array32	%o5,	%i0,	%g5
loop_664:
	array8	%g6,	%i1,	%l3
	andn	%o1,	%o2,	%i4
	fandnot1	%f0,	%f10,	%f30
	tl	%icc,	0x1
	brgz,a	%l2,	loop_665
	array16	%l6,	%l1,	%o7
	edge32n	%g2,	%i7,	%g4
	fones	%f3
loop_665:
	movrlez	%i6,	0x0E8,	%i2
	tneg	%xcc,	0x7
	or	%i5,	%o4,	%l5
	nop
	setx	0x54D16B35,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xE2CD509E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f4,	%f8
	sllx	%o6,	%o0,	%l4
	fmovdge	%xcc,	%f2,	%f16
	bne,pn	%icc,	loop_666
	tne	%xcc,	0x3
	udivx	%g3,	0x1061,	%o3
	tpos	%icc,	0x7
loop_666:
	tvc	%icc,	0x3
	mulx	%l0,	0x08D5,	%i3
	movvc	%icc,	%g7,	%g1
	subc	%o5,	0x0B61,	%g5
	fmovrde	%g6,	%f24,	%f16
	fcmple32	%f30,	%f4,	%i0
	movrgz	%i1,	0x37D,	%l3
	fbu	%fcc1,	loop_667
	stw	%o2,	[%l7 + 0x7C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f22,	%f16,	%f10
loop_667:
	tgu	%xcc,	0x0
	addcc	%o1,	%i4,	%l6
	tvc	%xcc,	0x7
	srlx	%l1,	0x08,	%o7
	set	0x4C, %l3
	lda	[%l7 + %l3] 0x04,	%f3
	movg	%icc,	%g2,	%l2
	te	%xcc,	0x3
	brlez,a	%i7,	loop_668
	fmovdn	%xcc,	%f10,	%f20
	edge8l	%g4,	%i2,	%i6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i5
loop_668:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l5,	%o4
	alignaddr	%o0,	%l4,	%o6
	wr	%g0,	0x27,	%asi
	stha	%g3,	[%l7 + 0x36] %asi
	membar	#Sync
	te	%xcc,	0x3
	edge32	%l0,	%o3,	%g7
	lduh	[%l7 + 0x7C],	%i3
	fexpand	%f19,	%f20
	udivcc	%o5,	0x0566,	%g5
	wr	%g0,	0x19,	%asi
	sta	%f16,	[%l7 + 0x70] %asi
	andn	%g6,	%i0,	%g1
	fnegs	%f25,	%f9
	wr	%g0,	0x5f,	%asi
	stxa	%l3,	[%g0 + 0x0] %asi
	fabss	%f28,	%f9
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x19,	%i1
	subc	%o1,	%i4,	%l6
	set	0x66, %g3
	lduha	[%l7 + %g3] 0x14,	%l1
	brgz,a	%o7,	loop_669
	andn	%o2,	0x1BCC,	%g2
	movl	%icc,	%l2,	%i7
	te	%xcc,	0x0
loop_669:
	fbne,a	%fcc0,	loop_670
	mulscc	%i2,	0x0BDE,	%i6
	tvc	%icc,	0x6
	udivcc	%i5,	0x08EC,	%g4
loop_670:
	brz	%o4,	loop_671
	sdiv	%o0,	0x17E6,	%l4
	fmovrdlez	%l5,	%f8,	%f18
	movcs	%xcc,	%o6,	%l0
loop_671:
	fmul8x16	%f5,	%f20,	%f12
	fmovrde	%o3,	%f30,	%f10
	movcs	%xcc,	%g7,	%i3
	ldsw	[%l7 + 0x24],	%o5
	tcs	%xcc,	0x7
	fba	%fcc1,	loop_672
	udivcc	%g3,	0x1E15,	%g5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
loop_672:
	movne	%icc,	%g6,	%l3
	xnor	%i1,	0x00B7,	%g1
	srl	%i4,	%o1,	%l1
	fcmpne16	%f22,	%f12,	%o7
	tl	%xcc,	0x1
	sdivx	%o2,	0x07C2,	%g2
	nop
	setx loop_673, %l0, %l1
	jmpl %l1, %l2
	bgu,pn	%xcc,	loop_674
	tvs	%icc,	0x1
	nop
	setx	0xF07D4E62,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
loop_673:
	nop
	setx	0x218D7E5E59EA2A91,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xC66453A410CAA8DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f20,	%f26
loop_674:
	te	%icc,	0x3
	tn	%xcc,	0x0
	nop
	fitod	%f6,	%f24
	fdtoi	%f24,	%f16
	movne	%icc,	%i7,	%l6
	tle	%xcc,	0x4
	stx	%i6,	[%l7 + 0x78]
	sll	%i5,	0x1B,	%i2
	array16	%g4,	%o4,	%l4
	movneg	%xcc,	%l5,	%o0
	fmovdneg	%icc,	%f18,	%f26
	edge16l	%o6,	%o3,	%l0
	sll	%g7,	%o5,	%g3
	nop
	setx	0x94A15F594531C112,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x653B7EC81A3B8C0A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f24,	%f30
	mulscc	%g5,	0x1D73,	%i3
	srax	%g6,	0x17,	%i0
	nop
	setx	0x81C54005,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x1A2A1150,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f0,	%f12
	fble	%fcc3,	loop_675
	sll	%i1,	%g1,	%i4
	fmul8x16al	%f11,	%f5,	%f26
	edge16l	%o1,	%l3,	%l1
loop_675:
	stb	%o7,	[%l7 + 0x6E]
	sdivx	%o2,	0x0495,	%l2
	fmovse	%xcc,	%f25,	%f0
	srl	%g2,	%l6,	%i7
	sdivx	%i6,	0x1DF3,	%i2
	tvc	%icc,	0x2
	edge16n	%i5,	%o4,	%g4
	tn	%icc,	0x6
	bgu,a,pt	%xcc,	loop_676
	bn,a,pt	%icc,	loop_677
	edge16	%l4,	%l5,	%o6
	movle	%xcc,	%o0,	%l0
loop_676:
	sethi	0x02E8,	%o3
loop_677:
	popc	0x17F1,	%g7
	movrlz	%o5,	0x06E,	%g5
	fsrc2	%f4,	%f6
	xorcc	%i3,	%g6,	%g3
	srax	%i1,	%i0,	%g1
	fbe	%fcc1,	loop_678
	tpos	%icc,	0x7
	fornot2s	%f30,	%f0,	%f18
	mulx	%o1,	0x120A,	%i4
loop_678:
	taddcctv	%l1,	%o7,	%o2
	sir	0x1AD1
	edge32	%l3,	%l2,	%l6
	sra	%g2,	%i7,	%i6
	movpos	%xcc,	%i2,	%i5
	tcs	%icc,	0x6
	set	0x72, %g1
	stba	%g4,	[%l7 + %g1] 0xe2
	membar	#Sync
	taddcc	%o4,	%l5,	%o6
	smul	%o0,	%l0,	%o3
	fmovs	%f4,	%f18
	nop
	setx	loop_679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x3A5B74E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x70CB1904,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f25,	%f9
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f4
	fxtos	%f4,	%f11
	edge8n	%l4,	%o5,	%g5
loop_679:
	bleu,a	%icc,	loop_680
	sdivcc	%i3,	0x0AA4,	%g6
	or	%g7,	%g3,	%i0
	swap	[%l7 + 0x28],	%i1
loop_680:
	addccc	%o1,	0x0C6E,	%i4
	fmovdvs	%icc,	%f27,	%f19
	movcc	%icc,	%l1,	%g1
	umul	%o2,	%l3,	%o7
	fmuld8ulx16	%f30,	%f7,	%f2
	alignaddr	%l6,	%g2,	%i7
	edge8ln	%l2,	%i6,	%i5
	fmuld8ulx16	%f31,	%f2,	%f6
	nop
	fitod	%f8,	%f22
	fdtos	%f22,	%f19
	alignaddrl	%g4,	%i2,	%l5
	brlz	%o6,	loop_681
	andcc	%o4,	%o0,	%l0
	fxnor	%f22,	%f8,	%f12
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f28
loop_681:
	movge	%xcc,	%l4,	%o3
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x18] %asi,	%o5
	tn	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f10,	%f11
	fmovd	%f2,	%f14
	stbar
	edge8	%g5,	%g6,	%g7
	fmovdcs	%icc,	%f16,	%f23
	movn	%xcc,	%i3,	%i0
	bvc,a	%icc,	loop_682
	bvs,a,pt	%xcc,	loop_683
	andcc	%i1,	%o1,	%g3
	fpsub32s	%f29,	%f3,	%f21
loop_682:
	fnegs	%f9,	%f1
loop_683:
	fmovdgu	%xcc,	%f0,	%f30
	bleu,a,pt	%xcc,	loop_684
	fmovse	%icc,	%f24,	%f17
	tle	%icc,	0x4
	brgz	%l1,	loop_685
loop_684:
	xor	%g1,	%o2,	%i4
	edge8n	%l3,	%l6,	%o7
	tleu	%icc,	0x3
loop_685:
	edge32	%i7,	%l2,	%i6
	sdiv	%g2,	0x1DF7,	%g4
	set	0x50, %l6
	sta	%f28,	[%l7 + %l6] 0x18
	srax	%i2,	0x1B,	%i5
	sllx	%l5,	0x1A,	%o4
	edge32l	%o0,	%l0,	%l4
	smulcc	%o6,	0x19C1,	%o3
	nop
	fitod	%f2,	%f6
	fdtos	%f6,	%f3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x34] %asi,	%o5
	movge	%icc,	%g5,	%g7
	fmovsl	%xcc,	%f15,	%f13
	move	%icc,	%i3,	%g6
	tvc	%xcc,	0x2
	fnot1s	%f8,	%f9
	sub	%i1,	0x0EBB,	%o1
	srax	%g3,	%i0,	%g1
	fnot1	%f22,	%f24
	addc	%l1,	0x03FB,	%i4
	subc	%o2,	0x0E1F,	%l3
	call	loop_686
	subcc	%o7,	%i7,	%l2
	movne	%xcc,	%i6,	%l6
	movg	%icc,	%g4,	%g2
loop_686:
	nop
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x20] %asi,	%i4
	fbn	%fcc1,	loop_687
	ldstub	[%l7 + 0x6E],	%i2
	or	%o4,	%l5,	%l0
	andcc	%l4,	0x07D6,	%o6
loop_687:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o0
	movgu	%xcc,	%o3,	%g5
	nop
	setx	0xFD04184F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x560724DD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f6,	%f8
	movne	%icc,	%g7,	%o5
	fxor	%f28,	%f22,	%f22
	ldstub	[%l7 + 0x68],	%i3
	udivcc	%i1,	0x18A9,	%o1
	movl	%xcc,	%g6,	%g3
	sir	0x0C69
	ldsb	[%l7 + 0x5A],	%g1
	orn	%i0,	0x0DF2,	%l1
	edge32ln	%o2,	%i4,	%l3
	tvs	%xcc,	0x0
	srlx	%o7,	%l2,	%i6
	addc	%l6,	0x03FB,	%g4
	fnands	%f1,	%f16,	%f7
	add	%i7,	0x1F57,	%i5
	tg	%xcc,	0x3
	sdivcc	%g2,	0x1C2B,	%o4
	fnot1	%f26,	%f2
	nop
	setx loop_688, %l0, %l1
	jmpl %l1, %i2
	bn	%xcc,	loop_689
	movvc	%xcc,	%l0,	%l5
	movcs	%xcc,	%o6,	%l4
loop_688:
	edge32l	%o0,	%g5,	%g7
loop_689:
	umul	%o5,	%o3,	%i1
	fmovscc	%xcc,	%f14,	%f4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%o1
	fbge	%fcc0,	loop_690
	bvs,pt	%icc,	loop_691
	fmuld8ulx16	%f21,	%f19,	%f28
	move	%icc,	%i3,	%g3
loop_690:
	ldsh	[%l7 + 0x44],	%g6
loop_691:
	nop
	setx	0x671F9748F036E559,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE73451A8DE9073B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f0,	%f6
	fxnors	%f24,	%f7,	%f10
	ldsb	[%l7 + 0x7F],	%i0
	tl	%icc,	0x2
	fornot2	%f0,	%f4,	%f24
	edge8n	%g1,	%o2,	%l1
	fmovrsgez	%l3,	%f18,	%f31
	fbuge	%fcc0,	loop_692
	tneg	%xcc,	0x6
	sdivcc	%o7,	0x1F90,	%i4
	fbge	%fcc3,	loop_693
loop_692:
	movrne	%l2,	0x0F0,	%i6
	andcc	%g4,	%i7,	%i5
	ldsw	[%l7 + 0x58],	%l6
loop_693:
	nop
	setx	0x3D2F43B58D71BFCA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xCD7A86421467FBFA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f30,	%f0
	bg,a,pn	%icc,	loop_694
	ldub	[%l7 + 0x13],	%g2
	edge8n	%i2,	%o4,	%l0
	fcmpeq32	%f0,	%f14,	%o6
loop_694:
	nop
	set	0x50, %i3
	lda	[%l7 + %i3] 0x15,	%f27
	andn	%l4,	0x07FA,	%o0
	set	0x4E, %l1
	ldsha	[%l7 + %l1] 0x04,	%l5
	array8	%g7,	%o5,	%o3
	orn	%g5,	0x06C8,	%o1
	edge32ln	%i3,	%g3,	%i1
	ta	%icc,	0x2
	fors	%f20,	%f6,	%f12
	ldstub	[%l7 + 0x47],	%g6
	ldub	[%l7 + 0x6A],	%i0
	sth	%o2,	[%l7 + 0x20]
	tne	%icc,	0x6
	xnor	%g1,	%l3,	%o7
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	udivcc	%l1,	0x0C1B,	%l2
	udiv	%i6,	0x0EDF,	%g4
	fbuge,a	%fcc3,	loop_695
	xnor	%i7,	0x1A53,	%i5
	subccc	%l6,	0x03B0,	%g2
	udiv	%i4,	0x1E07,	%i2
loop_695:
	nop
	set	0x44, %l5
	lduha	[%l7 + %l5] 0x88,	%o4
	std	%f20,	[%l7 + 0x20]
	fbug	%fcc1,	loop_696
	umul	%o6,	0x04DA,	%l0
	nop
	fitod	%f12,	%f4
	fdtox	%f4,	%f10
	set	0x63, %l2
	ldsba	[%l7 + %l2] 0x14,	%o0
loop_696:
	edge32ln	%l5,	%l4,	%o5
	alignaddrl	%o3,	%g7,	%o1
	sdiv	%g5,	0x0FBA,	%i3
	fbg	%fcc3,	loop_697
	fandnot1s	%f28,	%f11,	%f2
	movne	%icc,	%g3,	%g6
	fmovs	%f4,	%f21
loop_697:
	smul	%i1,	%i0,	%g1
	fexpand	%f21,	%f10
	tl	%xcc,	0x1
	ldx	[%l7 + 0x68],	%o2
	tsubcctv	%o7,	0x15D5,	%l3
	nop
	fitod	%f21,	%f16
	fmovdcc	%xcc,	%f17,	%f27
	sdiv	%l2,	0x1C35,	%i6
	fnor	%f30,	%f24,	%f2
	sub	%g4,	%i7,	%l1
	fmovrsne	%i5,	%f9,	%f26
	membar	0x68
	or	%g2,	0x0D9D,	%l6
	movpos	%xcc,	%i2,	%i4
	mulscc	%o4,	%l0,	%o6
	move	%xcc,	%o0,	%l5
	bg,a,pt	%icc,	loop_698
	movre	%o5,	%o3,	%g7
	edge32l	%l4,	%o1,	%i3
	tsubcctv	%g3,	0x1168,	%g6
loop_698:
	fcmpgt32	%f16,	%f16,	%i1
	ldub	[%l7 + 0x6D],	%i0
	nop
	setx	0xB2E598CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xAB2FB5E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f9,	%f8
	fnands	%f4,	%f15,	%f20
	xor	%g1,	0x0EF9,	%g5
	tsubcctv	%o7,	0x151D,	%o2
	ldsw	[%l7 + 0x50],	%l3
	set	0x29, %g2
	stba	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	bleu,a	%xcc,	loop_699
	edge32	%g4,	%i7,	%l1
	edge32l	%l2,	%g2,	%l6
	bl	loop_700
loop_699:
	fbue	%fcc3,	loop_701
	movrgez	%i5,	%i2,	%i4
	tvs	%icc,	0x6
loop_700:
	xnor	%l0,	%o6,	%o4
loop_701:
	smul	%o0,	0x013B,	%o5
	udivx	%o3,	0x0293,	%l5
	tcc	%xcc,	0x1
	fones	%f13
	fbule,a	%fcc2,	loop_702
	movrgez	%l4,	%g7,	%i3
	orn	%o1,	0x035A,	%g6
	sllx	%g3,	%i1,	%g1
loop_702:
	brz,a	%g5,	loop_703
	bneg,a,pt	%icc,	loop_704
	edge32n	%o7,	%i0,	%o2
	edge32	%l3,	%i6,	%g4
loop_703:
	tcs	%xcc,	0x2
loop_704:
	movre	%l1,	%l2,	%i7
	srlx	%g2,	0x12,	%i5
	fmovdcc	%icc,	%f22,	%f26
	tgu	%icc,	0x7
	andn	%l6,	0x18C5,	%i2
	movvs	%xcc,	%i4,	%l0
	movvc	%icc,	%o4,	%o0
	movvs	%xcc,	%o6,	%o3
	te	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l5
	movcc	%icc,	%o5,	%g7
	movpos	%xcc,	%i3,	%l4
	fmuld8sux16	%f29,	%f3,	%f20
	edge16ln	%g6,	%g3,	%i1
	fors	%f16,	%f24,	%f19
	tge	%xcc,	0x3
	and	%g1,	%o1,	%g5
	movrlz	%o7,	0x34A,	%o2
	fpadd16	%f22,	%f30,	%f22
	prefetch	[%l7 + 0x24],	 0x1
	edge8	%i0,	%l3,	%i6
	add	%l1,	%g4,	%i7
	stx	%l2,	[%l7 + 0x58]
	bneg,a	%icc,	loop_705
	xorcc	%g2,	%i5,	%i2
	fba,a	%fcc2,	loop_706
	nop
	setx	loop_707,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_705:
	fbug,a	%fcc2,	loop_708
	fpmerge	%f0,	%f28,	%f24
loop_706:
	bge,a,pn	%xcc,	loop_709
loop_707:
	subc	%i4,	%l6,	%o4
loop_708:
	fcmpeq16	%f18,	%f24,	%l0
	array32	%o0,	%o6,	%o3
loop_709:
	srl	%o5,	%g7,	%l5
	addc	%i3,	0x01B3,	%l4
	or	%g6,	%g3,	%i1
	tvc	%icc,	0x5
	subc	%g1,	%g5,	%o1
	xor	%o2,	0x0DEB,	%i0
	array8	%o7,	%i6,	%l3
	movpos	%icc,	%g4,	%i7
	nop
	setx loop_710, %l0, %l1
	jmpl %l1, %l2
	move	%xcc,	%g2,	%i5
	movne	%icc,	%l1,	%i4
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x28] %asi,	%l6
loop_710:
	tvs	%xcc,	0x6
	orncc	%i2,	%l0,	%o4
	movcs	%icc,	%o0,	%o3
	fbe	%fcc2,	loop_711
	andn	%o6,	0x0815,	%o5
	nop
	setx	0xD348775D90555921,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	mulscc	%l5,	0x032C,	%g7
loop_711:
	xnorcc	%i3,	%l4,	%g6
	bcc	loop_712
	ba,a,pt	%xcc,	loop_713
	fandnot1s	%f13,	%f21,	%f5
	stx	%g3,	[%l7 + 0x50]
loop_712:
	fpmerge	%f15,	%f12,	%f0
loop_713:
	tl	%xcc,	0x0
	flush	%l7 + 0x20
	movn	%xcc,	%g1,	%g5
	bgu	%icc,	loop_714
	movrgz	%o1,	0x043,	%i1
	sdivcc	%o2,	0x100C,	%i0
	brnz	%i6,	loop_715
loop_714:
	movrlz	%o7,	%g4,	%i7
	addccc	%l3,	0x0660,	%l2
	srax	%i5,	%g2,	%l1
loop_715:
	mulscc	%l6,	%i2,	%i4
	movrgez	%o4,	%o0,	%o3
	fmovdn	%xcc,	%f23,	%f22
	srax	%o6,	0x17,	%o5
	nop
	setx	0x0215E7774D8DFCC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xD6D73EAE1F13579F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f18,	%f4
	movge	%xcc,	%l5,	%l0
	tcs	%xcc,	0x6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x10,	%g7,	%l4
	movvc	%icc,	%i3,	%g6
	edge8l	%g3,	%g5,	%g1
	fornot1	%f30,	%f10,	%f0
	array16	%o1,	%o2,	%i1
	udiv	%i0,	0x08D5,	%i6
	movrlez	%o7,	0x081,	%i7
	ldsb	[%l7 + 0x39],	%g4
	edge32l	%l3,	%l2,	%i5
	ld	[%l7 + 0x68],	%f5
	fbne	%fcc2,	loop_716
	movpos	%icc,	%g2,	%l6
	fmovrdgz	%i2,	%f10,	%f12
	tgu	%icc,	0x1
loop_716:
	movg	%icc,	%i4,	%o4
	wr	%g0,	0x88,	%asi
	stwa	%l1,	[%l7 + 0x50] %asi
	movrgez	%o3,	%o6,	%o0
	fmovsg	%icc,	%f22,	%f24
	array16	%o5,	%l5,	%l0
	set	0x14, %o6
	lda	[%l7 + %o6] 0x0c,	%f30
	fbuge,a	%fcc2,	loop_717
	be	loop_718
	tgu	%xcc,	0x0
	bvc,a	%icc,	loop_719
loop_717:
	popc	0x1B9E,	%g7
loop_718:
	movneg	%xcc,	%l4,	%g6
	fmul8ulx16	%f14,	%f10,	%f22
loop_719:
	tle	%xcc,	0x1
	sra	%i3,	%g3,	%g1
	fnors	%f13,	%f22,	%f10
	brz	%o1,	loop_720
	bleu,a	%xcc,	loop_721
	nop
	setx	0x140061542058815D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x1822BDF350D5881B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f4,	%f6
	bvc,a	%xcc,	loop_722
loop_720:
	or	%o2,	%i1,	%i0
loop_721:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%g5
loop_722:
	fmovrdlez	%o7,	%f4,	%f14
	fmovscc	%xcc,	%f8,	%f8
	set	0x4C, %i6
	stwa	%i7,	[%l7 + %i6] 0x89
	fmovdneg	%icc,	%f14,	%f7
	sub	%g4,	%l3,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l2,	%i5,	%l6
	movle	%icc,	%i2,	%i4
	fsrc1	%f14,	%f28
	tcs	%icc,	0x7
	srax	%o4,	%l1,	%g2
	fbe,a	%fcc3,	loop_723
	movre	%o3,	%o6,	%o5
	alignaddr	%l5,	%l0,	%o0
	fbu	%fcc0,	loop_724
loop_723:
	fmul8x16al	%f29,	%f12,	%f24
	tleu	%icc,	0x5
	edge8	%g7,	%g6,	%i3
loop_724:
	tn	%icc,	0x5
	tneg	%icc,	0x0
	smulcc	%l4,	%g3,	%o1
	fbne	%fcc3,	loop_725
	tsubcctv	%g1,	%o2,	%i1
	movge	%xcc,	%g5,	%i0
	array16	%o7,	%g4,	%l3
loop_725:
	mulscc	%i6,	%i7,	%i5
	array32	%l2,	%l6,	%i2
	tsubcctv	%i4,	%l1,	%g2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o3
	edge8ln	%o6,	%o5,	%l5
	xor	%o4,	0x0AA5,	%o0
	edge16	%l0,	%g6,	%g7
	tneg	%icc,	0x2
	subc	%i3,	%l4,	%g3
	xnorcc	%g1,	0x002C,	%o1
	sub	%i1,	%g5,	%i0
	fmovsleu	%icc,	%f8,	%f17
	ta	%icc,	0x4
	xorcc	%o2,	0x07C3,	%g4
	bne,a	%xcc,	loop_726
	fabsd	%f2,	%f10
	taddcc	%l3,	%o7,	%i6
	sdivx	%i5,	0x1FDF,	%l2
loop_726:
	membar	0x6B
	stw	%i7,	[%l7 + 0x1C]
	xor	%l6,	0x1016,	%i4
	fandnot1	%f28,	%f4,	%f20
	smul	%l1,	%i2,	%g2
	fmul8x16al	%f6,	%f0,	%f0
	tg	%icc,	0x3
	bg,a,pt	%icc,	loop_727
	tg	%xcc,	0x4
	udivx	%o6,	0x1C41,	%o5
	edge32l	%o3,	%l5,	%o0
loop_727:
	brnz	%o4,	loop_728
	subcc	%l0,	%g6,	%i3
	stw	%l4,	[%l7 + 0x08]
	fmovsvc	%xcc,	%f8,	%f5
loop_728:
	bcs	%xcc,	loop_729
	sub	%g3,	%g7,	%o1
	sdivcc	%i1,	0x1B13,	%g1
	xor	%g5,	%o2,	%g4
loop_729:
	fpmerge	%f1,	%f19,	%f12
	edge8n	%i0,	%o7,	%i6
	subcc	%l3,	0x1917,	%l2
	srax	%i5,	%l6,	%i7
	fpack32	%f26,	%f24,	%f16
	fbne,a	%fcc0,	loop_730
	bleu,pn	%xcc,	loop_731
	stx	%i4,	[%l7 + 0x38]
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f3
loop_730:
	tleu	%icc,	0x0
loop_731:
	stw	%l1,	[%l7 + 0x20]
	orcc	%g2,	0x1E24,	%i2
	orncc	%o6,	0x1372,	%o5
	tneg	%xcc,	0x5
	bshuffle	%f20,	%f20,	%f2
	fsrc2s	%f19,	%f22
	te	%xcc,	0x4
	sub	%o3,	0x08CF,	%o0
	tg	%icc,	0x7
	fzeros	%f30
	fmovsvc	%xcc,	%f12,	%f21
	fornot2s	%f11,	%f2,	%f28
	fpsub32s	%f20,	%f24,	%f6
	fnot2	%f10,	%f18
	udiv	%l5,	0x0024,	%o4
	sll	%g6,	%i3,	%l0
	umulcc	%g3,	%l4,	%o1
	bvc	%xcc,	loop_732
	mulx	%g7,	%i1,	%g1
	fbue,a	%fcc0,	loop_733
	nop
	set	0x4C, %o4
	prefetch	[%l7 + %o4],	 0x3
loop_732:
	movrlz	%o2,	0x147,	%g5
	fmovse	%xcc,	%f19,	%f25
loop_733:
	bgu,pt	%icc,	loop_734
	fbug,a	%fcc0,	loop_735
	prefetch	[%l7 + 0x48],	 0x1
	tg	%icc,	0x3
loop_734:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6D] %asi,	%i0
loop_735:
	ldsb	[%l7 + 0x69],	%o7
	ld	[%l7 + 0x58],	%f27
	add	%i6,	0x19D5,	%l3
	sethi	0x1FA3,	%g4
	udiv	%i5,	0x05E3,	%l2
	array8	%l6,	%i4,	%i7
	fpack32	%f26,	%f8,	%f22
	andn	%l1,	0x1222,	%i2
	fble,a	%fcc2,	loop_736
	nop
	setx	0xC07C414B,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	tge	%xcc,	0x2
	bge	loop_737
loop_736:
	xorcc	%o6,	%g2,	%o5
	tneg	%icc,	0x0
	brnz,a	%o3,	loop_738
loop_737:
	tvs	%icc,	0x5
	subcc	%o0,	%l5,	%o4
	fble	%fcc1,	loop_739
loop_738:
	call	loop_740
	mulscc	%i3,	%l0,	%g3
	nop
	setx	loop_741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_739:
	smulcc	%g6,	0x18F3,	%l4
loop_740:
	fmovrde	%o1,	%f18,	%f14
	movrne	%g7,	%i1,	%o2
loop_741:
	movneg	%icc,	%g5,	%i0
	subcc	%o7,	%i6,	%l3
	addc	%g1,	0x019B,	%i5
	mulscc	%l2,	0x0D61,	%g4
	fors	%f0,	%f23,	%f7
	brgz	%l6,	loop_742
	fmovrdlez	%i7,	%f28,	%f30
	sir	0x1F16
	fnegs	%f1,	%f28
loop_742:
	tgu	%xcc,	0x5
	sllx	%i4,	%l1,	%o6
	movvc	%icc,	%g2,	%o5
	orcc	%i2,	0x1EFE,	%o3
	xnorcc	%l5,	%o4,	%i3
	edge16l	%o0,	%g3,	%g6
	fmovsne	%xcc,	%f29,	%f8
	edge16l	%l0,	%o1,	%g7
	bleu,pt	%icc,	loop_743
	andn	%l4,	0x0840,	%i1
	nop
	setx	0xBF48409763042103,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f4
	movcs	%xcc,	%o2,	%i0
loop_743:
	movl	%xcc,	%o7,	%g5
	movle	%icc,	%l3,	%i6
	fandnot1	%f8,	%f8,	%f22
	tsubcc	%i5,	%g1,	%g4
	fbug	%fcc3,	loop_744
	orncc	%l6,	%l2,	%i4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x62] %asi,	%l1
loop_744:
	tvs	%xcc,	0x2
	sdivcc	%i7,	0x033A,	%o6
	wr	%g0,	0x21,	%asi
	stxa	%g2,	[%g0 + 0x8] %asi
	fornot1	%f28,	%f16,	%f0
	fandnot1s	%f12,	%f11,	%f6
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge32l	%o5,	%i2,	%l5
	edge16ln	%o4,	%i3,	%o0
	bneg	loop_745
	movvs	%icc,	%o3,	%g6
	fzero	%f26
	subccc	%l0,	%o1,	%g7
loop_745:
	fpack16	%f8,	%f14
	orn	%l4,	0x1066,	%i1
	fsrc1	%f6,	%f20
	nop
	setx	0x226D9EFE2E2A0462,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4F52D17FFCD0F1CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f4,	%f2
	set	0x4B, %l0
	stba	%g3,	[%l7 + %l0] 0x14
	tvs	%icc,	0x1
	fpadd32	%f22,	%f14,	%f24
	edge16	%o2,	%i0,	%g5
	fbge	%fcc0,	loop_746
	edge32l	%l3,	%o7,	%i5
	edge32ln	%g1,	%g4,	%l6
	nop
	setx	0xE055CCF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_746:
	array8	%i6,	%i4,	%l1
	nop
	setx	0xD7DF3E44441EDF79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f0
	xnorcc	%i7,	%l2,	%o6
	fbge,a	%fcc1,	loop_747
	fpadd32	%f6,	%f4,	%f6
	fmovsvs	%icc,	%f9,	%f30
	fabss	%f31,	%f14
loop_747:
	fmovrdne	%o5,	%f30,	%f2
	movle	%xcc,	%g2,	%i2
	stbar
	fxnor	%f24,	%f12,	%f2
	movrlez	%l5,	0x139,	%i3
	st	%f18,	[%l7 + 0x34]
	sra	%o0,	%o4,	%o3
	fcmpeq16	%f24,	%f24,	%l0
	subc	%g6,	%g7,	%o1
	array16	%i1,	%g3,	%o2
	bvs,pt	%xcc,	loop_748
	edge16ln	%i0,	%l4,	%l3
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0x2
loop_748:
	nop
	set	0x34, %i5
	ldswa	[%l7 + %i5] 0x04,	%i5
	edge16l	%o7,	%g1,	%l6
	alignaddrl	%g4,	%i6,	%i4
	ldsb	[%l7 + 0x2C],	%l1
	tvc	%icc,	0x4
	or	%i7,	%l2,	%o5
	fmovsvs	%icc,	%f19,	%f6
	udivcc	%o6,	0x07B0,	%i2
	nop
	setx	0xC652E94C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x8731E6AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f2,	%f12
	or	%l5,	%g2,	%o0
	fcmpgt16	%f12,	%f4,	%o4
	tcs	%icc,	0x3
	movrgz	%o3,	0x307,	%l0
	fmovsne	%xcc,	%f31,	%f16
	movle	%xcc,	%g6,	%i3
	smulcc	%o1,	%g7,	%g3
	nop
	setx	0x6B4E143F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f18
	movne	%icc,	%o2,	%i1
	tsubcctv	%l4,	0x099A,	%l3
	bcc,a,pn	%xcc,	loop_749
	array32	%g5,	%i0,	%i5
	set	0x54, %o0
	lda	[%l7 + %o0] 0x14,	%f11
loop_749:
	xnorcc	%o7,	0x0F91,	%g1
	fpadd32	%f10,	%f10,	%f30
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tcc	%xcc,	0x0
	edge8l	%l6,	%i6,	%i4
	stw	%g4,	[%l7 + 0x68]
	bge,a	%icc,	loop_750
	popc	0x030E,	%i7
	xnorcc	%l1,	0x1CA6,	%l2
	nop
	setx	0x4E0EDD45514288FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x83575B07F6590311,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f28,	%f14
loop_750:
	fpackfix	%f16,	%f21
	movrne	%o5,	0x018,	%i2
	srl	%l5,	0x19,	%o6
	sir	0x0FCD
	addccc	%g2,	0x175F,	%o0
	movpos	%icc,	%o4,	%o3
	fmovd	%f4,	%f14
	fmovdl	%xcc,	%f24,	%f19
	tge	%icc,	0x6
	ba,pt	%icc,	loop_751
	fnors	%f16,	%f0,	%f13
	fabss	%f15,	%f3
	fbge	%fcc3,	loop_752
loop_751:
	tge	%icc,	0x7
	sir	0x01B6
	nop
	setx	0x1EF500B934F9773F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f12
loop_752:
	fba,a	%fcc3,	loop_753
	movrgez	%g6,	0x325,	%i3
	fmovdneg	%icc,	%f10,	%f2
	movle	%xcc,	%l0,	%g7
loop_753:
	edge32	%o1,	%o2,	%g3
	umul	%l4,	%i1,	%l3
	movg	%icc,	%g5,	%i0
	move	%xcc,	%i5,	%o7
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l6
	sllx	%g1,	0x01,	%i6
	fbge,a	%fcc1,	loop_754
	edge32	%i4,	%i7,	%g4
	and	%l2,	0x03E7,	%l1
	movleu	%icc,	%o5,	%i2
loop_754:
	fnot2s	%f4,	%f28
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o6,	%g2
	umulcc	%l5,	%o4,	%o0
	fmovrdne	%o3,	%f8,	%f10
	fpadd16s	%f1,	%f27,	%f5
	move	%icc,	%i3,	%g6
	fcmpgt32	%f28,	%f8,	%g7
	ba,a,pt	%xcc,	loop_755
	alignaddr	%o1,	%o2,	%g3
	movvc	%xcc,	%l4,	%l0
	movn	%icc,	%l3,	%g5
loop_755:
	sll	%i0,	%i5,	%i1
	fmovdne	%icc,	%f28,	%f12
	movleu	%icc,	%l6,	%g1
	fpmerge	%f20,	%f30,	%f10
	fmovsge	%icc,	%f24,	%f18
	movvc	%icc,	%o7,	%i4
	sdivx	%i6,	0x0963,	%i7
	tge	%icc,	0x3
	fmovsneg	%xcc,	%f7,	%f25
	movrgez	%l2,	0x196,	%l1
	tgu	%xcc,	0x2
	bg	loop_756
	alignaddrl	%o5,	%i2,	%g4
	movvs	%xcc,	%o6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_756:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l5,	%o4
	tne	%xcc,	0x3
	andcc	%o3,	%o0,	%i3
	fbul	%fcc1,	loop_757
	swap	[%l7 + 0x5C],	%g6
	array8	%g7,	%o2,	%o1
	tsubcc	%l4,	%g3,	%l0
loop_757:
	taddcc	%l3,	0x0B6A,	%i0
	movpos	%xcc,	%i5,	%i1
	andcc	%g5,	0x0829,	%l6
	tpos	%icc,	0x4
	fba	%fcc2,	loop_758
	nop
	setx	0xB48B4308,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f26
	fcmpne32	%f4,	%f0,	%g1
	movcs	%xcc,	%i4,	%o7
loop_758:
	movl	%icc,	%i6,	%i7
	fmul8x16al	%f8,	%f13,	%f24
	fmovsa	%xcc,	%f3,	%f11
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x60] %asi,	%l1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x18,	%o5,	%l2
	addcc	%i2,	%o6,	%g4
	movge	%xcc,	%g2,	%o4
	tvs	%icc,	0x2
	sra	%l5,	%o3,	%o0
	set	0x48, %i4
	stwa	%g6,	[%l7 + %i4] 0x2f
	membar	#Sync
	tsubcctv	%i3,	0x0742,	%o2
	fbe,a	%fcc3,	loop_759
	udivx	%o1,	0x0BD8,	%g7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_759:
	membar	0x07
	movne	%xcc,	%g3,	%l4
	fandnot1	%f20,	%f0,	%f22
	tge	%xcc,	0x2
	orncc	%l3,	0x1518,	%i0
	sll	%i5,	0x16,	%l0
	fsrc1s	%f13,	%f19
	stbar
	nop
	set	0x54, %o1
	lduw	[%l7 + %o1],	%g5
	fbe,a	%fcc0,	loop_760
	tneg	%icc,	0x2
	fbo,a	%fcc1,	loop_761
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_760:
	movrlz	%l6,	0x3C6,	%g1
	movn	%xcc,	%i4,	%i1
loop_761:
	nop
	setx	0x3109EA58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x0DACFB77,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f26,	%f23
	wr	%g0,	0x10,	%asi
	stwa	%i6,	[%l7 + 0x34] %asi
	ta	%xcc,	0x7
	movvs	%icc,	%i7,	%o7
	fornot1s	%f15,	%f6,	%f21
	bge,pt	%xcc,	loop_762
	bneg,a,pt	%xcc,	loop_763
	addc	%l1,	0x142B,	%o5
	bshuffle	%f4,	%f16,	%f10
loop_762:
	fcmpeq32	%f14,	%f4,	%l2
loop_763:
	fpadd32	%f10,	%f8,	%f8
	edge16ln	%i2,	%g4,	%g2
	tn	%xcc,	0x5
	edge8l	%o6,	%l5,	%o3
	xnorcc	%o4,	0x11D3,	%o0
	subc	%g6,	%o2,	%o1
	mulscc	%i3,	%g3,	%g7
	stx	%l4,	[%l7 + 0x70]
	te	%icc,	0x7
	nop
	set	0x70, %o2
	stx	%l3,	[%l7 + %o2]
	sdivcc	%i0,	0x01DE,	%i5
	array16	%g5,	%l0,	%g1
	fnor	%f24,	%f12,	%f24
	tne	%xcc,	0x0
	tge	%xcc,	0x6
	movl	%xcc,	%l6,	%i1
	movneg	%icc,	%i6,	%i4
	addccc	%i7,	0x1F13,	%l1
	subc	%o7,	%o5,	%l2
	popc	%i2,	%g4
	fmovsvc	%icc,	%f20,	%f1
	xnorcc	%g2,	%l5,	%o6
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%o2
	sethi	0x1BD1,	%o4
	fornot1s	%f28,	%f29,	%f8
	sra	%g6,	%o0,	%o1
	bl,a,pn	%icc,	loop_764
	stb	%i3,	[%l7 + 0x4E]
	orcc	%g3,	%g7,	%l4
	sdivcc	%l3,	0x0BD1,	%o2
loop_764:
	tsubcctv	%i0,	0x15C8,	%g5
	tgu	%xcc,	0x6
	sub	%i5,	%g1,	%l6
	fandnot2s	%f12,	%f21,	%f30
	fnot2	%f30,	%f2
	edge8ln	%l0,	%i6,	%i1
	tne	%xcc,	0x7
	set	0x0F, %g4
	lduba	[%l7 + %g4] 0x19,	%i7
	set	0x61, %o3
	stba	%i4,	[%l7 + %o3] 0x10
	fbu,a	%fcc3,	loop_765
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x1
	fbule	%fcc3,	loop_766
loop_765:
	nop
	setx loop_767, %l0, %l1
	jmpl %l1, %o7
	nop
	setx	0x37D9708F805AAB81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	srax	%o5,	0x12,	%l1
loop_766:
	movrgz	%i2,	0x236,	%g4
loop_767:
	tgu	%xcc,	0x4
	bne,a	loop_768
	fbn,a	%fcc2,	loop_769
	bvs	loop_770
	movpos	%icc,	%g2,	%l5
loop_768:
	addcc	%o6,	%o3,	%o4
loop_769:
	brlez	%l2,	loop_771
loop_770:
	fbge,a	%fcc2,	loop_772
	movre	%o0,	%g6,	%o1
	nop
	fitos	%f7,	%f10
loop_771:
	movrlz	%i3,	0x309,	%g3
loop_772:
	be,pt	%xcc,	loop_773
	orncc	%l4,	%l3,	%o2
	nop
	setx	0x1CFCC62406549D2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD586BA224EC17721,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f6,	%f26
	fands	%f9,	%f10,	%f21
loop_773:
	fmovdvs	%icc,	%f20,	%f18
	edge32l	%i0,	%g7,	%g5
	fbul,a	%fcc0,	loop_774
	srlx	%g1,	0x14,	%i5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l6
loop_774:
	lduh	[%l7 + 0x52],	%i6
	fmovspos	%xcc,	%f15,	%f19
	addccc	%i1,	0x1C61,	%l0
	xor	%i7,	%o7,	%o5
	movneg	%xcc,	%l1,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez,a	%g4,	loop_775
	movre	%i4,	%l5,	%g2
	edge32n	%o6,	%o3,	%l2
	fmovdvc	%xcc,	%f0,	%f18
loop_775:
	ldsw	[%l7 + 0x14],	%o4
	brlez	%o0,	loop_776
	fbule,a	%fcc0,	loop_777
	mova	%xcc,	%o1,	%i3
	tg	%xcc,	0x4
loop_776:
	ta	%icc,	0x6
loop_777:
	tcs	%xcc,	0x3
	subcc	%g6,	%l4,	%g3
	fabsd	%f14,	%f0
	set	0x4C, %o7
	lduwa	[%l7 + %o7] 0x0c,	%l3
	movrne	%i0,	%g7,	%o2
	movneg	%icc,	%g1,	%i5
	movleu	%icc,	%g5,	%l6
	umulcc	%i1,	%i6,	%l0
	tge	%xcc,	0x5
	fblg,a	%fcc0,	loop_778
	srl	%o7,	0x0A,	%o5
	bg	loop_779
	tneg	%icc,	0x7
loop_778:
	fmovrsgez	%l1,	%f30,	%f23
	fsrc2	%f12,	%f8
loop_779:
	udivx	%i7,	0x1C91,	%i2
	fmul8sux16	%f8,	%f28,	%f22
	bgu,a	loop_780
	movne	%icc,	%g4,	%i4
	tn	%icc,	0x5
	tg	%icc,	0x0
loop_780:
	tcs	%icc,	0x2
	sir	0x0DD8
	movrgz	%g2,	%l5,	%o6
	move	%icc,	%l2,	%o3
	movcc	%icc,	%o4,	%o0
	addccc	%i3,	%g6,	%l4
	bpos,pt	%icc,	loop_781
	fand	%f2,	%f24,	%f16
	ldsh	[%l7 + 0x12],	%o1
	stw	%l3,	[%l7 + 0x7C]
loop_781:
	array16	%i0,	%g7,	%g3
	nop
	fitos	%f10,	%f16
	array32	%g1,	%i5,	%g5
	fpack16	%f30,	%f12
	fmovdn	%xcc,	%f14,	%f30
	bpos,a,pt	%xcc,	loop_782
	edge8ln	%l6,	%o2,	%i6
	bvc,a	loop_783
	subccc	%i1,	%o7,	%o5
loop_782:
	orncc	%l0,	0x1EB9,	%i7
	fand	%f0,	%f0,	%f28
loop_783:
	fsrc2s	%f13,	%f2
	edge16	%i2,	%g4,	%l1
	edge16	%i4,	%l5,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x2C],	%l2
	xnorcc	%o6,	0x089F,	%o4
	fandnot2s	%f31,	%f26,	%f2
	set	0x6C, %g6
	stwa	%o3,	[%l7 + %g6] 0x23
	membar	#Sync
	fpadd32	%f10,	%f18,	%f0
	tvc	%xcc,	0x1
	edge32l	%i3,	%o0,	%g6
	udivx	%l4,	0x1B49,	%l3
	bshuffle	%f22,	%f20,	%f22
	edge16l	%o1,	%i0,	%g7
	set	0x66, %i2
	ldsha	[%l7 + %i2] 0x89,	%g1
	andcc	%i5,	0x04B4,	%g3
	stbar
	fone	%f10
	fpackfix	%f4,	%f22
	tsubcc	%g5,	0x0D2D,	%o2
	tneg	%xcc,	0x7
	xorcc	%l6,	0x0377,	%i1
	fmovse	%icc,	%f4,	%f2
	addcc	%o7,	%i6,	%o5
	movrne	%l0,	0x0A1,	%i7
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f16
	tpos	%xcc,	0x0
	sub	%i2,	0x130D,	%g4
	movre	%i4,	0x0BF,	%l1
	fornot2s	%f20,	%f12,	%f16
	brlz	%g2,	loop_784
	te	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x5
loop_784:
	alignaddr	%l2,	%o6,	%l5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o4
	mova	%icc,	%i3,	%o0
	tgu	%xcc,	0x2
	tle	%xcc,	0x7
	movrgez	%g6,	0x123,	%o3
	subc	%l4,	0x0598,	%l3
	movl	%icc,	%o1,	%g7
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%i0
	srl	%g1,	%i5,	%g5
	nop
	setx	loop_785,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%g3,	0x06E1,	%o2
	tg	%icc,	0x5
	movrlz	%i1,	%o7,	%l6
loop_785:
	fandnot1	%f22,	%f6,	%f26
	edge32n	%o5,	%i6,	%l0
	fmul8ulx16	%f30,	%f26,	%f0
	addc	%i2,	0x0FC8,	%i7
	movrne	%g4,	%i4,	%g2
	nop
	setx	loop_786,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f8,	%f2
	fble	%fcc3,	loop_787
	bn,pn	%xcc,	loop_788
loop_786:
	fbge,a	%fcc1,	loop_789
	tcc	%xcc,	0x5
loop_787:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_788:
	addccc	%l2,	0x1933,	%o6
loop_789:
	tcc	%xcc,	0x5
	bcs,a,pn	%xcc,	loop_790
	mova	%xcc,	%l5,	%l1
	sub	%o4,	0x01E3,	%i3
	tgu	%icc,	0x7
loop_790:
	mulx	%g6,	%o0,	%l4
	fcmple16	%f14,	%f8,	%o3
	ble,a,pt	%xcc,	loop_791
	srax	%l3,	0x04,	%g7
	fmovrslez	%o1,	%f19,	%f6
	movvc	%icc,	%i0,	%i5
loop_791:
	nop
	set	0x10, %g5
	prefetch	[%l7 + %g5],	 0x1
	movgu	%icc,	%g1,	%g3
	or	%g5,	%o2,	%i1
	fbul,a	%fcc2,	loop_792
	movgu	%icc,	%l6,	%o5
	stw	%o7,	[%l7 + 0x54]
	wr	%g0,	0x20,	%asi
	stxa	%i6,	[%g0 + 0x20] %asi
loop_792:
	fmovrslez	%i2,	%f21,	%f4
	movne	%icc,	%i7,	%g4
	fxnors	%f23,	%f0,	%f17
	nop
	setx	0xE3DDDF4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x8046F62B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f15,	%f7
	nop
	setx	0xC0A64713,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f17
	array16	%l0,	%i4,	%g2
	tne	%icc,	0x1
	orcc	%o6,	%l5,	%l2
	sdivcc	%l1,	0x106C,	%o4
	tvs	%icc,	0x7
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f7
	tn	%xcc,	0x2
	fbge	%fcc1,	loop_793
	fmovdleu	%icc,	%f7,	%f14
	orncc	%i3,	0x18AE,	%g6
	sdiv	%o0,	0x1C50,	%o3
loop_793:
	brz	%l4,	loop_794
	ldx	[%l7 + 0x48],	%l3
	tle	%icc,	0x1
	tcc	%icc,	0x2
loop_794:
	mulx	%o1,	%g7,	%i5
	mova	%icc,	%g1,	%g3
	nop
	fitos	%f12,	%f6
	fstod	%f6,	%f18
	movvs	%icc,	%i0,	%g5
	movpos	%xcc,	%i1,	%l6
	movleu	%icc,	%o2,	%o5
	movn	%xcc,	%o7,	%i2
	nop
	setx	0x7045CC0B,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	movcc	%icc,	%i6,	%i7
	fzeros	%f17
	tgu	%xcc,	0x3
	fnand	%f28,	%f16,	%f28
	movn	%xcc,	%l0,	%g4
	srl	%i4,	%g2,	%o6
	sub	%l5,	0x0846,	%l2
	movgu	%icc,	%o4,	%i3
	movg	%xcc,	%l1,	%g6
	tsubcc	%o0,	%l4,	%o3
	fmovdle	%icc,	%f12,	%f29
	fone	%f10
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	nop
	setx	loop_795,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%o1,	%g7
	nop
	fitos	%f4,	%f12
	fstoi	%f12,	%f17
	set	0x30, %i1
	stwa	%g1,	[%l7 + %i1] 0xe3
	membar	#Sync
loop_795:
	movl	%icc,	%g3,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%f18
	umulcc	%g5,	%i1,	%l6
	edge16n	%i5,	%o2,	%o7
	tle	%icc,	0x2
	smulcc	%o5,	%i6,	%i2
	be,a,pn	%xcc,	loop_796
	edge16ln	%i7,	%l0,	%g4
	fmovdne	%icc,	%f22,	%f8
	tleu	%icc,	0x1
loop_796:
	fmovrslez	%g2,	%f23,	%f17
	add	%i4,	%o6,	%l2
	fmovsl	%icc,	%f18,	%f23
	movge	%icc,	%l5,	%i3
	movrgz	%o4,	0x207,	%l1
	fmovdg	%icc,	%f21,	%f20
	or	%o0,	0x0012,	%g6
	tpos	%xcc,	0x1
	umulcc	%o3,	0x186D,	%l4
	movrlez	%o1,	0x215,	%l3
	fmovrse	%g1,	%f9,	%f20
	fmovsvc	%icc,	%f12,	%f11
	nop
	setx	0x38801936,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xF846DDCA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f19,	%f12
	bg,a,pt	%xcc,	loop_797
	edge8n	%g7,	%g3,	%i0
	fmul8x16	%f20,	%f0,	%f22
	subccc	%i1,	0x061E,	%g5
loop_797:
	umul	%i5,	%o2,	%o7
	smul	%l6,	%o5,	%i2
	fsrc1s	%f10,	%f12
	set	0x38, %l3
	prefetcha	[%l7 + %l3] 0x19,	 0x1
	fpadd16s	%f31,	%f24,	%f21
	smulcc	%l0,	%i6,	%g2
	andncc	%g4,	%o6,	%l2
	mulscc	%i4,	0x19EF,	%i3
	andn	%l5,	%o4,	%l1
	addccc	%g6,	%o3,	%l4
	bcs,a	%icc,	loop_798
	array16	%o0,	%o1,	%l3
	edge8l	%g1,	%g7,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_798:
	addc	%i0,	%i1,	%i5
	fornot2s	%f29,	%f26,	%f20
	edge16	%o2,	%g5,	%o7
	sll	%o5,	0x1B,	%i2
	nop
	setx	0x8480B9F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC60AE8B5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f17,	%f25
	movpos	%icc,	%i7,	%l0
	movpos	%xcc,	%i6,	%g2
	fmovdle	%xcc,	%f12,	%f5
	pdist	%f26,	%f10,	%f0
	tgu	%xcc,	0x0
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	taddcc	%o6,	0x0547,	%g4
	nop
	setx loop_799, %l0, %l1
	jmpl %l1, %l2
	movcc	%icc,	%i3,	%i4
	nop
	set	0x70, %l4
	std	%f2,	[%l7 + %l4]
	fmovsg	%icc,	%f28,	%f26
loop_799:
	tsubcc	%l5,	0x167F,	%l1
	fbug,a	%fcc1,	loop_800
	pdist	%f30,	%f22,	%f12
	fmovsg	%icc,	%f22,	%f3
	fcmpeq16	%f20,	%f14,	%g6
loop_800:
	tl	%icc,	0x4
	popc	0x1603,	%o3
	edge32n	%l4,	%o0,	%o1
	addccc	%l3,	%g1,	%g7
	stw	%g3,	[%l7 + 0x54]
	udivx	%o4,	0x13CF,	%i0
	te	%icc,	0x6
	edge16n	%i1,	%i5,	%o2
	mulx	%g5,	%o5,	%i2
	fsrc2s	%f31,	%f9
	ble,a,pt	%xcc,	loop_801
	prefetch	[%l7 + 0x5C],	 0x3
	move	%xcc,	%i7,	%o7
	brlz,a	%l0,	loop_802
loop_801:
	fmovdle	%xcc,	%f9,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f22,	%f10,	%g2
loop_802:
	tsubcctv	%i6,	%l6,	%o6
	lduh	[%l7 + 0x44],	%g4
	fnegd	%f12,	%f20
	tgu	%xcc,	0x0
	sub	%i3,	%i4,	%l5
	tl	%xcc,	0x2
	movre	%l1,	0x144,	%g6
	tl	%xcc,	0x4
	movrgz	%l2,	%l4,	%o0
	membar	0x4E
	fcmpeq32	%f30,	%f18,	%o3
	bge,a,pn	%icc,	loop_803
	tleu	%icc,	0x7
	udivcc	%o1,	0x116C,	%l3
	movne	%icc,	%g1,	%g7
loop_803:
	fnot1s	%f8,	%f21
	bneg	loop_804
	array16	%g3,	%i0,	%o4
	fbn,a	%fcc1,	loop_805
	fnot1	%f26,	%f14
loop_804:
	sdiv	%i1,	0x131F,	%i5
	fmovdne	%icc,	%f27,	%f15
loop_805:
	nop
	setx	0x8A81C6F4F0461A9B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	xnorcc	%g5,	0x0DC1,	%o5
	taddcc	%i2,	0x013C,	%i7
	tne	%icc,	0x2
	sllx	%o2,	0x0A,	%o7
	ld	[%l7 + 0x78],	%f6
	movrne	%g2,	0x2B8,	%i6
	or	%l6,	0x1A71,	%l0
	tvs	%icc,	0x5
	tg	%icc,	0x3
	set	0x2A, %g3
	stha	%g4,	[%l7 + %g3] 0x0c
	nop
	setx	0x02A9627539567437,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5D3A43747DA2D431,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f24,	%f8
	tge	%icc,	0x3
	movrne	%i3,	%i4,	%l5
	tl	%icc,	0x5
	bg,a	%icc,	loop_806
	movrgz	%l1,	%o6,	%l2
	and	%l4,	%g6,	%o3
	andn	%o0,	%o1,	%l3
loop_806:
	umul	%g7,	%g3,	%i0
	bleu,a	loop_807
	umulcc	%o4,	%g1,	%i5
	sub	%i1,	%o5,	%g5
	fmovdge	%icc,	%f29,	%f16
loop_807:
	fsrc1s	%f18,	%f29
	smul	%i7,	0x0D9F,	%i2
	nop
	setx loop_808, %l0, %l1
	jmpl %l1, %o2
	edge32	%g2,	%o7,	%l6
	array32	%i6,	%g4,	%i3
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_808:
	fxors	%f12,	%f25,	%f11
	sethi	0x0151,	%i4
	addc	%l0,	%l1,	%o6
	umulcc	%l5,	0x0E0A,	%l2
	te	%icc,	0x2
	tvc	%xcc,	0x7
	nop
	setx	0xDBEE289A7009ABD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xADD99004F9C6F4B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f4,	%f10
	fexpand	%f8,	%f4
	umulcc	%l4,	0x03FE,	%o3
	smul	%g6,	%o1,	%l3
	fmovdcc	%icc,	%f29,	%f24
	fbuge	%fcc1,	loop_809
	edge16	%o0,	%g3,	%i0
	fandnot2s	%f21,	%f20,	%f21
	movpos	%icc,	%o4,	%g1
loop_809:
	fcmpne16	%f6,	%f0,	%g7
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x0c,	%i0
	movrgz	%o5,	%g5,	%i5
	smulcc	%i7,	0x1F93,	%i2
	fmovd	%f2,	%f0
	movrlz	%o2,	%g2,	%l6
	tvs	%icc,	0x3
	movge	%icc,	%i6,	%o7
	array16	%g4,	%i4,	%l0
	fnot2s	%f19,	%f30
	fbe,a	%fcc1,	loop_810
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l1,	%o6,	%l5
	nop
	setx	0x2E88BFEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xEECBAAA7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f25,	%f2
loop_810:
	edge8n	%i3,	%l4,	%o3
	fmovdcc	%xcc,	%f25,	%f26
	smul	%l2,	0x077C,	%g6
	te	%xcc,	0x3
	fmovspos	%xcc,	%f8,	%f6
	andcc	%o1,	%l3,	%o0
	lduh	[%l7 + 0x3A],	%g3
	taddcctv	%o4,	0x1171,	%g1
	tneg	%xcc,	0x5
	ldd	[%l7 + 0x70],	%f8
	movvc	%icc,	%i0,	%g7
	ldub	[%l7 + 0x1F],	%i1
	be	%icc,	loop_811
	tvs	%icc,	0x7
	fbuge	%fcc1,	loop_812
	edge8n	%o5,	%g5,	%i5
loop_811:
	tne	%xcc,	0x7
	fnot1	%f28,	%f0
loop_812:
	bgu,pt	%xcc,	loop_813
	ld	[%l7 + 0x18],	%f31
	fmul8x16	%f18,	%f20,	%f14
	fmovsvc	%xcc,	%f29,	%f22
loop_813:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i7,	%i2
	smulcc	%g2,	0x035A,	%l6
	sdivcc	%i6,	0x1C3B,	%o7
	nop
	setx	0x63CEB2991BF9521A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f28
	add	%o2,	0x1708,	%g4
	fbg	%fcc0,	loop_814
	and	%i4,	0x194A,	%l0
	bl,pn	%icc,	loop_815
	andn	%l1,	0x1F1A,	%o6
loop_814:
	tleu	%xcc,	0x2
	te	%icc,	0x3
loop_815:
	alignaddrl	%i3,	%l5,	%l4
	edge16n	%o3,	%l2,	%g6
	fbg	%fcc3,	loop_816
	tcs	%xcc,	0x3
	array8	%o1,	%o0,	%g3
	fmovse	%icc,	%f11,	%f1
loop_816:
	tcs	%xcc,	0x0
	tl	%xcc,	0x0
	tpos	%xcc,	0x1
	bne,pn	%xcc,	loop_817
	bcc,a,pt	%icc,	loop_818
	edge8ln	%o4,	%l3,	%i0
	fmovscc	%icc,	%f17,	%f10
loop_817:
	fmovspos	%xcc,	%f14,	%f22
loop_818:
	fpadd32s	%f5,	%f27,	%f0
	orncc	%g1,	0x04CD,	%g7
	movcc	%icc,	%o5,	%i1
	nop
	set	0x34, %g7
	ldstub	[%l7 + %g7],	%g5
	smulcc	%i7,	0x09D8,	%i2
	fmovsg	%icc,	%f25,	%f12
	fblg,a	%fcc2,	loop_819
	tcc	%xcc,	0x2
	fmovsn	%xcc,	%f13,	%f8
	edge16l	%g2,	%l6,	%i5
loop_819:
	movrlez	%i6,	0x100,	%o7
	movrgez	%g4,	0x29C,	%i4
	set	0x4C, %l6
	swapa	[%l7 + %l6] 0x80,	%o2
	brgz,a	%l0,	loop_820
	tcs	%xcc,	0x7
	bne,a	loop_821
	tsubcctv	%o6,	%l1,	%i3
loop_820:
	movrlez	%l4,	%o3,	%l5
	te	%icc,	0x4
loop_821:
	movge	%xcc,	%l2,	%g6
	fmovrslez	%o1,	%f23,	%f21
	fmovdl	%icc,	%f22,	%f0
	fpsub32	%f6,	%f22,	%f6
	add	%o0,	%g3,	%o4
	orncc	%l3,	0x0C05,	%g1
	fmovdle	%icc,	%f11,	%f20
	tvc	%icc,	0x4
	tl	%xcc,	0x4
	fbl	%fcc0,	loop_822
	subc	%g7,	%i0,	%o5
	ldsb	[%l7 + 0x1D],	%i1
	stbar
loop_822:
	te	%icc,	0x1
	orncc	%g5,	0x061E,	%i2
	tne	%xcc,	0x3
	fmovsge	%icc,	%f11,	%f6
	bl,a	%xcc,	loop_823
	andcc	%i7,	%l6,	%g2
	tvs	%icc,	0x4
	fbue,a	%fcc3,	loop_824
loop_823:
	fbul,a	%fcc2,	loop_825
	sir	0x0A31
	brlz,a	%i6,	loop_826
loop_824:
	udivcc	%o7,	0x04FE,	%g4
loop_825:
	tn	%icc,	0x6
	movge	%icc,	%i4,	%i5
loop_826:
	bn,pn	%icc,	loop_827
	tg	%icc,	0x7
	array16	%l0,	%o2,	%o6
	fbe	%fcc3,	loop_828
loop_827:
	edge32l	%i3,	%l1,	%o3
	andn	%l4,	%l2,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_828:
	andncc	%g6,	%o0,	%o1
	mulx	%g3,	%o4,	%l3
	edge8l	%g1,	%i0,	%o5
	fornot2	%f2,	%f0,	%f30
	movge	%xcc,	%i1,	%g7
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x34] %asi,	%i2
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x5C] %asi,	%g5
	andn	%i7,	%g2,	%i6
	ld	[%l7 + 0x20],	%f14
	array32	%o7,	%g4,	%l6
	set	0x34, %i3
	lda	[%l7 + %i3] 0x89,	%f2
	fands	%f30,	%f17,	%f14
	sll	%i5,	%l0,	%i4
	fands	%f6,	%f27,	%f6
	movrne	%o2,	%i3,	%o6
	array8	%o3,	%l1,	%l2
	tsubcc	%l5,	0x1D92,	%g6
	fmul8sux16	%f22,	%f26,	%f4
	movvs	%xcc,	%l4,	%o1
	popc	0x194C,	%g3
	lduh	[%l7 + 0x0E],	%o4
	tge	%xcc,	0x3
	movpos	%xcc,	%o0,	%l3
	set	0x44, %l1
	ldsha	[%l7 + %l1] 0x11,	%g1
	fnors	%f8,	%f12,	%f5
	edge8n	%o5,	%i1,	%i0
	srl	%g7,	%g5,	%i2
	mulscc	%g2,	0x06F3,	%i6
	movvs	%icc,	%i7,	%o7
	ld	[%l7 + 0x2C],	%f6
	add	%g4,	%i5,	%l0
	ldub	[%l7 + 0x0A],	%l6
	movge	%icc,	%o2,	%i4
	movg	%xcc,	%o6,	%i3
	fnand	%f16,	%f12,	%f26
	edge8n	%l1,	%l2,	%o3
	movcs	%icc,	%g6,	%l5
	subc	%l4,	%o1,	%g3
	fbl,a	%fcc2,	loop_829
	subcc	%o0,	0x1D43,	%o4
	movcs	%xcc,	%g1,	%l3
	and	%i1,	0x12E3,	%i0
loop_829:
	movrgez	%o5,	0x3D7,	%g5
	fnands	%f29,	%f21,	%f3
	bneg,pn	%xcc,	loop_830
	sdiv	%g7,	0x14C1,	%g2
	movge	%xcc,	%i6,	%i2
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x81,	%f19
loop_830:
	fble	%fcc1,	loop_831
	bneg,a	loop_832
	addcc	%i7,	0x16EC,	%o7
	array8	%i5,	%g4,	%l6
loop_831:
	tsubcc	%l0,	%i4,	%o2
loop_832:
	fnors	%f3,	%f15,	%f27
	sdivcc	%i3,	0x1CC3,	%o6
	fmovde	%xcc,	%f3,	%f11
	orncc	%l2,	%l1,	%o3
	ta	%xcc,	0x6
	tpos	%icc,	0x5
	stw	%l5,	[%l7 + 0x34]
	fandnot1s	%f17,	%f9,	%f14
	ldsb	[%l7 + 0x60],	%g6
	srax	%o1,	%g3,	%l4
	edge8ln	%o4,	%g1,	%o0
	tpos	%icc,	0x2
	tvs	%xcc,	0x5
	movrlez	%l3,	%i1,	%i0
	movle	%icc,	%g5,	%g7
	ta	%xcc,	0x1
	edge16n	%o5,	%g2,	%i6
	membar	0x1A
	brlez	%i2,	loop_833
	addcc	%i7,	0x0736,	%i5
	andncc	%g4,	%l6,	%o7
	edge32n	%i4,	%o2,	%i3
loop_833:
	orncc	%o6,	0x0A89,	%l2
	subccc	%l0,	%o3,	%l5
	fbne,a	%fcc1,	loop_834
	fpadd16	%f2,	%f14,	%f30
	be,pn	%xcc,	loop_835
	movpos	%xcc,	%g6,	%l1
loop_834:
	andn	%o1,	0x098B,	%l4
	bne	%icc,	loop_836
loop_835:
	bvc,a	%xcc,	loop_837
	tsubcctv	%o4,	%g1,	%o0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x36] %asi,	%l3
loop_836:
	nop
	set	0x10, %l5
	stxa	%i1,	[%l7 + %l5] 0xeb
	membar	#Sync
loop_837:
	mova	%icc,	%i0,	%g3
	ldx	[%l7 + 0x18],	%g7
	bcs,a	%icc,	loop_838
	fmul8x16au	%f31,	%f7,	%f26
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%o5
loop_838:
	fpack16	%f2,	%f28
	taddcc	%g2,	%i6,	%i2
	ta	%xcc,	0x4
	set	0x34, %g2
	lda	[%l7 + %g2] 0x11,	%f6
	edge16ln	%g5,	%i7,	%i5
	and	%g4,	0x0ADF,	%l6
	fmovsvc	%xcc,	%f18,	%f25
	fbe	%fcc1,	loop_839
	tvs	%xcc,	0x3
	nop
	setx	0x604DEE3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	andn	%i4,	0x080C,	%o2
loop_839:
	movcc	%icc,	%i3,	%o7
	movvc	%xcc,	%l2,	%l0
	nop
	setx	0x73DEC67F306BCD42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	pdist	%f26,	%f16,	%f4
	xnorcc	%o3,	0x171F,	%o6
	fbug,a	%fcc2,	loop_840
	movleu	%xcc,	%l5,	%g6
	bl,a,pn	%icc,	loop_841
	fpack32	%f12,	%f12,	%f6
loop_840:
	edge16ln	%l1,	%l4,	%o4
	edge32l	%g1,	%o1,	%o0
loop_841:
	movvs	%xcc,	%i1,	%i0
	fornot2s	%f29,	%f0,	%f1
	srl	%g3,	%l3,	%g7
	ldd	[%l7 + 0x38],	%f6
	subcc	%g2,	%i6,	%o5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovse	%icc,	%f30,	%f17
	array16	%g5,	%i2,	%i7
	edge16ln	%i5,	%g4,	%l6
	fmovrdlez	%o2,	%f22,	%f18
	fands	%f9,	%f19,	%f2
	alignaddr	%i3,	%o7,	%l2
	add	%l0,	%i4,	%o6
	sethi	0x1C4E,	%l5
	movrlez	%g6,	%l1,	%o3
	pdist	%f24,	%f2,	%f20
	tne	%icc,	0x5
	movpos	%icc,	%l4,	%o4
	movpos	%xcc,	%o1,	%o0
	tpos	%icc,	0x1
	sir	0x10CD
	tcc	%xcc,	0x3
	fand	%f4,	%f8,	%f26
	orncc	%g1,	0x021C,	%i0
	subccc	%i1,	%l3,	%g7
	std	%f14,	[%l7 + 0x30]
	fbo	%fcc1,	loop_842
	move	%icc,	%g3,	%i6
	fbe,a	%fcc2,	loop_843
	nop
	setx	loop_844,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_842:
	addc	%o5,	%g5,	%i2
	udivx	%i7,	0x172C,	%g2
loop_843:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%i5
loop_844:
	udivx	%l6,	0x1216,	%g4
	fmul8x16au	%f31,	%f12,	%f8
	fmovdn	%icc,	%f8,	%f26
	edge16l	%o2,	%i3,	%o7
	edge8	%l0,	%i4,	%l2
	tsubcctv	%o6,	%l5,	%g6
	umulcc	%o3,	0x092A,	%l1
	ta	%icc,	0x5
	bg,a	%icc,	loop_845
	fbne,a	%fcc2,	loop_846
	ldx	[%l7 + 0x48],	%o4
	nop
	setx	0x4BC40303,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x92573F61,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f7,	%f21
loop_845:
	movneg	%icc,	%o1,	%o0
loop_846:
	movrne	%g1,	0x2FD,	%l4
	mulscc	%i0,	%l3,	%i1
	fbn,a	%fcc1,	loop_847
	brlez,a	%g3,	loop_848
	tvs	%xcc,	0x0
	fmovsa	%xcc,	%f23,	%f13
loop_847:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_848:
	udivcc	%g7,	0x1A9E,	%i6
	andcc	%o5,	%g5,	%i7
	taddcctv	%i2,	%g2,	%i5
	fpsub16s	%f21,	%f11,	%f1
	edge8ln	%l6,	%o2,	%i3
	srlx	%o7,	%g4,	%i4
	orn	%l2,	%l0,	%o6
	st	%f13,	[%l7 + 0x50]
	movgu	%xcc,	%g6,	%o3
	alignaddr	%l5,	%o4,	%o1
	movre	%o0,	0x0B3,	%l1
	move	%xcc,	%l4,	%g1
	array32	%l3,	%i1,	%i0
	sllx	%g7,	0x18,	%i6
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f4
	fpackfix	%f14,	%f11
	movcc	%xcc,	%o5,	%g5
	edge8n	%i7,	%g3,	%i2
	nop
	setx	0x23DD7DBD9A95AD1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xC85A9F9CE77B30DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f22,	%f22
	tsubcctv	%i5,	%g2,	%l6
	sth	%i3,	[%l7 + 0x7A]
	bne,a	loop_849
	smulcc	%o7,	%g4,	%i4
	sth	%l2,	[%l7 + 0x44]
	tle	%icc,	0x1
loop_849:
	membar	0x1F
	udivcc	%o2,	0x0811,	%o6
	edge32n	%g6,	%o3,	%l5
	fbo	%fcc0,	loop_850
	xnor	%o4,	%l0,	%o1
	umulcc	%l1,	0x15F8,	%l4
	fpsub32	%f14,	%f20,	%f2
loop_850:
	edge16	%g1,	%o0,	%l3
	xnor	%i0,	%i1,	%i6
	srlx	%g7,	%g5,	%o5
	smulcc	%g3,	0x0036,	%i2
	fexpand	%f0,	%f24
	tl	%xcc,	0x5
	brgez	%i7,	loop_851
	sllx	%i5,	%g2,	%l6
	srlx	%i3,	0x0C,	%g4
	nop
	setx	0x60531AE5,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_851:
	tcc	%xcc,	0x5
	sllx	%i4,	%l2,	%o7
	fmovrde	%o2,	%f12,	%f14
	movcc	%xcc,	%o6,	%g6
	movl	%icc,	%l5,	%o4
	ta	%xcc,	0x7
	movn	%xcc,	%o3,	%o1
	movcc	%xcc,	%l1,	%l4
	edge32n	%l0,	%g1,	%o0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l3,	%i1
	edge32l	%i6,	%i0,	%g7
	bg	loop_852
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f6
	fornot1	%f22,	%f6,	%f6
	movre	%o5,	%g5,	%i2
loop_852:
	bcc	loop_853
	edge16n	%g3,	%i5,	%i7
	movge	%icc,	%l6,	%i3
	bcc,a,pt	%icc,	loop_854
loop_853:
	udivx	%g2,	0x1788,	%i4
	ta	%xcc,	0x0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%l2
loop_854:
	fmovrdlz	%g4,	%f4,	%f18
	lduh	[%l7 + 0x10],	%o7
	fbuge,a	%fcc1,	loop_855
	edge8n	%o6,	%g6,	%l5
	edge32n	%o2,	%o3,	%o4
	fmovrslez	%l1,	%f1,	%f8
loop_855:
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f12
	subccc	%o1,	0x1395,	%l4
	edge8l	%l0,	%g1,	%l3
	srax	%i1,	%i6,	%o0
	movle	%xcc,	%g7,	%o5
	orncc	%g5,	%i0,	%g3
	addcc	%i2,	0x110A,	%i7
	fmovsleu	%xcc,	%f2,	%f31
	edge32n	%i5,	%i3,	%g2
	sdivx	%l6,	0x0C90,	%i4
	edge16ln	%g4,	%l2,	%o7
	movrlez	%o6,	%g6,	%o2
	movleu	%icc,	%o3,	%l5
	umulcc	%o4,	0x0379,	%o1
	bge,a	loop_856
	fmovdgu	%xcc,	%f30,	%f24
	bg	loop_857
	fxnors	%f6,	%f19,	%f29
loop_856:
	umulcc	%l4,	%l1,	%l0
	movge	%xcc,	%g1,	%l3
loop_857:
	bl,pt	%xcc,	loop_858
	nop
	setx	0x236ADA26686C39F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x42B557FB288798AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f12,	%f8
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i1
loop_858:
	fbe	%fcc0,	loop_859
	bl,a	%icc,	loop_860
	edge32	%i6,	%o0,	%o5
	and	%g5,	0x09F0,	%i0
loop_859:
	sdiv	%g3,	0x1671,	%g7
loop_860:
	nop
	setx	0x5F084359B05C9C83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movn	%xcc,	%i7,	%i5
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i3
	taddcc	%g2,	%i2,	%i4
	nop
	setx	0x0D248BCB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xF89CB1A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f11,	%f28
	add	%g4,	%l2,	%l6
	fmovdg	%icc,	%f4,	%f3
	call	loop_861
	fmovda	%xcc,	%f25,	%f8
	fmovdvs	%xcc,	%f13,	%f14
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%o6
loop_861:
	brgez,a	%g6,	loop_862
	orcc	%o2,	0x0D33,	%o7
	tgu	%xcc,	0x6
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f10
loop_862:
	fmovrse	%o3,	%f11,	%f30
	movn	%xcc,	%l5,	%o4
	srlx	%o1,	0x1A,	%l4
	smul	%l0,	0x0836,	%l1
	udivx	%l3,	0x0950,	%i1
	nop
	fitod	%f2,	%f4
	fdtox	%f4,	%f4
	membar	0x75
	set	0x78, %i6
	stxa	%g1,	[%l7 + %i6] 0x89
	tneg	%icc,	0x2
	fcmpeq16	%f20,	%f24,	%i6
	nop
	setx loop_863, %l0, %l1
	jmpl %l1, %o5
	fbo,a	%fcc2,	loop_864
	fpack32	%f24,	%f12,	%f26
	fsrc1s	%f1,	%f4
loop_863:
	subccc	%g5,	0x0A2F,	%o0
loop_864:
	movrne	%i0,	0x2DF,	%g3
	tle	%xcc,	0x3
	fmovdpos	%icc,	%f0,	%f26
	sdivx	%i7,	0x0C77,	%i5
	tleu	%xcc,	0x3
	fxors	%f6,	%f23,	%f0
	lduh	[%l7 + 0x60],	%i3
	addc	%g2,	%g7,	%i4
	fbe	%fcc0,	loop_865
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%g4,	loop_866
	ldsb	[%l7 + 0x73],	%l2
loop_865:
	prefetch	[%l7 + 0x6C],	 0x1
	wr	%g0,	0x19,	%asi
	stwa	%i2,	[%l7 + 0x2C] %asi
loop_866:
	subcc	%l6,	%g6,	%o2
	sir	0x111D
	array8	%o7,	%o3,	%o6
	fmul8x16au	%f12,	%f17,	%f0
	fpack16	%f28,	%f13
	be,pt	%icc,	loop_867
	array16	%l5,	%o1,	%o4
	fblg	%fcc2,	loop_868
	stx	%l0,	[%l7 + 0x50]
loop_867:
	xnor	%l1,	0x06E7,	%l4
	nop
	setx	0x9D13ACAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x4F6D43B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f17,	%f9
loop_868:
	umulcc	%l3,	%g1,	%i6
	edge32n	%i1,	%o5,	%o0
	tge	%xcc,	0x6
	xnor	%g5,	%i0,	%i7
	edge8ln	%g3,	%i5,	%i3
	fbue,a	%fcc3,	loop_869
	udiv	%g2,	0x0753,	%i4
	fble,a	%fcc3,	loop_870
	brz	%g7,	loop_871
loop_869:
	fmovsleu	%xcc,	%f5,	%f27
	fnand	%f4,	%f10,	%f6
loop_870:
	addc	%g4,	0x011F,	%l2
loop_871:
	andcc	%l6,	%g6,	%o2
	edge32ln	%o7,	%o3,	%i2
	tgu	%xcc,	0x6
	edge16n	%l5,	%o1,	%o4
	orcc	%o6,	%l1,	%l0
	tleu	%icc,	0x4
	movvs	%icc,	%l4,	%g1
	fexpand	%f27,	%f6
	ta	%xcc,	0x5
	and	%i6,	%i1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o0,	%o5
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovs	%f1,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
	sra	%i7,	0x0E,	%g5
	tvs	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g3,	0x1935,	%i5
	bcs,a,pt	%xcc,	loop_872
	movrne	%g2,	%i3,	%i4
	std	%f30,	[%l7 + 0x48]
	ta	%icc,	0x0
loop_872:
	addcc	%g7,	%l2,	%g4
	xnor	%g6,	0x0378,	%l6
	flush	%l7 + 0x74
	edge32l	%o2,	%o3,	%o7
	tvc	%icc,	0x5
	fble,a	%fcc0,	loop_873
	array32	%l5,	%i2,	%o1
	fmovrdgz	%o6,	%f20,	%f26
	be,pt	%icc,	loop_874
loop_873:
	array8	%o4,	%l1,	%l4
	fbo,a	%fcc1,	loop_875
	fblg	%fcc3,	loop_876
loop_874:
	movcc	%icc,	%l0,	%g1
	alignaddrl	%i1,	%l3,	%i6
loop_875:
	fbne	%fcc1,	loop_877
loop_876:
	xorcc	%o0,	%o5,	%i7
	subc	%g5,	0x12AB,	%i0
	add	%i5,	%g3,	%i3
loop_877:
	fxors	%f12,	%f17,	%f24
	orcc	%g2,	%g7,	%i4
	movrgz	%g4,	%l2,	%g6
	smul	%l6,	0x02C5,	%o2
	stw	%o3,	[%l7 + 0x58]
	ldub	[%l7 + 0x17],	%o7
	sub	%i2,	%o1,	%l5
	andcc	%o4,	%l1,	%o6
	edge16ln	%l4,	%g1,	%l0
	ble,a	loop_878
	fbue,a	%fcc2,	loop_879
	fba	%fcc1,	loop_880
	tcc	%xcc,	0x2
loop_878:
	nop
	setx	loop_881,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_879:
	sth	%l3,	[%l7 + 0x16]
loop_880:
	edge32ln	%i6,	%o0,	%i1
	lduw	[%l7 + 0x58],	%o5
loop_881:
	movrlz	%g5,	%i0,	%i7
	brnz	%g3,	loop_882
	fbuge	%fcc3,	loop_883
	fcmple16	%f2,	%f22,	%i5
	array32	%g2,	%g7,	%i3
loop_882:
	call	loop_884
loop_883:
	mulscc	%i4,	%l2,	%g6
	tle	%xcc,	0x6
	fandnot1s	%f22,	%f19,	%f4
loop_884:
	srax	%g4,	%l6,	%o2
	ldub	[%l7 + 0x1D],	%o7
	movrgez	%o3,	%o1,	%l5
	tne	%xcc,	0x1
	popc	0x1AB1,	%o4
	membar	0x68
	fmovsgu	%xcc,	%f14,	%f2
	move	%icc,	%i2,	%l1
	smulcc	%l4,	%o6,	%l0
	fmovdne	%xcc,	%f0,	%f7
	movrlz	%l3,	%g1,	%i6
	fbule,a	%fcc2,	loop_885
	or	%o0,	0x0461,	%o5
	movcs	%xcc,	%i1,	%i0
	movrgez	%i7,	0x33E,	%g5
loop_885:
	fmovdgu	%icc,	%f25,	%f11
	movrlz	%g3,	0x335,	%i5
	fsrc2s	%f25,	%f6
	fnands	%f3,	%f17,	%f31
	fbl,a	%fcc0,	loop_886
	edge8ln	%g7,	%g2,	%i3
	edge16ln	%l2,	%i4,	%g4
	movvs	%icc,	%g6,	%l6
loop_886:
	fmovrdne	%o2,	%f2,	%f20
	fzeros	%f19
	smulcc	%o3,	0x1CED,	%o7
	movn	%xcc,	%o1,	%l5
	ldd	[%l7 + 0x38],	%i2
	bpos,pn	%icc,	loop_887
	fmovspos	%icc,	%f6,	%f16
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%o4
loop_887:
	addcc	%l4,	%o6,	%l1
	bne	loop_888
	nop
	setx	loop_889,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stb	%l0,	[%l7 + 0x38]
	fmovdl	%xcc,	%f18,	%f26
loop_888:
	sdiv	%l3,	0x13F0,	%g1
loop_889:
	movvc	%xcc,	%o0,	%i6
	sth	%o5,	[%l7 + 0x4E]
	fbo	%fcc0,	loop_890
	bcs,pt	%xcc,	loop_891
	fnot2	%f0,	%f28
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i0
loop_890:
	fmovdl	%icc,	%f1,	%f5
loop_891:
	fbg	%fcc1,	loop_892
	ldub	[%l7 + 0x28],	%i7
	fmovsl	%icc,	%f21,	%f7
	stx	%g5,	[%l7 + 0x40]
loop_892:
	popc	%g3,	%i1
	flush	%l7 + 0x3C
	subcc	%g7,	0x0D6A,	%g2
	edge16	%i5,	%i3,	%i4
	swap	[%l7 + 0x6C],	%l2
	bge	loop_893
	srax	%g4,	%g6,	%l6
	movne	%icc,	%o3,	%o7
	bvs	%icc,	loop_894
loop_893:
	fmovrde	%o1,	%f4,	%f6
	fbug	%fcc1,	loop_895
	movle	%icc,	%o2,	%i2
loop_894:
	udivcc	%l5,	0x06F2,	%l4
	subc	%o4,	0x180F,	%o6
loop_895:
	tvs	%xcc,	0x6
	fnand	%f10,	%f24,	%f26
	sir	0x0CE6
	stw	%l1,	[%l7 + 0x0C]
	sdivcc	%l3,	0x173B,	%g1
	edge8n	%l0,	%o0,	%o5
	subc	%i6,	0x1351,	%i7
	addcc	%i0,	%g3,	%i1
	movne	%xcc,	%g5,	%g2
	alignaddrl	%g7,	%i3,	%i5
	sdivcc	%l2,	0x147A,	%i4
	swap	[%l7 + 0x28],	%g6
	edge8ln	%g4,	%o3,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l6,	0x1FA1,	%o2
	xor	%o1,	0x1944,	%i2
	set	0x10, %o4
	lduba	[%l7 + %o4] 0x15,	%l4
	orcc	%l5,	%o4,	%l1
	brnz	%l3,	loop_896
	fone	%f24
	fpadd32s	%f9,	%f14,	%f16
	fnegs	%f31,	%f31
loop_896:
	edge8ln	%o6,	%l0,	%g1
	taddcctv	%o0,	%o5,	%i7
	addccc	%i6,	0x00D8,	%g3
	movle	%icc,	%i1,	%g5
	subc	%g2,	0x1B30,	%g7
	fornot2s	%f28,	%f2,	%f17
	fcmpne32	%f6,	%f8,	%i3
	fpadd16	%f30,	%f16,	%f6
	umul	%i0,	%i5,	%l2
	fpsub32	%f2,	%f14,	%f2
	movle	%icc,	%g6,	%i4
	te	%icc,	0x1
	ba,a,pt	%xcc,	loop_897
	fabss	%f13,	%f12
	xorcc	%g4,	0x0821,	%o3
	ldsw	[%l7 + 0x14],	%o7
loop_897:
	movn	%icc,	%o2,	%o1
	bne,a,pn	%icc,	loop_898
	fmovrdne	%l6,	%f28,	%f16
	fpsub16	%f8,	%f24,	%f2
	membar	0x6D
loop_898:
	movcc	%xcc,	%l4,	%i2
	nop
	setx	0x02F2313FB016259F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7E8A057913B09541,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f16,	%f14
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%l1
	bcc	%icc,	loop_899
	edge32l	%l3,	%o6,	%o4
	fxnors	%f24,	%f4,	%f27
	movrne	%g1,	%l0,	%o5
loop_899:
	fmul8x16	%f28,	%f0,	%f18
	sll	%i7,	%i6,	%o0
	fbuge,a	%fcc3,	loop_900
	tsubcctv	%i1,	%g3,	%g5
	nop
	fitod	%f10,	%f6
	fdtoi	%f6,	%f24
	fbule	%fcc2,	loop_901
loop_900:
	fones	%f16
	alignaddr	%g7,	%g2,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%i3
loop_901:
	move	%icc,	%l2,	%g6
	taddcc	%i4,	%o3,	%g4
	sll	%o2,	%o1,	%l6
	move	%icc,	%o7,	%l4
	addccc	%l5,	0x0C67,	%i2
	movn	%xcc,	%l1,	%l3
	bne,a,pt	%icc,	loop_902
	nop
	setx	loop_903,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsle	%xcc,	%f19,	%f17
	taddcctv	%o6,	0x0A24,	%o4
loop_902:
	bneg,pn	%icc,	loop_904
loop_903:
	fpsub32s	%f20,	%f19,	%f30
	fblg,a	%fcc1,	loop_905
	fpsub32	%f14,	%f30,	%f28
loop_904:
	ble	loop_906
	fbule	%fcc3,	loop_907
loop_905:
	tgu	%icc,	0x0
	fcmpne16	%f22,	%f24,	%g1
loop_906:
	fnot2s	%f26,	%f6
loop_907:
	nop
	set	0x10, %o5
	ldsba	[%l7 + %o5] 0x15,	%l0
	tcs	%xcc,	0x4
	addcc	%o5,	0x1733,	%i6
	swap	[%l7 + 0x38],	%o0
	popc	%i1,	%g3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x51] %asi,	%i7
	fbg,a	%fcc0,	loop_908
	and	%g7,	0x1517,	%g2
	fpadd16s	%f6,	%f5,	%f18
	lduw	[%l7 + 0x1C],	%i0
loop_908:
	taddcctv	%i5,	%g5,	%l2
	edge8ln	%i3,	%i4,	%o3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x78] %asi,	%g6
	fmovdgu	%xcc,	%f0,	%f29
	brnz,a	%o2,	loop_909
	fble,a	%fcc0,	loop_910
	fbe,a	%fcc0,	loop_911
	addcc	%g4,	0x0B33,	%o1
loop_909:
	nop
	set	0x34, %i5
	prefetch	[%l7 + %i5],	 0x0
loop_910:
	brnz	%o7,	loop_912
loop_911:
	fmovrdlz	%l6,	%f22,	%f26
	movcs	%icc,	%l4,	%l5
	te	%icc,	0x1
loop_912:
	alignaddrl	%i2,	%l1,	%o6
	mulx	%o4,	%g1,	%l3
	umul	%o5,	%l0,	%o0
	bg	loop_913
	mova	%icc,	%i6,	%g3
	fmovdge	%xcc,	%f18,	%f3
	orcc	%i1,	0x1F19,	%g7
loop_913:
	fornot1	%f0,	%f6,	%f10
	fbo	%fcc3,	loop_914
	tne	%icc,	0x1
	subcc	%i7,	%i0,	%i5
	movrgez	%g5,	%g2,	%i3
loop_914:
	udivx	%l2,	0x071D,	%i4
	nop
	set	0x38, %o0
	sth	%g6,	[%l7 + %o0]
	tgu	%xcc,	0x5
	edge16n	%o2,	%o3,	%o1
	bpos,a	%xcc,	loop_915
	movneg	%icc,	%g4,	%l6
	fmovdleu	%xcc,	%f4,	%f29
	tcs	%xcc,	0x7
loop_915:
	andncc	%o7,	%l5,	%i2
	movl	%xcc,	%l4,	%l1
	tne	%icc,	0x6
	smulcc	%o6,	0x0C93,	%o4
	movrgz	%g1,	%l3,	%l0
	umul	%o5,	%i6,	%g3
	swap	[%l7 + 0x54],	%o0
	mova	%xcc,	%g7,	%i7
	movl	%icc,	%i0,	%i5
	ta	%icc,	0x1
	edge32ln	%i1,	%g5,	%i3
	ble	loop_916
	smul	%l2,	%g2,	%i4
	fnegs	%f1,	%f27
	fzero	%f26
loop_916:
	movrlez	%o2,	%g6,	%o3
	fbg,a	%fcc3,	loop_917
	edge8n	%o1,	%l6,	%g4
	bn,pt	%icc,	loop_918
	nop
	fitod	%f12,	%f2
loop_917:
	taddcctv	%l5,	0x07FF,	%o7
	array8	%l4,	%i2,	%o6
loop_918:
	bn	loop_919
	sra	%l1,	0x14,	%o4
	edge8n	%l3,	%l0,	%o5
	set	0x78, %l0
	lda	[%l7 + %l0] 0x18,	%f19
loop_919:
	sra	%g1,	%g3,	%i6
	fandnot1	%f16,	%f6,	%f22
	nop
	setx loop_920, %l0, %l1
	jmpl %l1, %o0
	te	%icc,	0x0
	bpos	loop_921
	fone	%f18
loop_920:
	smul	%g7,	%i7,	%i0
	edge8n	%i5,	%g5,	%i3
loop_921:
	fble,a	%fcc3,	loop_922
	tneg	%xcc,	0x5
	tsubcc	%i1,	%l2,	%g2
	ldx	[%l7 + 0x50],	%i4
loop_922:
	array32	%o2,	%o3,	%g6
	smulcc	%l6,	%g4,	%o1
	smulcc	%o7,	0x185E,	%l4
	movpos	%icc,	%i2,	%o6
	fbug,a	%fcc1,	loop_923
	nop
	setx	0xDC8CBACC00749845,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	umulcc	%l5,	%o4,	%l3
	stw	%l1,	[%l7 + 0x28]
loop_923:
	tle	%icc,	0x5
	movg	%xcc,	%l0,	%o5
	edge8	%g3,	%g1,	%i6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%o0
	movne	%icc,	%i7,	%i0
	nop
	setx	loop_924,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba,a	%fcc3,	loop_925
	fmovdge	%xcc,	%f4,	%f0
	tsubcc	%g7,	0x0D04,	%i5
loop_924:
	subc	%i3,	0x0F70,	%i1
loop_925:
	fnands	%f23,	%f1,	%f20
	andncc	%g5,	%g2,	%l2
	sdivx	%o2,	0x05FE,	%i4
	xorcc	%g6,	0x0AE3,	%o3
	movgu	%xcc,	%g4,	%l6
	orn	%o1,	0x023D,	%o7
	movcs	%xcc,	%l4,	%o6
	smulcc	%i2,	0x0140,	%l5
	tleu	%icc,	0x5
	smul	%o4,	%l1,	%l3
	fmovrdlz	%o5,	%f8,	%f4
	stb	%g3,	[%l7 + 0x6B]
	movgu	%icc,	%g1,	%i6
	bvs,pn	%xcc,	loop_926
	fmovdvc	%icc,	%f9,	%f21
	ldx	[%l7 + 0x60],	%o0
	movle	%icc,	%l0,	%i7
loop_926:
	brnz,a	%i0,	loop_927
	or	%g7,	0x029D,	%i5
	ta	%xcc,	0x6
	tvs	%icc,	0x5
loop_927:
	sllx	%i3,	%g5,	%g2
	edge32ln	%i1,	%o2,	%i4
	fmovdle	%icc,	%f13,	%f4
	bn,a	loop_928
	sllx	%l2,	%g6,	%g4
	fabss	%f12,	%f21
	tl	%xcc,	0x7
loop_928:
	xnor	%l6,	%o3,	%o1
	ldx	[%l7 + 0x28],	%l4
	bvc,a	loop_929
	sdivcc	%o7,	0x0292,	%o6
	bg,pt	%icc,	loop_930
	umul	%i2,	%l5,	%o4
loop_929:
	movvc	%xcc,	%l3,	%o5
	fbue,a	%fcc1,	loop_931
loop_930:
	add	%l1,	%g3,	%g1
	edge32l	%o0,	%i6,	%l0
	edge16ln	%i7,	%g7,	%i0
loop_931:
	edge16l	%i3,	%g5,	%i5
	movcs	%icc,	%g2,	%i1
	movg	%xcc,	%o2,	%i4
	fabss	%f24,	%f12
	lduh	[%l7 + 0x28],	%g6
	bvs,pt	%xcc,	loop_932
	smulcc	%g4,	%l2,	%o3
	array16	%l6,	%l4,	%o7
	be,a	loop_933
loop_932:
	sub	%o1,	0x12B0,	%i2
	set	0x78, %o1
	ldswa	[%l7 + %o1] 0x14,	%l5
loop_933:
	bvc,pt	%xcc,	loop_934
	ldsb	[%l7 + 0x5E],	%o4
	fexpand	%f28,	%f6
	movrlez	%l3,	0x3D2,	%o6
loop_934:
	edge16	%l1,	%g3,	%g1
	brnz	%o0,	loop_935
	tsubcc	%o5,	0x0F59,	%i6
	stbar
	move	%xcc,	%i7,	%g7
loop_935:
	stb	%l0,	[%l7 + 0x2E]
	swap	[%l7 + 0x58],	%i3
	edge16	%i0,	%i5,	%g5
	ldd	[%l7 + 0x30],	%i0
	nop
	fitos	%f7,	%f15
	fstox	%f15,	%f24
	tsubcc	%o2,	0x03EC,	%i4
	mulx	%g2,	%g6,	%l2
	fexpand	%f2,	%f4
	brgez	%g4,	loop_936
	taddcc	%l6,	%o3,	%o7
	andn	%o1,	0x0EEB,	%l4
	addc	%l5,	%i2,	%l3
loop_936:
	ldsh	[%l7 + 0x16],	%o4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o6,	%g3
	sir	0x11FF
	array16	%g1,	%o0,	%l1
	set	0x60, %i4
	stwa	%i6,	[%l7 + %i4] 0x27
	membar	#Sync
	sdivx	%i7,	0x034A,	%g7
	sll	%l0,	%i3,	%o5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4F] %asi,	%i5
	fbne	%fcc3,	loop_937
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i0,	%g5,	%i1
	tgu	%icc,	0x6
loop_937:
	fands	%f25,	%f25,	%f18
	xor	%i4,	0x0CFE,	%g2
	movl	%xcc,	%g6,	%o2
	andcc	%l2,	0x1A8B,	%l6
	fmovsn	%xcc,	%f21,	%f29
	wr	%g0,	0x89,	%asi
	stba	%g4,	[%l7 + 0x4F] %asi
	fornot2	%f0,	%f12,	%f14
	fcmpgt16	%f22,	%f22,	%o3
	smulcc	%o7,	%o1,	%l5
	umulcc	%i2,	0x09B8,	%l4
	and	%l3,	0x0530,	%o6
	mova	%icc,	%g3,	%o4
	srlx	%g1,	0x17,	%l1
	lduw	[%l7 + 0x74],	%o0
	umulcc	%i6,	%i7,	%l0
	tpos	%icc,	0x1
	fsrc1	%f2,	%f12
	movcc	%xcc,	%i3,	%o5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x70] %asi,	%g7
	movl	%icc,	%i5,	%i0
	movg	%xcc,	%g5,	%i1
	nop
	setx	0x1B72913ACD23F0A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x88AAAD46C543F5C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f10,	%f18
	edge8n	%i4,	%g6,	%o2
	orncc	%g2,	%l2,	%l6
	tsubcctv	%g4,	%o3,	%o7
	fbg,a	%fcc3,	loop_938
	prefetch	[%l7 + 0x14],	 0x1
	sir	0x10FF
	srlx	%l5,	0x14,	%i2
loop_938:
	and	%l4,	0x0BD2,	%o1
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f7
	edge32	%o6,	%g3,	%l3
	nop
	setx	0x28E78588,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x22CE9DA0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f13,	%f13
	movrgz	%o4,	0x37E,	%l1
	orncc	%o0,	%g1,	%i7
	fbe,a	%fcc2,	loop_939
	tsubcc	%i6,	0x0FC1,	%i3
	fandnot2	%f20,	%f12,	%f10
	movrlz	%l0,	%g7,	%o5
loop_939:
	orn	%i5,	0x1E4F,	%g5
	te	%icc,	0x6
	andcc	%i0,	%i1,	%i4
	movn	%xcc,	%g6,	%g2
	wr	%g0,	0x04,	%asi
	sta	%f17,	[%l7 + 0x78] %asi
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movle	%icc,	%o2,	%l6
	fmovrsgez	%g4,	%f13,	%f20
	array16	%o3,	%l2,	%l5
	fmovsvs	%xcc,	%f23,	%f20
	edge32l	%o7,	%i2,	%o1
	tpos	%icc,	0x4
	ta	%icc,	0x6
	tl	%xcc,	0x1
	sra	%o6,	0x05,	%g3
	edge32l	%l4,	%l3,	%l1
	fmovdle	%xcc,	%f19,	%f10
	movrne	%o4,	%o0,	%g1
	movvs	%xcc,	%i7,	%i6
	nop
	setx loop_940, %l0, %l1
	jmpl %l1, %l0
	fmovscs	%xcc,	%f9,	%f30
	nop
	setx	0x9FA394DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x2EA056F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f15,	%f15
	tneg	%xcc,	0x7
loop_940:
	movrgez	%g7,	%i3,	%i5
	movrlz	%g5,	%i0,	%i1
	movrlez	%i4,	%g6,	%o5
	membar	0x3D
	orn	%o2,	0x0D01,	%l6
	tg	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x70] %asi,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc1,	loop_941
	sll	%g4,	0x0E,	%l2
	edge16n	%o3,	%o7,	%l5
	tleu	%icc,	0x5
loop_941:
	lduh	[%l7 + 0x60],	%o1
	umulcc	%i2,	0x0FE4,	%g3
	udiv	%l4,	0x0998,	%o6
	bleu,a,pn	%icc,	loop_942
	movvs	%icc,	%l1,	%l3
	movne	%xcc,	%o4,	%g1
	tl	%xcc,	0x3
loop_942:
	sllx	%o0,	0x05,	%i6
	bvs,a	loop_943
	bg,pn	%icc,	loop_944
	fpackfix	%f14,	%f10
	srlx	%i7,	0x0C,	%l0
loop_943:
	fbul	%fcc3,	loop_945
loop_944:
	brgez	%g7,	loop_946
	sethi	0x11CD,	%i3
	nop
	fitos	%f1,	%f22
	fstoi	%f22,	%f30
loop_945:
	srlx	%i5,	%g5,	%i1
loop_946:
	movl	%xcc,	%i4,	%i0
	and	%o5,	0x00EA,	%o2
	smulcc	%g6,	%g2,	%l6
	addc	%g4,	0x1D43,	%l2
	sllx	%o3,	0x09,	%o7
	srl	%o1,	0x17,	%i2
	or	%g3,	%l5,	%l4
	orn	%o6,	%l3,	%o4
	xnor	%l1,	%o0,	%i6
	nop
	setx	0x2DC2551EE077E7ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movrlz	%i7,	0x1A3,	%l0
	add	%g1,	0x199F,	%i3
	movn	%icc,	%i5,	%g7
	udivx	%i1,	0x0E3F,	%i4
	array16	%g5,	%o5,	%i0
	movrne	%o2,	%g2,	%g6
	alignaddr	%g4,	%l6,	%o3
	edge32ln	%l2,	%o1,	%o7
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x08] %asi,	%i2
	movn	%icc,	%l5,	%g3
	tvs	%xcc,	0x6
	stbar
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f16
	bcc	loop_947
	brz,a	%o6,	loop_948
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l4,	0x0C48,	%o4
loop_947:
	fmovsgu	%xcc,	%f6,	%f17
loop_948:
	nop
	setx	0xA309117C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x10B7FA9A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f26,	%f14
	fnot2s	%f23,	%f26
	tne	%icc,	0x0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l1,	%l3
	edge32ln	%o0,	%i7,	%l0
	tcs	%icc,	0x6
	tg	%icc,	0x3
	mova	%icc,	%g1,	%i3
	be,pt	%icc,	loop_949
	alignaddrl	%i6,	%g7,	%i1
	fpadd16	%f16,	%f22,	%f26
	bleu,pn	%icc,	loop_950
loop_949:
	nop
	fitos	%f20,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i4,	%g5,	%o5
loop_950:
	movvs	%xcc,	%i0,	%i5
	edge32n	%g2,	%g6,	%o2
	fblg,a	%fcc1,	loop_951
	sdiv	%l6,	0x1737,	%g4
	fxnors	%f17,	%f19,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_951:
	tg	%xcc,	0x3
	fnot2s	%f12,	%f7
	fmovdge	%xcc,	%f16,	%f10
	fpsub32	%f30,	%f14,	%f10
	movpos	%xcc,	%l2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o1,	[%l7 + 0x50]
	movpos	%xcc,	%i2,	%l5
	taddcctv	%o7,	%o6,	%l4
	edge16l	%g3,	%l1,	%o4
	fbu	%fcc1,	loop_952
	bcs	%icc,	loop_953
	srlx	%l3,	%i7,	%o0
	subccc	%g1,	%i3,	%i6
loop_952:
	srl	%l0,	0x02,	%i1
loop_953:
	nop
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	tn	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	stwa	%g7,	[%l7 + 0x30] %asi
	movcs	%icc,	%o5,	%i0
	subcc	%g5,	%i5,	%g6
	fmovda	%xcc,	%f8,	%f6
	fmovrdlz	%o2,	%f18,	%f24
	fornot2	%f14,	%f28,	%f22
	xor	%l6,	0x0EE4,	%g4
	udivx	%l2,	0x09FD,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x3
	tge	%xcc,	0x2
	set	0x3C, %i7
	lduha	[%l7 + %i7] 0x89,	%o1
	subccc	%g2,	0x0D86,	%l5
	movrlz	%i2,	%o7,	%o6
	movrne	%l4,	%g3,	%l1
	nop
	setx	0x3FDABB5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xE63793E5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f2,	%f16
	mulx	%o4,	%l3,	%o0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%g1
	edge16n	%i6,	%l0,	%i3
	te	%icc,	0x6
	movrgez	%i4,	%g7,	%o5
	nop
	setx	0x07E29B145CC1F575,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3016AB321F986956,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f26,	%f30
	orncc	%i1,	0x0D0C,	%g5
	tvs	%icc,	0x4
	sdivx	%i0,	0x0AEB,	%i5
	popc	%o2,	%l6
	tle	%xcc,	0x4
	pdist	%f16,	%f20,	%f4
	movneg	%icc,	%g4,	%g6
	nop
	setx	0xF49C577E0056208A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	mova	%icc,	%l2,	%o3
	edge32	%o1,	%l5,	%g2
	edge16l	%i2,	%o7,	%l4
	fandnot2	%f12,	%f6,	%f28
	edge16ln	%o6,	%g3,	%l1
	fbuge	%fcc1,	loop_954
	or	%l3,	0x1B46,	%o0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%o4,	%g1
loop_954:
	addc	%i6,	0x18BA,	%i7
	bvs,a,pn	%xcc,	loop_955
	fbge,a	%fcc2,	loop_956
	array16	%i3,	%i4,	%l0
	sllx	%g7,	%i1,	%g5
loop_955:
	tl	%xcc,	0x1
loop_956:
	nop
	setx	loop_957,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%i0,	%i5,	%o2
	umulcc	%l6,	%o5,	%g4
	ta	%xcc,	0x3
loop_957:
	fmovrdne	%l2,	%f10,	%f28
	bge	%icc,	loop_958
	orncc	%o3,	0x1108,	%o1
	brlez,a	%l5,	loop_959
	mova	%xcc,	%g6,	%g2
loop_958:
	lduw	[%l7 + 0x48],	%o7
	tgu	%xcc,	0x7
loop_959:
	ldsw	[%l7 + 0x40],	%l4
	andncc	%i2,	%o6,	%l1
	addcc	%g3,	0x0975,	%l3
	fsrc2s	%f17,	%f30
	array32	%o0,	%o4,	%g1
	alignaddr	%i6,	%i3,	%i4
	movrgez	%i7,	%l0,	%i1
	fbul,a	%fcc1,	loop_960
	ldd	[%l7 + 0x68],	%f10
	bvc,pt	%icc,	loop_961
	ldx	[%l7 + 0x18],	%g5
loop_960:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %o3
	lda	[%l7 + %o3] 0x14,	%f29
loop_961:
	movrgez	%g7,	0x270,	%i5
	fcmpeq32	%f26,	%f4,	%i0
	tle	%xcc,	0x1
	fbul	%fcc0,	loop_962
	addccc	%o2,	0x04DD,	%l6
	fbn,a	%fcc3,	loop_963
	fmovsl	%icc,	%f29,	%f28
loop_962:
	fmovscs	%xcc,	%f15,	%f22
	addccc	%o5,	%g4,	%o3
loop_963:
	fornot1	%f0,	%f28,	%f0
	fmovdn	%icc,	%f18,	%f0
	andn	%o1,	0x0D46,	%l2
	fmovdgu	%icc,	%f22,	%f27
	fnegs	%f26,	%f21
	fmovrdlez	%g6,	%f0,	%f16
	addc	%g2,	0x105A,	%l5
	movg	%icc,	%l4,	%o7
	array32	%o6,	%i2,	%g3
	addccc	%l3,	0x0777,	%l1
	nop
	fitos	%f12,	%f22
	fstod	%f22,	%f2
	fmovdcc	%icc,	%f22,	%f30
	alignaddrl	%o4,	%g1,	%i6
	wr	%g0,	0xeb,	%asi
	stwa	%o0,	[%l7 + 0x30] %asi
	membar	#Sync
	ldstub	[%l7 + 0x20],	%i4
	fmovrdgz	%i3,	%f24,	%f8
	or	%i7,	%i1,	%g5
	fmovrdgez	%l0,	%f6,	%f20
	array16	%i5,	%i0,	%o2
	tn	%xcc,	0x3
	add	%g7,	%o5,	%l6
	fmovdne	%icc,	%f4,	%f27
	fexpand	%f13,	%f6
	smul	%g4,	%o3,	%l2
	movn	%xcc,	%o1,	%g2
	ta	%icc,	0x5
	fblg,a	%fcc0,	loop_964
	mova	%icc,	%l5,	%l4
	edge8ln	%o7,	%g6,	%i2
	fornot2	%f22,	%f26,	%f18
loop_964:
	tl	%icc,	0x4
	fbul	%fcc0,	loop_965
	fbge	%fcc1,	loop_966
	lduh	[%l7 + 0x60],	%o6
	fornot1s	%f5,	%f8,	%f17
loop_965:
	fpack32	%f12,	%f8,	%f0
loop_966:
	edge8ln	%l3,	%g3,	%l1
	edge16ln	%g1,	%i6,	%o4
	tsubcc	%i4,	%i3,	%o0
	umul	%i1,	0x1D35,	%g5
	array8	%i7,	%l0,	%i0
	edge32	%o2,	%i5,	%o5
	fornot1	%f8,	%f18,	%f14
	sdivcc	%l6,	0x1352,	%g4
	fpadd32s	%f25,	%f11,	%f13
	fexpand	%f17,	%f10
	tneg	%icc,	0x3
	movre	%g7,	0x29C,	%o3
	subcc	%l2,	0x064E,	%g2
	edge32n	%o1,	%l5,	%o7
	fmovdge	%icc,	%f3,	%f11
	edge16l	%g6,	%i2,	%o6
	nop
	setx	loop_967,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andn	%l4,	0x19BC,	%l3
	fandnot1	%f8,	%f26,	%f2
	edge32l	%g3,	%l1,	%g1
loop_967:
	fpadd16	%f16,	%f20,	%f14
	sllx	%i6,	%o4,	%i4
	sdivx	%i3,	0x0937,	%o0
	fpsub16	%f0,	%f16,	%f24
	andncc	%g5,	%i7,	%l0
	andncc	%i0,	%o2,	%i5
	sdiv	%o5,	0x1D46,	%l6
	ble,a,pn	%xcc,	loop_968
	tvs	%xcc,	0x6
	fmovsge	%xcc,	%f24,	%f26
	fbu	%fcc0,	loop_969
loop_968:
	subc	%i1,	%g7,	%g4
	fcmpgt16	%f4,	%f4,	%l2
	subccc	%g2,	0x1196,	%o3
loop_969:
	tcs	%xcc,	0x6
	fbne	%fcc1,	loop_970
	fmul8sux16	%f0,	%f16,	%f22
	alignaddrl	%l5,	%o7,	%g6
	srax	%o1,	0x05,	%i2
loop_970:
	srl	%l4,	%l3,	%o6
	udivcc	%l1,	0x088D,	%g1
	movgu	%xcc,	%g3,	%o4
	movneg	%xcc,	%i4,	%i3
	sdivcc	%o0,	0x0868,	%i6
	bne,pn	%icc,	loop_971
	tcc	%icc,	0x7
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x04,	%f16
loop_971:
	bvc,a,pt	%xcc,	loop_972
	nop
	fitos	%f11,	%f7
	fstoi	%f7,	%f29
	subcc	%i7,	0x1B5B,	%g5
	fmovde	%xcc,	%f11,	%f18
loop_972:
	ld	[%l7 + 0x14],	%f23
	bcc	%icc,	loop_973
	edge8	%l0,	%i0,	%o2
	fpack16	%f30,	%f14
	fbe,a	%fcc0,	loop_974
loop_973:
	bn,a,pt	%xcc,	loop_975
	umul	%i5,	0x060B,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_974:
	tn	%icc,	0x7
loop_975:
	movrgz	%i1,	%o5,	%g7
	movgu	%icc,	%g4,	%l2
	fbule,a	%fcc2,	loop_976
	movgu	%xcc,	%o3,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f3,	%f7
loop_976:
	tne	%icc,	0x3
	nop
	setx	0x7C34F9F8CF82F387,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x0B7356F3E7625CBC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f12,	%f22
	fmovd	%f12,	%f28
	tle	%xcc,	0x3
	alignaddr	%g2,	%g6,	%o1
	fpackfix	%f6,	%f0
	smulcc	%o7,	%i2,	%l4
	fble	%fcc1,	loop_977
	sth	%l3,	[%l7 + 0x24]
	be,a	loop_978
	and	%o6,	0x02E7,	%g1
loop_977:
	stbar
	orcc	%g3,	0x1295,	%o4
loop_978:
	alignaddrl	%l1,	%i3,	%i4
	edge8	%i6,	%o0,	%i7
	ta	%icc,	0x1
	sdiv	%l0,	0x029A,	%i0
	udivcc	%g5,	0x091E,	%o2
	tge	%icc,	0x0
	fmovdg	%xcc,	%f1,	%f5
	fandnot1s	%f15,	%f23,	%f2
	fmovrdne	%l6,	%f10,	%f2
	bneg	loop_979
	andn	%i5,	0x1154,	%o5
	set	0x48, %o7
	swapa	[%l7 + %o7] 0x88,	%i1
loop_979:
	andncc	%g7,	%g4,	%l2
	udivx	%l5,	0x1BDB,	%o3
	tne	%icc,	0x0
	nop
	setx	0x72CECB9CB7843500,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x9F2A9597C0988161,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f16,	%f24
	edge8n	%g2,	%g6,	%o7
	fones	%f31
	fmovrde	%o1,	%f24,	%f24
	movcs	%xcc,	%i2,	%l3
	be,a,pn	%icc,	loop_980
	fandnot1s	%f1,	%f21,	%f0
	fnegd	%f16,	%f16
	edge16l	%l4,	%g1,	%g3
loop_980:
	fpack32	%f28,	%f26,	%f26
	fbue	%fcc1,	loop_981
	and	%o4,	0x197A,	%o6
	fbul,a	%fcc0,	loop_982
	fmovdvs	%xcc,	%f19,	%f5
loop_981:
	movgu	%xcc,	%l1,	%i4
	mulscc	%i3,	%i6,	%i7
loop_982:
	fmuld8ulx16	%f17,	%f27,	%f2
	set	0x3C, %g6
	stwa	%l0,	[%l7 + %g6] 0x15
	smulcc	%o0,	0x1E38,	%i0
	fmul8x16	%f24,	%f2,	%f24
	bg,a,pt	%xcc,	loop_983
	fmovsa	%icc,	%f17,	%f3
	movrlz	%o2,	%g5,	%i5
	bshuffle	%f24,	%f14,	%f8
loop_983:
	subc	%o5,	%l6,	%i1
	array8	%g4,	%l2,	%g7
	flush	%l7 + 0x5C
	nop
	set	0x45, %i2
	stb	%o3,	[%l7 + %i2]
	tn	%xcc,	0x6
	tge	%xcc,	0x6
	edge32ln	%l5,	%g6,	%g2
	tneg	%xcc,	0x0
	fnors	%f0,	%f14,	%f1
	andn	%o1,	%o7,	%l3
	edge32n	%i2,	%l4,	%g1
	sub	%g3,	%o4,	%o6
	fand	%f22,	%f14,	%f30
	fmovrslez	%l1,	%f13,	%f9
	call	loop_984
	movcs	%xcc,	%i3,	%i6
	fbg	%fcc0,	loop_985
	std	%f16,	[%l7 + 0x18]
loop_984:
	movpos	%icc,	%i7,	%i4
	nop
	setx	loop_986,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_985:
	membar	0x3F
	ble,pt	%icc,	loop_987
	edge32n	%o0,	%i0,	%o2
loop_986:
	ldd	[%l7 + 0x40],	%f12
	srl	%g5,	0x11,	%i5
loop_987:
	fornot1s	%f30,	%f12,	%f30
	edge8l	%l0,	%o5,	%l6
	tleu	%xcc,	0x2
	orcc	%i1,	0x16B5,	%g4
	udivx	%l2,	0x0FEC,	%g7
	array32	%l5,	%o3,	%g2
	fcmple16	%f10,	%f16,	%o1
	movrlez	%o7,	0x1BC,	%l3
	fandnot1s	%f14,	%f30,	%f15
	fmovs	%f8,	%f10
	ldstub	[%l7 + 0x13],	%g6
	tn	%icc,	0x2
	fmovd	%f28,	%f18
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x27] %asi,	%l4
	movcc	%xcc,	%g1,	%g3
	fmovrslez	%i2,	%f0,	%f12
	move	%icc,	%o6,	%l1
	addc	%o4,	0x1AA5,	%i3
	nop
	setx	loop_988,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%i6,	%i4,	%o0
	edge8n	%i7,	%o2,	%i0
	udivcc	%i5,	0x0DD9,	%l0
loop_988:
	tcc	%icc,	0x2
	fmovsneg	%xcc,	%f21,	%f30
	array32	%g5,	%l6,	%o5
	popc	0x055A,	%g4
	movrlz	%l2,	0x158,	%g7
	fmovdl	%icc,	%f1,	%f8
	fbe	%fcc2,	loop_989
	bn	%xcc,	loop_990
	lduw	[%l7 + 0x40],	%i1
	sll	%o3,	%l5,	%o1
loop_989:
	movne	%xcc,	%g2,	%o7
loop_990:
	tpos	%icc,	0x0
	sub	%l3,	%l4,	%g6
	fbue,a	%fcc2,	loop_991
	movre	%g3,	%g1,	%o6
	movleu	%xcc,	%i2,	%l1
	sll	%o4,	0x1B,	%i6
loop_991:
	srax	%i4,	0x05,	%i3
	movcc	%icc,	%i7,	%o0
	nop
	setx	0x24D19306,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f9
	orn	%i0,	%o2,	%l0
	brgez,a	%i5,	loop_992
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f10,	%f10
	addc	%l6,	%o5,	%g5
loop_992:
	brgz,a	%g4,	loop_993
	st	%f22,	[%l7 + 0x7C]
	subccc	%l2,	0x1E22,	%i1
	movg	%icc,	%o3,	%l5
loop_993:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x19,	 0x0
	fba	%fcc0,	loop_994
	fmovsa	%xcc,	%f5,	%f12
	fbl,a	%fcc2,	loop_995
	movrlez	%o7,	%l3,	%g2
loop_994:
	addc	%g6,	%g3,	%l4
	popc	%g1,	%i2
loop_995:
	fcmpeq16	%f8,	%f6,	%l1
	orn	%o6,	0x11C9,	%o4
	array16	%i4,	%i6,	%i3
	tcc	%icc,	0x4
	movrlez	%o0,	%i7,	%o2
	fzeros	%f16
	fmovde	%xcc,	%f14,	%f12
	nop
	setx	0x6C5387D242B8D06B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2748353EE5DB7273,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f10,	%f14
	fbl,a	%fcc2,	loop_996
	movg	%xcc,	%l0,	%i0
	smul	%l6,	%o5,	%i5
	subcc	%g5,	0x0F79,	%g4
loop_996:
	flush	%l7 + 0x0C
	sra	%l2,	%o3,	%i1
	sethi	0x0AA7,	%o1
	fors	%f24,	%f15,	%f9
	fmovdgu	%icc,	%f15,	%f16
	ta	%xcc,	0x6
	bvs,a,pn	%icc,	loop_997
	fbg,a	%fcc0,	loop_998
	taddcctv	%g7,	%o7,	%l3
	wr	%g0,	0xe3,	%asi
	stba	%g2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_997:
	bleu,pn	%xcc,	loop_999
loop_998:
	movcs	%xcc,	%g6,	%g3
	set	0x2C, %i1
	stba	%l5,	[%l7 + %i1] 0x18
loop_999:
	movpos	%xcc,	%l4,	%g1
	edge16	%i2,	%l1,	%o4
	movne	%icc,	%i4,	%o6
	for	%f30,	%f6,	%f6
	fbue	%fcc1,	loop_1000
	fpadd16	%f22,	%f8,	%f6
	set	0x28, %l3
	lda	[%l7 + %l3] 0x80,	%f11
loop_1000:
	stw	%i3,	[%l7 + 0x78]
	movcc	%icc,	%i6,	%o0
	fpmerge	%f0,	%f23,	%f26
	wr	%g0,	0x81,	%asi
	stba	%i7,	[%l7 + 0x48] %asi
	udiv	%l0,	0x1A74,	%i0
	bvs,a	%icc,	loop_1001
	sra	%l6,	%o2,	%i5
	bg,a,pn	%icc,	loop_1002
	udivx	%g5,	0x1BDD,	%o5
loop_1001:
	tcs	%icc,	0x3
	tg	%xcc,	0x0
loop_1002:
	edge32	%l2,	%o3,	%i1
	alignaddr	%g4,	%g7,	%o1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o7
	bvc,pt	%icc,	loop_1003
	edge32ln	%g2,	%l3,	%g3
	xor	%l5,	0x16AA,	%g6
	fnot2	%f2,	%f24
loop_1003:
	umul	%l4,	%g1,	%l1
	fcmpgt16	%f28,	%f20,	%o4
	fmovdleu	%xcc,	%f12,	%f2
	tvs	%xcc,	0x1
	edge8l	%i4,	%i2,	%i3
	taddcc	%o6,	0x0E80,	%o0
	fpmerge	%f3,	%f29,	%f4
	set	0x2F, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i6
	set	0x76, %l4
	stha	%i7,	[%l7 + %l4] 0x15
	bn,a,pt	%icc,	loop_1004
	alignaddr	%l0,	%i0,	%o2
	smulcc	%l6,	0x1517,	%g5
	addccc	%i5,	%l2,	%o3
loop_1004:
	fnands	%f11,	%f7,	%f20
	movne	%icc,	%o5,	%i1
	xor	%g4,	0x1364,	%g7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o7
	movn	%xcc,	%o1,	%l3
	fmovsg	%icc,	%f12,	%f29
	fmovse	%xcc,	%f21,	%f15
	edge8n	%g3,	%l5,	%g6
	ldsw	[%l7 + 0x3C],	%l4
	nop
	fitos	%f1,	%f11
	fstod	%f11,	%f12
	bge,a,pt	%xcc,	loop_1005
	subc	%g1,	0x1CE9,	%g2
	flush	%l7 + 0x08
	edge8	%o4,	%l1,	%i2
loop_1005:
	sethi	0x14E7,	%i3
	umulcc	%o6,	%o0,	%i4
	fand	%f0,	%f18,	%f0
	bge	loop_1006
	array8	%i7,	%i6,	%i0
	nop
	setx	0xD265665768079311,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f30
	fornot2	%f4,	%f6,	%f26
loop_1006:
	nop
	setx	0xF4B62E16F6BDCC77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f4
	fpsub32	%f0,	%f8,	%f18
	set	0x5C, %g3
	stwa	%l0,	[%l7 + %g3] 0x0c
	srlx	%o2,	%g5,	%l6
	fbn,a	%fcc3,	loop_1007
	edge16	%l2,	%i5,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i1,	%o5,	%g4
loop_1007:
	edge8l	%o7,	%o1,	%l3
	bg,a	loop_1008
	orncc	%g3,	%l5,	%g6
	bleu,a	loop_1009
	smul	%l4,	%g1,	%g2
loop_1008:
	flush	%l7 + 0x0C
	movcs	%xcc,	%o4,	%g7
loop_1009:
	edge16	%i2,	%l1,	%o6
	edge8l	%o0,	%i3,	%i4
	set	0x6C, %g7
	stwa	%i6,	[%l7 + %g7] 0x0c
	or	%i7,	%l0,	%i0
	sdivcc	%o2,	0x0A98,	%l6
	addc	%g5,	%i5,	%l2
	fmul8sux16	%f2,	%f4,	%f24
	fpsub32s	%f12,	%f5,	%f13
	edge16ln	%i1,	%o3,	%o5
	nop
	fitos	%f0,	%f10
	fstod	%f10,	%f2
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	set	0x7C, %l6
	sta	%f27,	[%l7 + %l6] 0x81
	tneg	%xcc,	0x4
	fmuld8sux16	%f7,	%f1,	%f8
	bn	loop_1010
	movrgz	%o1,	%l3,	%o7
	movgu	%xcc,	%l5,	%g6
	fnegd	%f12,	%f18
loop_1010:
	nop
	set	0x64, %i3
	ldsha	[%l7 + %i3] 0x18,	%l4
	nop
	setx	0x41FAF1E467BC3A7A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFF43763AC87E16C8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f2,	%f26
	movne	%xcc,	%g3,	%g1
	fmovdg	%icc,	%f26,	%f8
	alignaddrl	%o4,	%g2,	%i2
	mulscc	%g7,	0x10D7,	%l1
	edge8n	%o0,	%o6,	%i3
	addccc	%i4,	0x0268,	%i6
	subccc	%l0,	%i0,	%o2
	movge	%icc,	%i7,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	0x09,	%l2
	ldub	[%l7 + 0x46],	%i1
	brgez,a	%o3,	loop_1011
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f16,	%f23,	%f6
	movcs	%icc,	%i5,	%o5
loop_1011:
	tl	%xcc,	0x0
	nop
	setx	0x19339B05E60633A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7F3C12191E230BBA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f30,	%f30
	tne	%icc,	0x3
	tsubcc	%g4,	%o1,	%l3
	fbug	%fcc0,	loop_1012
	and	%o7,	0x04EF,	%l5
	fmovdcc	%icc,	%f22,	%f29
	xor	%l4,	%g6,	%g3
loop_1012:
	popc	%g1,	%o4
	fbu	%fcc3,	loop_1013
	fcmpgt16	%f12,	%f8,	%i2
	edge32l	%g2,	%l1,	%o0
	orcc	%o6,	0x1AD3,	%g7
loop_1013:
	movcs	%icc,	%i3,	%i4
	tvc	%xcc,	0x1
	alignaddrl	%i6,	%l0,	%i0
	fpack16	%f28,	%f28
	sdivx	%i7,	0x152B,	%g5
	ldx	[%l7 + 0x40],	%l6
	tge	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
	fnors	%f13,	%f21,	%f24
	orcc	%i1,	0x1BA1,	%l2
	te	%icc,	0x3
	nop
	setx loop_1014, %l0, %l1
	jmpl %l1, %i5
	taddcctv	%o3,	0x00C9,	%o5
	fcmpne32	%f28,	%f2,	%g4
	set	0x58, %l1
	swapa	[%l7 + %l1] 0x80,	%l3
loop_1014:
	xor	%o7,	0x139F,	%l5
	taddcc	%o1,	0x19CE,	%l4
	nop
	setx	0x149F2E7E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f3
	tle	%icc,	0x5
	edge16ln	%g6,	%g1,	%o4
	stbar
	xorcc	%i2,	0x1265,	%g3
	movgu	%icc,	%g2,	%l1
	ldd	[%l7 + 0x78],	%f22
	orn	%o0,	0x0A08,	%o6
	fmovsvc	%icc,	%f6,	%f6
	addcc	%g7,	%i4,	%i6
	nop
	set	0x18, %g1
	lduw	[%l7 + %g1],	%l0
	movpos	%xcc,	%i0,	%i3
	tpos	%icc,	0x0
	edge8n	%g5,	%i7,	%o2
	fpadd16s	%f17,	%f30,	%f17
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1C] %asi,	%l6
	fpsub32	%f24,	%f6,	%f4
	smul	%l2,	0x1A69,	%i5
	movn	%xcc,	%o3,	%i1
	brz,a	%o5,	loop_1015
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f28,	%f4
	sethi	0x1A96,	%l3
loop_1015:
	sethi	0x0DF2,	%o7
	fmovdleu	%xcc,	%f30,	%f0
	xor	%l5,	%o1,	%l4
	smulcc	%g6,	0x1B17,	%g4
	bcs,a,pt	%icc,	loop_1016
	movcs	%xcc,	%g1,	%i2
	orncc	%g3,	0x020C,	%g2
	sethi	0x05F7,	%o4
loop_1016:
	srax	%l1,	%o0,	%o6
	bl,pt	%xcc,	loop_1017
	bn,pn	%xcc,	loop_1018
	fpack32	%f26,	%f28,	%f30
	tsubcc	%g7,	0x0D5A,	%i4
loop_1017:
	udivcc	%i6,	0x0596,	%i0
loop_1018:
	sethi	0x14DD,	%i3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x54] %asi,	%g5
	add	%i7,	%o2,	%l6
	bl,a,pt	%xcc,	loop_1019
	array32	%l0,	%l2,	%o3
	nop
	setx	loop_1020,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos	%icc,	loop_1021
loop_1019:
	addcc	%i5,	%i1,	%l3
	edge32l	%o7,	%l5,	%o5
loop_1020:
	swap	[%l7 + 0x24],	%l4
loop_1021:
	fmovdgu	%xcc,	%f19,	%f3
	ta	%icc,	0x5
	andncc	%o1,	%g6,	%g4
	tvc	%icc,	0x7
	udivx	%g1,	0x04AD,	%i2
	movge	%icc,	%g2,	%g3
	fmovdvs	%xcc,	%f8,	%f14
	membar	0x01
	bshuffle	%f16,	%f28,	%f26
	ble,a	%xcc,	loop_1022
	sdiv	%o4,	0x1495,	%l1
	movg	%icc,	%o6,	%g7
	edge8ln	%o0,	%i4,	%i0
loop_1022:
	tsubcc	%i6,	%g5,	%i7
	bvc,a	%xcc,	loop_1023
	fbuge	%fcc0,	loop_1024
	movl	%xcc,	%o2,	%l6
	add	%l0,	%l2,	%o3
loop_1023:
	nop
	set	0x12, %l2
	stba	%i3,	[%l7 + %l2] 0x2a
	membar	#Sync
loop_1024:
	fbu	%fcc1,	loop_1025
	xnor	%i1,	%i5,	%o7
	ta	%icc,	0x2
	tsubcctv	%l5,	%o5,	%l3
loop_1025:
	srl	%l4,	0x15,	%g6
	edge8n	%o1,	%g1,	%i2
	umul	%g4,	%g2,	%o4
	sethi	0x092A,	%g3
	nop
	setx	0xC06320F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	te	%icc,	0x1
	xorcc	%o6,	%g7,	%l1
	flush	%l7 + 0x30
	movge	%icc,	%i4,	%i0
	fmovrse	%i6,	%f28,	%f13
	fandnot1s	%f10,	%f26,	%f13
	udiv	%o0,	0x1D2F,	%i7
	tl	%icc,	0x5
	fmovdvs	%icc,	%f2,	%f9
	array8	%o2,	%g5,	%l6
	fmovrdlez	%l2,	%f6,	%f16
	edge16	%o3,	%i3,	%i1
	ta	%icc,	0x2
	subcc	%l0,	%o7,	%l5
	add	%o5,	0x14FB,	%i5
	fpadd16	%f8,	%f16,	%f0
	orn	%l3,	%l4,	%o1
	tsubcc	%g1,	0x01D4,	%i2
	fbn,a	%fcc1,	loop_1026
	brnz,a	%g6,	loop_1027
	sdivx	%g4,	0x051C,	%g2
	tgu	%xcc,	0x7
loop_1026:
	tg	%icc,	0x1
loop_1027:
	fpadd32s	%f11,	%f7,	%f2
	edge16ln	%o4,	%o6,	%g7
	array8	%g3,	%i4,	%i0
	movcc	%icc,	%i6,	%o0
	tl	%xcc,	0x6
	fbg	%fcc2,	loop_1028
	sth	%l1,	[%l7 + 0x42]
	subc	%o2,	0x0A0B,	%g5
	edge16ln	%i7,	%l2,	%o3
loop_1028:
	movvc	%xcc,	%l6,	%i3
	tl	%xcc,	0x6
	fcmpeq16	%f6,	%f26,	%i1
	brgz,a	%o7,	loop_1029
	te	%xcc,	0x0
	tleu	%icc,	0x1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l0
loop_1029:
	sdivcc	%o5,	0x0BEB,	%i5
	brgez	%l3,	loop_1030
	brgz	%l5,	loop_1031
	edge16l	%l4,	%o1,	%g1
	subccc	%i2,	%g6,	%g4
loop_1030:
	fbule	%fcc3,	loop_1032
loop_1031:
	fsrc1s	%f11,	%f13
	fcmpgt16	%f4,	%f8,	%o4
	fsrc2	%f26,	%f28
loop_1032:
	edge16l	%g2,	%o6,	%g7
	umulcc	%g3,	%i0,	%i4
	tn	%icc,	0x5
	edge32ln	%i6,	%l1,	%o0
	tle	%xcc,	0x7
	fcmpgt16	%f14,	%f18,	%o2
	fbne,a	%fcc3,	loop_1033
	movcs	%xcc,	%g5,	%l2
	fbuge	%fcc3,	loop_1034
	tn	%xcc,	0x2
loop_1033:
	array8	%i7,	%o3,	%l6
	andcc	%i3,	%o7,	%l0
loop_1034:
	fmovsa	%xcc,	%f14,	%f15
	orn	%o5,	%i5,	%i1
	bcs,a,pn	%xcc,	loop_1035
	bcc	loop_1036
	swap	[%l7 + 0x28],	%l5
	tpos	%xcc,	0x1
loop_1035:
	edge8ln	%l3,	%l4,	%g1
loop_1036:
	tcc	%xcc,	0x2
	fpack32	%f0,	%f24,	%f0
	orn	%o1,	0x0863,	%i2
	ba,a,pt	%xcc,	loop_1037
	pdist	%f2,	%f30,	%f4
	movg	%icc,	%g4,	%g6
	ble,pt	%icc,	loop_1038
loop_1037:
	fbuge,a	%fcc3,	loop_1039
	tsubcc	%g2,	0x094E,	%o4
	movge	%xcc,	%g7,	%o6
loop_1038:
	subc	%i0,	%g3,	%i6
loop_1039:
	nop
	wr	%g0,	0x19,	%asi
	stha	%i4,	[%l7 + 0x24] %asi
	stbar
	movvc	%xcc,	%o0,	%l1
	fsrc2s	%f12,	%f20
	sethi	0x178D,	%g5
	xor	%l2,	0x1C38,	%o2
	movvc	%xcc,	%o3,	%i7
	movpos	%xcc,	%i3,	%o7
	movrlez	%l6,	0x29A,	%o5
	tvc	%xcc,	0x1
	lduw	[%l7 + 0x2C],	%l0
	andn	%i1,	%i5,	%l3
	subcc	%l4,	0x0477,	%g1
	movneg	%icc,	%l5,	%i2
	movrgez	%o1,	0x24E,	%g6
	swap	[%l7 + 0x64],	%g2
	mulx	%g4,	0x04E9,	%g7
	move	%xcc,	%o6,	%o4
	fblg	%fcc2,	loop_1040
	fmovd	%f24,	%f8
	ldub	[%l7 + 0x48],	%i0
	fbn	%fcc2,	loop_1041
loop_1040:
	ldub	[%l7 + 0x31],	%i6
	movle	%icc,	%g3,	%o0
	nop
	setx	0x3C593EED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f31
loop_1041:
	array16	%l1,	%i4,	%l2
	fpsub32s	%f25,	%f24,	%f14
	fba,a	%fcc3,	loop_1042
	xorcc	%o2,	%g5,	%i7
	call	loop_1043
	fornot2	%f4,	%f24,	%f4
loop_1042:
	ta	%icc,	0x4
	nop
	fitod	%f0,	%f18
loop_1043:
	bgu,a	loop_1044
	movle	%xcc,	%o3,	%o7
	edge8n	%i3,	%o5,	%l0
	nop
	setx	0x7B80FE98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f15
loop_1044:
	sub	%i1,	%l6,	%l3
	fmovdne	%icc,	%f22,	%f4
	tle	%xcc,	0x5
	edge8n	%l4,	%g1,	%l5
	fbn	%fcc2,	loop_1045
	taddcctv	%i2,	%i5,	%o1
	sdivcc	%g2,	0x0BD2,	%g4
	nop
	setx	0xA7D0D9EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xC80ED025,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f19,	%f8
loop_1045:
	fornot2s	%f6,	%f10,	%f27
	edge8l	%g7,	%g6,	%o6
	or	%i0,	0x1478,	%o4
	pdist	%f14,	%f10,	%f20
	mulx	%g3,	0x1588,	%o0
	fnegs	%f14,	%f9
	ta	%xcc,	0x0
	movvs	%xcc,	%i6,	%i4
	tg	%xcc,	0x4
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f6
	movvs	%icc,	%l2,	%o2
	edge32	%l1,	%i7,	%g5
	tsubcctv	%o7,	0x08B5,	%i3
	sllx	%o5,	%o3,	%i1
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x0C
	te	%icc,	0x0
	set	0x2C, %l5
	lda	[%l7 + %l5] 0x14,	%f10
	movpos	%icc,	%l6,	%l0
	ta	%icc,	0x5
	fxnors	%f14,	%f11,	%f1
	edge16n	%l4,	%g1,	%l5
	nop
	setx	0x1FA847AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f20
	movre	%l3,	0x0AC,	%i5
	movvs	%icc,	%i2,	%g2
	array16	%o1,	%g4,	%g7
	fornot2	%f24,	%f30,	%f26
	movne	%xcc,	%g6,	%o6
	ldstub	[%l7 + 0x62],	%o4
	edge16n	%g3,	%i0,	%i6
	edge16ln	%o0,	%l2,	%o2
	fmovrde	%i4,	%f26,	%f10
	array8	%i7,	%g5,	%o7
	sdivcc	%i3,	0x037C,	%o5
	std	%f6,	[%l7 + 0x60]
	movneg	%icc,	%o3,	%i1
	fmul8sux16	%f4,	%f30,	%f10
	fmuld8ulx16	%f29,	%f29,	%f12
	fsrc2	%f22,	%f30
	movrne	%l1,	0x218,	%l0
	smulcc	%l6,	%g1,	%l5
	fcmpne16	%f14,	%f12,	%l3
	fbule	%fcc3,	loop_1046
	tpos	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i5,	%i2
loop_1046:
	fmovdl	%icc,	%f19,	%f28
	fmul8ulx16	%f30,	%f28,	%f18
	andn	%g2,	%l4,	%g4
	brlez,a	%o1,	loop_1047
	edge8n	%g6,	%o6,	%o4
	movne	%icc,	%g7,	%g3
	fmovrdlez	%i6,	%f22,	%f18
loop_1047:
	call	loop_1048
	stx	%i0,	[%l7 + 0x38]
	set	0x6C, %g2
	sta	%f17,	[%l7 + %g2] 0x89
loop_1048:
	fmovrdgz	%l2,	%f4,	%f4
	array32	%o0,	%i4,	%i7
	edge16	%o2,	%o7,	%g5
	movrlez	%o5,	%i3,	%i1
	tcc	%icc,	0x2
	nop
	setx	0x65D5AF61,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x1EE77242,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f6,	%f17
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%o3
	set	0x50, %i6
	lduwa	[%l7 + %i6] 0x19,	%l0
	tg	%xcc,	0x1
	edge32	%l6,	%l1,	%g1
	xorcc	%l3,	0x0F75,	%l5
	movne	%xcc,	%i2,	%i5
	andcc	%g2,	%g4,	%l4
	set	0x60, %o4
	swapa	[%l7 + %o4] 0x0c,	%o1
	sra	%o6,	0x0E,	%g6
	sir	0x1539
	movne	%xcc,	%g7,	%o4
	movcc	%xcc,	%i6,	%g3
	edge16	%l2,	%i0,	%i4
	fmul8sux16	%f10,	%f2,	%f8
	movrlz	%i7,	0x2F2,	%o2
	edge8l	%o7,	%g5,	%o5
	tn	%xcc,	0x7
	subcc	%o0,	0x0413,	%i3
	movre	%o3,	%l0,	%l6
	movneg	%xcc,	%i1,	%l1
	fnand	%f28,	%f0,	%f8
	fmovdl	%icc,	%f29,	%f26
	xorcc	%g1,	0x0379,	%l3
	xor	%l5,	%i2,	%g2
	orn	%i5,	0x02F8,	%l4
	fzeros	%f1
	xnorcc	%o1,	%o6,	%g4
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmple16	%f2,	%f12,	%g6
	tsubcctv	%o4,	0x1601,	%g7
	fandnot2	%f18,	%f6,	%f22
	mulscc	%g3,	0x12D3,	%i6
	smulcc	%i0,	0x0851,	%l2
	edge16ln	%i4,	%o2,	%o7
	and	%g5,	0x00A9,	%o5
	smulcc	%i7,	0x0762,	%i3
	alignaddr	%o0,	%o3,	%l0
	edge16	%i1,	%l6,	%g1
	ble,a	%icc,	loop_1049
	fmovdne	%icc,	%f9,	%f21
	fmovdl	%icc,	%f5,	%f26
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%l1
loop_1049:
	orncc	%l3,	0x08C0,	%i2
	tvc	%xcc,	0x2
	udivcc	%g2,	0x107C,	%l5
	fbne,a	%fcc0,	loop_1050
	smul	%i5,	0x0119,	%o1
	fcmpne16	%f22,	%f12,	%l4
	umulcc	%o6,	%g4,	%o4
loop_1050:
	subcc	%g7,	%g6,	%g3
	sub	%i0,	0x046B,	%i6
	movn	%xcc,	%l2,	%o2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%o7
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%o5
	mulscc	%i7,	%i3,	%g5
	fmovsa	%xcc,	%f5,	%f11
	andcc	%o0,	%l0,	%o3
	nop
	setx	0x204D334F,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	popc	%i1,	%g1
	sir	0x00A1
	set	0x5C, %i5
	swapa	[%l7 + %i5] 0x80,	%l1
	movn	%icc,	%l6,	%l3
	set	0x38, %o0
	lda	[%l7 + %o0] 0x10,	%f16
	wr	%g0,	0x80,	%asi
	stba	%i2,	[%l7 + 0x1B] %asi
	fone	%f0
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	fcmpeq16	%f30,	%f0,	%g2
	bg,pn	%icc,	loop_1051
	array16	%i5,	%l5,	%l4
	set	0x7D, %l0
	ldstuba	[%l7 + %l0] 0x11,	%o1
loop_1051:
	movne	%icc,	%g4,	%o6
	bne	%xcc,	loop_1052
	stx	%o4,	[%l7 + 0x78]
	movvs	%icc,	%g6,	%g3
	xnorcc	%g7,	0x10A9,	%i6
loop_1052:
	lduw	[%l7 + 0x6C],	%i0
	set	0x38, %i4
	lduba	[%l7 + %i4] 0x88,	%o2
	subcc	%l2,	%i4,	%o5
	fxnors	%f3,	%f28,	%f28
	fornot1s	%f23,	%f5,	%f16
	move	%icc,	%o7,	%i3
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	bleu,a	loop_1053
	addc	%i7,	0x0626,	%g5
	fandnot1	%f16,	%f26,	%f0
	fsrc2s	%f12,	%f18
loop_1053:
	xnorcc	%l0,	0x13A0,	%o0
	fbu	%fcc1,	loop_1054
	edge16n	%i1,	%g1,	%o3
	xnor	%l1,	%l3,	%l6
	std	%f2,	[%l7 + 0x58]
loop_1054:
	fxor	%f22,	%f18,	%f24
	brlz	%g2,	loop_1055
	edge32ln	%i5,	%l5,	%l4
	sdivx	%o1,	0x117D,	%i2
	brlez	%g4,	loop_1056
loop_1055:
	tne	%icc,	0x3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x0C] %asi,	%f12
loop_1056:
	add	%o6,	%o4,	%g6
	and	%g3,	0x0210,	%i6
	bn	%icc,	loop_1057
	fbue	%fcc1,	loop_1058
	udivcc	%g7,	0x0DC8,	%o2
	srl	%l2,	0x1F,	%i4
loop_1057:
	tneg	%xcc,	0x0
loop_1058:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i0
	ld	[%l7 + 0x7C],	%f29
	nop
	setx	0xB11ACD50,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x5B84A28D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f26,	%f17
	edge32	%o7,	%o5,	%i3
	fcmple16	%f28,	%f28,	%g5
	edge32ln	%i7,	%o0,	%i1
	tneg	%xcc,	0x0
	tneg	%xcc,	0x4
	tg	%xcc,	0x2
	brlz	%g1,	loop_1059
	ldub	[%l7 + 0x70],	%l0
	tleu	%icc,	0x7
	srlx	%l1,	0x0A,	%l3
loop_1059:
	fmovde	%xcc,	%f27,	%f8
	taddcctv	%l6,	0x135A,	%g2
	fnot2s	%f16,	%f0
	fone	%f16
	edge32n	%o3,	%i5,	%l4
	mova	%icc,	%o1,	%l5
	edge8ln	%i2,	%g4,	%o6
	srl	%o4,	%g6,	%g3
	faligndata	%f8,	%f24,	%f4
	edge32n	%g7,	%i6,	%l2
	movpos	%icc,	%i4,	%o2
	fmovdgu	%xcc,	%f14,	%f22
	addccc	%i0,	0x00AB,	%o7
	tne	%xcc,	0x2
	alignaddrl	%i3,	%g5,	%i7
	fbul,a	%fcc3,	loop_1060
	movre	%o0,	%o5,	%i1
	srax	%g1,	%l1,	%l0
	tle	%xcc,	0x6
loop_1060:
	fmovsgu	%xcc,	%f26,	%f12
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x0c,	 0x0
	fpadd16s	%f13,	%f3,	%f12
	fandnot2s	%f16,	%f6,	%f5
	bne	loop_1061
	fcmpeq32	%f4,	%f4,	%g2
	edge16	%o3,	%l6,	%l4
	ldsb	[%l7 + 0x1D],	%i5
loop_1061:
	taddcctv	%o1,	%l5,	%i2
	fornot1	%f28,	%f4,	%f6
	bl,pn	%xcc,	loop_1062
	fbl,a	%fcc2,	loop_1063
	xor	%g4,	%o6,	%o4
	fsrc2	%f8,	%f4
loop_1062:
	fabss	%f12,	%f21
loop_1063:
	edge8ln	%g3,	%g6,	%i6
	fnegs	%f2,	%f15
	stbar
	bgu,a,pt	%xcc,	loop_1064
	movcc	%xcc,	%g7,	%l2
	mulx	%o2,	%i0,	%o7
	movg	%xcc,	%i4,	%i3
loop_1064:
	movrgz	%g5,	0x312,	%o0
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x14,	 0x1
	fba,a	%fcc0,	loop_1065
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i1,	%o5,	%g1
	sir	0x13DF
loop_1065:
	orn	%l0,	0x0E98,	%l1
	orncc	%g2,	0x168D,	%o3
	fpadd16s	%f18,	%f1,	%f26
	movge	%icc,	%l6,	%l4
	sllx	%i5,	0x1C,	%o1
	fsrc2s	%f22,	%f8
	smul	%l3,	%l5,	%g4
	ta	%xcc,	0x2
	nop
	setx	0x7AD5B60B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xE7BC82C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f21,	%f5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o6,	%i2
	fbn	%fcc2,	loop_1066
	fmuld8ulx16	%f3,	%f25,	%f16
	fbug,a	%fcc2,	loop_1067
	ba	%icc,	loop_1068
loop_1066:
	sdivx	%g3,	0x0473,	%o4
	fmovrsne	%i6,	%f1,	%f26
loop_1067:
	ta	%icc,	0x6
loop_1068:
	tl	%xcc,	0x0
	or	%g7,	%l2,	%g6
	tle	%icc,	0x3
	andn	%o2,	%o7,	%i0
	movcc	%xcc,	%i3,	%i4
	fmul8ulx16	%f10,	%f8,	%f12
	movpos	%icc,	%o0,	%g5
	tvc	%xcc,	0x5
	set	0x40, %g4
	ldsha	[%l7 + %g4] 0x88,	%i7
	move	%icc,	%i1,	%o5
	addcc	%g1,	0x05EC,	%l1
	tle	%xcc,	0x6
	edge32ln	%g2,	%l0,	%o3
	fornot2s	%f12,	%f1,	%f20
	be	%icc,	loop_1069
	addcc	%l4,	%l6,	%i5
	tge	%icc,	0x5
	edge16n	%o1,	%l3,	%g4
loop_1069:
	sllx	%l5,	0x0B,	%o6
	edge8ln	%g3,	%o4,	%i2
	tg	%icc,	0x5
	sdivcc	%i6,	0x098A,	%g7
	set	0x46, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l2
	orcc	%g6,	0x0266,	%o2
	fsrc1s	%f23,	%f13
	fmovrdgz	%i0,	%f2,	%f14
	movrlez	%o7,	0x23F,	%i4
	bpos,a,pt	%icc,	loop_1070
	sdivx	%o0,	0x0269,	%i3
	edge8n	%i7,	%i1,	%o5
	stx	%g1,	[%l7 + 0x10]
loop_1070:
	addccc	%l1,	%g2,	%l0
	tge	%icc,	0x4
	stbar
	tl	%xcc,	0x0
	sub	%g5,	0x1D70,	%o3
	xnor	%l6,	%i5,	%o1
	andcc	%l4,	%g4,	%l5
	sra	%o6,	%g3,	%o4
	fornot2s	%f30,	%f3,	%f27
	movvs	%icc,	%l3,	%i6
	array16	%g7,	%i2,	%g6
	sub	%o2,	%i0,	%l2
	fxnor	%f16,	%f12,	%f10
	xnorcc	%o7,	%o0,	%i4
	movpos	%xcc,	%i7,	%i3
	fors	%f4,	%f25,	%f3
	edge16	%i1,	%o5,	%l1
	brz	%g2,	loop_1071
	edge16l	%l0,	%g1,	%g5
	membar	0x69
	movne	%icc,	%l6,	%i5
loop_1071:
	fbue	%fcc0,	loop_1072
	tgu	%icc,	0x6
	edge32	%o3,	%o1,	%l4
	fnor	%f6,	%f30,	%f8
loop_1072:
	tvs	%icc,	0x0
	bcs	loop_1073
	movrlz	%g4,	%l5,	%g3
	fmovrsgz	%o6,	%f14,	%f18
	orcc	%o4,	%l3,	%i6
loop_1073:
	nop
	setx	0x8B72E731,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f19
	tg	%icc,	0x6
	movrgez	%g7,	%i2,	%g6
	tneg	%icc,	0x4
	set	0x30, %o3
	stxa	%o2,	[%l7 + %o3] 0x89
	nop
	setx	0x1C1FF3F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x1CC8B1CF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f6,	%f14
	movvs	%xcc,	%l2,	%o7
	tsubcc	%i0,	%o0,	%i4
	subcc	%i7,	0x11EF,	%i1
	taddcc	%o5,	0x1B83,	%l1
	nop
	fitos	%f12,	%f9
	fstoi	%f9,	%f20
	movre	%g2,	0x247,	%l0
	movn	%xcc,	%g1,	%i3
	xnorcc	%l6,	%g5,	%i5
	fmovsvc	%xcc,	%f7,	%f5
	fble,a	%fcc0,	loop_1074
	bshuffle	%f14,	%f12,	%f0
	mova	%xcc,	%o1,	%l4
	set	0x56, %g6
	ldsha	[%l7 + %g6] 0x10,	%o3
loop_1074:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4E] %asi,	%l5
	bgu,pt	%xcc,	loop_1075
	fnot1	%f24,	%f6
	orn	%g4,	0x0EA7,	%o6
	tneg	%icc,	0x4
loop_1075:
	edge16l	%o4,	%l3,	%i6
	fmovrdlz	%g3,	%f28,	%f22
	fcmple16	%f2,	%f14,	%g7
	fbu	%fcc1,	loop_1076
	bleu,a	loop_1077
	bne,pt	%xcc,	loop_1078
	movre	%i2,	0x36C,	%g6
loop_1076:
	edge8ln	%l2,	%o2,	%o7
loop_1077:
	fabss	%f22,	%f27
loop_1078:
	bne	%icc,	loop_1079
	fcmpne32	%f28,	%f2,	%o0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x58] %asi,	%f20
loop_1079:
	movre	%i4,	%i7,	%i1
	ldub	[%l7 + 0x19],	%i0
	movrgez	%l1,	0x09C,	%o5
	lduh	[%l7 + 0x6E],	%l0
	udiv	%g1,	0x1549,	%g2
	nop
	setx	loop_1080,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%i3,	0x1704,	%g5
	addcc	%l6,	0x038E,	%o1
	fmovdcc	%icc,	%f0,	%f1
loop_1080:
	ble,a	loop_1081
	fba	%fcc2,	loop_1082
	movpos	%xcc,	%l4,	%o3
	fmovrdgz	%l5,	%f26,	%f30
loop_1081:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i5
loop_1082:
	sub	%g4,	0x10DC,	%o4
	nop
	setx	0xA5FA19C975317389,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA9A46B5C4167F5E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f30,	%f0
	tleu	%xcc,	0x1
	tn	%xcc,	0x1
	ta	%icc,	0x0
	movl	%xcc,	%o6,	%i6
	movcs	%icc,	%l3,	%g3
	fmovdvs	%xcc,	%f26,	%f20
	tl	%xcc,	0x2
	xnorcc	%g7,	%g6,	%l2
	edge8ln	%o2,	%o7,	%i2
	orn	%i4,	0x0B76,	%o0
	sir	0x1A73
	movne	%xcc,	%i7,	%i0
	fcmpeq32	%f16,	%f30,	%l1
	movrlez	%o5,	%i1,	%l0
	tg	%xcc,	0x7
	tcc	%icc,	0x7
	and	%g1,	0x08AE,	%g2
	umulcc	%g5,	0x19B4,	%l6
	add	%o1,	%i3,	%o3
	tcc	%icc,	0x0
	fbg	%fcc2,	loop_1083
	fbule,a	%fcc2,	loop_1084
	fnands	%f30,	%f29,	%f21
	addcc	%l5,	%i5,	%l4
loop_1083:
	movge	%xcc,	%o4,	%o6
loop_1084:
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f16
	fxtos	%f16,	%f30
	mulx	%g4,	%i6,	%g3
	smulcc	%g7,	0x1EB9,	%l3
	array32	%g6,	%l2,	%o2
	nop
	setx	0xC04A7A9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fmovse	%icc,	%f1,	%f7
	andncc	%i2,	%i4,	%o0
	fnot2	%f14,	%f30
	ldd	[%l7 + 0x68],	%o6
	edge16ln	%i0,	%i7,	%o5
	fbe,a	%fcc3,	loop_1085
	fsrc1s	%f1,	%f9
	fbu	%fcc1,	loop_1086
	addccc	%i1,	0x1913,	%l1
loop_1085:
	fmovdneg	%icc,	%f19,	%f22
	or	%g1,	0x060E,	%l0
loop_1086:
	nop
	set	0x44, %g5
	lduha	[%l7 + %g5] 0x81,	%g5
	fcmpgt32	%f20,	%f6,	%l6
	sll	%g2,	%i3,	%o1
	fmovdg	%xcc,	%f0,	%f31
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l5,	%i5,	%o3
	tn	%icc,	0x3
	bne,a,pt	%icc,	loop_1087
	bcs,pt	%xcc,	loop_1088
	fnors	%f27,	%f17,	%f29
	fmovdcs	%xcc,	%f23,	%f10
loop_1087:
	mova	%icc,	%o4,	%l4
loop_1088:
	subcc	%o6,	0x1AFB,	%g4
	tleu	%icc,	0x1
	ldd	[%l7 + 0x50],	%f12
	xnor	%g3,	0x1BD5,	%g7
	movrgez	%i6,	%g6,	%l3
	fxor	%f22,	%f14,	%f6
	fmovse	%xcc,	%f21,	%f20
	movre	%l2,	%o2,	%i4
	edge32n	%o0,	%o7,	%i2
	sethi	0x031C,	%i7
	tleu	%xcc,	0x4
	nop
	setx	loop_1089,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f6,	%f18
	fdtos	%f18,	%f30
	stw	%o5,	[%l7 + 0x38]
	nop
	fitos	%f14,	%f17
	fstox	%f17,	%f30
loop_1089:
	orn	%i1,	0x0CC8,	%l1
	udivx	%g1,	0x0F5D,	%i0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x10] %asi,	%g5
	umul	%l0,	%g2,	%i3
	edge32n	%o1,	%l6,	%l5
	mulscc	%i5,	0x055B,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o4,	0x0917,	%o6
	movcs	%icc,	%l4,	%g3
	movre	%g4,	0x0A2,	%i6
	taddcctv	%g6,	%g7,	%l3
	movcc	%icc,	%o2,	%l2
	bge	%xcc,	loop_1090
	fbe,a	%fcc0,	loop_1091
	tcc	%icc,	0x2
	fmovsleu	%icc,	%f9,	%f13
loop_1090:
	orn	%o0,	0x0CA4,	%o7
loop_1091:
	nop
	fitod	%f0,	%f18
	fdtoi	%f18,	%f19
	movgu	%xcc,	%i2,	%i7
	smul	%i4,	%i1,	%o5
	std	%f10,	[%l7 + 0x60]
	array16	%g1,	%l1,	%i0
	stx	%l0,	[%l7 + 0x60]
	ldub	[%l7 + 0x23],	%g5
	srlx	%i3,	0x15,	%g2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x50] %asi,	%o0
	and	%l5,	0x1836,	%l6
	fpsub16s	%f3,	%f24,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i5,	%o4,	%o6
	fcmpeq32	%f6,	%f4,	%o3
	nop
	setx	0x2E4DBD5BAC021649,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f4
	sdivx	%l4,	0x0143,	%g4
	fnegs	%f20,	%f23
	bcc,a,pt	%xcc,	loop_1092
	movrgez	%i6,	%g6,	%g7
	movre	%g3,	0x3F2,	%l3
	andncc	%l2,	%o2,	%o7
loop_1092:
	nop
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x89,	%o0
	sllx	%i2,	%i7,	%i1
	std	%f28,	[%l7 + 0x48]
	movvs	%xcc,	%i4,	%g1
	prefetch	[%l7 + 0x4C],	 0x3
	udivcc	%l1,	0x19FE,	%i0
	taddcctv	%l0,	0x0028,	%o5
	std	%f12,	[%l7 + 0x10]
	tgu	%icc,	0x1
	ldd	[%l7 + 0x40],	%i2
	for	%f10,	%f16,	%f16
	alignaddr	%g5,	%o1,	%l5
	fmovrslz	%g2,	%f30,	%f11
	fmuld8ulx16	%f31,	%f6,	%f2
	movgu	%xcc,	%l6,	%o4
	ldd	[%l7 + 0x58],	%f14
	subc	%i5,	0x010F,	%o3
	array8	%l4,	%g4,	%i6
	sra	%g6,	%g7,	%g3
	ldx	[%l7 + 0x50],	%l3
	orncc	%l2,	0x1EEC,	%o2
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	set	0x44, %i1
	swapa	[%l7 + %i1] 0x80,	%o7
	bl,pn	%xcc,	loop_1093
	fpackfix	%f8,	%f6
	mova	%xcc,	%o6,	%i2
	fmul8x16al	%f31,	%f28,	%f20
loop_1093:
	orncc	%i7,	0x02CE,	%i1
	edge32l	%o0,	%g1,	%l1
	fabss	%f12,	%f0
	fbe,a	%fcc0,	loop_1094
	udivcc	%i4,	0x0E89,	%i0
	movre	%o5,	%i3,	%l0
	fpsub32s	%f22,	%f16,	%f1
loop_1094:
	fnot2s	%f30,	%f3
	bneg,a	%xcc,	loop_1095
	movvc	%xcc,	%o1,	%l5
	fbl,a	%fcc3,	loop_1096
	popc	0x198D,	%g5
loop_1095:
	tge	%icc,	0x7
	fones	%f22
loop_1096:
	movvs	%xcc,	%l6,	%g2
	fmovrse	%i5,	%f21,	%f3
	udivx	%o3,	0x0012,	%l4
	movneg	%icc,	%o4,	%g4
	fcmpgt16	%f6,	%f8,	%i6
	fbn,a	%fcc3,	loop_1097
	fmovdl	%xcc,	%f24,	%f0
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1097:
	smul	%g6,	%g3,	%g7
	tvs	%icc,	0x7
	fmovsa	%icc,	%f0,	%f15
	bneg	loop_1098
	movrlez	%l3,	%l2,	%o7
	taddcctv	%o6,	%i2,	%i7
	te	%icc,	0x2
loop_1098:
	tvc	%xcc,	0x6
	taddcctv	%i1,	0x11E2,	%o0
	tn	%xcc,	0x0
	addcc	%g1,	%l1,	%o2
	set	0x10, %l3
	ldxa	[%g0 + %l3] 0x4f,	%i0
	fpadd16s	%f11,	%f31,	%f28
	call	loop_1099
	bneg,a	loop_1100
	movgu	%xcc,	%i4,	%o5
	mulx	%l0,	0x0C3D,	%i3
loop_1099:
	sub	%l5,	%o1,	%g5
loop_1100:
	bge,a	loop_1101
	edge16	%g2,	%l6,	%i5
	set	0x54, %l4
	stha	%l4,	[%l7 + %l4] 0x19
loop_1101:
	tvc	%xcc,	0x2
	set	0x40, %i0
	ldswa	[%l7 + %i0] 0x04,	%o4
	alignaddrl	%o3,	%g4,	%g6
	srlx	%g3,	0x1E,	%g7
	addc	%l3,	0x0A36,	%i6
	movg	%xcc,	%l2,	%o7
	nop
	setx loop_1102, %l0, %l1
	jmpl %l1, %o6
	movvc	%icc,	%i7,	%i2
	movvc	%xcc,	%o0,	%i1
	ldx	[%l7 + 0x38],	%l1
loop_1102:
	fmovrde	%g1,	%f8,	%f26
	fmovdle	%xcc,	%f16,	%f6
	set	0x2A, %g7
	stha	%o2,	[%l7 + %g7] 0x15
	movne	%icc,	%i4,	%i0
	call	loop_1103
	edge32n	%l0,	%i3,	%o5
	nop
	setx	0xA4E196632B558176,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x04B377317F33FF85,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f2,	%f22
	set	0x40, %l6
	stwa	%o1,	[%l7 + %l6] 0x0c
loop_1103:
	sdivx	%g5,	0x1841,	%g2
	fcmpgt16	%f20,	%f4,	%l5
	edge16l	%l6,	%l4,	%i5
	bge,pn	%xcc,	loop_1104
	nop
	setx	0x337ADC2363A2C84C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x25D93677C3E27E2D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f8,	%f8
	fmovdge	%icc,	%f9,	%f3
	fabsd	%f6,	%f2
loop_1104:
	sth	%o3,	[%l7 + 0x2C]
	fmovspos	%xcc,	%f6,	%f16
	sll	%g4,	0x03,	%o4
	fpsub16	%f18,	%f26,	%f0
	orncc	%g3,	%g6,	%g7
	edge16l	%l3,	%l2,	%o7
	movrgez	%i6,	%i7,	%i2
	fmul8sux16	%f4,	%f4,	%f16
	and	%o6,	0x0E65,	%i1
	popc	%l1,	%g1
	nop
	set	0x0C, %i3
	ldsh	[%l7 + %i3],	%o2
	fbge	%fcc3,	loop_1105
	edge16ln	%i4,	%i0,	%o0
	mova	%icc,	%l0,	%i3
	subccc	%o5,	%g5,	%g2
loop_1105:
	array8	%o1,	%l6,	%l4
	tcs	%icc,	0x6
	movrne	%i5,	%o3,	%g4
	nop
	setx loop_1106, %l0, %l1
	jmpl %l1, %o4
	add	%l5,	%g6,	%g7
	movcs	%icc,	%g3,	%l3
	andcc	%l2,	0x14AA,	%o7
loop_1106:
	tge	%xcc,	0x3
	set	0x38, %g3
	sta	%f6,	[%l7 + %g3] 0x04
	fmul8x16au	%f19,	%f10,	%f0
	tle	%icc,	0x5
	fbl	%fcc0,	loop_1107
	edge8n	%i6,	%i2,	%i7
	tvc	%icc,	0x3
	tle	%xcc,	0x5
loop_1107:
	edge16ln	%o6,	%i1,	%l1
	add	%g1,	%o2,	%i0
	fxnor	%f20,	%f14,	%f10
	sll	%i4,	0x03,	%o0
	andncc	%i3,	%o5,	%l0
	wr	%g0,	0x11,	%asi
	sta	%f21,	[%l7 + 0x70] %asi
	tle	%xcc,	0x7
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x0c,	%g2
	movne	%icc,	%o1,	%l6
	xorcc	%l4,	%i5,	%g5
	tl	%xcc,	0x3
	or	%o3,	0x060E,	%g4
	and	%o4,	%g6,	%l5
	bvc,pt	%icc,	loop_1108
	taddcctv	%g3,	%g7,	%l2
	movn	%xcc,	%l3,	%o7
	mova	%icc,	%i2,	%i7
loop_1108:
	edge8ln	%o6,	%i1,	%i6
	fbul	%fcc1,	loop_1109
	fmovrde	%g1,	%f2,	%f20
	fmovsn	%icc,	%f15,	%f22
	ldsw	[%l7 + 0x1C],	%o2
loop_1109:
	fxnors	%f30,	%f21,	%f21
	sdiv	%i0,	0x0D40,	%l1
	fmovsle	%icc,	%f21,	%f30
	taddcc	%o0,	%i4,	%i3
	ba	%xcc,	loop_1110
	fblg,a	%fcc2,	loop_1111
	fbu,a	%fcc1,	loop_1112
	fand	%f28,	%f6,	%f16
loop_1110:
	addccc	%l0,	%g2,	%o5
loop_1111:
	tcc	%xcc,	0x1
loop_1112:
	subc	%l6,	%l4,	%o1
	udivcc	%i5,	0x199F,	%o3
	and	%g4,	0x0197,	%o4
	movge	%xcc,	%g5,	%l5
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f10
	tcs	%icc,	0x7
	movge	%icc,	%g3,	%g6
	fmovrsgez	%g7,	%f3,	%f14
	fnegd	%f4,	%f6
	orncc	%l3,	0x0868,	%l2
	fnot2	%f10,	%f18
	fornot1s	%f21,	%f25,	%f27
	bcs,pt	%xcc,	loop_1113
	sllx	%i2,	0x19,	%o7
	fbne	%fcc1,	loop_1114
	faligndata	%f26,	%f8,	%f4
loop_1113:
	edge32ln	%o6,	%i1,	%i7
	subc	%g1,	%i6,	%i0
loop_1114:
	sllx	%l1,	%o2,	%i4
	tpos	%icc,	0x5
	stb	%o0,	[%l7 + 0x55]
	movg	%xcc,	%l0,	%g2
	edge32ln	%o5,	%i3,	%l4
	fblg	%fcc3,	loop_1115
	popc	0x12EF,	%o1
	ba,pn	%icc,	loop_1116
	movg	%icc,	%l6,	%i5
loop_1115:
	xnor	%o3,	%o4,	%g5
	brz,a	%l5,	loop_1117
loop_1116:
	andn	%g3,	%g6,	%g4
	taddcctv	%g7,	%l3,	%i2
	fabss	%f6,	%f31
loop_1117:
	sll	%l2,	%o7,	%o6
	ba,a	%xcc,	loop_1118
	movn	%icc,	%i1,	%i7
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x1e,	%f16
loop_1118:
	tge	%icc,	0x7
	xnorcc	%g1,	0x0712,	%i6
	fxnors	%f7,	%f13,	%f22
	tle	%xcc,	0x1
	movrlez	%l1,	0x229,	%o2
	udivx	%i0,	0x17DB,	%o0
	tleu	%icc,	0x7
	movg	%icc,	%l0,	%i4
	subccc	%g2,	0x05BF,	%o5
	fsrc1s	%f4,	%f2
	tg	%icc,	0x1
	srlx	%l4,	%i3,	%l6
	fcmpne16	%f4,	%f16,	%o1
	array8	%i5,	%o3,	%o4
	xnorcc	%l5,	0x1052,	%g5
	bl,a,pn	%xcc,	loop_1119
	tvc	%xcc,	0x0
	for	%f12,	%f30,	%f28
	sdivx	%g3,	0x129A,	%g6
loop_1119:
	movre	%g7,	0x1A6,	%l3
	fornot2s	%f18,	%f24,	%f4
	movge	%icc,	%i2,	%g4
	orn	%o7,	%l2,	%i1
	edge16l	%o6,	%i7,	%i6
	for	%f30,	%f30,	%f6
	edge16ln	%g1,	%l1,	%i0
	movneg	%xcc,	%o2,	%l0
	fmovse	%icc,	%f29,	%f2
	srax	%o0,	%i4,	%g2
	movrne	%l4,	%i3,	%o5
	edge8ln	%o1,	%l6,	%o3
	fnegs	%f1,	%f5
	nop
	fitod	%f12,	%f26
	fdtoi	%f26,	%f7
	fbu,a	%fcc0,	loop_1120
	movrgez	%i5,	0x30E,	%o4
	stx	%g5,	[%l7 + 0x70]
	prefetch	[%l7 + 0x4C],	 0x2
loop_1120:
	smul	%l5,	0x0764,	%g6
	tpos	%xcc,	0x5
	brlez,a	%g7,	loop_1121
	movneg	%xcc,	%l3,	%i2
	brz	%g3,	loop_1122
	fandnot2s	%f5,	%f20,	%f29
loop_1121:
	fcmpne32	%f2,	%f24,	%g4
	edge32	%l2,	%o7,	%o6
loop_1122:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i7
	umul	%i1,	0x1323,	%g1
	tn	%xcc,	0x3
	nop
	setx	0x6724A8CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f9
	sllx	%l1,	%i6,	%o2
	srax	%i0,	0x0F,	%o0
	add	%l0,	0x1AA3,	%g2
	movpos	%xcc,	%i4,	%i3
	mulscc	%l4,	%o1,	%l6
	fmul8sux16	%f22,	%f12,	%f4
	movgu	%icc,	%o5,	%o3
	st	%f27,	[%l7 + 0x08]
	tsubcctv	%i5,	0x1262,	%o4
	fpadd32	%f18,	%f12,	%f30
	srlx	%g5,	%l5,	%g6
	tleu	%icc,	0x0
	movne	%icc,	%g7,	%i2
	fmovrdgez	%l3,	%f18,	%f4
	brgez	%g3,	loop_1123
	tn	%xcc,	0x2
	ba,a,pn	%icc,	loop_1124
	fbg,a	%fcc0,	loop_1125
loop_1123:
	movgu	%xcc,	%g4,	%o7
	movcs	%icc,	%o6,	%i7
loop_1124:
	bneg,pt	%icc,	loop_1126
loop_1125:
	fmul8ulx16	%f8,	%f10,	%f8
	alignaddrl	%i1,	%l2,	%l1
	tle	%icc,	0x3
loop_1126:
	edge8n	%g1,	%i6,	%i0
	fandnot2s	%f25,	%f11,	%f10
	movrgz	%o0,	%o2,	%l0
	and	%g2,	0x183E,	%i3
	edge8ln	%i4,	%l4,	%l6
	and	%o5,	%o1,	%o3
	orcc	%i5,	%g5,	%l5
	membar	0x22
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	edge8	%o4,	%i2,	%g7
	orcc	%g3,	0x049C,	%l3
	movre	%g4,	0x0F4,	%o6
	fmovrslz	%o7,	%f12,	%f23
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f0
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i7
	edge16n	%i1,	%l1,	%l2
	movcc	%icc,	%i6,	%i0
	membar	0x78
	bge,a	loop_1127
	fzeros	%f22
	tvs	%icc,	0x1
	nop
	setx	0x1D23BFDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x5BB2B617,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f7,	%f5
loop_1127:
	umul	%g1,	%o2,	%l0
	sdivx	%o0,	0x1DBD,	%i3
	bge,a	%xcc,	loop_1128
	fxnor	%f24,	%f8,	%f2
	fmovrsgez	%i4,	%f7,	%f23
	add	%l4,	%l6,	%g2
loop_1128:
	bne,a	%xcc,	loop_1129
	brlez	%o1,	loop_1130
	edge16ln	%o5,	%o3,	%i5
	xor	%g5,	0x1E00,	%g6
loop_1129:
	edge32n	%o4,	%i2,	%g7
loop_1130:
	srlx	%g3,	0x19,	%l5
	popc	%g4,	%o6
	tne	%icc,	0x3
	move	%xcc,	%l3,	%i7
	fexpand	%f25,	%f12
	subcc	%i1,	0x088A,	%l1
	nop
	fitod	%f30,	%f16
	taddcctv	%o7,	%l2,	%i0
	bg,a	%xcc,	loop_1131
	sir	0x0315
	alignaddr	%i6,	%o2,	%l0
	fbug,a	%fcc2,	loop_1132
loop_1131:
	edge16n	%g1,	%i3,	%i4
	move	%icc,	%o0,	%l4
	subc	%l6,	0x180E,	%g2
loop_1132:
	addc	%o5,	%o3,	%o1
	sll	%i5,	%g6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i2,	[%l7 + 0x44]
	fbge,a	%fcc2,	loop_1133
	taddcc	%g7,	%g3,	%g5
	fmovdvs	%xcc,	%f6,	%f12
	movcs	%icc,	%g4,	%l5
loop_1133:
	tl	%icc,	0x5
	mulx	%l3,	%o6,	%i1
	edge8n	%l1,	%o7,	%i7
	fmovdne	%xcc,	%f25,	%f12
	mova	%xcc,	%l2,	%i0
	array32	%i6,	%o2,	%g1
	sethi	0x1E59,	%i3
	orncc	%i4,	%o0,	%l4
	set	0x44, %o6
	lduha	[%l7 + %o6] 0x04,	%l6
	fbl	%fcc0,	loop_1134
	popc	%g2,	%l0
	fmovdpos	%icc,	%f3,	%f28
	fand	%f24,	%f4,	%f4
loop_1134:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o3,	%o1
	tn	%xcc,	0x3
	bpos,pt	%icc,	loop_1135
	movleu	%xcc,	%o5,	%i5
	call	loop_1136
	ldstub	[%l7 + 0x56],	%g6
loop_1135:
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i2
	addccc	%g7,	%g3,	%g5
loop_1136:
	pdist	%f26,	%f2,	%f10
	srax	%o4,	0x17,	%g4
	sir	0x1F8D
	fmovsg	%xcc,	%f26,	%f30
	movneg	%xcc,	%l3,	%o6
	tleu	%icc,	0x0
	nop
	setx	loop_1137,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlez	%i1,	loop_1138
	fmovsn	%xcc,	%f9,	%f7
	set	0x5C, %i6
	lduwa	[%l7 + %i6] 0x19,	%l5
loop_1137:
	xnorcc	%o7,	%i7,	%l2
loop_1138:
	mulscc	%i0,	0x0CB3,	%l1
	fmovse	%icc,	%f28,	%f17
	andcc	%o2,	%g1,	%i6
	nop
	set	0x4F, %o4
	ldstub	[%l7 + %o4],	%i3
	fmovsle	%icc,	%f7,	%f11
	nop
	setx loop_1139, %l0, %l1
	jmpl %l1, %o0
	fbl,a	%fcc0,	loop_1140
	movneg	%icc,	%i4,	%l6
	nop
	setx loop_1141, %l0, %l1
	jmpl %l1, %g2
loop_1139:
	bneg,a,pn	%icc,	loop_1142
loop_1140:
	mulscc	%l0,	%o3,	%o1
	brlez	%l4,	loop_1143
loop_1141:
	tleu	%xcc,	0x3
loop_1142:
	tsubcctv	%o5,	0x1A03,	%g6
	te	%xcc,	0x5
loop_1143:
	alignaddr	%i2,	%g7,	%g3
	udivcc	%g5,	0x038E,	%o4
	subccc	%g4,	0x0728,	%i5
	smul	%l3,	%i1,	%o6
	udivcc	%o7,	0x0F2E,	%l5
	orncc	%l2,	0x0201,	%i7
	bn,a	loop_1144
	sir	0x0801
	ble,a	%xcc,	loop_1145
	fmovsvc	%xcc,	%f29,	%f28
loop_1144:
	nop
	setx	0xCEF505EF405A2D43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i0
loop_1145:
	fpmerge	%f16,	%f22,	%f22
	tg	%xcc,	0x3
	array16	%l1,	%o2,	%i6
	subcc	%i3,	0x1CE5,	%o0
	wr	%g0,	0x81,	%asi
	sta	%f1,	[%l7 + 0x40] %asi
	fbl	%fcc2,	loop_1146
	bpos,a,pt	%icc,	loop_1147
	edge8n	%i4,	%l6,	%g2
	set	0x61, %i5
	ldstuba	[%l7 + %i5] 0x80,	%g1
loop_1146:
	nop
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
loop_1147:
	fxors	%f2,	%f11,	%f22
	fnegs	%f16,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x09
	flush	%l7 + 0x78
	set	0x74, %o0
	ldswa	[%l7 + %o0] 0x88,	%l0
	fmovrdgz	%l4,	%f24,	%f30
	fornot2	%f10,	%f26,	%f8
	movrlez	%o5,	0x1E8,	%o1
	movneg	%xcc,	%g6,	%i2
	fbo,a	%fcc1,	loop_1148
	st	%f1,	[%l7 + 0x54]
	fnand	%f20,	%f8,	%f20
	fmovscc	%xcc,	%f12,	%f15
loop_1148:
	movl	%icc,	%g7,	%g3
	fexpand	%f8,	%f28
	fpmerge	%f22,	%f22,	%f30
	edge32	%o4,	%g5,	%g4
	fmovrsne	%i5,	%f17,	%f13
	array8	%i1,	%o6,	%o7
	fnegd	%f2,	%f18
	nop
	setx	0x08D80998,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xDD26EAD5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f20,	%f29
	udivx	%l5,	0x1B4D,	%l3
	movleu	%icc,	%i7,	%l2
	umulcc	%i0,	0x0A05,	%l1
	edge16	%o2,	%i6,	%o0
	fmovdvc	%icc,	%f12,	%f24
	bvs,a	%xcc,	loop_1149
	bcc	loop_1150
	bn	%icc,	loop_1151
	umulcc	%i3,	0x0B50,	%i4
loop_1149:
	ldub	[%l7 + 0x57],	%l6
loop_1150:
	movne	%xcc,	%g1,	%o3
loop_1151:
	tvc	%xcc,	0x0
	fbue,a	%fcc1,	loop_1152
	fnot1s	%f18,	%f17
	srax	%g2,	%l0,	%o5
	addcc	%l4,	%o1,	%g6
loop_1152:
	call	loop_1153
	smulcc	%i2,	%g3,	%g7
	taddcctv	%g5,	%g4,	%o4
	tneg	%icc,	0x7
loop_1153:
	tleu	%icc,	0x6
	sth	%i1,	[%l7 + 0x78]
	movrgz	%i5,	0x09F,	%o7
	bneg	%icc,	loop_1154
	sir	0x1E2F
	movvc	%xcc,	%o6,	%l3
	udivcc	%l5,	0x0BFF,	%l2
loop_1154:
	movneg	%icc,	%i0,	%l1
	call	loop_1155
	udivx	%o2,	0x17B1,	%i6
	fsrc1s	%f1,	%f6
	bvs,a	loop_1156
loop_1155:
	orcc	%o0,	0x1DD4,	%i7
	xnor	%i4,	%i3,	%l6
	sethi	0x1DAB,	%g1
loop_1156:
	movcs	%icc,	%g2,	%o3
	brgz	%o5,	loop_1157
	or	%l0,	0x16CD,	%o1
	mova	%icc,	%g6,	%i2
	fcmpne16	%f30,	%f22,	%l4
loop_1157:
	fnegs	%f30,	%f12
	umul	%g7,	%g5,	%g3
	fmovdg	%icc,	%f24,	%f22
	tcs	%xcc,	0x6
	srax	%o4,	%g4,	%i1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i5
	movrlz	%o6,	%o7,	%l5
	tle	%icc,	0x4
	tl	%xcc,	0x1
	stw	%l2,	[%l7 + 0x40]
	array8	%l3,	%i0,	%l1
	fones	%f31
	movgu	%xcc,	%i6,	%o0
	fmovrsgz	%i7,	%f1,	%f25
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x66] %asi,	%i3
	bvs,a,pt	%xcc,	loop_1158
	movg	%xcc,	%l6,	%g1
	bge,a	%icc,	loop_1159
	alignaddr	%i4,	%g2,	%o3
loop_1158:
	udivx	%l0,	0x0B82,	%o1
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f22
loop_1159:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%g6,	%f24,	%f14
	fpadd32	%f12,	%f26,	%f4
	movrlez	%o5,	%i2,	%g7
	nop
	setx	0xDC8EC98C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xF0879548,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f2,	%f14
	brgz,a	%l4,	loop_1160
	movvc	%icc,	%g3,	%g5
	be,pt	%icc,	loop_1161
	ba	loop_1162
loop_1160:
	te	%icc,	0x1
	array16	%o4,	%g4,	%i5
loop_1161:
	addc	%i1,	%o6,	%l5
loop_1162:
	tvc	%icc,	0x0
	lduh	[%l7 + 0x34],	%o7
	sdivx	%l3,	0x16A8,	%l2
	fbue,a	%fcc2,	loop_1163
	udivx	%l1,	0x1038,	%i6
	movre	%i0,	%i7,	%o2
	mulx	%o0,	%l6,	%g1
loop_1163:
	tge	%xcc,	0x7
	nop
	fitos	%f8,	%f27
	fstox	%f27,	%f22
	array16	%i4,	%g2,	%o3
	bvc,a,pn	%xcc,	loop_1164
	tsubcc	%l0,	0x09BF,	%o1
	edge16l	%g6,	%o5,	%i2
	edge32n	%g7,	%i3,	%l4
loop_1164:
	fbne,a	%fcc0,	loop_1165
	sth	%g5,	[%l7 + 0x4A]
	bpos,pt	%xcc,	loop_1166
	nop
	fitod	%f10,	%f20
	fdtox	%f20,	%f22
loop_1165:
	fcmpne32	%f20,	%f8,	%o4
	xnor	%g3,	0x190F,	%i5
loop_1166:
	bcc,a	%icc,	loop_1167
	fmovs	%f2,	%f31
	movrlez	%g4,	%o6,	%l5
	orn	%o7,	0x1ED0,	%i1
loop_1167:
	fbg,a	%fcc3,	loop_1168
	fmovrsgez	%l3,	%f23,	%f22
	movrgz	%l1,	0x051,	%i6
	fbge,a	%fcc0,	loop_1169
loop_1168:
	xorcc	%i0,	0x08E6,	%i7
	or	%l2,	%o2,	%o0
	movgu	%icc,	%g1,	%l6
loop_1169:
	fmovs	%f15,	%f18
	andcc	%i4,	0x051A,	%g2
	fmovdcs	%icc,	%f14,	%f3
	fbg	%fcc3,	loop_1170
	bpos,a	loop_1171
	subc	%l0,	0x0386,	%o1
	edge16	%o3,	%o5,	%i2
loop_1170:
	movrne	%g6,	%g7,	%i3
loop_1171:
	edge32n	%g5,	%l4,	%o4
	edge8n	%g3,	%g4,	%o6
	subc	%i5,	%l5,	%i1
	xnor	%l3,	%l1,	%o7
	tcc	%xcc,	0x3
	movgu	%icc,	%i0,	%i7
	bvs,a,pt	%xcc,	loop_1172
	ta	%icc,	0x1
	tneg	%icc,	0x0
	mova	%xcc,	%i6,	%o2
loop_1172:
	fmovse	%xcc,	%f30,	%f31
	lduw	[%l7 + 0x70],	%o0
	xor	%g1,	%l2,	%i4
	fxors	%f27,	%f0,	%f23
	nop
	fitos	%f4,	%f22
	fstod	%f22,	%f18
	tcc	%xcc,	0x6
	tne	%icc,	0x5
	tsubcctv	%g2,	%l0,	%l6
	movpos	%icc,	%o1,	%o5
	fxors	%f18,	%f5,	%f13
	st	%f18,	[%l7 + 0x48]
	fblg	%fcc2,	loop_1173
	stw	%o3,	[%l7 + 0x18]
	fmovsvs	%xcc,	%f6,	%f7
	addcc	%i2,	0x0149,	%g6
loop_1173:
	bcc	%icc,	loop_1174
	tvc	%icc,	0x7
	fbg	%fcc0,	loop_1175
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f16
	fxtod	%f16,	%f4
loop_1174:
	fnor	%f2,	%f2,	%f10
	bcs,a,pn	%icc,	loop_1176
loop_1175:
	sth	%g7,	[%l7 + 0x3E]
	fblg	%fcc3,	loop_1177
	movvc	%xcc,	%i3,	%g5
loop_1176:
	andn	%l4,	0x0451,	%g3
	array32	%o4,	%o6,	%i5
loop_1177:
	udiv	%l5,	0x1FE2,	%i1
	sdivcc	%g4,	0x1FFA,	%l3
	bcc,a	loop_1178
	nop
	set	0x64, %o1
	stw	%o7,	[%l7 + %o1]
	andncc	%i0,	%i7,	%l1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x15,	%f16
loop_1178:
	tsubcc	%i6,	%o0,	%g1
	xor	%o2,	0x1447,	%i4
	movl	%icc,	%g2,	%l0
	umulcc	%l6,	0x1E5E,	%o1
	tcc	%xcc,	0x4
	membar	0x1D
	fxor	%f8,	%f20,	%f10
	ldx	[%l7 + 0x58],	%o5
	fble,a	%fcc1,	loop_1179
	and	%o3,	0x179B,	%l2
	set	0x50, %i4
	lda	[%l7 + %i4] 0x89,	%f27
loop_1179:
	nop
	setx	loop_1180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andn	%i2,	%g6,	%g7
	srlx	%g5,	%l4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1180:
	fbn	%fcc0,	loop_1181
	tn	%icc,	0x7
	smul	%o4,	0x15F3,	%o6
	ba,a	%icc,	loop_1182
loop_1181:
	popc	0x1F79,	%g3
	array32	%i5,	%l5,	%i1
	andcc	%l3,	0x013A,	%g4
loop_1182:
	srlx	%o7,	%i0,	%i7
	bn,a,pn	%icc,	loop_1183
	movleu	%xcc,	%l1,	%i6
	movg	%xcc,	%o0,	%o2
	nop
	set	0x6A, %o2
	ldsh	[%l7 + %o2],	%i4
loop_1183:
	array8	%g1,	%l0,	%l6
	fsrc2s	%f15,	%f3
	membar	0x51
	bge	loop_1184
	movcs	%icc,	%o1,	%g2
	nop
	setx	0xF9ABAB7520578C5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	umul	%o3,	0x0307,	%o5
loop_1184:
	mulx	%l2,	%i2,	%g6
	edge16ln	%g5,	%l4,	%g7
	tne	%xcc,	0x5
	tvc	%xcc,	0x6
	orncc	%o4,	0x0B03,	%i3
	orncc	%o6,	0x1520,	%i5
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x15,	%g2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x30] %asi,	%l5
	addccc	%i1,	%l3,	%o7
	fandnot2s	%f11,	%f9,	%f3
	tvc	%xcc,	0x6
	array32	%g4,	%i7,	%l1
	fmovdcs	%xcc,	%f14,	%f5
	tsubcctv	%i0,	0x063E,	%o0
	movrlez	%o2,	0x20C,	%i4
	sir	0x1F27
	fandnot1s	%f19,	%f3,	%f2
	ldsb	[%l7 + 0x5D],	%i6
	subccc	%l0,	0x157F,	%g1
	andncc	%l6,	%o1,	%o3
	sdivcc	%o5,	0x0C97,	%g2
	nop
	setx	0x4D664523CB4FEA15,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3F7EC2AC12084166,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f22,	%f14
	lduh	[%l7 + 0x4C],	%l2
	tleu	%icc,	0x2
	subcc	%i2,	0x1BFE,	%g6
	edge32ln	%g5,	%l4,	%o4
	flush	%l7 + 0x30
	fpadd16s	%f22,	%f6,	%f1
	nop
	fitos	%f11,	%f13
	fstox	%f13,	%f20
	fxtos	%f20,	%f5
	fnot2	%f22,	%f20
	fandnot1s	%f17,	%f31,	%f3
	nop
	setx loop_1185, %l0, %l1
	jmpl %l1, %i3
	srax	%o6,	0x1F,	%g7
	fmovrdlz	%g3,	%f26,	%f26
	nop
	fitod	%f0,	%f30
	fdtoi	%f30,	%f5
loop_1185:
	fbuge,a	%fcc1,	loop_1186
	tleu	%icc,	0x0
	set	0x3C, %g4
	ldswa	[%l7 + %g4] 0x10,	%l5
loop_1186:
	addccc	%i5,	0x188D,	%l3
	alignaddr	%o7,	%g4,	%i1
	bcs	loop_1187
	edge32n	%i7,	%i0,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x0
loop_1187:
	nop
	setx	0xB0F97405,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x5DF97AC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f5,	%f29
	subc	%l1,	0x1CFA,	%i4
	fnands	%f6,	%f22,	%f5
	mulx	%o2,	0x07EA,	%i6
	edge8	%g1,	%l0,	%l6
	nop
	setx	0xC07EEFCC,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	ldx	[%l7 + 0x18],	%o1
	movre	%o5,	%g2,	%l2
	edge8l	%o3,	%g6,	%i2
	movvc	%xcc,	%g5,	%o4
	movrne	%l4,	0x267,	%o6
	edge16l	%i3,	%g3,	%g7
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f10
	fxtod	%f10,	%f12
	set	0x18, %i7
	stha	%i5,	[%l7 + %i7] 0x23
	membar	#Sync
	tcc	%icc,	0x7
	srl	%l5,	%o7,	%g4
	udivx	%i1,	0x1841,	%l3
	and	%i7,	0x193F,	%o0
	edge16ln	%l1,	%i0,	%i4
	fnegs	%f29,	%f30
	alignaddrl	%o2,	%g1,	%l0
	udiv	%i6,	0x0D9D,	%l6
	smulcc	%o5,	0x0F29,	%g2
	fsrc2s	%f6,	%f19
	edge8	%l2,	%o3,	%o1
	tvc	%xcc,	0x7
	sdiv	%i2,	0x10E7,	%g5
	fmovsneg	%xcc,	%f10,	%f18
	ldx	[%l7 + 0x38],	%g6
	srl	%l4,	0x1A,	%o6
	movgu	%icc,	%i3,	%o4
	srax	%g3,	%i5,	%l5
	fmovdg	%icc,	%f24,	%f21
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x34] %asi,	%g7
	orn	%g4,	0x1D98,	%o7
	movrlz	%l3,	0x042,	%i1
	tpos	%xcc,	0x2
	fbul,a	%fcc3,	loop_1188
	array8	%o0,	%i7,	%i0
	te	%icc,	0x2
	fcmpne32	%f16,	%f22,	%i4
loop_1188:
	edge8l	%o2,	%l1,	%g1
	fandnot1	%f16,	%f26,	%f10
	fnegs	%f15,	%f13
	wr	%g0,	0x88,	%asi
	sta	%f1,	[%l7 + 0x4C] %asi
	array8	%i6,	%l6,	%l0
	edge16l	%g2,	%o5,	%o3
	fmovsvc	%xcc,	%f26,	%f5
	sdivcc	%l2,	0x0F8F,	%o1
	movvc	%icc,	%i2,	%g5
	taddcc	%l4,	0x127D,	%o6
	fmul8x16	%f9,	%f10,	%f8
	fzero	%f16
	fmul8sux16	%f0,	%f14,	%f30
	xorcc	%i3,	0x0EDF,	%o4
	orn	%g3,	%i5,	%l5
	fors	%f12,	%f25,	%f26
	tgu	%xcc,	0x5
	bcc,a,pt	%icc,	loop_1189
	fmul8x16al	%f15,	%f18,	%f6
	fmul8sux16	%f4,	%f28,	%f30
	sdivcc	%g6,	0x1344,	%g7
loop_1189:
	sllx	%o7,	0x03,	%l3
	mulscc	%i1,	0x1BF5,	%g4
	movvs	%icc,	%i7,	%i0
	stw	%i4,	[%l7 + 0x64]
	edge32n	%o2,	%o0,	%l1
	nop
	setx	0x4075E4DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	umulcc	%i6,	0x11BA,	%l6
	movcs	%xcc,	%g1,	%l0
	movvs	%xcc,	%o5,	%g2
	taddcc	%o3,	%l2,	%o1
	set	0x40, %o3
	lduwa	[%l7 + %o3] 0x89,	%g5
	tvs	%xcc,	0x7
	edge32l	%i2,	%l4,	%i3
	fbul,a	%fcc2,	loop_1190
	edge8n	%o4,	%g3,	%i5
	orcc	%o6,	0x0B80,	%l5
	sdivx	%g6,	0x0674,	%g7
loop_1190:
	sethi	0x05BC,	%o7
	tle	%icc,	0x0
	xnorcc	%l3,	0x1BBE,	%i1
	swap	[%l7 + 0x54],	%i7
	sdiv	%i0,	0x0E39,	%i4
	fbo	%fcc0,	loop_1191
	fmovdl	%icc,	%f10,	%f3
	fmovda	%icc,	%f16,	%f17
	tl	%xcc,	0x5
loop_1191:
	tneg	%xcc,	0x3
	udiv	%o2,	0x061B,	%g4
	nop
	setx loop_1192, %l0, %l1
	jmpl %l1, %l1
	movneg	%xcc,	%o0,	%l6
	set	0x68, %o7
	lda	[%l7 + %o7] 0x14,	%f14
loop_1192:
	fmuld8sux16	%f4,	%f8,	%f18
	fmovrdlz	%g1,	%f12,	%f6
	tcs	%icc,	0x2
	add	%l0,	%i6,	%o5
	alignaddrl	%o3,	%l2,	%o1
	tleu	%icc,	0x7
	orn	%g2,	%g5,	%l4
	sdivx	%i2,	0x1735,	%o4
	sdivx	%i3,	0x01A0,	%i5
	sub	%o6,	%l5,	%g3
	addcc	%g7,	0x07B8,	%o7
	xorcc	%g6,	0x0490,	%i1
	movcc	%xcc,	%l3,	%i7
	edge8ln	%i4,	%i0,	%o2
	popc	0x1D75,	%l1
	fpadd16	%f20,	%f4,	%f10
	mulscc	%o0,	0x0B2F,	%g4
	fbug	%fcc0,	loop_1193
	movleu	%xcc,	%l6,	%g1
	movrne	%l0,	%o5,	%o3
	movrgez	%l2,	%o1,	%g2
loop_1193:
	std	%f12,	[%l7 + 0x68]
	srax	%g5,	%i6,	%l4
	tn	%icc,	0x1
	ldx	[%l7 + 0x08],	%i2
	fbul	%fcc3,	loop_1194
	array8	%i3,	%i5,	%o4
	tcc	%icc,	0x5
	movcs	%xcc,	%o6,	%g3
loop_1194:
	movvc	%xcc,	%g7,	%l5
	subc	%o7,	%g6,	%i1
	tle	%icc,	0x6
	movrlz	%l3,	%i4,	%i0
	mova	%icc,	%i7,	%o2
	wr	%g0,	0x27,	%asi
	stwa	%o0,	[%l7 + 0x68] %asi
	membar	#Sync
	movneg	%icc,	%l1,	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l6,	%l0
	fmovdcc	%icc,	%f24,	%f18
	addcc	%g1,	%o5,	%l2
	tn	%icc,	0x2
	mulscc	%o1,	0x0963,	%g2
	tsubcctv	%o3,	%g5,	%l4
	tl	%xcc,	0x3
	fzeros	%f3
	alignaddr	%i6,	%i2,	%i5
	te	%xcc,	0x5
	or	%o4,	%i3,	%o6
	movrlez	%g7,	0x09E,	%l5
	movcs	%icc,	%o7,	%g6
	srl	%g3,	0x02,	%i1
	andncc	%l3,	%i0,	%i4
	tsubcctv	%i7,	0x0CFD,	%o0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%g4
	for	%f0,	%f26,	%f12
	edge32ln	%o2,	%l6,	%g1
	sdivcc	%o5,	0x073E,	%l0
	ldub	[%l7 + 0x5F],	%l2
	fnors	%f14,	%f2,	%f7
	srax	%g2,	0x16,	%o3
	xnor	%o1,	%l4,	%g5
	edge8	%i6,	%i2,	%o4
	andn	%i5,	%o6,	%i3
	ble	loop_1195
	udivx	%g7,	0x067B,	%o7
	st	%f14,	[%l7 + 0x3C]
	srlx	%g6,	%l5,	%g3
loop_1195:
	movrgez	%l3,	0x304,	%i1
	wr	%g0,	0x10,	%asi
	stha	%i4,	[%l7 + 0x32] %asi
	fble,a	%fcc3,	loop_1196
	fands	%f8,	%f2,	%f7
	ta	%xcc,	0x5
	set	0x59, %g6
	stba	%i7,	[%l7 + %g6] 0x10
loop_1196:
	xnorcc	%i0,	%l1,	%g4
	and	%o2,	0x012D,	%l6
	movre	%o0,	0x2EF,	%g1
	udiv	%o5,	0x02CC,	%l0
	fbuge,a	%fcc3,	loop_1197
	mulx	%l2,	0x001A,	%o3
	movne	%icc,	%o1,	%g2
	pdist	%f12,	%f24,	%f4
loop_1197:
	smul	%l4,	0x1AAB,	%g5
	udiv	%i2,	0x0CC6,	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x11,	%i5,	%o6
	tge	%icc,	0x4
	std	%f12,	[%l7 + 0x30]
	movrne	%i3,	%g7,	%o7
	udivx	%o4,	0x0ED2,	%l5
	ldstub	[%l7 + 0x10],	%g6
	fand	%f20,	%f18,	%f4
	edge8ln	%l3,	%g3,	%i1
	tneg	%xcc,	0x2
	movcs	%xcc,	%i7,	%i0
	nop
	setx	0x0961300DD07F8EB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	set	0x10, %g5
	lduwa	[%l7 + %g5] 0x15,	%i4
	fone	%f28
	ldsb	[%l7 + 0x57],	%l1
	fbge	%fcc2,	loop_1198
	subc	%g4,	0x13A6,	%l6
	taddcctv	%o0,	%g1,	%o2
	fandnot1	%f12,	%f22,	%f2
loop_1198:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%l2
	sdivcc	%o3,	0x17DA,	%o1
	sllx	%o5,	%l4,	%g2
	fxors	%f12,	%f11,	%f11
	sir	0x12F1
	xorcc	%g5,	%i6,	%i2
	movg	%icc,	%o6,	%i3
	srax	%g7,	0x07,	%i5
	edge16	%o7,	%o4,	%l5
	edge32	%l3,	%g6,	%i1
	fmul8ulx16	%f10,	%f8,	%f20
	ld	[%l7 + 0x78],	%f17
	edge32l	%i7,	%i0,	%i4
	edge8n	%l1,	%g4,	%l6
	fbge	%fcc1,	loop_1199
	tg	%icc,	0x3
	umul	%o0,	0x1E78,	%g1
	std	%f4,	[%l7 + 0x78]
loop_1199:
	edge8	%o2,	%g3,	%l2
	brgz,a	%l0,	loop_1200
	swap	[%l7 + 0x7C],	%o1
	srl	%o5,	%l4,	%o3
	fmovdge	%xcc,	%f11,	%f30
loop_1200:
	fmovrsne	%g2,	%f14,	%f4
	movleu	%icc,	%i6,	%g5
	fmovrdlz	%i2,	%f14,	%f8
	fmul8ulx16	%f26,	%f6,	%f20
	fcmpeq16	%f10,	%f20,	%i3
	edge32l	%g7,	%o6,	%o7
	nop
	setx	0x5B14117C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x084FE7EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f6,	%f6
	andcc	%o4,	0x1C56,	%i5
	fmovrsgez	%l3,	%f15,	%f9
	be	loop_1201
	sir	0x1E91
	sra	%l5,	0x12,	%g6
	movne	%xcc,	%i1,	%i0
loop_1201:
	movge	%xcc,	%i4,	%i7
	mulx	%g4,	%l6,	%o0
	sir	0x0A06
	xnor	%l1,	0x19A4,	%o2
	fcmple16	%f8,	%f4,	%g3
	edge16l	%g1,	%l0,	%l2
	fmuld8sux16	%f3,	%f28,	%f14
	movn	%xcc,	%o1,	%l4
	sllx	%o3,	%g2,	%i6
	fpadd16s	%f13,	%f31,	%f28
	edge32l	%g5,	%i2,	%i3
	movrgz	%g7,	0x2C1,	%o5
	set	0x6C, %i1
	lduba	[%l7 + %i1] 0x88,	%o7
	brgz,a	%o6,	loop_1202
	fmul8x16au	%f14,	%f20,	%f22
	fxors	%f16,	%f30,	%f23
	sir	0x0337
loop_1202:
	nop
	setx loop_1203, %l0, %l1
	jmpl %l1, %o4
	tgu	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l3,	%i5,	%l5
loop_1203:
	addcc	%i1,	0x1FD5,	%i0
	ble,a	loop_1204
	edge32l	%i4,	%i7,	%g4
	subccc	%g6,	0x05DB,	%l6
	fmul8x16au	%f0,	%f0,	%f24
loop_1204:
	fmovdl	%xcc,	%f22,	%f24
	nop
	setx	loop_1205,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%l1,	%o0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x04,	%f16
loop_1205:
	ldd	[%l7 + 0x28],	%o2
	movpos	%xcc,	%g1,	%l0
	movrlz	%l2,	0x2DA,	%g3
	mulx	%l4,	%o1,	%o3
	movneg	%icc,	%g2,	%g5
	mulscc	%i6,	%i3,	%i2
	orncc	%o5,	0x12A4,	%o7
	edge32n	%g7,	%o6,	%l3
	movvs	%icc,	%i5,	%o4
	edge16	%l5,	%i0,	%i4
	tle	%icc,	0x2
	movpos	%xcc,	%i1,	%g4
	tgu	%xcc,	0x4
	movg	%icc,	%i7,	%g6
	and	%l6,	%l1,	%o2
	fbn	%fcc0,	loop_1206
	fmovs	%f16,	%f14
	ta	%xcc,	0x0
	brz,a	%o0,	loop_1207
loop_1206:
	fbul,a	%fcc1,	loop_1208
	bvs	loop_1209
	movrlez	%g1,	%l0,	%l2
loop_1207:
	fmovspos	%xcc,	%f22,	%f13
loop_1208:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x20] %asi,	%g3
loop_1209:
	bn,pn	%xcc,	loop_1210
	stb	%o1,	[%l7 + 0x38]
	array16	%o3,	%l4,	%g5
	fmovrde	%i6,	%f0,	%f0
loop_1210:
	movgu	%xcc,	%i3,	%g2
	move	%xcc,	%i2,	%o5
	subc	%o7,	0x1F00,	%o6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x60] %asi,	%g7
	fmovdleu	%xcc,	%f20,	%f30
	edge8ln	%i5,	%l3,	%o4
	andncc	%l5,	%i4,	%i1
	nop
	fitod	%f12,	%f22
	fdtos	%f22,	%f4
	edge16	%i0,	%i7,	%g4
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x2a,	%i6
	edge16l	%g6,	%l1,	%o0
	membar	0x57
	ldd	[%l7 + 0x20],	%o2
	umulcc	%l0,	%l2,	%g1
	nop
	setx	0x0434C9904F1796DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x63225048801E6196,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f22,	%f22
	smulcc	%g3,	0x1C98,	%o1
	or	%l4,	0x1954,	%o3
	tge	%icc,	0x4
	sllx	%i6,	0x0B,	%g5
	tle	%icc,	0x3
	bvs,a,pt	%xcc,	loop_1211
	mulx	%g2,	0x0CC2,	%i3
	mulscc	%i2,	%o7,	%o6
	fnot1	%f4,	%f14
loop_1211:
	fbul	%fcc2,	loop_1212
	fbge,a	%fcc1,	loop_1213
	movrgz	%g7,	%i5,	%o5
	fcmple16	%f18,	%f18,	%o4
loop_1212:
	movpos	%icc,	%l3,	%i4
loop_1213:
	bgu,a,pt	%xcc,	loop_1214
	fsrc1s	%f23,	%f1
	srl	%l5,	%i0,	%i1
	set	0x46, %i0
	ldsha	[%l7 + %i0] 0x81,	%g4
loop_1214:
	fornot1	%f10,	%f12,	%f8
	movrlz	%i7,	%g6,	%l6
	ldx	[%l7 + 0x20],	%l1
	movn	%xcc,	%o0,	%o2
	brgz	%l2,	loop_1215
	fmovdle	%xcc,	%f20,	%f10
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x18] %asi,	%l0
loop_1215:
	sdivcc	%g3,	0x17CA,	%o1
	sth	%l4,	[%l7 + 0x3A]
	fmovdl	%xcc,	%f7,	%f3
	mulx	%o3,	%i6,	%g5
	fabsd	%f0,	%f4
	fba,a	%fcc1,	loop_1216
	subc	%g1,	%g2,	%i3
	fors	%f20,	%f0,	%f0
	xor	%o7,	%o6,	%g7
loop_1216:
	fpack16	%f22,	%f28
	tne	%xcc,	0x7
	edge16	%i5,	%o5,	%o4
	andcc	%i2,	%i4,	%l5
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovscc	%xcc,	%f12,	%f11
	edge8ln	%i0,	%i1,	%l3
	subccc	%i7,	%g4,	%g6
	edge32l	%l6,	%l1,	%o0
	sdivcc	%o2,	0x13A6,	%l0
	movgu	%icc,	%l2,	%o1
	nop
	setx	0x67558CA1DBB96630,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f20
	tsubcctv	%g3,	%l4,	%o3
	fands	%f30,	%f0,	%f12
	popc	%g5,	%i6
	edge16l	%g1,	%g2,	%i3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x48] %asi,	%o6
	nop
	setx	loop_1217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%g7,	%i5,	%o5
	nop
	setx	0x7D6CAB3490660647,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f14
	movleu	%xcc,	%o7,	%i2
loop_1217:
	orcc	%o4,	0x122A,	%l5
	fmovrdne	%i0,	%f12,	%f22
	tne	%icc,	0x1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x48] %asi,	%i1
	fbg	%fcc1,	loop_1218
	fmovsne	%xcc,	%f4,	%f7
	movge	%icc,	%i4,	%l3
	movvs	%icc,	%g4,	%g6
loop_1218:
	fmovdleu	%xcc,	%f9,	%f10
	fsrc1	%f4,	%f18
	tne	%icc,	0x1
	set	0x5A, %l4
	lduha	[%l7 + %l4] 0x88,	%l6
	tgu	%icc,	0x2
	movvc	%xcc,	%l1,	%i7
	tvs	%xcc,	0x6
	taddcctv	%o2,	0x1C11,	%o0
	edge32n	%l2,	%l0,	%o1
	umulcc	%l4,	0x0846,	%g3
	movrgez	%o3,	%i6,	%g1
	fmovscs	%xcc,	%f8,	%f11
	sdivx	%g5,	0x0D57,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x76, %g7
	ldub	[%l7 + %g7],	%o6
	edge32	%g7,	%i5,	%o5
	tl	%icc,	0x2
	ldsw	[%l7 + 0x08],	%o7
	fbuge	%fcc1,	loop_1219
	fmovdle	%icc,	%f15,	%f14
	fble	%fcc3,	loop_1220
	fpadd32	%f6,	%f16,	%f10
loop_1219:
	tgu	%xcc,	0x5
	taddcctv	%i2,	%o4,	%l5
loop_1220:
	fxnor	%f10,	%f14,	%f10
	movrne	%i0,	%g2,	%i1
	bgu,a	%xcc,	loop_1221
	bcs	loop_1222
	ldstub	[%l7 + 0x5F],	%l3
	mulscc	%g4,	0x0E89,	%i4
loop_1221:
	movvs	%xcc,	%g6,	%l6
loop_1222:
	bgu,a	%icc,	loop_1223
	edge8ln	%i7,	%l1,	%o2
	movg	%xcc,	%l2,	%l0
	tg	%icc,	0x1
loop_1223:
	brnz,a	%o0,	loop_1224
	move	%xcc,	%o1,	%g3
	taddcctv	%l4,	0x03C8,	%i6
	prefetch	[%l7 + 0x38],	 0x2
loop_1224:
	xor	%o3,	0x01FB,	%g1
	fbug	%fcc0,	loop_1225
	edge32n	%i3,	%o6,	%g5
	fpack32	%f8,	%f0,	%f30
	fpsub16s	%f7,	%f16,	%f10
loop_1225:
	te	%xcc,	0x7
	tvs	%xcc,	0x2
	fmovdl	%icc,	%f22,	%f0
	udivcc	%i5,	0x0216,	%o5
	or	%o7,	0x105F,	%i2
	set	0x4A, %l6
	lduba	[%l7 + %l6] 0x11,	%g7
	and	%o4,	0x1094,	%i0
	brgz	%g2,	loop_1226
	nop
	setx	loop_1227,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdlz	%i1,	%f28,	%f6
	and	%l3,	0x1B6D,	%g4
loop_1226:
	orncc	%i4,	0x0E04,	%g6
loop_1227:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	srlx	%l5,	%l1,	%o2
	tne	%xcc,	0x3
	bl,a	loop_1228
	movcs	%xcc,	%l2,	%i7
	fxor	%f26,	%f20,	%f14
	orncc	%l0,	0x0BDF,	%o0
loop_1228:
	fbne,a	%fcc2,	loop_1229
	orn	%g3,	0x0AEB,	%o1
	movrne	%l4,	0x18E,	%o3
	nop
	setx	0x56120282,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xA7F4A424,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f13,	%f5
loop_1229:
	movg	%icc,	%g1,	%i3
	tneg	%icc,	0x0
	movne	%xcc,	%o6,	%i6
	array8	%g5,	%i5,	%o7
	brlz	%o5,	loop_1230
	fmovdne	%icc,	%f8,	%f21
	fbu	%fcc3,	loop_1231
	nop
	setx	0x1FA6828A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x4AC04529,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f0,	%f16
loop_1230:
	array32	%i2,	%g7,	%o4
	tcc	%icc,	0x4
loop_1231:
	ta	%xcc,	0x3
	add	%i0,	%g2,	%i1
	fmovsn	%icc,	%f15,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f28,	%f8,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x26],	%g4
	fcmpgt16	%f24,	%f18,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x4
	andn	%i4,	%l6,	%g6
	mulx	%l1,	0x1E97,	%l5
	membar	0x6E
	ldd	[%l7 + 0x48],	%l2
	edge16n	%o2,	%i7,	%l0
	tvc	%xcc,	0x6
	sra	%g3,	%o0,	%l4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	bpos	loop_1232
	edge32n	%g1,	%i3,	%o3
	add	%o6,	0x1A2A,	%g5
	nop
	setx	0xB9344E09606559CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_1232:
	bvs,a	%xcc,	loop_1233
	fba	%fcc2,	loop_1234
	nop
	fitos	%f0,	%f2
	fstoi	%f2,	%f27
	movgu	%icc,	%i6,	%i5
loop_1233:
	addc	%o7,	%o5,	%g7
loop_1234:
	stb	%i2,	[%l7 + 0x28]
	tne	%xcc,	0x6
	edge8l	%i0,	%g2,	%o4
	movvc	%xcc,	%i1,	%g4
	array32	%l3,	%i4,	%g6
	sllx	%l1,	0x0F,	%l5
	movl	%icc,	%l6,	%o2
	set	0x60, %g3
	ldswa	[%l7 + %g3] 0x04,	%l2
	wr	%g0,	0x18,	%asi
	stha	%i7,	[%l7 + 0x38] %asi
	ldd	[%l7 + 0x10],	%f24
	andcc	%l0,	%o0,	%l4
	fnot1s	%f14,	%f30
	nop
	setx	0x18C1007DD900165A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x019A1B278C9F6A45,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f26,	%f22
	addc	%o1,	0x1E1E,	%g3
	fornot1s	%f26,	%f7,	%f26
	edge8	%g1,	%o3,	%o6
	ldub	[%l7 + 0x59],	%i3
	brz	%i6,	loop_1235
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f22
	sra	%i5,	0x01,	%g5
	fabsd	%f0,	%f24
loop_1235:
	edge32l	%o7,	%g7,	%i2
	set	0x60, %g1
	stxa	%i0,	[%l7 + %g1] 0x89
	faligndata	%f2,	%f8,	%f6
	nop
	fitos	%f1,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g2,	%o5
	fpsub32	%f8,	%f8,	%f8
	andcc	%i1,	0x0C45,	%o4
	tn	%icc,	0x1
	edge16n	%g4,	%i4,	%g6
	fones	%f8
	fpadd16	%f2,	%f18,	%f20
	umulcc	%l3,	%l1,	%l6
	udivx	%o2,	0x1703,	%l5
	xnorcc	%l2,	0x120E,	%l0
	edge16ln	%i7,	%l4,	%o1
	movneg	%icc,	%o0,	%g1
	tcc	%icc,	0x7
	fmovsneg	%icc,	%f19,	%f6
	array8	%g3,	%o6,	%o3
	fmovsgu	%xcc,	%f27,	%f28
	array8	%i6,	%i5,	%g5
	brnz,a	%o7,	loop_1236
	mova	%icc,	%g7,	%i3
	smulcc	%i2,	0x01C4,	%g2
	fmovda	%icc,	%f28,	%f10
loop_1236:
	fmovs	%f27,	%f0
	subc	%o5,	0x002E,	%i1
	tgu	%xcc,	0x4
	fabss	%f19,	%f12
	umulcc	%o4,	0x1D76,	%i0
	xorcc	%g4,	%g6,	%i4
	movge	%xcc,	%l1,	%l6
	movvs	%xcc,	%o2,	%l5
	fnor	%f0,	%f20,	%f24
	sra	%l2,	%l0,	%i7
	sub	%l3,	%o1,	%o0
	tpos	%xcc,	0x6
	nop
	setx	0x03A70A3840631CA6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	brlez	%l4,	loop_1237
	fnot1s	%f0,	%f1
	tl	%icc,	0x5
	fpmerge	%f21,	%f7,	%f26
loop_1237:
	st	%f20,	[%l7 + 0x50]
	tgu	%xcc,	0x2
	tvc	%xcc,	0x2
	fnot1	%f20,	%f20
	movrgez	%g3,	0x1E0,	%o6
	set	0x28, %l2
	ldsha	[%l7 + %l2] 0x81,	%o3
	stw	%i6,	[%l7 + 0x58]
	bvs	%xcc,	loop_1238
	fmovda	%xcc,	%f14,	%f3
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i5
loop_1238:
	fornot2	%f8,	%f0,	%f8
	fmovd	%f30,	%f28
	srl	%g1,	0x02,	%o7
	movn	%xcc,	%g5,	%g7
	nop
	fitos	%f0,	%f6
	fstox	%f6,	%f22
	xnor	%i3,	%i2,	%o5
	fbn,a	%fcc2,	loop_1239
	movneg	%icc,	%i1,	%o4
	tpos	%xcc,	0x3
	alignaddr	%i0,	%g4,	%g6
loop_1239:
	bvs,pt	%xcc,	loop_1240
	edge32ln	%i4,	%l1,	%g2
	tsubcctv	%l6,	0x0293,	%l5
	movrlez	%o2,	0x1B6,	%l2
loop_1240:
	nop
	fitod	%f4,	%f2
	fdtoi	%f2,	%f6
	fmovsn	%icc,	%f0,	%f12
	array8	%i7,	%l3,	%o1
	te	%xcc,	0x4
	fmovdpos	%xcc,	%f13,	%f16
	fbl	%fcc2,	loop_1241
	movrlz	%l0,	%l4,	%o0
	std	%f8,	[%l7 + 0x08]
	edge16n	%g3,	%o3,	%o6
loop_1241:
	swap	[%l7 + 0x0C],	%i5
	sll	%g1,	0x16,	%i6
	movne	%icc,	%g5,	%g7
	set	0x46, %i3
	ldsha	[%l7 + %i3] 0x11,	%o7
	or	%i3,	%o5,	%i1
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f18
	movvc	%icc,	%i2,	%o4
	movvc	%icc,	%i0,	%g4
	fbe	%fcc3,	loop_1242
	taddcctv	%i4,	0x171B,	%l1
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f16
	sra	%g6,	0x06,	%g2
loop_1242:
	subc	%l5,	0x09DD,	%l6
	movl	%xcc,	%o2,	%i7
	tg	%icc,	0x2
	fbg,a	%fcc3,	loop_1243
	udiv	%l2,	0x0B87,	%o1
	bleu,a	loop_1244
	or	%l0,	0x028D,	%l3
loop_1243:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1244:
	brgez	%l4,	loop_1245
	xor	%g3,	0x1770,	%o0
	movrgez	%o3,	0x283,	%i5
	ba,a,pt	%xcc,	loop_1246
loop_1245:
	array16	%g1,	%o6,	%i6
	edge32l	%g5,	%o7,	%g7
	fmovda	%xcc,	%f25,	%f17
loop_1246:
	edge16n	%i3,	%i1,	%o5
	movgu	%xcc,	%i2,	%o4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	movle	%xcc,	%i0,	%i4
	tsubcctv	%g6,	0x15EF,	%g2
	fabss	%f16,	%f27
	set	0x70, %l5
	stxa	%l1,	[%l7 + %l5] 0x27
	membar	#Sync
	brgez,a	%l5,	loop_1247
	tvc	%icc,	0x6
	sll	%l6,	0x1B,	%i7
	tn	%icc,	0x2
loop_1247:
	nop
	set	0x65, %l1
	ldstuba	[%l7 + %l1] 0x10,	%o2
	tvc	%icc,	0x2
	addcc	%l2,	0x1172,	%l0
	movrgez	%l3,	%o1,	%g3
	set	0x24, %o6
	stwa	%o0,	[%l7 + %o6] 0x19
	movleu	%xcc,	%l4,	%i5
	or	%g1,	0x0010,	%o3
	brgz,a	%i6,	loop_1248
	movle	%icc,	%o6,	%o7
	ldx	[%l7 + 0x18],	%g5
	nop
	setx	loop_1249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1248:
	fsrc2s	%f26,	%f16
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i3
loop_1249:
	fbe	%fcc0,	loop_1250
	movrlz	%i1,	%o5,	%i2
	fmul8ulx16	%f24,	%f24,	%f10
	movvs	%icc,	%o4,	%g7
loop_1250:
	fmovde	%xcc,	%f26,	%f25
	movrgez	%g4,	%i0,	%i4
	be	loop_1251
	fmovsvc	%icc,	%f5,	%f13
	movrgez	%g2,	%l1,	%l5
	fmuld8sux16	%f6,	%f24,	%f2
loop_1251:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%l6
	movg	%icc,	%i7,	%g6
	fmovrdne	%l2,	%f10,	%f26
	movrgz	%l0,	%o2,	%l3
	tvs	%xcc,	0x3
	and	%o1,	0x1FA9,	%o0
	fmovrdne	%g3,	%f12,	%f18
	srlx	%i5,	0x0E,	%l4
	alignaddr	%g1,	%i6,	%o3
	bvs	%icc,	loop_1252
	orcc	%o6,	%g5,	%i3
	move	%xcc,	%o7,	%o5
	orn	%i2,	%o4,	%i1
loop_1252:
	edge16n	%g4,	%g7,	%i4
	alignaddr	%g2,	%i0,	%l5
	add	%l6,	%l1,	%g6
	alignaddr	%l2,	%l0,	%o2
	movg	%xcc,	%l3,	%i7
	movrlz	%o1,	0x11C,	%g3
	umul	%o0,	0x1F24,	%i5
	st	%f2,	[%l7 + 0x2C]
	fpack32	%f6,	%f30,	%f26
	fmovsle	%icc,	%f3,	%f29
	fbn,a	%fcc0,	loop_1253
	taddcctv	%l4,	0x1031,	%g1
	faligndata	%f0,	%f30,	%f8
	ldx	[%l7 + 0x08],	%o3
loop_1253:
	fmovrde	%i6,	%f2,	%f8
	fmovsgu	%icc,	%f14,	%f17
	andn	%g5,	0x0453,	%i3
	be,a,pn	%icc,	loop_1254
	ta	%xcc,	0x7
	edge8l	%o7,	%o6,	%i2
	fmul8x16au	%f27,	%f29,	%f10
loop_1254:
	st	%f13,	[%l7 + 0x40]
	set	0x2C, %g2
	swapa	[%l7 + %g2] 0x10,	%o4
	lduw	[%l7 + 0x68],	%o5
	edge32ln	%i1,	%g7,	%g4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x60] %asi,	%f11
	fbge,a	%fcc0,	loop_1255
	tsubcctv	%g2,	%i0,	%i4
	umulcc	%l5,	%l6,	%l1
	smulcc	%l2,	%g6,	%l0
loop_1255:
	srl	%o2,	%l3,	%o1
	fzero	%f10
	tne	%icc,	0x7
	srl	%i7,	%o0,	%g3
	sdivcc	%i5,	0x0453,	%l4
	udiv	%g1,	0x0690,	%i6
	fmovsge	%xcc,	%f19,	%f25
	movpos	%icc,	%o3,	%g5
	subcc	%o7,	0x08F7,	%o6
	movcc	%xcc,	%i2,	%o4
	bpos,a	%icc,	loop_1256
	te	%icc,	0x5
	tcc	%icc,	0x0
	movrgez	%o5,	%i1,	%g7
loop_1256:
	movpos	%icc,	%g4,	%g2
	sdivx	%i0,	0x1FF6,	%i4
	fxors	%f18,	%f28,	%f3
	ldd	[%l7 + 0x10],	%f20
	tvs	%icc,	0x6
	fmovdneg	%icc,	%f17,	%f23
	wr	%g0,	0x89,	%asi
	stxa	%l5,	[%l7 + 0x50] %asi
	movrlez	%i3,	%l6,	%l1
	subc	%g6,	%l0,	%l2
	tpos	%icc,	0x2
	fmovdge	%xcc,	%f27,	%f13
	sth	%l3,	[%l7 + 0x30]
	movre	%o1,	0x1DF,	%o2
	fbge	%fcc3,	loop_1257
	fcmpne16	%f20,	%f8,	%i7
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%o0
	fmuld8ulx16	%f16,	%f16,	%f30
loop_1257:
	sdivx	%g3,	0x1940,	%l4
	nop
	setx	0x86945709,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xDB2DB68D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f27,	%f26
	nop
	set	0x08, %i5
	std	%f8,	[%l7 + %i5]
	edge8n	%i5,	%g1,	%i6
	fxors	%f6,	%f23,	%f8
	edge8n	%o3,	%g5,	%o6
	tvc	%xcc,	0x0
	set	0x34, %o0
	ldswa	[%l7 + %o0] 0x14,	%i2
	orcc	%o7,	0x087F,	%o5
	membar	0x2B
	udivx	%i1,	0x0677,	%o4
	fand	%f18,	%f28,	%f14
	addcc	%g4,	0x03AA,	%g2
	fbul	%fcc1,	loop_1258
	andncc	%g7,	%i4,	%l5
	fmovrdlz	%i3,	%f8,	%f2
	fmovdvs	%icc,	%f26,	%f16
loop_1258:
	fornot2s	%f12,	%f13,	%f29
	movpos	%xcc,	%l6,	%l1
	subc	%g6,	0x08A5,	%i0
	sllx	%l0,	0x01,	%l3
	popc	0x1D5A,	%o1
	fands	%f2,	%f19,	%f11
	membar	0x28
	smul	%o2,	%l2,	%i7
	tg	%icc,	0x0
	fbul,a	%fcc1,	loop_1259
	tn	%icc,	0x3
	movn	%xcc,	%g3,	%l4
	mulx	%i5,	%g1,	%o0
loop_1259:
	edge32l	%i6,	%o3,	%o6
	nop
	setx	0x6FDE25917069A642,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	umulcc	%g5,	0x16FD,	%o7
	or	%o5,	0x0715,	%i1
	orn	%o4,	%i2,	%g4
	ta	%icc,	0x2
	fmovdn	%xcc,	%f13,	%f9
	taddcctv	%g2,	%g7,	%l5
	fcmpeq16	%f20,	%f26,	%i3
	wr	%g0,	0x11,	%asi
	stha	%i4,	[%l7 + 0x7A] %asi
	edge32	%l6,	%l1,	%g6
	ta	%icc,	0x6
	movvc	%icc,	%l0,	%i0
	fmovrsgz	%l3,	%f20,	%f4
	te	%icc,	0x7
	fbue,a	%fcc1,	loop_1260
	sub	%o1,	%l2,	%i7
	movneg	%icc,	%g3,	%l4
	movrgz	%o2,	0x298,	%i5
loop_1260:
	alignaddr	%g1,	%i6,	%o3
	edge16ln	%o0,	%o6,	%o7
	bne,a	%xcc,	loop_1261
	fbue,a	%fcc0,	loop_1262
	alignaddr	%g5,	%o5,	%i1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o4
loop_1261:
	edge32n	%i2,	%g4,	%g2
loop_1262:
	fbule,a	%fcc2,	loop_1263
	fbule	%fcc2,	loop_1264
	fpackfix	%f30,	%f29
	wr	%g0,	0x2a,	%asi
	stba	%l5,	[%l7 + 0x7B] %asi
	membar	#Sync
loop_1263:
	sub	%i3,	0x1B48,	%g7
loop_1264:
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f22
	udiv	%i4,	0x0A93,	%l6
	lduw	[%l7 + 0x50],	%g6
	udiv	%l1,	0x1149,	%i0
	srax	%l3,	%l0,	%o1
	fpmerge	%f7,	%f14,	%f20
	edge8n	%l2,	%g3,	%i7
	ble,a	loop_1265
	nop
	setx	0xB0E4E25CD6A6068C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4241A53571E23881,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f16,	%f30
	set	0x54, %o1
	ldswa	[%l7 + %o1] 0x89,	%o2
loop_1265:
	taddcc	%i5,	0x003B,	%g1
	sdivx	%l4,	0x047C,	%o3
	movg	%icc,	%o0,	%i6
	bpos,pn	%icc,	loop_1266
	orncc	%o6,	%o7,	%g5
	movrgz	%o5,	%i1,	%i2
	tvc	%xcc,	0x4
loop_1266:
	bgu,a,pt	%icc,	loop_1267
	addccc	%o4,	%g4,	%l5
	bvc,a	loop_1268
	fsrc1	%f30,	%f4
loop_1267:
	movne	%icc,	%g2,	%g7
	taddcc	%i3,	%i4,	%l6
loop_1268:
	mulx	%g6,	%i0,	%l3
	edge16n	%l1,	%o1,	%l2
	fpsub32s	%f1,	%f21,	%f13
	addcc	%l0,	0x1AE6,	%i7
	or	%g3,	%o2,	%i5
	fba,a	%fcc1,	loop_1269
	udivcc	%g1,	0x1FDC,	%o3
	brgez,a	%o0,	loop_1270
	edge32l	%l4,	%o6,	%o7
loop_1269:
	fzeros	%f11
	tvs	%xcc,	0x4
loop_1270:
	nop
	setx	0x77CA0109905E32DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	xnorcc	%i6,	%g5,	%i1
	smulcc	%o5,	%o4,	%g4
	fbug,a	%fcc1,	loop_1271
	sir	0x0DFD
	ldsh	[%l7 + 0x28],	%i2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
loop_1271:
	fmovsle	%xcc,	%f28,	%f19
	fmovsge	%xcc,	%f16,	%f1
	array8	%g7,	%g2,	%i3
	tn	%icc,	0x1
	orcc	%i4,	%g6,	%i0
	sth	%l6,	[%l7 + 0x64]
	nop
	setx	loop_1272,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbe,a	%fcc3,	loop_1273
	ldd	[%l7 + 0x70],	%f26
	udiv	%l3,	0x0D9B,	%l1
loop_1272:
	movg	%icc,	%o1,	%l2
loop_1273:
	udivcc	%l0,	0x1174,	%i7
	nop
	fitos	%f13,	%f25
	fstox	%f25,	%f24
	fxtos	%f24,	%f14
	bvs,pt	%xcc,	loop_1274
	movrgez	%g3,	%i5,	%o2
	edge32l	%o3,	%o0,	%g1
	udivx	%o6,	0x167C,	%l4
loop_1274:
	nop
	setx	0x57F8EA00,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x79D1CD8D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f13,	%f28
	nop
	setx	0x57AD25FAE8B9228D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x8F713F200BFE09A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f2,	%f4
	umul	%i6,	%o7,	%i1
	tleu	%xcc,	0x3
	movrlz	%o5,	%o4,	%g5
	tcs	%icc,	0x6
	movrlz	%g4,	%l5,	%g7
	alignaddrl	%i2,	%i3,	%g2
	faligndata	%f26,	%f10,	%f26
	nop
	setx	0x2046C125,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	addc	%i4,	%g6,	%i0
	tl	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x58] %asi,	%l6
	fmovrsne	%l1,	%f5,	%f23
	udivx	%l3,	0x1AE4,	%l2
	smul	%o1,	0x08AB,	%i7
	mova	%icc,	%l0,	%g3
	tgu	%xcc,	0x5
	edge8n	%i5,	%o2,	%o3
	fmovsl	%xcc,	%f30,	%f20
	fmuld8sux16	%f9,	%f22,	%f0
	movgu	%xcc,	%o0,	%o6
	nop
	setx	0x6BC1BC1C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5018CACE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f20,	%f30
	bshuffle	%f20,	%f30,	%f6
	ta	%xcc,	0x5
	subccc	%l4,	%i6,	%o7
	tvc	%xcc,	0x4
	edge32	%i1,	%o5,	%g1
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1a8] %asi,	%g5 ripped by fixASI40.pl ripped by fixASI40.pl
	ldstub	[%l7 + 0x78],	%g4
	andncc	%o4,	%l5,	%i2
	movle	%icc,	%i3,	%g2
	move	%xcc,	%g7,	%i4
	bneg,a	%icc,	loop_1275
	umul	%g6,	%i0,	%l6
	edge8ln	%l1,	%l3,	%l2
	movle	%icc,	%o1,	%i7
loop_1275:
	sra	%g3,	%i5,	%o2
	edge16ln	%l0,	%o3,	%o0
	sub	%o6,	%i6,	%o7
	subcc	%i1,	0x1541,	%o5
	addc	%g1,	%l4,	%g4
	andcc	%o4,	0x13E8,	%l5
	subcc	%g5,	%i3,	%g2
	addcc	%i2,	0x1BE7,	%i4
	mulx	%g7,	%g6,	%i0
	fxor	%f26,	%f18,	%f16
	movvs	%xcc,	%l6,	%l3
	xor	%l1,	0x1F4C,	%o1
	fmovdleu	%xcc,	%f31,	%f12
	fmovdgu	%icc,	%f24,	%f22
	stbar
	fnot1s	%f5,	%f8
	tn	%icc,	0x1
	fcmpeq16	%f12,	%f20,	%l2
	alignaddr	%g3,	%i7,	%i5
	edge8	%o2,	%o3,	%o0
	mulscc	%l0,	%o6,	%o7
	movn	%icc,	%i6,	%o5
	or	%i1,	%l4,	%g4
	movvc	%icc,	%o4,	%g1
	xnor	%g5,	0x190F,	%i3
	fbo	%fcc0,	loop_1276
	ldsb	[%l7 + 0x42],	%l5
	fmovd	%f28,	%f30
	movrgez	%g2,	%i2,	%i4
loop_1276:
	andn	%g7,	%g6,	%l6
	brgz,a	%l3,	loop_1277
	tleu	%xcc,	0x0
	ba,pn	%xcc,	loop_1278
	sub	%i0,	%l1,	%l2
loop_1277:
	mulscc	%g3,	0x1895,	%i7
	srax	%o1,	0x14,	%i5
loop_1278:
	movneg	%icc,	%o3,	%o0
	sethi	0x0A00,	%o2
	udiv	%l0,	0x0D8E,	%o6
	bl,a	loop_1279
	fmovrsgez	%o7,	%f4,	%f8
	tle	%xcc,	0x5
	edge32n	%i6,	%o5,	%i1
loop_1279:
	fblg	%fcc1,	loop_1280
	xnor	%l4,	0x0DD8,	%g4
	fble,a	%fcc3,	loop_1281
	edge16	%o4,	%g1,	%i3
loop_1280:
	flush	%l7 + 0x60
	fmovdcs	%icc,	%f29,	%f26
loop_1281:
	movrlz	%l5,	0x2FC,	%g5
	fpackfix	%f10,	%f27
	set	0x2E, %o4
	ldsha	[%l7 + %o4] 0x81,	%g2
	taddcc	%i4,	0x163F,	%g7
	add	%i2,	%g6,	%l6
	set	0x61, %i4
	lduba	[%l7 + %i4] 0x15,	%l3
	tle	%xcc,	0x4
	fmovd	%f0,	%f2
	xorcc	%l1,	%i0,	%l2
	te	%icc,	0x4
	tleu	%icc,	0x7
	call	loop_1282
	fmovdpos	%xcc,	%f15,	%f25
	tg	%icc,	0x2
	wr	%g0,	0x2a,	%asi
	stba	%i7,	[%l7 + 0x0D] %asi
	membar	#Sync
loop_1282:
	fbug,a	%fcc0,	loop_1283
	mova	%icc,	%o1,	%g3
	bcs	loop_1284
	tg	%icc,	0x2
loop_1283:
	andcc	%o3,	0x0F77,	%i5
	orcc	%o2,	%o0,	%l0
loop_1284:
	move	%icc,	%o6,	%o7
	ldub	[%l7 + 0x54],	%o5
	fmovrsgz	%i6,	%f5,	%f9
	movvs	%xcc,	%i1,	%l4
	movrlz	%g4,	%o4,	%i3
	movn	%icc,	%g1,	%g5
	xnor	%l5,	0x0196,	%i4
	nop
	setx	0x67BA03D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4FC3DAD6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f23,	%f29
	edge32ln	%g7,	%i2,	%g2
	bne,pn	%xcc,	loop_1285
	array16	%g6,	%l6,	%l3
	xnorcc	%l1,	%i0,	%i7
	movvc	%icc,	%o1,	%g3
loop_1285:
	movre	%o3,	%i5,	%l2
	brnz	%o0,	loop_1286
	movrne	%l0,	0x21D,	%o6
	movrgez	%o2,	0x086,	%o5
	std	%f14,	[%l7 + 0x08]
loop_1286:
	movle	%icc,	%o7,	%i6
	movpos	%xcc,	%l4,	%i1
	tsubcc	%o4,	%g4,	%g1
	nop
	set	0x50, %o5
	prefetch	[%l7 + %o5],	 0x3
	xor	%i3,	%l5,	%g5
	fmovscs	%icc,	%f22,	%f24
	movn	%xcc,	%i4,	%g7
	sllx	%i2,	0x0B,	%g2
	udiv	%l6,	0x1FB7,	%l3
	xnorcc	%l1,	0x0901,	%i0
	fmovdle	%xcc,	%f2,	%f14
	movleu	%xcc,	%i7,	%o1
	move	%xcc,	%g3,	%o3
	orcc	%g6,	%i5,	%o0
	brgez	%l2,	loop_1287
	fbne	%fcc0,	loop_1288
	tne	%icc,	0x1
	or	%l0,	0x0A62,	%o6
loop_1287:
	taddcc	%o2,	0x0BCB,	%o7
loop_1288:
	tne	%xcc,	0x5
	ldsw	[%l7 + 0x38],	%i6
	tcc	%icc,	0x4
	movre	%o5,	0x306,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i1,	%g4
	fbe	%fcc0,	loop_1289
	nop
	setx	0x418CB748,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xA00F3A69,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f24,	%f28
	fbge,a	%fcc2,	loop_1290
	subc	%g1,	0x0FC0,	%o4
loop_1289:
	srlx	%i3,	%l5,	%g5
	brlz,a	%g7,	loop_1291
loop_1290:
	fmovscc	%icc,	%f14,	%f30
	bvs	loop_1292
	std	%f16,	[%l7 + 0x70]
loop_1291:
	tgu	%icc,	0x3
	addcc	%i2,	%i4,	%g2
loop_1292:
	fbul,a	%fcc3,	loop_1293
	xnorcc	%l6,	%l1,	%l3
	srax	%i7,	0x07,	%i0
	subccc	%g3,	%o1,	%o3
loop_1293:
	bpos,a	%xcc,	loop_1294
	udivcc	%g6,	0x1477,	%i5
	movl	%xcc,	%o0,	%l0
	xor	%o6,	0x1B94,	%l2
loop_1294:
	fba,a	%fcc3,	loop_1295
	brlz,a	%o2,	loop_1296
	ldub	[%l7 + 0x1F],	%i6
	and	%o7,	%l4,	%i1
loop_1295:
	fpsub16	%f16,	%f26,	%f8
loop_1296:
	fmovsvs	%xcc,	%f21,	%f13
	tcs	%xcc,	0x3
	tgu	%xcc,	0x1
	edge16n	%g4,	%g1,	%o4
	subc	%i3,	0x08AA,	%l5
	stx	%o5,	[%l7 + 0x48]
	subccc	%g7,	%i2,	%i4
	tn	%xcc,	0x5
	fmovdl	%xcc,	%f30,	%f31
	set	0x34, %o2
	lduwa	[%l7 + %o2] 0x80,	%g2
	bpos,a,pn	%icc,	loop_1297
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%g5,	%l6
loop_1297:
	brz	%l1,	loop_1298
	nop
	fitos	%f21,	%f4
	tvc	%icc,	0x4
	tpos	%xcc,	0x6
loop_1298:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l3,	%i7
	or	%i0,	%o1,	%o3
	tpos	%xcc,	0x2
	movl	%xcc,	%g6,	%g3
	subc	%i5,	%l0,	%o6
	tsubcc	%o0,	0x1C4A,	%o2
	orn	%i6,	0x1AB4,	%o7
	movle	%icc,	%l2,	%l4
	std	%f30,	[%l7 + 0x50]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc1,	loop_1299
	stw	%i1,	[%l7 + 0x5C]
	movge	%icc,	%g4,	%g1
	orncc	%o4,	%l5,	%i3
loop_1299:
	movvc	%icc,	%g7,	%o5
	bleu	%icc,	loop_1300
	movl	%xcc,	%i2,	%g2
	fbne	%fcc1,	loop_1301
	brlz	%i4,	loop_1302
loop_1300:
	mulscc	%g5,	0x09C3,	%l6
	add	%l3,	%l1,	%i0
loop_1301:
	nop
	setx	0x1E66BEDA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x5EAF07DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f19,	%f14
loop_1302:
	tg	%icc,	0x5
	fsrc1	%f24,	%f14
	and	%o1,	%i7,	%g6
	tgu	%icc,	0x7
	udivx	%o3,	0x0101,	%g3
	movn	%icc,	%l0,	%o6
	movge	%icc,	%i5,	%o0
	sdivcc	%i6,	0x14E7,	%o2
	nop
	setx	0x19B7C8BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x75070C6B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f19,	%f13
	brgez,a	%o7,	loop_1303
	movcs	%icc,	%l4,	%i1
	fble,a	%fcc2,	loop_1304
	fbn	%fcc2,	loop_1305
loop_1303:
	alignaddr	%g4,	%l2,	%g1
	movn	%xcc,	%o4,	%l5
loop_1304:
	edge32n	%g7,	%i3,	%o5
loop_1305:
	addcc	%i2,	0x161A,	%i4
	brlez,a	%g5,	loop_1306
	brgz	%g2,	loop_1307
	fble	%fcc3,	loop_1308
	movge	%xcc,	%l3,	%l6
loop_1306:
	addcc	%l1,	%o1,	%i0
loop_1307:
	movne	%icc,	%g6,	%o3
loop_1308:
	orn	%i7,	0x12C1,	%g3
	membar	0x6E
	edge8l	%o6,	%i5,	%o0
	fblg,a	%fcc0,	loop_1309
	stw	%i6,	[%l7 + 0x68]
	udivcc	%o2,	0x1F9F,	%l0
	movvc	%icc,	%o7,	%l4
loop_1309:
	fandnot2s	%f1,	%f27,	%f2
	ldsw	[%l7 + 0x2C],	%i1
	fmovdpos	%xcc,	%f17,	%f25
	bgu	%xcc,	loop_1310
	movne	%icc,	%l2,	%g4
	tcc	%icc,	0x3
	call	loop_1311
loop_1310:
	fand	%f22,	%f16,	%f0
	fcmpgt16	%f26,	%f8,	%o4
	edge16l	%l5,	%g1,	%g7
loop_1311:
	umulcc	%o5,	%i3,	%i2
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f2
	fxtos	%f2,	%f30
	edge32	%i4,	%g2,	%l3
	movgu	%icc,	%l6,	%l1
	movrgz	%g5,	%i0,	%o1
	fmuld8sux16	%f5,	%f31,	%f12
	ldd	[%l7 + 0x28],	%g6
	array8	%i7,	%g3,	%o3
	srl	%o6,	0x13,	%i5
	popc	%i6,	%o0
	fbe,a	%fcc3,	loop_1312
	movvs	%icc,	%l0,	%o2
	fmovrslz	%l4,	%f25,	%f18
	and	%o7,	0x09BF,	%l2
loop_1312:
	nop
	setx	0x52E4181A9DCD03DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x341ED4717B11CDE5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f0,	%f8
	be,pn	%xcc,	loop_1313
	sll	%g4,	0x15,	%i1
	movvc	%icc,	%l5,	%o4
	sir	0x0F4D
loop_1313:
	bvs,pt	%icc,	loop_1314
	nop
	setx	0xA3717EF34C66329C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xFE0114F0D40E75E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f4,	%f2
	membar	0x03
	ble,pn	%xcc,	loop_1315
loop_1314:
	stx	%g7,	[%l7 + 0x50]
	nop
	setx	0xE074F1FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	fbn,a	%fcc0,	loop_1316
loop_1315:
	tl	%xcc,	0x7
	movpos	%xcc,	%g1,	%i3
	xnor	%i2,	%o5,	%i4
loop_1316:
	movrgez	%l3,	0x035,	%g2
	fbe	%fcc1,	loop_1317
	edge16	%l6,	%g5,	%l1
	fxnors	%f3,	%f26,	%f1
	movl	%xcc,	%i0,	%g6
loop_1317:
	edge8l	%i7,	%g3,	%o1
	ldd	[%l7 + 0x08],	%f20
	pdist	%f24,	%f14,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o6,	%i5,	%i6
	fpsub16s	%f9,	%f18,	%f1
	movvc	%icc,	%o0,	%l0
	movvs	%icc,	%o2,	%o3
	bneg,pn	%xcc,	loop_1318
	fmovde	%icc,	%f3,	%f20
	xorcc	%l4,	%o7,	%g4
	nop
	setx	loop_1319,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1318:
	tn	%xcc,	0x0
	edge8l	%l2,	%l5,	%o4
	addc	%i1,	%g1,	%i3
loop_1319:
	prefetch	[%l7 + 0x44],	 0x3
	fbl,a	%fcc0,	loop_1320
	array8	%g7,	%o5,	%i4
	nop
	setx	loop_1321,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%l3,	%i2
loop_1320:
	movrgz	%l6,	%g2,	%l1
	bne	loop_1322
loop_1321:
	tl	%icc,	0x6
	tsubcc	%i0,	0x087F,	%g5
	fmovsvs	%icc,	%f16,	%f5
loop_1322:
	edge8ln	%g6,	%i7,	%g3
	sll	%o6,	0x14,	%o1
	edge16ln	%i6,	%i5,	%l0
	fmovrse	%o0,	%f28,	%f29
	tvs	%icc,	0x4
	edge32ln	%o2,	%l4,	%o7
	array16	%o3,	%g4,	%l5
	movgu	%xcc,	%o4,	%i1
	edge16n	%l2,	%g1,	%i3
	movn	%icc,	%o5,	%i4
	or	%g7,	0x1ED1,	%i2
	fmovd	%f6,	%f10
	tsubcctv	%l3,	0x082D,	%l6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x04,	%f0
	sir	0x1129
	sethi	0x17F3,	%g2
	udivx	%l1,	0x00E5,	%g5
	set	0x2C, %i7
	lda	[%l7 + %i7] 0x18,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g6,	[%l7 + 0x68]
	fornot1	%f16,	%f18,	%f28
	tsubcctv	%i7,	%g3,	%i0
	array32	%o1,	%i6,	%i5
	edge8n	%l0,	%o6,	%o0
	add	%o2,	%l4,	%o3
	fmovdleu	%xcc,	%f4,	%f12
	tle	%icc,	0x5
	sdivx	%o7,	0x10F8,	%l5
	movg	%icc,	%o4,	%g4
	srl	%l2,	%g1,	%i1
	bl,a,pt	%xcc,	loop_1323
	ldsh	[%l7 + 0x50],	%i3
	nop
	setx	0xD26AA7FDEB1CAA14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f14
	subcc	%i4,	0x1281,	%g7
loop_1323:
	edge16l	%i2,	%l3,	%l6
	movvs	%xcc,	%g2,	%o5
	nop
	set	0x68, %g4
	ldstub	[%l7 + %g4],	%g5
	or	%g6,	%i7,	%g3
	movrne	%i0,	0x24D,	%o1
	nop
	setx	0x214830A1BAD2D53C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x4569D3D9478A4E69,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f14,	%f4
	fbn,a	%fcc2,	loop_1324
	nop
	setx	loop_1325,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%i6,	0x003C,	%l1
	edge8l	%l0,	%i5,	%o6
loop_1324:
	umulcc	%o2,	0x0BBE,	%o0
loop_1325:
	movleu	%xcc,	%o3,	%o7
	sth	%l4,	[%l7 + 0x44]
	edge8n	%o4,	%g4,	%l5
	bneg,a,pt	%xcc,	loop_1326
	sdivx	%l2,	0x11CE,	%g1
	nop
	setx	0x73BEDE69607E22AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	for	%f18,	%f16,	%f12
loop_1326:
	srlx	%i1,	%i4,	%i3
	srlx	%g7,	0x1A,	%i2
	movg	%icc,	%l3,	%g2
	bvs	%icc,	loop_1327
	umul	%l6,	0x0CFD,	%o5
	stw	%g6,	[%l7 + 0x74]
	ldd	[%l7 + 0x28],	%f2
loop_1327:
	mulx	%i7,	%g5,	%g3
	std	%f16,	[%l7 + 0x50]
	lduh	[%l7 + 0x3A],	%o1
	andcc	%i0,	0x00D6,	%i6
	movgu	%icc,	%l0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i5,	%o6
	edge8n	%o2,	%o0,	%o3
	nop
	fitod	%f0,	%f14
	fble,a	%fcc2,	loop_1328
	smul	%o7,	0x0F5D,	%l4
	brlz	%o4,	loop_1329
	movne	%xcc,	%g4,	%l5
loop_1328:
	smulcc	%g1,	0x0CAC,	%i1
	fmovrsgz	%l2,	%f9,	%f6
loop_1329:
	udiv	%i4,	0x0F9A,	%i3
	udiv	%i2,	0x01B5,	%l3
	flush	%l7 + 0x54
	movrgez	%g7,	0x09A,	%l6
	fnegd	%f30,	%f28
	subc	%o5,	0x1B9D,	%g6
	add	%g2,	%g5,	%g3
	tcs	%xcc,	0x0
	fbge,a	%fcc2,	loop_1330
	edge32n	%i7,	%o1,	%i0
	stb	%i6,	[%l7 + 0x5B]
	udiv	%l0,	0x04E2,	%l1
loop_1330:
	sdiv	%o6,	0x1BDD,	%i5
	udivcc	%o0,	0x01C9,	%o3
	fmovrslz	%o7,	%f25,	%f18
	brz,a	%o2,	loop_1331
	tl	%icc,	0x0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x08] %asi,	%o4
loop_1331:
	smulcc	%g4,	%l5,	%g1
	tn	%xcc,	0x3
	udivcc	%i1,	0x0B9F,	%l4
	ldstub	[%l7 + 0x50],	%i4
	udivx	%i3,	0x005C,	%l2
	mova	%icc,	%i2,	%l3
	sll	%g7,	0x18,	%l6
	edge8	%o5,	%g6,	%g5
	movrlez	%g2,	%i7,	%g3
	addccc	%o1,	0x0B28,	%i0
	movrne	%i6,	%l1,	%o6
	fmovdg	%icc,	%f10,	%f7
	orncc	%i5,	0x077D,	%o0
	fpack32	%f22,	%f0,	%f28
	edge16ln	%o3,	%o7,	%l0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x32] %asi,	%o4
	fbl	%fcc1,	loop_1332
	movle	%icc,	%g4,	%l5
	fmovdl	%xcc,	%f0,	%f4
	fmovdvc	%icc,	%f9,	%f4
loop_1332:
	tvc	%icc,	0x2
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	flush	%l7 + 0x74
	tcc	%icc,	0x1
	tne	%icc,	0x0
	smul	%g1,	%i1,	%o2
	movrlz	%l4,	0x1B1,	%i4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i3
	bgu,pn	%xcc,	loop_1333
	fandnot2	%f0,	%f4,	%f30
	movne	%xcc,	%i2,	%l3
	fcmpne32	%f22,	%f8,	%l2
loop_1333:
	edge8	%l6,	%o5,	%g7
	set	0x24, %o7
	stba	%g6,	[%l7 + %o7] 0x2b
	membar	#Sync
	umulcc	%g5,	%i7,	%g3
	sra	%g2,	%o1,	%i0
	array32	%l1,	%o6,	%i5
	fxnor	%f12,	%f14,	%f22
	edge16	%i6,	%o0,	%o3
	xnor	%l0,	%o7,	%o4
	sethi	0x14F4,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g4,	0x0DE1,	%g1
	movrgez	%o2,	0x063,	%l4
	nop
	setx	0xC02B2D7DB9EDBB22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xE9F99B08944B97AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f28,	%f16
	fsrc1	%f16,	%f10
	ldstub	[%l7 + 0x0D],	%i1
	move	%xcc,	%i3,	%i2
	taddcctv	%i4,	0x101A,	%l2
	movn	%icc,	%l3,	%o5
	mulx	%l6,	%g6,	%g7
	tneg	%xcc,	0x4
	fnot1s	%f8,	%f28
	bge,a,pn	%xcc,	loop_1334
	array8	%g5,	%g3,	%g2
	and	%i7,	0x0FDF,	%i0
	andn	%o1,	0x0DA9,	%o6
loop_1334:
	fbl,a	%fcc2,	loop_1335
	sdiv	%l1,	0x0737,	%i5
	movvs	%xcc,	%i6,	%o0
	and	%o3,	%o7,	%o4
loop_1335:
	sethi	0x0EB7,	%l0
	fornot2s	%f7,	%f27,	%f13
	fmovscc	%xcc,	%f31,	%f25
	andcc	%g4,	%g1,	%l5
	orn	%o2,	%l4,	%i3
	brz	%i1,	loop_1336
	movne	%icc,	%i4,	%i2
	fpsub32s	%f5,	%f2,	%f17
	tl	%xcc,	0x0
loop_1336:
	movre	%l2,	0x125,	%l3
	fbug	%fcc3,	loop_1337
	fornot1s	%f21,	%f30,	%f30
	array16	%l6,	%g6,	%g7
	be	%icc,	loop_1338
loop_1337:
	edge8	%g5,	%o5,	%g3
	xnorcc	%i7,	%g2,	%i0
	tn	%xcc,	0x7
loop_1338:
	fmovspos	%xcc,	%f19,	%f14
	movleu	%icc,	%o1,	%o6
	tg	%icc,	0x3
	popc	%i5,	%l1
	fornot2	%f16,	%f30,	%f26
	tsubcc	%i6,	%o0,	%o3
	xor	%o7,	%o4,	%g4
	addcc	%l0,	0x00DB,	%g1
	fmuld8ulx16	%f11,	%f16,	%f8
	brlz,a	%o2,	loop_1339
	faligndata	%f22,	%f22,	%f2
	tg	%icc,	0x4
	bne	loop_1340
loop_1339:
	fmovdgu	%icc,	%f13,	%f26
	fcmpne16	%f4,	%f8,	%l5
	nop
	set	0x68, %g6
	std	%f6,	[%l7 + %g6]
loop_1340:
	addccc	%i3,	%i1,	%l4
	srl	%i4,	0x02,	%i2
	lduh	[%l7 + 0x72],	%l2
	mova	%icc,	%l3,	%l6
	membar	0x4C
	srl	%g7,	0x02,	%g5
	fbuge	%fcc0,	loop_1341
	fmovsvs	%icc,	%f29,	%f24
	ldd	[%l7 + 0x58],	%f24
	fsrc2	%f26,	%f22
loop_1341:
	fbule,a	%fcc2,	loop_1342
	brlez	%g6,	loop_1343
	andcc	%g3,	0x0F8E,	%o5
	movcs	%icc,	%g2,	%i0
loop_1342:
	addccc	%i7,	%o6,	%i5
loop_1343:
	fmovsa	%icc,	%f26,	%f5
	call	loop_1344
	movle	%xcc,	%o1,	%l1
	fxors	%f7,	%f30,	%f2
	mova	%xcc,	%o0,	%o3
loop_1344:
	udivx	%i6,	0x0722,	%o4
	te	%icc,	0x2
	taddcc	%o7,	0x07CF,	%g4
	edge32n	%g1,	%l0,	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%i3
	fmuld8sux16	%f23,	%f12,	%f20
	sethi	0x0757,	%l4
	wr	%g0,	0x2b,	%asi
	stxa	%i4,	[%l7 + 0x40] %asi
	membar	#Sync
	fpack16	%f4,	%f9
	st	%f11,	[%l7 + 0x7C]
	nop
	set	0x78, %o3
	std	%f6,	[%l7 + %o3]
	movne	%icc,	%i1,	%i2
	set	0x28, %i1
	stxa	%l3,	[%l7 + %i1] 0x27
	membar	#Sync
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%l2
	bge,a,pn	%xcc,	loop_1345
	tneg	%icc,	0x2
	movneg	%xcc,	%g7,	%l6
	tl	%icc,	0x3
loop_1345:
	fnot1s	%f25,	%f28
	fbug	%fcc1,	loop_1346
	andncc	%g6,	%g3,	%o5
	brlz,a	%g2,	loop_1347
	ldd	[%l7 + 0x58],	%f12
loop_1346:
	subc	%g5,	%i0,	%i7
	addcc	%o6,	0x1596,	%i5
loop_1347:
	brz,a	%l1,	loop_1348
	nop
	fitod	%f6,	%f2
	tg	%icc,	0x6
	fmovrslz	%o1,	%f27,	%f31
loop_1348:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x34] %asi,	%o3
	fnot2s	%f14,	%f17
	fsrc2	%f18,	%f10
	bne	%xcc,	loop_1349
	udiv	%o0,	0x0361,	%o4
	tpos	%icc,	0x3
	smul	%i6,	0x177E,	%o7
loop_1349:
	fmovdn	%icc,	%f26,	%f25
	edge32n	%g1,	%l0,	%o2
	fabss	%f20,	%f7
	fba,a	%fcc2,	loop_1350
	fpadd32s	%f17,	%f11,	%f11
	call	loop_1351
	nop
	setx loop_1352, %l0, %l1
	jmpl %l1, %l5
loop_1350:
	fmovrslz	%i3,	%f2,	%f2
	movne	%icc,	%l4,	%i4
loop_1351:
	fba,a	%fcc3,	loop_1353
loop_1352:
	fmovdn	%xcc,	%f13,	%f4
	tneg	%xcc,	0x2
	udiv	%g4,	0x1302,	%i1
loop_1353:
	tgu	%xcc,	0x1
	fxnor	%f24,	%f14,	%f20
	bpos,pn	%icc,	loop_1354
	fnot2s	%f2,	%f23
	ba,a,pt	%xcc,	loop_1355
	edge16l	%i2,	%l2,	%l3
loop_1354:
	ld	[%l7 + 0x2C],	%f25
	fmovdgu	%xcc,	%f0,	%f17
loop_1355:
	fbule	%fcc2,	loop_1356
	fbuge	%fcc1,	loop_1357
	fmul8x16au	%f24,	%f24,	%f16
	nop
	setx	0x3613B47DA1B1E93D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xDF555B299CB8BBA3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f0,	%f4
loop_1356:
	bne,pt	%icc,	loop_1358
loop_1357:
	movvs	%icc,	%l6,	%g7
	fone	%f8
	smul	%g6,	0x1E44,	%g3
loop_1358:
	alignaddrl	%g2,	%g5,	%i0
	sethi	0x113B,	%i7
	set	0x4C, %g5
	ldswa	[%l7 + %g5] 0x88,	%o5
	tne	%icc,	0x4
	movne	%xcc,	%i5,	%o6
	fblg	%fcc1,	loop_1359
	nop
	setx	0x9B948805,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x8A4BF5F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f26,	%f25
	and	%o1,	0x1228,	%o3
	stbar
loop_1359:
	movrlz	%o0,	0x11F,	%o4
	umul	%i6,	0x0BDD,	%l1
	fornot2	%f18,	%f16,	%f0
	udivcc	%o7,	0x11DF,	%l0
	fmovdvs	%xcc,	%f6,	%f23
	tn	%icc,	0x1
	umulcc	%o2,	%l5,	%i3
	bvc,a	loop_1360
	srax	%l4,	%i4,	%g4
	edge16ln	%i1,	%i2,	%l2
	fbe,a	%fcc3,	loop_1361
loop_1360:
	movpos	%icc,	%g1,	%l3
	fpack32	%f10,	%f0,	%f2
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f28
loop_1361:
	edge16ln	%l6,	%g6,	%g3
	edge16	%g2,	%g5,	%i0
	srl	%i7,	0x04,	%g7
	sethi	0x0A3F,	%i5
	tne	%xcc,	0x4
	tsubcc	%o6,	%o5,	%o3
	movrne	%o0,	0x3C0,	%o1
	tne	%icc,	0x0
	alignaddrl	%i6,	%l1,	%o7
	fnegs	%f21,	%f13
	movg	%xcc,	%o4,	%l0
	movvs	%icc,	%o2,	%i3
	fmovrslz	%l5,	%f9,	%f28
	xnorcc	%l4,	%g4,	%i1
	tsubcc	%i4,	%i2,	%g1
	mova	%xcc,	%l3,	%l6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x76] %asi,	%l2
	bg,pt	%xcc,	loop_1362
	fcmpne32	%f30,	%f14,	%g6
	fsrc1s	%f3,	%f20
	edge8ln	%g3,	%g2,	%i0
loop_1362:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x30] %asi
	fnot1	%f26,	%f6
	fmovsleu	%xcc,	%f23,	%f28
	tn	%xcc,	0x3
	wr	%g0,	0x27,	%asi
	stwa	%i7,	[%l7 + 0x50] %asi
	membar	#Sync
	fxor	%f6,	%f24,	%f24
	fmovsvc	%xcc,	%f12,	%f6
	alignaddr	%g7,	%g5,	%i5
	umul	%o5,	0x0C54,	%o3
	tneg	%icc,	0x5
	fexpand	%f27,	%f6
	tcs	%xcc,	0x4
	fnegs	%f13,	%f3
	st	%f30,	[%l7 + 0x74]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x18
	ld	[%l7 + 0x4C],	%f2
	fbuge,a	%fcc0,	loop_1363
	fmovdvs	%icc,	%f10,	%f9
	te	%icc,	0x6
	fandnot1	%f22,	%f2,	%f30
loop_1363:
	tsubcctv	%o6,	0x1777,	%o1
	popc	0x19A2,	%o0
	tpos	%xcc,	0x0
	edge8ln	%i6,	%l1,	%o7
	tcc	%xcc,	0x7
	array32	%o4,	%o2,	%i3
	sra	%l0,	0x00,	%l4
	fcmpeq32	%f12,	%f18,	%l5
	fcmpgt16	%f8,	%f4,	%g4
	tvs	%icc,	0x3
	nop
	setx	0x897F59B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f5
	udivx	%i1,	0x105D,	%i4
	bge,pn	%icc,	loop_1364
	sir	0x1E69
	subc	%g1,	0x1634,	%l3
	popc	%l6,	%l2
loop_1364:
	tgu	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g6,	%i2,	%g2
	alignaddr	%i0,	%g3,	%g7
	te	%xcc,	0x3
	set	0x09, %i0
	ldstuba	[%l7 + %i0] 0x19,	%i7
	brgz	%i5,	loop_1365
	brgez,a	%o5,	loop_1366
	ta	%xcc,	0x0
	movge	%xcc,	%g5,	%o3
loop_1365:
	edge16	%o6,	%o0,	%i6
loop_1366:
	array32	%l1,	%o7,	%o1
	sub	%o4,	0x1B17,	%i3
	fmovsa	%icc,	%f6,	%f21
	ba,a,pt	%icc,	loop_1367
	fnegs	%f13,	%f3
	sdivx	%l0,	0x10EE,	%o2
	tsubcctv	%l5,	%g4,	%l4
loop_1367:
	tsubcctv	%i1,	%i4,	%g1
	fnot1	%f2,	%f22
	brnz	%l6,	loop_1368
	sllx	%l3,	%l2,	%i2
	xor	%g2,	%i0,	%g6
	move	%icc,	%g3,	%i7
loop_1368:
	stb	%g7,	[%l7 + 0x1C]
	set	0x60, %l4
	lduba	[%l7 + %l4] 0x81,	%i5
	fnors	%f27,	%f7,	%f18
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%o5
	tsubcctv	%o3,	%g5,	%o6
	bne,pn	%xcc,	loop_1369
	movvs	%icc,	%i6,	%o0
	edge16ln	%l1,	%o7,	%o4
	bpos	%xcc,	loop_1370
loop_1369:
	edge8n	%i3,	%o1,	%l0
	fmovdvc	%icc,	%f17,	%f13
	sdivcc	%o2,	0x1652,	%g4
loop_1370:
	tle	%icc,	0x6
	bne,pn	%xcc,	loop_1371
	sra	%l4,	%i1,	%i4
	smul	%l5,	0x0C27,	%l6
	ba,pt	%xcc,	loop_1372
loop_1371:
	fmovrslz	%l3,	%f9,	%f20
	taddcc	%g1,	0x0E77,	%l2
	tn	%icc,	0x0
loop_1372:
	andn	%g2,	%i0,	%g6
	mova	%icc,	%g3,	%i7
	fxnors	%f18,	%f13,	%f18
	for	%f14,	%f14,	%f10
	ta	%xcc,	0x2
	edge8l	%i2,	%i5,	%o5
	fsrc2s	%f4,	%f9
	alignaddr	%o3,	%g7,	%o6
	fmul8x16au	%f17,	%f30,	%f20
	movvs	%xcc,	%g5,	%i6
	fmovdg	%xcc,	%f0,	%f23
	lduw	[%l7 + 0x20],	%l1
	bcs	loop_1373
	lduh	[%l7 + 0x6E],	%o0
	tneg	%xcc,	0x3
	fsrc1s	%f27,	%f2
loop_1373:
	bvc,pt	%icc,	loop_1374
	brnz,a	%o4,	loop_1375
	bge,pn	%icc,	loop_1376
	fbne,a	%fcc1,	loop_1377
loop_1374:
	tsubcc	%i3,	%o7,	%o1
loop_1375:
	move	%xcc,	%o2,	%g4
loop_1376:
	movrlz	%l0,	0x02A,	%i1
loop_1377:
	bgu,pn	%icc,	loop_1378
	movcs	%xcc,	%l4,	%l5
	fsrc2	%f6,	%f14
	movneg	%xcc,	%l6,	%l3
loop_1378:
	fbo	%fcc3,	loop_1379
	andn	%g1,	%l2,	%g2
	udivx	%i0,	0x192D,	%i4
	alignaddr	%g3,	%i7,	%i2
loop_1379:
	membar	0x58
	movrlez	%i5,	0x14A,	%g6
	fbue,a	%fcc0,	loop_1380
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o3,	%o5,	%o6
	srax	%g5,	0x1C,	%i6
loop_1380:
	sra	%g7,	%o0,	%l1
	fands	%f21,	%f25,	%f14
	edge32n	%o4,	%i3,	%o1
	fxnor	%f28,	%f18,	%f16
	edge8ln	%o2,	%g4,	%l0
	sll	%i1,	0x02,	%o7
	fornot2	%f4,	%f2,	%f10
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x20] %asi
	edge8	%l5,	%l6,	%l4
	fsrc1	%f26,	%f18
	fmul8x16	%f11,	%f30,	%f10
	alignaddrl	%g1,	%l3,	%l2
	te	%xcc,	0x2
	subc	%i0,	0x1CF5,	%i4
	tsubcctv	%g2,	0x1D03,	%g3
	nop
	setx	0xCE84172BBFCE0C95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x55E962D45185958A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f18,	%f2
	nop
	setx	loop_1381,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsleu	%xcc,	%f10,	%f22
	fmovdcc	%icc,	%f17,	%f24
	movre	%i7,	%i2,	%i5
loop_1381:
	bg,a,pn	%xcc,	loop_1382
	or	%g6,	%o5,	%o6
	brnz,a	%o3,	loop_1383
	tn	%xcc,	0x3
loop_1382:
	tpos	%icc,	0x2
	fmovda	%xcc,	%f15,	%f4
loop_1383:
	mulx	%g5,	0x0CB5,	%g7
	movpos	%xcc,	%i6,	%o0
	addc	%o4,	%l1,	%i3
	udivx	%o1,	0x18AA,	%o2
	or	%l0,	0x185B,	%g4
	fmovrdne	%o7,	%f6,	%f26
	ldd	[%l7 + 0x50],	%i0
	and	%l5,	0x18C7,	%l4
	fba	%fcc0,	loop_1384
	fbo,a	%fcc3,	loop_1385
	nop
	fitod	%f26,	%f16
	nop
	setx	0xA1A017B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xE689B7A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f9,	%f20
loop_1384:
	umul	%g1,	0x15B1,	%l6
loop_1385:
	edge32l	%l2,	%i0,	%i4
	movrlez	%l3,	0x0F2,	%g3
	movvs	%xcc,	%i7,	%g2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x3C] %asi,	%f1
	fble	%fcc2,	loop_1386
	fmovd	%f24,	%f12
	fcmpne32	%f6,	%f22,	%i5
	alignaddrl	%g6,	%o5,	%i2
loop_1386:
	sdivcc	%o3,	0x0432,	%o6
	add	%g7,	0x1EF6,	%i6
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	movneg	%icc,	%g5,	%o4
	sub	%o0,	%l1,	%o1
	bcc,a,pn	%xcc,	loop_1387
	tvc	%icc,	0x7
	wr	%g0,	0x18,	%asi
	sta	%f10,	[%l7 + 0x28] %asi
loop_1387:
	movrlz	%o2,	0x2B6,	%i3
	tg	%icc,	0x5
	fmovsle	%icc,	%f27,	%f4
	subcc	%g4,	%l0,	%i1
	edge8ln	%l5,	%l4,	%o7
	xor	%g1,	%l2,	%i0
	set	0x44, %l3
	lda	[%l7 + %l3] 0x14,	%f16
	sdivx	%l6,	0x1F42,	%l3
	movrgz	%i4,	0x186,	%i7
	addccc	%g2,	%i5,	%g3
	tneg	%icc,	0x3
	bleu,a	loop_1388
	brlz	%g6,	loop_1389
	sdivcc	%i2,	0x175E,	%o3
	fmovdvs	%xcc,	%f30,	%f18
loop_1388:
	fmovsle	%xcc,	%f1,	%f17
loop_1389:
	srax	%o6,	%o5,	%i6
	movrne	%g7,	%o4,	%g5
	tcs	%xcc,	0x2
	edge16n	%l1,	%o0,	%o1
	addccc	%i3,	0x022B,	%o2
	edge16	%l0,	%i1,	%g4
	fbn	%fcc2,	loop_1390
	movrlz	%l4,	%l5,	%g1
	fcmple32	%f28,	%f28,	%l2
	addc	%o7,	%i0,	%l6
loop_1390:
	fmovda	%icc,	%f30,	%f9
	movleu	%icc,	%i4,	%l3
	stb	%i7,	[%l7 + 0x34]
	xnorcc	%i5,	%g2,	%g6
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f13
	bvc,a,pn	%icc,	loop_1391
	fxors	%f29,	%f22,	%f2
	fmovdvc	%xcc,	%f11,	%f10
	nop
	fitos	%f2,	%f29
	fstox	%f29,	%f24
loop_1391:
	addc	%i2,	%g3,	%o3
	fmovd	%f14,	%f0
	sub	%o6,	%i6,	%o5
	nop
	setx	0x9A86F4BA804F2550,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tn	%icc,	0x0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x1f
	membar	#Sync
	movcs	%xcc,	%o4,	%g5
	orncc	%g7,	%o0,	%l1
	fmovd	%f2,	%f4
	sth	%i3,	[%l7 + 0x2E]
	sllx	%o1,	0x12,	%o2
	xnorcc	%i1,	0x02E8,	%l0
	movre	%l4,	%g4,	%g1
	array32	%l2,	%l5,	%o7
	movneg	%icc,	%i0,	%l6
	addcc	%i4,	%l3,	%i5
	fble	%fcc0,	loop_1392
	nop
	set	0x58, %g3
	stw	%i7,	[%l7 + %g3]
	bge	%icc,	loop_1393
	edge8l	%g2,	%i2,	%g6
loop_1392:
	mova	%xcc,	%o3,	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x11,	%g3,	%o5
loop_1393:
	taddcctv	%i6,	%g5,	%g7
	mova	%xcc,	%o4,	%o0
	bl,pt	%xcc,	loop_1394
	movrgez	%i3,	%l1,	%o1
	subc	%i1,	0x1D12,	%l0
	edge16	%l4,	%o2,	%g4
loop_1394:
	brnz	%g1,	loop_1395
	movrgez	%l5,	0x04F,	%o7
	fornot2	%f10,	%f14,	%f4
	nop
	setx	0x29641D1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xF3A4F43B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f8,	%f7
loop_1395:
	umul	%i0,	%l6,	%l2
	tgu	%xcc,	0x3
	bcs,pn	%xcc,	loop_1396
	andcc	%l3,	0x0CD0,	%i4
	movre	%i5,	0x318,	%i7
	brgez,a	%g2,	loop_1397
loop_1396:
	srl	%g6,	0x06,	%i2
	subc	%o3,	0x1169,	%g3
	fmovsleu	%icc,	%f6,	%f8
loop_1397:
	tcs	%icc,	0x4
	bne,a,pn	%xcc,	loop_1398
	fbn,a	%fcc3,	loop_1399
	tvs	%icc,	0x5
	bcs	loop_1400
loop_1398:
	brgz	%o6,	loop_1401
loop_1399:
	edge8l	%i6,	%g5,	%o5
	tcc	%xcc,	0x1
loop_1400:
	mulx	%o4,	%o0,	%i3
loop_1401:
	movleu	%xcc,	%l1,	%o1
	fmovdcs	%icc,	%f0,	%f1
	fones	%f1
	fors	%f4,	%f18,	%f26
	xnor	%i1,	0x11E7,	%l0
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x3A] %asi,	%g7
	wr	%g0,	0x80,	%asi
	stba	%o2,	[%l7 + 0x6E] %asi
	nop
	fitod	%f0,	%f2
	smul	%g4,	%l4,	%l5
	mova	%icc,	%o7,	%i0
	ldsh	[%l7 + 0x2A],	%g1
	nop
	setx	loop_1402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x0
	nop
	setx	0xA21587529431C485,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f14
	edge32l	%l6,	%l2,	%l3
loop_1402:
	fmovs	%f10,	%f13
	set	0x70, %g1
	stxa	%i5,	[%l7 + %g1] 0x04
	edge8ln	%i7,	%g2,	%g6
	orncc	%i4,	0x15B9,	%i2
	sub	%g3,	%o3,	%i6
	fnands	%f16,	%f5,	%f28
	subc	%o6,	0x0DC5,	%g5
	movvc	%xcc,	%o5,	%o0
	movvc	%icc,	%o4,	%i3
	tne	%icc,	0x2
	membar	0x5E
	fpmerge	%f28,	%f0,	%f0
	nop
	setx	0x3B039326,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x79B11361,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f22,	%f4
	movl	%xcc,	%o1,	%l1
	addc	%i1,	0x1FC1,	%g7
	fbue	%fcc3,	loop_1403
	edge8n	%o2,	%g4,	%l0
	movg	%xcc,	%l4,	%l5
	srax	%o7,	0x0F,	%i0
loop_1403:
	tle	%xcc,	0x1
	fsrc2	%f22,	%f18
	movrgez	%l6,	0x347,	%g1
	sra	%l2,	0x19,	%i5
	fpadd32	%f18,	%f16,	%f10
	tl	%icc,	0x2
	membar	0x1B
	fmovdge	%icc,	%f26,	%f10
	set	0x0F, %i3
	lduba	[%l7 + %i3] 0x11,	%i7
	fmovsl	%xcc,	%f13,	%f13
	movrlez	%g2,	0x29B,	%g6
	tpos	%xcc,	0x2
	movrlez	%i4,	0x3CA,	%i2
	brnz,a	%g3,	loop_1404
	movrgz	%o3,	0x284,	%i6
	and	%l3,	%o6,	%o5
	bvc,a,pn	%xcc,	loop_1405
loop_1404:
	movg	%xcc,	%g5,	%o4
	movn	%xcc,	%o0,	%o1
	fornot1	%f24,	%f0,	%f2
loop_1405:
	add	%l1,	0x0337,	%i3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x66] %asi,	%i1
	tne	%xcc,	0x2
	fbule,a	%fcc3,	loop_1406
	nop
	fitod	%f10,	%f18
	fdtos	%f18,	%f23
	movre	%g7,	%o2,	%g4
	fmuld8sux16	%f3,	%f20,	%f14
loop_1406:
	fble,a	%fcc2,	loop_1407
	fcmpgt16	%f12,	%f2,	%l4
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f9
	movneg	%icc,	%l5,	%o7
loop_1407:
	xnorcc	%i0,	%l0,	%l6
	nop
	fitod	%f10,	%f24
	edge16ln	%g1,	%l2,	%i7
	fmovdg	%xcc,	%f19,	%f16
	edge8ln	%g2,	%i5,	%g6
	fmovdne	%xcc,	%f23,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i2,	%g3
	tpos	%icc,	0x7
	fmovdneg	%xcc,	%f13,	%f12
	edge16l	%i4,	%o3,	%l3
	stw	%i6,	[%l7 + 0x7C]
	fbug	%fcc1,	loop_1408
	edge16	%o6,	%o5,	%o4
	fcmpeq16	%f18,	%f16,	%o0
	addcc	%o1,	0x1476,	%l1
loop_1408:
	alignaddr	%g5,	%i1,	%g7
	faligndata	%f14,	%f14,	%f2
	andncc	%o2,	%g4,	%i3
	addcc	%l4,	0x1707,	%l5
	stb	%i0,	[%l7 + 0x78]
	bvs	%xcc,	loop_1409
	fmovrsgez	%l0,	%f15,	%f30
	movre	%o7,	0x315,	%g1
	fandnot1	%f22,	%f2,	%f16
loop_1409:
	bge,a	loop_1410
	xor	%l2,	%l6,	%i7
	mulscc	%g2,	0x1268,	%g6
	ta	%xcc,	0x4
loop_1410:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	0xAFC00E03B71E496B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x45CDB788A1057BB0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f22,	%f10
	addcc	%i2,	0x0A46,	%g3
	nop
	setx loop_1411, %l0, %l1
	jmpl %l1, %i4
	ldsb	[%l7 + 0x48],	%o3
	fmovdl	%xcc,	%f24,	%f0
	membar	0x43
loop_1411:
	tcc	%icc,	0x7
	fnors	%f8,	%f29,	%f15
	flush	%l7 + 0x64
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i5,	0x05E3,	%i6
	alignaddr	%o6,	%o5,	%l3
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%o4
	ldsh	[%l7 + 0x7E],	%o0
	edge16n	%o1,	%l1,	%g5
	fbg,a	%fcc1,	loop_1412
	fbug,a	%fcc3,	loop_1413
	move	%xcc,	%g7,	%i1
	edge32n	%g4,	%i3,	%o2
loop_1412:
	edge16n	%l5,	%l4,	%i0
loop_1413:
	nop
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x15
	bn,pt	%xcc,	loop_1414
	edge8l	%o7,	%l0,	%g1
	movrgez	%l6,	0x024,	%i7
	movge	%icc,	%g2,	%l2
loop_1414:
	nop
	setx loop_1415, %l0, %l1
	jmpl %l1, %i2
	te	%icc,	0x7
	sir	0x0278
	srax	%g6,	0x19,	%i4
loop_1415:
	swap	[%l7 + 0x48],	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g3,	%i6
	fmul8x16al	%f2,	%f15,	%f26
	srl	%i5,	0x1C,	%o5
	xorcc	%o6,	%l3,	%o0
	fzero	%f18
	srl	%o4,	%l1,	%o1
	fble	%fcc0,	loop_1416
	fmovsvc	%xcc,	%f11,	%f6
	fmovdl	%icc,	%f31,	%f2
	tle	%icc,	0x4
loop_1416:
	subc	%g5,	0x1577,	%i1
	edge8l	%g4,	%i3,	%g7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f15
	movcs	%icc,	%o2,	%l5
	ldstub	[%l7 + 0x0F],	%i0
	andncc	%o7,	%l4,	%g1
	fpadd16	%f0,	%f2,	%f16
	addccc	%l0,	%l6,	%g2
	tpos	%xcc,	0x7
	alignaddrl	%l2,	%i7,	%i2
	set	0x30, %l1
	lduwa	[%l7 + %l1] 0x14,	%i4
	popc	0x1D9B,	%g6
	movl	%icc,	%g3,	%o3
	fbne,a	%fcc0,	loop_1417
	srlx	%i6,	0x12,	%o5
	tl	%icc,	0x2
	ld	[%l7 + 0x68],	%f0
loop_1417:
	pdist	%f10,	%f26,	%f30
	addc	%o6,	0x1020,	%l3
	edge16	%o0,	%o4,	%l1
	fbuge,a	%fcc2,	loop_1418
	fornot1	%f0,	%f14,	%f16
	tl	%icc,	0x6
	set	0x65, %g2
	ldstuba	[%l7 + %g2] 0x19,	%o1
loop_1418:
	ble,a,pt	%icc,	loop_1419
	smulcc	%g5,	%i1,	%g4
	movcs	%icc,	%i3,	%g7
	udiv	%i5,	0x078D,	%l5
loop_1419:
	fmovsvs	%icc,	%f10,	%f12
	xnor	%i0,	%o2,	%l4
	movcc	%icc,	%g1,	%o7
	ta	%icc,	0x6
	ta	%xcc,	0x3
	movle	%xcc,	%l0,	%l6
	tsubcc	%g2,	%l2,	%i7
	fands	%f16,	%f30,	%f31
	fcmpgt32	%f16,	%f16,	%i2
	nop
	setx	0x616D2EB49935725B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2A19F3F6B3EAED4F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f22,	%f18
	fxnor	%f12,	%f24,	%f22
	fmovrslz	%g6,	%f12,	%f13
	fble,a	%fcc1,	loop_1420
	tsubcctv	%i4,	%o3,	%g3
	sdivx	%o5,	0x0FFE,	%o6
	edge32l	%l3,	%o0,	%o4
loop_1420:
	or	%i6,	%o1,	%g5
	bpos,a,pt	%xcc,	loop_1421
	tleu	%xcc,	0x7
	fmovspos	%xcc,	%f5,	%f16
	tle	%xcc,	0x6
loop_1421:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%i1
	std	%f2,	[%l7 + 0x78]
	andcc	%i3,	0x1170,	%g7
	movrlz	%i5,	0x0EC,	%g4
	orcc	%l5,	0x057B,	%o2
	tg	%xcc,	0x5
	movrlez	%i0,	0x29A,	%g1
	mulx	%l4,	0x14DF,	%l0
	fbl	%fcc2,	loop_1422
	movn	%xcc,	%l6,	%o7
	subcc	%l2,	0x1852,	%g2
	be	loop_1423
loop_1422:
	sdivx	%i7,	0x01AD,	%g6
	xnor	%i2,	%i4,	%o3
	fblg	%fcc3,	loop_1424
loop_1423:
	andcc	%o5,	%g3,	%o6
	nop
	setx	0x72AA87CE0051FC11,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	tsubcc	%o0,	%o4,	%i6
loop_1424:
	add	%o1,	0x1175,	%l3
	tle	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	stxa	%g5,	[%l7 + 0x78] %asi
	nop
	setx	loop_1425,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	0x0B6B,	%i1
	edge32n	%l1,	%g7,	%i5
	fmovsn	%xcc,	%f10,	%f31
loop_1425:
	bge	loop_1426
	fcmpne16	%f30,	%f0,	%g4
	edge8	%i3,	%l5,	%o2
	flush	%l7 + 0x58
loop_1426:
	tcc	%xcc,	0x7
	te	%icc,	0x6
	edge8l	%g1,	%i0,	%l0
	taddcc	%l4,	%o7,	%l2
	tpos	%xcc,	0x2
	edge16n	%g2,	%i7,	%l6
	set	0x40, %i6
	ldswa	[%l7 + %i6] 0x18,	%i2
	movrlz	%i4,	0x1B5,	%o3
	srlx	%o5,	0x1C,	%g6
	fmovdl	%icc,	%f17,	%f0
	fnegs	%f3,	%f26
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g3,	%o6
	fcmpgt16	%f30,	%f8,	%o4
	tvc	%icc,	0x3
	fcmple16	%f26,	%f28,	%o0
	tge	%icc,	0x3
	fblg,a	%fcc2,	loop_1427
	fpackfix	%f12,	%f23
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%o1
loop_1427:
	mulx	%l3,	0x1EB9,	%i6
	sdivcc	%g5,	0x0792,	%l1
	addc	%i1,	%g7,	%g4
	sethi	0x0E9F,	%i3
	fmovscs	%xcc,	%f29,	%f30
	subccc	%l5,	0x1A64,	%o2
	edge32n	%g1,	%i5,	%l0
	flush	%l7 + 0x20
	edge16n	%i0,	%o7,	%l4
	fmovdpos	%xcc,	%f11,	%f4
	udivcc	%g2,	0x109B,	%i7
	edge32l	%l2,	%i2,	%i4
	brlz,a	%o3,	loop_1428
	movge	%icc,	%l6,	%g6
	array32	%g3,	%o5,	%o4
	fpsub16s	%f22,	%f14,	%f31
loop_1428:
	edge8	%o6,	%o1,	%o0
	movne	%xcc,	%l3,	%i6
	std	%f30,	[%l7 + 0x18]
	brgez,a	%l1,	loop_1429
	sllx	%g5,	0x1F,	%i1
	addccc	%g7,	0x026A,	%g4
	brlez,a	%l5,	loop_1430
loop_1429:
	nop
	setx loop_1431, %l0, %l1
	jmpl %l1, %i3
	edge32ln	%o2,	%i5,	%g1
	set	0x3C, %i5
	stwa	%l0,	[%l7 + %i5] 0x2a
	membar	#Sync
loop_1430:
	orcc	%i0,	%o7,	%g2
loop_1431:
	fmovsl	%xcc,	%f7,	%f26
	edge8n	%l4,	%i7,	%l2
	fbo	%fcc2,	loop_1432
	tneg	%xcc,	0x3
	array16	%i4,	%o3,	%i2
	fpack16	%f14,	%f16
loop_1432:
	udivcc	%l6,	0x0182,	%g6
	edge32n	%g3,	%o5,	%o6
	srl	%o4,	0x0A,	%o1
	te	%icc,	0x4
	mulx	%l3,	%o0,	%i6
	nop
	setx	0x29005121,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f17
	bleu,a,pn	%xcc,	loop_1433
	movrlez	%l1,	%g5,	%g7
	edge16l	%i1,	%l5,	%i3
	fmovrsne	%g4,	%f16,	%f29
loop_1433:
	fzeros	%f30
	movgu	%icc,	%i5,	%o2
	sra	%g1,	%l0,	%o7
	popc	0x0D54,	%i0
	movrgz	%g2,	%i7,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i4,	0x0F42,	%l4
	fbue,a	%fcc0,	loop_1434
	fnor	%f26,	%f12,	%f26
	fmovda	%xcc,	%f12,	%f26
	udiv	%i2,	0x0F9D,	%o3
loop_1434:
	edge8ln	%l6,	%g6,	%o5
	fbne,a	%fcc2,	loop_1435
	orncc	%o6,	%o4,	%g3
	tvs	%xcc,	0x4
	udivx	%l3,	0x040C,	%o0
loop_1435:
	array32	%i6,	%o1,	%l1
	andncc	%g7,	%i1,	%g5
	orcc	%i3,	0x0BE2,	%l5
	srax	%i5,	%o2,	%g4
	udivcc	%g1,	0x082B,	%l0
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x19,	%o7
	fmovsleu	%xcc,	%f0,	%f1
	fbe	%fcc1,	loop_1436
	edge32ln	%i0,	%g2,	%l2
	umul	%i4,	%l4,	%i2
	addcc	%i7,	%o3,	%l6
loop_1436:
	movg	%icc,	%g6,	%o5
	srlx	%o6,	%o4,	%l3
	tne	%icc,	0x5
	tleu	%xcc,	0x7
	fbe,a	%fcc2,	loop_1437
	nop
	setx	loop_1438,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%g3,	%i6,	%o1
	edge16ln	%o0,	%g7,	%i1
loop_1437:
	xor	%l1,	%i3,	%l5
loop_1438:
	edge8ln	%i5,	%o2,	%g4
	udivx	%g5,	0x0954,	%g1
	bne,a,pn	%xcc,	loop_1439
	movre	%l0,	0x04A,	%i0
	move	%icc,	%g2,	%o7
	movvc	%icc,	%i4,	%l4
loop_1439:
	mulscc	%l2,	0x0B89,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i2,	0x0D,	%o3
	fmovdleu	%xcc,	%f25,	%f25
	fbug,a	%fcc3,	loop_1440
	sdiv	%g6,	0x003F,	%l6
	udivcc	%o5,	0x07C7,	%o4
	fands	%f10,	%f22,	%f6
loop_1440:
	srlx	%o6,	0x13,	%g3
	fbug,a	%fcc1,	loop_1441
	movg	%xcc,	%l3,	%o1
	edge16n	%o0,	%i6,	%i1
	andn	%g7,	%l1,	%i3
loop_1441:
	sdivcc	%l5,	0x157E,	%i5
	tle	%icc,	0x7
	movrgz	%o2,	0x28A,	%g4
	subccc	%g5,	%l0,	%g1
	srl	%g2,	0x0C,	%o7
	flush	%l7 + 0x1C
	bcs,a	%xcc,	loop_1442
	tneg	%icc,	0x2
	fmovdneg	%icc,	%f14,	%f18
	sub	%i0,	%i4,	%l2
loop_1442:
	tcc	%xcc,	0x1
	set	0x208, %o1
	ldxa	[%g0 + %o1] 0x52,	%i7
	fmovdg	%icc,	%f14,	%f29
	fmovdgu	%xcc,	%f1,	%f28
	movrlz	%i2,	%l4,	%g6
	movrgz	%o3,	%o5,	%o4
	sra	%o6,	0x1C,	%g3
	fcmpeq16	%f18,	%f0,	%l6
	fandnot2s	%f15,	%f18,	%f0
	tcs	%icc,	0x3
	edge32l	%l3,	%o0,	%i6
	array8	%i1,	%g7,	%l1
	call	loop_1443
	move	%xcc,	%o1,	%i3
	tge	%xcc,	0x0
	ldstub	[%l7 + 0x6C],	%l5
loop_1443:
	edge8ln	%i5,	%o2,	%g5
	fnot2s	%f22,	%f0
	fpadd32	%f14,	%f10,	%f2
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f2
	nop
	setx	0x8047EFA8,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x44] %asi,	%f10
	fbg	%fcc1,	loop_1444
	addccc	%l0,	0x0B2C,	%g4
	xnorcc	%g2,	%o7,	%g1
	alignaddr	%i0,	%l2,	%i7
loop_1444:
	movl	%icc,	%i2,	%i4
	fornot1s	%f21,	%f8,	%f6
	umulcc	%l4,	0x058B,	%o3
	andncc	%o5,	%o4,	%g6
	movvc	%xcc,	%o6,	%l6
	set	0x64, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l3
	tl	%icc,	0x6
	movn	%icc,	%g3,	%i6
	movvs	%xcc,	%i1,	%g7
	movle	%xcc,	%l1,	%o1
	fpadd32	%f16,	%f24,	%f18
	xorcc	%o0,	0x114C,	%i3
	tl	%icc,	0x1
	edge16l	%l5,	%i5,	%g5
	movn	%xcc,	%o2,	%g4
	nop
	setx loop_1445, %l0, %l1
	jmpl %l1, %g2
	fmovdpos	%icc,	%f19,	%f29
	tvc	%xcc,	0x6
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f14
loop_1445:
	brnz	%l0,	loop_1446
	sethi	0x1ECB,	%g1
	srlx	%o7,	0x01,	%l2
	fsrc2	%f10,	%f6
loop_1446:
	add	%i7,	%i0,	%i2
	movne	%icc,	%l4,	%o3
	movne	%xcc,	%o5,	%i4
	movneg	%xcc,	%o4,	%o6
	smul	%g6,	%l3,	%l6
	xnorcc	%g3,	0x0F53,	%i1
	array8	%g7,	%l1,	%o1
	sir	0x1FBB
	tcs	%xcc,	0x3
	fmovscs	%icc,	%f11,	%f9
	move	%icc,	%o0,	%i6
	udivx	%l5,	0x1B66,	%i3
	fmovsvs	%xcc,	%f21,	%f23
	fsrc2	%f14,	%f12
	udivcc	%g5,	0x046D,	%i5
	mulscc	%g4,	0x0580,	%o2
	smulcc	%l0,	%g2,	%g1
	tvc	%icc,	0x4
	stw	%o7,	[%l7 + 0x6C]
	tsubcc	%i7,	%l2,	%i0
	fsrc2s	%f11,	%f0
	fmuld8sux16	%f18,	%f16,	%f24
	ldub	[%l7 + 0x19],	%i2
	edge16l	%l4,	%o3,	%o5
	add	%o4,	0x0443,	%o6
	tgu	%icc,	0x7
	movvs	%icc,	%g6,	%i4
	wr	%g0,	0x57,	%asi
	stxa	%l3,	[%g0 + 0x0] %asi
	fnot1	%f18,	%f8
	sll	%l6,	%g3,	%i1
	movl	%xcc,	%l1,	%o1
	srax	%o0,	%i6,	%g7
	faligndata	%f24,	%f0,	%f18
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x04,	 0x0
	set	0x26, %i4
	ldstuba	[%l7 + %i4] 0x11,	%g5
	movrgez	%i5,	%g4,	%o2
	nop
	setx	0x079FB6033E8F5C97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x1606ACA6380FDB5B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f4,	%f20
	array16	%l0,	%g2,	%g1
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f20
	xor	%o7,	%i7,	%l2
	movrgez	%i3,	%i0,	%l4
	smul	%o3,	0x0D85,	%i2
	fmovdg	%icc,	%f0,	%f4
	xor	%o5,	0x1B86,	%o4
	srl	%o6,	%g6,	%i4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l6
	set	0x18, %o2
	ldswa	[%l7 + %o2] 0x18,	%l3
	sethi	0x194B,	%i1
	nop
	fitos	%f22,	%f2
	fcmpne16	%f0,	%f20,	%g3
	tpos	%icc,	0x7
	srlx	%o1,	%l1,	%i6
	smulcc	%o0,	0x139B,	%l5
	fbue,a	%fcc2,	loop_1447
	orn	%g7,	%g5,	%i5
	tneg	%xcc,	0x3
	fmovscc	%icc,	%f20,	%f14
loop_1447:
	edge16ln	%o2,	%l0,	%g2
	sir	0x1F42
	brgez,a	%g1,	loop_1448
	brgz,a	%o7,	loop_1449
	fmovscc	%icc,	%f1,	%f16
	and	%g4,	%l2,	%i3
loop_1448:
	fbg	%fcc3,	loop_1450
loop_1449:
	fmovsa	%xcc,	%f31,	%f7
	smulcc	%i7,	0x1A92,	%l4
	set	0x67, %l0
	ldsba	[%l7 + %l0] 0x11,	%o3
loop_1450:
	ldsb	[%l7 + 0x17],	%i2
	smulcc	%i0,	0x1191,	%o5
	set	0x48, %g4
	swapa	[%l7 + %g4] 0x80,	%o4
	ldd	[%l7 + 0x40],	%o6
	taddcc	%g6,	0x0354,	%i4
	fones	%f6
	movcc	%xcc,	%l3,	%l6
	nop
	setx	0x849543C58C30A49D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD6B939A5E48E15C1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f28,	%f10
	tcc	%xcc,	0x0
	tneg	%xcc,	0x4
	std	%f8,	[%l7 + 0x08]
	bge,a	%xcc,	loop_1451
	fba,a	%fcc2,	loop_1452
	ldsw	[%l7 + 0x24],	%g3
	fmovsvc	%xcc,	%f17,	%f28
loop_1451:
	edge8	%o1,	%l1,	%i1
loop_1452:
	nop
	wr	%g0,	0x19,	%asi
	stha	%o0,	[%l7 + 0x30] %asi
	tvc	%icc,	0x4
	edge16n	%i6,	%l5,	%g5
	brnz,a	%i5,	loop_1453
	fmovsl	%xcc,	%f16,	%f16
	srl	%g7,	0x10,	%l0
	andcc	%g2,	0x05AC,	%g1
loop_1453:
	sub	%o2,	0x05DE,	%g4
	array8	%o7,	%i3,	%i7
	edge32n	%l2,	%o3,	%i2
	bgu,a	%icc,	loop_1454
	swap	[%l7 + 0x20],	%i0
	sdiv	%o5,	0x1CC1,	%o4
	fandnot2	%f14,	%f6,	%f16
loop_1454:
	tcc	%icc,	0x6
	edge8l	%o6,	%l4,	%g6
	brgez,a	%i4,	loop_1455
	edge8n	%l6,	%g3,	%o1
	nop
	setx	loop_1456,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16al	%f23,	%f2,	%f22
loop_1455:
	edge32ln	%l3,	%l1,	%o0
	std	%f20,	[%l7 + 0x10]
loop_1456:
	edge16	%i6,	%i1,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x0A],	%g5
	srax	%g7,	0x0E,	%i5
	tcc	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%g2
	sethi	0x1B9C,	%l0
	fcmple32	%f6,	%f18,	%o2
	add	%g1,	%g4,	%o7
	be,a,pn	%icc,	loop_1457
	fmovdneg	%xcc,	%f10,	%f26
	fmovdl	%icc,	%f3,	%f11
	edge32n	%i3,	%i7,	%o3
loop_1457:
	edge32	%i2,	%i0,	%l2
	fpadd16s	%f11,	%f27,	%f17
	ld	[%l7 + 0x24],	%f4
	sra	%o5,	0x19,	%o6
	tneg	%icc,	0x4
	subcc	%o4,	0x1D71,	%g6
	alignaddrl	%l4,	%l6,	%i4
	movrlz	%g3,	%o1,	%l1
	edge16	%o0,	%l3,	%i6
	movrlez	%i1,	0x39E,	%l5
	mulx	%g7,	%g5,	%i5
	subc	%g2,	0x19DE,	%l0
	edge32l	%g1,	%g4,	%o7
	srax	%i3,	0x18,	%i7
	array8	%o3,	%i2,	%o2
	bg	loop_1458
	edge32l	%l2,	%o5,	%o6
	bgu	%xcc,	loop_1459
	udiv	%o4,	0x08DD,	%i0
loop_1458:
	movn	%xcc,	%g6,	%l4
	xorcc	%i4,	%g3,	%o1
loop_1459:
	tleu	%icc,	0x7
	fnor	%f18,	%f26,	%f20
	lduw	[%l7 + 0x60],	%l1
	tvc	%xcc,	0x0
	movne	%xcc,	%l6,	%o0
	ldub	[%l7 + 0x30],	%l3
	fabss	%f28,	%f8
	nop
	fitod	%f4,	%f0
	fdtoi	%f0,	%f16
	movne	%icc,	%i6,	%i1
	fmovsn	%icc,	%f16,	%f9
	fpack32	%f22,	%f0,	%f4
	set	0x7B, %i7
	ldsba	[%l7 + %i7] 0x04,	%l5
	sdivcc	%g7,	0x1657,	%i5
	addccc	%g5,	%l0,	%g1
	fmul8sux16	%f30,	%f20,	%f12
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g2
	orn	%g4,	0x02B8,	%o7
	fmovdge	%icc,	%f28,	%f8
	addccc	%i7,	0x11EA,	%o3
	andncc	%i2,	%i3,	%o2
	fbl,a	%fcc3,	loop_1460
	fpmerge	%f29,	%f22,	%f20
	movn	%xcc,	%o5,	%o6
	wr	%g0,	0x0c,	%asi
	sta	%f20,	[%l7 + 0x6C] %asi
loop_1460:
	movpos	%icc,	%l2,	%o4
	fmul8sux16	%f6,	%f4,	%f18
	ldsb	[%l7 + 0x69],	%g6
	array16	%i0,	%l4,	%i4
	tgu	%icc,	0x0
	set	0x10, %o7
	ldsha	[%l7 + %o7] 0x18,	%g3
	nop
	setx	0xEC711C3A050AD72E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x68A01FF16C6C7D14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f0
	edge8l	%o1,	%l6,	%l1
	fabsd	%f12,	%f0
	movg	%icc,	%o0,	%i6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x08] %asi,	%i1
	fbe	%fcc0,	loop_1461
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l5,	%l3
	umul	%i5,	0x1A05,	%g5
loop_1461:
	taddcctv	%g7,	%l0,	%g2
	movne	%xcc,	%g1,	%o7
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%g4
	mulx	%i7,	0x117B,	%i2
	tpos	%xcc,	0x3
	movn	%xcc,	%o3,	%i3
	fmovsne	%icc,	%f8,	%f8
	ld	[%l7 + 0x74],	%f6
	fzeros	%f30
	subcc	%o5,	%o6,	%l2
	fmuld8ulx16	%f24,	%f22,	%f14
	ldd	[%l7 + 0x08],	%f28
	tvc	%xcc,	0x4
	fmovs	%f27,	%f5
	mulscc	%o2,	%o4,	%g6
	mova	%xcc,	%i0,	%l4
	tneg	%xcc,	0x4
	fcmple32	%f26,	%f16,	%i4
	set	0x60, %o3
	sta	%f16,	[%l7 + %o3] 0x11
	andncc	%g3,	%l6,	%o1
	tsubcc	%o0,	%l1,	%i6
	set	0x5A, %g6
	lduba	[%l7 + %g6] 0x10,	%l5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	movleu	%icc,	%i5,	%g5
	array8	%l3,	%l0,	%g7
	edge8	%g2,	%g1,	%o7
	movle	%icc,	%g4,	%i7
	ldstub	[%l7 + 0x47],	%i2
	fpack32	%f14,	%f14,	%f20
	fbue,a	%fcc3,	loop_1462
	array8	%i3,	%o3,	%o5
	fpsub16s	%f1,	%f27,	%f1
	movvs	%icc,	%l2,	%o6
loop_1462:
	taddcctv	%o2,	%o4,	%i0
	taddcc	%l4,	%g6,	%i4
	subc	%g3,	%o1,	%l6
	nop
	setx	loop_1463,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%icc,	0x7
	movle	%icc,	%o0,	%l1
	tvs	%icc,	0x6
loop_1463:
	pdist	%f22,	%f30,	%f6
	movrlez	%i6,	%l5,	%i1
	tsubcctv	%g5,	0x0E60,	%l3
	set	0x0C, %g5
	ldswa	[%l7 + %g5] 0x81,	%i5
	set	0x18, %i1
	stha	%g7,	[%l7 + %i1] 0x80
	add	%g2,	%l0,	%g1
	edge8ln	%o7,	%g4,	%i7
	xnor	%i2,	%i3,	%o5
	tcc	%icc,	0x4
	fmovrdgez	%l2,	%f8,	%f22
	set	0x1D, %i2
	stba	%o6,	[%l7 + %i2] 0xe3
	membar	#Sync
	orn	%o2,	0x1910,	%o3
	edge8n	%o4,	%l4,	%g6
	fpadd16	%f26,	%f20,	%f0
	fcmpne32	%f10,	%f12,	%i4
	fnot2s	%f11,	%f9
	bcs	%xcc,	loop_1464
	alignaddr	%g3,	%i0,	%l6
	te	%xcc,	0x2
	nop
	setx loop_1465, %l0, %l1
	jmpl %l1, %o0
loop_1464:
	smulcc	%l1,	0x07CD,	%o1
	sdivcc	%l5,	0x0120,	%i1
	orncc	%g5,	0x1291,	%l3
loop_1465:
	sir	0x09F1
	stx	%i5,	[%l7 + 0x28]
	andn	%i6,	0x1C36,	%g2
	tge	%xcc,	0x1
	andncc	%l0,	%g1,	%o7
	movn	%xcc,	%g7,	%g4
	ld	[%l7 + 0x68],	%f1
	sth	%i2,	[%l7 + 0x3E]
	tn	%icc,	0x1
	fmovdvc	%xcc,	%f16,	%f22
	alignaddrl	%i7,	%i3,	%o5
	addccc	%l2,	0x188B,	%o6
	subcc	%o3,	0x0319,	%o2
	edge32ln	%o4,	%l4,	%g6
	fpadd32s	%f30,	%f0,	%f29
	movgu	%icc,	%g3,	%i0
	fnot2s	%f2,	%f28
	tvc	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%i6
	udiv	%i4,	0x05D4,	%o0
	movge	%icc,	%l1,	%l5
	set	0x4C, %i0
	lduwa	[%l7 + %i0] 0x89,	%i1
	tcs	%xcc,	0x3
	smulcc	%o1,	%l3,	%g5
	edge8ln	%i5,	%g2,	%l0
	add	%i6,	%o7,	%g7
	add	%g1,	0x143E,	%g4
	movrgz	%i2,	0x180,	%i7
	sllx	%o5,	0x13,	%l2
	fmovdl	%icc,	%f16,	%f18
	edge16n	%o6,	%o3,	%i3
	nop
	fitos	%f23,	%f26
	orcc	%o2,	0x0928,	%o4
	tne	%xcc,	0x6
	sdiv	%l4,	0x0105,	%g6
	bgu,pt	%icc,	loop_1466
	nop
	setx	0x4AC8E638406DD2ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fmovrdlz	%g3,	%f20,	%f16
	sdivx	%i0,	0x0B7B,	%i4
loop_1466:
	movrgz	%l6,	%l1,	%o0
	set	0x67, %l4
	ldsba	[%l7 + %l4] 0x89,	%i1
	wr	%g0,	0x2f,	%asi
	stwa	%o1,	[%l7 + 0x78] %asi
	membar	#Sync
	fone	%f16
	movcc	%xcc,	%l5,	%g5
	edge16l	%i5,	%g2,	%l0
	orn	%i6,	0x072E,	%l3
	movre	%g7,	%o7,	%g1
	fpsub32s	%f27,	%f21,	%f0
	srlx	%g4,	%i2,	%i7
	fxor	%f8,	%f24,	%f10
	edge8n	%o5,	%l2,	%o3
	ldd	[%l7 + 0x78],	%f4
	nop
	setx	0xAB3B17E40068E20A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	brlez	%i3,	loop_1467
	movrgez	%o6,	0x3F6,	%o4
	subccc	%l4,	0x0F5E,	%g6
	or	%o2,	0x067D,	%i0
loop_1467:
	udiv	%g3,	0x1516,	%i4
	movrne	%l6,	%l1,	%o0
	fmovrslez	%i1,	%f19,	%f19
	alignaddrl	%l5,	%g5,	%o1
	tpos	%xcc,	0x1
	movle	%xcc,	%g2,	%l0
	tcs	%xcc,	0x3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%l3
	udiv	%g7,	0x1F31,	%o7
	nop
	setx	0x64DE695AAB218C06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x06409B334788238F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f26,	%f0
	fpackfix	%f18,	%f3
	tn	%xcc,	0x6
	movleu	%icc,	%i6,	%g4
	edge8l	%g1,	%i2,	%i7
	edge16	%l2,	%o3,	%i3
	movn	%icc,	%o6,	%o5
	tl	%icc,	0x2
	ldd	[%l7 + 0x20],	%f2
	edge32ln	%o4,	%l4,	%o2
	bgu,a	%icc,	loop_1468
	udiv	%i0,	0x0D0E,	%g3
	tneg	%icc,	0x1
	tcs	%xcc,	0x7
loop_1468:
	tneg	%xcc,	0x5
	nop
	setx	loop_1469,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%i4,	%l6,	%l1
	movvc	%xcc,	%o0,	%i1
	subc	%l5,	%g5,	%o1
loop_1469:
	srlx	%g2,	%l0,	%i5
	fmovsvs	%xcc,	%f8,	%f21
	prefetch	[%l7 + 0x40],	 0x1
	fcmpgt32	%f16,	%f2,	%l3
	xorcc	%g7,	0x010B,	%g6
	fzeros	%f13
	sra	%o7,	%g4,	%g1
	xorcc	%i6,	%i7,	%i2
	fornot2	%f14,	%f0,	%f18
	tgu	%icc,	0x1
	fones	%f29
	nop
	setx	0xB5251FCDC0D4E0A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f18
	set	0x4A, %g7
	stba	%l2,	[%l7 + %g7] 0x10
	bpos,pt	%xcc,	loop_1470
	movvc	%xcc,	%o3,	%o6
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x27,	%i2
loop_1470:
	nop
	set	0x74, %l6
	ldsw	[%l7 + %l6],	%o4
	bl,pt	%xcc,	loop_1471
	fcmpeq32	%f30,	%f26,	%o5
	wr	%g0,	0x2f,	%asi
	stha	%l4,	[%l7 + 0x18] %asi
	membar	#Sync
loop_1471:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x60] %asi,	%i0
	movge	%xcc,	%g3,	%i4
	fmovsa	%icc,	%f28,	%f21
	fmovdgu	%icc,	%f22,	%f9
	fsrc2s	%f8,	%f6
	tle	%icc,	0x4
	nop
	set	0x66, %g3
	ldsb	[%l7 + %g3],	%o2
	srax	%l1,	0x0E,	%o0
	fxnor	%f10,	%f22,	%f24
	alignaddr	%i1,	%l6,	%g5
	set	0x4C, %i3
	ldswa	[%l7 + %i3] 0x11,	%o1
	stx	%l5,	[%l7 + 0x58]
	tg	%xcc,	0x4
	orcc	%g2,	%l0,	%l3
	taddcc	%g7,	0x163A,	%g6
	edge32	%i5,	%g4,	%g1
	stx	%o7,	[%l7 + 0x58]
	udivx	%i6,	0x0EB8,	%i2
	taddcc	%i7,	0x1C12,	%l2
	ldsb	[%l7 + 0x5D],	%o3
	fbl,a	%fcc2,	loop_1472
	bgu,a	%icc,	loop_1473
	xorcc	%o6,	%i3,	%o4
	ba	%icc,	loop_1474
loop_1472:
	movcs	%icc,	%o5,	%i0
loop_1473:
	add	%l4,	%i4,	%g3
	movrlez	%l1,	0x2B2,	%o0
loop_1474:
	andncc	%i1,	%o2,	%g5
	stw	%o1,	[%l7 + 0x4C]
	tvs	%icc,	0x4
	set	0x30, %l5
	stxa	%l5,	[%l7 + %l5] 0x15
	movne	%icc,	%l6,	%g2
	fbl	%fcc3,	loop_1475
	and	%l3,	0x133D,	%g7
	bvs,a,pt	%icc,	loop_1476
	xnorcc	%l0,	%i5,	%g4
loop_1475:
	for	%f4,	%f4,	%f26
	movneg	%icc,	%g6,	%g1
loop_1476:
	fmovrdlz	%o7,	%f18,	%f20
	srlx	%i2,	0x1C,	%i6
	orncc	%l2,	%i7,	%o3
	tsubcc	%i3,	%o4,	%o5
	nop
	setx	0x9058B104,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	udiv	%i0,	0x1B1D,	%o6
	bl	%icc,	loop_1477
	sdivx	%l4,	0x0E3D,	%i4
	movpos	%xcc,	%g3,	%l1
	ldsw	[%l7 + 0x4C],	%o0
loop_1477:
	subcc	%i1,	%g5,	%o1
	lduh	[%l7 + 0x2C],	%o2
	bl,a,pn	%icc,	loop_1478
	ldd	[%l7 + 0x68],	%f28
	bne,pn	%icc,	loop_1479
	mova	%icc,	%l6,	%g2
loop_1478:
	array8	%l3,	%l5,	%l0
	subc	%i5,	%g7,	%g6
loop_1479:
	udivx	%g1,	0x0788,	%g4
	fnors	%f4,	%f1,	%f1
	tg	%xcc,	0x6
	movg	%icc,	%o7,	%i2
	fbug,a	%fcc3,	loop_1480
	nop
	setx	loop_1481,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x7
	taddcc	%i6,	0x09C9,	%i7
loop_1480:
	movrlz	%o3,	%i3,	%o4
loop_1481:
	movcs	%xcc,	%l2,	%i0
	edge8ln	%o5,	%o6,	%l4
	edge32n	%i4,	%l1,	%o0
	fmul8ulx16	%f6,	%f16,	%f0
	edge32n	%g3,	%g5,	%i1
	fmul8sux16	%f22,	%f14,	%f12
	bleu,pn	%xcc,	loop_1482
	addcc	%o2,	0x18FF,	%l6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x38] %asi,	%o1
loop_1482:
	fmovsle	%icc,	%f17,	%f4
	andncc	%l3,	%l5,	%g2
	sir	0x1DA2
	fxnors	%f22,	%f29,	%f31
	sllx	%l0,	0x0D,	%g7
	fmovdpos	%icc,	%f29,	%f13
	array8	%g6,	%g1,	%i5
	pdist	%f30,	%f8,	%f6
	andncc	%o7,	%i2,	%i6
	brz	%g4,	loop_1483
	bcs	loop_1484
	tle	%icc,	0x2
	sll	%i7,	%o3,	%i3
loop_1483:
	bvs,pt	%xcc,	loop_1485
loop_1484:
	brgez	%l2,	loop_1486
	movrgz	%i0,	0x1FD,	%o4
	bleu	loop_1487
loop_1485:
	fmovdl	%icc,	%f11,	%f23
loop_1486:
	add	%o6,	%l4,	%o5
	tle	%xcc,	0x5
loop_1487:
	prefetch	[%l7 + 0x18],	 0x2
	mulscc	%l1,	0x1CD7,	%o0
	fnors	%f5,	%f2,	%f15
	srl	%g3,	%i4,	%g5
	and	%i1,	0x1F69,	%l6
	array32	%o1,	%l3,	%l5
	movrlz	%o2,	0x14F,	%g2
	addc	%l0,	%g7,	%g6
	sdiv	%g1,	0x0D33,	%o7
	mulscc	%i2,	%i5,	%i6
	sll	%g4,	0x1E,	%i7
	tle	%icc,	0x1
	alignaddr	%i3,	%l2,	%i0
	edge8	%o4,	%o3,	%o6
	srlx	%l4,	0x17,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l1,	%g3,	%o0
	orncc	%i4,	0x071D,	%g5
	ba,pn	%icc,	loop_1488
	ldd	[%l7 + 0x28],	%i6
	addc	%i1,	%l3,	%l5
	movvs	%icc,	%o1,	%o2
loop_1488:
	nop
	setx	loop_1489,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%l0,	%g7,	%g2
	srax	%g6,	%o7,	%g1
	fmovdn	%icc,	%f10,	%f3
loop_1489:
	movcc	%icc,	%i2,	%i5
	ldd	[%l7 + 0x58],	%f30
	alignaddrl	%g4,	%i6,	%i3
	brgz,a	%i7,	loop_1490
	edge16	%l2,	%i0,	%o3
	fmovsg	%xcc,	%f14,	%f2
	movneg	%xcc,	%o6,	%o4
loop_1490:
	alignaddrl	%o5,	%l1,	%l4
	and	%g3,	%i4,	%g5
	umul	%l6,	0x08DC,	%o0
	udivcc	%i1,	0x157C,	%l3
	xorcc	%o1,	0x0CC0,	%l5
	nop
	setx	0x4EB485287A6F256F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE32BD226AC797B2F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f0,	%f8
	bge,a	loop_1491
	udiv	%l0,	0x0637,	%g7
	array32	%o2,	%g2,	%g6
	movle	%xcc,	%g1,	%i2
loop_1491:
	edge32l	%o7,	%i5,	%g4
	movg	%icc,	%i3,	%i7
	xorcc	%i6,	0x0421,	%i0
	alignaddr	%o3,	%o6,	%o4
	movvc	%xcc,	%l2,	%l1
	fpackfix	%f2,	%f3
	stw	%l4,	[%l7 + 0x60]
	set	0x1A, %g1
	lduba	[%l7 + %g1] 0x04,	%g3
	ta	%icc,	0x1
	ldd	[%l7 + 0x08],	%i4
	fpadd16	%f12,	%f8,	%f22
	andn	%g5,	0x0C1A,	%l6
	lduh	[%l7 + 0x16],	%o0
	nop
	setx	0x7C572F74304073D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movcs	%xcc,	%i1,	%o5
	set	0x0C, %l1
	ldswa	[%l7 + %l1] 0x04,	%l3
	orn	%o1,	0x0155,	%l5
	fmovdcc	%icc,	%f14,	%f19
	movvs	%icc,	%l0,	%o2
	brnz	%g2,	loop_1492
	fpsub16	%f8,	%f12,	%f0
	nop
	setx	0x8EE49760676DAD96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f6
	add	%g7,	%g1,	%g6
loop_1492:
	prefetch	[%l7 + 0x40],	 0x2
	movre	%o7,	%i5,	%g4
	subcc	%i2,	0x0679,	%i3
	fmul8sux16	%f6,	%f4,	%f4
	popc	%i7,	%i0
	brlz	%i6,	loop_1493
	fmovde	%icc,	%f7,	%f24
	orncc	%o3,	0x13ED,	%o4
	addc	%l2,	%l1,	%o6
loop_1493:
	nop
	fitod	%f2,	%f2
	fdtox	%f2,	%f24
	edge16l	%g3,	%i4,	%g5
	array16	%l6,	%o0,	%i1
	fabss	%f25,	%f25
	subcc	%o5,	0x163E,	%l3
	add	%o1,	%l4,	%l0
	fbge,a	%fcc2,	loop_1494
	bleu	%xcc,	loop_1495
	fcmple32	%f10,	%f8,	%o2
	te	%icc,	0x7
loop_1494:
	array16	%l5,	%g2,	%g7
loop_1495:
	fpadd16	%f28,	%f28,	%f8
	alignaddr	%g1,	%g6,	%o7
	tg	%xcc,	0x4
	subcc	%g4,	0x1CBE,	%i2
	array8	%i5,	%i7,	%i0
	movleu	%xcc,	%i3,	%o3
	fmovrsgz	%i6,	%f8,	%f25
	swap	[%l7 + 0x50],	%o4
	edge8	%l2,	%l1,	%g3
	fblg	%fcc0,	loop_1496
	fcmple32	%f4,	%f20,	%i4
	wr	%g0,	0x88,	%asi
	sta	%f5,	[%l7 + 0x10] %asi
loop_1496:
	faligndata	%f6,	%f10,	%f16
	srax	%g5,	%o6,	%o0
	tne	%xcc,	0x3
	fpadd32	%f4,	%f28,	%f6
	fcmpgt16	%f28,	%f0,	%l6
	brgz,a	%o5,	loop_1497
	edge16	%l3,	%i1,	%l4
	set	0x7E, %l2
	ldsha	[%l7 + %l2] 0x89,	%o1
loop_1497:
	orn	%l0,	0x0350,	%o2
	fones	%f5
	ba,a,pt	%xcc,	loop_1498
	brgez,a	%l5,	loop_1499
	fmovdcs	%icc,	%f14,	%f18
	or	%g2,	0x14A4,	%g1
loop_1498:
	movre	%g6,	0x078,	%g7
loop_1499:
	fmuld8sux16	%f1,	%f20,	%f0
	nop
	setx	0xF0023E5970718568,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	movcs	%icc,	%o7,	%i2
	fcmple32	%f14,	%f0,	%i5
	fnors	%f4,	%f8,	%f24
	addc	%i7,	0x18A6,	%g4
	orn	%i3,	0x096B,	%i0
	brz,a	%i6,	loop_1500
	orncc	%o4,	%o3,	%l2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x4E] %asi,	%l1
loop_1500:
	nop
	fitos	%f10,	%f25
	fstox	%f25,	%f8
	fxtos	%f8,	%f5
	movpos	%icc,	%i4,	%g3
	or	%g5,	0x04A3,	%o0
	fmovsg	%icc,	%f18,	%f14
	orncc	%o6,	0x17BB,	%o5
	alignaddrl	%l6,	%i1,	%l4
	movrlez	%o1,	%l3,	%o2
	sra	%l0,	%g2,	%l5
	fba,a	%fcc3,	loop_1501
	fornot1s	%f12,	%f23,	%f8
	edge16ln	%g6,	%g1,	%o7
	membar	0x56
loop_1501:
	fba,a	%fcc3,	loop_1502
	mulscc	%i2,	0x0B26,	%g7
	edge16ln	%i7,	%g4,	%i5
	add	%i0,	%i3,	%o4
loop_1502:
	brlez	%i6,	loop_1503
	nop
	set	0x54, %g2
	prefetch	[%l7 + %g2],	 0x1
	fmovdvs	%icc,	%f11,	%f18
	bgu,a	loop_1504
loop_1503:
	ble,a,pn	%icc,	loop_1505
	tl	%icc,	0x4
	ldub	[%l7 + 0x3A],	%o3
loop_1504:
	tsubcctv	%l1,	%l2,	%g3
loop_1505:
	ble	%xcc,	loop_1506
	ldsb	[%l7 + 0x65],	%i4
	flush	%l7 + 0x24
	lduw	[%l7 + 0x24],	%o0
loop_1506:
	edge16l	%g5,	%o5,	%o6
	faligndata	%f16,	%f22,	%f22
	movvc	%icc,	%l6,	%l4
	movg	%xcc,	%o1,	%i1
	edge8ln	%o2,	%l3,	%l0
	tl	%xcc,	0x2
	fbul,a	%fcc0,	loop_1507
	umul	%l5,	0x0025,	%g2
	sdiv	%g6,	0x1B32,	%o7
	tleu	%icc,	0x2
loop_1507:
	bvs,a,pt	%xcc,	loop_1508
	fcmpne16	%f10,	%f2,	%g1
	sdivcc	%g7,	0x0D52,	%i7
	array8	%i2,	%g4,	%i5
loop_1508:
	sub	%i0,	%o4,	%i3
	udivx	%i6,	0x185E,	%l1
	edge16	%o3,	%g3,	%l2
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%o0
	tn	%xcc,	0x6
	fmovda	%icc,	%f4,	%f11
	sir	0x118B
	fabsd	%f6,	%f26
	mulscc	%g5,	0x1D8C,	%o5
	tcc	%icc,	0x7
	nop
	fitos	%f8,	%f20
	fstoi	%f20,	%f3
	movrgez	%o6,	%l6,	%i4
	srlx	%l4,	%o1,	%o2
	fbn	%fcc2,	loop_1509
	andcc	%l3,	%i1,	%l0
	bl,a,pt	%xcc,	loop_1510
	popc	0x0855,	%l5
loop_1509:
	tvc	%icc,	0x1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
loop_1510:
	bneg	%xcc,	loop_1511
	fcmpgt32	%f30,	%f10,	%g2
	brlz,a	%o7,	loop_1512
	movrlz	%g1,	%i7,	%g7
loop_1511:
	bg,a	loop_1513
	tcs	%xcc,	0x4
loop_1512:
	movcs	%xcc,	%g4,	%i2
	sllx	%i0,	0x0A,	%i5
loop_1513:
	movcs	%icc,	%i3,	%i6
	fbule,a	%fcc3,	loop_1514
	edge32n	%o4,	%l1,	%g3
	tg	%xcc,	0x2
	prefetch	[%l7 + 0x14],	 0x1
loop_1514:
	bcs,pn	%icc,	loop_1515
	fmovs	%f30,	%f27
	mulx	%o3,	%o0,	%l2
	addcc	%o5,	%o6,	%l6
loop_1515:
	ldx	[%l7 + 0x08],	%i4
	membar	0x73
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f16
	xor	%l4,	%g5,	%o2
	tcs	%xcc,	0x6
	fmovsn	%icc,	%f9,	%f28
	taddcctv	%o1,	0x1A43,	%l3
	wr	%g0,	0x19,	%asi
	stxa	%i1,	[%l7 + 0x30] %asi
	sdivx	%l0,	0x183F,	%g6
	fxor	%f4,	%f22,	%f16
	andncc	%g2,	%l5,	%o7
	move	%xcc,	%g1,	%g7
	bvs,a,pn	%xcc,	loop_1516
	orncc	%g4,	0x1FDA,	%i2
	addc	%i7,	%i5,	%i3
	nop
	setx	loop_1517,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1516:
	movg	%icc,	%i6,	%o4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x74] %asi,	%l1
loop_1517:
	edge16n	%g3,	%o3,	%o0
	or	%i0,	%l2,	%o5
	sll	%o6,	0x0D,	%l6
	addccc	%i4,	0x1A2C,	%g5
	movle	%xcc,	%o2,	%o1
	nop
	setx	0xA71081177AD045E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5FCE391F5A5FD7FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f24,	%f16
	tne	%xcc,	0x3
	mulscc	%l4,	%i1,	%l3
	xorcc	%g6,	0x1C6D,	%l0
	fandnot1s	%f19,	%f20,	%f30
	srl	%l5,	%o7,	%g1
	fcmple32	%f16,	%f4,	%g7
	array16	%g4,	%i2,	%i7
	fcmpgt16	%f8,	%f8,	%i5
	xorcc	%i3,	%i6,	%o4
	fblg	%fcc1,	loop_1518
	addccc	%g2,	%l1,	%o3
	movrlz	%o0,	0x18F,	%i0
	fmovsvc	%xcc,	%f4,	%f31
loop_1518:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%g3
	fcmpeq32	%f24,	%f28,	%o5
	movle	%xcc,	%o6,	%l6
	wr	%g0,	0xe3,	%asi
	stwa	%l2,	[%l7 + 0x40] %asi
	membar	#Sync
	ta	%icc,	0x4
	fbuge,a	%fcc2,	loop_1519
	movneg	%icc,	%i4,	%o2
	fbge,a	%fcc3,	loop_1520
	for	%f16,	%f22,	%f16
loop_1519:
	fors	%f31,	%f13,	%f20
	popc	%o1,	%g5
loop_1520:
	fmovdcc	%xcc,	%f15,	%f12
	bne	%icc,	loop_1521
	xor	%l4,	%l3,	%g6
	tl	%xcc,	0x3
	orn	%l0,	%l5,	%i1
loop_1521:
	fpack32	%f26,	%f20,	%f12
	bl	%icc,	loop_1522
	be,a	loop_1523
	fblg	%fcc3,	loop_1524
	fxor	%f16,	%f8,	%f10
loop_1522:
	fones	%f30
loop_1523:
	sir	0x0890
loop_1524:
	edge16l	%g1,	%o7,	%g4
	subcc	%i2,	0x16B4,	%i7
	movle	%xcc,	%i5,	%g7
	tleu	%icc,	0x0
	ldstub	[%l7 + 0x37],	%i6
	tsubcctv	%i3,	%g2,	%l1
	movle	%xcc,	%o4,	%o3
	subc	%i0,	0x0BC6,	%g3
	fmovdge	%icc,	%f6,	%f2
	te	%xcc,	0x2
	umul	%o5,	%o0,	%l6
	edge16ln	%l2,	%i4,	%o6
	movgu	%icc,	%o1,	%o2
	addcc	%l4,	%l3,	%g5
	xor	%l0,	0x1CCB,	%g6
	fpack32	%f28,	%f14,	%f0
	ble,pt	%icc,	loop_1525
	sdivx	%i1,	0x05E4,	%g1
	movne	%xcc,	%l5,	%g4
	sll	%i2,	0x0E,	%o7
loop_1525:
	orncc	%i7,	%g7,	%i5
	fnot1	%f0,	%f26
	edge16	%i3,	%g2,	%l1
	fxor	%f20,	%f2,	%f14
	fmuld8ulx16	%f17,	%f29,	%f10
	movrne	%o4,	%o3,	%i6
	fbule,a	%fcc1,	loop_1526
	andncc	%i0,	%g3,	%o5
	fba,a	%fcc0,	loop_1527
	tg	%xcc,	0x3
loop_1526:
	fabss	%f27,	%f13
	nop
	setx	0x8391CDE60A2F035E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5003BC6F4C6F8F45,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f0,	%f22
loop_1527:
	popc	%o0,	%l2
	bshuffle	%f10,	%f0,	%f26
	fbne,a	%fcc0,	loop_1528
	bn,pt	%icc,	loop_1529
	movleu	%xcc,	%i4,	%l6
	movn	%icc,	%o1,	%o6
loop_1528:
	movl	%xcc,	%l4,	%o2
loop_1529:
	fmovsle	%xcc,	%f8,	%f7
	nop
	setx	0x08EAD6F42BB834CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
	movl	%xcc,	%l3,	%l0
	mova	%icc,	%g6,	%i1
	flush	%l7 + 0x38
	sll	%g1,	0x07,	%l5
	sdivx	%g4,	0x117B,	%g5
	or	%o7,	%i7,	%g7
	fcmpeq32	%f12,	%f24,	%i2
	fmovsne	%icc,	%f1,	%f21
	ldd	[%l7 + 0x20],	%f14
	udivcc	%i3,	0x09C5,	%i5
	set	0x7C, %o0
	lduwa	[%l7 + %o0] 0x81,	%g2
	bcc	%icc,	loop_1530
	fnot2	%f24,	%f28
	tsubcctv	%l1,	0x194B,	%o3
	tcc	%icc,	0x0
loop_1530:
	membar	0x0C
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x2a,	%i6
	fandnot2s	%f16,	%f20,	%f20
	movcc	%icc,	%o4,	%i0
	membar	0x61
	andncc	%g3,	%o0,	%l2
	edge32	%o5,	%l6,	%o1
	or	%i4,	%o6,	%o2
	subcc	%l3,	%l4,	%l0
	fones	%f3
	movl	%xcc,	%i1,	%g6
	xorcc	%g1,	%l5,	%g4
	edge16l	%o7,	%g5,	%i7
	tgu	%xcc,	0x3
	alignaddrl	%i2,	%i3,	%i5
	sdivx	%g7,	0x1EC2,	%l1
	wr	%g0,	0x21,	%asi
	stxa	%o3,	[%g0 + 0x108] %asi
	and	%g2,	%i6,	%i0
	edge16	%g3,	%o0,	%l2
	movne	%icc,	%o5,	%l6
	set	0x44, %o4
	stwa	%o1,	[%l7 + %o4] 0x14
	tg	%icc,	0x5
	array8	%i4,	%o4,	%o6
	movne	%icc,	%o2,	%l4
	fbu	%fcc3,	loop_1531
	fones	%f4
	mulscc	%l0,	%l3,	%g6
	bge,a,pt	%icc,	loop_1532
loop_1531:
	xorcc	%g1,	0x06B2,	%i1
	edge8l	%l5,	%g4,	%g5
	andn	%o7,	0x1F61,	%i2
loop_1532:
	sdivx	%i3,	0x1117,	%i7
	tn	%xcc,	0x5
	fpmerge	%f18,	%f23,	%f8
	bpos	loop_1533
	nop
	set	0x08, %o1
	ldsh	[%l7 + %o1],	%g7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f16
loop_1533:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	edge32	%l1,	%o3,	%g2
	mulx	%i6,	%g3,	%o0
	lduh	[%l7 + 0x74],	%l2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x72] %asi,	%o5
	te	%icc,	0x0
	prefetch	[%l7 + 0x68],	 0x3
	movcc	%xcc,	%i0,	%l6
	edge16l	%o1,	%o4,	%o6
	subc	%i4,	%l4,	%o2
	movpos	%icc,	%l3,	%l0
	fandnot2	%f4,	%f10,	%f20
	move	%icc,	%g1,	%g6
	bleu	%xcc,	loop_1534
	tcs	%xcc,	0x7
	bge,pn	%xcc,	loop_1535
	movl	%icc,	%i1,	%g4
loop_1534:
	edge32	%l5,	%g5,	%i2
	tvc	%icc,	0x5
loop_1535:
	alignaddrl	%i3,	%i7,	%o7
	srl	%g7,	0x1E,	%l1
	fmovsvc	%xcc,	%f15,	%f13
	for	%f12,	%f6,	%f28
	nop
	setx loop_1536, %l0, %l1
	jmpl %l1, %i5
	andcc	%g2,	%o3,	%g3
	fble	%fcc3,	loop_1537
	stbar
loop_1536:
	fsrc1s	%f28,	%f27
	popc	0x00DA,	%i6
loop_1537:
	xor	%o0,	0x0A22,	%l2
	fxor	%f12,	%f12,	%f24
	nop
	setx	0x00649B05,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	faligndata	%f10,	%f6,	%f6
	fbe	%fcc2,	loop_1538
	umulcc	%o5,	%l6,	%o1
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x11,	%o4
loop_1538:
	sll	%o6,	0x0F,	%i0
	movneg	%xcc,	%l4,	%i4
	movrlez	%l3,	0x2C9,	%o2
	fbuge	%fcc3,	loop_1539
	fmovdneg	%xcc,	%f29,	%f23
	fmovdpos	%xcc,	%f16,	%f16
	ldstub	[%l7 + 0x4B],	%g1
loop_1539:
	stbar
	fbo	%fcc0,	loop_1540
	swap	[%l7 + 0x20],	%l0
	swap	[%l7 + 0x5C],	%i1
	faligndata	%f22,	%f18,	%f18
loop_1540:
	edge16ln	%g6,	%g4,	%g5
	ldub	[%l7 + 0x0C],	%l5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbn	%fcc0,	loop_1541
	movcs	%icc,	%i2,	%i7
	tleu	%icc,	0x6
	movrgz	%i3,	%g7,	%o7
loop_1541:
	sdiv	%l1,	0x0F02,	%i5
	fmovrdlz	%g2,	%f10,	%f18
	tne	%icc,	0x2
	fmovdgu	%icc,	%f23,	%f6
	fpack16	%f30,	%f8
	movn	%xcc,	%g3,	%o3
	array32	%i6,	%o0,	%l2
	set	0x6C, %o5
	ldstuba	[%l7 + %o5] 0x19,	%o5
	andn	%l6,	%o4,	%o6
	sdivx	%i0,	0x0EA5,	%l4
	tl	%xcc,	0x5
	or	%i4,	%o1,	%o2
	mulscc	%l3,	%g1,	%i1
	tle	%icc,	0x5
	tpos	%icc,	0x6
	edge32ln	%l0,	%g4,	%g6
	andn	%g5,	%l5,	%i2
	movrne	%i7,	0x381,	%i3
	brgez	%o7,	loop_1542
	fmovdvc	%xcc,	%f16,	%f6
	add	%l1,	0x1824,	%i5
	edge32ln	%g2,	%g7,	%o3
loop_1542:
	bne,pt	%icc,	loop_1543
	andcc	%g3,	%o0,	%l2
	tg	%icc,	0x3
	tcc	%xcc,	0x3
loop_1543:
	fmovrdlz	%o5,	%f20,	%f28
	tg	%xcc,	0x7
	edge8	%l6,	%i6,	%o4
	edge16n	%o6,	%l4,	%i4
	nop
	setx	0x07FDFC0C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x354B120D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f6,	%f10
	sll	%i0,	0x14,	%o2
	smulcc	%o1,	%g1,	%l3
	movrlz	%l0,	0x05E,	%i1
	movneg	%xcc,	%g6,	%g5
	alignaddrl	%l5,	%g4,	%i2
	tgu	%icc,	0x0
	nop
	setx	0x8EC769A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f18
	fnot2s	%f24,	%f16
	andncc	%i7,	%o7,	%i3
	popc	0x028F,	%l1
	andcc	%i5,	0x1BBC,	%g7
	fpackfix	%f2,	%f20
	edge16l	%o3,	%g2,	%o0
	andn	%l2,	%g3,	%l6
	subc	%o5,	%i6,	%o4
	movpos	%icc,	%o6,	%i4
	ba	%xcc,	loop_1544
	or	%l4,	%i0,	%o2
	fmovdcc	%xcc,	%f0,	%f22
	fmul8x16al	%f14,	%f16,	%f12
loop_1544:
	te	%xcc,	0x2
	andn	%o1,	0x0727,	%l3
	edge32n	%l0,	%i1,	%g1
	tvc	%icc,	0x3
	addcc	%g6,	%g5,	%l5
	sth	%i2,	[%l7 + 0x3E]
	set	0x7E, %o2
	ldsha	[%l7 + %o2] 0x10,	%i7
	smul	%g4,	0x1D75,	%o7
	movneg	%xcc,	%l1,	%i5
	tge	%xcc,	0x1
	fors	%f1,	%f15,	%f30
	movne	%xcc,	%g7,	%i3
	taddcc	%o3,	%o0,	%g2
	bge	loop_1545
	orncc	%l2,	0x1E9B,	%l6
	fmovrse	%g3,	%f25,	%f14
	fone	%f22
loop_1545:
	movpos	%xcc,	%i6,	%o5
	fbl,a	%fcc0,	loop_1546
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o6,	%o4
	tne	%xcc,	0x7
loop_1546:
	fmul8ulx16	%f0,	%f30,	%f28
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x89
	movgu	%icc,	%i4,	%i0
	edge16n	%o2,	%l4,	%l3
	bg,a,pt	%xcc,	loop_1547
	udivx	%l0,	0x176A,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%o1,	%g1
loop_1547:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g5,	%g6
	sdivx	%l5,	0x0C5B,	%i2
	fbne	%fcc1,	loop_1548
	movcs	%icc,	%i7,	%o7
	fmul8x16al	%f26,	%f24,	%f4
	orcc	%l1,	%g4,	%i5
loop_1548:
	tsubcc	%i3,	0x1EC0,	%o3
	andn	%g7,	%g2,	%l2
	taddcc	%l6,	0x1E91,	%g3
	brgz,a	%o0,	loop_1549
	fmul8x16au	%f19,	%f7,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i6,	0x336,	%o5
loop_1549:
	tle	%icc,	0x7
	orcc	%o4,	%i4,	%i0
	mova	%xcc,	%o6,	%o2
	taddcctv	%l4,	0x1056,	%l3
	fnands	%f13,	%f17,	%f30
	edge16l	%l0,	%i1,	%o1
	fxors	%f30,	%f27,	%f17
	movvs	%xcc,	%g1,	%g6
	fmovdne	%xcc,	%f7,	%f23
	array16	%l5,	%g5,	%i7
	fmovdle	%icc,	%f7,	%f15
	sdiv	%o7,	0x078A,	%i2
	fxor	%f14,	%f0,	%f6
	alignaddr	%g4,	%i5,	%i3
	subcc	%o3,	0x0927,	%g7
	tcs	%xcc,	0x2
	nop
	set	0x0C, %l0
	ldsh	[%l7 + %l0],	%g2
	xnor	%l1,	%l6,	%g3
	fmovs	%f12,	%f24
	mulscc	%l2,	%o0,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	movg	%icc,	%i4,	%i0
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x17,	%f16
	edge32l	%o6,	%o4,	%l4
	udivcc	%l3,	0x14EA,	%l0
	bpos,pn	%icc,	loop_1550
	sub	%o2,	0x02C1,	%i1
	srlx	%g1,	0x0A,	%o1
	edge32l	%g6,	%g5,	%i7
loop_1550:
	movneg	%icc,	%l5,	%i2
	xor	%g4,	0x1F61,	%o7
	fpadd16	%f18,	%f14,	%f12
	fmul8x16au	%f4,	%f27,	%f8
	array8	%i5,	%i3,	%g7
	array8	%o3,	%g2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f21,	[%l7 + 0x5C]
	fmovscc	%icc,	%f11,	%f10
	fpack32	%f16,	%f12,	%f16
	edge32n	%l1,	%g3,	%l2
	addcc	%i6,	0x0AEC,	%o0
	move	%icc,	%o5,	%i0
	umul	%i4,	0x1440,	%o6
	bn,a,pn	%xcc,	loop_1551
	ldstub	[%l7 + 0x4B],	%o4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l3
loop_1551:
	fmovrslz	%l4,	%f31,	%f22
	tl	%icc,	0x6
	tneg	%icc,	0x1
	movle	%xcc,	%o2,	%l0
	fbue	%fcc3,	loop_1552
	fmovsvs	%xcc,	%f22,	%f25
	tg	%xcc,	0x3
	edge16l	%g1,	%i1,	%g6
loop_1552:
	umulcc	%o1,	%g5,	%l5
	sll	%i2,	0x11,	%g4
	edge8n	%o7,	%i5,	%i3
	brlz,a	%i7,	loop_1553
	bleu,pt	%icc,	loop_1554
	fbu	%fcc0,	loop_1555
	tsubcctv	%o3,	0x1942,	%g2
loop_1553:
	bge,pt	%icc,	loop_1556
loop_1554:
	ldd	[%l7 + 0x40],	%f14
loop_1555:
	fands	%f9,	%f10,	%f3
	tpos	%icc,	0x7
loop_1556:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l6,	%g7,	%l1
	fandnot1	%f26,	%f12,	%f26
	tg	%xcc,	0x4
	fmovrsne	%l2,	%f29,	%f28
	movrlez	%g3,	0x0CC,	%i6
	tsubcctv	%o5,	0x049B,	%i0
	brlz,a	%i4,	loop_1557
	tpos	%xcc,	0x1
	fandnot1s	%f29,	%f0,	%f20
	add	%o6,	%o0,	%l3
loop_1557:
	sll	%o4,	0x0F,	%l4
	srl	%l0,	0x12,	%g1
	fpsub16	%f6,	%f18,	%f0
	nop
	setx loop_1558, %l0, %l1
	jmpl %l1, %i1
	fmovsvs	%icc,	%f30,	%f22
	fmovdle	%xcc,	%f2,	%f27
	bge,a	%icc,	loop_1559
loop_1558:
	movcc	%xcc,	%o2,	%o1
	tcs	%icc,	0x3
	sll	%g5,	%g6,	%i2
loop_1559:
	movle	%icc,	%l5,	%o7
	mulscc	%g4,	%i3,	%i7
	mulscc	%o3,	%i5,	%g2
	stx	%g7,	[%l7 + 0x30]
	popc	0x1A61,	%l1
	subcc	%l6,	0x0CCD,	%g3
	bneg,pt	%icc,	loop_1560
	fsrc1s	%f17,	%f16
	ldsw	[%l7 + 0x7C],	%l2
	stb	%i6,	[%l7 + 0x6B]
loop_1560:
	edge8l	%o5,	%i0,	%i4
	movvs	%icc,	%o0,	%o6
	udivcc	%o4,	0x0E72,	%l4
	brlez,a	%l0,	loop_1561
	tsubcctv	%g1,	0x0F03,	%i1
	wr	%g0,	0xe3,	%asi
	stha	%l3,	[%l7 + 0x0C] %asi
	membar	#Sync
loop_1561:
	nop
	setx	0xD646D2B4B7415603,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA9390B7433B99782,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f24,	%f12
	movle	%icc,	%o2,	%o1
	edge32ln	%g6,	%i2,	%l5
	ta	%icc,	0x5
	wr	%g0,	0x2a,	%asi
	stwa	%o7,	[%l7 + 0x3C] %asi
	membar	#Sync
	pdist	%f4,	%f0,	%f22
	fmovdgu	%xcc,	%f16,	%f2
	set	0x08, %i7
	stxa	%g5,	[%l7 + %i7] 0x80
	fbne,a	%fcc0,	loop_1562
	nop
	fitos	%f2,	%f17
	fstox	%f17,	%f4
	tsubcc	%i3,	0x06B7,	%g4
	addccc	%i7,	0x1320,	%i5
loop_1562:
	fmovsle	%xcc,	%f18,	%f3
	tne	%xcc,	0x6
	fmovscc	%icc,	%f7,	%f27
	set	0x3A, %g6
	lduha	[%l7 + %g6] 0x04,	%o3
	fmovrse	%g2,	%f24,	%f29
	set	0x1C, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g7
	fcmpgt16	%f0,	%f12,	%l1
	smul	%g3,	0x0B3B,	%l2
	srax	%l6,	%i6,	%o5
	sdiv	%i0,	0x1204,	%o0
	move	%icc,	%o6,	%i4
	bneg,pt	%icc,	loop_1563
	movneg	%icc,	%o4,	%l4
	sub	%l0,	0x101A,	%g1
	te	%icc,	0x0
loop_1563:
	add	%i1,	%o2,	%o1
	umul	%g6,	0x14DC,	%l3
	ld	[%l7 + 0x3C],	%f31
	edge8ln	%i2,	%l5,	%g5
	array32	%i3,	%g4,	%o7
	tgu	%icc,	0x4
	tleu	%icc,	0x2
	nop
	setx	0x02F1169FDDF2B580,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xCA5DA6EFA6B0968E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f6,	%f10
	and	%i5,	0x078B,	%o3
	umul	%i7,	%g7,	%g2
	taddcc	%l1,	%l2,	%l6
	fpsub32s	%f31,	%f28,	%f22
	udiv	%i6,	0x0995,	%g3
	fbu,a	%fcc2,	loop_1564
	fmovscc	%xcc,	%f8,	%f12
	taddcc	%o5,	0x07E6,	%i0
	mova	%icc,	%o6,	%i4
loop_1564:
	bgu,a,pt	%xcc,	loop_1565
	brz,a	%o4,	loop_1566
	array8	%l4,	%o0,	%g1
	ldd	[%l7 + 0x60],	%f24
loop_1565:
	bl,pt	%xcc,	loop_1567
loop_1566:
	movpos	%xcc,	%l0,	%i1
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f24
	fxtod	%f24,	%f14
	movrlz	%o2,	0x01A,	%o1
loop_1567:
	fbuge,a	%fcc1,	loop_1568
	fbne	%fcc3,	loop_1569
	movle	%icc,	%l3,	%g6
	movneg	%icc,	%i2,	%g5
loop_1568:
	subcc	%l5,	0x08CB,	%g4
loop_1569:
	fbge	%fcc1,	loop_1570
	bvs,pn	%xcc,	loop_1571
	fpsub16	%f0,	%f12,	%f6
	edge16n	%o7,	%i5,	%o3
loop_1570:
	fba	%fcc0,	loop_1572
loop_1571:
	tleu	%icc,	0x1
	fba,a	%fcc3,	loop_1573
	and	%i7,	%g7,	%g2
loop_1572:
	subccc	%l1,	%l2,	%l6
	fnegd	%f30,	%f0
loop_1573:
	andcc	%i3,	0x0851,	%i6
	edge32l	%o5,	%g3,	%i0
	udiv	%o6,	0x0573,	%i4
	sethi	0x053C,	%o4
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf9
	membar	#Sync
	movrlz	%o0,	0x34B,	%l4
	taddcc	%l0,	%g1,	%o2
	te	%icc,	0x5
	alignaddrl	%o1,	%i1,	%g6
	movrlz	%i2,	0x107,	%l3
	tneg	%icc,	0x1
	movrgez	%g5,	%l5,	%g4
	addcc	%o7,	0x0B71,	%o3
	ldsb	[%l7 + 0x65],	%i7
	bpos,a	loop_1574
	add	%i5,	%g2,	%l1
	addc	%l2,	0x0D32,	%l6
	te	%xcc,	0x1
loop_1574:
	fbule	%fcc3,	loop_1575
	tle	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x60] %asi,	%g7
loop_1575:
	call	loop_1576
	fxnor	%f12,	%f30,	%f6
	stbar
	sir	0x0374
loop_1576:
	umul	%i6,	0x09E7,	%o5
	tleu	%xcc,	0x0
	fbue,a	%fcc3,	loop_1577
	nop
	setx	0x37BDDC2919DA2566,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xDC7ACDEE91CFF129,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f0,	%f16
	st	%f16,	[%l7 + 0x40]
	fba,a	%fcc0,	loop_1578
loop_1577:
	fnand	%f30,	%f22,	%f28
	srlx	%i3,	0x0D,	%g3
	nop
	setx	0x4BA5FEFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xBB4FACCF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f13,	%f20
loop_1578:
	popc	%i0,	%i4
	addcc	%o6,	%o0,	%o4
	edge32n	%l4,	%l0,	%g1
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o2
	std	%f14,	[%l7 + 0x68]
	sdivcc	%i1,	0x1717,	%i2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf8
	membar	#Sync
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x22,	%g6
	ldsb	[%l7 + 0x38],	%g5
	edge32l	%l5,	%g4,	%o7
	smul	%o3,	0x0A89,	%i7
	tleu	%xcc,	0x7
	nop
	set	0x64, %i0
	ldsh	[%l7 + %i0],	%l3
	fornot2	%f2,	%f30,	%f20
	smul	%i5,	0x0C3E,	%l1
	brlez,a	%l2,	loop_1579
	ba,pn	%icc,	loop_1580
	ldd	[%l7 + 0x50],	%i6
	bgu,pn	%icc,	loop_1581
loop_1579:
	brlz	%g2,	loop_1582
loop_1580:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0253,	%g7
loop_1581:
	movne	%icc,	%i6,	%i3
loop_1582:
	movn	%icc,	%o5,	%g3
	fmovscc	%xcc,	%f13,	%f15
	fmovsl	%icc,	%f22,	%f26
	tl	%icc,	0x4
	edge8l	%i4,	%o6,	%i0
	fblg	%fcc0,	loop_1583
	nop
	setx	loop_1584,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%icc,	0x1
	tsubcc	%o4,	0x0444,	%l4
loop_1583:
	fornot1	%f24,	%f6,	%f8
loop_1584:
	andcc	%l0,	0x0C0C,	%o0
	tcs	%xcc,	0x0
	edge16l	%g1,	%o2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %l4
	lduwa	[%l7 + %l4] 0x89,	%o1
	tl	%xcc,	0x2
	orn	%g6,	0x1C8A,	%g5
	fmovrsne	%i2,	%f23,	%f1
	fsrc1s	%f14,	%f13
	sth	%l5,	[%l7 + 0x2E]
	fcmple16	%f14,	%f4,	%g4
	movrlz	%o7,	%o3,	%l3
	array8	%i7,	%i5,	%l2
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x54] %asi,	%l1
	nop
	setx loop_1585, %l0, %l1
	jmpl %l1, %l6
	tne	%icc,	0x7
	fbne,a	%fcc2,	loop_1586
	fmovdne	%xcc,	%f28,	%f4
loop_1585:
	fpsub16s	%f8,	%f16,	%f4
	lduh	[%l7 + 0x0C],	%g2
loop_1586:
	move	%icc,	%i6,	%i3
	movrgez	%o5,	%g7,	%i4
	fbl	%fcc3,	loop_1587
	move	%xcc,	%o6,	%g3
	ba,a,pt	%icc,	loop_1588
	ta	%icc,	0x6
loop_1587:
	taddcctv	%o4,	%l4,	%l0
	tleu	%icc,	0x7
loop_1588:
	fmovs	%f23,	%f10
	nop
	fitos	%f9,	%f19
	nop
	set	0x18, %l3
	stw	%o0,	[%l7 + %l3]
	fbl,a	%fcc3,	loop_1589
	tne	%icc,	0x2
	fmovdleu	%xcc,	%f10,	%f9
	movneg	%xcc,	%g1,	%i0
loop_1589:
	tle	%icc,	0x2
	orncc	%i1,	%o2,	%g6
	subccc	%g5,	0x136F,	%o1
	array8	%l5,	%g4,	%o7
	array16	%i2,	%l3,	%o3
	fmul8x16	%f23,	%f26,	%f28
	fmovsle	%xcc,	%f17,	%f25
	smulcc	%i5,	0x0DB1,	%l2
	array8	%l1,	%l6,	%g2
	udiv	%i7,	0x149B,	%i6
	movcc	%icc,	%i3,	%o5
	ta	%icc,	0x7
	nop
	setx	loop_1590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%g7,	%o6,	%g3
	alignaddrl	%o4,	%l4,	%i4
	fmovrsgez	%o0,	%f29,	%f12
loop_1590:
	movgu	%icc,	%g1,	%i0
	movg	%icc,	%i1,	%l0
	movrgez	%o2,	%g6,	%g5
	subccc	%l5,	%o1,	%g4
	orn	%o7,	%l3,	%o3
	flush	%l7 + 0x40
	array16	%i5,	%l2,	%l1
	movrne	%i2,	%g2,	%i7
	edge32	%l6,	%i6,	%i3
	fbuge,a	%fcc1,	loop_1591
	udivx	%o5,	0x1485,	%o6
	tne	%xcc,	0x4
	taddcctv	%g7,	0x08CA,	%o4
loop_1591:
	movvs	%xcc,	%g3,	%l4
	fmovrdne	%i4,	%f22,	%f30
	alignaddrl	%g1,	%o0,	%i0
	tsubcc	%l0,	0x116E,	%i1
	fnegs	%f2,	%f27
	sub	%g6,	%g5,	%o2
	sethi	0x0CFF,	%l5
	movre	%g4,	0x173,	%o1
	tpos	%xcc,	0x0
	fmovsvs	%xcc,	%f9,	%f12
	tneg	%xcc,	0x6
	taddcctv	%l3,	%o7,	%i5
	movrlz	%o3,	%l2,	%l1
	membar	0x48
	movcs	%icc,	%g2,	%i2
	bg,pn	%icc,	loop_1592
	movne	%xcc,	%l6,	%i6
	set	0x24, %l6
	swapa	[%l7 + %l6] 0x18,	%i3
loop_1592:
	sdiv	%o5,	0x05B5,	%i7
	nop
	setx	0xCD44AC85,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x98D1702E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f14,	%f16
	ldsw	[%l7 + 0x0C],	%g7
	tvc	%icc,	0x1
	brz	%o6,	loop_1593
	mova	%icc,	%o4,	%l4
	edge8	%g3,	%i4,	%o0
	nop
	setx	0x15726643B72A7FC0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x28F615A7255BFFE2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f6,	%f6
loop_1593:
	srax	%i0,	0x18,	%g1
	movre	%i1,	%g6,	%g5
	tg	%xcc,	0x3
	movrne	%l0,	0x354,	%l5
	movl	%xcc,	%g4,	%o2
	edge16n	%l3,	%o7,	%i5
	set	0x4C, %g3
	lda	[%l7 + %g3] 0x80,	%f4
	be,pn	%xcc,	loop_1594
	andncc	%o3,	%o1,	%l2
	movre	%l1,	0x397,	%i2
	flush	%l7 + 0x30
loop_1594:
	tcc	%icc,	0x6
	fnot2s	%f29,	%f22
	ldsw	[%l7 + 0x70],	%g2
	fmovrslz	%l6,	%f14,	%f0
	fmovsle	%icc,	%f18,	%f2
	or	%i3,	%o5,	%i7
	ble,a,pn	%icc,	loop_1595
	sra	%g7,	0x0A,	%o6
	smul	%o4,	%l4,	%g3
	tl	%xcc,	0x0
loop_1595:
	movne	%xcc,	%i4,	%o0
	edge32n	%i6,	%g1,	%i0
	taddcc	%i1,	%g5,	%l0
	tcc	%icc,	0x2
	brnz,a	%l5,	loop_1596
	andcc	%g4,	0x1E58,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l3,	0x121E,	%g6
loop_1596:
	edge8	%o7,	%o3,	%o1
	fmovscc	%icc,	%f11,	%f29
	bcc	%icc,	loop_1597
	udivx	%i5,	0x0BFA,	%l2
	tcs	%icc,	0x1
	prefetch	[%l7 + 0x1C],	 0x3
loop_1597:
	nop
	setx	0x8CD52C52BADA25F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x888A8BC5EBE922E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f14,	%f0
	movrlz	%l1,	%i2,	%l6
	brnz,a	%g2,	loop_1598
	orncc	%i3,	0x1101,	%o5
	edge32	%g7,	%o6,	%o4
	brgz	%l4,	loop_1599
loop_1598:
	tcc	%xcc,	0x6
	stbar
	nop
	setx	loop_1600,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1599:
	udivx	%i7,	0x1557,	%g3
	fba,a	%fcc2,	loop_1601
	fba,a	%fcc3,	loop_1602
loop_1600:
	fbne	%fcc0,	loop_1603
	fnot2	%f28,	%f2
loop_1601:
	fbge	%fcc3,	loop_1604
loop_1602:
	fmovsneg	%xcc,	%f5,	%f21
loop_1603:
	fmovsa	%icc,	%f20,	%f9
	fpsub32	%f0,	%f18,	%f12
loop_1604:
	nop
	fitos	%f6,	%f3
	fstox	%f3,	%f22
	fxtos	%f22,	%f18
	udivcc	%i4,	0x15FE,	%i6
	fcmpne16	%f20,	%f24,	%o0
	movrgez	%i0,	%g1,	%i1
	bvs,a	%xcc,	loop_1605
	mulx	%l0,	0x1B2D,	%l5
	fmovsg	%icc,	%f31,	%f0
	tne	%xcc,	0x2
loop_1605:
	membar	0x2D
	te	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%g4
	fcmpne16	%f18,	%f30,	%g5
	fbul,a	%fcc0,	loop_1606
	bge,pn	%xcc,	loop_1607
	edge8	%l3,	%g6,	%o2
	fcmpeq32	%f18,	%f30,	%o3
loop_1606:
	ta	%xcc,	0x7
loop_1607:
	tsubcc	%o1,	%o7,	%i5
	prefetch	[%l7 + 0x50],	 0x3
	xnor	%l2,	0x0248,	%i2
	fmovs	%f26,	%f17
	set	0x0E, %i3
	stba	%l1,	[%l7 + %i3] 0xea
	membar	#Sync
	movl	%xcc,	%g2,	%l6
	edge8n	%o5,	%i3,	%g7
	edge32ln	%o6,	%l4,	%o4
	fabsd	%f0,	%f20
	fmovsle	%xcc,	%f5,	%f7
	mulscc	%g3,	%i4,	%i7
	tg	%xcc,	0x4
	tgu	%xcc,	0x1
	bneg,a	%icc,	loop_1608
	movne	%xcc,	%o0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g1,	0x1EA,	%i1
loop_1608:
	movg	%icc,	%l0,	%l5
	bne	loop_1609
	movrlez	%g4,	0x39D,	%g5
	addccc	%i6,	0x024D,	%g6
	ldd	[%l7 + 0x08],	%o2
loop_1609:
	movne	%icc,	%o3,	%l3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x21] %asi,	%o7
	edge32	%i5,	%l2,	%i2
	sub	%l1,	%g2,	%l6
	movne	%icc,	%o5,	%o1
	tneg	%xcc,	0x6
	tl	%xcc,	0x5
	fcmpgt32	%f26,	%f2,	%g7
	tvc	%icc,	0x6
	srax	%o6,	%l4,	%o4
	movvs	%icc,	%i3,	%g3
	andcc	%i7,	0x0BDC,	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i4,	%g1
	fble,a	%fcc2,	loop_1610
	srl	%i1,	0x0E,	%i0
	edge16	%l0,	%g4,	%g5
	ldub	[%l7 + 0x1F],	%l5
loop_1610:
	movrlz	%i6,	%o2,	%g6
	fmovsvs	%icc,	%f14,	%f10
	fmovrsgez	%o3,	%f31,	%f9
	xor	%o7,	%l3,	%l2
	movpos	%xcc,	%i2,	%i5
	tneg	%icc,	0x4
	flush	%l7 + 0x4C
	tne	%xcc,	0x6
	andncc	%g2,	%l1,	%l6
	fpadd16s	%f17,	%f13,	%f25
	move	%icc,	%o5,	%o1
	ldstub	[%l7 + 0x3A],	%g7
	orn	%l4,	%o6,	%o4
	orcc	%i3,	%g3,	%i7
	nop
	fitos	%f3,	%f29
	fstox	%f29,	%f26
	fxtos	%f26,	%f29
	smulcc	%i4,	0x0BE3,	%g1
	bgu	%xcc,	loop_1611
	fmovdle	%icc,	%f27,	%f8
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x04,	%i1
loop_1611:
	bne,a,pn	%icc,	loop_1612
	call	loop_1613
	subc	%i0,	%l0,	%g4
	sdivx	%g5,	0x1125,	%l5
loop_1612:
	udivx	%i6,	0x08B3,	%o2
loop_1613:
	taddcc	%g6,	0x0212,	%o0
	udivcc	%o7,	0x126C,	%o3
	set	0x20, %g1
	sta	%f8,	[%l7 + %g1] 0x14
	nop
	fitod	%f4,	%f20
	fdtos	%f20,	%f28
	mulx	%l2,	0x0E4F,	%l3
	edge32n	%i2,	%i5,	%l1
	tge	%xcc,	0x1
	orncc	%g2,	0x0A35,	%o5
	xnor	%o1,	0x1D1B,	%g7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x50] %asi,	%l6
	fcmple32	%f20,	%f8,	%l4
	sdivx	%o4,	0x1B07,	%o6
	fmovrde	%i3,	%f22,	%f24
	fand	%f4,	%f14,	%f6
	ldsw	[%l7 + 0x3C],	%g3
	edge16	%i7,	%i4,	%i1
	udiv	%g1,	0x01C5,	%l0
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 0x3
	fbu,a	%fcc1,	loop_1614
	xorcc	%i0,	0x0136,	%g4
	tne	%xcc,	0x4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%l5
loop_1614:
	ldx	[%l7 + 0x20],	%i6
	mulx	%g6,	%o0,	%o2
	membar	0x6F
	udivx	%o7,	0x080C,	%l2
	addc	%l3,	%o3,	%i2
	fblg	%fcc0,	loop_1615
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l1,	%g2,	%i5
	umul	%o1,	%g7,	%o5
loop_1615:
	brgez,a	%l4,	loop_1616
	ldx	[%l7 + 0x40],	%o4
	edge16ln	%o6,	%l6,	%i3
	smulcc	%g3,	0x1E8E,	%i4
loop_1616:
	edge16ln	%i7,	%i1,	%l0
	sethi	0x1E81,	%g1
	srl	%g4,	0x0F,	%g5
	xnor	%i0,	0x192A,	%i6
	wr	%g0,	0x23,	%asi
	stba	%g6,	[%l7 + 0x35] %asi
	membar	#Sync
	fmovrsne	%o0,	%f4,	%f8
	movl	%xcc,	%l5,	%o7
	edge16	%l2,	%l3,	%o3
	fcmpne16	%f0,	%f22,	%i2
	fbu	%fcc1,	loop_1617
	addcc	%l1,	%o2,	%i5
	fbge	%fcc0,	loop_1618
	move	%xcc,	%o1,	%g2
loop_1617:
	swap	[%l7 + 0x24],	%g7
	taddcctv	%l4,	0x1A0D,	%o5
loop_1618:
	edge32l	%o4,	%l6,	%o6
	fbne,a	%fcc0,	loop_1619
	fmovd	%f2,	%f8
	umul	%i3,	0x0E64,	%g3
	sdivcc	%i4,	0x1590,	%i1
loop_1619:
	edge32l	%l0,	%g1,	%i7
	movpos	%xcc,	%g5,	%g4
	fbue	%fcc3,	loop_1620
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i6
	edge16ln	%i0,	%o0,	%l5
	udiv	%g6,	0x1D59,	%l2
loop_1620:
	taddcctv	%l3,	0x14E1,	%o7
	srax	%i2,	%l1,	%o2
	edge16ln	%i5,	%o1,	%g2
	tgu	%xcc,	0x2
	movle	%icc,	%g7,	%l4
	array32	%o3,	%o5,	%l6
	fbul,a	%fcc1,	loop_1621
	srl	%o4,	%o6,	%i3
	tn	%icc,	0x7
	array32	%i4,	%g3,	%l0
loop_1621:
	fbge,a	%fcc2,	loop_1622
	movre	%i1,	%i7,	%g1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g5
loop_1622:
	mulscc	%g4,	%i6,	%i0
	fcmpgt16	%f24,	%f6,	%l5
	tvc	%icc,	0x3
	ta	%icc,	0x0
	ldsw	[%l7 + 0x20],	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g6,	0x12,	%l2
	sdiv	%l3,	0x076D,	%i2
	movneg	%icc,	%l1,	%o2
	wr	%g0,	0x19,	%asi
	stha	%i5,	[%l7 + 0x44] %asi
	mulscc	%o1,	%o7,	%g2
	nop
	setx	loop_1623,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x2
	sth	%l4,	[%l7 + 0x4C]
	st	%f23,	[%l7 + 0x58]
loop_1623:
	fcmpeq32	%f14,	%f20,	%o3
	andn	%o5,	0x131A,	%g7
	fbul,a	%fcc2,	loop_1624
	movre	%l6,	%o4,	%o6
	fpmerge	%f31,	%f7,	%f24
	movrgez	%i3,	%i4,	%g3
loop_1624:
	addcc	%i1,	%i7,	%g1
	movrne	%g5,	%g4,	%i6
	fxor	%f12,	%f4,	%f12
	tcs	%icc,	0x3
	fmovdl	%xcc,	%f17,	%f9
	sllx	%l0,	%l5,	%i0
	movne	%xcc,	%o0,	%l2
	call	loop_1625
	fbo	%fcc2,	loop_1626
	fcmple32	%f0,	%f4,	%l3
	fmovde	%xcc,	%f9,	%f19
loop_1625:
	bn	%xcc,	loop_1627
loop_1626:
	fbu	%fcc0,	loop_1628
	udivcc	%i2,	0x1530,	%g6
	edge16l	%l1,	%i5,	%o2
loop_1627:
	movrgz	%o7,	%o1,	%l4
loop_1628:
	nop
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	fbuge	%fcc3,	loop_1629
	fabsd	%f24,	%f12
	ldstub	[%l7 + 0x5C],	%o5
	tvc	%icc,	0x5
loop_1629:
	smulcc	%g2,	%g7,	%o4
	movrlz	%o6,	0x318,	%i3
	tneg	%xcc,	0x5
	srlx	%i4,	0x16,	%g3
	tcc	%xcc,	0x2
	stx	%l6,	[%l7 + 0x30]
	be,a	%icc,	loop_1630
	taddcc	%i7,	0x0908,	%g1
	ta	%icc,	0x3
	movgu	%icc,	%i1,	%g4
loop_1630:
	fand	%f20,	%f26,	%f16
	swap	[%l7 + 0x7C],	%g5
	movneg	%icc,	%i6,	%l0
	tsubcctv	%l5,	%o0,	%i0
	brlz,a	%l3,	loop_1631
	movrgz	%l2,	%g6,	%i2
	taddcctv	%l1,	0x0068,	%o2
	fnegd	%f20,	%f14
loop_1631:
	srax	%i5,	0x1E,	%o7
	xorcc	%o1,	%o3,	%o5
	smul	%l4,	0x04BD,	%g2
	fmovdcs	%xcc,	%f15,	%f18
	sethi	0x18E2,	%o4
	move	%icc,	%o6,	%g7
	subccc	%i3,	%i4,	%g3
	array16	%l6,	%g1,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f14,	%f18,	%i1
	fmovdge	%xcc,	%f15,	%f14
	udivcc	%g5,	0x049D,	%i6
	smulcc	%g4,	0x0C2E,	%l0
	fmovsa	%icc,	%f14,	%f20
	sethi	0x0085,	%l5
	tn	%xcc,	0x0
	movrlez	%o0,	0x3AF,	%i0
	taddcc	%l2,	0x17EA,	%g6
	edge32ln	%i2,	%l1,	%o2
	alignaddr	%l3,	%o7,	%i5
	edge8	%o1,	%o3,	%o5
	mulscc	%l4,	0x0717,	%o4
	movn	%xcc,	%o6,	%g2
	fmovsle	%xcc,	%f15,	%f31
	fpack16	%f20,	%f22
	edge32	%i3,	%g7,	%g3
	fpackfix	%f0,	%f11
	movleu	%xcc,	%l6,	%g1
	andncc	%i4,	%i7,	%g5
	fmovrdgz	%i6,	%f10,	%f0
	movvs	%icc,	%g4,	%l0
	bleu,a	%xcc,	loop_1632
	fmovsgu	%xcc,	%f30,	%f17
	array8	%l5,	%i1,	%o0
	movrne	%i0,	%l2,	%g6
loop_1632:
	bgu,a	loop_1633
	tne	%icc,	0x1
	ldsb	[%l7 + 0x57],	%l1
	wr	%g0,	0x22,	%asi
	stba	%o2,	[%l7 + 0x2D] %asi
	membar	#Sync
loop_1633:
	movne	%icc,	%l3,	%i2
	sdivx	%o7,	0x1DF8,	%o1
	movgu	%xcc,	%i5,	%o5
	fbule,a	%fcc1,	loop_1634
	sll	%o3,	%o4,	%o6
	fmovdge	%icc,	%f15,	%f4
	subcc	%l4,	%g2,	%g7
loop_1634:
	ldub	[%l7 + 0x6F],	%g3
	mulx	%l6,	%g1,	%i4
	st	%f28,	[%l7 + 0x14]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f27,	%f7,	%f12
	movvc	%xcc,	%i7,	%i3
	edge32	%i6,	%g4,	%g5
	and	%l0,	0x1FAB,	%i1
	movrlz	%l5,	%i0,	%o0
	alignaddr	%l2,	%l1,	%g6
	tcc	%icc,	0x4
	fmovscc	%icc,	%f15,	%f18
	srax	%l3,	0x16,	%o2
	fmovdn	%xcc,	%f31,	%f23
	movrgz	%o7,	%i2,	%o1
	movle	%icc,	%o5,	%i5
	xor	%o3,	0x12BC,	%o4
	bn,pn	%xcc,	loop_1635
	edge16l	%o6,	%l4,	%g2
	mulx	%g3,	0x0662,	%g7
	swap	[%l7 + 0x68],	%g1
loop_1635:
	nop
	setx	0xAED3553E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x4810CFFA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f28,	%f16
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x17,	%f0
	movg	%icc,	%l6,	%i4
	fmovdne	%xcc,	%f9,	%f29
	nop
	setx	0x6C836B660181F6C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f18
	fxnors	%f8,	%f15,	%f0
	mulscc	%i7,	%i3,	%i6
	movcc	%xcc,	%g4,	%g5
	andncc	%i1,	%l5,	%i0
	edge16	%l0,	%o0,	%l1
	bneg	loop_1636
	edge8n	%g6,	%l2,	%o2
	xorcc	%o7,	0x0C4A,	%l3
	addc	%i2,	0x1025,	%o5
loop_1636:
	subccc	%i5,	0x0D63,	%o1
	tleu	%icc,	0x7
	subccc	%o3,	0x135D,	%o4
	brnz	%o6,	loop_1637
	ldstub	[%l7 + 0x13],	%l4
	ldstub	[%l7 + 0x23],	%g3
	ldsh	[%l7 + 0x4A],	%g2
loop_1637:
	nop
	fitos	%f12,	%f29
	fstox	%f29,	%f10
	fxtos	%f10,	%f7
	fone	%f6
	movvc	%xcc,	%g7,	%g1
	edge16l	%i4,	%i7,	%i3
	nop
	setx	0xC0657353,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	orcc	%l6,	%g4,	%g5
	udiv	%i6,	0x03EB,	%l5
	orn	%i1,	0x1D66,	%l0
	fnor	%f28,	%f16,	%f28
	fmovrdlz	%o0,	%f4,	%f6
	tleu	%icc,	0x2
	fors	%f27,	%f28,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f8,	%f26
	nop
	setx	0xAC21BF05CCA40C37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f0
	brgez,a	%i0,	loop_1638
	std	%f12,	[%l7 + 0x78]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l1,	%g6,	%o2
loop_1638:
	prefetch	[%l7 + 0x24],	 0x2
	set	0x6A, %i5
	lduha	[%l7 + %i5] 0x81,	%o7
	bgu	%icc,	loop_1639
	edge16n	%l2,	%i2,	%o5
	taddcc	%l3,	0x160D,	%o1
	edge32n	%i5,	%o4,	%o6
loop_1639:
	bcs,a,pn	%xcc,	loop_1640
	subc	%o3,	%g3,	%l4
	edge16n	%g7,	%g2,	%g1
	fpsub16s	%f25,	%f25,	%f22
loop_1640:
	ble,pn	%icc,	loop_1641
	mova	%icc,	%i7,	%i4
	udivcc	%i3,	0x015C,	%g4
	movleu	%xcc,	%l6,	%g5
loop_1641:
	tgu	%icc,	0x1
	array8	%l5,	%i6,	%l0
	array16	%o0,	%i1,	%l1
	movpos	%icc,	%i0,	%o2
	nop
	setx	0x40CB1C719D693AF9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xBA489A5F67FF1AF9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f4,	%f0
	smul	%o7,	%g6,	%l2
	be,pn	%xcc,	loop_1642
	fblg,a	%fcc3,	loop_1643
	fxors	%f4,	%f18,	%f11
	sra	%i2,	%o5,	%o1
loop_1642:
	addcc	%l3,	0x0606,	%i5
loop_1643:
	edge16ln	%o4,	%o6,	%g3
	bl,a	%xcc,	loop_1644
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x1
	movpos	%icc,	%l4,	%g7
loop_1644:
	edge32ln	%o3,	%g2,	%g1
	srlx	%i4,	0x16,	%i3
	nop
	setx	0x7A2E8C30E524EFEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4F9BF3A0239A57C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f4,	%f4
	nop
	setx	0xFCC679A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x7417CF0E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f6,	%f12
	fpmerge	%f11,	%f29,	%f14
	movrne	%i7,	%g4,	%g5
	move	%icc,	%l5,	%l6
	ld	[%l7 + 0x58],	%f1
	fmovdneg	%xcc,	%f5,	%f7
	fbe,a	%fcc1,	loop_1645
	array32	%l0,	%o0,	%i1
	mulscc	%l1,	%i6,	%o2
	stw	%i0,	[%l7 + 0x70]
loop_1645:
	fmovrslez	%g6,	%f3,	%f21
	sub	%l2,	%i2,	%o7
	addc	%o5,	0x07A8,	%o1
	fmovscc	%xcc,	%f27,	%f25
	bn	%xcc,	loop_1646
	nop
	setx	0x7A0D9472ACDCE345,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2CDF425D71E70DB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f24,	%f18
	move	%xcc,	%i5,	%o4
	fzero	%f30
loop_1646:
	brgez,a	%l3,	loop_1647
	xor	%g3,	%l4,	%o6
	edge32n	%g7,	%g2,	%g1
	movpos	%xcc,	%i4,	%i3
loop_1647:
	fmovscs	%xcc,	%f21,	%f26
	sth	%i7,	[%l7 + 0x70]
	fnot2	%f8,	%f18
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%g4
	wr	%g0,	0x11,	%asi
	sta	%f3,	[%l7 + 0x60] %asi
	set	0x54, %l2
	lduwa	[%l7 + %l2] 0x10,	%g5
	movrlz	%l5,	%o3,	%l6
	orcc	%l0,	0x146D,	%o0
	subc	%i1,	%l1,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i0,	0x163F,	%i6
	alignaddrl	%g6,	%l2,	%i2
	fornot2	%f16,	%f4,	%f20
	movle	%xcc,	%o5,	%o7
	fmovs	%f18,	%f27
	or	%o1,	0x1530,	%o4
	umul	%l3,	0x0F89,	%g3
	xnor	%l4,	%i5,	%g7
	edge32	%g2,	%o6,	%g1
	tg	%icc,	0x5
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovsa	%icc,	%f13,	%f22
	tne	%icc,	0x7
	edge32n	%i4,	%i3,	%g4
	andncc	%i7,	%g5,	%o3
	orncc	%l6,	0x02A5,	%l0
	srlx	%l5,	%o0,	%i1
	tge	%icc,	0x6
	tle	%xcc,	0x0
	edge8	%l1,	%o2,	%i6
	fmovsa	%xcc,	%f25,	%f13
	nop
	fitos	%f11,	%f27
	fstoi	%f27,	%f1
	fpadd32s	%f29,	%f19,	%f6
	movn	%icc,	%g6,	%i0
	edge32ln	%l2,	%i2,	%o5
	stw	%o1,	[%l7 + 0x5C]
	movrlz	%o4,	%l3,	%o7
	udiv	%l4,	0x09B4,	%i5
	orncc	%g7,	0x0CB5,	%g3
	movre	%o6,	0x0B0,	%g1
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x18] %asi,	%g2
	umulcc	%i4,	%g4,	%i3
	fzero	%f18
	movg	%icc,	%g5,	%o3
	tn	%icc,	0x4
	stb	%i7,	[%l7 + 0x7B]
	ldd	[%l7 + 0x78],	%l0
	mulscc	%l5,	0x1870,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%o0,	loop_1648
	fmovdleu	%xcc,	%f14,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f10
loop_1648:
	movrgz	%i1,	0x072,	%l1
	edge32l	%i6,	%o2,	%g6
	subcc	%i0,	%l2,	%o5
	fbg,a	%fcc3,	loop_1649
	smul	%o1,	0x06DB,	%i2
	tleu	%icc,	0x2
	ble,a,pt	%icc,	loop_1650
loop_1649:
	fmovdn	%icc,	%f21,	%f18
	movrlz	%l3,	0x2BB,	%o7
	tne	%icc,	0x1
loop_1650:
	fpack16	%f26,	%f8
	tg	%xcc,	0x0
	bcs	%xcc,	loop_1651
	sethi	0x07A0,	%l4
	subcc	%i5,	0x07FA,	%g7
	fcmpeq16	%f18,	%f12,	%o4
loop_1651:
	fbe	%fcc1,	loop_1652
	movrne	%o6,	%g1,	%g2
	fmovd	%f24,	%f30
	orncc	%g3,	%g4,	%i4
loop_1652:
	tl	%icc,	0x6
	fmul8x16au	%f23,	%f0,	%f2
	andncc	%g5,	%o3,	%i7
	addcc	%l0,	%l5,	%l6
	tleu	%icc,	0x1
	andcc	%i3,	0x0523,	%o0
	brnz,a	%i1,	loop_1653
	movvs	%icc,	%i6,	%l1
	bcs,a	loop_1654
	tsubcc	%o2,	%g6,	%l2
loop_1653:
	nop
	fitod	%f6,	%f28
	fdtoi	%f28,	%f2
	nop
	setx loop_1655, %l0, %l1
	jmpl %l1, %i0
loop_1654:
	bpos,pt	%xcc,	loop_1656
	fcmpgt32	%f26,	%f20,	%o1
	and	%o5,	%l3,	%i2
loop_1655:
	add	%o7,	%i5,	%l4
loop_1656:
	fba,a	%fcc2,	loop_1657
	tle	%icc,	0x2
	be,pt	%icc,	loop_1658
	bne,a	%icc,	loop_1659
loop_1657:
	tgu	%icc,	0x2
	movre	%g7,	0x3A8,	%o4
loop_1658:
	andncc	%g1,	%o6,	%g3
loop_1659:
	fmovsneg	%icc,	%f11,	%f25
	fnor	%f30,	%f2,	%f10
	popc	0x119A,	%g2
	edge16	%i4,	%g4,	%g5
	movn	%xcc,	%o3,	%l0
	subccc	%l5,	0x1A18,	%i7
	movg	%icc,	%l6,	%i3
	fmovdn	%icc,	%f3,	%f17
	tsubcc	%o0,	%i1,	%l1
	bvs,pt	%icc,	loop_1660
	taddcc	%i6,	0x1F8A,	%g6
	fcmpeq16	%f8,	%f26,	%o2
	movvs	%xcc,	%l2,	%o1
loop_1660:
	andncc	%o5,	%i0,	%l3
	edge8	%o7,	%i5,	%i2
	ta	%xcc,	0x4
	add	%g7,	%o4,	%g1
	xnor	%l4,	%g3,	%o6
	edge32	%i4,	%g2,	%g4
	movne	%xcc,	%o3,	%l0
	bcc	loop_1661
	fbu,a	%fcc1,	loop_1662
	fpadd32s	%f8,	%f20,	%f26
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1661:
	alignaddr	%g5,	%i7,	%l5
loop_1662:
	fbne	%fcc3,	loop_1663
	fble	%fcc0,	loop_1664
	fmovsvc	%xcc,	%f30,	%f10
	fmovdcs	%xcc,	%f10,	%f21
loop_1663:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1664:
	tge	%xcc,	0x1
	udivx	%l6,	0x1EC9,	%o0
	nop
	setx	0xA3610934B4676083,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x2D303239E918BFE5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f28,	%f18
	sir	0x19E9
	edge16l	%i3,	%i1,	%l1
	tvs	%icc,	0x1
	fmovrdne	%g6,	%f18,	%f24
	movle	%xcc,	%o2,	%i6
	edge16n	%o1,	%l2,	%o5
	fmovdn	%icc,	%f15,	%f30
	taddcctv	%l3,	%i0,	%i5
	fpsub32	%f2,	%f6,	%f12
	ldstub	[%l7 + 0x3A],	%i2
	movge	%icc,	%o7,	%g7
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f12
	fxtos	%f12,	%f22
	xor	%o4,	%g1,	%g3
	nop
	fitos	%f1,	%f13
	fstod	%f13,	%f20
	bl,pn	%xcc,	loop_1665
	edge32n	%l4,	%o6,	%i4
	set	0x68, %i6
	ldswa	[%l7 + %i6] 0x11,	%g4
loop_1665:
	movcs	%xcc,	%g2,	%l0
	bcc,pn	%xcc,	loop_1666
	fexpand	%f15,	%f14
	mova	%icc,	%g5,	%o3
	srl	%l5,	%i7,	%l6
loop_1666:
	fmovs	%f0,	%f28
	fbue	%fcc3,	loop_1667
	sllx	%i3,	0x1A,	%o0
	fsrc1s	%f12,	%f25
	sllx	%l1,	%i1,	%o2
loop_1667:
	and	%g6,	0x151C,	%o1
	fxnors	%f23,	%f5,	%f6
	fnegd	%f18,	%f6
	fmul8x16au	%f17,	%f2,	%f18
	ldsw	[%l7 + 0x30],	%i6
	mova	%xcc,	%o5,	%l2
	ldd	[%l7 + 0x68],	%f12
	tsubcctv	%l3,	0x0960,	%i0
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i5
	fbue	%fcc3,	loop_1668
	alignaddrl	%o7,	%g7,	%i2
	fmovdl	%icc,	%f27,	%f18
	movg	%icc,	%o4,	%g1
loop_1668:
	movleu	%xcc,	%g3,	%o6
	tleu	%icc,	0x4
	add	%i4,	%g4,	%g2
	xnorcc	%l0,	0x024A,	%g5
	move	%icc,	%o3,	%l4
	movgu	%icc,	%i7,	%l5
	andncc	%l6,	%i3,	%l1
	movrlez	%o0,	0x0A0,	%o2
	lduh	[%l7 + 0x44],	%i1
	fcmpgt32	%f0,	%f2,	%o1
	orncc	%g6,	0x1BFB,	%o5
	fandnot2s	%f10,	%f27,	%f7
	xnorcc	%l2,	%i6,	%i0
	orn	%i5,	0x024A,	%l3
	be,a,pn	%icc,	loop_1669
	or	%g7,	0x0CA8,	%i2
	mulscc	%o4,	%g1,	%g3
	or	%o7,	0x0972,	%i4
loop_1669:
	tleu	%icc,	0x1
	taddcctv	%o6,	%g4,	%g2
	udivx	%l0,	0x116A,	%g5
	sir	0x059C
	bleu,a	%xcc,	loop_1670
	tg	%xcc,	0x7
	tsubcctv	%l4,	%i7,	%l5
	mova	%xcc,	%l6,	%o3
loop_1670:
	brnz	%l1,	loop_1671
	fandnot2s	%f15,	%f1,	%f19
	array32	%i3,	%o2,	%i1
	fcmple16	%f12,	%f12,	%o1
loop_1671:
	subcc	%o0,	%g6,	%o5
	call	loop_1672
	fnot2	%f2,	%f4
	udivcc	%i6,	0x0F1B,	%i0
	subc	%i5,	0x11B1,	%l3
loop_1672:
	udiv	%g7,	0x1D67,	%i2
	srlx	%o4,	0x0C,	%l2
	sethi	0x17F2,	%g3
	fbule	%fcc3,	loop_1673
	movcc	%icc,	%o7,	%g1
	bge,pt	%xcc,	loop_1674
	andn	%o6,	%g4,	%i4
loop_1673:
	movcs	%xcc,	%l0,	%g2
	movl	%xcc,	%l4,	%i7
loop_1674:
	bl,a	loop_1675
	fmovscc	%icc,	%f4,	%f11
	mulx	%l5,	0x1D9C,	%g5
	ta	%icc,	0x6
loop_1675:
	movvs	%icc,	%o3,	%l1
	movl	%xcc,	%i3,	%o2
	movcc	%xcc,	%i1,	%o1
	movcs	%icc,	%o0,	%g6
	membar	0x65
	set	0x16, %o4
	lduha	[%l7 + %o4] 0x0c,	%o5
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x35] %asi,	%i6
	fmovdcc	%xcc,	%f14,	%f15
	tne	%icc,	0x0
	fble	%fcc1,	loop_1676
	bvc,a	loop_1677
	fxor	%f18,	%f6,	%f26
	srl	%l6,	%i0,	%i5
loop_1676:
	movg	%xcc,	%l3,	%g7
loop_1677:
	umul	%o4,	0x0D93,	%l2
	tsubcctv	%g3,	0x16A7,	%i2
	fnot2s	%f0,	%f29
	fornot1s	%f8,	%f30,	%f9
	fornot1	%f30,	%f26,	%f8
	movrgez	%o7,	0x19D,	%o6
	subccc	%g4,	%i4,	%l0
	movrlz	%g1,	%g2,	%l4
	brlz	%l5,	loop_1678
	ldstub	[%l7 + 0x2D],	%g5
	movge	%icc,	%o3,	%l1
	bleu,pn	%xcc,	loop_1679
loop_1678:
	fnot2s	%f18,	%f30
	movleu	%xcc,	%i7,	%i3
	swap	[%l7 + 0x30],	%i1
loop_1679:
	fmovdgu	%icc,	%f31,	%f22
	set	0x12, %o1
	lduba	[%l7 + %o1] 0x80,	%o1
	sir	0x07BB
	orcc	%o2,	0x0884,	%g6
	fcmpne16	%f24,	%f14,	%o0
	fcmpne16	%f0,	%f16,	%o5
	set	0x70, %o6
	lda	[%l7 + %o6] 0x19,	%f23
	smulcc	%l6,	0x16F1,	%i0
	fornot2s	%f16,	%f27,	%f24
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	fbe,a	%fcc2,	loop_1680
	xnor	%l3,	%i5,	%o4
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x0c,	%l2
loop_1680:
	membar	0x16
	fnegs	%f8,	%f24
	ld	[%l7 + 0x78],	%f31
	fpadd16	%f18,	%f28,	%f4
	tvc	%icc,	0x4
	sra	%g7,	0x04,	%i2
	movpos	%icc,	%g3,	%o7
	subccc	%o6,	%i4,	%g4
	xnorcc	%g1,	0x0EDA,	%g2
	sllx	%l0,	%l5,	%g5
	stw	%o3,	[%l7 + 0x14]
	fands	%f21,	%f19,	%f20
	tvs	%icc,	0x4
	bn	%icc,	loop_1681
	tn	%xcc,	0x6
	nop
	setx	0x604B7290,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	srax	%l4,	%i7,	%l1
loop_1681:
	fmovsne	%xcc,	%f14,	%f14
	movvs	%xcc,	%i1,	%o1
	srlx	%o2,	0x0E,	%g6
	fornot1	%f6,	%f12,	%f6
	xor	%i3,	%o0,	%l6
	or	%i0,	%i6,	%o5
	udiv	%i5,	0x1143,	%l3
	fmovsg	%xcc,	%f31,	%f27
	set	0x30, %i4
	ldstuba	[%l7 + %i4] 0x11,	%o4
	movneg	%icc,	%g7,	%l2
	movre	%i2,	0x190,	%g3
	sra	%o6,	0x05,	%i4
	fbu	%fcc2,	loop_1682
	xnor	%g4,	%g1,	%g2
	set	0x68, %o2
	stxa	%o7,	[%l7 + %o2] 0x14
loop_1682:
	xnorcc	%l5,	0x150C,	%l0
	umulcc	%o3,	%l4,	%g5
	ldsb	[%l7 + 0x47],	%l1
	srlx	%i7,	0x01,	%o1
	mova	%icc,	%i1,	%g6
	ldd	[%l7 + 0x48],	%f6
	ldd	[%l7 + 0x78],	%i2
	bl,pt	%icc,	loop_1683
	udivx	%o2,	0x060F,	%l6
	edge8n	%o0,	%i0,	%o5
	ta	%icc,	0x3
loop_1683:
	bvs,pt	%icc,	loop_1684
	subc	%i5,	%l3,	%i6
	be,pt	%xcc,	loop_1685
	umulcc	%o4,	0x1F92,	%g7
loop_1684:
	bl,a,pn	%icc,	loop_1686
	swap	[%l7 + 0x6C],	%l2
loop_1685:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i2
loop_1686:
	edge16	%g3,	%o6,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x18,	%g1,	%g2
	edge8	%o7,	%g4,	%l5
	edge32ln	%l0,	%l4,	%o3
	movre	%g5,	0x0AD,	%i7
	edge16	%l1,	%o1,	%g6
	brgez,a	%i3,	loop_1687
	fbuge,a	%fcc0,	loop_1688
	subc	%o2,	%l6,	%i1
	edge32l	%i0,	%o5,	%i5
loop_1687:
	edge32l	%l3,	%o0,	%o4
loop_1688:
	sethi	0x1847,	%i6
	movgu	%icc,	%g7,	%l2
	movgu	%xcc,	%g3,	%o6
	popc	0x1550,	%i4
	edge32l	%i2,	%g1,	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%g4
	udivx	%l0,	0x1CE2,	%l5
	edge16	%l4,	%g5,	%o3
	movneg	%icc,	%i7,	%l1
	movge	%xcc,	%o1,	%i3
	subc	%o2,	%l6,	%g6
	fmovdn	%xcc,	%f19,	%f24
	edge16n	%i1,	%o5,	%i0
	edge16	%i5,	%l3,	%o0
	tleu	%icc,	0x6
	swap	[%l7 + 0x54],	%i6
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f9
	andn	%o4,	%l2,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o6,	%g7,	%i2
	andcc	%i4,	0x00DA,	%g1
	tcc	%icc,	0x5
	fbue	%fcc2,	loop_1689
	movneg	%xcc,	%g2,	%g4
	movcc	%xcc,	%l0,	%o7
	fsrc1s	%f26,	%f29
loop_1689:
	bge,pn	%xcc,	loop_1690
	movre	%l5,	%l4,	%g5
	alignaddr	%i7,	%l1,	%o1
	nop
	setx	0xD7A1D3C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xA7020320,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f11,	%f0
loop_1690:
	fmovsvc	%icc,	%f2,	%f16
	sra	%o3,	0x19,	%o2
	umulcc	%l6,	%i3,	%g6
	alignaddrl	%o5,	%i0,	%i5
	subc	%l3,	%i1,	%o0
	edge16ln	%o4,	%l2,	%g3
	array8	%i6,	%o6,	%i2
	flush	%l7 + 0x24
	mulx	%i4,	0x040E,	%g1
	movneg	%xcc,	%g7,	%g4
	std	%f4,	[%l7 + 0x08]
	fmovsne	%icc,	%f16,	%f13
	edge8l	%g2,	%o7,	%l0
	st	%f18,	[%l7 + 0x10]
	ldstub	[%l7 + 0x5B],	%l5
	nop
	setx	0xF35D1556,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x013083EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f22,	%f4
	brz	%g5,	loop_1691
	popc	%i7,	%l1
	edge32n	%l4,	%o1,	%o3
	movcs	%icc,	%o2,	%i3
loop_1691:
	udivx	%g6,	0x08ED,	%l6
	sethi	0x004C,	%o5
	nop
	setx loop_1692, %l0, %l1
	jmpl %l1, %i0
	taddcc	%l3,	%i1,	%o0
	movne	%xcc,	%o4,	%l2
	be,a	%icc,	loop_1693
loop_1692:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%i6,	%o6
	fmovdg	%xcc,	%f1,	%f2
loop_1693:
	ble	loop_1694
	taddcctv	%i5,	%i4,	%i2
	brlz,a	%g1,	loop_1695
	movg	%xcc,	%g7,	%g2
loop_1694:
	fmovse	%xcc,	%f13,	%f13
	bvc,pt	%xcc,	loop_1696
loop_1695:
	edge8	%o7,	%l0,	%g4
	subccc	%g5,	%i7,	%l5
	sllx	%l1,	%l4,	%o3
loop_1696:
	alignaddr	%o1,	%o2,	%g6
	set	0x48, %g4
	lduwa	[%l7 + %g4] 0x89,	%i3
	add	%o5,	%i0,	%l3
	fornot1	%f10,	%f6,	%f16
	addc	%l6,	%o0,	%o4
	move	%icc,	%i1,	%g3
	movrne	%l2,	%i6,	%o6
	tneg	%xcc,	0x4
	edge16	%i5,	%i4,	%g1
	addcc	%g7,	0x0417,	%g2
	edge32	%o7,	%i2,	%l0
	and	%g4,	0x1309,	%g5
	fmovdvc	%icc,	%f26,	%f20
	xnorcc	%i7,	0x0AD2,	%l5
	brnz,a	%l1,	loop_1697
	tn	%xcc,	0x3
	popc	0x0FA3,	%o3
	tl	%icc,	0x1
loop_1697:
	ldd	[%l7 + 0x70],	%l4
	edge8	%o1,	%o2,	%g6
	mulx	%o5,	%i0,	%i3
	set	0x14, %l0
	stwa	%l6,	[%l7 + %l0] 0x2b
	membar	#Sync
	sdivx	%o0,	0x021E,	%l3
	fmovsne	%icc,	%f14,	%f27
	andn	%i1,	%g3,	%o4
	sllx	%i6,	0x1F,	%o6
	add	%l2,	0x148A,	%i4
	andncc	%i5,	%g1,	%g7
	nop
	setx	0x17D24C68F5CC4383,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x226A42CC8DD537FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f24,	%f2
	brgz,a	%o7,	loop_1698
	addcc	%i2,	0x1C2C,	%g2
	movvs	%icc,	%g4,	%g5
	fxor	%f24,	%f10,	%f30
loop_1698:
	xnor	%l0,	%l5,	%l1
	fmovrsgz	%i7,	%f5,	%f16
	or	%o3,	%o1,	%o2
	fbu,a	%fcc0,	loop_1699
	orcc	%l4,	%g6,	%o5
	membar	0x4D
	stw	%i3,	[%l7 + 0x58]
loop_1699:
	move	%icc,	%l6,	%o0
	tgu	%xcc,	0x2
	edge16n	%i0,	%l3,	%g3
	ba,a	loop_1700
	taddcc	%o4,	%i6,	%i1
	set	0x58, %o7
	stwa	%o6,	[%l7 + %o7] 0x89
loop_1700:
	fblg,a	%fcc2,	loop_1701
	addc	%l2,	0x04A9,	%i4
	fblg	%fcc1,	loop_1702
	nop
	setx	0xCD5536A5405AAB1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x77C989524F77B6A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f12,	%f2
loop_1701:
	ldub	[%l7 + 0x40],	%g1
	fandnot2s	%f14,	%f24,	%f8
loop_1702:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g7,	%o7
	fsrc2	%f20,	%f24
	udivcc	%i5,	0x1206,	%i2
	smulcc	%g2,	%g5,	%l0
	edge32n	%g4,	%l5,	%l1
	tpos	%icc,	0x5
	set	0x4C, %g6
	swapa	[%l7 + %g6] 0x80,	%i7
	fpadd32	%f24,	%f14,	%f26
	ldstub	[%l7 + 0x5F],	%o1
	udivx	%o2,	0x171F,	%o3
	sir	0x09D7
	sdivcc	%g6,	0x0388,	%o5
	umul	%i3,	%l6,	%o0
	udivx	%l4,	0x0FBB,	%i0
	orncc	%l3,	0x03E4,	%o4
	tg	%icc,	0x1
	fmovdge	%icc,	%f19,	%f10
	fmovsvs	%xcc,	%f24,	%f17
	movre	%i6,	0x31C,	%i1
	addc	%g3,	0x199F,	%o6
	set	0x64, %i7
	stwa	%l2,	[%l7 + %i7] 0x14
	sdivx	%g1,	0x0CE2,	%g7
	ldd	[%l7 + 0x60],	%f14
	fblg,a	%fcc2,	loop_1703
	fxnors	%f18,	%f12,	%f30
	array16	%o7,	%i5,	%i2
	and	%i4,	%g5,	%l0
loop_1703:
	sdivcc	%g2,	0x1B3B,	%g4
	bgu,a	loop_1704
	movre	%l5,	%i7,	%o1
	movrgez	%l1,	%o2,	%g6
	orncc	%o3,	0x1989,	%i3
loop_1704:
	nop
	set	0x4F, %o3
	lduba	[%l7 + %o3] 0x10,	%o5
	fone	%f12
	xorcc	%l6,	%o0,	%l4
	ld	[%l7 + 0x1C],	%f14
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	fmovde	%icc,	%f10,	%f5
	andncc	%o4,	%l3,	%i6
	array32	%g3,	%o6,	%i1
	fmovdn	%xcc,	%f24,	%f28
	fmovdg	%xcc,	%f19,	%f26
	edge8n	%l2,	%g7,	%o7
	fexpand	%f21,	%f10
	movre	%g1,	%i5,	%i4
	fbule,a	%fcc3,	loop_1705
	edge32n	%g5,	%l0,	%i2
	umulcc	%g2,	%g4,	%i7
	fzero	%f28
loop_1705:
	nop
	setx	0x89BA72CC1D6FFDE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC75A0F23C46DD587,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f8,	%f28
	edge32l	%o1,	%l5,	%o2
	ldx	[%l7 + 0x78],	%l1
	subcc	%o3,	%i3,	%o5
	movgu	%icc,	%l6,	%g6
	sdivcc	%o0,	0x0020,	%i0
	add	%o4,	0x1D64,	%l3
	taddcc	%l4,	%g3,	%i6
	fmul8sux16	%f20,	%f8,	%f30
	fornot2s	%f27,	%f12,	%f19
	fmovrsgz	%i1,	%f27,	%f9
	movre	%o6,	0x29E,	%g7
	fand	%f28,	%f28,	%f30
	movpos	%xcc,	%o7,	%g1
	membar	0x28
	umul	%i5,	%i4,	%g5
	fbge	%fcc1,	loop_1706
	subcc	%l0,	%l2,	%g2
	edge16l	%i2,	%i7,	%o1
	srax	%g4,	0x03,	%l5
loop_1706:
	mulscc	%l1,	%o2,	%i3
	fpadd16s	%f3,	%f12,	%f5
	taddcctv	%o3,	0x1035,	%l6
	subccc	%g6,	0x02C3,	%o5
	subc	%i0,	%o4,	%o0
	fbg,a	%fcc3,	loop_1707
	edge32n	%l4,	%l3,	%i6
	tgu	%icc,	0x1
	fnegd	%f20,	%f12
loop_1707:
	tvc	%xcc,	0x3
	alignaddrl	%g3,	%o6,	%g7
	tg	%icc,	0x5
	ld	[%l7 + 0x5C],	%f29
	taddcc	%i1,	%g1,	%o7
	fbn	%fcc2,	loop_1708
	fmovrdgez	%i4,	%f14,	%f18
	addcc	%g5,	%l0,	%i5
	fbn	%fcc2,	loop_1709
loop_1708:
	tge	%icc,	0x3
	fmovda	%icc,	%f19,	%f29
	tl	%xcc,	0x5
loop_1709:
	fmul8x16al	%f3,	%f31,	%f16
	edge8ln	%l2,	%g2,	%i7
	subcc	%o1,	%i2,	%g4
	tcc	%xcc,	0x6
	movpos	%icc,	%l1,	%o2
	fmovs	%f19,	%f1
	fone	%f24
	orn	%l5,	%o3,	%i3
	sethi	0x183E,	%g6
	movrgez	%o5,	0x1AD,	%l6
	ta	%xcc,	0x1
	or	%i0,	%o4,	%o0
	mulx	%l3,	0x107A,	%i6
	faligndata	%f2,	%f10,	%f30
	tne	%icc,	0x3
	movl	%xcc,	%l4,	%o6
	movcs	%xcc,	%g7,	%i1
	sub	%g1,	0x1A8A,	%g3
	nop
	fitos	%f12,	%f7
	fstoi	%f7,	%f29
	sra	%o7,	%i4,	%g5
	nop
	setx	0xABE29493B05AB0AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	setx	0xB325B0FC1043CE44,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fmovdvc	%icc,	%f7,	%f10
	tsubcc	%i5,	0x1DA0,	%l2
	ld	[%l7 + 0x1C],	%f15
	orcc	%l0,	%g2,	%o1
	fbul	%fcc0,	loop_1710
	tle	%icc,	0x5
	fmovscc	%icc,	%f15,	%f28
	fcmpgt32	%f4,	%f10,	%i7
loop_1710:
	swap	[%l7 + 0x20],	%g4
	bge,a,pn	%xcc,	loop_1711
	smulcc	%i2,	0x1A4A,	%o2
	fmovrslez	%l1,	%f28,	%f19
	call	loop_1712
loop_1711:
	ldstub	[%l7 + 0x5F],	%o3
	wr	%g0,	0x80,	%asi
	sta	%f15,	[%l7 + 0x38] %asi
loop_1712:
	nop
	set	0x28, %i1
	stha	%l5,	[%l7 + %i1] 0x19
	sub	%g6,	%i3,	%o5
	bvs,a	loop_1713
	st	%f1,	[%l7 + 0x10]
	edge16n	%l6,	%i0,	%o4
	movcc	%xcc,	%o0,	%i6
loop_1713:
	sllx	%l3,	0x1E,	%l4
	edge16ln	%o6,	%i1,	%g7
	udiv	%g3,	0x021B,	%g1
	fbne,a	%fcc1,	loop_1714
	addcc	%i4,	%o7,	%g5
	tg	%xcc,	0x0
	movrgez	%i5,	0x1C5,	%l0
loop_1714:
	fmovsa	%icc,	%f3,	%f16
	tne	%icc,	0x7
	orncc	%l2,	%o1,	%i7
	smul	%g4,	0x1490,	%g2
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f0
	nop
	setx	0x107A6FEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	edge8	%i2,	%o2,	%o3
	tne	%icc,	0x2
	array16	%l5,	%g6,	%i3
	set	0x18, %i2
	stwa	%l1,	[%l7 + %i2] 0x11
	movre	%l6,	%o5,	%o4
	set	0x4E, %g5
	stba	%i0,	[%l7 + %g5] 0x2b
	membar	#Sync
	fabss	%f3,	%f18
	bne,a	%xcc,	loop_1715
	movre	%o0,	0x3A1,	%i6
	srlx	%l4,	%o6,	%l3
	set	0x16, %i0
	stha	%g7,	[%l7 + %i0] 0x2f
	membar	#Sync
loop_1715:
	movrlez	%g3,	0x2D9,	%g1
	taddcc	%i4,	0x0695,	%i1
	orn	%o7,	%i5,	%l0
	bg,a	%icc,	loop_1716
	tcs	%icc,	0x4
	fnors	%f17,	%f12,	%f13
	fnot2s	%f26,	%f4
loop_1716:
	ldx	[%l7 + 0x70],	%g5
	popc	0x17AF,	%l2
	fmovsle	%icc,	%f10,	%f23
	edge8	%o1,	%i7,	%g2
	umulcc	%i2,	%o2,	%g4
	movre	%l5,	%g6,	%o3
	nop
	set	0x70, %l4
	std	%f12,	[%l7 + %l4]
	movgu	%icc,	%l1,	%i3
	fmovsge	%xcc,	%f2,	%f0
	fxnors	%f7,	%f17,	%f18
	alignaddrl	%o5,	%o4,	%l6
	xor	%o0,	%i6,	%i0
	andn	%l4,	0x0F23,	%l3
	umulcc	%g7,	0x07C1,	%o6
	srlx	%g1,	%g3,	%i1
	fnot2s	%f15,	%f2
	set	0x14, %l6
	lduwa	[%l7 + %l6] 0x89,	%i4
	sllx	%o7,	0x1E,	%i5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x1938486A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x71E34665,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f15,	%f4
	movl	%xcc,	%l2,	%l0
	fbul	%fcc3,	loop_1717
	tcc	%xcc,	0x5
	fmovrdgz	%o1,	%f18,	%f10
	nop
	setx	0x3FF61713,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xFD23279C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f31,	%f10
loop_1717:
	ldx	[%l7 + 0x48],	%i7
	fmovspos	%xcc,	%f23,	%f2
	orcc	%i2,	0x0833,	%o2
	fzeros	%f14
	stx	%g2,	[%l7 + 0x60]
	fmuld8ulx16	%f22,	%f12,	%f16
	srl	%l5,	%g6,	%o3
	movleu	%xcc,	%g4,	%i3
	pdist	%f4,	%f0,	%f28
	movre	%l1,	%o4,	%o5
	fmovsg	%xcc,	%f17,	%f13
	fmovse	%icc,	%f11,	%f31
	edge16n	%l6,	%i6,	%i0
	udivcc	%o0,	0x04AD,	%l3
	fxnor	%f12,	%f4,	%f20
	array8	%l4,	%o6,	%g7
	fmovdgu	%icc,	%f3,	%f11
	bne,a,pt	%icc,	loop_1718
	subcc	%g3,	0x03C3,	%i1
	movne	%icc,	%i4,	%g1
	fble	%fcc0,	loop_1719
loop_1718:
	fcmple16	%f28,	%f4,	%o7
	nop
	setx	0x8BEBB5C19387063E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x48EDBD7333F88A5C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f18,	%f26
	movrne	%i5,	0x114,	%g5
loop_1719:
	andncc	%l0,	%l2,	%o1
	subcc	%i2,	%i7,	%g2
	tcc	%icc,	0x6
	subc	%l5,	%g6,	%o3
	sllx	%g4,	%o2,	%l1
	movle	%icc,	%i3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	fpadd16	%f18,	%f16,	%f10
	tvc	%icc,	0x3
	movre	%l6,	0x04E,	%o4
	brgez,a	%i6,	loop_1720
	movrlz	%i0,	0x202,	%o0
	movre	%l3,	%l4,	%g7
	fcmpne16	%f0,	%f14,	%g3
loop_1720:
	nop
	fitos	%f13,	%f26
	fstod	%f26,	%f20
	fbn,a	%fcc3,	loop_1721
	lduw	[%l7 + 0x50],	%i1
	xorcc	%i4,	%o6,	%g1
	fcmpgt32	%f30,	%f14,	%i5
loop_1721:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x68] %asi,	%g5
	nop
	set	0x4C, %l3
	ldsh	[%l7 + %l3],	%o7
	movg	%xcc,	%l0,	%o1
	brlz	%l2,	loop_1722
	edge8	%i2,	%g2,	%i7
	mova	%xcc,	%l5,	%g6
	srax	%g4,	%o2,	%l1
loop_1722:
	array16	%o3,	%i3,	%o5
	xor	%l6,	%i6,	%o4
	mulx	%o0,	0x1765,	%l3
	move	%icc,	%l4,	%g7
	fcmpne32	%f18,	%f18,	%g3
	andcc	%i0,	0x0A44,	%i1
	fbn,a	%fcc2,	loop_1723
	fblg,a	%fcc1,	loop_1724
	tsubcc	%o6,	%g1,	%i5
	or	%g5,	%i4,	%l0
loop_1723:
	fbge	%fcc3,	loop_1725
loop_1724:
	xnorcc	%o1,	0x0A92,	%o7
	srlx	%i2,	%l2,	%i7
	movrlez	%g2,	%g6,	%g4
loop_1725:
	movle	%icc,	%l5,	%l1
	movn	%xcc,	%o3,	%i3
	wr	%g0,	0x19,	%asi
	stha	%o2,	[%l7 + 0x0E] %asi
	fpsub32s	%f16,	%f6,	%f0
	move	%icc,	%o5,	%l6
	fpsub16	%f26,	%f26,	%f30
	or	%i6,	%o0,	%o4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x12] %asi,	%l4
	ldd	[%l7 + 0x50],	%f14
	xnorcc	%l3,	0x0401,	%g3
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	tvs	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g7,	0x0E0A,	%i1
	fmul8sux16	%f2,	%f0,	%f30
	sdivx	%o6,	0x1470,	%i5
	edge32	%g1,	%i4,	%l0
	andncc	%g5,	%o1,	%o7
	subc	%l2,	%i2,	%i7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
	tn	%icc,	0x0
	edge32	%g2,	%l5,	%l1
	edge8l	%o3,	%g4,	%i3
	edge8l	%o2,	%o5,	%i6
	fmovsne	%xcc,	%f31,	%f14
	tge	%xcc,	0x4
	sdivcc	%o0,	0x0D08,	%l6
	fbule,a	%fcc0,	loop_1726
	fmuld8ulx16	%f12,	%f5,	%f22
	sdivx	%o4,	0x18D1,	%l3
	edge16ln	%l4,	%g3,	%i0
loop_1726:
	ldsh	[%l7 + 0x7E],	%i1
	movneg	%xcc,	%o6,	%g7
	sllx	%i5,	0x0C,	%g1
	tneg	%icc,	0x4
	tpos	%xcc,	0x5
	sdiv	%l0,	0x07FC,	%i4
	tl	%xcc,	0x7
	movrlz	%g5,	%o1,	%l2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i2
	movvs	%icc,	%i7,	%o7
	addccc	%g2,	%g6,	%l1
	movl	%icc,	%o3,	%g4
	be,a	%icc,	loop_1727
	movvs	%xcc,	%l5,	%o2
	fmovdleu	%icc,	%f24,	%f16
	fandnot2	%f10,	%f10,	%f12
loop_1727:
	stb	%i3,	[%l7 + 0x5A]
	movrlez	%i6,	0x070,	%o0
	sll	%o5,	0x1F,	%o4
	nop
	setx	0xC4C8610070436005,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	wr	%g0,	0x04,	%asi
	stwa	%l3,	[%l7 + 0x40] %asi
	fcmple32	%f10,	%f24,	%l4
	mulscc	%g3,	0x0F23,	%i0
	fmovsn	%icc,	%f8,	%f10
	fcmpgt16	%f16,	%f14,	%l6
	tge	%icc,	0x0
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o6
	addc	%g7,	%i5,	%g1
	bl,pt	%icc,	loop_1728
	edge32ln	%l0,	%i4,	%g5
	fmul8ulx16	%f18,	%f24,	%f10
	ldd	[%l7 + 0x48],	%o0
loop_1728:
	fnot2	%f26,	%f8
	array32	%i1,	%l2,	%i2
	edge16ln	%o7,	%i7,	%g6
	sir	0x1428
	orncc	%l1,	0x0B75,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x0
	tcs	%icc,	0x4
	andncc	%o3,	%l5,	%g4
	bneg,a	loop_1729
	movl	%icc,	%i3,	%o2
	movpos	%icc,	%o0,	%o5
	movleu	%icc,	%i6,	%o4
loop_1729:
	movg	%xcc,	%l4,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%l3
	fbn	%fcc1,	loop_1730
	edge16l	%l6,	%g7,	%o6
	subc	%i5,	%g1,	%l0
	mova	%xcc,	%g5,	%o1
loop_1730:
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f12
	alignaddr	%i1,	%l2,	%i2
	brgz,a	%i4,	loop_1731
	edge8	%i7,	%o7,	%g6
	edge16ln	%g2,	%l1,	%o3
	edge16	%l5,	%i3,	%o2
loop_1731:
	add	%g4,	%o5,	%i6
	umulcc	%o4,	0x0888,	%l4
	ld	[%l7 + 0x68],	%f4
	te	%icc,	0x0
	xnorcc	%g3,	%i0,	%l3
	movrgez	%o0,	%g7,	%o6
	bne,pn	%icc,	loop_1732
	srlx	%l6,	0x00,	%g1
	tle	%xcc,	0x0
	andn	%l0,	0x1A25,	%i5
loop_1732:
	array16	%g5,	%i1,	%l2
	tn	%xcc,	0x5
	fbe,a	%fcc3,	loop_1733
	fmovrdlz	%i2,	%f16,	%f8
	edge8	%i4,	%o1,	%o7
	movcc	%icc,	%g6,	%i7
loop_1733:
	movpos	%icc,	%l1,	%g2
	sdivx	%o3,	0x01B8,	%l5
	fmovsneg	%xcc,	%f9,	%f13
	fnand	%f8,	%f28,	%f18
	srax	%o2,	0x17,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%i6
	set	0x10, %i3
	stha	%g4,	[%l7 + %i3] 0x88
	nop
	setx	loop_1734,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x5
	array8	%o4,	%l4,	%g3
	ldstub	[%l7 + 0x3D],	%l3
loop_1734:
	sdivcc	%o0,	0x1A4C,	%g7
	bvc,pt	%icc,	loop_1735
	fzeros	%f12
	fmovsgu	%xcc,	%f5,	%f13
	srax	%o6,	0x16,	%l6
loop_1735:
	nop
	set	0x78, %g7
	stxa	%g1,	[%l7 + %g7] 0xe3
	membar	#Sync
	movre	%l0,	%i0,	%g5
	tle	%icc,	0x7
	stbar
	array32	%i1,	%l2,	%i5
	fmovdgu	%xcc,	%f4,	%f24
	edge32n	%i4,	%i2,	%o1
	addc	%o7,	%i7,	%l1
	brgez,a	%g6,	loop_1736
	tn	%icc,	0x1
	movrgez	%o3,	0x364,	%l5
	tneg	%icc,	0x0
loop_1736:
	nop
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	movvc	%xcc,	%o2,	%o5
	movrgez	%i3,	0x25A,	%i6
	fmovrdgez	%o4,	%f14,	%f28
	subc	%g4,	%l4,	%g3
	addc	%o0,	%g7,	%o6
	tl	%xcc,	0x2
	set	0x60, %g1
	prefetcha	[%l7 + %g1] 0x14,	 0x0
	umul	%g1,	0x0CBC,	%l6
	fzeros	%f12
	tl	%xcc,	0x3
	tsubcc	%i0,	0x1ACC,	%l0
	fmovrdne	%g5,	%f2,	%f6
	xorcc	%i1,	0x0DFC,	%l2
	movrgez	%i4,	0x0A3,	%i5
	edge32n	%i2,	%o7,	%i7
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f28
	fxtos	%f28,	%f9
	fbge	%fcc0,	loop_1737
	movrlz	%l1,	%o1,	%o3
	edge8	%l5,	%g2,	%o2
	sdivx	%o5,	0x0CEE,	%i3
loop_1737:
	brlez	%g6,	loop_1738
	movrne	%i6,	%g4,	%l4
	sll	%o4,	0x15,	%o0
	sdiv	%g7,	0x0CA4,	%g3
loop_1738:
	tle	%xcc,	0x7
	movge	%xcc,	%o6,	%l3
	bne,pt	%xcc,	loop_1739
	te	%icc,	0x0
	movneg	%xcc,	%l6,	%g1
	srl	%l0,	%g5,	%i0
loop_1739:
	bge,a,pt	%icc,	loop_1740
	and	%i1,	0x16E1,	%i4
	membar	0x54
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_1740:
	ldsw	[%l7 + 0x74],	%i2
	taddcc	%o7,	%l2,	%i7
	mulx	%l1,	0x108F,	%o3
	brnz,a	%l5,	loop_1741
	smul	%o1,	%o2,	%g2
	tcc	%xcc,	0x1
	mulscc	%i3,	%o5,	%i6
loop_1741:
	subc	%g4,	%g6,	%l4
	fmul8ulx16	%f6,	%f2,	%f16
	sir	0x02F5
	edge16	%o4,	%o0,	%g7
	set	0x5C, %g3
	lduwa	[%l7 + %g3] 0x19,	%o6
	fbu,a	%fcc0,	loop_1742
	taddcc	%l3,	%l6,	%g3
	bleu,a	%icc,	loop_1743
	mulscc	%l0,	0x06C0,	%g5
loop_1742:
	fors	%f20,	%f12,	%f0
	udivcc	%i0,	0x0DA9,	%g1
loop_1743:
	edge8ln	%i4,	%i1,	%i5
	edge16n	%i2,	%o7,	%i7
	smulcc	%l2,	0x147E,	%o3
	popc	%l5,	%l1
	array8	%o1,	%g2,	%o2
	bgu	%icc,	loop_1744
	fbule,a	%fcc3,	loop_1745
	mulx	%i3,	%i6,	%o5
	fpmerge	%f29,	%f22,	%f2
loop_1744:
	brgez	%g4,	loop_1746
loop_1745:
	move	%xcc,	%l4,	%o4
	fmovdcs	%xcc,	%f11,	%f30
	or	%o0,	0x1EA5,	%g6
loop_1746:
	fmovdvc	%icc,	%f19,	%f23
	taddcctv	%g7,	%l3,	%l6
	array32	%o6,	%g3,	%l0
	array16	%g5,	%g1,	%i4
	fmovse	%xcc,	%f4,	%f27
	fsrc2	%f28,	%f8
	alignaddr	%i1,	%i5,	%i0
	sir	0x00D7
	swap	[%l7 + 0x68],	%i2
	fzero	%f26
	addc	%o7,	%l2,	%i7
	std	%f10,	[%l7 + 0x10]
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f5,	%f27,	%f4
	fmovdne	%xcc,	%f31,	%f30
	brnz	%l5,	loop_1747
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l1,	%g2
	fxnor	%f0,	%f30,	%f10
loop_1747:
	taddcctv	%o2,	0x09BE,	%i3
	ta	%xcc,	0x2
	movcc	%icc,	%o1,	%i6
	fcmpgt32	%f6,	%f6,	%g4
	addccc	%l4,	0x1F5F,	%o5
	sllx	%o4,	%o0,	%g7
	fmovsleu	%icc,	%f13,	%f10
	fmovsgu	%icc,	%f10,	%f11
	subccc	%g6,	0x1E30,	%l6
	sdiv	%o6,	0x148E,	%l3
	fandnot1	%f6,	%f4,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f30,	%f0
	movpos	%xcc,	%l0,	%g3
	orcc	%g5,	%g1,	%i1
	fmovsgu	%xcc,	%f17,	%f0
	fnot2s	%f12,	%f25
	fandnot1	%f28,	%f18,	%f24
	movle	%xcc,	%i4,	%i5
	tgu	%xcc,	0x7
	movne	%xcc,	%i2,	%o7
	fmovdne	%icc,	%f18,	%f31
	movcs	%xcc,	%i0,	%l2
	fmul8x16au	%f10,	%f11,	%f0
	udiv	%o3,	0x0D95,	%l5
	fmovdleu	%xcc,	%f14,	%f18
	brlz,a	%i7,	loop_1748
	andn	%l1,	0x0DEF,	%g2
	or	%i3,	0x17F1,	%o2
	alignaddrl	%o1,	%i6,	%l4
loop_1748:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x11,	%f16
	movgu	%icc,	%g4,	%o4
	lduw	[%l7 + 0x54],	%o0
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0x0
	umulcc	%o5,	%l6,	%g6
	movn	%icc,	%o6,	%l0
	tne	%icc,	0x4
	udivcc	%g3,	0x0A4D,	%g5
	fmovrdlez	%l3,	%f6,	%f18
	subc	%g1,	0x12BB,	%i4
	subcc	%i1,	%i2,	%o7
	fpadd16s	%f15,	%f9,	%f11
	fone	%f24
	subcc	%i0,	%l2,	%i5
	flush	%l7 + 0x74
	movne	%xcc,	%o3,	%l5
	tge	%icc,	0x1
	movg	%xcc,	%l1,	%i7
	xnorcc	%i3,	0x0F9E,	%g2
	movgu	%icc,	%o2,	%o1
	srl	%l4,	%i6,	%g4
	fabss	%f14,	%f21
	movrne	%o4,	%g7,	%o5
	ld	[%l7 + 0x08],	%f17
	fnands	%f9,	%f6,	%f12
	tcc	%icc,	0x6
	lduw	[%l7 + 0x18],	%o0
	srl	%g6,	0x10,	%l6
	tcc	%icc,	0x7
	addc	%o6,	0x025A,	%l0
	edge32l	%g5,	%l3,	%g3
	fsrc2s	%f28,	%f30
	bcc,pn	%icc,	loop_1749
	sir	0x1494
	stw	%i4,	[%l7 + 0x1C]
	udivcc	%i1,	0x1FEA,	%i2
loop_1749:
	fmovrdgez	%g1,	%f2,	%f30
	edge32n	%o7,	%i0,	%l2
	st	%f9,	[%l7 + 0x48]
	movrlz	%o3,	%i5,	%l5
	fmovsne	%xcc,	%f8,	%f11
	subc	%l1,	0x0508,	%i7
	wr	%g0,	0x18,	%asi
	stxa	%g2,	[%l7 + 0x38] %asi
	fmovdge	%xcc,	%f27,	%f3
	array8	%o2,	%i3,	%l4
	movg	%xcc,	%i6,	%g4
	mulscc	%o4,	0x1A06,	%g7
	stbar
	sdivx	%o5,	0x1374,	%o1
	nop
	setx loop_1750, %l0, %l1
	jmpl %l1, %g6
	flush	%l7 + 0x6C
	movle	%xcc,	%o0,	%o6
	andn	%l0,	%l6,	%g5
loop_1750:
	orcc	%l3,	%g3,	%i4
	edge32ln	%i1,	%i2,	%g1
	array32	%o7,	%l2,	%i0
	fbg,a	%fcc2,	loop_1751
	movrne	%i5,	0x12D,	%o3
	ble,a	%xcc,	loop_1752
	fmovdl	%xcc,	%f1,	%f25
loop_1751:
	fmovdpos	%icc,	%f27,	%f5
	fandnot2s	%f16,	%f25,	%f24
loop_1752:
	fandnot2	%f8,	%f4,	%f16
	tneg	%icc,	0x0
	sdiv	%l1,	0x07F1,	%l5
	udivcc	%i7,	0x0915,	%g2
	edge32ln	%i3,	%l4,	%o2
	fornot2s	%f17,	%f24,	%f13
	alignaddr	%i6,	%o4,	%g7
	edge32ln	%o5,	%o1,	%g4
	array8	%o0,	%o6,	%l0
	nop
	fitod	%f6,	%f16
	fdtos	%f16,	%f9
	tleu	%icc,	0x0
	tle	%xcc,	0x6
	fpack32	%f30,	%f8,	%f4
	or	%g6,	0x11D4,	%g5
	edge32	%l6,	%g3,	%l3
	array32	%i4,	%i1,	%i2
	sdivcc	%o7,	0x1CBF,	%g1
	fmovdleu	%xcc,	%f20,	%f1
	set	0x32, %l5
	stha	%i0,	[%l7 + %l5] 0x81
	fbule	%fcc0,	loop_1753
	stw	%i5,	[%l7 + 0x68]
	nop
	setx	0x26E403F8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x81693490,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f26,	%f8
	fcmpne32	%f0,	%f30,	%l2
loop_1753:
	nop
	fitos	%f11,	%f19
	fstox	%f19,	%f10
	fxtos	%f10,	%f4
	mulx	%o3,	0x08F1,	%l5
	edge8n	%i7,	%g2,	%l1
	fmovda	%xcc,	%f3,	%f23
	fexpand	%f4,	%f20
	tg	%xcc,	0x7
	movne	%xcc,	%i3,	%l4
	movge	%xcc,	%i6,	%o2
	xnor	%o4,	%g7,	%o5
	membar	0x3E
	nop
	fitos	%f4,	%f23
	fstod	%f23,	%f16
	fmovdpos	%xcc,	%f16,	%f24
	bvc,a	loop_1754
	tvs	%xcc,	0x3
	umul	%g4,	0x01A2,	%o0
	ldx	[%l7 + 0x38],	%o6
loop_1754:
	mulx	%l0,	%g6,	%g5
	fmovs	%f3,	%f7
	pdist	%f10,	%f2,	%f14
	nop
	fitod	%f11,	%f4
	tvc	%icc,	0x5
	addcc	%o1,	%l6,	%l3
	nop
	setx	0x17441D3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x90F6FBDE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f14,	%f4
	movrgez	%i4,	%g3,	%i1
	movneg	%xcc,	%i2,	%o7
	fsrc2s	%f2,	%f13
	nop
	setx	0xEC5ECCB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f10
	sll	%i0,	0x0F,	%i5
	swap	[%l7 + 0x60],	%l2
	tsubcctv	%g1,	0x1DA0,	%l5
	fmovsne	%xcc,	%f19,	%f29
	movcs	%icc,	%i7,	%g2
	alignaddr	%l1,	%i3,	%l4
	edge32n	%o3,	%o2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x40],	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g7
	tsubcc	%g4,	%o5,	%o0
	orncc	%l0,	0x1FFC,	%o6
	fmovsvs	%icc,	%f19,	%f23
	sir	0x18F4
	array16	%g6,	%o1,	%l6
	fmovrdgz	%g5,	%f6,	%f12
	mova	%xcc,	%i4,	%l3
	movcs	%xcc,	%g3,	%i1
	bg	loop_1755
	sdivcc	%o7,	0x136E,	%i2
	array8	%i0,	%l2,	%i5
	fmovdge	%xcc,	%f17,	%f4
loop_1755:
	movneg	%xcc,	%l5,	%g1
	edge8n	%i7,	%l1,	%i3
	movvs	%icc,	%g2,	%l4
	fbul	%fcc0,	loop_1756
	movle	%xcc,	%o2,	%i6
	fsrc2s	%f19,	%f2
	sra	%o4,	0x0E,	%g7
loop_1756:
	orcc	%o3,	0x1B39,	%g4
	tsubcctv	%o0,	0x018E,	%l0
	edge16	%o6,	%g6,	%o1
	edge16n	%o5,	%l6,	%i4
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x1f
	membar	#Sync
	ld	[%l7 + 0x14],	%f16
	movge	%xcc,	%l3,	%g3
	tvs	%icc,	0x0
	udivx	%i1,	0x1E78,	%g5
	movvs	%icc,	%i2,	%i0
	fcmpgt32	%f26,	%f20,	%l2
	tn	%xcc,	0x7
	umulcc	%i5,	%o7,	%g1
	andcc	%l5,	%l1,	%i3
	tcs	%icc,	0x1
	udivx	%g2,	0x0DE7,	%i7
	ldub	[%l7 + 0x47],	%l4
	nop
	setx	0x4B57B460,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xBCE24637,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f7,	%f31
	fpsub16	%f8,	%f26,	%f2
	set	0x74, %l2
	lduwa	[%l7 + %l2] 0x15,	%o2
	and	%i6,	0x1C43,	%o4
	sdiv	%o3,	0x13FB,	%g4
	mulx	%o0,	%l0,	%g7
	nop
	fitod	%f0,	%f22
	fdtoi	%f22,	%f1
	taddcc	%g6,	0x1446,	%o6
	mova	%icc,	%o1,	%l6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o5
	set	0x14, %i5
	sta	%f17,	[%l7 + %i5] 0x15
	edge16l	%l3,	%i4,	%g3
	udiv	%i1,	0x1A31,	%g5
	bl,a	%xcc,	loop_1757
	fmovrdgez	%i0,	%f16,	%f24
	movcc	%icc,	%i2,	%i5
	ldsh	[%l7 + 0x2E],	%l2
loop_1757:
	bne	%icc,	loop_1758
	stw	%o7,	[%l7 + 0x60]
	set	0x68, %o4
	stwa	%l5,	[%l7 + %o4] 0x89
loop_1758:
	fmovdcc	%xcc,	%f30,	%f29
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x38] %asi,	%l1
	edge8	%g1,	%g2,	%i3
	mova	%xcc,	%l4,	%i7
	edge8ln	%o2,	%o4,	%i6
	ta	%icc,	0x2
	edge16l	%g4,	%o3,	%l0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%o0
	set	0x08, %i6
	ldxa	[%l7 + %i6] 0x14,	%g7
	nop
	setx	loop_1759,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%o6,	%g6
	fble,a	%fcc2,	loop_1760
	movpos	%icc,	%l6,	%o5
loop_1759:
	fmovsl	%icc,	%f9,	%f17
	fmovsn	%icc,	%f2,	%f15
loop_1760:
	bn,a	%xcc,	loop_1761
	fmul8x16au	%f2,	%f20,	%f24
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1761:
	fmovscc	%icc,	%f27,	%f13
	srlx	%o1,	%l3,	%g3
	set	0x10, %o6
	stwa	%i1,	[%l7 + %o6] 0x27
	membar	#Sync
	fmovrdgez	%g5,	%f8,	%f16
	sra	%i4,	%i0,	%i2
	fmovsa	%icc,	%f1,	%f29
	membar	0x55
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f21,	%f15
	fblg,a	%fcc0,	loop_1762
	fmovrdne	%l2,	%f4,	%f24
	sethi	0x1C85,	%o7
	edge8ln	%i5,	%l5,	%g1
loop_1762:
	movvc	%xcc,	%l1,	%g2
	brlez	%i3,	loop_1763
	nop
	setx	0x5A8DBDC2B6C34637,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA9C4A73CBE536E18,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f6,	%f30
	umulcc	%i7,	0x0836,	%l4
	set	0x0B, %o1
	ldstuba	[%l7 + %o1] 0x19,	%o4
loop_1763:
	te	%icc,	0x1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o2,	%g4
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	and	%i6,	%l0,	%o3
	movvc	%icc,	%o0,	%g7
	andncc	%o6,	%l6,	%g6
	edge16n	%o1,	%l3,	%o5
	ta	%xcc,	0x0
	edge16	%i1,	%g3,	%i4
	be,pn	%icc,	loop_1764
	ba,pt	%icc,	loop_1765
	tgu	%xcc,	0x0
	addc	%i0,	0x0087,	%g5
loop_1764:
	array32	%i2,	%l2,	%i5
loop_1765:
	fmovsl	%icc,	%f30,	%f21
	tne	%xcc,	0x1
	bge,a	loop_1766
	fbo,a	%fcc3,	loop_1767
	subcc	%o7,	0x04FB,	%l5
	andn	%l1,	0x18BD,	%g2
loop_1766:
	sub	%g1,	0x113C,	%i3
loop_1767:
	andncc	%i7,	%o4,	%l4
	movle	%icc,	%g4,	%i6
	xnor	%l0,	%o2,	%o3
	bvc,pn	%icc,	loop_1768
	tl	%xcc,	0x4
	fbl,a	%fcc1,	loop_1769
	st	%f19,	[%l7 + 0x58]
loop_1768:
	bl,pt	%xcc,	loop_1770
	membar	0x1D
loop_1769:
	fmovsge	%xcc,	%f21,	%f17
	tpos	%icc,	0x0
loop_1770:
	smulcc	%o0,	0x0C9B,	%o6
	edge8n	%l6,	%g6,	%o1
	mulx	%g7,	0x09C9,	%o5
	ldub	[%l7 + 0x4A],	%l3
	udivcc	%g3,	0x1C93,	%i1
	movleu	%xcc,	%i4,	%g5
	ldub	[%l7 + 0x6D],	%i0
	tvs	%icc,	0x4
	subc	%i2,	%i5,	%l2
	brnz,a	%o7,	loop_1771
	edge32ln	%l5,	%g2,	%g1
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x1f,	%f16
loop_1771:
	or	%l1,	0x0D03,	%i3
	edge16n	%o4,	%i7,	%g4
	fabsd	%f6,	%f18
	wr	%g0,	0x81,	%asi
	stxa	%l4,	[%l7 + 0x60] %asi
	xnor	%l0,	0x1664,	%i6
	fbuge,a	%fcc0,	loop_1772
	movn	%xcc,	%o3,	%o2
	movcs	%icc,	%o6,	%o0
	fmovs	%f7,	%f2
loop_1772:
	array8	%g6,	%l6,	%o1
	xor	%o5,	%l3,	%g7
	tvc	%icc,	0x5
	tg	%xcc,	0x5
	edge16	%i1,	%g3,	%i4
	tle	%icc,	0x7
	or	%i0,	0x0309,	%g5
	subcc	%i5,	0x0492,	%l2
	fnegs	%f4,	%f22
	fbne	%fcc3,	loop_1773
	array32	%o7,	%l5,	%i2
	fmovde	%xcc,	%f3,	%f21
	fmovsgu	%xcc,	%f3,	%f23
loop_1773:
	fmovdpos	%xcc,	%f16,	%f11
	brz,a	%g1,	loop_1774
	move	%icc,	%g2,	%i3
	sllx	%o4,	0x1E,	%i7
	fbne,a	%fcc3,	loop_1775
loop_1774:
	fcmpgt32	%f26,	%f4,	%l1
	fands	%f0,	%f27,	%f11
	lduh	[%l7 + 0x14],	%g4
loop_1775:
	xorcc	%l0,	0x1D5B,	%l4
	fcmpne32	%f14,	%f22,	%i6
	fmovdn	%xcc,	%f25,	%f18
	popc	%o2,	%o6
	fand	%f6,	%f26,	%f26
	sdiv	%o0,	0x1DFE,	%g6
	andncc	%l6,	%o1,	%o3
	alignaddr	%o5,	%g7,	%l3
	edge8ln	%g3,	%i4,	%i0
	st	%f2,	[%l7 + 0x0C]
	tgu	%xcc,	0x4
	tleu	%icc,	0x4
	edge8	%i1,	%i5,	%l2
	fmuld8ulx16	%f21,	%f29,	%f18
	nop
	setx	0xF7EC449D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f3
	fpack16	%f20,	%f16
	wr	%g0,	0x88,	%asi
	stha	%o7,	[%l7 + 0x4E] %asi
	alignaddrl	%g5,	%l5,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i2,	%g2,	%i3
	tge	%xcc,	0x0
	bcs,a,pn	%icc,	loop_1776
	sdiv	%i7,	0x0764,	%l1
	bvs,a	loop_1777
	movpos	%xcc,	%g4,	%l0
loop_1776:
	movre	%o4,	0x0B6,	%l4
	fnors	%f28,	%f0,	%f2
loop_1777:
	fmovdn	%icc,	%f24,	%f17
	edge32n	%i6,	%o6,	%o2
	movle	%xcc,	%g6,	%l6
	srax	%o1,	%o0,	%o5
	tgu	%xcc,	0x1
	edge16l	%o3,	%l3,	%g7
	fcmpne16	%f26,	%f4,	%i4
	alignaddrl	%g3,	%i1,	%i5
	fmovrdlz	%l2,	%f18,	%f28
	array8	%o7,	%i0,	%g5
	nop
	setx	0x69D2535A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x926ADAF1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f12,	%f5
	udiv	%l5,	0x0822,	%g1
	stbar
	xorcc	%i2,	%i3,	%i7
	movl	%xcc,	%l1,	%g4
	std	%f2,	[%l7 + 0x28]
	movcs	%xcc,	%l0,	%o4
	or	%g2,	%l4,	%o6
	sethi	0x0ACF,	%o2
	nop
	setx	0xBF363B76,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x7D104D12,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f7,	%f18
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f16
	fxtos	%f16,	%f8
	brlz,a	%g6,	loop_1778
	membar	0x1A
	array32	%l6,	%o1,	%i6
	te	%icc,	0x0
loop_1778:
	xnorcc	%o5,	0x1396,	%o0
	edge16l	%l3,	%g7,	%o3
	smulcc	%g3,	0x1529,	%i1
	be,a,pt	%icc,	loop_1779
	fnands	%f3,	%f11,	%f29
	fmovsleu	%xcc,	%f11,	%f27
	tvc	%icc,	0x6
loop_1779:
	swap	[%l7 + 0x7C],	%i5
	movrgz	%l2,	0x372,	%i4
	fmovsge	%icc,	%f2,	%f6
	ldd	[%l7 + 0x60],	%f28
	brnz	%o7,	loop_1780
	sdivx	%g5,	0x11B9,	%l5
	andn	%i0,	0x086F,	%g1
	sethi	0x1238,	%i2
loop_1780:
	fpmerge	%f13,	%f9,	%f24
	fcmpgt32	%f4,	%f2,	%i3
	tge	%xcc,	0x3
	sth	%l1,	[%l7 + 0x64]
	addc	%i7,	0x0A0E,	%l0
	nop
	fitos	%f0,	%f28
	fstoi	%f28,	%f20
	udiv	%g4,	0x13A0,	%o4
	tge	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x50] %asi,	%g2
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	0x1C,	%g6
	prefetch	[%l7 + 0x50],	 0x0
	flush	%l7 + 0x4C
	fmovdleu	%icc,	%f2,	%f24
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	movleu	%icc,	%o1,	%i6
	movpos	%icc,	%o5,	%o0
	movrlez	%l3,	%o2,	%o3
	tpos	%xcc,	0x4
	tpos	%xcc,	0x3
	subcc	%g7,	%i1,	%g3
	fcmple32	%f30,	%f0,	%l2
	tn	%xcc,	0x1
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i4
	edge8ln	%i5,	%o7,	%l5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%i0
	umulcc	%g1,	%g5,	%i3
	sll	%i2,	%l1,	%l0
	orn	%g4,	0x1D61,	%i7
	movl	%icc,	%g2,	%o4
	set	0x26, %i4
	lduha	[%l7 + %i4] 0x88,	%l4
	faligndata	%f16,	%f6,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x6
	lduh	[%l7 + 0x6C],	%o6
	ldx	[%l7 + 0x70],	%g6
	fmul8x16au	%f7,	%f14,	%f8
	tcc	%icc,	0x1
	set	0x5F, %o2
	lduba	[%l7 + %o2] 0x0c,	%l6
	movcc	%xcc,	%i6,	%o1
	orncc	%o0,	%o5,	%l3
	fmovsge	%icc,	%f21,	%f2
	fnegd	%f16,	%f20
	andncc	%o2,	%o3,	%i1
	tvs	%icc,	0x6
	fsrc1	%f2,	%f20
	umulcc	%g7,	0x1B59,	%g3
	sir	0x1200
	udivx	%i4,	0x1990,	%i5
	prefetch	[%l7 + 0x64],	 0x1
	sethi	0x0B40,	%o7
	movre	%l2,	%l5,	%g1
	set	0x28, %l0
	ldsba	[%l7 + %l0] 0x19,	%g5
	bge,a	loop_1781
	edge32l	%i3,	%i0,	%l1
	movvs	%icc,	%l0,	%i2
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f12
loop_1781:
	sth	%i7,	[%l7 + 0x40]
	tcs	%xcc,	0x1
	nop
	setx	0x6AA1742AA5414881,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xE21D5E16BF7950F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f20,	%f28
	movpos	%icc,	%g2,	%g4
	nop
	setx	0xC062254E,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	taddcctv	%l4,	%o4,	%g6
	movrlz	%l6,	%o6,	%i6
	ble,a	%xcc,	loop_1782
	fmul8ulx16	%f8,	%f12,	%f6
	umulcc	%o0,	0x1024,	%o1
	nop
	setx loop_1783, %l0, %l1
	jmpl %l1, %o5
loop_1782:
	fmovdn	%icc,	%f29,	%f23
	edge16n	%l3,	%o3,	%o2
	set	0x1E, %g4
	ldsha	[%l7 + %g4] 0x15,	%i1
loop_1783:
	fones	%f12
	membar	0x4C
	udivcc	%g3,	0x05EE,	%i4
	movcs	%xcc,	%g7,	%i5
	popc	0x0A97,	%l2
	taddcc	%l5,	0x1EE9,	%g1
	taddcc	%g5,	0x01AA,	%i3
	fxor	%f8,	%f24,	%f22
	fmovsge	%xcc,	%f14,	%f4
	tne	%icc,	0x0
	fbn	%fcc0,	loop_1784
	udivcc	%i0,	0x15F5,	%l1
	movcc	%xcc,	%l0,	%i2
	nop
	setx	0xFDFB3F7D90745828,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_1784:
	umulcc	%i7,	%o7,	%g2
	mulscc	%l4,	0x05A4,	%g4
	movrgez	%g6,	0x25E,	%l6
	and	%o4,	0x1B62,	%o6
	brgz	%o0,	loop_1785
	fbge	%fcc0,	loop_1786
	fnot2s	%f12,	%f3
	fbuge,a	%fcc3,	loop_1787
loop_1785:
	movrgez	%i6,	%o5,	%o1
loop_1786:
	tcs	%icc,	0x2
	subc	%l3,	0x0B54,	%o3
loop_1787:
	smul	%o2,	%g3,	%i4
	movle	%xcc,	%i1,	%i5
	fmul8x16al	%f5,	%f16,	%f8
	tpos	%icc,	0x1
	tvc	%icc,	0x7
	lduh	[%l7 + 0x08],	%g7
	fbg,a	%fcc1,	loop_1788
	tvs	%xcc,	0x3
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%l2
loop_1788:
	nop
	wr	%g0,	0x23,	%asi
	stxa	%g1,	[%l7 + 0x28] %asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	stxa	%l5,	[%l7 + 0x10] %asi
	sra	%g5,	0x0E,	%i3
	xorcc	%i0,	0x143D,	%l1
	movpos	%xcc,	%i2,	%l0
	edge16l	%o7,	%g2,	%l4
	srax	%g4,	%i7,	%l6
	nop
	setx loop_1789, %l0, %l1
	jmpl %l1, %g6
	fmovrde	%o6,	%f22,	%f10
	set	0x64, %o7
	stwa	%o4,	[%l7 + %o7] 0x88
loop_1789:
	ble,pn	%icc,	loop_1790
	sdivcc	%o0,	0x1FF4,	%o5
	and	%o1,	%l3,	%o3
	sdivcc	%o2,	0x0051,	%i6
loop_1790:
	movg	%icc,	%i4,	%g3
	mulx	%i1,	%i5,	%g7
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f18
	ldx	[%l7 + 0x30],	%g1
	array8	%l5,	%l2,	%i3
	addccc	%i0,	%g5,	%i2
	movneg	%xcc,	%l1,	%l0
	movvc	%xcc,	%g2,	%o7
	set	0x36, %g6
	lduha	[%l7 + %g6] 0x89,	%g4
	subccc	%l4,	%l6,	%g6
	tsubcctv	%i7,	%o6,	%o4
	edge16	%o5,	%o0,	%o1
	fornot1	%f6,	%f22,	%f18
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o3,	%o2
	sll	%i6,	%i4,	%l3
	edge8	%i1,	%g3,	%g7
	nop
	setx	0x5FE3AA66C062A306,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	sub	%i5,	%g1,	%l5
	movne	%xcc,	%l2,	%i0
	tgu	%xcc,	0x4
	stb	%i3,	[%l7 + 0x3F]
	fcmpgt32	%f10,	%f12,	%i2
	movrlez	%l1,	0x05E,	%g5
	movrlez	%l0,	%o7,	%g2
	ldd	[%l7 + 0x10],	%f18
	fmovdvc	%xcc,	%f28,	%f10
	array16	%l4,	%g4,	%l6
	tsubcc	%i7,	0x18FF,	%o6
	stbar
	tgu	%xcc,	0x1
	be	%xcc,	loop_1791
	xnorcc	%o4,	%o5,	%o0
	taddcctv	%g6,	0x1470,	%o1
	movpos	%xcc,	%o3,	%i6
loop_1791:
	fmovdn	%xcc,	%f23,	%f29
	stbar
	tl	%icc,	0x0
	ldsw	[%l7 + 0x08],	%i4
	fmovrslz	%l3,	%f29,	%f3
	tgu	%icc,	0x0
	fbug,a	%fcc1,	loop_1792
	fbl	%fcc1,	loop_1793
	and	%o2,	0x0D7E,	%i1
	movneg	%icc,	%g3,	%i5
loop_1792:
	nop
	set	0x78, %i7
	stxa	%g7,	[%l7 + %i7] 0x89
loop_1793:
	st	%f16,	[%l7 + 0x5C]
	edge8n	%l5,	%l2,	%g1
	tgu	%xcc,	0x5
	ldsh	[%l7 + 0x48],	%i0
	fmovdg	%xcc,	%f17,	%f26
	sir	0x06BB
	tle	%xcc,	0x7
	fpack16	%f22,	%f24
	edge8	%i3,	%i2,	%g5
	tsubcc	%l1,	%l0,	%o7
	stbar
	edge8n	%l4,	%g2,	%g4
	edge16n	%l6,	%o6,	%o4
	and	%o5,	0x0590,	%i7
	srl	%o0,	%o1,	%o3
	tvs	%icc,	0x4
	ldstub	[%l7 + 0x34],	%g6
	orcc	%i4,	0x1A28,	%l3
	tsubcctv	%i6,	0x1AEC,	%o2
	fbg	%fcc1,	loop_1794
	mova	%icc,	%g3,	%i1
	tle	%xcc,	0x1
	subcc	%i5,	0x0012,	%l5
loop_1794:
	movge	%icc,	%g7,	%l2
	taddcc	%i0,	%i3,	%g1
	taddcctv	%g5,	%i2,	%l0
	and	%l1,	%l4,	%o7
	and	%g2,	0x146B,	%l6
	fmovsa	%icc,	%f26,	%f16
	smulcc	%o6,	%o4,	%o5
	srax	%i7,	%g4,	%o1
	edge16n	%o0,	%g6,	%o3
	fbn	%fcc3,	loop_1795
	subcc	%i4,	%i6,	%o2
	tpos	%icc,	0x3
	bcs,a,pn	%xcc,	loop_1796
loop_1795:
	movvc	%xcc,	%g3,	%i1
	movpos	%xcc,	%l3,	%l5
	for	%f10,	%f6,	%f26
loop_1796:
	sdivcc	%g7,	0x0FD8,	%i5
	mulx	%l2,	0x041D,	%i0
	srax	%i3,	%g1,	%g5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i2
	lduw	[%l7 + 0x2C],	%l0
	or	%l1,	0x0509,	%o7
	movne	%icc,	%l4,	%g2
	fxnor	%f18,	%f12,	%f12
	bl	loop_1797
	edge16l	%l6,	%o4,	%o5
	tgu	%xcc,	0x5
	set	0x74, %i1
	swapa	[%l7 + %i1] 0x80,	%i7
loop_1797:
	movcc	%xcc,	%o6,	%o1
	tleu	%xcc,	0x5
	wr	%g0,	0x2a,	%asi
	stwa	%g4,	[%l7 + 0x30] %asi
	membar	#Sync
	move	%xcc,	%g6,	%o0
	movle	%icc,	%i4,	%o3
	tleu	%xcc,	0x3
	set	0x3E, %o3
	ldstuba	[%l7 + %o3] 0x81,	%o2
	fmovsvc	%xcc,	%f18,	%f3
	fexpand	%f2,	%f14
	tneg	%xcc,	0x5
	fmovrdlz	%i6,	%f20,	%f6
	taddcc	%i1,	0x144A,	%l3
	movneg	%icc,	%g3,	%l5
	fone	%f12
	udivcc	%i5,	0x06C9,	%l2
	fabsd	%f0,	%f6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x18,	%i0,	%i3
	udivcc	%g1,	0x17D3,	%g7
	ld	[%l7 + 0x68],	%f27
	ldub	[%l7 + 0x53],	%g5
	array16	%i2,	%l0,	%l1
	bcc,pn	%xcc,	loop_1798
	fpsub32s	%f13,	%f23,	%f1
	fble,a	%fcc0,	loop_1799
	nop
	fitos	%f10,	%f4
	fstox	%f4,	%f2
loop_1798:
	sethi	0x12BC,	%o7
	umul	%l4,	%l6,	%o4
loop_1799:
	nop
	fitos	%f5,	%f6
	fstox	%f6,	%f2
	fmuld8sux16	%f24,	%f6,	%f20
	fpack16	%f8,	%f9
	nop
	setx	0x207F4112,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	tgu	%icc,	0x4
	ldx	[%l7 + 0x58],	%o5
	ldsb	[%l7 + 0x60],	%i7
	edge32	%o6,	%g2,	%o1
	fmuld8ulx16	%f8,	%f5,	%f4
	set	0x40, %i2
	stba	%g6,	[%l7 + %i2] 0x23
	membar	#Sync
	movre	%o0,	0x14C,	%g4
	alignaddrl	%o3,	%o2,	%i4
	udiv	%i1,	0x18F2,	%l3
	sllx	%i6,	0x1B,	%l5
	movl	%xcc,	%i5,	%g3
	be,pt	%icc,	loop_1800
	and	%i0,	%i3,	%g1
	edge32ln	%g7,	%g5,	%l2
	movrgz	%i2,	%l1,	%l0
loop_1800:
	sub	%o7,	%l4,	%l6
	udivx	%o4,	0x1B63,	%i7
	tn	%icc,	0x5
	andn	%o6,	0x1E1F,	%g2
	for	%f8,	%f16,	%f4
	bn	loop_1801
	tne	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,pt	%icc,	loop_1802
loop_1801:
	movvc	%icc,	%o1,	%o5
	fexpand	%f25,	%f14
	xor	%g6,	%g4,	%o3
loop_1802:
	nop
	set	0x0E, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o0
	brz	%o2,	loop_1803
	movcc	%xcc,	%i4,	%i1
	nop
	setx loop_1804, %l0, %l1
	jmpl %l1, %i6
	edge16	%l5,	%i5,	%l3
loop_1803:
	nop
	set	0x5D, %g5
	stb	%g3,	[%l7 + %g5]
	alignaddr	%i0,	%i3,	%g7
loop_1804:
	brgz	%g1,	loop_1805
	fmovsneg	%icc,	%f10,	%f23
	set	0x40, %l4
	ldswa	[%l7 + %l4] 0x80,	%g5
loop_1805:
	tge	%xcc,	0x0
	array16	%i2,	%l2,	%l0
	fbe	%fcc2,	loop_1806
	orcc	%o7,	0x0876,	%l1
	nop
	setx loop_1807, %l0, %l1
	jmpl %l1, %l6
	bvc,pn	%xcc,	loop_1808
loop_1806:
	sdivcc	%o4,	0x1C92,	%i7
	movrne	%o6,	%g2,	%l4
loop_1807:
	edge16n	%o5,	%g6,	%o1
loop_1808:
	movvs	%xcc,	%g4,	%o3
	srlx	%o2,	%o0,	%i4
	ldub	[%l7 + 0x51],	%i6
	tcs	%icc,	0x0
	fbuge	%fcc1,	loop_1809
	sdivx	%i1,	0x172D,	%l5
	tvc	%icc,	0x3
	tne	%icc,	0x6
loop_1809:
	tne	%icc,	0x5
	andncc	%i5,	%l3,	%i0
	movrlez	%g3,	0x37C,	%i3
	taddcc	%g1,	%g5,	%i2
	taddcc	%g7,	0x0D33,	%l0
	fbug	%fcc0,	loop_1810
	bgu,pn	%xcc,	loop_1811
	edge8	%o7,	%l2,	%l6
	edge8	%l1,	%o4,	%i7
loop_1810:
	fbu,a	%fcc2,	loop_1812
loop_1811:
	fmovrsgez	%o6,	%f13,	%f25
	fbul	%fcc3,	loop_1813
	nop
	fitod	%f8,	%f30
	fdtos	%f30,	%f0
loop_1812:
	movcc	%xcc,	%g2,	%l4
	fmovdle	%xcc,	%f27,	%f18
loop_1813:
	lduh	[%l7 + 0x36],	%o5
	be,a	loop_1814
	fbe,a	%fcc2,	loop_1815
	fnegs	%f25,	%f14
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f30
loop_1814:
	membar	0x7F
loop_1815:
	popc	0x0167,	%g6
	set	0x24, %l3
	stba	%g4,	[%l7 + %l3] 0xe2
	membar	#Sync
	tle	%icc,	0x6
	set	0x26, %g7
	lduba	[%l7 + %g7] 0x10,	%o1
	call	loop_1816
	addcc	%o2,	0x0BE4,	%o0
	brlz,a	%o3,	loop_1817
	udiv	%i6,	0x139C,	%i4
loop_1816:
	movre	%i1,	%l5,	%i5
	tgu	%icc,	0x6
loop_1817:
	movrlz	%l3,	0x0FB,	%g3
	tvs	%xcc,	0x7
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x26,	%i2
	membar	0x57
	andcc	%i0,	0x0BAC,	%g5
	movrlz	%i2,	0x06A,	%g7
	fmul8sux16	%f10,	%f14,	%f8
	fble	%fcc2,	loop_1818
	alignaddrl	%g1,	%o7,	%l0
	array16	%l6,	%l2,	%o4
	set	0x11, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l1
loop_1818:
	fmuld8ulx16	%f21,	%f7,	%f24
	brlez	%i7,	loop_1819
	movvs	%xcc,	%g2,	%o6
	fbug,a	%fcc1,	loop_1820
	edge32n	%l4,	%g6,	%g4
loop_1819:
	fbge	%fcc3,	loop_1821
	tge	%icc,	0x2
loop_1820:
	tsubcc	%o1,	0x097F,	%o2
	fbo,a	%fcc3,	loop_1822
loop_1821:
	fmovrde	%o0,	%f2,	%f24
	stx	%o5,	[%l7 + 0x30]
	nop
	set	0x31, %l1
	ldsb	[%l7 + %l1],	%i6
loop_1822:
	tge	%icc,	0x3
	tsubcc	%o3,	0x0C13,	%i1
	andcc	%i4,	0x0923,	%l5
	fnot1	%f28,	%f2
	tcs	%icc,	0x6
	nop
	fitod	%f2,	%f18
	fdtoi	%f18,	%f9
	orncc	%i5,	%l3,	%i3
	fpack16	%f6,	%f2
	xnor	%i0,	0x186D,	%g3
	and	%i2,	%g7,	%g5
	andncc	%g1,	%l0,	%o7
	nop
	set	0x41, %g3
	stb	%l2,	[%l7 + %g3]
	nop
	setx	0xA6CDFA51607EC129,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	subccc	%l6,	0x1DE1,	%l1
	sll	%o4,	0x1A,	%i7
	set	0x39, %l5
	ldsba	[%l7 + %l5] 0x14,	%g2
	andncc	%l4,	%o6,	%g4
	wr	%g0,	0x89,	%asi
	sta	%f8,	[%l7 + 0x50] %asi
	fornot2	%f8,	%f10,	%f10
	xorcc	%g6,	%o2,	%o1
	udivx	%o5,	0x0B42,	%i6
	xor	%o0,	0x0E85,	%i1
	move	%xcc,	%o3,	%l5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	edge16	%i5,	%i3,	%i0
	fsrc1	%f6,	%f14
	taddcctv	%l3,	0x18F5,	%i2
	pdist	%f10,	%f28,	%f28
	sdiv	%g7,	0x1F09,	%g3
	nop
	setx	0x9DFA89A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x9D1E055C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f5,	%f26
	nop
	setx	0xF548BA527A5E2C90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7CD610F66B0399D9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f30,	%f30
	fmovrslz	%g5,	%f10,	%f7
	move	%xcc,	%l0,	%g1
	edge32	%l2,	%o7,	%l1
	nop
	setx	0x51F0B54F30FC10E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f6
	sllx	%l6,	%o4,	%i7
	movrne	%l4,	0x15A,	%o6
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x7C] %asi
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1D] %asi,	%g2
	movrne	%g6,	0x3D8,	%g4
	movpos	%xcc,	%o1,	%o5
	movpos	%xcc,	%i6,	%o2
	sdiv	%i1,	0x06E5,	%o3
	udivx	%o0,	0x077C,	%l5
	fmovde	%icc,	%f11,	%f18
	edge16ln	%i5,	%i4,	%i3
	edge8	%i0,	%i2,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g3,	0x0CEE,	%g5
	fbg	%fcc1,	loop_1823
	fmovdne	%xcc,	%f22,	%f20
	fnegs	%f5,	%f10
	tl	%xcc,	0x6
loop_1823:
	nop
	setx	0xEA31E60929780D35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xC9AAAA867CC4055E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f24,	%f0
	ldsh	[%l7 + 0x1E],	%l3
	fmovsg	%xcc,	%f16,	%f1
	xnorcc	%g1,	%l2,	%o7
	edge32ln	%l1,	%l0,	%o4
	ldsh	[%l7 + 0x0A],	%l6
	tne	%xcc,	0x3
	fcmple32	%f30,	%f4,	%l4
	tge	%xcc,	0x3
	fbn	%fcc0,	loop_1824
	bge,a,pn	%icc,	loop_1825
	nop
	setx	0x607EF1E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	array32	%i7,	%g2,	%g6
loop_1824:
	array32	%o6,	%g4,	%o5
loop_1825:
	fandnot1	%f10,	%f14,	%f28
	movn	%icc,	%o1,	%o2
	ta	%xcc,	0x3
	mulscc	%i1,	%o3,	%o0
	tle	%icc,	0x6
	lduw	[%l7 + 0x40],	%l5
	movpos	%icc,	%i6,	%i4
	edge16n	%i5,	%i3,	%i2
	tg	%icc,	0x6
	tge	%icc,	0x1
	movn	%icc,	%g7,	%g3
	tle	%xcc,	0x5
	edge32ln	%i0,	%l3,	%g5
	edge16n	%g1,	%o7,	%l1
	tge	%icc,	0x5
	taddcctv	%l2,	%l0,	%l6
	fnands	%f7,	%f26,	%f19
	tvc	%xcc,	0x6
	swap	[%l7 + 0x78],	%o4
	tsubcctv	%l4,	%i7,	%g6
	and	%o6,	%g4,	%g2
	wr	%g0,	0xe3,	%asi
	stwa	%o5,	[%l7 + 0x6C] %asi
	membar	#Sync
	tne	%xcc,	0x0
	bvs	loop_1826
	array32	%o2,	%o1,	%o3
	mova	%icc,	%i1,	%l5
	orcc	%o0,	0x1A96,	%i4
loop_1826:
	udivx	%i6,	0x0979,	%i5
	mulscc	%i2,	%i3,	%g3
	sir	0x06D0
	stx	%g7,	[%l7 + 0x40]
	sub	%l3,	%g5,	%g1
	fornot2	%f22,	%f22,	%f22
	udivcc	%i0,	0x1356,	%o7
	bneg,a	loop_1827
	tle	%icc,	0x2
	tneg	%icc,	0x6
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%l1
loop_1827:
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f12
	fxtod	%f12,	%f30
	fmovrsgez	%l0,	%f0,	%f25
	subcc	%l2,	%l6,	%l4
	fbu,a	%fcc0,	loop_1828
	stx	%i7,	[%l7 + 0x38]
	brlz,a	%o4,	loop_1829
	smul	%g6,	%o6,	%g2
loop_1828:
	fbg,a	%fcc3,	loop_1830
	edge32	%o5,	%g4,	%o2
loop_1829:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%o1,	[%l7 + 0x50] %asi
loop_1830:
	movge	%xcc,	%o3,	%l5
	fbo,a	%fcc1,	loop_1831
	bcs,pt	%icc,	loop_1832
	movre	%o0,	%i4,	%i1
	nop
	setx	loop_1833,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1831:
	orcc	%i6,	%i5,	%i2
loop_1832:
	bl	%icc,	loop_1834
	fandnot1s	%f21,	%f24,	%f15
loop_1833:
	bgu,a,pt	%icc,	loop_1835
	sllx	%i3,	%g7,	%l3
loop_1834:
	addcc	%g3,	0x0029,	%g5
	tle	%xcc,	0x7
loop_1835:
	movgu	%icc,	%g1,	%i0
	xor	%l1,	%l0,	%l2
	tcs	%xcc,	0x3
	brz,a	%l6,	loop_1836
	tg	%icc,	0x7
	movle	%xcc,	%o7,	%l4
	fmovdle	%icc,	%f25,	%f24
loop_1836:
	fmovdpos	%icc,	%f14,	%f11
	movgu	%icc,	%i7,	%o4
	fblg,a	%fcc3,	loop_1837
	sub	%g6,	%o6,	%o5
	sra	%g2,	%g4,	%o1
	move	%icc,	%o2,	%o3
loop_1837:
	alignaddrl	%o0,	%i4,	%i1
	brnz	%i6,	loop_1838
	bne,pn	%xcc,	loop_1839
	sub	%l5,	0x027A,	%i2
	sth	%i5,	[%l7 + 0x54]
loop_1838:
	fpackfix	%f18,	%f29
loop_1839:
	fbn	%fcc1,	loop_1840
	stw	%g7,	[%l7 + 0x20]
	ta	%icc,	0x0
	nop
	set	0x0A, %g2
	ldsb	[%l7 + %g2],	%i3
loop_1840:
	fand	%f8,	%f20,	%f2
	mulscc	%l3,	%g3,	%g1
	set	0x3C, %l2
	ldsha	[%l7 + %l2] 0x80,	%g5
	mulx	%i0,	0x072B,	%l0
	bn,pt	%xcc,	loop_1841
	fmovdn	%xcc,	%f13,	%f15
	alignaddrl	%l1,	%l2,	%l6
	array32	%l4,	%i7,	%o4
loop_1841:
	fbul	%fcc2,	loop_1842
	and	%g6,	%o6,	%o5
	xnor	%g2,	0x12E9,	%o7
	xnor	%o1,	0x00AF,	%g4
loop_1842:
	nop
	set	0x30, %o0
	stxa	%o3,	[%g0 + %o0] 0x20
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	or	%o0,	%o2,	%i1
	alignaddrl	%i4,	%i6,	%i2
	edge8	%l5,	%i5,	%g7
	srl	%l3,	%i3,	%g1
	alignaddrl	%g3,	%i0,	%g5
	ldsb	[%l7 + 0x16],	%l1
	srl	%l0,	0x18,	%l6
	alignaddr	%l2,	%i7,	%o4
	ld	[%l7 + 0x38],	%f21
	sllx	%g6,	%l4,	%o5
	sdivx	%o6,	0x07C9,	%o7
	tneg	%xcc,	0x2
	nop
	fitod	%f8,	%f22
	fdtos	%f22,	%f25
	movre	%g2,	%g4,	%o1
	movrne	%o3,	%o2,	%i1
	sdivx	%i4,	0x130C,	%o0
	bvc,pn	%icc,	loop_1843
	tsubcc	%i6,	%l5,	%i2
	edge8l	%g7,	%i5,	%i3
	ldsh	[%l7 + 0x2C],	%g1
loop_1843:
	ldd	[%l7 + 0x40],	%g2
	movge	%icc,	%i0,	%l3
	tleu	%xcc,	0x4
	bpos,a	loop_1844
	andcc	%l1,	%l0,	%g5
	fbo	%fcc0,	loop_1845
	lduw	[%l7 + 0x20],	%l6
loop_1844:
	addccc	%l2,	%o4,	%i7
	edge8l	%g6,	%l4,	%o6
loop_1845:
	tgu	%xcc,	0x5
	membar	0x1D
	nop
	setx	0xC05772E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	set	0x24, %o4
	lduwa	[%l7 + %o4] 0x89,	%o5
	wr	%g0,	0x2f,	%asi
	stwa	%o7,	[%l7 + 0x4C] %asi
	membar	#Sync
	fabsd	%f12,	%f30
	smul	%g2,	0x0F86,	%o1
	ta	%xcc,	0x1
	mulx	%g4,	%o3,	%o2
	move	%xcc,	%i4,	%o0
	popc	0x1622,	%i6
	fble	%fcc1,	loop_1846
	alignaddrl	%l5,	%i2,	%g7
	taddcc	%i5,	0x164C,	%i3
	fbul,a	%fcc1,	loop_1847
loop_1846:
	st	%f30,	[%l7 + 0x4C]
	edge32l	%i1,	%g3,	%i0
	ta	%icc,	0x4
loop_1847:
	tg	%xcc,	0x1
	edge16n	%l3,	%g1,	%l1
	nop
	fitos	%f13,	%f27
	fstox	%f27,	%f20
	fxtos	%f20,	%f25
	set	0x5D, %i5
	ldstuba	[%l7 + %i5] 0x0c,	%l0
	sdivcc	%g5,	0x0F42,	%l6
	edge32l	%l2,	%i7,	%g6
	tpos	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,pt	%icc,	loop_1848
	fmovrdgz	%l4,	%f2,	%f2
	array8	%o6,	%o5,	%o7
	fcmpeq16	%f0,	%f8,	%o4
loop_1848:
	brnz,a	%o1,	loop_1849
	movge	%icc,	%g2,	%o3
	movcc	%icc,	%g4,	%o2
	wr	%g0,	0x89,	%asi
	sta	%f12,	[%l7 + 0x64] %asi
loop_1849:
	orn	%o0,	0x085E,	%i6
	fbug,a	%fcc3,	loop_1850
	fxors	%f23,	%f24,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f16
loop_1850:
	tleu	%xcc,	0x4
	fnegd	%f14,	%f6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fornot1s	%f22,	%f25,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x6
	umul	%i2,	%g7,	%l5
	tl	%xcc,	0x5
	sll	%i3,	0x0F,	%i5
	fmovsle	%icc,	%f25,	%f19
	te	%icc,	0x6
	fbn,a	%fcc3,	loop_1851
	subc	%g3,	%i0,	%l3
	andcc	%i1,	%l1,	%g1
	flush	%l7 + 0x2C
loop_1851:
	fpsub32	%f30,	%f10,	%f14
	tgu	%xcc,	0x0
	andncc	%g5,	%l0,	%l6
	movcs	%icc,	%i7,	%l2
	bvs,pn	%icc,	loop_1852
	fmovsvc	%icc,	%f29,	%f29
	and	%g6,	0x1B24,	%o6
	nop
	setx	0x6DD8A6149D43ED69,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f26
loop_1852:
	smul	%o5,	%l4,	%o4
	udivcc	%o7,	0x1C00,	%g2
	movcc	%icc,	%o3,	%o1
	addcc	%o2,	0x13D1,	%o0
	xor	%g4,	%i4,	%i2
	fbn,a	%fcc0,	loop_1853
	taddcctv	%i6,	%g7,	%i3
	bneg	%icc,	loop_1854
	xnor	%l5,	0x025D,	%g3
loop_1853:
	bvs,a,pn	%icc,	loop_1855
	fbg	%fcc1,	loop_1856
loop_1854:
	sth	%i0,	[%l7 + 0x0A]
	tge	%icc,	0x4
loop_1855:
	nop
	setx	0x5FA18DBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x70C561EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f10,	%f30
loop_1856:
	fmul8x16au	%f1,	%f21,	%f26
	mova	%icc,	%i5,	%i1
	and	%l1,	0x1238,	%l3
	sir	0x1642
	tle	%xcc,	0x1
	bleu,pn	%xcc,	loop_1857
	call	loop_1858
	fmovrsne	%g5,	%f6,	%f11
	udivx	%g1,	0x1638,	%l6
loop_1857:
	xnor	%l0,	%i7,	%l2
loop_1858:
	bleu,pn	%xcc,	loop_1859
	umul	%g6,	%o5,	%o6
	fbule	%fcc0,	loop_1860
	fmovsge	%icc,	%f2,	%f5
loop_1859:
	edge8	%l4,	%o7,	%o4
	nop
	fitos	%f3,	%f0
loop_1860:
	nop
	setx loop_1861, %l0, %l1
	jmpl %l1, %o3
	fble	%fcc1,	loop_1862
	movpos	%xcc,	%g2,	%o2
	tne	%xcc,	0x0
loop_1861:
	fbue	%fcc1,	loop_1863
loop_1862:
	fmovsl	%xcc,	%f23,	%f9
	set	0x0C, %o1
	stha	%o0,	[%l7 + %o1] 0x80
loop_1863:
	fmul8x16au	%f12,	%f24,	%f24
	mova	%xcc,	%g4,	%o1
	tcs	%xcc,	0x4
	addcc	%i2,	%i4,	%g7
	brlez	%i3,	loop_1864
	subcc	%i6,	%l5,	%g3
	fmovdge	%xcc,	%f25,	%f15
	ba,pn	%xcc,	loop_1865
loop_1864:
	move	%icc,	%i0,	%i5
	te	%xcc,	0x3
	subccc	%i1,	%l1,	%g5
loop_1865:
	movrne	%g1,	%l3,	%l6
	edge16ln	%l0,	%i7,	%l2
	movcc	%icc,	%o5,	%o6
	add	%l4,	%o7,	%g6
	sllx	%o3,	0x09,	%o4
	stx	%o2,	[%l7 + 0x40]
	addccc	%g2,	%g4,	%o1
	fmovsgu	%xcc,	%f19,	%f3
	move	%xcc,	%i2,	%o0
	and	%i4,	0x0E78,	%i3
	tcc	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g7,	%f20,	%f16
	tvs	%xcc,	0x3
	fcmpgt16	%f22,	%f2,	%l5
	fcmpgt32	%f14,	%f12,	%i6
	tcs	%icc,	0x0
	fbe,a	%fcc1,	loop_1866
	umul	%g3,	0x116F,	%i5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4E] %asi,	%i1
loop_1866:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i0,	%g5
	tne	%icc,	0x4
	fpadd32s	%f24,	%f7,	%f31
	addccc	%l1,	0x0381,	%g1
	alignaddr	%l6,	%l0,	%l3
	bpos,pn	%xcc,	loop_1867
	edge8l	%l2,	%o5,	%i7
	movvs	%xcc,	%o6,	%o7
	mulscc	%g6,	%o3,	%o4
loop_1867:
	edge8n	%o2,	%l4,	%g2
	ldsh	[%l7 + 0x6E],	%o1
	tle	%icc,	0x6
	bleu,a	%icc,	loop_1868
	add	%g4,	0x0EDE,	%o0
	subc	%i4,	0x157F,	%i2
	nop
	setx	loop_1869,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1868:
	sdivcc	%g7,	0x05C8,	%i3
	edge16ln	%i6,	%g3,	%i5
	ldsh	[%l7 + 0x4C],	%i1
loop_1869:
	fmovrslez	%l5,	%f3,	%f22
	movcc	%icc,	%i0,	%g5
	umul	%l1,	0x0621,	%l6
	fmovdne	%icc,	%f13,	%f29
	fbl,a	%fcc0,	loop_1870
	edge16l	%g1,	%l3,	%l2
	fnot1s	%f1,	%f11
	set	0x18, %o5
	swapa	[%l7 + %o5] 0x81,	%o5
loop_1870:
	sdiv	%l0,	0x0611,	%o6
	sir	0x10FF
	call	loop_1871
	tg	%xcc,	0x4
	alignaddrl	%i7,	%o7,	%o3
	bg,a	%xcc,	loop_1872
loop_1871:
	movvs	%xcc,	%o4,	%o2
	fornot1	%f2,	%f22,	%f26
	nop
	fitos	%f6,	%f28
loop_1872:
	fmovrdne	%g6,	%f28,	%f2
	set	0x20, %i6
	lduwa	[%l7 + %i6] 0x10,	%l4
	addc	%g2,	0x0299,	%o1
	fmovsle	%xcc,	%f21,	%f13
	movle	%icc,	%o0,	%g4
	faligndata	%f24,	%f8,	%f6
	set	0x16, %o2
	stha	%i4,	[%l7 + %o2] 0x2a
	membar	#Sync
	edge32n	%i2,	%i3,	%i6
	std	%f30,	[%l7 + 0x40]
	movrne	%g7,	0x164,	%g3
	fone	%f26
	call	loop_1873
	srl	%i5,	0x13,	%i1
	fornot1	%f4,	%f30,	%f16
	nop
	setx	loop_1874,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1873:
	subcc	%i0,	0x1CA5,	%l5
	nop
	setx	0x14046791,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xAB218D7B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f0,	%f21
	fmovdge	%icc,	%f24,	%f24
loop_1874:
	nop
	fitos	%f11,	%f21
	fstox	%f21,	%f22
	fxtos	%f22,	%f11
	prefetch	[%l7 + 0x10],	 0x0
	array16	%g5,	%l1,	%l6
	smulcc	%l3,	%l2,	%o5
	nop
	setx	0x9BFD8199A3CFF996,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1B591F839531F872,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f20,	%f2
	membar	0x19
	bg,a,pn	%icc,	loop_1875
	fblg	%fcc2,	loop_1876
	nop
	setx	0x0B938EC746642AD8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x45F5EAABD62AB59E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f30,	%f16
	smulcc	%l0,	%o6,	%g1
loop_1875:
	edge16n	%o7,	%o3,	%i7
loop_1876:
	sir	0x0C70
	xnorcc	%o2,	0x1B54,	%g6
	andncc	%l4,	%g2,	%o1
	edge16	%o0,	%o4,	%i4
	edge16ln	%g4,	%i2,	%i6
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f10
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0x2
	fmovsleu	%icc,	%f9,	%f28
	fmovrde	%g7,	%f6,	%f26
	stx	%g3,	[%l7 + 0x48]
	fnot2	%f16,	%f28
	movge	%icc,	%i5,	%i0
	movrgz	%l5,	0x2D7,	%g5
	nop
	setx	loop_1877,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpsub32s	%f15,	%f20,	%f21
	movgu	%xcc,	%i1,	%l6
	subc	%l3,	0x1EF2,	%l2
loop_1877:
	add	%o5,	%l1,	%l0
	brgez,a	%o6,	loop_1878
	bne,a,pn	%icc,	loop_1879
	edge32	%o7,	%g1,	%i7
	fnot2s	%f7,	%f29
loop_1878:
	array8	%o3,	%g6,	%o2
loop_1879:
	fmul8x16au	%f13,	%f31,	%f30
	sdivcc	%l4,	0x1501,	%g2
	movcc	%icc,	%o0,	%o4
	nop
	setx	0x31264008507B9D6D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fbn,a	%fcc3,	loop_1880
	addcc	%i4,	0x0C4D,	%o1
	or	%g4,	%i2,	%i3
	addccc	%g7,	0x113E,	%g3
loop_1880:
	movl	%xcc,	%i5,	%i0
	edge8l	%i6,	%g5,	%l5
	alignaddr	%l6,	%i1,	%l2
	ble	loop_1881
	call	loop_1882
	or	%l3,	0x06C6,	%l1
	movcc	%xcc,	%l0,	%o6
loop_1881:
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%o4
loop_1882:
	xor	%o7,	%g1,	%o3
	set	0x28, %g4
	lda	[%l7 + %g4] 0x04,	%f26
	nop
	fitos	%f3,	%f11
	fstoi	%f11,	%f28
	movn	%icc,	%g6,	%o2
	nop
	fitos	%f11,	%f3
	fstox	%f3,	%f4
	fxtos	%f4,	%f5
	fpsub16s	%f14,	%f15,	%f26
	movcs	%icc,	%i7,	%l4
	sub	%o0,	0x164E,	%o4
	tpos	%xcc,	0x5
	add	%i4,	%o1,	%g2
	move	%icc,	%i2,	%i3
	fmovscs	%xcc,	%f14,	%f20
	fmuld8sux16	%f4,	%f9,	%f2
	move	%icc,	%g7,	%g3
	fbl,a	%fcc1,	loop_1883
	sra	%g4,	%i5,	%i0
	te	%icc,	0x6
	fnands	%f12,	%f14,	%f23
loop_1883:
	nop
	setx loop_1884, %l0, %l1
	jmpl %l1, %i6
	movvc	%icc,	%l5,	%l6
	edge32l	%i1,	%g5,	%l3
	xorcc	%l2,	0x02C6,	%l0
loop_1884:
	membar	0x4E
	movvs	%xcc,	%o6,	%l1
	tle	%icc,	0x6
	edge8n	%o5,	%o7,	%g1
	fpadd16s	%f0,	%f5,	%f29
	nop
	setx	loop_1885,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivx	%g6,	0x1732,	%o3
	addccc	%i7,	%o2,	%l4
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
loop_1885:
	fbuge	%fcc0,	loop_1886
	bg,a,pt	%xcc,	loop_1887
	fnot2s	%f11,	%f7
	movl	%icc,	%o0,	%o4
loop_1886:
	membar	0x4A
loop_1887:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x58] %asi,	%f19
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i4
	xnor	%i2,	%g2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g7,	%g3,	%i5
	bl,a	%icc,	loop_1888
	popc	0x0937,	%g4
	edge16ln	%i6,	%i0,	%l6
	fmovdgu	%xcc,	%f22,	%f5
loop_1888:
	tg	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i1
	move	%xcc,	%g5,	%l3
	fmovrse	%l5,	%f20,	%f14
	fmovsg	%icc,	%f30,	%f9
	tsubcctv	%l0,	%l2,	%o6
	fmovdge	%icc,	%f21,	%f5
	edge8	%o5,	%l1,	%g1
	srax	%o7,	0x0E,	%g6
	for	%f2,	%f14,	%f26
	nop
	setx loop_1889, %l0, %l1
	jmpl %l1, %o3
	and	%i7,	0x161F,	%l4
	fnot2	%f8,	%f12
	smul	%o0,	0x1C3F,	%o2
loop_1889:
	subcc	%o4,	%i4,	%o1
	sdiv	%g2,	0x12B5,	%i3
	array16	%g7,	%g3,	%i2
	alignaddr	%i5,	%i6,	%i0
	andncc	%g4,	%i1,	%g5
	movvs	%icc,	%l3,	%l6
	movle	%xcc,	%l0,	%l5
	orn	%l2,	0x1515,	%o5
	xorcc	%o6,	%l1,	%g1
	tgu	%xcc,	0x5
	sra	%o7,	0x0E,	%o3
	or	%i7,	%l4,	%o0
	sethi	0x0A34,	%o2
	fbul	%fcc1,	loop_1890
	sethi	0x1935,	%o4
	movge	%xcc,	%i4,	%o1
	sub	%g2,	%g6,	%i3
loop_1890:
	fba,a	%fcc2,	loop_1891
	movcc	%xcc,	%g7,	%g3
	nop
	setx	loop_1892,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x38],	%i4
loop_1891:
	nop
	setx	0x906D9369,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	call	loop_1893
loop_1892:
	addcc	%i2,	0x15DF,	%i6
	smul	%g4,	%i0,	%i1
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x04,	%g4
loop_1893:
	fbo,a	%fcc0,	loop_1894
	nop
	setx	0x534140CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x5B72F96F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f31,	%f10
	tvs	%xcc,	0x0
	fmuld8sux16	%f25,	%f21,	%f28
loop_1894:
	and	%l3,	%l6,	%l5
	andn	%l0,	%l2,	%o5
	add	%o6,	0x01A5,	%l1
	tsubcctv	%o7,	%o3,	%i7
	nop
	setx	0x7052BF49,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	andn	%g1,	%o0,	%l4
	fmovd	%f8,	%f20
	sllx	%o2,	%i4,	%o1
	tgu	%icc,	0x1
	edge32	%g2,	%g6,	%i3
	srl	%o4,	0x0A,	%g7
	bneg,pt	%icc,	loop_1895
	nop
	fitos	%f14,	%f25
	fstox	%f25,	%f10
	fxtos	%f10,	%f26
	fbl	%fcc0,	loop_1896
	array8	%g3,	%i5,	%i2
loop_1895:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x7B] %asi,	%i6
loop_1896:
	ld	[%l7 + 0x08],	%f11
	fbug	%fcc0,	loop_1897
	fornot1s	%f1,	%f8,	%f24
	set	0x28, %o7
	stxa	%g4,	[%g0 + %o7] 0x4f
loop_1897:
	orcc	%i0,	0x08D0,	%g5
	alignaddrl	%i1,	%l6,	%l3
	fpsub32s	%f5,	%f25,	%f29
	ldstub	[%l7 + 0x4E],	%l0
	fmovsa	%icc,	%f2,	%f11
	tleu	%xcc,	0x2
	alignaddrl	%l5,	%l2,	%o5
	movl	%icc,	%o6,	%o7
	udiv	%o3,	0x17E8,	%i7
	taddcctv	%l1,	0x17A3,	%g1
	stbar
	bgu,a	%xcc,	loop_1898
	fpadd16	%f6,	%f14,	%f20
	fpsub16	%f8,	%f12,	%f26
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x80,	%o0
loop_1898:
	subccc	%o2,	0x113B,	%i4
	edge32ln	%o1,	%g2,	%l4
	sll	%i3,	0x06,	%g6
	set	0x7A, %i2
	stha	%o4,	[%l7 + %i2] 0x2a
	membar	#Sync
	movl	%icc,	%g7,	%i5
	fbl,a	%fcc1,	loop_1899
	sethi	0x0DC7,	%g3
	nop
	setx	0x0996AFC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x019D43EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f12,	%f18
	movn	%xcc,	%i2,	%g4
loop_1899:
	fcmpgt16	%f12,	%f4,	%i0
	edge8	%i6,	%g5,	%i1
	sir	0x0980
	nop
	fitos	%f5,	%f9
	fstox	%f9,	%f24
	fxtos	%f24,	%f24
	ldsb	[%l7 + 0x3B],	%l6
	fmovdn	%icc,	%f29,	%f16
	fcmpeq16	%f18,	%f2,	%l0
	srax	%l5,	%l2,	%l3
	edge32ln	%o6,	%o5,	%o7
	set	0x34, %o3
	ldsha	[%l7 + %o3] 0x81,	%o3
	fbue	%fcc0,	loop_1900
	fbue,a	%fcc0,	loop_1901
	edge16	%i7,	%g1,	%o0
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f12
loop_1900:
	xnorcc	%o2,	0x1287,	%l1
loop_1901:
	prefetch	[%l7 + 0x24],	 0x0
	sll	%i4,	%o1,	%g2
	fmovsne	%xcc,	%f31,	%f4
	sdivcc	%i3,	0x00D5,	%g6
	add	%l4,	%o4,	%i5
	edge32ln	%g3,	%g7,	%g4
	tleu	%xcc,	0x0
	fmovdcc	%xcc,	%f12,	%f17
	fba	%fcc2,	loop_1902
	sdivx	%i0,	0x13F9,	%i2
	addccc	%g5,	0x1231,	%i6
	fbl	%fcc3,	loop_1903
loop_1902:
	xorcc	%i1,	%l6,	%l0
	alignaddr	%l5,	%l3,	%l2
	array16	%o5,	%o6,	%o7
loop_1903:
	movvc	%xcc,	%i7,	%g1
	addccc	%o3,	%o0,	%o2
	ld	[%l7 + 0x64],	%f21
	fbne,a	%fcc2,	loop_1904
	te	%icc,	0x2
	smul	%l1,	%o1,	%g2
	membar	0x0F
loop_1904:
	fmovsvc	%icc,	%f13,	%f8
	fpsub16	%f30,	%f26,	%f24
	fmovsneg	%icc,	%f22,	%f24
	tcs	%icc,	0x1
	fbu,a	%fcc0,	loop_1905
	subcc	%i3,	%g6,	%i4
	edge16n	%l4,	%i5,	%g3
	fzeros	%f11
loop_1905:
	taddcc	%g7,	%o4,	%g4
	edge8n	%i2,	%g5,	%i0
	sir	0x1B14
	fnands	%f1,	%f10,	%f9
	ta	%xcc,	0x4
	set	0x4B, %g5
	lduba	[%l7 + %g5] 0x89,	%i6
	brgez,a	%l6,	loop_1906
	fmovsvc	%xcc,	%f6,	%f31
	fblg	%fcc1,	loop_1907
	for	%f2,	%f14,	%f22
loop_1906:
	sdiv	%l0,	0x1F41,	%l5
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x89,	%l3
loop_1907:
	alignaddr	%i1,	%l2,	%o6
	ta	%icc,	0x1
	bn,pt	%xcc,	loop_1908
	subc	%o5,	0x09A4,	%i7
	edge32	%o7,	%o3,	%g1
	umul	%o0,	%l1,	%o2
loop_1908:
	addcc	%g2,	%o1,	%i3
	nop
	fitos	%f1,	%f13
	fstox	%f13,	%f30
	bshuffle	%f12,	%f28,	%f18
	brlez,a	%i4,	loop_1909
	ldstub	[%l7 + 0x61],	%g6
	movcc	%xcc,	%l4,	%g3
	bleu,pt	%icc,	loop_1910
loop_1909:
	bneg,pt	%xcc,	loop_1911
	call	loop_1912
	fsrc2	%f4,	%f20
loop_1910:
	orn	%i5,	0x0372,	%g7
loop_1911:
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%g4
loop_1912:
	taddcc	%i2,	0x13E9,	%o4
	fmovsa	%icc,	%f8,	%f31
	bcc,a,pn	%xcc,	loop_1913
	or	%g5,	0x15BA,	%i6
	movn	%xcc,	%i0,	%l0
	srax	%l5,	%l6,	%i1
loop_1913:
	smulcc	%l2,	0x15B5,	%o6
	fmovd	%f2,	%f10
	addccc	%o5,	%i7,	%o7
	movn	%xcc,	%l3,	%g1
	tcc	%xcc,	0x0
	array32	%o3,	%l1,	%o0
	fmovsg	%xcc,	%f15,	%f25
	tcc	%icc,	0x5
	fmovdle	%icc,	%f11,	%f16
	nop
	set	0x60, %l4
	lduw	[%l7 + %l4],	%g2
	stb	%o1,	[%l7 + 0x24]
	tcs	%xcc,	0x0
	fxor	%f26,	%f10,	%f22
	movrlez	%i3,	0x25F,	%o2
	edge8	%g6,	%i4,	%g3
	orncc	%l4,	0x17A1,	%g7
	taddcc	%g4,	%i2,	%i5
	fbul,a	%fcc1,	loop_1914
	movcc	%xcc,	%g5,	%o4
	addcc	%i6,	%l0,	%l5
	bgu,pn	%xcc,	loop_1915
loop_1914:
	ldd	[%l7 + 0x38],	%i0
	alignaddrl	%l6,	%l2,	%o6
	sllx	%o5,	%i7,	%i1
loop_1915:
	movgu	%icc,	%o7,	%g1
	fxnors	%f5,	%f7,	%f25
	tgu	%xcc,	0x6
	edge16l	%l3,	%o3,	%l1
	fmovdg	%xcc,	%f1,	%f16
	sir	0x0182
	tcc	%icc,	0x4
	fmovdne	%xcc,	%f13,	%f0
	orncc	%o0,	0x0201,	%o1
	fmovrde	%g2,	%f6,	%f16
	bg,pt	%icc,	loop_1916
	fmovdcs	%icc,	%f16,	%f27
	sdivcc	%o2,	0x035D,	%i3
	bgu,a,pn	%icc,	loop_1917
loop_1916:
	fbuge	%fcc3,	loop_1918
	mova	%icc,	%g6,	%g3
	fxnors	%f23,	%f8,	%f6
loop_1917:
	tg	%xcc,	0x2
loop_1918:
	array8	%i4,	%l4,	%g7
	edge8l	%g4,	%i2,	%g5
	bn,a	loop_1919
	ta	%icc,	0x5
	movge	%icc,	%o4,	%i6
	movcs	%xcc,	%i5,	%l0
loop_1919:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i0,	%l5
	fnot2s	%f16,	%f27
	umul	%l2,	0x1158,	%l6
	fmovsgu	%icc,	%f14,	%f31
	fbug	%fcc1,	loop_1920
	edge32ln	%o5,	%i7,	%i1
	nop
	setx	0x62E0DFE5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x3332294E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f14,	%f29
	nop
	setx	0x87E7DDE2D06BDE6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_1920:
	fands	%f27,	%f15,	%f18
	fcmpgt16	%f30,	%f22,	%o6
	fpadd32s	%f16,	%f26,	%f5
	be,pt	%icc,	loop_1921
	andn	%g1,	0x0923,	%l3
	sdivx	%o7,	0x0FD8,	%l1
	set	0x08, %g7
	ldswa	[%l7 + %g7] 0x04,	%o3
loop_1921:
	fmovdn	%xcc,	%f23,	%f5
	fnot2	%f20,	%f4
	xnor	%o1,	%g2,	%o2
	fmovsvs	%icc,	%f16,	%f15
	brz	%o0,	loop_1922
	umul	%g6,	%i3,	%g3
	fmovdgu	%xcc,	%f29,	%f11
	srlx	%l4,	%g7,	%i4
loop_1922:
	movrne	%i2,	%g4,	%o4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x30] %asi,	%i6
	membar	0x68
	fmovdl	%icc,	%f12,	%f18
	movgu	%icc,	%i5,	%l0
	bgu	loop_1923
	movg	%icc,	%g5,	%i0
	fcmpeq32	%f18,	%f10,	%l2
	xnor	%l6,	0x1971,	%o5
loop_1923:
	fcmpeq32	%f28,	%f8,	%l5
	brlz	%i1,	loop_1924
	subcc	%i7,	%g1,	%l3
	edge16ln	%o7,	%l1,	%o3
	tcc	%xcc,	0x6
loop_1924:
	bl,a,pn	%icc,	loop_1925
	brz,a	%o1,	loop_1926
	ldd	[%l7 + 0x08],	%g2
	edge16	%o2,	%o0,	%o6
loop_1925:
	tg	%icc,	0x4
loop_1926:
	ldsb	[%l7 + 0x4E],	%i3
	ldsh	[%l7 + 0x44],	%g3
	fbule	%fcc1,	loop_1927
	edge32n	%l4,	%g7,	%i4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%g6
loop_1927:
	orncc	%g4,	%i6,	%i5
	fbge	%fcc3,	loop_1928
	movrgez	%o4,	0x3E9,	%l0
	bneg,a	%xcc,	loop_1929
	fexpand	%f28,	%f14
loop_1928:
	or	%i0,	%g5,	%l2
	set	0x20, %l3
	lduha	[%l7 + %l3] 0x0c,	%l6
loop_1929:
	bgu,pn	%icc,	loop_1930
	sdiv	%l5,	0x1CB9,	%o5
	bvc,pn	%xcc,	loop_1931
	ld	[%l7 + 0x3C],	%f27
loop_1930:
	nop
	fitod	%f13,	%f28
	fmovs	%f19,	%f10
loop_1931:
	tsubcctv	%i1,	%i7,	%g1
	movcs	%icc,	%o7,	%l3
	fmovs	%f29,	%f26
	srax	%o3,	%o1,	%l1
	tleu	%xcc,	0x2
	tcc	%xcc,	0x2
	movrlez	%o2,	%g2,	%o6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%o0
	edge32n	%g3,	%l4,	%i3
	array16	%g7,	%i4,	%g6
	fmovsvc	%icc,	%f0,	%f17
	movg	%xcc,	%g4,	%i2
	edge8n	%i6,	%i5,	%l0
	tgu	%xcc,	0x6
	sllx	%o4,	%i0,	%g5
	umulcc	%l2,	%l5,	%o5
	edge32ln	%i1,	%l6,	%i7
	edge16l	%o7,	%l3,	%g1
	fbue,a	%fcc1,	loop_1932
	fbge	%fcc1,	loop_1933
	tsubcctv	%o3,	0x0429,	%o1
	or	%l1,	0x0297,	%o2
loop_1932:
	movrgz	%o6,	0x0F4,	%o0
loop_1933:
	fbge,a	%fcc2,	loop_1934
	tsubcc	%g2,	0x0672,	%l4
	pdist	%f2,	%f22,	%f30
	set	0x10, %g1
	lduha	[%l7 + %g1] 0x14,	%g3
loop_1934:
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f19
	stw	%g7,	[%l7 + 0x24]
	pdist	%f10,	%f24,	%f24
	tvs	%icc,	0x4
	array32	%i3,	%i4,	%g6
	brlz	%i2,	loop_1935
	ld	[%l7 + 0x78],	%f23
	movpos	%xcc,	%g4,	%i5
	movl	%icc,	%i6,	%l0
loop_1935:
	xor	%i0,	0x126A,	%g5
	tvs	%xcc,	0x2
	edge16ln	%l2,	%o4,	%o5
	xnorcc	%l5,	%i1,	%l6
	fxors	%f8,	%f7,	%f21
	bpos,a	loop_1936
	fmovrsgez	%i7,	%f27,	%f19
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x18] %asi,	%o7
loop_1936:
	ldd	[%l7 + 0x20],	%g0
	alignaddr	%l3,	%o3,	%l1
	tg	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	tleu	%xcc,	0x7
	or	%o2,	0x09EB,	%o6
	tl	%icc,	0x2
	fbug,a	%fcc0,	loop_1937
	edge16ln	%o0,	%l4,	%g2
	movrlez	%g3,	0x226,	%i3
	brgz	%i4,	loop_1938
loop_1937:
	movrgez	%g7,	%i2,	%g6
	edge8n	%g4,	%i6,	%i5
	fcmpgt32	%f14,	%f16,	%i0
loop_1938:
	subcc	%g5,	0x0C7D,	%l0
	fzero	%f2
	movgu	%icc,	%o4,	%o5
	xorcc	%l5,	0x10A2,	%i1
	set	0x58, %i3
	lduwa	[%l7 + %i3] 0x04,	%l6
	brgez,a	%i7,	loop_1939
	alignaddr	%o7,	%l2,	%l3
	alignaddrl	%o3,	%g1,	%l1
	fxnors	%f24,	%f0,	%f11
loop_1939:
	movrlez	%o2,	0x137,	%o1
	nop
	setx loop_1940, %l0, %l1
	jmpl %l1, %o6
	add	%l4,	%g2,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%g3
loop_1940:
	taddcctv	%g7,	%i2,	%i4
	orncc	%g6,	%g4,	%i6
	fmovrslez	%i5,	%f16,	%f11
	fmovda	%icc,	%f25,	%f2
	fnand	%f8,	%f30,	%f18
	fmovdl	%icc,	%f25,	%f20
	andncc	%i0,	%l0,	%o4
	xnor	%o5,	0x1791,	%l5
	fpack16	%f22,	%f14
	fabss	%f18,	%f18
	orn	%i1,	0x0B68,	%l6
	tg	%xcc,	0x6
	sdivcc	%i7,	0x1661,	%o7
	movrlez	%l2,	0x207,	%l3
	movn	%xcc,	%o3,	%g5
	bne	loop_1941
	tpos	%icc,	0x3
	addccc	%g1,	0x1E7D,	%o2
	fpsub32s	%f28,	%f11,	%f23
loop_1941:
	or	%l1,	0x1F84,	%o1
	movrgz	%l4,	%g2,	%o6
	sdiv	%o0,	0x091B,	%g3
	fmul8ulx16	%f0,	%f24,	%f22
	fpack16	%f22,	%f10
	tle	%icc,	0x2
	edge32l	%g7,	%i3,	%i2
	bcc,a	%icc,	loop_1942
	edge16ln	%g6,	%g4,	%i6
	fcmple32	%f30,	%f24,	%i5
	and	%i0,	%l0,	%i4
loop_1942:
	udivx	%o4,	0x0130,	%l5
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x81
	smulcc	%o5,	%l6,	%i7
	fornot1s	%f0,	%f25,	%f2
	movne	%xcc,	%o7,	%i1
	taddcc	%l2,	%o3,	%l3
	fbug,a	%fcc2,	loop_1943
	xnorcc	%g5,	0x070B,	%g1
	andn	%l1,	%o1,	%o2
	te	%icc,	0x1
loop_1943:
	sir	0x0552
	set	0x5F, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l4
	stx	%o6,	[%l7 + 0x38]
	fmovdgu	%icc,	%f5,	%f22
	movrlz	%g2,	%g3,	%g7
	tne	%xcc,	0x1
	alignaddr	%i3,	%i2,	%g6
	wr	%g0,	0x04,	%asi
	stwa	%g4,	[%l7 + 0x2C] %asi
	set	0x68, %g2
	stwa	%o0,	[%l7 + %g2] 0x81
	bn,a	%icc,	loop_1944
	andn	%i5,	0x06F9,	%i0
	ldsh	[%l7 + 0x5A],	%l0
	taddcc	%i6,	0x18D3,	%i4
loop_1944:
	fexpand	%f31,	%f30
	tvs	%xcc,	0x0
	edge32	%o4,	%o5,	%l6
	movrne	%i7,	0x24E,	%o7
	movge	%icc,	%l5,	%i1
	fbn,a	%fcc0,	loop_1945
	popc	0x06C6,	%l2
	edge16ln	%l3,	%g5,	%o3
	bl,a	%xcc,	loop_1946
loop_1945:
	lduw	[%l7 + 0x14],	%g1
	xor	%l1,	0x180F,	%o1
	tvs	%xcc,	0x1
loop_1946:
	tpos	%xcc,	0x5
	edge16l	%o2,	%l4,	%o6
	fmovsgu	%xcc,	%f4,	%f17
	wr	%g0,	0x18,	%asi
	stxa	%g2,	[%l7 + 0x58] %asi
	array32	%g3,	%i3,	%g7
	fexpand	%f5,	%f6
	fmuld8sux16	%f6,	%f10,	%f26
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%g6
	smul	%i2,	0x06AD,	%g4
	addccc	%i5,	0x0BA1,	%i0
	xnor	%l0,	%i6,	%o0
	lduh	[%l7 + 0x6C],	%i4
	fmovrdgz	%o5,	%f2,	%f26
	addc	%o4,	0x1B7C,	%i7
	fone	%f12
	orcc	%o7,	0x154F,	%l6
	tsubcc	%l5,	0x1640,	%i1
	fbo,a	%fcc0,	loop_1947
	array8	%l3,	%l2,	%g5
	movneg	%icc,	%g1,	%o3
	sdivcc	%o1,	0x078C,	%o2
loop_1947:
	movrgez	%l4,	0x297,	%o6
	smul	%g2,	0x01D7,	%g3
	tl	%icc,	0x1
	taddcc	%i3,	0x0950,	%l1
	edge16n	%g7,	%i2,	%g6
	edge8ln	%g4,	%i5,	%i0
	andcc	%l0,	%i6,	%o0
	fabsd	%f6,	%f26
	udivx	%i4,	0x071E,	%o4
	bcs,a	loop_1948
	movrne	%o5,	%i7,	%l6
	movne	%icc,	%l5,	%o7
	udivcc	%i1,	0x0C4D,	%l3
loop_1948:
	umul	%g5,	0x0FE6,	%l2
	nop
	setx loop_1949, %l0, %l1
	jmpl %l1, %o3
	mulx	%g1,	%o2,	%o1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
loop_1949:
	subcc	%l4,	%g2,	%i3
	fmul8x16al	%f25,	%f4,	%f18
	fmovdle	%icc,	%f3,	%f13
	ldub	[%l7 + 0x48],	%l1
	fandnot2s	%f26,	%f0,	%f9
	nop
	setx	0x7D1BECC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xA089702B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f23,	%f26
	stw	%g7,	[%l7 + 0x74]
	fzeros	%f22
	movgu	%xcc,	%g3,	%i2
	fbue,a	%fcc2,	loop_1950
	sll	%g4,	0x07,	%i5
	nop
	setx	loop_1951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%g6,	%l0,	%i0
loop_1950:
	umul	%i6,	%o0,	%o4
	ldx	[%l7 + 0x70],	%o5
loop_1951:
	xor	%i7,	%l6,	%i4
	fcmple32	%f2,	%f2,	%l5
	mulx	%i1,	0x102D,	%l3
	umulcc	%g5,	0x14A3,	%l2
	tneg	%xcc,	0x2
	fmovdcs	%xcc,	%f19,	%f25
	edge32ln	%o7,	%g1,	%o3
	fxors	%f13,	%f16,	%f15
	add	%o2,	0x1FA0,	%o1
	udivcc	%l4,	0x0AE7,	%o6
	orcc	%g2,	0x03BD,	%l1
	fcmpne32	%f10,	%f12,	%g7
	umulcc	%i3,	%g3,	%g4
	bneg	%xcc,	loop_1952
	ta	%xcc,	0x3
	bgu,a,pn	%icc,	loop_1953
	fbne	%fcc2,	loop_1954
loop_1952:
	addccc	%i5,	0x130E,	%g6
	srl	%i2,	0x1B,	%l0
loop_1953:
	edge16ln	%i6,	%i0,	%o4
loop_1954:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o5,	%i7,	%o0
	subc	%l6,	%i4,	%l5
	fornot1	%f14,	%f16,	%f4
	movg	%xcc,	%i1,	%g5
	addccc	%l2,	%l3,	%o7
	umulcc	%o3,	0x145E,	%o2
	mulx	%o1,	%g1,	%l4
	fcmpgt16	%f18,	%f20,	%g2
	fmul8x16	%f24,	%f16,	%f8
	edge8	%o6,	%g7,	%l1
	and	%g3,	%g4,	%i3
	alignaddrl	%i5,	%i2,	%l0
	movge	%xcc,	%i6,	%g6
	bvc,a,pt	%xcc,	loop_1955
	nop
	setx	0xC3657AB4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB1354FA6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f11,	%f2
	edge8l	%i0,	%o4,	%i7
	sdivx	%o0,	0x15F5,	%o5
loop_1955:
	movvs	%xcc,	%i4,	%l6
	edge32ln	%l5,	%g5,	%i1
	movrgz	%l2,	0x309,	%l3
	te	%icc,	0x6
	tn	%xcc,	0x2
	fmuld8ulx16	%f14,	%f20,	%f22
	fmovrsgez	%o3,	%f2,	%f7
	umul	%o2,	%o7,	%o1
	andncc	%l4,	%g1,	%g2
	fbule,a	%fcc0,	loop_1956
	srax	%g7,	%l1,	%g3
	movpos	%icc,	%g4,	%i3
	nop
	setx	loop_1957,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1956:
	edge32n	%o6,	%i5,	%i2
	fbule,a	%fcc2,	loop_1958
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1957:
	movg	%icc,	%l0,	%i6
	call	loop_1959
loop_1958:
	edge32n	%i0,	%o4,	%g6
	fmovs	%f29,	%f22
	alignaddr	%i7,	%o0,	%i4
loop_1959:
	nop
	fitos	%f5,	%f2
	fstod	%f2,	%f20
	sdivcc	%l6,	0x17EB,	%o5
	tgu	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g5,	%i1
	ldsb	[%l7 + 0x57],	%l2
	xnor	%l3,	%l5,	%o3
	wr	%g0,	0x89,	%asi
	sta	%f15,	[%l7 + 0x28] %asi
	fones	%f18
	tl	%icc,	0x5
	add	%o2,	0x1C3F,	%o1
	set	0x1C, %l2
	sta	%f6,	[%l7 + %l2] 0x14
	edge8	%o7,	%l4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pt	%icc,	loop_1960
	fbne,a	%fcc1,	loop_1961
	tcs	%icc,	0x1
	fpsub16s	%f24,	%f19,	%f3
loop_1960:
	tcc	%xcc,	0x7
loop_1961:
	xnorcc	%g7,	%g1,	%g3
	array8	%l1,	%g4,	%i3
	sra	%o6,	%i2,	%l0
	movcs	%icc,	%i5,	%i6
	udivcc	%o4,	0x1272,	%i0
	fpack32	%f12,	%f10,	%f16
	edge16ln	%g6,	%o0,	%i7
	movgu	%xcc,	%i4,	%l6
	movn	%xcc,	%o5,	%i1
	nop
	set	0x24, %g3
	stw	%l2,	[%l7 + %g3]
	fblg,a	%fcc0,	loop_1962
	umul	%g5,	%l5,	%l3
	bvc	%icc,	loop_1963
	tcs	%icc,	0x5
loop_1962:
	fmovsne	%xcc,	%f26,	%f10
	movge	%xcc,	%o3,	%o2
loop_1963:
	nop
	setx	0x55CBB37A204F0404,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	sra	%o1,	%o7,	%l4
	umul	%g7,	%g1,	%g2
	fmovdgu	%icc,	%f5,	%f31
	set	0x78, %o4
	ldsha	[%l7 + %o4] 0x89,	%l1
	fblg	%fcc0,	loop_1964
	addc	%g4,	0x18F0,	%i3
	srlx	%g3,	%i2,	%o6
	xor	%l0,	%i6,	%o4
loop_1964:
	tcc	%xcc,	0x2
	tcc	%icc,	0x7
	sub	%i5,	%g6,	%o0
	sdivcc	%i0,	0x0E21,	%i4
	array32	%i7,	%o5,	%i1
	edge8n	%l6,	%g5,	%l5
	movcc	%xcc,	%l3,	%l2
	edge16l	%o3,	%o1,	%o2
	tgu	%icc,	0x4
	set	0x6C, %o0
	ldsha	[%l7 + %o0] 0x14,	%o7
	and	%l4,	0x142C,	%g7
	tvs	%icc,	0x3
	xnorcc	%g2,	%g1,	%g4
	nop
	fitos	%f11,	%f18
	fstoi	%f18,	%f18
	alignaddr	%l1,	%g3,	%i2
	fbl,a	%fcc2,	loop_1965
	sdivx	%o6,	0x15B0,	%i3
	fpack32	%f22,	%f22,	%f8
	fpmerge	%f17,	%f15,	%f16
loop_1965:
	edge32n	%l0,	%o4,	%i6
	udivcc	%i5,	0x180B,	%o0
	bvc	loop_1966
	fmovdcc	%xcc,	%f5,	%f20
	movrgz	%g6,	0x0C9,	%i4
	edge32ln	%i0,	%i7,	%i1
loop_1966:
	nop
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x68] %asi
	xnor	%g5,	%l5,	%l3
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	subc	%o5,	%l2,	%o3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	fbn	%fcc2,	loop_1967
	tn	%xcc,	0x3
	edge16n	%o2,	%l4,	%g7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x2C] %asi,	%f2
loop_1967:
	popc	%o7,	%g1
	or	%g4,	%l1,	%g3
	fmovdgu	%icc,	%f30,	%f15
	movrlez	%g2,	0x34D,	%o6
	sll	%i2,	%l0,	%o4
	fba,a	%fcc1,	loop_1968
	fbo	%fcc0,	loop_1969
	fcmpeq16	%f2,	%f0,	%i3
	movpos	%xcc,	%i6,	%i5
loop_1968:
	sdivx	%g6,	0x0E37,	%i4
loop_1969:
	fxors	%f31,	%f29,	%f7
	alignaddrl	%o0,	%i7,	%i1
	movleu	%icc,	%l6,	%i0
	tle	%icc,	0x4
	move	%icc,	%g5,	%l5
	set	0x18, %o6
	lda	[%l7 + %o6] 0x19,	%f30
	tvs	%icc,	0x2
	ldsb	[%l7 + 0x21],	%o5
	edge16l	%l2,	%l3,	%o1
	bshuffle	%f16,	%f0,	%f8
	movge	%xcc,	%o3,	%o2
	bl,a,pt	%xcc,	loop_1970
	edge8ln	%l4,	%o7,	%g7
	movcc	%icc,	%g1,	%l1
	movgu	%icc,	%g4,	%g2
loop_1970:
	array16	%o6,	%g3,	%i2
	addc	%l0,	%i3,	%o4
	pdist	%f8,	%f18,	%f24
	fblg	%fcc2,	loop_1971
	edge32ln	%i6,	%g6,	%i5
	smulcc	%o0,	%i7,	%i1
	fmuld8sux16	%f30,	%f1,	%f20
loop_1971:
	nop
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x14,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%g5
	movleu	%icc,	%l5,	%o5
	movrgez	%l2,	%i0,	%o1
	wr	%g0,	0xe2,	%asi
	stwa	%o3,	[%l7 + 0x58] %asi
	membar	#Sync
	fmovdn	%xcc,	%f6,	%f13
	sir	0x1F87
	bpos,a,pn	%xcc,	loop_1972
	array16	%l3,	%l4,	%o2
	smul	%g7,	0x0776,	%g1
	tsubcc	%o7,	%g4,	%g2
loop_1972:
	edge16	%l1,	%o6,	%g3
	fba	%fcc1,	loop_1973
	nop
	setx	0xB2C643DB4FCA58F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xFB4B02A3E62E35A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f0,	%f0
	fnegs	%f20,	%f18
	mulx	%i2,	%i3,	%l0
loop_1973:
	fpsub16	%f16,	%f6,	%f0
	fcmpne16	%f16,	%f20,	%o4
	edge8	%g6,	%i5,	%o0
	fpmerge	%f19,	%f27,	%f6
	membar	0x39
	move	%xcc,	%i7,	%i1
	fbug	%fcc0,	loop_1974
	fmovrdne	%i6,	%f6,	%f8
	udiv	%i4,	0x1BD0,	%l6
	sth	%g5,	[%l7 + 0x0E]
loop_1974:
	sdivx	%o5,	0x129C,	%l2
	add	%i0,	%o1,	%o3
	edge16	%l3,	%l4,	%o2
	fmul8x16al	%f16,	%f20,	%f20
	faligndata	%f4,	%f30,	%f20
	movrgz	%l5,	0x08A,	%g7
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%g1
	movrgez	%g4,	0x1A0,	%g2
	bn,pn	%icc,	loop_1975
	sra	%l1,	0x00,	%o6
	orcc	%g3,	%o7,	%i3
	addccc	%i2,	%o4,	%g6
loop_1975:
	tn	%xcc,	0x4
	stbar
	ldsh	[%l7 + 0x08],	%i5
	ldstub	[%l7 + 0x72],	%o0
	sethi	0x1421,	%l0
	movrlz	%i1,	0x36F,	%i7
	fnegd	%f2,	%f16
	udivx	%i6,	0x148F,	%i4
	fmovdvc	%icc,	%f12,	%f17
	faligndata	%f8,	%f26,	%f2
	mulx	%g5,	0x01B2,	%l6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	fxor	%f30,	%f26,	%f30
	fbue,a	%fcc3,	loop_1976
	fmovsle	%icc,	%f12,	%f16
	movg	%xcc,	%i0,	%l2
	movle	%icc,	%o1,	%o3
loop_1976:
	bl,pn	%xcc,	loop_1977
	fnor	%f22,	%f10,	%f12
	fands	%f21,	%f5,	%f18
	fcmpne16	%f18,	%f4,	%l3
loop_1977:
	pdist	%f26,	%f8,	%f12
	ldd	[%l7 + 0x30],	%l4
	orcc	%l5,	0x13A6,	%g7
	ldsh	[%l7 + 0x6C],	%g1
	orn	%g4,	%g2,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l1,	%g3,	%o6
	nop
	setx	loop_1978,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivcc	%o7,	0x0EC8,	%i2
	fbug,a	%fcc1,	loop_1979
	fmuld8sux16	%f18,	%f30,	%f2
loop_1978:
	orncc	%o4,	0x1628,	%g6
	fmovsl	%icc,	%f10,	%f16
loop_1979:
	bg,a,pn	%icc,	loop_1980
	fmul8sux16	%f2,	%f28,	%f22
	fzeros	%f21
	te	%icc,	0x1
loop_1980:
	taddcctv	%i3,	0x1584,	%i5
	xnorcc	%o0,	0x1EE2,	%i1
	sethi	0x1E12,	%l0
	edge8n	%i7,	%i4,	%g5
	movleu	%icc,	%l6,	%o5
	nop
	set	0x6C, %o5
	ldub	[%l7 + %o5],	%i6
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i0
	movg	%xcc,	%o1,	%l2
	fabsd	%f24,	%f24
	tgu	%xcc,	0x1
	umul	%l3,	%l4,	%l5
	bleu,pt	%icc,	loop_1981
	move	%xcc,	%o3,	%g7
	movrlez	%g1,	0x3B5,	%g2
	tle	%icc,	0x0
loop_1981:
	bvc,pt	%icc,	loop_1982
	fmovsa	%icc,	%f27,	%f18
	or	%g4,	%l1,	%g3
	nop
	setx	loop_1983,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1982:
	tne	%icc,	0x1
	array16	%o2,	%o6,	%i2
	smulcc	%o4,	0x124F,	%o7
loop_1983:
	sra	%i3,	%i5,	%g6
	te	%xcc,	0x0
	stbar
	fornot2s	%f8,	%f5,	%f13
	ldstub	[%l7 + 0x55],	%o0
	fbne,a	%fcc2,	loop_1984
	fmovscs	%xcc,	%f29,	%f8
	swap	[%l7 + 0x30],	%i1
	brlz	%l0,	loop_1985
loop_1984:
	taddcc	%i7,	%i4,	%g5
	edge32n	%l6,	%o5,	%i6
	nop
	setx	0xBDE3295A7750BB7A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC1D0A679012223DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f26
loop_1985:
	xor	%o1,	0x1950,	%l2
	stx	%l3,	[%l7 + 0x60]
	nop
	setx	0x399BBC6C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f21
	sdiv	%i0,	0x1280,	%l5
	tgu	%icc,	0x6
	tle	%icc,	0x4
	brz,a	%l4,	loop_1986
	fcmpgt32	%f26,	%f30,	%o3
	tg	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x77] %asi,	%g7
loop_1986:
	mova	%icc,	%g1,	%g4
	sra	%g2,	0x08,	%l1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldstub	[%l7 + 0x42],	%g3
	lduw	[%l7 + 0x08],	%o6
	fbn,a	%fcc1,	loop_1987
	movn	%icc,	%o2,	%i2
	array16	%o4,	%o7,	%i5
	tcc	%xcc,	0x7
loop_1987:
	tpos	%icc,	0x6
	set	0x60, %i5
	stwa	%g6,	[%l7 + %i5] 0x2f
	membar	#Sync
	nop
	setx	loop_1988,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsle	%icc,	%f17,	%f16
	tgu	%xcc,	0x5
	sethi	0x17A8,	%i3
loop_1988:
	fexpand	%f16,	%f8
	movrgez	%i1,	0x229,	%o0
	fmovscs	%icc,	%f30,	%f4
	orn	%l0,	0x0B7B,	%i4
	stw	%i7,	[%l7 + 0x34]
	prefetch	[%l7 + 0x70],	 0x1
	and	%g5,	%o5,	%l6
	addcc	%o1,	0x19FC,	%i6
	tcs	%xcc,	0x5
	edge16l	%l2,	%l3,	%l5
	fmovrsgz	%l4,	%f15,	%f5
	movleu	%xcc,	%o3,	%g7
	tgu	%icc,	0x1
	edge8ln	%i0,	%g1,	%g2
	sethi	0x1E95,	%l1
	array32	%g4,	%g3,	%o2
	nop
	setx	loop_1989,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o6,	0x39A,	%o4
	umulcc	%o7,	0x06A4,	%i5
	tgu	%xcc,	0x1
loop_1989:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x09] %asi,	%i2
	wr	%g0,	0xea,	%asi
	stxa	%i3,	[%l7 + 0x28] %asi
	membar	#Sync
	ta	%icc,	0x4
	bl,pn	%icc,	loop_1990
	sdiv	%i1,	0x0653,	%g6
	brlz	%l0,	loop_1991
	fsrc1	%f24,	%f26
loop_1990:
	stx	%o0,	[%l7 + 0x28]
	srlx	%i4,	0x0C,	%i7
loop_1991:
	fmovdcc	%icc,	%f12,	%f29
	fbo,a	%fcc1,	loop_1992
	fmovdcs	%icc,	%f6,	%f18
	fxnors	%f16,	%f0,	%f16
	nop
	fitod	%f13,	%f10
loop_1992:
	taddcctv	%g5,	%o5,	%l6
	lduw	[%l7 + 0x70],	%o1
	udivcc	%i6,	0x18AF,	%l2
	movgu	%xcc,	%l5,	%l4
	tpos	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o3,	0x0C74,	%l3
	nop
	setx	loop_1993,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%i0,	0x0C1D,	%g1
	edge32	%g7,	%l1,	%g4
	fpadd16	%f24,	%f8,	%f26
loop_1993:
	nop
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x89,	%g3
	tvc	%icc,	0x2
	st	%f22,	[%l7 + 0x70]
	add	%o2,	0x0C38,	%g2
	tg	%xcc,	0x1
	fbug	%fcc1,	loop_1994
	sub	%o4,	0x02BE,	%o6
	srl	%o7,	0x1E,	%i5
	alignaddrl	%i3,	%i1,	%i2
loop_1994:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	subc	%l0,	0x09AA,	%o0
	tg	%icc,	0x0
	tle	%icc,	0x7
	move	%icc,	%g6,	%i7
	fpack16	%f24,	%f7
	fbule	%fcc0,	loop_1995
	ldsh	[%l7 + 0x38],	%g5
	fmovspos	%xcc,	%f0,	%f28
	array32	%o5,	%i4,	%o1
loop_1995:
	array32	%l6,	%i6,	%l5
	udivcc	%l2,	0x121A,	%o3
	fpadd32s	%f25,	%f17,	%f21
	xor	%l4,	%i0,	%l3
	set	0x38, %o2
	ldswa	[%l7 + %o2] 0x80,	%g1
	subccc	%g7,	0x1E0B,	%g4
	move	%xcc,	%g3,	%l1
	tle	%icc,	0x6
	sra	%g2,	0x04,	%o4
	fble,a	%fcc0,	loop_1996
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f2
	fxtod	%f2,	%f12
	movge	%icc,	%o6,	%o7
	movre	%o2,	0x22E,	%i5
loop_1996:
	bvc	loop_1997
	fmovrslez	%i3,	%f6,	%f16
	bvs,pt	%icc,	loop_1998
	tcc	%xcc,	0x2
loop_1997:
	movvc	%icc,	%i1,	%l0
	alignaddrl	%i2,	%o0,	%i7
loop_1998:
	fmovrslz	%g6,	%f30,	%f14
	ldd	[%l7 + 0x68],	%f28
	edge8n	%o5,	%i4,	%g5
	addcc	%l6,	0x0B17,	%i6
	fmovsge	%xcc,	%f18,	%f24
	tcc	%icc,	0x7
	movvc	%icc,	%o1,	%l2
	brgez	%l5,	loop_1999
	tsubcc	%o3,	0x10A2,	%i0
	faligndata	%f2,	%f28,	%f6
	edge8l	%l3,	%l4,	%g7
loop_1999:
	fmovsg	%xcc,	%f1,	%f14
	andn	%g1,	%g4,	%l1
	tsubcctv	%g2,	0x1C72,	%g3
	tl	%icc,	0x5
	subc	%o4,	0x1029,	%o7
	fmovdle	%xcc,	%f13,	%f29
	fmovsn	%icc,	%f26,	%f23
	movneg	%icc,	%o6,	%o2
	set	0x24, %l0
	stba	%i5,	[%l7 + %l0] 0x19
	fones	%f24
	fbe,a	%fcc1,	loop_2000
	sir	0x1E38
	movpos	%icc,	%i1,	%l0
	call	loop_2001
loop_2000:
	fmovscc	%xcc,	%f14,	%f1
	movg	%icc,	%i3,	%i2
	sub	%i7,	0x00CA,	%o0
loop_2001:
	umulcc	%o5,	%g6,	%i4
	movneg	%icc,	%l6,	%i6
	subcc	%g5,	0x1283,	%o1
	smulcc	%l5,	0x146C,	%l2
	movn	%icc,	%i0,	%l3
	subc	%o3,	0x0359,	%l4
	orn	%g1,	%g4,	%g7
	fpmerge	%f21,	%f0,	%f26
	tleu	%icc,	0x3
	edge8ln	%g2,	%g3,	%o4
	ld	[%l7 + 0x0C],	%f7
	alignaddrl	%l1,	%o6,	%o7
	bpos,pt	%icc,	loop_2002
	nop
	fitod	%f18,	%f0
	taddcctv	%i5,	0x0AAD,	%i1
	fpmerge	%f23,	%f14,	%f14
loop_2002:
	fmovs	%f1,	%f0
	fxnors	%f9,	%f7,	%f0
	subccc	%o2,	%i3,	%i2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf1
	membar	#Sync
	tne	%xcc,	0x4
	orn	%l0,	0x0D4C,	%o0
	xorcc	%o5,	0x020B,	%g6
	stb	%i7,	[%l7 + 0x20]
	tpos	%icc,	0x1
	mulx	%l6,	0x17FB,	%i6
	movcs	%icc,	%g5,	%o1
	sub	%l5,	0x1398,	%l2
	andcc	%i4,	0x0637,	%i0
	edge8n	%o3,	%l4,	%l3
	edge32n	%g4,	%g1,	%g7
	movn	%icc,	%g2,	%o4
	bneg,a	%xcc,	loop_2003
	subc	%l1,	0x1873,	%o6
	add	%o7,	%i5,	%i1
	fmovda	%xcc,	%f14,	%f12
loop_2003:
	movneg	%xcc,	%o2,	%g3
	fors	%f17,	%f28,	%f19
	udivcc	%i2,	0x0BDD,	%l0
	edge32l	%o0,	%o5,	%g6
	edge16ln	%i3,	%i7,	%i6
	edge32	%l6,	%o1,	%l5
	move	%xcc,	%g5,	%i4
	or	%l2,	0x19CE,	%o3
	tvs	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x0c,	%f0
	tgu	%xcc,	0x5
	fble	%fcc0,	loop_2004
	brgez	%l4,	loop_2005
	fmovdcs	%icc,	%f15,	%f29
	fmovrsne	%i0,	%f2,	%f23
loop_2004:
	fandnot1s	%f8,	%f31,	%f6
loop_2005:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x24] %asi,	%f29
	stbar
	fbl	%fcc0,	loop_2006
	fpadd32s	%f0,	%f22,	%f5
	bl,a	loop_2007
	move	%xcc,	%l3,	%g4
loop_2006:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3D] %asi,	%g7
loop_2007:
	movcc	%xcc,	%g2,	%o4
	brgz	%l1,	loop_2008
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f26
	bn,pn	%icc,	loop_2009
	edge16	%o6,	%o7,	%i5
loop_2008:
	movleu	%xcc,	%g1,	%i1
	fble,a	%fcc0,	loop_2010
loop_2009:
	movn	%icc,	%o2,	%g3
	movle	%icc,	%i2,	%l0
	or	%o5,	%o0,	%g6
loop_2010:
	edge32ln	%i7,	%i3,	%l6
	ldd	[%l7 + 0x78],	%i6
	edge32n	%l5,	%g5,	%i4
	nop
	setx	0x6E3E9DC3107EE8FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	sdiv	%o1,	0x0429,	%o3
	xnorcc	%l2,	0x075C,	%i0
	tleu	%icc,	0x1
	bcs	%xcc,	loop_2011
	subccc	%l4,	%g4,	%g7
	fmuld8ulx16	%f29,	%f1,	%f8
	nop
	fitod	%f5,	%f8
loop_2011:
	fnegd	%f16,	%f18
	bcs	loop_2012
	brlez	%l3,	loop_2013
	fmovrsne	%g2,	%f20,	%f7
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f24
loop_2012:
	xor	%l1,	0x0EE3,	%o4
loop_2013:
	subccc	%o6,	%o7,	%i5
	nop
	setx	0x255E6C4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x6A8C7A7E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f10,	%f17
	flush	%l7 + 0x64
	ldstub	[%l7 + 0x27],	%i1
	fmovdle	%xcc,	%f11,	%f7
	fmovdle	%icc,	%f0,	%f13
	fbu,a	%fcc0,	loop_2014
	tg	%xcc,	0x3
	bvc,a,pn	%xcc,	loop_2015
	movvs	%xcc,	%o2,	%g3
loop_2014:
	ldd	[%l7 + 0x38],	%f18
	mova	%xcc,	%g1,	%l0
loop_2015:
	bg	%xcc,	loop_2016
	mulscc	%o5,	%i2,	%g6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2016:
	movre	%i7,	0x018,	%i3
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%l6
	sdivx	%o0,	0x02DC,	%l5
	tcc	%icc,	0x2
	umul	%g5,	%i4,	%o1
	movleu	%icc,	%i6,	%l2
	orncc	%o3,	0x0412,	%i0
	taddcc	%l4,	%g4,	%l3
	sllx	%g2,	0x15,	%g7
	subc	%o4,	0x1E4F,	%o6
	fmul8x16au	%f18,	%f26,	%f8
	srlx	%o7,	0x19,	%i5
	tneg	%icc,	0x2
	fsrc1	%f26,	%f20
	bneg,a,pt	%icc,	loop_2017
	fble,a	%fcc1,	loop_2018
	udivcc	%l1,	0x0070,	%o2
	fpack32	%f14,	%f28,	%f0
loop_2017:
	fmovdneg	%icc,	%f24,	%f1
loop_2018:
	taddcctv	%g3,	0x09B2,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	%o5,	%i2
	mulscc	%l0,	0x186A,	%g6
	fpadd32s	%f29,	%f13,	%f31
	fandnot2s	%f9,	%f19,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f8,	%f30,	%i7
	ldd	[%l7 + 0x78],	%f16
	addccc	%i3,	%o0,	%l5
	nop
	setx	loop_2019,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%g5,	%i4,	%l6
	fbul	%fcc1,	loop_2020
	nop
	fitod	%f0,	%f22
	fdtos	%f22,	%f8
loop_2019:
	movrne	%i6,	0x180,	%o1
	nop
	setx	0xB355DA326B0568C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f16
loop_2020:
	array32	%o3,	%i0,	%l2
	fpadd16s	%f15,	%f5,	%f19
	orn	%g4,	%l4,	%g2
	fpadd16s	%f11,	%f22,	%f19
	tne	%xcc,	0x0
	movn	%icc,	%g7,	%l3
	fmovrsgez	%o4,	%f2,	%f9
	tl	%xcc,	0x7
	subc	%o7,	%o6,	%l1
	fabss	%f28,	%f12
	fbul	%fcc3,	loop_2021
	nop
	fitos	%f2,	%f13
	movleu	%xcc,	%o2,	%g3
	fpsub32s	%f31,	%f19,	%f25
loop_2021:
	tcc	%icc,	0x1
	lduw	[%l7 + 0x14],	%g1
	bcc,a	loop_2022
	edge32ln	%i1,	%i5,	%i2
	alignaddr	%l0,	%o5,	%i7
	addccc	%g6,	%i3,	%l5
loop_2022:
	tcc	%icc,	0x4
	taddcctv	%g5,	0x034D,	%o0
	fsrc1	%f4,	%f14
	srl	%i4,	0x16,	%i6
	sllx	%l6,	%o1,	%o3
	move	%xcc,	%i0,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g4,	%l4
	tcc	%icc,	0x1
	fnegd	%f12,	%f22
	tpos	%icc,	0x6
	set	0x53, %g6
	ldsba	[%l7 + %g6] 0x15,	%g2
	tne	%xcc,	0x5
	alignaddrl	%l3,	%o4,	%o7
	sdivcc	%o6,	0x1ABD,	%l1
	nop
	set	0x1C, %o7
	ldsw	[%l7 + %o7],	%o2
	fmovde	%icc,	%f24,	%f16
	movge	%xcc,	%g7,	%g3
	edge8	%i1,	%g1,	%i5
	fmovrse	%l0,	%f19,	%f13
	fnot1s	%f17,	%f6
	alignaddr	%o5,	%i7,	%i2
	fba	%fcc3,	loop_2023
	smul	%i3,	0x005C,	%l5
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x18] %asi,	%g6
loop_2023:
	bvc,pn	%xcc,	loop_2024
	fmovdvc	%icc,	%f30,	%f9
	fpadd32	%f30,	%f6,	%f14
	orncc	%g5,	0x0BC1,	%o0
loop_2024:
	addc	%i4,	0x1734,	%l6
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x18,	 0x2
	brlez,a	%o3,	loop_2025
	movvs	%xcc,	%o1,	%l2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i0
loop_2025:
	mulscc	%g4,	0x0A57,	%l4
	movn	%xcc,	%l3,	%g2
	te	%xcc,	0x6
	popc	0x1C95,	%o4
	andn	%o7,	0x0A57,	%l1
	movrgez	%o6,	0x27F,	%g7
	membar	0x69
	srax	%o2,	0x09,	%i1
	nop
	setx	0x23FB4BC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x2E4BD6A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f27,	%f25
	bpos,a,pn	%xcc,	loop_2026
	ba,a	loop_2027
	sllx	%g1,	0x12,	%i5
	set	0x2C, %i2
	lduwa	[%l7 + %i2] 0x15,	%l0
loop_2026:
	taddcc	%g3,	%o5,	%i2
loop_2027:
	fmovdcs	%icc,	%f2,	%f24
	fxnor	%f10,	%f30,	%f22
	sllx	%i7,	0x1F,	%i3
	movrlz	%l5,	%g5,	%g6
	movrgz	%o0,	%i4,	%l6
	tneg	%icc,	0x1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i6
	fmovdle	%icc,	%f12,	%f22
	fbu	%fcc0,	loop_2028
	brgez,a	%o1,	loop_2029
	sra	%l2,	0x0C,	%i0
	tn	%xcc,	0x4
loop_2028:
	smulcc	%g4,	0x0CBE,	%o3
loop_2029:
	swap	[%l7 + 0x50],	%l4
	ldd	[%l7 + 0x68],	%g2
	fmovdcc	%xcc,	%f5,	%f22
	array16	%o4,	%l3,	%l1
	sll	%o6,	%o7,	%o2
	movn	%xcc,	%g7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i5,	0x0B70,	%i1
	st	%f28,	[%l7 + 0x38]
	movg	%xcc,	%g3,	%l0
	fbge	%fcc2,	loop_2030
	fsrc1s	%f16,	%f11
	fmovrdlez	%o5,	%f16,	%f28
	bpos,a	%xcc,	loop_2031
loop_2030:
	fornot1	%f12,	%f6,	%f16
	movrgez	%i7,	0x0F1,	%i2
	tn	%icc,	0x6
loop_2031:
	nop
	set	0x68, %g5
	swapa	[%l7 + %g5] 0x10,	%i3
	edge32	%g5,	%g6,	%o0
	array8	%i4,	%l6,	%l5
	array16	%i6,	%o1,	%i0
	fmovdcs	%xcc,	%f15,	%f30
	alignaddrl	%l2,	%o3,	%g4
	array32	%g2,	%l4,	%o4
	umulcc	%l3,	%l1,	%o6
	sdivcc	%o7,	0x1074,	%g7
	array32	%o2,	%i5,	%i1
	fors	%f27,	%f12,	%f26
	wr	%g0,	0x27,	%asi
	stxa	%g3,	[%l7 + 0x60] %asi
	membar	#Sync
	tneg	%xcc,	0x5
	fpadd16s	%f6,	%f2,	%f29
	stx	%l0,	[%l7 + 0x40]
	xor	%o5,	%i7,	%g1
	movre	%i2,	0x366,	%i3
	tge	%xcc,	0x7
	tleu	%xcc,	0x2
	movrlz	%g5,	0x290,	%o0
	mulscc	%g6,	0x05F8,	%l6
	flush	%l7 + 0x70
	ta	%icc,	0x6
	fbn	%fcc1,	loop_2032
	tl	%icc,	0x7
	set	0x5C, %i0
	lda	[%l7 + %i0] 0x89,	%f13
loop_2032:
	nop
	setx	loop_2033,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovspos	%icc,	%f20,	%f18
	fexpand	%f12,	%f12
	movneg	%xcc,	%i4,	%l5
loop_2033:
	popc	0x0A5B,	%i6
	fabss	%f21,	%f21
	fxnors	%f17,	%f16,	%f12
	movl	%xcc,	%o1,	%l2
	movn	%icc,	%i0,	%g4
	fmul8x16au	%f0,	%f26,	%f22
	orcc	%o3,	0x0DB4,	%g2
	or	%o4,	0x1D8E,	%l3
	andn	%l4,	0x0889,	%o6
	st	%f16,	[%l7 + 0x70]
	edge8n	%o7,	%g7,	%l1
	fbug,a	%fcc1,	loop_2034
	fmovdgu	%xcc,	%f25,	%f16
	movrgz	%o2,	0x28F,	%i1
	andn	%i5,	0x04B8,	%l0
loop_2034:
	edge32l	%o5,	%i7,	%g3
	movcs	%xcc,	%g1,	%i2
	movvc	%xcc,	%i3,	%g5
	tge	%xcc,	0x6
	tg	%icc,	0x0
	movleu	%icc,	%o0,	%g6
	edge16ln	%i4,	%l5,	%l6
	ldx	[%l7 + 0x68],	%o1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%i6
	fxor	%f10,	%f4,	%f8
	movpos	%icc,	%l2,	%g4
	fmovrsgz	%o3,	%f31,	%f18
	movneg	%xcc,	%i0,	%g2
	tvc	%xcc,	0x5
	andcc	%o4,	0x1EDD,	%l4
	fsrc2	%f20,	%f6
	for	%f30,	%f26,	%f24
	movcc	%xcc,	%o6,	%l3
	move	%icc,	%g7,	%l1
	umul	%o2,	%i1,	%o7
	edge32l	%l0,	%o5,	%i7
	fnot2	%f30,	%f20
	sllx	%g3,	%i5,	%g1
	fmovsleu	%xcc,	%f19,	%f31
	fmovdcc	%icc,	%f12,	%f4
	tsubcc	%i2,	0x0BB8,	%i3
	or	%o0,	%g5,	%g6
	udivx	%l5,	0x1188,	%l6
	add	%o1,	%i4,	%l2
	array16	%g4,	%i6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f16,	%f3,	%f18
	set	0x18, %l6
	stwa	%g2,	[%l7 + %l6] 0x23
	membar	#Sync
	fbug	%fcc1,	loop_2035
	flush	%l7 + 0x60
	set	0x20, %l4
	lda	[%l7 + %l4] 0x04,	%f23
loop_2035:
	fbg,a	%fcc3,	loop_2036
	fmovsgu	%xcc,	%f25,	%f3
	set	0x34, %o3
	ldswa	[%l7 + %o3] 0x81,	%o4
loop_2036:
	prefetch	[%l7 + 0x48],	 0x2
	xnor	%i0,	%l4,	%l3
	edge8l	%g7,	%o6,	%o2
	bn	loop_2037
	fornot1	%f8,	%f24,	%f26
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x18,	%f16
loop_2037:
	nop
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x1f
	membar	#Sync
	movneg	%icc,	%l1,	%i1
	fzeros	%f8
	fpack32	%f28,	%f24,	%f30
	xor	%l0,	0x01DF,	%o5
	edge8n	%o7,	%i7,	%g3
	mulx	%g1,	%i2,	%i5
	nop
	setx loop_2038, %l0, %l1
	jmpl %l1, %i3
	fmovsvc	%xcc,	%f27,	%f4
	edge32	%o0,	%g6,	%g5
	ba,a	%icc,	loop_2039
loop_2038:
	nop
	setx	loop_2040,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc1,	loop_2041
	andn	%l5,	%o1,	%l6
loop_2039:
	te	%icc,	0x7
loop_2040:
	add	%i4,	%l2,	%i6
loop_2041:
	movleu	%icc,	%g4,	%g2
	subcc	%o4,	0x078E,	%o3
	nop
	setx	0xBCBD9201907E17D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	movrlez	%l4,	0x15A,	%l3
	fba,a	%fcc3,	loop_2042
	tvs	%icc,	0x2
	fcmple16	%f8,	%f16,	%g7
	fblg	%fcc3,	loop_2043
loop_2042:
	brnz,a	%i0,	loop_2044
	fbo,a	%fcc3,	loop_2045
	movrlz	%o6,	%l1,	%o2
loop_2043:
	fxors	%f0,	%f20,	%f6
loop_2044:
	smulcc	%i1,	0x1B5F,	%o5
loop_2045:
	bg,a,pt	%xcc,	loop_2046
	lduh	[%l7 + 0x1C],	%l0
	tle	%xcc,	0x5
	addcc	%o7,	0x0700,	%i7
loop_2046:
	alignaddr	%g1,	%g3,	%i5
	st	%f11,	[%l7 + 0x78]
	fone	%f16
	tcc	%icc,	0x7
	fbu	%fcc0,	loop_2047
	bcc	loop_2048
	movl	%xcc,	%i2,	%i3
	sllx	%o0,	%g5,	%l5
loop_2047:
	array16	%g6,	%l6,	%i4
loop_2048:
	movleu	%xcc,	%l2,	%o1
	movrlez	%g4,	0x2B7,	%i6
	fbl,a	%fcc3,	loop_2049
	fmovsg	%xcc,	%f18,	%f26
	fzero	%f2
	mova	%xcc,	%g2,	%o3
loop_2049:
	fmovdpos	%icc,	%f27,	%f7
	fcmple16	%f0,	%f22,	%o4
	fornot1s	%f11,	%f28,	%f12
	brlez	%l4,	loop_2050
	movneg	%icc,	%l3,	%g7
	fmul8x16	%f0,	%f14,	%f20
	sth	%i0,	[%l7 + 0x70]
loop_2050:
	fpadd16	%f4,	%f10,	%f18
	nop
	setx	0x8B8AF815D9C730C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x59EA22663412B8AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f30,	%f8
	fbue	%fcc3,	loop_2051
	nop
	setx	0x9C70323019CFD602,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF1C2342867213C02,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f26,	%f16
	fmovrslz	%o6,	%f4,	%f7
	fbl,a	%fcc3,	loop_2052
loop_2051:
	ldsb	[%l7 + 0x35],	%o2
	fmovscs	%xcc,	%f12,	%f16
	fexpand	%f18,	%f20
loop_2052:
	move	%xcc,	%i1,	%o5
	ble,a,pt	%xcc,	loop_2053
	movn	%xcc,	%l1,	%l0
	ble,a,pt	%xcc,	loop_2054
	movne	%xcc,	%o7,	%g1
loop_2053:
	movcs	%icc,	%i7,	%i5
	move	%xcc,	%g3,	%i2
loop_2054:
	sdivx	%o0,	0x0361,	%i3
	nop
	set	0x49, %i3
	ldstub	[%l7 + %i3],	%g5
	srax	%l5,	0x12,	%g6
	edge32ln	%i4,	%l6,	%o1
	ldub	[%l7 + 0x5C],	%g4
	edge8ln	%l2,	%g2,	%o3
	mulscc	%i6,	0x1342,	%l4
	move	%icc,	%l3,	%o4
	addcc	%g7,	0x09E7,	%o6
	swap	[%l7 + 0x50],	%o2
	subcc	%i0,	%o5,	%i1
	bge,a	loop_2055
	nop
	setx	0x8EA6F5C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f30
	bcs	%xcc,	loop_2056
	xorcc	%l0,	%o7,	%g1
loop_2055:
	srlx	%i7,	%l1,	%g3
	nop
	setx loop_2057, %l0, %l1
	jmpl %l1, %i2
loop_2056:
	orn	%o0,	0x16DC,	%i3
	tl	%xcc,	0x4
	brlz,a	%i5,	loop_2058
loop_2057:
	sth	%g5,	[%l7 + 0x2E]
	taddcctv	%l5,	0x1045,	%i4
	fzeros	%f26
loop_2058:
	fmul8sux16	%f8,	%f4,	%f22
	array32	%l6,	%o1,	%g4
	array32	%l2,	%g6,	%g2
	nop
	fitos	%f14,	%f27
	fstox	%f27,	%f16
	srlx	%o3,	%i6,	%l4
	andcc	%l3,	0x1200,	%o4
	fmovsneg	%icc,	%f27,	%f13
	tpos	%icc,	0x2
	tneg	%xcc,	0x7
	sdiv	%g7,	0x00DE,	%o6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x40] %asi,	%o2
	orn	%o5,	0x15BE,	%i1
	ta	%icc,	0x4
	edge32n	%l0,	%o7,	%i0
	ldx	[%l7 + 0x10],	%g1
	tcs	%icc,	0x1
	sra	%i7,	%g3,	%i2
	mulscc	%l1,	0x061E,	%o0
	set	0x34, %g1
	ldswa	[%l7 + %g1] 0x04,	%i3
	bge,a	%xcc,	loop_2059
	fnot2s	%f14,	%f6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g5
loop_2059:
	xor	%l5,	%i4,	%i5
	set	0x7A, %l5
	lduba	[%l7 + %l5] 0x10,	%l6
	fbu,a	%fcc0,	loop_2060
	sdivx	%g4,	0x0479,	%l2
	bpos,a	%icc,	loop_2061
	tsubcc	%g6,	%o1,	%g2
loop_2060:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x44] %asi,	%o3
loop_2061:
	edge8	%l4,	%i6,	%l3
	fbn,a	%fcc2,	loop_2062
	fmovrdlz	%o4,	%f16,	%f14
	tcs	%xcc,	0x5
	nop
	setx	0xA1CD385F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f13
loop_2062:
	edge32ln	%g7,	%o2,	%o6
	movvs	%xcc,	%o5,	%l0
	ldsw	[%l7 + 0x10],	%o7
	sir	0x0D27
	tneg	%icc,	0x4
	nop
	fitod	%f4,	%f6
	fdtoi	%f6,	%f13
	fpadd16s	%f7,	%f22,	%f25
	andncc	%i1,	%g1,	%i7
	srax	%g3,	%i2,	%l1
	nop
	setx	loop_2063,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%i0,	%i3,	%o0
	fbule	%fcc2,	loop_2064
	or	%l5,	%i4,	%i5
loop_2063:
	fbu	%fcc2,	loop_2065
	fmovdvc	%icc,	%f19,	%f8
loop_2064:
	movneg	%xcc,	%l6,	%g4
	fbg,a	%fcc2,	loop_2066
loop_2065:
	tle	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x74] %asi,	%f8
loop_2066:
	prefetch	[%l7 + 0x10],	 0x0
	movleu	%xcc,	%g5,	%g6
	fmovdpos	%xcc,	%f22,	%f27
	edge16ln	%l2,	%o1,	%o3
	edge32	%g2,	%i6,	%l4
	movle	%xcc,	%o4,	%g7
	fmovsvc	%xcc,	%f4,	%f14
	fnegs	%f9,	%f11
	ldub	[%l7 + 0x61],	%l3
	add	%o2,	0x080B,	%o5
	sth	%o6,	[%l7 + 0x5C]
	move	%icc,	%o7,	%i1
	edge16l	%g1,	%l0,	%i7
	tvs	%xcc,	0x0
	movne	%xcc,	%g3,	%l1
	stw	%i0,	[%l7 + 0x38]
	popc	%i3,	%o0
	fbule,a	%fcc3,	loop_2067
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%f20
	xor	%i2,	0x0A4E,	%i4
	add	%l5,	0x1470,	%i5
loop_2067:
	xor	%l6,	0x197F,	%g4
	fmovrdlez	%g6,	%f20,	%f18
	fmovdvs	%icc,	%f3,	%f30
	brlz,a	%l2,	loop_2068
	array32	%g5,	%o1,	%o3
	movne	%icc,	%i6,	%g2
	nop
	setx	0x328CF4ADD0679E50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_2068:
	smul	%o4,	0x084E,	%l4
	bshuffle	%f16,	%f16,	%f20
	stbar
	wr	%g0,	0x2a,	%asi
	stha	%l3,	[%l7 + 0x56] %asi
	membar	#Sync
	popc	%g7,	%o5
	movcs	%icc,	%o6,	%o7
	brgz	%o2,	loop_2069
	ta	%xcc,	0x7
	or	%g1,	0x1C60,	%l0
	movcc	%xcc,	%i1,	%g3
loop_2069:
	movrlez	%i7,	0x342,	%l1
	movrne	%i0,	0x12C,	%o0
	std	%f14,	[%l7 + 0x30]
	movl	%icc,	%i3,	%i4
	edge16ln	%l5,	%i5,	%i2
	edge32l	%l6,	%g6,	%g4
	tg	%xcc,	0x0
	alignaddr	%g5,	%o1,	%o3
	te	%xcc,	0x1
	bn	%icc,	loop_2070
	fbge,a	%fcc1,	loop_2071
	alignaddrl	%l2,	%g2,	%i6
	orncc	%l4,	%l3,	%o4
loop_2070:
	fbge	%fcc3,	loop_2072
loop_2071:
	brlz	%g7,	loop_2073
	tsubcctv	%o6,	%o7,	%o2
	tcc	%xcc,	0x6
loop_2072:
	edge16l	%o5,	%g1,	%i1
loop_2073:
	srlx	%g3,	0x09,	%i7
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x81,	%l0
	movg	%icc,	%i0,	%o0
	tcs	%icc,	0x7
	fpsub16s	%f18,	%f27,	%f24
	move	%xcc,	%i3,	%i4
	bpos,a,pt	%icc,	loop_2074
	smulcc	%l0,	%l5,	%i5
	fbu,a	%fcc1,	loop_2075
	tvs	%xcc,	0x5
loop_2074:
	movrlz	%i2,	0x082,	%l6
	fxnors	%f30,	%f19,	%f24
loop_2075:
	brnz,a	%g6,	loop_2076
	fbu,a	%fcc2,	loop_2077
	sub	%g5,	0x0C4C,	%o1
	fbul,a	%fcc1,	loop_2078
loop_2076:
	nop
	setx	0x3508B67B4061EF45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
loop_2077:
	st	%f31,	[%l7 + 0x20]
	sir	0x1044
loop_2078:
	mulscc	%o3,	%l2,	%g2
	fbl,a	%fcc2,	loop_2079
	fmovdne	%icc,	%f4,	%f25
	sll	%g4,	0x07,	%l4
	movcs	%xcc,	%l3,	%i6
loop_2079:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f2,	%f11
	fstoi	%f11,	%f24
	tvc	%icc,	0x3
	mulx	%g7,	0x15C7,	%o4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1E] %asi,	%o7
	addcc	%o2,	%o5,	%g1
	movgu	%xcc,	%o6,	%g3
	stw	%i7,	[%l7 + 0x40]
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%i0
	fmul8sux16	%f22,	%f26,	%f18
	nop
	set	0x7C, %l2
	stw	%i0,	[%l7 + %l2]
	ldub	[%l7 + 0x4D],	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%i3
	tl	%icc,	0x4
	fmovrdne	%l0,	%f8,	%f22
	fmovrdne	%l5,	%f18,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i5,	0x0A13,	%i4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x53] %asi,	%l6
	fnor	%f16,	%f0,	%f14
	tleu	%xcc,	0x5
	smul	%g6,	0x0AA9,	%i2
	movge	%icc,	%o1,	%o3
	edge8ln	%l2,	%g2,	%g4
	fxors	%f26,	%f11,	%f25
	te	%icc,	0x4
	subcc	%g5,	0x05F3,	%l3
	ba,a,pt	%xcc,	loop_2080
	xnor	%l4,	%g7,	%i6
	tneg	%xcc,	0x6
	array8	%o7,	%o4,	%o2
loop_2080:
	edge8ln	%g1,	%o6,	%g3
	fnot2	%f6,	%f28
	nop
	setx loop_2081, %l0, %l1
	jmpl %l1, %o5
	edge16	%i7,	%i0,	%o0
	fmovdle	%xcc,	%f10,	%f6
	nop
	setx	loop_2082,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2081:
	bvc	%icc,	loop_2083
	alignaddrl	%i1,	%l1,	%i3
	fmul8x16al	%f8,	%f15,	%f6
loop_2082:
	sethi	0x08F7,	%l5
loop_2083:
	sdivcc	%i5,	0x02A7,	%i4
	fpadd16	%f24,	%f6,	%f18
	tvs	%icc,	0x4
	tgu	%icc,	0x0
	sdivx	%l0,	0x0026,	%l6
	set	0x08, %o4
	ldxa	[%l7 + %o4] 0x10,	%i2
	fcmpeq16	%f26,	%f30,	%o1
	bleu,a,pt	%icc,	loop_2084
	ldd	[%l7 + 0x50],	%g6
	and	%o3,	%l2,	%g2
	fmovsa	%xcc,	%f0,	%f7
loop_2084:
	tcs	%xcc,	0x5
	ldsb	[%l7 + 0x52],	%g4
	movre	%g5,	0x2B9,	%l4
	tgu	%xcc,	0x0
	st	%f6,	[%l7 + 0x24]
	call	loop_2085
	edge16l	%g7,	%i6,	%o7
	srax	%o4,	0x15,	%l3
	movrgz	%g1,	0x1D4,	%o2
loop_2085:
	bg,pn	%xcc,	loop_2086
	fornot2	%f12,	%f20,	%f28
	movre	%o6,	0x2E9,	%o5
	movrne	%i7,	0x38C,	%i0
loop_2086:
	subc	%o0,	%i1,	%g3
	std	%f18,	[%l7 + 0x18]
	sllx	%i3,	%l1,	%i5
	edge8	%l5,	%l0,	%i4
	edge32n	%i2,	%o1,	%l6
	udiv	%o3,	0x1F51,	%l2
	edge8ln	%g6,	%g2,	%g5
	subc	%g4,	%l4,	%i6
	tsubcc	%o7,	0x094F,	%g7
	fmovsn	%icc,	%f29,	%f17
	ld	[%l7 + 0x5C],	%f20
	edge32n	%o4,	%l3,	%g1
	brnz	%o2,	loop_2087
	fbo	%fcc2,	loop_2088
	fmovrdgez	%o5,	%f30,	%f30
	fornot1	%f22,	%f28,	%f30
loop_2087:
	fnot2s	%f6,	%f10
loop_2088:
	array8	%i7,	%o6,	%i0
	fnands	%f17,	%f22,	%f8
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%i1
	movle	%xcc,	%g3,	%i3
	tneg	%icc,	0x5
	std	%f16,	[%l7 + 0x20]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc1,	loop_2089
	udivx	%l1,	0x1EF1,	%i5
	tn	%xcc,	0x2
	subcc	%l5,	%o0,	%i4
loop_2089:
	lduh	[%l7 + 0x7C],	%i2
	movleu	%icc,	%l0,	%l6
	te	%icc,	0x2
	edge8ln	%o1,	%l2,	%g6
	fmul8x16al	%f12,	%f15,	%f2
	brgz	%o3,	loop_2090
	membar	0x5E
	bleu,a	loop_2091
	move	%xcc,	%g2,	%g4
loop_2090:
	nop
	set	0x158, %o0
	nop 	! 	nop 	! 	ldxa	[%g0 + %o0] 0x40,	%l4 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2091:
	taddcctv	%i6,	0x1FED,	%o7
	movg	%icc,	%g7,	%o4
	srax	%g5,	0x12,	%g1
	edge8l	%l3,	%o2,	%o5
	edge32	%o6,	%i0,	%i7
	brlez	%g3,	loop_2092
	fbug	%fcc2,	loop_2093
	movcc	%icc,	%i1,	%l1
	edge32l	%i5,	%i3,	%l5
loop_2092:
	movrgz	%i4,	%o0,	%l0
loop_2093:
	ldd	[%l7 + 0x48],	%f22
	andcc	%l6,	%i2,	%l2
	fbule	%fcc1,	loop_2094
	sir	0x1213
	movvc	%xcc,	%o1,	%o3
	fzeros	%f18
loop_2094:
	fpack32	%f24,	%f14,	%f0
	for	%f16,	%f6,	%f22
	sllx	%g6,	0x17,	%g2
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x04,	%g4
	smul	%l4,	0x1923,	%o7
	fxnors	%f17,	%f20,	%f5
	fmovdcc	%icc,	%f26,	%f17
	sir	0x134D
	mova	%xcc,	%g7,	%o4
	move	%icc,	%i6,	%g1
	fbuge	%fcc1,	loop_2095
	bl,a,pt	%icc,	loop_2096
	subc	%l3,	0x1672,	%o2
	ble,a	%xcc,	loop_2097
loop_2095:
	sll	%g5,	0x1B,	%o5
loop_2096:
	tpos	%xcc,	0x6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i0
loop_2097:
	fornot2	%f6,	%f30,	%f2
	movg	%xcc,	%i7,	%g3
	addcc	%i1,	0x1E61,	%l1
	fmovdle	%icc,	%f2,	%f18
	fbo,a	%fcc0,	loop_2098
	tge	%xcc,	0x2
	ldsb	[%l7 + 0x12],	%i5
	tpos	%xcc,	0x6
loop_2098:
	fbg	%fcc0,	loop_2099
	brgz,a	%o6,	loop_2100
	orcc	%i3,	%i4,	%l5
	fpsub16	%f18,	%f0,	%f6
loop_2099:
	fbue,a	%fcc3,	loop_2101
loop_2100:
	tpos	%xcc,	0x6
	andcc	%l0,	%o0,	%i2
	mulx	%l6,	0x0ABF,	%l2
loop_2101:
	movpos	%xcc,	%o1,	%g6
	fmovsa	%icc,	%f14,	%f18
	bcc,pn	%icc,	loop_2102
	edge16	%o3,	%g4,	%l4
	tge	%icc,	0x4
	udivx	%g2,	0x075C,	%o7
loop_2102:
	movrne	%g7,	0x28F,	%o4
	edge8n	%i6,	%g1,	%l3
	sll	%o2,	0x10,	%o5
	st	%f30,	[%l7 + 0x28]
	edge8	%g5,	%i7,	%i0
	alignaddr	%g3,	%i1,	%i5
	ldsb	[%l7 + 0x60],	%l1
	set	0x42, %o5
	lduba	[%l7 + %o5] 0x04,	%o6
	movl	%xcc,	%i4,	%i3
	movre	%l5,	%o0,	%l0
	umulcc	%i2,	0x0690,	%l6
	movneg	%icc,	%l2,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o3,	0x127A,	%g4
	srlx	%g6,	0x09,	%l4
	edge8	%o7,	%g2,	%g7
	fbug	%fcc1,	loop_2103
	ldd	[%l7 + 0x78],	%o4
	xor	%g1,	%i6,	%o2
	sub	%o5,	0x01BF,	%g5
loop_2103:
	brlz	%i7,	loop_2104
	movle	%icc,	%l3,	%g3
	edge16l	%i0,	%i1,	%i5
	fpsub32s	%f13,	%f23,	%f11
loop_2104:
	movrgz	%o6,	0x105,	%l1
	ldsw	[%l7 + 0x58],	%i4
	subcc	%l5,	0x1FCF,	%o0
	sll	%l0,	0x10,	%i3
	xor	%l6,	%l2,	%o1
	fpackfix	%f4,	%f7
	mulscc	%i2,	0x0BD2,	%g4
	movrgz	%o3,	%g6,	%l4
	sll	%g2,	0x1F,	%o7
	umul	%g7,	0x0F1A,	%o4
	bcs,a	loop_2105
	movg	%xcc,	%g1,	%i6
	tleu	%xcc,	0x6
	edge8	%o5,	%g5,	%i7
loop_2105:
	prefetch	[%l7 + 0x20],	 0x1
	tne	%icc,	0x3
	smul	%l3,	0x0848,	%o2
	xorcc	%i0,	%i1,	%i5
	fmuld8sux16	%f29,	%f17,	%f14
	udivcc	%g3,	0x1D11,	%o6
	movrne	%i4,	%l1,	%o0
	subccc	%l0,	%i3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f18
	fbul,a	%fcc1,	loop_2106
	fmovrsgz	%l5,	%f4,	%f22
	fmovde	%icc,	%f2,	%f28
	fmovdne	%xcc,	%f9,	%f20
loop_2106:
	fmovrsgz	%l2,	%f28,	%f2
	udivcc	%i2,	0x0F9B,	%g4
	bvc,pn	%icc,	loop_2107
	alignaddrl	%o1,	%o3,	%l4
	addcc	%g6,	0x173A,	%g2
	ldsb	[%l7 + 0x37],	%o7
loop_2107:
	bn,a,pt	%icc,	loop_2108
	nop
	setx	0xD3FA1B3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xDDDDB40A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f1,	%f26
	fmovspos	%xcc,	%f30,	%f25
	and	%g7,	%o4,	%i6
loop_2108:
	nop
	setx loop_2109, %l0, %l1
	jmpl %l1, %o5
	edge32l	%g1,	%i7,	%g5
	tn	%icc,	0x2
	andcc	%l3,	0x147A,	%o2
loop_2109:
	fmovrsne	%i1,	%f19,	%f8
	subccc	%i5,	%g3,	%i0
	addcc	%o6,	%l1,	%o0
	fbg	%fcc0,	loop_2110
	fbg,a	%fcc0,	loop_2111
	addccc	%i4,	%i3,	%l6
	sra	%l5,	0x18,	%l2
loop_2110:
	array32	%i2,	%l0,	%g4
loop_2111:
	movcs	%icc,	%o1,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g6,	%g2
	edge32n	%o7,	%l4,	%g7
	fzero	%f14
	ld	[%l7 + 0x64],	%f17
	fbule	%fcc1,	loop_2112
	edge32l	%i6,	%o5,	%o4
	movne	%xcc,	%i7,	%g1
	fmovsle	%xcc,	%f16,	%f27
loop_2112:
	sdivcc	%l3,	0x0407,	%o2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bge,a,pt	%icc,	loop_2113
	xnorcc	%g5,	0x0E74,	%i1
	movn	%xcc,	%g3,	%i0
	movrgz	%i5,	0x1DD,	%l1
loop_2113:
	udivcc	%o6,	0x0306,	%i4
	std	%f2,	[%l7 + 0x58]
	fone	%f18
	bpos	loop_2114
	stb	%i3,	[%l7 + 0x27]
	tne	%xcc,	0x2
	orcc	%o0,	%l5,	%l6
loop_2114:
	bg	%xcc,	loop_2115
	fnot2	%f26,	%f30
	nop
	setx	loop_2116,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsne	%icc,	%f2,	%f31
loop_2115:
	edge32n	%l2,	%l0,	%g4
	movne	%xcc,	%o1,	%o3
loop_2116:
	fxnors	%f5,	%f15,	%f25
	andncc	%g6,	%i2,	%g2
	andn	%o7,	%g7,	%l4
	fbn	%fcc2,	loop_2117
	subcc	%o5,	0x0028,	%i6
	fbn,a	%fcc2,	loop_2118
	movneg	%xcc,	%i7,	%g1
loop_2117:
	brgz,a	%l3,	loop_2119
	tl	%xcc,	0x2
loop_2118:
	movvc	%icc,	%o2,	%g5
	fxors	%f6,	%f8,	%f29
loop_2119:
	movrgz	%o4,	0x0D5,	%g3
	brz	%i1,	loop_2120
	movcs	%xcc,	%i0,	%l1
	array8	%i5,	%i4,	%i3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%o0
loop_2120:
	nop
	set	0x0C, %i5
	lduw	[%l7 + %i5],	%l5
	fbe	%fcc3,	loop_2121
	andcc	%o6,	%l6,	%l2
	sllx	%g4,	0x08,	%l0
	fmovdpos	%xcc,	%f25,	%f19
loop_2121:
	sir	0x0C46
	fbg	%fcc1,	loop_2122
	xorcc	%o3,	%g6,	%i2
	set	0x3A, %i6
	ldsba	[%l7 + %i6] 0x15,	%o1
loop_2122:
	fbuge,a	%fcc2,	loop_2123
	subccc	%g2,	%g7,	%o7
	edge32n	%l4,	%i6,	%o5
	orncc	%i7,	0x0CEA,	%g1
loop_2123:
	nop
	set	0x22, %o1
	ldsha	[%l7 + %o1] 0x80,	%o2
	fcmpgt16	%f20,	%f4,	%l3
	std	%f4,	[%l7 + 0x20]
	fpack32	%f14,	%f0,	%f0
	udivcc	%g5,	0x18E6,	%g3
	brgz	%o4,	loop_2124
	sllx	%i1,	%i0,	%l1
	fnot1s	%f28,	%f22
	srl	%i5,	0x11,	%i3
loop_2124:
	fpadd32	%f16,	%f30,	%f4
	fmovde	%icc,	%f6,	%f23
	mova	%xcc,	%o0,	%l5
	movrlz	%o6,	0x279,	%i4
	movge	%xcc,	%l2,	%g4
	orcc	%l6,	0x030C,	%o3
	tneg	%icc,	0x7
	orn	%l0,	0x1EBE,	%g6
	flush	%l7 + 0x34
	fmovsge	%icc,	%f25,	%f20
	ldsh	[%l7 + 0x10],	%i2
	nop
	setx	0xE8FD4753462BF782,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x79EAC9112F7E4D50,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f10,	%f0
	edge8l	%o1,	%g2,	%o7
	te	%xcc,	0x1
	tn	%icc,	0x4
	tgu	%icc,	0x5
	or	%l4,	0x12B3,	%g7
	ldsw	[%l7 + 0x78],	%i6
	edge8	%i7,	%g1,	%o5
	ld	[%l7 + 0x7C],	%f6
	faligndata	%f10,	%f14,	%f22
	smul	%o2,	0x00C8,	%g5
	movleu	%xcc,	%g3,	%l3
	fbne	%fcc3,	loop_2125
	alignaddrl	%o4,	%i0,	%l1
	fmovsleu	%icc,	%f31,	%f8
	tneg	%xcc,	0x7
loop_2125:
	nop
	fitos	%f3,	%f2
	fstod	%f2,	%f24
	tg	%icc,	0x3
	array8	%i1,	%i3,	%o0
	brlez,a	%i5,	loop_2126
	brgz,a	%o6,	loop_2127
	stw	%i4,	[%l7 + 0x38]
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x88,	%l4
loop_2126:
	alignaddrl	%g4,	%l2,	%o3
loop_2127:
	sdiv	%l6,	0x09D5,	%g6
	smulcc	%l0,	%i2,	%g2
	bne,pt	%xcc,	loop_2128
	sdiv	%o7,	0x115A,	%o1
	movge	%xcc,	%g7,	%i6
	bge,a	%icc,	loop_2129
loop_2128:
	fmuld8sux16	%f22,	%f7,	%f4
	mulscc	%l4,	0x1283,	%i7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o5
loop_2129:
	movcs	%icc,	%g1,	%o2
	fmul8x16	%f14,	%f18,	%f24
	tge	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%g3
	bvs	loop_2130
	nop
	fitos	%f4,	%f22
	fstod	%f22,	%f18
	popc	0x0E99,	%g5
	sdivcc	%l3,	0x1C8F,	%i0
loop_2130:
	addcc	%l1,	%o4,	%i3
	edge8n	%i1,	%o0,	%o6
	fmovrsgz	%i5,	%f6,	%f17
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x11,	%l5,	%g4
	brgez	%i4,	loop_2131
	edge8l	%l2,	%o3,	%l6
	ldd	[%l7 + 0x78],	%f18
	edge32	%g6,	%l0,	%i2
loop_2131:
	xor	%g2,	0x017D,	%o7
	movrne	%o1,	0x0AC,	%g7
	stb	%l4,	[%l7 + 0x7D]
	alignaddrl	%i7,	%o5,	%i6
	fxnor	%f0,	%f28,	%f14
	movl	%xcc,	%g1,	%g3
	edge16l	%o2,	%g5,	%i0
	tleu	%icc,	0x2
	orcc	%l3,	0x1018,	%l1
	set	0x6C, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o4
	stbar
	edge16l	%i1,	%i3,	%o0
	ldub	[%l7 + 0x22],	%i5
	movrlz	%l5,	0x16C,	%g4
	tgu	%icc,	0x4
	movcs	%xcc,	%o6,	%i4
	fmovdle	%icc,	%f29,	%f10
	fexpand	%f29,	%f24
	taddcc	%l2,	%l6,	%o3
	andncc	%l0,	%g6,	%i2
	fbne	%fcc1,	loop_2132
	fbne,a	%fcc0,	loop_2133
	umul	%g2,	%o7,	%o1
	fmovs	%f6,	%f7
loop_2132:
	movre	%l4,	0x17B,	%i7
loop_2133:
	nop
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x04,	 0x2
	fands	%f1,	%f11,	%f30
	fornot2s	%f1,	%f10,	%f1
	ldd	[%l7 + 0x20],	%i6
	edge16ln	%g1,	%g7,	%g3
	fba,a	%fcc3,	loop_2134
	tcs	%xcc,	0x4
	bg,a,pn	%xcc,	loop_2135
	taddcc	%g5,	%o2,	%l3
loop_2134:
	sra	%i0,	0x00,	%l1
	pdist	%f6,	%f14,	%f26
loop_2135:
	addc	%o4,	%i3,	%o0
	tcs	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i1,	%l5
	subc	%g4,	0x06DE,	%i5
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f8
	edge16ln	%i4,	%l2,	%o6
	movcs	%icc,	%l6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g6,	0x13E8,	%l0
	fmovdcs	%icc,	%f15,	%f28
	bvc,pn	%icc,	loop_2136
	edge16ln	%g2,	%i2,	%o1
	fmovsn	%icc,	%f14,	%f29
	or	%l4,	%o7,	%i7
loop_2136:
	fandnot1	%f26,	%f16,	%f30
	fsrc2	%f18,	%f4
	movge	%xcc,	%i6,	%g1
	set	0x6C, %i7
	ldswa	[%l7 + %i7] 0x80,	%g7
	tn	%xcc,	0x3
	ldd	[%l7 + 0x40],	%f4
	movvc	%xcc,	%g3,	%o5
	or	%o2,	%l3,	%g5
	bn,a	loop_2137
	nop
	setx loop_2138, %l0, %l1
	jmpl %l1, %i0
	tvs	%icc,	0x6
	movg	%icc,	%l1,	%i3
loop_2137:
	edge16n	%o0,	%o4,	%l5
loop_2138:
	fmovsneg	%xcc,	%f6,	%f27
	edge8l	%i1,	%g4,	%i4
	add	%i5,	0x1EF0,	%l2
	addccc	%l6,	%o6,	%g6
	movne	%icc,	%o3,	%g2
	tle	%icc,	0x4
	movrlez	%i2,	%o1,	%l0
	movleu	%icc,	%o7,	%l4
	fmovde	%xcc,	%f30,	%f7
	tvc	%xcc,	0x5
	ldd	[%l7 + 0x38],	%i6
	movne	%icc,	%g1,	%g7
	orncc	%g3,	%i6,	%o2
	nop
	fitos	%f14,	%f28
	fstoi	%f28,	%f23
	flush	%l7 + 0x60
	te	%icc,	0x0
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f20
	stbar
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x80,	%l3
	movcs	%icc,	%g5,	%i0
	array32	%l1,	%o5,	%i3
	alignaddrl	%o4,	%l5,	%o0
	movgu	%xcc,	%i1,	%g4
	fornot1	%f20,	%f14,	%f30
	add	%i5,	0x042C,	%i4
	movrne	%l2,	0x21B,	%l6
	sra	%o6,	0x1C,	%o3
	movg	%icc,	%g6,	%g2
	fmovrdgz	%i2,	%f14,	%f14
	sll	%l0,	0x09,	%o7
	movrlz	%o1,	%l4,	%g1
	nop
	setx	0xBBB9C34FD803AE73,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1AEE6D9AB7D303B4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f6,	%f4
	fmovdvs	%icc,	%f24,	%f10
	movrlez	%g7,	0x363,	%g3
	fmovrdlz	%i6,	%f18,	%f2
	movn	%icc,	%i7,	%o2
	fnot1s	%f6,	%f23
	swap	[%l7 + 0x78],	%g5
	fcmpeq32	%f26,	%f0,	%i0
	sllx	%l1,	%o5,	%i3
	add	%l3,	%l5,	%o4
	tleu	%icc,	0x1
	edge32ln	%o0,	%i1,	%g4
	fmovdge	%xcc,	%f7,	%f12
	fandnot1	%f18,	%f8,	%f14
	tsubcc	%i4,	%i5,	%l2
	tleu	%xcc,	0x4
	edge16	%o6,	%o3,	%g6
	umulcc	%l6,	%g2,	%i2
	move	%xcc,	%l0,	%o7
	movcs	%icc,	%l4,	%o1
	fone	%f22
	prefetch	[%l7 + 0x3C],	 0x2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x2C] %asi,	%f10
	edge32	%g7,	%g3,	%i6
	set	0x18, %i4
	stwa	%i7,	[%l7 + %i4] 0x19
	movrlz	%g1,	%g5,	%i0
	movleu	%xcc,	%l1,	%o2
	movge	%icc,	%i3,	%o5
	fcmple32	%f12,	%f6,	%l5
	mulx	%o4,	%o0,	%l3
	xor	%i1,	0x0E0D,	%i4
	movneg	%xcc,	%i5,	%l2
	fpsub16	%f10,	%f30,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x6
	fbl	%fcc0,	loop_2139
	nop
	setx	0x7067205B,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	tsubcc	%o6,	0x1179,	%g4
	andncc	%g6,	%o3,	%g2
loop_2139:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x4E, %o7
	ldsh	[%l7 + %o7],	%l6
	xor	%l0,	%i2,	%l4
	edge16	%o1,	%g7,	%o7
	fbe,a	%fcc0,	loop_2140
	edge8	%i6,	%i7,	%g1
	andcc	%g3,	%g5,	%l1
	set	0x1E, %i1
	lduha	[%l7 + %i1] 0x89,	%o2
loop_2140:
	movg	%icc,	%i0,	%i3
	nop
	setx	0xBA2A05B96E29A940,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xE5C7743812EDCBBB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f30,	%f10
	mulscc	%l5,	%o5,	%o0
	movgu	%icc,	%l3,	%i1
	nop
	setx	0x8E312CEB8069E7CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	tvs	%icc,	0x1
	bvc	loop_2141
	xnorcc	%i4,	0x10F5,	%i5
	tneg	%icc,	0x2
	ld	[%l7 + 0x24],	%f23
loop_2141:
	movcc	%xcc,	%o4,	%l2
	nop
	fitod	%f6,	%f14
	fdtoi	%f14,	%f19
	xorcc	%o6,	0x17CD,	%g6
	bg,a,pn	%icc,	loop_2142
	faligndata	%f8,	%f14,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x0C],	 0x3
loop_2142:
	subcc	%g4,	0x019E,	%g2
	tcc	%icc,	0x2
	edge32n	%o3,	%l0,	%i2
	edge8	%l4,	%o1,	%g7
	tg	%xcc,	0x5
	movpos	%icc,	%o7,	%l6
	or	%i6,	%g1,	%g3
	wr	%g0,	0x2a,	%asi
	stba	%g5,	[%l7 + 0x47] %asi
	membar	#Sync
	srax	%i7,	%o2,	%l1
	fors	%f8,	%f16,	%f18
	movn	%xcc,	%i0,	%l5
	set	0x34, %i2
	stba	%i3,	[%l7 + %i2] 0x89
	edge8	%o5,	%l3,	%i1
	bl,a	%xcc,	loop_2143
	ta	%icc,	0x7
	array8	%i4,	%i5,	%o0
	set	0x3E, %i0
	lduha	[%l7 + %i0] 0x14,	%o4
loop_2143:
	umul	%l2,	0x081D,	%g6
	set	0x34, %l6
	ldswa	[%l7 + %l6] 0x14,	%g4
	ble	loop_2144
	edge32ln	%g2,	%o3,	%l0
	edge8n	%o6,	%l4,	%o1
	fbul	%fcc0,	loop_2145
loop_2144:
	xor	%i2,	0x000B,	%g7
	stw	%o7,	[%l7 + 0x08]
	fbule	%fcc1,	loop_2146
loop_2145:
	movrlz	%i6,	%l6,	%g3
	movpos	%xcc,	%g1,	%i7
	subc	%g5,	0x1BB1,	%o2
loop_2146:
	edge8	%l1,	%l5,	%i3
	prefetch	[%l7 + 0x3C],	 0x0
	fnors	%f13,	%f6,	%f15
	fblg,a	%fcc3,	loop_2147
	and	%o5,	%l3,	%i0
	smulcc	%i1,	0x18DF,	%i4
	fxor	%f2,	%f30,	%f4
loop_2147:
	fabsd	%f12,	%f4
	edge32	%o0,	%o4,	%l2
	movrgz	%i5,	%g6,	%g4
	or	%o3,	0x1213,	%g2
	addcc	%l0,	%l4,	%o1
	flush	%l7 + 0x1C
	popc	%i2,	%o6
	alignaddrl	%g7,	%i6,	%o7
	mulscc	%l6,	0x0CBB,	%g3
	edge8l	%g1,	%g5,	%o2
	srlx	%i7,	0x08,	%l5
	tvc	%xcc,	0x1
	movre	%l1,	%i3,	%l3
	subcc	%o5,	%i1,	%i0
	movge	%icc,	%i4,	%o0
	udiv	%l2,	0x1E50,	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%o4
	tle	%icc,	0x7
	subccc	%g4,	0x0DB0,	%o3
	tl	%icc,	0x6
	nop
	setx	loop_2148,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%l0,	%l4,	%o1
	fmovdl	%icc,	%f30,	%f21
	fcmpgt32	%f2,	%f10,	%g2
loop_2148:
	fsrc1s	%f30,	%f24
	lduh	[%l7 + 0x5A],	%i2
	bge	%xcc,	loop_2149
	movrlz	%g7,	%i6,	%o7
	set	0x0E, %g5
	stha	%o6,	[%l7 + %g5] 0x23
	membar	#Sync
loop_2149:
	and	%g3,	0x0948,	%g1
	nop
	setx	0xBF6CF7DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x94EA1422,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f20,	%f13
	bcc,a,pn	%icc,	loop_2150
	movcc	%icc,	%g5,	%l6
	tge	%icc,	0x3
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f26
loop_2150:
	tn	%xcc,	0x1
	set	0x35, %l4
	lduba	[%l7 + %l4] 0x88,	%o2
	array16	%i7,	%l1,	%l5
	subc	%i3,	0x1526,	%o5
	fones	%f23
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x18,	%f16
	mulscc	%l3,	0x09A0,	%i0
	xor	%i1,	0x0CC6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f28,	%f25
	tpos	%icc,	0x3
	andncc	%i4,	%i5,	%l2
	tcc	%xcc,	0x0
	sethi	0x0677,	%g6
	fmuld8sux16	%f4,	%f0,	%f16
	sub	%o4,	0x078B,	%g4
	movvc	%xcc,	%o3,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l4
	tneg	%xcc,	0x5
	popc	0x1535,	%g2
	bne,a	%icc,	loop_2151
	andn	%o1,	0x06BC,	%i2
	xor	%g7,	0x0885,	%o7
	edge8ln	%o6,	%i6,	%g1
loop_2151:
	nop
	set	0x48, %g7
	ldstub	[%l7 + %g7],	%g3
	ta	%xcc,	0x5
	xnorcc	%g5,	%o2,	%i7
	tvc	%icc,	0x5
	bl,a,pt	%icc,	loop_2152
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f16
	fxtod	%f16,	%f6
	edge32l	%l6,	%l5,	%l1
	edge32n	%i3,	%l3,	%o5
loop_2152:
	ldub	[%l7 + 0x55],	%i0
	movre	%i1,	0x05D,	%i4
	fmovdl	%xcc,	%f20,	%f11
	edge32n	%i5,	%l2,	%o0
	fmul8x16	%f16,	%f16,	%f18
	fcmple32	%f8,	%f30,	%o4
	nop
	fitos	%f11,	%f23
	fstoi	%f23,	%f30
	sdiv	%g4,	0x1319,	%o3
	movge	%xcc,	%l0,	%g6
	fbuge,a	%fcc0,	loop_2153
	alignaddrl	%g2,	%o1,	%l4
	movvs	%icc,	%i2,	%g7
	movrlez	%o7,	0x2D2,	%i6
loop_2153:
	call	loop_2154
	xor	%o6,	0x05F6,	%g3
	subc	%g5,	0x0E2B,	%g1
	edge32ln	%o2,	%i7,	%l6
loop_2154:
	bn,pt	%xcc,	loop_2155
	sdiv	%l1,	0x1D8C,	%i3
	fnands	%f5,	%f25,	%f25
	fmovdvs	%icc,	%f6,	%f8
loop_2155:
	sir	0x1331
	sub	%l5,	0x1E15,	%l3
	sllx	%o5,	%i1,	%i4
	tcc	%icc,	0x7
	ldx	[%l7 + 0x08],	%i5
	fpsub32s	%f10,	%f18,	%f6
	smulcc	%i0,	0x1393,	%o0
	move	%xcc,	%l2,	%g4
	edge16l	%o3,	%o4,	%l0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x78] %asi,	%g2
	movcc	%icc,	%g6,	%l4
	movpos	%icc,	%o1,	%g7
	fmovda	%icc,	%f28,	%f31
	tvs	%icc,	0x0
	sra	%i2,	%o7,	%i6
	movcc	%xcc,	%o6,	%g3
	fnot1	%f22,	%f14
	fbl,a	%fcc0,	loop_2156
	fbge,a	%fcc1,	loop_2157
	fnegs	%f23,	%f14
	tgu	%xcc,	0x1
loop_2156:
	ldsw	[%l7 + 0x08],	%g1
loop_2157:
	brlz,a	%o2,	loop_2158
	xnorcc	%g5,	0x1CC4,	%i7
	sdivx	%l6,	0x0C9F,	%l1
	bpos,a,pn	%icc,	loop_2159
loop_2158:
	movcs	%icc,	%l5,	%l3
	fbg	%fcc3,	loop_2160
	tpos	%icc,	0x6
loop_2159:
	ldx	[%l7 + 0x58],	%i3
	swap	[%l7 + 0x4C],	%i1
loop_2160:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%i4
	fmovdneg	%icc,	%f1,	%f21
	orn	%i5,	0x1679,	%i0
	tne	%icc,	0x1
	set	0x79, %i3
	stba	%o5,	[%l7 + %i3] 0xe2
	membar	#Sync
	edge32n	%o0,	%g4,	%l2
	tneg	%icc,	0x5
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%f8
	subccc	%o4,	0x1024,	%l0
	subc	%g2,	%o3,	%l4
	array16	%g6,	%o1,	%i2
	array16	%g7,	%o7,	%i6
	sllx	%o6,	0x0D,	%g1
	fblg,a	%fcc0,	loop_2161
	fors	%f18,	%f2,	%f7
	edge16	%o2,	%g3,	%i7
	movrne	%l6,	0x3C9,	%l1
loop_2161:
	ldd	[%l7 + 0x28],	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l3,	%i3,	%g5
	sdiv	%i4,	0x0889,	%i1
	and	%i5,	0x1BF7,	%o5
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%i0
	andn	%o0,	%l2,	%g4
	alignaddrl	%o4,	%g2,	%o3
	edge16ln	%l4,	%g6,	%l0
	move	%icc,	%i2,	%g7
	mulscc	%o7,	%i6,	%o1
	movl	%xcc,	%g1,	%o6
	smulcc	%g3,	0x0070,	%i7
	movgu	%icc,	%o2,	%l1
	udivcc	%l6,	0x1BB8,	%l3
	fcmpne16	%f28,	%f6,	%i3
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f28
	edge16n	%l5,	%i4,	%g5
	fmovrdgez	%i5,	%f20,	%f26
	tge	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdivcc	%i1,	0x0F71,	%o5
	movrgez	%i0,	0x2FA,	%o0
	movvs	%icc,	%l2,	%o4
	addccc	%g4,	0x0D6F,	%g2
	udivcc	%l4,	0x1322,	%g6
	smul	%o3,	0x1214,	%l0
	fmovdge	%xcc,	%f5,	%f3
	subccc	%g7,	%i2,	%i6
	brlez	%o7,	loop_2162
	movrne	%g1,	0x289,	%o1
	sir	0x1587
	movge	%xcc,	%g3,	%i7
loop_2162:
	tvs	%icc,	0x4
	tg	%xcc,	0x7
	sub	%o6,	%o2,	%l1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l3,	%l6
	set	0x48, %l3
	ldsha	[%l7 + %l3] 0x11,	%l5
	sethi	0x0B9D,	%i3
	addcc	%i4,	0x1874,	%i5
	fmovsvc	%xcc,	%f26,	%f12
	tvs	%icc,	0x6
	orncc	%i1,	%g5,	%o5
	nop
	setx	0x3C507047C047CE28,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	bneg,pt	%xcc,	loop_2163
	smul	%o0,	0x1AC7,	%l2
	movrgz	%o4,	0x39F,	%i0
	edge32n	%g4,	%g2,	%l4
loop_2163:
	edge8l	%g6,	%l0,	%g7
	fmovrdlz	%o3,	%f30,	%f28
	bpos,pt	%icc,	loop_2164
	fbe	%fcc3,	loop_2165
	sra	%i2,	%o7,	%i6
	tleu	%icc,	0x4
loop_2164:
	movrlez	%o1,	%g3,	%i7
loop_2165:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%g1
	tle	%xcc,	0x3
	movrne	%o2,	%l1,	%o6
	andn	%l6,	0x0050,	%l3
	sdivcc	%i3,	0x05E5,	%i4
	edge8n	%l5,	%i5,	%g5
	lduw	[%l7 + 0x4C],	%o5
	set	0x28, %l5
	sta	%f1,	[%l7 + %l5] 0x11
	wr	%g0,	0x88,	%asi
	sta	%f13,	[%l7 + 0x70] %asi
	fbge,a	%fcc1,	loop_2166
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i1,	0x1B13,	%l2
	nop
	setx	0x1FE8D3FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x68EDE69C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f20,	%f19
loop_2166:
	fpsub32	%f10,	%f22,	%f0
	tpos	%icc,	0x6
	tpos	%xcc,	0x6
	nop
	setx loop_2167, %l0, %l1
	jmpl %l1, %o0
	movpos	%xcc,	%i0,	%o4
	tvs	%xcc,	0x1
	edge16ln	%g4,	%g2,	%l4
loop_2167:
	smulcc	%l0,	0x1BD3,	%g7
	te	%xcc,	0x2
	ldub	[%l7 + 0x7B],	%o3
	brlez	%i2,	loop_2168
	tl	%xcc,	0x3
	bpos,pn	%icc,	loop_2169
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f22
loop_2168:
	edge16ln	%g6,	%o7,	%i6
	sdivx	%g3,	0x0568,	%o1
loop_2169:
	edge32l	%g1,	%o2,	%i7
	set	0x74, %g2
	ldswa	[%l7 + %g2] 0x80,	%l1
	fpack16	%f6,	%f16
	sub	%l6,	%o6,	%l3
	subc	%i3,	%i4,	%i5
	andcc	%l5,	%o5,	%g5
	orcc	%l2,	0x1891,	%o0
	ldsw	[%l7 + 0x38],	%i1
	addcc	%o4,	0x1428,	%g4
	te	%xcc,	0x2
	udiv	%g2,	0x03C4,	%i0
	ta	%xcc,	0x2
	sll	%l0,	0x03,	%l4
	mulx	%g7,	%i2,	%g6
	tvs	%icc,	0x5
	prefetch	[%l7 + 0x60],	 0x0
	tsubcc	%o3,	0x1BBF,	%o7
	popc	%i6,	%g3
	set	0x37, %l1
	stba	%g1,	[%l7 + %l1] 0x14
	bg,a	%xcc,	loop_2170
	fmovdvc	%xcc,	%f23,	%f21
	movpos	%xcc,	%o1,	%i7
	subccc	%l1,	%o2,	%o6
loop_2170:
	edge16ln	%l6,	%l3,	%i3
	edge16ln	%i5,	%i4,	%l5
	movrlz	%g5,	0x12A,	%l2
	ta	%icc,	0x7
	sir	0x168D
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%i1
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f16
	srlx	%o0,	%o4,	%g4
	movn	%xcc,	%i0,	%g2
	brgez	%l4,	loop_2171
	orncc	%l0,	%i2,	%g6
	tcs	%xcc,	0x2
	nop
	fitod	%f2,	%f30
loop_2171:
	mulx	%o3,	%g7,	%i6
	smulcc	%o7,	0x1F1F,	%g3
	movrgz	%g1,	0x0B2,	%i7
	srax	%l1,	%o2,	%o1
	movle	%icc,	%l6,	%o6
	fexpand	%f4,	%f12
	edge8ln	%i3,	%i5,	%l3
	fmovdcc	%xcc,	%f4,	%f12
	tvs	%icc,	0x1
	edge16ln	%i4,	%g5,	%l2
	fmovrdlez	%o5,	%f30,	%f26
	st	%f15,	[%l7 + 0x7C]
	xnorcc	%i1,	%l5,	%o0
	movle	%icc,	%o4,	%g4
	orcc	%g2,	0x1B83,	%l4
	tgu	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f6,	%f15
	fstod	%f15,	%f22
	movl	%icc,	%i0,	%l0
	fbule,a	%fcc1,	loop_2172
	tsubcc	%g6,	%i2,	%o3
	fmovrdgz	%g7,	%f26,	%f0
	brlez	%o7,	loop_2173
loop_2172:
	edge8n	%i6,	%g1,	%g3
	umul	%l1,	%i7,	%o2
	fbne	%fcc3,	loop_2174
loop_2173:
	fmovspos	%xcc,	%f24,	%f30
	set	0x5F, %g3
	lduba	[%l7 + %g3] 0x14,	%l6
loop_2174:
	tvc	%xcc,	0x3
	fbo,a	%fcc3,	loop_2175
	brlez	%o1,	loop_2176
	sir	0x0CFE
	bvs,pt	%icc,	loop_2177
loop_2175:
	fmovsgu	%icc,	%f23,	%f24
loop_2176:
	movrlz	%o6,	0x057,	%i3
	tl	%icc,	0x2
loop_2177:
	be,pn	%icc,	loop_2178
	fpmerge	%f30,	%f20,	%f28
	smulcc	%l3,	%i4,	%i5
	orn	%g5,	0x1640,	%o5
loop_2178:
	movvs	%icc,	%l2,	%l5
	fnand	%f22,	%f14,	%f24
	popc	0x03A4,	%o0
	fmovdgu	%xcc,	%f5,	%f12
	movl	%xcc,	%i1,	%o4
	fpsub32	%f30,	%f30,	%f16
	andncc	%g2,	%l4,	%i0
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%l0
	set	0x51, %o4
	stba	%g4,	[%l7 + %o4] 0x04
	addc	%i2,	0x19F8,	%o3
	add	%g7,	0x086C,	%o7
	movrgz	%i6,	0x2FF,	%g6
	srlx	%g1,	0x16,	%g3
	alignaddr	%l1,	%o2,	%i7
	umul	%o1,	%l6,	%i3
	fsrc1s	%f25,	%f2
	movg	%icc,	%o6,	%i4
	andncc	%i5,	%l3,	%g5
	edge8n	%o5,	%l5,	%o0
	set	0x24, %o6
	ldswa	[%l7 + %o6] 0x14,	%l2
	tsubcc	%o4,	0x04B9,	%g2
	set	0x7F, %i5
	ldstuba	[%l7 + %i5] 0x10,	%l4
	movne	%xcc,	%i0,	%l0
	edge32ln	%i1,	%g4,	%o3
	alignaddrl	%g7,	%o7,	%i6
	sdivcc	%g6,	0x04A3,	%g1
	mova	%icc,	%g3,	%l1
	fpadd32	%f28,	%f30,	%f22
	set	0x74, %o5
	lduwa	[%l7 + %o5] 0x10,	%o2
	edge8n	%i7,	%i2,	%o1
	tne	%xcc,	0x2
	fxnors	%f6,	%f4,	%f19
	brnz,a	%l6,	loop_2179
	andncc	%i3,	%o6,	%i4
	tgu	%xcc,	0x5
	be,a	loop_2180
loop_2179:
	bl,pn	%icc,	loop_2181
	tsubcc	%l3,	0x1DE5,	%g5
	taddcctv	%i5,	%l5,	%o0
loop_2180:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2181:
	movcc	%icc,	%l2,	%o4
	movcs	%xcc,	%g2,	%l4
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x1f
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i0,	%o5
	sir	0x100C
	edge32l	%i1,	%g4,	%l0
	andn	%g7,	0x0064,	%o3
	orn	%i6,	0x1407,	%o7
	nop
	setx	0x8D53D6F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xF9C1A0BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f4,	%f21
	te	%icc,	0x6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x64] %asi,	%g1
	fbue,a	%fcc1,	loop_2182
	fornot1s	%f26,	%f6,	%f6
	fmul8ulx16	%f14,	%f28,	%f4
	fmovsg	%icc,	%f26,	%f10
loop_2182:
	fsrc2	%f26,	%f10
	orncc	%g3,	%g6,	%o2
	fxor	%f20,	%f14,	%f20
	movneg	%xcc,	%l1,	%i2
	fmul8x16au	%f31,	%f18,	%f20
	movrgez	%o1,	%l6,	%i7
	array32	%o6,	%i3,	%i4
	bl,pn	%xcc,	loop_2183
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f4
	fxtod	%f4,	%f12
	tvs	%xcc,	0x7
	te	%icc,	0x4
loop_2183:
	bvs,a,pt	%icc,	loop_2184
	add	%g5,	%l3,	%i5
	xor	%l5,	0x1D0E,	%o0
	tg	%icc,	0x0
loop_2184:
	ldx	[%l7 + 0x30],	%l2
	nop
	setx	0x807B29D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fxor	%f30,	%f20,	%f16
	edge16n	%o4,	%l4,	%g2
	fbe	%fcc0,	loop_2185
	tge	%icc,	0x7
	andncc	%o5,	%i0,	%i1
	ldub	[%l7 + 0x31],	%l0
loop_2185:
	movvc	%icc,	%g4,	%o3
	fmovse	%xcc,	%f6,	%f24
	edge8ln	%g7,	%o7,	%i6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x68] %asi,	%g3
	popc	%g1,	%o2
	movrlz	%g6,	0x323,	%i2
	fzero	%f28
	sllx	%l1,	0x1E,	%l6
	alignaddr	%o1,	%i7,	%i3
	wr	%g0,	0x0c,	%asi
	sta	%f18,	[%l7 + 0x08] %asi
	array16	%o6,	%i4,	%l3
	tvc	%icc,	0x5
	edge8l	%g5,	%i5,	%o0
	tl	%xcc,	0x5
	fmovdle	%icc,	%f22,	%f26
	fnor	%f22,	%f2,	%f20
	wr	%g0,	0x2b,	%asi
	stwa	%l5,	[%l7 + 0x24] %asi
	membar	#Sync
	movrgz	%o4,	0x072,	%l4
	tcs	%xcc,	0x3
	edge32l	%l2,	%o5,	%i0
	set	0x10, %i6
	prefetcha	[%l7 + %i6] 0x15,	 0x3
	udivcc	%i1,	0x1E17,	%l0
	fbo	%fcc1,	loop_2186
	tcc	%xcc,	0x1
	umul	%o3,	%g7,	%o7
	movrgz	%i6,	%g4,	%g1
loop_2186:
	brz,a	%g3,	loop_2187
	edge32	%o2,	%g6,	%i2
	nop
	setx	0x92C1EE3495AADB4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x2170CCA8B3534253,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f8,	%f22
	sdivcc	%l1,	0x1495,	%l6
loop_2187:
	tg	%icc,	0x0
	edge8	%o1,	%i3,	%o6
	tgu	%xcc,	0x4
	nop
	setx	0xD5130202,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x8FAC9856,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f9,	%f13
	fmovde	%xcc,	%f9,	%f6
	taddcc	%i7,	%l3,	%g5
	fmovdcc	%xcc,	%f15,	%f20
	movle	%icc,	%i4,	%i5
	array16	%o0,	%o4,	%l5
	bvc,a	%icc,	loop_2188
	umulcc	%l4,	%l2,	%i0
	xnor	%o5,	%g2,	%l0
	fbule,a	%fcc0,	loop_2189
loop_2188:
	tg	%icc,	0x7
	alignaddr	%o3,	%g7,	%o7
	edge8n	%i6,	%g4,	%g1
loop_2189:
	membar	0x60
	udivcc	%i1,	0x1BE6,	%g3
	umul	%g6,	%o2,	%l1
	fmovsne	%icc,	%f11,	%f15
	edge16n	%l6,	%i2,	%i3
	bn,pn	%icc,	loop_2190
	fmovdcs	%xcc,	%f6,	%f20
	andn	%o6,	0x1503,	%i7
	umulcc	%o1,	0x1562,	%l3
loop_2190:
	move	%icc,	%g5,	%i5
	set	0x4B, %o2
	stba	%i4,	[%l7 + %o2] 0x18
	umul	%o0,	%l5,	%l4
	orncc	%o4,	0x1FC3,	%i0
	movre	%l2,	0x32B,	%g2
	movrlz	%o5,	%o3,	%l0
	fmul8x16al	%f8,	%f12,	%f8
	movpos	%icc,	%g7,	%i6
	fbule	%fcc0,	loop_2191
	popc	0x137C,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x3
loop_2191:
	edge32ln	%o7,	%g1,	%g3
	ldsb	[%l7 + 0x76],	%i1
	tg	%icc,	0x1
	andn	%o2,	%g6,	%l1
	ldsb	[%l7 + 0x1C],	%l6
	nop
	setx	0x91CCB34C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f12
	nop
	setx	0x309652AECCAD229E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xBBCC2834B0841B3E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f16,	%f24
	bleu	loop_2192
	fbue,a	%fcc2,	loop_2193
	nop
	setx	0x6D18FB6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xF61ECB63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f16,	%f26
	fmovdcc	%xcc,	%f0,	%f26
loop_2192:
	prefetch	[%l7 + 0x40],	 0x0
loop_2193:
	movg	%icc,	%i3,	%o6
	stw	%i7,	[%l7 + 0x5C]
	tgu	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,pn	%icc,	loop_2194
	be,pn	%icc,	loop_2195
	bpos,a	%xcc,	loop_2196
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2194:
	movn	%icc,	%i2,	%o1
loop_2195:
	bgu,a	loop_2197
loop_2196:
	edge16n	%g5,	%i5,	%l3
	nop
	fitos	%f9,	%f17
	fbn	%fcc1,	loop_2198
loop_2197:
	edge16	%i4,	%o0,	%l4
	fandnot2	%f28,	%f22,	%f28
	ble,a,pt	%icc,	loop_2199
loop_2198:
	call	loop_2200
	ld	[%l7 + 0x40],	%f19
	tsubcc	%l5,	%o4,	%l2
loop_2199:
	fpack32	%f0,	%f28,	%f30
loop_2200:
	tl	%xcc,	0x6
	brlz	%g2,	loop_2201
	tge	%xcc,	0x4
	sdivcc	%i0,	0x00F0,	%o5
	movrgz	%l0,	%o3,	%g7
loop_2201:
	fba	%fcc1,	loop_2202
	sra	%g4,	%i6,	%o7
	movpos	%icc,	%g1,	%i1
	flush	%l7 + 0x28
loop_2202:
	nop
	set	0x68, %g4
	ldxa	[%l7 + %g4] 0x14,	%g3
	tcs	%xcc,	0x2
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bpos,a	%icc,	loop_2203
	tne	%xcc,	0x1
	edge16ln	%o2,	%g6,	%l1
	fmul8ulx16	%f10,	%f20,	%f20
loop_2203:
	fpsub32s	%f11,	%f12,	%f19
	edge16l	%l6,	%i3,	%o6
	fornot2s	%f19,	%f0,	%f21
	bne	%xcc,	loop_2204
	fmovsn	%icc,	%f18,	%f20
	srlx	%i2,	0x16,	%i7
	srl	%o1,	0x02,	%i5
loop_2204:
	sub	%l3,	%i4,	%o0
	fcmple16	%f14,	%f6,	%l4
	set	0x46, %l0
	lduha	[%l7 + %l0] 0x19,	%g5
	bvc,a,pt	%xcc,	loop_2205
	sir	0x1D6E
	orcc	%o4,	%l5,	%l2
	sir	0x0F19
loop_2205:
	edge16	%i0,	%g2,	%o5
	tpos	%xcc,	0x1
	srl	%l0,	%g7,	%g4
	movpos	%icc,	%i6,	%o7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	fmovdpos	%icc,	%f26,	%f12
	taddcc	%g1,	0x0099,	%i1
	movre	%g3,	0x31A,	%g6
	ldsw	[%l7 + 0x54],	%o2
	fbuge,a	%fcc0,	loop_2206
	alignaddrl	%l6,	%i3,	%o6
	tge	%icc,	0x5
	sllx	%i2,	%i7,	%l1
loop_2206:
	fmovrdgez	%i5,	%f26,	%f2
	prefetch	[%l7 + 0x44],	 0x0
	brnz	%o1,	loop_2207
	sdiv	%l3,	0x16F1,	%i4
	bg	%icc,	loop_2208
	sub	%o0,	0x099C,	%g5
loop_2207:
	tneg	%icc,	0x1
	udivx	%l4,	0x1E03,	%o4
loop_2208:
	tcc	%icc,	0x3
	edge16	%l5,	%i0,	%l2
	and	%o5,	%g2,	%g7
	te	%icc,	0x5
	udivcc	%l0,	0x1912,	%g4
	movpos	%icc,	%i6,	%o3
	mova	%icc,	%o7,	%g1
	stx	%i1,	[%l7 + 0x40]
	fxnor	%f6,	%f12,	%f22
	edge16n	%g6,	%o2,	%g3
	mulx	%l6,	%o6,	%i3
	set	0x30, %g6
	ldswa	[%l7 + %g6] 0x88,	%i2
	tgu	%icc,	0x0
	sir	0x1DD0
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x19,	%l0
	tge	%xcc,	0x4
	taddcctv	%i7,	%o1,	%l3
	bge,a,pn	%icc,	loop_2209
	fmovrde	%i5,	%f6,	%f22
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o0
loop_2209:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x2C] %asi,	%i4
	and	%g5,	%l4,	%o4
	fbuge,a	%fcc0,	loop_2210
	fpsub16	%f28,	%f28,	%f2
	alignaddr	%l5,	%i0,	%l2
	fones	%f17
loop_2210:
	nop
	fitos	%f0,	%f11
	fstox	%f11,	%f4
	fxtos	%f4,	%f21
	tcs	%icc,	0x4
	set	0x30, %i4
	stwa	%g2,	[%l7 + %i4] 0x2f
	membar	#Sync
	fsrc2	%f14,	%f10
	xnor	%g7,	%l0,	%g4
	fmovdl	%xcc,	%f16,	%f16
	fxors	%f7,	%f16,	%f28
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o5,	%o3
	bl	loop_2211
	edge8	%i6,	%g1,	%o7
	movg	%xcc,	%g6,	%o2
	tn	%icc,	0x5
loop_2211:
	movvs	%xcc,	%g3,	%i1
	sdivcc	%o6,	0x1AC4,	%l6
	alignaddrl	%i3,	%l1,	%i7
	fbn	%fcc2,	loop_2212
	tcs	%xcc,	0x2
	tgu	%xcc,	0x2
	sra	%i2,	%o1,	%l3
loop_2212:
	edge8ln	%i5,	%o0,	%i4
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x59] %asi,	%g5
	nop
	fitod	%f10,	%f28
	fdtox	%f28,	%f12
	sra	%o4,	0x17,	%l4
	tg	%icc,	0x3
	fmovsvc	%icc,	%f28,	%f25
	nop
	setx	0x64277DE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xF9984E3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f27,	%f17
	tgu	%xcc,	0x4
	addccc	%i0,	0x135D,	%l2
	edge16	%l5,	%g2,	%l0
	tpos	%xcc,	0x1
	bpos,pt	%icc,	loop_2213
	fmovspos	%icc,	%f1,	%f7
	alignaddrl	%g7,	%o5,	%o3
	tvc	%xcc,	0x6
loop_2213:
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%i6
	edge8n	%g1,	%g4,	%g6
	fbge,a	%fcc1,	loop_2214
	fble	%fcc2,	loop_2215
	fmovsgu	%xcc,	%f6,	%f27
	smul	%o7,	%o2,	%g3
loop_2214:
	nop
	set	0x72, %i1
	ldsha	[%l7 + %i1] 0x19,	%i1
loop_2215:
	smul	%l6,	%i3,	%l1
	edge32ln	%i7,	%i2,	%o1
	fbuge	%fcc0,	loop_2216
	sll	%o6,	0x13,	%i5
	addc	%l3,	%o0,	%g5
	bn,a	loop_2217
loop_2216:
	array32	%o4,	%i4,	%i0
	nop
	setx	0xF3D84A6135C053ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB29DC6FDF306BE93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f18,	%f6
	addccc	%l2,	0x1464,	%l4
loop_2217:
	orn	%l5,	%l0,	%g2
	movpos	%icc,	%o5,	%o3
	subc	%g7,	0x0E56,	%i6
	brz,a	%g1,	loop_2218
	membar	0x70
	movrgz	%g4,	%g6,	%o7
	tgu	%icc,	0x0
loop_2218:
	edge16	%g3,	%o2,	%l6
	movneg	%xcc,	%i3,	%i1
	fxnor	%f28,	%f0,	%f10
	fxor	%f22,	%f14,	%f14
	or	%l1,	0x02F0,	%i2
	tge	%xcc,	0x3
	array32	%i7,	%o6,	%o1
	fbge	%fcc3,	loop_2219
	nop
	fitod	%f2,	%f14
	fdtos	%f14,	%f26
	fmovrdgez	%l3,	%f8,	%f16
	ldd	[%l7 + 0x68],	%f14
loop_2219:
	srax	%i5,	0x1A,	%o0
	bvc	%xcc,	loop_2220
	sth	%o4,	[%l7 + 0x18]
	bpos,a,pt	%xcc,	loop_2221
	fcmple16	%f10,	%f20,	%i4
loop_2220:
	add	%g5,	0x132D,	%i0
	movn	%xcc,	%l4,	%l2
loop_2221:
	sethi	0x0AF2,	%l0
	or	%l5,	%o5,	%o3
	call	loop_2222
	faligndata	%f30,	%f28,	%f6
	fbn	%fcc2,	loop_2223
	movg	%icc,	%g7,	%g2
loop_2222:
	fmovdneg	%icc,	%f6,	%f8
	tl	%icc,	0x3
loop_2223:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g1,	%g4,	%i6
	fbul	%fcc1,	loop_2224
	fpsub16	%f10,	%f28,	%f30
	movleu	%xcc,	%g6,	%o7
	movgu	%xcc,	%g3,	%o2
loop_2224:
	popc	%l6,	%i3
	tl	%icc,	0x1
	edge8ln	%l1,	%i1,	%i7
	bne,pn	%xcc,	loop_2225
	movrgez	%o6,	0x19C,	%i2
	tn	%icc,	0x4
	nop
	fitos	%f9,	%f21
	fstod	%f21,	%f30
loop_2225:
	movrlez	%o1,	%l3,	%o0
	xnor	%i5,	%o4,	%g5
	fsrc2s	%f7,	%f25
	tcc	%xcc,	0x3
	sub	%i0,	0x06B4,	%i4
	membar	0x5F
	fmovdneg	%xcc,	%f16,	%f16
	edge16	%l4,	%l0,	%l2
	fmovs	%f20,	%f27
	xor	%l5,	0x0FC0,	%o3
	movrgez	%g7,	%g2,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x4
	tvs	%xcc,	0x2
	xorcc	%g1,	%g4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f26,	%f0,	%f28
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x42] %asi,	%o7
	xnor	%g6,	0x1CDF,	%o2
	tge	%xcc,	0x2
	mulx	%g3,	%i3,	%l1
	bgu,a	loop_2226
	movl	%icc,	%i1,	%i7
	ta	%xcc,	0x1
	ldsw	[%l7 + 0x4C],	%l6
loop_2226:
	and	%i2,	%o1,	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x0c,	%l3,	%o0
	movne	%xcc,	%o4,	%g5
	fpsub32s	%f15,	%f4,	%f7
	set	0x53, %o7
	lduba	[%l7 + %o7] 0x80,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f2,	%f19
	srl	%i4,	%i5,	%l0
	umul	%l4,	%l2,	%o3
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tsubcctv	%g7,	%g2,	%o5
	fpadd16	%f10,	%f26,	%f4
	nop
	setx	loop_2227,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%l5,	%g4,	%i6
	fbule,a	%fcc0,	loop_2228
	tcs	%icc,	0x0
loop_2227:
	movn	%xcc,	%o7,	%g1
	fandnot2s	%f30,	%f23,	%f22
loop_2228:
	movrne	%o2,	0x202,	%g3
	brlez,a	%g6,	loop_2229
	nop
	setx loop_2230, %l0, %l1
	jmpl %l1, %l1
	movneg	%icc,	%i1,	%i3
	tsubcctv	%i7,	0x059E,	%i2
loop_2229:
	fnot1	%f14,	%f20
loop_2230:
	addc	%o1,	0x0136,	%l6
	xnor	%l3,	0x04F3,	%o0
	fbuge,a	%fcc3,	loop_2231
	fors	%f28,	%f15,	%f5
	flush	%l7 + 0x14
	fzero	%f14
loop_2231:
	srl	%o6,	%o4,	%g5
	tvs	%xcc,	0x5
	sdivcc	%i0,	0x0878,	%i4
	mulx	%l0,	0x0F9F,	%i5
	tl	%icc,	0x7
	bleu,a,pt	%icc,	loop_2232
	tg	%icc,	0x1
	udivcc	%l4,	0x13C0,	%o3
	srlx	%g7,	%l2,	%g2
loop_2232:
	nop
	setx	0x5A24AA2020584992,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	tne	%icc,	0x0
	edge32ln	%o5,	%l5,	%i6
	sethi	0x0A54,	%g4
	fbe,a	%fcc2,	loop_2233
	orn	%g1,	0x1E28,	%o2
	movne	%icc,	%g3,	%g6
	array16	%o7,	%l1,	%i3
loop_2233:
	addccc	%i1,	0x0D1D,	%i2
	bneg,pn	%xcc,	loop_2234
	xnorcc	%i7,	0x066D,	%l6
	set	0x5A, %i0
	lduha	[%l7 + %i0] 0x81,	%o1
loop_2234:
	addc	%o0,	%l3,	%o6
	nop
	setx loop_2235, %l0, %l1
	jmpl %l1, %o4
	mova	%icc,	%i0,	%i4
	movrgez	%g5,	0x3BE,	%i5
	sll	%l4,	%l0,	%g7
loop_2235:
	nop
	wr	%g0,	0xea,	%asi
	stxa	%l2,	[%l7 + 0x40] %asi
	membar	#Sync
	udivcc	%o3,	0x139F,	%o5
	xor	%l5,	%i6,	%g4
	sllx	%g2,	%g1,	%g3
	nop
	fitos	%f7,	%f3
	fstox	%f3,	%f10
	fxtos	%f10,	%f12
	movpos	%icc,	%o2,	%g6
	bgu,a,pn	%icc,	loop_2236
	membar	0x1C
	stx	%l1,	[%l7 + 0x40]
	fble	%fcc3,	loop_2237
loop_2236:
	brlz,a	%i3,	loop_2238
	fpadd16s	%f10,	%f8,	%f9
	stb	%i1,	[%l7 + 0x2D]
loop_2237:
	nop
	setx	0x4E1BDD4E505CA9E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_2238:
	movre	%o7,	0x0EB,	%i2
	alignaddr	%i7,	%o1,	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l6,	%o6
	movrne	%o4,	0x09B,	%l3
	fmovrslez	%i0,	%f18,	%f13
	fsrc2s	%f30,	%f17
	fpadd32s	%f5,	%f0,	%f18
	movleu	%icc,	%i4,	%g5
	srax	%i5,	%l4,	%l0
	fba,a	%fcc3,	loop_2239
	bl	%icc,	loop_2240
	edge16l	%l2,	%g7,	%o5
	bg,pt	%icc,	loop_2241
loop_2239:
	edge32l	%l5,	%o3,	%i6
loop_2240:
	fpsub16	%f14,	%f4,	%f18
	bl	%icc,	loop_2242
loop_2241:
	brlez,a	%g4,	loop_2243
	or	%g1,	0x1164,	%g3
	nop
	setx	0xDF9FDDF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f28
loop_2242:
	and	%g2,	0x050F,	%o2
loop_2243:
	edge8n	%g6,	%i3,	%l1
	movrne	%o7,	%i2,	%i7
	set	0x50, %l6
	lduba	[%l7 + %l6] 0x0c,	%o1
	faligndata	%f18,	%f6,	%f10
	nop
	fitod	%f30,	%f12
	fmul8ulx16	%f4,	%f10,	%f14
	xnor	%i1,	0x1928,	%l6
	udivx	%o0,	0x0A37,	%o4
	subccc	%o6,	%i0,	%l3
	ldd	[%l7 + 0x58],	%f30
	movne	%xcc,	%g5,	%i4
	move	%icc,	%l4,	%l0
	bge,pn	%xcc,	loop_2244
	fpsub16	%f22,	%f20,	%f16
	udivcc	%i5,	0x07C1,	%l2
	move	%xcc,	%g7,	%o5
loop_2244:
	ldd	[%l7 + 0x78],	%f28
	brgz,a	%o3,	loop_2245
	ldsh	[%l7 + 0x1A],	%i6
	fpack16	%f0,	%f5
	tpos	%xcc,	0x6
loop_2245:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f4,	%f16,	%f0
	ba,a	loop_2246
	movrgz	%g4,	%l5,	%g3
	array8	%g2,	%g1,	%g6
	nop
	setx	0x3AC6DBCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xF640E58D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f15,	%f5
loop_2246:
	ta	%xcc,	0x2
	movrgez	%i3,	%o2,	%l1
	addccc	%i2,	%i7,	%o1
	fmovsvc	%xcc,	%f21,	%f20
	edge16	%o7,	%l6,	%i1
	xor	%o0,	0x08CA,	%o4
	fpsub16s	%f30,	%f13,	%f5
	fornot1	%f16,	%f20,	%f8
	xor	%i0,	0x1A07,	%l3
	addccc	%o6,	%g5,	%l4
	tgu	%icc,	0x1
	srl	%i4,	0x0B,	%i5
	movl	%icc,	%l0,	%l2
	fbn,a	%fcc2,	loop_2247
	srl	%g7,	0x04,	%o3
	nop
	setx	0xC1FF5BF819BE74D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x7A6FE4770B9269D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f20
	te	%xcc,	0x6
loop_2247:
	fmovde	%icc,	%f25,	%f5
	set	0x24, %i2
	lda	[%l7 + %i2] 0x04,	%f4
	tsubcc	%o5,	%i6,	%l5
	alignaddrl	%g3,	%g4,	%g1
	movvc	%xcc,	%g2,	%i3
	flush	%l7 + 0x4C
	xorcc	%o2,	%g6,	%l1
	ldsw	[%l7 + 0x58],	%i2
	fabss	%f13,	%f14
	fbe	%fcc2,	loop_2248
	tneg	%xcc,	0x1
	bvc	loop_2249
	stb	%o1,	[%l7 + 0x41]
loop_2248:
	udiv	%i7,	0x1E1E,	%o7
	edge16ln	%i1,	%o0,	%l6
loop_2249:
	array32	%o4,	%i0,	%o6
	alignaddr	%g5,	%l3,	%i4
	edge32l	%i5,	%l0,	%l2
	fnot2	%f24,	%f22
	membar	0x2F
	fcmpeq16	%f18,	%f20,	%l4
	add	%g7,	%o5,	%o3
	move	%icc,	%l5,	%i6
	ba,a	loop_2250
	move	%xcc,	%g4,	%g3
	fcmpgt32	%f22,	%f30,	%g1
	edge8l	%i3,	%g2,	%g6
loop_2250:
	bpos,pt	%icc,	loop_2251
	mulx	%o2,	%i2,	%l1
	fpsub32	%f18,	%f2,	%f30
	ldsw	[%l7 + 0x5C],	%o1
loop_2251:
	srlx	%i7,	%o7,	%i1
	lduh	[%l7 + 0x28],	%l6
	brz	%o4,	loop_2252
	fpsub32s	%f21,	%f24,	%f29
	fbe	%fcc3,	loop_2253
	ldsw	[%l7 + 0x3C],	%o0
loop_2252:
	fmul8sux16	%f14,	%f6,	%f0
	edge8ln	%o6,	%g5,	%i0
loop_2253:
	xorcc	%l3,	%i4,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%l2,	%f18,	%f14
	nop
	setx	0x42F244F72F41410F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f10
	tne	%xcc,	0x6
	sll	%i5,	0x02,	%g7
	fmovsgu	%xcc,	%f25,	%f14
	or	%o5,	%o3,	%l5
	ldsw	[%l7 + 0x50],	%i6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%l4
	andn	%g1,	%g3,	%i3
	brgez	%g2,	loop_2254
	fbuge	%fcc2,	loop_2255
	brz	%o2,	loop_2256
	fpackfix	%f14,	%f22
loop_2254:
	edge16ln	%g6,	%i2,	%l1
loop_2255:
	nop
	set	0x10, %g5
	ldswa	[%l7 + %g5] 0x18,	%o1
loop_2256:
	tg	%xcc,	0x6
	ba,a	%icc,	loop_2257
	or	%o7,	%i1,	%l6
	te	%xcc,	0x7
	fmovdneg	%icc,	%f11,	%f29
loop_2257:
	alignaddr	%o4,	%i7,	%o6
	fmovrdgez	%g5,	%f12,	%f20
	edge8	%i0,	%l3,	%i4
	ta	%icc,	0x7
	std	%f0,	[%l7 + 0x20]
	andcc	%l0,	%l2,	%o0
	subccc	%g7,	%i5,	%o3
	movrne	%o5,	0x2E8,	%i6
	alignaddrl	%g4,	%l4,	%g1
	sdiv	%g3,	0x09D6,	%i3
	tvc	%icc,	0x0
	movneg	%icc,	%l5,	%o2
	movcs	%xcc,	%g6,	%i2
	tleu	%icc,	0x0
	movgu	%icc,	%g2,	%o1
	nop
	setx	0x3461ACAC853C0442,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x677D30AC364CA855,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f20,	%f14
	brgz	%l1,	loop_2258
	fmovrsne	%i1,	%f27,	%f20
	smul	%o7,	%o4,	%l6
	bcc,pt	%xcc,	loop_2259
loop_2258:
	xorcc	%i7,	0x03B1,	%o6
	move	%icc,	%i0,	%g5
	tsubcctv	%i4,	0x1532,	%l0
loop_2259:
	ldsw	[%l7 + 0x74],	%l3
	edge16ln	%o0,	%l2,	%g7
	movcc	%xcc,	%i5,	%o5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o3,	%i6
	edge32ln	%g4,	%l4,	%g3
	stx	%i3,	[%l7 + 0x58]
	addc	%l5,	0x0982,	%g1
	tcs	%icc,	0x6
	tvc	%xcc,	0x7
	tgu	%icc,	0x4
	sra	%g6,	0x05,	%i2
	ba,a	loop_2260
	movne	%icc,	%o2,	%g2
	tvs	%icc,	0x0
	movrgz	%l1,	0x378,	%i1
loop_2260:
	fbe	%fcc0,	loop_2261
	fbn	%fcc3,	loop_2262
	tge	%icc,	0x4
	udivx	%o7,	0x1CDF,	%o1
loop_2261:
	subc	%l6,	%i7,	%o4
loop_2262:
	ldub	[%l7 + 0x49],	%o6
	tleu	%xcc,	0x1
	fpadd16s	%f24,	%f25,	%f26
	bleu	loop_2263
	edge16l	%i0,	%i4,	%g5
	call	loop_2264
	udivx	%l3,	0x1C15,	%l0
loop_2263:
	edge8	%l2,	%o0,	%i5
	movrlez	%o5,	0x325,	%g7
loop_2264:
	movrgez	%i6,	0x018,	%g4
	fmovdn	%xcc,	%f29,	%f20
	edge16	%l4,	%o3,	%g3
	fbe	%fcc1,	loop_2265
	sethi	0x1C43,	%l5
	taddcc	%g1,	%i3,	%i2
	edge32l	%g6,	%o2,	%g2
loop_2265:
	movg	%icc,	%i1,	%l1
	array32	%o1,	%l6,	%o7
	add	%o4,	0x0A44,	%i7
	bgu,pt	%icc,	loop_2266
	and	%i0,	0x1E6D,	%i4
	fmovsle	%xcc,	%f9,	%f21
	fbne	%fcc1,	loop_2267
loop_2266:
	edge8n	%o6,	%g5,	%l3
	umulcc	%l2,	0x1B1B,	%o0
	ldstub	[%l7 + 0x34],	%i5
loop_2267:
	srlx	%l0,	0x1F,	%g7
	srlx	%i6,	0x1C,	%g4
	edge32l	%o5,	%o3,	%l4
	movrlez	%g3,	%g1,	%l5
	orncc	%i3,	0x1F94,	%i2
	srl	%g6,	%g2,	%i1
	edge32	%o2,	%l1,	%o1
	movgu	%xcc,	%o7,	%l6
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xe2,	%i6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i0
	fand	%f14,	%f18,	%f2
	movvc	%icc,	%i4,	%o6
	fpadd16s	%f19,	%f30,	%f22
	ldd	[%l7 + 0x08],	%g4
	fmovdle	%icc,	%f31,	%f29
	tneg	%icc,	0x4
	stbar
	array16	%l2,	%l3,	%o0
	bcc,pt	%icc,	loop_2268
	fmovdcs	%xcc,	%f2,	%f20
	movrgez	%i5,	0x005,	%g7
	fxor	%f16,	%f22,	%f4
loop_2268:
	xnorcc	%l0,	0x087D,	%g4
	fcmpgt32	%f30,	%f4,	%i6
	tgu	%icc,	0x0
	smul	%o5,	%o3,	%g3
	edge32n	%l4,	%g1,	%l5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x1e
	membar	#Sync
	xor	%i3,	%g6,	%i2
	and	%i1,	%g2,	%o2
	mulscc	%o1,	0x03B8,	%o7
	subccc	%l1,	%l6,	%i7
	nop
	fitos	%f6,	%f15
	fstod	%f15,	%f18
	move	%icc,	%i0,	%i4
	lduh	[%l7 + 0x46],	%o4
	orcc	%g5,	%o6,	%l2
	tne	%icc,	0x2
	edge32	%o0,	%i5,	%g7
	brlz	%l3,	loop_2269
	fcmple16	%f28,	%f6,	%g4
	fabsd	%f6,	%f12
	fmovrsne	%i6,	%f2,	%f24
loop_2269:
	mulx	%o5,	0x19A3,	%o3
	fbul	%fcc2,	loop_2270
	nop
	setx	0x904952F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	addcc	%l0,	0x1557,	%l4
	mova	%xcc,	%g1,	%g3
loop_2270:
	edge32ln	%i3,	%l5,	%g6
	edge16l	%i2,	%g2,	%o2
	sll	%o1,	%i1,	%o7
	udivx	%l6,	0x0D53,	%l1
	nop
	setx	0x104F4CD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fnor	%f16,	%f2,	%f4
	call	loop_2271
	flush	%l7 + 0x2C
	fbu,a	%fcc1,	loop_2272
	movne	%xcc,	%i0,	%i4
loop_2271:
	tvs	%icc,	0x3
	fble	%fcc0,	loop_2273
loop_2272:
	movrlz	%i7,	%g5,	%o6
	call	loop_2274
	tl	%icc,	0x0
loop_2273:
	add	%l2,	0x0674,	%o0
	edge32ln	%o4,	%i5,	%g7
loop_2274:
	edge16n	%l3,	%i6,	%o5
	or	%g4,	0x0072,	%o3
	stx	%l4,	[%l7 + 0x40]
	tvs	%xcc,	0x7
	fandnot2s	%f30,	%f4,	%f22
	movcs	%icc,	%g1,	%l0
	fcmpeq16	%f10,	%f2,	%i3
	fnegd	%f12,	%f30
	sllx	%l5,	%g3,	%g6
	tleu	%icc,	0x3
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x0c,	 0x1
	movrne	%o2,	%o1,	%i1
	edge8	%i2,	%o7,	%l6
	std	%f6,	[%l7 + 0x08]
	sra	%l1,	0x1F,	%i4
	tle	%icc,	0x3
	sllx	%i7,	0x08,	%i0
	fcmpeq32	%f30,	%f4,	%o6
	fxor	%f12,	%f10,	%f6
	tleu	%xcc,	0x2
	ldub	[%l7 + 0x79],	%g5
	pdist	%f18,	%f22,	%f14
	subc	%o0,	%o4,	%i5
	stbar
	fbuge,a	%fcc3,	loop_2275
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%g7,	0x13AD,	%l2
loop_2275:
	nop
	setx	0x5EC6C77595D521C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f6
	fbge	%fcc3,	loop_2277
loop_2276:
	sir	0x01C8
	stx	%i6,	[%l7 + 0x40]
	movrgez	%l3,	%o5,	%o3
loop_2277:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	srl	%l4,	%g4,	%l0
	bl,a	loop_2278
	lduh	[%l7 + 0x78],	%i3
	tvs	%icc,	0x2
	edge16ln	%l5,	%g3,	%g1
loop_2278:
	fmovscs	%icc,	%f4,	%f23
	tvs	%xcc,	0x0
	smul	%g2,	0x1FDD,	%g6
	mova	%icc,	%o1,	%o2
	ta	%icc,	0x3
	te	%xcc,	0x7
	or	%i2,	%o7,	%i1
	movvs	%xcc,	%l6,	%i4
	movg	%icc,	%l1,	%i7
	fmovse	%xcc,	%f26,	%f1
	movrlz	%i0,	0x119,	%o6
	tleu	%xcc,	0x1
	bpos	%icc,	loop_2279
	movg	%icc,	%o0,	%o4
	fnot1s	%f13,	%f22
	fmovdvc	%xcc,	%f31,	%f28
loop_2279:
	nop
	setx	0x604B7881,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	sub	%i5,	0x1368,	%g7
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f12
	fxtos	%f12,	%f0
	fexpand	%f0,	%f28
	tge	%xcc,	0x2
	set	0x60, %g1
	stwa	%l2,	[%l7 + %g1] 0x2b
	membar	#Sync
	tleu	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x6
	tcc	%xcc,	0x3
	fexpand	%f20,	%f20
	movl	%xcc,	%g5,	%i6
	set	0x4A, %l4
	lduba	[%l7 + %l4] 0x10,	%l3
	st	%f9,	[%l7 + 0x70]
	ldd	[%l7 + 0x40],	%o4
	tgu	%xcc,	0x5
	addcc	%l4,	0x12F1,	%g4
	andcc	%o3,	0x1725,	%l0
	bcc,pn	%icc,	loop_2280
	mulx	%i3,	0x13BF,	%g3
	movg	%icc,	%l5,	%g1
	fmovdne	%xcc,	%f2,	%f13
loop_2280:
	edge16n	%g2,	%o1,	%g6
	ldd	[%l7 + 0x70],	%f0
	tvc	%icc,	0x1
	subcc	%o2,	%i2,	%o7
	be	%icc,	loop_2281
	sir	0x1F91
	move	%icc,	%i1,	%l6
	sdiv	%l1,	0x062F,	%i7
loop_2281:
	umulcc	%i4,	%o6,	%i0
	sllx	%o0,	%o4,	%g7
	tg	%icc,	0x3
	stx	%i5,	[%l7 + 0x78]
	tvs	%xcc,	0x7
	tleu	%icc,	0x1
	st	%f11,	[%l7 + 0x4C]
	tl	%icc,	0x5
	edge8n	%g5,	%i6,	%l2
	movle	%icc,	%l3,	%o5
	fnegs	%f0,	%f27
	fmovrdlez	%g4,	%f6,	%f30
	tge	%icc,	0x0
	edge8ln	%l4,	%o3,	%i3
	te	%icc,	0x3
	fpack32	%f4,	%f0,	%f2
	umul	%g3,	0x042F,	%l0
	addc	%g1,	0x05A3,	%l5
	fmovdvs	%xcc,	%f17,	%f11
	subccc	%o1,	%g6,	%o2
	brgez	%g2,	loop_2282
	tsubcc	%i2,	0x06E8,	%o7
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f10
	sethi	0x1DC9,	%l6
loop_2282:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x54] %asi
	membar	0x3D
	ldx	[%l7 + 0x48],	%l1
	movpos	%icc,	%i1,	%i4
	mulscc	%o6,	%i0,	%o0
	umulcc	%o4,	0x1BD6,	%g7
	edge32l	%i7,	%i5,	%g5
	fmovdgu	%icc,	%f18,	%f7
	subcc	%i6,	%l3,	%l2
	tsubcctv	%o5,	0x1B48,	%l4
	fmovsge	%xcc,	%f1,	%f3
	array8	%o3,	%g4,	%i3
	fmovdcc	%xcc,	%f15,	%f27
	sllx	%l0,	%g3,	%l5
	tsubcctv	%o1,	0x0773,	%g6
	srlx	%g1,	%g2,	%o2
	tcc	%xcc,	0x0
	xnorcc	%o7,	%l6,	%l1
	fbn,a	%fcc3,	loop_2283
	movne	%xcc,	%i2,	%i4
	bvs	%icc,	loop_2284
	sra	%i1,	%o6,	%o0
loop_2283:
	movrlez	%i0,	%g7,	%i7
	fmovrsne	%i5,	%f30,	%f8
loop_2284:
	sdivx	%o4,	0x104E,	%g5
	movpos	%icc,	%l3,	%l2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o5,	%l4
	edge32l	%i6,	%g4,	%o3
	faligndata	%f12,	%f4,	%f26
	subcc	%l0,	0x19F3,	%i3
	xnorcc	%l5,	0x1E9A,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g3,	%g6
	subc	%g2,	0x10FF,	%o2
	sll	%o7,	0x15,	%l6
	orncc	%l1,	0x05B5,	%g1
	ldsh	[%l7 + 0x18],	%i4
	orcc	%i1,	0x1CE9,	%i2
	nop
	setx	0xA7F8451D51011CFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0FE6B2C24720802B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f16,	%f16
	andn	%o0,	0x1562,	%i0
	faligndata	%f14,	%f22,	%f6
	alignaddrl	%o6,	%g7,	%i5
	fpadd32	%f6,	%f20,	%f16
	move	%icc,	%o4,	%g5
	movleu	%icc,	%l3,	%l2
	udivcc	%i7,	0x189D,	%l4
	tneg	%icc,	0x6
	addccc	%i6,	%g4,	%o3
	umul	%l0,	%o5,	%i3
	array8	%l5,	%o1,	%g3
	tge	%icc,	0x1
	nop
	setx loop_2285, %l0, %l1
	jmpl %l1, %g2
	xor	%g6,	%o2,	%o7
	membar	0x6A
	sir	0x079D
loop_2285:
	array32	%l1,	%l6,	%i4
	sllx	%i1,	%i2,	%g1
	fsrc2	%f22,	%f16
	andncc	%o0,	%i0,	%o6
	nop
	setx	loop_2286,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%i5,	%o4,	%g5
	fmovdl	%icc,	%f4,	%f25
	movpos	%icc,	%l3,	%l2
loop_2286:
	sra	%i7,	%g7,	%i6
	ldstub	[%l7 + 0x4A],	%l4
	fnot1	%f12,	%f6
	bne	loop_2287
	movcs	%xcc,	%o3,	%g4
	bcc,a	loop_2288
	st	%f19,	[%l7 + 0x58]
loop_2287:
	tsubcctv	%o5,	0x137C,	%i3
	fmovsne	%xcc,	%f2,	%f1
loop_2288:
	taddcc	%l0,	%o1,	%l5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	edge8l	%g6,	%g3,	%o7
	edge32n	%l1,	%o2,	%i4
	fmovrse	%i1,	%f13,	%f14
	movvc	%icc,	%i2,	%g1
	popc	%l6,	%o0
	sdivcc	%o6,	0x0870,	%i5
	nop
	setx	0x40632B50,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	edge8n	%i0,	%o4,	%g5
	fmovsvc	%icc,	%f3,	%f19
	nop
	setx	0x305FDF95B7E5CF1C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x2321CF6EE3E6F138,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f28,	%f4
	ldsw	[%l7 + 0x38],	%l2
	set	0x1C, %l5
	swapa	[%l7 + %l5] 0x18,	%l3
	movcs	%xcc,	%g7,	%i7
	fbn,a	%fcc1,	loop_2289
	subccc	%l4,	0x0906,	%i6
	movrlz	%g4,	0x0AA,	%o3
	fcmpeq32	%f6,	%f14,	%i3
loop_2289:
	tneg	%xcc,	0x6
	movpos	%xcc,	%o5,	%o1
	st	%f8,	[%l7 + 0x20]
	fcmpne32	%f28,	%f18,	%l0
	fmovdge	%xcc,	%f9,	%f25
	lduw	[%l7 + 0x14],	%g2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	ldstub	[%l7 + 0x5B],	%l5
	tne	%icc,	0x5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x54] %asi,	%o7
	be,pn	%icc,	loop_2290
	bcc	loop_2291
	fmovsgu	%xcc,	%f0,	%f1
	bcs	%xcc,	loop_2292
loop_2290:
	movn	%icc,	%l1,	%g3
loop_2291:
	fand	%f12,	%f4,	%f16
	tvs	%xcc,	0x4
loop_2292:
	tsubcctv	%o2,	%i4,	%i2
	bpos	%icc,	loop_2293
	tvc	%icc,	0x6
	fblg,a	%fcc2,	loop_2294
	tsubcc	%i1,	%l6,	%g1
loop_2293:
	tsubcc	%o6,	%i5,	%o0
	orncc	%o4,	0x060E,	%g5
loop_2294:
	stw	%l2,	[%l7 + 0x58]
	udiv	%i0,	0x0433,	%g7
	or	%i7,	0x0A00,	%l4
	tvc	%icc,	0x4
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	popc	%i6,	%g4
	fandnot2s	%f24,	%f28,	%f6
	sethi	0x165F,	%l3
	ldstub	[%l7 + 0x21],	%i3
	te	%icc,	0x2
	edge32n	%o3,	%o5,	%l0
	or	%g2,	0x0CEA,	%g6
	movg	%xcc,	%o1,	%l5
	fzeros	%f31
	ldd	[%l7 + 0x78],	%l0
	ldsw	[%l7 + 0x3C],	%o7
	edge8	%o2,	%i4,	%g3
	fba,a	%fcc2,	loop_2295
	mulx	%i2,	0x09D6,	%i1
	movrgz	%g1,	0x3AE,	%l6
	tneg	%xcc,	0x3
loop_2295:
	tpos	%xcc,	0x0
	sllx	%o6,	%o0,	%o4
	tn	%icc,	0x7
	bl,a,pt	%xcc,	loop_2296
	fmovrse	%i5,	%f29,	%f17
	ble,a,pn	%icc,	loop_2297
	sub	%l2,	0x12FA,	%g5
loop_2296:
	tg	%icc,	0x2
	tge	%icc,	0x1
loop_2297:
	stx	%g7,	[%l7 + 0x50]
	fmovdcs	%xcc,	%f7,	%f29
	movleu	%xcc,	%i7,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%g4
	xnor	%i6,	%l3,	%i3
	nop
	fitod	%f12,	%f6
	fdtoi	%f6,	%f20
	edge8	%o3,	%o5,	%l0
	srax	%g2,	%g6,	%l5
	tsubcc	%o1,	0x1875,	%l1
	sll	%o7,	%i4,	%g3
	tne	%icc,	0x7
	edge32n	%i2,	%i1,	%g1
	te	%xcc,	0x3
	bcs,pn	%icc,	loop_2298
	sdiv	%o2,	0x018B,	%l6
	fmovdge	%xcc,	%f15,	%f8
	tpos	%xcc,	0x2
loop_2298:
	array8	%o6,	%o0,	%i5
	movcc	%xcc,	%o4,	%l2
	andcc	%g5,	0x1A9A,	%i7
	xor	%g7,	0x1D96,	%l4
	movvs	%xcc,	%i0,	%i6
	smulcc	%l3,	%i3,	%o3
	movrlez	%g4,	%o5,	%l0
	fmovspos	%icc,	%f1,	%f30
	set	0x22, %l3
	stha	%g6,	[%l7 + %l3] 0x81
	tneg	%xcc,	0x2
	xnorcc	%l5,	0x01A7,	%g2
	nop
	fitos	%f28,	%f28
	sra	%o1,	0x11,	%l1
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x1f
	membar	#Sync
	alignaddr	%o7,	%g3,	%i2
	movne	%icc,	%i4,	%i1
	bl,a,pn	%xcc,	loop_2299
	tl	%xcc,	0x2
	array32	%g1,	%o2,	%l6
	bcc,a	loop_2300
loop_2299:
	move	%xcc,	%o6,	%i5
	movneg	%icc,	%o0,	%o4
	fcmpne16	%f18,	%f26,	%l2
loop_2300:
	subccc	%i7,	%g7,	%g5
	smul	%l4,	%i6,	%i0
	fbge	%fcc1,	loop_2301
	tg	%icc,	0x5
	subc	%l3,	0x184A,	%i3
	movrlez	%o3,	%g4,	%l0
loop_2301:
	umulcc	%g6,	0x083E,	%l5
	andcc	%g2,	0x16AF,	%o1
	ldsb	[%l7 + 0x1D],	%o5
	move	%xcc,	%o7,	%g3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f16
	alignaddr	%i2,	%l1,	%i4
	movrlez	%g1,	%o2,	%i1
	nop
	fitos	%f12,	%f5
	fstod	%f5,	%f16
	edge8	%l6,	%i5,	%o0
	mova	%icc,	%o4,	%l2
	pdist	%f20,	%f18,	%f0
	mova	%xcc,	%o6,	%i7
	fbge,a	%fcc1,	loop_2302
	brz	%g5,	loop_2303
	fble	%fcc3,	loop_2304
	brz	%l4,	loop_2305
loop_2302:
	fbn	%fcc3,	loop_2306
loop_2303:
	tsubcctv	%i6,	%i0,	%l3
loop_2304:
	movgu	%xcc,	%g7,	%o3
loop_2305:
	movre	%g4,	0x25A,	%i3
loop_2306:
	add	%l0,	%g6,	%l5
	set	0x40, %l1
	stba	%g2,	[%l7 + %l1] 0x0c
	fsrc1	%f12,	%f16
	stb	%o1,	[%l7 + 0x31]
	ldstub	[%l7 + 0x5C],	%o5
	movrlz	%o7,	0x3FE,	%g3
	brlez,a	%i2,	loop_2307
	and	%l1,	0x08C7,	%i4
	movrgez	%g1,	0x3EA,	%i1
	ldub	[%l7 + 0x49],	%l6
loop_2307:
	srax	%o2,	%o0,	%o4
	orn	%l2,	%o6,	%i7
	fmovdg	%xcc,	%f21,	%f31
	tsubcc	%g5,	0x1296,	%l4
	nop
	set	0x10, %o0
	stx	%i6,	[%l7 + %o0]
	xnor	%i0,	%i5,	%g7
	brgz,a	%l3,	loop_2308
	bge,pn	%xcc,	loop_2309
	ldd	[%l7 + 0x70],	%f14
	sdivx	%g4,	0x0C08,	%i3
loop_2308:
	tge	%icc,	0x6
loop_2309:
	nop
	set	0x5A, %o4
	ldub	[%l7 + %o4],	%o3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f22
	sir	0x03D4
	bpos,pt	%xcc,	loop_2310
	fmovdn	%icc,	%f10,	%f7
	alignaddrl	%l5,	%g2,	%g6
	nop
	setx	0x2058E956,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_2310:
	lduh	[%l7 + 0x36],	%o5
	subccc	%o7,	%g3,	%i2
	movrgz	%l1,	0x1A4,	%i4
	sdiv	%o1,	0x098C,	%g1
	fmovsge	%icc,	%f5,	%f26
	nop
	setx	0xCD42BAC4BB256DEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x95BD36650B84DD91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f0,	%f12
	tvc	%icc,	0x0
	umulcc	%l6,	0x1F86,	%i1
	fmovdgu	%icc,	%f22,	%f31
	movrlz	%o0,	%o4,	%o2
	umul	%o6,	%i7,	%g5
	movne	%icc,	%l4,	%i6
	movrne	%i0,	0x0AD,	%l2
	bn	loop_2311
	ldub	[%l7 + 0x6B],	%g7
	ldsw	[%l7 + 0x34],	%l3
	addccc	%g4,	%i5,	%o3
loop_2311:
	fmovrsne	%i3,	%f24,	%f21
	bshuffle	%f2,	%f4,	%f2
	fmul8x16al	%f22,	%f26,	%f2
	fbule	%fcc1,	loop_2312
	bneg	%xcc,	loop_2313
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l0,	%g2,	%g6
loop_2312:
	movgu	%icc,	%l5,	%o5
loop_2313:
	orcc	%g3,	0x1FE9,	%o7
	brnz	%i2,	loop_2314
	ba,pn	%xcc,	loop_2315
	fbo,a	%fcc2,	loop_2316
	fmovrdgz	%l1,	%f6,	%f16
loop_2314:
	movvs	%xcc,	%o1,	%i4
loop_2315:
	tneg	%xcc,	0x1
loop_2316:
	fmovdvc	%xcc,	%f12,	%f14
	edge32	%g1,	%l6,	%i1
	movvs	%xcc,	%o4,	%o2
	tpos	%icc,	0x0
	sub	%o0,	%i7,	%o6
	edge8n	%g5,	%i6,	%i0
	lduh	[%l7 + 0x54],	%l4
	addccc	%g7,	%l3,	%l2
	taddcctv	%i5,	0x0068,	%o3
	fbug	%fcc0,	loop_2317
	lduw	[%l7 + 0x54],	%i3
	fmovscs	%icc,	%f15,	%f7
	xnor	%l0,	0x1A82,	%g4
loop_2317:
	fmovdleu	%icc,	%f31,	%f4
	fmovdne	%xcc,	%f6,	%f15
	ldsh	[%l7 + 0x62],	%g2
	fmovdpos	%icc,	%f16,	%f0
	stx	%l5,	[%l7 + 0x28]
	srlx	%o5,	%g6,	%o7
	sdiv	%i2,	0x1C04,	%g3
	edge32ln	%o1,	%l1,	%i4
	fmovrdgez	%l6,	%f14,	%f12
	set	0x10, %g3
	stxa	%i1,	[%l7 + %g3] 0x27
	membar	#Sync
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f0
	fxtos	%f0,	%f3
	xorcc	%g1,	0x0663,	%o4
	orncc	%o2,	0x07C9,	%i7
	mulscc	%o0,	%o6,	%g5
	sir	0x08F1
	tpos	%xcc,	0x7
	fbe,a	%fcc2,	loop_2318
	fmovsvc	%icc,	%f21,	%f14
	sllx	%i6,	0x05,	%l4
	call	loop_2319
loop_2318:
	array8	%g7,	%i0,	%l2
	bgu,a	%icc,	loop_2320
	bcs,a,pn	%xcc,	loop_2321
loop_2319:
	fmovrdgz	%l3,	%f4,	%f26
	nop
	fitod	%f27,	%f8
loop_2320:
	addc	%i5,	%o3,	%i3
loop_2321:
	xor	%g4,	%l0,	%g2
	edge8	%o5,	%g6,	%l5
	tneg	%xcc,	0x4
	sub	%i2,	%g3,	%o1
	bg,a	loop_2322
	membar	0x4A
	ble,a,pn	%xcc,	loop_2323
	tsubcc	%l1,	%i4,	%l6
loop_2322:
	ble	%icc,	loop_2324
	edge16l	%o7,	%i1,	%o4
loop_2323:
	fmovrse	%g1,	%f4,	%f20
	fmovrslez	%o2,	%f9,	%f0
loop_2324:
	fmovdcs	%xcc,	%f31,	%f7
	bl,a	%xcc,	loop_2325
	edge8	%o0,	%i7,	%g5
	movrgez	%i6,	%l4,	%g7
	fmovsa	%icc,	%f12,	%f30
loop_2325:
	xnor	%o6,	%l2,	%l3
	andcc	%i5,	%o3,	%i3
	nop
	setx	0x1E46184E3167C214,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f28
	andn	%g4,	0x0930,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f13,	%f15
	movcc	%icc,	%i0,	%g2
	for	%f20,	%f12,	%f20
	faligndata	%f4,	%f20,	%f22
	fmul8sux16	%f2,	%f20,	%f12
	movrgez	%g6,	0x27D,	%o5
	fmovsvs	%xcc,	%f10,	%f31
	fmovdcc	%xcc,	%f10,	%f22
	movge	%xcc,	%i2,	%l5
	nop
	setx loop_2326, %l0, %l1
	jmpl %l1, %o1
	tle	%xcc,	0x6
	movcc	%icc,	%l1,	%i4
	array8	%g3,	%o7,	%i1
loop_2326:
	sra	%l6,	0x06,	%g1
	fnors	%f19,	%f15,	%f6
	edge8	%o4,	%o2,	%o0
	fmovrslz	%g5,	%f20,	%f20
	fandnot2s	%f27,	%f7,	%f20
	fmovsle	%icc,	%f23,	%f1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f0
	addc	%i7,	0x1129,	%l4
	sdivx	%i6,	0x16B7,	%g7
	movpos	%xcc,	%o6,	%l2
	movrlz	%l3,	%o3,	%i3
	fmul8x16	%f23,	%f12,	%f0
	wr	%g0,	0xe3,	%asi
	stba	%i5,	[%l7 + 0x6C] %asi
	membar	#Sync
	bpos	%xcc,	loop_2327
	tneg	%icc,	0x5
	fbn	%fcc3,	loop_2328
	sdiv	%g4,	0x1991,	%i0
loop_2327:
	ba,pt	%icc,	loop_2329
	move	%xcc,	%g2,	%l0
loop_2328:
	fba,a	%fcc3,	loop_2330
	fpadd16s	%f0,	%f10,	%f1
loop_2329:
	fcmpeq16	%f0,	%f10,	%g6
	ldx	[%l7 + 0x18],	%o5
loop_2330:
	xnorcc	%i2,	%o1,	%l1
	smulcc	%i4,	0x0DA2,	%g3
	fblg,a	%fcc3,	loop_2331
	ldsw	[%l7 + 0x20],	%o7
	xorcc	%i1,	0x0C3F,	%l6
	mova	%icc,	%l5,	%g1
loop_2331:
	nop
	set	0x37, %o5
	lduba	[%l7 + %o5] 0x89,	%o2
	fbne,a	%fcc2,	loop_2332
	movcc	%icc,	%o4,	%o0
	ldx	[%l7 + 0x20],	%i7
	movrlz	%g5,	%l4,	%i6
loop_2332:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x08] %asi,	%g7
	tne	%icc,	0x5
	movl	%xcc,	%l2,	%o6
	movrlez	%l3,	%o3,	%i5
	srlx	%g4,	0x1D,	%i0
	sth	%g2,	[%l7 + 0x72]
	sethi	0x02BA,	%l0
	andn	%i3,	%o5,	%i2
	fmovscs	%icc,	%f11,	%f22
	tcc	%xcc,	0x5
	fmovsgu	%icc,	%f27,	%f22
	subcc	%g6,	%o1,	%i4
	movcs	%icc,	%g3,	%o7
	smul	%i1,	0x137B,	%l1
	andn	%l5,	%l6,	%o2
	nop
	setx	loop_2333,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x02C01668BE26C5D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x99A7265763771DE9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f8,	%f12
	nop
	fitod	%f25,	%f0
	movne	%xcc,	%o4,	%o0
loop_2333:
	smul	%g1,	0x0D2C,	%i7
	fcmple32	%f14,	%f6,	%g5
	smul	%l4,	0x0BA8,	%i6
	fxnors	%f31,	%f29,	%f2
	nop
	setx loop_2334, %l0, %l1
	jmpl %l1, %l2
	edge32l	%g7,	%o6,	%l3
	fmovse	%icc,	%f14,	%f12
	udivcc	%o3,	0x12B5,	%i5
loop_2334:
	tsubcctv	%g4,	%g2,	%l0
	tsubcc	%i3,	%i0,	%o5
	movcc	%icc,	%g6,	%o1
	membar	0x57
	movpos	%icc,	%i2,	%i4
	fpadd32	%f12,	%f18,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x70] %asi,	%o7
	bn	loop_2335
	tsubcc	%g3,	0x1427,	%l1
	edge32l	%l5,	%l6,	%i1
	movrlez	%o2,	%o0,	%g1
loop_2335:
	nop
	setx	0x60ED27EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xA93E7A7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f14,	%f2
	xor	%i7,	%g5,	%l4
	ldx	[%l7 + 0x30],	%o4
	nop
	fitod	%f8,	%f28
	fdtox	%f28,	%f24
	tneg	%xcc,	0x7
	fpack32	%f26,	%f18,	%f28
	fpack16	%f28,	%f4
	set	0x34, %o1
	lduha	[%l7 + %o1] 0x10,	%l2
	tl	%xcc,	0x1
	sth	%g7,	[%l7 + 0x2C]
	fbe	%fcc3,	loop_2336
	bg,a	%icc,	loop_2337
	movrgez	%i6,	0x095,	%o6
	fone	%f30
loop_2336:
	fcmpne16	%f22,	%f26,	%o3
loop_2337:
	movle	%xcc,	%i5,	%g4
	wr	%g0,	0xe3,	%asi
	stxa	%l3,	[%l7 + 0x70] %asi
	membar	#Sync
	fbul,a	%fcc1,	loop_2338
	lduw	[%l7 + 0x7C],	%l0
	movvs	%icc,	%g2,	%i3
	edge32ln	%o5,	%i0,	%o1
loop_2338:
	fexpand	%f22,	%f24
	xnorcc	%g6,	%i2,	%i4
	movvc	%xcc,	%o7,	%l1
	fmul8ulx16	%f22,	%f12,	%f6
	fzero	%f30
	umul	%l5,	%l6,	%g3
	orn	%o2,	0x053F,	%o0
	tcs	%icc,	0x3
	udivcc	%g1,	0x13CE,	%i1
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	array8	%i7,	%l4,	%g5
	tneg	%icc,	0x7
	fpsub16	%f12,	%f0,	%f20
	fzeros	%f12
	fmovsgu	%icc,	%f27,	%f26
	addccc	%o4,	%l2,	%g7
	subccc	%o6,	%o3,	%i5
	sll	%g4,	%l3,	%i6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g2
	fcmpgt16	%f4,	%f6,	%i3
	fnot1s	%f20,	%f27
	tsubcctv	%o5,	0x1F73,	%l0
	tcs	%xcc,	0x5
	fmovdcs	%icc,	%f31,	%f0
	sll	%i0,	0x1A,	%o1
	tge	%icc,	0x1
	bcs,a,pn	%xcc,	loop_2339
	edge16ln	%i2,	%i4,	%g6
	udiv	%o7,	0x15C3,	%l1
	tvc	%xcc,	0x7
loop_2339:
	fmovdneg	%xcc,	%f15,	%f15
	edge16n	%l6,	%g3,	%l5
	ta	%icc,	0x5
	sub	%o2,	0x08D1,	%g1
	tneg	%icc,	0x4
	array16	%o0,	%i1,	%i7
	set	0x76, %i6
	lduha	[%l7 + %i6] 0x89,	%l4
	sll	%g5,	%o4,	%l2
	mulscc	%o6,	%o3,	%g7
	st	%f3,	[%l7 + 0x2C]
	tvc	%icc,	0x4
	movle	%icc,	%i5,	%g4
	or	%l3,	%g2,	%i3
	movg	%xcc,	%i6,	%o5
	edge8l	%i0,	%l0,	%i2
	movne	%icc,	%o1,	%i4
	nop
	fitos	%f1,	%f2
	fstoi	%f2,	%f11
	nop
	fitos	%f1,	%f31
	fstox	%f31,	%f0
	fbge,a	%fcc0,	loop_2340
	bne,a,pn	%icc,	loop_2341
	bvs,a	loop_2342
	tleu	%icc,	0x7
loop_2340:
	and	%o7,	%g6,	%l1
loop_2341:
	andn	%g3,	%l5,	%l6
loop_2342:
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f4
	fxtos	%f4,	%f2
	fmovda	%xcc,	%f24,	%f9
	bn,pt	%icc,	loop_2343
	fpadd32	%f6,	%f0,	%f22
	smul	%o2,	0x03C9,	%o0
	orn	%i1,	%i7,	%l4
loop_2343:
	mova	%icc,	%g5,	%o4
	bvs	%icc,	loop_2344
	fbge	%fcc3,	loop_2345
	sra	%g1,	%l2,	%o3
	smul	%g7,	%i5,	%g4
loop_2344:
	movrgez	%o6,	%g2,	%l3
loop_2345:
	fmovrdgz	%i3,	%f22,	%f24
	nop
	setx	loop_2346,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fble,a	%fcc3,	loop_2347
	bne,pn	%xcc,	loop_2348
	srl	%i6,	0x1E,	%i0
loop_2346:
	add	%o5,	0x1072,	%l0
loop_2347:
	ta	%icc,	0x2
loop_2348:
	fmovsge	%xcc,	%f3,	%f31
	bshuffle	%f24,	%f18,	%f0
	fcmple32	%f14,	%f16,	%o1
	fmovscs	%xcc,	%f18,	%f4
	fmovde	%xcc,	%f20,	%f13
	umul	%i2,	0x19BD,	%o7
	and	%i4,	0x08B1,	%g6
	tneg	%xcc,	0x7
	fpack16	%f18,	%f0
	sir	0x0A27
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g3,	%l5,	%l1
	edge32	%l6,	%o2,	%o0
	addccc	%i7,	0x1651,	%i1
	stw	%g5,	[%l7 + 0x64]
	movrlez	%o4,	0x1F2,	%l4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o3
	edge8n	%g1,	%i5,	%g7
	movn	%xcc,	%g4,	%g2
	ldd	[%l7 + 0x48],	%f6
	movcs	%xcc,	%o6,	%l3
	fmovspos	%icc,	%f7,	%f15
	andcc	%i3,	%i6,	%i0
	movcc	%icc,	%l0,	%o5
	subc	%o1,	0x1BC0,	%o7
	nop
	set	0x28, %o2
	stb	%i2,	[%l7 + %o2]
	sir	0x046C
	tge	%xcc,	0x1
	fmovs	%f28,	%f24
	fors	%f18,	%f10,	%f23
	srax	%g6,	%g3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l1,	0x1F86,	%l5
	brlz	%o2,	loop_2349
	smulcc	%l6,	%i7,	%i1
	movrgz	%g5,	%o4,	%o0
	edge8l	%l4,	%o3,	%g1
loop_2349:
	sll	%i5,	0x0D,	%g7
	fmovdg	%icc,	%f7,	%f0
	set	0x0A, %o6
	ldsha	[%l7 + %o6] 0x19,	%l2
	xnorcc	%g4,	0x17AB,	%g2
	nop
	setx loop_2350, %l0, %l1
	jmpl %l1, %l3
	smul	%i3,	0x199B,	%i6
	tcs	%icc,	0x2
	fnegs	%f8,	%f24
loop_2350:
	ldsb	[%l7 + 0x7E],	%i0
	sllx	%l0,	%o5,	%o6
	fxnor	%f20,	%f10,	%f22
	edge32n	%o1,	%o7,	%i2
	fbn	%fcc1,	loop_2351
	fnands	%f26,	%f23,	%f16
	subc	%g3,	0x1B82,	%g6
	orn	%i4,	%l1,	%o2
loop_2351:
	brlez,a	%l5,	loop_2352
	movpos	%xcc,	%l6,	%i1
	tle	%xcc,	0x6
	smulcc	%g5,	0x1D2B,	%i7
loop_2352:
	sdivcc	%o4,	0x01EE,	%l4
	nop
	setx	0xE54641AC76FDAD46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x53206640CBEF9BB0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f10,	%f2
	fbule,a	%fcc3,	loop_2353
	ldsb	[%l7 + 0x71],	%o0
	array16	%g1,	%o3,	%g7
	smulcc	%l2,	%g4,	%i5
loop_2353:
	movle	%icc,	%g2,	%l3
	fbe	%fcc0,	loop_2354
	edge16n	%i3,	%i0,	%l0
	array16	%i6,	%o5,	%o1
	tl	%xcc,	0x4
loop_2354:
	nop
	setx loop_2355, %l0, %l1
	jmpl %l1, %o7
	fornot1s	%f13,	%f28,	%f9
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i2,	%o6
loop_2355:
	fbule,a	%fcc3,	loop_2356
	orn	%g3,	0x141A,	%i4
	udivx	%l1,	0x118E,	%g6
	fble,a	%fcc3,	loop_2357
loop_2356:
	te	%icc,	0x2
	srax	%l5,	%l6,	%o2
	fsrc1s	%f8,	%f18
loop_2357:
	prefetch	[%l7 + 0x1C],	 0x3
	movgu	%xcc,	%i1,	%i7
	fabsd	%f4,	%f22
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x16] %asi,	%g5
	subccc	%l4,	%o0,	%g1
	fpadd16s	%f26,	%f3,	%f29
	movpos	%xcc,	%o3,	%g7
	movrgez	%l2,	%g4,	%i5
	fmovdl	%icc,	%f14,	%f25
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	movrne	%l3,	0x0FB,	%i3
	ta	%xcc,	0x4
	subc	%g2,	0x0695,	%i0
	fmul8sux16	%f12,	%f16,	%f8
	ta	%xcc,	0x1
	fsrc2	%f20,	%f18
	movrgz	%i6,	0x2F7,	%o5
	fmovsneg	%icc,	%f17,	%f6
	bl	loop_2358
	nop
	setx	loop_2359,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%l0,	%o1,	%o7
	or	%i2,	%o6,	%i4
loop_2358:
	edge16n	%g3,	%l1,	%g6
loop_2359:
	fones	%f23
	movre	%l5,	0x00A,	%o2
	ldx	[%l7 + 0x20],	%i1
	movn	%icc,	%i7,	%g5
	edge16n	%l4,	%o0,	%l6
	movle	%icc,	%g1,	%g7
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x18,	%o2
	fcmple32	%f10,	%f28,	%g4
	lduh	[%l7 + 0x44],	%l2
	set	0x70, %g4
	lda	[%l7 + %g4] 0x10,	%f2
	popc	0x0332,	%o4
	mulx	%l3,	0x0D2B,	%i5
	subcc	%i3,	0x1383,	%g2
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x17,	%f0
	brlz,a	%i6,	loop_2360
	movvs	%icc,	%o5,	%l0
	movn	%icc,	%o1,	%o7
	sdivx	%i0,	0x088E,	%o6
loop_2360:
	nop
	set	0x34, %g6
	lduw	[%l7 + %g6],	%i2
	sdivx	%i4,	0x0DBC,	%g3
	fbn,a	%fcc1,	loop_2361
	edge16n	%l1,	%g6,	%l5
	edge8	%o2,	%i7,	%i1
	fnot2	%f24,	%f14
loop_2361:
	movrgez	%l4,	0x0B6,	%g5
	xor	%l6,	%g1,	%o0
	movge	%xcc,	%g7,	%g4
	nop
	setx	0xF0370675,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x81B54E35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f27,	%f22
	ld	[%l7 + 0x30],	%f27
	fpsub32s	%f27,	%f25,	%f3
	tgu	%xcc,	0x7
	edge8	%l2,	%o3,	%l3
	fcmpne16	%f18,	%f14,	%o4
	nop
	setx	0xA0453E0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	movvc	%xcc,	%i3,	%i5
	srlx	%g2,	%o5,	%l0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o1
	faligndata	%f4,	%f12,	%f18
	fmovsvc	%icc,	%f6,	%f23
	movvc	%xcc,	%i0,	%o6
	movrlz	%i2,	%o7,	%g3
	movcs	%xcc,	%l1,	%i4
	xnorcc	%g6,	0x1150,	%o2
	fnot2	%f16,	%f16
	xnor	%l5,	0x1AFC,	%i7
	edge16l	%l4,	%i1,	%g5
	ld	[%l7 + 0x14],	%f15
	fcmpgt16	%f12,	%f12,	%g1
	xnorcc	%o0,	0x1854,	%l6
	fcmple16	%f30,	%f14,	%g4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%l2
	fzero	%f2
	fpmerge	%f21,	%f27,	%f24
	movcs	%icc,	%o3,	%g7
	fbl	%fcc1,	loop_2362
	sir	0x1BD4
	nop
	set	0x30, %i4
	std	%f14,	[%l7 + %i4]
	udiv	%l3,	0x18E8,	%i3
loop_2362:
	fble	%fcc0,	loop_2363
	fmovsvs	%xcc,	%f20,	%f17
	xorcc	%i5,	%g2,	%o5
	tle	%xcc,	0x4
loop_2363:
	movge	%icc,	%o4,	%l0
	movrgez	%o1,	0x1DE,	%i0
	edge32n	%o6,	%i6,	%o7
	tge	%icc,	0x2
	fmovrdgez	%g3,	%f18,	%f26
	te	%icc,	0x6
	fmovsn	%xcc,	%f20,	%f9
	addc	%l1,	0x0D72,	%i2
	fnot2	%f20,	%f22
	fpsub16	%f28,	%f10,	%f16
	movrlez	%g6,	0x3AE,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o2,	%i7,	%l5
	array16	%l4,	%g5,	%i1
	bge,a	%icc,	loop_2364
	ble,a	loop_2365
	fmovdgu	%icc,	%f10,	%f5
	flush	%l7 + 0x24
loop_2364:
	movrlez	%o0,	0x207,	%g1
loop_2365:
	fsrc1s	%f24,	%f29
	movrgez	%l6,	%l2,	%g4
	ble,pn	%xcc,	loop_2366
	brnz	%g7,	loop_2367
	tg	%xcc,	0x4
	bn,a,pn	%xcc,	loop_2368
loop_2366:
	movrgz	%o3,	%l3,	%i5
loop_2367:
	ldd	[%l7 + 0x20],	%g2
	brgz,a	%o5,	loop_2369
loop_2368:
	fmovsvs	%icc,	%f9,	%f5
	edge16n	%o4,	%i3,	%l0
	fmovsl	%xcc,	%f9,	%f27
loop_2369:
	fnegs	%f10,	%f6
	ba,a	loop_2370
	edge16l	%i0,	%o1,	%o6
	edge16l	%i6,	%g3,	%l1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i2
loop_2370:
	sth	%g6,	[%l7 + 0x72]
	movg	%icc,	%o7,	%i4
	fbg,a	%fcc0,	loop_2371
	umulcc	%i7,	%l5,	%o2
	alignaddr	%l4,	%g5,	%i1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%g1
loop_2371:
	ldsb	[%l7 + 0x75],	%l6
	tpos	%icc,	0x3
	set	0x36, %o7
	ldstuba	[%l7 + %o7] 0x04,	%g4
	mulscc	%l2,	%g7,	%l3
	srl	%i5,	%o3,	%g2
	fxor	%f0,	%f28,	%f12
	array8	%o4,	%o5,	%i3
	sdivx	%l0,	0x1736,	%o1
	srlx	%o6,	0x00,	%i0
	brgz	%g3,	loop_2372
	ldd	[%l7 + 0x38],	%i6
	set	0x18, %i0
	stha	%i2,	[%l7 + %i0] 0x2f
	membar	#Sync
loop_2372:
	array8	%g6,	%l1,	%o7
	fxor	%f2,	%f28,	%f16
	or	%i7,	0x0AF1,	%i4
	nop
	fitod	%f10,	%f4
	fdtox	%f4,	%f24
	lduh	[%l7 + 0x4A],	%l5
	taddcc	%l4,	%g5,	%i1
	bne,a	%icc,	loop_2373
	alignaddr	%o2,	%g1,	%o0
	nop
	setx	0x7054EB79,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fandnot2	%f4,	%f26,	%f16
loop_2373:
	movne	%icc,	%g4,	%l2
	brz	%g7,	loop_2374
	ldub	[%l7 + 0x19],	%l3
	fbe	%fcc2,	loop_2375
	movcc	%icc,	%i5,	%o3
loop_2374:
	fxors	%f3,	%f16,	%f9
	nop
	set	0x65, %i1
	ldub	[%l7 + %i1],	%g2
loop_2375:
	flush	%l7 + 0x58
	fmul8ulx16	%f2,	%f14,	%f10
	sub	%o4,	0x0CF1,	%o5
	movgu	%xcc,	%l6,	%l0
	alignaddrl	%o1,	%i3,	%o6
	fmovsle	%icc,	%f9,	%f14
	fbuge,a	%fcc1,	loop_2376
	nop
	fitos	%f3,	%f27
	fstox	%f27,	%f4
	fxtos	%f4,	%f19
	fbue	%fcc1,	loop_2377
	popc	%i0,	%g3
loop_2376:
	fpadd16	%f6,	%f30,	%f30
	edge8	%i6,	%g6,	%i2
loop_2377:
	and	%o7,	%i7,	%l1
	edge8ln	%l5,	%l4,	%g5
	fbg	%fcc0,	loop_2378
	xnor	%i4,	%i1,	%g1
	fpack16	%f26,	%f28
	array16	%o0,	%g4,	%l2
loop_2378:
	fmovrsgz	%o2,	%f22,	%f31
	tpos	%xcc,	0x4
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x62] %asi,	%l3
	ldstub	[%l7 + 0x51],	%o3
	fbue	%fcc1,	loop_2379
	add	%g2,	%o4,	%i5
	fmovdneg	%icc,	%f1,	%f17
	movcs	%icc,	%o5,	%l6
loop_2379:
	udivx	%l0,	0x1262,	%o1
	addc	%i3,	0x0BAF,	%o6
	fblg	%fcc3,	loop_2380
	tcs	%xcc,	0x5
	fcmpeq16	%f26,	%f20,	%i0
	bcc,a,pt	%xcc,	loop_2381
loop_2380:
	fmovsgu	%xcc,	%f8,	%f10
	movne	%xcc,	%g3,	%i6
	fcmpgt16	%f4,	%f6,	%i2
loop_2381:
	nop
	set	0x76, %i2
	stha	%g6,	[%l7 + %i2] 0x88
	movre	%i7,	0x2A8,	%o7
	fbu	%fcc3,	loop_2382
	fmovrsne	%l5,	%f3,	%f29
	tg	%xcc,	0x5
	nop
	setx	0x36BA28E93AD6FCCF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x274CD4037F8B2FC9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f2,	%f24
loop_2382:
	xnor	%l1,	%l4,	%i4
	andn	%g5,	%g1,	%o0
	fbl,a	%fcc1,	loop_2383
	movgu	%xcc,	%g4,	%l2
	movpos	%xcc,	%o2,	%i1
	addccc	%l3,	%o3,	%g7
loop_2383:
	fmuld8sux16	%f23,	%f25,	%f20
	bl,pn	%xcc,	loop_2384
	alignaddrl	%o4,	%g2,	%i5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o5,	%l0
loop_2384:
	move	%icc,	%o1,	%i3
	brgez	%l6,	loop_2385
	movn	%icc,	%o6,	%g3
	ta	%icc,	0x6
	tsubcc	%i0,	%i2,	%i6
loop_2385:
	movrne	%i7,	%g6,	%l5
	tgu	%xcc,	0x2
	or	%l1,	%l4,	%o7
	or	%i4,	0x1202,	%g5
	set	0x64, %g5
	sta	%f26,	[%l7 + %g5] 0x11
	movvc	%icc,	%g1,	%o0
	fmovsvs	%icc,	%f28,	%f25
	bge	%xcc,	loop_2386
	subc	%g4,	0x138B,	%l2
	array8	%i1,	%l3,	%o3
	edge8ln	%g7,	%o4,	%o2
loop_2386:
	xnorcc	%i5,	0x0157,	%g2
	movne	%icc,	%o5,	%l0
	umulcc	%o1,	0x00CE,	%i3
	fpsub16s	%f19,	%f2,	%f14
	brz	%o6,	loop_2387
	fmovda	%icc,	%f29,	%f23
	fmovrde	%g3,	%f26,	%f12
	nop
	setx	0xF11384B8A6CEFCAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDC1C0B3050029C63,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f14,	%f10
loop_2387:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f0
	edge16l	%l6,	%i0,	%i6
	fmuld8sux16	%f22,	%f13,	%f2
	nop
	setx loop_2388, %l0, %l1
	jmpl %l1, %i2
	fmovdleu	%icc,	%f0,	%f10
	edge32n	%g6,	%l5,	%l1
	alignaddrl	%i7,	%o7,	%i4
loop_2388:
	andncc	%g5,	%l4,	%o0
	tvc	%icc,	0x0
	ldd	[%l7 + 0x48],	%f22
	fmuld8ulx16	%f30,	%f0,	%f14
	movn	%xcc,	%g1,	%g4
	xnor	%l2,	%i1,	%l3
	fcmpeq16	%f28,	%f14,	%g7
	fbl,a	%fcc0,	loop_2389
	sll	%o3,	0x1F,	%o2
	tpos	%xcc,	0x3
	sllx	%i5,	%g2,	%o5
loop_2389:
	udivx	%o4,	0x0D7F,	%o1
	alignaddrl	%i3,	%l0,	%g3
	sra	%l6,	%i0,	%i6
	fornot2	%f16,	%f8,	%f16
	fnand	%f20,	%f10,	%f14
	fcmpgt32	%f12,	%f4,	%o6
	tge	%xcc,	0x5
	movvs	%icc,	%g6,	%l5
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f29
	andcc	%i2,	0x031B,	%i7
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x60] %asi,	%o7
	nop
	setx loop_2390, %l0, %l1
	jmpl %l1, %i4
	tgu	%icc,	0x7
	movleu	%icc,	%g5,	%l4
	fnot2s	%f31,	%f23
loop_2390:
	fbo	%fcc0,	loop_2391
	fmovrslz	%o0,	%f6,	%f16
	srlx	%g1,	%l1,	%g4
	andncc	%l2,	%i1,	%l3
loop_2391:
	xnor	%g7,	0x0AAF,	%o2
	orcc	%i5,	0x1DF9,	%g2
	edge16l	%o3,	%o4,	%o5
	fxor	%f12,	%f12,	%f18
	tgu	%xcc,	0x1
	sth	%o1,	[%l7 + 0x56]
	fxor	%f12,	%f18,	%f26
	srl	%l0,	0x16,	%i3
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x4C] %asi
	ta	%xcc,	0x3
	movn	%icc,	%g3,	%l6
	alignaddr	%i6,	%i0,	%g6
	edge32ln	%o6,	%i2,	%i7
	be,a,pn	%xcc,	loop_2392
	te	%xcc,	0x2
	fxor	%f16,	%f2,	%f18
	movrgz	%o7,	0x05C,	%i4
loop_2392:
	movrgz	%g5,	%l5,	%o0
	be,pt	%icc,	loop_2393
	orncc	%l4,	%l1,	%g4
	bg,a	loop_2394
	umulcc	%g1,	%i1,	%l2
loop_2393:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l3
loop_2394:
	tleu	%xcc,	0x5
	move	%icc,	%o2,	%i5
	fabss	%f12,	%f31
	movgu	%xcc,	%g2,	%g7
	tsubcctv	%o3,	%o5,	%o4
	srax	%l0,	0x0A,	%o1
	fandnot1s	%f23,	%f10,	%f10
	edge8l	%i3,	%l6,	%g3
	fmovspos	%icc,	%f7,	%f10
	fzero	%f24
	mova	%icc,	%i6,	%g6
	fabss	%f5,	%f4
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f28
	fxtod	%f28,	%f20
	movrgz	%o6,	%i2,	%i0
	sub	%i7,	%i4,	%g5
	udiv	%l5,	0x1E15,	%o7
	addccc	%o0,	0x0333,	%l1
	alignaddrl	%g4,	%l4,	%i1
	ble,a	%icc,	loop_2395
	fmovrsgez	%l2,	%f22,	%f23
	fmovrdlz	%g1,	%f14,	%f2
	tle	%xcc,	0x5
loop_2395:
	movrne	%o2,	0x2CE,	%i5
	fand	%f26,	%f22,	%f6
	alignaddr	%g2,	%g7,	%l3
	array8	%o5,	%o3,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%i3
	bneg	loop_2396
	edge8l	%o1,	%g3,	%i6
	fmovdg	%icc,	%f1,	%f16
	fbg,a	%fcc2,	loop_2397
loop_2396:
	nop
	fitod	%f6,	%f22
	fdtox	%f22,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l6,	%o6,	%g6
loop_2397:
	smulcc	%i0,	%i7,	%i2
	subcc	%i4,	%g5,	%o7
	movre	%o0,	%l5,	%g4
	or	%l4,	0x1F60,	%i1
	edge32l	%l1,	%l2,	%o2
	andcc	%g1,	0x1E82,	%g2
	st	%f30,	[%l7 + 0x1C]
	xor	%g7,	%i5,	%l3
	tsubcc	%o5,	0x01D4,	%o3
	tg	%xcc,	0x6
	stbar
	wr	%g0,	0x04,	%asi
	stha	%l0,	[%l7 + 0x6C] %asi
	nop
	setx	0x4151C4AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xFB7B7D77,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f25,	%f2
	movrlez	%o4,	%o1,	%g3
	fpack32	%f26,	%f8,	%f26
	orcc	%i3,	0x1301,	%l6
	movl	%xcc,	%o6,	%i6
	movg	%icc,	%i0,	%i7
	nop
	setx	loop_2398,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot1s	%f20,	%f4,	%f10
	edge32	%g6,	%i2,	%i4
	edge8ln	%g5,	%o7,	%l5
loop_2398:
	fnot2s	%f4,	%f6
	fmovsl	%icc,	%f29,	%f20
	edge16ln	%o0,	%g4,	%i1
	movrgz	%l4,	0x206,	%l2
	fzeros	%f24
	tvs	%xcc,	0x0
	sra	%l1,	0x0F,	%g1
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o2
	nop
	setx	0x44060F5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x0783AB04,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f8,	%f27
	fcmpgt32	%f28,	%f28,	%g2
	sdiv	%i5,	0x145B,	%l3
	flush	%l7 + 0x70
	sllx	%o5,	%o3,	%g7
	fbue,a	%fcc0,	loop_2399
	fcmpeq32	%f22,	%f16,	%l0
	swap	[%l7 + 0x20],	%o4
	be,a	loop_2400
loop_2399:
	edge16l	%g3,	%o1,	%i3
	tge	%xcc,	0x5
	taddcctv	%o6,	0x0840,	%l6
loop_2400:
	edge32	%i6,	%i7,	%g6
	fbul,a	%fcc1,	loop_2401
	srax	%i0,	0x12,	%i2
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x17
	membar	#Sync
loop_2401:
	sllx	%g5,	%i4,	%l5
	sdiv	%o0,	0x1A20,	%g4
	movvs	%xcc,	%i1,	%l4
	ldd	[%l7 + 0x20],	%f8
	fbul	%fcc1,	loop_2402
	fmul8x16al	%f6,	%f2,	%f12
	fbuge	%fcc0,	loop_2403
	udivcc	%l2,	0x1D3C,	%l1
loop_2402:
	fpadd16	%f24,	%f26,	%f16
	movcc	%icc,	%o7,	%g1
loop_2403:
	movneg	%icc,	%g2,	%o2
	tsubcctv	%l3,	%o5,	%o3
	call	loop_2404
	sub	%i5,	0x1957,	%l0
	fones	%f10
	sdiv	%g7,	0x18EE,	%o4
loop_2404:
	nop
	fitos	%f27,	%f31
	nop
	fitos	%f0,	%f1
	fstox	%f1,	%f16
	fxtos	%f16,	%f30
	tge	%xcc,	0x6
	movle	%xcc,	%o1,	%g3
	nop
	setx	0xA8D88B32,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x657F9539,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f0,	%f27
	tleu	%icc,	0x7
	bge	%xcc,	loop_2405
	alignaddr	%o6,	%i3,	%l6
	addc	%i7,	0x1D28,	%g6
	array32	%i6,	%i0,	%g5
loop_2405:
	stw	%i2,	[%l7 + 0x74]
	bcc,pn	%xcc,	loop_2406
	movvs	%icc,	%i4,	%o0
	andncc	%g4,	%l5,	%l4
	ldd	[%l7 + 0x20],	%i0
loop_2406:
	umulcc	%l1,	%l2,	%o7
	sdivx	%g1,	0x1A17,	%o2
	smulcc	%g2,	%l3,	%o3
	tvc	%icc,	0x7
	bcs,a	loop_2407
	tge	%icc,	0x0
	andncc	%o5,	%l0,	%g7
	fmul8x16al	%f15,	%f20,	%f0
loop_2407:
	tpos	%icc,	0x6
	bpos,pn	%xcc,	loop_2408
	nop
	setx	0x8CE3846B14B11BF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xC689E4E7F38DA80D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f6,	%f16
	brlz	%i5,	loop_2409
	fba,a	%fcc0,	loop_2410
loop_2408:
	sir	0x053C
	edge16n	%o4,	%o1,	%o6
loop_2409:
	edge16	%g3,	%l6,	%i3
loop_2410:
	fmovsgu	%icc,	%f16,	%f15
	alignaddr	%g6,	%i6,	%i7
	sdivx	%i0,	0x006E,	%i2
	edge16ln	%i4,	%g5,	%g4
	alignaddrl	%l5,	%l4,	%i1
	edge32ln	%o0,	%l2,	%l1
	fbe	%fcc0,	loop_2411
	bge,a,pt	%xcc,	loop_2412
	ble,pt	%icc,	loop_2413
	addc	%g1,	%o2,	%o7
loop_2411:
	movneg	%xcc,	%l3,	%g2
loop_2412:
	movleu	%icc,	%o5,	%l0
loop_2413:
	nop
	set	0x30, %l6
	stba	%g7,	[%l7 + %l6] 0x22
	membar	#Sync
	fandnot2	%f16,	%f2,	%f18
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o4
	srlx	%o3,	0x14,	%o1
	te	%xcc,	0x4
	fabsd	%f18,	%f6
	subccc	%g3,	0x00BA,	%l6
	tpos	%xcc,	0x7
	subcc	%o6,	0x194F,	%g6
	sir	0x1145
	for	%f0,	%f22,	%f18
	nop
	setx	loop_2414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%i3,	%i7,	%i0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i2
loop_2414:
	movcs	%xcc,	%i6,	%g5
	sdivcc	%i4,	0x1B73,	%g4
	nop
	setx loop_2415, %l0, %l1
	jmpl %l1, %l5
	fmovrdlez	%i1,	%f2,	%f22
	bl	%xcc,	loop_2416
	fmovrsgez	%l4,	%f15,	%f25
loop_2415:
	nop
	fitod	%f12,	%f26
	fdtoi	%f26,	%f8
	bn,a,pt	%icc,	loop_2417
loop_2416:
	alignaddrl	%l2,	%o0,	%l1
	membar	0x62
	sir	0x00A0
loop_2417:
	nop
	set	0x1E, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g1
	edge8n	%o2,	%o7,	%g2
	mulscc	%l3,	0x0CAA,	%l0
	xorcc	%g7,	0x0F4D,	%o5
	movrne	%o4,	%i5,	%o1
	movrlez	%o3,	0x236,	%l6
	bcs,a,pt	%xcc,	loop_2418
	fnand	%f24,	%f18,	%f14
	edge16n	%g3,	%g6,	%o6
	ld	[%l7 + 0x30],	%f0
loop_2418:
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f6
	fxtos	%f6,	%f23
	movg	%icc,	%i3,	%i0
	ldsb	[%l7 + 0x2C],	%i2
	fandnot2s	%f23,	%f22,	%f20
	ldd	[%l7 + 0x10],	%i6
	fble	%fcc2,	loop_2419
	movrgz	%i6,	%i4,	%g5
	taddcctv	%g4,	%i1,	%l5
	fblg	%fcc1,	loop_2420
loop_2419:
	fpsub32s	%f12,	%f23,	%f23
	mulx	%l4,	0x1D3D,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2420:
	fmovrslz	%l1,	%f31,	%f26
	subccc	%l2,	%o2,	%o7
	andn	%g2,	0x1B0A,	%g1
	edge16n	%l0,	%g7,	%o5
	fpackfix	%f24,	%f10
	movvs	%icc,	%o4,	%l3
	fmovsne	%xcc,	%f21,	%f11
	subccc	%o1,	%i5,	%o3
	xnorcc	%l6,	0x0061,	%g3
	fpack16	%f14,	%f20
	ble,pn	%xcc,	loop_2421
	fmul8sux16	%f20,	%f14,	%f22
	move	%xcc,	%g6,	%i3
	popc	%i0,	%i2
loop_2421:
	fnot2	%f24,	%f22
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x67] %asi,	%o6
	tvc	%xcc,	0x7
	mulx	%i7,	0x1291,	%i4
	addc	%g5,	%g4,	%i1
	alignaddr	%i6,	%l4,	%l5
	fbge	%fcc3,	loop_2422
	or	%o0,	%l2,	%l1
	fmovrdgez	%o7,	%f8,	%f8
	sethi	0x1EB9,	%o2
loop_2422:
	edge8n	%g1,	%l0,	%g2
	fnegs	%f10,	%f14
	movpos	%icc,	%o5,	%g7
	nop
	setx loop_2423, %l0, %l1
	jmpl %l1, %l3
	sra	%o4,	0x10,	%o1
	fbl	%fcc3,	loop_2424
	sethi	0x0D8A,	%i5
loop_2423:
	orncc	%l6,	%o3,	%g6
	fmovdneg	%icc,	%f7,	%f2
loop_2424:
	orn	%g3,	%i0,	%i2
	edge8n	%o6,	%i3,	%i7
	movn	%icc,	%i4,	%g5
	edge16	%i1,	%i6,	%g4
	umulcc	%l5,	%o0,	%l4
	edge16n	%l1,	%o7,	%o2
	brnz	%g1,	loop_2425
	array8	%l2,	%g2,	%o5
	movrgez	%g7,	0x0D8,	%l3
	fornot1s	%f18,	%f25,	%f3
loop_2425:
	array16	%l0,	%o4,	%o1
	addcc	%i5,	%o3,	%g6
	fornot2	%f0,	%f0,	%f22
	movrlz	%l6,	%g3,	%i0
	lduw	[%l7 + 0x78],	%o6
	flush	%l7 + 0x10
	sra	%i2,	%i3,	%i4
	xnor	%g5,	0x1848,	%i1
	sra	%i6,	0x13,	%i7
	smulcc	%l5,	0x171A,	%g4
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x6C] %asi,	%o0
	srax	%l4,	%l1,	%o7
	stbar
	tvs	%xcc,	0x1
	sllx	%o2,	0x15,	%g1
	orcc	%l2,	0x12FB,	%o5
	taddcctv	%g2,	0x01AD,	%g7
	ldub	[%l7 + 0x4C],	%l0
	fzero	%f2
	nop
	fitos	%f6,	%f25
	fstox	%f25,	%f18
	fxtos	%f18,	%f22
	brgz,a	%o4,	loop_2426
	fmovrdne	%l3,	%f10,	%f28
	popc	0x087F,	%o1
	alignaddr	%o3,	%g6,	%i5
loop_2426:
	subccc	%g3,	%i0,	%l6
	andcc	%o6,	%i2,	%i3
	fzeros	%f17
	nop
	setx	loop_2427,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%g5,	%i1,	%i4
	fzero	%f6
	tl	%xcc,	0x0
loop_2427:
	fmovsle	%xcc,	%f4,	%f27
	xor	%i6,	%l5,	%g4
	fcmpeq16	%f12,	%f22,	%i7
	add	%o0,	0x04E3,	%l4
	movrlz	%l1,	%o7,	%g1
	tsubcctv	%l2,	%o5,	%o2
	sdivx	%g7,	0x1B0C,	%g2
	fexpand	%f19,	%f8
	popc	%l0,	%o4
	tleu	%xcc,	0x5
	movcs	%xcc,	%l3,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g6,	%o1,	%g3
	brgez,a	%i5,	loop_2428
	fpadd32s	%f24,	%f17,	%f3
	edge32ln	%i0,	%o6,	%l6
	edge32n	%i3,	%g5,	%i1
loop_2428:
	array8	%i2,	%i4,	%l5
	tne	%xcc,	0x7
	movrgz	%i6,	%g4,	%o0
	fpadd16	%f12,	%f12,	%f14
	umulcc	%i7,	0x0B72,	%l1
	fmovdcc	%icc,	%f2,	%f1
	subccc	%l4,	%o7,	%g1
	nop
	setx	0xF1B1BF98205D2B02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	bneg,pt	%icc,	loop_2429
	lduh	[%l7 + 0x3C],	%l2
	be,a	%icc,	loop_2430
	fmovdpos	%icc,	%f27,	%f6
loop_2429:
	tsubcctv	%o2,	0x1B96,	%g7
	set	0x2D, %g1
	ldsba	[%l7 + %g1] 0x19,	%o5
loop_2430:
	tpos	%icc,	0x5
	lduw	[%l7 + 0x64],	%g2
	set	0x1C, %l4
	stwa	%l0,	[%l7 + %l4] 0x89
	xnorcc	%o4,	0x1F55,	%l3
	sethi	0x1DDC,	%g6
	wr	%g0,	0x80,	%asi
	stha	%o1,	[%l7 + 0x68] %asi
	movre	%g3,	0x1BC,	%i5
	fba	%fcc3,	loop_2431
	orcc	%o3,	0x02B1,	%i0
	movrgez	%o6,	0x1FA,	%l6
	bcs,a	%icc,	loop_2432
loop_2431:
	umul	%g5,	0x06FF,	%i1
	ta	%xcc,	0x4
	tsubcctv	%i2,	0x1442,	%i3
loop_2432:
	bg	loop_2433
	call	loop_2434
	alignaddrl	%i4,	%l5,	%g4
	tvc	%xcc,	0x7
loop_2433:
	prefetch	[%l7 + 0x30],	 0x3
loop_2434:
	fpsub32s	%f1,	%f18,	%f7
	array8	%o0,	%i6,	%l1
	srax	%l4,	%o7,	%g1
	addcc	%l2,	%i7,	%o2
	sdiv	%o5,	0x14CC,	%g2
	te	%xcc,	0x5
	xnorcc	%g7,	0x04C0,	%o4
	movg	%xcc,	%l0,	%l3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x68] %asi,	%f14
	fxnor	%f22,	%f22,	%f8
	fmovsa	%icc,	%f17,	%f18
	movne	%icc,	%g6,	%o1
	fbul	%fcc2,	loop_2435
	orn	%i5,	%g3,	%o3
	fbug,a	%fcc0,	loop_2436
	fornot1s	%f13,	%f14,	%f22
loop_2435:
	fandnot2	%f14,	%f2,	%f0
	fabss	%f5,	%f26
loop_2436:
	bleu	loop_2437
	popc	0x0567,	%i0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x57] %asi,	%o6
loop_2437:
	alignaddrl	%l6,	%g5,	%i2
	mulscc	%i1,	%i4,	%i3
	edge32ln	%g4,	%l5,	%i6
	and	%o0,	0x1FA9,	%l4
	xnor	%o7,	0x0C21,	%l1
	edge32ln	%l2,	%g1,	%i7
	xnor	%o2,	0x1A74,	%o5
	movrgez	%g7,	%o4,	%l0
	sdivx	%g2,	0x0FAA,	%g6
	orcc	%o1,	0x0D01,	%l3
	orncc	%i5,	%g3,	%i0
	sir	0x1CFC
	array8	%o3,	%l6,	%o6
	smul	%g5,	%i2,	%i4
	add	%i3,	0x0760,	%i1
	fmul8x16	%f8,	%f14,	%f16
	edge8	%l5,	%i6,	%g4
	membar	0x77
	tcc	%icc,	0x7
	fbne	%fcc3,	loop_2438
	fmovrdlez	%l4,	%f30,	%f14
	movcc	%icc,	%o0,	%o7
	sdivx	%l2,	0x1715,	%l1
loop_2438:
	membar	0x0D
	udivcc	%i7,	0x1645,	%o2
	tcc	%icc,	0x2
	brlez,a	%g1,	loop_2439
	tgu	%xcc,	0x6
	sll	%g7,	0x03,	%o4
	tge	%icc,	0x1
loop_2439:
	bleu,pn	%icc,	loop_2440
	fbul	%fcc0,	loop_2441
	move	%xcc,	%l0,	%o5
	fmovdcc	%icc,	%f7,	%f15
loop_2440:
	nop
	setx	loop_2442,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2441:
	popc	0x1B34,	%g6
	fbe,a	%fcc0,	loop_2443
	nop
	setx	0x2FE7F2E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x547EFADB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f23,	%f5
loop_2442:
	fxors	%f9,	%f13,	%f12
	bleu,a	loop_2444
loop_2443:
	fcmpne32	%f14,	%f16,	%o1
	bn,a	%icc,	loop_2445
	fmuld8sux16	%f20,	%f6,	%f8
loop_2444:
	sub	%g2,	0x0E53,	%l3
	xnor	%i5,	0x055A,	%i0
loop_2445:
	ta	%icc,	0x3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%o3
	fnegs	%f6,	%f21
	addcc	%o6,	0x0F50,	%l6
	set	0x58, %l5
	stwa	%i2,	[%l7 + %l5] 0xe3
	membar	#Sync
	fnegd	%f22,	%f20
	fmovrslez	%i4,	%f1,	%f20
	nop
	setx	0x4483A5A47054C3D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	std	%f22,	[%l7 + 0x40]
	membar	0x10
	nop
	fitos	%f23,	%f22
	tge	%icc,	0x2
	edge32n	%g5,	%i1,	%l5
	fmovrdgez	%i6,	%f14,	%f0
	brz,a	%g4,	loop_2446
	sllx	%l4,	0x16,	%i3
	movge	%icc,	%o7,	%l2
	wr	%g0,	0xea,	%asi
	stba	%l1,	[%l7 + 0x0B] %asi
	membar	#Sync
loop_2446:
	edge8ln	%o0,	%i7,	%o2
	fexpand	%f9,	%f20
	movge	%xcc,	%g1,	%o4
	fmovdleu	%icc,	%f8,	%f18
	fsrc2s	%f7,	%f28
	addcc	%l0,	%o5,	%g7
	taddcctv	%o1,	%g6,	%l3
	tsubcctv	%g2,	0x05EA,	%i5
	fcmpgt16	%f6,	%f16,	%g3
	edge32ln	%i0,	%o6,	%l6
	bshuffle	%f6,	%f2,	%f22
	sir	0x0638
	membar	0x39
	edge8n	%i2,	%o3,	%i4
	sdivx	%i1,	0x039C,	%l5
	fpadd16	%f28,	%f14,	%f14
	fblg	%fcc2,	loop_2447
	tle	%icc,	0x0
	sllx	%i6,	%g4,	%g5
	movle	%icc,	%i3,	%o7
loop_2447:
	addcc	%l4,	%l1,	%l2
	fmul8x16	%f1,	%f30,	%f28
	fmovsge	%icc,	%f2,	%f16
	sll	%i7,	%o0,	%o2
	fcmpeq32	%f6,	%f4,	%g1
	mulscc	%l0,	0x1132,	%o5
	movneg	%xcc,	%g7,	%o1
	alignaddrl	%g6,	%o4,	%l3
	fble	%fcc2,	loop_2448
	bl,a,pn	%xcc,	loop_2449
	fsrc2s	%f23,	%f8
	sllx	%g2,	0x13,	%g3
loop_2448:
	tvs	%xcc,	0x4
loop_2449:
	nop
	setx	0x68117784,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x368C6EB9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f23,	%f24
	nop
	setx loop_2450, %l0, %l1
	jmpl %l1, %i0
	mulx	%o6,	0x044C,	%l6
	tsubcc	%i2,	%o3,	%i5
	sdiv	%i4,	0x199D,	%i1
loop_2450:
	or	%i6,	0x1AB7,	%g4
	lduh	[%l7 + 0x2C],	%l5
	fcmple32	%f26,	%f26,	%i3
	andncc	%g5,	%o7,	%l4
	fnot1s	%f21,	%f11
	bgu,pn	%xcc,	loop_2451
	fbe,a	%fcc2,	loop_2452
	ldd	[%l7 + 0x30],	%l2
	andncc	%l1,	%o0,	%o2
loop_2451:
	sll	%g1,	%i7,	%o5
loop_2452:
	movg	%xcc,	%g7,	%o1
	sethi	0x04FF,	%l0
	fzeros	%f30
	edge32l	%o4,	%l3,	%g6
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%g2
	tcc	%xcc,	0x2
	movl	%xcc,	%i0,	%o6
	or	%l6,	0x17FA,	%g3
	te	%icc,	0x3
	srlx	%i2,	%i5,	%o3
	fmovdpos	%icc,	%f23,	%f28
	edge16ln	%i4,	%i1,	%g4
	mulscc	%i6,	%l5,	%i3
	fnegs	%f2,	%f0
	mulx	%g5,	%o7,	%l4
	nop
	setx	0x8023627C16F57D35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1F5DBC705CA22FA9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f22,	%f30
	ba,pn	%icc,	loop_2453
	sdivcc	%l1,	0x1B1B,	%l2
	edge8	%o2,	%o0,	%g1
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x17
	membar	#Sync
loop_2453:
	edge8	%o5,	%i7,	%o1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o4,	0x16D9,	%l3
	andn	%g6,	0x066C,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g2,	%o6
	movneg	%xcc,	%l6,	%g3
	add	%i0,	%i5,	%i2
	bcs	%xcc,	loop_2454
	tcc	%xcc,	0x6
	edge32ln	%i4,	%o3,	%g4
	andn	%i6,	0x0404,	%l5
loop_2454:
	fbul,a	%fcc1,	loop_2455
	nop
	setx	0xE5B72960,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xE906E346,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f29,	%f27
	popc	0x0BF4,	%i1
	stw	%i3,	[%l7 + 0x78]
loop_2455:
	nop
	fitos	%f8,	%f0
	fstoi	%f0,	%f3
	set	0x6C, %l1
	lda	[%l7 + %l1] 0x10,	%f17
	mulscc	%o7,	0x15D9,	%l4
	nop
	fitod	%f16,	%f18
	subccc	%l1,	%l2,	%g5
	move	%xcc,	%o0,	%g1
	movl	%icc,	%o2,	%i7
	tcc	%xcc,	0x7
	movleu	%icc,	%o1,	%o5
	edge16n	%l0,	%l3,	%g6
	tleu	%xcc,	0x1
	edge32ln	%g7,	%o4,	%o6
	addcc	%g2,	%l6,	%g3
	bpos,pt	%icc,	loop_2456
	array32	%i0,	%i5,	%i4
	bge	%xcc,	loop_2457
	ldsh	[%l7 + 0x7E],	%o3
loop_2456:
	movrlez	%i2,	%i6,	%l5
	edge16ln	%i1,	%g4,	%i3
loop_2457:
	tleu	%icc,	0x7
	edge16l	%l4,	%l1,	%o7
	or	%g5,	%o0,	%g1
	movpos	%icc,	%o2,	%l2
	flush	%l7 + 0x68
	fmovse	%xcc,	%f19,	%f20
	smul	%o1,	%o5,	%i7
	fmovrdne	%l3,	%f14,	%f28
	sdiv	%l0,	0x12E7,	%g7
	nop
	setx	0x428B85E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x405A013C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f24,	%f14
	orcc	%o4,	0x0C48,	%o6
	smul	%g6,	0x0425,	%g2
	fmovrdlz	%l6,	%f24,	%f26
	array8	%g3,	%i5,	%i4
	fornot2	%f22,	%f18,	%f10
	tge	%xcc,	0x1
	fone	%f26
	for	%f16,	%f26,	%f12
	tn	%xcc,	0x6
	orcc	%o3,	0x1851,	%i2
	fmovrse	%i6,	%f14,	%f27
	nop
	setx	0xA067D114,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fpadd32s	%f16,	%f2,	%f2
	tn	%icc,	0x6
	movrgez	%i0,	%i1,	%g4
	membar	0x59
	fbe	%fcc3,	loop_2458
	andcc	%l5,	%l4,	%i3
	fmovde	%icc,	%f19,	%f19
	fexpand	%f26,	%f2
loop_2458:
	sir	0x1EF1
	fmovdne	%xcc,	%f21,	%f17
	and	%l1,	%g5,	%o7
	tpos	%icc,	0x4
	tgu	%icc,	0x4
	xorcc	%o0,	%g1,	%o2
	te	%xcc,	0x5
	movre	%o1,	%o5,	%i7
	mova	%icc,	%l3,	%l0
	tle	%icc,	0x2
	xnor	%g7,	0x1786,	%o4
	orncc	%o6,	%g6,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g3
	te	%icc,	0x1
	flush	%l7 + 0x1C
	edge16	%l6,	%i4,	%o3
	movl	%icc,	%i2,	%i6
	edge16ln	%i5,	%i0,	%i1
	andncc	%g4,	%l5,	%i3
	tgu	%xcc,	0x6
	movrgz	%l1,	%l4,	%g5
	tvs	%icc,	0x1
	brgz	%o7,	loop_2459
	sll	%g1,	0x1D,	%o2
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x19,	%f13
loop_2459:
	movgu	%xcc,	%o0,	%o5
	nop
	setx loop_2460, %l0, %l1
	jmpl %l1, %i7
	tle	%icc,	0x0
	nop
	setx	0xD53365EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x822A9F66,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f3,	%f8
	stb	%l3,	[%l7 + 0x2D]
loop_2460:
	fmul8x16al	%f9,	%f7,	%f10
	edge32ln	%o1,	%l0,	%g7
	movge	%icc,	%o4,	%g6
	mulscc	%g2,	0x077D,	%o6
	movrlz	%l2,	%g3,	%l6
	edge32n	%i4,	%i2,	%i6
	movre	%o3,	%i5,	%i1
	subccc	%g4,	%l5,	%i0
	movrlz	%i3,	%l4,	%g5
	movge	%xcc,	%l1,	%o7
	membar	0x51
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f18
	tsubcctv	%o2,	0x1E2A,	%g1
	mulscc	%o5,	%i7,	%o0
	fmovrse	%l3,	%f27,	%f15
	fornot2	%f16,	%f28,	%f12
	fandnot2s	%f11,	%f7,	%f4
	fandnot2	%f10,	%f22,	%f8
	ldstub	[%l7 + 0x19],	%l0
	movleu	%icc,	%g7,	%o4
	edge8	%g6,	%g2,	%o1
	fbul,a	%fcc0,	loop_2461
	fabsd	%f16,	%f14
	movrlez	%o6,	0x015,	%l2
	movgu	%xcc,	%l6,	%g3
loop_2461:
	fandnot2s	%f27,	%f20,	%f16
	nop
	setx	0x91DE622CC0C998D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1CCA8A24F231C569,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f8,	%f30
	addcc	%i2,	%i4,	%o3
	xnorcc	%i6,	%i5,	%i1
	array16	%l5,	%g4,	%i0
	orcc	%i3,	%g5,	%l1
	nop
	fitos	%f11,	%f23
	tge	%icc,	0x2
	fbg	%fcc3,	loop_2462
	orcc	%l4,	%o2,	%g1
	subccc	%o7,	%i7,	%o0
	ldstub	[%l7 + 0x19],	%o5
loop_2462:
	mova	%icc,	%l0,	%g7
	smulcc	%l3,	0x1B40,	%o4
	and	%g6,	%g2,	%o6
	fabss	%f12,	%f27
	smulcc	%o1,	%l2,	%l6
	movpos	%xcc,	%g3,	%i2
	set	0x54, %g2
	stha	%o3,	[%l7 + %g2] 0x19
	udivcc	%i6,	0x095E,	%i5
	edge8n	%i1,	%l5,	%i4
	srl	%i0,	%g4,	%i3
	fblg,a	%fcc0,	loop_2463
	pdist	%f22,	%f26,	%f0
	edge16ln	%g5,	%l1,	%l4
	addccc	%o2,	%o7,	%g1
loop_2463:
	fmovda	%icc,	%f17,	%f8
	edge32n	%o0,	%i7,	%l0
	andncc	%o5,	%g7,	%l3
	sllx	%o4,	%g2,	%o6
	fsrc1	%f6,	%f20
	set	0x3D, %g3
	lduba	[%l7 + %g3] 0x04,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xB12E45D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x466C6800,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f23,	%f19
	srl	%o1,	0x13,	%l2
	fandnot1s	%f6,	%f27,	%f19
	fcmpgt16	%f2,	%f22,	%l6
	nop
	setx	0xBF2DA49BCB7F1C75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x30E401C4D2A07B92,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f6,	%f28
	fmovdcc	%xcc,	%f5,	%f18
	umulcc	%g3,	%o3,	%i6
	umulcc	%i2,	%i1,	%l5
	fbl	%fcc0,	loop_2464
	swap	[%l7 + 0x10],	%i5
	udivcc	%i0,	0x175E,	%i4
	movg	%icc,	%g4,	%g5
loop_2464:
	subc	%l1,	%i3,	%o2
	sub	%o7,	0x0273,	%l4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o0
	srlx	%g1,	%l0,	%o5
	ldd	[%l7 + 0x78],	%g6
	srlx	%i7,	%l3,	%g2
	nop
	setx	loop_2465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%xcc,	0x1
	movneg	%icc,	%o6,	%o4
	subc	%o1,	0x08AE,	%g6
loop_2465:
	nop
	fitos	%f2,	%f29
	fstox	%f29,	%f10
	fxtos	%f10,	%f29
	movrlz	%l6,	0x232,	%l2
	fmovde	%icc,	%f17,	%f9
	fornot2s	%f17,	%f28,	%f30
	fmovdg	%xcc,	%f28,	%f24
	movrlez	%g3,	0x284,	%i6
	tge	%xcc,	0x6
	movne	%icc,	%o3,	%i2
	brz,a	%l5,	loop_2466
	sdiv	%i1,	0x0922,	%i0
	or	%i4,	0x1F55,	%i5
	subccc	%g4,	0x1C90,	%l1
loop_2466:
	fmuld8sux16	%f27,	%f12,	%f12
	mulscc	%i3,	%o2,	%g5
	srlx	%l4,	0x0D,	%o7
	movcs	%xcc,	%o0,	%g1
	tpos	%icc,	0x1
	mova	%xcc,	%o5,	%g7
	fbe,a	%fcc2,	loop_2467
	stbar
	movrgz	%l0,	%l3,	%i7
	set	0x30, %o4
	stha	%o6,	[%l7 + %o4] 0x10
loop_2467:
	prefetch	[%l7 + 0x58],	 0x2
	ld	[%l7 + 0x34],	%f8
	nop
	setx	0x4D6F5494,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xDC977732,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f26,	%f16
	taddcctv	%g2,	%o4,	%o1
	subc	%l6,	0x1FB8,	%g6
	popc	%l2,	%i6
	set	0x18, %o5
	ldstuba	[%l7 + %o5] 0x11,	%o3
	srlx	%i2,	%g3,	%i1
	fmovrsne	%i0,	%f15,	%f14
	be,a	loop_2468
	fbuge	%fcc2,	loop_2469
	taddcc	%i4,	%l5,	%g4
	fzero	%f2
loop_2468:
	movne	%xcc,	%i5,	%l1
loop_2469:
	fpackfix	%f10,	%f8
	fpackfix	%f24,	%f23
	srl	%i3,	0x16,	%g5
	srax	%l4,	0x04,	%o7
	tg	%xcc,	0x2
	subc	%o0,	%g1,	%o2
	sth	%o5,	[%l7 + 0x5A]
	tneg	%xcc,	0x4
	wr	%g0,	0x19,	%asi
	stha	%l0,	[%l7 + 0x3A] %asi
	sllx	%l3,	0x1B,	%i7
	fblg	%fcc3,	loop_2470
	fone	%f10
	flush	%l7 + 0x4C
	fornot2s	%f17,	%f14,	%f0
loop_2470:
	xorcc	%g7,	%o6,	%o4
	tcs	%icc,	0x7
	fones	%f31
	fbul,a	%fcc3,	loop_2471
	fmul8ulx16	%f26,	%f26,	%f4
	fpmerge	%f26,	%f12,	%f8
	ba,pn	%xcc,	loop_2472
loop_2471:
	movvc	%icc,	%g2,	%l6
	add	%o1,	0x1296,	%l2
	call	loop_2473
loop_2472:
	fmovrsgz	%i6,	%f0,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o3,	%i2
loop_2473:
	fbu,a	%fcc0,	loop_2474
	nop
	fitos	%f5,	%f14
	fstod	%f14,	%f12
	fmovsleu	%icc,	%f26,	%f26
	fmovrdlez	%g6,	%f26,	%f28
loop_2474:
	ta	%xcc,	0x7
	fornot1	%f16,	%f18,	%f30
	addccc	%i1,	%i0,	%i4
	udivx	%l5,	0x061E,	%g4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%i5
	stx	%l1,	[%l7 + 0x08]
	ld	[%l7 + 0x30],	%f19
	fbo	%fcc2,	loop_2475
	or	%i3,	%g5,	%g3
	sethi	0x10F0,	%o7
	edge32l	%l4,	%g1,	%o2
loop_2475:
	tn	%icc,	0x3
	fmovdn	%xcc,	%f28,	%f27
	edge32n	%o0,	%l0,	%l3
	addcc	%o5,	%g7,	%i7
	add	%o6,	0x11A9,	%o4
	smulcc	%g2,	0x1357,	%l6
	addccc	%l2,	%o1,	%i6
	xorcc	%i2,	%g6,	%o3
	movrgez	%i1,	%i0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x3
	te	%xcc,	0x6
	set	0x6C, %i5
	ldsha	[%l7 + %i5] 0x11,	%g4
	udivx	%l5,	0x0EA7,	%l1
	call	loop_2476
	smulcc	%i5,	0x0C45,	%g5
	fpsub32s	%f11,	%f17,	%f30
	sllx	%i3,	%g3,	%l4
loop_2476:
	sllx	%g1,	%o7,	%o2
	tleu	%icc,	0x5
	wr	%g0,	0x80,	%asi
	sta	%f21,	[%l7 + 0x74] %asi
	subcc	%l0,	0x030C,	%o0
	fbu	%fcc1,	loop_2477
	mulx	%l3,	0x19FE,	%g7
	sll	%o5,	%o6,	%o4
	bneg,a,pt	%xcc,	loop_2478
loop_2477:
	orcc	%i7,	%g2,	%l2
	subcc	%l6,	%i6,	%i2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g6
loop_2478:
	fnegs	%f1,	%f9
	fmovdl	%icc,	%f12,	%f7
	fpack32	%f22,	%f12,	%f4
	tsubcctv	%o3,	0x1C6B,	%i1
	stb	%o1,	[%l7 + 0x25]
	andn	%i4,	0x182E,	%i0
	fbn,a	%fcc1,	loop_2479
	fmovdcs	%icc,	%f28,	%f18
	set	0x28, %i6
	stxa	%g4,	[%l7 + %i6] 0x80
loop_2479:
	and	%l1,	0x1738,	%i5
	fmovrslz	%g5,	%f9,	%f3
	mova	%icc,	%l5,	%g3
	fmovdge	%xcc,	%f17,	%f28
	orcc	%i3,	%l4,	%o7
	nop
	setx	0x144414C2F06D6CAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	tcc	%icc,	0x4
	sll	%o2,	%g1,	%o0
	ta	%icc,	0x2
	addc	%l0,	%l3,	%g7
	membar	0x05
	nop
	setx loop_2480, %l0, %l1
	jmpl %l1, %o6
	fcmpeq16	%f6,	%f14,	%o5
	edge32ln	%i7,	%g2,	%l2
	brlez,a	%l6,	loop_2481
loop_2480:
	fmovde	%xcc,	%f24,	%f11
	sir	0x1B76
	edge8	%o4,	%i2,	%i6
loop_2481:
	fzero	%f4
	bcc,a,pt	%xcc,	loop_2482
	or	%o3,	%i1,	%g6
	ble,pt	%icc,	loop_2483
	movcs	%xcc,	%o1,	%i0
loop_2482:
	movge	%icc,	%g4,	%l1
	set	0x28, %o1
	lduwa	[%l7 + %o1] 0x14,	%i5
loop_2483:
	fmovrdne	%i4,	%f30,	%f14
	tpos	%xcc,	0x3
	smulcc	%l5,	0x1B1D,	%g5
	fmovsn	%xcc,	%f13,	%f16
	brgez,a	%i3,	loop_2484
	fpsub32s	%f20,	%f1,	%f4
	fmovs	%f5,	%f23
	tvs	%icc,	0x2
loop_2484:
	mulx	%l4,	0x1325,	%o7
	bl,pn	%xcc,	loop_2485
	fandnot2	%f26,	%f14,	%f8
	stw	%g3,	[%l7 + 0x38]
	bvc,pn	%xcc,	loop_2486
loop_2485:
	pdist	%f16,	%f24,	%f6
	alignaddrl	%o2,	%o0,	%l0
	smul	%l3,	0x071B,	%g7
loop_2486:
	subc	%o6,	%o5,	%i7
	fmul8x16	%f19,	%f8,	%f0
	tsubcctv	%g2,	0x03AD,	%l2
	srl	%l6,	0x0D,	%o4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f16
	fmovscc	%icc,	%f0,	%f3
	tg	%xcc,	0x5
	fcmple16	%f12,	%f18,	%i2
	add	%i6,	0x09BE,	%g1
	udivcc	%i1,	0x0FE7,	%g6
	udivcc	%o1,	0x0144,	%i0
	fmovdne	%icc,	%f15,	%f5
	fbug,a	%fcc0,	loop_2487
	tneg	%xcc,	0x7
	fpadd32	%f24,	%f6,	%f0
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
loop_2487:
	fpmerge	%f11,	%f30,	%f22
	udivcc	%g4,	0x1DF4,	%i5
	fmul8sux16	%f24,	%f20,	%f26
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%l5
	ta	%icc,	0x7
	edge32	%i4,	%g5,	%i3
	fpsub16s	%f16,	%f26,	%f14
	swap	[%l7 + 0x10],	%l4
	membar	0x56
	tgu	%xcc,	0x3
	ldsh	[%l7 + 0x4E],	%o7
	ldsb	[%l7 + 0x1C],	%g3
	fbul	%fcc2,	loop_2488
	fbu,a	%fcc0,	loop_2489
	edge16l	%o0,	%l0,	%o2
	set	0x30, %o2
	ldxa	[%g0 + %o2] 0x4f,	%g7
loop_2488:
	udiv	%l3,	0x136E,	%o5
loop_2489:
	sra	%o6,	%g2,	%l2
	fbule,a	%fcc0,	loop_2490
	udivx	%l6,	0x18A4,	%i7
	stx	%i2,	[%l7 + 0x08]
	tcs	%xcc,	0x4
loop_2490:
	or	%o4,	0x15EA,	%g1
	nop
	setx	0x06280316D7689D6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x9601CD4AED8D53DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f6,	%f4
	movl	%icc,	%i1,	%g6
	andncc	%i6,	%o1,	%o3
	fblg	%fcc0,	loop_2491
	or	%i0,	0x1E6B,	%i5
	fmovdge	%icc,	%f9,	%f15
	brnz,a	%g4,	loop_2492
loop_2491:
	fandnot1s	%f15,	%f28,	%f26
	edge16l	%l1,	%i4,	%g5
	move	%xcc,	%i3,	%l5
loop_2492:
	udivcc	%o7,	0x1D8E,	%g3
	nop
	setx	0x49DB57AEFB4359D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0160C12DE1BB2D43,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f26,	%f18
	nop
	setx	loop_2493,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%l4,	%o0,	%o2
	movl	%icc,	%g7,	%l3
	addccc	%l0,	%o6,	%g2
loop_2493:
	movvs	%xcc,	%l2,	%o5
	nop
	setx	0xE913AABE204E12B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmovdneg	%icc,	%f31,	%f17
	fmovdcs	%xcc,	%f29,	%f16
	edge32l	%l6,	%i7,	%o4
	brgz,a	%g1,	loop_2494
	fmovdcs	%xcc,	%f3,	%f23
	add	%i2,	0x14BB,	%g6
	subc	%i1,	%o1,	%o3
loop_2494:
	movl	%xcc,	%i0,	%i5
	edge32n	%i6,	%g4,	%i4
	tgu	%xcc,	0x5
	tcc	%xcc,	0x7
	edge8ln	%g5,	%l1,	%l5
	fand	%f18,	%f10,	%f18
	movrgez	%i3,	%g3,	%o7
	udivx	%o0,	0x0E4C,	%l4
	brnz,a	%o2,	loop_2495
	bleu,pn	%icc,	loop_2496
	mulx	%g7,	%l0,	%o6
	movcs	%xcc,	%g2,	%l3
loop_2495:
	sll	%o5,	%l6,	%i7
loop_2496:
	fbuge	%fcc2,	loop_2497
	fmul8ulx16	%f26,	%f26,	%f12
	or	%o4,	%g1,	%l2
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x10,	%g6
loop_2497:
	udiv	%i2,	0x01D8,	%o1
	fmovdneg	%icc,	%f25,	%f30
	edge32n	%o3,	%i1,	%i0
	udiv	%i6,	0x12A4,	%i5
	edge8	%i4,	%g4,	%l1
	alignaddr	%g5,	%l5,	%g3
	nop
	setx	loop_2498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%icc,	0x7
	movle	%icc,	%i3,	%o7
	fmuld8sux16	%f4,	%f16,	%f12
loop_2498:
	fbu,a	%fcc0,	loop_2499
	fcmpeq32	%f26,	%f22,	%l4
	fxors	%f26,	%f29,	%f21
	fnot2	%f24,	%f12
loop_2499:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%o0
	fpadd16s	%f1,	%f8,	%f5
	movrgez	%g7,	%o6,	%g2
	ldd	[%l7 + 0x78],	%l0
	movrgz	%o5,	%l3,	%i7
	edge16ln	%o4,	%g1,	%l2
	std	%f26,	[%l7 + 0x38]
	movgu	%icc,	%g6,	%l6
	move	%xcc,	%i2,	%o3
	movneg	%xcc,	%i1,	%o1
	fxor	%f4,	%f16,	%f10
	nop
	setx	0xDD509B74C8D303A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f14
	addcc	%i0,	0x173A,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2500,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%xcc,	0x3
	umul	%i5,	%i4,	%g4
	fxor	%f18,	%f22,	%f0
loop_2500:
	udivx	%l1,	0x0D49,	%g5
	alignaddr	%l5,	%g3,	%i3
	umulcc	%o7,	%l4,	%o2
	fmovsneg	%icc,	%f2,	%f18
	nop
	fitos	%f8,	%f5
	fstod	%f5,	%f2
	tsubcctv	%g7,	0x1D89,	%o0
	tcc	%xcc,	0x2
	tcc	%icc,	0x3
	flush	%l7 + 0x44
	nop
	setx	0x8BFB4F48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x50071D02,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f30,	%f22
	taddcc	%o6,	0x137F,	%l0
	fnegd	%f2,	%f18
	xnorcc	%g2,	0x1C16,	%o5
	fand	%f14,	%f2,	%f10
	nop
	setx	loop_2501,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8l	%l3,	%o4,	%g1
	udiv	%i7,	0x0EE0,	%l2
	orn	%g6,	0x1FEA,	%i2
loop_2501:
	brgez	%l6,	loop_2502
	sdivcc	%i1,	0x1E81,	%o3
	xorcc	%o1,	%i0,	%i6
	edge16n	%i4,	%i5,	%l1
loop_2502:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x7C] %asi,	%g5
	sra	%g4,	0x1D,	%l5
	edge16n	%g3,	%i3,	%o7
	movre	%o2,	%g7,	%l4
	edge16ln	%o6,	%o0,	%l0
	taddcc	%g2,	0x18DE,	%o5
	movrne	%o4,	%g1,	%i7
	sethi	0x07CB,	%l2
	movg	%icc,	%l3,	%g6
	edge16ln	%l6,	%i1,	%o3
	umul	%i2,	%i0,	%o1
	te	%xcc,	0x5
	movvs	%xcc,	%i6,	%i5
	smulcc	%l1,	%i4,	%g5
	sub	%g4,	%g3,	%l5
	movgu	%icc,	%o7,	%i3
	fmovdne	%icc,	%f14,	%f13
	lduh	[%l7 + 0x40],	%g7
	movn	%xcc,	%o2,	%l4
	tvc	%icc,	0x1
	movne	%icc,	%o0,	%l0
	fpadd32s	%f31,	%f7,	%f23
	fnors	%f26,	%f13,	%f31
	fcmple32	%f24,	%f6,	%o6
	mulx	%o5,	%o4,	%g2
	fandnot2s	%f10,	%f30,	%f1
	wr	%g0,	0x89,	%asi
	stha	%g1,	[%l7 + 0x40] %asi
	nop
	setx	loop_2503,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%i7,	0x169F,	%l2
	fcmpne32	%f2,	%f24,	%g6
	movpos	%icc,	%l3,	%l6
loop_2503:
	fmovrsgz	%i1,	%f6,	%f18
	subc	%o3,	%i0,	%i2
	movre	%i6,	%i5,	%l1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%i4
	movpos	%xcc,	%g5,	%g4
	tle	%icc,	0x2
	fmovrsgez	%g3,	%f18,	%f10
	sllx	%l5,	0x0C,	%o7
	fbu,a	%fcc1,	loop_2504
	alignaddr	%o1,	%g7,	%i3
	fnegd	%f28,	%f8
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x70] %asi,	%l4
loop_2504:
	nop
	set	0x34, %l0
	stwa	%o2,	[%l7 + %l0] 0xe3
	membar	#Sync
	for	%f6,	%f6,	%f22
	fnand	%f18,	%f2,	%f18
	sdivx	%o0,	0x0E4B,	%l0
	addc	%o5,	0x0D3D,	%o4
	fmuld8ulx16	%f5,	%f23,	%f20
	fbo	%fcc2,	loop_2505
	subc	%o6,	%g2,	%i7
	tn	%xcc,	0x6
	fbue	%fcc1,	loop_2506
loop_2505:
	movvs	%xcc,	%g1,	%g6
	fblg	%fcc0,	loop_2507
	popc	0x1F27,	%l3
loop_2506:
	array8	%l2,	%i1,	%o3
	array32	%l6,	%i2,	%i6
loop_2507:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x76] %asi,	%i0
	fbg,a	%fcc0,	loop_2508
	edge8l	%l1,	%i5,	%i4
	udiv	%g5,	0x1F87,	%g4
	fands	%f9,	%f26,	%f24
loop_2508:
	xor	%g3,	%l5,	%o7
	fmovdcc	%xcc,	%f2,	%f18
	array16	%o1,	%g7,	%i3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%o2
	xnor	%o0,	%l0,	%l4
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f26
	fxtod	%f26,	%f24
	tneg	%icc,	0x5
	wr	%g0,	0x89,	%asi
	stxa	%o5,	[%l7 + 0x28] %asi
	fmovsvc	%xcc,	%f20,	%f19
	movrne	%o6,	0x005,	%g2
	or	%i7,	0x1791,	%g1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x22] %asi,	%o4
	addcc	%l3,	%l2,	%i1
	mulx	%o3,	0x028A,	%l6
	swap	[%l7 + 0x18],	%i2
	array32	%i6,	%i0,	%g6
	tcc	%xcc,	0x0
	tvs	%icc,	0x6
	move	%xcc,	%l1,	%i5
	umulcc	%g5,	0x19FD,	%i4
	tgu	%icc,	0x7
	bcs,pt	%icc,	loop_2509
	ldstub	[%l7 + 0x67],	%g3
	xnorcc	%g4,	0x02BA,	%l5
	tpos	%xcc,	0x5
loop_2509:
	nop
	setx	0x2743A322,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f0
	fmovrsne	%o7,	%f3,	%f18
	xnorcc	%o1,	0x17F1,	%g7
	movpos	%xcc,	%o2,	%o0
	fmovd	%f18,	%f8
	te	%icc,	0x7
	orn	%l0,	0x055B,	%i3
	edge8n	%l4,	%o6,	%g2
	movn	%xcc,	%i7,	%g1
	brz	%o4,	loop_2510
	movleu	%xcc,	%o5,	%l3
	fmovsn	%xcc,	%f13,	%f2
	movleu	%icc,	%l2,	%o3
loop_2510:
	fornot1	%f2,	%f28,	%f12
	movrne	%l6,	%i1,	%i6
	fbl	%fcc2,	loop_2511
	fmovscc	%xcc,	%f26,	%f1
	tne	%icc,	0x0
	ldstub	[%l7 + 0x0F],	%i0
loop_2511:
	movpos	%icc,	%i2,	%g6
	umul	%l1,	%i5,	%g5
	edge32ln	%g3,	%i4,	%l5
	fnegs	%f15,	%f29
	sdivcc	%o7,	0x191D,	%o1
	sll	%g7,	%g4,	%o0
	taddcctv	%o2,	0x04E4,	%l0
	edge8n	%i3,	%o6,	%g2
	movrlz	%i7,	0x1A2,	%l4
	brlz	%o4,	loop_2512
	movpos	%xcc,	%o5,	%l3
	set	0x74, %g4
	lduba	[%l7 + %g4] 0x0c,	%l2
loop_2512:
	nop
	wr	%g0,	0x88,	%asi
	stxa	%o3,	[%l7 + 0x48] %asi
	fmovdvc	%icc,	%f11,	%f7
	brgez,a	%l6,	loop_2513
	sllx	%g1,	%i6,	%i0
	fmovrdgez	%i1,	%f24,	%f2
	xnorcc	%i2,	0x18C0,	%g6
loop_2513:
	fblg,a	%fcc3,	loop_2514
	nop
	fitos	%f4,	%f22
	fstod	%f22,	%f20
	tl	%xcc,	0x7
	ldub	[%l7 + 0x34],	%l1
loop_2514:
	orncc	%g5,	0x0827,	%i5
	wr	%g0,	0x80,	%asi
	stwa	%g3,	[%l7 + 0x70] %asi
	lduw	[%l7 + 0x54],	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i4,	%o1
	prefetch	[%l7 + 0x40],	 0x2
	fcmpeq32	%f26,	%f28,	%o7
	tpos	%xcc,	0x3
	fbe	%fcc2,	loop_2515
	fmovscc	%icc,	%f2,	%f23
	movrgz	%g7,	%g4,	%o2
	fpadd16s	%f27,	%f9,	%f8
loop_2515:
	fblg,a	%fcc1,	loop_2516
	fcmpgt16	%f16,	%f30,	%l0
	fmovs	%f14,	%f23
	sdivcc	%i3,	0x0C31,	%o6
loop_2516:
	srlx	%g2,	%o0,	%i7
	set	0x58, %g6
	sta	%f11,	[%l7 + %g6] 0x10
	fmovsgu	%xcc,	%f26,	%f16
	udivcc	%l4,	0x154B,	%o5
	udivcc	%l3,	0x0509,	%o4
	umulcc	%l2,	%o3,	%l6
	alignaddr	%g1,	%i0,	%i1
	subcc	%i6,	%g6,	%l1
	mulscc	%i2,	%i5,	%g3
	tvs	%icc,	0x4
	ta	%icc,	0x5
	edge16n	%l5,	%i4,	%g5
	ldub	[%l7 + 0x29],	%o7
	fbu	%fcc1,	loop_2517
	membar	0x2A
	fble,a	%fcc3,	loop_2518
	alignaddr	%g7,	%g4,	%o1
loop_2517:
	fmuld8sux16	%f13,	%f28,	%f18
	tsubcctv	%l0,	%o2,	%i3
loop_2518:
	ble,a,pn	%icc,	loop_2519
	nop
	setx	0x606FF3A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	fpadd16	%f22,	%f6,	%f8
	mova	%xcc,	%o6,	%g2
loop_2519:
	sll	%o0,	0x09,	%i7
	fnands	%f2,	%f24,	%f27
	fnors	%f28,	%f28,	%f19
	tneg	%xcc,	0x1
	bcs,a,pn	%xcc,	loop_2520
	mova	%icc,	%l4,	%l3
	andcc	%o4,	%l2,	%o5
	edge16ln	%o3,	%l6,	%g1
loop_2520:
	sll	%i0,	%i6,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f23,	%f21
	movpos	%xcc,	%g6,	%l1
	movrlz	%i2,	%g3,	%i5
	fcmpeq16	%f26,	%f12,	%l5
	edge8ln	%g5,	%i4,	%o7
	bshuffle	%f16,	%f22,	%f26
	fmovdcs	%xcc,	%f25,	%f25
	edge32ln	%g4,	%g7,	%l0
	sdivcc	%o2,	0x01E9,	%o1
	st	%f25,	[%l7 + 0x7C]
	fbuge,a	%fcc3,	loop_2521
	fble	%fcc3,	loop_2522
	sdivx	%o6,	0x1D35,	%i3
	movne	%icc,	%o0,	%g2
loop_2521:
	fandnot1	%f24,	%f18,	%f16
loop_2522:
	fnor	%f6,	%f28,	%f16
	movneg	%xcc,	%l4,	%i7
	ba	loop_2523
	addcc	%o4,	%l3,	%l2
	nop
	setx	0x6063CAF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	tle	%icc,	0x2
loop_2523:
	movre	%o5,	0x3A5,	%o3
	fand	%f16,	%f24,	%f14
	orn	%l6,	0x124B,	%g1
	fmovsl	%xcc,	%f0,	%f17
	movre	%i0,	%i6,	%g6
	edge8ln	%i1,	%i2,	%g3
	lduh	[%l7 + 0x20],	%i5
	umul	%l1,	0x16FA,	%l5
	movgu	%icc,	%g5,	%i4
	fabsd	%f30,	%f24
	ldsw	[%l7 + 0x28],	%o7
	brz,a	%g7,	loop_2524
	stw	%g4,	[%l7 + 0x24]
	movrgez	%l0,	0x29B,	%o1
	fpadd16	%f16,	%f4,	%f10
loop_2524:
	movcc	%xcc,	%o6,	%i3
	udiv	%o0,	0x0B28,	%o2
	movg	%icc,	%g2,	%l4
	udivcc	%o4,	0x0CFC,	%l3
	fbu	%fcc3,	loop_2525
	mova	%xcc,	%i7,	%o5
	bcs,pt	%xcc,	loop_2526
	fxor	%f18,	%f28,	%f24
loop_2525:
	edge32	%o3,	%l6,	%l2
	fexpand	%f23,	%f0
loop_2526:
	sll	%i0,	%i6,	%g1
	swap	[%l7 + 0x20],	%g6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%i1
	fsrc1	%f18,	%f10
	fbge	%fcc3,	loop_2527
	membar	0x6B
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2527:
	tge	%xcc,	0x1
	fcmpeq32	%f10,	%f26,	%i2
	orcc	%i5,	%g3,	%l1
	bcs,a	loop_2528
	movrgez	%l5,	0x341,	%g5
	fpadd32	%f30,	%f18,	%f18
	for	%f26,	%f4,	%f22
loop_2528:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%o7,	[%l7 + 0x62] %asi
	sra	%i4,	%g4,	%g7
	fmovdg	%icc,	%f6,	%f9
	movvc	%xcc,	%l0,	%o6
	tleu	%xcc,	0x4
	movge	%xcc,	%o1,	%o0
	fmovdcs	%icc,	%f8,	%f22
	bge,pt	%icc,	loop_2529
	orcc	%o2,	%i3,	%l4
	set	0x32, %i4
	lduha	[%l7 + %i4] 0x0c,	%g2
loop_2529:
	std	%f24,	[%l7 + 0x08]
	movcs	%icc,	%l3,	%o4
	sra	%i7,	%o5,	%o3
	fmovrdlez	%l6,	%f22,	%f20
	move	%icc,	%i0,	%l2
	sdiv	%i6,	0x0CE3,	%g1
	fcmple32	%f2,	%f28,	%g6
	fble,a	%fcc2,	loop_2530
	alignaddrl	%i1,	%i2,	%i5
	subc	%g3,	0x06DF,	%l5
	stw	%l1,	[%l7 + 0x48]
loop_2530:
	edge32n	%g5,	%i4,	%o7
	nop
	setx	0x220AE228,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xE820DB15,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f28,	%f26
	orcc	%g4,	%g7,	%l0
	taddcctv	%o6,	%o1,	%o0
	srlx	%i3,	%l4,	%o2
	tneg	%xcc,	0x7
	prefetch	[%l7 + 0x5C],	 0x0
	swap	[%l7 + 0x74],	%l3
	edge16l	%g2,	%o4,	%o5
	movneg	%xcc,	%o3,	%i7
	ldstub	[%l7 + 0x25],	%i0
	tvs	%icc,	0x1
	umulcc	%l2,	%l6,	%g1
	array32	%i6,	%g6,	%i2
	set	0x60, %i7
	lduwa	[%l7 + %i7] 0x0c,	%i5
	alignaddr	%i1,	%l5,	%l1
	tle	%xcc,	0x2
	stb	%g3,	[%l7 + 0x3D]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	tgu	%icc,	0x0
	sir	0x03D1
	orncc	%i4,	%g5,	%g4
	or	%o7,	0x04BB,	%g7
	popc	0x1D0E,	%o6
	xnor	%l0,	%o0,	%i3
	fors	%f4,	%f8,	%f28
	fmovsn	%icc,	%f18,	%f12
	tsubcc	%o1,	%o2,	%l4
	sub	%l3,	0x1DFA,	%o4
	xnorcc	%g2,	%o3,	%o5
	ldd	[%l7 + 0x60],	%f10
	fbn	%fcc0,	loop_2531
	orcc	%i7,	%i0,	%l2
	edge8	%l6,	%g1,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2531:
	subc	%g6,	0x0EE7,	%i5
	fcmpne16	%f4,	%f30,	%i2
	tle	%xcc,	0x2
	tge	%xcc,	0x2
	nop
	setx	0xF273E36C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x97A56893,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f19,	%f6
	sll	%l5,	0x13,	%l1
	taddcctv	%i1,	%g3,	%g5
	tne	%icc,	0x0
	taddcc	%g4,	%i4,	%o7
	sra	%o6,	%l0,	%o0
	nop
	set	0x4C, %i0
	sth	%i3,	[%l7 + %i0]
	xor	%o1,	%g7,	%l4
	fxors	%f14,	%f31,	%f8
	movl	%xcc,	%l3,	%o2
	edge8ln	%o4,	%g2,	%o3
	movrgez	%o5,	%i0,	%i7
	bgu,a	%icc,	loop_2532
	addc	%l6,	0x02EA,	%l2
	movrgez	%i6,	%g6,	%g1
	andncc	%i5,	%l5,	%i2
loop_2532:
	edge8l	%i1,	%g3,	%l1
	movneg	%xcc,	%g5,	%g4
	movrne	%i4,	0x2FA,	%o7
	fbe	%fcc3,	loop_2533
	fors	%f5,	%f12,	%f1
	set	0x40, %i1
	stba	%o6,	[%l7 + %i1] 0x23
	membar	#Sync
loop_2533:
	flush	%l7 + 0x20
	sra	%l0,	%i3,	%o0
	xnorcc	%o1,	%l4,	%g7
	bshuffle	%f24,	%f10,	%f24
	srlx	%o2,	%o4,	%l3
	alignaddrl	%o3,	%g2,	%o5
	fmovdneg	%icc,	%f28,	%f22
	movneg	%icc,	%i7,	%l6
	edge8	%i0,	%l2,	%i6
	bpos,a	%xcc,	loop_2534
	bvc,a	%xcc,	loop_2535
	movle	%xcc,	%g6,	%g1
	ldub	[%l7 + 0x42],	%i5
loop_2534:
	tg	%xcc,	0x3
loop_2535:
	tn	%icc,	0x2
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
	fcmpeq32	%f28,	%f24,	%i2
	fornot2s	%f3,	%f13,	%f5
	umulcc	%g3,	0x1C06,	%i1
	sdiv	%l1,	0x1DF3,	%g5
	movge	%icc,	%i4,	%o7
	fxor	%f6,	%f12,	%f22
	fpsub32	%f14,	%f12,	%f4
	fblg	%fcc0,	loop_2536
	fbul,a	%fcc3,	loop_2537
	mulscc	%g4,	%o6,	%l0
	movvc	%xcc,	%o0,	%o1
loop_2536:
	movge	%xcc,	%l4,	%i3
loop_2537:
	edge16l	%g7,	%o2,	%o4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	fpackfix	%f30,	%f6
	movvc	%icc,	%g2,	%o3
	fbuge,a	%fcc2,	loop_2538
	move	%xcc,	%o5,	%l6
	udivx	%i0,	0x0903,	%i7
	movleu	%xcc,	%l2,	%g6
loop_2538:
	movgu	%icc,	%i6,	%i5
	fxors	%f31,	%f9,	%f30
	fnands	%f23,	%f14,	%f12
	subccc	%g1,	%i2,	%l5
	smul	%g3,	%i1,	%l1
	faligndata	%f28,	%f26,	%f26
	fpsub16s	%f13,	%f3,	%f8
	set	0x38, %i2
	stba	%i4,	[%l7 + %i2] 0x15
	taddcctv	%o7,	%g5,	%o6
	andn	%l0,	%g4,	%o0
	tge	%icc,	0x5
	mulx	%l4,	0x02A8,	%o1
	tge	%icc,	0x1
	addccc	%i3,	0x1D47,	%o2
	fbule,a	%fcc1,	loop_2539
	fandnot2	%f30,	%f14,	%f24
	srax	%g7,	0x13,	%l3
	fmovda	%xcc,	%f28,	%f22
loop_2539:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g2,	%o3
	bl,a,pn	%icc,	loop_2540
	edge16ln	%o5,	%o4,	%l6
	tpos	%xcc,	0x5
	fmovsgu	%icc,	%f8,	%f17
loop_2540:
	brlez,a	%i7,	loop_2541
	fbul,a	%fcc2,	loop_2542
	te	%xcc,	0x1
	tleu	%icc,	0x3
loop_2541:
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%l2
loop_2542:
	edge8n	%i0,	%i6,	%g6
	bne,a	%icc,	loop_2543
	fmovrde	%g1,	%f16,	%f10
	tsubcc	%i5,	0x19C7,	%i2
	ldsw	[%l7 + 0x2C],	%l5
loop_2543:
	addcc	%g3,	%i1,	%l1
	edge32ln	%i4,	%o7,	%o6
	nop
	setx	0xF2CDDE5F7A409892,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f0
	udivx	%l0,	0x0623,	%g4
	fmovdleu	%xcc,	%f11,	%f5
	fmovdn	%xcc,	%f5,	%f13
	tsubcc	%o0,	0x1602,	%g5
	movvs	%icc,	%l4,	%o1
	edge16l	%i3,	%g7,	%l3
	ldd	[%l7 + 0x70],	%f20
	movl	%xcc,	%o2,	%g2
	movrgez	%o5,	%o4,	%o3
	fsrc1s	%f28,	%f13
	tcs	%icc,	0x6
	movleu	%icc,	%i7,	%l6
	fbuge	%fcc0,	loop_2544
	tgu	%xcc,	0x1
	subc	%l2,	%i6,	%g6
	tle	%xcc,	0x6
loop_2544:
	fsrc1	%f24,	%f24
	movrne	%i0,	%i5,	%g1
	movvc	%icc,	%i2,	%l5
	fmovdpos	%icc,	%f1,	%f4
	fmovdg	%icc,	%f22,	%f8
	fpadd16s	%f25,	%f4,	%f20
	movn	%xcc,	%i1,	%l1
	movne	%icc,	%i4,	%o7
	fmul8x16au	%f26,	%f23,	%f4
	bge	%xcc,	loop_2545
	alignaddr	%o6,	%g3,	%l0
	orcc	%g4,	0x1A7A,	%g5
	tcs	%icc,	0x0
loop_2545:
	movrlez	%l4,	0x0CF,	%o1
	tne	%icc,	0x5
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf0,	%f16
	fmovscc	%xcc,	%f19,	%f20
	fbn	%fcc0,	loop_2546
	movge	%xcc,	%o0,	%g7
	or	%l3,	0x0345,	%o2
	xorcc	%i3,	0x1343,	%o5
loop_2546:
	bvs	loop_2547
	fmovrsgz	%g2,	%f19,	%f17
	set	0x23, %l6
	ldstuba	[%l7 + %l6] 0x04,	%o3
loop_2547:
	bg	loop_2548
	sub	%i7,	0x0056,	%l6
	edge8n	%o4,	%i6,	%g6
	edge16l	%i0,	%i5,	%l2
loop_2548:
	andncc	%i2,	%l5,	%g1
	fmovdl	%icc,	%f25,	%f12
	fblg,a	%fcc2,	loop_2549
	tge	%icc,	0x7
	fnor	%f16,	%f18,	%f24
	tne	%icc,	0x4
loop_2549:
	mulx	%i1,	0x1489,	%l1
	addcc	%o7,	0x1436,	%i4
	sll	%o6,	%g3,	%g4
	array32	%l0,	%g5,	%l4
	movleu	%icc,	%o1,	%o0
	mulx	%g7,	0x1001,	%l3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i3,	%o5
	tvc	%xcc,	0x1
	movge	%xcc,	%g2,	%o3
	tg	%icc,	0x6
	alignaddrl	%o2,	%l6,	%i7
	sll	%i6,	0x02,	%g6
	ldsh	[%l7 + 0x4A],	%i0
	tvc	%icc,	0x3
	tle	%icc,	0x7
	bne	loop_2550
	movneg	%xcc,	%o4,	%i5
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f30
	movvc	%xcc,	%i2,	%l2
loop_2550:
	movgu	%xcc,	%l5,	%i1
	sethi	0x138D,	%g1
	smul	%l1,	%o7,	%i4
	std	%f16,	[%l7 + 0x28]
	movvs	%xcc,	%g3,	%g4
	set	0x10, %g1
	sta	%f22,	[%l7 + %g1] 0x0c
	edge8ln	%o6,	%l0,	%g5
	fornot2s	%f16,	%f31,	%f19
	sub	%o1,	%l4,	%o0
	brz,a	%g7,	loop_2551
	fmul8sux16	%f30,	%f16,	%f2
	fmovdleu	%xcc,	%f22,	%f0
	edge16l	%i3,	%o5,	%g2
loop_2551:
	bneg,a	%xcc,	loop_2552
	te	%xcc,	0x1
	sll	%l3,	0x04,	%o2
	ble	loop_2553
loop_2552:
	fpadd32	%f8,	%f18,	%f2
	fmovsg	%icc,	%f2,	%f4
	movre	%l6,	0x207,	%o3
loop_2553:
	fxor	%f30,	%f30,	%f16
	bge,a,pt	%icc,	loop_2554
	xorcc	%i7,	0x06F9,	%g6
	udiv	%i0,	0x178D,	%o4
	and	%i5,	%i6,	%l2
loop_2554:
	nop
	set	0x71, %l4
	ldsba	[%l7 + %l4] 0x0c,	%i2
	edge8n	%i1,	%l5,	%g1
	subcc	%l1,	%i4,	%g3
	ta	%xcc,	0x3
	fmovsgu	%icc,	%f31,	%f24
	fmovsl	%icc,	%f3,	%f1
	brlz,a	%o7,	loop_2555
	fcmpne16	%f8,	%f20,	%g4
	alignaddr	%o6,	%g5,	%l0
	edge16l	%o1,	%l4,	%o0
loop_2555:
	xor	%g7,	0x060D,	%o5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	tcs	%icc,	0x3
	xnorcc	%l3,	0x0A0D,	%g2
	edge16ln	%l6,	%o2,	%o3
	tl	%xcc,	0x7
	move	%xcc,	%i7,	%i0
	tn	%icc,	0x6
	te	%xcc,	0x4
	stw	%o4,	[%l7 + 0x10]
	wr	%g0,	0x89,	%asi
	stba	%i5,	[%l7 + 0x65] %asi
	movrlez	%g6,	%i6,	%l2
	fmovdge	%icc,	%f23,	%f31
	alignaddrl	%i2,	%i1,	%g1
	and	%l1,	%l5,	%g3
	subc	%o7,	%i4,	%o6
	movvc	%xcc,	%g5,	%g4
	or	%o1,	%l4,	%l0
	bleu,a	loop_2556
	ldstub	[%l7 + 0x60],	%o0
	sir	0x1337
	ldd	[%l7 + 0x68],	%g6
loop_2556:
	sllx	%i3,	%o5,	%l3
	nop
	fitos	%f10,	%f28
	fstox	%f28,	%f28
	tleu	%icc,	0x0
	array32	%l6,	%g2,	%o2
	fones	%f26
	andn	%o3,	%i0,	%i7
	subcc	%o4,	0x1031,	%g6
	fba,a	%fcc1,	loop_2557
	st	%f2,	[%l7 + 0x24]
	subcc	%i5,	0x036B,	%l2
	fzeros	%f5
loop_2557:
	xnorcc	%i6,	0x017E,	%i2
	fmul8x16al	%f5,	%f27,	%f2
	array8	%i1,	%l1,	%g1
	array16	%l5,	%g3,	%o7
	udiv	%i4,	0x1E70,	%o6
	umulcc	%g5,	0x1D71,	%o1
	array32	%g4,	%l4,	%l0
	tn	%xcc,	0x0
	fbuge,a	%fcc3,	loop_2558
	orn	%g7,	%i3,	%o0
	add	%l3,	0x1E9F,	%o5
	tvc	%icc,	0x3
loop_2558:
	membar	0x14
	alignaddrl	%g2,	%l6,	%o3
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o2
	nop
	setx	0x504B274D,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fbl,a	%fcc1,	loop_2559
	lduw	[%l7 + 0x48],	%i7
	udivx	%i0,	0x191C,	%o4
	fmul8x16al	%f17,	%f18,	%f4
loop_2559:
	orcc	%g6,	%l2,	%i6
	movcc	%icc,	%i5,	%i1
	fmovsvs	%xcc,	%f6,	%f30
	bne,pt	%icc,	loop_2560
	fbu	%fcc2,	loop_2561
	smulcc	%i2,	%g1,	%l1
	movrlz	%l5,	%g3,	%i4
loop_2560:
	ta	%xcc,	0x7
loop_2561:
	edge16n	%o7,	%o6,	%o1
	tcs	%xcc,	0x2
	mova	%icc,	%g4,	%g5
	edge16n	%l0,	%l4,	%g7
	movrgz	%i3,	0x04B,	%o0
	fmuld8ulx16	%f16,	%f25,	%f22
	nop
	set	0x2B, %i3
	ldstub	[%l7 + %i3],	%o5
	sir	0x02D6
	fbuge,a	%fcc3,	loop_2562
	ldsw	[%l7 + 0x64],	%l3
	edge16l	%g2,	%l6,	%o3
	taddcc	%o2,	%i7,	%i0
loop_2562:
	andcc	%g6,	0x097E,	%o4
	lduw	[%l7 + 0x24],	%l2
	mova	%icc,	%i5,	%i6
	fcmpne32	%f26,	%f0,	%i1
	sir	0x04C5
	smul	%g1,	0x02F2,	%i2
	tvs	%icc,	0x5
	tl	%icc,	0x6
	fmovsl	%icc,	%f1,	%f2
	movre	%l5,	%l1,	%g3
	mulscc	%o7,	%i4,	%o1
	umul	%g4,	%o6,	%l0
	fnand	%f6,	%f30,	%f30
	movrne	%l4,	%g5,	%i3
	fnot2s	%f1,	%f11
	wr	%g0,	0x0c,	%asi
	stwa	%o0,	[%l7 + 0x6C] %asi
	nop
	setx	0x1F6C1F37BE2E30BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xAEDC856BD7E48D44,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f28,	%f12
	sra	%o5,	%l3,	%g2
	fbge	%fcc0,	loop_2563
	stw	%g7,	[%l7 + 0x0C]
	edge16ln	%o3,	%l6,	%i7
	movrgez	%i0,	%g6,	%o4
loop_2563:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f10,	%f16
	umulcc	%l2,	%o2,	%i6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x60] %asi,	%i5
	fmovd	%f20,	%f28
	array8	%g1,	%i1,	%i2
	srlx	%l1,	0x16,	%l5
	fnot1s	%f30,	%f21
	nop
	setx	0xC3C81FF9506EEDCB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fnot2s	%f7,	%f19
	fmovdge	%xcc,	%f25,	%f22
	ldstub	[%l7 + 0x6B],	%g3
	be,a,pt	%xcc,	loop_2564
	move	%icc,	%o7,	%o1
	taddcc	%i4,	0x1C83,	%o6
	fandnot2s	%f19,	%f19,	%f25
loop_2564:
	fmovrdgez	%l0,	%f6,	%f6
	fpadd32s	%f17,	%f23,	%f3
	movrne	%g4,	0x27C,	%g5
	popc	0x047B,	%l4
	edge32	%o0,	%i3,	%l3
	movpos	%icc,	%g2,	%g7
	subc	%o5,	%l6,	%o3
	fmovdl	%icc,	%f25,	%f12
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x30] %asi,	%i0
	brgz,a	%g6,	loop_2565
	sdiv	%i7,	0x1E07,	%l2
	st	%f28,	[%l7 + 0x64]
	addcc	%o4,	%i6,	%o2
loop_2565:
	fbne	%fcc1,	loop_2566
	movle	%xcc,	%g1,	%i1
	array8	%i5,	%i2,	%l1
	movgu	%icc,	%l5,	%g3
loop_2566:
	and	%o1,	0x11B2,	%i4
	orncc	%o7,	0x0B52,	%l0
	fmul8ulx16	%f30,	%f12,	%f6
	call	loop_2567
	nop
	setx	0x0C8CBA43,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xAA28894B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f19,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_2568
loop_2567:
	ld	[%l7 + 0x6C],	%f12
	array16	%o6,	%g4,	%g5
	sub	%l4,	%o0,	%i3
loop_2568:
	movgu	%xcc,	%g2,	%g7
	movl	%icc,	%o5,	%l3
	taddcc	%l6,	%i0,	%g6
	alignaddrl	%i7,	%l2,	%o3
	subcc	%o4,	0x1048,	%i6
	subccc	%g1,	%o2,	%i5
	movneg	%xcc,	%i1,	%i2
	ldsb	[%l7 + 0x58],	%l1
	tne	%xcc,	0x7
	brlez	%g3,	loop_2569
	edge16ln	%o1,	%i4,	%o7
	ldsb	[%l7 + 0x4E],	%l5
	ldsb	[%l7 + 0x76],	%o6
loop_2569:
	brlez,a	%g4,	loop_2570
	fmovscc	%xcc,	%f18,	%f30
	sdivx	%l0,	0x0B1A,	%g5
	addc	%o0,	0x02C4,	%i3
loop_2570:
	edge32n	%g2,	%g7,	%l4
	edge32ln	%l3,	%o5,	%l6
	nop
	setx	0xFE50082C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2638B92C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f0,	%f9
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udivx	%i0,	0x0B24,	%g6
	edge16	%i7,	%o3,	%l2
	nop
	set	0x52, %l3
	ldsh	[%l7 + %l3],	%i6
	fbue,a	%fcc1,	loop_2571
	tvc	%icc,	0x6
	srax	%o4,	0x0E,	%g1
	tle	%xcc,	0x1
loop_2571:
	tpos	%icc,	0x5
	srax	%o2,	%i5,	%i2
	edge32	%i1,	%l1,	%g3
	sra	%i4,	0x05,	%o7
	ldsw	[%l7 + 0x14],	%l5
	edge16	%o6,	%o1,	%g4
	fnot2s	%f5,	%f16
	fones	%f10
	fmovsl	%xcc,	%f14,	%f13
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	nop
	setx	0x9E12A671E52619E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1AA3B996AFD1B6F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f8,	%f24
	tleu	%xcc,	0x4
	nop
	setx	0xFFC7CD7BD071E588,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fexpand	%f11,	%f20
	fmovsne	%xcc,	%f23,	%f18
	edge8n	%i3,	%o0,	%g7
	nop
	set	0x7C, %l5
	prefetch	[%l7 + %l5],	 0x0
	faligndata	%f8,	%f26,	%f12
	movne	%xcc,	%g2,	%l4
	fmovdvs	%icc,	%f16,	%f14
	nop
	setx	0x20B733984CD55504,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xAE923FEA7B89CB3D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f6,	%f10
	tsubcctv	%l3,	%o5,	%i0
	pdist	%f2,	%f26,	%f14
	srax	%l6,	0x18,	%i7
	wr	%g0,	0x21,	%asi
	stxa	%o3,	[%g0 + 0x10] %asi
	sll	%l2,	0x15,	%g6
	edge16l	%o4,	%g1,	%o2
	tleu	%xcc,	0x6
	udiv	%i5,	0x18DC,	%i6
	te	%xcc,	0x2
	tvc	%xcc,	0x6
	edge8n	%i1,	%i2,	%l1
	udivx	%g3,	0x1AEA,	%i4
	array8	%o7,	%l5,	%o1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f15
	sdiv	%g4,	0x05D0,	%o6
	taddcctv	%g5,	0x04C3,	%l0
	fands	%f0,	%f12,	%f14
	alignaddr	%o0,	%g7,	%i3
	st	%f5,	[%l7 + 0x1C]
	movl	%icc,	%l4,	%g2
	array8	%l3,	%o5,	%l6
	sra	%i0,	0x18,	%i7
	fmuld8sux16	%f23,	%f29,	%f14
	mulx	%l2,	%g6,	%o4
	fmul8ulx16	%f6,	%f0,	%f4
	movle	%xcc,	%g1,	%o2
	fbul	%fcc2,	loop_2572
	fbn,a	%fcc0,	loop_2573
	movcs	%xcc,	%o3,	%i5
	movrlez	%i1,	%i2,	%l1
loop_2572:
	stb	%i6,	[%l7 + 0x78]
loop_2573:
	xorcc	%i4,	0x168E,	%g3
	nop
	setx	0x7682A1AB4C17582C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0AF612E609755DB0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f14,	%f8
	set	0x1a8, %l2
	nop 	! 	nop 	! 	ldxa	[%g0 + %l2] 0x40,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
	movn	%icc,	%l5,	%o1
	fcmple16	%f4,	%f0,	%o6
	or	%g5,	%g4,	%l0
	movrlez	%o0,	0x042,	%g7
	xnorcc	%l4,	%i3,	%l3
	and	%o5,	0x07EF,	%l6
	movl	%xcc,	%i0,	%g2
	flush	%l7 + 0x78
	brgz	%i7,	loop_2574
	udivcc	%g6,	0x0266,	%o4
	wr	%g0,	0x18,	%asi
	sta	%f21,	[%l7 + 0x24] %asi
loop_2574:
	fzeros	%f4
	move	%xcc,	%g1,	%l2
	srax	%o2,	0x06,	%o3
	fmovdcs	%icc,	%f6,	%f3
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x12] %asi,	%i1
	fmovdg	%xcc,	%f7,	%f9
	movge	%icc,	%i5,	%i2
	xorcc	%l1,	%i6,	%g3
	tneg	%icc,	0x7
	fmovdneg	%xcc,	%f8,	%f24
	alignaddr	%i4,	%o7,	%l5
	addccc	%o6,	%g5,	%o1
	bn	loop_2575
	srax	%l0,	0x01,	%o0
	fabss	%f3,	%f11
	stx	%g4,	[%l7 + 0x28]
loop_2575:
	udiv	%l4,	0x119C,	%i3
	prefetch	[%l7 + 0x4C],	 0x2
	movrgez	%l3,	%o5,	%g7
	mova	%icc,	%i0,	%g2
	srax	%l6,	%i7,	%o4
	tpos	%xcc,	0x1
	edge16	%g6,	%g1,	%l2
	tsubcctv	%o3,	0x182B,	%i1
	movl	%icc,	%i5,	%o2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%i2
	faligndata	%f6,	%f30,	%f6
	xor	%l1,	0x1965,	%g3
	fornot2	%f20,	%f0,	%f2
	alignaddrl	%i4,	%o7,	%l5
	srl	%o6,	0x10,	%i6
	tsubcc	%o1,	0x079F,	%g5
	movgu	%icc,	%o0,	%g4
	srlx	%l0,	%l4,	%l3
	nop
	fitod	%f2,	%f6
	fdtos	%f6,	%f5
	alignaddrl	%i3,	%o5,	%i0
	fexpand	%f0,	%f14
	ldsh	[%l7 + 0x46],	%g7
	brgez,a	%l6,	loop_2576
	tvc	%icc,	0x6
	fmovrslez	%g2,	%f12,	%f17
	fmovdcc	%icc,	%f22,	%f8
loop_2576:
	fzeros	%f30
	set	0x2C, %g2
	lda	[%l7 + %g2] 0x14,	%f29
	movg	%xcc,	%i7,	%g6
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fnot1s	%f7,	%f13
	xnorcc	%g1,	%o4,	%l2
	smulcc	%i1,	0x1A85,	%i5
	fmovrsgez	%o3,	%f22,	%f26
	movrlez	%i2,	0x0C9,	%l1
	tvc	%xcc,	0x6
	fnegd	%f26,	%f8
	std	%f6,	[%l7 + 0x58]
	and	%g3,	%i4,	%o2
	array16	%o7,	%o6,	%l5
	fnors	%f18,	%f11,	%f24
	tsubcc	%o1,	0x1422,	%i6
	mulscc	%o0,	%g4,	%g5
	movcc	%icc,	%l4,	%l0
	addcc	%i3,	0x1273,	%l3
	movrne	%i0,	%g7,	%o5
	nop
	setx	0x3055A9BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	andn	%g2,	%i7,	%g6
	array32	%l6,	%g1,	%o4
	subc	%i1,	0x09AE,	%i5
	edge16ln	%l2,	%o3,	%i2
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	ldd	[%l7 + 0x78],	%l0
	bvc,a,pt	%xcc,	loop_2577
	or	%i4,	%o7,	%o6
	membar	0x73
	fornot2s	%f15,	%f16,	%f28
loop_2577:
	fxnor	%f4,	%f6,	%f14
	array8	%l5,	%o1,	%i6
	tsubcctv	%o0,	%g4,	%o2
	st	%f6,	[%l7 + 0x48]
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x89,	%l4
	edge16ln	%l0,	%i3,	%g5
	fcmple16	%f30,	%f10,	%i0
	nop
	setx loop_2578, %l0, %l1
	jmpl %l1, %g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l3,	0x10F0,	%g2
	movcs	%xcc,	%o5,	%i7
loop_2578:
	movvs	%icc,	%g6,	%l6
	xor	%g1,	%i1,	%o4
	movcs	%xcc,	%l2,	%i5
	be,a	%icc,	loop_2579
	tneg	%xcc,	0x5
	movn	%icc,	%o3,	%g3
	ldsb	[%l7 + 0x1A],	%l1
loop_2579:
	srl	%i4,	%i2,	%o7
	te	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l5,	%o6,	%o1
	movl	%icc,	%i6,	%o0
	edge8n	%o2,	%l4,	%g4
	te	%xcc,	0x1
	fmovrdlz	%i3,	%f14,	%f10
	fbge	%fcc2,	loop_2580
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs	loop_2581
	bgu	%icc,	loop_2582
loop_2580:
	movre	%g5,	%l0,	%g7
	movrgz	%l3,	%i0,	%g2
loop_2581:
	sdivx	%o5,	0x0E58,	%g6
loop_2582:
	tvs	%xcc,	0x2
	movle	%icc,	%i7,	%g1
	movleu	%xcc,	%l6,	%o4
	edge8	%i1,	%l2,	%i5
	sir	0x195E
	sllx	%g3,	0x15,	%o3
	bne,a	%icc,	loop_2583
	bl,a	%xcc,	loop_2584
	fba,a	%fcc2,	loop_2585
	fmovdl	%xcc,	%f18,	%f31
loop_2583:
	tleu	%xcc,	0x1
loop_2584:
	edge16	%l1,	%i4,	%i2
loop_2585:
	sir	0x00BF
	or	%o7,	%l5,	%o6
	fornot2s	%f10,	%f16,	%f25
	fornot2	%f26,	%f28,	%f18
	fbn,a	%fcc3,	loop_2586
	nop
	setx	0xB7B86A17,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f24
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x44] %asi,	%i6
loop_2586:
	array16	%o0,	%o2,	%o1
	fmovrse	%l4,	%f4,	%f15
	xnor	%g4,	%g5,	%l0
	bge,a,pn	%icc,	loop_2587
	sethi	0x0011,	%g7
	fcmple32	%f28,	%f16,	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%i3
loop_2587:
	udivcc	%g2,	0x0F25,	%o5
	brz,a	%g6,	loop_2588
	subcc	%g1,	%l6,	%o4
	fble,a	%fcc1,	loop_2589
	edge32l	%i1,	%l2,	%i7
loop_2588:
	edge16l	%g3,	%i5,	%o3
	sdivx	%l1,	0x1438,	%i2
loop_2589:
	lduh	[%l7 + 0x50],	%i4
	umulcc	%l5,	0x0849,	%o6
	edge16	%o7,	%i6,	%o0
	edge16	%o1,	%o2,	%g4
	ldsw	[%l7 + 0x68],	%l4
	fnand	%f6,	%f8,	%f2
	fnand	%f14,	%f12,	%f24
	fpsub16s	%f15,	%f9,	%f27
	umulcc	%g5,	0x1982,	%g7
	sdivx	%l3,	0x0599,	%l0
	fnot2	%f4,	%f4
	fcmpgt16	%f26,	%f22,	%i3
	sethi	0x1737,	%g2
	tne	%icc,	0x6
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%i0
	fbule	%fcc2,	loop_2590
	bneg	%xcc,	loop_2591
	fpsub32s	%f25,	%f27,	%f18
	fors	%f20,	%f10,	%f28
loop_2590:
	nop
	set	0x10, %l1
	ldxa	[%g0 + %l1] 0x20,	%g6
loop_2591:
	movneg	%xcc,	%o5,	%g1
	array32	%o4,	%l6,	%l2
	taddcc	%i7,	0x194A,	%i1
	fbul	%fcc1,	loop_2592
	orncc	%i5,	0x193C,	%g3
	nop
	setx	0x2ABFFDB64E2D9F8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xC03E3AE4F754ABA3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f4,	%f8
	sir	0x02F1
loop_2592:
	ble,pn	%xcc,	loop_2593
	smulcc	%l1,	0x1C7E,	%o3
	sdivx	%i2,	0x14F8,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o6
loop_2593:
	bg,a	loop_2594
	fbue	%fcc0,	loop_2595
	tcs	%xcc,	0x2
	fmovsa	%icc,	%f26,	%f6
loop_2594:
	movge	%xcc,	%i6,	%o7
loop_2595:
	umul	%o1,	%o2,	%g4
	edge16n	%o0,	%g5,	%g7
	movl	%xcc,	%l4,	%l3
	faligndata	%f24,	%f16,	%f6
	subcc	%i3,	0x1104,	%l0
	sethi	0x0108,	%i0
	nop
	setx	0xD4566C3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f18
	fors	%f17,	%f0,	%f12
	sethi	0x025F,	%g6
	fnor	%f2,	%f10,	%f2
	bneg,a,pn	%icc,	loop_2596
	te	%icc,	0x2
	std	%f4,	[%l7 + 0x68]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2596:
	tge	%xcc,	0x1
	umul	%o5,	%g1,	%o4
	andncc	%g2,	%l2,	%l6
	bg	loop_2597
	udivcc	%i1,	0x1ADF,	%i5
	set	0x46, %i5
	ldsha	[%l7 + %i5] 0x0c,	%g3
loop_2597:
	nop
	setx	0xD079AAB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	popc	0x1BCD,	%i7
	movvc	%icc,	%l1,	%o3
	and	%i2,	%i4,	%l5
	sdiv	%i6,	0x1B49,	%o6
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x14
	bcc	loop_2598
	taddcctv	%o7,	%o2,	%o1
	fmovdg	%icc,	%f0,	%f0
	tleu	%icc,	0x7
loop_2598:
	stx	%o0,	[%l7 + 0x58]
	movneg	%xcc,	%g5,	%g7
	tne	%xcc,	0x7
	nop
	setx	0xE2C83692,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x781B6074,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f18,	%f0
	fba	%fcc0,	loop_2599
	umul	%g4,	%l4,	%i3
	fzeros	%f29
	nop
	setx loop_2600, %l0, %l1
	jmpl %l1, %l0
loop_2599:
	addc	%l3,	0x1969,	%i0
	xnor	%g6,	0x06A2,	%g1
	srax	%o5,	0x16,	%g2
loop_2600:
	ldsb	[%l7 + 0x0B],	%o4
	ldstub	[%l7 + 0x6A],	%l6
	tge	%icc,	0x6
	movgu	%icc,	%i1,	%i5
	bneg,a,pn	%icc,	loop_2601
	bvc,a,pn	%xcc,	loop_2602
	fmovsneg	%xcc,	%f20,	%f19
	fmovsne	%icc,	%f25,	%f9
loop_2601:
	brz	%g3,	loop_2603
loop_2602:
	movrlez	%l2,	%l1,	%o3
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f0
	fxtos	%f0,	%f2
	bn,a	loop_2604
loop_2603:
	fmovdleu	%xcc,	%f11,	%f5
	fmovsvs	%xcc,	%f28,	%f19
	fmovrde	%i2,	%f4,	%f26
loop_2604:
	fors	%f30,	%f17,	%f16
	fnors	%f10,	%f28,	%f8
	fmovrdne	%i7,	%f18,	%f6
	fcmple32	%f18,	%f8,	%i4
	edge8	%i6,	%l5,	%o7
	andncc	%o6,	%o2,	%o1
	tcc	%icc,	0x2
	flush	%l7 + 0x6C
	lduh	[%l7 + 0x1A],	%o0
	fcmple32	%f16,	%f6,	%g7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%l4
	subc	%g5,	0x019F,	%l0
	mulx	%i3,	%l3,	%g6
	st	%f1,	[%l7 + 0x10]
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%g0
	fcmple32	%f14,	%f18,	%i0
	set	0x20, %o2
	ldsha	[%l7 + %o2] 0x15,	%o5
	movrlez	%o4,	%l6,	%g2
	bshuffle	%f18,	%f16,	%f4
	fcmpne16	%f6,	%f24,	%i5
	sir	0x020F
	array8	%i1,	%l2,	%g3
	smul	%o3,	0x0D8E,	%i2
	edge32ln	%l1,	%i7,	%i6
	smulcc	%l5,	0x00A5,	%i4
	tvc	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x24, %o6
	lduwa	[%l7 + %o6] 0x04,	%o6
	bge,pt	%xcc,	loop_2605
	fcmpeq16	%f4,	%f6,	%o7
	tcs	%xcc,	0x0
	subccc	%o1,	0x19E3,	%o0
loop_2605:
	fmovdgu	%icc,	%f27,	%f11
	fmovrsgz	%g7,	%f8,	%f13
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f26
	fxtos	%f26,	%f20
	movrlz	%g4,	%l4,	%o2
	edge32l	%l0,	%g5,	%i3
	brlez,a	%l3,	loop_2606
	movge	%icc,	%g1,	%i0
	nop
	set	0x10, %l0
	ldsw	[%l7 + %l0],	%o5
	set	0x20, %g4
	stxa	%o4,	[%l7 + %g4] 0x04
loop_2606:
	array32	%g6,	%g2,	%i5
	sir	0x0633
	srlx	%l6,	%i1,	%g3
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x19,	%o3
	edge16l	%l2,	%i2,	%l1
	sra	%i7,	0x02,	%i6
	tpos	%icc,	0x0
	addcc	%l5,	%o6,	%o7
	subc	%i4,	0x1DD3,	%o0
	movpos	%icc,	%o1,	%g4
	fmovsn	%xcc,	%f9,	%f17
	or	%g7,	%o2,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l0,	0x0FD,	%g5
	nop
	setx	0x69CC686A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xB32C786D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f0,	%f15
	sdivx	%l3,	0x1AE2,	%g1
	brz	%i0,	loop_2607
	edge16l	%i3,	%o5,	%o4
	fmovs	%f12,	%f19
	andn	%g2,	0x0996,	%i5
loop_2607:
	nop
	setx	loop_2608,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f28,	%f17,	%f6
loop_2608:
	movgu	%icc,	%l6,	%g6
	mulscc	%g3,	%i1,	%o3
	smul	%l2,	%l1,	%i2
	fcmpne16	%f12,	%f10,	%i7
	movre	%i6,	0x263,	%l5
	orncc	%o7,	0x040F,	%o6
	bge,a	loop_2609
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2610
	nop
	setx	0x4B618FDEFAD05F5C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x41C7D7FA57986313,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f0,	%f28
loop_2609:
	edge8l	%o0,	%o1,	%g4
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2610:
	popc	%g7,	%o2
	taddcctv	%i4,	0x1A73,	%l0
	movl	%xcc,	%g5,	%l3
	andcc	%l4,	0x09B8,	%i0
	xorcc	%i3,	0x1D10,	%g1
	edge32ln	%o5,	%o4,	%g2
	fsrc1	%f20,	%f30
	wr	%g0,	0x89,	%asi
	stba	%l6,	[%l7 + 0x34] %asi
	sub	%g6,	0x04CB,	%i5
	bgu,a,pt	%xcc,	loop_2611
	fmovsl	%icc,	%f27,	%f27
	movcc	%xcc,	%g3,	%i1
	orcc	%o3,	0x11CA,	%l2
loop_2611:
	movrgez	%i2,	%l1,	%i7
	fpsub16	%f2,	%f10,	%f6
	tgu	%icc,	0x5
	ldsh	[%l7 + 0x56],	%i6
	brgz	%o7,	loop_2612
	fbo,a	%fcc2,	loop_2613
	bleu,pt	%xcc,	loop_2614
	move	%xcc,	%l5,	%o6
loop_2612:
	stb	%o0,	[%l7 + 0x66]
loop_2613:
	fmovrsne	%o1,	%f2,	%f18
loop_2614:
	xorcc	%g7,	%g4,	%i4
	fmovrsne	%o2,	%f27,	%f26
	movneg	%icc,	%l0,	%g5
	bcs,a	%icc,	loop_2615
	tle	%xcc,	0x0
	sdivx	%l4,	0x1E9F,	%i0
	fcmpeq32	%f2,	%f0,	%i3
loop_2615:
	movle	%icc,	%l3,	%g1
	fmovsleu	%xcc,	%f27,	%f4
	nop
	fitos	%f30,	%f21
	umul	%o4,	%o5,	%g2
	fmovs	%f12,	%f18
	or	%l6,	0x17F4,	%i5
	fmovsl	%xcc,	%f18,	%f14
	fbg	%fcc1,	loop_2616
	fpmerge	%f0,	%f1,	%f16
	edge16n	%g3,	%g6,	%o3
	popc	%i1,	%l2
loop_2616:
	fmovspos	%icc,	%f7,	%f1
	movne	%xcc,	%l1,	%i7
	tvc	%icc,	0x2
	tsubcc	%i2,	%o7,	%l5
	bleu,a	loop_2617
	tg	%xcc,	0x0
	movcs	%icc,	%i6,	%o6
	alignaddr	%o1,	%g7,	%g4
loop_2617:
	ldstub	[%l7 + 0x69],	%i4
	sethi	0x07C7,	%o0
	orncc	%o2,	0x07F0,	%g5
	movleu	%xcc,	%l0,	%i0
	movle	%xcc,	%l4,	%l3
	umul	%i3,	%g1,	%o4
	nop
	fitos	%f7,	%f27
	fstoi	%f27,	%f22
	srl	%o5,	%l6,	%g2
	stw	%i5,	[%l7 + 0x18]
	xorcc	%g3,	0x1683,	%g6
	movgu	%xcc,	%o3,	%l2
	tge	%xcc,	0x1
	sir	0x1960
	bcc,a,pt	%icc,	loop_2618
	fcmpgt32	%f0,	%f24,	%i1
	ldsh	[%l7 + 0x3A],	%i7
	subccc	%l1,	%i2,	%l5
loop_2618:
	fmovdne	%icc,	%f26,	%f28
	brnz,a	%i6,	loop_2619
	andcc	%o7,	%o1,	%o6
	and	%g7,	%g4,	%o0
	wr	%g0,	0x27,	%asi
	stwa	%o2,	[%l7 + 0x3C] %asi
	membar	#Sync
loop_2619:
	mulx	%g5,	0x08A6,	%l0
	fandnot2	%f28,	%f28,	%f16
	srax	%i0,	%l4,	%l3
	brgz	%i4,	loop_2620
	and	%i3,	0x06A3,	%g1
	tle	%icc,	0x6
	taddcc	%o5,	%o4,	%g2
loop_2620:
	movrlz	%i5,	%g3,	%g6
	bcc	loop_2621
	tle	%icc,	0x5
	tle	%xcc,	0x6
	fcmpeq16	%f26,	%f28,	%o3
loop_2621:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l2,	%i1,	%i7
	fbg,a	%fcc1,	loop_2622
	umulcc	%l1,	%l6,	%l5
	fbule,a	%fcc2,	loop_2623
	movne	%icc,	%i2,	%i6
loop_2622:
	alignaddr	%o7,	%o6,	%o1
	fmul8sux16	%f20,	%f6,	%f22
loop_2623:
	movne	%icc,	%g7,	%o0
	edge16	%g4,	%o2,	%l0
	umulcc	%i0,	0x0769,	%l4
	fmovscs	%xcc,	%f1,	%f31
	fmovsg	%icc,	%f16,	%f16
	fpsub32	%f30,	%f22,	%f22
	sra	%l3,	0x11,	%i4
	edge16l	%g5,	%i3,	%g1
	prefetch	[%l7 + 0x60],	 0x0
	ldsb	[%l7 + 0x78],	%o4
	move	%icc,	%g2,	%i5
	movrgez	%o5,	0x36E,	%g3
	alignaddrl	%g6,	%o3,	%l2
	fba,a	%fcc3,	loop_2624
	ldsh	[%l7 + 0x0E],	%i1
	te	%icc,	0x1
	tcs	%icc,	0x5
loop_2624:
	subcc	%i7,	0x0683,	%l6
	fsrc1	%f4,	%f14
	sdiv	%l1,	0x1B2F,	%i2
	umulcc	%l5,	%o7,	%o6
	fnor	%f6,	%f8,	%f22
	srax	%o1,	0x14,	%i6
	tpos	%xcc,	0x2
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x72] %asi,	%o0
	srax	%g7,	0x1C,	%g4
	ld	[%l7 + 0x08],	%f0
	movrlez	%o2,	0x15E,	%i0
	movcc	%xcc,	%l4,	%l0
	orcc	%l3,	0x0A6F,	%i4
	orncc	%g5,	0x0196,	%i3
	fandnot1s	%f10,	%f19,	%f7
	fsrc2	%f16,	%f14
	membar	0x6D
	set	0x62, %i4
	ldsba	[%l7 + %i4] 0x11,	%o4
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%g2
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f9
	array16	%i5,	%g1,	%g3
	tgu	%xcc,	0x4
	ldsb	[%l7 + 0x24],	%o5
	fbg,a	%fcc1,	loop_2625
	addcc	%g6,	%l2,	%o3
	and	%i1,	0x0A01,	%i7
	tcs	%icc,	0x2
loop_2625:
	brlez	%l1,	loop_2626
	fpsub32	%f2,	%f8,	%f22
	andn	%i2,	%l6,	%l5
	nop
	setx	0x19737FCD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x0B0B0BD1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f3,	%f15
loop_2626:
	fornot1s	%f7,	%f31,	%f21
	fmovd	%f14,	%f26
	ldd	[%l7 + 0x48],	%f8
	array16	%o6,	%o1,	%i6
	fbuge,a	%fcc0,	loop_2627
	fpsub32s	%f15,	%f21,	%f10
	bne,pt	%xcc,	loop_2628
	mova	%xcc,	%o7,	%o0
loop_2627:
	subc	%g4,	0x0CED,	%o2
	edge16l	%i0,	%g7,	%l4
loop_2628:
	fmovdleu	%icc,	%f23,	%f19
	fnot2	%f20,	%f8
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f19
	fexpand	%f27,	%f16
	edge16l	%l3,	%i4,	%l0
	edge16ln	%g5,	%i3,	%o4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%g2
	sllx	%i5,	%g1,	%o5
	ta	%xcc,	0x7
	nop
	fitod	%f0,	%f26
	smulcc	%g3,	0x1BE2,	%g6
	fsrc2s	%f9,	%f7
	move	%xcc,	%o3,	%i1
	fornot2	%f28,	%f22,	%f2
	tl	%xcc,	0x2
	fornot2	%f2,	%f2,	%f26
	nop
	setx	0xA6B9A7F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x5DA78DE3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f2,	%f8
	brgz	%i7,	loop_2629
	fnot1	%f24,	%f30
	orn	%l2,	%l1,	%i2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%l5
loop_2629:
	edge16l	%o6,	%l6,	%o1
	orncc	%o7,	0x0CA2,	%o0
	movneg	%icc,	%i6,	%g4
	tvs	%xcc,	0x6
	subcc	%i0,	0x0809,	%g7
	add	%o2,	%l3,	%i4
	fandnot2	%f6,	%f30,	%f28
	addccc	%l4,	%l0,	%g5
	faligndata	%f28,	%f16,	%f20
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i3
	sub	%o4,	0x0D7C,	%g2
	bvs,pn	%icc,	loop_2630
	be	loop_2631
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x7
loop_2630:
	movcc	%icc,	%g1,	%o5
loop_2631:
	taddcc	%i5,	%g3,	%g6
	movrlz	%o3,	%i7,	%i1
	set	0x66, %g6
	ldsha	[%l7 + %g6] 0x89,	%l1
	movrne	%i2,	%l2,	%o6
	movneg	%icc,	%l5,	%l6
	ld	[%l7 + 0x50],	%f2
	sll	%o7,	%o0,	%o1
	membar	0x42
	ldsw	[%l7 + 0x4C],	%i6
	ldsh	[%l7 + 0x46],	%i0
	movrne	%g4,	0x252,	%o2
	tne	%xcc,	0x3
	subccc	%g7,	%i4,	%l3
	bcc,a	loop_2632
	tle	%icc,	0x7
	smul	%l0,	0x15B9,	%l4
	set	0x20, %i7
	swapa	[%l7 + %i7] 0x80,	%g5
loop_2632:
	nop
	set	0x5C, %i0
	lda	[%l7 + %i0] 0x0c,	%f23
	nop
	setx loop_2633, %l0, %l1
	jmpl %l1, %o4
	fnegs	%f16,	%f3
	bg,a,pt	%xcc,	loop_2634
	taddcctv	%g2,	0x03BF,	%g1
loop_2633:
	smulcc	%i3,	%i5,	%o5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x68] %asi,	%g3
loop_2634:
	movre	%o3,	%i7,	%g6
	sethi	0x11A2,	%i1
	edge32	%l1,	%l2,	%i2
	tvc	%xcc,	0x1
	movge	%icc,	%o6,	%l6
	orncc	%o7,	0x1581,	%l5
	bg,a	loop_2635
	subccc	%o0,	%i6,	%o1
	fxnors	%f5,	%f11,	%f18
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
loop_2635:
	mulx	%g4,	%o2,	%i4
	bgu	loop_2636
	nop
	set	0x38, %i1
	ldub	[%l7 + %i1],	%g7
	brz,a	%l3,	loop_2637
	or	%l0,	0x1204,	%l4
loop_2636:
	fbo,a	%fcc1,	loop_2638
	andcc	%g5,	0x0C54,	%g2
loop_2637:
	fmul8ulx16	%f2,	%f8,	%f22
	flush	%l7 + 0x3C
loop_2638:
	brgez,a	%o4,	loop_2639
	sth	%g1,	[%l7 + 0x12]
	membar	0x67
	movcs	%icc,	%i3,	%o5
loop_2639:
	movgu	%xcc,	%g3,	%i5
	swap	[%l7 + 0x58],	%o3
	mova	%xcc,	%g6,	%i7
	andn	%l1,	%i1,	%i2
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%o6
	movge	%icc,	%l2,	%o7
	fmovrslz	%l6,	%f7,	%f3
	fcmpne16	%f30,	%f6,	%l5
	orn	%o0,	%o1,	%i0
	movvc	%icc,	%i6,	%g4
	alignaddr	%i4,	%o2,	%l3
	fbul,a	%fcc2,	loop_2640
	sll	%g7,	0x1A,	%l4
	andn	%l0,	%g5,	%o4
	movne	%icc,	%g2,	%g1
loop_2640:
	fmovse	%icc,	%f22,	%f26
	movneg	%xcc,	%i3,	%o5
	subcc	%g3,	%i5,	%g6
	tle	%icc,	0x3
	fbuge	%fcc3,	loop_2641
	fmovdvc	%icc,	%f2,	%f6
	add	%i7,	%l1,	%o3
	movne	%icc,	%i1,	%o6
loop_2641:
	brlz,a	%l2,	loop_2642
	std	%f16,	[%l7 + 0x08]
	fexpand	%f27,	%f26
	movrlz	%o7,	%l6,	%l5
loop_2642:
	edge16l	%o0,	%o1,	%i0
	edge16	%i6,	%g4,	%i2
	tle	%xcc,	0x3
	array16	%i4,	%o2,	%l3
	movgu	%xcc,	%g7,	%l4
	tvc	%xcc,	0x0
	ldsb	[%l7 + 0x77],	%g5
	xnorcc	%o4,	%g2,	%g1
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%i3
	fbul	%fcc0,	loop_2643
	stx	%o5,	[%l7 + 0x60]
	tsubcctv	%l0,	0x033F,	%i5
	tvc	%xcc,	0x3
loop_2643:
	movrlez	%g3,	0x370,	%i7
	fones	%f30
	fsrc1	%f2,	%f8
	udivcc	%g6,	0x1825,	%l1
	movge	%icc,	%o3,	%i1
	te	%icc,	0x5
	set	0x5C, %o3
	stha	%l2,	[%l7 + %o3] 0x04
	xor	%o6,	0x0BEA,	%l6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%o0
	smul	%o1,	0x11FB,	%i0
	nop
	fitod	%f12,	%f16
	fdtoi	%f16,	%f21
	srl	%o7,	0x0D,	%g4
	mulx	%i6,	0x1394,	%i2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%o2
	fbg,a	%fcc2,	loop_2644
	tvc	%icc,	0x6
	smul	%l3,	%g7,	%l4
	tvc	%icc,	0x6
loop_2644:
	movne	%icc,	%i4,	%g5
	fornot1s	%f3,	%f1,	%f3
	srlx	%g2,	0x0C,	%o4
	fmovrslz	%g1,	%f23,	%f2
	fand	%f14,	%f26,	%f10
	fors	%f16,	%f28,	%f26
	movg	%icc,	%o5,	%l0
	addcc	%i5,	0x1917,	%g3
	fmovd	%f24,	%f12
	bn,pn	%icc,	loop_2645
	tge	%xcc,	0x6
	mulx	%i3,	%i7,	%g6
	andn	%l1,	0x144F,	%o3
loop_2645:
	fandnot1s	%f16,	%f18,	%f11
	edge32l	%l2,	%i1,	%l6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x34] %asi,	%l5
	udivx	%o0,	0x0B00,	%o1
	addcc	%i0,	%o6,	%g4
	fcmpeq32	%f2,	%f18,	%o7
	movneg	%xcc,	%i2,	%o2
	movge	%icc,	%l3,	%i6
	mova	%xcc,	%l4,	%i4
	srlx	%g5,	%g2,	%g7
	array32	%o4,	%g1,	%l0
	bge	loop_2646
	xnor	%o5,	0x1F4A,	%g3
	movg	%xcc,	%i5,	%i3
	movrgez	%i7,	0x0ED,	%g6
loop_2646:
	fmovrdne	%o3,	%f26,	%f4
	wr	%g0,	0x18,	%asi
	stba	%l2,	[%l7 + 0x19] %asi
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x4C] %asi,	%f26
	tleu	%xcc,	0x5
	andn	%l1,	0x1EE3,	%l6
	sll	%l5,	%i1,	%o0
	fmovrsgz	%o1,	%f0,	%f24
	bshuffle	%f18,	%f24,	%f18
	fmul8x16al	%f7,	%f7,	%f12
	movcs	%icc,	%i0,	%g4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x74] %asi,	%f13
	fmovrslz	%o6,	%f2,	%f31
	smul	%i2,	%o7,	%l3
	sdivcc	%o2,	0x1EB1,	%l4
	fbue	%fcc3,	loop_2647
	fbo	%fcc3,	loop_2648
	andn	%i6,	0x0627,	%i4
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x7C] %asi,	%g2
loop_2647:
	fpsub16	%f14,	%f2,	%f0
loop_2648:
	nop
	fitos	%f13,	%f11
	fstoi	%f11,	%f19
	orncc	%g7,	0x1CDD,	%g5
	movre	%o4,	0x014,	%l0
	udivx	%o5,	0x0B86,	%g1
	prefetch	[%l7 + 0x38],	 0x1
	fbn,a	%fcc3,	loop_2649
	fble,a	%fcc1,	loop_2650
	fcmpne32	%f6,	%f2,	%g3
	movl	%icc,	%i5,	%i3
loop_2649:
	nop
	fitos	%f17,	%f2
loop_2650:
	fmovdvc	%xcc,	%f31,	%f24
	stb	%g6,	[%l7 + 0x75]
	bne,pt	%icc,	loop_2651
	nop
	setx	0x33D414E507F34702,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x900E3896FD9CCD08,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f16,	%f26
	fandnot2	%f8,	%f16,	%f20
	tvc	%xcc,	0x7
loop_2651:
	movrgez	%i7,	0x3D3,	%o3
	srlx	%l2,	%l6,	%l5
	tcc	%xcc,	0x3
	fpack32	%f18,	%f0,	%f22
	te	%xcc,	0x7
	movg	%icc,	%l1,	%o0
	subc	%i1,	0x0F23,	%i0
	edge8	%o1,	%o6,	%g4
	fmovdge	%icc,	%f26,	%f7
	fnegs	%f29,	%f10
	bpos	loop_2652
	udivcc	%i2,	0x14CF,	%o7
	stb	%l3,	[%l7 + 0x1E]
	nop
	setx	loop_2653,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2652:
	movgu	%xcc,	%o2,	%l4
	sra	%i4,	0x0F,	%g2
	bge,pt	%xcc,	loop_2654
loop_2653:
	taddcc	%i6,	0x10D1,	%g7
	brgz,a	%g5,	loop_2655
	fbne	%fcc0,	loop_2656
loop_2654:
	fcmpne16	%f16,	%f6,	%o4
	edge8n	%l0,	%o5,	%g3
loop_2655:
	movneg	%xcc,	%i5,	%i3
loop_2656:
	fmovdcc	%xcc,	%f27,	%f16
	tvc	%icc,	0x6
	set	0x40, %o7
	ldstuba	[%l7 + %o7] 0x19,	%g1
	movvc	%icc,	%g6,	%i7
	sub	%l2,	%o3,	%l6
	call	loop_2657
	ldd	[%l7 + 0x78],	%l4
	orncc	%o0,	%i1,	%i0
	mulscc	%l1,	0x1867,	%o1
loop_2657:
	fbule	%fcc2,	loop_2658
	lduh	[%l7 + 0x40],	%g4
	tne	%icc,	0x5
	sll	%o6,	0x07,	%i2
loop_2658:
	movle	%icc,	%l3,	%o2
	edge8l	%l4,	%i4,	%g2
	set	0x5C, %g7
	lda	[%l7 + %g7] 0x0c,	%f23
	st	%f13,	[%l7 + 0x34]
	sdivx	%o7,	0x0B3A,	%i6
	movne	%xcc,	%g5,	%g7
	fbul,a	%fcc1,	loop_2659
	tn	%xcc,	0x5
	fxors	%f5,	%f11,	%f21
	fmovdcc	%xcc,	%f23,	%f26
loop_2659:
	tge	%xcc,	0x4
	fbl,a	%fcc1,	loop_2660
	alignaddrl	%l0,	%o5,	%g3
	array8	%i5,	%i3,	%o4
	ba	loop_2661
loop_2660:
	edge16l	%g6,	%g1,	%i7
	fbu,a	%fcc2,	loop_2662
	tcc	%icc,	0x2
loop_2661:
	movgu	%icc,	%l2,	%l6
	ldx	[%l7 + 0x28],	%l5
loop_2662:
	tneg	%xcc,	0x6
	movrne	%o0,	%o3,	%i0
	mulx	%l1,	%o1,	%i1
	sdiv	%o6,	0x1F3B,	%i2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g4
	set	0x3C, %g5
	lduwa	[%l7 + %g5] 0x80,	%l3
	edge32ln	%o2,	%l4,	%i4
	movcs	%icc,	%g2,	%i6
	andcc	%g5,	%g7,	%o7
	movrlez	%l0,	0x173,	%g3
	fors	%f15,	%f28,	%f6
	tge	%icc,	0x2
	fmovdg	%xcc,	%f28,	%f30
	fmovsvc	%icc,	%f3,	%f9
	movne	%icc,	%o5,	%i3
	te	%icc,	0x6
	brlz	%i5,	loop_2663
	movg	%xcc,	%g6,	%o4
	fsrc1	%f10,	%f4
	nop
	setx	0x9468E989,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xE70BC8DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f6,	%f30
loop_2663:
	andncc	%g1,	%i7,	%l6
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addc	%l2,	0x0A52,	%o0
	tgu	%icc,	0x0
	movrlz	%l5,	0x26C,	%i0
	edge16ln	%l1,	%o1,	%o3
	fmovrdgez	%o6,	%f28,	%f24
	fmovd	%f24,	%f10
	set	0x6B, %l6
	stba	%i1,	[%l7 + %l6] 0x2f
	membar	#Sync
	fcmpeq16	%f8,	%f18,	%g4
	fpadd16s	%f4,	%f10,	%f14
	alignaddrl	%i2,	%o2,	%l4
	movneg	%icc,	%i4,	%g2
	sll	%i6,	%l3,	%g5
	lduh	[%l7 + 0x44],	%o7
	mulx	%l0,	%g7,	%g3
	fbge,a	%fcc0,	loop_2664
	fbule	%fcc3,	loop_2665
	addcc	%i3,	%i5,	%o5
	set	0x3C, %g1
	lduwa	[%l7 + %g1] 0x89,	%o4
loop_2664:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x74] %asi,	%g1
loop_2665:
	movrgz	%i7,	%g6,	%l6
	tneg	%xcc,	0x0
	tne	%xcc,	0x6
	fmovdpos	%xcc,	%f0,	%f4
	movrne	%l2,	%o0,	%i0
	tle	%icc,	0x6
	andn	%l1,	%l5,	%o3
	fmovrdgz	%o6,	%f26,	%f20
	fpadd16	%f30,	%f30,	%f20
	fmovrslez	%i1,	%f27,	%f12
	andn	%g4,	%o1,	%i2
	fmovsa	%icc,	%f17,	%f22
	array8	%o2,	%l4,	%i4
	fbg	%fcc1,	loop_2666
	brlz,a	%g2,	loop_2667
	fmovrdgez	%i6,	%f8,	%f22
	fcmple16	%f16,	%f24,	%l3
loop_2666:
	mulscc	%g5,	0x04E3,	%o7
loop_2667:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%g7
	tpos	%xcc,	0x2
	udiv	%g3,	0x1DE1,	%i5
	fcmpgt16	%f10,	%f24,	%i3
	brgz,a	%o4,	loop_2668
	xnorcc	%g1,	%o5,	%g6
	bvc,a,pt	%xcc,	loop_2669
	fmovd	%f24,	%f16
loop_2668:
	sir	0x1BDB
	nop
	setx	0x3047690F,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_2669:
	fbuge,a	%fcc1,	loop_2670
	ldd	[%l7 + 0x10],	%i6
	te	%xcc,	0x0
	tle	%icc,	0x7
loop_2670:
	tcs	%icc,	0x5
	edge8ln	%i7,	%o0,	%i0
	fbn	%fcc1,	loop_2671
	srl	%l2,	0x17,	%l5
	membar	0x78
	movvc	%xcc,	%o3,	%l1
loop_2671:
	movn	%xcc,	%i1,	%g4
	fmovsvc	%icc,	%f3,	%f18
	te	%xcc,	0x5
	sth	%o6,	[%l7 + 0x5C]
	fmovscs	%xcc,	%f29,	%f26
	fbul,a	%fcc2,	loop_2672
	fbo	%fcc1,	loop_2673
	ble	%xcc,	loop_2674
	udivcc	%i2,	0x1774,	%o2
loop_2672:
	movg	%icc,	%l4,	%i4
loop_2673:
	fbg	%fcc1,	loop_2675
loop_2674:
	sethi	0x1C01,	%g2
	brnz	%i6,	loop_2676
	brz,a	%o1,	loop_2677
loop_2675:
	tvc	%icc,	0x1
	umul	%g5,	0x159B,	%o7
loop_2676:
	nop
	set	0x24, %l4
	ldswa	[%l7 + %l4] 0x15,	%l0
loop_2677:
	orncc	%g7,	%g3,	%l3
	fmovsne	%icc,	%f23,	%f11
	nop
	setx	loop_2678,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%i3,	0x0ECB,	%o4
	fbule,a	%fcc3,	loop_2679
	fandnot2	%f18,	%f8,	%f16
loop_2678:
	edge16	%g1,	%i5,	%o5
	fmul8sux16	%f0,	%f22,	%f20
loop_2679:
	movcc	%icc,	%g6,	%l6
	tsubcc	%o0,	0x18FA,	%i7
	fblg	%fcc0,	loop_2680
	nop
	setx	0x6CCF5387,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x42903236,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f25,	%f16
	alignaddrl	%l2,	%l5,	%o3
	tn	%xcc,	0x1
loop_2680:
	fmuld8sux16	%f4,	%f11,	%f22
	fmovrsgz	%i0,	%f15,	%f19
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
	fmovrsgez	%l1,	%f28,	%f13
	or	%o6,	%i2,	%g4
	tn	%icc,	0x1
	tsubcc	%l4,	%i4,	%g2
	bpos,a,pn	%icc,	loop_2681
	lduh	[%l7 + 0x1A],	%o2
	edge16n	%o1,	%i6,	%g5
	sethi	0x167B,	%l0
loop_2681:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%o7,	%f26,	%f8
	ldx	[%l7 + 0x68],	%g7
	move	%icc,	%g3,	%l3
	fcmpeq16	%f18,	%f24,	%i3
	ldsb	[%l7 + 0x21],	%g1
	be,a,pt	%xcc,	loop_2682
	subccc	%o4,	%i5,	%o5
	fpsub32	%f26,	%f28,	%f16
	addccc	%l6,	0x05BA,	%o0
loop_2682:
	te	%xcc,	0x3
	nop
	setx	0x46ECE0DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xF6C32079,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f0,	%f2
	fnot1s	%f16,	%f25
	fcmpne32	%f18,	%f20,	%g6
	fmovsle	%icc,	%f29,	%f25
	fbn,a	%fcc2,	loop_2683
	movl	%xcc,	%i7,	%l5
	fpmerge	%f18,	%f8,	%f14
	fmovrsne	%l2,	%f29,	%f28
loop_2683:
	be	loop_2684
	fmovrdgz	%o3,	%f30,	%f18
	nop
	setx	0x3651C6847078FFB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	sub	%i0,	0x0E7F,	%l1
loop_2684:
	nop
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	stbar
	te	%xcc,	0x4
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f10
	edge16ln	%i2,	%g4,	%o6
	taddcc	%i4,	0x1A26,	%g2
	fxor	%f18,	%f24,	%f18
	fzero	%f12
	xorcc	%l4,	%o1,	%i6
	ta	%icc,	0x6
	fmovrde	%o2,	%f16,	%f4
	add	%g5,	%l0,	%g7
	edge8	%g3,	%l3,	%i3
	fmovsa	%icc,	%f27,	%f17
	fmovrsgez	%o7,	%f13,	%f9
	taddcctv	%g1,	%i5,	%o5
	set	0x20, %l5
	stwa	%l6,	[%l7 + %l5] 0x27
	membar	#Sync
	tpos	%xcc,	0x3
	fmovsne	%xcc,	%f27,	%f6
	movrgz	%o0,	%g6,	%i7
	fpadd32s	%f5,	%f24,	%f16
	brlez	%o4,	loop_2685
	faligndata	%f14,	%f20,	%f14
	nop
	setx loop_2686, %l0, %l1
	jmpl %l1, %l5
	andcc	%l2,	0x16B1,	%i0
loop_2685:
	movle	%icc,	%o3,	%i1
	fbule	%fcc0,	loop_2687
loop_2686:
	movn	%icc,	%l1,	%i2
	andn	%g4,	0x098D,	%o6
	smulcc	%g2,	%i4,	%o1
loop_2687:
	bvc,pn	%xcc,	loop_2688
	fmovda	%icc,	%f16,	%f13
	bleu	%xcc,	loop_2689
	or	%i6,	%o2,	%g5
loop_2688:
	fpsub32	%f2,	%f26,	%f28
	edge16	%l0,	%g7,	%l4
loop_2689:
	bn,pn	%icc,	loop_2690
	array16	%g3,	%l3,	%i3
	fbug,a	%fcc2,	loop_2691
	array32	%o7,	%g1,	%i5
loop_2690:
	fmovrsne	%o5,	%f30,	%f12
	stx	%o0,	[%l7 + 0x78]
loop_2691:
	edge16l	%l6,	%i7,	%g6
	orncc	%l5,	0x1107,	%o4
	nop
	setx	0xC02E02FDB060AE8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	nop
	setx	0x9251BEFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xF349A5A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f5,	%f11
	ldx	[%l7 + 0x40],	%l2
	umul	%i0,	0x1EA9,	%o3
	movrgez	%l1,	0x371,	%i2
	udivx	%g4,	0x1AF0,	%o6
	umulcc	%g2,	0x18DC,	%i4
	array8	%i1,	%i6,	%o1
	tsubcctv	%g5,	0x1306,	%l0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x18,	%f16
	movl	%icc,	%g7,	%o2
	movrlz	%l4,	%l3,	%i3
	sethi	0x0448,	%g3
	nop
	setx	0x604F1E95,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tsubcc	%o7,	0x08BE,	%g1
	set	0x43, %o0
	stba	%o5,	[%l7 + %o0] 0x80
	set	0x54, %g2
	sta	%f26,	[%l7 + %g2] 0x10
	fbue,a	%fcc1,	loop_2692
	bpos,pt	%xcc,	loop_2693
	be	%xcc,	loop_2694
	nop
	setx	loop_2695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2692:
	edge16n	%i5,	%l6,	%o0
loop_2693:
	xnorcc	%i7,	0x0E03,	%l5
loop_2694:
	xnor	%g6,	0x1D69,	%o4
loop_2695:
	movge	%xcc,	%i0,	%o3
	movrne	%l2,	%l1,	%g4
	alignaddrl	%i2,	%g2,	%o6
	srlx	%i4,	0x05,	%i6
	fmovsvc	%xcc,	%f6,	%f12
	fbl,a	%fcc0,	loop_2696
	tl	%xcc,	0x1
	sethi	0x0BAC,	%o1
	bne,a,pn	%icc,	loop_2697
loop_2696:
	movle	%icc,	%g5,	%i1
	movleu	%xcc,	%l0,	%g7
	edge8l	%o2,	%l3,	%l4
loop_2697:
	flush	%l7 + 0x48
	udivx	%g3,	0x1670,	%o7
	edge32ln	%i3,	%o5,	%i5
	umul	%g1,	%l6,	%i7
	edge32n	%l5,	%g6,	%o0
	movcc	%xcc,	%i0,	%o3
	fbug	%fcc0,	loop_2698
	tneg	%xcc,	0x5
	fmovsa	%icc,	%f29,	%f17
	edge8l	%l2,	%l1,	%g4
loop_2698:
	addc	%i2,	%o4,	%o6
	movre	%i4,	%i6,	%g2
	array16	%g5,	%o1,	%i1
	ldsw	[%l7 + 0x5C],	%g7
	sdivcc	%l0,	0x0908,	%l3
	tge	%xcc,	0x0
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x17,	%f16
	xnor	%o2,	%l4,	%g3
	movge	%xcc,	%i3,	%o5
	fxnors	%f3,	%f17,	%f5
	membar	0x4A
	movge	%xcc,	%o7,	%g1
	tle	%xcc,	0x4
	movge	%xcc,	%i5,	%l6
	fnegs	%f28,	%f24
	ba,a,pt	%xcc,	loop_2699
	fmovrde	%l5,	%f12,	%f28
	addc	%i7,	%g6,	%i0
	smul	%o0,	%o3,	%l2
loop_2699:
	add	%g4,	0x1BB6,	%l1
	xnorcc	%i2,	%o4,	%o6
	xnor	%i6,	%i4,	%g2
	sth	%o1,	[%l7 + 0x34]
	edge8ln	%g5,	%g7,	%i1
	srlx	%l3,	%o2,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f2,	%f8,	%f28
	wr	%g0,	0xe2,	%asi
	stwa	%l0,	[%l7 + 0x5C] %asi
	membar	#Sync
	fmul8x16al	%f2,	%f15,	%f30
	fpsub32	%f8,	%f22,	%f4
	fbule	%fcc3,	loop_2700
	fxnor	%f20,	%f28,	%f18
	set	0x25, %l2
	ldsba	[%l7 + %l2] 0x89,	%i3
loop_2700:
	and	%o5,	%o7,	%g1
	nop
	setx	loop_2701,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stbar
	mova	%xcc,	%i5,	%g3
	movrlz	%l6,	%l5,	%i7
loop_2701:
	call	loop_2702
	andcc	%g6,	0x0515,	%o0
	movgu	%xcc,	%i0,	%l2
	alignaddrl	%o3,	%g4,	%l1
loop_2702:
	fblg,a	%fcc3,	loop_2703
	sethi	0x0716,	%i2
	nop
	setx	0x72F673C8245597A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x72D69A663E198563,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f4,	%f10
	andcc	%o6,	0x0C6F,	%o4
loop_2703:
	std	%f16,	[%l7 + 0x78]
	edge16ln	%i6,	%g2,	%i4
	sdivx	%g5,	0x0032,	%o1
	stx	%i1,	[%l7 + 0x58]
	be,a,pn	%icc,	loop_2704
	flush	%l7 + 0x18
	nop
	setx	loop_2705,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%l3,	0x04E7,	%g7
loop_2704:
	fmovdg	%xcc,	%f1,	%f30
	fmovrslez	%l4,	%f10,	%f2
loop_2705:
	xnor	%l0,	%i3,	%o2
	array16	%o7,	%o5,	%i5
	sth	%g3,	[%l7 + 0x36]
	ldd	[%l7 + 0x10],	%i6
	edge32n	%g1,	%l5,	%g6
	subcc	%i7,	0x06A0,	%i0
	be	%xcc,	loop_2706
	or	%l2,	%o3,	%o0
	fmovdvc	%icc,	%f4,	%f5
	movrgez	%g4,	0x38D,	%l1
loop_2706:
	andncc	%i2,	%o6,	%o4
	stx	%g2,	[%l7 + 0x18]
	fpadd32s	%f23,	%f28,	%f9
	set	0x22, %o4
	ldsha	[%l7 + %o4] 0x04,	%i6
	movn	%xcc,	%g5,	%o1
	fmovs	%f14,	%f1
	taddcctv	%i1,	0x19DC,	%i4
	ble,a,pt	%icc,	loop_2707
	fcmpne32	%f2,	%f12,	%g7
	fbug,a	%fcc3,	loop_2708
	popc	0x0A93,	%l4
loop_2707:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%i3
loop_2708:
	edge8	%o2,	%o7,	%l0
	tgu	%icc,	0x3
	movn	%xcc,	%i5,	%g3
	ldsh	[%l7 + 0x40],	%l6
	fbug,a	%fcc0,	loop_2709
	movg	%xcc,	%g1,	%o5
	fbue	%fcc1,	loop_2710
	move	%xcc,	%l5,	%i7
loop_2709:
	tn	%icc,	0x3
	edge8ln	%i0,	%g6,	%o3
loop_2710:
	mulx	%o0,	0x12C7,	%g4
	ble,a	%icc,	loop_2711
	fpadd32s	%f21,	%f16,	%f20
	fblg,a	%fcc1,	loop_2712
	brgez	%l1,	loop_2713
loop_2711:
	tcs	%xcc,	0x0
	brnz	%l2,	loop_2714
loop_2712:
	edge8ln	%o6,	%o4,	%g2
loop_2713:
	orcc	%i2,	%g5,	%o1
	wr	%g0,	0x18,	%asi
	stba	%i1,	[%l7 + 0x25] %asi
loop_2714:
	orncc	%i6,	%i4,	%l4
	nop
	fitos	%f12,	%f19
	fstox	%f19,	%f6
	fxtos	%f6,	%f6
	fmovrdlez	%l3,	%f22,	%f2
	and	%i3,	0x02B6,	%g7
	edge32l	%o2,	%l0,	%o7
	edge16ln	%g3,	%i5,	%g1
	fmovsleu	%icc,	%f26,	%f23
	edge8n	%l6,	%l5,	%i7
	sub	%i0,	%g6,	%o5
	ta	%icc,	0x2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	tsubcctv	%o0,	%l1,	%l2
	movne	%xcc,	%g4,	%o6
	fcmple32	%f2,	%f30,	%o4
	bvs,a,pt	%icc,	loop_2715
	fbne	%fcc0,	loop_2716
	movre	%g2,	%g5,	%o1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x0C] %asi,	%f9
loop_2715:
	movg	%icc,	%i1,	%i2
loop_2716:
	ldx	[%l7 + 0x50],	%i6
	srax	%l4,	0x09,	%l3
	fzero	%f14
	fandnot2	%f28,	%f24,	%f20
	srax	%i4,	%g7,	%i3
	edge32n	%l0,	%o7,	%o2
	fmovda	%xcc,	%f25,	%f31
	bl,pt	%icc,	loop_2717
	udivcc	%g3,	0x193F,	%i5
	addc	%l6,	%g1,	%l5
	subcc	%i0,	%g6,	%i7
loop_2717:
	fnor	%f6,	%f24,	%f8
	movl	%xcc,	%o5,	%o0
	xor	%o3,	0x12E0,	%l2
	tsubcctv	%g4,	%o6,	%o4
	movgu	%icc,	%l1,	%g5
	fmovsne	%icc,	%f10,	%f18
	andncc	%o1,	%g2,	%i2
	array16	%i6,	%i1,	%l3
	or	%i4,	%l4,	%g7
	xnorcc	%l0,	%i3,	%o7
	bl,pn	%icc,	loop_2718
	bge,pn	%icc,	loop_2719
	movrne	%g3,	0x0A4,	%i5
	tn	%icc,	0x3
loop_2718:
	fpmerge	%f27,	%f11,	%f10
loop_2719:
	fsrc1	%f14,	%f12
	lduw	[%l7 + 0x54],	%l6
	edge16ln	%g1,	%o2,	%l5
	edge16ln	%i0,	%i7,	%g6
	fbule,a	%fcc2,	loop_2720
	tpos	%xcc,	0x4
	movvs	%icc,	%o0,	%o5
	fxor	%f26,	%f6,	%f20
loop_2720:
	fbuge	%fcc3,	loop_2721
	fpadd32s	%f2,	%f20,	%f0
	orcc	%o3,	0x1E05,	%g4
	tl	%icc,	0x6
loop_2721:
	nop
	set	0x60, %l1
	lduwa	[%l7 + %l1] 0x15,	%l2
	fbge	%fcc2,	loop_2722
	movre	%o4,	%o6,	%l1
	fbul	%fcc3,	loop_2723
	nop
	setx	0xE07CC2FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x4F91DD17,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f30,	%f7
loop_2722:
	sub	%o1,	0x000E,	%g5
	nop
	setx	loop_2724,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2723:
	tg	%icc,	0x4
	nop
	fitod	%f12,	%f2
	fdtos	%f2,	%f17
	movg	%xcc,	%i2,	%i6
loop_2724:
	movge	%xcc,	%i1,	%g2
	or	%l3,	%l4,	%i4
	tcs	%xcc,	0x4
	tsubcctv	%l0,	%i3,	%o7
	edge16ln	%g3,	%g7,	%l6
	set	0x30, %i6
	ldxa	[%g0 + %i6] 0x50,	%g1
	fbe	%fcc1,	loop_2725
	fbg	%fcc0,	loop_2726
	orcc	%i5,	%l5,	%o2
	srlx	%i0,	0x0A,	%g6
loop_2725:
	sir	0x0340
loop_2726:
	bshuffle	%f10,	%f8,	%f24
	udivcc	%o0,	0x1444,	%o5
	membar	0x27
	sdivcc	%i7,	0x169E,	%o3
	movcs	%xcc,	%l2,	%o4
	movvc	%xcc,	%o6,	%g4
	fmovsvs	%icc,	%f2,	%f14
	ble,a	%xcc,	loop_2727
	movl	%xcc,	%l1,	%o1
	xor	%g5,	%i6,	%i2
	udivcc	%g2,	0x1B42,	%i1
loop_2727:
	movle	%icc,	%l3,	%i4
	movvc	%icc,	%l4,	%l0
	fmovrsgez	%o7,	%f23,	%f13
	movn	%xcc,	%i3,	%g3
	movl	%icc,	%l6,	%g1
	set	0x52, %i5
	ldsba	[%l7 + %i5] 0x10,	%i5
	brlz	%g7,	loop_2728
	bcc	loop_2729
	fand	%f4,	%f28,	%f30
	fmovsvc	%xcc,	%f25,	%f5
loop_2728:
	fbe,a	%fcc3,	loop_2730
loop_2729:
	fmovsneg	%icc,	%f1,	%f6
	nop
	setx loop_2731, %l0, %l1
	jmpl %l1, %o2
	movgu	%xcc,	%l5,	%g6
loop_2730:
	movrgez	%i0,	0x18B,	%o5
	andcc	%i7,	0x045E,	%o3
loop_2731:
	fnand	%f0,	%f26,	%f20
	fmovsg	%icc,	%f2,	%f22
	fbne,a	%fcc1,	loop_2732
	popc	%o0,	%l2
	tleu	%icc,	0x3
	fmovsge	%icc,	%f20,	%f27
loop_2732:
	fmul8sux16	%f6,	%f12,	%f0
	tne	%icc,	0x5
	tle	%icc,	0x2
	set	0x8, %o1
	ldxa	[%g0 + %o1] 0x4f,	%o4
	sir	0x1CE9
	be,a	loop_2733
	brnz,a	%g4,	loop_2734
	mulscc	%o6,	0x1823,	%o1
	bvc,pn	%xcc,	loop_2735
loop_2733:
	add	%g5,	%l1,	%i6
loop_2734:
	movn	%xcc,	%i2,	%i1
	movg	%icc,	%g2,	%l3
loop_2735:
	bge,a	loop_2736
	fpadd16s	%f17,	%f25,	%f10
	fpadd16	%f8,	%f20,	%f28
	tgu	%icc,	0x0
loop_2736:
	sllx	%i4,	%l0,	%l4
	fbge,a	%fcc0,	loop_2737
	smul	%i3,	0x18EA,	%g3
	smul	%l6,	%o7,	%g1
	tle	%xcc,	0x6
loop_2737:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	tgu	%icc,	0x0
	ba	loop_2738
	edge16	%g7,	%l5,	%g6
	fbne,a	%fcc2,	loop_2739
	nop
	fitos	%f2,	%f23
	fstox	%f23,	%f30
loop_2738:
	umulcc	%i0,	0x09E2,	%o5
	udivx	%o2,	0x1B74,	%i7
loop_2739:
	nop
	setx	0xE6CBFF00,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x69A4C74B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f19,	%f16
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
	movneg	%icc,	%o3,	%o4
	orn	%g4,	%l2,	%o6
	fabss	%f1,	%f12
	fmovrslz	%g5,	%f6,	%f9
	alignaddrl	%l1,	%i6,	%i2
	tne	%icc,	0x7
	fone	%f20
	movcc	%xcc,	%i1,	%o1
	xorcc	%l3,	0x1FEB,	%g2
	mulscc	%l0,	0x0F78,	%l4
	fpack32	%f2,	%f6,	%f26
	srax	%i3,	0x0D,	%g3
	fmovrdlez	%i4,	%f18,	%f26
	sethi	0x14D2,	%o7
	fbe,a	%fcc3,	loop_2740
	tsubcctv	%l6,	0x1AD2,	%g1
	udivcc	%i5,	0x03D1,	%g7
	or	%g6,	0x1219,	%i0
loop_2740:
	movge	%xcc,	%l5,	%o2
	nop
	setx	0xB6655156A68FBE9A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x8E5EE77888E03555,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f2,	%f10
	movcs	%icc,	%i7,	%o0
	sub	%o3,	0x1425,	%o5
	tleu	%xcc,	0x4
	movn	%xcc,	%g4,	%l2
	movneg	%xcc,	%o4,	%o6
	nop
	set	0x7E, %o6
	ldstub	[%l7 + %o6],	%l1
	fandnot1	%f30,	%f18,	%f12
	sub	%i6,	%g5,	%i1
	nop
	setx	loop_2741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%i2,	%l3,	%o1
	movl	%icc,	%g2,	%l4
	flush	%l7 + 0x20
loop_2741:
	fbge,a	%fcc2,	loop_2742
	nop
	setx	0xDE08302F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x30F9B2D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f9,	%f20
	nop
	fitod	%f4,	%f20
	fdtos	%f20,	%f5
	bne,a	%icc,	loop_2743
loop_2742:
	bne,pn	%xcc,	loop_2744
	fbn,a	%fcc2,	loop_2745
	brlz,a	%i3,	loop_2746
loop_2743:
	tcs	%xcc,	0x7
loop_2744:
	movvs	%icc,	%g3,	%l0
loop_2745:
	movgu	%xcc,	%i4,	%l6
loop_2746:
	movpos	%xcc,	%g1,	%i5
	array8	%o7,	%g6,	%g7
	stb	%i0,	[%l7 + 0x51]
	move	%xcc,	%o2,	%l5
	ld	[%l7 + 0x6C],	%f8
	sdivcc	%i7,	0x0654,	%o0
	xor	%o5,	0x0111,	%g4
	faligndata	%f12,	%f2,	%f30
	ta	%xcc,	0x4
	fone	%f10
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%l2
	edge8	%o4,	%l1,	%o6
	bcc,a	%xcc,	loop_2747
	movcs	%xcc,	%g5,	%i1
	movpos	%icc,	%i2,	%i6
	edge16	%o1,	%l3,	%l4
loop_2747:
	fbu,a	%fcc2,	loop_2748
	subcc	%i3,	%g3,	%l0
	set	0x1A, %l0
	ldsba	[%l7 + %l0] 0x14,	%i4
loop_2748:
	edge32ln	%l6,	%g1,	%i5
	fmovdg	%icc,	%f29,	%f5
	smul	%g2,	%o7,	%g6
	ld	[%l7 + 0x54],	%f16
	nop
	set	0x5C, %o2
	ldsh	[%l7 + %o2],	%g7
	fmovscc	%icc,	%f4,	%f10
	fbu,a	%fcc2,	loop_2749
	srlx	%i0,	%o2,	%i7
	sdiv	%o0,	0x0D4D,	%l5
	fmovrde	%o5,	%f12,	%f24
loop_2749:
	bneg,a	loop_2750
	umulcc	%g4,	%l2,	%o4
	srax	%o3,	0x0D,	%l1
	bl	loop_2751
loop_2750:
	addc	%o6,	%g5,	%i1
	fmovsneg	%xcc,	%f18,	%f21
	fmovsl	%xcc,	%f9,	%f19
loop_2751:
	xnorcc	%i2,	0x077D,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l3,	%l4
	sdivx	%i3,	0x1CF6,	%g3
	addcc	%l0,	0x0EED,	%i4
	tsubcctv	%i6,	%g1,	%l6
	set	0x50, %o5
	lduwa	[%l7 + %o5] 0x11,	%g2
	movn	%icc,	%o7,	%g6
	addcc	%i5,	%g7,	%o2
	lduh	[%l7 + 0x20],	%i7
	fcmpne16	%f8,	%f2,	%o0
	mova	%xcc,	%i0,	%l5
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0x0
	smulcc	%o5,	0x0D67,	%l2
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	mulx	%o3,	0x0628,	%l1
	prefetch	[%l7 + 0x58],	 0x3
	movne	%icc,	%o4,	%g5
	popc	0x086D,	%i1
	movpos	%icc,	%i2,	%o6
	fpack16	%f6,	%f20
	edge32	%o1,	%l3,	%i3
	tleu	%xcc,	0x1
	srlx	%l4,	%g3,	%l0
	udivx	%i4,	0x1D4C,	%i6
	wr	%g0,	0x88,	%asi
	stha	%g1,	[%l7 + 0x34] %asi
	for	%f30,	%f0,	%f0
	bleu,pn	%xcc,	loop_2752
	fbl	%fcc1,	loop_2753
	tg	%icc,	0x2
	fsrc1s	%f4,	%f14
loop_2752:
	ldsh	[%l7 + 0x56],	%g2
loop_2753:
	fbule	%fcc1,	loop_2754
	tgu	%xcc,	0x3
	movpos	%icc,	%o7,	%l6
	movrne	%i5,	0x3CE,	%g7
loop_2754:
	andncc	%o2,	%g6,	%i7
	fpsub16	%f12,	%f20,	%f4
	and	%o0,	0x1719,	%l5
	move	%icc,	%g4,	%i0
	movre	%o5,	0x018,	%o3
	membar	0x53
	ldd	[%l7 + 0x20],	%l2
	fcmpne16	%f18,	%f6,	%o4
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f18
	edge8	%l1,	%g5,	%i1
	tneg	%xcc,	0x6
	movre	%i2,	0x14A,	%o1
	fornot1s	%f3,	%f12,	%f29
	add	%l7,	0x44,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%i3
	be,a	%icc,	loop_2755
	addccc	%l3,	0x04E5,	%g3
	umulcc	%l0,	%l4,	%i4
	bn,a,pn	%xcc,	loop_2756
loop_2755:
	movn	%icc,	%i6,	%g2
	xor	%o7,	%l6,	%i5
	tvc	%xcc,	0x5
loop_2756:
	fand	%f30,	%f2,	%f28
	edge8n	%g1,	%g7,	%g6
	fands	%f21,	%f7,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%o2,	%f21,	%f28
	popc	0x1A76,	%i7
	sllx	%o0,	%g4,	%l5
	fmovsl	%xcc,	%f14,	%f17
	add	%o5,	%i0,	%o3
	bne	loop_2757
	xnor	%l2,	%l1,	%g5
	fmovdl	%xcc,	%f1,	%f4
	subc	%i1,	%o4,	%i2
loop_2757:
	nop
	setx	0xCD976421FEB6AF6F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDA49C0AC4FDA48FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f14,	%f22
	mulscc	%o6,	0x1B54,	%i3
	nop
	setx	0x82BD2ED31063A001,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovsne	%icc,	%f21,	%f19
	st	%f10,	[%l7 + 0x58]
	tge	%icc,	0x1
	fblg,a	%fcc1,	loop_2758
	fmul8x16	%f27,	%f30,	%f30
	xnorcc	%l3,	%o1,	%g3
	array16	%l0,	%l4,	%i4
loop_2758:
	addcc	%i6,	0x1B08,	%g2
	tvc	%icc,	0x5
	subc	%o7,	0x1B9B,	%l6
	edge8l	%g1,	%i5,	%g7
	taddcctv	%g6,	%i7,	%o2
	lduw	[%l7 + 0x1C],	%o0
	mova	%xcc,	%l5,	%g4
	fpackfix	%f8,	%f15
	edge32n	%i0,	%o3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l1,	%g5,	%l2
	udiv	%i1,	0x1B73,	%i2
	nop
	setx	0x07EB4339,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xC04EF259,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f18,	%f15
	sub	%o6,	0x056D,	%o4
	fpackfix	%f10,	%f25
	andncc	%l3,	%o1,	%i3
	tn	%icc,	0x2
	wr	%g0,	0x57,	%asi
	stxa	%g3,	[%g0 + 0x0] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x5
	sdiv	%l4,	0x1A0C,	%l0
	te	%icc,	0x6
	umul	%i6,	0x011D,	%i4
	stbar
	movne	%icc,	%o7,	%l6
	xorcc	%g2,	%g1,	%g7
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f7
	srax	%g6,	0x03,	%i7
	fsrc2s	%f7,	%f2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	ldx	[%l7 + 0x20],	%o2
	for	%f2,	%f10,	%f26
	fbg	%fcc3,	loop_2759
	movgu	%icc,	%l5,	%o0
	mulx	%i0,	0x09C3,	%o3
	move	%icc,	%o5,	%l1
loop_2759:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f10
	fxtod	%f10,	%f12
	nop
	setx	0x8E2F1C3F276B627A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x18CBCA544436912B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f12,	%f0
	nop
	setx	0xDC15B8B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f30
	fbn,a	%fcc2,	loop_2760
	fbule,a	%fcc3,	loop_2761
	tcc	%xcc,	0x0
	mulx	%g5,	0x01E0,	%l2
loop_2760:
	bne	%xcc,	loop_2762
loop_2761:
	edge8l	%g4,	%i1,	%i2
	sdivx	%o6,	0x0198,	%l3
	call	loop_2763
loop_2762:
	ta	%icc,	0x4
	ta	%xcc,	0x1
	fandnot1	%f0,	%f28,	%f28
loop_2763:
	movcc	%xcc,	%o4,	%i3
	addccc	%g3,	%o1,	%l4
	subcc	%i6,	%l0,	%o7
	sllx	%i4,	%l6,	%g1
	fbuge	%fcc2,	loop_2764
	movl	%xcc,	%g2,	%g6
	fcmple32	%f14,	%f14,	%i7
	movleu	%icc,	%i5,	%o2
loop_2764:
	fsrc2	%f26,	%f28
	udivx	%g7,	0x1C2B,	%l5
	srl	%i0,	%o3,	%o0
	movre	%o5,	%g5,	%l2
	set	0x7C, %g4
	stha	%l1,	[%l7 + %g4] 0xe2
	membar	#Sync
	addcc	%i1,	%i2,	%g4
	fmovsne	%icc,	%f26,	%f23
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	taddcctv	%l3,	%o6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%o1,	%l4
	mova	%xcc,	%i3,	%i6
	array8	%o7,	%l0,	%l6
	andncc	%i4,	%g1,	%g6
	brlz,a	%g2,	loop_2765
	alignaddr	%i7,	%o2,	%i5
	movg	%icc,	%l5,	%i0
	movrlez	%g7,	0x357,	%o3
loop_2765:
	ldsw	[%l7 + 0x20],	%o5
	ld	[%l7 + 0x30],	%f19
	fbo,a	%fcc3,	loop_2766
	movrlez	%o0,	0x1F5,	%g5
	fornot1s	%f29,	%f29,	%f22
	edge16ln	%l1,	%i1,	%l2
loop_2766:
	taddcctv	%i2,	0x1976,	%g4
	movvc	%icc,	%o6,	%o4
	tn	%icc,	0x2
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%g2
	tpos	%icc,	0x4
	movcc	%xcc,	%l3,	%l4
	movrgez	%o1,	%i6,	%i3
	sdiv	%o7,	0x187A,	%l0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x10] %asi,	%f19
	be,a,pn	%icc,	loop_2767
	call	loop_2768
	andcc	%i4,	%g1,	%g6
	tl	%icc,	0x3
loop_2767:
	srlx	%g2,	0x0B,	%i7
loop_2768:
	nop
	setx	0xEF0F379E007A5B42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fmul8ulx16	%f18,	%f8,	%f6
	bvs,a	loop_2769
	tleu	%icc,	0x1
	orcc	%o2,	%l6,	%i5
	fmovdcs	%icc,	%f28,	%f22
loop_2769:
	andcc	%i0,	0x0E6A,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g7,	%o3,	%o5
	edge32n	%o0,	%g5,	%i1
	umul	%l1,	%l2,	%i2
	popc	%o6,	%o4
	movl	%icc,	%g3,	%l3
	fcmpgt32	%f24,	%f24,	%l4
	bvs,pn	%xcc,	loop_2770
	ldsb	[%l7 + 0x7B],	%g4
	array32	%i6,	%o1,	%o7
	array16	%i3,	%i4,	%g1
loop_2770:
	fcmpgt16	%f2,	%f20,	%l0
	add	%g6,	%i7,	%g2
	movrlez	%l6,	%i5,	%o2
	movl	%xcc,	%i0,	%l5
	or	%g7,	%o3,	%o5
	movleu	%icc,	%g5,	%o0
	nop
	setx	0xEA2633F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x417C854B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f22,	%f20
	subc	%l1,	%i1,	%i2
	sethi	0x1884,	%o6
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f18
	tne	%xcc,	0x1
	fcmpne32	%f8,	%f30,	%o4
	stx	%g3,	[%l7 + 0x18]
	bleu,a	%xcc,	loop_2771
	sdiv	%l2,	0x0B99,	%l3
	orncc	%l4,	0x0F11,	%i6
	tcs	%xcc,	0x6
loop_2771:
	taddcctv	%g4,	0x1114,	%o1
	popc	%i3,	%i4
	fpsub16	%f12,	%f22,	%f26
	call	loop_2772
	sth	%g1,	[%l7 + 0x6A]
	fandnot1s	%f28,	%f27,	%f18
	tsubcc	%l0,	0x1478,	%g6
loop_2772:
	fmovsleu	%icc,	%f23,	%f11
	movge	%xcc,	%i7,	%g2
	movrne	%l6,	0x2F6,	%o7
	srlx	%o2,	0x04,	%i5
	fmovsn	%icc,	%f0,	%f27
	sethi	0x18FD,	%i0
	movrgez	%l5,	0x22B,	%o3
	fbne,a	%fcc3,	loop_2773
	umul	%g7,	0x105A,	%o5
	addccc	%g5,	%o0,	%i1
	brlz,a	%l1,	loop_2774
loop_2773:
	fmovsneg	%xcc,	%f31,	%f11
	nop
	fitos	%f4,	%f21
	fstox	%f21,	%f2
	fxtos	%f2,	%f16
	andcc	%o6,	%i2,	%o4
loop_2774:
	array32	%l2,	%g3,	%l3
	andncc	%i6,	%l4,	%o1
	sth	%i3,	[%l7 + 0x5A]
	and	%g4,	%g1,	%i4
	edge16n	%l0,	%i7,	%g2
	tsubcctv	%l6,	%o7,	%o2
	sllx	%i5,	%i0,	%g6
	movrlz	%o3,	%g7,	%o5
	movge	%xcc,	%l5,	%g5
	brnz	%i1,	loop_2775
	prefetch	[%l7 + 0x68],	 0x2
	udivcc	%l1,	0x0E59,	%o0
	fornot1s	%f25,	%f27,	%f8
loop_2775:
	bn,pn	%icc,	loop_2776
	fsrc1	%f8,	%f16
	movrne	%o6,	%i2,	%l2
	tne	%xcc,	0x3
loop_2776:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrdne	%g3,	%f26,	%f14
	udivcc	%o4,	0x1B1B,	%l3
	srlx	%l4,	0x19,	%o1
	mova	%icc,	%i6,	%g4
	edge32n	%i3,	%g1,	%i4
	sth	%l0,	[%l7 + 0x66]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%l6
	lduw	[%l7 + 0x2C],	%o7
	movvs	%icc,	%i7,	%i5
	mulx	%o2,	0x077B,	%g6
	tpos	%icc,	0x5
	stx	%o3,	[%l7 + 0x20]
	array32	%g7,	%i0,	%o5
	fmovsn	%icc,	%f30,	%f5
	lduw	[%l7 + 0x44],	%g5
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x54] %asi
	fnand	%f14,	%f30,	%f22
	or	%i1,	%l5,	%o0
	fmul8x16	%f30,	%f12,	%f4
	tge	%xcc,	0x1
	andn	%l1,	%i2,	%l2
	wr	%g0,	0x11,	%asi
	sta	%f13,	[%l7 + 0x44] %asi
	and	%o6,	0x16FD,	%o4
	fmovde	%xcc,	%f6,	%f17
	andn	%l3,	0x06AF,	%l4
	sdiv	%g3,	0x1527,	%o1
	fmovsl	%icc,	%f11,	%f27
	movrgez	%g4,	0x030,	%i6
	movrlz	%g1,	0x09A,	%i4
	brz,a	%i3,	loop_2777
	mulscc	%g2,	%l0,	%l6
	mova	%icc,	%i7,	%i5
	tvs	%xcc,	0x5
loop_2777:
	xor	%o7,	%o2,	%g6
	te	%xcc,	0x1
	movle	%icc,	%g7,	%o3
	fbug	%fcc1,	loop_2778
	and	%o5,	%i0,	%g5
	andncc	%i1,	%o0,	%l5
	for	%f18,	%f12,	%f14
loop_2778:
	movge	%icc,	%l1,	%i2
	xnorcc	%l2,	%o6,	%l3
	umulcc	%o4,	0x1086,	%g3
	fmovsne	%icc,	%f23,	%f19
	fabsd	%f4,	%f18
	fbu,a	%fcc0,	loop_2779
	xnor	%l4,	%o1,	%i6
	andn	%g1,	%i4,	%i3
	movcs	%icc,	%g4,	%l0
loop_2779:
	call	loop_2780
	mova	%icc,	%g2,	%l6
	nop
	setx	loop_2781,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%xcc,	0x0
loop_2780:
	movre	%i7,	%o7,	%i5
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g6
loop_2781:
	srlx	%o2,	0x1E,	%g7
	edge8l	%o5,	%o3,	%i0
	ble,a,pt	%icc,	loop_2782
	alignaddrl	%g5,	%i1,	%o0
	andcc	%l5,	0x04C2,	%l1
	movvc	%xcc,	%i2,	%o6
loop_2782:
	udivcc	%l3,	0x07E5,	%l2
	udivcc	%o4,	0x1C16,	%g3
	nop
	setx	0x21A4A784A1041D9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9F1EC6A904001A5D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f4,	%f30
	addcc	%l4,	0x03D7,	%o1
	movge	%xcc,	%i6,	%i4
	brgez	%i3,	loop_2783
	tpos	%xcc,	0x3
	nop
	setx	0x0CFE436F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xC6325C26,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f18,	%f10
	movrlez	%g4,	%l0,	%g2
loop_2783:
	subccc	%g1,	%i7,	%l6
	alignaddr	%o7,	%i5,	%o2
	orcc	%g6,	0x15DA,	%o5
	edge32ln	%g7,	%i0,	%g5
	fornot2	%f8,	%f10,	%f16
	movvs	%xcc,	%o3,	%o0
	sdiv	%i1,	0x166D,	%l1
	brgz	%i2,	loop_2784
	nop
	fitod	%f4,	%f0
	fdtox	%f0,	%f0
	umulcc	%o6,	%l3,	%l2
	movcc	%xcc,	%l5,	%g3
loop_2784:
	udiv	%o4,	0x15D2,	%l4
	fbuge	%fcc1,	loop_2785
	movrlz	%o1,	%i6,	%i3
	fmovsge	%xcc,	%f27,	%f10
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
loop_2785:
	ld	[%l7 + 0x24],	%f20
	bl,a	loop_2786
	fmovsn	%xcc,	%f24,	%f2
	brlez	%i4,	loop_2787
	ldstub	[%l7 + 0x15],	%g2
loop_2786:
	fzeros	%f10
	bgu,a	loop_2788
loop_2787:
	tg	%icc,	0x3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l0
loop_2788:
	nop
	set	0x50, %i0
	stx	%l6,	[%l7 + %i0]
	sub	%i7,	%i5,	%o2
	tl	%xcc,	0x5
	fpadd32	%f8,	%f6,	%f28
	fbl,a	%fcc2,	loop_2789
	fpsub16	%f0,	%f14,	%f16
	movg	%icc,	%g6,	%o5
	ldsh	[%l7 + 0x56],	%o7
loop_2789:
	smul	%i0,	%g5,	%g7
	sllx	%o3,	0x0D,	%i1
	movpos	%xcc,	%l1,	%i2
	fbge,a	%fcc1,	loop_2790
	movne	%xcc,	%o0,	%o6
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x10,	%l2
loop_2790:
	fba	%fcc0,	loop_2791
	nop
	setx	0x5F41485C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x136925A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f27,	%f28
	wr	%g0,	0x19,	%asi
	sta	%f24,	[%l7 + 0x2C] %asi
loop_2791:
	sll	%l3,	%l5,	%g3
	sra	%l4,	%o1,	%o4
	fbne	%fcc0,	loop_2792
	tn	%xcc,	0x2
	brlez,a	%i3,	loop_2793
	movge	%icc,	%g4,	%i6
loop_2792:
	bcs,pt	%xcc,	loop_2794
	fmovrdne	%g2,	%f26,	%f2
loop_2793:
	movge	%xcc,	%i4,	%g1
	brlez	%l6,	loop_2795
loop_2794:
	fmovsge	%xcc,	%f15,	%f0
	srl	%l0,	0x11,	%i7
	xor	%o2,	%i5,	%g6
loop_2795:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%o5,	loop_2796
	mulx	%i0,	%g5,	%g7
	udivx	%o3,	0x1DC3,	%i1
	fbo	%fcc0,	loop_2797
loop_2796:
	fmovdneg	%xcc,	%f18,	%f16
	fmovrslz	%o7,	%f26,	%f12
	fmul8sux16	%f30,	%f18,	%f20
loop_2797:
	alignaddr	%l1,	%o0,	%o6
	sethi	0x119B,	%i2
	ld	[%l7 + 0x30],	%f8
	sir	0x1810
	bpos,a,pn	%xcc,	loop_2798
	array32	%l2,	%l5,	%g3
	fpmerge	%f2,	%f30,	%f4
	sll	%l4,	0x12,	%o1
loop_2798:
	fcmpgt16	%f30,	%f6,	%o4
	nop
	setx	0x936345F99E8BA40B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x902756D9FED1BC15,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f28,	%f6
	tsubcc	%i3,	0x08AA,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l3,	%g2,	%i6
	movcs	%xcc,	%g1,	%i4
	add	%l6,	%l0,	%o2
	fcmpgt16	%f26,	%f18,	%i5
	fmul8sux16	%f30,	%f6,	%f16
	orcc	%i7,	%o5,	%g6
	movre	%i0,	0x22C,	%g5
	udivx	%g7,	0x18BC,	%i1
	umul	%o7,	%o3,	%o0
	tl	%icc,	0x5
	set	0x33, %i7
	stba	%l1,	[%l7 + %i7] 0xe3
	membar	#Sync
	orncc	%i2,	0x11EE,	%l2
	fandnot1	%f24,	%f4,	%f4
	andn	%l5,	%g3,	%o6
	fba	%fcc2,	loop_2799
	edge32ln	%l4,	%o4,	%o1
	subcc	%i3,	0x04E2,	%g4
	tn	%xcc,	0x5
loop_2799:
	fabsd	%f18,	%f2
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%g2
	call	loop_2800
	fbuge,a	%fcc3,	loop_2801
	sll	%l3,	%g1,	%i6
	sdiv	%i4,	0x0C4B,	%l0
loop_2800:
	brlez,a	%o2,	loop_2802
loop_2801:
	udivcc	%i5,	0x0251,	%l6
	tne	%xcc,	0x1
	udivcc	%o5,	0x1196,	%g6
loop_2802:
	fmovsl	%xcc,	%f24,	%f11
	tne	%icc,	0x6
	bne,a	loop_2803
	tg	%xcc,	0x2
	taddcc	%i7,	%i0,	%g5
	brlez,a	%g7,	loop_2804
loop_2803:
	ldsw	[%l7 + 0x74],	%o7
	movgu	%icc,	%i1,	%o0
	fmovsvc	%xcc,	%f16,	%f26
loop_2804:
	and	%o3,	0x0467,	%i2
	tcc	%icc,	0x2
	fpmerge	%f24,	%f26,	%f4
	sub	%l2,	%l1,	%l5
	movvc	%icc,	%g3,	%o6
	edge16n	%o4,	%l4,	%i3
	ble,pn	%icc,	loop_2805
	fpack32	%f2,	%f2,	%f6
	umulcc	%g4,	0x165A,	%g2
	xor	%l3,	0x0BA9,	%g1
loop_2805:
	and	%o1,	0x10CE,	%i6
	nop
	setx	loop_2806,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%l0,	0x19C1,	%o2
	fmovse	%xcc,	%f9,	%f31
	tl	%icc,	0x1
loop_2806:
	edge8	%i5,	%i4,	%o5
	movne	%xcc,	%g6,	%l6
	bvc,pn	%icc,	loop_2807
	popc	0x1B58,	%i0
	fmovsvs	%icc,	%f7,	%f8
	movpos	%icc,	%g5,	%i7
loop_2807:
	fnegs	%f6,	%f3
	taddcc	%g7,	0x08B1,	%o7
	fpadd32	%f18,	%f20,	%f2
	bneg,a,pn	%xcc,	loop_2808
	fpadd32s	%f4,	%f0,	%f19
	movge	%icc,	%o0,	%o3
	st	%f9,	[%l7 + 0x7C]
loop_2808:
	add	%i1,	0x0CBA,	%i2
	lduh	[%l7 + 0x74],	%l2
	edge32ln	%l5,	%g3,	%l1
	movne	%xcc,	%o6,	%l4
	fpadd32s	%f2,	%f22,	%f4
	smul	%o4,	%g4,	%i3
	movn	%icc,	%l3,	%g2
	nop
	setx	loop_2809,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x1
	nop
	fitos	%f4,	%f22
	fstoi	%f22,	%f16
	stbar
loop_2809:
	edge8ln	%o1,	%i6,	%l0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x0F] %asi,	%o2
	umulcc	%i5,	%g1,	%o5
	std	%f22,	[%l7 + 0x20]
	movgu	%xcc,	%i4,	%l6
	edge8ln	%g6,	%i0,	%g5
	movcc	%xcc,	%g7,	%o7
	addcc	%i7,	%o3,	%i1
	udivcc	%o0,	0x0F38,	%i2
	array8	%l5,	%l2,	%l1
	edge32l	%o6,	%g3,	%l4
	movrgz	%o4,	%g4,	%l3
	srlx	%i3,	0x0C,	%o1
	stb	%i6,	[%l7 + 0x7F]
	fpsub32s	%f29,	%f24,	%f2
	andcc	%l0,	0x111B,	%o2
	fone	%f12
	tne	%xcc,	0x3
	srlx	%i5,	0x10,	%g2
	fpack16	%f30,	%f16
	xnorcc	%g1,	0x0963,	%i4
	tg	%icc,	0x6
	xorcc	%o5,	0x181B,	%l6
	edge16ln	%i0,	%g5,	%g6
	nop
	setx	0x6B610341,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xA288F9AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f9,	%f29
	ldsh	[%l7 + 0x26],	%g7
	fmovdneg	%xcc,	%f13,	%f31
	brgz	%o7,	loop_2810
	taddcctv	%i7,	%i1,	%o0
	taddcc	%o3,	0x1DAE,	%i2
	edge8l	%l2,	%l5,	%o6
loop_2810:
	fba	%fcc1,	loop_2811
	udiv	%g3,	0x14DA,	%l4
	bvc,pn	%xcc,	loop_2812
	be	loop_2813
loop_2811:
	fmovscc	%icc,	%f21,	%f3
	fbo,a	%fcc0,	loop_2814
loop_2812:
	movgu	%xcc,	%o4,	%l1
loop_2813:
	fnor	%f22,	%f22,	%f0
	fmovdle	%icc,	%f16,	%f12
loop_2814:
	tl	%icc,	0x5
	set	0x34, %o3
	sta	%f29,	[%l7 + %o3] 0x10
	srl	%l3,	0x0E,	%i3
	edge8	%o1,	%g4,	%l0
	fone	%f30
	fmul8x16au	%f12,	%f1,	%f18
	movleu	%icc,	%o2,	%i6
	array32	%i5,	%g2,	%g1
	call	loop_2815
	movleu	%icc,	%o5,	%l6
	ldd	[%l7 + 0x40],	%f26
	fbuge,a	%fcc1,	loop_2816
loop_2815:
	tvs	%xcc,	0x7
	bpos	%icc,	loop_2817
	fmovrde	%i0,	%f8,	%f14
loop_2816:
	movrlez	%g5,	0x21E,	%i4
	fmovsn	%xcc,	%f15,	%f16
loop_2817:
	andncc	%g7,	%g6,	%i7
	brz,a	%i1,	loop_2818
	bneg,pn	%xcc,	loop_2819
	add	%o0,	0x078B,	%o3
	fmovsg	%xcc,	%f31,	%f24
loop_2818:
	fmovdcs	%icc,	%f25,	%f30
loop_2819:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f27,	[%l7 + 0x3C] %asi
	subccc	%i2,	%l2,	%o7
	tleu	%xcc,	0x6
	tneg	%xcc,	0x5
	movn	%icc,	%l5,	%g3
	set	0x5E, %o7
	stba	%o6,	[%l7 + %o7] 0x23
	membar	#Sync
	fmul8x16al	%f30,	%f25,	%f28
	sllx	%o4,	0x03,	%l1
	movle	%xcc,	%l4,	%i3
	orcc	%l3,	%o1,	%g4
	fpadd32	%f8,	%f30,	%f4
	pdist	%f24,	%f30,	%f18
	fmul8x16al	%f27,	%f23,	%f20
	udivcc	%l0,	0x03E5,	%o2
	fandnot2	%f8,	%f10,	%f4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3b8] %asi,	%i6 ripped by fixASI40.pl ripped by fixASI40.pl
	ldstub	[%l7 + 0x6D],	%g2
	flush	%l7 + 0x54
	edge16l	%g1,	%i5,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f24,	%f20,	%f16
	array8	%i0,	%g5,	%l6
	umul	%g7,	0x0B00,	%g6
	fmovscc	%icc,	%f10,	%f3
	brnz	%i7,	loop_2820
	tne	%icc,	0x5
	fpsub16s	%f9,	%f25,	%f22
	edge8	%i4,	%i1,	%o3
loop_2820:
	movrlz	%i2,	0x161,	%o0
	movrne	%o7,	%l2,	%g3
	fsrc2s	%f17,	%f22
	tl	%icc,	0x7
	tg	%xcc,	0x7
	tcc	%icc,	0x2
	prefetch	[%l7 + 0x14],	 0x1
	fmovrdgez	%o6,	%f28,	%f20
	xor	%l5,	%o4,	%l4
	edge8l	%i3,	%l1,	%o1
	alignaddrl	%l3,	%g4,	%o2
	fpadd32s	%f24,	%f30,	%f11
	sub	%i6,	0x0F50,	%g2
	taddcctv	%l0,	%i5,	%o5
	fnand	%f14,	%f8,	%f12
	edge8n	%g1,	%i0,	%g5
	prefetch	[%l7 + 0x5C],	 0x3
	fcmple32	%f4,	%f0,	%g7
	swap	[%l7 + 0x40],	%g6
	ble,pn	%icc,	loop_2821
	fzero	%f20
	ta	%icc,	0x2
	nop
	set	0x56, %i2
	sth	%i7,	[%l7 + %i2]
loop_2821:
	tsubcc	%l6,	%i1,	%o3
	fbe	%fcc2,	loop_2822
	movgu	%xcc,	%i4,	%o0
	taddcctv	%i2,	%l2,	%g3
	orn	%o6,	0x1D63,	%l5
loop_2822:
	ldub	[%l7 + 0x3A],	%o4
	ldx	[%l7 + 0x48],	%o7
	fpackfix	%f2,	%f5
	brz,a	%l4,	loop_2823
	movl	%icc,	%l1,	%o1
	sdiv	%l3,	0x0E08,	%g4
	tleu	%xcc,	0x6
loop_2823:
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f14
	fmovrslz	%i3,	%f23,	%f4
	edge16	%o2,	%i6,	%g2
	edge8n	%i5,	%o5,	%l0
	fbu,a	%fcc2,	loop_2824
	st	%f19,	[%l7 + 0x4C]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf9
	membar	#Sync
loop_2824:
	nop
	set	0x56, %g5
	ldsha	[%l7 + %g5] 0x0c,	%i0
	edge8ln	%g1,	%g7,	%g5
	edge8n	%g6,	%i7,	%i1
	brgz	%o3,	loop_2825
	fbge	%fcc0,	loop_2826
	fbe,a	%fcc0,	loop_2827
	fmovrde	%i4,	%f24,	%f26
loop_2825:
	call	loop_2828
loop_2826:
	or	%o0,	%l6,	%i2
loop_2827:
	sdivcc	%g3,	0x18C9,	%o6
	sra	%l5,	%o4,	%o7
loop_2828:
	edge8	%l4,	%l1,	%o1
	fbug	%fcc0,	loop_2829
	fmovdleu	%icc,	%f21,	%f0
	fmovdcs	%xcc,	%f26,	%f26
	tle	%xcc,	0x7
loop_2829:
	nop
	setx	0x68452696BFADFE7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0C9632BC98A1783C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f26,	%f24
	fmul8x16al	%f13,	%f23,	%f12
	umulcc	%l3,	%l2,	%i3
	fmuld8sux16	%f24,	%f8,	%f12
	alignaddr	%g4,	%i6,	%o2
	movrgz	%i5,	%o5,	%l0
	pdist	%f24,	%f12,	%f24
	tpos	%icc,	0x4
	brlz,a	%g2,	loop_2830
	fbu	%fcc0,	loop_2831
	tvs	%icc,	0x2
	fmovdge	%xcc,	%f0,	%f8
loop_2830:
	fnor	%f28,	%f14,	%f12
loop_2831:
	tleu	%xcc,	0x1
	nop
	fitos	%f6,	%f29
	fstox	%f29,	%f22
	fxtos	%f22,	%f28
	edge16	%i0,	%g1,	%g7
	movrlz	%g6,	%g5,	%i7
	ldd	[%l7 + 0x60],	%o2
	fornot2s	%f10,	%f30,	%f6
	fmovrdgez	%i4,	%f12,	%f24
	fxors	%f22,	%f21,	%f0
	brlz	%o0,	loop_2832
	prefetch	[%l7 + 0x28],	 0x0
	set	0x42, %g1
	stba	%i1,	[%l7 + %g1] 0x22
	membar	#Sync
loop_2832:
	std	%f10,	[%l7 + 0x68]
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%i2
	brz,a	%l6,	loop_2833
	edge16n	%g3,	%o6,	%l5
	st	%f7,	[%l7 + 0x34]
	fmovrdlz	%o7,	%f24,	%f20
loop_2833:
	fxnors	%f6,	%f7,	%f5
	set	0x60, %l4
	ldda	[%l7 + %l4] 0x2a,	%l4
	fmovd	%f10,	%f4
	fbge	%fcc1,	loop_2834
	smulcc	%o4,	%l1,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l2,	%i3
loop_2834:
	nop
	setx	loop_2835,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%o1,	%g4,	%i6
	sdivcc	%i5,	0x1204,	%o2
	st	%f21,	[%l7 + 0x6C]
loop_2835:
	movcs	%icc,	%l0,	%o5
	nop
	setx	0x407C5F66,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f8
	tpos	%icc,	0x7
	tg	%icc,	0x4
	mulscc	%g2,	0x1DC7,	%g1
	bge	loop_2836
	ldsw	[%l7 + 0x68],	%g7
	fmovrdne	%g6,	%f16,	%f20
	fnot2	%f16,	%f16
loop_2836:
	tle	%xcc,	0x2
	fbn,a	%fcc0,	loop_2837
	tvs	%xcc,	0x1
	fands	%f13,	%f23,	%f28
	tgu	%xcc,	0x1
loop_2837:
	fmul8x16au	%f31,	%f20,	%f8
	edge8	%i0,	%i7,	%o3
	fmovscc	%xcc,	%f31,	%f5
	te	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f30,	%f0
	movrgez	%i4,	0x22B,	%g5
	mulx	%o0,	0x110D,	%i2
	movrne	%i1,	0x31B,	%l6
	edge16n	%o6,	%l5,	%g3
	udivx	%l4,	0x1FDD,	%o4
	ta	%icc,	0x1
	andncc	%l1,	%l3,	%o7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x48] %asi,	%i3
	edge32	%o1,	%l2,	%g4
	alignaddr	%i5,	%i6,	%o2
	movrne	%l0,	%g2,	%o5
	set	0x12, %l6
	lduba	[%l7 + %l6] 0x0c,	%g1
	fbo	%fcc0,	loop_2838
	edge32	%g6,	%g7,	%i7
	orcc	%i0,	0x0868,	%o3
	nop
	fitod	%f0,	%f30
	fdtoi	%f30,	%f9
loop_2838:
	sdiv	%g5,	0x1F33,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xB2108F60FB128652,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x51D6F802C25CE1D9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f14
	mulx	%o0,	%i1,	%i2
	andn	%l6,	0x06E7,	%l5
	tcs	%icc,	0x7
	brlez,a	%o6,	loop_2839
	movvc	%icc,	%g3,	%l4
	fbe	%fcc1,	loop_2840
	fmuld8sux16	%f14,	%f13,	%f2
loop_2839:
	sll	%l1,	0x17,	%l3
	smul	%o4,	%i3,	%o1
loop_2840:
	fmovse	%xcc,	%f14,	%f19
	sdiv	%o7,	0x1BCD,	%g4
	movvc	%icc,	%i5,	%i6
	edge32ln	%l2,	%o2,	%g2
	sllx	%l0,	%g1,	%o5
	set	0x0E, %i3
	lduha	[%l7 + %i3] 0x15,	%g7
	tne	%icc,	0x4
	movgu	%icc,	%g6,	%i0
	te	%icc,	0x5
	movvc	%icc,	%o3,	%g5
	fzeros	%f3
	tvs	%icc,	0x0
	array16	%i7,	%i4,	%o0
	orcc	%i2,	0x0B44,	%l6
	orncc	%i1,	%l5,	%g3
	tpos	%xcc,	0x4
	sra	%l4,	%o6,	%l3
	bl,a,pn	%xcc,	loop_2841
	xorcc	%l1,	%o4,	%o1
	be	loop_2842
	fmul8ulx16	%f10,	%f6,	%f20
loop_2841:
	movne	%icc,	%o7,	%g4
	smulcc	%i3,	0x06A6,	%i6
loop_2842:
	fnot2s	%f16,	%f4
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x14,	 0x1
	add	%i5,	0x03C4,	%o2
	srlx	%g2,	0x0B,	%g1
	flush	%l7 + 0x58
	movle	%xcc,	%l0,	%o5
	brz,a	%g7,	loop_2843
	addcc	%i0,	0x0E39,	%o3
	umul	%g5,	0x1C1D,	%i7
	sir	0x088F
loop_2843:
	fmovdge	%icc,	%f20,	%f15
	movrlez	%g6,	%i4,	%o0
	or	%l6,	0x0D5F,	%i1
	tgu	%icc,	0x6
	fnors	%f3,	%f19,	%f31
	sra	%l5,	%g3,	%i2
	prefetch	[%l7 + 0x74],	 0x2
	andncc	%o6,	%l4,	%l1
	sdivx	%l3,	0x03CD,	%o1
	fcmple16	%f8,	%f14,	%o7
	sdivcc	%o4,	0x165C,	%i3
	sub	%i6,	0x0D5D,	%l2
	fbl	%fcc0,	loop_2844
	edge16l	%g4,	%i5,	%o2
	srlx	%g1,	%g2,	%o5
	addc	%l0,	%i0,	%o3
loop_2844:
	movg	%icc,	%g7,	%i7
	fbul	%fcc3,	loop_2845
	fmovdcc	%icc,	%f8,	%f2
	fmovdcs	%icc,	%f21,	%f23
	fbuge	%fcc3,	loop_2846
loop_2845:
	movn	%icc,	%g6,	%i4
	edge16n	%g5,	%l6,	%i1
	smul	%l5,	%o0,	%g3
loop_2846:
	mulscc	%o6,	0x1FAD,	%l4
	fmovsgu	%icc,	%f7,	%f5
	brlz	%l1,	loop_2847
	movrlez	%l3,	%i2,	%o7
	orn	%o4,	%o1,	%i6
	orcc	%l2,	%i3,	%i5
loop_2847:
	movpos	%icc,	%o2,	%g1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g2
	smulcc	%g4,	%l0,	%o5
	faligndata	%f28,	%f22,	%f12
	nop
	setx	loop_2848,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ld	[%l7 + 0x7C],	%f17
	xnorcc	%i0,	0x1D7E,	%g7
	st	%f3,	[%l7 + 0x68]
loop_2848:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f16,	%f8,	%o3
	srlx	%i7,	0x14,	%g6
	movrgez	%i4,	0x082,	%l6
	fsrc2s	%f15,	%f11
	edge32l	%g5,	%i1,	%o0
	umul	%g3,	%o6,	%l4
	taddcctv	%l5,	0x1164,	%l1
	bpos,pn	%icc,	loop_2849
	fmul8sux16	%f10,	%f10,	%f26
	tneg	%icc,	0x5
	and	%l3,	%i2,	%o4
loop_2849:
	bn,a,pn	%xcc,	loop_2850
	bgu,a	%xcc,	loop_2851
	movvs	%icc,	%o7,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2850:
	xnorcc	%l2,	0x09C9,	%o1
loop_2851:
	nop
	set	0x2C, %l5
	sta	%f30,	[%l7 + %l5] 0x81
	mulscc	%i5,	0x07C3,	%i3
	tcc	%icc,	0x2
	bpos	loop_2852
	edge16n	%o2,	%g2,	%g4
	edge16	%g1,	%l0,	%o5
	fmovsvc	%xcc,	%f19,	%f8
loop_2852:
	ldstub	[%l7 + 0x18],	%g7
	or	%o3,	%i7,	%i0
	fmovrdne	%i4,	%f12,	%f10
	subcc	%l6,	0x18D1,	%g6
	bleu,a	loop_2853
	edge8	%i1,	%o0,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%o6
loop_2853:
	te	%icc,	0x4
	movl	%xcc,	%l4,	%g3
	fmovrdlz	%l1,	%f12,	%f22
	fzeros	%f30
	fmovdg	%xcc,	%f17,	%f15
	sdivx	%l3,	0x1F05,	%i2
	call	loop_2854
	sll	%o4,	%l5,	%i6
	set	0x70, %o0
	stxa	%l2,	[%l7 + %o0] 0x0c
loop_2854:
	fbue	%fcc0,	loop_2855
	edge32l	%o7,	%i5,	%o1
	lduw	[%l7 + 0x74],	%i3
	fmovs	%f23,	%f21
loop_2855:
	udivx	%g2,	0x0F35,	%g4
	alignaddr	%o2,	%l0,	%g1
	bgu,a,pt	%xcc,	loop_2856
	fbug	%fcc1,	loop_2857
	fnot1	%f12,	%f28
	lduh	[%l7 + 0x6A],	%g7
loop_2856:
	movl	%icc,	%o5,	%o3
loop_2857:
	tsubcctv	%i7,	0x0AAB,	%i0
	srax	%i4,	0x0F,	%l6
	edge8ln	%i1,	%g6,	%g5
	ldub	[%l7 + 0x7B],	%o0
	alignaddr	%l4,	%g3,	%l1
	fnands	%f5,	%f10,	%f7
	ld	[%l7 + 0x50],	%f8
	orcc	%o6,	%i2,	%l3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x20] %asi,	%o4
	tvc	%icc,	0x2
	movrne	%l5,	%i6,	%l2
	fbuge	%fcc0,	loop_2858
	movneg	%xcc,	%o7,	%o1
	edge32ln	%i5,	%g2,	%i3
	fone	%f6
loop_2858:
	fbne	%fcc2,	loop_2859
	alignaddr	%o2,	%g4,	%g1
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f5
	edge16l	%g7,	%l0,	%o5
loop_2859:
	tl	%xcc,	0x4
	subcc	%i7,	%o3,	%i4
	array32	%i0,	%l6,	%g6
	fpmerge	%f15,	%f7,	%f16
	fmovsg	%xcc,	%f31,	%f27
	fabss	%f12,	%f16
	fmovse	%xcc,	%f30,	%f23
	sllx	%g5,	%i1,	%l4
	movn	%xcc,	%o0,	%g3
	addc	%l1,	%i2,	%l3
	fmovrse	%o4,	%f14,	%f12
	fmovrsgz	%l5,	%f31,	%f24
	ld	[%l7 + 0x34],	%f11
	movrlez	%i6,	0x0D7,	%l2
	fmovrde	%o7,	%f10,	%f8
	fnegd	%f20,	%f6
	sll	%o6,	0x17,	%o1
	edge16	%i5,	%i3,	%o2
	edge16	%g2,	%g4,	%g1
	tcs	%icc,	0x6
	movvs	%icc,	%l0,	%o5
	tne	%icc,	0x6
	edge8	%g7,	%o3,	%i4
	fcmpne16	%f12,	%f22,	%i7
	fbule	%fcc0,	loop_2860
	andcc	%l6,	0x1D77,	%g6
	andncc	%i0,	%i1,	%l4
	fmovsne	%icc,	%f9,	%f24
loop_2860:
	movleu	%xcc,	%g5,	%g3
	edge8l	%l1,	%o0,	%i2
	stw	%o4,	[%l7 + 0x50]
	ta	%icc,	0x5
	movleu	%icc,	%l5,	%i6
	fone	%f10
	or	%l2,	0x023E,	%o7
	udivcc	%l3,	0x19E8,	%o1
	alignaddr	%i5,	%i3,	%o6
	fnands	%f5,	%f7,	%f1
	udivx	%o2,	0x0A39,	%g2
	fxor	%f10,	%f12,	%f4
	fandnot2	%f2,	%f4,	%f0
	sdiv	%g1,	0x123A,	%g4
	tleu	%xcc,	0x2
	movcs	%icc,	%l0,	%g7
	bge,a	%icc,	loop_2861
	brlez,a	%o5,	loop_2862
	movrne	%i4,	%i7,	%o3
	fornot2s	%f25,	%f30,	%f4
loop_2861:
	mova	%xcc,	%l6,	%g6
loop_2862:
	movneg	%xcc,	%i0,	%i1
	andn	%g5,	0x1B35,	%g3
	fbul,a	%fcc2,	loop_2863
	std	%f16,	[%l7 + 0x48]
	fmul8x16au	%f15,	%f29,	%f6
	movn	%icc,	%l1,	%o0
loop_2863:
	movn	%xcc,	%l4,	%i2
	nop
	setx	0xC2B3ED8C2A9A2A8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC2AE10F0C080A6CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f8,	%f24
	sra	%o4,	0x04,	%i6
	nop
	setx	loop_2864,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%l5,	0x11A3,	%o7
	subc	%l3,	%o1,	%l2
	orn	%i3,	%o6,	%i5
loop_2864:
	fornot1	%f6,	%f4,	%f30
	umulcc	%o2,	%g1,	%g4
	std	%f0,	[%l7 + 0x30]
	bcc,pt	%xcc,	loop_2865
	orncc	%l0,	%g2,	%o5
	tl	%icc,	0x1
	sdivcc	%i4,	0x0F35,	%i7
loop_2865:
	movgu	%xcc,	%g7,	%o3
	bl,pt	%xcc,	loop_2866
	array8	%l6,	%i0,	%i1
	sdivcc	%g5,	0x1C3C,	%g6
	andcc	%l1,	0x19A9,	%o0
loop_2866:
	movg	%icc,	%g3,	%i2
	bcc	loop_2867
	st	%f27,	[%l7 + 0x34]
	nop
	setx	loop_2868,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%l4,	0x168A,	%i6
loop_2867:
	nop
	set	0x0F, %l2
	stba	%l5,	[%l7 + %l2] 0x0c
loop_2868:
	bvc	loop_2869
	xnorcc	%o4,	0x10B7,	%l3
	tne	%xcc,	0x5
	fcmple16	%f18,	%f4,	%o7
loop_2869:
	andcc	%o1,	0x0631,	%i3
	movcs	%icc,	%o6,	%l2
	movre	%o2,	%g1,	%i5
	tcs	%icc,	0x5
	edge16ln	%g4,	%g2,	%o5
	edge32n	%l0,	%i7,	%i4
	movl	%xcc,	%g7,	%o3
	movleu	%xcc,	%l6,	%i1
	edge32n	%g5,	%g6,	%i0
	tge	%xcc,	0x2
	brgez,a	%o0,	loop_2870
	membar	0x18
	movgu	%icc,	%g3,	%i2
	orncc	%l4,	%i6,	%l1
loop_2870:
	edge32n	%o4,	%l3,	%o7
	movrgez	%o1,	0x01E,	%i3
	add	%o6,	%l2,	%l5
	pdist	%f22,	%f18,	%f8
	and	%o2,	%g1,	%g4
	movrlez	%g2,	%i5,	%l0
	srax	%i7,	0x19,	%o5
	te	%icc,	0x1
	srlx	%i4,	0x1A,	%o3
	and	%l6,	%i1,	%g7
	edge8ln	%g6,	%g5,	%o0
	ta	%xcc,	0x2
	fmovrslez	%i0,	%f4,	%f24
	fxor	%f24,	%f18,	%f2
	mulx	%g3,	0x117D,	%i2
	ldsb	[%l7 + 0x0D],	%i6
	movn	%xcc,	%l4,	%l1
	brlez	%l3,	loop_2871
	udiv	%o4,	0x1D7F,	%o7
	sdiv	%o1,	0x1132,	%o6
	fbn,a	%fcc2,	loop_2872
loop_2871:
	edge32	%i3,	%l2,	%l5
	tle	%xcc,	0x7
	brgz,a	%g1,	loop_2873
loop_2872:
	te	%icc,	0x5
	mulscc	%o2,	%g4,	%g2
	movgu	%xcc,	%i5,	%l0
loop_2873:
	tvs	%icc,	0x3
	edge16n	%o5,	%i4,	%o3
	fbo	%fcc1,	loop_2874
	tge	%xcc,	0x5
	call	loop_2875
	brgez	%l6,	loop_2876
loop_2874:
	mulx	%i7,	%g7,	%i1
	srlx	%g5,	%g6,	%i0
loop_2875:
	movre	%o0,	0x2B2,	%i2
loop_2876:
	andn	%g3,	%l4,	%i6
	move	%icc,	%l1,	%o4
	brlz,a	%o7,	loop_2877
	brgez	%o1,	loop_2878
	taddcc	%l3,	0x0E70,	%o6
	nop
	setx	loop_2879,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2877:
	movleu	%xcc,	%i3,	%l5
loop_2878:
	edge16n	%g1,	%o2,	%l2
	smulcc	%g2,	0x1830,	%i5
loop_2879:
	array8	%l0,	%g4,	%i4
	fsrc2s	%f19,	%f7
	subc	%o3,	0x0BFB,	%o5
	lduh	[%l7 + 0x4A],	%l6
	bcc,a	loop_2880
	and	%g7,	0x01D7,	%i1
	movpos	%xcc,	%g5,	%i7
	umulcc	%g6,	%o0,	%i2
loop_2880:
	flush	%l7 + 0x38
	srl	%g3,	%i0,	%l4
	mulscc	%i6,	0x15CC,	%l1
	movvc	%xcc,	%o4,	%o1
	alignaddr	%l3,	%o6,	%o7
	fbl,a	%fcc0,	loop_2881
	subc	%l5,	0x0FB7,	%i3
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x15,	 0x1
loop_2881:
	xorcc	%l2,	%g2,	%i5
	fpadd16	%f14,	%f10,	%f2
	xorcc	%o2,	%g4,	%i4
	movrne	%l0,	0x3F2,	%o5
	fbue	%fcc0,	loop_2882
	fbo,a	%fcc2,	loop_2883
	fpmerge	%f24,	%f1,	%f24
	tl	%xcc,	0x3
loop_2882:
	addccc	%l6,	%g7,	%i1
loop_2883:
	edge32ln	%g5,	%o3,	%i7
	fmovdneg	%xcc,	%f15,	%f31
	brgz,a	%g6,	loop_2884
	tgu	%xcc,	0x0
	tcs	%icc,	0x7
	srlx	%i2,	0x19,	%o0
loop_2884:
	tcs	%icc,	0x3
	flush	%l7 + 0x38
	udivcc	%g3,	0x129E,	%i0
	ta	%xcc,	0x5
	nop
	setx	0x0DD4CC58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC991D9B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f17,	%f5
	fba	%fcc2,	loop_2885
	bge,a	%icc,	loop_2886
	nop
	setx	loop_2887,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%xcc,	0x5
loop_2885:
	andcc	%i6,	0x09E9,	%l4
loop_2886:
	and	%o4,	0x1B0A,	%l1
loop_2887:
	fmovsvc	%xcc,	%f12,	%f30
	movge	%icc,	%l3,	%o6
	move	%icc,	%o1,	%l5
	xor	%i3,	0x0CBB,	%g1
	tge	%icc,	0x5
	fones	%f11
	fpsub32	%f26,	%f12,	%f6
	swap	[%l7 + 0x7C],	%l2
	nop
	set	0x10, %o4
	stx	%o7,	[%l7 + %o4]
	edge32l	%g2,	%i5,	%o2
	fbe	%fcc1,	loop_2888
	fbul,a	%fcc3,	loop_2889
	taddcc	%i4,	0x17FF,	%l0
	mulscc	%o5,	%g4,	%g7
loop_2888:
	sub	%l6,	%i1,	%g5
loop_2889:
	sir	0x150C
	add	%l7,	0x54,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%i7
	or	%i2,	0x0F7D,	%o0
	tneg	%xcc,	0x3
	and	%g6,	%i0,	%i6
	tg	%xcc,	0x7
	array8	%l4,	%o4,	%l1
	fpsub16s	%f17,	%f20,	%f2
	bcc,pn	%icc,	loop_2890
	fbn	%fcc2,	loop_2891
	brnz,a	%g3,	loop_2892
	srax	%l3,	%o1,	%l5
loop_2890:
	movne	%icc,	%o6,	%i3
loop_2891:
	movvc	%icc,	%g1,	%l2
loop_2892:
	nop
	set	0x58, %l1
	stwa	%g2,	[%l7 + %l1] 0x23
	membar	#Sync
	bgu,pt	%xcc,	loop_2893
	edge16n	%i5,	%o2,	%i4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l0,	%o5
loop_2893:
	ld	[%l7 + 0x0C],	%f17
	movneg	%icc,	%o7,	%g4
	fmovrde	%l6,	%f20,	%f20
	fpadd16	%f10,	%f28,	%f8
	sub	%i1,	0x02C7,	%g7
	swap	[%l7 + 0x54],	%o3
	fpack32	%f12,	%f26,	%f18
	set	0x0, %i5
	stxa	%i7,	[%g0 + %i5] 0x5f
	movrlez	%g5,	0x25E,	%o0
	fbg,a	%fcc1,	loop_2894
	fbg	%fcc3,	loop_2895
	nop
	setx	0xFC6E98946DC89EC4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f6
	tle	%xcc,	0x7
loop_2894:
	fandnot2	%f14,	%f30,	%f28
loop_2895:
	move	%icc,	%i2,	%g6
	movcc	%icc,	%i0,	%l4
	tsubcc	%i6,	%o4,	%l1
	movvc	%xcc,	%g3,	%l3
	subccc	%l5,	0x14C3,	%o6
	nop
	set	0x68, %o1
	ldub	[%l7 + %o1],	%i3
	tl	%xcc,	0x5
	sdiv	%g1,	0x0C8F,	%l2
	fnands	%f17,	%f27,	%f17
	udivcc	%g2,	0x05C1,	%i5
	edge8	%o2,	%i4,	%l0
	xor	%o5,	0x18B6,	%o1
	edge32	%g4,	%o7,	%i1
	bcs,a,pt	%icc,	loop_2896
	sdiv	%g7,	0x06FB,	%l6
	fmovrdlez	%i7,	%f30,	%f26
	fpsub32s	%f31,	%f4,	%f23
loop_2896:
	sll	%o3,	%g5,	%o0
	subccc	%g6,	0x1F36,	%i0
	set	0x44, %o6
	sta	%f6,	[%l7 + %o6] 0x10
	pdist	%f22,	%f2,	%f12
	flush	%l7 + 0x10
	movcs	%xcc,	%i2,	%i6
	nop
	setx	0xF04A845D,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	faligndata	%f6,	%f22,	%f14
	be	%xcc,	loop_2897
	fcmple32	%f28,	%f0,	%l4
	fmovrdlz	%l1,	%f8,	%f12
	brnz,a	%g3,	loop_2898
loop_2897:
	fcmpeq32	%f14,	%f0,	%l3
	movn	%xcc,	%o4,	%o6
	movgu	%xcc,	%l5,	%g1
loop_2898:
	fnot2	%f2,	%f14
	nop
	setx	0x9050F966,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	sub	%l2,	0x12D1,	%g2
	ldsh	[%l7 + 0x10],	%i3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbule	%fcc3,	loop_2899
	nop
	set	0x70, %l0
	ldsb	[%l7 + %l0],	%o2
	sll	%i4,	%l0,	%o5
	edge16l	%i5,	%o1,	%o7
loop_2899:
	sdiv	%i1,	0x151E,	%g4
	edge8ln	%g7,	%l6,	%i7
	ble,a,pt	%icc,	loop_2900
	smulcc	%g5,	%o0,	%o3
	fnegd	%f12,	%f24
	edge16ln	%i0,	%i2,	%i6
loop_2900:
	edge32l	%g6,	%l4,	%l1
	fmovdcc	%xcc,	%f0,	%f26
	wr	%g0,	0x2b,	%asi
	stba	%l3,	[%l7 + 0x2F] %asi
	membar	#Sync
	movneg	%xcc,	%g3,	%o6
	movrgz	%l5,	0x32C,	%g1
	tvc	%icc,	0x1
	membar	0x53
	tg	%xcc,	0x3
	orcc	%l2,	%o4,	%i3
	addc	%o2,	0x0D2B,	%i4
	andncc	%l0,	%o5,	%g2
	bgu,a,pn	%xcc,	loop_2901
	udivcc	%o1,	0x017B,	%i5
	nop
	setx	0xA4D705F99F34954C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xEFC9EEFAD1EE1416,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f14,	%f30
	umul	%o7,	0x02B5,	%i1
loop_2901:
	fnot1	%f22,	%f18
	tsubcctv	%g4,	0x0413,	%g7
	tg	%icc,	0x0
	fbug,a	%fcc0,	loop_2902
	andn	%i7,	0x0DBD,	%l6
	tn	%icc,	0x3
	subccc	%g5,	%o0,	%o3
loop_2902:
	ta	%icc,	0x0
	sll	%i0,	%i2,	%i6
	umul	%l4,	%l1,	%l3
	tvc	%xcc,	0x2
	andn	%g6,	0x1E3D,	%o6
	sethi	0x060E,	%g3
	mulscc	%g1,	%l2,	%l5
	add	%i3,	%o2,	%o4
	umul	%i4,	%l0,	%o5
	nop
	fitos	%f11,	%f29
	fstox	%f29,	%f2
	fxtos	%f2,	%f30
	alignaddr	%o1,	%i5,	%o7
	orncc	%g2,	0x0302,	%g4
	movl	%icc,	%i1,	%i7
	subccc	%g7,	0x1C60,	%l6
	movgu	%xcc,	%g5,	%o0
	movn	%xcc,	%i0,	%i2
	fmovdneg	%xcc,	%f0,	%f11
	sub	%o3,	0x1323,	%l4
	edge32ln	%i6,	%l3,	%g6
	movcc	%xcc,	%o6,	%g3
	sdivcc	%g1,	0x0B37,	%l2
	ble,a	%xcc,	loop_2903
	te	%icc,	0x7
	smul	%l1,	0x1D66,	%l5
	nop
	setx	0xD1665190,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xF207294D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f19,	%f22
loop_2903:
	edge32ln	%o2,	%i3,	%i4
	movneg	%icc,	%l0,	%o4
	edge32n	%o5,	%o1,	%o7
	bvc,a,pn	%xcc,	loop_2904
	array32	%i5,	%g2,	%g4
	xnorcc	%i1,	0x18A4,	%i7
	ta	%xcc,	0x5
loop_2904:
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f16
	orn	%g7,	%g5,	%o0
	movn	%xcc,	%i0,	%l6
	fbg	%fcc1,	loop_2905
	sdivx	%i2,	0x0795,	%o3
	set	0x09, %i6
	ldsba	[%l7 + %i6] 0x11,	%i6
loop_2905:
	tvs	%xcc,	0x0
	fbge	%fcc0,	loop_2906
	udivx	%l4,	0x18CA,	%l3
	movrgz	%g6,	0x39D,	%o6
	fcmpeq16	%f22,	%f26,	%g1
loop_2906:
	fnegd	%f28,	%f26
	array32	%l2,	%g3,	%l1
	fbn	%fcc0,	loop_2907
	movle	%xcc,	%o2,	%i3
	prefetch	[%l7 + 0x4C],	 0x2
	lduw	[%l7 + 0x0C],	%l5
loop_2907:
	fmovda	%xcc,	%f23,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i4,	%o4,	%l0
	fmuld8ulx16	%f7,	%f8,	%f14
	orn	%o5,	0x17D9,	%o1
	alignaddrl	%o7,	%g2,	%i5
	fbule	%fcc1,	loop_2908
	mova	%icc,	%i1,	%g4
	fbul	%fcc1,	loop_2909
	st	%f1,	[%l7 + 0x5C]
loop_2908:
	sdivcc	%g7,	0x1719,	%i7
	fmovsg	%icc,	%f2,	%f16
loop_2909:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%o0,	[%l7 + 0x30] %asi
	for	%f14,	%f12,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i0,	%l6,	%i2
	fmovdvc	%xcc,	%f2,	%f14
	fmovdcc	%xcc,	%f14,	%f5
	tne	%xcc,	0x2
	movvc	%icc,	%g5,	%o3
	tvc	%xcc,	0x3
	xnor	%i6,	0x15D7,	%l3
	sllx	%g6,	%o6,	%g1
	or	%l2,	0x06DB,	%g3
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x14,	%l4
	mulscc	%l1,	%o2,	%i3
	sdivcc	%i4,	0x1023,	%l5
	fbg,a	%fcc3,	loop_2910
	tneg	%icc,	0x5
	subccc	%o4,	%l0,	%o5
	fbu	%fcc0,	loop_2911
loop_2910:
	movre	%o1,	%g2,	%o7
	fbue	%fcc2,	loop_2912
	te	%icc,	0x2
loop_2911:
	tcs	%xcc,	0x6
	set	0x54, %i4
	swapa	[%l7 + %i4] 0x11,	%i5
loop_2912:
	fbo	%fcc3,	loop_2913
	umul	%g4,	0x0968,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i1,	%i7,	%o0
loop_2913:
	fmovde	%xcc,	%f3,	%f10
	fpadd32s	%f24,	%f16,	%f4
	subcc	%l6,	%i2,	%g5
	sethi	0x1325,	%o3
	orncc	%i0,	0x1DAF,	%l3
	fbule,a	%fcc3,	loop_2914
	xor	%g6,	%i6,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o6,	0x1BE4,	%g3
loop_2914:
	fmovrdne	%l4,	%f4,	%f22
	tsubcc	%l1,	0x03FB,	%l2
	fpadd16s	%f22,	%f20,	%f29
	ta	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i3,	%o2,	%l5
	udivcc	%o4,	0x0DB2,	%l0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i4
	ldd	[%l7 + 0x30],	%f20
	movcc	%icc,	%o1,	%g2
	fmovrsgz	%o5,	%f23,	%f20
	sllx	%i5,	%g4,	%g7
	tvc	%xcc,	0x2
	addcc	%o7,	%i7,	%o0
	call	loop_2915
	tvs	%icc,	0x2
	nop
	setx loop_2916, %l0, %l1
	jmpl %l1, %i1
	movgu	%icc,	%i2,	%l6
loop_2915:
	tgu	%icc,	0x7
	movle	%xcc,	%o3,	%i0
loop_2916:
	sra	%g5,	%g6,	%l3
	membar	0x0D
	swap	[%l7 + 0x40],	%i6
	orcc	%g1,	%g3,	%l4
	movgu	%xcc,	%o6,	%l2
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x54] %asi,	%l1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	wr	%g0,	0x10,	%asi
	stha	%i3,	[%l7 + 0x6E] %asi
	fmovrsne	%l5,	%f13,	%f15
	mulscc	%o4,	%l0,	%i4
	array32	%g2,	%o5,	%o1
	stw	%i5,	[%l7 + 0x38]
	tn	%xcc,	0x6
	array32	%g4,	%o7,	%i7
	tg	%xcc,	0x5
	andcc	%o0,	%i1,	%g7
	nop
	setx	0xB25FC3E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x66EE6CDE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f18,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x78, %g4
	swapa	[%l7 + %g4] 0x19,	%i2
	orncc	%o3,	%i0,	%l6
	fmovdle	%icc,	%f0,	%f5
	array32	%g5,	%g6,	%l3
	fmovsvs	%icc,	%f30,	%f20
	alignaddrl	%g1,	%i6,	%l4
	nop
	fitos	%f11,	%f12
	fstoi	%f12,	%f21
	fcmpne32	%f16,	%f26,	%o6
	bshuffle	%f12,	%f8,	%f20
	call	loop_2917
	tsubcctv	%g3,	%l1,	%l2
	fmovscc	%xcc,	%f7,	%f24
	movrne	%i3,	0x250,	%l5
loop_2917:
	movneg	%xcc,	%o4,	%l0
	fbul	%fcc0,	loop_2918
	fmovde	%xcc,	%f27,	%f6
	fcmpne32	%f22,	%f30,	%i4
	fmovrsne	%o2,	%f23,	%f30
loop_2918:
	fmul8x16al	%f28,	%f14,	%f4
	fmovsleu	%icc,	%f1,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%o5,	%f20,	%f2
	move	%xcc,	%g2,	%o1
	tcs	%icc,	0x5
	array32	%i5,	%o7,	%i7
	movcc	%icc,	%g4,	%o0
	set	0x2F, %o2
	lduba	[%l7 + %o2] 0x11,	%i1
	movrlez	%i2,	%o3,	%i0
	xnor	%g7,	0x1218,	%g5
	fbn,a	%fcc2,	loop_2919
	fcmpne16	%f20,	%f30,	%g6
	tge	%icc,	0x7
	sllx	%l6,	%g1,	%l3
loop_2919:
	fxors	%f20,	%f27,	%f18
	sdivx	%l4,	0x1CEB,	%i6
	or	%o6,	0x1ECE,	%g3
	alignaddrl	%l1,	%i3,	%l2
	edge32n	%l5,	%l0,	%i4
	edge16ln	%o4,	%o5,	%g2
	set	0x6B, %g6
	stba	%o2,	[%l7 + %g6] 0xe3
	membar	#Sync
	movneg	%xcc,	%i5,	%o7
	ldd	[%l7 + 0x68],	%o0
	sir	0x1BEC
	fmovrdgz	%g4,	%f14,	%f14
	stbar
	movgu	%icc,	%o0,	%i7
	bl,pt	%xcc,	loop_2920
	ldd	[%l7 + 0x18],	%i0
	udiv	%o3,	0x1E74,	%i0
	fmovse	%xcc,	%f14,	%f24
loop_2920:
	ldsh	[%l7 + 0x3E],	%g7
	movrlz	%i2,	%g6,	%l6
	pdist	%f26,	%f14,	%f16
	fxnor	%f14,	%f16,	%f26
	and	%g1,	%l3,	%g5
	orncc	%l4,	0x1AD0,	%o6
	fmovrdgz	%i6,	%f18,	%f22
	fpadd16s	%f27,	%f6,	%f25
	movvc	%icc,	%g3,	%i3
	xnor	%l2,	%l1,	%l0
	flush	%l7 + 0x58
	sdivcc	%l5,	0x1A08,	%o4
	movl	%icc,	%i4,	%g2
	sub	%o2,	0x07C0,	%o5
	sethi	0x035B,	%i5
	bpos,a	%icc,	loop_2921
	or	%o1,	0x0D14,	%g4
	stbar
	movpos	%icc,	%o0,	%i7
loop_2921:
	tle	%icc,	0x1
	movrlz	%i1,	0x376,	%o3
	tgu	%xcc,	0x3
	bvc,a	loop_2922
	udivx	%o7,	0x0822,	%g7
	xnorcc	%i0,	%g6,	%i2
	andncc	%g1,	%l3,	%l6
loop_2922:
	sdiv	%g5,	0x0275,	%l4
	fnot2	%f2,	%f12
	xorcc	%o6,	%g3,	%i6
	movg	%xcc,	%i3,	%l2
	edge8	%l1,	%l0,	%l5
	movl	%xcc,	%o4,	%g2
	movpos	%xcc,	%i4,	%o5
	ldd	[%l7 + 0x68],	%o2
	movg	%xcc,	%o1,	%i5
	edge8l	%o0,	%i7,	%g4
	movpos	%icc,	%o3,	%o7
	movge	%xcc,	%i1,	%i0
	st	%f16,	[%l7 + 0x74]
	nop
	set	0x10, %i1
	ldstub	[%l7 + %i1],	%g7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2803
!	Type x   	: 1238
!	Type cti   	: 2922
!	Type f   	: 4512
!	Type i   	: 13525
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xA141AADA
.word 0xA84CA3B6
.word 0x05E7767F
.word 0x3F06FEC1
.word 0xDF375DC7
.word 0xA06C8901
.word 0xFEDAB5B2
.word 0xB7B2AAD4
.word 0x3526C047
.word 0x66C2874E
.word 0xAA63E7BF
.word 0xC413844A
.word 0x28F1DAF1
.word 0x2CC27B48
.word 0x4673591C
.word 0xE712D8A9
.word 0x8663491A
.word 0x3AFB1E7E
.word 0x46754F3C
.word 0xB2F26725
.word 0x22FE9ACC
.word 0xB2D40E1D
.word 0x62126FF2
.word 0xB6532197
.word 0x87677138
.word 0x7AE7A972
.word 0xF4A1B8D7
.word 0x5049E476
.word 0x08F62CE8
.word 0x76C4D068
.word 0x18BA1721
.word 0xC14E3F07
.word 0xED840E9C
.word 0x05A57447
.word 0x829620F5
.word 0x40B549CB
.word 0x03A3AE04
.word 0xC3A5CB33
.word 0xC930D6EF
.word 0x24E97360
.word 0xAD19B3EB
.word 0x922C77E0
.word 0x89A43CDD
.word 0x1A227062
.word 0xEC7C0202
.word 0x4B2BB8DC
.word 0xEC49E70A
.word 0xD1F4A913
.word 0x52E3A07B
.word 0x3308D496
.word 0x7FCD0AEA
.word 0xAFF0DDF7
.word 0x2540C1C2
.word 0x242A8816
.word 0xE63F4BAD
.word 0x6FBDC8CE
.word 0x2B696039
.word 0x9F79C9CA
.word 0x5AED4854
.word 0x1806714B
.word 0x0148F026
.word 0xE5183B4C
.word 0xE87C26BE
.word 0x50553148
.end
