/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f1.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f1.s,v 1.2 2007/07/05 22:00:40 drp Exp $"
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
	setx	0xB2B6479F604DDEDE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x1,	%g2
	set	0x3,	%g3
	set	0x2,	%g4
	set	0xA,	%g5
	set	0x4,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xE,	%i1
	set	-0x3,	%i2
	set	-0x5,	%i3
	set	-0xA,	%i4
	set	-0xF,	%i5
	set	-0x9,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x4BABBE8C,	%l0
	set	0x4A92BC9C,	%l1
	set	0x488C926D,	%l2
	set	0x431A476B,	%l3
	set	0x6D4A8CBB,	%l4
	set	0x3DAA222B,	%l5
	set	0x55FC7D89,	%l6
	!# Output registers
	set	-0x1312,	%o0
	set	0x168E,	%o1
	set	0x1191,	%o2
	set	-0x1264,	%o3
	set	-0x1C74,	%o4
	set	-0x042C,	%o5
	set	-0x0A4F,	%o6
	set	0x0C06,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x47905038144509C0)
	INIT_TH_FP_REG(%l7,%f2,0xB7C25133E7459BE0)
	INIT_TH_FP_REG(%l7,%f4,0x62724604253F223F)
	INIT_TH_FP_REG(%l7,%f6,0xBEF075B7173BD790)
	INIT_TH_FP_REG(%l7,%f8,0xBAFED7CEFA6BB0DD)
	INIT_TH_FP_REG(%l7,%f10,0x93334A3D9D54CE53)
	INIT_TH_FP_REG(%l7,%f12,0xFA7338FB024719EF)
	INIT_TH_FP_REG(%l7,%f14,0x40CADBEBB445A19F)
	INIT_TH_FP_REG(%l7,%f16,0x333173CBD6281F86)
	INIT_TH_FP_REG(%l7,%f18,0x03AAD2137185023D)
	INIT_TH_FP_REG(%l7,%f20,0x001B6D00F600377E)
	INIT_TH_FP_REG(%l7,%f22,0x977EC4B6A3BCDC21)
	INIT_TH_FP_REG(%l7,%f24,0x347749F61D76A9DA)
	INIT_TH_FP_REG(%l7,%f26,0xE1FF5F08D8978273)
	INIT_TH_FP_REG(%l7,%f28,0xE8DA3913B6913401)
	INIT_TH_FP_REG(%l7,%f30,0x9125B0A59FB6A37A)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F5, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	xnorcc	%o4,	%o2,	%l4
	fone	%f26
	umulcc	%g4,	%o6,	%i6
	orncc	%l3,	0x14A7,	%g2
	addc	%l1,	0x18C9,	%o3
	ldd	[%l7 + 0x20],	%i4
	ldsb	[%l7 + 0x20],	%o0
	nop
	setx	loop_1,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%icc,	0x1
	orn	%o1,	0x12DE,	%i2
	fnot2s	%f22,	%f26
loop_1:
	ld	[%l7 + 0x64],	%f25
	ble,a	%icc,	loop_2
	edge16l	%i7,	%g1,	%g3
	fbue,a	%fcc0,	loop_3
	tl	%xcc,	0x5
loop_2:
	xnor	%g6,	%l6,	%i3
	bcs,a	%xcc,	loop_4
loop_3:
	andcc	%i0,	0x1085,	%g7
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4:
	andn	%o5,	0x03AE,	%i1
	edge8n	%o7,	%l0,	%i5
	fpackfix	%f20,	%f5
	edge16ln	%g5,	%l2,	%l5
	tsubcc	%o2,	%o4,	%l4
	swap	[%l7 + 0x14],	%g4
	alignaddrl	%o6,	%l3,	%i6
	stbar
	edge8n	%l1,	%o3,	%g2
	fmovdn	%icc,	%f27,	%f20
	ta	%icc,	0x1
	tvc	%icc,	0x2
	be,a	%icc,	loop_5
	fblg,a	%fcc0,	loop_6
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f18
	fxtod	%f18,	%f12
	tn	%icc,	0x5
loop_5:
	flush	%l7 + 0x74
loop_6:
	movrlez	%o0,	%o1,	%i2
	bcc,a,pt	%xcc,	loop_7
	nop
	setx	0xC23CB33B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f19
	xorcc	%i4,	%g1,	%g3
	bvc	%xcc,	loop_8
loop_7:
	fmovrslz	%i7,	%f20,	%f29
	nop
	fitos	%f4,	%f16
	fmovsg	%xcc,	%f5,	%f11
loop_8:
	bl,a,pt	%icc,	loop_9
	fbl,a	%fcc2,	loop_10
	xor	%g6,	0x02A4,	%l6
	fmovsleu	%xcc,	%f3,	%f16
loop_9:
	bne,pt	%icc,	loop_11
loop_10:
	fbule,a	%fcc1,	loop_12
	nop
	fitos	%f14,	%f5
	fstod	%f5,	%f4
	fandnot1s	%f7,	%f26,	%f9
loop_11:
	mulscc	%i0,	%g7,	%i3
loop_12:
	fmovdcs	%icc,	%f24,	%f27
	fbue	%fcc2,	loop_13
	fmovrslz	%o5,	%f29,	%f2
	nop
	fitod	%f6,	%f20
	fdtos	%f20,	%f19
	ld	[%l7 + 0x40],	%f30
loop_13:
	fandnot1	%f4,	%f10,	%f8
	movneg	%xcc,	%o7,	%l0
	sir	0x11FA
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%g5
	fbg,a	%fcc0,	loop_14
	tcc	%icc,	0x2
	tg	%icc,	0x1
	popc	%l2,	%l5
loop_14:
	udivx	%i1,	0x0177,	%o4
	srlx	%l4,	%o2,	%o6
	orcc	%g4,	0x19F2,	%l3
	sllx	%l1,	%i6,	%o3
	fpack32	%f22,	%f8,	%f28
	udivx	%g2,	0x1900,	%o0
	fmovrse	%i2,	%f29,	%f21
	set	0x13, %i2
	ldstuba	[%l7 + %i2] 0x18,	%i4
	tneg	%icc,	0x7
	nop
	setx loop_15, %l0, %l1
	jmpl %l1, %o1
	brnz,a	%g1,	loop_16
	fnot1s	%f31,	%f4
	movn	%xcc,	%i7,	%g6
loop_15:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x64] %asi,	%g3
loop_16:
	nop
	set	0x40, %o6
	lduwa	[%l7 + %o6] 0x81,	%i0
	bn,pt	%xcc,	loop_17
	fbue,a	%fcc1,	loop_18
	array32	%l6,	%g7,	%i3
	movneg	%icc,	%o7,	%o5
loop_17:
	nop
	set	0x68, %g7
	lduwa	[%l7 + %g7] 0x18,	%i5
loop_18:
	fsrc2	%f12,	%f18
	ba,a	%icc,	loop_19
	call	loop_20
	fmovsle	%icc,	%f30,	%f25
	set	0x5E, %i4
	stha	%l0,	[%l7 + %i4] 0x89
loop_19:
	prefetch	[%l7 + 0x18],	 0x2
loop_20:
	edge16l	%l2,	%g5,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o4,	%l5
	fnands	%f16,	%f10,	%f5
	fmuld8sux16	%f24,	%f29,	%f14
	fmovrdgz	%o2,	%f4,	%f18
	tsubcc	%o6,	%l4,	%l3
	movrlez	%l1,	%i6,	%o3
	tle	%xcc,	0x5
	membar	0x71
	edge8n	%g2,	%o0,	%i2
	brgez	%g4,	loop_21
	movge	%xcc,	%o1,	%i4
	edge16n	%g1,	%g6,	%i7
	mova	%xcc,	%g3,	%l6
loop_21:
	edge8	%i0,	%g7,	%i3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x24] %asi,	%o5
	fnot1	%f4,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i5,	%l0,	%l2
	taddcctv	%g5,	0x0CCD,	%o7
	mulx	%i1,	0x093D,	%o4
	fexpand	%f23,	%f14
	movrgez	%l5,	0x1FA,	%o6
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o2
	ldstub	[%l7 + 0x11],	%l4
	movcc	%icc,	%l3,	%l1
	movleu	%xcc,	%i6,	%g2
	edge8	%o0,	%i2,	%g4
	array8	%o1,	%i4,	%o3
	fandnot2	%f0,	%f20,	%f28
	movcs	%xcc,	%g6,	%i7
	edge8n	%g1,	%g3,	%i0
	ta	%xcc,	0x6
	fandnot2	%f12,	%f2,	%f4
	edge32l	%l6,	%g7,	%i3
	brgez,a	%i5,	loop_22
	ldsb	[%l7 + 0x2A],	%l0
	add	%o5,	%l2,	%g5
	edge8	%o7,	%i1,	%l5
loop_22:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o6,	%o4
	mulscc	%l4,	%o2,	%l3
	tle	%xcc,	0x6
	alignaddr	%l1,	%g2,	%i6
	brlz,a	%o0,	loop_23
	taddcc	%i2,	%g4,	%o1
	fbuge,a	%fcc0,	loop_24
	tl	%icc,	0x6
loop_23:
	bl	loop_25
	tpos	%icc,	0x5
loop_24:
	tge	%icc,	0x7
	tleu	%xcc,	0x3
loop_25:
	edge8ln	%i4,	%g6,	%o3
	orncc	%i7,	0x1E50,	%g1
	sdivx	%g3,	0x1FDB,	%i0
	edge16	%g7,	%i3,	%i5
	smul	%l6,	0x1C24,	%l0
	bneg,a	loop_26
	sdivx	%o5,	0x092A,	%g5
	nop
	setx	loop_27,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o7,	0x20F,	%i1
loop_26:
	tne	%xcc,	0x0
	orcc	%l5,	0x0F02,	%l2
loop_27:
	fmovsl	%xcc,	%f19,	%f9
	movne	%xcc,	%o4,	%l4
	tpos	%icc,	0x3
	fmul8x16al	%f11,	%f16,	%f24
	movneg	%xcc,	%o2,	%o6
	udiv	%l3,	0x19E4,	%g2
	sth	%i6,	[%l7 + 0x2E]
	and	%o0,	%l1,	%i2
	fmovdcs	%icc,	%f31,	%f7
	subc	%o1,	%g4,	%g6
	array32	%i4,	%o3,	%g1
	edge8ln	%i7,	%g3,	%i0
	edge16l	%g7,	%i5,	%i3
	fbl	%fcc1,	loop_28
	fexpand	%f11,	%f16
	movg	%icc,	%l0,	%l6
	tpos	%icc,	0x0
loop_28:
	array32	%g5,	%o7,	%i1
	nop
	setx	0x94198D3CE0656B27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	array16	%o5,	%l5,	%o4
	popc	%l2,	%l4
	edge32	%o6,	%l3,	%o2
	movrlz	%g2,	0x1BB,	%i6
	fbul	%fcc0,	loop_29
	tge	%icc,	0x4
	tvs	%xcc,	0x7
	tne	%icc,	0x0
loop_29:
	bvc,a	%xcc,	loop_30
	edge32n	%o0,	%i2,	%o1
	movgu	%icc,	%l1,	%g4
	bn	%xcc,	loop_31
loop_30:
	fmul8ulx16	%f20,	%f4,	%f18
	ba	loop_32
	movge	%icc,	%i4,	%g6
loop_31:
	popc	%o3,	%g1
	smulcc	%g3,	%i0,	%g7
loop_32:
	membar	0x4D
	nop
	setx	0xD93A3BF1C0594328,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA91CDBC9CBF3F4EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f30,	%f22
	fpsub32	%f28,	%f2,	%f30
	nop
	setx	0x33A1A860,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x12EBB98F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f17,	%f25
	stw	%i7,	[%l7 + 0x4C]
	mulscc	%i3,	%i5,	%l6
	udivx	%g5,	0x11C0,	%o7
	edge8l	%i1,	%o5,	%l0
	tle	%xcc,	0x7
	movrne	%l5,	0x291,	%o4
	ta	%xcc,	0x2
	fmovsleu	%xcc,	%f5,	%f24
	andncc	%l2,	%o6,	%l4
	fcmpne32	%f2,	%f2,	%o2
	edge32ln	%g2,	%i6,	%o0
	movn	%xcc,	%l3,	%i2
	fcmpgt16	%f20,	%f22,	%o1
	fmovs	%f1,	%f3
	bn,pt	%icc,	loop_33
	orcc	%l1,	0x0CDA,	%i4
	movrlz	%g4,	%o3,	%g1
	edge32l	%g3,	%i0,	%g7
loop_33:
	srax	%i7,	%g6,	%i5
	movleu	%xcc,	%l6,	%g5
	tg	%xcc,	0x6
	movrlez	%o7,	0x308,	%i1
	edge8n	%i3,	%l0,	%l5
	fmovsvc	%xcc,	%f22,	%f8
	sethi	0x14AF,	%o5
	movgu	%xcc,	%l2,	%o4
	be	loop_34
	edge8ln	%l4,	%o2,	%o6
	and	%g2,	0x185D,	%i6
	sdivx	%l3,	0x1CD2,	%i2
loop_34:
	xorcc	%o0,	%o1,	%l1
	edge32ln	%g4,	%i4,	%g1
	tl	%xcc,	0x4
	fandnot2	%f14,	%f22,	%f22
	brgez	%g3,	loop_35
	mulx	%o3,	%i0,	%i7
	tg	%icc,	0x7
	st	%f24,	[%l7 + 0x70]
loop_35:
	tg	%xcc,	0x4
	wr	%g0,	0x2b,	%asi
	stxa	%g7,	[%l7 + 0x68] %asi
	membar	#Sync
	tpos	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%g6,	%i5
	smulcc	%l6,	%o7,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i1,	0x0C,	%i3
	ldx	[%l7 + 0x20],	%l0
	bpos	loop_36
	fbge,a	%fcc2,	loop_37
	fbu,a	%fcc3,	loop_38
	ldub	[%l7 + 0x6A],	%l5
loop_36:
	nop
	setx	0xB03F71E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x1D239E41,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f27,	%f15
loop_37:
	popc	%o5,	%o4
loop_38:
	fmuld8sux16	%f16,	%f6,	%f20
	tcc	%xcc,	0x7
	ldsw	[%l7 + 0x38],	%l4
	and	%l2,	0x08EC,	%o2
	edge8	%g2,	%i6,	%o6
	sethi	0x0761,	%l3
	xnorcc	%i2,	%o1,	%o0
	movleu	%xcc,	%g4,	%l1
	xorcc	%i4,	%g3,	%g1
	mulscc	%o3,	%i7,	%g7
	orncc	%i0,	%g6,	%l6
	stb	%i5,	[%l7 + 0x32]
	movg	%icc,	%o7,	%g5
	fmovscs	%icc,	%f18,	%f11
	bpos,a,pt	%xcc,	loop_39
	sllx	%i1,	%i3,	%l0
	tleu	%icc,	0x0
	tg	%xcc,	0x4
loop_39:
	udivx	%o5,	0x0975,	%o4
	ldsw	[%l7 + 0x60],	%l4
	srl	%l5,	0x0D,	%l2
	edge8	%g2,	%o2,	%o6
	fsrc2	%f2,	%f30
	set	0x6E, %l4
	ldsha	[%l7 + %l4] 0x11,	%l3
	movrgz	%i2,	%o1,	%i6
	movpos	%icc,	%g4,	%l1
	membar	0x68
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i4,	%o0,	%g3
	for	%f24,	%f18,	%f18
	array16	%o3,	%g1,	%i7
	nop
	setx	0xE8F69DAF5E6C6A0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xED2E65D96FCFACB1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f8
	sub	%g7,	0x034D,	%i0
	add	%g6,	%l6,	%i5
	movvs	%icc,	%g5,	%o7
	alignaddr	%i3,	%l0,	%i1
	tsubcc	%o4,	0x1F36,	%o5
	wr	%g0,	0x27,	%asi
	stwa	%l5,	[%l7 + 0x50] %asi
	membar	#Sync
	movrlz	%l4,	0x103,	%g2
	fone	%f26
	set	0x70, %o1
	stxa	%l2,	[%l7 + %o1] 0x80
	sdiv	%o2,	0x191D,	%l3
	add	%i2,	%o1,	%o6
	tpos	%icc,	0x5
	udivx	%i6,	0x1DBA,	%l1
	mova	%icc,	%g4,	%i4
	fands	%f30,	%f5,	%f26
	sth	%o0,	[%l7 + 0x6A]
	fbu,a	%fcc0,	loop_40
	and	%o3,	0x052F,	%g1
	smulcc	%g3,	%i7,	%g7
	fpadd16s	%f28,	%f19,	%f7
loop_40:
	fbne	%fcc1,	loop_41
	sll	%g6,	%i0,	%l6
	orcc	%i5,	0x1B21,	%o7
	xnorcc	%g5,	0x1596,	%i3
loop_41:
	bleu,pn	%icc,	loop_42
	tcc	%icc,	0x6
	alignaddr	%i1,	%l0,	%o5
	subccc	%o4,	0x1FD8,	%l5
loop_42:
	andcc	%l4,	%g2,	%l2
	add	%l3,	0x17DF,	%o2
	tneg	%xcc,	0x5
	fpsub16s	%f14,	%f6,	%f27
	fmovsg	%icc,	%f29,	%f24
	fmovdvc	%xcc,	%f25,	%f15
	addc	%i2,	0x15B7,	%o1
	set	0x28, %l2
	lda	[%l7 + %l2] 0x88,	%f31
	sir	0x14BF
	tvc	%icc,	0x1
	orncc	%i6,	0x1DF5,	%o6
	brz	%l1,	loop_43
	fsrc1	%f2,	%f30
	movcs	%xcc,	%g4,	%i4
	nop
	setx	0x6B8B0328,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xEB9E7C7A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f6,	%f29
loop_43:
	edge16	%o3,	%o0,	%g1
	fandnot1s	%f7,	%f13,	%f16
	movrgz	%i7,	0x06B,	%g7
	movn	%xcc,	%g3,	%i0
	edge32l	%l6,	%g6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xF33E4965AFC2C37B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC31FFDA003842149,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f14,	%f6
	edge16l	%o7,	%i3,	%i1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x74] %asi,	%f5
	ldx	[%l7 + 0x30],	%o5
	edge32l	%o4,	%l5,	%l4
	or	%g2,	%l3,	%l2
	fmul8x16	%f13,	%f30,	%f20
	fcmpgt32	%f14,	%f12,	%i2
	ta	%icc,	0x2
	edge32ln	%o1,	%i6,	%o2
	fbuge,a	%fcc3,	loop_44
	lduw	[%l7 + 0x48],	%o6
	nop
	fitos	%f8,	%f17
	fstod	%f17,	%f4
	fxnor	%f14,	%f14,	%f22
loop_44:
	fmul8x16al	%f1,	%f8,	%f20
	tcc	%icc,	0x3
	fmovrsgz	%g4,	%f29,	%f6
	ldsw	[%l7 + 0x14],	%l1
	sdivcc	%i4,	0x1427,	%o0
	fsrc2	%f8,	%f26
	orn	%g1,	0x0878,	%o3
	add	%i7,	%g7,	%i0
	subcc	%l6,	%g6,	%i5
	movpos	%icc,	%g3,	%o7
	movrne	%i1,	0x36D,	%g5
	fnor	%f28,	%f0,	%f0
	mova	%xcc,	%l0,	%i3
	orn	%o4,	%o5,	%l5
	lduh	[%l7 + 0x10],	%l4
	tne	%icc,	0x4
	ldub	[%l7 + 0x76],	%g2
	stbar
	tge	%icc,	0x3
	mova	%xcc,	%l3,	%l2
	move	%xcc,	%i2,	%o1
	nop
	set	0x10, %l0
	stx	%i6,	[%l7 + %l0]
	edge32l	%o2,	%g4,	%l1
	fmovdl	%icc,	%f27,	%f5
	bl,a	%xcc,	loop_45
	srax	%o6,	0x0B,	%i4
	nop
	set	0x3C, %i5
	ldsh	[%l7 + %i5],	%o0
	fmul8ulx16	%f26,	%f4,	%f14
loop_45:
	sra	%o3,	%i7,	%g1
	edge8	%g7,	%i0,	%l6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%g3
	ba,a	loop_46
	move	%xcc,	%o7,	%i1
	fba,a	%fcc0,	loop_47
	te	%xcc,	0x6
loop_46:
	ta	%xcc,	0x4
	fzeros	%f2
loop_47:
	movvc	%icc,	%g6,	%l0
	tn	%xcc,	0x0
	fandnot1s	%f25,	%f11,	%f27
	fandnot1s	%f29,	%f17,	%f31
	tcc	%xcc,	0x6
	sdivx	%g5,	0x1165,	%i3
	fsrc2s	%f4,	%f2
	fbu,a	%fcc2,	loop_48
	movpos	%xcc,	%o5,	%l5
	movre	%l4,	0x0D6,	%o4
	sll	%g2,	%l2,	%i2
loop_48:
	ldx	[%l7 + 0x50],	%o1
	subcc	%i6,	0x02A5,	%o2
	nop
	fitos	%f24,	%f27
	bvc,pn	%icc,	loop_49
	edge32ln	%g4,	%l1,	%o6
	te	%xcc,	0x7
	fmovdgu	%icc,	%f1,	%f18
loop_49:
	bgu,a,pt	%icc,	loop_50
	edge32n	%i4,	%o0,	%l3
	wr	%g0,	0x89,	%asi
	stwa	%i7,	[%l7 + 0x44] %asi
loop_50:
	move	%xcc,	%g1,	%o3
	movle	%xcc,	%g7,	%i0
	tgu	%icc,	0x7
	fmul8sux16	%f4,	%f28,	%f0
	tge	%xcc,	0x6
	and	%l6,	0x0F3C,	%g3
	movrne	%o7,	0x032,	%i5
	fxor	%f14,	%f22,	%f14
	umul	%i1,	0x09A5,	%g6
	movre	%g5,	0x2F2,	%i3
	fcmpeq16	%f8,	%f8,	%l0
	fmovrse	%o5,	%f31,	%f26
	sethi	0x109F,	%l5
	movg	%icc,	%l4,	%o4
	tpos	%xcc,	0x2
	movrgz	%l2,	%i2,	%g2
	subccc	%o1,	0x07B8,	%o2
	fandnot1s	%f5,	%f26,	%f14
	brnz,a	%g4,	loop_51
	fors	%f0,	%f5,	%f31
	mulscc	%i6,	%l1,	%i4
	fmovdle	%xcc,	%f26,	%f22
loop_51:
	fandnot1s	%f6,	%f14,	%f31
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1A] %asi,	%o6
	sethi	0x112F,	%l3
	nop
	set	0x37, %i1
	ldub	[%l7 + %i1],	%i7
	tcc	%icc,	0x5
	set	0x08, %l5
	stha	%g1,	[%l7 + %l5] 0x88
	edge8n	%o3,	%o0,	%g7
	fbug,a	%fcc3,	loop_52
	edge8l	%l6,	%i0,	%g3
	sdiv	%i5,	0x0E8D,	%i1
	tne	%xcc,	0x5
loop_52:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x58] %asi,	%g6
	flush	%l7 + 0x60
	fbg,a	%fcc0,	loop_53
	fcmple32	%f14,	%f30,	%o7
	srl	%g5,	%l0,	%i3
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l5
loop_53:
	fcmpgt16	%f26,	%f0,	%o5
	membar	0x26
	movcs	%xcc,	%l4,	%o4
	movneg	%xcc,	%i2,	%l2
	taddcctv	%g2,	%o1,	%o2
	fsrc1	%f8,	%f4
	fsrc1s	%f28,	%f28
	movre	%i6,	%l1,	%g4
	movleu	%icc,	%i4,	%o6
	alignaddrl	%l3,	%g1,	%i7
	sethi	0x04A4,	%o3
	tneg	%xcc,	0x2
	nop
	setx	0xE0EC8B201F9314D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f28
	tgu	%xcc,	0x7
	fandnot2s	%f4,	%f26,	%f23
	brlez,a	%o0,	loop_54
	nop
	setx	0x604AA576,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fmovd	%f18,	%f0
	fbue	%fcc0,	loop_55
loop_54:
	tcs	%xcc,	0x0
	orcc	%l6,	%g7,	%g3
	tcc	%xcc,	0x3
loop_55:
	bcc,a,pt	%icc,	loop_56
	movrne	%i5,	%i0,	%g6
	flush	%l7 + 0x14
	ldub	[%l7 + 0x6E],	%i1
loop_56:
	subccc	%o7,	0x0869,	%g5
	addcc	%i3,	%l5,	%o5
	movgu	%icc,	%l4,	%o4
	pdist	%f8,	%f22,	%f22
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%i2
	fnors	%f22,	%f2,	%f24
	fmovrdgez	%l2,	%f28,	%f14
	call	loop_57
	edge16n	%o1,	%g2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x3
loop_57:
	movrlez	%l1,	0x2FA,	%o2
	brlz	%g4,	loop_58
	fbule,a	%fcc2,	loop_59
	tcc	%xcc,	0x0
	ldub	[%l7 + 0x37],	%o6
loop_58:
	movpos	%xcc,	%l3,	%i4
loop_59:
	movg	%xcc,	%i7,	%g1
	nop
	fitos	%f0,	%f24
	fstoi	%f24,	%f12
	movleu	%icc,	%o3,	%l6
	orncc	%g7,	0x1B88,	%o0
	fblg,a	%fcc2,	loop_60
	nop
	setx	loop_61,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%i5,	0x1FE5,	%i0
	edge32n	%g6,	%g3,	%i1
loop_60:
	tcs	%icc,	0x3
loop_61:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	array8	%g5,	%l5,	%o5
	edge32	%l4,	%o4,	%i3
	addc	%l0,	0x1053,	%i2
	fbule,a	%fcc3,	loop_62
	fmovdg	%icc,	%f9,	%f19
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x10] %asi,	%o1
loop_62:
	fmovdpos	%xcc,	%f15,	%f12
	fbule,a	%fcc3,	loop_63
	fmovsleu	%xcc,	%f29,	%f23
	sra	%g2,	0x03,	%i6
	ldsw	[%l7 + 0x54],	%l1
loop_63:
	edge32ln	%o2,	%g4,	%o6
	movg	%icc,	%l2,	%i4
	subcc	%i7,	%g1,	%o3
	brgez,a	%l6,	loop_64
	array32	%g7,	%o0,	%i5
	xor	%i0,	%g6,	%l3
	sdivx	%i1,	0x06FD,	%o7
loop_64:
	fcmpeq16	%f2,	%f24,	%g5
	edge8l	%l5,	%o5,	%g3
	tvc	%icc,	0x2
	tn	%xcc,	0x4
	set	0x74, %o5
	stwa	%o4,	[%l7 + %o5] 0x2b
	membar	#Sync
	movleu	%xcc,	%i3,	%l4
	sdiv	%i2,	0x14A0,	%o1
	umulcc	%l0,	0x0040,	%g2
	xorcc	%i6,	0x0668,	%l1
	tn	%icc,	0x7
	addcc	%o2,	%g4,	%l2
	ba	loop_65
	array32	%i4,	%o6,	%g1
	srl	%o3,	0x0D,	%l6
	brgz,a	%g7,	loop_66
loop_65:
	andn	%o0,	%i5,	%i0
	fcmpeq16	%f4,	%f18,	%i7
	fbg,a	%fcc1,	loop_67
loop_66:
	array16	%l3,	%i1,	%g6
	edge8	%o7,	%l5,	%g5
	movrgz	%g3,	%o5,	%o4
loop_67:
	and	%i3,	0x1C74,	%i2
	movg	%icc,	%o1,	%l4
	tneg	%icc,	0x2
	wr	%g0,	0x04,	%asi
	sta	%f16,	[%l7 + 0x30] %asi
	movvs	%icc,	%g2,	%i6
	fbne,a	%fcc3,	loop_68
	movg	%xcc,	%l1,	%l0
	subc	%o2,	0x08B3,	%l2
	nop
	setx	0xC4B333A0C04D05ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_68:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f26,	%f30,	%f16
	tsubcctv	%i4,	%g4,	%o6
	mulscc	%o3,	%l6,	%g7
	fmovrdgz	%o0,	%f24,	%f20
	array8	%g1,	%i5,	%i0
	tge	%xcc,	0x3
	nop
	fitod	%f6,	%f22
	fdtox	%f22,	%f22
	flush	%l7 + 0x14
	set	0x54, %g1
	stwa	%l3,	[%l7 + %g1] 0x19
	fbug	%fcc2,	loop_69
	ba	loop_70
	edge8	%i7,	%i1,	%g6
	movne	%icc,	%o7,	%g5
loop_69:
	fabss	%f1,	%f24
loop_70:
	movvc	%xcc,	%l5,	%g3
	lduh	[%l7 + 0x34],	%o4
	fmovdl	%icc,	%f28,	%f27
	bneg,pn	%icc,	loop_71
	movge	%icc,	%i3,	%i2
	taddcc	%o1,	%l4,	%g2
	edge16l	%i6,	%l1,	%l0
loop_71:
	array32	%o2,	%o5,	%l2
	movle	%icc,	%g4,	%o6
	tgu	%icc,	0x2
	fmovdle	%xcc,	%f3,	%f9
	subccc	%i4,	%l6,	%g7
	popc	0x15CA,	%o3
	fmovsleu	%xcc,	%f17,	%f20
	fpsub32s	%f5,	%f9,	%f10
	tg	%xcc,	0x4
	tsubcc	%o0,	%g1,	%i0
	fmovdg	%xcc,	%f17,	%f11
	fandnot2	%f18,	%f18,	%f2
	fmovspos	%xcc,	%f17,	%f31
	udiv	%l3,	0x1606,	%i7
	popc	%i5,	%i1
	subccc	%g6,	%o7,	%l5
	popc	%g3,	%o4
	tleu	%icc,	0x1
	addcc	%g5,	0x0FC6,	%i3
	bneg,a,pn	%xcc,	loop_72
	fmovscc	%icc,	%f8,	%f4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i2
loop_72:
	alignaddrl	%o1,	%l4,	%g2
	movneg	%xcc,	%l1,	%i6
	smul	%o2,	%l0,	%l2
	movge	%xcc,	%g4,	%o6
	fzero	%f30
	movpos	%xcc,	%i4,	%l6
	fbu	%fcc1,	loop_73
	fbul,a	%fcc2,	loop_74
	addc	%g7,	0x085D,	%o5
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x18
loop_73:
	move	%icc,	%o0,	%o3
loop_74:
	tcs	%icc,	0x6
	fbu	%fcc1,	loop_75
	edge8	%i0,	%g1,	%i7
	edge8ln	%l3,	%i1,	%g6
	tg	%xcc,	0x5
loop_75:
	sethi	0x1352,	%i5
	movrne	%o7,	%l5,	%g3
	brz,a	%o4,	loop_76
	fmovrdne	%g5,	%f0,	%f20
	movleu	%xcc,	%i2,	%i3
	fpadd16	%f22,	%f26,	%f2
loop_76:
	sub	%l4,	%g2,	%o1
	fmovdpos	%xcc,	%f13,	%f27
	set	0x78, %g3
	stwa	%l1,	[%l7 + %g3] 0xe3
	membar	#Sync
	or	%i6,	%o2,	%l0
	tleu	%icc,	0x3
	xor	%g4,	0x040E,	%o6
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x38] %asi,	%i4
	edge8ln	%l6,	%g7,	%l2
	fornot1s	%f27,	%f23,	%f25
	fmovrdgez	%o0,	%f10,	%f26
	set	0x37, %i0
	lduba	[%l7 + %i0] 0x15,	%o3
	fpsub32	%f16,	%f2,	%f6
	stx	%o5,	[%l7 + 0x60]
	fnot1	%f14,	%f20
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x1C] %asi,	%f24
	movrlez	%g1,	%i0,	%l3
	sll	%i1,	0x1F,	%i7
	tpos	%icc,	0x3
	srax	%g6,	0x05,	%i5
	sethi	0x1D4F,	%o7
	edge16ln	%l5,	%g3,	%g5
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f24
	movne	%xcc,	%i2,	%i3
	xorcc	%o4,	0x1A2C,	%l4
	move	%xcc,	%g2,	%l1
	subc	%i6,	0x1743,	%o2
	subc	%l0,	%g4,	%o6
	tle	%xcc,	0x6
	brgz,a	%o1,	loop_77
	tleu	%icc,	0x2
	fcmpeq32	%f30,	%f0,	%i4
	movrlez	%l6,	0x372,	%l2
loop_77:
	tge	%icc,	0x1
	sub	%g7,	0x1D09,	%o3
	fzeros	%f25
	bcc	loop_78
	ldsw	[%l7 + 0x18],	%o0
	brnz	%g1,	loop_79
	orn	%o5,	%i0,	%l3
loop_78:
	array8	%i1,	%g6,	%i7
	fnors	%f8,	%f2,	%f10
loop_79:
	andcc	%o7,	0x19F8,	%i5
	sdivx	%g3,	0x07E2,	%l5
	movleu	%xcc,	%g5,	%i2
	bcs,a	loop_80
	movrne	%i3,	0x0A0,	%o4
	sra	%g2,	%l4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80:
	edge32ln	%o2,	%l1,	%g4
	addccc	%o6,	0x04E6,	%l0
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	edge8l	%l6,	%l2,	%i4
	fpadd16	%f30,	%f20,	%f4
	fbule,a	%fcc1,	loop_81
	fmovsleu	%xcc,	%f2,	%f13
	array8	%g7,	%o3,	%o0
	fbul,a	%fcc2,	loop_82
loop_81:
	fandnot1	%f14,	%f30,	%f2
	xorcc	%o5,	%i0,	%g1
	orcc	%i1,	0x1E8F,	%g6
loop_82:
	addccc	%i7,	%l3,	%o7
	fsrc1	%f18,	%f10
	fmovrse	%g3,	%f1,	%f8
	ldx	[%l7 + 0x08],	%i5
	tg	%xcc,	0x6
	udiv	%l5,	0x0C78,	%i2
	movne	%icc,	%i3,	%g5
	orn	%g2,	%l4,	%i6
	xorcc	%o2,	%o4,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o6,	%l1
	movle	%icc,	%l0,	%l6
	edge32l	%o1,	%l2,	%g7
	tsubcctv	%i4,	%o3,	%o0
	movle	%icc,	%i0,	%g1
	fmovsneg	%xcc,	%f5,	%f18
	smulcc	%i1,	0x194B,	%o5
	andncc	%i7,	%l3,	%o7
	bne,a	%xcc,	loop_83
	movrlz	%g6,	0x209,	%i5
	andn	%l5,	%g3,	%i3
	movvs	%xcc,	%g5,	%i2
loop_83:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%g2,	[%l7 + 0x34] %asi
	edge32n	%i6,	%l4,	%o2
	ldsw	[%l7 + 0x34],	%o4
	smulcc	%g4,	0x0632,	%o6
	bshuffle	%f8,	%f4,	%f0
	xor	%l1,	0x12D5,	%l6
	and	%o1,	0x0FA2,	%l2
	fmul8x16	%f20,	%f14,	%f10
	nop
	set	0x2C, %g5
	stw	%l0,	[%l7 + %g5]
	set	0x60, %o3
	stxa	%i4,	[%l7 + %o3] 0xea
	membar	#Sync
	sdiv	%o3,	0x1088,	%o0
	sethi	0x1133,	%i0
	edge8n	%g1,	%g7,	%i1
	mova	%icc,	%i7,	%o5
	movleu	%icc,	%o7,	%l3
	edge8	%i5,	%g6,	%g3
	edge16	%i3,	%g5,	%l5
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f2
	srax	%g2,	%i6,	%i2
	stx	%o2,	[%l7 + 0x70]
	te	%icc,	0x1
	movge	%icc,	%l4,	%g4
	subccc	%o4,	0x17DB,	%o6
	set	0x20, %i3
	ldsha	[%l7 + %i3] 0x14,	%l1
	movrne	%l6,	%o1,	%l2
	fcmple16	%f18,	%f2,	%l0
	add	%i4,	0x10CD,	%o0
	sir	0x0488
	bl	loop_84
	edge8l	%i0,	%g1,	%g7
	tne	%icc,	0x0
	tl	%xcc,	0x6
loop_84:
	fnegs	%f1,	%f23
	bleu	loop_85
	lduh	[%l7 + 0x6C],	%i1
	srl	%i7,	%o5,	%o3
	ldsw	[%l7 + 0x3C],	%o7
loop_85:
	and	%l3,	%g6,	%g3
	fmovrdne	%i5,	%f30,	%f10
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x19,	%g5
	stbar
	fxors	%f8,	%f23,	%f22
	movre	%i3,	0x328,	%g2
	smulcc	%i6,	%l5,	%i2
	andn	%l4,	0x16E6,	%g4
	wr	%g0,	0xe3,	%asi
	stha	%o2,	[%l7 + 0x24] %asi
	membar	#Sync
	xorcc	%o6,	0x030D,	%o4
	stx	%l6,	[%l7 + 0x10]
	tgu	%xcc,	0x5
	fble,a	%fcc2,	loop_86
	umulcc	%o1,	%l1,	%l0
	move	%icc,	%l2,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86:
	mulscc	%i0,	%i4,	%g1
	andcc	%g7,	0x0544,	%i7
	flush	%l7 + 0x70
	fmovscs	%icc,	%f18,	%f9
	brz,a	%o5,	loop_87
	faligndata	%f14,	%f6,	%f20
	ba,pn	%xcc,	loop_88
	fbl,a	%fcc3,	loop_89
loop_87:
	edge16l	%o3,	%i1,	%l3
	tle	%xcc,	0x1
loop_88:
	nop
	setx	0xD5A98AA11B88427E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB13EDC82ACEBDD76,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f18,	%f14
loop_89:
	fmovrse	%o7,	%f3,	%f21
	movcc	%icc,	%g6,	%i5
	andncc	%g3,	%i3,	%g2
	fbl	%fcc0,	loop_90
	movrlez	%i6,	%g5,	%l5
	fbo,a	%fcc0,	loop_91
	add	%i2,	0x1B93,	%l4
loop_90:
	flush	%l7 + 0x14
	umul	%g4,	%o6,	%o2
loop_91:
	movrgz	%o4,	%l6,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l0,	%o1
	set	0x74, %i7
	stwa	%l2,	[%l7 + %i7] 0x80
	fmul8x16	%f3,	%f10,	%f8
	brnz,a	%i0,	loop_92
	andncc	%o0,	%g1,	%i4
	movrgz	%g7,	%o5,	%i7
	fcmpgt16	%f8,	%f30,	%o3
loop_92:
	tvc	%xcc,	0x0
	fba	%fcc3,	loop_93
	fbul,a	%fcc0,	loop_94
	be,a,pn	%icc,	loop_95
	bleu,a	%icc,	loop_96
loop_93:
	fbn,a	%fcc2,	loop_97
loop_94:
	movrgz	%i1,	%o7,	%g6
loop_95:
	fmovdleu	%icc,	%f30,	%f17
loop_96:
	taddcctv	%i5,	0x001D,	%g3
loop_97:
	edge8n	%i3,	%g2,	%l3
	tvc	%icc,	0x2
	sra	%i6,	%g5,	%l5
	tn	%xcc,	0x5
	xorcc	%l4,	0x00C7,	%g4
	fabsd	%f14,	%f26
	fble,a	%fcc2,	loop_98
	andncc	%i2,	%o6,	%o2
	fbge,a	%fcc2,	loop_99
	movneg	%xcc,	%l6,	%l1
loop_98:
	or	%o4,	0x0301,	%l0
	sdivcc	%o1,	0x0EBE,	%l2
loop_99:
	nop
	set	0x0C, %o2
	lduwa	[%l7 + %o2] 0x81,	%o0
	nop
	setx	0xC0627A47,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	nop
	fitos	%f8,	%f13
	fstox	%f13,	%f0
	and	%i0,	0x0034,	%i4
	nop
	setx	0x20541E55,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	membar	0x37
	xnor	%g7,	0x15CC,	%g1
	set	0x6C, %o4
	swapa	[%l7 + %o4] 0x19,	%i7
	umul	%o3,	%i1,	%o5
	umulcc	%g6,	0x1C63,	%i5
	fmul8x16	%f2,	%f22,	%f18
	xorcc	%o7,	0x1DA1,	%g3
	udivcc	%g2,	0x0BE8,	%l3
	fmovrdgz	%i6,	%f18,	%f24
	addccc	%i3,	0x10F7,	%g5
	sir	0x0E78
	sir	0x0EA4
	fnor	%f16,	%f18,	%f6
	fbuge,a	%fcc3,	loop_100
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc2,	loop_101
	tleu	%xcc,	0x2
loop_100:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%l5
loop_101:
	edge8ln	%l4,	%i2,	%o6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7A] %asi,	%o2
	fone	%f20
	popc	0x154B,	%g4
	sir	0x01A1
	addccc	%l1,	0x10A6,	%l6
	edge16ln	%l0,	%o4,	%o1
	move	%icc,	%l2,	%i0
	tvc	%xcc,	0x4
	brlz,a	%o0,	loop_102
	tg	%icc,	0x7
	fexpand	%f6,	%f14
	move	%xcc,	%g7,	%i4
loop_102:
	mova	%icc,	%g1,	%o3
	tpos	%icc,	0x3
	bshuffle	%f0,	%f26,	%f26
	tg	%xcc,	0x2
	addc	%i7,	0x1105,	%o5
	ta	%xcc,	0x0
	flush	%l7 + 0x48
	movcc	%icc,	%g6,	%i1
	bvc,pn	%xcc,	loop_103
	edge32n	%i5,	%o7,	%g2
	tcc	%icc,	0x6
	fsrc2	%f10,	%f10
loop_103:
	addcc	%g3,	0x0DCF,	%l3
	tle	%icc,	0x6
	orcc	%i3,	%i6,	%l5
	array32	%g5,	%l4,	%o6
	swap	[%l7 + 0x18],	%i2
	nop
	setx	loop_104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ba	loop_105
	movrne	%g4,	0x138,	%o2
	edge32	%l6,	%l0,	%o4
loop_104:
	edge32ln	%l1,	%o1,	%l2
loop_105:
	fmovsvs	%xcc,	%f1,	%f14
	fpadd16s	%f2,	%f4,	%f23
	bgu,pt	%xcc,	loop_106
	movpos	%xcc,	%o0,	%i0
	movn	%icc,	%g7,	%i4
	fmovrsgz	%g1,	%f13,	%f12
loop_106:
	fmovdne	%icc,	%f24,	%f10
	set	0x38, %o0
	ldswa	[%l7 + %o0] 0x80,	%o3
	tl	%xcc,	0x2
	ldsb	[%l7 + 0x60],	%o5
	swap	[%l7 + 0x60],	%i7
	movcs	%icc,	%g6,	%i5
	for	%f12,	%f6,	%f26
	fmovdvs	%xcc,	%f20,	%f5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x10] %asi,	%o7
	movrne	%i1,	0x259,	%g3
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	fbo	%fcc1,	loop_107
	fcmpne32	%f22,	%f10,	%l3
	tg	%xcc,	0x5
	tne	%xcc,	0x1
loop_107:
	nop
	set	0x6C, %g2
	ldswa	[%l7 + %g2] 0x80,	%i3
	movl	%icc,	%i6,	%g2
	mulscc	%l5,	%g5,	%o6
	srl	%l4,	%g4,	%i2
	fmovse	%xcc,	%f2,	%f31
	or	%o2,	%l6,	%l0
	set	0x25, %g4
	ldsba	[%l7 + %g4] 0x19,	%l1
	sra	%o1,	%l2,	%o4
	mulscc	%o0,	%g7,	%i0
	movge	%xcc,	%g1,	%o3
	smulcc	%o5,	%i7,	%g6
	movcs	%xcc,	%i5,	%o7
	ldub	[%l7 + 0x68],	%i4
	edge8ln	%g3,	%i1,	%l3
	fmovdn	%xcc,	%f22,	%f10
	array32	%i3,	%i6,	%g2
	pdist	%f0,	%f8,	%f20
	orn	%l5,	%o6,	%l4
	nop
	setx	0x8ACB2A2D0C2D6077,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA638090E9676A8E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f30,	%f14
	addcc	%g4,	0x08D8,	%g5
	ldd	[%l7 + 0x18],	%f22
	movne	%xcc,	%i2,	%l6
	brgez,a	%l0,	loop_108
	addccc	%o2,	%l1,	%l2
	sdivcc	%o4,	0x1B8D,	%o0
	brgz	%g7,	loop_109
loop_108:
	or	%i0,	%o1,	%g1
	prefetch	[%l7 + 0x58],	 0x0
	orn	%o3,	%i7,	%g6
loop_109:
	fmul8x16al	%f31,	%f11,	%f16
	bleu,a,pn	%xcc,	loop_110
	tvs	%icc,	0x4
	udiv	%i5,	0x079E,	%o5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x30] %asi,	%o6
loop_110:
	fpmerge	%f26,	%f25,	%f2
	fbul,a	%fcc2,	loop_111
	fmovdvs	%xcc,	%f6,	%f20
	fmovdge	%icc,	%f28,	%f12
	fsrc2s	%f19,	%f2
loop_111:
	fbu	%fcc3,	loop_112
	stx	%i4,	[%l7 + 0x30]
	tcs	%icc,	0x5
	xor	%g3,	%i1,	%l3
loop_112:
	udivcc	%i3,	0x19A5,	%g2
	movcc	%xcc,	%l5,	%i6
	tge	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	sra	%g4,	0x0D,	%o6
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tsubcctv	%g5,	0x11D5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l6,	%l0
	edge16n	%l1,	%o2,	%l2
	swap	[%l7 + 0x50],	%o0
	tn	%xcc,	0x4
	mulx	%g7,	%i0,	%o1
	tcs	%xcc,	0x1
	movgu	%icc,	%g1,	%o4
	tvs	%icc,	0x5
	orcc	%o3,	%i7,	%i5
	ldd	[%l7 + 0x48],	%f20
	movvs	%xcc,	%g6,	%o5
	movcc	%xcc,	%o7,	%i4
	fmovrdne	%i1,	%f14,	%f10
	sub	%g3,	0x1B71,	%i3
	tneg	%xcc,	0x1
	lduw	[%l7 + 0x2C],	%g2
	fbug	%fcc3,	loop_113
	fmovse	%xcc,	%f4,	%f27
	movvs	%xcc,	%l5,	%i6
	fble	%fcc3,	loop_114
loop_113:
	tvs	%icc,	0x6
	movgu	%xcc,	%l4,	%l3
	sra	%o6,	%g5,	%i2
loop_114:
	mulx	%l6,	%l0,	%g4
	bvs,pn	%xcc,	loop_115
	tpos	%xcc,	0x0
	tvc	%xcc,	0x2
	tsubcc	%l1,	0x08EA,	%o2
loop_115:
	lduw	[%l7 + 0x5C],	%o0
	movvc	%icc,	%g7,	%l2
	ldstub	[%l7 + 0x76],	%o1
	ldstub	[%l7 + 0x4E],	%i0
	movg	%xcc,	%g1,	%o3
	fmovsg	%icc,	%f3,	%f18
	array8	%o4,	%i7,	%g6
	bg,a	loop_116
	brlz,a	%i5,	loop_117
	fmovsne	%icc,	%f14,	%f3
	fmovrdgez	%o5,	%f28,	%f20
loop_116:
	tvc	%xcc,	0x6
loop_117:
	fnand	%f16,	%f16,	%f10
	fcmple32	%f20,	%f10,	%i4
	nop
	fitod	%f2,	%f16
	fdtos	%f16,	%f24
	xor	%o7,	0x1D1C,	%i1
	brz	%i3,	loop_118
	edge8ln	%g2,	%l5,	%g3
	srlx	%l4,	%l3,	%i6
	nop
	fitos	%f3,	%f5
	fstox	%f5,	%f30
loop_118:
	sir	0x1D92
	subc	%o6,	%g5,	%i2
	edge8	%l0,	%g4,	%l1
	move	%icc,	%o2,	%l6
	tvs	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%o0
	edge16	%g7,	%l2,	%o1
	sub	%i0,	%g1,	%o3
	srl	%o4,	%i7,	%i5
	fmovdl	%xcc,	%f26,	%f2
	addccc	%g6,	0x0F0F,	%o5
	edge8	%i4,	%i1,	%i3
	fmovdleu	%icc,	%f28,	%f13
	sll	%g2,	0x1F,	%o7
	fpsub16s	%f10,	%f19,	%f10
	andcc	%g3,	0x1B1F,	%l5
	te	%xcc,	0x7
	fmovrdlez	%l4,	%f8,	%f28
	nop
	set	0x58, %o7
	stx	%i6,	[%l7 + %o7]
	tg	%xcc,	0x4
	bcs,pn	%xcc,	loop_119
	bgu	%icc,	loop_120
	ldsh	[%l7 + 0x5E],	%o6
	tne	%xcc,	0x0
loop_119:
	mulx	%g5,	0x03D1,	%i2
loop_120:
	nop
	setx	0x407B1714,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	edge32ln	%l0,	%g4,	%l1
	movne	%icc,	%l3,	%l6
	move	%xcc,	%o2,	%o0
	bvc	loop_121
	fbue	%fcc3,	loop_122
	tsubcctv	%g7,	%o1,	%i0
	fbne,a	%fcc1,	loop_123
loop_121:
	fcmpgt32	%f4,	%f8,	%l2
loop_122:
	tn	%xcc,	0x0
	bn,a,pt	%icc,	loop_124
loop_123:
	ldsb	[%l7 + 0x24],	%g1
	edge32l	%o4,	%o3,	%i5
	fones	%f22
loop_124:
	bshuffle	%f16,	%f6,	%f16
	addc	%g6,	%o5,	%i4
	fmovsn	%xcc,	%f30,	%f6
	set	0x68, %i2
	stxa	%i1,	[%l7 + %i2] 0x2f
	membar	#Sync
	edge32	%i3,	%g2,	%o7
	fnors	%f22,	%f9,	%f1
	alignaddrl	%i7,	%g3,	%l4
	fzeros	%f21
	srax	%l5,	%o6,	%g5
	stx	%i2,	[%l7 + 0x60]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l0,	%i6
	stbar
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x10
	orn	%l1,	%g4,	%l6
	movrgz	%l3,	0x2D9,	%o2
	orcc	%o0,	%g7,	%o1
	mova	%xcc,	%l2,	%g1
	tcc	%icc,	0x1
	edge8ln	%i0,	%o3,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x15],	%g6
	fbn	%fcc2,	loop_125
	fexpand	%f6,	%f4
	tleu	%icc,	0x6
	bcs,a	%xcc,	loop_126
loop_125:
	fmovda	%icc,	%f25,	%f15
	and	%o5,	0x0FF7,	%i4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_126:
	and	%i1,	%g2,	%i3
	nop
	setx	loop_127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%o7,	[%l7 + 0x76]
	flush	%l7 + 0x50
	wr	%g0,	0x89,	%asi
	sta	%f0,	[%l7 + 0x44] %asi
loop_127:
	addcc	%i7,	%g3,	%l5
	alignaddrl	%l4,	%o6,	%i2
	sethi	0x0275,	%l0
	membar	0x31
	or	%g5,	%l1,	%g4
	andcc	%l6,	%l3,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o0,	%o2,	%o1
	movneg	%xcc,	%l2,	%g7
	edge32	%i0,	%g1,	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i5,	%o5
	edge8ln	%g6,	%o4,	%i1
	fors	%f13,	%f6,	%f5
	addc	%g2,	%i3,	%o7
	bn,a,pt	%icc,	loop_128
	movrgez	%i7,	%g3,	%i4
	alignaddrl	%l5,	%l4,	%o6
	sdivx	%l0,	0x186D,	%i2
loop_128:
	ldsw	[%l7 + 0x34],	%g5
	smulcc	%l1,	%l6,	%g4
	mulscc	%i6,	%o0,	%o2
	orcc	%l3,	0x0204,	%o1
	sethi	0x1E4B,	%g7
	sllx	%i0,	%g1,	%l2
	edge32ln	%i5,	%o5,	%o3
	fornot1s	%f17,	%f18,	%f8
	ldsh	[%l7 + 0x5E],	%o4
	movge	%xcc,	%i1,	%g6
	fmovsneg	%xcc,	%f9,	%f8
	movgu	%xcc,	%i3,	%o7
	te	%icc,	0x5
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f16
	tl	%xcc,	0x2
	orcc	%i7,	%g3,	%g2
	mulscc	%l5,	%l4,	%i4
	tl	%icc,	0x1
	nop
	setx	0x676370896043392B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	xnor	%o6,	0x1CFB,	%l0
	tg	%xcc,	0x0
	subcc	%g5,	0x1C09,	%i2
	mova	%xcc,	%l1,	%l6
	nop
	setx	loop_129,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%xcc,	0x3
	fmovrse	%i6,	%f25,	%f24
	alignaddrl	%g4,	%o2,	%o0
loop_129:
	fbule	%fcc0,	loop_130
	edge16ln	%o1,	%g7,	%i0
	fmovrdgz	%g1,	%f0,	%f30
	xorcc	%l2,	%i5,	%l3
loop_130:
	movcs	%icc,	%o5,	%o3
	or	%i1,	0x0283,	%g6
	edge8	%o4,	%i3,	%o7
	movrgez	%i7,	0x28E,	%g2
	sethi	0x08EA,	%l5
	edge32ln	%l4,	%g3,	%i4
	sra	%l0,	0x04,	%g5
	fmovse	%xcc,	%f19,	%f12
	movge	%icc,	%i2,	%l1
	movvs	%icc,	%l6,	%i6
	set	0x30, %g7
	ldswa	[%l7 + %g7] 0x11,	%g4
	tneg	%icc,	0x4
	set	0x54, %i4
	sta	%f19,	[%l7 + %i4] 0x80
	tsubcctv	%o6,	0x19B7,	%o2
	fsrc2	%f30,	%f6
	array16	%o0,	%o1,	%g7
	tn	%xcc,	0x0
	tn	%xcc,	0x0
	fnand	%f2,	%f18,	%f26
	movrgz	%g1,	0x00F,	%l2
	fmovrsgz	%i0,	%f10,	%f16
	edge8l	%i5,	%l3,	%o3
	fcmpeq16	%f12,	%f4,	%i1
	movrlez	%o5,	0x2E1,	%g6
	tsubcctv	%o4,	0x1EF2,	%i3
	fnot2s	%f19,	%f17
	ldd	[%l7 + 0x50],	%f0
	addccc	%o7,	0x0EC4,	%g2
	fblg,a	%fcc1,	loop_131
	swap	[%l7 + 0x78],	%i7
	nop
	setx	0xFD07961485B76BE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDE74C24A06A17FB7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f14,	%f2
	tneg	%xcc,	0x4
loop_131:
	sdivcc	%l5,	0x14EB,	%g3
	ldx	[%l7 + 0x50],	%i4
	te	%xcc,	0x0
	fands	%f25,	%f24,	%f26
	fbn	%fcc2,	loop_132
	movvs	%icc,	%l4,	%g5
	tn	%icc,	0x6
	movg	%xcc,	%i2,	%l0
loop_132:
	orcc	%l1,	0x13DE,	%l6
	movpos	%icc,	%i6,	%o6
	movle	%xcc,	%g4,	%o2
	fba	%fcc3,	loop_133
	sra	%o0,	%o1,	%g7
	alignaddr	%l2,	%i0,	%g1
	sll	%i5,	0x0D,	%l3
loop_133:
	movcc	%icc,	%i1,	%o3
	fnot2s	%f25,	%f24
	nop
	setx	0x031C0C77E2F0A23D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x934CD6D02878293F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f30,	%f30
	brgez	%g6,	loop_134
	fone	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o4,	%i3
loop_134:
	fmovsn	%icc,	%f5,	%f21
	mulscc	%o5,	0x1A6F,	%o7
	tne	%xcc,	0x0
	srax	%g2,	%i7,	%l5
	nop
	setx	0xF68E2C17F0471908,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	bgu,pn	%xcc,	loop_135
	movg	%xcc,	%g3,	%l4
	edge8n	%i4,	%g5,	%l0
	fcmpeq16	%f6,	%f10,	%i2
loop_135:
	te	%icc,	0x3
	smul	%l6,	0x0F97,	%i6
	bn,a	loop_136
	tgu	%icc,	0x4
	alignaddrl	%l1,	%o6,	%o2
	umul	%o0,	0x1CB4,	%o1
loop_136:
	stb	%g7,	[%l7 + 0x32]
	call	loop_137
	ble,a,pt	%xcc,	loop_138
	fornot1s	%f14,	%f24,	%f27
	set	0x14, %l3
	lduwa	[%l7 + %l3] 0x19,	%l2
loop_137:
	nop
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x10,	%g4
loop_138:
	std	%f24,	[%l7 + 0x08]
	or	%i0,	0x1627,	%i5
	brgez,a	%l3,	loop_139
	ldsb	[%l7 + 0x1D],	%i1
	fbn,a	%fcc3,	loop_140
	fpadd32s	%f25,	%f24,	%f31
loop_139:
	fand	%f26,	%f22,	%f0
	movrlez	%o3,	0x223,	%g6
loop_140:
	andncc	%o4,	%g1,	%o5
	membar	0x50
	sllx	%o7,	%g2,	%i7
	tle	%xcc,	0x5
	fnands	%f5,	%f27,	%f12
	fandnot1s	%f31,	%f15,	%f29
	nop
	setx	loop_141,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxors	%f16,	%f6,	%f27
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f22
	xnor	%l5,	0x0868,	%i3
loop_141:
	andncc	%l4,	%i4,	%g3
	orn	%g5,	%l0,	%i2
	array16	%i6,	%l1,	%o6
	sdivcc	%o2,	0x1ECF,	%o0
	fmovdgu	%icc,	%f18,	%f6
	array16	%o1,	%g7,	%l2
	movrlez	%l6,	0x01C,	%g4
	alignaddrl	%i5,	%l3,	%i1
	sll	%o3,	0x10,	%g6
	ba	loop_142
	fnand	%f12,	%f22,	%f20
	set	0x68, %l4
	lduwa	[%l7 + %l4] 0x88,	%i0
loop_142:
	fbue	%fcc3,	loop_143
	popc	0x0137,	%g1
	lduw	[%l7 + 0x50],	%o5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g2
loop_143:
	ldx	[%l7 + 0x18],	%o7
	movrne	%l5,	0x048,	%i3
	edge16	%i7,	%l4,	%g3
	brnz,a	%i4,	loop_144
	ldd	[%l7 + 0x68],	%g4
	stb	%l0,	[%l7 + 0x4D]
	tg	%xcc,	0x2
loop_144:
	tg	%icc,	0x3
	fmovsa	%icc,	%f3,	%f12
	xorcc	%i2,	%l1,	%i6
	ble	%xcc,	loop_145
	fmovsl	%xcc,	%f10,	%f7
	and	%o2,	0x1EDE,	%o6
	lduh	[%l7 + 0x0A],	%o0
loop_145:
	ldsb	[%l7 + 0x35],	%g7
	fbl,a	%fcc3,	loop_146
	tsubcctv	%l2,	%o1,	%g4
	edge16	%i5,	%l6,	%l3
	tle	%xcc,	0x7
loop_146:
	lduh	[%l7 + 0x1C],	%i1
	fnor	%f4,	%f6,	%f26
	fnegs	%f10,	%f8
	movrgez	%g6,	%o3,	%g1
	tsubcc	%o5,	%o4,	%i0
	and	%g2,	0x0EA2,	%l5
	edge32l	%o7,	%i7,	%l4
	nop
	setx	loop_147,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sth	%i3,	[%l7 + 0x5C]
	umul	%g3,	0x0A86,	%i4
	andn	%l0,	0x02D9,	%i2
loop_147:
	nop
	setx	0x706D246E,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	tg	%xcc,	0x3
	edge16n	%g5,	%l1,	%o2
	edge8ln	%i6,	%o6,	%g7
	fble	%fcc1,	loop_148
	fnegd	%f30,	%f30
	udiv	%o0,	0x155B,	%l2
	lduw	[%l7 + 0x10],	%g4
loop_148:
	movleu	%xcc,	%i5,	%o1
	fmul8x16al	%f21,	%f24,	%f22
	move	%xcc,	%l6,	%l3
	tpos	%xcc,	0x5
	edge8n	%g6,	%i1,	%g1
	set	0x21, %l2
	ldsba	[%l7 + %l2] 0x10,	%o5
	and	%o4,	0x0241,	%o3
	bl,a,pn	%icc,	loop_149
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i0,	%l5,	%o7
	tvs	%xcc,	0x6
loop_149:
	sethi	0x1333,	%i7
	fbuge,a	%fcc2,	loop_150
	fpsub32s	%f18,	%f0,	%f9
	edge16	%g2,	%i3,	%l4
	movgu	%icc,	%i4,	%l0
loop_150:
	smul	%g3,	%i2,	%g5
	movle	%icc,	%l1,	%o2
	tpos	%icc,	0x1
	wr	%g0,	0x10,	%asi
	sta	%f23,	[%l7 + 0x74] %asi
	movn	%xcc,	%i6,	%o6
	ta	%xcc,	0x0
	tg	%xcc,	0x1
	fmovrsne	%o0,	%f17,	%f31
	ldx	[%l7 + 0x70],	%g7
	movcs	%xcc,	%g4,	%l2
	edge32	%i5,	%l6,	%o1
	tsubcc	%g6,	0x07C1,	%l3
	mulscc	%i1,	0x1A05,	%g1
	membar	0x5F
	xor	%o4,	0x10A1,	%o3
	andncc	%i0,	%o5,	%l5
	tcs	%icc,	0x3
	tvs	%xcc,	0x1
	ldx	[%l7 + 0x40],	%o7
	fnot2s	%f19,	%f21
	fsrc2s	%f6,	%f26
	orncc	%i7,	%g2,	%l4
	xnorcc	%i4,	0x0724,	%i3
	ldd	[%l7 + 0x10],	%l0
	tneg	%xcc,	0x2
	fbue	%fcc1,	loop_151
	fbne	%fcc3,	loop_152
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f15
	fmovse	%xcc,	%f8,	%f30
loop_151:
	movvc	%xcc,	%g3,	%i2
loop_152:
	stx	%l1,	[%l7 + 0x40]
	mulx	%g5,	%o2,	%o6
	bneg,pt	%xcc,	loop_153
	sth	%o0,	[%l7 + 0x0A]
	array8	%i6,	%g7,	%l2
	fbe	%fcc3,	loop_154
loop_153:
	edge8ln	%i5,	%g4,	%l6
	tle	%xcc,	0x5
	fbue,a	%fcc0,	loop_155
loop_154:
	fxor	%f12,	%f22,	%f4
	fnot2	%f30,	%f24
	ld	[%l7 + 0x44],	%f30
loop_155:
	sdivcc	%o1,	0x0373,	%g6
	bcs,pt	%icc,	loop_156
	orn	%i1,	0x131D,	%g1
	fsrc1	%f28,	%f18
	subcc	%o4,	%o3,	%l3
loop_156:
	ldsb	[%l7 + 0x37],	%o5
	wr	%g0,	0x80,	%asi
	sta	%f30,	[%l7 + 0x30] %asi
	fandnot1s	%f27,	%f0,	%f23
	ldub	[%l7 + 0x25],	%i0
	xnorcc	%o7,	%l5,	%i7
	movvc	%xcc,	%g2,	%l4
	movrne	%i3,	%l0,	%g3
	fbl,a	%fcc3,	loop_157
	fmovsle	%xcc,	%f28,	%f7
	popc	%i4,	%l1
	addccc	%g5,	0x02F7,	%o2
loop_157:
	smulcc	%o6,	%i2,	%o0
	fpsub16	%f8,	%f28,	%f18
	fbl	%fcc3,	loop_158
	movcc	%xcc,	%i6,	%l2
	ta	%xcc,	0x0
	sethi	0x194E,	%i5
loop_158:
	edge8	%g7,	%l6,	%g4
	umulcc	%g6,	0x0271,	%i1
	bcc,a,pt	%icc,	loop_159
	tneg	%icc,	0x2
	addcc	%o1,	%g1,	%o3
	fmovrdgez	%o4,	%f16,	%f18
loop_159:
	movrne	%l3,	0x2F9,	%o5
	bpos,a	%icc,	loop_160
	bcs,a	%xcc,	loop_161
	tle	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x6C] %asi,	%o7
loop_160:
	nop
	set	0x40, %l0
	stwa	%i0,	[%l7 + %l0] 0x18
loop_161:
	fbug	%fcc2,	loop_162
	fbe	%fcc0,	loop_163
	fpadd32s	%f12,	%f0,	%f22
	movcs	%xcc,	%l5,	%i7
loop_162:
	movrgz	%g2,	%i3,	%l0
loop_163:
	movleu	%xcc,	%g3,	%l4
	fpackfix	%f30,	%f31
	fmovsne	%icc,	%f21,	%f11
	orncc	%i4,	%g5,	%o2
	tsubcc	%l1,	%o6,	%i2
	ldub	[%l7 + 0x59],	%o0
	tn	%icc,	0x0
	fmovrdne	%i6,	%f24,	%f8
	fmovsleu	%xcc,	%f5,	%f10
	brgz	%l2,	loop_164
	sethi	0x10FB,	%g7
	smulcc	%i5,	%g4,	%l6
	fmovdgu	%icc,	%f31,	%f14
loop_164:
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%o1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%i1
	orn	%l3,	0x186A,	%o4
	pdist	%f8,	%f22,	%f18
	edge8ln	%o7,	%o5,	%l5
	array16	%i7,	%i0,	%i3
	tne	%icc,	0x7
	tne	%icc,	0x7
	tpos	%xcc,	0x0
	fmovsa	%xcc,	%f11,	%f26
	orcc	%l0,	0x101C,	%g2
	edge32ln	%g3,	%i4,	%l4
	movleu	%icc,	%o2,	%g5
	tcs	%xcc,	0x7
	movvc	%xcc,	%o6,	%i2
	tneg	%icc,	0x3
	tle	%icc,	0x6
	fones	%f19
	bl,pn	%xcc,	loop_165
	movneg	%icc,	%o0,	%i6
	fnot2s	%f22,	%f26
	subcc	%l1,	0x1C64,	%g7
loop_165:
	nop
	fitos	%f6,	%f5
	fstox	%f5,	%f16
	fxtos	%f16,	%f7
	mulscc	%i5,	0x1EA1,	%l2
	ldsb	[%l7 + 0x65],	%g4
	tleu	%icc,	0x3
	mulscc	%l6,	0x0B31,	%g6
	udiv	%g1,	0x14F3,	%o3
	addc	%i1,	0x0F2C,	%l3
	mova	%icc,	%o1,	%o4
	srax	%o5,	%l5,	%i7
	or	%i0,	0x16C4,	%i3
	tl	%icc,	0x6
	sir	0x1288
	udivx	%l0,	0x076A,	%o7
	movrlez	%g2,	%i4,	%l4
	xnorcc	%o2,	%g5,	%g3
	edge16ln	%o6,	%o0,	%i6
	movrlz	%l1,	0x13F,	%i2
	fbn,a	%fcc2,	loop_166
	fandnot2	%f0,	%f6,	%f0
	fandnot2	%f12,	%f26,	%f2
	fbu	%fcc1,	loop_167
loop_166:
	nop
	setx	0xD50481B92449AA50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f26
	fblg,a	%fcc0,	loop_168
	edge32ln	%g7,	%l2,	%i5
loop_167:
	nop
	wr	%g0,	0x80,	%asi
	stha	%l6,	[%l7 + 0x58] %asi
loop_168:
	fabsd	%f26,	%f6
	tvc	%icc,	0x0
	edge32ln	%g6,	%g1,	%g4
	tneg	%xcc,	0x0
	mova	%icc,	%o3,	%l3
	fsrc1	%f2,	%f18
	tcs	%icc,	0x6
	edge8ln	%o1,	%i1,	%o4
	movpos	%xcc,	%l5,	%i7
	taddcctv	%o5,	%i3,	%i0
	fandnot2	%f6,	%f20,	%f20
	sra	%l0,	0x1B,	%o7
	edge32l	%g2,	%l4,	%o2
	sllx	%i4,	%g5,	%g3
	sdiv	%o6,	0x03A9,	%o0
	fcmpgt32	%f30,	%f6,	%l1
	mulscc	%i6,	%g7,	%l2
	ldsb	[%l7 + 0x60],	%i2
	tleu	%xcc,	0x3
	bcs,a,pn	%xcc,	loop_169
	nop
	setx	0xCEDC53D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xA49B0F0E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f7,	%f1
	tle	%icc,	0x4
	set	0x08, %i1
	ldstuba	[%l7 + %i1] 0x19,	%l6
loop_169:
	brnz,a	%g6,	loop_170
	sllx	%g1,	%i5,	%o3
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
loop_170:
	sethi	0x1E04,	%l3
	movneg	%xcc,	%o1,	%i1
	or	%l5,	0x1B22,	%o4
	alignaddrl	%o5,	%i7,	%i0
	fmovrse	%l0,	%f31,	%f8
	nop
	setx	0x5DE635B7306E7C42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	udivx	%o7,	0x0CE8,	%i3
	fpack16	%f2,	%f31
	fbne,a	%fcc3,	loop_171
	brz,a	%g2,	loop_172
	fmovdvs	%xcc,	%f28,	%f22
	umul	%l4,	%i4,	%o2
loop_171:
	fandnot1s	%f16,	%f31,	%f24
loop_172:
	fmovd	%f8,	%f20
	movneg	%icc,	%g3,	%o6
	fbo	%fcc2,	loop_173
	sdiv	%g5,	0x056B,	%l1
	fornot1	%f14,	%f10,	%f2
	fbg	%fcc0,	loop_174
loop_173:
	array16	%i6,	%o0,	%g7
	stb	%i2,	[%l7 + 0x2B]
	sdivcc	%l6,	0x16CC,	%l2
loop_174:
	sdiv	%g6,	0x00A3,	%g1
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x04
	srlx	%o3,	0x01,	%g4
	umulcc	%l3,	0x1A83,	%i5
	ldd	[%l7 + 0x38],	%i0
	movrne	%o1,	0x0AE,	%o4
	nop
	fitod	%f6,	%f14
	fdtoi	%f14,	%f1
	ldsh	[%l7 + 0x40],	%o5
	ld	[%l7 + 0x58],	%f6
	addc	%i7,	0x0334,	%i0
	xor	%l0,	0x1EF1,	%o7
	movcc	%icc,	%l5,	%i3
	membar	0x31
	ta	%xcc,	0x5
	alignaddr	%l4,	%g2,	%i4
	tsubcctv	%o2,	%g3,	%o6
	movn	%icc,	%l1,	%i6
	tn	%icc,	0x0
	set	0x6A, %o5
	lduba	[%l7 + %o5] 0x15,	%o0
	fabss	%f28,	%f2
	lduh	[%l7 + 0x20],	%g5
	movneg	%xcc,	%i2,	%g7
	nop
	setx	0x80E61168B2B66A4B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x9518403D3BA7DF4A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f20,	%f20
	fbue	%fcc2,	loop_175
	orn	%l2,	0x1788,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x18,	%g1,	%g6
loop_175:
	fmovrslez	%o3,	%f0,	%f8
	umulcc	%l3,	%g4,	%i5
	fbue	%fcc1,	loop_176
	fblg,a	%fcc0,	loop_177
	movle	%icc,	%o1,	%i1
	udivx	%o4,	0x045C,	%o5
loop_176:
	lduw	[%l7 + 0x70],	%i0
loop_177:
	fmovsn	%xcc,	%f17,	%f23
	array32	%l0,	%o7,	%l5
	alignaddrl	%i7,	%i3,	%g2
	tleu	%xcc,	0x3
	smul	%l4,	0x0D35,	%i4
	set	0x0A, %l5
	lduha	[%l7 + %l5] 0x89,	%g3
	set	0x14, %g1
	lduwa	[%l7 + %g1] 0x89,	%o6
	movpos	%xcc,	%o2,	%l1
	andncc	%o0,	%i6,	%g5
	sir	0x016B
	te	%xcc,	0x4
	fpack32	%f26,	%f20,	%f20
	taddcctv	%i2,	0x0E09,	%g7
	srl	%l6,	0x1E,	%g1
	sdiv	%g6,	0x1C88,	%o3
	edge8ln	%l3,	%g4,	%i5
	move	%icc,	%l2,	%i1
	subc	%o1,	0x11CF,	%o4
	fmovdneg	%xcc,	%f11,	%f18
	tl	%xcc,	0x2
	srl	%i0,	0x17,	%l0
	nop
	set	0x68, %g6
	ldstub	[%l7 + %g6],	%o7
	brgz,a	%o5,	loop_178
	or	%i7,	%i3,	%g2
	tgu	%xcc,	0x1
	te	%xcc,	0x2
loop_178:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x70] %asi,	%l5
	sir	0x0258
	tvc	%icc,	0x3
	fsrc1	%f6,	%f10
	subccc	%l4,	%i4,	%o6
	bne,a	%xcc,	loop_179
	orncc	%o2,	0x00B9,	%l1
	fbul,a	%fcc2,	loop_180
	faligndata	%f2,	%f12,	%f16
loop_179:
	tcs	%xcc,	0x6
	wr	%g0,	0x10,	%asi
	sta	%f22,	[%l7 + 0x50] %asi
loop_180:
	bleu,a,pt	%xcc,	loop_181
	ba	%icc,	loop_182
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f31
	fnot2	%f2,	%f12
loop_181:
	fmovrsgez	%o0,	%f6,	%f2
loop_182:
	addc	%g3,	0x0A15,	%i6
	tgu	%xcc,	0x0
	nop
	setx	0x1CE3505A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x7D70ADF8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f11,	%f5
	fsrc2s	%f30,	%f6
	orn	%g5,	0x15BB,	%g7
	fbg	%fcc1,	loop_183
	fmovde	%xcc,	%f9,	%f8
	srax	%l6,	0x00,	%i2
	addcc	%g1,	0x1574,	%o3
loop_183:
	fnor	%f24,	%f4,	%f2
	addccc	%l3,	0x08C0,	%g6
	set	0x60, %g3
	ldsha	[%l7 + %g3] 0x0c,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_184
	sethi	0x1D3D,	%l2
	umulcc	%i5,	0x0F27,	%i1
	sdivx	%o1,	0x0F4B,	%o4
loop_184:
	nop
	fitod	%f2,	%f4
	fdtoi	%f4,	%f7
	bshuffle	%f8,	%f28,	%f6
	nop
	setx loop_185, %l0, %l1
	jmpl %l1, %l0
	ta	%icc,	0x1
	andncc	%o7,	%i0,	%o5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%i7
loop_185:
	udivcc	%i3,	0x051C,	%g2
	umul	%l4,	%i4,	%l5
	fbge,a	%fcc3,	loop_186
	sdivcc	%o6,	0x057A,	%l1
	movcc	%xcc,	%o2,	%o0
	fpackfix	%f20,	%f25
loop_186:
	ld	[%l7 + 0x7C],	%f2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%g5
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f6
	tcs	%xcc,	0x6
	andcc	%i6,	0x01FB,	%l6
	movne	%icc,	%g7,	%i2
	fbge	%fcc3,	loop_187
	edge8ln	%o3,	%g1,	%l3
	tsubcc	%g6,	0x008C,	%g4
	set	0x2A, %i0
	ldsba	[%l7 + %i0] 0x10,	%i5
loop_187:
	sll	%i1,	0x05,	%l2
	umul	%o1,	%l0,	%o7
	ba,pt	%xcc,	loop_188
	movge	%icc,	%o4,	%o5
	fbue	%fcc1,	loop_189
	fsrc2	%f2,	%f30
loop_188:
	fmovsneg	%xcc,	%f17,	%f18
	fpsub16s	%f14,	%f19,	%f8
loop_189:
	fble,a	%fcc0,	loop_190
	fmul8ulx16	%f18,	%f6,	%f2
	taddcctv	%i7,	0x0E53,	%i0
	edge8l	%g2,	%l4,	%i3
loop_190:
	alignaddrl	%i4,	%l5,	%l1
	xnorcc	%o6,	%o2,	%g3
	srlx	%g5,	0x0C,	%o0
	or	%l6,	0x0BE4,	%i6
	edge16	%i2,	%g7,	%g1
	fbg,a	%fcc0,	loop_191
	fblg	%fcc3,	loop_192
	tcs	%xcc,	0x2
	fmovdle	%icc,	%f25,	%f10
loop_191:
	fpack16	%f30,	%f15
loop_192:
	edge8	%o3,	%g6,	%l3
	fmovrdlez	%g4,	%f0,	%f6
	fandnot2s	%f8,	%f8,	%f9
	tcc	%xcc,	0x2
	movcs	%icc,	%i5,	%i1
	nop
	setx loop_193, %l0, %l1
	jmpl %l1, %o1
	tsubcc	%l2,	0x1A5B,	%l0
	fblg,a	%fcc3,	loop_194
	edge8	%o7,	%o4,	%i7
loop_193:
	fpadd32	%f6,	%f24,	%f22
	smul	%o5,	0x1E3A,	%g2
loop_194:
	tne	%icc,	0x4
	mova	%xcc,	%l4,	%i0
	smulcc	%i4,	0x094A,	%l5
	ld	[%l7 + 0x24],	%f25
	sllx	%l1,	0x0B,	%i3
	fabsd	%f18,	%f20
	bvs	%icc,	loop_195
	add	%o6,	%g3,	%o2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
loop_195:
	edge16n	%g5,	%i6,	%i2
	addcc	%l6,	0x1124,	%g1
	fmul8ulx16	%f2,	%f26,	%f28
	brgz	%g7,	loop_196
	tvc	%icc,	0x0
	subc	%g6,	0x01A1,	%l3
	ldd	[%l7 + 0x50],	%g4
loop_196:
	fbl,a	%fcc2,	loop_197
	srax	%o3,	%i5,	%i1
	tvc	%xcc,	0x5
	fpack32	%f22,	%f28,	%f4
loop_197:
	ldx	[%l7 + 0x10],	%l2
	movrgz	%l0,	0x219,	%o7
	subccc	%o1,	0x002B,	%i7
	tge	%xcc,	0x6
	srlx	%o5,	0x04,	%o4
	taddcctv	%g2,	0x0456,	%i0
	movn	%icc,	%l4,	%i4
	fabss	%f21,	%f23
	nop
	setx	0x3E341694,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x36C59203,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f30,	%f29
	nop
	setx	loop_198,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f1,	%f26
	bpos,pt	%icc,	loop_199
	ldstub	[%l7 + 0x20],	%l5
loop_198:
	tpos	%xcc,	0x7
	tsubcctv	%i3,	%l1,	%o6
loop_199:
	movvc	%icc,	%o2,	%g3
	movre	%g5,	%o0,	%i2
	ta	%icc,	0x1
	ldx	[%l7 + 0x60],	%i6
	taddcc	%g1,	%l6,	%g6
	set	0x3E, %o3
	lduha	[%l7 + %o3] 0x80,	%g7
	ldstub	[%l7 + 0x37],	%l3
	ldsh	[%l7 + 0x24],	%o3
	fmul8ulx16	%f26,	%f2,	%f14
	srax	%g4,	0x1B,	%i5
	taddcc	%i1,	0x0FD8,	%l0
	fpadd16	%f24,	%f8,	%f12
	or	%l2,	0x14E9,	%o7
	movn	%xcc,	%o1,	%o5
	taddcctv	%o4,	0x06C8,	%g2
	umul	%i7,	0x1CA3,	%l4
	te	%xcc,	0x5
	edge8	%i0,	%l5,	%i4
	stx	%l1,	[%l7 + 0x48]
	orncc	%o6,	%i3,	%o2
	sth	%g5,	[%l7 + 0x48]
	tg	%icc,	0x6
	movg	%icc,	%o0,	%g3
	nop
	setx	0xE050BEDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	udiv	%i2,	0x0945,	%i6
	edge16	%l6,	%g6,	%g1
	nop
	setx	0x8C30E9C80044A317,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	edge32l	%g7,	%l3,	%g4
	bge,a	loop_200
	fcmple16	%f14,	%f18,	%o3
	bcc,pt	%icc,	loop_201
	nop
	set	0x64, %g5
	prefetch	[%l7 + %g5],	 0x0
loop_200:
	tl	%xcc,	0x2
	movgu	%icc,	%i1,	%l0
loop_201:
	fand	%f28,	%f18,	%f30
	fmul8x16al	%f12,	%f14,	%f12
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0x1
	tl	%xcc,	0x4
	fmovdcs	%xcc,	%f0,	%f12
	nop
	setx	loop_202,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%o7,	%o1,	%o5
	or	%i5,	0x14FA,	%g2
	sdivx	%o4,	0x0401,	%l4
loop_202:
	nop
	set	0x7D, %i3
	stb	%i7,	[%l7 + %i3]
	ldx	[%l7 + 0x28],	%l5
	tcs	%icc,	0x4
	subccc	%i0,	0x134D,	%l1
	edge8l	%o6,	%i3,	%o2
	fbn	%fcc2,	loop_203
	fmovrse	%g5,	%f10,	%f0
	srax	%o0,	%g3,	%i4
	smul	%i6,	0x19B0,	%i2
loop_203:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x48] %asi,	%g6
	tleu	%xcc,	0x4
	sth	%g1,	[%l7 + 0x08]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l6,	0x0AAC,	%g7
	sethi	0x0DA8,	%g4
	sdivcc	%l3,	0x18B1,	%o3
	xorcc	%l0,	0x19BB,	%i1
	tne	%xcc,	0x6
	swap	[%l7 + 0x10],	%l2
	edge32	%o1,	%o5,	%o7
	tvs	%icc,	0x7
	taddcc	%i5,	0x020B,	%o4
	srax	%g2,	%l4,	%l5
	fmovsvs	%xcc,	%f17,	%f18
	or	%i7,	0x17B1,	%l1
	fbge,a	%fcc1,	loop_204
	bleu,a	loop_205
	movg	%xcc,	%o6,	%i0
	umul	%o2,	%i3,	%g5
loop_204:
	subcc	%g3,	%o0,	%i4
loop_205:
	tneg	%icc,	0x6
	movge	%icc,	%i2,	%g6
	ldsw	[%l7 + 0x4C],	%g1
	tleu	%icc,	0x0
	bleu,a,pn	%xcc,	loop_206
	addccc	%l6,	0x1714,	%g7
	srax	%g4,	0x14,	%l3
	fbue	%fcc3,	loop_207
loop_206:
	array32	%i6,	%o3,	%l0
	edge8ln	%i1,	%l2,	%o5
	ble,a	%icc,	loop_208
loop_207:
	edge16n	%o1,	%i5,	%o4
	nop
	setx	loop_209,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%g2,	0x0D,	%l4
loop_208:
	movvc	%xcc,	%o7,	%i7
	movl	%icc,	%l1,	%o6
loop_209:
	fnot1s	%f16,	%f2
	fzeros	%f11
	srl	%l5,	%i0,	%o2
	tgu	%xcc,	0x1
	taddcctv	%i3,	%g5,	%o0
	set	0x4A, %i7
	lduha	[%l7 + %i7] 0x18,	%i4
	fmovdn	%icc,	%f30,	%f11
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x1e,	%f16
	fpsub16s	%f11,	%f17,	%f4
	fpadd32	%f24,	%f6,	%f24
	nop
	fitos	%f13,	%f10
	fstox	%f10,	%f18
	bcs	%icc,	loop_210
	nop
	setx loop_211, %l0, %l1
	jmpl %l1, %i2
	mulscc	%g6,	%g1,	%l6
	set	0x3E, %o0
	ldsha	[%l7 + %o0] 0x80,	%g7
loop_210:
	sll	%g4,	0x0A,	%l3
loop_211:
	edge16n	%i6,	%o3,	%l0
	subcc	%g3,	0x00D0,	%i1
	edge16	%o5,	%o1,	%l2
	subc	%i5,	%g2,	%o4
	movne	%icc,	%o7,	%l4
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf1
	membar	#Sync
	wr	%g0,	0x23,	%asi
	stba	%i7,	[%l7 + 0x33] %asi
	membar	#Sync
	xorcc	%o6,	%l5,	%l1
	array8	%o2,	%i0,	%g5
	fmovsvs	%xcc,	%f0,	%f8
	srax	%i3,	%o0,	%i4
	srlx	%i2,	%g1,	%g6
	fbul,a	%fcc3,	loop_212
	tcc	%icc,	0x7
	ldx	[%l7 + 0x50],	%g7
	tge	%icc,	0x7
loop_212:
	edge32l	%l6,	%g4,	%l3
	fmovsvc	%icc,	%f22,	%f17
	ld	[%l7 + 0x10],	%f31
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x68] %asi
	tvc	%icc,	0x7
	ldx	[%l7 + 0x78],	%i6
	movvs	%icc,	%l0,	%o3
	udivx	%i1,	0x0DC8,	%o5
	brlez	%g3,	loop_213
	movgu	%icc,	%l2,	%o1
	wr	%g0,	0xeb,	%asi
	stxa	%g2,	[%l7 + 0x60] %asi
	membar	#Sync
loop_213:
	fpsub16s	%f18,	%f14,	%f20
	fornot2	%f10,	%f30,	%f18
	movge	%xcc,	%o4,	%o7
	alignaddrl	%l4,	%i5,	%o6
	array32	%l5,	%i7,	%l1
	te	%xcc,	0x7
	fzero	%f6
	std	%f8,	[%l7 + 0x08]
	prefetch	[%l7 + 0x30],	 0x3
	sth	%o2,	[%l7 + 0x2E]
	fmovdvs	%xcc,	%f6,	%f14
	fors	%f2,	%f16,	%f10
	orn	%i0,	%g5,	%i3
	movn	%xcc,	%o0,	%i4
	fpsub32s	%f10,	%f17,	%f8
	fmovsneg	%icc,	%f16,	%f13
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%g1
	nop
	setx	0xF3005306,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x45B0CCCD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f22,	%f18
	movle	%xcc,	%g7,	%l6
	movrgz	%g6,	%l3,	%i6
	fmovrsne	%l0,	%f27,	%f10
	nop
	setx	0xB04A3EE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	tg	%icc,	0x0
	and	%o3,	%i1,	%o5
	array32	%g4,	%g3,	%l2
	membar	0x3D
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x19,	 0x2
	tg	%icc,	0x7
	fbe,a	%fcc2,	loop_214
	addcc	%o1,	%o7,	%l4
	swap	[%l7 + 0x78],	%i5
	fbne,a	%fcc3,	loop_215
loop_214:
	nop
	set	0x32, %o2
	sth	%o4,	[%l7 + %o2]
	fmovrslez	%o6,	%f5,	%f22
	sub	%i7,	0x0646,	%l1
loop_215:
	and	%o2,	0x02DC,	%i0
	edge8ln	%g5,	%l5,	%o0
	orncc	%i3,	%i4,	%i2
	sir	0x0D21
	edge8l	%g7,	%l6,	%g6
	and	%g1,	0x0ABC,	%l3
	movpos	%xcc,	%i6,	%l0
	tvc	%xcc,	0x4
	ldd	[%l7 + 0x48],	%i0
	bcs,a	%icc,	loop_216
	call	loop_217
	sra	%o5,	0x10,	%o3
	tleu	%icc,	0x0
loop_216:
	nop
	setx	0xF06411CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
loop_217:
	movl	%icc,	%g4,	%l2
	movleu	%xcc,	%g2,	%o1
	tle	%xcc,	0x7
	alignaddr	%o7,	%l4,	%g3
	st	%f23,	[%l7 + 0x28]
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i5
	andcc	%o4,	%o6,	%i7
	fzero	%f4
	nop
	setx	loop_218,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l1,	%i0,	%g5
	subc	%l5,	0x1847,	%o2
	st	%f9,	[%l7 + 0x28]
loop_218:
	movgu	%xcc,	%i3,	%i4
	array8	%o0,	%g7,	%i2
	brlez	%l6,	loop_219
	udiv	%g6,	0x199D,	%l3
	movrlz	%g1,	%i6,	%l0
	movcs	%icc,	%o5,	%i1
loop_219:
	nop
	setx	0x0316D621,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x2944C763,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f21,	%f17
	fcmpne16	%f20,	%f16,	%g4
	udivx	%l2,	0x036D,	%g2
	stw	%o1,	[%l7 + 0x5C]
	fmovsl	%xcc,	%f15,	%f26
	fmovrsgz	%o3,	%f10,	%f16
	fbl,a	%fcc3,	loop_220
	nop
	fitos	%f2,	%f29
	fstoi	%f29,	%f23
	mova	%xcc,	%o7,	%l4
	stb	%i5,	[%l7 + 0x4C]
loop_220:
	addcc	%g3,	%o6,	%i7
	ta	%xcc,	0x6
	pdist	%f2,	%f20,	%f26
	fmovdcc	%icc,	%f6,	%f0
	andncc	%l1,	%o4,	%g5
	fmovsvc	%icc,	%f0,	%f13
	fbl	%fcc0,	loop_221
	fpsub16s	%f27,	%f8,	%f5
	edge8	%i0,	%o2,	%i3
	sll	%i4,	0x17,	%o0
loop_221:
	nop
	setx	0x087FFDE365456146,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x51BBE42E90A562CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f30,	%f22
	movrlz	%g7,	%l5,	%l6
	te	%xcc,	0x2
	fbul	%fcc3,	loop_222
	andncc	%i2,	%l3,	%g6
	smul	%i6,	%l0,	%g1
	nop
	setx loop_223, %l0, %l1
	jmpl %l1, %o5
loop_222:
	fmovsgu	%xcc,	%f24,	%f10
	udiv	%g4,	0x05E3,	%l2
	movleu	%icc,	%i1,	%o1
loop_223:
	array32	%o3,	%g2,	%l4
	edge32ln	%i5,	%g3,	%o6
	tle	%icc,	0x3
	fbug	%fcc3,	loop_224
	edge16ln	%i7,	%l1,	%o7
	edge8	%g5,	%i0,	%o4
	nop
	setx	0x607D7456,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
loop_224:
	movrgz	%o2,	0x324,	%i4
	movrlz	%i3,	0x2B3,	%g7
	tge	%icc,	0x3
	sir	0x0BED
	fmuld8ulx16	%f12,	%f16,	%f0
	movne	%xcc,	%o0,	%l5
	st	%f12,	[%l7 + 0x50]
	tge	%icc,	0x0
	movle	%icc,	%i2,	%l6
	mova	%icc,	%l3,	%i6
	sdivx	%g6,	0x020B,	%g1
	fmovsne	%icc,	%f1,	%f21
	subcc	%o5,	0x1779,	%l0
	edge32l	%l2,	%g4,	%o1
	movrgez	%i1,	%g2,	%l4
	mova	%icc,	%i5,	%o3
	wr	%g0,	0x81,	%asi
	stxa	%o6,	[%l7 + 0x08] %asi
	tsubcctv	%g3,	0x0FCB,	%i7
	sll	%l1,	%o7,	%i0
	fmovsle	%xcc,	%f0,	%f31
	edge8ln	%o4,	%g5,	%o2
	nop
	set	0x57, %g4
	stb	%i4,	[%l7 + %g4]
	fmovscs	%icc,	%f3,	%f4
	fmovdgu	%xcc,	%f10,	%f5
	set	0x2C, %o7
	swapa	[%l7 + %o7] 0x89,	%g7
	fmovdpos	%icc,	%f2,	%f20
	tvs	%icc,	0x6
	edge8ln	%i3,	%o0,	%i2
	addccc	%l6,	0x0272,	%l5
	bg,a	loop_225
	ldstub	[%l7 + 0x36],	%i6
	alignaddrl	%l3,	%g1,	%g6
	fmovsvs	%icc,	%f26,	%f26
loop_225:
	bvs,a	%icc,	loop_226
	fpadd16	%f30,	%f14,	%f8
	move	%xcc,	%l0,	%o5
	tcc	%icc,	0x0
loop_226:
	std	%f10,	[%l7 + 0x78]
	fmovdl	%xcc,	%f22,	%f16
	tsubcc	%g4,	%l2,	%o1
	fmovrde	%g2,	%f26,	%f22
	edge32n	%l4,	%i1,	%o3
	fnot1s	%f25,	%f3
	fandnot1s	%f15,	%f30,	%f4
	nop
	setx	0x8FEDE837,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x11DEB0BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f26,	%f5
	xorcc	%o6,	%i5,	%g3
	movneg	%icc,	%l1,	%i7
	movne	%icc,	%i0,	%o4
	srl	%g5,	0x05,	%o7
	movre	%i4,	0x088,	%g7
	tne	%xcc,	0x4
	fbl	%fcc3,	loop_227
	smulcc	%i3,	%o2,	%o0
	movg	%xcc,	%i2,	%l5
	array16	%i6,	%l3,	%g1
loop_227:
	ld	[%l7 + 0x70],	%f6
	fmul8x16au	%f5,	%f14,	%f20
	edge8n	%g6,	%l0,	%l6
	array8	%g4,	%o5,	%o1
	tsubcctv	%g2,	%l4,	%i1
	xorcc	%o3,	0x0482,	%l2
	smul	%o6,	%g3,	%l1
	fcmpgt16	%f18,	%f0,	%i5
	movrlz	%i0,	%i7,	%o4
	edge8l	%o7,	%g5,	%i4
	fsrc2s	%f19,	%f3
	movrlez	%i3,	%o2,	%g7
	srl	%o0,	%l5,	%i2
	alignaddrl	%l3,	%i6,	%g1
	tn	%xcc,	0x5
	array8	%g6,	%l6,	%l0
	addcc	%o5,	0x0D11,	%g4
	sdivx	%o1,	0x0694,	%g2
	movcs	%xcc,	%l4,	%i1
	set	0x4C, %i2
	swapa	[%l7 + %i2] 0x19,	%l2
	subccc	%o3,	%o6,	%g3
	taddcc	%l1,	0x1600,	%i5
	fsrc2s	%f30,	%f17
	nop
	setx	0xF4C6C592,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f12
	fpack32	%f0,	%f20,	%f22
	movrlz	%i7,	%i0,	%o4
	nop
	fitos	%f11,	%f29
	nop
	setx	0xF8E78DEB245E6C14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f12
	fmovsne	%xcc,	%f28,	%f3
	call	loop_228
	ldsw	[%l7 + 0x14],	%g5
	tne	%xcc,	0x5
	fzero	%f30
loop_228:
	fabss	%f2,	%f18
	fble,a	%fcc1,	loop_229
	bshuffle	%f24,	%f0,	%f22
	fmovrsgz	%o7,	%f4,	%f12
	tne	%icc,	0x1
loop_229:
	nop
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x18,	 0x0
	sethi	0x1AE1,	%o2
	andn	%g7,	%o0,	%i3
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%f2
	fands	%f26,	%f5,	%f9
	subccc	%l5,	%l3,	%i2
	nop
	fitod	%f2,	%f12
	fdtoi	%f12,	%f30
	bshuffle	%f18,	%f20,	%f14
	fbe,a	%fcc1,	loop_230
	udivcc	%i6,	0x1887,	%g1
	srax	%l6,	0x19,	%l0
	ta	%icc,	0x5
loop_230:
	srlx	%g6,	0x09,	%o5
	tneg	%icc,	0x3
	bn,a	loop_231
	stx	%g4,	[%l7 + 0x30]
	array8	%o1,	%g2,	%l4
	membar	0x1E
loop_231:
	fmovd	%f28,	%f30
	movrgez	%i1,	0x3BF,	%o3
	fbo	%fcc3,	loop_232
	fcmpne16	%f12,	%f8,	%o6
	move	%xcc,	%g3,	%l2
	edge8	%l1,	%i7,	%i5
loop_232:
	movge	%icc,	%i0,	%g5
	fmovdl	%icc,	%f27,	%f30
	tcs	%xcc,	0x0
	movl	%xcc,	%o7,	%i4
	tl	%xcc,	0x6
	fexpand	%f0,	%f10
	tcs	%xcc,	0x1
	nop
	set	0x40, %l6
	ldub	[%l7 + %l6],	%o2
	set	0x34, %i4
	stwa	%g7,	[%l7 + %i4] 0x11
	fbn	%fcc3,	loop_233
	edge32l	%o0,	%o4,	%i3
	subccc	%l5,	0x0284,	%i2
	tne	%xcc,	0x6
loop_233:
	edge16n	%i6,	%l3,	%l6
	edge8n	%l0,	%g1,	%o5
	sdivcc	%g4,	0x1BBA,	%g6
	set	0x08, %o1
	stxa	%o1,	[%l7 + %o1] 0x18
	movn	%xcc,	%g2,	%i1
	movvc	%xcc,	%l4,	%o3
	srlx	%o6,	0x03,	%g3
	edge32ln	%l2,	%l1,	%i7
	umulcc	%i0,	%i5,	%g5
	fxnor	%f12,	%f28,	%f22
	sra	%o7,	%i4,	%o2
	std	%f18,	[%l7 + 0x60]
	udivcc	%g7,	0x096C,	%o0
	smul	%o4,	0x0DC1,	%i3
	smulcc	%i2,	0x1F39,	%l5
	tsubcc	%i6,	0x006C,	%l3
	fmovscc	%icc,	%f24,	%f27
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%l6
	orncc	%l0,	0x1A04,	%g1
	ld	[%l7 + 0x78],	%f2
	sdivx	%g4,	0x1B0C,	%o5
	fblg,a	%fcc3,	loop_234
	fabsd	%f18,	%f28
	edge16ln	%g6,	%o1,	%g2
	subccc	%i1,	%l4,	%o6
loop_234:
	andncc	%g3,	%l2,	%o3
	array8	%i7,	%i0,	%i5
	orncc	%l1,	%o7,	%g5
	movrne	%o2,	%g7,	%i4
	fnegd	%f14,	%f12
	sdivx	%o4,	0x15EB,	%i3
	fbu,a	%fcc3,	loop_235
	movneg	%icc,	%i2,	%l5
	tvs	%icc,	0x0
	smulcc	%o0,	%i6,	%l3
loop_235:
	nop
	fitod	%f0,	%f28
	fdtoi	%f28,	%f10
	edge16l	%l6,	%g1,	%l0
	bn,a	%xcc,	loop_236
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f10
	umulcc	%o5,	0x104A,	%g4
loop_236:
	movvs	%xcc,	%o1,	%g2
	stw	%g6,	[%l7 + 0x30]
	fpadd32s	%f19,	%f18,	%f5
	movgu	%xcc,	%l4,	%i1
	movpos	%xcc,	%g3,	%l2
	ble,a,pt	%icc,	loop_237
	orncc	%o6,	0x1584,	%o3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_237:
	movrlez	%i7,	0x3CE,	%i5
	udivcc	%i0,	0x092E,	%l1
	movneg	%xcc,	%g5,	%o7
	sllx	%o2,	0x02,	%g7
	fornot1s	%f4,	%f3,	%f16
	nop
	setx	0xB5721E6CB2921EAF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x0593255C6C704782,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f22,	%f20
	edge8l	%i4,	%i3,	%o4
	movneg	%icc,	%l5,	%o0
	tge	%xcc,	0x0
	add	%i2,	%l3,	%i6
	sdiv	%l6,	0x0AF7,	%l0
	set	0x56, %l4
	stba	%o5,	[%l7 + %l4] 0xe3
	membar	#Sync
	srax	%g4,	0x0D,	%g1
	std	%f2,	[%l7 + 0x40]
	fmovsn	%icc,	%f28,	%f22
	edge32	%g2,	%g6,	%l4
	fpsub16	%f4,	%f22,	%f12
	xnor	%i1,	0x16D8,	%g3
	fbo,a	%fcc2,	loop_238
	edge32n	%l2,	%o1,	%o3
	movrne	%i7,	0x23A,	%o6
	fmovrsgz	%i0,	%f26,	%f10
loop_238:
	edge16n	%i5,	%l1,	%g5
	fmovs	%f1,	%f30
	fmovrse	%o2,	%f10,	%f17
	flush	%l7 + 0x60
	stbar
	wr	%g0,	0x10,	%asi
	stxa	%o7,	[%l7 + 0x70] %asi
	movrgez	%g7,	%i3,	%o4
	call	loop_239
	fpack32	%f30,	%f16,	%f0
	movleu	%xcc,	%l5,	%i4
	set	0x48, %l3
	stba	%i2,	[%l7 + %l3] 0x2b
	membar	#Sync
loop_239:
	sir	0x1739
	nop
	fitod	%f4,	%f30
	fdtoi	%f30,	%f28
	fpsub16	%f8,	%f8,	%f18
	be,a	%xcc,	loop_240
	ta	%xcc,	0x4
	nop
	fitod	%f10,	%f18
	fdtoi	%f18,	%f2
	lduh	[%l7 + 0x56],	%o0
loop_240:
	subc	%l3,	%i6,	%l6
	array8	%o5,	%l0,	%g1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%g4
	addc	%g2,	0x12D1,	%l4
	fpadd32	%f28,	%f30,	%f16
	ba,pn	%icc,	loop_241
	te	%icc,	0x1
	fmovrdlz	%g6,	%f22,	%f0
	set	0x46, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i1
loop_241:
	udivcc	%l2,	0x0172,	%g3
	tn	%xcc,	0x4
	edge16l	%o3,	%o1,	%i7
	bge,pn	%xcc,	loop_242
	addc	%o6,	0x1298,	%i0
	fmovde	%icc,	%f31,	%f8
	fbue	%fcc3,	loop_243
loop_242:
	udivcc	%l1,	0x09E0,	%i5
	fpsub16s	%f29,	%f8,	%f29
	movrne	%o2,	%g5,	%o7
loop_243:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x52] %asi,	%g7
	edge32l	%o4,	%l5,	%i3
	edge16l	%i2,	%i4,	%l3
	edge8n	%o0,	%i6,	%o5
	fpadd32	%f24,	%f20,	%f26
	sdivx	%l6,	0x00BB,	%g1
	movne	%icc,	%g4,	%l0
	fandnot2	%f10,	%f14,	%f18
	movvc	%icc,	%l4,	%g6
	set	0x45, %i1
	lduba	[%l7 + %i1] 0x19,	%g2
	movg	%xcc,	%i1,	%l2
	nop
	setx	0xBD488F54,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f13
	andncc	%o3,	%g3,	%o1
	sub	%o6,	%i0,	%l1
	fmovs	%f22,	%f5
	wr	%g0,	0x10,	%asi
	stba	%i5,	[%l7 + 0x6C] %asi
	andcc	%o2,	%g5,	%o7
	move	%xcc,	%i7,	%o4
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f26
	array32	%g7,	%i3,	%l5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	addccc	%i2,	%l3,	%i6
	edge32l	%o5,	%l6,	%o0
	faligndata	%f6,	%f12,	%f4
	fbge	%fcc1,	loop_244
	fmovdvc	%xcc,	%f28,	%f16
	mulscc	%g1,	0x0076,	%l0
	bneg,pt	%icc,	loop_245
loop_244:
	fands	%f13,	%f22,	%f9
	fbuge,a	%fcc3,	loop_246
	taddcctv	%l4,	0x0688,	%g6
loop_245:
	ldd	[%l7 + 0x18],	%f2
	ldsb	[%l7 + 0x33],	%g2
loop_246:
	tle	%xcc,	0x2
	tcs	%icc,	0x7
	fmovdl	%icc,	%f18,	%f17
	smulcc	%i1,	%l2,	%g4
	movgu	%icc,	%g3,	%o3
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x81,	%o6
	subcc	%o1,	%l1,	%i0
	fmovdl	%xcc,	%f21,	%f10
	brgz	%i5,	loop_247
	srax	%o2,	%g5,	%i7
	tg	%icc,	0x7
	fmovdleu	%icc,	%f16,	%f25
loop_247:
	array16	%o4,	%o7,	%i3
	srlx	%l5,	%g7,	%i2
	tvs	%icc,	0x5
	fmovdne	%xcc,	%f17,	%f21
	sra	%i4,	0x17,	%l3
	alignaddrl	%i6,	%l6,	%o0
	bneg	%icc,	loop_248
	edge16ln	%o5,	%g1,	%l4
	movl	%xcc,	%g6,	%l0
	srl	%g2,	%l2,	%g4
loop_248:
	orcc	%i1,	0x0CE9,	%g3
	fba	%fcc1,	loop_249
	subc	%o6,	%o1,	%l1
	fzero	%f18
	fpadd16s	%f31,	%f10,	%f26
loop_249:
	nop
	set	0x48, %o5
	stxa	%o3,	[%l7 + %o5] 0x15
	nop
	setx	0xB0B07FFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f19
	udivcc	%i5,	0x0121,	%o2
	taddcc	%g5,	%i0,	%i7
	taddcctv	%o7,	%o4,	%l5
	bleu,a	loop_250
	st	%f16,	[%l7 + 0x30]
	fmovdleu	%xcc,	%f29,	%f30
	fornot1	%f24,	%f10,	%f30
loop_250:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x5C] %asi,	%f31
	popc	0x1EAC,	%i3
	taddcc	%i2,	0x0129,	%i4
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f7
	te	%icc,	0x4
	fbule,a	%fcc1,	loop_251
	edge8l	%g7,	%i6,	%l3
	bcs,a,pn	%xcc,	loop_252
	tcc	%icc,	0x3
loop_251:
	mulx	%o0,	0x0E22,	%l6
	movvs	%xcc,	%o5,	%l4
loop_252:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%g1
	or	%l0,	0x1673,	%g6
	tsubcctv	%g2,	%g4,	%i1
	fcmpeq32	%f6,	%f16,	%g3
	subccc	%l2,	%o1,	%o6
	fmovspos	%icc,	%f10,	%f3
	subcc	%l1,	0x0F8C,	%i5
	andncc	%o3,	%g5,	%i0
	orn	%i7,	%o2,	%o4
	andcc	%l5,	%o7,	%i2
	fbue,a	%fcc1,	loop_253
	edge8l	%i3,	%i4,	%i6
	edge8l	%g7,	%o0,	%l6
	set	0x51, %i5
	stba	%o5,	[%l7 + %i5] 0x11
loop_253:
	fbule,a	%fcc0,	loop_254
	mulx	%l4,	%g1,	%l3
	brlez	%l0,	loop_255
	fpadd32	%f6,	%f8,	%f26
loop_254:
	fmovdneg	%xcc,	%f28,	%f14
	udivx	%g6,	0x1499,	%g4
loop_255:
	brlez	%i1,	loop_256
	and	%g3,	0x0F23,	%l2
	brgz	%o1,	loop_257
	fnot1s	%f16,	%f0
loop_256:
	movrgz	%g2,	%l1,	%o6
	fsrc2s	%f22,	%f16
loop_257:
	nop
	setx loop_258, %l0, %l1
	jmpl %l1, %i5
	sdivcc	%g5,	0x1878,	%i0
	fsrc1	%f14,	%f28
	fmovdg	%icc,	%f22,	%f12
loop_258:
	popc	0x0130,	%i7
	fone	%f4
	tsubcc	%o3,	%o4,	%l5
	movleu	%xcc,	%o2,	%o7
	fmul8sux16	%f0,	%f4,	%f20
	udivcc	%i3,	0x1944,	%i2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x4C] %asi,	%f24
	udivx	%i6,	0x0E3A,	%i4
	edge16ln	%g7,	%o0,	%o5
	udivx	%l4,	0x167C,	%l6
	fmovse	%icc,	%f23,	%f0
	movrlz	%g1,	0x03A,	%l0
	addccc	%l3,	%g4,	%g6
	bcs,a,pn	%icc,	loop_259
	fmul8x16	%f25,	%f0,	%f8
	fexpand	%f18,	%f20
	fmuld8sux16	%f6,	%f9,	%f20
loop_259:
	ldstub	[%l7 + 0x34],	%g3
	orncc	%i1,	0x0E51,	%o1
	udivcc	%l2,	0x1565,	%l1
	stw	%g2,	[%l7 + 0x6C]
	sdivx	%i5,	0x0831,	%o6
	be,a,pt	%xcc,	loop_260
	alignaddrl	%i0,	%i7,	%g5
	xnor	%o3,	%l5,	%o2
	tge	%icc,	0x5
loop_260:
	nop
	setx	0xB3962692,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xDBA5BAE9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f8,	%f23
	fornot2s	%f24,	%f7,	%f14
	nop
	setx	0xA8A787C9304E2532,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	orcc	%o4,	0x12D1,	%i3
	tvs	%icc,	0x0
	srlx	%o7,	%i6,	%i4
	fmovsvs	%xcc,	%f0,	%f1
	fmul8x16al	%f14,	%f1,	%f4
	xnor	%g7,	%i2,	%o5
	sdiv	%o0,	0x07F9,	%l4
	stb	%l6,	[%l7 + 0x3E]
	sdivcc	%l0,	0x1714,	%l3
	andn	%g1,	0x024E,	%g6
	edge16l	%g3,	%g4,	%o1
	ldub	[%l7 + 0x0C],	%i1
	and	%l2,	%l1,	%g2
	taddcc	%i5,	0x0531,	%i0
	subccc	%i7,	0x1CD9,	%g5
	move	%icc,	%o6,	%l5
	fnands	%f31,	%f3,	%f6
	move	%icc,	%o2,	%o4
	edge8n	%i3,	%o7,	%o3
	edge16l	%i6,	%g7,	%i2
	tn	%icc,	0x1
	movl	%xcc,	%i4,	%o5
	movle	%icc,	%o0,	%l4
	subccc	%l0,	0x068B,	%l6
	fsrc1s	%f1,	%f9
	movrgez	%l3,	0x136,	%g6
	fmovse	%xcc,	%f13,	%f8
	movge	%icc,	%g1,	%g3
	fsrc2s	%f11,	%f29
	nop
	setx	loop_261,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bleu,pt	%xcc,	loop_262
	orcc	%o1,	%i1,	%l2
	fxnor	%f12,	%f24,	%f18
loop_261:
	brnz	%g4,	loop_263
loop_262:
	tl	%xcc,	0x0
	stw	%g2,	[%l7 + 0x28]
	fbue	%fcc0,	loop_264
loop_263:
	te	%xcc,	0x0
	edge8ln	%i5,	%i0,	%l1
	bg	%icc,	loop_265
loop_264:
	tleu	%xcc,	0x1
	movleu	%icc,	%i7,	%g5
	edge8n	%o6,	%l5,	%o4
loop_265:
	add	%o2,	%i3,	%o3
	nop
	setx	0xA07A4786,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	tne	%icc,	0x2
	fbne	%fcc1,	loop_266
	fandnot1s	%f15,	%f29,	%f12
	movrne	%o7,	0x104,	%i6
	call	loop_267
loop_266:
	smul	%i2,	%g7,	%i4
	movrne	%o5,	%o0,	%l0
	movl	%icc,	%l4,	%l3
loop_267:
	udivx	%g6,	0x1EB7,	%g1
	tg	%xcc,	0x4
	movvc	%xcc,	%l6,	%o1
	tsubcctv	%i1,	%l2,	%g4
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f0
	alignaddr	%g3,	%i5,	%i0
	fbu	%fcc2,	loop_268
	tleu	%xcc,	0x7
	tsubcctv	%g2,	0x1647,	%i7
	movle	%icc,	%l1,	%o6
loop_268:
	fmul8ulx16	%f16,	%f8,	%f20
	subc	%l5,	%g5,	%o4
	movge	%xcc,	%o2,	%o3
	edge8	%i3,	%i6,	%i2
	edge32l	%g7,	%o7,	%i4
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
	fbne	%fcc0,	loop_269
	edge32l	%o5,	%l4,	%l3
	srax	%l0,	%g1,	%g6
	fblg	%fcc3,	loop_270
loop_269:
	bcs,pt	%icc,	loop_271
	movne	%icc,	%l6,	%i1
	movle	%icc,	%l2,	%o1
loop_270:
	fbug,a	%fcc2,	loop_272
loop_271:
	orncc	%g3,	%i5,	%i0
	sth	%g4,	[%l7 + 0x1E]
	orcc	%g2,	%i7,	%o6
loop_272:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%l1,	%g5
	edge8	%o4,	%o3,	%i3
	srax	%i6,	%i2,	%g7
	smul	%o7,	%o2,	%o0
	fcmpne16	%f26,	%f0,	%o5
	tpos	%icc,	0x4
	tcs	%icc,	0x5
	or	%l4,	%i4,	%l3
	orcc	%g1,	0x1E57,	%g6
	andncc	%l0,	%l6,	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%g3
	fmovdge	%xcc,	%f26,	%f1
	brgez,a	%i1,	loop_273
	add	%i0,	%g4,	%i5
	set	0x68, %l5
	stxa	%g2,	[%l7 + %l5] 0xea
	membar	#Sync
loop_273:
	edge32ln	%o6,	%i7,	%l1
	srlx	%g5,	0x07,	%l5
	or	%o3,	0x1DB3,	%i3
	movcc	%icc,	%o4,	%i2
	movrlz	%i6,	%o7,	%g7
	fbug,a	%fcc1,	loop_274
	sir	0x02B5
	edge16	%o2,	%o0,	%o5
	srl	%l4,	%i4,	%l3
loop_274:
	bleu	loop_275
	edge16l	%g1,	%g6,	%l6
	fsrc1s	%f3,	%f5
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f12
loop_275:
	bge,pn	%icc,	loop_276
	xnor	%l2,	%o1,	%l0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x6E] %asi,	%i1
loop_276:
	bvs,a,pn	%xcc,	loop_277
	fmovrsgz	%g3,	%f27,	%f14
	brnz	%i0,	loop_278
	tgu	%xcc,	0x3
loop_277:
	sll	%g4,	0x0B,	%g2
	edge16l	%i5,	%i7,	%l1
loop_278:
	subcc	%o6,	%l5,	%g5
	xorcc	%i3,	%o3,	%o4
	movl	%xcc,	%i6,	%o7
	umul	%g7,	0x1A0F,	%i2
	fnands	%f6,	%f1,	%f12
	fsrc1s	%f16,	%f7
	sub	%o0,	%o5,	%l4
	bl,a	%icc,	loop_279
	fmovrde	%o2,	%f8,	%f20
	orn	%l3,	%i4,	%g6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x54] %asi,	%f14
loop_279:
	fcmple32	%f14,	%f28,	%g1
	nop
	setx loop_280, %l0, %l1
	jmpl %l1, %l2
	subc	%o1,	%l6,	%l0
	movge	%xcc,	%i1,	%i0
	andn	%g3,	%g4,	%g2
loop_280:
	nop
	setx	loop_281,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%i5,	%l1,	%o6
	movn	%xcc,	%l5,	%i7
	or	%g5,	%i3,	%o3
loop_281:
	sir	0x10FD
	smul	%o4,	%i6,	%g7
	fmul8x16al	%f3,	%f1,	%f26
	fcmpgt32	%f6,	%f30,	%o7
	sdiv	%o0,	0x1253,	%i2
	bvs,a,pt	%icc,	loop_282
	movleu	%icc,	%o5,	%o2
	movrlz	%l4,	0x20D,	%i4
	movcc	%xcc,	%g6,	%l3
loop_282:
	bg,a	loop_283
	fmovdg	%icc,	%f31,	%f24
	tl	%icc,	0x1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g1,	%o1
loop_283:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l6
	smulcc	%l0,	%l2,	%i1
	xorcc	%i0,	%g3,	%g4
	movge	%icc,	%g2,	%l1
	fcmpgt16	%f24,	%f16,	%o6
	mulscc	%l5,	%i7,	%g5
	fnors	%f1,	%f2,	%f16
	sll	%i3,	%i5,	%o4
	alignaddrl	%o3,	%i6,	%g7
	fble,a	%fcc3,	loop_284
	tsubcctv	%o7,	0x1618,	%o0
	fornot2	%f12,	%f6,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_284:
	edge16l	%o5,	%o2,	%l4
	tne	%xcc,	0x2
	andn	%i2,	%g6,	%l3
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%g0
	fmovscs	%icc,	%f29,	%f27
	fpadd16	%f26,	%f16,	%f6
	fones	%f25
	fbul,a	%fcc2,	loop_285
	array8	%o1,	%l6,	%l0
	tleu	%xcc,	0x3
	brgz,a	%i4,	loop_286
loop_285:
	tgu	%icc,	0x6
	alignaddrl	%l2,	%i0,	%i1
	edge32n	%g4,	%g3,	%l1
loop_286:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g2
	stw	%o6,	[%l7 + 0x6C]
	fnor	%f10,	%f10,	%f26
	nop
	fitos	%f7,	%f25
	fstoi	%f25,	%f19
	fblg,a	%fcc2,	loop_287
	fmul8x16	%f4,	%f26,	%f18
	nop
	setx	0x7923E3B2328EFF1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD42234795786EEF6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f28,	%f28
	tvs	%icc,	0x3
loop_287:
	sdivx	%i7,	0x05A7,	%g5
	nop
	setx	0xDB0E504E8048C5C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	setx	0x17E45C64807A4CAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovsvs	%icc,	%f21,	%f31
	array8	%l5,	%i3,	%i5
	bn,pn	%icc,	loop_288
	ble	loop_289
	movre	%o4,	%o3,	%i6
	edge16l	%g7,	%o0,	%o7
loop_288:
	ldsw	[%l7 + 0x74],	%o5
loop_289:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l4,	%i2,	%o2
	fnot2	%f0,	%f2
	tcc	%xcc,	0x3
	bvc,a,pt	%icc,	loop_290
	nop
	setx	loop_291,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%l3,	0x1B75,	%g1
	movne	%icc,	%o1,	%g6
loop_290:
	fmovsa	%xcc,	%f25,	%f25
loop_291:
	edge8	%l0,	%l6,	%i4
	edge32n	%i0,	%l2,	%g4
	sllx	%i1,	0x0A,	%l1
	nop
	setx	0xEACE5F8E20461FC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	alignaddr	%g2,	%o6,	%g3
	bge,pt	%xcc,	loop_292
	fzeros	%f26
	nop
	fitos	%f11,	%f9
	fstoi	%f9,	%f15
	movleu	%xcc,	%i7,	%g5
loop_292:
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f2
	xnorcc	%i3,	0x032D,	%i5
	fpadd32s	%f29,	%f27,	%f18
	set	0x5A, %g1
	stba	%o4,	[%l7 + %g1] 0xe2
	membar	#Sync
	fmovrsgz	%o3,	%f8,	%f10
	tg	%xcc,	0x7
	nop
	set	0x20, %g3
	std	%f6,	[%l7 + %g3]
	set	0x36, %i0
	ldsba	[%l7 + %i0] 0x0c,	%i6
	xnorcc	%g7,	%l5,	%o7
	sdivx	%o5,	0x1F74,	%o0
	movl	%xcc,	%i2,	%l4
	tcc	%icc,	0x3
	mulx	%o2,	%l3,	%g1
	nop
	set	0x4C, %g5
	stw	%o1,	[%l7 + %g5]
	fmovs	%f2,	%f13
	edge16n	%g6,	%l0,	%l6
	sethi	0x00E5,	%i4
	brlez,a	%i0,	loop_293
	tcs	%xcc,	0x3
	fcmpeq16	%f22,	%f26,	%l2
	ldd	[%l7 + 0x08],	%i0
loop_293:
	bpos	loop_294
	movneg	%xcc,	%l1,	%g4
	movcc	%icc,	%g2,	%g3
	fbule	%fcc3,	loop_295
loop_294:
	movg	%icc,	%o6,	%g5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_295:
	bleu,a,pn	%icc,	loop_296
	edge16ln	%i7,	%i3,	%o4
	ldd	[%l7 + 0x48],	%f22
	movrne	%o3,	%i5,	%i6
loop_296:
	sir	0x12DA
	sll	%g7,	0x1D,	%l5
	movvc	%xcc,	%o7,	%o5
	addc	%o0,	%l4,	%i2
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x0c,	 0x3
	mova	%icc,	%l3,	%o1
	fbuge	%fcc0,	loop_297
	subccc	%g6,	0x072E,	%g1
	fsrc2	%f12,	%f6
	movge	%xcc,	%l6,	%i4
loop_297:
	tpos	%icc,	0x5
	fbge	%fcc0,	loop_298
	fnand	%f26,	%f26,	%f22
	edge16l	%l0,	%l2,	%i0
	be,pt	%icc,	loop_299
loop_298:
	movrlz	%i1,	%g4,	%g2
	udiv	%g3,	0x1095,	%o6
	set	0x20, %i3
	ldswa	[%l7 + %i3] 0x04,	%g5
loop_299:
	te	%icc,	0x2
	sdiv	%l1,	0x042D,	%i3
	bg	loop_300
	nop
	setx	0xB1EB05E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x8EDB80AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f8,	%f7
	movvc	%icc,	%i7,	%o4
	fandnot2	%f12,	%f10,	%f14
loop_300:
	or	%o3,	0x0B4F,	%i5
	edge8l	%i6,	%g7,	%l5
	popc	%o7,	%o0
	fmovrsgz	%l4,	%f12,	%f27
	movpos	%xcc,	%i2,	%o5
	tg	%icc,	0x2
	fmovsneg	%xcc,	%f31,	%f12
	tgu	%icc,	0x1
	tcc	%xcc,	0x6
	sdiv	%o2,	0x12C4,	%o1
	fbo,a	%fcc3,	loop_301
	edge8l	%l3,	%g1,	%l6
	fmovdvc	%icc,	%f28,	%f4
	fpack16	%f24,	%f6
loop_301:
	lduw	[%l7 + 0x40],	%i4
	fmovsl	%icc,	%f0,	%f9
	movrgez	%g6,	%l2,	%i0
	stb	%i1,	[%l7 + 0x14]
	sth	%l0,	[%l7 + 0x14]
	fabss	%f1,	%f31
	movn	%icc,	%g4,	%g2
	smulcc	%o6,	%g5,	%l1
	tleu	%icc,	0x4
	be,a,pt	%xcc,	loop_302
	edge16	%i3,	%g3,	%o4
	edge16	%o3,	%i7,	%i6
	addcc	%g7,	0x01F6,	%l5
loop_302:
	bpos,a	%icc,	loop_303
	sdivcc	%i5,	0x111B,	%o0
	fpack16	%f20,	%f1
	edge16l	%o7,	%i2,	%o5
loop_303:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%l4
	andn	%o1,	%g1,	%l6
	fors	%f30,	%f24,	%f0
	edge16n	%i4,	%l3,	%l2
	addcc	%g6,	%i1,	%i0
	movge	%xcc,	%g4,	%g2
	andncc	%o6,	%g5,	%l0
	ldub	[%l7 + 0x51],	%i3
	tge	%xcc,	0x7
	tsubcctv	%g3,	0x0D34,	%l1
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x80,	%o4
	fcmpne16	%f30,	%f20,	%i7
	mulscc	%i6,	0x1C7F,	%g7
	bvs	loop_304
	array8	%l5,	%i5,	%o3
	movg	%icc,	%o0,	%i2
	xnor	%o5,	0x19ED,	%o7
loop_304:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	srax	%o2,	0x1D,	%l4
	movrgz	%g1,	0x1FC,	%o1
	brlz,a	%l6,	loop_305
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	fmovsl	%icc,	%f21,	%f19
loop_305:
	fmovse	%icc,	%f21,	%f11
	sllx	%i4,	0x03,	%l2
	set	0x14, %o4
	lduha	[%l7 + %o4] 0x11,	%l3
	fbuge	%fcc0,	loop_306
	movleu	%icc,	%i1,	%g6
	mova	%xcc,	%g4,	%g2
	ta	%icc,	0x1
loop_306:
	bl	%icc,	loop_307
	fmovdge	%xcc,	%f17,	%f9
	fsrc1s	%f21,	%f6
	nop
	setx	loop_308,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_307:
	fmovsgu	%xcc,	%f9,	%f30
	add	%o6,	%g5,	%i0
	addccc	%l0,	0x12EA,	%i3
loop_308:
	fandnot1	%f24,	%f8,	%f20
	edge32l	%l1,	%g3,	%i7
	lduw	[%l7 + 0x7C],	%i6
	tgu	%icc,	0x7
	fbule	%fcc1,	loop_309
	ta	%xcc,	0x2
	movrlz	%o4,	%l5,	%g7
	taddcctv	%o3,	0x16E2,	%i5
loop_309:
	edge32n	%i2,	%o5,	%o7
	te	%xcc,	0x3
	movneg	%icc,	%o2,	%l4
	subcc	%o0,	%g1,	%l6
	tneg	%icc,	0x6
	edge32	%i4,	%o1,	%l2
	andncc	%i1,	%g6,	%g4
	move	%icc,	%g2,	%o6
	ble,a	%icc,	loop_310
	brlez	%l3,	loop_311
	tleu	%xcc,	0x0
	brgz	%i0,	loop_312
loop_310:
	edge16ln	%l0,	%i3,	%g5
loop_311:
	edge16ln	%g3,	%l1,	%i7
	fmul8x16al	%f5,	%f18,	%f16
loop_312:
	fmovsne	%icc,	%f18,	%f3
	set	0x30, %o0
	ldda	[%l7 + %o0] 0xea,	%o4
	fandnot2s	%f26,	%f15,	%f4
	xorcc	%i6,	%g7,	%o3
	or	%l5,	%i5,	%o5
	edge32n	%i2,	%o7,	%o2
	xor	%o0,	%l4,	%l6
	edge8	%i4,	%o1,	%l2
	movrne	%g1,	0x0C5,	%g6
	sdivcc	%g4,	0x1FE8,	%g2
	tvs	%icc,	0x1
	fmovdpos	%xcc,	%f6,	%f21
	movcs	%icc,	%o6,	%l3
	tleu	%icc,	0x0
	movrlz	%i1,	0x167,	%i0
	addcc	%i3,	0x0D34,	%l0
	ldstub	[%l7 + 0x69],	%g5
	tn	%xcc,	0x2
	fbl,a	%fcc1,	loop_313
	brnz	%l1,	loop_314
	fmovrslez	%g3,	%f17,	%f27
	taddcc	%i7,	0x0522,	%o4
loop_313:
	fblg,a	%fcc1,	loop_315
loop_314:
	bvc,a	%icc,	loop_316
	bg,a,pt	%icc,	loop_317
	xorcc	%i6,	0x172C,	%o3
loop_315:
	nop
	set	0x7C, %o3
	swapa	[%l7 + %o3] 0x89,	%l5
loop_316:
	orn	%g7,	%i5,	%o5
loop_317:
	fsrc1	%f2,	%f18
	or	%i2,	0x1DA0,	%o7
	tvs	%xcc,	0x1
	bgu,a,pt	%icc,	loop_318
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_319,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot2	%f24,	%f24,	%f14
loop_318:
	movrlez	%o2,	0x3C5,	%l4
	taddcc	%o0,	%i4,	%l6
loop_319:
	edge32	%l2,	%g1,	%o1
	udivx	%g4,	0x0254,	%g6
	orcc	%g2,	%o6,	%l3
	set	0x24, %i6
	stba	%i0,	[%l7 + %i6] 0x2f
	membar	#Sync
	fornot1	%f26,	%f2,	%f0
	popc	%i1,	%l0
	ldd	[%l7 + 0x70],	%g4
	tsubcc	%i3,	%l1,	%g3
	fbuge,a	%fcc2,	loop_320
	subcc	%o4,	0x0B33,	%i6
	sra	%i7,	0x11,	%o3
	fbge,a	%fcc1,	loop_321
loop_320:
	move	%xcc,	%g7,	%i5
	stb	%l5,	[%l7 + 0x51]
	fornot1	%f0,	%f4,	%f8
loop_321:
	taddcctv	%o5,	%o7,	%o2
	fmovrdgez	%l4,	%f12,	%f22
	tsubcctv	%o0,	0x1626,	%i2
	alignaddr	%l6,	%l2,	%g1
	andncc	%i4,	%o1,	%g4
	fmovrde	%g2,	%f26,	%f26
	fmovsa	%xcc,	%f0,	%f5
	nop
	fitos	%f6,	%f13
	fstoi	%f13,	%f27
	fmovspos	%icc,	%f9,	%f18
	alignaddrl	%o6,	%g6,	%i0
	tle	%icc,	0x6
	stw	%l3,	[%l7 + 0x4C]
	nop
	setx	0x4061869D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x3BA20961,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f1,	%f20
	wr	%g0,	0x18,	%asi
	stha	%l0,	[%l7 + 0x2A] %asi
	movcs	%xcc,	%g5,	%i3
	edge32ln	%l1,	%g3,	%o4
	std	%f4,	[%l7 + 0x58]
	nop
	setx	0x58138736,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xD3845603,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f17,	%f21
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16ln	%i1,	%i6,	%i7
	movpos	%icc,	%o3,	%g7
	sub	%i5,	0x01C2,	%l5
	edge32n	%o7,	%o2,	%l4
	bcc,pt	%xcc,	loop_322
	tsubcctv	%o0,	%i2,	%o5
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f0
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f10
	fxtod	%f10,	%f0
loop_322:
	nop
	set	0x28, %g2
	lduha	[%l7 + %g2] 0x81,	%l2
	edge16	%g1,	%l6,	%i4
	fmovrdne	%g4,	%f26,	%f6
	nop
	setx loop_323, %l0, %l1
	jmpl %l1, %g2
	andcc	%o6,	%g6,	%i0
	srlx	%o1,	0x19,	%l0
	tcc	%xcc,	0x1
loop_323:
	smul	%l3,	%g5,	%i3
	ldsh	[%l7 + 0x3A],	%l1
	taddcctv	%o4,	%g3,	%i1
	subc	%i6,	0x0CAE,	%o3
	movneg	%xcc,	%g7,	%i5
	mulx	%i7,	%o7,	%o2
	mova	%xcc,	%l4,	%l5
	ldd	[%l7 + 0x28],	%i2
	sllx	%o5,	%o0,	%g1
	movn	%xcc,	%l6,	%i4
	edge8n	%l2,	%g4,	%o6
	xnorcc	%g6,	0x036E,	%g2
	fandnot2	%f10,	%f20,	%f12
	smulcc	%i0,	%o1,	%l0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x50] %asi,	%l3
	edge16l	%g5,	%i3,	%l1
	orcc	%o4,	%g3,	%i6
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
	srl	%g7,	%i5,	%i1
	udiv	%i7,	0x0E0C,	%o2
	fcmple16	%f20,	%f8,	%l4
	movcs	%icc,	%o7,	%l5
	edge32n	%i2,	%o0,	%o5
	fmovscc	%icc,	%f11,	%f15
	fcmple16	%f8,	%f28,	%g1
	fbo,a	%fcc2,	loop_324
	fnands	%f22,	%f13,	%f17
	and	%i4,	%l2,	%g4
	nop
	setx	0x97E326EE50423FB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_324:
	movle	%icc,	%o6,	%g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%l6
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f14
	movneg	%icc,	%i0,	%o1
	movrlez	%l3,	0x13B,	%l0
	fpadd16	%f18,	%f8,	%f8
	tsubcctv	%i3,	%g5,	%o4
	bgu,a	loop_325
	fmul8x16	%f0,	%f4,	%f14
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_325:
	tsubcc	%g3,	0x0F64,	%l1
	movrgez	%i6,	0x0EE,	%o3
	call	loop_326
	movgu	%xcc,	%g7,	%i5
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x10
loop_326:
	tsubcctv	%i1,	0x0AB4,	%o2
	tle	%icc,	0x5
	nop
	fitod	%f2,	%f22
	fdtox	%f22,	%f2
	movl	%icc,	%l4,	%i7
	st	%f22,	[%l7 + 0x78]
	tvs	%xcc,	0x0
	edge32l	%o7,	%i2,	%o0
	std	%f26,	[%l7 + 0x18]
	fcmpgt16	%f6,	%f10,	%o5
	fnot1	%f16,	%f0
	fmul8ulx16	%f2,	%f28,	%f20
	edge16ln	%g1,	%i4,	%l2
	fnands	%f23,	%f12,	%f31
	edge16	%l5,	%o6,	%g4
	stb	%g6,	[%l7 + 0x53]
	bg,a	%icc,	loop_327
	tg	%xcc,	0x4
	movcc	%icc,	%g2,	%l6
	fmovdneg	%xcc,	%f21,	%f15
loop_327:
	subc	%o1,	%l3,	%i0
	edge8n	%i3,	%g5,	%l0
	ld	[%l7 + 0x54],	%f4
	brnz,a	%g3,	loop_328
	movne	%xcc,	%o4,	%l1
	st	%f2,	[%l7 + 0x4C]
	fabss	%f19,	%f13
loop_328:
	movg	%icc,	%o3,	%g7
	fmul8x16	%f30,	%f16,	%f0
	andcc	%i6,	0x0D67,	%i1
	xor	%i5,	%l4,	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x65] %asi,	%i7
	fmul8x16	%f17,	%f16,	%f0
	movleu	%xcc,	%i2,	%o7
	orncc	%o5,	%g1,	%i4
	taddcc	%o0,	%l2,	%o6
	membar	0x2A
	edge8l	%g4,	%l5,	%g6
	fmovdn	%icc,	%f16,	%f24
	edge8n	%g2,	%l6,	%o1
	bg,pt	%xcc,	loop_329
	fbe,a	%fcc1,	loop_330
	sub	%i0,	%i3,	%l3
	edge32	%g5,	%l0,	%o4
loop_329:
	edge16	%g3,	%o3,	%g7
loop_330:
	tge	%xcc,	0x1
	fblg,a	%fcc1,	loop_331
	fbge	%fcc2,	loop_332
	nop
	setx	0xFB66B23F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xE83956B4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f31,	%f22
	edge8	%l1,	%i1,	%i5
loop_331:
	edge16n	%l4,	%o2,	%i6
loop_332:
	or	%i7,	0x0F14,	%i2
	tle	%icc,	0x0
	tvc	%icc,	0x6
	mulx	%o5,	%o7,	%g1
	tneg	%icc,	0x6
	edge16	%o0,	%l2,	%i4
	brlz	%o6,	loop_333
	srl	%g4,	0x0B,	%l5
	fmovrdgz	%g2,	%f18,	%f24
	movle	%xcc,	%g6,	%l6
loop_333:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%i0,	[%l7 + 0x55] %asi
	move	%xcc,	%o1,	%i3
	nop
	setx	0x09A798BAE06563ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	edge8	%l3,	%l0,	%g5
	brz,a	%o4,	loop_334
	array8	%g3,	%g7,	%o3
	nop
	setx	loop_335,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_336
loop_334:
	movrgez	%l1,	%i5,	%i1
	sethi	0x062E,	%l4
loop_335:
	bge,pn	%icc,	loop_337
loop_336:
	tl	%icc,	0x0
	sub	%i6,	0x0C1A,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_337:
	tleu	%xcc,	0x1
	movl	%icc,	%i2,	%o2
	fmovdne	%xcc,	%f23,	%f19
	fpsub16s	%f24,	%f29,	%f28
	tcc	%icc,	0x1
	tsubcctv	%o5,	0x16D5,	%g1
	nop
	setx	0x1A9CF537,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xDD35A820,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f21,	%f21
	movle	%xcc,	%o0,	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o7,	%i4
	tl	%icc,	0x2
	fmovdpos	%xcc,	%f27,	%f1
	fmovscs	%xcc,	%f31,	%f21
	addccc	%g4,	%o6,	%g2
	fmovdpos	%icc,	%f3,	%f27
	fpadd16	%f22,	%f24,	%f22
	movne	%icc,	%l5,	%g6
	andcc	%l6,	0x0FCA,	%i0
	smul	%o1,	0x0EA5,	%i3
	tvs	%icc,	0x6
	nop
	fitod	%f0,	%f16
	fdtos	%f16,	%f17
	movl	%icc,	%l0,	%l3
	nop
	fitos	%f10,	%f14
	fstox	%f14,	%f8
	tcs	%xcc,	0x4
	be,pn	%xcc,	loop_338
	umul	%g5,	0x1584,	%g3
	fmovrslz	%o4,	%f0,	%f16
	movge	%icc,	%g7,	%l1
loop_338:
	subc	%i5,	0x0EEC,	%i1
	srl	%o3,	%i6,	%l4
	te	%icc,	0x2
	xor	%i7,	%o2,	%i2
	fbue,a	%fcc3,	loop_339
	edge8n	%o5,	%o0,	%l2
	sra	%g1,	%o7,	%i4
	brgz,a	%g4,	loop_340
loop_339:
	orcc	%g2,	%l5,	%g6
	fpsub32s	%f10,	%f28,	%f4
	edge32l	%l6,	%o6,	%i0
loop_340:
	fnot2	%f26,	%f18
	nop
	setx	0x7E37F6CF647F427A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x3FB1FB3EACEC6BEF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f18,	%f28
	fcmpne32	%f4,	%f6,	%i3
	udiv	%l0,	0x1D90,	%o1
	alignaddrl	%l3,	%g3,	%g5
	edge32l	%o4,	%g7,	%i5
	movrgez	%l1,	0x165,	%i1
	orn	%o3,	%l4,	%i6
	fbue,a	%fcc0,	loop_341
	ldsw	[%l7 + 0x34],	%o2
	array16	%i2,	%o5,	%o0
	tsubcc	%l2,	%i7,	%o7
loop_341:
	edge16n	%g1,	%i4,	%g2
	tneg	%xcc,	0x0
	movrgez	%l5,	%g6,	%l6
	sllx	%g4,	%i0,	%i3
	fmovdpos	%icc,	%f5,	%f26
	fnot1	%f24,	%f20
	bcc,a	%icc,	loop_342
	membar	0x38
	movre	%o6,	0x02C,	%o1
	tsubcctv	%l0,	%l3,	%g3
loop_342:
	nop
	set	0x70, %o2
	stwa	%g5,	[%l7 + %o2] 0x18
	fmovde	%icc,	%f9,	%f28
	fbn,a	%fcc0,	loop_343
	edge32ln	%g7,	%o4,	%i5
	tge	%xcc,	0x2
	orncc	%i1,	%o3,	%l1
loop_343:
	nop
	set	0x74, %i2
	ldsha	[%l7 + %i2] 0x10,	%l4
	movre	%i6,	%i2,	%o5
	bge,pn	%icc,	loop_344
	nop
	setx	0x006B3506,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	brnz	%o2,	loop_345
	movl	%xcc,	%l2,	%o0
loop_344:
	sth	%o7,	[%l7 + 0x50]
	prefetch	[%l7 + 0x4C],	 0x2
loop_345:
	fmovsneg	%icc,	%f0,	%f7
	fmuld8sux16	%f16,	%f7,	%f22
	move	%xcc,	%g1,	%i4
	subc	%i7,	0x1AFA,	%l5
	fpsub32	%f0,	%f0,	%f10
	movre	%g6,	0x0E6,	%g2
	nop
	setx	loop_346,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%g4,	0x18F3,	%l6
	movrlez	%i3,	0x02E,	%o6
	fbo	%fcc0,	loop_347
loop_346:
	tg	%icc,	0x2
	edge32l	%o1,	%i0,	%l0
	tl	%xcc,	0x0
loop_347:
	tl	%icc,	0x0
	fmovsleu	%icc,	%f10,	%f10
	tvc	%xcc,	0x3
	tvc	%xcc,	0x3
	orncc	%g3,	0x1AD7,	%l3
	nop
	fitos	%f8,	%f21
	fstox	%f21,	%f12
	fxtos	%f12,	%f24
	brgz	%g5,	loop_348
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g7,	0x1D95,	%o4
	addccc	%i5,	%o3,	%i1
loop_348:
	tcc	%xcc,	0x5
	array8	%l1,	%i6,	%l4
	andn	%o5,	0x0647,	%o2
	movl	%xcc,	%l2,	%o0
	taddcc	%i2,	0x0526,	%o7
	fmovsneg	%icc,	%f20,	%f0
	set	0x3E, %o7
	ldstuba	[%l7 + %o7] 0x81,	%g1
	xor	%i4,	%l5,	%g6
	fmovrslez	%g2,	%f1,	%f31
	sth	%i7,	[%l7 + 0x36]
	edge8	%g4,	%i3,	%o6
	fmovsleu	%xcc,	%f25,	%f27
	and	%l6,	0x1285,	%o1
	movrlez	%l0,	%i0,	%l3
	array8	%g3,	%g7,	%g5
	fmovsg	%xcc,	%f16,	%f21
	movvs	%xcc,	%i5,	%o3
	edge16n	%i1,	%l1,	%o4
	edge8ln	%i6,	%o5,	%l4
	nop
	setx	loop_349,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%o2,	%l2,	%i2
	edge32n	%o0,	%o7,	%g1
	fbul,a	%fcc2,	loop_350
loop_349:
	brz	%i4,	loop_351
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x11,	%l5
loop_350:
	brgez	%g2,	loop_352
loop_351:
	bge	loop_353
	movle	%icc,	%i7,	%g6
	tpos	%icc,	0x4
loop_352:
	movleu	%icc,	%g4,	%i3
loop_353:
	movvc	%xcc,	%o6,	%o1
	ldd	[%l7 + 0x58],	%i6
	subc	%l0,	0x14A9,	%i0
	ldub	[%l7 + 0x18],	%g3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x44] %asi,	%f17
	nop
	setx	0x93F2CEA7C67041DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x55DE4BA89BF1A391,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f6,	%f16
	brnz	%l3,	loop_354
	movgu	%xcc,	%g7,	%i5
	movle	%icc,	%g5,	%o3
	nop
	setx	0xCCC8B290,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x1BA960E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f2,	%f13
loop_354:
	ble,a	%xcc,	loop_355
	srlx	%i1,	0x0B,	%l1
	tn	%xcc,	0x0
	bl,pt	%icc,	loop_356
loop_355:
	nop
	fitod	%f6,	%f30
	fdtos	%f30,	%f17
	udivx	%o4,	0x1127,	%i6
	popc	0x0FEC,	%o5
loop_356:
	umul	%l4,	%l2,	%o2
	bgu,a	%xcc,	loop_357
	bpos,a,pt	%xcc,	loop_358
	tvs	%icc,	0x2
	sth	%o0,	[%l7 + 0x08]
loop_357:
	mulx	%i2,	%g1,	%o7
loop_358:
	tvc	%icc,	0x3
	taddcc	%l5,	0x0D1E,	%g2
	alignaddrl	%i4,	%i7,	%g4
	tg	%icc,	0x7
	movcs	%icc,	%i3,	%o6
	call	loop_359
	edge16n	%o1,	%g6,	%l0
	mulscc	%i0,	%l6,	%l3
	or	%g7,	0x0261,	%i5
loop_359:
	tsubcc	%g3,	0x1081,	%g5
	fbn,a	%fcc0,	loop_360
	udivcc	%i1,	0x0EBB,	%o3
	tl	%icc,	0x7
	tsubcc	%l1,	0x10CF,	%i6
loop_360:
	nop
	setx loop_361, %l0, %l1
	jmpl %l1, %o4
	fblg	%fcc0,	loop_362
	tcc	%xcc,	0x5
	movvs	%icc,	%o5,	%l4
loop_361:
	nop
	set	0x6A, %l6
	ldsba	[%l7 + %l6] 0x0c,	%o2
loop_362:
	srlx	%l2,	%i2,	%g1
	movne	%xcc,	%o0,	%l5
	movneg	%xcc,	%g2,	%o7
	wr	%g0,	0x0c,	%asi
	sta	%f2,	[%l7 + 0x5C] %asi
	edge16n	%i7,	%g4,	%i3
	tcc	%xcc,	0x5
	edge32n	%i4,	%o1,	%g6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	and	%i0,	%l0,	%l3
	sdivcc	%l6,	0x0FF1,	%g7
	bge,pn	%xcc,	loop_363
	fnand	%f30,	%f28,	%f28
	srlx	%g3,	%i5,	%g5
	array32	%i1,	%o3,	%l1
loop_363:
	movrne	%i6,	%o4,	%o5
	tle	%icc,	0x6
	movpos	%icc,	%l4,	%o2
	tcs	%icc,	0x5
	sra	%i2,	0x1D,	%l2
	set	0x73, %i4
	lduba	[%l7 + %i4] 0x19,	%o0
	addccc	%g1,	%g2,	%o7
	tsubcc	%l5,	0x0031,	%g4
	edge32n	%i3,	%i7,	%o1
	tsubcctv	%g6,	%o6,	%i4
	fsrc2s	%f0,	%f17
	edge8l	%l0,	%l3,	%l6
	nop
	fitod	%f4,	%f12
	fdtos	%f12,	%f22
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f8
	fmovsg	%icc,	%f7,	%f4
	nop
	fitos	%f27,	%f10
	fmovdcc	%xcc,	%f2,	%f22
	sdivx	%g7,	0x0971,	%i0
	tge	%icc,	0x5
	lduh	[%l7 + 0x66],	%i5
	ld	[%l7 + 0x44],	%f8
	fnands	%f19,	%f0,	%f14
	fmovrdgz	%g3,	%f26,	%f18
	fbuge,a	%fcc3,	loop_364
	edge8l	%g5,	%i1,	%l1
	fmovspos	%icc,	%f10,	%f9
	fmul8x16al	%f4,	%f3,	%f20
loop_364:
	mova	%xcc,	%i6,	%o4
	fmovsleu	%icc,	%f3,	%f18
	array32	%o5,	%l4,	%o3
	fba,a	%fcc2,	loop_365
	fones	%f17
	xnorcc	%i2,	%l2,	%o0
	movrlez	%o2,	0x01E,	%g1
loop_365:
	alignaddrl	%o7,	%l5,	%g2
	mulscc	%g4,	%i7,	%i3
	orcc	%o1,	%g6,	%i4
	set	0x7E, %o1
	lduha	[%l7 + %o1] 0x10,	%o6
	edge32n	%l0,	%l6,	%g7
	srax	%l3,	0x18,	%i5
	ta	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%i0
	edge16l	%g5,	%g3,	%l1
	nop
	set	0x38, %g7
	stx	%i1,	[%l7 + %g7]
	array16	%o4,	%i6,	%o5
	subccc	%l4,	0x0A14,	%i2
	brgz	%o3,	loop_366
	fmovda	%xcc,	%f1,	%f1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l2
loop_366:
	bge	loop_367
	fbug,a	%fcc2,	loop_368
	andn	%o0,	0x1EC5,	%g1
	edge8ln	%o7,	%l5,	%g2
loop_367:
	fxors	%f17,	%f21,	%f14
loop_368:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g4,	%i7,	%o2
	xnor	%i3,	%o1,	%i4
	subccc	%o6,	0x1024,	%l0
	movl	%xcc,	%g6,	%g7
	fble	%fcc2,	loop_369
	popc	0x15DF,	%l3
	sra	%l6,	0x16,	%i0
	fmovsleu	%icc,	%f27,	%f26
loop_369:
	nop
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x66] %asi,	%i5
	fbo,a	%fcc1,	loop_370
	array16	%g3,	%g5,	%i1
	movrlz	%o4,	%i6,	%l1
	movre	%l4,	0x364,	%o5
loop_370:
	movrlz	%o3,	0x26E,	%i2
	fbn,a	%fcc3,	loop_371
	sethi	0x098C,	%o0
	tcs	%icc,	0x4
	ldx	[%l7 + 0x60],	%g1
loop_371:
	edge16ln	%o7,	%l5,	%l2
	edge32l	%g4,	%i7,	%o2
	movne	%xcc,	%i3,	%g2
	mulx	%i4,	0x03C4,	%o6
	edge16n	%o1,	%l0,	%g6
	ble,a,pn	%icc,	loop_372
	bneg	loop_373
	ldstub	[%l7 + 0x0D],	%l3
	bcs,pt	%xcc,	loop_374
loop_372:
	edge8	%l6,	%i0,	%g7
loop_373:
	membar	0x62
	tvs	%icc,	0x5
loop_374:
	movvc	%xcc,	%i5,	%g3
	mulx	%i1,	%g5,	%o4
	edge32n	%l1,	%i6,	%l4
	fmovd	%f6,	%f6
	move	%icc,	%o5,	%i2
	movge	%icc,	%o0,	%o3
	fmovsgu	%xcc,	%f13,	%f6
	bge,pt	%xcc,	loop_375
	bpos,a,pt	%xcc,	loop_376
	fpadd32s	%f9,	%f7,	%f5
	and	%g1,	%l5,	%l2
loop_375:
	tpos	%icc,	0x3
loop_376:
	movl	%xcc,	%o7,	%i7
	tvs	%xcc,	0x2
	fbe,a	%fcc0,	loop_377
	orcc	%o2,	%i3,	%g2
	ldsh	[%l7 + 0x14],	%g4
	nop
	setx	0x023A9B06,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xAE4A24CA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f14,	%f20
loop_377:
	fnot2s	%f7,	%f28
	array32	%i4,	%o6,	%l0
	sethi	0x0ECC,	%g6
	sub	%o1,	%l6,	%l3
	fand	%f6,	%f4,	%f28
	tcs	%icc,	0x2
	fmovrdlz	%i0,	%f26,	%f16
	umul	%g7,	%g3,	%i1
	addc	%g5,	%o4,	%l1
	andn	%i6,	0x1C01,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i5,	%i2,	%o5
	tvc	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movvs	%icc,	%o0,	%o3
	tle	%xcc,	0x5
	edge16ln	%g1,	%l5,	%o7
	tcc	%icc,	0x7
	popc	0x0623,	%i7
	movrne	%l2,	%o2,	%g2
	movcs	%icc,	%g4,	%i3
	movl	%icc,	%i4,	%l0
	sethi	0x1813,	%o6
	fmovrslz	%o1,	%f24,	%f1
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x70] %asi,	%l6
	nop
	fitod	%f2,	%f0
	fdtos	%f0,	%f10
	andn	%l3,	0x1847,	%i0
	fmovdcc	%xcc,	%f7,	%f0
	sdivcc	%g7,	0x0AD0,	%g6
	fnor	%f4,	%f0,	%f26
	fpsub32	%f20,	%f26,	%f26
	addc	%g3,	%i1,	%o4
	edge32n	%g5,	%i6,	%l1
	edge8n	%l4,	%i5,	%i2
	alignaddrl	%o5,	%o0,	%g1
	andcc	%l5,	0x0373,	%o7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x3E] %asi,	%o3
	sra	%l2,	%o2,	%g2
	fbn,a	%fcc3,	loop_378
	orncc	%i7,	0x19CC,	%g4
	fmovdcs	%icc,	%f2,	%f14
	taddcctv	%i3,	0x0A74,	%i4
loop_378:
	movrlez	%o6,	0x3F4,	%o1
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	0x114A68F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x957BF34B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f13,	%f24
	fbe,a	%fcc1,	loop_379
	add	%l6,	0x0B95,	%l0
	set	0x10, %l3
	lduwa	[%l7 + %l3] 0x15,	%i0
loop_379:
	orn	%g7,	0x158B,	%l3
	move	%xcc,	%g3,	%g6
	fnot2	%f20,	%f2
	edge8	%o4,	%i1,	%i6
	or	%l1,	0x0731,	%l4
	xnor	%i5,	0x1A5F,	%i2
	tneg	%icc,	0x2
	movvc	%icc,	%g5,	%o5
	smul	%o0,	0x14B5,	%g1
	taddcctv	%l5,	%o7,	%l2
	subccc	%o2,	%g2,	%i7
	ldsh	[%l7 + 0x76],	%o3
	brz	%g4,	loop_380
	andncc	%i3,	%o6,	%i4
	fsrc2	%f18,	%f18
	orn	%o1,	0x156F,	%l0
loop_380:
	bvs	%icc,	loop_381
	andn	%l6,	%g7,	%l3
	tcs	%xcc,	0x5
	movne	%icc,	%g3,	%g6
loop_381:
	fandnot1s	%f22,	%f22,	%f13
	fzeros	%f6
	udivcc	%o4,	0x188D,	%i0
	movrlz	%i6,	%l1,	%i1
	edge16n	%i5,	%l4,	%g5
	fblg	%fcc1,	loop_382
	fxnor	%f20,	%f2,	%f30
	fbne	%fcc3,	loop_383
	subcc	%o5,	0x0FC8,	%i2
loop_382:
	andn	%o0,	0x0839,	%l5
	fbul	%fcc3,	loop_384
loop_383:
	fornot2	%f8,	%f16,	%f8
	movgu	%xcc,	%g1,	%l2
	orncc	%o7,	0x1466,	%g2
loop_384:
	fmul8ulx16	%f8,	%f30,	%f4
	fcmple16	%f24,	%f10,	%i7
	fpadd16	%f6,	%f20,	%f20
	edge32ln	%o3,	%o2,	%i3
	tsubcctv	%o6,	%g4,	%i4
	mova	%icc,	%l0,	%o1
	set	0x4C, %l4
	stwa	%g7,	[%l7 + %l4] 0x2f
	membar	#Sync
	std	%f0,	[%l7 + 0x50]
	umulcc	%l6,	%l3,	%g6
	edge32n	%o4,	%g3,	%i0
	tsubcc	%i6,	%i1,	%l1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%l4
	tleu	%xcc,	0x0
	subccc	%g5,	0x0E91,	%o5
	tn	%xcc,	0x6
	brlz	%i2,	loop_385
	lduw	[%l7 + 0x34],	%o0
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f30
	fmovrdlez	%i5,	%f4,	%f8
loop_385:
	movl	%xcc,	%g1,	%l5
	fbge,a	%fcc3,	loop_386
	fmovde	%icc,	%f16,	%f17
	sra	%o7,	0x0E,	%l2
	fbl	%fcc3,	loop_387
loop_386:
	addcc	%i7,	0x0411,	%o3
	fmovda	%xcc,	%f6,	%f9
	nop
	setx	0x30458E3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
loop_387:
	mova	%xcc,	%g2,	%o2
	te	%xcc,	0x2
	sdivx	%o6,	0x1B64,	%g4
	fble	%fcc0,	loop_388
	bshuffle	%f28,	%f22,	%f24
	addc	%i4,	%i3,	%l0
	wr	%g0,	0x2a,	%asi
	stba	%o1,	[%l7 + 0x18] %asi
	membar	#Sync
loop_388:
	bn,pt	%icc,	loop_389
	tne	%xcc,	0x2
	fbuge	%fcc3,	loop_390
	movre	%l6,	%g7,	%g6
loop_389:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x60] %asi,	%l3
loop_390:
	fmovd	%f30,	%f22
	tn	%xcc,	0x3
	tgu	%icc,	0x7
	mulscc	%o4,	0x00EF,	%i0
	fxor	%f10,	%f24,	%f10
	tgu	%icc,	0x5
	nop
	setx	loop_391,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot1	%f16,	%f30
	bneg,a	%xcc,	loop_392
	add	%g3,	%i1,	%l1
loop_391:
	sllx	%l4,	0x06,	%i6
	brz	%o5,	loop_393
loop_392:
	flush	%l7 + 0x74
	flush	%l7 + 0x60
	movle	%xcc,	%g5,	%i2
loop_393:
	tcc	%icc,	0x7
	alignaddrl	%o0,	%g1,	%l5
	bl,a,pt	%icc,	loop_394
	movleu	%icc,	%i5,	%o7
	movre	%l2,	%i7,	%o3
	subc	%g2,	0x063B,	%o6
loop_394:
	subc	%g4,	%o2,	%i3
	nop
	set	0x18, %i1
	ldx	[%l7 + %i1],	%l0
	ld	[%l7 + 0x38],	%f5
	fbule,a	%fcc2,	loop_395
	fmovrsgz	%o1,	%f10,	%f9
	fmovdg	%xcc,	%f5,	%f11
	fbg,a	%fcc3,	loop_396
loop_395:
	movrgez	%l6,	%g7,	%g6
	sdiv	%l3,	0x0DCB,	%i4
	umulcc	%o4,	%i0,	%g3
loop_396:
	ta	%icc,	0x1
	fmovrslez	%l1,	%f6,	%f11
	tsubcctv	%i1,	%l4,	%o5
	stb	%g5,	[%l7 + 0x75]
	sll	%i6,	0x1F,	%i2
	fpadd16s	%f24,	%f19,	%f28
	membar	0x13
	udiv	%o0,	0x1205,	%g1
	membar	0x31
	fpsub16s	%f7,	%f12,	%f22
	fmovrdgez	%l5,	%f30,	%f30
	nop
	setx	loop_397,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovd	%f10,	%f8
	movrlez	%o7,	0x1DB,	%i5
	ta	%xcc,	0x7
loop_397:
	std	%f8,	[%l7 + 0x58]
	fmovsleu	%xcc,	%f27,	%f4
	fmovspos	%xcc,	%f24,	%f3
	array16	%l2,	%i7,	%o3
	tvc	%icc,	0x3
	array16	%o6,	%g4,	%g2
	tpos	%icc,	0x7
	subc	%o2,	%i3,	%l0
	fmovrslez	%o1,	%f23,	%f9
	nop
	setx	0x62741041D02C7FE8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f22
	tleu	%xcc,	0x0
	fnors	%f2,	%f20,	%f28
	array16	%g7,	%g6,	%l6
	fornot2s	%f17,	%f29,	%f15
	sdiv	%l3,	0x1E27,	%i4
	brlez	%i0,	loop_398
	fexpand	%f11,	%f16
	bgu,a	%xcc,	loop_399
	addcc	%o4,	0x00A4,	%l1
loop_398:
	movl	%xcc,	%i1,	%l4
	movcs	%xcc,	%g3,	%g5
loop_399:
	add	%o5,	0x155C,	%i6
	nop
	setx	loop_400,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%o0,	0x1843,	%g1
	movne	%xcc,	%i2,	%l5
	bvs,pn	%xcc,	loop_401
loop_400:
	smul	%o7,	0x1C5F,	%i5
	alignaddr	%i7,	%l2,	%o6
	nop
	setx	loop_402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_401:
	sir	0x015C
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x22,	%g4
loop_402:
	fornot1	%f26,	%f2,	%f14
	fnegs	%f23,	%f5
	sll	%g2,	%o3,	%o2
	smul	%l0,	%o1,	%i3
	mova	%icc,	%g6,	%g7
	srax	%l3,	%i4,	%i0
	nop
	set	0x4C, %o5
	ldsh	[%l7 + %o5],	%l6
	nop
	setx	loop_403,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%l1,	%i1,	%l4
	fmovrse	%g3,	%f2,	%f8
	movrne	%o4,	%o5,	%g5
loop_403:
	fpadd16	%f30,	%f30,	%f24
	edge32l	%i6,	%g1,	%o0
	taddcctv	%i2,	%o7,	%l5
	be	loop_404
	tgu	%icc,	0x3
	movne	%xcc,	%i7,	%i5
	sethi	0x0140,	%o6
loop_404:
	edge16ln	%g4,	%g2,	%l2
	ldd	[%l7 + 0x58],	%f22
	or	%o2,	%o3,	%l0
	nop
	set	0x64, %l2
	lduh	[%l7 + %l2],	%i3
	movvc	%icc,	%o1,	%g7
	fmovd	%f14,	%f18
	movrlz	%l3,	0x3AD,	%i4
	orncc	%g6,	0x0E20,	%l6
	bcs,a	loop_405
	lduw	[%l7 + 0x20],	%i0
	fmovsle	%xcc,	%f28,	%f23
	edge8l	%i1,	%l4,	%g3
loop_405:
	ta	%xcc,	0x3
	movn	%icc,	%l1,	%o4
	fblg	%fcc1,	loop_406
	udivcc	%g5,	0x0742,	%o5
	stbar
	tcc	%xcc,	0x5
loop_406:
	nop
	setx	loop_407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%g1,	0x1804,	%o0
	fornot2s	%f7,	%f30,	%f15
	sir	0x156B
loop_407:
	fcmple32	%f24,	%f0,	%i2
	addc	%i6,	%l5,	%i7
	edge16n	%i5,	%o7,	%o6
	mulx	%g2,	%l2,	%g4
	movrne	%o3,	%o2,	%l0
	addc	%o1,	0x11B9,	%i3
	movrne	%g7,	%i4,	%g6
	bleu,a	loop_408
	fmovsle	%xcc,	%f2,	%f5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x42] %asi,	%l6
loop_408:
	andncc	%i0,	%l3,	%i1
	srax	%l4,	%g3,	%l1
	orn	%o4,	%g5,	%o5
	fcmpne16	%f26,	%f8,	%o0
	mulx	%i2,	%i6,	%g1
	fmovrsgz	%l5,	%f10,	%f2
	andn	%i5,	0x1BDF,	%i7
	sllx	%o6,	%g2,	%o7
	fmovrdne	%l2,	%f30,	%f8
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x0c,	%g4,	%o2
	bn	%icc,	loop_409
	movg	%xcc,	%o3,	%o1
	fcmple16	%f14,	%f18,	%i3
	tsubcc	%g7,	0x0EB6,	%l0
loop_409:
	xnorcc	%g6,	0x11AE,	%i4
	ldsw	[%l7 + 0x20],	%i0
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l6
	nop
	setx	0xD049692C,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	nop
	setx	0x4764B510A8CFE8C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x70C423FD41849BC1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f20,	%f6
	fbue	%fcc3,	loop_410
	movrlez	%l3,	%i1,	%l4
	edge16n	%g3,	%o4,	%g5
	sdivx	%l1,	0x0232,	%o5
loop_410:
	subccc	%o0,	0x1D0C,	%i2
	tsubcctv	%i6,	%l5,	%g1
	nop
	fitod	%f0,	%f4
	fdtos	%f4,	%f17
	orcc	%i7,	0x1008,	%o6
	te	%icc,	0x4
	tcs	%icc,	0x0
	fmovsneg	%icc,	%f13,	%f24
	fpadd32s	%f3,	%f26,	%f18
	bneg,a,pn	%icc,	loop_411
	movge	%xcc,	%g2,	%i5
	fmovsvc	%xcc,	%f11,	%f24
	subc	%o7,	%g4,	%o2
loop_411:
	tvs	%icc,	0x6
	movvs	%icc,	%l2,	%o3
	srlx	%i3,	0x0D,	%o1
	fbe,a	%fcc2,	loop_412
	sdiv	%l0,	0x13FB,	%g6
	movre	%i4,	0x15A,	%i0
	fbule	%fcc0,	loop_413
loop_412:
	fornot2s	%f2,	%f18,	%f26
	fornot1s	%f9,	%f3,	%f21
	fmovrdgez	%g7,	%f24,	%f6
loop_413:
	fba,a	%fcc0,	loop_414
	sdivcc	%l3,	0x14F7,	%i1
	fandnot2s	%f5,	%f20,	%f20
	nop
	setx	loop_415,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_414:
	nop
	setx	0x315837AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x7FDFBE52,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f29,	%f18
	tvs	%icc,	0x7
	andncc	%l4,	%l6,	%g3
loop_415:
	sdiv	%g5,	0x0EA0,	%l1
	orncc	%o5,	%o0,	%i2
	brgez	%i6,	loop_416
	sllx	%o4,	0x01,	%l5
	orcc	%i7,	0x00F4,	%o6
	sllx	%g1,	0x04,	%g2
loop_416:
	xnorcc	%o7,	%g4,	%o2
	movrlz	%i5,	0x3C5,	%o3
	sub	%l2,	0x08A0,	%i3
	udiv	%l0,	0x1AC6,	%g6
	tn	%xcc,	0x1
	tgu	%xcc,	0x0
	movn	%xcc,	%o1,	%i4
	smul	%i0,	0x060F,	%l3
	nop
	setx	0xCCC7079A3C02AE38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x30FB7F4E10E95886,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f2,	%f30
	set	0x14, %i5
	lduha	[%l7 + %i5] 0x04,	%g7
	fpadd16s	%f8,	%f9,	%f31
	edge16ln	%l4,	%i1,	%g3
	nop
	setx	0xCDDC0CB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x992D8A14,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f15,	%f24
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f20
	xor	%l6,	0x140B,	%l1
	fmovdcc	%icc,	%f0,	%f28
	orcc	%o5,	%g5,	%i2
	taddcctv	%o0,	0x0CD1,	%o4
	ta	%xcc,	0x4
	edge16n	%l5,	%i6,	%i7
	movrne	%g1,	%g2,	%o7
	tl	%icc,	0x1
	fmovdcs	%icc,	%f1,	%f24
	or	%o6,	%g4,	%i5
	edge32l	%o2,	%o3,	%i3
	set	0x28, %l5
	ldswa	[%l7 + %l5] 0x14,	%l2
	addccc	%l0,	0x1109,	%g6
	fornot2	%f14,	%f8,	%f0
	fxnors	%f0,	%f17,	%f9
	orcc	%o1,	%i4,	%i0
	edge32ln	%g7,	%l4,	%l3
	movgu	%icc,	%i1,	%g3
	movle	%icc,	%l1,	%o5
	edge16	%l6,	%i2,	%g5
	fbl	%fcc2,	loop_417
	nop
	setx	0x169E1108112E683C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2646C3FF23AEDEB8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f24,	%f28
	fpmerge	%f12,	%f10,	%f18
	set	0x1E, %g6
	stba	%o4,	[%l7 + %g6] 0x04
loop_417:
	be,pn	%icc,	loop_418
	edge32	%o0,	%i6,	%i7
	fmovrdlez	%l5,	%f10,	%f2
	fmovdge	%xcc,	%f18,	%f11
loop_418:
	nop
	fitod	%f2,	%f0
	fdtoi	%f0,	%f18
	movvs	%xcc,	%g1,	%o7
	tg	%xcc,	0x2
	fmovdpos	%icc,	%f25,	%f8
	nop
	setx	0x9434DC51E07ED963,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	or	%g2,	0x1A7A,	%g4
	tl	%icc,	0x6
	edge16	%o6,	%o2,	%i5
	orcc	%i3,	0x0FEC,	%o3
	ldd	[%l7 + 0x58],	%l0
	edge32	%l2,	%o1,	%i4
	fxor	%f4,	%f26,	%f0
	tn	%icc,	0x6
	fblg,a	%fcc3,	loop_419
	ldd	[%l7 + 0x78],	%f30
	fbug,a	%fcc3,	loop_420
	fbe,a	%fcc2,	loop_421
loop_419:
	fnand	%f16,	%f6,	%f22
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g6,	%g7
loop_420:
	edge8	%l4,	%i0,	%i1
loop_421:
	nop
	set	0x0, %g3
	stxa	%l3,	[%g0 + %g3] 0x57
	nop
	setx	0x94EF1A13,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x61CDDF4C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f31,	%f13
	be	loop_422
	smul	%g3,	0x0A9E,	%l1
	membar	0x00
	nop
	setx	loop_423,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_422:
	tne	%xcc,	0x6
	fandnot1s	%f4,	%f20,	%f2
	te	%xcc,	0x2
loop_423:
	movvs	%icc,	%o5,	%i2
	fmovrse	%g5,	%f7,	%f8
	ldx	[%l7 + 0x28],	%l6
	udiv	%o0,	0x1EA1,	%i6
	fmovse	%xcc,	%f1,	%f11
	brnz	%o4,	loop_424
	umul	%i7,	%g1,	%o7
	movrlez	%l5,	%g4,	%o6
	nop
	fitos	%f6,	%f13
	fstod	%f13,	%f28
loop_424:
	movrlz	%o2,	%i5,	%i3
	bne	loop_425
	ldsw	[%l7 + 0x68],	%o3
	fmovrsgez	%l0,	%f19,	%f14
	fxor	%f28,	%f30,	%f12
loop_425:
	edge32	%g2,	%l2,	%o1
	movl	%icc,	%g6,	%g7
	tleu	%xcc,	0x0
	fmovspos	%xcc,	%f2,	%f12
	movvc	%icc,	%l4,	%i0
	smul	%i1,	0x1CEB,	%l3
	alignaddrl	%g3,	%l1,	%i4
	movg	%xcc,	%o5,	%g5
	tvs	%xcc,	0x3
	add	%l6,	%o0,	%i2
	fmovrsgz	%o4,	%f30,	%f15
	fxnors	%f1,	%f0,	%f18
	tl	%xcc,	0x0
	udiv	%i7,	0x0A2E,	%i6
	edge8n	%g1,	%l5,	%g4
	fmovdgu	%xcc,	%f20,	%f16
	srax	%o7,	0x08,	%o6
	fone	%f30
	addccc	%i5,	%o2,	%i3
	addcc	%o3,	%g2,	%l0
	tl	%xcc,	0x4
	edge8ln	%l2,	%g6,	%o1
	andncc	%g7,	%l4,	%i1
	set	0x4C, %i0
	stwa	%l3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	setx	0x151ADF24C42CE738,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x97FF53BD692EDFA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f28
	fmul8ulx16	%f20,	%f28,	%f0
	srlx	%g3,	0x15,	%i0
	subcc	%i4,	%o5,	%g5
	tcc	%xcc,	0x3
	fbul,a	%fcc3,	loop_426
	move	%icc,	%l6,	%o0
	brgz,a	%l1,	loop_427
	sth	%i2,	[%l7 + 0x0C]
loop_426:
	edge8n	%o4,	%i7,	%i6
	set	0x10, %g5
	swapa	[%l7 + %g5] 0x04,	%g1
loop_427:
	orn	%g4,	%o7,	%o6
	fzero	%f30
	fblg,a	%fcc2,	loop_428
	fmovspos	%xcc,	%f19,	%f25
	edge8n	%l5,	%i5,	%i3
	be,a,pn	%xcc,	loop_429
loop_428:
	ba,pt	%xcc,	loop_430
	xorcc	%o2,	0x1829,	%o3
	movvs	%icc,	%g2,	%l2
loop_429:
	tvs	%xcc,	0x1
loop_430:
	fandnot2s	%f21,	%f6,	%f14
	movl	%icc,	%l0,	%g6
	srlx	%g7,	%o1,	%l4
	orncc	%i1,	0x13F8,	%l3
	movg	%icc,	%i0,	%i4
	movrne	%o5,	0x388,	%g5
	orn	%l6,	%g3,	%l1
	fmovdle	%icc,	%f19,	%f8
	alignaddr	%i2,	%o0,	%i7
	udivx	%o4,	0x1D25,	%g1
	array16	%i6,	%o7,	%o6
	movne	%icc,	%l5,	%g4
	tgu	%xcc,	0x5
	edge16	%i3,	%i5,	%o2
	movge	%icc,	%g2,	%l2
	bcc,pt	%icc,	loop_431
	movg	%xcc,	%o3,	%g6
	wr	%g0,	0x80,	%asi
	stwa	%g7,	[%l7 + 0x20] %asi
loop_431:
	bvs	%icc,	loop_432
	stbar
	andncc	%o1,	%l0,	%l4
	tg	%icc,	0x0
loop_432:
	fbuge,a	%fcc2,	loop_433
	stb	%l3,	[%l7 + 0x2D]
	tne	%icc,	0x5
	ldsh	[%l7 + 0x38],	%i0
loop_433:
	fnand	%f0,	%f30,	%f8
	tne	%xcc,	0x0
	move	%xcc,	%i1,	%o5
	fpadd32s	%f5,	%f0,	%f6
	srlx	%g5,	%l6,	%g3
	xorcc	%i4,	0x0840,	%i2
	orncc	%o0,	%i7,	%l1
	sra	%o4,	0x0F,	%g1
	ldsh	[%l7 + 0x24],	%i6
	edge16n	%o6,	%l5,	%o7
	move	%xcc,	%i3,	%i5
	xor	%g4,	0x0B32,	%g2
	taddcc	%l2,	0x0104,	%o2
	ldsw	[%l7 + 0x1C],	%g6
	subc	%g7,	%o3,	%l0
	alignaddrl	%l4,	%o1,	%l3
	edge16	%i1,	%i0,	%o5
	brlz	%l6,	loop_434
	fbu	%fcc2,	loop_435
	ta	%icc,	0x7
	fmovrdne	%g3,	%f4,	%f26
loop_434:
	edge8n	%i4,	%i2,	%o0
loop_435:
	xnorcc	%g5,	0x1118,	%l1
	movvs	%xcc,	%i7,	%o4
	mova	%icc,	%g1,	%o6
	xorcc	%l5,	0x1778,	%i6
	movleu	%icc,	%i3,	%o7
	nop
	setx	0x545BD3B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f22
	movne	%xcc,	%i5,	%g4
	movpos	%xcc,	%g2,	%o2
	tg	%icc,	0x4
	sub	%l2,	%g6,	%o3
	nop
	fitos	%f0,	%f8
	fcmpgt32	%f30,	%f14,	%l0
	movcc	%icc,	%l4,	%g7
	array32	%l3,	%o1,	%i1
	fbu	%fcc1,	loop_436
	movge	%xcc,	%i0,	%l6
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
loop_436:
	sethi	0x004C,	%i4
	call	loop_437
	tvs	%xcc,	0x7
	movrgez	%g3,	0x085,	%o0
	edge8l	%i2,	%l1,	%i7
loop_437:
	brnz,a	%o4,	loop_438
	fbuge,a	%fcc0,	loop_439
	sethi	0x0877,	%g5
	andn	%g1,	0x02C0,	%l5
loop_438:
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f9
loop_439:
	xor	%o6,	%i6,	%o7
	popc	0x0D95,	%i3
	edge8l	%i5,	%g2,	%g4
	fnands	%f5,	%f10,	%f23
	fpackfix	%f14,	%f5
	subcc	%o2,	%l2,	%o3
	sllx	%l0,	0x1D,	%g6
	flush	%l7 + 0x28
	membar	0x4E
	movge	%xcc,	%g7,	%l4
	movre	%l3,	%i1,	%o1
	movn	%xcc,	%l6,	%i0
	movvc	%xcc,	%o5,	%i4
	movrne	%g3,	%i2,	%l1
	xnor	%i7,	0x1F2C,	%o4
	mulx	%o0,	%g1,	%l5
	array8	%o6,	%g5,	%i6
	fmovrde	%i3,	%f26,	%f6
	mulscc	%o7,	0x057D,	%i5
	fabss	%f20,	%f0
	set	0x5C, %l1
	ldsha	[%l7 + %l1] 0x11,	%g2
	tle	%icc,	0x1
	movg	%xcc,	%g4,	%l2
	bgu,a,pn	%xcc,	loop_440
	sdivcc	%o2,	0x16C4,	%o3
	edge16n	%l0,	%g6,	%g7
	fxnor	%f10,	%f20,	%f24
loop_440:
	edge16n	%l4,	%l3,	%o1
	set	0x16, %i3
	lduba	[%l7 + %i3] 0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%i0
	nop
	fitos	%f8,	%f3
	fstox	%f3,	%f16
	tn	%icc,	0x7
	ldd	[%l7 + 0x28],	%o4
	set	0x62, %g1
	ldsba	[%l7 + %g1] 0x10,	%i1
	tvc	%icc,	0x5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i4
	bcc	loop_441
	swap	[%l7 + 0x4C],	%i2
	array32	%l1,	%i7,	%o4
	and	%g3,	0x0CF2,	%o0
loop_441:
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f0
	srlx	%g1,	0x1E,	%l5
	alignaddrl	%g5,	%o6,	%i3
	movcc	%xcc,	%o7,	%i5
	fxor	%f2,	%f8,	%f0
	tvs	%xcc,	0x2
	srax	%g2,	%i6,	%l2
	sir	0x083B
	sdiv	%o2,	0x1EDE,	%g4
	nop
	fitos	%f5,	%f13
	tvs	%icc,	0x6
	sethi	0x198A,	%l0
	fnegs	%f26,	%f27
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o3
	array8	%g7,	%l4,	%l3
	bpos,a	%xcc,	loop_442
	bvs	%xcc,	loop_443
	and	%g6,	0x1538,	%o1
	movpos	%icc,	%i0,	%o5
loop_442:
	movre	%l6,	0x3F2,	%i4
loop_443:
	udivx	%i2,	0x01BC,	%i1
	prefetch	[%l7 + 0x18],	 0x2
	tgu	%xcc,	0x7
	andn	%i7,	%l1,	%o4
	ldstub	[%l7 + 0x45],	%o0
	orcc	%g3,	%l5,	%g1
	andn	%g5,	%i3,	%o7
	andn	%o6,	0x0D96,	%i5
	fmovrde	%i6,	%f22,	%f6
	fmovsvc	%icc,	%f4,	%f8
	fmovsn	%icc,	%f3,	%f4
	srax	%l2,	0x0E,	%g2
	fblg	%fcc1,	loop_444
	tsubcctv	%g4,	0x19CA,	%l0
	fpadd32s	%f11,	%f7,	%f22
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_444:
	xor	%o2,	%o3,	%g7
	bg	loop_445
	taddcc	%l3,	%l4,	%o1
	nop
	set	0x38, %o4
	ldsw	[%l7 + %o4],	%g6
	edge16ln	%i0,	%o5,	%l6
loop_445:
	fpack16	%f12,	%f9
	edge32n	%i2,	%i1,	%i4
	edge32ln	%l1,	%i7,	%o0
	fmul8x16	%f26,	%f14,	%f16
	tcs	%icc,	0x2
	set	0x54, %i7
	ldswa	[%l7 + %i7] 0x19,	%o4
	smul	%l5,	0x004E,	%g3
	movvc	%xcc,	%g1,	%g5
	stx	%o7,	[%l7 + 0x68]
	edge8ln	%i3,	%o6,	%i5
	umul	%l2,	0x0D1B,	%i6
	fmovrdgez	%g2,	%f4,	%f22
	edge16	%g4,	%o2,	%o3
	movle	%icc,	%l0,	%g7
	andcc	%l3,	%o1,	%g6
	sir	0x1306
	tsubcc	%l4,	0x1B58,	%o5
	bpos,a,pt	%icc,	loop_446
	tsubcctv	%l6,	0x1EC1,	%i0
	mova	%xcc,	%i2,	%i1
	fnot1s	%f13,	%f29
loop_446:
	addccc	%i4,	%i7,	%l1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o0
	orncc	%l5,	%o4,	%g3
	fmovspos	%xcc,	%f3,	%f30
	fsrc2s	%f6,	%f9
	te	%xcc,	0x4
	fmul8ulx16	%f12,	%f14,	%f14
	tsubcc	%g1,	0x042F,	%o7
	fbu,a	%fcc2,	loop_447
	fandnot1	%f4,	%f28,	%f8
	movn	%icc,	%g5,	%o6
	orcc	%i3,	%i5,	%i6
loop_447:
	fbule	%fcc1,	loop_448
	tsubcctv	%g2,	%g4,	%l2
	addc	%o3,	%l0,	%o2
	movvs	%icc,	%g7,	%o1
loop_448:
	tsubcc	%l3,	0x0535,	%g6
	ldsw	[%l7 + 0x30],	%l4
	tcs	%icc,	0x5
	tle	%icc,	0x4
	array16	%l6,	%o5,	%i0
	fmovd	%f14,	%f4
	array32	%i1,	%i2,	%i7
	edge16	%i4,	%l1,	%l5
	addccc	%o0,	%g3,	%o4
	fands	%f0,	%f3,	%f1
	fabss	%f9,	%f7
	umul	%o7,	0x12B0,	%g5
	movg	%icc,	%g1,	%o6
	umulcc	%i3,	0x1541,	%i5
	wr	%g0,	0x22,	%asi
	stha	%g2,	[%l7 + 0x3C] %asi
	membar	#Sync
	movrgz	%g4,	%l2,	%i6
	movrgz	%l0,	%o3,	%o2
	orncc	%g7,	%o1,	%l3
	orncc	%l4,	0x045C,	%l6
	xnorcc	%g6,	0x159D,	%o5
	sra	%i0,	%i1,	%i7
	mova	%icc,	%i4,	%i2
	edge8	%l5,	%l1,	%g3
	ta	%xcc,	0x4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o4,	%o7
	edge16n	%g5,	%o0,	%g1
	fands	%f11,	%f16,	%f7
	nop
	setx	loop_449,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x6363ED9F205334B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fpsub32	%f8,	%f2,	%f26
	fmovsn	%xcc,	%f31,	%f14
loop_449:
	movrne	%o6,	0x18F,	%i5
	movg	%xcc,	%i3,	%g2
	tcc	%xcc,	0x7
	movle	%icc,	%l2,	%i6
	movg	%xcc,	%g4,	%l0
	smulcc	%o2,	0x0FBF,	%g7
	tn	%xcc,	0x0
	addccc	%o1,	0x03DE,	%l3
	sub	%o3,	%l6,	%g6
	udivx	%l4,	0x13B4,	%o5
	tvs	%xcc,	0x1
	fsrc2s	%f24,	%f23
	sub	%i0,	0x090A,	%i7
	fornot2s	%f17,	%f8,	%f27
	umulcc	%i1,	%i4,	%i2
	sdiv	%l5,	0x0B8A,	%l1
	addc	%g3,	%o4,	%o7
	movvc	%xcc,	%g5,	%o0
	tg	%xcc,	0x0
	smul	%o6,	0x0F4E,	%i5
	fcmpne32	%f22,	%f20,	%g1
	bshuffle	%f16,	%f0,	%f28
	sir	0x0031
	movre	%i3,	0x1FD,	%l2
	fpadd32	%f8,	%f20,	%f12
	fmovsneg	%xcc,	%f31,	%f4
	fmovscs	%xcc,	%f11,	%f13
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i6
	movneg	%icc,	%g4,	%l0
	taddcctv	%o2,	%g2,	%o1
	nop
	setx	0x805FA4FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	xnor	%g7,	%o3,	%l6
	edge32ln	%l3,	%g6,	%o5
	fzeros	%f17
	fmovrdgez	%l4,	%f8,	%f28
	bgu,a	loop_450
	tsubcc	%i7,	%i1,	%i4
	fmul8x16au	%f0,	%f22,	%f4
	te	%xcc,	0x0
loop_450:
	fmovs	%f2,	%f31
	fmovrse	%i2,	%f30,	%f19
	movge	%xcc,	%l5,	%i0
	xnor	%l1,	0x17AD,	%g3
	tsubcctv	%o4,	%g5,	%o7
	fba	%fcc1,	loop_451
	tpos	%icc,	0x7
	edge16l	%o0,	%o6,	%g1
	edge32	%i5,	%l2,	%i6
loop_451:
	te	%icc,	0x4
	subccc	%i3,	%g4,	%l0
	edge8n	%o2,	%o1,	%g7
	movrlez	%o3,	0x28E,	%l6
	fmovrdlez	%g2,	%f30,	%f28
	sll	%g6,	0x0C,	%l3
	fandnot1	%f26,	%f0,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x0
	fmul8x16	%f9,	%f22,	%f14
	movge	%icc,	%o5,	%i7
	tpos	%xcc,	0x5
	sethi	0x0635,	%l4
	fbne	%fcc1,	loop_452
	orncc	%i1,	%i2,	%i4
	mulx	%l5,	%i0,	%l1
	movge	%xcc,	%g3,	%g5
loop_452:
	movgu	%xcc,	%o7,	%o4
	set	0x24, %o3
	stwa	%o6,	[%l7 + %o3] 0xe2
	membar	#Sync
	ble	%xcc,	loop_453
	tleu	%xcc,	0x4
	nop
	setx	loop_454,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%o0,	0x076D,	%i5
loop_453:
	mulscc	%g1,	%l2,	%i6
	fbule	%fcc3,	loop_455
loop_454:
	smulcc	%i3,	%g4,	%o2
	sethi	0x1F43,	%l0
	smul	%o1,	0x1C73,	%o3
loop_455:
	bneg	loop_456
	addccc	%g7,	0x11DB,	%l6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g2,	%l3
loop_456:
	movcc	%xcc,	%o5,	%g6
	sll	%l4,	%i7,	%i1
	sth	%i4,	[%l7 + 0x3E]
	fmovdvc	%icc,	%f16,	%f29
	movrlez	%l5,	%i2,	%i0
	membar	0x6F
	bge,a,pt	%icc,	loop_457
	tne	%icc,	0x2
	movpos	%icc,	%g3,	%g5
	taddcc	%l1,	0x1294,	%o4
loop_457:
	fblg	%fcc3,	loop_458
	popc	%o6,	%o7
	fble,a	%fcc1,	loop_459
	flush	%l7 + 0x60
loop_458:
	nop
	setx	loop_460,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%o0,	%g1,	%i5
loop_459:
	xor	%i6,	%l2,	%i3
	movle	%xcc,	%g4,	%l0
loop_460:
	udivx	%o1,	0x0C72,	%o2
	ldd	[%l7 + 0x38],	%g6
	edge16ln	%o3,	%g2,	%l3
	fbul,a	%fcc3,	loop_461
	fbug,a	%fcc0,	loop_462
	nop
	fitos	%f13,	%f30
	fstox	%f30,	%f24
	fmovdneg	%xcc,	%f2,	%f10
loop_461:
	fmovdl	%icc,	%f3,	%f22
loop_462:
	nop
	set	0x38, %o0
	ldstuba	[%l7 + %o0] 0x0c,	%l6
	fcmpne16	%f12,	%f26,	%o5
	fmovsn	%xcc,	%f2,	%f23
	nop
	setx	0x9A823074A063C6AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	mulscc	%l4,	%i7,	%i1
	ldstub	[%l7 + 0x6A],	%i4
	nop
	fitod	%f8,	%f28
	fdtos	%f28,	%f9
	movcs	%xcc,	%l5,	%g6
	tneg	%xcc,	0x1
	movcc	%icc,	%i2,	%g3
	fmovdcs	%icc,	%f24,	%f19
	tge	%icc,	0x3
	fble	%fcc3,	loop_463
	brnz	%i0,	loop_464
	fzero	%f12
	movneg	%xcc,	%l1,	%o4
loop_463:
	te	%icc,	0x6
loop_464:
	tsubcc	%g5,	%o6,	%o0
	edge8n	%g1,	%o7,	%i6
	movle	%icc,	%i5,	%i3
	fmovsl	%icc,	%f21,	%f4
	nop
	setx	0xC8B4150D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x0CD41F01,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f19,	%f11
	fmovscs	%xcc,	%f28,	%f17
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x14,	%f16
	swap	[%l7 + 0x4C],	%g4
	brnz	%l0,	loop_465
	fmovdle	%icc,	%f23,	%f4
	popc	%o1,	%l2
	bcs,pt	%icc,	loop_466
loop_465:
	udiv	%o2,	0x01B2,	%o3
	edge8l	%g7,	%g2,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o5
loop_466:
	fpadd32s	%f18,	%f30,	%f11
	bge,a,pt	%xcc,	loop_467
	sethi	0x0351,	%l4
	bneg,a	%icc,	loop_468
	fmul8x16al	%f21,	%f30,	%f10
loop_467:
	movvc	%icc,	%i7,	%i1
	fmovscc	%icc,	%f4,	%f4
loop_468:
	taddcctv	%i4,	0x1E86,	%l5
	movgu	%icc,	%l3,	%i2
	nop
	setx	0xA91E4EF8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x8A509DBB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f2,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g6,	%g3,	%i0
	orncc	%o4,	%l1,	%o6
	fbn	%fcc2,	loop_469
	ba	loop_470
	nop
	setx	0x0BE0B656,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x3CAFD81F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f0,	%f3
	tpos	%xcc,	0x3
loop_469:
	movrne	%o0,	0x37B,	%g5
loop_470:
	fmovdne	%icc,	%f8,	%f14
	tsubcc	%g1,	%i6,	%i5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i3
	brgz	%o7,	loop_471
	movneg	%xcc,	%l0,	%g4
	fnor	%f2,	%f6,	%f16
	flush	%l7 + 0x24
loop_471:
	be,pt	%xcc,	loop_472
	movn	%icc,	%o1,	%l2
	nop
	set	0x10, %g4
	stw	%o2,	[%l7 + %g4]
	fmovsge	%icc,	%f19,	%f29
loop_472:
	fmovde	%icc,	%f22,	%f26
	set	0x18, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g7
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0x3
	lduh	[%l7 + 0x40],	%l6
	set	0x30, %o7
	sta	%f3,	[%l7 + %o7] 0x0c
	fexpand	%f17,	%f12
	xor	%o5,	0x04C5,	%l4
	andcc	%o3,	%i7,	%i1
	bcs,a,pn	%icc,	loop_473
	or	%l5,	0x1305,	%i4
	umulcc	%i2,	0x1861,	%g6
	taddcc	%g3,	%l3,	%o4
loop_473:
	sra	%l1,	0x1C,	%o6
	fmovsvc	%xcc,	%f19,	%f13
	sdivx	%o0,	0x0D8E,	%g5
	movvs	%xcc,	%g1,	%i0
	edge16l	%i6,	%i3,	%i5
	fbo,a	%fcc2,	loop_474
	xor	%o7,	0x02DB,	%g4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o1
loop_474:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f4
	edge16n	%l0,	%o2,	%g7
	xorcc	%l2,	0x0FF9,	%g2
	fbl	%fcc1,	loop_475
	tsubcc	%l6,	0x03E9,	%l4
	orn	%o3,	%o5,	%i1
	andn	%i7,	0x16C4,	%i4
loop_475:
	movpos	%icc,	%i2,	%g6
	array32	%g3,	%l5,	%l3
	fmovdn	%xcc,	%f19,	%f21
	addccc	%l1,	%o6,	%o4
	fmovrse	%g5,	%f11,	%f9
	addccc	%o0,	%i0,	%g1
	tle	%xcc,	0x6
	sll	%i6,	%i5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	%o1,	%l0
	smul	%o2,	%g4,	%l2
	fbue	%fcc3,	loop_476
	orn	%g2,	%l6,	%l4
	tle	%xcc,	0x5
	fpsub16s	%f15,	%f23,	%f28
loop_476:
	fbuge	%fcc2,	loop_477
	fble,a	%fcc2,	loop_478
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x7
loop_477:
	tvc	%xcc,	0x3
loop_478:
	orcc	%g7,	%o3,	%i1
	smulcc	%i7,	%i4,	%o5
	fbule	%fcc1,	loop_479
	edge8n	%i2,	%g3,	%l5
	xorcc	%g6,	%l3,	%l1
	movrgz	%o6,	0x16C,	%o4
loop_479:
	andn	%g5,	0x006F,	%i0
	movle	%icc,	%g1,	%i6
	fnot1	%f4,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%o0,	loop_480
	ba,a,pn	%xcc,	loop_481
	movge	%xcc,	%i3,	%o7
	subcc	%i5,	%o1,	%o2
loop_480:
	subc	%l0,	0x11A6,	%l2
loop_481:
	nop
	setx	0x605EE9F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fxnors	%f3,	%f26,	%f5
	flush	%l7 + 0x54
	tpos	%icc,	0x2
	nop
	fitos	%f2,	%f1
	fstod	%f1,	%f2
	movleu	%icc,	%g2,	%l6
	fsrc1	%f30,	%f6
	andcc	%l4,	%g7,	%o3
	fmovde	%icc,	%f10,	%f25
	lduw	[%l7 + 0x28],	%i1
	array16	%g4,	%i7,	%o5
	fbge,a	%fcc0,	loop_482
	nop
	setx	loop_483,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%i4,	%g3,	%l5
	movrgez	%i2,	0x377,	%g6
loop_482:
	membar	0x02
loop_483:
	fba,a	%fcc0,	loop_484
	fmovdcc	%xcc,	%f14,	%f3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%l3
loop_484:
	fmovdg	%xcc,	%f30,	%f24
	fcmpne16	%f2,	%f18,	%l1
	fmovda	%xcc,	%f7,	%f13
	fsrc2s	%f27,	%f28
	fmul8ulx16	%f4,	%f18,	%f24
	faligndata	%f6,	%f26,	%f28
	te	%xcc,	0x4
	tne	%icc,	0x7
	xorcc	%o4,	%g5,	%i0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x46] %asi,	%o6
	bleu	%icc,	loop_485
	movvs	%icc,	%i6,	%o0
	set	0x12, %o6
	ldsha	[%l7 + %o6] 0x80,	%i3
loop_485:
	umulcc	%o7,	0x076F,	%g1
	udiv	%o1,	0x10F7,	%i5
	tgu	%xcc,	0x1
	bcs	%icc,	loop_486
	sdivcc	%o2,	0x0B0A,	%l2
	lduw	[%l7 + 0x5C],	%l0
	mulx	%l6,	0x0173,	%l4
loop_486:
	movneg	%icc,	%g7,	%o3
	nop
	setx	0xC7406237C06E92F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fexpand	%f5,	%f16
	andcc	%i1,	%g2,	%i7
	bcc,a,pn	%xcc,	loop_487
	fpsub32	%f30,	%f10,	%f10
	subc	%g4,	%i4,	%g3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
loop_487:
	tvc	%xcc,	0x4
	fcmpgt32	%f28,	%f2,	%i2
	fba	%fcc0,	loop_488
	sethi	0x08C4,	%o5
	edge32	%l3,	%g6,	%o4
	fsrc1	%f10,	%f28
loop_488:
	nop
	set	0x38, %l6
	stxa	%g5,	[%l7 + %l6] 0x19
	flush	%l7 + 0x50
	fcmpgt16	%f2,	%f4,	%i0
	mova	%icc,	%o6,	%l1
	fsrc1	%f2,	%f14
	nop
	fitos	%f10,	%f9
	fstox	%f9,	%f30
	fxtos	%f30,	%f22
	set	0x47, %i4
	ldstuba	[%l7 + %i4] 0x89,	%i6
	ldub	[%l7 + 0x0F],	%i3
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x18] %asi,	%o0
	fnors	%f3,	%f1,	%f25
	tsubcc	%g1,	%o1,	%i5
	tneg	%xcc,	0x2
	fblg,a	%fcc2,	loop_489
	fcmpne16	%f4,	%f16,	%o7
	sir	0x048F
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_489:
	nop
	wr	%g0,	0x2a,	%asi
	stwa	%l2,	[%l7 + 0x64] %asi
	membar	#Sync
	orncc	%l0,	%o2,	%l6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	fmovdge	%xcc,	%f4,	%f21
	fmovrdne	%o3,	%f4,	%f24
	fblg	%fcc3,	loop_490
	bn,a,pn	%icc,	loop_491
	movn	%xcc,	%i1,	%g2
	subccc	%i7,	%g7,	%i4
loop_490:
	tpos	%icc,	0x6
loop_491:
	orn	%g3,	0x14A4,	%g4
	movvc	%xcc,	%l5,	%o5
	ldub	[%l7 + 0x30],	%i2
	movge	%icc,	%l3,	%o4
	sir	0x0F75
	tle	%icc,	0x3
	add	%g5,	0x0177,	%g6
	call	loop_492
	fbe,a	%fcc3,	loop_493
	fmovrdlz	%o6,	%f16,	%f16
	popc	%l1,	%i0
loop_492:
	sub	%i3,	0x19B1,	%i6
loop_493:
	tn	%icc,	0x2
	edge16ln	%o0,	%g1,	%i5
	fbl,a	%fcc2,	loop_494
	tne	%xcc,	0x1
	fmovsvs	%xcc,	%f22,	%f13
	xnorcc	%o7,	%o1,	%l2
loop_494:
	edge8n	%o2,	%l0,	%l6
	sra	%l4,	%i1,	%o3
	movrgz	%i7,	%g2,	%g7
	edge16ln	%g3,	%i4,	%l5
	mulx	%o5,	0x0303,	%g4
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f10
	tn	%icc,	0x4
	fornot2	%f4,	%f24,	%f2
	brz,a	%i2,	loop_495
	edge8ln	%o4,	%l3,	%g6
	addccc	%o6,	0x1FFB,	%g5
	tge	%icc,	0x2
loop_495:
	umulcc	%i0,	0x19DC,	%l1
	mova	%icc,	%i6,	%i3
	taddcctv	%g1,	%i5,	%o7
	edge8	%o1,	%l2,	%o2
	wr	%g0,	0x23,	%asi
	stwa	%o0,	[%l7 + 0x68] %asi
	membar	#Sync
	tne	%xcc,	0x6
	fzeros	%f14
	bshuffle	%f18,	%f22,	%f14
	subcc	%l6,	0x14F5,	%l0
	edge16	%i1,	%o3,	%i7
	tvc	%xcc,	0x7
	bpos,a	%icc,	loop_496
	andncc	%g2,	%g7,	%l4
	and	%g3,	0x188E,	%l5
	fbule,a	%fcc3,	loop_497
loop_496:
	tge	%icc,	0x2
	movcs	%xcc,	%o5,	%g4
	nop
	setx	0x005B4037,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
loop_497:
	move	%xcc,	%i2,	%i4
	movg	%xcc,	%l3,	%o4
	orcc	%o6,	0x1E72,	%g5
	fzero	%f12
	edge32n	%i0,	%g6,	%i6
	subc	%i3,	%g1,	%i5
	bvs	loop_498
	addccc	%o7,	%o1,	%l2
	tvs	%xcc,	0x2
	fpadd16	%f24,	%f22,	%f28
loop_498:
	fxnor	%f24,	%f20,	%f16
	fnegd	%f22,	%f0
	fmovrdlez	%l1,	%f28,	%f8
	movl	%xcc,	%o0,	%l6
	movgu	%xcc,	%o2,	%i1
	ldd	[%l7 + 0x78],	%f22
	fnegd	%f6,	%f8
	bg,a,pt	%icc,	loop_499
	fbe,a	%fcc3,	loop_500
	fpadd16s	%f7,	%f14,	%f7
	fpadd16s	%f18,	%f30,	%f30
loop_499:
	movle	%xcc,	%o3,	%i7
loop_500:
	fbge,a	%fcc2,	loop_501
	tcc	%xcc,	0x4
	array8	%l0,	%g7,	%g2
	subc	%l4,	0x029F,	%g3
loop_501:
	ldsb	[%l7 + 0x79],	%l5
	movvc	%icc,	%o5,	%i2
	ldsw	[%l7 + 0x70],	%i4
	subcc	%g4,	0x0A58,	%o4
	tsubcc	%o6,	0x17F0,	%l3
	fmovrdlz	%g5,	%f8,	%f10
	ldsw	[%l7 + 0x3C],	%g6
	fbuge	%fcc1,	loop_502
	lduh	[%l7 + 0x64],	%i0
	set	0x10, %o1
	ldxa	[%l7 + %o1] 0x0c,	%i3
loop_502:
	tl	%xcc,	0x6
	movrlez	%i6,	0x21E,	%i5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%g0
	nop
	fitos	%f4,	%f21
	fstoi	%f21,	%f10
	orn	%o1,	0x0C37,	%l2
	subccc	%o7,	0x1F68,	%l1
	mulscc	%l6,	0x05EF,	%o2
	fmovrdgz	%i1,	%f14,	%f22
	xnorcc	%o3,	%o0,	%i7
	flush	%l7 + 0x70
	sdivcc	%g7,	0x0B25,	%l0
	tl	%icc,	0x6
	nop
	setx	0x10A1C533A0718E8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	fmovsne	%xcc,	%f25,	%f13
	udivx	%g2,	0x17D1,	%g3
	tsubcctv	%o5,	%l5,	%i4
	orn	%g4,	%o4,	%o6
	bl,a	%icc,	loop_503
	swap	[%l7 + 0x18],	%l3
	andn	%i2,	0x0915,	%g6
	sll	%g5,	0x0C,	%i0
loop_503:
	ldsw	[%l7 + 0x64],	%i6
	and	%i3,	%i5,	%g1
	movpos	%icc,	%l2,	%o1
	mulscc	%o7,	0x1C21,	%l1
	mova	%icc,	%l6,	%o2
	add	%o3,	%i1,	%i7
	brlz	%o0,	loop_504
	fblg	%fcc2,	loop_505
	movvc	%xcc,	%l0,	%g7
	movrgz	%l4,	0x06B,	%g3
loop_504:
	subccc	%o5,	%l5,	%i4
loop_505:
	movleu	%icc,	%g2,	%o4
	membar	0x4D
	ble	loop_506
	subcc	%o6,	0x178A,	%g4
	bcs,a,pn	%icc,	loop_507
	tsubcc	%i2,	0x06A4,	%g6
loop_506:
	sdivcc	%l3,	0x1ED1,	%g5
	edge16l	%i6,	%i0,	%i3
loop_507:
	fnot1	%f6,	%f26
	ldsw	[%l7 + 0x68],	%g1
	fmovscs	%xcc,	%f22,	%f7
	movne	%icc,	%l2,	%o1
	edge32l	%o7,	%l1,	%i5
	fblg	%fcc2,	loop_508
	tneg	%icc,	0x3
	fmul8x16al	%f11,	%f26,	%f14
	set	0x28, %l3
	swapa	[%l7 + %l3] 0x80,	%l6
loop_508:
	andn	%o3,	0x04FC,	%o2
	sllx	%i7,	%i1,	%o0
	array16	%l0,	%g7,	%g3
	movvs	%xcc,	%l4,	%o5
	std	%f6,	[%l7 + 0x20]
	movvs	%icc,	%l5,	%i4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x5A] %asi,	%g2
	bshuffle	%f4,	%f8,	%f8
	fmovdcs	%xcc,	%f15,	%f23
	sethi	0x0D8C,	%o6
	tvs	%icc,	0x4
	fbne	%fcc3,	loop_509
	tg	%icc,	0x6
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f30
	subccc	%o4,	0x1F00,	%g4
loop_509:
	movcc	%icc,	%g6,	%l3
	fors	%f18,	%f27,	%f3
	srlx	%i2,	0x1B,	%i6
	nop
	setx	0x014A4CE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xC08264FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f0,	%f2
	bgu,a	loop_510
	fbule,a	%fcc2,	loop_511
	fornot1s	%f5,	%f7,	%f2
	fsrc2	%f28,	%f18
loop_510:
	tn	%xcc,	0x0
loop_511:
	tleu	%icc,	0x1
	fxors	%f6,	%f25,	%f4
	movrgez	%g5,	%i0,	%i3
	movrgez	%g1,	0x2D0,	%l2
	fpadd16	%f24,	%f12,	%f30
	stw	%o1,	[%l7 + 0x1C]
	tn	%icc,	0x2
	stw	%l1,	[%l7 + 0x5C]
	tsubcctv	%i5,	0x131E,	%l6
	srl	%o3,	%o7,	%o2
	sllx	%i1,	0x0D,	%o0
	tle	%xcc,	0x7
	brlz	%l0,	loop_512
	bleu,pt	%icc,	loop_513
	sdivcc	%i7,	0x1D63,	%g3
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf8
	membar	#Sync
loop_512:
	movrlez	%g7,	%o5,	%l5
loop_513:
	mulx	%i4,	%g2,	%l4
	nop
	setx	0x106E3805,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	bcc,pt	%xcc,	loop_514
	edge8l	%o6,	%g4,	%g6
	srax	%o4,	%l3,	%i6
	fba	%fcc0,	loop_515
loop_514:
	nop
	fitod	%f19,	%f24
	movne	%icc,	%g5,	%i0
	addcc	%i2,	0x03D4,	%g1
loop_515:
	fand	%f2,	%f12,	%f16
	tg	%icc,	0x7
	andcc	%l2,	0x14B5,	%i3
	movg	%xcc,	%l1,	%o1
	fmovdge	%icc,	%f1,	%f19
	movcc	%icc,	%i5,	%l6
	edge8	%o3,	%o7,	%o2
	popc	0x1C44,	%o0
	movl	%xcc,	%l0,	%i7
	movre	%i1,	0x15B,	%g7
	ldd	[%l7 + 0x08],	%g2
	movne	%xcc,	%l5,	%o5
	tgu	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x11,	%g2,	%i4
	movg	%xcc,	%o6,	%g4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x52] %asi,	%l4
	edge8	%o4,	%l3,	%i6
	fba,a	%fcc3,	loop_516
	addc	%g6,	0x0F8D,	%i0
	bpos,a	loop_517
	movgu	%xcc,	%i2,	%g5
loop_516:
	edge8	%g1,	%l2,	%l1
	udiv	%o1,	0x1BC2,	%i5
loop_517:
	fbul,a	%fcc3,	loop_518
	ble,pn	%xcc,	loop_519
	fpackfix	%f2,	%f19
	tvc	%xcc,	0x0
loop_518:
	srax	%i3,	0x1B,	%l6
loop_519:
	fmul8ulx16	%f18,	%f10,	%f22
	movpos	%xcc,	%o3,	%o2
	ldd	[%l7 + 0x78],	%o6
	set	0x24, %i1
	sta	%f9,	[%l7 + %i1] 0x81
	fpackfix	%f8,	%f27
	alignaddrl	%l0,	%i7,	%o0
	movre	%g7,	0x19D,	%i1
	movcc	%icc,	%l5,	%g3
	xnorcc	%o5,	0x1E02,	%g2
	movn	%xcc,	%o6,	%g4
	fbne,a	%fcc0,	loop_520
	fba	%fcc0,	loop_521
	edge32l	%i4,	%o4,	%l3
	sll	%l4,	%g6,	%i0
loop_520:
	movn	%xcc,	%i2,	%g5
loop_521:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%i6
	fmovd	%f24,	%f14
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f18
	fnands	%f8,	%f15,	%f21
	ldd	[%l7 + 0x10],	%f26
	fbe,a	%fcc3,	loop_522
	movl	%xcc,	%g1,	%l1
	fmovsvc	%xcc,	%f22,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_522:
	fabsd	%f6,	%f2
	udivcc	%o1,	0x0F3D,	%i5
	tne	%xcc,	0x5
	edge16l	%i3,	%l2,	%l6
	taddcc	%o2,	%o7,	%o3
	add	%l0,	%i7,	%o0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x40] %asi,	%i1
	fmovsn	%icc,	%f21,	%f20
	fornot2s	%f4,	%f4,	%f6
	tle	%xcc,	0x6
	addccc	%l5,	0x09F5,	%g3
	bvc,a	%icc,	loop_523
	subccc	%o5,	%g7,	%g2
	bge,a	%icc,	loop_524
	nop
	setx	0xD43422B2C23B977F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xDC166C9191FDC154,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f26,	%f28
loop_523:
	orncc	%g4,	0x0F2E,	%i4
	sra	%o4,	0x15,	%l3
loop_524:
	fmovrslez	%o6,	%f11,	%f0
	fbge	%fcc3,	loop_525
	sir	0x0C07
	fors	%f3,	%f12,	%f6
	fmovdne	%icc,	%f10,	%f3
loop_525:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x7
	mulx	%l4,	0x0233,	%i0
	movl	%icc,	%g6,	%g5
	ldd	[%l7 + 0x70],	%i2
	ld	[%l7 + 0x70],	%f21
	sdivcc	%g1,	0x1B1D,	%i6
	bl	loop_526
	edge32n	%l1,	%i5,	%o1
	sra	%i3,	0x09,	%l6
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x88,	%l2
loop_526:
	movge	%icc,	%o7,	%o2
	tn	%icc,	0x7
	smul	%l0,	0x02FF,	%i7
	fpadd16s	%f13,	%f6,	%f11
	fbne,a	%fcc3,	loop_527
	addcc	%o3,	0x08C5,	%i1
	ldd	[%l7 + 0x68],	%l4
	set	0x78, %o5
	sta	%f19,	[%l7 + %o5] 0x14
loop_527:
	nop
	fitod	%f12,	%f14
	fdtos	%f14,	%f19
	movcc	%icc,	%o0,	%o5
	fmovsvs	%xcc,	%f25,	%f22
	ld	[%l7 + 0x3C],	%f22
	bneg,a,pn	%xcc,	loop_528
	fnot2s	%f11,	%f22
	ble	%xcc,	loop_529
	xnor	%g7,	0x157D,	%g3
loop_528:
	taddcc	%g2,	%g4,	%i4
	fbu	%fcc1,	loop_530
loop_529:
	orn	%l3,	%o6,	%l4
	fornot1s	%f24,	%f15,	%f9
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x24] %asi,	%f3
loop_530:
	tvs	%xcc,	0x1
	tpos	%xcc,	0x6
	fmovrslez	%i0,	%f9,	%f3
	addc	%o4,	%g5,	%i2
	tl	%icc,	0x1
	st	%f7,	[%l7 + 0x30]
	sdivx	%g6,	0x0334,	%g1
	popc	0x0905,	%l1
	edge8n	%i6,	%i5,	%o1
	movrlez	%i3,	0x073,	%l6
	popc	0x0D6B,	%o7
	fornot2s	%f13,	%f28,	%f3
	popc	%l2,	%o2
	fmovrdgz	%i7,	%f8,	%f14
	array8	%l0,	%o3,	%l5
	array8	%i1,	%o0,	%o5
	tl	%icc,	0x5
	movvc	%icc,	%g3,	%g7
	orn	%g2,	%g4,	%l3
	fpackfix	%f18,	%f31
	srl	%o6,	0x07,	%l4
	fandnot1s	%f23,	%f0,	%f8
	nop
	setx	loop_531,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbuge,a	%fcc1,	loop_532
	nop
	setx	loop_533,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%i0,	%o4,	%i4
loop_531:
	nop
	set	0x53, %l2
	ldsba	[%l7 + %l2] 0x88,	%g5
loop_532:
	be,pn	%xcc,	loop_534
loop_533:
	tcs	%icc,	0x0
	fbne	%fcc3,	loop_535
	sdiv	%g6,	0x10F0,	%g1
loop_534:
	mova	%xcc,	%l1,	%i6
	movg	%icc,	%i5,	%i2
loop_535:
	sdivcc	%i3,	0x131A,	%l6
	sub	%o1,	0x1667,	%o7
	set	0x25, %i5
	lduba	[%l7 + %i5] 0x88,	%l2
	bcs	%xcc,	loop_536
	fzeros	%f19
	edge16n	%i7,	%l0,	%o2
	tge	%xcc,	0x0
loop_536:
	addc	%l5,	0x1A9F,	%o3
	fmovrdgz	%i1,	%f12,	%f0
	pdist	%f22,	%f20,	%f18
	set	0x7C, %l5
	lduwa	[%l7 + %l5] 0x04,	%o0
	sll	%g3,	%g7,	%o5
	fpsub32s	%f8,	%f25,	%f13
	fbn,a	%fcc3,	loop_537
	movcs	%icc,	%g2,	%g4
	fornot1	%f4,	%f26,	%f6
	and	%l3,	%l4,	%o6
loop_537:
	sdivx	%o4,	0x061F,	%i4
	srlx	%i0,	0x0D,	%g6
	fmovdcc	%icc,	%f13,	%f9
	ble,a,pt	%xcc,	loop_538
	bvc,a,pn	%icc,	loop_539
	xor	%g1,	%l1,	%g5
	brgez,a	%i5,	loop_540
loop_538:
	movcs	%icc,	%i2,	%i3
loop_539:
	addccc	%l6,	%o1,	%o7
	movrlez	%l2,	0x0B9,	%i7
loop_540:
	add	%i6,	0x07A8,	%l0
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x14,	 0x3
	popc	%o2,	%i1
	fmovsa	%icc,	%f6,	%f21
	edge8	%o0,	%o3,	%g7
	movne	%icc,	%o5,	%g3
	move	%xcc,	%g2,	%l3
	sdivcc	%g4,	0x1C15,	%l4
	bl,a,pn	%icc,	loop_541
	fbue	%fcc3,	loop_542
	movl	%icc,	%o4,	%o6
	fmovsvc	%xcc,	%f26,	%f21
loop_541:
	movl	%xcc,	%i0,	%g6
loop_542:
	movge	%icc,	%g1,	%i4
	movn	%xcc,	%g5,	%l1
	sllx	%i5,	0x1B,	%i2
	alignaddr	%l6,	%o1,	%i3
	ld	[%l7 + 0x54],	%f5
	fmovde	%xcc,	%f6,	%f17
	movne	%xcc,	%l2,	%o7
	movrgez	%i7,	%l0,	%l5
	tle	%icc,	0x0
	mova	%icc,	%i6,	%i1
	fnegd	%f24,	%f2
	array32	%o0,	%o2,	%o3
	add	%g7,	%o5,	%g2
	nop
	setx loop_543, %l0, %l1
	jmpl %l1, %l3
	edge8ln	%g4,	%l4,	%o4
	edge8l	%o6,	%g3,	%g6
	ldsh	[%l7 + 0x5C],	%g1
loop_543:
	sllx	%i0,	%g5,	%i4
	orcc	%l1,	0x16BB,	%i2
	bpos	loop_544
	tcs	%icc,	0x2
	xor	%l6,	%o1,	%i5
	alignaddr	%i3,	%l2,	%o7
loop_544:
	tneg	%icc,	0x2
	movneg	%icc,	%i7,	%l0
	fbug,a	%fcc3,	loop_545
	xor	%i6,	0x1551,	%i1
	movrne	%o0,	0x30D,	%l5
	alignaddrl	%o3,	%g7,	%o5
loop_545:
	movleu	%icc,	%o2,	%l3
	movcc	%xcc,	%g2,	%l4
	nop
	setx	0xCD05B10F65EEDF89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x29C6BB062AE15AB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f6,	%f0
	ble,a	loop_546
	ldsb	[%l7 + 0x34],	%o4
	array16	%g4,	%g3,	%o6
	popc	0x13F5,	%g1
loop_546:
	sllx	%g6,	%i0,	%i4
	swap	[%l7 + 0x38],	%g5
	fornot2s	%f23,	%f27,	%f4
	fmovdleu	%xcc,	%f5,	%f22
	tsubcctv	%i2,	%l6,	%l1
	srl	%i5,	0x05,	%i3
	xorcc	%o1,	%l2,	%o7
	nop
	setx	0x0064C8AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	movge	%icc,	%l0,	%i7
	nop
	setx	loop_547,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsneg	%xcc,	%f18,	%f21
	subccc	%i1,	%o0,	%l5
	subcc	%o3,	%g7,	%i6
loop_547:
	fmovd	%f12,	%f24
	bneg,pn	%icc,	loop_548
	add	%o5,	%o2,	%l3
	set	0x60, %g3
	stxa	%l4,	[%l7 + %g3] 0xea
	membar	#Sync
loop_548:
	tle	%xcc,	0x7
	orn	%g2,	%o4,	%g4
	ta	%xcc,	0x1
	subc	%o6,	0x1C4E,	%g3
	nop
	setx	loop_549,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,pt	%xcc,	loop_550
	orncc	%g1,	0x1160,	%g6
	subccc	%i4,	0x0BC1,	%i0
loop_549:
	taddcc	%g5,	%i2,	%l1
loop_550:
	umulcc	%i5,	%i3,	%o1
	xnorcc	%l6,	0x0D8D,	%o7
	fnands	%f22,	%f12,	%f20
	udivx	%l0,	0x18CF,	%l2
	nop
	setx	0x6D2898EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f26
	nop
	set	0x6B, %i0
	ldstub	[%l7 + %i0],	%i7
	movcc	%xcc,	%o0,	%l5
	edge32l	%i1,	%g7,	%o3
	fmovrdne	%i6,	%f12,	%f10
	sdivx	%o5,	0x1618,	%l3
	orncc	%o2,	%g2,	%l4
	addcc	%o4,	%g4,	%g3
	orncc	%o6,	0x1B02,	%g6
	fblg,a	%fcc2,	loop_551
	edge32ln	%g1,	%i0,	%g5
	bcs	loop_552
	brz	%i2,	loop_553
loop_551:
	fmovsle	%xcc,	%f14,	%f2
	movvc	%icc,	%i4,	%l1
loop_552:
	fnand	%f28,	%f26,	%f8
loop_553:
	tge	%icc,	0x3
	movgu	%icc,	%i3,	%i5
	add	%o1,	0x0454,	%o7
	fbo	%fcc3,	loop_554
	add	%l0,	0x0922,	%l6
	fmovspos	%xcc,	%f0,	%f21
	xor	%i7,	%l2,	%o0
loop_554:
	sdiv	%l5,	0x081A,	%i1
	andn	%o3,	%i6,	%o5
	fands	%f15,	%f16,	%f11
	fcmple32	%f8,	%f16,	%l3
	st	%f24,	[%l7 + 0x68]
	srlx	%o2,	0x1D,	%g2
	tne	%xcc,	0x3
	set	0x1C, %i2
	ldswa	[%l7 + %i2] 0x0c,	%l4
	srl	%o4,	0x0A,	%g4
	xor	%g7,	0x0B95,	%o6
	stx	%g3,	[%l7 + 0x60]
	or	%g1,	0x1857,	%i0
	set	0x7F, %l1
	ldsba	[%l7 + %l1] 0x81,	%g6
	fmovsleu	%xcc,	%f26,	%f20
	tg	%xcc,	0x1
	edge16l	%i2,	%i4,	%l1
	bleu,a,pn	%xcc,	loop_555
	or	%i3,	%i5,	%g5
	nop
	setx	0x3346341E205474B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	array16	%o7,	%l0,	%l6
loop_555:
	bl,a,pt	%icc,	loop_556
	fmovdvs	%icc,	%f2,	%f13
	swap	[%l7 + 0x08],	%i7
	bn,pt	%icc,	loop_557
loop_556:
	movl	%icc,	%o1,	%l2
	movcs	%icc,	%l5,	%i1
	edge32n	%o3,	%i6,	%o0
loop_557:
	mova	%xcc,	%o5,	%l3
	mulx	%o2,	%g2,	%o4
	nop
	setx	loop_558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x60],	%f0
	edge8	%g4,	%l4,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%g7
loop_558:
	be	%xcc,	loop_559
	movneg	%xcc,	%g1,	%i0
	bn,a,pt	%xcc,	loop_560
	tleu	%icc,	0x3
loop_559:
	stw	%g6,	[%l7 + 0x58]
	movle	%icc,	%i4,	%i2
loop_560:
	ba,a,pn	%xcc,	loop_561
	movg	%icc,	%l1,	%i3
	alignaddrl	%g5,	%o7,	%l0
	mulscc	%i5,	%l6,	%o1
loop_561:
	swap	[%l7 + 0x34],	%i7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x0c,	%l2,	%l5
	bn,a,pt	%xcc,	loop_562
	andn	%o3,	%i1,	%o0
	popc	%i6,	%l3
	fba,a	%fcc2,	loop_563
loop_562:
	edge16n	%o5,	%o2,	%o4
	udiv	%g2,	0x0EAA,	%l4
	fmovsge	%icc,	%f12,	%f0
loop_563:
	sllx	%g4,	%o6,	%g7
	edge32n	%g1,	%g3,	%i0
	nop
	fitos	%f14,	%f26
	fstod	%f26,	%f26
	fmovdn	%icc,	%f5,	%f6
	mova	%icc,	%i4,	%i2
	tvs	%xcc,	0x5
	fmovsneg	%icc,	%f5,	%f29
	fbne,a	%fcc2,	loop_564
	fbne	%fcc3,	loop_565
	faligndata	%f26,	%f6,	%f16
	fxnor	%f26,	%f26,	%f30
loop_564:
	nop
	setx	0x925C8DE2178DB786,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f12
loop_565:
	edge32l	%l1,	%i3,	%g6
	movne	%xcc,	%g5,	%o7
	sir	0x1FDD
	and	%l0,	%l6,	%o1
	swap	[%l7 + 0x68],	%i7
	membar	0x55
	fmovsgu	%icc,	%f4,	%f27
	call	loop_566
	fbul,a	%fcc1,	loop_567
	movvs	%xcc,	%l2,	%l5
	edge16n	%o3,	%i1,	%o0
loop_566:
	fornot2s	%f14,	%f24,	%f6
loop_567:
	xnorcc	%i6,	0x0F3E,	%i5
	nop
	fitos	%f6,	%f11
	fstox	%f11,	%f4
	fxtos	%f4,	%f11
	movcs	%icc,	%o5,	%o2
	array32	%o4,	%l3,	%g2
	tvs	%xcc,	0x0
	array16	%l4,	%g4,	%o6
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f4
	fnot1s	%f9,	%f15
	fmovde	%xcc,	%f19,	%f4
	ta	%xcc,	0x6
	movre	%g7,	0x271,	%g1
	stbar
	fmovrsne	%i0,	%f26,	%f2
	tne	%xcc,	0x5
	st	%f20,	[%l7 + 0x64]
	sllx	%g3,	%i4,	%l1
	edge8n	%i3,	%i2,	%g5
	std	%f14,	[%l7 + 0x30]
	alignaddr	%o7,	%g6,	%l0
	udivcc	%o1,	0x0A86,	%i7
	stx	%l6,	[%l7 + 0x10]
	taddcc	%l2,	%l5,	%o3
	array8	%o0,	%i6,	%i1
	sdiv	%i5,	0x145D,	%o5
	fpsub32	%f4,	%f2,	%f4
	fbe	%fcc0,	loop_568
	fbge	%fcc1,	loop_569
	bn,pn	%icc,	loop_570
	flush	%l7 + 0x14
loop_568:
	taddcc	%o2,	%o4,	%g2
loop_569:
	movne	%xcc,	%l4,	%g4
loop_570:
	smul	%l3,	%g7,	%g1
	taddcctv	%i0,	%g3,	%i4
	subcc	%l1,	%o6,	%i3
	fmovrslz	%g5,	%f23,	%f1
	movcs	%icc,	%i2,	%g6
	sll	%o7,	0x13,	%o1
	movrlz	%l0,	%l6,	%i7
	movrlez	%l2,	0x3A2,	%o3
	brgez,a	%l5,	loop_571
	fmul8x16	%f11,	%f18,	%f20
	andn	%o0,	%i1,	%i5
	faligndata	%f22,	%f28,	%f6
loop_571:
	orncc	%o5,	0x018E,	%i6
	fone	%f28
	fpack32	%f10,	%f28,	%f4
	tpos	%xcc,	0x7
	mova	%xcc,	%o2,	%o4
	popc	%g2,	%g4
	set	0x40, %i3
	stha	%l4,	[%l7 + %i3] 0x19
	lduh	[%l7 + 0x32],	%g7
	addcc	%g1,	%i0,	%g3
	movn	%icc,	%i4,	%l3
	brz	%l1,	loop_572
	te	%icc,	0x7
	nop
	setx	0x86F6F006,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x8AA968F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f2,	%f21
	fbug,a	%fcc1,	loop_573
loop_572:
	umul	%o6,	0x0B09,	%g5
	srl	%i2,	0x06,	%i3
	stx	%g6,	[%l7 + 0x08]
loop_573:
	edge16n	%o7,	%l0,	%o1
	prefetch	[%l7 + 0x3C],	 0x1
	nop
	setx	loop_574,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba	%fcc2,	loop_575
	subc	%l6,	0x19AD,	%l2
	edge16	%o3,	%l5,	%i7
loop_574:
	tl	%xcc,	0x2
loop_575:
	nop
	set	0x18, %g5
	ldxa	[%g0 + %g5] 0x50,	%i1
	bgu,a,pt	%xcc,	loop_576
	add	%o0,	%o5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x2C],	%i5
loop_576:
	bcc,a,pn	%icc,	loop_577
	movneg	%icc,	%o4,	%g2
	fmovdn	%icc,	%f10,	%f15
	edge16l	%o2,	%l4,	%g4
loop_577:
	bl,a,pn	%xcc,	loop_578
	ba,a	%icc,	loop_579
	fble,a	%fcc2,	loop_580
	mulx	%g1,	0x195A,	%g7
loop_578:
	nop
	set	0x38, %o4
	sta	%f7,	[%l7 + %o4] 0x04
loop_579:
	add	%g3,	0x1931,	%i0
loop_580:
	tgu	%xcc,	0x0
	fbge	%fcc0,	loop_581
	fone	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l3,	%i4
loop_581:
	subc	%o6,	0x1BCA,	%g5
	brgz,a	%l1,	loop_582
	addcc	%i2,	0x18C9,	%i3
	fmovsgu	%icc,	%f11,	%f30
	tg	%xcc,	0x1
loop_582:
	fmul8x16au	%f12,	%f7,	%f8
	smul	%g6,	0x0FC6,	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%l6
	fexpand	%f14,	%f20
	fpsub16	%f24,	%f4,	%f14
	sdivcc	%l2,	0x12B3,	%o3
	orncc	%l5,	%o7,	%i7
	lduh	[%l7 + 0x68],	%o0
	fmovrslez	%i1,	%f21,	%f8
	brgz	%i6,	loop_583
	array16	%o5,	%i5,	%o4
	tcc	%icc,	0x2
	edge16n	%g2,	%l4,	%o2
loop_583:
	fmovdl	%xcc,	%f28,	%f0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orn	%g1,	0x00F2,	%g7
	movn	%xcc,	%g4,	%i0
	tvc	%xcc,	0x6
	brgz	%l3,	loop_584
	movrlez	%i4,	0x00B,	%o6
	sra	%g5,	0x06,	%l1
	fmul8sux16	%f16,	%f12,	%f12
loop_584:
	movneg	%xcc,	%g3,	%i3
	xor	%g6,	0x1DC7,	%l0
	umulcc	%i2,	0x0DB8,	%o1
	tpos	%icc,	0x2
	set	0x76, %i7
	lduha	[%l7 + %i7] 0x80,	%l2
	bcc,pt	%xcc,	loop_585
	fbu,a	%fcc0,	loop_586
	bgu	%icc,	loop_587
	addc	%l6,	0x1713,	%l5
loop_585:
	edge32l	%o3,	%i7,	%o7
loop_586:
	sir	0x1487
loop_587:
	addcc	%o0,	%i1,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%i5,	loop_588
	movl	%icc,	%i6,	%o4
	srl	%g2,	%l4,	%g1
	nop
	setx loop_589, %l0, %l1
	jmpl %l1, %g7
loop_588:
	subcc	%o2,	%g4,	%l3
	tneg	%icc,	0x3
	movge	%icc,	%i4,	%o6
loop_589:
	fmovrsgz	%g5,	%f5,	%f22
	movgu	%icc,	%i0,	%l1
	sub	%i3,	%g6,	%l0
	tsubcctv	%g3,	%i2,	%l2
	and	%o1,	0x00EB,	%l5
	movleu	%icc,	%l6,	%o3
	array8	%o7,	%o0,	%i7
	movle	%icc,	%i1,	%o5
	srl	%i6,	%o4,	%g2
	stb	%l4,	[%l7 + 0x38]
	movrgez	%i5,	%g7,	%o2
	tne	%xcc,	0x1
	for	%f6,	%f30,	%f20
	fcmpne16	%f2,	%f14,	%g4
	ldsh	[%l7 + 0x62],	%g1
	fmovsne	%icc,	%f4,	%f20
	sethi	0x0DE5,	%l3
	xorcc	%o6,	0x1716,	%i4
	sub	%g5,	0x1C43,	%i0
	sra	%i3,	0x08,	%l1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g6
	nop
	fitos	%f7,	%f29
	fstox	%f29,	%f12
	fxtos	%f12,	%f17
	fmovrsne	%l0,	%f26,	%f2
	brgz	%i2,	loop_590
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f20
	udivcc	%g3,	0x04C3,	%l2
	sdivx	%l5,	0x17E1,	%o1
loop_590:
	bcs	loop_591
	edge16l	%l6,	%o7,	%o0
	fzero	%f26
	movn	%icc,	%i7,	%o3
loop_591:
	movrgz	%i1,	%i6,	%o5
	fmul8x16au	%f17,	%f12,	%f12
	tg	%xcc,	0x5
	ble,a,pn	%icc,	loop_592
	umul	%o4,	%g2,	%i5
	ldd	[%l7 + 0x30],	%l4
	bcc,a,pt	%xcc,	loop_593
loop_592:
	bcc	%icc,	loop_594
	subccc	%o2,	%g4,	%g7
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f16
loop_593:
	movvs	%icc,	%g1,	%l3
loop_594:
	fmovrsne	%o6,	%f21,	%f31
	sll	%i4,	%i0,	%g5
	movneg	%xcc,	%l1,	%g6
	xorcc	%l0,	%i2,	%g3
	sdiv	%l2,	0x0748,	%i3
	bvs,a	loop_595
	movvs	%xcc,	%l5,	%l6
	fbl,a	%fcc0,	loop_596
	fandnot2s	%f23,	%f0,	%f2
loop_595:
	fmovscs	%xcc,	%f31,	%f11
	orcc	%o1,	0x17AA,	%o7
loop_596:
	fbug,a	%fcc3,	loop_597
	taddcctv	%i7,	0x0D4F,	%o3
	movgu	%icc,	%o0,	%i1
	smulcc	%i6,	%o5,	%o4
loop_597:
	tcc	%xcc,	0x3
	fmovrdlz	%g2,	%f8,	%f6
	fxor	%f4,	%f30,	%f0
	fsrc2s	%f13,	%f12
	taddcctv	%i5,	%l4,	%o2
	orn	%g4,	0x0E77,	%g1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movl	%icc,	%l3,	%o6
	edge32	%i4,	%g7,	%g5
	orn	%l1,	%g6,	%l0
	xorcc	%i0,	%g3,	%i2
	tcs	%xcc,	0x6
	alignaddrl	%l2,	%i3,	%l6
	srlx	%l5,	0x10,	%o7
	add	%i7,	%o3,	%o1
	srax	%o0,	%i6,	%o5
	bne,a,pn	%xcc,	loop_598
	edge16	%o4,	%g2,	%i5
	movrgz	%l4,	%i1,	%g4
	lduh	[%l7 + 0x56],	%g1
loop_598:
	fmovdcs	%xcc,	%f20,	%f15
	tcc	%icc,	0x1
	movvs	%icc,	%o2,	%o6
	ble,a,pt	%icc,	loop_599
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%l2
	brz	%i4,	loop_600
	udivcc	%g7,	0x0B03,	%g5
loop_599:
	move	%xcc,	%g6,	%l0
	fsrc1s	%f24,	%f29
loop_600:
	fones	%f18
	edge8n	%l1,	%i0,	%i2
	tg	%xcc,	0x0
	bneg,a,pt	%xcc,	loop_601
	movl	%icc,	%g3,	%l2
	popc	%l6,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_601:
	nop
	setx	0x41734754,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f11
	sethi	0x13DD,	%l5
	tle	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x18] %asi,	%f2
	edge32	%i7,	%o7,	%o3
	be	loop_602
	brlz,a	%o0,	loop_603
	sra	%o1,	0x03,	%o5
	tle	%xcc,	0x1
loop_602:
	fmovdne	%xcc,	%f23,	%f3
loop_603:
	fbug	%fcc0,	loop_604
	fcmpne16	%f16,	%f4,	%o4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x5C] %asi,	%i6
loop_604:
	fcmpne16	%f20,	%f14,	%i5
	bneg,a,pt	%icc,	loop_605
	fbg,a	%fcc2,	loop_606
	tge	%xcc,	0x7
	fnegs	%f15,	%f15
loop_605:
	srl	%g2,	%l4,	%g4
loop_606:
	tge	%icc,	0x1
	edge32ln	%g1,	%i1,	%o2
	tpos	%xcc,	0x3
	or	%l3,	0x07F2,	%i4
	fmovrdgz	%o6,	%f22,	%f26
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x04,	 0x3
	sub	%g7,	%l0,	%g6
	tne	%icc,	0x7
	addccc	%i0,	0x1070,	%i2
	brnz,a	%l1,	loop_607
	sllx	%l2,	%l6,	%i3
	sllx	%l5,	%i7,	%g3
	sra	%o3,	%o0,	%o7
loop_607:
	and	%o1,	%o5,	%o4
	tgu	%icc,	0x0
	fxors	%f21,	%f28,	%f4
	sdiv	%i6,	0x1F83,	%i5
	fsrc2	%f30,	%f10
	fcmpgt16	%f4,	%f0,	%l4
	edge32n	%g2,	%g4,	%g1
	taddcc	%i1,	%l3,	%i4
	ba,pn	%icc,	loop_608
	be,pt	%xcc,	loop_609
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f26,	%f6,	%f24
loop_608:
	movre	%o6,	%g5,	%o2
loop_609:
	move	%xcc,	%g7,	%l0
	tsubcctv	%g6,	0x061C,	%i2
	ld	[%l7 + 0x30],	%f20
	ba	%xcc,	loop_610
	movn	%xcc,	%l1,	%i0
	movrgez	%l6,	0x1C4,	%l2
	bg,a,pt	%xcc,	loop_611
loop_610:
	fmovdl	%icc,	%f4,	%f19
	tg	%xcc,	0x4
	fmovdvc	%xcc,	%f13,	%f7
loop_611:
	fxor	%f30,	%f8,	%f16
	set	0x78, %i6
	stxa	%i3,	[%l7 + %i6] 0x80
	edge16ln	%i7,	%l5,	%g3
	fmovrsne	%o3,	%f27,	%f0
	edge8	%o0,	%o7,	%o1
	bleu,a,pn	%xcc,	loop_612
	tvc	%xcc,	0x5
	ldub	[%l7 + 0x7B],	%o4
	tvs	%xcc,	0x7
loop_612:
	nop
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f0
	fmovsne	%icc,	%f15,	%f28
	subccc	%i6,	0x02E4,	%o5
	mulscc	%l4,	%i5,	%g4
	tl	%xcc,	0x4
	umul	%g1,	%i1,	%l3
	stb	%g2,	[%l7 + 0x72]
	srax	%o6,	0x05,	%g5
	subc	%i4,	%g7,	%o2
	mulx	%g6,	0x1878,	%i2
	edge32l	%l0,	%l1,	%i0
	fnot1	%f16,	%f18
	fandnot1	%f4,	%f12,	%f8
	udiv	%l6,	0x0065,	%i3
	mulx	%l2,	%i7,	%l5
	fandnot2s	%f15,	%f21,	%f2
	movpos	%icc,	%g3,	%o0
	movle	%icc,	%o3,	%o7
	nop
	setx	0x8059E3F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	nop
	setx	0xE39DC6E9593A776C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f8
	udiv	%o1,	0x1A38,	%i6
	fmovdge	%icc,	%f27,	%f18
	fmovsg	%xcc,	%f23,	%f8
	nop
	set	0x51, %g2
	stb	%o4,	[%l7 + %g2]
	ldsh	[%l7 + 0x52],	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i5,	%l4,	%g4
	udivcc	%g1,	0x1997,	%i1
	fmuld8ulx16	%f13,	%f29,	%f20
	fnands	%f17,	%f15,	%f14
	fpsub32	%f12,	%f24,	%f20
	movvc	%icc,	%l3,	%o6
	stbar
	taddcc	%g5,	%g2,	%g7
	bvc,pn	%xcc,	loop_613
	srlx	%o2,	0x1B,	%g6
	movrlz	%i2,	%i4,	%l1
	tcc	%xcc,	0x3
loop_613:
	movleu	%xcc,	%l0,	%l6
	tleu	%icc,	0x5
	nop
	set	0x3A, %o2
	stb	%i3,	[%l7 + %o2]
	fmovdvc	%icc,	%f23,	%f6
	fpsub32s	%f29,	%f23,	%f12
	tcc	%xcc,	0x2
	fbo	%fcc1,	loop_614
	or	%l2,	0x1438,	%i7
	fnands	%f17,	%f21,	%f9
	movrlez	%i0,	%g3,	%o0
loop_614:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x7D] %asi,	%o3
	fcmpne32	%f24,	%f20,	%o7
	add	%l5,	0x0DD9,	%i6
	st	%f10,	[%l7 + 0x64]
	move	%icc,	%o4,	%o5
	tcc	%xcc,	0x2
	movleu	%xcc,	%o1,	%l4
	umul	%i5,	0x183C,	%g1
	fors	%f24,	%f11,	%f24
	array32	%g4,	%i1,	%o6
	edge8	%l3,	%g5,	%g2
	ba,a	%icc,	loop_615
	tn	%xcc,	0x4
	fcmpeq32	%f4,	%f2,	%g7
	umul	%o2,	%i2,	%i4
loop_615:
	fbo,a	%fcc0,	loop_616
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f12
	fxtod	%f12,	%f6
	movpos	%xcc,	%g6,	%l1
	tcs	%icc,	0x4
loop_616:
	bg,a,pt	%xcc,	loop_617
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f0
	fmovsleu	%icc,	%f2,	%f13
	udiv	%l6,	0x006F,	%l0
loop_617:
	fmovdge	%xcc,	%f27,	%f13
	umulcc	%i3,	%i7,	%l2
	movrgz	%i0,	%o0,	%o3
	xorcc	%o7,	0x07CB,	%l5
	nop
	setx	0xC221062B36155809,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x20063BC7072EF7CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f26,	%f24
	andn	%i6,	0x1CA7,	%g3
	movn	%xcc,	%o5,	%o1
	membar	0x26
	xorcc	%l4,	%i5,	%g1
	stbar
	orcc	%g4,	%o4,	%i1
	mova	%xcc,	%o6,	%l3
	array32	%g2,	%g5,	%o2
	edge8	%g7,	%i2,	%g6
	fbuge,a	%fcc0,	loop_618
	nop
	fitod	%f10,	%f18
	fdtos	%f18,	%f30
	subccc	%l1,	0x0942,	%i4
	movge	%xcc,	%l6,	%i3
loop_618:
	fmovspos	%xcc,	%f7,	%f24
	tcs	%icc,	0x7
	srax	%i7,	0x0F,	%l2
	nop
	setx loop_619, %l0, %l1
	jmpl %l1, %i0
	tvs	%icc,	0x4
	fexpand	%f30,	%f4
	te	%xcc,	0x0
loop_619:
	fbne	%fcc2,	loop_620
	movgu	%xcc,	%o0,	%l0
	tsubcctv	%o3,	0x0839,	%o7
	bneg,a	loop_621
loop_620:
	edge16l	%l5,	%i6,	%g3
	nop
	setx	0x78F3AB1F61A70D1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f26
	ba,a,pt	%xcc,	loop_622
loop_621:
	fmovrdne	%o5,	%f2,	%f14
	array16	%o1,	%l4,	%i5
	tpos	%icc,	0x5
loop_622:
	xnorcc	%g4,	%g1,	%i1
	and	%o6,	%o4,	%g2
	umulcc	%l3,	%o2,	%g5
	fmovdgu	%icc,	%f14,	%f12
	set	0x0F, %o0
	stba	%g7,	[%l7 + %o0] 0x89
	mova	%icc,	%i2,	%g6
	fmovrde	%i4,	%f4,	%f16
	prefetch	[%l7 + 0x10],	 0x2
	ta	%icc,	0x1
	xorcc	%l1,	0x08B4,	%i3
	fxor	%f14,	%f28,	%f10
	ld	[%l7 + 0x08],	%f8
	xorcc	%i7,	%l2,	%l6
	tle	%xcc,	0x4
	tsubcc	%i0,	%l0,	%o0
	move	%xcc,	%o7,	%o3
	movrne	%i6,	0x2E9,	%g3
	srl	%o5,	%l5,	%o1
	brz,a	%l4,	loop_623
	stw	%g4,	[%l7 + 0x44]
	addccc	%i5,	%g1,	%i1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
loop_623:
	add	%o4,	%g2,	%o2
	fmovd	%f24,	%f4
	flush	%l7 + 0x30
	edge32	%g5,	%g7,	%i2
	tvs	%icc,	0x4
	call	loop_624
	tcc	%xcc,	0x7
	edge8n	%g6,	%i4,	%l3
	ba,a,pt	%icc,	loop_625
loop_624:
	xor	%l1,	0x0726,	%i3
	sub	%l2,	%i7,	%l6
	movl	%xcc,	%i0,	%l0
loop_625:
	and	%o7,	0x04E9,	%o0
	edge8n	%o3,	%g3,	%i6
	tcc	%icc,	0x6
	swap	[%l7 + 0x10],	%l5
	fbne	%fcc2,	loop_626
	fba	%fcc2,	loop_627
	edge8n	%o1,	%o5,	%g4
	fbn	%fcc3,	loop_628
loop_626:
	fornot2	%f4,	%f22,	%f30
loop_627:
	tge	%icc,	0x4
	edge32ln	%i5,	%l4,	%g1
loop_628:
	andn	%o6,	0x1DD8,	%i1
	andncc	%o4,	%g2,	%o2
	move	%icc,	%g7,	%g5
	movrlez	%i2,	%i4,	%l3
	fsrc2s	%f1,	%f22
	fmovrde	%g6,	%f12,	%f28
	popc	%l1,	%i3
	xnor	%l2,	%l6,	%i0
	srl	%i7,	%o7,	%l0
	nop
	setx	0x69928262,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x59410D42,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f26,	%f13
	tneg	%icc,	0x0
	fbne,a	%fcc1,	loop_629
	fmovdcs	%xcc,	%f3,	%f28
	bvc,a	loop_630
	movcc	%xcc,	%o0,	%g3
loop_629:
	fpmerge	%f4,	%f22,	%f8
	stw	%i6,	[%l7 + 0x0C]
loop_630:
	brlez	%l5,	loop_631
	movg	%icc,	%o3,	%o1
	brlez	%g4,	loop_632
	tge	%icc,	0x7
loop_631:
	umul	%i5,	0x0270,	%l4
	orncc	%o5,	%g1,	%o6
loop_632:
	fcmpne16	%f12,	%f20,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o4,	0x0DDB,	%o2
	movle	%icc,	%g7,	%g2
	movge	%icc,	%g5,	%i4
	orncc	%i2,	%l3,	%l1
	movcs	%icc,	%i3,	%g6
	nop
	fitos	%f8,	%f13
	fstoi	%f13,	%f11
	tl	%icc,	0x6
	movgu	%icc,	%l6,	%l2
	fexpand	%f31,	%f28
	fmovdge	%xcc,	%f2,	%f3
	fbo,a	%fcc2,	loop_633
	udivcc	%i0,	0x05FA,	%o7
	bvc,pt	%xcc,	loop_634
	movrlz	%l0,	0x1AA,	%o0
loop_633:
	addcc	%i7,	0x1476,	%g3
	movvs	%xcc,	%l5,	%i6
loop_634:
	andn	%o3,	0x0144,	%o1
	subcc	%i5,	%g4,	%l4
	set	0x4C, %o6
	stha	%o5,	[%l7 + %o6] 0x89
	and	%o6,	0x0A95,	%g1
	fzero	%f16
	bcs,pn	%icc,	loop_635
	movge	%xcc,	%i1,	%o4
	edge32n	%o2,	%g7,	%g5
	fand	%f18,	%f10,	%f10
loop_635:
	nop
	setx	0xFADEA2AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x415E1EDB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f15,	%f10
	edge32n	%i4,	%g2,	%i2
	std	%f18,	[%l7 + 0x08]
	add	%l1,	%l3,	%i3
	bne,a,pt	%xcc,	loop_636
	swap	[%l7 + 0x34],	%g6
	tgu	%xcc,	0x7
	fmovsleu	%xcc,	%f31,	%f22
loop_636:
	mulx	%l2,	%i0,	%l6
	smul	%l0,	0x0C5C,	%o0
	nop
	setx	0x979871914E9816F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6C7CE67B76053A47,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f2,	%f2
	xorcc	%i7,	%g3,	%l5
	srlx	%o7,	0x02,	%o3
	fpackfix	%f0,	%f11
	array16	%i6,	%i5,	%o1
	edge32	%g4,	%o5,	%o6
	fpsub16s	%f25,	%f4,	%f26
	srax	%l4,	%g1,	%i1
	fmovsgu	%icc,	%f28,	%f0
	fbul	%fcc0,	loop_637
	umul	%o2,	0x1BD4,	%g7
	nop
	set	0x38, %l6
	prefetch	[%l7 + %l6],	 0x3
	tneg	%xcc,	0x6
loop_637:
	sdivcc	%o4,	0x107F,	%i4
	nop
	setx	loop_638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%g5,	0x0D59,	%g2
	tle	%icc,	0x3
	bpos,a,pt	%xcc,	loop_639
loop_638:
	fpackfix	%f2,	%f30
	edge32	%l1,	%i2,	%l3
	movl	%xcc,	%g6,	%i3
loop_639:
	sdivx	%l2,	0x0790,	%i0
	tge	%icc,	0x2
	movle	%xcc,	%l0,	%o0
	fbne	%fcc0,	loop_640
	bgu,a	loop_641
	sub	%l6,	%g3,	%i7
	fbn,a	%fcc3,	loop_642
loop_640:
	xnorcc	%o7,	0x1916,	%l5
loop_641:
	srl	%i6,	0x07,	%i5
	mulx	%o1,	%o3,	%g4
loop_642:
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f26
	edge8l	%o6,	%o5,	%g1
	set	0x14, %o7
	sta	%f3,	[%l7 + %o7] 0x18
	sdivx	%i1,	0x0DD5,	%l4
	subc	%g7,	%o4,	%o2
	smul	%g5,	0x1F5D,	%i4
	array8	%l1,	%i2,	%l3
	movl	%xcc,	%g2,	%i3
	bcs,a,pn	%xcc,	loop_643
	edge16ln	%l2,	%i0,	%l0
	alignaddr	%g6,	%o0,	%l6
	movrlz	%g3,	0x1DE,	%o7
loop_643:
	brz,a	%i7,	loop_644
	movl	%icc,	%l5,	%i6
	sdivcc	%i5,	0x1898,	%o3
	movrne	%o1,	0x34B,	%g4
loop_644:
	umul	%o5,	0x0500,	%g1
	smulcc	%o6,	%i1,	%g7
	movcc	%xcc,	%o4,	%l4
	bg,a,pn	%xcc,	loop_645
	sir	0x1B15
	sdivx	%g5,	0x040D,	%o2
	fbn,a	%fcc1,	loop_646
loop_645:
	and	%i4,	%l1,	%l3
	set	0x28, %o1
	swapa	[%l7 + %o1] 0x80,	%i2
loop_646:
	smulcc	%i3,	%g2,	%l2
	ta	%xcc,	0x1
	movvs	%icc,	%l0,	%i0
	movrne	%o0,	0x1E3,	%l6
	edge8	%g3,	%g6,	%i7
	fba,a	%fcc3,	loop_647
	srlx	%o7,	0x0A,	%l5
	array16	%i6,	%o3,	%i5
	movgu	%icc,	%g4,	%o5
loop_647:
	fmovrsne	%o1,	%f20,	%f1
	edge32	%g1,	%o6,	%g7
	ldsb	[%l7 + 0x0B],	%o4
	smulcc	%l4,	%i1,	%o2
	sdivcc	%i4,	0x0682,	%l1
	set	0x32, %g7
	lduha	[%l7 + %g7] 0x15,	%l3
	brgez,a	%g5,	loop_648
	andn	%i2,	%g2,	%l2
	udiv	%i3,	0x1E80,	%l0
	sll	%o0,	0x02,	%i0
loop_648:
	fpadd16s	%f25,	%f6,	%f6
	movneg	%icc,	%g3,	%g6
	bn,a,pn	%icc,	loop_649
	movpos	%xcc,	%l6,	%i7
	fbul	%fcc2,	loop_650
	srax	%o7,	%i6,	%o3
loop_649:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%i5
loop_650:
	fnot2s	%f2,	%f7
	stb	%l5,	[%l7 + 0x47]
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7E] %asi,	%o5
	alignaddrl	%o1,	%g1,	%o6
	tl	%icc,	0x3
	fcmpgt16	%f22,	%f20,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g4,	0x0390,	%o4
	movneg	%icc,	%l4,	%i1
	addcc	%i4,	%l1,	%l3
	wr	%g0,	0x19,	%asi
	stwa	%o2,	[%l7 + 0x78] %asi
	srax	%i2,	%g5,	%g2
	movrlz	%i3,	0x363,	%l2
	movcc	%xcc,	%o0,	%i0
	xnorcc	%l0,	0x1322,	%g6
	sllx	%g3,	0x0E,	%i7
	xnor	%o7,	0x12CB,	%i6
	movrlz	%l6,	%i5,	%l5
	add	%o3,	0x1944,	%o1
	nop
	fitod	%f28,	%f24
	addc	%o5,	%g1,	%o6
	fpadd16	%f22,	%f28,	%f12
	brlz,a	%g7,	loop_651
	fblg	%fcc1,	loop_652
	fexpand	%f2,	%f0
	xor	%o4,	0x03F2,	%l4
loop_651:
	fsrc2	%f12,	%f8
loop_652:
	te	%xcc,	0x0
	smulcc	%g4,	%i4,	%l1
	fxor	%f6,	%f4,	%f12
	andn	%l3,	%i1,	%i2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	movl	%xcc,	%o2,	%i3
	fmovdleu	%xcc,	%f19,	%f22
	ldx	[%l7 + 0x68],	%l2
	movvc	%icc,	%g2,	%i0
	tleu	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	fpsub32	%f0,	%f4,	%f4
	fandnot2	%f28,	%f4,	%f14
	fnand	%f26,	%f20,	%f24
	movrlz	%l0,	0x386,	%g6
	fcmpeq32	%f4,	%f4,	%i7
	fpsub32s	%f1,	%f23,	%f0
	tge	%icc,	0x3
	fpadd32s	%f3,	%f8,	%f22
	movg	%icc,	%o7,	%g3
	sll	%i6,	%l6,	%l5
	std	%f10,	[%l7 + 0x78]
	movg	%xcc,	%o3,	%i5
	bne,a	loop_653
	tge	%xcc,	0x4
	movrlz	%o5,	%g1,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_653:
	fornot1s	%f4,	%f3,	%f1
	movrgz	%o6,	0x2BF,	%o4
	bg,a	%icc,	loop_654
	fmovdgu	%icc,	%f29,	%f23
	tn	%xcc,	0x3
	movvc	%xcc,	%l4,	%g7
loop_654:
	udiv	%i4,	0x1DA9,	%g4
	movpos	%icc,	%l1,	%l3
	edge32	%i1,	%i2,	%o2
	sdivx	%i3,	0x13B5,	%g5
	fbul	%fcc0,	loop_655
	fbu	%fcc2,	loop_656
	edge16l	%g2,	%i0,	%l2
	fornot2	%f0,	%f24,	%f20
loop_655:
	edge32n	%l0,	%g6,	%o0
loop_656:
	fones	%f14
	popc	%o7,	%i7
	fand	%f12,	%f26,	%f30
	nop
	setx	loop_657,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sll	%i6,	%l6,	%g3
	set	0x64, %i4
	lda	[%l7 + %i4] 0x10,	%f11
loop_657:
	nop
	set	0x44, %l3
	lda	[%l7 + %l3] 0x89,	%f7
	prefetch	[%l7 + 0x58],	 0x1
	movvs	%xcc,	%o3,	%i5
	fands	%f1,	%f29,	%f11
	sll	%o5,	%l5,	%g1
	fcmpeq32	%f24,	%f16,	%o1
	fmovrse	%o6,	%f29,	%f30
	umulcc	%l4,	0x0E6D,	%g7
	movpos	%xcc,	%i4,	%o4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	tl	%icc,	0x7
	addc	%g4,	0x0410,	%l3
	fcmple16	%f14,	%f8,	%i1
	movvs	%xcc,	%i2,	%i3
	fornot2	%f30,	%f2,	%f30
	xnor	%g5,	0x189E,	%g2
	fmovrdgz	%o2,	%f18,	%f22
	addcc	%i0,	0x0A9F,	%l0
	movrgz	%g6,	%l2,	%o7
	andncc	%i7,	%o0,	%i6
	fmovrsgez	%g3,	%f1,	%f4
	ldd	[%l7 + 0x58],	%o2
	ld	[%l7 + 0x40],	%f10
	sub	%l6,	0x1B72,	%o5
	fpackfix	%f14,	%f4
	orcc	%l5,	%i5,	%o1
	tge	%xcc,	0x6
	tvs	%xcc,	0x7
	tneg	%xcc,	0x5
	movrgz	%g1,	%o6,	%g7
	tvc	%xcc,	0x4
	srax	%i4,	%o4,	%l1
	fmovrslez	%l4,	%f13,	%f26
	movre	%l3,	0x360,	%i1
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f10
	ldd	[%l7 + 0x50],	%i2
	fpsub16s	%f26,	%f26,	%f21
	fornot2s	%f31,	%f7,	%f9
	nop
	fitos	%f5,	%f30
	mulx	%i3,	0x0ADB,	%g5
	orcc	%g4,	%g2,	%i0
	movn	%xcc,	%o2,	%l0
	tle	%icc,	0x5
	ld	[%l7 + 0x14],	%f2
	nop
	setx	0x27CAA0CFC079808E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fpadd16s	%f7,	%f28,	%f15
	xor	%g6,	%l2,	%i7
	udiv	%o0,	0x0368,	%o7
	tsubcctv	%i6,	%g3,	%o3
	sllx	%l6,	%l5,	%i5
	movleu	%xcc,	%o5,	%g1
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f0
	movgu	%xcc,	%o1,	%g7
	mova	%icc,	%o6,	%i4
	fabsd	%f6,	%f2
	fmovsg	%icc,	%f22,	%f13
	edge32	%o4,	%l4,	%l1
	orn	%i1,	%l3,	%i3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g5
	array8	%i2,	%g4,	%i0
	subccc	%g2,	0x0DBA,	%l0
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x04
	te	%icc,	0x4
	addc	%o2,	0x0783,	%g6
	ldsw	[%l7 + 0x54],	%i7
	udivx	%l2,	0x1579,	%o0
	sethi	0x09B6,	%i6
	sdivcc	%o7,	0x1FF7,	%o3
	movgu	%xcc,	%g3,	%l5
	fbg	%fcc3,	loop_658
	ba,pt	%icc,	loop_659
	bgu	loop_660
	tgu	%xcc,	0x4
loop_658:
	popc	0x1ADC,	%i5
loop_659:
	and	%l6,	%g1,	%o5
loop_660:
	nop
	set	0x5C, %l0
	lda	[%l7 + %l0] 0x80,	%f14
	subcc	%g7,	0x1252,	%o1
	fmovrsne	%o6,	%f5,	%f18
	stw	%o4,	[%l7 + 0x1C]
	bne	%xcc,	loop_661
	addccc	%i4,	0x1BC3,	%l1
	fba,a	%fcc0,	loop_662
	fmovrse	%l4,	%f0,	%f13
loop_661:
	sir	0x0821
	udivx	%i1,	0x0A33,	%l3
loop_662:
	fones	%f26
	bl,pt	%xcc,	loop_663
	nop
	setx	loop_664,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnand	%f18,	%f16,	%f16
	edge8n	%g5,	%i2,	%g4
loop_663:
	mova	%xcc,	%i3,	%g2
loop_664:
	addc	%i0,	0x0D0E,	%o2
	tvc	%icc,	0x3
	tsubcc	%l0,	%g6,	%l2
	sub	%i7,	%i6,	%o0
	tpos	%icc,	0x6
	ta	%icc,	0x1
	brgez	%o3,	loop_665
	fnegd	%f0,	%f10
	tle	%xcc,	0x7
	bge,a	%icc,	loop_666
loop_665:
	fbul,a	%fcc1,	loop_667
	fbue	%fcc1,	loop_668
	tpos	%icc,	0x5
loop_666:
	movrgez	%o7,	0x283,	%g3
loop_667:
	fble,a	%fcc2,	loop_669
loop_668:
	subc	%i5,	0x02F8,	%l6
	bshuffle	%f12,	%f30,	%f28
	ldd	[%l7 + 0x30],	%f10
loop_669:
	movvc	%icc,	%g1,	%o5
	fbo,a	%fcc2,	loop_670
	edge16l	%g7,	%l5,	%o1
	bvc	%icc,	loop_671
	movvs	%icc,	%o6,	%o4
loop_670:
	fxnors	%f23,	%f21,	%f27
	tgu	%xcc,	0x7
loop_671:
	xnor	%l1,	%i4,	%l4
	fsrc1s	%f29,	%f8
	sdivx	%i1,	0x1939,	%g5
	tg	%xcc,	0x3
	udivx	%l3,	0x1527,	%g4
	srlx	%i2,	%i3,	%g2
	fmovsge	%icc,	%f5,	%f2
	fone	%f12
	tpos	%xcc,	0x2
	fpack16	%f24,	%f0
	mova	%xcc,	%o2,	%l0
	mova	%xcc,	%i0,	%l2
	bn,a	loop_672
	taddcc	%i7,	%g6,	%i6
	fba,a	%fcc0,	loop_673
	popc	%o3,	%o0
loop_672:
	ldd	[%l7 + 0x38],	%f4
	bge	%icc,	loop_674
loop_673:
	sllx	%o7,	%i5,	%l6
	fmovdgu	%icc,	%f18,	%f0
	bpos,a,pn	%xcc,	loop_675
loop_674:
	fmovsneg	%icc,	%f6,	%f0
	addcc	%g1,	%g3,	%o5
	tle	%xcc,	0x2
loop_675:
	ta	%icc,	0x3
	andncc	%l5,	%g7,	%o6
	nop
	setx	0xC996D274,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xF83117BC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f7,	%f11
	movge	%xcc,	%o1,	%l1
	fmovse	%icc,	%f28,	%f22
	tle	%xcc,	0x0
	edge32n	%o4,	%l4,	%i1
	ldd	[%l7 + 0x18],	%i4
	subccc	%g5,	%l3,	%i2
	fnors	%f25,	%f21,	%f4
	set	0x0C, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g4
	movg	%xcc,	%g2,	%i3
	fbule	%fcc2,	loop_676
	ld	[%l7 + 0x58],	%f3
	fpadd16	%f4,	%f18,	%f24
	subc	%o2,	%l0,	%l2
loop_676:
	fbu,a	%fcc3,	loop_677
	tpos	%icc,	0x4
	sra	%i0,	%g6,	%i6
	fbue	%fcc0,	loop_678
loop_677:
	tvc	%icc,	0x5
	tge	%xcc,	0x2
	udivx	%o3,	0x0F73,	%i7
loop_678:
	fbo,a	%fcc3,	loop_679
	fsrc1s	%f12,	%f13
	taddcctv	%o7,	%i5,	%l6
	fmovscs	%xcc,	%f3,	%f14
loop_679:
	sdivx	%g1,	0x1839,	%g3
	andncc	%o5,	%o0,	%g7
	movcc	%xcc,	%o6,	%o1
	mova	%xcc,	%l5,	%o4
	andncc	%l4,	%l1,	%i1
	movrlz	%g5,	%l3,	%i4
	fnot2	%f30,	%f8
	bgu	%xcc,	loop_680
	fsrc2	%f26,	%f22
	fbge	%fcc2,	loop_681
	tle	%icc,	0x2
loop_680:
	fbn	%fcc3,	loop_682
	fmovdpos	%icc,	%f30,	%f24
loop_681:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%g4,	[%l7 + 0x60] %asi
loop_682:
	ldx	[%l7 + 0x18],	%i2
	te	%xcc,	0x1
	tle	%icc,	0x4
	movpos	%xcc,	%i3,	%g2
	orcc	%o2,	0x1632,	%l2
	nop
	fitod	%f12,	%f6
	fdtoi	%f6,	%f9
	edge8n	%i0,	%l0,	%g6
	smulcc	%o3,	%i7,	%o7
	edge16n	%i5,	%l6,	%g1
	fbug	%fcc1,	loop_683
	movrgez	%g3,	%o5,	%i6
	tcs	%xcc,	0x6
	edge32	%o0,	%g7,	%o6
loop_683:
	prefetch	[%l7 + 0x1C],	 0x3
	fpadd32	%f24,	%f10,	%f6
	movleu	%icc,	%o1,	%o4
	orcc	%l4,	0x1E94,	%l5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l1,	%i1
	orn	%l3,	%i4,	%g4
	tneg	%icc,	0x1
	fxnor	%f30,	%f18,	%f6
	tsubcc	%i2,	%i3,	%g2
	fxor	%f0,	%f22,	%f8
	sra	%o2,	0x17,	%l2
	sub	%g5,	%l0,	%g6
	sllx	%o3,	%i0,	%o7
	fmovsgu	%icc,	%f16,	%f0
	sdivcc	%i5,	0x08C1,	%i7
	prefetch	[%l7 + 0x70],	 0x0
	fbul	%fcc0,	loop_684
	movg	%icc,	%g1,	%l6
	movn	%icc,	%o5,	%i6
	movcs	%xcc,	%g3,	%g7
loop_684:
	ldx	[%l7 + 0x40],	%o6
	sll	%o1,	0x1C,	%o0
	edge8l	%o4,	%l5,	%l4
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tcc	%xcc,	0x4
	smulcc	%i1,	0x14F7,	%l3
	tle	%xcc,	0x3
	sllx	%l1,	0x0F,	%g4
	fbg	%fcc3,	loop_685
	fble,a	%fcc3,	loop_686
	edge8l	%i2,	%i4,	%g2
	fmovdvs	%icc,	%f6,	%f7
loop_685:
	fbule	%fcc3,	loop_687
loop_686:
	movn	%icc,	%i3,	%l2
	ldsb	[%l7 + 0x0D],	%o2
	fbuge,a	%fcc0,	loop_688
loop_687:
	fmovsne	%icc,	%f18,	%f21
	sdiv	%g5,	0x0AC3,	%g6
	movrlz	%o3,	%l0,	%i0
loop_688:
	fcmpne32	%f28,	%f28,	%i5
	umul	%o7,	%i7,	%l6
	fsrc2s	%f16,	%f31
	array16	%o5,	%i6,	%g3
	membar	0x46
	tleu	%icc,	0x5
	nop
	setx	loop_689,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x044D
	nop
	setx	0x104CB0B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	smul	%g1,	%g7,	%o1
loop_689:
	tcs	%xcc,	0x5
	fmul8ulx16	%f24,	%f18,	%f30
	tl	%icc,	0x6
	nop
	fitos	%f6,	%f4
	fstod	%f4,	%f16
	nop
	set	0x24, %i5
	stw	%o6,	[%l7 + %i5]
	fbg	%fcc1,	loop_690
	fble	%fcc0,	loop_691
	mulx	%o0,	%o4,	%l5
	tne	%xcc,	0x4
loop_690:
	tn	%icc,	0x4
loop_691:
	nop
	wr	%g0,	0x80,	%asi
	stba	%i1,	[%l7 + 0x71] %asi
	edge8l	%l3,	%l1,	%l4
	smulcc	%g4,	0x0D12,	%i2
	sub	%g2,	0x0CDE,	%i4
	nop
	setx	loop_692,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%i3,	%l2
	xnor	%g5,	0x0ABA,	%o2
	fmovsvs	%xcc,	%f29,	%f9
loop_692:
	fpadd32	%f8,	%f20,	%f8
	edge8	%g6,	%o3,	%i0
	bvs,pt	%xcc,	loop_693
	and	%i5,	0x01F7,	%o7
	mulscc	%l0,	%l6,	%o5
	subccc	%i7,	0x01C5,	%g3
loop_693:
	srl	%g1,	0x04,	%g7
	fmovscs	%icc,	%f6,	%f1
	fcmpne16	%f20,	%f18,	%i6
	mulx	%o1,	0x1D6B,	%o0
	andncc	%o4,	%l5,	%o6
	orn	%l3,	0x1719,	%l1
	movpos	%xcc,	%l4,	%g4
	ldsh	[%l7 + 0x66],	%i1
	fcmpgt16	%f28,	%f22,	%g2
	mulscc	%i2,	%i3,	%i4
	edge8n	%l2,	%g5,	%o2
	edge32n	%o3,	%i0,	%g6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o7
	ldsw	[%l7 + 0x08],	%l0
	edge16n	%l6,	%o5,	%i5
	xor	%i7,	0x18CB,	%g3
	subcc	%g1,	%g7,	%i6
	popc	%o1,	%o4
	set	0x0D, %l5
	stba	%l5,	[%l7 + %l5] 0xea
	membar	#Sync
	move	%xcc,	%o6,	%o0
	srl	%l3,	0x1D,	%l1
	tle	%icc,	0x5
	bl	%icc,	loop_694
	fbne	%fcc3,	loop_695
	nop
	setx loop_696, %l0, %l1
	jmpl %l1, %g4
	tvs	%xcc,	0x6
loop_694:
	sra	%i1,	0x10,	%g2
loop_695:
	movrlz	%l4,	0x33A,	%i2
loop_696:
	addc	%i4,	%i3,	%g5
	edge8ln	%o2,	%l2,	%i0
	std	%f26,	[%l7 + 0x28]
	movl	%xcc,	%o3,	%g6
	fbo	%fcc3,	loop_697
	mova	%xcc,	%o7,	%l0
	nop
	fitod	%f12,	%f4
	fdtox	%f4,	%f8
	fabsd	%f12,	%f2
loop_697:
	orcc	%o5,	%i5,	%l6
	fmovdneg	%icc,	%f4,	%f30
	fcmpne32	%f22,	%f16,	%i7
	bvc	%icc,	loop_698
	fmovd	%f18,	%f18
	and	%g3,	0x1268,	%g7
	mova	%icc,	%i6,	%g1
loop_698:
	addc	%o1,	0x10AE,	%l5
	ld	[%l7 + 0x08],	%f22
	tsubcc	%o4,	0x15C3,	%o0
	tle	%xcc,	0x4
	movneg	%icc,	%l3,	%l1
	fmovsgu	%xcc,	%f8,	%f23
	move	%icc,	%o6,	%i1
	set	0x2A, %g6
	lduha	[%l7 + %g6] 0x11,	%g2
	tgu	%icc,	0x7
	fmovrse	%l4,	%f19,	%f0
	bcc,a	%icc,	loop_699
	bge	loop_700
	fabss	%f27,	%f15
	movg	%xcc,	%i2,	%g4
loop_699:
	movneg	%icc,	%i4,	%g5
loop_700:
	std	%f16,	[%l7 + 0x78]
	wr	%g0,	0xeb,	%asi
	stha	%o2,	[%l7 + 0x3E] %asi
	membar	#Sync
	bne	%icc,	loop_701
	movgu	%icc,	%l2,	%i3
	tle	%icc,	0x3
	edge16l	%o3,	%i0,	%g6
loop_701:
	movrlez	%l0,	%o5,	%i5
	addcc	%l6,	%i7,	%o7
	ldsw	[%l7 + 0x70],	%g7
	tpos	%icc,	0x3
	fbuge,a	%fcc3,	loop_702
	smul	%i6,	0x0449,	%g3
	tgu	%icc,	0x5
	xorcc	%g1,	0x1B05,	%l5
loop_702:
	tge	%xcc,	0x1
	movrgz	%o4,	%o0,	%o1
	srlx	%l1,	%l3,	%o6
	edge16n	%i1,	%l4,	%g2
	taddcc	%g4,	0x1B68,	%i2
	swap	[%l7 + 0x30],	%g5
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x0c,	 0x1
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x28] %asi,	%l2
	srl	%o2,	0x0F,	%i3
	xor	%i0,	0x1136,	%g6
	xor	%l0,	0x151E,	%o5
	fmovdcc	%xcc,	%f26,	%f26
	xor	%i5,	0x1794,	%o3
	fpsub16	%f16,	%f6,	%f20
	addc	%l6,	0x173E,	%o7
	udiv	%g7,	0x151D,	%i6
	add	%i7,	%g3,	%l5
	movcs	%icc,	%g1,	%o4
	fmovrdgz	%o1,	%f16,	%f20
	array32	%l1,	%o0,	%l3
	tneg	%icc,	0x4
	wr	%g0,	0x11,	%asi
	stwa	%o6,	[%l7 + 0x78] %asi
	orcc	%i1,	0x049E,	%l4
	movre	%g2,	%i2,	%g4
	fmovsgu	%icc,	%f2,	%f14
	array32	%g5,	%l2,	%o2
	mova	%icc,	%i3,	%i0
	set	0x22, %i0
	stba	%g6,	[%l7 + %i0] 0x89
	movre	%l0,	%o5,	%i5
	alignaddrl	%o3,	%i4,	%l6
	alignaddrl	%o7,	%i6,	%i7
	swap	[%l7 + 0x68],	%g3
	movvc	%icc,	%g7,	%g1
	xorcc	%o4,	0x00B3,	%l5
	movrgz	%l1,	%o1,	%o0
	bneg,pt	%xcc,	loop_703
	andcc	%o6,	0x1E82,	%i1
	sdiv	%l4,	0x003B,	%g2
	edge16l	%l3,	%i2,	%g5
loop_703:
	ldsb	[%l7 + 0x28],	%g4
	edge16ln	%o2,	%l2,	%i0
	tsubcctv	%g6,	%l0,	%i3
	movvs	%icc,	%i5,	%o3
	sdivx	%o5,	0x1FCD,	%l6
	flush	%l7 + 0x6C
	movl	%icc,	%i4,	%i6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x28] %asi,	%o7
	alignaddrl	%g3,	%i7,	%g1
	edge32	%g7,	%l5,	%o4
	fmul8x16au	%f21,	%f17,	%f6
	edge16l	%l1,	%o0,	%o1
	movg	%xcc,	%i1,	%l4
	ldd	[%l7 + 0x38],	%o6
	bge,a,pt	%xcc,	loop_704
	fmovda	%xcc,	%f12,	%f27
	fmovrsgz	%g2,	%f8,	%f13
	ldstub	[%l7 + 0x7D],	%l3
loop_704:
	ba	%icc,	loop_705
	ldsb	[%l7 + 0x47],	%i2
	be,pt	%icc,	loop_706
	st	%f18,	[%l7 + 0x48]
loop_705:
	and	%g5,	0x179E,	%g4
	tcc	%xcc,	0x5
loop_706:
	fbg,a	%fcc0,	loop_707
	subccc	%l2,	%o2,	%g6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
loop_707:
	srl	%i3,	%l0,	%o3
	xorcc	%o5,	%l6,	%i5
	addcc	%i4,	%i6,	%g3
	bn,a	%icc,	loop_708
	fbuge,a	%fcc0,	loop_709
	ldsh	[%l7 + 0x2A],	%o7
	ble	%xcc,	loop_710
loop_708:
	fmovscs	%icc,	%f4,	%f12
loop_709:
	xorcc	%i7,	0x1424,	%g1
	xnorcc	%g7,	0x1136,	%l5
loop_710:
	udivcc	%o4,	0x0755,	%l1
	fblg	%fcc3,	loop_711
	udivx	%o1,	0x132C,	%o0
	fnot1	%f16,	%f12
	fbul	%fcc2,	loop_712
loop_711:
	fmuld8ulx16	%f0,	%f4,	%f6
	fmovrslez	%i1,	%f6,	%f0
	movrne	%o6,	0x1C5,	%g2
loop_712:
	srax	%l4,	0x0E,	%i2
	fmovde	%icc,	%f20,	%f0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l3
	sra	%g5,	%g4,	%l2
	bcs,pt	%icc,	loop_713
	be,pn	%icc,	loop_714
	mova	%icc,	%g6,	%o2
	tg	%xcc,	0x5
loop_713:
	tsubcctv	%i3,	0x1421,	%l0
loop_714:
	sll	%i0,	0x0B,	%o5
	movvs	%xcc,	%o3,	%i5
	tcs	%xcc,	0x7
	movcs	%icc,	%l6,	%i4
	fbl	%fcc0,	loop_715
	fcmple16	%f10,	%f18,	%i6
	xor	%g3,	%i7,	%o7
	wr	%g0,	0x0c,	%asi
	sta	%f20,	[%l7 + 0x2C] %asi
loop_715:
	addcc	%g7,	0x03D2,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o4,	%l5,	%l1
	edge16n	%o1,	%i1,	%o6
	movrlz	%g2,	0x02F,	%o0
	edge16n	%i2,	%l3,	%g5
	movrlez	%g4,	%l4,	%l2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x10,	%o2,	%g6
	fmovse	%icc,	%f10,	%f17
	fandnot2s	%f23,	%f5,	%f7
	tcs	%icc,	0x2
	ldub	[%l7 + 0x7E],	%l0
	movcs	%icc,	%i3,	%o5
	edge16	%o3,	%i0,	%i5
	umulcc	%l6,	0x0C5D,	%i4
	umul	%i6,	0x1C63,	%g3
	nop
	fitos	%f11,	%f1
	fstox	%f1,	%f10
	fxtos	%f10,	%f21
	fmovrdne	%i7,	%f26,	%f2
	fbn,a	%fcc0,	loop_716
	nop
	fitos	%f9,	%f22
	fstod	%f22,	%f8
	sdivx	%o7,	0x1721,	%g7
	movvc	%xcc,	%o4,	%g1
loop_716:
	brgz,a	%l5,	loop_717
	fmovse	%xcc,	%f10,	%f14
	edge16	%o1,	%i1,	%o6
	movleu	%icc,	%g2,	%l1
loop_717:
	edge32l	%o0,	%l3,	%g5
	addc	%g4,	0x09DC,	%l4
	fpadd32s	%f6,	%f15,	%f14
	brz,a	%l2,	loop_718
	fmovsg	%xcc,	%f12,	%f31
	bcc,a,pt	%icc,	loop_719
	move	%icc,	%i2,	%o2
loop_718:
	bpos,a,pt	%xcc,	loop_720
	prefetch	[%l7 + 0x14],	 0x0
loop_719:
	be,a,pt	%xcc,	loop_721
	ldsb	[%l7 + 0x73],	%g6
loop_720:
	taddcctv	%i3,	0x05C5,	%o5
	fbne,a	%fcc0,	loop_722
loop_721:
	bshuffle	%f10,	%f2,	%f4
	udiv	%l0,	0x160F,	%i0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x16] %asi,	%i5
loop_722:
	tleu	%icc,	0x1
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbne	%fcc2,	loop_723
	fbe,a	%fcc2,	loop_724
	edge8l	%l6,	%o3,	%i6
	fmovdvs	%xcc,	%f8,	%f25
loop_723:
	fbe,a	%fcc3,	loop_725
loop_724:
	tge	%xcc,	0x3
	nop
	fitos	%f8,	%f20
	fstox	%f20,	%f10
	tle	%xcc,	0x6
loop_725:
	fbu	%fcc0,	loop_726
	movge	%icc,	%i4,	%g3
	tn	%icc,	0x4
	movn	%xcc,	%o7,	%g7
loop_726:
	sth	%o4,	[%l7 + 0x28]
	tle	%icc,	0x2
	xnorcc	%g1,	%l5,	%i7
	alignaddr	%o1,	%o6,	%i1
	edge16ln	%l1,	%g2,	%l3
	andcc	%o0,	0x1E77,	%g5
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0x3
	fbug,a	%fcc1,	loop_727
	tn	%icc,	0x4
	fmovdge	%icc,	%f4,	%f30
	xor	%l2,	0x1A60,	%i2
loop_727:
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f20
	fxtod	%f20,	%f26
	movg	%icc,	%g4,	%g6
	sdivx	%o2,	0x1E54,	%i3
	sir	0x1AF8
	movrgez	%o5,	%i0,	%i5
	tleu	%icc,	0x5
	edge32n	%l0,	%l6,	%o3
	bcc,a	loop_728
	smulcc	%i6,	%i4,	%g3
	set	0x40, %i2
	stwa	%o7,	[%l7 + %i2] 0x22
	membar	#Sync
loop_728:
	fnegd	%f10,	%f2
	wr	%g0,	0x19,	%asi
	stxa	%g7,	[%l7 + 0x38] %asi
	nop
	setx loop_729, %l0, %l1
	jmpl %l1, %o4
	bshuffle	%f10,	%f26,	%f12
	fandnot1s	%f7,	%f1,	%f23
	tneg	%icc,	0x3
loop_729:
	te	%icc,	0x0
	andncc	%g1,	%l5,	%o1
	bleu,pn	%icc,	loop_730
	stbar
	fones	%f2
	fmovdcs	%xcc,	%f26,	%f30
loop_730:
	movn	%xcc,	%o6,	%i7
	movle	%icc,	%l1,	%g2
	for	%f18,	%f0,	%f18
	fmovdne	%xcc,	%f10,	%f9
	fnot2	%f14,	%f6
	sub	%i1,	0x1343,	%o0
	nop
	setx	0x433F86D29B1039C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x860DB7BBE3F54037,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f0,	%f2
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%l3
	sll	%g5,	0x07,	%l4
	taddcctv	%i2,	0x0530,	%g4
	sethi	0x13F9,	%g6
	fpsub16	%f12,	%f8,	%f8
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%l2
	sdivcc	%i3,	0x0C43,	%o5
	tge	%icc,	0x6
	movn	%icc,	%i0,	%o2
	fmovsgu	%xcc,	%f3,	%f0
	movvs	%icc,	%i5,	%l6
	subc	%o3,	0x11E2,	%l0
	popc	%i6,	%g3
	nop
	setx	0x707881C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	tleu	%xcc,	0x5
	tl	%icc,	0x1
	edge8l	%o7,	%i4,	%g7
	movn	%xcc,	%o4,	%l5
	taddcctv	%o1,	0x11A2,	%g1
	set	0x67, %l1
	stba	%i7,	[%l7 + %l1] 0x19
	fmovscc	%xcc,	%f17,	%f21
	tge	%icc,	0x1
	fmovdcc	%icc,	%f6,	%f22
	nop
	setx	loop_731,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x7
	ta	%icc,	0x1
	fnands	%f4,	%f20,	%f1
loop_731:
	nop
	setx	0x11E48466,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xF12040A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f15,	%f23
	brgz,a	%o6,	loop_732
	tsubcc	%l1,	%i1,	%o0
	te	%xcc,	0x3
	add	%g2,	%g5,	%l4
loop_732:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i2
	fxnor	%f4,	%f18,	%f26
	fbo,a	%fcc1,	loop_733
	andcc	%g4,	%l3,	%g6
	set	0x18, %o4
	stha	%l2,	[%l7 + %o4] 0x81
loop_733:
	ta	%xcc,	0x6
	nop
	setx	0xA43574719EB19E11,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x546B9639A32B4DA5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f10
	bvs	%xcc,	loop_734
	xor	%o5,	%i3,	%o2
	movrlz	%i5,	%l6,	%o3
	alignaddr	%l0,	%i0,	%i6
loop_734:
	udiv	%o7,	0x0A35,	%i4
	alignaddrl	%g7,	%o4,	%l5
	faligndata	%f6,	%f10,	%f26
	be,pt	%icc,	loop_735
	fbule,a	%fcc0,	loop_736
	umul	%o1,	%g1,	%g3
	edge8n	%o6,	%i7,	%l1
loop_735:
	tcc	%xcc,	0x4
loop_736:
	tgu	%xcc,	0x4
	te	%icc,	0x6
	sir	0x0221
	movg	%icc,	%o0,	%g2
	andcc	%i1,	%l4,	%i2
	movg	%xcc,	%g5,	%l3
	movg	%xcc,	%g6,	%g4
	xnorcc	%o5,	%i3,	%l2
	fzeros	%f26
	fmovrdlz	%i5,	%f10,	%f18
	alignaddrl	%o2,	%l6,	%l0
	tle	%xcc,	0x0
	tn	%icc,	0x4
	nop
	setx	0x2C5F2774E51C4D8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA8B286E362A85DA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f30,	%f20
	popc	%i0,	%o3
	fmovrdgez	%i6,	%f0,	%f20
	set	0x17, %i7
	stba	%o7,	[%l7 + %i7] 0x27
	membar	#Sync
	movg	%icc,	%i4,	%g7
	sir	0x0473
	tn	%icc,	0x2
	subc	%o4,	%l5,	%g1
	subccc	%g3,	0x042F,	%o1
	orn	%i7,	0x094F,	%o6
	fmovs	%f30,	%f5
	mova	%icc,	%l1,	%g2
	fmovsl	%icc,	%f10,	%f29
	fones	%f14
	fble,a	%fcc0,	loop_737
	fnot1s	%f3,	%f24
	fmovsg	%icc,	%f20,	%f18
	set	0x54, %g5
	sta	%f11,	[%l7 + %g5] 0x14
loop_737:
	fmovsg	%icc,	%f18,	%f4
	nop
	setx loop_738, %l0, %l1
	jmpl %l1, %i1
	tgu	%icc,	0x7
	movrgez	%l4,	0x0D2,	%o0
	edge32n	%g5,	%i2,	%g6
loop_738:
	tvc	%xcc,	0x0
	movcs	%xcc,	%g4,	%l3
	fbo	%fcc0,	loop_739
	fmovdl	%icc,	%f15,	%f31
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o5
loop_739:
	movrlez	%l2,	0x14A,	%i3
	fabss	%f16,	%f22
	nop
	setx	loop_740,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x30],	%f24
	sdivcc	%i5,	0x1251,	%l6
	tsubcc	%l0,	0x119D,	%i0
loop_740:
	sll	%o3,	0x1F,	%o2
	edge16l	%o7,	%i6,	%i4
	brnz,a	%o4,	loop_741
	fornot2	%f4,	%f16,	%f20
	tge	%xcc,	0x0
	umulcc	%l5,	0x03DE,	%g1
loop_741:
	nop
	setx	loop_742,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue	%fcc3,	loop_743
	movleu	%xcc,	%g7,	%g3
	bg,a	loop_744
loop_742:
	xnor	%o1,	0x0D5E,	%i7
loop_743:
	bl	%xcc,	loop_745
	fbug,a	%fcc2,	loop_746
loop_744:
	fbule	%fcc0,	loop_747
	brlz	%l1,	loop_748
loop_745:
	tcs	%xcc,	0x1
loop_746:
	te	%xcc,	0x5
loop_747:
	smul	%g2,	%o6,	%l4
loop_748:
	movn	%xcc,	%o0,	%g5
	nop
	set	0x16, %g1
	ldsb	[%l7 + %g1],	%i1
	sdivcc	%i2,	0x1BBD,	%g4
	ldd	[%l7 + 0x70],	%l2
	taddcctv	%g6,	%o5,	%l2
	edge8l	%i5,	%i3,	%l6
	fmovscs	%xcc,	%f14,	%f26
	fmovscc	%icc,	%f15,	%f14
	bvc	%icc,	loop_749
	lduh	[%l7 + 0x22],	%l0
	tsubcctv	%i0,	0x0EF6,	%o2
	fmovdvc	%xcc,	%f3,	%f2
loop_749:
	bvc	loop_750
	nop
	set	0x28, %i6
	prefetch	[%l7 + %i6],	 0x3
	edge32	%o3,	%o7,	%i6
	srl	%i4,	0x1C,	%l5
loop_750:
	ta	%icc,	0x4
	fmovde	%icc,	%f4,	%f16
	fmovsne	%icc,	%f26,	%f24
	fmovrdgz	%o4,	%f22,	%f2
	subccc	%g7,	0x0EC1,	%g1
	nop
	setx	0xCAE3D98BA991C90C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x107D7A26D52AFC47,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f6,	%f30
	set	0x20, %o3
	stxa	%o1,	[%l7 + %o3] 0x10
	edge16l	%i7,	%g3,	%l1
	ldub	[%l7 + 0x53],	%g2
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x18,	%l4
	movre	%o6,	0x13C,	%g5
	addcc	%i1,	%i2,	%o0
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f8
	fxtos	%f8,	%f25
	te	%xcc,	0x2
	fba	%fcc1,	loop_751
	nop
	setx	loop_752,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%l3,	0x149B,	%g4
	subccc	%g6,	0x04B4,	%l2
loop_751:
	fmovdge	%xcc,	%f29,	%f14
loop_752:
	ta	%icc,	0x0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i5,	%i3
	alignaddrl	%o5,	%l6,	%i0
	fcmple32	%f22,	%f6,	%o2
	addccc	%l0,	%o7,	%o3
	xor	%i4,	%i6,	%l5
	tle	%icc,	0x6
	andn	%g7,	%o4,	%o1
	xorcc	%i7,	0x0EBB,	%g1
	mulscc	%g3,	0x1FC8,	%g2
	and	%l1,	0x11C3,	%o6
	sra	%g5,	0x1C,	%i1
	fabsd	%f14,	%f0
	movleu	%icc,	%i2,	%o0
	movge	%xcc,	%l3,	%g4
	movrlz	%l4,	%g6,	%l2
	fbe,a	%fcc2,	loop_753
	fmovscc	%icc,	%f21,	%f3
	tsubcc	%i5,	0x1B10,	%i3
	movl	%icc,	%o5,	%i0
loop_753:
	bleu,a	loop_754
	srax	%o2,	%l6,	%l0
	fmovrdne	%o7,	%f12,	%f28
	fmovrsgz	%o3,	%f6,	%f11
loop_754:
	sir	0x1D3E
	ld	[%l7 + 0x0C],	%f29
	nop
	setx	0x6A7C2E5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f20
	orcc	%i4,	%l5,	%g7
	fmovdleu	%icc,	%f21,	%f21
	bcs	%icc,	loop_755
	xor	%i6,	0x19A3,	%o4
	tvs	%xcc,	0x6
	edge32ln	%i7,	%o1,	%g3
loop_755:
	sdiv	%g1,	0x0B47,	%g2
	popc	0x0A26,	%o6
	edge32n	%l1,	%g5,	%i2
	set	0x10, %o2
	ldda	[%l7 + %o2] 0xeb,	%i0
	edge16ln	%l3,	%g4,	%l4
	fcmple32	%f4,	%f16,	%g6
	movrlz	%o0,	%i5,	%i3
	fmovsa	%xcc,	%f19,	%f22
	orn	%o5,	%i0,	%o2
	ldd	[%l7 + 0x68],	%f16
	tpos	%icc,	0x6
	popc	%l2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0945,	%l0
	fpsub16	%f18,	%f18,	%f10
	tsubcc	%o7,	0x0E5B,	%o3
	edge8n	%i4,	%l5,	%i6
	fzeros	%f15
	taddcc	%g7,	%o4,	%i7
	call	loop_756
	srlx	%o1,	0x1C,	%g1
	std	%f8,	[%l7 + 0x68]
	fnands	%f13,	%f11,	%f6
loop_756:
	stbar
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	nop
	fitos	%f7,	%f30
	pdist	%f30,	%f6,	%f10
	movleu	%xcc,	%g3,	%o6
	stw	%l1,	[%l7 + 0x64]
	te	%icc,	0x5
	addccc	%g5,	0x08DE,	%i1
	fand	%f10,	%f22,	%f14
	alignaddrl	%i2,	%g4,	%l4
	fmovde	%icc,	%f15,	%f25
	fmovrde	%g6,	%f10,	%f30
	taddcc	%l3,	0x04F2,	%o0
	nop
	setx	0x9FD767A257C9F9A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x28BEC0505691B6E9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f14,	%f10
	fblg,a	%fcc2,	loop_757
	tsubcc	%i3,	%o5,	%i0
	fmovrslez	%i5,	%f9,	%f0
	bleu,a	%icc,	loop_758
loop_757:
	or	%l2,	%o2,	%l6
	fmuld8ulx16	%f15,	%f21,	%f20
	srlx	%o7,	%o3,	%i4
loop_758:
	addcc	%l0,	%l5,	%g7
	nop
	set	0x51, %o0
	stb	%o4,	[%l7 + %o0]
	nop
	setx	0x7374CA53,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xFA73027F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f28,	%f24
	tcc	%xcc,	0x4
	orncc	%i7,	0x0AE2,	%o1
	tg	%xcc,	0x6
	umulcc	%g1,	%g2,	%g3
	std	%f6,	[%l7 + 0x58]
	addccc	%i6,	0x1161,	%l1
	ldstub	[%l7 + 0x4A],	%g5
	popc	%o6,	%i1
	add	%g4,	%l4,	%g6
	membar	0x49
	srax	%i2,	%l3,	%i3
	srlx	%o0,	%o5,	%i5
	nop
	setx	0x1A5D8DB1607FD9D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tsubcctv	%l2,	0x0253,	%o2
	array8	%i0,	%o7,	%o3
	array32	%i4,	%l0,	%l6
	taddcc	%g7,	0x0EA3,	%o4
	bcs,a,pt	%icc,	loop_759
	ta	%xcc,	0x5
	array16	%l5,	%o1,	%g1
	set	0x47, %o6
	ldsba	[%l7 + %o6] 0x15,	%g2
loop_759:
	smul	%g3,	%i6,	%i7
	alignaddrl	%g5,	%l1,	%i1
	tne	%xcc,	0x5
	xor	%o6,	%g4,	%l4
	pdist	%f2,	%f6,	%f4
	taddcctv	%g6,	%i2,	%i3
	fmovrdgz	%l3,	%f8,	%f8
	brnz,a	%o0,	loop_760
	fmul8ulx16	%f4,	%f18,	%f24
	srlx	%i5,	%l2,	%o5
	movrgez	%i0,	%o7,	%o3
loop_760:
	ldd	[%l7 + 0x58],	%o2
	alignaddrl	%l0,	%i4,	%g7
	ldsw	[%l7 + 0x58],	%l6
	movge	%xcc,	%o4,	%l5
	st	%f30,	[%l7 + 0x48]
	tge	%icc,	0x4
	bn,a	loop_761
	orn	%o1,	%g1,	%g3
	tg	%xcc,	0x4
	tge	%icc,	0x6
loop_761:
	bvs,pn	%icc,	loop_762
	tpos	%icc,	0x1
	fmuld8sux16	%f26,	%f17,	%f10
	ba,a,pt	%icc,	loop_763
loop_762:
	smul	%g2,	0x0CCB,	%i7
	umul	%g5,	%i6,	%l1
	movcs	%icc,	%o6,	%g4
loop_763:
	udiv	%l4,	0x06F5,	%g6
	tsubcc	%i2,	0x1CFA,	%i1
	swap	[%l7 + 0x08],	%l3
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f28
	set	0x36, %g4
	ldsha	[%l7 + %g4] 0x04,	%o0
	edge32ln	%i5,	%l2,	%o5
	tge	%xcc,	0x1
	bgu,a	loop_764
	alignaddrl	%i3,	%i0,	%o3
	alignaddrl	%o2,	%o7,	%i4
	andn	%g7,	0x07A1,	%l0
loop_764:
	tge	%xcc,	0x3
	movn	%icc,	%l6,	%o4
	nop
	setx	0xE727A60C27C163D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x2452054BF0D268E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f20,	%f30
	xnorcc	%l5,	%g1,	%o1
	ldub	[%l7 + 0x5D],	%g3
	xor	%i7,	0x0350,	%g2
	fmovrdgez	%i6,	%f12,	%f28
	lduh	[%l7 + 0x34],	%g5
	and	%o6,	0x1246,	%l1
	srax	%g4,	0x17,	%l4
	fornot2	%f0,	%f4,	%f22
	set	0x70, %o1
	sta	%f18,	[%l7 + %o1] 0x15
	sdiv	%i2,	0x0FA2,	%i1
	bvs,a,pt	%icc,	loop_765
	brgz,a	%l3,	loop_766
	bgu	%xcc,	loop_767
	fbg,a	%fcc1,	loop_768
loop_765:
	movneg	%xcc,	%g6,	%i5
loop_766:
	taddcc	%o0,	%l2,	%i3
loop_767:
	movleu	%xcc,	%i0,	%o3
loop_768:
	fcmpgt32	%f0,	%f22,	%o2
	bgu,a	loop_769
	nop
	setx	0x90643158,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	ldd	[%l7 + 0x60],	%f24
	edge8l	%o7,	%i4,	%o5
loop_769:
	alignaddr	%l0,	%g7,	%l6
	move	%icc,	%o4,	%l5
	mulx	%g1,	%g3,	%o1
	edge8n	%g2,	%i6,	%g5
	nop
	setx	0x6EC0252DC079C584,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	set	0x14, %o7
	sta	%f23,	[%l7 + %o7] 0x0c
	nop
	setx	0x7EF359344CEB14B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x73C040BF51FEEA6E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f10,	%f22
	array8	%o6,	%l1,	%g4
	fbuge	%fcc3,	loop_770
	tneg	%icc,	0x1
	movvs	%xcc,	%l4,	%i7
	fornot1	%f28,	%f0,	%f6
loop_770:
	fmovsvc	%icc,	%f30,	%f29
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f16
	nop
	setx	0x35DDF4EBB0698832,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	tvc	%icc,	0x4
	array32	%i2,	%i1,	%g6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%o0
	brlz	%l2,	loop_771
	tneg	%icc,	0x5
	and	%l3,	0x04CA,	%i3
	movre	%i0,	0x027,	%o3
loop_771:
	ta	%xcc,	0x7
	std	%f6,	[%l7 + 0x48]
	fbg,a	%fcc3,	loop_772
	fmovd	%f10,	%f26
	fornot1s	%f31,	%f3,	%f24
	move	%xcc,	%o2,	%o7
loop_772:
	move	%icc,	%o5,	%i4
	bg,a,pn	%icc,	loop_773
	nop
	set	0x20, %g7
	sth	%l0,	[%l7 + %g7]
	fornot2s	%f7,	%f16,	%f14
	alignaddr	%g7,	%l6,	%l5
loop_773:
	fmovsle	%icc,	%f17,	%f3
	alignaddr	%o4,	%g1,	%g3
	sra	%o1,	0x14,	%g2
	tg	%icc,	0x1
	ldsw	[%l7 + 0x3C],	%g5
	set	0x3C, %l3
	swapa	[%l7 + %l3] 0x18,	%o6
	fnegs	%f4,	%f31
	movrne	%i6,	0x18D,	%g4
	bvs,a,pt	%icc,	loop_774
	movg	%xcc,	%l1,	%i7
	array8	%i2,	%i1,	%g6
	tsubcctv	%i5,	%o0,	%l4
loop_774:
	nop
	setx	0x38AD06F5BCD02895,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB7E96003D56781AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f20,	%f0
	edge32	%l2,	%i3,	%i0
	sll	%o3,	0x0A,	%l3
	bcs,a	loop_775
	bleu	%icc,	loop_776
	xnorcc	%o7,	0x02EA,	%o5
	movle	%icc,	%o2,	%i4
loop_775:
	tsubcc	%l0,	%g7,	%l5
loop_776:
	fnot2s	%f26,	%f22
	sdiv	%l6,	0x159C,	%o4
	edge16n	%g3,	%g1,	%g2
	popc	%g5,	%o1
	sll	%o6,	0x02,	%i6
	flush	%l7 + 0x5C
	fpackfix	%f18,	%f7
	edge32n	%l1,	%g4,	%i7
	bcs	%icc,	loop_777
	alignaddr	%i2,	%i1,	%i5
	bn,a	loop_778
	brlz,a	%o0,	loop_779
loop_777:
	movrne	%g6,	%l4,	%i3
	move	%xcc,	%l2,	%i0
loop_778:
	nop
	set	0x68, %l4
	stwa	%o3,	[%l7 + %l4] 0x80
loop_779:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o5
	bvc	loop_780
	sir	0x1C36
	fbn,a	%fcc0,	loop_781
	sth	%o2,	[%l7 + 0x6E]
loop_780:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_782,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_781:
	movrne	%i4,	%l0,	%l3
	srlx	%l5,	%l6,	%o4
	fbge,a	%fcc3,	loop_783
loop_782:
	fbne	%fcc3,	loop_784
	fbuge	%fcc3,	loop_785
	fmovdn	%xcc,	%f21,	%f12
loop_783:
	nop
	set	0x38, %i4
	lduha	[%l7 + %i4] 0x0c,	%g7
loop_784:
	call	loop_786
loop_785:
	edge16	%g3,	%g2,	%g1
	brlz	%o1,	loop_787
	tvc	%icc,	0x0
loop_786:
	tgu	%icc,	0x4
	xor	%o6,	%i6,	%l1
loop_787:
	std	%f24,	[%l7 + 0x48]
	fbul,a	%fcc0,	loop_788
	membar	0x72
	alignaddr	%g4,	%g5,	%i2
	nop
	fitos	%f2,	%f19
	fstox	%f19,	%f14
loop_788:
	fmovdleu	%xcc,	%f4,	%f6
	movge	%xcc,	%i1,	%i5
	fble,a	%fcc1,	loop_789
	fnor	%f4,	%f16,	%f2
	umulcc	%i7,	0x158B,	%g6
	bcc	loop_790
loop_789:
	ldsb	[%l7 + 0x57],	%o0
	tpos	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
loop_790:
	fnors	%f15,	%f18,	%f3
	array16	%l2,	%l4,	%o3
	srl	%o7,	0x0F,	%o5
	andn	%o2,	%i0,	%l0
	nop
	setx	0x1B17017BDE94AEB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xD92D587BAEF137E9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f14,	%f2
	swap	[%l7 + 0x64],	%l3
	tl	%xcc,	0x0
	nop
	fitos	%f8,	%f3
	fstod	%f3,	%f28
	movvs	%icc,	%i4,	%l5
	movcs	%icc,	%l6,	%o4
	ldub	[%l7 + 0x67],	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%g1
	mulx	%g2,	%o6,	%i6
	tne	%xcc,	0x1
	nop
	setx	0xA75ADC7F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x7E40171B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f29,	%f12
	edge32l	%o1,	%l1,	%g4
	std	%f24,	[%l7 + 0x28]
	fmovrse	%i2,	%f24,	%f18
	tne	%icc,	0x7
	movrgez	%i1,	%i5,	%i7
	pdist	%f26,	%f6,	%f8
	srl	%g6,	0x1C,	%o0
	movn	%icc,	%g5,	%l2
	array32	%i3,	%l4,	%o7
	fpsub32	%f30,	%f0,	%f14
	tvc	%icc,	0x4
	srlx	%o5,	0x16,	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o3,	%i0
	movpos	%xcc,	%l3,	%l0
	flush	%l7 + 0x78
	fsrc1	%f12,	%f20
	udiv	%i4,	0x1F79,	%l5
	mova	%icc,	%l6,	%o4
	addc	%g7,	%g3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc0,	loop_791
	fmovsge	%xcc,	%f21,	%f19
	fmovrdlz	%o6,	%f30,	%f26
	movne	%icc,	%i6,	%g1
loop_791:
	andn	%o1,	0x036E,	%l1
	sethi	0x039E,	%i2
	brlez,a	%g4,	loop_792
	addcc	%i5,	%i7,	%g6
	edge16n	%i1,	%o0,	%g5
	nop
	setx	0xD98389714843B99B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x96143B60FE2DEF6C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f26,	%f6
loop_792:
	sdiv	%i3,	0x0520,	%l4
	stx	%o7,	[%l7 + 0x38]
	add	%o5,	0x09D5,	%l2
	fmovscs	%xcc,	%f28,	%f4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%i0
	edge32	%o3,	%l0,	%l3
	fsrc2	%f8,	%f6
	movvc	%icc,	%l5,	%i4
	fnands	%f30,	%f4,	%f23
	nop
	setx	0x6E4216D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x2E8CB124,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f3,	%f23
	fmovrdlez	%l6,	%f30,	%f22
	andcc	%o4,	%g7,	%g2
	st	%f28,	[%l7 + 0x48]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%o6,	loop_793
	fxors	%f27,	%f12,	%f10
	udiv	%i6,	0x00F2,	%g3
	membar	0x54
loop_793:
	xnor	%o1,	%g1,	%l1
	edge8ln	%g4,	%i5,	%i2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x5C] %asi,	%g6
	bn	loop_794
	fmovsle	%icc,	%f10,	%f16
	addcc	%i1,	%o0,	%g5
	movgu	%xcc,	%i7,	%l4
loop_794:
	addcc	%o7,	0x0853,	%i3
	taddcc	%l2,	%o2,	%o5
	sllx	%o3,	0x07,	%l0
	movleu	%xcc,	%l3,	%i0
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x81,	 0x2
	swap	[%l7 + 0x4C],	%i4
	movrgz	%o4,	%l6,	%g7
	edge16	%o6,	%g2,	%i6
	alignaddrl	%o1,	%g3,	%l1
	movle	%icc,	%g4,	%g1
	tge	%xcc,	0x3
	taddcctv	%i5,	0x0124,	%g6
	nop
	setx	0x10657857,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	tvc	%icc,	0x7
	movrgez	%i1,	0x091,	%o0
	call	loop_795
	movgu	%icc,	%i2,	%i7
	edge16l	%l4,	%o7,	%g5
	fbuge	%fcc2,	loop_796
loop_795:
	bn,a	%xcc,	loop_797
	fmul8ulx16	%f20,	%f8,	%f12
	fmovsne	%xcc,	%f9,	%f6
loop_796:
	pdist	%f26,	%f6,	%f10
loop_797:
	nop
	set	0x54, %i1
	ldsha	[%l7 + %i1] 0x18,	%l2
	andncc	%o2,	%i3,	%o3
	fble	%fcc1,	loop_798
	fors	%f11,	%f5,	%f4
	umul	%o5,	%l3,	%i0
	wr	%g0,	0xea,	%asi
	stba	%l5,	[%l7 + 0x28] %asi
	membar	#Sync
loop_798:
	fpack16	%f18,	%f7
	ba,a	loop_799
	movpos	%icc,	%l0,	%o4
	edge16	%i4,	%l6,	%o6
	subcc	%g7,	%i6,	%o1
loop_799:
	brlz,a	%g3,	loop_800
	edge32n	%l1,	%g4,	%g1
	mova	%icc,	%g2,	%i5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x16] %asi,	%i1
loop_800:
	for	%f2,	%f28,	%f2
	st	%f19,	[%l7 + 0x24]
	stb	%o0,	[%l7 + 0x1C]
	sdiv	%i2,	0x1366,	%i7
	fmovse	%xcc,	%f17,	%f22
	subcc	%l4,	%o7,	%g6
	fbne	%fcc0,	loop_801
	nop
	setx	0x5044E44F,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	fbge	%fcc2,	loop_802
	brz,a	%g5,	loop_803
loop_801:
	or	%o2,	0x17A3,	%i3
	edge8ln	%l2,	%o3,	%o5
loop_802:
	nop
	setx	loop_804,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_803:
	nop
	setx	loop_805,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%icc,	0x4
	fpsub16	%f30,	%f16,	%f18
loop_804:
	fandnot2	%f22,	%f24,	%f18
loop_805:
	xorcc	%i0,	%l5,	%l0
	taddcctv	%l3,	0x0C38,	%o4
	tcc	%icc,	0x5
	fabsd	%f20,	%f6
	fbule	%fcc3,	loop_806
	orcc	%i4,	%o6,	%g7
	addcc	%i6,	0x0BE7,	%l6
	andcc	%g3,	0x0ABB,	%l1
loop_806:
	nop
	setx	0xC723C2D046A9D3EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x76CABB802A00DA79,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f6,	%f16
	tsubcc	%o1,	0x1B8F,	%g1
	fbu	%fcc0,	loop_807
	fmovrde	%g2,	%f0,	%f4
	bleu,a	%icc,	loop_808
	bpos,pt	%icc,	loop_809
loop_807:
	fnor	%f18,	%f28,	%f16
	srax	%i5,	0x15,	%i1
loop_808:
	fbule,a	%fcc1,	loop_810
loop_809:
	bpos,a	%icc,	loop_811
	fnand	%f14,	%f14,	%f12
	nop
	setx	0xD7C03AEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x6C22036F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f17,	%f24
loop_810:
	fba	%fcc2,	loop_812
loop_811:
	sdiv	%o0,	0x0DD1,	%g4
	smulcc	%i7,	0x111E,	%i2
	movrlz	%o7,	%l4,	%g6
loop_812:
	fblg	%fcc3,	loop_813
	nop
	setx	0xC13DF685D051EF13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fpackfix	%f12,	%f17
	stb	%o2,	[%l7 + 0x22]
loop_813:
	movrgez	%i3,	0x3D6,	%l2
	fone	%f12
	ble,pn	%xcc,	loop_814
	ldsh	[%l7 + 0x20],	%g5
	subc	%o3,	0x11F4,	%i0
	sub	%o5,	0x1426,	%l5
loop_814:
	tcs	%xcc,	0x7
	umulcc	%l3,	0x0153,	%o4
	addccc	%l0,	0x0F04,	%o6
	fnors	%f22,	%f3,	%f25
	bg,pn	%xcc,	loop_815
	or	%g7,	%i6,	%i4
	edge32l	%g3,	%l6,	%o1
	fmovrsgez	%g1,	%f15,	%f23
loop_815:
	brgz	%g2,	loop_816
	bn,a	%xcc,	loop_817
	edge8ln	%l1,	%i5,	%i1
	bne,a	loop_818
loop_816:
	edge8n	%o0,	%g4,	%i2
loop_817:
	tge	%icc,	0x1
	sll	%o7,	0x02,	%i7
loop_818:
	tle	%icc,	0x4
	movrlez	%g6,	0x03A,	%o2
	srl	%i3,	%l4,	%l2
	nop
	fitod	%f26,	%f24
	tsubcctv	%o3,	%i0,	%g5
	fbuge,a	%fcc0,	loop_819
	umulcc	%l5,	%l3,	%o4
	fnegd	%f12,	%f0
	srlx	%o5,	0x18,	%l0
loop_819:
	addc	%o6,	%i6,	%g7
	edge32ln	%g3,	%i4,	%o1
	fba	%fcc1,	loop_820
	ble,a	loop_821
	bne,pn	%xcc,	loop_822
	tcc	%xcc,	0x6
loop_820:
	fmovsa	%icc,	%f21,	%f18
loop_821:
	array16	%l6,	%g2,	%l1
loop_822:
	sdiv	%i5,	0x197E,	%g1
	alignaddr	%i1,	%g4,	%o0
	mulx	%o7,	0x1D79,	%i7
	array32	%i2,	%g6,	%o2
	tcs	%icc,	0x5
	movn	%xcc,	%l4,	%i3
	fmovrdne	%l2,	%f30,	%f10
	ba	loop_823
	movrlz	%o3,	%i0,	%l5
	te	%icc,	0x6
	xnorcc	%l3,	0x008D,	%g5
loop_823:
	movrlz	%o5,	0x26C,	%l0
	fcmpeq32	%f4,	%f30,	%o4
	nop
	fitod	%f21,	%f24
	alignaddrl	%i6,	%g7,	%o6
	fpack32	%f16,	%f4,	%f18
	tleu	%icc,	0x5
	fmovsgu	%xcc,	%f20,	%f6
	nop
	fitos	%f6,	%f18
	nop
	setx loop_824, %l0, %l1
	jmpl %l1, %i4
	bvs,a	%icc,	loop_825
	sethi	0x0390,	%g3
	set	0x38, %i5
	stwa	%o1,	[%l7 + %i5] 0xeb
	membar	#Sync
loop_824:
	movcs	%icc,	%l6,	%g2
loop_825:
	lduw	[%l7 + 0x5C],	%i5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x34] %asi,	%g1
	fbul,a	%fcc2,	loop_826
	fnot1	%f16,	%f2
	add	%i1,	%g4,	%l1
	fandnot1s	%f1,	%f0,	%f17
loop_826:
	fcmpeq32	%f26,	%f14,	%o7
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x81,	%i7
	be	loop_827
	sir	0x0020
	taddcc	%o0,	0x0C22,	%i2
	ldd	[%l7 + 0x10],	%g6
loop_827:
	tne	%xcc,	0x2
	smulcc	%o2,	0x162C,	%l4
	fmovdl	%xcc,	%f10,	%f30
	mulscc	%l2,	0x0C75,	%i3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i0
	tcs	%xcc,	0x0
	sub	%o3,	%l5,	%l3
	membar	0x64
	membar	0x51
	fmovdne	%icc,	%f21,	%f27
	sir	0x1482
	movrlz	%o5,	%g5,	%l0
	edge16n	%o4,	%i6,	%g7
	faligndata	%f28,	%f8,	%f28
	set	0x5C, %g6
	lduba	[%l7 + %g6] 0x14,	%o6
	fnors	%f29,	%f22,	%f12
	sub	%i4,	0x1B1A,	%o1
	smul	%g3,	0x1160,	%l6
	ldx	[%l7 + 0x70],	%g2
	fandnot1	%f2,	%f6,	%f30
	edge16	%i5,	%i1,	%g4
	orncc	%l1,	0x0024,	%o7
	xnor	%i7,	%g1,	%i2
	fone	%f18
	fcmpgt16	%f4,	%f28,	%o0
	tl	%xcc,	0x4
	mova	%xcc,	%o2,	%l4
	stx	%l2,	[%l7 + 0x78]
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f8
	tpos	%icc,	0x2
	sub	%g6,	%i3,	%o3
	udivx	%l5,	0x091E,	%l3
	ta	%xcc,	0x0
	tleu	%xcc,	0x2
	fba,a	%fcc3,	loop_828
	fmovsne	%xcc,	%f1,	%f7
	addcc	%i0,	%g5,	%l0
	taddcctv	%o5,	0x0018,	%i6
loop_828:
	fmovdne	%xcc,	%f11,	%f8
	ba	%xcc,	loop_829
	fpsub32	%f4,	%f20,	%f24
	sethi	0x15F2,	%g7
	set	0x08, %l5
	sta	%f19,	[%l7 + %l5] 0x88
loop_829:
	movrlez	%o4,	0x1F3,	%o6
	fmovrdlz	%i4,	%f30,	%f22
	ta	%icc,	0x1
	ldsw	[%l7 + 0x6C],	%g3
	sethi	0x034E,	%l6
	edge16ln	%o1,	%g2,	%i1
	xnor	%g4,	0x0BEA,	%l1
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x10
	and	%i5,	%o7,	%g1
	fmovrsne	%i2,	%f29,	%f14
	taddcc	%o0,	%i7,	%l4
	nop
	setx	0xB4634BEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xCA949ADC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f22,	%f16
	nop
	set	0x5F, %l2
	ldsb	[%l7 + %l2],	%o2
	be,a	loop_830
	mulscc	%g6,	%i3,	%o3
	umul	%l2,	0x0E17,	%l3
	ta	%icc,	0x0
loop_830:
	addc	%l5,	0x1C39,	%g5
	mova	%xcc,	%i0,	%o5
	sub	%l0,	0x1026,	%g7
	membar	0x58
	bpos	loop_831
	pdist	%f26,	%f12,	%f12
	addccc	%o4,	%i6,	%i4
	add	%o6,	%g3,	%l6
loop_831:
	edge8l	%o1,	%g2,	%i1
	bvs,a	loop_832
	tcc	%xcc,	0x3
	edge16	%g4,	%i5,	%o7
	ba,a,pt	%icc,	loop_833
loop_832:
	ldd	[%l7 + 0x20],	%l0
	tg	%xcc,	0x6
	sdivx	%g1,	0x0E8D,	%i2
loop_833:
	sra	%o0,	%l4,	%o2
	ldd	[%l7 + 0x08],	%i6
	fble	%fcc1,	loop_834
	udivcc	%i3,	0x03F0,	%o3
	tg	%icc,	0x2
	call	loop_835
loop_834:
	fmovsn	%xcc,	%f8,	%f27
	tcc	%icc,	0x7
	fsrc1s	%f17,	%f5
loop_835:
	udivcc	%g6,	0x17BA,	%l3
	udivcc	%l2,	0x1889,	%l5
	addccc	%i0,	0x0061,	%o5
	sethi	0x14DC,	%g5
	edge16l	%l0,	%o4,	%g7
	edge8n	%i6,	%i4,	%g3
	mulscc	%o6,	%l6,	%g2
	ble	loop_836
	subcc	%o1,	0x0FEF,	%g4
	taddcctv	%i5,	0x0976,	%i1
	tg	%xcc,	0x4
loop_836:
	movg	%xcc,	%o7,	%g1
	nop
	setx	loop_837,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%i2,	%l1
	fmovrslz	%l4,	%f4,	%f17
	movrlez	%o0,	%o2,	%i7
loop_837:
	movne	%icc,	%i3,	%o3
	fbge	%fcc2,	loop_838
	tneg	%icc,	0x2
	xor	%l3,	%l2,	%l5
	movneg	%xcc,	%i0,	%o5
loop_838:
	sdivx	%g5,	0x154C,	%g6
	array8	%o4,	%l0,	%i6
	movrgez	%g7,	0x096,	%g3
	fmovrsgez	%o6,	%f16,	%f13
	alignaddr	%l6,	%g2,	%o1
	umul	%g4,	%i4,	%i1
	ba,a,pt	%xcc,	loop_839
	fsrc2s	%f7,	%f0
	bge,pt	%xcc,	loop_840
	fbg,a	%fcc3,	loop_841
loop_839:
	udivcc	%i5,	0x0131,	%g1
	orcc	%o7,	%i2,	%l1
loop_840:
	sethi	0x1278,	%o0
loop_841:
	nop
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x18] %asi
	tle	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i7,	%i3,	%o3
	fcmpgt16	%f12,	%f4,	%l3
	fmovsge	%xcc,	%f28,	%f25
	stbar
	brgz,a	%l2,	loop_842
	bge	loop_843
	fmovda	%xcc,	%f14,	%f2
	edge8l	%l5,	%i0,	%o2
loop_842:
	faligndata	%f24,	%f18,	%f2
loop_843:
	movneg	%xcc,	%o5,	%g6
	movg	%xcc,	%g5,	%l0
	brgez,a	%i6,	loop_844
	popc	%g7,	%g3
	or	%o6,	0x05E5,	%l6
	taddcctv	%g2,	0x1565,	%o4
loop_844:
	tcs	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o1
	edge8	%i4,	%g4,	%i1
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x18
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g1
	stbar
	addcc	%o7,	0x1A20,	%i2
	ta	%icc,	0x3
	stbar
	tle	%icc,	0x6
	sll	%l1,	0x00,	%i5
	edge16ln	%l4,	%i7,	%i3
	udivx	%o3,	0x03C3,	%o0
	nop
	setx	0x42150E61,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x9E559264,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f6,	%f0
	brlez	%l3,	loop_845
	andcc	%l5,	%l2,	%o2
	lduh	[%l7 + 0x6C],	%i0
	edge16ln	%o5,	%g6,	%l0
loop_845:
	subccc	%i6,	%g7,	%g5
	pdist	%f14,	%f10,	%f10
	fmovdcs	%icc,	%f8,	%f13
	smul	%o6,	%g3,	%l6
	sth	%g2,	[%l7 + 0x74]
	fpadd16s	%f29,	%f11,	%f24
	andcc	%o1,	%i4,	%o4
	nop
	set	0x58, %g3
	ldsw	[%l7 + %g3],	%i1
	umul	%g4,	%o7,	%i2
	fbuge	%fcc1,	loop_846
	movvc	%xcc,	%l1,	%g1
	std	%f0,	[%l7 + 0x40]
	membar	0x09
loop_846:
	brz	%l4,	loop_847
	edge32l	%i7,	%i3,	%i5
	fabsd	%f4,	%f24
	nop
	setx	0x204B8FA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
loop_847:
	nop
	set	0x76, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o3
	addcc	%l3,	%o0,	%l5
	fmovrslz	%o2,	%f10,	%f13
	tn	%icc,	0x5
	sll	%l2,	0x1A,	%o5
	mulx	%i0,	0x0EE8,	%g6
	fbuge,a	%fcc1,	loop_848
	membar	0x13
	fbue,a	%fcc2,	loop_849
	bpos,a	%icc,	loop_850
loop_848:
	tn	%icc,	0x3
	sdiv	%l0,	0x0F50,	%g7
loop_849:
	array16	%g5,	%i6,	%g3
loop_850:
	fbul	%fcc3,	loop_851
	ld	[%l7 + 0x28],	%f19
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l6,	%g2
loop_851:
	fbge,a	%fcc2,	loop_852
	tsubcc	%o1,	0x0DDA,	%i4
	udiv	%o6,	0x10CC,	%o4
	sethi	0x0F88,	%i1
loop_852:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x16] %asi,	%o7
	umulcc	%g4,	%l1,	%i2
	fmul8sux16	%f14,	%f26,	%f28
	fcmple32	%f30,	%f28,	%l4
	tl	%icc,	0x1
	movpos	%xcc,	%i7,	%g1
	bg,a,pt	%icc,	loop_853
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f16
	fxtod	%f16,	%f0
	edge16l	%i5,	%i3,	%o3
	brlez	%l3,	loop_854
loop_853:
	fmovscc	%xcc,	%f30,	%f0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%l5
loop_854:
	tge	%icc,	0x4
	stw	%o2,	[%l7 + 0x5C]
	st	%f17,	[%l7 + 0x54]
	te	%icc,	0x1
	stbar
	sdiv	%l2,	0x1FF8,	%o5
	fmovdvc	%icc,	%f25,	%f26
	andcc	%o0,	%i0,	%l0
	stx	%g6,	[%l7 + 0x70]
	fabss	%f14,	%f8
	lduh	[%l7 + 0x0E],	%g7
	fcmpne16	%f12,	%f20,	%g5
	sdivx	%i6,	0x0FA0,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%g2,	loop_855
	fandnot2s	%f26,	%f20,	%f10
	brgez	%g3,	loop_856
	sll	%i4,	%o6,	%o1
loop_855:
	orcc	%i1,	%o7,	%g4
	lduh	[%l7 + 0x22],	%l1
loop_856:
	edge8l	%i2,	%l4,	%i7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x36] %asi,	%o4
	nop
	fitod	%f25,	%f14
	ldd	[%l7 + 0x40],	%g0
	movrlz	%i3,	0x241,	%i5
	alignaddr	%o3,	%l5,	%o2
	fmul8ulx16	%f24,	%f30,	%f12
	sdivcc	%l2,	0x0FEE,	%l3
	nop
	fitos	%f8,	%f22
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o0,	%o5
	move	%xcc,	%l0,	%i0
	movrgez	%g6,	0x23A,	%g7
	ta	%xcc,	0x2
	tneg	%xcc,	0x3
	movrlz	%i6,	%l6,	%g2
	set	0x20, %o4
	ldxa	[%l7 + %o4] 0x89,	%g5
	fbg,a	%fcc2,	loop_857
	fmovsleu	%icc,	%f14,	%f5
	bcs	%icc,	loop_858
	swap	[%l7 + 0x50],	%g3
loop_857:
	fmovs	%f18,	%f8
	tleu	%xcc,	0x2
loop_858:
	edge16l	%o6,	%o1,	%i4
	movrlz	%o7,	0x017,	%g4
	bne,a	loop_859
	fpsub32	%f0,	%f24,	%f4
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%l1
loop_859:
	fba	%fcc3,	loop_860
	fmovdle	%icc,	%f13,	%f30
	fbule,a	%fcc1,	loop_861
	orcc	%i1,	%l4,	%i2
loop_860:
	fmovdcs	%xcc,	%f16,	%f17
	sdivcc	%i7,	0x05D0,	%g1
loop_861:
	mova	%icc,	%o4,	%i5
	xorcc	%i3,	%o3,	%o2
	fmovse	%xcc,	%f15,	%f3
	edge8n	%l2,	%l3,	%l5
	movre	%o0,	0x2E8,	%l0
	ldsw	[%l7 + 0x08],	%i0
	srlx	%g6,	0x01,	%o5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x40] %asi,	%f23
	be	%icc,	loop_862
	movrgez	%g7,	%i6,	%g2
	sra	%l6,	%g3,	%o6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%o0
loop_862:
	and	%i4,	0x02BE,	%g5
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f0
	umulcc	%g4,	%o7,	%l1
	edge16ln	%l4,	%i1,	%i7
	fbn	%fcc3,	loop_863
	call	loop_864
	orn	%i2,	%g1,	%o4
	te	%xcc,	0x5
loop_863:
	fmovsa	%icc,	%f9,	%f24
loop_864:
	membar	0x3C
	movle	%xcc,	%i3,	%i5
	stx	%o2,	[%l7 + 0x68]
	xnorcc	%o3,	0x12B8,	%l3
	tvs	%xcc,	0x4
	bgu,a	%xcc,	loop_865
	movneg	%xcc,	%l2,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f30,	%f26
loop_865:
	fpsub16s	%f1,	%f3,	%f20
	udivx	%l5,	0x022E,	%i0
	udivcc	%g6,	0x19E9,	%o5
	nop
	setx	loop_866,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%l0,	0x06,	%g7
	fmovrslez	%g2,	%f1,	%f21
	tl	%icc,	0x1
loop_866:
	nop
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f0
	ldub	[%l7 + 0x66],	%l6
	movcc	%xcc,	%i6,	%o6
	fbe	%fcc3,	loop_867
	movgu	%xcc,	%o1,	%i4
	edge16l	%g3,	%g4,	%g5
	lduw	[%l7 + 0x08],	%l1
loop_867:
	ldub	[%l7 + 0x75],	%o7
	nop
	fitod	%f12,	%f20
	fdtos	%f20,	%f7
	edge32ln	%l4,	%i7,	%i2
	nop
	fitos	%f2,	%f18
	fstox	%f18,	%f26
	tcs	%icc,	0x7
	fmovda	%icc,	%f14,	%f30
	fmovscs	%xcc,	%f1,	%f8
	movle	%icc,	%i1,	%g1
	movvs	%icc,	%o4,	%i3
	std	%f0,	[%l7 + 0x08]
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f12
	fxtos	%f12,	%f26
	bne,a,pt	%xcc,	loop_868
	fbul,a	%fcc2,	loop_869
	tne	%icc,	0x4
	edge32l	%i5,	%o2,	%l3
loop_868:
	brgez	%o3,	loop_870
loop_869:
	movrne	%l2,	0x0AD,	%o0
	movre	%l5,	0x224,	%i0
	tneg	%xcc,	0x3
loop_870:
	fxnor	%f22,	%f12,	%f6
	bn,pn	%icc,	loop_871
	fmovsvs	%xcc,	%f0,	%f12
	fmovdvs	%icc,	%f4,	%f13
	fbul	%fcc2,	loop_872
loop_871:
	bn,a,pn	%xcc,	loop_873
	bcs,a	loop_874
	ld	[%l7 + 0x78],	%f26
loop_872:
	movvc	%icc,	%g6,	%o5
loop_873:
	fbue	%fcc2,	loop_875
loop_874:
	movn	%icc,	%g7,	%g2
	set	0x18, %g1
	ldstuba	[%l7 + %g1] 0x11,	%l0
loop_875:
	xnor	%i6,	%l6,	%o6
	fmovdneg	%xcc,	%f30,	%f6
	movpos	%icc,	%o1,	%i4
	edge32l	%g3,	%g4,	%g5
	umul	%l1,	0x1C08,	%l4
	mulscc	%i7,	0x1022,	%i2
	andcc	%i1,	%g1,	%o7
	tl	%icc,	0x5
	wr	%g0,	0x88,	%asi
	stha	%o4,	[%l7 + 0x3A] %asi
	bvc	%icc,	loop_876
	move	%icc,	%i5,	%i3
	taddcctv	%o2,	0x0240,	%l3
	tgu	%xcc,	0x7
loop_876:
	edge16l	%o3,	%l2,	%l5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x3C] %asi,	%o0
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%i0
	movne	%xcc,	%g6,	%g7
	subcc	%o5,	0x01B1,	%g2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l0
	set	0x34, %i3
	lda	[%l7 + %i3] 0x10,	%f20
	tneg	%icc,	0x4
	movrlz	%l6,	0x22E,	%i6
	movle	%xcc,	%o1,	%i4
	ldd	[%l7 + 0x48],	%g2
	alignaddrl	%g4,	%o6,	%l1
	fors	%f2,	%f7,	%f16
	sra	%l4,	0x02,	%g5
	nop
	setx loop_877, %l0, %l1
	jmpl %l1, %i7
	movrlz	%i2,	0x263,	%g1
	taddcctv	%i1,	0x1DB6,	%o4
	fmovdvc	%xcc,	%f19,	%f31
loop_877:
	fornot2s	%f1,	%f11,	%f5
	taddcc	%i5,	0x0634,	%i3
	nop
	setx	0x884D05D5205EB928,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	or	%o2,	%o7,	%l3
	set	0x49, %g2
	ldsba	[%l7 + %g2] 0x89,	%o3
	edge8l	%l5,	%o0,	%i0
	ba	loop_878
	udivx	%l2,	0x1255,	%g7
	edge16l	%o5,	%g6,	%l0
	set	0x72, %o2
	ldsha	[%l7 + %o2] 0x11,	%l6
loop_878:
	nop
	setx	0x176E8902706D5FAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fmovdpos	%icc,	%f9,	%f4
	ldsb	[%l7 + 0x25],	%i6
	fornot2s	%f11,	%f3,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x74] %asi,	%o1
	alignaddrl	%g2,	%g3,	%g4
	fsrc1	%f6,	%f4
	tcs	%xcc,	0x3
	tle	%xcc,	0x7
	fpmerge	%f17,	%f3,	%f28
	mova	%xcc,	%o6,	%l1
	fornot2	%f30,	%f26,	%f26
	movrgz	%l4,	0x043,	%g5
	movvs	%icc,	%i4,	%i7
	set	0x108, %o0
	ldxa	[%g0 + %o0] 0x21,	%i2
	tsubcctv	%i1,	%o4,	%g1
	xnorcc	%i5,	0x1B0C,	%o2
	fmovs	%f24,	%f3
	tvc	%xcc,	0x6
	ta	%icc,	0x1
	edge8l	%i3,	%o7,	%l3
	bn,a	%icc,	loop_879
	fba,a	%fcc1,	loop_880
	fnot2	%f22,	%f12
	fand	%f2,	%f6,	%f4
loop_879:
	mulscc	%o3,	0x093A,	%o0
loop_880:
	movre	%l5,	0x29B,	%l2
	bvs,a	%icc,	loop_881
	sth	%i0,	[%l7 + 0x50]
	fmovrslz	%o5,	%f15,	%f29
	nop
	fitos	%f0,	%f31
	fstox	%f31,	%f2
loop_881:
	umulcc	%g7,	0x0317,	%g6
	udivcc	%l6,	0x01DB,	%l0
	fmovdcs	%icc,	%f26,	%f3
	tgu	%icc,	0x4
	fbe,a	%fcc2,	loop_882
	edge16l	%o1,	%i6,	%g3
	nop
	setx	0x20BB1D47,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x3EA88039,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f27,	%f11
	andn	%g2,	%g4,	%l1
loop_882:
	tsubcc	%l4,	0x08AA,	%g5
	andncc	%o6,	%i4,	%i7
	fsrc2s	%f11,	%f9
	call	loop_883
	fmovsgu	%xcc,	%f31,	%f3
	set	0x74, %o6
	swapa	[%l7 + %o6] 0x19,	%i1
loop_883:
	move	%icc,	%o4,	%g1
	fmovsneg	%icc,	%f2,	%f13
	tge	%icc,	0x2
	nop
	fitos	%f16,	%f26
	tgu	%xcc,	0x7
	bn,a,pt	%icc,	loop_884
	ble	%xcc,	loop_885
	move	%icc,	%i2,	%i5
	taddcc	%o2,	%i3,	%o7
loop_884:
	movleu	%xcc,	%l3,	%o0
loop_885:
	fcmpeq32	%f12,	%f30,	%o3
	fmovse	%xcc,	%f3,	%f24
	sllx	%l5,	%l2,	%i0
	wr	%g0,	0x27,	%asi
	stha	%o5,	[%l7 + 0x16] %asi
	membar	#Sync
	edge16l	%g7,	%l6,	%l0
	fnot2	%f18,	%f6
	prefetch	[%l7 + 0x10],	 0x3
	fmovrde	%o1,	%f12,	%f18
	ldsb	[%l7 + 0x12],	%i6
	xorcc	%g6,	0x0F59,	%g2
	and	%g4,	0x0C37,	%g3
	fbe,a	%fcc3,	loop_886
	andncc	%l4,	%g5,	%l1
	sra	%o6,	%i7,	%i1
	movpos	%icc,	%o4,	%i4
loop_886:
	movrgez	%g1,	%i5,	%o2
	fbul	%fcc3,	loop_887
	or	%i2,	0x0E98,	%i3
	tsubcc	%o7,	%o0,	%o3
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
loop_887:
	nop
	setx loop_888, %l0, %l1
	jmpl %l1, %l2
	fmovdge	%icc,	%f3,	%f29
	bvs	loop_889
	sethi	0x1F51,	%l5
loop_888:
	movne	%icc,	%o5,	%g7
	edge16l	%l6,	%l0,	%o1
loop_889:
	nop
	set	0x1C, %o3
	prefetch	[%l7 + %o3],	 0x3
	tsubcctv	%i0,	0x07BB,	%g6
	fblg	%fcc0,	loop_890
	fmul8x16	%f2,	%f12,	%f12
	call	loop_891
	sdivcc	%g2,	0x0A01,	%i6
loop_890:
	movle	%icc,	%g4,	%g3
	fbg,a	%fcc1,	loop_892
loop_891:
	tvs	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g5,	%l4,	%o6
loop_892:
	addccc	%l1,	%i7,	%o4
	tpos	%xcc,	0x0
	andn	%i1,	0x1463,	%i4
	umul	%g1,	0x0435,	%i5
	bleu,a	%icc,	loop_893
	edge32n	%o2,	%i2,	%i3
	edge32ln	%o0,	%o7,	%o3
	udivcc	%l3,	0x1FA7,	%l5
loop_893:
	move	%xcc,	%o5,	%g7
	ldd	[%l7 + 0x18],	%f18
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l6,	%l0
	fsrc2s	%f13,	%f5
	array32	%l2,	%i0,	%o1
	movl	%xcc,	%g6,	%g2
	fbul	%fcc2,	loop_894
	edge32l	%g4,	%g3,	%i6
	te	%icc,	0x6
	mova	%icc,	%g5,	%l4
loop_894:
	bcc,a,pn	%xcc,	loop_895
	brz,a	%o6,	loop_896
	edge8n	%i7,	%l1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_895:
	nop
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x18,	 0x1
loop_896:
	orn	%g1,	0x078D,	%i5
	bleu	loop_897
	tge	%icc,	0x7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%i2
loop_897:
	fbn,a	%fcc2,	loop_898
	lduw	[%l7 + 0x4C],	%i3
	tn	%xcc,	0x2
	movvc	%icc,	%o0,	%o7
loop_898:
	fmovrse	%o3,	%f28,	%f24
	fmovrde	%l3,	%f22,	%f28
	tg	%xcc,	0x6
	tn	%icc,	0x1
	subcc	%i4,	%l5,	%o5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x08] %asi,	%l6
	nop
	fitod	%f2,	%f10
	fdtoi	%f10,	%f10
	sdivcc	%g7,	0x18B8,	%l0
	movne	%xcc,	%l2,	%i0
	addcc	%g6,	%o1,	%g2
	movg	%xcc,	%g4,	%i6
	fmovrdne	%g5,	%f8,	%f24
	fbge	%fcc3,	loop_899
	tvc	%xcc,	0x3
	bne	%icc,	loop_900
	fxors	%f16,	%f12,	%f1
loop_899:
	fcmple32	%f0,	%f6,	%g3
	alignaddrl	%l4,	%o6,	%l1
loop_900:
	sethi	0x10D6,	%o4
	ta	%icc,	0x1
	movvc	%xcc,	%i1,	%g1
	edge32n	%i5,	%i7,	%o2
	orcc	%i3,	0x1162,	%i2
	brgez,a	%o0,	loop_901
	fone	%f14
	fandnot2s	%f14,	%f0,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_901:
	fmovdn	%icc,	%f21,	%f10
	subc	%o3,	%l3,	%i4
	array16	%o7,	%l5,	%l6
	sra	%o5,	0x13,	%l0
	tsubcctv	%g7,	%i0,	%l2
	fbo	%fcc1,	loop_902
	ldx	[%l7 + 0x58],	%o1
	pdist	%f30,	%f14,	%f22
	xor	%g2,	0x0A43,	%g6
loop_902:
	fbne	%fcc0,	loop_903
	fpadd32	%f24,	%f24,	%f14
	xnorcc	%i6,	%g5,	%g4
	call	loop_904
loop_903:
	array16	%l4,	%g3,	%l1
	movrlz	%o4,	0x266,	%i1
	udivx	%g1,	0x0705,	%i5
loop_904:
	taddcctv	%i7,	%o6,	%o2
	addc	%i3,	0x0A40,	%o0
	fxnor	%f28,	%f14,	%f8
	fbue	%fcc2,	loop_905
	fmovscc	%icc,	%f25,	%f22
	tg	%xcc,	0x5
	ldub	[%l7 + 0x37],	%i2
loop_905:
	umul	%l3,	0x04FE,	%i4
	tpos	%xcc,	0x5
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o3,	0x0F4E,	%l5
	tpos	%icc,	0x1
	fmovda	%icc,	%f21,	%f11
	nop
	setx	0x0B3FC4DB7071C501,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	umulcc	%l6,	%o7,	%o5
	fba,a	%fcc0,	loop_906
	sdivcc	%g7,	0x155C,	%i0
	movne	%icc,	%l0,	%o1
	tsubcc	%g2,	0x06C4,	%g6
loop_906:
	brgz,a	%i6,	loop_907
	movpos	%xcc,	%l2,	%g5
	fmul8ulx16	%f22,	%f12,	%f6
	udivcc	%l4,	0x086A,	%g4
loop_907:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l1,	%g3
	fexpand	%f26,	%f2
	fmovrsgz	%o4,	%f9,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f28,	%f4,	%f12
	fabsd	%f14,	%f8
	addccc	%i1,	%i5,	%i7
	movg	%icc,	%o6,	%g1
	fpadd16s	%f6,	%f24,	%f15
	fpsub32	%f28,	%f14,	%f24
	fmovrdgz	%o2,	%f26,	%f26
	tle	%icc,	0x3
	bgu	%xcc,	loop_908
	movle	%icc,	%o0,	%i3
	nop
	setx	loop_909,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%i2,	0x0D,	%l3
loop_908:
	movleu	%xcc,	%i4,	%o3
	movrgz	%l6,	%o7,	%l5
loop_909:
	orn	%g7,	0x1DA6,	%o5
	tn	%xcc,	0x7
	fmovdvs	%icc,	%f22,	%f6
	nop
	fitos	%f12,	%f10
	movre	%l0,	0x3CB,	%i0
	bcs	loop_910
	addccc	%o1,	0x17D1,	%g2
	popc	0x1151,	%i6
	tge	%xcc,	0x2
loop_910:
	edge8n	%g6,	%l2,	%l4
	ldsw	[%l7 + 0x28],	%g5
	fcmpeq32	%f0,	%f18,	%g4
	fands	%f24,	%f8,	%f14
	mulscc	%g3,	%o4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x18, %l6
	lda	[%l7 + %l6] 0x89,	%f11
	nop
	setx	0xFF561E46,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f6
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x15,	 0x3
	sra	%i7,	%i5,	%o6
	nop
	setx	0xE4471806,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xA6B14243,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f22,	%f9
	movrlez	%g1,	0x2F8,	%o2
	brlez	%i3,	loop_911
	bshuffle	%f8,	%f26,	%f6
	nop
	setx	loop_912,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2s	%f8,	%f10
loop_911:
	edge8l	%o0,	%i2,	%i4
	movneg	%icc,	%o3,	%l6
loop_912:
	array32	%o7,	%l3,	%l5
	fmovdne	%xcc,	%f25,	%f26
	nop
	setx	0xAEE0310E6077AF1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fbe,a	%fcc1,	loop_913
	edge8n	%g7,	%l0,	%o5
	mulx	%o1,	%i0,	%i6
	sir	0x0BD8
loop_913:
	tpos	%xcc,	0x0
	sethi	0x0CC7,	%g2
	movcc	%icc,	%g6,	%l4
	membar	0x37
	tgu	%xcc,	0x7
	bl,a	loop_914
	movcs	%xcc,	%l2,	%g5
	sir	0x1508
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g3,	%g4
loop_914:
	mulscc	%o4,	0x12ED,	%i1
	xor	%l1,	%i5,	%i7
	bgu,pt	%icc,	loop_915
	mulscc	%o6,	0x1C8D,	%o2
	tne	%xcc,	0x6
	fmul8x16au	%f1,	%f9,	%f18
loop_915:
	movgu	%xcc,	%i3,	%g1
	fmovscc	%xcc,	%f14,	%f21
	edge8ln	%o0,	%i4,	%o3
	edge8l	%l6,	%o7,	%l3
	nop
	setx	0x4A30B9F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xC3177298,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f5,	%f21
	srl	%l5,	%i2,	%l0
	sdiv	%o5,	0x1F67,	%o1
	fbule,a	%fcc1,	loop_916
	fnand	%f22,	%f12,	%f10
	bshuffle	%f0,	%f16,	%f12
	xorcc	%g7,	0x1BE0,	%i6
loop_916:
	movge	%icc,	%i0,	%g2
	tpos	%xcc,	0x5
	fnegd	%f30,	%f0
	edge8	%l4,	%l2,	%g5
	tg	%xcc,	0x4
	orncc	%g6,	0x19FC,	%g3
	movpos	%icc,	%o4,	%g4
	addccc	%i1,	%i5,	%l1
	ld	[%l7 + 0x48],	%f23
	fba	%fcc0,	loop_917
	fnegs	%f19,	%f9
	nop
	setx	0x80C79E0A4BB4AF8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB2A0A8B9EDF0BD5E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f6
	edge32n	%o6,	%o2,	%i3
loop_917:
	orncc	%i7,	%o0,	%g1
	popc	%o3,	%l6
	andn	%i4,	0x1F1C,	%l3
	fone	%f6
	fbu	%fcc3,	loop_918
	tne	%xcc,	0x7
	movgu	%xcc,	%o7,	%i2
	subccc	%l5,	0x19DF,	%l0
loop_918:
	tl	%xcc,	0x2
	srlx	%o1,	0x11,	%g7
	edge16n	%o5,	%i6,	%g2
	or	%l4,	0x1ABA,	%l2
	movrgez	%i0,	0x05F,	%g6
	ld	[%l7 + 0x18],	%f25
	sll	%g5,	0x09,	%g3
	tvs	%icc,	0x3
	sethi	0x1AC9,	%g4
	edge32	%i1,	%i5,	%o4
	udiv	%l1,	0x059E,	%o2
	mova	%icc,	%i3,	%i7
	fnor	%f24,	%f12,	%f8
	tpos	%icc,	0x1
	ta	%icc,	0x3
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x10,	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o6,	%g1,	%o3
	ldub	[%l7 + 0x7D],	%i4
	fornot1	%f8,	%f14,	%f14
	udivx	%l3,	0x0D4A,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%o7
	nop
	setx	0x9D75A03D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD1B9E271,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f11,	%f12
	fmovsge	%xcc,	%f29,	%f17
	mulx	%l0,	0x0EF8,	%l5
	edge32n	%o1,	%g7,	%o5
	movvc	%xcc,	%g2,	%i6
	ta	%icc,	0x7
	movre	%l2,	%l4,	%i0
	andn	%g5,	%g3,	%g4
	movrne	%g6,	%i5,	%i1
	smul	%l1,	%o2,	%o4
	bg,pn	%xcc,	loop_919
	ldsw	[%l7 + 0x44],	%i7
	xor	%i3,	%o0,	%g1
	call	loop_920
loop_919:
	udivcc	%o3,	0x1DD2,	%o6
	umulcc	%i4,	%l3,	%l6
	fmovdcs	%xcc,	%f24,	%f27
loop_920:
	andcc	%o7,	0x1E12,	%i2
	te	%icc,	0x5
	tvc	%icc,	0x0
	fmovspos	%xcc,	%f14,	%f21
	nop
	fitos	%f0,	%f9
	fstox	%f9,	%f30
	fxtos	%f30,	%f15
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f2
	tneg	%xcc,	0x4
	ldd	[%l7 + 0x50],	%l4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o1
	smulcc	%l0,	%g7,	%o5
	move	%xcc,	%g2,	%l2
	prefetch	[%l7 + 0x28],	 0x3
	fones	%f0
	xnor	%l4,	%i0,	%g5
	bneg,a,pt	%icc,	loop_921
	edge16	%i6,	%g4,	%g3
	tcc	%xcc,	0x0
	mova	%xcc,	%g6,	%i5
loop_921:
	movl	%xcc,	%l1,	%i1
	smulcc	%o2,	0x1773,	%i7
	bgu,a,pn	%icc,	loop_922
	fmovsgu	%xcc,	%f5,	%f15
	tge	%xcc,	0x7
	set	0x60, %g7
	lduba	[%l7 + %g7] 0x80,	%i3
loop_922:
	taddcc	%o4,	%o0,	%g1
	sub	%o3,	0x1FC4,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	smulcc	%o7,	0x198B,	%i2
	umul	%l5,	0x126C,	%o1
	tcs	%xcc,	0x1
	bneg,pn	%xcc,	loop_923
	movle	%icc,	%l6,	%g7
	brlz,a	%o5,	loop_924
	xnorcc	%l0,	%g2,	%l4
loop_923:
	nop
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x19,	%f16
loop_924:
	movneg	%icc,	%i0,	%g5
	membar	0x1A
	stx	%l2,	[%l7 + 0x10]
	tcs	%xcc,	0x6
	edge32l	%g4,	%i6,	%g6
	edge32n	%i5,	%g3,	%i1
	movne	%xcc,	%o2,	%i7
	tsubcc	%i3,	%l1,	%o0
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	for	%f30,	%f18,	%f24
	fnegs	%f25,	%f18
	movg	%icc,	%o4,	%o3
	set	0x5C, %l4
	stha	%i4,	[%l7 + %l4] 0x2b
	membar	#Sync
	edge32n	%l3,	%o6,	%o7
	add	%i2,	0x08AE,	%o1
	flush	%l7 + 0x70
	smulcc	%l6,	0x0B20,	%g7
	xnorcc	%l5,	0x1DC4,	%l0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x60] %asi,	%o5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%l4
	udivx	%i0,	0x06BC,	%g5
	mova	%xcc,	%l2,	%g4
	taddcctv	%g2,	0x1B21,	%g6
	fxnors	%f3,	%f19,	%f29
	tl	%xcc,	0x4
	fmovsge	%icc,	%f21,	%f23
	udivx	%i6,	0x195F,	%g3
	movvc	%icc,	%i5,	%i1
	addcc	%i7,	0x15F3,	%o2
	tcc	%xcc,	0x1
	tgu	%icc,	0x5
	movl	%icc,	%l1,	%o0
	edge32ln	%g1,	%i3,	%o3
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	udivx	%o4,	0x05EC,	%l3
	move	%icc,	%o6,	%i4
	xor	%i2,	%o7,	%l6
	movrgz	%o1,	%g7,	%l0
	fmovdne	%xcc,	%f1,	%f28
	edge32n	%l5,	%l4,	%o5
	fmuld8ulx16	%f12,	%f11,	%f6
	tle	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g5,	0x0BDA,	%l2
	bn,a	%icc,	loop_925
	nop
	setx	0x4D902B2B7889B035,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x19D9124F1F187342,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f22,	%f14
	edge8n	%i0,	%g2,	%g6
	pdist	%f18,	%f18,	%f22
loop_925:
	orncc	%g4,	%i6,	%i5
	sethi	0x1EE6,	%i1
	mulscc	%g3,	%i7,	%o2
	movrlez	%l1,	%g1,	%i3
	movrne	%o0,	0x068,	%o4
	fmovdle	%icc,	%f25,	%f7
	srax	%o3,	%o6,	%i4
	tle	%icc,	0x1
	bne	%icc,	loop_926
	nop
	setx	0x7789A1815C78F00A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0B880717DE9C8C4C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f24,	%f10
	tvs	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_926:
	edge8l	%l3,	%o7,	%l6
	sll	%o1,	0x17,	%g7
	edge8l	%l0,	%l5,	%l4
	set	0x6E, %o5
	ldsba	[%l7 + %o5] 0x89,	%o5
	edge32	%g5,	%i2,	%l2
	tneg	%xcc,	0x7
	fabsd	%f8,	%f24
	fmovda	%icc,	%f16,	%f9
	bpos,a,pt	%xcc,	loop_927
	fbug,a	%fcc2,	loop_928
	tne	%icc,	0x0
	fmovsvc	%icc,	%f28,	%f4
loop_927:
	tne	%icc,	0x4
loop_928:
	fxors	%f21,	%f20,	%f7
	array16	%g2,	%g6,	%g4
	edge8n	%i0,	%i6,	%i5
	or	%i1,	0x039B,	%g3
	ta	%xcc,	0x3
	alignaddrl	%i7,	%l1,	%o2
	fcmpeq32	%f30,	%f22,	%i3
	swap	[%l7 + 0x70],	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o4,	%o3,	%o6
	te	%icc,	0x5
	fmovdvc	%icc,	%f23,	%f20
	fmovsg	%icc,	%f21,	%f28
	orcc	%i4,	0x0148,	%o0
	edge16	%o7,	%l6,	%o1
	movge	%xcc,	%l3,	%l0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x0E] %asi,	%g7
	taddcc	%l5,	%l4,	%g5
	movpos	%xcc,	%i2,	%l2
	movvc	%icc,	%o5,	%g6
	and	%g2,	%i0,	%g4
	fnegs	%f29,	%f17
	fnot2s	%f26,	%f17
	subc	%i6,	%i1,	%i5
	bne	loop_929
	stw	%i7,	[%l7 + 0x48]
	edge8l	%l1,	%o2,	%g3
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_929:
	membar	0x78
	sll	%i3,	%o4,	%o3
	brgez,a	%o6,	loop_930
	edge16l	%i4,	%g1,	%o0
	edge8ln	%o7,	%l6,	%l3
	sra	%o1,	%g7,	%l5
loop_930:
	umulcc	%l4,	%l0,	%g5
	edge16ln	%l2,	%i2,	%g6
	array8	%o5,	%i0,	%g2
	tsubcc	%i6,	%i1,	%i5
	sllx	%i7,	%l1,	%g4
	xnor	%g3,	0x04A3,	%i3
	nop
	fitos	%f9,	%f10
	fstod	%f10,	%f12
	bge,a	%icc,	loop_931
	orcc	%o4,	%o3,	%o2
	wr	%g0,	0x88,	%asi
	stwa	%i4,	[%l7 + 0x2C] %asi
loop_931:
	tn	%xcc,	0x3
	sir	0x1F11
	ldsw	[%l7 + 0x6C],	%o6
	nop
	setx	loop_932,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%g1,	%o7
	fabsd	%f6,	%f26
	fmovdpos	%icc,	%f21,	%f0
loop_932:
	sdivx	%l6,	0x180F,	%o0
	te	%icc,	0x3
	fornot1s	%f28,	%f11,	%f1
	bl,pn	%icc,	loop_933
	fnot2s	%f2,	%f22
	edge8n	%o1,	%g7,	%l5
	nop
	setx	loop_934,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_933:
	stb	%l4,	[%l7 + 0x2D]
	xnor	%l0,	%g5,	%l2
	ta	%icc,	0x2
loop_934:
	bn	loop_935
	sll	%l3,	0x0E,	%g6
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x10,	 0x1
loop_935:
	fmovdg	%icc,	%f14,	%f8
	tl	%xcc,	0x5
	set	0x2C, %i4
	ldsha	[%l7 + %i4] 0x19,	%i0
	pdist	%f16,	%f16,	%f26
	nop
	setx	0x6091F533,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xC4DBA6F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f27,	%f13
	movvc	%xcc,	%i2,	%i6
	movle	%xcc,	%i1,	%i5
	edge32	%i7,	%l1,	%g4
	membar	0x62
	fblg	%fcc3,	loop_936
	alignaddr	%g2,	%g3,	%i3
	udiv	%o3,	0x1C05,	%o4
	movleu	%xcc,	%i4,	%o2
loop_936:
	movle	%xcc,	%o6,	%g1
	brnz,a	%l6,	loop_937
	fpack16	%f26,	%f16
	fandnot1	%f30,	%f0,	%f30
	udiv	%o7,	0x1B9F,	%o0
loop_937:
	movvc	%xcc,	%g7,	%l5
	membar	0x43
	sdivx	%o1,	0x0BB3,	%l0
	xnor	%l4,	%g5,	%l2
	fmovdpos	%icc,	%f24,	%f24
	udivcc	%l3,	0x1313,	%g6
	smul	%i0,	0x1EE8,	%i2
	udivcc	%i6,	0x183E,	%i1
	fcmple16	%f16,	%f30,	%o5
	nop
	setx	0xFA2E01110FA60B13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x38F9189239DE8F60,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f18,	%f8
	alignaddrl	%i5,	%l1,	%i7
	alignaddrl	%g4,	%g3,	%i3
	udiv	%o3,	0x01C4,	%o4
	addc	%g2,	0x0F41,	%o2
	bl	loop_938
	edge16l	%i4,	%g1,	%o6
	movpos	%icc,	%l6,	%o0
	movvs	%icc,	%g7,	%l5
loop_938:
	brlez	%o1,	loop_939
	subc	%o7,	%l4,	%g5
	fmovdle	%xcc,	%f16,	%f17
	fmovsl	%xcc,	%f6,	%f28
loop_939:
	fxor	%f0,	%f12,	%f16
	nop
	setx	loop_940,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsh	[%l7 + 0x72],	%l2
	nop
	setx loop_941, %l0, %l1
	jmpl %l1, %l3
	fmul8x16au	%f8,	%f30,	%f0
loop_940:
	array16	%l0,	%i0,	%i2
	set	0x34, %l0
	sta	%f8,	[%l7 + %l0] 0x04
loop_941:
	movl	%xcc,	%g6,	%i1
	popc	%o5,	%i5
	ld	[%l7 + 0x08],	%f9
	fmovrdlez	%i6,	%f22,	%f16
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x11
	edge32	%l1,	%i7,	%g4
	fcmple32	%f12,	%f6,	%i3
	taddcctv	%g3,	0x0E33,	%o4
	ba	loop_942
	movcc	%icc,	%o3,	%g2
	nop
	setx loop_943, %l0, %l1
	jmpl %l1, %i4
	ldstub	[%l7 + 0x26],	%o2
loop_942:
	nop
	set	0x08, %l5
	ldxa	[%l7 + %l5] 0x18,	%g1
loop_943:
	movcc	%xcc,	%l6,	%o0
	set	0x66, %g6
	lduba	[%l7 + %g6] 0x11,	%g7
	swap	[%l7 + 0x10],	%o6
	bcc	loop_944
	bvs,a	loop_945
	fmovse	%icc,	%f31,	%f14
	tvs	%icc,	0x4
loop_944:
	fbul	%fcc1,	loop_946
loop_945:
	orncc	%l5,	%o1,	%o7
	tsubcc	%l4,	%g5,	%l3
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x16
	membar	#Sync
loop_946:
	movgu	%icc,	%l2,	%i0
	be,pt	%icc,	loop_947
	alignaddrl	%l0,	%g6,	%i1
	ld	[%l7 + 0x54],	%f18
	fpack16	%f6,	%f5
loop_947:
	fornot2	%f26,	%f12,	%f26
	edge16ln	%i2,	%i5,	%o5
	movrgez	%i6,	%l1,	%i7
	addc	%g4,	%i3,	%g3
	udiv	%o4,	0x18C2,	%o3
	tle	%xcc,	0x3
	tsubcc	%g2,	%o2,	%i4
	sll	%g1,	0x1B,	%o0
	fbul	%fcc2,	loop_948
	fmovdn	%icc,	%f24,	%f6
	movge	%icc,	%g7,	%l6
	fbul	%fcc3,	loop_949
loop_948:
	fble	%fcc0,	loop_950
	bl,a	%xcc,	loop_951
	umulcc	%o6,	0x1837,	%l5
loop_949:
	tn	%xcc,	0x6
loop_950:
	fmul8x16al	%f17,	%f8,	%f12
loop_951:
	movrgez	%o7,	0x34B,	%o1
	ldd	[%l7 + 0x10],	%g4
	srl	%l3,	%l4,	%i0
	srax	%l0,	0x1D,	%l2
	fmul8x16al	%f1,	%f16,	%f8
	udivcc	%i1,	0x14C2,	%g6
	sdiv	%i2,	0x0AF1,	%i5
	movg	%icc,	%i6,	%o5
	nop
	setx	0x20B71F7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xC9FB4A0F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f31,	%f24
	udivcc	%l1,	0x096D,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f4,	[%l7 + 0x20]
	sll	%i3,	%g3,	%i7
	tl	%xcc,	0x4
	subc	%o4,	0x13B9,	%o3
	andcc	%g2,	0x0076,	%i4
	tcs	%xcc,	0x6
	fbul,a	%fcc0,	loop_952
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1452,	%o2
	edge32l	%o0,	%g1,	%l6
loop_952:
	fmovrdlez	%o6,	%f2,	%f30
	stw	%l5,	[%l7 + 0x20]
	fnot1	%f30,	%f16
	tleu	%xcc,	0x6
	xnorcc	%o7,	0x16C9,	%g7
	andcc	%g5,	%o1,	%l3
	movvs	%xcc,	%i0,	%l0
	taddcc	%l2,	%l4,	%i1
	tvs	%xcc,	0x7
	sth	%g6,	[%l7 + 0x52]
	fcmple16	%f30,	%f26,	%i5
	fnegd	%f26,	%f12
	fpmerge	%f7,	%f6,	%f30
	set	0x6C, %i0
	lduha	[%l7 + %i0] 0x0c,	%i6
	brnz	%i2,	loop_953
	array32	%l1,	%o5,	%g4
	movrlz	%i3,	0x18F,	%i7
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%g3
loop_953:
	srlx	%o3,	0x0A,	%o4
	sllx	%g2,	%o2,	%i4
	fbu	%fcc3,	loop_954
	addc	%o0,	0x0038,	%g1
	movn	%xcc,	%l6,	%o6
	fbuge,a	%fcc2,	loop_955
loop_954:
	fmovdge	%icc,	%f16,	%f13
	movl	%icc,	%l5,	%g7
	movre	%g5,	%o1,	%o7
loop_955:
	lduw	[%l7 + 0x74],	%i0
	fbne	%fcc1,	loop_956
	movrgz	%l3,	%l0,	%l4
	udivcc	%i1,	0x1F04,	%g6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%i6
loop_956:
	bneg	%xcc,	loop_957
	bge,a,pn	%icc,	loop_958
	fnegs	%f29,	%f0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i5,	%l1
loop_957:
	fmovrde	%i2,	%f18,	%f14
loop_958:
	add	%g4,	%o5,	%i7
	fbge	%fcc2,	loop_959
	addc	%g3,	%i3,	%o4
	fmovdvc	%xcc,	%f24,	%f0
	fxnor	%f20,	%f6,	%f6
loop_959:
	fmovdneg	%icc,	%f25,	%f7
	fbne	%fcc0,	loop_960
	movrgez	%o3,	%o2,	%g2
	movge	%xcc,	%o0,	%i4
	udivcc	%g1,	0x16AB,	%l6
loop_960:
	fmovrsgez	%o6,	%f16,	%f7
	tpos	%xcc,	0x5
	brgez,a	%l5,	loop_961
	tvc	%xcc,	0x4
	fnot2	%f26,	%f30
	fands	%f9,	%f13,	%f7
loop_961:
	tle	%icc,	0x6
	edge32ln	%g7,	%o1,	%g5
	movge	%icc,	%i0,	%o7
	set	0x28, %i2
	stwa	%l0,	[%l7 + %i2] 0x2b
	membar	#Sync
	fmovrdlz	%l3,	%f10,	%f28
	subc	%i1,	%g6,	%l2
	sdiv	%l4,	0x0EDA,	%i5
	addcc	%l1,	0x1287,	%i2
	tge	%icc,	0x1
	mulscc	%i6,	%o5,	%g4
	andncc	%g3,	%i7,	%i3
	xnor	%o4,	0x1DF9,	%o3
	move	%icc,	%g2,	%o2
	call	loop_962
	tpos	%xcc,	0x3
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%f4
	alignaddr	%i4,	%o0,	%l6
loop_962:
	udivx	%o6,	0x09D1,	%g1
	fmovscs	%xcc,	%f28,	%f7
	brnz	%g7,	loop_963
	bneg,a,pt	%icc,	loop_964
	movre	%l5,	0x1D0,	%g5
	array32	%o1,	%i0,	%l0
loop_963:
	fmovdvs	%xcc,	%f31,	%f29
loop_964:
	bleu	loop_965
	sir	0x1E53
	nop
	fitos	%f5,	%f6
	fstoi	%f6,	%f15
	mulx	%l3,	0x03C6,	%i1
loop_965:
	sdivcc	%o7,	0x0139,	%g6
	edge8l	%l4,	%i5,	%l2
	tcs	%xcc,	0x1
	fmovrse	%i2,	%f23,	%f21
	tle	%xcc,	0x6
	fsrc1s	%f13,	%f7
	subcc	%l1,	0x192A,	%o5
	set	0x28, %o4
	stxa	%g4,	[%l7 + %o4] 0x23
	membar	#Sync
	fmul8x16al	%f11,	%f28,	%f14
	tne	%xcc,	0x5
	array32	%i6,	%g3,	%i3
	edge32n	%i7,	%o3,	%o4
	fmul8x16	%f23,	%f26,	%f30
	set	0x14, %l1
	stwa	%o2,	[%l7 + %l1] 0x18
	fmovda	%xcc,	%f30,	%f2
	fbule	%fcc3,	loop_966
	movpos	%icc,	%g2,	%i4
	orncc	%l6,	%o0,	%g1
	fbue	%fcc1,	loop_967
loop_966:
	ta	%xcc,	0x4
	andn	%o6,	0x0BCB,	%g7
	edge16	%l5,	%g5,	%i0
loop_967:
	subc	%o1,	%l0,	%i1
	edge8ln	%o7,	%g6,	%l4
	movl	%xcc,	%l3,	%i5
	set	0x54, %i7
	lduha	[%l7 + %i7] 0x88,	%i2
	ldd	[%l7 + 0x70],	%l0
	addcc	%o5,	%l2,	%g4
	membar	0x24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	%xcc,	loop_968
	addcc	%g3,	%i6,	%i3
	tvs	%xcc,	0x6
	fmovdne	%xcc,	%f29,	%f27
loop_968:
	swap	[%l7 + 0x18],	%o3
	movvs	%icc,	%i7,	%o2
	brgz,a	%o4,	loop_969
	nop
	setx	0xDC3437A5DF0ECA3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x6B92AD6DCBDB63AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f0,	%f10
	bne,a,pt	%icc,	loop_970
	udivx	%i4,	0x1DED,	%l6
loop_969:
	fmovsa	%icc,	%f5,	%f0
	fmovsn	%xcc,	%f7,	%f1
loop_970:
	movcc	%icc,	%g2,	%o0
	taddcc	%g1,	%o6,	%g7
	mulx	%l5,	%i0,	%o1
	ldd	[%l7 + 0x70],	%g4
	fmovsvs	%xcc,	%f25,	%f4
	brgez	%l0,	loop_971
	nop
	fitos	%f11,	%f11
	array8	%i1,	%o7,	%l4
	bvs	%xcc,	loop_972
loop_971:
	fxnor	%f22,	%f28,	%f24
	wr	%g0,	0x11,	%asi
	sta	%f17,	[%l7 + 0x6C] %asi
loop_972:
	mulx	%g6,	0x1054,	%l3
	nop
	fitos	%f3,	%f23
	fstod	%f23,	%f28
	movn	%icc,	%i2,	%i5
	umul	%o5,	0x09C6,	%l1
	movg	%xcc,	%g4,	%l2
	fbn	%fcc1,	loop_973
	movvc	%xcc,	%i6,	%i3
	nop
	setx loop_974, %l0, %l1
	jmpl %l1, %o3
	fmovspos	%icc,	%f14,	%f13
loop_973:
	brz,a	%g3,	loop_975
	tl	%xcc,	0x5
loop_974:
	fmovda	%xcc,	%f1,	%f29
	umulcc	%i7,	0x030B,	%o2
loop_975:
	array32	%i4,	%o4,	%l6
	orcc	%o0,	0x0C94,	%g2
	movge	%icc,	%o6,	%g1
	prefetch	[%l7 + 0x48],	 0x3
	move	%xcc,	%g7,	%l5
	tsubcctv	%i0,	0x153A,	%o1
	fmovscc	%icc,	%f15,	%f13
	tvc	%icc,	0x2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x18
	array8	%l0,	%i1,	%g5
	bge,pt	%xcc,	loop_976
	fmovd	%f2,	%f12
	srl	%o7,	%l4,	%l3
	wr	%g0,	0x2a,	%asi
	stba	%i2,	[%l7 + 0x37] %asi
	membar	#Sync
loop_976:
	xorcc	%i5,	0x13B6,	%g6
	xnor	%l1,	%g4,	%o5
	xor	%i6,	0x1087,	%l2
	fbg,a	%fcc2,	loop_977
	fsrc1	%f18,	%f2
	movcs	%icc,	%o3,	%i3
	fmovrsne	%i7,	%f18,	%f27
loop_977:
	nop
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x2b,	%g2
	tsubcc	%o2,	0x16CE,	%i4
	tne	%icc,	0x7
	fmovrdgez	%o4,	%f22,	%f28
	tsubcctv	%o0,	%g2,	%o6
	orncc	%g1,	0x140C,	%g7
	sub	%l5,	%l6,	%o1
	movrgez	%i0,	0x2F8,	%l0
	array32	%i1,	%g5,	%l4
	fmul8sux16	%f8,	%f24,	%f8
	tle	%icc,	0x7
	be,a	%icc,	loop_978
	fbge,a	%fcc3,	loop_979
	taddcc	%o7,	0x1CA5,	%l3
	umul	%i5,	0x1D63,	%i2
loop_978:
	edge8	%l1,	%g6,	%g4
loop_979:
	fxnors	%f18,	%f10,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o5,	0x0521,	%l2
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o3
	flush	%l7 + 0x78
	fandnot2	%f26,	%f10,	%f18
	xorcc	%i3,	%g3,	%o2
	edge16	%i7,	%i4,	%o4
	andcc	%o0,	%o6,	%g1
	edge32n	%g2,	%g7,	%l5
	udivx	%o1,	0x1D1D,	%i0
	andncc	%l0,	%l6,	%g5
	tle	%xcc,	0x6
	movrgez	%l4,	%i1,	%o7
	umulcc	%i5,	%i2,	%l1
	std	%f12,	[%l7 + 0x78]
	smulcc	%l3,	0x01F5,	%g6
	tvs	%xcc,	0x5
	nop
	setx	0xFA3FB158,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xB0E4F384,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f9,	%f6
	brz	%o5,	loop_980
	tge	%icc,	0x7
	array16	%g4,	%l2,	%i6
	edge16l	%o3,	%g3,	%o2
loop_980:
	alignaddr	%i3,	%i4,	%o4
	nop
	setx	0x0980302B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x997A0DC4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f14,	%f0
	udiv	%o0,	0x07CD,	%i7
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f20
	nop
	setx	0x273CF4649072D2A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	srlx	%o6,	%g2,	%g7
	movne	%icc,	%l5,	%g1
	movn	%icc,	%o1,	%l0
	fbule,a	%fcc0,	loop_981
	tcs	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
loop_981:
	brz,a	%l6,	loop_982
	movleu	%icc,	%l4,	%g5
	bshuffle	%f14,	%f16,	%f4
	and	%i1,	%o7,	%i5
loop_982:
	xnor	%i2,	0x1B26,	%l1
	movcc	%icc,	%g6,	%l3
	prefetch	[%l7 + 0x78],	 0x1
	addcc	%g4,	0x1960,	%l2
	srax	%o5,	0x15,	%i6
	prefetch	[%l7 + 0x44],	 0x1
	tcs	%xcc,	0x3
	fmovdn	%xcc,	%f5,	%f24
	bcc,a,pt	%xcc,	loop_983
	fones	%f0
	bcs,a	loop_984
	addccc	%o3,	0x0194,	%o2
loop_983:
	sethi	0x04F6,	%i3
	edge32	%i4,	%g3,	%o0
loop_984:
	tleu	%xcc,	0x4
	edge16l	%o4,	%i7,	%o6
	fbuge,a	%fcc0,	loop_985
	smul	%g7,	%g2,	%l5
	srlx	%o1,	%g1,	%i0
	te	%xcc,	0x2
loop_985:
	fbuge	%fcc3,	loop_986
	nop
	fitos	%f9,	%f14
	fstoi	%f14,	%f19
	fandnot1	%f24,	%f0,	%f20
	add	%l6,	0x1352,	%l0
loop_986:
	movleu	%xcc,	%g5,	%i1
	orncc	%l4,	%o7,	%i2
	fbo,a	%fcc1,	loop_987
	fmovrslez	%l1,	%f13,	%f13
	xor	%i5,	0x1EB6,	%g6
	popc	%l3,	%l2
loop_987:
	fcmpgt16	%f20,	%f30,	%o5
	smulcc	%g4,	%i6,	%o2
	array8	%o3,	%i3,	%g3
	te	%icc,	0x4
	add	%o0,	0x0D10,	%o4
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f12
	fxtos	%f12,	%f12
	andncc	%i4,	%i7,	%o6
	orncc	%g2,	0x1F27,	%g7
	ldub	[%l7 + 0x17],	%l5
	ldd	[%l7 + 0x18],	%f28
	move	%xcc,	%o1,	%i0
	fexpand	%f2,	%f12
	brlz	%g1,	loop_988
	prefetch	[%l7 + 0x54],	 0x2
	fxnors	%f16,	%f17,	%f17
	nop
	fitod	%f4,	%f2
loop_988:
	mulscc	%l0,	%l6,	%g5
	nop
	fitos	%f1,	%f24
	fstod	%f24,	%f22
	movpos	%icc,	%i1,	%o7
	alignaddr	%i2,	%l4,	%i5
	orncc	%g6,	%l1,	%l3
	sub	%l2,	0x1CBE,	%g4
	movg	%xcc,	%i6,	%o5
	fbule,a	%fcc0,	loop_989
	movl	%xcc,	%o3,	%o2
	stw	%i3,	[%l7 + 0x54]
	edge32l	%g3,	%o4,	%o0
loop_989:
	ldub	[%l7 + 0x1B],	%i7
	membar	0x79
	sdivx	%i4,	0x073C,	%o6
	movcc	%icc,	%g2,	%g7
	movvs	%xcc,	%l5,	%i0
	movrgez	%g1,	0x355,	%l0
	fors	%f17,	%f25,	%f26
	fbue	%fcc2,	loop_990
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l6,	%g5,	%o1
	movrlz	%i1,	%i2,	%o7
loop_990:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%i5
	tgu	%icc,	0x2
	bg,pt	%xcc,	loop_991
	movleu	%icc,	%g6,	%l3
	movrgz	%l2,	0x13A,	%g4
	fands	%f16,	%f11,	%f30
loop_991:
	addccc	%l1,	%i6,	%o5
	movrgez	%o2,	%i3,	%o3
	fmovsleu	%xcc,	%f10,	%f7
	tvc	%xcc,	0x1
	fmovsvc	%xcc,	%f21,	%f31
	fbne	%fcc1,	loop_992
	sllx	%g3,	0x04,	%o0
	nop
	setx	0xE354BC1C97D9F307,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3B739F4EA0FF3E42,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f14,	%f24
	tsubcctv	%i7,	0x0294,	%o4
loop_992:
	nop
	setx	0xC074134A,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	membar	0x29
	fmovdcs	%xcc,	%f0,	%f22
	udivcc	%o6,	0x0F20,	%g2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i4
	movrne	%l5,	0x34F,	%i0
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x15,	 0x0
	movcs	%icc,	%g1,	%l6
	and	%g5,	%l0,	%i1
	fmovdcs	%xcc,	%f6,	%f30
	fmovdvc	%xcc,	%f24,	%f16
	fsrc2s	%f25,	%f22
	fmovscs	%icc,	%f6,	%f29
	nop
	setx	0x7E8668A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xDF329528,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f11,	%f25
	smul	%i2,	0x0F21,	%o7
	fzero	%f28
	sethi	0x1FC5,	%l4
	xorcc	%i5,	0x011B,	%o1
	movg	%xcc,	%l3,	%g6
	ldx	[%l7 + 0x48],	%l2
	fands	%f26,	%f23,	%f31
	mova	%xcc,	%l1,	%i6
	fpadd32	%f16,	%f0,	%f18
	set	0x10, %g2
	swapa	[%l7 + %g2] 0x81,	%o5
	movne	%icc,	%g4,	%i3
	taddcctv	%o3,	%g3,	%o0
	edge16ln	%i7,	%o2,	%o6
	brlz,a	%g2,	loop_993
	movgu	%xcc,	%i4,	%o4
	flush	%l7 + 0x14
	smul	%i0,	%l5,	%g1
loop_993:
	movre	%g7,	%l6,	%l0
	movre	%g5,	0x26C,	%i1
	movl	%icc,	%o7,	%i2
	movrne	%l4,	%i5,	%l3
	fbge,a	%fcc1,	loop_994
	udivcc	%g6,	0x02B4,	%o1
	fcmple32	%f12,	%f14,	%l1
	tcs	%xcc,	0x0
loop_994:
	srlx	%i6,	0x13,	%o5
	sth	%l2,	[%l7 + 0x0C]
	movge	%icc,	%g4,	%i3
	fandnot2	%f26,	%f2,	%f18
	tcs	%xcc,	0x7
	fmovrdlz	%g3,	%f16,	%f4
	edge16n	%o3,	%i7,	%o0
	xor	%o2,	%o6,	%g2
	alignaddr	%i4,	%o4,	%l5
	movleu	%xcc,	%i0,	%g1
	xorcc	%l6,	0x15BF,	%l0
	sllx	%g5,	0x07,	%g7
	array8	%i1,	%o7,	%l4
	fcmpne32	%f14,	%f8,	%i2
	tsubcc	%l3,	%i5,	%g6
	sra	%l1,	0x1B,	%i6
	mova	%xcc,	%o1,	%l2
	xorcc	%g4,	0x1A07,	%o5
	bn,a	%icc,	loop_995
	sdivcc	%g3,	0x110E,	%o3
	fmovdl	%icc,	%f25,	%f10
	stbar
loop_995:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i7,	%i3
	edge8	%o2,	%o6,	%g2
	fblg	%fcc0,	loop_996
	array16	%o0,	%o4,	%l5
	fnegs	%f5,	%f7
	movge	%icc,	%i4,	%g1
loop_996:
	fcmple16	%f4,	%f6,	%l6
	set	0x32, %i3
	ldsha	[%l7 + %i3] 0x18,	%l0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x10,	%g5,	%g7
	fbu,a	%fcc2,	loop_997
	movge	%xcc,	%i1,	%o7
	fcmple16	%f26,	%f30,	%l4
	fmovdpos	%icc,	%f5,	%f3
loop_997:
	bvc,a	loop_998
	edge16	%i2,	%i0,	%l3
	fpackfix	%f28,	%f18
	fmovrse	%g6,	%f10,	%f1
loop_998:
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f16
	edge16n	%i5,	%i6,	%l1
	sdiv	%o1,	0x0AE3,	%g4
	fmovdpos	%xcc,	%f20,	%f0
	smulcc	%l2,	%g3,	%o3
	fbg,a	%fcc1,	loop_999
	xnorcc	%i7,	%o5,	%i3
	std	%f4,	[%l7 + 0x38]
	brz	%o2,	loop_1000
loop_999:
	ta	%xcc,	0x2
	addc	%o6,	0x0C58,	%g2
	tsubcctv	%o4,	%o0,	%i4
loop_1000:
	sdiv	%l5,	0x025B,	%g1
	addccc	%l6,	%g5,	%l0
	tg	%icc,	0x1
	nop
	setx loop_1001, %l0, %l1
	jmpl %l1, %g7
	movre	%o7,	%i1,	%l4
	fmovscc	%icc,	%f7,	%f27
	sethi	0x0387,	%i0
loop_1001:
	andncc	%l3,	%g6,	%i2
	bgu,pt	%icc,	loop_1002
	taddcc	%i5,	%l1,	%o1
	smul	%i6,	%l2,	%g4
	umul	%o3,	%i7,	%g3
loop_1002:
	movrgez	%i3,	%o2,	%o5
	smul	%g2,	0x0C56,	%o6
	subccc	%o0,	0x1D9D,	%i4
	andcc	%l5,	%g1,	%o4
	ldsh	[%l7 + 0x22],	%g5
	fcmpgt32	%f26,	%f22,	%l6
	stw	%g7,	[%l7 + 0x14]
	movrlez	%o7,	%l0,	%i1
	xorcc	%i0,	0x03A1,	%l3
	alignaddrl	%l4,	%i2,	%i5
	fbul,a	%fcc3,	loop_1003
	tpos	%icc,	0x3
	ldstub	[%l7 + 0x52],	%l1
	brlez,a	%o1,	loop_1004
loop_1003:
	tgu	%xcc,	0x1
	set	0x1B, %o0
	ldsba	[%l7 + %o0] 0x14,	%i6
loop_1004:
	prefetch	[%l7 + 0x40],	 0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%l2,	%f22,	%f24
	movl	%xcc,	%g6,	%g4
	fbug	%fcc2,	loop_1005
	nop
	setx	0x304EC5D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	srax	%i7,	%o3,	%i3
	addcc	%g3,	0x0197,	%o2
loop_1005:
	alignaddr	%o5,	%o6,	%g2
	fmovse	%xcc,	%f31,	%f0
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvs	%icc,	0x0
	tg	%xcc,	0x7
	lduh	[%l7 + 0x68],	%o0
	nop
	setx	0x186245D95FED4961,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA7768C6E5BAB4E8F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f14,	%f2
	tsubcctv	%l5,	%i4,	%g1
	tvc	%icc,	0x1
	mulx	%g5,	%o4,	%g7
	udivcc	%o7,	0x0F90,	%l0
	alignaddrl	%i1,	%i0,	%l3
	srl	%l6,	0x13,	%i2
	be,pt	%icc,	loop_1006
	srlx	%i5,	%l4,	%l1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%l2
loop_1006:
	xorcc	%g6,	0x139B,	%i6
	stw	%i7,	[%l7 + 0x50]
	movl	%xcc,	%g4,	%o3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x08] %asi,	%f19
	fandnot2s	%f15,	%f25,	%f5
	fmovrdgz	%i3,	%f26,	%f20
	mulx	%g3,	0x1B27,	%o5
	set	0x70, %o2
	lda	[%l7 + %o2] 0x89,	%f30
	fbe,a	%fcc2,	loop_1007
	nop
	setx	loop_1008,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bneg	%icc,	loop_1009
	or	%o2,	%g2,	%o0
loop_1007:
	udivx	%l5,	0x0B68,	%i4
loop_1008:
	mova	%icc,	%o6,	%g5
loop_1009:
	st	%f23,	[%l7 + 0x1C]
	ldx	[%l7 + 0x10],	%g1
	sir	0x1035
	movne	%icc,	%o4,	%g7
	tne	%xcc,	0x1
	fmul8x16al	%f14,	%f29,	%f24
	edge16ln	%l0,	%o7,	%i0
	bvs	loop_1010
	array8	%i1,	%l3,	%l6
	movgu	%icc,	%i5,	%i2
	alignaddr	%l1,	%o1,	%l4
loop_1010:
	bleu,pn	%icc,	loop_1011
	fnot1s	%f13,	%f7
	nop
	setx	loop_1012,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%g6,	0x194D,	%i6
loop_1011:
	mulscc	%i7,	%l2,	%g4
	srl	%i3,	%g3,	%o5
loop_1012:
	movne	%xcc,	%o3,	%o2
	fbul,a	%fcc0,	loop_1013
	ldx	[%l7 + 0x20],	%g2
	bn,a,pn	%icc,	loop_1014
	tneg	%icc,	0x1
loop_1013:
	fornot1s	%f17,	%f21,	%f25
	ta	%icc,	0x6
loop_1014:
	tn	%icc,	0x4
	movre	%l5,	0x2E6,	%o0
	sub	%i4,	0x0A93,	%g5
	movcc	%xcc,	%o6,	%o4
	fbu	%fcc2,	loop_1015
	movrgez	%g1,	%g7,	%o7
	fandnot1s	%f15,	%f28,	%f31
	umulcc	%l0,	%i1,	%l3
loop_1015:
	bneg,pn	%xcc,	loop_1016
	ble	%xcc,	loop_1017
	tle	%xcc,	0x5
	fandnot1	%f22,	%f8,	%f14
loop_1016:
	movneg	%icc,	%i0,	%i5
loop_1017:
	fmovsvs	%icc,	%f12,	%f2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	andncc	%l1,	%o1,	%l4
	mova	%xcc,	%i2,	%g6
	tvc	%xcc,	0x3
	andcc	%i7,	0x0217,	%i6
	fnor	%f10,	%f26,	%f26
	edge8l	%l2,	%i3,	%g4
	fmovspos	%xcc,	%f10,	%f8
	tl	%xcc,	0x2
	wr	%g0,	0x27,	%asi
	stha	%o5,	[%l7 + 0x1E] %asi
	membar	#Sync
	xnor	%g3,	%o3,	%g2
	wr	%g0,	0xeb,	%asi
	stha	%o2,	[%l7 + 0x7A] %asi
	membar	#Sync
	stbar
	array32	%o0,	%l5,	%g5
	movrgz	%o6,	%i4,	%g1
	nop
	fitos	%f3,	%f27
	fstod	%f27,	%f2
	fmovsn	%icc,	%f31,	%f27
	bn,pt	%xcc,	loop_1018
	sub	%g7,	%o4,	%o7
	fcmpne16	%f26,	%f0,	%i1
	edge32ln	%l3,	%i0,	%l0
loop_1018:
	edge32l	%l6,	%l1,	%i5
	xnorcc	%o1,	%l4,	%g6
	taddcc	%i7,	%i2,	%i6
	edge32	%i3,	%l2,	%g4
	movrgez	%o5,	%g3,	%o3
	andn	%o2,	0x1E39,	%g2
	subccc	%o0,	0x0B60,	%l5
	xorcc	%g5,	%i4,	%g1
	movn	%icc,	%g7,	%o6
	brgez	%o7,	loop_1019
	bvs,a,pt	%xcc,	loop_1020
	tneg	%icc,	0x4
	subcc	%i1,	0x0D07,	%l3
loop_1019:
	tle	%xcc,	0x4
loop_1020:
	edge8ln	%o4,	%l0,	%i0
	edge32l	%l6,	%i5,	%o1
	movpos	%icc,	%l4,	%l1
	edge8l	%i7,	%i2,	%i6
	edge16l	%i3,	%g6,	%g4
	subcc	%l2,	0x018A,	%o5
	umul	%g3,	0x1A07,	%o3
	fmovsle	%icc,	%f9,	%f25
	fpmerge	%f6,	%f7,	%f8
	movvc	%xcc,	%o2,	%o0
	bg	%icc,	loop_1021
	flush	%l7 + 0x68
	nop
	set	0x10, %o6
	lduh	[%l7 + %o6],	%g2
	nop
	setx	0x50253934,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xB441A3EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f25,	%f30
loop_1021:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g5,	%i4,	%l5
	bl,pn	%icc,	loop_1022
	movl	%xcc,	%g1,	%o6
	fnors	%f21,	%f30,	%f7
	bvc	loop_1023
loop_1022:
	flush	%l7 + 0x38
	movvc	%xcc,	%o7,	%i1
	fandnot2s	%f10,	%f18,	%f28
loop_1023:
	movrlez	%l3,	%o4,	%l0
	nop
	setx loop_1024, %l0, %l1
	jmpl %l1, %i0
	sdiv	%l6,	0x0FF3,	%g7
	fmovspos	%xcc,	%f0,	%f11
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
loop_1024:
	movge	%xcc,	%l4,	%o1
	movn	%xcc,	%l1,	%i7
	brlez,a	%i6,	loop_1025
	andncc	%i2,	%i3,	%g4
	xnorcc	%l2,	0x0571,	%g6
	addcc	%g3,	0x0964,	%o5
loop_1025:
	nop
	setx	loop_1026,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%o2,	0x0CE6,	%o3
	sth	%g2,	[%l7 + 0x24]
	xor	%o0,	0x0EBC,	%i4
loop_1026:
	add	%l5,	%g1,	%g5
	tvc	%xcc,	0x4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x6C] %asi,	%f19
	subccc	%o6,	0x0B5F,	%i1
	tleu	%icc,	0x4
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x88,	%l3
	mulscc	%o4,	%l0,	%o7
	umulcc	%i0,	0x0452,	%l6
	fnand	%f30,	%f4,	%f28
	fmovsge	%icc,	%f13,	%f19
	fmovsgu	%xcc,	%f9,	%f26
	bleu	loop_1027
	movgu	%icc,	%g7,	%l4
	umulcc	%i5,	%o1,	%l1
	fbne,a	%fcc2,	loop_1028
loop_1027:
	movrgz	%i7,	%i2,	%i6
	set	0x74, %g4
	swapa	[%l7 + %g4] 0x80,	%i3
loop_1028:
	fmovdvc	%xcc,	%f19,	%f7
	tcc	%icc,	0x2
	movn	%xcc,	%g4,	%g6
	andcc	%g3,	%o5,	%l2
	alignaddrl	%o2,	%g2,	%o0
	lduh	[%l7 + 0x28],	%o3
	nop
	fitos	%f29,	%f26
	tsubcctv	%i4,	%l5,	%g5
	nop
	setx	0xFCC8D766,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x5D43E98B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f25,	%f30
	fbuge	%fcc2,	loop_1029
	movrne	%o6,	%i1,	%g1
	orn	%l3,	0x190C,	%l0
	sdiv	%o4,	0x004D,	%i0
loop_1029:
	brgez	%l6,	loop_1030
	sdiv	%g7,	0x1662,	%l4
	bg	%icc,	loop_1031
	udivx	%i5,	0x1222,	%o1
loop_1030:
	fnands	%f14,	%f21,	%f22
	tle	%xcc,	0x1
loop_1031:
	mulx	%l1,	%i7,	%o7
	add	%i6,	0x1DBC,	%i2
	call	loop_1032
	for	%f20,	%f30,	%f28
	andcc	%i3,	%g4,	%g6
	movrne	%g3,	%o5,	%l2
loop_1032:
	fandnot2s	%f9,	%f23,	%f17
	udivx	%g2,	0x192D,	%o2
	bpos,pt	%icc,	loop_1033
	array16	%o0,	%i4,	%o3
	fpackfix	%f4,	%f18
	sdivx	%g5,	0x0773,	%o6
loop_1033:
	or	%l5,	%g1,	%l3
	edge16	%i1,	%l0,	%i0
	tg	%xcc,	0x6
	array8	%l6,	%o4,	%l4
	sll	%i5,	0x15,	%g7
	movrgez	%l1,	%o1,	%o7
	ldsb	[%l7 + 0x7E],	%i6
	smulcc	%i7,	0x1FAF,	%i3
	movleu	%icc,	%i2,	%g6
	membar	0x2E
	mova	%icc,	%g3,	%o5
	fmovrdlz	%g4,	%f8,	%f18
	wr	%g0,	0x04,	%asi
	stba	%l2,	[%l7 + 0x18] %asi
	bvs,a	loop_1034
	movne	%icc,	%g2,	%o0
	fbge	%fcc2,	loop_1035
	fpsub16s	%f20,	%f9,	%f2
loop_1034:
	sdivcc	%i4,	0x116D,	%o2
	alignaddr	%g5,	%o6,	%l5
loop_1035:
	stbar
	be,a	loop_1036
	array32	%g1,	%o3,	%i1
	sub	%l3,	%i0,	%l6
	edge16ln	%l0,	%l4,	%o4
loop_1036:
	taddcctv	%i5,	%l1,	%g7
	stx	%o7,	[%l7 + 0x08]
	fbul,a	%fcc2,	loop_1037
	tpos	%xcc,	0x5
	bleu	%icc,	loop_1038
	orncc	%o1,	%i7,	%i6
loop_1037:
	brnz	%i3,	loop_1039
	edge16ln	%i2,	%g3,	%g6
loop_1038:
	alignaddr	%g4,	%l2,	%o5
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f10
loop_1039:
	edge16n	%o0,	%g2,	%o2
	tn	%icc,	0x6
	edge32	%g5,	%o6,	%i4
	andn	%l5,	%o3,	%i1
	call	loop_1040
	xnor	%g1,	%l3,	%l6
	edge16l	%l0,	%l4,	%o4
	fmul8ulx16	%f6,	%f24,	%f26
loop_1040:
	ldd	[%l7 + 0x18],	%i4
	sllx	%l1,	0x11,	%i0
	movle	%icc,	%g7,	%o1
	fmovrdlz	%o7,	%f24,	%f16
	fbule,a	%fcc2,	loop_1041
	tle	%icc,	0x7
	smul	%i6,	%i7,	%i3
	bcs,pn	%xcc,	loop_1042
loop_1041:
	add	%i2,	%g3,	%g4
	set	0x51, %l6
	stba	%l2,	[%l7 + %l6] 0x19
loop_1042:
	mulscc	%o5,	0x147E,	%g6
	lduw	[%l7 + 0x58],	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f2,	%f14
	fdtoi	%f14,	%f12
	ldd	[%l7 + 0x58],	%g2
	movcc	%icc,	%o2,	%g5
	fpack16	%f12,	%f5
	smul	%o6,	%l5,	%i4
	fmovdpos	%xcc,	%f9,	%f20
	fmovrde	%i1,	%f8,	%f14
	ba	loop_1043
	smul	%o3,	%g1,	%l6
	movleu	%icc,	%l3,	%l4
	fpsub16	%f14,	%f30,	%f2
loop_1043:
	fmovse	%icc,	%f1,	%f20
	movrgz	%l0,	0x2CE,	%i5
	fmovrse	%o4,	%f5,	%f27
	fmovscc	%xcc,	%f25,	%f23
	nop
	setx	0xCC556D316FAD3897,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f14
	bvs,a,pn	%icc,	loop_1044
	bcs,pt	%xcc,	loop_1045
	ldx	[%l7 + 0x58],	%i0
	add	%l1,	%o1,	%g7
loop_1044:
	fmovda	%icc,	%f31,	%f25
loop_1045:
	fmovdle	%icc,	%f5,	%f29
	orncc	%o7,	0x1F55,	%i7
	set	0x20, %o1
	stxa	%i6,	[%l7 + %o1] 0x88
	movneg	%icc,	%i3,	%i2
	mulx	%g3,	%l2,	%g4
	fbule	%fcc3,	loop_1046
	smulcc	%o5,	%o0,	%g6
	fbn,a	%fcc3,	loop_1047
	tgu	%icc,	0x6
loop_1046:
	mulscc	%g2,	0x066E,	%g5
	add	%o6,	0x05F5,	%l5
loop_1047:
	edge16n	%o2,	%i1,	%i4
	nop
	setx loop_1048, %l0, %l1
	jmpl %l1, %o3
	brz	%g1,	loop_1049
	tne	%icc,	0x1
	andcc	%l6,	0x0B98,	%l4
loop_1048:
	edge16	%l3,	%i5,	%o4
loop_1049:
	fbu	%fcc2,	loop_1050
	fmovrslez	%l0,	%f20,	%f25
	xnor	%l1,	%o1,	%i0
	fbul	%fcc0,	loop_1051
loop_1050:
	tl	%xcc,	0x0
	movrgz	%g7,	0x31E,	%i7
	bge,a,pt	%icc,	loop_1052
loop_1051:
	nop
	setx	0x22B5272F204ABD3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fbule	%fcc3,	loop_1053
	fpackfix	%f18,	%f15
loop_1052:
	tne	%icc,	0x4
	edge8l	%i6,	%i3,	%i2
loop_1053:
	fpadd16s	%f11,	%f30,	%f6
	edge32n	%g3,	%l2,	%g4
	xnorcc	%o7,	%o0,	%o5
	fbne,a	%fcc3,	loop_1054
	sllx	%g6,	0x19,	%g2
	tsubcc	%o6,	%g5,	%l5
	movrne	%o2,	%i4,	%i1
loop_1054:
	array16	%g1,	%o3,	%l4
	edge8l	%l3,	%i5,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o4,	%l0
	fmovspos	%xcc,	%f2,	%f31
	bshuffle	%f0,	%f24,	%f22
	movcs	%icc,	%l1,	%i0
	movcc	%xcc,	%g7,	%o1
	fbn	%fcc0,	loop_1055
	bcs,a,pn	%xcc,	loop_1056
	bl,a	loop_1057
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f28
	fxtos	%f28,	%f9
loop_1055:
	movneg	%icc,	%i7,	%i3
loop_1056:
	array8	%i2,	%g3,	%i6
loop_1057:
	movrlez	%g4,	0x1BD,	%o7
	prefetch	[%l7 + 0x3C],	 0x2
	tpos	%icc,	0x3
	tvs	%xcc,	0x1
	fandnot1s	%f7,	%f21,	%f19
	fandnot1s	%f19,	%f27,	%f12
	brlz,a	%l2,	loop_1058
	sdiv	%o0,	0x1ABD,	%g6
	tvs	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1058:
	addc	%g2,	0x0E86,	%o5
	movn	%xcc,	%g5,	%o6
	tpos	%xcc,	0x5
	edge32l	%l5,	%i4,	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x10] %asi,	%i1
	tne	%xcc,	0x5
	fbg	%fcc2,	loop_1059
	fmovsgu	%xcc,	%f8,	%f26
	fmovrsgz	%g1,	%f12,	%f11
	fornot2	%f14,	%f30,	%f8
loop_1059:
	sdivx	%l4,	0x0271,	%o3
	stbar
	array32	%i5,	%l3,	%l6
	sir	0x103E
	xnor	%o4,	%l0,	%i0
	edge8n	%l1,	%o1,	%g7
	ldsb	[%l7 + 0x6A],	%i3
	move	%xcc,	%i7,	%g3
	fmovdvc	%icc,	%f17,	%f7
	fmovde	%icc,	%f27,	%f3
	flush	%l7 + 0x64
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i6
	andn	%i2,	0x1AD9,	%o7
	tgu	%xcc,	0x0
	sra	%l2,	0x0A,	%g4
	movpos	%xcc,	%o0,	%g6
	alignaddr	%o5,	%g2,	%o6
	ldstub	[%l7 + 0x1A],	%g5
	tgu	%xcc,	0x0
	nop
	setx	loop_1060,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsvs	%icc,	%f24,	%f5
	nop
	fitos	%f13,	%f27
	fstox	%f27,	%f0
	fxtos	%f0,	%f21
	set	0x10, %o7
	ldswa	[%l7 + %o7] 0x14,	%l5
loop_1060:
	nop
	wr	%g0,	0x10,	%asi
	stba	%i4,	[%l7 + 0x5C] %asi
	ldd	[%l7 + 0x38],	%o2
	nop
	setx	0xBBC61400A8500E0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x83945D4B0DA36050,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f0,	%f2
	umul	%i1,	%l4,	%g1
	te	%xcc,	0x6
	edge32	%i5,	%l3,	%o3
	set	0x20, %g7
	sta	%f1,	[%l7 + %g7] 0x81
	tle	%icc,	0x5
	bcs	loop_1061
	tleu	%icc,	0x6
	xor	%l6,	0x161A,	%o4
	mova	%icc,	%i0,	%l1
loop_1061:
	tsubcctv	%o1,	%g7,	%i3
	brgz	%l0,	loop_1062
	movpos	%xcc,	%i7,	%g3
	or	%i2,	0x0254,	%o7
	fbg	%fcc1,	loop_1063
loop_1062:
	fsrc1s	%f16,	%f16
	xorcc	%l2,	%g4,	%i6
	move	%icc,	%g6,	%o0
loop_1063:
	bvs,pn	%icc,	loop_1064
	tvc	%icc,	0x5
	sdivcc	%o5,	0x0C7F,	%g2
	xor	%g5,	0x1B6E,	%o6
loop_1064:
	array32	%i4,	%l5,	%o2
	ldub	[%l7 + 0x25],	%i1
	fabss	%f0,	%f13
	umul	%g1,	%l4,	%l3
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x54] %asi,	%i5
	lduw	[%l7 + 0x20],	%o3
	nop
	setx	loop_1065,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x1C30AD5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xA44B4A6B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f27,	%f15
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f30
	tsubcctv	%o4,	0x1E7F,	%i0
loop_1065:
	fmovse	%xcc,	%f26,	%f10
	movvs	%icc,	%l1,	%o1
	stb	%g7,	[%l7 + 0x6B]
	nop
	fitos	%f3,	%f16
	fstod	%f16,	%f30
	add	%i3,	%l0,	%i7
	sll	%l6,	0x03,	%g3
	tvs	%icc,	0x1
	wr	%g0,	0x4f,	%asi
	stxa	%o7,	[%g0 + 0x10] %asi
	fxnor	%f20,	%f16,	%f24
	fand	%f24,	%f16,	%f18
	umulcc	%l2,	%g4,	%i2
	ld	[%l7 + 0x14],	%f6
	tcc	%xcc,	0x4
	fmovdn	%icc,	%f15,	%f31
	fmovscc	%xcc,	%f23,	%f21
	set	0x66, %l3
	lduba	[%l7 + %l3] 0x15,	%i6
	fexpand	%f10,	%f22
	fxnors	%f23,	%f6,	%f12
	fmul8x16al	%f19,	%f20,	%f16
	fcmple32	%f0,	%f2,	%o0
	edge8n	%g6,	%o5,	%g5
	movrlez	%o6,	0x1B2,	%i4
	swap	[%l7 + 0x4C],	%l5
	udiv	%g2,	0x1CFE,	%i1
	movneg	%xcc,	%g1,	%l4
	mova	%xcc,	%o2,	%l3
	mova	%icc,	%i5,	%o3
	brgez	%i0,	loop_1066
	edge32	%l1,	%o1,	%g7
	set	0x22, %o5
	stha	%o4,	[%l7 + %o5] 0x27
	membar	#Sync
loop_1066:
	st	%f8,	[%l7 + 0x74]
	pdist	%f6,	%f10,	%f16
	fbn	%fcc0,	loop_1067
	nop
	set	0x54, %l4
	ldsw	[%l7 + %l4],	%l0
	fble	%fcc2,	loop_1068
	tneg	%xcc,	0x4
loop_1067:
	ldd	[%l7 + 0x10],	%i6
	fornot1	%f12,	%f8,	%f8
loop_1068:
	edge16l	%i3,	%g3,	%l6
	addcc	%l2,	%o7,	%g4
	edge16l	%i6,	%i2,	%o0
	subcc	%g6,	0x0692,	%g5
	movrgez	%o5,	0x18B,	%o6
	andcc	%l5,	0x1530,	%g2
	sdiv	%i1,	0x1162,	%i4
	nop
	setx	0x206EC967,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	orn	%l4,	%o2,	%g1
	movl	%icc,	%i5,	%l3
	movpos	%icc,	%i0,	%o3
	umul	%l1,	0x11B4,	%o1
	umul	%o4,	%l0,	%i7
	edge16	%g7,	%i3,	%l6
	lduh	[%l7 + 0x7A],	%l2
	fmovsgu	%icc,	%f31,	%f13
	addcc	%o7,	0x1C1A,	%g3
	addccc	%g4,	%i2,	%o0
	brz,a	%i6,	loop_1069
	ldsb	[%l7 + 0x45],	%g5
	tneg	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	sta	%f11,	[%l7 + 0x7C] %asi
loop_1069:
	srlx	%g6,	0x09,	%o5
	tsubcctv	%l5,	%o6,	%i1
	tgu	%icc,	0x5
	fpadd16	%f12,	%f16,	%f30
	brnz	%g2,	loop_1070
	fbe,a	%fcc3,	loop_1071
	edge32	%i4,	%l4,	%o2
	tcs	%icc,	0x2
loop_1070:
	nop
	set	0x08, %i4
	stxa	%g1,	[%l7 + %i4] 0x04
loop_1071:
	fcmpeq16	%f20,	%f14,	%l3
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x10] %asi,	%i0
	fbne	%fcc2,	loop_1072
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%i5
	srl	%l1,	%o3,	%o1
	fbl,a	%fcc2,	loop_1073
loop_1072:
	add	%l0,	0x1929,	%i7
	umulcc	%g7,	0x03FB,	%o4
	sdiv	%i3,	0x03A6,	%l2
loop_1073:
	smul	%o7,	0x17FB,	%g3
	nop
	setx	loop_1074,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovspos	%icc,	%f8,	%f6
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x14,	 0x1
loop_1074:
	brlz,a	%g4,	loop_1075
	movl	%icc,	%i2,	%i6
	tle	%xcc,	0x6
	st	%f18,	[%l7 + 0x5C]
loop_1075:
	movle	%xcc,	%o0,	%g5
	taddcc	%o5,	%g6,	%l5
	fandnot2	%f26,	%f12,	%f8
	fbl	%fcc2,	loop_1076
	fcmpne16	%f14,	%f26,	%i1
	ble	loop_1077
	taddcctv	%o6,	%g2,	%i4
loop_1076:
	fzeros	%f1
	set	0x38, %l5
	prefetcha	[%l7 + %l5] 0x11,	 0x2
loop_1077:
	fmovdn	%xcc,	%f8,	%f15
	fmovrsgez	%l4,	%f27,	%f24
	edge16ln	%g1,	%i0,	%l3
	membar	0x11
	edge32l	%l1,	%i5,	%o3
	sub	%l0,	%i7,	%g7
	xnorcc	%o4,	%i3,	%o1
	fmul8x16al	%f26,	%f23,	%f10
	array8	%l2,	%o7,	%g3
	brlez	%l6,	loop_1078
	fsrc1s	%f10,	%f12
	fones	%f5
	ldsh	[%l7 + 0x78],	%g4
loop_1078:
	and	%i6,	0x1CE6,	%o0
	fblg	%fcc1,	loop_1079
	taddcctv	%g5,	%i2,	%o5
	sra	%g6,	%l5,	%o6
	movgu	%xcc,	%i1,	%g2
loop_1079:
	edge8n	%o2,	%i4,	%l4
	bvc,pt	%icc,	loop_1080
	fbe	%fcc2,	loop_1081
	nop
	setx	0x0F485E2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x1109424C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f18,	%f12
	udivx	%i0,	0x15AC,	%g1
loop_1080:
	brgez	%l1,	loop_1082
loop_1081:
	fmovsneg	%icc,	%f11,	%f22
	lduw	[%l7 + 0x78],	%l3
	wr	%g0,	0x0c,	%asi
	sta	%f9,	[%l7 + 0x48] %asi
loop_1082:
	movne	%xcc,	%o3,	%i5
	bvc,pt	%icc,	loop_1083
	fmovsl	%icc,	%f2,	%f21
	srl	%i7,	0x08,	%g7
	movvc	%icc,	%o4,	%i3
loop_1083:
	move	%xcc,	%l0,	%l2
	nop
	setx	0x0DB247B26C420B61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD2700D9FC628E4A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f12,	%f14
	call	loop_1084
	udiv	%o7,	0x0AFA,	%o1
	bvs	loop_1085
	sir	0x1F28
loop_1084:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f12,	%f4,	%f6
loop_1085:
	movleu	%icc,	%g3,	%l6
	tn	%icc,	0x1
	xnorcc	%g4,	0x0851,	%i6
	ld	[%l7 + 0x5C],	%f22
	nop
	setx	loop_1086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%g5,	%o0,	%o5
	tgu	%xcc,	0x3
	stbar
loop_1086:
	orcc	%i2,	0x1805,	%g6
	tsubcctv	%l5,	0x19C4,	%i1
	fmovsgu	%xcc,	%f26,	%f2
	edge8ln	%o6,	%o2,	%g2
	fbge,a	%fcc3,	loop_1087
	mova	%icc,	%i4,	%l4
	movrlz	%i0,	0x2E4,	%l1
	orcc	%l3,	0x0702,	%g1
loop_1087:
	nop
	set	0x4B, %l0
	stba	%i5,	[%l7 + %l0] 0x80
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x53] %asi,	%o3
	set	0x1C, %g6
	lduba	[%l7 + %g6] 0x0c,	%i7
	udivcc	%o4,	0x1BC0,	%i3
	orncc	%g7,	0x15C8,	%l2
	fbule,a	%fcc0,	loop_1088
	fbg,a	%fcc3,	loop_1089
	taddcctv	%o7,	0x0643,	%o1
	popc	%l0,	%g3
loop_1088:
	movrgez	%g4,	0x1F2,	%l6
loop_1089:
	fsrc1	%f2,	%f26
	tcs	%icc,	0x0
	fbug,a	%fcc1,	loop_1090
	andncc	%g5,	%i6,	%o5
	movne	%icc,	%o0,	%g6
	and	%i2,	0x14DD,	%l5
loop_1090:
	fblg	%fcc1,	loop_1091
	smulcc	%o6,	%o2,	%g2
	tgu	%xcc,	0x2
	fmovspos	%icc,	%f5,	%f7
loop_1091:
	tcs	%icc,	0x1
	fmovsvs	%icc,	%f26,	%f29
	set	0x70, %i0
	swapa	[%l7 + %i0] 0x88,	%i4
	popc	%l4,	%i1
	fmovrdne	%i0,	%f6,	%f12
	fnor	%f14,	%f2,	%f0
	popc	0x0B70,	%l3
	movrgez	%l1,	0x113,	%i5
	fbul	%fcc1,	loop_1092
	movg	%icc,	%g1,	%o3
	sllx	%o4,	0x0C,	%i3
	movg	%icc,	%i7,	%g7
loop_1092:
	fabss	%f6,	%f2
	fmovsg	%xcc,	%f7,	%f13
	fmovdle	%xcc,	%f29,	%f17
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f18
	fxtod	%f18,	%f2
	xorcc	%l2,	0x07E6,	%o1
	ldsh	[%l7 + 0x24],	%o7
	movrgz	%g3,	%g4,	%l0
	srax	%l6,	%g5,	%o5
	udivx	%i6,	0x1B14,	%o0
	brlez,a	%g6,	loop_1093
	bneg,pt	%icc,	loop_1094
	movvs	%icc,	%i2,	%l5
	xor	%o6,	%g2,	%i4
loop_1093:
	tcs	%icc,	0x4
loop_1094:
	fbe,a	%fcc3,	loop_1095
	fand	%f12,	%f4,	%f24
	edge32	%l4,	%o2,	%i1
	nop
	fitos	%f5,	%f28
	fstoi	%f28,	%f12
loop_1095:
	ldsb	[%l7 + 0x2E],	%i0
	movcs	%icc,	%l1,	%l3
	fxors	%f10,	%f7,	%f13
	edge32n	%g1,	%o3,	%o4
	fbl	%fcc1,	loop_1096
	udivx	%i3,	0x051F,	%i5
	edge16n	%g7,	%l2,	%i7
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f2
loop_1096:
	andn	%o1,	%g3,	%o7
	umul	%l0,	0x1046,	%l6
	sethi	0x0A83,	%g4
	fmovdg	%xcc,	%f14,	%f3
	tcc	%xcc,	0x6
	movvc	%icc,	%g5,	%i6
	sra	%o0,	0x0E,	%g6
	smul	%o5,	%i2,	%l5
	movre	%o6,	0x39F,	%i4
	fmovscs	%xcc,	%f29,	%f28
	fmul8x16	%f25,	%f26,	%f30
	bgu,a,pn	%xcc,	loop_1097
	lduw	[%l7 + 0x14],	%l4
	movcs	%icc,	%o2,	%i1
	fbge,a	%fcc1,	loop_1098
loop_1097:
	fnors	%f16,	%f31,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x5B
loop_1098:
	tgu	%icc,	0x7
	nop
	fitos	%f11,	%f17
	fstox	%f17,	%f14
	fxtos	%f14,	%f17
	movcs	%xcc,	%g2,	%l1
	set	0x4E, %l2
	lduba	[%l7 + %l2] 0x19,	%l3
	udivx	%g1,	0x171D,	%i0
	tvs	%xcc,	0x2
	fmovse	%xcc,	%f0,	%f10
	fmovdpos	%icc,	%f14,	%f8
	edge8ln	%o4,	%o3,	%i5
	orn	%g7,	%l2,	%i7
	tne	%xcc,	0x7
	smulcc	%o1,	0x14A4,	%i3
	array32	%g3,	%l0,	%l6
	smulcc	%g4,	%o7,	%g5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%i6
	movle	%xcc,	%g6,	%o0
	swap	[%l7 + 0x1C],	%i2
	movle	%icc,	%o5,	%o6
	fsrc1	%f20,	%f10
	wr	%g0,	0x88,	%asi
	stha	%l5,	[%l7 + 0x2E] %asi
	call	loop_1099
	movrgz	%i4,	0x1C5,	%o2
	nop
	setx loop_1100, %l0, %l1
	jmpl %l1, %l4
	fnegd	%f18,	%f6
loop_1099:
	edge16	%g2,	%l1,	%i1
	andcc	%g1,	%i0,	%o4
loop_1100:
	fba,a	%fcc1,	loop_1101
	fmovs	%f26,	%f2
	umul	%o3,	%i5,	%l3
	array32	%g7,	%l2,	%o1
loop_1101:
	mulx	%i3,	0x13BE,	%i7
	nop
	setx	0x6D5B81F8805800A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	edge32	%l0,	%l6,	%g3
	set	0x30, %i2
	ldxa	[%g0 + %i2] 0x58,	%g4
	st	%f4,	[%l7 + 0x54]
	set	0x7C, %o4
	lduwa	[%l7 + %o4] 0x0c,	%g5
	fnand	%f14,	%f4,	%f26
	fmuld8ulx16	%f23,	%f7,	%f20
	andn	%i6,	0x0956,	%g6
	movrgz	%o7,	0x13A,	%i2
	tpos	%xcc,	0x7
	fmovda	%icc,	%f28,	%f14
	movcc	%xcc,	%o0,	%o5
	bcs,pt	%xcc,	loop_1102
	popc	%o6,	%i4
	bg	%xcc,	loop_1103
	tpos	%icc,	0x3
loop_1102:
	fnot2s	%f29,	%f27
	srl	%o2,	0x16,	%l4
loop_1103:
	mova	%xcc,	%g2,	%l5
	alignaddr	%i1,	%l1,	%g1
	bvc,a	loop_1104
	movre	%i0,	%o4,	%o3
	stb	%l3,	[%l7 + 0x3C]
	edge16ln	%i5,	%g7,	%l2
loop_1104:
	edge32	%i3,	%o1,	%i7
	nop
	setx	0xEAC11789,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x932F1468,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f30,	%f8
	add	%l6,	%g3,	%g4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x23] %asi,	%l0
	tge	%icc,	0x2
	fbul	%fcc1,	loop_1105
	tn	%icc,	0x5
	fmovdcs	%icc,	%f5,	%f27
	ldsw	[%l7 + 0x24],	%i6
loop_1105:
	tgu	%xcc,	0x0
	edge32	%g5,	%g6,	%i2
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f15
	membar	0x7C
	membar	0x1E
	sdivx	%o7,	0x1F18,	%o0
	array32	%o6,	%i4,	%o5
	movl	%icc,	%o2,	%l4
	tpos	%icc,	0x1
	smulcc	%g2,	%i1,	%l5
	edge32l	%l1,	%g1,	%o4
	bcc,a,pt	%icc,	loop_1106
	ta	%xcc,	0x4
	te	%xcc,	0x6
	fmovrdgz	%i0,	%f12,	%f22
loop_1106:
	nop
	set	0x7C, %g3
	lda	[%l7 + %g3] 0x18,	%f10
	orn	%l3,	0x12A8,	%i5
	pdist	%f12,	%f6,	%f22
	srl	%g7,	%o3,	%l2
	ldub	[%l7 + 0x78],	%i3
	ldub	[%l7 + 0x44],	%i7
	movle	%xcc,	%o1,	%l6
	fbne,a	%fcc3,	loop_1107
	movg	%icc,	%g4,	%l0
	fbl	%fcc2,	loop_1108
	edge16	%g3,	%i6,	%g5
loop_1107:
	movle	%xcc,	%i2,	%o7
	movre	%g6,	0x00D,	%o0
loop_1108:
	fnot2	%f12,	%f10
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x20] %asi,	%o6
	set	0x24, %i7
	lduha	[%l7 + %i7] 0x11,	%o5
	tle	%icc,	0x4
	movrne	%o2,	%l4,	%g2
	xor	%i4,	0x0D80,	%i1
	edge16ln	%l1,	%g1,	%l5
	bpos,pt	%icc,	loop_1109
	sub	%o4,	%i0,	%l3
	movpos	%xcc,	%i5,	%o3
	udiv	%l2,	0x130F,	%g7
loop_1109:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%o1
	edge8	%l6,	%i3,	%g4
	alignaddrl	%l0,	%i6,	%g5
	movcc	%xcc,	%g3,	%o7
	fbu,a	%fcc0,	loop_1110
	or	%g6,	0x1C1E,	%o0
	addcc	%o6,	0x11BC,	%i2
	sll	%o2,	0x16,	%o5
loop_1110:
	fandnot2	%f12,	%f26,	%f18
	nop
	fitos	%f6,	%f8
	fstod	%f8,	%f26
	andncc	%g2,	%l4,	%i4
	nop
	setx	0x5CD0E92B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x26947BF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f30,	%f12
	bvs,a,pt	%icc,	loop_1111
	fmovrdgez	%i1,	%f14,	%f10
	brz,a	%l1,	loop_1112
	movn	%xcc,	%l5,	%g1
loop_1111:
	fmovdn	%xcc,	%f20,	%f21
	ble,a,pt	%xcc,	loop_1113
loop_1112:
	orcc	%i0,	0x044A,	%l3
	alignaddrl	%o4,	%o3,	%i5
	faligndata	%f12,	%f18,	%f28
loop_1113:
	tn	%icc,	0x2
	movvc	%xcc,	%l2,	%i7
	sethi	0x12B1,	%o1
	tsubcc	%l6,	%g7,	%g4
	movcs	%icc,	%i3,	%i6
	subccc	%g5,	%l0,	%g3
	xnor	%g6,	%o0,	%o7
	fmul8x16al	%f19,	%f11,	%f14
	brgez,a	%o6,	loop_1114
	mova	%icc,	%o2,	%i2
	movvc	%icc,	%g2,	%l4
	and	%i4,	%i1,	%l1
loop_1114:
	be,a	loop_1115
	sdiv	%l5,	0x0526,	%o5
	nop
	fitod	%f6,	%f2
	fdtoi	%f2,	%f9
	sra	%g1,	0x12,	%l3
loop_1115:
	fbge	%fcc2,	loop_1116
	xorcc	%o4,	%i0,	%o3
	orn	%l2,	0x1789,	%i5
	fmovdleu	%xcc,	%f17,	%f20
loop_1116:
	mulx	%i7,	%o1,	%g7
	sll	%g4,	0x1B,	%l6
	sra	%i6,	0x04,	%i3
	brnz	%g5,	loop_1117
	fbu	%fcc2,	loop_1118
	tvc	%icc,	0x3
	bcc,a,pn	%icc,	loop_1119
loop_1117:
	edge16	%l0,	%g3,	%o0
loop_1118:
	tcs	%icc,	0x5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%g6
loop_1119:
	movge	%xcc,	%o7,	%o2
	sub	%i2,	%g2,	%o6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l4
	fmovrdne	%i4,	%f22,	%f30
	edge16	%l1,	%i1,	%o5
	tg	%icc,	0x0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g1
	xorcc	%l5,	0x05B4,	%l3
	nop
	setx	0x6F5279D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x407AAD44,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f9,	%f30
	alignaddrl	%i0,	%o4,	%l2
	tsubcc	%i5,	%o3,	%i7
	edge16l	%g7,	%g4,	%o1
	stbar
	srlx	%i6,	0x1B,	%i3
	bvs	%icc,	loop_1120
	fbge	%fcc2,	loop_1121
	addc	%l6,	%l0,	%g5
	add	%g3,	%g6,	%o7
loop_1120:
	fmovdcs	%icc,	%f9,	%f7
loop_1121:
	movg	%icc,	%o2,	%o0
	movne	%xcc,	%i2,	%o6
	fmovrde	%l4,	%f14,	%f10
	array16	%i4,	%l1,	%i1
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x80
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%o5
	tne	%icc,	0x6
	brz,a	%g1,	loop_1122
	ldd	[%l7 + 0x48],	%f24
	fmul8sux16	%f26,	%f20,	%f18
	tvc	%xcc,	0x3
loop_1122:
	tl	%xcc,	0x4
	add	%l5,	0x0214,	%g2
	tn	%icc,	0x7
	edge32ln	%i0,	%l3,	%l2
	fmul8x16au	%f3,	%f13,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o4,	%o3
	mulx	%i7,	0x1EC8,	%g7
	srlx	%i5,	%o1,	%g4
	nop
	setx	0x70F28C38,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f0
	tsubcctv	%i3,	0x1955,	%l6
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	sra	%g5,	0x09,	%g3
	alignaddrl	%g6,	%i6,	%o2
	udivx	%o7,	0x17F6,	%o0
	smul	%i2,	%l4,	%o6
	ble,a	%xcc,	loop_1123
	orncc	%l1,	0x13E0,	%i1
	fbule,a	%fcc1,	loop_1124
	bcs,a,pn	%xcc,	loop_1125
loop_1123:
	fpack32	%f16,	%f14,	%f18
	edge8	%o5,	%g1,	%i4
loop_1124:
	alignaddrl	%g2,	%i0,	%l3
loop_1125:
	fblg	%fcc0,	loop_1126
	sdivcc	%l2,	0x1D36,	%o4
	nop
	setx	0x4069A696,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	array16	%l5,	%i7,	%o3
loop_1126:
	ldsh	[%l7 + 0x36],	%i5
	edge8l	%o1,	%g7,	%g4
	fones	%f18
	movrne	%l6,	0x2F7,	%i3
	fbu,a	%fcc3,	loop_1127
	nop
	setx	0xF99B7E2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x88D1183D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f18,	%f1
	movle	%xcc,	%g5,	%g3
	edge16l	%l0,	%i6,	%o2
loop_1127:
	movleu	%xcc,	%g6,	%o0
	umulcc	%o7,	0x0F77,	%i2
	nop
	fitos	%f1,	%f16
	fstod	%f16,	%f14
	tne	%icc,	0x0
	fmul8x16au	%f18,	%f9,	%f30
	edge32l	%l4,	%o6,	%i1
	tcs	%icc,	0x5
	orcc	%l1,	0x1D41,	%o5
	tvc	%xcc,	0x5
	edge8n	%g1,	%i4,	%g2
	fmovdvc	%xcc,	%f22,	%f15
	fpadd16	%f10,	%f26,	%f16
	movrlez	%i0,	0x1CC,	%l3
	orn	%o4,	%l2,	%i7
	movn	%xcc,	%o3,	%l5
	srlx	%i5,	0x01,	%g7
	movl	%xcc,	%g4,	%l6
	fbue	%fcc0,	loop_1128
	movl	%icc,	%o1,	%i3
	fcmpeq32	%f2,	%f8,	%g5
	srax	%g3,	%l0,	%i6
loop_1128:
	nop
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	addcc	%o2,	0x01C2,	%o0
	tg	%icc,	0x7
	movne	%xcc,	%g6,	%o7
	movrne	%l4,	%o6,	%i1
	movrne	%i2,	%l1,	%g1
	xnor	%i4,	0x046F,	%g2
	xnor	%o5,	%l3,	%o4
	nop
	setx	loop_1129,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%i0,	%i7,	%o3
	bcs,a,pn	%icc,	loop_1130
	fbul,a	%fcc0,	loop_1131
loop_1129:
	movrlez	%l2,	%i5,	%g7
	array16	%l5,	%l6,	%o1
loop_1130:
	movrgz	%g4,	0x1EB,	%g5
loop_1131:
	call	loop_1132
	movcs	%icc,	%i3,	%l0
	fbl	%fcc2,	loop_1133
	brlez	%g3,	loop_1134
loop_1132:
	bvc	loop_1135
	array16	%o2,	%i6,	%g6
loop_1133:
	fbn	%fcc3,	loop_1136
loop_1134:
	fbu	%fcc2,	loop_1137
loop_1135:
	tneg	%xcc,	0x3
	fcmpgt16	%f2,	%f24,	%o0
loop_1136:
	movge	%xcc,	%o7,	%o6
loop_1137:
	fandnot2	%f20,	%f24,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x18],	%l4
	fmovsgu	%icc,	%f2,	%f12
	edge16	%i1,	%l1,	%g1
	fbu,a	%fcc0,	loop_1138
	bvc,pn	%xcc,	loop_1139
	brgez	%i2,	loop_1140
	andn	%i4,	0x1FE4,	%o5
loop_1138:
	sethi	0x0663,	%g2
loop_1139:
	faligndata	%f18,	%f4,	%f24
loop_1140:
	tgu	%icc,	0x6
	subcc	%o4,	0x01E1,	%l3
	xor	%i7,	%i0,	%o3
	movl	%xcc,	%l2,	%g7
	popc	0x156B,	%l5
	brlz	%l6,	loop_1141
	taddcctv	%o1,	0x0706,	%g4
	bg,pt	%icc,	loop_1142
	tvs	%icc,	0x1
loop_1141:
	xnor	%g5,	%i3,	%l0
	brgz	%g3,	loop_1143
loop_1142:
	fmovscc	%icc,	%f18,	%f19
	edge32	%o2,	%i6,	%g6
	movleu	%xcc,	%o0,	%i5
loop_1143:
	fble,a	%fcc1,	loop_1144
	addc	%o6,	0x0EA8,	%o7
	addccc	%l4,	%i1,	%l1
	be,a	%xcc,	loop_1145
loop_1144:
	addccc	%i2,	%i4,	%g1
	udiv	%o5,	0x08F2,	%o4
	xorcc	%l3,	%g2,	%i7
loop_1145:
	fblg	%fcc1,	loop_1146
	sdiv	%i0,	0x0526,	%o3
	tleu	%icc,	0x6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1146:
	subcc	%g7,	%l5,	%l2
	bn,a	%xcc,	loop_1147
	sll	%l6,	0x0D,	%o1
	edge32ln	%g4,	%g5,	%l0
	edge32l	%i3,	%g3,	%i6
loop_1147:
	nop
	setx	0xF76F05B1B0614EA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	edge8ln	%o2,	%g6,	%o0
	nop
	setx	loop_1148,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x28],	%o6
	fbe,a	%fcc2,	loop_1149
	movre	%o7,	%i5,	%l4
loop_1148:
	andn	%i1,	0x1CB2,	%i2
	set	0x1C, %l1
	lduwa	[%l7 + %l1] 0x15,	%i4
loop_1149:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l1
	fbu,a	%fcc0,	loop_1150
	srlx	%g1,	0x07,	%o5
	tcc	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1150:
	brgez,a	%l3,	loop_1151
	fpadd32s	%f19,	%f6,	%f16
	sllx	%o4,	0x07,	%i7
	fmovscc	%icc,	%f19,	%f3
loop_1151:
	bg,a	loop_1152
	ldub	[%l7 + 0x3A],	%i0
	edge8	%o3,	%g7,	%g2
	set	0x64, %g1
	ldswa	[%l7 + %g1] 0x04,	%l5
loop_1152:
	tl	%icc,	0x0
	alignaddrl	%l2,	%l6,	%g4
	fmul8sux16	%f18,	%f16,	%f4
	addc	%g5,	0x014A,	%l0
	movre	%o1,	%i3,	%i6
	add	%g3,	0x0B92,	%o2
	movgu	%xcc,	%g6,	%o0
	umul	%o7,	%o6,	%l4
	edge16l	%i1,	%i2,	%i4
	nop
	setx	0xC60BC8D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xB769E967,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f13,	%f1
	or	%l1,	0x1765,	%i5
	fbg,a	%fcc2,	loop_1153
	udiv	%o5,	0x0A59,	%g1
	movcc	%xcc,	%o4,	%i7
	fzero	%f16
loop_1153:
	fnot1	%f16,	%f8
	sra	%l3,	0x11,	%i0
	ldsb	[%l7 + 0x6A],	%o3
	fzeros	%f26
	tn	%icc,	0x2
	edge32ln	%g2,	%g7,	%l5
	nop
	setx	0x48B91FCA748A4003,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f14
	fbo,a	%fcc1,	loop_1154
	tsubcctv	%l2,	%g4,	%l6
	fmovrsne	%g5,	%f8,	%f22
	fmuld8sux16	%f17,	%f16,	%f12
loop_1154:
	orn	%o1,	%i3,	%i6
	bvs,a	%icc,	loop_1155
	edge16n	%l0,	%o2,	%g6
	taddcc	%o0,	%o7,	%g3
	fnot2s	%f23,	%f9
loop_1155:
	ldstub	[%l7 + 0x56],	%o6
	fmovsvc	%xcc,	%f15,	%f15
	or	%i1,	0x1F88,	%l4
	addcc	%i4,	%l1,	%i5
	addcc	%o5,	0x1EE0,	%i2
	nop
	setx	0x08836EEC8816E2C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x252067902CD9BE00,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f20
	ldstub	[%l7 + 0x71],	%g1
	movpos	%xcc,	%o4,	%i7
	sir	0x134D
	tleu	%icc,	0x3
	ld	[%l7 + 0x18],	%f16
	taddcctv	%i0,	%l3,	%o3
	fbn,a	%fcc2,	loop_1156
	xorcc	%g7,	0x1386,	%g2
	tpos	%xcc,	0x5
	sdivx	%l2,	0x1BFF,	%g4
loop_1156:
	fbo,a	%fcc1,	loop_1157
	fmovdneg	%xcc,	%f12,	%f25
	movrne	%l6,	%g5,	%o1
	movvs	%icc,	%l5,	%i3
loop_1157:
	array16	%i6,	%o2,	%l0
	bn,pn	%xcc,	loop_1158
	fmuld8ulx16	%f13,	%f21,	%f26
	movrgz	%o0,	0x3F7,	%o7
	tgu	%xcc,	0x1
loop_1158:
	orcc	%g3,	%g6,	%o6
	tle	%icc,	0x1
	ta	%xcc,	0x2
	srax	%i1,	0x0A,	%l4
	tge	%xcc,	0x2
	fbuge,a	%fcc2,	loop_1159
	nop
	setx	0xE939002CDAE76642,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x94AD904325CA5669,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f14,	%f2
	fmovd	%f16,	%f30
	andcc	%l1,	%i5,	%i4
loop_1159:
	fmovrdgez	%i2,	%f22,	%f22
	mulscc	%g1,	%o5,	%o4
	fmovde	%icc,	%f20,	%f29
	addccc	%i0,	0x0866,	%i7
	umulcc	%l3,	0x030D,	%g7
	edge32ln	%o3,	%l2,	%g4
	edge8n	%g2,	%g5,	%o1
	stw	%l6,	[%l7 + 0x48]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc2,	loop_1160
	addc	%l5,	%i3,	%o2
	set	0x1C, %i6
	ldsba	[%l7 + %i6] 0x19,	%i6
loop_1160:
	mulx	%l0,	%o7,	%o0
	nop
	fitos	%f2,	%f24
	fstod	%f24,	%f20
	edge8n	%g6,	%g3,	%o6
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%f22
	umul	%i1,	0x0D0F,	%l1
	sethi	0x1AFA,	%i5
	array16	%l4,	%i2,	%i4
	fones	%f28
	tle	%icc,	0x5
	sdivcc	%g1,	0x015F,	%o5
	alignaddr	%o4,	%i7,	%i0
	movge	%xcc,	%l3,	%o3
	stx	%l2,	[%l7 + 0x28]
	fmovsge	%xcc,	%f19,	%f15
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g4
	ldub	[%l7 + 0x58],	%g2
	array8	%g7,	%g5,	%o1
	st	%f2,	[%l7 + 0x4C]
	or	%l5,	0x058B,	%l6
	set	0x60, %o0
	ldda	[%l7 + %o0] 0x0c,	%o2
	stw	%i3,	[%l7 + 0x0C]
	tge	%icc,	0x0
	xnorcc	%i6,	0x02A6,	%l0
	edge8ln	%o7,	%o0,	%g3
	fmovspos	%icc,	%f21,	%f4
	sdivcc	%g6,	0x005B,	%i1
	movle	%xcc,	%o6,	%i5
	tg	%xcc,	0x7
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f26
	tgu	%xcc,	0x6
	brlez,a	%l4,	loop_1161
	subccc	%i2,	%i4,	%g1
	set	0x68, %o2
	ldstuba	[%l7 + %o2] 0x80,	%o5
loop_1161:
	fmul8ulx16	%f10,	%f6,	%f12
	ldstub	[%l7 + 0x40],	%o4
	fbue	%fcc0,	loop_1162
	subccc	%l1,	0x002F,	%i7
	fsrc1s	%f29,	%f6
	tcc	%xcc,	0x3
loop_1162:
	orcc	%l3,	0x16DD,	%i0
	edge32	%l2,	%o3,	%g2
	fors	%f6,	%f8,	%f5
	fmovsgu	%xcc,	%f14,	%f7
	addc	%g7,	0x15F5,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o1,	%g4
	sdiv	%l5,	0x1843,	%l6
	movcs	%icc,	%o2,	%i6
	movvc	%xcc,	%i3,	%o7
	edge16ln	%l0,	%g3,	%g6
	movn	%xcc,	%i1,	%o6
	movrne	%i5,	0x1DE,	%o0
	umulcc	%i2,	%l4,	%i4
	movrgz	%g1,	%o4,	%o5
	nop
	setx	0x4CDA2EE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x7BA6F351,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f14,	%f10
	edge32ln	%l1,	%l3,	%i7
	addccc	%l2,	0x18CA,	%o3
	fzeros	%f24
	movle	%xcc,	%g2,	%i0
	fandnot2s	%f20,	%f29,	%f12
	movneg	%xcc,	%g7,	%g5
	fbo,a	%fcc1,	loop_1163
	and	%o1,	0x0F22,	%g4
	tcc	%xcc,	0x3
	nop
	setx	0x40462F9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_1163:
	fmovrdgez	%l6,	%f20,	%f22
	fmovde	%xcc,	%f29,	%f24
	edge16	%o2,	%i6,	%i3
	fmul8sux16	%f10,	%f30,	%f16
	tleu	%icc,	0x5
	edge32l	%o7,	%l5,	%g3
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f2
	fxtod	%f2,	%f4
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f8
	fxtos	%f8,	%f26
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bg,a	%xcc,	loop_1164
	tleu	%xcc,	0x4
	set	0x38, %o6
	stxa	%g6,	[%l7 + %o6] 0xeb
	membar	#Sync
loop_1164:
	edge32l	%l0,	%o6,	%i5
	movle	%icc,	%o0,	%i1
	subccc	%l4,	0x1A37,	%i4
	fbug,a	%fcc2,	loop_1165
	sir	0x156E
	fmovdleu	%icc,	%f15,	%f11
	fabsd	%f22,	%f8
loop_1165:
	movcc	%icc,	%i2,	%o4
	sll	%g1,	%o5,	%l3
	sra	%i7,	0x12,	%l2
	sir	0x0339
	set	0x58, %i3
	ldxa	[%l7 + %i3] 0x10,	%o3
	set	0x5C, %g4
	stwa	%g2,	[%l7 + %g4] 0xe2
	membar	#Sync
	stbar
	bcc,a	%xcc,	loop_1166
	subc	%i0,	%l1,	%g5
	sra	%g7,	%o1,	%g4
	tsubcctv	%o2,	0x1543,	%i6
loop_1166:
	fcmple32	%f16,	%f0,	%i3
	fcmple16	%f16,	%f16,	%o7
	fmovse	%icc,	%f0,	%f8
	umul	%l5,	0x1F30,	%l6
	subc	%g6,	%l0,	%g3
	fzeros	%f0
	tne	%xcc,	0x0
	nop
	setx	0x428C13DD6B02D8C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x6CFEE2A47525DAA5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f24,	%f20
	ldstub	[%l7 + 0x27],	%i5
	movle	%xcc,	%o0,	%i1
	srax	%l4,	0x10,	%i4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%o6
	fpadd16s	%f15,	%f0,	%f30
	fone	%f18
	xnorcc	%i2,	%g1,	%o4
	udivcc	%l3,	0x052B,	%o5
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f12
	or	%i7,	%l2,	%g2
	fsrc1	%f20,	%f18
	nop
	fitod	%f13,	%f24
	fmovd	%f28,	%f0
	umulcc	%o3,	%l1,	%g5
	tsubcc	%i0,	%o1,	%g7
	fmovrsgez	%g4,	%f18,	%f18
	tn	%icc,	0x4
	bcs,a,pt	%icc,	loop_1167
	fmovdl	%icc,	%f8,	%f10
	movneg	%xcc,	%i6,	%i3
	call	loop_1168
loop_1167:
	fmuld8ulx16	%f7,	%f12,	%f18
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%o2
loop_1168:
	bne,a,pn	%icc,	loop_1169
	fmovspos	%icc,	%f9,	%f2
	tne	%icc,	0x4
	fmovrde	%o7,	%f28,	%f10
loop_1169:
	nop
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	fbo	%fcc3,	loop_1170
	sra	%l6,	%g6,	%l0
	nop
	setx	0x1B49CEBC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xDDB251B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f7,	%f9
	movl	%icc,	%g3,	%o0
loop_1170:
	taddcc	%i5,	0x1A4F,	%l4
	set	0x70, %o3
	sta	%f24,	[%l7 + %o3] 0x14
	movg	%icc,	%i4,	%i1
	xnorcc	%o6,	0x0657,	%i2
	nop
	setx	0xAD3067AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f11
	fsrc2	%f10,	%f14
	fmovdvs	%icc,	%f21,	%f6
	fbuge,a	%fcc2,	loop_1171
	stx	%o4,	[%l7 + 0x40]
	taddcc	%g1,	0x0628,	%l3
	fmovdvc	%xcc,	%f4,	%f1
loop_1171:
	udivx	%i7,	0x1E4D,	%o5
	srax	%g2,	%o3,	%l2
	lduh	[%l7 + 0x40],	%l1
	fzero	%f18
	set	0x52, %o1
	lduha	[%l7 + %o1] 0x18,	%g5
	fone	%f12
	ldsh	[%l7 + 0x0C],	%o1
	fbul	%fcc3,	loop_1172
	fbu,a	%fcc3,	loop_1173
	fpsub32s	%f6,	%f22,	%f16
	fnot1s	%f9,	%f22
loop_1172:
	nop
	set	0x5C, %l6
	ldswa	[%l7 + %l6] 0x19,	%g7
loop_1173:
	mulx	%i0,	0x1A6C,	%g4
	sub	%i6,	%i3,	%o7
	fmovsge	%icc,	%f21,	%f10
	smulcc	%o2,	0x16AE,	%l6
	alignaddr	%l5,	%g6,	%l0
	fmovsge	%xcc,	%f11,	%f17
	nop
	setx	loop_1174,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba	%fcc1,	loop_1175
	fmovsa	%xcc,	%f26,	%f6
	movvs	%xcc,	%g3,	%o0
loop_1174:
	fsrc1	%f6,	%f28
loop_1175:
	or	%i5,	%i4,	%l4
	udivcc	%o6,	0x0EE1,	%i1
	fbn	%fcc3,	loop_1176
	fbu	%fcc1,	loop_1177
	movrlz	%i2,	%g1,	%o4
	xor	%i7,	%o5,	%l3
loop_1176:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%g2,	%o3
loop_1177:
	ble,a	loop_1178
	ble,pn	%icc,	loop_1179
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f2
	udivx	%l1,	0x1947,	%g5
loop_1178:
	fblg	%fcc1,	loop_1180
loop_1179:
	fmovda	%xcc,	%f19,	%f6
	lduh	[%l7 + 0x56],	%l2
	movle	%xcc,	%o1,	%i0
loop_1180:
	stbar
	movcc	%xcc,	%g7,	%g4
	array8	%i6,	%i3,	%o7
	nop
	fitos	%f1,	%f12
	popc	%o2,	%l6
	sub	%l5,	0x00DE,	%g6
	tgu	%icc,	0x7
	edge16	%l0,	%g3,	%i5
	fbn,a	%fcc0,	loop_1181
	array16	%i4,	%o0,	%o6
	movg	%xcc,	%i1,	%i2
	fors	%f23,	%f30,	%f8
loop_1181:
	sir	0x13D6
	smulcc	%g1,	%l4,	%i7
	tpos	%xcc,	0x1
	sllx	%o5,	%l3,	%g2
	fandnot2	%f26,	%f24,	%f0
	te	%xcc,	0x7
	tg	%xcc,	0x7
	nop
	setx	0x4096158210602B93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fpack32	%f20,	%f10,	%f26
	movgu	%xcc,	%o4,	%o3
	fbue	%fcc0,	loop_1182
	addc	%l1,	0x1A8D,	%l2
	set	0x44, %o7
	lduba	[%l7 + %o7] 0x88,	%o1
loop_1182:
	swap	[%l7 + 0x50],	%i0
	tg	%xcc,	0x6
	fpadd32	%f16,	%f28,	%f0
	sdivx	%g5,	0x14CA,	%g4
	std	%f22,	[%l7 + 0x38]
	edge16ln	%i6,	%i3,	%o7
	tcs	%xcc,	0x3
	orn	%o2,	0x06AD,	%l6
	set	0x61, %l3
	ldsba	[%l7 + %l3] 0x04,	%g7
	nop
	setx	0x4483E5F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f25
	movvc	%icc,	%l5,	%g6
	addc	%l0,	%i5,	%g3
	tcs	%xcc,	0x1
	bgu	%xcc,	loop_1183
	tle	%icc,	0x0
	movrgez	%i4,	0x166,	%o6
	edge16l	%o0,	%i1,	%i2
loop_1183:
	movge	%icc,	%g1,	%l4
	addccc	%o5,	%l3,	%g2
	fblg,a	%fcc0,	loop_1184
	tcs	%xcc,	0x0
	fcmpeq32	%f18,	%f16,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1184:
	std	%f14,	[%l7 + 0x60]
	srax	%o3,	%i7,	%l2
	tge	%icc,	0x4
	movge	%icc,	%l1,	%i0
	edge8l	%o1,	%g5,	%i6
	tsubcc	%i3,	0x1418,	%g4
	fmovsleu	%icc,	%f27,	%f13
	fnors	%f22,	%f5,	%f22
	fpsub16	%f20,	%f22,	%f16
	umul	%o7,	%o2,	%l6
	movgu	%xcc,	%l5,	%g7
	umulcc	%l0,	%g6,	%g3
	fmovsl	%icc,	%f20,	%f21
	fbl	%fcc3,	loop_1185
	tge	%xcc,	0x0
	tle	%icc,	0x2
	set	0x58, %o5
	stwa	%i5,	[%l7 + %o5] 0x2b
	membar	#Sync
loop_1185:
	movrlz	%i4,	0x0B3,	%o6
	subccc	%o0,	%i1,	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%l4
	fandnot2s	%f27,	%f4,	%f11
	fmovspos	%icc,	%f27,	%f24
	move	%icc,	%l3,	%g2
	fmovdneg	%xcc,	%f2,	%f1
	movn	%xcc,	%o5,	%o3
	umulcc	%i7,	%o4,	%l2
	edge32l	%i0,	%o1,	%g5
	tn	%xcc,	0x3
	tg	%icc,	0x1
	tcs	%xcc,	0x7
	fnot2	%f14,	%f16
	bneg,a,pn	%xcc,	loop_1186
	fbuge,a	%fcc1,	loop_1187
	bshuffle	%f12,	%f8,	%f2
	lduw	[%l7 + 0x60],	%i6
loop_1186:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i3
loop_1187:
	nop
	set	0x19, %l4
	ldsba	[%l7 + %l4] 0x14,	%g4
	movcc	%xcc,	%o7,	%o2
	bpos	loop_1188
	addccc	%l6,	%l5,	%g7
	nop
	set	0x30, %g7
	lduh	[%l7 + %g7],	%l0
	fpackfix	%f30,	%f3
loop_1188:
	sdiv	%g6,	0x150A,	%l1
	tle	%xcc,	0x6
	fpadd16	%f10,	%f18,	%f18
	edge8l	%i5,	%g3,	%o6
	popc	%i4,	%o0
	sethi	0x1DAF,	%g1
	tsubcc	%i2,	%l4,	%i1
	set	0x20, %i4
	swapa	[%l7 + %i4] 0x18,	%l3
	udivcc	%o5,	0x048F,	%g2
	edge16n	%o3,	%o4,	%i7
	sub	%l2,	%o1,	%i0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%i6
	subccc	%i3,	%g5,	%o7
	fbn	%fcc2,	loop_1189
	bvs	loop_1190
	movvc	%xcc,	%g4,	%o2
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1189:
	fandnot2	%f2,	%f26,	%f10
loop_1190:
	nop
	set	0x71, %i5
	ldsba	[%l7 + %i5] 0x88,	%l5
	fornot1s	%f5,	%f16,	%f2
	lduh	[%l7 + 0x46],	%l6
	fmovd	%f2,	%f24
	sdivx	%l0,	0x0D8F,	%g6
	edge16	%l1,	%i5,	%g7
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x42] %asi,	%g3
	movcs	%xcc,	%o0,	%g1
	add	%i4,	0x1D35,	%i2
	taddcc	%i1,	0x11B7,	%l3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o5
	movcc	%xcc,	%l4,	%g2
	fbuge,a	%fcc3,	loop_1191
	sir	0x148D
	fpmerge	%f26,	%f25,	%f30
	tle	%icc,	0x2
loop_1191:
	alignaddrl	%o4,	%o3,	%l2
	ta	%icc,	0x4
	fmul8x16au	%f31,	%f18,	%f24
	sethi	0x0053,	%i7
	fones	%f26
	smulcc	%i0,	0x1BD5,	%i6
	tleu	%xcc,	0x5
	tleu	%icc,	0x0
	edge16	%i3,	%o1,	%o7
	edge8l	%g5,	%o2,	%l5
	fmovdne	%xcc,	%f31,	%f2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%g4,	%l0
	fmovdneg	%icc,	%f12,	%f8
	sdivcc	%l6,	0x0B7C,	%l1
	fmovdle	%icc,	%f16,	%f20
	movg	%icc,	%g6,	%i5
	call	loop_1192
	fblg	%fcc1,	loop_1193
	tsubcc	%o6,	0x04FA,	%g7
	ldx	[%l7 + 0x70],	%o0
loop_1192:
	brlz	%g1,	loop_1194
loop_1193:
	array8	%g3,	%i4,	%i1
	xorcc	%l3,	0x0590,	%o5
	nop
	fitos	%f11,	%f29
	fstox	%f29,	%f12
	fxtos	%f12,	%f7
loop_1194:
	bpos,a	loop_1195
	sir	0x14F0
	xor	%i2,	0x08A1,	%l4
	fnors	%f1,	%f2,	%f5
loop_1195:
	sdivx	%o4,	0x0CA8,	%o3
	nop
	setx	0x1DE2CC6F011441E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f8
	stbar
	edge8l	%g2,	%l2,	%i7
	ldx	[%l7 + 0x68],	%i6
	orcc	%i0,	0x015C,	%o1
	ldsh	[%l7 + 0x46],	%i3
	fmovscc	%xcc,	%f15,	%f24
	sdiv	%o7,	0x0E19,	%g5
	edge8ln	%o2,	%g4,	%l5
	movvc	%icc,	%l0,	%l6
	bn,a	loop_1196
	fmovsvs	%icc,	%f10,	%f14
	tvs	%xcc,	0x3
	array16	%l1,	%i5,	%g6
loop_1196:
	smulcc	%g7,	%o6,	%g1
	srax	%o0,	0x05,	%g3
	mulscc	%i1,	0x10E3,	%l3
	edge32l	%o5,	%i4,	%l4
	movleu	%icc,	%i2,	%o3
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orn	%o4,	0x015F,	%l2
	fbuge	%fcc2,	loop_1197
	tcs	%xcc,	0x2
	tsubcc	%i7,	%i6,	%g2
	tsubcctv	%o1,	%i0,	%o7
loop_1197:
	sir	0x0B1C
	fcmpgt32	%f26,	%f18,	%i3
	movrgz	%g5,	%o2,	%g4
	fmovrslz	%l5,	%f1,	%f29
	edge32	%l6,	%l1,	%l0
	fbne	%fcc2,	loop_1198
	movrlez	%g6,	%i5,	%g7
	edge32ln	%o6,	%g1,	%g3
	tgu	%icc,	0x6
loop_1198:
	tsubcctv	%o0,	0x0F19,	%i1
	tpos	%icc,	0x0
	fbo	%fcc1,	loop_1199
	fcmpne16	%f12,	%f4,	%l3
	fble	%fcc1,	loop_1200
	tg	%xcc,	0x7
loop_1199:
	smulcc	%i4,	%l4,	%i2
	smul	%o5,	%o4,	%o3
loop_1200:
	movvs	%icc,	%i7,	%l2
	brnz	%i6,	loop_1201
	nop
	setx	0xB558C2BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9507AC69,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f11,	%f16
	ldd	[%l7 + 0x58],	%o0
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x20] %asi
loop_1201:
	tn	%xcc,	0x0
	edge16	%i0,	%o7,	%g2
	fnands	%f26,	%f15,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x0
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x10
	movrlez	%g5,	0x159,	%o2
	srax	%g4,	%i3,	%l6
	alignaddrl	%l1,	%l0,	%l5
	addccc	%g6,	%i5,	%g7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o6
	udiv	%g1,	0x02AC,	%g3
	alignaddr	%o0,	%i1,	%l3
	smul	%i4,	%l4,	%i2
	xnor	%o5,	%o3,	%i7
	orn	%l2,	0x0092,	%o4
	tne	%icc,	0x3
	sdiv	%o1,	0x09B7,	%i0
	edge32	%i6,	%g2,	%o7
	fmovrde	%g5,	%f24,	%f0
	addccc	%o2,	0x032E,	%i3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g4
	movl	%icc,	%l1,	%l6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	setx	0xE07B65CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	brlz	%l0,	loop_1202
	taddcc	%l5,	0x1FA4,	%i5
	nop
	fitos	%f10,	%f6
	fstod	%f6,	%f4
	addccc	%g6,	0x1C67,	%o6
loop_1202:
	fmul8sux16	%f24,	%f22,	%f0
	edge8n	%g1,	%g7,	%o0
	srl	%g3,	0x0F,	%i1
	array16	%l3,	%i4,	%l4
	fsrc2	%f8,	%f6
	fbn,a	%fcc0,	loop_1203
	umulcc	%o5,	%i2,	%o3
	fpsub16s	%f11,	%f4,	%f22
	edge32l	%i7,	%l2,	%o1
loop_1203:
	edge8ln	%i0,	%i6,	%o4
	tvs	%icc,	0x3
	fmuld8sux16	%f21,	%f4,	%f2
	flush	%l7 + 0x64
	tcs	%icc,	0x4
	tvs	%icc,	0x2
	xnor	%o7,	0x1241,	%g5
	bcc	loop_1204
	ta	%icc,	0x3
	sdiv	%g2,	0x1DB6,	%i3
	tgu	%xcc,	0x7
loop_1204:
	orncc	%o2,	%g4,	%l6
	set	0x08, %g6
	lduwa	[%l7 + %g6] 0x19,	%l1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x44] %asi,	%l0
	movre	%i5,	0x096,	%g6
	stw	%o6,	[%l7 + 0x14]
	sra	%l5,	0x1F,	%g1
	smul	%g7,	%o0,	%i1
	fcmple16	%f16,	%f26,	%g3
	sdivcc	%l3,	0x057F,	%l4
	edge16ln	%o5,	%i4,	%i2
	tsubcctv	%i7,	0x0BD2,	%o3
	brlez,a	%o1,	loop_1205
	swap	[%l7 + 0x30],	%i0
	fmovsg	%xcc,	%f18,	%f13
	alignaddr	%i6,	%o4,	%o7
loop_1205:
	srax	%g5,	%l2,	%i3
	array16	%g2,	%o2,	%g4
	brlz	%l6,	loop_1206
	edge8l	%l0,	%i5,	%l1
	nop
	setx	0x705624A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movneg	%xcc,	%g6,	%l5
loop_1206:
	tg	%icc,	0x7
	addcc	%o6,	%g7,	%g1
	umulcc	%i1,	0x0B05,	%g3
	fmovsg	%xcc,	%f21,	%f22
	movle	%icc,	%o0,	%l4
	nop
	setx	loop_1207,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%o5,	0x0063,	%i4
	orcc	%i2,	%i7,	%o3
	edge8n	%o1,	%l3,	%i0
loop_1207:
	edge8l	%o4,	%o7,	%i6
	fpsub32	%f2,	%f30,	%f2
	tgu	%xcc,	0x0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x30] %asi,	%l2
	fornot1	%f6,	%f28,	%f18
	addcc	%i3,	%g2,	%g5
	orn	%g4,	0x11F2,	%o2
	sll	%l6,	0x13,	%i5
	movrgz	%l0,	%l1,	%l5
	and	%o6,	%g7,	%g6
	fornot1s	%f30,	%f6,	%f19
	stbar
	fexpand	%f9,	%f18
	edge8n	%g1,	%i1,	%g3
	brlez,a	%l4,	loop_1208
	ldstub	[%l7 + 0x3D],	%o0
	fbg	%fcc2,	loop_1209
	ldd	[%l7 + 0x28],	%f0
loop_1208:
	fbule,a	%fcc1,	loop_1210
	be,pt	%xcc,	loop_1211
loop_1209:
	xorcc	%o5,	%i4,	%i2
	tneg	%xcc,	0x5
loop_1210:
	alignaddr	%i7,	%o3,	%l3
loop_1211:
	sir	0x10F7
	fmovdg	%xcc,	%f28,	%f18
	set	0x4A, %i0
	lduha	[%l7 + %i0] 0x15,	%o1
	fmovdle	%xcc,	%f23,	%f2
	orncc	%i0,	%o4,	%i6
	edge32ln	%o7,	%l2,	%g2
	andcc	%i3,	0x12E6,	%g4
	bneg,a,pn	%icc,	loop_1212
	fabsd	%f26,	%f2
	fmuld8sux16	%f27,	%f12,	%f12
	fbule	%fcc1,	loop_1213
loop_1212:
	nop
	setx	loop_1214,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fble	%fcc2,	loop_1215
	edge8ln	%o2,	%l6,	%i5
loop_1213:
	fble	%fcc1,	loop_1216
loop_1214:
	add	%g5,	0x05D9,	%l1
loop_1215:
	movre	%l0,	%o6,	%l5
	fmovdvs	%icc,	%f7,	%f12
loop_1216:
	nop
	fitos	%f4,	%f23
	fstox	%f23,	%f8
	tne	%xcc,	0x3
	or	%g7,	0x10D0,	%g6
	nop
	setx	loop_1217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt16	%f12,	%f30,	%i1
	fmovscs	%icc,	%f31,	%f5
	nop
	fitod	%f26,	%f26
loop_1217:
	addccc	%g3,	%g1,	%o0
	fbo	%fcc0,	loop_1218
	move	%xcc,	%o5,	%i4
	fbl,a	%fcc1,	loop_1219
	xor	%i2,	0x0ED5,	%i7
loop_1218:
	taddcctv	%o3,	%l3,	%l4
	fbule	%fcc1,	loop_1220
loop_1219:
	ta	%icc,	0x7
	tn	%xcc,	0x0
	movrgez	%o1,	0x179,	%i0
loop_1220:
	xnorcc	%i6,	%o4,	%o7
	bleu,a	%xcc,	loop_1221
	subcc	%l2,	0x1F57,	%i3
	edge16ln	%g4,	%o2,	%l6
	fbule	%fcc3,	loop_1222
loop_1221:
	array16	%i5,	%g2,	%l1
	wr	%g0,	0x89,	%asi
	stwa	%l0,	[%l7 + 0x7C] %asi
loop_1222:
	movrne	%o6,	%l5,	%g7
	smulcc	%g6,	0x0727,	%g5
	fxnor	%f4,	%f18,	%f26
	brgz	%g3,	loop_1223
	tl	%icc,	0x6
	fmovrsne	%g1,	%f12,	%f24
	sll	%o0,	0x0A,	%i1
loop_1223:
	smul	%o5,	0x176E,	%i4
	movgu	%icc,	%i7,	%o3
	tvc	%xcc,	0x1
	movrlz	%l3,	0x069,	%l4
	movrgez	%i2,	%o1,	%i6
	addcc	%o4,	0x032C,	%i0
	fpsub16	%f0,	%f2,	%f30
	ldsw	[%l7 + 0x18],	%o7
	ba,pn	%icc,	loop_1224
	andncc	%l2,	%i3,	%o2
	fmul8x16al	%f7,	%f23,	%f20
	tsubcc	%g4,	0x1917,	%l6
loop_1224:
	movvc	%xcc,	%i5,	%g2
	edge32l	%l0,	%l1,	%o6
	tge	%icc,	0x2
	or	%g7,	0x0E30,	%g6
	array8	%g5,	%l5,	%g1
	fmovdl	%icc,	%f15,	%f15
	movrgez	%g3,	0x218,	%i1
	udivcc	%o0,	0x0632,	%o5
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i4
	fmovsge	%xcc,	%f9,	%f18
	alignaddrl	%o3,	%i7,	%l3
	bshuffle	%f16,	%f6,	%f12
	nop
	setx	0x48C06F54,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xF6CB6956,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f27,	%f15
	tne	%xcc,	0x7
	tn	%icc,	0x2
	edge8ln	%l4,	%o1,	%i2
	subccc	%o4,	%i0,	%o7
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x18,	%l2
	orcc	%i6,	0x1B6D,	%o2
	fmovdleu	%icc,	%f29,	%f26
	bcs,pn	%xcc,	loop_1225
	movcs	%icc,	%i3,	%l6
	tvc	%icc,	0x7
	fandnot1s	%f6,	%f27,	%f13
loop_1225:
	fblg,a	%fcc0,	loop_1226
	movge	%xcc,	%i5,	%g2
	xor	%g4,	%l0,	%o6
	movcc	%icc,	%l1,	%g7
loop_1226:
	edge8	%g5,	%l5,	%g6
	sth	%g1,	[%l7 + 0x76]
	fnot1	%f6,	%f0
	ldsh	[%l7 + 0x7A],	%g3
	srl	%i1,	0x0B,	%o5
	movrgez	%o0,	%o3,	%i7
	and	%i4,	0x0625,	%l4
	bne,a,pn	%xcc,	loop_1227
	sir	0x038F
	movvc	%xcc,	%o1,	%i2
	fbu	%fcc3,	loop_1228
loop_1227:
	fmovdne	%icc,	%f20,	%f19
	smul	%o4,	0x0ECE,	%i0
	tsubcctv	%o7,	%l2,	%l3
loop_1228:
	fmovdne	%icc,	%f13,	%f27
	edge8	%o2,	%i6,	%l6
	fcmple16	%f20,	%f10,	%i3
	sethi	0x03C1,	%g2
	tgu	%icc,	0x5
	edge8ln	%i5,	%g4,	%o6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	edge16ln	%l1,	%g7,	%l5
	xor	%g5,	%g1,	%g3
	move	%xcc,	%i1,	%o5
	mulx	%g6,	%o3,	%i7
	udivx	%i4,	0x10F0,	%l4
	fmul8ulx16	%f0,	%f20,	%f4
	movle	%icc,	%o0,	%i2
	fmuld8ulx16	%f13,	%f23,	%f14
	bl,a	loop_1229
	ldsw	[%l7 + 0x0C],	%o1
	movpos	%xcc,	%o4,	%o7
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l2,	[%g0 + 0x188] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_1229:
	srl	%l3,	0x1A,	%i0
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f8
	lduh	[%l7 + 0x08],	%o2
	fmovscc	%icc,	%f21,	%f16
	ldstub	[%l7 + 0x7E],	%i6
	andcc	%l6,	0x0397,	%i3
	tsubcc	%i5,	%g2,	%g4
	subc	%l0,	%l1,	%o6
	movvc	%xcc,	%l5,	%g7
	fbg,a	%fcc3,	loop_1230
	fmovdcc	%icc,	%f20,	%f17
	fnegd	%f28,	%f2
	fcmpeq32	%f18,	%f28,	%g1
loop_1230:
	fmovrsgz	%g3,	%f18,	%f25
	fpadd16s	%f20,	%f4,	%f31
	fcmpeq16	%f6,	%f4,	%i1
	andncc	%o5,	%g5,	%g6
	sdivx	%i7,	0x0E95,	%i4
	movrgz	%o3,	0x177,	%l4
	movrgez	%i2,	%o0,	%o1
	membar	0x43
	edge8ln	%o7,	%o4,	%l2
	sethi	0x1B2F,	%i0
	brz	%l3,	loop_1231
	xnor	%i6,	0x1D80,	%l6
	nop
	set	0x56, %i2
	sth	%o2,	[%l7 + %i2]
	addccc	%i3,	%g2,	%i5
loop_1231:
	tsubcctv	%l0,	0x1C84,	%l1
	fmovsne	%xcc,	%f22,	%f2
	wr	%g0,	0x89,	%asi
	sta	%f25,	[%l7 + 0x1C] %asi
	addccc	%g4,	%l5,	%o6
	movrlez	%g1,	0x031,	%g7
	orn	%i1,	0x1F14,	%g3
	fmovrde	%g5,	%f10,	%f6
	movrgez	%g6,	%i7,	%o5
	movcs	%icc,	%o3,	%l4
	fmovdpos	%xcc,	%f1,	%f22
	set	0x62, %o4
	ldstuba	[%l7 + %o4] 0x10,	%i2
	tle	%xcc,	0x3
	taddcctv	%o0,	0x1E6C,	%o1
	sdivcc	%i4,	0x1FF0,	%o4
	ta	%xcc,	0x3
	nop
	setx	loop_1232,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1s	%f26,	%f19
	nop
	setx	0xD049E0B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	tn	%icc,	0x4
loop_1232:
	array32	%l2,	%i0,	%l3
	edge8n	%i6,	%o7,	%l6
	tge	%icc,	0x3
	edge32	%i3,	%g2,	%i5
	andcc	%l0,	%o2,	%g4
	orcc	%l1,	%l5,	%o6
	tvs	%xcc,	0x7
	movg	%xcc,	%g7,	%g1
	std	%f30,	[%l7 + 0x60]
	umul	%i1,	%g3,	%g5
	movn	%icc,	%g6,	%i7
	fones	%f0
	ta	%icc,	0x4
	fxor	%f20,	%f26,	%f14
	alignaddrl	%o3,	%o5,	%i2
	brnz	%o0,	loop_1233
	xorcc	%l4,	%i4,	%o1
	edge32	%o4,	%l2,	%i0
	wr	%g0,	0x0c,	%asi
	stxa	%l3,	[%l7 + 0x68] %asi
loop_1233:
	nop
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x19,	%f0
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	fmuld8ulx16	%f18,	%f14,	%f6
	stx	%o7,	[%l7 + 0x78]
	xor	%i3,	%l6,	%i5
	fpadd32s	%f18,	%f0,	%f25
	fandnot2s	%f17,	%f27,	%f18
	orncc	%l0,	%g2,	%g4
	and	%l1,	%l5,	%o6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x11] %asi,	%g7
	edge32	%o2,	%g1,	%i1
	move	%xcc,	%g3,	%g5
	tle	%icc,	0x1
	fnors	%f29,	%f21,	%f23
	fbul,a	%fcc2,	loop_1234
	tle	%icc,	0x7
	move	%icc,	%g6,	%o3
	sdiv	%o5,	0x17A1,	%i7
loop_1234:
	bvs,a	loop_1235
	fbe,a	%fcc3,	loop_1236
	edge16l	%o0,	%i2,	%i4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
loop_1235:
	taddcctv	%o1,	%l2,	%o4
loop_1236:
	tcs	%xcc,	0x5
	tvs	%xcc,	0x1
	bvc,pt	%xcc,	loop_1237
	fmovsl	%xcc,	%f0,	%f15
	tcs	%icc,	0x5
	fcmple16	%f4,	%f18,	%i0
loop_1237:
	sdivx	%i6,	0x124D,	%l3
	sdiv	%o7,	0x127B,	%i3
	movcc	%xcc,	%i5,	%l0
	alignaddr	%g2,	%g4,	%l6
	sdivx	%l5,	0x1C57,	%l1
	srax	%o6,	%g7,	%o2
	movrgz	%i1,	%g3,	%g5
	brgz	%g1,	loop_1238
	edge32n	%o3,	%g6,	%o5
	fmovdle	%icc,	%f3,	%f11
	fsrc1s	%f21,	%f21
loop_1238:
	fmovrslez	%i7,	%f23,	%f25
	fmovdcs	%icc,	%f12,	%f19
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i4
	st	%f11,	[%l7 + 0x18]
	te	%icc,	0x4
	tgu	%icc,	0x3
	taddcctv	%o0,	%o1,	%l2
	fmovsa	%icc,	%f30,	%f21
	addcc	%l4,	0x03B4,	%o4
	tle	%xcc,	0x6
	sdivcc	%i0,	0x0387,	%i6
	tcc	%icc,	0x4
	tn	%xcc,	0x3
	fbge,a	%fcc3,	loop_1239
	movn	%icc,	%o7,	%l3
	nop
	fitos	%f12,	%f24
	fstoi	%f24,	%f30
	fcmpgt16	%f14,	%f14,	%i3
loop_1239:
	ta	%xcc,	0x7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l0,	%g2
	edge32l	%i5,	%l6,	%l5
	bshuffle	%f18,	%f16,	%f12
	brlz	%l1,	loop_1240
	nop
	setx	0x35FB1234,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x6847AD21,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f19,	%f15
	fcmpgt32	%f26,	%f12,	%g4
	orn	%o6,	%o2,	%i1
loop_1240:
	fmovdcs	%xcc,	%f8,	%f23
	bcs,pn	%xcc,	loop_1241
	umulcc	%g7,	0x1390,	%g5
	movrlez	%g3,	0x1B4,	%o3
	edge8n	%g6,	%o5,	%i7
loop_1241:
	tleu	%icc,	0x3
	ba	loop_1242
	fbug,a	%fcc1,	loop_1243
	stw	%g1,	[%l7 + 0x5C]
	ld	[%l7 + 0x08],	%f21
loop_1242:
	membar	0x59
loop_1243:
	fmovsgu	%xcc,	%f15,	%f16
	bvc	loop_1244
	orcc	%i2,	%o0,	%i4
	smul	%l2,	0x137F,	%l4
	umulcc	%o4,	0x0968,	%i0
loop_1244:
	tge	%icc,	0x5
	tsubcc	%o1,	0x1000,	%o7
	bcs,pn	%icc,	loop_1245
	xor	%i6,	%i3,	%l3
	edge32l	%l0,	%i5,	%g2
	edge16	%l5,	%l6,	%g4
loop_1245:
	fbg	%fcc2,	loop_1246
	nop
	setx	loop_1247,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%l1,	0x0946,	%o6
	taddcctv	%i1,	%o2,	%g5
loop_1246:
	stb	%g7,	[%l7 + 0x3F]
loop_1247:
	movrgz	%o3,	0x078,	%g3
	tle	%xcc,	0x5
	array16	%o5,	%i7,	%g1
	popc	0x1769,	%i2
	movle	%xcc,	%o0,	%g6
	fpsub16	%f0,	%f6,	%f22
	srlx	%l2,	0x14,	%l4
	fmovrdlz	%o4,	%f22,	%f28
	addccc	%i0,	%o1,	%o7
	edge16l	%i4,	%i6,	%i3
	ba,pn	%icc,	loop_1248
	fxor	%f0,	%f30,	%f26
	std	%f22,	[%l7 + 0x18]
	set	0x79, %g3
	ldstuba	[%l7 + %g3] 0x04,	%l3
loop_1248:
	edge16l	%l0,	%g2,	%l5
	bvc,pn	%xcc,	loop_1249
	movl	%xcc,	%l6,	%i5
	fzero	%f4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%g4
loop_1249:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i1
	fnot2s	%f13,	%f31
	set	0x21, %i7
	stba	%o2,	[%l7 + %i7] 0xeb
	membar	#Sync
	sethi	0x1223,	%o6
	fmovsl	%xcc,	%f9,	%f15
	fmovsl	%icc,	%f27,	%f7
	mulx	%g5,	0x0DE4,	%g7
	fnors	%f11,	%f11,	%f12
	tgu	%icc,	0x5
	movn	%icc,	%g3,	%o5
	tcc	%xcc,	0x1
	set	0x4E, %g5
	lduha	[%l7 + %g5] 0x04,	%i7
	fble	%fcc0,	loop_1250
	fmovsneg	%xcc,	%f25,	%f23
	sdivcc	%o3,	0x020C,	%i2
	fmovdpos	%icc,	%f1,	%f14
loop_1250:
	sdivcc	%g1,	0x0BCC,	%o0
	te	%icc,	0x2
	st	%f1,	[%l7 + 0x18]
	sdivx	%l2,	0x1A7E,	%g6
	popc	0x164E,	%o4
	subccc	%i0,	0x003D,	%l4
	fxnors	%f14,	%f5,	%f26
	ta	%xcc,	0x5
	fmovsg	%icc,	%f0,	%f6
	fmovsneg	%icc,	%f3,	%f2
	smulcc	%o1,	0x170D,	%i4
	movpos	%icc,	%o7,	%i3
	move	%xcc,	%i6,	%l0
	nop
	setx	0xC88AF9AFD5758F2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x53F29FB313F5F3FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f14,	%f28
	orncc	%g2,	%l5,	%l3
	edge32	%l6,	%i5,	%g4
	fabss	%f21,	%f8
	st	%f5,	[%l7 + 0x6C]
	mulscc	%l1,	0x1027,	%i1
	tgu	%icc,	0x4
	brlz,a	%o2,	loop_1251
	edge8	%g5,	%o6,	%g7
	tcs	%xcc,	0x0
	fmovdg	%xcc,	%f0,	%f31
loop_1251:
	srlx	%o5,	%i7,	%g3
	nop
	setx	loop_1252,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlez	%i2,	loop_1253
	ldsb	[%l7 + 0x7F],	%o3
	brlez,a	%o0,	loop_1254
loop_1252:
	fpsub16	%f20,	%f26,	%f8
loop_1253:
	movn	%icc,	%g1,	%g6
	brnz	%o4,	loop_1255
loop_1254:
	fcmpgt16	%f30,	%f26,	%l2
	and	%i0,	0x0948,	%o1
	fmuld8sux16	%f11,	%f2,	%f30
loop_1255:
	or	%l4,	%i4,	%o7
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x7C] %asi,	%i6
	mova	%icc,	%i3,	%g2
	tneg	%xcc,	0x1
	bvs,a,pn	%xcc,	loop_1256
	tsubcc	%l5,	%l3,	%l0
	bpos,pt	%xcc,	loop_1257
	nop
	fitod	%f4,	%f30
	fdtos	%f30,	%f23
loop_1256:
	edge32ln	%l6,	%g4,	%i5
	umulcc	%i1,	0x154E,	%l1
loop_1257:
	stw	%o2,	[%l7 + 0x08]
	movvc	%icc,	%g5,	%o6
	tsubcc	%g7,	0x1DAD,	%i7
	movg	%xcc,	%o5,	%i2
	fsrc1s	%f0,	%f3
	stw	%g3,	[%l7 + 0x68]
	orncc	%o3,	%g1,	%g6
	orncc	%o0,	%o4,	%i0
	array8	%l2,	%o1,	%i4
	mova	%icc,	%o7,	%l4
	xnorcc	%i6,	0x1FD5,	%g2
	movn	%xcc,	%i3,	%l5
	edge32l	%l3,	%l6,	%l0
	xorcc	%g4,	%i5,	%i1
	tl	%xcc,	0x4
	udiv	%l1,	0x156A,	%o2
	tvc	%xcc,	0x6
	movleu	%icc,	%g5,	%g7
	edge16ln	%o6,	%o5,	%i2
	nop
	setx	0x79E0B465A0780463,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	tsubcc	%i7,	0x176D,	%g3
	udiv	%o3,	0x1153,	%g1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o0
	movvc	%xcc,	%o4,	%i0
	fxnors	%f30,	%f17,	%f20
	fbule	%fcc3,	loop_1258
	add	%l2,	%o1,	%i4
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
loop_1258:
	movleu	%xcc,	%o7,	%l4
	bneg	loop_1259
	srlx	%i6,	0x19,	%g2
	ta	%icc,	0x0
	andncc	%i3,	%l5,	%l3
loop_1259:
	fmovsneg	%xcc,	%f23,	%f20
	tl	%icc,	0x6
	fblg,a	%fcc2,	loop_1260
	fbug	%fcc0,	loop_1261
	fmuld8sux16	%f29,	%f24,	%f12
	set	0x4C, %g1
	lda	[%l7 + %g1] 0x19,	%f12
loop_1260:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
loop_1261:
	std	%f24,	[%l7 + 0x38]
	edge16l	%l0,	%g4,	%i1
	fmul8sux16	%f6,	%f16,	%f20
	brlez,a	%l1,	loop_1262
	or	%o2,	0x1F31,	%g5
	tcs	%xcc,	0x1
	membar	0x3E
loop_1262:
	fbl,a	%fcc1,	loop_1263
	alignaddr	%i5,	%g7,	%o6
	fbu	%fcc3,	loop_1264
	taddcc	%i2,	%o5,	%i7
loop_1263:
	fmovse	%xcc,	%f16,	%f17
	ldsw	[%l7 + 0x08],	%o3
loop_1264:
	ldx	[%l7 + 0x20],	%g3
	bl,a,pn	%icc,	loop_1265
	std	%f6,	[%l7 + 0x28]
	fpsub32s	%f5,	%f11,	%f16
	andcc	%o0,	%o4,	%g1
loop_1265:
	andn	%l2,	0x0AFD,	%o1
	and	%i0,	%i4,	%o7
	sub	%l4,	%g6,	%g2
	edge16ln	%i3,	%l5,	%l3
	sethi	0x0C08,	%l6
	edge8	%l0,	%i6,	%g4
	fsrc1s	%f20,	%f12
	sethi	0x1C23,	%l1
	ta	%xcc,	0x3
	sethi	0x19A2,	%i1
	sir	0x0090
	fbn,a	%fcc0,	loop_1266
	sub	%g5,	%i5,	%o2
	stbar
	fnand	%f18,	%f0,	%f4
loop_1266:
	std	%f16,	[%l7 + 0x40]
	set	0x40, %l1
	stwa	%g7,	[%l7 + %l1] 0x22
	membar	#Sync
	bn	%xcc,	loop_1267
	edge32n	%o6,	%i2,	%o5
	tgu	%xcc,	0x0
	fornot2s	%f15,	%f6,	%f20
loop_1267:
	fble,a	%fcc0,	loop_1268
	tgu	%icc,	0x5
	prefetch	[%l7 + 0x18],	 0x0
	movge	%icc,	%o3,	%g3
loop_1268:
	tneg	%xcc,	0x6
	fmul8sux16	%f26,	%f20,	%f20
	bl,a,pt	%icc,	loop_1269
	fmovd	%f28,	%f22
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%o0
loop_1269:
	fnegd	%f28,	%f28
	sth	%i7,	[%l7 + 0x18]
	edge32n	%o4,	%l2,	%g1
	movle	%xcc,	%i0,	%i4
	movg	%icc,	%o7,	%o1
	movne	%xcc,	%l4,	%g6
	fmovdle	%icc,	%f28,	%f16
	ldsb	[%l7 + 0x54],	%g2
	sir	0x1F48
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x4C] %asi,	%f10
	movrgz	%l5,	0x3C7,	%l3
	edge8ln	%l6,	%i3,	%l0
	be,a	%xcc,	loop_1270
	fblg,a	%fcc0,	loop_1271
	alignaddr	%i6,	%g4,	%l1
	xnorcc	%i1,	%g5,	%i5
loop_1270:
	movg	%icc,	%o2,	%g7
loop_1271:
	nop
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x04,	%i2
	fnegd	%f16,	%f24
	subccc	%o6,	0x02BB,	%o5
	sub	%g3,	0x070C,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f14,	%f28,	%f4
	fmovrslez	%i7,	%f10,	%f18
	bg	%icc,	loop_1272
	bneg,pn	%xcc,	loop_1273
	bvs,a,pn	%xcc,	loop_1274
	array16	%o4,	%o0,	%g1
loop_1272:
	fcmpne32	%f20,	%f14,	%l2
loop_1273:
	movne	%icc,	%i0,	%i4
loop_1274:
	fcmpeq32	%f30,	%f14,	%o1
	set	0x10, %o0
	lda	[%l7 + %o0] 0x10,	%f15
	fba	%fcc3,	loop_1275
	fmovdle	%xcc,	%f6,	%f28
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o7
loop_1275:
	smul	%g6,	%l4,	%l5
	orcc	%l3,	%l6,	%i3
	ba,a,pt	%icc,	loop_1276
	fmovrslez	%g2,	%f7,	%f13
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x39] %asi,	%i6
loop_1276:
	andcc	%l0,	%g4,	%l1
	udivcc	%g5,	0x1EC4,	%i1
	fmuld8sux16	%f20,	%f21,	%f2
	popc	%o2,	%i5
	fnot1	%f26,	%f6
	bvs	%icc,	loop_1277
	orncc	%g7,	0x093A,	%i2
	fbu	%fcc3,	loop_1278
	movrne	%o5,	0x3A9,	%g3
loop_1277:
	movle	%xcc,	%o3,	%i7
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%o4
loop_1278:
	addccc	%o0,	0x1A3B,	%g1
	sra	%l2,	0x0C,	%o6
	fabss	%f27,	%f2
	fble,a	%fcc3,	loop_1279
	tle	%xcc,	0x6
	bl,a,pt	%icc,	loop_1280
	fzero	%f22
loop_1279:
	alignaddrl	%i0,	%i4,	%o1
	orncc	%o7,	0x0CBA,	%g6
loop_1280:
	tsubcc	%l5,	%l4,	%l3
	movvs	%xcc,	%l6,	%g2
	nop
	setx	0x9B10C6351541374C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x0D1C55E61A923FD6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f4,	%f30
	taddcctv	%i3,	0x0433,	%i6
	brlez,a	%l0,	loop_1281
	mulscc	%g4,	%g5,	%l1
	tcs	%xcc,	0x3
	and	%o2,	%i5,	%g7
loop_1281:
	fxnor	%f12,	%f22,	%f14
	fmovsn	%icc,	%f4,	%f2
	fnot2s	%f19,	%f25
	fpsub16	%f18,	%f2,	%f24
	mulscc	%i1,	%i2,	%g3
	smul	%o3,	%o5,	%i7
	movn	%icc,	%o4,	%o0
	bleu,a	loop_1282
	fzeros	%f9
	bcc,a,pt	%icc,	loop_1283
	call	loop_1284
loop_1282:
	tl	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1283:
	brlez,a	%l2,	loop_1285
loop_1284:
	fbue	%fcc0,	loop_1286
	bl	%xcc,	loop_1287
	andncc	%o6,	%i0,	%g1
loop_1285:
	fmovscs	%icc,	%f31,	%f23
loop_1286:
	sdivx	%i4,	0x120A,	%o7
loop_1287:
	fnands	%f31,	%f2,	%f2
	array16	%g6,	%o1,	%l5
	fba,a	%fcc2,	loop_1288
	tne	%xcc,	0x5
	movrlez	%l4,	0x11E,	%l3
	edge32ln	%l6,	%i3,	%i6
loop_1288:
	flush	%l7 + 0x08
	movrne	%g2,	0x25D,	%g4
	ta	%icc,	0x0
	taddcc	%g5,	%l0,	%l1
	andcc	%o2,	0x18FC,	%g7
	fbn,a	%fcc3,	loop_1289
	add	%i5,	%i1,	%g3
	sll	%o3,	%o5,	%i2
	fnot2	%f2,	%f4
loop_1289:
	fandnot2	%f24,	%f30,	%f4
	flush	%l7 + 0x0C
	umulcc	%o4,	%o0,	%l2
	fnot1	%f24,	%f2
	fmovrsne	%o6,	%f6,	%f11
	movg	%xcc,	%i7,	%g1
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i0
	fmovrsgz	%i4,	%f30,	%f16
	fmovdle	%icc,	%f7,	%f11
	fbule,a	%fcc1,	loop_1290
	subccc	%g6,	%o7,	%l5
	array16	%o1,	%l4,	%l6
	movrne	%i3,	%l3,	%i6
loop_1290:
	andncc	%g2,	%g5,	%g4
	sub	%l0,	%l1,	%o2
	fandnot2	%f30,	%f10,	%f16
	umulcc	%i5,	%g7,	%g3
	brnz	%i1,	loop_1291
	stbar
	edge16ln	%o3,	%o5,	%i2
	smul	%o0,	0x0A2B,	%l2
loop_1291:
	movneg	%icc,	%o6,	%o4
	subc	%i7,	0x1095,	%g1
	bg	loop_1292
	ld	[%l7 + 0x58],	%f16
	tl	%xcc,	0x2
	tg	%icc,	0x3
loop_1292:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%i4
	tcc	%icc,	0x0
	fbl	%fcc3,	loop_1293
	movpos	%icc,	%g6,	%o7
	or	%o1,	0x06F2,	%l5
	movpos	%icc,	%l4,	%l6
loop_1293:
	fmovdle	%xcc,	%f22,	%f7
	fcmpgt32	%f28,	%f24,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i6,	%i3,	%g2
	fnand	%f6,	%f30,	%f16
	tleu	%icc,	0x4
	udivcc	%g4,	0x1427,	%g5
	nop
	setx	loop_1294,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bge,a,pt	%xcc,	loop_1295
	subc	%l1,	%l0,	%i5
	sll	%o2,	0x15,	%g3
loop_1294:
	bl	%xcc,	loop_1296
loop_1295:
	call	loop_1297
	edge8l	%g7,	%i1,	%o3
	nop
	setx	0xBF2DB4267A5818DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x04B15B9C22C5BD06,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f20,	%f30
loop_1296:
	sll	%i2,	0x1C,	%o0
loop_1297:
	udiv	%o5,	0x1371,	%l2
	bge	loop_1298
	array8	%o6,	%o4,	%g1
	fmul8ulx16	%f16,	%f2,	%f28
	be,a,pn	%xcc,	loop_1299
loop_1298:
	bgu	loop_1300
	edge8l	%i7,	%i0,	%i4
	movleu	%xcc,	%g6,	%o1
loop_1299:
	sdivcc	%o7,	0x087A,	%l5
loop_1300:
	sll	%l6,	0x1D,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x19,	%i6,	%l3
	array8	%g2,	%i3,	%g5
	tvc	%icc,	0x0
	edge32	%l1,	%g4,	%i5
	tcs	%xcc,	0x7
	movrlz	%l0,	0x131,	%g3
	wr	%g0,	0x0c,	%asi
	sta	%f5,	[%l7 + 0x1C] %asi
	edge16l	%o2,	%i1,	%o3
	ld	[%l7 + 0x58],	%f5
	movrne	%i2,	0x37D,	%o0
	addccc	%o5,	0x1C37,	%l2
	tneg	%xcc,	0x6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%g7
	membar	0x2C
	lduh	[%l7 + 0x32],	%o4
	edge32ln	%g1,	%i7,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a	loop_1301
	nop
	fitos	%f31,	%f2
	srl	%i0,	0x06,	%g6
	movleu	%icc,	%o1,	%l5
loop_1301:
	fmul8x16	%f4,	%f12,	%f16
	movrlz	%l6,	0x210,	%l4
	umulcc	%i6,	%o7,	%l3
	ble	%xcc,	loop_1302
	movleu	%xcc,	%g2,	%i3
	sir	0x1234
	fmovsne	%icc,	%f1,	%f9
loop_1302:
	be	loop_1303
	fmovrde	%l1,	%f24,	%f2
	fmovrsne	%g5,	%f7,	%f20
	mulscc	%i5,	0x1F6A,	%l0
loop_1303:
	fbug,a	%fcc3,	loop_1304
	fbl,a	%fcc3,	loop_1305
	st	%f24,	[%l7 + 0x58]
	lduw	[%l7 + 0x2C],	%g4
loop_1304:
	fmovscs	%icc,	%f31,	%f31
loop_1305:
	fmovscc	%icc,	%f20,	%f18
	movge	%xcc,	%o2,	%g3
	fmovse	%xcc,	%f12,	%f5
	movcs	%xcc,	%i1,	%o3
	tneg	%icc,	0x5
	tcs	%icc,	0x0
	tvs	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x38] %asi,	%f10
	fcmpgt32	%f28,	%f6,	%o0
	ta	%icc,	0x2
	udiv	%o5,	0x1A5F,	%i2
	alignaddrl	%o6,	%g7,	%o4
	movge	%icc,	%l2,	%g1
	srl	%i7,	0x00,	%i0
	tsubcctv	%g6,	0x1D27,	%i4
	fmovrsgez	%o1,	%f19,	%f19
	wr	%g0,	0x27,	%asi
	stxa	%l5,	[%l7 + 0x70] %asi
	membar	#Sync
	array16	%l4,	%l6,	%i6
	fmovdne	%icc,	%f27,	%f4
	swap	[%l7 + 0x48],	%o7
	tge	%icc,	0x6
	array32	%l3,	%i3,	%l1
	movcc	%icc,	%g2,	%g5
	subcc	%i5,	%l0,	%o2
	tpos	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f8,	%f15,	%f21
	brnz	%g4,	loop_1306
	edge8l	%g3,	%i1,	%o0
	addcc	%o5,	%o3,	%o6
	movrgez	%i2,	%o4,	%l2
loop_1306:
	fcmpne32	%f28,	%f4,	%g1
	andcc	%i7,	%i0,	%g7
	mulscc	%g6,	0x16B7,	%o1
	movle	%icc,	%l5,	%l4
	tg	%icc,	0x5
	tn	%icc,	0x0
	nop
	fitos	%f7,	%f3
	fornot1s	%f5,	%f12,	%f16
	fexpand	%f27,	%f4
	ldsh	[%l7 + 0x26],	%i4
	nop
	setx	0x3A60F02CD7E44926,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x450CE09FE0E8580B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f18
	fbue	%fcc0,	loop_1307
	movg	%icc,	%l6,	%o7
	edge32ln	%i6,	%l3,	%l1
	addccc	%i3,	0x12A9,	%g2
loop_1307:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i5,	%g5
	subc	%o2,	%g4,	%l0
	fors	%f0,	%f2,	%f31
	edge8ln	%g3,	%o0,	%i1
	xnor	%o5,	0x0304,	%o3
	bge,a,pt	%icc,	loop_1308
	fmovsge	%icc,	%f8,	%f9
	bneg,a,pt	%icc,	loop_1309
	nop
	setx	0xF95F2CC71C1D7677,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
loop_1308:
	tge	%xcc,	0x5
	bn,pn	%xcc,	loop_1310
loop_1309:
	fmovdl	%icc,	%f14,	%f27
	fandnot2	%f24,	%f30,	%f14
	te	%icc,	0x6
loop_1310:
	bn,a,pn	%xcc,	loop_1311
	fmovrde	%o6,	%f14,	%f4
	edge16	%o4,	%i2,	%g1
	fzeros	%f3
loop_1311:
	fmovda	%icc,	%f21,	%f4
	tpos	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x1586,	%l2
	fblg	%fcc3,	loop_1312
	edge16	%i0,	%g7,	%g6
	orncc	%o1,	%l4,	%i4
	tvc	%icc,	0x2
loop_1312:
	faligndata	%f30,	%f4,	%f22
	ldsb	[%l7 + 0x14],	%l6
	sllx	%o7,	0x1B,	%i6
	movl	%icc,	%l5,	%l1
	bl,a,pt	%icc,	loop_1313
	sll	%l3,	0x14,	%g2
	fexpand	%f28,	%f4
	call	loop_1314
loop_1313:
	srlx	%i3,	0x0C,	%g5
	popc	0x1D3A,	%i5
	wr	%g0,	0x88,	%asi
	stba	%o2,	[%l7 + 0x63] %asi
loop_1314:
	fmovdcs	%xcc,	%f2,	%f0
	tle	%icc,	0x4
	fmovsleu	%icc,	%f14,	%f18
	alignaddrl	%g4,	%l0,	%g3
	mulscc	%o0,	0x0E7E,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%i1,	%f6,	%f18
	tpos	%icc,	0x1
	nop
	setx	0x43D9B7BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xA6935B7A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f13,	%f21
	fmul8ulx16	%f10,	%f22,	%f20
	fnand	%f0,	%f14,	%f10
	tle	%xcc,	0x1
	tle	%icc,	0x5
	edge16	%o3,	%o6,	%i2
	movl	%icc,	%g1,	%o4
	sdivx	%i7,	0x0236,	%l2
	movle	%xcc,	%i0,	%g7
	sllx	%g6,	%o1,	%i4
	membar	0x17
	fbuge,a	%fcc3,	loop_1315
	st	%f10,	[%l7 + 0x30]
	tsubcctv	%l4,	%l6,	%i6
	fmovdle	%xcc,	%f0,	%f20
loop_1315:
	tsubcctv	%o7,	0x16D9,	%l5
	fors	%f2,	%f25,	%f6
	array8	%l3,	%g2,	%i3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tge	%icc,	0x1
	edge8ln	%l1,	%i5,	%g5
	fbe,a	%fcc0,	loop_1316
	movgu	%icc,	%g4,	%o2
	tcs	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1316:
	fmovrsne	%l0,	%f11,	%f0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g3
	fbuge	%fcc0,	loop_1317
	umulcc	%o0,	%o5,	%i1
	fmovde	%icc,	%f20,	%f20
	prefetch	[%l7 + 0x70],	 0x1
loop_1317:
	bcs	loop_1318
	nop
	setx	0xEBC8D3C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x32395B71,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f24,	%f1
	fbug,a	%fcc0,	loop_1319
	st	%f19,	[%l7 + 0x18]
loop_1318:
	fmovsleu	%icc,	%f5,	%f31
	fmovdcc	%icc,	%f17,	%f16
loop_1319:
	fmovsvs	%icc,	%f25,	%f16
	fmovrde	%o6,	%f28,	%f8
	movneg	%xcc,	%i2,	%g1
	fmovsvc	%xcc,	%f0,	%f10
	edge8	%o3,	%o4,	%i7
	and	%i0,	%l2,	%g7
	andn	%g6,	%i4,	%o1
	sdiv	%l6,	0x0C79,	%l4
	te	%xcc,	0x7
	nop
	setx	0xC0050EBB3ABA2A70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xCCB0355B37C61067,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f14,	%f22
	orcc	%o7,	0x168E,	%l5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%g2
	movleu	%icc,	%i6,	%l1
	fsrc2	%f28,	%f28
	nop
	setx	0x605FCBDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	tneg	%xcc,	0x6
	tvs	%xcc,	0x5
	bvc,a	%icc,	loop_1320
	prefetch	[%l7 + 0x58],	 0x0
	sra	%i3,	%g5,	%g4
	fmovsleu	%icc,	%f7,	%f17
loop_1320:
	addc	%i5,	%o2,	%g3
	fmovsl	%icc,	%f23,	%f0
	udivx	%l0,	0x15AB,	%o0
	edge16l	%i1,	%o5,	%o6
	andn	%g1,	0x093D,	%i2
	sdivx	%o3,	0x1E3B,	%o4
	ta	%icc,	0x2
	fpadd32	%f6,	%f20,	%f20
	fpsub16s	%f25,	%f17,	%f24
	fnands	%f29,	%f14,	%f13
	edge8n	%i7,	%i0,	%l2
	movn	%icc,	%g6,	%g7
	sdiv	%i4,	0x1EE9,	%l6
	fmovdvc	%icc,	%f29,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l4,	0x14C0,	%o1
	nop
	setx	loop_1321,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe,a	%fcc1,	loop_1322
	sub	%l5,	%l3,	%o7
	tcs	%icc,	0x3
loop_1321:
	movcc	%xcc,	%g2,	%i6
loop_1322:
	te	%icc,	0x4
	taddcc	%i3,	%l1,	%g5
	edge16ln	%i5,	%o2,	%g4
	sdivx	%g3,	0x1DC8,	%o0
	taddcctv	%l0,	0x1BB9,	%o5
	fbl,a	%fcc2,	loop_1323
	array32	%i1,	%o6,	%g1
	for	%f30,	%f12,	%f22
	orn	%i2,	%o4,	%i7
loop_1323:
	fbue,a	%fcc0,	loop_1324
	udiv	%i0,	0x10A4,	%o3
	set	0x6C, %o6
	stba	%g6,	[%l7 + %o6] 0x11
loop_1324:
	movvs	%xcc,	%l2,	%i4
	movre	%l6,	0x378,	%l4
	movrne	%g7,	%l5,	%l3
	tsubcc	%o7,	%g2,	%o1
	edge32ln	%i6,	%i3,	%g5
	brz	%i5,	loop_1325
	stx	%o2,	[%l7 + 0x20]
	movn	%xcc,	%g4,	%g3
	tvs	%xcc,	0x5
loop_1325:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x6C] %asi
	fandnot2s	%f21,	%f13,	%f30
	fbo	%fcc0,	loop_1326
	te	%xcc,	0x5
	fmovdl	%icc,	%f25,	%f3
	movrlez	%l1,	0x363,	%o0
loop_1326:
	movpos	%xcc,	%o5,	%i1
	movvs	%xcc,	%l0,	%g1
	brgez	%o6,	loop_1327
	tvs	%icc,	0x7
	smulcc	%i2,	%i7,	%o4
	edge8ln	%i0,	%o3,	%g6
loop_1327:
	fpackfix	%f26,	%f20
	edge16ln	%i4,	%l6,	%l4
	orcc	%l2,	0x04D4,	%l5
	tsubcc	%l3,	%g7,	%o7
	alignaddrl	%o1,	%i6,	%g2
	srlx	%i3,	%g5,	%i5
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f30
	move	%icc,	%g4,	%o2
	fmul8x16	%f19,	%f24,	%f0
	taddcctv	%l1,	%o0,	%g3
	tn	%xcc,	0x1
	umulcc	%o5,	0x1FEB,	%i1
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x11,	 0x2
	array16	%o6,	%g1,	%i7
	tg	%icc,	0x4
	array8	%i2,	%i0,	%o4
	movrlz	%o3,	%g6,	%i4
	movcs	%icc,	%l6,	%l2
	fsrc1	%f26,	%f4
	taddcc	%l5,	%l3,	%g7
	fble,a	%fcc1,	loop_1328
	move	%xcc,	%o7,	%o1
	xnor	%i6,	%g2,	%i3
	array8	%l4,	%g5,	%g4
loop_1328:
	array32	%i5,	%l1,	%o0
	fmovsle	%xcc,	%f2,	%f18
	sdivx	%g3,	0x175B,	%o5
	edge32	%i1,	%l0,	%o6
	set	0x44, %i3
	sta	%f11,	[%l7 + %i3] 0x18
	nop
	setx	0x5A645B91707BD863,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	popc	0x0DEA,	%g1
	andn	%o2,	%i2,	%i0
	sth	%i7,	[%l7 + 0x68]
	tl	%icc,	0x7
	edge8l	%o4,	%g6,	%i4
	xnorcc	%l6,	%o3,	%l5
	swap	[%l7 + 0x18],	%l2
	and	%l3,	0x1D81,	%g7
	movvc	%icc,	%o7,	%i6
	sir	0x0839
	edge32n	%g2,	%o1,	%l4
	be	%xcc,	loop_1329
	xnor	%i3,	0x0123,	%g5
	fmovrslez	%g4,	%f25,	%f27
	fsrc1s	%f9,	%f3
loop_1329:
	subc	%l1,	0x1D37,	%o0
	edge16l	%g3,	%o5,	%i1
	array8	%i5,	%o6,	%g1
	fornot1	%f20,	%f26,	%f28
	fbuge	%fcc0,	loop_1330
	fmovrslz	%l0,	%f31,	%f16
	brnz,a	%o2,	loop_1331
	array16	%i0,	%i2,	%o4
loop_1330:
	std	%f30,	[%l7 + 0x58]
	lduh	[%l7 + 0x0E],	%i7
loop_1331:
	array32	%g6,	%i4,	%l6
	tgu	%icc,	0x6
	set	0x18, %o3
	swapa	[%l7 + %o3] 0x80,	%l5
	mulx	%o3,	%l3,	%l2
	mulx	%o7,	%i6,	%g2
	movrgez	%g7,	%o1,	%i3
	movcs	%xcc,	%l4,	%g4
	addc	%l1,	0x15C5,	%o0
	orncc	%g3,	0x144B,	%g5
	nop
	setx	loop_1332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%i1,	%i5
	orn	%o6,	%g1,	%o5
	movne	%icc,	%o2,	%l0
loop_1332:
	nop
	set	0x0A, %o1
	stha	%i0,	[%l7 + %o1] 0xea
	membar	#Sync
	fmul8x16al	%f21,	%f3,	%f14
	umul	%o4,	%i7,	%g6
	edge8n	%i2,	%i4,	%l6
	fabss	%f17,	%f14
	edge32n	%o3,	%l3,	%l2
	tl	%icc,	0x6
	fmovrsgez	%l5,	%f25,	%f15
	srlx	%i6,	%g2,	%o7
	array8	%g7,	%o1,	%l4
	movneg	%xcc,	%g4,	%l1
	orcc	%i3,	0x0AB0,	%g3
	nop
	setx	loop_1333,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnegd	%f6,	%f12
	array8	%o0,	%g5,	%i5
	fmovrsne	%i1,	%f28,	%f30
loop_1333:
	bleu,pn	%icc,	loop_1334
	tle	%xcc,	0x6
	array16	%g1,	%o6,	%o2
	srlx	%o5,	0x1B,	%i0
loop_1334:
	fbo,a	%fcc2,	loop_1335
	umulcc	%o4,	%i7,	%g6
	taddcctv	%i2,	0x10A3,	%l0
	fmovsl	%xcc,	%f13,	%f1
loop_1335:
	sub	%i4,	0x14D5,	%l6
	movrgz	%o3,	0x2DB,	%l3
	fmovsge	%icc,	%f7,	%f19
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f13
	movvs	%xcc,	%l2,	%l5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x14,	%f16
	nop
	setx	0xA1C543610EAB6392,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xAD06822C52220D32,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f4,	%f26
	fpadd16	%f22,	%f4,	%f4
	tvc	%xcc,	0x0
	orcc	%i6,	%g2,	%o7
	movle	%xcc,	%o1,	%g7
	fnot2s	%f5,	%f29
	tge	%xcc,	0x3
	tvs	%icc,	0x7
	std	%f16,	[%l7 + 0x58]
	bneg	loop_1336
	movn	%xcc,	%g4,	%l4
	edge16ln	%i3,	%g3,	%o0
	fmovdneg	%icc,	%f7,	%f7
loop_1336:
	fnor	%f6,	%f26,	%f2
	bn,pt	%xcc,	loop_1337
	fblg,a	%fcc1,	loop_1338
	movle	%icc,	%l1,	%i5
	nop
	setx	0x2D087DE73231460F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2B0EB631230141F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f10,	%f0
loop_1337:
	subcc	%g5,	0x136F,	%i1
loop_1338:
	nop
	fitos	%f6,	%f9
	fstox	%f9,	%f16
	fxtos	%f16,	%f3
	sethi	0x188D,	%o6
	movl	%icc,	%g1,	%o2
	srax	%i0,	%o4,	%o5
	array8	%g6,	%i7,	%l0
	fbu,a	%fcc2,	loop_1339
	movre	%i4,	0x3CE,	%l6
	srl	%o3,	0x1B,	%i2
	tl	%icc,	0x7
loop_1339:
	brgez	%l2,	loop_1340
	ldsh	[%l7 + 0x6E],	%l3
	movre	%l5,	%g2,	%o7
	movg	%xcc,	%i6,	%g7
loop_1340:
	andcc	%o1,	%l4,	%g4
	wr	%g0,	0x89,	%asi
	stwa	%i3,	[%l7 + 0x14] %asi
	set	0x20, %o7
	ldda	[%l7 + %o7] 0x14,	%o0
	bleu	loop_1341
	movvs	%xcc,	%l1,	%g3
	tg	%icc,	0x1
	taddcc	%g5,	0x0E66,	%i5
loop_1341:
	nop
	fitod	%f14,	%f10
	fmovdcs	%xcc,	%f24,	%f0
	set	0x7E, %l3
	lduha	[%l7 + %l3] 0x89,	%o6
	andncc	%i1,	%o2,	%i0
	fmovda	%xcc,	%f4,	%f21
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x14
	mulscc	%g1,	0x1483,	%o4
	tneg	%xcc,	0x5
	fpack32	%f2,	%f24,	%f8
	bvc,a	%icc,	loop_1342
	fcmpne32	%f14,	%f26,	%g6
	alignaddr	%i7,	%o5,	%l0
	xor	%l6,	0x1B58,	%i4
loop_1342:
	fmovdcs	%xcc,	%f7,	%f9
	sdivx	%o3,	0x0628,	%i2
	brz,a	%l3,	loop_1343
	movre	%l5,	%g2,	%o7
	fmovse	%icc,	%f24,	%f2
	movleu	%xcc,	%i6,	%g7
loop_1343:
	tgu	%xcc,	0x3
	bl,a	loop_1344
	fbe,a	%fcc3,	loop_1345
	fornot2	%f4,	%f14,	%f30
	movneg	%icc,	%l2,	%l4
loop_1344:
	nop
	setx	0x606C7D35,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
loop_1345:
	edge16	%o1,	%g4,	%o0
	sra	%l1,	%g3,	%i3
	sllx	%g5,	0x0B,	%i5
	edge32	%i1,	%o6,	%i0
	tleu	%icc,	0x1
	fmovdl	%xcc,	%f13,	%f28
	movre	%g1,	%o2,	%o4
	nop
	setx	loop_1346,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba	%fcc2,	loop_1347
	movvs	%icc,	%i7,	%g6
	sllx	%o5,	0x0D,	%l0
loop_1346:
	taddcctv	%i4,	%l6,	%i2
loop_1347:
	array8	%o3,	%l3,	%l5
	fpsub16	%f14,	%f28,	%f6
	movrgz	%o7,	0x2E6,	%g2
	edge32ln	%i6,	%g7,	%l2
	movvc	%xcc,	%l4,	%g4
	umulcc	%o0,	%l1,	%g3
	orn	%i3,	0x1CD7,	%o1
	swap	[%l7 + 0x34],	%i5
	smulcc	%i1,	%o6,	%i0
	movne	%icc,	%g1,	%o2
	popc	%g5,	%o4
	edge16	%g6,	%i7,	%l0
	array32	%i4,	%o5,	%l6
	xnor	%o3,	%l3,	%l5
	movge	%xcc,	%o7,	%g2
	fbug,a	%fcc2,	loop_1348
	stx	%i2,	[%l7 + 0x58]
	movle	%xcc,	%i6,	%g7
	tvc	%xcc,	0x3
loop_1348:
	mulx	%l2,	0x0FFC,	%l4
	movcc	%icc,	%o0,	%l1
	fnors	%f23,	%f8,	%f4
	subccc	%g3,	%g4,	%i3
	srl	%o1,	%i5,	%i1
	edge32n	%o6,	%i0,	%o2
	fbu	%fcc1,	loop_1349
	fpack32	%f26,	%f28,	%f8
	swap	[%l7 + 0x30],	%g5
	ldsh	[%l7 + 0x6A],	%o4
loop_1349:
	tg	%icc,	0x3
	movvc	%xcc,	%g6,	%g1
	array32	%l0,	%i4,	%o5
	tsubcctv	%l6,	%o3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l3,	[%l7 + 0x46]
	stx	%o7,	[%l7 + 0x50]
	fbue	%fcc3,	loop_1350
	fornot2	%f8,	%f2,	%f4
	sdivcc	%l5,	0x09BF,	%i2
	xnorcc	%i6,	%g2,	%l2
loop_1350:
	orn	%g7,	%l4,	%l1
	movn	%xcc,	%o0,	%g3
	fsrc1	%f14,	%f8
	udiv	%g4,	0x0A3A,	%o1
	sub	%i3,	0x07EE,	%i1
	movvc	%icc,	%o6,	%i5
	fexpand	%f9,	%f6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x24,	%o2
	sra	%g5,	0x15,	%o4
	fpsub16s	%f9,	%f18,	%f10
	te	%icc,	0x4
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tsubcctv	%g6,	%g1,	%l0
	tvs	%xcc,	0x5
	movvc	%xcc,	%i4,	%o5
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f24
	fmovsn	%icc,	%f20,	%f29
	xorcc	%i0,	%l6,	%i7
	fmovrde	%l3,	%f0,	%f24
	umulcc	%o7,	0x0087,	%o3
	alignaddrl	%l5,	%i2,	%g2
	fabss	%f7,	%f6
	movg	%xcc,	%i6,	%l2
	taddcctv	%l4,	%g7,	%o0
	srax	%l1,	0x0D,	%g4
	stb	%g3,	[%l7 + 0x3C]
	nop
	setx loop_1351, %l0, %l1
	jmpl %l1, %i3
	sdiv	%o1,	0x1677,	%o6
	set	0x38, %g7
	ldsha	[%l7 + %g7] 0x88,	%i5
loop_1351:
	tcs	%xcc,	0x2
	edge16n	%o2,	%g5,	%i1
	nop
	setx	0x13CD3463,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f26
	fnot1	%f28,	%f4
	andn	%o4,	%g6,	%g1
	set	0x22, %i4
	ldsba	[%l7 + %i4] 0x0c,	%l0
	array8	%o5,	%i4,	%i0
	fmovrse	%l6,	%f10,	%f2
	tge	%xcc,	0x6
	movcc	%icc,	%i7,	%l3
	orncc	%o3,	%l5,	%i2
	ble,a	%icc,	loop_1352
	fble,a	%fcc0,	loop_1353
	fpsub32s	%f7,	%f2,	%f29
	andcc	%o7,	0x10A1,	%i6
loop_1352:
	brlez	%g2,	loop_1354
loop_1353:
	bg,a	%xcc,	loop_1355
	tneg	%icc,	0x6
	mulscc	%l2,	0x0BEE,	%g7
loop_1354:
	subcc	%o0,	0x03F3,	%l4
loop_1355:
	brlez,a	%l1,	loop_1356
	fnors	%f10,	%f1,	%f6
	edge16n	%g4,	%g3,	%o1
	addc	%i3,	%o6,	%i5
loop_1356:
	edge32l	%o2,	%g5,	%o4
	fpadd32s	%f25,	%f7,	%f22
	subccc	%i1,	%g6,	%l0
	set	0x60, %l4
	stwa	%o5,	[%l7 + %l4] 0x2f
	membar	#Sync
	xnor	%i4,	%i0,	%g1
	srlx	%l6,	0x1D,	%i7
	addcc	%o3,	%l3,	%i2
	edge16ln	%o7,	%l5,	%g2
	udivx	%i6,	0x1C77,	%g7
	fabsd	%f10,	%f26
	sdivx	%l2,	0x18FB,	%l4
	nop
	setx	0x533740F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x9E988D4F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f1,	%f2
	nop
	setx	0x21AB5D8DA04DF8F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	ta	%xcc,	0x1
	smul	%o0,	0x1EB8,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f26,	%f2
	tn	%icc,	0x2
	srax	%l1,	0x1D,	%g3
	fbule	%fcc0,	loop_1357
	edge32n	%o1,	%i3,	%o6
	fornot1s	%f30,	%f11,	%f21
	addcc	%i5,	0x1109,	%g5
loop_1357:
	ldd	[%l7 + 0x10],	%o2
	edge16	%o4,	%i1,	%g6
	fxnor	%f16,	%f14,	%f30
	fornot1s	%f17,	%f17,	%f7
	edge16l	%o5,	%l0,	%i4
	orcc	%i0,	0x0FD5,	%g1
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%i6
	mulx	%l6,	%l3,	%o3
	nop
	setx	0xF04D3041,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	brgez,a	%o7,	loop_1358
	edge8ln	%i2,	%g2,	%l5
	wr	%g0,	0xeb,	%asi
	stwa	%g7,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1358:
	call	loop_1359
	bg,pt	%xcc,	loop_1360
	movvs	%icc,	%i6,	%l2
	popc	0x0DB5,	%o0
loop_1359:
	movcs	%xcc,	%l4,	%l1
loop_1360:
	tvc	%xcc,	0x0
	mulx	%g3,	0x1CE1,	%o1
	brgez,a	%g4,	loop_1361
	tcs	%icc,	0x1
	andcc	%o6,	0x02E4,	%i3
	fpack16	%f30,	%f11
loop_1361:
	std	%f18,	[%l7 + 0x28]
	bneg,a,pt	%xcc,	loop_1362
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc2,	loop_1363
	edge16ln	%i5,	%g5,	%o2
loop_1362:
	xorcc	%o4,	0x1FDE,	%i1
	sllx	%g6,	%l0,	%o5
loop_1363:
	edge8l	%i0,	%g1,	%i7
	tsubcc	%l6,	%i4,	%l3
	xnorcc	%o7,	0x1EFB,	%o3
	te	%icc,	0x5
	flush	%l7 + 0x74
	set	0x1C, %i1
	ldsba	[%l7 + %i1] 0x19,	%i2
	fnegs	%f25,	%f7
	movg	%icc,	%g2,	%l5
	movpos	%xcc,	%i6,	%g7
	fornot1	%f16,	%f26,	%f18
	fbuge,a	%fcc3,	loop_1364
	tn	%xcc,	0x7
	fbuge,a	%fcc1,	loop_1365
	fmovrslez	%o0,	%f25,	%f21
loop_1364:
	move	%icc,	%l2,	%l4
	tn	%icc,	0x5
loop_1365:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f22,	%f8
	edge32ln	%g3,	%o1,	%l1
	edge16n	%o6,	%i3,	%i5
	nop
	setx loop_1366, %l0, %l1
	jmpl %l1, %g4
	movle	%icc,	%g5,	%o2
	fmovsl	%icc,	%f7,	%f15
	movneg	%icc,	%o4,	%i1
loop_1366:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	sdiv	%l0,	0x1168,	%i0
	sdivx	%o5,	0x16C4,	%i7
	movvs	%xcc,	%g1,	%i4
	add	%l6,	%l3,	%o7
	movvc	%icc,	%i2,	%o3
	fmovsn	%xcc,	%f21,	%f23
	fones	%f19
	tle	%xcc,	0x3
	umulcc	%g2,	%i6,	%g7
	move	%xcc,	%o0,	%l2
	movpos	%xcc,	%l4,	%g3
	andn	%o1,	%l5,	%l1
	fmovscc	%xcc,	%f9,	%f11
	fbule,a	%fcc2,	loop_1367
	nop
	setx loop_1368, %l0, %l1
	jmpl %l1, %i3
	fones	%f30
	sub	%i5,	0x0DEC,	%o6
loop_1367:
	fbuge,a	%fcc0,	loop_1369
loop_1368:
	movrgz	%g4,	%o2,	%o4
	movrlz	%g5,	%g6,	%l0
	orncc	%i1,	%i0,	%i7
loop_1369:
	fnot2s	%f27,	%f18
	bpos,a,pt	%xcc,	loop_1370
	movpos	%xcc,	%g1,	%o5
	fmovs	%f10,	%f4
	srax	%l6,	%l3,	%o7
loop_1370:
	nop
	fitos	%f11,	%f26
	fstod	%f26,	%f8
	fones	%f23
	and	%i2,	%i4,	%o3
	sdivcc	%i6,	0x0254,	%g2
	mulscc	%o0,	%l2,	%g7
	fnor	%f4,	%f28,	%f28
	bn,pn	%icc,	loop_1371
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g3,	0x1F39,	%l4
	orcc	%o1,	%l1,	%l5
loop_1371:
	edge16n	%i3,	%i5,	%g4
	fbug	%fcc2,	loop_1372
	movgu	%icc,	%o6,	%o2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x68] %asi,	%f20
loop_1372:
	movl	%xcc,	%o4,	%g5
	taddcctv	%l0,	0x1BCC,	%i1
	set	0x2C, %l5
	ldswa	[%l7 + %l5] 0x88,	%g6
	fmovrsgez	%i7,	%f13,	%f22
	andncc	%i0,	%o5,	%l6
	xnorcc	%g1,	%o7,	%i2
	st	%f25,	[%l7 + 0x1C]
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f4
	fxtos	%f4,	%f20
	bl,a,pn	%xcc,	loop_1373
	movle	%xcc,	%i4,	%l3
	bcc,a	loop_1374
	move	%xcc,	%o3,	%g2
loop_1373:
	bvs,a,pt	%xcc,	loop_1375
	subcc	%o0,	0x01AA,	%l2
loop_1374:
	fbue,a	%fcc0,	loop_1376
	movrgez	%i6,	0x0D6,	%g7
loop_1375:
	tleu	%icc,	0x0
	or	%l4,	0x1D23,	%g3
loop_1376:
	mulscc	%o1,	%l5,	%i3
	array32	%l1,	%i5,	%o6
	fmovdn	%xcc,	%f15,	%f1
	xor	%o2,	%g4,	%g5
	movvs	%xcc,	%o4,	%l0
	srl	%i1,	0x11,	%g6
	sllx	%i0,	%i7,	%l6
	movrgz	%g1,	%o5,	%o7
	movre	%i4,	0x392,	%l3
	mulscc	%i2,	0x1A10,	%o3
	tvc	%xcc,	0x0
	brlz,a	%g2,	loop_1377
	move	%icc,	%o0,	%l2
	tl	%icc,	0x5
	fmovdn	%icc,	%f26,	%f14
loop_1377:
	fbu,a	%fcc2,	loop_1378
	tg	%xcc,	0x3
	addccc	%i6,	%l4,	%g3
	movle	%xcc,	%o1,	%l5
loop_1378:
	fmovrdlez	%i3,	%f4,	%f18
	orncc	%l1,	0x0E44,	%i5
	addcc	%o6,	0x17DF,	%g7
	nop
	fitod	%f13,	%f12
	nop
	setx loop_1379, %l0, %l1
	jmpl %l1, %g4
	srax	%g5,	%o4,	%o2
	movrgz	%l0,	%g6,	%i0
	movrlz	%i7,	0x20F,	%l6
loop_1379:
	tg	%icc,	0x5
	fmovsge	%xcc,	%f27,	%f2
	mulscc	%i1,	0x093A,	%g1
	te	%icc,	0x3
	andcc	%o7,	0x0DEA,	%i4
	sethi	0x18FF,	%o5
	fnegs	%f20,	%f15
	sdiv	%i2,	0x0005,	%o3
	movge	%xcc,	%l3,	%g2
	addccc	%o0,	0x1250,	%i6
	fbule,a	%fcc3,	loop_1380
	subccc	%l4,	0x0A21,	%l2
	tg	%xcc,	0x7
	edge16n	%o1,	%g3,	%l5
loop_1380:
	bvs,a,pt	%icc,	loop_1381
	and	%i3,	0x10BE,	%l1
	sdivx	%i5,	0x1C00,	%g7
	umulcc	%o6,	%g5,	%g4
loop_1381:
	nop
	set	0x38, %i0
	lda	[%l7 + %i0] 0x14,	%f6
	fnegd	%f10,	%f2
	tn	%xcc,	0x0
	tsubcctv	%o2,	0x03AB,	%l0
	nop
	set	0x2E, %l0
	lduh	[%l7 + %l0],	%o4
	nop
	fitod	%f12,	%f24
	fdtoi	%f24,	%f22
	prefetch	[%l7 + 0x40],	 0x3
	udivcc	%i0,	0x1357,	%i7
	movl	%icc,	%l6,	%i1
	fsrc1s	%f26,	%f6
	edge32ln	%g6,	%o7,	%g1
	orncc	%i4,	%i2,	%o3
	tg	%xcc,	0x3
	orncc	%l3,	0x09D1,	%g2
	srax	%o5,	%o0,	%i6
	nop
	set	0x30, %i2
	std	%f20,	[%l7 + %i2]
	add	%l4,	0x169C,	%l2
	fmovspos	%icc,	%f11,	%f31
	fmovsvs	%xcc,	%f15,	%f14
	be,a	%xcc,	loop_1382
	smulcc	%o1,	0x04F8,	%g3
	nop
	fitos	%f14,	%f17
	fstoi	%f17,	%f7
	bne,pn	%xcc,	loop_1383
loop_1382:
	std	%f10,	[%l7 + 0x10]
	fmul8ulx16	%f4,	%f18,	%f10
	fbn,a	%fcc1,	loop_1384
loop_1383:
	edge32	%l5,	%l1,	%i3
	tgu	%xcc,	0x6
	te	%icc,	0x7
loop_1384:
	fmovda	%icc,	%f29,	%f15
	set	0x5C, %o4
	lduha	[%l7 + %o4] 0x11,	%g7
	mulx	%i5,	0x08E1,	%g5
	sllx	%g4,	%o6,	%l0
	lduh	[%l7 + 0x66],	%o4
	bn,pn	%icc,	loop_1385
	ta	%xcc,	0x5
	array16	%i0,	%i7,	%o2
	srl	%l6,	0x1D,	%g6
loop_1385:
	fbul	%fcc1,	loop_1386
	xorcc	%i1,	%o7,	%i4
	sir	0x1F62
	movrne	%i2,	0x2A4,	%g1
loop_1386:
	movrgz	%l3,	%g2,	%o3
	fpack16	%f26,	%f11
	fmovrslez	%o5,	%f3,	%f21
	tcc	%xcc,	0x5
	edge32	%i6,	%o0,	%l4
	sra	%l2,	%g3,	%l5
	movvs	%xcc,	%o1,	%l1
	umulcc	%g7,	0x1D64,	%i5
	udivx	%g5,	0x0727,	%g4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i3
	udivcc	%l0,	0x0EC7,	%o4
	fmovda	%xcc,	%f26,	%f30
	fmovrse	%o6,	%f17,	%f17
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x18,	%f16
	fbg,a	%fcc3,	loop_1387
	fmovdneg	%xcc,	%f3,	%f27
	bleu,pn	%icc,	loop_1388
	xorcc	%i7,	%i0,	%o2
loop_1387:
	fornot1	%f24,	%f10,	%f30
	tcc	%icc,	0x2
loop_1388:
	movne	%icc,	%g6,	%i1
	edge16n	%l6,	%o7,	%i2
	fcmpgt16	%f14,	%f2,	%g1
	fsrc2	%f6,	%f10
	alignaddr	%l3,	%g2,	%o3
	fsrc1	%f4,	%f6
	sethi	0x18D8,	%i4
	fmovse	%icc,	%f17,	%f7
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f21
	fxors	%f26,	%f30,	%f26
	and	%i6,	%o0,	%l4
	udiv	%o5,	0x1C44,	%g3
	std	%f6,	[%l7 + 0x08]
	array8	%l2,	%l5,	%o1
	sdivcc	%g7,	0x119A,	%l1
	fand	%f24,	%f2,	%f12
	taddcc	%i5,	%g5,	%g4
	andncc	%l0,	%i3,	%o6
	movne	%icc,	%i7,	%i0
	fmovrdgz	%o2,	%f6,	%f22
	fnand	%f26,	%f20,	%f6
	fnot2s	%f21,	%f25
	edge8ln	%g6,	%i1,	%o4
	movge	%xcc,	%o7,	%l6
	sdiv	%i2,	0x07BB,	%g1
	flush	%l7 + 0x48
	tne	%xcc,	0x3
	fmovsvc	%icc,	%f19,	%f31
	set	0x10, %g6
	stba	%g2,	[%l7 + %g6] 0x22
	membar	#Sync
	sllx	%l3,	0x19,	%i4
	bneg,pt	%icc,	loop_1389
	popc	0x1D17,	%o3
	be,a	%icc,	loop_1390
	movcs	%icc,	%o0,	%l4
loop_1389:
	tleu	%icc,	0x6
	fpadd16	%f16,	%f18,	%f12
loop_1390:
	movleu	%icc,	%o5,	%i6
	movre	%g3,	%l5,	%o1
	fbuge	%fcc0,	loop_1391
	movrgez	%l2,	0x2E1,	%g7
	andncc	%i5,	%g5,	%g4
	fabsd	%f24,	%f24
loop_1391:
	subccc	%l1,	0x1EB5,	%i3
	movpos	%xcc,	%o6,	%l0
	xnorcc	%i7,	0x0767,	%i0
	movrlz	%o2,	%i1,	%o4
	fcmple32	%f0,	%f8,	%o7
	movrne	%g6,	%l6,	%i2
	alignaddrl	%g1,	%l3,	%i4
	fmovrde	%o3,	%f0,	%f16
	edge16ln	%o0,	%l4,	%o5
	andn	%i6,	0x0BE7,	%g2
	fsrc2	%f18,	%f18
	tsubcc	%l5,	%o1,	%l2
	fmul8sux16	%f30,	%f18,	%f14
	xnorcc	%g3,	%g7,	%g5
	brnz	%i5,	loop_1392
	smulcc	%g4,	0x13A8,	%i3
	nop
	setx	0xA073D435,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	edge8	%o6,	%l1,	%i7
loop_1392:
	fpsub32s	%f30,	%f14,	%f15
	or	%l0,	%i0,	%i1
	alignaddr	%o2,	%o4,	%g6
	edge8n	%l6,	%i2,	%g1
	fbue	%fcc3,	loop_1393
	fmovdpos	%xcc,	%f11,	%f5
	fmovdgu	%xcc,	%f27,	%f22
	fmovdneg	%icc,	%f30,	%f27
loop_1393:
	fzero	%f16
	fornot1	%f14,	%f30,	%f16
	taddcc	%o7,	0x0D1B,	%i4
	fnot1	%f10,	%f10
	or	%o3,	0x10D1,	%o0
	tvs	%icc,	0x2
	nop
	setx	0xEDFBCD8D4054D74E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop
	set	0x6F, %g3
	ldsb	[%l7 + %g3],	%l4
	andn	%l3,	%i6,	%o5
	edge32l	%g2,	%o1,	%l5
	fmovs	%f18,	%f10
	tgu	%icc,	0x2
	membar	0x1A
	brz,a	%g3,	loop_1394
	fpack32	%f28,	%f20,	%f28
	wr	%g0,	0xe3,	%asi
	stwa	%g7,	[%l7 + 0x78] %asi
	membar	#Sync
loop_1394:
	and	%g5,	%l2,	%g4
	udivx	%i3,	0x007D,	%o6
	fnegd	%f26,	%f12
	xnorcc	%i5,	0x0DE3,	%i7
	fmovse	%xcc,	%f6,	%f21
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	movrgez	%l0,	%i1,	%i0
	tsubcc	%o4,	%g6,	%o2
	sll	%l6,	0x0E,	%i2
	fpack32	%f24,	%f14,	%f12
	udivcc	%g1,	0x1A35,	%i4
	bcc,a,pn	%icc,	loop_1395
	movge	%xcc,	%o7,	%o0
	sdiv	%o3,	0x0276,	%l3
	bl	%icc,	loop_1396
loop_1395:
	udiv	%l4,	0x0A74,	%i6
	fmovsg	%icc,	%f31,	%f30
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f6
loop_1396:
	edge16	%g2,	%o1,	%l5
	tne	%icc,	0x7
	fbuge,a	%fcc2,	loop_1397
	movgu	%icc,	%o5,	%g3
	addc	%g5,	%l2,	%g7
	xorcc	%i3,	%g4,	%o6
loop_1397:
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f26
	ldd	[%l7 + 0x40],	%f24
	movleu	%icc,	%i5,	%l1
	bleu,a	%xcc,	loop_1398
	nop
	fitos	%f7,	%f29
	tcs	%xcc,	0x6
	brgez	%i7,	loop_1399
loop_1398:
	tg	%xcc,	0x7
	taddcctv	%i1,	%l0,	%i0
	fcmpgt32	%f4,	%f12,	%o4
loop_1399:
	bge,pt	%xcc,	loop_1400
	movn	%xcc,	%g6,	%l6
	fpadd16s	%f31,	%f15,	%f4
	fmovda	%xcc,	%f6,	%f26
loop_1400:
	fcmpeq16	%f12,	%f6,	%i2
	array8	%o2,	%g1,	%o7
	lduh	[%l7 + 0x5C],	%o0
	sra	%o3,	0x07,	%i4
	stbar
	movcc	%xcc,	%l4,	%l3
	tne	%xcc,	0x7
	add	%i6,	0x108E,	%o1
	sub	%g2,	%l5,	%o5
	subc	%g3,	0x1943,	%l2
	fmovsa	%icc,	%f9,	%f6
	and	%g5,	%i3,	%g7
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x40] %asi,	%g4
	fmovscc	%xcc,	%f7,	%f17
	fornot1s	%f17,	%f24,	%f4
	movne	%icc,	%i5,	%l1
	movcs	%icc,	%i7,	%o6
	fmovsneg	%xcc,	%f15,	%f29
	tl	%icc,	0x3
	brnz	%i1,	loop_1401
	fmovdn	%icc,	%f10,	%f17
	fnegs	%f24,	%f8
	tvc	%xcc,	0x3
loop_1401:
	sllx	%l0,	%o4,	%g6
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x16,	%f0
	xnor	%i0,	0x17B1,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x50] %asi,	%f25
	movrgez	%o2,	%g1,	%o7
	nop
	setx	0x65A4B41630788B0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	sllx	%o0,	0x1F,	%o3
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x89
	subcc	%i4,	0x0CA9,	%l4
	nop
	setx	loop_1402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldub	[%l7 + 0x17],	%l3
	udiv	%i6,	0x0690,	%i2
	ta	%icc,	0x5
loop_1402:
	alignaddrl	%o1,	%l5,	%o5
	addccc	%g3,	0x184F,	%g2
	fmovrslez	%l2,	%f2,	%f12
	set	0x18, %g5
	stxa	%i3,	[%l7 + %g5] 0x2b
	membar	#Sync
	fbge	%fcc3,	loop_1403
	movl	%icc,	%g7,	%g5
	fblg	%fcc3,	loop_1404
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f5
loop_1403:
	fmovrsne	%i5,	%f0,	%f12
	fmovdleu	%xcc,	%f3,	%f17
loop_1404:
	fnors	%f15,	%f25,	%f9
	addcc	%l1,	%i7,	%g4
	udivx	%o6,	0x1A4E,	%l0
	edge16l	%o4,	%g6,	%i1
	fand	%f16,	%f0,	%f4
	subccc	%i0,	%l6,	%g1
	array16	%o2,	%o0,	%o3
	umul	%i4,	0x013F,	%l4
	tcc	%icc,	0x0
	edge32ln	%o7,	%l3,	%i2
	brz,a	%o1,	loop_1405
	movge	%icc,	%l5,	%o5
	fmovrsgz	%g3,	%f10,	%f15
	fmovsn	%icc,	%f30,	%f22
loop_1405:
	umulcc	%i6,	%l2,	%g2
	array16	%i3,	%g5,	%i5
	movge	%xcc,	%l1,	%i7
	edge8ln	%g4,	%o6,	%g7
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%l0
	mulscc	%i1,	%g6,	%i0
	movg	%icc,	%g1,	%l6
	fcmpgt32	%f18,	%f30,	%o0
	tvc	%xcc,	0x6
	sir	0x13E7
	bgu	%icc,	loop_1406
	fmovrde	%o3,	%f2,	%f2
	sllx	%o2,	%l4,	%i4
	bn,a	%xcc,	loop_1407
loop_1406:
	nop
	setx loop_1408, %l0, %l1
	jmpl %l1, %l3
	movg	%icc,	%o7,	%o1
	srax	%i2,	0x18,	%l5
loop_1407:
	fbul	%fcc1,	loop_1409
loop_1408:
	addc	%g3,	0x1A39,	%o5
	fpsub32	%f18,	%f16,	%f28
	ta	%icc,	0x0
loop_1409:
	udivcc	%l2,	0x196B,	%i6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	move	%xcc,	%g2,	%i5
	fmovsne	%xcc,	%f31,	%f6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x10,	%f0
	tle	%xcc,	0x5
	nop
	setx	0xC351A39B94DFDEE5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x4F07C9F890507246,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f30,	%f22
	movrlz	%l1,	%i7,	%g5
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f0
	fxtos	%f0,	%f18
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x81,	%g4
	edge32l	%g7,	%o6,	%o4
	bgu,a	%icc,	loop_1410
	movvs	%icc,	%i1,	%l0
	tne	%xcc,	0x5
	movl	%xcc,	%i0,	%g6
loop_1410:
	nop
	setx	loop_1411,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%g1,	0x1ADC,	%l6
	sir	0x13CD
	add	%l7,	0x54,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o0,	%o2
loop_1411:
	nop
	setx	0xC08774F13716A741,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7300654E3E9D86DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f4,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f24,	%f5,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x7
	fsrc2s	%f13,	%f8
	subc	%o3,	0x07EA,	%i4
	fexpand	%f17,	%f2
	array8	%l4,	%o7,	%o1
	sethi	0x0080,	%l3
	nop
	setx	0x0CAE94A9DFE1779E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3650C6DD0A3B5832,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f14,	%f4
	set	0x14, %g2
	sta	%f12,	[%l7 + %g2] 0x81
	movleu	%xcc,	%i2,	%l5
	bne,pt	%icc,	loop_1412
	fmovdcc	%icc,	%f15,	%f22
	movge	%xcc,	%g3,	%l2
	edge8ln	%o5,	%i6,	%i3
loop_1412:
	taddcctv	%g2,	%l1,	%i5
	tneg	%xcc,	0x0
	ldd	[%l7 + 0x30],	%f28
	orn	%g5,	0x1968,	%i7
	fors	%f24,	%f3,	%f23
	fmovsneg	%icc,	%f26,	%f10
	prefetch	[%l7 + 0x50],	 0x0
	tg	%icc,	0x0
	be,a,pt	%xcc,	loop_1413
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g4,	0x093A,	%o6
	movcs	%icc,	%g7,	%i1
loop_1413:
	sllx	%l0,	%o4,	%g6
	ble	%icc,	loop_1414
	fmovde	%icc,	%f31,	%f26
	fzeros	%f6
	fmovdle	%xcc,	%f2,	%f19
loop_1414:
	nop
	set	0x64, %o6
	lda	[%l7 + %o6] 0x04,	%f28
	addc	%i0,	0x1035,	%g1
	umul	%l6,	%o0,	%o3
	andn	%o2,	%l4,	%i4
	movrgez	%o1,	0x0A5,	%l3
	set	0x10, %o0
	stha	%o7,	[%l7 + %o0] 0x22
	membar	#Sync
	fbe,a	%fcc1,	loop_1415
	fbug,a	%fcc3,	loop_1416
	udivx	%i2,	0x1E4C,	%g3
	taddcctv	%l5,	0x18FC,	%l2
loop_1415:
	st	%f28,	[%l7 + 0x34]
loop_1416:
	srlx	%i6,	%i3,	%o5
	srl	%g2,	%l1,	%i5
	fornot2	%f22,	%f0,	%f12
	fone	%f10
	xnorcc	%g5,	%g4,	%i7
	xnor	%g7,	%o6,	%i1
	movrgez	%l0,	0x222,	%o4
	array8	%g6,	%g1,	%l6
	fmovrdlez	%o0,	%f18,	%f8
	stbar
	addccc	%o3,	%o2,	%l4
	set	0x33, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i4
	or	%o1,	0x0360,	%l3
	edge8	%o7,	%i0,	%g3
	movle	%xcc,	%l5,	%l2
	bg,pt	%xcc,	loop_1417
	sth	%i6,	[%l7 + 0x44]
	tcs	%xcc,	0x7
	orcc	%i2,	%i3,	%g2
loop_1417:
	addccc	%l1,	%i5,	%g5
	fmovdneg	%icc,	%f4,	%f0
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f10
	fornot2s	%f10,	%f20,	%f6
	set	0x14, %o3
	lduwa	[%l7 + %o3] 0x10,	%g4
	bleu,a	loop_1418
	edge8ln	%i7,	%g7,	%o6
	stx	%i1,	[%l7 + 0x60]
	fmovdvs	%icc,	%f6,	%f3
loop_1418:
	fpadd32	%f16,	%f16,	%f24
	andn	%l0,	%o4,	%o5
	sll	%g1,	%g6,	%l6
	fmovdgu	%icc,	%f2,	%f5
	fpsub16	%f0,	%f2,	%f24
	sir	0x1AAE
	andncc	%o0,	%o2,	%o3
	fmul8x16al	%f0,	%f25,	%f22
	fbe,a	%fcc3,	loop_1419
	edge32n	%i4,	%o1,	%l4
	fsrc1	%f16,	%f4
	fpadd32	%f24,	%f20,	%f10
loop_1419:
	tpos	%icc,	0x6
	fnegd	%f22,	%f16
	tpos	%xcc,	0x1
	movneg	%icc,	%o7,	%l3
	tneg	%xcc,	0x0
	fmovdg	%xcc,	%f30,	%f4
	and	%i0,	0x15A6,	%l5
	andncc	%l2,	%i6,	%g3
	fble,a	%fcc0,	loop_1420
	ldd	[%l7 + 0x60],	%i2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i3
loop_1420:
	fbul,a	%fcc0,	loop_1421
	bvs,pn	%icc,	loop_1422
	tn	%xcc,	0x2
	mulscc	%l1,	0x1435,	%g2
loop_1421:
	nop
	setx	0x69215A2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f28
loop_1422:
	movcs	%icc,	%i5,	%g4
	bg,pt	%icc,	loop_1423
	fandnot2	%f22,	%f10,	%f10
	tvs	%xcc,	0x3
	stw	%g5,	[%l7 + 0x18]
loop_1423:
	fpadd32	%f30,	%f18,	%f8
	subccc	%g7,	%o6,	%i1
	bne	%icc,	loop_1424
	addcc	%l0,	0x0C6E,	%i7
	edge8n	%o5,	%o4,	%g6
	mulx	%l6,	0x1DD5,	%g1
loop_1424:
	fmovsg	%icc,	%f4,	%f14
	fmovdcc	%xcc,	%f7,	%f26
	srax	%o2,	0x1B,	%o0
	fbn	%fcc2,	loop_1425
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1426
	edge8n	%i4,	%o3,	%l4
loop_1425:
	fmovrse	%o7,	%f15,	%f31
	tleu	%xcc,	0x7
loop_1426:
	brnz	%o1,	loop_1427
	edge16l	%l3,	%i0,	%l5
	smulcc	%i6,	%l2,	%g3
	subcc	%i3,	%i2,	%l1
loop_1427:
	nop
	set	0x1E, %o1
	ldstub	[%l7 + %o1],	%i5
	fornot2s	%f13,	%f19,	%f3
	bvs,a	%xcc,	loop_1428
	bcs,a,pn	%xcc,	loop_1429
	prefetch	[%l7 + 0x78],	 0x1
	subcc	%g4,	0x0F8C,	%g5
loop_1428:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1429:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g7,	%g2,	%i1
	fpadd32s	%f27,	%f24,	%f20
	fmovsleu	%xcc,	%f29,	%f20
	fbg,a	%fcc1,	loop_1430
	alignaddr	%l0,	%i7,	%o6
	sir	0x17A9
	nop
	setx	loop_1431,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1430:
	fba,a	%fcc1,	loop_1432
	membar	0x2F
	st	%f3,	[%l7 + 0x28]
loop_1431:
	fsrc1s	%f27,	%f19
loop_1432:
	fcmpgt16	%f12,	%f16,	%o5
	tle	%xcc,	0x4
	bge	loop_1433
	umulcc	%o4,	%g6,	%g1
	edge32	%l6,	%o0,	%o2
	xor	%o3,	%l4,	%i4
loop_1433:
	bl,a	loop_1434
	movrne	%o1,	%l3,	%i0
	addc	%l5,	%o7,	%l2
	mulx	%g3,	%i6,	%i3
loop_1434:
	edge8l	%i2,	%i5,	%l1
	movrne	%g4,	0x24B,	%g7
	fmovsl	%xcc,	%f11,	%f25
	set	0x6E, %l6
	ldsba	[%l7 + %l6] 0x10,	%g2
	srl	%g5,	%l0,	%i7
	orncc	%i1,	0x10AA,	%o6
	movrlez	%o4,	%g6,	%g1
	taddcc	%o5,	0x1E82,	%o0
	umulcc	%l6,	0x116E,	%o3
	movle	%icc,	%o2,	%l4
	fbe	%fcc0,	loop_1435
	movge	%icc,	%o1,	%i4
	movvc	%xcc,	%i0,	%l3
	orn	%o7,	0x0349,	%l2
loop_1435:
	call	loop_1436
	movgu	%icc,	%l5,	%i6
	andncc	%i3,	%i2,	%g3
	ldsb	[%l7 + 0x0E],	%l1
loop_1436:
	bn	%xcc,	loop_1437
	fcmple16	%f10,	%f4,	%i5
	fmovsa	%icc,	%f25,	%f23
	sra	%g7,	%g4,	%g2
loop_1437:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x59] %asi,	%g5
	set	0x19, %o7
	lduba	[%l7 + %o7] 0x14,	%l0
	sub	%i1,	%i7,	%o4
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g6
	taddcctv	%g1,	0x0D2D,	%o5
	or	%o0,	%l6,	%o6
	fmovrdne	%o2,	%f2,	%f4
	fpsub16s	%f21,	%f14,	%f0
	set	0x4A, %o2
	lduba	[%l7 + %o2] 0x04,	%o3
	edge16ln	%l4,	%o1,	%i4
	edge16l	%l3,	%i0,	%l2
	edge32n	%l5,	%o7,	%i3
	movneg	%xcc,	%i2,	%i6
	edge16l	%g3,	%l1,	%g7
	edge8n	%g4,	%g2,	%i5
	bg,a	%icc,	loop_1438
	fmovrslez	%l0,	%f28,	%f14
	srlx	%g5,	0x00,	%i1
	tne	%icc,	0x3
loop_1438:
	addc	%i7,	%g6,	%o4
	edge16n	%o5,	%o0,	%l6
	brgz,a	%o6,	loop_1439
	fmuld8sux16	%f30,	%f7,	%f28
	fornot1	%f4,	%f28,	%f26
	bcs	loop_1440
loop_1439:
	and	%g1,	%o2,	%l4
	edge16ln	%o1,	%o3,	%i4
	tg	%xcc,	0x3
loop_1440:
	nop
	setx loop_1441, %l0, %l1
	jmpl %l1, %l3
	fcmpeq16	%f6,	%f20,	%l2
	movne	%xcc,	%i0,	%l5
	and	%i3,	%i2,	%i6
loop_1441:
	sth	%o7,	[%l7 + 0x20]
	st	%f0,	[%l7 + 0x7C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g3,	%l1,	%g4
	fors	%f26,	%f21,	%f21
	ld	[%l7 + 0x34],	%f21
	fnegs	%f11,	%f22
	fmovsvc	%icc,	%f21,	%f18
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x14,	%f16
	movleu	%xcc,	%g2,	%i5
	fzero	%f0
	fcmpgt16	%f4,	%f30,	%l0
	ldx	[%l7 + 0x38],	%g5
	fbn,a	%fcc2,	loop_1442
	tcc	%icc,	0x3
	orncc	%i1,	0x1EC8,	%g7
	addc	%g6,	%o4,	%o5
loop_1442:
	fmuld8sux16	%f16,	%f3,	%f4
	nop
	setx	loop_1443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_1444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%i7,	0x0B8D,	%l6
	nop
	setx	0x728B7746707D1D6D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_1443:
	fxors	%f24,	%f18,	%f14
loop_1444:
	sir	0x1615
	fcmple32	%f30,	%f8,	%o0
	movle	%xcc,	%g1,	%o2
	movcc	%xcc,	%l4,	%o6
	fmovsn	%xcc,	%f7,	%f23
	add	%o1,	0x0BAF,	%o3
	fbn	%fcc0,	loop_1445
	tvc	%icc,	0x1
	mulscc	%l3,	%i4,	%l2
	movvc	%xcc,	%l5,	%i3
loop_1445:
	tpos	%xcc,	0x5
	fbne	%fcc3,	loop_1446
	movn	%xcc,	%i2,	%i0
	bneg,a,pt	%icc,	loop_1447
	xor	%i6,	0x0B85,	%o7
loop_1446:
	be,a	loop_1448
	fnand	%f26,	%f6,	%f26
loop_1447:
	smulcc	%g3,	0x139E,	%g4
	fmovde	%icc,	%f15,	%f15
loop_1448:
	edge16	%l1,	%g2,	%l0
	movrgez	%g5,	0x13D,	%i5
	fmovrdne	%g7,	%f2,	%f14
	subc	%g6,	0x118A,	%o4
	edge8n	%o5,	%i7,	%i1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%g1
	andn	%l6,	%l4,	%o6
	brnz	%o1,	loop_1449
	sir	0x13F1
	ldub	[%l7 + 0x22],	%o3
	movle	%xcc,	%o2,	%l3
loop_1449:
	sir	0x0F03
	fbuge	%fcc3,	loop_1450
	sll	%l2,	%l5,	%i4
	sir	0x10A6
	bgu	loop_1451
loop_1450:
	fmovdneg	%xcc,	%f12,	%f12
	nop
	setx	0xE48A189A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x375CB464,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f25,	%f7
	movcc	%icc,	%i3,	%i0
loop_1451:
	fmovsne	%icc,	%f10,	%f10
	movvc	%icc,	%i2,	%o7
	membar	0x61
	set	0x74, %l3
	swapa	[%l7 + %l3] 0x10,	%g3
	fnot2s	%f7,	%f4
	fmovsne	%xcc,	%f26,	%f4
	fmovdge	%icc,	%f20,	%f8
	te	%icc,	0x3
	tge	%xcc,	0x0
	brnz,a	%i6,	loop_1452
	fmovdl	%icc,	%f26,	%f7
	fmovrdlez	%g4,	%f8,	%f12
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
loop_1452:
	membar	0x2A
	edge8n	%l1,	%g5,	%l0
	edge16	%g7,	%g6,	%i5
	sub	%o5,	%i7,	%i1
	mulx	%o4,	%o0,	%l6
	fmovda	%xcc,	%f14,	%f25
	andn	%g1,	0x0E80,	%l4
	fpadd32	%f12,	%f12,	%f20
	brgez,a	%o1,	loop_1453
	edge32l	%o6,	%o3,	%o2
	tcc	%xcc,	0x2
	lduh	[%l7 + 0x0E],	%l3
loop_1453:
	fmovrde	%l2,	%f14,	%f30
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovsg	%icc,	%f22,	%f10
	tneg	%icc,	0x6
	tpos	%icc,	0x3
	brlz	%i4,	loop_1454
	sethi	0x043F,	%i3
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x30] %asi
loop_1454:
	edge16n	%l5,	%i2,	%i0
	sth	%g3,	[%l7 + 0x64]
	nop
	setx	0x83D2CE89,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x808E77DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f15,	%f20
	srlx	%i6,	0x05,	%g4
	movg	%icc,	%g2,	%o7
	array8	%g5,	%l1,	%g7
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x18
	tle	%icc,	0x3
	stw	%g6,	[%l7 + 0x20]
	tvs	%xcc,	0x3
	movle	%xcc,	%i5,	%o5
	fbuge,a	%fcc2,	loop_1455
	brz,a	%l0,	loop_1456
	tsubcc	%i1,	0x04CB,	%o4
	taddcc	%o0,	0x129B,	%i7
loop_1455:
	bcs	loop_1457
loop_1456:
	movvs	%icc,	%g1,	%l6
	xorcc	%l4,	%o1,	%o3
	fpmerge	%f8,	%f6,	%f24
loop_1457:
	nop
	set	0x34, %i4
	lda	[%l7 + %i4] 0x89,	%f6
	tg	%xcc,	0x2
	sdivx	%o6,	0x1D09,	%l3
	tcs	%icc,	0x7
	tpos	%icc,	0x5
	ta	%xcc,	0x5
	fmovrdlz	%l2,	%f28,	%f22
	xorcc	%o2,	%i3,	%i4
	tvc	%xcc,	0x7
	xor	%i2,	%i0,	%l5
	fmovd	%f6,	%f14
	movvc	%icc,	%g3,	%g4
	be,a,pt	%icc,	loop_1458
	tl	%icc,	0x1
	fble,a	%fcc2,	loop_1459
	fbe,a	%fcc0,	loop_1460
loop_1458:
	movvs	%icc,	%g2,	%o7
	addccc	%i6,	%g5,	%l1
loop_1459:
	orn	%g7,	0x068F,	%g6
loop_1460:
	brlz,a	%i5,	loop_1461
	umul	%o5,	%i1,	%l0
	edge8	%o4,	%i7,	%o0
	fmovdneg	%xcc,	%f5,	%f20
loop_1461:
	edge16	%l6,	%g1,	%o1
	udivcc	%l4,	0x02A9,	%o6
	fnegs	%f17,	%f3
	edge32ln	%l3,	%o3,	%o2
	mova	%icc,	%i3,	%i4
	fmovrse	%l2,	%f19,	%f3
	nop
	setx	0x1A2F9EED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x1BFBF4D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f17,	%f19
	udivx	%i2,	0x016B,	%i0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%l5
	mulx	%g4,	%g2,	%o7
	fbne	%fcc2,	loop_1462
	sdivcc	%g5,	0x0B75,	%l1
	tl	%xcc,	0x0
	srax	%i6,	0x1D,	%g6
loop_1462:
	tvc	%icc,	0x7
	bge,a,pn	%xcc,	loop_1463
	fmovsa	%xcc,	%f8,	%f5
	tsubcctv	%i5,	0x1C23,	%o5
	bneg,a	%icc,	loop_1464
loop_1463:
	subcc	%g7,	0x1A73,	%l0
	ta	%xcc,	0x3
	fpsub32s	%f29,	%f2,	%f16
loop_1464:
	xor	%i1,	%o4,	%o0
	nop
	setx	loop_1465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrse	%i7,	%f6,	%f23
	fands	%f1,	%f0,	%f21
	array16	%l6,	%o1,	%l4
loop_1465:
	nop
	setx	0xFD08C012,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x299D33C9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f31,	%f15
	fandnot2	%f14,	%f24,	%f8
	tvs	%xcc,	0x7
	bcs,pt	%xcc,	loop_1466
	addccc	%o6,	0x0304,	%g1
	fabsd	%f30,	%f12
	andncc	%l3,	%o2,	%i3
loop_1466:
	taddcc	%o3,	0x1066,	%l2
	orn	%i2,	0x1346,	%i4
	or	%g3,	%l5,	%i0
	tne	%icc,	0x0
	sra	%g2,	%o7,	%g5
	tl	%xcc,	0x6
	xorcc	%l1,	0x0FD5,	%i6
	brz,a	%g6,	loop_1467
	mulx	%g4,	%o5,	%g7
	fbug	%fcc3,	loop_1468
	fmovsneg	%xcc,	%f5,	%f19
loop_1467:
	xnor	%l0,	%i1,	%o4
	edge8n	%i5,	%o0,	%i7
loop_1468:
	srax	%o1,	%l6,	%o6
	tcc	%xcc,	0x3
	sir	0x02F9
	edge32n	%g1,	%l3,	%o2
	fbug,a	%fcc3,	loop_1469
	movrgez	%i3,	%o3,	%l2
	fbne	%fcc3,	loop_1470
	tgu	%icc,	0x4
loop_1469:
	sllx	%l4,	0x1D,	%i2
	tge	%xcc,	0x1
loop_1470:
	nop
	fitos	%f12,	%f31
	fstod	%f31,	%f30
	ld	[%l7 + 0x2C],	%f7
	nop
	set	0x7C, %l4
	stw	%i4,	[%l7 + %l4]
	add	%g3,	%i0,	%l5
	stbar
	sra	%o7,	%g5,	%g2
	mulscc	%i6,	%l1,	%g4
	set	0x3E, %g4
	stha	%o5,	[%l7 + %g4] 0x19
	subcc	%g7,	0x07BF,	%l0
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x11,	 0x0
	andcc	%o4,	0x15C3,	%i1
	movcs	%xcc,	%o0,	%i7
	fmovsl	%xcc,	%f9,	%f23
	sll	%o1,	0x0D,	%l6
	sdivx	%o6,	0x0BE8,	%g1
	ldsh	[%l7 + 0x4C],	%l3
	ldub	[%l7 + 0x52],	%i5
	nop
	setx	0xE2F0C129,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x8CFF7295,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f31,	%f1
	smul	%o2,	0x082D,	%i3
	stw	%o3,	[%l7 + 0x68]
	fmovdleu	%icc,	%f4,	%f18
	xor	%l4,	0x1731,	%l2
	movneg	%icc,	%i2,	%i4
	fmovrsgez	%i0,	%f30,	%f29
	srlx	%l5,	%g3,	%g5
	edge8n	%g2,	%i6,	%o7
	brlez	%l1,	loop_1471
	ba,pn	%xcc,	loop_1472
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f17,	%f18
loop_1471:
	sub	%g4,	0x0EA1,	%g7
loop_1472:
	subc	%o5,	0x1C2E,	%g6
	fblg,a	%fcc3,	loop_1473
	call	loop_1474
	tne	%xcc,	0x3
	addcc	%o4,	0x0067,	%l0
loop_1473:
	tne	%xcc,	0x7
loop_1474:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x46] %asi,	%o0
	alignaddrl	%i1,	%o1,	%l6
	udiv	%i7,	0x115F,	%g1
	sdiv	%l3,	0x1D3E,	%i5
	fmovdcs	%xcc,	%f31,	%f15
	fmovdg	%xcc,	%f17,	%f4
	srlx	%o6,	%i3,	%o3
	faligndata	%f30,	%f4,	%f6
	udiv	%l4,	0x0EFC,	%l2
	alignaddrl	%o2,	%i4,	%i2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x10,	%f16
	fbule	%fcc0,	loop_1475
	ldd	[%l7 + 0x20],	%i0
	umul	%g3,	%l5,	%g2
	xnorcc	%g5,	%o7,	%i6
loop_1475:
	movrne	%l1,	%g7,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g4,	%o4
	bcc,pt	%icc,	loop_1476
	edge32l	%l0,	%g6,	%o0
	alignaddr	%o1,	%l6,	%i7
	tneg	%xcc,	0x7
loop_1476:
	movgu	%icc,	%i1,	%g1
	andncc	%i5,	%o6,	%i3
	add	%l3,	0x01E5,	%l4
	fcmpgt16	%f14,	%f22,	%o3
	orncc	%l2,	%o2,	%i4
	tvc	%icc,	0x6
	fbg,a	%fcc2,	loop_1477
	tge	%xcc,	0x4
	movpos	%icc,	%i2,	%g3
	set	0x5C, %i0
	ldswa	[%l7 + %i0] 0x81,	%i0
loop_1477:
	andncc	%l5,	%g2,	%o7
	sethi	0x0982,	%g5
	tgu	%icc,	0x5
	edge8ln	%l1,	%g7,	%i6
	bl,a	%icc,	loop_1478
	movn	%icc,	%o5,	%g4
	udivx	%o4,	0x1EE6,	%g6
	fbl	%fcc3,	loop_1479
loop_1478:
	edge32n	%o0,	%o1,	%l0
	fmovrdlez	%l6,	%f0,	%f8
	srax	%i7,	%i1,	%i5
loop_1479:
	array32	%g1,	%i3,	%o6
	edge16ln	%l3,	%o3,	%l4
	subc	%l2,	0x1E90,	%o2
	bl,a	loop_1480
	or	%i4,	%i2,	%g3
	bg	loop_1481
	tl	%icc,	0x5
loop_1480:
	fbn,a	%fcc1,	loop_1482
	udiv	%i0,	0x1857,	%g2
loop_1481:
	nop
	fitod	%f24,	%f28
	sdiv	%l5,	0x0200,	%g5
loop_1482:
	orcc	%o7,	0x1834,	%g7
	edge8l	%l1,	%o5,	%g4
	umul	%o4,	%i6,	%g6
	movcs	%xcc,	%o1,	%l0
	movrne	%o0,	0x132,	%i7
	fsrc1	%f24,	%f24
	fbule	%fcc0,	loop_1483
	fbge	%fcc1,	loop_1484
	addccc	%i1,	%l6,	%i5
	movne	%xcc,	%g1,	%i3
loop_1483:
	movle	%icc,	%l3,	%o3
loop_1484:
	fandnot2	%f24,	%f24,	%f22
	srlx	%o6,	%l4,	%o2
	movrgez	%i4,	%l2,	%g3
	andncc	%i2,	%i0,	%l5
	brz,a	%g5,	loop_1485
	ta	%icc,	0x3
	fornot1s	%f11,	%f8,	%f27
	bleu	%icc,	loop_1486
loop_1485:
	orn	%g2,	%g7,	%o7
	sll	%o5,	%g4,	%l1
	udiv	%i6,	0x00D6,	%g6
loop_1486:
	fmovsleu	%icc,	%f4,	%f10
	fpadd16	%f22,	%f18,	%f12
	nop
	setx	0x8F6AEFF6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x4E3E01D3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f2,	%f19
	fpack32	%f0,	%f20,	%f14
	xorcc	%o1,	%o4,	%l0
	fmovdge	%icc,	%f20,	%f7
	xorcc	%o0,	0x108B,	%i7
	move	%xcc,	%l6,	%i1
	sdivx	%i5,	0x043C,	%i3
	fbne,a	%fcc0,	loop_1487
	be,pt	%xcc,	loop_1488
	fnot2	%f10,	%f16
	fcmpeq32	%f4,	%f30,	%l3
loop_1487:
	srlx	%g1,	%o6,	%l4
loop_1488:
	tg	%xcc,	0x2
	tl	%xcc,	0x0
	fmovdg	%xcc,	%f7,	%f14
	nop
	setx	0x12A2A396806DD72C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	popc	0x04DF,	%o2
	movrgez	%o3,	0x38B,	%l2
	fbe	%fcc0,	loop_1489
	andn	%i4,	%g3,	%i2
	edge8n	%l5,	%i0,	%g2
	orn	%g5,	%o7,	%o5
loop_1489:
	fblg	%fcc0,	loop_1490
	fornot2	%f10,	%f24,	%f4
	xorcc	%g4,	%l1,	%i6
	smul	%g6,	0x1540,	%g7
loop_1490:
	xnor	%o4,	0x1D4D,	%o1
	ldd	[%l7 + 0x68],	%f2
	move	%icc,	%l0,	%o0
	fbg,a	%fcc2,	loop_1491
	fnot2s	%f24,	%f24
	ldd	[%l7 + 0x38],	%i6
	edge8l	%l6,	%i1,	%i5
loop_1491:
	umulcc	%i3,	0x0195,	%l3
	nop
	fitos	%f4,	%f31
	fstox	%f31,	%f22
	fmovdvs	%xcc,	%f9,	%f11
	tne	%xcc,	0x2
	tl	%icc,	0x4
	umulcc	%o6,	%g1,	%l4
	bneg,a,pt	%icc,	loop_1492
	sethi	0x0131,	%o3
	ta	%icc,	0x3
	edge8l	%l2,	%i4,	%o2
loop_1492:
	taddcc	%i2,	%l5,	%g3
	fmovsa	%xcc,	%f28,	%f5
	movcc	%icc,	%i0,	%g2
	sir	0x0A0E
	taddcc	%g5,	%o7,	%o5
	fabsd	%f30,	%f12
	edge16l	%l1,	%i6,	%g4
	tsubcc	%g7,	%o4,	%g6
	fmovdleu	%icc,	%f21,	%f23
	udivx	%o1,	0x1DE0,	%l0
	nop
	fitos	%f5,	%f3
	fstox	%f3,	%f24
	fxtos	%f24,	%f10
	st	%f24,	[%l7 + 0x44]
	fbo	%fcc3,	loop_1493
	fmuld8sux16	%f4,	%f13,	%f30
	movvc	%xcc,	%o0,	%i7
	movn	%icc,	%l6,	%i5
loop_1493:
	alignaddr	%i1,	%i3,	%o6
	fbe	%fcc3,	loop_1494
	xor	%g1,	%l4,	%l3
	fnor	%f30,	%f0,	%f8
	movg	%xcc,	%o3,	%i4
loop_1494:
	movg	%xcc,	%l2,	%o2
	membar	0x3B
	ldsh	[%l7 + 0x54],	%i2
	tcs	%xcc,	0x0
	sra	%l5,	%g3,	%g2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x08] %asi,	%g5
	andcc	%o7,	%i0,	%o5
	orncc	%l1,	%g4,	%i6
	fbuge	%fcc1,	loop_1495
	ta	%icc,	0x4
	fmovsgu	%xcc,	%f23,	%f26
	subc	%o4,	%g6,	%o1
loop_1495:
	stbar
	fand	%f30,	%f0,	%f18
	fbuge	%fcc3,	loop_1496
	swap	[%l7 + 0x78],	%l0
	ldd	[%l7 + 0x60],	%g6
	or	%i7,	%o0,	%i5
loop_1496:
	edge32l	%l6,	%i3,	%i1
	fmovse	%xcc,	%f16,	%f11
	fmovdl	%xcc,	%f5,	%f16
	or	%o6,	%g1,	%l4
	fpsub32	%f18,	%f24,	%f22
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
	stb	%o3,	[%l7 + 0x71]
	ba,pt	%xcc,	loop_1497
	sra	%l2,	0x0E,	%o2
	fba,a	%fcc3,	loop_1498
	movrlz	%i4,	%i2,	%g3
loop_1497:
	movvs	%icc,	%l5,	%g5
	smulcc	%o7,	%g2,	%i0
loop_1498:
	ldsw	[%l7 + 0x14],	%o5
	udivx	%l1,	0x1D95,	%g4
	fbul	%fcc3,	loop_1499
	edge32	%o4,	%i6,	%o1
	fbuge	%fcc3,	loop_1500
	ble	loop_1501
loop_1499:
	sdiv	%l0,	0x0DF6,	%g6
	fmovdneg	%xcc,	%f22,	%f11
loop_1500:
	movge	%xcc,	%i7,	%o0
loop_1501:
	bge,pn	%icc,	loop_1502
	orcc	%i5,	%g7,	%l6
	edge8	%i1,	%o6,	%i3
	nop
	fitos	%f14,	%f9
	fstoi	%f9,	%f23
loop_1502:
	movleu	%xcc,	%g1,	%l4
	edge16ln	%o3,	%l2,	%l3
	stbar
	umul	%i4,	%i2,	%o2
	tne	%icc,	0x4
	movrne	%l5,	0x0CF,	%g3
	te	%xcc,	0x5
	tvc	%xcc,	0x4
	movrne	%o7,	%g5,	%g2
	mova	%xcc,	%o5,	%i0
	udiv	%g4,	0x1045,	%l1
	tneg	%xcc,	0x5
	fmovrdgez	%o4,	%f18,	%f26
	edge8	%o1,	%l0,	%i6
	fcmpeq32	%f10,	%f24,	%g6
	movgu	%icc,	%i7,	%o0
	set	0x44, %l0
	lduwa	[%l7 + %l0] 0x81,	%g7
	tg	%xcc,	0x3
	tsubcc	%i5,	0x156D,	%i1
	fmovrsgz	%l6,	%f11,	%f21
	fxnor	%f10,	%f24,	%f4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%g1
	movvc	%icc,	%l4,	%o3
	fexpand	%f14,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i3,	0x05CF,	%l2
	std	%f16,	[%l7 + 0x38]
	fpadd32s	%f23,	%f5,	%f18
	popc	%i4,	%i2
	sth	%o2,	[%l7 + 0x20]
	swap	[%l7 + 0x6C],	%l3
	ba,pn	%icc,	loop_1503
	movrne	%g3,	%o7,	%l5
	nop
	setx loop_1504, %l0, %l1
	jmpl %l1, %g5
	sll	%o5,	0x1D,	%g2
loop_1503:
	alignaddrl	%g4,	%l1,	%i0
	edge32n	%o1,	%o4,	%i6
loop_1504:
	bg,a,pn	%xcc,	loop_1505
	fsrc2s	%f17,	%f12
	movneg	%xcc,	%g6,	%i7
	fsrc1s	%f16,	%f13
loop_1505:
	fblg,a	%fcc2,	loop_1506
	movrlez	%o0,	0x00B,	%l0
	fbne,a	%fcc1,	loop_1507
	bleu,a,pt	%icc,	loop_1508
loop_1506:
	fors	%f21,	%f28,	%f29
	fmovsne	%xcc,	%f10,	%f9
loop_1507:
	movrgez	%g7,	0x0D4,	%i1
loop_1508:
	edge8n	%i5,	%o6,	%l6
	be,pn	%icc,	loop_1509
	fmovdleu	%xcc,	%f24,	%f1
	fzero	%f26
	sdivx	%l4,	0x18B4,	%o3
loop_1509:
	fpsub16s	%f19,	%f9,	%f26
	movl	%icc,	%g1,	%i3
	fble,a	%fcc1,	loop_1510
	movcc	%icc,	%l2,	%i2
	ldsh	[%l7 + 0x42],	%i4
	array16	%o2,	%g3,	%l3
loop_1510:
	movcc	%xcc,	%o7,	%g5
	array32	%l5,	%o5,	%g2
	edge32l	%g4,	%l1,	%i0
	popc	%o4,	%i6
	array32	%g6,	%o1,	%o0
	move	%xcc,	%i7,	%g7
	movg	%icc,	%l0,	%i5
	nop
	fitos	%f23,	%f2
	ldsb	[%l7 + 0x2D],	%i1
	fsrc2	%f8,	%f6
	fbu,a	%fcc0,	loop_1511
	srlx	%l6,	%l4,	%o6
	edge32ln	%o3,	%i3,	%l2
	ld	[%l7 + 0x6C],	%f27
loop_1511:
	xorcc	%g1,	0x1540,	%i4
	st	%f7,	[%l7 + 0x2C]
	sub	%i2,	%o2,	%l3
	edge32l	%o7,	%g5,	%l5
	addccc	%o5,	%g3,	%g2
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
	subc	%l1,	0x1CC5,	%i0
	set	0x73, %i2
	stba	%o4,	[%l7 + %i2] 0xea
	membar	#Sync
	fpsub32	%f20,	%f6,	%f16
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movre	%g4,	0x38B,	%g6
	set	0x3C, %o4
	lduwa	[%l7 + %o4] 0x18,	%i6
	subc	%o0,	%i7,	%g7
	fnot1s	%f5,	%f1
	bvc	loop_1512
	fnands	%f24,	%f2,	%f3
	fmovrsgz	%l0,	%f20,	%f9
	fblg	%fcc3,	loop_1513
loop_1512:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc3,	loop_1514
	sdivx	%o1,	0x020D,	%i5
loop_1513:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l6,	%i1
loop_1514:
	bpos	loop_1515
	bg,pt	%icc,	loop_1516
	edge8	%l4,	%o3,	%o6
	edge8l	%i3,	%l2,	%g1
loop_1515:
	brlz	%i2,	loop_1517
loop_1516:
	fble,a	%fcc3,	loop_1518
	te	%icc,	0x0
	fxors	%f16,	%f18,	%f25
loop_1517:
	fmovscc	%icc,	%f21,	%f28
loop_1518:
	fmovsne	%icc,	%f19,	%f10
	array32	%o2,	%i4,	%l3
	fmovscc	%icc,	%f25,	%f25
	sra	%o7,	%g5,	%o5
	fbug,a	%fcc3,	loop_1519
	tvs	%icc,	0x4
	movvs	%xcc,	%g3,	%g2
	fone	%f24
loop_1519:
	edge8	%l5,	%i0,	%l1
	sir	0x0815
	movg	%xcc,	%g4,	%g6
	edge16n	%i6,	%o4,	%o0
	mulx	%g7,	0x0F73,	%l0
	stx	%o1,	[%l7 + 0x78]
	array16	%i7,	%l6,	%i1
	addccc	%l4,	%o3,	%i5
	stb	%o6,	[%l7 + 0x20]
	bn	%xcc,	loop_1520
	srax	%i3,	0x15,	%g1
	nop
	fitos	%f7,	%f18
	fstoi	%f18,	%f23
	movneg	%icc,	%i2,	%l2
loop_1520:
	movvs	%icc,	%i4,	%l3
	set	0x36, %l5
	lduha	[%l7 + %l5] 0x80,	%o2
	movgu	%xcc,	%o7,	%g5
	sdiv	%o5,	0x08E7,	%g2
	edge16	%l5,	%g3,	%i0
	fbug,a	%fcc1,	loop_1521
	umulcc	%l1,	%g6,	%g4
	xorcc	%i6,	0x044C,	%o4
	movgu	%icc,	%o0,	%l0
loop_1521:
	fpsub16s	%f9,	%f11,	%f8
	fcmpne16	%f22,	%f8,	%g7
	brlez	%i7,	loop_1522
	nop
	setx	0x5BDC8431,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f20
	edge8n	%o1,	%l6,	%i1
	tn	%xcc,	0x3
loop_1522:
	sub	%l4,	0x15FE,	%o3
	alignaddrl	%o6,	%i5,	%i3
	movgu	%icc,	%i2,	%g1
	orncc	%i4,	0x0553,	%l2
	ldd	[%l7 + 0x40],	%f28
	orn	%l3,	0x0417,	%o2
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	subccc	%g5,	0x0C11,	%o5
	srlx	%o7,	%g2,	%l5
	addcc	%i0,	%l1,	%g6
	nop
	setx	loop_1523,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%g4,	%g3,	%i6
	ldsh	[%l7 + 0x0C],	%o0
	udivx	%o4,	0x1BC6,	%l0
loop_1523:
	array8	%i7,	%o1,	%g7
	tge	%icc,	0x2
	te	%icc,	0x2
	xnor	%i1,	0x09F7,	%l4
	st	%f7,	[%l7 + 0x68]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o3,	%o6
	taddcc	%l6,	%i3,	%i2
	bleu,a	%xcc,	loop_1524
	orn	%i5,	0x1EC0,	%i4
	taddcctv	%g1,	%l2,	%l3
	std	%f14,	[%l7 + 0x08]
loop_1524:
	sub	%g5,	0x1A73,	%o2
	tgu	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	sta	%f14,	[%l7 + 0x54] %asi
	udivx	%o5,	0x0FAD,	%o7
	array32	%g2,	%i0,	%l1
	set	0x4B, %g6
	ldsba	[%l7 + %g6] 0x14,	%g6
	edge8n	%g4,	%l5,	%g3
	alignaddr	%i6,	%o0,	%o4
	flush	%l7 + 0x54
	set	0x0C, %g3
	stba	%i7,	[%l7 + %g3] 0xea
	membar	#Sync
	bneg	loop_1525
	movne	%icc,	%l0,	%g7
	bgu,a	%xcc,	loop_1526
	movcs	%xcc,	%i1,	%o1
loop_1525:
	nop
	setx	0x906DABE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	srl	%l4,	0x17,	%o3
loop_1526:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%l6,	[%l7 + 0x10] %asi
	or	%o6,	%i2,	%i5
	addccc	%i3,	%i4,	%l2
	wr	%g0,	0x2a,	%asi
	stxa	%l3,	[%l7 + 0x50] %asi
	membar	#Sync
	tg	%icc,	0x5
	fmovdcc	%icc,	%f23,	%f28
	fcmpgt16	%f10,	%f22,	%g5
	ba	%xcc,	loop_1527
	fmovrdlz	%g1,	%f8,	%f0
	smul	%o2,	0x0DED,	%o5
	fnegs	%f4,	%f20
loop_1527:
	smul	%o7,	0x0C21,	%i0
	sth	%l1,	[%l7 + 0x52]
	tsubcc	%g2,	%g4,	%g6
	bne,a,pt	%icc,	loop_1528
	brgz,a	%l5,	loop_1529
	srax	%g3,	0x09,	%o0
	movl	%icc,	%o4,	%i6
loop_1528:
	lduw	[%l7 + 0x60],	%i7
loop_1529:
	fbg	%fcc3,	loop_1530
	fandnot1	%f24,	%f20,	%f12
	umulcc	%l0,	%g7,	%o1
	tsubcctv	%i1,	0x0192,	%l4
loop_1530:
	nop
	set	0x2C, %i7
	swapa	[%l7 + %i7] 0x18,	%o3
	movvs	%xcc,	%o6,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i2,	%i3
	srax	%i4,	0x0B,	%i5
	add	%l3,	%g5,	%g1
	array8	%o2,	%l2,	%o7
	fbn	%fcc3,	loop_1531
	alignaddrl	%o5,	%l1,	%g2
	movpos	%icc,	%i0,	%g6
	fbne,a	%fcc2,	loop_1532
loop_1531:
	fnors	%f23,	%f21,	%f7
	movge	%xcc,	%l5,	%g3
	edge16ln	%g4,	%o0,	%o4
loop_1532:
	fblg,a	%fcc2,	loop_1533
	fand	%f10,	%f14,	%f10
	popc	0x03B6,	%i6
	wr	%g0,	0xe2,	%asi
	stwa	%l0,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1533:
	tpos	%icc,	0x1
	bshuffle	%f14,	%f22,	%f28
	edge32	%g7,	%o1,	%i1
	membar	0x6F
	tg	%icc,	0x5
	bgu,a,pn	%xcc,	loop_1534
	andcc	%l4,	0x19A7,	%i7
	ta	%xcc,	0x5
	edge32l	%o6,	%o3,	%i2
loop_1534:
	andncc	%i3,	%i4,	%l6
	add	%l3,	0x169E,	%i5
	sll	%g1,	0x0F,	%g5
	edge32n	%l2,	%o2,	%o5
	bge	%xcc,	loop_1535
	brz	%l1,	loop_1536
	sdiv	%o7,	0x1508,	%g2
	movrne	%i0,	0x377,	%g6
loop_1535:
	fnegd	%f0,	%f22
loop_1536:
	fbo	%fcc0,	loop_1537
	fmovsg	%xcc,	%f8,	%f28
	fmovrdgez	%g3,	%f20,	%f4
	movge	%xcc,	%g4,	%o0
loop_1537:
	edge8n	%o4,	%l5,	%i6
	tle	%xcc,	0x6
	tvc	%xcc,	0x5
	movrne	%g7,	0x30E,	%l0
	movpos	%icc,	%i1,	%o1
	fnand	%f28,	%f18,	%f20
	ta	%xcc,	0x3
	fbule,a	%fcc1,	loop_1538
	fpmerge	%f27,	%f5,	%f0
	tcc	%xcc,	0x7
	fmul8x16au	%f6,	%f6,	%f14
loop_1538:
	tgu	%icc,	0x3
	flush	%l7 + 0x10
	fpack32	%f26,	%f22,	%f22
	edge8l	%l4,	%o6,	%i7
	tle	%icc,	0x0
	edge16	%i2,	%o3,	%i3
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	setx	0x67116D703F80A7DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE44AB611E3443D4C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f24
	fble	%fcc2,	loop_1539
	ldd	[%l7 + 0x38],	%f24
	edge8l	%i4,	%l6,	%l3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x18,	%i5,	%g5
loop_1539:
	fornot1s	%f3,	%f22,	%f9
	sdiv	%g1,	0x001A,	%o2
	membar	0x62
	fpack16	%f16,	%f12
	or	%l2,	%o5,	%l1
	srlx	%o7,	%i0,	%g6
	edge16l	%g2,	%g4,	%o0
	and	%o4,	%g3,	%l5
	set	0x7C, %g1
	sta	%f4,	[%l7 + %g1] 0x04
	array32	%i6,	%l0,	%g7
	bpos,a	loop_1540
	bleu	loop_1541
	movrgez	%o1,	%l4,	%i1
	ld	[%l7 + 0x08],	%f28
loop_1540:
	fpmerge	%f20,	%f14,	%f28
loop_1541:
	subcc	%i7,	%o6,	%o3
	movcs	%xcc,	%i2,	%i3
	wr	%g0,	0x2b,	%asi
	stwa	%l6,	[%l7 + 0x40] %asi
	membar	#Sync
	lduw	[%l7 + 0x4C],	%l3
	movvs	%xcc,	%i5,	%i4
	subcc	%g1,	0x17A3,	%o2
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	setx	0xB15CE719507AC37A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g5,	%l2
	tn	%icc,	0x0
	fmovsvc	%icc,	%f6,	%f9
	fbn	%fcc3,	loop_1542
	fpackfix	%f14,	%f9
	movgu	%xcc,	%l1,	%o5
	srl	%o7,	%g6,	%i0
loop_1542:
	xorcc	%g4,	%o0,	%o4
	sra	%g3,	%g2,	%l5
	fxor	%f6,	%f28,	%f18
	bgu,pn	%xcc,	loop_1543
	movpos	%icc,	%i6,	%g7
	nop
	setx	0xA242491D7A8DC62C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x70DE77B5310CB3CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f4,	%f26
	tleu	%xcc,	0x3
loop_1543:
	fbn,a	%fcc3,	loop_1544
	addccc	%o1,	0x0BE4,	%l0
	srl	%l4,	%i7,	%i1
	andncc	%o3,	%i2,	%i3
loop_1544:
	fnot2s	%f6,	%f25
	nop
	setx	0x4561903A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2C15CB92,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f0,	%f26
	ldx	[%l7 + 0x58],	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l3,	%i5,	%i4
	srax	%o6,	%g1,	%o2
	and	%g5,	%l2,	%l1
	tvc	%icc,	0x4
	ldd	[%l7 + 0x10],	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1545,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x0
	srlx	%o5,	%o7,	%g6
	udiv	%i0,	0x1376,	%g4
loop_1545:
	nop
	setx	0x4B1653D0D23F6EED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD122A5E0CA86F317,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f28,	%f20
	add	%o0,	%g3,	%g2
	taddcc	%o4,	%i6,	%g7
	srlx	%l5,	%l0,	%o1
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i7
	be	%xcc,	loop_1546
	brz,a	%i1,	loop_1547
	tgu	%icc,	0x4
	bvs,a,pt	%icc,	loop_1548
loop_1546:
	movre	%o3,	%l4,	%i2
loop_1547:
	tge	%xcc,	0x2
	edge16l	%i3,	%l6,	%l3
loop_1548:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i4
	fbul	%fcc1,	loop_1549
	udiv	%o6,	0x0B67,	%i5
	edge8l	%g1,	%o2,	%l2
	tcc	%xcc,	0x1
loop_1549:
	nop
	setx	0x290429C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x9A24EF0D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f22,	%f6
	fnot1	%f10,	%f12
	fnot1	%f8,	%f4
	fsrc1	%f26,	%f22
	bvs,a,pn	%xcc,	loop_1550
	add	%g5,	0x1EF6,	%l1
	orncc	%o7,	%o5,	%g6
	edge16n	%g4,	%i0,	%o0
loop_1550:
	movrlez	%g2,	%g3,	%o4
	nop
	setx	0xD20C397C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x73C71772,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f24,	%f16
	movvc	%icc,	%g7,	%i6
	set	0x56, %g5
	lduha	[%l7 + %g5] 0x04,	%l0
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o1
	fmovdne	%xcc,	%f16,	%f14
	mulscc	%i7,	%l5,	%o3
	fmovdge	%icc,	%f14,	%f27
	fornot2s	%f23,	%f10,	%f20
	movle	%xcc,	%l4,	%i1
	sdiv	%i2,	0x02AC,	%l6
	fmovdcc	%icc,	%f21,	%f29
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l3
	orcc	%i3,	%i4,	%i5
	bleu,pn	%icc,	loop_1551
	bg,a	loop_1552
	addcc	%o6,	%g1,	%l2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f0
loop_1551:
	umulcc	%g5,	%o2,	%o7
loop_1552:
	movcc	%xcc,	%o5,	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%l1
	nop
	setx	0x1B49D709,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xC1663B09,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f25,	%f28
	flush	%l7 + 0x24
	movrgz	%i0,	0x2DB,	%o0
	array16	%g3,	%g2,	%g7
	tg	%icc,	0x3
	movpos	%icc,	%o4,	%l0
	ldsb	[%l7 + 0x65],	%i6
	orn	%i7,	%o1,	%o3
	fmovsne	%xcc,	%f28,	%f24
	edge8n	%l5,	%l4,	%i1
	fmovsne	%xcc,	%f6,	%f7
	tvs	%xcc,	0x4
	te	%icc,	0x7
	edge8n	%l6,	%i2,	%l3
	fmovdle	%xcc,	%f16,	%f5
	tne	%icc,	0x0
	subc	%i3,	0x0F39,	%i4
	movn	%xcc,	%o6,	%i5
	movneg	%icc,	%g1,	%l2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x3E] %asi,	%o2
	xorcc	%g5,	0x1099,	%o7
	edge16n	%g6,	%o5,	%l1
	movcc	%icc,	%i0,	%g4
	fmovdcs	%xcc,	%f14,	%f15
	bleu	loop_1553
	xorcc	%o0,	%g2,	%g3
	srlx	%g7,	0x1C,	%l0
	movgu	%xcc,	%o4,	%i7
loop_1553:
	edge16l	%o1,	%o3,	%i6
	fandnot1s	%f3,	%f5,	%f7
	array32	%l4,	%i1,	%l6
	ta	%icc,	0x6
	srl	%l5,	0x08,	%i2
	nop
	setx loop_1554, %l0, %l1
	jmpl %l1, %l3
	xorcc	%i4,	0x1295,	%o6
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f8
	sdiv	%i5,	0x0212,	%i3
loop_1554:
	andn	%g1,	%l2,	%g5
	nop
	set	0x50, %i6
	stx	%o2,	[%l7 + %i6]
	fbuge,a	%fcc0,	loop_1555
	umulcc	%o7,	%o5,	%l1
	movne	%xcc,	%g6,	%i0
	fmovsneg	%icc,	%f20,	%f28
loop_1555:
	prefetch	[%l7 + 0x20],	 0x0
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	fbo,a	%fcc3,	loop_1556
	fmovrslez	%g2,	%f5,	%f31
	fbue	%fcc2,	loop_1557
	orn	%o0,	%g7,	%l0
loop_1556:
	edge8	%o4,	%i7,	%g3
	fpack32	%f4,	%f8,	%f16
loop_1557:
	sra	%o1,	%o3,	%l4
	fcmple32	%f30,	%f8,	%i1
	array16	%i6,	%l5,	%i2
	xnorcc	%l3,	%i4,	%o6
	move	%icc,	%i5,	%l6
	umulcc	%i3,	0x0E87,	%g1
	fornot2s	%f13,	%f10,	%f16
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x0c,	%f0
	bpos,a	loop_1558
	edge16n	%l2,	%g5,	%o7
	bg,a,pt	%icc,	loop_1559
	fbne,a	%fcc0,	loop_1560
loop_1558:
	addccc	%o2,	0x059C,	%l1
	ldx	[%l7 + 0x18],	%o5
loop_1559:
	stb	%g6,	[%l7 + 0x22]
loop_1560:
	fones	%f5
	andn	%i0,	0x13B2,	%g4
	fnot1	%f14,	%f26
	tg	%xcc,	0x1
	nop
	setx	0x67A3363E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x5C03FE9C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f8,	%f2
	tcc	%icc,	0x4
	fmovsgu	%xcc,	%f24,	%f0
	set	0x10, %o6
	ldsha	[%l7 + %o6] 0x18,	%g2
	tpos	%icc,	0x2
	tvs	%xcc,	0x1
	tvc	%xcc,	0x7
	tcc	%xcc,	0x3
	edge16n	%g7,	%o0,	%l0
	alignaddrl	%i7,	%g3,	%o1
	orncc	%o4,	0x051C,	%l4
	andn	%i1,	0x174D,	%o3
	nop
	fitos	%f13,	%f16
	fstoi	%f16,	%f5
	orcc	%i6,	0x1747,	%l5
	edge32n	%l3,	%i2,	%o6
	tn	%xcc,	0x3
	fmovsleu	%xcc,	%f13,	%f18
	fxnors	%f18,	%f25,	%f4
	fornot2	%f0,	%f8,	%f2
	array32	%i4,	%l6,	%i5
	tpos	%xcc,	0x1
	fpadd32s	%f8,	%f18,	%f16
	st	%f2,	[%l7 + 0x60]
	brgz,a	%i3,	loop_1561
	fpadd32s	%f16,	%f15,	%f1
	fmovrde	%g1,	%f14,	%f4
	fmovdcs	%icc,	%f22,	%f23
loop_1561:
	alignaddrl	%l2,	%o7,	%o2
	bvc,a,pt	%xcc,	loop_1562
	edge32l	%g5,	%o5,	%g6
	brlz,a	%l1,	loop_1563
	subccc	%g4,	0x19AC,	%g2
loop_1562:
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%i0
	subccc	%g7,	%o0,	%l0
loop_1563:
	nop
	set	0x76, %i3
	ldstub	[%l7 + %i3],	%g3
	ldstub	[%l7 + 0x6F],	%i7
	fornot1s	%f15,	%f28,	%f4
	tleu	%xcc,	0x2
	sll	%o4,	0x0E,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o1,	%o3
	tsubcctv	%i6,	%i1,	%l3
	movvc	%xcc,	%i2,	%l5
	set	0x24, %l1
	ldswa	[%l7 + %l1] 0x14,	%i4
	movgu	%icc,	%l6,	%i5
	sra	%i3,	%g1,	%l2
	fmovdleu	%xcc,	%f28,	%f6
	tsubcctv	%o7,	0x0B70,	%o6
	movle	%xcc,	%o2,	%o5
	fmovscs	%xcc,	%f3,	%f28
	srlx	%g5,	0x09,	%l1
	stx	%g6,	[%l7 + 0x50]
	fmovdne	%xcc,	%f16,	%f10
	addc	%g2,	0x10E7,	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o0
	tle	%icc,	0x5
	movrlz	%g7,	%l0,	%g3
	taddcctv	%o4,	0x1BB7,	%i7
	fnands	%f17,	%f17,	%f0
	ldd	[%l7 + 0x08],	%o0
	addc	%l4,	%o3,	%i1
	fmovrdgez	%i6,	%f16,	%f4
	movne	%icc,	%l3,	%i2
	fcmpeq32	%f10,	%f24,	%l5
	edge32n	%i4,	%l6,	%i5
	fbl,a	%fcc2,	loop_1564
	popc	0x00D4,	%g1
	movle	%xcc,	%l2,	%o7
	movleu	%xcc,	%o6,	%o2
loop_1564:
	fbg	%fcc1,	loop_1565
	movrgz	%i3,	0x3AB,	%o5
	addc	%g5,	%l1,	%g2
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1565:
	stx	%g6,	[%l7 + 0x20]
	movg	%xcc,	%i0,	%g4
	fornot1s	%f31,	%f5,	%f20
	ta	%xcc,	0x5
	mulx	%o0,	0x045A,	%g7
	tcs	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x2C],	%g3
	tleu	%icc,	0x3
	ldub	[%l7 + 0x2C],	%o4
	movneg	%icc,	%l0,	%i7
	fnegs	%f0,	%f0
	brlz,a	%l4,	loop_1566
	fsrc1s	%f18,	%f12
	ble	%xcc,	loop_1567
	movneg	%xcc,	%o1,	%i1
loop_1566:
	tne	%xcc,	0x7
	tne	%icc,	0x0
loop_1567:
	fxors	%f4,	%f31,	%f28
	tl	%icc,	0x2
	fornot2	%f6,	%f16,	%f10
	sdiv	%o3,	0x1F01,	%i6
	andcc	%i2,	%l3,	%i4
	xor	%l6,	%l5,	%g1
	fandnot1s	%f0,	%f30,	%f1
	movpos	%xcc,	%l2,	%o7
	xorcc	%i5,	0x006B,	%o2
	bvs,pn	%xcc,	loop_1568
	bl,pt	%icc,	loop_1569
	udivx	%o6,	0x1FE0,	%o5
	edge32n	%i3,	%g5,	%g2
loop_1568:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1569:
	nop
	set	0x6A, %o1
	lduha	[%l7 + %o1] 0x0c,	%l1
	nop
	set	0x7D, %o3
	stb	%g6,	[%l7 + %o3]
	tcc	%icc,	0x1
	fmovs	%f11,	%f23
	movrlez	%i0,	0x393,	%o0
	fpackfix	%f8,	%f28
	xor	%g7,	0x117C,	%g4
	fmovsne	%icc,	%f0,	%f15
	movn	%xcc,	%o4,	%g3
	fmovsl	%xcc,	%f13,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l0,	0x04B9,	%i7
	mova	%icc,	%l4,	%i1
	array32	%o1,	%o3,	%i2
	fble,a	%fcc3,	loop_1570
	nop
	setx	loop_1571,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%icc,	0x4
	popc	%i6,	%l3
loop_1570:
	tg	%icc,	0x3
loop_1571:
	add	%l6,	0x1F99,	%i4
	fnegd	%f2,	%f4
	fmovrse	%g1,	%f21,	%f8
	movl	%icc,	%l5,	%o7
	umul	%l2,	%i5,	%o2
	fand	%f8,	%f26,	%f10
	taddcctv	%o5,	0x1045,	%i3
	tl	%icc,	0x2
	tl	%xcc,	0x4
	edge8	%g5,	%o6,	%g2
	xorcc	%l1,	0x163B,	%i0
	edge8	%o0,	%g7,	%g4
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x81,	%f3
	nop
	setx	0xD6A1AFF0A1CFB8C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x38A906A8754BE459,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f30,	%f2
	movle	%xcc,	%o4,	%g3
	alignaddr	%l0,	%g6,	%l4
	tge	%icc,	0x4
	movne	%icc,	%i1,	%o1
	array16	%o3,	%i2,	%i7
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i6
	fmovsgu	%icc,	%f15,	%f26
	fones	%f30
	movn	%xcc,	%l3,	%i4
	fandnot1s	%f12,	%f1,	%f16
	set	0x30, %o7
	ldda	[%l7 + %o7] 0x2b,	%g0
	movne	%xcc,	%l5,	%o7
	edge32ln	%l2,	%i5,	%o2
	fone	%f14
	tn	%xcc,	0x6
	array16	%l6,	%o5,	%g5
	taddcc	%o6,	0x1835,	%i3
	fmul8x16au	%f23,	%f18,	%f22
	edge16ln	%l1,	%i0,	%o0
	nop
	fitos	%f31,	%f5
	fornot2	%f20,	%f24,	%f10
	movvs	%icc,	%g2,	%g7
	bcs	loop_1572
	edge8ln	%o4,	%g4,	%l0
	bvs,pn	%xcc,	loop_1573
	brgz	%g3,	loop_1574
loop_1572:
	flush	%l7 + 0x70
	xnor	%l4,	%g6,	%o1
loop_1573:
	ldsh	[%l7 + 0x76],	%o3
loop_1574:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x28] %asi,	%i1
	movrgz	%i7,	0x2FB,	%i6
	brlz,a	%i2,	loop_1575
	movcc	%icc,	%i4,	%g1
	fbl	%fcc0,	loop_1576
	fandnot1s	%f5,	%f28,	%f4
loop_1575:
	fabsd	%f6,	%f2
	addcc	%l5,	0x1447,	%o7
loop_1576:
	nop
	set	0x40, %o2
	stxa	%l2,	[%l7 + %o2] 0x11
	movrlez	%l3,	%i5,	%l6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	loop_1577,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%icc,	0x3
	fmovrdlz	%o2,	%f30,	%f6
	tpos	%xcc,	0x5
loop_1577:
	fmovsle	%icc,	%f6,	%f2
	movvs	%icc,	%o5,	%o6
	fbge	%fcc0,	loop_1578
	subccc	%g5,	%i3,	%i0
	tcs	%xcc,	0x6
	alignaddrl	%o0,	%l1,	%g2
loop_1578:
	movrlz	%g7,	0x2D3,	%g4
	nop
	set	0x4D, %o5
	ldsb	[%l7 + %o5],	%l0
	brz,a	%o4,	loop_1579
	ba,a,pt	%xcc,	loop_1580
	mulx	%g3,	%l4,	%g6
	smulcc	%o3,	0x0FE6,	%i1
loop_1579:
	fsrc2	%f4,	%f24
loop_1580:
	tg	%xcc,	0x4
	movrlez	%i7,	0x147,	%i6
	brgez,a	%i2,	loop_1581
	fmovrdlez	%i4,	%f16,	%f14
	nop
	setx	0xF0970935,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xACDFED60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f3,	%f4
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g1
loop_1581:
	andncc	%o1,	%l5,	%l2
	stbar
	fornot1	%f14,	%f24,	%f2
	fbl,a	%fcc2,	loop_1582
	bneg,a,pn	%xcc,	loop_1583
	movrlz	%l3,	0x194,	%o7
	smul	%l6,	%o2,	%i5
loop_1582:
	nop
	setx	0x76B8BE5D609BD5F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f4
loop_1583:
	movne	%icc,	%o6,	%o5
	movge	%icc,	%i3,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i0,	%l1
	fnors	%f25,	%f18,	%f0
	tvs	%xcc,	0x3
	lduw	[%l7 + 0x18],	%o0
	fmul8x16	%f12,	%f30,	%f10
	fbl,a	%fcc3,	loop_1584
	udivx	%g7,	0x154D,	%g4
	edge8ln	%g2,	%l0,	%g3
	umul	%o4,	0x00CD,	%g6
loop_1584:
	xor	%o3,	0x1C8E,	%l4
	edge8ln	%i1,	%i7,	%i6
	xnor	%i2,	0x0384,	%g1
	nop
	setx	0x045955E9F19EA835,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f12
	for	%f14,	%f24,	%f16
	popc	%o1,	%i4
	movrne	%l5,	0x235,	%l3
	array16	%o7,	%l6,	%l2
	movge	%xcc,	%o2,	%i5
	mova	%xcc,	%o6,	%o5
	taddcctv	%i3,	%i0,	%l1
	bpos,a,pt	%xcc,	loop_1585
	bcc	%xcc,	loop_1586
	sll	%g5,	%o0,	%g4
	movneg	%icc,	%g7,	%l0
loop_1585:
	nop
	setx	0x9902BDE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x0353FACE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f3,	%f0
loop_1586:
	fexpand	%f3,	%f28
	addcc	%g3,	%o4,	%g2
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	ldd	[%l7 + 0x70],	%o2
	fmovrdgz	%g6,	%f30,	%f6
	movrgez	%l4,	0x10B,	%i7
	fbule	%fcc2,	loop_1587
	fbul	%fcc1,	loop_1588
	movrlz	%i1,	0x32C,	%i2
	orncc	%i6,	0x1499,	%g1
loop_1587:
	prefetch	[%l7 + 0x4C],	 0x2
loop_1588:
	umulcc	%o1,	0x0651,	%l5
	ld	[%l7 + 0x08],	%f7
	xnorcc	%i4,	0x16AE,	%o7
	movgu	%icc,	%l3,	%l6
	fbule,a	%fcc0,	loop_1589
	fnot2s	%f16,	%f15
	lduw	[%l7 + 0x68],	%l2
	or	%i5,	0x1971,	%o2
loop_1589:
	fmovrdne	%o6,	%f10,	%f16
	movrgz	%o5,	%i0,	%l1
	movrgz	%g5,	0x1A4,	%o0
	fbl,a	%fcc3,	loop_1590
	subccc	%i3,	%g7,	%l0
	ta	%xcc,	0x3
	fpsub32	%f30,	%f26,	%f24
loop_1590:
	tleu	%icc,	0x2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g3
	fxor	%f10,	%f12,	%f12
	movrne	%o4,	%g2,	%g4
	sll	%o3,	0x18,	%g6
	addcc	%i7,	0x02E7,	%i1
	tn	%xcc,	0x5
	xnor	%l4,	0x0CAC,	%i2
	brgz,a	%i6,	loop_1591
	fnot1s	%f17,	%f25
	ldsb	[%l7 + 0x2E],	%g1
	array8	%l5,	%i4,	%o7
loop_1591:
	fmovrdne	%o1,	%f30,	%f14
	movne	%icc,	%l6,	%l3
	bg	loop_1592
	movl	%xcc,	%l2,	%i5
	nop
	setx	0xB1F7DFFDB5AE40D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f20
	xor	%o6,	0x160B,	%o2
loop_1592:
	tleu	%xcc,	0x3
	set	0x63, %l3
	ldstuba	[%l7 + %l3] 0x0c,	%i0
	taddcctv	%l1,	%g5,	%o5
	nop
	setx	0xC3F86D7EEE9BF82A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x173ABF9CA29245DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f22,	%f8
	movrlez	%i3,	%g7,	%o0
	edge8ln	%g3,	%o4,	%l0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	fmovsgu	%icc,	%f8,	%f13
	movleu	%icc,	%g4,	%o3
	andcc	%g6,	0x08C1,	%i7
	sub	%l4,	0x002F,	%i1
	udiv	%i2,	0x09C5,	%g1
	movvc	%icc,	%l5,	%i4
	srax	%o7,	%i6,	%o1
	srax	%l3,	0x08,	%l2
	addccc	%i5,	%l6,	%o6
	te	%icc,	0x5
	tsubcctv	%i0,	%l1,	%g5
	edge16n	%o2,	%o5,	%i3
	tpos	%xcc,	0x5
	fbne,a	%fcc2,	loop_1593
	movrne	%o0,	%g7,	%g3
	fpsub32	%f8,	%f18,	%f18
	nop
	setx	0x9B0CA31BEB3518D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x5C02582D9E84EFC2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f26,	%f20
loop_1593:
	edge32l	%o4,	%l0,	%g2
	fnor	%f22,	%f12,	%f20
	sub	%g4,	%o3,	%i7
	edge32ln	%g6,	%l4,	%i2
	add	%g1,	0x1A4A,	%i1
	fbo,a	%fcc0,	loop_1594
	fpadd32s	%f0,	%f24,	%f3
	fpsub32s	%f19,	%f18,	%f15
	sub	%l5,	%i4,	%i6
loop_1594:
	ldub	[%l7 + 0x4D],	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l3,	%l2
	edge8	%i5,	%o7,	%o6
	ldsh	[%l7 + 0x1E],	%i0
	nop
	setx	0x399A841890737678,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x48DCA477E9A5C63D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f22
	fpadd32s	%f4,	%f2,	%f18
	fands	%f19,	%f17,	%f31
	nop
	setx	0xE899097F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x1A8E7BAE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f15,	%f4
	subccc	%l6,	0x1C2C,	%l1
	nop
	setx	0x9A46B744,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x415BDEA8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f30,	%f1
	movneg	%icc,	%o2,	%o5
	fnand	%f18,	%f22,	%f8
	fmovscs	%xcc,	%f27,	%f9
	and	%i3,	0x177A,	%g5
	sdivcc	%o0,	0x088E,	%g7
	sub	%g3,	0x1A0E,	%o4
	bg,pt	%xcc,	loop_1595
	fblg	%fcc3,	loop_1596
	mulx	%g2,	0x1AE6,	%l0
	udiv	%o3,	0x0376,	%i7
loop_1595:
	fmovdgu	%icc,	%f26,	%f29
loop_1596:
	be	loop_1597
	fpsub16	%f8,	%f12,	%f10
	edge16	%g4,	%g6,	%l4
	subc	%i2,	%g1,	%i1
loop_1597:
	ldd	[%l7 + 0x18],	%f8
	movne	%xcc,	%l5,	%i6
	fcmple32	%f28,	%f20,	%i4
	subc	%o1,	0x176E,	%l2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%i5
	fnot1	%f6,	%f4
	addcc	%o7,	%o6,	%i0
	move	%xcc,	%l3,	%l6
	fmovsvs	%xcc,	%f13,	%f27
	array8	%l1,	%o5,	%o2
	umul	%i3,	%o0,	%g5
	set	0x30, %i4
	ldxa	[%g0 + %i4] 0x4f,	%g3
	addccc	%g7,	0x08D7,	%g2
	umulcc	%o4,	0x13C8,	%o3
	edge8	%l0,	%i7,	%g6
	tg	%icc,	0x1
	fble,a	%fcc2,	loop_1598
	movg	%xcc,	%g4,	%i2
	ldd	[%l7 + 0x48],	%l4
	fmovrsne	%i1,	%f22,	%f19
loop_1598:
	smul	%l5,	0x07EC,	%g1
	subccc	%i4,	0x0DC8,	%o1
	ldsh	[%l7 + 0x14],	%i6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x10
	mulx	%i5,	%o7,	%l2
	fmovsleu	%xcc,	%f3,	%f31
	bge	%icc,	loop_1599
	edge32n	%o6,	%i0,	%l6
	edge16n	%l3,	%o5,	%l1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%i3
loop_1599:
	edge8ln	%o2,	%o0,	%g3
	subccc	%g7,	%g5,	%g2
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f24
	subcc	%o4,	0x00C9,	%o3
	fone	%f30
	tg	%icc,	0x7
	fmovrsgz	%i7,	%f26,	%f16
	movn	%xcc,	%l0,	%g6
	sra	%i2,	%g4,	%i1
	subc	%l5,	%l4,	%i4
	sra	%g1,	%o1,	%i5
	sllx	%i6,	0x1E,	%l2
	wr	%g0,	0x88,	%asi
	stba	%o7,	[%l7 + 0x77] %asi
	sdivcc	%o6,	0x17AF,	%i0
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x50] %asi
	fbule	%fcc2,	loop_1600
	andncc	%l3,	%o5,	%l1
	andncc	%o2,	%o0,	%i3
	tleu	%xcc,	0x6
loop_1600:
	fmovs	%f14,	%f10
	tgu	%xcc,	0x0
	set	0x0A, %g4
	stba	%g3,	[%l7 + %g4] 0xe2
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g5,	%g7,	%g2
	tneg	%icc,	0x2
	ld	[%l7 + 0x3C],	%f20
	andn	%o3,	%i7,	%o4
	fmovscc	%xcc,	%f24,	%f13
	fmovrdgez	%g6,	%f22,	%f12
	srlx	%i2,	0x0C,	%g4
	stx	%l0,	[%l7 + 0x30]
	faligndata	%f8,	%f6,	%f0
	array16	%l5,	%l4,	%i1
	srl	%i4,	%g1,	%o1
	smulcc	%i5,	%i6,	%o7
	movl	%icc,	%l2,	%o6
	movrlez	%l6,	%l3,	%o5
	movpos	%icc,	%i0,	%l1
	movge	%xcc,	%o2,	%i3
	prefetch	[%l7 + 0x08],	 0x0
	nop
	setx	0x4055DB2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	movn	%icc,	%g3,	%g5
	sll	%g7,	0x18,	%o0
	movre	%g2,	%o3,	%i7
	fmovdneg	%icc,	%f3,	%f3
	mulx	%o4,	%i2,	%g4
	movrlz	%g6,	0x28F,	%l0
	orncc	%l5,	%i1,	%l4
	subccc	%g1,	0x0C5A,	%o1
	for	%f10,	%f22,	%f20
	xor	%i4,	0x14E9,	%i6
	smulcc	%i5,	0x1978,	%l2
	tvs	%xcc,	0x0
	membar	0x51
	fxnors	%f19,	%f24,	%f30
	movl	%xcc,	%o7,	%o6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	fitos	%f0,	%f3
	fstox	%f3,	%f2
	fxtos	%f2,	%f24
	nop
	setx	loop_1601,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fand	%f6,	%f24,	%f10
	andncc	%l3,	%o5,	%l6
	ldsb	[%l7 + 0x74],	%l1
loop_1601:
	edge32ln	%i0,	%o2,	%g3
	andn	%i3,	0x1ABC,	%g5
	fnor	%f24,	%f12,	%f22
	tneg	%icc,	0x4
	brgez	%g7,	loop_1602
	nop
	setx	0x751448853072E6BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	alignaddr	%o0,	%g2,	%i7
	lduh	[%l7 + 0x4A],	%o4
loop_1602:
	sll	%o3,	%i2,	%g4
	movrgz	%g6,	0x2AF,	%l5
	tl	%icc,	0x5
	nop
	setx	0xA72BAF74,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xD744829C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f13,	%f19
	andncc	%l0,	%l4,	%g1
	ta	%icc,	0x7
	ldx	[%l7 + 0x30],	%i1
	tn	%icc,	0x6
	alignaddrl	%o1,	%i4,	%i6
	ldsw	[%l7 + 0x10],	%l2
	movrgz	%o7,	%o6,	%i5
	bpos,a,pn	%xcc,	loop_1603
	movneg	%xcc,	%o5,	%l6
	edge8n	%l3,	%l1,	%i0
	umul	%o2,	%i3,	%g5
loop_1603:
	edge32ln	%g7,	%o0,	%g3
	array16	%i7,	%o4,	%o3
	fsrc1s	%f20,	%f17
	movl	%xcc,	%g2,	%i2
	alignaddr	%g4,	%g6,	%l0
	taddcctv	%l4,	%l5,	%i1
	fmovdne	%icc,	%f14,	%f14
	sub	%o1,	%i4,	%i6
	array16	%l2,	%o7,	%o6
	orcc	%g1,	%o5,	%i5
	tcc	%xcc,	0x5
	subc	%l3,	0x0C6E,	%l6
	sethi	0x149E,	%l1
	mova	%icc,	%o2,	%i0
	movne	%icc,	%i3,	%g7
	nop
	fitod	%f6,	%f4
	movrlz	%o0,	%g3,	%g5
	movvc	%icc,	%i7,	%o3
	brnz,a	%g2,	loop_1604
	fmovrslez	%i2,	%f11,	%f6
	fornot1s	%f20,	%f30,	%f1
	bne,a	%icc,	loop_1605
loop_1604:
	fmovdg	%icc,	%f21,	%f11
	edge16	%g4,	%g6,	%o4
	movg	%icc,	%l0,	%l5
loop_1605:
	nop
	set	0x18, %i1
	std	%f18,	[%l7 + %i1]
	tpos	%icc,	0x6
	tleu	%xcc,	0x2
	fble	%fcc0,	loop_1606
	fmovdvc	%xcc,	%f23,	%f19
	ld	[%l7 + 0x70],	%f13
	srl	%i1,	%l4,	%i4
loop_1606:
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f26
	movneg	%icc,	%o1,	%l2
	fabss	%f30,	%f14
	add	%i6,	%o7,	%g1
	edge16	%o6,	%o5,	%i5
	array16	%l6,	%l1,	%o2
	tcs	%icc,	0x2
	st	%f22,	[%l7 + 0x24]
	move	%icc,	%i0,	%i3
	fmovsne	%icc,	%f23,	%f17
	edge16	%l3,	%o0,	%g7
	edge8n	%g3,	%i7,	%o3
	tl	%xcc,	0x2
	edge16	%g2,	%i2,	%g5
	udiv	%g4,	0x138F,	%g6
	sdivcc	%l0,	0x1852,	%o4
	fnot2	%f12,	%f14
	alignaddr	%i1,	%l4,	%i4
	fornot1	%f2,	%f8,	%f22
	subccc	%o1,	0x1916,	%l5
	tne	%icc,	0x6
	fabss	%f9,	%f9
	edge8ln	%i6,	%o7,	%l2
	brlez	%g1,	loop_1607
	movrlz	%o5,	0x2E5,	%o6
	tsubcctv	%i5,	0x0B5A,	%l1
	xnor	%o2,	%i0,	%l6
loop_1607:
	fmovsvc	%icc,	%f25,	%f29
	orncc	%l3,	%o0,	%g7
	udiv	%g3,	0x184D,	%i7
	fmovsn	%xcc,	%f13,	%f0
	andcc	%i3,	%g2,	%i2
	nop
	fitos	%f2,	%f6
	fstox	%f6,	%f4
	fxors	%f20,	%f14,	%f6
	sllx	%o3,	0x06,	%g4
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	movcc	%icc,	%g6,	%l0
	bpos	%icc,	loop_1608
	sra	%g5,	%i1,	%o4
	orcc	%i4,	0x1B66,	%o1
	andncc	%l4,	%i6,	%o7
loop_1608:
	nop
	wr	%g0,	0xea,	%asi
	stwa	%l5,	[%l7 + 0x34] %asi
	membar	#Sync
	fba	%fcc1,	loop_1609
	fpsub32	%f12,	%f26,	%f30
	array16	%l2,	%o5,	%o6
	movvc	%icc,	%g1,	%i5
loop_1609:
	xnorcc	%l1,	0x0BC3,	%i0
	edge32ln	%l6,	%l3,	%o0
	movge	%icc,	%g7,	%o2
	movrne	%g3,	0x3B8,	%i3
	movg	%xcc,	%g2,	%i2
	st	%f4,	[%l7 + 0x74]
	nop
	setx loop_1610, %l0, %l1
	jmpl %l1, %i7
	ldstub	[%l7 + 0x25],	%o3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%g6
loop_1610:
	movre	%g5,	%l0,	%i1
	ta	%icc,	0x2
	fzero	%f22
	movrgez	%i4,	0x3E3,	%o4
	taddcctv	%o1,	0x0A06,	%i6
	movrgez	%l4,	%o7,	%l2
	fmovdvc	%icc,	%f8,	%f14
	movvs	%xcc,	%o5,	%o6
	sdivx	%g1,	0x013C,	%l5
	movcs	%icc,	%l1,	%i0
	stw	%i5,	[%l7 + 0x70]
	edge8n	%l6,	%l3,	%o0
	fmovdge	%xcc,	%f29,	%f18
	swap	[%l7 + 0x30],	%g7
	tle	%icc,	0x3
	movrgz	%o2,	0x0A6,	%i3
	xnorcc	%g3,	%i2,	%g2
	movrlez	%i7,	%g4,	%o3
	brlez,a	%g6,	loop_1611
	fmovdn	%icc,	%f27,	%f30
	bpos	%icc,	loop_1612
	fbg	%fcc3,	loop_1613
loop_1611:
	movg	%icc,	%l0,	%g5
	orcc	%i1,	0x187B,	%i4
loop_1612:
	movne	%xcc,	%o1,	%i6
loop_1613:
	fnand	%f8,	%f2,	%f6
	sub	%l4,	0x0C3D,	%o4
	andn	%o7,	0x1C8F,	%o5
	srlx	%o6,	0x1A,	%l2
	movge	%icc,	%l5,	%g1
	movrlez	%i0,	0x274,	%i5
	fpsub16	%f10,	%f16,	%f8
	sir	0x100F
	orncc	%l6,	%l3,	%o0
	subc	%l1,	0x157B,	%o2
	or	%g7,	%i3,	%g3
	flush	%l7 + 0x20
	array16	%g2,	%i2,	%g4
	tle	%icc,	0x6
	movneg	%xcc,	%o3,	%i7
	edge32ln	%l0,	%g6,	%g5
	fzero	%f12
	sllx	%i1,	%i4,	%i6
	srlx	%o1,	0x06,	%l4
	subc	%o4,	0x1C0F,	%o5
	nop
	setx	0x806B1597,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	or	%o6,	%o7,	%l5
	ldsb	[%l7 + 0x48],	%g1
	lduw	[%l7 + 0x38],	%l2
	fmovspos	%xcc,	%f9,	%f2
	movleu	%xcc,	%i0,	%l6
	fpack16	%f10,	%f12
	umul	%i5,	%l3,	%l1
	tn	%icc,	0x5
	fsrc1	%f0,	%f0
	nop
	setx	loop_1614,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%o2,	0x1316,	%o0
	nop
	setx	0xCE8D7887,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x4E004522,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f5,	%f8
	sra	%g7,	%g3,	%g2
loop_1614:
	mulscc	%i2,	0x0E8F,	%g4
	sra	%i3,	0x10,	%o3
	edge32ln	%l0,	%g6,	%i7
	stbar
	andncc	%i1,	%g5,	%i6
	movcs	%icc,	%o1,	%l4
	fmovdle	%xcc,	%f20,	%f29
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f6
	fxtod	%f6,	%f12
	udivcc	%o4,	0x0C0B,	%i4
	tn	%icc,	0x2
	sll	%o6,	%o7,	%l5
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0x1
	fornot2s	%f19,	%f12,	%f4
	set	0x48, %g7
	sta	%f8,	[%l7 + %g7] 0x04
	movne	%xcc,	%g1,	%i0
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x17
	membar	#Sync
	ta	%icc,	0x3
	mulx	%l6,	0x02F3,	%l2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%l3
	fblg	%fcc3,	loop_1615
	movge	%xcc,	%l1,	%o2
	alignaddr	%g7,	%g3,	%g2
	taddcctv	%o0,	0x0337,	%i2
loop_1615:
	srax	%i3,	%g4,	%o3
	popc	%g6,	%i7
	srlx	%l0,	0x18,	%i1
	brgez	%i6,	loop_1616
	tpos	%xcc,	0x1
	fbl,a	%fcc3,	loop_1617
	tsubcc	%g5,	%o1,	%o4
loop_1616:
	bpos	%xcc,	loop_1618
	srlx	%l4,	%i4,	%o6
loop_1617:
	fmovrdgz	%l5,	%f10,	%f16
	fble,a	%fcc1,	loop_1619
loop_1618:
	edge16n	%o5,	%g1,	%o7
	mulscc	%l6,	0x0552,	%l2
	udivx	%i0,	0x04CC,	%l3
loop_1619:
	membar	0x51
	xnor	%i5,	%l1,	%g7
	nop
	setx	0x9222419B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f23
	alignaddr	%g3,	%g2,	%o0
	fxnor	%f18,	%f24,	%f8
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x1C] %asi,	%f28
	fbge,a	%fcc3,	loop_1620
	sub	%o2,	%i2,	%i3
	bvc,pn	%xcc,	loop_1621
	tsubcc	%g4,	%g6,	%o3
loop_1620:
	srax	%i7,	%l0,	%i6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x32] %asi,	%i1
loop_1621:
	tl	%xcc,	0x4
	andn	%o1,	0x1D55,	%g5
	fbu,a	%fcc1,	loop_1622
	add	%l4,	%i4,	%o4
	tleu	%xcc,	0x5
	sth	%o6,	[%l7 + 0x6A]
loop_1622:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o5
	fcmpne16	%f18,	%f26,	%g1
	set	0x0A, %i2
	ldsba	[%l7 + %i2] 0x14,	%l5
	or	%o7,	0x1B96,	%l6
	xnorcc	%i0,	0x070C,	%l2
	nop
	setx	0x0BF7E5E0F038B669,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x21054DBCA071F5A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f0,	%f12
	tsubcc	%i5,	%l1,	%g7
	ldsb	[%l7 + 0x6E],	%l3
	move	%icc,	%g2,	%o0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x3E] %asi,	%o2
	xorcc	%i2,	0x12DC,	%g3
	fmovdpos	%icc,	%f2,	%f1
	addccc	%g4,	0x1C51,	%g6
	mulscc	%i3,	%o3,	%l0
	popc	%i6,	%i1
	movvs	%xcc,	%i7,	%g5
	nop
	setx	0xB403080CE09AE888,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x4A92BB5E5F1B56B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f28
	nop
	set	0x0C, %l5
	lduw	[%l7 + %l5],	%o1
	ldx	[%l7 + 0x60],	%i4
	fmovsa	%icc,	%f29,	%f30
	tleu	%xcc,	0x3
	membar	0x4C
	fmovrse	%l4,	%f27,	%f24
	fpadd16	%f4,	%f8,	%f18
	sub	%o6,	%o5,	%o4
	movre	%g1,	%l5,	%l6
	bleu,pt	%icc,	loop_1623
	ld	[%l7 + 0x3C],	%f19
	movcc	%icc,	%i0,	%o7
	lduh	[%l7 + 0x52],	%l2
loop_1623:
	bne,a	loop_1624
	udivx	%l1,	0x1CFC,	%i5
	subcc	%g7,	0x057C,	%g2
	edge32l	%o0,	%l3,	%i2
loop_1624:
	addc	%g3,	0x1551,	%g4
	srax	%g6,	0x05,	%i3
	ta	%icc,	0x6
	set	0x48, %o4
	lduwa	[%l7 + %o4] 0x0c,	%o2
	orcc	%l0,	0x1EE0,	%i6
	movleu	%xcc,	%i1,	%i7
	fmul8ulx16	%f10,	%f18,	%f8
	fornot1s	%f23,	%f11,	%f31
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	xorcc	%o1,	0x0783,	%i4
	tsubcc	%o3,	0x033E,	%o6
	subccc	%l4,	%o5,	%g1
	movg	%icc,	%l5,	%l6
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f12
	fzero	%f12
	sllx	%o4,	%i0,	%l2
	fbe	%fcc3,	loop_1625
	tvc	%icc,	0x0
	sll	%l1,	0x0B,	%i5
	nop
	fitos	%f5,	%f4
	fstox	%f4,	%f26
loop_1625:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x4D, %g6
	stba	%o7,	[%l7 + %g6] 0x10
	popc	0x1FA0,	%g7
	movle	%icc,	%g2,	%o0
	movrgz	%i2,	%g3,	%g4
	te	%icc,	0x6
	or	%g6,	0x12BC,	%l3
	wr	%g0,	0x04,	%asi
	sta	%f14,	[%l7 + 0x54] %asi
	tvs	%icc,	0x1
	sdivcc	%o2,	0x01C4,	%l0
	udivx	%i6,	0x0D3C,	%i1
	edge8n	%i7,	%i3,	%o1
	xorcc	%g5,	%o3,	%o6
	nop
	setx	0x904DF873,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fbuge,a	%fcc1,	loop_1626
	array32	%i4,	%o5,	%l4
	bneg,a	%xcc,	loop_1627
	movge	%xcc,	%l5,	%l6
loop_1626:
	xorcc	%o4,	0x1988,	%g1
	bvs,a,pn	%icc,	loop_1628
loop_1627:
	movn	%xcc,	%l2,	%i0
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f7
	fbule,a	%fcc3,	loop_1629
loop_1628:
	movre	%i5,	0x043,	%o7
	move	%icc,	%g7,	%g2
	nop
	setx	0xDAEAD4AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x7A5DEA09,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f3,	%f20
loop_1629:
	edge32l	%l1,	%i2,	%o0
	fmovsg	%xcc,	%f4,	%f3
	subccc	%g3,	%g6,	%g4
	bn,pn	%icc,	loop_1630
	edge32	%l3,	%l0,	%o2
	edge16n	%i6,	%i7,	%i3
	fmovdpos	%icc,	%f31,	%f0
loop_1630:
	edge8ln	%i1,	%g5,	%o1
	alignaddr	%o6,	%i4,	%o3
	xnorcc	%l4,	0x03E4,	%o5
	smul	%l5,	%l6,	%o4
	movcs	%xcc,	%l2,	%g1
	bn,a,pt	%icc,	loop_1631
	brgez	%i5,	loop_1632
	bleu	loop_1633
	lduw	[%l7 + 0x10],	%o7
loop_1631:
	fxnors	%f9,	%f11,	%f28
loop_1632:
	nop
	setx	0x711FFC6C2D8988D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f10
loop_1633:
	movne	%icc,	%i0,	%g2
	tvc	%xcc,	0x2
	mulx	%l1,	%i2,	%g7
	stbar
	edge16ln	%g3,	%o0,	%g6
	nop
	setx	0x6AFA2417,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xE7FAA6ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f5,	%f6
	faligndata	%f8,	%f24,	%f8
	fbn,a	%fcc0,	loop_1634
	mova	%icc,	%l3,	%l0
	bneg,a	loop_1635
	edge32n	%o2,	%g4,	%i6
loop_1634:
	tcs	%icc,	0x0
	fbn	%fcc1,	loop_1636
loop_1635:
	tl	%xcc,	0x4
	edge8l	%i3,	%i1,	%g5
	sir	0x180D
loop_1636:
	bge,a,pt	%icc,	loop_1637
	fbg	%fcc0,	loop_1638
	smul	%i7,	%o1,	%o6
	sdivx	%o3,	0x07E0,	%i4
loop_1637:
	tgu	%icc,	0x4
loop_1638:
	swap	[%l7 + 0x18],	%o5
	set	0x64, %g1
	ldswa	[%l7 + %g1] 0x14,	%l4
	fblg,a	%fcc0,	loop_1639
	edge16	%l6,	%o4,	%l5
	orncc	%g1,	%l2,	%o7
	fbu	%fcc1,	loop_1640
loop_1639:
	sdivx	%i5,	0x0BC4,	%g2
	fbge	%fcc1,	loop_1641
	fmovs	%f13,	%f14
loop_1640:
	stw	%l1,	[%l7 + 0x74]
	ta	%icc,	0x3
loop_1641:
	bneg,pn	%xcc,	loop_1642
	tl	%icc,	0x4
	set	0x52, %i7
	stha	%i0,	[%l7 + %i7] 0x10
loop_1642:
	tge	%icc,	0x4
	fnors	%f16,	%f6,	%f13
	fblg,a	%fcc3,	loop_1643
	tg	%icc,	0x7
	addccc	%g7,	%i2,	%o0
	sir	0x04B0
loop_1643:
	movn	%xcc,	%g6,	%g3
	fble,a	%fcc0,	loop_1644
	flush	%l7 + 0x44
	movgu	%xcc,	%l3,	%l0
	mulscc	%g4,	%o2,	%i3
loop_1644:
	fmovdgu	%icc,	%f3,	%f2
	udivcc	%i6,	0x0A4D,	%i1
	srlx	%g5,	0x14,	%o1
	movrlz	%i7,	%o3,	%o6
	fmovsle	%xcc,	%f7,	%f18
	fmovrdlez	%o5,	%f16,	%f6
	movrlz	%l4,	%i4,	%l6
	srlx	%l5,	%o4,	%g1
	fmovdgu	%xcc,	%f23,	%f0
	fnot2s	%f23,	%f4
	fmovdg	%xcc,	%f22,	%f5
	ldsb	[%l7 + 0x58],	%l2
	fbul	%fcc1,	loop_1645
	fands	%f18,	%f29,	%f14
	fandnot1	%f14,	%f6,	%f18
	movl	%icc,	%o7,	%g2
loop_1645:
	fmovdn	%xcc,	%f20,	%f30
	stb	%i5,	[%l7 + 0x69]
	movge	%icc,	%l1,	%g7
	bge,a	loop_1646
	tsubcc	%i0,	0x03F4,	%i2
	bleu	%icc,	loop_1647
	te	%icc,	0x2
loop_1646:
	fmul8x16au	%f3,	%f31,	%f4
	movrne	%g6,	0x36B,	%g3
loop_1647:
	nop
	set	0x66, %l2
	ldsba	[%l7 + %l2] 0x11,	%o0
	movcs	%xcc,	%l3,	%l0
	subcc	%g4,	0x0A3A,	%o2
	sethi	0x0734,	%i3
	fmuld8ulx16	%f29,	%f21,	%f12
	nop
	set	0x19, %i6
	ldub	[%l7 + %i6],	%i6
	movl	%icc,	%i1,	%o1
	stbar
	edge16l	%i7,	%g5,	%o6
	or	%o5,	0x072E,	%o3
	for	%f4,	%f0,	%f26
	tpos	%icc,	0x6
	and	%i4,	0x0A1E,	%l4
	movn	%icc,	%l6,	%l5
	movl	%xcc,	%o4,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%g1
	array16	%i5,	%g2,	%g7
	fbu	%fcc0,	loop_1648
	fbu,a	%fcc2,	loop_1649
	movge	%icc,	%i0,	%i2
	movrlz	%g6,	%g3,	%l1
loop_1648:
	bcc,a	%icc,	loop_1650
loop_1649:
	fbn	%fcc1,	loop_1651
	prefetch	[%l7 + 0x6C],	 0x1
	wr	%g0,	0x89,	%asi
	sta	%f6,	[%l7 + 0x5C] %asi
loop_1650:
	fbg,a	%fcc3,	loop_1652
loop_1651:
	mulscc	%o0,	0x1A8A,	%l0
	fbo,a	%fcc1,	loop_1653
	ta	%icc,	0x3
loop_1652:
	fnot1s	%f25,	%f31
	movvs	%xcc,	%g4,	%l3
loop_1653:
	fbule,a	%fcc2,	loop_1654
	ldsb	[%l7 + 0x58],	%i3
	fmovrslez	%o2,	%f29,	%f15
	tge	%xcc,	0x1
loop_1654:
	tg	%icc,	0x6
	fba	%fcc1,	loop_1655
	orcc	%i1,	0x0CDD,	%i6
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0x1
loop_1655:
	array16	%g5,	%i7,	%o6
	movleu	%xcc,	%o3,	%i4
	tgu	%xcc,	0x2
	tcc	%xcc,	0x5
	fnot2	%f22,	%f18
	stbar
	movpos	%xcc,	%o5,	%l6
	tleu	%icc,	0x6
	stb	%l4,	[%l7 + 0x7A]
	andncc	%o4,	%l5,	%o7
	set	0x10, %o6
	stxa	%l2,	[%g0 + %o6] 0x21
	edge16n	%i5,	%g1,	%g7
	fmovrdlz	%g2,	%f4,	%f28
	srl	%i0,	%g6,	%g3
	tpos	%icc,	0x6
	array16	%l1,	%o0,	%l0
	nop
	setx	0xFFDCACDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x0DD44701,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f24,	%f13
	addccc	%g4,	%i2,	%l3
	sra	%o2,	0x06,	%i1
	nop
	fitos	%f10,	%f3
	fstod	%f3,	%f18
	xnor	%i3,	%o1,	%g5
	edge8l	%i6,	%i7,	%o3
	fmovdl	%xcc,	%f15,	%f23
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x11,	%i4
	tl	%icc,	0x5
	movn	%xcc,	%o5,	%o6
	edge16l	%l4,	%l6,	%o4
	taddcctv	%o7,	0x170D,	%l2
	stbar
	fmovdcs	%xcc,	%f5,	%f14
	addc	%i5,	%g1,	%l5
	wr	%g0,	0x23,	%asi
	stwa	%g7,	[%l7 + 0x68] %asi
	membar	#Sync
	tge	%icc,	0x7
	addccc	%i0,	%g2,	%g6
	add	%g3,	0x0FCF,	%o0
	edge8l	%l0,	%l1,	%g4
	te	%xcc,	0x7
	fmovsleu	%xcc,	%f13,	%f31
	lduh	[%l7 + 0x5E],	%i2
	edge32	%l3,	%o2,	%i1
	prefetch	[%l7 + 0x18],	 0x1
	popc	0x1CB2,	%o1
	sra	%i3,	0x1B,	%i6
	xnor	%i7,	0x09A4,	%o3
	smulcc	%i4,	%g5,	%o5
	prefetch	[%l7 + 0x48],	 0x1
	xor	%l4,	%o6,	%l6
	srax	%o7,	%l2,	%o4
	fcmpgt16	%f0,	%f6,	%g1
	edge16ln	%i5,	%l5,	%i0
	bvs,a	%xcc,	loop_1656
	tneg	%icc,	0x1
	movg	%xcc,	%g7,	%g6
	movrlez	%g3,	0x00C,	%g2
loop_1656:
	edge8n	%o0,	%l0,	%l1
	movrgez	%g4,	%i2,	%o2
	tcc	%xcc,	0x1
	fpack16	%f30,	%f12
	alignaddrl	%l3,	%i1,	%o1
	tvs	%xcc,	0x3
	subc	%i6,	%i3,	%o3
	movleu	%xcc,	%i7,	%i4
	umulcc	%g5,	%o5,	%l4
	xnorcc	%l6,	0x1B9B,	%o7
	fmovdn	%xcc,	%f0,	%f7
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x19] %asi,	%o6
	movne	%xcc,	%l2,	%g1
	alignaddr	%o4,	%l5,	%i0
	edge16l	%g7,	%g6,	%i5
	tvc	%icc,	0x7
	brgz,a	%g2,	loop_1657
	movrne	%g3,	0x008,	%o0
	fmuld8ulx16	%f3,	%f7,	%f0
	tsubcctv	%l1,	%l0,	%i2
loop_1657:
	te	%xcc,	0x7
	fnor	%f4,	%f0,	%f14
	sdiv	%o2,	0x116A,	%g4
	brlz,a	%i1,	loop_1658
	array8	%l3,	%i6,	%o1
	be,a,pt	%xcc,	loop_1659
	tsubcctv	%i3,	%o3,	%i4
loop_1658:
	movge	%xcc,	%i7,	%o5
	fbn	%fcc2,	loop_1660
loop_1659:
	fpadd16s	%f9,	%f9,	%f28
	mulscc	%l4,	%g5,	%o7
	nop
	fitos	%f8,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f11
loop_1660:
	array16	%l6,	%o6,	%l2
	addc	%o4,	%g1,	%i0
	fnot2	%f10,	%f28
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movleu	%xcc,	%l5,	%g6
	fmuld8sux16	%f20,	%f9,	%f8
	ta	%icc,	0x3
	srax	%i5,	0x04,	%g2
	fmovrde	%g3,	%f8,	%f28
	edge32	%g7,	%o0,	%l1
	and	%l0,	0x0801,	%i2
	mulscc	%o2,	0x0A15,	%i1
	edge8ln	%l3,	%g4,	%o1
	ld	[%l7 + 0x50],	%f28
	fmovdcc	%icc,	%f15,	%f9
	bl	%xcc,	loop_1661
	umul	%i3,	%i6,	%i4
	andcc	%o3,	%i7,	%o5
	fmovs	%f13,	%f8
loop_1661:
	srl	%g5,	0x0B,	%l4
	fbn	%fcc0,	loop_1662
	bvs,a	loop_1663
	fbne	%fcc1,	loop_1664
	fmul8x16au	%f29,	%f6,	%f14
loop_1662:
	sdivx	%o7,	0x1187,	%l6
loop_1663:
	array32	%l2,	%o6,	%g1
loop_1664:
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i0
	fbul	%fcc1,	loop_1665
	fmovdneg	%icc,	%f22,	%f25
	fnot2	%f28,	%f0
	bn,a,pn	%xcc,	loop_1666
loop_1665:
	lduh	[%l7 + 0x54],	%o4
	fmovsge	%icc,	%f11,	%f6
	lduh	[%l7 + 0x1A],	%l5
loop_1666:
	fmovrdlez	%g6,	%f20,	%f28
	srax	%g2,	0x07,	%g3
	nop
	set	0x20, %i3
	lduw	[%l7 + %i3],	%g7
	umul	%o0,	%i5,	%l1
	fpackfix	%f28,	%f21
	tneg	%icc,	0x4
	fandnot2s	%f27,	%f12,	%f6
	fmovdvc	%xcc,	%f23,	%f17
	movpos	%xcc,	%i2,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%o2
	fpsub16	%f8,	%f22,	%f10
	sll	%g4,	%o1,	%l3
	wr	%g0,	0xeb,	%asi
	stba	%i3,	[%l7 + 0x43] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movl	%icc,	%i6,	%o3
	movcs	%icc,	%i4,	%i7
	fbn	%fcc2,	loop_1667
	movge	%icc,	%o5,	%l4
	bn,a,pt	%xcc,	loop_1668
	mulx	%o7,	0x18A2,	%l6
loop_1667:
	tl	%icc,	0x2
	fmovsa	%xcc,	%f7,	%f6
loop_1668:
	sdivx	%l2,	0x0D35,	%o6
	nop
	setx loop_1669, %l0, %l1
	jmpl %l1, %g5
	stb	%i0,	[%l7 + 0x1E]
	fmovdne	%icc,	%f14,	%f8
	nop
	setx	0xF9E33B7782EA8A8A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f0
loop_1669:
	movgu	%icc,	%g1,	%o4
	fmovdpos	%xcc,	%f17,	%f7
	array16	%l5,	%g6,	%g3
	movvs	%xcc,	%g7,	%o0
	movrlz	%g2,	0x2EE,	%l1
	movgu	%icc,	%i5,	%l0
	andcc	%i2,	0x0FF3,	%i1
	ta	%icc,	0x0
	smul	%g4,	0x01D3,	%o1
	fcmpgt32	%f2,	%f12,	%l3
	tgu	%xcc,	0x7
	bleu,pt	%xcc,	loop_1670
	call	loop_1671
	fmovdl	%xcc,	%f15,	%f4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i3
loop_1670:
	bcs,pt	%icc,	loop_1672
loop_1671:
	fbue	%fcc3,	loop_1673
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f16
	andn	%o2,	%i6,	%i4
loop_1672:
	edge16ln	%i7,	%o5,	%o3
loop_1673:
	tneg	%icc,	0x6
	alignaddrl	%l4,	%o7,	%l2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	fpsub16s	%f13,	%f11,	%f26
	ldub	[%l7 + 0x09],	%g5
	nop
	setx	0x01074E11804667BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	umulcc	%i0,	%o6,	%g1
	fmovd	%f10,	%f8
	movg	%icc,	%o4,	%g6
	fbe	%fcc2,	loop_1674
	udivcc	%l5,	0x0B38,	%g7
	ldd	[%l7 + 0x60],	%o0
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1674:
	fbge	%fcc3,	loop_1675
	brlez,a	%g2,	loop_1676
	edge16n	%l1,	%g3,	%i5
	fmovsgu	%xcc,	%f0,	%f13
loop_1675:
	sra	%l0,	0x0F,	%i2
loop_1676:
	tgu	%icc,	0x5
	bcs,pt	%icc,	loop_1677
	umulcc	%g4,	%i1,	%o1
	fbo	%fcc0,	loop_1678
	fnegs	%f25,	%f10
loop_1677:
	fmovrslez	%i3,	%f0,	%f1
	sdivcc	%o2,	0x1887,	%l3
loop_1678:
	tpos	%icc,	0x2
	tle	%icc,	0x4
	fmovrde	%i6,	%f20,	%f0
	edge16l	%i7,	%o5,	%i4
	sllx	%o3,	%l4,	%o7
	fmovsgu	%icc,	%f31,	%f18
	fmovsn	%icc,	%f27,	%f9
	movrne	%l2,	0x275,	%l6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	array32	%g5,	%o6,	%o4
	fmovsn	%icc,	%f20,	%f5
	movrgz	%g6,	%g1,	%l5
	flush	%l7 + 0x08
	movne	%icc,	%o0,	%g7
	movne	%icc,	%g2,	%g3
	nop
	setx	0xC2F3EB4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f1
	nop
	setx	loop_1679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%l1,	0x13BE,	%l0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i5
loop_1679:
	alignaddr	%g4,	%i2,	%o1
	tvc	%icc,	0x2
	tn	%xcc,	0x5
	stb	%i1,	[%l7 + 0x25]
	set	0x29, %l1
	ldsba	[%l7 + %l1] 0x19,	%o2
	fmovsg	%icc,	%f18,	%f12
	array8	%l3,	%i6,	%i3
	edge16ln	%o5,	%i4,	%o3
	and	%i7,	0x0228,	%o7
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addcc	%l4,	%l6,	%i0
	bne,a,pn	%xcc,	loop_1680
	udivcc	%g5,	0x0A07,	%o6
	sethi	0x100E,	%l2
	fcmpne16	%f24,	%f14,	%o4
loop_1680:
	edge8ln	%g1,	%g6,	%l5
	bvc	loop_1681
	alignaddr	%o0,	%g7,	%g2
	nop
	setx	loop_1682,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x4
loop_1681:
	andn	%l1,	%l0,	%i5
	array32	%g4,	%i2,	%g3
loop_1682:
	sllx	%o1,	0x0A,	%o2
	sllx	%l3,	%i6,	%i1
	sir	0x1C54
	mulscc	%o5,	%i4,	%o3
	tn	%xcc,	0x1
	fmovrde	%i3,	%f12,	%f28
	edge16l	%i7,	%o7,	%l4
	movle	%xcc,	%i0,	%l6
	movgu	%xcc,	%g5,	%l2
	addcc	%o4,	0x0F64,	%g1
	fands	%f23,	%f6,	%f19
	fmovrde	%g6,	%f16,	%f2
	movpos	%xcc,	%o6,	%o0
	nop
	setx	0xBACB6268DA965F4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x51C59210D0E3C555,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f30
	srl	%g7,	0x13,	%g2
	fbug	%fcc2,	loop_1683
	tle	%icc,	0x2
	edge32ln	%l1,	%l5,	%i5
	ble	loop_1684
loop_1683:
	nop
	setx	0x72350564B1C3BDBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x47F5BB7067A1A169,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f8,	%f10
	andn	%l0,	0x03BB,	%g4
	mulx	%g3,	0x1BC3,	%o1
loop_1684:
	nop
	setx	0xAEBAC20903A1F7D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x2B15ACD3DB7FB5A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f16,	%f20
	tvs	%xcc,	0x1
	fmovsl	%icc,	%f0,	%f15
	popc	0x13F3,	%i2
	fmovsne	%xcc,	%f11,	%f3
	edge8n	%l3,	%o2,	%i6
	fmovrdlez	%o5,	%f18,	%f8
	tpos	%xcc,	0x1
	lduh	[%l7 + 0x10],	%i1
	fbug	%fcc0,	loop_1685
	fnegs	%f0,	%f27
	udiv	%i4,	0x1A43,	%i3
	smul	%i7,	0x1213,	%o3
loop_1685:
	tpos	%icc,	0x6
	movl	%icc,	%o7,	%i0
	movrgez	%l6,	%g5,	%l4
	sdivcc	%l2,	0x1B56,	%o4
	tn	%icc,	0x3
	movcc	%icc,	%g6,	%o6
	fpack32	%f28,	%f0,	%f10
	alignaddr	%g1,	%g7,	%g2
	movvs	%xcc,	%o0,	%l5
	tn	%xcc,	0x1
	udivx	%i5,	0x017F,	%l1
	and	%g4,	0x035A,	%l0
	fmovscc	%icc,	%f27,	%f31
	tsubcctv	%o1,	%g3,	%l3
	sra	%o2,	%i2,	%i6
	fxnors	%f22,	%f24,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%i1,	loop_1686
	fzeros	%f3
	move	%icc,	%i4,	%o5
	srl	%i3,	%i7,	%o3
loop_1686:
	fbne,a	%fcc3,	loop_1687
	edge8	%i0,	%o7,	%g5
	fornot1	%f4,	%f10,	%f12
	edge16l	%l6,	%l2,	%o4
loop_1687:
	movpos	%icc,	%l4,	%g6
	tneg	%icc,	0x5
	edge16l	%o6,	%g7,	%g1
	edge32ln	%o0,	%g2,	%i5
	fsrc1s	%f9,	%f28
	movne	%xcc,	%l5,	%g4
	udiv	%l1,	0x1EB7,	%l0
	wr	%g0,	0x18,	%asi
	sta	%f30,	[%l7 + 0x70] %asi
	tvs	%icc,	0x6
	or	%o1,	0x0E08,	%l3
	fmovrdgz	%o2,	%f14,	%f14
	stb	%g3,	[%l7 + 0x46]
	fbne	%fcc1,	loop_1688
	nop
	setx	0x1F429F28580ABBA8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xEE5FEAA007BA1DBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f26,	%f12
	or	%i2,	0x17DD,	%i1
	fxors	%f24,	%f15,	%f27
loop_1688:
	sdivcc	%i6,	0x0FA2,	%o5
	srlx	%i3,	%i4,	%o3
	movvs	%icc,	%i0,	%o7
	edge16	%i7,	%g5,	%l2
	fmul8ulx16	%f0,	%f2,	%f24
	srax	%o4,	%l4,	%l6
	edge16l	%g6,	%g7,	%o6
	call	loop_1689
	smul	%o0,	0x0ABD,	%g2
	taddcctv	%g1,	%l5,	%g4
	alignaddrl	%l1,	%l0,	%i5
loop_1689:
	subccc	%o1,	%o2,	%g3
	movrlz	%i2,	0x0CD,	%l3
	tsubcc	%i1,	%o5,	%i3
	fmovrsne	%i4,	%f10,	%f0
	tvc	%icc,	0x5
	edge32	%o3,	%i0,	%i6
	alignaddr	%i7,	%g5,	%o7
	lduh	[%l7 + 0x08],	%o4
	movrgez	%l2,	%l6,	%g6
	nop
	setx	0x404DC0E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	sdiv	%l4,	0x1E11,	%g7
	flush	%l7 + 0x2C
	fors	%f15,	%f15,	%f16
	fbue,a	%fcc1,	loop_1690
	tleu	%icc,	0x6
	orcc	%o6,	%g2,	%g1
	sub	%o0,	0x1226,	%g4
loop_1690:
	fbn	%fcc3,	loop_1691
	addccc	%l5,	0x1D94,	%l1
	tcs	%icc,	0x6
	fble,a	%fcc2,	loop_1692
loop_1691:
	edge8	%l0,	%o1,	%o2
	fmovse	%icc,	%f4,	%f1
	stbar
loop_1692:
	nop
	setx	loop_1693,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg	%fcc2,	loop_1694
	mova	%icc,	%i5,	%g3
	fmovrdlez	%i2,	%f24,	%f16
loop_1693:
	orn	%l3,	0x1640,	%o5
loop_1694:
	udivcc	%i3,	0x0C95,	%i1
	bneg	loop_1695
	smulcc	%o3,	0x1AE2,	%i4
	fmovrdlez	%i6,	%f30,	%f22
	taddcctv	%i7,	0x1CB5,	%i0
loop_1695:
	nop
	set	0x58, %g5
	swapa	[%l7 + %g5] 0x89,	%o7
	smulcc	%o4,	0x0B12,	%l2
	nop
	fitod	%f10,	%f14
	fdtoi	%f14,	%f26
	sir	0x061D
	tg	%icc,	0x4
	addcc	%l6,	%g6,	%g5
	bvc	loop_1696
	tneg	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7B] %asi,	%l4
loop_1696:
	fbul,a	%fcc3,	loop_1697
	movpos	%xcc,	%o6,	%g2
	ldub	[%l7 + 0x15],	%g7
	ldx	[%l7 + 0x10],	%g1
loop_1697:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f8,	[%l7 + 0x30] %asi
	udiv	%g4,	0x1FD9,	%l5
	fmovse	%xcc,	%f25,	%f0
	movpos	%icc,	%o0,	%l1
	edge16l	%o1,	%o2,	%l0
	add	%i5,	%i2,	%l3
	umulcc	%o5,	%i3,	%i1
	andcc	%o3,	%i4,	%i6
	fpadd16s	%f11,	%f7,	%f4
	tcs	%xcc,	0x4
	fcmpeq16	%f28,	%f10,	%i7
	set	0x1B, %o3
	lduba	[%l7 + %o3] 0x15,	%g3
	movvs	%xcc,	%i0,	%o7
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%o4
	popc	0x0E31,	%l2
	std	%f2,	[%l7 + 0x40]
	movn	%icc,	%l6,	%g6
	xor	%l4,	0x0AA2,	%o6
	sdivx	%g2,	0x11B3,	%g5
	tleu	%xcc,	0x6
	sdivcc	%g1,	0x0314,	%g4
	addcc	%g7,	0x1CC5,	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l1,	%o1
	edge32ln	%o2,	%l0,	%l5
	sll	%i5,	%l3,	%i2
	ldsh	[%l7 + 0x64],	%o5
	fpadd16	%f2,	%f2,	%f24
	tleu	%xcc,	0x0
	sra	%i1,	%i3,	%i4
	movre	%i6,	0x184,	%i7
	movrne	%g3,	0x358,	%o3
	addccc	%i0,	%o4,	%o7
	fbe	%fcc0,	loop_1698
	alignaddr	%l6,	%l2,	%l4
	tsubcc	%g6,	%o6,	%g2
	array16	%g5,	%g4,	%g1
loop_1698:
	movpos	%icc,	%g7,	%o0
	tle	%icc,	0x4
	stb	%l1,	[%l7 + 0x45]
	edge8n	%o1,	%o2,	%l5
	edge32	%i5,	%l0,	%i2
	set	0x6E, %o1
	lduba	[%l7 + %o1] 0x81,	%o5
	te	%xcc,	0x7
	tvc	%xcc,	0x5
	add	%i1,	0x140C,	%l3
	array8	%i4,	%i6,	%i7
	fmovrse	%g3,	%f12,	%f11
	fabsd	%f20,	%f20
	tn	%xcc,	0x3
	te	%xcc,	0x3
	ld	[%l7 + 0x6C],	%f9
	te	%xcc,	0x1
	tsubcc	%i3,	%o3,	%o4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orn	%i0,	0x08CB,	%o7
	alignaddrl	%l2,	%l6,	%l4
	sll	%o6,	%g2,	%g5
	nop
	fitos	%f14,	%f26
	fstoi	%f26,	%f1
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrgz	%g6,	%g1,	%g4
	fmovs	%f18,	%f28
	std	%f12,	[%l7 + 0x38]
	nop
	setx	0xA0741EB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	udivcc	%g7,	0x1C3C,	%l1
	array32	%o1,	%o0,	%l5
	fexpand	%f16,	%f6
	fmovsl	%icc,	%f26,	%f12
	edge32	%i5,	%l0,	%i2
	xorcc	%o2,	0x1CAE,	%i1
	fbue	%fcc0,	loop_1699
	movcc	%xcc,	%o5,	%l3
	array16	%i6,	%i7,	%i4
	srl	%i3,	%o3,	%g3
loop_1699:
	membar	0x70
	popc	%i0,	%o4
	umul	%o7,	%l6,	%l2
	flush	%l7 + 0x44
	array16	%o6,	%g2,	%g5
	ldd	[%l7 + 0x50],	%f30
	fcmpne32	%f6,	%f0,	%g6
	tl	%icc,	0x2
	sethi	0x098E,	%l4
	tle	%xcc,	0x2
	fbul	%fcc1,	loop_1700
	brz,a	%g4,	loop_1701
	srl	%g1,	0x1E,	%g7
	fba	%fcc1,	loop_1702
loop_1700:
	movge	%xcc,	%o1,	%o0
loop_1701:
	xnorcc	%l1,	%l5,	%l0
	fands	%f1,	%f13,	%f28
loop_1702:
	tleu	%icc,	0x0
	andn	%i5,	%o2,	%i2
	fsrc1	%f8,	%f30
	bvs,a	%icc,	loop_1703
	bcs,a	loop_1704
	tleu	%icc,	0x5
	fmul8ulx16	%f24,	%f26,	%f22
loop_1703:
	fcmple32	%f0,	%f0,	%i1
loop_1704:
	fandnot1	%f24,	%f16,	%f28
	pdist	%f22,	%f30,	%f12
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l3
	umul	%o5,	0x0DE0,	%i6
	nop
	fitos	%f7,	%f23
	fstox	%f23,	%f28
	fxtos	%f28,	%f21
	fmul8sux16	%f2,	%f2,	%f18
	tcs	%icc,	0x4
	bcs,a	loop_1705
	andncc	%i4,	%i7,	%i3
	tvc	%xcc,	0x1
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o3
loop_1705:
	fbne,a	%fcc1,	loop_1706
	movg	%icc,	%g3,	%o4
	movvs	%icc,	%i0,	%l6
	ld	[%l7 + 0x64],	%f6
loop_1706:
	fpadd16	%f20,	%f20,	%f18
	sra	%l2,	0x02,	%o7
	udiv	%o6,	0x170A,	%g2
	sll	%g6,	0x1C,	%g5
	fbne	%fcc2,	loop_1707
	ldstub	[%l7 + 0x76],	%l4
	mulscc	%g4,	0x0B9B,	%g7
	array16	%g1,	%o0,	%l1
loop_1707:
	fpsub16s	%f14,	%f18,	%f21
	umul	%o1,	0x0133,	%l0
	tpos	%icc,	0x2
	tneg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l5,	0x0283,	%o2
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i2
	tvs	%xcc,	0x0
	ldsw	[%l7 + 0x20],	%i5
	or	%i1,	%o5,	%i6
	tle	%xcc,	0x7
	nop
	setx	loop_1708,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%l3,	%i7,	%i3
	tvs	%xcc,	0x0
	ble,pn	%xcc,	loop_1709
loop_1708:
	mulx	%o3,	0x1C19,	%g3
	pdist	%f20,	%f16,	%f30
	fpsub16	%f0,	%f22,	%f8
loop_1709:
	bg,a	%xcc,	loop_1710
	smul	%i4,	%i0,	%l6
	ld	[%l7 + 0x48],	%f1
	fmovdl	%icc,	%f6,	%f13
loop_1710:
	bcs,a	%icc,	loop_1711
	swap	[%l7 + 0x0C],	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o7,	%o6,	%g2
loop_1711:
	tvc	%xcc,	0x7
	fsrc2	%f24,	%f30
	bge,a	%xcc,	loop_1712
	umulcc	%g6,	%l2,	%g5
	tge	%icc,	0x7
	fpadd32	%f2,	%f28,	%f10
loop_1712:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x7C] %asi,	%f8
	tleu	%xcc,	0x6
	movre	%g4,	%l4,	%g1
	nop
	fitos	%f4,	%f18
	fstod	%f18,	%f22
	or	%o0,	%g7,	%l1
	tne	%icc,	0x0
	sll	%l0,	%l5,	%o2
	brgz,a	%i2,	loop_1713
	sethi	0x1C55,	%o1
	edge8l	%i1,	%i5,	%o5
	set	0x58, %o7
	stha	%i6,	[%l7 + %o7] 0x10
loop_1713:
	move	%icc,	%l3,	%i3
	fbug,a	%fcc0,	loop_1714
	udivx	%o3,	0x0351,	%i7
	brgez,a	%g3,	loop_1715
	mova	%icc,	%i4,	%l6
loop_1714:
	addc	%o4,	0x05A6,	%o7
	movrne	%o6,	0x1FA,	%i0
loop_1715:
	tneg	%icc,	0x2
	movle	%icc,	%g6,	%g2
	fzero	%f28
	umulcc	%g5,	%l2,	%l4
	fmovsl	%icc,	%f5,	%f10
	movle	%icc,	%g1,	%o0
	smul	%g7,	0x001F,	%l1
	alignaddrl	%l0,	%l5,	%o2
	srax	%g4,	0x10,	%o1
	tn	%xcc,	0x6
	nop
	setx	loop_1716,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x52
	fnor	%f24,	%f6,	%f30
	fmovrde	%i1,	%f4,	%f18
loop_1716:
	tne	%icc,	0x4
	ldsb	[%l7 + 0x1D],	%i5
	nop
	setx	0x53DBDF8EC07C2981,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movgu	%icc,	%o5,	%i2
	brnz	%i6,	loop_1717
	movcs	%icc,	%l3,	%i3
	andcc	%i7,	%g3,	%o3
	fnot2	%f16,	%f22
loop_1717:
	nop
	set	0x55, %l6
	lduba	[%l7 + %l6] 0x81,	%l6
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x81,	%i4
	fmul8x16al	%f19,	%f18,	%f28
	movl	%icc,	%o7,	%o6
	fba,a	%fcc1,	loop_1718
	movneg	%icc,	%i0,	%g6
	bn,pn	%xcc,	loop_1719
	fmovdn	%icc,	%f31,	%f25
loop_1718:
	movg	%xcc,	%g2,	%g5
	nop
	setx	loop_1720,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1719:
	move	%xcc,	%l2,	%l4
	nop
	setx	0xE11C4D92E049C1C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge8l	%o4,	%g1,	%o0
loop_1720:
	srax	%l1,	%g7,	%l0
	edge8n	%l5,	%o2,	%o1
	edge16n	%i1,	%i5,	%g4
	stb	%o5,	[%l7 + 0x0E]
	bgu,a,pt	%icc,	loop_1721
	fornot2s	%f16,	%f11,	%f28
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f0
	set	0x44, %l3
	ldswa	[%l7 + %l3] 0x10,	%i2
loop_1721:
	nop
	set	0x5E, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l3
	alignaddr	%i3,	%i7,	%g3
	movle	%icc,	%i6,	%o3
	subc	%l6,	0x11C9,	%o7
	umulcc	%o6,	%i0,	%g6
	movpos	%xcc,	%g2,	%i4
	alignaddr	%g5,	%l4,	%l2
	fbe	%fcc3,	loop_1722
	tvc	%icc,	0x4
	nop
	setx	0xDD06C246,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f21
	or	%g1,	%o4,	%o0
loop_1722:
	movne	%icc,	%l1,	%g7
	movleu	%xcc,	%l0,	%o2
	fmovse	%xcc,	%f20,	%f11
	movre	%o1,	%l5,	%i1
	array32	%g4,	%o5,	%i2
	movl	%icc,	%l3,	%i3
	fcmpgt16	%f30,	%f16,	%i5
	alignaddrl	%i7,	%i6,	%o3
	st	%f0,	[%l7 + 0x24]
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f4
	te	%xcc,	0x1
	set	0x08, %l4
	lda	[%l7 + %l4] 0x80,	%f15
	ta	%icc,	0x7
	fnor	%f12,	%f24,	%f20
	fexpand	%f8,	%f18
	andn	%g3,	0x1379,	%l6
	tne	%icc,	0x4
	sdivcc	%o7,	0x1F9E,	%o6
	fbn	%fcc0,	loop_1723
	alignaddrl	%i0,	%g2,	%i4
	fbul	%fcc1,	loop_1724
	orcc	%g5,	%g6,	%l4
loop_1723:
	tge	%xcc,	0x2
	umul	%g1,	%o4,	%o0
loop_1724:
	nop
	set	0x2C, %g4
	sta	%f2,	[%l7 + %g4] 0x80
	tg	%icc,	0x5
	fmovsle	%icc,	%f11,	%f4
	tleu	%xcc,	0x1
	set	0x34, %i4
	stwa	%l2,	[%l7 + %i4] 0x23
	membar	#Sync
	mova	%xcc,	%g7,	%l1
	st	%f7,	[%l7 + 0x08]
	udiv	%o2,	0x0312,	%l0
	subcc	%l5,	%o1,	%i1
	orn	%g4,	%o5,	%l3
	movg	%xcc,	%i2,	%i5
	fbo	%fcc2,	loop_1725
	fbo	%fcc2,	loop_1726
	te	%icc,	0x4
	move	%icc,	%i7,	%i3
loop_1725:
	edge8l	%o3,	%i6,	%g3
loop_1726:
	fblg,a	%fcc1,	loop_1727
	sll	%o7,	%l6,	%i0
	and	%o6,	0x0D82,	%g2
	bge,pn	%icc,	loop_1728
loop_1727:
	movrgz	%g5,	%g6,	%i4
	edge16ln	%l4,	%o4,	%o0
	umul	%g1,	%l2,	%g7
loop_1728:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x0C] %asi,	%o2
	bcc,a	loop_1729
	brgez	%l0,	loop_1730
	sllx	%l5,	%l1,	%i1
	fand	%f30,	%f28,	%f16
loop_1729:
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%g4
loop_1730:
	te	%xcc,	0x6
	fbne,a	%fcc1,	loop_1731
	ldstub	[%l7 + 0x1D],	%o5
	ta	%icc,	0x0
	subccc	%l3,	0x0209,	%o1
loop_1731:
	edge16l	%i2,	%i7,	%i5
	edge8ln	%o3,	%i3,	%g3
	tsubcc	%o7,	%l6,	%i6
	fnegs	%f0,	%f1
	sra	%o6,	%i0,	%g2
	movvc	%xcc,	%g6,	%i4
	fcmpgt32	%f12,	%f30,	%g5
	andncc	%o4,	%l4,	%g1
	swap	[%l7 + 0x5C],	%o0
	fbn	%fcc3,	loop_1732
	movl	%xcc,	%l2,	%o2
	tsubcctv	%l0,	0x1C3A,	%g7
	stbar
loop_1732:
	fornot2s	%f21,	%f4,	%f24
	fbule,a	%fcc2,	loop_1733
	fands	%f27,	%f12,	%f21
	edge32n	%l1,	%l5,	%i1
	stbar
loop_1733:
	sub	%g4,	%l3,	%o5
	move	%xcc,	%o1,	%i7
	tne	%xcc,	0x6
	brlz	%i2,	loop_1734
	movrgez	%i5,	%o3,	%i3
	movle	%xcc,	%o7,	%l6
	fnand	%f4,	%f30,	%f12
loop_1734:
	nop
	set	0x40, %i1
	stxa	%i6,	[%l7 + %i1] 0x22
	membar	#Sync
	fmovsleu	%icc,	%f14,	%f28
	udivx	%o6,	0x1E61,	%i0
	popc	%g2,	%g6
	edge32l	%g3,	%g5,	%i4
	fbug	%fcc1,	loop_1735
	fpadd32	%f24,	%f18,	%f22
	sdivx	%o4,	0x0412,	%l4
	tleu	%icc,	0x0
loop_1735:
	sethi	0x1A98,	%g1
	prefetch	[%l7 + 0x60],	 0x1
	fmovda	%icc,	%f15,	%f9
	pdist	%f26,	%f18,	%f26
	movn	%icc,	%o0,	%o2
	st	%f3,	[%l7 + 0x10]
	tneg	%icc,	0x7
	addcc	%l2,	0x1DC7,	%g7
	alignaddr	%l0,	%l5,	%i1
	tcc	%xcc,	0x0
	movcs	%icc,	%g4,	%l3
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f0
	ldd	[%l7 + 0x38],	%f12
	mulscc	%o5,	0x0D08,	%l1
	tle	%icc,	0x5
	fmuld8sux16	%f21,	%f2,	%f20
	array8	%o1,	%i2,	%i7
	fnand	%f4,	%f0,	%f26
	ldub	[%l7 + 0x47],	%o3
	tcc	%xcc,	0x6
	fmovse	%icc,	%f31,	%f30
	fbu,a	%fcc2,	loop_1736
	addccc	%i3,	%i5,	%o7
	bge,pt	%icc,	loop_1737
	xor	%i6,	0x03A9,	%l6
loop_1736:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o6,	%i0
loop_1737:
	taddcc	%g2,	0x0BE8,	%g6
	smul	%g3,	%g5,	%i4
	bn,a	%xcc,	loop_1738
	subcc	%o4,	0x0A29,	%g1
	nop
	fitos	%f12,	%f7
	fstox	%f7,	%f14
	sra	%l4,	0x1E,	%o2
loop_1738:
	fbul	%fcc3,	loop_1739
	addc	%o0,	%l2,	%l0
	ta	%icc,	0x0
	subc	%l5,	%i1,	%g7
loop_1739:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x74] %asi,	%f12
	edge32	%g4,	%l3,	%o5
	orcc	%l1,	%i2,	%i7
	ldsb	[%l7 + 0x11],	%o3
	movcc	%icc,	%o1,	%i3
	edge8ln	%i5,	%i6,	%l6
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x17,	%f16
	wr	%g0,	0x21,	%asi
	stxa	%o7,	[%g0 + 0x10] %asi
	tge	%xcc,	0x1
	tgu	%icc,	0x3
	sdiv	%o6,	0x064B,	%i0
	fsrc1s	%f20,	%f23
	andn	%g6,	0x0CF4,	%g2
	addcc	%g3,	%i4,	%g5
	tne	%xcc,	0x7
	sdivx	%g1,	0x03B2,	%l4
	movcc	%xcc,	%o4,	%o0
	fbl,a	%fcc3,	loop_1740
	sdivcc	%o2,	0x06BD,	%l0
	bleu	loop_1741
	movg	%icc,	%l2,	%l5
loop_1740:
	edge16l	%i1,	%g7,	%g4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
loop_1741:
	addccc	%o5,	0x0B76,	%i2
	lduh	[%l7 + 0x3A],	%l1
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x2E] %asi,	%o3
	edge32ln	%i7,	%i3,	%o1
	bne,a,pn	%icc,	loop_1742
	array16	%i5,	%l6,	%i6
	wr	%g0,	0x81,	%asi
	stba	%o7,	[%l7 + 0x0C] %asi
loop_1742:
	edge32n	%o6,	%g6,	%g2
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x22,	%g2
	srl	%i4,	%g5,	%g1
	nop
	fitod	%f0,	%f10
	fdtos	%f10,	%f22
	bneg,pn	%xcc,	loop_1743
	stw	%i0,	[%l7 + 0x3C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o4,	%l4,	%o0
loop_1743:
	nop
	wr	%g0,	0x0c,	%asi
	stxa	%l0,	[%l7 + 0x48] %asi
	array32	%o2,	%l2,	%l5
	nop
	setx	0xFBEBE9AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f28
	movcc	%xcc,	%g7,	%i1
	edge32n	%l3,	%g4,	%i2
	orncc	%o5,	%l1,	%o3
	fbug	%fcc2,	loop_1744
	fba,a	%fcc1,	loop_1745
	edge8	%i7,	%o1,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1744:
	movneg	%xcc,	%i5,	%i6
loop_1745:
	movre	%o7,	%o6,	%g6
	array16	%g2,	%g3,	%i4
	fpadd32	%f18,	%f12,	%f16
	call	loop_1746
	bvs,a	loop_1747
	xorcc	%g5,	0x08C9,	%g1
	fandnot1s	%f18,	%f5,	%f5
loop_1746:
	xorcc	%i0,	%o4,	%l4
loop_1747:
	subc	%o0,	%l0,	%l6
	fsrc1	%f22,	%f6
	mulscc	%o2,	%l5,	%g7
	bcc,pt	%icc,	loop_1748
	edge32n	%l2,	%i1,	%g4
	fblg,a	%fcc3,	loop_1749
	andn	%l3,	%i2,	%l1
loop_1748:
	xnorcc	%o3,	0x1A6C,	%o5
	add	%i7,	0x02C3,	%o1
loop_1749:
	edge16l	%i5,	%i6,	%i3
	tsubcctv	%o6,	%o7,	%g2
	edge8	%g6,	%g3,	%i4
	ble	%icc,	loop_1750
	tgu	%icc,	0x1
	set	0x48, %i2
	lda	[%l7 + %i2] 0x10,	%f26
loop_1750:
	nop
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x2b,	%g0
	array32	%g5,	%i0,	%o4
	fabsd	%f10,	%f10
	edge8n	%l4,	%o0,	%l6
	fpsub32	%f6,	%f28,	%f10
	nop
	setx	0x807B92C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	addc	%o2,	0x0546,	%l0
	sub	%l5,	%g7,	%l2
	brnz	%g4,	loop_1751
	tl	%xcc,	0x1
	alignaddrl	%l3,	%i2,	%i1
	nop
	setx	0x732DBC89132B8B33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF8C988F89ED74A4A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f26,	%f6
loop_1751:
	fnors	%f16,	%f30,	%f23
	movl	%icc,	%l1,	%o3
	stbar
	ldstub	[%l7 + 0x61],	%o5
	nop
	setx	0x4BCD3B8FEE3478EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFF2799654EA0FC5E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f22,	%f14
	udiv	%o1,	0x0D5E,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%i7,	%f18,	%f0
	call	loop_1752
	tcc	%xcc,	0x6
	nop
	setx loop_1753, %l0, %l1
	jmpl %l1, %i6
	ta	%xcc,	0x6
loop_1752:
	movvc	%icc,	%i3,	%o7
	xorcc	%g2,	%o6,	%g6
loop_1753:
	ba,pn	%icc,	loop_1754
	smul	%g3,	%i4,	%g5
	nop
	setx	loop_1755,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x5C],	 0x0
loop_1754:
	fandnot1s	%f11,	%f21,	%f16
	te	%icc,	0x0
loop_1755:
	fpadd16	%f14,	%f14,	%f2
	edge8ln	%i0,	%g1,	%o4
	tn	%xcc,	0x6
	mova	%xcc,	%l4,	%o0
	movcs	%xcc,	%o2,	%l0
	mulx	%l6,	0x038E,	%l5
	array8	%g7,	%l2,	%l3
	edge32l	%g4,	%i1,	%i2
	be	loop_1756
	call	loop_1757
	movle	%xcc,	%l1,	%o5
	alignaddr	%o1,	%o3,	%i5
loop_1756:
	sra	%i7,	%i3,	%i6
loop_1757:
	fmovrde	%g2,	%f4,	%f0
	fmovdcs	%icc,	%f11,	%f13
	addccc	%o6,	0x1702,	%g6
	movrlz	%g3,	0x35A,	%i4
	ldsh	[%l7 + 0x0A],	%o7
	set	0x28, %g3
	sta	%f0,	[%l7 + %g3] 0x88
	fbl	%fcc1,	loop_1758
	bpos	loop_1759
	lduh	[%l7 + 0x1C],	%i0
	nop
	setx	0xED1CDB95,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x541BFD20,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f4,	%f31
loop_1758:
	edge16n	%g1,	%o4,	%l4
loop_1759:
	edge16	%o0,	%o2,	%g5
	fbl,a	%fcc2,	loop_1760
	movle	%xcc,	%l0,	%l5
	udiv	%l6,	0x1436,	%l2
	fmovdneg	%xcc,	%f23,	%f8
loop_1760:
	stbar
	tne	%icc,	0x0
	std	%f28,	[%l7 + 0x60]
	mulx	%g7,	%l3,	%g4
	udivcc	%i1,	0x1129,	%i2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x74] %asi,	%f8
	fmovdvc	%icc,	%f20,	%f21
	popc	%l1,	%o1
	alignaddr	%o3,	%i5,	%o5
	fcmpgt16	%f12,	%f4,	%i3
	edge8n	%i7,	%g2,	%i6
	smul	%o6,	0x07A2,	%g6
	movrlz	%g3,	0x2DC,	%o7
	fbne,a	%fcc1,	loop_1761
	tcs	%xcc,	0x4
	array32	%i0,	%g1,	%o4
	movcc	%icc,	%i4,	%l4
loop_1761:
	fmovd	%f0,	%f16
	movgu	%xcc,	%o0,	%o2
	movg	%icc,	%g5,	%l5
	or	%l0,	%l2,	%l6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%l3
	fzero	%f22
	fandnot2	%f20,	%f22,	%f0
	subcc	%g4,	0x12CF,	%i1
	movgu	%xcc,	%g7,	%i2
	fandnot1	%f22,	%f28,	%f12
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o1
	edge8	%o3,	%l1,	%i5
	nop
	setx	loop_1762,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%icc,	0x2
	fandnot1	%f14,	%f4,	%f30
	tcs	%icc,	0x6
loop_1762:
	brnz	%i3,	loop_1763
	array16	%o5,	%i7,	%g2
	ta	%icc,	0x7
	tcs	%xcc,	0x3
loop_1763:
	fmovscs	%icc,	%f24,	%f28
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i6
	wr	%g0,	0x27,	%asi
	stba	%g6,	[%l7 + 0x4D] %asi
	membar	#Sync
	fxor	%f14,	%f20,	%f0
	fmul8x16	%f15,	%f2,	%f28
	set	0x78, %g6
	stwa	%o6,	[%l7 + %g6] 0x89
	array8	%o7,	%i0,	%g3
	movrlz	%g1,	%i4,	%o4
	set	0x2E, %g1
	ldsha	[%l7 + %g1] 0x11,	%o0
	bn	loop_1764
	edge16n	%o2,	%l4,	%l5
	flush	%l7 + 0x2C
	tge	%icc,	0x6
loop_1764:
	nop
	setx loop_1765, %l0, %l1
	jmpl %l1, %l0
	fbo,a	%fcc3,	loop_1766
	nop
	setx	0xB27A2B03732D288E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f10
	fmovrdgz	%g5,	%f20,	%f10
loop_1765:
	nop
	set	0x7C, %i7
	ldswa	[%l7 + %i7] 0x88,	%l2
loop_1766:
	sethi	0x1460,	%l3
	movne	%xcc,	%l6,	%g4
	sethi	0x00BA,	%g7
	nop
	setx	loop_1767,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%i1,	%i2,	%o3
	nop
	setx	0x55581177E06B1786,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	edge8l	%o1,	%i5,	%i3
loop_1767:
	fbn	%fcc3,	loop_1768
	edge32ln	%l1,	%i7,	%g2
	movneg	%icc,	%o5,	%i6
	fmovsgu	%icc,	%f10,	%f17
loop_1768:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	taddcctv	%o7,	0x06EE,	%i0
	movl	%xcc,	%g3,	%g1
	tvs	%xcc,	0x5
	mulscc	%i4,	0x17AF,	%o6
	udiv	%o4,	0x031E,	%o0
	nop
	setx	loop_1769,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x13F518A49CB70146,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0D4B0F45C5D4217A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f14,	%f2
	edge16ln	%o2,	%l4,	%l0
	movcs	%icc,	%l5,	%l2
loop_1769:
	srl	%g5,	%l3,	%g4
	add	%g7,	%i1,	%i2
	orn	%o3,	0x13D1,	%o1
	fpadd16	%f22,	%f26,	%f26
	nop
	fitos	%f4,	%f0
	fstox	%f0,	%f0
	udivcc	%l6,	0x1910,	%i5
	lduh	[%l7 + 0x4A],	%l1
	bshuffle	%f8,	%f30,	%f14
	movne	%icc,	%i7,	%g2
	movrne	%o5,	0x262,	%i3
	move	%xcc,	%i6,	%g6
	fcmple32	%f22,	%f6,	%o7
	movrlz	%i0,	0x0E0,	%g3
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x19,	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g1,	%o6,	%o4
	tvs	%xcc,	0x0
	fmuld8ulx16	%f11,	%f12,	%f24
	array16	%o0,	%o2,	%l4
	edge32	%l5,	%l0,	%g5
	andn	%l2,	0x0ACD,	%g4
	movrgez	%g7,	%l3,	%i2
	umulcc	%i1,	%o3,	%l6
	tpos	%xcc,	0x2
	nop
	setx	0xCC289B1B122023F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7A7BF4B2B922189E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f4,	%f16
	mova	%icc,	%o1,	%l1
	smul	%i7,	0x02C2,	%i5
	ldd	[%l7 + 0x68],	%o4
	xnorcc	%i3,	%i6,	%g2
	and	%o7,	%i0,	%g3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x63] %asi,	%i4
	alignaddrl	%g1,	%o6,	%g6
	edge32l	%o0,	%o2,	%l4
	brlez,a	%l5,	loop_1770
	taddcc	%o4,	0x116B,	%l0
	srl	%l2,	%g5,	%g7
	edge16l	%g4,	%i2,	%l3
loop_1770:
	fabsd	%f4,	%f10
	or	%o3,	0x1E4B,	%i1
	xnorcc	%l6,	%o1,	%i7
	orncc	%i5,	0x1000,	%o5
	nop
	set	0x5E, %i6
	ldub	[%l7 + %i6],	%l1
	fmovsleu	%icc,	%f31,	%f8
	and	%i6,	%g2,	%i3
	movn	%icc,	%i0,	%o7
	fmovrsne	%i4,	%f17,	%f14
	brz	%g1,	loop_1771
	movl	%xcc,	%g3,	%o6
	bl,a	loop_1772
	nop
	fitos	%f13,	%f15
	fstoi	%f15,	%f29
loop_1771:
	fmovdpos	%icc,	%f19,	%f23
	wr	%g0,	0xeb,	%asi
	stxa	%g6,	[%l7 + 0x08] %asi
	membar	#Sync
loop_1772:
	fcmpne32	%f14,	%f30,	%o2
	nop
	fitos	%f5,	%f11
	fstox	%f11,	%f30
	fxtos	%f30,	%f17
	ldx	[%l7 + 0x28],	%l4
	stb	%l5,	[%l7 + 0x78]
	xorcc	%o4,	0x02A3,	%l0
	xorcc	%l2,	%g5,	%g7
	fxnor	%f0,	%f28,	%f22
	orcc	%o0,	0x10A3,	%i2
	smulcc	%g4,	%o3,	%i1
	addc	%l3,	%o1,	%i7
	fpadd32s	%f14,	%f1,	%f17
	bvs,pn	%xcc,	loop_1773
	fmovdne	%xcc,	%f7,	%f30
	move	%icc,	%i5,	%o5
	addcc	%l1,	0x01A5,	%l6
loop_1773:
	membar	0x37
	smulcc	%g2,	0x1BED,	%i3
	andncc	%i6,	%o7,	%i0
	sub	%g1,	%i4,	%o6
	fbo,a	%fcc3,	loop_1774
	fbu,a	%fcc2,	loop_1775
	andcc	%g6,	%g3,	%o2
	movl	%icc,	%l4,	%o4
loop_1774:
	movgu	%xcc,	%l5,	%l0
loop_1775:
	sir	0x1DD5
	udiv	%g5,	0x199E,	%l2
	fble	%fcc0,	loop_1776
	edge32ln	%o0,	%g7,	%g4
	tg	%xcc,	0x2
	sdivcc	%o3,	0x19FD,	%i1
loop_1776:
	fexpand	%f8,	%f22
	alignaddr	%l3,	%i2,	%o1
	andn	%i5,	%i7,	%o5
	xnorcc	%l6,	0x1E7B,	%g2
	fmovsleu	%xcc,	%f19,	%f29
	movne	%icc,	%i3,	%i6
	fsrc2	%f20,	%f6
	movre	%l1,	0x1D9,	%o7
	sll	%g1,	0x00,	%i0
	movl	%icc,	%o6,	%g6
	movrgz	%i4,	0x298,	%g3
	tgu	%xcc,	0x4
	fpadd32	%f24,	%f16,	%f6
	set	0x5B, %g2
	lduba	[%l7 + %g2] 0x0c,	%o2
	tge	%icc,	0x0
	movrlez	%l4,	%l5,	%o4
	fmovrsgez	%g5,	%f12,	%f20
	fbul	%fcc1,	loop_1777
	movgu	%xcc,	%l2,	%l0
	nop
	setx	0xE07FCC6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fsrc1	%f24,	%f12
loop_1777:
	xor	%g7,	0x13D0,	%g4
	edge16	%o3,	%i1,	%l3
	bpos,a	loop_1778
	bge,pn	%xcc,	loop_1779
	smulcc	%o0,	0x0C4F,	%o1
	movre	%i2,	0x38C,	%i7
loop_1778:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
loop_1779:
	nop
	setx	0x7584973D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x18B76861,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f29,	%f24
	array32	%o5,	%g2,	%l6
	ldub	[%l7 + 0x0D],	%i6
	movg	%icc,	%i3,	%o7
	andn	%l1,	0x1A76,	%g1
	brgz	%o6,	loop_1780
	nop
	setx	0xB7B9511D0D6F5877,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f0
	orn	%g6,	0x1296,	%i4
	sll	%i0,	%o2,	%l4
loop_1780:
	sethi	0x12C4,	%l5
	sdiv	%g3,	0x0CF7,	%g5
	subc	%o4,	%l0,	%g7
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f28
	movge	%xcc,	%g4,	%l2
	fmovrslez	%i1,	%f8,	%f2
	tsubcc	%o3,	%o0,	%l3
	fmovdne	%icc,	%f29,	%f8
	fbge,a	%fcc1,	loop_1781
	prefetch	[%l7 + 0x20],	 0x3
	fbuge,a	%fcc3,	loop_1782
	stw	%o1,	[%l7 + 0x20]
loop_1781:
	nop
	setx	0x41038353C059C7AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	edge8ln	%i7,	%i5,	%i2
loop_1782:
	tcs	%icc,	0x1
	bne,a,pt	%xcc,	loop_1783
	fandnot2s	%f4,	%f19,	%f6
	sethi	0x138E,	%o5
	tge	%icc,	0x5
loop_1783:
	fnors	%f7,	%f18,	%f18
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrgz	%l6,	%i6,	%i3
	fba,a	%fcc0,	loop_1784
	ldstub	[%l7 + 0x3E],	%g2
	tsubcctv	%o7,	%l1,	%o6
	smulcc	%g6,	0x0F07,	%g1
loop_1784:
	udivcc	%i4,	0x1204,	%o2
	brlz	%l4,	loop_1785
	bn,a	loop_1786
	tvs	%icc,	0x3
	edge8	%l5,	%g3,	%g5
loop_1785:
	srlx	%i0,	0x13,	%o4
loop_1786:
	subccc	%l0,	0x0E21,	%g7
	ta	%xcc,	0x0
	tpos	%xcc,	0x0
	sethi	0x1420,	%g4
	fmovdcc	%xcc,	%f8,	%f17
	xnorcc	%i1,	%o3,	%o0
	sra	%l2,	0x0B,	%o1
	movleu	%xcc,	%i7,	%l3
	movre	%i2,	0x056,	%o5
	tgu	%xcc,	0x4
	nop
	setx loop_1787, %l0, %l1
	jmpl %l1, %l6
	fmovda	%xcc,	%f22,	%f23
	ldsh	[%l7 + 0x4C],	%i5
	bne,a	loop_1788
loop_1787:
	tle	%xcc,	0x7
	smulcc	%i3,	0x1E6A,	%g2
	addc	%o7,	%i6,	%o6
loop_1788:
	sdivcc	%g6,	0x0C4D,	%g1
	fbul,a	%fcc1,	loop_1789
	bvc,a	loop_1790
	tneg	%xcc,	0x6
	bcs,a,pt	%xcc,	loop_1791
loop_1789:
	orcc	%i4,	%l1,	%o2
loop_1790:
	udivcc	%l5,	0x0F37,	%l4
	sdivx	%g5,	0x1D30,	%i0
loop_1791:
	fmovdgu	%xcc,	%f8,	%f1
	lduh	[%l7 + 0x20],	%o4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g3
	movrlz	%g7,	0x182,	%g4
	edge16l	%l0,	%o3,	%o0
	udiv	%l2,	0x11DF,	%o1
	orn	%i1,	%i7,	%i2
	addc	%l3,	0x0D97,	%l6
	fabss	%f3,	%f18
	or	%o5,	%i3,	%i5
	addc	%g2,	0x1122,	%o7
	tle	%icc,	0x3
	stb	%i6,	[%l7 + 0x76]
	subcc	%o6,	0x0877,	%g6
	fcmple32	%f2,	%f10,	%i4
	movrgz	%g1,	0x204,	%l1
	fbe	%fcc3,	loop_1792
	fmul8x16	%f11,	%f18,	%f0
	edge16ln	%o2,	%l4,	%l5
	orncc	%g5,	0x154A,	%i0
loop_1792:
	edge8n	%g3,	%g7,	%o4
	fabsd	%f8,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l0,	0x1CCB,	%o3
	fbg	%fcc0,	loop_1793
	fmovs	%f3,	%f29
	nop
	fitod	%f28,	%f16
	orn	%o0,	%l2,	%g4
loop_1793:
	orncc	%o1,	0x01B0,	%i1
	nop
	setx	0x064DA9B1F3443617,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f24
	tcs	%icc,	0x5
	tg	%icc,	0x6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%i2
	movre	%l3,	0x237,	%l6
	set	0x48, %o6
	stxa	%o5,	[%l7 + %o6] 0x89
	fbul	%fcc1,	loop_1794
	popc	%i3,	%i5
	nop
	fitos	%f9,	%f10
	fstod	%f10,	%f30
	fornot1s	%f5,	%f11,	%f31
loop_1794:
	nop
	setx loop_1795, %l0, %l1
	jmpl %l1, %i7
	orcc	%g2,	%o7,	%o6
	ble,a	loop_1796
	sdivcc	%i6,	0x13B4,	%g6
loop_1795:
	tcc	%icc,	0x4
	membar	0x1C
loop_1796:
	subccc	%g1,	%i4,	%o2
	nop
	setx	0xD8CE4C70B2DF68A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x5E48A73CD5FFAFBE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f28,	%f26
	smul	%l1,	0x1487,	%l5
	movge	%xcc,	%l4,	%g5
	membar	0x31
	and	%g3,	0x021A,	%g7
	fmovrdlz	%o4,	%f10,	%f12
	fmovscc	%icc,	%f8,	%f24
	fbue	%fcc1,	loop_1797
	tcc	%icc,	0x2
	bpos,a	loop_1798
	andcc	%i0,	%o3,	%o0
loop_1797:
	sll	%l0,	%l2,	%o1
	tsubcc	%g4,	%i1,	%i2
loop_1798:
	brlez,a	%l3,	loop_1799
	movcs	%xcc,	%o5,	%l6
	fmovsle	%xcc,	%f27,	%f7
	movleu	%icc,	%i3,	%i5
loop_1799:
	sdivx	%i7,	0x0D0A,	%g2
	fmovspos	%xcc,	%f7,	%f3
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f22
	bpos,a	loop_1800
	fand	%f0,	%f18,	%f10
	edge8ln	%o6,	%i6,	%g6
	set	0x6C, %o4
	lda	[%l7 + %o4] 0x0c,	%f3
loop_1800:
	fornot1s	%f7,	%f2,	%f9
	taddcctv	%g1,	0x1ED4,	%i4
	taddcctv	%o7,	%l1,	%o2
	tle	%icc,	0x0
	nop
	setx	loop_1801,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%xcc,	0x1
	sdiv	%l4,	0x1A8E,	%g5
	edge16l	%g3,	%g7,	%o4
loop_1801:
	taddcc	%i0,	%l5,	%o3
	popc	%l0,	%o0
	movre	%o1,	%g4,	%i1
	movpos	%icc,	%l2,	%l3
	movvc	%xcc,	%o5,	%l6
	udivcc	%i2,	0x1CA8,	%i3
	tneg	%icc,	0x0
	addccc	%i7,	0x01F3,	%i5
	ldd	[%l7 + 0x48],	%f14
	nop
	setx loop_1802, %l0, %l1
	jmpl %l1, %o6
	sdiv	%g2,	0x1F75,	%i6
	smul	%g6,	%g1,	%i4
	edge32ln	%o7,	%o2,	%l1
loop_1802:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f24,	[%l7 + 0x60] %asi
	nop
	setx	loop_1803,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%l4,	%g5,	%g7
	orncc	%g3,	0x016D,	%o4
	fmovdvc	%xcc,	%f6,	%f18
loop_1803:
	taddcctv	%i0,	%l5,	%o3
	set	0x38, %i3
	swapa	[%l7 + %i3] 0x80,	%l0
	fmovrse	%o1,	%f26,	%f4
	movvc	%xcc,	%o0,	%g4
	edge8l	%i1,	%l2,	%l3
	move	%xcc,	%l6,	%i2
	edge8l	%o5,	%i3,	%i5
	fbl	%fcc3,	loop_1804
	tne	%icc,	0x2
	fzero	%f24
	tn	%xcc,	0x6
loop_1804:
	xnor	%o6,	0x082F,	%g2
	nop
	setx	0xCB65E4F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x68B14A76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f8,	%f10
	movrlez	%i7,	%g6,	%g1
	tcs	%xcc,	0x6
	or	%i4,	0x1B00,	%o7
	orn	%i6,	0x1DEF,	%o2
	movrgz	%l4,	0x08D,	%l1
	edge8ln	%g5,	%g7,	%o4
	fmovdg	%icc,	%f4,	%f15
	movg	%xcc,	%g3,	%l5
	smulcc	%i0,	0x1FE6,	%l0
	movleu	%icc,	%o1,	%o0
	fmovdcc	%icc,	%f6,	%f2
	udiv	%g4,	0x1AA6,	%o3
	array8	%l2,	%i1,	%l3
	xnorcc	%l6,	0x0BBD,	%o5
	srax	%i3,	0x13,	%i2
	fandnot1	%f28,	%f26,	%f0
	move	%xcc,	%i5,	%g2
	fmul8x16al	%f9,	%f19,	%f26
	nop
	setx	0x13D5DB88,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f27
	fmovs	%f16,	%f11
	fpsub16s	%f24,	%f21,	%f11
	udiv	%i7,	0x1E3D,	%o6
	udiv	%g1,	0x1B90,	%i4
	fpsub16	%f4,	%f12,	%f16
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x42] %asi,	%o7
	nop
	setx	0x133D23C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x2BF863C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f2,	%f2
	fbe,a	%fcc0,	loop_1805
	fbug	%fcc1,	loop_1806
	fbn,a	%fcc2,	loop_1807
	tne	%xcc,	0x1
loop_1805:
	fnot1s	%f23,	%f6
loop_1806:
	fbul	%fcc0,	loop_1808
loop_1807:
	fpadd16s	%f18,	%f26,	%f26
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1808:
	edge8n	%g6,	%o2,	%l4
	smul	%l1,	0x171E,	%i6
	set	0x20, %l1
	stha	%g5,	[%l7 + %l1] 0x22
	membar	#Sync
	fbn	%fcc1,	loop_1809
	fornot2s	%f16,	%f20,	%f10
	fnot2	%f16,	%f24
	srlx	%g7,	%o4,	%l5
loop_1809:
	sub	%i0,	%g3,	%o1
	move	%xcc,	%l0,	%g4
	umulcc	%o0,	%o3,	%i1
	nop
	setx	loop_1810,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%xcc,	0x1
	st	%f15,	[%l7 + 0x40]
	movgu	%xcc,	%l2,	%l6
loop_1810:
	ldsb	[%l7 + 0x6E],	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i3,	0x017A,	%i2
	mulscc	%i5,	0x0A1A,	%o5
	and	%i7,	0x0FA9,	%o6
	alignaddr	%g1,	%i4,	%g2
	bl,a,pn	%xcc,	loop_1811
	tsubcc	%g6,	%o2,	%l4
	bneg,a,pn	%xcc,	loop_1812
	movrgz	%l1,	0x2E0,	%i6
loop_1811:
	taddcctv	%o7,	%g7,	%g5
	edge8	%o4,	%i0,	%g3
loop_1812:
	sdiv	%l5,	0x17E0,	%o1
	set	0x40, %o0
	sta	%f26,	[%l7 + %o0] 0x14
	st	%f30,	[%l7 + 0x54]
	fmul8sux16	%f22,	%f16,	%f30
	fbne	%fcc3,	loop_1813
	bleu	loop_1814
	stbar
	andn	%l0,	%g4,	%o3
loop_1813:
	fmovsg	%icc,	%f4,	%f26
loop_1814:
	edge16	%i1,	%o0,	%l6
	nop
	setx	0x7849FAB7F7A455CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xACBAA004366F9676,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f30,	%f2
	movneg	%xcc,	%l2,	%l3
	ldsb	[%l7 + 0x47],	%i2
	fbne	%fcc3,	loop_1815
	fmovs	%f29,	%f31
	umulcc	%i5,	0x05CF,	%i3
	fexpand	%f9,	%f14
loop_1815:
	bne	loop_1816
	fandnot2	%f0,	%f30,	%f14
	array32	%i7,	%o6,	%g1
	mulx	%o5,	%i4,	%g6
loop_1816:
	nop
	set	0x10, %o3
	ldswa	[%l7 + %o3] 0x88,	%o2
	call	loop_1817
	call	loop_1818
	edge16ln	%g2,	%l4,	%i6
	tl	%xcc,	0x5
loop_1817:
	membar	0x04
loop_1818:
	edge8ln	%l1,	%o7,	%g5
	move	%xcc,	%g7,	%o4
	nop
	fitod	%f2,	%f30
	fdtox	%f30,	%f10
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x784A922A1061CEF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	bpos	loop_1819
	fbug	%fcc3,	loop_1820
	fmul8ulx16	%f0,	%f22,	%f16
	stx	%i0,	[%l7 + 0x50]
loop_1819:
	tpos	%xcc,	0x4
loop_1820:
	orncc	%g3,	%l5,	%o1
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f8
	sethi	0x0A29,	%g4
	sllx	%o3,	0x04,	%i1
	udivx	%l0,	0x040C,	%l6
	fbul,a	%fcc2,	loop_1821
	tge	%xcc,	0x0
	sth	%o0,	[%l7 + 0x24]
	lduw	[%l7 + 0x1C],	%l2
loop_1821:
	fpack32	%f30,	%f18,	%f12
	set	0x18, %o1
	lda	[%l7 + %o1] 0x14,	%f9
	nop
	fitod	%f13,	%f26
	fandnot2s	%f28,	%f13,	%f22
	tsubcctv	%l3,	%i5,	%i3
	be,a,pt	%xcc,	loop_1822
	xor	%i7,	%i2,	%g1
	tvs	%xcc,	0x6
	bge,a,pt	%icc,	loop_1823
loop_1822:
	fbo,a	%fcc1,	loop_1824
	fpsub16s	%f4,	%f28,	%f31
	array8	%o6,	%i4,	%o5
loop_1823:
	nop
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x1f,	%f16
loop_1824:
	edge8	%g6,	%g2,	%o2
	tvs	%xcc,	0x2
	stb	%l4,	[%l7 + 0x58]
	set	0x22, %l6
	stha	%l1,	[%l7 + %l6] 0xe3
	membar	#Sync
	umul	%i6,	0x1E93,	%o7
	sdivx	%g5,	0x0C61,	%o4
	edge8ln	%i0,	%g3,	%l5
	edge8ln	%g7,	%o1,	%o3
	sir	0x019D
	addccc	%i1,	%l0,	%g4
	nop
	set	0x1C, %g5
	stb	%l6,	[%l7 + %g5]
	sll	%o0,	%l2,	%i5
	fbu,a	%fcc1,	loop_1825
	taddcc	%l3,	%i3,	%i7
	fmovrslez	%i2,	%f2,	%f2
	fnot2s	%f21,	%f16
loop_1825:
	edge32n	%g1,	%i4,	%o5
	tgu	%icc,	0x2
	movrne	%o6,	0x3B9,	%g2
	array32	%o2,	%l4,	%l1
	membar	0x64
	tvc	%icc,	0x5
	tvs	%icc,	0x1
	tge	%icc,	0x5
	be	loop_1826
	fnot2s	%f29,	%f24
	sub	%i6,	0x1142,	%o7
	fands	%f2,	%f2,	%f17
loop_1826:
	movrlez	%g5,	0x10A,	%o4
	membar	0x56
	ba,a,pn	%xcc,	loop_1827
	or	%i0,	0x03E3,	%g6
	movrgz	%l5,	0x1EA,	%g7
	fmovrsgez	%g3,	%f5,	%f12
loop_1827:
	movpos	%xcc,	%o1,	%i1
	fmovsgu	%icc,	%f8,	%f18
	addc	%o3,	0x01F3,	%g4
	taddcc	%l0,	%l6,	%o0
	tleu	%xcc,	0x1
	ta	%xcc,	0x2
	tge	%xcc,	0x1
	tsubcctv	%i5,	%l2,	%l3
	movpos	%icc,	%i3,	%i2
	movrgz	%i7,	%i4,	%o5
	srlx	%o6,	%g1,	%g2
	edge32	%o2,	%l4,	%l1
	subc	%o7,	0x0A5D,	%g5
	tpos	%xcc,	0x0
	edge16l	%o4,	%i0,	%g6
	edge32ln	%l5,	%g7,	%g3
	movre	%o1,	%i6,	%o3
	fpadd32s	%f0,	%f3,	%f22
	subcc	%i1,	%l0,	%g4
	andncc	%o0,	%l6,	%l2
	bl	loop_1828
	ldd	[%l7 + 0x10],	%f14
	bleu,pt	%xcc,	loop_1829
	fmovspos	%icc,	%f2,	%f12
loop_1828:
	array8	%i5,	%l3,	%i2
	sra	%i3,	%i4,	%o5
loop_1829:
	fcmpne16	%f28,	%f30,	%o6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x2F] %asi,	%i7
	tg	%icc,	0x2
	fmovsgu	%xcc,	%f0,	%f8
	sdivcc	%g2,	0x0DE6,	%o2
	array32	%g1,	%l1,	%o7
	fandnot1	%f4,	%f16,	%f24
	bge,a,pt	%xcc,	loop_1830
	bvc	%xcc,	loop_1831
	andcc	%l4,	0x1A9D,	%o4
	umulcc	%g5,	%g6,	%l5
loop_1830:
	tne	%icc,	0x4
loop_1831:
	fmovde	%xcc,	%f12,	%f26
	bcs,pn	%icc,	loop_1832
	sub	%g7,	%g3,	%i0
	ldsh	[%l7 + 0x1A],	%i6
	sdivcc	%o3,	0x1586,	%o1
loop_1832:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x54] %asi,	%l0
	edge32	%g4,	%i1,	%o0
	fcmpeq32	%f0,	%f12,	%l2
	bvs,a	%icc,	loop_1833
	nop
	fitos	%f1,	%f2
	fstox	%f2,	%f16
	tn	%xcc,	0x3
	popc	0x06D4,	%l6
loop_1833:
	tle	%xcc,	0x3
	bl,a	%xcc,	loop_1834
	srax	%i5,	0x03,	%i2
	fmovdl	%xcc,	%f25,	%f19
	edge16	%l3,	%i4,	%o5
loop_1834:
	addcc	%o6,	0x0C3E,	%i7
	fmovsn	%xcc,	%f17,	%f13
	movcs	%xcc,	%i3,	%o2
	fbu,a	%fcc2,	loop_1835
	bl,pt	%icc,	loop_1836
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g2,	0x1EC1,	%l1
loop_1835:
	bleu	%xcc,	loop_1837
loop_1836:
	sdiv	%o7,	0x0A12,	%g1
	nop
	set	0x0C, %o5
	lduw	[%l7 + %o5],	%o4
	movneg	%icc,	%g5,	%g6
loop_1837:
	tcc	%icc,	0x1
	set	0x40, %l3
	sta	%f18,	[%l7 + %l3] 0x19
	fzeros	%f16
	fmovspos	%icc,	%f18,	%f7
	set	0x78, %l4
	lduha	[%l7 + %l4] 0x04,	%l4
	fmovse	%icc,	%f25,	%f14
	movg	%icc,	%g7,	%l5
	movpos	%icc,	%i0,	%g3
	orcc	%i6,	0x0A7A,	%o1
	mova	%xcc,	%o3,	%l0
	tn	%xcc,	0x6
	ldx	[%l7 + 0x48],	%i1
	orncc	%o0,	0x0E9A,	%g4
	movge	%xcc,	%l2,	%i5
	nop
	setx	0xF06D8A20,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	sdivx	%l6,	0x01D4,	%i2
	movge	%xcc,	%l3,	%i4
	array16	%o6,	%i7,	%o5
	fblg,a	%fcc2,	loop_1838
	fmovdneg	%xcc,	%f17,	%f2
	mova	%icc,	%o2,	%g2
	edge16l	%l1,	%o7,	%g1
loop_1838:
	andncc	%o4,	%g5,	%g6
	fbu,a	%fcc2,	loop_1839
	fors	%f23,	%f31,	%f30
	bshuffle	%f2,	%f22,	%f24
	ld	[%l7 + 0x48],	%f26
loop_1839:
	or	%i3,	0x0A59,	%g7
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	xnorcc	%l5,	0x07DB,	%i0
	movrgz	%i6,	%o1,	%o3
	fmovdvc	%icc,	%f8,	%f24
	set	0x2C, %g4
	swapa	[%l7 + %g4] 0x89,	%l0
	movvc	%icc,	%g3,	%i1
	movcc	%xcc,	%g4,	%o0
	fmovrslz	%i5,	%f30,	%f10
	sdivx	%l2,	0x07F5,	%l6
	tne	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1840,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%l3,	%i2
	srax	%i4,	0x08,	%o6
	nop
	fitod	%f4,	%f6
	fdtos	%f6,	%f4
loop_1840:
	sll	%i7,	0x08,	%o5
	bcs,pn	%icc,	loop_1841
	ldd	[%l7 + 0x40],	%f22
	lduw	[%l7 + 0x18],	%g2
	mulx	%l1,	%o7,	%o2
loop_1841:
	fbuge	%fcc3,	loop_1842
	tcc	%icc,	0x3
	fornot2s	%f5,	%f5,	%f0
	fmuld8sux16	%f22,	%f29,	%f26
loop_1842:
	add	%g1,	%o4,	%g6
	prefetch	[%l7 + 0x34],	 0x3
	tn	%icc,	0x5
	subc	%g5,	0x1276,	%i3
	addcc	%g7,	0x19E9,	%l5
	nop
	fitos	%f3,	%f5
	fstoi	%f5,	%f4
	tvc	%icc,	0x2
	movn	%xcc,	%i0,	%i6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x62] %asi,	%l4
	nop
	setx	loop_1843,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg	%fcc0,	loop_1844
	movl	%icc,	%o1,	%l0
	tsubcc	%g3,	0x0FDB,	%i1
loop_1843:
	popc	%g4,	%o0
loop_1844:
	movrgez	%o3,	0x0FA,	%l2
	movre	%l6,	%i5,	%i2
	array16	%l3,	%o6,	%i4
	set	0x30, %o2
	lduha	[%l7 + %o2] 0x88,	%o5
	movrne	%g2,	%i7,	%l1
	movne	%xcc,	%o7,	%g1
	movpos	%icc,	%o2,	%g6
	movl	%xcc,	%g5,	%o4
	addccc	%i3,	0x0F14,	%l5
	set	0x70, %i5
	ldstuba	[%l7 + %i5] 0x0c,	%i0
	brgz	%g7,	loop_1845
	move	%icc,	%i6,	%l4
	mova	%xcc,	%l0,	%o1
	ldsh	[%l7 + 0x62],	%i1
loop_1845:
	fexpand	%f2,	%f24
	nop
	setx	0x3732923D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f14
	bl,a,pn	%icc,	loop_1846
	swap	[%l7 + 0x44],	%g3
	membar	0x15
	tn	%icc,	0x6
loop_1846:
	edge32l	%g4,	%o0,	%l2
	brgz	%l6,	loop_1847
	membar	0x09
	bneg,pt	%xcc,	loop_1848
	movn	%icc,	%i5,	%o3
loop_1847:
	tge	%icc,	0x1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x26] %asi,	%i2
loop_1848:
	fornot2s	%f27,	%f22,	%f25
	xnor	%l3,	%i4,	%o6
	and	%g2,	0x11DF,	%o5
	edge16ln	%i7,	%l1,	%o7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	xnorcc	%g1,	0x1C4E,	%g6
	fsrc1s	%f27,	%f13
	tsubcctv	%g5,	%o4,	%i3
	ta	%xcc,	0x4
	tvc	%icc,	0x5
	add	%i0,	%g7,	%i6
	fbl,a	%fcc1,	loop_1849
	mova	%xcc,	%l5,	%l0
	fxor	%f14,	%f4,	%f0
	for	%f10,	%f22,	%f22
loop_1849:
	movn	%icc,	%o1,	%l4
	udivx	%i1,	0x02AD,	%g3
	fmovsgu	%icc,	%f18,	%f25
	fmovse	%icc,	%f14,	%f19
	movvc	%xcc,	%o0,	%g4
	movl	%xcc,	%l2,	%l6
	fmovscc	%xcc,	%f3,	%f11
	fbuge,a	%fcc0,	loop_1850
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i5,	0x0EFF,	%o3
	sir	0x1048
loop_1850:
	fmovsle	%xcc,	%f15,	%f4
	movrne	%l3,	%i4,	%o6
	nop
	setx	0x807BA051,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	array16	%g2,	%o5,	%i7
	orn	%i2,	0x14DC,	%l1
	fnot2	%f8,	%f16
	fmovse	%xcc,	%f2,	%f18
	fsrc1	%f28,	%f24
	fpadd16	%f14,	%f12,	%f12
	udivcc	%o7,	0x1F23,	%g1
	orncc	%o2,	%g6,	%g5
	taddcc	%o4,	%i0,	%g7
	movrne	%i6,	0x337,	%i3
	andncc	%l5,	%l0,	%o1
	set	0x76, %i4
	ldsha	[%l7 + %i4] 0x19,	%l4
	xnorcc	%i1,	%o0,	%g4
	sdivcc	%g3,	0x1CBE,	%l6
	brgz	%i5,	loop_1851
	tle	%icc,	0x7
	st	%f31,	[%l7 + 0x40]
	bne,a	loop_1852
loop_1851:
	membar	0x00
	subccc	%o3,	0x03D6,	%l2
	fmovdg	%xcc,	%f21,	%f27
loop_1852:
	st	%f0,	[%l7 + 0x50]
	swap	[%l7 + 0x30],	%l3
	fpack16	%f2,	%f30
	sllx	%o6,	%g2,	%o5
	edge32ln	%i4,	%i7,	%i2
	fnor	%f6,	%f28,	%f6
	ldd	[%l7 + 0x68],	%f18
	set	0x20, %i1
	lduwa	[%l7 + %i1] 0x89,	%o7
	popc	0x140C,	%l1
	for	%f18,	%f26,	%f12
	nop
	setx	0x388857E409360F3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6240DA9B76FD5A8E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f8,	%f14
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	tsubcctv	%g1,	0x051A,	%g6
	fpackfix	%f8,	%f8
	fmovs	%f18,	%f13
	tl	%xcc,	0x5
	fmovdvs	%icc,	%f12,	%f20
	fmovdleu	%icc,	%f13,	%f2
	set	0x6C, %g7
	sta	%f10,	[%l7 + %g7] 0x89
	popc	0x135D,	%o2
	fandnot1s	%f18,	%f29,	%f8
	sir	0x0AB8
	mova	%icc,	%g5,	%i0
	stw	%g7,	[%l7 + 0x24]
	orncc	%o4,	0x1B03,	%i6
	alignaddr	%l5,	%l0,	%i3
	brlez	%o1,	loop_1853
	edge32	%i1,	%o0,	%l4
	std	%f8,	[%l7 + 0x60]
	bshuffle	%f30,	%f4,	%f18
loop_1853:
	movcc	%xcc,	%g3,	%g4
	srlx	%l6,	%o3,	%i5
	movcs	%xcc,	%l2,	%l3
	orcc	%g2,	0x17AF,	%o5
	movl	%icc,	%i4,	%o6
	bgu	%icc,	loop_1854
	fmovsvs	%xcc,	%f22,	%f13
	tg	%icc,	0x1
	edge16l	%i7,	%o7,	%l1
loop_1854:
	nop
	set	0x70, %i0
	lda	[%l7 + %i0] 0x89,	%f6
	fmuld8ulx16	%f26,	%f21,	%f20
	tpos	%icc,	0x3
	membar	0x6F
	subcc	%g1,	%i2,	%g6
	addccc	%o2,	%i0,	%g5
	fmovrslez	%g7,	%f23,	%f21
	alignaddr	%i6,	%o4,	%l0
	brlez	%i3,	loop_1855
	edge16ln	%l5,	%o1,	%i1
	andcc	%o0,	0x1AA8,	%g3
	sir	0x0009
loop_1855:
	fpadd16	%f4,	%f24,	%f8
	edge8	%g4,	%l4,	%o3
	fbug,a	%fcc1,	loop_1856
	addccc	%l6,	0x1F6F,	%i5
	ldstub	[%l7 + 0x62],	%l3
	movg	%xcc,	%g2,	%o5
loop_1856:
	fnegd	%f8,	%f14
	nop
	setx	0x446E47332FD0E22B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCF7716821092F5FB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f16,	%f24
	ldd	[%l7 + 0x38],	%i4
	nop
	setx	0xAB60F2C17B2F59CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCF5DB8C2FD4FC8A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f12,	%f22
	edge32n	%l2,	%o6,	%o7
	tvc	%xcc,	0x1
	popc	%i7,	%l1
	tsubcc	%i2,	0x1F6F,	%g1
	nop
	setx	0x51E5A2C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f21
	fpack32	%f28,	%f6,	%f18
	sethi	0x07D0,	%o2
	edge8l	%i0,	%g6,	%g5
	and	%g7,	0x1814,	%i6
	sdivx	%o4,	0x1856,	%i3
	xor	%l5,	0x17E9,	%l0
	fandnot1	%f6,	%f22,	%f30
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o1,	%o0
	fxnors	%f7,	%f22,	%f2
	ble,a,pn	%icc,	loop_1857
	fmovrdgez	%i1,	%f20,	%f28
	andcc	%g3,	0x1D46,	%g4
	edge32l	%o3,	%l4,	%i5
loop_1857:
	srlx	%l6,	%l3,	%o5
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f20
	srax	%g2,	%i4,	%l2
	addc	%o7,	0x1C32,	%o6
	tge	%xcc,	0x4
	array8	%l1,	%i7,	%g1
	fmovsa	%xcc,	%f8,	%f21
	set	0x0E, %l5
	lduha	[%l7 + %l5] 0x04,	%i2
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movl	%xcc,	%o2,	%g6
	edge8l	%g5,	%g7,	%i0
	tvc	%xcc,	0x4
	movvc	%icc,	%i6,	%o4
	fpadd32	%f6,	%f2,	%f22
	edge8l	%l5,	%l0,	%i3
	bleu,a	loop_1858
	subccc	%o0,	0x1F87,	%i1
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x22] %asi,	%o1
loop_1858:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x54] %asi,	%g4
	movcc	%icc,	%g3,	%o3
	call	loop_1859
	array8	%l4,	%l6,	%l3
	taddcc	%o5,	%i5,	%g2
	fabss	%f30,	%f5
loop_1859:
	te	%xcc,	0x1
	orcc	%l2,	0x050F,	%o7
	sllx	%i4,	%o6,	%i7
	andcc	%g1,	%l1,	%o2
	ba	loop_1860
	tge	%xcc,	0x5
	fnot2	%f20,	%f18
	andn	%g6,	0x0CA4,	%g5
loop_1860:
	tgu	%xcc,	0x2
	movg	%icc,	%i2,	%g7
	fblg	%fcc0,	loop_1861
	edge32l	%i0,	%o4,	%l5
	umulcc	%l0,	%i6,	%i3
	orncc	%o0,	%o1,	%i1
loop_1861:
	sethi	0x137F,	%g3
	edge16l	%g4,	%l4,	%l6
	fble,a	%fcc3,	loop_1862
	sethi	0x0FBE,	%o3
	nop
	fitos	%f0,	%f15
	fstox	%f15,	%f6
	fxtos	%f6,	%f24
	edge8l	%l3,	%o5,	%g2
loop_1862:
	edge16ln	%i5,	%o7,	%l2
	brgz	%i4,	loop_1863
	fmul8x16al	%f18,	%f11,	%f10
	tsubcctv	%o6,	%g1,	%i7
	fornot1s	%f15,	%f4,	%f18
loop_1863:
	be,a	%xcc,	loop_1864
	tcc	%icc,	0x4
	bcc,a	loop_1865
	tg	%icc,	0x4
loop_1864:
	tneg	%xcc,	0x1
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f8
loop_1865:
	srax	%l1,	%o2,	%g6
	udivx	%g5,	0x05EC,	%i2
	movgu	%icc,	%i0,	%o4
	edge32l	%g7,	%l5,	%l0
	subccc	%i6,	0x1D45,	%o0
	tsubcc	%i3,	0x12EF,	%i1
	fmovsneg	%icc,	%f20,	%f17
	edge16	%o1,	%g4,	%l4
	set	0x3E, %g3
	lduba	[%l7 + %g3] 0x04,	%l6
	tg	%icc,	0x3
	nop
	setx	loop_1866,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x7
	edge32l	%g3,	%l3,	%o5
	tleu	%xcc,	0x7
loop_1866:
	edge8l	%g2,	%o3,	%i5
	orcc	%o7,	%l2,	%o6
	edge16	%g1,	%i7,	%l1
	array8	%i4,	%o2,	%g5
	movrgz	%g6,	0x067,	%i2
	edge16l	%o4,	%g7,	%i0
	addc	%l0,	0x17D3,	%l5
	tg	%icc,	0x3
	bvs,a	%xcc,	loop_1867
	movn	%icc,	%i6,	%i3
	fnegs	%f16,	%f6
	movne	%xcc,	%o0,	%o1
loop_1867:
	ta	%xcc,	0x6
	mova	%xcc,	%g4,	%i1
	edge16n	%l4,	%l6,	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g3
	fblg	%fcc0,	loop_1868
	srl	%o3,	0x0A,	%i5
	ta	%icc,	0x2
	st	%f28,	[%l7 + 0x7C]
loop_1868:
	movgu	%xcc,	%g2,	%o7
	fpack32	%f30,	%f26,	%f14
	bneg,a	%icc,	loop_1869
	movre	%l2,	0x3F7,	%g1
	fpsub32	%f22,	%f6,	%f10
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x22,	%i6
loop_1869:
	fbe,a	%fcc1,	loop_1870
	fmovd	%f4,	%f2
	array8	%o6,	%l1,	%o2
	bvs,a	%xcc,	loop_1871
loop_1870:
	movrlez	%g5,	0x1E6,	%i4
	tsubcc	%i2,	%g6,	%o4
	taddcc	%i0,	%g7,	%l0
loop_1871:
	edge8n	%i6,	%i3,	%l5
	fcmpeq16	%f4,	%f26,	%o1
	sub	%g4,	%i1,	%o0
	fone	%f8
	fmovrdgez	%l6,	%f16,	%f10
	wr	%g0,	0xe2,	%asi
	stwa	%l4,	[%l7 + 0x5C] %asi
	membar	#Sync
	edge8ln	%o5,	%g3,	%o3
	nop
	setx	0x93EEE83D6075DC1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	edge16	%l3,	%i5,	%o7
	fmovdle	%icc,	%f5,	%f30
	ldd	[%l7 + 0x10],	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x36],	%g2
	movrlz	%g1,	%o6,	%i7
	movre	%l1,	%g5,	%o2
	orcc	%i4,	%g6,	%i2
	andcc	%o4,	%g7,	%i0
	edge32ln	%l0,	%i6,	%i3
	tg	%icc,	0x2
	fzeros	%f11
	movneg	%icc,	%l5,	%o1
	fmovsneg	%xcc,	%f31,	%f14
	ble,a,pn	%xcc,	loop_1872
	add	%i1,	0x0A5B,	%o0
	fxnors	%f7,	%f16,	%f9
	fsrc1	%f26,	%f18
loop_1872:
	ta	%icc,	0x2
	set	0x39, %g1
	lduba	[%l7 + %g1] 0x19,	%l6
	edge16n	%l4,	%g4,	%g3
	subcc	%o5,	%l3,	%o3
	movrgz	%i5,	%l2,	%g2
	and	%o7,	%g1,	%o6
	stx	%l1,	[%l7 + 0x50]
	sethi	0x08E2,	%i7
	array32	%g5,	%i4,	%o2
	fmovd	%f24,	%f20
	fmul8x16al	%f29,	%f8,	%f24
	fabsd	%f14,	%f10
	bgu,a	loop_1873
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%g6
	movrgez	%i2,	%g7,	%o4
	tne	%icc,	0x1
loop_1873:
	faligndata	%f8,	%f2,	%f22
	fnot2s	%f0,	%f8
	lduh	[%l7 + 0x3C],	%i0
	movrgez	%l0,	0x20D,	%i3
	subcc	%i6,	%o1,	%l5
	fmul8x16al	%f4,	%f3,	%f12
	lduw	[%l7 + 0x2C],	%i1
	brlez	%l6,	loop_1874
	movgu	%xcc,	%l4,	%g4
	fmovsleu	%xcc,	%f13,	%f12
	edge32	%o0,	%o5,	%l3
loop_1874:
	brgz,a	%g3,	loop_1875
	sll	%o3,	%i5,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a	loop_1876
loop_1875:
	st	%f19,	[%l7 + 0x58]
	movrne	%l2,	%g1,	%o7
	sethi	0x1369,	%o6
loop_1876:
	bleu,pn	%icc,	loop_1877
	fpackfix	%f22,	%f12
	tcc	%icc,	0x7
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x89,	%i6
loop_1877:
	fmovrsgez	%l1,	%f11,	%f19
	set	0x40, %i6
	ldswa	[%l7 + %i6] 0x18,	%g5
	nop
	setx loop_1878, %l0, %l1
	jmpl %l1, %o2
	fmovsg	%xcc,	%f29,	%f3
	st	%f27,	[%l7 + 0x6C]
	srlx	%i4,	0x19,	%i2
loop_1878:
	udivcc	%g7,	0x1D34,	%g6
	bl,a	%xcc,	loop_1879
	array32	%i0,	%o4,	%l0
	movvc	%icc,	%i3,	%i6
	sdivcc	%l5,	0x1CA5,	%i1
loop_1879:
	movvc	%icc,	%l6,	%l4
	movg	%icc,	%o1,	%g4
	smulcc	%o0,	%l3,	%o5
	fandnot2	%f10,	%f18,	%f4
	faligndata	%f20,	%f30,	%f24
	movrlz	%g3,	%o3,	%i5
	umul	%g2,	%g1,	%l2
	fbn,a	%fcc2,	loop_1880
	taddcc	%o6,	%o7,	%l1
	fmovsgu	%icc,	%f22,	%f8
	ld	[%l7 + 0x18],	%f5
loop_1880:
	tgu	%xcc,	0x0
	sdivx	%i7,	0x0341,	%o2
	bn,a	%xcc,	loop_1881
	membar	0x2D
	edge16l	%i4,	%g5,	%g7
	tg	%icc,	0x6
loop_1881:
	nop
	setx	0x86DE530F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x8BED4203,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f4,	%f1
	movcs	%xcc,	%g6,	%i2
	srl	%o4,	%l0,	%i0
	fpsub16	%f26,	%f24,	%f4
	edge16n	%i3,	%i6,	%i1
	swap	[%l7 + 0x20],	%l5
	nop
	setx	0x805EA67E,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	movleu	%icc,	%l6,	%o1
	sdiv	%g4,	0x1E23,	%o0
	smul	%l3,	0x0309,	%l4
	srax	%o5,	%g3,	%o3
	sdivx	%i5,	0x088C,	%g2
	fpack32	%f16,	%f24,	%f20
	fmovsneg	%xcc,	%f30,	%f19
	fbge,a	%fcc0,	loop_1882
	edge8ln	%l2,	%g1,	%o6
	movrgz	%o7,	%l1,	%o2
	fbue,a	%fcc1,	loop_1883
loop_1882:
	tge	%icc,	0x1
	andn	%i7,	0x03C4,	%g5
	tvs	%icc,	0x0
loop_1883:
	sdiv	%i4,	0x19A6,	%g7
	be	loop_1884
	nop
	fitos	%f8,	%f0
	fstod	%f0,	%f22
	fpackfix	%f4,	%f4
	movcc	%xcc,	%g6,	%o4
loop_1884:
	sth	%i2,	[%l7 + 0x10]
	be	%xcc,	loop_1885
	movleu	%icc,	%i0,	%l0
	st	%f12,	[%l7 + 0x7C]
	or	%i6,	0x0393,	%i3
loop_1885:
	fnot2	%f28,	%f18
	stb	%i1,	[%l7 + 0x73]
	xorcc	%l6,	0x18D4,	%o1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x11
	ldstub	[%l7 + 0x49],	%l5
	nop
	fitos	%f13,	%f27
	fstod	%f27,	%f10
	fandnot1	%f18,	%f26,	%f30
	set	0x7C, %o6
	lda	[%l7 + %o6] 0x04,	%f2
	edge32l	%g4,	%o0,	%l4
	nop
	fitos	%f31,	%f2
	edge8l	%o5,	%l3,	%o3
	fba	%fcc1,	loop_1886
	edge8l	%g3,	%i5,	%l2
	srl	%g2,	0x09,	%g1
	stb	%o6,	[%l7 + 0x28]
loop_1886:
	subc	%o7,	%l1,	%o2
	movle	%icc,	%i7,	%i4
	bvc	%xcc,	loop_1887
	ta	%xcc,	0x1
	tg	%xcc,	0x5
	udivcc	%g7,	0x0D78,	%g5
loop_1887:
	fpadd16	%f20,	%f8,	%f20
	fbuge	%fcc2,	loop_1888
	movcs	%xcc,	%g6,	%o4
	set	0x18, %o4
	stha	%i0,	[%l7 + %o4] 0x15
loop_1888:
	fmovdneg	%xcc,	%f18,	%f26
	nop
	setx	0x34C92F8B6CF98241,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0BD7F61576C81B2D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f14,	%f24
	fmovs	%f26,	%f22
	mulx	%i2,	%i6,	%i3
	edge8l	%l0,	%l6,	%o1
	tneg	%xcc,	0x0
	fbule,a	%fcc3,	loop_1889
	edge16n	%i1,	%l5,	%g4
	tgu	%xcc,	0x6
	movrne	%l4,	0x115,	%o5
loop_1889:
	xnorcc	%o0,	%o3,	%l3
	nop
	fitos	%f1,	%f7
	fstod	%f7,	%f14
	prefetch	[%l7 + 0x34],	 0x3
	tgu	%xcc,	0x4
	movpos	%icc,	%g3,	%l2
	tle	%icc,	0x7
	popc	%g2,	%g1
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x04
	sra	%i5,	0x1A,	%o7
	fbge	%fcc3,	loop_1890
	movrgez	%o6,	0x030,	%o2
	fmovdge	%icc,	%f11,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1890:
	sra	%i7,	0x04,	%l1
	mulscc	%g7,	%g5,	%i4
	edge8ln	%g6,	%i0,	%i2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x24] %asi,	%f9
	fors	%f7,	%f20,	%f13
	tsubcctv	%i6,	%i3,	%o4
	add	%l6,	%l0,	%i1
	array16	%l5,	%g4,	%o1
	fba,a	%fcc1,	loop_1891
	fmovrsne	%o5,	%f24,	%f14
	mulscc	%o0,	%o3,	%l4
	fbge,a	%fcc2,	loop_1892
loop_1891:
	move	%icc,	%l3,	%g3
	movg	%icc,	%g2,	%l2
	nop
	fitos	%f8,	%f11
	fstox	%f11,	%f30
	fxtos	%f30,	%f31
loop_1892:
	fmovse	%xcc,	%f0,	%f24
	edge32n	%g1,	%i5,	%o7
	bn	%xcc,	loop_1893
	xnorcc	%o2,	%i7,	%l1
	movcs	%icc,	%g7,	%g5
	sethi	0x0696,	%o6
loop_1893:
	sll	%i4,	%i0,	%g6
	tcs	%icc,	0x5
	edge32n	%i2,	%i6,	%i3
	alignaddrl	%l6,	%l0,	%o4
	tne	%xcc,	0x4
	flush	%l7 + 0x68
	mulscc	%l5,	%i1,	%o1
	brlez,a	%g4,	loop_1894
	edge32l	%o5,	%o0,	%o3
	sethi	0x0CB9,	%l3
	stw	%g3,	[%l7 + 0x60]
loop_1894:
	fornot1s	%f3,	%f15,	%f29
	udivx	%l4,	0x0B1C,	%g2
	fmovrsne	%g1,	%f27,	%f23
	sdiv	%l2,	0x1857,	%o7
	mova	%icc,	%i5,	%i7
	swap	[%l7 + 0x5C],	%l1
	fcmpeq32	%f2,	%f4,	%o2
	fbo,a	%fcc1,	loop_1895
	ldx	[%l7 + 0x50],	%g7
	ta	%xcc,	0x0
	tcc	%xcc,	0x7
loop_1895:
	subccc	%g5,	0x09EB,	%o6
	bne,a,pn	%icc,	loop_1896
	edge32	%i4,	%i0,	%g6
	tpos	%icc,	0x0
	fpack16	%f30,	%f15
loop_1896:
	nop
	wr	%g0,	0x19,	%asi
	stha	%i6,	[%l7 + 0x2E] %asi
	edge32ln	%i3,	%i2,	%l0
	fmovrsne	%o4,	%f22,	%f9
	edge8ln	%l6,	%i1,	%l5
	brgez	%g4,	loop_1897
	fba	%fcc2,	loop_1898
	fbe,a	%fcc0,	loop_1899
	edge32l	%o5,	%o0,	%o1
loop_1897:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f29,	[%l7 + 0x0C] %asi
loop_1898:
	fbule	%fcc3,	loop_1900
loop_1899:
	smul	%o3,	%l3,	%g3
	fmovrdgez	%l4,	%f6,	%f28
	fmovrsgez	%g2,	%f29,	%f7
loop_1900:
	fmovdn	%xcc,	%f14,	%f17
	fxnor	%f8,	%f0,	%f8
	movrgez	%g1,	%o7,	%i5
	stw	%l2,	[%l7 + 0x40]
	edge32n	%i7,	%o2,	%g7
	swap	[%l7 + 0x64],	%l1
	edge8l	%o6,	%i4,	%g5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i0
	movvs	%xcc,	%i6,	%i3
	nop
	setx	loop_1901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%icc,	0x7
	nop
	fitos	%f8,	%f24
	sdivx	%i2,	0x1D5A,	%l0
loop_1901:
	addc	%o4,	0x1873,	%g6
	movg	%icc,	%l6,	%l5
	bcs,a,pt	%icc,	loop_1902
	xorcc	%g4,	%i1,	%o5
	orncc	%o0,	%o3,	%l3
	sdivx	%g3,	0x0A11,	%l4
loop_1902:
	edge16l	%g2,	%g1,	%o1
	fbug	%fcc1,	loop_1903
	ldsb	[%l7 + 0x7B],	%i5
	fbl,a	%fcc3,	loop_1904
	bge,a	loop_1905
loop_1903:
	movge	%xcc,	%l2,	%o7
	fmovsne	%xcc,	%f16,	%f9
loop_1904:
	tcc	%icc,	0x0
loop_1905:
	sdivcc	%i7,	0x026D,	%o2
	edge16l	%l1,	%g7,	%i4
	nop
	fitod	%f4,	%f30
	fdtoi	%f30,	%f1
	nop
	fitos	%f14,	%f25
	movpos	%xcc,	%g5,	%o6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i6
	move	%xcc,	%i0,	%i3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	movrne	%l0,	%o4,	%g6
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x18
	fble	%fcc2,	loop_1906
	ble,pt	%icc,	loop_1907
	taddcc	%l6,	%g4,	%i1
	movcc	%icc,	%l5,	%o5
loop_1906:
	fxor	%f24,	%f20,	%f6
loop_1907:
	movcc	%icc,	%o0,	%l3
	orncc	%g3,	0x1CDD,	%o3
	tvc	%xcc,	0x3
	fxors	%f12,	%f10,	%f11
	fmovsa	%icc,	%f3,	%f22
	fmovdne	%xcc,	%f30,	%f26
	fba,a	%fcc0,	loop_1908
	fandnot2	%f0,	%f2,	%f4
	sethi	0x0662,	%l4
	array16	%g2,	%o1,	%g1
loop_1908:
	flush	%l7 + 0x6C
	add	%l2,	%i5,	%o7
	array16	%i7,	%o2,	%g7
	sllx	%i4,	0x19,	%g5
	lduh	[%l7 + 0x6A],	%o6
	nop
	setx	0xDF0B0503C167D542,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x1A0A0FFC8C56A420,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f18,	%f14
	srlx	%i6,	%l1,	%i3
	fmovsle	%icc,	%f31,	%f24
	std	%f12,	[%l7 + 0x08]
	call	loop_1909
	subc	%i0,	0x18B3,	%i2
	ldd	[%l7 + 0x50],	%f20
	andn	%l0,	0x1838,	%g6
loop_1909:
	ldsb	[%l7 + 0x18],	%l6
	movg	%xcc,	%g4,	%o4
	mulscc	%l5,	%i1,	%o5
	fxor	%f30,	%f4,	%f30
	tneg	%icc,	0x5
	edge16ln	%o0,	%g3,	%l3
	bcs,a,pn	%icc,	loop_1910
	fbul	%fcc0,	loop_1911
	brz,a	%l4,	loop_1912
	srax	%g2,	0x0F,	%o3
loop_1910:
	edge8l	%o1,	%l2,	%g1
loop_1911:
	and	%o7,	0x1594,	%i7
loop_1912:
	xnor	%o2,	0x0A25,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g7,	0x07,	%g5
	fzeros	%f10
	fone	%f24
	addcc	%o6,	%i4,	%l1
	mova	%icc,	%i3,	%i0
	tne	%icc,	0x3
	andncc	%i2,	%l0,	%i6
	fpsub16s	%f3,	%f15,	%f27
	tle	%xcc,	0x4
	tcc	%icc,	0x4
	tn	%icc,	0x4
	umul	%l6,	0x1E29,	%g4
	mova	%xcc,	%o4,	%g6
	ble,a,pn	%xcc,	loop_1913
	movrlez	%l5,	0x1B8,	%o5
	brz,a	%o0,	loop_1914
	edge32	%i1,	%l3,	%g3
loop_1913:
	fand	%f6,	%f0,	%f24
	tl	%icc,	0x2
loop_1914:
	brgez	%g2,	loop_1915
	alignaddr	%o3,	%l4,	%l2
	movcs	%xcc,	%g1,	%o1
	fpsub16	%f18,	%f24,	%f8
loop_1915:
	brgz,a	%i7,	loop_1916
	ld	[%l7 + 0x60],	%f19
	movvc	%xcc,	%o2,	%o7
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x67] %asi,	%i5
loop_1916:
	movvs	%icc,	%g7,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g5,	%l1,	%i4
	fbug,a	%fcc1,	loop_1917
	tn	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x10] %asi,	%i0
loop_1917:
	tvc	%xcc,	0x4
	movleu	%xcc,	%i2,	%i3
	fmovdn	%xcc,	%f13,	%f29
	bge	%icc,	loop_1918
	or	%i6,	%l6,	%l0
	tgu	%xcc,	0x6
	srlx	%o4,	0x0A,	%g4
loop_1918:
	bpos	%xcc,	loop_1919
	umulcc	%l5,	%o5,	%g6
	fpadd32	%f2,	%f22,	%f18
	brlez,a	%i1,	loop_1920
loop_1919:
	udivcc	%o0,	0x16BA,	%l3
	sethi	0x1655,	%g2
	set	0x68, %g6
	stwa	%g3,	[%l7 + %g6] 0x18
loop_1920:
	fmovdne	%icc,	%f2,	%f9
	nop
	setx loop_1921, %l0, %l1
	jmpl %l1, %l4
	xorcc	%l2,	0x100E,	%g1
	taddcctv	%o1,	0x1F70,	%o3
	fmovsl	%xcc,	%f21,	%f0
loop_1921:
	fmul8ulx16	%f28,	%f12,	%f16
	tgu	%xcc,	0x5
	fmovrslz	%o2,	%f25,	%f1
	fbn	%fcc1,	loop_1922
	nop
	setx	0x1D428313B787B528,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f12
	fpsub32	%f26,	%f14,	%f14
	call	loop_1923
loop_1922:
	sll	%i7,	%o7,	%g7
	fmovdgu	%xcc,	%f16,	%f1
	tleu	%xcc,	0x3
loop_1923:
	fnot1	%f2,	%f30
	fandnot2s	%f18,	%f0,	%f13
	edge16l	%o6,	%g5,	%l1
	nop
	setx	0x91FF2089454E01D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1F2259C87E841B8C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f10,	%f26
	fmovsn	%icc,	%f12,	%f1
	membar	0x0F
	edge32	%i5,	%i0,	%i2
	tsubcctv	%i4,	%i3,	%i6
	tpos	%xcc,	0x4
	ldsw	[%l7 + 0x58],	%l6
	brgez	%l0,	loop_1924
	movge	%xcc,	%g4,	%o4
	tsubcctv	%o5,	0x17CB,	%l5
	bg,a,pn	%icc,	loop_1925
loop_1924:
	bvc,pt	%icc,	loop_1926
	ldd	[%l7 + 0x08],	%f22
	srax	%g6,	%o0,	%i1
loop_1925:
	ldx	[%l7 + 0x78],	%g2
loop_1926:
	mulx	%l3,	%l4,	%g3
	tsubcctv	%g1,	0x01AF,	%l2
	fornot2	%f6,	%f22,	%f10
	fcmple16	%f10,	%f22,	%o1
	fcmple32	%f20,	%f18,	%o2
	sll	%i7,	0x11,	%o3
	addcc	%g7,	%o7,	%g5
	tle	%xcc,	0x7
	tcc	%icc,	0x4
	andncc	%l1,	%o6,	%i5
	movcc	%icc,	%i2,	%i0
	bvc	loop_1927
	ldsh	[%l7 + 0x12],	%i3
	umulcc	%i4,	0x0BAC,	%l6
	nop
	fitod	%f6,	%f20
	fdtox	%f20,	%f24
loop_1927:
	bvc,a	%xcc,	loop_1928
	movne	%icc,	%l0,	%i6
	st	%f21,	[%l7 + 0x18]
	fexpand	%f16,	%f22
loop_1928:
	movg	%xcc,	%o4,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x5A4C7F32,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xA45E3894,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f18,	%f8
	xorcc	%l5,	0x00C8,	%o5
	udiv	%o0,	0x0652,	%g6
	fbg,a	%fcc0,	loop_1929
	tgu	%icc,	0x2
	smulcc	%g2,	0x02E5,	%i1
	te	%xcc,	0x3
loop_1929:
	nop
	fitos	%f6,	%f26
	fstox	%f26,	%f24
	movl	%icc,	%l4,	%l3
	taddcctv	%g1,	%g3,	%l2
	fmovdcs	%icc,	%f23,	%f5
	taddcctv	%o1,	0x02D2,	%o2
	xnor	%o3,	%g7,	%o7
	fmovrdlz	%i7,	%f8,	%f26
	set	0x28, %o0
	stxa	%g5,	[%l7 + %o0] 0x15
	move	%icc,	%l1,	%o6
	tl	%icc,	0x7
	edge8ln	%i2,	%i0,	%i5
	fmovrdlz	%i4,	%f6,	%f8
	addc	%l6,	0x0BD7,	%i3
	wr	%g0,	0x10,	%asi
	stha	%l0,	[%l7 + 0x6E] %asi
	alignaddrl	%o4,	%i6,	%g4
	edge8	%o5,	%o0,	%g6
	movle	%icc,	%g2,	%i1
	st	%f9,	[%l7 + 0x7C]
	call	loop_1930
	tgu	%xcc,	0x0
	move	%icc,	%l4,	%l5
	tpos	%xcc,	0x2
loop_1930:
	sir	0x0894
	add	%g1,	0x1AD7,	%l3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l2
	movrne	%g3,	%o2,	%o3
	tl	%xcc,	0x2
	andncc	%o1,	%g7,	%o7
	brz	%g5,	loop_1931
	movcs	%xcc,	%l1,	%o6
	edge32	%i7,	%i0,	%i5
	fble	%fcc0,	loop_1932
loop_1931:
	bne	loop_1933
	nop
	fitod	%f2,	%f2
	fdtox	%f2,	%f4
	fpackfix	%f4,	%f31
loop_1932:
	edge32n	%i4,	%i2,	%i3
loop_1933:
	nop
	setx loop_1934, %l0, %l1
	jmpl %l1, %l6
	edge16ln	%o4,	%l0,	%g4
	fcmpne32	%f26,	%f4,	%o5
	movre	%i6,	0x03B,	%o0
loop_1934:
	membar	0x42
	edge8l	%g2,	%i1,	%g6
	srax	%l4,	%l5,	%l3
	fpadd16	%f12,	%f24,	%f4
	sllx	%g1,	0x10,	%l2
	addccc	%o2,	0x11C8,	%g3
	edge16ln	%o1,	%g7,	%o3
	movleu	%icc,	%o7,	%g5
	subcc	%o6,	%l1,	%i0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x69] %asi,	%i7
	nop
	setx	0x134F3BE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x8B70169C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f9,	%f6
	movneg	%icc,	%i5,	%i2
	add	%i4,	0x153C,	%i3
	fmovsne	%icc,	%f23,	%f21
	fnot2	%f20,	%f0
	movrne	%l6,	0x399,	%o4
	fpsub16s	%f16,	%f1,	%f23
	addcc	%l0,	0x0615,	%g4
	sll	%o5,	%o0,	%g2
	xnor	%i1,	%g6,	%i6
	move	%icc,	%l4,	%l3
	tne	%xcc,	0x5
	movre	%g1,	%l5,	%l2
	fmovsle	%icc,	%f17,	%f28
	fcmpgt16	%f18,	%f20,	%g3
	tg	%icc,	0x2
	and	%o1,	0x03CB,	%o2
	nop
	setx	0xE880E755,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f1
	edge8n	%g7,	%o3,	%g5
	fmovdneg	%icc,	%f11,	%f10
	prefetch	[%l7 + 0x10],	 0x3
	edge16	%o6,	%l1,	%i0
	bvc	%xcc,	loop_1935
	stbar
	fcmpne16	%f6,	%f0,	%o7
	tvs	%icc,	0x6
loop_1935:
	andcc	%i5,	0x03AC,	%i7
	fbe	%fcc0,	loop_1936
	smulcc	%i2,	%i4,	%l6
	fmovrdlz	%o4,	%f14,	%f20
	fbl,a	%fcc3,	loop_1937
loop_1936:
	ldx	[%l7 + 0x70],	%l0
	subc	%i3,	0x0FF1,	%g4
	movg	%xcc,	%o0,	%g2
loop_1937:
	movrgez	%o5,	0x0C9,	%g6
	fpackfix	%f18,	%f3
	wr	%g0,	0x10,	%asi
	stwa	%i6,	[%l7 + 0x78] %asi
	tpos	%icc,	0x1
	movcc	%icc,	%l4,	%i1
	movle	%xcc,	%g1,	%l5
	umul	%l3,	0x1302,	%g3
	nop
	setx	0x2BD13BF00049BD5B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	nop
	setx	loop_1938,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l2,	%o2,	%g7
	te	%icc,	0x6
	orn	%o1,	%g5,	%o6
loop_1938:
	ldd	[%l7 + 0x20],	%f18
	udivcc	%o3,	0x1E7E,	%l1
	srlx	%i0,	0x03,	%i5
	xorcc	%o7,	%i2,	%i4
	fmovrslz	%l6,	%f15,	%f0
	movne	%icc,	%o4,	%l0
	fmovdne	%icc,	%f17,	%f22
	nop
	fitod	%f2,	%f16
	fdtos	%f16,	%f0
	fnot2s	%f15,	%f11
	fmovrslez	%i7,	%f30,	%f20
	nop
	setx	0xE05AF62A968C4ED6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f26
	movrgz	%i3,	%g4,	%g2
	nop
	setx	0x2ADE97E1A3452A0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f2
	ldd	[%l7 + 0x08],	%o4
	fbuge	%fcc3,	loop_1939
	xor	%g6,	0x030E,	%o0
	fmul8x16	%f22,	%f26,	%f18
	fpadd16	%f22,	%f8,	%f26
loop_1939:
	bgu,a	loop_1940
	fmul8sux16	%f0,	%f20,	%f0
	xor	%l4,	%i1,	%i6
	umulcc	%l5,	%g1,	%l3
loop_1940:
	mulx	%g3,	%o2,	%l2
	orncc	%o1,	%g5,	%o6
	xnorcc	%g7,	%l1,	%o3
	stbar
	srax	%i5,	%o7,	%i0
	subcc	%i4,	%i2,	%o4
	fornot1	%f26,	%f0,	%f18
	movle	%icc,	%l0,	%i7
	stx	%l6,	[%l7 + 0x10]
	array32	%g4,	%i3,	%g2
	mulx	%o5,	0x053C,	%g6
	set	0x3C, %o1
	sta	%f14,	[%l7 + %o1] 0x15
	fornot2s	%f15,	%f29,	%f25
	fmovsvc	%xcc,	%f27,	%f24
	swap	[%l7 + 0x28],	%o0
	addccc	%i1,	0x1AA4,	%l4
	edge16l	%l5,	%g1,	%i6
	fmovsn	%xcc,	%f17,	%f4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x0c,	%f0
	movrlz	%g3,	%l3,	%l2
	tg	%icc,	0x6
	tpos	%icc,	0x2
	subcc	%o1,	%o2,	%g5
	subcc	%g7,	0x0A9B,	%l1
	edge16	%o3,	%o6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i0,	0x19AE,	%i4
	sir	0x041C
	fnot1	%f26,	%f22
	taddcctv	%i2,	%o4,	%i5
	sth	%l0,	[%l7 + 0x34]
	ble	%icc,	loop_1941
	be	%xcc,	loop_1942
	edge32	%i7,	%l6,	%g4
	set	0x2A, %l6
	stba	%i3,	[%l7 + %l6] 0x2a
	membar	#Sync
loop_1941:
	bvc,a	loop_1943
loop_1942:
	fmovsleu	%xcc,	%f14,	%f2
	or	%o5,	0x08C4,	%g6
	nop
	setx	0xA3B3E2080EE7AB47,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3D5018CFD5799AB2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f22,	%f20
loop_1943:
	orncc	%o0,	%i1,	%l4
	movleu	%xcc,	%g2,	%l5
	sdivcc	%i6,	0x11BC,	%g1
	movvs	%icc,	%g3,	%l3
	tpos	%xcc,	0x4
	fpackfix	%f2,	%f31
	srax	%o1,	%l2,	%g5
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x15,	%f0
	fcmpgt16	%f4,	%f30,	%g7
	nop
	fitos	%f12,	%f6
	fstox	%f6,	%f22
	be,a	%icc,	loop_1944
	fblg	%fcc1,	loop_1945
	udiv	%o2,	0x1DC7,	%l1
	bpos,a,pn	%xcc,	loop_1946
loop_1944:
	nop
	set	0x4C, %g5
	stb	%o6,	[%l7 + %g5]
loop_1945:
	nop
	fitos	%f9,	%f13
	fstox	%f13,	%f10
	fxtos	%f10,	%f3
	orncc	%o3,	0x05CA,	%i0
loop_1946:
	movvc	%xcc,	%o7,	%i2
	ldsh	[%l7 + 0x42],	%i4
	subccc	%o4,	0x0634,	%i5
	sll	%l0,	%l6,	%g4
	movrne	%i3,	0x2E3,	%i7
	umulcc	%o5,	%g6,	%i1
	fnot1	%f14,	%f12
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f0
	wr	%g0,	0x27,	%asi
	stwa	%l4,	[%l7 + 0x74] %asi
	membar	#Sync
	ld	[%l7 + 0x50],	%f17
	fbug	%fcc1,	loop_1947
	nop
	setx	0x56E297DEA19BCA22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f10
	tsubcc	%o0,	%g2,	%i6
	set	0x28, %o5
	stwa	%g1,	[%l7 + %o5] 0xea
	membar	#Sync
loop_1947:
	fsrc1	%f18,	%f30
	fble,a	%fcc3,	loop_1948
	srax	%l5,	0x0B,	%g3
	ta	%xcc,	0x4
	prefetch	[%l7 + 0x3C],	 0x0
loop_1948:
	nop
	setx	loop_1949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%l3,	0x0160,	%o1
	edge32n	%g5,	%l2,	%o2
	fmovspos	%icc,	%f2,	%f8
loop_1949:
	fbg,a	%fcc1,	loop_1950
	tsubcc	%l1,	0x19A5,	%g7
	movrlz	%o6,	%i0,	%o3
	fmovsneg	%xcc,	%f25,	%f18
loop_1950:
	edge16n	%i2,	%o7,	%o4
	udivx	%i4,	0x0488,	%i5
	array8	%l0,	%g4,	%l6
	fmovdpos	%xcc,	%f13,	%f26
	brgez	%i3,	loop_1951
	tgu	%icc,	0x4
	tcs	%xcc,	0x5
	fmovsleu	%icc,	%f19,	%f5
loop_1951:
	tpos	%icc,	0x0
	umulcc	%o5,	0x0C93,	%i7
	bge,a,pt	%xcc,	loop_1952
	fmovdpos	%xcc,	%f29,	%f18
	andcc	%g6,	%l4,	%o0
	tle	%xcc,	0x3
loop_1952:
	movrne	%g2,	%i1,	%g1
	fbne,a	%fcc1,	loop_1953
	mova	%xcc,	%l5,	%i6
	nop
	setx	0x12691698,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xA768511D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f12,	%f1
	or	%l3,	%g3,	%o1
loop_1953:
	bneg,a	%icc,	loop_1954
	edge16	%g5,	%l2,	%l1
	mova	%icc,	%o2,	%o6
	edge8l	%i0,	%g7,	%i2
loop_1954:
	umul	%o7,	%o3,	%i4
	set	0x74, %l3
	lduha	[%l7 + %l3] 0x18,	%o4
	ble,a	%xcc,	loop_1955
	fmovrsgez	%l0,	%f18,	%f29
	orncc	%i5,	%g4,	%i3
	fbue,a	%fcc3,	loop_1956
loop_1955:
	tcc	%icc,	0x7
	fexpand	%f21,	%f0
	edge32ln	%o5,	%i7,	%l6
loop_1956:
	edge16	%g6,	%l4,	%g2
	bcc	%icc,	loop_1957
	fmovsn	%xcc,	%f5,	%f20
	set	0x1E, %l4
	ldsha	[%l7 + %l4] 0x80,	%o0
loop_1957:
	edge16l	%g1,	%l5,	%i6
	movge	%icc,	%l3,	%g3
	fexpand	%f17,	%f14
	nop
	setx	loop_1958,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%xcc,	%i1,	%g5
	fnand	%f20,	%f2,	%f16
	srax	%o1,	%l1,	%l2
loop_1958:
	udivx	%o2,	0x19A9,	%o6
	movrne	%i0,	0x2F9,	%g7
	wr	%g0,	0x80,	%asi
	stwa	%i2,	[%l7 + 0x48] %asi
	andcc	%o7,	%o3,	%o4
	fmovdg	%xcc,	%f26,	%f21
	bcs,a,pt	%icc,	loop_1959
	fsrc2	%f30,	%f16
	orncc	%i4,	%l0,	%g4
	bvc	%xcc,	loop_1960
loop_1959:
	brlz	%i3,	loop_1961
	movge	%xcc,	%o5,	%i5
	subcc	%i7,	0x1734,	%g6
loop_1960:
	srax	%l4,	0x06,	%l6
loop_1961:
	stx	%g2,	[%l7 + 0x10]
	brz,a	%g1,	loop_1962
	movge	%xcc,	%o0,	%i6
	sra	%l5,	0x19,	%g3
	fones	%f3
loop_1962:
	fmovs	%f4,	%f5
	bne,a,pt	%xcc,	loop_1963
	ldsw	[%l7 + 0x40],	%l3
	ta	%xcc,	0x3
	stb	%g5,	[%l7 + 0x4D]
loop_1963:
	nop
	setx loop_1964, %l0, %l1
	jmpl %l1, %i1
	nop
	fitos	%f8,	%f11
	fstox	%f11,	%f0
	tle	%icc,	0x1
	swap	[%l7 + 0x14],	%l1
loop_1964:
	tge	%icc,	0x6
	array8	%o1,	%o2,	%l2
	tneg	%icc,	0x6
	xnorcc	%o6,	0x04C3,	%g7
	movvs	%icc,	%i2,	%o7
	set	0x42, %g4
	lduha	[%l7 + %g4] 0x15,	%i0
	fmuld8ulx16	%f3,	%f22,	%f24
	for	%f22,	%f4,	%f18
	smul	%o3,	0x1DF2,	%o4
	orcc	%i4,	%l0,	%g4
	udiv	%i3,	0x1D01,	%i5
	sll	%o5,	0x1E,	%i7
	bleu,a	%icc,	loop_1965
	brgz,a	%l4,	loop_1966
	mova	%icc,	%g6,	%l6
	fxors	%f14,	%f19,	%f10
loop_1965:
	fcmpne16	%f24,	%f16,	%g1
loop_1966:
	tvc	%icc,	0x0
	sir	0x16C3
	array32	%g2,	%o0,	%l5
	nop
	setx	0x6673CADBBCE0854D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x721E2CE3F2B001CA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f14,	%f10
	set	0x14, %i5
	ldsha	[%l7 + %i5] 0x15,	%g3
	edge8n	%i6,	%g5,	%l3
	orn	%i1,	%l1,	%o1
	fpackfix	%f30,	%f25
	sllx	%l2,	%o2,	%g7
	movpos	%icc,	%i2,	%o6
	srax	%i0,	%o3,	%o4
	bpos,a,pn	%icc,	loop_1967
	srl	%o7,	0x13,	%i4
	fbne,a	%fcc1,	loop_1968
	fmuld8ulx16	%f31,	%f0,	%f18
loop_1967:
	fbul	%fcc1,	loop_1969
	movneg	%icc,	%l0,	%i3
loop_1968:
	movleu	%xcc,	%g4,	%o5
	fmovrdgz	%i5,	%f12,	%f6
loop_1969:
	sdivcc	%i7,	0x15BE,	%g6
	call	loop_1970
	ldd	[%l7 + 0x30],	%i6
	addccc	%l4,	%g1,	%g2
	fbug	%fcc0,	loop_1971
loop_1970:
	prefetch	[%l7 + 0x74],	 0x0
	fmovsvs	%icc,	%f0,	%f1
	fandnot1	%f26,	%f18,	%f28
loop_1971:
	movrgez	%o0,	0x2A8,	%l5
	smul	%g3,	%g5,	%l3
	tle	%xcc,	0x1
	andncc	%i6,	%l1,	%o1
	subcc	%i1,	0x182B,	%l2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x64] %asi,	%g7
	fbn	%fcc0,	loop_1972
	tvs	%icc,	0x1
	fblg	%fcc1,	loop_1973
	fmovs	%f1,	%f23
loop_1972:
	fbug	%fcc1,	loop_1974
	tg	%icc,	0x1
loop_1973:
	and	%o2,	%i2,	%i0
	stbar
loop_1974:
	movpos	%xcc,	%o3,	%o6
	movpos	%xcc,	%o4,	%i4
	brgez	%o7,	loop_1975
	srax	%l0,	%g4,	%i3
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i5
loop_1975:
	udiv	%o5,	0x1877,	%g6
	bvs,a	loop_1976
	xnorcc	%i7,	%l4,	%g1
	movcc	%icc,	%l6,	%o0
	set	0x2D, %i4
	stba	%l5,	[%l7 + %i4] 0x0c
loop_1976:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g2,	%g3
	nop
	setx	0xB877AE8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x015F9761,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f20,	%f22
	movge	%xcc,	%l3,	%i6
	movrgez	%l1,	%o1,	%i1
	movneg	%xcc,	%g5,	%l2
	edge8l	%o2,	%i2,	%g7
	fbuge	%fcc0,	loop_1977
	tne	%icc,	0x0
	movg	%xcc,	%i0,	%o3
	edge16n	%o6,	%o4,	%i4
loop_1977:
	taddcctv	%o7,	0x045B,	%g4
	movpos	%xcc,	%l0,	%i3
	tvs	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	stba	%o5,	[%l7 + 0x09] %asi
	udivcc	%i5,	0x0181,	%i7
	movvs	%icc,	%l4,	%g6
	movn	%xcc,	%g1,	%l6
	sub	%o0,	0x1815,	%l5
	tgu	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g2,	%l3,	%i6
	ba,a	loop_1978
	fnegd	%f22,	%f22
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
loop_1978:
	edge32l	%o1,	%g3,	%i1
	edge16	%g5,	%o2,	%l2
	fmovrde	%g7,	%f10,	%f24
	sdiv	%i0,	0x075F,	%i2
	array32	%o3,	%o6,	%i4
	ldsw	[%l7 + 0x28],	%o7
	movvc	%xcc,	%o4,	%g4
	flush	%l7 + 0x7C
	fbule	%fcc1,	loop_1979
	fnands	%f6,	%f0,	%f29
	fmovdpos	%icc,	%f19,	%f12
	ble,pt	%icc,	loop_1980
loop_1979:
	movg	%icc,	%l0,	%o5
	fmovsneg	%icc,	%f24,	%f28
	array8	%i3,	%i5,	%i7
loop_1980:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g6,	[%g0 + 0x170] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	or	%l4,	0x1749,	%l6
	alignaddr	%o0,	%l5,	%g1
	fble,a	%fcc0,	loop_1981
	tle	%xcc,	0x1
	popc	0x1EA6,	%g2
	fbne,a	%fcc0,	loop_1982
loop_1981:
	xor	%i6,	%l3,	%l1
	ble	loop_1983
	movrne	%g3,	%i1,	%g5
loop_1982:
	mulx	%o1,	%o2,	%g7
	ble,pt	%icc,	loop_1984
loop_1983:
	fcmpeq16	%f22,	%f30,	%i0
	srl	%i2,	0x1B,	%l2
	fba,a	%fcc1,	loop_1985
loop_1984:
	tleu	%xcc,	0x6
	bge,a	%icc,	loop_1986
	fsrc2s	%f26,	%f15
loop_1985:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o6
loop_1986:
	edge16n	%o3,	%o7,	%i4
	tg	%icc,	0x6
	wr	%g0,	0xeb,	%asi
	stwa	%g4,	[%l7 + 0x24] %asi
	membar	#Sync
	tsubcc	%o4,	0x02F9,	%l0
	fmul8x16au	%f18,	%f7,	%f24
	fors	%f7,	%f14,	%f10
	wr	%g0,	0xe3,	%asi
	stxa	%o5,	[%l7 + 0x60] %asi
	membar	#Sync
	set	0x28, %o2
	stxa	%i3,	[%l7 + %o2] 0x2b
	membar	#Sync
	umulcc	%i5,	%i7,	%l4
	umulcc	%g6,	0x10F1,	%o0
	orcc	%l6,	0x0A4C,	%l5
	fone	%f4
	stw	%g2,	[%l7 + 0x48]
	addcc	%i6,	%l3,	%l1
	fcmple16	%f12,	%f14,	%g1
	fpadd16s	%f0,	%f8,	%f15
	srl	%i1,	%g5,	%g3
	tvs	%xcc,	0x0
	edge16n	%o2,	%g7,	%i0
	tneg	%xcc,	0x2
	ldub	[%l7 + 0x1F],	%o1
	fba,a	%fcc0,	loop_1987
	umul	%l2,	0x15AE,	%i2
	fmovsge	%icc,	%f3,	%f3
	tl	%icc,	0x6
loop_1987:
	udivx	%o3,	0x0AD0,	%o6
	movg	%xcc,	%i4,	%g4
	taddcctv	%o4,	%l0,	%o7
	tneg	%icc,	0x4
	fmovdpos	%xcc,	%f19,	%f23
	orcc	%i3,	%o5,	%i7
	edge32ln	%l4,	%i5,	%o0
	sdiv	%g6,	0x0F35,	%l6
	orncc	%g2,	%l5,	%l3
	movvc	%icc,	%i6,	%g1
	fmovdvc	%icc,	%f13,	%f14
	edge8l	%l1,	%i1,	%g5
	edge8n	%g3,	%o2,	%i0
	movgu	%icc,	%g7,	%o1
	srax	%i2,	%o3,	%l2
	addc	%i4,	0x1345,	%o6
	or	%o4,	0x1DAF,	%g4
	fnands	%f1,	%f13,	%f4
	fmovsl	%xcc,	%f8,	%f17
	tpos	%xcc,	0x7
	udivcc	%l0,	0x1DAB,	%o7
	stb	%o5,	[%l7 + 0x41]
	add	%i3,	%i7,	%i5
	bleu,a	loop_1988
	sir	0x1AE7
	edge8	%l4,	%o0,	%l6
	udivcc	%g6,	0x0D2A,	%g2
loop_1988:
	tge	%xcc,	0x5
	fmovrsgez	%l3,	%f8,	%f30
	tvs	%xcc,	0x6
	array32	%i6,	%g1,	%l1
	orncc	%i1,	0x05DC,	%g5
	fmovrdne	%l5,	%f12,	%f6
	fbul,a	%fcc0,	loop_1989
	movcs	%xcc,	%g3,	%o2
	xor	%i0,	0x0813,	%o1
	xnorcc	%i2,	0x17C0,	%g7
loop_1989:
	alignaddrl	%l2,	%i4,	%o3
	fcmpgt32	%f28,	%f14,	%o6
	swap	[%l7 + 0x38],	%o4
	umul	%l0,	0x1ABE,	%g4
	andn	%o7,	%i3,	%o5
	bpos,pn	%xcc,	loop_1990
	fnegs	%f11,	%f18
	fcmple16	%f0,	%f18,	%i5
	movpos	%icc,	%i7,	%o0
loop_1990:
	tvc	%xcc,	0x3
	movre	%l4,	0x29D,	%l6
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%g2
	tcs	%xcc,	0x3
	movcc	%xcc,	%l3,	%g6
	subc	%g1,	%l1,	%i6
	fpackfix	%f16,	%f22
	tle	%xcc,	0x3
	movge	%xcc,	%i1,	%l5
	fbge	%fcc2,	loop_1991
	xorcc	%g3,	0x1B9C,	%o2
	umul	%g5,	%i0,	%i2
	set	0x12, %g7
	ldsha	[%l7 + %g7] 0x04,	%g7
loop_1991:
	tleu	%xcc,	0x3
	prefetch	[%l7 + 0x28],	 0x3
	sth	%l2,	[%l7 + 0x48]
	edge16n	%o1,	%o3,	%o6
	fbug	%fcc2,	loop_1992
	nop
	fitos	%f3,	%f12
	fstod	%f12,	%f12
	st	%f11,	[%l7 + 0x3C]
	nop
	setx	0x06B611DC7054BE29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_1992:
	bge,a	%xcc,	loop_1993
	udivx	%i4,	0x174A,	%o4
	bvc,a,pn	%icc,	loop_1994
	tsubcctv	%g4,	%l0,	%o7
loop_1993:
	alignaddrl	%o5,	%i3,	%i7
	fmovrslz	%i5,	%f15,	%f10
loop_1994:
	tcs	%xcc,	0x7
	nop
	setx	0x7271DF0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f13
	sdiv	%o0,	0x05AC,	%l4
	fmovrsgz	%l6,	%f21,	%f10
	for	%f8,	%f14,	%f26
	move	%xcc,	%l3,	%g6
	fnot1	%f16,	%f12
	movrne	%g2,	0x1B9,	%g1
	fmovrdgz	%i6,	%f14,	%f26
	orcc	%l1,	0x1171,	%i1
	brlez	%l5,	loop_1995
	ld	[%l7 + 0x60],	%f21
	tneg	%xcc,	0x3
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1995:
	tcc	%xcc,	0x5
	ta	%icc,	0x0
	fmovdl	%icc,	%f24,	%f0
	fmovrdne	%g3,	%f8,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_1996, %l0, %l1
	jmpl %l1, %g5
	movleu	%icc,	%i0,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g7,	0x040E,	%l2
loop_1996:
	fbo	%fcc1,	loop_1997
	subc	%o1,	%o2,	%o3
	fmovrse	%o6,	%f6,	%f11
	fbul,a	%fcc1,	loop_1998
loop_1997:
	srax	%i4,	%g4,	%o4
	tle	%xcc,	0x2
	addccc	%o7,	0x106C,	%l0
loop_1998:
	movg	%icc,	%i3,	%i7
	brz,a	%i5,	loop_1999
	fpadd16	%f2,	%f0,	%f12
	movleu	%icc,	%o5,	%o0
	orncc	%l6,	%l4,	%l3
loop_1999:
	udiv	%g2,	0x1532,	%g1
	ld	[%l7 + 0x54],	%f24
	alignaddrl	%g6,	%l1,	%i1
	bvs,a,pn	%icc,	loop_2000
	edge16	%i6,	%l5,	%g5
	tvs	%icc,	0x6
	subcc	%g3,	0x06F5,	%i2
loop_2000:
	sir	0x010A
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f12
	movrlz	%g7,	0x105,	%i0
	be	loop_2001
	sethi	0x116C,	%o1
	addcc	%l2,	%o2,	%o6
	movle	%icc,	%o3,	%g4
loop_2001:
	brz	%i4,	loop_2002
	subc	%o4,	0x191E,	%o7
	fbne	%fcc1,	loop_2003
	subc	%i3,	0x08AF,	%l0
loop_2002:
	add	%i5,	0x0B64,	%i7
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x15,	 0x2
loop_2003:
	popc	0x1856,	%l6
	tl	%xcc,	0x4
	movrne	%l4,	%o5,	%l3
	movvs	%icc,	%g2,	%g1
	fandnot2	%f24,	%f20,	%f10
	lduh	[%l7 + 0x0E],	%l1
	movge	%icc,	%g6,	%i1
	edge16n	%i6,	%l5,	%g5
	and	%i2,	%g7,	%i0
	tge	%icc,	0x6
	fmovsneg	%xcc,	%f23,	%f18
	nop
	fitos	%f12,	%f7
	fstox	%f7,	%f8
	tneg	%xcc,	0x6
	movcs	%icc,	%o1,	%l2
	xor	%o2,	0x118C,	%o6
	fandnot2	%f20,	%f8,	%f8
	movcs	%icc,	%o3,	%g4
	bg,a,pn	%xcc,	loop_2004
	nop
	fitos	%f30,	%f1
	sll	%g3,	%o4,	%o7
	udivcc	%i3,	0x140C,	%l0
loop_2004:
	fmuld8sux16	%f1,	%f4,	%f20
	ldsh	[%l7 + 0x2C],	%i5
	srlx	%i4,	0x0C,	%o0
	movl	%xcc,	%l6,	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i7,	%l3
	set	0x3B, %i1
	ldsba	[%l7 + %i1] 0x11,	%g2
	sdivcc	%g1,	0x087F,	%o5
	ldsh	[%l7 + 0x54],	%l1
	fnand	%f2,	%f26,	%f4
	edge16l	%g6,	%i6,	%l5
	fmovdpos	%xcc,	%f29,	%f17
	membar	0x5F
	nop
	setx	0xA2294BE062F5C997,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4BA9B8E3F45D1F21,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f4,	%f2
	nop
	setx	loop_2005,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f12,	%f24,	%f28
	movvc	%xcc,	%i1,	%g5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g7,	%i2
loop_2005:
	xor	%o1,	%l2,	%i0
	edge16	%o2,	%o6,	%o3
	movvc	%xcc,	%g4,	%g3
	bg,a,pn	%icc,	loop_2006
	srl	%o4,	%i3,	%l0
	smulcc	%i5,	%o7,	%i4
	udiv	%o0,	0x129C,	%l4
loop_2006:
	fnot2s	%f20,	%f12
	mulx	%i7,	%l6,	%g2
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	tsubcc	%l3,	0x1CD2,	%l1
	fors	%f26,	%f4,	%f9
	sra	%g6,	%i6,	%o5
	stbar
	fsrc1s	%f24,	%f14
	tcs	%xcc,	0x1
	be,pn	%xcc,	loop_2007
	mulscc	%l5,	0x1126,	%i1
	fcmple32	%f24,	%f10,	%g5
	movgu	%xcc,	%g7,	%o1
loop_2007:
	and	%l2,	%i2,	%i0
	stb	%o2,	[%l7 + 0x1B]
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%o6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x4C] %asi,	%o3
	nop
	setx	0x7AF630F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f28
	fandnot1s	%f12,	%f15,	%f8
	fandnot2	%f14,	%f8,	%f0
	fmovscs	%xcc,	%f14,	%f27
	edge16	%g4,	%o4,	%i3
	popc	0x08EB,	%l0
	ldsb	[%l7 + 0x4D],	%i5
	fmovrdgz	%o7,	%f22,	%f22
	alignaddr	%i4,	%g3,	%o0
	fnands	%f23,	%f4,	%f9
	mova	%xcc,	%l4,	%l6
	nop
	setx	0x7906B93E80937450,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x9ACC1469A7F7459D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f12,	%f26
	fpack32	%f16,	%f12,	%f0
	fnors	%f1,	%f24,	%f18
	sub	%i7,	0x1101,	%g1
	addcc	%g2,	0x0585,	%l1
	umul	%g6,	0x1818,	%i6
	sll	%o5,	0x18,	%l5
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tsubcctv	%i1,	0x061F,	%l3
	sdiv	%g7,	0x0B49,	%o1
	tvs	%icc,	0x2
	fbuge,a	%fcc1,	loop_2008
	fpsub32	%f24,	%f12,	%f30
	be,pn	%icc,	loop_2009
	subcc	%g5,	0x193E,	%i2
loop_2008:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f7,	%f25
loop_2009:
	xnor	%l2,	%i0,	%o6
	edge8n	%o2,	%o3,	%o4
	xnor	%g4,	%l0,	%i5
	movge	%icc,	%i3,	%o7
	movl	%icc,	%g3,	%i4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x68] %asi,	%o0
	fbg	%fcc0,	loop_2010
	te	%xcc,	0x4
	fxor	%f6,	%f24,	%f0
	orncc	%l6,	0x109B,	%l4
loop_2010:
	smul	%g1,	%i7,	%l1
	array32	%g6,	%i6,	%g2
	bl,pt	%xcc,	loop_2011
	alignaddr	%l5,	%i1,	%o5
	edge8l	%g7,	%l3,	%o1
	sdivcc	%g5,	0x1370,	%l2
loop_2011:
	lduw	[%l7 + 0x28],	%i2
	movrlz	%i0,	0x143,	%o2
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x04,	%f6
	fmovdgu	%xcc,	%f16,	%f12
	movrne	%o6,	0x339,	%o4
	umul	%g4,	%o3,	%l0
	movpos	%icc,	%i5,	%o7
	fornot1s	%f10,	%f17,	%f1
	movrlz	%i3,	%i4,	%g3
	fcmpgt16	%f26,	%f2,	%o0
	set	0x48, %l5
	ldswa	[%l7 + %l5] 0x14,	%l6
	edge32n	%g1,	%l4,	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i7,	%i6
	bcs	%xcc,	loop_2012
	subccc	%g2,	0x0762,	%l5
	edge16n	%g6,	%o5,	%i1
	fbul	%fcc0,	loop_2013
loop_2012:
	fpsub32	%f18,	%f6,	%f0
	movpos	%icc,	%g7,	%l3
	fpack16	%f22,	%f29
loop_2013:
	movvs	%icc,	%g5,	%l2
	movrgez	%o1,	%i0,	%o2
	tg	%xcc,	0x0
	te	%icc,	0x4
	wr	%g0,	0x2a,	%asi
	stwa	%i2,	[%l7 + 0x78] %asi
	membar	#Sync
	move	%xcc,	%o6,	%g4
	pdist	%f4,	%f30,	%f30
	fpadd16s	%f1,	%f5,	%f30
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x55] %asi,	%o4
	movn	%xcc,	%l0,	%i5
	bneg	loop_2014
	sub	%o3,	%i3,	%i4
	mulscc	%g3,	%o7,	%l6
	movg	%xcc,	%o0,	%l4
loop_2014:
	brz,a	%l1,	loop_2015
	fmovd	%f4,	%f0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x45] %asi,	%g1
loop_2015:
	fbug	%fcc0,	loop_2016
	sllx	%i6,	%i7,	%l5
	orncc	%g2,	%o5,	%g6
	xnor	%g7,	0x1225,	%i1
loop_2016:
	fmul8x16al	%f21,	%f18,	%f28
	sub	%l3,	0x0DF9,	%l2
	ldsw	[%l7 + 0x10],	%g5
	movcc	%xcc,	%o1,	%o2
	brlz	%i0,	loop_2017
	fmovdge	%xcc,	%f28,	%f5
	fbul,a	%fcc1,	loop_2018
	std	%f24,	[%l7 + 0x50]
loop_2017:
	fpsub16	%f6,	%f6,	%f24
	ble,a	%xcc,	loop_2019
loop_2018:
	fbule,a	%fcc2,	loop_2020
	tge	%xcc,	0x5
	fmovsleu	%icc,	%f4,	%f14
loop_2019:
	nop
	set	0x75, %i2
	ldub	[%l7 + %i2],	%i2
loop_2020:
	movrlz	%o6,	0x0A9,	%g4
	addc	%l0,	0x192B,	%o4
	edge32	%i5,	%i3,	%o3
	edge16	%g3,	%o7,	%l6
	nop
	setx	0xDB165EDFA4313E79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xFD49C4EE5DA0778E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f10,	%f28
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o0
	ba	%xcc,	loop_2021
	fpack16	%f26,	%f15
	movrlez	%i4,	0x1FE,	%l1
	sllx	%l4,	0x0C,	%g1
loop_2021:
	movpos	%icc,	%i6,	%i7
	movg	%icc,	%g2,	%l5
	bleu,a	%xcc,	loop_2022
	fcmpne16	%f18,	%f30,	%o5
	movgu	%icc,	%g6,	%g7
	alignaddr	%i1,	%l3,	%l2
loop_2022:
	ld	[%l7 + 0x40],	%f19
	nop
	setx	loop_2023,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlez	%g5,	0x360,	%o1
	edge8	%i0,	%i2,	%o6
	fbn	%fcc1,	loop_2024
loop_2023:
	nop
	set	0x24, %i7
	ldstub	[%l7 + %i7],	%g4
	movleu	%xcc,	%l0,	%o4
	fmovd	%f26,	%f2
loop_2024:
	fcmpgt16	%f0,	%f10,	%o2
	tsubcctv	%i3,	0x089B,	%i5
	fmovd	%f18,	%f26
	fpack16	%f8,	%f15
	fors	%f17,	%f5,	%f16
	bleu	loop_2025
	orcc	%g3,	0x038A,	%o7
	ldub	[%l7 + 0x4A],	%o3
	fxors	%f7,	%f28,	%f28
loop_2025:
	tgu	%icc,	0x4
	movge	%xcc,	%l6,	%o0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i4
	swap	[%l7 + 0x20],	%l4
	sra	%g1,	0x1F,	%l1
	edge8n	%i7,	%g2,	%l5
	xor	%i6,	0x0276,	%g6
	array16	%o5,	%i1,	%g7
	edge8	%l2,	%l3,	%o1
	movle	%xcc,	%g5,	%i2
	orncc	%i0,	0x1C1C,	%o6
	nop
	setx	0x40765C41,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	orcc	%g4,	0x0F04,	%l0
	taddcc	%o4,	%i3,	%o2
	fbul	%fcc0,	loop_2026
	mulx	%g3,	%o7,	%o3
	xnorcc	%l6,	0x0BD4,	%o0
	mova	%icc,	%i5,	%i4
loop_2026:
	edge8l	%g1,	%l1,	%i7
	bvc,a,pt	%xcc,	loop_2027
	nop
	fitod	%f8,	%f24
	fdtox	%f24,	%f4
	sir	0x029B
	stb	%g2,	[%l7 + 0x41]
loop_2027:
	fnors	%f6,	%f17,	%f24
	fmovdle	%xcc,	%f28,	%f0
	movcc	%xcc,	%l5,	%i6
	taddcctv	%l4,	0x0E07,	%g6
	fmovdcc	%icc,	%f24,	%f6
	fandnot1	%f18,	%f18,	%f8
	set	0x7C, %l2
	stwa	%i1,	[%l7 + %l2] 0x2a
	membar	#Sync
	udivx	%g7,	0x1BCB,	%o5
	andn	%l2,	%o1,	%l3
	nop
	fitos	%f1,	%f1
	fstod	%f1,	%f4
	edge8	%i2,	%g5,	%i0
	subccc	%g4,	0x1374,	%l0
	srl	%o6,	%i3,	%o4
	movne	%icc,	%o2,	%g3
	tcc	%icc,	0x2
	ta	%icc,	0x5
	add	%o3,	0x1FEA,	%l6
	array16	%o7,	%i5,	%o0
	fmovrslz	%g1,	%f29,	%f17
	set	0x38, %i6
	ldsba	[%l7 + %i6] 0x89,	%l1
	fmul8x16al	%f28,	%f28,	%f12
	orcc	%i7,	0x09C4,	%g2
	fcmple32	%f18,	%f24,	%l5
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brlz,a	%i4,	loop_2028
	movrgz	%i6,	%g6,	%l4
	edge8n	%i1,	%g7,	%o5
	sub	%l2,	%o1,	%i2
loop_2028:
	srlx	%g5,	0x13,	%i0
	andn	%g4,	0x0F31,	%l3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x18] %asi,	%o6
	fmovsg	%icc,	%f1,	%f24
	sir	0x1B79
	tl	%xcc,	0x5
	alignaddr	%i3,	%o4,	%l0
	nop
	fitos	%f1,	%f18
	fstox	%f18,	%f28
	fbo	%fcc0,	loop_2029
	sethi	0x10B1,	%o2
	tg	%xcc,	0x0
	udivcc	%o3,	0x0BA2,	%g3
loop_2029:
	edge16	%o7,	%l6,	%i5
	fbl	%fcc3,	loop_2030
	fmovdgu	%xcc,	%f2,	%f3
	fbg	%fcc0,	loop_2031
	bvc,a	%xcc,	loop_2032
loop_2030:
	bcc,pn	%icc,	loop_2033
	orncc	%g1,	0x0937,	%o0
loop_2031:
	bn,a,pn	%icc,	loop_2034
loop_2032:
	movre	%i7,	0x2BC,	%l1
loop_2033:
	nop
	setx	0x4A3FE6459AAC4F46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD61AC0EA9094F941,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f26,	%f10
	movpos	%icc,	%g2,	%l5
loop_2034:
	nop
	fitos	%f14,	%f25
	fstox	%f25,	%f4
	fxtos	%f4,	%f11
	addccc	%i4,	0x19FF,	%i6
	movne	%xcc,	%l4,	%g6
	fcmpne16	%f6,	%f24,	%g7
	fxors	%f13,	%f29,	%f23
	bl	%icc,	loop_2035
	nop
	setx	0xCCB06E2E259E0BB9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f16
	movg	%xcc,	%i1,	%l2
	srl	%o1,	%o5,	%g5
loop_2035:
	nop
	setx	0xD8AA0FA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xF48B91D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f27,	%f23
	std	%f30,	[%l7 + 0x30]
	addcc	%i2,	%g4,	%l3
	smulcc	%i0,	%i3,	%o4
	andcc	%l0,	0x1EC8,	%o6
	lduh	[%l7 + 0x1A],	%o3
	sll	%g3,	%o2,	%l6
	nop
	set	0x52, %g1
	sth	%i5,	[%l7 + %g1]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g1,	%o0,	%o7
	brz,a	%i7,	loop_2036
	popc	0x1A49,	%g2
	sth	%l1,	[%l7 + 0x22]
	ld	[%l7 + 0x38],	%f23
loop_2036:
	taddcctv	%l5,	%i6,	%l4
	bpos,pt	%xcc,	loop_2037
	xnor	%g6,	0x1ACC,	%g7
	bneg,a,pt	%icc,	loop_2038
	ldx	[%l7 + 0x08],	%i4
loop_2037:
	nop
	setx	0x2A42E937,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xAAEBF4BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f25,	%f13
	bvc	loop_2039
loop_2038:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l2,	%o1,	%o5
	orncc	%g5,	0x1B4C,	%i1
loop_2039:
	nop
	setx	loop_2040,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%i2,	0x2C6,	%g4
	sdiv	%i0,	0x1B4E,	%i3
	add	%o4,	%l0,	%o6
loop_2040:
	smulcc	%o3,	0x0F36,	%g3
	fmovsvs	%icc,	%f18,	%f10
	ldsw	[%l7 + 0x7C],	%o2
	bneg	loop_2041
	fmovdvs	%icc,	%f22,	%f1
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2041:
	fone	%f22
	fzero	%f10
	mulx	%l6,	%l3,	%g1
	tcc	%icc,	0x0
	std	%f22,	[%l7 + 0x20]
	tneg	%icc,	0x7
	andcc	%i5,	0x17E8,	%o0
	brlz,a	%i7,	loop_2042
	bcs	%icc,	loop_2043
	nop
	fitod	%f3,	%f20
	orn	%g2,	%l1,	%l5
loop_2042:
	udivx	%o7,	0x1577,	%i6
loop_2043:
	edge32l	%l4,	%g6,	%g7
	sll	%i4,	%l2,	%o1
	fandnot2s	%f21,	%f2,	%f0
	wr	%g0,	0x2a,	%asi
	stwa	%o5,	[%l7 + 0x28] %asi
	membar	#Sync
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g5
	addc	%i1,	0x1A4A,	%i2
	movcc	%icc,	%i0,	%g4
	fmovdcs	%xcc,	%f10,	%f26
	edge8n	%i3,	%o4,	%l0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	popc	0x0E2D,	%o6
	bshuffle	%f4,	%f20,	%f14
	addcc	%o3,	0x0F5F,	%g3
	srl	%o2,	0x10,	%l3
	sub	%g1,	%l6,	%i5
	fmovdpos	%icc,	%f16,	%f10
	nop
	setx	loop_2044,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%i7,	0x0130,	%o0
	tsubcc	%g2,	0x13B3,	%l1
	tpos	%xcc,	0x1
loop_2044:
	movgu	%icc,	%l5,	%i6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o7
	ld	[%l7 + 0x60],	%f7
	andn	%g6,	0x1EAF,	%g7
	nop
	setx	0xEDA5021D70413AE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	bl,a,pt	%icc,	loop_2045
	umulcc	%i4,	%l4,	%l2
	bg,a,pt	%xcc,	loop_2046
	fsrc2s	%f23,	%f12
loop_2045:
	srl	%o1,	0x11,	%o5
	tge	%icc,	0x7
loop_2046:
	ld	[%l7 + 0x7C],	%f3
	udivcc	%i1,	0x00B6,	%i2
	ldstub	[%l7 + 0x41],	%i0
	nop
	fitod	%f30,	%f18
	movvc	%xcc,	%g4,	%g5
	tvc	%icc,	0x2
	xnor	%o4,	%i3,	%l0
	set	0x63, %o6
	stba	%o3,	[%l7 + %o6] 0x2b
	membar	#Sync
	bge,a	loop_2047
	stx	%o6,	[%l7 + 0x08]
	sub	%o2,	0x1756,	%l3
	fzeros	%f9
loop_2047:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	movne	%xcc,	%g3,	%i5
	fpsub16s	%f14,	%f28,	%f15
	fxnor	%f30,	%f20,	%f28
	edge16n	%i7,	%l6,	%o0
	fmovde	%icc,	%f27,	%f12
	array16	%l1,	%l5,	%i6
	ldub	[%l7 + 0x75],	%g2
	nop
	fitod	%f10,	%f4
	fdtoi	%f4,	%f5
	sth	%g6,	[%l7 + 0x1E]
	edge16l	%g7,	%i4,	%o7
	fcmpeq16	%f2,	%f2,	%l2
	tsubcc	%l4,	0x1D06,	%o1
	smul	%o5,	0x0450,	%i1
	movrne	%i0,	%g4,	%g5
	ldsh	[%l7 + 0x1C],	%i2
	fcmpgt32	%f12,	%f12,	%o4
	set	0x5E, %g2
	stba	%i3,	[%l7 + %g2] 0x04
	nop
	fitod	%f24,	%f20
	edge8l	%l0,	%o6,	%o2
	movvc	%xcc,	%l3,	%o3
	movneg	%xcc,	%g1,	%g3
	add	%i5,	%l6,	%i7
	sdiv	%l1,	0x1463,	%o0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%i6
	ldd	[%l7 + 0x10],	%g2
	andcc	%l5,	%g6,	%g7
	fcmpne32	%f8,	%f6,	%i4
	orncc	%l2,	%l4,	%o7
	movre	%o5,	%i1,	%o1
	bcc,pt	%icc,	loop_2048
	fmovsa	%icc,	%f27,	%f16
	subc	%i0,	%g5,	%g4
	sll	%i2,	%o4,	%l0
loop_2048:
	fbule	%fcc2,	loop_2049
	addcc	%i3,	0x13C2,	%o6
	fmovsvs	%xcc,	%f28,	%f1
	array8	%o2,	%l3,	%o3
loop_2049:
	fmovscc	%icc,	%f0,	%f24
	edge8ln	%g3,	%i5,	%l6
	edge16	%i7,	%l1,	%o0
	swap	[%l7 + 0x4C],	%i6
	fexpand	%f1,	%f6
	array32	%g2,	%l5,	%g6
	nop
	setx	0xE35016C12E881526,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xED4D61E6CF09D754,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f18,	%f2
	edge8l	%g7,	%g1,	%i4
	membar	0x3A
	sir	0x15EF
	andn	%l2,	%l4,	%o5
	movrne	%o7,	0x167,	%i1
	fabss	%f10,	%f5
	movg	%icc,	%o1,	%i0
	movre	%g5,	%i2,	%g4
	addc	%o4,	0x0FF6,	%i3
	taddcc	%l0,	0x1E90,	%o6
	tvs	%xcc,	0x3
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x19,	%l3
	lduh	[%l7 + 0x38],	%o2
	fblg,a	%fcc0,	loop_2050
	movle	%icc,	%o3,	%g3
	nop
	set	0x7B, %o4
	ldub	[%l7 + %o4],	%l6
	set	0x70, %g6
	lda	[%l7 + %g6] 0x80,	%f24
loop_2050:
	xorcc	%i5,	0x15E3,	%i7
	movrne	%l1,	%i6,	%g2
	fxors	%f2,	%f17,	%f28
	edge32l	%l5,	%g6,	%g7
	faligndata	%f4,	%f10,	%f14
	fbl	%fcc1,	loop_2051
	edge32n	%o0,	%i4,	%g1
	fbge	%fcc3,	loop_2052
	nop
	setx	loop_2053,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2051:
	bvc,a,pn	%xcc,	loop_2054
	mulx	%l4,	0x0212,	%l2
loop_2052:
	movg	%icc,	%o7,	%o5
loop_2053:
	tn	%icc,	0x3
loop_2054:
	move	%xcc,	%o1,	%i0
	stbar
	sllx	%g5,	0x16,	%i1
	fnot1s	%f7,	%f15
	fbne	%fcc0,	loop_2055
	sllx	%g4,	0x1E,	%i2
	ldsb	[%l7 + 0x44],	%o4
	smulcc	%l0,	%i3,	%o6
loop_2055:
	fmovdne	%icc,	%f24,	%f5
	udiv	%o2,	0x0FD8,	%o3
	fmovsle	%icc,	%f2,	%f29
	smulcc	%l3,	0x1D40,	%l6
	orcc	%g3,	0x1EE0,	%i5
	ta	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x10] %asi
	fbg	%fcc0,	loop_2056
	smulcc	%i7,	%i6,	%l1
	mulscc	%g2,	0x137B,	%l5
	orn	%g7,	%o0,	%g6
loop_2056:
	fmul8sux16	%f24,	%f8,	%f30
	fpsub32	%f24,	%f26,	%f6
	fmovdgu	%xcc,	%f13,	%f10
	addcc	%g1,	%l4,	%l2
	fmovdgu	%xcc,	%f2,	%f17
	movneg	%icc,	%o7,	%i4
	call	loop_2057
	addcc	%o5,	0x1A5D,	%o1
	array8	%g5,	%i1,	%g4
	tne	%icc,	0x0
loop_2057:
	nop
	fitod	%f30,	%f18
	edge16	%i0,	%i2,	%l0
	movle	%icc,	%i3,	%o4
	fbuge,a	%fcc2,	loop_2058
	flush	%l7 + 0x10
	xnorcc	%o6,	0x0168,	%o2
	set	0x18, %l1
	stwa	%o3,	[%l7 + %l1] 0x80
loop_2058:
	prefetch	[%l7 + 0x5C],	 0x0
	edge16ln	%l3,	%l6,	%g3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	sdivcc	%i6,	0x1380,	%l1
	edge32n	%g2,	%i5,	%l5
	nop
	setx	0x30569333,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	brlez,a	%g7,	loop_2059
	movvs	%icc,	%g6,	%o0
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2059:
	nop
	set	0x18, %o0
	std	%f0,	[%l7 + %o0]
	fmovrsne	%g1,	%f6,	%f23
	tge	%icc,	0x0
	mulx	%l4,	%l2,	%o7
	udivx	%o5,	0x0A1E,	%o1
	wr	%g0,	0x21,	%asi
	stxa	%g5,	[%g0 + 0x110] %asi
	srl	%i1,	%g4,	%i4
	fzero	%f12
	movleu	%icc,	%i2,	%l0
	tvc	%xcc,	0x7
	fmovdge	%xcc,	%f6,	%f30
	tvs	%xcc,	0x4
	tl	%icc,	0x1
	udiv	%i0,	0x081C,	%o4
	tleu	%icc,	0x3
	te	%icc,	0x3
	nop
	setx	0xF24D9EDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xE7FA0528,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f17,	%f10
	addccc	%i3,	0x0785,	%o6
	array16	%o2,	%o3,	%l6
	movcc	%icc,	%g3,	%i7
	sethi	0x04FC,	%l3
	tsubcctv	%i6,	%l1,	%g2
	nop
	setx	0x786B733AB0F9A6A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x674FBEB946DA6360,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f10,	%f0
	brz	%l5,	loop_2060
	movpos	%xcc,	%i5,	%g6
	addcc	%g7,	0x192C,	%o0
	fandnot1s	%f4,	%f16,	%f19
loop_2060:
	taddcctv	%g1,	%l2,	%l4
	sdiv	%o7,	0x18A1,	%o5
	fbne,a	%fcc3,	loop_2061
	edge32	%o1,	%i1,	%g5
	mulx	%g4,	%i4,	%i2
	nop
	fitos	%f18,	%f3
loop_2061:
	fsrc2	%f28,	%f24
	fmovdleu	%icc,	%f15,	%f2
	movrgez	%l0,	%o4,	%i3
	sir	0x0AD0
	fmovrdgz	%i0,	%f12,	%f28
	sdiv	%o6,	0x0E6B,	%o3
	movcc	%icc,	%l6,	%g3
	movvc	%xcc,	%i7,	%o2
	tg	%icc,	0x2
	set	0x2C, %o1
	lduha	[%l7 + %o1] 0x19,	%i6
	fpsub16	%f6,	%f0,	%f26
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l1,	%l3
	udiv	%g2,	0x1362,	%l5
	taddcc	%g6,	%i5,	%o0
	fbule,a	%fcc1,	loop_2062
	fmovrslez	%g7,	%f16,	%f3
	edge8l	%g1,	%l2,	%o7
	edge8	%l4,	%o1,	%o5
loop_2062:
	addc	%g5,	0x0F5C,	%g4
	nop
	setx	0xE0ED8E0487773DAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x863E5CB6F9F73E8B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f2,	%f4
	fornot1s	%f4,	%f11,	%f13
	fbg,a	%fcc0,	loop_2063
	movle	%icc,	%i1,	%i4
	edge8l	%l0,	%i2,	%o4
	bne	%icc,	loop_2064
loop_2063:
	movre	%i0,	0x161,	%o6
	smul	%i3,	0x08F2,	%l6
	and	%o3,	0x17F1,	%i7
loop_2064:
	fpsub16	%f30,	%f30,	%f22
	edge16ln	%o2,	%i6,	%l1
	tn	%icc,	0x6
	fpsub16	%f28,	%f24,	%f2
	ld	[%l7 + 0x58],	%f18
	orncc	%g3,	%l3,	%l5
	tge	%xcc,	0x1
	movcc	%icc,	%g6,	%i5
	and	%g2,	0x1F26,	%o0
	fpack32	%f6,	%f2,	%f18
	brlz,a	%g7,	loop_2065
	movge	%xcc,	%l2,	%o7
	sub	%l4,	0x19C4,	%o1
	orncc	%g1,	0x0079,	%g5
loop_2065:
	fmul8x16	%f5,	%f18,	%f6
	fnands	%f21,	%f21,	%f15
	brnz	%g4,	loop_2066
	tsubcc	%o5,	%i4,	%i1
	brz,a	%l0,	loop_2067
	fbn	%fcc0,	loop_2068
loop_2066:
	sethi	0x1B1B,	%o4
	sdivcc	%i0,	0x1689,	%o6
loop_2067:
	sethi	0x0E15,	%i2
loop_2068:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%i3,	[%l7 + 0x1C] %asi
	movne	%icc,	%l6,	%i7
	and	%o2,	%i6,	%l1
	tsubcc	%o3,	%g3,	%l5
	alignaddr	%l3,	%i5,	%g6
	nop
	setx	0xA9550C0AAD83F2E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC8D0B0EF0C68C70B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f8,	%f30
	tg	%icc,	0x1
	fmovrslez	%g2,	%f14,	%f8
	mulx	%g7,	0x0D51,	%o0
	edge32	%l2,	%l4,	%o1
	movgu	%icc,	%o7,	%g5
	brnz	%g1,	loop_2069
	subccc	%g4,	%i4,	%i1
	movpos	%icc,	%l0,	%o5
	tl	%xcc,	0x7
loop_2069:
	movcc	%xcc,	%o4,	%o6
	tsubcc	%i0,	0x1885,	%i2
	and	%l6,	%i7,	%i3
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x19,	%f0
	srax	%o2,	0x02,	%l1
	nop
	setx	0x7055A6FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	orn	%o3,	0x1CC0,	%i6
	bn	loop_2070
	fbug	%fcc3,	loop_2071
	fpadd32	%f10,	%f22,	%f30
	movrlz	%l5,	%l3,	%g3
loop_2070:
	movrgz	%g6,	0x39C,	%i5
loop_2071:
	fmul8x16	%f16,	%f14,	%f22
	set	0x6C, %l6
	lduha	[%l7 + %l6] 0x11,	%g2
	edge32	%g7,	%l2,	%l4
	fors	%f5,	%f25,	%f0
	movg	%xcc,	%o1,	%o7
	tle	%icc,	0x2
	bn,a,pt	%icc,	loop_2072
	array8	%g5,	%g1,	%o0
	ldx	[%l7 + 0x58],	%g4
	lduw	[%l7 + 0x48],	%i1
loop_2072:
	umulcc	%l0,	0x0CB3,	%o5
	brnz	%i4,	loop_2073
	sub	%o4,	0x1099,	%i0
	fmovs	%f0,	%f0
	edge32	%o6,	%i2,	%l6
loop_2073:
	tle	%icc,	0x1
	movleu	%xcc,	%i7,	%i3
	tle	%xcc,	0x6
	edge16n	%o2,	%l1,	%i6
	fbl	%fcc0,	loop_2074
	taddcc	%l5,	%l3,	%o3
	te	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2074:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
	tgu	%xcc,	0x5
	fpadd32	%f12,	%f26,	%f14
	srl	%i5,	%g2,	%g7
	orn	%l2,	0x0AB4,	%l4
	wr	%g0,	0x81,	%asi
	stxa	%o1,	[%l7 + 0x08] %asi
	nop
	fitod	%f18,	%f16
	fornot1	%f12,	%f4,	%f6
	udivx	%o7,	0x1411,	%g5
	set	0x44, %g5
	lduha	[%l7 + %g5] 0x15,	%g3
	fmovscc	%icc,	%f1,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%o0,	%g1
	membar	0x63
	edge32n	%i1,	%g4,	%l0
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	tn	%icc,	0x4
	fmovd	%f30,	%f8
	fbl,a	%fcc2,	loop_2075
	fbo,a	%fcc1,	loop_2076
	bne,a,pn	%icc,	loop_2077
	membar	0x63
loop_2075:
	smul	%i4,	0x119B,	%o4
loop_2076:
	fmovsneg	%icc,	%f19,	%f2
loop_2077:
	nop
	set	0x30, %o5
	sta	%f7,	[%l7 + %o5] 0x18
	tne	%icc,	0x4
	edge32l	%i0,	%o6,	%l6
	movn	%xcc,	%i2,	%i7
	movre	%o2,	0x160,	%l1
	fornot1s	%f6,	%f11,	%f20
	set	0x60, %o3
	sta	%f26,	[%l7 + %o3] 0x18
	fzero	%f0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x7C] %asi,	%i6
	edge8ln	%l5,	%i3,	%o3
	orncc	%g6,	0x1F48,	%i5
	subcc	%g2,	0x0A74,	%l3
	smulcc	%g7,	%l4,	%o1
	fmovsgu	%xcc,	%f17,	%f11
	ldsh	[%l7 + 0x08],	%l2
	movleu	%icc,	%o7,	%g3
	fmul8x16al	%f13,	%f7,	%f26
	movrgez	%o0,	0x08F,	%g1
	fmovrslz	%i1,	%f28,	%f28
	srlx	%g5,	%l0,	%g4
	and	%o5,	0x1B33,	%o4
	fnot1s	%f4,	%f7
	sdivx	%i0,	0x02CC,	%o6
	fba	%fcc0,	loop_2078
	st	%f17,	[%l7 + 0x60]
	brlez	%l6,	loop_2079
	xorcc	%i4,	0x0056,	%i2
loop_2078:
	fmovsn	%xcc,	%f28,	%f18
	fbug	%fcc3,	loop_2080
loop_2079:
	ldx	[%l7 + 0x18],	%o2
	fbge,a	%fcc2,	loop_2081
	orncc	%l1,	%i6,	%l5
loop_2080:
	tcs	%xcc,	0x7
	movle	%icc,	%i3,	%o3
loop_2081:
	sub	%i7,	0x0B40,	%g6
	fsrc1	%f28,	%f28
	xor	%i5,	0x1439,	%l3
	movrlz	%g7,	0x1E0,	%l4
	sllx	%g2,	%o1,	%o7
	nop
	setx	0xCD19199D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x35C67F89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f10,	%f19
	movvc	%icc,	%l2,	%o0
	bn,pn	%icc,	loop_2082
	edge16ln	%g1,	%g3,	%i1
	sir	0x0A17
	nop
	setx	0xF5D41A6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x632BF8AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f0,	%f17
loop_2082:
	orncc	%l0,	0x0AD9,	%g5
	sub	%g4,	%o4,	%i0
	ldd	[%l7 + 0x68],	%f14
	addcc	%o6,	0x0F90,	%l6
	movle	%icc,	%o5,	%i4
	xorcc	%o2,	0x1C19,	%l1
	prefetch	[%l7 + 0x58],	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i6,	%i2,	%i3
	sdivcc	%o3,	0x0471,	%i7
	bleu	loop_2083
	fmovd	%f14,	%f8
	membar	0x74
	movrne	%l5,	%i5,	%l3
loop_2083:
	bg,a,pn	%icc,	loop_2084
	fandnot1	%f12,	%f22,	%f20
	lduw	[%l7 + 0x54],	%g6
	tcc	%icc,	0x0
loop_2084:
	movpos	%xcc,	%g7,	%g2
	tg	%icc,	0x3
	tcc	%xcc,	0x6
	andcc	%l4,	%o7,	%o1
	tcs	%xcc,	0x6
	addc	%o0,	%l2,	%g3
	smul	%i1,	0x1774,	%g1
	movle	%icc,	%l0,	%g4
	smulcc	%o4,	0x0001,	%i0
	ta	%icc,	0x2
	edge16	%g5,	%o6,	%o5
	movleu	%xcc,	%i4,	%o2
	nop
	setx	0x35A0CF5E0F365827,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xDFB8B9D183815201,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f0,	%f24
	tcc	%icc,	0x5
	add	%l6,	0x0ADF,	%l1
	addccc	%i2,	%i3,	%o3
	taddcc	%i7,	0x12B2,	%i6
	movrne	%l5,	0x177,	%i5
	udivx	%g6,	0x053A,	%g7
	srlx	%l3,	0x13,	%g2
	fnegs	%f12,	%f19
	nop
	setx	loop_2085,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x5
	taddcctv	%l4,	0x1957,	%o1
	fbne,a	%fcc1,	loop_2086
loop_2085:
	movne	%icc,	%o0,	%o7
	taddcc	%g3,	%l2,	%i1
	nop
	fitos	%f14,	%f26
	fstoi	%f26,	%f28
loop_2086:
	edge16	%g1,	%g4,	%l0
	fpadd16	%f4,	%f2,	%f12
	ble,a,pn	%icc,	loop_2087
	nop
	setx	loop_2088,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x04B7,	%o4
	or	%g5,	%o6,	%i0
loop_2087:
	tg	%xcc,	0x6
loop_2088:
	andn	%i4,	%o2,	%o5
	bneg,a	loop_2089
	tle	%xcc,	0x5
	edge8n	%l6,	%l1,	%i3
	lduh	[%l7 + 0x74],	%o3
loop_2089:
	sll	%i7,	0x0E,	%i2
	array8	%l5,	%i6,	%g6
	fmovsgu	%xcc,	%f8,	%f22
	nop
	setx	loop_2090,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduw	[%l7 + 0x14],	%g7
	fmovdg	%xcc,	%f21,	%f19
	movge	%icc,	%i5,	%g2
loop_2090:
	movl	%xcc,	%l3,	%l4
	edge16n	%o1,	%o0,	%o7
	fblg,a	%fcc1,	loop_2091
	fabsd	%f12,	%f26
	fmovdne	%icc,	%f18,	%f8
	movg	%xcc,	%g3,	%l2
loop_2091:
	tsubcc	%i1,	%g1,	%g4
	subcc	%l0,	%g5,	%o6
	array32	%o4,	%i0,	%i4
	fcmpne32	%f30,	%f0,	%o5
	fmovrdgez	%l6,	%f22,	%f8
	sethi	0x17BF,	%l1
	stw	%o2,	[%l7 + 0x58]
	andn	%o3,	%i3,	%i2
	sdivcc	%l5,	0x0753,	%i7
	tn	%xcc,	0x5
	fmul8x16	%f5,	%f22,	%f10
	mulscc	%g6,	0x093B,	%g7
	andcc	%i6,	%i5,	%l3
	fbne	%fcc0,	loop_2092
	stx	%g2,	[%l7 + 0x20]
	fbue	%fcc0,	loop_2093
	be,a,pt	%icc,	loop_2094
loop_2092:
	call	loop_2095
	movcc	%icc,	%l4,	%o0
loop_2093:
	tvs	%xcc,	0x1
loop_2094:
	movrne	%o7,	%o1,	%g3
loop_2095:
	edge32l	%l2,	%i1,	%g4
	movvs	%xcc,	%g1,	%g5
	movre	%o6,	0x341,	%l0
	xor	%i0,	%o4,	%i4
	xor	%o5,	0x16B9,	%l1
	fbe,a	%fcc2,	loop_2096
	fpsub32s	%f20,	%f31,	%f21
	fbule	%fcc0,	loop_2097
	edge8ln	%o2,	%l6,	%o3
loop_2096:
	nop
	wr	%g0,	0x10,	%asi
	stha	%i2,	[%l7 + 0x7C] %asi
loop_2097:
	nop
	setx	0x5060DFD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	subccc	%i3,	%l5,	%i7
	movge	%icc,	%g6,	%i6
	ble,pn	%xcc,	loop_2098
	brnz,a	%g7,	loop_2099
	brgz	%i5,	loop_2100
	fbe	%fcc2,	loop_2101
loop_2098:
	fmovdpos	%xcc,	%f15,	%f31
loop_2099:
	orn	%g2,	%l3,	%o0
loop_2100:
	fbule	%fcc0,	loop_2102
loop_2101:
	addc	%l4,	0x0979,	%o1
	sdiv	%g3,	0x0091,	%o7
	sllx	%i1,	0x14,	%g4
loop_2102:
	nop
	set	0x54, %l4
	lduwa	[%l7 + %l4] 0x04,	%l2
	ta	%icc,	0x1
	brlz,a	%g1,	loop_2103
	nop
	setx	0xB2391C45F775CE64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9179D116DD848E66,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f0,	%f2
	edge32	%o6,	%l0,	%i0
	fbuge	%fcc1,	loop_2104
loop_2103:
	sllx	%g5,	%i4,	%o5
	bl,a,pt	%xcc,	loop_2105
	alignaddr	%o4,	%l1,	%o2
loop_2104:
	bpos,a,pt	%xcc,	loop_2106
	movre	%l6,	0x2C1,	%i2
loop_2105:
	nop
	setx	0x1056BBD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	stw	%i3,	[%l7 + 0x0C]
loop_2106:
	tn	%icc,	0x6
	te	%icc,	0x5
	fpack32	%f14,	%f0,	%f18
	ldsh	[%l7 + 0x70],	%o3
	mulx	%i7,	0x1618,	%g6
	mulscc	%i6,	%l5,	%g7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x29] %asi,	%g2
	movgu	%icc,	%i5,	%o0
	edge8l	%l3,	%o1,	%l4
	tcc	%xcc,	0x3
	tvc	%xcc,	0x6
	movneg	%xcc,	%o7,	%g3
	subccc	%g4,	0x1DFC,	%l2
	fmovd	%f14,	%f0
	array8	%g1,	%i1,	%o6
	tvc	%icc,	0x6
	sll	%i0,	%g5,	%i4
	edge32ln	%o5,	%o4,	%l1
	fbo,a	%fcc0,	loop_2107
	fmovrse	%l0,	%f29,	%f4
	fnor	%f30,	%f20,	%f8
	stx	%o2,	[%l7 + 0x08]
loop_2107:
	fmovdn	%icc,	%f21,	%f12
	flush	%l7 + 0x68
	array32	%i2,	%i3,	%l6
	xorcc	%o3,	%g6,	%i7
	movrlz	%l5,	0x028,	%g7
	edge16	%i6,	%g2,	%o0
	brnz,a	%l3,	loop_2108
	movleu	%xcc,	%o1,	%l4
	fmovsvc	%xcc,	%f27,	%f13
	tsubcctv	%o7,	0x1C34,	%i5
loop_2108:
	sra	%g4,	0x05,	%l2
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge8n	%g1,	%i1,	%o6
	bvc	%icc,	loop_2109
	fcmpeq32	%f28,	%f22,	%i0
	fble,a	%fcc2,	loop_2110
	fmovsvc	%xcc,	%f10,	%f28
loop_2109:
	sub	%g3,	%g5,	%i4
	fbule	%fcc2,	loop_2111
loop_2110:
	fpadd32s	%f23,	%f0,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1095
loop_2111:
	movle	%xcc,	%o5,	%l1
	bcs,a	loop_2112
	bleu	loop_2113
	alignaddr	%l0,	%o2,	%i2
	fbule	%fcc0,	loop_2114
loop_2112:
	fmovscc	%xcc,	%f8,	%f13
loop_2113:
	movrgz	%o4,	%l6,	%o3
	prefetch	[%l7 + 0x1C],	 0x1
loop_2114:
	movneg	%xcc,	%g6,	%i7
	movcs	%xcc,	%i3,	%l5
	ldsw	[%l7 + 0x1C],	%i6
	udivcc	%g2,	0x1601,	%g7
	for	%f24,	%f20,	%f26
	fmovdcs	%icc,	%f14,	%f13
	movrlz	%l3,	%o0,	%l4
	fmovsn	%xcc,	%f12,	%f27
	fmovrdlz	%o1,	%f30,	%f22
	ldsb	[%l7 + 0x4A],	%o7
	stb	%g4,	[%l7 + 0x57]
	srl	%i5,	0x0B,	%g1
	nop
	fitos	%f23,	%f0
	movge	%xcc,	%l2,	%o6
	xnorcc	%i1,	0x02C6,	%g3
	fbug,a	%fcc0,	loop_2115
	fmovdne	%xcc,	%f23,	%f29
	fornot2	%f28,	%f20,	%f8
	fmovrdlez	%g5,	%f4,	%f28
loop_2115:
	nop
	set	0x18, %g4
	stba	%i4,	[%l7 + %g4] 0x15
	fsrc2s	%f0,	%f17
	tsubcc	%i0,	0x0F8C,	%o5
	fnand	%f22,	%f12,	%f16
	edge16	%l1,	%o2,	%l0
	tg	%icc,	0x1
	movle	%icc,	%o4,	%i2
	edge8ln	%o3,	%g6,	%i7
	tvs	%icc,	0x4
	fpadd32s	%f8,	%f16,	%f11
	orncc	%l6,	0x0B55,	%i3
	fmovrdne	%l5,	%f0,	%f22
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i6
	movne	%xcc,	%g2,	%l3
	fmuld8ulx16	%f3,	%f24,	%f20
	edge32	%o0,	%l4,	%g7
	tgu	%icc,	0x0
	mulx	%o7,	%g4,	%i5
	bl,a,pt	%icc,	loop_2116
	nop
	setx	0x30650959,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o1
loop_2116:
	bvs,pt	%icc,	loop_2117
	array32	%l2,	%g1,	%o6
	fmuld8ulx16	%f10,	%f15,	%f26
	fmovrse	%i1,	%f29,	%f22
loop_2117:
	ldx	[%l7 + 0x70],	%g3
	array8	%g5,	%i4,	%i0
	fmovrdgz	%l1,	%f12,	%f2
	udivx	%o5,	0x17EC,	%o2
	tn	%xcc,	0x3
	fmovse	%icc,	%f17,	%f12
	nop
	setx	0x9BE3A9852F11E41F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE0CA914075EDD09C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f16,	%f26
	fmovsl	%xcc,	%f29,	%f9
	fble,a	%fcc1,	loop_2118
	udivx	%l0,	0x0BA2,	%i2
	fbge,a	%fcc3,	loop_2119
	call	loop_2120
loop_2118:
	orcc	%o4,	0x184F,	%g6
	fmovscs	%icc,	%f15,	%f7
loop_2119:
	nop
	set	0x72, %i5
	lduh	[%l7 + %i5],	%o3
loop_2120:
	sdivcc	%l6,	0x1072,	%i3
	nop
	set	0x40, %i4
	ldstub	[%l7 + %i4],	%l5
	taddcctv	%i6,	0x1966,	%i7
	fxnors	%f1,	%f20,	%f7
	addcc	%l3,	0x19AA,	%g2
	fnand	%f14,	%f8,	%f14
	set	0x1A, %o2
	lduha	[%l7 + %o2] 0x04,	%o0
	sethi	0x0F31,	%l4
	fcmple32	%f14,	%f24,	%o7
	membar	0x37
	brgz	%g7,	loop_2121
	fone	%f0
	sub	%g4,	%i5,	%o1
	umul	%l2,	0x0FE4,	%g1
loop_2121:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	subccc	%o6,	0x0064,	%g5
	edge16l	%g3,	%i0,	%l1
	fmovdvs	%xcc,	%f26,	%f7
	move	%xcc,	%o5,	%o2
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%l0
	fmovse	%xcc,	%f4,	%f28
	xnorcc	%i2,	%i4,	%g6
	movrgz	%o4,	0x0BB,	%o3
	bvs,a	loop_2122
	tvs	%xcc,	0x3
	fsrc1s	%f29,	%f24
	fxors	%f8,	%f3,	%f5
loop_2122:
	movvs	%xcc,	%i3,	%l6
	fnors	%f23,	%f12,	%f16
	fmovsgu	%icc,	%f10,	%f26
	fmovdleu	%icc,	%f22,	%f0
	bvc	loop_2123
	ble,a	%icc,	loop_2124
	andncc	%l5,	%i6,	%l3
	te	%xcc,	0x5
loop_2123:
	edge32n	%g2,	%i7,	%l4
loop_2124:
	fandnot1	%f4,	%f24,	%f4
	bgu,a,pt	%icc,	loop_2125
	xorcc	%o0,	%o7,	%g7
	fmovse	%xcc,	%f4,	%f2
	stb	%i5,	[%l7 + 0x15]
loop_2125:
	sdivx	%g4,	0x1C66,	%o1
	orncc	%l2,	0x01F4,	%i1
	bpos,a	%xcc,	loop_2126
	fmovd	%f0,	%f30
	orn	%g1,	%o6,	%g3
	lduw	[%l7 + 0x20],	%g5
loop_2126:
	fxnors	%f15,	%f14,	%f9
	edge32n	%i0,	%o5,	%o2
	tneg	%icc,	0x3
	sdivcc	%l0,	0x0F3D,	%i2
	edge16	%l1,	%i4,	%g6
	mulx	%o3,	0x10B5,	%i3
	tne	%xcc,	0x7
	fandnot2	%f4,	%f20,	%f14
	sra	%o4,	%l5,	%l6
	fpmerge	%f20,	%f5,	%f0
	fmovsn	%icc,	%f27,	%f6
	subc	%i6,	%g2,	%i7
	edge8	%l3,	%l4,	%o7
	bgu	%icc,	loop_2127
	ta	%icc,	0x6
	udiv	%g7,	0x1ED6,	%o0
	stx	%g4,	[%l7 + 0x20]
loop_2127:
	fbul	%fcc1,	loop_2128
	fandnot1	%f6,	%f12,	%f8
	taddcctv	%o1,	0x0611,	%l2
	udivcc	%i5,	0x15C5,	%i1
loop_2128:
	ldd	[%l7 + 0x70],	%o6
	ldd	[%l7 + 0x78],	%f16
	fmovdleu	%icc,	%f14,	%f29
	brgez,a	%g1,	loop_2129
	array8	%g5,	%g3,	%o5
	pdist	%f12,	%f2,	%f18
	taddcc	%o2,	0x10A1,	%l0
loop_2129:
	tvc	%icc,	0x7
	movre	%i0,	0x0BE,	%i2
	tvc	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	setx loop_2130, %l0, %l1
	jmpl %l1, %i4
	movl	%icc,	%l1,	%g6
	smul	%o3,	%i3,	%l5
	movgu	%icc,	%o4,	%l6
loop_2130:
	fxor	%f12,	%f0,	%f22
	srlx	%i6,	%g2,	%l3
	srax	%l4,	0x0D,	%i7
	bcs,pn	%xcc,	loop_2131
	movrgz	%g7,	%o0,	%g4
	orncc	%o1,	%o7,	%i5
	fsrc2	%f0,	%f2
loop_2131:
	fornot2	%f18,	%f16,	%f18
	lduw	[%l7 + 0x60],	%l2
	movleu	%xcc,	%i1,	%o6
	movcc	%icc,	%g1,	%g3
	tpos	%xcc,	0x7
	ld	[%l7 + 0x1C],	%f8
	fpackfix	%f14,	%f17
	subcc	%o5,	%o2,	%l0
	fcmpne32	%f14,	%f20,	%i0
	sub	%g5,	%i4,	%l1
	fandnot2s	%f10,	%f4,	%f30
	brgez,a	%g6,	loop_2132
	tl	%icc,	0x5
	tpos	%xcc,	0x7
	srl	%o3,	%i2,	%l5
loop_2132:
	movre	%o4,	%l6,	%i3
	sdivx	%g2,	0x0694,	%l3
	fmovdcc	%xcc,	%f16,	%f13
	edge8ln	%i6,	%l4,	%g7
	be	loop_2133
	fbl	%fcc0,	loop_2134
	subcc	%o0,	0x0BCA,	%i7
	fmovrdlez	%o1,	%f4,	%f0
loop_2133:
	ldx	[%l7 + 0x68],	%g4
loop_2134:
	nop
	set	0x50, %l0
	stwa	%o7,	[%l7 + %l0] 0x88
	movrlz	%l2,	0x3D8,	%i5
	te	%xcc,	0x1
	mulx	%o6,	%g1,	%i1
	sdivx	%g3,	0x08BE,	%o5
	st	%f17,	[%l7 + 0x70]
	ldd	[%l7 + 0x38],	%f24
	movneg	%icc,	%o2,	%i0
	smul	%l0,	%g5,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%o3
	tpos	%icc,	0x4
	movleu	%xcc,	%i2,	%i4
	sub	%l5,	0x1B9F,	%o4
	fmovrdgz	%l6,	%f16,	%f0
	fbul	%fcc0,	loop_2135
	sub	%g2,	%i3,	%i6
	edge32ln	%l4,	%g7,	%l3
	srl	%o0,	0x17,	%o1
loop_2135:
	array16	%i7,	%g4,	%o7
	ldub	[%l7 + 0x58],	%i5
	array16	%o6,	%l2,	%i1
	sdiv	%g3,	0x0B15,	%g1
	subcc	%o5,	%i0,	%o2
	tle	%icc,	0x7
	umul	%g5,	%l0,	%g6
	nop
	setx	0x701674E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xEB3235FB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f30,	%f2
	orncc	%o3,	%l1,	%i4
	fmovrdlz	%i2,	%f20,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l5,	%l6,	%g2
	tneg	%xcc,	0x3
	movrgz	%o4,	0x09E,	%i3
	movneg	%xcc,	%i6,	%g7
	fmul8ulx16	%f14,	%f0,	%f18
	set	0x24, %l3
	ldswa	[%l7 + %l3] 0x15,	%l4
	movrgz	%o0,	0x2FB,	%o1
	xor	%l3,	0x02DD,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o7
	fbu	%fcc2,	loop_2136
	brz	%o6,	loop_2137
	sll	%l2,	0x12,	%i5
	fnegs	%f8,	%f5
loop_2136:
	nop
	setx loop_2138, %l0, %l1
	jmpl %l1, %g3
loop_2137:
	fbl	%fcc1,	loop_2139
	edge8ln	%i1,	%o5,	%g1
	udivx	%o2,	0x00F8,	%g5
loop_2138:
	stb	%l0,	[%l7 + 0x4F]
loop_2139:
	fabsd	%f4,	%f20
	bneg	loop_2140
	sdivx	%g6,	0x0F18,	%i0
	movneg	%icc,	%l1,	%i4
	alignaddrl	%i2,	%l5,	%o3
loop_2140:
	movre	%l6,	0x312,	%o4
	fpadd32s	%f29,	%f13,	%f3
	movpos	%icc,	%i3,	%g2
	nop
	fitos	%f0,	%f4
	fstoi	%f4,	%f2
	fbo	%fcc2,	loop_2141
	edge8ln	%g7,	%i6,	%l4
	fcmpne32	%f14,	%f4,	%o1
	fmovdleu	%icc,	%f22,	%f8
loop_2141:
	ld	[%l7 + 0x14],	%f6
	fpmerge	%f16,	%f14,	%f8
	array16	%o0,	%g4,	%l3
	fcmple32	%f26,	%f28,	%o7
	tl	%icc,	0x4
	sll	%i7,	0x05,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o6,	[%l7 + 0x40]
	fexpand	%f5,	%f30
	movne	%xcc,	%g3,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x2
	te	%icc,	0x2
	udiv	%i5,	0x1B42,	%g1
	tleu	%icc,	0x0
	bl,a	loop_2142
	st	%f30,	[%l7 + 0x70]
	edge8l	%o5,	%g5,	%l0
	fnot2s	%f22,	%f14
loop_2142:
	tg	%icc,	0x4
	movl	%icc,	%o2,	%i0
	fmovrse	%g6,	%f18,	%f20
	edge16	%i4,	%i2,	%l1
	ldsb	[%l7 + 0x7D],	%o3
	movvs	%icc,	%l5,	%l6
	xnorcc	%i3,	%o4,	%g2
	orncc	%g7,	%i6,	%l4
	fmovdneg	%xcc,	%f19,	%f29
	nop
	fitos	%f5,	%f3
	fstod	%f3,	%f14
	sra	%o1,	%g4,	%o0
	smulcc	%l3,	0x06C9,	%o7
	movge	%xcc,	%i7,	%l2
	edge8n	%o6,	%g3,	%i1
	taddcctv	%i5,	0x06FD,	%o5
	fbn,a	%fcc0,	loop_2143
	fmovrsne	%g1,	%f7,	%f23
	mulx	%g5,	%l0,	%i0
	and	%o2,	0x1926,	%i4
loop_2143:
	ble,a	%xcc,	loop_2144
	nop
	setx	loop_2145,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%xcc,	0x1
	tl	%xcc,	0x4
loop_2144:
	tneg	%xcc,	0x4
loop_2145:
	fmovrslez	%i2,	%f20,	%f18
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x81,	%l0
	sub	%o3,	0x01DB,	%l5
	edge32n	%g6,	%i3,	%l6
	movgu	%xcc,	%o4,	%g2
	movre	%g7,	0x06D,	%l4
	membar	0x17
	fcmpgt32	%f0,	%f30,	%o1
	set	0x43, %g7
	ldstuba	[%l7 + %g7] 0x81,	%i6
	brnz,a	%o0,	loop_2146
	xorcc	%l3,	0x1592,	%o7
	movge	%icc,	%i7,	%l2
	edge16	%o6,	%g4,	%g3
loop_2146:
	ldd	[%l7 + 0x48],	%f14
	movvc	%xcc,	%i5,	%o5
	nop
	setx	loop_2147,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%i1,	%g5,	%l0
	tcc	%icc,	0x5
	edge16n	%g1,	%o2,	%i4
loop_2147:
	fbo	%fcc0,	loop_2148
	udiv	%i0,	0x1A1B,	%l1
	movle	%icc,	%i2,	%l5
	brlez,a	%g6,	loop_2149
loop_2148:
	bvs	loop_2150
	fbl,a	%fcc3,	loop_2151
	xnor	%i3,	0x065A,	%o3
loop_2149:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g2
loop_2150:
	tvs	%xcc,	0x4
loop_2151:
	fmovse	%xcc,	%f27,	%f11
	fbug,a	%fcc3,	loop_2152
	array32	%g7,	%l6,	%l4
	fmovrdne	%i6,	%f30,	%f16
	be,pt	%xcc,	loop_2153
loop_2152:
	tpos	%icc,	0x3
	alignaddr	%o0,	%o1,	%o7
	fcmpeq16	%f10,	%f12,	%i7
loop_2153:
	andncc	%l3,	%o6,	%g4
	fmovrde	%l2,	%f2,	%f4
	fxnors	%f28,	%f19,	%f22
	fmul8sux16	%f2,	%f26,	%f8
	fxor	%f14,	%f4,	%f20
	fcmple32	%f12,	%f28,	%i5
	sll	%o5,	%i1,	%g3
	fbge,a	%fcc0,	loop_2154
	umul	%l0,	%g1,	%o2
	edge32	%g5,	%i4,	%l1
	fxor	%f30,	%f26,	%f0
loop_2154:
	movrne	%i0,	0x0A4,	%i2
	brnz,a	%l5,	loop_2155
	fornot1s	%f28,	%f26,	%f8
	tg	%xcc,	0x4
	flush	%l7 + 0x3C
loop_2155:
	xorcc	%g6,	%o3,	%o4
	fbge,a	%fcc0,	loop_2156
	membar	0x6B
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g2,	%i3
loop_2156:
	tg	%xcc,	0x4
	sll	%l6,	0x0A,	%g7
	movn	%xcc,	%i6,	%l4
	tvs	%icc,	0x6
	nop
	setx	loop_2157,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o1,	%o0,	%o7
	tge	%xcc,	0x1
	fbn	%fcc2,	loop_2158
loop_2157:
	fbe,a	%fcc3,	loop_2159
	sir	0x0392
	edge16l	%i7,	%l3,	%g4
loop_2158:
	subc	%l2,	%o6,	%o5
loop_2159:
	fbo,a	%fcc0,	loop_2160
	or	%i1,	0x1F9F,	%g3
	umul	%i5,	0x047C,	%l0
	edge8ln	%o2,	%g5,	%i4
loop_2160:
	fbge	%fcc0,	loop_2161
	addcc	%g1,	%l1,	%i0
	ldsw	[%l7 + 0x28],	%l5
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f6
loop_2161:
	fble	%fcc2,	loop_2162
	fbo,a	%fcc2,	loop_2163
	nop
	fitod	%f15,	%f28
	ldsh	[%l7 + 0x5A],	%g6
loop_2162:
	movrlz	%i2,	0x22E,	%o3
loop_2163:
	stw	%o4,	[%l7 + 0x6C]
	fmovrdgez	%g2,	%f6,	%f0
	taddcctv	%l6,	%i3,	%g7
	edge16l	%i6,	%o1,	%o0
	fmovrslz	%l4,	%f25,	%f31
	stx	%o7,	[%l7 + 0x68]
	xorcc	%i7,	0x1CA3,	%g4
	taddcctv	%l3,	%o6,	%l2
	fornot2	%f16,	%f4,	%f22
	smulcc	%i1,	0x1165,	%g3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	stx	%l0,	[%l7 + 0x20]
	ta	%icc,	0x3
	movle	%xcc,	%o2,	%o5
	mulx	%g5,	0x0DD7,	%i4
	array32	%l1,	%g1,	%l5
	movcc	%icc,	%i0,	%i2
	movg	%icc,	%o3,	%g6
	fmovda	%xcc,	%f17,	%f4
	set	0x3C, %g3
	lduwa	[%l7 + %g3] 0x04,	%o4
	udivx	%g2,	0x0404,	%i3
	wr	%g0,	0xe3,	%asi
	stxa	%g7,	[%l7 + 0x10] %asi
	membar	#Sync
	tg	%icc,	0x1
	srax	%l6,	0x19,	%i6
	te	%xcc,	0x2
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f4
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x04,	 0x0
	addc	%l4,	0x1873,	%o7
	fbge,a	%fcc2,	loop_2164
	fornot2s	%f10,	%f19,	%f3
	sir	0x11EA
	nop
	setx	0x390485743891BDB1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f10
loop_2164:
	edge16l	%i7,	%g4,	%o1
	taddcctv	%o6,	0x19D5,	%l2
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f8
	fpsub32	%f2,	%f20,	%f26
	movge	%icc,	%i1,	%g3
	srax	%i5,	0x0F,	%l3
	fpadd16s	%f15,	%f5,	%f19
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	fble	%fcc1,	loop_2165
	edge8ln	%o5,	%l0,	%g5
	add	%i4,	0x055C,	%g1
	fmovrslez	%l1,	%f0,	%f30
loop_2165:
	subc	%i0,	0x04D8,	%i2
	xor	%o3,	%g6,	%l5
	tgu	%icc,	0x1
	sll	%o4,	%g2,	%i3
	membar	0x75
	fblg,a	%fcc1,	loop_2166
	bge	%icc,	loop_2167
	brgz,a	%l6,	loop_2168
	fcmple32	%f24,	%f2,	%i6
loop_2166:
	udivx	%g7,	0x09C1,	%o0
loop_2167:
	fnot1	%f22,	%f26
loop_2168:
	swap	[%l7 + 0x78],	%l4
	addcc	%i7,	%g4,	%o7
	sir	0x09DD
	array16	%o1,	%l2,	%o6
	edge16	%g3,	%i5,	%i1
	membar	0x14
	movneg	%xcc,	%l3,	%o5
	fcmpeq16	%f20,	%f20,	%l0
	fones	%f22
	fmovsne	%xcc,	%f9,	%f19
	ld	[%l7 + 0x48],	%f8
	fmovdn	%icc,	%f31,	%f21
	or	%g5,	%o2,	%i4
	movgu	%xcc,	%g1,	%l1
	edge32	%i2,	%i0,	%g6
	move	%icc,	%l5,	%o4
	ba,a	%icc,	loop_2169
	xor	%o3,	0x0A0F,	%i3
	umul	%l6,	0x0007,	%g2
	movrgez	%i6,	%g7,	%o0
loop_2169:
	nop
	set	0x34, %i2
	lduba	[%l7 + %i2] 0x19,	%i7
	tcc	%xcc,	0x6
	movg	%icc,	%l4,	%g4
	movrlez	%o1,	0x1EC,	%l2
	movpos	%xcc,	%o7,	%g3
	ba,a	loop_2170
	tg	%xcc,	0x3
	sir	0x0FCD
	xor	%o6,	%i1,	%i5
loop_2170:
	orncc	%l3,	0x0881,	%l0
	ble,a,pt	%icc,	loop_2171
	tl	%xcc,	0x7
	movleu	%xcc,	%g5,	%o5
	alignaddrl	%i4,	%g1,	%l1
loop_2171:
	movcs	%xcc,	%o2,	%i0
	edge16n	%g6,	%i2,	%o4
	edge32	%o3,	%i3,	%l5
	fandnot2s	%f22,	%f8,	%f13
	ldsh	[%l7 + 0x1E],	%l6
	orcc	%g2,	%i6,	%o0
	movrne	%i7,	0x0B7,	%l4
	movcs	%icc,	%g7,	%o1
	movre	%g4,	%o7,	%g3
	set	0x54, %i7
	ldswa	[%l7 + %i7] 0x81,	%l2
	xor	%i1,	0x0C6C,	%o6
	fbge	%fcc0,	loop_2172
	sdivx	%l3,	0x0B6F,	%i5
	movge	%xcc,	%g5,	%o5
	set	0x77, %l2
	ldsba	[%l7 + %l2] 0x15,	%l0
loop_2172:
	fcmple32	%f26,	%f4,	%i4
	umulcc	%l1,	%o2,	%i0
	edge8	%g6,	%g1,	%o4
	bg,a,pt	%icc,	loop_2173
	fmovsle	%icc,	%f26,	%f5
	edge8n	%i2,	%i3,	%o3
	fexpand	%f31,	%f12
loop_2173:
	fmovsleu	%xcc,	%f28,	%f3
	movvs	%icc,	%l5,	%g2
	fmovda	%icc,	%f13,	%f4
	edge32n	%l6,	%o0,	%i6
	brz	%l4,	loop_2174
	edge32	%g7,	%i7,	%g4
	sdivx	%o7,	0x00D2,	%o1
	sllx	%l2,	%g3,	%o6
loop_2174:
	stx	%l3,	[%l7 + 0x68]
	and	%i1,	%i5,	%o5
	brgz,a	%l0,	loop_2175
	addc	%i4,	%g5,	%l1
	andn	%i0,	%g6,	%g1
	movleu	%xcc,	%o2,	%i2
loop_2175:
	tpos	%xcc,	0x2
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	movrgez	%o4,	%l5,	%o3
	sdivx	%g2,	0x061C,	%l6
	brz	%o0,	loop_2176
	tgu	%icc,	0x0
	movn	%xcc,	%i6,	%g7
	nop
	setx	0xE9B7D021,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x19A2B80D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f23,	%f30
loop_2176:
	udiv	%l4,	0x18BD,	%i7
	udivx	%o7,	0x0BFB,	%o1
	pdist	%f22,	%f12,	%f18
	movleu	%xcc,	%g4,	%l2
	srlx	%o6,	%l3,	%i1
	tg	%icc,	0x5
	fmovsneg	%xcc,	%f15,	%f23
	set	0x0E, %i6
	ldsba	[%l7 + %i6] 0x19,	%g3
	fornot1	%f4,	%f10,	%f16
	set	0x4D, %l5
	lduba	[%l7 + %l5] 0x14,	%o5
	sethi	0x0A12,	%l0
	udivx	%i4,	0x187A,	%g5
	set	0x48, %g1
	lduwa	[%l7 + %g1] 0x04,	%i5
	sra	%l1,	0x1E,	%g6
	fnot1	%f12,	%f4
	udivcc	%i0,	0x08B8,	%g1
	edge8l	%o2,	%i3,	%i2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%o3
	call	loop_2177
	fble	%fcc3,	loop_2178
	movcc	%icc,	%g2,	%l6
	bleu,pn	%xcc,	loop_2179
loop_2177:
	sethi	0x04D3,	%l5
loop_2178:
	ta	%icc,	0x5
	fcmpeq16	%f10,	%f6,	%i6
loop_2179:
	movrlez	%o0,	%g7,	%i7
	tcc	%xcc,	0x1
	movrne	%l4,	0x1EA,	%o7
	fones	%f17
	movrgez	%g4,	%o1,	%l2
	andcc	%l3,	0x1251,	%i1
	nop
	fitos	%f14,	%f1
	fstox	%f1,	%f4
	fxtos	%f4,	%f19
	movcs	%xcc,	%g3,	%o6
	fble,a	%fcc2,	loop_2180
	ba,a,pt	%icc,	loop_2181
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o5,	%i4,	%l0
loop_2180:
	edge16n	%g5,	%i5,	%l1
loop_2181:
	fmovrdlz	%i0,	%f30,	%f6
	udivx	%g1,	0x0CB3,	%g6
	mova	%xcc,	%i3,	%o2
	srax	%i2,	0x0E,	%o3
	movrne	%o4,	0x35A,	%g2
	fbug,a	%fcc3,	loop_2182
	movne	%icc,	%l6,	%l5
	bneg	%xcc,	loop_2183
	fmovdne	%icc,	%f8,	%f19
loop_2182:
	umul	%o0,	%i6,	%g7
	set	0x64, %o6
	ldsha	[%l7 + %o6] 0x88,	%l4
loop_2183:
	movrlz	%o7,	0x194,	%i7
	movrlz	%o1,	0x059,	%l2
	tg	%xcc,	0x1
	mulx	%l3,	0x02C0,	%i1
	sra	%g3,	0x0D,	%g4
	movre	%o5,	0x252,	%o6
	fmovdpos	%xcc,	%f7,	%f31
	fmovrdlez	%l0,	%f10,	%f8
	udivcc	%g5,	0x1D20,	%i5
	fandnot1s	%f22,	%f21,	%f28
	set	0x3C, %i3
	lduwa	[%l7 + %i3] 0x89,	%l1
	addcc	%i4,	%g1,	%g6
	movleu	%xcc,	%i0,	%i3
	fpadd16	%f22,	%f26,	%f22
	udivx	%i2,	0x13BA,	%o3
	fmovsneg	%xcc,	%f28,	%f8
	fmovsg	%xcc,	%f28,	%f23
	sll	%o4,	%o2,	%l6
	fmovsne	%xcc,	%f6,	%f27
	udivx	%g2,	0x1D33,	%o0
	bvc,pt	%icc,	loop_2184
	subccc	%l5,	0x05D8,	%i6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x54] %asi,	%l4
loop_2184:
	udiv	%g7,	0x16AB,	%i7
	move	%xcc,	%o1,	%l2
	movle	%xcc,	%o7,	%i1
	movrgez	%g3,	%l3,	%g4
	movne	%icc,	%o6,	%l0
	fmovdge	%xcc,	%f28,	%f15
	fbn	%fcc3,	loop_2185
	alignaddr	%g5,	%i5,	%o5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l1,	%g1
loop_2185:
	ta	%xcc,	0x7
	movrgez	%i4,	%g6,	%i3
	fnegs	%f6,	%f26
	edge16	%i2,	%i0,	%o4
	tcc	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o3
	fexpand	%f21,	%f20
	sll	%l6,	%o2,	%g2
	bg,pt	%icc,	loop_2186
	srlx	%o0,	0x12,	%l5
	mulscc	%l4,	0x1372,	%g7
	tsubcctv	%i7,	%o1,	%l2
loop_2186:
	alignaddrl	%i6,	%o7,	%g3
	tsubcc	%l3,	%g4,	%o6
	move	%icc,	%i1,	%l0
	andcc	%g5,	0x05A5,	%o5
	edge8n	%i5,	%l1,	%i4
	brgez	%g6,	loop_2187
	movge	%xcc,	%g1,	%i2
	fcmpeq16	%f0,	%f6,	%i3
	tle	%icc,	0x2
loop_2187:
	srlx	%o4,	%o3,	%l6
	umul	%o2,	0x1A0D,	%g2
	fba	%fcc0,	loop_2188
	brlz	%i0,	loop_2189
	movle	%xcc,	%o0,	%l4
	mulx	%g7,	0x1015,	%l5
loop_2188:
	movneg	%xcc,	%i7,	%l2
loop_2189:
	movne	%xcc,	%i6,	%o1
	or	%o7,	%g3,	%l3
	fbul,a	%fcc2,	loop_2190
	andcc	%g4,	%o6,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i1,	%g5
loop_2190:
	movrne	%o5,	%l1,	%i5
	subccc	%g6,	%g1,	%i4
	stx	%i2,	[%l7 + 0x50]
	fcmpne16	%f28,	%f14,	%o4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	andncc	%l6,	%o2,	%g2
	fnors	%f2,	%f19,	%f19
	fble	%fcc1,	loop_2191
	movle	%icc,	%i0,	%o0
	edge8l	%l4,	%g7,	%i3
	edge16l	%i7,	%l5,	%l2
loop_2191:
	nop
	fitos	%f17,	%f22
	movleu	%icc,	%o1,	%o7
	fcmpne32	%f12,	%f0,	%i6
	fandnot2	%f10,	%f4,	%f18
	wr	%g0,	0x80,	%asi
	sta	%f7,	[%l7 + 0x34] %asi
	tcc	%xcc,	0x7
	set	0x6B, %o4
	lduba	[%l7 + %o4] 0x19,	%g3
	addcc	%l3,	%g4,	%o6
	movrlz	%l0,	%i1,	%o5
	fbul	%fcc2,	loop_2192
	tl	%xcc,	0x1
	bg,pn	%xcc,	loop_2193
	array32	%l1,	%g5,	%g6
loop_2192:
	movneg	%icc,	%g1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2193:
	bcs,a	%icc,	loop_2194
	bcc,a,pn	%xcc,	loop_2195
	addc	%i5,	0x1624,	%o4
	nop
	setx loop_2196, %l0, %l1
	jmpl %l1, %i2
loop_2194:
	fpsub32	%f18,	%f10,	%f6
loop_2195:
	subc	%l6,	0x18EF,	%o2
	sllx	%o3,	%i0,	%o0
loop_2196:
	xnorcc	%g2,	%g7,	%l4
	movl	%xcc,	%i3,	%i7
	fors	%f22,	%f10,	%f12
	bvs,a	%xcc,	loop_2197
	edge8ln	%l5,	%l2,	%o7
	fbl,a	%fcc3,	loop_2198
	fzeros	%f16
loop_2197:
	sllx	%o1,	%i6,	%l3
	edge16n	%g3,	%g4,	%l0
loop_2198:
	sll	%o6,	%i1,	%o5
	array16	%g5,	%g6,	%g1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i4
	popc	0x137A,	%i5
	fmovdvc	%icc,	%f29,	%f5
	orcc	%o4,	0x17D9,	%i2
	movrlez	%l1,	%o2,	%l6
	edge8l	%i0,	%o0,	%g2
	nop
	setx	0xAECA6347DC52E42B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f22
	fmovdcc	%icc,	%f0,	%f27
	pdist	%f24,	%f18,	%f22
	sdivcc	%g7,	0x1242,	%l4
	fbuge,a	%fcc3,	loop_2199
	srl	%o3,	%i7,	%l5
	fmovde	%icc,	%f9,	%f15
	andn	%i3,	0x0983,	%l2
loop_2199:
	fmovrdgez	%o1,	%f26,	%f26
	movpos	%xcc,	%o7,	%i6
	udivcc	%g3,	0x0FDB,	%g4
	movre	%l0,	0x306,	%l3
	subccc	%i1,	0x175D,	%o5
	edge8n	%o6,	%g6,	%g5
	flush	%l7 + 0x40
	set	0x24, %g2
	swapa	[%l7 + %g2] 0x88,	%g1
	edge16l	%i4,	%i5,	%o4
	movrgez	%i2,	0x282,	%l1
	movge	%xcc,	%o2,	%l6
	set	0x0C, %l1
	lduwa	[%l7 + %l1] 0x18,	%i0
	movne	%xcc,	%g2,	%o0
	fbe	%fcc2,	loop_2200
	fnot1s	%f9,	%f23
	array16	%l4,	%g7,	%o3
	edge32l	%i7,	%i3,	%l5
loop_2200:
	fnands	%f21,	%f20,	%f2
	nop
	fitod	%f0,	%f8
	fdtos	%f8,	%f4
	smulcc	%o1,	%l2,	%o7
	nop
	set	0x6B, %g6
	stb	%i6,	[%l7 + %g6]
	fmovsne	%xcc,	%f9,	%f13
	mulx	%g4,	%g3,	%l0
	edge8l	%l3,	%o5,	%o6
	fmovrsne	%g6,	%f14,	%f6
	brlez,a	%i1,	loop_2201
	edge16n	%g1,	%i4,	%g5
	edge8l	%i5,	%o4,	%l1
	fbo,a	%fcc0,	loop_2202
loop_2201:
	movl	%icc,	%o2,	%l6
	fmovrsgez	%i0,	%f8,	%f3
	sllx	%i2,	%o0,	%l4
loop_2202:
	movgu	%xcc,	%g7,	%g2
	fbuge	%fcc3,	loop_2203
	fpmerge	%f12,	%f22,	%f12
	sll	%o3,	0x1A,	%i3
	sth	%i7,	[%l7 + 0x72]
loop_2203:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l5,	%o1
	stbar
	edge16n	%o7,	%l2,	%i6
	fmovsge	%icc,	%f23,	%f3
	bn	loop_2204
	udivcc	%g3,	0x0A1C,	%l0
	addcc	%g4,	0x1B1E,	%l3
	fmovda	%icc,	%f13,	%f17
loop_2204:
	orn	%o5,	0x164A,	%g6
	fnot2	%f22,	%f8
	mulx	%o6,	%g1,	%i4
	fbl,a	%fcc0,	loop_2205
	fbul	%fcc0,	loop_2206
	add	%g5,	0x12B0,	%i5
	brlz	%o4,	loop_2207
loop_2205:
	fblg,a	%fcc1,	loop_2208
loop_2206:
	array8	%l1,	%i1,	%o2
	xorcc	%l6,	%i0,	%o0
loop_2207:
	umulcc	%l4,	0x0B30,	%i2
loop_2208:
	te	%xcc,	0x6
	alignaddrl	%g7,	%g2,	%o3
	edge16ln	%i3,	%l5,	%o1
	udivx	%i7,	0x1661,	%o7
	ldd	[%l7 + 0x10],	%i6
	set	0x14, %o0
	stha	%l2,	[%l7 + %o0] 0x89
	umul	%g3,	%g4,	%l3
	orn	%o5,	0x1ED5,	%l0
	array32	%g6,	%o6,	%i4
	movrne	%g5,	0x14B,	%g1
	stbar
	srax	%o4,	%i5,	%l1
	andcc	%i1,	%o2,	%l6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x37] %asi,	%i0
	be,pn	%xcc,	loop_2209
	udivcc	%l4,	0x1D7D,	%o0
	bgu,a,pn	%icc,	loop_2210
	tsubcctv	%i2,	0x1D43,	%g2
loop_2209:
	umulcc	%g7,	%i3,	%o3
	stw	%l5,	[%l7 + 0x2C]
loop_2210:
	nop
	setx loop_2211, %l0, %l1
	jmpl %l1, %i7
	tgu	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xeb,	%asi
	stha	%o7,	[%l7 + 0x6C] %asi
	membar	#Sync
loop_2211:
	sll	%i6,	0x0A,	%l2
	alignaddrl	%g3,	%o1,	%l3
	sllx	%o5,	%g4,	%l0
	sth	%g6,	[%l7 + 0x16]
	array16	%i4,	%g5,	%g1
	fbo,a	%fcc2,	loop_2212
	ble,a,pt	%icc,	loop_2213
	nop
	setx	0x80619B97,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f29
	srl	%o6,	0x10,	%i5
loop_2212:
	srlx	%o4,	0x04,	%i1
loop_2213:
	tleu	%icc,	0x2
	fors	%f2,	%f4,	%f4
	fcmpgt16	%f28,	%f18,	%o2
	sll	%l1,	%i0,	%l6
	brlez,a	%o0,	loop_2214
	fbug	%fcc3,	loop_2215
	addcc	%i2,	0x0F93,	%l4
	bn,a	loop_2216
loop_2214:
	addc	%g7,	0x0284,	%g2
loop_2215:
	membar	0x7C
	bvc	loop_2217
loop_2216:
	fabss	%f10,	%f29
	movn	%xcc,	%i3,	%o3
	fbn	%fcc1,	loop_2218
loop_2217:
	tsubcc	%i7,	%l5,	%o7
	fbne,a	%fcc0,	loop_2219
	orncc	%i6,	0x1F35,	%l2
loop_2218:
	nop
	set	0x4E, %o1
	lduha	[%l7 + %o1] 0x0c,	%o1
loop_2219:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l3,	[%l7 + 0x50] %asi
	sethi	0x0682,	%g3
	orn	%o5,	%g4,	%g6
	movg	%icc,	%i4,	%g5
	edge16n	%g1,	%l0,	%o6
	edge32n	%o4,	%i5,	%o2
	sll	%l1,	%i0,	%i1
	sllx	%l6,	%i2,	%o0
	lduh	[%l7 + 0x3E],	%g7
	taddcctv	%g2,	%l4,	%i3
	udiv	%i7,	0x1BFE,	%l5
	subcc	%o7,	0x1CBD,	%i6
	fcmpne32	%f22,	%f14,	%l2
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x19,	 0x0
	tne	%icc,	0x3
	membar	0x59
	andncc	%l3,	%o3,	%g3
	movpos	%icc,	%g4,	%o5
	bvc,pn	%xcc,	loop_2220
	fbul,a	%fcc3,	loop_2221
	fornot1	%f0,	%f26,	%f28
	movre	%i4,	0x35D,	%g5
loop_2220:
	tsubcctv	%g6,	0x1E23,	%g1
loop_2221:
	fmovsl	%xcc,	%f17,	%f22
	edge8l	%o6,	%l0,	%i5
	sdivcc	%o4,	0x0898,	%o2
	fbule	%fcc1,	loop_2222
	udivx	%i0,	0x12B0,	%i1
	alignaddr	%l6,	%i2,	%l1
	fornot1	%f4,	%f6,	%f10
loop_2222:
	movl	%xcc,	%o0,	%g2
	nop
	fitod	%f29,	%f10
	nop
	setx	0xF9868BBFBE985BD4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x7C4C712A799A628E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f28,	%f12
	set	0x1C, %o7
	stba	%l4,	[%l7 + %o7] 0x04
	fmovde	%icc,	%f14,	%f20
	fmul8x16au	%f20,	%f2,	%f28
	movleu	%icc,	%i3,	%i7
	fbl	%fcc2,	loop_2223
	addcc	%g7,	%o7,	%i6
	edge16l	%l2,	%o1,	%l5
	bne,a,pn	%icc,	loop_2224
loop_2223:
	movle	%xcc,	%l3,	%g3
	brgez,a	%g4,	loop_2225
	movrgz	%o3,	0x3B5,	%o5
loop_2224:
	nop
	set	0x32, %g5
	sth	%g5,	[%l7 + %g5]
	alignaddrl	%i4,	%g6,	%g1
loop_2225:
	taddcctv	%o6,	0x121C,	%i5
	fmovrdlz	%l0,	%f28,	%f8
	sdivcc	%o2,	0x1773,	%i0
	move	%icc,	%o4,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%i1,	%f12,	%f5
	tn	%icc,	0x6
	tge	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	fandnot1s	%f27,	%f3,	%f16
	bcc,a	%xcc,	loop_2226
	stb	%o0,	[%l7 + 0x35]
	nop
	setx	0xF06226AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fblg,a	%fcc0,	loop_2227
loop_2226:
	ld	[%l7 + 0x08],	%f15
	movl	%icc,	%l1,	%l4
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf1,	%f0
loop_2227:
	fnands	%f21,	%f28,	%f28
	brgz	%g2,	loop_2228
	xorcc	%i3,	0x09C8,	%g7
	fnot1s	%f14,	%f12
	andn	%o7,	%i7,	%i6
loop_2228:
	brgz	%o1,	loop_2229
	srax	%l2,	0x00,	%l3
	tl	%xcc,	0x7
	edge32l	%g3,	%l5,	%o3
loop_2229:
	fmovrse	%g4,	%f8,	%f3
	fblg	%fcc3,	loop_2230
	tcs	%xcc,	0x0
	tsubcctv	%g5,	%o5,	%i4
	taddcc	%g1,	0x061B,	%g6
loop_2230:
	tn	%icc,	0x7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%i5
	fnors	%f28,	%f13,	%f18
	tvs	%xcc,	0x1
	edge16l	%o2,	%l0,	%o4
	subcc	%l6,	%i1,	%i0
	xnor	%i2,	0x1467,	%o0
	fmovsne	%icc,	%f8,	%f11
	edge8	%l4,	%l1,	%i3
	udivcc	%g7,	0x13F3,	%o7
	movg	%icc,	%i7,	%g2
	subcc	%o1,	0x1BA0,	%i6
	brz	%l3,	loop_2231
	bvs,pn	%xcc,	loop_2232
	edge8n	%g3,	%l5,	%o3
	tsubcctv	%g4,	0x084C,	%l2
loop_2231:
	udiv	%g5,	0x078A,	%o5
loop_2232:
	movcs	%xcc,	%i4,	%g1
	ba	%icc,	loop_2233
	fmovdg	%icc,	%f6,	%f0
	fmovsvs	%icc,	%f12,	%f21
	tne	%icc,	0x7
loop_2233:
	movneg	%xcc,	%o6,	%i5
	sth	%o2,	[%l7 + 0x48]
	fcmpeq32	%f30,	%f30,	%g6
	edge32	%l0,	%o4,	%i1
	srl	%i0,	0x17,	%i2
	fabsd	%f28,	%f24
	brlz	%l6,	loop_2234
	nop
	setx	0xEB63073C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xCE205AAA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f30,	%f12
	sll	%l4,	0x19,	%o0
	fpadd32s	%f17,	%f17,	%f10
loop_2234:
	edge32ln	%i3,	%l1,	%o7
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f2
	set	0x3A, %l4
	ldsba	[%l7 + %l4] 0x0c,	%i7
	srl	%g2,	0x12,	%o1
	tge	%icc,	0x7
	sethi	0x035B,	%g7
	fble	%fcc3,	loop_2235
	fmovsge	%icc,	%f0,	%f17
	bshuffle	%f14,	%f2,	%f18
	nop
	setx	loop_2236,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2235:
	sethi	0x0B9B,	%l3
	nop
	setx	0xB0612360,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	nop
	setx	0x490E0B66,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x482F4D2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f23,	%f24
loop_2236:
	andn	%i6,	0x024D,	%g3
	tvs	%icc,	0x6
	brlez,a	%l5,	loop_2237
	nop
	setx	0x204B37E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB2A239CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f11,	%f8
	ldd	[%l7 + 0x28],	%o2
	movrgz	%l2,	%g4,	%o5
loop_2237:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tne	%xcc,	0x1
	fbn,a	%fcc3,	loop_2238
	sethi	0x0AFC,	%i4
	tsubcctv	%g1,	%o6,	%g5
	subccc	%i5,	0x095D,	%g6
loop_2238:
	bl,pn	%icc,	loop_2239
	fmovdcc	%xcc,	%f26,	%f16
	add	%o2,	%l0,	%i1
	fmovdl	%xcc,	%f29,	%f3
loop_2239:
	add	%o4,	0x1B32,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l6,	%l4
	fpsub32s	%f21,	%f29,	%f2
	fbue,a	%fcc1,	loop_2240
	xnor	%i2,	0x0450,	%i3
	sub	%l1,	%o7,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2240:
	fba	%fcc3,	loop_2241
	bne,a,pt	%icc,	loop_2242
	movrgez	%i7,	%g2,	%o1
	tl	%xcc,	0x0
loop_2241:
	bl,pt	%icc,	loop_2243
loop_2242:
	call	loop_2244
	fmovdgu	%xcc,	%f1,	%f27
	tneg	%xcc,	0x7
loop_2243:
	tl	%icc,	0x7
loop_2244:
	smulcc	%g7,	%i6,	%l3
	fbug,a	%fcc3,	loop_2245
	popc	%l5,	%g3
	xnorcc	%l2,	%o3,	%o5
	ba,a	loop_2246
loop_2245:
	brgz	%i4,	loop_2247
	brz	%g4,	loop_2248
	fmovsne	%icc,	%f29,	%f20
loop_2246:
	fmovsgu	%xcc,	%f9,	%f23
loop_2247:
	sdiv	%g1,	0x0521,	%g5
loop_2248:
	fpadd32s	%f21,	%f19,	%f20
	edge32ln	%o6,	%i5,	%o2
	call	loop_2249
	lduh	[%l7 + 0x54],	%g6
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf1
	membar	#Sync
loop_2249:
	sethi	0x0934,	%i1
	nop
	setx	0x506783A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	srlx	%o4,	%i0,	%l0
	array16	%l4,	%l6,	%i2
	fmovd	%f22,	%f16
	srlx	%i3,	%l1,	%o7
	fandnot1	%f2,	%f8,	%f6
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f22
	fpadd32	%f24,	%f24,	%f20
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f22
	fandnot2	%f12,	%f28,	%f8
	tne	%icc,	0x6
	nop
	setx	0xC0486A10,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	ta	%xcc,	0x2
	set	0x6C, %o5
	lda	[%l7 + %o5] 0x14,	%f6
	movn	%icc,	%i7,	%o0
	brgz,a	%g2,	loop_2250
	orncc	%g7,	%o1,	%i6
	brnz	%l3,	loop_2251
	fmovscc	%xcc,	%f27,	%f11
loop_2250:
	move	%xcc,	%l5,	%g3
	sir	0x1A02
loop_2251:
	fmovsvs	%icc,	%f11,	%f31
	te	%xcc,	0x4
	stbar
	fnot2s	%f19,	%f12
	fcmple16	%f24,	%f10,	%o3
	popc	0x0209,	%l2
	set	0x54, %i4
	swapa	[%l7 + %i4] 0x80,	%i4
	fpadd16s	%f18,	%f29,	%f5
	movle	%xcc,	%g4,	%g1
	subccc	%o5,	0x1855,	%o6
	alignaddrl	%i5,	%o2,	%g5
	nop
	setx	loop_2252,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x200883BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xB59F470B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f8,	%f17
	movn	%icc,	%g6,	%o4
	andcc	%i1,	0x14AB,	%l0
loop_2252:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x58] %asi,	%i0
	nop
	set	0x12, %i5
	sth	%l6,	[%l7 + %i5]
	movpos	%icc,	%i2,	%l4
	fpsub32s	%f2,	%f16,	%f8
	bvc,pt	%icc,	loop_2253
	movleu	%xcc,	%l1,	%o7
	fcmpgt16	%f22,	%f10,	%i3
	tvs	%xcc,	0x7
loop_2253:
	ta	%xcc,	0x6
	ld	[%l7 + 0x58],	%f24
	stb	%o0,	[%l7 + 0x29]
	set	0x58, %o2
	lda	[%l7 + %o2] 0x19,	%f17
	nop
	setx	0x05A87017D0417D93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fand	%f20,	%f26,	%f20
	tcs	%icc,	0x5
	movgu	%xcc,	%g2,	%g7
	array8	%i7,	%o1,	%i6
	nop
	fitos	%f14,	%f0
	fstox	%f0,	%f28
	fnot2s	%f14,	%f26
	bne,pt	%icc,	loop_2254
	edge16n	%l3,	%g3,	%o3
	nop
	setx	0x4B5B3710,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x99A3075E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f4,	%f6
	movvc	%icc,	%l5,	%i4
loop_2254:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%l2
	fmul8x16	%f29,	%f4,	%f4
	smulcc	%o5,	%o6,	%g1
	movne	%xcc,	%o2,	%g5
	fmul8ulx16	%f14,	%f26,	%f6
	movpos	%icc,	%g6,	%i5
	brlz,a	%i1,	loop_2255
	sllx	%l0,	%o4,	%l6
	ldd	[%l7 + 0x30],	%f18
	srl	%i2,	0x16,	%l4
loop_2255:
	taddcctv	%i0,	%l1,	%o7
	set	0x7C, %l0
	ldswa	[%l7 + %l0] 0x15,	%o0
	or	%i3,	0x1FB6,	%g7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%g2
	edge32ln	%o1,	%i7,	%l3
	ldstub	[%l7 + 0x0B],	%g3
	nop
	fitos	%f0,	%f19
	movrlz	%i6,	0x15C,	%l5
	fcmpgt16	%f6,	%f2,	%o3
	movcs	%icc,	%i4,	%g4
	orcc	%o5,	%o6,	%g1
	movvc	%icc,	%l2,	%g5
	addccc	%g6,	%o2,	%i1
	movge	%xcc,	%l0,	%i5
	fmul8ulx16	%f30,	%f22,	%f18
	edge32n	%l6,	%o4,	%i2
	bl,pn	%xcc,	loop_2256
	ta	%icc,	0x0
	fbl	%fcc3,	loop_2257
	sra	%l4,	%l1,	%o7
loop_2256:
	array32	%i0,	%o0,	%g7
	movge	%xcc,	%g2,	%i3
loop_2257:
	ldub	[%l7 + 0x73],	%o1
	movneg	%xcc,	%i7,	%l3
	subccc	%g3,	%l5,	%o3
	nop
	setx	0xB0620F4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	nop
	setx	0x4126A6EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xE03F89A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f26,	%f29
	bne,a	loop_2258
	srlx	%i6,	%g4,	%i4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%g1
loop_2258:
	fpmerge	%f24,	%f14,	%f24
	alignaddr	%l2,	%g5,	%o5
	movg	%xcc,	%g6,	%o2
	fmuld8ulx16	%f27,	%f22,	%f6
	fmovsg	%xcc,	%f0,	%f2
	tneg	%xcc,	0x7
	edge32	%l0,	%i5,	%i1
	popc	%l6,	%o4
	fmovrdlez	%l4,	%f6,	%f22
	add	%l1,	0x0734,	%o7
	fands	%f21,	%f27,	%f18
	bcs	loop_2259
	edge16	%i0,	%o0,	%i2
	move	%icc,	%g7,	%g2
	movleu	%xcc,	%o1,	%i3
loop_2259:
	movle	%icc,	%l3,	%i7
	xnorcc	%g3,	%l5,	%o3
	bg,a	loop_2260
	movneg	%icc,	%i6,	%g4
	addccc	%i4,	%g1,	%l2
	tcs	%xcc,	0x0
loop_2260:
	nop
	set	0x32, %i0
	lduha	[%l7 + %i0] 0x88,	%o6
	xor	%g5,	0x0B2A,	%o5
	be,a	%xcc,	loop_2261
	ldd	[%l7 + 0x78],	%g6
	tpos	%icc,	0x3
	movne	%icc,	%o2,	%l0
loop_2261:
	movpos	%icc,	%i5,	%l6
	movge	%icc,	%i1,	%l4
	mulx	%o4,	%o7,	%i0
	sllx	%l1,	%o0,	%g7
	sethi	0x0E57,	%g2
	movrgez	%o1,	%i3,	%i2
	mova	%icc,	%l3,	%i7
	subc	%g3,	%l5,	%i6
	edge16n	%o3,	%g4,	%i4
	nop
	fitos	%f5,	%f21
	fstox	%f21,	%f10
	fxtos	%f10,	%f17
	movl	%xcc,	%l2,	%o6
	xor	%g1,	%g5,	%o5
	std	%f18,	[%l7 + 0x10]
	fmuld8ulx16	%f21,	%f17,	%f6
	movpos	%icc,	%o2,	%l0
	movrne	%g6,	0x3C5,	%i5
	movleu	%icc,	%l6,	%i1
	addccc	%o4,	%l4,	%o7
	orcc	%i0,	0x1B66,	%o0
	orcc	%g7,	0x1FE7,	%g2
	umul	%l1,	0x1BDB,	%o1
	fbug	%fcc2,	loop_2262
	tneg	%xcc,	0x5
	fmovscc	%xcc,	%f26,	%f0
	bl,pn	%xcc,	loop_2263
loop_2262:
	ldub	[%l7 + 0x5B],	%i2
	fmovrslez	%i3,	%f0,	%f10
	tleu	%icc,	0x3
loop_2263:
	subcc	%l3,	%g3,	%i7
	movrlz	%i6,	%l5,	%o3
	edge32l	%g4,	%l2,	%o6
	fabsd	%f6,	%f18
	add	%i4,	0x0FA9,	%g1
	te	%xcc,	0x6
	set	0x208, %l3
	ldxa	[%g0 + %l3] 0x52,	%o5
	set	0x74, %g3
	lduha	[%l7 + %g3] 0x11,	%g5
	umulcc	%l0,	%g6,	%i5
	movcc	%icc,	%o2,	%i1
	bg,pn	%icc,	loop_2264
	andncc	%l6,	%o4,	%l4
	lduh	[%l7 + 0x58],	%o7
	xnorcc	%i0,	0x0273,	%o0
loop_2264:
	nop
	setx	0xD8DEE87A17EC3AF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x026F706238F27B87,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f6,	%f22
	tvc	%xcc,	0x4
	movrlez	%g7,	0x008,	%g2
	flush	%l7 + 0x08
	udiv	%o1,	0x0DDA,	%l1
	sdivx	%i2,	0x1FCC,	%l3
	bvc,a,pn	%xcc,	loop_2265
	edge16n	%i3,	%g3,	%i7
	sdiv	%i6,	0x1F39,	%l5
	xorcc	%g4,	0x1935,	%o3
loop_2265:
	fbue,a	%fcc3,	loop_2266
	fblg	%fcc1,	loop_2267
	andcc	%l2,	%o6,	%g1
	fmuld8ulx16	%f14,	%f25,	%f18
loop_2266:
	te	%icc,	0x7
loop_2267:
	edge32n	%o5,	%i4,	%l0
	xorcc	%g5,	%i5,	%g6
	srax	%o2,	%i1,	%l6
	tne	%icc,	0x5
	subc	%l4,	%o7,	%o4
	movvc	%xcc,	%o0,	%i0
	movleu	%icc,	%g2,	%g7
	ta	%icc,	0x2
	orn	%o1,	%i2,	%l1
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%i3
	nop
	setx	0x17C2366B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x0C58F142,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f21,	%f16
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x18,	 0x3
	ldub	[%l7 + 0x57],	%i7
	set	0x38, %i1
	lduwa	[%l7 + %i1] 0x19,	%g3
	or	%l5,	%g4,	%i6
	fbue	%fcc1,	loop_2268
	fbg	%fcc3,	loop_2269
	fmovdl	%icc,	%f29,	%f30
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x54] %asi,	%o3
loop_2268:
	brlez,a	%o6,	loop_2270
loop_2269:
	sdiv	%l2,	0x17E2,	%g1
	xor	%i4,	%o5,	%l0
	subc	%i5,	%g6,	%o2
loop_2270:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x0c,	%i1,	%g5
	taddcctv	%l6,	0x08F9,	%o7
	udivx	%o4,	0x034B,	%l4
	tsubcctv	%o0,	%i0,	%g2
	mulscc	%g7,	0x0713,	%i2
	addccc	%l1,	%o1,	%l3
	udiv	%i3,	0x18EB,	%g3
	edge32ln	%i7,	%l5,	%i6
	sll	%o3,	0x0E,	%o6
	srlx	%g4,	0x1B,	%l2
	fbu	%fcc2,	loop_2271
	fbne	%fcc1,	loop_2272
	tn	%xcc,	0x6
	ldstub	[%l7 + 0x37],	%g1
loop_2271:
	fandnot1	%f16,	%f24,	%f6
loop_2272:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f21
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f0
	subc	%i4,	0x0388,	%l0
	tpos	%icc,	0x3
	tn	%xcc,	0x2
	tneg	%xcc,	0x5
	fones	%f6
	lduh	[%l7 + 0x28],	%i5
	tne	%icc,	0x4
	andcc	%g6,	0x19C2,	%o2
	orcc	%o5,	0x0238,	%g5
	edge32	%l6,	%i1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1660,	%o4
	stbar
	swap	[%l7 + 0x34],	%o0
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x19,	 0x2
	smul	%g2,	%g7,	%i2
	edge8l	%l1,	%i0,	%o1
	fmovdleu	%icc,	%f16,	%f0
	movneg	%xcc,	%i3,	%g3
	fornot1s	%f15,	%f10,	%f4
	udiv	%l3,	0x0797,	%i7
	addcc	%i6,	%o3,	%l5
	stbar
	fpadd32s	%f29,	%f19,	%f19
	tgu	%xcc,	0x5
	swap	[%l7 + 0x78],	%g4
	or	%l2,	%g1,	%i4
	movrne	%l0,	%i5,	%o6
	bgu,a	%icc,	loop_2273
	ldsw	[%l7 + 0x2C],	%g6
	fmovrslz	%o2,	%f2,	%f14
	fblg	%fcc2,	loop_2274
loop_2273:
	fbo,a	%fcc1,	loop_2275
	movn	%icc,	%g5,	%o5
	fnegd	%f30,	%f20
loop_2274:
	tle	%icc,	0x7
loop_2275:
	subccc	%i1,	%o7,	%l6
	nop
	set	0x34, %l5
	ldub	[%l7 + %l5],	%o0
	ldsb	[%l7 + 0x59],	%l4
	edge16	%o4,	%g7,	%g2
	fxnors	%f4,	%f19,	%f4
	movcc	%xcc,	%i2,	%i0
	lduw	[%l7 + 0x2C],	%o1
	xorcc	%i3,	0x0BFB,	%l1
	brgez,a	%g3,	loop_2276
	fxnor	%f18,	%f6,	%f12
	fblg,a	%fcc1,	loop_2277
	movg	%icc,	%i7,	%i6
loop_2276:
	edge16n	%o3,	%l5,	%l3
	bne,pn	%xcc,	loop_2278
loop_2277:
	fornot2s	%f8,	%f12,	%f30
	fmovsa	%xcc,	%f28,	%f15
	edge8l	%g4,	%g1,	%i4
loop_2278:
	nop
	setx	0xCABF24F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f24
	subccc	%l0,	%i5,	%o6
	fzero	%f26
	orncc	%g6,	0x1BE6,	%o2
	bpos,pn	%icc,	loop_2279
	popc	0x1AB3,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o5,	0x10F5,	%i1
loop_2279:
	sdiv	%o7,	0x1AC1,	%l6
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,pn	%icc,	loop_2280
	bshuffle	%f30,	%f6,	%f12
	udivx	%o0,	0x0883,	%l2
	fmovspos	%xcc,	%f21,	%f25
loop_2280:
	ld	[%l7 + 0x48],	%f26
	tcs	%xcc,	0x2
	brz	%o4,	loop_2281
	fblg	%fcc2,	loop_2282
	fands	%f23,	%f21,	%f3
	tleu	%icc,	0x4
loop_2281:
	sdiv	%g7,	0x15D8,	%l4
loop_2282:
	alignaddr	%i2,	%g2,	%o1
	sir	0x1EF4
	bl	%xcc,	loop_2283
	orn	%i3,	%i0,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g3,	%i6,	%o3
loop_2283:
	fsrc2	%f22,	%f8
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x15,	%l5
	movcs	%icc,	%l3,	%i7
	andncc	%g4,	%i4,	%l0
	movrlz	%i5,	%o6,	%g1
	tleu	%xcc,	0x1
	popc	%o2,	%g6
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x19,	%o5
	fmovdg	%icc,	%f18,	%f11
	fmovrslz	%i1,	%f28,	%f6
	movcs	%icc,	%o7,	%g5
	ldd	[%l7 + 0x60],	%f22
	smul	%l6,	0x1844,	%o0
	umul	%o4,	0x1B63,	%g7
	bcc,a,pn	%xcc,	loop_2284
	taddcc	%l4,	0x1CDE,	%i2
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f27
	sdiv	%g2,	0x0412,	%l2
loop_2284:
	nop
	set	0x22, %i3
	ldsba	[%l7 + %i3] 0x18,	%i3
	tcc	%icc,	0x6
	addcc	%i0,	%l1,	%g3
	smulcc	%i6,	%o1,	%l5
	fmovrslez	%o3,	%f17,	%f17
	movcs	%xcc,	%l3,	%i7
	edge8	%g4,	%l0,	%i4
	bgu,a	%xcc,	loop_2285
	fands	%f12,	%f14,	%f15
	nop
	setx	0x7072DE69,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	movneg	%icc,	%o6,	%i5
loop_2285:
	fornot1	%f22,	%f0,	%f16
	edge16ln	%g1,	%g6,	%o5
	fornot2	%f6,	%f6,	%f10
	umulcc	%i1,	0x0210,	%o2
	movl	%icc,	%g5,	%o7
	or	%l6,	0x0A35,	%o4
	array32	%g7,	%o0,	%i2
	movrgez	%g2,	%l2,	%i3
	edge32	%l4,	%l1,	%i0
	movleu	%xcc,	%i6,	%o1
	udivcc	%l5,	0x190F,	%g3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x42] %asi,	%l3
	andcc	%o3,	%i7,	%g4
	bvs,a,pt	%icc,	loop_2286
	ble,a,pt	%xcc,	loop_2287
	edge8ln	%l0,	%i4,	%o6
	nop
	set	0x60, %g1
	lduw	[%l7 + %g1],	%g1
loop_2286:
	tl	%icc,	0x7
loop_2287:
	brnz	%g6,	loop_2288
	movrgez	%i5,	%i1,	%o2
	sllx	%g5,	%o5,	%o7
	lduw	[%l7 + 0x74],	%l6
loop_2288:
	fbul,a	%fcc1,	loop_2289
	sir	0x1F0A
	edge32n	%g7,	%o0,	%o4
	fmovrsne	%i2,	%f8,	%f17
loop_2289:
	bne,pn	%icc,	loop_2290
	move	%xcc,	%l2,	%g2
	srlx	%l4,	%l1,	%i3
	fmovd	%f28,	%f0
loop_2290:
	popc	%i6,	%i0
	movneg	%xcc,	%o1,	%l5
	orncc	%l3,	0x1908,	%o3
	add	%i7,	%g3,	%l0
	fxors	%f11,	%f0,	%f21
	subccc	%g4,	0x1641,	%o6
	fcmpeq16	%f10,	%f16,	%i4
	taddcctv	%g6,	%g1,	%i5
	subcc	%o2,	%i1,	%g5
	tcc	%xcc,	0x2
	subcc	%o5,	%l6,	%o7
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f30
	edge32n	%o0,	%g7,	%i2
	fornot2	%f4,	%f18,	%f18
	fmovsa	%xcc,	%f24,	%f22
	tcc	%xcc,	0x1
	fmovdl	%xcc,	%f8,	%f29
	swap	[%l7 + 0x20],	%l2
	fbne	%fcc1,	loop_2291
	edge32ln	%o4,	%l4,	%l1
	ldsh	[%l7 + 0x2C],	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x19,	%i6,	%i0
loop_2291:
	ld	[%l7 + 0x48],	%f7
	movg	%icc,	%i3,	%o1
	movcc	%xcc,	%l5,	%o3
	edge8	%l3,	%g3,	%l0
	fbe	%fcc0,	loop_2292
	fabsd	%f6,	%f6
	fnot1s	%f27,	%f18
	array8	%i7,	%g4,	%i4
loop_2292:
	srl	%o6,	%g1,	%g6
	move	%xcc,	%i5,	%i1
	edge32l	%o2,	%o5,	%g5
	andncc	%l6,	%o0,	%o7
	sllx	%g7,	%i2,	%o4
	array8	%l4,	%l2,	%g2
	fzero	%f2
	subccc	%l1,	0x1D7E,	%i0
	tcs	%xcc,	0x1
	fands	%f25,	%f11,	%f27
	brgez,a	%i3,	loop_2293
	fba	%fcc3,	loop_2294
	array32	%i6,	%l5,	%o3
	fbne,a	%fcc1,	loop_2295
loop_2293:
	srax	%o1,	%l3,	%l0
loop_2294:
	movrne	%g3,	%g4,	%i4
	tleu	%icc,	0x0
loop_2295:
	ldx	[%l7 + 0x68],	%o6
	fbo,a	%fcc0,	loop_2296
	orn	%g1,	0x1436,	%g6
	popc	0x0F89,	%i7
	fmul8ulx16	%f0,	%f26,	%f16
loop_2296:
	sdiv	%i1,	0x13BB,	%i5
	movleu	%icc,	%o2,	%g5
	fpsub16s	%f13,	%f7,	%f2
	subc	%l6,	%o0,	%o5
	tsubcc	%o7,	%i2,	%o4
	fblg	%fcc2,	loop_2297
	bvs,a	loop_2298
	fpsub32s	%f25,	%f31,	%f9
	edge32n	%l4,	%g7,	%g2
loop_2297:
	fpadd16s	%f31,	%f29,	%f14
loop_2298:
	fmovse	%xcc,	%f28,	%f3
	fmovsne	%xcc,	%f1,	%f15
	movcs	%xcc,	%l2,	%l1
	or	%i0,	0x1B0F,	%i3
	nop
	fitos	%f0,	%f22
	fstoi	%f22,	%f1
	addccc	%l5,	%i6,	%o3
	edge8l	%o1,	%l0,	%g3
	sir	0x14CD
	mulscc	%g4,	%i4,	%o6
	ta	%icc,	0x6
	bg,a,pn	%icc,	loop_2299
	edge16l	%l3,	%g6,	%g1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2299:
	popc	0x0BA7,	%i1
	movcc	%icc,	%i5,	%o2
	movn	%xcc,	%g5,	%i7
	fornot1s	%f10,	%f6,	%f7
	fmovdcc	%icc,	%f11,	%f18
	tcs	%icc,	0x5
	sllx	%o0,	0x00,	%o5
	smulcc	%l6,	%i2,	%o4
	bl	loop_2300
	tleu	%xcc,	0x0
	xnorcc	%l4,	%g7,	%o7
	stbar
loop_2300:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%l1
	movleu	%icc,	%l2,	%i3
	fmovsge	%icc,	%f30,	%f12
	tsubcctv	%l5,	0x116F,	%i0
	tge	%icc,	0x3
	add	%o3,	%o1,	%i6
	fmovrsne	%l0,	%f27,	%f13
	subcc	%g3,	0x048B,	%i4
	fmul8x16au	%f23,	%f21,	%f24
	tgu	%icc,	0x5
	movg	%icc,	%o6,	%l3
	fandnot1	%f14,	%f18,	%f6
	mulx	%g6,	%g1,	%i1
	srlx	%g4,	0x0F,	%i5
	ta	%xcc,	0x7
	sllx	%g5,	0x14,	%o2
	movneg	%icc,	%o0,	%o5
	ta	%icc,	0x7
	edge8n	%i7,	%l6,	%o4
	tpos	%xcc,	0x5
	andn	%l4,	%i2,	%g7
	bshuffle	%f28,	%f20,	%f18
	tl	%xcc,	0x6
	fbule	%fcc1,	loop_2301
	tpos	%xcc,	0x7
	edge32	%o7,	%g2,	%l1
	brlez,a	%i3,	loop_2302
loop_2301:
	flush	%l7 + 0x30
	and	%l5,	0x0167,	%l2
	swap	[%l7 + 0x40],	%i0
loop_2302:
	edge16ln	%o1,	%o3,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x76] %asi,	%i6
	edge16	%g3,	%i4,	%l3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x10] %asi,	%o6
	std	%f6,	[%l7 + 0x30]
	orn	%g1,	%i1,	%g4
	fbo,a	%fcc2,	loop_2303
	movg	%icc,	%g6,	%i5
	fbule	%fcc0,	loop_2304
	movge	%xcc,	%g5,	%o0
loop_2303:
	or	%o2,	%o5,	%i7
	fcmpeq32	%f6,	%f18,	%o4
loop_2304:
	fnegs	%f20,	%f29
	fbne	%fcc0,	loop_2305
	bg	loop_2306
	nop
	setx	loop_2307,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%l6,	0x135A,	%i2
loop_2305:
	fmuld8ulx16	%f28,	%f0,	%f26
loop_2306:
	tge	%xcc,	0x4
loop_2307:
	bge,pt	%xcc,	loop_2308
	nop
	fitod	%f12,	%f12
	fdtoi	%f12,	%f1
	movcc	%xcc,	%g7,	%o7
	fpadd32s	%f21,	%f12,	%f18
loop_2308:
	movcc	%icc,	%g2,	%l1
	alignaddr	%i3,	%l4,	%l2
	edge16	%l5,	%o1,	%o3
	tcs	%icc,	0x3
	movre	%l0,	%i6,	%g3
	movleu	%icc,	%i0,	%i4
	fmovrsgz	%o6,	%f26,	%f9
	sdivcc	%l3,	0x13EB,	%i1
	movneg	%icc,	%g1,	%g6
	xor	%g4,	%i5,	%o0
	fblg	%fcc3,	loop_2309
	edge16	%o2,	%g5,	%i7
	std	%f18,	[%l7 + 0x50]
	flush	%l7 + 0x08
loop_2309:
	movn	%icc,	%o5,	%o4
	lduh	[%l7 + 0x12],	%i2
	ld	[%l7 + 0x64],	%f0
	fmovdpos	%xcc,	%f30,	%f22
	tcs	%xcc,	0x6
	brgz	%g7,	loop_2310
	ble,pn	%xcc,	loop_2311
	be,pt	%icc,	loop_2312
	popc	0x1F22,	%o7
loop_2310:
	subccc	%l6,	0x1AD5,	%l1
loop_2311:
	srl	%g2,	0x1B,	%i3
loop_2312:
	fcmple32	%f20,	%f26,	%l2
	tg	%icc,	0x4
	mulx	%l4,	0x06E0,	%l5
	tge	%xcc,	0x1
	tcs	%xcc,	0x1
	tsubcc	%o3,	%o1,	%i6
	fblg	%fcc3,	loop_2313
	movvc	%xcc,	%l0,	%i0
	srax	%g3,	%o6,	%l3
	fandnot1s	%f21,	%f19,	%f13
loop_2313:
	bneg,a,pt	%xcc,	loop_2314
	tleu	%icc,	0x4
	std	%f10,	[%l7 + 0x60]
	fnands	%f13,	%f6,	%f22
loop_2314:
	movvc	%icc,	%i4,	%i1
	fmovrslez	%g6,	%f2,	%f22
	tcc	%xcc,	0x3
	edge16ln	%g4,	%i5,	%o0
	mulscc	%o2,	%g5,	%i7
	edge16ln	%g1,	%o5,	%i2
	edge16ln	%g7,	%o7,	%l6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	taddcc	%l1,	0x1519,	%i3
	nop
	setx	0x4B359612,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f10
	lduw	[%l7 + 0x64],	%l2
	bl	loop_2315
	movcc	%xcc,	%l4,	%l5
	wr	%g0,	0x10,	%asi
	stwa	%o3,	[%l7 + 0x60] %asi
loop_2315:
	sllx	%o1,	%g2,	%l0
	nop
	setx	0x7D2F64B820523CA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmul8sux16	%f6,	%f10,	%f30
	subc	%i0,	%i6,	%o6
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f14
	fnot1	%f30,	%f30
	fbg	%fcc1,	loop_2316
	bcc,pn	%icc,	loop_2317
	fble,a	%fcc1,	loop_2318
	xnorcc	%g3,	0x15D5,	%i4
loop_2316:
	fmul8sux16	%f2,	%f26,	%f14
loop_2317:
	tleu	%icc,	0x3
loop_2318:
	xorcc	%l3,	%g6,	%g4
	umul	%i5,	%o0,	%o2
	xnor	%i1,	0x0744,	%g5
	bneg	%xcc,	loop_2319
	orcc	%i7,	%g1,	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%g7
loop_2319:
	movvc	%icc,	%l6,	%o7
	fcmple16	%f26,	%f30,	%o4
	movrlez	%i3,	%l2,	%l4
	ldsb	[%l7 + 0x34],	%l1
	fnand	%f14,	%f2,	%f14
	move	%xcc,	%l5,	%o1
	fandnot2	%f6,	%f26,	%f18
	fbg	%fcc3,	loop_2320
	movle	%xcc,	%g2,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o3,	0x12CB,	%i0
loop_2320:
	fornot2s	%f15,	%f0,	%f30
	nop
	setx	loop_2321,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%xcc,	0x2
	fbl,a	%fcc2,	loop_2322
	movcs	%xcc,	%i6,	%g3
loop_2321:
	nop
	wr	%g0,	0x88,	%asi
	stxa	%o6,	[%l7 + 0x40] %asi
loop_2322:
	taddcc	%l3,	%i4,	%g4
	sll	%g6,	0x13,	%o0
	movcc	%icc,	%o2,	%i5
	sra	%g5,	%i7,	%i1
	brnz	%i2,	loop_2323
	orncc	%g1,	%o5,	%l6
	movrgez	%o7,	0x117,	%o4
	orncc	%i3,	%g7,	%l4
loop_2323:
	swap	[%l7 + 0x30],	%l2
	addcc	%l5,	0x0494,	%o1
	orcc	%l1,	%l0,	%g2
	movre	%i0,	0x376,	%o3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x79] %asi,	%i6
	movrlz	%g3,	0x0B2,	%l3
	fblg,a	%fcc1,	loop_2324
	nop
	setx loop_2325, %l0, %l1
	jmpl %l1, %o6
	addc	%g4,	%g6,	%i4
	fnot1s	%f30,	%f23
loop_2324:
	nop
	wr	%g0,	0x80,	%asi
	stba	%o0,	[%l7 + 0x70] %asi
loop_2325:
	nop
	setx loop_2326, %l0, %l1
	jmpl %l1, %o2
	movn	%icc,	%g5,	%i5
	addcc	%i1,	%i7,	%g1
	or	%i2,	%l6,	%o7
loop_2326:
	lduw	[%l7 + 0x68],	%o4
	sdivcc	%o5,	0x170C,	%i3
	movge	%icc,	%l4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pn	%icc,	loop_2327
	movneg	%icc,	%l2,	%o1
	fands	%f3,	%f10,	%f23
	movg	%icc,	%l5,	%l0
loop_2327:
	udivcc	%g2,	0x1E76,	%i0
	array16	%o3,	%i6,	%g3
	fmovscc	%xcc,	%f27,	%f29
	edge16l	%l1,	%l3,	%o6
	and	%g6,	0x00E6,	%g4
	xor	%i4,	%o0,	%o2
	fbl	%fcc1,	loop_2328
	bl,pn	%icc,	loop_2329
	tg	%icc,	0x3
	smulcc	%i5,	0x1F91,	%i1
loop_2328:
	fmovsge	%icc,	%f23,	%f7
loop_2329:
	edge8n	%i7,	%g1,	%g5
	edge8	%i2,	%l6,	%o4
	or	%o7,	0x1425,	%o5
	membar	0x1E
	sdivx	%i3,	0x14C7,	%l4
	tn	%xcc,	0x7
	stw	%g7,	[%l7 + 0x28]
	sll	%o1,	%l5,	%l0
	fsrc1	%f24,	%f12
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x18,	%g2,	%i0
	movn	%icc,	%l2,	%i6
	lduw	[%l7 + 0x38],	%g3
	nop
	setx	0x4099DE9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x938E9180,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f2,	%f19
	te	%xcc,	0x6
	sdivcc	%o3,	0x102B,	%l1
	edge8n	%l3,	%g6,	%o6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x2C] %asi,	%f8
	smul	%i4,	%g4,	%o0
	edge8l	%i5,	%o2,	%i7
	fpackfix	%f30,	%f0
	or	%g1,	%i1,	%i2
	umul	%l6,	%g5,	%o4
	fmovdleu	%icc,	%f7,	%f27
	bn,a	loop_2330
	movl	%xcc,	%o5,	%o7
	and	%l4,	0x0E4D,	%g7
	sethi	0x1E8D,	%o1
loop_2330:
	edge32	%i3,	%l5,	%g2
	edge16	%i0,	%l0,	%l2
	fba,a	%fcc0,	loop_2331
	edge32ln	%i6,	%g3,	%o3
	for	%f16,	%f16,	%f16
	movrgez	%l3,	%l1,	%g6
loop_2331:
	andncc	%i4,	%o6,	%o0
	wr	%g0,	0x2b,	%asi
	stha	%g4,	[%l7 + 0x56] %asi
	membar	#Sync
	prefetch	[%l7 + 0x2C],	 0x1
	fmovdcc	%xcc,	%f16,	%f6
	edge8l	%o2,	%i7,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%i1,	loop_2332
	sllx	%g1,	0x19,	%i2
	fmovsle	%xcc,	%f14,	%f12
	fpadd16	%f8,	%f24,	%f4
loop_2332:
	bg,a,pn	%xcc,	loop_2333
	fblg	%fcc3,	loop_2334
	edge8ln	%g5,	%o4,	%o5
	srax	%l6,	%o7,	%g7
loop_2333:
	tvc	%icc,	0x1
loop_2334:
	faligndata	%f20,	%f0,	%f22
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x44] %asi,	%o1
	fnot1s	%f9,	%f20
	smul	%i3,	%l5,	%g2
	fble,a	%fcc2,	loop_2335
	tcc	%icc,	0x0
	fmovsg	%xcc,	%f28,	%f31
	sllx	%l4,	%l0,	%l2
loop_2335:
	orn	%i6,	0x1E60,	%g3
	ldx	[%l7 + 0x28],	%o3
	movl	%icc,	%i0,	%l1
	edge8ln	%l3,	%i4,	%o6
	tsubcc	%o0,	0x0F30,	%g6
	subcc	%o2,	0x170A,	%i7
	call	loop_2336
	xnor	%g4,	0x0905,	%i5
	fmovdcs	%icc,	%f9,	%f19
	edge16	%i1,	%g1,	%g5
loop_2336:
	tn	%icc,	0x5
	movvs	%xcc,	%o4,	%i2
	alignaddr	%l6,	%o7,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x26, %o4
	stba	%o5,	[%l7 + %o4] 0xe3
	membar	#Sync
	xorcc	%o1,	%l5,	%i3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x68] %asi,	%g2
	fmovrdgez	%l4,	%f4,	%f24
	tpos	%xcc,	0x0
	tle	%xcc,	0x7
	tvc	%icc,	0x3
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x24,	%l2
	brgez	%i6,	loop_2337
	nop
	set	0x34, %o0
	lduw	[%l7 + %o0],	%l0
	wr	%g0,	0x18,	%asi
	sta	%f31,	[%l7 + 0x10] %asi
loop_2337:
	alignaddr	%o3,	%i0,	%g3
	andcc	%l1,	0x1F61,	%i4
	fmovdl	%xcc,	%f1,	%f24
	nop
	setx loop_2338, %l0, %l1
	jmpl %l1, %o6
	movrgez	%l3,	%o0,	%o2
	tcc	%icc,	0x0
	subc	%g6,	0x1059,	%i7
loop_2338:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%i1
	orn	%i5,	%g5,	%o4
	movle	%icc,	%g1,	%i2
	tpos	%xcc,	0x6
	taddcc	%l6,	%g7,	%o7
	alignaddrl	%o5,	%o1,	%l5
	movl	%xcc,	%g2,	%l4
	edge32	%l2,	%i3,	%l0
	bl	loop_2339
	tvc	%icc,	0x0
	fmovdl	%xcc,	%f17,	%f14
	edge16l	%i6,	%o3,	%i0
loop_2339:
	tleu	%xcc,	0x2
	andn	%l1,	0x1F2D,	%i4
	addc	%g3,	0x0900,	%l3
	fmovsvc	%icc,	%f11,	%f28
	fble,a	%fcc3,	loop_2340
	smul	%o0,	%o2,	%o6
	edge8n	%g6,	%i7,	%i1
	set	0x42, %l1
	ldsba	[%l7 + %l1] 0x04,	%g4
loop_2340:
	bvc,a	%icc,	loop_2341
	sllx	%g5,	0x13,	%i5
	xnor	%g1,	0x1318,	%i2
	tle	%xcc,	0x1
loop_2341:
	edge32	%o4,	%g7,	%l6
	srlx	%o5,	%o7,	%l5
	nop
	setx	loop_2342,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%o1,	%g2,	%l2
	movleu	%icc,	%i3,	%l0
	edge32n	%i6,	%o3,	%l4
loop_2342:
	movvc	%icc,	%l1,	%i4
	taddcc	%g3,	0x1C5C,	%i0
	fzero	%f24
	nop
	fitos	%f11,	%f23
	tgu	%icc,	0x4
	array32	%o0,	%o2,	%o6
	fpackfix	%f20,	%f14
	bg,pn	%xcc,	loop_2343
	sir	0x014A
	fmovdle	%icc,	%f26,	%f31
	fbo	%fcc0,	loop_2344
loop_2343:
	tg	%icc,	0x5
	sdivx	%g6,	0x15EF,	%l3
	fmovrsgez	%i7,	%f21,	%f7
loop_2344:
	edge16ln	%g4,	%g5,	%i1
	popc	0x1C6B,	%i5
	edge32n	%i2,	%g1,	%o4
	bleu	%xcc,	loop_2345
	ldd	[%l7 + 0x10],	%i6
	ldub	[%l7 + 0x2D],	%g7
	taddcctv	%o7,	0x105C,	%o5
loop_2345:
	sdiv	%o1,	0x189E,	%l5
	movcc	%icc,	%l2,	%g2
	fmovdg	%icc,	%f31,	%f3
	movrgz	%i3,	%l0,	%o3
	orn	%l4,	0x0E5E,	%i6
	movvs	%xcc,	%i4,	%g3
	srax	%i0,	%o0,	%l1
	fzeros	%f3
	edge32ln	%o6,	%o2,	%g6
	addc	%l3,	%i7,	%g5
	orcc	%i1,	0x0E54,	%i5
	fbue,a	%fcc0,	loop_2346
	fblg,a	%fcc1,	loop_2347
	pdist	%f12,	%f4,	%f2
	tle	%icc,	0x1
loop_2346:
	orncc	%g4,	%g1,	%o4
loop_2347:
	fbule	%fcc0,	loop_2348
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x5
	and	%l6,	%i2,	%g7
loop_2348:
	tl	%xcc,	0x1
	ta	%icc,	0x6
	taddcc	%o5,	%o1,	%l5
	fmovsne	%xcc,	%f16,	%f19
	movpos	%icc,	%o7,	%g2
	movgu	%icc,	%i3,	%l2
	sdivcc	%o3,	0x1C8E,	%l0
	fcmpeq16	%f2,	%f8,	%i6
	fmovdne	%xcc,	%f11,	%f24
	tg	%xcc,	0x6
	mulx	%l4,	%i4,	%i0
	edge16	%o0,	%g3,	%o6
	movneg	%icc,	%l1,	%g6
	alignaddr	%l3,	%o2,	%g5
	move	%icc,	%i1,	%i5
	movge	%xcc,	%g4,	%i7
	fpsub32	%f16,	%f18,	%f0
	tne	%icc,	0x5
	movpos	%xcc,	%g1,	%o4
	subcc	%i2,	%l6,	%g7
	edge8	%o5,	%l5,	%o1
	nop
	fitos	%f9,	%f17
	fstoi	%f17,	%f5
	fbug,a	%fcc2,	loop_2349
	movrne	%o7,	%g2,	%i3
	ldd	[%l7 + 0x40],	%f2
	fmul8sux16	%f16,	%f30,	%f0
loop_2349:
	mova	%xcc,	%l2,	%l0
	sllx	%i6,	%l4,	%i4
	tcc	%xcc,	0x3
	set	0x64, %o1
	lduwa	[%l7 + %o1] 0x88,	%i0
	nop
	setx	0xC04322F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fmovspos	%icc,	%f25,	%f14
	mova	%icc,	%o0,	%g3
	fmovdcc	%xcc,	%f9,	%f3
	edge32n	%o6,	%o3,	%g6
	fbge	%fcc1,	loop_2350
	movvc	%icc,	%l3,	%l1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x10] %asi,	%o2
loop_2350:
	fble	%fcc2,	loop_2351
	mova	%icc,	%i1,	%i5
	tvs	%xcc,	0x0
	array16	%g5,	%g4,	%i7
loop_2351:
	array32	%g1,	%i2,	%o4
	sethi	0x1A9D,	%l6
	movvs	%xcc,	%o5,	%l5
	bcc,a,pt	%xcc,	loop_2352
	fpadd32	%f20,	%f14,	%f8
	fmovsa	%icc,	%f3,	%f25
	nop
	fitod	%f0,	%f16
	fdtoi	%f16,	%f21
loop_2352:
	subccc	%o1,	%g7,	%o7
	addcc	%i3,	%l2,	%l0
	fmovsgu	%xcc,	%f6,	%f30
	movvs	%xcc,	%g2,	%i6
	xor	%i4,	%l4,	%i0
	fbl,a	%fcc2,	loop_2353
	nop
	setx	0x41BADB1B405A6D25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fble	%fcc1,	loop_2354
	movcs	%xcc,	%g3,	%o0
loop_2353:
	edge16l	%o3,	%g6,	%l3
	mulscc	%o6,	%l1,	%i1
loop_2354:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f29,	%f14
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%i5
	bg	loop_2355
	fcmple32	%f18,	%f2,	%g4
	fxnor	%f30,	%f22,	%f8
	set	0x2C, %o7
	lduha	[%l7 + %o7] 0x0c,	%i7
loop_2355:
	fbule,a	%fcc1,	loop_2356
	fbul,a	%fcc3,	loop_2357
	srax	%g5,	0x1E,	%g1
	fpadd16	%f24,	%f26,	%f18
loop_2356:
	umulcc	%i2,	0x0AC6,	%l6
loop_2357:
	nop
	fitos	%f2,	%f31
	fstod	%f31,	%f28
	smul	%o4,	0x0E04,	%l5
	tgu	%xcc,	0x3
	call	loop_2358
	addc	%o1,	0x1DC3,	%o5
	tl	%icc,	0x5
	movle	%icc,	%o7,	%g7
loop_2358:
	orcc	%l2,	0x1CB7,	%i3
	fba,a	%fcc3,	loop_2359
	nop
	setx	0x10643703,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	fbl	%fcc2,	loop_2360
	orncc	%l0,	%g2,	%i6
loop_2359:
	movrgez	%i4,	%i0,	%l4
	nop
	setx	0x8236D60BFF1EEAE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x88C0F51B8AD91ED3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f10,	%f30
loop_2360:
	ldsb	[%l7 + 0x72],	%o0
	fand	%f14,	%f14,	%f6
	edge8l	%g3,	%g6,	%o3
	edge16l	%o6,	%l1,	%l3
	movge	%xcc,	%i1,	%o2
	nop
	setx	0x005B2D55,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	ldstub	[%l7 + 0x5D],	%i5
	prefetch	[%l7 + 0x10],	 0x0
	movrgz	%g4,	%g5,	%i7
	fnot2	%f20,	%f10
	alignaddrl	%g1,	%l6,	%i2
	edge32	%o4,	%o1,	%l5
	bn,a	loop_2361
	subc	%o5,	0x17E9,	%o7
	ta	%icc,	0x0
	fmovdn	%xcc,	%f19,	%f10
loop_2361:
	nop
	set	0x20, %g5
	ldsba	[%l7 + %g5] 0x15,	%g7
	fba,a	%fcc3,	loop_2362
	movrlz	%l2,	0x2D7,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pn	%xcc,	loop_2363
loop_2362:
	fmovspos	%xcc,	%f1,	%f27
	fblg	%fcc3,	loop_2364
	sllx	%i3,	%i6,	%i4
loop_2363:
	movrgz	%i0,	%l4,	%g2
	brgz,a	%g3,	loop_2365
loop_2364:
	fcmpgt32	%f26,	%f0,	%g6
	fabss	%f18,	%f31
	fsrc1s	%f9,	%f18
loop_2365:
	tgu	%xcc,	0x6
	fxor	%f0,	%f30,	%f10
	brnz,a	%o3,	loop_2366
	brgz,a	%o6,	loop_2367
	fmovrdlez	%o0,	%f28,	%f6
	fandnot2	%f14,	%f2,	%f18
loop_2366:
	movn	%xcc,	%l3,	%l1
loop_2367:
	addc	%o2,	%i1,	%g4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g5,	%i5
	sdiv	%g1,	0x1256,	%l6
	fbu	%fcc1,	loop_2368
	tne	%xcc,	0x4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i2,	%i7
loop_2368:
	tle	%xcc,	0x1
	std	%f8,	[%l7 + 0x50]
	xor	%o4,	0x0D02,	%o1
	andcc	%o5,	%o7,	%l5
	nop
	fitod	%f8,	%f16
	fdtoi	%f16,	%f25
	fmul8x16au	%f0,	%f14,	%f4
	sub	%g7,	0x13AB,	%l2
	tn	%xcc,	0x0
	edge8l	%i3,	%i6,	%l0
	membar	0x11
	nop
	set	0x20, %l6
	stw	%i0,	[%l7 + %l6]
	mulx	%l4,	%g2,	%g3
	andn	%i4,	0x0544,	%g6
	orcc	%o3,	0x0558,	%o0
	fba	%fcc3,	loop_2369
	fxor	%f14,	%f24,	%f18
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
loop_2369:
	ld	[%l7 + 0x2C],	%f17
	subcc	%o6,	0x1606,	%l1
	tneg	%xcc,	0x5
	movle	%xcc,	%i1,	%o2
	fmovsge	%xcc,	%f29,	%f28
	be	loop_2370
	edge16ln	%g5,	%g4,	%i5
	movgu	%xcc,	%g1,	%l6
	fnegs	%f10,	%f31
loop_2370:
	array16	%i7,	%i2,	%o4
	stx	%o5,	[%l7 + 0x58]
	fmovrsgz	%o1,	%f22,	%f8
	nop
	setx	0x27CD4D956E1AA983,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f28
	array32	%l5,	%g7,	%l2
	ldd	[%l7 + 0x40],	%i2
	fpadd16	%f8,	%f10,	%f16
	nop
	setx	0x79DA4C4AF05F3B67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	edge8n	%o7,	%i6,	%l0
	sth	%i0,	[%l7 + 0x2E]
	fmul8x16au	%f30,	%f2,	%f8
	movn	%icc,	%g2,	%l4
	fandnot2s	%f10,	%f6,	%f22
	add	%i4,	0x1D5B,	%g3
	edge32ln	%g6,	%o3,	%o0
	smul	%o6,	0x1236,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i1,	0x0962,	%l1
	movleu	%icc,	%o2,	%g4
	movvs	%icc,	%g5,	%i5
	sub	%g1,	%l6,	%i2
	addccc	%o4,	0x0803,	%i7
	smulcc	%o5,	0x0615,	%l5
	bpos,pn	%xcc,	loop_2371
	ldsb	[%l7 + 0x23],	%o1
	ld	[%l7 + 0x10],	%f17
	orn	%g7,	0x1366,	%i3
loop_2371:
	fornot2s	%f27,	%f12,	%f13
	addc	%o7,	%i6,	%l0
	fbuge	%fcc0,	loop_2372
	addccc	%i0,	0x07DC,	%l2
	prefetch	[%l7 + 0x20],	 0x3
	ldsb	[%l7 + 0x14],	%l4
loop_2372:
	tcs	%icc,	0x0
	ta	%icc,	0x0
	andncc	%i4,	%g3,	%g6
	edge8ln	%o3,	%g2,	%o6
	andcc	%o0,	0x063E,	%i1
	mulx	%l1,	%o2,	%g4
	tcc	%icc,	0x1
	movrlz	%g5,	%l3,	%i5
	taddcc	%g1,	%i2,	%o4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x14] %asi,	%i7
	edge8ln	%o5,	%l6,	%l5
	movvc	%icc,	%o1,	%i3
	fbue,a	%fcc0,	loop_2373
	xnorcc	%o7,	%i6,	%g7
	orncc	%l0,	%l2,	%i0
	fmovd	%f6,	%f2
loop_2373:
	edge8l	%l4,	%g3,	%g6
	nop
	setx	0x3419FBEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f28
	xnor	%i4,	%g2,	%o3
	bcs	%icc,	loop_2374
	movvs	%icc,	%o0,	%o6
	subccc	%l1,	0x07FA,	%o2
	tneg	%icc,	0x7
loop_2374:
	udivx	%i1,	0x1035,	%g5
	fmovrslez	%l3,	%f27,	%f1
	brgz	%g4,	loop_2375
	stw	%g1,	[%l7 + 0x64]
	set	0x4C, %o3
	swapa	[%l7 + %o3] 0x89,	%i2
loop_2375:
	addccc	%i5,	%i7,	%o5
	bg	loop_2376
	fpmerge	%f16,	%f2,	%f22
	tvc	%xcc,	0x7
	andn	%o4,	%l5,	%o1
loop_2376:
	nop
	setx	0x259703EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x713B26EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f15,	%f25
	bvs	loop_2377
	alignaddrl	%i3,	%l6,	%o7
	movne	%xcc,	%g7,	%i6
	sth	%l2,	[%l7 + 0x0A]
loop_2377:
	movrne	%i0,	%l0,	%g3
	movg	%icc,	%g6,	%l4
	fornot2	%f2,	%f14,	%f2
	st	%f8,	[%l7 + 0x70]
	srax	%g2,	%i4,	%o3
	fmul8sux16	%f18,	%f8,	%f28
	srax	%o6,	%l1,	%o0
	movn	%xcc,	%o2,	%g5
	subccc	%l3,	0x1A39,	%g4
	ble	loop_2378
	edge8l	%g1,	%i2,	%i1
	movre	%i7,	%i5,	%o5
	edge8	%o4,	%o1,	%l5
loop_2378:
	mulx	%l6,	%o7,	%g7
	umul	%i3,	0x0A9B,	%l2
	fmuld8sux16	%f3,	%f27,	%f28
	fmovrslz	%i0,	%f11,	%f30
	lduh	[%l7 + 0x44],	%i6
	brgz	%l0,	loop_2379
	ldd	[%l7 + 0x78],	%g6
	fmovrsne	%l4,	%f5,	%f7
	std	%f4,	[%l7 + 0x18]
loop_2379:
	fnors	%f19,	%f29,	%f1
	array16	%g3,	%i4,	%g2
	mova	%xcc,	%o6,	%o3
	or	%l1,	0x165C,	%o2
	nop
	setx	0xB5B08B69077E0D53,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x151618A5272C422B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f14,	%f18
	fbn	%fcc2,	loop_2380
	fpmerge	%f5,	%f29,	%f28
	movrne	%g5,	%o0,	%l3
	edge16ln	%g4,	%g1,	%i1
loop_2380:
	edge8ln	%i7,	%i2,	%i5
	udivx	%o4,	0x1020,	%o1
	nop
	fitod	%f8,	%f20
	fdtox	%f20,	%f30
	tl	%xcc,	0x6
	tpos	%xcc,	0x1
	movg	%xcc,	%l5,	%o5
	bn	%icc,	loop_2381
	fmovdle	%icc,	%f1,	%f8
	udivcc	%l6,	0x030C,	%g7
	fbo,a	%fcc1,	loop_2382
loop_2381:
	tvs	%xcc,	0x0
	edge32	%i3,	%o7,	%i0
	tsubcc	%i6,	%l0,	%l2
loop_2382:
	xorcc	%l4,	%g6,	%i4
	tsubcctv	%g2,	%g3,	%o3
	srax	%o6,	%o2,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f4,	%f16,	%f30
	brgz	%l1,	loop_2383
	srlx	%l3,	0x11,	%o0
	fmovdn	%icc,	%f3,	%f18
	and	%g4,	%g1,	%i7
loop_2383:
	sll	%i2,	0x03,	%i5
	fbule,a	%fcc2,	loop_2384
	fmovdneg	%icc,	%f5,	%f18
	movne	%xcc,	%o4,	%i1
	mulx	%o1,	0x016D,	%o5
loop_2384:
	fmovrdlez	%l6,	%f10,	%f8
	set	0x0, %l4
	ldxa	[%g0 + %l4] 0x58,	%l5
	edge32	%g7,	%o7,	%i0
	sdivx	%i3,	0x19F4,	%l0
	nop
	setx	0x9711EC4F0E212E2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f8
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x11,	%l2
	fandnot2s	%f22,	%f22,	%f2
	nop
	setx	0xCF380CAEBF1B9411,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x07C28E8D9EE9F7DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f22,	%f8
	andncc	%i6,	%l4,	%i4
	edge32n	%g2,	%g3,	%o3
	fpmerge	%f14,	%f16,	%f20
	st	%f13,	[%l7 + 0x18]
	movleu	%xcc,	%g6,	%o2
	or	%g5,	%o6,	%l3
	tcs	%xcc,	0x7
	tl	%xcc,	0x3
	sir	0x0775
	fmovdgu	%icc,	%f6,	%f5
	bgu,a	loop_2385
	edge32	%l1,	%g4,	%o0
	tcs	%xcc,	0x0
	brgez	%g1,	loop_2386
loop_2385:
	udivx	%i2,	0x01C9,	%i5
	fmovs	%f31,	%f26
	xorcc	%o4,	0x06B8,	%i7
loop_2386:
	movrlez	%o1,	0x065,	%i1
	movgu	%xcc,	%o5,	%l6
	fmovdge	%xcc,	%f21,	%f7
	fpackfix	%f4,	%f8
	addcc	%g7,	%o7,	%i0
	tge	%icc,	0x7
	pdist	%f12,	%f2,	%f10
	be	%xcc,	loop_2387
	stbar
	smul	%l5,	%l0,	%l2
	sub	%i3,	%l4,	%i4
loop_2387:
	fmovdgu	%icc,	%f23,	%f5
	movrgez	%i6,	%g3,	%o3
	fbule,a	%fcc1,	loop_2388
	fcmpeq32	%f30,	%f6,	%g6
	srl	%g2,	%o2,	%o6
	add	%l3,	0x10B0,	%g5
loop_2388:
	nop
	setx	0xF4B8D8E3BFCAD338,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xCDDE234C88D384C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f16
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l1
	udivcc	%g4,	0x1156,	%o0
	fbule	%fcc0,	loop_2389
	ta	%xcc,	0x6
	movrne	%g1,	0x246,	%i5
	fmovsl	%xcc,	%f0,	%f24
loop_2389:
	stw	%o4,	[%l7 + 0x60]
	tcs	%icc,	0x4
	udivcc	%i2,	0x035A,	%i7
	bgu,a,pt	%icc,	loop_2390
	edge32	%o1,	%i1,	%o5
	fmovdne	%icc,	%f3,	%f27
	sllx	%g7,	%l6,	%i0
loop_2390:
	tcs	%xcc,	0x0
	sir	0x0557
	fandnot1s	%f24,	%f15,	%f6
	fsrc2s	%f22,	%f1
	edge8	%l5,	%o7,	%l2
	fabss	%f21,	%f5
	mulscc	%i3,	0x0319,	%l4
	sub	%i4,	%i6,	%g3
	subc	%l0,	%g6,	%o3
	array16	%o2,	%g2,	%o6
	set	0x0C, %o5
	stwa	%g5,	[%l7 + %o5] 0x80
	tcs	%xcc,	0x0
	tvc	%xcc,	0x3
	movgu	%icc,	%l3,	%g4
	umulcc	%o0,	%l1,	%i5
	brnz	%g1,	loop_2391
	fornot2s	%f21,	%f4,	%f14
	ldsb	[%l7 + 0x3E],	%i2
	fmul8sux16	%f10,	%f28,	%f0
loop_2391:
	udiv	%o4,	0x189B,	%o1
	nop
	setx	0x97EF4BEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xC52AA4B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f4,	%f20
	bgu	loop_2392
	movleu	%icc,	%i1,	%o5
	be,a,pt	%icc,	loop_2393
	movrgez	%i7,	%g7,	%i0
loop_2392:
	tle	%xcc,	0x0
	tl	%xcc,	0x3
loop_2393:
	bge,a	loop_2394
	tg	%xcc,	0x7
	tneg	%icc,	0x2
	andn	%l6,	%l5,	%o7
loop_2394:
	ldsw	[%l7 + 0x18],	%i3
	movrgz	%l2,	0x244,	%l4
	fmovrslz	%i4,	%f31,	%f22
	andncc	%i6,	%g3,	%g6
	fmovsvs	%icc,	%f24,	%f6
	movg	%xcc,	%l0,	%o2
	umulcc	%g2,	0x0E5B,	%o3
	edge8l	%g5,	%o6,	%l3
	fpsub32	%f8,	%f14,	%f22
	movleu	%xcc,	%g4,	%o0
	bne,a	loop_2395
	tsubcc	%i5,	%l1,	%i2
	movle	%xcc,	%g1,	%o4
	tsubcc	%i1,	0x1F23,	%o5
loop_2395:
	tsubcctv	%o1,	0x02D8,	%g7
	fbug,a	%fcc2,	loop_2396
	ba,a	loop_2397
	xnor	%i7,	0x185E,	%l6
	fcmpeq16	%f28,	%f30,	%i0
loop_2396:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3e0] %asi,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2397:
	fcmpeq16	%f0,	%f10,	%l5
	stb	%l2,	[%l7 + 0x56]
	fba	%fcc2,	loop_2398
	addcc	%l4,	0x1965,	%i4
	sth	%i3,	[%l7 + 0x46]
	fmovsg	%xcc,	%f6,	%f21
loop_2398:
	fmovsgu	%xcc,	%f7,	%f9
	sdivx	%g3,	0x023B,	%g6
	std	%f30,	[%l7 + 0x60]
	movcc	%xcc,	%i6,	%l0
	edge32	%o2,	%g2,	%o3
	fbo	%fcc1,	loop_2399
	ldsh	[%l7 + 0x56],	%o6
	fcmple32	%f4,	%f20,	%l3
	orcc	%g5,	%o0,	%g4
loop_2399:
	movrlez	%l1,	0x171,	%i2
	fcmple32	%f22,	%f26,	%i5
	array8	%o4,	%i1,	%g1
	bge,a	loop_2400
	ta	%xcc,	0x0
	movpos	%xcc,	%o5,	%o1
	nop
	setx	loop_2401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2400:
	movcc	%xcc,	%g7,	%l6
	tsubcc	%i7,	%i0,	%l5
	fmovdvs	%icc,	%f28,	%f15
loop_2401:
	fmovdcc	%xcc,	%f12,	%f31
	tcc	%icc,	0x4
	movn	%icc,	%l2,	%o7
	tl	%xcc,	0x7
	andncc	%i4,	%l4,	%i3
	andncc	%g6,	%g3,	%i6
	nop
	setx	0x857F472D8636932C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x8A4F3E2E265AA8E9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f26,	%f2
	fbul,a	%fcc1,	loop_2402
	srax	%o2,	%l0,	%o3
	edge8ln	%g2,	%o6,	%l3
	nop
	fitos	%f11,	%f24
	fstod	%f24,	%f4
loop_2402:
	tge	%xcc,	0x4
	swap	[%l7 + 0x50],	%o0
	fpadd16	%f6,	%f12,	%f12
	andcc	%g5,	0x0357,	%g4
	nop
	fitos	%f21,	%f25
	fbug	%fcc3,	loop_2403
	ldsh	[%l7 + 0x12],	%i2
	edge8ln	%i5,	%l1,	%o4
	mulscc	%i1,	0x0933,	%g1
loop_2403:
	ldd	[%l7 + 0x50],	%f0
	umulcc	%o1,	%o5,	%g7
	udivcc	%i7,	0x1902,	%l6
	ldd	[%l7 + 0x38],	%f24
	edge16n	%i0,	%l2,	%o7
	fbu	%fcc2,	loop_2404
	tn	%icc,	0x2
	fnands	%f11,	%f26,	%f16
	subccc	%l5,	%i4,	%i3
loop_2404:
	movg	%icc,	%g6,	%l4
	fones	%f13
	set	0x20, %i5
	lda	[%l7 + %i5] 0x89,	%f1
	edge8l	%g3,	%o2,	%l0
	edge8ln	%o3,	%g2,	%o6
	bcc,pn	%icc,	loop_2405
	tvs	%xcc,	0x7
	movcc	%icc,	%i6,	%o0
	set	0x60, %i4
	ldsba	[%l7 + %i4] 0x14,	%g5
loop_2405:
	tcc	%xcc,	0x7
	be	%xcc,	loop_2406
	taddcctv	%g4,	%i2,	%i5
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2406:
	edge32n	%l1,	%o4,	%i1
	movvs	%xcc,	%g1,	%l3
	nop
	setx	0xFDBF28F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x71882908,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f15,	%f20
	srl	%o1,	%o5,	%g7
	edge32	%i7,	%l6,	%i0
	ta	%xcc,	0x0
	subcc	%l2,	0x1A4E,	%l5
	te	%xcc,	0x6
	ldsw	[%l7 + 0x48],	%i4
	fmovdcc	%xcc,	%f25,	%f2
	addcc	%i3,	0x1C98,	%g6
	edge16n	%o7,	%l4,	%g3
	nop
	setx loop_2407, %l0, %l1
	jmpl %l1, %o2
	fxnors	%f1,	%f27,	%f20
	fcmple32	%f10,	%f16,	%l0
	ldsh	[%l7 + 0x72],	%g2
loop_2407:
	tsubcctv	%o3,	%o6,	%o0
	movge	%xcc,	%g5,	%g4
	orn	%i2,	0x1226,	%i6
	movgu	%xcc,	%l1,	%o4
	bn,a	loop_2408
	mova	%icc,	%i1,	%i5
	tle	%icc,	0x7
	wr	%g0,	0x89,	%asi
	stha	%l3,	[%l7 + 0x68] %asi
loop_2408:
	tle	%icc,	0x3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%o1
	addc	%o5,	0x1B9C,	%i7
	edge8	%g7,	%l6,	%i0
	movne	%xcc,	%l5,	%i4
	bgu,pt	%xcc,	loop_2409
	fble	%fcc2,	loop_2410
	fmovsa	%icc,	%f20,	%f14
	prefetch	[%l7 + 0x68],	 0x2
loop_2409:
	nop
	setx	0x895A27946B74DAD5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x73245FB314B39D34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f2,	%f14
loop_2410:
	movvs	%icc,	%l2,	%i3
	sll	%g6,	0x00,	%o7
	tneg	%icc,	0x1
	movle	%icc,	%l4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1E33,	%l0
	edge16n	%g2,	%o3,	%o6
	fcmple32	%f10,	%f30,	%o0
	ldx	[%l7 + 0x50],	%g3
	tsubcctv	%g5,	%g4,	%i6
	tle	%icc,	0x6
	mulx	%i2,	0x0054,	%l1
	bpos	loop_2411
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o4,	%i1,	%i5
	udiv	%l3,	0x136E,	%o1
loop_2411:
	sdiv	%g1,	0x0242,	%i7
	fpadd16s	%f13,	%f31,	%f8
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fpmerge	%f4,	%f11,	%f28
	fmovsa	%xcc,	%f26,	%f28
	sub	%g7,	%l6,	%o5
	fones	%f5
	stx	%l5,	[%l7 + 0x08]
	alignaddr	%i0,	%i4,	%i3
	bg	%icc,	loop_2412
	orn	%l2,	%g6,	%o7
	udivcc	%l4,	0x0656,	%o2
	bcc,pn	%xcc,	loop_2413
loop_2412:
	nop
	setx	loop_2414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x0
	edge16l	%l0,	%o3,	%g2
loop_2413:
	array32	%o0,	%g3,	%o6
loop_2414:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%g5
	xor	%i6,	%i2,	%l1
	brgez,a	%o4,	loop_2415
	xnorcc	%i1,	0x1300,	%g4
	bcc,a,pn	%xcc,	loop_2416
	ta	%xcc,	0x3
loop_2415:
	fmovdcc	%icc,	%f11,	%f9
	st	%f14,	[%l7 + 0x20]
loop_2416:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%l3
	tneg	%xcc,	0x3
	edge8	%i5,	%g1,	%o1
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f28
	nop
	setx	0xFE4CFEFDE1B6D6BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9FBBE7D8C2AC23E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f26,	%f26
	ldstub	[%l7 + 0x2B],	%g7
	bleu,a,pn	%xcc,	loop_2417
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f2
	udiv	%l6,	0x1F06,	%o5
	fbu	%fcc3,	loop_2418
loop_2417:
	fbe	%fcc0,	loop_2419
	fornot1	%f20,	%f12,	%f28
	movleu	%xcc,	%l5,	%i7
loop_2418:
	fmul8x16au	%f28,	%f27,	%f4
loop_2419:
	srl	%i0,	%i3,	%i4
	srl	%g6,	%l2,	%o7
	movl	%icc,	%o2,	%l0
	flush	%l7 + 0x68
	udivcc	%o3,	0x0F05,	%g2
	addccc	%o0,	0x1F93,	%g3
	taddcctv	%l4,	0x038B,	%o6
	tleu	%xcc,	0x5
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f2
	fxtos	%f2,	%f8
	andcc	%g5,	%i6,	%l1
	popc	0x1F8C,	%o4
	addcc	%i2,	0x1D46,	%g4
	nop
	setx loop_2420, %l0, %l1
	jmpl %l1, %l3
	movgu	%xcc,	%i5,	%g1
	movleu	%xcc,	%i1,	%o1
	bn,a,pt	%xcc,	loop_2421
loop_2420:
	sdivcc	%l6,	0x0846,	%o5
	movg	%xcc,	%l5,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2421:
	membar	0x32
	orcc	%i0,	0x1C12,	%i3
	set	0x50, %l0
	lduba	[%l7 + %l0] 0x0c,	%i7
	movrlz	%i4,	0x0C5,	%g6
	nop
	setx	loop_2422,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x5
	movre	%o7,	%o2,	%l2
	fabsd	%f10,	%f26
loop_2422:
	umul	%o3,	0x0BFD,	%l0
	bge	loop_2423
	fabss	%f4,	%f29
	tvc	%xcc,	0x6
	fmovsl	%xcc,	%f3,	%f1
loop_2423:
	ldsh	[%l7 + 0x6C],	%o0
	edge16l	%g2,	%g3,	%l4
	umulcc	%g5,	0x11AE,	%o6
	xnor	%i6,	%o4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i2,	%l3
	array16	%i5,	%g1,	%i1
	fnot1s	%f23,	%f25
	bcs,pn	%xcc,	loop_2424
	array32	%o1,	%g4,	%o5
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x0c,	 0x1
loop_2424:
	nop
	setx	0x898A04A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f13
	edge32n	%l6,	%g7,	%i3
	flush	%l7 + 0x20
	fblg,a	%fcc1,	loop_2425
	stb	%i0,	[%l7 + 0x63]
	fba,a	%fcc2,	loop_2426
	ldd	[%l7 + 0x78],	%i4
loop_2425:
	movn	%icc,	%i7,	%o7
	fornot1	%f12,	%f14,	%f12
loop_2426:
	fmovdcc	%icc,	%f7,	%f18
	swap	[%l7 + 0x78],	%g6
	fand	%f18,	%f8,	%f24
	edge16n	%o2,	%o3,	%l2
	st	%f25,	[%l7 + 0x48]
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o0,	%g3
	set	0x4F, %l3
	lduba	[%l7 + %l3] 0x15,	%g2
	and	%g5,	%l4,	%o6
	xnorcc	%i6,	0x0440,	%o4
	tne	%icc,	0x5
	wr	%g0,	0x88,	%asi
	stwa	%i2,	[%l7 + 0x20] %asi
	tsubcc	%l3,	0x08A4,	%l1
	smulcc	%g1,	%i5,	%i1
	xnor	%g4,	%o5,	%o1
	fmovrdne	%l6,	%f4,	%f0
	movvs	%xcc,	%g7,	%l5
	edge32	%i3,	%i4,	%i7
	tcc	%xcc,	0x4
	mulx	%o7,	%g6,	%i0
	fmovdge	%icc,	%f17,	%f9
	bshuffle	%f12,	%f0,	%f22
	fbo	%fcc0,	loop_2427
	fmovdne	%icc,	%f4,	%f20
	ldd	[%l7 + 0x60],	%o2
	andncc	%l2,	%l0,	%o3
loop_2427:
	fblg,a	%fcc3,	loop_2428
	fmovsneg	%icc,	%f20,	%f17
	move	%xcc,	%g3,	%o0
	sll	%g5,	0x00,	%l4
loop_2428:
	smul	%o6,	0x0D50,	%g2
	fandnot2s	%f0,	%f23,	%f31
	smulcc	%o4,	%i2,	%l3
	orcc	%l1,	0x15F5,	%i6
	sub	%i5,	%i1,	%g1
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x15,	 0x1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x64] %asi,	%f6
	orn	%o1,	0x157C,	%l6
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0x3
	mulscc	%l5,	0x1C91,	%i3
	bgu	loop_2429
	subccc	%o5,	%i7,	%i4
	and	%g6,	%o7,	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%l2
loop_2429:
	fblg	%fcc0,	loop_2430
	nop
	fitos	%f14,	%f24
	fstoi	%f24,	%f22
	membar	0x3C
	stbar
loop_2430:
	fmovrsne	%i0,	%f31,	%f30
	fbo,a	%fcc3,	loop_2431
	sdiv	%o3,	0x19D7,	%g3
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x14,	%o0
loop_2431:
	fsrc2s	%f10,	%f6
	taddcctv	%g5,	%l0,	%l4
	ldsb	[%l7 + 0x64],	%o6
	membar	0x04
	xnorcc	%o4,	%g2,	%l3
	fnegs	%f27,	%f25
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l1
	udivx	%i6,	0x01C8,	%i2
	movl	%icc,	%i5,	%g1
	sdivcc	%g4,	0x09F6,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2432, %l0, %l1
	jmpl %l1, %o1
	fsrc2s	%f12,	%f17
	fmovd	%f30,	%f22
	nop
	setx	loop_2433,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2432:
	tsubcctv	%g7,	0x0CD4,	%l5
	ble,a	loop_2434
	tvs	%xcc,	0x2
loop_2433:
	fnors	%f6,	%f31,	%f4
	xnor	%l6,	0x0154,	%i3
loop_2434:
	andncc	%i7,	%o5,	%g6
	edge16	%i4,	%o7,	%l2
	udivx	%i0,	0x119E,	%o2
	sra	%g3,	%o3,	%o0
	tpos	%xcc,	0x3
	sdivx	%l0,	0x0945,	%g5
	tleu	%xcc,	0x3
	fsrc2	%f22,	%f12
	edge16	%o6,	%l4,	%o4
	tle	%icc,	0x0
	tsubcctv	%g2,	%l3,	%l1
	fbn,a	%fcc2,	loop_2435
	edge32ln	%i6,	%i5,	%i2
	tneg	%xcc,	0x6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g4,	%i1
loop_2435:
	umulcc	%g1,	%g7,	%o1
	movre	%l5,	%l6,	%i3
	move	%icc,	%o5,	%g6
	edge16	%i4,	%i7,	%o7
	sdivx	%l2,	0x1C9B,	%o2
	sdivx	%i0,	0x0C33,	%o3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x0c,	%o0,	%l0
	addc	%g5,	0x13BE,	%g3
	taddcctv	%l4,	0x1FF9,	%o4
	nop
	fitos	%f13,	%f13
	fstod	%f13,	%f24
	fbne	%fcc3,	loop_2436
	sdivx	%g2,	0x1EFF,	%o6
	fmovrdlz	%l3,	%f12,	%f30
	andncc	%l1,	%i6,	%i5
loop_2436:
	sll	%i2,	0x08,	%g4
	umul	%g1,	0x0951,	%g7
	fpadd32s	%f19,	%f1,	%f2
	move	%icc,	%o1,	%i1
	fmovrslz	%l5,	%f23,	%f29
	andcc	%i3,	0x117B,	%l6
	fmovspos	%icc,	%f10,	%f5
	xnor	%o5,	%g6,	%i4
	nop
	setx	loop_2437,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%i7,	0x19F9,	%l2
	brgez,a	%o2,	loop_2438
	udivx	%o7,	0x128D,	%o3
loop_2437:
	brnz	%o0,	loop_2439
	sdivx	%i0,	0x03A5,	%l0
loop_2438:
	fmovrsgz	%g5,	%f8,	%f25
	fmovrdgez	%l4,	%f28,	%f28
loop_2439:
	or	%o4,	%g2,	%o6
	array8	%g3,	%l3,	%l1
	set	0x20, %i1
	lda	[%l7 + %i1] 0x0c,	%f19
	tn	%xcc,	0x2
	udiv	%i6,	0x19E4,	%i2
	movrlz	%i5,	0x03D,	%g4
	set	0x1C, %i7
	ldswa	[%l7 + %i7] 0x89,	%g7
	edge32n	%g1,	%i1,	%o1
	orn	%i3,	%l6,	%l5
	tpos	%xcc,	0x1
	fmovsge	%icc,	%f1,	%f31
	tvs	%icc,	0x1
	stx	%o5,	[%l7 + 0x78]
	edge16n	%i4,	%g6,	%i7
	xnor	%o2,	0x14C2,	%o7
	movleu	%xcc,	%l2,	%o3
	ba,a	%xcc,	loop_2440
	ta	%xcc,	0x4
	edge8l	%o0,	%i0,	%g5
	array16	%l0,	%l4,	%g2
loop_2440:
	fmovsvs	%xcc,	%f23,	%f18
	fbug	%fcc0,	loop_2441
	srl	%o6,	%o4,	%l3
	nop
	setx	loop_2442,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16	%l1,	%g3,	%i2
loop_2441:
	brgz	%i5,	loop_2443
	xnorcc	%i6,	0x1DE9,	%g7
loop_2442:
	movpos	%icc,	%g4,	%i1
	fbuge	%fcc1,	loop_2444
loop_2443:
	fmovdneg	%xcc,	%f18,	%f15
	bge,pn	%icc,	loop_2445
	fbu	%fcc2,	loop_2446
loop_2444:
	ldsb	[%l7 + 0x3B],	%g1
	fmovd	%f14,	%f26
loop_2445:
	fmovdcs	%xcc,	%f19,	%f3
loop_2446:
	addc	%i3,	%l6,	%o1
	movne	%icc,	%l5,	%i4
	mova	%icc,	%g6,	%o5
	sub	%o2,	0x116D,	%o7
	tle	%xcc,	0x2
	fba	%fcc0,	loop_2447
	udivcc	%l2,	0x15E5,	%i7
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x80,	%o3
loop_2447:
	edge32l	%i0,	%o0,	%g5
	edge8	%l0,	%g2,	%l4
	nop
	setx	0xF65B35FDA050D41E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	ta	%icc,	0x6
	fmovsvs	%icc,	%f5,	%f25
	tneg	%xcc,	0x7
	subc	%o6,	%o4,	%l1
	set	0x2E, %l5
	ldsba	[%l7 + %l5] 0x18,	%g3
	udiv	%l3,	0x0726,	%i2
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f8
	fxtos	%f8,	%f19
	wr	%g0,	0x88,	%asi
	stxa	%i6,	[%l7 + 0x68] %asi
	movneg	%xcc,	%g7,	%i5
	nop
	setx	loop_2448,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16	%f15,	%f4,	%f4
	movre	%g4,	0x1FA,	%g1
	mulx	%i3,	%l6,	%o1
loop_2448:
	fpadd16	%f18,	%f2,	%f14
	fbuge,a	%fcc3,	loop_2449
	fmovdge	%xcc,	%f20,	%f28
	fpsub32s	%f31,	%f10,	%f11
	fand	%f18,	%f22,	%f6
loop_2449:
	edge8n	%i1,	%l5,	%g6
	mulx	%i4,	0x0670,	%o5
	set	0x74, %i6
	lda	[%l7 + %i6] 0x88,	%f9
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f2
	tsubcc	%o7,	0x0CD7,	%o2
	edge32	%l2,	%i7,	%i0
	movle	%icc,	%o0,	%o3
	bcc,a	loop_2450
	orncc	%g5,	0x12A0,	%l0
	tvc	%icc,	0x0
	fcmpeq16	%f6,	%f24,	%g2
loop_2450:
	orncc	%l4,	%o4,	%o6
	brgez	%g3,	loop_2451
	bg,a,pn	%icc,	loop_2452
	te	%icc,	0x4
	xor	%l3,	%i2,	%i6
loop_2451:
	andcc	%l1,	0x1797,	%g7
loop_2452:
	fmovdvc	%icc,	%f5,	%f30
	and	%g4,	%i5,	%i3
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x2C] %asi
	umulcc	%g1,	%l6,	%o1
	mulx	%i1,	0x11FE,	%l5
	ble,a	loop_2453
	fandnot1s	%f21,	%f14,	%f0
	ta	%xcc,	0x7
	edge16	%i4,	%g6,	%o5
loop_2453:
	popc	%o2,	%l2
	fmovdg	%icc,	%f21,	%f10
	set	0x30, %o6
	lduba	[%l7 + %o6] 0x81,	%i7
	movpos	%icc,	%o7,	%i0
	bcc	%xcc,	loop_2454
	mova	%icc,	%o3,	%o0
	mova	%xcc,	%l0,	%g2
	movle	%xcc,	%l4,	%o4
loop_2454:
	ldsb	[%l7 + 0x66],	%o6
	edge16	%g5,	%g3,	%l3
	udivx	%i6,	0x1780,	%i2
	xnor	%l1,	%g4,	%i5
	set	0x0C, %i2
	ldsha	[%l7 + %i2] 0x88,	%i3
	tpos	%xcc,	0x5
	andncc	%g1,	%l6,	%g7
	ldsw	[%l7 + 0x2C],	%o1
	sdiv	%l5,	0x049C,	%i4
	tvs	%icc,	0x3
	edge8n	%g6,	%i1,	%o2
	set	0x1D, %g1
	ldsba	[%l7 + %g1] 0x14,	%o5
	sub	%l2,	0x0DB0,	%i7
	array32	%i0,	%o7,	%o0
	tcc	%icc,	0x2
	array32	%l0,	%o3,	%g2
	movgu	%xcc,	%l4,	%o6
	tcs	%icc,	0x2
	fbne,a	%fcc2,	loop_2455
	ldsh	[%l7 + 0x5C],	%g5
	te	%xcc,	0x1
	edge16l	%g3,	%l3,	%i6
loop_2455:
	array32	%i2,	%l1,	%g4
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x80
	tl	%xcc,	0x5
	movne	%icc,	%o4,	%i5
	ldd	[%l7 + 0x70],	%i2
	tn	%xcc,	0x7
	ble,pn	%xcc,	loop_2456
	bne,a	loop_2457
	te	%xcc,	0x6
	fmovdpos	%icc,	%f17,	%f12
loop_2456:
	nop
	set	0x35, %g2
	stba	%g1,	[%l7 + %g2] 0x10
loop_2457:
	te	%icc,	0x2
	srax	%l6,	0x07,	%o1
	tge	%xcc,	0x5
	array8	%l5,	%g7,	%g6
	faligndata	%f10,	%f14,	%f22
	sllx	%i1,	%o2,	%i4
	movl	%xcc,	%o5,	%i7
	ldub	[%l7 + 0x47],	%i0
	edge8ln	%o7,	%o0,	%l2
	taddcctv	%o3,	0x0217,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x42] %asi,	%g2
	nop
	fitos	%f6,	%f23
	fstox	%f23,	%f18
	movle	%xcc,	%l4,	%g5
	ldub	[%l7 + 0x46],	%o6
	mova	%icc,	%g3,	%i6
	tneg	%icc,	0x5
	mulscc	%i2,	%l3,	%g4
	wr	%g0,	0xeb,	%asi
	stba	%l1,	[%l7 + 0x17] %asi
	membar	#Sync
	subccc	%i5,	0x0976,	%i3
	udivx	%o4,	0x1611,	%l6
	movcs	%icc,	%o1,	%l5
	fmovsge	%icc,	%f14,	%f31
	orn	%g1,	%g7,	%i1
	movrlz	%g6,	%i4,	%o2
	umulcc	%o5,	%i0,	%o7
	taddcc	%i7,	%o0,	%l2
	fcmpeq16	%f22,	%f26,	%o3
	fpack16	%f4,	%f25
	set	0x08, %o4
	ldxa	[%l7 + %o4] 0x88,	%g2
	udivcc	%l4,	0x0294,	%l0
	umulcc	%o6,	0x1609,	%g3
	ba,a,pn	%icc,	loop_2458
	move	%xcc,	%g5,	%i2
	fandnot2	%f26,	%f26,	%f0
	std	%f22,	[%l7 + 0x78]
loop_2458:
	umul	%l3,	0x0E93,	%i6
	orcc	%g4,	0x0D78,	%i5
	fmovsleu	%icc,	%f13,	%f7
	subccc	%i3,	%l1,	%o4
	brz,a	%o1,	loop_2459
	fmovsg	%icc,	%f13,	%f31
	xor	%l6,	%g1,	%l5
	bleu,a	loop_2460
loop_2459:
	membar	0x5C
	smul	%g7,	%g6,	%i4
	fbue	%fcc3,	loop_2461
loop_2460:
	tneg	%xcc,	0x2
	fornot2	%f18,	%f18,	%f14
	orn	%o2,	%i1,	%o5
loop_2461:
	andcc	%o7,	%i0,	%o0
	add	%i7,	0x1E7A,	%o3
	bg,a	loop_2462
	addc	%g2,	0x1C4B,	%l2
	edge8l	%l0,	%l4,	%g3
	wr	%g0,	0x2a,	%asi
	stha	%o6,	[%l7 + 0x56] %asi
	membar	#Sync
loop_2462:
	add	%i2,	0x0EA3,	%g5
	tsubcctv	%i6,	0x0798,	%l3
	fmovsg	%xcc,	%f4,	%f23
	flush	%l7 + 0x5C
	fandnot1	%f16,	%f18,	%f18
	nop
	setx	0xA1A21AD8D32EFF5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x079EC9ECE99A4B70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f28,	%f6
	fmovrslez	%g4,	%f9,	%f26
	movcc	%icc,	%i5,	%i3
	fmovd	%f16,	%f18
	movleu	%xcc,	%o4,	%o1
	tpos	%xcc,	0x1
	fornot2	%f20,	%f8,	%f16
	stb	%l1,	[%l7 + 0x0E]
	and	%g1,	0x1966,	%l5
	movge	%xcc,	%g7,	%l6
	tsubcctv	%i4,	%o2,	%g6
	bpos,pt	%icc,	loop_2463
	fandnot1	%f14,	%f10,	%f0
	mova	%xcc,	%i1,	%o5
	sth	%i0,	[%l7 + 0x5A]
loop_2463:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f19,	[%l7 + 0x60] %asi
	movle	%xcc,	%o0,	%i7
	orn	%o7,	0x10C0,	%o3
	srlx	%l2,	0x05,	%g2
	tvs	%xcc,	0x1
	set	0x58, %o0
	ldsha	[%l7 + %o0] 0x10,	%l0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l4
	movrgez	%i2,	0x17D,	%o6
	udiv	%i6,	0x1F13,	%l3
	orn	%g4,	%g5,	%i5
	srlx	%i3,	0x09,	%o4
	subccc	%o1,	%g1,	%l1
	fmovsvs	%xcc,	%f23,	%f12
	taddcctv	%l5,	0x12FF,	%l6
	membar	0x56
	edge32l	%g7,	%i4,	%g6
	fbl,a	%fcc2,	loop_2464
	fbge	%fcc3,	loop_2465
	movre	%i1,	0x3F2,	%o5
	fmovsg	%icc,	%f26,	%f3
loop_2464:
	fbe,a	%fcc0,	loop_2466
loop_2465:
	movrgez	%i0,	%o2,	%o0
	movpos	%icc,	%i7,	%o3
	movrgez	%l2,	%g2,	%l0
loop_2466:
	udivcc	%o7,	0x0CCB,	%l4
	tvs	%icc,	0x4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g3,	%i2
	fandnot2s	%f21,	%f16,	%f17
	fzero	%f28
	set	0x10, %g6
	ldsha	[%l7 + %g6] 0x14,	%i6
	tge	%xcc,	0x2
	bneg,a	%xcc,	loop_2467
	fmovsle	%icc,	%f12,	%f19
	xnor	%o6,	%l3,	%g5
	umul	%g4,	%i3,	%i5
loop_2467:
	alignaddrl	%o1,	%g1,	%o4
	fand	%f20,	%f18,	%f20
	fbe	%fcc2,	loop_2468
	bge,pt	%xcc,	loop_2469
	movgu	%icc,	%l5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2468:
	xnorcc	%l6,	0x01F9,	%g7
loop_2469:
	nop
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	alignaddrl	%i4,	%g6,	%o5
	tsubcctv	%i1,	0x0019,	%i0
	tcs	%icc,	0x5
	alignaddr	%o0,	%i7,	%o2
	brz	%l2,	loop_2470
	tsubcctv	%o3,	0x1C48,	%g2
	fmul8sux16	%f16,	%f0,	%f10
	nop
	setx	loop_2471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2470:
	brgz	%o7,	loop_2472
	edge32l	%l4,	%l0,	%g3
	movcc	%xcc,	%i6,	%i2
loop_2471:
	umul	%o6,	%l3,	%g5
loop_2472:
	edge32ln	%g4,	%i3,	%i5
	nop
	setx	0xB6F26EC9307200D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fcmple16	%f6,	%f2,	%o1
	fmul8x16au	%f16,	%f5,	%f14
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%l5
	fmovrslz	%o4,	%f3,	%f3
	movrgz	%l1,	%l6,	%g7
	brgz,a	%g6,	loop_2473
	srax	%i4,	0x06,	%i1
	mulx	%o5,	0x06CB,	%i0
	fmovsleu	%icc,	%f4,	%f18
loop_2473:
	tsubcc	%o0,	%o2,	%i7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	fones	%f14
	fble,a	%fcc1,	loop_2474
	taddcctv	%o3,	%g2,	%l4
	fandnot2	%f6,	%f16,	%f6
	tl	%xcc,	0x1
loop_2474:
	nop
	set	0x54, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l0
	fpmerge	%f27,	%f23,	%f30
	tsubcc	%g3,	%i6,	%o7
	bl,a	loop_2475
	sll	%i2,	0x16,	%o6
	lduw	[%l7 + 0x18],	%g5
	movneg	%icc,	%l3,	%i3
loop_2475:
	movrlz	%g4,	%i5,	%g1
	orncc	%o1,	0x03C2,	%o4
	tl	%icc,	0x5
	tge	%xcc,	0x5
	fblg,a	%fcc3,	loop_2476
	andn	%l1,	0x07C5,	%l6
	fbo,a	%fcc2,	loop_2477
	fbe,a	%fcc1,	loop_2478
loop_2476:
	edge32ln	%g7,	%l5,	%g6
	nop
	setx	0x9425F78F104142EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_2477:
	fbule,a	%fcc2,	loop_2479
loop_2478:
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f24
	fcmpne32	%f16,	%f0,	%i4
	fbl,a	%fcc0,	loop_2480
loop_2479:
	nop
	setx	0xDA007AB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x7652D2E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f21,	%f28
	movn	%icc,	%i1,	%o5
	fbge,a	%fcc1,	loop_2481
loop_2480:
	fmul8x16	%f27,	%f14,	%f26
	pdist	%f20,	%f8,	%f22
	tcc	%xcc,	0x4
loop_2481:
	fmovrde	%o0,	%f12,	%f0
	nop
	setx	0xD06290E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x0CC8953B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f1,	%f31
	array16	%i0,	%i7,	%o2
	fmovscc	%icc,	%f11,	%f15
	movrgez	%o3,	%l2,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g2,	%l0,	%g3
	fxnor	%f0,	%f4,	%f6
	movrgez	%i6,	%o7,	%i2
	sethi	0x1DFF,	%o6
	edge32l	%l3,	%g5,	%i3
	movcs	%xcc,	%i5,	%g1
	ldx	[%l7 + 0x78],	%g4
	move	%xcc,	%o4,	%o1
	edge32	%l1,	%l6,	%l5
	xnor	%g6,	%i4,	%i1
	movre	%o5,	%o0,	%i0
	sub	%g7,	%o2,	%o3
	and	%l2,	%i7,	%g2
	nop
	setx	loop_2482,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fone	%f16
	umul	%l0,	%l4,	%i6
	tne	%xcc,	0x2
loop_2482:
	fpsub16	%f16,	%f26,	%f2
	srl	%g3,	%o7,	%i2
	movge	%xcc,	%l3,	%o6
	sdiv	%g5,	0x1337,	%i3
	taddcc	%i5,	0x051E,	%g1
	fmovrdlez	%g4,	%f4,	%f10
	sra	%o4,	%o1,	%l6
	set	0x28, %o1
	stha	%l5,	[%l7 + %o1] 0x10
	nop
	setx loop_2483, %l0, %l1
	jmpl %l1, %l1
	edge16l	%g6,	%i4,	%o5
	taddcc	%o0,	%i0,	%i1
	edge16ln	%o2,	%o3,	%l2
loop_2483:
	nop
	setx	loop_2484,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%i7,	0x1E54,	%g7
	fmuld8ulx16	%f5,	%f9,	%f2
	fzeros	%f14
loop_2484:
	array16	%g2,	%l4,	%l0
	fcmpeq16	%f26,	%f16,	%i6
	tsubcc	%o7,	%g3,	%l3
	bgu,a,pt	%icc,	loop_2485
	bg,a	%icc,	loop_2486
	udiv	%o6,	0x01D2,	%g5
	movvs	%xcc,	%i3,	%i2
loop_2485:
	srlx	%i5,	%g1,	%o4
loop_2486:
	fmul8sux16	%f22,	%f14,	%f22
	umulcc	%o1,	0x073D,	%g4
	orncc	%l5,	0x1449,	%l1
	bg,pt	%icc,	loop_2487
	edge16n	%l6,	%i4,	%g6
	brlz	%o0,	loop_2488
	xnor	%i0,	%i1,	%o5
loop_2487:
	fblg	%fcc1,	loop_2489
	fnors	%f14,	%f7,	%f8
loop_2488:
	andn	%o3,	%o2,	%i7
	movvs	%icc,	%l2,	%g7
loop_2489:
	fnor	%f16,	%f2,	%f20
	edge32n	%g2,	%l0,	%l4
	fnors	%f27,	%f0,	%f28
	brgz	%o7,	loop_2490
	fxnor	%f18,	%f6,	%f26
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g3
loop_2490:
	bneg	loop_2491
	edge8n	%l3,	%o6,	%i6
	nop
	set	0x64, %o7
	stw	%i3,	[%l7 + %o7]
	stw	%g5,	[%l7 + 0x20]
loop_2491:
	xnor	%i2,	0x18B7,	%i5
	fmovrdgez	%o4,	%f10,	%f16
	movrne	%g1,	0x3BA,	%g4
	nop
	setx	loop_2492,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xE5D4EE594C64B189,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBBAD7328E3ECFBE3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f0,	%f8
	sll	%o1,	%l5,	%l1
	smulcc	%l6,	%i4,	%g6
loop_2492:
	fmovrdgz	%i0,	%f10,	%f30
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x88,	%i1
	fxnors	%f21,	%f0,	%f19
	fxors	%f17,	%f10,	%f3
	fmovrdlz	%o5,	%f20,	%f8
	fblg	%fcc3,	loop_2493
	nop
	setx	0x328EE51AF75371CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8805A4DDE3D2509A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f8,	%f10
	movge	%icc,	%o0,	%o3
	nop
	fitos	%f13,	%f24
	fstod	%f24,	%f6
loop_2493:
	tg	%icc,	0x7
	lduw	[%l7 + 0x44],	%o2
	udivcc	%l2,	0x0E01,	%i7
	tle	%xcc,	0x1
	movl	%icc,	%g7,	%l0
	tneg	%icc,	0x2
	addc	%g2,	%l4,	%o7
	fbu	%fcc1,	loop_2494
	nop
	set	0x19, %g5
	ldsb	[%l7 + %g5],	%g3
	tgu	%xcc,	0x6
	smulcc	%o6,	0x04B0,	%i6
loop_2494:
	tge	%xcc,	0x3
	edge8l	%i3,	%g5,	%i2
	fbl	%fcc2,	loop_2495
	fmovrslz	%i5,	%f30,	%f4
	bcc,pn	%xcc,	loop_2496
	tleu	%xcc,	0x2
loop_2495:
	srlx	%l3,	0x19,	%o4
	movl	%xcc,	%g4,	%g1
loop_2496:
	movrgez	%l5,	0x151,	%o1
	taddcctv	%l1,	0x01BC,	%l6
	tpos	%icc,	0x7
	sllx	%g6,	0x04,	%i4
	fxor	%f4,	%f20,	%f6
	fand	%f10,	%f4,	%f26
	movrgz	%i1,	%i0,	%o5
	movcs	%icc,	%o3,	%o2
	tleu	%icc,	0x2
	fmovdl	%icc,	%f7,	%f14
	nop
	setx	0x6E0CF384B755D1BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x43BC48B8A9A5C990,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f28,	%f24
	tsubcc	%o0,	%i7,	%l2
	edge8n	%l0,	%g7,	%l4
	smul	%g2,	0x169D,	%g3
	andcc	%o7,	%o6,	%i3
	tneg	%icc,	0x4
	tg	%xcc,	0x2
	prefetch	[%l7 + 0x1C],	 0x1
	bvs,a,pt	%xcc,	loop_2497
	ld	[%l7 + 0x40],	%f21
	srl	%i6,	0x1A,	%g5
	smul	%i5,	0x09C5,	%l3
loop_2497:
	sdivcc	%o4,	0x0411,	%i2
	edge16l	%g1,	%g4,	%o1
	tleu	%icc,	0x4
	sllx	%l5,	%l1,	%g6
	bgu,a,pn	%icc,	loop_2498
	edge16	%i4,	%l6,	%i1
	tsubcc	%o5,	0x06F2,	%o3
	movrgez	%i0,	0x2D8,	%o2
loop_2498:
	fxnor	%f8,	%f16,	%f4
	alignaddrl	%i7,	%o0,	%l2
	orn	%l0,	%l4,	%g2
	edge32l	%g7,	%o7,	%g3
	movpos	%icc,	%o6,	%i3
	movn	%icc,	%g5,	%i6
	taddcc	%l3,	0x1A6C,	%o4
	tcs	%xcc,	0x0
	srl	%i2,	%i5,	%g4
	movrlez	%g1,	0x1F7,	%l5
	xor	%o1,	0x12DF,	%g6
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x0c,	%l1
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
	smul	%i4,	%i1,	%o5
	movcs	%xcc,	%o3,	%l6
	sir	0x048C
	bn,a,pt	%icc,	loop_2499
	xorcc	%o2,	%i7,	%o0
	wr	%g0,	0x0c,	%asi
	stxa	%i0,	[%l7 + 0x08] %asi
loop_2499:
	fabss	%f3,	%f21
	alignaddrl	%l2,	%l4,	%l0
	taddcctv	%g7,	%o7,	%g3
	fbe	%fcc1,	loop_2500
	fxors	%f15,	%f20,	%f1
	fmovsgu	%icc,	%f23,	%f31
	popc	%g2,	%i3
loop_2500:
	xnorcc	%g5,	%i6,	%o6
	fpsub16s	%f13,	%f31,	%f1
	movpos	%icc,	%l3,	%o4
	brlez	%i5,	loop_2501
	edge8n	%i2,	%g4,	%l5
	bneg,a,pt	%xcc,	loop_2502
	xnorcc	%g1,	0x0B6D,	%o1
loop_2501:
	bcs,a,pn	%xcc,	loop_2503
	lduh	[%l7 + 0x7A],	%g6
loop_2502:
	tcs	%xcc,	0x6
	sra	%i4,	%l1,	%o5
loop_2503:
	fmovdneg	%icc,	%f10,	%f22
	nop
	set	0x67, %o3
	ldub	[%l7 + %o3],	%i1
	fxor	%f28,	%f12,	%f4
	srlx	%o3,	%l6,	%i7
	addccc	%o0,	%o2,	%i0
	fnegs	%f22,	%f15
	fmovsge	%xcc,	%f27,	%f12
	subccc	%l2,	%l4,	%g7
	tsubcc	%l0,	0x0874,	%o7
	movrlez	%g3,	%i3,	%g5
	movvs	%icc,	%g2,	%i6
	andn	%l3,	0x07B7,	%o6
	fnands	%f10,	%f10,	%f11
	movvc	%xcc,	%i5,	%i2
	tl	%icc,	0x3
	nop
	setx	0xA998FEFA70579BFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	edge16ln	%o4,	%g4,	%g1
	fbge	%fcc1,	loop_2504
	movvc	%icc,	%l5,	%o1
	subc	%i4,	%l1,	%g6
	andncc	%i1,	%o5,	%l6
loop_2504:
	movl	%icc,	%o3,	%i7
	movn	%icc,	%o2,	%o0
	ba,a	%icc,	loop_2505
	fbule,a	%fcc3,	loop_2506
	udivx	%i0,	0x1D96,	%l4
	fmovrdlez	%l2,	%f6,	%f28
loop_2505:
	movn	%xcc,	%g7,	%o7
loop_2506:
	ble	%icc,	loop_2507
	tneg	%xcc,	0x7
	bcs,a,pn	%icc,	loop_2508
	tgu	%icc,	0x4
loop_2507:
	movleu	%icc,	%g3,	%l0
	udivx	%i3,	0x0DFA,	%g2
loop_2508:
	fbl,a	%fcc0,	loop_2509
	movpos	%icc,	%g5,	%i6
	edge8ln	%l3,	%i5,	%i2
	set	0x38, %i5
	swapa	[%l7 + %i5] 0x80,	%o6
loop_2509:
	ld	[%l7 + 0x1C],	%f31
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xea,	%o4
	mulx	%g4,	%g1,	%o1
	be,a	loop_2510
	fmuld8sux16	%f27,	%f28,	%f20
	membar	0x2E
	fbl,a	%fcc3,	loop_2511
loop_2510:
	array16	%l5,	%i4,	%l1
	fornot2s	%f28,	%f2,	%f14
	xnor	%g6,	%i1,	%l6
loop_2511:
	tneg	%xcc,	0x5
	sethi	0x1AA1,	%o3
	mulscc	%o5,	0x0AF6,	%o2
	xnorcc	%i7,	0x1ECC,	%i0
	tsubcc	%o0,	0x04C6,	%l4
	alignaddr	%g7,	%o7,	%l2
	movl	%icc,	%g3,	%l0
	fbge,a	%fcc2,	loop_2512
	flush	%l7 + 0x1C
	umulcc	%i3,	0x08A8,	%g5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g2
loop_2512:
	stbar
	brz,a	%l3,	loop_2513
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%i5
	tsubcctv	%i2,	0x1400,	%o4
	fmul8x16au	%f27,	%f25,	%f24
loop_2513:
	fmovsne	%icc,	%f3,	%f10
	movle	%xcc,	%g4,	%o6
	bge	%xcc,	loop_2514
	bcc,a,pn	%xcc,	loop_2515
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%g1
	fbug,a	%fcc3,	loop_2516
loop_2514:
	nop
	setx loop_2517, %l0, %l1
	jmpl %l1, %o1
loop_2515:
	bcc,a	%xcc,	loop_2518
	brgez,a	%i4,	loop_2519
loop_2516:
	tleu	%icc,	0x4
loop_2517:
	addccc	%l5,	%l1,	%i1
loop_2518:
	fsrc2	%f16,	%f22
loop_2519:
	orn	%g6,	%l6,	%o5
	fxnors	%f26,	%f16,	%f29
	movrlz	%o2,	%i7,	%o3
	tge	%xcc,	0x1
	edge8l	%i0,	%o0,	%l4
	fbe	%fcc1,	loop_2520
	movl	%icc,	%o7,	%l2
	fbl	%fcc0,	loop_2521
	st	%f21,	[%l7 + 0x08]
loop_2520:
	umul	%g7,	0x0204,	%l0
	bvs,a,pn	%xcc,	loop_2522
loop_2521:
	nop
	setx	0xC39B5EF2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x13781988,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f19,	%f7
	andcc	%i3,	0x137A,	%g5
	addc	%i6,	%g2,	%g3
loop_2522:
	edge8l	%i5,	%l3,	%o4
	fxnor	%f16,	%f6,	%f14
	edge32	%i2,	%o6,	%g1
	st	%f11,	[%l7 + 0x44]
	srlx	%o1,	%i4,	%l5
	subccc	%l1,	0x13A9,	%g4
	tle	%icc,	0x7
	fpack32	%f14,	%f30,	%f14
	subcc	%g6,	%i1,	%o5
	movvs	%xcc,	%o2,	%i7
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f6
	fmovsn	%xcc,	%f25,	%f5
	set	0x70, %l3
	lduwa	[%l7 + %l3] 0x88,	%l6
	mova	%icc,	%i0,	%o0
	andcc	%o3,	0x0C8A,	%l4
	movrne	%l2,	0x252,	%o7
	tsubcctv	%g7,	%i3,	%g5
	orncc	%l0,	0x1DAC,	%i6
	array8	%g3,	%i5,	%g2
	tvc	%icc,	0x6
	movcc	%xcc,	%o4,	%i2
	membar	0x70
	udivcc	%l3,	0x062B,	%g1
	edge8ln	%o6,	%o1,	%l5
	fbn	%fcc2,	loop_2523
	srax	%i4,	%g4,	%g6
	fpsub16	%f18,	%f14,	%f4
	taddcc	%i1,	%o5,	%l1
loop_2523:
	tge	%icc,	0x1
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f30
	nop
	setx	0x09464BC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x8695DE4A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f19,	%f0
	fornot1s	%f8,	%f22,	%f26
	subcc	%i7,	%o2,	%l6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i0
	ldub	[%l7 + 0x66],	%o0
	nop
	fitos	%f24,	%f16
	edge32n	%l4,	%l2,	%o3
	fba,a	%fcc3,	loop_2524
	tn	%xcc,	0x4
	edge8ln	%o7,	%i3,	%g5
	move	%icc,	%g7,	%i6
loop_2524:
	fcmpne32	%f2,	%f2,	%g3
	sir	0x1E6D
	stw	%l0,	[%l7 + 0x54]
	sdiv	%i5,	0x00C6,	%o4
	sll	%i2,	%l3,	%g2
	bleu,a	loop_2525
	fbug	%fcc1,	loop_2526
	sub	%o6,	%g1,	%o1
	array16	%i4,	%g4,	%g6
loop_2525:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2526:
	fmovrde	%i1,	%f30,	%f30
	mulscc	%o5,	0x12CB,	%l1
	subccc	%i7,	%l5,	%o2
	edge8ln	%l6,	%o0,	%i0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%l4
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x14,	 0x3
	addc	%l2,	0x1662,	%i3
	fbug	%fcc2,	loop_2527
	fmovrsgz	%g5,	%f23,	%f22
	wr	%g0,	0x19,	%asi
	stba	%g7,	[%l7 + 0x73] %asi
loop_2527:
	ldsb	[%l7 + 0x6C],	%i6
	nop
	setx loop_2528, %l0, %l1
	jmpl %l1, %g3
	xorcc	%o7,	%l0,	%i5
	smulcc	%i2,	0x16E3,	%l3
	fands	%f25,	%f12,	%f24
loop_2528:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o4
	bcs,a	%icc,	loop_2529
	edge8ln	%o6,	%g2,	%o1
	sethi	0x11DA,	%i4
	subccc	%g4,	%g6,	%i1
loop_2529:
	nop
	fitos	%f5,	%f1
	fstox	%f1,	%f28
	addccc	%o5,	%l1,	%i7
	or	%l5,	%g1,	%l6
	ld	[%l7 + 0x48],	%f2
	tleu	%xcc,	0x7
	fbg	%fcc0,	loop_2530
	tleu	%xcc,	0x1
	orn	%o0,	%i0,	%l4
	fmul8sux16	%f10,	%f6,	%f6
loop_2530:
	mulscc	%o3,	0x014E,	%l2
	movcc	%xcc,	%i3,	%o2
	fpsub32s	%f15,	%f5,	%f26
	tsubcc	%g5,	0x05E0,	%g7
	movneg	%xcc,	%i6,	%o7
	mova	%icc,	%l0,	%g3
	fbuge	%fcc2,	loop_2531
	bcs,a	loop_2532
	fmovrde	%i5,	%f6,	%f20
	fpadd32s	%f19,	%f6,	%f3
loop_2531:
	xor	%i2,	%o4,	%o6
loop_2532:
	taddcc	%l3,	%o1,	%g2
	fpsub16s	%f20,	%f27,	%f24
	movneg	%xcc,	%g4,	%i4
	movge	%xcc,	%i1,	%o5
	stbar
	edge32n	%l1,	%g6,	%l5
	sethi	0x0CB2,	%i7
	sdiv	%g1,	0x14BD,	%l6
	movvs	%icc,	%i0,	%l4
	prefetch	[%l7 + 0x20],	 0x0
	edge32ln	%o3,	%l2,	%i3
	srl	%o0,	%g5,	%o2
	movrne	%g7,	0x0E0,	%i6
	srlx	%o7,	%g3,	%i5
	tsubcc	%i2,	%l0,	%o6
	fmovrdne	%l3,	%f24,	%f30
	edge32n	%o1,	%g2,	%o4
	subc	%g4,	%i1,	%o5
	fnot1	%f18,	%f10
	fcmpgt32	%f12,	%f24,	%i4
	bcs,pn	%icc,	loop_2533
	taddcctv	%g6,	%l5,	%l1
	movle	%xcc,	%i7,	%l6
	fpadd16	%f26,	%f30,	%f28
loop_2533:
	fsrc2	%f28,	%f10
	movre	%g1,	0x3A1,	%i0
	array32	%l4,	%o3,	%l2
	ldub	[%l7 + 0x40],	%o0
	movrne	%i3,	%g5,	%g7
	taddcc	%i6,	0x071D,	%o7
	tn	%xcc,	0x6
	fxnor	%f22,	%f0,	%f4
	movpos	%icc,	%o2,	%g3
	tcc	%xcc,	0x4
	nop
	setx	0x805D63C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	smulcc	%i2,	0x0765,	%l0
	addcc	%i5,	%o6,	%l3
	tcs	%xcc,	0x2
	tneg	%icc,	0x2
	movg	%icc,	%o1,	%o4
	addcc	%g2,	0x104F,	%g4
	bneg,pn	%icc,	loop_2534
	swap	[%l7 + 0x40],	%i1
	xor	%o5,	%g6,	%l5
	orn	%l1,	0x06FE,	%i4
loop_2534:
	fnand	%f0,	%f4,	%f14
	tgu	%icc,	0x5
	fba,a	%fcc0,	loop_2535
	nop
	fitos	%f10,	%f27
	fstoi	%f27,	%f10
	xor	%l6,	0x1EBC,	%g1
	brgez	%i0,	loop_2536
loop_2535:
	brgez,a	%l4,	loop_2537
	xnor	%o3,	%i7,	%l2
	subccc	%o0,	%i3,	%g7
loop_2536:
	fble,a	%fcc0,	loop_2538
loop_2537:
	fpsub16	%f0,	%f4,	%f16
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g5
loop_2538:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i6
	movg	%icc,	%o7,	%g3
	nop
	setx	0x5A54166B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x7767A9A3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f22,	%f7
	fmovspos	%xcc,	%f30,	%f5
	tleu	%xcc,	0x1
	fmovdvs	%icc,	%f20,	%f0
	be	%xcc,	loop_2539
	tl	%xcc,	0x1
	fsrc1s	%f4,	%f24
	fmovrslz	%i2,	%f0,	%f8
loop_2539:
	prefetch	[%l7 + 0x60],	 0x2
	fcmple16	%f14,	%f16,	%o2
	addc	%l0,	0x0E46,	%i5
	fmovdle	%xcc,	%f16,	%f13
	addc	%l3,	0x0115,	%o1
	stb	%o4,	[%l7 + 0x45]
	array32	%g2,	%o6,	%g4
	fnegs	%f10,	%f6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i1,	%o5
	fmovsgu	%xcc,	%f24,	%f29
	fmovdne	%xcc,	%f4,	%f9
	tg	%icc,	0x6
	orcc	%l5,	0x1F27,	%g6
	andcc	%i4,	0x03E5,	%l6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	addcc	%l1,	%i0,	%g1
	brlez	%l4,	loop_2540
	sll	%o3,	%l2,	%o0
	andn	%i7,	%g7,	%g5
	sir	0x1DD9
loop_2540:
	fbu	%fcc1,	loop_2541
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f8
	subccc	%i3,	0x1AA2,	%o7
	sdivcc	%i6,	0x165E,	%i2
loop_2541:
	fbge	%fcc0,	loop_2542
	fbul,a	%fcc2,	loop_2543
	srl	%o2,	0x1D,	%g3
	addc	%i5,	%l3,	%l0
loop_2542:
	tvs	%icc,	0x5
loop_2543:
	movrlz	%o1,	0x1E3,	%g2
	tvc	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldsw	[%l7 + 0x40],	%o4
	fnot2	%f30,	%f12
	ld	[%l7 + 0x18],	%f26
	fpadd16	%f22,	%f12,	%f28
	movvs	%icc,	%g4,	%i1
	fbge,a	%fcc1,	loop_2544
	movge	%xcc,	%o6,	%l5
	smulcc	%o5,	%i4,	%l6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2544:
	xnor	%l1,	%g6,	%i0
	nop
	setx	0xAAA8F4667753D653,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x78A05CC0E105A811,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f16,	%f30
	prefetch	[%l7 + 0x28],	 0x0
	edge32ln	%g1,	%o3,	%l4
	movleu	%xcc,	%l2,	%o0
	movleu	%icc,	%i7,	%g7
	tn	%xcc,	0x6
	fmovdgu	%xcc,	%f16,	%f27
	tvs	%xcc,	0x3
	taddcctv	%g5,	%o7,	%i3
	fmovrdlz	%i6,	%f20,	%f10
	udiv	%o2,	0x12DF,	%i2
	nop
	fitos	%f11,	%f14
	fstox	%f14,	%f8
	fone	%f10
	umulcc	%i5,	%g3,	%l0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x2B] %asi,	%l3
	movneg	%icc,	%o1,	%o4
	ba,a	%xcc,	loop_2545
	orncc	%g4,	0x0A3E,	%g2
	stx	%i1,	[%l7 + 0x20]
	fmovdge	%icc,	%f0,	%f6
loop_2545:
	movrgz	%o6,	0x222,	%o5
	fmovdl	%icc,	%f19,	%f8
	movg	%xcc,	%i4,	%l6
	fabsd	%f8,	%f8
	movneg	%icc,	%l1,	%l5
	xnor	%i0,	%g1,	%o3
	pdist	%f14,	%f18,	%f4
	set	0x60, %g7
	lduwa	[%l7 + %g7] 0x0c,	%g6
	sir	0x0644
	tn	%xcc,	0x6
	tvc	%xcc,	0x6
	membar	0x75
	fblg,a	%fcc2,	loop_2546
	te	%xcc,	0x6
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2546:
	umul	%l4,	%o0,	%l2
	fmovsne	%icc,	%f27,	%f17
	edge8l	%g7,	%i7,	%g5
	movne	%icc,	%i3,	%i6
	fornot2	%f30,	%f26,	%f6
	edge8ln	%o7,	%i2,	%i5
	edge8n	%g3,	%o2,	%l3
	xnorcc	%l0,	0x144F,	%o1
	fnor	%f24,	%f6,	%f8
	fbe,a	%fcc1,	loop_2547
	bg,a	%icc,	loop_2548
	fabsd	%f14,	%f4
	mova	%icc,	%g4,	%g2
loop_2547:
	xorcc	%i1,	%o6,	%o5
loop_2548:
	stb	%o4,	[%l7 + 0x6C]
	brlz	%l6,	loop_2549
	addccc	%i4,	%l1,	%i0
	tgu	%xcc,	0x1
	fbug	%fcc2,	loop_2550
loop_2549:
	bg,a,pn	%icc,	loop_2551
	ld	[%l7 + 0x58],	%f12
	mulscc	%g1,	%o3,	%l5
loop_2550:
	tsubcc	%l4,	0x0F06,	%g6
loop_2551:
	bcs	%icc,	loop_2552
	tgu	%icc,	0x2
	fnot2s	%f19,	%f24
	fmovdcc	%xcc,	%f18,	%f31
loop_2552:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x3A] %asi,	%l2
	nop
	setx	loop_2553,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%o0,	%i7,	%g7
	brnz	%i3,	loop_2554
	bleu,a,pt	%icc,	loop_2555
loop_2553:
	bg,a	loop_2556
	tne	%icc,	0x5
loop_2554:
	subc	%g5,	%o7,	%i6
loop_2555:
	tg	%icc,	0x4
loop_2556:
	add	%i2,	%g3,	%i5
	movrlez	%l3,	0x362,	%o2
	taddcctv	%o1,	%g4,	%g2
	tsubcctv	%l0,	%i1,	%o5
	set	0x50, %i7
	prefetcha	[%l7 + %i7] 0x11,	 0x3
	tleu	%icc,	0x6
	te	%xcc,	0x0
	membar	0x61
	nop
	setx	0x41FCC00F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x3986686D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f11,	%f15
	stw	%o4,	[%l7 + 0x34]
	array32	%l6,	%l1,	%i0
	srax	%g1,	0x10,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x70],	%l4
	for	%f2,	%f30,	%f28
	movleu	%xcc,	%o3,	%g6
	mulscc	%l2,	%o0,	%l4
	be,pt	%xcc,	loop_2557
	subcc	%i7,	%g7,	%i3
	edge16	%g5,	%o7,	%i2
	addccc	%i6,	0x13FA,	%g3
loop_2557:
	edge8n	%l3,	%o2,	%o1
	edge8ln	%i5,	%g4,	%l0
	and	%g2,	0x1ED0,	%i1
	sdivx	%o5,	0x06E7,	%o4
	movg	%icc,	%l6,	%l1
	sdiv	%o6,	0x064C,	%g1
	bneg,pn	%icc,	loop_2558
	addc	%i0,	0x14FE,	%l5
	array32	%i4,	%o3,	%l2
	fpsub16	%f10,	%f6,	%f12
loop_2558:
	edge16	%g6,	%l4,	%i7
	tg	%icc,	0x3
	sllx	%o0,	0x1B,	%i3
	movre	%g7,	%g5,	%o7
	tgu	%xcc,	0x7
	ld	[%l7 + 0x44],	%f2
	smulcc	%i6,	%i2,	%g3
	ldd	[%l7 + 0x38],	%f20
	srax	%l3,	0x05,	%o2
	nop
	fitos	%f3,	%f24
	fstox	%f24,	%f28
	xorcc	%o1,	%g4,	%l0
	tgu	%xcc,	0x4
	fnand	%f16,	%f16,	%f4
	andncc	%i5,	%i1,	%g2
	and	%o5,	%l6,	%o4
	fbo,a	%fcc2,	loop_2559
	sub	%o6,	0x0DC5,	%l1
	edge8l	%g1,	%i0,	%i4
	movle	%xcc,	%o3,	%l2
loop_2559:
	fpadd16	%f10,	%f28,	%f18
	flush	%l7 + 0x64
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g6,	%l4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%o0
	subcc	%i7,	0x183D,	%g7
	orncc	%g5,	%i3,	%i6
	wr	%g0,	0x2b,	%asi
	stwa	%o7,	[%l7 + 0x7C] %asi
	membar	#Sync
	alignaddr	%g3,	%i2,	%l3
	fbn,a	%fcc2,	loop_2560
	movrgez	%o1,	0x197,	%o2
	fmovdne	%icc,	%f19,	%f30
	xnorcc	%g4,	%i5,	%i1
loop_2560:
	movvs	%xcc,	%l0,	%o5
	mova	%xcc,	%g2,	%l6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x34] %asi,	%o4
	nop
	setx	loop_2561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%l1,	%g1,	%i0
	movcs	%icc,	%o6,	%i4
	fmovdn	%xcc,	%f28,	%f25
loop_2561:
	nop
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%l2
	tvs	%xcc,	0x1
	or	%g6,	%l4,	%o3
	tleu	%xcc,	0x2
	fmovscs	%icc,	%f1,	%f17
	taddcctv	%l5,	0x02F0,	%o0
	ble	%icc,	loop_2562
	nop
	setx	0xB2E25B05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x896E21C0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f11,	%f18
	fcmple16	%f22,	%f24,	%g7
	fcmpne16	%f16,	%f6,	%g5
loop_2562:
	edge32n	%i3,	%i6,	%i7
	fpadd32s	%f26,	%f18,	%f3
	fcmpgt16	%f2,	%f22,	%o7
	fcmpgt32	%f18,	%f6,	%i2
	fmovsg	%icc,	%f9,	%f22
	movleu	%xcc,	%g3,	%l3
	array16	%o2,	%o1,	%i5
	movre	%g4,	0x148,	%l0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%o5
	fpadd16s	%f30,	%f30,	%f12
	edge32l	%g2,	%o4,	%l6
	umul	%l1,	%g1,	%i0
	fmovsgu	%icc,	%f25,	%f8
	bge,a,pn	%xcc,	loop_2563
	bshuffle	%f20,	%f6,	%f20
	tpos	%xcc,	0x1
	brlez	%i4,	loop_2564
loop_2563:
	fmovdgu	%xcc,	%f13,	%f12
	nop
	setx	0xE5B1237664C90A5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x45082A4DB606D4B1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f10,	%f30
	taddcctv	%l2,	%g6,	%l4
loop_2564:
	tg	%icc,	0x1
	fblg	%fcc1,	loop_2565
	movpos	%xcc,	%o3,	%o6
	mulx	%l5,	0x0484,	%o0
	edge32ln	%g7,	%g5,	%i6
loop_2565:
	umulcc	%i3,	0x0626,	%i7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i2
	tl	%icc,	0x7
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x0C] %asi,	%o7
	fpsub32	%f6,	%f8,	%f12
	fnands	%f5,	%f28,	%f17
	sir	0x1479
	srax	%g3,	0x09,	%l3
	sdivcc	%o2,	0x166D,	%i5
	subc	%g4,	0x0B89,	%l0
	sdivcc	%o1,	0x108F,	%o5
	fands	%f9,	%f28,	%f1
	call	loop_2566
	xnor	%i1,	%g2,	%o4
	movvs	%icc,	%l1,	%l6
	movrgez	%i0,	%i4,	%g1
loop_2566:
	popc	0x05A7,	%g6
	fors	%f13,	%f0,	%f19
	tleu	%xcc,	0x1
	fbl,a	%fcc3,	loop_2567
	fpmerge	%f19,	%f31,	%f10
	fnot1	%f16,	%f30
	movneg	%icc,	%l4,	%l2
loop_2567:
	edge32	%o6,	%o3,	%l5
	and	%o0,	%g7,	%i6
	fbuge,a	%fcc1,	loop_2568
	tsubcc	%i3,	%g5,	%i7
	fmovdne	%icc,	%f8,	%f11
	edge32n	%i2,	%g3,	%l3
loop_2568:
	fmovrdlez	%o2,	%f22,	%f26
	umul	%i5,	%o7,	%g4
	edge16n	%l0,	%o1,	%i1
	movcs	%icc,	%o5,	%o4
	movvc	%xcc,	%g2,	%l1
	sdivx	%i0,	0x094D,	%i4
	ba,a,pn	%xcc,	loop_2569
	ldx	[%l7 + 0x50],	%g1
	bneg,pt	%icc,	loop_2570
	movg	%xcc,	%l6,	%l4
loop_2569:
	te	%icc,	0x4
	wr	%g0,	0x89,	%asi
	stba	%g6,	[%l7 + 0x7B] %asi
loop_2570:
	movcc	%icc,	%l2,	%o6
	fbo,a	%fcc3,	loop_2571
	brgez	%o3,	loop_2572
	orncc	%l5,	%o0,	%g7
	srlx	%i6,	%i3,	%g5
loop_2571:
	udivx	%i7,	0x1783,	%g3
loop_2572:
	tneg	%icc,	0x4
	andcc	%l3,	0x078F,	%i2
	nop
	setx	0x8955A4FD30268CC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD93DB71B86CC5C12,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f28,	%f4
	srlx	%o2,	0x1E,	%o7
	andn	%i5,	%l0,	%g4
	addcc	%o1,	0x078B,	%i1
	or	%o4,	0x00B1,	%o5
	tpos	%xcc,	0x1
	movl	%xcc,	%l1,	%i0
	nop
	setx	0xE4897FC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f20
	fmovsvc	%xcc,	%f10,	%f19
	bleu	%icc,	loop_2573
	tl	%xcc,	0x4
	movcc	%xcc,	%g2,	%i4
	edge8l	%g1,	%l6,	%l4
loop_2573:
	fble	%fcc3,	loop_2574
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f10
	fxtos	%f10,	%f2
	tvc	%icc,	0x5
	sethi	0x00F6,	%l2
loop_2574:
	mulscc	%g6,	%o6,	%l5
	and	%o3,	0x1EC4,	%o0
	array8	%i6,	%i3,	%g7
	fmovsvc	%icc,	%f6,	%f26
	mulx	%i7,	0x1EE3,	%g3
	fmovdle	%xcc,	%f31,	%f29
	movvs	%xcc,	%g5,	%i2
	subccc	%o2,	0x1178,	%o7
	smulcc	%i5,	%l3,	%g4
	movrne	%l0,	0x091,	%i1
	fmovrde	%o1,	%f0,	%f30
	stw	%o4,	[%l7 + 0x24]
	wr	%g0,	0x2f,	%asi
	stba	%l1,	[%l7 + 0x66] %asi
	membar	#Sync
	tcs	%icc,	0x6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o5
	movn	%icc,	%i0,	%g2
	fmovsvs	%xcc,	%f18,	%f26
	sra	%i4,	%g1,	%l4
	andcc	%l6,	0x05BA,	%l2
	edge32	%g6,	%l5,	%o6
	fbuge	%fcc2,	loop_2575
	ta	%xcc,	0x7
	fpsub32	%f30,	%f28,	%f12
	te	%icc,	0x5
loop_2575:
	subcc	%o3,	0x18E6,	%o0
	xor	%i3,	%i6,	%i7
	membar	0x56
	brlez,a	%g3,	loop_2576
	brgez,a	%g5,	loop_2577
	andn	%g7,	%o2,	%o7
	tn	%xcc,	0x6
loop_2576:
	ldsw	[%l7 + 0x3C],	%i5
loop_2577:
	nop
	setx	0x5F1F813C1D905C61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB6575ECF1E2B1E0B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f10,	%f10
	stb	%l3,	[%l7 + 0x36]
	array8	%i2,	%g4,	%l0
	fpadd32s	%f25,	%f31,	%f18
	smulcc	%o1,	0x080A,	%i1
	fbuge,a	%fcc0,	loop_2578
	fmuld8ulx16	%f17,	%f0,	%f10
	bleu,a	loop_2579
	movvc	%icc,	%l1,	%o4
loop_2578:
	movleu	%icc,	%i0,	%o5
	taddcc	%g2,	0x08C2,	%i4
loop_2579:
	tleu	%xcc,	0x7
	fmovrse	%l4,	%f13,	%f3
	movleu	%xcc,	%g1,	%l6
	movneg	%xcc,	%g6,	%l5
	fbue	%fcc0,	loop_2580
	tg	%xcc,	0x4
	flush	%l7 + 0x28
	edge32ln	%l2,	%o3,	%o0
loop_2580:
	fba	%fcc2,	loop_2581
	alignaddrl	%o6,	%i6,	%i3
	movvc	%xcc,	%i7,	%g3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
loop_2581:
	bpos,a,pt	%icc,	loop_2582
	bne,a	loop_2583
	sir	0x13D9
	addccc	%g5,	0x08B7,	%o7
loop_2582:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%i5,	[%l7 + 0x78] %asi
loop_2583:
	fbe,a	%fcc3,	loop_2584
	movleu	%xcc,	%l3,	%i2
	bn,a,pt	%icc,	loop_2585
	brlz	%g4,	loop_2586
loop_2584:
	nop
	setx	loop_2587,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%l0,	0x0BD6,	%o1
loop_2585:
	brz,a	%i1,	loop_2588
loop_2586:
	edge16n	%l1,	%o2,	%o4
loop_2587:
	ldx	[%l7 + 0x30],	%o5
	movg	%xcc,	%g2,	%i4
loop_2588:
	movvs	%icc,	%l4,	%i0
	edge32l	%l6,	%g6,	%l5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x52] %asi,	%g1
	subccc	%l2,	0x0D62,	%o0
	fbu,a	%fcc2,	loop_2589
	edge32n	%o6,	%o3,	%i6
	fmovrdgez	%i7,	%f12,	%f4
	orcc	%i3,	%g7,	%g3
loop_2589:
	xnor	%o7,	%i5,	%l3
	sethi	0x0839,	%i2
	fmovsgu	%xcc,	%f8,	%f14
	brgz	%g4,	loop_2590
	smul	%g5,	0x180D,	%o1
	tgu	%icc,	0x3
	udivx	%l0,	0x0FAD,	%i1
loop_2590:
	umulcc	%l1,	%o4,	%o5
	taddcctv	%g2,	0x1D64,	%o2
	addccc	%i4,	%l4,	%l6
	tn	%xcc,	0x5
	ldstub	[%l7 + 0x76],	%g6
	fornot1s	%f11,	%f22,	%f11
	membar	0x70
	movn	%icc,	%l5,	%g1
	tn	%icc,	0x3
	tsubcc	%i0,	0x149E,	%l2
	ba,a	%xcc,	loop_2591
	fzeros	%f11
	tle	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2591:
	stx	%o0,	[%l7 + 0x30]
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o6
	tcs	%icc,	0x6
	tcc	%icc,	0x5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x88
	tcc	%xcc,	0x4
	ldsh	[%l7 + 0x66],	%i6
	fmuld8sux16	%f5,	%f11,	%f20
	tle	%xcc,	0x6
	edge16l	%i7,	%i3,	%g7
	ldsw	[%l7 + 0x7C],	%o3
	fmovscc	%xcc,	%f1,	%f24
	tg	%icc,	0x5
	umul	%g3,	0x0925,	%i5
	fmovdpos	%icc,	%f10,	%f21
	fmul8x16al	%f3,	%f22,	%f22
	bneg	loop_2592
	edge32n	%l3,	%o7,	%g4
	edge32n	%g5,	%i2,	%o1
	subccc	%i1,	0x040E,	%l1
loop_2592:
	fmovda	%icc,	%f13,	%f7
	smul	%o4,	%o5,	%g2
	or	%l0,	0x093D,	%i4
	addccc	%o2,	%l6,	%g6
	edge32n	%l5,	%g1,	%l4
	edge8ln	%l2,	%o0,	%i0
	movrne	%i6,	%o6,	%i3
	brlz,a	%g7,	loop_2593
	or	%i7,	0x0406,	%g3
	subcc	%o3,	0x0879,	%l3
	subccc	%i5,	%o7,	%g5
loop_2593:
	movrgz	%i2,	0x11C,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o1,	%l1,	%i1
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%o4
	edge16ln	%g2,	%l0,	%o5
	sdivx	%i4,	0x1F6C,	%o2
	movvc	%xcc,	%l6,	%l5
	movrlz	%g6,	0x3C3,	%g1
	fbu,a	%fcc1,	loop_2594
	nop
	setx	0xF05D293E6E335C23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x19218EF2555E6567,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f2,	%f12
	edge16ln	%l2,	%o0,	%l4
	move	%icc,	%i0,	%i6
loop_2594:
	alignaddrl	%o6,	%g7,	%i3
	fpsub16	%f6,	%f18,	%f14
	fornot1s	%f26,	%f7,	%f2
	nop
	setx	0xC072A77B,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	tneg	%xcc,	0x2
	bg,a	%xcc,	loop_2595
	andn	%i7,	%g3,	%o3
	fpadd32s	%f31,	%f8,	%f25
	tg	%icc,	0x6
loop_2595:
	lduw	[%l7 + 0x40],	%i5
	mova	%xcc,	%l3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f6,	%f29
	bne	loop_2596
	fnegd	%f18,	%f28
	tcs	%xcc,	0x1
	xorcc	%g5,	%i2,	%o1
loop_2596:
	udivcc	%l1,	0x03EF,	%g4
	addc	%o4,	0x1AE4,	%g2
	ldub	[%l7 + 0x47],	%i1
	te	%xcc,	0x0
	edge16n	%o5,	%l0,	%i4
	orncc	%l6,	%l5,	%o2
	movrlez	%g1,	%l2,	%g6
	movvc	%icc,	%l4,	%o0
	sra	%i6,	%i0,	%g7
	movgu	%icc,	%o6,	%i3
	fbug	%fcc2,	loop_2597
	sdivcc	%g3,	0x1417,	%o3
	tn	%icc,	0x7
	fmovdgu	%xcc,	%f28,	%f14
loop_2597:
	sub	%i5,	%l3,	%i7
	fbule	%fcc1,	loop_2598
	prefetch	[%l7 + 0x40],	 0x0
	tsubcctv	%g5,	%i2,	%o1
	smul	%l1,	%g4,	%o7
loop_2598:
	tcc	%icc,	0x7
	tn	%xcc,	0x2
	smul	%g2,	0x0BC2,	%o4
	tpos	%xcc,	0x2
	movgu	%xcc,	%o5,	%i1
	edge8n	%i4,	%l6,	%l0
	fpack32	%f8,	%f20,	%f10
	sra	%o2,	0x19,	%g1
	smulcc	%l2,	0x1123,	%l5
	nop
	fitod	%f7,	%f20
	bgu,a,pt	%icc,	loop_2599
	edge8	%g6,	%o0,	%l4
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f20
	fxtos	%f20,	%f11
	mulscc	%i0,	0x08AD,	%i6
loop_2599:
	be,pn	%xcc,	loop_2600
	add	%g7,	%i3,	%g3
	fpackfix	%f22,	%f7
	tneg	%icc,	0x0
loop_2600:
	sra	%o3,	0x16,	%o6
	movcc	%icc,	%l3,	%i7
	edge16	%g5,	%i2,	%o1
	xor	%l1,	0x1EE9,	%i5
	edge8ln	%o7,	%g4,	%g2
	array16	%o4,	%i1,	%i4
	ldd	[%l7 + 0x20],	%i6
	tgu	%xcc,	0x5
	and	%l0,	%o2,	%g1
	array16	%l2,	%o5,	%g6
	fmovrdgez	%o0,	%f24,	%f8
	ldx	[%l7 + 0x48],	%l4
	andcc	%l5,	0x1E52,	%i0
	fandnot2	%f0,	%f8,	%f24
	add	%i6,	%g7,	%g3
	sllx	%i3,	%o3,	%l3
	movrgez	%o6,	%g5,	%i7
	ta	%icc,	0x7
	add	%i2,	%l1,	%o1
	edge16	%i5,	%g4,	%o7
	tpos	%xcc,	0x6
	edge32ln	%g2,	%i1,	%i4
	subc	%o4,	0x02AB,	%l0
	movg	%icc,	%l6,	%g1
	bcc,pn	%icc,	loop_2601
	fmovdne	%icc,	%f25,	%f17
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x3A] %asi,	%o2
loop_2601:
	xorcc	%o5,	%l2,	%g6
	movvc	%icc,	%l4,	%o0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x28] %asi,	%i0
	fpack16	%f26,	%f13
	xorcc	%l5,	0x1996,	%i6
	fmovsneg	%icc,	%f7,	%f22
	movg	%icc,	%g3,	%g7
	xor	%o3,	%i3,	%o6
	edge8l	%l3,	%i7,	%i2
	movrne	%l1,	0x3F7,	%g5
	fpack16	%f22,	%f5
	fpadd16s	%f2,	%f11,	%f5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x28] %asi,	%i5
	edge8n	%g4,	%o1,	%o7
	lduh	[%l7 + 0x3C],	%i1
	bvs,pn	%icc,	loop_2602
	fbn,a	%fcc3,	loop_2603
	movrgz	%i4,	%o4,	%l0
	fmovsneg	%icc,	%f2,	%f25
loop_2602:
	edge8	%g2,	%l6,	%g1
loop_2603:
	array8	%o2,	%o5,	%l2
	array8	%g6,	%l4,	%i0
	fnors	%f24,	%f16,	%f23
	flush	%l7 + 0x50
	fandnot2s	%f2,	%f23,	%f30
	brgez	%l5,	loop_2604
	brlez,a	%o0,	loop_2605
	andncc	%i6,	%g7,	%g3
	movrgez	%i3,	%o3,	%o6
loop_2604:
	ldstub	[%l7 + 0x2F],	%i7
loop_2605:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i2,	%l1,	%g5
	udivcc	%i5,	0x194E,	%g4
	alignaddrl	%o1,	%l3,	%i1
	array32	%o7,	%o4,	%i4
	bge,a,pt	%xcc,	loop_2606
	nop
	fitos	%f8,	%f13
	ldsh	[%l7 + 0x2A],	%g2
	and	%l6,	%g1,	%o2
loop_2606:
	membar	0x06
	nop
	setx	0xF06C947E,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	movrlz	%o5,	%l2,	%g6
	movcc	%icc,	%l4,	%i0
	fmovdvc	%icc,	%f4,	%f0
	movn	%icc,	%l5,	%o0
	fcmpeq32	%f18,	%f8,	%l0
	movn	%xcc,	%i6,	%g3
	ldx	[%l7 + 0x50],	%g7
	tn	%icc,	0x1
	set	0x120, %l2
	ldxa	[%g0 + %l2] 0x52,	%i3
	sdivcc	%o3,	0x11EE,	%o6
	edge8n	%i7,	%i2,	%g5
	tvc	%icc,	0x2
	bcs,pt	%xcc,	loop_2607
	andcc	%l1,	0x1E99,	%g4
	move	%icc,	%i5,	%o1
	or	%i1,	%o7,	%l3
loop_2607:
	tsubcctv	%o4,	0x14BE,	%i4
	orncc	%l6,	0x11A2,	%g1
	tgu	%icc,	0x7
	tgu	%icc,	0x6
	movcc	%xcc,	%g2,	%o5
	movg	%xcc,	%o2,	%l2
	fpack16	%f2,	%f15
	edge8	%g6,	%l4,	%l5
	movpos	%icc,	%i0,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%i6,	loop_2608
	srl	%l0,	0x14,	%g7
	fbue	%fcc1,	loop_2609
	xorcc	%g3,	%i3,	%o3
loop_2608:
	tne	%xcc,	0x1
	nop
	fitos	%f11,	%f3
	fstox	%f3,	%f28
loop_2609:
	movcc	%xcc,	%i7,	%i2
	array32	%g5,	%o6,	%g4
	be	loop_2610
	fnor	%f10,	%f18,	%f14
	subc	%i5,	%o1,	%i1
	fpmerge	%f30,	%f5,	%f10
loop_2610:
	movne	%icc,	%l1,	%l3
	fpadd32	%f18,	%f20,	%f10
	brgz,a	%o4,	loop_2611
	prefetch	[%l7 + 0x48],	 0x0
	mova	%icc,	%o7,	%l6
	tgu	%xcc,	0x0
loop_2611:
	movle	%icc,	%g1,	%g2
	fbule,a	%fcc3,	loop_2612
	alignaddrl	%o5,	%i4,	%o2
	bl,a,pn	%icc,	loop_2613
	fmovrslz	%l2,	%f11,	%f3
loop_2612:
	swap	[%l7 + 0x10],	%l4
	movre	%l5,	0x0B2,	%g6
loop_2613:
	xnorcc	%i0,	0x181F,	%i6
	fpmerge	%f13,	%f5,	%f14
	movrgz	%l0,	0x1D0,	%g7
	tcc	%xcc,	0x0
	orncc	%g3,	0x1295,	%i3
	ldsh	[%l7 + 0x46],	%o0
	nop
	setx	loop_2614,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%o3,	0x1020,	%i2
	sir	0x0D9C
	be,a,pn	%icc,	loop_2615
loop_2614:
	xnor	%i7,	%o6,	%g4
	nop
	setx	0xF7AAACC93767AB00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x82EADBC78D0F1BCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f30,	%f18
	fpadd32	%f20,	%f14,	%f12
loop_2615:
	bvc	%xcc,	loop_2616
	edge16	%i5,	%o1,	%g5
	tn	%icc,	0x1
	movrlz	%i1,	0x26E,	%l1
loop_2616:
	movvs	%xcc,	%l3,	%o4
	fmovscc	%xcc,	%f10,	%f26
	movrgez	%o7,	0x394,	%g1
	fble,a	%fcc3,	loop_2617
	fcmpeq16	%f30,	%f22,	%g2
	brnz	%o5,	loop_2618
	nop
	setx	0x24CFCC85004B6F82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_2617:
	mova	%xcc,	%i4,	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%l4
loop_2618:
	mulscc	%l5,	0x1A8B,	%g6
	udiv	%l2,	0x1679,	%i0
	te	%xcc,	0x5
	tpos	%icc,	0x3
	edge16n	%i6,	%g7,	%g3
	orncc	%i3,	%l0,	%o0
	mulscc	%i2,	0x157D,	%o3
	movcs	%icc,	%o6,	%i7
	fbne,a	%fcc0,	loop_2619
	sdivx	%g4,	0x0821,	%o1
	fmovdcc	%xcc,	%f24,	%f1
	fbu	%fcc3,	loop_2620
loop_2619:
	xnor	%g5,	0x179B,	%i5
	stb	%i1,	[%l7 + 0x13]
	movvc	%icc,	%l1,	%l3
loop_2620:
	umulcc	%o7,	%o4,	%g1
	nop
	setx	loop_2621,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bleu,pn	%icc,	loop_2622
	fpack16	%f12,	%f13
	andcc	%g2,	%i4,	%o2
loop_2621:
	movne	%xcc,	%l6,	%o5
loop_2622:
	membar	0x71
	taddcc	%l5,	%g6,	%l2
	orn	%l4,	0x088F,	%i0
	srlx	%g7,	0x18,	%i6
	fmovsge	%icc,	%f31,	%f24
	addcc	%i3,	0x0182,	%l0
	sllx	%o0,	0x1B,	%i2
	fpadd32	%f26,	%f2,	%f28
	tle	%xcc,	0x5
	fxors	%f9,	%f23,	%f15
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x62] %asi,	%g3
	fba	%fcc2,	loop_2623
	srlx	%o6,	0x17,	%i7
	fmovda	%xcc,	%f30,	%f29
	movpos	%xcc,	%o3,	%g4
loop_2623:
	fmovdl	%icc,	%f26,	%f3
	fmovsl	%icc,	%f22,	%f24
	fbg	%fcc3,	loop_2624
	fpadd16	%f28,	%f4,	%f14
	nop
	setx	loop_2625,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andn	%g5,	%o1,	%i5
loop_2624:
	tge	%icc,	0x4
	nop
	setx	loop_2626,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2625:
	tvc	%xcc,	0x0
	fbule,a	%fcc0,	loop_2627
	fornot1	%f4,	%f30,	%f2
loop_2626:
	popc	%i1,	%l1
	movl	%icc,	%o7,	%o4
loop_2627:
	edge16ln	%g1,	%l3,	%g2
	nop
	fitos	%f11,	%f18
	fstoi	%f18,	%f25
	fbge	%fcc2,	loop_2628
	sra	%i4,	%o2,	%l6
	orncc	%l5,	0x07A3,	%o5
	bvs,pt	%icc,	loop_2629
loop_2628:
	fmul8sux16	%f10,	%f20,	%f10
	sub	%l2,	%g6,	%l4
	mulscc	%i0,	0x0D9F,	%i6
loop_2629:
	fmovsle	%xcc,	%f24,	%f21
	tvc	%xcc,	0x0
	tcs	%icc,	0x4
	array32	%g7,	%i3,	%o0
	brz	%i2,	loop_2630
	xnor	%l0,	%o6,	%i7
	lduw	[%l7 + 0x2C],	%g3
	movne	%icc,	%o3,	%g4
loop_2630:
	fbue,a	%fcc3,	loop_2631
	tvs	%xcc,	0x2
	fcmpgt32	%f0,	%f2,	%g5
	and	%o1,	%i1,	%i5
loop_2631:
	movrlz	%l1,	0x201,	%o7
	fones	%f23
	subc	%o4,	%g1,	%l3
	tcc	%xcc,	0x5
	movl	%icc,	%i4,	%o2
	edge16l	%l6,	%l5,	%o5
	fpsub16s	%f19,	%f2,	%f5
	movge	%xcc,	%l2,	%g2
	nop
	fitos	%f7,	%f10
	fstod	%f10,	%f8
	fbuge,a	%fcc0,	loop_2632
	fnors	%f14,	%f1,	%f22
	subc	%g6,	0x0DCE,	%l4
	mulscc	%i0,	0x0079,	%i6
loop_2632:
	movrlz	%g7,	0x068,	%o0
	brlz,a	%i3,	loop_2633
	movleu	%icc,	%i2,	%l0
	edge16ln	%o6,	%i7,	%o3
	addc	%g4,	0x1C5E,	%g3
loop_2633:
	edge8l	%g5,	%i1,	%o1
	movle	%xcc,	%l1,	%o7
	movne	%icc,	%o4,	%g1
	mulscc	%l3,	0x0E16,	%i5
	orncc	%o2,	%l6,	%i4
	fbge,a	%fcc2,	loop_2634
	tge	%xcc,	0x3
	fornot2	%f20,	%f6,	%f6
	movle	%icc,	%o5,	%l5
loop_2634:
	movcs	%xcc,	%l2,	%g2
	nop
	setx	0x4443A77EF8B88042,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a	%xcc,	loop_2635
	sub	%l4,	0x02FF,	%i0
	taddcc	%g6,	%g7,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2635:
	tsubcc	%i3,	0x0888,	%i2
	xorcc	%l0,	0x0F4A,	%o6
	fand	%f10,	%f26,	%f22
	fpadd32	%f24,	%f8,	%f8
	brz	%i7,	loop_2636
	xor	%o3,	%g4,	%o0
	fbe	%fcc2,	loop_2637
	xnorcc	%g5,	%i1,	%g3
loop_2636:
	nop
	set	0x5C, %l5
	ldswa	[%l7 + %l5] 0x18,	%l1
loop_2637:
	fmovrslez	%o1,	%f19,	%f21
	nop
	setx	0xDAF1D2B2B0431555,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	edge16	%o4,	%g1,	%o7
	bl,a,pt	%xcc,	loop_2638
	movle	%xcc,	%l3,	%o2
	fexpand	%f16,	%f0
	add	%i5,	0x1D0E,	%l6
loop_2638:
	tne	%icc,	0x5
	swap	[%l7 + 0x54],	%i4
	bpos,pn	%xcc,	loop_2639
	xorcc	%o5,	0x0623,	%l5
	sethi	0x07B4,	%l2
	ldd	[%l7 + 0x10],	%f10
loop_2639:
	tvc	%icc,	0x2
	std	%f24,	[%l7 + 0x78]
	nop
	set	0x58, %o6
	ldub	[%l7 + %o6],	%l4
	smul	%g2,	0x0043,	%i0
	movle	%icc,	%g7,	%g6
	movge	%xcc,	%i3,	%i6
	ldsb	[%l7 + 0x14],	%l0
	umul	%i2,	%o6,	%i7
	xnor	%g4,	0x130D,	%o0
	nop
	setx	0x158975F61A0EF926,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x775C5499B588DBE2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f20,	%f18
	tcs	%icc,	0x3
	ta	%icc,	0x1
	bn	%icc,	loop_2640
	bpos,a,pn	%icc,	loop_2641
	movneg	%xcc,	%g5,	%i1
	for	%f18,	%f24,	%f22
loop_2640:
	nop
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x27,	%o2
loop_2641:
	fmovsgu	%xcc,	%f19,	%f25
	array32	%g3,	%l1,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc2,	loop_2642
	alignaddr	%g1,	%o7,	%o4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x74] %asi,	%f12
loop_2642:
	movvc	%xcc,	%o2,	%i5
	sdivcc	%l6,	0x0760,	%l3
	udiv	%o5,	0x1417,	%l5
	xnor	%l2,	%i4,	%g2
	tsubcc	%l4,	%g7,	%i0
	fbule	%fcc1,	loop_2643
	subcc	%i3,	%g6,	%l0
	set	0x2C, %g1
	stwa	%i2,	[%l7 + %g1] 0x04
loop_2643:
	fbu	%fcc1,	loop_2644
	edge16ln	%i6,	%i7,	%o6
	edge32	%o0,	%g5,	%g4
	or	%i1,	%o3,	%l1
loop_2644:
	fmovdpos	%xcc,	%f21,	%f26
	ldx	[%l7 + 0x18],	%g3
	movne	%xcc,	%o1,	%o7
	fnegs	%f11,	%f23
	fnegs	%f30,	%f1
	fmovrdgz	%o4,	%f26,	%f12
	mova	%xcc,	%g1,	%i5
	std	%f24,	[%l7 + 0x30]
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o2
	tne	%icc,	0x0
	sllx	%l3,	0x0A,	%o5
	orncc	%l5,	0x050D,	%l2
	edge32n	%i4,	%l6,	%l4
	alignaddr	%g2,	%i0,	%i3
	subccc	%g6,	%l0,	%g7
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x08] %asi,	%i2
	set	0x1C, %i2
	ldswa	[%l7 + %i2] 0x10,	%i6
	movrgez	%i7,	0x0A1,	%o6
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f6
	bcc,pn	%xcc,	loop_2645
	fcmpne16	%f8,	%f10,	%g5
	xnorcc	%g4,	%i1,	%o0
	fnors	%f20,	%f15,	%f4
loop_2645:
	srl	%o3,	%l1,	%o1
	fzeros	%f6
	fandnot2s	%f8,	%f25,	%f10
	tcc	%xcc,	0x5
	ldd	[%l7 + 0x38],	%o6
	bvc	loop_2646
	movrgz	%g3,	%g1,	%i5
	edge8ln	%o4,	%l3,	%o5
	smul	%l5,	0x1B76,	%o2
loop_2646:
	nop
	set	0x34, %g2
	swapa	[%l7 + %g2] 0x81,	%i4
	edge32n	%l6,	%l4,	%l2
	udivcc	%g2,	0x1E02,	%i0
	ta	%xcc,	0x5
	fcmple16	%f26,	%f2,	%g6
	fnot2	%f22,	%f8
	stx	%i3,	[%l7 + 0x10]
	movvs	%xcc,	%l0,	%g7
	tge	%icc,	0x6
	fbo,a	%fcc0,	loop_2647
	ta	%xcc,	0x5
	xnorcc	%i2,	0x0708,	%i6
	andcc	%i7,	0x1B05,	%o6
loop_2647:
	be	loop_2648
	mova	%xcc,	%g4,	%i1
	set	0x68, %o4
	ldsha	[%l7 + %o4] 0x88,	%g5
loop_2648:
	fcmpne32	%f18,	%f0,	%o0
	udiv	%o3,	0x0086,	%o1
	or	%o7,	0x0A9C,	%g3
	fblg,a	%fcc3,	loop_2649
	fmovsneg	%xcc,	%f7,	%f30
	te	%icc,	0x2
	fsrc1	%f14,	%f30
loop_2649:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f25,	%f13,	%f17
	xnorcc	%g1,	%i5,	%l1
	umul	%l3,	%o4,	%l5
	edge16l	%o5,	%i4,	%o2
	mulscc	%l4,	0x1DC8,	%l2
	ta	%icc,	0x1
	fmovrsne	%l6,	%f31,	%f8
	alignaddrl	%g2,	%g6,	%i3
	membar	0x3B
	tcs	%xcc,	0x6
	move	%icc,	%i0,	%l0
	smul	%g7,	%i6,	%i2
	edge32l	%o6,	%g4,	%i7
	xor	%g5,	%i1,	%o3
	xnorcc	%o0,	0x0FCF,	%o7
	udiv	%o1,	0x0430,	%g1
	fpsub32s	%f24,	%f24,	%f21
	be,a,pn	%xcc,	loop_2650
	bne	%xcc,	loop_2651
	fmovsn	%xcc,	%f18,	%f4
	movleu	%icc,	%i5,	%g3
loop_2650:
	smul	%l3,	0x1E36,	%l1
loop_2651:
	edge32ln	%o4,	%l5,	%o5
	mova	%icc,	%o2,	%l4
	tgu	%icc,	0x5
	alignaddr	%l2,	%l6,	%i4
	prefetch	[%l7 + 0x20],	 0x0
	sethi	0x1731,	%g6
	edge32ln	%i3,	%g2,	%l0
	fbne,a	%fcc1,	loop_2652
	fmovsleu	%icc,	%f28,	%f21
	tgu	%xcc,	0x6
	nop
	fitos	%f1,	%f7
	fstod	%f7,	%f16
loop_2652:
	fbu,a	%fcc0,	loop_2653
	movcc	%xcc,	%i0,	%g7
	alignaddr	%i2,	%o6,	%g4
	fmovda	%icc,	%f26,	%f9
loop_2653:
	movvs	%xcc,	%i7,	%i6
	fmul8x16au	%f28,	%f8,	%f20
	tleu	%icc,	0x2
	nop
	setx	loop_2654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f9,	%f4
	orncc	%g5,	%o3,	%o0
	udivx	%o7,	0x1067,	%i1
loop_2654:
	movle	%icc,	%o1,	%i5
	membar	0x65
	fbge	%fcc2,	loop_2655
	udivx	%g1,	0x07E8,	%g3
	sethi	0x1414,	%l1
	ta	%xcc,	0x3
loop_2655:
	move	%xcc,	%o4,	%l5
	fmovsl	%xcc,	%f21,	%f13
	movl	%xcc,	%o5,	%l3
	mulscc	%l4,	%l2,	%o2
	st	%f4,	[%l7 + 0x68]
	movrlz	%l6,	0x227,	%i4
	fmovsgu	%xcc,	%f13,	%f3
	membar	0x4A
	fbg,a	%fcc0,	loop_2656
	umul	%g6,	%i3,	%g2
	fpack16	%f6,	%f19
	tpos	%xcc,	0x7
loop_2656:
	edge32n	%i0,	%g7,	%l0
	tgu	%xcc,	0x4
	movle	%icc,	%i2,	%o6
	edge32n	%i7,	%i6,	%g5
	nop
	setx	0xB3D8267A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f12
	fmul8sux16	%f2,	%f0,	%f20
	fsrc2	%f28,	%f4
	fmovdcc	%xcc,	%f11,	%f10
	bleu	loop_2657
	mulx	%g4,	0x06FB,	%o3
	ldstub	[%l7 + 0x11],	%o7
	smul	%o0,	0x1586,	%i1
loop_2657:
	fmovdpos	%icc,	%f11,	%f25
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f2
	movrgz	%i5,	%o1,	%g1
	fand	%f2,	%f24,	%f0
	or	%l1,	%o4,	%g3
	tvc	%icc,	0x6
	movleu	%icc,	%l5,	%l3
	bvs,pt	%icc,	loop_2658
	fba	%fcc3,	loop_2659
	edge8	%o5,	%l2,	%o2
	nop
	setx	0x9CB328FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x0B4EEFEE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f15,	%f11
loop_2658:
	movpos	%icc,	%l4,	%l6
loop_2659:
	smulcc	%i4,	%g6,	%g2
	mova	%icc,	%i0,	%g7
	tge	%icc,	0x4
	fmovrde	%i3,	%f2,	%f10
	fmovdcs	%icc,	%f8,	%f26
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f14,	%f29
	movg	%xcc,	%i2,	%l0
	tgu	%icc,	0x6
	nop
	setx loop_2660, %l0, %l1
	jmpl %l1, %i7
	brnz	%o6,	loop_2661
	fbge,a	%fcc3,	loop_2662
	sra	%i6,	%g4,	%g5
loop_2660:
	call	loop_2663
loop_2661:
	subccc	%o7,	0x0B7F,	%o0
loop_2662:
	fnot2	%f20,	%f16
	bl,a,pn	%xcc,	loop_2664
loop_2663:
	xorcc	%o3,	0x1705,	%i1
	umul	%o1,	0x1DB3,	%i5
	edge32	%l1,	%g1,	%g3
loop_2664:
	andn	%l5,	%o4,	%l3
	tvs	%icc,	0x3
	subccc	%o5,	%l2,	%l4
	edge16ln	%o2,	%l6,	%g6
	edge8n	%i4,	%g2,	%i0
	fmovspos	%icc,	%f19,	%f3
	tleu	%icc,	0x0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%g7
	movgu	%icc,	%i2,	%l0
	fmovdl	%xcc,	%f13,	%f30
	fsrc1s	%f18,	%f5
	fand	%f4,	%f14,	%f2
	taddcctv	%i3,	0x1451,	%i7
	edge32n	%i6,	%g4,	%g5
	andn	%o6,	0x1994,	%o7
	movvc	%xcc,	%o0,	%o3
	alignaddr	%i1,	%o1,	%l1
	fmovsgu	%xcc,	%f2,	%f0
	tne	%xcc,	0x4
	sub	%g1,	%i5,	%l5
	set	0x11, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g3
	movneg	%icc,	%l3,	%o4
	movrgz	%l2,	%o5,	%l4
	movne	%icc,	%o2,	%g6
	tg	%icc,	0x1
	nop
	setx	0x618FDDBE2EE41F8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC2547853C3551BC7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f28,	%f24
	udiv	%l6,	0x16E9,	%i4
	sra	%i0,	%g2,	%g7
	nop
	setx	0x4B0D1814,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xED669350,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f0,	%f10
	fcmple16	%f18,	%f26,	%i2
	sethi	0x0D09,	%i3
	movcs	%xcc,	%l0,	%i7
	orncc	%g4,	0x1617,	%i6
	movcc	%icc,	%g5,	%o6
	movg	%icc,	%o0,	%o3
	srlx	%o7,	0x12,	%i1
	tne	%icc,	0x4
	set	0x62, %o0
	lduba	[%l7 + %o0] 0x10,	%o1
	be	%xcc,	loop_2665
	ldd	[%l7 + 0x68],	%f18
	fmovsa	%xcc,	%f15,	%f19
	fzero	%f0
loop_2665:
	sub	%g1,	%l1,	%l5
	fandnot1	%f14,	%f30,	%f20
	fbu,a	%fcc2,	loop_2666
	fbule	%fcc3,	loop_2667
	fandnot2	%f8,	%f28,	%f18
	nop
	setx	loop_2668,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2666:
	orncc	%g3,	%l3,	%i5
loop_2667:
	brlez	%l2,	loop_2669
	edge8n	%o4,	%l4,	%o5
loop_2668:
	sll	%g6,	0x09,	%o2
	wr	%g0,	0x2f,	%asi
	stwa	%i4,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2669:
	tsubcctv	%l6,	%g2,	%i0
	tge	%icc,	0x1
	edge8ln	%g7,	%i3,	%l0
	sra	%i2,	0x18,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i6,	%g5,	%o6
	tle	%icc,	0x6
	stx	%o0,	[%l7 + 0x08]
	fmul8x16au	%f22,	%f24,	%f16
	fbg,a	%fcc0,	loop_2670
	tle	%xcc,	0x1
	flush	%l7 + 0x40
	ta	%xcc,	0x6
loop_2670:
	nop
	setx	0x7155C9C1E05322F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fpmerge	%f11,	%f17,	%f12
	movneg	%icc,	%g4,	%o7
	movvc	%xcc,	%o3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g1,	%l1,	%l5
	subc	%g3,	0x0AC2,	%o1
	addccc	%i5,	%l3,	%l2
	edge32ln	%l4,	%o5,	%g6
	andncc	%o4,	%i4,	%o2
	faligndata	%f4,	%f30,	%f16
	or	%l6,	0x1832,	%g2
	nop
	setx	0xE7C5A0328058A2A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	tle	%xcc,	0x4
	tpos	%xcc,	0x4
	srax	%i0,	%g7,	%i3
	tvs	%icc,	0x4
	nop
	setx	loop_2671,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%xcc,	0x6
	fbe	%fcc1,	loop_2672
	tg	%xcc,	0x3
loop_2671:
	fzeros	%f31
	movpos	%icc,	%i2,	%i7
loop_2672:
	ldsw	[%l7 + 0x40],	%i6
	subc	%g5,	%o6,	%o0
	edge32ln	%l0,	%g4,	%o3
	edge8ln	%i1,	%o7,	%g1
	edge32ln	%l1,	%l5,	%g3
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%o0
	nop
	fitod	%f14,	%f18
	sth	%l3,	[%l7 + 0x52]
	brgez	%l2,	loop_2673
	sub	%i5,	%o5,	%l4
	fsrc2s	%f24,	%f10
	movn	%xcc,	%o4,	%g6
loop_2673:
	alignaddr	%o2,	%l6,	%i4
	fbue,a	%fcc0,	loop_2674
	movrgz	%g2,	%i0,	%g7
	tl	%icc,	0x6
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f12
loop_2674:
	smul	%i2,	%i3,	%i6
	fmovdcc	%icc,	%f14,	%f18
	fmovscc	%xcc,	%f23,	%f8
	tle	%xcc,	0x3
	edge8l	%i7,	%g5,	%o6
	fbg,a	%fcc3,	loop_2675
	ldsh	[%l7 + 0x44],	%o0
	tsubcctv	%l0,	0x0330,	%o3
	sdivx	%i1,	0x0AFB,	%o7
loop_2675:
	movne	%xcc,	%g4,	%l1
	fmovrslz	%l5,	%f0,	%f8
	fmovrsgz	%g3,	%f15,	%f6
	movle	%xcc,	%o1,	%g1
	fmovsvc	%icc,	%f3,	%f21
	lduw	[%l7 + 0x2C],	%l3
	movn	%icc,	%l2,	%o5
	fpack16	%f12,	%f25
	srlx	%i5,	0x06,	%o4
	umul	%l4,	0x03B9,	%g6
	srax	%l6,	%i4,	%g2
	std	%f12,	[%l7 + 0x38]
	addccc	%i0,	%g7,	%i2
	fnot2	%f6,	%f22
	bne,a	loop_2676
	edge16	%i3,	%i6,	%i7
	edge16l	%g5,	%o6,	%o0
	fcmpeq32	%f18,	%f0,	%o2
loop_2676:
	bn,a	loop_2677
	movneg	%xcc,	%l0,	%o3
	fbge	%fcc3,	loop_2678
	sllx	%o7,	0x08,	%g4
loop_2677:
	movge	%icc,	%l1,	%i1
	fsrc2s	%f29,	%f2
loop_2678:
	bvc,a	%xcc,	loop_2679
	subccc	%g3,	0x02A2,	%o1
	taddcctv	%g1,	%l5,	%l2
	sth	%o5,	[%l7 + 0x62]
loop_2679:
	tvs	%icc,	0x1
	sth	%l3,	[%l7 + 0x3C]
	xnor	%i5,	%o4,	%g6
	orcc	%l6,	%i4,	%l4
	tvc	%xcc,	0x1
	edge16l	%g2,	%i0,	%i2
	fmovdcc	%xcc,	%f15,	%f6
	tgu	%icc,	0x3
	edge32	%g7,	%i3,	%i6
	addccc	%i7,	%g5,	%o6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x24] %asi,	%o0
	std	%f10,	[%l7 + 0x08]
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x1E] %asi,	%o2
	edge16l	%l0,	%o3,	%o7
	srax	%g4,	%i1,	%g3
	fmovd	%f4,	%f18
	alignaddr	%o1,	%l1,	%l5
	sdivcc	%l2,	0x0EA2,	%g1
	call	loop_2680
	edge32n	%l3,	%o5,	%i5
	sdivcc	%o4,	0x0C7D,	%l6
	tl	%icc,	0x4
loop_2680:
	movvc	%icc,	%i4,	%g6
	movvc	%icc,	%g2,	%l4
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x27,	%i0
	nop
	setx	0x7E8CF42F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x35AC4234,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f27,	%f17
	movg	%icc,	%i2,	%i3
	add	%i6,	0x0504,	%i7
	bvs	loop_2681
	brz,a	%g5,	loop_2682
	fmovsn	%xcc,	%f14,	%f22
	movne	%icc,	%o6,	%o0
loop_2681:
	fxor	%f6,	%f22,	%f10
loop_2682:
	movrgz	%g7,	0x16B,	%o2
	ta	%xcc,	0x2
	stb	%o3,	[%l7 + 0x40]
	fmovrslz	%l0,	%f22,	%f11
	fmovdle	%icc,	%f15,	%f10
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	fmovrsne	%i1,	%f27,	%f18
	addcc	%g3,	0x1FDD,	%g4
	orn	%l1,	0x10A6,	%o1
	udiv	%l5,	0x0C66,	%l2
	addc	%g1,	0x0E20,	%l3
	tleu	%icc,	0x7
	stx	%o5,	[%l7 + 0x50]
	fmovrsgez	%o4,	%f13,	%f15
	tvs	%xcc,	0x4
	ba,a,pt	%icc,	loop_2683
	nop
	setx loop_2684, %l0, %l1
	jmpl %l1, %l6
	srlx	%i4,	%i5,	%g2
	edge16n	%l4,	%i0,	%i2
loop_2683:
	ldstub	[%l7 + 0x21],	%g6
loop_2684:
	addcc	%i3,	0x0931,	%i7
	ld	[%l7 + 0x68],	%f30
	fmovdvs	%xcc,	%f4,	%f31
	movcc	%xcc,	%i6,	%g5
	movge	%xcc,	%o6,	%g7
	movcs	%icc,	%o2,	%o3
	movvs	%icc,	%l0,	%o7
	set	0x40, %o7
	sta	%f7,	[%l7 + %o7] 0x19
	and	%i1,	%o0,	%g4
	orn	%g3,	0x0598,	%o1
	movvc	%icc,	%l5,	%l1
	fpackfix	%f8,	%f4
	umul	%g1,	%l2,	%l3
	nop
	fitod	%f4,	%f8
	fcmpne16	%f8,	%f28,	%o5
	fnands	%f9,	%f4,	%f10
	sir	0x067C
	fmovsa	%xcc,	%f20,	%f1
	alignaddrl	%o4,	%l6,	%i5
	srlx	%g2,	0x1A,	%l4
	fandnot1s	%f26,	%f7,	%f13
	udivcc	%i0,	0x0359,	%i2
	fpadd16s	%f14,	%f12,	%f0
	movrgez	%i4,	%g6,	%i3
	nop
	fitos	%f12,	%f17
	fstox	%f17,	%f0
	movrlz	%i7,	%g5,	%o6
	and	%g7,	0x07B0,	%o2
	tpos	%xcc,	0x2
	movrlz	%i6,	%o3,	%o7
	fbu	%fcc0,	loop_2685
	nop
	setx	0x1C21D86F806BBF8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	edge8ln	%i1,	%o0,	%l0
	fmovdcc	%xcc,	%f17,	%f26
loop_2685:
	nop
	set	0x20, %l1
	stwa	%g3,	[%l7 + %l1] 0x27
	membar	#Sync
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%o1
	fors	%f22,	%f12,	%f5
	edge16n	%g4,	%l5,	%l1
	ldd	[%l7 + 0x20],	%g0
	movrne	%l3,	0x346,	%l2
	sra	%o5,	0x0E,	%o4
	flush	%l7 + 0x40
	fxor	%f2,	%f22,	%f22
	edge8	%i5,	%l6,	%g2
	fnand	%f16,	%f0,	%f4
	addcc	%l4,	0x1E23,	%i0
	sethi	0x07EA,	%i4
	mulscc	%i2,	%g6,	%i7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%g5
	add	%i3,	0x1A56,	%g7
	fmovscc	%xcc,	%f25,	%f29
	taddcctv	%o6,	%o2,	%o3
	movrlez	%i6,	%o7,	%i1
	mulx	%o0,	%l0,	%o1
	edge16n	%g4,	%g3,	%l5
	edge32l	%l1,	%l3,	%g1
	fabsd	%f18,	%f4
	sub	%l2,	%o4,	%i5
	ldd	[%l7 + 0x50],	%o4
	mova	%xcc,	%l6,	%l4
	movne	%xcc,	%g2,	%i0
	fbue,a	%fcc1,	loop_2686
	membar	0x00
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
loop_2686:
	fbule,a	%fcc1,	loop_2687
	xor	%g6,	0x0F61,	%i7
	sllx	%g5,	0x0D,	%i2
	movge	%icc,	%i3,	%g7
loop_2687:
	st	%f2,	[%l7 + 0x68]
	nop
	setx	0x9973BC60,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x1E57E638,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f29,	%f26
	brgz,a	%o2,	loop_2688
	mova	%xcc,	%o3,	%o6
	alignaddrl	%o7,	%i1,	%i6
	fmovsleu	%icc,	%f8,	%f9
loop_2688:
	tsubcctv	%l0,	0x1436,	%o0
	bvc	loop_2689
	mulscc	%o1,	0x03D8,	%g4
	xorcc	%l5,	%l1,	%g3
	fmovde	%xcc,	%f7,	%f11
loop_2689:
	edge32l	%g1,	%l3,	%o4
	edge8	%i5,	%l2,	%o5
	edge8ln	%l6,	%l4,	%g2
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xe3,	%i4
	movcc	%icc,	%i0,	%g6
	sub	%g5,	%i2,	%i3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x70] %asi,	%i7
	fbg	%fcc1,	loop_2690
	tge	%xcc,	0x6
	brnz	%o2,	loop_2691
	fmovdcc	%icc,	%f3,	%f24
loop_2690:
	edge16	%g7,	%o3,	%o6
	bpos,a,pn	%xcc,	loop_2692
loop_2691:
	ldsb	[%l7 + 0x4E],	%o7
	fxor	%f28,	%f24,	%f22
	addcc	%i6,	%l0,	%o0
loop_2692:
	fcmpgt16	%f0,	%f20,	%o1
	andcc	%g4,	0x12BA,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l1,	%g3,	%i1
	bne,a	loop_2693
	movcc	%icc,	%g1,	%o4
	fmovrsgez	%i5,	%f11,	%f15
	orcc	%l3,	0x1D4A,	%l2
loop_2693:
	or	%o5,	0x163A,	%l6
	array8	%g2,	%l4,	%i4
	addccc	%g6,	%i0,	%g5
	sra	%i3,	%i2,	%o2
	fcmpeq32	%f6,	%f6,	%g7
	fmovrsgz	%o3,	%f2,	%f1
	tvc	%icc,	0x7
	nop
	fitod	%f27,	%f2
	sethi	0x06A8,	%i7
	fnegs	%f22,	%f17
	fpackfix	%f2,	%f18
	fbn	%fcc3,	loop_2694
	fsrc1s	%f12,	%f12
	wr	%g0,	0x11,	%asi
	stwa	%o6,	[%l7 + 0x7C] %asi
loop_2694:
	fnands	%f23,	%f17,	%f13
	movvs	%icc,	%i6,	%o7
	movneg	%icc,	%o0,	%o1
	movpos	%xcc,	%g4,	%l0
	tleu	%icc,	0x1
	movrne	%l5,	0x322,	%g3
	taddcctv	%l1,	0x08D0,	%g1
	tge	%xcc,	0x5
	edge16l	%i1,	%i5,	%o4
	sub	%l3,	%l2,	%o5
	fbug,a	%fcc3,	loop_2695
	array16	%g2,	%l6,	%i4
	fmul8sux16	%f26,	%f4,	%f24
	fmovsn	%icc,	%f5,	%f15
loop_2695:
	nop
	setx	loop_2696,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%l4,	%g6,	%g5
	udivx	%i0,	0x184B,	%i2
	nop
	setx	0x4676EBD4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xB8D21E35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f9,	%f27
loop_2696:
	fmovdgu	%icc,	%f14,	%f20
	nop
	setx	loop_2697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x7
	edge32l	%i3,	%o2,	%g7
	fmovdneg	%xcc,	%f30,	%f22
loop_2697:
	sdivx	%i7,	0x1F21,	%o6
	faligndata	%f20,	%f4,	%f4
	sdiv	%o3,	0x181B,	%o7
	udiv	%i6,	0x0C95,	%o0
	movleu	%icc,	%o1,	%g4
	fmovspos	%icc,	%f31,	%f30
	fmuld8ulx16	%f10,	%f29,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc1,	loop_2698
	movcc	%icc,	%l0,	%l5
	fbuge	%fcc3,	loop_2699
	fbg,a	%fcc3,	loop_2700
loop_2698:
	fpsub32s	%f1,	%f29,	%f11
	fcmple16	%f0,	%f26,	%l1
loop_2699:
	brlez,a	%g1,	loop_2701
loop_2700:
	nop
	set	0x0A, %l4
	sth	%g3,	[%l7 + %l4]
	fmul8ulx16	%f16,	%f30,	%f14
	fpsub16s	%f20,	%f30,	%f30
loop_2701:
	umulcc	%i5,	%i1,	%o4
	fexpand	%f25,	%f26
	nop
	setx loop_2702, %l0, %l1
	jmpl %l1, %l2
	orn	%o5,	%l3,	%g2
	edge16	%i4,	%l6,	%l4
	brz,a	%g5,	loop_2703
loop_2702:
	st	%f27,	[%l7 + 0x0C]
	and	%g6,	0x0687,	%i2
	tcc	%icc,	0x7
loop_2703:
	sra	%i0,	%i3,	%g7
	ldstub	[%l7 + 0x3B],	%i7
	edge16	%o6,	%o3,	%o7
	edge16n	%i6,	%o2,	%o0
	andncc	%o1,	%l0,	%l5
	edge16l	%g4,	%g1,	%g3
	fmovsl	%xcc,	%f4,	%f7
	bg,a	%xcc,	loop_2704
	andncc	%i5,	%l1,	%o4
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x2C] %asi
loop_2704:
	alignaddr	%l2,	%o5,	%l3
	fmovs	%f7,	%f17
	subcc	%g2,	0x0171,	%i4
	movgu	%icc,	%i1,	%l6
	fornot1	%f28,	%f30,	%f4
	alignaddrl	%g5,	%l4,	%g6
	edge32ln	%i2,	%i0,	%i3
	movrlz	%g7,	%i7,	%o3
	move	%xcc,	%o6,	%i6
	edge32	%o2,	%o7,	%o1
	taddcc	%o0,	%l5,	%l0
	sub	%g1,	%g3,	%i5
	array8	%g4,	%o4,	%l2
	swap	[%l7 + 0x78],	%o5
	nop
	setx	0xC57E3D47A051F096,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	edge8ln	%l3,	%l1,	%g2
	fmovsneg	%xcc,	%f13,	%f16
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4E] %asi,	%i4
	edge16ln	%i1,	%l6,	%l4
	movcs	%xcc,	%g6,	%i2
	smulcc	%i0,	0x1DA8,	%g5
	mulx	%g7,	%i3,	%i7
	edge16n	%o6,	%o3,	%i6
	ble,pn	%icc,	loop_2705
	andn	%o7,	%o2,	%o0
	fsrc2	%f26,	%f20
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x10] %asi,	%o1
loop_2705:
	fnot1	%f14,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l5,	%g1,	%g3
	fbuge	%fcc3,	loop_2706
	movge	%xcc,	%l0,	%i5
	nop
	setx	0xC8146EBB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xF0DA9507,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f3,	%f17
	movrgz	%g4,	0x287,	%l2
loop_2706:
	alignaddr	%o4,	%l3,	%l1
	sth	%o5,	[%l7 + 0x1C]
	fmovsvc	%icc,	%f28,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f31,	%f14
	movre	%g2,	%i4,	%i1
	movle	%xcc,	%l6,	%g6
	movvc	%icc,	%l4,	%i0
	bne,a	%icc,	loop_2707
	tsubcc	%g5,	0x1DCD,	%i2
	fbl,a	%fcc2,	loop_2708
	orcc	%g7,	%i7,	%o6
loop_2707:
	fcmple16	%f28,	%f14,	%o3
	set	0x1F, %l6
	lduba	[%l7 + %l6] 0x81,	%i3
loop_2708:
	umulcc	%o7,	0x11A1,	%i6
	movgu	%xcc,	%o2,	%o0
	fornot1	%f6,	%f18,	%f28
	tne	%icc,	0x3
	movrne	%o1,	0x08C,	%l5
	fcmpeq16	%f24,	%f16,	%g1
	bleu,a,pt	%icc,	loop_2709
	tsubcc	%g3,	%i5,	%g4
	fmovrsgz	%l2,	%f23,	%f0
	umul	%o4,	0x1260,	%l0
loop_2709:
	fbuge,a	%fcc1,	loop_2710
	bn,a	loop_2711
	fnot2	%f4,	%f6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf0
	membar	#Sync
loop_2710:
	nop
	set	0x68, %i5
	stxa	%l3,	[%l7 + %i5] 0x27
	membar	#Sync
loop_2711:
	fmovrdgz	%o5,	%f30,	%f2
	and	%g2,	%l1,	%i1
	edge16l	%l6,	%g6,	%i4
	edge16	%i0,	%l4,	%i2
	tgu	%xcc,	0x1
	subccc	%g5,	0x15C8,	%i7
	brlz	%g7,	loop_2712
	smul	%o6,	%o3,	%o7
	movneg	%icc,	%i6,	%i3
	mulx	%o2,	0x03C8,	%o1
loop_2712:
	fbg	%fcc1,	loop_2713
	fbul	%fcc0,	loop_2714
	movge	%xcc,	%o0,	%g1
	tleu	%xcc,	0x2
loop_2713:
	fmovdvc	%icc,	%f26,	%f9
loop_2714:
	fandnot2	%f24,	%f8,	%f14
	xnor	%g3,	%i5,	%g4
	taddcctv	%l5,	0x060D,	%o4
	movne	%icc,	%l0,	%l2
	fmul8sux16	%f0,	%f0,	%f22
	tl	%xcc,	0x4
	movgu	%xcc,	%o5,	%l3
	orncc	%g2,	0x0267,	%i1
	bn,a,pt	%xcc,	loop_2715
	subc	%l6,	%g6,	%l1
	and	%i4,	0x0070,	%l4
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f28
	fxtos	%f28,	%f8
loop_2715:
	std	%f30,	[%l7 + 0x08]
	movge	%xcc,	%i2,	%i0
	fpsub16	%f22,	%f12,	%f28
	taddcc	%g5,	0x1B18,	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%o3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x30] %asi,	%o7
	fabss	%f5,	%f31
	edge8ln	%i7,	%i3,	%i6
	fcmple32	%f30,	%f28,	%o1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o2
	tsubcc	%g1,	0x1EDF,	%o0
	mulx	%g3,	0x01BD,	%g4
	edge32n	%l5,	%i5,	%o4
	fxor	%f20,	%f2,	%f6
	or	%l0,	%l2,	%l3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x32] %asi,	%g2
	fands	%f2,	%f28,	%f6
	add	%o5,	%l6,	%i1
	fbge	%fcc2,	loop_2716
	ta	%icc,	0x3
	fbo	%fcc2,	loop_2717
	ldd	[%l7 + 0x58],	%g6
loop_2716:
	tleu	%icc,	0x3
	sra	%i4,	%l1,	%l4
loop_2717:
	tn	%icc,	0x0
	edge8n	%i0,	%g5,	%g7
	edge16n	%o6,	%i2,	%o7
	fmovdn	%xcc,	%f29,	%f3
	fcmpgt16	%f8,	%f12,	%i7
	fmovsvc	%xcc,	%f23,	%f28
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x80,	%o2
	fmovde	%icc,	%f12,	%f10
	fmovdne	%icc,	%f25,	%f30
	tge	%xcc,	0x2
	fmovdn	%icc,	%f29,	%f30
	ble	loop_2718
	umulcc	%i6,	%i3,	%o2
	andcc	%g1,	%o1,	%o0
	fcmpne32	%f4,	%f28,	%g4
loop_2718:
	tcc	%icc,	0x6
	bneg	%icc,	loop_2719
	brgez	%g3,	loop_2720
	subcc	%l5,	%o4,	%l0
	tvs	%icc,	0x5
loop_2719:
	tsubcctv	%i5,	%l2,	%g2
loop_2720:
	mova	%icc,	%o5,	%l3
	nop
	setx	0xF5028F5453EB51C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB6EB00056EFE3DEE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f4,	%f22
	smul	%i1,	%g6,	%i4
	alignaddrl	%l6,	%l4,	%i0
	tne	%icc,	0x4
	movle	%xcc,	%l1,	%g7
	ta	%xcc,	0x1
	umulcc	%g5,	0x1DC9,	%o6
	nop
	fitos	%f20,	%f5
	move	%icc,	%i2,	%o7
	wr	%g0,	0x80,	%asi
	sta	%f22,	[%l7 + 0x24] %asi
	movl	%icc,	%i7,	%i6
	array16	%i3,	%o3,	%g1
	set	0x1b8, %l0
	nop 	! 	nop 	! 	ldxa	[%g0 + %l0] 0x40,	%o1 ripped by fixASI40.pl ripped by fixASI40.pl
	fcmple16	%f2,	%f2,	%o2
	fmovdcc	%icc,	%f15,	%f7
	edge32ln	%o0,	%g4,	%l5
	xor	%o4,	%g3,	%i5
	swap	[%l7 + 0x58],	%l0
	edge8n	%g2,	%l2,	%l3
	tg	%xcc,	0x6
	fnors	%f25,	%f3,	%f30
	move	%icc,	%o5,	%i1
	brlez	%i4,	loop_2721
	addcc	%l6,	%l4,	%g6
	andn	%i0,	%g7,	%l1
	fmovsne	%xcc,	%f14,	%f6
loop_2721:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	faligndata	%f0,	%f20,	%f6
	nop
	setx	0xFDF35FB6B065DA1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	orn	%o6,	0x002B,	%i2
	bvc	%xcc,	loop_2722
	edge32l	%o7,	%i6,	%i3
	fcmpne32	%f12,	%f2,	%i7
	fone	%f6
loop_2722:
	taddcctv	%g1,	%o3,	%o1
	subcc	%o2,	0x0CEB,	%g4
	stw	%o0,	[%l7 + 0x64]
	move	%icc,	%o4,	%l5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x50] %asi,	%f17
	fbug	%fcc3,	loop_2723
	movcs	%icc,	%g3,	%l0
	edge32ln	%g2,	%l2,	%l3
	sethi	0x0EB7,	%o5
loop_2723:
	edge16l	%i1,	%i5,	%l6
	movrne	%i4,	%l4,	%i0
	edge32l	%g7,	%l1,	%g6
	orncc	%o6,	%g5,	%o7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x29] %asi,	%i2
	be,a,pn	%xcc,	loop_2724
	bn	loop_2725
	nop
	fitos	%f8,	%f23
	fstox	%f23,	%f14
	fxtos	%f14,	%f20
	be,pt	%icc,	loop_2726
loop_2724:
	udiv	%i3,	0x1D7D,	%i7
loop_2725:
	ba,a	%icc,	loop_2727
	ldub	[%l7 + 0x23],	%g1
loop_2726:
	brnz	%i6,	loop_2728
	fnegs	%f22,	%f9
loop_2727:
	udivcc	%o1,	0x0790,	%o3
	udiv	%o2,	0x0CA7,	%o0
loop_2728:
	sdivx	%g4,	0x096A,	%o4
	fnor	%f22,	%f16,	%f12
	movvs	%xcc,	%l5,	%g3
	umul	%l0,	0x1C60,	%l2
	movne	%icc,	%g2,	%l3
	movne	%icc,	%o5,	%i5
	movn	%icc,	%l6,	%i4
	set	0x10, %g4
	sta	%f9,	[%l7 + %g4] 0x11
	ld	[%l7 + 0x0C],	%f26
	ld	[%l7 + 0x50],	%f11
	te	%xcc,	0x5
	nop
	setx	0x5D114DCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x3991F02C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f19,	%f23
	bl,pn	%icc,	loop_2729
	tpos	%xcc,	0x7
	tpos	%xcc,	0x6
	set	0x0C, %i0
	stba	%l4,	[%l7 + %i0] 0x19
loop_2729:
	fabsd	%f30,	%f10
	taddcctv	%i0,	0x0674,	%g7
	nop
	fitod	%f25,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xF3B5322B91F48FF1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCD1109C56443B435,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f28,	%f28
	movrgz	%i1,	%l1,	%g6
	fbo,a	%fcc1,	loop_2730
	tvs	%icc,	0x0
	movpos	%icc,	%g5,	%o7
	set	0x18, %g3
	lda	[%l7 + %g3] 0x15,	%f29
loop_2730:
	fpadd16	%f14,	%f8,	%f24
	fmovscs	%icc,	%f4,	%f11
	edge32	%i2,	%i3,	%o6
	addc	%g1,	%i6,	%o1
	fzero	%f2
	fmovrsgez	%i7,	%f19,	%f6
	brlz	%o2,	loop_2731
	fpsub16s	%f3,	%f22,	%f28
	tneg	%xcc,	0x4
	udivx	%o0,	0x16C2,	%g4
loop_2731:
	and	%o3,	0x1341,	%o4
	fmovsneg	%xcc,	%f8,	%f24
	array32	%g3,	%l0,	%l5
	fblg	%fcc3,	loop_2732
	array8	%g2,	%l2,	%o5
	tn	%icc,	0x1
	edge16ln	%i5,	%l3,	%i4
loop_2732:
	sethi	0x1450,	%l6
	brlez,a	%l4,	loop_2733
	edge16ln	%i0,	%i1,	%l1
	movleu	%xcc,	%g7,	%g6
	movn	%icc,	%g5,	%i2
loop_2733:
	xor	%o7,	0x0E16,	%i3
	edge32n	%o6,	%g1,	%o1
	fmul8x16al	%f7,	%f0,	%f22
	std	%f12,	[%l7 + 0x50]
	movrgz	%i7,	0x1C4,	%o2
	movpos	%icc,	%i6,	%o0
	bshuffle	%f20,	%f4,	%f2
	srax	%o3,	%o4,	%g3
	tvc	%icc,	0x1
	edge8l	%l0,	%g4,	%l5
	tsubcc	%g2,	0x1E83,	%o5
	fmovsvs	%icc,	%f6,	%f26
	fands	%f1,	%f9,	%f28
	taddcctv	%l2,	%i5,	%i4
	edge32n	%l6,	%l3,	%i0
	fsrc1	%f26,	%f0
	tvs	%icc,	0x6
	edge16n	%i1,	%l4,	%l1
	udivcc	%g6,	0x1E49,	%g7
	taddcc	%g5,	%o7,	%i2
	fone	%f12
	fcmpne16	%f0,	%f16,	%i3
	stw	%g1,	[%l7 + 0x38]
	sdivcc	%o1,	0x12A5,	%o6
	bcs,pt	%xcc,	loop_2734
	edge32n	%i7,	%i6,	%o0
	bpos,a,pt	%xcc,	loop_2735
	movrgz	%o3,	%o2,	%o4
loop_2734:
	edge8	%l0,	%g3,	%g4
	fpsub16s	%f29,	%f8,	%f8
loop_2735:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	edge8l	%o5,	%g2,	%l2
	mulx	%i4,	%i5,	%l6
	edge16l	%i0,	%l3,	%l4
	brgz	%l1,	loop_2736
	edge32n	%i1,	%g6,	%g5
	movrgz	%o7,	0x0F9,	%i2
	fmovrsgz	%i3,	%f7,	%f21
loop_2736:
	tgu	%icc,	0x1
	fmovdneg	%icc,	%f25,	%f4
	alignaddrl	%g7,	%o1,	%g1
	nop
	setx	0x307B7C02,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	bn	loop_2737
	tcs	%xcc,	0x4
	bgu,a,pn	%xcc,	loop_2738
	andn	%i7,	0x1ADD,	%i6
loop_2737:
	movvc	%icc,	%o0,	%o6
	ldx	[%l7 + 0x68],	%o2
loop_2738:
	movl	%xcc,	%o4,	%l0
	sllx	%g3,	0x06,	%g4
	xor	%o3,	0x0024,	%o5
	subc	%l5,	%g2,	%l2
	nop
	setx	loop_2739,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsw	[%l7 + 0x4C],	%i4
	movg	%xcc,	%l6,	%i0
	taddcctv	%l3,	%l4,	%l1
loop_2739:
	tneg	%icc,	0x3
	movg	%icc,	%i1,	%i5
	edge32l	%g6,	%g5,	%o7
	edge8	%i2,	%g7,	%i3
	fmovsge	%icc,	%f24,	%f24
	call	loop_2740
	addcc	%g1,	%o1,	%i6
	edge16l	%o0,	%i7,	%o6
	movrne	%o2,	%o4,	%l0
loop_2740:
	sdiv	%g4,	0x0BFD,	%g3
	set	0x10, %l3
	stha	%o3,	[%l7 + %l3] 0x0c
	st	%f29,	[%l7 + 0x24]
	bne	loop_2741
	mulx	%l5,	0x0FDB,	%o5
	udiv	%l2,	0x04D4,	%g2
	nop
	fitod	%f0,	%f24
	fdtos	%f24,	%f14
loop_2741:
	array32	%i4,	%l6,	%i0
	tleu	%xcc,	0x5
	fmovdge	%xcc,	%f26,	%f13
	xor	%l3,	%l4,	%i1
	fble	%fcc2,	loop_2742
	movle	%icc,	%l1,	%i5
	fmovrsgez	%g6,	%f7,	%f30
	fcmpne32	%f30,	%f8,	%g5
loop_2742:
	movvc	%icc,	%o7,	%g7
	popc	0x1E47,	%i3
	nop
	fitos	%f3,	%f12
	fstox	%f12,	%f14
	or	%i2,	%o1,	%i6
	bgu,a,pn	%icc,	loop_2743
	and	%g1,	0x08BA,	%i7
	move	%xcc,	%o0,	%o6
	fble	%fcc0,	loop_2744
loop_2743:
	add	%o4,	%l0,	%g4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g3
loop_2744:
	nop
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
	brgez	%o2,	loop_2745
	srax	%o5,	%l5,	%g2
	orncc	%i4,	%l2,	%i0
	fornot2	%f0,	%f16,	%f8
loop_2745:
	movrgez	%l3,	0x097,	%l6
	fornot2	%f2,	%f4,	%f8
	ldd	[%l7 + 0x60],	%i0
	tvs	%xcc,	0x2
	tcc	%icc,	0x4
	array8	%l4,	%i5,	%l1
	movcs	%xcc,	%g6,	%o7
	srl	%g7,	%g5,	%i3
	wr	%g0,	0x22,	%asi
	stha	%i2,	[%l7 + 0x70] %asi
	membar	#Sync
	xnor	%o1,	%i6,	%g1
	pdist	%f2,	%f18,	%f22
	tcc	%icc,	0x0
	fandnot2s	%f25,	%f7,	%f2
	brlez	%o0,	loop_2746
	array16	%i7,	%o6,	%l0
	sll	%g4,	0x18,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2746:
	ld	[%l7 + 0x10],	%f8
	set	0x0A, %o2
	ldsha	[%l7 + %o2] 0x19,	%o4
	tge	%icc,	0x0
	tcc	%icc,	0x1
	bleu,a,pn	%xcc,	loop_2747
	movrlz	%o3,	0x000,	%o2
	tsubcc	%l5,	%o5,	%i4
	alignaddrl	%l2,	%i0,	%l3
loop_2747:
	call	loop_2748
	tneg	%icc,	0x4
	fmovdge	%xcc,	%f29,	%f28
	fmovdgu	%xcc,	%f31,	%f21
loop_2748:
	call	loop_2749
	sllx	%l6,	%i1,	%g2
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x23,	%l4
loop_2749:
	andcc	%i5,	0x1ED9,	%l1
	tn	%xcc,	0x0
	umul	%g6,	%o7,	%g7
	wr	%g0,	0xe2,	%asi
	stba	%g5,	[%l7 + 0x56] %asi
	membar	#Sync
	fcmpne32	%f14,	%f30,	%i3
	bcc	loop_2750
	edge8n	%o1,	%i2,	%g1
	tn	%xcc,	0x2
	xorcc	%o0,	0x0947,	%i7
loop_2750:
	tcc	%icc,	0x3
	move	%icc,	%i6,	%l0
	fbg,a	%fcc3,	loop_2751
	fmovrdgez	%o6,	%f0,	%f16
	movrlez	%g4,	%g3,	%o3
	fmovdcs	%xcc,	%f9,	%f10
loop_2751:
	bneg,a	%xcc,	loop_2752
	fba	%fcc0,	loop_2753
	tl	%icc,	0x1
	array8	%o4,	%o2,	%l5
loop_2752:
	nop
	set	0x54, %g7
	ldswa	[%l7 + %g7] 0x19,	%i4
loop_2753:
	fblg,a	%fcc3,	loop_2754
	nop
	setx	0x221C5056,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x2F59D686,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f9,	%f6
	movrlez	%l2,	0x321,	%o5
	smul	%i0,	0x17DF,	%l6
loop_2754:
	ldd	[%l7 + 0x68],	%f22
	array32	%i1,	%l3,	%l4
	fnot1s	%f9,	%f9
	tg	%icc,	0x3
	fcmpeq32	%f18,	%f16,	%i5
	fandnot1s	%f31,	%f9,	%f15
	fpsub16s	%f29,	%f6,	%f26
	fone	%f0
	nop
	setx loop_2755, %l0, %l1
	jmpl %l1, %l1
	lduh	[%l7 + 0x28],	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %i1
	lduwa	[%l7 + %i1] 0x11,	%o7
loop_2755:
	udivcc	%g6,	0x1F1F,	%g7
	edge32l	%i3,	%g5,	%o1
	edge8n	%i2,	%g1,	%i7
	fmovs	%f0,	%f31
	movn	%icc,	%o0,	%i6
	bne,a,pn	%icc,	loop_2756
	tne	%xcc,	0x0
	fmovdle	%icc,	%f19,	%f26
	ldsw	[%l7 + 0x7C],	%o6
loop_2756:
	bvc,pn	%icc,	loop_2757
	movrgez	%g4,	0x06A,	%g3
	movl	%xcc,	%l0,	%o4
	taddcctv	%o3,	0x0EAC,	%o2
loop_2757:
	fmovrsne	%i4,	%f18,	%f25
	movrne	%l2,	0x3C2,	%o5
	mova	%icc,	%i0,	%l5
	set	0x4C, %l2
	swapa	[%l7 + %l2] 0x11,	%i1
	orcc	%l6,	0x15DD,	%l3
	movneg	%icc,	%i5,	%l1
	taddcctv	%g2,	%l4,	%o7
	ta	%xcc,	0x0
	fxnors	%f2,	%f31,	%f22
	tcs	%xcc,	0x4
	fnot2s	%f25,	%f11
	movrgz	%g6,	0x0B6,	%g7
	array16	%i3,	%g5,	%o1
	fmovsvc	%xcc,	%f21,	%f22
	stb	%i2,	[%l7 + 0x32]
	tg	%xcc,	0x7
	movre	%i7,	%g1,	%i6
	ld	[%l7 + 0x38],	%f10
	set	0x76, %i7
	stba	%o6,	[%l7 + %i7] 0x2b
	membar	#Sync
	fmul8ulx16	%f2,	%f10,	%f24
	ldstub	[%l7 + 0x21],	%g4
	tn	%icc,	0x3
	fbge,a	%fcc2,	loop_2758
	bcc	%xcc,	loop_2759
	array16	%g3,	%o0,	%l0
	mulscc	%o3,	0x181A,	%o4
loop_2758:
	xorcc	%i4,	%o2,	%o5
loop_2759:
	tvc	%icc,	0x3
	fbl	%fcc1,	loop_2760
	stx	%l2,	[%l7 + 0x50]
	brz	%l5,	loop_2761
	xnorcc	%i1,	%l6,	%i0
loop_2760:
	edge8l	%i5,	%l3,	%l1
	fmovdneg	%xcc,	%f15,	%f15
loop_2761:
	udiv	%g2,	0x1E11,	%l4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%o7
	prefetch	[%l7 + 0x30],	 0x3
	andcc	%g7,	0x1FA6,	%g6
	set	0x1A, %l5
	lduha	[%l7 + %l5] 0x80,	%i3
	sdivx	%o1,	0x101E,	%i2
	fmovrsne	%i7,	%f28,	%f20
	fpsub16	%f10,	%f2,	%f18
	sdivcc	%g1,	0x1D64,	%i6
	ldd	[%l7 + 0x60],	%g4
	or	%g4,	%o6,	%o0
	addc	%g3,	%l0,	%o3
	ta	%xcc,	0x2
	fmovsn	%xcc,	%f27,	%f31
	fbule,a	%fcc1,	loop_2762
	xnorcc	%i4,	0x070F,	%o2
	movvs	%icc,	%o5,	%l2
	tneg	%icc,	0x1
loop_2762:
	smul	%o4,	%i1,	%l5
	edge8n	%i0,	%i5,	%l3
	orcc	%l1,	0x1BA9,	%l6
	orncc	%l4,	%g2,	%o7
	fors	%f15,	%f24,	%f10
	brz	%g7,	loop_2763
	tneg	%icc,	0x4
	fmuld8sux16	%f17,	%f28,	%f8
	movcc	%icc,	%i3,	%o1
loop_2763:
	sth	%g6,	[%l7 + 0x0E]
	addcc	%i2,	0x0EC7,	%g1
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x10,	 0x0
	sir	0x1598
	fmovscc	%icc,	%f4,	%f5
	movl	%icc,	%g5,	%i6
	fmovsl	%xcc,	%f10,	%f31
	movrlez	%g4,	0x237,	%o0
	fcmple32	%f22,	%f28,	%o6
	fmovsle	%icc,	%f0,	%f27
	tge	%icc,	0x5
	udivcc	%g3,	0x1569,	%l0
	brgez,a	%o3,	loop_2764
	movge	%icc,	%i4,	%o2
	tpos	%icc,	0x1
	and	%l2,	%o4,	%i1
loop_2764:
	fxor	%f8,	%f10,	%f16
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x19,	%o5
	fbl,a	%fcc1,	loop_2765
	bvc,a	%icc,	loop_2766
	move	%xcc,	%i0,	%i5
	addc	%l3,	%l5,	%l1
loop_2765:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x22] %asi,	%l6
loop_2766:
	fmovdneg	%icc,	%f21,	%f26
	fandnot2s	%f10,	%f25,	%f7
	tneg	%icc,	0x4
	fmovsvs	%xcc,	%f2,	%f5
	edge16l	%g2,	%l4,	%o7
	array8	%g7,	%i3,	%o1
	fandnot2	%f24,	%f2,	%f10
	tne	%icc,	0x5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x30] %asi,	%i2
	umul	%g1,	0x0CE8,	%g6
	smul	%i7,	0x0D03,	%i6
	edge8l	%g5,	%o0,	%g4
	fpackfix	%f12,	%f22
	mova	%xcc,	%g3,	%o6
	movcc	%xcc,	%l0,	%o3
	ldstub	[%l7 + 0x23],	%i4
	std	%f20,	[%l7 + 0x30]
	nop
	setx	0x5077B616,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	wr	%g0,	0x80,	%asi
	stba	%l2,	[%l7 + 0x1F] %asi
	subccc	%o4,	%i1,	%o2
	fmovde	%xcc,	%f20,	%f9
	fnors	%f24,	%f1,	%f19
	edge16l	%i0,	%o5,	%l3
	array16	%i5,	%l1,	%l6
	set	0x58, %i2
	stba	%l5,	[%l7 + %i2] 0x2b
	membar	#Sync
	array16	%g2,	%o7,	%g7
	fcmpne32	%f28,	%f10,	%l4
	edge16	%o1,	%i2,	%i3
	bcc,a	%icc,	loop_2767
	membar	0x38
	nop
	setx	0x50E9B21C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x320A5FE5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f9,	%f30
	fmuld8sux16	%f7,	%f28,	%f14
loop_2767:
	fmovscs	%icc,	%f26,	%f24
	fone	%f20
	ldub	[%l7 + 0x47],	%g1
	tpos	%xcc,	0x1
	mulscc	%g6,	0x1C7D,	%i6
	tvc	%xcc,	0x4
	andncc	%g5,	%o0,	%i7
	ldd	[%l7 + 0x48],	%g4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l0
	bvs	loop_2768
	fmovsleu	%icc,	%f3,	%f21
	fmovde	%icc,	%f0,	%f20
	popc	0x0054,	%o6
loop_2768:
	fmovdne	%icc,	%f10,	%f12
	movne	%icc,	%i4,	%o3
	fxnors	%f25,	%f19,	%f10
	subc	%l2,	0x198D,	%i1
	taddcc	%o4,	0x1047,	%i0
	te	%icc,	0x3
	add	%o5,	%l3,	%i5
	ta	%xcc,	0x7
	set	0x0C, %g2
	lduba	[%l7 + %g2] 0x04,	%l1
	fpadd16s	%f10,	%f21,	%f4
	sub	%l6,	%o2,	%g2
	srlx	%l5,	0x1C,	%o7
	edge8	%g7,	%o1,	%i2
	mulscc	%l4,	%i3,	%g6
	fbug	%fcc1,	loop_2769
	edge16ln	%i6,	%g5,	%o0
	fmovrdne	%g1,	%f8,	%f10
	bge	loop_2770
loop_2769:
	brlez	%i7,	loop_2771
	fmovdneg	%icc,	%f3,	%f1
	fbu	%fcc1,	loop_2772
loop_2770:
	umul	%g4,	0x0287,	%g3
loop_2771:
	sllx	%l0,	%i4,	%o6
	edge8	%l2,	%i1,	%o3
loop_2772:
	udivx	%i0,	0x0CEE,	%o5
	addcc	%l3,	%o4,	%i5
	array32	%l6,	%l1,	%o2
	add	%g2,	0x04D4,	%l5
	tn	%icc,	0x6
	sdivx	%g7,	0x0346,	%o7
	edge8ln	%o1,	%i2,	%i3
	array16	%l4,	%g6,	%g5
	ldsh	[%l7 + 0x76],	%o0
	bl,pn	%icc,	loop_2773
	tsubcctv	%g1,	0x080D,	%i7
	nop
	setx	0x6955153788C171DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xCBFC9BCDE81699E3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f4,	%f2
	lduw	[%l7 + 0x10],	%i6
loop_2773:
	bgu	loop_2774
	fpadd32s	%f31,	%f5,	%f11
	fmovrsgz	%g4,	%f10,	%f14
	be,a,pt	%xcc,	loop_2775
loop_2774:
	movg	%xcc,	%g3,	%i4
	xnor	%o6,	0x02D8,	%l2
	nop
	set	0x26, %g1
	sth	%l0,	[%l7 + %g1]
loop_2775:
	add	%o3,	0x07C7,	%i0
	umulcc	%i1,	%l3,	%o4
	addccc	%o5,	0x169E,	%i5
	edge32l	%l6,	%l1,	%o2
	subcc	%l5,	0x09DB,	%g2
	tleu	%icc,	0x2
	movge	%icc,	%g7,	%o1
	set	0x28, %i3
	stwa	%o7,	[%l7 + %i3] 0x19
	array8	%i3,	%i2,	%l4
	edge32l	%g5,	%g6,	%o0
	swap	[%l7 + 0x0C],	%g1
	bvs,pt	%icc,	loop_2776
	sdivcc	%i6,	0x0C76,	%i7
	addccc	%g3,	0x18A8,	%g4
	fmul8x16al	%f17,	%f18,	%f16
loop_2776:
	fornot1	%f0,	%f18,	%f26
	umul	%i4,	%o6,	%l0
	tne	%icc,	0x2
	fbo,a	%fcc0,	loop_2777
	fmovrdlz	%l2,	%f20,	%f10
	nop
	setx	loop_2778,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bl,pn	%xcc,	loop_2779
loop_2777:
	array32	%o3,	%i0,	%i1
	movl	%icc,	%o4,	%o5
loop_2778:
	srlx	%l3,	%l6,	%i5
loop_2779:
	call	loop_2780
	sdiv	%o2,	0x09F1,	%l5
	orcc	%l1,	0x1990,	%g7
	edge32ln	%o1,	%o7,	%g2
loop_2780:
	mova	%icc,	%i3,	%l4
	udivx	%i2,	0x1670,	%g6
	movre	%g5,	%g1,	%i6
	tneg	%xcc,	0x6
	tvc	%icc,	0x1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x30] %asi,	%o0
	and	%i7,	%g3,	%g4
	prefetch	[%l7 + 0x60],	 0x0
	fble	%fcc2,	loop_2781
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f0
	edge8n	%o6,	%l0,	%i4
	subccc	%l2,	%o3,	%i1
loop_2781:
	fnot1s	%f23,	%f16
	brz	%i0,	loop_2782
	fmovrdlez	%o4,	%f8,	%f26
	tsubcc	%l3,	0x0AC3,	%l6
	bpos	%xcc,	loop_2783
loop_2782:
	sll	%i5,	0x14,	%o2
	sdivcc	%o5,	0x1AA2,	%l1
	fmovscs	%icc,	%f24,	%f18
loop_2783:
	fmovdle	%xcc,	%f13,	%f1
	fmovdvs	%icc,	%f15,	%f21
	fexpand	%f0,	%f28
	fbo	%fcc2,	loop_2784
	fxnor	%f14,	%f30,	%f28
	udivcc	%g7,	0x0A60,	%l5
	tge	%icc,	0x1
loop_2784:
	te	%icc,	0x5
	movrlez	%o1,	0x17A,	%g2
	edge32ln	%o7,	%l4,	%i3
	edge8l	%g6,	%i2,	%g1
	bge,pt	%xcc,	loop_2785
	tneg	%icc,	0x3
	popc	0x0946,	%g5
	move	%icc,	%i6,	%i7
loop_2785:
	movvs	%xcc,	%g3,	%g4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%o0
	bvs,a	loop_2786
	fmovd	%f8,	%f24
	tl	%xcc,	0x6
	call	loop_2787
loop_2786:
	nop
	setx	0x9E0B4AE080588A37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fmovsn	%icc,	%f2,	%f24
	fbuge	%fcc3,	loop_2788
loop_2787:
	array16	%o6,	%i4,	%l2
	edge16ln	%l0,	%o3,	%i1
	movvc	%icc,	%o4,	%l3
loop_2788:
	fpsub32	%f2,	%f22,	%f22
	fxnors	%f11,	%f11,	%f19
	fpadd16s	%f29,	%f2,	%f16
	fble	%fcc0,	loop_2789
	fpadd16s	%f5,	%f9,	%f12
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x70] %asi,	%i0
loop_2789:
	movre	%l6,	%o2,	%i5
	fpsub32s	%f31,	%f12,	%f29
	fblg,a	%fcc0,	loop_2790
	fmovsl	%xcc,	%f2,	%f23
	edge16n	%o5,	%g7,	%l5
	std	%f10,	[%l7 + 0x10]
loop_2790:
	smulcc	%o1,	0x159A,	%l1
	wr	%g0,	0x80,	%asi
	stxa	%o7,	[%l7 + 0x10] %asi
	movrgez	%l4,	%g2,	%g6
	movneg	%icc,	%i2,	%g1
	taddcctv	%g5,	%i6,	%i7
	fmovrdgz	%g3,	%f12,	%f22
	alignaddr	%g4,	%o0,	%i3
	ba	loop_2791
	fmovsvs	%xcc,	%f18,	%f13
	fmuld8ulx16	%f4,	%f27,	%f26
	ldsw	[%l7 + 0x10],	%o6
loop_2791:
	fornot1	%f18,	%f18,	%f2
	subccc	%i4,	%l0,	%o3
	fornot2s	%f31,	%f10,	%f3
	fbl	%fcc0,	loop_2792
	srlx	%i1,	0x0C,	%o4
	addccc	%l2,	0x158B,	%i0
	array32	%l3,	%l6,	%o2
loop_2792:
	ld	[%l7 + 0x58],	%f23
	orncc	%o5,	0x0A0D,	%i5
	movrgez	%l5,	0x1D0,	%o1
	andn	%g7,	%l1,	%o7
	tle	%xcc,	0x4
	fbul	%fcc0,	loop_2793
	andn	%l4,	%g2,	%i2
	nop
	fitos	%f5,	%f11
	fpadd32s	%f7,	%f29,	%f16
loop_2793:
	array32	%g6,	%g5,	%i6
	nop
	fitod	%f2,	%f8
	fdtoi	%f8,	%f10
	nop
	fitos	%f8,	%f20
	fstod	%f20,	%f26
	brz	%i7,	loop_2794
	ldd	[%l7 + 0x28],	%f22
	movrlez	%g1,	%g4,	%o0
	fpack32	%f16,	%f20,	%f16
loop_2794:
	stw	%g3,	[%l7 + 0x14]
	srlx	%o6,	%i4,	%l0
	subcc	%o3,	0x1F55,	%i1
	bn,pn	%xcc,	loop_2795
	edge32n	%o4,	%i3,	%i0
	bcs,a,pn	%icc,	loop_2796
	xnor	%l2,	0x03A5,	%l3
loop_2795:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l6,	0x13F2,	%o5
loop_2796:
	sethi	0x1793,	%i5
	edge32ln	%l5,	%o1,	%g7
	fba	%fcc0,	loop_2797
	orncc	%o2,	0x08F3,	%o7
	xor	%l4,	0x0972,	%l1
	fmovse	%xcc,	%f3,	%f18
loop_2797:
	nop
	set	0x68, %o4
	sta	%f16,	[%l7 + %o4] 0x81
	movle	%xcc,	%g2,	%g6
	udivcc	%g5,	0x1EC8,	%i6
	andn	%i2,	%g1,	%i7
	nop
	setx	loop_2798,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba,a	loop_2799
	movvc	%icc,	%g4,	%g3
	brz	%o0,	loop_2800
loop_2798:
	movrgz	%o6,	0x119,	%i4
loop_2799:
	movrgez	%l0,	%i1,	%o3
	umul	%o4,	0x053A,	%i0
loop_2800:
	array8	%l2,	%l3,	%l6
	umulcc	%i3,	0x0D67,	%i5
	movleu	%icc,	%l5,	%o5
	bneg,a	%xcc,	loop_2801
	andncc	%o1,	%o2,	%g7
	movrgz	%l4,	%l1,	%o7
	tle	%icc,	0x2
loop_2801:
	edge16l	%g2,	%g5,	%g6
	tge	%xcc,	0x3
	edge8	%i6,	%i2,	%g1
	sir	0x1FDE
	bshuffle	%f2,	%f0,	%f26
	addccc	%i7,	0x077A,	%g4
	udiv	%o0,	0x0B2E,	%g3
	stw	%o6,	[%l7 + 0x0C]
	fmovsa	%xcc,	%f22,	%f30
	fnand	%f14,	%f6,	%f26
	fsrc2	%f8,	%f12
	fbug,a	%fcc0,	loop_2802
	fpsub32	%f20,	%f4,	%f0
	addc	%l0,	0x1AAD,	%i4
	srax	%i1,	0x16,	%o3
loop_2802:
	fand	%f2,	%f2,	%f8
	edge8n	%o4,	%l2,	%i0
	fmovrslez	%l6,	%f25,	%f12
	ta	%icc,	0x0
	edge8n	%l3,	%i5,	%l5
	sll	%o5,	0x03,	%o1
	fmovsa	%xcc,	%f23,	%f23
	fpadd16s	%f29,	%f27,	%f17
	fnegd	%f20,	%f0
	fcmpgt16	%f4,	%f8,	%o2
	fandnot2	%f0,	%f4,	%f0
	fmovsleu	%icc,	%f9,	%f24
	tsubcctv	%i3,	0x0353,	%l4
	movrgez	%l1,	%o7,	%g7
	tpos	%xcc,	0x3
	taddcc	%g2,	%g5,	%g6
	bgu,a,pn	%xcc,	loop_2803
	ba,pt	%icc,	loop_2804
	edge8	%i2,	%i6,	%g1
	edge32n	%g4,	%i7,	%g3
loop_2803:
	ldd	[%l7 + 0x40],	%o0
loop_2804:
	nop
	set	0x44, %o0
	sta	%f18,	[%l7 + %o0] 0x81
	udivcc	%l0,	0x0A00,	%o6
	fmovsneg	%icc,	%f30,	%f27
	bge,a	%xcc,	loop_2805
	sdiv	%i4,	0x0DAF,	%o3
	nop
	fitos	%f5,	%f16
	fstod	%f16,	%f26
	te	%icc,	0x7
loop_2805:
	movleu	%icc,	%o4,	%i1
	nop
	setx	loop_2806,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l2,	%l6,	%l3
	ld	[%l7 + 0x4C],	%f26
	ld	[%l7 + 0x7C],	%f22
loop_2806:
	and	%i5,	0x1AA1,	%i0
	tcc	%icc,	0x2
	tl	%icc,	0x0
	alignaddr	%o5,	%o1,	%l5
	and	%i3,	0x13DE,	%l4
	stbar
	addc	%o2,	%l1,	%g7
	nop
	setx	0xA496B25669382A91,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f10
	or	%o7,	%g2,	%g6
	fsrc1s	%f10,	%f19
	be,pt	%xcc,	loop_2807
	fzero	%f0
	edge32	%i2,	%i6,	%g5
	fmovdvc	%xcc,	%f22,	%f9
loop_2807:
	fbul,a	%fcc2,	loop_2808
	subccc	%g4,	0x139F,	%g1
	add	%g3,	0x1A88,	%i7
	fmovscc	%xcc,	%f21,	%f29
loop_2808:
	nop
	setx	loop_2809,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%icc,	0x1
	fmul8x16au	%f29,	%f12,	%f8
	alignaddr	%o0,	%l0,	%o6
loop_2809:
	ldub	[%l7 + 0x42],	%o3
	xorcc	%i4,	%i1,	%l2
	brnz	%o4,	loop_2810
	sir	0x1B84
	orn	%l3,	0x0736,	%l6
	bleu,pn	%icc,	loop_2811
loop_2810:
	fnors	%f8,	%f11,	%f16
	move	%xcc,	%i0,	%o5
	edge32l	%i5,	%o1,	%l5
loop_2811:
	tg	%xcc,	0x1
	fnands	%f16,	%f20,	%f3
	movgu	%icc,	%l4,	%i3
	tl	%icc,	0x6
	movcc	%xcc,	%o2,	%g7
	bgu,pn	%icc,	loop_2812
	fmul8x16al	%f28,	%f20,	%f12
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o7
loop_2812:
	subc	%l1,	0x110B,	%g6
	array32	%g2,	%i6,	%i2
	and	%g5,	%g1,	%g4
	prefetch	[%l7 + 0x10],	 0x0
	fbu	%fcc1,	loop_2813
	bvs	loop_2814
	bge,a	%icc,	loop_2815
	srlx	%i7,	0x06,	%o0
loop_2813:
	fmovdneg	%icc,	%f10,	%f14
loop_2814:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x6F] %asi,	%g3
loop_2815:
	tl	%icc,	0x2
	umul	%l0,	0x0782,	%o6
	stb	%i4,	[%l7 + 0x79]
	wr	%g0,	0x10,	%asi
	stwa	%i1,	[%l7 + 0x24] %asi
	orn	%l2,	0x0F19,	%o4
	movrne	%l3,	%o3,	%i0
	nop
	setx	loop_2816,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%o5,	0x03AD,	%i5
	fpsub32	%f20,	%f28,	%f2
	tg	%icc,	0x7
loop_2816:
	movgu	%xcc,	%l6,	%l5
	tcs	%xcc,	0x2
	bcc	loop_2817
	tle	%xcc,	0x3
	movn	%icc,	%o1,	%l4
	lduh	[%l7 + 0x50],	%i3
loop_2817:
	xnor	%o2,	%o7,	%l1
	brz,a	%g7,	loop_2818
	fabss	%f12,	%f11
	xorcc	%g6,	0x07BE,	%g2
	fnot1s	%f17,	%f11
loop_2818:
	movne	%icc,	%i2,	%i6
	taddcc	%g1,	0x052D,	%g4
	bne,pt	%xcc,	loop_2819
	fmovrdgz	%g5,	%f14,	%f30
	edge16	%o0,	%i7,	%g3
	fbe	%fcc3,	loop_2820
loop_2819:
	tne	%icc,	0x2
	xnorcc	%l0,	%i4,	%o6
	nop
	fitod	%f6,	%f24
	fdtoi	%f24,	%f7
loop_2820:
	fzeros	%f13
	bcs,pn	%xcc,	loop_2821
	addc	%i1,	%o4,	%l3
	edge16l	%o3,	%i0,	%l2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x76] %asi,	%o5
loop_2821:
	udiv	%l6,	0x171D,	%i5
	mova	%xcc,	%l5,	%l4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	nop
	set	0x6C, %g6
	stw	%o1,	[%l7 + %g6]
	te	%icc,	0x6
	tpos	%icc,	0x7
	udivx	%o2,	0x1C1B,	%o7
	tn	%xcc,	0x6
	membar	0x5E
	fbn,a	%fcc1,	loop_2822
	sllx	%l1,	0x06,	%g6
	addccc	%g2,	0x1E06,	%i2
	array16	%i6,	%g1,	%g7
loop_2822:
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f12
	fmovsleu	%icc,	%f20,	%f19
	udivx	%g5,	0x1012,	%g4
	edge32ln	%o0,	%i7,	%g3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l0,	%i4
	umul	%i1,	0x04F3,	%o4
	fmovde	%xcc,	%f3,	%f18
	fcmpne32	%f26,	%f30,	%o6
	subccc	%o3,	%i0,	%l2
	nop
	fitos	%f12,	%f28
	fstod	%f28,	%f0
	set	0x4C, %o1
	swapa	[%l7 + %o1] 0x89,	%o5
	tvc	%icc,	0x7
	movvs	%icc,	%l3,	%l6
	tsubcctv	%i5,	%l5,	%i3
	movcc	%xcc,	%o1,	%l4
	sub	%o2,	0x1E8E,	%o7
	tg	%icc,	0x7
	fmovdleu	%xcc,	%f21,	%f11
	fpsub16s	%f2,	%f19,	%f23
	fpadd16s	%f7,	%f24,	%f15
	edge32l	%l1,	%g6,	%g2
	addc	%i6,	%g1,	%g7
	nop
	fitos	%f3,	%f25
	fstox	%f25,	%f22
	movne	%icc,	%g5,	%g4
	sub	%o0,	%i7,	%i2
	popc	%l0,	%g3
	movvc	%xcc,	%i4,	%o4
	fmovrslz	%o6,	%f25,	%f10
	addccc	%i1,	%o3,	%i0
	sllx	%l2,	%l3,	%l6
	fmovsne	%icc,	%f31,	%f5
	array32	%o5,	%i5,	%l5
	fbul	%fcc0,	loop_2823
	movneg	%icc,	%i3,	%o1
	edge8n	%o2,	%o7,	%l1
	movl	%xcc,	%g6,	%g2
loop_2823:
	edge8ln	%i6,	%l4,	%g7
	fmovspos	%xcc,	%f6,	%f22
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x11
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	edge32n	%g1,	%o0,	%g4
	set	0x48, %o7
	swapa	[%l7 + %o7] 0x11,	%i2
	and	%i7,	0x0E94,	%g3
	fbne,a	%fcc1,	loop_2824
	ldd	[%l7 + 0x58],	%f0
	lduw	[%l7 + 0x40],	%l0
	fbug,a	%fcc0,	loop_2825
loop_2824:
	sub	%o4,	0x0EB6,	%o6
	orncc	%i4,	%o3,	%i0
	movrlez	%l2,	%i1,	%l6
loop_2825:
	fbe	%fcc3,	loop_2826
	fmovdn	%xcc,	%f24,	%f1
	set	0x23, %g5
	ldsba	[%l7 + %g5] 0x88,	%o5
loop_2826:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x04,	%i5,	%l3
	sir	0x05FC
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l5
	fbl,a	%fcc3,	loop_2827
	tpos	%xcc,	0x4
	fbo	%fcc3,	loop_2828
	taddcctv	%i3,	0x0A45,	%o1
loop_2827:
	fpsub32s	%f30,	%f17,	%f12
	movpos	%icc,	%o7,	%l1
loop_2828:
	orcc	%o2,	0x0255,	%g6
	tcs	%icc,	0x6
	fmovsge	%icc,	%f14,	%f30
	fsrc1	%f26,	%f26
	sdiv	%i6,	0x0786,	%l4
	fmuld8sux16	%f25,	%f1,	%f6
	umul	%g7,	%g2,	%g5
	edge32ln	%o0,	%g1,	%i2
	addccc	%g4,	%i7,	%g3
	edge8	%o4,	%o6,	%l0
	stw	%i4,	[%l7 + 0x2C]
	nop
	setx	0xAD0921A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x3B0F1EAD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f4,	%f29
	bneg	%xcc,	loop_2829
	add	%o3,	%l2,	%i1
	movrne	%i0,	%l6,	%o5
	movrne	%l3,	0x2ED,	%i5
loop_2829:
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f21
	movcs	%xcc,	%l5,	%i3
	edge8	%o1,	%o7,	%o2
	fbul,a	%fcc3,	loop_2830
	tn	%icc,	0x4
	fmovrdgez	%l1,	%f16,	%f16
	tvs	%xcc,	0x7
loop_2830:
	ldub	[%l7 + 0x52],	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l4,	%g7,	%g2
	sdiv	%g5,	0x0AF8,	%g6
	or	%g1,	%o0,	%g4
	nop
	fitos	%f1,	%f27
	fstoi	%f27,	%f6
	fandnot1	%f26,	%f24,	%f24
	tge	%icc,	0x4
	fcmple32	%f0,	%f8,	%i7
	movvc	%icc,	%i2,	%o4
	taddcctv	%o6,	0x0A60,	%l0
	bpos,a,pn	%icc,	loop_2831
	move	%xcc,	%i4,	%g3
	fcmpne16	%f10,	%f2,	%o3
	fmovdcs	%icc,	%f14,	%f10
loop_2831:
	fmovsleu	%xcc,	%f15,	%f0
	fxor	%f26,	%f30,	%f22
	tcc	%xcc,	0x3
	array32	%l2,	%i1,	%l6
	xorcc	%o5,	0x09F4,	%i0
	ldsw	[%l7 + 0x60],	%l3
	movrlez	%l5,	%i5,	%o1
	fcmpeq32	%f4,	%f4,	%o7
	movgu	%icc,	%o2,	%i3
	brlez	%l1,	loop_2832
	xnorcc	%i6,	%l4,	%g2
	tvc	%icc,	0x7
	mova	%icc,	%g5,	%g6
loop_2832:
	ble,pt	%xcc,	loop_2833
	fmovsa	%xcc,	%f12,	%f18
	sllx	%g1,	0x15,	%o0
	and	%g7,	%i7,	%g4
loop_2833:
	mulx	%o4,	%i2,	%l0
	or	%i4,	%o6,	%o3
	alignaddr	%g3,	%i1,	%l2
	movneg	%icc,	%o5,	%i0
	membar	0x34
	movvs	%icc,	%l6,	%l5
	fmovdne	%xcc,	%f24,	%f15
	ta	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i5,	%l3,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f8,	%f10
	pdist	%f26,	%f16,	%f4
	move	%xcc,	%o7,	%i3
	taddcctv	%o2,	0x1C1A,	%l1
	andcc	%i6,	%l4,	%g5
	movrlez	%g6,	%g2,	%g1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x18] %asi,	%f1
	bgu,pn	%icc,	loop_2834
	movgu	%icc,	%o0,	%g7
	tsubcc	%i7,	0x15A2,	%o4
	fpmerge	%f10,	%f24,	%f0
loop_2834:
	subcc	%i2,	%g4,	%i4
	tn	%icc,	0x4
	sethi	0x1F51,	%l0
	fmovdge	%icc,	%f15,	%f7
	fsrc2s	%f15,	%f22
	fblg,a	%fcc3,	loop_2835
	tne	%xcc,	0x0
	orcc	%o3,	0x1648,	%o6
	movvc	%xcc,	%g3,	%i1
loop_2835:
	ta	%xcc,	0x1
	subc	%l2,	0x0A6D,	%o5
	umulcc	%l6,	%i0,	%i5
	fmovdleu	%xcc,	%f12,	%f26
	ldx	[%l7 + 0x28],	%l3
	subc	%l5,	0x03A0,	%o7
	sdivx	%i3,	0x19C6,	%o1
	edge32	%o2,	%l1,	%l4
	brz,a	%g5,	loop_2836
	add	%i6,	0x10B2,	%g2
	fmovdcc	%icc,	%f28,	%f14
	fmovsvc	%xcc,	%f0,	%f29
loop_2836:
	fcmpgt16	%f30,	%f2,	%g1
	fmovsvc	%icc,	%f24,	%f11
	fmovrsne	%o0,	%f1,	%f3
	set	0x52, %l6
	ldsba	[%l7 + %l6] 0x80,	%g7
	membar	0x61
	sra	%g6,	%i7,	%i2
	movre	%o4,	%i4,	%g4
	sdivcc	%l0,	0x0F76,	%o3
	alignaddrl	%g3,	%o6,	%l2
	nop
	setx loop_2837, %l0, %l1
	jmpl %l1, %i1
	bvc,a,pn	%xcc,	loop_2838
	alignaddr	%o5,	%i0,	%l6
	movvc	%xcc,	%i5,	%l3
loop_2837:
	edge16	%l5,	%o7,	%o1
loop_2838:
	subcc	%o2,	0x1471,	%l1
	fbule,a	%fcc1,	loop_2839
	umul	%i3,	0x0D76,	%l4
	fmovsa	%xcc,	%f1,	%f17
	udivcc	%i6,	0x100E,	%g5
loop_2839:
	fblg	%fcc2,	loop_2840
	taddcc	%g2,	0x014E,	%g1
	sdivx	%o0,	0x02DF,	%g7
	movg	%icc,	%i7,	%i2
loop_2840:
	array16	%o4,	%i4,	%g6
	fmul8x16	%f11,	%f2,	%f0
	tsubcctv	%l0,	0x0757,	%g4
	edge16l	%g3,	%o3,	%o6
	fbo	%fcc0,	loop_2841
	fmovsg	%icc,	%f15,	%f17
	fnot2	%f18,	%f8
	fbu,a	%fcc1,	loop_2842
loop_2841:
	fmovsge	%xcc,	%f23,	%f24
	fzero	%f14
	ldstub	[%l7 + 0x2E],	%l2
loop_2842:
	taddcctv	%o5,	0x1BBC,	%i0
	add	%i1,	%l6,	%i5
	fmovsle	%xcc,	%f18,	%f4
	fnegd	%f18,	%f4
	nop
	setx	0x6D9EFD59,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f2
	array16	%l5,	%o7,	%o1
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f14
	fbue,a	%fcc3,	loop_2843
	fmovdcc	%xcc,	%f18,	%f14
	movleu	%icc,	%l3,	%l1
	fsrc2s	%f10,	%f1
loop_2843:
	udivx	%i3,	0x144C,	%o2
	srax	%l4,	%i6,	%g2
	addc	%g5,	%o0,	%g1
	swap	[%l7 + 0x20],	%i7
	movrgz	%i2,	0x23D,	%g7
	fmovdle	%icc,	%f19,	%f2
	edge8	%i4,	%g6,	%o4
	sdivcc	%l0,	0x1E74,	%g4
	fmovsne	%xcc,	%f17,	%f30
	taddcc	%g3,	%o3,	%l2
	srlx	%o5,	%o6,	%i0
	movneg	%icc,	%i1,	%l6
	alignaddrl	%i5,	%l5,	%o7
	bvs	%xcc,	loop_2844
	fpadd16s	%f2,	%f31,	%f7
	fnot2s	%f25,	%f4
	taddcc	%l3,	0x00E3,	%o1
loop_2844:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	movvc	%icc,	%l1,	%l4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x45] %asi,	%o2
	sllx	%g2,	0x12,	%i6
	nop
	setx	0x138AD469,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x79084DF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f26,	%f23
	fbne,a	%fcc3,	loop_2845
	movrgz	%o0,	0x044,	%g5
	movneg	%icc,	%i7,	%g1
	addc	%i2,	%i4,	%g7
loop_2845:
	subccc	%g6,	%o4,	%l0
	bleu	loop_2846
	srl	%g4,	0x07,	%g3
	fbe	%fcc0,	loop_2847
	ta	%xcc,	0x2
loop_2846:
	fbn,a	%fcc0,	loop_2848
	lduw	[%l7 + 0x40],	%o3
loop_2847:
	nop
	setx	0x4D398B61A06E369C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fble	%fcc0,	loop_2849
loop_2848:
	umul	%o5,	0x02AC,	%l2
	fmovdne	%icc,	%f16,	%f13
	popc	%i0,	%o6
loop_2849:
	fmovsvc	%xcc,	%f27,	%f10
	tsubcctv	%l6,	%i1,	%l5
	srax	%o7,	%l3,	%i5
	movle	%xcc,	%i3,	%l1
	srlx	%o1,	0x02,	%o2
	fcmpgt32	%f18,	%f4,	%l4
	subccc	%g2,	%o0,	%i6
	movgu	%icc,	%i7,	%g1
	taddcctv	%i2,	0x1F42,	%g5
	nop
	setx	loop_2850,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%g7,	%i4
	taddcc	%g6,	0x1126,	%l0
	wr	%g0,	0x89,	%asi
	stha	%g4,	[%l7 + 0x38] %asi
loop_2850:
	fbule,a	%fcc0,	loop_2851
	subccc	%g3,	0x127B,	%o3
	tl	%icc,	0x4
	sra	%o5,	%l2,	%o4
loop_2851:
	fxor	%f24,	%f0,	%f8
	fornot1s	%f30,	%f14,	%f14
	taddcc	%o6,	0x0910,	%l6
	sdiv	%i1,	0x0106,	%i0
	tsubcctv	%l5,	0x1902,	%o7
	tcc	%xcc,	0x3
	fmovdvc	%icc,	%f27,	%f7
	addccc	%l3,	%i3,	%l1
	fandnot1s	%f27,	%f7,	%f20
	sll	%i5,	0x18,	%o2
	movgu	%xcc,	%l4,	%o1
	movrgz	%o0,	%i6,	%g2
	fpack32	%f18,	%f30,	%f2
	fand	%f0,	%f12,	%f24
	fmovsle	%xcc,	%f12,	%f13
	fmul8ulx16	%f30,	%f14,	%f0
	edge32	%g1,	%i7,	%g5
	edge8l	%g7,	%i4,	%g6
	edge8	%i2,	%g4,	%g3
	edge16n	%l0,	%o3,	%o5
	andcc	%o4,	0x05E5,	%l2
	tge	%xcc,	0x3
	tgu	%icc,	0x3
	edge16	%o6,	%i1,	%i0
	alignaddrl	%l6,	%o7,	%l3
	membar	0x7C
	movrgez	%l5,	0x28A,	%l1
	sethi	0x0E6E,	%i5
	srlx	%i3,	0x1A,	%l4
	faligndata	%f6,	%f10,	%f16
	edge8	%o2,	%o1,	%o0
	nop
	setx	0x4715CA8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x73660446,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f9,	%f9
	or	%i6,	%g1,	%g2
	udivcc	%g5,	0x1DEA,	%i7
	nop
	setx	0x2F6278F56F354251,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x88B428B0F0DE4C85,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f20,	%f6
	and	%g7,	%i4,	%g6
	tneg	%icc,	0x0
	ldub	[%l7 + 0x43],	%i2
	fba,a	%fcc0,	loop_2852
	movvc	%icc,	%g3,	%l0
	movcc	%xcc,	%g4,	%o5
	xnor	%o3,	0x1198,	%l2
loop_2852:
	tpos	%icc,	0x1
	tpos	%xcc,	0x4
	movn	%icc,	%o6,	%o4
	fbo,a	%fcc1,	loop_2853
	tle	%xcc,	0x6
	srl	%i1,	%i0,	%l6
	sub	%l3,	%l5,	%l1
loop_2853:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	edge16n	%o7,	%i3,	%o2
	fandnot2	%f4,	%f22,	%f8
	fbuge	%fcc0,	loop_2854
	stbar
	sethi	0x12FD,	%l4
	xnor	%o1,	0x0123,	%i6
loop_2854:
	stx	%g1,	[%l7 + 0x18]
	fmovsvs	%xcc,	%f28,	%f28
	fble	%fcc1,	loop_2855
	movrgez	%o0,	0x214,	%g2
	bgu,a	loop_2856
	movge	%xcc,	%i7,	%g7
loop_2855:
	sra	%i4,	0x0B,	%g5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g6
loop_2856:
	for	%f24,	%f2,	%f10
	be,a	loop_2857
	tvc	%xcc,	0x7
	tne	%icc,	0x5
	fandnot2s	%f6,	%f8,	%f26
loop_2857:
	movrgez	%i2,	0x15D,	%l0
	edge8ln	%g4,	%o5,	%g3
	prefetch	[%l7 + 0x24],	 0x1
	smulcc	%o3,	0x0662,	%l2
	alignaddrl	%o6,	%i1,	%i0
	tvs	%icc,	0x2
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x2C, %l4
	stwa	%l6,	[%l7 + %l4] 0x11
	sllx	%o4,	%l3,	%l5
	brgz,a	%l1,	loop_2858
	tg	%xcc,	0x6
	edge8l	%i5,	%o7,	%i3
	set	0x61, %i5
	lduba	[%l7 + %i5] 0x18,	%l4
loop_2858:
	fbug	%fcc2,	loop_2859
	tvs	%xcc,	0x0
	subc	%o1,	%i6,	%g1
	movcc	%icc,	%o0,	%o2
loop_2859:
	orncc	%i7,	%g7,	%i4
	movrlez	%g5,	0x3A5,	%g2
	te	%xcc,	0x0
	fnegs	%f4,	%f5
	tvs	%xcc,	0x0
	tvc	%xcc,	0x2
	fnegs	%f30,	%f23
	fmovsge	%xcc,	%f1,	%f2
	sll	%i2,	0x1E,	%l0
	wr	%g0,	0x2b,	%asi
	stxa	%g6,	[%l7 + 0x78] %asi
	membar	#Sync
	bcs,a,pn	%icc,	loop_2860
	fmovdneg	%icc,	%f16,	%f4
	movge	%xcc,	%g4,	%g3
	stx	%o5,	[%l7 + 0x60]
loop_2860:
	edge32	%l2,	%o3,	%o6
	fble,a	%fcc0,	loop_2861
	fbue,a	%fcc3,	loop_2862
	movrgez	%i1,	%i0,	%l6
	udivx	%l3,	0x15CB,	%l5
loop_2861:
	orn	%l1,	0x1FA5,	%i5
loop_2862:
	subc	%o4,	0x1F93,	%i3
	ldd	[%l7 + 0x18],	%f6
	movcc	%icc,	%o7,	%l4
	xnor	%i6,	0x1482,	%o1
	bl,a	loop_2863
	movrne	%o0,	0x026,	%g1
	movre	%i7,	0x293,	%g7
	movrne	%o2,	%i4,	%g5
loop_2863:
	orcc	%i2,	%g2,	%g6
	tle	%xcc,	0x3
	fcmpne16	%f2,	%f20,	%l0
	fmovsg	%xcc,	%f31,	%f29
	ble	%icc,	loop_2864
	fba	%fcc2,	loop_2865
	fbn,a	%fcc0,	loop_2866
	tgu	%icc,	0x1
loop_2864:
	stbar
loop_2865:
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f22
loop_2866:
	fnot2	%f6,	%f0
	fba,a	%fcc2,	loop_2867
	nop
	fitos	%f27,	%f29
	xor	%g3,	%g4,	%o5
	bneg,a	%xcc,	loop_2868
loop_2867:
	subcc	%o3,	%l2,	%o6
	and	%i1,	%l6,	%l3
	sir	0x1561
loop_2868:
	edge32	%l5,	%l1,	%i5
	fxnor	%f20,	%f22,	%f8
	edge8	%o4,	%i0,	%o7
	bneg,a,pn	%icc,	loop_2869
	fabss	%f11,	%f8
	fnors	%f23,	%f1,	%f18
	edge16	%l4,	%i3,	%o1
loop_2869:
	fbul	%fcc0,	loop_2870
	brgz	%o0,	loop_2871
	fblg	%fcc0,	loop_2872
	bvs,a,pn	%xcc,	loop_2873
loop_2870:
	addcc	%g1,	0x0537,	%i6
loop_2871:
	edge16l	%g7,	%o2,	%i7
loop_2872:
	sub	%g5,	%i2,	%g2
loop_2873:
	ble,a	loop_2874
	sll	%g6,	%l0,	%g3
	sethi	0x024D,	%i4
	tl	%icc,	0x7
loop_2874:
	fmovrde	%g4,	%f24,	%f2
	edge16	%o3,	%l2,	%o5
	fnot2s	%f24,	%f5
	addcc	%o6,	%l6,	%i1
	fmovdn	%xcc,	%f1,	%f1
	bvc	%icc,	loop_2875
	ldstub	[%l7 + 0x31],	%l3
	edge32	%l5,	%i5,	%l1
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2875:
	movcc	%xcc,	%i0,	%o7
	fba,a	%fcc1,	loop_2876
	movpos	%xcc,	%l4,	%o4
	fcmpgt32	%f22,	%f24,	%o1
	movleu	%xcc,	%o0,	%g1
loop_2876:
	fnot2	%f28,	%f30
	fmovdpos	%icc,	%f2,	%f26
	tleu	%icc,	0x2
	fba	%fcc0,	loop_2877
	movre	%i3,	0x3EF,	%i6
	xor	%o2,	0x1D10,	%i7
	orncc	%g7,	%g5,	%i2
loop_2877:
	movrlez	%g6,	0x0E4,	%l0
	fcmpeq32	%f16,	%f12,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i4,	0x1287,	%g4
	fmovdg	%icc,	%f8,	%f31
	pdist	%f0,	%f26,	%f18
	fmuld8ulx16	%f23,	%f27,	%f28
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movgu	%xcc,	%g2,	%l2
	edge32n	%o3,	%o6,	%l6
	fmovdleu	%xcc,	%f30,	%f13
	movcc	%xcc,	%i1,	%l3
	brlez	%l5,	loop_2878
	movrne	%i5,	0x25D,	%o5
	addcc	%i0,	%l1,	%l4
	edge8l	%o4,	%o1,	%o0
loop_2878:
	fbul	%fcc1,	loop_2879
	udivx	%g1,	0x19DD,	%o7
	bg	%xcc,	loop_2880
	membar	0x00
loop_2879:
	subc	%i6,	%i3,	%o2
	umulcc	%g7,	%i7,	%g5
loop_2880:
	mulx	%i2,	0x1DCE,	%g6
	bg,a,pt	%xcc,	loop_2881
	movgu	%xcc,	%g3,	%i4
	taddcctv	%l0,	%g4,	%l2
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f16
loop_2881:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o3
	tn	%xcc,	0x6
	fmovd	%f16,	%f6
	fbug	%fcc3,	loop_2882
	tneg	%icc,	0x6
	xnor	%g2,	0x1AFF,	%o6
	tne	%xcc,	0x1
loop_2882:
	edge32l	%i1,	%l3,	%l5
	edge8	%l6,	%o5,	%i5
	fxnor	%f24,	%f8,	%f26
	orcc	%l1,	%i0,	%l4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o1,	%o4
	sdiv	%g1,	0x0941,	%o0
	ldsh	[%l7 + 0x68],	%o7
	edge8	%i3,	%o2,	%g7
	fsrc1s	%f27,	%f24
	edge32	%i7,	%i6,	%g5
	movg	%icc,	%i2,	%g6
	addcc	%i4,	%l0,	%g4
	tne	%xcc,	0x5
	tvs	%xcc,	0x1
	fornot1	%f30,	%f28,	%f10
	fsrc2	%f0,	%f8
	movvc	%icc,	%g3,	%o3
	set	0x44, %o3
	sta	%f27,	[%l7 + %o3] 0x19
	set	0x30, %l0
	swapa	[%l7 + %l0] 0x89,	%l2
	bcs	%icc,	loop_2883
	fmovdcs	%icc,	%f29,	%f19
	sllx	%o6,	%i1,	%l3
	array16	%g2,	%l6,	%l5
loop_2883:
	tvc	%xcc,	0x1
	add	%o5,	0x100E,	%i5
	fmovse	%xcc,	%f15,	%f17
	tpos	%xcc,	0x3
	tl	%icc,	0x6
	fpackfix	%f18,	%f13
	edge8n	%i0,	%l4,	%o1
	set	0x50, %o5
	prefetcha	[%l7 + %o5] 0x18,	 0x1
	sethi	0x028C,	%g1
	movneg	%icc,	%o0,	%o4
	nop
	setx	loop_2884,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%xcc,	0x5
	fand	%f30,	%f18,	%f0
	sir	0x0AB3
loop_2884:
	fpackfix	%f18,	%f16
	tge	%icc,	0x6
	fpsub16s	%f22,	%f12,	%f10
	mova	%icc,	%i3,	%o7
	smul	%o2,	0x0966,	%g7
	udivx	%i6,	0x0325,	%i7
	edge8ln	%g5,	%g6,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f23,	%f12
	taddcctv	%l0,	0x1DBA,	%i4
	lduh	[%l7 + 0x6C],	%g3
	tvs	%xcc,	0x7
	udivx	%g4,	0x09AA,	%l2
	movgu	%xcc,	%o6,	%o3
	ldsw	[%l7 + 0x78],	%l3
	bge,pt	%xcc,	loop_2885
	edge16l	%g2,	%l6,	%l5
	umulcc	%i1,	%i5,	%o5
	fmovdpos	%xcc,	%f30,	%f6
loop_2885:
	nop
	fitos	%f2,	%f29
	fstox	%f29,	%f30
	fxtos	%f30,	%f29
	tne	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x05D3,	%l4
	tsubcctv	%i0,	%o1,	%g1
	taddcctv	%o0,	%l1,	%o4
	umulcc	%o7,	0x07F0,	%i3
	and	%o2,	0x1C93,	%g7
	tsubcc	%i7,	0x009D,	%i6
	addc	%g5,	0x1BCF,	%i2
	tle	%xcc,	0x4
	fsrc1s	%f26,	%f9
	edge16n	%l0,	%g6,	%g3
	fmul8ulx16	%f0,	%f6,	%f6
	umulcc	%g4,	%i4,	%l2
	movne	%xcc,	%o3,	%l3
	movvc	%icc,	%o6,	%l6
	edge8ln	%g2,	%l5,	%i1
	popc	%i5,	%l4
	ldstub	[%l7 + 0x60],	%i0
	movl	%icc,	%o5,	%o1
	prefetch	[%l7 + 0x78],	 0x3
	tg	%xcc,	0x2
	tne	%xcc,	0x5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l1
	tcc	%xcc,	0x0
	stb	%o4,	[%l7 + 0x3B]
	edge8n	%o0,	%i3,	%o2
	orn	%o7,	0x05AE,	%g7
	move	%xcc,	%i7,	%g5
	subc	%i2,	%l0,	%i6
	move	%xcc,	%g6,	%g4
	ta	%xcc,	0x0
	orncc	%i4,	%l2,	%o3
	fmovsg	%xcc,	%f16,	%f17
	subcc	%g3,	%l3,	%l6
	movle	%xcc,	%o6,	%l5
	xorcc	%i1,	0x0675,	%g2
	tneg	%icc,	0x3
	fmul8ulx16	%f18,	%f8,	%f8
	be,a,pn	%xcc,	loop_2886
	array16	%l4,	%i5,	%o5
	or	%i0,	%g1,	%o1
	sir	0x00D5
loop_2886:
	fands	%f12,	%f8,	%f20
	movn	%xcc,	%l1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x4
	alignaddrl	%i3,	%o4,	%o7
	udivcc	%o2,	0x134C,	%i7
	sra	%g5,	0x01,	%g7
	movle	%xcc,	%i2,	%i6
	tcc	%xcc,	0x4
	tleu	%xcc,	0x1
	tsubcc	%l0,	%g4,	%i4
	orn	%g6,	0x13B6,	%l2
	umul	%o3,	%l3,	%l6
	tneg	%xcc,	0x1
	movne	%xcc,	%o6,	%g3
	alignaddrl	%i1,	%l5,	%g2
	bg,a	%icc,	loop_2887
	tgu	%icc,	0x4
	te	%xcc,	0x5
	smul	%i5,	0x1B96,	%l4
loop_2887:
	bg,a,pt	%icc,	loop_2888
	alignaddr	%o5,	%i0,	%o1
	te	%icc,	0x3
	set	0x12, %g4
	ldsha	[%l7 + %g4] 0x0c,	%g1
loop_2888:
	nop
	setx	loop_2889,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%icc,	%l1,	%i3
	subccc	%o0,	0x1DE9,	%o4
	sra	%o7,	%i7,	%o2
loop_2889:
	movvc	%xcc,	%g7,	%i2
	movcc	%icc,	%g5,	%l0
	fbge	%fcc2,	loop_2890
	flush	%l7 + 0x70
	addc	%i6,	0x0EF4,	%i4
	edge32ln	%g4,	%g6,	%o3
loop_2890:
	tl	%xcc,	0x4
	tg	%xcc,	0x2
	movrlz	%l2,	%l6,	%o6
	nop
	fitod	%f6,	%f24
	fdtos	%f24,	%f16
	fbge	%fcc1,	loop_2891
	std	%f4,	[%l7 + 0x78]
	xnor	%g3,	0x1EF9,	%l3
	mulx	%l5,	0x1E18,	%i1
loop_2891:
	fblg	%fcc0,	loop_2892
	tsubcctv	%g2,	0x17DF,	%l4
	movpos	%xcc,	%o5,	%i5
	tcs	%icc,	0x5
loop_2892:
	movn	%icc,	%o1,	%g1
	fsrc1s	%f14,	%f10
	subcc	%l1,	%i0,	%i3
	nop
	setx loop_2893, %l0, %l1
	jmpl %l1, %o4
	brgez	%o7,	loop_2894
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x1
loop_2893:
	fandnot2s	%f26,	%f25,	%f25
loop_2894:
	sir	0x1881
	addc	%o0,	0x0E89,	%o2
	sra	%i7,	%g7,	%g5
	fbl	%fcc3,	loop_2895
	fmovdcs	%xcc,	%f28,	%f23
	tleu	%xcc,	0x5
	bneg,pn	%icc,	loop_2896
loop_2895:
	edge32ln	%i2,	%l0,	%i6
	orncc	%g4,	0x182C,	%g6
	fmovdcc	%icc,	%f19,	%f7
loop_2896:
	add	%o3,	0x1D65,	%i4
	movle	%icc,	%l2,	%o6
	edge16	%g3,	%l3,	%l6
	fmovdn	%xcc,	%f18,	%f15
	tgu	%icc,	0x2
	movg	%icc,	%i1,	%l5
	movre	%g2,	0x3E9,	%l4
	tne	%icc,	0x3
	tvs	%xcc,	0x4
	smul	%i5,	0x11FC,	%o1
	set	0x110, %g3
	!stxa	%g1,	[%g0 + %g3] 0x21 ! Removed for bug
	pdist	%f18,	%f26,	%f2
	tge	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f10
	movge	%icc,	%l1,	%o5
	fbe,a	%fcc2,	loop_2897
	sub	%i0,	%o4,	%o7
	tn	%icc,	0x1
	movgu	%icc,	%o0,	%o2
loop_2897:
	subcc	%i7,	%i3,	%g5
	bvc	loop_2898
	edge8	%g7,	%l0,	%i6
	popc	%i2,	%g6
	brgez	%o3,	loop_2899
loop_2898:
	movneg	%icc,	%i4,	%l2
	smul	%g4,	%g3,	%l3
	fbu	%fcc2,	loop_2900
loop_2899:
	tg	%icc,	0x4
	fands	%f12,	%f16,	%f16
	fmuld8sux16	%f30,	%f27,	%f30
loop_2900:
	mova	%xcc,	%o6,	%i1
	bvc	%xcc,	loop_2901
	tpos	%icc,	0x1
	nop
	setx	0x1043A783,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fzero	%f26
loop_2901:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l5,	%l6
	fornot2s	%f19,	%f27,	%f2
	andncc	%g2,	%l4,	%o1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x70] %asi,	%g1
	subc	%i5,	0x116A,	%o5
	lduw	[%l7 + 0x24],	%l1
	addcc	%i0,	0x0471,	%o7
	ldx	[%l7 + 0x30],	%o4
	movrlez	%o0,	%o2,	%i3
	fmovdneg	%icc,	%f13,	%f11
	tleu	%icc,	0x2
	orncc	%i7,	%g5,	%l0
	stbar
	edge32l	%i6,	%g7,	%g6
	movn	%xcc,	%i2,	%o3
	bvc,a	loop_2902
	andcc	%l2,	%g4,	%g3
	subccc	%l3,	0x1AA9,	%i4
	fmovsgu	%icc,	%f9,	%f10
loop_2902:
	movvc	%icc,	%o6,	%i1
	edge16l	%l6,	%g2,	%l5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	tg	%xcc,	0x7
	fcmpgt16	%f28,	%f2,	%g1
	movvc	%icc,	%i5,	%o5
	movpos	%xcc,	%o1,	%i0
	srax	%l1,	%o4,	%o0
	nop
	set	0x48, %i0
	std	%f8,	[%l7 + %i0]
	ldd	[%l7 + 0x38],	%f24
	andcc	%o2,	0x1A98,	%o7
	fsrc1s	%f28,	%f20
	array8	%i3,	%i7,	%l0
	add	%i6,	0x0C55,	%g5
	fmovde	%xcc,	%f0,	%f10
	fcmpgt16	%f4,	%f24,	%g6
	tl	%icc,	0x4
	movne	%icc,	%i2,	%g7
	andcc	%o3,	0x0E51,	%l2
	edge32ln	%g3,	%l3,	%g4
	addc	%i4,	0x0B05,	%o6
	smulcc	%i1,	%l6,	%g2
	move	%icc,	%l4,	%g1
	andcc	%i5,	0x11DE,	%o5
	movle	%xcc,	%l5,	%o1
	xnor	%i0,	%o4,	%o0
	edge8l	%o2,	%o7,	%l1
	movne	%xcc,	%i7,	%l0
	ld	[%l7 + 0x58],	%f19
	nop
	setx	0x8F616757,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f3
	bge,pt	%icc,	loop_2903
	xnor	%i6,	%g5,	%i3
	tsubcc	%i2,	0x0B8B,	%g7
	movvs	%xcc,	%g6,	%l2
loop_2903:
	movle	%xcc,	%g3,	%o3
	or	%g4,	0x1168,	%i4
	orncc	%o6,	0x159D,	%i1
	popc	0x16AF,	%l6
	sra	%g2,	0x1E,	%l4
	lduh	[%l7 + 0x0A],	%g1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4F] %asi,	%i5
	movrlz	%l3,	%o5,	%o1
	brgz,a	%i0,	loop_2904
	add	%o4,	%o0,	%o2
	fbue,a	%fcc0,	loop_2905
	nop
	fitod	%f4,	%f20
	fdtoi	%f20,	%f22
loop_2904:
	smulcc	%o7,	%l1,	%i7
	fornot1	%f14,	%f28,	%f12
loop_2905:
	call	loop_2906
	addcc	%l0,	%l5,	%i6
	movvs	%xcc,	%i3,	%i2
	ldsh	[%l7 + 0x4A],	%g7
loop_2906:
	fcmpne16	%f20,	%f16,	%g6
	fcmpne16	%f18,	%f6,	%l2
	andn	%g5,	0x1700,	%o3
	fpadd16	%f12,	%f8,	%f30
	fmovsneg	%icc,	%f31,	%f10
	sdivx	%g4,	0x1370,	%g3
	addccc	%o6,	0x0212,	%i1
	fnands	%f21,	%f5,	%f6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l6,	%i4
	be,a	loop_2907
	movgu	%xcc,	%g2,	%l4
	ldstub	[%l7 + 0x55],	%i5
	tcc	%icc,	0x2
loop_2907:
	movrgez	%l3,	0x3B9,	%g1
	subcc	%o1,	0x0E48,	%o5
	xnorcc	%i0,	0x07FF,	%o4
	edge32	%o0,	%o7,	%o2
	tneg	%icc,	0x4
	alignaddrl	%l1,	%i7,	%l0
	edge16n	%i6,	%l5,	%i3
	smul	%g7,	%i2,	%g6
	fbl	%fcc3,	loop_2908
	movleu	%icc,	%l2,	%o3
	fmovdgu	%xcc,	%f12,	%f29
	nop
	setx	0xB5CE655F89FC6373,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xF95FA8C5159C5868,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f30
loop_2908:
	fxor	%f14,	%f20,	%f22
	bg,pt	%xcc,	loop_2909
	edge16l	%g5,	%g3,	%o6
	fnegs	%f12,	%f25
	tsubcc	%g4,	0x1C6A,	%l6
loop_2909:
	movvc	%icc,	%i4,	%g2
	fmovdleu	%icc,	%f20,	%f0
	tl	%xcc,	0x2
	tl	%xcc,	0x6
	te	%icc,	0x5
	tleu	%icc,	0x3
	fmovrslz	%i1,	%f27,	%f18
	bpos,pn	%icc,	loop_2910
	movcc	%icc,	%i5,	%l4
	tsubcc	%l3,	0x010F,	%o1
	nop
	setx	loop_2911,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2910:
	sir	0x1608
	nop
	fitos	%f12,	%f23
	fstoi	%f23,	%f0
	fxnor	%f22,	%f28,	%f24
loop_2911:
	fblg	%fcc1,	loop_2912
	std	%f26,	[%l7 + 0x78]
	wr	%g0,	0xe3,	%asi
	stwa	%g1,	[%l7 + 0x54] %asi
	membar	#Sync
loop_2912:
	ldub	[%l7 + 0x6F],	%i0
	movleu	%icc,	%o4,	%o0
	movvc	%icc,	%o5,	%o2
	xnorcc	%o7,	0x0506,	%i7
	bvs,a,pt	%xcc,	loop_2913
	alignaddr	%l1,	%l0,	%l5
	fbul	%fcc2,	loop_2914
	fmovdcs	%xcc,	%f2,	%f12
loop_2913:
	ldsw	[%l7 + 0x14],	%i3
	movn	%xcc,	%i6,	%i2
loop_2914:
	srl	%g7,	%l2,	%g6
	tgu	%xcc,	0x7
	edge8l	%g5,	%o3,	%g3
	set	0x10, %o2
	stxa	%o6,	[%l7 + %o2] 0xeb
	membar	#Sync
	movneg	%icc,	%g4,	%i4
	movn	%xcc,	%g2,	%i1
	movneg	%xcc,	%l6,	%l4
	edge32l	%i5,	%l3,	%o1
	umulcc	%i0,	0x0850,	%g1
	stx	%o0,	[%l7 + 0x60]
	smul	%o5,	0x0BF5,	%o4
	subcc	%o7,	0x087B,	%o2
	fbne	%fcc1,	loop_2915
	edge32n	%l1,	%l0,	%i7
	fxnor	%f12,	%f10,	%f8
	xnorcc	%i3,	0x0F93,	%l5
loop_2915:
	xorcc	%i2,	0x05C9,	%g7
	movne	%xcc,	%l2,	%g6
	fba,a	%fcc3,	loop_2916
	movrgez	%g5,	%o3,	%i6
	srlx	%o6,	0x07,	%g3
	taddcctv	%i4,	0x195E,	%g2
loop_2916:
	nop
	setx	0x434CFFDC60683465,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fbg,a	%fcc2,	loop_2917
	fnor	%f2,	%f2,	%f22
	te	%xcc,	0x4
	fone	%f6
loop_2917:
	sra	%i1,	0x11,	%g4
	swap	[%l7 + 0x5C],	%l6
	udivx	%i5,	0x13AB,	%l3
	fmovsvc	%icc,	%f2,	%f17
	movge	%xcc,	%o1,	%i0
	edge16l	%l4,	%o0,	%g1
	fbn	%fcc1,	loop_2918
	fbne	%fcc3,	loop_2919
	fmovsa	%icc,	%f6,	%f3
	smulcc	%o5,	%o7,	%o2
loop_2918:
	edge8ln	%o4,	%l0,	%l1
loop_2919:
	nop
	setx	0x6F8F52CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xA8183AB6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f27,	%f24
	nop
	setx	0x060E1B92,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x63F5902B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f18,	%f29
	fmul8x16au	%f25,	%f12,	%f4
	fbne	%fcc3,	loop_2920
	taddcctv	%i3,	%i7,	%l5
	fbo	%fcc3,	loop_2921
	edge8l	%g7,	%i2,	%g6
loop_2920:
	movge	%icc,	%l2,	%o3
	nop
	setx	0xEBAB1F24,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f19
loop_2921:
	bcc	%icc,	loop_2922
	edge8	%i6,	%o6,	%g5
	edge8	%g3,	%i4,	%i1
	movcc	%xcc,	%g4,	%g2
loop_2922:
	fbule,a	%fcc1,	loop_2923
	tleu	%icc,	0x5
	or	%l6,	0x1149,	%l3
	ta	%xcc,	0x5
loop_2923:
	bl,pt	%xcc,	loop_2924
	nop
	setx	0x7CE35B47,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x26092427,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f27,	%f7
	addc	%o1,	0x1EAF,	%i5
	fcmpeq32	%f6,	%f22,	%i0
loop_2924:
	taddcc	%o0,	0x0D93,	%l4
	movrne	%g1,	%o5,	%o2
	srax	%o4,	%o7,	%l1
	bn,a	loop_2925
	brz,a	%l0,	loop_2926
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x019B,	%i7
loop_2925:
	fmovsl	%xcc,	%f27,	%f12
loop_2926:
	membar	0x70
	stbar
	fpadd32	%f30,	%f4,	%f26
	bg,a	loop_2927
	tge	%xcc,	0x6
	subc	%i3,	%g7,	%i2
	fbule	%fcc3,	loop_2928
loop_2927:
	fmuld8sux16	%f9,	%f0,	%f12
	tneg	%icc,	0x1
	tgu	%icc,	0x3
loop_2928:
	smul	%g6,	0x0309,	%l2
	tpos	%icc,	0x2
	tcs	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x7
	tneg	%icc,	0x1
	wr	%g0,	0x27,	%asi
	stxa	%o3,	[%l7 + 0x20] %asi
	membar	#Sync
	xnor	%l5,	%o6,	%i6
	movneg	%xcc,	%g3,	%i4
	subccc	%g5,	0x1D0E,	%g4
	nop
	setx	0x33FF119F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x510F6C28,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f24,	%f7
	edge16ln	%g2,	%i1,	%l6
	brlez,a	%l3,	loop_2929
	nop
	setx	0xCD0EC1CB04FF9F41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA83992E2146A3952,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f14,	%f26
	stx	%i5,	[%l7 + 0x38]
	taddcctv	%i0,	0x08F8,	%o1
loop_2929:
	tsubcc	%l4,	0x1243,	%g1
	fmuld8sux16	%f4,	%f29,	%f10
	edge8ln	%o0,	%o5,	%o4
	fnand	%f12,	%f8,	%f10
	fbn,a	%fcc3,	loop_2930
	taddcc	%o2,	%o7,	%l1
	tcc	%xcc,	0x0
	array32	%l0,	%i3,	%i7
loop_2930:
	fpsub32	%f22,	%f18,	%f10
	tgu	%xcc,	0x1
	edge16ln	%i2,	%g6,	%g7
	bvs,a	%xcc,	loop_2931
	movvs	%icc,	%l2,	%l5
	movgu	%xcc,	%o3,	%i6
	sth	%g3,	[%l7 + 0x1A]
loop_2931:
	udiv	%i4,	0x0D0B,	%g5
	or	%g4,	%o6,	%i1
	add	%l6,	%l3,	%g2
	nop
	fitos	%f12,	%f31
	fstod	%f31,	%f24
	sll	%i0,	0x00,	%o1
	tn	%xcc,	0x3
	edge16l	%i5,	%g1,	%l4
	array8	%o5,	%o0,	%o4
	fxor	%f28,	%f0,	%f0
	mulscc	%o2,	%o7,	%l1
	fbul,a	%fcc1,	loop_2932
	nop
	setx	0x02C361B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x665D6CDF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f23,	%f9
	tcs	%icc,	0x7
	fornot1s	%f2,	%f3,	%f16
loop_2932:
	addc	%l0,	0x1283,	%i3
	umulcc	%i7,	0x051B,	%g6
	bcs	loop_2933
	edge8l	%g7,	%i2,	%l5
	subc	%o3,	0x0A1C,	%l2
	tg	%xcc,	0x0
loop_2933:
	movcc	%xcc,	%i6,	%i4
	brz,a	%g5,	loop_2934
	edge8ln	%g4,	%o6,	%i1
	fmovrsgez	%l6,	%f21,	%f11
	fmovrdne	%g3,	%f12,	%f0
loop_2934:
	lduw	[%l7 + 0x1C],	%l3
	tgu	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x74] %asi
	membar	0x5D
	movleu	%icc,	%o1,	%g2
	sethi	0x061E,	%g1
	nop
	set	0x5C, %l3
	lduw	[%l7 + %l3],	%i5
	fba,a	%fcc0,	loop_2935
	edge16ln	%o5,	%o0,	%l4
	umulcc	%o4,	0x1F6A,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2935:
	fbl,a	%fcc3,	loop_2936
	edge16	%o2,	%l1,	%i3
	udiv	%l0,	0x09FB,	%i7
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x50] %asi,	%g6
loop_2936:
	nop
	set	0x10, %i4
	lda	[%l7 + %i4] 0x81,	%f27
	edge32	%g7,	%l5,	%o3
	tleu	%xcc,	0x3
	tpos	%icc,	0x0
	srlx	%i2,	0x0F,	%l2
	edge16n	%i6,	%g5,	%i4
	te	%xcc,	0x2
	fcmpgt16	%f14,	%f22,	%g4
	sir	0x00D6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2937
	edge16n	%o6,	%l6,	%i1
	edge8l	%l3,	%i0,	%g3
	bshuffle	%f2,	%f12,	%f14
loop_2937:
	membar	0x5B
	fbn,a	%fcc2,	loop_2938
	andcc	%o1,	0x0AD9,	%g1
	tge	%xcc,	0x4
	nop
	setx loop_2939, %l0, %l1
	jmpl %l1, %g2
loop_2938:
	fble	%fcc3,	loop_2940
	fabsd	%f12,	%f12
	fmovrdne	%o5,	%f0,	%f4
loop_2939:
	fnands	%f10,	%f6,	%f22
loop_2940:
	fnands	%f6,	%f20,	%f0
	array8	%i5,	%l4,	%o4
	fmovsl	%icc,	%f19,	%f1
	tcs	%icc,	0x3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o7,	%o2
	subccc	%o0,	0x1A46,	%i3
	tsubcc	%l0,	%i7,	%g6
	tvc	%icc,	0x4
	fbue,a	%fcc2,	loop_2941
	tgu	%icc,	0x2
	sub	%l1,	%g7,	%o3
	addc	%i2,	%l2,	%l5
loop_2941:
	udivx	%i6,	0x0EA5,	%g5
	tcc	%xcc,	0x1
	sra	%g4,	0x04,	%o6
	tcs	%icc,	0x2
	ldub	[%l7 + 0x31],	%i4
	addccc	%i1,	%l6,	%i0
	nop
	set	0x10, %i1
	ldsb	[%l7 + %i1],	%g3
	tvs	%xcc,	0x6
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f12
	umulcc	%o1,	0x17FE,	%g1
	fnands	%f30,	%f31,	%f16
	movle	%icc,	%l3,	%g2
	fcmple32	%f20,	%f24,	%o5
	fmovsa	%xcc,	%f16,	%f19
	sdiv	%i5,	0x108D,	%o4
	taddcctv	%o7,	0x1562,	%l4
	alignaddrl	%o2,	%o0,	%l0
	ldstub	[%l7 + 0x6F],	%i7
	movgu	%xcc,	%i3,	%l1
	addcc	%g6,	%g7,	%i2
	fmovrse	%o3,	%f18,	%f13
	movneg	%xcc,	%l2,	%i6
	xnor	%g5,	%g4,	%o6
	move	%xcc,	%i4,	%l5
	edge16	%i1,	%l6,	%g3
	brlz,a	%i0,	loop_2942
	movgu	%icc,	%o1,	%l3
	add	%g1,	0x1082,	%o5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%o4
loop_2942:
	movcc	%icc,	%o7,	%l4
	tneg	%icc,	0x5
	tvs	%icc,	0x7
	fnands	%f21,	%f18,	%f8
	brlez	%g2,	loop_2943
	fmovdpos	%xcc,	%f0,	%f22
	edge32ln	%o2,	%o0,	%l0
	fpmerge	%f13,	%f13,	%f30
loop_2943:
	move	%icc,	%i7,	%i3
	fmovdge	%icc,	%f27,	%f8
	fmovsg	%xcc,	%f2,	%f7
	taddcctv	%l1,	%g7,	%g6
	bshuffle	%f20,	%f20,	%f0
	srax	%i2,	0x03,	%l2
	brz	%i6,	loop_2944
	fornot2	%f14,	%f22,	%f22
	edge8ln	%g5,	%g4,	%o3
	ble,pn	%icc,	loop_2945
loop_2944:
	sir	0x1E06
	sethi	0x138A,	%o6
	nop
	setx	0x66C7AACC429D8F8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x713DD2B966F5803B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f14,	%f8
loop_2945:
	move	%icc,	%i4,	%l5
	fmuld8ulx16	%f27,	%f18,	%f2
	fnot2	%f18,	%f26
	fmovrdlz	%l6,	%f8,	%f22
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f7
	tle	%icc,	0x5
	fpadd32	%f18,	%f30,	%f6
	fmovdpos	%icc,	%f30,	%f20
	bne,pn	%icc,	loop_2946
	srax	%i1,	%i0,	%g3
	fmovrdne	%l3,	%f8,	%f24
	alignaddr	%o1,	%g1,	%o5
loop_2946:
	addccc	%o4,	%i5,	%l4
	bneg,a,pt	%xcc,	loop_2947
	umul	%g2,	%o7,	%o2
	brlz	%o0,	loop_2948
	mulscc	%i7,	0x0759,	%l0
loop_2947:
	fmovse	%icc,	%f4,	%f27
	movrne	%i3,	%g7,	%l1
loop_2948:
	fnor	%f0,	%f4,	%f4
	tle	%xcc,	0x6
	ldub	[%l7 + 0x22],	%i2
	fcmpgt16	%f18,	%f0,	%l2
	movgu	%icc,	%i6,	%g5
	tsubcctv	%g4,	%g6,	%o6
	membar	0x55
	alignaddrl	%i4,	%l5,	%o3
	movn	%xcc,	%i1,	%l6
	tleu	%xcc,	0x7
	fbuge,a	%fcc1,	loop_2949
	movvs	%xcc,	%g3,	%i0
	mulscc	%l3,	%o1,	%g1
	ldsb	[%l7 + 0x59],	%o5
loop_2949:
	fbug	%fcc2,	loop_2950
	umulcc	%i5,	%l4,	%o4
	fbe	%fcc1,	loop_2951
	mulscc	%o7,	%g2,	%o2
loop_2950:
	fbg	%fcc3,	loop_2952
	mova	%xcc,	%i7,	%o0
loop_2951:
	subcc	%i3,	0x0D05,	%l0
	umul	%l1,	%g7,	%l2
loop_2952:
	fpadd32	%f28,	%f2,	%f26
	ldstub	[%l7 + 0x33],	%i6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%g5
	tneg	%xcc,	0x5
	movneg	%icc,	%g4,	%g6
	orcc	%i2,	0x1783,	%i4
	tsubcc	%o6,	%o3,	%i1
	sth	%l6,	[%l7 + 0x58]
	faligndata	%f30,	%f16,	%f8
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
	movn	%icc,	%i0,	%g3
	edge8	%o1,	%g1,	%l3
	mulscc	%i5,	%l4,	%o4
	array32	%o5,	%o7,	%o2
	ba,a	loop_2953
	movrlez	%i7,	%g2,	%i3
	bn	%icc,	loop_2954
	xnor	%o0,	0x108A,	%l1
loop_2953:
	call	loop_2955
	fblg,a	%fcc2,	loop_2956
loop_2954:
	array16	%l0,	%l2,	%g7
	smul	%i6,	%g4,	%g5
loop_2955:
	sth	%i2,	[%l7 + 0x70]
loop_2956:
	tg	%xcc,	0x5
	movl	%icc,	%g6,	%o6
	fbo,a	%fcc3,	loop_2957
	fsrc1	%f6,	%f30
	sdiv	%i4,	0x0F61,	%i1
	array16	%o3,	%l6,	%l5
loop_2957:
	edge8n	%i0,	%o1,	%g3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x10] %asi,	%g1
	sra	%i5,	0x0C,	%l4
	fba	%fcc3,	loop_2958
	umul	%l3,	0x133A,	%o4
	addccc	%o7,	0x171A,	%o2
	nop
	setx	loop_2959,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2958:
	subccc	%i7,	0x1973,	%g2
	tcc	%xcc,	0x1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x64] %asi,	%f24
loop_2959:
	tvs	%xcc,	0x3
	fnegs	%f0,	%f25
	movneg	%icc,	%i3,	%o5
	ldub	[%l7 + 0x34],	%o0
	array32	%l1,	%l2,	%l0
	udivcc	%g7,	0x170B,	%g4
	bvc	%icc,	loop_2960
	srlx	%i6,	0x18,	%g5
	tge	%xcc,	0x2
	fbo	%fcc3,	loop_2961
loop_2960:
	nop
	setx	0x48E72BB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x5B78041E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f30,	%f25
	movpos	%icc,	%g6,	%o6
	movrlz	%i4,	0x2DF,	%i2
loop_2961:
	brz	%i1,	loop_2962
	fnegs	%f0,	%f25
	nop
	setx	loop_2963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgz	%l6,	%f0,	%f12
loop_2962:
	fmovrdlez	%l5,	%f2,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2963:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o3,	%i0
	smul	%o1,	0x1E92,	%g1
	movgu	%icc,	%i5,	%g3
	fands	%f16,	%f20,	%f30
	andn	%l3,	0x13AA,	%o4
	ldsw	[%l7 + 0x50],	%o7
	ldstub	[%l7 + 0x29],	%o2
	bneg	%icc,	loop_2964
	taddcctv	%i7,	0x0544,	%g2
	nop
	setx	loop_2965,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srlx	%l4,	%o5,	%i3
loop_2964:
	or	%l1,	%l2,	%l0
	array16	%g7,	%g4,	%o0
loop_2965:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0963,	%i6
	fbule,a	%fcc1,	loop_2966
	edge8l	%g5,	%g6,	%i4
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2966:
	fmovsvs	%xcc,	%f18,	%f8
	movle	%xcc,	%o6,	%i1
	fpsub32	%f22,	%f10,	%f30
	tgu	%xcc,	0x2
	fmovrdne	%l6,	%f4,	%f30
	smulcc	%i2,	0x05D8,	%l5
	edge32n	%i0,	%o3,	%o1
	srl	%i5,	%g1,	%g3
	set	0x4F, %g7
	ldsba	[%l7 + %g7] 0x15,	%o4
	membar	0x66
	udiv	%o7,	0x0FFC,	%l3
	move	%xcc,	%i7,	%o2
	add	%g2,	0x1064,	%l4
	pdist	%f28,	%f12,	%f0
	ldsw	[%l7 + 0x58],	%o5
	edge8	%l1,	%i3,	%l2
	fornot1	%f30,	%f26,	%f8
	orn	%g7,	%l0,	%g4
	edge8n	%o0,	%g5,	%g6
	add	%i6,	0x0380,	%o6
	fpmerge	%f10,	%f12,	%f30
	nop
	setx	0x56813CB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f3
	srax	%i4,	%i1,	%l6
	ldstub	[%l7 + 0x5C],	%l5
	xnor	%i0,	0x0BFE,	%o3
	sth	%i2,	[%l7 + 0x72]
	set	0x3C, %l2
	swapa	[%l7 + %l2] 0x80,	%o1
	ldx	[%l7 + 0x18],	%i5
	brgez,a	%g3,	loop_2967
	brnz	%g1,	loop_2968
	tcc	%xcc,	0x2
	tne	%xcc,	0x1
loop_2967:
	bn,a,pt	%icc,	loop_2969
loop_2968:
	te	%xcc,	0x0
	movleu	%icc,	%o4,	%l3
	fmovsvs	%icc,	%f19,	%f26
loop_2969:
	sdivx	%i7,	0x0D0E,	%o7
	movrlz	%g2,	0x2F9,	%o2
	movge	%xcc,	%o5,	%l1
	edge8l	%i3,	%l2,	%g7
	bg,a	loop_2970
	sdiv	%l4,	0x166E,	%l0
	smulcc	%o0,	%g5,	%g4
	movrne	%i6,	0x182,	%o6
loop_2970:
	fornot2	%f18,	%f16,	%f24
	fnegd	%f20,	%f6
	wr	%g0,	0xea,	%asi
	stba	%g6,	[%l7 + 0x70] %asi
	membar	#Sync
	set	0x08, %l5
	ldsha	[%l7 + %l5] 0x04,	%i1
	sir	0x1082
	move	%icc,	%i4,	%l6
	edge32l	%i0,	%l5,	%i2
	sll	%o1,	%o3,	%i5
	fmovscs	%icc,	%f8,	%f0
	orcc	%g1,	0x117D,	%o4
	popc	%g3,	%l3
	fmovscs	%icc,	%f23,	%f2
	fmovsleu	%icc,	%f12,	%f1
	movpos	%icc,	%o7,	%g2
	fpadd16s	%f3,	%f12,	%f19
	andncc	%o2,	%o5,	%l1
	umulcc	%i3,	0x097F,	%i7
	orn	%l2,	0x0AC5,	%l4
	xnor	%g7,	0x1353,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g5,	%g4,	%l0
	nop
	fitod	%f12,	%f8
	fdtos	%f8,	%f5
	mova	%xcc,	%o6,	%i6
	movrgez	%g6,	%i1,	%l6
	udivx	%i0,	0x13ED,	%l5
	movge	%xcc,	%i4,	%o1
	edge16ln	%o3,	%i2,	%i5
	fbule,a	%fcc2,	loop_2971
	membar	0x49
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%g3
loop_2971:
	ldstub	[%l7 + 0x26],	%o4
	fpmerge	%f20,	%f12,	%f14
	udivx	%o7,	0x1DE3,	%l3
	and	%g2,	0x02EA,	%o5
	movle	%icc,	%l1,	%o2
	edge32n	%i3,	%i7,	%l4
	set	0x1E, %o6
	lduha	[%l7 + %o6] 0x11,	%l2
	fand	%f6,	%f20,	%f14
	edge32l	%o0,	%g7,	%g5
	edge16ln	%l0,	%g4,	%i6
	tsubcctv	%g6,	0x05A6,	%o6
	movrlz	%l6,	0x39A,	%i1
	bcs	loop_2972
	andncc	%i0,	%i4,	%l5
	sdivx	%o1,	0x19DD,	%o3
	alignaddr	%i2,	%i5,	%g1
loop_2972:
	fbue	%fcc0,	loop_2973
	xor	%g3,	%o4,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g2,	0x1A93,	%o5
loop_2973:
	udivcc	%l3,	0x0CCB,	%o2
	andncc	%l1,	%i7,	%i3
	smulcc	%l4,	%o0,	%g7
	tge	%xcc,	0x6
	fmovrdlz	%l2,	%f16,	%f2
	ldstub	[%l7 + 0x40],	%g5
	brgez	%g4,	loop_2974
	bpos,a,pt	%icc,	loop_2975
	fsrc2	%f16,	%f26
	array16	%i6,	%l0,	%g6
loop_2974:
	udiv	%o6,	0x088C,	%l6
loop_2975:
	ba,pt	%xcc,	loop_2976
	prefetch	[%l7 + 0x40],	 0x1
	movcc	%xcc,	%i1,	%i4
	move	%icc,	%i0,	%l5
loop_2976:
	brgz,a	%o1,	loop_2977
	subc	%o3,	0x043B,	%i5
	tleu	%icc,	0x6
	movpos	%icc,	%g1,	%i2
loop_2977:
	tcs	%xcc,	0x6
	smulcc	%o4,	%g3,	%g2
	addc	%o5,	0x03EE,	%o7
	fmovs	%f2,	%f16
	fmovrdne	%l3,	%f2,	%f30
	bleu,a,pn	%icc,	loop_2978
	nop
	set	0x72, %i7
	ldsh	[%l7 + %i7],	%o2
	membar	0x36
	sdiv	%l1,	0x133C,	%i7
loop_2978:
	fbule	%fcc3,	loop_2979
	movne	%icc,	%i3,	%o0
	wr	%g0,	0x4f,	%asi
	stxa	%l4,	[%g0 + 0x0] %asi
loop_2979:
	sub	%l2,	0x1AFA,	%g7
	movrlez	%g5,	0x253,	%i6
	tl	%xcc,	0x2
	edge16l	%l0,	%g6,	%g4
	sth	%o6,	[%l7 + 0x34]
	movrgz	%l6,	0x2AF,	%i1
	fcmpgt32	%f6,	%f2,	%i4
	swap	[%l7 + 0x68],	%l5
	add	%i0,	%o1,	%i5
	movrne	%g1,	0x321,	%o3
	fpsub32s	%f13,	%f4,	%f4
	fsrc1	%f14,	%f14
	fmovdneg	%xcc,	%f17,	%f7
	movleu	%xcc,	%o4,	%g3
	movg	%xcc,	%i2,	%g2
	set	0x09, %i2
	stba	%o5,	[%l7 + %i2] 0x18
	set	0x22, %g2
	lduha	[%l7 + %g2] 0x88,	%l3
	set	0x1C, %i6
	lda	[%l7 + %i6] 0x19,	%f22
	tsubcctv	%o2,	0x11A7,	%o7
	fmovrslz	%l1,	%f25,	%f6
	fbne	%fcc3,	loop_2980
	subc	%i3,	%o0,	%l4
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x19,	%l2
loop_2980:
	subc	%i7,	%g5,	%g7
	tsubcctv	%i6,	%l0,	%g4
	edge8n	%g6,	%l6,	%o6
	addccc	%i1,	%l5,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f15
	ldstub	[%l7 + 0x5F],	%o1
	movrne	%i5,	%i0,	%o3
	movrgez	%o4,	0x2A2,	%g3
	edge8l	%i2,	%g2,	%g1
	alignaddrl	%l3,	%o5,	%o7
	sir	0x100F
	fmovdleu	%xcc,	%f30,	%f14
	nop
	setx	0xC1F38B121491AD8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xBFE0FF9466A694B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f14,	%f22
	fmovrde	%o2,	%f26,	%f0
	tsubcc	%l1,	%i3,	%l4
	movn	%icc,	%l2,	%o0
	nop
	setx	0xB07947A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	te	%icc,	0x0
	fmovrslez	%g5,	%f23,	%f21
	movvc	%icc,	%g7,	%i6
	edge32ln	%l0,	%g4,	%g6
	be,a	loop_2981
	fpadd16	%f6,	%f26,	%f26
	fcmpgt16	%f6,	%f22,	%l6
	andncc	%o6,	%i1,	%i7
loop_2981:
	srax	%l5,	%o1,	%i4
	sra	%i5,	0x1B,	%o3
	nop
	setx	0x995D5639,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xFB93D321,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f13,	%f17
	flush	%l7 + 0x68
	fzeros	%f14
	mova	%xcc,	%i0,	%o4
	fmovrslz	%g3,	%f20,	%f9
	std	%f22,	[%l7 + 0x18]
	andcc	%g2,	%g1,	%i2
	subcc	%l3,	0x05C4,	%o7
	bneg,a	%icc,	loop_2982
	movrgez	%o5,	0x3BE,	%l1
	fmuld8sux16	%f3,	%f15,	%f28
	wr	%g0,	0x11,	%asi
	stba	%i3,	[%l7 + 0x76] %asi
loop_2982:
	movle	%icc,	%l4,	%o2
	swap	[%l7 + 0x78],	%o0
	nop
	fitos	%f0,	%f8
	fstoi	%f8,	%f28
	orcc	%g5,	0x0C4E,	%g7
	bvs	loop_2983
	fbo,a	%fcc3,	loop_2984
	fandnot1s	%f6,	%f15,	%f17
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_2983:
	edge16n	%i6,	%l0,	%g4
loop_2984:
	orn	%g6,	%o6,	%l6
	nop
	setx	0xE5F0F5E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x2ECC0E05,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f23,	%f4
	stbar
	fmovrdne	%i1,	%f8,	%f28
	tgu	%xcc,	0x3
	te	%icc,	0x7
	sllx	%l5,	%o1,	%i4
	xor	%i5,	%o3,	%i0
	fmovdn	%icc,	%f12,	%f14
	sra	%o4,	0x11,	%i7
	set	0x38, %o4
	stha	%g3,	[%l7 + %o4] 0xeb
	membar	#Sync
	tsubcctv	%g1,	%g2,	%l3
	fmul8sux16	%f24,	%f8,	%f4
	subccc	%o7,	0x0986,	%o5
	srlx	%l1,	0x1D,	%i2
	addccc	%l4,	%i3,	%o0
	set	0x76, %o0
	lduha	[%l7 + %o0] 0x0c,	%o2
	tne	%icc,	0x5
	add	%g5,	%g7,	%i6
	tgu	%icc,	0x3
	fbo,a	%fcc0,	loop_2985
	fcmpeq32	%f8,	%f26,	%l2
	fmovrdgez	%l0,	%f26,	%f8
	ba	loop_2986
loop_2985:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x0D, %i3
	ldsba	[%l7 + %i3] 0x88,	%g4
loop_2986:
	fmovrse	%o6,	%f26,	%f12
	nop
	setx	0x8B50DEEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x05EA8F52,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f22,	%f1
	movcs	%icc,	%l6,	%i1
	fcmpgt16	%f18,	%f24,	%l5
	movre	%g6,	%i4,	%i5
	andcc	%o1,	0x1EA9,	%o3
	add	%o4,	0x00AE,	%i0
	andncc	%i7,	%g3,	%g2
	movg	%icc,	%l3,	%g1
	alignaddrl	%o7,	%l1,	%i2
	nop
	fitod	%f9,	%f0
	taddcctv	%o5,	%l4,	%o0
	fble	%fcc0,	loop_2987
	fnands	%f23,	%f14,	%f11
	edge8n	%o2,	%i3,	%g5
	sllx	%g7,	0x12,	%l2
loop_2987:
	movleu	%xcc,	%i6,	%g4
	fpsub16	%f2,	%f14,	%f22
	edge16	%l0,	%l6,	%o6
	st	%f31,	[%l7 + 0x64]
	fcmpgt32	%f2,	%f18,	%i1
	sll	%g6,	%i4,	%i5
	bge	%icc,	loop_2988
	ld	[%l7 + 0x50],	%f5
	movneg	%xcc,	%o1,	%l5
	udiv	%o4,	0x05C1,	%o3
loop_2988:
	te	%icc,	0x7
	fabsd	%f26,	%f8
	edge8l	%i0,	%g3,	%i7
	fmovde	%icc,	%f1,	%f28
	bleu,pt	%icc,	loop_2989
	fandnot2	%f4,	%f18,	%f28
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f28
	edge32n	%l3,	%g1,	%g2
loop_2989:
	movg	%xcc,	%l1,	%i2
	srlx	%o7,	%o5,	%o0
	addccc	%o2,	0x1C47,	%i3
	tge	%icc,	0x1
	edge32ln	%g5,	%l4,	%g7
	ldstub	[%l7 + 0x0E],	%l2
	sethi	0x0D29,	%g4
	tvs	%icc,	0x7
	ta	%xcc,	0x3
	movge	%xcc,	%i6,	%l6
	bvc,pn	%xcc,	loop_2990
	movcc	%icc,	%l0,	%i1
	tvs	%icc,	0x0
	tleu	%xcc,	0x6
loop_2990:
	fcmpne32	%f30,	%f10,	%o6
	subcc	%g6,	%i4,	%o1
	fexpand	%f22,	%f8
	sdivx	%l5,	0x1177,	%i5
	addccc	%o3,	0x1096,	%i0
	nop
	setx	0xD8AFB403C4B7A292,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF16F406CA864B95A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f0,	%f10
	smulcc	%g3,	%i7,	%l3
	tvc	%xcc,	0x0
	addc	%g1,	0x19AE,	%o4
	tg	%icc,	0x4
	bcs,a	%icc,	loop_2991
	subcc	%l1,	0x0C3F,	%i2
	alignaddr	%g2,	%o7,	%o0
	smul	%o5,	0x0425,	%i3
loop_2991:
	stx	%g5,	[%l7 + 0x70]
	mova	%xcc,	%o2,	%g7
	udivcc	%l4,	0x10F5,	%l2
	fpadd16	%f24,	%f28,	%f30
	set	0x48, %g6
	lda	[%l7 + %g6] 0x0c,	%f0
	fmovdgu	%icc,	%f12,	%f9
	fmovdleu	%icc,	%f24,	%f5
	xorcc	%i6,	0x1AB6,	%l6
	fmovrdgez	%l0,	%f26,	%f16
	subccc	%g4,	0x16EC,	%o6
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f12
	fxtod	%f12,	%f16
	fmovsn	%icc,	%f14,	%f3
	movrgz	%g6,	0x2DA,	%i4
	tsubcc	%o1,	0x1ADF,	%i1
	and	%i5,	%l5,	%i0
	smulcc	%o3,	0x0FCA,	%g3
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
	tg	%xcc,	0x4
	edge32	%i7,	%g1,	%o4
	movvc	%xcc,	%l1,	%l3
	orncc	%i2,	%g2,	%o0
	bn,a	loop_2992
	fcmpgt16	%f28,	%f14,	%o7
	edge16ln	%i3,	%g5,	%o2
	tvc	%xcc,	0x4
loop_2992:
	edge32l	%o5,	%g7,	%l4
	bleu	%icc,	loop_2993
	sra	%i6,	0x1D,	%l6
	movcs	%icc,	%l2,	%l0
	sra	%g4,	0x01,	%o6
loop_2993:
	tleu	%icc,	0x6
	be,pt	%icc,	loop_2994
	nop
	setx	0xD5931B5809A27C08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x17985FB12072DD15,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f0,	%f8
	brlz	%g6,	loop_2995
	fmovdge	%icc,	%f9,	%f9
loop_2994:
	movrlz	%o1,	%i1,	%i5
	andncc	%l5,	%i4,	%o3
loop_2995:
	nop
	setx	0x3A4574BEF53E1D01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x3355D0B7906E4088,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f0,	%f26
	srax	%g3,	%i0,	%i7
	tge	%xcc,	0x0
	array16	%g1,	%o4,	%l3
	tpos	%icc,	0x1
	sub	%i2,	0x01AB,	%l1
	fcmpne16	%f24,	%f2,	%o0
	fmovdle	%icc,	%f15,	%f7
	fmovdpos	%icc,	%f31,	%f4
	movvs	%xcc,	%o7,	%i3
	fmul8sux16	%f16,	%f18,	%f14
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	nop
	setx	0x93C1649400637A2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	smul	%g2,	0x1127,	%o2
	edge8ln	%g7,	%l4,	%i6
	edge8ln	%o5,	%l6,	%l2
	fmuld8sux16	%f4,	%f17,	%f10
	xnor	%g4,	%o6,	%l0
	fmovdvs	%icc,	%f10,	%f24
	tcc	%icc,	0x3
	movre	%o1,	0x333,	%i1
	ldd	[%l7 + 0x18],	%g6
	ldx	[%l7 + 0x20],	%l5
	nop
	set	0x5E, %o1
	sth	%i4,	[%l7 + %o1]
	stw	%i5,	[%l7 + 0x6C]
	st	%f16,	[%l7 + 0x68]
	nop
	fitos	%f16,	%f13
	addccc	%o3,	0x0CB5,	%g3
	bneg,a	loop_2996
	smul	%i0,	%i7,	%g1
	orncc	%o4,	%l3,	%i2
	tvc	%xcc,	0x7
loop_2996:
	sllx	%l1,	0x10,	%o0
	movge	%xcc,	%i3,	%o7
	movleu	%xcc,	%g5,	%o2
	fbule	%fcc3,	loop_2997
	xor	%g2,	0x0B24,	%g7
	movgu	%icc,	%i6,	%o5
	edge8	%l6,	%l2,	%g4
loop_2997:
	movcs	%icc,	%o6,	%l4
	movneg	%xcc,	%l0,	%i1
	subcc	%g6,	%o1,	%l5
	fbe	%fcc2,	loop_2998
	movg	%icc,	%i4,	%o3
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x74] %asi,	%i5
loop_2998:
	tvc	%xcc,	0x1
	taddcctv	%i0,	%g3,	%g1
	tle	%icc,	0x1
	fba,a	%fcc2,	loop_2999
	fnegd	%f8,	%f10
	movge	%xcc,	%o4,	%i7
	tge	%icc,	0x3
loop_2999:
	fmovrslez	%l3,	%f4,	%f16
	nop
	setx	0x86BE168D000CF50A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1460FE8AC89F4DA2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f20,	%f26
	addccc	%l1,	%i2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o7,	%g5,	%o0
	nop
	setx	0xF9F93DA6E0786C96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movge	%xcc,	%g2,	%o2
	edge16n	%i6,	%g7,	%l6
	nop
	set	0x60, %o7
	std	%f24,	[%l7 + %o7]
	fmovrslz	%o5,	%f19,	%f25
	array32	%g4,	%o6,	%l4
	bleu	loop_3000
	fpsub16s	%f3,	%f23,	%f3
	umulcc	%l2,	0x091D,	%l0
	movleu	%icc,	%g6,	%i1
loop_3000:
	tne	%icc,	0x2
	tcc	%xcc,	0x2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o1,	%l5
	edge16ln	%i4,	%i5,	%o3
	tgu	%icc,	0x0
	set	0x28, %g5
	ldswa	[%l7 + %g5] 0x04,	%i0
	sra	%g3,	%g1,	%i7
	fbne,a	%fcc0,	loop_3001
	nop
	setx	0xB6080C81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x986CAA20,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f20,	%f4
	udivcc	%l3,	0x1689,	%o4
	std	%f8,	[%l7 + 0x30]
loop_3001:
	nop
	set	0x58, %l6
	stba	%l1,	[%l7 + %l6] 0x88
	smulcc	%i2,	0x122C,	%o7
	bcc	loop_3002
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g5,	0x12EE,	%i3
	movg	%icc,	%o0,	%g2
loop_3002:
	addcc	%i6,	%o2,	%l6
	movvs	%xcc,	%g7,	%g4
	brlez,a	%o5,	loop_3003
	edge8ln	%o6,	%l4,	%l0
	tcc	%xcc,	0x2
	lduh	[%l7 + 0x12],	%g6
loop_3003:
	add	%l2,	0x15F2,	%o1
	tcc	%xcc,	0x3
	ble,a,pt	%xcc,	loop_3004
	movrne	%l5,	%i4,	%i1
	sra	%i5,	%i0,	%o3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g1
loop_3004:
	fmovrdgez	%g3,	%f28,	%f6
	fnot2s	%f13,	%f26
	fbuge	%fcc2,	loop_3005
	alignaddr	%i7,	%o4,	%l1
	smulcc	%i2,	%o7,	%g5
	orn	%i3,	0x1478,	%o0
loop_3005:
	edge16ln	%g2,	%i6,	%o2
	edge32	%l3,	%g7,	%g4
	fbe	%fcc3,	loop_3006
	tvs	%xcc,	0x3
	edge16n	%l6,	%o5,	%o6
	edge16l	%l4,	%g6,	%l2
loop_3006:
	fpadd16s	%f13,	%f22,	%f31
	alignaddr	%o1,	%l0,	%i4
	fcmple16	%f2,	%f18,	%i1
	fnor	%f8,	%f24,	%f20
	for	%f4,	%f28,	%f6
	nop
	set	0x4B, %l1
	ldsb	[%l7 + %l1],	%l5
	addccc	%i5,	0x0F98,	%o3
	umulcc	%i0,	%g1,	%g3
	fexpand	%f8,	%f16
	taddcctv	%o4,	0x014D,	%i7
	fpsub32s	%f9,	%f29,	%f28
	movrgz	%l1,	0x2C1,	%o7
	wr	%g0,	0x2f,	%asi
	stxa	%g5,	[%l7 + 0x50] %asi
	membar	#Sync
	xor	%i3,	0x0CC3,	%i2
	ldub	[%l7 + 0x4E],	%o0
	bne,pn	%icc,	loop_3007
	movrlz	%g2,	%i6,	%l3
	fpadd16s	%f16,	%f16,	%f23
	movvc	%icc,	%o2,	%g4
loop_3007:
	sir	0x004D
	fxor	%f8,	%f28,	%f30
	ldub	[%l7 + 0x1B],	%g7
	brgz,a	%o5,	loop_3008
	sethi	0x0EAB,	%l6
	set	0x42, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o6
loop_3008:
	add	%l4,	%l2,	%g6
	fmovrdgez	%o1,	%f8,	%f14
	bleu,a	loop_3009
	array32	%i4,	%i1,	%l0
	sllx	%i5,	%l5,	%i0
	srlx	%o3,	%g1,	%g3
loop_3009:
	fbo,a	%fcc3,	loop_3010
	edge8ln	%o4,	%i7,	%o7
	udivcc	%g5,	0x1495,	%l1
	fmovrdgz	%i3,	%f2,	%f30
loop_3010:
	tle	%icc,	0x3
	set	0x7C, %o3
	ldswa	[%l7 + %o3] 0x04,	%i2
	edge16n	%o0,	%g2,	%l3
	taddcctv	%i6,	0x0A68,	%o2
	fmovsge	%icc,	%f28,	%f31
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f6
	addccc	%g4,	0x0F8A,	%g7
	fba	%fcc1,	loop_3011
	fmovdvc	%icc,	%f1,	%f16
	movleu	%icc,	%l6,	%o6
	subc	%o5,	0x1554,	%l4
loop_3011:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%l2
	brz	%o1,	loop_3012
	sra	%g6,	%i4,	%l0
	bg,a	%icc,	loop_3013
	fmovdgu	%icc,	%f6,	%f2
loop_3012:
	bleu	%icc,	loop_3014
	popc	0x1D65,	%i5
loop_3013:
	fbn	%fcc1,	loop_3015
	sir	0x00BE
loop_3014:
	fcmpeq16	%f28,	%f26,	%i1
	array16	%i0,	%o3,	%g1
loop_3015:
	fmovrsne	%l5,	%f14,	%f19
	xor	%g3,	0x0B2A,	%o4
	movrne	%i7,	%g5,	%l1
	be,a,pt	%xcc,	loop_3016
	fmovde	%icc,	%f1,	%f26
	nop
	setx	loop_3017,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%o7,	%i3,	%o0
loop_3016:
	movge	%xcc,	%i2,	%g2
	array32	%i6,	%o2,	%l3
loop_3017:
	movleu	%icc,	%g7,	%g4
	tgu	%xcc,	0x3
	fbue,a	%fcc0,	loop_3018
	edge8n	%l6,	%o6,	%o5
	ldsb	[%l7 + 0x14],	%l2
	sth	%l4,	[%l7 + 0x3A]
loop_3018:
	array16	%g6,	%o1,	%i4
	andncc	%l0,	%i5,	%i1
	ta	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x36] %asi,	%o3
	movne	%icc,	%g1,	%l5
	nop
	setx	0xDA06A364,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f15
	alignaddr	%i0,	%g3,	%i7
	fmovdle	%icc,	%f2,	%f23
	movre	%g5,	%o4,	%o7
	bleu,pt	%icc,	loop_3019
	xorcc	%l1,	%o0,	%i3
	ba	loop_3020
	fbul,a	%fcc0,	loop_3021
loop_3019:
	tne	%icc,	0x7
	addc	%g2,	0x0185,	%i2
loop_3020:
	fmovdn	%icc,	%f0,	%f3
loop_3021:
	movcs	%xcc,	%o2,	%i6
	stb	%l3,	[%l7 + 0x6B]
	fmovscs	%icc,	%f30,	%f4
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f19
	movrlez	%g4,	%l6,	%g7
	fmovrse	%o6,	%f21,	%f3
	sdiv	%o5,	0x10F2,	%l4
	movne	%xcc,	%l2,	%o1
	fmovrdgez	%i4,	%f20,	%f20
	fbo	%fcc2,	loop_3022
	orncc	%l0,	0x035A,	%i5
	nop
	fitos	%f8,	%f27
	fstox	%f27,	%f0
	fbu	%fcc0,	loop_3023
loop_3022:
	taddcctv	%i1,	%g6,	%g1
	set	0x08, %l0
	ldsba	[%l7 + %l0] 0x04,	%l5
loop_3023:
	tgu	%icc,	0x7
	movge	%icc,	%i0,	%o3
	nop
	setx	0xBC953A0EE078AFE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	ldx	[%l7 + 0x60],	%g3
	srlx	%i7,	0x00,	%g5
	fmovdvc	%xcc,	%f0,	%f28
	umul	%o7,	0x1FF4,	%l1
	edge32l	%o0,	%i3,	%o4
	tvc	%icc,	0x1
	tpos	%xcc,	0x0
	tgu	%xcc,	0x1
	movrne	%i2,	0x175,	%g2
	edge16ln	%o2,	%i6,	%g4
	edge32l	%l6,	%g7,	%l3
	fnor	%f22,	%f18,	%f0
	stb	%o6,	[%l7 + 0x63]
	fors	%f31,	%f6,	%f31
	movrgz	%o5,	0x160,	%l4
	nop
	setx	0x205F7D03,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	edge32l	%l2,	%o1,	%i4
	nop
	setx	loop_3024,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x645D7DCE507E387A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	subccc	%i5,	%i1,	%l0
	alignaddrl	%g6,	%l5,	%g1
loop_3024:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o3,	%i0
	brgez,a	%g3,	loop_3025
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x71, %o5
	stba	%g5,	[%l7 + %o5] 0x19
loop_3025:
	movne	%icc,	%i7,	%l1
	set	0x30, %l4
	stxa	%o7,	[%l7 + %l4] 0x19
	and	%i3,	%o0,	%o4
	ta	%icc,	0x5
	fcmpeq32	%f20,	%f14,	%g2
	ldx	[%l7 + 0x48],	%o2
	fmovdle	%icc,	%f5,	%f4
	fmovde	%icc,	%f1,	%f12
	udivcc	%i6,	0x1887,	%i2
	mulscc	%l6,	%g7,	%g4
	fmovscs	%xcc,	%f6,	%f5
	fandnot2s	%f22,	%f21,	%f18
	srl	%l3,	%o6,	%o5
	array32	%l4,	%o1,	%l2
	fmul8x16au	%f29,	%f29,	%f18
	tcc	%icc,	0x6
	bleu	loop_3026
	fmovsvs	%xcc,	%f0,	%f27
	bge	loop_3027
	ble,a,pn	%xcc,	loop_3028
loop_3026:
	edge32ln	%i4,	%i1,	%i5
	fornot2s	%f4,	%f25,	%f15
loop_3027:
	alignaddrl	%l0,	%g6,	%g1
loop_3028:
	fnot2	%f24,	%f0
	sllx	%l5,	%o3,	%i0
	ble	loop_3029
	bcs,a,pn	%xcc,	loop_3030
	andn	%g3,	0x149B,	%i7
	movneg	%icc,	%g5,	%l1
loop_3029:
	array8	%i3,	%o0,	%o4
loop_3030:
	nop
	set	0x4E, %g3
	ldsba	[%l7 + %g3] 0x18,	%o7
	movg	%xcc,	%g2,	%o2
	fbl	%fcc3,	loop_3031
	xorcc	%i6,	%l6,	%i2
	bvs,pn	%icc,	loop_3032
	nop
	setx	0x3E4D3DB95920CA7F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9232BFE624D0F345,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f10,	%f14
loop_3031:
	bvc	loop_3033
	addccc	%g4,	%l3,	%o6
loop_3032:
	tleu	%xcc,	0x3
	nop
	setx	0x624623668E29A318,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x64DD9780A117D41D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f14,	%f20
loop_3033:
	fnegs	%f10,	%f10
	stx	%g7,	[%l7 + 0x20]
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x34] %asi,	%l4
	edge16l	%o5,	%l2,	%i4
	edge8ln	%i1,	%i5,	%o1
	movre	%g6,	0x2DB,	%l0
	sra	%g1,	%l5,	%i0
	xorcc	%g3,	0x0DD0,	%i7
	mulx	%o3,	%g5,	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o4
	fmovrslz	%o0,	%f27,	%f29
	tcs	%icc,	0x7
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f24
	or	%g2,	0x0FD0,	%o2
	bvs,pn	%icc,	loop_3034
	bneg,a,pn	%icc,	loop_3035
	taddcctv	%i6,	%o7,	%l6
	fmovsgu	%xcc,	%f3,	%f12
loop_3034:
	xorcc	%g4,	%i2,	%l3
loop_3035:
	fpsub32s	%f24,	%f28,	%f1
	edge32ln	%o6,	%l4,	%g7
	andncc	%o5,	%i4,	%i1
	edge32l	%i5,	%o1,	%l2
	alignaddrl	%l0,	%g6,	%g1
	set	0x18, %i0
	sta	%f0,	[%l7 + %i0] 0x10
	bleu,a	%xcc,	loop_3036
	fcmpgt16	%f22,	%f6,	%l5
	addcc	%i0,	%i7,	%o3
	edge16l	%g3,	%i3,	%g5
loop_3036:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x46] %asi,	%o4
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	flush	%l7 + 0x54
	nop
	setx	0x38CC4766,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f3
	fxors	%f11,	%f21,	%f13
	fnand	%f20,	%f16,	%f14
	fbug,a	%fcc1,	loop_3037
	tvs	%xcc,	0x0
	orn	%o0,	0x1C3B,	%o2
	ldsw	[%l7 + 0x08],	%g2
loop_3037:
	subccc	%i6,	%l6,	%o7
	sth	%g4,	[%l7 + 0x2E]
	movrlez	%l3,	%o6,	%l4
	wr	%g0,	0x18,	%asi
	sta	%f22,	[%l7 + 0x34] %asi
	edge8	%i2,	%g7,	%i4
	nop
	fitod	%f18,	%f22
	bpos	%icc,	loop_3038
	nop
	setx	0x55A7704E67BCE697,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0EEB9E155063A994,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f24
	movrlez	%o5,	0x118,	%i1
	fcmpeq32	%f28,	%f8,	%o1
loop_3038:
	edge16n	%l2,	%l0,	%i5
	xorcc	%g1,	0x1DB7,	%g6
	tcc	%xcc,	0x7
	ba	%icc,	loop_3039
	edge8	%l5,	%i0,	%o3
	movn	%xcc,	%i7,	%g3
	tpos	%xcc,	0x5
loop_3039:
	fmovspos	%icc,	%f16,	%f14
	taddcctv	%g5,	0x1E47,	%o4
	fmovrdne	%i3,	%f20,	%f10
	ba,a,pn	%icc,	loop_3040
	umulcc	%o0,	0x1B9D,	%l1
	tsubcctv	%o2,	%g2,	%i6
	fnegd	%f30,	%f16
loop_3040:
	movre	%l6,	%g4,	%l3
	fbge	%fcc3,	loop_3041
	addc	%o7,	0x1465,	%o6
	mova	%xcc,	%i2,	%g7
	bgu,pn	%xcc,	loop_3042
loop_3041:
	alignaddr	%i4,	%o5,	%l4
	set	0x6E, %o2
	ldsha	[%l7 + %o2] 0x14,	%o1
loop_3042:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x20, %g4
	ldsha	[%l7 + %g4] 0x19,	%l2
	nop
	setx	loop_3043,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%l0,	0x0BDA,	%i1
	nop
	setx	0x682DB2A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x9B92BFEF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f27,	%f5
	fmul8x16au	%f2,	%f12,	%f14
loop_3043:
	fble,a	%fcc1,	loop_3044
	xor	%i5,	0x0A4C,	%g6
	tneg	%icc,	0x0
	ble,a,pt	%icc,	loop_3045
loop_3044:
	movge	%icc,	%l5,	%i0
	edge8ln	%g1,	%o3,	%g3
	fbue,a	%fcc1,	loop_3046
loop_3045:
	flush	%l7 + 0x58
	udiv	%g5,	0x0174,	%i7
	addc	%o4,	0x1AA9,	%i3
loop_3046:
	movvs	%xcc,	%l1,	%o2
	edge32ln	%o0,	%i6,	%g2
	movcc	%xcc,	%g4,	%l3
	movcc	%icc,	%l6,	%o7
	tsubcc	%i2,	%o6,	%g7
	addc	%i4,	%l4,	%o1
	movl	%xcc,	%l2,	%l0
	edge16l	%i1,	%i5,	%g6
	set	0x08, %l3
	ldswa	[%l7 + %l3] 0x18,	%l5
	bcs,a,pt	%icc,	loop_3047
	movcs	%xcc,	%o5,	%g1
	fmovsl	%xcc,	%f20,	%f8
	fexpand	%f19,	%f16
loop_3047:
	array32	%i0,	%g3,	%o3
	edge16	%g5,	%i7,	%i3
	fpack16	%f30,	%f4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l1
	fmovsne	%icc,	%f18,	%f6
	tsubcctv	%o2,	0x1120,	%o4
	wr	%g0,	0x88,	%asi
	stha	%i6,	[%l7 + 0x64] %asi
	srl	%o0,	%g4,	%g2
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x81,	%l6
	movn	%icc,	%o7,	%l3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2840
!	Type x   	: 1289
!	Type cti   	: 3047
!	Type f   	: 4529
!	Type i   	: 13295
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x7E31C301
.word 0x0333134F
.word 0xE6E20F44
.word 0x2DD3F855
.word 0x52748CFF
.word 0xC8EDAC78
.word 0xF1E7DF32
.word 0xAECC1F8F
.word 0xF59EC8A8
.word 0xABA41D91
.word 0x5FC7879C
.word 0xD07B65D8
.word 0x72E69C75
.word 0xA3955E67
.word 0x858F8506
.word 0x15B72BBA
.word 0x13FCDA99
.word 0x380929C7
.word 0x4C179355
.word 0x609F7217
.word 0x96B8027E
.word 0xD8640FDD
.word 0x0E3D9217
.word 0xAAEC2F8D
.word 0x24123D32
.word 0x8E0CFF8E
.word 0xBC900F28
.word 0x4026BB54
.word 0xCF4643AF
.word 0x24EE6DED
.word 0x16004646
.word 0xAC3C0A93
.word 0x2CE15032
.word 0x4E5759E8
.word 0x59FB4E04
.word 0x83903E8D
.word 0x026D83B2
.word 0x899D6135
.word 0x337E5128
.word 0xCB0C647B
.word 0x73DB95B1
.word 0xFCF4714E
.word 0xAF2C8287
.word 0xA9EBD3E7
.word 0xD31927C9
.word 0xDE7989C7
.word 0x060C7E23
.word 0x3110D37F
.word 0x1379F0CA
.word 0xA61DF390
.word 0x8C7D20D1
.word 0x105E0CDA
.word 0x3CB543A0
.word 0x55B96855
.word 0x8D66C426
.word 0x9E74D4AE
.word 0x4CBAAF91
.word 0x97EF45DD
.word 0xA7FD0C7C
.word 0x660DCC99
.word 0x199AE715
.word 0xFAEA28ED
.word 0x052DFD22
.word 0xAB464C73
.end
