/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f3.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f3.s,v 1.1 2007/05/11 17:22:23 drp Exp $"
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
	setx	0x58F28B95306F6573,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x0,	%g1
	set	0x9,	%g2
	set	0x7,	%g3
	set	0xB,	%g4
	set	0xB,	%g5
	set	0x1,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x0,	%i1
	set	-0xC,	%i2
	set	-0x7,	%i3
	set	-0x1,	%i4
	set	-0x2,	%i5
	set	-0xE,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x6FC9192F,	%l0
	set	0x413C9F4D,	%l1
	set	0x21A4291B,	%l2
	set	0x21A492F6,	%l3
	set	0x0BCD1921,	%l4
	set	0x08F35C0D,	%l5
	set	0x48A603A4,	%l6
	!# Output registers
	set	-0x15DA,	%o0
	set	-0x003C,	%o1
	set	0x014C,	%o2
	set	-0x1E8E,	%o3
	set	-0x014C,	%o4
	set	0x15DD,	%o5
	set	-0x1A08,	%o6
	set	-0x0739,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2ED426ACA198DA8F)
	INIT_TH_FP_REG(%l7,%f2,0xE4C45822A049B9ED)
	INIT_TH_FP_REG(%l7,%f4,0x252B0184DF75ED3D)
	INIT_TH_FP_REG(%l7,%f6,0x1AEA709F7C1E815F)
	INIT_TH_FP_REG(%l7,%f8,0x1BA8B84B60AA13C7)
	INIT_TH_FP_REG(%l7,%f10,0x7DBDA39EDFE89B56)
	INIT_TH_FP_REG(%l7,%f12,0x7AB137D185D0A7CB)
	INIT_TH_FP_REG(%l7,%f14,0xFEAECDD45E32A9FB)
	INIT_TH_FP_REG(%l7,%f16,0x62D7173DDC8CE40F)
	INIT_TH_FP_REG(%l7,%f18,0x6560EF732A69B00B)
	INIT_TH_FP_REG(%l7,%f20,0xBA901913506510DA)
	INIT_TH_FP_REG(%l7,%f22,0xEA3959C1DE0FD538)
	INIT_TH_FP_REG(%l7,%f24,0x1E26DE4379AC849B)
	INIT_TH_FP_REG(%l7,%f26,0xA20D317306E9687E)
	INIT_TH_FP_REG(%l7,%f28,0x83CF7AC394F65054)
	INIT_TH_FP_REG(%l7,%f30,0xA44D5AC1026413B3)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAC0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	std	%f18,	[%l7 + 0x28]
	alignaddr	%i2,	%i3,	%g2
	array8	%i5,	%o7,	%l4
	sdivx	%o1,	0x0875,	%l0
	wr	%g0,	0x04,	%asi
	stba	%g5,	[%l7 + 0x20] %asi
	sdivcc	%o2,	0x1EC1,	%l5
	fcmpeq16	%f22,	%f8,	%g1
	edge8ln	%l6,	%o4,	%i0
	te	%xcc,	0x1
	sdivcc	%o5,	0x04AE,	%g3
	ldd	[%l7 + 0x38],	%f2
	edge16ln	%o6,	%l2,	%i4
	st	%f14,	[%l7 + 0x10]
	srl	%i1,	%o3,	%i6
	sth	%l3,	[%l7 + 0x3C]
	fmovdcc	%icc,	%f15,	%f28
	udivcc	%g4,	0x0B2B,	%l1
	ld	[%l7 + 0x38],	%f2
	umul	%g7,	%g6,	%i7
	fmovdgu	%xcc,	%f30,	%f11
	subccc	%o0,	%i3,	%g2
	array8	%i5,	%i2,	%o7
	bg,a,pt	%xcc,	loop_1
	addccc	%o1,	0x160C,	%l0
	fmovdvs	%icc,	%f22,	%f10
	fsrc1s	%f6,	%f21
loop_1:
	fornot1s	%f28,	%f2,	%f27
	mulx	%g5,	0x13E3,	%l4
	movle	%icc,	%l5,	%o2
	fble	%fcc0,	loop_2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g1,	0x1F,	%l6
	std	%o4,	[%l7 + 0x20]
loop_2:
	andn	%o5,	0x119F,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0053,	%i0
	fcmped	%fcc3,	%f16,	%f12
	edge32	%o6,	%l2,	%i1
	fpsub32	%f4,	%f6,	%f24
	brz	%o3,	loop_3
	tcs	%xcc,	0x6
	fnors	%f13,	%f2,	%f27
	bg,pt	%xcc,	loop_4
loop_3:
	andcc	%i4,	0x00BF,	%i6
	movle	%xcc,	%l3,	%g4
	alignaddrl	%l1,	%g7,	%g6
loop_4:
	array8	%o0,	%i7,	%g2
	movvc	%icc,	%i5,	%i3
	and	%i2,	0x0474,	%o7
	sdivcc	%o1,	0x0FFF,	%l0
	movvc	%icc,	%g5,	%l5
	popc	%o2,	%g1
	edge32ln	%l4,	%o4,	%o5
	sth	%g3,	[%l7 + 0x2E]
	subccc	%i0,	%o6,	%l6
	mova	%icc,	%l2,	%o3
	fornot2s	%f22,	%f20,	%f14
	fcmple32	%f22,	%f16,	%i1
	brgez	%i6,	loop_5
	te	%icc,	0x7
	tsubcctv	%i4,	0x090B,	%g4
	set	0x69, %i3
	lduba	[%l7 + %i3] 0x88,	%l3
loop_5:
	tsubcctv	%g7,	0x0B99,	%g6
	tcc	%xcc,	0x3
	tge	%icc,	0x1
	tl	%xcc,	0x3
	movgu	%icc,	%o0,	%l1
	smul	%i7,	0x1EA5,	%g2
	fpadd32s	%f3,	%f22,	%f21
	fmovsge	%icc,	%f24,	%f27
	fmovrse	%i5,	%f8,	%f8
	set	0x24, %g2
	stha	%i3,	[%l7 + %g2] 0x04
	fmovscc	%xcc,	%f18,	%f19
	alignaddr	%o7,	%i2,	%o1
	udiv	%l0,	0x183D,	%l5
	edge32l	%g5,	%g1,	%l4
	add	%o2,	%o4,	%o5
	tl	%xcc,	0x3
	edge32ln	%i0,	%o6,	%l6
	subc	%l2,	0x0960,	%g3
	edge16n	%o3,	%i6,	%i1
	movre	%i4,	0x09F,	%l3
	stx	%g4,	[%l7 + 0x18]
	tvs	%icc,	0x2
	brlz,a	%g6,	loop_6
	bge,a	%icc,	loop_7
	tgu	%xcc,	0x4
	movne	%xcc,	%o0,	%g7
loop_6:
	fpmerge	%f5,	%f24,	%f18
loop_7:
	alignaddrl	%i7,	%l1,	%i5
	fmovd	%f10,	%f24
	sra	%i3,	0x1D,	%o7
	stw	%i2,	[%l7 + 0x2C]
	fmovsle	%icc,	%f14,	%f10
	sdivcc	%g2,	0x1EA0,	%o1
	bl,a	%icc,	loop_8
	add	%l5,	0x1792,	%g5
	addccc	%g1,	%l4,	%o2
	stb	%o4,	[%l7 + 0x08]
loop_8:
	fpsub16	%f30,	%f14,	%f24
	sub	%o5,	%l0,	%i0
	taddcc	%l6,	%o6,	%l2
	nop
	set	0x20, %i6
	std	%g2,	[%l7 + %i6]
	fcmpes	%fcc2,	%f24,	%f3
	nop
	setx loop_9, %l0, %l1
	jmpl %l1, %o3
	edge8ln	%i6,	%i1,	%l3
	movvs	%icc,	%i4,	%g4
	smul	%o0,	0x0FE1,	%g6
loop_9:
	movre	%i7,	%g7,	%l1
	bvs,a,pn	%xcc,	loop_10
	array32	%i3,	%o7,	%i2
	fpsub16	%f0,	%f8,	%f10
	movleu	%icc,	%i5,	%o1
loop_10:
	tn	%icc,	0x0
	ldub	[%l7 + 0x79],	%l5
	for	%f22,	%f10,	%f8
	tl	%icc,	0x5
	sdivcc	%g5,	0x146D,	%g2
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x61] %asi,	%g1
	sllx	%o2,	0x12,	%o4
	ble,a	%xcc,	loop_11
	lduw	[%l7 + 0x2C],	%o5
	andn	%l4,	0x0857,	%i0
	andncc	%l0,	%l6,	%o6
loop_11:
	smulcc	%l2,	0x10DA,	%g3
	fornot2s	%f0,	%f10,	%f1
	tpos	%icc,	0x5
	ldd	[%l7 + 0x28],	%i6
	movre	%i1,	0x303,	%l3
	edge16n	%i4,	%o3,	%g4
	movne	%xcc,	%o0,	%i7
	edge8	%g7,	%g6,	%l1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%o7
	edge8ln	%i2,	%i3,	%i5
	fabsd	%f0,	%f26
	fmovrslz	%o1,	%f6,	%f27
	tcc	%icc,	0x1
	movleu	%xcc,	%l5,	%g2
	sra	%g5,	0x17,	%o2
	addccc	%g1,	%o5,	%l4
	movrgez	%i0,	%o4,	%l6
	movge	%icc,	%o6,	%l2
	subc	%l0,	0x0E06,	%i6
	tsubcc	%g3,	0x18C2,	%l3
	edge16l	%i1,	%i4,	%g4
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f0
	movge	%xcc,	%o3,	%o0
	fandnot2	%f30,	%f0,	%f10
	fbl	%fcc3,	loop_12
	fexpand	%f3,	%f2
	tneg	%xcc,	0x2
	fbe,a	%fcc2,	loop_13
loop_12:
	sdivx	%g7,	0x13DE,	%g6
	add	%l1,	%i7,	%i2
	tn	%icc,	0x0
loop_13:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x58] %asi,	%f20
	edge32ln	%i3,	%o7,	%i5
	ldsw	[%l7 + 0x14],	%o1
	edge16ln	%l5,	%g5,	%g2
	sth	%o2,	[%l7 + 0x72]
	movre	%g1,	%l4,	%o5
	popc	0x0153,	%o4
	fnand	%f4,	%f0,	%f0
	fmovsn	%xcc,	%f2,	%f4
	movn	%xcc,	%l6,	%o6
	movrlez	%l2,	%l0,	%i6
	addc	%i0,	0x0D70,	%l3
	fbl	%fcc3,	loop_14
	movleu	%icc,	%g3,	%i4
	brgz,a	%g4,	loop_15
	bvc,pn	%xcc,	loop_16
loop_14:
	ldd	[%l7 + 0x10],	%o2
	fcmps	%fcc1,	%f29,	%f10
loop_15:
	brlz,a	%i1,	loop_17
loop_16:
	ldd	[%l7 + 0x08],	%g6
	sdiv	%o0,	0x1BEF,	%g6
	fble	%fcc3,	loop_18
loop_17:
	fandnot2	%f10,	%f16,	%f30
	movle	%icc,	%i7,	%i2
	edge16	%i3,	%o7,	%l1
loop_18:
	ta	%icc,	0x4
	sllx	%o1,	%i5,	%g5
	sdivcc	%g2,	0x06D3,	%o2
	fbule,a	%fcc1,	loop_19
	xnorcc	%g1,	%l5,	%o5
	subccc	%o4,	%l4,	%o6
	edge16ln	%l6,	%l2,	%i6
loop_19:
	movcc	%xcc,	%i0,	%l0
	movpos	%xcc,	%l3,	%i4
	movn	%icc,	%g3,	%g4
	andncc	%i1,	%g7,	%o3
	tl	%xcc,	0x0
	movle	%icc,	%g6,	%o0
	alignaddr	%i2,	%i7,	%o7
	ta	%icc,	0x7
	tg	%xcc,	0x2
	fmovrslez	%l1,	%f6,	%f21
	fpadd16	%f10,	%f24,	%f20
	bgu	%icc,	loop_20
	te	%icc,	0x0
	ba,pt	%icc,	loop_21
	movrgz	%o1,	%i3,	%g5
loop_20:
	bgu	loop_22
	edge32	%i5,	%o2,	%g2
loop_21:
	fandnot1s	%f28,	%f24,	%f22
	addc	%l5,	0x0728,	%o5
loop_22:
	call	loop_23
	umulcc	%g1,	0x120A,	%l4
	tle	%icc,	0x1
	array32	%o6,	%o4,	%l2
loop_23:
	subcc	%i6,	%l6,	%i0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l0
	movcs	%xcc,	%i4,	%l3
	fmovdge	%xcc,	%f2,	%f28
	movrne	%g4,	0x04E,	%g3
	fbuge	%fcc2,	loop_24
	movvs	%icc,	%g7,	%i1
	fmovrsgz	%g6,	%f9,	%f11
	tsubcctv	%o0,	0x11E0,	%i2
loop_24:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o3
	movrne	%o7,	0x357,	%i7
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f16
	bcs,pt	%icc,	loop_25
	addc	%o1,	%i3,	%l1
	xnorcc	%g5,	%i5,	%g2
	fnors	%f10,	%f25,	%f16
loop_25:
	andcc	%l5,	0x1645,	%o2
	sdiv	%g1,	0x1D29,	%l4
	array32	%o6,	%o5,	%l2
	fnot2s	%f30,	%f12
	xnor	%o4,	0x034C,	%l6
	edge16n	%i6,	%l0,	%i0
	orcc	%l3,	0x197C,	%g4
	fmovsn	%icc,	%f14,	%f12
	edge16	%g3,	%i4,	%i1
	fmovdgu	%icc,	%f21,	%f8
	bn,pn	%xcc,	loop_26
	fpackfix	%f2,	%f20
	fcmpeq32	%f28,	%f4,	%g7
	fbne,a	%fcc3,	loop_27
loop_26:
	mulscc	%g6,	%i2,	%o3
	movg	%icc,	%o0,	%i7
	movl	%xcc,	%o7,	%i3
loop_27:
	addcc	%l1,	%o1,	%g5
	tg	%icc,	0x3
	ble,pn	%icc,	loop_28
	edge32	%i5,	%g2,	%o2
	edge16n	%l5,	%g1,	%l4
	tg	%xcc,	0x3
loop_28:
	nop
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x1e
	membar	#Sync
	tsubcctv	%o6,	%o5,	%l2
	movge	%icc,	%l6,	%i6
	edge8l	%l0,	%o4,	%i0
	movvc	%xcc,	%g4,	%l3
	fmovrdgez	%g3,	%f22,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x4
	mulscc	%i1,	0x15AE,	%i4
	fblg	%fcc1,	loop_29
	st	%f11,	[%l7 + 0x3C]
	fcmpne16	%f2,	%f6,	%g7
	orn	%i2,	%g6,	%o0
loop_29:
	nop
	set	0x14, %i0
	ldsha	[%l7 + %i0] 0x81,	%o3
	tle	%xcc,	0x5
	fcmple16	%f0,	%f28,	%i7
	edge16l	%o7,	%i3,	%o1
	brnz,a	%l1,	loop_30
	fpack32	%f6,	%f8,	%f8
	stw	%i5,	[%l7 + 0x50]
	ta	%xcc,	0x3
loop_30:
	popc	%g2,	%g5
	be,pn	%icc,	loop_31
	xorcc	%l5,	0x1D72,	%o2
	fmovscc	%xcc,	%f16,	%f18
	movrlez	%g1,	0x24B,	%o6
loop_31:
	smul	%l4,	%o5,	%l2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	mulscc	%l6,	0x05A7,	%i6
	stx	%o4,	[%l7 + 0x40]
	array8	%l0,	%g4,	%l3
	movleu	%xcc,	%g3,	%i0
	bvc,a	%icc,	loop_32
	fmovsa	%xcc,	%f14,	%f22
	fmovsne	%xcc,	%f3,	%f26
	movn	%icc,	%i4,	%g7
loop_32:
	be,pt	%icc,	loop_33
	fnor	%f16,	%f28,	%f2
	bgu,a,pn	%xcc,	loop_34
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33:
	fcmpeq32	%f24,	%f18,	%i2
	wr	%g0,	0x27,	%asi
	stxa	%g6,	[%l7 + 0x28] %asi
	membar	#Sync
loop_34:
	subcc	%i1,	%o0,	%i7
	sll	%o7,	0x1F,	%o3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o1
	srlx	%l1,	0x04,	%i5
	tg	%icc,	0x5
	fcmpeq32	%f24,	%f0,	%i3
	bneg	%icc,	loop_35
	ldx	[%l7 + 0x18],	%g5
	xor	%g2,	%l5,	%o2
	tpos	%xcc,	0x4
loop_35:
	sllx	%o6,	0x02,	%g1
	sethi	0x01A7,	%o5
	set	0x55, %g4
	lduba	[%l7 + %g4] 0x15,	%l4
	xor	%l6,	%l2,	%o4
	fcmpne16	%f24,	%f0,	%i6
	fmovdneg	%icc,	%f6,	%f1
	edge8l	%l0,	%l3,	%g3
	tsubcc	%g4,	0x02A3,	%i4
	fandnot2s	%f19,	%f31,	%f4
	umulcc	%g7,	%i2,	%i0
	ldd	[%l7 + 0x10],	%f22
	fands	%f22,	%f18,	%f14
	movre	%g6,	0x27D,	%i1
	movvc	%xcc,	%i7,	%o7
	smul	%o3,	0x107B,	%o0
	udivcc	%o1,	0x04AE,	%l1
	fabsd	%f6,	%f26
	fbul	%fcc1,	loop_36
	edge32	%i3,	%i5,	%g5
	array8	%g2,	%o2,	%l5
	flush	%l7 + 0x78
loop_36:
	fble	%fcc0,	loop_37
	nop
	set	0x48, %i4
	prefetch	[%l7 + %i4],	 0x1
	membar	0x40
	fbo	%fcc0,	loop_38
loop_37:
	edge8ln	%g1,	%o5,	%o6
	fbug	%fcc0,	loop_39
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38:
	tgu	%xcc,	0x1
	fmovsge	%icc,	%f20,	%f21
loop_39:
	xnorcc	%l6,	%l4,	%o4
	tneg	%xcc,	0x5
	movrlez	%l2,	0x355,	%l0
	move	%xcc,	%l3,	%g3
	taddcctv	%i6,	%g4,	%g7
	xnorcc	%i2,	%i0,	%i4
	taddcc	%i1,	%g6,	%o7
	sll	%i7,	0x0A,	%o3
	movrgez	%o1,	0x344,	%o0
	movpos	%icc,	%l1,	%i3
	fmovda	%xcc,	%f23,	%f31
	te	%xcc,	0x6
	srax	%i5,	%g2,	%o2
	fmovse	%icc,	%f3,	%f27
	add	%l5,	%g5,	%g1
	smulcc	%o5,	0x1D53,	%l6
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f0
	andn	%o6,	%l4,	%o4
	movn	%icc,	%l0,	%l2
	sdivx	%l3,	0x1D7B,	%g3
	popc	0x082E,	%g4
	brlz,a	%g7,	loop_40
	fmovrsne	%i6,	%f29,	%f25
	orn	%i2,	0x1E53,	%i0
	movn	%xcc,	%i1,	%i4
loop_40:
	fbe,a	%fcc3,	loop_41
	movrgz	%g6,	%o7,	%o3
	tpos	%xcc,	0x7
	stw	%o1,	[%l7 + 0x34]
loop_41:
	movre	%o0,	0x3D0,	%l1
	tl	%icc,	0x5
	edge8ln	%i3,	%i5,	%i7
	fcmpgt16	%f18,	%f24,	%g2
	alignaddrl	%o2,	%g5,	%l5
	tne	%xcc,	0x0
	add	%g1,	%l6,	%o6
	fmovsg	%icc,	%f13,	%f21
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x5E] %asi
	fxnors	%f3,	%f3,	%f7
	fornot1	%f12,	%f22,	%f26
	andcc	%o4,	0x0568,	%l4
	swap	[%l7 + 0x34],	%l2
	movrgez	%l0,	0x001,	%l3
	movrne	%g3,	0x283,	%g7
	movpos	%xcc,	%g4,	%i2
	fmul8ulx16	%f4,	%f4,	%f26
	edge16l	%i0,	%i6,	%i1
	movpos	%xcc,	%g6,	%o7
	bn,pn	%xcc,	loop_42
	fsrc1s	%f19,	%f15
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_42:
	tg	%icc,	0x0
	fmovsvc	%xcc,	%f25,	%f20
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%o1
	sll	%o0,	%i4,	%l1
	addc	%i5,	0x084A,	%i7
	fmovsa	%icc,	%f27,	%f19
	bcs,pn	%xcc,	loop_43
	srax	%i3,	0x19,	%g2
	andcc	%o2,	0x0BC5,	%g5
	xnor	%g1,	%l5,	%o6
loop_43:
	edge8n	%o5,	%o4,	%l6
	ldsb	[%l7 + 0x1A],	%l2
	array8	%l0,	%l4,	%l3
	sdivcc	%g3,	0x0453,	%g7
	nop
	setx loop_44, %l0, %l1
	jmpl %l1, %i2
	edge8	%g4,	%i0,	%i1
	orcc	%i6,	0x0AF7,	%o7
	fmovscs	%xcc,	%f0,	%f15
loop_44:
	array16	%g6,	%o3,	%o0
	fxnors	%f26,	%f14,	%f1
	tgu	%icc,	0x7
	tleu	%icc,	0x3
	fmovdneg	%icc,	%f25,	%f2
	movvs	%xcc,	%o1,	%l1
	tleu	%icc,	0x2
	set	0x7C, %i1
	lduwa	[%l7 + %i1] 0x88,	%i5
	wr	%g0,	0xe3,	%asi
	stha	%i7,	[%l7 + 0x3C] %asi
	membar	#Sync
	umulcc	%i3,	0x054F,	%i4
	fbg,a	%fcc1,	loop_45
	brlez	%o2,	loop_46
	tsubcc	%g2,	0x11F1,	%g5
	subccc	%g1,	%o6,	%o5
loop_45:
	xorcc	%o4,	%l5,	%l6
loop_46:
	fsrc2	%f24,	%f30
	bgu	%xcc,	loop_47
	bpos	%icc,	loop_48
	fcmpgt16	%f0,	%f26,	%l0
	ldub	[%l7 + 0x78],	%l4
loop_47:
	fmovrdgz	%l3,	%f12,	%f24
loop_48:
	tneg	%icc,	0x5
	fornot1	%f0,	%f22,	%f26
	tpos	%xcc,	0x7
	fblg	%fcc1,	loop_49
	fnegd	%f24,	%f30
	smul	%l2,	0x0AEF,	%g7
	edge16l	%i2,	%g3,	%i0
loop_49:
	edge8ln	%i1,	%i6,	%o7
	tg	%icc,	0x3
	sub	%g4,	0x0397,	%g6
	tg	%xcc,	0x6
	and	%o0,	0x0B66,	%o1
	brnz,a	%o3,	loop_50
	bn,a	%icc,	loop_51
	fmul8x16	%f28,	%f0,	%f12
	umulcc	%l1,	0x0BC2,	%i5
loop_50:
	nop
	set	0x44, %l4
	lduwa	[%l7 + %l4] 0x04,	%i3
loop_51:
	te	%xcc,	0x6
	set	0x10, %o0
	sta	%f17,	[%l7 + %o0] 0x18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xe2,	%asi
	stwa	%i7,	[%l7 + 0x14] %asi
	membar	#Sync
	movre	%o2,	0x1F5,	%g2
	srax	%i4,	0x13,	%g5
	fmovdcc	%xcc,	%f11,	%f0
	orncc	%o6,	0x065E,	%o5
	lduh	[%l7 + 0x34],	%o4
	edge8ln	%l5,	%l6,	%g1
	movg	%xcc,	%l0,	%l4
	fmovrslz	%l3,	%f15,	%f0
	xnorcc	%g7,	%l2,	%g3
	sth	%i2,	[%l7 + 0x50]
	or	%i1,	0x050B,	%i0
	tleu	%icc,	0x6
	movre	%i6,	%g4,	%o7
	sir	0x1C55
	addccc	%g6,	%o0,	%o3
	fxor	%f24,	%f20,	%f18
	andncc	%l1,	%o1,	%i3
	taddcc	%i5,	%o2,	%g2
	bn,a	%icc,	loop_52
	edge32	%i7,	%i4,	%o6
	brgz,a	%g5,	loop_53
	umulcc	%o4,	%o5,	%l5
loop_52:
	swap	[%l7 + 0x30],	%g1
	movrne	%l6,	%l0,	%l3
loop_53:
	orn	%g7,	%l4,	%l2
	bcc,pn	%xcc,	loop_54
	tvs	%xcc,	0x2
	fcmpd	%fcc0,	%f22,	%f4
	wr	%g0,	0x2b,	%asi
	stba	%g3,	[%l7 + 0x78] %asi
	membar	#Sync
loop_54:
	bvs,a	loop_55
	smulcc	%i2,	0x0E08,	%i0
	fmovs	%f5,	%f25
	movl	%icc,	%i6,	%g4
loop_55:
	fpsub16s	%f17,	%f27,	%f24
	bcs,pn	%icc,	loop_56
	bne,pt	%xcc,	loop_57
	ta	%icc,	0x7
	popc	%i1,	%g6
loop_56:
	bshuffle	%f6,	%f26,	%f4
loop_57:
	fmul8ulx16	%f2,	%f28,	%f10
	fzeros	%f2
	xnor	%o7,	%o3,	%l1
	set	0x36, %l0
	stba	%o1,	[%l7 + %l0] 0x2b
	membar	#Sync
	fcmpeq32	%f14,	%f2,	%o0
	set	0x30, %g7
	stwa	%i5,	[%l7 + %g7] 0x2b
	membar	#Sync
	membar	0x38
	fmovdne	%icc,	%f8,	%f11
	srax	%o2,	%i3,	%i7
	tge	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x30, %g6
	sta	%f29,	[%l7 + %g6] 0x80
	umul	%g2,	0x1AC0,	%o6
	fmovsne	%xcc,	%f3,	%f6
	be,a,pn	%icc,	loop_58
	srl	%i4,	0x18,	%o4
	fmovda	%xcc,	%f23,	%f16
	fpadd16s	%f15,	%f14,	%f11
loop_58:
	smulcc	%o5,	%l5,	%g1
	array16	%g5,	%l6,	%l0
	tsubcctv	%l3,	%g7,	%l4
	movcc	%icc,	%g3,	%i2
	bvc,a,pn	%xcc,	loop_59
	bn,pn	%xcc,	loop_60
	movle	%icc,	%i0,	%l2
	orn	%i6,	%i1,	%g6
loop_59:
	fbug	%fcc2,	loop_61
loop_60:
	andcc	%o7,	0x05C7,	%g4
	orn	%l1,	%o3,	%o0
	array8	%o1,	%i5,	%i3
loop_61:
	sir	0x0244
	addcc	%i7,	0x01CF,	%g2
	membar	0x7A
	fornot2	%f16,	%f4,	%f12
	bneg,a,pn	%xcc,	loop_62
	fbug,a	%fcc1,	loop_63
	popc	0x1FDA,	%o6
	std	%i4,	[%l7 + 0x78]
loop_62:
	edge32n	%o2,	%o4,	%o5
loop_63:
	movn	%icc,	%g1,	%l5
	fmovrsgz	%g5,	%f7,	%f29
	fmovrslz	%l0,	%f1,	%f2
	edge8ln	%l3,	%g7,	%l4
	tneg	%xcc,	0x0
	fmovsn	%xcc,	%f15,	%f11
	movne	%icc,	%l6,	%i2
	bne,a	loop_64
	stb	%i0,	[%l7 + 0x1C]
	fmovrsgez	%l2,	%f8,	%f18
	alignaddrl	%g3,	%i6,	%g6
loop_64:
	sdiv	%o7,	0x0329,	%g4
	wr	%g0,	0x81,	%asi
	sta	%f26,	[%l7 + 0x44] %asi
	movleu	%icc,	%l1,	%i1
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%o3
	popc	0x04C1,	%o1
	fandnot1	%f24,	%f10,	%f14
	fnot1	%f28,	%f30
	andn	%i5,	%o0,	%i7
	edge32n	%g2,	%o6,	%i4
	bl	loop_65
	fpsub32s	%f14,	%f18,	%f11
	nop
	setx	loop_66,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%o2,	0x02B0,	%o4
loop_65:
	nop
	set	0x4C, %l2
	ldswa	[%l7 + %l2] 0x18,	%i3
loop_66:
	fmovrse	%o5,	%f23,	%f17
	mulx	%g1,	0x17CA,	%l5
	srax	%g5,	0x0D,	%l0
	bg,pt	%icc,	loop_67
	fmovrslz	%l3,	%f12,	%f6
	membar	0x29
	array16	%g7,	%l4,	%i2
loop_67:
	subcc	%l6,	0x1BBC,	%i0
	fmovs	%f25,	%f6
	edge16n	%g3,	%i6,	%g6
	prefetch	[%l7 + 0x40],	 0x0
	bn,a	loop_68
	fmovdn	%xcc,	%f13,	%f6
	nop
	set	0x68, %i5
	stw	%o7,	[%l7 + %i5]
	fmovspos	%xcc,	%f12,	%f25
loop_68:
	edge16	%g4,	%l2,	%l1
	sdiv	%i1,	0x1F20,	%o1
	bpos,a	loop_69
	fcmped	%fcc1,	%f10,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o3,	0x1F7E,	%o0
loop_69:
	addcc	%i7,	0x17EF,	%i5
	tsubcc	%g2,	0x1C6B,	%i4
	orcc	%o6,	0x04DD,	%o2
	fbe,a	%fcc1,	loop_70
	fbge,a	%fcc3,	loop_71
	taddcc	%i3,	0x1341,	%o4
	subc	%o5,	0x0155,	%l5
loop_70:
	bleu,pt	%xcc,	loop_72
loop_71:
	fbne	%fcc1,	loop_73
	movrgz	%g5,	0x2F0,	%l0
	fxor	%f8,	%f8,	%f4
loop_72:
	nop
	set	0x1C, %o7
	lduba	[%l7 + %o7] 0x15,	%g1
loop_73:
	fxor	%f6,	%f16,	%f18
	fcmple16	%f14,	%f14,	%g7
	brgz	%l3,	loop_74
	fmovsn	%xcc,	%f23,	%f12
	movrlz	%l4,	0x1C3,	%i2
	movre	%l6,	%i0,	%i6
loop_74:
	tcc	%icc,	0x7
	ldsw	[%l7 + 0x08],	%g6
	sllx	%g3,	0x0F,	%g4
	fandnot2	%f30,	%f28,	%f28
	fbg,a	%fcc2,	loop_75
	movrgz	%l2,	0x0A1,	%o7
	fbge	%fcc2,	loop_76
	fcmpgt32	%f30,	%f16,	%i1
loop_75:
	fcmpne32	%f20,	%f14,	%l1
	or	%o3,	0x1D4E,	%o1
loop_76:
	std	%f28,	[%l7 + 0x08]
	sethi	0x0003,	%i7
	ldstub	[%l7 + 0x43],	%i5
	srlx	%g2,	%i4,	%o6
	edge8l	%o0,	%o2,	%o4
	fnegs	%f13,	%f22
	edge32	%o5,	%i3,	%g5
	tcc	%icc,	0x5
	sth	%l0,	[%l7 + 0x16]
	movne	%icc,	%g1,	%g7
	for	%f10,	%f14,	%f4
	tne	%xcc,	0x3
	sdivcc	%l3,	0x1E4A,	%l5
	bg,a,pn	%icc,	loop_77
	xorcc	%l4,	%i2,	%l6
	prefetch	[%l7 + 0x1C],	 0x2
	edge32ln	%i6,	%i0,	%g6
loop_77:
	fornot1	%f18,	%f0,	%f10
	nop
	setx	loop_78,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%g3,	%g4,	%l2
	movcs	%xcc,	%i1,	%l1
	fmovrslez	%o3,	%f10,	%f29
loop_78:
	fnegd	%f10,	%f8
	edge32l	%o7,	%i7,	%o1
	umulcc	%i5,	0x0B81,	%i4
	movn	%xcc,	%g2,	%o0
	tpos	%xcc,	0x1
	orn	%o2,	0x147D,	%o4
	fcmpne32	%f10,	%f4,	%o5
	edge8l	%i3,	%o6,	%l0
	brgz	%g5,	loop_79
	bpos,a,pt	%xcc,	loop_80
	tsubcctv	%g1,	%g7,	%l5
	edge8n	%l4,	%l3,	%i2
loop_79:
	nop
	set	0x40, %i7
	lda	[%l7 + %i7] 0x88,	%f1
loop_80:
	bgu,a,pn	%xcc,	loop_81
	movne	%xcc,	%i6,	%l6
	bn,a,pt	%icc,	loop_82
	alignaddrl	%g6,	%i0,	%g4
loop_81:
	fmovrse	%g3,	%f27,	%f0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x64] %asi,	%f30
loop_82:
	fones	%f2
	fandnot2	%f20,	%f4,	%f12
	fsrc1s	%f19,	%f25
	fpadd16	%f4,	%f8,	%f24
	edge16n	%l2,	%l1,	%i1
	set	0x1d0, %o2
	nop 	! 	stxa	%o7,	[%g0 + %o2] 0x40 ripped by fixASI40.pl
	movneg	%xcc,	%o3,	%i7
	orcc	%o1,	%i5,	%i4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%g2
	bl,pt	%xcc,	loop_83
	stw	%o4,	[%l7 + 0x10]
	xor	%o5,	%o2,	%o6
	udivx	%l0,	0x13D6,	%g5
loop_83:
	fnegs	%f28,	%f30
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	mova	%xcc,	%g7,	%g1
	movcc	%icc,	%l5,	%l3
	flush	%l7 + 0x7C
	fnot1	%f16,	%f28
	fcmple16	%f18,	%f24,	%l4
	tsubcc	%i6,	0x0329,	%i2
	xnor	%l6,	%i0,	%g6
	sir	0x1FF2
	addc	%g3,	%l2,	%l1
	sra	%g4,	%o7,	%o3
	fzeros	%f18
	edge16l	%i1,	%o1,	%i5
	orn	%i4,	%o0,	%g2
	brlez	%o4,	loop_84
	fbg,a	%fcc1,	loop_85
	sra	%o5,	0x1A,	%o2
	fnors	%f22,	%f30,	%f16
loop_84:
	edge8n	%o6,	%l0,	%i7
loop_85:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x11,	%g5,	%g7
	popc	%g1,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l5,	%f20,	%f12
	movvs	%icc,	%l4,	%i6
	array8	%i2,	%l6,	%i0
	xnorcc	%l3,	0x0EDA,	%g3
	or	%g6,	0x10AD,	%l2
	xor	%l1,	0x1138,	%g4
	brnz	%o7,	loop_86
	membar	0x5A
	srl	%o3,	%i1,	%i5
	tg	%icc,	0x4
loop_86:
	bcc,a	loop_87
	tleu	%xcc,	0x3
	fsrc1	%f30,	%f18
	set	0x48, %l5
	ldstuba	[%l7 + %l5] 0x88,	%i4
loop_87:
	andcc	%o0,	%o1,	%g2
	smulcc	%o5,	%o4,	%o2
	fmovdne	%icc,	%f26,	%f1
	fzero	%f20
	subcc	%l0,	0x021F,	%i7
	move	%xcc,	%g5,	%o6
	tgu	%icc,	0x1
	fmovdleu	%xcc,	%f31,	%f12
	movne	%icc,	%g7,	%i3
	movl	%icc,	%g1,	%l5
	prefetch	[%l7 + 0x58],	 0x3
	umul	%l4,	0x1146,	%i6
	xnor	%i2,	%i0,	%l6
	fble	%fcc1,	loop_88
	fzero	%f14
	fmovsvc	%xcc,	%f10,	%f18
	fnands	%f4,	%f19,	%f6
loop_88:
	fandnot2s	%f20,	%f21,	%f19
	tvc	%icc,	0x3
	fand	%f20,	%f4,	%f0
	movrgz	%g3,	0x05F,	%g6
	fors	%f17,	%f7,	%f1
	sll	%l3,	0x17,	%l2
	ta	%xcc,	0x3
	popc	0x1115,	%l1
	subcc	%o7,	0x1165,	%g4
	wr	%g0,	0x2f,	%asi
	stwa	%i1,	[%l7 + 0x54] %asi
	membar	#Sync
	movne	%icc,	%o3,	%i5
	fpmerge	%f7,	%f2,	%f18
	tle	%xcc,	0x1
	subc	%o0,	%o1,	%g2
	mova	%xcc,	%o5,	%i4
	popc	0x1D4C,	%o2
	st	%f10,	[%l7 + 0x60]
	fbg,a	%fcc2,	loop_89
	andn	%l0,	0x14E3,	%i7
	srax	%g5,	%o4,	%g7
	tsubcc	%o6,	0x04C7,	%i3
loop_89:
	bvc,pt	%xcc,	loop_90
	movrgz	%l5,	0x1FD,	%l4
	fmovdvc	%xcc,	%f20,	%f22
	subccc	%i6,	0x06EF,	%i2
loop_90:
	andcc	%g1,	0x1954,	%l6
	fmovsne	%xcc,	%f23,	%f8
	set	0x16, %o1
	stba	%g3,	[%l7 + %o1] 0xe2
	membar	#Sync
	udivx	%g6,	0x04FA,	%l3
	ba,a	loop_91
	sethi	0x0531,	%l2
	bge,pt	%xcc,	loop_92
	movvs	%xcc,	%l1,	%o7
loop_91:
	nop
	setx	loop_93,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%g4,	%i0,	%o3
loop_92:
	subccc	%i5,	%i1,	%o0
	edge32n	%o1,	%o5,	%g2
loop_93:
	fmuld8ulx16	%f2,	%f16,	%f2
	bshuffle	%f18,	%f16,	%f8
	tcc	%icc,	0x0
	edge16l	%i4,	%o2,	%l0
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x19,	%g4
	sdivx	%i7,	0x051D,	%o4
	fbge,a	%fcc0,	loop_94
	brgz	%g7,	loop_95
	sdivx	%i3,	0x0A2E,	%o6
	movrgz	%l5,	0x2EE,	%l4
loop_94:
	tvc	%xcc,	0x2
loop_95:
	fmovdg	%xcc,	%f30,	%f12
	bleu	%icc,	loop_96
	move	%icc,	%i2,	%g1
	movleu	%xcc,	%i6,	%g3
	movcc	%xcc,	%l6,	%g6
loop_96:
	movrne	%l3,	%l2,	%o7
	movge	%icc,	%g4,	%i0
	srlx	%l1,	%o3,	%i1
	fmovscs	%xcc,	%f24,	%f10
	sra	%i5,	%o0,	%o1
	movrne	%g2,	0x111,	%i4
	popc	%o5,	%l0
	fmovsleu	%xcc,	%f6,	%f5
	tg	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g5,	%i7,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%i3
	tsubcc	%o6,	0x1194,	%g7
	edge8l	%l4,	%l5,	%g1
	mulscc	%i6,	0x0408,	%i2
	stbar
	brnz,a	%l6,	loop_97
	fmovdle	%xcc,	%f20,	%f25
	fpsub16s	%f24,	%f29,	%f20
	sdiv	%g3,	0x1231,	%l3
loop_97:
	sdivcc	%g6,	0x1E71,	%o7
	fsrc2	%f2,	%f20
	xnor	%g4,	%i0,	%l1
	fmul8x16al	%f5,	%f27,	%f30
	andn	%o3,	0x109F,	%l2
	smulcc	%i5,	%o0,	%i1
	move	%xcc,	%o1,	%i4
	fbul,a	%fcc2,	loop_98
	movle	%icc,	%o5,	%l0
	edge32	%g2,	%g5,	%i7
	fmovdge	%xcc,	%f10,	%f23
loop_98:
	fmovscc	%icc,	%f26,	%f6
	brnz	%o2,	loop_99
	ba	loop_100
	movvc	%icc,	%i3,	%o6
	add	%o4,	0x0A7D,	%l4
loop_99:
	sra	%l5,	%g7,	%g1
loop_100:
	fbo,a	%fcc0,	loop_101
	bl,a,pn	%icc,	loop_102
	smulcc	%i2,	0x0CB6,	%l6
	bcc,pn	%icc,	loop_103
loop_101:
	brlez,a	%g3,	loop_104
loop_102:
	fbne,a	%fcc0,	loop_105
	fbuge,a	%fcc2,	loop_106
loop_103:
	fmovdcs	%xcc,	%f14,	%f9
loop_104:
	be,a	%icc,	loop_107
loop_105:
	movge	%xcc,	%i6,	%l3
loop_106:
	edge32	%o7,	%g4,	%i0
	fmovrslez	%l1,	%f3,	%f2
loop_107:
	move	%xcc,	%o3,	%g6
	edge8n	%l2,	%i5,	%o0
	add	%o1,	%i1,	%o5
	fmovscs	%icc,	%f21,	%f4
	xnor	%i4,	0x0881,	%g2
	alignaddrl	%g5,	%l0,	%i7
	fblg	%fcc2,	loop_108
	movre	%i3,	%o2,	%o4
	fbul	%fcc3,	loop_109
	fmovrslz	%o6,	%f27,	%f25
loop_108:
	pdist	%f22,	%f4,	%f28
	sdivcc	%l5,	0x18A0,	%g7
loop_109:
	bneg	%xcc,	loop_110
	movl	%icc,	%g1,	%i2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x1C] %asi,	%f4
loop_110:
	srl	%l4,	0x1C,	%l6
	set	0x6C, %o6
	swapa	[%l7 + %o6] 0x88,	%g3
	bleu,a	loop_111
	orncc	%l3,	%i6,	%g4
	stx	%o7,	[%l7 + 0x08]
	mova	%xcc,	%i0,	%l1
loop_111:
	nop
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x1f
	membar	#Sync
	tleu	%icc,	0x6
	fandnot2s	%f23,	%f28,	%f14
	fmovrde	%o3,	%f8,	%f4
	srax	%l2,	%i5,	%g6
	stx	%o1,	[%l7 + 0x50]
	fzero	%f26
	fbo,a	%fcc1,	loop_112
	and	%i1,	0x14CB,	%o5
	movrne	%i4,	%g2,	%o0
	ldd	[%l7 + 0x48],	%f16
loop_112:
	ta	%xcc,	0x7
	fpadd16	%f22,	%f30,	%f12
	sll	%l0,	%g5,	%i7
	tn	%xcc,	0x2
	mulscc	%o2,	0x14CB,	%i3
	fabsd	%f0,	%f30
	brgez,a	%o6,	loop_113
	nop
	setx	loop_114,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%o4,	0x0A,	%l5
	fmovdpos	%icc,	%f28,	%f15
loop_113:
	fmovdgu	%xcc,	%f16,	%f18
loop_114:
	tsubcctv	%g7,	0x19D2,	%g1
	brz	%l4,	loop_115
	fmovsneg	%icc,	%f10,	%f11
	fbuge,a	%fcc1,	loop_116
	addcc	%l6,	0x120F,	%g3
loop_115:
	array16	%i2,	%i6,	%l3
	fmovda	%icc,	%f23,	%f26
loop_116:
	movrgez	%g4,	0x0A8,	%o7
	subc	%i0,	0x1121,	%l1
	fpsub32s	%f3,	%f11,	%f27
	ba	%xcc,	loop_117
	fzero	%f14
	srlx	%o3,	%i5,	%l2
	pdist	%f8,	%f12,	%f24
loop_117:
	nop
	set	0x60, %o4
	std	%f18,	[%l7 + %o4]
	fbge	%fcc2,	loop_118
	alignaddrl	%o1,	%i1,	%g6
	edge32ln	%o5,	%g2,	%i4
	movrlz	%o0,	0x15D,	%l0
loop_118:
	ldsb	[%l7 + 0x3C],	%i7
	mulx	%g5,	0x0DFC,	%i3
	tn	%icc,	0x4
	popc	%o6,	%o4
	tvs	%xcc,	0x2
	fmovsleu	%xcc,	%f29,	%f13
	edge8l	%o2,	%l5,	%g1
	ld	[%l7 + 0x5C],	%f2
	edge16l	%g7,	%l4,	%g3
	fble	%fcc3,	loop_119
	siam	0x5
	bvc,pt	%icc,	loop_120
	tle	%icc,	0x3
loop_119:
	nop
	wr	%g0,	0x89,	%asi
	stha	%i2,	[%l7 + 0x24] %asi
loop_120:
	brlz,a	%l6,	loop_121
	tleu	%xcc,	0x3
	brlez	%i6,	loop_122
	movne	%xcc,	%g4,	%o7
loop_121:
	array32	%l3,	%i0,	%o3
	tpos	%icc,	0x5
loop_122:
	tleu	%icc,	0x4
	fandnot1	%f26,	%f24,	%f22
	fcmpeq32	%f20,	%f24,	%l1
	addccc	%l2,	0x0CEB,	%i5
	lduw	[%l7 + 0x10],	%o1
	edge8n	%g6,	%i1,	%o5
	edge8	%i4,	%g2,	%l0
	brlez	%i7,	loop_123
	edge8n	%o0,	%i3,	%o6
	fmovdleu	%xcc,	%f13,	%f22
	fnor	%f26,	%f2,	%f30
loop_123:
	sir	0x03E8
	fmovrdlz	%g5,	%f20,	%f24
	fmuld8ulx16	%f12,	%f26,	%f30
	movn	%xcc,	%o4,	%l5
	array16	%o2,	%g7,	%l4
	orcc	%g3,	%i2,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i6,	0x02D,	%l6
	movl	%icc,	%g4,	%l3
	xnor	%i0,	0x1D9D,	%o7
	sdivcc	%l1,	0x0AF4,	%o3
	ldsh	[%l7 + 0x34],	%i5
	movge	%icc,	%o1,	%g6
	fbne	%fcc2,	loop_124
	array8	%i1,	%o5,	%i4
	tle	%icc,	0x1
	edge8	%g2,	%l0,	%l2
loop_124:
	bneg,a	loop_125
	andncc	%i7,	%o0,	%o6
	tne	%icc,	0x6
	sdiv	%g5,	0x0037,	%i3
loop_125:
	nop
	setx loop_126, %l0, %l1
	jmpl %l1, %l5
	sra	%o4,	%o2,	%l4
	edge8ln	%g3,	%i2,	%g7
	edge16	%g1,	%i6,	%g4
loop_126:
	fbn,a	%fcc1,	loop_127
	movn	%xcc,	%l6,	%i0
	xor	%l3,	0x11B2,	%l1
	wr	%g0,	0x81,	%asi
	sta	%f2,	[%l7 + 0x2C] %asi
loop_127:
	fxnor	%f10,	%f30,	%f4
	edge16n	%o7,	%i5,	%o1
	edge16l	%o3,	%g6,	%o5
	fmovs	%f22,	%f27
	set	0x4E, %o5
	stha	%i1,	[%l7 + %o5] 0x19
	te	%icc,	0x1
	tl	%xcc,	0x0
	ba,pt	%xcc,	loop_128
	subccc	%i4,	%l0,	%g2
	membar	0x11
	tvs	%xcc,	0x7
loop_128:
	fpsub32s	%f2,	%f22,	%f8
	add	%l2,	0x0ABC,	%i7
	fornot2	%f26,	%f4,	%f4
	andn	%o6,	0x16BC,	%g5
	fmovsvs	%icc,	%f31,	%f31
	fcmpes	%fcc0,	%f27,	%f22
	brnz	%i3,	loop_129
	andncc	%o0,	%o4,	%o2
	subcc	%l4,	%g3,	%l5
	fmul8x16al	%f3,	%f29,	%f10
loop_129:
	movleu	%icc,	%g7,	%g1
	edge8n	%i6,	%i2,	%g4
	ble,a,pn	%xcc,	loop_130
	andncc	%l6,	%l3,	%l1
	stw	%o7,	[%l7 + 0x14]
	fpack16	%f4,	%f7
loop_130:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x4
	srl	%i5,	%i0,	%o1
	edge8	%o3,	%g6,	%i1
	smulcc	%o5,	%l0,	%g2
	movcs	%xcc,	%i4,	%i7
	xorcc	%o6,	%l2,	%g5
	tsubcctv	%i3,	0x0DF3,	%o0
	sdiv	%o4,	0x1F01,	%o2
	fmovscs	%icc,	%f22,	%f25
	tsubcctv	%l4,	%l5,	%g7
	tgu	%icc,	0x5
	bge	loop_131
	prefetch	[%l7 + 0x74],	 0x0
	xorcc	%g3,	%g1,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_131:
	fmul8x16au	%f8,	%f27,	%f12
	sth	%g4,	[%l7 + 0x0E]
	edge8	%l6,	%i2,	%l1
	edge16ln	%l3,	%i5,	%i0
	set	0x45, %l6
	lduba	[%l7 + %l6] 0x80,	%o7
	sll	%o1,	%o3,	%i1
	tpos	%xcc,	0x6
	movpos	%xcc,	%o5,	%l0
	tcc	%icc,	0x7
	fbu	%fcc0,	loop_132
	tn	%icc,	0x7
	ldstub	[%l7 + 0x1A],	%g6
	andn	%g2,	%i4,	%i7
loop_132:
	udivx	%o6,	0x1FD0,	%g5
	fmovse	%xcc,	%f14,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pn	%icc,	loop_133
	stbar
	fba,a	%fcc2,	loop_134
	edge16n	%i3,	%l2,	%o0
loop_133:
	popc	0x0C0E,	%o2
	tsubcc	%o4,	0x19FC,	%l5
loop_134:
	nop
	set	0x5C, %i3
	lduwa	[%l7 + %i3] 0x89,	%l4
	sir	0x0CC5
	tleu	%icc,	0x7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%g1
	set	0x28, %i6
	lduwa	[%l7 + %i6] 0x15,	%g7
	stb	%i6,	[%l7 + 0x4A]
	array8	%l6,	%i2,	%l1
	fcmple16	%f8,	%f12,	%g4
	movne	%icc,	%i5,	%l3
	xnor	%i0,	0x0BA8,	%o1
	xnorcc	%o3,	%i1,	%o5
	fnor	%f24,	%f10,	%f8
	st	%f10,	[%l7 + 0x54]
	sdivcc	%l0,	0x1F19,	%g6
	movvc	%xcc,	%o7,	%g2
	or	%i4,	%o6,	%g5
	edge32ln	%i3,	%i7,	%o0
	orncc	%o2,	%o4,	%l2
	sethi	0x0533,	%l4
	srlx	%g3,	%g1,	%l5
	ldstub	[%l7 + 0x54],	%g7
	tsubcctv	%i6,	%l6,	%i2
	bn,pt	%icc,	loop_135
	movpos	%icc,	%g4,	%i5
	fmovscc	%icc,	%f12,	%f12
	fnot2s	%f18,	%f2
loop_135:
	tgu	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	stha	%l1,	[%l7 + 0x28] %asi
	te	%xcc,	0x4
	be	loop_136
	bge,a,pt	%icc,	loop_137
	fble	%fcc1,	loop_138
	edge32l	%i0,	%o1,	%l3
loop_136:
	movrgz	%i1,	0x39C,	%o3
loop_137:
	tcs	%icc,	0x6
loop_138:
	srlx	%l0,	%o5,	%o7
	edge16	%g6,	%i4,	%g2
	movrlez	%g5,	%i3,	%o6
	membar	0x71
	movcc	%icc,	%i7,	%o2
	movl	%xcc,	%o4,	%o0
	sllx	%l2,	%g3,	%g1
	wr	%g0,	0x52,	%asi
	stxa	%l4,	[%g0 + 0x108] %asi
	set	0x3C, %g5
	stha	%g7,	[%l7 + %g5] 0x2a
	membar	#Sync
	movleu	%xcc,	%l5,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i6,	%i2
	movcc	%xcc,	%i5,	%l1
	fmul8x16au	%f31,	%f25,	%f28
	fmovrdgez	%g4,	%f18,	%f26
	movleu	%xcc,	%i0,	%l3
	fnands	%f27,	%f11,	%f31
	fmovs	%f4,	%f2
	fmul8x16al	%f17,	%f28,	%f10
	fmovsleu	%xcc,	%f25,	%f8
	edge32	%o1,	%i1,	%l0
	tsubcctv	%o3,	0x00D9,	%o7
	tvs	%xcc,	0x5
	ble,a,pt	%xcc,	loop_139
	fnot2	%f4,	%f10
	sll	%o5,	%g6,	%i4
	subccc	%g2,	%i3,	%o6
loop_139:
	movrne	%i7,	0x313,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc2,	loop_140
	movrlez	%g5,	%o4,	%l2
	movrlez	%g3,	0x13F,	%o0
	add	%l4,	%g7,	%l5
loop_140:
	flush	%l7 + 0x44
	bg	loop_141
	mulx	%l6,	%i6,	%i2
	fbn	%fcc1,	loop_142
	fbg	%fcc3,	loop_143
loop_141:
	srlx	%g1,	0x02,	%l1
	alignaddrl	%g4,	%i0,	%l3
loop_142:
	fbule,a	%fcc1,	loop_144
loop_143:
	fsrc2s	%f1,	%f12
	brz	%o1,	loop_145
	fmovsa	%icc,	%f25,	%f27
loop_144:
	bpos,a,pt	%xcc,	loop_146
	fmovdge	%icc,	%f1,	%f30
loop_145:
	tsubcc	%i5,	%l0,	%o3
	movre	%o7,	0x149,	%o5
loop_146:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x67] %asi,	%g6
	sra	%i4,	0x00,	%i1
	bvs,pn	%icc,	loop_147
	sub	%i3,	%g2,	%i7
	edge16	%o2,	%g5,	%o6
	wr	%g0,	0x04,	%asi
	stxa	%l2,	[%l7 + 0x50] %asi
loop_147:
	smul	%o4,	0x16A6,	%o0
	tsubcc	%l4,	%g7,	%l5
	udivx	%l6,	0x1657,	%i6
	movne	%xcc,	%i2,	%g1
	smulcc	%g3,	0x15E8,	%l1
	sir	0x0DE2
	fandnot2	%f6,	%f22,	%f28
	movvs	%icc,	%i0,	%l3
	smul	%o1,	0x0F3C,	%i5
	srl	%l0,	0x08,	%g4
	movvc	%icc,	%o7,	%o5
	tne	%icc,	0x0
	andn	%g6,	0x110E,	%o3
	sllx	%i1,	%i3,	%i4
	umul	%i7,	%g2,	%g5
	fblg	%fcc1,	loop_148
	movrgz	%o6,	0x022,	%o2
	array16	%o4,	%o0,	%l4
	wr	%g0,	0x88,	%asi
	stha	%g7,	[%l7 + 0x42] %asi
loop_148:
	andn	%l5,	%l6,	%i6
	array8	%i2,	%g1,	%l2
	andcc	%g3,	%i0,	%l1
	movvs	%xcc,	%l3,	%i5
	prefetch	[%l7 + 0x54],	 0x0
	movge	%icc,	%l0,	%g4
	bvc,a	%xcc,	loop_149
	ldx	[%l7 + 0x08],	%o1
	ldx	[%l7 + 0x18],	%o7
	mulx	%g6,	0x1EA1,	%o5
loop_149:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%i3
	te	%icc,	0x7
	fands	%f16,	%f13,	%f25
	fxnors	%f27,	%f22,	%f3
	addcc	%i4,	%i7,	%g2
	fabss	%f23,	%f30
	fcmpes	%fcc2,	%f19,	%f11
	tne	%xcc,	0x6
	lduw	[%l7 + 0x14],	%g5
	nop
	set	0x48, %g2
	ldx	[%l7 + %g2],	%o6
	sdivx	%o3,	0x16A4,	%o4
	array8	%o0,	%o2,	%g7
	popc	%l4,	%l5
	sub	%l6,	0x0042,	%i2
	mulscc	%g1,	%i6,	%g3
	nop
	set	0x0E, %o3
	lduh	[%l7 + %o3],	%i0
	movn	%icc,	%l1,	%l2
	fbue	%fcc3,	loop_150
	movpos	%icc,	%i5,	%l0
	umulcc	%g4,	%o1,	%o7
	tg	%icc,	0x6
loop_150:
	move	%xcc,	%l3,	%g6
	movcc	%icc,	%o5,	%i3
	ldstub	[%l7 + 0x0F],	%i1
	fmovscc	%xcc,	%f27,	%f1
	tn	%icc,	0x6
	popc	%i4,	%g2
	sub	%g5,	%i7,	%o6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%o3
	orncc	%o0,	0x0004,	%o4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%g7
	popc	0x0B6E,	%l4
	fmovde	%icc,	%f22,	%f8
	fcmpd	%fcc2,	%f6,	%f4
	and	%l5,	0x0566,	%l6
	fba,a	%fcc2,	loop_151
	movgu	%xcc,	%i2,	%g1
	movne	%xcc,	%i6,	%i0
	fmovdle	%xcc,	%f8,	%f11
loop_151:
	fmovdcc	%xcc,	%f9,	%f19
	xorcc	%g3,	0x0592,	%l2
	orcc	%i5,	0x0801,	%l0
	fzeros	%f3
	stbar
	sll	%l1,	%o1,	%o7
	fmovs	%f18,	%f3
	tpos	%xcc,	0x4
	flush	%l7 + 0x24
	movle	%xcc,	%l3,	%g4
	edge16n	%o5,	%i3,	%i1
	tvs	%icc,	0x1
	movrne	%i4,	0x234,	%g6
	smulcc	%g5,	%g2,	%i7
	stw	%o3,	[%l7 + 0x44]
	sllx	%o0,	%o6,	%o4
	fmovrde	%g7,	%f6,	%f22
	edge32l	%l4,	%o2,	%l5
	pdist	%f20,	%f12,	%f18
	movge	%xcc,	%i2,	%l6
	movg	%xcc,	%g1,	%i6
	popc	%i0,	%g3
	tleu	%xcc,	0x1
	movneg	%icc,	%l2,	%l0
	edge16l	%i5,	%o1,	%o7
	fbe	%fcc1,	loop_152
	stb	%l3,	[%l7 + 0x50]
	tn	%xcc,	0x1
	call	loop_153
loop_152:
	fpadd32	%f22,	%f28,	%f26
	sra	%l1,	%o5,	%g4
	xor	%i3,	0x06BE,	%i1
loop_153:
	fxor	%f20,	%f28,	%f18
	umulcc	%i4,	0x1061,	%g6
	te	%xcc,	0x5
	fpadd32	%f18,	%f26,	%f20
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g2
	fmovsneg	%xcc,	%f15,	%f27
	bleu,a	loop_154
	fexpand	%f5,	%f14
	movpos	%xcc,	%g5,	%i7
	ldsh	[%l7 + 0x3C],	%o0
loop_154:
	fcmpgt32	%f30,	%f10,	%o6
	tleu	%xcc,	0x4
	edge16n	%o4,	%g7,	%l4
	movrgz	%o3,	%o2,	%l5
	lduh	[%l7 + 0x58],	%l6
	fabss	%f14,	%f5
	xor	%i2,	0x0DE4,	%i6
	fnands	%f13,	%f18,	%f4
	fzeros	%f18
	movpos	%xcc,	%i0,	%g1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l2
	set	0x5B, %g3
	lduba	[%l7 + %g3] 0x19,	%i5
	tneg	%icc,	0x7
	edge8ln	%o1,	%o7,	%l3
	fnegd	%f30,	%f8
	andncc	%l0,	%o5,	%l1
	fmovdne	%icc,	%f22,	%f15
	nop
	setx	loop_155,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x2
	srax	%i3,	%i1,	%i4
	popc	%g6,	%g2
loop_155:
	subccc	%g4,	%g5,	%i7
	fbl,a	%fcc0,	loop_156
	fbule,a	%fcc3,	loop_157
	fmovdcs	%icc,	%f18,	%f27
	sdivcc	%o6,	0x067C,	%o0
loop_156:
	fbuge	%fcc3,	loop_158
loop_157:
	fornot1	%f2,	%f24,	%f4
	nop
	setx	loop_159,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%o4,	%g7,	%l4
loop_158:
	movpos	%xcc,	%o3,	%l5
	fcmple32	%f0,	%f8,	%l6
loop_159:
	fblg	%fcc1,	loop_160
	sub	%i2,	%i6,	%i0
	fnors	%f18,	%f7,	%f6
	tl	%icc,	0x5
loop_160:
	prefetch	[%l7 + 0x50],	 0x3
	fmovdgu	%xcc,	%f31,	%f26
	stbar
	movvs	%icc,	%o2,	%g3
	srl	%l2,	%g1,	%i5
	stx	%o7,	[%l7 + 0x78]
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bgu,a,pn	%icc,	loop_161
	edge32	%l3,	%o1,	%o5
	udivcc	%l0,	0x10D5,	%i3
	fmovdneg	%icc,	%f12,	%f26
loop_161:
	movvs	%icc,	%i1,	%i4
	mova	%icc,	%l1,	%g2
	fabss	%f3,	%f12
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%g6
	fmul8x16al	%f30,	%f28,	%f18
	nop
	set	0x48, %i0
	std	%f22,	[%l7 + %i0]
	movrgz	%g5,	0x17D,	%i7
	addc	%g4,	0x1FD8,	%o0
	edge8	%o6,	%o4,	%g7
	fmovsleu	%icc,	%f15,	%f0
	edge16	%l4,	%o3,	%l5
	nop
	setx loop_162, %l0, %l1
	jmpl %l1, %l6
	movvs	%xcc,	%i2,	%i0
	addc	%i6,	0x13D1,	%g3
	fmovsl	%icc,	%f19,	%f9
loop_162:
	stb	%l2,	[%l7 + 0x65]
	array8	%g1,	%i5,	%o2
	orncc	%o7,	%l3,	%o5
	fandnot1	%f24,	%f30,	%f20
	fpmerge	%f1,	%f4,	%f22
	tsubcctv	%o1,	0x1ED1,	%i3
	move	%icc,	%i1,	%i4
	fmovsle	%xcc,	%f2,	%f26
	fbne,a	%fcc2,	loop_163
	siam	0x1
	umulcc	%l0,	%g2,	%l1
	sdiv	%g5,	0x165A,	%g6
loop_163:
	orn	%g4,	0x1B23,	%i7
	std	%o6,	[%l7 + 0x48]
	fmovdneg	%xcc,	%f21,	%f25
	nop
	setx	loop_164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%o4,	%o0,	%g7
	fpadd32	%f8,	%f28,	%f0
	tne	%icc,	0x2
loop_164:
	fzero	%f6
	brz,a	%o3,	loop_165
	fpackfix	%f18,	%f16
	set	0x14, %g4
	stwa	%l5,	[%l7 + %g4] 0xe2
	membar	#Sync
loop_165:
	fbo	%fcc3,	loop_166
	bcs,pt	%xcc,	loop_167
	lduw	[%l7 + 0x44],	%l6
	orncc	%l4,	0x0220,	%i2
loop_166:
	fnand	%f0,	%f24,	%f14
loop_167:
	andcc	%i6,	%i0,	%g3
	set	0x3E, %l1
	stha	%g1,	[%l7 + %l1] 0xe3
	membar	#Sync
	alignaddrl	%i5,	%l2,	%o7
	smul	%l3,	%o2,	%o5
	set	0x40, %l3
	stwa	%i3,	[%l7 + %l3] 0x18
	set	0x5A, %i1
	ldstuba	[%l7 + %i1] 0x18,	%i1
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x14] %asi
	sll	%o1,	%l0,	%i4
	srax	%l1,	0x13,	%g2
	fba,a	%fcc2,	loop_168
	xor	%g5,	%g4,	%i7
	udivx	%g6,	0x0B74,	%o4
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x0c,	%f16
loop_168:
	fmovdcs	%xcc,	%f14,	%f23
	fpsub16	%f30,	%f20,	%f12
	fxnors	%f14,	%f7,	%f1
	popc	%o0,	%o6
	smulcc	%o3,	0x195D,	%g7
	movrlez	%l6,	0x1D3,	%l4
	sdivcc	%l5,	0x022A,	%i6
	tpos	%xcc,	0x4
	udivcc	%i2,	0x1310,	%g3
	fpsub32s	%f1,	%f20,	%f27
	movrlz	%g1,	%i0,	%i5
	movpos	%icc,	%o7,	%l2
	movgu	%xcc,	%l3,	%o5
	umulcc	%i3,	%i1,	%o2
	movleu	%xcc,	%o1,	%i4
	stx	%l1,	[%l7 + 0x68]
	fmovrslz	%l0,	%f3,	%f10
	fandnot1s	%f18,	%f22,	%f22
	fnegd	%f28,	%f6
	orcc	%g5,	0x1482,	%g2
	bpos,a	%icc,	loop_169
	fmovdneg	%icc,	%f0,	%f18
	nop
	set	0x33, %o0
	ldstub	[%l7 + %o0],	%g4
	edge32l	%g6,	%o4,	%i7
loop_169:
	fmovrdlez	%o0,	%f6,	%f24
	fabss	%f7,	%f28
	tneg	%icc,	0x0
	fcmps	%fcc2,	%f29,	%f22
	fbuge	%fcc0,	loop_170
	addcc	%o3,	%o6,	%g7
	fpsub16	%f22,	%f20,	%f28
	mulscc	%l6,	0x1F71,	%l5
loop_170:
	mulscc	%l4,	%i2,	%i6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	sdiv	%i0,	0x16EA,	%g1
	addccc	%o7,	0x1F20,	%l2
	edge16l	%l3,	%i5,	%o5
	fabsd	%f22,	%f8
	flush	%l7 + 0x10
	subc	%i1,	0x027E,	%o2
	addccc	%o1,	%i4,	%i3
	fnot1s	%f21,	%f23
	xnorcc	%l0,	0x09E5,	%l1
	bn	loop_171
	array32	%g5,	%g4,	%g2
	orn	%o4,	%i7,	%o0
	fbule,a	%fcc0,	loop_172
loop_171:
	addc	%g6,	%o6,	%g7
	flush	%l7 + 0x0C
	fbug	%fcc0,	loop_173
loop_172:
	fmovdgu	%xcc,	%f16,	%f15
	fble	%fcc1,	loop_174
	fcmped	%fcc1,	%f28,	%f12
loop_173:
	prefetch	[%l7 + 0x24],	 0x0
	tle	%xcc,	0x0
loop_174:
	st	%f4,	[%l7 + 0x38]
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x19,	%o3
	xor	%l6,	%l5,	%l4
	mova	%xcc,	%i6,	%g3
	fnot1	%f28,	%f26
	fxnors	%f8,	%f23,	%f5
	te	%icc,	0x0
	udivx	%i0,	0x1468,	%i2
	xnor	%g1,	%o7,	%l2
	tg	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	stha	%l3,	[%l7 + 0x14] %asi
	fbn	%fcc1,	loop_175
	fones	%f9
	ba,pn	%icc,	loop_176
	movrlez	%i5,	0x35B,	%o5
loop_175:
	tl	%xcc,	0x1
	fxnor	%f22,	%f30,	%f16
loop_176:
	movrgz	%o2,	%i1,	%o1
	edge32	%i4,	%l0,	%l1
	movpos	%icc,	%i3,	%g4
	fsrc2	%f14,	%f12
	stx	%g5,	[%l7 + 0x20]
	ta	%xcc,	0x3
	fmovrdlez	%g2,	%f10,	%f6
	udivcc	%i7,	0x1F88,	%o4
	tsubcc	%g6,	0x07E0,	%o0
	tleu	%xcc,	0x1
	fsrc2s	%f15,	%f21
	xor	%o6,	0x07E5,	%o3
	fmovsvc	%xcc,	%f31,	%f3
	and	%l6,	0x1A8C,	%g7
	orcc	%l5,	%i6,	%g3
	srl	%i0,	%i2,	%g1
	subcc	%l4,	%l2,	%l3
	fbne	%fcc0,	loop_177
	sethi	0x0736,	%i5
	bneg,pn	%icc,	loop_178
	fnot1	%f2,	%f18
loop_177:
	orn	%o5,	%o2,	%i1
	array16	%o7,	%o1,	%l0
loop_178:
	tvc	%icc,	0x0
	udivcc	%i4,	0x18F4,	%i3
	ldsb	[%l7 + 0x27],	%l1
	subcc	%g5,	0x1DEF,	%g2
	fnot2	%f14,	%f8
	addc	%i7,	0x1E73,	%g4
	edge32	%o4,	%g6,	%o0
	tcs	%xcc,	0x3
	ld	[%l7 + 0x30],	%f22
	movn	%xcc,	%o3,	%l6
	tcs	%icc,	0x0
	stx	%g7,	[%l7 + 0x28]
	movgu	%xcc,	%o6,	%i6
	taddcctv	%l5,	%g3,	%i2
	bvs,a,pn	%icc,	loop_179
	movl	%icc,	%g1,	%l4
	fmovsge	%icc,	%f30,	%f22
	fmovsneg	%icc,	%f28,	%f3
loop_179:
	movcc	%xcc,	%i0,	%l2
	ldd	[%l7 + 0x38],	%f4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x19
	fcmpne16	%f20,	%f22,	%l3
	tpos	%icc,	0x4
	bleu	loop_180
	tl	%xcc,	0x3
	be,pn	%icc,	loop_181
	edge32l	%i5,	%o5,	%o2
loop_180:
	sth	%i1,	[%l7 + 0x36]
	fpadd32s	%f6,	%f23,	%f15
loop_181:
	srlx	%o7,	%l0,	%o1
	add	%i3,	0x0272,	%i4
	fcmpgt16	%f8,	%f28,	%l1
	fmovrdgz	%g5,	%f8,	%f2
	ba,a	%icc,	loop_182
	movneg	%xcc,	%g2,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o4,	%i7,	%o0
loop_182:
	bgu	%icc,	loop_183
	edge32ln	%o3,	%l6,	%g6
	movrlez	%o6,	0x138,	%i6
	tge	%xcc,	0x6
loop_183:
	addc	%g7,	0x1397,	%g3
	edge8l	%l5,	%g1,	%i2
	bl	%xcc,	loop_184
	fmuld8sux16	%f6,	%f17,	%f4
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x52] %asi,	%l4
loop_184:
	fornot1s	%f31,	%f18,	%f23
	array16	%i0,	%l2,	%l3
	tvs	%icc,	0x2
	sdivx	%o5,	0x04F3,	%i5
	fmovda	%icc,	%f29,	%f2
	xnor	%o2,	%o7,	%l0
	edge8ln	%i1,	%i3,	%o1
	movvs	%icc,	%l1,	%g5
	fmul8x16	%f13,	%f30,	%f24
	fmuld8sux16	%f6,	%f18,	%f8
	fxor	%f16,	%f6,	%f10
	fcmpne32	%f6,	%f24,	%i4
	fsrc2s	%f2,	%f27
	movneg	%icc,	%g2,	%o4
	movne	%xcc,	%i7,	%o0
	tl	%xcc,	0x3
	prefetch	[%l7 + 0x40],	 0x1
	andcc	%g4,	%l6,	%g6
	nop
	set	0x1A, %g6
	ldsh	[%l7 + %g6],	%o3
	sdivx	%o6,	0x00F4,	%i6
	bneg,a,pt	%icc,	loop_185
	sdivcc	%g7,	0x1730,	%l5
	subcc	%g3,	%i2,	%g1
	tg	%xcc,	0x4
loop_185:
	add	%i0,	0x1394,	%l4
	subc	%l3,	%l2,	%i5
	movrlez	%o2,	%o7,	%l0
	fcmpeq16	%f0,	%f4,	%i1
	sll	%o5,	%o1,	%i3
	movn	%xcc,	%l1,	%i4
	ld	[%l7 + 0x50],	%f5
	addccc	%g5,	%g2,	%o4
	srax	%o0,	0x05,	%g4
	movneg	%xcc,	%i7,	%l6
	tvc	%icc,	0x3
	fbge,a	%fcc2,	loop_186
	fnors	%f10,	%f17,	%f17
	andcc	%g6,	0x183E,	%o3
	tpos	%icc,	0x7
loop_186:
	edge16l	%i6,	%g7,	%l5
	fmovrslez	%o6,	%f24,	%f31
	fbue,a	%fcc1,	loop_187
	edge16	%i2,	%g3,	%i0
	andncc	%l4,	%g1,	%l3
	ldx	[%l7 + 0x10],	%i5
loop_187:
	popc	0x1004,	%l2
	xor	%o2,	0x0174,	%o7
	movn	%xcc,	%i1,	%l0
	bcc,a	loop_188
	add	%o5,	%i3,	%o1
	ble,a,pt	%icc,	loop_189
	membar	0x39
loop_188:
	fblg,a	%fcc0,	loop_190
	bvc,a,pt	%icc,	loop_191
loop_189:
	fmovsa	%icc,	%f8,	%f6
	brlz	%i4,	loop_192
loop_190:
	tvc	%xcc,	0x4
loop_191:
	movrgz	%g5,	0x288,	%g2
	membar	0x5E
loop_192:
	subccc	%l1,	%o0,	%o4
	fpack16	%f24,	%f25
	umulcc	%g4,	%l6,	%i7
	array8	%g6,	%i6,	%o3
	tcc	%icc,	0x1
	srax	%g7,	%l5,	%o6
	ldsb	[%l7 + 0x16],	%g3
	edge8l	%i2,	%l4,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l3,	%g1
	sra	%l2,	%i5,	%o2
	movre	%o7,	%l0,	%i1
	membar	0x74
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	alignaddrl	%i3,	%o1,	%i4
	udivcc	%o5,	0x1054,	%g5
	tcc	%xcc,	0x5
	ld	[%l7 + 0x10],	%f0
	and	%g2,	%o0,	%o4
	tl	%xcc,	0x7
	stb	%g4,	[%l7 + 0x17]
	xor	%l1,	0x14BB,	%l6
	fmovdneg	%icc,	%f6,	%f28
	movrne	%i7,	%g6,	%o3
	set	0x68, %l2
	stda	%g6,	[%l7 + %l2] 0x2b
	membar	#Sync
	edge8l	%l5,	%i6,	%g3
	tsubcc	%i2,	0x13CF,	%l4
	fnegd	%f4,	%f16
	movle	%xcc,	%i0,	%l3
	edge16ln	%g1,	%l2,	%i5
	tl	%xcc,	0x0
	subcc	%o6,	0x11E6,	%o2
	set	0x58, %g7
	stba	%l0,	[%l7 + %g7] 0x19
	set	0x76, %o7
	stha	%o7,	[%l7 + %o7] 0xea
	membar	#Sync
	fxors	%f5,	%f13,	%f29
	fmovsvc	%xcc,	%f22,	%f15
	set	0x5C, %i7
	ldswa	[%l7 + %i7] 0x80,	%i1
	lduh	[%l7 + 0x5A],	%o1
	movneg	%icc,	%i4,	%o5
	fsrc2	%f0,	%f18
	movcc	%xcc,	%i3,	%g2
	fcmped	%fcc3,	%f30,	%f18
	mulx	%o0,	0x032A,	%o4
	edge32	%g4,	%g5,	%l1
	fcmple32	%f12,	%f12,	%i7
	prefetch	[%l7 + 0x24],	 0x3
	fmuld8ulx16	%f23,	%f1,	%f8
	movcs	%xcc,	%l6,	%g6
	udiv	%o3,	0x0A0E,	%g7
	sll	%l5,	%g3,	%i6
	edge32l	%i2,	%l4,	%i0
	fbge,a	%fcc2,	loop_193
	movrne	%l3,	%l2,	%i5
	fexpand	%f3,	%f16
	orn	%g1,	0x065A,	%o6
loop_193:
	fmovscs	%icc,	%f15,	%f10
	fmovdvs	%xcc,	%f9,	%f17
	mulx	%o2,	%l0,	%i1
	nop
	setx loop_194, %l0, %l1
	jmpl %l1, %o7
	tgu	%xcc,	0x1
	fbu	%fcc0,	loop_195
	sdivcc	%i4,	0x067F,	%o5
loop_194:
	fmovdge	%icc,	%f17,	%f22
	fmovsvc	%xcc,	%f23,	%f13
loop_195:
	tgu	%icc,	0x6
	fbul,a	%fcc3,	loop_196
	movg	%xcc,	%o1,	%i3
	fmovdge	%icc,	%f9,	%f29
	edge32n	%g2,	%o0,	%o4
loop_196:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x7E] %asi,	%g5
	edge32	%g4,	%l1,	%l6
	edge8n	%i7,	%o3,	%g6
	edge16	%g7,	%g3,	%l5
	fmovdge	%icc,	%f8,	%f3
	tvc	%icc,	0x0
	fmovrdgez	%i2,	%f8,	%f16
	edge32	%l4,	%i0,	%i6
	sll	%l2,	0x14,	%l3
	movcc	%xcc,	%g1,	%i5
	alignaddr	%o2,	%l0,	%o6
	andn	%i1,	%i4,	%o7
	tn	%xcc,	0x7
	andncc	%o5,	%i3,	%g2
	movg	%xcc,	%o0,	%o1
	fnegd	%f30,	%f6
	subcc	%o4,	%g4,	%l1
	swap	[%l7 + 0x6C],	%l6
	umul	%i7,	%o3,	%g6
	udivcc	%g7,	0x0FE0,	%g5
	movcs	%icc,	%l5,	%g3
	movvs	%xcc,	%l4,	%i0
	xor	%i2,	%l2,	%l3
	fbul	%fcc0,	loop_197
	fpadd32s	%f13,	%f31,	%f17
	fone	%f2
	edge8n	%g1,	%i6,	%i5
loop_197:
	udivx	%o2,	0x0270,	%o6
	fcmpeq32	%f6,	%f22,	%i1
	fxnor	%f8,	%f12,	%f30
	fcmped	%fcc2,	%f4,	%f8
	fbne,a	%fcc0,	loop_198
	fmovrsgz	%l0,	%f28,	%f31
	ldub	[%l7 + 0x6D],	%i4
	srl	%o7,	%i3,	%g2
loop_198:
	nop
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xnorcc	%o0,	%o1,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x13
	movrlez	%o4,	0x3F0,	%l1
	movvs	%icc,	%l6,	%i7
	edge16	%o3,	%g6,	%g7
	fmovdne	%icc,	%f9,	%f12
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g4
	tge	%icc,	0x4
	movcs	%icc,	%l5,	%g5
	alignaddrl	%g3,	%l4,	%i2
	fcmpes	%fcc0,	%f4,	%f24
	srax	%l2,	0x0E,	%i0
	fmovdcs	%icc,	%f30,	%f20
	edge32l	%g1,	%i6,	%l3
	taddcc	%o2,	%o6,	%i1
	stw	%i5,	[%l7 + 0x7C]
	sdivx	%i4,	0x1DEF,	%l0
	fzero	%f12
	fzeros	%f4
	set	0x30, %i5
	lduwa	[%l7 + %i5] 0x04,	%i3
	edge32l	%o7,	%o0,	%g2
	sll	%o5,	0x16,	%o4
	brlz,a	%l1,	loop_199
	movge	%icc,	%l6,	%i7
	sllx	%o1,	%o3,	%g7
	set	0x74, %l5
	sta	%f18,	[%l7 + %l5] 0x89
loop_199:
	and	%g4,	%l5,	%g6
	fmovrsne	%g5,	%f23,	%f9
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%l4
	bn,pt	%icc,	loop_200
	tg	%xcc,	0x7
	andcc	%i2,	%i0,	%g1
	fmovdl	%icc,	%f17,	%f14
loop_200:
	tsubcctv	%l2,	0x0AC3,	%i6
	edge32ln	%l3,	%o2,	%i1
	edge8	%o6,	%i4,	%l0
	fmovsle	%icc,	%f22,	%f3
	movneg	%icc,	%i3,	%o7
	fsrc2	%f26,	%f4
	srax	%o0,	%g2,	%i5
	fmovrsgez	%o4,	%f7,	%f20
	fsrc2	%f0,	%f30
	fmovrdgz	%l1,	%f12,	%f16
	xor	%l6,	%i7,	%o5
	fmovspos	%icc,	%f7,	%f1
	ta	%icc,	0x0
	edge32l	%o3,	%g7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o1,	%l5
	edge32ln	%g6,	%g3,	%g5
	sir	0x10DF
	fcmpes	%fcc3,	%f5,	%f23
	movle	%xcc,	%l4,	%i0
	tn	%icc,	0x2
	edge8	%i2,	%g1,	%i6
	bne,a	loop_201
	movcs	%icc,	%l3,	%o2
	or	%i1,	%o6,	%i4
	umul	%l0,	0x1174,	%l2
loop_201:
	tsubcctv	%i3,	%o0,	%g2
	ldd	[%l7 + 0x08],	%o6
	fnot2	%f22,	%f22
	taddcctv	%i5,	%l1,	%l6
	nop
	setx loop_202, %l0, %l1
	jmpl %l1, %i7
	subcc	%o4,	%o5,	%g7
	tne	%xcc,	0x6
	taddcctv	%g4,	0x0033,	%o3
loop_202:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o1,	%g6,	%l5
	set	0x58, %o2
	ldstuba	[%l7 + %o2] 0x19,	%g5
	sra	%g3,	0x0E,	%l4
	subcc	%i2,	%g1,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i0,	0x1426,	%o2
	udivx	%l3,	0x0A2A,	%o6
	ta	%icc,	0x1
	sllx	%i1,	%l0,	%i4
	sir	0x0731
	umulcc	%i3,	0x026D,	%l2
	umulcc	%g2,	%o7,	%o0
	tge	%xcc,	0x3
	smulcc	%i5,	%l6,	%i7
	addccc	%o4,	%o5,	%l1
	edge32ln	%g7,	%o3,	%o1
	movne	%icc,	%g4,	%l5
	tle	%icc,	0x6
	fmul8sux16	%f24,	%f14,	%f16
	sth	%g6,	[%l7 + 0x38]
	srl	%g3,	%l4,	%i2
	smul	%g1,	0x17A6,	%i6
	set	0x0C, %o1
	sta	%f29,	[%l7 + %o1] 0x18
	edge16n	%i0,	%g5,	%o2
	xnor	%o6,	%i1,	%l0
	stb	%i4,	[%l7 + 0x57]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l3,	%l2,	%i3
	stw	%g2,	[%l7 + 0x18]
	movg	%icc,	%o0,	%o7
	orncc	%i5,	0x134D,	%i7
	movvc	%xcc,	%o4,	%o5
	fnot1s	%f1,	%f7
	fmovsg	%xcc,	%f18,	%f12
	fmovde	%xcc,	%f18,	%f30
	wr	%g0,	0x80,	%asi
	stda	%l0,	[%l7 + 0x70] %asi
	wr	%g0,	0x81,	%asi
	stxa	%l6,	[%l7 + 0x08] %asi
	subcc	%g7,	%o3,	%g4
	bgu,a,pt	%xcc,	loop_203
	array32	%o1,	%g6,	%l5
	fcmpgt32	%f12,	%f4,	%l4
	sll	%i2,	0x07,	%g1
loop_203:
	nop
	set	0x78, %o6
	std	%f10,	[%l7 + %o6]
	tn	%xcc,	0x7
	fmovsl	%icc,	%f23,	%f29
	fcmpeq32	%f22,	%f28,	%i6
	bvs,pt	%xcc,	loop_204
	movpos	%xcc,	%g3,	%i0
	swap	[%l7 + 0x48],	%o2
	bgu,a	loop_205
loop_204:
	addccc	%g5,	0x10BF,	%o6
	movn	%icc,	%i1,	%i4
	movrgez	%l3,	0x1F0,	%l0
loop_205:
	ldsb	[%l7 + 0x7C],	%i3
	fbn	%fcc3,	loop_206
	fmovdne	%xcc,	%f10,	%f23
	fnors	%f27,	%f7,	%f31
	tl	%xcc,	0x6
loop_206:
	tl	%icc,	0x7
	std	%f28,	[%l7 + 0x70]
	fmovrse	%g2,	%f11,	%f23
	fandnot2s	%f20,	%f12,	%f25
	fabsd	%f28,	%f18
	srlx	%o0,	0x11,	%l2
	xor	%i5,	0x1003,	%o7
	movl	%xcc,	%o4,	%o5
	movvc	%icc,	%l1,	%l6
	fmovrslez	%i7,	%f25,	%f30
	sra	%o3,	0x02,	%g7
	sra	%o1,	0x0D,	%g6
	and	%g4,	0x1A52,	%l5
	fandnot2s	%f20,	%f10,	%f9
	edge8ln	%l4,	%g1,	%i6
	movgu	%icc,	%i2,	%i0
	srl	%g3,	0x19,	%g5
	add	%o6,	%i1,	%o2
	membar	0x65
	fpadd16s	%f26,	%f6,	%f20
	te	%icc,	0x2
	udiv	%i4,	0x1DBB,	%l3
	addccc	%l0,	0x194C,	%i3
	andcc	%g2,	%l2,	%o0
	fmovrdlez	%o7,	%f20,	%f18
	movg	%xcc,	%o4,	%o5
	set	0x1A, %i2
	ldsba	[%l7 + %i2] 0x88,	%i5
	array32	%l6,	%l1,	%o3
	sll	%i7,	%o1,	%g6
	srl	%g7,	%l5,	%l4
	movn	%icc,	%g1,	%i6
	fxnors	%f20,	%f13,	%f4
	movgu	%icc,	%g4,	%i2
	wr	%g0,	0x19,	%asi
	sta	%f25,	[%l7 + 0x60] %asi
	set	0x53, %o4
	ldsba	[%l7 + %o4] 0x15,	%g3
	fcmpes	%fcc2,	%f31,	%f27
	fcmpgt32	%f4,	%f20,	%g5
	fmovsn	%icc,	%f21,	%f4
	fandnot2	%f12,	%f30,	%f2
	fsrc2s	%f12,	%f29
	addc	%i0,	%i1,	%o2
	smulcc	%o6,	0x04F0,	%l3
	movneg	%icc,	%l0,	%i4
	orcc	%i3,	0x0967,	%g2
	ldub	[%l7 + 0x49],	%o0
	or	%l2,	0x1B94,	%o4
	fmovdneg	%icc,	%f14,	%f30
	bshuffle	%f18,	%f10,	%f26
	xorcc	%o7,	0x1ACD,	%i5
	movvs	%icc,	%l6,	%l1
	sll	%o3,	%i7,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o1,	%g6,	%g7
	edge16ln	%l5,	%g1,	%i6
	smul	%g4,	0x0B85,	%l4
	fzeros	%f6
	fmovrse	%g3,	%f22,	%f13
	brnz,a	%i2,	loop_207
	movre	%g5,	0x19B,	%i1
	fpack32	%f24,	%f2,	%f6
	smulcc	%o2,	0x1489,	%i0
loop_207:
	subc	%o6,	%l3,	%i4
	smul	%i3,	%l0,	%g2
	nop
	set	0x54, %g1
	stw	%o0,	[%l7 + %g1]
	set	0x48, %o5
	stxa	%l2,	[%l7 + %o5] 0xe2
	membar	#Sync
	movrlz	%o4,	%o7,	%l6
	te	%xcc,	0x3
	nop
	setx	loop_208,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_209,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduw	[%l7 + 0x50],	%l1
	fmul8x16au	%f10,	%f8,	%f26
loop_208:
	addccc	%i5,	%i7,	%o5
loop_209:
	edge16n	%o3,	%g6,	%o1
	sdivx	%g7,	0x19A8,	%g1
	nop
	setx loop_210, %l0, %l1
	jmpl %l1, %l5
	fbu	%fcc2,	loop_211
	fzeros	%f15
	stw	%g4,	[%l7 + 0x5C]
loop_210:
	alignaddrl	%i6,	%l4,	%i2
loop_211:
	faligndata	%f18,	%f0,	%f14
	tgu	%xcc,	0x3
	andncc	%g5,	%g3,	%o2
	orcc	%i1,	0x0695,	%o6
	umulcc	%l3,	0x0C5E,	%i0
	movrgz	%i3,	0x29D,	%i4
	addc	%l0,	0x1F72,	%g2
	sll	%l2,	0x16,	%o4
	fpsub16s	%f5,	%f12,	%f4
	fmovs	%f23,	%f10
	fcmps	%fcc2,	%f0,	%f10
	fpadd32	%f24,	%f20,	%f18
	fcmple16	%f28,	%f28,	%o7
	fzeros	%f26
	edge16l	%o0,	%l1,	%i5
	bl,a	%icc,	loop_212
	std	%f14,	[%l7 + 0x20]
	alignaddr	%l6,	%o5,	%o3
	fones	%f30
loop_212:
	movrgz	%g6,	0x293,	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%g1
	set	0x0C, %l6
	stba	%g7,	[%l7 + %l6] 0xe3
	membar	#Sync
	fmovdneg	%xcc,	%f18,	%f23
	movcs	%xcc,	%l5,	%i6
	fmovrslez	%l4,	%f21,	%f7
	edge8ln	%i2,	%g5,	%g3
	andn	%g4,	0x01CE,	%o2
	tl	%icc,	0x5
	set	0x48, %i3
	ldswa	[%l7 + %i3] 0x14,	%i1
	fsrc1	%f30,	%f30
	set	0x6A, %g5
	lduha	[%l7 + %g5] 0x89,	%l3
	sdivx	%o6,	0x1AFE,	%i0
	wr	%g0,	0xea,	%asi
	stba	%i4,	[%l7 + 0x75] %asi
	membar	#Sync
	set	0x64, %i6
	ldswa	[%l7 + %i6] 0x0c,	%i3
	edge8l	%l0,	%l2,	%g2
	nop
	setx	loop_213,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%o4,	%o7,	%l1
	edge16n	%o0,	%l6,	%o5
	xnor	%o3,	%g6,	%i7
loop_213:
	edge16n	%o1,	%i5,	%g7
	xor	%g1,	%l5,	%i6
	ba,a	loop_214
	tsubcc	%l4,	%g5,	%g3
	smul	%i2,	%g4,	%i1
	tcs	%xcc,	0x3
loop_214:
	mulx	%l3,	%o2,	%o6
	movneg	%icc,	%i4,	%i3
	sdiv	%l0,	0x0FE5,	%l2
	nop
	set	0x6E, %g2
	lduh	[%l7 + %g2],	%i0
	edge16l	%o4,	%o7,	%g2
	fmovdn	%xcc,	%f5,	%f3
	fmovdl	%xcc,	%f17,	%f30
	ba	%xcc,	loop_215
	fmovrdgz	%o0,	%f20,	%f28
	fbe,a	%fcc1,	loop_216
	orncc	%l6,	%l1,	%o5
loop_215:
	movre	%g6,	%i7,	%o3
	array16	%i5,	%g7,	%o1
loop_216:
	movrne	%l5,	0x159,	%i6
	movle	%icc,	%l4,	%g1
	sdivx	%g5,	0x0DA8,	%i2
	fmovsa	%xcc,	%f23,	%f18
	fmovsn	%xcc,	%f24,	%f14
	set	0x48, %o3
	lduwa	[%l7 + %o3] 0x19,	%g3
	bl,a,pn	%icc,	loop_217
	umul	%g4,	0x02AC,	%l3
	call	loop_218
	tl	%xcc,	0x5
loop_217:
	flush	%l7 + 0x24
	tvc	%xcc,	0x0
loop_218:
	tleu	%icc,	0x3
	sth	%o2,	[%l7 + 0x78]
	movge	%xcc,	%o6,	%i4
	fmovsge	%xcc,	%f14,	%f22
	fsrc2	%f20,	%f10
	mulscc	%i1,	%i3,	%l2
	umulcc	%i0,	%l0,	%o7
	fpadd32s	%f11,	%f27,	%f19
	fbug	%fcc2,	loop_219
	array8	%o4,	%g2,	%l6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x0c,	%f0
loop_219:
	and	%o0,	0x0DDB,	%l1
	tcc	%icc,	0x5
	fcmped	%fcc0,	%f0,	%f4
	edge32n	%o5,	%i7,	%o3
	tcc	%xcc,	0x5
	nop
	set	0x08, %i0
	ldstub	[%l7 + %i0],	%i5
	fsrc2s	%f13,	%f27
	fmuld8ulx16	%f25,	%f23,	%f2
	fbge	%fcc3,	loop_220
	brlz,a	%g7,	loop_221
	movpos	%xcc,	%g6,	%o1
	fmovde	%xcc,	%f15,	%f4
loop_220:
	fbue,a	%fcc0,	loop_222
loop_221:
	subccc	%l5,	%i6,	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l4
loop_222:
	membar	0x6D
	addc	%g3,	0x12AA,	%i2
	udivcc	%g4,	0x1F52,	%o2
	movrgz	%l3,	0x1A3,	%o6
	andcc	%i1,	%i3,	%l2
	movrlez	%i4,	%l0,	%o7
	add	%o4,	0x0BA2,	%g2
	edge16ln	%l6,	%i0,	%o0
	tgu	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%o5
	tn	%icc,	0x0
	fpsub32s	%f23,	%f14,	%f20
	edge32l	%l1,	%o3,	%i7
	fmovrdlez	%g7,	%f20,	%f22
	fbuge,a	%fcc1,	loop_223
	fbuge	%fcc3,	loop_224
	movpos	%icc,	%g6,	%o1
	fabss	%f23,	%f28
loop_223:
	array32	%l5,	%i5,	%i6
loop_224:
	sll	%g1,	%l4,	%g3
	ta	%icc,	0x5
	fmul8sux16	%f16,	%f6,	%f14
	srlx	%g5,	%g4,	%i2
	bleu,a,pt	%xcc,	loop_225
	udivx	%o2,	0x1B3D,	%o6
	umulcc	%i1,	%i3,	%l3
	movvs	%icc,	%i4,	%l2
loop_225:
	andn	%o7,	0x04F1,	%o4
	tge	%icc,	0x4
	brz,a	%g2,	loop_226
	movg	%icc,	%l6,	%l0
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o0
loop_226:
	sdivcc	%i0,	0x0D7D,	%o5
	movrlz	%o3,	%l1,	%g7
	ldub	[%l7 + 0x73],	%g6
	udiv	%i7,	0x184B,	%l5
	nop
	setx	loop_227,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgez	%i5,	%i6,	%g1
	tge	%xcc,	0x5
	movcs	%icc,	%o1,	%g3
loop_227:
	fmovdg	%icc,	%f9,	%f1
	fnand	%f26,	%f4,	%f10
	bn,a,pt	%xcc,	loop_228
	fandnot2	%f2,	%f0,	%f14
	tl	%xcc,	0x3
	movl	%xcc,	%g5,	%l4
loop_228:
	alignaddr	%g4,	%o2,	%i2
	ldsh	[%l7 + 0x34],	%i1
	sdivcc	%i3,	0x11C4,	%l3
	stb	%i4,	[%l7 + 0x0C]
	srl	%l2,	0x01,	%o6
	bshuffle	%f20,	%f28,	%f28
	swap	[%l7 + 0x50],	%o7
	stw	%g2,	[%l7 + 0x54]
	sdivx	%o4,	0x0FFB,	%l6
	taddcctv	%l0,	%o0,	%i0
	xnorcc	%o5,	%l1,	%o3
	array8	%g6,	%i7,	%l5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%i5
	fmovdl	%icc,	%f7,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_229
	fbo	%fcc3,	loop_230
	bl,pn	%icc,	loop_231
	stw	%g1,	[%l7 + 0x48]
loop_229:
	sll	%i6,	%g3,	%g5
loop_230:
	and	%l4,	%g4,	%o2
loop_231:
	movrlez	%o1,	%i1,	%i2
	brgez,a	%l3,	loop_232
	fsrc1s	%f10,	%f5
	lduh	[%l7 + 0x12],	%i3
	fbg	%fcc0,	loop_233
loop_232:
	tge	%icc,	0x7
	fnor	%f18,	%f10,	%f12
	bneg,a,pt	%xcc,	loop_234
loop_233:
	fbule	%fcc3,	loop_235
	andcc	%l2,	%o6,	%i4
	tsubcc	%g2,	0x09AF,	%o4
loop_234:
	sra	%o7,	%l0,	%l6
loop_235:
	popc	0x06C5,	%o0
	fmovsne	%xcc,	%f3,	%f14
	bvc,a,pt	%icc,	loop_236
	smul	%o5,	0x029E,	%l1
	tne	%icc,	0x2
	tvc	%icc,	0x3
loop_236:
	alignaddr	%o3,	%g6,	%i0
	xor	%l5,	%g7,	%i7
	flush	%l7 + 0x54
	andcc	%g1,	0x0D2C,	%i6
	array8	%g3,	%i5,	%l4
	fpsub16	%f24,	%f24,	%f4
	xnorcc	%g5,	0x0EEF,	%g4
	fmovsleu	%icc,	%f26,	%f5
	stw	%o1,	[%l7 + 0x6C]
	movne	%xcc,	%i1,	%i2
	movgu	%icc,	%o2,	%i3
	movrlez	%l2,	%o6,	%i4
	orncc	%g2,	%l3,	%o4
	fmovrslz	%o7,	%f14,	%f1
	ble	loop_237
	movleu	%xcc,	%l6,	%o0
	array32	%o5,	%l1,	%o3
	movl	%icc,	%g6,	%l0
loop_237:
	array16	%i0,	%g7,	%i7
	xnorcc	%g1,	0x1308,	%i6
	addccc	%l5,	%g3,	%i5
	udivx	%l4,	0x0276,	%g4
	fmovsl	%icc,	%f23,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g5,	%o1,	%i1
	edge32n	%i2,	%o2,	%l2
	udivx	%i3,	0x1F3B,	%i4
	edge32	%g2,	%l3,	%o4
	te	%xcc,	0x7
	movpos	%icc,	%o7,	%o6
	tne	%xcc,	0x7
	andn	%l6,	%o0,	%o5
	umul	%l1,	0x1276,	%g6
	movneg	%icc,	%l0,	%o3
	st	%f26,	[%l7 + 0x6C]
	udivcc	%g7,	0x1548,	%i7
	mulscc	%i0,	0x0368,	%i6
	set	0x40, %g4
	lduha	[%l7 + %g4] 0x10,	%l5
	nop
	setx loop_238, %l0, %l1
	jmpl %l1, %g3
	edge32n	%g1,	%i5,	%l4
	te	%xcc,	0x3
	array32	%g4,	%g5,	%i1
loop_238:
	tg	%icc,	0x3
	mulx	%i2,	%o2,	%o1
	movgu	%xcc,	%i3,	%i4
	std	%g2,	[%l7 + 0x78]
	xnor	%l3,	0x021C,	%o4
	sdivx	%l2,	0x0526,	%o6
	stbar
	sir	0x1B73
	addcc	%l6,	0x1883,	%o0
	ldd	[%l7 + 0x60],	%o6
	xorcc	%l1,	%o5,	%g6
	subccc	%l0,	0x1364,	%o3
	fmovrslez	%i7,	%f29,	%f29
	fbe	%fcc1,	loop_239
	edge16	%i0,	%g7,	%i6
	fnands	%f28,	%f22,	%f12
	movle	%icc,	%l5,	%g1
loop_239:
	sll	%i5,	0x06,	%g3
	srax	%g4,	%l4,	%g5
	subc	%i1,	0x1CBA,	%o2
	fpsub16s	%f24,	%f2,	%f18
	addccc	%o1,	%i2,	%i4
	fnor	%f22,	%f14,	%f8
	tsubcctv	%g2,	0x1103,	%i3
	or	%l3,	0x17F5,	%o4
	fcmpne16	%f22,	%f6,	%o6
	fand	%f10,	%f28,	%f30
	flush	%l7 + 0x68
	fbul,a	%fcc3,	loop_240
	addccc	%l6,	%l2,	%o0
	orn	%l1,	%o5,	%g6
	smulcc	%l0,	%o7,	%i7
loop_240:
	fbe,a	%fcc1,	loop_241
	tneg	%icc,	0x5
	andncc	%i0,	%g7,	%o3
	fmul8x16	%f11,	%f10,	%f8
loop_241:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f22,	[%l7 + 0x18] %asi
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x18] %asi,	%i6
	movcc	%icc,	%l5,	%g1
	fmovrslez	%g3,	%f15,	%f26
	movpos	%icc,	%g4,	%l4
	tneg	%xcc,	0x0
	fmovs	%f4,	%f1
	std	%g4,	[%l7 + 0x48]
	xorcc	%i1,	0x084C,	%i5
	set	0x3C, %l3
	ldswa	[%l7 + %l3] 0x10,	%o1
	brlez,a	%o2,	loop_242
	tl	%xcc,	0x7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%i2
loop_242:
	fmovsge	%icc,	%f25,	%f17
	fbn,a	%fcc1,	loop_243
	fpadd32	%f28,	%f28,	%f12
	fbge	%fcc2,	loop_244
	tn	%xcc,	0x4
loop_243:
	te	%xcc,	0x7
	umul	%i3,	%g2,	%o4
loop_244:
	fnand	%f20,	%f4,	%f18
	andcc	%l3,	0x0055,	%l6
	nop
	set	0x5C, %l1
	ldsw	[%l7 + %l1],	%l2
	popc	0x08BD,	%o6
	movne	%icc,	%l1,	%o0
	fmovdpos	%icc,	%f4,	%f22
	sll	%g6,	0x0C,	%l0
	fmovse	%xcc,	%f15,	%f5
	movcs	%xcc,	%o5,	%i7
	brgz,a	%i0,	loop_245
	sdivcc	%o7,	0x1EBA,	%o3
	ble,pt	%xcc,	loop_246
	movgu	%icc,	%g7,	%l5
loop_245:
	fcmpgt32	%f2,	%f20,	%i6
	fpadd16	%f12,	%f20,	%f26
loop_246:
	brgz,a	%g1,	loop_247
	srl	%g4,	%g3,	%g5
	tvc	%xcc,	0x6
	bne,a	loop_248
loop_247:
	fnors	%f11,	%f8,	%f9
	tneg	%icc,	0x1
	mulx	%i1,	%l4,	%o1
loop_248:
	addcc	%o2,	0x01CA,	%i4
	edge16	%i5,	%i2,	%i3
	udivx	%o4,	0x12E4,	%g2
	fsrc2s	%f27,	%f24
	set	0x38, %i1
	lduwa	[%l7 + %i1] 0x04,	%l6
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%l3
	bneg	loop_249
	fmovdgu	%icc,	%f22,	%f21
	orcc	%l2,	%l1,	%o0
	xnorcc	%o6,	%l0,	%o5
loop_249:
	stx	%g6,	[%l7 + 0x60]
	andcc	%i7,	0x0623,	%i0
	addcc	%o3,	%g7,	%l5
	tleu	%icc,	0x1
	mova	%xcc,	%o7,	%g1
	movcs	%xcc,	%g4,	%i6
	edge16l	%g3,	%g5,	%i1
	lduw	[%l7 + 0x28],	%l4
	movrgz	%o2,	%o1,	%i5
	edge32	%i4,	%i3,	%i2
	smulcc	%g2,	0x1EC3,	%o4
	te	%icc,	0x6
	movgu	%icc,	%l6,	%l2
	tleu	%icc,	0x5
	fmovsne	%icc,	%f2,	%f4
	smul	%l1,	%o0,	%l3
	popc	%o6,	%o5
	edge16n	%g6,	%i7,	%l0
	fnot1	%f24,	%f4
	udiv	%i0,	0x1112,	%g7
	fmul8sux16	%f8,	%f10,	%f6
	nop
	setx	loop_250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmps	%fcc0,	%f20,	%f0
	fmovdpos	%icc,	%f29,	%f0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x58] %asi,	%f21
loop_250:
	brgz,a	%l5,	loop_251
	fnot1	%f30,	%f26
	andncc	%o3,	%o7,	%g1
	sll	%i6,	0x15,	%g3
loop_251:
	srax	%g5,	0x08,	%g4
	fmovdcc	%icc,	%f2,	%f28
	set	0x56, %o0
	stba	%i1,	[%l7 + %o0] 0xea
	membar	#Sync
	sub	%o2,	0x1963,	%l4
	movpos	%xcc,	%i5,	%i4
	movgu	%xcc,	%o1,	%i2
	orcc	%i3,	%g2,	%l6
	fcmpgt16	%f28,	%f28,	%o4
	tl	%icc,	0x4
	srl	%l1,	%o0,	%l2
	edge32l	%l3,	%o5,	%o6
	mova	%icc,	%g6,	%i7
	orcc	%l0,	0x17DE,	%i0
	srl	%g7,	%o3,	%l5
	fornot1s	%f22,	%f19,	%f10
	srax	%g1,	0x0C,	%i6
	fnor	%f6,	%f24,	%f10
	ldsb	[%l7 + 0x09],	%o7
	srax	%g5,	%g4,	%g3
	movrgz	%i1,	%o2,	%l4
	addccc	%i4,	0x1A60,	%i5
	sll	%i2,	%i3,	%g2
	udivx	%l6,	0x1AED,	%o4
	stx	%l1,	[%l7 + 0x20]
	sethi	0x12CD,	%o1
	std	%o0,	[%l7 + 0x18]
	fbne	%fcc1,	loop_252
	taddcctv	%l2,	%l3,	%o6
	movle	%xcc,	%g6,	%i7
	movcc	%xcc,	%o5,	%l0
loop_252:
	nop
	set	0x6A, %i4
	ldsb	[%l7 + %i4],	%g7
	fmuld8ulx16	%f0,	%f6,	%f14
	movle	%icc,	%o3,	%l5
	and	%i0,	%i6,	%o7
	std	%g4,	[%l7 + 0x70]
	nop
	set	0x70, %l0
	prefetch	[%l7 + %l0],	 0x1
	addcc	%g4,	%g3,	%g1
	fmovdn	%icc,	%f15,	%f18
	xnorcc	%i1,	%l4,	%o2
	tge	%icc,	0x2
	movgu	%icc,	%i4,	%i2
	fmovrde	%i3,	%f14,	%f0
	edge8l	%i5,	%l6,	%g2
	sdiv	%l1,	0x1C1F,	%o4
	set	0x3d8, %g6
	nop 	! 	stxa	%o1,	[%g0 + %g6] 0x40 ripped by fixASI40.pl
	array8	%o0,	%l2,	%l3
	and	%o6,	0x052E,	%g6
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge32ln	%o5,	%i7,	%l0
	andcc	%o3,	%g7,	%i0
	fmovdg	%xcc,	%f22,	%f5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g5,	%l5,	%g3
	fornot1	%f26,	%f0,	%f22
	tg	%xcc,	0x2
	udivx	%g4,	0x174B,	%i1
	swap	[%l7 + 0x54],	%g1
	edge32n	%l4,	%i4,	%i2
	fsrc2s	%f24,	%f5
	fornot1	%f20,	%f18,	%f10
	alignaddrl	%i3,	%i5,	%l6
	sethi	0x0F07,	%g2
	fbge,a	%fcc2,	loop_253
	andcc	%o2,	0x11AF,	%o4
	xnor	%l1,	0x1851,	%o1
	edge16n	%l2,	%l3,	%o0
loop_253:
	fmovdle	%xcc,	%f0,	%f3
	tl	%xcc,	0x0
	fsrc1	%f4,	%f12
	mova	%icc,	%g6,	%o6
	movle	%icc,	%o5,	%i7
	fornot2	%f4,	%f4,	%f22
	movgu	%icc,	%o3,	%g7
	sdiv	%i0,	0x1A49,	%l0
	umul	%o7,	0x034C,	%i6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%l5
	tpos	%xcc,	0x1
	bn,a	loop_254
	edge32l	%g3,	%g4,	%g5
	movvc	%icc,	%g1,	%i1
	sethi	0x0262,	%l4
loop_254:
	fmovdne	%xcc,	%f26,	%f21
	ble,pt	%xcc,	loop_255
	tcc	%icc,	0x6
	sll	%i2,	%i3,	%i5
	brnz,a	%i4,	loop_256
loop_255:
	fmovsl	%xcc,	%f20,	%f25
	addc	%g2,	%o2,	%l6
	movg	%icc,	%l1,	%o1
loop_256:
	fcmple32	%f18,	%f28,	%l2
	fnot1s	%f19,	%f14
	edge32ln	%l3,	%o4,	%g6
	or	%o6,	0x1639,	%o0
	sir	0x0EE0
	fmovdn	%icc,	%f27,	%f29
	taddcc	%i7,	%o5,	%g7
	tle	%icc,	0x2
	add	%i0,	%o3,	%l0
	edge32	%o7,	%i6,	%l5
	fbue,a	%fcc2,	loop_257
	movrgz	%g4,	%g5,	%g3
	fpsub32s	%f24,	%f2,	%f10
	array8	%g1,	%i1,	%l4
loop_257:
	membar	0x6C
	movge	%icc,	%i3,	%i2
	wr	%g0,	0x4f,	%asi
	stxa	%i4,	[%g0 + 0x18] %asi
	pdist	%f6,	%f6,	%f20
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x18,	%g2,	%o2
	edge16n	%i5,	%l6,	%l1
	movleu	%icc,	%o1,	%l3
	bvc,pt	%xcc,	loop_258
	edge16n	%o4,	%g6,	%o6
	fmovrse	%l2,	%f5,	%f31
	alignaddrl	%i7,	%o0,	%o5
loop_258:
	fbug	%fcc2,	loop_259
	movre	%g7,	0x32B,	%i0
	fbg	%fcc0,	loop_260
	ta	%icc,	0x1
loop_259:
	movcs	%xcc,	%l0,	%o3
	sethi	0x0C07,	%o7
loop_260:
	tcc	%xcc,	0x2
	edge16	%l5,	%g4,	%i6
	fmovsne	%xcc,	%f26,	%f17
	umul	%g3,	0x1BD0,	%g1
	movvs	%xcc,	%i1,	%g5
	fmovdcs	%icc,	%f11,	%f25
	movvs	%xcc,	%l4,	%i3
	tleu	%icc,	0x7
	movl	%icc,	%i2,	%i4
	fba	%fcc3,	loop_261
	fexpand	%f16,	%f2
	fnor	%f26,	%f24,	%f24
	addc	%g2,	%i5,	%o2
loop_261:
	mulx	%l6,	%o1,	%l3
	tgu	%icc,	0x4
	fbg,a	%fcc1,	loop_262
	subc	%o4,	0x1071,	%l1
	fxor	%f28,	%f6,	%f22
	or	%g6,	0x1FA1,	%l2
loop_262:
	movrlz	%i7,	%o6,	%o5
	fexpand	%f22,	%f10
	fnot2s	%f23,	%f0
	edge8l	%g7,	%i0,	%o0
	srl	%l0,	0x0C,	%o7
	set	0x5E, %l4
	ldsba	[%l7 + %l4] 0x0c,	%o3
	sdivcc	%g4,	0x12A0,	%i6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x62] %asi,	%l5
	array8	%g1,	%g3,	%g5
	taddcc	%i1,	0x0939,	%i3
	edge16	%l4,	%i4,	%i2
	movge	%icc,	%g2,	%o2
	srl	%i5,	%o1,	%l3
	movcs	%icc,	%o4,	%l1
	fcmps	%fcc2,	%f2,	%f2
	udivcc	%l6,	0x06C5,	%l2
	alignaddrl	%g6,	%i7,	%o6
	fmovrdgz	%o5,	%f20,	%f4
	edge16ln	%i0,	%g7,	%l0
	fmovrse	%o7,	%f8,	%f27
	movge	%icc,	%o3,	%g4
	fzeros	%f30
	fblg,a	%fcc1,	loop_263
	movre	%i6,	%o0,	%g1
	fmovrse	%g3,	%f5,	%f24
	ldsh	[%l7 + 0x36],	%g5
loop_263:
	bcs,pt	%xcc,	loop_264
	sethi	0x05A1,	%i1
	bpos,pt	%xcc,	loop_265
	fnot2	%f24,	%f18
loop_264:
	nop
	set	0x6C, %l2
	stha	%l5,	[%l7 + %l2] 0x19
loop_265:
	fnot1s	%f16,	%f2
	edge32l	%i3,	%l4,	%i4
	fmovsleu	%xcc,	%f6,	%f22
	fbge,a	%fcc2,	loop_266
	bl,pn	%icc,	loop_267
	umul	%g2,	%o2,	%i5
	andcc	%o1,	0x0EEC,	%l3
loop_266:
	movleu	%xcc,	%o4,	%l1
loop_267:
	fmovdgu	%xcc,	%f17,	%f0
	fmovsvs	%xcc,	%f1,	%f6
	pdist	%f0,	%f6,	%f22
	mulx	%i2,	%l2,	%g6
	ldd	[%l7 + 0x70],	%i6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x08] %asi,	%o6
	ldsh	[%l7 + 0x7C],	%i7
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf1
	membar	#Sync
	tne	%icc,	0x1
	tge	%icc,	0x0
	fmovscc	%icc,	%f18,	%f9
	fnot2	%f24,	%f22
	orncc	%i0,	%o5,	%l0
	bg	%icc,	loop_268
	udivx	%o7,	0x116C,	%g7
	fbge,a	%fcc1,	loop_269
	fmovrdne	%g4,	%f22,	%f22
loop_268:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc0,	loop_270
loop_269:
	orcc	%i6,	0x1B9F,	%o3
	xnor	%o0,	%g1,	%g5
	orcc	%g3,	%l5,	%i3
loop_270:
	movleu	%icc,	%l4,	%i4
	alignaddrl	%i1,	%o2,	%i5
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x15
	addccc	%o1,	0x0537,	%l3
	srax	%g2,	0x1D,	%l1
	add	%i2,	0x0438,	%l2
	movrlz	%g6,	%l6,	%o4
	tsubcc	%o6,	0x07C9,	%i0
	ldsw	[%l7 + 0x18],	%i7
	tleu	%xcc,	0x0
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bneg,pt	%xcc,	loop_271
	nop
	set	0x48, %g7
	prefetch	[%l7 + %g7],	 0x0
	movne	%icc,	%o5,	%l0
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x81,	 0x3
loop_271:
	fbl	%fcc1,	loop_272
	movcs	%icc,	%g4,	%i6
	popc	0x0457,	%g7
	movpos	%xcc,	%o0,	%g1
loop_272:
	movvc	%xcc,	%g5,	%o3
	edge16	%l5,	%i3,	%l4
	fmovdle	%xcc,	%f14,	%f13
	taddcc	%i4,	0x101F,	%g3
	smulcc	%o2,	0x1B5C,	%i5
	ldsb	[%l7 + 0x44],	%o1
	subc	%i1,	0x01FF,	%g2
	sdiv	%l3,	0x1B52,	%i2
	fabss	%f12,	%f26
	set	0x22, %i5
	ldsba	[%l7 + %i5] 0x89,	%l2
	alignaddrl	%l1,	%l6,	%o4
	orn	%o6,	%i0,	%i7
	fmovdneg	%xcc,	%f13,	%f19
	addc	%g6,	0x13AC,	%o5
	alignaddrl	%l0,	%o7,	%i6
	subcc	%g7,	%g4,	%g1
	movge	%xcc,	%g5,	%o3
	edge16n	%l5,	%o0,	%i3
	set	0x0C, %o2
	stba	%l4,	[%l7 + %o2] 0x27
	membar	#Sync
	bgu,a	loop_273
	move	%icc,	%i4,	%o2
	edge32l	%i5,	%o1,	%i1
	movne	%icc,	%g2,	%l3
loop_273:
	bneg,pn	%xcc,	loop_274
	lduw	[%l7 + 0x5C],	%g3
	smulcc	%i2,	0x095F,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_274:
	edge32l	%l1,	%l6,	%o4
	bn	%icc,	loop_275
	udivx	%i0,	0x03CA,	%o6
	te	%icc,	0x4
	fpack16	%f4,	%f19
loop_275:
	fbug	%fcc0,	loop_276
	fmovdne	%xcc,	%f10,	%f10
	edge8l	%g6,	%i7,	%o5
	ldsh	[%l7 + 0x62],	%o7
loop_276:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%i6
	fbu	%fcc3,	loop_277
	fbg	%fcc0,	loop_278
	fbule	%fcc2,	loop_279
	fnot1	%f20,	%f8
loop_277:
	taddcc	%g7,	0x15C2,	%g4
loop_278:
	ldsb	[%l7 + 0x1F],	%g1
loop_279:
	array32	%l0,	%g5,	%o3
	sir	0x0C94
	tgu	%xcc,	0x6
	fmovdg	%xcc,	%f4,	%f29
	alignaddrl	%o0,	%i3,	%l5
	bvc	loop_280
	tl	%icc,	0x5
	udivcc	%i4,	0x15CC,	%l4
	sll	%o2,	0x09,	%i5
loop_280:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x58] %asi,	%i1
	fcmped	%fcc1,	%f26,	%f0
	brnz	%g2,	loop_281
	ta	%icc,	0x6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x14,	%f16
loop_281:
	fmovs	%f25,	%f17
	alignaddr	%l3,	%o1,	%g3
	movneg	%xcc,	%l2,	%l1
	tneg	%icc,	0x7
	and	%i2,	%o4,	%i0
	fnors	%f22,	%f14,	%f15
	subccc	%l6,	0x19EF,	%o6
	fnot2s	%f15,	%f10
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x04,	 0x1
	stw	%o5,	[%l7 + 0x24]
	edge16ln	%g6,	%o7,	%g7
	fmovsvc	%icc,	%f13,	%f0
	fble,a	%fcc1,	loop_282
	nop
	setx	loop_283,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe	%fcc0,	loop_284
	sllx	%i6,	0x01,	%g4
loop_282:
	fxnor	%f24,	%f4,	%f26
loop_283:
	nop
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x1f,	%f0
loop_284:
	xnorcc	%l0,	0x0A41,	%g1
	addc	%o3,	%o0,	%i3
	ldsb	[%l7 + 0x40],	%l5
	movvs	%xcc,	%i4,	%g5
	fcmpeq16	%f2,	%f26,	%o2
	set	0x64, %o1
	ldsha	[%l7 + %o1] 0x0c,	%i5
	pdist	%f30,	%f4,	%f28
	fxors	%f5,	%f20,	%f21
	movrne	%l4,	0x363,	%g2
	movge	%xcc,	%l3,	%i1
	movleu	%xcc,	%g3,	%o1
	sllx	%l2,	0x0C,	%i2
	orn	%l1,	0x184E,	%i0
	taddcc	%o4,	%o6,	%i7
	add	%o5,	%g6,	%o7
	popc	%g7,	%i6
	andncc	%g4,	%l0,	%l6
	umul	%g1,	%o3,	%i3
	movneg	%xcc,	%o0,	%l5
	fnor	%f22,	%f0,	%f26
	tne	%icc,	0x5
	fpack32	%f4,	%f22,	%f10
	srlx	%g5,	%o2,	%i5
	array32	%i4,	%l4,	%l3
	subc	%i1,	0x1CFB,	%g3
	orcc	%g2,	%l2,	%o1
	tleu	%icc,	0x4
	fmovdvc	%xcc,	%f16,	%f25
	fbl	%fcc1,	loop_285
	edge16	%l1,	%i0,	%i2
	brgz	%o4,	loop_286
	faligndata	%f20,	%f28,	%f8
loop_285:
	fble	%fcc1,	loop_287
	fsrc2	%f8,	%f28
loop_286:
	fnands	%f13,	%f21,	%f29
	bn,pn	%icc,	loop_288
loop_287:
	movneg	%xcc,	%o6,	%o5
	orncc	%i7,	0x1DB9,	%g6
	bcc,a,pn	%icc,	loop_289
loop_288:
	fands	%f0,	%f13,	%f23
	bvc,a,pt	%xcc,	loop_290
	fornot2	%f30,	%f10,	%f22
loop_289:
	fbge,a	%fcc0,	loop_291
	fbne	%fcc3,	loop_292
loop_290:
	edge16n	%g7,	%i6,	%g4
	edge16ln	%l0,	%l6,	%g1
loop_291:
	fmovsvc	%icc,	%f25,	%f15
loop_292:
	bpos,pn	%icc,	loop_293
	fmovsl	%xcc,	%f20,	%f8
	faligndata	%f18,	%f0,	%f22
	alignaddrl	%o3,	%i3,	%o0
loop_293:
	mova	%icc,	%l5,	%o7
	udivcc	%g5,	0x19CE,	%o2
	fmovse	%xcc,	%f17,	%f24
	tle	%xcc,	0x3
	bg	%xcc,	loop_294
	for	%f28,	%f20,	%f16
	fxor	%f12,	%f20,	%f4
	fornot1s	%f5,	%f7,	%f29
loop_294:
	membar	0x63
	fmovdvs	%xcc,	%f23,	%f22
	tcs	%icc,	0x2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%i4
	udiv	%l4,	0x0F21,	%l3
	ba	loop_295
	srlx	%i1,	%g2,	%g3
	fmovrsgz	%o1,	%f19,	%f28
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x20] %asi,	%l1
loop_295:
	sdiv	%i0,	0x0F75,	%l2
	subcc	%i2,	%o6,	%o4
	fone	%f8
	xor	%o5,	%i7,	%g7
	fmovsg	%xcc,	%f15,	%f27
	set	0x1E, %o5
	stha	%g6,	[%l7 + %o5] 0x27
	membar	#Sync
	edge32n	%i6,	%g4,	%l6
	tleu	%icc,	0x7
	tle	%xcc,	0x3
	xorcc	%g1,	%l0,	%o3
	subcc	%i3,	%l5,	%o7
	sra	%o0,	0x13,	%g5
	mova	%xcc,	%i5,	%o2
	stb	%l4,	[%l7 + 0x6A]
	prefetch	[%l7 + 0x24],	 0x1
	fors	%f10,	%f16,	%f5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l3,	%i4
	array32	%g2,	%g3,	%o1
	edge32n	%l1,	%i1,	%l2
	stbar
	alignaddrl	%i0,	%i2,	%o6
	fmovdleu	%icc,	%f5,	%f20
	tcc	%icc,	0x4
	movle	%xcc,	%o4,	%i7
	movne	%icc,	%o5,	%g6
	edge8	%g7,	%i6,	%g4
	movge	%xcc,	%g1,	%l6
	fornot1	%f22,	%f22,	%f20
	popc	%l0,	%i3
	bgu,a,pn	%icc,	loop_296
	edge16l	%l5,	%o3,	%o0
	ldsw	[%l7 + 0x48],	%g5
	fmovdcc	%xcc,	%f0,	%f18
loop_296:
	fmovdvc	%xcc,	%f9,	%f23
	movrlez	%o7,	%i5,	%o2
	tcc	%xcc,	0x3
	fcmped	%fcc0,	%f26,	%f30
	call	loop_297
	fones	%f31
	mova	%xcc,	%l3,	%i4
	addcc	%l4,	%g3,	%o1
loop_297:
	or	%l1,	%i1,	%l2
	fpackfix	%f8,	%f2
	fbge,a	%fcc3,	loop_298
	ble,a,pt	%icc,	loop_299
	tsubcc	%i0,	%i2,	%o6
	move	%xcc,	%o4,	%g2
loop_298:
	nop
	set	0x7C, %g1
	stwa	%o5,	[%l7 + %g1] 0x2a
	membar	#Sync
loop_299:
	smulcc	%i7,	%g6,	%g7
	tvs	%xcc,	0x7
	fmovrde	%g4,	%f18,	%f16
	orn	%i6,	0x1E88,	%l6
	tn	%xcc,	0x4
	array16	%l0,	%g1,	%i3
	move	%xcc,	%o3,	%o0
	andn	%g5,	%l5,	%i5
	fnor	%f22,	%f6,	%f18
	movrgez	%o2,	0x0CC,	%l3
	fmuld8sux16	%f30,	%f11,	%f0
	movrlez	%i4,	0x325,	%o7
	movvc	%icc,	%l4,	%g3
	fmovrdgez	%l1,	%f26,	%f14
	movleu	%xcc,	%o1,	%i1
	stb	%i0,	[%l7 + 0x4B]
	bvc,a	%xcc,	loop_300
	sra	%l2,	%o6,	%i2
	add	%o4,	%o5,	%g2
	alignaddr	%i7,	%g7,	%g6
loop_300:
	fbule,a	%fcc1,	loop_301
	brlez	%i6,	loop_302
	fzero	%f30
	tleu	%icc,	0x6
loop_301:
	smulcc	%g4,	0x0D43,	%l6
loop_302:
	fxnors	%f3,	%f2,	%f1
	edge8ln	%g1,	%i3,	%l0
	bvs,pn	%icc,	loop_303
	tvs	%icc,	0x6
	fmovsneg	%xcc,	%f0,	%f21
	array8	%o3,	%o0,	%l5
loop_303:
	tgu	%xcc,	0x0
	fnors	%f7,	%f28,	%f8
	fbn,a	%fcc0,	loop_304
	movgu	%xcc,	%g5,	%i5
	tne	%icc,	0x4
	fmovrslez	%l3,	%f16,	%f0
loop_304:
	ldx	[%l7 + 0x30],	%i4
	movne	%icc,	%o2,	%l4
	fpack32	%f18,	%f16,	%f16
	fsrc2	%f4,	%f6
	mulx	%o7,	%g3,	%l1
	movcc	%icc,	%o1,	%i1
	tvc	%xcc,	0x5
	fornot1	%f2,	%f28,	%f24
	ldsw	[%l7 + 0x44],	%l2
	set	0x68, %i3
	stxa	%i0,	[%l7 + %i3] 0x80
	movleu	%icc,	%o6,	%i2
	orn	%o5,	%o4,	%g2
	xnor	%g7,	%g6,	%i6
	xorcc	%g4,	0x104B,	%l6
	fmovsleu	%icc,	%f6,	%f30
	ldx	[%l7 + 0x48],	%i7
	sdiv	%i3,	0x041E,	%l0
	taddcc	%o3,	0x1B29,	%g1
	fbe,a	%fcc3,	loop_305
	tge	%icc,	0x0
	andncc	%o0,	%g5,	%l5
	udivx	%l3,	0x1518,	%i4
loop_305:
	ldstub	[%l7 + 0x0D],	%o2
	orncc	%l4,	0x1557,	%i5
	movl	%xcc,	%o7,	%g3
	fmovrslz	%l1,	%f16,	%f25
	fbe	%fcc0,	loop_306
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x2
	ldd	[%l7 + 0x20],	%o0
loop_306:
	taddcc	%i1,	%i0,	%o6
	fmovdge	%icc,	%f24,	%f28
	movvs	%xcc,	%i2,	%l2
	fpsub16	%f20,	%f26,	%f12
	subc	%o5,	0x190B,	%g2
	xnor	%g7,	%o4,	%i6
	movre	%g4,	0x028,	%g6
	sir	0x12D3
	bneg,pt	%xcc,	loop_307
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
	movne	%icc,	%i7,	%l6
	sdiv	%l0,	0x1AB6,	%o3
loop_307:
	fnot2s	%f27,	%f19
loop_308:
	fnegd	%f30,	%f26
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x0c,	%i3,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f21,	%f16,	%f28
	fblg,a	%fcc1,	loop_309
	tcc	%icc,	0x6
	ldd	[%l7 + 0x08],	%f2
	sllx	%g1,	%l5,	%g5
loop_309:
	fcmpgt16	%f4,	%f0,	%l3
	bvs,a	%icc,	loop_310
	fmovsneg	%icc,	%f29,	%f6
	bgu,pn	%xcc,	loop_311
	fzero	%f8
loop_310:
	subcc	%o2,	%l4,	%i5
	array32	%o7,	%g3,	%i4
loop_311:
	taddcc	%o1,	0x1FE4,	%l1
	mova	%icc,	%i1,	%o6
	edge16	%i2,	%l2,	%i0
	brlz,a	%o5,	loop_312
	tge	%xcc,	0x1
	mulscc	%g2,	%g7,	%o4
	bneg	loop_313
loop_312:
	fbe	%fcc1,	loop_314
	edge16ln	%i6,	%g6,	%g4
	fbe	%fcc0,	loop_315
loop_313:
	tne	%xcc,	0x1
loop_314:
	fcmpgt32	%f4,	%f8,	%l6
	set	0x60, %l6
	lda	[%l7 + %l6] 0x14,	%f8
loop_315:
	addccc	%i7,	0x0FC7,	%o3
	fmovsge	%xcc,	%f12,	%f12
	tl	%icc,	0x5
	fcmpne32	%f10,	%f28,	%i3
	fbn	%fcc1,	loop_316
	sdiv	%l0,	0x0045,	%g1
	ldstub	[%l7 + 0x78],	%l5
	alignaddrl	%g5,	%l3,	%o2
loop_316:
	sethi	0x06F5,	%o0
	set	0x35, %g5
	ldsba	[%l7 + %g5] 0x10,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o7,	0x1A3,	%g3
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%l4
	brnz,a	%i4,	loop_317
	std	%f18,	[%l7 + 0x68]
	fcmpgt32	%f28,	%f8,	%l1
	tle	%icc,	0x5
loop_317:
	array8	%o1,	%o6,	%i2
	sra	%i1,	0x0E,	%l2
	fandnot1	%f28,	%f18,	%f2
	ble,pn	%xcc,	loop_318
	udiv	%i0,	0x1B41,	%o5
	sdiv	%g2,	0x0CC8,	%o4
	andcc	%g7,	%g6,	%g4
loop_318:
	bcc,a	%xcc,	loop_319
	smul	%l6,	%i6,	%i7
	tcc	%icc,	0x7
	set	0x1A, %i6
	stba	%o3,	[%l7 + %i6] 0x88
loop_319:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x7E] %asi,	%l0
	tpos	%xcc,	0x3
	movgu	%icc,	%i3,	%g1
	fbug	%fcc1,	loop_320
	andcc	%g5,	0x083F,	%l3
	movvc	%icc,	%l5,	%o2
	fbn	%fcc0,	loop_321
loop_320:
	orcc	%o0,	%i5,	%g3
	movg	%xcc,	%o7,	%l4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x80
loop_321:
	movle	%icc,	%i4,	%o1
	stx	%l1,	[%l7 + 0x50]
	fmovde	%xcc,	%f17,	%f19
	tleu	%icc,	0x5
	fmul8sux16	%f30,	%f16,	%f12
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i2,	%i1
	andn	%l2,	0x0794,	%o6
	sllx	%i0,	%g2,	%o5
	andncc	%g7,	%g6,	%g4
	sdivx	%o4,	0x1D1D,	%l6
	fpack32	%f20,	%f18,	%f26
	tne	%icc,	0x4
	fmovrdlz	%i7,	%f0,	%f22
	movrlez	%i6,	0x011,	%l0
	fba	%fcc0,	loop_322
	fbo	%fcc0,	loop_323
	st	%f26,	[%l7 + 0x40]
	movrlz	%o3,	%i3,	%g5
loop_322:
	fpsub32s	%f17,	%f10,	%f28
loop_323:
	fbul,a	%fcc0,	loop_324
	nop
	set	0x76, %g3
	ldsh	[%l7 + %g3],	%l3
	bne,a	%icc,	loop_325
	edge16	%g1,	%o2,	%o0
loop_324:
	ldsw	[%l7 + 0x6C],	%i5
	edge32n	%l5,	%g3,	%o7
loop_325:
	mulscc	%l4,	0x1F74,	%o1
	tsubcctv	%i4,	0x00AA,	%l1
	fpadd16	%f28,	%f20,	%f4
	tcs	%icc,	0x0
	movpos	%icc,	%i1,	%l2
	bshuffle	%f28,	%f6,	%f20
	movrlez	%i2,	%o6,	%g2
	prefetch	[%l7 + 0x70],	 0x3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%i0
	fxnor	%f30,	%f18,	%f22
	mova	%icc,	%g7,	%g6
	fmovrsgez	%o4,	%f0,	%f26
	movrlez	%g4,	%i7,	%l6
	tsubcc	%i6,	%l0,	%o3
	movrne	%g5,	0x3BD,	%i3
	orcc	%l3,	0x047A,	%o2
	fmovrdlz	%g1,	%f16,	%f6
	edge8n	%o0,	%i5,	%g3
	bvs	%icc,	loop_326
	fmovdn	%icc,	%f9,	%f21
	ldstub	[%l7 + 0x30],	%l5
	set	0x50, %i0
	swapa	[%l7 + %i0] 0x18,	%l4
loop_326:
	nop
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x88
	nop
	setx loop_327, %l0, %l1
	jmpl %l1, %o7
	move	%icc,	%i4,	%l1
	tcc	%xcc,	0x5
	mulx	%o1,	0x07AA,	%l2
loop_327:
	tleu	%xcc,	0x3
	array8	%i1,	%i2,	%g2
	ldd	[%l7 + 0x40],	%f26
	bvc,pt	%xcc,	loop_328
	bgu,pt	%icc,	loop_329
	mulscc	%o5,	%i0,	%o6
	udivx	%g7,	0x1465,	%g6
loop_328:
	fmul8x16al	%f1,	%f29,	%f30
loop_329:
	edge16ln	%g4,	%i7,	%l6
	fsrc2s	%f11,	%f4
	movle	%icc,	%i6,	%o4
	ble,a,pt	%xcc,	loop_330
	fornot1s	%f14,	%f4,	%f1
	fmovsn	%xcc,	%f19,	%f17
	fmovdvs	%icc,	%f1,	%f16
loop_330:
	orncc	%l0,	%o3,	%i3
	fbule	%fcc3,	loop_331
	edge16n	%l3,	%g5,	%g1
	fble,a	%fcc1,	loop_332
	fpmerge	%f10,	%f27,	%f24
loop_331:
	alignaddr	%o0,	%o2,	%i5
	lduh	[%l7 + 0x20],	%g3
loop_332:
	edge32n	%l5,	%o7,	%l4
	sll	%i4,	%l1,	%o1
	fmovdvc	%icc,	%f0,	%f31
	fpsub32s	%f2,	%f28,	%f19
	andcc	%i1,	0x0488,	%l2
	movrgz	%i2,	%g2,	%o5
	movvc	%xcc,	%i0,	%g7
	brz,a	%o6,	loop_333
	bpos,pt	%xcc,	loop_334
	fmovrdne	%g4,	%f18,	%f10
	fmovdgu	%icc,	%f20,	%f19
loop_333:
	flush	%l7 + 0x24
loop_334:
	popc	%i7,	%g6
	fpadd16	%f20,	%f6,	%f28
	sra	%l6,	0x17,	%o4
	fcmpeq32	%f10,	%f6,	%l0
	ldd	[%l7 + 0x10],	%o2
	fmovsvc	%xcc,	%f6,	%f11
	movpos	%icc,	%i3,	%i6
	wr	%g0,	0x80,	%asi
	stwa	%g5,	[%l7 + 0x4C] %asi
	fmul8sux16	%f20,	%f26,	%f22
	te	%xcc,	0x5
	set	0x6A, %g4
	lduba	[%l7 + %g4] 0x89,	%l3
	fbge	%fcc2,	loop_335
	movcs	%xcc,	%g1,	%o0
	tl	%xcc,	0x3
	edge8ln	%o2,	%g3,	%i5
loop_335:
	fmovrdgz	%o7,	%f16,	%f28
	movre	%l4,	%i4,	%l1
	std	%o0,	[%l7 + 0x58]
	fmuld8ulx16	%f29,	%f6,	%f2
	tvs	%xcc,	0x5
	tl	%icc,	0x3
	bpos,a	loop_336
	alignaddrl	%i1,	%l2,	%l5
	fornot2	%f6,	%f20,	%f22
	edge16n	%i2,	%o5,	%g2
loop_336:
	fbne	%fcc0,	loop_337
	fcmpne16	%f2,	%f26,	%i0
	ldsw	[%l7 + 0x38],	%g7
	mulx	%o6,	%i7,	%g6
loop_337:
	fbuge	%fcc0,	loop_338
	flush	%l7 + 0x1C
	ldub	[%l7 + 0x10],	%l6
	orncc	%o4,	%g4,	%o3
loop_338:
	nop
	set	0x2A, %l1
	stha	%i3,	[%l7 + %l1] 0xe3
	membar	#Sync
	sdiv	%i6,	0x14D7,	%g5
	fmovdge	%icc,	%f26,	%f2
	sdivx	%l0,	0x154D,	%l3
	fpsub32s	%f4,	%f4,	%f29
	udivx	%g1,	0x07A5,	%o2
	orcc	%g3,	0x160B,	%o0
	set	0x48, %i1
	lda	[%l7 + %i1] 0x18,	%f16
	taddcc	%i5,	0x0625,	%l4
	fmovdge	%icc,	%f1,	%f27
	tgu	%xcc,	0x2
	tvc	%xcc,	0x4
	sdivcc	%o7,	0x1F60,	%i4
	srlx	%l1,	0x1B,	%i1
	brgz	%l2,	loop_339
	ta	%xcc,	0x3
	fpsub16s	%f31,	%f5,	%f6
	tle	%icc,	0x5
loop_339:
	edge8	%l5,	%o1,	%i2
	fmovrdlez	%g2,	%f16,	%f4
	fcmped	%fcc2,	%f2,	%f16
	fcmpes	%fcc2,	%f0,	%f2
	orcc	%o5,	%i0,	%o6
	andn	%i7,	%g6,	%g7
	sllx	%l6,	%o4,	%o3
	tl	%icc,	0x1
	movcc	%xcc,	%i3,	%g4
	fpadd32	%f10,	%f24,	%f26
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvs	%icc,	0x3
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf8
	membar	#Sync
	fcmpgt32	%f30,	%f0,	%i6
	membar	0x1F
	orn	%l0,	0x108F,	%l3
	flush	%l7 + 0x60
	addc	%g1,	%g5,	%g3
	mulscc	%o2,	%i5,	%l4
	bcc	%icc,	loop_340
	movleu	%xcc,	%o0,	%i4
	edge16n	%l1,	%i1,	%l2
	tle	%icc,	0x1
loop_340:
	fmovsl	%xcc,	%f24,	%f25
	fones	%f11
	movvc	%xcc,	%l5,	%o7
	edge32l	%i2,	%g2,	%o1
	bneg,a	loop_341
	fmovsa	%icc,	%f1,	%f10
	stw	%i0,	[%l7 + 0x2C]
	fmovdl	%xcc,	%f30,	%f14
loop_341:
	fsrc1s	%f24,	%f9
	fone	%f22
	movle	%xcc,	%o6,	%i7
	fmovrsgz	%o5,	%f29,	%f6
	fsrc2s	%f10,	%f18
	set	0x0C, %l3
	ldsba	[%l7 + %l3] 0x15,	%g7
	movcs	%icc,	%g6,	%o4
	fornot1	%f2,	%f8,	%f2
	sll	%l6,	%i3,	%g4
	bn,a,pn	%xcc,	loop_342
	fones	%f10
	fmovsgu	%icc,	%f12,	%f10
	orcc	%i6,	%l0,	%o3
loop_342:
	nop
	setx loop_343, %l0, %l1
	jmpl %l1, %g1
	movg	%icc,	%l3,	%g5
	fmovrslez	%o2,	%f26,	%f15
	fcmpeq16	%f2,	%f22,	%i5
loop_343:
	fmovsneg	%xcc,	%f11,	%f18
	prefetch	[%l7 + 0x7C],	 0x1
	mova	%icc,	%g3,	%o0
	tg	%xcc,	0x1
	tn	%xcc,	0x3
	fmul8x16	%f11,	%f0,	%f18
	subcc	%l4,	0x0626,	%l1
	sub	%i4,	0x1758,	%i1
	fmovse	%xcc,	%f6,	%f18
	bcc,a,pt	%xcc,	loop_344
	move	%icc,	%l2,	%o7
	bcc	%xcc,	loop_345
	fabss	%f15,	%f25
loop_344:
	edge32	%l5,	%i2,	%o1
	fmovrsgz	%g2,	%f27,	%f26
loop_345:
	edge8l	%i0,	%o6,	%i7
	sll	%g7,	0x1B,	%o5
	edge8ln	%g6,	%l6,	%i3
	tg	%icc,	0x6
	call	loop_346
	fbl	%fcc3,	loop_347
	fbu	%fcc2,	loop_348
	edge32l	%o4,	%i6,	%l0
loop_346:
	sir	0x1C65
loop_347:
	fmovsne	%xcc,	%f8,	%f0
loop_348:
	brgz	%o3,	loop_349
	smul	%g1,	0x19F4,	%g4
	set	0x0C, %l0
	lduwa	[%l7 + %l0] 0x88,	%l3
loop_349:
	fmovrsne	%o2,	%f24,	%f28
	flush	%l7 + 0x20
	movle	%xcc,	%i5,	%g5
	movcs	%icc,	%g3,	%l4
	movgu	%icc,	%l1,	%i4
	bcc,a	loop_350
	andcc	%o0,	0x18AD,	%i1
	fpadd32	%f14,	%f6,	%f6
	fbuge,a	%fcc2,	loop_351
loop_350:
	brlz,a	%l2,	loop_352
	fnors	%f12,	%f6,	%f2
	st	%f25,	[%l7 + 0x0C]
loop_351:
	tleu	%icc,	0x1
loop_352:
	edge16	%l5,	%i2,	%o1
	std	%f10,	[%l7 + 0x70]
	edge32n	%o7,	%i0,	%g2
	fornot2	%f6,	%f8,	%f0
	array8	%o6,	%i7,	%o5
	fpmerge	%f29,	%f5,	%f26
	fmovsle	%icc,	%f0,	%f5
	tsubcctv	%g7,	0x0033,	%l6
	tcs	%xcc,	0x0
	movge	%icc,	%i3,	%o4
	edge16l	%i6,	%g6,	%o3
	movvs	%xcc,	%l0,	%g4
	xnor	%l3,	0x0577,	%g1
	orn	%o2,	%g5,	%i5
	ldx	[%l7 + 0x68],	%g3
	umul	%l4,	0x12E4,	%l1
	edge16	%o0,	%i4,	%l2
	ble,pt	%xcc,	loop_353
	fblg,a	%fcc1,	loop_354
	srlx	%i1,	0x10,	%l5
	bcs,a,pn	%xcc,	loop_355
loop_353:
	and	%i2,	%o1,	%o7
loop_354:
	andncc	%i0,	%g2,	%o6
	movvc	%xcc,	%o5,	%i7
loop_355:
	fmovdleu	%icc,	%f11,	%f5
	andncc	%g7,	%i3,	%l6
	fand	%f12,	%f16,	%f6
	fsrc1	%f10,	%f30
	sdivcc	%o4,	0x0CD1,	%i6
	fcmps	%fcc2,	%f14,	%f5
	movrlez	%o3,	0x062,	%l0
	fmovrdgz	%g4,	%f10,	%f30
	fnors	%f30,	%f14,	%f24
	edge16ln	%g6,	%g1,	%o2
	add	%l3,	0x181E,	%g5
	orncc	%i5,	%g3,	%l4
	edge32	%o0,	%l1,	%i4
	srlx	%l2,	%i1,	%i2
	be	%xcc,	loop_356
	movvs	%xcc,	%l5,	%o7
	fmovse	%icc,	%f8,	%f10
	movvs	%icc,	%i0,	%o1
loop_356:
	edge32ln	%o6,	%g2,	%i7
	udiv	%g7,	0x1BB0,	%i3
	ld	[%l7 + 0x30],	%f19
	addc	%l6,	0x09BE,	%o5
	tleu	%xcc,	0x7
	xor	%o4,	0x06ED,	%i6
	sdiv	%l0,	0x1804,	%g4
	edge32	%o3,	%g1,	%o2
	tn	%icc,	0x3
	tn	%icc,	0x6
	tleu	%xcc,	0x0
	fble,a	%fcc2,	loop_357
	bg,a	%xcc,	loop_358
	array8	%g6,	%g5,	%l3
	fpadd32s	%f15,	%f15,	%f7
loop_357:
	nop
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_358:
	fmovs	%f10,	%f12
	wr	%g0,	0x2b,	%asi
	stxa	%g3,	[%l7 + 0x10] %asi
	membar	#Sync
	movgu	%icc,	%l4,	%i5
	fmul8x16	%f29,	%f16,	%f16
	taddcctv	%l1,	0x1160,	%o0
	fbo	%fcc3,	loop_359
	edge32n	%i4,	%l2,	%i2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x08] %asi,	%i1
loop_359:
	andn	%o7,	%i0,	%o1
	mova	%xcc,	%o6,	%l5
	edge16ln	%g2,	%i7,	%g7
	sll	%i3,	0x16,	%l6
	nop
	setx loop_360, %l0, %l1
	jmpl %l1, %o5
	tneg	%icc,	0x6
	fmovscc	%xcc,	%f19,	%f5
	umul	%i6,	%o4,	%g4
loop_360:
	addccc	%o3,	0x199F,	%l0
	xnorcc	%g1,	0x04DC,	%o2
	orn	%g6,	0x16D2,	%g5
	tne	%xcc,	0x1
	sdiv	%l3,	0x04DE,	%l4
	fbe,a	%fcc0,	loop_361
	ldstub	[%l7 + 0x3B],	%g3
	ldstub	[%l7 + 0x13],	%l1
	umulcc	%o0,	%i4,	%l2
loop_361:
	sll	%i5,	%i1,	%i2
	edge32ln	%o7,	%i0,	%o1
	fornot1s	%f29,	%f28,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l5,	0x18C8,	%o6
	edge8	%g2,	%i7,	%g7
	edge16n	%l6,	%i3,	%o5
	tvc	%icc,	0x6
	edge32ln	%o4,	%i6,	%g4
	fxnor	%f2,	%f6,	%f20
	udivcc	%l0,	0x010B,	%g1
	addc	%o3,	%o2,	%g6
	smul	%l3,	0x01E5,	%l4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x19,	%g3,	%g5
	edge8	%l1,	%o0,	%l2
	smul	%i5,	0x105F,	%i1
	brnz	%i2,	loop_362
	udiv	%i4,	0x1CCF,	%i0
	fpsub32	%f8,	%f4,	%f4
	bneg,a,pt	%xcc,	loop_363
loop_362:
	ldd	[%l7 + 0x70],	%f26
	fpackfix	%f28,	%f9
	add	%o1,	0x1AC5,	%l5
loop_363:
	mulx	%o7,	0x1E90,	%g2
	orncc	%o6,	0x1DD0,	%g7
	tg	%xcc,	0x7
	and	%i7,	0x1F5F,	%i3
	sir	0x092C
	for	%f22,	%f22,	%f0
	set	0x30, %g6
	lduwa	[%l7 + %g6] 0x80,	%o5
	alignaddr	%l6,	%o4,	%g4
	movrne	%l0,	0x048,	%i6
	fmul8x16au	%f9,	%f25,	%f14
	fba,a	%fcc3,	loop_364
	movcc	%xcc,	%g1,	%o3
	set	0x64, %i4
	stha	%g6,	[%l7 + %i4] 0xe2
	membar	#Sync
loop_364:
	nop
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x18,	 0x2
	movl	%icc,	%l4,	%o2
	edge8n	%g5,	%g3,	%o0
	edge8ln	%l2,	%l1,	%i5
	taddcctv	%i1,	%i4,	%i0
	fmovs	%f23,	%f7
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6A] %asi,	%o1
	andncc	%i2,	%o7,	%l5
	bge,pn	%icc,	loop_365
	ldsb	[%l7 + 0x1E],	%g2
	fmul8sux16	%f2,	%f24,	%f28
	edge8n	%o6,	%g7,	%i7
loop_365:
	brnz,a	%i3,	loop_366
	fbul,a	%fcc2,	loop_367
	tneg	%icc,	0x5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o5
loop_366:
	fnot2s	%f26,	%f18
loop_367:
	tleu	%xcc,	0x2
	edge8n	%o4,	%g4,	%l0
	tpos	%icc,	0x3
	tne	%xcc,	0x3
	fmuld8sux16	%f24,	%f18,	%f10
	movneg	%icc,	%l6,	%g1
	fnand	%f26,	%f14,	%f20
	orcc	%o3,	0x0EA4,	%i6
	movrgez	%l3,	0x37A,	%g6
	edge8ln	%o2,	%l4,	%g5
	fmovsl	%xcc,	%f15,	%f10
	tsubcc	%g3,	%l2,	%l1
	umulcc	%o0,	%i5,	%i1
	umulcc	%i0,	%i4,	%i2
	tpos	%icc,	0x5
	fbg,a	%fcc1,	loop_368
	fpmerge	%f30,	%f31,	%f26
	array16	%o1,	%l5,	%o7
	movneg	%icc,	%g2,	%g7
loop_368:
	nop
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x14,	%f0
	fcmpne16	%f10,	%f28,	%i7
	fmovsn	%icc,	%f31,	%f3
	fcmped	%fcc2,	%f6,	%f4
	alignaddrl	%o6,	%o5,	%o4
	set	0x5C, %i7
	ldswa	[%l7 + %i7] 0x80,	%g4
	edge32l	%l0,	%l6,	%i3
	movvc	%xcc,	%o3,	%i6
	or	%g1,	0x02AA,	%g6
	fmovscc	%icc,	%f27,	%f26
	brgez,a	%o2,	loop_369
	std	%f16,	[%l7 + 0x68]
	edge16ln	%l3,	%l4,	%g3
	tne	%icc,	0x3
loop_369:
	brnz,a	%g5,	loop_370
	fmovsg	%icc,	%f7,	%f22
	edge32	%l2,	%l1,	%o0
	taddcc	%i5,	0x0224,	%i1
loop_370:
	st	%f2,	[%l7 + 0x14]
	xnor	%i4,	0x005D,	%i2
	mulscc	%o1,	0x1C9C,	%i0
	movcc	%xcc,	%l5,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g2,	%f2,	%f16
	tneg	%xcc,	0x7
	fmovdpos	%icc,	%f6,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x38] %asi,	%i7
	fmovrsgz	%o6,	%f3,	%f4
	movne	%xcc,	%o5,	%g7
	flush	%l7 + 0x2C
	fornot1s	%f28,	%f22,	%f15
	orcc	%o4,	%l0,	%l6
	movre	%i3,	%o3,	%g4
	movneg	%xcc,	%i6,	%g1
	brz	%g6,	loop_371
	udivx	%o2,	0x131B,	%l3
	ba,a,pn	%icc,	loop_372
	fones	%f25
loop_371:
	tneg	%icc,	0x1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%g5
loop_372:
	ldstub	[%l7 + 0x0B],	%g3
	fmovrdne	%l1,	%f14,	%f8
	alignaddrl	%o0,	%i5,	%l2
	bpos,a,pt	%icc,	loop_373
	tsubcctv	%i4,	%i2,	%i1
	fnand	%f8,	%f30,	%f20
	tneg	%icc,	0x2
loop_373:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i0,	%l5
	addcc	%o1,	%g2,	%i7
	fnand	%f26,	%f6,	%f16
	orcc	%o6,	0x029B,	%o5
	fpsub32s	%f30,	%f22,	%f21
	movrlez	%g7,	%o7,	%l0
	fsrc2	%f14,	%f4
	tg	%xcc,	0x2
	fbe	%fcc1,	loop_374
	srlx	%l6,	%o4,	%i3
	ldd	[%l7 + 0x10],	%f30
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x14] %asi,	%o3
loop_374:
	membar	0x1C
	smul	%g4,	0x17C1,	%i6
	andncc	%g6,	%g1,	%o2
	fandnot1	%f16,	%f8,	%f24
	fnand	%f16,	%f0,	%f10
	bne,pn	%xcc,	loop_375
	array32	%l3,	%g5,	%g3
	add	%l1,	%o0,	%i5
	tn	%xcc,	0x0
loop_375:
	stb	%l2,	[%l7 + 0x21]
	fpmerge	%f9,	%f7,	%f10
	bne,a	loop_376
	fbug	%fcc0,	loop_377
	tsubcc	%l4,	0x0DED,	%i4
	edge32n	%i2,	%i0,	%i1
loop_376:
	tvs	%icc,	0x0
loop_377:
	edge16	%o1,	%g2,	%i7
	fmovdgu	%xcc,	%f8,	%f27
	fbe,a	%fcc3,	loop_378
	srax	%l5,	%o5,	%g7
	bneg,a,pn	%xcc,	loop_379
	fmovdle	%xcc,	%f20,	%f31
loop_378:
	fpack16	%f20,	%f17
	andcc	%o7,	%o6,	%l0
loop_379:
	tn	%icc,	0x7
	prefetch	[%l7 + 0x78],	 0x0
	fcmpgt32	%f28,	%f6,	%l6
	edge32	%o4,	%o3,	%g4
	addccc	%i3,	%i6,	%g1
	tpos	%xcc,	0x1
	movneg	%xcc,	%g6,	%l3
	fbug,a	%fcc1,	loop_380
	tne	%xcc,	0x3
	bpos	%icc,	loop_381
	fmovrsgz	%g5,	%f27,	%f30
loop_380:
	fbu	%fcc0,	loop_382
	fmovdne	%xcc,	%f30,	%f15
loop_381:
	tne	%icc,	0x0
	mulscc	%o2,	%g3,	%l1
loop_382:
	edge8ln	%i5,	%l2,	%l4
	edge32	%i4,	%i2,	%i0
	orn	%i1,	%o0,	%o1
	fbne	%fcc1,	loop_383
	move	%xcc,	%i7,	%l5
	sdivcc	%o5,	0x1843,	%g2
	alignaddrl	%g7,	%o7,	%l0
loop_383:
	udivcc	%o6,	0x0749,	%l6
	fbge,a	%fcc3,	loop_384
	fbug	%fcc1,	loop_385
	nop
	set	0x10, %g7
	stw	%o4,	[%l7 + %g7]
	bge	%icc,	loop_386
loop_384:
	edge16l	%o3,	%i3,	%i6
loop_385:
	fabsd	%f16,	%f4
	fbul,a	%fcc3,	loop_387
loop_386:
	udiv	%g1,	0x1D52,	%g6
	tcc	%xcc,	0x0
	tn	%icc,	0x5
loop_387:
	fmovsvc	%xcc,	%f16,	%f30
	bshuffle	%f16,	%f18,	%f26
	fsrc1	%f20,	%f20
	subccc	%g4,	%l3,	%o2
	addcc	%g3,	0x0392,	%l1
	sllx	%g5,	%i5,	%l2
	alignaddr	%i4,	%i2,	%i0
	movcc	%xcc,	%l4,	%i1
	fnot1	%f6,	%f24
	fbu,a	%fcc1,	loop_388
	addccc	%o0,	%o1,	%l5
	orcc	%o5,	0x1A1D,	%i7
	orn	%g7,	0x0258,	%g2
loop_388:
	bcs	loop_389
	stbar
	movvc	%icc,	%l0,	%o6
	fnot2	%f26,	%f6
loop_389:
	mulscc	%o7,	%l6,	%o3
	srlx	%i3,	%o4,	%g1
	tcs	%icc,	0x0
	fnot2s	%f20,	%f18
	srlx	%i6,	%g6,	%l3
	fbuge	%fcc2,	loop_390
	edge16	%g4,	%g3,	%l1
	fbo,a	%fcc3,	loop_391
	tcs	%xcc,	0x7
loop_390:
	tgu	%icc,	0x3
	fbg,a	%fcc2,	loop_392
loop_391:
	ldx	[%l7 + 0x68],	%o2
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0x0
loop_392:
	fzeros	%f14
	fmovdpos	%icc,	%f6,	%f31
	array8	%l2,	%g5,	%i2
	fbue	%fcc2,	loop_393
	array8	%i4,	%i0,	%i1
	movpos	%icc,	%l4,	%o1
	fmovsne	%xcc,	%f9,	%f2
loop_393:
	addcc	%l5,	%o5,	%i7
	xnorcc	%o0,	0x1EDF,	%g7
	popc	0x1751,	%g2
	ldx	[%l7 + 0x38],	%o6
	movre	%l0,	0x34F,	%l6
	fnot1s	%f1,	%f8
	tcc	%icc,	0x7
	fmovrsne	%o3,	%f29,	%f0
	orncc	%i3,	%o7,	%o4
	fmovdleu	%xcc,	%f31,	%f8
	taddcc	%g1,	%g6,	%i6
	nop
	setx loop_394, %l0, %l1
	jmpl %l1, %l3
	tneg	%icc,	0x2
	edge16	%g3,	%g4,	%o2
	movvc	%xcc,	%i5,	%l1
loop_394:
	udivx	%g5,	0x099E,	%l2
	set	0x54, %i5
	lda	[%l7 + %i5] 0x81,	%f19
	brgz,a	%i2,	loop_395
	membar	0x42
	srlx	%i4,	%i0,	%l4
	tsubcctv	%i1,	0x0D24,	%o1
loop_395:
	umulcc	%o5,	0x11F1,	%i7
	movrlz	%l5,	%o0,	%g2
	tne	%xcc,	0x0
	umulcc	%g7,	0x0B57,	%l0
	fsrc1	%f22,	%f8
	fbl,a	%fcc1,	loop_396
	or	%l6,	%o6,	%o3
	fcmpes	%fcc1,	%f28,	%f22
	bl,pn	%xcc,	loop_397
loop_396:
	edge32ln	%o7,	%o4,	%g1
	movn	%icc,	%i3,	%g6
	fxnors	%f10,	%f15,	%f17
loop_397:
	fmovdvs	%icc,	%f25,	%f27
	nop
	set	0x60, %o2
	ldsh	[%l7 + %o2],	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g3,	0x153C,	%g4
	fmovrslez	%l3,	%f1,	%f0
	orn	%i5,	0x1C72,	%o2
	fmul8x16al	%f18,	%f5,	%f6
	umulcc	%l1,	%g5,	%i2
	tle	%xcc,	0x5
	fsrc2s	%f19,	%f11
	bcs,a,pn	%xcc,	loop_398
	movpos	%xcc,	%i4,	%i0
	sdivcc	%l4,	0x06EF,	%i1
	fmovscc	%icc,	%f24,	%f12
loop_398:
	movleu	%icc,	%o1,	%l2
	membar	0x66
	set	0x24, %l5
	ldswa	[%l7 + %l5] 0x04,	%o5
	tvs	%xcc,	0x6
	fxnor	%f4,	%f0,	%f2
	tneg	%xcc,	0x7
	umulcc	%i7,	0x107D,	%l5
	sdiv	%o0,	0x0BEC,	%g2
	tn	%xcc,	0x4
	fmul8ulx16	%f24,	%f28,	%f16
	fabsd	%f0,	%f18
	stbar
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	ta	%xcc,	0x4
	fcmple16	%f4,	%f8,	%l0
	tg	%icc,	0x2
	fcmpgt16	%f0,	%f30,	%g7
	movle	%icc,	%o6,	%o3
	edge8	%o7,	%l6,	%g1
	bgu,a	loop_399
	lduw	[%l7 + 0x28],	%o4
	edge16l	%g6,	%i3,	%i6
	alignaddrl	%g4,	%l3,	%g3
loop_399:
	fmovdleu	%icc,	%f21,	%f13
	brz,a	%o2,	loop_400
	fmovdcs	%xcc,	%f26,	%f7
	bvs,a	loop_401
	edge32l	%i5,	%g5,	%i2
loop_400:
	fbge	%fcc2,	loop_402
	movleu	%icc,	%i4,	%i0
loop_401:
	fnegs	%f19,	%f28
	fmovdge	%icc,	%f12,	%f21
loop_402:
	ldub	[%l7 + 0x71],	%l4
	set	0x178, %o6
	nop 	! 	nop 	! 	ldxa	[%g0 + %o6] 0x40,	%i1 ripped by fixASI40.pl ripped by fixASI40.pl
	array32	%o1,	%l2,	%l1
	bshuffle	%f16,	%f18,	%f6
	fexpand	%f8,	%f0
	movrlez	%i7,	0x1A2,	%l5
	mulx	%o5,	0x0976,	%o0
	orn	%g2,	%l0,	%o6
	bge,a	loop_403
	bg	loop_404
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%f6
	tsubcctv	%g7,	%o3,	%o7
loop_403:
	xnor	%g1,	0x0EA4,	%l6
loop_404:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o4,	0x1B84,	%i3
	addcc	%i6,	%g4,	%g6
	srlx	%l3,	0x1E,	%g3
	smul	%o2,	%i5,	%i2
	fbge	%fcc0,	loop_405
	bcs,a	loop_406
	edge32	%g5,	%i0,	%i4
	fmovdg	%xcc,	%f29,	%f25
loop_405:
	fmovrse	%i1,	%f8,	%f18
loop_406:
	bge,a,pt	%xcc,	loop_407
	fmovdg	%icc,	%f29,	%f18
	movcc	%xcc,	%o1,	%l2
	set	0x34, %o1
	lduha	[%l7 + %o1] 0x18,	%l4
loop_407:
	fmovsa	%xcc,	%f7,	%f23
	fbge,a	%fcc1,	loop_408
	subc	%i7,	0x1E75,	%l5
	array16	%l1,	%o5,	%o0
	bcs,pt	%xcc,	loop_409
loop_408:
	tne	%xcc,	0x5
	ta	%icc,	0x7
	edge8	%g2,	%l0,	%o6
loop_409:
	fcmpne32	%f4,	%f0,	%g7
	edge8l	%o3,	%o7,	%g1
	fmovrsgez	%o4,	%f10,	%f15
	movle	%xcc,	%l6,	%i3
	orncc	%g4,	0x08E1,	%i6
	mova	%icc,	%g6,	%l3
	tge	%icc,	0x6
	fzero	%f30
	te	%xcc,	0x7
	te	%icc,	0x3
	tpos	%xcc,	0x4
	siam	0x6
	movne	%icc,	%o2,	%i5
	st	%f27,	[%l7 + 0x74]
	orncc	%i2,	0x1DCA,	%g3
	membar	0x20
	fabsd	%f26,	%f20
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	srl	%i4,	%i0,	%i1
	edge16n	%l2,	%l4,	%o1
	set	0x34, %o5
	lda	[%l7 + %o5] 0x19,	%f6
	tsubcc	%l5,	%l1,	%o5
	movrgz	%i7,	0x260,	%o0
	andcc	%l0,	%g2,	%g7
	fmovdle	%icc,	%f31,	%f17
	sir	0x051F
	subccc	%o6,	%o3,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o4,	%l6,	%i3
	movrlez	%g4,	0x2CB,	%o7
	taddcc	%g6,	%i6,	%o2
	mova	%icc,	%l3,	%i2
	fmovse	%xcc,	%f17,	%f11
	fnand	%f10,	%f24,	%f16
	set	0x34, %o4
	ldswa	[%l7 + %o4] 0x0c,	%g3
	ldsw	[%l7 + 0x44],	%i5
	fpadd16	%f24,	%f24,	%f2
	alignaddrl	%i4,	%g5,	%i0
	move	%xcc,	%l2,	%l4
	srlx	%i1,	%o1,	%l1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x60] %asi,	%l5
	fmovrdgez	%o5,	%f24,	%f18
	tvc	%icc,	0x5
	edge8l	%o0,	%i7,	%g2
	subc	%l0,	%o6,	%o3
	tne	%icc,	0x5
	ldstub	[%l7 + 0x2D],	%g1
	sllx	%o4,	0x0E,	%g7
	movrgez	%i3,	%l6,	%o7
	umulcc	%g6,	%i6,	%o2
	udiv	%g4,	0x0310,	%i2
	nop
	setx loop_410, %l0, %l1
	jmpl %l1, %l3
	mova	%xcc,	%i5,	%g3
	ta	%icc,	0x1
	wr	%g0,	0x11,	%asi
	stda	%g4,	[%l7 + 0x48] %asi
loop_410:
	alignaddr	%i4,	%i0,	%l4
	tn	%xcc,	0x1
	xnor	%i1,	%l2,	%o1
	edge32l	%l1,	%l5,	%o5
	move	%xcc,	%i7,	%g2
	fnot1	%f16,	%f20
	wr	%g0,	0x89,	%asi
	stba	%l0,	[%l7 + 0x66] %asi
	fxors	%f13,	%f28,	%f5
	fmul8x16au	%f20,	%f27,	%f24
	tcs	%xcc,	0x2
	tpos	%xcc,	0x0
	ble	loop_411
	mulscc	%o0,	0x1A4D,	%o6
	movrne	%o3,	0x04A,	%g1
	movrlez	%g7,	%i3,	%l6
loop_411:
	or	%o4,	0x086E,	%g6
	std	%i6,	[%l7 + 0x58]
	fzero	%f12
	fxors	%f19,	%f3,	%f6
	set	0x30, %g1
	ldxa	[%g0 + %g1] 0x50,	%o7
	fbul,a	%fcc2,	loop_412
	orn	%o2,	0x1618,	%i2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l3
loop_412:
	tn	%icc,	0x7
	lduh	[%l7 + 0x46],	%g4
	fbue,a	%fcc3,	loop_413
	add	%i5,	0x0BC4,	%g5
	array16	%g3,	%i0,	%l4
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
loop_413:
	addc	%i1,	%o1,	%l1
	set	0x5C, %i3
	stwa	%l5,	[%l7 + %i3] 0x0c
	fbug,a	%fcc1,	loop_414
	edge16	%o5,	%i7,	%l2
	fmovdn	%icc,	%f11,	%f1
	fblg,a	%fcc0,	loop_415
loop_414:
	udiv	%g2,	0x1F74,	%l0
	taddcctv	%o6,	0x0422,	%o0
	fandnot2s	%f29,	%f13,	%f3
loop_415:
	umul	%o3,	%g1,	%g7
	bneg,a	loop_416
	movvc	%icc,	%i3,	%o4
	fexpand	%f24,	%f16
	subcc	%l6,	0x14F1,	%g6
loop_416:
	addccc	%o7,	%o2,	%i2
	movcc	%icc,	%i6,	%g4
	edge8n	%l3,	%i5,	%g3
	movl	%xcc,	%g5,	%l4
	edge32l	%i4,	%i1,	%i0
	subcc	%l1,	%l5,	%o5
	andcc	%o1,	0x086F,	%i7
	move	%icc,	%g2,	%l0
	fxors	%f23,	%f10,	%f30
	fmovrsgez	%o6,	%f25,	%f29
	fmovse	%xcc,	%f13,	%f13
	fnors	%f25,	%f29,	%f12
	lduw	[%l7 + 0x18],	%l2
	udivcc	%o3,	0x134B,	%g1
	fbne,a	%fcc0,	loop_417
	prefetch	[%l7 + 0x2C],	 0x1
	xnor	%g7,	%i3,	%o0
	addc	%l6,	%o4,	%g6
loop_417:
	tneg	%xcc,	0x1
	nop
	setx	loop_418,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bneg,a,pt	%icc,	loop_419
	sdivcc	%o2,	0x1CBE,	%i2
	tleu	%icc,	0x0
loop_418:
	stbar
loop_419:
	edge16n	%i6,	%g4,	%l3
	restored
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
	lduh	[%l7 + 0x5A],	%o7
	fpadd16s	%f1,	%f5,	%f28
	fandnot2	%f18,	%f30,	%f4
	tge	%xcc,	0x4
	mulscc	%i5,	0x17F2,	%g5
	pdist	%f24,	%f30,	%f26
	lduw	[%l7 + 0x4C],	%g3
	edge8n	%i4,	%l4,	%i0
	tne	%icc,	0x6
	srlx	%l1,	0x0C,	%i1
	fmovdn	%icc,	%f20,	%f0
	popc	0x1CC3,	%l5
	fblg	%fcc1,	loop_420
	nop
	setx	loop_421,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smul	%o1,	%i7,	%g2
	movcc	%icc,	%o5,	%l0
loop_420:
	ld	[%l7 + 0x24],	%f7
loop_421:
	sir	0x00C4
	mova	%icc,	%o6,	%o3
	smul	%l2,	%g1,	%i3
	movne	%xcc,	%o0,	%g7
	lduh	[%l7 + 0x72],	%l6
	bvc,a	loop_422
	fmovsneg	%icc,	%f1,	%f13
	membar	0x2E
	sllx	%o4,	0x0E,	%g6
loop_422:
	movrlz	%i2,	%o2,	%i6
	sdivx	%g4,	0x15E5,	%l3
	fands	%f25,	%f0,	%f26
	fmovrsne	%i5,	%f1,	%f9
	bcs,pt	%xcc,	loop_423
	alignaddrl	%g5,	%o7,	%i4
	ldsw	[%l7 + 0x1C],	%g3
	tvc	%xcc,	0x6
loop_423:
	call	loop_424
	movn	%icc,	%l4,	%l1
	fand	%f30,	%f2,	%f14
	add	%i1,	%l5,	%i0
loop_424:
	fnor	%f20,	%f2,	%f22
	fmovd	%f0,	%f8
	edge8l	%o1,	%g2,	%i7
	ld	[%l7 + 0x38],	%f29
	xnorcc	%l0,	%o5,	%o6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	fbu	%fcc1,	loop_425
	udiv	%g1,	0x06DF,	%o3
	movrne	%o0,	0x1F8,	%i3
	fmovda	%xcc,	%f2,	%f26
loop_425:
	nop
	setx loop_426, %l0, %l1
	jmpl %l1, %g7
	sdivcc	%o4,	0x0DD3,	%g6
	set	0x32, %g5
	lduha	[%l7 + %g5] 0x10,	%i2
loop_426:
	fpmerge	%f15,	%f9,	%f30
	orncc	%o2,	0x15B2,	%l6
	addcc	%i6,	0x0532,	%g4
	edge32l	%i5,	%g5,	%l3
	fornot2s	%f30,	%f27,	%f23
	fbne,a	%fcc0,	loop_427
	edge32	%o7,	%i4,	%l4
	move	%icc,	%l1,	%i1
	movpos	%icc,	%g3,	%i0
loop_427:
	faligndata	%f12,	%f24,	%f20
	fpadd16s	%f19,	%f22,	%f4
	edge32l	%l5,	%g2,	%i7
	bcs	loop_428
	subcc	%l0,	%o5,	%o6
	subccc	%o1,	0x1B1C,	%l2
	movre	%o3,	%g1,	%i3
loop_428:
	tl	%xcc,	0x5
	move	%icc,	%o0,	%o4
	fsrc2	%f22,	%f6
	edge16ln	%g7,	%i2,	%o2
	orcc	%l6,	0x0DEB,	%g6
	nop
	setx	loop_429,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_430,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x10],	%i6
	fand	%f14,	%f28,	%f8
loop_429:
	ldsw	[%l7 + 0x38],	%g4
loop_430:
	move	%xcc,	%g5,	%i5
	taddcctv	%l3,	0x0FB2,	%i4
	subcc	%l4,	%o7,	%i1
	stw	%l1,	[%l7 + 0x5C]
	ldx	[%l7 + 0x58],	%i0
	set	0x25, %l6
	ldstuba	[%l7 + %l6] 0x11,	%g3
	sir	0x0D75
	movneg	%icc,	%l5,	%i7
	fpsub32s	%f10,	%f18,	%f25
	ldub	[%l7 + 0x29],	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%g2,	%f21,	%f27
	ldsb	[%l7 + 0x64],	%o6
	fpmerge	%f6,	%f14,	%f22
	movpos	%icc,	%o5,	%o1
	popc	%o3,	%l2
	movrgz	%i3,	%o0,	%g1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%g7
	bneg	loop_431
	nop
	setx loop_432, %l0, %l1
	jmpl %l1, %o4
	ldd	[%l7 + 0x58],	%f20
	fabsd	%f8,	%f18
loop_431:
	tn	%xcc,	0x0
loop_432:
	fmul8sux16	%f16,	%f6,	%f0
	for	%f20,	%f18,	%f26
	fpadd32s	%f21,	%f29,	%f16
	fbule	%fcc0,	loop_433
	tne	%xcc,	0x5
	sra	%i2,	0x1E,	%l6
	tge	%xcc,	0x2
loop_433:
	nop
	setx	loop_434,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdneg	%xcc,	%f11,	%f21
	umulcc	%g6,	%i6,	%g4
	array8	%g5,	%o2,	%l3
loop_434:
	udivx	%i4,	0x17AE,	%i5
	sra	%l4,	0x12,	%i1
	orcc	%l1,	%i0,	%g3
	bge,a,pn	%xcc,	loop_435
	tge	%icc,	0x0
	mulx	%l5,	0x0536,	%o7
	tsubcctv	%i7,	0x1F0C,	%l0
loop_435:
	nop
	set	0x41, %g2
	lduba	[%l7 + %g2] 0x0c,	%g2
	movrlez	%o6,	%o5,	%o1
	fpadd16	%f6,	%f18,	%f4
	fbule,a	%fcc1,	loop_436
	bshuffle	%f8,	%f28,	%f6
	fandnot2s	%f15,	%f8,	%f10
	popc	%o3,	%l2
loop_436:
	ld	[%l7 + 0x74],	%f12
	tge	%icc,	0x7
	movrgez	%o0,	0x2D6,	%g1
	mova	%icc,	%i3,	%o4
	fmovsg	%xcc,	%f8,	%f7
	fpsub32s	%f27,	%f28,	%f21
	edge16ln	%g7,	%l6,	%g6
	fsrc2s	%f6,	%f6
	movn	%icc,	%i2,	%g4
	fbe	%fcc3,	loop_437
	movvc	%icc,	%g5,	%i6
	fcmpeq16	%f8,	%f26,	%o2
	flush	%l7 + 0x68
loop_437:
	tpos	%icc,	0x5
	movpos	%icc,	%l3,	%i4
	movrgz	%l4,	%i5,	%l1
	fmovse	%xcc,	%f19,	%f0
	fsrc1	%f2,	%f26
	fcmped	%fcc3,	%f10,	%f30
	fnot2	%f2,	%f2
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i1
	andncc	%i0,	%l5,	%o7
	fmovrdgez	%g3,	%f2,	%f10
	fcmpeq16	%f26,	%f14,	%l0
	alignaddr	%g2,	%i7,	%o6
	or	%o1,	%o3,	%l2
	edge8l	%o0,	%g1,	%i3
	fbule	%fcc1,	loop_438
	movleu	%icc,	%o5,	%g7
	or	%o4,	0x0DC7,	%l6
	sdivcc	%i2,	0x115B,	%g6
loop_438:
	fbn	%fcc0,	loop_439
	fbuge	%fcc0,	loop_440
	st	%f1,	[%l7 + 0x24]
	udivcc	%g5,	0x16E5,	%g4
loop_439:
	bcc,a	loop_441
loop_440:
	xnor	%i6,	%l3,	%o2
	fmul8sux16	%f28,	%f22,	%f26
	fmovscc	%xcc,	%f14,	%f24
loop_441:
	movvs	%icc,	%l4,	%i5
	movcc	%xcc,	%l1,	%i1
	te	%icc,	0x0
	fmovdvs	%xcc,	%f31,	%f13
	st	%f15,	[%l7 + 0x70]
	fbu,a	%fcc0,	loop_442
	fnand	%f30,	%f10,	%f8
	ldd	[%l7 + 0x58],	%f16
	andncc	%i4,	%l5,	%i0
loop_442:
	fmovdgu	%icc,	%f11,	%f12
	movl	%icc,	%g3,	%o7
	fbg,a	%fcc1,	loop_443
	fbue	%fcc2,	loop_444
	fmovsg	%xcc,	%f1,	%f0
	brnz,a	%g2,	loop_445
loop_443:
	tpos	%xcc,	0x1
loop_444:
	sth	%l0,	[%l7 + 0x12]
	membar	0x59
loop_445:
	smulcc	%o6,	%o1,	%i7
	brnz,a	%l2,	loop_446
	fmovdcs	%xcc,	%f18,	%f27
	nop
	set	0x18, %i6
	ldx	[%l7 + %i6],	%o0
	edge16l	%g1,	%o3,	%i3
loop_446:
	udiv	%g7,	0x0A27,	%o4
	bge,pt	%icc,	loop_447
	udivx	%o5,	0x1861,	%l6
	movl	%xcc,	%i2,	%g6
	sra	%g4,	0x0D,	%i6
loop_447:
	movrlez	%g5,	%o2,	%l3
	sir	0x1C3F
	tsubcctv	%l4,	0x0F69,	%i5
	subc	%i1,	0x1B31,	%l1
	udiv	%l5,	0x12DD,	%i4
	set	0x20, %i0
	lduwa	[%l7 + %i0] 0x88,	%g3
	mulscc	%o7,	0x15E6,	%g2
	fmovdg	%icc,	%f23,	%f7
	tcc	%xcc,	0x2
	edge32l	%l0,	%o6,	%i0
	umulcc	%o1,	%i7,	%l2
	sub	%g1,	0x19F8,	%o3
	fmovrdlez	%i3,	%f26,	%f22
	tsubcctv	%o0,	0x0BCF,	%o4
	xnorcc	%g7,	%l6,	%i2
	tneg	%xcc,	0x5
	brnz,a	%g6,	loop_448
	tne	%xcc,	0x3
	movre	%g4,	%o5,	%g5
	fmovsne	%icc,	%f20,	%f31
loop_448:
	xnor	%i6,	0x03AE,	%l3
	call	loop_449
	mulscc	%l4,	%i5,	%o2
	fmovdle	%xcc,	%f20,	%f9
	fnot2	%f30,	%f18
loop_449:
	udiv	%i1,	0x09C5,	%l1
	tg	%icc,	0x7
	fbg,a	%fcc0,	loop_450
	array8	%i4,	%l5,	%o7
	fandnot1	%f20,	%f18,	%f30
	xor	%g3,	%l0,	%o6
loop_450:
	fsrc2s	%f6,	%f30
	sdiv	%i0,	0x1EC7,	%g2
	addccc	%i7,	%o1,	%g1
	movcs	%icc,	%l2,	%i3
	tgu	%icc,	0x4
	edge16n	%o0,	%o3,	%o4
	tcc	%xcc,	0x4
	fbge	%fcc3,	loop_451
	tgu	%xcc,	0x2
	fnot2s	%f15,	%f17
	for	%f20,	%f18,	%f10
loop_451:
	movrgz	%g7,	%i2,	%l6
	edge8	%g4,	%o5,	%g6
	faligndata	%f16,	%f18,	%f6
	sllx	%g5,	0x1A,	%l3
	edge8n	%i6,	%l4,	%o2
	subcc	%i5,	0x047A,	%i1
	smul	%i4,	0x03EA,	%l5
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bcc,a	loop_452
	fmul8ulx16	%f6,	%f0,	%f18
	srl	%o7,	0x10,	%l1
	std	%g2,	[%l7 + 0x08]
loop_452:
	fmovsg	%icc,	%f13,	%f14
	tcc	%icc,	0x1
	addccc	%l0,	%i0,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%o1
	movge	%icc,	%g2,	%l2
	fbne	%fcc3,	loop_453
	fble,a	%fcc2,	loop_454
	fmovse	%icc,	%f23,	%f15
	tge	%icc,	0x7
loop_453:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_454:
	fnot1	%f14,	%f26
	edge8l	%i3,	%o0,	%g1
	edge32ln	%o3,	%g7,	%i2
	tcs	%xcc,	0x3
	te	%xcc,	0x4
	ld	[%l7 + 0x54],	%f27
	add	%o4,	%g4,	%l6
	tn	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%o4
	addcc	%g6,	%g5,	%l3
	fmovdge	%xcc,	%f6,	%f18
	add	%l4,	%i6,	%i5
	stb	%i1,	[%l7 + 0x25]
	edge8n	%i4,	%o2,	%o7
	sethi	0x1755,	%l5
	flush	%l7 + 0x24
	edge32	%g3,	%l0,	%i0
	addccc	%o6,	%i7,	%l1
	fzero	%f4
	umul	%g2,	0x0258,	%o1
	andn	%i3,	0x0B5B,	%l2
	movrgz	%o0,	%o3,	%g7
	fmovsgu	%xcc,	%f25,	%f21
	fbl,a	%fcc3,	loop_455
	flush	%l7 + 0x50
	bl,pt	%xcc,	loop_456
	sir	0x1983
loop_455:
	andn	%i2,	0x14CF,	%o4
	ble,a,pn	%xcc,	loop_457
loop_456:
	bvs,a	%icc,	loop_458
	orcc	%g1,	0x0A7C,	%g4
	ldsb	[%l7 + 0x18],	%o5
loop_457:
	nop
	set	0x5C, %g3
	ldub	[%l7 + %g3],	%l6
loop_458:
	fcmple32	%f30,	%f22,	%g5
	move	%icc,	%g6,	%l4
	taddcc	%l3,	0x1160,	%i6
	nop
	setx	loop_459,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%i1,	0x1DA7,	%i4
	bpos,a,pn	%xcc,	loop_460
	edge32ln	%i5,	%o7,	%l5
loop_459:
	fnegs	%f10,	%f4
	srl	%g3,	%o2,	%l0
loop_460:
	fornot1s	%f15,	%f13,	%f19
	fmovd	%f26,	%f20
	edge8	%o6,	%i0,	%l1
	ble,a	loop_461
	edge16n	%i7,	%o1,	%i3
	movl	%xcc,	%g2,	%o0
	fnands	%f22,	%f10,	%f0
loop_461:
	bpos	%xcc,	loop_462
	udiv	%o3,	0x03C1,	%l2
	tleu	%xcc,	0x2
	fnand	%f22,	%f2,	%f0
loop_462:
	tg	%icc,	0x4
	tle	%icc,	0x5
	stx	%g7,	[%l7 + 0x70]
	edge32	%o4,	%g1,	%i2
	bne	%icc,	loop_463
	smul	%o5,	%l6,	%g5
	andcc	%g6,	0x0B1F,	%l4
	fcmple32	%f8,	%f24,	%g4
loop_463:
	sdivx	%i6,	0x13DE,	%l3
	bge,pn	%xcc,	loop_464
	edge16ln	%i4,	%i5,	%o7
	fnand	%f20,	%f22,	%f24
	alignaddrl	%l5,	%i1,	%o2
loop_464:
	fpadd16	%f20,	%f0,	%f20
	brz	%g3,	loop_465
	movrne	%l0,	%o6,	%l1
	movrgz	%i0,	0x3F1,	%i7
	membar	0x2F
loop_465:
	movg	%icc,	%i3,	%o1
	umulcc	%g2,	0x147D,	%o0
	tleu	%xcc,	0x4
	alignaddr	%l2,	%o3,	%g7
	ld	[%l7 + 0x60],	%f28
	fpadd16s	%f1,	%f11,	%f23
	xnorcc	%g1,	0x182A,	%o4
	fsrc1s	%f23,	%f20
	fcmped	%fcc2,	%f22,	%f18
	sethi	0x14D3,	%o5
	bcs,a	loop_466
	fbne	%fcc0,	loop_467
	add	%l6,	0x05D5,	%i2
	sllx	%g6,	%g5,	%g4
loop_466:
	alignaddrl	%l4,	%i6,	%i4
loop_467:
	tg	%icc,	0x4
	subc	%l3,	0x03BE,	%i5
	ldsb	[%l7 + 0x38],	%l5
	xorcc	%o7,	0x19E1,	%o2
	fmovrde	%i1,	%f24,	%f14
	addc	%g3,	0x13C1,	%l0
	edge16n	%l1,	%i0,	%i7
	fpsub32	%f14,	%f30,	%f10
	addcc	%o6,	0x0DB7,	%i3
	sllx	%o1,	0x06,	%g2
	fmovrsne	%l2,	%f1,	%f22
	edge32l	%o0,	%o3,	%g7
	set	0x74, %g4
	swapa	[%l7 + %g4] 0x80,	%o4
	move	%xcc,	%o5,	%l6
	tge	%xcc,	0x7
	tn	%xcc,	0x7
	fornot1	%f12,	%f20,	%f2
	fmovrsne	%i2,	%f19,	%f12
	fbe,a	%fcc2,	loop_468
	movrne	%g6,	%g1,	%g5
	movcc	%icc,	%g4,	%l4
	ble,pt	%icc,	loop_469
loop_468:
	movre	%i4,	%l3,	%i6
	sllx	%l5,	0x1F,	%i5
	brgez	%o2,	loop_470
loop_469:
	or	%i1,	0x0A29,	%g3
	tle	%xcc,	0x7
	alignaddr	%l0,	%l1,	%i0
loop_470:
	orn	%i7,	0x1E24,	%o7
	membar	0x41
	fmovde	%xcc,	%f25,	%f29
	tleu	%icc,	0x5
	std	%o6,	[%l7 + 0x40]
	alignaddr	%o1,	%g2,	%i3
	sethi	0x0D13,	%l2
	taddcc	%o0,	%g7,	%o3
	edge8n	%o5,	%l6,	%o4
	movrgz	%i2,	0x21B,	%g6
	movcs	%xcc,	%g5,	%g4
	xnor	%l4,	0x1D21,	%g1
	tne	%xcc,	0x2
	fpadd32	%f10,	%f28,	%f12
	fpsub32s	%f30,	%f4,	%f14
	fbuge	%fcc0,	loop_471
	swap	[%l7 + 0x5C],	%l3
	bcs,a,pn	%icc,	loop_472
	umul	%i6,	%i4,	%i5
loop_471:
	xor	%l5,	%o2,	%i1
	fandnot1	%f2,	%f28,	%f4
loop_472:
	orn	%l0,	0x122D,	%l1
	fmovdge	%icc,	%f13,	%f28
	fones	%f3
	popc	0x058C,	%g3
	or	%i0,	0x18A8,	%o7
	array32	%i7,	%o1,	%o6
	fcmple16	%f10,	%f24,	%i3
	subcc	%l2,	%o0,	%g7
	ldub	[%l7 + 0x15],	%g2
	xorcc	%o5,	0x0D60,	%o3
	fpsub32s	%f27,	%f28,	%f7
	wr	%g0,	0x88,	%asi
	stwa	%o4,	[%l7 + 0x20] %asi
	bge,a	%xcc,	loop_473
	fmovdg	%icc,	%f24,	%f6
	fnors	%f25,	%f28,	%f30
	fcmpes	%fcc0,	%f8,	%f7
loop_473:
	nop
	set	0x6E, %o3
	stba	%i2,	[%l7 + %o3] 0x22
	membar	#Sync
	add	%g6,	%l6,	%g4
	tg	%xcc,	0x7
	fandnot1s	%f27,	%f27,	%f22
	tsubcc	%g5,	0x0524,	%l4
	edge8ln	%l3,	%g1,	%i6
	bge,a	loop_474
	sir	0x0211
	ldsw	[%l7 + 0x28],	%i5
	addc	%i4,	0x128E,	%o2
loop_474:
	fmovsvc	%xcc,	%f29,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x4
	tpos	%icc,	0x1
	bn	loop_475
	tg	%xcc,	0x5
	andncc	%i1,	%l5,	%l0
	fpadd32s	%f27,	%f14,	%f0
loop_475:
	brnz	%g3,	loop_476
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i0,	%o7,	%l1
	udiv	%o1,	0x1676,	%i7
loop_476:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f27,	[%l7 + 0x40] %asi
	movn	%icc,	%o6,	%i3
	for	%f30,	%f0,	%f12
	fbo,a	%fcc2,	loop_477
	tle	%xcc,	0x7
	bcc,a,pn	%icc,	loop_478
	edge8l	%l2,	%o0,	%g7
loop_477:
	andcc	%g2,	%o3,	%o4
	set	0x10, %l1
	ldswa	[%l7 + %l1] 0x88,	%o5
loop_478:
	taddcctv	%g6,	0x0CC0,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_479, %l0, %l1
	jmpl %l1, %g4
	fpadd16	%f4,	%f2,	%f16
	movrlez	%i2,	%l4,	%g5
	movleu	%xcc,	%g1,	%l3
loop_479:
	fbug,a	%fcc1,	loop_480
	udiv	%i5,	0x1178,	%i4
	sub	%o2,	0x1AB6,	%i6
	tneg	%xcc,	0x3
loop_480:
	movrlez	%l5,	%i1,	%l0
	edge8n	%i0,	%g3,	%l1
	fmovse	%xcc,	%f21,	%f9
	fcmpes	%fcc3,	%f18,	%f2
	tle	%icc,	0x0
	movg	%xcc,	%o1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_481,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos,a	%icc,	loop_482
	bl,pt	%icc,	loop_483
	fbo,a	%fcc3,	loop_484
loop_481:
	fnand	%f14,	%f26,	%f14
loop_482:
	fbuge,a	%fcc2,	loop_485
loop_483:
	sdivcc	%i7,	0x0B0D,	%o6
loop_484:
	edge32ln	%i3,	%l2,	%g7
	movle	%xcc,	%g2,	%o0
loop_485:
	fones	%f2
	movg	%icc,	%o3,	%o5
	fpackfix	%f26,	%f25
	std	%g6,	[%l7 + 0x70]
	fbe,a	%fcc1,	loop_486
	fble	%fcc1,	loop_487
	sll	%o4,	0x1B,	%l6
	tsubcc	%i2,	%g4,	%l4
loop_486:
	ble,a	%icc,	loop_488
loop_487:
	srl	%g1,	%g5,	%i5
	edge8ln	%l3,	%o2,	%i6
	fmovscc	%xcc,	%f11,	%f17
loop_488:
	tgu	%xcc,	0x4
	orncc	%l5,	%i1,	%l0
	fnot2s	%f9,	%f9
	movre	%i0,	%i4,	%g3
	fandnot2	%f4,	%f16,	%f2
	sra	%o1,	%o7,	%i7
	fblg,a	%fcc0,	loop_489
	sra	%l1,	0x1B,	%o6
	fbo	%fcc1,	loop_490
	fbn,a	%fcc0,	loop_491
loop_489:
	fbe	%fcc3,	loop_492
	movpos	%icc,	%l2,	%g7
loop_490:
	smul	%g2,	0x1454,	%i3
loop_491:
	alignaddrl	%o0,	%o3,	%g6
loop_492:
	movrlez	%o5,	0x110,	%l6
	edge32	%o4,	%g4,	%i2
	tg	%xcc,	0x1
	or	%g1,	0x13B3,	%g5
	edge16ln	%l4,	%i5,	%o2
	bne,a,pn	%icc,	loop_493
	tge	%icc,	0x3
	tge	%xcc,	0x1
	tne	%xcc,	0x0
loop_493:
	fmovrdlez	%l3,	%f26,	%f28
	movgu	%xcc,	%i6,	%i1
	movneg	%icc,	%l0,	%l5
	fmovrdlz	%i4,	%f26,	%f28
	array32	%g3,	%i0,	%o7
	movn	%icc,	%o1,	%i7
	udivx	%o6,	0x1D96,	%l1
	edge8l	%g7,	%l2,	%g2
	fbul	%fcc3,	loop_494
	fornot1	%f6,	%f4,	%f16
	movge	%icc,	%o0,	%i3
	fbl	%fcc2,	loop_495
loop_494:
	tsubcctv	%o3,	%g6,	%o5
	edge8l	%l6,	%o4,	%g4
	sdivcc	%g1,	0x1283,	%g5
loop_495:
	ldsh	[%l7 + 0x16],	%l4
	umulcc	%i5,	0x0D03,	%o2
	fnot1	%f22,	%f6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i2
	fornot2	%f14,	%f14,	%f2
	movrgez	%l3,	%i6,	%l0
	edge16	%l5,	%i4,	%g3
	wr	%g0,	0x88,	%asi
	stba	%i1,	[%l7 + 0x41] %asi
	tn	%icc,	0x6
	sir	0x13C5
	add	%i0,	0x08FF,	%o7
	movne	%icc,	%o1,	%i7
	fand	%f24,	%f22,	%f6
	fands	%f15,	%f25,	%f14
	fnands	%f16,	%f29,	%f20
	tgu	%icc,	0x4
	pdist	%f30,	%f14,	%f6
	xnor	%l1,	0x1595,	%o6
	for	%f14,	%f20,	%f6
	bpos,a	%xcc,	loop_496
	fornot1s	%f13,	%f13,	%f31
	set	0x6C, %i1
	lduba	[%l7 + %i1] 0x11,	%g7
loop_496:
	movvs	%xcc,	%g2,	%o0
	bcs	loop_497
	edge16n	%i3,	%l2,	%o3
	add	%o5,	%l6,	%g6
	sdivx	%g4,	0x1A86,	%g1
loop_497:
	tvs	%xcc,	0x0
	alignaddr	%o4,	%g5,	%l4
	srl	%o2,	%i2,	%l3
	fpackfix	%f30,	%f13
	brz	%i5,	loop_498
	movrgez	%l0,	0x341,	%i6
	lduh	[%l7 + 0x3E],	%l5
	tge	%icc,	0x4
loop_498:
	movrgz	%i4,	%i1,	%g3
	move	%xcc,	%i0,	%o1
	sdiv	%i7,	0x1477,	%l1
	movle	%icc,	%o6,	%o7
	edge32	%g2,	%g7,	%o0
	fornot1	%f18,	%f22,	%f8
	fandnot1	%f14,	%f16,	%f2
	nop
	setx loop_499, %l0, %l1
	jmpl %l1, %i3
	fbuge	%fcc0,	loop_500
	xorcc	%l2,	0x18A0,	%o5
	tne	%xcc,	0x5
loop_499:
	edge16	%o3,	%g6,	%l6
loop_500:
	fmovrsgez	%g4,	%f3,	%f2
	fmovdneg	%icc,	%f14,	%f10
	xnor	%g1,	%g5,	%l4
	fbg,a	%fcc1,	loop_501
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a	%icc,	loop_502
	movpos	%xcc,	%o4,	%i2
loop_501:
	fcmple16	%f24,	%f14,	%l3
	srlx	%o2,	%i5,	%l0
loop_502:
	xor	%l5,	0x19D0,	%i4
	andn	%i6,	0x132A,	%i1
	brlz	%g3,	loop_503
	orncc	%i0,	%i7,	%o1
	movrgz	%o6,	%o7,	%g2
	fxnors	%f19,	%f29,	%f24
loop_503:
	bcc,a	%xcc,	loop_504
	nop
	setx	loop_505,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fble	%fcc3,	loop_506
	fbe,a	%fcc2,	loop_507
loop_504:
	udivx	%g7,	0x040B,	%o0
loop_505:
	movcc	%xcc,	%i3,	%l2
loop_506:
	taddcc	%l1,	%o5,	%g6
loop_507:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f16,	[%l7 + 0x6C] %asi
	fmovdge	%xcc,	%f26,	%f20
	tl	%icc,	0x1
	brlez	%o3,	loop_508
	and	%g4,	0x1C0F,	%g1
	brnz,a	%g5,	loop_509
	brlez	%l4,	loop_510
loop_508:
	sllx	%o4,	%i2,	%l3
	add	%l6,	%i5,	%o2
loop_509:
	edge16n	%l0,	%i4,	%i6
loop_510:
	fmovdvc	%xcc,	%f30,	%f12
	movvs	%icc,	%l5,	%i1
	tpos	%icc,	0x5
	movrlez	%i0,	0x166,	%g3
	st	%f30,	[%l7 + 0x68]
	sth	%i7,	[%l7 + 0x48]
	brnz,a	%o1,	loop_511
	tgu	%xcc,	0x1
	xnorcc	%o7,	%g2,	%o6
	smulcc	%g7,	%o0,	%l2
loop_511:
	taddcc	%l1,	0x0D4D,	%i3
	edge16l	%o5,	%g6,	%o3
	fnands	%f27,	%f10,	%f31
	xor	%g4,	%g1,	%l4
	movrlez	%o4,	%g5,	%i2
	array8	%l3,	%l6,	%o2
	movle	%xcc,	%i5,	%l0
	popc	0x0EDE,	%i4
	smulcc	%i6,	0x1E81,	%i1
	bvs,pt	%icc,	loop_512
	ta	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc3,	loop_513
loop_512:
	xnor	%l5,	0x10F5,	%g3
	movvc	%xcc,	%i0,	%o1
	edge8l	%o7,	%i7,	%g2
loop_513:
	fmovrdgz	%g7,	%f28,	%f24
	andcc	%o6,	%o0,	%l2
	sdiv	%l1,	0x0541,	%o5
	and	%i3,	0x12AD,	%g6
	ta	%icc,	0x3
	pdist	%f24,	%f4,	%f26
	udivcc	%g4,	0x1440,	%o3
	tl	%xcc,	0x7
	be,a,pn	%xcc,	loop_514
	movre	%l4,	%o4,	%g1
	edge16ln	%g5,	%i2,	%l3
	fbg	%fcc3,	loop_515
loop_514:
	smul	%o2,	0x0B77,	%i5
	umulcc	%l0,	0x0143,	%l6
	fmovdvc	%icc,	%f19,	%f11
loop_515:
	ldsb	[%l7 + 0x3A],	%i4
	fand	%f18,	%f16,	%f14
	te	%icc,	0x6
	sllx	%i6,	%l5,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i0,	0x1FDE,	%o1
	movrgz	%o7,	%g3,	%g2
	movvs	%icc,	%i7,	%o6
	movleu	%xcc,	%g7,	%l2
	array32	%o0,	%l1,	%i3
	edge32	%g6,	%o5,	%o3
	array8	%l4,	%o4,	%g1
	wr	%g0,	0xe2,	%asi
	stda	%g4,	[%l7 + 0x40] %asi
	membar	#Sync
	tleu	%icc,	0x0
	sdivcc	%g4,	0x160C,	%l3
	edge32ln	%o2,	%i5,	%l0
	fmul8ulx16	%f22,	%f2,	%f30
	fba	%fcc1,	loop_516
	or	%i2,	0x117C,	%i4
	nop
	set	0x19, %l3
	stb	%l6,	[%l7 + %l3]
	sethi	0x1B9D,	%i6
loop_516:
	fsrc2	%f12,	%f22
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x2C] %asi
	edge32	%i1,	%i0,	%o1
	fnegd	%f8,	%f4
	movl	%xcc,	%o7,	%l5
	movne	%xcc,	%g2,	%i7
	bge,a	%xcc,	loop_517
	xnorcc	%o6,	%g3,	%g7
	edge8	%o0,	%l2,	%l1
	fornot1	%f30,	%f24,	%f22
loop_517:
	sdivx	%g6,	0x162F,	%i3
	tpos	%icc,	0x6
	tvc	%xcc,	0x7
	fmovrse	%o5,	%f0,	%f28
	edge32n	%o3,	%o4,	%l4
	or	%g5,	%g4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc0,	loop_518
	fmovdpos	%icc,	%f31,	%f8
	orn	%o2,	%i5,	%l3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x04,	%f16
loop_518:
	siam	0x6
	edge16l	%i2,	%l0,	%i4
	movrgez	%i6,	%i1,	%l6
	fmovsneg	%xcc,	%f4,	%f31
	xor	%i0,	%o7,	%l5
	brlez	%o1,	loop_519
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f21,	%f22
	std	%g2,	[%l7 + 0x60]
loop_519:
	sir	0x1A76
	xnor	%o6,	0x0402,	%i7
	edge16	%g3,	%o0,	%l2
	tneg	%xcc,	0x4
	fmovsgu	%xcc,	%f9,	%f5
	popc	0x15FE,	%g7
	fornot2s	%f18,	%f23,	%f20
	popc	%l1,	%i3
	udivcc	%g6,	0x0E90,	%o5
	fbul,a	%fcc3,	loop_520
	edge32n	%o4,	%l4,	%o3
	fmovsvc	%xcc,	%f13,	%f13
	srax	%g5,	0x1B,	%g1
loop_520:
	te	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	stda	%g4,	[%l7 + 0x28] %asi
	set	0x28, %g6
	stha	%o2,	[%l7 + %g6] 0x10
	array16	%l3,	%i5,	%i2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%l0
	fbule	%fcc0,	loop_521
	tg	%xcc,	0x6
	srl	%i4,	%i1,	%l6
	fnands	%f4,	%f0,	%f4
loop_521:
	fpsub16s	%f6,	%f1,	%f18
	set	0x68, %i4
	ldswa	[%l7 + %i4] 0x80,	%i0
	taddcctv	%o7,	0x1854,	%i6
	swap	[%l7 + 0x28],	%o1
	fmovdle	%xcc,	%f22,	%f10
	sra	%l5,	0x00,	%o6
	bvc,pt	%xcc,	loop_522
	fsrc1s	%f7,	%f2
	fnor	%f22,	%f20,	%f4
	fors	%f10,	%f13,	%f6
loop_522:
	or	%i7,	0x17DA,	%g3
	fbu	%fcc2,	loop_523
	taddcc	%o0,	%g2,	%l2
	sdiv	%g7,	0x190A,	%l1
	fmovdge	%xcc,	%f8,	%f24
loop_523:
	movgu	%xcc,	%i3,	%o5
	nop
	set	0x30, %l0
	ldub	[%l7 + %l0],	%g6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fcmpeq32	%f22,	%f8,	%l4
	tcs	%icc,	0x0
	pdist	%f10,	%f30,	%f2
	fcmple16	%f28,	%f12,	%o4
	alignaddr	%o3,	%g1,	%g5
	array8	%g4,	%o2,	%i5
	fpsub16s	%f17,	%f2,	%f21
	te	%xcc,	0x0
	addc	%l3,	0x1085,	%i2
	tsubcctv	%l0,	0x039F,	%i1
	fmovsgu	%icc,	%f14,	%f11
	edge16ln	%i4,	%l6,	%i0
	array32	%i6,	%o1,	%l5
	udivx	%o6,	0x11B0,	%o7
	std	%f30,	[%l7 + 0x38]
	bgu	loop_524
	bneg,a	%icc,	loop_525
	tgu	%xcc,	0x1
	orn	%i7,	%g3,	%o0
loop_524:
	subc	%l2,	0x1A03,	%g2
loop_525:
	orcc	%g7,	0x19CA,	%i3
	call	loop_526
	movleu	%icc,	%l1,	%o5
	alignaddr	%l4,	%o4,	%g6
	srl	%g1,	0x0D,	%g5
loop_526:
	fandnot1s	%f20,	%f15,	%f5
	mulx	%o3,	%o2,	%g4
	sll	%i5,	0x04,	%i2
	fbu	%fcc1,	loop_527
	fmovrdgz	%l3,	%f6,	%f6
	sethi	0x157D,	%l0
	tcc	%xcc,	0x3
loop_527:
	movrgez	%i4,	0x16A,	%i1
	srax	%i0,	%l6,	%o1
	popc	0x0998,	%l5
	smulcc	%i6,	0x09E3,	%o6
	umul	%i7,	%g3,	%o7
	ba	%xcc,	loop_528
	movvs	%icc,	%o0,	%g2
	set	0x4A, %l2
	lduba	[%l7 + %l2] 0x89,	%g7
loop_528:
	xnorcc	%l2,	0x0B00,	%i3
	fbo,a	%fcc1,	loop_529
	fbug,a	%fcc3,	loop_530
	bn	%xcc,	loop_531
	edge8l	%l1,	%l4,	%o4
loop_529:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_530:
	mulscc	%g6,	0x12BC,	%o5
loop_531:
	fmovspos	%icc,	%f23,	%f18
	fmovrdne	%g1,	%f30,	%f14
	ba,a	loop_532
	taddcctv	%g5,	%o3,	%g4
	movvc	%icc,	%i5,	%o2
	andncc	%i2,	%l0,	%l3
loop_532:
	nop
	wr	%g0,	0x2b,	%asi
	stda	%i0,	[%l7 + 0x18] %asi
	membar	#Sync
	nop
	setx	loop_533,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%i0,	%i4,	%l6
	sir	0x112D
	bge,pt	%icc,	loop_534
loop_533:
	movrgez	%o1,	%l5,	%i6
	fnot2	%f26,	%f2
	set	0x21, %o7
	ldsba	[%l7 + %o7] 0x04,	%o6
loop_534:
	andcc	%g3,	%o7,	%o0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x50] %asi,	%g2
	edge8n	%i7,	%g7,	%i3
	xnor	%l2,	0x13AA,	%l4
	membar	0x0B
	fpsub16s	%f23,	%f10,	%f8
	smul	%o4,	0x0958,	%g6
	fbge,a	%fcc2,	loop_535
	movge	%icc,	%l1,	%o5
	add	%g5,	%g1,	%g4
	fmovsneg	%icc,	%f13,	%f28
loop_535:
	tvc	%icc,	0x6
	stbar
	fmovdcc	%xcc,	%f4,	%f31
	fbg	%fcc1,	loop_536
	movrgez	%i5,	0x324,	%o3
	movne	%xcc,	%o2,	%l0
	fmovrslz	%i2,	%f6,	%f17
loop_536:
	fnand	%f28,	%f10,	%f4
	fbug,a	%fcc1,	loop_537
	subc	%i1,	%i0,	%i4
	bvs,pn	%xcc,	loop_538
	tsubcc	%l6,	0x1053,	%l3
loop_537:
	or	%o1,	%i6,	%l5
	ba,a,pn	%icc,	loop_539
loop_538:
	fnot2	%f6,	%f6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x45] %asi,	%g3
loop_539:
	fmovrse	%o6,	%f16,	%f31
	fbn	%fcc0,	loop_540
	fmovdvs	%icc,	%f16,	%f20
	ldd	[%l7 + 0x60],	%o6
	fcmpgt32	%f30,	%f26,	%g2
loop_540:
	fpackfix	%f0,	%f14
	xor	%o0,	%g7,	%i7
	movrlz	%l2,	0x37C,	%i3
	tcs	%xcc,	0x0
	sll	%o4,	0x1E,	%g6
	movne	%icc,	%l4,	%o5
	fmovsa	%icc,	%f11,	%f20
	fbge,a	%fcc0,	loop_541
	udivcc	%l1,	0x08DD,	%g5
	st	%f10,	[%l7 + 0x28]
	fnot2s	%f27,	%f10
loop_541:
	movcc	%xcc,	%g1,	%i5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	andn	%g4,	0x07A4,	%l0
	orncc	%o2,	%i1,	%i0
	srlx	%i4,	0x05,	%i2
	movleu	%icc,	%l3,	%l6
	sub	%i6,	0x0453,	%l5
	sethi	0x0BBE,	%o1
	tcs	%icc,	0x5
	set	0x0A, %g7
	ldsha	[%l7 + %g7] 0x80,	%g3
	srlx	%o7,	%o6,	%o0
	nop
	setx loop_542, %l0, %l1
	jmpl %l1, %g2
	flush	%l7 + 0x2C
	fba	%fcc0,	loop_543
	fmovdle	%xcc,	%f18,	%f9
loop_542:
	fbule	%fcc2,	loop_544
	fmovrdlz	%g7,	%f4,	%f18
loop_543:
	addc	%i7,	0x0C7B,	%l2
	subccc	%i3,	%o4,	%l4
loop_544:
	fmovrdne	%o5,	%f6,	%f12
	fcmpeq32	%f6,	%f30,	%g6
	bvc,a	%icc,	loop_545
	ld	[%l7 + 0x38],	%f12
	tg	%xcc,	0x3
	movcc	%icc,	%l1,	%g5
loop_545:
	movn	%xcc,	%g1,	%o3
	sdivcc	%i5,	0x0C75,	%l0
	brlz	%g4,	loop_546
	bcc,a,pt	%xcc,	loop_547
	ta	%icc,	0x2
	brgz	%i1,	loop_548
loop_546:
	tgu	%xcc,	0x0
loop_547:
	sra	%o2,	0x1F,	%i4
	fmovsne	%icc,	%f15,	%f5
loop_548:
	fnot2s	%f8,	%f21
	movvc	%xcc,	%i0,	%l3
	fcmpgt16	%f16,	%f16,	%l6
	fmovda	%icc,	%f17,	%f0
	taddcc	%i6,	0x01C0,	%l5
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1E60
	fbe,a	%fcc2,	loop_549
	array32	%i2,	%o1,	%g3
	addccc	%o6,	%o7,	%o0
	std	%g6,	[%l7 + 0x50]
loop_549:
	subccc	%i7,	%g2,	%l2
	movne	%xcc,	%o4,	%i3
	movvs	%icc,	%l4,	%g6
	addc	%o5,	0x042F,	%l1
	alignaddr	%g5,	%o3,	%i5
	sll	%l0,	%g1,	%i1
	smul	%g4,	%o2,	%i4
	tge	%icc,	0x0
	sra	%l3,	%i0,	%i6
	fors	%f5,	%f21,	%f0
	tsubcctv	%l5,	%i2,	%o1
	fmovsne	%xcc,	%f10,	%f6
	fcmpgt16	%f10,	%f6,	%g3
	movvc	%xcc,	%o6,	%o7
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x19,	 0x3
	fornot2	%f0,	%f30,	%f6
	bcc,a,pt	%icc,	loop_550
	tcc	%xcc,	0x4
	fmovda	%xcc,	%f14,	%f20
	fmovsvc	%icc,	%f21,	%f6
loop_550:
	bg,pn	%xcc,	loop_551
	fbo,a	%fcc2,	loop_552
	call	loop_553
	fpsub16s	%f20,	%f15,	%f0
loop_551:
	fbue,a	%fcc2,	loop_554
loop_552:
	sllx	%g7,	0x18,	%i7
loop_553:
	fmovdcc	%icc,	%f14,	%f27
	xor	%l6,	%g2,	%o4
loop_554:
	edge8n	%l2,	%l4,	%i3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x3A] %asi,	%g6
	tpos	%icc,	0x0
	movn	%xcc,	%o5,	%g5
	taddcc	%l1,	%i5,	%o3
	sethi	0x1A7C,	%g1
	tle	%xcc,	0x5
	for	%f24,	%f16,	%f4
	sll	%l0,	%g4,	%i1
	movcc	%icc,	%i4,	%o2
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%l3
	addc	%i6,	%l5,	%i0
	tsubcc	%i2,	%o1,	%g3
	fxor	%f20,	%f12,	%f20
	sdiv	%o7,	0x1031,	%o0
	fpack32	%f6,	%f8,	%f26
	set	0x78, %i5
	lduwa	[%l7 + %i5] 0x10,	%g7
	fcmpgt16	%f26,	%f26,	%o6
	fmovsle	%xcc,	%f4,	%f12
	alignaddrl	%l6,	%g2,	%i7
	fcmpeq16	%f22,	%f8,	%o4
	wr	%g0,	0x2a,	%asi
	stda	%l2,	[%l7 + 0x40] %asi
	membar	#Sync
	orn	%i3,	%l4,	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g5,	%l1
	tne	%xcc,	0x7
	fbue,a	%fcc3,	loop_555
	membar	0x20
	ta	%icc,	0x2
	movge	%icc,	%o5,	%o3
loop_555:
	andn	%g1,	%l0,	%g4
	fblg	%fcc3,	loop_556
	movg	%xcc,	%i1,	%i4
	movvs	%xcc,	%o2,	%l3
	edge32l	%i5,	%i6,	%l5
loop_556:
	fpack32	%f16,	%f18,	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%i2
	xorcc	%g3,	%o7,	%o1
	umulcc	%o0,	0x0068,	%g7
	fmovrse	%o6,	%f22,	%f15
	fmul8x16	%f28,	%f4,	%f18
	fmovsvc	%icc,	%f3,	%f1
	tvs	%icc,	0x3
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%i6
	andcc	%g2,	%i7,	%l2
	fmovdvc	%icc,	%f24,	%f27
	fbl,a	%fcc0,	loop_557
	movrgz	%o4,	%i3,	%l4
	subc	%g6,	0x0AAC,	%g5
	mova	%icc,	%l1,	%o5
loop_557:
	smul	%g1,	0x0E27,	%o3
	fpadd16s	%f3,	%f21,	%f5
	movcc	%icc,	%l0,	%i1
	tvc	%xcc,	0x6
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x88,	%i4
	fmovscc	%xcc,	%f16,	%f31
	set	0x17, %o6
	stba	%o2,	[%l7 + %o6] 0x23
	membar	#Sync
	nop
	set	0x14, %i2
	ldsw	[%l7 + %i2],	%l3
	fnot1	%f18,	%f20
	move	%icc,	%g4,	%i5
	fbe,a	%fcc3,	loop_558
	tg	%xcc,	0x6
	fcmpgt32	%f22,	%f2,	%i6
	fnor	%f6,	%f16,	%f20
loop_558:
	udivx	%l5,	0x00EE,	%i2
	fmovdl	%xcc,	%f13,	%f22
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	tge	%xcc,	0x5
	mulx	%o7,	0x0B8A,	%i0
	movn	%icc,	%o1,	%g7
	nop
	set	0x48, %l5
	ldsh	[%l7 + %l5],	%o0
	flush	%l7 + 0x1C
	fpmerge	%f17,	%f19,	%f26
	orn	%l6,	0x0CBA,	%g2
	udiv	%o6,	0x06C7,	%l2
	tvs	%xcc,	0x4
	wr	%g0,	0xe2,	%asi
	stda	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4B] %asi,	%i7
	movrne	%l4,	0x38E,	%g6
	ldd	[%l7 + 0x70],	%f22
	membar	0x2C
	taddcctv	%i3,	%l1,	%g5
	mulx	%o5,	%o3,	%g1
	brgez,a	%l0,	loop_559
	bcs	loop_560
	tne	%xcc,	0x6
	fblg	%fcc0,	loop_561
loop_559:
	andcc	%i4,	%o2,	%i1
loop_560:
	andn	%l3,	0x1CFB,	%i5
	edge8ln	%g4,	%i6,	%i2
loop_561:
	smulcc	%l5,	0x0693,	%o7
	smulcc	%g3,	%i0,	%o1
	movcs	%xcc,	%o0,	%g7
	fpadd16s	%f15,	%f5,	%f19
	nop
	setx loop_562, %l0, %l1
	jmpl %l1, %l6
	addc	%g2,	%o6,	%l2
	movle	%xcc,	%i7,	%l4
	move	%xcc,	%g6,	%i3
loop_562:
	umulcc	%l1,	%g5,	%o5
	ba	loop_563
	fmovsge	%xcc,	%f28,	%f4
	sdivcc	%o3,	0x081D,	%o4
	orcc	%l0,	0x1D9F,	%g1
loop_563:
	sllx	%i4,	0x17,	%o2
	bl,a	%xcc,	loop_564
	bleu,a	loop_565
	movrne	%i1,	%l3,	%i5
	alignaddr	%i6,	%g4,	%l5
loop_564:
	orn	%i2,	%o7,	%g3
loop_565:
	tneg	%xcc,	0x4
	fmovsle	%xcc,	%f9,	%f16
	edge16	%o1,	%i0,	%o0
	edge8	%l6,	%g7,	%o6
	set	0x14, %o5
	ldswa	[%l7 + %o5] 0x10,	%g2
	mulscc	%i7,	%l4,	%g6
	tcs	%icc,	0x3
	alignaddrl	%i3,	%l1,	%l2
	orcc	%o5,	%o3,	%o4
	addccc	%g5,	%l0,	%g1
	alignaddr	%o2,	%i1,	%l3
	fnot2	%f20,	%f6
	set	0x14, %o4
	lda	[%l7 + %o4] 0x11,	%f8
	sethi	0x091F,	%i4
	udiv	%i5,	0x177B,	%g4
	move	%xcc,	%l5,	%i2
	andncc	%o7,	%i6,	%g3
	taddcctv	%o1,	%o0,	%l6
	mulscc	%g7,	%o6,	%g2
	edge16n	%i7,	%i0,	%g6
	andcc	%l4,	0x196F,	%l1
	and	%i3,	0x1E25,	%o5
	edge8ln	%o3,	%o4,	%g5
	edge8l	%l2,	%l0,	%o2
	ldsh	[%l7 + 0x62],	%g1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%l3
	fcmped	%fcc2,	%f16,	%f30
	movrgz	%i1,	0x1A7,	%i4
	and	%i5,	%g4,	%l5
	xnorcc	%i2,	0x09C5,	%o7
	ble	%xcc,	loop_566
	add	%i6,	0x0434,	%g3
	set	0x27, %g1
	ldstuba	[%l7 + %g1] 0x81,	%o0
loop_566:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l6,	%g7
	alignaddrl	%o1,	%g2,	%o6
	brgez	%i0,	loop_567
	tne	%icc,	0x1
	xor	%i7,	%l4,	%l1
	fmovsn	%xcc,	%f12,	%f3
loop_567:
	fble	%fcc1,	loop_568
	stx	%i3,	[%l7 + 0x78]
	move	%xcc,	%o5,	%o3
	mova	%xcc,	%o4,	%g5
loop_568:
	bl,a	loop_569
	movrlez	%l2,	0x3E8,	%l0
	movge	%icc,	%g6,	%o2
	fpackfix	%f10,	%f22
loop_569:
	fzeros	%f10
	addccc	%g1,	%l3,	%i1
	set	0x28, %i3
	stxa	%i5,	[%l7 + %i3] 0x23
	membar	#Sync
	orcc	%g4,	%i4,	%l5
	tpos	%xcc,	0x2
	edge8	%o7,	%i6,	%i2
	subccc	%o0,	0x0970,	%g3
	add	%g7,	0x0EE1,	%o1
	sethi	0x1B77,	%l6
	edge32n	%g2,	%i0,	%i7
	taddcc	%l4,	%l1,	%o6
	fxnors	%f7,	%f9,	%f31
	faligndata	%f8,	%f20,	%f10
	fmuld8sux16	%f17,	%f21,	%f30
	membar	0x01
	movg	%icc,	%o5,	%o3
	movcc	%icc,	%i3,	%o4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x37] %asi,	%g5
	orcc	%l0,	%g6,	%l2
	fcmpgt16	%f10,	%f12,	%g1
	subcc	%l3,	0x19FD,	%i1
	array32	%o2,	%i5,	%g4
	set	0x6C, %g5
	lda	[%l7 + %g5] 0x19,	%f0
	movne	%xcc,	%l5,	%o7
	sir	0x0DE0
	fmuld8sux16	%f11,	%f7,	%f28
	brnz,a	%i4,	loop_570
	flush	%l7 + 0x14
	movvs	%icc,	%i2,	%i6
	tpos	%xcc,	0x7
loop_570:
	fands	%f16,	%f16,	%f28
	xnor	%o0,	%g3,	%g7
	movrlz	%l6,	%o1,	%i0
	edge16n	%i7,	%g2,	%l1
	edge32l	%o6,	%l4,	%o5
	tg	%icc,	0x6
	sdivx	%i3,	0x1C85,	%o3
	andn	%o4,	%l0,	%g5
	stbar
	fpsub32	%f2,	%f0,	%f18
	movle	%xcc,	%g6,	%g1
	movneg	%xcc,	%l2,	%l3
	tne	%xcc,	0x5
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i1
	tg	%xcc,	0x2
	movge	%xcc,	%o2,	%g4
	addc	%l5,	%o7,	%i4
	ldub	[%l7 + 0x1B],	%i5
	fbl	%fcc3,	loop_571
	andn	%i2,	0x06E8,	%i6
	fmovsvc	%xcc,	%f19,	%f16
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x70] %asi,	%g3
loop_571:
	movrlez	%o0,	%g7,	%o1
	ldub	[%l7 + 0x7E],	%i0
	fmovrdgz	%l6,	%f18,	%f22
	edge16ln	%g2,	%i7,	%l1
	fsrc1s	%f0,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l4,	%o5
	movne	%icc,	%i3,	%o6
	or	%o4,	%l0,	%o3
	std	%f26,	[%l7 + 0x30]
	membar	0x06
	sdiv	%g6,	0x1B05,	%g5
	ta	%icc,	0x4
	array16	%l2,	%l3,	%g1
	tl	%icc,	0x7
	movg	%icc,	%i1,	%g4
	umul	%l5,	0x1E96,	%o7
	fmovrdlz	%o2,	%f2,	%f24
	movvc	%icc,	%i4,	%i5
	nop
	set	0x22, %o1
	ldstub	[%l7 + %o1],	%i2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f25
	fble	%fcc3,	loop_572
	edge8ln	%i6,	%g3,	%g7
	sdiv	%o0,	0x0D87,	%i0
	tsubcc	%o1,	%l6,	%g2
loop_572:
	subc	%l1,	%i7,	%l4
	fmovse	%icc,	%f5,	%f21
	movgu	%icc,	%i3,	%o6
	movpos	%icc,	%o4,	%o5
	tn	%xcc,	0x6
	movle	%xcc,	%l0,	%g6
	or	%o3,	0x0E08,	%g5
	movne	%icc,	%l2,	%g1
	tg	%xcc,	0x7
	movcs	%xcc,	%l3,	%g4
	tne	%xcc,	0x3
	movne	%xcc,	%l5,	%i1
	brnz	%o7,	loop_573
	andncc	%o2,	%i4,	%i2
	movre	%i5,	0x0D2,	%g3
	movg	%xcc,	%i6,	%g7
loop_573:
	movvc	%xcc,	%i0,	%o1
	fmul8ulx16	%f0,	%f28,	%f4
	edge8ln	%l6,	%o0,	%l1
	movneg	%icc,	%i7,	%g2
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
	wr	%g0,	0x89,	%asi
	sta	%f19,	[%l7 + 0x20] %asi
	wr	%g0,	0x11,	%asi
	stwa	%i3,	[%l7 + 0x2C] %asi
	srlx	%o4,	%o6,	%o5
	ldsh	[%l7 + 0x32],	%l0
	fmovdcc	%icc,	%f30,	%f21
	xnor	%o3,	%g6,	%l2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0A] %asi,	%g1
	stb	%l3,	[%l7 + 0x2A]
	movle	%icc,	%g4,	%l5
	andn	%g5,	0x0CAE,	%i1
	movne	%icc,	%o2,	%o7
	add	%i2,	%i4,	%i5
	movle	%xcc,	%g3,	%g7
	edge32ln	%i6,	%o1,	%i0
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f16
	fpsub32s	%f24,	%f27,	%f16
	tgu	%icc,	0x1
	bgu	loop_574
	te	%icc,	0x7
	bvc,pn	%xcc,	loop_575
	tvs	%xcc,	0x0
loop_574:
	bgu,a	loop_576
	addcc	%o0,	0x0DAE,	%l6
loop_575:
	bleu	%icc,	loop_577
	bge,pt	%icc,	loop_578
loop_576:
	sllx	%i7,	0x1D,	%g2
	fcmpgt16	%f0,	%f0,	%l1
loop_577:
	fcmpeq32	%f18,	%f2,	%l4
loop_578:
	edge8l	%o4,	%i3,	%o5
	umulcc	%o6,	0x08F3,	%o3
	subcc	%g6,	0x0AED,	%l0
	bn,pt	%icc,	loop_579
	nop
	setx	loop_580,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%l2,	0x2EA,	%l3
	bge	%icc,	loop_581
loop_579:
	edge8l	%g1,	%l5,	%g5
loop_580:
	sll	%i1,	0x0A,	%o2
	tgu	%icc,	0x3
loop_581:
	stx	%o7,	[%l7 + 0x48]
	array32	%i2,	%g4,	%i4
	addc	%i5,	0x0B76,	%g3
	wr	%g0,	0x10,	%asi
	stwa	%i6,	[%l7 + 0x18] %asi
	edge8l	%g7,	%i0,	%o1
	movn	%icc,	%l6,	%o0
	fpadd32	%f8,	%f22,	%f6
	movgu	%icc,	%g2,	%l1
	fmul8x16al	%f5,	%f1,	%f16
	membar	0x1F
	orncc	%i7,	%l4,	%o4
	tsubcc	%i3,	0x12DA,	%o5
	ldsh	[%l7 + 0x22],	%o6
	fcmpes	%fcc0,	%f26,	%f28
	movleu	%xcc,	%o3,	%l0
	fblg	%fcc0,	loop_582
	fmovdn	%xcc,	%f27,	%f22
	movrgz	%g6,	%l2,	%g1
	bvs	%xcc,	loop_583
loop_582:
	movrgz	%l5,	%g5,	%i1
	movre	%o2,	%l3,	%o7
	edge8	%i2,	%g4,	%i5
loop_583:
	fbe,a	%fcc3,	loop_584
	edge32	%i4,	%i6,	%g7
	fmovdg	%icc,	%f5,	%f29
	fmovrdlez	%g3,	%f8,	%f12
loop_584:
	swap	[%l7 + 0x60],	%i0
	movgu	%icc,	%l6,	%o0
	fbu,a	%fcc0,	loop_585
	tleu	%icc,	0x7
	udivcc	%o1,	0x1749,	%l1
	stbar
loop_585:
	andn	%g2,	0x00D5,	%l4
	alignaddr	%i7,	%o4,	%i3
	pdist	%f4,	%f2,	%f12
	fmovrsgez	%o5,	%f1,	%f25
	ldsw	[%l7 + 0x30],	%o6
	fbo,a	%fcc3,	loop_586
	edge32n	%l0,	%g6,	%l2
	fmul8sux16	%f8,	%f28,	%f30
	fmovsle	%icc,	%f9,	%f18
loop_586:
	movg	%xcc,	%o3,	%l5
	movgu	%icc,	%g5,	%i1
	fmul8x16au	%f14,	%f25,	%f0
	movcc	%icc,	%g1,	%o2
	array8	%o7,	%i2,	%g4
	edge32	%i5,	%i4,	%l3
	movrne	%g7,	%i6,	%i0
	bpos	%icc,	loop_587
	orncc	%g3,	0x1D3E,	%l6
	edge8l	%o0,	%o1,	%g2
	tgu	%icc,	0x1
loop_587:
	sub	%l4,	0x1082,	%l1
	fors	%f16,	%f19,	%f5
	fornot2s	%f9,	%f9,	%f3
	xnorcc	%o4,	0x1456,	%i7
	nop
	setx	loop_588,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%icc,	%o5,	%o6
	movcc	%icc,	%i3,	%l0
	fabss	%f22,	%f24
loop_588:
	fmovspos	%icc,	%f9,	%f0
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	orncc	%o3,	0x00E2,	%g6
	fmovdle	%icc,	%f15,	%f12
	subccc	%g5,	%i1,	%l5
	fnors	%f2,	%f0,	%f8
	membar	0x7E
	brlez	%g1,	loop_589
	tle	%icc,	0x3
	xnor	%o7,	0x1F1B,	%o2
	and	%g4,	0x17B4,	%i2
loop_589:
	bshuffle	%f8,	%f2,	%f0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x04,	%f0
	edge8l	%i5,	%i4,	%g7
	orn	%i6,	0x1F2D,	%l3
	fmovrsne	%g3,	%f8,	%f2
	alignaddrl	%l6,	%i0,	%o1
	ldsb	[%l7 + 0x4D],	%o0
	flush	%l7 + 0x08
	fnot2s	%f1,	%f15
	tvc	%xcc,	0x0
	movrlz	%g2,	0x02C,	%l4
	fexpand	%f0,	%f30
	edge8n	%o4,	%i7,	%l1
	fcmple16	%f20,	%f10,	%o6
	fmovrdlez	%o5,	%f2,	%f24
	fornot1	%f26,	%f22,	%f16
	smulcc	%l0,	0x1F36,	%l2
	umul	%i3,	0x19CC,	%o3
	stx	%g5,	[%l7 + 0x08]
	set	0x56, %i6
	stha	%g6,	[%l7 + %i6] 0x18
	fmovrdgez	%i1,	%f22,	%f10
	ta	%icc,	0x4
	addc	%g1,	%o7,	%l5
	mova	%icc,	%g4,	%i2
	movvs	%icc,	%i5,	%o2
	srl	%i4,	0x0F,	%g7
	lduh	[%l7 + 0x76],	%l3
	edge8	%i6,	%l6,	%i0
	popc	0x1AC2,	%g3
	udiv	%o1,	0x0D5F,	%g2
	fnot1s	%f24,	%f21
	tvs	%icc,	0x7
	fpack16	%f4,	%f28
	mova	%icc,	%l4,	%o4
	bgu,pt	%xcc,	loop_590
	fnand	%f6,	%f22,	%f2
	stx	%o0,	[%l7 + 0x48]
	fmovdge	%icc,	%f11,	%f10
loop_590:
	fsrc2s	%f30,	%f20
	set	0x2C, %g3
	ldsba	[%l7 + %g3] 0x81,	%i7
	edge16	%o6,	%o5,	%l1
	srax	%l2,	%i3,	%o3
	edge32n	%l0,	%g6,	%g5
	addc	%i1,	0x0E9E,	%g1
	fmovrslz	%o7,	%f1,	%f22
	tsubcctv	%g4,	0x0963,	%l5
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%i2
	mulx	%i5,	%o2,	%i4
	lduw	[%l7 + 0x0C],	%g7
	fsrc1s	%f6,	%f17
	fornot2	%f2,	%f10,	%f6
	fba,a	%fcc1,	loop_591
	movrgez	%l3,	%l6,	%i0
	srax	%i6,	0x05,	%g3
	sdivx	%o1,	0x11E3,	%g2
loop_591:
	fmovrslez	%l4,	%f11,	%f20
	udiv	%o4,	0x0F2E,	%i7
	andcc	%o0,	0x1868,	%o6
	fcmped	%fcc2,	%f6,	%f18
	bpos,pt	%icc,	loop_592
	movvs	%xcc,	%l1,	%l2
	fmuld8ulx16	%f9,	%f14,	%f18
	udivcc	%o5,	0x0ED4,	%o3
loop_592:
	tle	%icc,	0x3
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x17
	membar	#Sync
	xor	%l0,	%g6,	%g5
	andncc	%i3,	%i1,	%g1
	set	0x14, %l1
	lda	[%l7 + %l1] 0x15,	%f17
	fmul8x16al	%f12,	%f3,	%f28
	umulcc	%o7,	0x1018,	%g4
	smulcc	%l5,	0x193C,	%i2
	movrgz	%o2,	%i4,	%g7
	movrgz	%l3,	0x334,	%l6
	popc	%i5,	%i0
	fnegs	%f26,	%f13
	movcs	%xcc,	%g3,	%i6
	fandnot2s	%f5,	%f14,	%f28
	movleu	%icc,	%g2,	%l4
	nop
	setx loop_593, %l0, %l1
	jmpl %l1, %o4
	xnor	%i7,	%o1,	%o0
	fbug,a	%fcc0,	loop_594
	fmovdne	%icc,	%f17,	%f19
loop_593:
	fcmpgt16	%f14,	%f4,	%l1
	edge32n	%l2,	%o6,	%o3
loop_594:
	fmovrsgz	%o5,	%f1,	%f12
	swap	[%l7 + 0x60],	%l0
	mova	%xcc,	%g6,	%i3
	fcmpd	%fcc0,	%f8,	%f12
	tsubcc	%g5,	0x1B51,	%i1
	brlez,a	%g1,	loop_595
	std	%g4,	[%l7 + 0x20]
	sir	0x14B4
	mulx	%o7,	%l5,	%o2
loop_595:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%g7
	edge32	%l3,	%l6,	%i5
	sdiv	%i2,	0x0EDB,	%g3
	addc	%i0,	%i6,	%l4
	fnors	%f12,	%f4,	%f21
	fabsd	%f26,	%f22
	array32	%g2,	%o4,	%o1
	movrlez	%o0,	%i7,	%l1
	orn	%o6,	%o3,	%o5
	fmovspos	%xcc,	%f24,	%f24
	sdivx	%l2,	0x0B7A,	%l0
	srl	%i3,	%g6,	%i1
	edge8ln	%g1,	%g4,	%g5
	bpos,pn	%xcc,	loop_596
	fbge,a	%fcc0,	loop_597
	tcs	%icc,	0x0
	addccc	%o7,	0x0922,	%o2
loop_596:
	alignaddr	%l5,	%i4,	%l3
loop_597:
	fbule	%fcc2,	loop_598
	tcs	%icc,	0x0
	fmovrsne	%l6,	%f27,	%f0
	taddcc	%g7,	%i2,	%i5
loop_598:
	xnor	%g3,	%i6,	%i0
	tleu	%icc,	0x6
	fmovdgu	%xcc,	%f16,	%f7
	fmovda	%icc,	%f26,	%f19
	movge	%icc,	%g2,	%o4
	wr	%g0,	0xe3,	%asi
	stda	%l4,	[%l7 + 0x68] %asi
	membar	#Sync
	fmovda	%icc,	%f19,	%f5
	addccc	%o0,	%i7,	%l1
	fandnot2	%f20,	%f10,	%f2
	addc	%o6,	0x0B2F,	%o3
	edge16n	%o5,	%o1,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x2
	array32	%l2,	%g6,	%i1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g1
	sdiv	%g4,	0x1B4C,	%o7
	array8	%o2,	%l5,	%g5
	fmovscc	%xcc,	%f4,	%f15
	fblg	%fcc2,	loop_599
	mulx	%l3,	%l6,	%i4
	movgu	%icc,	%i2,	%i5
	edge32	%g3,	%i6,	%i0
loop_599:
	nop
	setx	loop_600,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%icc,	0x3
	membar	0x1C
	subcc	%g7,	0x0055,	%o4
loop_600:
	edge32ln	%g2,	%o0,	%i7
	mulscc	%l1,	0x10C5,	%o6
	taddcc	%l4,	%o5,	%o3
	addccc	%l0,	0x025E,	%o1
	flush	%l7 + 0x40
	movvs	%icc,	%g6,	%i1
	fblg	%fcc2,	loop_601
	edge8l	%i3,	%l2,	%g4
	call	loop_602
	flush	%l7 + 0x1C
loop_601:
	andncc	%o7,	%g1,	%l5
	movn	%icc,	%g5,	%o2
loop_602:
	movn	%xcc,	%l3,	%i4
	movle	%icc,	%i2,	%i5
	stx	%l6,	[%l7 + 0x68]
	xnor	%i6,	0x19A4,	%i0
	taddcctv	%g7,	0x0027,	%g3
	addccc	%o4,	0x1272,	%o0
	fbule,a	%fcc2,	loop_603
	fcmple32	%f2,	%f30,	%i7
	tle	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_603:
	movge	%xcc,	%l1,	%g2
	tleu	%icc,	0x0
	tne	%xcc,	0x2
	edge16n	%o6,	%o5,	%o3
	mova	%xcc,	%l4,	%l0
	bleu,a	%icc,	loop_604
	brz	%o1,	loop_605
	movcc	%icc,	%i1,	%g6
	movre	%l2,	0x0AA,	%i3
loop_604:
	fornot1s	%f1,	%f21,	%f25
loop_605:
	brgez,a	%g4,	loop_606
	edge8l	%o7,	%g1,	%l5
	movgu	%xcc,	%g5,	%o2
	movre	%i4,	%i2,	%i5
loop_606:
	orn	%l6,	0x164E,	%l3
	fmul8x16al	%f13,	%f22,	%f0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x16] %asi,	%i0
	lduh	[%l7 + 0x5A],	%g7
	nop
	setx	loop_607,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%g3,	%o4,	%i6
	fcmpgt32	%f16,	%f14,	%i7
	fmovdvs	%icc,	%f11,	%f28
loop_607:
	movneg	%xcc,	%l1,	%g2
	srlx	%o0,	%o5,	%o3
	xnorcc	%l4,	%o6,	%o1
	bl,a	loop_608
	movre	%l0,	0x333,	%g6
	tsubcctv	%l2,	0x09C7,	%i3
	movrne	%g4,	%i1,	%g1
loop_608:
	fmovrdgz	%l5,	%f12,	%f12
	fand	%f16,	%f28,	%f28
	ldx	[%l7 + 0x28],	%o7
	sir	0x1D1E
	set	0x38, %o3
	stda	%o2,	[%l7 + %o3] 0x19
	xorcc	%i4,	0x13C7,	%g5
	edge32	%i2,	%i5,	%l3
	nop
	setx	loop_609,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%i0,	%l6,	%g7
	brlz	%g3,	loop_610
	fpack32	%f12,	%f26,	%f18
loop_609:
	tgu	%xcc,	0x3
	tgu	%icc,	0x3
loop_610:
	sllx	%i6,	0x1C,	%i7
	edge16ln	%o4,	%g2,	%l1
	fnegd	%f12,	%f6
	call	loop_611
	fnors	%f12,	%f26,	%f26
	orncc	%o5,	0x00DD,	%o0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x51] %asi,	%l4
loop_611:
	ld	[%l7 + 0x28],	%f11
	edge16l	%o3,	%o6,	%o1
	fbo	%fcc2,	loop_612
	movrlez	%l0,	%g6,	%i3
	fmovdl	%xcc,	%f8,	%f30
	add	%l2,	0x17D7,	%g4
loop_612:
	smulcc	%g1,	%l5,	%i1
	addccc	%o2,	%o7,	%i4
	fmovda	%xcc,	%f23,	%f11
	taddcctv	%i2,	%g5,	%i5
	sethi	0x031D,	%l3
	fzeros	%f7
	sub	%l6,	%i0,	%g3
	ta	%xcc,	0x1
	edge32l	%i6,	%i7,	%o4
	smul	%g2,	%g7,	%o5
	sdiv	%o0,	0x0044,	%l1
	tvs	%icc,	0x0
	fors	%f10,	%f7,	%f0
	fbul	%fcc3,	loop_613
	alignaddrl	%o3,	%o6,	%o1
	fmovrdne	%l0,	%f22,	%f6
	movneg	%xcc,	%g6,	%l4
loop_613:
	te	%icc,	0x1
	sdiv	%i3,	0x0C02,	%g4
	fone	%f28
	fsrc2	%f6,	%f0
	bcc,a,pt	%icc,	loop_614
	brlez	%l2,	loop_615
	srax	%g1,	0x1C,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_614:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_615:
	ldstub	[%l7 + 0x47],	%o2
	fabsd	%f16,	%f14
	fpsub32	%f4,	%f6,	%f28
	ldsh	[%l7 + 0x3E],	%o7
	brlz,a	%i4,	loop_616
	fmovsge	%xcc,	%f0,	%f29
	movle	%xcc,	%i2,	%g5
	fbge	%fcc1,	loop_617
loop_616:
	smulcc	%i5,	0x10B5,	%l5
	lduw	[%l7 + 0x4C],	%l3
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x62] %asi,	%i0
loop_617:
	udivx	%l6,	0x0E2B,	%i6
	umulcc	%g3,	%i7,	%o4
	taddcctv	%g2,	%o5,	%g7
	edge8ln	%l1,	%o3,	%o0
	ldd	[%l7 + 0x58],	%f18
	tsubcc	%o1,	%o6,	%l0
	orncc	%g6,	%l4,	%g4
	movneg	%xcc,	%l2,	%g1
	movgu	%icc,	%i3,	%o2
	fmovsneg	%xcc,	%f6,	%f4
	and	%i1,	0x08E5,	%o7
	addc	%i2,	0x0CD4,	%i4
	bne,a,pt	%xcc,	loop_618
	udivcc	%i5,	0x00F6,	%l5
	udiv	%g5,	0x14F7,	%i0
	movcc	%icc,	%l3,	%i6
loop_618:
	nop
	set	0x58, %i1
	swapa	[%l7 + %i1] 0x18,	%g3
	fbne	%fcc2,	loop_619
	ldub	[%l7 + 0x6B],	%i7
	umul	%l6,	%o4,	%g2
	bne	loop_620
loop_619:
	fbul,a	%fcc3,	loop_621
	andncc	%g7,	%l1,	%o5
	sdiv	%o0,	0x06FB,	%o3
loop_620:
	fble,a	%fcc2,	loop_622
loop_621:
	fmovrse	%o6,	%f1,	%f10
	brlez	%l0,	loop_623
	fmovsle	%xcc,	%f21,	%f26
loop_622:
	fornot2s	%f21,	%f3,	%f28
	tvc	%xcc,	0x3
loop_623:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g6
	mova	%icc,	%o1,	%g4
	fnegd	%f28,	%f14
	fnand	%f18,	%f20,	%f26
	mova	%xcc,	%l2,	%l4
	fpsub16	%f14,	%f20,	%f18
	sll	%i3,	%o2,	%g1
	andcc	%o7,	0x15ED,	%i1
	movn	%icc,	%i4,	%i5
	smulcc	%l5,	%g5,	%i0
	set	0x78, %l3
	ldstuba	[%l7 + %l3] 0x10,	%i2
	andncc	%l3,	%i6,	%g3
	tsubcctv	%l6,	%o4,	%g2
	addc	%i7,	%g7,	%l1
	edge16	%o5,	%o3,	%o0
	edge8l	%l0,	%g6,	%o6
	udiv	%o1,	0x12AB,	%g4
	stbar
	and	%l2,	0x0F26,	%l4
	bpos	%xcc,	loop_624
	movrlez	%o2,	0x086,	%i3
	movvc	%icc,	%o7,	%g1
	ldd	[%l7 + 0x38],	%f4
loop_624:
	edge8	%i1,	%i5,	%l5
	fbge	%fcc2,	loop_625
	edge32ln	%i4,	%g5,	%i2
	udivcc	%l3,	0x0BAC,	%i6
	sir	0x0B41
loop_625:
	edge8l	%i0,	%g3,	%o4
	alignaddr	%g2,	%i7,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f31,	%f16
	srlx	%l1,	%l6,	%o5
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	stx	%o0,	[%l7 + 0x28]
	bneg,pt	%xcc,	loop_626
	sra	%o3,	%l0,	%o6
	fble	%fcc2,	loop_627
	movl	%icc,	%g6,	%g4
loop_626:
	taddcctv	%o1,	%l2,	%l4
	movgu	%icc,	%i3,	%o2
loop_627:
	bl	loop_628
	ldsb	[%l7 + 0x51],	%g1
	tgu	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_628:
	fmovdg	%xcc,	%f11,	%f3
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x0c,	%o7
	fmovsge	%xcc,	%f23,	%f11
	fbu,a	%fcc0,	loop_629
	tleu	%xcc,	0x1
	movrgez	%i1,	0x07A,	%i5
	movn	%icc,	%l5,	%g5
loop_629:
	movrne	%i2,	0x385,	%l3
	set	0x22, %i4
	stha	%i6,	[%l7 + %i4] 0x11
	umul	%i0,	%g3,	%i4
	movcs	%icc,	%g2,	%o4
	array8	%i7,	%l1,	%l6
	fmovse	%icc,	%f19,	%f16
	ta	%xcc,	0x0
	tsubcc	%g7,	%o0,	%o3
	addc	%l0,	0x0EA8,	%o5
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	setx loop_630, %l0, %l1
	jmpl %l1, %g6
	tneg	%icc,	0x2
	nop
	set	0x30, %o0
	prefetch	[%l7 + %o0],	 0x0
	movre	%o6,	0x3AB,	%o1
loop_630:
	andncc	%l2,	%l4,	%i3
	te	%xcc,	0x2
	movvc	%xcc,	%g4,	%g1
	fmovrsgez	%o7,	%f2,	%f27
	sdivcc	%o2,	0x1C33,	%i1
	fbue	%fcc3,	loop_631
	andcc	%l5,	0x0DFE,	%g5
	fpsub32s	%f15,	%f19,	%f28
	fmovdn	%icc,	%f11,	%f19
loop_631:
	edge32n	%i2,	%i5,	%i6
	movle	%xcc,	%l3,	%i0
	ldsh	[%l7 + 0x0E],	%i4
	smul	%g2,	%g3,	%o4
	smul	%i7,	%l1,	%g7
	tgu	%xcc,	0x0
	set	0x68, %l0
	swapa	[%l7 + %l0] 0x11,	%l6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2A] %asi,	%o3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	fpadd32s	%f19,	%f3,	%f4
	popc	%o0,	%g6
	add	%o5,	%o6,	%l2
	xorcc	%o1,	0x1DE3,	%i3
	nop
	setx loop_632, %l0, %l1
	jmpl %l1, %l4
	udivcc	%g1,	0x075E,	%o7
	orcc	%o2,	%i1,	%g4
	taddcc	%g5,	%l5,	%i2
loop_632:
	edge16	%i6,	%i5,	%i0
	set	0x60, %l2
	lduwa	[%l7 + %l2] 0x0c,	%l3
	edge16n	%i4,	%g3,	%g2
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x19] %asi,	%l1
	fbe	%fcc0,	loop_633
	fsrc2	%f22,	%f10
	tcc	%icc,	0x3
	movneg	%xcc,	%o4,	%l6
loop_633:
	nop
	wr	%g0,	0x10,	%asi
	stda	%o2,	[%l7 + 0x28] %asi
	movcs	%icc,	%g7,	%o0
	tle	%icc,	0x4
	fnegs	%f20,	%f4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%g6
	alignaddrl	%o5,	%l2,	%o1
	pdist	%f30,	%f6,	%f18
	fornot1s	%f1,	%f11,	%f22
	tn	%xcc,	0x1
	array16	%i3,	%l4,	%o6
	popc	%g1,	%o2
	fcmpne32	%f12,	%f10,	%i1
	subc	%g4,	0x1026,	%g5
	fmovrsgz	%l5,	%f21,	%f13
	fmovde	%xcc,	%f1,	%f31
	movvc	%xcc,	%i2,	%o7
	set	0x1C, %g7
	ldsha	[%l7 + %g7] 0x80,	%i5
	fexpand	%f19,	%f6
	tge	%xcc,	0x5
	set	0x5A, %i7
	ldsha	[%l7 + %i7] 0x19,	%i0
	addccc	%i6,	0x14C4,	%l3
	fmovrdlez	%g3,	%f28,	%f8
	std	%i4,	[%l7 + 0x20]
	fmovdle	%icc,	%f26,	%f19
	tsubcc	%i7,	%l1,	%o4
	array8	%g2,	%o3,	%g7
	sll	%l6,	0x17,	%o0
	fnot2s	%f3,	%f17
	edge16l	%g6,	%l0,	%o5
	tcs	%xcc,	0x2
	tpos	%xcc,	0x6
	popc	0x04FB,	%o1
	fcmpne16	%f6,	%f22,	%i3
	movvs	%xcc,	%l2,	%o6
	call	loop_634
	fand	%f18,	%f16,	%f0
	ldub	[%l7 + 0x36],	%g1
	bge	loop_635
loop_634:
	tg	%xcc,	0x5
	fsrc1s	%f26,	%f27
	pdist	%f22,	%f4,	%f6
loop_635:
	sdivx	%o2,	0x015C,	%l4
	add	%g4,	%g5,	%i1
	fones	%f8
	fmovsvs	%icc,	%f5,	%f0
	sdivx	%i2,	0x1B18,	%l5
	std	%o6,	[%l7 + 0x60]
	edge32n	%i5,	%i0,	%i6
	fbg,a	%fcc1,	loop_636
	sdivx	%l3,	0x068B,	%i4
	faligndata	%f16,	%f26,	%f10
	fmovdvs	%icc,	%f0,	%f5
loop_636:
	stbar
	sra	%g3,	%l1,	%i7
	movl	%icc,	%g2,	%o3
	wr	%g0,	0x23,	%asi
	stha	%o4,	[%l7 + 0x36] %asi
	membar	#Sync
	fone	%f4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%l6
	brgz,a	%o0,	loop_637
	fmovrdne	%g7,	%f20,	%f6
	xorcc	%g6,	%l0,	%o1
	fandnot2	%f0,	%f2,	%f20
loop_637:
	ldx	[%l7 + 0x48],	%o5
	set	0x36, %o7
	lduba	[%l7 + %o7] 0x18,	%l2
	bn,a	%xcc,	loop_638
	sra	%i3,	%o6,	%o2
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g1
loop_638:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x26] %asi,	%l4
	fcmpeq16	%f30,	%f14,	%g5
	udivcc	%i1,	0x02E9,	%i2
	movn	%icc,	%l5,	%o7
	sub	%i5,	0x04D8,	%g4
	wr	%g0,	0x10,	%asi
	sta	%f31,	[%l7 + 0x20] %asi
	sir	0x18D8
	fbul,a	%fcc1,	loop_639
	stx	%i0,	[%l7 + 0x18]
	fxnors	%f4,	%f9,	%f16
	fmovsl	%xcc,	%f11,	%f18
loop_639:
	fmovrslz	%i6,	%f9,	%f13
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16ln	%l3,	%i4,	%l1
	tsubcc	%g3,	0x1989,	%i7
	movgu	%xcc,	%o3,	%g2
	fpsub16s	%f10,	%f24,	%f13
	fandnot1	%f22,	%f4,	%f12
	array8	%l6,	%o0,	%g7
	movl	%xcc,	%o4,	%l0
	tleu	%icc,	0x5
	ba,pt	%xcc,	loop_640
	tge	%icc,	0x4
	movcc	%icc,	%o1,	%g6
	tleu	%xcc,	0x7
loop_640:
	nop
	wr	%g0,	0x23,	%asi
	stda	%l2,	[%l7 + 0x20] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2E] %asi,	%i3
	array8	%o5,	%o6,	%g1
	edge32	%l4,	%g5,	%i1
	or	%i2,	0x1EB1,	%l5
	std	%f22,	[%l7 + 0x48]
	xnor	%o7,	0x0E2D,	%o2
	srl	%i5,	%i0,	%i6
	tgu	%xcc,	0x6
	fmovscc	%xcc,	%f7,	%f24
	subc	%l3,	%g4,	%l1
	nop
	setx	loop_641,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%icc,	0x5
	fandnot1s	%f1,	%f26,	%f30
	udivx	%g3,	0x0D45,	%i7
loop_641:
	prefetch	[%l7 + 0x4C],	 0x3
	fpadd16s	%f23,	%f12,	%f21
	addc	%i4,	%o3,	%g2
	tneg	%icc,	0x0
	stb	%o0,	[%l7 + 0x7D]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x19
	srax	%g7,	0x1B,	%l6
	tn	%icc,	0x0
	ldsh	[%l7 + 0x40],	%o4
	orcc	%o1,	0x1277,	%g6
	movre	%l0,	%i3,	%l2
	ldd	[%l7 + 0x18],	%f18
	sdivx	%o5,	0x0652,	%o6
	udiv	%g1,	0x0C62,	%l4
	andncc	%i1,	%i2,	%l5
	set	0x20, %l4
	swapa	[%l7 + %l4] 0x89,	%o7
	fbg,a	%fcc1,	loop_642
	orncc	%o2,	%g5,	%i5
	sdivx	%i0,	0x0BF0,	%l3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x65] %asi,	%g4
loop_642:
	fandnot2	%f0,	%f8,	%f22
	edge16	%i6,	%g3,	%i7
	tleu	%icc,	0x2
	fnot1	%f14,	%f6
	tge	%xcc,	0x2
	fmovdvc	%icc,	%f0,	%f26
	addcc	%i4,	%l1,	%o3
	st	%f28,	[%l7 + 0x64]
	edge32ln	%g2,	%g7,	%l6
	mulscc	%o0,	0x1768,	%o1
	sub	%g6,	%o4,	%i3
	srl	%l0,	0x15,	%o5
	sdivx	%l2,	0x07E9,	%g1
	sllx	%l4,	%o6,	%i2
	sra	%i1,	%l5,	%o2
	ldx	[%l7 + 0x38],	%g5
	wr	%g0,	0x23,	%asi
	stba	%i5,	[%l7 + 0x27] %asi
	membar	#Sync
	edge32n	%o7,	%l3,	%i0
	andn	%i6,	0x03FE,	%g4
	movge	%icc,	%i7,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g3
	ta	%xcc,	0x1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g7
	udivx	%l6,	0x0F42,	%o0
	movrne	%o1,	%g2,	%g6
	membar	0x63
	array32	%i3,	%o4,	%l0
	fcmpes	%fcc3,	%f25,	%f26
	fbug,a	%fcc0,	loop_643
	fmovrdgz	%o5,	%f26,	%f4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%g0
loop_643:
	fmul8x16au	%f5,	%f29,	%f20
	fsrc1s	%f0,	%f12
	fmovdgu	%xcc,	%f15,	%f1
	sra	%l2,	0x05,	%o6
	fornot2s	%f26,	%f20,	%f7
	ldstub	[%l7 + 0x53],	%l4
	tsubcc	%i2,	0x0EC4,	%l5
	set	0x78, %o6
	stwa	%i1,	[%l7 + %o6] 0xea
	membar	#Sync
	edge16ln	%g5,	%i5,	%o7
	fcmpeq32	%f14,	%f6,	%l3
	taddcc	%o2,	%i6,	%i0
	ta	%icc,	0x0
	xor	%i7,	0x11C3,	%g4
	addcc	%i4,	%l1,	%g3
	fnot1	%f14,	%f0
	tvs	%icc,	0x5
	tpos	%xcc,	0x4
	st	%f27,	[%l7 + 0x78]
	fpsub32s	%f8,	%f31,	%f10
	srlx	%o3,	%l6,	%g7
	subcc	%o1,	0x13F2,	%g2
	sethi	0x1F31,	%o0
	fmovda	%xcc,	%f3,	%f9
	fmovdpos	%icc,	%f20,	%f5
	edge32ln	%g6,	%i3,	%l0
	set	0x48, %o2
	stda	%o4,	[%l7 + %o2] 0x2a
	membar	#Sync
	movneg	%xcc,	%o5,	%g1
	bvc	%xcc,	loop_644
	tcs	%icc,	0x5
	membar	0x38
	orn	%l2,	0x063F,	%l4
loop_644:
	brnz	%i2,	loop_645
	brgz,a	%o6,	loop_646
	movge	%icc,	%i1,	%g5
	udiv	%l5,	0x012B,	%i5
loop_645:
	edge16ln	%o7,	%l3,	%i6
loop_646:
	fones	%f7
	stw	%i0,	[%l7 + 0x08]
	set	0x1D, %i2
	ldstuba	[%l7 + %i2] 0x04,	%o2
	stbar
	addccc	%g4,	%i7,	%i4
	membar	0x01
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l1
	srl	%o3,	%g3,	%g7
	smulcc	%o1,	0x02CA,	%g2
	fnors	%f10,	%f24,	%f4
	orcc	%l6,	0x051D,	%o0
	bn,pn	%icc,	loop_647
	tle	%icc,	0x2
	tl	%icc,	0x2
	set	0x48, %o5
	stwa	%g6,	[%l7 + %o5] 0xea
	membar	#Sync
loop_647:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	edge32	%o4,	%l0,	%o5
	fors	%f23,	%f26,	%f29
	movrgz	%l2,	0x014,	%g1
	fmovscs	%xcc,	%f2,	%f23
	fmovd	%f22,	%f0
	tne	%xcc,	0x2
	fmul8x16au	%f0,	%f26,	%f12
	sllx	%l4,	0x1A,	%o6
	brlez	%i1,	loop_648
	tgu	%xcc,	0x4
	fpackfix	%f4,	%f3
	fmovsgu	%icc,	%f9,	%f14
loop_648:
	tneg	%icc,	0x3
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x10
	fbne,a	%fcc2,	loop_649
	udivx	%g5,	0x0A0C,	%l5
	membar	0x55
	tleu	%icc,	0x4
loop_649:
	edge8ln	%i5,	%o7,	%i2
	ta	%xcc,	0x3
	sir	0x12FD
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x18] %asi,	%l3
	nop
	set	0x32, %l5
	ldub	[%l7 + %l5],	%i6
	addcc	%o2,	0x00E6,	%g4
	andncc	%i7,	%i4,	%i0
	fmovrde	%o3,	%f2,	%f4
	movgu	%xcc,	%g3,	%g7
	fpadd16s	%f22,	%f20,	%f30
	fbul	%fcc3,	loop_650
	xnorcc	%l1,	0x0EBD,	%o1
	ta	%xcc,	0x0
	fmul8sux16	%f8,	%f26,	%f14
loop_650:
	fandnot1s	%f13,	%f13,	%f26
	set	0x3A, %g1
	lduba	[%l7 + %g1] 0x89,	%g2
	xnor	%o0,	%l6,	%i3
	subccc	%o4,	%g6,	%l0
	popc	0x05D7,	%o5
	umulcc	%g1,	0x1414,	%l4
	fmovsgu	%icc,	%f11,	%f14
	udivcc	%l2,	0x0B57,	%i1
	fand	%f18,	%f12,	%f12
	alignaddrl	%o6,	%l5,	%g5
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x7C] %asi,	%f11
	bneg,a,pt	%xcc,	loop_651
	udivx	%i5,	0x1C10,	%i2
	subc	%l3,	0x1CD3,	%i6
	std	%o6,	[%l7 + 0x48]
loop_651:
	tgu	%xcc,	0x6
	nop
	setx loop_652, %l0, %l1
	jmpl %l1, %o2
	ta	%xcc,	0x0
	taddcctv	%i7,	0x0869,	%i4
	set	0x2A, %g5
	ldsha	[%l7 + %g5] 0x0c,	%i0
loop_652:
	fones	%f27
	udiv	%o3,	0x0582,	%g4
	edge8l	%g7,	%g3,	%l1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o1,	%g2
	xnor	%l6,	%i3,	%o0
	array32	%o4,	%l0,	%g6
	movg	%icc,	%g1,	%l4
	fbule,a	%fcc0,	loop_653
	fmuld8ulx16	%f17,	%f29,	%f10
	or	%l2,	0x0A6A,	%i1
	fmovd	%f30,	%f30
loop_653:
	nop
	setx	loop_654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%xcc,	%o6,	%l5
	bge	loop_655
	for	%f12,	%f18,	%f18
loop_654:
	srlx	%o5,	0x15,	%i5
	fmovdvc	%xcc,	%f20,	%f1
loop_655:
	movcc	%xcc,	%i2,	%g5
	andn	%l3,	0x0C37,	%i6
	sra	%o2,	%o7,	%i7
	fbl	%fcc0,	loop_656
	subccc	%i4,	%o3,	%i0
	te	%icc,	0x7
	tneg	%icc,	0x1
loop_656:
	fpack32	%f0,	%f2,	%f24
	brlez,a	%g4,	loop_657
	nop
	setx	loop_658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%g3,	%l1,	%g7
	fbug,a	%fcc3,	loop_659
loop_657:
	tcs	%xcc,	0x0
loop_658:
	bpos,a	%xcc,	loop_660
	fbue	%fcc0,	loop_661
loop_659:
	pdist	%f14,	%f14,	%f22
	movgu	%icc,	%g2,	%o1
loop_660:
	fpadd16s	%f19,	%f24,	%f0
loop_661:
	brz,a	%l6,	loop_662
	sethi	0x0369,	%i3
	addcc	%o4,	0x100F,	%o0
	fpsub32s	%f7,	%f16,	%f1
loop_662:
	tn	%icc,	0x7
	umulcc	%l0,	0x1442,	%g6
	fcmpeq16	%f26,	%f14,	%g1
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l4
	bneg,a,pt	%xcc,	loop_663
	taddcctv	%l2,	0x024D,	%i1
	taddcc	%o6,	0x0D2E,	%l5
	fmovrse	%o5,	%f6,	%f19
loop_663:
	fpsub16s	%f15,	%f16,	%f10
	sdivx	%i5,	0x0ED7,	%g5
	set	0x28, %o1
	stwa	%l3,	[%l7 + %o1] 0x14
	smulcc	%i2,	0x0454,	%o2
	wr	%g0,	0x2b,	%asi
	stha	%i6,	[%l7 + 0x1A] %asi
	membar	#Sync
	stx	%o7,	[%l7 + 0x70]
	fnot1s	%f2,	%f25
	array16	%i4,	%i7,	%i0
	edge8ln	%o3,	%g4,	%g3
	addcc	%g7,	%l1,	%o1
	brlz	%l6,	loop_664
	fmovrde	%i3,	%f2,	%f10
	edge16l	%g2,	%o4,	%l0
	fabss	%f20,	%f20
loop_664:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%g6
	movvs	%xcc,	%g1,	%l4
	tcs	%xcc,	0x3
	umulcc	%l2,	0x18C0,	%i1
	srl	%o0,	0x00,	%o6
	nop
	setx	loop_665,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbne	%fcc3,	loop_666
	ldstub	[%l7 + 0x0D],	%o5
	orncc	%l5,	0x16C0,	%i5
loop_665:
	xor	%g5,	%i2,	%o2
loop_666:
	movgu	%icc,	%l3,	%o7
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x19
	movvs	%xcc,	%i4,	%i7
	siam	0x0
	fpmerge	%f6,	%f0,	%f0
	fxor	%f12,	%f18,	%f30
	stb	%i0,	[%l7 + 0x36]
	movcs	%xcc,	%o3,	%i6
	stbar
	sra	%g4,	%g7,	%g3
	tn	%xcc,	0x4
	fmovrsgz	%l1,	%f14,	%f0
	wr	%g0,	0x81,	%asi
	sta	%f2,	[%l7 + 0x08] %asi
	fbue,a	%fcc3,	loop_667
	movpos	%xcc,	%o1,	%l6
	movre	%i3,	%o4,	%g2
	fba	%fcc1,	loop_668
loop_667:
	nop
	setx	loop_669,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%g6,	0x1274,	%g1
	fbule,a	%fcc3,	loop_670
loop_668:
	mova	%icc,	%l0,	%l2
loop_669:
	udivx	%i1,	0x09C1,	%o0
	membar	0x6E
loop_670:
	andcc	%l4,	%o5,	%o6
	std	%l4,	[%l7 + 0x30]
	fmovsl	%icc,	%f26,	%f30
	bleu,a,pn	%icc,	loop_671
	fmovsneg	%xcc,	%f16,	%f9
	set	0x5C, %i3
	stba	%g5,	[%l7 + %i3] 0x81
loop_671:
	tcc	%icc,	0x2
	edge32ln	%i2,	%o2,	%i5
	movl	%xcc,	%o7,	%i4
	fandnot1	%f2,	%f0,	%f14
	flush	%l7 + 0x0C
	tsubcc	%l3,	%i7,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x4
	edge32n	%i6,	%i0,	%g4
	ba,a,pn	%xcc,	loop_672
	fmovsge	%xcc,	%f31,	%f28
	alignaddrl	%g3,	%g7,	%o1
	move	%icc,	%l1,	%l6
loop_672:
	sra	%i3,	0x05,	%o4
	sllx	%g6,	0x1D,	%g1
	tleu	%icc,	0x7
	tg	%icc,	0x6
	addcc	%g2,	0x0EB2,	%l2
	xorcc	%i1,	%l0,	%l4
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%f16
	orn	%o0,	%o6,	%l5
	addcc	%g5,	%i2,	%o5
	move	%icc,	%o2,	%o7
	srl	%i4,	0x17,	%i5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%l3
	addcc	%i7,	0x0413,	%o3
	set	0x47, %i6
	ldsba	[%l7 + %i6] 0x89,	%i6
	fmovsl	%icc,	%f19,	%f2
	addccc	%g4,	0x1FC9,	%g3
	addc	%i0,	0x0BAC,	%g7
	fmovdpos	%xcc,	%f18,	%f4
	lduh	[%l7 + 0x6E],	%l1
	udivx	%o1,	0x1321,	%l6
	sethi	0x1BB3,	%i3
	movrlez	%o4,	0x0E8,	%g1
	subc	%g6,	%g2,	%l2
	edge32l	%i1,	%l4,	%o0
	fpsub16s	%f7,	%f21,	%f11
	fmul8x16au	%f17,	%f29,	%f22
	edge32	%o6,	%l5,	%l0
	movcc	%xcc,	%i2,	%g5
	tcs	%xcc,	0x3
	stw	%o2,	[%l7 + 0x30]
	udivcc	%o5,	0x05B0,	%o7
	sra	%i4,	%i5,	%i7
	std	%f18,	[%l7 + 0x08]
	move	%icc,	%o3,	%i6
	subc	%g4,	0x1CED,	%g3
	te	%xcc,	0x3
	movl	%xcc,	%i0,	%l3
	fmovscc	%icc,	%f21,	%f28
	fsrc1	%f26,	%f30
	fmovse	%xcc,	%f29,	%f3
	movgu	%icc,	%g7,	%o1
	fnot1	%f6,	%f8
	fpadd16	%f0,	%f0,	%f6
	alignaddrl	%l1,	%i3,	%l6
	brnz	%o4,	loop_673
	fcmpgt16	%f6,	%f4,	%g1
	tvs	%icc,	0x4
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_673:
	sdivx	%g2,	0x1D7E,	%g6
	addcc	%i1,	0x00C6,	%l2
	movn	%icc,	%l4,	%o6
	umul	%l5,	0x1B2C,	%l0
	swap	[%l7 + 0x0C],	%o0
	smulcc	%g5,	%i2,	%o5
	fpadd32	%f10,	%f22,	%f10
	tcs	%icc,	0x5
	fmovrdgz	%o2,	%f4,	%f24
	fnot2s	%f1,	%f31
	movle	%icc,	%i4,	%i5
	movn	%icc,	%o7,	%i7
	fone	%f18
	srl	%i6,	%g4,	%g3
	movge	%xcc,	%i0,	%o3
	fpadd32	%f6,	%f2,	%f2
	fcmpne16	%f10,	%f30,	%l3
	edge16	%g7,	%o1,	%i3
	tcc	%xcc,	0x2
	ta	%icc,	0x4
	mova	%xcc,	%l6,	%o4
	smulcc	%g1,	0x0F2F,	%l1
	membar	0x49
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x21] %asi,	%g2
	srlx	%i1,	0x19,	%g6
	edge16ln	%l4,	%o6,	%l5
	fmovsg	%xcc,	%f1,	%f25
	fpack32	%f18,	%f24,	%f30
	fcmple16	%f12,	%f16,	%l0
	faligndata	%f2,	%f22,	%f6
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	std	%o0,	[%l7 + 0x48]
	wr	%g0,	0x88,	%asi
	stwa	%g5,	[%l7 + 0x30] %asi
	bpos,a	loop_674
	ldstub	[%l7 + 0x54],	%l2
	fand	%f12,	%f8,	%f14
	be,a	%icc,	loop_675
loop_674:
	movle	%xcc,	%i2,	%o5
	fxnors	%f23,	%f31,	%f18
	bn,a,pn	%xcc,	loop_676
loop_675:
	bge	loop_677
	mova	%xcc,	%i4,	%o2
	and	%o7,	%i7,	%i5
loop_676:
	tleu	%xcc,	0x7
loop_677:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g4
	subccc	%i6,	%i0,	%g3
	subccc	%o3,	%g7,	%l3
	popc	0x1C8F,	%i3
	fmovsgu	%xcc,	%f0,	%f13
	fmovsgu	%xcc,	%f15,	%f11
	movrgez	%l6,	0x3D5,	%o1
	fmovdn	%icc,	%f31,	%f17
	edge16ln	%g1,	%o4,	%l1
	movvs	%icc,	%i1,	%g2
	ldx	[%l7 + 0x10],	%l4
	fbn	%fcc0,	loop_678
	udivx	%g6,	0x15FC,	%o6
	bg	loop_679
	nop
	setx	loop_680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_678:
	fexpand	%f11,	%f8
	addccc	%l0,	%l5,	%g5
loop_679:
	smulcc	%l2,	0x128F,	%o0
loop_680:
	nop
	set	0x46, %g3
	lduha	[%l7 + %g3] 0x88,	%o5
	tpos	%xcc,	0x4
	nop
	set	0x31, %g4
	stb	%i4,	[%l7 + %g4]
	pdist	%f30,	%f22,	%f4
	fand	%f6,	%f2,	%f14
	edge32	%o2,	%o7,	%i7
	bneg	loop_681
	taddcc	%i2,	%i5,	%i6
	orncc	%g4,	%g3,	%i0
	fsrc2	%f6,	%f18
loop_681:
	movrne	%g7,	0x3C7,	%o3
	ldub	[%l7 + 0x4D],	%l3
	fandnot1s	%f1,	%f18,	%f21
	fmul8sux16	%f30,	%f22,	%f20
	fpmerge	%f14,	%f28,	%f24
	fbu,a	%fcc2,	loop_682
	swap	[%l7 + 0x14],	%i3
	fabss	%f17,	%f9
	edge8	%l6,	%g1,	%o1
loop_682:
	array32	%o4,	%i1,	%l1
	fmovdpos	%icc,	%f0,	%f26
	ta	%icc,	0x2
	alignaddrl	%g2,	%l4,	%g6
	taddcc	%o6,	%l5,	%g5
	fors	%f21,	%f8,	%f29
	or	%l0,	%o0,	%o5
	fcmpgt32	%f14,	%f6,	%l2
	ldsb	[%l7 + 0x6F],	%i4
	swap	[%l7 + 0x0C],	%o2
	andn	%i7,	0x1C36,	%o7
	stb	%i5,	[%l7 + 0x65]
	brlz,a	%i2,	loop_683
	edge32	%g4,	%i6,	%g3
	edge16	%i0,	%o3,	%g7
	taddcc	%l3,	%i3,	%g1
loop_683:
	addccc	%o1,	0x0030,	%l6
	addc	%o4,	%i1,	%l1
	membar	0x47
	sub	%g2,	%g6,	%l4
	movrgz	%l5,	0x1E6,	%g5
	std	%f16,	[%l7 + 0x48]
	fands	%f5,	%f13,	%f30
	movrgz	%l0,	0x14D,	%o6
	sth	%o5,	[%l7 + 0x52]
	udivx	%l2,	0x1B8E,	%o0
	ldsh	[%l7 + 0x5C],	%o2
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x15
	ldd	[%l7 + 0x68],	%f8
	movrgz	%i7,	0x351,	%i4
	umulcc	%o7,	%i2,	%i5
	edge16ln	%g4,	%i6,	%g3
	fzeros	%f21
	bne,a	%xcc,	loop_684
	tvc	%xcc,	0x5
	fmovdcc	%xcc,	%f11,	%f25
	ldsb	[%l7 + 0x36],	%o3
loop_684:
	and	%g7,	%i0,	%i3
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x14,	 0x3
	tg	%icc,	0x0
	nop
	setx loop_685, %l0, %l1
	jmpl %l1, %g1
	movvc	%xcc,	%o1,	%l6
	sllx	%o4,	%i1,	%l1
	movcc	%xcc,	%g6,	%l4
loop_685:
	stb	%g2,	[%l7 + 0x5A]
	fbug	%fcc1,	loop_686
	movcs	%icc,	%l5,	%l0
	mulx	%g5,	%o5,	%l2
	taddcc	%o6,	%o0,	%o2
loop_686:
	fornot1s	%f29,	%f22,	%f26
	brnz	%i4,	loop_687
	fabsd	%f8,	%f12
	movcc	%icc,	%o7,	%i7
	fcmpgt16	%f16,	%f6,	%i2
loop_687:
	edge16l	%i5,	%i6,	%g3
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tcs	%xcc,	0x0
	prefetch	[%l7 + 0x68],	 0x3
	alignaddr	%o3,	%g7,	%g4
	fexpand	%f25,	%f18
	movre	%i0,	%i3,	%l3
	umulcc	%o1,	%g1,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i1,	%l6
	tle	%icc,	0x4
	fsrc1s	%f23,	%f7
	tsubcctv	%l1,	0x00EB,	%l4
	xor	%g2,	0x01AD,	%l5
	tsubcc	%l0,	%g5,	%g6
	edge8n	%o5,	%l2,	%o0
	mulx	%o6,	%i4,	%o2
	tvc	%xcc,	0x4
	fmul8x16al	%f11,	%f3,	%f12
	edge8l	%o7,	%i7,	%i2
	tsubcc	%i5,	0x0FB0,	%i6
	fmovrslez	%g3,	%f15,	%f30
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x7C] %asi,	%g7
	movne	%icc,	%g4,	%i0
	fnands	%f9,	%f9,	%f26
	fsrc2s	%f27,	%f5
	srl	%i3,	0x0A,	%o3
	alignaddrl	%o1,	%l3,	%o4
	edge32ln	%g1,	%i1,	%l1
	fbo,a	%fcc0,	loop_688
	andn	%l4,	0x1728,	%g2
	movne	%xcc,	%l5,	%l6
	pdist	%f12,	%f24,	%f16
loop_688:
	srl	%g5,	0x06,	%g6
	ldstub	[%l7 + 0x33],	%l0
	smul	%l2,	%o5,	%o6
	subccc	%i4,	%o2,	%o0
	nop
	set	0x3C, %i0
	ldsh	[%l7 + %i0],	%o7
	tne	%icc,	0x7
	sdivcc	%i7,	0x00BF,	%i5
	movg	%xcc,	%i6,	%g3
	tn	%icc,	0x7
	sir	0x12F8
	xorcc	%g7,	%g4,	%i2
	fbge	%fcc3,	loop_689
	bneg,pt	%xcc,	loop_690
	fmul8x16al	%f25,	%f3,	%f24
	addcc	%i0,	0x1CF2,	%i3
loop_689:
	movn	%xcc,	%o1,	%o3
loop_690:
	movrlz	%o4,	%g1,	%i1
	membar	0x39
	fnand	%f16,	%f30,	%f4
	xor	%l3,	0x0224,	%l4
	tgu	%xcc,	0x4
	movre	%l1,	%l5,	%l6
	fpsub16	%f22,	%f2,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g5,	%g2
	bcs,a	loop_691
	fcmps	%fcc1,	%f30,	%f22
	mulscc	%g6,	%l2,	%o5
	srlx	%l0,	0x09,	%i4
loop_691:
	fmul8x16al	%f0,	%f15,	%f26
	mova	%icc,	%o2,	%o0
	membar	0x5A
	bl,a	%xcc,	loop_692
	edge16	%o6,	%i7,	%o7
	movne	%xcc,	%i6,	%g3
	sethi	0x16A7,	%i5
loop_692:
	movcs	%icc,	%g4,	%i2
	sra	%g7,	%i3,	%o1
	bn,pn	%xcc,	loop_693
	fornot1s	%f29,	%f12,	%f8
	fmovdneg	%icc,	%f3,	%f11
	bneg,a,pn	%xcc,	loop_694
loop_693:
	addcc	%o3,	%i0,	%g1
	sdivcc	%o4,	0x018A,	%i1
	edge8ln	%l3,	%l1,	%l4
loop_694:
	fcmpgt32	%f2,	%f30,	%l6
	sir	0x0828
	fbne,a	%fcc1,	loop_695
	movrgz	%g5,	%l5,	%g6
	fmovdcc	%icc,	%f21,	%f30
	tcs	%xcc,	0x4
loop_695:
	edge16	%g2,	%l2,	%l0
	fabsd	%f16,	%f22
	tcc	%icc,	0x7
	edge16n	%o5,	%i4,	%o2
	movneg	%icc,	%o6,	%i7
	fbo	%fcc2,	loop_696
	subcc	%o7,	%i6,	%o0
	srax	%g3,	0x00,	%i5
	membar	0x0D
loop_696:
	fbne,a	%fcc1,	loop_697
	sth	%i2,	[%l7 + 0x10]
	fornot1s	%f2,	%f21,	%f29
	faligndata	%f22,	%f2,	%f28
loop_697:
	edge32l	%g4,	%g7,	%i3
	fbu,a	%fcc3,	loop_698
	array16	%o3,	%o1,	%g1
	fmovdcs	%xcc,	%f17,	%f4
	ldub	[%l7 + 0x6A],	%o4
loop_698:
	tpos	%icc,	0x4
	tleu	%xcc,	0x0
	orcc	%i1,	%l3,	%l1
	fnot1s	%f12,	%f27
	movneg	%icc,	%l4,	%l6
	edge8l	%i0,	%l5,	%g6
	and	%g2,	%g5,	%l0
	movre	%o5,	0x058,	%i4
	sll	%o2,	0x04,	%l2
	srl	%o6,	%i7,	%i6
	fxnors	%f28,	%f24,	%f12
	ldstub	[%l7 + 0x23],	%o0
	fbule,a	%fcc2,	loop_699
	ta	%xcc,	0x7
	sllx	%o7,	%i5,	%i2
	fble	%fcc1,	loop_700
loop_699:
	movpos	%icc,	%g3,	%g7
	fmovdcc	%xcc,	%f11,	%f3
	alignaddrl	%g4,	%i3,	%o3
loop_700:
	sllx	%o1,	0x01,	%o4
	bn,a,pt	%icc,	loop_701
	alignaddrl	%g1,	%i1,	%l1
	te	%xcc,	0x2
	for	%f20,	%f2,	%f4
loop_701:
	xor	%l3,	%l6,	%i0
	tcs	%xcc,	0x3
	tpos	%icc,	0x1
	movcc	%icc,	%l5,	%g6
	siam	0x6
	nop
	set	0x30, %i1
	prefetch	[%l7 + %i1],	 0x1
	tn	%xcc,	0x7
	udiv	%g2,	0x1397,	%l4
	fsrc2s	%f25,	%f23
	bshuffle	%f26,	%f24,	%f28
	edge16	%g5,	%o5,	%l0
	ta	%icc,	0x1
	sdivx	%o2,	0x13E3,	%l2
	movne	%xcc,	%o6,	%i4
	subc	%i6,	%i7,	%o7
	tge	%icc,	0x0
	tg	%xcc,	0x5
	brgez,a	%o0,	loop_702
	udivx	%i2,	0x0B0F,	%i5
	srlx	%g3,	0x09,	%g4
	fexpand	%f5,	%f18
loop_702:
	tleu	%xcc,	0x6
	membar	0x42
	fpadd16	%f28,	%f12,	%f24
	tne	%xcc,	0x5
	fbug	%fcc0,	loop_703
	fmovrdgz	%g7,	%f2,	%f12
	taddcctv	%o3,	%o1,	%o4
	smul	%i3,	0x0EF0,	%i1
loop_703:
	tn	%icc,	0x1
	addcc	%l1,	%l3,	%g1
	tn	%icc,	0x3
	fmul8x16au	%f9,	%f21,	%f0
	alignaddrl	%i0,	%l5,	%l6
	fmul8x16	%f20,	%f18,	%f30
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g6
	fabsd	%f0,	%f20
	tcs	%icc,	0x7
	subccc	%l4,	0x1D6E,	%g2
	taddcc	%g5,	0x1987,	%o5
	movl	%icc,	%l0,	%o2
	fandnot2s	%f27,	%f20,	%f18
	movrlez	%o6,	%l2,	%i4
	movrlz	%i6,	0x0FC,	%o7
	movne	%xcc,	%i7,	%i2
	tl	%icc,	0x0
	brgez,a	%i5,	loop_704
	movrlez	%o0,	%g4,	%g7
	movcs	%icc,	%o3,	%o1
	edge16l	%o4,	%g3,	%i3
loop_704:
	fornot2s	%f14,	%f13,	%f20
	bne	loop_705
	movrgz	%i1,	%l1,	%l3
	fmovrdgz	%i0,	%f18,	%f0
	stbar
loop_705:
	addcc	%g1,	%l6,	%l5
	addcc	%l4,	0x1C36,	%g6
	mova	%xcc,	%g5,	%o5
	edge32ln	%g2,	%o2,	%o6
	orn	%l2,	0x0023,	%i4
	addccc	%i6,	%o7,	%l0
	fmovrdlez	%i2,	%f16,	%f12
	bge	loop_706
	tn	%icc,	0x2
	fbug	%fcc0,	loop_707
	andncc	%i7,	%i5,	%o0
loop_706:
	fone	%f20
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf8
	membar	#Sync
loop_707:
	srax	%g4,	0x1C,	%o3
	sll	%o1,	0x07,	%g7
	movn	%xcc,	%g3,	%o4
	andn	%i1,	0x177A,	%i3
	edge8ln	%l1,	%i0,	%g1
	edge8	%l3,	%l6,	%l4
	set	0x33, %g6
	ldsba	[%l7 + %g6] 0x19,	%g6
	fnand	%f2,	%f30,	%f18
	edge32l	%l5,	%g5,	%o5
	fpadd16s	%f26,	%f7,	%f16
	tg	%icc,	0x1
	prefetch	[%l7 + 0x08],	 0x1
	bl	%icc,	loop_708
	sdivcc	%o2,	0x01B2,	%g2
	movg	%icc,	%l2,	%i4
	umul	%i6,	%o6,	%o7
loop_708:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x2C] %asi,	%l0
	edge32n	%i2,	%i7,	%o0
	fbn,a	%fcc3,	loop_709
	nop
	setx	loop_710,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%i5,	%o3,	%o1
	subccc	%g7,	0x0E2D,	%g4
loop_709:
	fmovsg	%xcc,	%f8,	%f26
loop_710:
	te	%icc,	0x0
	fmovdgu	%icc,	%f25,	%f0
	edge8n	%g3,	%o4,	%i1
	fpadd16	%f16,	%f2,	%f10
	fnot2s	%f17,	%f17
	fmovsvs	%icc,	%f28,	%f31
	fmovrdlz	%l1,	%f28,	%f8
	fmovrdlz	%i3,	%f6,	%f24
	fbuge,a	%fcc1,	loop_711
	bl	loop_712
	bleu	%xcc,	loop_713
	fblg	%fcc0,	loop_714
loop_711:
	smul	%i0,	%g1,	%l6
loop_712:
	fmovdle	%xcc,	%f8,	%f19
loop_713:
	add	%l3,	0x1232,	%l4
loop_714:
	be,a,pn	%icc,	loop_715
	andncc	%g6,	%l5,	%o5
	set	0x68, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g5
loop_715:
	movg	%icc,	%o2,	%g2
	umulcc	%i4,	0x1E98,	%i6
	umulcc	%l2,	0x0A7C,	%o6
	set	0x2C, %l0
	swapa	[%l7 + %l0] 0x0c,	%l0
	tsubcc	%o7,	%i2,	%i7
	udivx	%o0,	0x0909,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x2
	fmovd	%f8,	%f30
	brlez,a	%o1,	loop_716
	sra	%o3,	%g7,	%g3
	stbar
	umul	%o4,	0x12D1,	%g4
loop_716:
	fmovdvs	%icc,	%f25,	%f21
	set	0x78, %l2
	swapa	[%l7 + %l2] 0x81,	%i1
	edge8	%l1,	%i3,	%g1
	bge,a	loop_717
	fble	%fcc2,	loop_718
	ta	%xcc,	0x3
	fbul	%fcc0,	loop_719
loop_717:
	tn	%xcc,	0x3
loop_718:
	tl	%icc,	0x3
	ta	%xcc,	0x4
loop_719:
	tge	%icc,	0x2
	fmul8ulx16	%f2,	%f24,	%f28
	edge16	%l6,	%l3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x4
	fmovrslez	%l4,	%f30,	%f11
	set	0x7E, %i4
	ldsha	[%l7 + %i4] 0x14,	%l5
	fors	%f28,	%f3,	%f26
	edge8	%o5,	%g5,	%o2
	add	%g6,	%i4,	%g2
	fmovsleu	%icc,	%f20,	%f26
	taddcctv	%l2,	%i6,	%l0
	sllx	%o6,	%i2,	%i7
	fbe	%fcc1,	loop_720
	tl	%xcc,	0x3
	sub	%o7,	0x08CC,	%i5
	movne	%xcc,	%o1,	%o0
loop_720:
	movvc	%xcc,	%o3,	%g7
	lduh	[%l7 + 0x64],	%o4
	tsubcc	%g3,	%g4,	%i1
	orncc	%l1,	0x0629,	%g1
	fblg	%fcc1,	loop_721
	tne	%xcc,	0x0
	brlz,a	%l6,	loop_722
	edge8ln	%i3,	%l3,	%i0
loop_721:
	swap	[%l7 + 0x5C],	%l5
	tge	%icc,	0x0
loop_722:
	nop
	set	0x28, %g7
	stxa	%l4,	[%l7 + %g7] 0x23
	membar	#Sync
	set	0x44, %i7
	swapa	[%l7 + %i7] 0x11,	%o5
	array8	%g5,	%o2,	%i4
	tg	%xcc,	0x3
	fbuge	%fcc3,	loop_723
	ta	%icc,	0x2
	tl	%xcc,	0x4
	ld	[%l7 + 0x5C],	%f25
loop_723:
	tleu	%icc,	0x5
	tle	%icc,	0x7
	edge16	%g6,	%g2,	%l2
	stw	%l0,	[%l7 + 0x34]
	sir	0x1C07
	be,pn	%icc,	loop_724
	fcmpd	%fcc2,	%f20,	%f18
	fmovsvs	%xcc,	%f10,	%f2
	fmovscc	%xcc,	%f14,	%f7
loop_724:
	udivx	%o6,	0x0AA1,	%i6
	fmovrde	%i7,	%f28,	%f8
	alignaddrl	%o7,	%i2,	%i5
	alignaddr	%o1,	%o0,	%g7
	edge32n	%o3,	%o4,	%g3
	popc	0x02FC,	%g4
	fmovdneg	%xcc,	%f28,	%f4
	fbo	%fcc3,	loop_725
	fnot1	%f0,	%f0
	tsubcc	%l1,	0x0B4E,	%g1
	fmovrse	%l6,	%f19,	%f28
loop_725:
	tpos	%icc,	0x0
	movrlez	%i1,	0x0A8,	%i3
	movcc	%xcc,	%l3,	%i0
	udivcc	%l4,	0x09F5,	%l5
	fornot1	%f24,	%f28,	%f20
	alignaddr	%o5,	%g5,	%o2
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x10,	%g6
	sdivx	%i4,	0x1891,	%l2
	edge8l	%l0,	%g2,	%i6
	nop
	set	0x08, %l4
	std	%o6,	[%l7 + %l4]
	array16	%i7,	%i2,	%i5
	stx	%o1,	[%l7 + 0x20]
	movrne	%o7,	0x24F,	%g7
	tge	%icc,	0x2
	fnot1	%f22,	%f24
	fmul8sux16	%f18,	%f16,	%f30
	lduh	[%l7 + 0x3A],	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f18
	tgu	%icc,	0x0
	movne	%xcc,	%o3,	%o4
	mulscc	%g3,	0x15B7,	%g4
	movrgez	%l1,	0x1FD,	%l6
	fmovrdgz	%g1,	%f0,	%f0
	edge16l	%i3,	%l3,	%i0
	movn	%xcc,	%l4,	%l5
	fors	%f22,	%f2,	%f10
	movpos	%icc,	%o5,	%i1
	fmovsn	%icc,	%f15,	%f17
	fandnot1	%f18,	%f6,	%f12
	movvs	%xcc,	%g5,	%o2
	andncc	%g6,	%l2,	%l0
	set	0x52, %o6
	stba	%i4,	[%l7 + %o6] 0x11
	edge16ln	%i6,	%o6,	%i7
	fbug,a	%fcc1,	loop_726
	tvs	%icc,	0x6
	edge16	%i2,	%i5,	%o1
	bneg,a	%icc,	loop_727
loop_726:
	std	%f0,	[%l7 + 0x38]
	ldsw	[%l7 + 0x54],	%o7
	brgez	%g7,	loop_728
loop_727:
	edge16n	%g2,	%o3,	%o4
	umul	%o0,	%g4,	%l1
	tle	%icc,	0x5
loop_728:
	smul	%g3,	%l6,	%g1
	tsubcctv	%i3,	%i0,	%l3
	fmovdg	%xcc,	%f18,	%f5
	array32	%l4,	%l5,	%i1
	fsrc2s	%f26,	%f16
	udivx	%o5,	0x0BBD,	%o2
	add	%g6,	%g5,	%l0
	fandnot1	%f28,	%f28,	%f6
	sdivcc	%i4,	0x0B77,	%l2
	fblg	%fcc3,	loop_729
	array16	%o6,	%i6,	%i7
	alignaddr	%i5,	%o1,	%i2
	fornot1s	%f6,	%f25,	%f7
loop_729:
	ba,pt	%xcc,	loop_730
	subccc	%g7,	%g2,	%o3
	sdivcc	%o7,	0x06DE,	%o4
	edge32	%g4,	%o0,	%g3
loop_730:
	orn	%l1,	%l6,	%i3
	fbg	%fcc3,	loop_731
	tsubcctv	%i0,	0x10B5,	%g1
	movpos	%icc,	%l3,	%l5
	andcc	%l4,	%o5,	%o2
loop_731:
	fbul,a	%fcc3,	loop_732
	fbg	%fcc2,	loop_733
	tle	%icc,	0x5
	popc	0x1B1B,	%i1
loop_732:
	tneg	%xcc,	0x5
loop_733:
	swap	[%l7 + 0x0C],	%g5
	subc	%l0,	%i4,	%g6
	movrgz	%o6,	%l2,	%i7
	lduh	[%l7 + 0x74],	%i6
	ldsw	[%l7 + 0x2C],	%o1
	or	%i2,	0x1664,	%i5
	movvs	%icc,	%g7,	%o3
	sir	0x039B
	tvs	%xcc,	0x4
	alignaddrl	%g2,	%o4,	%o7
	ble	loop_734
	subc	%o0,	%g4,	%l1
	subccc	%l6,	0x0CD3,	%i3
	fcmpne16	%f30,	%f10,	%g3
loop_734:
	movre	%i0,	%g1,	%l3
	fmovsa	%xcc,	%f30,	%f21
	movcc	%icc,	%l4,	%o5
	te	%icc,	0x5
	tleu	%xcc,	0x5
	addc	%l5,	%o2,	%i1
	stw	%g5,	[%l7 + 0x3C]
	ldsh	[%l7 + 0x48],	%l0
	tl	%icc,	0x2
	movg	%xcc,	%g6,	%i4
	set	0x57, %o2
	stba	%o6,	[%l7 + %o2] 0x19
	movge	%xcc,	%i7,	%l2
	ldsw	[%l7 + 0x40],	%o1
	xnorcc	%i2,	%i6,	%i5
	fnot1	%f26,	%f2
	xorcc	%o3,	%g7,	%o4
	bgu,pn	%icc,	loop_735
	movcc	%icc,	%g2,	%o7
	tl	%icc,	0x3
	bleu,a	loop_736
loop_735:
	brgz	%g4,	loop_737
	addc	%o0,	0x0E15,	%l6
	tsubcctv	%l1,	%g3,	%i3
loop_736:
	mulx	%i0,	0x1A36,	%g1
loop_737:
	fmul8x16al	%f28,	%f20,	%f18
	tleu	%icc,	0x0
	fpack16	%f26,	%f10
	udivcc	%l3,	0x0B30,	%l4
	tle	%xcc,	0x0
	fmovrde	%o5,	%f20,	%f4
	be,pn	%xcc,	loop_738
	movrlz	%o2,	%l5,	%i1
	movgu	%icc,	%l0,	%g5
	srlx	%g6,	0x08,	%i4
loop_738:
	nop
	setx	loop_739,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fzeros	%f26
	alignaddr	%o6,	%l2,	%i7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
loop_739:
	bleu,a	%icc,	loop_740
	fornot1s	%f5,	%f29,	%f24
	mova	%xcc,	%i6,	%i5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o1
loop_740:
	bn,a	%xcc,	loop_741
	orncc	%g7,	%o4,	%o3
	edge16n	%o7,	%g2,	%o0
	fone	%f26
loop_741:
	edge16l	%l6,	%l1,	%g4
	tsubcctv	%g3,	%i3,	%g1
	add	%l3,	0x048A,	%l4
	umul	%o5,	0x1596,	%o2
	movne	%icc,	%i0,	%l5
	movrgez	%l0,	0x236,	%g5
	fpsub16	%f20,	%f8,	%f4
	fmuld8ulx16	%f26,	%f6,	%f2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x11,	%f0
	fmul8x16	%f3,	%f30,	%f22
	or	%g6,	0x039A,	%i4
	subcc	%o6,	0x0B7A,	%i1
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x19
	tvs	%icc,	0x7
	fxors	%f14,	%f22,	%f15
	edge8n	%i7,	%i2,	%l2
	ldx	[%l7 + 0x50],	%i5
	bcc,pt	%xcc,	loop_742
	subc	%i6,	0x0EAC,	%g7
	fmovdvc	%xcc,	%f0,	%f29
	xnorcc	%o4,	0x049E,	%o1
loop_742:
	move	%xcc,	%o7,	%o3
	ldsh	[%l7 + 0x1C],	%g2
	movleu	%xcc,	%l6,	%l1
	swap	[%l7 + 0x74],	%g4
	set	0x30, %o4
	stxa	%o0,	[%l7 + %o4] 0x80
	fbg,a	%fcc1,	loop_743
	bl,a,pt	%xcc,	loop_744
	fmovdneg	%icc,	%f11,	%f27
	andn	%i3,	%g3,	%g1
loop_743:
	andncc	%l3,	%o5,	%o2
loop_744:
	bgu,pn	%icc,	loop_745
	subc	%i0,	0x183F,	%l5
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x1f
	membar	#Sync
loop_745:
	array8	%l4,	%l0,	%g5
	udivx	%g6,	0x10E1,	%o6
	bneg	loop_746
	fmovdcc	%xcc,	%f8,	%f4
	fmovsleu	%xcc,	%f15,	%f28
	movrlez	%i4,	%i1,	%i7
loop_746:
	nop
	set	0x7A, %g1
	stba	%l2,	[%l7 + %g1] 0x89
	edge32l	%i2,	%i5,	%g7
	brlez	%i6,	loop_747
	xnor	%o4,	%o1,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%o3
loop_747:
	ldd	[%l7 + 0x20],	%i6
	ble,a	loop_748
	tne	%icc,	0x3
	ldsb	[%l7 + 0x12],	%g4
	movre	%o0,	0x384,	%l1
loop_748:
	fzero	%f14
	tcc	%icc,	0x7
	fbug,a	%fcc2,	loop_749
	movvc	%icc,	%g3,	%g1
	fcmpd	%fcc2,	%f6,	%f6
	lduw	[%l7 + 0x74],	%l3
loop_749:
	movn	%icc,	%i3,	%o5
	edge16	%o2,	%i0,	%l5
	ldsb	[%l7 + 0x6F],	%l4
	movre	%l0,	0x1B6,	%g6
	movrlz	%o6,	%i4,	%i1
	tpos	%icc,	0x7
	orncc	%i7,	0x01C7,	%g5
	fmovrdlez	%i2,	%f14,	%f8
	swap	[%l7 + 0x54],	%i5
	fnot1	%f26,	%f12
	fpadd16s	%f7,	%f14,	%f0
	fbne,a	%fcc3,	loop_750
	sub	%l2,	%g7,	%i6
	sth	%o1,	[%l7 + 0x08]
	fmovdne	%icc,	%f22,	%f23
loop_750:
	movgu	%icc,	%o4,	%g2
	tsubcc	%o7,	%o3,	%g4
	tgu	%xcc,	0x3
	umulcc	%o0,	0x1502,	%l6
	array8	%g3,	%l1,	%g1
	movrgz	%i3,	%o5,	%o2
	sdivx	%l3,	0x12D7,	%i0
	fabsd	%f10,	%f20
	taddcctv	%l5,	%l4,	%l0
	addcc	%g6,	%i4,	%i1
	movvs	%icc,	%o6,	%g5
	smulcc	%i2,	%i5,	%i7
	stb	%g7,	[%l7 + 0x30]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l2,	%o1
	alignaddrl	%i6,	%g2,	%o4
	addcc	%o3,	%g4,	%o0
	edge8ln	%o7,	%l6,	%g3
	fbug	%fcc2,	loop_751
	fbl,a	%fcc1,	loop_752
	umul	%g1,	%i3,	%o5
	movrlz	%l1,	%o2,	%l3
loop_751:
	srax	%l5,	0x1B,	%i0
loop_752:
	fmovrdne	%l0,	%f0,	%f18
	fsrc1	%f0,	%f8
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xe3,	%g6
	ba,pt	%icc,	loop_753
	tcs	%icc,	0x2
	orcc	%l4,	%i1,	%i4
	tvc	%icc,	0x1
loop_753:
	bn,a	loop_754
	edge8ln	%g5,	%o6,	%i5
	movl	%xcc,	%i7,	%i2
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
loop_754:
	tvs	%icc,	0x1
	sir	0x0CB6
	fbg,a	%fcc2,	loop_755
	bn,pt	%icc,	loop_756
	fornot2	%f30,	%f4,	%f10
	movrgez	%g7,	%i6,	%o1
loop_755:
	movre	%o4,	0x0F7,	%g2
loop_756:
	xorcc	%o3,	0x11EB,	%o0
	fsrc1	%f22,	%f30
	tsubcc	%o7,	%g4,	%g3
	fpadd16s	%f30,	%f3,	%f5
	flush	%l7 + 0x68
	smulcc	%g1,	0x03BC,	%l6
	tg	%icc,	0x5
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	fones	%f19
	ba,a,pt	%icc,	loop_757
	udiv	%l1,	0x1103,	%o2
	brlez	%i3,	loop_758
	fors	%f10,	%f27,	%f3
loop_757:
	movneg	%xcc,	%l3,	%i0
	tcc	%xcc,	0x4
loop_758:
	taddcctv	%l0,	%g6,	%l5
	edge16ln	%l4,	%i1,	%i4
	orncc	%o6,	0x10EA,	%i5
	fbuge	%fcc3,	loop_759
	bn,a,pt	%icc,	loop_760
	fmovsvc	%icc,	%f20,	%f12
	movre	%g5,	%i7,	%i2
loop_759:
	popc	0x1AAF,	%l2
loop_760:
	movl	%xcc,	%g7,	%o1
	nop
	set	0x48, %o1
	std	%o4,	[%l7 + %o1]
	addc	%g2,	%o3,	%i6
	edge32l	%o0,	%o7,	%g4
	tne	%icc,	0x2
	edge32ln	%g1,	%g3,	%o5
	sra	%l1,	%o2,	%l6
	bpos,pt	%xcc,	loop_761
	std	%i2,	[%l7 + 0x30]
	alignaddr	%i0,	%l3,	%g6
	xor	%l0,	0x1F76,	%l5
loop_761:
	fmovdleu	%icc,	%f22,	%f19
	taddcc	%i1,	%l4,	%o6
	fpsub32	%f30,	%f12,	%f0
	xor	%i5,	%g5,	%i7
	bneg	%icc,	loop_762
	addcc	%i4,	%i2,	%g7
	udivcc	%o1,	0x033B,	%l2
	movre	%g2,	0x03E,	%o3
loop_762:
	tne	%icc,	0x2
	edge8n	%o4,	%i6,	%o7
	udivx	%g4,	0x0317,	%g1
	add	%o0,	0x14FC,	%o5
	fone	%f20
	orn	%g3,	0x0DF8,	%o2
	tpos	%xcc,	0x2
	orncc	%l6,	0x1572,	%i3
	tcc	%icc,	0x4
	subccc	%i0,	0x0A12,	%l1
	andn	%g6,	0x1D41,	%l0
	fmovda	%icc,	%f22,	%f15
	subcc	%l5,	%i1,	%l4
	fpsub32s	%f8,	%f7,	%f9
	fone	%f2
	addc	%l3,	0x15B0,	%o6
	movg	%xcc,	%i5,	%i7
	xor	%i4,	0x0B9F,	%g5
	bleu,a,pt	%icc,	loop_763
	xnor	%i2,	0x0182,	%g7
	edge16n	%o1,	%l2,	%o3
	sdivx	%g2,	0x0872,	%i6
loop_763:
	flush	%l7 + 0x30
	edge16n	%o4,	%g4,	%o7
	fmovsg	%icc,	%f12,	%f8
	tl	%icc,	0x6
	fpadd32	%f2,	%f22,	%f20
	brlez,a	%o0,	loop_764
	edge8ln	%g1,	%o5,	%o2
	fnand	%f10,	%f28,	%f28
	bcs	%xcc,	loop_765
loop_764:
	sll	%g3,	%l6,	%i3
	movgu	%icc,	%l1,	%g6
	bcc,a,pt	%icc,	loop_766
loop_765:
	tcs	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc2,	loop_767
loop_766:
	fmovdvc	%icc,	%f7,	%f25
	bvs	%icc,	loop_768
	andcc	%l0,	0x0744,	%i0
loop_767:
	nop
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x2C] %asi,	%f21
loop_768:
	edge8ln	%i1,	%l4,	%l5
	movrgez	%l3,	%i5,	%i7
	fnot2s	%f11,	%f15
	tvs	%icc,	0x5
	fnot2s	%f18,	%f17
	andncc	%i4,	%o6,	%g5
	fmovsvc	%icc,	%f1,	%f18
	wr	%g0,	0x2b,	%asi
	stxa	%i2,	[%l7 + 0x08] %asi
	membar	#Sync
	taddcctv	%g7,	%o1,	%o3
	sethi	0x01BF,	%l2
	subccc	%g2,	0x0D06,	%o4
	sra	%g4,	0x18,	%o7
	fcmpes	%fcc2,	%f24,	%f29
	fpsub32	%f26,	%f4,	%f26
	fpadd32	%f28,	%f16,	%f10
	tcc	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	stba	%i6,	[%l7 + 0x66] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o0,	%o5,	%o2
	array8	%g1,	%g3,	%i3
	fmovdl	%icc,	%f16,	%f20
	fpadd16s	%f29,	%f24,	%f15
	sub	%l6,	%l1,	%g6
	sll	%l0,	%i1,	%i0
	fmovdg	%icc,	%f2,	%f19
	tgu	%icc,	0x5
	movne	%icc,	%l4,	%l5
	udivx	%l3,	0x122C,	%i5
	tl	%xcc,	0x5
	movcs	%xcc,	%i7,	%o6
	set	0x6E, %g2
	lduha	[%l7 + %g2] 0x81,	%g5
	fone	%f26
	ldub	[%l7 + 0x1A],	%i2
	tvc	%icc,	0x7
	umul	%i4,	0x013F,	%g7
	movn	%xcc,	%o3,	%o1
	sdivcc	%l2,	0x174C,	%o4
	fabss	%f13,	%f21
	tcs	%icc,	0x4
	fmuld8ulx16	%f15,	%f3,	%f0
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%i6
	movneg	%xcc,	%g4,	%o0
	movn	%icc,	%o2,	%g1
	fmul8x16au	%f0,	%f5,	%f16
	movvs	%xcc,	%o5,	%i3
	set	0x7C, %o5
	swapa	[%l7 + %o5] 0x81,	%l6
	tsubcc	%l1,	0x00D0,	%g6
	fcmple16	%f28,	%f4,	%g3
	udivx	%i1,	0x0F45,	%i0
	subccc	%l4,	0x081F,	%l5
	xorcc	%l3,	0x10D0,	%i5
	xor	%l0,	%i7,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o6,	%i4,	%i2
	edge8	%o3,	%o1,	%l2
	ta	%icc,	0x1
	edge32n	%o4,	%g2,	%o7
	fornot1	%f18,	%f18,	%f30
	array16	%i6,	%g4,	%g7
	fones	%f1
	udivx	%o2,	0x1A90,	%o0
	tle	%icc,	0x7
	tl	%xcc,	0x1
	alignaddrl	%o5,	%g1,	%i3
	movrlez	%l1,	0x162,	%l6
	fpadd32	%f8,	%f10,	%f24
	movvs	%xcc,	%g6,	%i1
	fcmple32	%f18,	%f2,	%i0
	brnz	%l4,	loop_769
	movvs	%icc,	%g3,	%l5
	fmovde	%icc,	%f24,	%f1
	addcc	%i5,	0x1D4C,	%l3
loop_769:
	bvc	loop_770
	orncc	%i7,	%l0,	%o6
	tleu	%icc,	0x6
	fzeros	%f17
loop_770:
	movcs	%icc,	%i4,	%i2
	mova	%icc,	%g5,	%o3
	ldsh	[%l7 + 0x1A],	%o1
	fandnot1	%f26,	%f18,	%f22
	bleu,a	%icc,	loop_771
	te	%xcc,	0x3
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0x2
loop_771:
	edge8	%g2,	%o7,	%l2
	tle	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x74] %asi,	%g4
	movg	%icc,	%g7,	%i6
	fnot1	%f22,	%f12
	xnorcc	%o2,	%o0,	%o5
	orcc	%g1,	%l1,	%l6
	andcc	%i3,	0x0AAB,	%i1
	sllx	%g6,	%l4,	%g3
	sub	%l5,	0x0E86,	%i5
	lduw	[%l7 + 0x54],	%i0
	subc	%l3,	%l0,	%o6
	umulcc	%i7,	%i2,	%i4
	xnorcc	%g5,	%o1,	%o4
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x11,	 0x0
	fcmpne32	%f12,	%f30,	%o7
	edge32ln	%o3,	%g4,	%l2
	tg	%icc,	0x2
	sdivcc	%g7,	0x1780,	%o2
	smul	%i6,	%o5,	%o0
	taddcc	%g1,	%l1,	%i3
	fpadd16	%f24,	%f16,	%f16
	movcc	%icc,	%i1,	%g6
	flush	%l7 + 0x44
	movvs	%icc,	%l4,	%l6
	membar	0x22
	andcc	%l5,	0x025F,	%g3
	fpack16	%f10,	%f7
	fmovde	%xcc,	%f2,	%f16
	fmul8ulx16	%f20,	%f4,	%f24
	andncc	%i0,	%l3,	%i5
	fmovdpos	%xcc,	%f7,	%f25
	edge16ln	%o6,	%i7,	%i2
	movre	%i4,	%l0,	%o1
	movge	%icc,	%o4,	%g2
	fmovsgu	%icc,	%f19,	%f17
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x60] %asi,	%g5
	tle	%icc,	0x6
	ldstub	[%l7 + 0x35],	%o7
	fone	%f24
	tvc	%icc,	0x0
	sllx	%g4,	%o3,	%g7
	xor	%l2,	%i6,	%o2
	tgu	%xcc,	0x4
	sdivcc	%o0,	0x1DE1,	%o5
	edge8l	%g1,	%i3,	%i1
	brlez,a	%g6,	loop_772
	fcmple32	%f14,	%f10,	%l1
	orncc	%l6,	%l5,	%l4
	udiv	%g3,	0x10D4,	%i0
loop_772:
	tge	%xcc,	0x5
	fmovdcs	%xcc,	%f2,	%f11
	fba	%fcc3,	loop_773
	ta	%xcc,	0x5
	movpos	%xcc,	%i5,	%o6
	call	loop_774
loop_773:
	tpos	%icc,	0x3
	move	%icc,	%l3,	%i7
	edge32l	%i2,	%l0,	%i4
loop_774:
	edge32l	%o1,	%g2,	%g5
	movrgez	%o7,	%g4,	%o4
	edge8l	%g7,	%o3,	%i6
	nop
	setx loop_775, %l0, %l1
	jmpl %l1, %o2
	add	%l2,	%o0,	%g1
	movvc	%xcc,	%o5,	%i3
	movg	%xcc,	%i1,	%l1
loop_775:
	fmovrdgz	%l6,	%f28,	%f6
	fmovsneg	%icc,	%f4,	%f7
	movneg	%xcc,	%l5,	%l4
	smulcc	%g3,	0x02E5,	%i0
	pdist	%f0,	%f28,	%f12
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%i5
	fmovdl	%xcc,	%f20,	%f0
	fxnor	%f8,	%f12,	%f18
	faligndata	%f14,	%f12,	%f4
	smul	%g6,	%l3,	%i7
	movcs	%icc,	%o6,	%l0
	edge32ln	%i2,	%i4,	%g2
	fmovsvc	%icc,	%f28,	%f31
	fmovsvc	%icc,	%f9,	%f1
	smulcc	%g5,	%o1,	%o7
	tsubcctv	%o4,	%g7,	%g4
	tle	%xcc,	0x5
	ta	%icc,	0x2
	movrlez	%i6,	%o2,	%l2
	movvs	%xcc,	%o0,	%g1
	mulx	%o5,	0x1567,	%i3
	orcc	%i1,	0x1C26,	%o3
	subcc	%l6,	0x0159,	%l5
	tle	%icc,	0x6
	fba	%fcc1,	loop_776
	addcc	%l4,	%l1,	%g3
	subc	%i5,	0x0F4B,	%g6
	tvc	%icc,	0x0
loop_776:
	movcc	%icc,	%l3,	%i7
	sethi	0x1065,	%i0
	movpos	%xcc,	%o6,	%l0
	movgu	%icc,	%i4,	%i2
	tcs	%xcc,	0x6
	edge32ln	%g2,	%o1,	%o7
	faligndata	%f2,	%f8,	%f14
	movrne	%o4,	%g5,	%g7
	set	0x2C, %i6
	ldswa	[%l7 + %i6] 0x04,	%i6
	edge32l	%g4,	%l2,	%o0
	tneg	%icc,	0x6
	addccc	%o2,	%g1,	%o5
	movrlez	%i1,	%i3,	%o3
	orn	%l6,	%l4,	%l1
	edge16n	%g3,	%l5,	%g6
	fnors	%f2,	%f20,	%f20
	movgu	%xcc,	%l3,	%i7
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%i0
	ta	%xcc,	0x7
	tpos	%icc,	0x1
	movpos	%xcc,	%o6,	%l0
	udiv	%i4,	0x02C0,	%i2
	fmul8ulx16	%f22,	%f8,	%f6
	fmovdvc	%icc,	%f1,	%f29
	edge8ln	%g2,	%i5,	%o1
	tsubcctv	%o7,	%o4,	%g5
	flush	%l7 + 0x54
	fmovsle	%icc,	%f28,	%f20
	fmovdge	%icc,	%f2,	%f22
	smulcc	%i6,	%g7,	%l2
	nop
	set	0x19, %g3
	ldsb	[%l7 + %g3],	%o0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%g4
	move	%xcc,	%g1,	%o5
	and	%o2,	%i1,	%o3
	edge16	%i3,	%l4,	%l6
	fbg,a	%fcc2,	loop_777
	fmuld8sux16	%f1,	%f1,	%f26
	fmul8x16	%f9,	%f26,	%f10
	movn	%icc,	%l1,	%g3
loop_777:
	bpos,a,pt	%xcc,	loop_778
	or	%g6,	0x1C5C,	%l3
	fmovs	%f13,	%f3
	bleu,a	%xcc,	loop_779
loop_778:
	srlx	%l5,	%i0,	%o6
	fmovsleu	%xcc,	%f27,	%f1
	fmovdge	%icc,	%f0,	%f0
loop_779:
	movrlz	%i7,	%i4,	%l0
	alignaddrl	%g2,	%i5,	%i2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o1
	alignaddr	%o4,	%o7,	%g5
	tle	%xcc,	0x5
	tn	%xcc,	0x3
	udivcc	%g7,	0x090A,	%l2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3C] %asi,	%o0
	fbue	%fcc3,	loop_780
	sub	%i6,	%g1,	%o5
	edge32n	%o2,	%g4,	%o3
	tcc	%xcc,	0x7
loop_780:
	tge	%xcc,	0x7
	bvc,a	loop_781
	umulcc	%i1,	%l4,	%l6
	stb	%i3,	[%l7 + 0x60]
	movl	%xcc,	%g3,	%l1
loop_781:
	fmovrdlz	%l3,	%f20,	%f8
	tle	%icc,	0x4
	movre	%l5,	0x0C6,	%g6
	tgu	%icc,	0x5
	smulcc	%o6,	%i7,	%i0
	fmovd	%f28,	%f30
	fpsub32s	%f21,	%f18,	%f16
	edge8	%l0,	%i4,	%g2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%i2
	sdivcc	%o4,	0x0788,	%o1
	bne,pn	%icc,	loop_782
	udivx	%o7,	0x03D0,	%g7
	add	%l2,	%g5,	%o0
	fornot1s	%f20,	%f2,	%f2
loop_782:
	fcmpne16	%f28,	%f30,	%i6
	movl	%icc,	%o5,	%o2
	pdist	%f0,	%f18,	%f4
	fpsub16	%f28,	%f28,	%f4
	edge16ln	%g1,	%g4,	%o3
	wr	%g0,	0x80,	%asi
	stxa	%i1,	[%l7 + 0x28] %asi
	fcmpeq16	%f22,	%f12,	%l4
	xnor	%l6,	0x1CEF,	%g3
	fsrc1	%f14,	%f12
	movcs	%xcc,	%i3,	%l3
	movcs	%xcc,	%l5,	%l1
	flush	%l7 + 0x5C
	tge	%icc,	0x2
	array16	%o6,	%i7,	%g6
	alignaddr	%l0,	%i0,	%g2
	ta	%xcc,	0x3
	bn,a,pt	%xcc,	loop_783
	tvs	%xcc,	0x3
	tvc	%icc,	0x5
	tle	%icc,	0x4
loop_783:
	edge8l	%i5,	%i2,	%i4
	bcc,pn	%xcc,	loop_784
	fxnor	%f30,	%f10,	%f20
	movre	%o1,	0x0CA,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_784:
	taddcctv	%g7,	0x1F6A,	%o7
	fbuge,a	%fcc1,	loop_785
	movneg	%icc,	%l2,	%o0
	bg	loop_786
	mova	%xcc,	%g5,	%i6
loop_785:
	nop
	set	0x36, %l1
	lduha	[%l7 + %l1] 0x14,	%o2
loop_786:
	ba,a	%xcc,	loop_787
	for	%f22,	%f8,	%f20
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x08] %asi,	%g1
loop_787:
	add	%o5,	0x10F9,	%o3
	subccc	%g4,	0x1427,	%l4
	fmovdcs	%icc,	%f6,	%f20
	membar	0x32
	orn	%i1,	0x0796,	%g3
	tsubcctv	%i3,	%l3,	%l6
	st	%f23,	[%l7 + 0x78]
	fmovsg	%icc,	%f21,	%f19
	brlez	%l1,	loop_788
	xor	%l5,	0x1579,	%o6
	alignaddr	%i7,	%g6,	%l0
	fnands	%f27,	%f9,	%f20
loop_788:
	nop
	setx loop_789, %l0, %l1
	jmpl %l1, %g2
	fbuge	%fcc3,	loop_790
	fbn	%fcc3,	loop_791
	fbl	%fcc3,	loop_792
loop_789:
	fbule	%fcc1,	loop_793
loop_790:
	andncc	%i5,	%i2,	%i0
loop_791:
	fmovrslz	%i4,	%f7,	%f10
loop_792:
	edge32ln	%o1,	%o4,	%o7
loop_793:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l2,	%g7
	fexpand	%f25,	%f20
	ldx	[%l7 + 0x78],	%o0
	prefetch	[%l7 + 0x64],	 0x0
	tpos	%icc,	0x4
	move	%xcc,	%g5,	%o2
	andncc	%g1,	%o5,	%o3
	fble,a	%fcc1,	loop_794
	fcmpes	%fcc0,	%f7,	%f1
	array32	%i6,	%g4,	%i1
	edge8	%l4,	%i3,	%g3
loop_794:
	ldx	[%l7 + 0x10],	%l3
	tsubcctv	%l6,	0x0172,	%l5
	tneg	%icc,	0x4
	edge16n	%o6,	%i7,	%g6
	nop
	setx	loop_795,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%l1,	%g2,	%l0
	sra	%i5,	0x12,	%i0
	umul	%i4,	0x0137,	%o1
loop_795:
	fmovrde	%o4,	%f4,	%f20
	fcmpes	%fcc2,	%f11,	%f4
	edge8ln	%i2,	%l2,	%o7
	smul	%o0,	%g5,	%o2
	stbar
	sub	%g1,	%g7,	%o5
	edge32ln	%i6,	%o3,	%i1
	stb	%l4,	[%l7 + 0x26]
	movl	%icc,	%g4,	%i3
	movre	%g3,	%l3,	%l6
	taddcctv	%l5,	%o6,	%g6
	edge8ln	%i7,	%g2,	%l0
	addccc	%i5,	0x1ADF,	%l1
	fxors	%f25,	%f13,	%f10
	fmovdpos	%xcc,	%f11,	%f12
	edge16n	%i0,	%o1,	%i4
	mulx	%o4,	%l2,	%i2
	wr	%g0,	0x80,	%asi
	sta	%f2,	[%l7 + 0x24] %asi
	fmovsneg	%xcc,	%f4,	%f3
	orn	%o0,	0x01B3,	%o7
	smulcc	%g5,	%o2,	%g1
	ba,pt	%icc,	loop_796
	edge32	%o5,	%i6,	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x10,	%g7,	%i1
loop_796:
	fmuld8sux16	%f30,	%f11,	%f22
	fcmple16	%f12,	%f24,	%g4
	srl	%i3,	%g3,	%l4
	popc	0x0C97,	%l3
	movn	%icc,	%l6,	%o6
	tcs	%xcc,	0x4
	fmovd	%f0,	%f10
	sdivcc	%g6,	0x0DA4,	%l5
	fsrc1s	%f6,	%f9
	fbn,a	%fcc2,	loop_797
	fpsub32	%f28,	%f8,	%f12
	lduh	[%l7 + 0x3E],	%i7
	membar	0x21
loop_797:
	fbe,a	%fcc2,	loop_798
	fmovrdgez	%g2,	%f22,	%f26
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x47] %asi,	%l0
loop_798:
	tg	%xcc,	0x0
	edge32	%i5,	%i0,	%l1
	fmovspos	%icc,	%f10,	%f3
	tgu	%icc,	0x2
	fnot2	%f0,	%f20
	tneg	%xcc,	0x4
	fmovscs	%xcc,	%f31,	%f11
	taddcctv	%i4,	%o1,	%o4
	bneg,a	loop_799
	prefetch	[%l7 + 0x3C],	 0x0
	bneg,a	%icc,	loop_800
	alignaddrl	%i2,	%l2,	%o0
loop_799:
	sdivx	%g5,	0x0C26,	%o2
	sdivx	%o7,	0x1A6D,	%o5
loop_800:
	movg	%xcc,	%i6,	%o3
	andn	%g7,	0x1F99,	%g1
	sth	%i1,	[%l7 + 0x5A]
	movleu	%icc,	%i3,	%g3
	udiv	%l4,	0x1B82,	%g4
	set	0x6C, %g4
	lduwa	[%l7 + %g4] 0x0c,	%l3
	movvs	%xcc,	%l6,	%o6
	ldsw	[%l7 + 0x50],	%g6
	fpadd16s	%f1,	%f0,	%f4
	std	%f24,	[%l7 + 0x68]
	fmul8x16	%f31,	%f2,	%f24
	andncc	%i7,	%l5,	%l0
	smul	%i5,	%g2,	%i0
	movneg	%xcc,	%i4,	%l1
	edge16l	%o1,	%i2,	%o4
	movleu	%icc,	%o0,	%g5
	movgu	%icc,	%o2,	%l2
	umul	%o5,	%i6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g7,	%o7
	array8	%g1,	%i1,	%i3
	fmuld8ulx16	%f31,	%f29,	%f8
	fmovsge	%icc,	%f8,	%f10
	fcmpeq32	%f14,	%f26,	%l4
	fxnor	%f4,	%f18,	%f4
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%g4
	movrgez	%l3,	0x2AD,	%l6
	movrlz	%o6,	%g3,	%i7
	sllx	%g6,	%l5,	%i5
	alignaddr	%g2,	%i0,	%l0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x38] %asi,	%l1
	subc	%i4,	0x1814,	%o1
	fmovrdne	%i2,	%f20,	%f24
	fsrc1s	%f0,	%f30
	fcmpne16	%f28,	%f18,	%o0
	tcc	%icc,	0x0
	fabsd	%f12,	%f14
	fbne	%fcc2,	loop_801
	tg	%xcc,	0x7
	bl,a	%xcc,	loop_802
	fbl	%fcc3,	loop_803
loop_801:
	alignaddrl	%o4,	%g5,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_802:
	brlz	%o5,	loop_804
loop_803:
	movrgez	%i6,	0x0DE,	%o3
	tle	%xcc,	0x1
	xnor	%l2,	0x0A9E,	%o7
loop_804:
	fmovsneg	%xcc,	%f22,	%f30
	xnorcc	%g1,	%g7,	%i3
	fmovrsgz	%i1,	%f5,	%f9
	udiv	%l4,	0x0127,	%g4
	fcmpeq16	%f18,	%f28,	%l6
	tsubcc	%o6,	%g3,	%l3
	mulscc	%g6,	%i7,	%i5
	tleu	%xcc,	0x2
	fcmpne32	%f6,	%f16,	%g2
	mulscc	%l5,	0x0300,	%i0
	brz	%l1,	loop_805
	edge16ln	%l0,	%i4,	%o1
	andn	%o0,	%o4,	%g5
	fzeros	%f14
loop_805:
	fnegs	%f14,	%f1
	fnors	%f9,	%f29,	%f12
	fpack16	%f22,	%f25
	srax	%o2,	%i2,	%i6
	ldub	[%l7 + 0x34],	%o3
	nop
	setx loop_806, %l0, %l1
	jmpl %l1, %o5
	ble	%icc,	loop_807
	movrgz	%l2,	%g1,	%o7
	tgu	%xcc,	0x6
loop_806:
	fcmpne32	%f2,	%f4,	%g7
loop_807:
	srax	%i1,	%l4,	%i3
	fmovse	%xcc,	%f4,	%f4
	movre	%l6,	0x201,	%o6
	srax	%g4,	0x07,	%l3
	movcs	%xcc,	%g6,	%i7
	movl	%xcc,	%g3,	%g2
	set	0x44, %i1
	lduwa	[%l7 + %i1] 0x04,	%l5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i0
	tvs	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l1
	xnor	%i5,	0x0CFE,	%l0
	ta	%xcc,	0x3
	edge16ln	%o1,	%o0,	%i4
	edge32n	%g5,	%o2,	%o4
	addcc	%i6,	0x10B3,	%o3
	fnands	%f26,	%f25,	%f23
	bn,a,pt	%xcc,	loop_808
	movg	%icc,	%i2,	%o5
	fones	%f3
	fbule,a	%fcc3,	loop_809
loop_808:
	tcc	%xcc,	0x2
	mova	%icc,	%l2,	%o7
	ld	[%l7 + 0x70],	%f6
loop_809:
	stb	%g7,	[%l7 + 0x09]
	orncc	%i1,	%g1,	%i3
	movcc	%icc,	%l6,	%l4
	movrlz	%g4,	0x07C,	%o6
	movvc	%xcc,	%g6,	%l3
	srl	%i7,	%g3,	%g2
	fmovsle	%xcc,	%f5,	%f28
	array32	%i0,	%l5,	%l1
	movrne	%i5,	%l0,	%o1
	umulcc	%i4,	0x1FB2,	%o0
	edge8	%g5,	%o4,	%i6
	nop
	set	0x76, %l3
	ldstub	[%l7 + %l3],	%o3
	tpos	%icc,	0x3
	edge32l	%i2,	%o2,	%l2
	alignaddr	%o7,	%g7,	%o5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%g1
	smul	%i1,	%l6,	%i3
	mulx	%l4,	%o6,	%g6
	tvc	%icc,	0x7
	movre	%l3,	%i7,	%g3
	fmovsl	%xcc,	%f17,	%f21
	fsrc2	%f18,	%f22
	addcc	%g4,	0x090F,	%g2
	move	%icc,	%i0,	%l1
	mulx	%i5,	%l5,	%o1
	array16	%i4,	%l0,	%o0
	move	%icc,	%o4,	%g5
	bleu	loop_810
	tvs	%xcc,	0x0
	movge	%xcc,	%i6,	%o3
	fpsub32s	%f26,	%f0,	%f17
loop_810:
	stbar
	andcc	%i2,	%l2,	%o7
	movne	%xcc,	%o2,	%o5
	bge,a,pt	%icc,	loop_811
	sll	%g1,	%i1,	%g7
	ldsb	[%l7 + 0x08],	%i3
	movg	%icc,	%l6,	%l4
loop_811:
	bvs,a	%icc,	loop_812
	fand	%f4,	%f2,	%f6
	lduw	[%l7 + 0x44],	%o6
	tvc	%xcc,	0x4
loop_812:
	fones	%f6
	tcs	%icc,	0x0
	brlz,a	%l3,	loop_813
	te	%xcc,	0x0
	umulcc	%i7,	0x1A40,	%g3
	fpsub16	%f6,	%f24,	%f6
loop_813:
	bcs,pn	%icc,	loop_814
	membar	0x6B
	fpack32	%f14,	%f20,	%f28
	tle	%icc,	0x3
loop_814:
	edge16n	%g6,	%g2,	%i0
	edge8n	%l1,	%g4,	%i5
	edge8	%l5,	%i4,	%l0
	subc	%o0,	%o1,	%g5
	sdivcc	%i6,	0x1650,	%o3
	ldsb	[%l7 + 0x6E],	%i2
	tsubcc	%o4,	%o7,	%o2
	sub	%l2,	0x19AC,	%g1
	fmovrdlez	%i1,	%f26,	%f2
	subccc	%o5,	0x092E,	%i3
	move	%icc,	%g7,	%l6
	edge32	%o6,	%l3,	%l4
	fmovrde	%g3,	%f10,	%f18
	fpadd32	%f20,	%f28,	%f0
	mova	%icc,	%i7,	%g6
	udivcc	%i0,	0x13C1,	%g2
	call	loop_815
	mulx	%l1,	0x0C67,	%g4
	fbule,a	%fcc2,	loop_816
	ldsb	[%l7 + 0x4F],	%i5
loop_815:
	fors	%f9,	%f27,	%f20
	movl	%icc,	%i4,	%l0
loop_816:
	orcc	%l5,	%o1,	%o0
	membar	0x13
	bcc,pn	%icc,	loop_817
	bleu,pt	%xcc,	loop_818
	subc	%g5,	0x0066,	%o3
	fbe	%fcc3,	loop_819
loop_817:
	movneg	%icc,	%i6,	%o4
loop_818:
	edge32ln	%o7,	%i2,	%l2
	ldsb	[%l7 + 0x32],	%g1
loop_819:
	sethi	0x1E8A,	%i1
	fmovrsgez	%o5,	%f11,	%f18
	udivcc	%i3,	0x1115,	%o2
	fnot2	%f12,	%f16
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x04,	%i6
	tle	%xcc,	0x7
	be,pt	%icc,	loop_820
	sra	%o6,	0x1E,	%l3
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0x1
loop_820:
	ble	loop_821
	fnegd	%f16,	%f4
	lduh	[%l7 + 0x58],	%g3
	movneg	%icc,	%i7,	%g6
loop_821:
	taddcc	%l4,	0x0916,	%g2
	fbn,a	%fcc3,	loop_822
	movne	%xcc,	%l1,	%g4
	fmuld8sux16	%f1,	%f2,	%f8
	fba,a	%fcc3,	loop_823
loop_822:
	sub	%i5,	0x1679,	%i4
	tvc	%icc,	0x1
	wr	%g0,	0x52,	%asi
	stxa	%l0,	[%g0 + 0x218] %asi
loop_823:
	move	%icc,	%l5,	%o1
	add	%i0,	%o0,	%g5
	fbe,a	%fcc2,	loop_824
	umul	%o3,	0x175D,	%i6
	sub	%o7,	0x1A00,	%o4
	smulcc	%i2,	0x1519,	%g1
loop_824:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i1
	fbne,a	%fcc1,	loop_825
	fornot2s	%f7,	%f6,	%f3
	call	loop_826
	fmovsle	%icc,	%f3,	%f31
loop_825:
	subcc	%o5,	0x1AFA,	%i3
	ldsw	[%l7 + 0x78],	%o2
loop_826:
	srlx	%l6,	0x17,	%l2
	mulscc	%l3,	%g7,	%g3
	tneg	%xcc,	0x2
	edge16n	%i7,	%o6,	%g6
	fmovsleu	%icc,	%f23,	%f27
	movl	%icc,	%l4,	%g2
	udivx	%g4,	0x0830,	%i5
	sdiv	%l1,	0x0231,	%i4
	ldub	[%l7 + 0x0F],	%l5
	tcc	%xcc,	0x2
	fmovrdlez	%o1,	%f0,	%f24
	orn	%l0,	0x0137,	%i0
	tpos	%xcc,	0x0
	membar	0x7A
	movn	%xcc,	%o0,	%o3
	orcc	%i6,	0x0BDC,	%o7
	fmovdgu	%xcc,	%f18,	%f30
	fpsub16s	%f20,	%f31,	%f13
	sdiv	%o4,	0x0255,	%g5
	fxnors	%f8,	%f20,	%f27
	brnz	%i2,	loop_827
	brlz,a	%i1,	loop_828
	fmovrde	%o5,	%f26,	%f4
	bne,pn	%xcc,	loop_829
loop_827:
	andncc	%g1,	%o2,	%l6
loop_828:
	array8	%l2,	%i3,	%g7
	ldd	[%l7 + 0x28],	%f16
loop_829:
	movleu	%xcc,	%g3,	%i7
	edge16n	%o6,	%l3,	%g6
	wr	%g0,	0x89,	%asi
	stda	%g2,	[%l7 + 0x10] %asi
	fnands	%f11,	%f29,	%f18
	srlx	%g4,	%i5,	%l1
	fnors	%f25,	%f12,	%f21
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	edge32l	%l5,	%l4,	%l0
	movvc	%xcc,	%o1,	%i0
	tn	%icc,	0x2
	movneg	%xcc,	%o0,	%o3
	tge	%xcc,	0x5
	set	0x50, %l0
	sta	%f29,	[%l7 + %l0] 0x19
	alignaddrl	%o7,	%i6,	%o4
	fba	%fcc2,	loop_830
	addcc	%i2,	0x0ED0,	%g5
	fmovd	%f22,	%f8
	addcc	%i1,	0x16A3,	%g1
loop_830:
	tgu	%xcc,	0x4
	edge8l	%o5,	%o2,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x08],	 0x1
	bpos,a	%xcc,	loop_831
	sll	%l6,	0x07,	%i3
	sth	%g3,	[%l7 + 0x08]
	fmul8ulx16	%f10,	%f4,	%f24
loop_831:
	movne	%icc,	%i7,	%o6
	fpsub32s	%f10,	%f27,	%f21
	sth	%g7,	[%l7 + 0x70]
	fsrc1s	%f29,	%f2
	udivx	%g6,	0x0067,	%l3
	addc	%g4,	0x0283,	%g2
	xnor	%i5,	%i4,	%l1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%l5
	set	0x44, %o3
	lduwa	[%l7 + %o3] 0x18,	%l4
	movre	%l0,	%o1,	%i0
	taddcc	%o0,	0x0B05,	%o7
	movl	%icc,	%i6,	%o3
	fcmpes	%fcc0,	%f27,	%f19
	tl	%xcc,	0x5
	tcs	%xcc,	0x4
	fmovsge	%icc,	%f9,	%f10
	edge8	%i2,	%g5,	%o4
	fmuld8ulx16	%f1,	%f27,	%f8
	fmovsn	%icc,	%f26,	%f30
	edge16l	%g1,	%i1,	%o2
	umul	%o5,	0x0562,	%l6
	edge16ln	%i3,	%l2,	%g3
	std	%f10,	[%l7 + 0x78]
	tsubcctv	%i7,	%g7,	%g6
	fmovrslez	%l3,	%f9,	%f7
	orcc	%o6,	%g2,	%i5
	tvs	%icc,	0x2
	mulscc	%g4,	%l1,	%i4
	subcc	%l5,	0x16B3,	%l0
	tg	%icc,	0x4
	ldsw	[%l7 + 0x64],	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f24,	%f26,	%f18
	tcs	%icc,	0x3
	bleu	%icc,	loop_832
	bcs,pn	%icc,	loop_833
	fmovrdne	%i0,	%f0,	%f6
	ldd	[%l7 + 0x60],	%f12
loop_832:
	udivx	%o0,	0x0F41,	%o7
loop_833:
	edge8l	%o1,	%o3,	%i6
	taddcctv	%g5,	%i2,	%g1
	bcc,a,pn	%xcc,	loop_834
	fsrc1s	%f2,	%f0
	sdiv	%o4,	0x1348,	%i1
	tl	%xcc,	0x2
loop_834:
	fzeros	%f6
	bg,a,pn	%xcc,	loop_835
	udivcc	%o5,	0x05C0,	%o2
	sdivcc	%i3,	0x06BE,	%l2
	addccc	%l6,	%g3,	%i7
loop_835:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%g6
	udivx	%l3,	0x1CDE,	%o6
	movcs	%icc,	%g2,	%g7
	brz,a	%g4,	loop_836
	brgez	%l1,	loop_837
	fcmpgt16	%f16,	%f22,	%i5
	xorcc	%i4,	%l5,	%l0
loop_836:
	srax	%l4,	%i0,	%o0
loop_837:
	sdivcc	%o1,	0x07F4,	%o3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x78] %asi,	%o7
	mova	%icc,	%i6,	%i2
	movvs	%icc,	%g5,	%g1
	fxnor	%f26,	%f14,	%f0
	nop
	setx	loop_838,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%i1,	%o4,	%o5
	subc	%i3,	%l2,	%o2
	udivx	%l6,	0x0D79,	%g3
loop_838:
	fmovrslez	%i7,	%f23,	%f31
	std	%l2,	[%l7 + 0x60]
	subccc	%g6,	%o6,	%g7
	tsubcctv	%g4,	0x1087,	%l1
	movneg	%icc,	%g2,	%i4
	fmovrdne	%l5,	%f8,	%f14
	fmovscc	%xcc,	%f1,	%f7
	fbu	%fcc2,	loop_839
	movcc	%icc,	%i5,	%l0
	umulcc	%i0,	0x1D49,	%o0
	ldx	[%l7 + 0x18],	%o1
loop_839:
	fpmerge	%f31,	%f10,	%f14
	subcc	%l4,	0x126B,	%o7
	tne	%icc,	0x5
	xor	%i6,	0x1661,	%i2
	set	0x6C, %l2
	lduwa	[%l7 + %l2] 0x80,	%g5
	tne	%icc,	0x2
	tg	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	stba	%g1,	[%l7 + 0x6E] %asi
	fmovdcs	%icc,	%f23,	%f27
	andncc	%o3,	%o4,	%o5
	movrlz	%i3,	%l2,	%o2
	movle	%xcc,	%l6,	%i1
	wr	%g0,	0xe3,	%asi
	stba	%g3,	[%l7 + 0x14] %asi
	membar	#Sync
	movvc	%icc,	%l3,	%g6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%o6
	fbue,a	%fcc2,	loop_840
	fmovrsne	%i7,	%f5,	%f4
	xnorcc	%g4,	0x1FE7,	%g7
	add	%l1,	0x0DA6,	%g2
loop_840:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x70] %asi,	%l5
	array32	%i4,	%l0,	%i0
	movvc	%icc,	%o0,	%i5
	ldsb	[%l7 + 0x43],	%l4
	sllx	%o7,	0x1E,	%i6
	and	%o1,	%g5,	%i2
	fbg,a	%fcc1,	loop_841
	fors	%f29,	%f14,	%f2
	andcc	%o3,	0x06A7,	%o4
	te	%icc,	0x3
loop_841:
	tle	%icc,	0x0
	fbl,a	%fcc3,	loop_842
	ldx	[%l7 + 0x60],	%o5
	edge32l	%g1,	%l2,	%i3
	sllx	%o2,	%i1,	%g3
loop_842:
	fmovdle	%icc,	%f19,	%f10
	add	%l7,	0x44,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l6,	%g6
	fors	%f3,	%f3,	%f12
	flush	%l7 + 0x18
	movne	%xcc,	%o6,	%i7
	fmovrsgz	%l3,	%f25,	%f5
	fmuld8sux16	%f23,	%f23,	%f20
	fpsub32	%f0,	%f6,	%f12
	edge16l	%g7,	%g4,	%g2
	movrlz	%l5,	0x049,	%l1
	alignaddr	%i4,	%i0,	%o0
	call	loop_843
	movrlz	%l0,	%l4,	%o7
	or	%i6,	%o1,	%g5
	fmovdvc	%icc,	%f14,	%f26
loop_843:
	addc	%i5,	0x0657,	%i2
	fxors	%f5,	%f26,	%f22
	st	%f12,	[%l7 + 0x14]
	fzeros	%f26
	ba,a	loop_844
	movle	%xcc,	%o4,	%o5
	fmovsg	%xcc,	%f4,	%f7
	edge32n	%o3,	%g1,	%i3
loop_844:
	ldsb	[%l7 + 0x55],	%o2
	tleu	%icc,	0x3
	movrlez	%l2,	%i1,	%l6
	wr	%g0,	0x27,	%asi
	stha	%g3,	[%l7 + 0x58] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o6,	0x2A6,	%i7
	fcmps	%fcc3,	%f27,	%f2
	fcmpeq16	%f18,	%f6,	%l3
	ldstub	[%l7 + 0x79],	%g6
	add	%g7,	%g4,	%g2
	swap	[%l7 + 0x18],	%l5
	fcmpes	%fcc0,	%f7,	%f28
	movle	%xcc,	%i4,	%i0
	array32	%l1,	%o0,	%l4
	and	%o7,	%l0,	%i6
	and	%g5,	0x0980,	%o1
	brnz	%i2,	loop_845
	movcc	%icc,	%o4,	%o5
	nop
	setx	loop_846,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul,a	%fcc3,	loop_847
loop_845:
	stb	%o3,	[%l7 + 0x72]
	smul	%g1,	%i5,	%o2
loop_846:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_847:
	array32	%l2,	%i3,	%i1
	ldsw	[%l7 + 0x38],	%l6
	mova	%xcc,	%o6,	%i7
	array8	%g3,	%l3,	%g7
	movl	%xcc,	%g6,	%g2
	movvs	%icc,	%g4,	%l5
	edge32ln	%i0,	%i4,	%l1
	tg	%xcc,	0x2
	flush	%l7 + 0x70
	edge8ln	%l4,	%o0,	%l0
	srax	%i6,	%g5,	%o7
	fmovsle	%xcc,	%f29,	%f10
	smulcc	%o1,	0x111E,	%i2
	tneg	%xcc,	0x6
	faligndata	%f0,	%f22,	%f24
	orcc	%o4,	%o3,	%g1
	tcc	%xcc,	0x2
	edge32l	%i5,	%o2,	%l2
	sethi	0x0F95,	%o5
	sdivx	%i3,	0x17F9,	%i1
	fnot1s	%f0,	%f28
	udivcc	%o6,	0x15C5,	%i7
	edge32l	%l6,	%g3,	%l3
	tge	%xcc,	0x1
	bcc	loop_848
	tcs	%xcc,	0x6
	tgu	%xcc,	0x3
	brnz,a	%g7,	loop_849
loop_848:
	fbu,a	%fcc2,	loop_850
	fmovscs	%icc,	%f24,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_849:
	xor	%g2,	%g6,	%g4
loop_850:
	ldsh	[%l7 + 0x7A],	%i0
	or	%i4,	0x1D32,	%l5
	movl	%xcc,	%l1,	%l4
	pdist	%f24,	%f20,	%f28
	add	%l0,	%i6,	%g5
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x56] %asi,	%o0
	srl	%o1,	%i2,	%o7
	ldsw	[%l7 + 0x08],	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g1,	0x1EAB,	%i5
	movcs	%icc,	%o3,	%l2
	tpos	%icc,	0x2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o2
	fcmpes	%fcc2,	%f8,	%f22
	orncc	%o5,	0x18B0,	%i3
	bge,pn	%xcc,	loop_851
	edge16ln	%i1,	%o6,	%l6
	edge16	%i7,	%l3,	%g3
	or	%g2,	%g7,	%g6
loop_851:
	bge,a,pn	%xcc,	loop_852
	bvc,a,pn	%xcc,	loop_853
	subcc	%i0,	%g4,	%l5
	fmovdneg	%xcc,	%f11,	%f9
loop_852:
	fblg,a	%fcc3,	loop_854
loop_853:
	fcmpgt16	%f10,	%f2,	%l1
	movrgez	%i4,	0x1BA,	%l4
	fblg	%fcc0,	loop_855
loop_854:
	movrne	%i6,	0x00A,	%g5
	mulx	%l0,	0x1872,	%o0
	srax	%o1,	%o7,	%o4
loop_855:
	subc	%g1,	0x0342,	%i5
	tg	%xcc,	0x7
	mulscc	%i2,	%l2,	%o3
	sub	%o2,	0x086E,	%i3
	movrlez	%o5,	0x119,	%i1
	sll	%l6,	%i7,	%l3
	addcc	%g3,	0x0B20,	%g2
	fmovse	%xcc,	%f18,	%f25
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8	%o6,	%g6,	%g7
	edge32l	%i0,	%g4,	%l1
	edge8n	%i4,	%l5,	%i6
	fone	%f12
	fmovsle	%icc,	%f10,	%f12
	edge32l	%l4,	%g5,	%o0
	edge16ln	%o1,	%l0,	%o4
	fmul8x16al	%f9,	%f13,	%f16
	fcmple16	%f10,	%f22,	%o7
	sir	0x12C5
	sdiv	%i5,	0x1BEA,	%i2
	fbuge	%fcc1,	loop_856
	orn	%g1,	0x1650,	%l2
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o3
loop_856:
	bge,a,pt	%xcc,	loop_857
	taddcc	%i3,	%o2,	%i1
	edge32l	%l6,	%i7,	%o5
	srlx	%g3,	%g2,	%o6
loop_857:
	movleu	%icc,	%g6,	%l3
	movpos	%icc,	%i0,	%g4
	movg	%xcc,	%g7,	%i4
	sll	%l5,	0x05,	%i6
	fbl	%fcc3,	loop_858
	movrlz	%l1,	0x2E4,	%l4
	fmovdneg	%xcc,	%f0,	%f10
	fcmpes	%fcc3,	%f9,	%f11
loop_858:
	stbar
	edge16l	%g5,	%o1,	%l0
	fmovsneg	%xcc,	%f25,	%f29
	alignaddr	%o4,	%o0,	%o7
	subcc	%i2,	%g1,	%l2
	add	%i5,	%i3,	%o3
	fandnot2s	%f29,	%f5,	%f7
	movrgez	%i1,	0x320,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f12,	%f29,	%f22
	fsrc1	%f18,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%i7,	loop_859
	fbl,a	%fcc0,	loop_860
	array32	%o2,	%g3,	%g2
	bg,a	loop_861
loop_859:
	movle	%xcc,	%o6,	%o5
loop_860:
	move	%xcc,	%l3,	%i0
	bleu	%xcc,	loop_862
loop_861:
	xnorcc	%g4,	0x0D69,	%g7
	xor	%g6,	0x0770,	%l5
	srl	%i6,	0x18,	%i4
loop_862:
	movg	%xcc,	%l4,	%g5
	sethi	0x0BD7,	%o1
	fbg	%fcc2,	loop_863
	stw	%l1,	[%l7 + 0x54]
	mulx	%o4,	%o0,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_863:
	fbg	%fcc1,	loop_864
	array16	%i2,	%l0,	%g1
	fmovsa	%xcc,	%f12,	%f1
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x18] %asi,	%i5
loop_864:
	srlx	%i3,	0x16,	%o3
	alignaddr	%i1,	%l2,	%i7
	smulcc	%l6,	0x0C02,	%g3
	sub	%o2,	0x1D11,	%o6
	udivx	%o5,	0x0D4B,	%g2
	fmovrslz	%i0,	%f14,	%f22
	srl	%l3,	0x03,	%g7
	movl	%xcc,	%g4,	%g6
	edge16ln	%i6,	%i4,	%l4
	mova	%xcc,	%g5,	%o1
	orn	%l5,	0x0B51,	%l1
	be,a,pt	%icc,	loop_865
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o0,	%o4,	%i2
	tvs	%icc,	0x5
loop_865:
	tcs	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o7
	bshuffle	%f20,	%f24,	%f2
	fandnot1	%f6,	%f28,	%f2
	fpack32	%f6,	%f0,	%f8
	orncc	%l0,	0x0A2E,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x74],	%f18
	tvc	%xcc,	0x2
	fpmerge	%f8,	%f27,	%f22
	fmovrsgez	%i3,	%f28,	%f3
	brlez	%o3,	loop_866
	fsrc2s	%f16,	%f1
	array32	%g1,	%l2,	%i7
	bvc	%xcc,	loop_867
loop_866:
	fba,a	%fcc0,	loop_868
	fba,a	%fcc2,	loop_869
	xnor	%l6,	%g3,	%o2
loop_867:
	bne,a,pn	%xcc,	loop_870
loop_868:
	fxnors	%f17,	%f12,	%f19
loop_869:
	movcc	%icc,	%i1,	%o5
	bn,pn	%xcc,	loop_871
loop_870:
	edge16l	%g2,	%o6,	%i0
	movcc	%icc,	%l3,	%g4
	array8	%g7,	%i6,	%g6
loop_871:
	tn	%icc,	0x2
	movrlz	%l4,	%g5,	%o1
	tcc	%icc,	0x1
	movrne	%i4,	0x1FF,	%l1
	faligndata	%f8,	%f6,	%f22
	fcmpeq32	%f26,	%f30,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc3,	%f6,	%f30
	movrlz	%o4,	0x22C,	%i2
	bvc	%xcc,	loop_872
	edge16n	%o7,	%l0,	%i5
	movrgez	%o0,	%i3,	%g1
	edge32l	%o3,	%i7,	%l6
loop_872:
	siam	0x3
	fnor	%f18,	%f4,	%f4
	set	0x60, %g7
	lduwa	[%l7 + %g7] 0x10,	%l2
	srax	%g3,	0x10,	%o2
	edge16l	%o5,	%g2,	%i1
	tsubcctv	%i0,	0x02FA,	%o6
	movleu	%icc,	%l3,	%g7
	xnor	%i6,	%g4,	%l4
	prefetch	[%l7 + 0x44],	 0x3
	faligndata	%f6,	%f8,	%f2
	movrne	%g5,	%g6,	%o1
	sllx	%i4,	0x15,	%l1
	fornot2	%f4,	%f6,	%f24
	fmovsneg	%xcc,	%f8,	%f15
	tneg	%icc,	0x1
	siam	0x2
	addcc	%o4,	%i2,	%o7
	fandnot1	%f22,	%f12,	%f4
	taddcctv	%l5,	0x09DC,	%i5
	fbge,a	%fcc3,	loop_873
	edge8n	%o0,	%i3,	%l0
	umul	%o3,	%g1,	%i7
	fmovdgu	%icc,	%f19,	%f26
loop_873:
	taddcctv	%l2,	0x0C2D,	%l6
	ble	%icc,	loop_874
	movne	%icc,	%g3,	%o5
	set	0x18, %i4
	stda	%g2,	[%l7 + %i4] 0x15
loop_874:
	sth	%o2,	[%l7 + 0x6E]
	fbn,a	%fcc1,	loop_875
	bshuffle	%f26,	%f18,	%f8
	xnor	%i0,	0x0416,	%o6
	xnor	%l3,	0x0C67,	%g7
loop_875:
	fcmple16	%f24,	%f22,	%i1
	edge16n	%g4,	%l4,	%g5
	movcs	%xcc,	%i6,	%g6
	membar	0x13
	taddcctv	%i4,	%l1,	%o1
	brz	%o4,	loop_876
	andn	%i2,	0x1420,	%l5
	movneg	%icc,	%o7,	%i5
	movvs	%icc,	%o0,	%i3
loop_876:
	edge8l	%l0,	%g1,	%i7
	sub	%o3,	%l2,	%l6
	edge16ln	%o5,	%g2,	%g3
	fble	%fcc3,	loop_877
	udivx	%o2,	0x1AF1,	%i0
	xnorcc	%l3,	%o6,	%g7
	fmuld8ulx16	%f10,	%f25,	%f6
loop_877:
	tge	%icc,	0x3
	edge32	%g4,	%l4,	%g5
	bneg,a	loop_878
	fandnot2s	%f29,	%f18,	%f1
	bne,pn	%xcc,	loop_879
	srax	%i6,	%i1,	%i4
loop_878:
	umul	%g6,	%l1,	%o4
	udiv	%i2,	0x1A44,	%o1
loop_879:
	mulx	%o7,	0x046D,	%l5
	set	0x50, %i7
	ldswa	[%l7 + %i7] 0x89,	%i5
	edge8ln	%o0,	%i3,	%g1
	tge	%icc,	0x3
	andncc	%l0,	%o3,	%i7
	movrne	%l2,	%o5,	%l6
	movneg	%icc,	%g2,	%g3
	ba,pt	%icc,	loop_880
	tne	%xcc,	0x3
	addccc	%o2,	0x01EA,	%l3
	membar	0x59
loop_880:
	stw	%o6,	[%l7 + 0x14]
	wr	%g0,	0xea,	%asi
	stha	%g7,	[%l7 + 0x28] %asi
	membar	#Sync
	mova	%xcc,	%g4,	%i0
	movl	%xcc,	%g5,	%i6
	nop
	setx loop_881, %l0, %l1
	jmpl %l1, %l4
	tcc	%xcc,	0x5
	movrgez	%i1,	0x3B2,	%i4
	movle	%xcc,	%g6,	%l1
loop_881:
	movrgez	%o4,	%o1,	%o7
	set	0x55, %o7
	ldsba	[%l7 + %o7] 0x10,	%l5
	subc	%i5,	%o0,	%i3
	xor	%i2,	%g1,	%o3
	set	0x33, %l4
	stba	%l0,	[%l7 + %l4] 0x10
	andn	%l2,	%i7,	%l6
	bpos	%xcc,	loop_882
	edge16n	%o5,	%g2,	%g3
	swap	[%l7 + 0x4C],	%o2
	array16	%o6,	%g7,	%g4
loop_882:
	nop
	set	0x64, %o6
	stha	%i0,	[%l7 + %o6] 0x11
	fmovrdlez	%g5,	%f4,	%f24
	lduh	[%l7 + 0x5A],	%l3
	edge16n	%i6,	%l4,	%i1
	fmovsg	%icc,	%f1,	%f21
	srl	%g6,	%l1,	%o4
	smulcc	%i4,	0x1929,	%o1
	edge16l	%o7,	%i5,	%o0
	tl	%icc,	0x6
	srax	%l5,	0x10,	%i3
	fzero	%f18
	fmovrsgz	%g1,	%f23,	%f1
	movrne	%o3,	%l0,	%l2
	bleu,a,pn	%icc,	loop_883
	bleu	%icc,	loop_884
	fmovsneg	%xcc,	%f19,	%f2
	smulcc	%i2,	%i7,	%o5
loop_883:
	edge32n	%g2,	%l6,	%o2
loop_884:
	xor	%g3,	0x0932,	%g7
	fandnot1s	%f27,	%f20,	%f8
	addccc	%g4,	0x0840,	%i0
	edge16	%o6,	%l3,	%i6
	fcmple32	%f22,	%f8,	%g5
	xnorcc	%i1,	%g6,	%l4
	edge8n	%l1,	%i4,	%o4
	subc	%o1,	%i5,	%o7
	movrne	%l5,	0x2E9,	%o0
	movvs	%xcc,	%g1,	%o3
	array16	%i3,	%l2,	%l0
	movrlz	%i2,	%i7,	%o5
	membar	0x1F
	fmul8ulx16	%f30,	%f20,	%f8
	st	%f28,	[%l7 + 0x74]
	alignaddrl	%g2,	%l6,	%g3
	brlz	%o2,	loop_885
	movle	%xcc,	%g4,	%g7
	fpsub32s	%f12,	%f22,	%f27
	array16	%o6,	%i0,	%i6
loop_885:
	movrlz	%l3,	0x056,	%i1
	movne	%icc,	%g5,	%g6
	tgu	%xcc,	0x3
	bne,a,pn	%icc,	loop_886
	brnz	%l1,	loop_887
	umulcc	%l4,	0x0579,	%i4
	sll	%o4,	0x07,	%o1
loop_886:
	alignaddr	%o7,	%i5,	%o0
loop_887:
	tpos	%icc,	0x5
	mova	%xcc,	%g1,	%l5
	pdist	%f16,	%f2,	%f8
	edge8	%i3,	%o3,	%l0
	sdivx	%i2,	0x13AF,	%i7
	fcmple32	%f28,	%f10,	%o5
	movre	%g2,	%l6,	%l2
	movcc	%icc,	%g3,	%g4
	sra	%g7,	%o2,	%o6
	for	%f22,	%f14,	%f14
	brgez	%i0,	loop_888
	andcc	%l3,	0x167F,	%i1
	stbar
	fbule	%fcc1,	loop_889
loop_888:
	mulscc	%g5,	0x03D4,	%g6
	brgz	%i6,	loop_890
	umulcc	%l4,	0x1235,	%i4
loop_889:
	fmovdpos	%xcc,	%f17,	%f25
	ldd	[%l7 + 0x10],	%o4
loop_890:
	umulcc	%l1,	%o1,	%i5
	fornot2s	%f31,	%f7,	%f14
	sll	%o7,	0x02,	%o0
	tvs	%xcc,	0x6
	edge32ln	%l5,	%i3,	%o3
	mova	%icc,	%g1,	%l0
	xnor	%i7,	0x1CC1,	%o5
	fmovsn	%xcc,	%f28,	%f23
	ldstub	[%l7 + 0x6F],	%g2
	set	0x58, %i5
	lda	[%l7 + %i5] 0x11,	%f30
	lduw	[%l7 + 0x2C],	%i2
	fnot2	%f28,	%f6
	alignaddr	%l2,	%l6,	%g4
	membar	0x36
	ldd	[%l7 + 0x48],	%f14
	tg	%xcc,	0x1
	membar	0x0C
	xor	%g3,	%o2,	%o6
	swap	[%l7 + 0x50],	%i0
	srlx	%l3,	%g7,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f22,	%f22,	%i1
	ldx	[%l7 + 0x58],	%g6
	array32	%i6,	%l4,	%i4
	movrlz	%l1,	0x28D,	%o1
	edge16l	%i5,	%o4,	%o7
	movl	%icc,	%l5,	%i3
	edge8ln	%o3,	%o0,	%l0
	membar	0x71
	or	%g1,	0x14F8,	%o5
	movl	%icc,	%i7,	%i2
	edge8n	%l2,	%g2,	%l6
	tne	%icc,	0x4
	tcs	%icc,	0x1
	fmovdne	%icc,	%f20,	%f6
	membar	0x44
	taddcctv	%g4,	%o2,	%g3
	tl	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x40] %asi,	%o6
	stw	%i0,	[%l7 + 0x34]
	ldsw	[%l7 + 0x6C],	%l3
	st	%f2,	[%l7 + 0x24]
	edge8ln	%g5,	%i1,	%g7
	fmovde	%icc,	%f11,	%f28
	fnegs	%f27,	%f21
	ta	%icc,	0x5
	sll	%i6,	%l4,	%g6
	udiv	%i4,	0x144C,	%l1
	xnorcc	%o1,	0x1625,	%o4
	fmovsleu	%xcc,	%f13,	%f9
	taddcctv	%o7,	0x0DB5,	%i5
	movne	%icc,	%l5,	%o3
	umul	%i3,	0x09AB,	%o0
	orcc	%l0,	0x1824,	%g1
	te	%xcc,	0x7
	mulscc	%o5,	0x16C6,	%i7
	bne,pn	%icc,	loop_891
	fmovdge	%icc,	%f23,	%f12
	udivcc	%i2,	0x0DA2,	%g2
	edge32	%l2,	%g4,	%o2
loop_891:
	tn	%icc,	0x0
	fmovsl	%icc,	%f6,	%f31
	fcmps	%fcc0,	%f5,	%f24
	fbuge	%fcc3,	loop_892
	fmovrsgez	%g3,	%f8,	%f26
	edge32n	%o6,	%l6,	%i0
	fbuge	%fcc2,	loop_893
loop_892:
	tvc	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g5,	%l3
loop_893:
	edge16l	%g7,	%i1,	%l4
	orncc	%g6,	%i6,	%l1
	orcc	%i4,	%o1,	%o4
	array16	%o7,	%i5,	%l5
	movcc	%icc,	%i3,	%o0
	std	%f30,	[%l7 + 0x30]
	bpos,pt	%icc,	loop_894
	bleu,a	%xcc,	loop_895
	tgu	%icc,	0x4
	swap	[%l7 + 0x1C],	%l0
loop_894:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_895:
	brnz	%o3,	loop_896
	tgu	%icc,	0x6
	movne	%icc,	%o5,	%i7
	set	0x28, %o2
	stda	%i2,	[%l7 + %o2] 0x27
	membar	#Sync
loop_896:
	membar	0x78
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x38],	%f24
	ldsw	[%l7 + 0x14],	%g1
	bvs,pt	%icc,	loop_897
	fmovdn	%xcc,	%f7,	%f4
	brz	%l2,	loop_898
	fbule,a	%fcc2,	loop_899
loop_897:
	tvs	%xcc,	0x7
	be,pn	%xcc,	loop_900
loop_898:
	lduw	[%l7 + 0x34],	%g2
loop_899:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%o2,	[%l7 + 0x2C] %asi
	membar	#Sync
loop_900:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a	loop_901
	tleu	%icc,	0x7
	stx	%g3,	[%l7 + 0x70]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_901:
	bleu,pn	%xcc,	loop_902
	edge16ln	%g4,	%o6,	%l6
	fabss	%f11,	%f26
	tvs	%xcc,	0x4
loop_902:
	bvc,a,pt	%xcc,	loop_903
	flush	%l7 + 0x5C
	movleu	%xcc,	%g5,	%l3
	movle	%icc,	%i0,	%g7
loop_903:
	and	%l4,	%i1,	%g6
	tle	%xcc,	0x3
	tl	%icc,	0x6
	alignaddr	%i6,	%l1,	%i4
	subccc	%o4,	0x179A,	%o7
	fbne,a	%fcc0,	loop_904
	fpadd32	%f14,	%f16,	%f28
	fbule	%fcc3,	loop_905
	movg	%icc,	%i5,	%l5
loop_904:
	andcc	%i3,	%o1,	%l0
	array32	%o3,	%o5,	%o0
loop_905:
	fbge	%fcc2,	loop_906
	add	%i2,	%i7,	%g1
	andncc	%g2,	%o2,	%g3
	umul	%l2,	0x192A,	%g4
loop_906:
	sll	%l6,	0x07,	%g5
	std	%o6,	[%l7 + 0x08]
	alignaddr	%i0,	%l3,	%g7
	tneg	%icc,	0x2
	addcc	%i1,	%g6,	%l4
	edge8l	%i6,	%i4,	%o4
	fsrc1s	%f14,	%f27
	bcs,a,pt	%xcc,	loop_907
	fbue	%fcc1,	loop_908
	srlx	%l1,	0x05,	%i5
	set	0x2B, %i2
	lduba	[%l7 + %i2] 0x11,	%l5
loop_907:
	edge8	%o7,	%o1,	%l0
loop_908:
	nop
	set	0x40, %l5
	lda	[%l7 + %l5] 0x81,	%f15
	bn,a,pn	%xcc,	loop_909
	subc	%o3,	0x0BB1,	%i3
	nop
	setx	loop_910,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bneg	%icc,	loop_911
loop_909:
	fcmpeq16	%f18,	%f2,	%o5
	fbu,a	%fcc1,	loop_912
loop_910:
	fbuge,a	%fcc1,	loop_913
loop_911:
	sra	%o0,	%i7,	%i2
	set	0x58, %o4
	stda	%g2,	[%l7 + %o4] 0xe2
	membar	#Sync
loop_912:
	fcmps	%fcc1,	%f12,	%f14
loop_913:
	udivcc	%o2,	0x0123,	%g1
	taddcc	%l2,	0x0ADF,	%g3
	set	0x08, %g1
	stda	%g4,	[%l7 + %g1] 0x81
	bne,a	%xcc,	loop_914
	fmovdg	%xcc,	%f27,	%f1
	movvs	%xcc,	%l6,	%g5
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%i0
loop_914:
	movrgez	%l3,	%g7,	%i1
	fmovsle	%xcc,	%f19,	%f29
	tsubcc	%o6,	%l4,	%i6
	fbe,a	%fcc0,	loop_915
	edge8n	%g6,	%i4,	%l1
	subcc	%i5,	0x1CBA,	%o4
	udiv	%l5,	0x03A5,	%o7
loop_915:
	array8	%o1,	%l0,	%i3
	taddcc	%o3,	%o0,	%i7
	fand	%f20,	%f4,	%f18
	fnors	%f21,	%f6,	%f5
	subcc	%o5,	%i2,	%o2
	fcmpes	%fcc3,	%f16,	%f20
	edge32l	%g1,	%g2,	%g3
	tcc	%xcc,	0x1
	brgz,a	%g4,	loop_916
	fmovscc	%xcc,	%f15,	%f19
	bge,pt	%xcc,	loop_917
	fmovrde	%l6,	%f12,	%f24
loop_916:
	fmovsge	%xcc,	%f31,	%f22
	tvc	%icc,	0x4
loop_917:
	tsubcc	%g5,	%i0,	%l3
	nop
	setx loop_918, %l0, %l1
	jmpl %l1, %l2
	movpos	%xcc,	%i1,	%g7
	udiv	%o6,	0x1B19,	%i6
	fands	%f24,	%f4,	%f14
loop_918:
	xor	%l4,	0x0377,	%g6
	edge8ln	%l1,	%i4,	%o4
	swap	[%l7 + 0x18],	%i5
	mulx	%l5,	0x1ABE,	%o7
	movle	%icc,	%o1,	%l0
	fnot1	%f24,	%f10
	fbne,a	%fcc0,	loop_919
	tne	%icc,	0x5
	tsubcctv	%o3,	%o0,	%i7
	alignaddrl	%o5,	%i3,	%o2
loop_919:
	edge8	%i2,	%g2,	%g3
	sdiv	%g4,	0x1117,	%g1
	mova	%xcc,	%l6,	%i0
	nop
	setx	loop_920,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez,a	%l3,	loop_921
	sll	%l2,	%g5,	%i1
	or	%g7,	0x1E00,	%o6
loop_920:
	fmovsl	%icc,	%f6,	%f10
loop_921:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x58] %asi,	%i6
	orn	%l4,	0x1C86,	%l1
	movre	%i4,	%g6,	%i5
	ldsh	[%l7 + 0x5A],	%l5
	movgu	%icc,	%o7,	%o4
	set	0x18, %g2
	lda	[%l7 + %g2] 0x10,	%f24
	mova	%xcc,	%l0,	%o1
	fcmple16	%f26,	%f4,	%o3
	udivx	%i7,	0x092F,	%o5
	or	%o0,	0x1095,	%o2
	tpos	%icc,	0x4
	movre	%i3,	0x373,	%g2
	edge16l	%i2,	%g3,	%g4
	fcmped	%fcc2,	%f28,	%f8
	tn	%icc,	0x4
	tg	%xcc,	0x3
	fone	%f30
	stx	%l6,	[%l7 + 0x18]
	alignaddr	%i0,	%g1,	%l3
	fabss	%f21,	%f4
	fmovdg	%icc,	%f28,	%f22
	tg	%xcc,	0x2
	edge32l	%l2,	%i1,	%g7
	tsubcc	%o6,	%g5,	%i6
	sethi	0x0BFD,	%l1
	bgu,pn	%xcc,	loop_922
	xor	%i4,	%l4,	%i5
	fbg,a	%fcc0,	loop_923
	mova	%xcc,	%g6,	%l5
loop_922:
	fcmpgt32	%f12,	%f4,	%o7
	fxnor	%f26,	%f0,	%f14
loop_923:
	nop
	setx	loop_924,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fabss	%f1,	%f1
	fsrc1	%f16,	%f2
	fmovdcs	%icc,	%f15,	%f28
loop_924:
	movrlez	%l0,	%o4,	%o3
	edge32ln	%i7,	%o5,	%o1
	fmovrde	%o2,	%f0,	%f10
	sllx	%i3,	0x1A,	%o0
	movvs	%icc,	%g2,	%i2
	sdivcc	%g4,	0x0FEB,	%l6
	lduh	[%l7 + 0x08],	%g3
	sir	0x17D4
	alignaddr	%i0,	%g1,	%l3
	tne	%xcc,	0x5
	fblg,a	%fcc2,	loop_925
	movne	%xcc,	%l2,	%i1
	popc	%g7,	%g5
	sir	0x0C57
loop_925:
	lduw	[%l7 + 0x3C],	%i6
	xorcc	%l1,	%o6,	%i4
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%l4
	xorcc	%g6,	%l5,	%o7
	sdivx	%i5,	0x19E1,	%l0
	fmovspos	%icc,	%f30,	%f20
	movn	%icc,	%o3,	%o4
	fbne	%fcc0,	loop_926
	brz,a	%o5,	loop_927
	fmovrsgz	%o1,	%f27,	%f1
	fpsub16	%f0,	%f2,	%f4
loop_926:
	subccc	%o2,	0x02E4,	%i3
loop_927:
	movvc	%icc,	%o0,	%i7
	fmovsle	%xcc,	%f1,	%f14
	fnors	%f3,	%f29,	%f22
	umulcc	%g2,	%i2,	%l6
	ldsh	[%l7 + 0x26],	%g3
	bvs,a	loop_928
	array8	%i0,	%g4,	%g1
	ldub	[%l7 + 0x1F],	%l3
	edge8	%l2,	%g7,	%i1
loop_928:
	fbule,a	%fcc2,	loop_929
	movleu	%xcc,	%i6,	%g5
	tgu	%xcc,	0x2
	fcmpgt16	%f14,	%f4,	%o6
loop_929:
	subcc	%l1,	%i4,	%l4
	tg	%xcc,	0x1
	movrne	%g6,	%l5,	%i5
	bne,a,pt	%icc,	loop_930
	fbule,a	%fcc0,	loop_931
	udivx	%l0,	0x089A,	%o7
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x18] %asi
loop_930:
	bneg,pt	%icc,	loop_932
loop_931:
	fmovse	%icc,	%f5,	%f11
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_932:
	fmovsvs	%icc,	%f30,	%f2
	movn	%xcc,	%o3,	%o4
	orcc	%o5,	%o1,	%i3
	tneg	%xcc,	0x6
	movg	%xcc,	%o2,	%i7
	smulcc	%o0,	0x0BFE,	%i2
	fcmps	%fcc2,	%f29,	%f26
	andn	%g2,	%l6,	%g3
	std	%i0,	[%l7 + 0x18]
	sdivcc	%g4,	0x1061,	%g1
	fblg	%fcc1,	loop_933
	movle	%xcc,	%l3,	%l2
	smul	%g7,	%i1,	%g5
	fcmpd	%fcc3,	%f4,	%f20
loop_933:
	tcs	%xcc,	0x6
	nop
	setx loop_934, %l0, %l1
	jmpl %l1, %i6
	movre	%o6,	%i4,	%l1
	tl	%icc,	0x5
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_934:
	te	%xcc,	0x1
	fxor	%f26,	%f18,	%f30
	fpadd16	%f28,	%f22,	%f14
	orn	%g6,	0x0E07,	%l4
	taddcc	%i5,	0x1CDE,	%l5
	tg	%icc,	0x0
	udivcc	%l0,	0x0914,	%o3
	sllx	%o7,	0x0C,	%o5
	ldsb	[%l7 + 0x1C],	%o1
	fmovsvs	%icc,	%f9,	%f19
	mova	%icc,	%o4,	%i3
	array16	%i7,	%o0,	%o2
	brnz	%g2,	loop_935
	bne,a,pn	%icc,	loop_936
	movge	%icc,	%i2,	%g3
	movgu	%xcc,	%l6,	%i0
loop_935:
	xorcc	%g4,	0x10F9,	%g1
loop_936:
	addc	%l2,	0x0C04,	%l3
	fcmpgt16	%f24,	%f30,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f23,	%f1
	fmovdvs	%icc,	%f22,	%f28
	fabsd	%f18,	%f0
	edge32n	%g5,	%g7,	%i6
	edge16ln	%o6,	%i4,	%l1
	membar	0x46
	udiv	%l4,	0x10B1,	%g6
	bcc,a,pt	%icc,	loop_937
	move	%icc,	%l5,	%l0
	movleu	%xcc,	%i5,	%o3
	edge16l	%o5,	%o1,	%o7
loop_937:
	fmovrsne	%o4,	%f31,	%f14
	popc	0x0E86,	%i7
	mulx	%o0,	0x0A5F,	%o2
	andncc	%g2,	%i2,	%g3
	movcc	%icc,	%l6,	%i0
	subcc	%g4,	0x0A5F,	%g1
	add	%l2,	%l3,	%i3
	sra	%g5,	%i1,	%i6
	subc	%o6,	0x0F3E,	%i4
	fornot2	%f26,	%f10,	%f10
	movrne	%g7,	0x0FD,	%l1
	tgu	%xcc,	0x0
	lduh	[%l7 + 0x3A],	%l4
	fcmps	%fcc3,	%f13,	%f6
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovdvc	%xcc,	%f13,	%f5
	brlz	%l5,	loop_938
	ldub	[%l7 + 0x58],	%g6
	fcmps	%fcc0,	%f12,	%f27
	movn	%icc,	%i5,	%o3
loop_938:
	taddcctv	%o5,	0x19F4,	%o1
	xnor	%l0,	0x1225,	%o4
	edge16n	%o7,	%i7,	%o2
	addcc	%g2,	0x1C76,	%o0
	tl	%icc,	0x2
	orn	%i2,	%l6,	%i0
	fcmpgt16	%f12,	%f6,	%g3
	tge	%xcc,	0x6
	tcs	%icc,	0x7
	xor	%g1,	0x0DA7,	%l2
	fcmped	%fcc2,	%f20,	%f6
	fbo	%fcc2,	loop_939
	fpack32	%f0,	%f14,	%f28
	fbu	%fcc2,	loop_940
	edge32	%l3,	%i3,	%g4
loop_939:
	bg,a,pt	%icc,	loop_941
	fnegd	%f2,	%f0
loop_940:
	fmovscc	%icc,	%f29,	%f31
	mova	%icc,	%g5,	%i6
loop_941:
	movrlez	%i1,	%o6,	%g7
	movrne	%i4,	0x05C,	%l4
	add	%l1,	0x0C33,	%l5
	fba	%fcc3,	loop_942
	movrgz	%i5,	0x373,	%o3
	array16	%o5,	%g6,	%o1
	fnot2	%f12,	%f22
loop_942:
	fnand	%f0,	%f0,	%f20
	tvc	%icc,	0x7
	sllx	%l0,	%o4,	%o7
	taddcctv	%o2,	%i7,	%g2
	movrne	%i2,	%l6,	%i0
	tvc	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez,a	%o0,	loop_943
	fbug,a	%fcc3,	loop_944
	tneg	%xcc,	0x4
	taddcctv	%g1,	%g3,	%l2
loop_943:
	fzero	%f22
loop_944:
	fcmple32	%f28,	%f20,	%l3
	fmovda	%icc,	%f29,	%f21
	fcmps	%fcc2,	%f8,	%f25
	fpadd32	%f10,	%f6,	%f0
	fmovrsne	%i3,	%f19,	%f26
	call	loop_945
	addcc	%g5,	%g4,	%i1
	fblg	%fcc1,	loop_946
	movcc	%xcc,	%i6,	%g7
loop_945:
	udiv	%o6,	0x1464,	%i4
	move	%xcc,	%l1,	%l5
loop_946:
	edge32	%i5,	%l4,	%o3
	pdist	%f0,	%f24,	%f14
	ldd	[%l7 + 0x38],	%o4
	smulcc	%o1,	0x086E,	%l0
	bleu	loop_947
	subcc	%g6,	%o7,	%o2
	sth	%o4,	[%l7 + 0x38]
	fpack32	%f4,	%f24,	%f22
loop_947:
	taddcc	%g2,	0x002C,	%i2
	sra	%i7,	%i0,	%o0
	fnand	%f12,	%f4,	%f22
	stx	%g1,	[%l7 + 0x30]
	addccc	%g3,	0x1F69,	%l6
	movge	%xcc,	%l3,	%i3
	fmovscc	%xcc,	%f0,	%f10
	sir	0x11B3
	fandnot1s	%f17,	%f21,	%f17
	movg	%icc,	%l2,	%g4
	fmovrdgz	%i1,	%f8,	%f14
	tpos	%xcc,	0x5
	tcc	%xcc,	0x7
	fabss	%f10,	%f21
	set	0x40, %l6
	ldswa	[%l7 + %l6] 0x15,	%g5
	call	loop_948
	tgu	%xcc,	0x2
	movl	%xcc,	%g7,	%o6
	udivcc	%i6,	0x1DA2,	%i4
loop_948:
	add	%l5,	%i5,	%l1
	subc	%o3,	0x0D17,	%l4
	ldstub	[%l7 + 0x50],	%o1
	fmovda	%icc,	%f22,	%f10
	movgu	%icc,	%o5,	%g6
	fbule	%fcc2,	loop_949
	fcmpes	%fcc2,	%f26,	%f19
	fmul8x16	%f11,	%f12,	%f6
	addcc	%l0,	0x1D76,	%o2
loop_949:
	fba	%fcc3,	loop_950
	edge8ln	%o4,	%o7,	%i2
	fbe	%fcc3,	loop_951
	ta	%xcc,	0x5
loop_950:
	edge8n	%i7,	%i0,	%g2
	be,a	loop_952
loop_951:
	edge8n	%o0,	%g3,	%g1
	fbu,a	%fcc2,	loop_953
	orncc	%l3,	0x0D24,	%l6
loop_952:
	tvc	%icc,	0x5
	bvc	%xcc,	loop_954
loop_953:
	fble	%fcc2,	loop_955
	std	%f28,	[%l7 + 0x78]
	orncc	%l2,	0x0FFB,	%i3
loop_954:
	edge32l	%i1,	%g4,	%g7
loop_955:
	fnor	%f18,	%f26,	%f20
	set	0x74, %o5
	lda	[%l7 + %o5] 0x14,	%f8
	fmovdleu	%xcc,	%f7,	%f10
	ldd	[%l7 + 0x48],	%f10
	fexpand	%f10,	%f10
	mova	%icc,	%o6,	%g5
	tne	%icc,	0x6
	alignaddrl	%i4,	%i6,	%i5
	tcc	%icc,	0x3
	fcmpne16	%f14,	%f20,	%l1
	andcc	%o3,	%l5,	%o1
	edge16	%l4,	%o5,	%g6
	tneg	%xcc,	0x5
	bpos,a	%xcc,	loop_956
	sra	%l0,	%o4,	%o7
	fmovrsgez	%i2,	%f26,	%f18
	edge32l	%o2,	%i7,	%i0
loop_956:
	bneg,a	%xcc,	loop_957
	edge32l	%o0,	%g2,	%g3
	fmovrde	%l3,	%f14,	%f10
	and	%l6,	0x02DB,	%l2
loop_957:
	fones	%f9
	xorcc	%g1,	0x1292,	%i1
	fmovdle	%xcc,	%f22,	%f23
	udivcc	%g4,	0x120B,	%i3
	and	%g7,	%g5,	%o6
	fpsub32s	%f18,	%f18,	%f1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tsubcctv	%i6,	%i4,	%i5
	call	loop_958
	fbuge	%fcc0,	loop_959
	alignaddr	%l1,	%l5,	%o3
	fabss	%f9,	%f21
loop_958:
	fpack16	%f14,	%f15
loop_959:
	fpack32	%f8,	%f18,	%f0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	edge32n	%l4,	%o5,	%g6
	sllx	%o4,	%l0,	%o7
	movrlez	%i2,	%o2,	%i7
	membar	0x07
	fsrc2s	%f7,	%f0
	movre	%i0,	%o0,	%g3
	set	0x24, %i3
	lduba	[%l7 + %i3] 0x15,	%g2
	fbn,a	%fcc3,	loop_960
	siam	0x5
	tpos	%xcc,	0x0
	movn	%xcc,	%l6,	%l3
loop_960:
	edge32l	%l2,	%i1,	%g4
	movvs	%icc,	%i3,	%g1
	edge32l	%g7,	%o6,	%i6
	set	0x44, %g3
	stwa	%g5,	[%l7 + %g3] 0xe2
	membar	#Sync
	lduw	[%l7 + 0x24],	%i4
	array8	%l1,	%i5,	%l5
	movrgez	%o3,	0x3D3,	%o1
	move	%icc,	%l4,	%o5
	tn	%xcc,	0x5
	fbug	%fcc1,	loop_961
	tneg	%xcc,	0x1
	tne	%xcc,	0x3
	fpadd32	%f22,	%f2,	%f18
loop_961:
	fmovrslez	%o4,	%f10,	%f28
	taddcctv	%l0,	0x1370,	%o7
	add	%g6,	%i2,	%o2
	array16	%i7,	%o0,	%i0
	array16	%g2,	%l6,	%l3
	fcmpne32	%f2,	%f10,	%g3
	sll	%i1,	0x05,	%l2
	mulscc	%g4,	0x1CA6,	%g1
	stb	%g7,	[%l7 + 0x65]
	fexpand	%f14,	%f6
	fmovsneg	%icc,	%f11,	%f2
	bl,a,pt	%xcc,	loop_962
	prefetch	[%l7 + 0x28],	 0x3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i3
loop_962:
	andcc	%o6,	0x11E7,	%i6
	and	%i4,	%l1,	%g5
	smulcc	%i5,	0x0937,	%l5
	sethi	0x18AD,	%o1
	tn	%icc,	0x5
	taddcctv	%l4,	0x001F,	%o3
	movl	%xcc,	%o4,	%l0
	edge16l	%o5,	%o7,	%g6
	fmul8sux16	%f2,	%f10,	%f0
	addccc	%i2,	%i7,	%o0
	fnot1	%f24,	%f6
	addccc	%o2,	%i0,	%g2
	fmovdvc	%xcc,	%f23,	%f14
	tle	%xcc,	0x5
	edge16l	%l6,	%g3,	%l3
	udiv	%i1,	0x1D8F,	%g4
	ldstub	[%l7 + 0x14],	%g1
	fmovde	%xcc,	%f11,	%f24
	fandnot1s	%f20,	%f23,	%f29
	fbge,a	%fcc1,	loop_963
	tpos	%icc,	0x1
	fmovdg	%icc,	%f16,	%f30
	sethi	0x1364,	%g7
loop_963:
	movl	%icc,	%i3,	%l2
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x70] %asi
	bvs,a,pn	%icc,	loop_964
	bn,a,pt	%icc,	loop_965
	fbug,a	%fcc2,	loop_966
	tn	%xcc,	0x3
loop_964:
	array32	%o6,	%i4,	%i6
loop_965:
	andncc	%g5,	%i5,	%l1
loop_966:
	nop
	wr	%g0,	0x89,	%asi
	stba	%o1,	[%l7 + 0x11] %asi
	movrne	%l4,	%l5,	%o4
	fbul	%fcc2,	loop_967
	fmovrslz	%l0,	%f29,	%f7
	set	0x48, %i6
	lduwa	[%l7 + %i6] 0x10,	%o5
loop_967:
	edge8l	%o3,	%o7,	%i2
	fbg,a	%fcc0,	loop_968
	fbuge	%fcc2,	loop_969
	edge32n	%i7,	%g6,	%o2
	edge8	%o0,	%g2,	%l6
loop_968:
	bne,pt	%xcc,	loop_970
loop_969:
	taddcctv	%i0,	0x1E54,	%l3
	fones	%f20
	fmovrdlez	%i1,	%f28,	%f12
loop_970:
	tge	%icc,	0x1
	fpadd32	%f18,	%f24,	%f0
	xorcc	%g4,	0x1FF9,	%g3
	mulscc	%g1,	%g7,	%i3
	orncc	%o6,	%l2,	%i4
	movrgez	%i6,	%g5,	%i5
	nop
	set	0x3B, %l1
	ldsb	[%l7 + %l1],	%o1
	fnands	%f15,	%f21,	%f13
	bn,a	loop_971
	ldd	[%l7 + 0x60],	%l4
	stb	%l5,	[%l7 + 0x0F]
	edge8l	%l1,	%o4,	%o5
loop_971:
	fmovdneg	%icc,	%f0,	%f15
	fmovdg	%icc,	%f5,	%f26
	fmovdcc	%xcc,	%f5,	%f29
	srax	%l0,	%o7,	%i2
	orncc	%o3,	%g6,	%i7
	addcc	%o2,	%o0,	%g2
	movge	%xcc,	%i0,	%l3
	tl	%icc,	0x5
	addccc	%l6,	%i1,	%g4
	stx	%g1,	[%l7 + 0x10]
	srlx	%g3,	%g7,	%i3
	movleu	%xcc,	%o6,	%l2
	fmovdg	%icc,	%f30,	%f27
	tvc	%xcc,	0x7
	fornot2	%f2,	%f26,	%f24
	fcmped	%fcc1,	%f26,	%f10
	addcc	%i6,	%i4,	%g5
	fnot1s	%f21,	%f30
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	bgu,a	loop_972
	mulscc	%l4,	%o1,	%l5
	brlz	%l1,	loop_973
	brz,a	%o4,	loop_974
loop_972:
	fmovrdgez	%o5,	%f26,	%f30
	edge32	%o7,	%l0,	%o3
loop_973:
	movg	%xcc,	%i2,	%g6
loop_974:
	fblg	%fcc0,	loop_975
	fmovrdgz	%i7,	%f10,	%f28
	ba	%icc,	loop_976
	mulx	%o2,	0x113B,	%o0
loop_975:
	movleu	%xcc,	%g2,	%i0
	taddcc	%l3,	%l6,	%g4
loop_976:
	brgez,a	%i1,	loop_977
	fpack32	%f0,	%f18,	%f20
	tne	%icc,	0x4
	edge8ln	%g3,	%g1,	%g7
loop_977:
	sdivcc	%o6,	0x1861,	%i3
	movre	%i6,	%l2,	%i4
	movvc	%icc,	%i5,	%g5
	umul	%l4,	%l5,	%o1
	call	loop_978
	array8	%l1,	%o5,	%o4
	fnegs	%f8,	%f27
	edge8	%l0,	%o7,	%o3
loop_978:
	alignaddr	%g6,	%i2,	%o2
	stb	%o0,	[%l7 + 0x5D]
	sdivcc	%g2,	0x0804,	%i0
	fmovrdgez	%l3,	%f28,	%f22
	sll	%l6,	%g4,	%i7
	ldsb	[%l7 + 0x22],	%i1
	for	%f18,	%f18,	%f8
	edge32ln	%g3,	%g7,	%g1
	fcmpeq32	%f30,	%f30,	%i3
	edge16ln	%o6,	%i6,	%i4
	movrne	%i5,	0x235,	%g5
	smul	%l4,	0x1EBD,	%l2
	subcc	%o1,	0x0E93,	%l1
	fmovdvs	%icc,	%f24,	%f22
	fbe	%fcc3,	loop_979
	edge16n	%o5,	%l5,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%o7
loop_979:
	nop
	setx loop_980, %l0, %l1
	jmpl %l1, %g6
	subc	%i2,	%o3,	%o0
	wr	%g0,	0xe2,	%asi
	stba	%g2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_980:
	fcmpne32	%f28,	%f18,	%i0
	bleu,pn	%xcc,	loop_981
	subcc	%l3,	0x175F,	%o2
	edge16l	%l6,	%g4,	%i7
	std	%i0,	[%l7 + 0x60]
loop_981:
	edge8ln	%g7,	%g1,	%g3
	mova	%icc,	%o6,	%i6
	fmovda	%xcc,	%f26,	%f22
	std	%f12,	[%l7 + 0x08]
	fblg	%fcc2,	loop_982
	movrgz	%i3,	0x192,	%i4
	brgez	%i5,	loop_983
	fcmple16	%f4,	%f2,	%l4
loop_982:
	fbo,a	%fcc2,	loop_984
	tsubcc	%g5,	0x036B,	%o1
loop_983:
	fbule,a	%fcc1,	loop_985
	fandnot1	%f30,	%f4,	%f14
loop_984:
	te	%icc,	0x4
	fmovrdgz	%l1,	%f30,	%f6
loop_985:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x0
	andncc	%o5,	%l2,	%l0
	sdiv	%l5,	0x0E1E,	%o4
	subcc	%o7,	0x181B,	%g6
	tvs	%icc,	0x4
	andn	%i2,	%o0,	%g2
	fbe,a	%fcc0,	loop_986
	add	%o3,	0x0AA6,	%i0
	andn	%o2,	%l6,	%g4
	movvs	%icc,	%l3,	%i7
loop_986:
	andn	%i1,	0x0A53,	%g7
	xorcc	%g3,	0x1B10,	%o6
	edge32ln	%i6,	%i3,	%i4
	taddcctv	%i5,	%g1,	%g5
	udivcc	%o1,	0x09F4,	%l1
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o5
	tle	%icc,	0x4
	edge8n	%l4,	%l0,	%l2
	fmovsge	%icc,	%f25,	%f19
	addc	%o4,	%o7,	%g6
	fbo	%fcc3,	loop_987
	udivcc	%i2,	0x0687,	%l5
	movl	%xcc,	%g2,	%o0
	fmovdcc	%icc,	%f14,	%f0
loop_987:
	ldstub	[%l7 + 0x22],	%i0
	te	%icc,	0x3
	stx	%o3,	[%l7 + 0x70]
	fbu	%fcc2,	loop_988
	fmovs	%f5,	%f10
	tpos	%xcc,	0x0
	andncc	%o2,	%g4,	%l3
loop_988:
	flush	%l7 + 0x24
	tvc	%xcc,	0x3
	bg,a,pt	%icc,	loop_989
	tge	%icc,	0x0
	swap	[%l7 + 0x30],	%i7
	xnorcc	%i1,	%l6,	%g3
loop_989:
	nop
	set	0x58, %i0
	lduwa	[%l7 + %i0] 0x04,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x4
	movre	%g7,	0x0F8,	%i3
	stx	%i6,	[%l7 + 0x58]
	te	%icc,	0x2
	sethi	0x15BD,	%i4
	ta	%icc,	0x4
	mulscc	%g1,	%i5,	%g5
	tvs	%xcc,	0x5
	ldd	[%l7 + 0x60],	%l0
	fsrc2	%f8,	%f24
	fmovrsne	%o5,	%f1,	%f15
	movrgez	%l4,	0x383,	%o1
	fmovsneg	%xcc,	%f24,	%f7
	movcc	%xcc,	%l0,	%l2
	fmovsvc	%xcc,	%f24,	%f14
	fmul8x16al	%f1,	%f13,	%f16
	edge8n	%o7,	%g6,	%i2
	sethi	0x07DA,	%o4
	ldsb	[%l7 + 0x74],	%l5
	srax	%o0,	0x01,	%i0
	tge	%icc,	0x1
	fmovdcs	%icc,	%f22,	%f11
	fbn,a	%fcc0,	loop_990
	edge32n	%o3,	%o2,	%g4
	sir	0x0FF0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l3,	%i7
loop_990:
	fmovdne	%icc,	%f21,	%f25
	tsubcctv	%g2,	%l6,	%g3
	subccc	%i1,	0x197E,	%o6
	fnot2s	%f25,	%f6
	stx	%g7,	[%l7 + 0x18]
	xorcc	%i3,	0x1315,	%i4
	fcmps	%fcc0,	%f30,	%f22
	fmovd	%f6,	%f24
	sdiv	%i6,	0x0028,	%i5
	edge8n	%g5,	%l1,	%o5
	fbn	%fcc2,	loop_991
	fmovrslez	%g1,	%f10,	%f17
	sth	%l4,	[%l7 + 0x5E]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_991:
	movpos	%xcc,	%o1,	%l0
	movvc	%icc,	%l2,	%o7
	fnor	%f16,	%f18,	%f14
	movneg	%xcc,	%g6,	%i2
	ldsw	[%l7 + 0x6C],	%l5
	tvc	%xcc,	0x4
	membar	0x23
	nop
	setx loop_992, %l0, %l1
	jmpl %l1, %o4
	udiv	%i0,	0x0E0D,	%o3
	std	%f26,	[%l7 + 0x30]
	ldd	[%l7 + 0x18],	%f20
loop_992:
	edge16ln	%o0,	%g4,	%o2
	popc	%i7,	%g2
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	edge16n	%l6,	%g3,	%l3
	tvc	%icc,	0x0
	fmovsa	%icc,	%f10,	%f29
	tleu	%icc,	0x5
	tpos	%icc,	0x4
	edge16	%o6,	%g7,	%i3
	fcmple16	%f26,	%f16,	%i4
	tneg	%xcc,	0x1
	movrgez	%i6,	%i5,	%i1
	edge8n	%g5,	%o5,	%l1
	bcc	loop_993
	array16	%l4,	%g1,	%o1
	nop
	setx loop_994, %l0, %l1
	jmpl %l1, %l2
	tpos	%icc,	0x0
loop_993:
	andn	%o7,	0x0BC4,	%g6
	bneg,a,pt	%xcc,	loop_995
loop_994:
	bvc,pn	%xcc,	loop_996
	fexpand	%f2,	%f10
	udiv	%l0,	0x185C,	%l5
loop_995:
	edge16n	%o4,	%i2,	%o3
loop_996:
	fba	%fcc0,	loop_997
	popc	%i0,	%o0
	bcs,a,pn	%xcc,	loop_998
	and	%o2,	%g4,	%g2
loop_997:
	popc	%l6,	%g3
	be,a	loop_999
loop_998:
	edge32	%i7,	%l3,	%g7
	bvs,a	loop_1000
	sdivx	%i3,	0x0EF4,	%o6
loop_999:
	edge16ln	%i6,	%i4,	%i5
	sir	0x0A75
loop_1000:
	movvs	%icc,	%g5,	%o5
	fone	%f2
	sdiv	%l1,	0x1642,	%l4
	lduh	[%l7 + 0x5C],	%g1
	movvc	%xcc,	%o1,	%i1
	fbug	%fcc0,	loop_1001
	fmovsge	%xcc,	%f27,	%f17
	fbuge,a	%fcc3,	loop_1002
	udiv	%l2,	0x000B,	%g6
loop_1001:
	nop
	wr	%g0,	0x89,	%asi
	stha	%l0,	[%l7 + 0x2C] %asi
loop_1002:
	movrgez	%l5,	0x244,	%o4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smul	%o7,	0x0335,	%o3
	sll	%i0,	0x1A,	%o0
	and	%o2,	%g4,	%i2
	sllx	%l6,	%g2,	%i7
	sethi	0x133B,	%l3
	edge16ln	%g3,	%g7,	%o6
	tvc	%xcc,	0x2
	fpadd32	%f18,	%f20,	%f8
	fmovrdne	%i3,	%f26,	%f10
	pdist	%f8,	%f24,	%f8
	mulx	%i4,	0x19D4,	%i5
	movl	%xcc,	%g5,	%o5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%i6
	fbge,a	%fcc3,	loop_1003
	fbg	%fcc2,	loop_1004
	bpos,a	loop_1005
	fnors	%f0,	%f27,	%f21
loop_1003:
	umulcc	%l4,	%l1,	%g1
loop_1004:
	tg	%icc,	0x6
loop_1005:
	movvc	%xcc,	%o1,	%i1
	array32	%g6,	%l2,	%l5
	fmovse	%icc,	%f31,	%f30
	mulscc	%l0,	0x17AC,	%o4
	fmovspos	%xcc,	%f17,	%f3
	array8	%o7,	%i0,	%o0
	sethi	0x0C47,	%o3
	fbe,a	%fcc2,	loop_1006
	bcc,a,pt	%xcc,	loop_1007
	movl	%xcc,	%g4,	%i2
	smulcc	%l6,	%g2,	%o2
loop_1006:
	stx	%i7,	[%l7 + 0x08]
loop_1007:
	movrgz	%l3,	%g3,	%o6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x11,	%i3,	%i4
	orncc	%g7,	%g5,	%o5
	xnor	%i6,	0x1B35,	%l4
	smul	%i5,	0x0848,	%g1
	fbge,a	%fcc2,	loop_1008
	fornot2	%f8,	%f16,	%f20
	xnorcc	%o1,	%i1,	%g6
	mulscc	%l1,	0x020E,	%l5
loop_1008:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x11,	%l2,	%l0
	fpadd32s	%f6,	%f10,	%f27
	or	%o7,	0x0BE6,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%o0
	brgez	%g4,	loop_1009
	movcc	%xcc,	%o3,	%l6
	add	%i2,	0x14C9,	%g2
	tpos	%xcc,	0x3
loop_1009:
	movleu	%xcc,	%i7,	%o2
	fblg,a	%fcc2,	loop_1010
	orcc	%l3,	0x0626,	%g3
	orn	%i3,	%i4,	%o6
	bn,a,pt	%xcc,	loop_1011
loop_1010:
	sir	0x0F81
	tge	%xcc,	0x3
	movne	%icc,	%g5,	%g7
loop_1011:
	fbl,a	%fcc0,	loop_1012
	fbn	%fcc2,	loop_1013
	fabss	%f25,	%f24
	movrlez	%i6,	%l4,	%i5
loop_1012:
	fors	%f1,	%f23,	%f18
loop_1013:
	addc	%o5,	%o1,	%i1
	tle	%xcc,	0x6
	ba,pt	%icc,	loop_1014
	sir	0x027D
	edge16n	%g6,	%l1,	%g1
	fnors	%f4,	%f0,	%f5
loop_1014:
	mulx	%l5,	%l0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o4,	%i0,	%o0
	set	0x4B, %g4
	lduba	[%l7 + %g4] 0x80,	%o7
	tn	%xcc,	0x7
	sth	%o3,	[%l7 + 0x5C]
	andn	%g4,	0x03E7,	%l6
	swap	[%l7 + 0x74],	%i2
	for	%f22,	%f8,	%f8
	xnorcc	%i7,	0x1BF3,	%o2
	tge	%xcc,	0x7
	movneg	%xcc,	%g2,	%g3
	tgu	%icc,	0x2
	movvc	%xcc,	%l3,	%i4
	tge	%xcc,	0x7
	bgu,pt	%icc,	loop_1015
	edge16ln	%i3,	%g5,	%o6
	tneg	%icc,	0x7
	bn,a	loop_1016
loop_1015:
	taddcc	%i6,	%g7,	%i5
	ldsb	[%l7 + 0x2A],	%o5
	tvc	%icc,	0x5
loop_1016:
	taddcctv	%o1,	%l4,	%i1
	tgu	%icc,	0x3
	brgz	%l1,	loop_1017
	movrlez	%g1,	%g6,	%l5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%l2
loop_1017:
	bpos,a,pn	%icc,	loop_1018
	fcmps	%fcc3,	%f4,	%f26
	sra	%i0,	%o4,	%o0
	fmovsa	%xcc,	%f21,	%f2
loop_1018:
	nop
	set	0x78, %g6
	ldub	[%l7 + %g6],	%o7
	tge	%icc,	0x2
	sub	%g4,	0x087B,	%l6
	edge8l	%i2,	%i7,	%o3
	mulx	%o2,	%g3,	%g2
	orncc	%l3,	%i3,	%g5
	tpos	%icc,	0x7
	sdiv	%o6,	0x0E8E,	%i4
	movrne	%g7,	%i5,	%o5
	for	%f24,	%f24,	%f0
	set	0x55, %o0
	ldsba	[%l7 + %o0] 0x0c,	%o1
	fbne,a	%fcc1,	loop_1019
	srax	%i6,	0x04,	%i1
	fmovsleu	%icc,	%f14,	%f25
	fcmpne32	%f30,	%f26,	%l1
loop_1019:
	sethi	0x03F1,	%l4
	stbar
	xnorcc	%g1,	0x044B,	%g6
	tg	%xcc,	0x3
	fbul	%fcc1,	loop_1020
	taddcctv	%l0,	%l5,	%l2
	edge16n	%o4,	%o0,	%i0
	tsubcctv	%o7,	0x1D30,	%l6
loop_1020:
	fmovde	%icc,	%f7,	%f1
	fbue	%fcc1,	loop_1021
	edge16	%i2,	%i7,	%g4
	srl	%o2,	0x1E,	%g3
	umul	%o3,	0x194E,	%l3
loop_1021:
	movg	%xcc,	%i3,	%g5
	bvs,a	loop_1022
	fbo	%fcc0,	loop_1023
	tsubcctv	%o6,	0x1CF9,	%g2
	movvs	%icc,	%g7,	%i5
loop_1022:
	for	%f12,	%f28,	%f0
loop_1023:
	ba,a	%icc,	loop_1024
	sll	%i4,	%o5,	%o1
	fornot1s	%f26,	%f14,	%f1
	movgu	%icc,	%i1,	%l1
loop_1024:
	sra	%i6,	0x0B,	%l4
	sra	%g1,	0x10,	%l0
	edge8ln	%g6,	%l5,	%o4
	fbug,a	%fcc3,	loop_1025
	fmul8x16al	%f15,	%f26,	%f2
	taddcctv	%o0,	0x18DE,	%l2
	bne,pn	%icc,	loop_1026
loop_1025:
	edge8ln	%o7,	%i0,	%l6
	bcs,a	loop_1027
	edge8l	%i2,	%g4,	%i7
loop_1026:
	st	%f6,	[%l7 + 0x48]
	xnorcc	%o2,	%g3,	%o3
loop_1027:
	fbl	%fcc3,	loop_1028
	tg	%icc,	0x6
	sdiv	%i3,	0x0DF8,	%l3
	tleu	%xcc,	0x6
loop_1028:
	andcc	%g5,	%o6,	%g2
	tcs	%xcc,	0x3
	bneg,a	%xcc,	loop_1029
	fmovdle	%xcc,	%f0,	%f14
	fmovd	%f12,	%f20
	mulscc	%g7,	%i5,	%i4
loop_1029:
	fblg	%fcc0,	loop_1030
	move	%xcc,	%o5,	%o1
	membar	0x4D
	tvs	%xcc,	0x7
loop_1030:
	fpadd16	%f8,	%f30,	%f22
	taddcctv	%l1,	0x1E96,	%i6
	sethi	0x0DA1,	%i1
	tneg	%xcc,	0x2
	movrlz	%g1,	0x0BE,	%l4
	addccc	%l0,	%l5,	%o4
	movvc	%icc,	%o0,	%l2
	fbul,a	%fcc2,	loop_1031
	move	%icc,	%g6,	%o7
	taddcc	%l6,	%i2,	%g4
	bne,a	%xcc,	loop_1032
loop_1031:
	fbo,a	%fcc0,	loop_1033
	movneg	%icc,	%i0,	%o2
	fmovdcs	%icc,	%f2,	%f21
loop_1032:
	tcc	%icc,	0x3
loop_1033:
	movne	%icc,	%g3,	%i7
	ldsh	[%l7 + 0x3A],	%i3
	brgz,a	%o3,	loop_1034
	movvc	%icc,	%l3,	%g5
	add	%o6,	%g7,	%i5
	wr	%g0,	0x19,	%asi
	stda	%i4,	[%l7 + 0x40] %asi
loop_1034:
	ble	loop_1035
	movgu	%xcc,	%g2,	%o1
	tn	%icc,	0x6
	subccc	%o5,	%l1,	%i1
loop_1035:
	tg	%icc,	0x1
	fcmpeq32	%f22,	%f10,	%g1
	movgu	%icc,	%l4,	%l0
	ldsh	[%l7 + 0x60],	%l5
	set	0x1E, %l3
	ldstuba	[%l7 + %l3] 0x89,	%i6
	fsrc1	%f6,	%f26
	fsrc1	%f30,	%f30
	nop
	set	0x66, %l0
	ldsb	[%l7 + %l0],	%o4
	tsubcctv	%o0,	%l2,	%o7
	srl	%g6,	0x1F,	%l6
	edge8ln	%g4,	%i0,	%i2
	tcc	%icc,	0x0
	fmovdg	%icc,	%f25,	%f0
	sll	%g3,	%i7,	%o2
	addccc	%i3,	%o3,	%l3
	array8	%o6,	%g7,	%g5
	be,pn	%xcc,	loop_1036
	nop
	setx	loop_1037,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%i4,	%i5
	movg	%icc,	%g2,	%o1
loop_1036:
	udiv	%o5,	0x1FF5,	%l1
loop_1037:
	sll	%i1,	%g1,	%l4
	popc	%l0,	%l5
	fzero	%f2
	fbne	%fcc1,	loop_1038
	fbne	%fcc1,	loop_1039
	fpack16	%f2,	%f23
	nop
	setx	loop_1040,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1038:
	fnor	%f0,	%f26,	%f22
loop_1039:
	nop
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
loop_1040:
	add	%o4,	%o0,	%l2
	fbul	%fcc3,	loop_1041
	lduh	[%l7 + 0x18],	%o7
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x72] %asi,	%l6
loop_1041:
	movneg	%xcc,	%g4,	%i0
	tsubcc	%i2,	%g3,	%g6
	movvc	%icc,	%i7,	%o2
	fors	%f8,	%f6,	%f13
	bge,a,pt	%icc,	loop_1042
	fbo,a	%fcc2,	loop_1043
	fbne,a	%fcc0,	loop_1044
	and	%o3,	%i3,	%l3
loop_1042:
	srl	%o6,	%g7,	%g5
loop_1043:
	smul	%i4,	0x09BC,	%g2
loop_1044:
	xorcc	%i5,	0x1A57,	%o1
	tpos	%xcc,	0x2
	fornot2	%f20,	%f6,	%f8
	mulscc	%o5,	%l1,	%g1
	tcc	%icc,	0x1
	addccc	%i1,	0x11D9,	%l4
	fnegs	%f18,	%f23
	movpos	%icc,	%l0,	%l5
	move	%icc,	%o4,	%i6
	addcc	%o0,	%o7,	%l6
	bg,a	loop_1045
	tg	%xcc,	0x2
	bleu,pt	%icc,	loop_1046
	xorcc	%g4,	0x0322,	%i0
loop_1045:
	movvs	%xcc,	%i2,	%l2
	tsubcctv	%g3,	%g6,	%o2
loop_1046:
	edge8	%o3,	%i7,	%i3
	flush	%l7 + 0x18
	tvs	%xcc,	0x0
	smulcc	%o6,	0x0457,	%g7
	movcs	%icc,	%g5,	%i4
	movcc	%icc,	%g2,	%l3
	tleu	%xcc,	0x3
	tcs	%icc,	0x1
	be,a,pn	%icc,	loop_1047
	siam	0x7
	tge	%xcc,	0x1
	sdivx	%i5,	0x1A7F,	%o5
loop_1047:
	subccc	%o1,	0x0314,	%g1
	srax	%l1,	%i1,	%l0
	addc	%l5,	0x04B3,	%l4
	brlez,a	%o4,	loop_1048
	fcmpd	%fcc3,	%f18,	%f4
	fble	%fcc2,	loop_1049
	edge8	%o0,	%i6,	%l6
loop_1048:
	fbne,a	%fcc3,	loop_1050
	subc	%o7,	0x0858,	%i0
loop_1049:
	ldstub	[%l7 + 0x39],	%g4
	taddcctv	%l2,	0x0444,	%i2
loop_1050:
	movrlz	%g6,	0x202,	%g3
	fmul8x16au	%f18,	%f17,	%f10
	tvc	%icc,	0x7
	umulcc	%o3,	0x1CB9,	%o2
	fand	%f0,	%f26,	%f20
	ldsw	[%l7 + 0x30],	%i3
	tpos	%icc,	0x1
	prefetch	[%l7 + 0x68],	 0x2
	stw	%o6,	[%l7 + 0x64]
	ldsb	[%l7 + 0x67],	%i7
	fxors	%f17,	%f21,	%f4
	srlx	%g5,	%g7,	%g2
	movre	%i4,	0x022,	%l3
	movrlez	%o5,	0x10C,	%i5
	fmovdg	%xcc,	%f2,	%f28
	fmovspos	%xcc,	%f30,	%f9
	srl	%o1,	%g1,	%l1
	fmovsg	%xcc,	%f8,	%f10
	srl	%i1,	0x00,	%l5
	fbul,a	%fcc3,	loop_1051
	ble	loop_1052
	fmovsne	%xcc,	%f11,	%f20
	fcmpne32	%f12,	%f14,	%l0
loop_1051:
	edge16	%o4,	%o0,	%i6
loop_1052:
	sub	%l6,	0x1D80,	%l4
	bgu,a,pt	%xcc,	loop_1053
	fbug,a	%fcc2,	loop_1054
	popc	%i0,	%o7
	tvs	%xcc,	0x5
loop_1053:
	array16	%l2,	%i2,	%g6
loop_1054:
	xnor	%g4,	0x1F8F,	%o3
	taddcc	%g3,	0x1343,	%i3
	flush	%l7 + 0x40
	sdivx	%o6,	0x08D4,	%o2
	tleu	%xcc,	0x4
	fornot2	%f2,	%f16,	%f14
	brgez,a	%i7,	loop_1055
	sdiv	%g5,	0x1F10,	%g2
	orcc	%g7,	0x0AD5,	%l3
	bgu,a	%icc,	loop_1056
loop_1055:
	fbu	%fcc0,	loop_1057
	ta	%icc,	0x2
	stw	%o5,	[%l7 + 0x40]
loop_1056:
	edge8l	%i4,	%i5,	%g1
loop_1057:
	ba,a,pn	%xcc,	loop_1058
	bvs,a	loop_1059
	movrgez	%l1,	0x01A,	%o1
	bcc,pn	%xcc,	loop_1060
loop_1058:
	tneg	%xcc,	0x6
loop_1059:
	fmovdgu	%xcc,	%f5,	%f16
	movcc	%icc,	%i1,	%l0
loop_1060:
	tsubcctv	%l5,	%o0,	%o4
	andncc	%l6,	%l4,	%i0
	movle	%icc,	%i6,	%l2
	fzeros	%f11
	fandnot1	%f26,	%f20,	%f20
	swap	[%l7 + 0x64],	%o7
	sdiv	%g6,	0x11A4,	%g4
	udiv	%o3,	0x182C,	%i2
	ldd	[%l7 + 0x58],	%i2
	ta	%xcc,	0x4
	sdivx	%o6,	0x0D69,	%g3
	tsubcc	%i7,	0x1C2E,	%g5
	movle	%icc,	%o2,	%g7
	tsubcctv	%l3,	%g2,	%i4
	fnegs	%f13,	%f16
	ld	[%l7 + 0x1C],	%f5
	fpadd32	%f4,	%f4,	%f30
	fbg	%fcc1,	loop_1061
	subcc	%o5,	0x166C,	%g1
	sllx	%l1,	0x16,	%o1
	xnor	%i5,	0x1A7A,	%l0
loop_1061:
	std	%f12,	[%l7 + 0x60]
	fmovsle	%xcc,	%f27,	%f26
	fbug,a	%fcc1,	loop_1062
	fmovrse	%l5,	%f16,	%f28
	edge8	%o0,	%i1,	%o4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%l6
loop_1062:
	umul	%i0,	0x131F,	%i6
	fnot2s	%f17,	%f12
	set	0x5C, %o3
	lduha	[%l7 + %o3] 0x10,	%l2
	fmovdle	%icc,	%f5,	%f22
	movrlez	%g6,	0x3BC,	%g4
	fand	%f6,	%f0,	%f18
	movrlez	%o3,	%i2,	%i3
	sethi	0x07F8,	%o6
	membar	0x76
	xnor	%g3,	%i7,	%o7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g5
	movleu	%icc,	%o2,	%l3
	fmul8x16al	%f4,	%f28,	%f20
	st	%f19,	[%l7 + 0x64]
	brnz,a	%g7,	loop_1063
	smul	%g2,	%i4,	%g1
	nop
	set	0x0A, %g7
	sth	%l1,	[%l7 + %g7]
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
loop_1063:
	addcc	%i5,	0x0E44,	%l0
	ldd	[%l7 + 0x20],	%f20
	ld	[%l7 + 0x44],	%f30
	bvs,a,pn	%xcc,	loop_1064
	brnz,a	%o1,	loop_1065
	fmovsleu	%xcc,	%f27,	%f24
	movl	%xcc,	%o0,	%i1
loop_1064:
	udiv	%o4,	0x1918,	%l4
loop_1065:
	edge8l	%l5,	%l6,	%i6
	addc	%l2,	%g6,	%g4
	bne,pn	%icc,	loop_1066
	and	%i0,	%i2,	%i3
	bvs,a	%icc,	loop_1067
	orcc	%o3,	%g3,	%i7
loop_1066:
	fcmps	%fcc0,	%f25,	%f31
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%o6
loop_1067:
	fbge,a	%fcc3,	loop_1068
	fandnot1	%f26,	%f20,	%f30
	movne	%xcc,	%o7,	%o2
	for	%f8,	%f20,	%f4
loop_1068:
	ldstub	[%l7 + 0x1C],	%g5
	subc	%l3,	%g2,	%i4
	movrne	%g1,	0x1ED,	%l1
	movrgez	%o5,	0x17D,	%g7
	sub	%i5,	0x0087,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o0,	%i1
	fmul8x16al	%f14,	%f24,	%f6
	umulcc	%o4,	%l4,	%l5
	bn,a	%icc,	loop_1069
	srlx	%l6,	0x0D,	%o1
	fbne,a	%fcc2,	loop_1070
	fbg,a	%fcc2,	loop_1071
loop_1069:
	movrne	%l2,	%g6,	%g4
	fmovdcc	%xcc,	%f12,	%f26
loop_1070:
	fcmpgt32	%f0,	%f4,	%i0
loop_1071:
	movrlz	%i6,	0x143,	%i2
	fble,a	%fcc3,	loop_1072
	sub	%i3,	%o3,	%i7
	fpadd32s	%f0,	%f23,	%f22
	bleu,pt	%icc,	loop_1073
loop_1072:
	tpos	%icc,	0x6
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x19
loop_1073:
	bcs,pn	%xcc,	loop_1074
	fornot1s	%f8,	%f6,	%f29
	movn	%icc,	%g3,	%o7
	tle	%icc,	0x4
loop_1074:
	movcs	%xcc,	%o2,	%o6
	fandnot2	%f16,	%f6,	%f14
	bpos,a,pn	%icc,	loop_1075
	movre	%l3,	0x179,	%g5
	tvc	%icc,	0x5
	bvs,a	%icc,	loop_1076
loop_1075:
	fbuge	%fcc1,	loop_1077
	fmovdpos	%icc,	%f1,	%f23
	tpos	%icc,	0x4
loop_1076:
	nop
	set	0x7C, %i7
	stw	%i4,	[%l7 + %i7]
loop_1077:
	sub	%g2,	%g1,	%l1
	ldsw	[%l7 + 0x64],	%g7
	fmuld8sux16	%f10,	%f4,	%f8
	st	%f22,	[%l7 + 0x34]
	fmovsl	%icc,	%f6,	%f7
	alignaddrl	%o5,	%i5,	%l0
	movl	%xcc,	%i1,	%o4
	array8	%o0,	%l5,	%l6
	orn	%o1,	%l2,	%g6
	srl	%l4,	%g4,	%i0
	udivx	%i2,	0x06DE,	%i6
	brgez,a	%i3,	loop_1078
	nop
	set	0x1C, %o7
	prefetch	[%l7 + %o7],	 0x0
	alignaddr	%o3,	%i7,	%o7
	fnors	%f15,	%f27,	%f22
loop_1078:
	fblg,a	%fcc0,	loop_1079
	smul	%g3,	0x1864,	%o6
	fmovdpos	%icc,	%f15,	%f19
	fpsub16s	%f0,	%f16,	%f25
loop_1079:
	fmovsg	%xcc,	%f28,	%f11
	fmovsvs	%icc,	%f22,	%f8
	bg,a	%xcc,	loop_1080
	fmul8sux16	%f14,	%f2,	%f8
	fpsub32	%f12,	%f10,	%f28
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x19,	%f0
loop_1080:
	udivcc	%l3,	0x1081,	%o2
	taddcctv	%i4,	%g5,	%g2
	movpos	%xcc,	%g1,	%l1
	fbu	%fcc2,	loop_1081
	fnot2s	%f4,	%f7
	fmovrsgz	%g7,	%f24,	%f24
	call	loop_1082
loop_1081:
	tgu	%xcc,	0x2
	udivx	%o5,	0x019A,	%i5
	movvs	%icc,	%l0,	%o4
loop_1082:
	addccc	%i1,	%l5,	%l6
	movpos	%xcc,	%o0,	%o1
	movvc	%icc,	%g6,	%l2
	edge8n	%g4,	%l4,	%i2
	sir	0x1FA4
	addcc	%i6,	%i0,	%o3
	fmovspos	%icc,	%f7,	%f23
	fmovdl	%icc,	%f3,	%f3
	edge8n	%i7,	%i3,	%o7
	andncc	%g3,	%l3,	%o6
	tge	%icc,	0x4
	edge16ln	%o2,	%g5,	%i4
	fbule,a	%fcc0,	loop_1083
	membar	0x5C
	movrne	%g1,	%g2,	%g7
	sllx	%l1,	%i5,	%o5
loop_1083:
	udiv	%o4,	0x003B,	%l0
	movvs	%xcc,	%l5,	%i1
	and	%o0,	%o1,	%g6
	fmovsa	%icc,	%f13,	%f7
	edge16ln	%l2,	%l6,	%g4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x14] %asi,	%f20
	andcc	%i2,	0x148D,	%i6
	fba	%fcc2,	loop_1084
	addcc	%l4,	0x14D8,	%o3
	umulcc	%i7,	0x0D7D,	%i3
	tsubcctv	%o7,	0x002C,	%g3
loop_1084:
	umul	%l3,	%o6,	%i0
	smulcc	%g5,	%o2,	%i4
	srlx	%g1,	%g7,	%g2
	edge16ln	%l1,	%i5,	%o4
	fcmpes	%fcc2,	%f9,	%f0
	fnot1s	%f4,	%f21
	tpos	%icc,	0x2
	xorcc	%o5,	0x008F,	%l0
	orn	%l5,	%o0,	%o1
	fsrc2s	%f5,	%f22
	orncc	%i1,	0x1EE2,	%l2
	orn	%g6,	%l6,	%i2
	edge16ln	%i6,	%g4,	%l4
	edge32n	%o3,	%i3,	%o7
	edge32	%g3,	%l3,	%o6
	movneg	%xcc,	%i0,	%g5
	addc	%i7,	%i4,	%o2
	movleu	%xcc,	%g1,	%g2
	ta	%icc,	0x0
	andcc	%g7,	0x13F3,	%i5
	fmovrdlez	%l1,	%f2,	%f4
	mulx	%o4,	%o5,	%l5
	fornot1s	%f28,	%f0,	%f17
	std	%l0,	[%l7 + 0x58]
	srax	%o0,	0x02,	%i1
	fpsub16s	%f23,	%f3,	%f20
	alignaddrl	%o1,	%l2,	%g6
	fandnot2	%f24,	%f4,	%f2
	bcc,a,pt	%xcc,	loop_1085
	movgu	%icc,	%i2,	%l6
	movrgz	%g4,	%l4,	%o3
	edge16ln	%i3,	%o7,	%g3
loop_1085:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x41] %asi,	%l3
	tcs	%icc,	0x7
	ldd	[%l7 + 0x48],	%i6
	bn,a,pn	%icc,	loop_1086
	mova	%xcc,	%o6,	%i0
	umulcc	%g5,	0x0961,	%i7
	ba,a	loop_1087
loop_1086:
	sdivcc	%i4,	0x1CFD,	%g1
	fcmpd	%fcc2,	%f2,	%f10
	tne	%xcc,	0x4
loop_1087:
	mulscc	%o2,	%g2,	%i5
	sethi	0x0EBE,	%l1
	nop
	set	0x36, %o6
	sth	%g7,	[%l7 + %o6]
	movrgez	%o4,	%l5,	%o5
	move	%xcc,	%l0,	%o0
	fornot1s	%f10,	%f22,	%f4
	orn	%o1,	0x1D7A,	%i1
	addccc	%g6,	%l2,	%l6
	array32	%i2,	%l4,	%o3
	srlx	%g4,	0x00,	%o7
	ba,a	%xcc,	loop_1088
	fmovsge	%icc,	%f9,	%f1
	fmovrslez	%i3,	%f21,	%f9
	fbl,a	%fcc3,	loop_1089
loop_1088:
	fbl,a	%fcc2,	loop_1090
	sth	%l3,	[%l7 + 0x4C]
	umulcc	%g3,	%o6,	%i6
loop_1089:
	popc	%i0,	%g5
loop_1090:
	fcmpne32	%f20,	%f24,	%i4
	fpack16	%f20,	%f21
	movgu	%xcc,	%i7,	%g1
	bshuffle	%f26,	%f2,	%f18
	and	%o2,	0x018E,	%g2
	fmovsne	%icc,	%f8,	%f31
	sir	0x1BED
	fnand	%f2,	%f18,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x4
	array32	%i5,	%g7,	%l1
	ld	[%l7 + 0x64],	%f5
	movrgz	%o4,	0x2D7,	%o5
	fmovda	%xcc,	%f5,	%f31
	tneg	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	sta	%f25,	[%l7 + 0x10] %asi
	fbne,a	%fcc0,	loop_1091
	tcc	%xcc,	0x2
	fpmerge	%f11,	%f13,	%f4
	fba,a	%fcc1,	loop_1092
loop_1091:
	tne	%xcc,	0x1
	te	%xcc,	0x6
	tle	%icc,	0x3
loop_1092:
	fxor	%f20,	%f16,	%f18
	fmovsvs	%icc,	%f8,	%f10
	te	%xcc,	0x7
	set	0x58, %i5
	ldsba	[%l7 + %i5] 0x11,	%l5
	popc	%l0,	%o0
	fmovsvs	%xcc,	%f3,	%f29
	edge16ln	%o1,	%g6,	%l2
	sethi	0x030D,	%i1
	st	%f13,	[%l7 + 0x1C]
	fcmpes	%fcc3,	%f7,	%f15
	subc	%i2,	0x09C5,	%l6
	bne,a,pt	%icc,	loop_1093
	tgu	%icc,	0x2
	edge32n	%o3,	%g4,	%o7
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x0c,	 0x1
loop_1093:
	orcc	%i3,	%g3,	%o6
	wr	%g0,	0x81,	%asi
	sta	%f26,	[%l7 + 0x5C] %asi
	tne	%xcc,	0x3
	stbar
	stw	%i6,	[%l7 + 0x18]
	fpadd16	%f4,	%f30,	%f20
	edge32n	%l3,	%i0,	%g5
	fbe	%fcc3,	loop_1094
	edge8n	%i4,	%g1,	%o2
	movn	%xcc,	%i7,	%i5
	fbne	%fcc3,	loop_1095
loop_1094:
	andcc	%g7,	%g2,	%l1
	movg	%xcc,	%o5,	%o4
	edge8l	%l5,	%o0,	%o1
loop_1095:
	taddcctv	%l0,	%l2,	%g6
	tle	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	xor	%i2,	0x0456,	%l6
	sdiv	%g4,	0x1E51,	%o3
	sra	%o7,	0x0B,	%i3
	movle	%icc,	%g3,	%l4
	edge32l	%o6,	%l3,	%i6
	fmovrslez	%i0,	%f3,	%f21
	tsubcctv	%g5,	0x008A,	%i4
	fnot1s	%f17,	%f14
	tleu	%xcc,	0x3
	edge8ln	%g1,	%o2,	%i5
	edge32l	%g7,	%g2,	%l1
	srl	%o5,	%o4,	%i7
	fornot1s	%f14,	%f22,	%f6
	nop
	set	0x72, %i2
	ldsh	[%l7 + %i2],	%o0
	fmovrdne	%o1,	%f22,	%f18
	fbuge	%fcc1,	loop_1096
	movrgez	%l0,	0x3CB,	%l2
	bleu,pn	%xcc,	loop_1097
	fabsd	%f20,	%f20
loop_1096:
	sub	%l5,	%i1,	%g6
	movg	%xcc,	%l6,	%i2
loop_1097:
	fbl	%fcc1,	loop_1098
	array8	%o3,	%g4,	%i3
	or	%o7,	%l4,	%o6
	fbu	%fcc1,	loop_1099
loop_1098:
	and	%l3,	%g3,	%i0
	andn	%i6,	0x0953,	%i4
	sethi	0x020A,	%g1
loop_1099:
	lduh	[%l7 + 0x7C],	%o2
	lduw	[%l7 + 0x4C],	%g5
	stx	%g7,	[%l7 + 0x20]
	fzeros	%f28
	fpsub32	%f26,	%f24,	%f0
	andcc	%i5,	%l1,	%o5
	movgu	%icc,	%o4,	%i7
	xorcc	%g2,	%o1,	%l0
	edge32	%o0,	%l2,	%i1
	fbl	%fcc3,	loop_1100
	udiv	%g6,	0x0360,	%l5
	tcc	%xcc,	0x6
	tcc	%icc,	0x7
loop_1100:
	andcc	%i2,	%o3,	%l6
	brlez,a	%g4,	loop_1101
	fxor	%f26,	%f4,	%f6
	tvc	%xcc,	0x1
	ldsb	[%l7 + 0x08],	%i3
loop_1101:
	tpos	%icc,	0x0
	fmovdne	%xcc,	%f8,	%f10
	tvs	%xcc,	0x5
	fmul8x16al	%f7,	%f18,	%f18
	stw	%o7,	[%l7 + 0x44]
	tg	%xcc,	0x5
	wr	%g0,	0x22,	%asi
	stxa	%o6,	[%l7 + 0x70] %asi
	membar	#Sync
	movcc	%icc,	%l3,	%l4
	tleu	%icc,	0x1
	ldub	[%l7 + 0x79],	%g3
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x18,	%asi
	stxa	%i0,	[%l7 + 0x20] %asi
	tge	%xcc,	0x1
	bgu,a,pt	%xcc,	loop_1102
	fsrc1	%f12,	%f18
	array8	%i6,	%g1,	%i4
	popc	%o2,	%g5
loop_1102:
	movn	%xcc,	%g7,	%l1
	or	%i5,	%o4,	%i7
	movn	%icc,	%o5,	%g2
	nop
	setx	loop_1103,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%o1,	0x02A1,	%o0
	fabss	%f11,	%f2
	sub	%l0,	0x1A7A,	%l2
loop_1103:
	edge32	%i1,	%l5,	%g6
	srax	%i2,	%o3,	%l6
	smul	%i3,	%o7,	%g4
	bge	%icc,	loop_1104
	edge8l	%o6,	%l3,	%g3
	popc	%l4,	%i0
	orncc	%i6,	0x099A,	%g1
loop_1104:
	sll	%o2,	%g5,	%i4
	tcc	%icc,	0x3
	movrlz	%g7,	%i5,	%l1
	fmovrdgz	%o4,	%f2,	%f6
	fcmpgt32	%f20,	%f0,	%o5
	set	0x6C, %l5
	ldsha	[%l7 + %l5] 0x15,	%i7
	fmul8x16	%f17,	%f20,	%f6
	siam	0x7
	edge16ln	%g2,	%o1,	%l0
	movne	%icc,	%o0,	%l2
	fble,a	%fcc2,	loop_1105
	nop
	setx loop_1106, %l0, %l1
	jmpl %l1, %l5
	tn	%xcc,	0x6
	sir	0x1BF3
loop_1105:
	fnot2s	%f18,	%f9
loop_1106:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i1
	mova	%xcc,	%g6,	%i2
	bneg,pt	%icc,	loop_1107
	popc	%o3,	%i3
	fcmps	%fcc2,	%f5,	%f16
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x11,	 0x1
loop_1107:
	movrlz	%g4,	%o7,	%l3
	fsrc2	%f22,	%f30
	fmovdge	%icc,	%f8,	%f0
	ldsh	[%l7 + 0x46],	%g3
	fbl,a	%fcc3,	loop_1108
	movrgez	%l4,	%i0,	%o6
	tvc	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
loop_1108:
	sub	%o2,	0x15B7,	%g1
	fbl,a	%fcc2,	loop_1109
	movg	%xcc,	%i4,	%g5
	bgu	loop_1110
	sdivcc	%i5,	0x13FC,	%l1
loop_1109:
	edge8	%g7,	%o5,	%o4
	ldd	[%l7 + 0x08],	%f12
loop_1110:
	fnegs	%f1,	%f18
	fcmpeq32	%f2,	%f0,	%i7
	subcc	%o1,	0x1BCD,	%l0
	umulcc	%o0,	0x0F50,	%g2
	fcmps	%fcc3,	%f27,	%f27
	fmovdpos	%icc,	%f20,	%f27
	fbe,a	%fcc0,	loop_1111
	fmovdge	%xcc,	%f26,	%f29
	tleu	%icc,	0x4
	add	%l2,	%i1,	%g6
loop_1111:
	movne	%xcc,	%i2,	%o3
	movrgz	%i3,	0x26F,	%l5
	movvs	%icc,	%l6,	%o7
	bcs,a	%xcc,	loop_1112
	fmovrslez	%g4,	%f30,	%f16
	bcs,a	%icc,	loop_1113
	nop
	setx	loop_1114,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1112:
	mulx	%l3,	%g3,	%i0
	udivcc	%l4,	0x0B97,	%o6
loop_1113:
	smul	%i6,	%g1,	%i4
loop_1114:
	fble	%fcc3,	loop_1115
	array32	%g5,	%o2,	%l1
	array32	%g7,	%o5,	%o4
	fmovspos	%icc,	%f12,	%f22
loop_1115:
	tgu	%icc,	0x4
	xnor	%i7,	0x11D4,	%i5
	tne	%xcc,	0x3
	fpadd32s	%f25,	%f26,	%f9
	fpsub32s	%f17,	%f7,	%f14
	addccc	%l0,	0x0232,	%o1
	andn	%o0,	0x16E0,	%l2
	xnorcc	%g2,	0x1642,	%i1
	pdist	%f22,	%f16,	%f0
	taddcc	%g6,	0x1066,	%o3
	srax	%i3,	0x10,	%i2
	tgu	%icc,	0x7
	movrlz	%l5,	0x39B,	%o7
	srax	%g4,	%l3,	%g3
	fpadd32s	%f17,	%f13,	%f23
	tne	%icc,	0x5
	bneg,pn	%icc,	loop_1116
	srax	%l6,	%i0,	%l4
	fxor	%f10,	%f2,	%f18
	fnot1	%f10,	%f2
loop_1116:
	udivx	%o6,	0x1380,	%g1
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%i4
	mova	%xcc,	%i6,	%g5
	movg	%xcc,	%l1,	%g7
	fmovsl	%icc,	%f3,	%f8
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x27] %asi,	%o2
	movvc	%xcc,	%o4,	%i7
	movcs	%xcc,	%o5,	%i5
	tpos	%xcc,	0x6
	fmovdvs	%xcc,	%f6,	%f26
	fble	%fcc1,	loop_1117
	sra	%l0,	%o0,	%o1
	set	0x64, %o2
	stha	%g2,	[%l7 + %o2] 0x19
loop_1117:
	fmovrslez	%i1,	%f5,	%f6
	xnor	%g6,	%l2,	%i3
	edge32l	%i2,	%l5,	%o3
	sra	%o7,	%g4,	%g3
	ldsh	[%l7 + 0x36],	%l3
	andn	%l6,	%i0,	%l4
	fnot1	%f26,	%f14
	edge8	%o6,	%i4,	%i6
	fmovrdgez	%g5,	%f20,	%f14
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x2f,	%g0
	tgu	%icc,	0x7
	subcc	%g7,	0x1A17,	%o2
	subc	%l1,	0x0479,	%i7
	brnz	%o5,	loop_1118
	fnot2	%f16,	%f0
	bpos,a,pt	%icc,	loop_1119
	taddcc	%i5,	0x07DC,	%l0
loop_1118:
	brz	%o0,	loop_1120
	sll	%o1,	0x13,	%g2
loop_1119:
	fmovrslez	%o4,	%f10,	%f31
	xnorcc	%i1,	%g6,	%l2
loop_1120:
	movrlz	%i3,	%l5,	%o3
	movcs	%xcc,	%i2,	%o7
	fmul8sux16	%f8,	%f2,	%f16
	edge32	%g4,	%g3,	%l3
	mulscc	%i0,	0x0501,	%l4
	brlez	%o6,	loop_1121
	xnor	%i4,	%l6,	%g5
	fmuld8sux16	%f28,	%f23,	%f24
	xorcc	%i6,	0x1A91,	%g1
loop_1121:
	fcmpd	%fcc3,	%f8,	%f16
	nop
	setx	loop_1122,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbne	%fcc0,	loop_1123
	movg	%xcc,	%o2,	%g7
	nop
	setx loop_1124, %l0, %l1
	jmpl %l1, %i7
loop_1122:
	membar	0x23
loop_1123:
	alignaddr	%o5,	%l1,	%i5
	bn,a	%xcc,	loop_1125
loop_1124:
	udivx	%o0,	0x1E50,	%o1
	movcc	%xcc,	%l0,	%o4
	subc	%g2,	%g6,	%i1
loop_1125:
	movrne	%i3,	%l2,	%l5
	edge32n	%i2,	%o7,	%o3
	movgu	%icc,	%g3,	%g4
	ldx	[%l7 + 0x60],	%i0
	set	0x5C, %o1
	ldsba	[%l7 + %o1] 0x81,	%l3
	set	0x20, %l6
	lduwa	[%l7 + %l6] 0x15,	%l4
	bcc,pt	%icc,	loop_1126
	tsubcctv	%i4,	%l6,	%g5
	tl	%icc,	0x0
	ba,a,pn	%xcc,	loop_1127
loop_1126:
	nop
	set	0x34, %o5
	prefetch	[%l7 + %o5],	 0x2
	te	%xcc,	0x2
	movgu	%xcc,	%i6,	%o6
loop_1127:
	fornot1s	%f26,	%f6,	%f4
	ble	%icc,	loop_1128
	brgez	%g1,	loop_1129
	edge16l	%g7,	%i7,	%o2
	ldx	[%l7 + 0x48],	%o5
loop_1128:
	nop
	set	0x64, %g2
	stwa	%l1,	[%l7 + %g2] 0x0c
loop_1129:
	fmovrsgz	%i5,	%f9,	%f10
	tg	%icc,	0x2
	fors	%f17,	%f26,	%f17
	fble,a	%fcc3,	loop_1130
	addcc	%o1,	%l0,	%o0
	ld	[%l7 + 0x30],	%f26
	fmovdge	%xcc,	%f10,	%f4
loop_1130:
	tle	%icc,	0x3
	edge16n	%o4,	%g2,	%g6
	fcmpes	%fcc3,	%f25,	%f30
	fandnot2s	%f26,	%f25,	%f27
	tsubcctv	%i1,	0x0659,	%l2
	or	%i3,	0x0BB9,	%l5
	ldd	[%l7 + 0x20],	%f0
	mulscc	%i2,	%o7,	%o3
	movne	%icc,	%g4,	%g3
	fandnot1s	%f5,	%f31,	%f4
	pdist	%f14,	%f12,	%f28
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x36] %asi,	%i0
	andncc	%l3,	%l4,	%l6
	array8	%i4,	%i6,	%g5
	be,pn	%icc,	loop_1131
	movcs	%xcc,	%g1,	%o6
	sir	0x1CC8
	edge32l	%i7,	%o2,	%o5
loop_1131:
	fbule	%fcc1,	loop_1132
	movrgez	%l1,	%g7,	%i5
	fcmple32	%f6,	%f24,	%l0
	movgu	%icc,	%o1,	%o0
loop_1132:
	tcc	%xcc,	0x7
	ldstub	[%l7 + 0x79],	%g2
	tleu	%icc,	0x6
	tneg	%icc,	0x5
	be,a	%xcc,	loop_1133
	tleu	%icc,	0x0
	movre	%o4,	%g6,	%l2
	mulx	%i1,	%i3,	%i2
loop_1133:
	tge	%xcc,	0x2
	sub	%o7,	%o3,	%g4
	alignaddrl	%l5,	%g3,	%i0
	orncc	%l4,	%l6,	%l3
	movle	%icc,	%i6,	%i4
	fmovdgu	%icc,	%f14,	%f29
	movrlez	%g5,	0x0E6,	%g1
	andcc	%i7,	%o6,	%o5
	movle	%icc,	%o2,	%g7
	edge32l	%i5,	%l0,	%o1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2B] %asi,	%l1
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x15,	 0x2
	ldstub	[%l7 + 0x16],	%o4
	edge32l	%o0,	%l2,	%g6
	flush	%l7 + 0x5C
	fmuld8sux16	%f25,	%f23,	%f30
	sethi	0x10FA,	%i3
	fmovse	%icc,	%f28,	%f5
	udiv	%i1,	0x033B,	%o7
	stbar
	alignaddrl	%i2,	%o3,	%l5
	orcc	%g3,	%i0,	%l4
	move	%icc,	%l6,	%g4
	tge	%icc,	0x0
	taddcctv	%i6,	0x0BED,	%i4
	fbul	%fcc2,	loop_1134
	addc	%l3,	%g1,	%i7
	faligndata	%f6,	%f30,	%f0
	edge8l	%g5,	%o6,	%o5
loop_1134:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%g7,	[%l7 + 0x45] %asi
	membar	#Sync
	mulscc	%i5,	%l0,	%o1
	set	0x6C, %i3
	ldswa	[%l7 + %i3] 0x80,	%o2
	edge32ln	%g2,	%l1,	%o4
	andncc	%o0,	%l2,	%i3
	wr	%g0,	0x04,	%asi
	stwa	%g6,	[%l7 + 0x3C] %asi
	nop
	set	0x28, %i6
	std	%f2,	[%l7 + %i6]
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%i1
	ldd	[%l7 + 0x78],	%i2
	ldsb	[%l7 + 0x38],	%o7
	ble,a,pn	%xcc,	loop_1135
	fmovsne	%xcc,	%f6,	%f0
	fxnors	%f25,	%f30,	%f29
	fbge	%fcc3,	loop_1136
loop_1135:
	tpos	%xcc,	0x7
	movgu	%xcc,	%o3,	%l5
	alignaddr	%i0,	%g3,	%l4
loop_1136:
	movrlez	%g4,	%i6,	%l6
	fpackfix	%f2,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l3,	%g1,	%i7
	array16	%g5,	%o6,	%o5
	andncc	%g7,	%i4,	%l0
	movcs	%xcc,	%o1,	%o2
	fors	%f1,	%f24,	%f20
	xorcc	%i5,	0x0197,	%g2
	movn	%xcc,	%l1,	%o0
	movn	%xcc,	%o4,	%i3
	edge16n	%l2,	%i1,	%g6
	fmovdge	%icc,	%f22,	%f4
	sllx	%o7,	0x17,	%i2
	bgu,a	%xcc,	loop_1137
	fcmps	%fcc2,	%f4,	%f21
	bg,pn	%xcc,	loop_1138
	srl	%o3,	%l5,	%g3
loop_1137:
	orcc	%l4,	%i0,	%i6
	movrne	%g4,	0x2AB,	%l6
loop_1138:
	fbule	%fcc0,	loop_1139
	st	%f9,	[%l7 + 0x54]
	tgu	%xcc,	0x1
	tn	%xcc,	0x2
loop_1139:
	ldstub	[%l7 + 0x39],	%g1
	or	%l3,	%g5,	%i7
	movg	%xcc,	%o5,	%g7
	set	0x48, %i0
	stxa	%o6,	[%l7 + %i0] 0x2a
	membar	#Sync
	fsrc2s	%f14,	%f2
	movg	%icc,	%l0,	%i4
	wr	%g0,	0x89,	%asi
	stwa	%o2,	[%l7 + 0x14] %asi
	fbne	%fcc1,	loop_1140
	bpos,pn	%xcc,	loop_1141
	movne	%xcc,	%o1,	%g2
	orcc	%i5,	%l1,	%o4
loop_1140:
	fbug,a	%fcc2,	loop_1142
loop_1141:
	edge16n	%o0,	%l2,	%i1
	srl	%g6,	%i3,	%i2
	smulcc	%o3,	0x0F89,	%l5
loop_1142:
	fands	%f1,	%f29,	%f13
	fmovsge	%xcc,	%f5,	%f28
	xnorcc	%g3,	0x17B1,	%l4
	edge32l	%o7,	%i0,	%g4
	umulcc	%i6,	%g1,	%l3
	subcc	%l6,	0x013F,	%i7
	subc	%g5,	%g7,	%o6
	mulx	%l0,	0x1EB9,	%i4
	tsubcc	%o5,	0x0DA8,	%o2
	bne,a,pt	%xcc,	loop_1143
	flush	%l7 + 0x10
	array16	%g2,	%i5,	%l1
	te	%xcc,	0x7
loop_1143:
	andcc	%o1,	0x01E6,	%o4
	fnegs	%f24,	%f17
	sdivcc	%l2,	0x09D4,	%i1
	brlz,a	%o0,	loop_1144
	subccc	%g6,	%i3,	%i2
	tle	%xcc,	0x2
	edge8ln	%o3,	%l5,	%g3
loop_1144:
	be	loop_1145
	fmovdgu	%xcc,	%f4,	%f29
	tl	%xcc,	0x5
	set	0x60, %i1
	stda	%o6,	[%l7 + %i1] 0x22
	membar	#Sync
loop_1145:
	andcc	%i0,	0x19F1,	%g4
	edge32l	%l4,	%g1,	%l3
	tne	%xcc,	0x4
	fpadd32s	%f19,	%f21,	%f27
	tsubcctv	%l6,	%i7,	%i6
	orn	%g7,	0x16FD,	%g5
	fmovrslez	%o6,	%f12,	%f22
	udiv	%i4,	0x14C4,	%o5
	sethi	0x0EFA,	%l0
	movrne	%g2,	%o2,	%i5
	movrgez	%l1,	%o1,	%l2
	and	%o4,	%o0,	%i1
	bpos,pt	%icc,	loop_1146
	fnot1s	%f25,	%f14
	tne	%xcc,	0x3
	fba,a	%fcc0,	loop_1147
loop_1146:
	bcc,pt	%icc,	loop_1148
	movvs	%icc,	%g6,	%i2
	set	0x6C, %g4
	lduwa	[%l7 + %g4] 0x80,	%o3
loop_1147:
	array16	%l5,	%i3,	%g3
loop_1148:
	fmovda	%xcc,	%f23,	%f17
	tsubcctv	%o7,	0x13DA,	%g4
	sra	%l4,	0x14,	%g1
	nop
	setx	loop_1149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%l3,	0x1BE7,	%l6
	movcs	%xcc,	%i0,	%i7
	stb	%i6,	[%l7 + 0x49]
loop_1149:
	edge16l	%g7,	%g5,	%i4
	sethi	0x0C55,	%o6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x68] %asi,	%f10
	tge	%xcc,	0x7
	fpadd16	%f18,	%f12,	%f8
	edge8ln	%o5,	%l0,	%o2
	fmovdne	%icc,	%f11,	%f27
	taddcctv	%g2,	%l1,	%o1
	fmovsa	%icc,	%f12,	%f24
	tn	%icc,	0x6
	edge16n	%l2,	%o4,	%i5
	movrne	%o0,	0x1E7,	%g6
	taddcctv	%i2,	%o3,	%i1
	movle	%xcc,	%l5,	%i3
	smul	%o7,	0x1371,	%g3
	smulcc	%l4,	%g1,	%g4
	set	0x1C, %l1
	sta	%f27,	[%l7 + %l1] 0x19
	sllx	%l6,	%l3,	%i7
	bl,a	%icc,	loop_1150
	edge8l	%i6,	%i0,	%g7
	movrlz	%g5,	%i4,	%o6
	edge16ln	%l0,	%o5,	%o2
loop_1150:
	orncc	%g2,	0x1B76,	%o1
	smul	%l2,	%l1,	%o4
	te	%xcc,	0x0
	sll	%o0,	%i5,	%g6
	movre	%o3,	%i2,	%l5
	lduw	[%l7 + 0x5C],	%i1
	fmovdvc	%icc,	%f23,	%f25
	tcc	%icc,	0x6
	mulx	%i3,	0x0895,	%o7
	ta	%xcc,	0x4
	sethi	0x1A00,	%l4
	fandnot2s	%f12,	%f5,	%f17
	set	0x6A, %o0
	stba	%g1,	[%l7 + %o0] 0x88
	alignaddrl	%g3,	%l6,	%g4
	bg,pn	%xcc,	loop_1151
	andncc	%l3,	%i7,	%i6
	sethi	0x09E3,	%i0
	fands	%f9,	%f24,	%f18
loop_1151:
	popc	0x0ABC,	%g5
	movle	%xcc,	%i4,	%g7
	fabsd	%f2,	%f20
	movleu	%xcc,	%l0,	%o5
	nop
	setx loop_1152, %l0, %l1
	jmpl %l1, %o2
	edge32n	%g2,	%o6,	%l2
	and	%l1,	0x0B40,	%o1
	fcmpne32	%f0,	%f4,	%o4
loop_1152:
	addcc	%o0,	%i5,	%o3
	smulcc	%g6,	0x0C9D,	%l5
	fcmpgt32	%f6,	%f22,	%i1
	fmovsle	%xcc,	%f13,	%f15
	sdivcc	%i2,	0x125E,	%o7
	tl	%icc,	0x2
	sth	%i3,	[%l7 + 0x7E]
	bneg,pn	%icc,	loop_1153
	fbn,a	%fcc0,	loop_1154
	andcc	%g1,	%g3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1153:
	edge16n	%l4,	%l3,	%i7
loop_1154:
	movrgez	%g4,	%i0,	%i6
	fabss	%f23,	%f5
	sdivx	%i4,	0x00F2,	%g5
	fmuld8sux16	%f26,	%f22,	%f28
	movvc	%xcc,	%l0,	%g7
	sdivcc	%o2,	0x14A6,	%o5
	umulcc	%g2,	%o6,	%l1
	fbne	%fcc1,	loop_1155
	orn	%l2,	%o4,	%o1
	movvc	%icc,	%i5,	%o0
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1155:
	array8	%g6,	%l5,	%o3
	subc	%i2,	0x03D5,	%i1
	addccc	%o7,	0x0A1B,	%g1
	ldstub	[%l7 + 0x6D],	%g3
	sub	%l6,	%l4,	%l3
	andn	%i7,	%i3,	%g4
	tne	%xcc,	0x7
	fsrc1s	%f2,	%f25
	subcc	%i0,	0x10E5,	%i4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%g5
	sir	0x149F
	taddcctv	%i6,	0x1D2E,	%l0
	move	%icc,	%o2,	%g7
	taddcctv	%o5,	0x1ADD,	%g2
	fba,a	%fcc1,	loop_1156
	tne	%icc,	0x3
	and	%l1,	0x1950,	%l2
	faligndata	%f22,	%f26,	%f26
loop_1156:
	array16	%o4,	%o6,	%i5
	edge32	%o1,	%o0,	%g6
	movg	%icc,	%o3,	%l5
	tcs	%xcc,	0x0
	sllx	%i1,	0x0D,	%o7
	sll	%i2,	%g1,	%g3
	fnot1s	%f20,	%f29
	move	%xcc,	%l6,	%l4
	and	%l3,	0x0B6B,	%i7
	xor	%i3,	%g4,	%i0
	edge16	%i4,	%g5,	%i6
	sra	%l0,	%o2,	%o5
	or	%g7,	%g2,	%l2
	tn	%xcc,	0x7
	movrlz	%l1,	0x061,	%o4
	bge	%icc,	loop_1157
	alignaddr	%o6,	%i5,	%o1
	andncc	%g6,	%o0,	%l5
	movl	%xcc,	%i1,	%o7
loop_1157:
	ble	%icc,	loop_1158
	stx	%i2,	[%l7 + 0x70]
	fmovsa	%xcc,	%f18,	%f5
	fmul8x16	%f7,	%f10,	%f22
loop_1158:
	fmul8x16	%f6,	%f8,	%f12
	movg	%icc,	%o3,	%g3
	fpadd16s	%f18,	%f25,	%f10
	fbo,a	%fcc0,	loop_1159
	fandnot2s	%f12,	%f0,	%f30
	umulcc	%l6,	%l4,	%l3
	movne	%xcc,	%i7,	%g1
loop_1159:
	sllx	%i3,	0x15,	%g4
	popc	%i4,	%i0
	movpos	%xcc,	%g5,	%l0
	edge16l	%o2,	%o5,	%g7
	bn	%icc,	loop_1160
	fmul8x16	%f2,	%f28,	%f12
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1160:
	ta	%xcc,	0x4
	tgu	%xcc,	0x0
	edge16l	%g2,	%i6,	%l1
	xnor	%l2,	0x0901,	%o4
	movrlz	%i5,	0x3B8,	%o1
	bvs,pt	%xcc,	loop_1161
	bne,pn	%icc,	loop_1162
	lduw	[%l7 + 0x64],	%o6
	tpos	%icc,	0x7
loop_1161:
	movneg	%icc,	%o0,	%g6
loop_1162:
	movrgz	%i1,	%l5,	%i2
	fxnor	%f10,	%f30,	%f28
	fmuld8ulx16	%f25,	%f10,	%f20
	movrgez	%o7,	%o3,	%l6
	movg	%icc,	%l4,	%g3
	brgz	%i7,	loop_1163
	fone	%f2
	call	loop_1164
	tle	%xcc,	0x6
loop_1163:
	tgu	%xcc,	0x1
	fmovse	%icc,	%f31,	%f16
loop_1164:
	fcmpne16	%f20,	%f12,	%l3
	ldd	[%l7 + 0x08],	%f12
	tsubcc	%i3,	%g4,	%i4
	fmovsl	%icc,	%f1,	%f30
	fcmpne16	%f2,	%f24,	%i0
	fmovrsne	%g1,	%f28,	%f14
	fmovrdgz	%l0,	%f20,	%f4
	st	%f21,	[%l7 + 0x54]
	subccc	%g5,	%o2,	%o5
	fbg,a	%fcc2,	loop_1165
	udivcc	%g7,	0x08D3,	%g2
	umulcc	%l1,	0x1051,	%i6
	edge8	%o4,	%l2,	%i5
loop_1165:
	sdivx	%o6,	0x0F5D,	%o1
	movrgz	%g6,	%o0,	%i1
	mulx	%i2,	%o7,	%l5
	te	%xcc,	0x0
	edge16	%o3,	%l4,	%g3
	set	0x58, %g6
	lda	[%l7 + %g6] 0x19,	%f23
	movrlez	%i7,	%l3,	%l6
	ba,pt	%icc,	loop_1166
	tleu	%icc,	0x1
	sdiv	%i3,	0x0CE5,	%g4
	tl	%icc,	0x1
loop_1166:
	movcs	%xcc,	%i0,	%g1
	fmul8x16al	%f15,	%f27,	%f12
	movpos	%icc,	%i4,	%l0
	movg	%icc,	%g5,	%o5
	fmovrde	%o2,	%f14,	%f30
	ba,pn	%icc,	loop_1167
	mulscc	%g2,	0x0677,	%g7
	set	0x78, %l0
	swapa	[%l7 + %l0] 0x19,	%l1
loop_1167:
	fmovsne	%xcc,	%f22,	%f16
	subccc	%o4,	%l2,	%i6
	udiv	%o6,	0x096F,	%i5
	edge16l	%g6,	%o1,	%o0
	fbule,a	%fcc1,	loop_1168
	bcc,pt	%icc,	loop_1169
	sir	0x0CAC
	tn	%xcc,	0x1
loop_1168:
	tleu	%icc,	0x0
loop_1169:
	fmovscc	%icc,	%f28,	%f7
	stx	%i2,	[%l7 + 0x48]
	fmovdge	%icc,	%f7,	%f9
	tsubcc	%i1,	0x047D,	%o7
	fmovda	%xcc,	%f16,	%f22
	call	loop_1170
	orncc	%l5,	0x0E5E,	%o3
	std	%f30,	[%l7 + 0x38]
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0x1
loop_1170:
	ldstub	[%l7 + 0x3C],	%i7
	edge16n	%l3,	%g3,	%l6
	movrne	%i3,	%i0,	%g1
	movn	%icc,	%i4,	%g4
	sdivx	%l0,	0x1F06,	%o5
	tvc	%xcc,	0x6
	array8	%o2,	%g2,	%g7
	addcc	%l1,	%g5,	%l2
	bshuffle	%f28,	%f22,	%f10
	fmovdgu	%icc,	%f26,	%f4
	taddcctv	%i6,	0x0744,	%o4
	fpmerge	%f29,	%f31,	%f24
	movvc	%xcc,	%o6,	%i5
	movcs	%icc,	%g6,	%o0
	ldsb	[%l7 + 0x10],	%o1
	bneg	%xcc,	loop_1171
	addccc	%i2,	0x11F2,	%i1
	fbule,a	%fcc0,	loop_1172
	tgu	%icc,	0x0
loop_1171:
	fabsd	%f20,	%f16
	subcc	%l5,	0x1060,	%o7
loop_1172:
	tvc	%icc,	0x3
	subc	%l4,	0x104B,	%i7
	nop
	set	0x0C, %g7
	stw	%l3,	[%l7 + %g7]
	sethi	0x12FF,	%g3
	ldsh	[%l7 + 0x2C],	%l6
	stbar
	sdivcc	%i3,	0x1CDD,	%i0
	tvc	%icc,	0x7
	fmovda	%xcc,	%f10,	%f27
	fmovrsne	%o3,	%f0,	%f12
	andncc	%g1,	%g4,	%i4
	edge32ln	%o5,	%l0,	%g2
	membar	0x16
	ld	[%l7 + 0x7C],	%f4
	fcmps	%fcc3,	%f26,	%f23
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f16
	membar	0x3A
	nop
	set	0x37, %i7
	ldstub	[%l7 + %i7],	%o2
	and	%l1,	%g7,	%l2
	smul	%g5,	%i6,	%o6
	std	%f26,	[%l7 + 0x28]
	sub	%i5,	0x1A8D,	%g6
	tne	%icc,	0x6
	tvs	%icc,	0x0
	taddcctv	%o4,	%o1,	%i2
	fmovsg	%xcc,	%f2,	%f13
	tl	%xcc,	0x3
	fmul8ulx16	%f24,	%f8,	%f24
	fbo	%fcc2,	loop_1173
	ba,pn	%xcc,	loop_1174
	movn	%icc,	%i1,	%o0
	movvs	%icc,	%o7,	%l4
loop_1173:
	tsubcc	%i7,	0x1BAA,	%l5
loop_1174:
	fcmpgt32	%f0,	%f16,	%l3
	lduw	[%l7 + 0x2C],	%l6
	tsubcctv	%i3,	%g3,	%i0
	tsubcctv	%o3,	%g1,	%g4
	taddcc	%o5,	%l0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x30] %asi,	%g2
	orn	%l1,	0x039C,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l2,	0x0BB,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%o6
	addccc	%i5,	%g6,	%i6
	fmovdleu	%icc,	%f16,	%f4
	mulx	%o4,	%o1,	%i1
	fnands	%f31,	%f9,	%f31
	tge	%xcc,	0x4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i2,	%o0
	srlx	%o7,	0x11,	%l4
	tleu	%icc,	0x2
	movcs	%icc,	%l5,	%l3
	bl	loop_1175
	brlez,a	%l6,	loop_1176
	udivx	%i7,	0x073C,	%g3
	set	0x3D, %l3
	ldstuba	[%l7 + %l3] 0x10,	%i3
loop_1175:
	movrlz	%o3,	0x2CB,	%i0
loop_1176:
	udiv	%g1,	0x16E6,	%o5
	fmul8ulx16	%f12,	%f26,	%f24
	fmovrsgz	%l0,	%f2,	%f15
	tpos	%xcc,	0x6
	andcc	%g4,	%i4,	%g2
	fmovdcc	%xcc,	%f26,	%f17
	tpos	%xcc,	0x0
	tgu	%icc,	0x2
	fmovrsgez	%o2,	%f9,	%f5
	array8	%l2,	%g5,	%g7
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 0x1
	fblg,a	%fcc0,	loop_1177
	movvs	%icc,	%o6,	%i5
	umulcc	%l1,	%g6,	%o4
	move	%icc,	%i6,	%o1
loop_1177:
	movleu	%icc,	%i2,	%i1
	movrlez	%o0,	%o7,	%l4
	fmovdne	%xcc,	%f26,	%f15
	fmovdl	%xcc,	%f30,	%f9
	fandnot2s	%f13,	%f19,	%f1
	movre	%l3,	0x3F2,	%l5
	fnegs	%f15,	%f26
	fmovd	%f16,	%f10
	tge	%xcc,	0x1
	edge32	%i7,	%g3,	%l6
	movn	%xcc,	%o3,	%i3
	tleu	%xcc,	0x7
	tsubcctv	%i0,	0x141D,	%g1
	fnands	%f5,	%f6,	%f23
	pdist	%f8,	%f14,	%f22
	movrlz	%l0,	0x1BB,	%o5
	tcc	%xcc,	0x3
	ta	%icc,	0x2
	subc	%i4,	0x1A1F,	%g4
	fxor	%f4,	%f16,	%f10
	fcmpeq32	%f10,	%f4,	%g2
	fcmpd	%fcc2,	%f10,	%f10
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	ldsh	[%l7 + 0x42],	%l2
	fcmpgt16	%f8,	%f8,	%g7
	edge16l	%g5,	%o6,	%i5
	xnorcc	%l1,	%g6,	%i6
	tle	%xcc,	0x4
	fones	%f27
	std	%f0,	[%l7 + 0x10]
	and	%o1,	0x1662,	%o4
	fands	%f13,	%f12,	%f28
	tg	%icc,	0x4
	tcc	%xcc,	0x1
	fcmpne16	%f10,	%f4,	%i2
	subcc	%o0,	%o7,	%l4
	mulx	%l3,	0x06C5,	%l5
	and	%i7,	%i1,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1CD8,	%l6
	ldstub	[%l7 + 0x15],	%i3
	set	0x30, %i4
	stda	%i0,	[%l7 + %i4] 0x14
	fsrc1s	%f5,	%f5
	fnot2s	%f12,	%f9
	bshuffle	%f12,	%f0,	%f0
	subc	%o3,	0x013E,	%l0
	mulx	%o5,	0x0E0A,	%g1
	fmul8x16	%f22,	%f10,	%f4
	mova	%icc,	%i4,	%g4
	fbn,a	%fcc1,	loop_1178
	andncc	%g2,	%l2,	%o2
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g7
loop_1178:
	fnor	%f8,	%f12,	%f4
	tle	%icc,	0x0
	movneg	%icc,	%o6,	%g5
	popc	%l1,	%g6
	srlx	%i6,	%o1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i5,	0x1E18,	%i2
	move	%xcc,	%o0,	%o7
	fmovdleu	%xcc,	%f27,	%f8
	umulcc	%l3,	%l5,	%l4
	xnor	%i7,	%i1,	%l6
	movcs	%icc,	%g3,	%i3
	fmovdne	%icc,	%f21,	%f11
	fbne,a	%fcc1,	loop_1179
	alignaddr	%o3,	%i0,	%l0
	fmovrslz	%g1,	%f1,	%f3
	movrlz	%o5,	0x149,	%g4
loop_1179:
	call	loop_1180
	edge32ln	%i4,	%l2,	%o2
	membar	0x0D
	movleu	%xcc,	%g2,	%g7
loop_1180:
	popc	0x0E41,	%o6
	sdivx	%g5,	0x04BA,	%l1
	xorcc	%g6,	0x1310,	%i6
	sub	%o1,	%i5,	%o4
	tl	%xcc,	0x6
	set	0x12, %i5
	ldsha	[%l7 + %i5] 0x19,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i2,	%l3,	%o7
	udivx	%l5,	0x1554,	%l4
	bneg,a	loop_1181
	popc	0x1304,	%i1
	bcc,a	loop_1182
	add	%i7,	%l6,	%g3
loop_1181:
	fmul8sux16	%f0,	%f18,	%f4
	movcs	%xcc,	%o3,	%i0
loop_1182:
	brlz	%l0,	loop_1183
	smulcc	%i3,	0x1F6A,	%g1
	fabss	%f2,	%f8
	xorcc	%g4,	0x06B0,	%i4
loop_1183:
	movvs	%xcc,	%l2,	%o2
	movleu	%icc,	%o5,	%g2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%o6
	membar	0x17
	tn	%icc,	0x0
	edge32	%g7,	%l1,	%g6
	edge8ln	%g5,	%i6,	%o1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	movrlez	%o0,	%i5,	%i2
	fba	%fcc1,	loop_1184
	tleu	%icc,	0x6
	edge8ln	%o7,	%l5,	%l3
	membar	0x56
loop_1184:
	fbul	%fcc2,	loop_1185
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4A, %o6
	ldsha	[%l7 + %o6] 0x0c,	%i1
loop_1185:
	srlx	%l4,	%i7,	%g3
	udivx	%o3,	0x0FCB,	%i0
	membar	0x75
	stw	%l6,	[%l7 + 0x60]
	movcc	%icc,	%l0,	%i3
	fmovdpos	%icc,	%f10,	%f28
	fbu,a	%fcc2,	loop_1186
	umul	%g4,	%g1,	%l2
	movneg	%xcc,	%o2,	%o5
	fmovda	%xcc,	%f5,	%f23
loop_1186:
	movrne	%i4,	%g2,	%o6
	mulx	%g7,	%g6,	%l1
	fbe	%fcc0,	loop_1187
	bgu,a,pn	%icc,	loop_1188
	fpsub16s	%f6,	%f8,	%f27
	bg,pn	%xcc,	loop_1189
loop_1187:
	edge8n	%g5,	%o1,	%i6
loop_1188:
	fbul,a	%fcc1,	loop_1190
	addcc	%o4,	0x079B,	%i5
loop_1189:
	nop
	set	0x56, %l4
	stha	%i2,	[%l7 + %l4] 0x04
loop_1190:
	tleu	%xcc,	0x1
	fmovsvc	%icc,	%f25,	%f24
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x71] %asi,	%o7
	tne	%icc,	0x1
	subccc	%l5,	%o0,	%i1
	std	%f24,	[%l7 + 0x60]
	fandnot1	%f22,	%f18,	%f26
	taddcctv	%l3,	0x1945,	%l4
	xnorcc	%g3,	%i7,	%i0
	brgz	%o3,	loop_1191
	mulx	%l0,	0x142F,	%l6
	sra	%i3,	0x04,	%g1
	movrlez	%l2,	0x3E7,	%g4
loop_1191:
	addcc	%o5,	%o2,	%i4
	stw	%g2,	[%l7 + 0x28]
	tsubcc	%g7,	0x160A,	%o6
	and	%l1,	0x1E86,	%g6
	fmovsvc	%icc,	%f30,	%f12
	mulx	%g5,	0x0AD7,	%o1
	ta	%icc,	0x7
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x18,	 0x1
	fxors	%f12,	%f19,	%f31
	tneg	%icc,	0x3
	movrgez	%i6,	%i5,	%o7
	fmovrde	%l5,	%f0,	%f24
	fmovdg	%xcc,	%f29,	%f25
	movgu	%icc,	%i2,	%i1
	array32	%l3,	%o0,	%g3
	tsubcc	%l4,	%i7,	%o3
	fabss	%f3,	%f23
	movcc	%icc,	%i0,	%l6
	tvs	%xcc,	0x1
	taddcc	%i3,	0x04C4,	%l0
	ldx	[%l7 + 0x18],	%l2
	fcmpne32	%f8,	%f26,	%g1
	edge16	%g4,	%o2,	%o5
	ble,a	%icc,	loop_1192
	fcmple16	%f4,	%f18,	%g2
	edge8l	%g7,	%i4,	%l1
	tsubcctv	%o6,	0x04BB,	%g6
loop_1192:
	fbg,a	%fcc0,	loop_1193
	smulcc	%g5,	%o1,	%i6
	tpos	%icc,	0x5
	movcs	%icc,	%i5,	%o4
loop_1193:
	tl	%xcc,	0x7
	set	0x0E, %i2
	stha	%l5,	[%l7 + %i2] 0x04
	fnands	%f8,	%f7,	%f17
	tvs	%xcc,	0x0
	fmovscc	%icc,	%f15,	%f1
	fba,a	%fcc1,	loop_1194
	ld	[%l7 + 0x78],	%f18
	orn	%o7,	0x1EA8,	%i2
	alignaddr	%i1,	%o0,	%l3
loop_1194:
	ldsw	[%l7 + 0x7C],	%g3
	fnot2s	%f17,	%f22
	fbo,a	%fcc3,	loop_1195
	movneg	%icc,	%i7,	%l4
	tcs	%icc,	0x0
	tsubcctv	%i0,	0x0DC3,	%l6
loop_1195:
	mulscc	%o3,	%l0,	%l2
	movrlz	%i3,	0x334,	%g1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x1C] %asi,	%f18
	movn	%icc,	%g4,	%o5
	fmovrde	%o2,	%f28,	%f2
	movrlez	%g2,	%g7,	%l1
	movl	%xcc,	%i4,	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x11,	%g6,	%o1
	movle	%icc,	%i6,	%i5
	prefetch	[%l7 + 0x08],	 0x0
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x15,	%g4
	movle	%icc,	%l5,	%o7
	set	0x78, %o4
	lduwa	[%l7 + %o4] 0x11,	%o4
	fpackfix	%f8,	%f5
	andcc	%i2,	0x1573,	%o0
	array8	%l3,	%i1,	%i7
	movne	%icc,	%l4,	%i0
	fornot1	%f30,	%f12,	%f18
	xnor	%l6,	%g3,	%l0
	addcc	%l2,	0x0D30,	%o3
	xnorcc	%g1,	%g4,	%o5
	fands	%f29,	%f17,	%f25
	array8	%i3,	%o2,	%g2
	nop
	set	0x3C, %g5
	lduh	[%l7 + %g5],	%l1
	andcc	%i4,	%g7,	%o6
	srax	%g6,	%i6,	%o1
	edge8n	%g5,	%i5,	%l5
	sll	%o7,	%i2,	%o4
	sllx	%l3,	%o0,	%i7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x28] %asi,	%i1
	movgu	%icc,	%i0,	%l6
	edge8	%l4,	%g3,	%l0
	set	0x55, %o2
	lduba	[%l7 + %o2] 0x18,	%l2
	fbo,a	%fcc0,	loop_1196
	srax	%o3,	%g1,	%g4
	ld	[%l7 + 0x20],	%f12
	lduw	[%l7 + 0x48],	%o5
loop_1196:
	mulscc	%i3,	%g2,	%l1
	add	%i4,	0x0D62,	%o2
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	brgz,a	%o6,	loop_1197
	fxnors	%f9,	%f10,	%f30
	mulscc	%g6,	0x01C7,	%g7
	ldsh	[%l7 + 0x10],	%o1
loop_1197:
	fmovrslez	%i6,	%f8,	%f13
	st	%f12,	[%l7 + 0x4C]
	mulx	%i5,	%l5,	%g5
	sll	%i2,	%o7,	%l3
	fcmpes	%fcc2,	%f5,	%f12
	edge8ln	%o4,	%i7,	%i1
	andn	%o0,	0x1C5B,	%l6
	fxnors	%f11,	%f2,	%f5
	fandnot2	%f10,	%f22,	%f2
	fbge	%fcc0,	loop_1198
	edge16	%l4,	%i0,	%g3
	membar	0x7E
	bg	%xcc,	loop_1199
loop_1198:
	xnorcc	%l2,	0x1AB1,	%o3
	subcc	%g1,	0x063E,	%g4
	stb	%l0,	[%l7 + 0x51]
loop_1199:
	edge32	%o5,	%i3,	%g2
	xor	%l1,	%i4,	%o6
	ldd	[%l7 + 0x30],	%f12
	ldub	[%l7 + 0x76],	%g6
	fmovdcc	%xcc,	%f1,	%f9
	te	%icc,	0x0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x48] %asi,	%o2
	tsubcc	%g7,	%o1,	%i5
	ldstub	[%l7 + 0x15],	%l5
	movvc	%icc,	%i6,	%i2
	tvc	%icc,	0x1
	mova	%icc,	%g5,	%o7
	fmovdcs	%xcc,	%f0,	%f15
	fmovsge	%xcc,	%f5,	%f18
	lduw	[%l7 + 0x50],	%o4
	edge8l	%l3,	%i1,	%i7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x26] %asi,	%l6
	edge8	%o0,	%i0,	%l4
	lduh	[%l7 + 0x5A],	%g3
	sir	0x0EFA
	andcc	%o3,	%g1,	%l2
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%l0
	fxnor	%f2,	%f24,	%f24
	fnands	%f16,	%f1,	%f26
	edge16n	%o5,	%i3,	%g4
	subcc	%g2,	%l1,	%o6
	movle	%xcc,	%g6,	%o2
	set	0x0C, %o1
	lda	[%l7 + %o1] 0x88,	%f2
	movneg	%icc,	%g7,	%i4
	fmul8sux16	%f16,	%f10,	%f4
	srax	%i5,	%o1,	%l5
	umulcc	%i2,	%g5,	%i6
	tsubcctv	%o7,	0x0BD1,	%l3
	nop
	set	0x68, %g2
	ldsw	[%l7 + %g2],	%o4
	tn	%xcc,	0x5
	ldsb	[%l7 + 0x15],	%i1
	edge8l	%l6,	%i7,	%i0
	array8	%l4,	%g3,	%o3
	movpos	%xcc,	%g1,	%l2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x26] %asi,	%o0
	edge16l	%o5,	%l0,	%i3
	add	%g2,	0x00C5,	%g4
	fmovse	%xcc,	%f31,	%f17
	tsubcctv	%o6,	%l1,	%g6
	array8	%o2,	%g7,	%i5
	set	0x5C, %g3
	ldswa	[%l7 + %g3] 0x15,	%i4
	xnor	%o1,	%i2,	%l5
	std	%f10,	[%l7 + 0x78]
	alignaddr	%i6,	%o7,	%l3
	sub	%o4,	0x1089,	%g5
	fbug,a	%fcc1,	loop_1200
	membar	0x02
	tpos	%xcc,	0x3
	bcc,pt	%icc,	loop_1201
loop_1200:
	movgu	%icc,	%l6,	%i1
	andn	%i0,	%l4,	%g3
	tpos	%xcc,	0x0
loop_1201:
	stb	%i7,	[%l7 + 0x4E]
	sra	%o3,	0x06,	%l2
	fmovsneg	%xcc,	%f23,	%f5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g1,	%o0
	move	%xcc,	%o5,	%i3
	sir	0x0578
	tcc	%icc,	0x4
	movvs	%icc,	%l0,	%g4
	umulcc	%g2,	0x018E,	%l1
	and	%o6,	0x194C,	%o2
	fmovdvs	%icc,	%f30,	%f8
	srl	%g6,	0x18,	%i5
	fsrc2	%f28,	%f8
	bshuffle	%f22,	%f26,	%f24
	fbug,a	%fcc0,	loop_1202
	orn	%g7,	0x17B1,	%o1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1202:
	addc	%i4,	0x10F8,	%i2
	fmovrslez	%i6,	%f15,	%f23
	fand	%f18,	%f14,	%f26
	fbul	%fcc3,	loop_1203
	fmovrse	%l5,	%f13,	%f23
	fnot1	%f8,	%f22
	edge16	%o7,	%o4,	%l3
loop_1203:
	orncc	%l6,	%g5,	%i1
	array32	%i0,	%l4,	%i7
	brz,a	%g3,	loop_1204
	addccc	%o3,	0x19C9,	%g1
	movre	%o0,	%o5,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l0,	%i3
loop_1204:
	bne,a	loop_1205
	brlz,a	%g4,	loop_1206
	movcs	%icc,	%g2,	%l1
	sdiv	%o2,	0x0883,	%o6
loop_1205:
	edge16	%g6,	%g7,	%o1
loop_1206:
	movn	%icc,	%i5,	%i2
	bgu	loop_1207
	tg	%icc,	0x3
	andcc	%i4,	0x1841,	%i6
	orn	%l5,	%o7,	%l3
loop_1207:
	fbu,a	%fcc2,	loop_1208
	ld	[%l7 + 0x4C],	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l6,	0x010D,	%g5
loop_1208:
	tge	%icc,	0x7
	tneg	%xcc,	0x7
	alignaddr	%o4,	%i0,	%l4
	set	0x1E, %i3
	ldsha	[%l7 + %i3] 0x81,	%i7
	orcc	%g3,	0x07A2,	%o3
	ble	%icc,	loop_1209
	sdiv	%g1,	0x1768,	%i1
	tvs	%icc,	0x0
	sdiv	%o0,	0x0C3B,	%l2
loop_1209:
	umulcc	%o5,	%i3,	%l0
	fmovda	%xcc,	%f8,	%f12
	fcmpeq16	%f12,	%f0,	%g2
	sdiv	%g4,	0x18F7,	%o2
	tl	%xcc,	0x3
	set	0x21, %o5
	stba	%l1,	[%l7 + %o5] 0x0c
	lduw	[%l7 + 0x68],	%o6
	fmovsle	%xcc,	%f2,	%f7
	edge16n	%g6,	%g7,	%i5
	movge	%icc,	%i2,	%o1
	tg	%icc,	0x3
	bpos,a	loop_1210
	srlx	%i4,	%l5,	%o7
	movrlz	%i6,	0x222,	%l3
	lduw	[%l7 + 0x24],	%l6
loop_1210:
	tle	%xcc,	0x1
	orcc	%g5,	0x1CE2,	%o4
	sll	%i0,	0x14,	%i7
	fxnor	%f18,	%f8,	%f4
	fcmpgt32	%f28,	%f0,	%l4
	xorcc	%g3,	0x17BA,	%o3
	tn	%icc,	0x5
	sdivx	%i1,	0x0B66,	%g1
	addcc	%o0,	%l2,	%o5
	tvs	%xcc,	0x1
	fmovsge	%xcc,	%f21,	%f18
	set	0x2C, %i0
	stwa	%l0,	[%l7 + %i0] 0x14
	alignaddrl	%g2,	%g4,	%i3
	tvs	%icc,	0x4
	tvs	%icc,	0x2
	std	%f18,	[%l7 + 0x60]
	movvc	%icc,	%l1,	%o6
	fpsub16	%f20,	%f10,	%f4
	smul	%o2,	0x0EC1,	%g7
	edge32	%i5,	%g6,	%o1
	edge32	%i4,	%l5,	%i2
	sdivx	%o7,	0x1A4E,	%i6
	umul	%l6,	0x0F44,	%l3
	movl	%icc,	%g5,	%o4
	fpadd16	%f26,	%f8,	%f6
	tl	%icc,	0x2
	edge16	%i7,	%i0,	%l4
	tle	%icc,	0x0
	srl	%o3,	0x0C,	%i1
	bl	loop_1211
	fnegd	%f14,	%f26
	fpmerge	%f15,	%f18,	%f20
	edge32n	%g3,	%g1,	%l2
loop_1211:
	orncc	%o0,	0x180A,	%l0
	fba,a	%fcc2,	loop_1212
	ldub	[%l7 + 0x58],	%g2
	udivcc	%o5,	0x0144,	%i3
	fand	%f6,	%f30,	%f2
loop_1212:
	sth	%l1,	[%l7 + 0x76]
	te	%xcc,	0x2
	andcc	%g4,	%o2,	%o6
	movre	%i5,	%g6,	%o1
	fpsub16s	%f21,	%f2,	%f24
	fabss	%f27,	%f30
	and	%g7,	%i4,	%l5
	set	0x50, %i1
	ldswa	[%l7 + %i1] 0x18,	%i2
	tsubcctv	%o7,	0x0EC3,	%i6
	edge16n	%l6,	%l3,	%o4
	fzero	%f28
	array8	%g5,	%i7,	%i0
	fones	%f18
	lduw	[%l7 + 0x70],	%l4
	and	%o3,	%i1,	%g1
	nop
	set	0x14, %i6
	prefetch	[%l7 + %i6],	 0x0
	flush	%l7 + 0x50
	tsubcctv	%g3,	%l2,	%l0
	set	0x18, %g4
	stxa	%o0,	[%l7 + %g4] 0x2b
	membar	#Sync
	movpos	%xcc,	%o5,	%g2
	fbul,a	%fcc1,	loop_1213
	subcc	%i3,	%g4,	%l1
	smul	%o6,	%o2,	%i5
	bn,a	loop_1214
loop_1213:
	fpack16	%f26,	%f0
	edge8n	%o1,	%g7,	%i4
	array16	%g6,	%i2,	%o7
loop_1214:
	fornot2s	%f8,	%f5,	%f17
	andncc	%i6,	%l5,	%l3
	fcmpeq32	%f26,	%f20,	%o4
	movrgez	%g5,	0x1DF,	%l6
	fnot1s	%f9,	%f3
	xor	%i7,	%l4,	%o3
	sll	%i0,	0x14,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g1,	%l2
	nop
	setx	loop_1215,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%icc,	%g3,	%o0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x08] %asi,	%o5
loop_1215:
	ldstub	[%l7 + 0x43],	%l0
	umulcc	%i3,	0x1C3E,	%g2
	fnegs	%f27,	%f4
	andcc	%l1,	%g4,	%o2
	tl	%icc,	0x4
	ldd	[%l7 + 0x30],	%o6
	movleu	%xcc,	%o1,	%i5
	subccc	%g7,	%g6,	%i4
	fmuld8ulx16	%f4,	%f19,	%f26
	fbuge	%fcc1,	loop_1216
	alignaddrl	%o7,	%i2,	%l5
	add	%l3,	0x0EAA,	%i6
	addcc	%g5,	%l6,	%i7
loop_1216:
	call	loop_1217
	tleu	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f23,	%f16,	%f27
loop_1217:
	addcc	%o4,	0x1447,	%l4
	udivcc	%o3,	0x1FFC,	%i1
	fmovse	%xcc,	%f0,	%f19
	sdivx	%i0,	0x0B74,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g3,	%g1,	%o5
	subccc	%o0,	%i3,	%g2
	xnor	%l0,	0x19E4,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o2,	%o6
	fble,a	%fcc2,	loop_1218
	fnor	%f0,	%f20,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f7,	%f12
loop_1218:
	nop
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0x2
	siam	0x6
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0x1
	fmovsne	%icc,	%f21,	%f6
	fmovrdgz	%g7,	%f0,	%f28
	ble,pn	%xcc,	loop_1219
	fmovrsgez	%g6,	%f11,	%f12
	fsrc2s	%f14,	%f23
	bl,a	%icc,	loop_1220
loop_1219:
	fbne	%fcc0,	loop_1221
	edge16ln	%g4,	%i4,	%o7
	and	%i2,	0x075E,	%l5
loop_1220:
	and	%l3,	%g5,	%i6
loop_1221:
	tvc	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_1222, %l0, %l1
	jmpl %l1, %i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l6,	%l4
	array8	%o4,	%o3,	%i0
loop_1222:
	brnz,a	%l2,	loop_1223
	sllx	%g3,	0x0C,	%i1
	taddcctv	%g1,	0x0C6E,	%o0
	fmovsge	%xcc,	%f23,	%f8
loop_1223:
	mulscc	%i3,	%g2,	%o5
	fmovrdlez	%l0,	%f8,	%f24
	fmovdneg	%icc,	%f17,	%f10
	subc	%l1,	%o2,	%o6
	edge8n	%o1,	%i5,	%g7
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x18,	%f0
	xnorcc	%g4,	0x1B9B,	%g6
	nop
	setx	loop_1224,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x5
	tvs	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1224:
	mulx	%i4,	%o7,	%l5
	fbul,a	%fcc2,	loop_1225
	edge8l	%i2,	%l3,	%g5
	bn,a,pt	%xcc,	loop_1226
	addccc	%i7,	0x0F98,	%l6
loop_1225:
	tne	%icc,	0x6
	tvc	%icc,	0x3
loop_1226:
	brz,a	%i6,	loop_1227
	fbne	%fcc3,	loop_1228
	brlz	%o4,	loop_1229
	movvs	%icc,	%o3,	%i0
loop_1227:
	fmovrdlez	%l4,	%f20,	%f6
loop_1228:
	std	%f30,	[%l7 + 0x30]
loop_1229:
	edge16n	%l2,	%g3,	%i1
	movrlez	%g1,	0x269,	%i3
	sdiv	%o0,	0x150B,	%g2
	edge16n	%o5,	%l1,	%o2
	fcmpne32	%f22,	%f4,	%l0
	set	0x20, %o3
	lda	[%l7 + %o3] 0x11,	%f27
	ldsh	[%l7 + 0x5A],	%o1
	ba	loop_1230
	edge16l	%o6,	%g7,	%i5
	edge16n	%g6,	%i4,	%o7
	stbar
loop_1230:
	taddcctv	%g4,	0x0A47,	%l5
	fcmps	%fcc3,	%f20,	%f6
	movrne	%i2,	%l3,	%i7
	fsrc2s	%f17,	%f20
	movg	%icc,	%l6,	%i6
	bneg,a	loop_1231
	std	%g4,	[%l7 + 0x18]
	movl	%xcc,	%o4,	%o3
	xnor	%l4,	0x090A,	%i0
loop_1231:
	taddcctv	%l2,	%g3,	%i1
	bshuffle	%f12,	%f18,	%f10
	addcc	%i3,	%o0,	%g1
	be,a,pt	%icc,	loop_1232
	tneg	%xcc,	0x4
	tcs	%xcc,	0x3
	alignaddr	%o5,	%l1,	%g2
loop_1232:
	array32	%l0,	%o1,	%o2
	alignaddrl	%o6,	%i5,	%g6
	lduh	[%l7 + 0x50],	%g7
	te	%xcc,	0x0
	fzeros	%f8
	tgu	%icc,	0x2
	fbug	%fcc0,	loop_1233
	fxors	%f9,	%f23,	%f4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%o7
loop_1233:
	xnorcc	%g4,	%l5,	%i2
	tcc	%xcc,	0x1
	umulcc	%l3,	0x1A4D,	%l6
	brnz	%i7,	loop_1234
	tcc	%icc,	0x2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x4C] %asi,	%f7
loop_1234:
	fpsub16s	%f3,	%f19,	%f19
	edge32n	%g5,	%o4,	%i6
	tleu	%xcc,	0x2
	fmovsvc	%icc,	%f3,	%f9
	popc	%l4,	%i0
	addc	%o3,	0x1071,	%l2
	fcmpeq16	%f22,	%f30,	%i1
	fbn	%fcc2,	loop_1235
	orn	%i3,	%g3,	%o0
	edge8n	%o5,	%l1,	%g1
	fbne	%fcc0,	loop_1236
loop_1235:
	be,a,pt	%xcc,	loop_1237
	umul	%g2,	%l0,	%o1
	fbu	%fcc3,	loop_1238
loop_1236:
	edge8	%o2,	%o6,	%i5
loop_1237:
	nop
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x17,	%f16
loop_1238:
	edge8ln	%g7,	%i4,	%o7
	subcc	%g4,	0x1395,	%l5
	alignaddrl	%i2,	%l3,	%l6
	tsubcc	%g6,	0x0042,	%g5
	movpos	%xcc,	%o4,	%i7
	edge8ln	%l4,	%i6,	%i0
	movvc	%icc,	%l2,	%o3
	membar	0x7B
	tle	%xcc,	0x5
	mova	%icc,	%i3,	%g3
	tl	%xcc,	0x5
	fmovrdne	%i1,	%f0,	%f28
	ta	%xcc,	0x3
	subccc	%o5,	0x0E52,	%l1
	edge32l	%g1,	%g2,	%o0
	brlez	%o1,	loop_1239
	movpos	%xcc,	%o2,	%o6
	edge32ln	%l0,	%g7,	%i4
	flush	%l7 + 0x08
loop_1239:
	edge16n	%i5,	%o7,	%l5
	and	%i2,	%g4,	%l3
	sll	%g6,	%g5,	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i7,	%l4
	call	loop_1240
	te	%xcc,	0x4
	movleu	%xcc,	%i6,	%l6
	movneg	%icc,	%i0,	%l2
loop_1240:
	tn	%icc,	0x3
	tvs	%xcc,	0x5
	fcmple32	%f22,	%f8,	%o3
	bgu,a	loop_1241
	bne,pt	%xcc,	loop_1242
	fxor	%f30,	%f16,	%f16
	edge16	%g3,	%i3,	%o5
loop_1241:
	ldsw	[%l7 + 0x64],	%l1
loop_1242:
	fmovdneg	%xcc,	%f25,	%f7
	movneg	%icc,	%g1,	%g2
	tleu	%xcc,	0x2
	fbne	%fcc2,	loop_1243
	array8	%o0,	%o1,	%o2
	edge8l	%i1,	%l0,	%o6
	fcmple16	%f6,	%f16,	%g7
loop_1243:
	sdivcc	%i4,	0x119C,	%i5
	tvc	%icc,	0x1
	fbne,a	%fcc3,	loop_1244
	tvc	%xcc,	0x4
	fbug,a	%fcc1,	loop_1245
	edge32ln	%l5,	%o7,	%i2
loop_1244:
	tsubcctv	%g4,	0x0EE0,	%g6
	sethi	0x0C14,	%g5
loop_1245:
	movrlz	%l3,	0x09C,	%i7
	sub	%l4,	0x1852,	%i6
	tle	%xcc,	0x7
	tvc	%icc,	0x3
	add	%l6,	%i0,	%l2
	sll	%o3,	%o4,	%g3
	andcc	%o5,	%l1,	%i3
	tne	%xcc,	0x7
	movn	%xcc,	%g2,	%g1
	set	0x4C, %g6
	sta	%f8,	[%l7 + %g6] 0x04
	fxor	%f30,	%f24,	%f0
	fmovdpos	%icc,	%f10,	%f31
	orncc	%o1,	0x1FD6,	%o2
	set	0x5C, %i7
	sta	%f31,	[%l7 + %i7] 0x18
	bcc,pn	%xcc,	loop_1246
	bleu,a	loop_1247
	fmovsl	%xcc,	%f21,	%f2
	addc	%i1,	%l0,	%o0
loop_1246:
	edge32n	%g7,	%o6,	%i5
loop_1247:
	movrne	%l5,	0x239,	%i4
	sub	%i2,	%g4,	%o7
	fmovdvs	%icc,	%f19,	%f26
	edge32	%g5,	%l3,	%i7
	fpack16	%f4,	%f22
	andncc	%l4,	%i6,	%g6
	tne	%xcc,	0x5
	addc	%l6,	%i0,	%l2
	stw	%o3,	[%l7 + 0x1C]
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%g3
	fcmps	%fcc3,	%f8,	%f0
	array16	%o4,	%l1,	%o5
	fbuge	%fcc3,	loop_1248
	fblg,a	%fcc2,	loop_1249
	andcc	%g2,	%i3,	%o1
	tcs	%icc,	0x6
loop_1248:
	bleu	loop_1250
loop_1249:
	movge	%icc,	%g1,	%o2
	umulcc	%l0,	%o0,	%i1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o6
loop_1250:
	fmovd	%f0,	%f10
	taddcc	%g7,	0x1661,	%l5
	bcc,pt	%xcc,	loop_1251
	movvs	%icc,	%i5,	%i2
	fzero	%f20
	fornot1s	%f21,	%f31,	%f10
loop_1251:
	fmovsvc	%xcc,	%f5,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x5
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x80,	%g4
	fmovrde	%i4,	%f20,	%f8
	tl	%icc,	0x3
	movrgz	%o7,	%l3,	%i7
	movpos	%xcc,	%l4,	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g6,	%g5
	movle	%icc,	%l6,	%i0
	tcs	%xcc,	0x2
	tpos	%icc,	0x3
	ldx	[%l7 + 0x10],	%o3
	movrlez	%l2,	0x066,	%o4
	bn,a,pt	%xcc,	loop_1252
	movrgz	%l1,	0x257,	%g3
	edge32	%g2,	%i3,	%o1
	movrgez	%o5,	0x2ED,	%o2
loop_1252:
	sethi	0x00AB,	%l0
	move	%xcc,	%o0,	%i1
	fsrc1	%f16,	%f24
	bleu,a	loop_1253
	edge16	%g1,	%g7,	%o6
	fbuge	%fcc0,	loop_1254
	udivcc	%l5,	0x0775,	%i5
loop_1253:
	addccc	%g4,	%i2,	%o7
	movl	%xcc,	%l3,	%i4
loop_1254:
	fmovsleu	%xcc,	%f11,	%f12
	alignaddr	%i7,	%i6,	%g6
	fsrc1s	%f27,	%f4
	srlx	%l4,	0x06,	%g5
	fmovsne	%icc,	%f12,	%f13
	fmovrsgez	%i0,	%f12,	%f1
	movrne	%o3,	%l6,	%l2
	xnor	%l1,	0x013C,	%g3
	sir	0x1D3F
	bvs	loop_1255
	sra	%g2,	0x15,	%o4
	movrgz	%i3,	0x3C6,	%o1
	edge8ln	%o5,	%l0,	%o0
loop_1255:
	fabss	%f24,	%f10
	fpadd16	%f28,	%f24,	%f16
	bpos,pn	%icc,	loop_1256
	edge16n	%i1,	%o2,	%g1
	movrlz	%o6,	0x079,	%l5
	edge16n	%i5,	%g4,	%i2
loop_1256:
	fble	%fcc2,	loop_1257
	edge8l	%o7,	%l3,	%i4
	orcc	%g7,	0x00A1,	%i6
	movrlez	%g6,	0x1C1,	%i7
loop_1257:
	udivx	%l4,	0x02B3,	%g5
	add	%o3,	%l6,	%i0
	fbug,a	%fcc0,	loop_1258
	andcc	%l1,	%g3,	%g2
	sdivx	%o4,	0x005D,	%i3
	edge32n	%l2,	%o1,	%o5
loop_1258:
	fpadd32s	%f13,	%f11,	%f19
	tn	%xcc,	0x1
	or	%l0,	%o0,	%i1
	fbe,a	%fcc3,	loop_1259
	edge8n	%o2,	%g1,	%o6
	movg	%icc,	%l5,	%i5
	fbul	%fcc3,	loop_1260
loop_1259:
	taddcc	%g4,	%o7,	%l3
	taddcc	%i2,	%g7,	%i4
	fcmpeq16	%f30,	%f24,	%g6
loop_1260:
	brgez,a	%i6,	loop_1261
	movre	%i7,	0x0E2,	%g5
	fmovsge	%xcc,	%f29,	%f22
	sllx	%l4,	0x11,	%o3
loop_1261:
	nop
	set	0x6C, %i4
	sta	%f24,	[%l7 + %i4] 0x04
	orn	%l6,	%l1,	%i0
	tl	%icc,	0x7
	xnorcc	%g2,	0x05C1,	%g3
	fand	%f20,	%f4,	%f6
	subc	%o4,	%i3,	%o1
	sethi	0x01E3,	%o5
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x19,	%l0
	fmovsl	%icc,	%f27,	%f23
	lduw	[%l7 + 0x14],	%o0
	ldsb	[%l7 + 0x52],	%i1
	edge16	%o2,	%g1,	%l2
	set	0x38, %i5
	stxa	%o6,	[%l7 + %i5] 0x0c
	sethi	0x0FCA,	%i5
	sra	%l5,	0x09,	%o7
	orcc	%g4,	0x05F5,	%l3
	movleu	%icc,	%i2,	%i4
	sra	%g6,	0x0C,	%g7
	mova	%xcc,	%i7,	%g5
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x0c,	 0x2
	stw	%i6,	[%l7 + 0x34]
	ldd	[%l7 + 0x60],	%f24
	fmovdneg	%xcc,	%f10,	%f23
	fmovsne	%icc,	%f16,	%f11
	wr	%g0,	0x80,	%asi
	sta	%f25,	[%l7 + 0x28] %asi
	fmovdgu	%xcc,	%f2,	%f15
	fmovsle	%icc,	%f30,	%f7
	sdivx	%l6,	0x1CC0,	%o3
	ldsw	[%l7 + 0x28],	%l1
	edge8	%g2,	%i0,	%g3
	fblg	%fcc1,	loop_1262
	movpos	%xcc,	%o4,	%i3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
loop_1262:
	movl	%icc,	%l0,	%o0
	srax	%o5,	%i1,	%g1
	tgu	%xcc,	0x6
	set	0x50, %l5
	lduwa	[%l7 + %l5] 0x18,	%l2
	movl	%xcc,	%o6,	%i5
	mova	%xcc,	%o2,	%o7
	edge32l	%g4,	%l3,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i4,	%g6
	movrlz	%g7,	0x3CD,	%i7
	flush	%l7 + 0x30
	bge,a	%icc,	loop_1263
	bge	loop_1264
	alignaddrl	%g5,	%l4,	%i2
	andcc	%l6,	0x0C6E,	%o3
loop_1263:
	srl	%l1,	0x14,	%g2
loop_1264:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	fmovde	%xcc,	%f27,	%f3
	andcc	%g3,	%i0,	%i3
	edge16	%o4,	%l0,	%o1
	stbar
	sub	%o5,	0x0BE7,	%i1
	sllx	%o0,	0x14,	%g1
	tgu	%icc,	0x6
	stx	%o6,	[%l7 + 0x28]
	edge32ln	%l2,	%i5,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g4,	%l3
	fmul8x16al	%f19,	%f27,	%f16
	edge32	%o7,	%i4,	%l5
	brnz,a	%g6,	loop_1265
	udivcc	%g7,	0x0CEF,	%i7
	xorcc	%g5,	0x0356,	%i2
	membar	0x6E
loop_1265:
	fbg	%fcc1,	loop_1266
	movre	%l6,	0x2D0,	%o3
	tge	%xcc,	0x7
	fmovdcc	%icc,	%f27,	%f25
loop_1266:
	edge32n	%l1,	%l4,	%g2
	xor	%g3,	%i6,	%i0
	fmovdle	%xcc,	%f6,	%f14
	fzero	%f10
	edge8	%i3,	%o4,	%o1
	fba,a	%fcc3,	loop_1267
	edge8l	%l0,	%o5,	%i1
	fbe,a	%fcc0,	loop_1268
	umul	%o0,	%o6,	%g1
loop_1267:
	move	%xcc,	%l2,	%i5
	fmovsle	%xcc,	%f5,	%f3
loop_1268:
	brnz	%o2,	loop_1269
	array32	%g4,	%o7,	%i4
	edge32l	%l5,	%g6,	%l3
	andcc	%g7,	0x032D,	%i7
loop_1269:
	fbug	%fcc0,	loop_1270
	movn	%icc,	%i2,	%l6
	edge32ln	%o3,	%l1,	%l4
	bge,a,pn	%icc,	loop_1271
loop_1270:
	edge16l	%g5,	%g3,	%g2
	sdiv	%i0,	0x0A4F,	%i3
	edge16l	%o4,	%i6,	%o1
loop_1271:
	andcc	%l0,	0x06BE,	%o5
	fcmpgt32	%f24,	%f16,	%i1
	movrlz	%o6,	0x063,	%o0
	ldsw	[%l7 + 0x64],	%l2
	edge16ln	%g1,	%i5,	%g4
	subcc	%o7,	%i4,	%l5
	movg	%icc,	%o2,	%l3
	taddcc	%g7,	%i7,	%g6
	fcmpgt32	%f18,	%f0,	%l6
	fmovscs	%xcc,	%f20,	%f4
	brlz,a	%o3,	loop_1272
	movrgez	%i2,	%l4,	%l1
	edge8l	%g3,	%g5,	%g2
	lduh	[%l7 + 0x32],	%i3
loop_1272:
	movvc	%icc,	%o4,	%i6
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x14] %asi,	%f19
	brlez	%o1,	loop_1273
	fnot1s	%f14,	%f14
	sdiv	%l0,	0x0339,	%o5
	srlx	%i0,	0x1B,	%i1
loop_1273:
	bl,a	loop_1274
	fbn,a	%fcc0,	loop_1275
	movvs	%icc,	%o6,	%o0
	movn	%icc,	%g1,	%l2
loop_1274:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x138] %asi,	%g4 ripped by fixASI40.pl ripped by fixASI40.pl
loop_1275:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x10,	%i5,	%o7
	ldx	[%l7 + 0x70],	%i4
	fcmpne32	%f0,	%f6,	%l5
	brgez,a	%o2,	loop_1276
	taddcc	%g7,	%l3,	%g6
	add	%l6,	0x0B33,	%o3
	sll	%i2,	%l4,	%l1
loop_1276:
	membar	0x04
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x74] %asi,	%g3
	edge32n	%i7,	%g5,	%g2
	fmovsne	%icc,	%f24,	%f1
	fmovdcc	%xcc,	%f25,	%f30
	set	0x7E, %i2
	ldsha	[%l7 + %i2] 0x11,	%i3
	fcmpeq32	%f20,	%f0,	%o4
	siam	0x2
	udivx	%i6,	0x029A,	%l0
	bcc	%icc,	loop_1277
	tcc	%icc,	0x7
	brz,a	%o1,	loop_1278
	sdiv	%o5,	0x16BA,	%i0
loop_1277:
	nop
	set	0x24, %g1
	stha	%o6,	[%l7 + %g1] 0x2b
	membar	#Sync
loop_1278:
	edge16l	%i1,	%o0,	%l2
	smulcc	%g4,	0x1D59,	%g1
	udiv	%o7,	0x1B98,	%i5
	sth	%i4,	[%l7 + 0x08]
	movrgz	%l5,	0x3A1,	%g7
	tn	%icc,	0x7
	sub	%o2,	%l3,	%l6
	sra	%o3,	0x09,	%g6
	fmovdneg	%xcc,	%f27,	%f13
	bcs	loop_1279
	taddcc	%l4,	%l1,	%g3
	tl	%xcc,	0x5
	tcs	%icc,	0x4
loop_1279:
	tvs	%xcc,	0x0
	fbule	%fcc0,	loop_1280
	fpadd16s	%f17,	%f30,	%f25
	ba,pn	%icc,	loop_1281
	tvs	%xcc,	0x1
loop_1280:
	subc	%i7,	0x0891,	%g5
	bshuffle	%f0,	%f18,	%f14
loop_1281:
	bleu,pt	%icc,	loop_1282
	fand	%f18,	%f28,	%f16
	set	0x48, %o4
	stxa	%i2,	[%l7 + %o4] 0x22
	membar	#Sync
loop_1282:
	nop
	set	0x1C, %g5
	lduha	[%l7 + %g5] 0x81,	%g2
	udivx	%o4,	0x0E4D,	%i6
	xnor	%l0,	%i3,	%o5
	addcc	%i0,	0x151B,	%o6
	ldsb	[%l7 + 0x55],	%i1
	edge32l	%o1,	%o0,	%g4
	fmovscc	%xcc,	%f8,	%f26
	array8	%g1,	%o7,	%i5
	tpos	%xcc,	0x1
	ldd	[%l7 + 0x40],	%i4
	sll	%l5,	0x1D,	%l2
	movneg	%xcc,	%o2,	%l3
	fmovsge	%icc,	%f7,	%f17
	fabss	%f31,	%f21
	movge	%icc,	%l6,	%g7
	fmovsge	%xcc,	%f23,	%f29
	bvc,pn	%xcc,	loop_1283
	srlx	%o3,	%g6,	%l4
	nop
	setx loop_1284, %l0, %l1
	jmpl %l1, %l1
	movrlez	%g3,	0x2B0,	%g5
loop_1283:
	tn	%xcc,	0x3
	movre	%i7,	0x3CA,	%g2
loop_1284:
	movrlez	%o4,	%i2,	%l0
	edge32	%i3,	%i6,	%o5
	ta	%icc,	0x5
	or	%i0,	%i1,	%o1
	addccc	%o0,	0x15CF,	%g4
	tn	%icc,	0x1
	fabss	%f4,	%f9
	ldub	[%l7 + 0x18],	%g1
	set	0x30, %l4
	stda	%o6,	[%l7 + %l4] 0x0c
	smul	%o7,	%i5,	%i4
	set	0x30, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l5
	bge,a	loop_1285
	edge16	%o2,	%l2,	%l6
	call	loop_1286
	sdivcc	%g7,	0x14DA,	%l3
loop_1285:
	and	%o3,	0x0577,	%g6
	umulcc	%l4,	0x1ED9,	%l1
loop_1286:
	tge	%icc,	0x6
	movleu	%xcc,	%g5,	%i7
	fble	%fcc1,	loop_1287
	siam	0x6
	array8	%g3,	%g2,	%o4
	movrne	%l0,	0x353,	%i3
loop_1287:
	xnorcc	%i6,	%o5,	%i2
	fmovdgu	%icc,	%f6,	%f9
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x31] %asi,	%i0
	srax	%o1,	0x0D,	%i1
	brgez	%g4,	loop_1288
	fnot1s	%f4,	%f11
	faligndata	%f8,	%f22,	%f6
	addccc	%o0,	%g1,	%o6
loop_1288:
	tne	%icc,	0x7
	movcc	%icc,	%o7,	%i5
	ble,a	loop_1289
	edge8ln	%l5,	%i4,	%o2
	alignaddrl	%l6,	%g7,	%l3
	edge16l	%l2,	%o3,	%g6
loop_1289:
	udivcc	%l1,	0x0843,	%g5
	fpsub16	%f0,	%f18,	%f16
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x4C] %asi,	%l4
	fmovsge	%icc,	%f19,	%f14
	move	%icc,	%g3,	%i7
	fnands	%f20,	%f29,	%f0
	umul	%o4,	%g2,	%l0
	movgu	%xcc,	%i6,	%i3
	taddcc	%i2,	%o5,	%o1
	andcc	%i0,	%g4,	%o0
	movgu	%xcc,	%g1,	%o6
	tg	%icc,	0x1
	subcc	%i1,	0x0E69,	%i5
	taddcc	%l5,	%o7,	%i4
	ba	loop_1290
	addcc	%l6,	0x0488,	%g7
	fmovsa	%xcc,	%f24,	%f7
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o2
loop_1290:
	umul	%l2,	%l3,	%g6
	sll	%o3,	0x11,	%g5
	tl	%icc,	0x0
	fornot1	%f14,	%f16,	%f10
	bvs	%xcc,	loop_1291
	edge16ln	%l4,	%g3,	%l1
	alignaddrl	%o4,	%i7,	%l0
	fnot2	%f16,	%f24
loop_1291:
	fabsd	%f22,	%f4
	edge16ln	%i6,	%g2,	%i3
	ldsh	[%l7 + 0x7C],	%o5
	bvc,a,pn	%xcc,	loop_1292
	udivx	%i2,	0x1547,	%i0
	fmovrse	%o1,	%f30,	%f23
	tne	%icc,	0x6
loop_1292:
	nop
	set	0x68, %o1
	stxa	%o0,	[%l7 + %o1] 0x22
	membar	#Sync
	udivcc	%g4,	0x11F6,	%g1
	edge32l	%o6,	%i1,	%l5
	ldsh	[%l7 + 0x5A],	%o7
	srlx	%i5,	%l6,	%i4
	tl	%icc,	0x1
	xnor	%g7,	%l2,	%l3
	fmovdpos	%xcc,	%f18,	%f24
	tgu	%xcc,	0x3
	te	%icc,	0x6
	tvc	%icc,	0x4
	set	0x10, %o2
	stxa	%o2,	[%l7 + %o2] 0x11
	movcs	%icc,	%o3,	%g6
	nop
	setx	loop_1293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%g5,	0x0E71,	%g3
	movn	%xcc,	%l1,	%l4
	andncc	%o4,	%l0,	%i7
loop_1293:
	fbu	%fcc2,	loop_1294
	fcmps	%fcc3,	%f12,	%f29
	fmovdne	%icc,	%f21,	%f7
	tvs	%xcc,	0x5
loop_1294:
	andcc	%g2,	0x106F,	%i3
	umulcc	%i6,	0x0A3D,	%i2
	fmovrsgez	%i0,	%f13,	%f20
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	alignaddrl	%o5,	%o0,	%o1
	membar	0x6C
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sdivcc	%g1,	0x1895,	%o6
	bgu,a	%xcc,	loop_1295
	tge	%xcc,	0x6
	edge32l	%i1,	%g4,	%l5
	subc	%i5,	%l6,	%o7
loop_1295:
	fbo,a	%fcc0,	loop_1296
	or	%i4,	%g7,	%l2
	movgu	%icc,	%l3,	%o2
	fcmps	%fcc1,	%f0,	%f29
loop_1296:
	tne	%xcc,	0x3
	smulcc	%g6,	0x09EE,	%o3
	te	%xcc,	0x1
	bneg	loop_1297
	fzeros	%f13
	fcmpne32	%f2,	%f0,	%g5
	stbar
loop_1297:
	xnor	%g3,	%l4,	%o4
	bleu,a	%xcc,	loop_1298
	for	%f30,	%f12,	%f28
	wr	%g0,	0x27,	%asi
	stwa	%l0,	[%l7 + 0x38] %asi
	membar	#Sync
loop_1298:
	fmovdcs	%xcc,	%f19,	%f26
	tleu	%icc,	0x6
	movleu	%icc,	%l1,	%i7
	fbule,a	%fcc3,	loop_1299
	nop
	setx	loop_1300,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcc	%icc,	%f8,	%f18
	movn	%icc,	%i3,	%g2
loop_1299:
	edge8l	%i2,	%i6,	%o5
loop_1300:
	array32	%o0,	%o1,	%g1
	stbar
	membar	0x00
	fnot2s	%f11,	%f7
	tne	%xcc,	0x2
	fbe,a	%fcc0,	loop_1301
	orncc	%i0,	%o6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc0,	loop_1302
loop_1301:
	bl,a,pt	%icc,	loop_1303
	subc	%g4,	%i5,	%l6
	tleu	%xcc,	0x3
loop_1302:
	bge	loop_1304
loop_1303:
	movneg	%icc,	%l5,	%i4
	fmovse	%icc,	%f9,	%f31
	fornot1	%f12,	%f24,	%f28
loop_1304:
	fzero	%f6
	fbu,a	%fcc0,	loop_1305
	fexpand	%f14,	%f18
	umulcc	%o7,	%g7,	%l2
	movrlz	%l3,	0x133,	%o2
loop_1305:
	fbo	%fcc1,	loop_1306
	fmovdgu	%xcc,	%f20,	%f4
	movneg	%xcc,	%g6,	%o3
	fmovdleu	%icc,	%f1,	%f15
loop_1306:
	movg	%xcc,	%g5,	%g3
	fnot1s	%f29,	%f1
	movge	%xcc,	%l4,	%l0
	fbug,a	%fcc3,	loop_1307
	move	%icc,	%o4,	%l1
	move	%icc,	%i3,	%g2
	andncc	%i2,	%i7,	%o5
loop_1307:
	movgu	%xcc,	%i6,	%o0
	bg	loop_1308
	stb	%o1,	[%l7 + 0x72]
	edge8ln	%g1,	%o6,	%i0
	fbu	%fcc3,	loop_1309
loop_1308:
	edge16l	%g4,	%i1,	%l6
	tneg	%xcc,	0x0
	fcmple16	%f12,	%f6,	%i5
loop_1309:
	fmovrdlez	%l5,	%f18,	%f18
	sub	%o7,	0x1253,	%i4
	edge32	%l2,	%g7,	%l3
	movpos	%xcc,	%g6,	%o3
	fandnot2s	%f3,	%f19,	%f1
	fmovrse	%g5,	%f24,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o2,	0x19,	%l4
	fabsd	%f14,	%f28
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%l0
	or	%g3,	%l1,	%o4
	fnot2	%f30,	%f10
	fabss	%f17,	%f29
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tcc	%xcc,	0x2
	movge	%icc,	%i3,	%i2
	edge16n	%g2,	%o5,	%i6
	subc	%o0,	0x035A,	%o1
	xnorcc	%i7,	%g1,	%i0
	bgu,a	%icc,	loop_1310
	xnor	%g4,	%o6,	%i1
	fbne	%fcc1,	loop_1311
	movrlz	%l6,	0x309,	%i5
loop_1310:
	fcmpne32	%f18,	%f18,	%o7
	fmovsa	%xcc,	%f16,	%f20
loop_1311:
	nop
	setx	loop_1312,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%icc,	%l5,	%l2
	fbne,a	%fcc2,	loop_1313
	fmovsn	%icc,	%f23,	%f25
loop_1312:
	fbg,a	%fcc3,	loop_1314
	array16	%g7,	%i4,	%g6
loop_1313:
	tg	%icc,	0x0
	tgu	%icc,	0x0
loop_1314:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o3
	smulcc	%g5,	0x0D8E,	%l3
	fmovsvs	%xcc,	%f6,	%f21
	fmovdvs	%icc,	%f26,	%f25
	fornot2	%f22,	%f0,	%f12
	fbne,a	%fcc2,	loop_1315
	fands	%f0,	%f9,	%f26
	movle	%xcc,	%l4,	%l0
	edge8l	%g3,	%o2,	%o4
loop_1315:
	movrgz	%l1,	0x35B,	%i3
	movne	%xcc,	%i2,	%o5
	stw	%i6,	[%l7 + 0x40]
	fexpand	%f21,	%f0
	fones	%f13
	bgu,a	loop_1316
	edge16	%o0,	%g2,	%o1
	movvs	%icc,	%i7,	%i0
	nop
	set	0x4F, %i3
	ldstub	[%l7 + %i3],	%g4
loop_1316:
	bvs,pt	%icc,	loop_1317
	fcmpgt16	%f6,	%f8,	%g1
	edge8	%o6,	%i1,	%l6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o7
loop_1317:
	fpmerge	%f20,	%f15,	%f16
	fandnot1s	%f28,	%f14,	%f22
	mova	%xcc,	%l5,	%i5
	bpos,a,pn	%icc,	loop_1318
	sll	%g7,	%l2,	%i4
	smul	%g6,	%o3,	%l3
	fbue,a	%fcc0,	loop_1319
loop_1318:
	movge	%icc,	%g5,	%l4
	fexpand	%f2,	%f6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l0,	%o2
loop_1319:
	nop
	set	0x28, %o5
	ldxa	[%g0 + %o5] 0x20,	%o4
	subc	%g3,	0x1ED8,	%i3
	tvs	%xcc,	0x7
	umulcc	%l1,	%i2,	%i6
	smulcc	%o0,	0x1733,	%o5
	sethi	0x0B6E,	%o1
	nop
	set	0x6C, %i0
	prefetch	[%l7 + %i0],	 0x2
	bne,pt	%xcc,	loop_1320
	edge8n	%g2,	%i0,	%i7
	orn	%g1,	%g4,	%o6
	tneg	%xcc,	0x2
loop_1320:
	fbe	%fcc0,	loop_1321
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f24,	%f28,	%f6
	edge8ln	%l6,	%o7,	%l5
loop_1321:
	xnor	%i5,	0x1E98,	%g7
	fba	%fcc0,	loop_1322
	ldsh	[%l7 + 0x70],	%l2
	fmovsa	%icc,	%f20,	%f16
	fbue,a	%fcc1,	loop_1323
loop_1322:
	tvc	%icc,	0x6
	fsrc1s	%f2,	%f30
	edge32l	%i1,	%g6,	%i4
loop_1323:
	movrlez	%l3,	%o3,	%g5
	edge16n	%l4,	%o2,	%l0
	prefetch	[%l7 + 0x3C],	 0x1
	sir	0x1CE3
	set	0x48, %g2
	sta	%f0,	[%l7 + %g2] 0x11
	movle	%icc,	%g3,	%o4
	tne	%xcc,	0x4
	nop
	setx	loop_1324,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x1779,	%l1
	std	%i2,	[%l7 + 0x28]
	array32	%i6,	%i3,	%o0
loop_1324:
	array32	%o5,	%g2,	%i0
	movle	%icc,	%i7,	%o1
	sll	%g1,	0x13,	%o6
	edge8ln	%l6,	%g4,	%o7
	add	%i5,	0x1634,	%g7
	fmovscc	%xcc,	%f24,	%f15
	tcs	%icc,	0x2
	edge32n	%l5,	%l2,	%g6
	edge32n	%i1,	%l3,	%i4
	bge,a	loop_1325
	xor	%g5,	%l4,	%o3
	alignaddr	%o2,	%g3,	%o4
	taddcctv	%l1,	%l0,	%i6
loop_1325:
	fmovscc	%icc,	%f28,	%f22
	movle	%xcc,	%i2,	%o0
	taddcc	%o5,	%i3,	%i0
	fmovdcc	%xcc,	%f5,	%f21
	movrlez	%i7,	0x069,	%o1
	fnot2	%f12,	%f14
	move	%icc,	%g1,	%o6
	fmovrsne	%g2,	%f0,	%f12
	fmovrdlez	%g4,	%f20,	%f28
	fbue,a	%fcc1,	loop_1326
	xnorcc	%o7,	0x1F83,	%i5
	xor	%l6,	0x0C87,	%g7
	flush	%l7 + 0x24
loop_1326:
	fcmpd	%fcc0,	%f30,	%f26
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x77] %asi,	%l5
	fpsub16s	%f28,	%f21,	%f28
	set	0x08, %i6
	lduba	[%l7 + %i6] 0x81,	%l2
	orcc	%i1,	%g6,	%l3
	fandnot1	%f4,	%f30,	%f4
	bn	%xcc,	loop_1327
	stbar
	ldsw	[%l7 + 0x58],	%i4
	edge32n	%l4,	%g5,	%o3
loop_1327:
	movn	%xcc,	%g3,	%o4
	sth	%l1,	[%l7 + 0x14]
	fmovrdlz	%o2,	%f18,	%f8
	tl	%xcc,	0x1
	andcc	%i6,	0x1807,	%i2
	alignaddr	%o0,	%o5,	%i3
	taddcc	%l0,	%i0,	%o1
	nop
	setx	loop_1328,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%g1,	%i7
	movleu	%icc,	%o6,	%g4
	bcc,a,pt	%xcc,	loop_1329
loop_1328:
	flush	%l7 + 0x74
	tpos	%icc,	0x0
	movcs	%icc,	%o7,	%g2
loop_1329:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l6
	edge16n	%g7,	%l5,	%i5
	movrlz	%l2,	%i1,	%l3
	andn	%g6,	0x0FF8,	%l4
	movn	%icc,	%g5,	%o3
	edge16n	%g3,	%i4,	%l1
	ldd	[%l7 + 0x40],	%f8
	ba,pn	%icc,	loop_1330
	movleu	%icc,	%o2,	%i6
	fbug	%fcc3,	loop_1331
	fmovdcc	%xcc,	%f23,	%f21
loop_1330:
	nop
	set	0x38, %g4
	sta	%f30,	[%l7 + %g4] 0x80
loop_1331:
	bleu,a,pn	%xcc,	loop_1332
	smulcc	%o4,	%i2,	%o0
	movpos	%xcc,	%i3,	%o5
	sll	%i0,	0x0C,	%l0
loop_1332:
	tg	%xcc,	0x6
	bg,a	%icc,	loop_1333
	orn	%g1,	0x02F1,	%i7
	swap	[%l7 + 0x54],	%o6
	fand	%f22,	%f30,	%f12
loop_1333:
	alignaddrl	%o1,	%o7,	%g2
	set	0x3A, %i1
	lduba	[%l7 + %i1] 0x81,	%g4
	umul	%g7,	%l6,	%l5
	fmovrdgz	%i5,	%f10,	%f28
	add	%l2,	%l3,	%g6
	sth	%i1,	[%l7 + 0x26]
	alignaddr	%g5,	%l4,	%o3
	sll	%i4,	%g3,	%o2
	tn	%xcc,	0x1
	fmovdg	%xcc,	%f7,	%f7
	tsubcc	%i6,	%o4,	%l1
	wr	%g0,	0x10,	%asi
	stha	%o0,	[%l7 + 0x40] %asi
	umul	%i2,	%o5,	%i0
	or	%i3,	0x1334,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i7,	%o6,	%o1
	movrlz	%g1,	0x17F,	%g2
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	swap	[%l7 + 0x28],	%g4
	fbule	%fcc2,	loop_1334
	ldd	[%l7 + 0x58],	%f18
	orncc	%o7,	0x1CB4,	%l6
	andcc	%g7,	0x05CE,	%l5
loop_1334:
	bvc,pt	%xcc,	loop_1335
	stx	%i5,	[%l7 + 0x20]
	movrlez	%l2,	%l3,	%i1
	sra	%g6,	%l4,	%g5
loop_1335:
	sdivcc	%o3,	0x17EE,	%i4
	fbn,a	%fcc3,	loop_1336
	addc	%o2,	%g3,	%o4
	fcmple16	%f18,	%f14,	%l1
	srl	%o0,	0x0C,	%i6
loop_1336:
	xorcc	%o5,	%i2,	%i3
	fandnot1	%f8,	%f10,	%f30
	fxors	%f1,	%f24,	%f4
	fble,a	%fcc2,	loop_1337
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i0,	0x187B,	%i7
	edge16ln	%l0,	%o1,	%o6
loop_1337:
	fbug	%fcc2,	loop_1338
	srax	%g2,	0x11,	%g4
	umul	%g1,	0x16A0,	%o7
	sll	%g7,	0x07,	%l6
loop_1338:
	fornot1s	%f0,	%f15,	%f23
	movrlez	%i5,	0x19A,	%l2
	edge16l	%l3,	%l5,	%i1
	movrlez	%g6,	0x138,	%g5
	std	%o2,	[%l7 + 0x30]
	movl	%xcc,	%l4,	%o2
	sethi	0x100C,	%i4
	umulcc	%g3,	%o4,	%o0
	edge16ln	%l1,	%o5,	%i6
	brgez,a	%i2,	loop_1339
	movvc	%xcc,	%i0,	%i7
	tsubcc	%l0,	0x13D0,	%i3
	ld	[%l7 + 0x3C],	%f7
loop_1339:
	fmovrdne	%o1,	%f16,	%f2
	fnegd	%f18,	%f0
	array8	%o6,	%g4,	%g1
	faligndata	%f16,	%f14,	%f30
	brnz,a	%g2,	loop_1340
	edge8ln	%g7,	%o7,	%l6
	bn,a	loop_1341
	andcc	%i5,	%l3,	%l2
loop_1340:
	array16	%l5,	%i1,	%g6
	stx	%g5,	[%l7 + 0x10]
loop_1341:
	tge	%icc,	0x4
	movleu	%xcc,	%o3,	%o2
	edge8	%i4,	%l4,	%g3
	edge32ln	%o4,	%o0,	%l1
	srlx	%i6,	0x1E,	%o5
	wr	%g0,	0x04,	%asi
	stda	%i0,	[%l7 + 0x60] %asi
	movgu	%xcc,	%i2,	%l0
	movre	%i7,	%o1,	%i3
	tg	%icc,	0x3
	te	%xcc,	0x1
	fmovscs	%icc,	%f6,	%f2
	alignaddrl	%g4,	%g1,	%g2
	brnz,a	%o6,	loop_1342
	fmuld8ulx16	%f3,	%f5,	%f20
	orncc	%o7,	0x143D,	%g7
	for	%f2,	%f6,	%f22
loop_1342:
	nop
	wr	%g0,	0x18,	%asi
	stwa	%l6,	[%l7 + 0x10] %asi
	ldsw	[%l7 + 0x3C],	%l3
	movvs	%xcc,	%l2,	%i5
	fmovrdgez	%i1,	%f30,	%f8
	fexpand	%f6,	%f16
	srl	%g6,	0x13,	%l5
	taddcc	%o3,	%g5,	%i4
	addccc	%o2,	%g3,	%o4
	movn	%icc,	%l4,	%o0
	movl	%icc,	%i6,	%l1
	fmovrdgez	%o5,	%f18,	%f26
	be,pn	%xcc,	loop_1343
	srlx	%i0,	0x08,	%l0
	tle	%xcc,	0x7
	fmovsa	%icc,	%f13,	%f11
loop_1343:
	bvc	loop_1344
	sdivcc	%i2,	0x0A89,	%i7
	fnot2s	%f0,	%f26
	fmovdne	%xcc,	%f31,	%f27
loop_1344:
	sir	0x17BD
	edge8l	%i3,	%o1,	%g1
	sllx	%g2,	%o6,	%o7
	movcs	%icc,	%g4,	%g7
	movleu	%xcc,	%l6,	%l2
	fbue	%fcc1,	loop_1345
	edge16	%l3,	%i1,	%i5
	movvs	%icc,	%g6,	%o3
	ldstub	[%l7 + 0x2E],	%g5
loop_1345:
	fbg,a	%fcc3,	loop_1346
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x44]
	ldx	[%l7 + 0x20],	%o2
loop_1346:
	ble,a,pn	%xcc,	loop_1347
	movcs	%xcc,	%l5,	%g3
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_1347:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x54] %asi,	%o4
	edge16n	%i6,	%o0,	%l1
	fmovrslez	%i0,	%f17,	%f3
	add	%o5,	0x1C9B,	%l0
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x10,	%f16
	udivcc	%i7,	0x167F,	%i3
	orcc	%i2,	0x0E0C,	%g1
	tcs	%xcc,	0x7
	movne	%xcc,	%o1,	%g2
	bvs,a,pn	%xcc,	loop_1348
	xorcc	%o7,	%o6,	%g7
	xnor	%g4,	0x0E90,	%l2
	edge16ln	%l6,	%l3,	%i5
loop_1348:
	fmovrdlez	%i1,	%f8,	%f4
	bneg,pt	%xcc,	loop_1349
	sllx	%g6,	%g5,	%i4
	te	%icc,	0x1
	sllx	%o2,	%l5,	%o3
loop_1349:
	sth	%l4,	[%l7 + 0x62]
	tcs	%xcc,	0x2
	alignaddr	%o4,	%g3,	%i6
	set	0x18, %o0
	stxa	%l1,	[%l7 + %o0] 0xe3
	membar	#Sync
	flush	%l7 + 0x5C
	brz,a	%o0,	loop_1350
	tle	%xcc,	0x0
	fmovsg	%xcc,	%f20,	%f6
	sethi	0x0B2C,	%o5
loop_1350:
	tleu	%icc,	0x5
	fmuld8sux16	%f20,	%f4,	%f0
	fblg	%fcc0,	loop_1351
	fmovdne	%icc,	%f16,	%f19
	movrne	%l0,	%i0,	%i7
	fmovsle	%icc,	%f19,	%f26
loop_1351:
	orn	%i2,	0x0087,	%i3
	taddcctv	%o1,	%g2,	%g1
	sdivcc	%o7,	0x0D91,	%g7
	sllx	%o6,	%l2,	%g4
	fblg,a	%fcc2,	loop_1352
	fpadd32s	%f18,	%f30,	%f22
	tsubcc	%l6,	0x1709,	%i5
	movrgz	%i1,	%g6,	%g5
loop_1352:
	tleu	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3E] %asi,	%l3
	std	%f16,	[%l7 + 0x48]
	fmul8x16al	%f10,	%f31,	%f10
	brz,a	%i4,	loop_1353
	xnor	%o2,	0x0004,	%o3
	subccc	%l4,	0x186B,	%l5
	fsrc1s	%f6,	%f5
loop_1353:
	fbue,a	%fcc1,	loop_1354
	movvs	%xcc,	%g3,	%o4
	movcc	%icc,	%i6,	%l1
	srl	%o0,	0x11,	%o5
loop_1354:
	edge32	%i0,	%i7,	%i2
	fone	%f6
	srax	%l0,	%i3,	%o1
	fnor	%f16,	%f24,	%f2
	edge16n	%g1,	%o7,	%g7
	movle	%xcc,	%o6,	%l2
	addc	%g2,	%l6,	%g4
	sir	0x18F5
	taddcctv	%i1,	%i5,	%g6
	fcmpgt16	%f18,	%f0,	%l3
	orn	%g5,	%i4,	%o3
	sllx	%l4,	%o2,	%g3
	lduw	[%l7 + 0x7C],	%l5
	pdist	%f18,	%f22,	%f0
	sdivcc	%i6,	0x1492,	%l1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x36] %asi,	%o4
	addc	%o5,	0x0F7E,	%o0
	nop
	setx	loop_1355,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovd	%f12,	%f8
	fcmpgt32	%f26,	%f26,	%i0
	bvc,a,pn	%icc,	loop_1356
loop_1355:
	fmovscs	%icc,	%f9,	%f15
	ldd	[%l7 + 0x10],	%i6
	nop
	setx	loop_1357,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1356:
	nop
	set	0x50, %l0
	lduw	[%l7 + %l0],	%i2
	xnorcc	%l0,	0x142E,	%o1
	alignaddr	%i3,	%o7,	%g7
loop_1357:
	tgu	%xcc,	0x7
	movrne	%o6,	%g1,	%g2
	edge16l	%l2,	%l6,	%i1
	fmovdneg	%xcc,	%f8,	%f28
	movge	%xcc,	%i5,	%g4
	movl	%icc,	%l3,	%g6
	addc	%i4,	0x1087,	%o3
	set	0x7C, %o3
	swapa	[%l7 + %o3] 0x88,	%g5
	movne	%icc,	%o2,	%g3
	nop
	setx loop_1358, %l0, %l1
	jmpl %l1, %l5
	nop
	setx loop_1359, %l0, %l1
	jmpl %l1, %i6
	fandnot1	%f10,	%f26,	%f10
	addccc	%l1,	%o4,	%o5
loop_1358:
	addccc	%o0,	%l4,	%i0
loop_1359:
	tleu	%icc,	0x7
	move	%xcc,	%i7,	%i2
	edge32n	%l0,	%i3,	%o1
	fornot2	%f2,	%f22,	%f14
	movle	%icc,	%o7,	%o6
	xorcc	%g7,	%g1,	%l2
	movneg	%xcc,	%g2,	%l6
	ldsb	[%l7 + 0x47],	%i5
	fble,a	%fcc2,	loop_1360
	udivcc	%g4,	0x1553,	%i1
	movl	%icc,	%g6,	%l3
	bpos,a	%xcc,	loop_1361
loop_1360:
	tle	%xcc,	0x3
	fpadd32s	%f0,	%f31,	%f8
	fbg	%fcc1,	loop_1362
loop_1361:
	fpsub16	%f14,	%f24,	%f14
	stbar
	brlez	%o3,	loop_1363
loop_1362:
	movrgez	%i4,	%o2,	%g3
	andncc	%l5,	%i6,	%g5
	movpos	%xcc,	%l1,	%o5
loop_1363:
	srlx	%o4,	%l4,	%i0
	sllx	%i7,	%o0,	%i2
	sdivcc	%i3,	0x1E0B,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o7,	0x13BA,	%o6
	fmovdgu	%icc,	%f0,	%f21
	bcc,a,pt	%icc,	loop_1364
	movne	%xcc,	%o1,	%g1
	st	%f17,	[%l7 + 0x48]
	nop
	setx	loop_1365,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1364:
	fnot1	%f0,	%f10
	and	%g7,	0x058C,	%l2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
loop_1365:
	movpos	%icc,	%l6,	%g4
	array32	%i1,	%i5,	%l3
	ldub	[%l7 + 0x6A],	%g6
	brnz,a	%i4,	loop_1366
	swap	[%l7 + 0x38],	%o3
	brgz	%g3,	loop_1367
	alignaddr	%o2,	%l5,	%i6
loop_1366:
	ld	[%l7 + 0x38],	%f20
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x04,	%l1,	%o5
loop_1367:
	alignaddr	%g5,	%l4,	%o4
	brgez	%i7,	loop_1368
	movre	%o0,	0x070,	%i0
	flush	%l7 + 0x54
	fmovd	%f18,	%f18
loop_1368:
	fbug,a	%fcc2,	loop_1369
	sir	0x0294
	edge32l	%i3,	%l0,	%i2
	ldx	[%l7 + 0x08],	%o6
loop_1369:
	ldsh	[%l7 + 0x3E],	%o1
	fbul,a	%fcc0,	loop_1370
	umul	%g1,	%o7,	%g7
	add	%l2,	0x1A37,	%g2
	edge16	%g4,	%l6,	%i5
loop_1370:
	bvs,a	%xcc,	loop_1371
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l3,	%g6,	%i4
	movle	%xcc,	%o3,	%i1
loop_1371:
	udivx	%o2,	0x14E5,	%g3
	swap	[%l7 + 0x70],	%i6
	tvs	%icc,	0x3
	popc	0x013F,	%l1
	fmovdvc	%icc,	%f8,	%f6
	movrlez	%l5,	%g5,	%o5
	movpos	%icc,	%l4,	%o4
	set	0x0C, %g6
	ldswa	[%l7 + %g6] 0x19,	%i7
	brnz,a	%o0,	loop_1372
	srax	%i3,	0x10,	%l0
	alignaddrl	%i0,	%i2,	%o1
	fble	%fcc1,	loop_1373
loop_1372:
	fmovdpos	%icc,	%f15,	%f23
	fpack32	%f26,	%f10,	%f8
	addccc	%o6,	%g1,	%g7
loop_1373:
	fabsd	%f16,	%f22
	edge16l	%o7,	%g2,	%l2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%l6
	membar	0x6C
	tl	%xcc,	0x4
	nop
	set	0x18, %i7
	std	%f16,	[%l7 + %i7]
	sll	%l3,	%i5,	%i4
	set	0x0C, %l3
	stwa	%o3,	[%l7 + %l3] 0x15
	bneg,a	%icc,	loop_1374
	movcc	%xcc,	%g6,	%o2
	ldx	[%l7 + 0x40],	%i1
	movge	%xcc,	%g3,	%i6
loop_1374:
	bneg,a	%xcc,	loop_1375
	fcmple16	%f4,	%f22,	%l5
	array32	%l1,	%g5,	%o5
	umulcc	%l4,	%o4,	%o0
loop_1375:
	fmovsne	%xcc,	%f15,	%f28
	sdiv	%i3,	0x0B30,	%l0
	edge32n	%i0,	%i7,	%i2
	ldsh	[%l7 + 0x40],	%o1
	fbue	%fcc3,	loop_1376
	movgu	%xcc,	%g1,	%o6
	andcc	%o7,	%g7,	%g2
	udivx	%g4,	0x039B,	%l6
loop_1376:
	fmovdvs	%xcc,	%f23,	%f29
	tsubcc	%l2,	%i5,	%i4
	fandnot2	%f26,	%f16,	%f12
	tneg	%icc,	0x2
	fmovde	%icc,	%f6,	%f12
	udivx	%l3,	0x07F6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o2,	%f28,	%f3
	movcc	%xcc,	%g6,	%g3
	fpadd16	%f26,	%f6,	%f14
	fbule,a	%fcc2,	loop_1377
	addc	%i6,	0x1593,	%l5
	fmovdneg	%icc,	%f8,	%f20
	fandnot1s	%f2,	%f26,	%f22
loop_1377:
	xorcc	%i1,	%g5,	%o5
	fmul8x16	%f7,	%f0,	%f0
	edge16n	%l1,	%l4,	%o4
	fsrc1s	%f26,	%f17
	movcs	%xcc,	%i3,	%o0
	fbuge	%fcc3,	loop_1378
	and	%i0,	%i7,	%i2
	movle	%xcc,	%l0,	%g1
	movgu	%xcc,	%o6,	%o7
loop_1378:
	fmovdleu	%xcc,	%f2,	%f20
	bcc,a	%icc,	loop_1379
	edge16ln	%o1,	%g2,	%g7
	fmovdl	%xcc,	%f23,	%f24
	fmuld8ulx16	%f21,	%f18,	%f30
loop_1379:
	movrne	%g4,	%l6,	%l2
	movle	%icc,	%i5,	%l3
	sra	%o3,	0x05,	%i4
	movle	%xcc,	%g6,	%g3
	bleu	%xcc,	loop_1380
	tsubcc	%i6,	0x11B5,	%o2
	sdivcc	%l5,	0x0975,	%g5
	tpos	%xcc,	0x6
loop_1380:
	movn	%xcc,	%o5,	%i1
	movgu	%icc,	%l4,	%o4
	alignaddrl	%l1,	%i3,	%i0
	pdist	%f26,	%f4,	%f2
	fmovse	%xcc,	%f8,	%f0
	set	0x65, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i7
	fmovdge	%xcc,	%f3,	%f0
	sdivx	%i2,	0x0110,	%l0
	fpadd16s	%f11,	%f8,	%f30
	brgez,a	%o0,	loop_1381
	xnor	%g1,	%o6,	%o1
	udivx	%o7,	0x170A,	%g7
	movgu	%xcc,	%g4,	%l6
loop_1381:
	nop
	set	0x38, %g7
	stxa	%g2,	[%l7 + %g7] 0x10
	fble	%fcc1,	loop_1382
	subcc	%l2,	%i5,	%l3
	fmuld8ulx16	%f5,	%f6,	%f4
	set	0x22, %o7
	lduha	[%l7 + %o7] 0x14,	%o3
loop_1382:
	bgu,pt	%icc,	loop_1383
	subcc	%i4,	%g3,	%i6
	xnorcc	%o2,	0x0392,	%g6
	popc	0x1037,	%g5
loop_1383:
	bge,pn	%icc,	loop_1384
	edge16l	%o5,	%i1,	%l5
	fbne,a	%fcc0,	loop_1385
	fmovsvc	%xcc,	%f12,	%f7
loop_1384:
	edge8l	%l4,	%o4,	%l1
	te	%xcc,	0x7
loop_1385:
	taddcc	%i3,	%i0,	%i7
	movn	%xcc,	%i2,	%l0
	udiv	%o0,	0x15BE,	%g1
	edge16	%o6,	%o7,	%o1
	movn	%xcc,	%g4,	%l6
	fbul,a	%fcc1,	loop_1386
	edge32	%g7,	%l2,	%g2
	popc	%l3,	%o3
	and	%i5,	%i4,	%g3
loop_1386:
	movcs	%xcc,	%i6,	%g6
	srl	%o2,	%g5,	%i1
	fbu	%fcc3,	loop_1387
	tsubcc	%o5,	0x0BBF,	%l4
	sdiv	%o4,	0x1E55,	%l5
	sub	%l1,	0x1438,	%i0
loop_1387:
	movl	%xcc,	%i3,	%i7
	tcs	%icc,	0x3
	tvc	%icc,	0x1
	for	%f28,	%f28,	%f14
	fmovsvs	%icc,	%f20,	%f7
	fcmpgt16	%f26,	%f8,	%l0
	udiv	%i2,	0x1301,	%g1
	fmul8sux16	%f10,	%f18,	%f2
	bg,a,pt	%xcc,	loop_1388
	movrgez	%o6,	%o0,	%o7
	sra	%o1,	0x0F,	%g4
	movl	%xcc,	%l6,	%l2
loop_1388:
	nop
	wr	%g0,	0x27,	%asi
	stha	%g7,	[%l7 + 0x0E] %asi
	membar	#Sync
	movcs	%xcc,	%g2,	%l3
	bvc,a	loop_1389
	fbge,a	%fcc2,	loop_1390
	edge32l	%i5,	%i4,	%g3
	alignaddr	%i6,	%o3,	%g6
loop_1389:
	nop
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g5
loop_1390:
	xnorcc	%i1,	0x0565,	%o5
	te	%icc,	0x3
	movrne	%l4,	0x310,	%o4
	subc	%l5,	0x0AB1,	%l1
	fmovdvc	%icc,	%f0,	%f10
	brgez	%i0,	loop_1391
	edge32l	%i3,	%i7,	%l0
	fmovdgu	%xcc,	%f14,	%f25
	mulscc	%i2,	%g1,	%o2
loop_1391:
	nop
	wr	%g0,	0x80,	%asi
	stda	%o0,	[%l7 + 0x30] %asi
	subccc	%o6,	%o7,	%g4
	tne	%xcc,	0x0
	edge16n	%o1,	%l2,	%g7
	tsubcc	%l6,	%l3,	%g2
	fnands	%f21,	%f11,	%f15
	bneg,pn	%xcc,	loop_1392
	fpsub16	%f22,	%f20,	%f14
	tgu	%icc,	0x3
	movn	%xcc,	%i4,	%i5
loop_1392:
	nop
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x0c,	 0x1
	fble,a	%fcc1,	loop_1393
	mulx	%i6,	%o3,	%g5
	tvc	%icc,	0x6
	udiv	%g6,	0x1A9F,	%i1
loop_1393:
	fblg	%fcc2,	loop_1394
	fone	%f10
	fblg	%fcc3,	loop_1395
	edge32ln	%l4,	%o5,	%l5
loop_1394:
	movneg	%xcc,	%o4,	%i0
	fpackfix	%f10,	%f29
loop_1395:
	nop
	setx	loop_1396,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%i3,	0x13B4,	%l1
	fcmple16	%f24,	%f6,	%l0
	ta	%xcc,	0x7
loop_1396:
	nop
	set	0x6C, %i5
	stha	%i2,	[%l7 + %i5] 0xe2
	membar	#Sync
	add	%g1,	%i7,	%o0
	fornot1s	%f21,	%f30,	%f27
	umulcc	%o6,	0x14D8,	%o7
	brlz,a	%g4,	loop_1397
	edge16ln	%o2,	%l2,	%g7
	edge32ln	%l6,	%o1,	%l3
	movgu	%xcc,	%g2,	%i4
loop_1397:
	stb	%i5,	[%l7 + 0x39]
	bge,pt	%xcc,	loop_1398
	movrgez	%g3,	%o3,	%g5
	array32	%g6,	%i1,	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%i6
loop_1398:
	sub	%l5,	0x0144,	%i0
	addccc	%o4,	0x1848,	%l1
	fmovrse	%i3,	%f2,	%f9
	edge16l	%i2,	%l0,	%g1
	orn	%o0,	%i7,	%o7
	fmovrsgez	%o6,	%f8,	%f27
	fbne,a	%fcc3,	loop_1399
	array16	%o2,	%l2,	%g7
	edge8	%l6,	%g4,	%l3
	fpack16	%f12,	%f22
loop_1399:
	sdiv	%g2,	0x0236,	%o1
	fmovrsgez	%i4,	%f6,	%f8
	or	%i5,	0x0399,	%o3
	add	%g5,	0x1E53,	%g3
	fmul8x16al	%f9,	%f26,	%f18
	fnand	%f16,	%f30,	%f20
	xor	%g6,	%l4,	%o5
	movleu	%icc,	%i1,	%i6
	xorcc	%l5,	0x091E,	%o4
	nop
	set	0x75, %l5
	ldsb	[%l7 + %l5],	%l1
	fcmpeq32	%f0,	%f28,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i2,	%l0,	%i3
	movrlz	%g1,	%o0,	%o7
	brlez,a	%o6,	loop_1400
	add	%i7,	0x0E18,	%l2
	alignaddrl	%g7,	%l6,	%g4
	bneg,a	loop_1401
loop_1400:
	xor	%l3,	%g2,	%o2
	alignaddrl	%i4,	%o1,	%i5
	stbar
loop_1401:
	umul	%o3,	%g3,	%g6
	tcc	%xcc,	0x5
	set	0x58, %o6
	stda	%g4,	[%l7 + %o6] 0x0c
	tsubcctv	%l4,	%o5,	%i6
	edge32l	%l5,	%i1,	%o4
	movrlez	%i0,	%l1,	%i2
	movne	%icc,	%l0,	%g1
	ldub	[%l7 + 0x47],	%i3
	udivx	%o7,	0x1722,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x6
	fbuge,a	%fcc0,	loop_1402
	sub	%o6,	%i7,	%l2
	fmovrsgz	%g7,	%f18,	%f2
	xnorcc	%g4,	0x0270,	%l3
loop_1402:
	fmovdcc	%icc,	%f12,	%f0
	and	%l6,	0x1B75,	%g2
	fbe	%fcc2,	loop_1403
	movpos	%xcc,	%i4,	%o1
	movre	%o2,	0x00D,	%o3
	movle	%icc,	%i5,	%g6
loop_1403:
	subccc	%g5,	0x1007,	%g3
	umulcc	%o5,	%l4,	%l5
	fmovrslez	%i6,	%f29,	%f22
	sdivx	%o4,	0x18C0,	%i1
	move	%xcc,	%l1,	%i2
	movpos	%icc,	%i0,	%l0
	sra	%i3,	0x0C,	%o7
	edge32n	%o0,	%g1,	%o6
	fcmpd	%fcc0,	%f16,	%f24
	subccc	%i7,	%l2,	%g7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x40] %asi,	%f0
	fmovscs	%icc,	%f12,	%f27
	tcs	%icc,	0x1
	alignaddr	%g4,	%l3,	%l6
	movrgez	%i4,	0x1A4,	%g2
	tsubcctv	%o2,	%o3,	%i5
	xnor	%g6,	%g5,	%o1
	fnor	%f26,	%f22,	%f10
	tvs	%xcc,	0x1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o5,	%l4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	fmovrsgez	%i6,	%f7,	%f28
	te	%xcc,	0x3
	fmovsne	%xcc,	%f2,	%f14
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x19,	%g2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i1
	tge	%icc,	0x4
	move	%xcc,	%l1,	%o4
	fmul8x16au	%f7,	%f2,	%f8
	srlx	%i2,	%i0,	%i3
	faligndata	%f6,	%f14,	%f14
	lduh	[%l7 + 0x12],	%l0
	movcs	%xcc,	%o7,	%o0
	srax	%o6,	0x04,	%g1
	edge32n	%l2,	%i7,	%g4
	movl	%xcc,	%g7,	%l3
	fbue	%fcc0,	loop_1404
	movrlz	%i4,	0x26B,	%l6
	te	%icc,	0x5
	udiv	%g2,	0x0A0C,	%o3
loop_1404:
	edge16ln	%o2,	%i5,	%g6
	sir	0x1805
	orncc	%o1,	%o5,	%l4
	movleu	%icc,	%l5,	%g5
	and	%i6,	%g3,	%l1
	movle	%icc,	%i1,	%o4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i0
	alignaddr	%i3,	%l0,	%o7
	fxnors	%f24,	%f9,	%f4
	edge16n	%o0,	%i2,	%g1
	edge32n	%o6,	%i7,	%g4
	fsrc1s	%f1,	%f4
	tn	%icc,	0x3
	fbu,a	%fcc3,	loop_1405
	edge8n	%g7,	%l3,	%l2
	set	0x78, %g1
	swapa	[%l7 + %g1] 0x0c,	%i4
loop_1405:
	tvc	%icc,	0x1
	fbl	%fcc0,	loop_1406
	te	%xcc,	0x5
	ldsw	[%l7 + 0x6C],	%l6
	addcc	%g2,	0x00F4,	%o2
loop_1406:
	bg,a,pn	%icc,	loop_1407
	nop
	setx	loop_1408,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%i5,	%o3,	%g6
	orcc	%o1,	%l4,	%o5
loop_1407:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f23,	[%l7 + 0x6C] %asi
loop_1408:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x3C] %asi,	%l5
	srl	%i6,	%g3,	%g5
	movleu	%xcc,	%l1,	%i1
	sub	%o4,	0x0DB1,	%i3
	edge32l	%i0,	%o7,	%l0
	bne	%icc,	loop_1409
	subcc	%i2,	%g1,	%o6
	bcs,a,pn	%icc,	loop_1410
	sethi	0x1FAD,	%o0
loop_1409:
	array32	%g4,	%i7,	%l3
	brlez	%g7,	loop_1411
loop_1410:
	addcc	%i4,	%l2,	%l6
	fnegd	%f14,	%f18
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%g2
loop_1411:
	fmovsn	%icc,	%f22,	%f24
	fornot1	%f0,	%f26,	%f0
	xor	%i5,	0x1893,	%o2
	or	%g6,	0x0229,	%o3
	stb	%l4,	[%l7 + 0x1A]
	umul	%o5,	0x0BEF,	%l5
	fcmpd	%fcc0,	%f18,	%f16
	edge8	%o1,	%i6,	%g3
	fmovrslz	%l1,	%f5,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g5,	0x075A,	%o4
	fmovsvs	%icc,	%f24,	%f29
	sll	%i3,	%i1,	%i0
	fpsub16	%f14,	%f2,	%f30
	bneg	%xcc,	loop_1412
	fcmpgt32	%f24,	%f24,	%l0
	fnot1s	%f19,	%f22
	tcs	%icc,	0x7
loop_1412:
	movle	%icc,	%o7,	%g1
	xor	%o6,	%o0,	%g4
	tle	%icc,	0x6
	andncc	%i2,	%i7,	%g7
	tsubcctv	%i4,	0x1A14,	%l2
	fsrc2s	%f11,	%f21
	edge8ln	%l3,	%l6,	%g2
	add	%i5,	0x09CA,	%g6
	movn	%xcc,	%o2,	%o3
	andn	%l4,	%l5,	%o1
	nop
	setx	loop_1413,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%xcc,	0x5
	or	%i6,	0x032A,	%o5
	edge32l	%l1,	%g5,	%g3
loop_1413:
	movcc	%icc,	%i3,	%i1
	fmovdcs	%xcc,	%f8,	%f6
	brnz,a	%o4,	loop_1414
	andcc	%i0,	%o7,	%g1
	mulscc	%o6,	0x0A7E,	%o0
	srax	%l0,	0x05,	%g4
loop_1414:
	fmul8ulx16	%f26,	%f16,	%f24
	subcc	%i2,	0x00D1,	%i7
	xorcc	%i4,	%g7,	%l2
	fzeros	%f21
	tn	%xcc,	0x7
	movg	%xcc,	%l6,	%g2
	swap	[%l7 + 0x5C],	%i5
	set	0x58, %g5
	swapa	[%l7 + %g5] 0x18,	%g6
	brz,a	%l3,	loop_1415
	bpos,a	%xcc,	loop_1416
	movgu	%xcc,	%o2,	%o3
	edge8ln	%l5,	%o1,	%l4
loop_1415:
	brlez	%i6,	loop_1417
loop_1416:
	bleu	%icc,	loop_1418
	umul	%o5,	%l1,	%g3
	fmovse	%xcc,	%f20,	%f7
loop_1417:
	brz,a	%g5,	loop_1419
loop_1418:
	siam	0x2
	ldd	[%l7 + 0x58],	%i2
	be,pt	%icc,	loop_1420
loop_1419:
	andn	%o4,	0x094C,	%i1
	bvs,pt	%xcc,	loop_1421
	tne	%icc,	0x5
loop_1420:
	fmovsvs	%xcc,	%f15,	%f7
	sdivx	%o7,	0x0978,	%g1
loop_1421:
	movrgz	%o6,	0x2CF,	%o0
	alignaddrl	%i0,	%l0,	%i2
	fsrc1	%f2,	%f8
	tne	%xcc,	0x4
	fbue,a	%fcc1,	loop_1422
	fmovda	%icc,	%f10,	%f31
	fsrc2s	%f4,	%f4
	fnand	%f20,	%f30,	%f20
loop_1422:
	edge32	%i7,	%i4,	%g7
	movcc	%xcc,	%g4,	%l6
	movpos	%xcc,	%g2,	%l2
	std	%f14,	[%l7 + 0x70]
	movrgez	%g6,	%i5,	%l3
	sll	%o3,	0x06,	%o2
	nop
	setx	loop_1423,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%o1,	%l4,	%i6
	or	%o5,	%l5,	%g3
	fbl,a	%fcc2,	loop_1424
loop_1423:
	tne	%icc,	0x1
	bcc,a,pt	%xcc,	loop_1425
	edge32l	%g5,	%i3,	%o4
loop_1424:
	tge	%xcc,	0x1
	movge	%icc,	%i1,	%o7
loop_1425:
	stbar
	tl	%icc,	0x7
	fpmerge	%f5,	%f17,	%f2
	bleu,a	loop_1426
	tge	%xcc,	0x4
	fmovdvc	%xcc,	%f2,	%f19
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x88,	%g1
loop_1426:
	tsubcc	%o6,	%o0,	%l1
	brz,a	%i0,	loop_1427
	ld	[%l7 + 0x1C],	%f20
	taddcc	%i2,	0x017E,	%i7
	nop
	setx loop_1428, %l0, %l1
	jmpl %l1, %l0
loop_1427:
	fmovrdgz	%i4,	%f28,	%f22
	movrgz	%g7,	%g4,	%l6
	mova	%icc,	%l2,	%g6
loop_1428:
	edge16	%g2,	%i5,	%l3
	movvc	%xcc,	%o3,	%o2
	bne,a,pt	%icc,	loop_1429
	ld	[%l7 + 0x4C],	%f21
	tne	%icc,	0x4
	sub	%l4,	%o1,	%i6
loop_1429:
	bcc,pn	%xcc,	loop_1430
	movne	%icc,	%l5,	%o5
	xnor	%g3,	0x010F,	%i3
	nop
	set	0x64, %l6
	stw	%o4,	[%l7 + %l6]
loop_1430:
	edge16ln	%g5,	%i1,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc3,	loop_1431
	sethi	0x1DA7,	%o7
	fbug	%fcc2,	loop_1432
	edge8ln	%o6,	%o0,	%l1
loop_1431:
	srl	%i2,	%i0,	%l0
	movne	%icc,	%i4,	%g7
loop_1432:
	movgu	%xcc,	%i7,	%g4
	movre	%l2,	%g6,	%l6
	edge8l	%g2,	%l3,	%i5
	movl	%xcc,	%o2,	%o3
	fzeros	%f27
	tvc	%xcc,	0x4
	edge8	%l4,	%i6,	%l5
	bg,pt	%icc,	loop_1433
	edge16ln	%o1,	%o5,	%i3
	std	%f0,	[%l7 + 0x20]
	flush	%l7 + 0x60
loop_1433:
	movvs	%icc,	%o4,	%g3
	fpack32	%f14,	%f10,	%f30
	edge8l	%g5,	%i1,	%g1
	bge,pn	%icc,	loop_1434
	orcc	%o7,	0x0E1F,	%o6
	and	%l1,	%i2,	%o0
	edge32	%l0,	%i0,	%g7
loop_1434:
	orn	%i4,	0x1821,	%g4
	fpadd16	%f20,	%f20,	%f14
	edge8n	%i7,	%l2,	%l6
	ldub	[%l7 + 0x6C],	%g6
	orn	%l3,	%g2,	%o2
	edge32ln	%o3,	%i5,	%i6
	popc	0x125B,	%l5
	movne	%xcc,	%o1,	%o5
	bneg,a,pt	%xcc,	loop_1435
	subcc	%l4,	0x098D,	%i3
	std	%g2,	[%l7 + 0x48]
	addccc	%g5,	%o4,	%i1
loop_1435:
	tneg	%icc,	0x0
	alignaddr	%o7,	%o6,	%g1
	movne	%xcc,	%i2,	%o0
	orcc	%l0,	0x079C,	%i0
	fmovsle	%icc,	%f29,	%f10
	set	0x160, %o4
	nop 	! 	stxa	%l1,	[%g0 + %o4] 0x40 ripped by fixASI40.pl
	sir	0x1554
	movcs	%xcc,	%g7,	%g4
	ldsb	[%l7 + 0x4E],	%i4
	movrne	%l2,	%l6,	%i7
	set	0x46, %o1
	stha	%g6,	[%l7 + %o1] 0x2a
	membar	#Sync
	sra	%l3,	0x16,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f15,	%f24
	alignaddr	%o3,	%g2,	%i6
	fmovrdgz	%i5,	%f10,	%f28
	umulcc	%l5,	%o5,	%o1
	tleu	%icc,	0x6
	smul	%l4,	%g3,	%i3
	tpos	%icc,	0x6
	fbl,a	%fcc0,	loop_1436
	fcmpeq32	%f8,	%f6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x58, %o2
	stda	%i0,	[%l7 + %o2] 0x2a
	membar	#Sync
loop_1436:
	tl	%xcc,	0x2
	udivx	%g5,	0x0141,	%o6
	array8	%g1,	%o7,	%o0
	edge16l	%i2,	%l0,	%l1
	fnors	%f24,	%f9,	%f8
	fbne	%fcc2,	loop_1437
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc1,	loop_1438
	fpsub16	%f22,	%f4,	%f16
loop_1437:
	nop
	set	0x40, %g3
	lduwa	[%l7 + %g3] 0x11,	%i0
loop_1438:
	move	%xcc,	%g4,	%g7
	fmul8x16au	%f0,	%f19,	%f6
	array8	%i4,	%l2,	%i7
	bn,pt	%icc,	loop_1439
	movrlz	%l6,	0x134,	%g6
	movne	%icc,	%o2,	%l3
	movvs	%icc,	%g2,	%i6
loop_1439:
	fmovscs	%icc,	%f2,	%f30
	fbl,a	%fcc0,	loop_1440
	stb	%i5,	[%l7 + 0x7A]
	fmovrsgez	%o3,	%f15,	%f16
	ldd	[%l7 + 0x18],	%l4
loop_1440:
	fnands	%f7,	%f21,	%f0
	fmovrdgz	%o1,	%f28,	%f0
	fcmpes	%fcc1,	%f12,	%f7
	edge32n	%o5,	%l4,	%i3
	movre	%o4,	%g3,	%i1
	tvc	%xcc,	0x1
	fornot2	%f8,	%f10,	%f2
	bgu,pt	%icc,	loop_1441
	fmovrdlz	%g5,	%f18,	%f30
	sdivcc	%o6,	0x04A2,	%o7
	srl	%g1,	%o0,	%i2
loop_1441:
	nop
	set	0x2C, %o5
	lduha	[%l7 + %o5] 0x11,	%l0
	udivx	%i0,	0x0A26,	%g4
	fcmpeq32	%f26,	%f22,	%l1
	fmovdle	%xcc,	%f0,	%f18
	mulscc	%i4,	%g7,	%i7
	alignaddrl	%l6,	%l2,	%g6
	fnot1s	%f3,	%f19
	tge	%icc,	0x2
	fmovrslz	%l3,	%f26,	%f19
	movge	%icc,	%o2,	%g2
	addc	%i6,	%i5,	%l5
	tcs	%xcc,	0x4
	movcs	%icc,	%o1,	%o5
	fnegd	%f16,	%f2
	array32	%l4,	%o3,	%o4
	movpos	%xcc,	%g3,	%i3
	bgu,a,pn	%xcc,	loop_1442
	fmovrslz	%i1,	%f4,	%f24
	bge	loop_1443
	tneg	%xcc,	0x2
loop_1442:
	edge16	%o6,	%g5,	%o7
	fsrc2	%f8,	%f24
loop_1443:
	sir	0x08F0
	add	%o0,	0x17A2,	%g1
	set	0x48, %i0
	stda	%i2,	[%l7 + %i0] 0x11
	stb	%i0,	[%l7 + 0x08]
	movl	%icc,	%g4,	%l0
	ta	%icc,	0x0
	umulcc	%i4,	0x16B6,	%l1
	nop
	setx	loop_1444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	st	%f21,	[%l7 + 0x2C]
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x10,	%i6
loop_1444:
	fpsub32	%f26,	%f8,	%f6
	udivx	%g7,	0x014A,	%l2
	wr	%g0,	0x27,	%asi
	stwa	%l6,	[%l7 + 0x70] %asi
	membar	#Sync
	edge8ln	%g6,	%l3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o2,	%i6,	%l5
	alignaddr	%i5,	%o5,	%o1
	srl	%l4,	0x09,	%o3
	subc	%o4,	%g3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc1,	loop_1445
	movgu	%icc,	%i3,	%o6
	subccc	%g5,	%o7,	%o0
	sub	%g1,	0x04BF,	%i2
loop_1445:
	srl	%i0,	%l0,	%i4
	fmovsa	%icc,	%f28,	%f13
	fbge	%fcc1,	loop_1446
	tn	%icc,	0x6
	movleu	%xcc,	%g4,	%i7
	ld	[%l7 + 0x10],	%f24
loop_1446:
	taddcc	%g7,	0x18D4,	%l1
	fandnot1s	%f2,	%f6,	%f14
	addcc	%l6,	%g6,	%l3
	stx	%g2,	[%l7 + 0x20]
	fmovse	%xcc,	%f8,	%f20
	orn	%o2,	0x1619,	%i6
	brlz	%l5,	loop_1447
	sra	%l2,	0x06,	%i5
	smul	%o1,	%l4,	%o3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%g3
loop_1447:
	fmovsvc	%icc,	%f31,	%f24
	orncc	%i1,	0x021A,	%o5
	sdivcc	%i3,	0x01A4,	%o6
	fmovsa	%xcc,	%f12,	%f15
	ba,pn	%icc,	loop_1448
	tvc	%icc,	0x3
	fbe	%fcc2,	loop_1449
	nop
	setx	loop_1450,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1448:
	taddcc	%g5,	0x1902,	%o7
	fmovdne	%icc,	%f13,	%f3
loop_1449:
	nop
	setx	loop_1451,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1450:
	fmul8x16	%f10,	%f24,	%f2
	fpadd16	%f26,	%f6,	%f6
	fmovdneg	%icc,	%f17,	%f10
loop_1451:
	fnot2s	%f20,	%f4
	sethi	0x1875,	%o0
	tsubcctv	%i2,	0x0131,	%g1
	wr	%g0,	0xea,	%asi
	stba	%l0,	[%l7 + 0x2F] %asi
	membar	#Sync
	movg	%xcc,	%i4,	%g4
	brz	%i7,	loop_1452
	fbule,a	%fcc1,	loop_1453
	lduh	[%l7 + 0x0A],	%g7
	movneg	%xcc,	%i0,	%l1
loop_1452:
	fzero	%f18
loop_1453:
	movrgez	%l6,	%l3,	%g6
	tvs	%icc,	0x0
	set	0x0C, %i6
	stwa	%g2,	[%l7 + %i6] 0x18
	fcmpeq16	%f10,	%f20,	%o2
	brnz,a	%i6,	loop_1454
	movvc	%icc,	%l2,	%i5
	fcmped	%fcc0,	%f6,	%f6
	orcc	%o1,	%l5,	%o3
loop_1454:
	fmovdpos	%icc,	%f0,	%f9
	edge16n	%l4,	%o4,	%g3
	fbule,a	%fcc1,	loop_1455
	fblg	%fcc0,	loop_1456
	fcmple32	%f8,	%f10,	%i1
	lduh	[%l7 + 0x18],	%o5
loop_1455:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x1C] %asi,	%i3
loop_1456:
	edge16l	%o6,	%g5,	%o0
	array8	%i2,	%o7,	%l0
	ta	%xcc,	0x2
	xorcc	%g1,	0x0CB1,	%i4
	membar	0x62
	tgu	%icc,	0x3
	nop
	setx	loop_1457,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x68],	%i7
	tcc	%xcc,	0x1
	fmovsle	%xcc,	%f31,	%f30
loop_1457:
	fornot2s	%f22,	%f21,	%f29
	umul	%g4,	0x1780,	%g7
	movcs	%xcc,	%l1,	%i0
	bneg,a	%xcc,	loop_1458
	edge32n	%l6,	%l3,	%g6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g2
loop_1458:
	xnor	%i6,	0x067C,	%o2
	ldsw	[%l7 + 0x38],	%l2
	tcs	%icc,	0x2
	andcc	%o1,	0x17E6,	%l5
	movneg	%xcc,	%i5,	%o3
	bvc,a,pt	%icc,	loop_1459
	sllx	%o4,	0x0D,	%g3
	fmovdge	%xcc,	%f2,	%f4
	fones	%f2
loop_1459:
	bg,pn	%xcc,	loop_1460
	fabss	%f21,	%f22
	edge32ln	%i1,	%l4,	%o5
	bcs,pn	%xcc,	loop_1461
loop_1460:
	brgz	%i3,	loop_1462
	std	%o6,	[%l7 + 0x10]
	fmovdcc	%xcc,	%f31,	%f28
loop_1461:
	xor	%g5,	0x024D,	%i2
loop_1462:
	nop
	wr	%g0,	0x22,	%asi
	stda	%o0,	[%l7 + 0x70] %asi
	membar	#Sync
	fors	%f18,	%f21,	%f18
	tvc	%xcc,	0x5
	sll	%o7,	0x0A,	%l0
	bvc,a	%icc,	loop_1463
	udiv	%i4,	0x1209,	%i7
	siam	0x6
	edge8ln	%g1,	%g7,	%l1
loop_1463:
	tsubcc	%i0,	%g4,	%l6
	movg	%xcc,	%g6,	%g2
	ldsw	[%l7 + 0x08],	%l3
	nop
	setx loop_1464, %l0, %l1
	jmpl %l1, %o2
	fba,a	%fcc0,	loop_1465
	alignaddr	%i6,	%l2,	%l5
	smulcc	%i5,	0x07D5,	%o1
loop_1464:
	fcmpne32	%f6,	%f24,	%o3
loop_1465:
	sdivx	%g3,	0x0F4D,	%o4
	subccc	%i1,	%l4,	%i3
	membar	0x08
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%o6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x46] %asi,	%g5
	fble,a	%fcc3,	loop_1466
	ldx	[%l7 + 0x58],	%i2
	fmovda	%xcc,	%f3,	%f17
	subcc	%o0,	0x189A,	%o5
loop_1466:
	movneg	%icc,	%l0,	%o7
	brz	%i7,	loop_1467
	fbuge	%fcc2,	loop_1468
	fpmerge	%f4,	%f13,	%f26
	fmovrsgez	%g1,	%f29,	%f29
loop_1467:
	fmovdgu	%icc,	%f1,	%f10
loop_1468:
	fmovsg	%icc,	%f9,	%f20
	popc	%g7,	%i4
	mova	%xcc,	%i0,	%l1
	movgu	%xcc,	%l6,	%g6
	fmovs	%f27,	%f17
	tneg	%icc,	0x6
	movg	%xcc,	%g4,	%g2
	fmovdl	%xcc,	%f25,	%f23
	movl	%icc,	%l3,	%o2
	smul	%l2,	0x1061,	%l5
	movvc	%xcc,	%i5,	%o1
	fmovdle	%icc,	%f5,	%f16
	movre	%o3,	0x08D,	%g3
	srax	%i6,	%o4,	%l4
	umul	%i3,	0x00E9,	%o6
	set	0x76, %i3
	ldstuba	[%l7 + %i3] 0x0c,	%g5
	subccc	%i1,	%i2,	%o0
	fnors	%f0,	%f25,	%f28
	umul	%o5,	%l0,	%o7
	sllx	%g1,	%i7,	%i4
	array8	%g7,	%l1,	%i0
	fcmpgt32	%f2,	%f16,	%l6
	andncc	%g4,	%g2,	%l3
	te	%icc,	0x3
	alignaddrl	%g6,	%o2,	%l2
	set	0x3C, %i1
	swapa	[%l7 + %i1] 0x88,	%l5
	srax	%i5,	0x1A,	%o1
	movle	%xcc,	%g3,	%o3
	brz,a	%i6,	loop_1469
	movcs	%icc,	%o4,	%l4
	set	0x66, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i3
loop_1469:
	nop
	set	0x46, %o0
	sth	%o6,	[%l7 + %o0]
	bne,a,pt	%icc,	loop_1470
	sdivx	%i1,	0x0F53,	%g5
	mova	%icc,	%i2,	%o0
	udivcc	%o5,	0x1BE5,	%o7
loop_1470:
	movleu	%xcc,	%l0,	%i7
	movrne	%g1,	%i4,	%g7
	brlz,a	%l1,	loop_1471
	tsubcc	%l6,	0x1B6A,	%g4
	movrne	%g2,	%l3,	%i0
	fmovdleu	%icc,	%f21,	%f31
loop_1471:
	addcc	%o2,	0x0E31,	%g6
	subccc	%l2,	0x0476,	%l5
	srlx	%i5,	%g3,	%o1
	fmovs	%f23,	%f28
	addcc	%i6,	0x0372,	%o4
	fsrc1s	%f4,	%f1
	fmovrdgez	%o3,	%f14,	%f10
	tsubcc	%l4,	0x19C0,	%i3
	movrgez	%o6,	%i1,	%i2
	taddcc	%o0,	%g5,	%o7
	fmovsge	%icc,	%f0,	%f21
	st	%f6,	[%l7 + 0x0C]
	fmovsneg	%icc,	%f19,	%f31
	movrlz	%o5,	0x1C1,	%l0
	bgu	loop_1472
	edge32	%g1,	%i4,	%g7
	mova	%xcc,	%i7,	%l6
	call	loop_1473
loop_1472:
	ldx	[%l7 + 0x58],	%l1
	fbl,a	%fcc1,	loop_1474
	lduh	[%l7 + 0x66],	%g4
loop_1473:
	fmovdle	%icc,	%f13,	%f21
	tleu	%xcc,	0x7
loop_1474:
	stb	%l3,	[%l7 + 0x6A]
	udivx	%g2,	0x0FA4,	%o2
	edge8	%i0,	%l2,	%l5
	movgu	%icc,	%i5,	%g3
	st	%f5,	[%l7 + 0x6C]
	mulx	%o1,	%g6,	%i6
	sethi	0x0F9C,	%o4
	smulcc	%o3,	%i3,	%l4
	popc	%i1,	%o6
	tle	%icc,	0x5
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x0c,	%i2
	fmovsvc	%xcc,	%f3,	%f12
	srlx	%o0,	0x0B,	%g5
	orn	%o7,	0x0E04,	%o5
	sdivcc	%g1,	0x1E03,	%l0
	xnor	%g7,	%i7,	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l6,	%g4
	fbu,a	%fcc1,	loop_1475
	fmovdcs	%xcc,	%f14,	%f12
	fpsub32	%f12,	%f28,	%f20
	mulx	%l1,	%l3,	%o2
loop_1475:
	movrne	%i0,	0x269,	%g2
	tl	%xcc,	0x7
	alignaddrl	%l5,	%l2,	%g3
	fbn,a	%fcc2,	loop_1476
	tne	%xcc,	0x5
	set	0x70, %l0
	lda	[%l7 + %l0] 0x18,	%f18
loop_1476:
	edge32ln	%o1,	%i5,	%i6
	fpadd16s	%f5,	%f20,	%f8
	brz	%g6,	loop_1477
	fmovdcc	%xcc,	%f22,	%f14
	edge32ln	%o3,	%i3,	%o4
	fmovsle	%icc,	%f20,	%f25
loop_1477:
	brgez	%l4,	loop_1478
	fmovde	%icc,	%f30,	%f16
	addc	%o6,	0x1499,	%i1
	tle	%xcc,	0x1
loop_1478:
	orncc	%i2,	%o0,	%o7
	xnorcc	%g5,	%o5,	%l0
	fxors	%f19,	%f31,	%f12
	nop
	set	0x3C, %g6
	stb	%g1,	[%l7 + %g6]
	fornot2s	%f17,	%f15,	%f17
	add	%g7,	%i4,	%l6
	fexpand	%f29,	%f18
	set	0x28, %i7
	lduwa	[%l7 + %i7] 0x81,	%i7
	fbe,a	%fcc2,	loop_1479
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f28
	fcmpgt32	%f10,	%f12,	%l1
loop_1479:
	fpackfix	%f14,	%f24
	for	%f14,	%f18,	%f8
	sdivcc	%g4,	0x1BF6,	%l3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	set	0x5D, %l2
	lduba	[%l7 + %l2] 0x18,	%o2
	movl	%icc,	%i0,	%l5
	set	0x14, %o3
	ldswa	[%l7 + %o3] 0x14,	%g2
	bne,a,pn	%xcc,	loop_1480
	umulcc	%l2,	0x01E0,	%g3
	ldx	[%l7 + 0x58],	%i5
	subcc	%o1,	0x1D57,	%g6
loop_1480:
	movg	%icc,	%i6,	%i3
	tgu	%icc,	0x5
	set	0x31, %o7
	ldsba	[%l7 + %o7] 0x14,	%o4
	movvs	%icc,	%o3,	%l4
	srax	%i1,	%i2,	%o6
	fcmped	%fcc1,	%f10,	%f14
	ldd	[%l7 + 0x68],	%o0
	addcc	%g5,	0x110D,	%o7
	smul	%l0,	0x00EA,	%g1
	brgz	%g7,	loop_1481
	fbge	%fcc3,	loop_1482
	edge16ln	%i4,	%o5,	%i7
	tgu	%icc,	0x7
loop_1481:
	brgez,a	%l1,	loop_1483
loop_1482:
	ld	[%l7 + 0x68],	%f9
	fmul8x16al	%f23,	%f22,	%f12
	sth	%g4,	[%l7 + 0x16]
loop_1483:
	fsrc1	%f14,	%f26
	tle	%icc,	0x2
	tle	%xcc,	0x4
	movcc	%xcc,	%l3,	%l6
	fornot1s	%f14,	%f7,	%f17
	subc	%i0,	%o2,	%l5
	lduw	[%l7 + 0x70],	%l2
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x80
	movvc	%icc,	%g3,	%g2
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	brlz	%g6,	loop_1484
	edge8l	%i5,	%i6,	%o4
	fsrc2	%f14,	%f10
	and	%i3,	%o3,	%l4
loop_1484:
	fzero	%f14
	movgu	%xcc,	%i2,	%i1
	fornot2s	%f1,	%f3,	%f28
	tsubcc	%o6,	%g5,	%o0
	udivcc	%o7,	0x16FC,	%l0
	tle	%icc,	0x4
	fmovdl	%icc,	%f0,	%f14
	fcmpne16	%f28,	%f20,	%g1
	tl	%xcc,	0x1
	move	%icc,	%g7,	%o5
	movrne	%i7,	0x19C,	%i4
	orncc	%l1,	0x14C9,	%l3
	fbg,a	%fcc3,	loop_1485
	smulcc	%g4,	%l6,	%o2
	movge	%xcc,	%l5,	%l2
	set	0x48, %i4
	ldsha	[%l7 + %i4] 0x11,	%i0
loop_1485:
	ta	%icc,	0x2
	alignaddr	%g2,	%g3,	%o1
	addcc	%g6,	%i6,	%i5
	tneg	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	alignaddr	%i3,	%o4,	%o3
	bn	loop_1486
	movgu	%icc,	%i2,	%i1
	fcmpd	%fcc0,	%f4,	%f8
	tvs	%xcc,	0x0
loop_1486:
	fcmpes	%fcc1,	%f8,	%f31
	pdist	%f18,	%f2,	%f18
	set	0x68, %i5
	stwa	%o6,	[%l7 + %i5] 0x14
	stx	%g5,	[%l7 + 0x40]
	movrlez	%o0,	%o7,	%l0
	subcc	%l4,	%g7,	%g1
	prefetch	[%l7 + 0x14],	 0x2
	array8	%o5,	%i7,	%l1
	brz	%l3,	loop_1487
	xnorcc	%g4,	%l6,	%i4
	bvc,a	loop_1488
	fmovspos	%xcc,	%f23,	%f6
loop_1487:
	udiv	%l5,	0x1EC0,	%o2
	fpadd32	%f30,	%f12,	%f22
loop_1488:
	te	%xcc,	0x6
	set	0x1E, %l5
	stha	%l2,	[%l7 + %l5] 0x22
	membar	#Sync
	stx	%g2,	[%l7 + 0x60]
	tvs	%icc,	0x7
	edge16n	%g3,	%o1,	%g6
	tneg	%icc,	0x6
	swap	[%l7 + 0x48],	%i0
	add	%i5,	%i6,	%o4
	fmovrdgz	%o3,	%f18,	%f20
	sethi	0x1EE9,	%i2
	tgu	%xcc,	0x5
	fcmpgt32	%f24,	%f6,	%i1
	movcs	%icc,	%o6,	%g5
	bleu,a,pn	%xcc,	loop_1489
	fmovrsgz	%i3,	%f9,	%f31
	srlx	%o7,	0x17,	%l0
	move	%xcc,	%l4,	%o0
loop_1489:
	array16	%g1,	%o5,	%i7
	edge8l	%g7,	%l3,	%g4
	sllx	%l6,	%l1,	%l5
	fpackfix	%f8,	%f12
	movneg	%xcc,	%o2,	%l2
	tle	%icc,	0x2
	tgu	%xcc,	0x4
	sll	%g2,	%g3,	%i4
	andncc	%g6,	%i0,	%i5
	or	%i6,	%o1,	%o3
	tpos	%xcc,	0x6
	tpos	%icc,	0x7
	bleu,a,pt	%xcc,	loop_1490
	mova	%xcc,	%o4,	%i2
	bn,a,pn	%xcc,	loop_1491
	subc	%o6,	%g5,	%i1
loop_1490:
	sdiv	%o7,	0x13B8,	%l0
	edge8n	%i3,	%l4,	%o0
loop_1491:
	edge32l	%o5,	%i7,	%g1
	fmovsvc	%xcc,	%f3,	%f18
	alignaddrl	%g7,	%g4,	%l3
	bne,pn	%icc,	loop_1492
	or	%l6,	%l5,	%o2
	sll	%l2,	0x05,	%l1
	fbul,a	%fcc3,	loop_1493
loop_1492:
	fbug,a	%fcc1,	loop_1494
	fmovrdlz	%g2,	%f16,	%f0
	tpos	%icc,	0x1
loop_1493:
	edge16l	%i4,	%g6,	%i0
loop_1494:
	addccc	%i5,	%g3,	%o1
	tn	%xcc,	0x2
	or	%o3,	%o4,	%i6
	movpos	%xcc,	%o6,	%g5
	movleu	%xcc,	%i2,	%o7
	movcc	%icc,	%l0,	%i3
	bcs,pt	%xcc,	loop_1495
	fmovsn	%icc,	%f5,	%f4
	edge16l	%l4,	%o0,	%o5
	fnegd	%f8,	%f14
loop_1495:
	fmuld8sux16	%f26,	%f18,	%f18
	edge32n	%i1,	%i7,	%g7
	fpadd16	%f0,	%f16,	%f10
	fmul8sux16	%f22,	%f30,	%f4
	fsrc2	%f6,	%f30
	tgu	%xcc,	0x1
	fpadd32	%f22,	%f2,	%f2
	movn	%xcc,	%g4,	%l3
	subccc	%l6,	%l5,	%g1
	fbn	%fcc3,	loop_1496
	edge16n	%l2,	%l1,	%o2
	xnor	%g2,	0x110A,	%g6
	fmovs	%f0,	%f22
loop_1496:
	umulcc	%i0,	%i5,	%i4
	fbl,a	%fcc3,	loop_1497
	faligndata	%f6,	%f26,	%f14
	tleu	%icc,	0x3
	fmovscc	%icc,	%f8,	%f19
loop_1497:
	tge	%icc,	0x1
	movle	%icc,	%o1,	%g3
	xorcc	%o4,	%o3,	%o6
	array16	%g5,	%i6,	%i2
	bleu,pn	%xcc,	loop_1498
	fnor	%f8,	%f28,	%f20
	be	loop_1499
	fbo	%fcc3,	loop_1500
loop_1498:
	subcc	%o7,	%l0,	%l4
	fmovs	%f7,	%f8
loop_1499:
	array16	%o0,	%o5,	%i3
loop_1500:
	fbule,a	%fcc0,	loop_1501
	movcc	%xcc,	%i7,	%g7
	te	%xcc,	0x6
	fmul8x16au	%f29,	%f11,	%f4
loop_1501:
	edge8l	%i1,	%g4,	%l3
	fmovrsgez	%l5,	%f0,	%f11
	lduh	[%l7 + 0x58],	%l6
	fpsub16s	%f24,	%f15,	%f13
	be	loop_1502
	bleu,a,pn	%xcc,	loop_1503
	tsubcc	%l2,	0x15DA,	%l1
	fpack16	%f26,	%f8
loop_1502:
	brlz	%g1,	loop_1504
loop_1503:
	tvc	%icc,	0x0
	nop
	set	0x68, %i2
	ldx	[%l7 + %i2],	%g2
	fandnot2	%f18,	%f0,	%f18
loop_1504:
	flush	%l7 + 0x4C
	bn	loop_1505
	array16	%g6,	%o2,	%i0
	subc	%i5,	%i4,	%g3
	fsrc2s	%f13,	%f25
loop_1505:
	umulcc	%o1,	0x0275,	%o3
	movcc	%xcc,	%o4,	%o6
	array8	%i6,	%g5,	%o7
	fandnot2	%f4,	%f4,	%f2
	ldsw	[%l7 + 0x54],	%i2
	fpsub32	%f12,	%f8,	%f0
	addc	%l0,	%l4,	%o5
	fpsub32s	%f19,	%f24,	%f11
	fmovrdgez	%o0,	%f18,	%f4
	movn	%xcc,	%i7,	%g7
	set	0x08, %o6
	stda	%i0,	[%l7 + %o6] 0xeb
	membar	#Sync
	tne	%xcc,	0x1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	sllx	%i3,	%l5,	%l6
	brgez	%l3,	loop_1506
	xorcc	%l2,	%l1,	%g2
	fpack16	%f6,	%f8
	fcmpne16	%f22,	%f10,	%g1
loop_1506:
	fcmped	%fcc1,	%f28,	%f8
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g6,	%o2
	orcc	%i0,	%i4,	%g3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x47] %asi,	%i5
	fble,a	%fcc2,	loop_1507
	subcc	%o1,	0x1C21,	%o3
	fmovrsgez	%o4,	%f7,	%f12
	addccc	%i6,	%o6,	%g5
loop_1507:
	srlx	%i2,	%o7,	%l0
	edge16n	%o5,	%l4,	%i7
	srl	%o0,	%i1,	%g7
	udivcc	%g4,	0x0405,	%i3
	movn	%xcc,	%l5,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%l6,	%l1
	umul	%l2,	%g1,	%g2
	subccc	%o2,	0x0561,	%i0
	srax	%i4,	%g6,	%g3
	std	%f28,	[%l7 + 0x60]
	andncc	%i5,	%o1,	%o4
	or	%i6,	%o3,	%o6
	edge32n	%g5,	%o7,	%i2
	movcc	%xcc,	%l0,	%l4
	fand	%f12,	%f14,	%f26
	movrgz	%o5,	0x217,	%i7
	fnot2s	%f9,	%f3
	mova	%icc,	%i1,	%o0
	movrgez	%g4,	%g7,	%i3
	addc	%l5,	%l3,	%l1
	fmovdvc	%icc,	%f18,	%f31
	lduw	[%l7 + 0x5C],	%l6
	fcmple32	%f6,	%f2,	%l2
	movle	%icc,	%g2,	%o2
	fxors	%f16,	%f10,	%f12
	xnor	%i0,	%g1,	%g6
	bg,a	loop_1508
	bneg,a,pt	%icc,	loop_1509
	nop
	set	0x38, %g5
	stx	%g3,	[%l7 + %g5]
	alignaddrl	%i5,	%o1,	%o4
loop_1508:
	edge32n	%i4,	%o3,	%o6
loop_1509:
	tvs	%icc,	0x3
	movvs	%xcc,	%g5,	%i6
	lduh	[%l7 + 0x3E],	%o7
	taddcc	%i2,	%l4,	%o5
	or	%l0,	%i7,	%o0
	fpmerge	%f8,	%f5,	%f30
	fnegd	%f24,	%f12
	movrgz	%i1,	%g7,	%g4
	movg	%icc,	%i3,	%l3
	bcs,a	%icc,	loop_1510
	fbuge	%fcc3,	loop_1511
	fpmerge	%f13,	%f17,	%f8
	fble	%fcc0,	loop_1512
loop_1510:
	fmul8x16	%f12,	%f24,	%f16
loop_1511:
	fmovrse	%l1,	%f4,	%f3
	andncc	%l5,	%l6,	%g2
loop_1512:
	nop
	set	0x50, %g1
	stwa	%o2,	[%l7 + %g1] 0x18
	tgu	%icc,	0x4
	fnot2s	%f19,	%f23
	addcc	%i0,	%g1,	%l2
	fmul8x16au	%f6,	%f23,	%f16
	alignaddr	%g3,	%g6,	%i5
	smul	%o1,	0x0779,	%o4
	fmovscs	%icc,	%f2,	%f20
	srax	%i4,	0x00,	%o3
	subccc	%o6,	%g5,	%o7
	fcmpes	%fcc1,	%f7,	%f2
	tgu	%icc,	0x4
	movl	%icc,	%i6,	%i2
	std	%f20,	[%l7 + 0x10]
	srl	%l4,	0x0A,	%l0
	movn	%xcc,	%o5,	%o0
	addccc	%i1,	0x097E,	%i7
	umul	%g7,	%i3,	%g4
	bneg	%xcc,	loop_1513
	or	%l3,	0x086B,	%l1
	tvs	%icc,	0x6
	set	0x0A, %l6
	stha	%l6,	[%l7 + %l6] 0x04
loop_1513:
	flush	%l7 + 0x54
	movpos	%icc,	%g2,	%o2
	fmovrslz	%l5,	%f24,	%f19
	tge	%xcc,	0x3
	st	%f4,	[%l7 + 0x48]
	or	%g1,	%i0,	%g3
	fexpand	%f18,	%f30
	siam	0x7
	sdivcc	%l2,	0x1D49,	%g6
	fsrc2	%f2,	%f0
	ldd	[%l7 + 0x20],	%f18
	movgu	%xcc,	%i5,	%o4
	taddcctv	%i4,	%o3,	%o1
	tcs	%icc,	0x5
	fbge,a	%fcc0,	loop_1514
	fmovdge	%icc,	%f3,	%f10
	sllx	%g5,	0x05,	%o6
	popc	0x1CF4,	%i6
loop_1514:
	bge,pt	%icc,	loop_1515
	bneg,pt	%icc,	loop_1516
	udivcc	%i2,	0x1660,	%l4
	fmovrsne	%l0,	%f5,	%f16
loop_1515:
	bn,pt	%icc,	loop_1517
loop_1516:
	fmovdcs	%xcc,	%f26,	%f22
	fabsd	%f12,	%f28
	nop
	set	0x34, %o4
	stw	%o5,	[%l7 + %o4]
loop_1517:
	fsrc2s	%f26,	%f6
	fba	%fcc0,	loop_1518
	brnz	%o0,	loop_1519
	add	%o7,	0x01A5,	%i7
	fmovdcs	%icc,	%f29,	%f10
loop_1518:
	movrgz	%i1,	0x3C7,	%i3
loop_1519:
	fones	%f11
	fnands	%f21,	%f0,	%f21
	tpos	%xcc,	0x1
	fpadd16	%f28,	%f18,	%f16
	fmovsleu	%xcc,	%f30,	%f25
	movpos	%icc,	%g7,	%l3
	brnz	%g4,	loop_1520
	movrlz	%l1,	%g2,	%o2
	nop
	setx	loop_1521,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsvs	%icc,	%f27,	%f15
loop_1520:
	fmovsa	%icc,	%f7,	%f28
	edge32ln	%l5,	%g1,	%l6
loop_1521:
	edge8n	%g3,	%l2,	%g6
	fors	%f3,	%f15,	%f18
	or	%i5,	%i0,	%o4
	edge8	%i4,	%o1,	%g5
	tle	%xcc,	0x3
	taddcctv	%o3,	0x0351,	%i6
	fcmple16	%f24,	%f8,	%i2
	tg	%xcc,	0x1
	udivcc	%l4,	0x19C7,	%o6
	sdivcc	%l0,	0x0E11,	%o5
	tneg	%icc,	0x1
	ldd	[%l7 + 0x48],	%f0
	fbu,a	%fcc2,	loop_1522
	edge16n	%o7,	%o0,	%i1
	fbule	%fcc1,	loop_1523
	edge8n	%i3,	%i7,	%l3
loop_1522:
	taddcc	%g4,	%g7,	%l1
	fmovsle	%xcc,	%f31,	%f15
loop_1523:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%o2
	fbuge	%fcc1,	loop_1524
	fmovdpos	%xcc,	%f20,	%f2
	ldsw	[%l7 + 0x44],	%l5
	fpadd16s	%f24,	%f25,	%f3
loop_1524:
	sdivcc	%g2,	0x0DF5,	%g1
	nop
	set	0x40, %l4
	std	%g2,	[%l7 + %l4]
	tvs	%icc,	0x6
	fcmpgt32	%f12,	%f0,	%l2
	orcc	%l6,	%i5,	%g6
	subccc	%i0,	0x112B,	%i4
	fcmple32	%f24,	%f6,	%o4
	movge	%icc,	%o1,	%o3
	sdiv	%i6,	0x146C,	%i2
	tvs	%icc,	0x6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%l4,	%g5
	movrgez	%o6,	%o5,	%l0
	fmovrdgz	%o0,	%f12,	%f8
	edge16ln	%o7,	%i3,	%i1
	srlx	%i7,	0x02,	%g4
	wr	%g0,	0x21,	%asi
	stxa	%l3,	[%g0 + 0x8] %asi
	edge8ln	%g7,	%o2,	%l5
	te	%xcc,	0x1
	bgu,a,pt	%xcc,	loop_1525
	udiv	%l1,	0x1034,	%g1
	nop
	set	0x60, %o1
	stw	%g3,	[%l7 + %o1]
	edge32l	%l2,	%l6,	%i5
loop_1525:
	fpadd16	%f14,	%f20,	%f18
	srlx	%g6,	%g2,	%i0
	brgez,a	%o4,	loop_1526
	movle	%xcc,	%o1,	%i4
	movrne	%o3,	0x3A7,	%i2
	smulcc	%i6,	0x0C83,	%g5
loop_1526:
	tvc	%icc,	0x7
	membar	0x28
	ldsw	[%l7 + 0x3C],	%l4
	orn	%o6,	0x1D38,	%l0
	alignaddrl	%o5,	%o0,	%o7
	sra	%i3,	0x1D,	%i7
	nop
	setx	loop_1527,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn	%fcc2,	loop_1528
	tge	%xcc,	0x2
	edge8l	%g4,	%i1,	%l3
loop_1527:
	movcc	%xcc,	%g7,	%o2
loop_1528:
	movl	%xcc,	%l5,	%g1
	xnorcc	%g3,	%l1,	%l6
	taddcctv	%i5,	0x176B,	%g6
	fmovsg	%icc,	%f19,	%f8
	fmovscc	%icc,	%f6,	%f27
	sra	%g2,	%i0,	%o4
	edge8n	%o1,	%i4,	%l2
	and	%o3,	%i2,	%g5
	alignaddr	%l4,	%i6,	%l0
	smulcc	%o5,	0x1E92,	%o0
	sra	%o6,	0x06,	%i3
	mulx	%o7,	%g4,	%i1
	fandnot1	%f18,	%f20,	%f8
	edge8	%i7,	%l3,	%g7
	fmovsvs	%icc,	%f19,	%f18
	fble	%fcc2,	loop_1529
	fnor	%f12,	%f6,	%f14
	fmovdl	%icc,	%f25,	%f12
	ld	[%l7 + 0x20],	%f30
loop_1529:
	movcs	%icc,	%o2,	%l5
	fands	%f30,	%f24,	%f16
	mulscc	%g3,	%g1,	%l6
	bvs	loop_1530
	srax	%l1,	%i5,	%g2
	ta	%icc,	0x7
	ta	%icc,	0x7
loop_1530:
	fbne,a	%fcc0,	loop_1531
	and	%i0,	%g6,	%o4
	ldd	[%l7 + 0x18],	%i4
	tsubcctv	%o1,	0x19F9,	%l2
loop_1531:
	fba,a	%fcc1,	loop_1532
	stbar
	be	loop_1533
	fbl	%fcc0,	loop_1534
loop_1532:
	std	%o2,	[%l7 + 0x30]
	tcc	%xcc,	0x4
loop_1533:
	fsrc2	%f16,	%f24
loop_1534:
	sethi	0x18C4,	%g5
	taddcctv	%i2,	0x0499,	%l4
	subcc	%i6,	%o5,	%o0
	addc	%o6,	%l0,	%i3
	alignaddr	%g4,	%i1,	%i7
	tge	%icc,	0x3
	fbuge,a	%fcc0,	loop_1535
	movvc	%icc,	%o7,	%l3
	movrlez	%g7,	%l5,	%g3
	edge8ln	%o2,	%l6,	%l1
loop_1535:
	smulcc	%i5,	%g1,	%i0
	fmovrdne	%g6,	%f26,	%f14
	movl	%xcc,	%g2,	%i4
	fmovspos	%icc,	%f12,	%f4
	ldstub	[%l7 + 0x30],	%o4
	fbug,a	%fcc1,	loop_1536
	movl	%xcc,	%l2,	%o1
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x11,	%o3,	%g5
loop_1536:
	movcc	%icc,	%l4,	%i6
	fnor	%f4,	%f28,	%f24
	alignaddrl	%o5,	%o0,	%i2
	tg	%icc,	0x6
	edge8ln	%l0,	%i3,	%o6
	fbo	%fcc0,	loop_1537
	movcc	%icc,	%i1,	%i7
	movrlz	%o7,	%l3,	%g7
	umulcc	%g4,	%l5,	%g3
loop_1537:
	udiv	%o2,	0x19CB,	%l6
	andn	%l1,	0x1EC7,	%g1
	edge32	%i0,	%g6,	%g2
	movneg	%icc,	%i5,	%i4
	fsrc1	%f26,	%f24
	tsubcctv	%l2,	%o4,	%o1
	tl	%xcc,	0x5
	fbue	%fcc0,	loop_1538
	or	%g5,	%l4,	%o3
	tleu	%xcc,	0x0
	fmovdleu	%icc,	%f0,	%f22
loop_1538:
	membar	0x0A
	fcmpgt16	%f26,	%f26,	%i6
	edge16	%o0,	%o5,	%i2
	edge8	%l0,	%o6,	%i3
	smulcc	%i1,	%i7,	%l3
	or	%o7,	0x1D9A,	%g4
	movrgz	%l5,	0x2CD,	%g3
	wr	%g0,	0x80,	%asi
	stda	%o2,	[%l7 + 0x70] %asi
	movn	%xcc,	%l6,	%g7
	movvs	%xcc,	%l1,	%i0
	movvs	%icc,	%g6,	%g1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g2
	brgz	%i5,	loop_1539
	mulscc	%i4,	%l2,	%o4
	brlz,a	%o1,	loop_1540
	array8	%g5,	%l4,	%i6
loop_1539:
	prefetch	[%l7 + 0x54],	 0x0
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x26,	%o2
loop_1540:
	brgez	%o0,	loop_1541
	alignaddrl	%i2,	%l0,	%o5
	move	%xcc,	%o6,	%i3
	addc	%i7,	0x1AB7,	%l3
loop_1541:
	fnegd	%f0,	%f2
	sdiv	%o7,	0x02D6,	%i1
	addcc	%g4,	0x03D4,	%g3
	set	0x25, %o5
	stba	%l5,	[%l7 + %o5] 0x2a
	membar	#Sync
	bge,a	%xcc,	loop_1542
	for	%f22,	%f8,	%f18
	tge	%xcc,	0x7
	edge8n	%o2,	%g7,	%l1
loop_1542:
	srl	%i0,	0x01,	%g6
	movrgez	%g1,	0x20D,	%g2
	tgu	%xcc,	0x1
	bpos,a	%xcc,	loop_1543
	nop
	setx	loop_1544,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%icc,	0x0
	pdist	%f30,	%f14,	%f4
loop_1543:
	addccc	%l6,	0x0BE7,	%i5
loop_1544:
	movvc	%xcc,	%i4,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%g5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	edge8	%l4,	%i6,	%o0
	bneg	loop_1545
	std	%o2,	[%l7 + 0x58]
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x0F] %asi,	%i2
loop_1545:
	xorcc	%l0,	%o5,	%o6
	edge32	%i3,	%l3,	%i7
	edge32l	%i1,	%o7,	%g3
	bleu	loop_1546
	fmovdneg	%icc,	%f20,	%f12
	tgu	%icc,	0x0
	movle	%icc,	%g4,	%o2
loop_1546:
	sllx	%l5,	0x1E,	%l1
	bg,pn	%xcc,	loop_1547
	fmovrslz	%i0,	%f18,	%f25
	tn	%icc,	0x7
	fxor	%f16,	%f16,	%f30
loop_1547:
	edge32l	%g6,	%g7,	%g1
	umulcc	%g2,	%l6,	%i5
	fsrc2	%f22,	%f18
	te	%xcc,	0x3
	tle	%xcc,	0x0
	udivcc	%o4,	0x11DF,	%i4
	sdiv	%g5,	0x1F61,	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%i6
	move	%icc,	%o0,	%l2
	tn	%icc,	0x4
	fors	%f9,	%f15,	%f22
	movvs	%icc,	%i2,	%o3
	tleu	%icc,	0x0
	movrlz	%l0,	%o6,	%o5
	fmovsvs	%icc,	%f5,	%f29
	sllx	%l3,	0x13,	%i7
	sdivx	%i1,	0x028E,	%i3
	movle	%icc,	%o7,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%l5
	stw	%o2,	[%l7 + 0x14]
	membar	0x44
	mulscc	%l1,	%g6,	%g7
	te	%icc,	0x5
	fbe,a	%fcc1,	loop_1548
	smul	%i0,	%g2,	%g1
	fabsd	%f26,	%f16
	fmovsl	%xcc,	%f1,	%f21
loop_1548:
	fmovdleu	%xcc,	%f31,	%f28
	fandnot2	%f22,	%f6,	%f20
	tsubcc	%l6,	%o4,	%i4
	fabss	%f20,	%f16
	udivcc	%i5,	0x0F50,	%g5
	tl	%icc,	0x4
	fmovdvc	%xcc,	%f9,	%f9
	movrlez	%o1,	%l4,	%i6
	movrne	%l2,	%i2,	%o0
	fmovda	%icc,	%f23,	%f30
	nop
	setx	loop_1549,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%o3,	0x16BF,	%o6
	tl	%icc,	0x5
	sir	0x0F44
loop_1549:
	tl	%icc,	0x5
	fba,a	%fcc3,	loop_1550
	sll	%o5,	0x10,	%l0
	tn	%icc,	0x0
	fmovrsgz	%l3,	%f2,	%f28
loop_1550:
	movneg	%icc,	%i7,	%i1
	movvs	%icc,	%i3,	%o7
	movg	%xcc,	%g3,	%l5
	tleu	%xcc,	0x4
	fmovdge	%icc,	%f15,	%f13
	tcc	%icc,	0x0
	edge32ln	%o2,	%g4,	%g6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	fmovse	%xcc,	%f31,	%f25
	edge16n	%g7,	%g2,	%g1
	flush	%l7 + 0x18
	edge32ln	%l6,	%i0,	%o4
	movre	%i5,	%i4,	%o1
	bge,pt	%icc,	loop_1551
	mova	%icc,	%l4,	%i6
	smulcc	%l2,	0x1588,	%i2
	tgu	%icc,	0x7
loop_1551:
	movg	%icc,	%g5,	%o0
	edge16	%o3,	%o5,	%o6
	movrgez	%l3,	0x11C,	%i7
	movne	%icc,	%l0,	%i3
	movle	%icc,	%i1,	%g3
	smulcc	%o7,	%o2,	%g4
	edge16ln	%l5,	%l1,	%g6
	ta	%icc,	0x2
	edge8l	%g7,	%g1,	%l6
	movpos	%icc,	%i0,	%o4
	prefetch	[%l7 + 0x34],	 0x3
	wr	%g0,	0x80,	%asi
	stha	%g2,	[%l7 + 0x7C] %asi
	andncc	%i4,	%o1,	%l4
	movcc	%icc,	%i5,	%l2
	movcs	%xcc,	%i2,	%g5
	movle	%xcc,	%i6,	%o3
	bvs,a,pt	%xcc,	loop_1552
	movg	%icc,	%o0,	%o5
	movrne	%l3,	0x1F5,	%i7
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%l0
loop_1552:
	fmovsne	%icc,	%f11,	%f19
	addccc	%i3,	0x1B99,	%i1
	fors	%f15,	%f1,	%f28
	alignaddrl	%o6,	%o7,	%o2
	fmovrdlez	%g4,	%f22,	%f8
	fxnor	%f12,	%f20,	%f0
	orncc	%g3,	%l1,	%l5
	addc	%g7,	0x0D5D,	%g6
	movcs	%icc,	%l6,	%i0
	orcc	%g1,	%g2,	%o4
	umulcc	%i4,	%o1,	%l4
	movl	%icc,	%i5,	%i2
	fmovsg	%xcc,	%f11,	%f18
	sllx	%l2,	%i6,	%o3
	tgu	%xcc,	0x4
	fbule,a	%fcc2,	loop_1553
	bge,pt	%icc,	loop_1554
	nop
	setx	loop_1555,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdge	%xcc,	%f26,	%f13
loop_1553:
	fexpand	%f24,	%f22
loop_1554:
	fblg,a	%fcc3,	loop_1556
loop_1555:
	movl	%icc,	%g5,	%o5
	taddcc	%l3,	0x0D9D,	%o0
	tne	%icc,	0x2
loop_1556:
	edge16l	%l0,	%i3,	%i7
	movge	%xcc,	%i1,	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%o2
	movle	%xcc,	%g4,	%l1
	sll	%l5,	0x04,	%g7
	fnand	%f16,	%f8,	%f24
	bgu	%xcc,	loop_1557
	addcc	%g6,	0x0BE7,	%l6
	fmovsn	%icc,	%f10,	%f29
	fbl,a	%fcc0,	loop_1558
loop_1557:
	orncc	%g3,	0x0B51,	%i0
	set	0x08, %g3
	lduha	[%l7 + %g3] 0x81,	%g1
loop_1558:
	edge32n	%o4,	%g2,	%i4
	fand	%f4,	%f6,	%f10
	smulcc	%l4,	%o1,	%i5
	fbu,a	%fcc3,	loop_1559
	tneg	%xcc,	0x7
	tle	%icc,	0x3
	orcc	%i2,	%l2,	%i6
loop_1559:
	xor	%g5,	0x004B,	%o5
	fmul8ulx16	%f28,	%f4,	%f6
	fcmple16	%f28,	%f14,	%o3
	ldsh	[%l7 + 0x30],	%l3
	fmovsvc	%icc,	%f28,	%f10
	set	0x60, %g2
	stda	%l0,	[%l7 + %g2] 0x10
	fpsub32	%f18,	%f26,	%f6
	tvc	%icc,	0x7
	fbe,a	%fcc1,	loop_1560
	andcc	%i3,	0x093F,	%o0
	tleu	%icc,	0x7
	or	%i7,	%o6,	%i1
loop_1560:
	movg	%icc,	%o7,	%o2
	fnors	%f28,	%f15,	%f22
	tle	%xcc,	0x2
	movrlez	%g4,	%l5,	%g7
	smulcc	%l1,	0x03A4,	%g6
	tcc	%xcc,	0x0
	xnorcc	%g3,	0x03DC,	%i0
	nop
	setx	loop_1561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%l6,	%g1,	%o4
	mulscc	%i4,	%l4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1561:
	subcc	%i5,	%o1,	%l2
	set	0x74, %i6
	swapa	[%l7 + %i6] 0x89,	%i2
	mulx	%i6,	0x0AF1,	%g5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x58] %asi,	%o5
	tneg	%icc,	0x5
	subc	%l3,	0x01D7,	%l0
	fbul	%fcc2,	loop_1562
	sll	%o3,	%o0,	%i7
	bneg,pn	%icc,	loop_1563
	movvc	%icc,	%i3,	%i1
loop_1562:
	bgu	loop_1564
	fcmple32	%f24,	%f12,	%o6
loop_1563:
	movg	%icc,	%o7,	%g4
	movn	%xcc,	%l5,	%g7
loop_1564:
	tge	%icc,	0x7
	mulscc	%o2,	%l1,	%g6
	movre	%g3,	%i0,	%l6
	tgu	%icc,	0x6
	fone	%f28
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%i4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	fpadd16s	%f4,	%f16,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g2,	0x363,	%i5
	edge32	%g1,	%l2,	%o1
	and	%i2,	0x044F,	%i6
	move	%icc,	%g5,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x7
	fbe,a	%fcc0,	loop_1565
	taddcctv	%l0,	%o3,	%l3
	tgu	%xcc,	0x6
	sub	%o0,	0x1F10,	%i7
loop_1565:
	fbl,a	%fcc1,	loop_1566
	fbuge,a	%fcc1,	loop_1567
	srlx	%i3,	0x0D,	%i1
	edge32	%o6,	%o7,	%l5
loop_1566:
	alignaddr	%g4,	%o2,	%l1
loop_1567:
	udiv	%g7,	0x1ED9,	%g6
	lduw	[%l7 + 0x50],	%i0
	bvc,a	%icc,	loop_1568
	tvc	%icc,	0x1
	alignaddrl	%g3,	%o4,	%i4
	array8	%l6,	%l4,	%g2
loop_1568:
	orn	%i5,	%l2,	%o1
	sllx	%g1,	0x05,	%i6
	mova	%icc,	%i2,	%o5
	tneg	%xcc,	0x4
	movcc	%icc,	%g5,	%l0
	and	%l3,	%o0,	%o3
	fbe,a	%fcc0,	loop_1569
	edge16l	%i7,	%i1,	%o6
	smul	%i3,	0x157C,	%l5
	fmovsle	%icc,	%f31,	%f20
loop_1569:
	brlz	%o7,	loop_1570
	fmovrdne	%o2,	%f26,	%f30
	tg	%xcc,	0x0
	addcc	%l1,	%g4,	%g6
loop_1570:
	array8	%g7,	%g3,	%i0
	fexpand	%f10,	%f0
	ld	[%l7 + 0x40],	%f23
	mulx	%o4,	0x0D1B,	%i4
	swap	[%l7 + 0x18],	%l6
	movvs	%icc,	%g2,	%i5
	fbe,a	%fcc3,	loop_1571
	fmovrdne	%l2,	%f2,	%f20
	movle	%icc,	%o1,	%l4
	taddcc	%g1,	0x08AD,	%i2
loop_1571:
	srlx	%i6,	%g5,	%o5
	bpos,a	%xcc,	loop_1572
	bvc	%icc,	loop_1573
	edge16l	%l0,	%l3,	%o3
	fmovde	%xcc,	%f10,	%f3
loop_1572:
	bg,a,pt	%icc,	loop_1574
loop_1573:
	fnands	%f26,	%f30,	%f1
	edge16	%i7,	%i1,	%o6
	fors	%f27,	%f10,	%f21
loop_1574:
	fbne,a	%fcc2,	loop_1575
	fors	%f11,	%f12,	%f28
	addc	%i3,	%l5,	%o7
	tpos	%xcc,	0x0
loop_1575:
	fpmerge	%f9,	%f31,	%f4
	movge	%xcc,	%o0,	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g4,	%o2
	andcc	%g7,	0x03CC,	%g6
	lduw	[%l7 + 0x34],	%g3
	andncc	%i0,	%o4,	%i4
	andn	%g2,	%l6,	%l2
	set	0x58, %i0
	lda	[%l7 + %i0] 0x19,	%f13
	sdivcc	%o1,	0x1534,	%i5
	edge32ln	%l4,	%g1,	%i6
	bleu,pn	%icc,	loop_1576
	movg	%xcc,	%g5,	%i2
	fmovrsgz	%o5,	%f30,	%f23
	fmul8sux16	%f12,	%f16,	%f18
loop_1576:
	movvs	%xcc,	%l0,	%o3
	taddcc	%l3,	0x0AAA,	%i1
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	array16	%i7,	%o6,	%l5
	swap	[%l7 + 0x18],	%i3
	sir	0x1B84
	fcmpne32	%f8,	%f8,	%o0
	edge32	%l1,	%g4,	%o7
	set	0x0C, %i3
	sta	%f5,	[%l7 + %i3] 0x89
	bg,a,pt	%xcc,	loop_1577
	orncc	%o2,	%g6,	%g3
	srl	%i0,	0x13,	%g7
	ldsh	[%l7 + 0x46],	%i4
loop_1577:
	edge8ln	%g2,	%l6,	%o4
	array16	%o1,	%i5,	%l2
	sir	0x1758
	subc	%l4,	0x19DF,	%i6
	fnot1s	%f19,	%f11
	tsubcctv	%g5,	%g1,	%i2
	fmovrdgez	%l0,	%f6,	%f16
	srlx	%o5,	%l3,	%i1
	tn	%xcc,	0x6
	udivcc	%i7,	0x1A74,	%o6
	fmovs	%f15,	%f1
	movrlz	%o3,	%i3,	%l5
	smul	%l1,	0x1CB0,	%g4
	movneg	%icc,	%o0,	%o7
	array16	%o2,	%g3,	%i0
	fsrc2s	%f17,	%f0
	smulcc	%g6,	%i4,	%g2
	orcc	%g7,	0x0DD8,	%l6
	array32	%o1,	%i5,	%l2
	fmovdvc	%xcc,	%f12,	%f28
	movgu	%icc,	%l4,	%o4
	sdivcc	%i6,	0x143B,	%g5
	fmovsleu	%xcc,	%f11,	%f30
	membar	0x15
	fbug,a	%fcc1,	loop_1578
	bl	%xcc,	loop_1579
	udivcc	%g1,	0x0337,	%i2
	movpos	%xcc,	%o5,	%l3
loop_1578:
	bvs,pt	%xcc,	loop_1580
loop_1579:
	be,a,pt	%icc,	loop_1581
	movrgez	%l0,	0x28F,	%i7
	bneg,pn	%xcc,	loop_1582
loop_1580:
	bl,a,pt	%xcc,	loop_1583
loop_1581:
	fmovrdlez	%o6,	%f30,	%f16
	tneg	%xcc,	0x3
loop_1582:
	fbl,a	%fcc3,	loop_1584
loop_1583:
	ldsb	[%l7 + 0x21],	%i1
	fblg,a	%fcc3,	loop_1585
	fmovsn	%icc,	%f31,	%f9
loop_1584:
	fnands	%f16,	%f22,	%f23
	fmovsg	%xcc,	%f18,	%f14
loop_1585:
	addcc	%o3,	%l5,	%i3
	fbuge,a	%fcc3,	loop_1586
	movrlez	%g4,	%l1,	%o0
	sdivcc	%o2,	0x0308,	%o7
	movg	%xcc,	%i0,	%g3
loop_1586:
	fmul8ulx16	%f14,	%f0,	%f6
	movrgz	%g6,	%i4,	%g2
	sll	%l6,	%g7,	%o1
	sra	%l2,	0x0C,	%l4
	stb	%i5,	[%l7 + 0x52]
	tn	%xcc,	0x7
	swap	[%l7 + 0x50],	%i6
	tsubcc	%o4,	%g5,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i2,	%l3,	%l0
	lduw	[%l7 + 0x70],	%o5
	movne	%icc,	%o6,	%i1
	set	0x74, %i1
	ldswa	[%l7 + %i1] 0x89,	%o3
	bg,pt	%xcc,	loop_1587
	or	%i7,	%i3,	%l5
	movvs	%icc,	%g4,	%o0
	be,a	%icc,	loop_1588
loop_1587:
	tle	%xcc,	0x0
	membar	0x54
	array8	%o2,	%l1,	%i0
loop_1588:
	nop
	wr	%g0,	0x2b,	%asi
	stxa	%o7,	[%l7 + 0x40] %asi
	membar	#Sync
	sll	%g3,	0x01,	%g6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g2,	%i4
	edge32n	%l6,	%g7,	%o1
	tl	%icc,	0x7
	alignaddr	%l2,	%l4,	%i6
	fmovsvs	%xcc,	%f24,	%f0
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x88,	%o4
	subc	%i5,	0x0CF3,	%g1
	mulx	%i2,	%l3,	%g5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o5
	set	0x68, %l1
	swapa	[%l7 + %l1] 0x11,	%l0
	alignaddr	%i1,	%o3,	%i7
	tcs	%xcc,	0x2
	mulscc	%o6,	%l5,	%g4
	nop
	setx	loop_1589,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%xcc,	0x2
	subccc	%i3,	0x1F8F,	%o0
	movneg	%xcc,	%l1,	%i0
loop_1589:
	bneg	%xcc,	loop_1590
	alignaddrl	%o7,	%o2,	%g3
	orcc	%g6,	0x0336,	%i4
	fmul8x16al	%f18,	%f12,	%f26
loop_1590:
	sdivx	%g2,	0x047C,	%g7
	fzero	%f26
	smul	%l6,	0x1E17,	%l2
	andcc	%o1,	%i6,	%o4
	smul	%i5,	%g1,	%l4
	edge32n	%i2,	%l3,	%g5
	alignaddr	%o5,	%i1,	%o3
	movpos	%xcc,	%i7,	%o6
	fcmple16	%f0,	%f12,	%l5
	fcmpeq32	%f28,	%f26,	%l0
	movpos	%icc,	%g4,	%o0
	tpos	%xcc,	0x1
	movcs	%xcc,	%i3,	%i0
	edge16n	%o7,	%l1,	%o2
	fmovrsgz	%g3,	%f18,	%f11
	edge16n	%g6,	%i4,	%g2
	orn	%g7,	0x1DBC,	%l2
	popc	%o1,	%l6
	ldsh	[%l7 + 0x16],	%i6
	tl	%icc,	0x2
	xorcc	%i5,	%g1,	%l4
	fbule,a	%fcc2,	loop_1591
	addc	%o4,	%l3,	%g5
	fpack32	%f8,	%f24,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1591:
	movrlz	%i2,	%i1,	%o5
	xor	%i7,	0x0603,	%o3
	edge16l	%l5,	%l0,	%o6
	wr	%g0,	0x2f,	%asi
	stwa	%g4,	[%l7 + 0x14] %asi
	membar	#Sync
	fbo,a	%fcc1,	loop_1592
	call	loop_1593
	popc	0x17B3,	%o0
	tne	%xcc,	0x0
loop_1592:
	stx	%i0,	[%l7 + 0x38]
loop_1593:
	srlx	%i3,	%l1,	%o2
	edge32ln	%o7,	%g6,	%i4
	set	0x64, %l0
	ldsha	[%l7 + %l0] 0x10,	%g2
	fpadd16s	%f7,	%f6,	%f16
	fbule	%fcc0,	loop_1594
	udivx	%g3,	0x1EFF,	%g7
	fblg,a	%fcc0,	loop_1595
	movcs	%icc,	%o1,	%l2
loop_1594:
	edge32n	%l6,	%i6,	%g1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%i5
loop_1595:
	fsrc1	%f26,	%f20
	edge8n	%l4,	%l3,	%o4
	movg	%xcc,	%i2,	%g5
	fpsub16s	%f0,	%f29,	%f5
	brz,a	%i1,	loop_1596
	movneg	%icc,	%o5,	%o3
loop_1596:
	siam	0x4
	movle	%xcc,	%i7,	%l0
	addc	%o6,	0x1F12,	%o0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%i0
	movne	%xcc,	%g4,	%l1
	edge16l	%i3,	%o2,	%g6
	movneg	%icc,	%o7,	%i4
	movre	%g2,	0x064,	%g3
	smul	%o1,	%g7,	%l2
	tgu	%xcc,	0x5
	movl	%xcc,	%i6,	%g1
	set	0x32, %g6
	ldsha	[%l7 + %g6] 0x19,	%l6
	bg,a	%icc,	loop_1597
	movg	%icc,	%i5,	%l3
	bgu,a	%icc,	loop_1598
	fbuge,a	%fcc2,	loop_1599
loop_1597:
	fba,a	%fcc2,	loop_1600
	tleu	%icc,	0x4
loop_1598:
	bvs,a,pn	%xcc,	loop_1601
loop_1599:
	fornot2s	%f26,	%f3,	%f5
loop_1600:
	bneg,a	loop_1602
	tcc	%icc,	0x6
loop_1601:
	fmovrdgz	%o4,	%f20,	%f8
	ldsb	[%l7 + 0x5E],	%i2
loop_1602:
	movvs	%xcc,	%l4,	%g5
	tg	%xcc,	0x7
	tsubcctv	%i1,	0x1624,	%o3
	ta	%xcc,	0x2
	nop
	setx	loop_1603,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%icc,	%l5,	%o5
	fmovsle	%icc,	%f27,	%f10
	set	0x7C, %g4
	stha	%i7,	[%l7 + %g4] 0x22
	membar	#Sync
loop_1603:
	sir	0x1C26
	fbge,a	%fcc3,	loop_1604
	edge32ln	%o6,	%l0,	%o0
	xnorcc	%g4,	%l1,	%i3
	movvc	%xcc,	%i0,	%o2
loop_1604:
	srax	%o7,	%g6,	%g2
	tcs	%icc,	0x2
	fmovrslez	%g3,	%f0,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x0, %i7
	stxa	%o1,	[%g0 + %i7] 0x57
	swap	[%l7 + 0x38],	%g7
	tl	%icc,	0x2
	movpos	%icc,	%i4,	%l2
	taddcctv	%g1,	%l6,	%i6
	ldstub	[%l7 + 0x4E],	%i5
	movn	%icc,	%o4,	%l3
	movrgez	%l4,	%i2,	%i1
	fmovdn	%icc,	%f28,	%f9
	sdivx	%o3,	0x15AB,	%g5
	sll	%o5,	0x00,	%l5
	smulcc	%o6,	0x1AC2,	%l0
	umulcc	%i7,	0x0830,	%g4
	fpack16	%f12,	%f22
	mulscc	%o0,	0x1A04,	%l1
	prefetch	[%l7 + 0x0C],	 0x2
	xorcc	%i0,	0x1981,	%o2
	flush	%l7 + 0x58
	fmul8ulx16	%f4,	%f8,	%f14
	tgu	%xcc,	0x0
	fmovdpos	%xcc,	%f16,	%f28
	udivcc	%o7,	0x0D6B,	%g6
	addccc	%i3,	0x1C6C,	%g3
	fsrc1	%f4,	%f14
	call	loop_1605
	edge32n	%o1,	%g7,	%g2
	fmovrdne	%i4,	%f12,	%f18
	array8	%g1,	%l2,	%l6
loop_1605:
	fornot1	%f8,	%f22,	%f28
	fmul8x16	%f16,	%f14,	%f14
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x25] %asi,	%i5
	fcmpgt32	%f2,	%f26,	%o4
	alignaddr	%l3,	%i6,	%i2
	edge32l	%i1,	%l4,	%g5
	fmovdge	%xcc,	%f22,	%f14
	tneg	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	movge	%icc,	%l5,	%o3
	srl	%o6,	%l0,	%i7
	edge32n	%o0,	%g4,	%l1
	ba,pn	%icc,	loop_1606
	ta	%xcc,	0x6
	or	%i0,	%o2,	%g6
	fornot1s	%f29,	%f17,	%f17
loop_1606:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f25,	%f4
	sdiv	%o7,	0x1931,	%g3
	tsubcctv	%i3,	%o1,	%g2
	popc	0x066D,	%g7
	fpsub16	%f30,	%f20,	%f16
	fcmpd	%fcc1,	%f30,	%f4
	fbl,a	%fcc0,	loop_1607
	fandnot2s	%f1,	%f6,	%f7
	std	%i4,	[%l7 + 0x30]
	bge,a,pt	%xcc,	loop_1608
loop_1607:
	fmul8x16al	%f25,	%f26,	%f12
	andn	%g1,	0x10F0,	%l6
	fmovdle	%xcc,	%f21,	%f4
loop_1608:
	mulscc	%l2,	0x1311,	%i5
	ldsw	[%l7 + 0x44],	%o4
	tle	%icc,	0x7
	stx	%l3,	[%l7 + 0x08]
	movrgz	%i6,	%i1,	%i2
	sir	0x1A7F
	edge32	%l4,	%o5,	%l5
	flush	%l7 + 0x70
	tg	%xcc,	0x0
	ldsw	[%l7 + 0x68],	%g5
	edge32ln	%o3,	%o6,	%l0
	xor	%i7,	0x0124,	%g4
	move	%xcc,	%o0,	%l1
	fbn	%fcc0,	loop_1609
	tg	%icc,	0x5
	udivcc	%o2,	0x07CE,	%i0
	movcs	%icc,	%g6,	%g3
loop_1609:
	udivx	%o7,	0x1D35,	%i3
	bgu,a,pn	%xcc,	loop_1610
	fcmpes	%fcc0,	%f16,	%f22
	fcmps	%fcc2,	%f27,	%f25
	wr	%g0,	0x04,	%asi
	stxa	%o1,	[%l7 + 0x78] %asi
loop_1610:
	faligndata	%f22,	%f6,	%f18
	subccc	%g2,	0x0089,	%i4
	fmovrdne	%g7,	%f28,	%f22
	lduw	[%l7 + 0x28],	%l6
	udiv	%g1,	0x05A4,	%l2
	fcmple32	%f0,	%f6,	%i5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o4
	xorcc	%l3,	%i1,	%i6
	call	loop_1611
	edge8	%i2,	%l4,	%o5
	umulcc	%l5,	0x1AEB,	%g5
	sdiv	%o6,	0x0019,	%o3
loop_1611:
	tcc	%icc,	0x4
	tleu	%icc,	0x2
	smulcc	%i7,	0x1135,	%l0
	edge8n	%o0,	%l1,	%g4
	sra	%o2,	0x13,	%i0
	orncc	%g3,	0x0EFF,	%g6
	sdiv	%i3,	0x1292,	%o1
	tsubcc	%g2,	%o7,	%g7
	fpsub32s	%f17,	%f20,	%f21
	membar	0x57
	taddcc	%i4,	%l6,	%l2
	fmovsl	%xcc,	%f25,	%f4
	lduw	[%l7 + 0x4C],	%i5
	tg	%icc,	0x7
	bcs,pt	%icc,	loop_1612
	movrne	%o4,	%l3,	%i1
	tgu	%xcc,	0x3
	tne	%icc,	0x4
loop_1612:
	fbu,a	%fcc3,	loop_1613
	movrlez	%i6,	%i2,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o5,	%l5,	%g5
loop_1613:
	fmovdneg	%icc,	%f5,	%f27
	edge16n	%g1,	%o3,	%o6
	srl	%l0,	%o0,	%i7
	alignaddr	%g4,	%o2,	%i0
	tsubcc	%g3,	%g6,	%i3
	alignaddrl	%o1,	%l1,	%g2
	fbl,a	%fcc3,	loop_1614
	tvs	%xcc,	0x2
	edge8l	%o7,	%g7,	%l6
	tge	%icc,	0x0
loop_1614:
	edge32ln	%l2,	%i5,	%o4
	move	%icc,	%l3,	%i1
	tvc	%icc,	0x0
	fbg	%fcc1,	loop_1615
	edge32	%i4,	%i6,	%i2
	movle	%xcc,	%l4,	%o5
	udivcc	%l5,	0x0071,	%g5
loop_1615:
	fsrc2s	%f30,	%f23
	stx	%o3,	[%l7 + 0x20]
	fxors	%f7,	%f4,	%f18
	fbg	%fcc1,	loop_1616
	udivx	%o6,	0x0BA4,	%l0
	taddcctv	%g1,	0x0A8D,	%i7
	pdist	%f30,	%f22,	%f10
loop_1616:
	nop
	set	0x53, %l3
	ldstuba	[%l7 + %l3] 0x11,	%o0
	bn,a,pt	%xcc,	loop_1617
	or	%g4,	0x1263,	%i0
	fmovdvs	%xcc,	%f7,	%f29
	sllx	%g3,	%g6,	%i3
loop_1617:
	fmovsvs	%xcc,	%f2,	%f4
	fandnot2s	%f8,	%f3,	%f28
	movrlz	%o2,	%l1,	%g2
	lduw	[%l7 + 0x2C],	%o7
	fble	%fcc0,	loop_1618
	bvs,pt	%xcc,	loop_1619
	edge32l	%o1,	%g7,	%l6
	movre	%l2,	%o4,	%l3
loop_1618:
	tcs	%xcc,	0x1
loop_1619:
	edge8ln	%i1,	%i4,	%i6
	fblg	%fcc0,	loop_1620
	movrgz	%i5,	%i2,	%o5
	tcc	%xcc,	0x4
	set	0x2C, %l2
	stwa	%l4,	[%l7 + %l2] 0x18
loop_1620:
	fmul8x16	%f16,	%f2,	%f2
	tle	%xcc,	0x5
	tge	%icc,	0x7
	tgu	%icc,	0x0
	fbl,a	%fcc1,	loop_1621
	xor	%g5,	0x0A65,	%l5
	xnorcc	%o6,	0x1265,	%o3
	xnorcc	%g1,	%i7,	%o0
loop_1621:
	edge16l	%l0,	%i0,	%g4
	edge8	%g3,	%i3,	%o2
	bleu,pn	%icc,	loop_1622
	udiv	%l1,	0x0561,	%g2
	bcs,pn	%icc,	loop_1623
	fmovsle	%icc,	%f1,	%f16
loop_1622:
	brnz	%g6,	loop_1624
	orncc	%o1,	%o7,	%l6
loop_1623:
	sir	0x16B7
	fxnor	%f18,	%f22,	%f6
loop_1624:
	fone	%f0
	bg,a,pt	%xcc,	loop_1625
	fnor	%f16,	%f2,	%f18
	addc	%g7,	0x140B,	%o4
	movrlez	%l2,	%i1,	%l3
loop_1625:
	brz	%i6,	loop_1626
	xorcc	%i4,	%i2,	%i5
	smul	%o5,	0x00C5,	%g5
	movl	%icc,	%l4,	%l5
loop_1626:
	fba,a	%fcc0,	loop_1627
	fbe	%fcc3,	loop_1628
	or	%o3,	%g1,	%o6
	tn	%icc,	0x7
loop_1627:
	brnz	%o0,	loop_1629
loop_1628:
	bg,a,pt	%xcc,	loop_1630
	sethi	0x0F7B,	%i7
	fmovdg	%xcc,	%f25,	%f25
loop_1629:
	taddcc	%l0,	0x049F,	%g4
loop_1630:
	andncc	%i0,	%i3,	%g3
	taddcctv	%o2,	%l1,	%g2
	bl	loop_1631
	fcmpne16	%f16,	%f22,	%o1
	fbuge,a	%fcc0,	loop_1632
	fcmpne16	%f12,	%f22,	%g6
loop_1631:
	array32	%l6,	%o7,	%g7
	movre	%l2,	0x077,	%o4
loop_1632:
	te	%xcc,	0x3
	nop
	setx loop_1633, %l0, %l1
	jmpl %l1, %i1
	tvs	%icc,	0x4
	movrgez	%l3,	0x188,	%i6
	bgu	%xcc,	loop_1634
loop_1633:
	fornot1	%f24,	%f4,	%f2
	fandnot1s	%f7,	%f12,	%f26
	membar	0x4A
loop_1634:
	bpos,pt	%xcc,	loop_1635
	te	%icc,	0x1
	orn	%i4,	%i5,	%i2
	wr	%g0,	0x88,	%asi
	stda	%g4,	[%l7 + 0x78] %asi
loop_1635:
	edge8l	%o5,	%l5,	%o3
	taddcctv	%l4,	0x0120,	%g1
	edge32n	%o6,	%i7,	%l0
	bneg,pn	%xcc,	loop_1636
	movcs	%icc,	%g4,	%i0
	xnor	%i3,	0x03E7,	%o0
	nop
	setx	loop_1637,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1636:
	array32	%g3,	%l1,	%o2
	fsrc2	%f22,	%f22
	edge8ln	%g2,	%o1,	%l6
loop_1637:
	tne	%icc,	0x2
	fexpand	%f13,	%f12
	edge16	%o7,	%g7,	%l2
	sub	%g6,	%i1,	%l3
	or	%o4,	%i4,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i6,	%g5,	%i2
	brnz,a	%o5,	loop_1638
	mulscc	%o3,	%l5,	%l4
	taddcctv	%o6,	0x199A,	%g1
	taddcctv	%l0,	%g4,	%i0
loop_1638:
	sdivcc	%i3,	0x12DA,	%i7
	fmovde	%icc,	%f30,	%f2
	xnorcc	%o0,	%g3,	%l1
	tsubcctv	%g2,	0x044B,	%o2
	smul	%l6,	%o1,	%o7
	udivcc	%g7,	0x1A4A,	%g6
	fpsub16	%f14,	%f6,	%f24
	nop
	setx	loop_1639,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i1,	%l2,	%o4
	sub	%l3,	%i4,	%i5
loop_1639:
	array8	%g5,	%i2,	%i6
	addcc	%o3,	0x1753,	%o5
	ldsh	[%l7 + 0x72],	%l5
	fmuld8sux16	%f21,	%f8,	%f28
	bg,pt	%icc,	loop_1640
	sll	%l4,	0x13,	%g1
	edge16n	%o6,	%l0,	%g4
	mulscc	%i0,	%i3,	%o0
loop_1640:
	fmovsleu	%xcc,	%f30,	%f13
	sdivcc	%g3,	0x146A,	%i7
	smulcc	%l1,	0x1F74,	%o2
	set	0x54, %o3
	lda	[%l7 + %o3] 0x80,	%f8
	fone	%f28
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	fors	%f15,	%f2,	%f26
	and	%o1,	%o7,	%l6
	movneg	%xcc,	%g6,	%g7
	umulcc	%i1,	0x1ED7,	%l2
	bgu,pt	%icc,	loop_1641
	fmul8ulx16	%f8,	%f8,	%f10
	subcc	%o4,	%l3,	%i5
	fpsub16s	%f13,	%f27,	%f8
loop_1641:
	sir	0x0F58
	ba	%xcc,	loop_1642
	addccc	%i4,	%i2,	%i6
	movne	%xcc,	%o3,	%o5
	udivx	%l5,	0x0EE1,	%l4
loop_1642:
	fmovsge	%xcc,	%f3,	%f27
	orncc	%g1,	0x0DDD,	%g5
	movleu	%icc,	%o6,	%l0
	sdivcc	%g4,	0x0266,	%i0
	fandnot2	%f10,	%f24,	%f26
	subcc	%o0,	0x00E1,	%i3
	fmovrsgez	%g3,	%f16,	%f5
	andcc	%l1,	0x1CC9,	%i7
	bvc	%xcc,	loop_1643
	ldub	[%l7 + 0x5E],	%o2
	alignaddrl	%o1,	%o7,	%g2
	movne	%icc,	%g6,	%l6
loop_1643:
	array8	%i1,	%l2,	%g7
	sdiv	%o4,	0x1945,	%l3
	popc	%i5,	%i4
	stb	%i6,	[%l7 + 0x49]
	sethi	0x18B1,	%i2
	sra	%o3,	%o5,	%l4
	sllx	%l5,	0x1C,	%g5
	move	%xcc,	%o6,	%g1
	movgu	%xcc,	%l0,	%i0
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x66] %asi,	%g4
	movpos	%xcc,	%o0,	%i3
	xorcc	%g3,	0x0251,	%i7
	or	%l1,	0x09CD,	%o1
	udivx	%o2,	0x1D45,	%o7
	fmovsge	%xcc,	%f20,	%f18
	ble,pn	%xcc,	loop_1644
	sllx	%g6,	%l6,	%g2
	addcc	%l2,	0x1FAF,	%g7
	siam	0x0
loop_1644:
	nop
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bcs	%icc,	loop_1645
	be,a,pn	%icc,	loop_1646
	sll	%i1,	0x1F,	%l3
	nop
	setx	loop_1647,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1645:
	fmovrdgez	%i5,	%f22,	%f24
loop_1646:
	ta	%icc,	0x1
	movrlez	%o4,	0x08C,	%i4
loop_1647:
	fmovdg	%icc,	%f17,	%f22
	taddcc	%i6,	%i2,	%o5
	orncc	%l4,	%o3,	%l5
	movleu	%icc,	%g5,	%o6
	tg	%icc,	0x3
	move	%icc,	%g1,	%l0
	xnorcc	%g4,	0x0C40,	%o0
	orcc	%i3,	%i0,	%i7
	sra	%l1,	%g3,	%o2
	orncc	%o1,	0x05F6,	%o7
	array32	%l6,	%g2,	%g6
	fxnors	%f31,	%f25,	%f6
	movvc	%xcc,	%g7,	%l2
	and	%i1,	0x1112,	%l3
	and	%o4,	0x04E0,	%i4
	flush	%l7 + 0x18
	tcs	%xcc,	0x3
	udiv	%i5,	0x03C7,	%i2
	fmovsleu	%icc,	%f1,	%f7
	sdiv	%i6,	0x1E6D,	%l4
	fnand	%f4,	%f6,	%f10
	sll	%o5,	0x17,	%o3
	faligndata	%f4,	%f14,	%f30
	edge8n	%l5,	%o6,	%g5
	and	%l0,	%g4,	%g1
	array16	%o0,	%i3,	%i0
	fcmpes	%fcc1,	%f16,	%f10
	edge16	%l1,	%i7,	%g3
	movneg	%xcc,	%o1,	%o7
	fcmple32	%f26,	%f22,	%l6
	fbule	%fcc2,	loop_1648
	fandnot2s	%f7,	%f0,	%f2
	xnorcc	%g2,	0x13A9,	%g6
	subccc	%o2,	0x06A4,	%g7
loop_1648:
	ldsh	[%l7 + 0x76],	%i1
	fxnors	%f15,	%f11,	%f3
	sdiv	%l3,	0x1F65,	%o4
	fcmpne32	%f18,	%f30,	%i4
	fbg	%fcc3,	loop_1649
	edge16l	%i5,	%i2,	%l2
	fbe,a	%fcc1,	loop_1650
	addcc	%l4,	0x12A1,	%o5
loop_1649:
	alignaddrl	%o3,	%i6,	%o6
	tle	%xcc,	0x4
loop_1650:
	fmovsvc	%icc,	%f11,	%f10
	fnands	%f14,	%f7,	%f11
	sllx	%l5,	%l0,	%g4
	movrgez	%g1,	%g5,	%i3
	edge16l	%i0,	%o0,	%i7
	for	%f12,	%f2,	%f26
	tn	%xcc,	0x0
	fblg,a	%fcc1,	loop_1651
	fmul8x16	%f12,	%f8,	%f16
	add	%l1,	0x004F,	%o1
	addcc	%o7,	0x1F0D,	%l6
loop_1651:
	addcc	%g2,	%g6,	%o2
	tpos	%icc,	0x4
	fmul8x16	%f20,	%f6,	%f6
	fcmpgt32	%f14,	%f24,	%g3
	fmovrdne	%g7,	%f12,	%f10
	fbl,a	%fcc2,	loop_1652
	fandnot2s	%f30,	%f17,	%f28
	membar	0x6E
	tcc	%icc,	0x3
loop_1652:
	ba,a	loop_1653
	movgu	%icc,	%l3,	%o4
	flush	%l7 + 0x30
	udivcc	%i4,	0x056C,	%i1
loop_1653:
	sdivx	%i2,	0x0C8A,	%i5
	taddcctv	%l4,	0x1F40,	%l2
	tle	%icc,	0x2
	tl	%xcc,	0x2
	edge32	%o3,	%o5,	%i6
	bne	%icc,	loop_1654
	ldsw	[%l7 + 0x64],	%o6
	bn,a	loop_1655
	movpos	%icc,	%l0,	%l5
loop_1654:
	xor	%g4,	%g5,	%i3
	fnegd	%f28,	%f30
loop_1655:
	fandnot2	%f6,	%f6,	%f24
	tge	%xcc,	0x4
	bne,a,pn	%xcc,	loop_1656
	srlx	%g1,	0x0F,	%i0
	ldd	[%l7 + 0x38],	%i6
	tvs	%xcc,	0x0
loop_1656:
	sdivcc	%o0,	0x0D8F,	%l1
	movre	%o1,	0x09B,	%o7
	fnors	%f18,	%f22,	%f17
	addccc	%l6,	0x1B2B,	%g6
	fbn,a	%fcc0,	loop_1657
	andcc	%g2,	%g3,	%o2
	tl	%icc,	0x5
	umulcc	%g7,	%l3,	%o4
loop_1657:
	and	%i1,	0x0516,	%i4
	tne	%icc,	0x1
	fblg	%fcc3,	loop_1658
	fmovsge	%xcc,	%f7,	%f25
	xor	%i5,	%l4,	%l2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x5C] %asi,	%f0
loop_1658:
	movpos	%xcc,	%i2,	%o5
	orn	%i6,	%o6,	%o3
	fxnors	%f1,	%f31,	%f1
	movrlez	%l5,	0x135,	%g4
	fble	%fcc0,	loop_1659
	fsrc2s	%f0,	%f5
	movne	%xcc,	%l0,	%g5
	fnor	%f8,	%f8,	%f24
loop_1659:
	nop
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	fmovsleu	%xcc,	%f25,	%f27
	orncc	%i3,	0x076E,	%i0
	movvc	%icc,	%o0,	%i7
	brnz,a	%l1,	loop_1660
	movn	%icc,	%o1,	%l6
	ldsh	[%l7 + 0x0E],	%o7
	tcs	%xcc,	0x3
loop_1660:
	edge16l	%g6,	%g3,	%o2
	tne	%icc,	0x0
	alignaddrl	%g2,	%l3,	%g7
	movle	%xcc,	%o4,	%i1
	subccc	%i5,	%i4,	%l4
	fbl	%fcc3,	loop_1661
	lduw	[%l7 + 0x68],	%l2
	udiv	%o5,	0x1FE3,	%i6
	subc	%o6,	0x18D1,	%o3
loop_1661:
	movg	%icc,	%i2,	%g4
	brgez	%l5,	loop_1662
	fmuld8ulx16	%f10,	%f7,	%f22
	subccc	%g5,	%g1,	%i3
	tcs	%xcc,	0x5
loop_1662:
	tvs	%xcc,	0x2
	fmovdcs	%icc,	%f30,	%f31
	sub	%i0,	%l0,	%o0
	fmovsvs	%xcc,	%f0,	%f13
	bl,a,pn	%icc,	loop_1663
	bgu	%icc,	loop_1664
	xnor	%i7,	%o1,	%l6
	fpmerge	%f8,	%f27,	%f6
loop_1663:
	popc	%l1,	%o7
loop_1664:
	fmul8x16al	%f4,	%f4,	%f6
	add	%g3,	0x1D03,	%o2
	sll	%g2,	0x17,	%g6
	std	%l2,	[%l7 + 0x48]
	fpsub16	%f2,	%f28,	%f28
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x28] %asi,	%g7
	tsubcctv	%o4,	%i5,	%i4
	xorcc	%i1,	%l2,	%l4
	fmovdpos	%xcc,	%f2,	%f0
	movge	%icc,	%o5,	%o6
	sllx	%o3,	0x0F,	%i6
	call	loop_1665
	tsubcctv	%g4,	0x1E40,	%i2
	movleu	%icc,	%g5,	%g1
	tvs	%xcc,	0x6
loop_1665:
	nop
	set	0x54, %g7
	ldsba	[%l7 + %g7] 0x14,	%i3
	fnot2	%f8,	%f14
	subcc	%i0,	%l5,	%l0
	tneg	%icc,	0x5
	movcc	%icc,	%i7,	%o1
	ble,pt	%icc,	loop_1666
	orn	%l6,	0x1D66,	%l1
	udivx	%o0,	0x07EA,	%g3
	edge8ln	%o2,	%o7,	%g6
loop_1666:
	udivx	%l3,	0x19E8,	%g2
	xnor	%o4,	%i5,	%g7
	fmovdvs	%xcc,	%f8,	%f24
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fornot2	%f24,	%f2,	%f6
	andncc	%i1,	%l2,	%i4
	movrgz	%l4,	0x0C0,	%o6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ldsh	[%l7 + 0x38],	%o3
	nop
	set	0x0C, %o7
	ldsh	[%l7 + %o7],	%i6
	fcmpd	%fcc3,	%f28,	%f8
	set	0x36, %i5
	lduha	[%l7 + %i5] 0x19,	%g4
	ta	%xcc,	0x7
	fble	%fcc2,	loop_1667
	array8	%o5,	%g5,	%g1
	fcmple16	%f0,	%f10,	%i2
	pdist	%f12,	%f0,	%f18
loop_1667:
	movn	%icc,	%i3,	%i0
	edge8	%l0,	%l5,	%o1
	fba	%fcc3,	loop_1668
	movneg	%icc,	%l6,	%i7
	sllx	%l1,	0x0D,	%g3
	subc	%o2,	0x1C35,	%o7
loop_1668:
	fmovdvs	%xcc,	%f18,	%f8
	fbue	%fcc0,	loop_1669
	andn	%o0,	%g6,	%g2
	fpmerge	%f31,	%f8,	%f30
	xnorcc	%l3,	0x1AD1,	%i5
loop_1669:
	fnors	%f14,	%f21,	%f4
	fmovrdgz	%g7,	%f10,	%f26
	movvc	%icc,	%i1,	%l2
	taddcctv	%o4,	0x0BD6,	%l4
	fmul8x16	%f2,	%f10,	%f18
	sdivx	%o6,	0x0211,	%i4
	fmovsle	%icc,	%f18,	%f28
	bcc,a,pn	%icc,	loop_1670
	ta	%xcc,	0x3
	bpos,pn	%icc,	loop_1671
	udiv	%i6,	0x0D52,	%o3
loop_1670:
	movneg	%icc,	%g4,	%g5
	sdivcc	%o5,	0x08E3,	%i2
loop_1671:
	swap	[%l7 + 0x7C],	%i3
	fmovdvs	%icc,	%f5,	%f10
	tcs	%xcc,	0x5
	movrlz	%g1,	0x267,	%i0
	fpsub32s	%f2,	%f5,	%f15
	fmuld8sux16	%f26,	%f3,	%f16
	mulscc	%l0,	0x0C1E,	%o1
	taddcctv	%l5,	0x115C,	%l6
	ba,a	loop_1672
	fbe,a	%fcc3,	loop_1673
	tle	%icc,	0x0
	fbu	%fcc1,	loop_1674
loop_1672:
	tgu	%icc,	0x0
loop_1673:
	edge16l	%i7,	%g3,	%o2
	tl	%xcc,	0x0
loop_1674:
	xnorcc	%l1,	%o0,	%o7
	fpadd16	%f14,	%f22,	%f30
	call	loop_1675
	alignaddr	%g6,	%l3,	%g2
	subc	%g7,	0x199B,	%i1
	movgu	%xcc,	%i5,	%l2
loop_1675:
	fmovsneg	%xcc,	%f6,	%f8
	brlez	%l4,	loop_1676
	andn	%o6,	0x0F7B,	%i4
	movgu	%xcc,	%i6,	%o3
	nop
	setx	loop_1677,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1676:
	fandnot1s	%f16,	%f7,	%f22
	xor	%o4,	0x1BE4,	%g5
	srax	%o5,	0x1E,	%i2
loop_1677:
	tvc	%xcc,	0x2
	bleu,a	loop_1678
	fabsd	%f20,	%f8
	movcc	%icc,	%g4,	%i3
	add	%i0,	%l0,	%g1
loop_1678:
	fmovda	%icc,	%f5,	%f17
	movpos	%icc,	%o1,	%l6
	fmovdg	%xcc,	%f27,	%f11
	movre	%i7,	0x3E1,	%g3
	sub	%l5,	%o2,	%o0
	movneg	%icc,	%o7,	%g6
	fbn,a	%fcc1,	loop_1679
	tge	%xcc,	0x4
	bg,pt	%icc,	loop_1680
	smulcc	%l1,	%l3,	%g7
loop_1679:
	membar	0x40
	fmovrdne	%i1,	%f12,	%f22
loop_1680:
	fmovsne	%icc,	%f0,	%f15
	ldx	[%l7 + 0x10],	%g2
	fpsub16	%f4,	%f16,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,pn	%xcc,	loop_1681
	orn	%i5,	0x1F05,	%l2
	bcs,a,pn	%xcc,	loop_1682
	edge32l	%l4,	%o6,	%i6
loop_1681:
	fmul8ulx16	%f12,	%f4,	%f2
	srlx	%i4,	0x14,	%o3
loop_1682:
	tvs	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	sta	%f22,	[%l7 + 0x2C] %asi
	fmovspos	%icc,	%f25,	%f18
	movvs	%icc,	%o4,	%g5
	fmovda	%icc,	%f14,	%f1
	addcc	%i2,	%g4,	%i3
	tvs	%icc,	0x5
	fpadd32	%f0,	%f0,	%f8
	srlx	%o5,	%i0,	%l0
	wr	%g0,	0x27,	%asi
	stba	%o1,	[%l7 + 0x55] %asi
	membar	#Sync
	array16	%g1,	%i7,	%g3
	fmovspos	%icc,	%f23,	%f20
	bge,a,pn	%icc,	loop_1683
	umulcc	%l5,	%l6,	%o0
	fmovdge	%icc,	%f21,	%f30
	movn	%icc,	%o2,	%g6
loop_1683:
	movleu	%xcc,	%l1,	%o7
	for	%f22,	%f8,	%f24
	tcc	%xcc,	0x6
	fmovdneg	%icc,	%f26,	%f9
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x68] %asi,	%f21
	movneg	%icc,	%l3,	%g7
	movpos	%icc,	%g2,	%i5
	bl	%xcc,	loop_1684
	movl	%xcc,	%l2,	%l4
	fmovsne	%xcc,	%f16,	%f6
	edge32ln	%i1,	%i6,	%i4
loop_1684:
	edge8ln	%o6,	%o3,	%g5
	andn	%o4,	0x1EA7,	%i2
	sir	0x1C82
	sdivcc	%i3,	0x009E,	%g4
	movleu	%icc,	%o5,	%l0
	tcs	%xcc,	0x1
	tge	%icc,	0x4
	bg,pn	%xcc,	loop_1685
	mulscc	%o1,	%g1,	%i0
	brnz,a	%g3,	loop_1686
	edge16n	%l5,	%i7,	%l6
loop_1685:
	membar	0x6E
	nop
	set	0x28, %i4
	stw	%o2,	[%l7 + %i4]
loop_1686:
	smulcc	%o0,	%l1,	%g6
	orncc	%l3,	%o7,	%g2
	fmovdvs	%icc,	%f5,	%f15
	bvs,a,pn	%xcc,	loop_1687
	fmul8x16	%f14,	%f26,	%f2
	movge	%icc,	%g7,	%i5
	or	%l4,	0x1976,	%i1
loop_1687:
	swap	[%l7 + 0x30],	%i6
	fpadd16s	%f1,	%f14,	%f4
	fbe,a	%fcc2,	loop_1688
	edge16	%i4,	%o6,	%l2
	edge16	%g5,	%o3,	%i2
	fpsub16	%f22,	%f10,	%f8
loop_1688:
	umulcc	%i3,	0x0105,	%g4
	sllx	%o4,	0x01,	%o5
	fnot2	%f20,	%f12
	tl	%icc,	0x5
	fnors	%f16,	%f19,	%f7
	tcc	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	sta	%f25,	[%l7 + 0x10] %asi
	movrne	%l0,	0x164,	%g1
	fors	%f25,	%f8,	%f3
	fbue	%fcc1,	loop_1689
	udivx	%i0,	0x0177,	%o1
	fmovrsne	%g3,	%f0,	%f18
	andncc	%i7,	%l6,	%l5
loop_1689:
	addcc	%o0,	0x132D,	%l1
	array8	%o2,	%g6,	%o7
	nop
	setx loop_1690, %l0, %l1
	jmpl %l1, %g2
	edge8l	%g7,	%i5,	%l3
	tvc	%xcc,	0x7
	tle	%xcc,	0x1
loop_1690:
	movn	%xcc,	%i1,	%i6
	sethi	0x0115,	%l4
	movg	%xcc,	%o6,	%i4
	bneg,pn	%xcc,	loop_1691
	bvc,a,pn	%icc,	loop_1692
	fabss	%f4,	%f7
	tcs	%xcc,	0x2
loop_1691:
	ba,a,pn	%xcc,	loop_1693
loop_1692:
	addc	%l2,	0x1668,	%g5
	bge,a	%xcc,	loop_1694
	tcs	%icc,	0x5
loop_1693:
	brgez,a	%i2,	loop_1695
	addccc	%o3,	%g4,	%i3
loop_1694:
	movrlez	%o5,	%l0,	%g1
	tne	%xcc,	0x6
loop_1695:
	addccc	%i0,	%o4,	%o1
	fbu,a	%fcc1,	loop_1696
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f26,	%f22
	fnegd	%f24,	%f10
loop_1696:
	movrgez	%i7,	0x01D,	%l6
	flush	%l7 + 0x20
	tvc	%xcc,	0x7
	sdivcc	%g3,	0x0986,	%l5
	fmovrse	%l1,	%f1,	%f19
	set	0x3E, %i2
	lduba	[%l7 + %i2] 0x0c,	%o2
	nop
	setx	loop_1697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbug	%fcc0,	loop_1698
	popc	%g6,	%o0
	fandnot2s	%f5,	%f30,	%f30
loop_1697:
	taddcctv	%o7,	0x1AFF,	%g7
loop_1698:
	mova	%xcc,	%g2,	%i5
	edge16l	%l3,	%i1,	%i6
	fnand	%f0,	%f8,	%f0
	fmul8x16al	%f17,	%f11,	%f2
	fmovrslez	%o6,	%f30,	%f12
	fmovrdgez	%i4,	%f16,	%f0
	nop
	setx	loop_1699,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsa	%xcc,	%f22,	%f1
	set	0x0C, %l5
	sta	%f10,	[%l7 + %l5] 0x14
loop_1699:
	popc	%l2,	%l4
	sllx	%i2,	0x0F,	%o3
	sub	%g5,	0x06A5,	%g4
	movrlez	%i3,	0x0C9,	%o5
	edge32l	%l0,	%g1,	%o4
	movcs	%xcc,	%i0,	%o1
	addcc	%l6,	%i7,	%l5
	xor	%l1,	0x1837,	%g3
	addc	%g6,	%o2,	%o7
	brlez	%o0,	loop_1700
	std	%g6,	[%l7 + 0x28]
	edge16n	%i5,	%l3,	%i1
	fmovrse	%i6,	%f30,	%f20
loop_1700:
	srl	%o6,	0x0D,	%i4
	movrne	%l2,	0x0CA,	%g2
	edge16ln	%l4,	%o3,	%i2
	srlx	%g4,	0x1B,	%i3
	subccc	%o5,	%g5,	%l0
	membar	0x4C
	bneg	%xcc,	loop_1701
	xnorcc	%o4,	0x0371,	%i0
	edge16l	%g1,	%o1,	%l6
	fmovsge	%xcc,	%f7,	%f4
loop_1701:
	fcmpeq16	%f2,	%f22,	%l5
	movcs	%icc,	%l1,	%g3
	call	loop_1702
	tcs	%xcc,	0x1
	set	0x7D, %g5
	ldsba	[%l7 + %g5] 0x14,	%i7
loop_1702:
	fnegs	%f31,	%f5
	edge16l	%g6,	%o2,	%o7
	movg	%icc,	%g7,	%o0
	movn	%xcc,	%l3,	%i1
	nop
	setx	loop_1703,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%xcc,	%i5,	%i6
	fnegd	%f2,	%f10
	sra	%i4,	%o6,	%g2
loop_1703:
	fbug	%fcc2,	loop_1704
	sdivx	%l2,	0x00CC,	%o3
	edge16l	%i2,	%l4,	%i3
	fmovdge	%xcc,	%f1,	%f31
loop_1704:
	sllx	%o5,	%g5,	%g4
	std	%f12,	[%l7 + 0x70]
	for	%f4,	%f20,	%f22
	add	%l0,	0x10FC,	%o4
	nop
	setx	loop_1705,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%g1,	0x03,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc0,	loop_1706
loop_1705:
	tcc	%icc,	0x0
	alignaddr	%l6,	%o1,	%l1
	ta	%icc,	0x2
loop_1706:
	fzeros	%f12
	sll	%l5,	0x03,	%i7
	edge8	%g6,	%g3,	%o7
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
	andcc	%g7,	0x0E12,	%l3
	fandnot2	%f8,	%f30,	%f28
	prefetch	[%l7 + 0x54],	 0x2
	fors	%f4,	%f20,	%f6
	bneg	loop_1707
	flush	%l7 + 0x60
	movne	%icc,	%i1,	%i5
	or	%i6,	0x005E,	%i4
loop_1707:
	tcc	%xcc,	0x0
	set	0x70, %g1
	ldswa	[%l7 + %g1] 0x19,	%o6
	fmovsle	%xcc,	%f21,	%f1
	move	%xcc,	%o0,	%l2
	fbug,a	%fcc0,	loop_1708
	fmovda	%xcc,	%f17,	%f16
	sdivcc	%g2,	0x1FA6,	%i2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x24] %asi,	%f12
loop_1708:
	movrgz	%o3,	%i3,	%o5
	tcs	%xcc,	0x6
	fmovsvc	%icc,	%f3,	%f4
	fmovrsgez	%g5,	%f14,	%f20
	ldsh	[%l7 + 0x38],	%l4
	tpos	%icc,	0x3
	set	0x3A, %o6
	lduba	[%l7 + %o6] 0x04,	%g4
	edge16l	%l0,	%g1,	%o4
	xnorcc	%l6,	%i0,	%o1
	tle	%icc,	0x4
	edge8	%l1,	%l5,	%i7
	fbn,a	%fcc0,	loop_1709
	fmovda	%xcc,	%f7,	%f10
	tcc	%icc,	0x5
	movrgz	%g6,	%o7,	%o2
loop_1709:
	tpos	%icc,	0x6
	srl	%g7,	0x1D,	%g3
	wr	%g0,	0x19,	%asi
	sta	%f1,	[%l7 + 0x1C] %asi
	tg	%icc,	0x2
	movleu	%xcc,	%i1,	%l3
	movgu	%icc,	%i6,	%i4
	fmovrdlez	%i5,	%f30,	%f8
	movrgez	%o0,	0x085,	%l2
	fbn,a	%fcc2,	loop_1710
	sethi	0x033C,	%o6
	bneg,pn	%icc,	loop_1711
	std	%f16,	[%l7 + 0x10]
loop_1710:
	andn	%i2,	%o3,	%g2
	fba	%fcc0,	loop_1712
loop_1711:
	fbug	%fcc0,	loop_1713
	fmovsge	%xcc,	%f8,	%f27
	movgu	%xcc,	%i3,	%o5
loop_1712:
	std	%f6,	[%l7 + 0x68]
loop_1713:
	fmuld8sux16	%f5,	%f3,	%f4
	fmovsne	%xcc,	%f21,	%f20
	fmovrse	%g5,	%f17,	%f22
	xnor	%g4,	0x0EE1,	%l4
	movrgez	%g1,	0x2A4,	%l0
	sir	0x0899
	ta	%xcc,	0x0
	for	%f18,	%f8,	%f20
	srlx	%o4,	0x10,	%i0
	bneg,a	%xcc,	loop_1714
	tgu	%xcc,	0x7
	movcc	%icc,	%l6,	%l1
	array16	%l5,	%o1,	%i7
loop_1714:
	edge32n	%o7,	%o2,	%g6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g3
	orcc	%g7,	%l3,	%i1
	fmovdcs	%icc,	%f23,	%f4
	fzeros	%f0
	movneg	%xcc,	%i4,	%i6
	tvc	%icc,	0x6
	array32	%i5,	%l2,	%o6
	movvs	%xcc,	%i2,	%o0
	fble	%fcc0,	loop_1715
	tn	%icc,	0x4
	fnand	%f10,	%f6,	%f8
	movrgz	%g2,	%o3,	%o5
loop_1715:
	andn	%g5,	0x0C6D,	%i3
	stw	%g4,	[%l7 + 0x24]
	fcmpgt32	%f18,	%f10,	%l4
	be,a,pn	%xcc,	loop_1716
	brnz,a	%g1,	loop_1717
	fsrc1	%f16,	%f10
	or	%o4,	%i0,	%l0
loop_1716:
	xnor	%l1,	%l6,	%l5
loop_1717:
	tsubcc	%i7,	0x031A,	%o1
	fmovsn	%xcc,	%f16,	%f0
	fxors	%f11,	%f11,	%f3
	wr	%g0,	0x88,	%asi
	stha	%o7,	[%l7 + 0x0E] %asi
	movpos	%xcc,	%o2,	%g3
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x53] %asi,	%g7
	tne	%icc,	0x3
	fone	%f26
	flush	%l7 + 0x78
	fmovscc	%xcc,	%f9,	%f30
	tvs	%xcc,	0x4
	ld	[%l7 + 0x74],	%f18
	tl	%xcc,	0x4
	edge16l	%g6,	%i1,	%i4
	tl	%icc,	0x2
	sdiv	%l3,	0x1CB2,	%i6
	tleu	%icc,	0x2
	sir	0x1E92
	tn	%xcc,	0x3
	flush	%l7 + 0x2C
	movrlz	%l2,	0x248,	%i5
	subc	%o6,	%o0,	%g2
	fmovrsgz	%o3,	%f22,	%f21
	nop
	setx	loop_1718,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%i2,	%g5,	%o5
	fones	%f16
	ta	%icc,	0x2
loop_1718:
	swap	[%l7 + 0x0C],	%i3
	tne	%xcc,	0x0
	fbug,a	%fcc2,	loop_1719
	tl	%icc,	0x6
	fmovdn	%xcc,	%f4,	%f26
	bgu,a,pn	%icc,	loop_1720
loop_1719:
	movne	%icc,	%g4,	%g1
	movrgez	%o4,	0x2F9,	%l4
	fcmpne16	%f18,	%f30,	%l0
loop_1720:
	fpsub16s	%f7,	%f10,	%f25
	fmovsn	%xcc,	%f4,	%f30
	std	%f0,	[%l7 + 0x58]
	xorcc	%l1,	%i0,	%l6
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%i6
	fmovrdlz	%o1,	%f30,	%f30
	fpadd16	%f4,	%f28,	%f26
	fornot2	%f2,	%f14,	%f2
	ld	[%l7 + 0x18],	%f15
	movne	%xcc,	%o7,	%o2
	movle	%xcc,	%l5,	%g7
	ldd	[%l7 + 0x18],	%g2
	fcmped	%fcc0,	%f26,	%f28
	tleu	%xcc,	0x4
	tleu	%icc,	0x5
	xor	%g6,	%i4,	%i1
	fmovrsne	%l3,	%f25,	%f31
	edge32ln	%i6,	%l2,	%i5
	edge16	%o6,	%o0,	%g2
	edge8ln	%i2,	%g5,	%o5
	addccc	%o3,	%g4,	%g1
	sll	%i3,	%l4,	%l0
	bn,pt	%icc,	loop_1721
	andcc	%l1,	0x1B21,	%i0
	brgez,a	%o4,	loop_1722
	fandnot1s	%f0,	%f19,	%f1
loop_1721:
	edge32ln	%l6,	%o1,	%i7
	tle	%icc,	0x6
loop_1722:
	andn	%o2,	%l5,	%g7
	xnor	%g3,	%o7,	%i4
	srlx	%g6,	%l3,	%i6
	array32	%i1,	%l2,	%o6
	edge8	%o0,	%i5,	%g2
	array32	%g5,	%o5,	%i2
	alignaddr	%g4,	%g1,	%o3
	xorcc	%i3,	%l0,	%l1
	fbg	%fcc3,	loop_1723
	st	%f31,	[%l7 + 0x68]
	bvc,a	loop_1724
	sra	%i0,	0x0F,	%o4
loop_1723:
	tvc	%icc,	0x4
	ldstub	[%l7 + 0x17],	%l4
loop_1724:
	brgez	%l6,	loop_1725
	fmovspos	%xcc,	%f3,	%f9
	subc	%o1,	0x09B9,	%i7
	edge8l	%l5,	%o2,	%g7
loop_1725:
	tne	%xcc,	0x3
	fmovd	%f24,	%f26
	addc	%g3,	0x14CA,	%o7
	tvs	%xcc,	0x2
	udivcc	%i4,	0x0962,	%l3
	fmovsge	%xcc,	%f20,	%f13
	umulcc	%g6,	%i1,	%l2
	movrgez	%o6,	%o0,	%i6
	array32	%i5,	%g5,	%g2
	fmovdge	%xcc,	%f7,	%f0
	nop
	set	0x22, %l4
	ldsb	[%l7 + %l4],	%o5
	fandnot1s	%f11,	%f17,	%f21
	bvc,a,pn	%icc,	loop_1726
	fors	%f31,	%f29,	%f28
	mulscc	%g4,	0x19CC,	%i2
	fone	%f4
loop_1726:
	brgz	%g1,	loop_1727
	fmovdcc	%icc,	%f29,	%f29
	movg	%xcc,	%i3,	%o3
	bge,a,pt	%xcc,	loop_1728
loop_1727:
	udivcc	%l0,	0x0D9D,	%i0
	bg,pn	%icc,	loop_1729
	movge	%icc,	%l1,	%o4
loop_1728:
	fbu,a	%fcc2,	loop_1730
	movge	%xcc,	%l6,	%l4
loop_1729:
	movvs	%icc,	%o1,	%l5
	stb	%o2,	[%l7 + 0x13]
loop_1730:
	subccc	%g7,	%g3,	%i7
	tpos	%icc,	0x4
	bneg,a,pn	%icc,	loop_1731
	move	%icc,	%o7,	%l3
	bne,pn	%icc,	loop_1732
	or	%g6,	%i1,	%i4
loop_1731:
	fbule,a	%fcc1,	loop_1733
	movleu	%xcc,	%o6,	%o0
loop_1732:
	bshuffle	%f26,	%f16,	%f6
	move	%icc,	%l2,	%i6
loop_1733:
	movrlz	%i5,	0x158,	%g5
	alignaddrl	%o5,	%g4,	%i2
	taddcc	%g1,	%g2,	%o3
	umul	%l0,	%i3,	%i0
	tn	%icc,	0x7
	fmovsge	%xcc,	%f24,	%f4
	movleu	%icc,	%o4,	%l1
	tl	%icc,	0x4
	bn	loop_1734
	sllx	%l4,	0x0B,	%l6
	edge16	%o1,	%o2,	%l5
	fbe	%fcc2,	loop_1735
loop_1734:
	bge,a	%icc,	loop_1736
	fpadd16s	%f9,	%f16,	%f15
	tneg	%icc,	0x1
loop_1735:
	fpsub16s	%f3,	%f14,	%f29
loop_1736:
	ldsb	[%l7 + 0x4E],	%g7
	movrlez	%i7,	0x139,	%o7
	bn	loop_1737
	fbl	%fcc3,	loop_1738
	xnor	%g3,	0x1B36,	%l3
	fnot1s	%f13,	%f14
loop_1737:
	ldsw	[%l7 + 0x70],	%i1
loop_1738:
	ldsw	[%l7 + 0x68],	%i4
	udivx	%g6,	0x10C3,	%o0
	addcc	%o6,	%i6,	%i5
	tpos	%icc,	0x4
	orcc	%l2,	%g5,	%g4
	alignaddr	%i2,	%o5,	%g1
	fbuge,a	%fcc3,	loop_1739
	lduw	[%l7 + 0x3C],	%o3
	bvc,a	loop_1740
	alignaddrl	%l0,	%g2,	%i3
loop_1739:
	edge32n	%o4,	%l1,	%i0
	mova	%xcc,	%l6,	%o1
loop_1740:
	lduh	[%l7 + 0x5A],	%l4
	fble,a	%fcc1,	loop_1741
	bl	%icc,	loop_1742
	mulscc	%l5,	%o2,	%g7
	sth	%i7,	[%l7 + 0x48]
loop_1741:
	taddcctv	%g3,	%l3,	%o7
loop_1742:
	tl	%xcc,	0x7
	fcmpne32	%f22,	%f22,	%i4
	tn	%icc,	0x3
	movvc	%icc,	%i1,	%g6
	pdist	%f10,	%f24,	%f0
	sethi	0x1E84,	%o6
	tne	%xcc,	0x4
	orn	%o0,	0x183A,	%i6
	sdiv	%i5,	0x0F81,	%g5
	fmovrdlez	%l2,	%f28,	%f30
	fbule,a	%fcc1,	loop_1743
	ld	[%l7 + 0x1C],	%f10
	fmovrslez	%g4,	%f9,	%f21
	edge32ln	%i2,	%g1,	%o5
loop_1743:
	stbar
	fmovrdlz	%l0,	%f26,	%f24
	edge16	%o3,	%i3,	%o4
	taddcctv	%g2,	0x0B9C,	%l1
	prefetch	[%l7 + 0x7C],	 0x2
	orncc	%i0,	%l6,	%o1
	wr	%g0,	0x0c,	%asi
	stxa	%l4,	[%l7 + 0x18] %asi
	nop
	set	0x72, %o1
	lduh	[%l7 + %o1],	%l5
	call	loop_1744
	movrlz	%g7,	%i7,	%o2
	fmovde	%icc,	%f21,	%f4
	mova	%icc,	%g3,	%l3
loop_1744:
	nop
	set	0x7B, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i4
	tcc	%xcc,	0x1
	tneg	%icc,	0x7
	udivx	%o7,	0x0C25,	%g6
	stw	%o6,	[%l7 + 0x44]
	sub	%o0,	%i1,	%i6
	fnegd	%f14,	%f20
	fbl	%fcc3,	loop_1745
	movcc	%xcc,	%i5,	%g5
	set	0x20, %o4
	lduwa	[%l7 + %o4] 0x04,	%g4
loop_1745:
	std	%l2,	[%l7 + 0x48]
	sdivx	%g1,	0x1EF7,	%o5
	fble	%fcc0,	loop_1746
	andn	%l0,	0x0FE6,	%o3
	call	loop_1747
	edge16	%i2,	%i3,	%o4
loop_1746:
	brlez,a	%l1,	loop_1748
	fcmple32	%f6,	%f24,	%i0
loop_1747:
	nop
	set	0x6B, %g3
	lduba	[%l7 + %g3] 0x19,	%l6
loop_1748:
	and	%o1,	0x0931,	%l4
	tle	%xcc,	0x3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x24] %asi,	%f9
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l5
	edge16l	%g7,	%g2,	%i7
	udivcc	%g3,	0x0781,	%l3
	fpsub16s	%f4,	%f9,	%f28
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x14,	%f0
	srl	%i4,	%o7,	%g6
	udivx	%o2,	0x003B,	%o6
	fxors	%f11,	%f17,	%f3
	movrlez	%o0,	0x01B,	%i6
	brgez,a	%i5,	loop_1749
	fmovsg	%xcc,	%f9,	%f22
	tgu	%xcc,	0x5
	tn	%icc,	0x6
loop_1749:
	fble,a	%fcc2,	loop_1750
	bpos,a	loop_1751
	udivcc	%g5,	0x1AF7,	%g4
	set	0x7B, %i6
	ldstuba	[%l7 + %i6] 0x88,	%i1
loop_1750:
	fand	%f4,	%f12,	%f24
loop_1751:
	fbul,a	%fcc2,	loop_1752
	mulscc	%g1,	0x07AD,	%o5
	fmovsg	%icc,	%f1,	%f17
	fbu	%fcc0,	loop_1753
loop_1752:
	fmovrsne	%l2,	%f15,	%f15
	fpack16	%f14,	%f7
	wr	%g0,	0x04,	%asi
	sta	%f12,	[%l7 + 0x4C] %asi
loop_1753:
	fcmple16	%f30,	%f4,	%o3
	tsubcc	%l0,	0x1C8F,	%i2
	fbn,a	%fcc3,	loop_1754
	sethi	0x019E,	%o4
	fornot1s	%f10,	%f4,	%f26
	edge32ln	%l1,	%i3,	%i0
loop_1754:
	fmovdpos	%xcc,	%f16,	%f12
	fpadd16s	%f29,	%f1,	%f9
	edge16ln	%o1,	%l4,	%l5
	xnorcc	%l6,	%g7,	%i7
	edge8n	%g3,	%g2,	%i4
	tcs	%xcc,	0x6
	edge8l	%l3,	%o7,	%o2
	fpadd16	%f6,	%f22,	%f10
	fbul	%fcc1,	loop_1755
	andcc	%g6,	%o6,	%i6
	subccc	%i5,	%g5,	%o0
	movrne	%i1,	0x055,	%g1
loop_1755:
	orn	%g4,	%l2,	%o5
	alignaddrl	%l0,	%i2,	%o4
	flush	%l7 + 0x6C
	array16	%l1,	%i3,	%o3
	edge16n	%o1,	%l4,	%l5
	orcc	%i0,	0x0D82,	%g7
	wr	%g0,	0x18,	%asi
	stxa	%l6,	[%l7 + 0x08] %asi
	taddcctv	%g3,	0x10EF,	%i7
	movge	%xcc,	%i4,	%l3
	wr	%g0,	0x27,	%asi
	stda	%o6,	[%l7 + 0x78] %asi
	membar	#Sync
	ba,a	%icc,	loop_1756
	fbg	%fcc3,	loop_1757
	movn	%xcc,	%o2,	%g2
	udivcc	%o6,	0x0991,	%i6
loop_1756:
	tl	%xcc,	0x3
loop_1757:
	smulcc	%g6,	%g5,	%o0
	fornot1	%f28,	%f30,	%f2
	tl	%icc,	0x4
	bcc,pn	%icc,	loop_1758
	fbne,a	%fcc2,	loop_1759
	or	%i1,	%g1,	%g4
	mulscc	%l2,	0x0460,	%o5
loop_1758:
	srlx	%l0,	0x17,	%i2
loop_1759:
	bne	%xcc,	loop_1760
	addccc	%o4,	%i5,	%l1
	ta	%xcc,	0x4
	tvs	%icc,	0x1
loop_1760:
	edge8n	%i3,	%o1,	%o3
	array16	%l5,	%l4,	%g7
	tneg	%xcc,	0x5
	fmovrsne	%i0,	%f25,	%f27
	srax	%g3,	0x09,	%l6
	taddcc	%i4,	0x1044,	%l3
	bvc,a,pt	%xcc,	loop_1761
	move	%xcc,	%o7,	%o2
	sth	%g2,	[%l7 + 0x22]
	sllx	%i7,	%o6,	%i6
loop_1761:
	for	%f16,	%f8,	%f2
	brlez,a	%g6,	loop_1762
	or	%g5,	0x139B,	%o0
	fbue	%fcc0,	loop_1763
	fcmpgt32	%f16,	%f6,	%g1
loop_1762:
	movvc	%xcc,	%g4,	%l2
	srl	%i1,	0x0A,	%o5
loop_1763:
	nop
	wr	%g0,	0x88,	%asi
	stxa	%i2,	[%l7 + 0x68] %asi
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o4
	movrlz	%i5,	0x32E,	%l1
	mulx	%l0,	0x1D8C,	%i3
	set	0x38, %i0
	lda	[%l7 + %i0] 0x89,	%f27
	fbu	%fcc1,	loop_1764
	array8	%o3,	%l5,	%o1
	bneg,a,pn	%xcc,	loop_1765
	tsubcctv	%g7,	%i0,	%l4
loop_1764:
	edge32n	%g3,	%i4,	%l3
	xor	%o7,	%o2,	%l6
loop_1765:
	srl	%g2,	%o6,	%i7
	movgu	%xcc,	%g6,	%i6
	fxnor	%f26,	%f26,	%f14
	edge8l	%o0,	%g1,	%g5
	fsrc1	%f20,	%f2
	fmovdg	%icc,	%f8,	%f10
	movge	%icc,	%l2,	%g4
	movn	%icc,	%i1,	%i2
	fmovdcs	%xcc,	%f22,	%f5
	fpack32	%f28,	%f18,	%f4
	tne	%icc,	0x3
	movg	%icc,	%o4,	%o5
	movl	%icc,	%l1,	%i5
	ta	%xcc,	0x2
	tpos	%icc,	0x2
	edge8l	%l0,	%o3,	%i3
	andcc	%o1,	0x1AF7,	%g7
	andn	%i0,	0x06E4,	%l5
	tvc	%icc,	0x7
	array8	%l4,	%i4,	%l3
	stbar
	fbuge	%fcc2,	loop_1766
	std	%f16,	[%l7 + 0x40]
	bleu,a	loop_1767
	and	%o7,	%g3,	%o2
loop_1766:
	fpsub16s	%f27,	%f10,	%f23
	subccc	%l6,	%g2,	%o6
loop_1767:
	array32	%i7,	%g6,	%o0
	fmovdneg	%icc,	%f11,	%f6
	movvs	%xcc,	%g1,	%g5
	xnorcc	%l2,	0x0A66,	%i6
	fbne,a	%fcc0,	loop_1768
	fcmpeq32	%f4,	%f12,	%g4
	fbl,a	%fcc2,	loop_1769
	fmovdn	%icc,	%f19,	%f31
loop_1768:
	fbug,a	%fcc2,	loop_1770
	sllx	%i1,	%o4,	%o5
loop_1769:
	std	%f28,	[%l7 + 0x68]
	movre	%i2,	0x2F7,	%l1
loop_1770:
	movn	%icc,	%i5,	%l0
	fsrc1	%f16,	%f22
	movn	%xcc,	%i3,	%o1
	lduw	[%l7 + 0x0C],	%o3
	orcc	%g7,	%i0,	%l5
	movgu	%xcc,	%l4,	%l3
	and	%i4,	%o7,	%g3
	movrgez	%l6,	0x066,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f21,	%f22
	fbn,a	%fcc2,	loop_1771
	movne	%xcc,	%g2,	%i7
	fba,a	%fcc3,	loop_1772
	movvs	%xcc,	%o6,	%g6
loop_1771:
	andncc	%o0,	%g5,	%g1
	movrne	%i6,	0x106,	%l2
loop_1772:
	fmovrslz	%g4,	%f0,	%f14
	fmovde	%xcc,	%f2,	%f26
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o4
	tvc	%icc,	0x2
	array8	%o5,	%i1,	%l1
	edge32l	%i2,	%l0,	%i5
	fpsub16	%f26,	%f28,	%f22
	tpos	%xcc,	0x6
	set	0x58, %i3
	lduwa	[%l7 + %i3] 0x89,	%i3
	brnz	%o1,	loop_1773
	mulscc	%g7,	0x1DBF,	%i0
	lduw	[%l7 + 0x10],	%l5
	sub	%o3,	0x119C,	%l4
loop_1773:
	fmovse	%icc,	%f19,	%f27
	array8	%i4,	%l3,	%o7
	addc	%l6,	%g3,	%o2
	fmovdl	%icc,	%f27,	%f18
	fmovda	%icc,	%f31,	%f21
	ldsb	[%l7 + 0x0C],	%g2
	edge16	%o6,	%i7,	%g6
	tpos	%xcc,	0x1
	bpos,a	%icc,	loop_1774
	fbul,a	%fcc2,	loop_1775
	add	%g5,	0x1D06,	%g1
	srl	%i6,	%o0,	%g4
loop_1774:
	tpos	%icc,	0x3
loop_1775:
	bneg,a	%icc,	loop_1776
	and	%l2,	0x185A,	%o5
	brnz	%o4,	loop_1777
	addcc	%l1,	%i1,	%l0
loop_1776:
	fmovsn	%xcc,	%f21,	%f1
	fand	%f22,	%f8,	%f20
loop_1777:
	tneg	%icc,	0x6
	edge16n	%i2,	%i5,	%o1
	xorcc	%g7,	%i0,	%l5
	bvs,a,pt	%icc,	loop_1778
	movcs	%xcc,	%i3,	%l4
	udiv	%i4,	0x15FD,	%l3
	fpadd16s	%f8,	%f30,	%f12
loop_1778:
	edge8ln	%o7,	%l6,	%o3
	smulcc	%g3,	0x09B8,	%o2
	and	%g2,	0x1E06,	%i7
	edge32n	%g6,	%o6,	%g1
	fmovdle	%xcc,	%f4,	%f14
	fmovdcc	%icc,	%f16,	%f27
	tcc	%xcc,	0x3
	edge8ln	%g5,	%i6,	%g4
	set	0x2C, %i1
	lduwa	[%l7 + %i1] 0x04,	%o0
	call	loop_1779
	movre	%l2,	0x2D6,	%o4
	tcs	%xcc,	0x2
	fcmped	%fcc2,	%f30,	%f4
loop_1779:
	movgu	%icc,	%o5,	%l1
	movleu	%xcc,	%l0,	%i2
	movrgz	%i1,	%i5,	%g7
	sdivcc	%o1,	0x1FCF,	%l5
	popc	%i0,	%i3
	alignaddr	%i4,	%l4,	%o7
	set	0x50, %g2
	stxa	%l3,	[%l7 + %g2] 0x89
	fornot1s	%f30,	%f3,	%f28
	wr	%g0,	0x27,	%asi
	stba	%l6,	[%l7 + 0x51] %asi
	membar	#Sync
	membar	0x4C
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%o3
	subcc	%g3,	0x177F,	%o2
	sir	0x064F
	brz	%i7,	loop_1780
	movgu	%icc,	%g6,	%o6
	wr	%g0,	0x89,	%asi
	stba	%g2,	[%l7 + 0x73] %asi
loop_1780:
	mulx	%g1,	%g5,	%i6
	fmovsle	%xcc,	%f21,	%f29
	fmovrse	%o0,	%f10,	%f3
	fmovscs	%xcc,	%f10,	%f16
	xnor	%l2,	0x143E,	%g4
	edge8n	%o4,	%l1,	%o5
	tle	%xcc,	0x6
	movcs	%icc,	%i2,	%l0
	fba	%fcc3,	loop_1781
	bne	%xcc,	loop_1782
	fnegs	%f12,	%f11
	fmul8ulx16	%f24,	%f26,	%f26
loop_1781:
	edge32l	%i5,	%g7,	%i1
loop_1782:
	fmuld8ulx16	%f15,	%f22,	%f0
	edge32ln	%l5,	%i0,	%i3
	bge,pt	%xcc,	loop_1783
	fmovspos	%xcc,	%f10,	%f22
	fmovde	%xcc,	%f1,	%f6
	andcc	%i4,	%o1,	%o7
loop_1783:
	nop
	setx	loop_1784,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%l4,	%l6,	%o3
	udivcc	%l3,	0x03AF,	%o2
	fbug,a	%fcc0,	loop_1785
loop_1784:
	ta	%xcc,	0x6
	edge8ln	%i7,	%g3,	%g6
	std	%f14,	[%l7 + 0x40]
loop_1785:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x55] %asi,	%g2
	array8	%g1,	%g5,	%o6
	tl	%icc,	0x1
	edge32l	%o0,	%l2,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g4,	%o4,	%l1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x15,	%f16
	fsrc1s	%f11,	%f28
	andcc	%o5,	0x1CBA,	%l0
	fone	%f30
	movvs	%icc,	%i5,	%i2
	fcmple32	%f2,	%f6,	%g7
	bgu,a	loop_1786
	ldsw	[%l7 + 0x28],	%l5
	srax	%i1,	%i0,	%i4
	array8	%o1,	%o7,	%i3
loop_1786:
	popc	0x0B1C,	%l6
	taddcc	%l4,	%o3,	%l3
	taddcctv	%i7,	%g3,	%g6
	edge32ln	%o2,	%g2,	%g1
	membar	0x62
	subccc	%o6,	%g5,	%l2
	andcc	%o0,	%g4,	%i6
	ldub	[%l7 + 0x7C],	%o4
	fbg	%fcc0,	loop_1787
	movle	%xcc,	%o5,	%l1
	fbne,a	%fcc2,	loop_1788
	fbug	%fcc3,	loop_1789
loop_1787:
	orcc	%i5,	%l0,	%g7
	smulcc	%i2,	0x0FB4,	%i1
loop_1788:
	fmovsn	%xcc,	%f2,	%f5
loop_1789:
	fnot1s	%f26,	%f23
	edge32l	%l5,	%i4,	%i0
	subccc	%o7,	%o1,	%l6
	fnot1	%f22,	%f4
	movrne	%i3,	%l4,	%o3
	fbug,a	%fcc1,	loop_1790
	xnorcc	%i7,	%g3,	%g6
	movpos	%xcc,	%o2,	%g2
	movpos	%xcc,	%l3,	%o6
loop_1790:
	fmovdleu	%icc,	%f30,	%f16
	fmovdcs	%icc,	%f31,	%f4
	bgu,a	loop_1791
	fbg	%fcc1,	loop_1792
	fcmped	%fcc2,	%f24,	%f8
	orn	%g5,	0x184E,	%g1
loop_1791:
	fmovdpos	%xcc,	%f27,	%f9
loop_1792:
	ble	loop_1793
	xnor	%o0,	%l2,	%i6
	andn	%g4,	%o5,	%o4
	sdivx	%i5,	0x11F1,	%l0
loop_1793:
	sir	0x1DEE
	fcmpne16	%f4,	%f4,	%l1
	movrgez	%g7,	0x025,	%i1
	set	0x6C, %o0
	sta	%f15,	[%l7 + %o0] 0x14
	set	0x6C, %g6
	sta	%f12,	[%l7 + %g6] 0x14
	brgez	%l5,	loop_1794
	fcmpeq32	%f16,	%f26,	%i4
	movne	%icc,	%i2,	%i0
	ldd	[%l7 + 0x58],	%f18
loop_1794:
	tsubcc	%o7,	%o1,	%l6
	edge8ln	%i3,	%o3,	%l4
	set	0x19, %g4
	lduba	[%l7 + %g4] 0x10,	%g3
	movrne	%g6,	0x2E0,	%i7
	edge32l	%g2,	%o2,	%l3
	tge	%icc,	0x0
	nop
	setx	loop_1795,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%o6,	0x11E0,	%g5
	and	%o0,	0x15CB,	%g1
	umul	%l2,	%i6,	%g4
loop_1795:
	ta	%icc,	0x3
	fmul8x16al	%f16,	%f18,	%f18
	movne	%icc,	%o4,	%i5
	movvc	%xcc,	%l0,	%o5
	movn	%icc,	%l1,	%g7
	stw	%i1,	[%l7 + 0x44]
	sth	%l5,	[%l7 + 0x66]
	tn	%icc,	0x7
	orncc	%i2,	0x0EC2,	%i0
	edge16ln	%o7,	%o1,	%i4
	orcc	%l6,	%o3,	%l4
	taddcc	%i3,	%g6,	%g3
	movrlez	%i7,	%g2,	%l3
	tne	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o2
	movg	%xcc,	%o6,	%o0
	addc	%g5,	%l2,	%i6
	tvs	%xcc,	0x0
	mulx	%g4,	0x09C6,	%o4
	fnors	%f9,	%f26,	%f11
	edge8ln	%g1,	%i5,	%o5
	ble,pt	%xcc,	loop_1796
	xnor	%l0,	0x1FB5,	%l1
	movpos	%icc,	%i1,	%g7
	membar	0x6D
loop_1796:
	fmovsne	%xcc,	%f24,	%f4
	edge32	%l5,	%i0,	%i2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%o1
	bleu	%xcc,	loop_1797
	smul	%o7,	0x0EAC,	%l6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x28] %asi,	%i4
loop_1797:
	movvs	%icc,	%l4,	%o3
	ldstub	[%l7 + 0x43],	%g6
	fors	%f15,	%f8,	%f13
	sethi	0x063E,	%g3
	tne	%icc,	0x5
	taddcc	%i7,	%g2,	%i3
	movcs	%icc,	%l3,	%o2
	set	0x7C, %l0
	lduwa	[%l7 + %l0] 0x88,	%o6
	ldx	[%l7 + 0x48],	%o0
	brz	%l2,	loop_1798
	fsrc1s	%f3,	%f14
	call	loop_1799
	movcc	%icc,	%g5,	%g4
loop_1798:
	fbuge	%fcc0,	loop_1800
	fmovdvc	%xcc,	%f17,	%f22
loop_1799:
	fornot2	%f24,	%f26,	%f12
	ba,a	%xcc,	loop_1801
loop_1800:
	array32	%i6,	%g1,	%o4
	andcc	%i5,	%o5,	%l1
	andn	%i1,	%g7,	%l0
loop_1801:
	brlez,a	%l5,	loop_1802
	fmovrdlez	%i0,	%f10,	%f6
	tleu	%xcc,	0x2
	movrgez	%o1,	%i2,	%l6
loop_1802:
	popc	%o7,	%i4
	fcmple16	%f30,	%f24,	%o3
	addcc	%g6,	0x0A72,	%l4
	edge8	%i7,	%g2,	%g3
	bneg,a	loop_1803
	ta	%xcc,	0x5
	alignaddrl	%l3,	%o2,	%i3
	brgez,a	%o6,	loop_1804
loop_1803:
	subcc	%o0,	%l2,	%g4
	tne	%xcc,	0x2
	alignaddrl	%i6,	%g5,	%o4
loop_1804:
	movcc	%icc,	%i5,	%o5
	addcc	%g1,	0x112D,	%l1
	fxors	%f5,	%f10,	%f1
	fbule	%fcc0,	loop_1805
	ldsb	[%l7 + 0x42],	%g7
	movrgz	%i1,	0x24D,	%l0
	srax	%i0,	0x02,	%l5
loop_1805:
	srax	%i2,	0x0C,	%o1
	fcmps	%fcc1,	%f24,	%f23
	andncc	%l6,	%o7,	%o3
	fcmpne16	%f20,	%f24,	%i4
	sdivx	%g6,	0x107C,	%i7
	movg	%icc,	%g2,	%g3
	edge8n	%l3,	%o2,	%l4
	fbn,a	%fcc1,	loop_1806
	sethi	0x0002,	%o6
	srl	%i3,	0x15,	%l2
	fors	%f22,	%f23,	%f9
loop_1806:
	edge8	%o0,	%i6,	%g4
	edge16	%g5,	%o4,	%o5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f0
	addcc	%i5,	%l1,	%g1
	fmovsle	%icc,	%f2,	%f3
	bne,a	loop_1807
	tvc	%icc,	0x5
	siam	0x7
	orncc	%g7,	0x1C6F,	%i1
loop_1807:
	sllx	%l0,	%i0,	%i2
	tvs	%xcc,	0x4
	set	0x08, %l2
	swapa	[%l7 + %l2] 0x81,	%o1
	ble	loop_1808
	orn	%l6,	0x06F5,	%l5
	andncc	%o3,	%o7,	%g6
	fnot1s	%f4,	%f10
loop_1808:
	nop
	set	0x70, %o3
	lduha	[%l7 + %o3] 0x15,	%i4
	bvs,pn	%icc,	loop_1809
	alignaddrl	%g2,	%i7,	%g3
	subccc	%l3,	%l4,	%o6
	andcc	%o2,	0x1AF0,	%l2
loop_1809:
	membar	0x53
	membar	0x6E
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i3
	fcmped	%fcc3,	%f4,	%f10
	movcs	%icc,	%i6,	%o0
	smul	%g4,	%o4,	%o5
	movrlez	%i5,	%l1,	%g1
	ldd	[%l7 + 0x50],	%f8
	alignaddr	%g5,	%g7,	%i1
	ta	%xcc,	0x6
	umulcc	%i0,	0x19F3,	%i2
	orn	%o1,	0x00F6,	%l0
	te	%xcc,	0x0
	edge32ln	%l6,	%o3,	%l5
	fmovrse	%g6,	%f22,	%f26
	udivx	%o7,	0x1F08,	%i4
	sdivx	%g2,	0x0F3E,	%i7
	ldx	[%l7 + 0x10],	%l3
	tcs	%icc,	0x4
	fcmps	%fcc0,	%f24,	%f21
	set	0x50, %i7
	stda	%l4,	[%l7 + %i7] 0xeb
	membar	#Sync
	fble	%fcc3,	loop_1810
	umulcc	%o6,	%g3,	%l2
	fbul	%fcc2,	loop_1811
	fxnors	%f1,	%f17,	%f0
loop_1810:
	fbug	%fcc0,	loop_1812
	fmovsl	%xcc,	%f4,	%f6
loop_1811:
	alignaddr	%o2,	%i3,	%o0
	fmul8x16al	%f26,	%f6,	%f8
loop_1812:
	fmovsne	%xcc,	%f9,	%f0
	or	%g4,	0x03FE,	%o4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%i6
	fnors	%f20,	%f27,	%f7
	wr	%g0,	0x2f,	%asi
	stba	%o5,	[%l7 + 0x2E] %asi
	membar	#Sync
	stw	%l1,	[%l7 + 0x40]
	stbar
	fpadd16	%f0,	%f6,	%f2
	fmovdneg	%icc,	%f20,	%f21
	fpsub16s	%f1,	%f21,	%f23
	movleu	%xcc,	%i5,	%g5
	edge16ln	%g7,	%i1,	%g1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x30] %asi,	%f4
	bshuffle	%f0,	%f14,	%f14
	set	0x78, %g7
	lduwa	[%l7 + %g7] 0x18,	%i2
	movvc	%icc,	%i0,	%o1
	fbule	%fcc3,	loop_1813
	tle	%icc,	0x4
	umulcc	%l0,	0x05C5,	%o3
	orcc	%l6,	0x1A16,	%g6
loop_1813:
	or	%o7,	0x17D0,	%l5
	sll	%g2,	0x1A,	%i4
	ldd	[%l7 + 0x48],	%i6
	tneg	%xcc,	0x6
	movne	%icc,	%l4,	%l3
	movn	%xcc,	%o6,	%l2
	fmovspos	%icc,	%f5,	%f14
	fpsub16s	%f28,	%f3,	%f24
	xor	%g3,	%o2,	%o0
	taddcc	%i3,	%o4,	%g4
	taddcctv	%i6,	%l1,	%i5
	srlx	%o5,	%g5,	%g7
	umul	%i1,	0x1964,	%g1
	edge8l	%i2,	%i0,	%l0
	ldsb	[%l7 + 0x4F],	%o1
	mulx	%l6,	%o3,	%o7
	udiv	%l5,	0x01F6,	%g6
	udivx	%i4,	0x120E,	%g2
	edge16n	%l4,	%i7,	%o6
	nop
	set	0x34, %i5
	lduw	[%l7 + %i5],	%l2
	movvc	%icc,	%l3,	%o2
	edge8ln	%o0,	%g3,	%o4
	movl	%xcc,	%g4,	%i3
	alignaddrl	%l1,	%i5,	%o5
	andcc	%i6,	0x10D1,	%g7
	movcs	%xcc,	%i1,	%g5
	edge32l	%g1,	%i0,	%i2
	mulscc	%o1,	%l0,	%l6
	brgz	%o7,	loop_1814
	movneg	%xcc,	%l5,	%o3
	umul	%i4,	0x0A28,	%g2
	fsrc2	%f6,	%f0
loop_1814:
	sir	0x031E
	fcmps	%fcc1,	%f23,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g6,	%i7,	%o6
	fmul8x16au	%f2,	%f15,	%f24
	brz,a	%l2,	loop_1815
	add	%l4,	%l3,	%o2
	fmovsgu	%icc,	%f27,	%f17
	xor	%o0,	0x16D7,	%o4
loop_1815:
	subccc	%g4,	0x07C7,	%g3
	array32	%i3,	%i5,	%o5
	sdivcc	%l1,	0x0767,	%g7
	fmovdpos	%xcc,	%f13,	%f15
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x18,	 0x3
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i6
	sllx	%g5,	%g1,	%i0
	fcmple32	%f6,	%f2,	%i2
	bcc,a	loop_1816
	movle	%icc,	%o1,	%l0
	taddcctv	%l6,	%l5,	%o3
	edge16	%o7,	%i4,	%g6
loop_1816:
	alignaddrl	%i7,	%g2,	%l2
	fmovdl	%xcc,	%f10,	%f2
	fnot1s	%f15,	%f1
	tpos	%icc,	0x0
	ldstub	[%l7 + 0x15],	%o6
	ldsw	[%l7 + 0x34],	%l3
	umul	%o2,	%o0,	%l4
	fcmpeq16	%f30,	%f8,	%o4
	move	%xcc,	%g3,	%g4
	movle	%xcc,	%i5,	%o5
	tne	%icc,	0x3
	movgu	%xcc,	%l1,	%i3
	bshuffle	%f20,	%f20,	%f6
	tsubcc	%i1,	%g7,	%g5
	addc	%i6,	0x0E1F,	%g1
	or	%i2,	%i0,	%l0
	umul	%o1,	%l6,	%o3
	brz,a	%o7,	loop_1817
	movge	%xcc,	%l5,	%i4
	movvs	%icc,	%g6,	%i7
	fbge,a	%fcc2,	loop_1818
loop_1817:
	movne	%icc,	%l2,	%g2
	bleu,a	%icc,	loop_1819
	udivcc	%o6,	0x185C,	%o2
loop_1818:
	bgu	%xcc,	loop_1820
	sllx	%l3,	0x15,	%o0
loop_1819:
	alignaddrl	%l4,	%o4,	%g3
	set	0x60, %i2
	sta	%f22,	[%l7 + %i2] 0x15
loop_1820:
	fmul8x16	%f17,	%f24,	%f4
	ldub	[%l7 + 0x63],	%g4
	fmul8x16al	%f3,	%f17,	%f22
	movrne	%i5,	0x2F0,	%o5
	fnegs	%f8,	%f10
	xor	%l1,	%i1,	%i3
	fpsub32s	%f7,	%f5,	%f18
	movrgz	%g5,	%i6,	%g1
	xor	%i2,	0x0D07,	%i0
	fxor	%f18,	%f10,	%f2
	set	0x76, %l5
	ldsba	[%l7 + %l5] 0x10,	%g7
	fandnot2s	%f19,	%f29,	%f18
	fpack16	%f20,	%f5
	sub	%o1,	%l0,	%l6
	fsrc2s	%f24,	%f5
	movrlez	%o7,	0x367,	%l5
	movvc	%icc,	%o3,	%i4
	movcs	%icc,	%g6,	%l2
	fbg	%fcc3,	loop_1821
	bcc	loop_1822
	popc	%g2,	%o6
	array16	%i7,	%o2,	%o0
loop_1821:
	subcc	%l4,	0x1435,	%o4
loop_1822:
	tpos	%xcc,	0x3
	tsubcctv	%g3,	%g4,	%i5
	membar	0x29
	movn	%xcc,	%o5,	%l3
	andcc	%l1,	%i3,	%g5
	movvc	%xcc,	%i6,	%g1
	xorcc	%i2,	%i0,	%g7
	nop
	setx loop_1823, %l0, %l1
	jmpl %l1, %i1
	movpos	%xcc,	%o1,	%l6
	bgu	%icc,	loop_1824
	stbar
loop_1823:
	fmul8sux16	%f16,	%f0,	%f4
	fandnot1s	%f0,	%f1,	%f3
loop_1824:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f22,	%f24,	%f22
	mulx	%o7,	0x0F10,	%l0
	brlez,a	%l5,	loop_1825
	bpos,pt	%xcc,	loop_1826
	array32	%i4,	%g6,	%l2
	movrlz	%g2,	0x11B,	%o3
loop_1825:
	xnorcc	%i7,	%o6,	%o0
loop_1826:
	addcc	%o2,	%l4,	%g3
	xnor	%g4,	%i5,	%o5
	andncc	%l3,	%l1,	%o4
	addc	%i3,	0x1F38,	%g5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	orcc	%g1,	0x150B,	%i6
	edge32	%i2,	%g7,	%i0
	bleu	%xcc,	loop_1827
	add	%i1,	%o1,	%l6
	or	%l0,	%o7,	%i4
	addccc	%l5,	0x1215,	%l2
loop_1827:
	edge8n	%g2,	%g6,	%o3
	movgu	%icc,	%i7,	%o0
	movle	%icc,	%o6,	%l4
	orncc	%o2,	0x094A,	%g4
	tvc	%icc,	0x4
	alignaddrl	%i5,	%o5,	%g3
	umul	%l1,	0x1388,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f14,	%f22,	%f17
	mova	%xcc,	%i3,	%o4
	movle	%icc,	%g1,	%i6
	movre	%i2,	%g7,	%g5
	edge32n	%i1,	%o1,	%l6
	ldd	[%l7 + 0x28],	%l0
	fmuld8sux16	%f24,	%f5,	%f26
	wr	%g0,	0x27,	%asi
	stha	%o7,	[%l7 + 0x62] %asi
	membar	#Sync
	tsubcctv	%i0,	%i4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l5,	%g6,	%o3
	tneg	%icc,	0x1
	fbul,a	%fcc3,	loop_1828
	xnor	%i7,	0x1366,	%o0
	and	%o6,	%g2,	%l4
	pdist	%f12,	%f8,	%f20
loop_1828:
	nop
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x0c,	%o2
	move	%xcc,	%g4,	%i5
	add	%g3,	%l1,	%o5
	addccc	%i3,	0x07B3,	%o4
	taddcctv	%l3,	%g1,	%i6
	movge	%icc,	%g7,	%i2
	ldstub	[%l7 + 0x36],	%g5
	fpsub16s	%f15,	%f24,	%f19
	brz	%o1,	loop_1829
	tvc	%xcc,	0x1
	bge,a,pt	%xcc,	loop_1830
	movne	%xcc,	%i1,	%l6
loop_1829:
	brgz	%l0,	loop_1831
	movl	%icc,	%i0,	%i4
loop_1830:
	nop
	set	0x10, %g5
	ldswa	[%l7 + %g5] 0x04,	%l2
loop_1831:
	bleu,pn	%icc,	loop_1832
	fnegd	%f2,	%f4
	movrlz	%o7,	%l5,	%g6
	ldd	[%l7 + 0x40],	%i6
loop_1832:
	fbu	%fcc2,	loop_1833
	brnz,a	%o3,	loop_1834
	movneg	%xcc,	%o0,	%g2
	movrlez	%l4,	0x204,	%o2
loop_1833:
	fandnot2	%f4,	%f14,	%f14
loop_1834:
	smul	%g4,	%i5,	%o6
	movn	%icc,	%g3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l1,	%o4
	fble	%fcc2,	loop_1835
	tn	%xcc,	0x1
	std	%i2,	[%l7 + 0x08]
	subcc	%l3,	%i6,	%g7
loop_1835:
	tvs	%xcc,	0x6
	xnorcc	%g1,	%i2,	%o1
	addc	%i1,	0x0756,	%g5
	fabsd	%f10,	%f24
	movrlez	%l6,	0x38A,	%l0
	move	%xcc,	%i4,	%i0
	bpos,pt	%icc,	loop_1836
	ldsb	[%l7 + 0x48],	%o7
	bg,a,pn	%icc,	loop_1837
	sethi	0x031E,	%l2
loop_1836:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x12] %asi,	%g6
loop_1837:
	fmovse	%icc,	%f15,	%f9
	tsubcc	%i7,	0x055C,	%o3
	fblg,a	%fcc0,	loop_1838
	fbuge	%fcc3,	loop_1839
	ldsh	[%l7 + 0x14],	%o0
	tvs	%xcc,	0x4
loop_1838:
	sir	0x1B1D
loop_1839:
	movcs	%icc,	%l5,	%l4
	sub	%g2,	%o2,	%g4
	srl	%i5,	0x09,	%g3
	brz,a	%o6,	loop_1840
	edge32	%o5,	%l1,	%i3
	orncc	%l3,	%o4,	%i6
	udiv	%g1,	0x096A,	%g7
loop_1840:
	addccc	%o1,	0x1CAC,	%i2
	fblg	%fcc3,	loop_1841
	fmovsn	%xcc,	%f27,	%f17
	sdivx	%i1,	0x194C,	%g5
	udivcc	%l0,	0x0EC8,	%i4
loop_1841:
	xnorcc	%l6,	%o7,	%l2
	edge32	%g6,	%i0,	%i7
	lduh	[%l7 + 0x60],	%o0
	fba	%fcc3,	loop_1842
	edge32n	%l5,	%l4,	%g2
	ble,a	loop_1843
	fmovdn	%xcc,	%f11,	%f15
loop_1842:
	sdivx	%o3,	0x0A67,	%o2
	bl,a,pt	%icc,	loop_1844
loop_1843:
	tsubcctv	%g4,	0x1CA0,	%g3
	alignaddr	%i5,	%o6,	%l1
	fnot1	%f28,	%f8
loop_1844:
	edge16	%o5,	%l3,	%i3
	fmovse	%icc,	%f30,	%f27
	popc	%o4,	%i6
	tvs	%icc,	0x7
	fmovrdlz	%g7,	%f22,	%f14
	fcmpne16	%f28,	%f22,	%o1
	edge32	%g1,	%i1,	%g5
	movrgez	%i2,	0x370,	%i4
	taddcctv	%l6,	0x00CA,	%o7
	fmovscs	%xcc,	%f10,	%f1
	movne	%icc,	%l0,	%g6
	fbge	%fcc3,	loop_1845
	fbug	%fcc3,	loop_1846
	srax	%i0,	0x1D,	%i7
	smulcc	%l2,	%o0,	%l4
loop_1845:
	sdivx	%l5,	0x0C87,	%g2
loop_1846:
	edge8	%o3,	%g4,	%g3
	movvc	%icc,	%i5,	%o6
	tl	%icc,	0x0
	array16	%l1,	%o2,	%l3
	fmovdneg	%icc,	%f5,	%f11
	ldub	[%l7 + 0x4F],	%o5
	bleu,pn	%icc,	loop_1847
	fone	%f20
	movrgz	%i3,	0x054,	%i6
	subccc	%o4,	%o1,	%g1
loop_1847:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i1,	%g5
	fsrc1	%f10,	%f6
	edge32l	%g7,	%i2,	%l6
	fnands	%f23,	%f23,	%f5
	edge16	%i4,	%o7,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f0,	%f0,	%f6
	wr	%g0,	0xea,	%asi
	stda	%i0,	[%l7 + 0x78] %asi
	membar	#Sync
	fand	%f28,	%f28,	%f20
	swap	[%l7 + 0x4C],	%i7
	fbo,a	%fcc0,	loop_1848
	membar	0x23
	sir	0x10DD
	lduw	[%l7 + 0x0C],	%l0
loop_1848:
	alignaddr	%l2,	%l4,	%o0
	edge16l	%l5,	%g2,	%o3
	be,a,pt	%icc,	loop_1849
	fcmpne16	%f4,	%f18,	%g3
	movpos	%icc,	%g4,	%i5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%l1
loop_1849:
	srlx	%o6,	%l3,	%o5
	set	0x1E, %o6
	lduha	[%l7 + %o6] 0x19,	%i3
	fbue	%fcc2,	loop_1850
	fmovsgu	%icc,	%f17,	%f11
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x11,	%i6
loop_1850:
	ldsh	[%l7 + 0x6E],	%o4
	movle	%xcc,	%o2,	%o1
	array8	%g1,	%i1,	%g7
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i2
	fmovspos	%icc,	%f15,	%f24
	tl	%xcc,	0x7
	bgu,a	loop_1851
	popc	0x1B9E,	%l6
	tge	%xcc,	0x2
	andcc	%i4,	%o7,	%g5
loop_1851:
	movvs	%xcc,	%i0,	%i7
	sdivcc	%g6,	0x1754,	%l0
	movn	%xcc,	%l4,	%l2
	nop
	setx	loop_1852,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fones	%f31
	brlez,a	%o0,	loop_1853
	fblg	%fcc0,	loop_1854
loop_1852:
	xnorcc	%l5,	0x1AB2,	%g2
	edge16	%g3,	%o3,	%i5
loop_1853:
	tpos	%icc,	0x6
loop_1854:
	fbne	%fcc3,	loop_1855
	fandnot2	%f2,	%f18,	%f22
	movle	%icc,	%l1,	%o6
	fnot2s	%f8,	%f8
loop_1855:
	fandnot2	%f8,	%f4,	%f18
	alignaddr	%g4,	%o5,	%i3
	fands	%f7,	%f9,	%f19
	fmovdn	%xcc,	%f10,	%f15
	andcc	%i6,	0x14C5,	%l3
	edge32n	%o2,	%o4,	%g1
	fcmple16	%f12,	%f10,	%i1
	fmovdge	%xcc,	%f8,	%f30
	movneg	%xcc,	%o1,	%g7
	lduw	[%l7 + 0x68],	%i2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l6,	%o7
	ldd	[%l7 + 0x30],	%i4
	edge16l	%g5,	%i0,	%i7
	tl	%icc,	0x7
	udivcc	%l0,	0x187C,	%g6
	fmovsvs	%icc,	%f30,	%f17
	tpos	%xcc,	0x2
	te	%xcc,	0x2
	movneg	%xcc,	%l2,	%o0
	andncc	%l5,	%l4,	%g3
	movvs	%icc,	%g2,	%i5
	movne	%xcc,	%o3,	%o6
	sra	%g4,	%l1,	%i3
	set	0x72, %l6
	ldstuba	[%l7 + %l6] 0x10,	%o5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x64] %asi,	%i6
	srl	%o2,	0x0B,	%o4
	sllx	%l3,	%i1,	%g1
	edge8l	%g7,	%i2,	%o1
	sllx	%l6,	0x05,	%i4
	movrlz	%g5,	0x3E8,	%o7
	subcc	%i7,	%l0,	%i0
	add	%l2,	0x0A53,	%g6
	move	%icc,	%l5,	%l4
	xnorcc	%g3,	0x11DA,	%g2
	set	0x30, %o1
	ldstuba	[%l7 + %o1] 0x89,	%i5
	tneg	%icc,	0x7
	stw	%o3,	[%l7 + 0x74]
	sub	%o0,	0x13A2,	%o6
	fmovrdlez	%l1,	%f2,	%f10
	movgu	%xcc,	%g4,	%i3
	edge32ln	%o5,	%o2,	%o4
	edge8n	%l3,	%i1,	%g1
	fmovscc	%icc,	%f22,	%f17
	fmovsleu	%xcc,	%f6,	%f19
	membar	0x29
	sdivx	%g7,	0x17B6,	%i2
	tsubcc	%i6,	%o1,	%i4
	movvc	%xcc,	%l6,	%g5
	sir	0x1E2B
	sll	%o7,	0x01,	%l0
	bl,pt	%icc,	loop_1856
	ldub	[%l7 + 0x7F],	%i0
	set	0x60, %l4
	ldsha	[%l7 + %l4] 0x81,	%i7
loop_1856:
	ldstub	[%l7 + 0x7B],	%l2
	popc	%l5,	%l4
	bcs,a	loop_1857
	fmovrde	%g3,	%f0,	%f10
	srlx	%g2,	0x04,	%i5
	alignaddrl	%g6,	%o3,	%o6
loop_1857:
	addcc	%o0,	0x138B,	%g4
	fmovrdlez	%i3,	%f22,	%f28
	movne	%xcc,	%l1,	%o2
	nop
	setx	loop_1858,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x0229,	%o4
	movpos	%xcc,	%l3,	%i1
	edge16n	%o5,	%g7,	%i2
loop_1858:
	fxors	%f18,	%f25,	%f0
	movg	%xcc,	%g1,	%o1
	taddcctv	%i6,	%l6,	%g5
	fsrc2s	%f29,	%f4
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%o7
	fexpand	%f10,	%f2
	fmovrse	%l0,	%f6,	%f10
	andncc	%i0,	%l2,	%i7
	st	%f23,	[%l7 + 0x14]
	sra	%l5,	0x03,	%g3
	bne,a,pt	%icc,	loop_1859
	xor	%g2,	%i5,	%g6
	movgu	%xcc,	%l4,	%o3
	stx	%o6,	[%l7 + 0x60]
loop_1859:
	array16	%o0,	%g4,	%i3
	movrlez	%o2,	0x2E7,	%o4
	brgz,a	%l3,	loop_1860
	brgz,a	%l1,	loop_1861
	sdivcc	%i1,	0x0F66,	%g7
	tge	%xcc,	0x7
loop_1860:
	xorcc	%i2,	0x0CC2,	%g1
loop_1861:
	subc	%o1,	0x0199,	%i6
	tcs	%xcc,	0x2
	xor	%l6,	0x17D9,	%o5
	or	%i4,	0x089B,	%g5
	tneg	%icc,	0x0
	ta	%xcc,	0x4
	edge16	%o7,	%l0,	%l2
	tpos	%xcc,	0x4
	movrlz	%i0,	0x376,	%i7
	tg	%xcc,	0x7
	fmuld8sux16	%f31,	%f21,	%f0
	set	0x16, %o4
	lduha	[%l7 + %o4] 0x88,	%l5
	sub	%g2,	0x0048,	%g3
	ldsh	[%l7 + 0x0C],	%i5
	ble,a,pn	%icc,	loop_1862
	flush	%l7 + 0x20
	set	0x7C, %o2
	lda	[%l7 + %o2] 0x18,	%f6
loop_1862:
	fmovrsgez	%l4,	%f28,	%f0
	sll	%o3,	0x0A,	%o6
	tsubcc	%g6,	%o0,	%g4
	tpos	%icc,	0x7
	fmovsgu	%xcc,	%f15,	%f13
	std	%i2,	[%l7 + 0x08]
	udivcc	%o4,	0x0FC1,	%o2
	sdiv	%l3,	0x0A7C,	%l1
	set	0x7A, %g3
	ldsha	[%l7 + %g3] 0x15,	%g7
	fmovdcc	%icc,	%f25,	%f3
	subcc	%i2,	%g1,	%o1
	andn	%i1,	0x16FD,	%l6
	orncc	%i6,	%o5,	%i4
	orn	%g5,	%o7,	%l0
	udivcc	%l2,	0x1C68,	%i7
	mulscc	%i0,	%g2,	%g3
	fmul8ulx16	%f4,	%f2,	%f0
	array16	%i5,	%l5,	%l4
	edge8l	%o6,	%g6,	%o0
	movneg	%icc,	%g4,	%i3
	std	%f28,	[%l7 + 0x50]
	movrgz	%o4,	%o2,	%o3
	edge8l	%l3,	%g7,	%i2
	te	%xcc,	0x5
	fornot2	%f20,	%f6,	%f28
	fbge	%fcc1,	loop_1863
	edge16ln	%g1,	%l1,	%o1
	fpsub16s	%f28,	%f27,	%f26
	fbue,a	%fcc2,	loop_1864
loop_1863:
	prefetch	[%l7 + 0x50],	 0x3
	orncc	%i1,	%i6,	%o5
	fmovsvs	%icc,	%f18,	%f9
loop_1864:
	stbar
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	array16	%l6,	%o7,	%l0
	fmovdle	%xcc,	%f8,	%f7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x44] %asi,	%f10
	tvc	%xcc,	0x6
	bpos,a,pt	%icc,	loop_1865
	xnor	%l2,	0x113D,	%i7
	tpos	%xcc,	0x2
	fmovdneg	%xcc,	%f11,	%f26
loop_1865:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x10,	%i0,	%g2
	udiv	%g5,	0x04E7,	%g3
	sth	%l5,	[%l7 + 0x28]
	siam	0x1
	sll	%l4,	%i5,	%g6
	sir	0x11FE
	movg	%xcc,	%o0,	%g4
	fcmple16	%f28,	%f28,	%i3
	fandnot2	%f30,	%f4,	%f16
	stbar
	ldsw	[%l7 + 0x50],	%o6
	alignaddrl	%o4,	%o3,	%o2
	alignaddrl	%l3,	%g7,	%g1
	subc	%i2,	0x06A8,	%o1
	wr	%g0,	0x80,	%asi
	sta	%f3,	[%l7 + 0x34] %asi
	mulscc	%i1,	%l1,	%o5
	bn,a	%xcc,	loop_1866
	edge8n	%i4,	%i6,	%o7
	sdivcc	%l0,	0x1336,	%l2
	subc	%l6,	0x18A7,	%i0
loop_1866:
	fmovrsgez	%g2,	%f30,	%f13
	srl	%g5,	0x1C,	%i7
	tsubcctv	%l5,	0x0552,	%g3
	fbu	%fcc0,	loop_1867
	fmovscs	%xcc,	%f29,	%f30
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x14
loop_1867:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x14] %asi,	%f28
	nop
	set	0x2C, %i0
	lduw	[%l7 + %i0],	%l4
	ldstub	[%l7 + 0x79],	%g6
	edge32	%i5,	%o0,	%i3
	xnor	%o6,	%g4,	%o4
	alignaddrl	%o2,	%o3,	%g7
	addc	%l3,	%g1,	%i2
	fbo	%fcc0,	loop_1868
	bne,a	loop_1869
	taddcctv	%i1,	%o1,	%o5
	tg	%xcc,	0x3
loop_1868:
	fpsub32	%f24,	%f20,	%f28
loop_1869:
	srlx	%l1,	0x13,	%i4
	tleu	%xcc,	0x0
	tle	%icc,	0x1
	tvc	%xcc,	0x4
	or	%i6,	0x0F1D,	%o7
	movpos	%xcc,	%l0,	%l6
	bl	loop_1870
	fbule,a	%fcc0,	loop_1871
	tne	%icc,	0x5
	set	0x4B, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i0
loop_1870:
	nop
	wr	%g0,	0x27,	%asi
	stxa	%g2,	[%l7 + 0x48] %asi
	membar	#Sync
loop_1871:
	sdiv	%g5,	0x105B,	%l2
	tcs	%xcc,	0x3
	tcc	%xcc,	0x4
	edge8	%l5,	%g3,	%i7
	andn	%l4,	%g6,	%o0
	movvc	%icc,	%i5,	%o6
	fmovdleu	%xcc,	%f25,	%f18
	subc	%i3,	0x1F70,	%o4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g4
	andn	%o2,	%g7,	%o3
	addccc	%l3,	0x17A8,	%i2
	movl	%xcc,	%g1,	%o1
	sll	%i1,	%o5,	%i4
	fmovd	%f8,	%f8
	bne	%xcc,	loop_1872
	movleu	%icc,	%l1,	%o7
	ld	[%l7 + 0x70],	%f21
	fxnors	%f4,	%f31,	%f5
loop_1872:
	orn	%i6,	%l6,	%i0
	edge8ln	%l0,	%g2,	%l2
	fxnor	%f20,	%f4,	%f4
	fmovrdlez	%l5,	%f20,	%f2
	edge16n	%g5,	%g3,	%i7
	tn	%xcc,	0x0
	xnor	%g6,	0x0C9C,	%l4
	fcmpne16	%f16,	%f26,	%o0
	edge8n	%o6,	%i5,	%o4
	smulcc	%i3,	0x19E4,	%g4
	edge8n	%o2,	%o3,	%g7
	orncc	%l3,	0x1738,	%i2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%i1
	edge32l	%o1,	%o5,	%i4
	andncc	%o7,	%l1,	%l6
	fcmped	%fcc1,	%f26,	%f18
	movge	%xcc,	%i0,	%l0
	fpadd32s	%f21,	%f7,	%f31
	fand	%f12,	%f0,	%f24
	movg	%icc,	%i6,	%l2
	subc	%g2,	%l5,	%g3
	bg	loop_1873
	edge32ln	%g5,	%i7,	%l4
	tne	%xcc,	0x2
	fabss	%f3,	%f19
loop_1873:
	sllx	%o0,	%o6,	%g6
	movrlez	%i5,	0x13C,	%o4
	movcs	%icc,	%g4,	%o2
	fbug,a	%fcc0,	loop_1874
	movvs	%xcc,	%i3,	%g7
	edge8l	%l3,	%o3,	%g1
	edge32n	%i1,	%o1,	%i2
loop_1874:
	xnor	%o5,	%o7,	%l1
	xnor	%l6,	%i0,	%i4
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%l0
	edge32	%i6,	%l2,	%g2
	sethi	0x1425,	%g3
	sll	%l5,	%g5,	%l4
	fexpand	%f21,	%f10
	sllx	%i7,	0x16,	%o0
	mova	%icc,	%o6,	%g6
	array32	%i5,	%g4,	%o2
	ldsh	[%l7 + 0x08],	%o4
	fmovsg	%icc,	%f31,	%f1
	nop
	set	0x18, %i6
	stx	%i3,	[%l7 + %i6]
	set	0x70, %i1
	sta	%f8,	[%l7 + %i1] 0x04
	tl	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l3
	te	%xcc,	0x3
	set	0x4F, %g2
	lduba	[%l7 + %g2] 0x10,	%o3
	brlz	%g1,	loop_1875
	movcs	%xcc,	%g7,	%i1
	fnot1	%f10,	%f24
	movpos	%icc,	%i2,	%o5
loop_1875:
	sdiv	%o1,	0x0D42,	%l1
	movvs	%icc,	%o7,	%i0
	tpos	%icc,	0x5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%l0
	movgu	%xcc,	%i4,	%i6
	array32	%g2,	%l2,	%g3
	fmovsa	%xcc,	%f28,	%f11
	sll	%g5,	0x0F,	%l4
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	fbe	%fcc3,	loop_1876
	fcmpes	%fcc3,	%f1,	%f18
	set	0x28, %o0
	ldswa	[%l7 + %o0] 0x88,	%i7
loop_1876:
	fcmps	%fcc0,	%f21,	%f11
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x40] %asi,	%o6
	wr	%g0,	0x80,	%asi
	stba	%o0,	[%l7 + 0x5A] %asi
	orncc	%i5,	0x1613,	%g4
	fornot1	%f10,	%f0,	%f12
	mulx	%o2,	%o4,	%i3
	fbul,a	%fcc3,	loop_1877
	fxor	%f14,	%f20,	%f28
	fxors	%f5,	%f25,	%f26
	fpadd32s	%f26,	%f26,	%f28
loop_1877:
	ldstub	[%l7 + 0x27],	%l3
	movrlz	%g6,	0x352,	%g1
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x10
	addc	%o3,	%g7,	%i1
	fbuge	%fcc2,	loop_1878
	fble	%fcc0,	loop_1879
	sir	0x0F4E
	membar	0x42
loop_1878:
	umul	%o5,	0x061E,	%i2
loop_1879:
	addc	%l1,	%o7,	%o1
	umul	%l6,	%l0,	%i0
	and	%i6,	0x1C21,	%i4
	umul	%g2,	%g3,	%l2
	bshuffle	%f18,	%f28,	%f28
	array16	%g5,	%l5,	%l4
	add	%i7,	0x07AB,	%o6
	edge16n	%i5,	%o0,	%o2
	tn	%xcc,	0x6
	fmovda	%xcc,	%f4,	%f21
	nop
	setx	loop_1880,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x137B,	%g4
	edge8l	%i3,	%o4,	%g6
	fmul8sux16	%f10,	%f6,	%f30
loop_1880:
	fandnot2	%f16,	%f16,	%f22
	udivx	%g1,	0x1167,	%o3
	andn	%l3,	%g7,	%i1
	subc	%i2,	%o5,	%l1
	fcmpes	%fcc3,	%f1,	%f7
	fmovde	%icc,	%f0,	%f29
	movg	%icc,	%o1,	%o7
	and	%l6,	%i0,	%i6
	orcc	%i4,	0x1A75,	%g2
	alignaddr	%l0,	%l2,	%g5
	fmovsn	%icc,	%f0,	%f2
	umul	%g3,	0x0B74,	%l5
	sll	%i7,	0x1F,	%l4
	brgez,a	%i5,	loop_1881
	fornot2s	%f25,	%f10,	%f20
	edge8	%o0,	%o2,	%o6
	tl	%xcc,	0x6
loop_1881:
	movg	%xcc,	%g4,	%o4
	edge16l	%i3,	%g1,	%g6
	stw	%o3,	[%l7 + 0x4C]
	fexpand	%f23,	%f24
	tpos	%xcc,	0x2
	movrne	%g7,	%i1,	%l3
	movg	%xcc,	%i2,	%o5
	fbn	%fcc3,	loop_1882
	bn,a	%icc,	loop_1883
	fbne,a	%fcc3,	loop_1884
	subc	%l1,	%o7,	%o1
loop_1882:
	sdivcc	%l6,	0x0796,	%i6
loop_1883:
	xnorcc	%i0,	%i4,	%g2
loop_1884:
	and	%l0,	0x0243,	%g5
	bne,a	loop_1885
	fble,a	%fcc1,	loop_1886
	fornot1	%f10,	%f2,	%f0
	andn	%g3,	%l2,	%i7
loop_1885:
	tcs	%icc,	0x0
loop_1886:
	fbue	%fcc1,	loop_1887
	fmovsgu	%icc,	%f17,	%f7
	movleu	%icc,	%l5,	%i5
	set	0x29, %l1
	ldsba	[%l7 + %l1] 0x0c,	%o0
loop_1887:
	stb	%l4,	[%l7 + 0x2F]
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%o2
	tl	%xcc,	0x4
	xnorcc	%g4,	%o4,	%i3
	membar	0x00
	call	loop_1888
	subcc	%g1,	0x0066,	%g6
	andncc	%o6,	%g7,	%i1
	tn	%xcc,	0x3
loop_1888:
	tneg	%xcc,	0x2
	tgu	%icc,	0x4
	udivx	%l3,	0x07DA,	%o3
	te	%xcc,	0x2
	fmovd	%f14,	%f20
	addc	%o5,	0x1C9A,	%i2
	tvs	%icc,	0x5
	fnot2	%f18,	%f2
	movcc	%icc,	%o7,	%o1
	subc	%l6,	0x1863,	%l1
	set	0x78, %l0
	sta	%f28,	[%l7 + %l0] 0x18
	or	%i0,	0x0E8A,	%i4
	stb	%i6,	[%l7 + 0x1A]
	tg	%icc,	0x4
	mova	%xcc,	%g2,	%l0
	fbn	%fcc2,	loop_1889
	edge32l	%g3,	%g5,	%l2
	fbue	%fcc2,	loop_1890
	tle	%icc,	0x7
loop_1889:
	fpadd16s	%f1,	%f21,	%f11
	ld	[%l7 + 0x60],	%f10
loop_1890:
	sdiv	%l5,	0x037A,	%i7
	bl,a	loop_1891
	movge	%xcc,	%i5,	%o0
	movg	%xcc,	%l4,	%g4
	fbe	%fcc2,	loop_1892
loop_1891:
	tge	%icc,	0x7
	brnz,a	%o2,	loop_1893
	fors	%f9,	%f23,	%f6
loop_1892:
	ld	[%l7 + 0x0C],	%f28
	ldd	[%l7 + 0x58],	%i2
loop_1893:
	fone	%f16
	edge32l	%o4,	%g1,	%g6
	or	%g7,	0x1047,	%i1
	fnot2	%f30,	%f8
	srlx	%l3,	0x0E,	%o6
	fxnors	%f2,	%f5,	%f15
	fmovdcs	%xcc,	%f12,	%f9
	std	%f8,	[%l7 + 0x08]
	mulx	%o5,	%i2,	%o7
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o1
	edge8l	%o3,	%l6,	%l1
	sll	%i0,	0x05,	%i6
	xnor	%i4,	%g2,	%g3
	std	%f8,	[%l7 + 0x78]
	mulscc	%g5,	%l2,	%l5
	edge32n	%l0,	%i7,	%o0
	edge32ln	%l4,	%i5,	%g4
	addcc	%o2,	%i3,	%o4
	tsubcctv	%g6,	%g1,	%g7
	fbe	%fcc1,	loop_1894
	bg,a,pn	%xcc,	loop_1895
	movvc	%xcc,	%i1,	%l3
	movleu	%xcc,	%o5,	%o6
loop_1894:
	edge16	%o7,	%i2,	%o1
loop_1895:
	move	%xcc,	%l6,	%l1
	movg	%icc,	%i0,	%o3
	fpsub32	%f0,	%f2,	%f6
	and	%i4,	0x09D4,	%i6
	xnorcc	%g2,	0x0398,	%g3
	fpadd16	%f30,	%f8,	%f0
	st	%f7,	[%l7 + 0x3C]
	sllx	%g5,	%l2,	%l5
	sir	0x0CCA
	movn	%icc,	%i7,	%l0
	fbule,a	%fcc2,	loop_1896
	fcmpne32	%f10,	%f8,	%l4
	edge8l	%o0,	%i5,	%o2
	fmovdgu	%icc,	%f20,	%f26
loop_1896:
	mulscc	%g4,	0x1198,	%o4
	subcc	%i3,	0x154A,	%g6
	movrlz	%g7,	0x2BD,	%i1
	brz	%g1,	loop_1897
	fmovrslz	%l3,	%f3,	%f30
	fcmple32	%f18,	%f14,	%o5
	std	%o6,	[%l7 + 0x70]
loop_1897:
	andncc	%i2,	%o6,	%l6
	edge8	%l1,	%o1,	%o3
	mova	%icc,	%i4,	%i6
	orncc	%i0,	%g3,	%g2
	movrlez	%l2,	0x27E,	%l5
	move	%icc,	%g5,	%l0
	fmul8x16al	%f27,	%f8,	%f12
	stb	%i7,	[%l7 + 0x54]
	sdiv	%o0,	0x0A71,	%l4
	tcs	%xcc,	0x1
	ldub	[%l7 + 0x5E],	%i5
	udivx	%g4,	0x0575,	%o4
	xnor	%o2,	0x09F8,	%i3
	taddcctv	%g6,	0x0E0B,	%g7
	fmovdneg	%xcc,	%f22,	%f7
	movneg	%icc,	%g1,	%l3
	fmovsg	%icc,	%f29,	%f13
	movgu	%xcc,	%o5,	%i1
	fmovdle	%icc,	%f22,	%f18
	popc	0x0F38,	%i2
	movg	%icc,	%o6,	%l6
	orncc	%l1,	%o1,	%o7
	movgu	%xcc,	%o3,	%i6
	fandnot2s	%f21,	%f13,	%f26
	fbne	%fcc3,	loop_1898
	fones	%f30
	subccc	%i0,	0x07D0,	%g3
	ldstub	[%l7 + 0x29],	%g2
loop_1898:
	fxor	%f4,	%f18,	%f6
	be,pn	%icc,	loop_1899
	membar	0x4B
	bvc,a,pt	%xcc,	loop_1900
	movle	%icc,	%i4,	%l5
loop_1899:
	fmovdgu	%xcc,	%f9,	%f4
	edge32	%l2,	%g5,	%l0
loop_1900:
	edge16l	%o0,	%i7,	%l4
	fbne	%fcc1,	loop_1901
	sub	%i5,	%o4,	%g4
	fnands	%f2,	%f24,	%f22
	movrgz	%i3,	%g6,	%g7
loop_1901:
	andn	%g1,	0x1280,	%o2
	tsubcc	%o5,	%l3,	%i1
	alignaddrl	%i2,	%o6,	%l1
	tsubcc	%o1,	%l6,	%o7
	bgu,a,pt	%icc,	loop_1902
	movneg	%icc,	%i6,	%i0
	fpadd32s	%f20,	%f14,	%f23
	ldx	[%l7 + 0x28],	%g3
loop_1902:
	tn	%icc,	0x5
	fsrc2s	%f6,	%f3
	tcc	%icc,	0x5
	smul	%o3,	0x00FE,	%i4
	array8	%l5,	%g2,	%l2
	movrne	%l0,	0x186,	%g5
	fexpand	%f17,	%f8
	fone	%f26
	bvs	loop_1903
	fba,a	%fcc0,	loop_1904
	fmovde	%icc,	%f25,	%f31
	fnot1s	%f21,	%f8
loop_1903:
	nop
	set	0x21, %g4
	ldsba	[%l7 + %g4] 0x81,	%i7
loop_1904:
	ldub	[%l7 + 0x3C],	%l4
	edge8n	%i5,	%o0,	%g4
	fnands	%f22,	%f29,	%f3
	srax	%i3,	%o4,	%g7
	tl	%icc,	0x4
	tvc	%xcc,	0x4
	fbuge,a	%fcc0,	loop_1905
	subccc	%g1,	0x0746,	%o2
	bge,a	%icc,	loop_1906
	tpos	%xcc,	0x1
loop_1905:
	sir	0x0C9A
	andcc	%g6,	0x1884,	%l3
loop_1906:
	fmovscc	%xcc,	%f0,	%f29
	edge32l	%o5,	%i1,	%o6
	andcc	%l1,	%o1,	%l6
	fba	%fcc1,	loop_1907
	movre	%o7,	%i2,	%i0
	fbg,a	%fcc0,	loop_1908
	andn	%i6,	%g3,	%i4
loop_1907:
	sdivx	%o3,	0x0F32,	%g2
	mova	%xcc,	%l2,	%l0
loop_1908:
	brlz,a	%l5,	loop_1909
	fmovdl	%icc,	%f14,	%f24
	movneg	%xcc,	%g5,	%i7
	fxnor	%f4,	%f4,	%f14
loop_1909:
	call	loop_1910
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x2
	fba	%fcc3,	loop_1911
loop_1910:
	fbne	%fcc1,	loop_1912
	orcc	%i5,	0x0C76,	%l4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x20] %asi,	%f17
loop_1911:
	tn	%xcc,	0x6
loop_1912:
	sdivcc	%g4,	0x0B96,	%o0
	tneg	%icc,	0x4
	edge8ln	%i3,	%g7,	%g1
	mulx	%o4,	0x1423,	%o2
	movge	%icc,	%g6,	%l3
	fxnors	%f6,	%f0,	%f2
	be,a	loop_1913
	tsubcc	%i1,	%o6,	%o5
	membar	0x24
	edge8l	%o1,	%l1,	%o7
loop_1913:
	membar	0x35
	fnand	%f8,	%f18,	%f20
	stbar
	or	%i2,	%l6,	%i0
	srlx	%i6,	0x17,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g3,	%o3
	sdivx	%g2,	0x04C8,	%l2
	nop
	setx loop_1914, %l0, %l1
	jmpl %l1, %l0
	call	loop_1915
	sdivx	%g5,	0x1859,	%l5
	taddcc	%i7,	0x0DEF,	%i5
loop_1914:
	fnands	%f12,	%f27,	%f1
loop_1915:
	popc	0x07C2,	%l4
	orn	%g4,	%i3,	%o0
	fmovdleu	%xcc,	%f27,	%f24
	ldd	[%l7 + 0x48],	%g0
	bgu,a,pt	%icc,	loop_1916
	tvc	%icc,	0x5
	edge8n	%g7,	%o4,	%o2
	move	%icc,	%l3,	%i1
loop_1916:
	nop
	set	0x2C, %l3
	ldsha	[%l7 + %l3] 0x15,	%o6
	ta	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x14] %asi,	%g6
	movl	%xcc,	%o5,	%l1
	fmul8sux16	%f30,	%f20,	%f2
	ld	[%l7 + 0x18],	%f24
	brgez	%o7,	loop_1917
	fbne,a	%fcc0,	loop_1918
	fbuge	%fcc0,	loop_1919
	bn,pn	%xcc,	loop_1920
loop_1917:
	edge8	%o1,	%l6,	%i0
loop_1918:
	edge8ln	%i6,	%i2,	%i4
loop_1919:
	xnor	%g3,	0x080A,	%g2
loop_1920:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x68] %asi,	%l2
	fmul8x16	%f11,	%f14,	%f2
	movcs	%xcc,	%l0,	%g5
	movgu	%xcc,	%l5,	%i7
	membar	0x5D
	popc	0x0D2C,	%i5
	andncc	%l4,	%g4,	%i3
	fmovdne	%icc,	%f28,	%f8
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf1
	membar	#Sync
	xorcc	%o3,	0x1E11,	%o0
	and	%g7,	%g1,	%o4
	edge16ln	%l3,	%i1,	%o6
	sra	%o2,	0x09,	%g6
	brnz	%l1,	loop_1921
	fcmpgt32	%f6,	%f18,	%o5
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x73] %asi,	%o7
loop_1921:
	fmovsneg	%xcc,	%f0,	%f28
	subccc	%o1,	%l6,	%i6
	xnorcc	%i2,	%i0,	%g3
	movpos	%xcc,	%g2,	%l2
	fmovdn	%icc,	%f8,	%f18
	set	0x70, %o3
	lda	[%l7 + %o3] 0x10,	%f30
	movrgz	%l0,	0x2AB,	%i4
	fabss	%f5,	%f1
	fmovrdgz	%g5,	%f20,	%f20
	movge	%xcc,	%i7,	%i5
	call	loop_1922
	udivx	%l4,	0x0F52,	%l5
	udiv	%g4,	0x19AA,	%o3
	andcc	%o0,	0x1EFC,	%i3
loop_1922:
	fmovrsne	%g7,	%f25,	%f3
	alignaddr	%g1,	%l3,	%o4
	ble,pt	%icc,	loop_1923
	smulcc	%o6,	0x0F6B,	%o2
	udivcc	%g6,	0x1A07,	%i1
	movg	%xcc,	%l1,	%o5
loop_1923:
	movleu	%xcc,	%o1,	%l6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i6
	xnorcc	%i2,	%o7,	%i0
	udivcc	%g2,	0x0C9D,	%g3
	fmovrslez	%l2,	%f19,	%f11
	set	0x50, %g7
	lduba	[%l7 + %g7] 0x81,	%i4
	fmovrdlz	%g5,	%f16,	%f8
	nop
	setx	loop_1924,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%l0,	%i7,	%i5
	ba,a	loop_1925
	mulx	%l5,	%l4,	%o3
loop_1924:
	fmovsne	%icc,	%f18,	%f6
	call	loop_1926
loop_1925:
	ldsw	[%l7 + 0x58],	%g4
	orcc	%o0,	%i3,	%g7
	membar	0x5E
loop_1926:
	edge8l	%g1,	%l3,	%o4
	umul	%o6,	%g6,	%o2
	fandnot1s	%f19,	%f28,	%f4
	tne	%xcc,	0x6
	fnand	%f0,	%f20,	%f4
	fcmple16	%f22,	%f10,	%l1
	brlz	%o5,	loop_1927
	bcc,a	%xcc,	loop_1928
	tcc	%xcc,	0x4
	umulcc	%o1,	0x076B,	%i1
loop_1927:
	fand	%f10,	%f30,	%f16
loop_1928:
	tcs	%xcc,	0x0
	or	%l6,	0x0ECE,	%i6
	xor	%o7,	0x16E6,	%i2
	fcmpes	%fcc1,	%f0,	%f0
	bvc	loop_1929
	mulx	%g2,	%g3,	%l2
	sra	%i4,	0x13,	%i0
	tsubcc	%g5,	%i7,	%i5
loop_1929:
	tg	%xcc,	0x3
	movre	%l5,	0x0D8,	%l4
	andn	%l0,	%o3,	%o0
	smul	%i3,	0x1F4E,	%g7
	bn,a	loop_1930
	tne	%icc,	0x0
	ta	%xcc,	0x0
	brgez,a	%g1,	loop_1931
loop_1930:
	brgez,a	%g4,	loop_1932
	edge32	%l3,	%o4,	%g6
	stx	%o2,	[%l7 + 0x20]
loop_1931:
	bl,a,pn	%icc,	loop_1933
loop_1932:
	siam	0x1
	movrgz	%o6,	0x1BA,	%o5
	tl	%xcc,	0x3
loop_1933:
	umulcc	%l1,	%i1,	%l6
	fandnot1	%f18,	%f2,	%f22
	fandnot2s	%f26,	%f20,	%f24
	stbar
	ldsw	[%l7 + 0x30],	%i6
	edge16	%o7,	%i2,	%o1
	fbule,a	%fcc2,	loop_1934
	edge8n	%g2,	%l2,	%i4
	sdivx	%g3,	0x1E81,	%g5
	taddcctv	%i0,	%i7,	%l5
loop_1934:
	fmovdne	%icc,	%f13,	%f12
	fbl,a	%fcc3,	loop_1935
	movrne	%i5,	%l0,	%o3
	fmovrdne	%l4,	%f12,	%f8
	movl	%icc,	%i3,	%g7
loop_1935:
	udiv	%o0,	0x1E7A,	%g4
	mulscc	%l3,	%g1,	%g6
	fcmps	%fcc3,	%f10,	%f24
	tl	%icc,	0x7
	fcmpd	%fcc2,	%f20,	%f2
	fmovsvs	%icc,	%f5,	%f8
	edge16ln	%o4,	%o6,	%o5
	ldsw	[%l7 + 0x6C],	%o2
	popc	%l1,	%i1
	stb	%i6,	[%l7 + 0x67]
	mova	%icc,	%l6,	%o7
	fcmpgt32	%f16,	%f16,	%o1
	fmul8x16au	%f9,	%f15,	%f14
	set	0x47, %i5
	stba	%i2,	[%l7 + %i5] 0x22
	membar	#Sync
	mulscc	%l2,	0x1EF1,	%i4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x09] %asi,	%g3
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x10,	%g4
	nop
	setx loop_1936, %l0, %l1
	jmpl %l1, %i0
	sll	%i7,	%g2,	%l5
	and	%l0,	0x08A6,	%i5
	fblg,a	%fcc1,	loop_1937
loop_1936:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f20,	[%l7 + 0x58]
	sethi	0x119C,	%o3
loop_1937:
	tge	%xcc,	0x1
	taddcc	%i3,	%g7,	%o0
	bne,a	%icc,	loop_1938
	array8	%g4,	%l4,	%g1
	srax	%l3,	%g6,	%o4
	udivx	%o6,	0x06E5,	%o2
loop_1938:
	fblg,a	%fcc0,	loop_1939
	array32	%o5,	%i1,	%i6
	fornot2s	%f30,	%f6,	%f7
	ldsh	[%l7 + 0x14],	%l6
loop_1939:
	orncc	%l1,	0x0EA5,	%o1
	edge16n	%o7,	%i2,	%l2
	membar	0x11
	edge8l	%g3,	%g5,	%i4
	fnors	%f11,	%f4,	%f28
	tleu	%xcc,	0x7
	edge32l	%i0,	%g2,	%i7
	movcs	%icc,	%l0,	%i5
	brlez,a	%o3,	loop_1940
	sra	%l5,	%i3,	%o0
	tsubcctv	%g4,	0x12FE,	%l4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x40] %asi,	%f3
loop_1940:
	fabsd	%f4,	%f0
	fbg	%fcc2,	loop_1941
	edge8n	%g7,	%l3,	%g1
	tle	%icc,	0x4
	tcs	%icc,	0x5
loop_1941:
	sir	0x08E8
	fpsub32	%f26,	%f20,	%f14
	umulcc	%o4,	%o6,	%g6
	fmovrsne	%o5,	%f24,	%f10
	srlx	%o2,	0x05,	%i1
	bgu,pn	%xcc,	loop_1942
	fmovdl	%xcc,	%f12,	%f18
	fnot2s	%f31,	%f26
	ldsb	[%l7 + 0x34],	%l6
loop_1942:
	fmul8sux16	%f18,	%f30,	%f2
	prefetch	[%l7 + 0x3C],	 0x3
	sra	%i6,	%l1,	%o7
	bn,a	%icc,	loop_1943
	movleu	%xcc,	%o1,	%l2
	fnegd	%f14,	%f26
	add	%g3,	%i2,	%g5
loop_1943:
	fbu	%fcc0,	loop_1944
	movn	%xcc,	%i0,	%i4
	fbg,a	%fcc0,	loop_1945
	udivcc	%i7,	0x0790,	%g2
loop_1944:
	nop
	set	0x48, %i4
	std	%f22,	[%l7 + %i4]
	swap	[%l7 + 0x20],	%l0
loop_1945:
	tge	%icc,	0x4
	st	%f31,	[%l7 + 0x50]
	orncc	%i5,	0x1709,	%o3
	fbu,a	%fcc2,	loop_1946
	movneg	%icc,	%l5,	%i3
	fbn,a	%fcc2,	loop_1947
	edge8n	%g4,	%o0,	%g7
loop_1946:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez,a	%l3,	loop_1948
loop_1947:
	fbe,a	%fcc2,	loop_1949
	orn	%g1,	%o4,	%l4
	ble	%xcc,	loop_1950
loop_1948:
	movvc	%icc,	%o6,	%g6
loop_1949:
	sra	%o2,	0x10,	%i1
	smulcc	%l6,	0x118A,	%o5
loop_1950:
	movre	%i6,	%l1,	%o7
	fnands	%f7,	%f4,	%f28
	fmovrdlez	%l2,	%f2,	%f10
	bpos,a	%xcc,	loop_1951
	edge32n	%g3,	%i2,	%o1
	fbo,a	%fcc1,	loop_1952
	fmovde	%xcc,	%f1,	%f27
loop_1951:
	tge	%xcc,	0x2
	fmovscc	%xcc,	%f7,	%f27
loop_1952:
	srl	%i0,	0x15,	%i4
	tneg	%xcc,	0x4
	movcc	%xcc,	%g5,	%g2
	sdivx	%i7,	0x1D2B,	%l0
	ba,a,pt	%icc,	loop_1953
	fbue,a	%fcc0,	loop_1954
	movrne	%o3,	0x304,	%l5
	edge16n	%i3,	%i5,	%g4
loop_1953:
	udiv	%o0,	0x0DC8,	%g7
loop_1954:
	edge32l	%l3,	%g1,	%l4
	fpadd16	%f28,	%f0,	%f0
	sra	%o4,	0x12,	%o6
	taddcc	%o2,	0x0540,	%g6
	addcc	%l6,	0x15B2,	%i1
	movleu	%icc,	%o5,	%i6
	udivcc	%l1,	0x0B2A,	%l2
	set	0x0C, %i2
	stwa	%g3,	[%l7 + %i2] 0xe3
	membar	#Sync
	sra	%i2,	%o1,	%i0
	fbn	%fcc0,	loop_1955
	tge	%xcc,	0x3
	fmul8sux16	%f10,	%f18,	%f30
	orncc	%i4,	%o7,	%g2
loop_1955:
	andn	%g5,	%l0,	%i7
	movne	%icc,	%o3,	%i3
	fsrc2s	%f23,	%f24
	fbn	%fcc2,	loop_1956
	mova	%xcc,	%i5,	%g4
	fandnot2s	%f26,	%f25,	%f31
	srl	%l5,	%g7,	%o0
loop_1956:
	tleu	%xcc,	0x1
	tvc	%icc,	0x1
	sll	%l3,	%g1,	%o4
	xnor	%o6,	%l4,	%o2
	tcs	%xcc,	0x6
	fble,a	%fcc0,	loop_1957
	fbo	%fcc2,	loop_1958
	tge	%xcc,	0x7
	xor	%g6,	%l6,	%i1
loop_1957:
	alignaddr	%o5,	%i6,	%l1
loop_1958:
	alignaddr	%g3,	%l2,	%i2
	fble,a	%fcc3,	loop_1959
	bpos	loop_1960
	ta	%xcc,	0x1
	edge32n	%i0,	%o1,	%i4
loop_1959:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1960:
	srlx	%o7,	0x18,	%g2
	orcc	%l0,	%g5,	%o3
	tsubcctv	%i7,	%i5,	%i3
	tg	%xcc,	0x4
	set	0x08, %o7
	lda	[%l7 + %o7] 0x80,	%f29
	alignaddrl	%g4,	%g7,	%o0
	nop
	setx	loop_1961,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l3,	0x13EB,	%g1
	sub	%o4,	0x0DFD,	%o6
	bgu	loop_1962
loop_1961:
	andn	%l5,	%o2,	%g6
	array32	%l6,	%i1,	%o5
	ld	[%l7 + 0x14],	%f25
loop_1962:
	andn	%l4,	0x1FA5,	%i6
	sra	%l1,	%l2,	%g3
	movcc	%xcc,	%i0,	%i2
	movrgez	%i4,	0x084,	%o1
	array8	%o7,	%l0,	%g2
	fmovse	%icc,	%f21,	%f6
	edge8l	%g5,	%i7,	%o3
	fmovrdlez	%i5,	%f14,	%f6
	popc	%i3,	%g4
	edge32n	%g7,	%o0,	%l3
	edge8	%o4,	%o6,	%g1
	fmovdgu	%xcc,	%f22,	%f7
	sllx	%l5,	0x0C,	%o2
	tvs	%xcc,	0x5
	ldd	[%l7 + 0x30],	%g6
	array32	%i1,	%o5,	%l4
	fsrc1	%f26,	%f2
	fmul8sux16	%f20,	%f4,	%f16
	tvc	%icc,	0x4
	mulx	%i6,	%l1,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l2,	%g3
	addc	%i2,	%i4,	%o1
	fone	%f8
	movvs	%xcc,	%i0,	%l0
	movle	%xcc,	%g2,	%o7
	movre	%g5,	0x2CE,	%i7
	or	%o3,	%i5,	%i3
	tge	%xcc,	0x5
	tle	%xcc,	0x3
	srlx	%g7,	%o0,	%l3
	fmovdg	%xcc,	%f11,	%f19
	fmovsgu	%icc,	%f25,	%f27
	taddcctv	%g4,	%o6,	%g1
	udiv	%l5,	0x14E3,	%o2
	movpos	%xcc,	%o4,	%g6
	brlz,a	%o5,	loop_1963
	ta	%xcc,	0x4
	movrne	%l4,	%i1,	%l1
	tge	%xcc,	0x0
loop_1963:
	tl	%icc,	0x2
	xnorcc	%i6,	0x1CD4,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l2,	%g3
	movrlz	%i4,	%o1,	%i2
	fand	%f30,	%f24,	%f24
	fbe	%fcc1,	loop_1964
	fmovdcs	%icc,	%f1,	%f29
	tpos	%xcc,	0x0
	fcmpes	%fcc3,	%f29,	%f8
loop_1964:
	stb	%l0,	[%l7 + 0x44]
	movleu	%xcc,	%g2,	%i0
	or	%o7,	%i7,	%g5
	fmovrde	%i5,	%f6,	%f28
	set	0x7C, %g5
	stwa	%o3,	[%l7 + %g5] 0x22
	membar	#Sync
	membar	0x2E
	ta	%icc,	0x5
	udivcc	%i3,	0x00CB,	%g7
	xnorcc	%l3,	0x0301,	%o0
	membar	0x72
	fmovdl	%xcc,	%f22,	%f25
	umulcc	%o6,	%g4,	%l5
	tge	%icc,	0x3
	set	0x28, %o6
	stha	%g1,	[%l7 + %o6] 0x0c
	movre	%o2,	0x390,	%g6
	edge8l	%o4,	%o5,	%i1
	movn	%icc,	%l1,	%i6
	edge16	%l6,	%l2,	%g3
	call	loop_1965
	movrgz	%l4,	%i4,	%o1
	movcs	%icc,	%i2,	%l0
	tle	%xcc,	0x6
loop_1965:
	membar	0x5D
	stb	%g2,	[%l7 + 0x14]
	edge32	%i0,	%o7,	%g5
	mulx	%i5,	0x18E5,	%i7
	fmovsgu	%icc,	%f15,	%f1
	fmovsge	%icc,	%f25,	%f4
	bn,a	%icc,	loop_1966
	fmovsl	%icc,	%f26,	%f12
	fbug	%fcc3,	loop_1967
	edge32	%i3,	%g7,	%l3
loop_1966:
	movrlez	%o3,	0x0FF,	%o6
	fmovsle	%xcc,	%f30,	%f17
loop_1967:
	ld	[%l7 + 0x3C],	%f24
	fmul8sux16	%f24,	%f30,	%f0
	mulscc	%g4,	0x1BA8,	%l5
	bneg,a	%icc,	loop_1968
	fmul8sux16	%f26,	%f10,	%f18
	brgez	%g1,	loop_1969
	flush	%l7 + 0x58
loop_1968:
	ld	[%l7 + 0x08],	%f0
	fblg,a	%fcc2,	loop_1970
loop_1969:
	fnot2s	%f14,	%f24
	fmovda	%icc,	%f9,	%f28
	umulcc	%o0,	0x1D9D,	%g6
loop_1970:
	xnorcc	%o2,	0x14F4,	%o5
	fpackfix	%f24,	%f5
	umulcc	%i1,	%l1,	%i6
	xnorcc	%o4,	0x13F0,	%l2
	orcc	%g3,	0x1A76,	%l6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x38] %asi,	%i4
	umulcc	%o1,	%i2,	%l0
	sethi	0x18D5,	%g2
	fcmped	%fcc0,	%f0,	%f30
	ldd	[%l7 + 0x68],	%f6
	fcmpgt16	%f6,	%f30,	%l4
	fmovrslz	%i0,	%f2,	%f19
	set	0x2C, %l5
	stwa	%o7,	[%l7 + %l5] 0x2a
	membar	#Sync
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x04
	udivx	%i5,	0x0917,	%i7
	xor	%g5,	0x1DE6,	%g7
	tl	%xcc,	0x7
	stbar
	fmuld8sux16	%f0,	%f12,	%f22
	movvc	%xcc,	%i3,	%l3
	srl	%o3,	%g4,	%o6
	movrgz	%l5,	0x1B4,	%o0
	tsubcctv	%g6,	%g1,	%o5
	ba	%xcc,	loop_1971
	movvc	%icc,	%o2,	%l1
	fornot1s	%f8,	%f16,	%f16
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%i6
loop_1971:
	sll	%o4,	%i1,	%g3
	array8	%l6,	%i4,	%l2
	edge8ln	%i2,	%o1,	%g2
	lduw	[%l7 + 0x24],	%l0
	lduw	[%l7 + 0x38],	%i0
	edge8ln	%l4,	%o7,	%i5
	wr	%g0,	0x11,	%asi
	stba	%g5,	[%l7 + 0x71] %asi
	fbo	%fcc3,	loop_1972
	fmovrdgez	%g7,	%f30,	%f24
	sdivx	%i7,	0x121F,	%i3
	movgu	%icc,	%o3,	%g4
loop_1972:
	stb	%o6,	[%l7 + 0x7A]
	fmuld8ulx16	%f8,	%f16,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc2,	loop_1973
	brnz	%l3,	loop_1974
	brz,a	%l5,	loop_1975
	taddcc	%o0,	%g6,	%g1
loop_1973:
	sll	%o2,	%o5,	%l1
loop_1974:
	fmovscc	%xcc,	%f22,	%f12
loop_1975:
	sdivcc	%i6,	0x0937,	%i1
	faligndata	%f28,	%f28,	%f24
	smul	%g3,	%o4,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l6,	%i2,	%o1
	brlz,a	%g2,	loop_1976
	udivcc	%l0,	0x02B8,	%l2
	fcmped	%fcc2,	%f2,	%f30
	movpos	%icc,	%l4,	%o7
loop_1976:
	sethi	0x0AF9,	%i5
	ldstub	[%l7 + 0x18],	%i0
	tneg	%xcc,	0x1
	movle	%icc,	%g5,	%g7
	fmovsl	%xcc,	%f23,	%f2
	edge32ln	%i7,	%i3,	%g4
	edge32n	%o3,	%l3,	%l5
	tsubcc	%o6,	%o0,	%g6
	orncc	%o2,	0x1A74,	%o5
	xor	%g1,	%l1,	%i6
	fbo	%fcc3,	loop_1977
	edge16n	%g3,	%o4,	%i1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l6
loop_1977:
	udivcc	%i2,	0x1D7F,	%o1
	bvs,a,pn	%icc,	loop_1978
	fmovsle	%xcc,	%f16,	%f27
	bvs,a	loop_1979
	array16	%i4,	%l0,	%g2
loop_1978:
	edge32	%l4,	%o7,	%i5
	movne	%xcc,	%l2,	%g5
loop_1979:
	fcmple32	%f20,	%f30,	%i0
	tge	%icc,	0x6
	movcc	%xcc,	%g7,	%i7
	movcc	%xcc,	%g4,	%i3
	edge8ln	%l3,	%l5,	%o3
	lduw	[%l7 + 0x08],	%o6
	fcmpeq32	%f18,	%f24,	%g6
	fexpand	%f30,	%f16
	edge16n	%o0,	%o2,	%o5
	movpos	%xcc,	%l1,	%g1
	tcc	%icc,	0x1
	fcmple32	%f16,	%f0,	%i6
	or	%g3,	0x1FFF,	%o4
	edge8ln	%i1,	%i2,	%l6
	sllx	%i4,	%l0,	%o1
	movrlz	%l4,	%g2,	%o7
	tg	%icc,	0x4
	stbar
	tg	%xcc,	0x2
	bcs,a,pt	%xcc,	loop_1980
	orncc	%i5,	%g5,	%l2
	srl	%g7,	%i0,	%i7
	movleu	%icc,	%i3,	%l3
loop_1980:
	fsrc2s	%f6,	%f11
	udivcc	%g4,	0x11EE,	%o3
	movgu	%icc,	%o6,	%l5
	umul	%g6,	%o0,	%o2
	movre	%o5,	%g1,	%l1
	fmuld8sux16	%f11,	%f27,	%f6
	std	%i6,	[%l7 + 0x10]
	taddcctv	%o4,	%g3,	%i2
	brlz,a	%i1,	loop_1981
	tleu	%xcc,	0x0
	bcs,a,pn	%xcc,	loop_1982
	fcmple32	%f28,	%f18,	%l6
loop_1981:
	flush	%l7 + 0x40
	std	%i4,	[%l7 + 0x40]
loop_1982:
	fpsub32s	%f25,	%f4,	%f11
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x19,	%o0
	andcc	%l0,	%l4,	%o7
	fbg,a	%fcc0,	loop_1983
	brnz	%i5,	loop_1984
	fmovspos	%xcc,	%f13,	%f29
	andncc	%g2,	%g5,	%l2
loop_1983:
	alignaddr	%g7,	%i0,	%i3
loop_1984:
	bleu,pt	%icc,	loop_1985
	fbu,a	%fcc0,	loop_1986
	fnands	%f19,	%f4,	%f11
	sub	%i7,	0x0FAB,	%l3
loop_1985:
	fnot1	%f22,	%f6
loop_1986:
	mova	%xcc,	%o3,	%g4
	bg,a	loop_1987
	tg	%icc,	0x1
	movn	%xcc,	%l5,	%g6
	smul	%o0,	%o6,	%o5
loop_1987:
	fmovsa	%xcc,	%f8,	%f11
	fmovsvs	%icc,	%f11,	%f12
	mulscc	%o2,	%g1,	%l1
	flush	%l7 + 0x30
	movrlez	%o4,	0x0B2,	%g3
	fmovsgu	%icc,	%f16,	%f19
	smulcc	%i2,	0x1CC3,	%i6
	fbge	%fcc2,	loop_1988
	sub	%l6,	%i4,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f18,	%f6,	%f12
loop_1988:
	fbue	%fcc0,	loop_1989
	fpack16	%f2,	%f20
	bvs,a	%xcc,	loop_1990
	udiv	%o1,	0x0449,	%l4
loop_1989:
	taddcctv	%o7,	%i5,	%l0
	sdivcc	%g2,	0x05F9,	%l2
loop_1990:
	movrlez	%g7,	%g5,	%i0
	addcc	%i3,	%l3,	%o3
	fcmpeq32	%f14,	%f8,	%i7
	fnot1s	%f27,	%f22
	movvs	%icc,	%l5,	%g4
	prefetch	[%l7 + 0x64],	 0x1
	taddcctv	%o0,	0x0CB2,	%g6
	srl	%o5,	0x15,	%o6
	and	%o2,	0x0B83,	%l1
	movl	%xcc,	%g1,	%o4
	movg	%icc,	%i2,	%g3
	fblg,a	%fcc3,	loop_1991
	fbul	%fcc1,	loop_1992
	sir	0x0B05
	mulx	%l6,	0x1D13,	%i4
loop_1991:
	movcc	%xcc,	%i1,	%i6
loop_1992:
	orncc	%o1,	0x00CD,	%o7
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
	edge32l	%i5,	%l0,	%l4
	ldx	[%l7 + 0x08],	%l2
	fandnot1	%f12,	%f0,	%f22
loop_1993:
	fcmple16	%f14,	%f4,	%g7
	popc	%g5,	%g2
	andcc	%i3,	0x1257,	%l3
	bn,pn	%xcc,	loop_1994
	fsrc2s	%f18,	%f14
	ble,a,pn	%xcc,	loop_1995
	or	%i0,	%i7,	%l5
loop_1994:
	call	loop_1996
	fmovdgu	%icc,	%f1,	%f28
loop_1995:
	fcmpgt32	%f6,	%f16,	%g4
	tn	%xcc,	0x2
loop_1996:
	movrgz	%o3,	0x0FE,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x56],	%o5
	edge32ln	%o6,	%o2,	%l1
	fmovsa	%icc,	%f6,	%f12
	move	%icc,	%g1,	%o4
	fmovscs	%icc,	%f14,	%f31
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x81
	sir	0x0DAF
	move	%icc,	%i2,	%o0
	alignaddrl	%g3,	%i4,	%l6
	ldx	[%l7 + 0x68],	%i6
	umulcc	%i1,	%o7,	%i5
	subcc	%o1,	%l0,	%l4
	andn	%g7,	0x1CA7,	%l2
	fandnot1	%f12,	%f28,	%f10
	movge	%icc,	%g5,	%g2
	tleu	%xcc,	0x7
	st	%f22,	[%l7 + 0x78]
	or	%i3,	%i0,	%i7
	movrgz	%l5,	%g4,	%o3
	ldstub	[%l7 + 0x25],	%g6
	orcc	%l3,	%o6,	%o5
	fbg,a	%fcc2,	loop_1997
	xnor	%l1,	%g1,	%o2
	udivx	%i2,	0x00DA,	%o0
	movge	%icc,	%o4,	%g3
loop_1997:
	subc	%i4,	0x0B83,	%l6
	tne	%icc,	0x6
	fmovsleu	%xcc,	%f28,	%f0
	movrlez	%i6,	0x07E,	%o7
	nop
	setx loop_1998, %l0, %l1
	jmpl %l1, %i5
	fnot2	%f14,	%f2
	andncc	%i1,	%o1,	%l0
	fpack16	%f4,	%f19
loop_1998:
	tcs	%xcc,	0x0
	tvc	%icc,	0x7
	xnorcc	%g7,	0x1830,	%l4
	subc	%g5,	0x04D7,	%g2
	smulcc	%i3,	%i0,	%i7
	umulcc	%l2,	0x164F,	%l5
	tgu	%xcc,	0x1
	fbug	%fcc2,	loop_1999
	movvc	%icc,	%g4,	%o3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f0
loop_1999:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l3,	%o6
	bge	%icc,	loop_2000
	fnors	%f5,	%f15,	%f6
	array8	%g6,	%o5,	%g1
	edge32ln	%o2,	%l1,	%o0
loop_2000:
	fmovsn	%icc,	%f7,	%f7
	tcs	%xcc,	0x7
	srlx	%i2,	%g3,	%o4
	fcmpeq32	%f4,	%f22,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i6,	%o7,	%l6
	fpmerge	%f7,	%f1,	%f26
	tleu	%icc,	0x6
	fble,a	%fcc3,	loop_2001
	ble	%icc,	loop_2002
	sra	%i5,	0x15,	%o1
	tcc	%xcc,	0x2
loop_2001:
	movn	%xcc,	%l0,	%i1
loop_2002:
	movge	%xcc,	%l4,	%g5
	fcmpgt16	%f14,	%f12,	%g7
	lduh	[%l7 + 0x32],	%i3
	fmovspos	%xcc,	%f7,	%f4
	fmul8ulx16	%f14,	%f20,	%f12
	fexpand	%f23,	%f10
	tcs	%icc,	0x7
	fpack16	%f10,	%f25
	movrgz	%i0,	%g2,	%l2
	movgu	%icc,	%i7,	%l5
	edge32n	%g4,	%o3,	%o6
	set	0x6F, %o4
	lduba	[%l7 + %o4] 0x14,	%l3
	xnorcc	%g6,	%g1,	%o2
	fmovsl	%icc,	%f14,	%f21
	bpos	loop_2003
	tl	%icc,	0x7
	fcmpeq32	%f4,	%f6,	%l1
	brgz,a	%o5,	loop_2004
loop_2003:
	andcc	%o0,	%g3,	%i2
	movl	%xcc,	%i4,	%o4
	tg	%xcc,	0x1
loop_2004:
	stb	%o7,	[%l7 + 0x43]
	fmovrdlez	%i6,	%f10,	%f16
	fmovrdlez	%l6,	%f20,	%f10
	ble,a	loop_2005
	xnorcc	%o1,	0x1D48,	%i5
	call	loop_2006
	fands	%f12,	%f8,	%f12
loop_2005:
	srax	%l0,	0x04,	%l4
	mulx	%g5,	0x0C19,	%i1
loop_2006:
	fmovscc	%icc,	%f24,	%f31
	ldd	[%l7 + 0x38],	%i2
	bcs,a	%icc,	loop_2007
	bneg,a,pn	%icc,	loop_2008
	tcc	%icc,	0x3
	movpos	%xcc,	%i0,	%g2
loop_2007:
	taddcc	%l2,	0x1EFE,	%i7
loop_2008:
	fone	%f28
	fxors	%f13,	%f16,	%f16
	call	loop_2009
	edge8ln	%l5,	%g4,	%o3
	sllx	%o6,	%g7,	%l3
	edge32ln	%g1,	%o2,	%g6
loop_2009:
	edge8n	%l1,	%o0,	%o5
	fcmpes	%fcc3,	%f19,	%f2
	alignaddrl	%g3,	%i2,	%i4
	movre	%o7,	0x094,	%i6
	udiv	%l6,	0x11B9,	%o1
	edge8	%i5,	%l0,	%l4
	tneg	%icc,	0x4
	stx	%g5,	[%l7 + 0x60]
	edge16	%i1,	%i3,	%i0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x56] %asi,	%o4
	be	loop_2010
	brnz	%l2,	loop_2011
	addcc	%g2,	%l5,	%g4
	faligndata	%f26,	%f4,	%f6
loop_2010:
	fmovdcs	%icc,	%f26,	%f15
loop_2011:
	sethi	0x1DE5,	%o3
	umul	%o6,	0x183F,	%i7
	and	%l3,	%g7,	%o2
	fmul8x16al	%f0,	%f3,	%f30
	orcc	%g1,	%l1,	%g6
	xorcc	%o0,	%o5,	%i2
	subc	%i4,	0x16A7,	%g3
	tcc	%xcc,	0x1
	edge32	%o7,	%l6,	%o1
	sub	%i6,	%l0,	%i5
	fmovdvs	%xcc,	%f18,	%f30
	fbue	%fcc0,	loop_2012
	fcmpne16	%f20,	%f2,	%l4
	stb	%i1,	[%l7 + 0x76]
	movvs	%icc,	%i3,	%i0
loop_2012:
	movvc	%icc,	%g5,	%o4
	edge8	%g2,	%l5,	%l2
	fpmerge	%f27,	%f1,	%f0
	tvs	%icc,	0x4
	srax	%g4,	%o3,	%o6
	tgu	%icc,	0x4
	fmovde	%xcc,	%f1,	%f7
	fbul	%fcc1,	loop_2013
	andn	%i7,	0x003C,	%l3
	nop
	setx	loop_2014,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fors	%f25,	%f4,	%f16
loop_2013:
	fbuge,a	%fcc0,	loop_2015
	movleu	%icc,	%o2,	%g7
loop_2014:
	brlez	%l1,	loop_2016
	fble,a	%fcc0,	loop_2017
loop_2015:
	tge	%xcc,	0x6
	sdiv	%g6,	0x00AC,	%o0
loop_2016:
	tl	%xcc,	0x7
loop_2017:
	edge8n	%o5,	%g1,	%i4
	swap	[%l7 + 0x74],	%i2
	stw	%o7,	[%l7 + 0x60]
	ldsh	[%l7 + 0x3E],	%g3
	edge8ln	%o1,	%l6,	%l0
	stx	%i5,	[%l7 + 0x78]
	array32	%i6,	%i1,	%l4
	xnorcc	%i3,	0x158D,	%i0
	tge	%icc,	0x0
	brlz	%o4,	loop_2018
	subc	%g5,	%g2,	%l5
	fmovdl	%xcc,	%f14,	%f31
	fmovspos	%xcc,	%f8,	%f3
loop_2018:
	std	%l2,	[%l7 + 0x10]
	edge8ln	%o3,	%o6,	%i7
	siam	0x5
	fmuld8ulx16	%f30,	%f20,	%f18
	fbule	%fcc0,	loop_2019
	taddcctv	%g4,	0x0C3B,	%o2
	sub	%g7,	0x1896,	%l1
	fmovdge	%xcc,	%f25,	%f30
loop_2019:
	alignaddr	%g6,	%l3,	%o0
	tsubcc	%g1,	0x1453,	%i4
	te	%icc,	0x7
	alignaddrl	%o5,	%i2,	%o7
	sdivcc	%g3,	0x17EF,	%o1
	sdivcc	%l6,	0x0E74,	%l0
	mulscc	%i5,	%i1,	%i6
	add	%i3,	%i0,	%l4
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%g4
	fba	%fcc3,	loop_2020
	mulscc	%g2,	0x0C8A,	%l5
	edge32n	%l2,	%o4,	%o3
	fmovdne	%icc,	%f18,	%f20
loop_2020:
	fnegd	%f28,	%f16
	brlez,a	%o6,	loop_2021
	addc	%i7,	%g4,	%g7
	tge	%icc,	0x6
	smulcc	%l1,	0x0F6E,	%o2
loop_2021:
	taddcc	%g6,	0x1E4A,	%o0
	sdiv	%l3,	0x0B75,	%i4
	tle	%xcc,	0x3
	tn	%icc,	0x2
	movcc	%xcc,	%g1,	%o5
	fbge	%fcc2,	loop_2022
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
	addc	%i2,	0x1EC1,	%o7
	movrne	%g3,	0x3DE,	%l6
loop_2022:
	fcmple32	%f4,	%f20,	%l0
loop_2023:
	fpadd32s	%f28,	%f20,	%f6
	edge8n	%o1,	%i5,	%i6
	fmovdcc	%xcc,	%f6,	%f19
	nop
	setx loop_2024, %l0, %l1
	jmpl %l1, %i3
	bl,a,pt	%icc,	loop_2025
	bgu	loop_2026
	taddcc	%i0,	0x023F,	%l4
loop_2024:
	membar	0x00
loop_2025:
	movleu	%xcc,	%i1,	%g2
loop_2026:
	movvc	%icc,	%g5,	%l5
	ldub	[%l7 + 0x4D],	%o4
	array32	%o3,	%l2,	%i7
	tge	%icc,	0x2
	sdivx	%g4,	0x1F52,	%g7
	swap	[%l7 + 0x7C],	%l1
	tg	%icc,	0x5
	brnz,a	%o6,	loop_2027
	fands	%f16,	%f25,	%f19
	mulscc	%o2,	%o0,	%l3
	tsubcc	%g6,	0x0FE2,	%g1
loop_2027:
	fmovsa	%xcc,	%f10,	%f4
	ld	[%l7 + 0x38],	%f29
	mova	%xcc,	%i4,	%o5
	array16	%o7,	%i2,	%g3
	orcc	%l0,	0x06D2,	%o1
	movrgz	%l6,	0x1B3,	%i6
	movl	%icc,	%i5,	%i3
	set	0x20, %g3
	stda	%i0,	[%l7 + %g3] 0x18
	edge8l	%i1,	%l4,	%g5
	edge8	%g2,	%o4,	%o3
	tn	%xcc,	0x7
	fmovdn	%icc,	%f28,	%f13
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x2C] %asi,	%f22
	movcs	%icc,	%l5,	%i7
	udiv	%l2,	0x0BF1,	%g7
	umulcc	%g4,	0x1EC0,	%l1
	fnot1s	%f30,	%f5
	edge8ln	%o6,	%o0,	%l3
	fnor	%f6,	%f4,	%f20
	bne,pt	%xcc,	loop_2028
	flush	%l7 + 0x10
	fbul	%fcc0,	loop_2029
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2028:
	fpmerge	%f11,	%f23,	%f4
	popc	0x011B,	%g6
loop_2029:
	bcc,a	%xcc,	loop_2030
	fmovdleu	%icc,	%f15,	%f19
	te	%xcc,	0x0
	stx	%o2,	[%l7 + 0x48]
loop_2030:
	sir	0x1470
	tcc	%xcc,	0x4
	tsubcc	%g1,	0x1C12,	%o5
	movle	%icc,	%i4,	%o7
	umulcc	%i2,	0x1249,	%g3
	srax	%o1,	0x03,	%l0
	udivx	%i6,	0x08EC,	%i5
	fcmpne16	%f14,	%f2,	%l6
	bneg,a,pn	%xcc,	loop_2031
	move	%icc,	%i3,	%i1
	xnorcc	%i0,	%g5,	%l4
	membar	0x77
loop_2031:
	alignaddrl	%g2,	%o3,	%l5
	tsubcctv	%o4,	0x1DA4,	%l2
	tg	%xcc,	0x3
	umulcc	%g7,	%g4,	%l1
	fbul	%fcc3,	loop_2032
	edge32ln	%o6,	%i7,	%l3
	movge	%xcc,	%g6,	%o0
	tvs	%xcc,	0x2
loop_2032:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x70] %asi,	%f17
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
	fabss	%f14,	%f8
	nop
	setx loop_2033, %l0, %l1
	jmpl %l1, %o5
	fmul8x16	%f5,	%f22,	%f20
	or	%o2,	0x17D2,	%o7
	be	loop_2034
loop_2033:
	brz	%i2,	loop_2035
	sll	%g3,	%i4,	%o1
	orn	%l0,	%i5,	%i6
loop_2034:
	sethi	0x18AA,	%i3
loop_2035:
	fands	%f28,	%f18,	%f21
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x56] %asi,	%l6
	sethi	0x0A42,	%i0
	sllx	%i1,	%l4,	%g5
	tne	%xcc,	0x1
	fcmpne32	%f12,	%f14,	%g2
	fble	%fcc0,	loop_2036
	movg	%xcc,	%o3,	%o4
	wr	%g0,	0x18,	%asi
	stwa	%l5,	[%l7 + 0x74] %asi
loop_2036:
	addc	%g7,	%g4,	%l2
	xnorcc	%l1,	%o6,	%i7
	ble	loop_2037
	edge8ln	%l3,	%o0,	%g6
	sub	%g1,	%o5,	%o2
	fpadd16	%f16,	%f28,	%f10
loop_2037:
	tg	%xcc,	0x2
	tg	%xcc,	0x0
	movleu	%xcc,	%i2,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x2
	movrgez	%i4,	%o7,	%l0
	array8	%i5,	%o1,	%i6
	movleu	%icc,	%i3,	%i0
	set	0x50, %i3
	sta	%f21,	[%l7 + %i3] 0x18
	ba,a	%icc,	loop_2038
	membar	0x1B
	sub	%i1,	0x14FE,	%l4
	edge32n	%g5,	%g2,	%l6
loop_2038:
	for	%f14,	%f22,	%f10
	siam	0x2
	srlx	%o4,	0x0B,	%o3
	membar	0x3E
	subc	%g7,	0x074E,	%g4
	edge8	%l2,	%l5,	%l1
	fnegs	%f27,	%f3
	movrgez	%o6,	%l3,	%o0
	movvc	%xcc,	%g6,	%i7
	fbg,a	%fcc1,	loop_2039
	brgz,a	%g1,	loop_2040
	std	%f8,	[%l7 + 0x08]
	smul	%o2,	0x0D3A,	%o5
loop_2039:
	movcc	%xcc,	%i2,	%g3
loop_2040:
	nop
	set	0x6C, %i6
	sta	%f3,	[%l7 + %i6] 0x10
	smul	%i4,	0x09F8,	%l0
	flush	%l7 + 0x48
	movcc	%xcc,	%i5,	%o1
	srl	%o7,	0x08,	%i6
	edge16l	%i0,	%i1,	%i3
	fzeros	%f19
	ldsb	[%l7 + 0x08],	%g5
	tpos	%icc,	0x7
	smul	%l4,	%g2,	%l6
	tl	%icc,	0x7
	tneg	%icc,	0x1
	alignaddr	%o3,	%o4,	%g4
	bvs	loop_2041
	tne	%xcc,	0x3
	movge	%xcc,	%l2,	%g7
	brlez,a	%l5,	loop_2042
loop_2041:
	addcc	%l1,	%l3,	%o0
	alignaddr	%g6,	%i7,	%o6
	movneg	%xcc,	%g1,	%o2
loop_2042:
	fsrc1	%f6,	%f12
	srlx	%o5,	0x09,	%g3
	andncc	%i4,	%l0,	%i5
	subc	%i2,	%o7,	%o1
	sdivx	%i0,	0x08F3,	%i1
	sir	0x0E16
	array8	%i6,	%g5,	%i3
	fmovrse	%l4,	%f31,	%f25
	fornot2s	%f8,	%f18,	%f10
	movl	%xcc,	%l6,	%g2
	fnot2s	%f11,	%f19
	movre	%o4,	%o3,	%l2
	fmovscc	%xcc,	%f19,	%f2
	fmovspos	%icc,	%f4,	%f29
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g7
	orcc	%l5,	0x0DB9,	%g4
	addcc	%l3,	0x016B,	%o0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x46] %asi,	%g6
	bne,a,pn	%icc,	loop_2043
	sir	0x1FD3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i7,	0x03,	%o6
loop_2043:
	umulcc	%l1,	%o2,	%o5
	fzero	%f26
	movle	%xcc,	%g1,	%i4
	srlx	%g3,	0x0C,	%i5
	brnz	%i2,	loop_2044
	sra	%o7,	%o1,	%i0
	udivx	%i1,	0x0D25,	%i6
	mulscc	%l0,	%g5,	%i3
loop_2044:
	tg	%xcc,	0x6
	nop
	setx	loop_2045,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%l6,	%g2,	%l4
	tleu	%icc,	0x4
	tgu	%xcc,	0x7
loop_2045:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7C, %i1
	lduha	[%l7 + %i1] 0x89,	%o4
	mova	%xcc,	%l2,	%g7
	fbne	%fcc2,	loop_2046
	fpack16	%f0,	%f15
	movneg	%xcc,	%l5,	%o3
	movvs	%xcc,	%l3,	%g4
loop_2046:
	subc	%o0,	0x1745,	%i7
	alignaddrl	%g6,	%o6,	%l1
	tvs	%icc,	0x6
	addc	%o5,	0x0DF8,	%o2
	fmovrsgez	%i4,	%f18,	%f17
	fabss	%f28,	%f12
	umulcc	%g3,	0x04BA,	%g1
	umulcc	%i5,	%o7,	%i2
	wr	%g0,	0x89,	%asi
	stwa	%o1,	[%l7 + 0x74] %asi
	move	%icc,	%i1,	%i6
	fmovsvs	%xcc,	%f24,	%f3
	alignaddrl	%i0,	%l0,	%i3
	orn	%g5,	%l6,	%l4
	edge32ln	%g2,	%l2,	%g7
	xor	%l5,	0x06F7,	%o3
	ldd	[%l7 + 0x70],	%f26
	umulcc	%l3,	%g4,	%o0
	srlx	%i7,	%g6,	%o4
	smulcc	%o6,	%l1,	%o2
	udivx	%i4,	0x1284,	%o5
	sir	0x1992
	sdivx	%g3,	0x0F5E,	%g1
	edge32ln	%i5,	%i2,	%o7
	movcs	%icc,	%i1,	%o1
	movcc	%icc,	%i0,	%i6
	tsubcctv	%l0,	%g5,	%l6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x28] %asi,	%l4
	brlez	%g2,	loop_2047
	bpos,pt	%icc,	loop_2048
	sdivx	%i3,	0x1942,	%l2
	movge	%xcc,	%l5,	%g7
loop_2047:
	umul	%l3,	%o3,	%o0
loop_2048:
	andcc	%i7,	0x19E0,	%g6
	flush	%l7 + 0x4C
	fbge,a	%fcc3,	loop_2049
	movrlez	%o4,	%o6,	%g4
	tpos	%icc,	0x0
	sdiv	%o2,	0x0755,	%i4
loop_2049:
	subc	%l1,	%o5,	%g1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%g3
	movrgz	%i2,	%o7,	%i1
	umulcc	%o1,	0x1661,	%i6
	fbn	%fcc0,	loop_2050
	alignaddrl	%l0,	%g5,	%i0
	add	%l4,	0x1D81,	%l6
	fnegd	%f2,	%f6
loop_2050:
	umul	%g2,	0x039D,	%i3
	movrne	%l5,	0x1E0,	%g7
	bvc,a	loop_2051
	fxnor	%f10,	%f30,	%f16
	edge8ln	%l2,	%l3,	%o3
	edge32n	%o0,	%i7,	%o4
loop_2051:
	fands	%f21,	%f5,	%f3
	edge8l	%g6,	%g4,	%o6
	movne	%icc,	%i4,	%l1
	orcc	%o5,	%g1,	%o2
	tl	%xcc,	0x3
	popc	0x19B8,	%i5
	movg	%icc,	%g3,	%o7
	fmovdn	%icc,	%f18,	%f10
	ldsw	[%l7 + 0x7C],	%i2
	fmovsl	%icc,	%f9,	%f10
	pdist	%f28,	%f22,	%f8
	tneg	%xcc,	0x4
	xor	%i1,	%i6,	%o1
	movrlz	%l0,	%g5,	%i0
	alignaddrl	%l6,	%g2,	%l4
	orcc	%i3,	%g7,	%l2
	umulcc	%l5,	%l3,	%o0
	brgez,a	%o3,	loop_2052
	edge8n	%o4,	%i7,	%g6
	orcc	%o6,	0x16B5,	%g4
	movrlz	%i4,	0x39B,	%o5
loop_2052:
	or	%l1,	0x0F29,	%o2
	movge	%icc,	%i5,	%g1
	fmovrdlez	%o7,	%f4,	%f26
	nop
	setx	loop_2053,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsg	%xcc,	%f2,	%f0
	srax	%i2,	%g3,	%i6
	sir	0x1060
loop_2053:
	movvs	%xcc,	%o1,	%i1
	edge16ln	%l0,	%g5,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g2,	%l4
	sethi	0x0527,	%i0
	edge16ln	%i3,	%l2,	%l5
	smul	%l3,	0x1F00,	%g7
	xorcc	%o3,	0x1CC0,	%o4
	edge16l	%i7,	%g6,	%o0
	fmovdvc	%icc,	%f31,	%f26
	tsubcc	%o6,	%i4,	%g4
	udivcc	%l1,	0x0008,	%o2
	movcc	%xcc,	%o5,	%i5
	fbne,a	%fcc1,	loop_2054
	edge16	%o7,	%g1,	%g3
	bn,pn	%xcc,	loop_2055
	ld	[%l7 + 0x24],	%f4
loop_2054:
	fmovscc	%icc,	%f25,	%f15
	sethi	0x1A79,	%i6
loop_2055:
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f10
	edge16ln	%i2,	%o1,	%i1
	xor	%g5,	%l0,	%g2
	alignaddr	%l6,	%i0,	%i3
	fpadd16s	%f31,	%f30,	%f3
	alignaddrl	%l2,	%l4,	%l3
	sub	%l5,	%o3,	%o4
	call	loop_2056
	array32	%g7,	%g6,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o6,	0x1222,	%o0
loop_2056:
	edge8l	%i4,	%l1,	%g4
	fmovsneg	%icc,	%f18,	%f21
	andn	%o5,	%i5,	%o2
	fmovrsgz	%g1,	%f18,	%f23
	fmovdvs	%xcc,	%f29,	%f28
	tvs	%icc,	0x3
	set	0x5E, %i0
	lduba	[%l7 + %i0] 0x0c,	%o7
	fabss	%f22,	%f26
	sth	%i6,	[%l7 + 0x6E]
	andncc	%i2,	%g3,	%o1
	xorcc	%i1,	%l0,	%g2
	ba	%icc,	loop_2057
	ldsw	[%l7 + 0x34],	%l6
	subccc	%g5,	%i0,	%i3
	orcc	%l2,	0x14C0,	%l4
loop_2057:
	te	%icc,	0x2
	taddcctv	%l5,	%o3,	%l3
	nop
	setx	loop_2058,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fands	%f10,	%f21,	%f28
	edge16ln	%g7,	%g6,	%i7
	edge16l	%o4,	%o0,	%o6
loop_2058:
	for	%f20,	%f26,	%f10
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x64] %asi,	%l1
	movvc	%xcc,	%g4,	%o5
	tge	%xcc,	0x6
	array8	%i5,	%i4,	%g1
	xorcc	%o7,	0x09B2,	%i6
	bne,a	%xcc,	loop_2059
	movrlez	%i2,	%o2,	%o1
	alignaddrl	%g3,	%l0,	%i1
	mulx	%l6,	%g5,	%i0
loop_2059:
	andncc	%g2,	%i3,	%l4
	popc	%l5,	%o3
	nop
	setx	loop_2060,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsl	%xcc,	%f11,	%f23
	fmovrse	%l2,	%f12,	%f6
	andncc	%g7,	%g6,	%i7
loop_2060:
	sethi	0x10A2,	%o4
	fcmpd	%fcc1,	%f6,	%f18
	fsrc1s	%f18,	%f19
	call	loop_2061
	fmovdle	%icc,	%f15,	%f1
	nop
	setx	loop_2062,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%o0,	%l3,	%l1
loop_2061:
	tsubcctv	%g4,	0x1700,	%o6
	fcmpne32	%f4,	%f24,	%o5
loop_2062:
	movpos	%xcc,	%i4,	%g1
	fcmpgt16	%f24,	%f12,	%o7
	orncc	%i6,	%i5,	%o2
	edge8ln	%i2,	%o1,	%g3
	fandnot1	%f20,	%f26,	%f24
	edge32	%i1,	%l0,	%g5
	fmovspos	%icc,	%f4,	%f21
	movvs	%xcc,	%i0,	%l6
	membar	0x01
	fmovrdne	%g2,	%f0,	%f24
	set	0x42, %g6
	ldsha	[%l7 + %g6] 0x89,	%i3
	movrlz	%l5,	0x387,	%l4
	subc	%o3,	0x0758,	%l2
	addccc	%g6,	%g7,	%o4
	fcmpeq32	%f10,	%f0,	%o0
	fsrc2s	%f3,	%f2
	sdivcc	%i7,	0x09B1,	%l1
	movgu	%xcc,	%g4,	%l3
	add	%o6,	%i4,	%g1
	movne	%icc,	%o5,	%i6
	sdivx	%o7,	0x0633,	%o2
	tleu	%icc,	0x7
	addc	%i2,	%o1,	%i5
	addccc	%g3,	0x1C42,	%l0
	movvc	%icc,	%g5,	%i0
	fandnot2s	%f14,	%f4,	%f13
	tl	%xcc,	0x4
	tcc	%icc,	0x7
	ldub	[%l7 + 0x2B],	%l6
	stbar
	fmovdleu	%icc,	%f9,	%f2
	alignaddrl	%g2,	%i3,	%i1
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x2c,	%l4
	movg	%xcc,	%l5,	%o3
	fmovd	%f20,	%f10
	movrlz	%l2,	%g6,	%g7
	srlx	%o4,	%i7,	%l1
	fandnot1	%f2,	%f16,	%f2
	move	%icc,	%o0,	%l3
	tleu	%xcc,	0x6
	fmovsle	%xcc,	%f26,	%f14
	fpadd16	%f26,	%f26,	%f24
	edge8l	%g4,	%o6,	%i4
	movg	%icc,	%g1,	%i6
	fnegs	%f11,	%f30
	std	%f22,	[%l7 + 0x58]
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	fandnot2	%f2,	%f18,	%f16
	edge16ln	%o5,	%i2,	%o2
	tneg	%xcc,	0x6
	or	%o1,	%g3,	%l0
	movgu	%icc,	%i5,	%i0
	orcc	%l6,	%g2,	%i3
	fbn,a	%fcc2,	loop_2063
	sth	%g5,	[%l7 + 0x46]
	fcmpeq16	%f28,	%f18,	%i1
	tge	%icc,	0x5
loop_2063:
	membar	0x5D
	fzero	%f0
	addccc	%l4,	%l5,	%o3
	tleu	%xcc,	0x5
	fcmpes	%fcc1,	%f0,	%f16
	bl	%xcc,	loop_2064
	movcs	%icc,	%g6,	%l2
	fandnot1	%f10,	%f8,	%f4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%g7
loop_2064:
	sdiv	%i7,	0x1C11,	%o4
	orn	%l1,	0x039B,	%o0
	movl	%xcc,	%l3,	%o6
	movleu	%xcc,	%g4,	%g1
	srlx	%i6,	%i4,	%o7
	or	%o5,	%o2,	%o1
	tcc	%icc,	0x6
	fandnot2	%f30,	%f6,	%f4
	fcmpne32	%f26,	%f10,	%i2
	stx	%l0,	[%l7 + 0x48]
	movpos	%xcc,	%i5,	%i0
	fsrc1	%f2,	%f4
	movrlez	%g3,	0x3E3,	%g2
	fmul8ulx16	%f10,	%f24,	%f26
	movrgz	%l6,	%i3,	%g5
	fcmple16	%f10,	%f24,	%i1
	fone	%f10
	mulscc	%l5,	%o3,	%g6
	edge8n	%l2,	%l4,	%g7
	fblg	%fcc0,	loop_2065
	fbe	%fcc2,	loop_2066
	smulcc	%o4,	%i7,	%o0
	fmovsvc	%xcc,	%f29,	%f11
loop_2065:
	fpadd32	%f30,	%f12,	%f0
loop_2066:
	popc	%l3,	%o6
	edge32	%l1,	%g4,	%g1
	fbl,a	%fcc2,	loop_2067
	sra	%i4,	0x0D,	%o7
	ble,pt	%icc,	loop_2068
	movcc	%icc,	%o5,	%o2
loop_2067:
	movg	%icc,	%o1,	%i6
	call	loop_2069
loop_2068:
	fxor	%f2,	%f22,	%f0
	fnegs	%f14,	%f23
	edge16	%l0,	%i2,	%i0
loop_2069:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%i5
	tpos	%icc,	0x3
	alignaddr	%g3,	%l6,	%i3
	movge	%icc,	%g5,	%i1
	fbul,a	%fcc2,	loop_2070
	fnegd	%f30,	%f2
	edge32n	%l5,	%o3,	%g2
	stb	%g6,	[%l7 + 0x34]
loop_2070:
	mulx	%l2,	0x1D3F,	%l4
	tleu	%icc,	0x7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x12] %asi,	%g7
	te	%icc,	0x2
	movge	%icc,	%o4,	%o0
	tl	%xcc,	0x6
	addccc	%l3,	0x047F,	%i7
	tvs	%icc,	0x7
	nop
	set	0x0C, %l0
	stw	%l1,	[%l7 + %l0]
	edge32n	%g4,	%g1,	%i4
	srl	%o6,	0x12,	%o7
	ta	%xcc,	0x6
	fcmple16	%f20,	%f12,	%o5
	fmovs	%f27,	%f23
	tvc	%xcc,	0x2
	or	%o1,	%i6,	%l0
	bpos,pn	%xcc,	loop_2071
	sdivx	%i2,	0x0CFB,	%o2
	movgu	%xcc,	%i5,	%i0
	movleu	%icc,	%l6,	%g3
loop_2071:
	fmovrdlz	%i3,	%f30,	%f22
	swap	[%l7 + 0x58],	%g5
	brlz	%i1,	loop_2072
	ldsw	[%l7 + 0x1C],	%l5
	fbuge,a	%fcc2,	loop_2073
	and	%g2,	%g6,	%o3
loop_2072:
	xnor	%l4,	0x12A8,	%l2
	edge8n	%g7,	%o4,	%l3
loop_2073:
	fmovrse	%i7,	%f14,	%f1
	fmovd	%f16,	%f30
	fbul	%fcc0,	loop_2074
	mulx	%o0,	0x000B,	%l1
	edge8ln	%g4,	%g1,	%o6
	movcc	%xcc,	%o7,	%i4
loop_2074:
	addccc	%o5,	0x1ED9,	%o1
	stbar
	bshuffle	%f0,	%f18,	%f8
	bneg,pt	%xcc,	loop_2075
	umulcc	%l0,	%i2,	%o2
	nop
	setx	loop_2076,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot2	%f26,	%f10
loop_2075:
	xnor	%i6,	0x19F8,	%i0
	popc	%i5,	%l6
loop_2076:
	srax	%g3,	%i3,	%g5
	fmuld8ulx16	%f23,	%f1,	%f30
	array16	%i1,	%g2,	%l5
	sll	%g6,	%o3,	%l4
	pdist	%f22,	%f14,	%f8
	movg	%icc,	%g7,	%l2
	tge	%xcc,	0x2
	movrlz	%o4,	0x33A,	%l3
	st	%f11,	[%l7 + 0x10]
	tsubcctv	%i7,	%o0,	%l1
	srl	%g1,	0x1E,	%g4
	edge16	%o7,	%i4,	%o5
	edge8l	%o1,	%o6,	%l0
	addc	%o2,	%i2,	%i6
	movne	%icc,	%i5,	%l6
	fmovrde	%g3,	%f6,	%f8
	movrgz	%i0,	%g5,	%i3
	tneg	%icc,	0x4
	fbu,a	%fcc1,	loop_2077
	smul	%g2,	0x0F8D,	%l5
	sir	0x1EA9
	movpos	%icc,	%i1,	%g6
loop_2077:
	ldub	[%l7 + 0x33],	%l4
	fand	%f8,	%f4,	%f26
	and	%g7,	%o3,	%o4
	set	0x17, %o0
	stba	%l2,	[%l7 + %o0] 0x19
	andn	%i7,	0x1A2A,	%o0
	fmovdcc	%xcc,	%f27,	%f16
	mulx	%l1,	%g1,	%g4
	be	loop_2078
	subc	%o7,	%l3,	%i4
	fmovdle	%icc,	%f0,	%f9
	movg	%icc,	%o5,	%o1
loop_2078:
	xnorcc	%l0,	0x1467,	%o6
	udivcc	%o2,	0x0A60,	%i2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%l6
	srlx	%g3,	%i0,	%i5
	movcc	%icc,	%g5,	%i3
	movpos	%xcc,	%l5,	%g2
	smulcc	%g6,	0x163F,	%l4
	popc	%i1,	%o3
	edge16ln	%o4,	%l2,	%i7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%o0
	nop
	setx	loop_2079,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bl,pn	%xcc,	loop_2080
	srlx	%l1,	0x00,	%g4
	sra	%o7,	0x16,	%g1
loop_2079:
	tvs	%icc,	0x2
loop_2080:
	edge16	%l3,	%i4,	%o1
	fmovsg	%icc,	%f5,	%f30
	fnegs	%f13,	%f4
	fbug	%fcc1,	loop_2081
	array16	%o5,	%o6,	%o2
	fxors	%f31,	%f3,	%f22
	smulcc	%l0,	0x00CC,	%i2
loop_2081:
	addccc	%i6,	0x03FB,	%g3
	tsubcctv	%l6,	%i5,	%g5
	movrgez	%i0,	0x242,	%l5
	sdiv	%i3,	0x0963,	%g6
	movgu	%xcc,	%l4,	%i1
	tne	%icc,	0x3
	edge16n	%o3,	%g2,	%l2
	orcc	%i7,	0x0AFA,	%g7
	fmovsne	%icc,	%f7,	%f11
	smulcc	%o4,	%l1,	%o0
	edge16	%o7,	%g4,	%l3
	bg,pn	%xcc,	loop_2082
	nop
	setx loop_2083, %l0, %l1
	jmpl %l1, %i4
	movrgz	%g1,	0x37E,	%o1
	fsrc2s	%f4,	%f19
loop_2082:
	tleu	%icc,	0x7
loop_2083:
	movcc	%icc,	%o5,	%o2
	fnot2s	%f19,	%f24
	sdiv	%l0,	0x069C,	%i2
	fbe	%fcc1,	loop_2084
	bn	loop_2085
	call	loop_2086
	fmovrdgez	%i6,	%f20,	%f20
loop_2084:
	movcs	%xcc,	%o6,	%g3
loop_2085:
	ta	%xcc,	0x6
loop_2086:
	movge	%icc,	%l6,	%i5
	udivcc	%i0,	0x08C4,	%g5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x32] %asi,	%l5
	subc	%g6,	%l4,	%i3
	fmovdn	%xcc,	%f23,	%f8
	edge16l	%i1,	%g2,	%l2
	fmovsg	%xcc,	%f3,	%f29
	tvc	%icc,	0x4
	bvc,a	%icc,	loop_2087
	fxors	%f28,	%f5,	%f21
	orn	%o3,	0x1405,	%g7
	fmovsle	%xcc,	%f2,	%f7
loop_2087:
	taddcctv	%i7,	0x15CF,	%l1
	bgu,pn	%xcc,	loop_2088
	addcc	%o4,	0x1944,	%o0
	xorcc	%o7,	0x1BA0,	%g4
	bpos,a	%icc,	loop_2089
loop_2088:
	mova	%icc,	%i4,	%l3
	sdivx	%o1,	0x08F6,	%g1
	edge32	%o5,	%o2,	%i2
loop_2089:
	edge32n	%l0,	%o6,	%i6
	fpmerge	%f24,	%f12,	%f18
	smulcc	%g3,	0x1CA4,	%l6
	subc	%i5,	0x13E4,	%g5
	fmovrdlez	%l5,	%f10,	%f16
	fpadd16s	%f17,	%f1,	%f4
	udiv	%i0,	0x1376,	%l4
	fmovdl	%icc,	%f2,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i3,	%i1,	%g6
	tsubcctv	%l2,	0x0AAF,	%g2
	fmovrsgez	%o3,	%f2,	%f30
	fnot1s	%f21,	%f22
	alignaddrl	%i7,	%g7,	%o4
	fmovsa	%xcc,	%f28,	%f13
	nop
	setx	loop_2090,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%l1,	%o0,	%g4
	sth	%o7,	[%l7 + 0x42]
	tvc	%xcc,	0x3
loop_2090:
	andncc	%l3,	%i4,	%o1
	subccc	%g1,	%o5,	%o2
	fbo,a	%fcc0,	loop_2091
	tge	%xcc,	0x0
	sllx	%i2,	%o6,	%l0
	tge	%xcc,	0x7
loop_2091:
	fpmerge	%f24,	%f26,	%f22
	tcc	%xcc,	0x0
	brlz,a	%g3,	loop_2092
	fbn,a	%fcc2,	loop_2093
	fmovsneg	%icc,	%f25,	%f22
	andcc	%i6,	%i5,	%g5
loop_2092:
	tge	%xcc,	0x6
loop_2093:
	addcc	%l6,	0x12F6,	%i0
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	srl	%l4,	%l5,	%i3
	sethi	0x1B75,	%i1
	fbuge	%fcc2,	loop_2094
	bpos,a	loop_2095
	umulcc	%l2,	0x04F1,	%g2
	smulcc	%g6,	0x15C1,	%o3
loop_2094:
	ta	%icc,	0x7
loop_2095:
	std	%f8,	[%l7 + 0x18]
	tgu	%xcc,	0x4
	fornot1s	%f12,	%f12,	%f1
	call	loop_2096
	fmovrdgz	%g7,	%f26,	%f0
	sir	0x0AA5
	addccc	%i7,	%l1,	%o0
loop_2096:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%g4
	fmovrslez	%o4,	%f6,	%f24
	set	0x77, %l3
	stba	%l3,	[%l7 + %l3] 0xeb
	membar	#Sync
	edge8	%o7,	%o1,	%g1
	fmovdle	%icc,	%f27,	%f30
	fmovd	%f28,	%f26
	fabss	%f20,	%f20
	movvs	%icc,	%i4,	%o5
	swap	[%l7 + 0x24],	%o2
	orcc	%i2,	0x1D8D,	%l0
	xnorcc	%g3,	0x1E78,	%o6
	orcc	%i6,	0x0ED0,	%g5
	te	%icc,	0x7
	movcc	%xcc,	%i5,	%i0
	movcs	%xcc,	%l4,	%l6
	edge32	%i3,	%i1,	%l2
	ldstub	[%l7 + 0x1C],	%l5
	sir	0x0D28
	fbe	%fcc3,	loop_2097
	srlx	%g2,	0x12,	%g6
	orncc	%g7,	%i7,	%l1
	brgez	%o3,	loop_2098
loop_2097:
	and	%g4,	0x0088,	%o0
	movneg	%xcc,	%l3,	%o4
	array16	%o1,	%g1,	%i4
loop_2098:
	tpos	%icc,	0x2
	addcc	%o5,	%o2,	%o7
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x24,	%i2
	ldsb	[%l7 + 0x57],	%g3
	fzero	%f26
	ld	[%l7 + 0x08],	%f30
	fpadd32	%f24,	%f12,	%f8
	move	%icc,	%l0,	%o6
	fcmpne32	%f20,	%f26,	%g5
	orncc	%i6,	%i5,	%l4
	fmovsvs	%xcc,	%f30,	%f8
	fpmerge	%f16,	%f4,	%f14
	sub	%i0,	%l6,	%i1
	movvs	%xcc,	%l2,	%i3
	sub	%g2,	%l5,	%g6
	movrlez	%g7,	%i7,	%o3
	fpsub32	%f10,	%f24,	%f22
	srl	%g4,	%l1,	%l3
	fmovrslez	%o0,	%f25,	%f22
	brgez,a	%o1,	loop_2099
	fmovsneg	%xcc,	%f29,	%f21
	edge16n	%g1,	%o4,	%i4
	fcmpgt16	%f2,	%f30,	%o2
loop_2099:
	movneg	%icc,	%o7,	%o5
	movne	%icc,	%i2,	%l0
	fpadd32	%f14,	%f0,	%f2
	fmovsg	%icc,	%f17,	%f31
	fornot2	%f0,	%f2,	%f16
	movgu	%xcc,	%o6,	%g5
	array8	%i6,	%i5,	%g3
	edge32n	%i0,	%l4,	%l6
	siam	0x6
	smul	%l2,	%i1,	%g2
	srlx	%l5,	%g6,	%i3
	andncc	%g7,	%o3,	%i7
	array16	%g4,	%l3,	%l1
	ble,pn	%icc,	loop_2100
	movrgz	%o0,	0x1A4,	%g1
	edge32ln	%o4,	%i4,	%o2
	udivx	%o1,	0x016D,	%o5
loop_2100:
	tneg	%xcc,	0x2
	movvs	%icc,	%o7,	%l0
	taddcctv	%i2,	0x0683,	%o6
	bcs,a,pt	%icc,	loop_2101
	movrgz	%i6,	%g5,	%g3
	set	0x3c0, %o3
	nop 	! 	stxa	%i5,	[%g0 + %o3] 0x40 ripped by fixASI40.pl
loop_2101:
	movneg	%xcc,	%i0,	%l6
	fmovsvs	%xcc,	%f26,	%f29
	tn	%icc,	0x2
	array8	%l2,	%l4,	%i1
	call	loop_2102
	movrne	%l5,	0x107,	%g6
	swap	[%l7 + 0x0C],	%g2
	movne	%icc,	%g7,	%i3
loop_2102:
	fba	%fcc2,	loop_2103
	fexpand	%f12,	%f6
	bgu,a,pt	%xcc,	loop_2104
	fcmps	%fcc0,	%f20,	%f27
loop_2103:
	mulx	%o3,	0x18B3,	%g4
	fmovsn	%xcc,	%f11,	%f20
loop_2104:
	movgu	%xcc,	%l3,	%i7
	stx	%l1,	[%l7 + 0x30]
	sllx	%g1,	0x0A,	%o0
	fmovdpos	%xcc,	%f31,	%f6
	orn	%i4,	%o4,	%o2
	fmovsn	%icc,	%f22,	%f14
	fnor	%f26,	%f10,	%f10
	tsubcctv	%o1,	0x043E,	%o7
	or	%l0,	0x0AC7,	%o5
	fsrc2	%f22,	%f12
	addcc	%o6,	0x128C,	%i6
	array32	%i2,	%g3,	%g5
	sra	%i5,	0x0A,	%l6
	fornot1s	%f3,	%f1,	%f15
	edge16ln	%i0,	%l2,	%i1
	fbu,a	%fcc0,	loop_2105
	fmovsg	%icc,	%f8,	%f9
	umul	%l5,	%l4,	%g2
	call	loop_2106
loop_2105:
	fnot1s	%f10,	%f18
	st	%f22,	[%l7 + 0x34]
	fmovsle	%xcc,	%f21,	%f19
loop_2106:
	fpadd16s	%f6,	%f1,	%f12
	bgu,a,pn	%xcc,	loop_2107
	fbu,a	%fcc3,	loop_2108
	fmovdle	%icc,	%f5,	%f9
	nop
	setx loop_2109, %l0, %l1
	jmpl %l1, %g7
loop_2107:
	array32	%g6,	%i3,	%o3
loop_2108:
	fpadd16s	%f30,	%f12,	%f31
	srlx	%g4,	0x09,	%l3
loop_2109:
	alignaddrl	%i7,	%g1,	%l1
	array16	%o0,	%o4,	%i4
	movn	%xcc,	%o1,	%o2
	mova	%xcc,	%o7,	%l0
	movge	%xcc,	%o6,	%i6
	fpsub16	%f16,	%f2,	%f16
	tpos	%xcc,	0x7
	fmovrslz	%o5,	%f16,	%f26
	tvc	%icc,	0x5
	mova	%xcc,	%g3,	%i2
	bpos,a	loop_2110
	umul	%g5,	0x1BA3,	%i5
	andn	%l6,	0x1238,	%l2
	ble,a,pn	%xcc,	loop_2111
loop_2110:
	tle	%xcc,	0x2
	ta	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%i0
loop_2111:
	movneg	%xcc,	%i1,	%l4
	andncc	%g2,	%l5,	%g6
	fbul,a	%fcc3,	loop_2112
	edge32ln	%i3,	%g7,	%g4
	popc	0x1A33,	%l3
	taddcc	%i7,	0x1CC9,	%g1
loop_2112:
	fmul8x16au	%f21,	%f4,	%f18
	edge16	%o3,	%o0,	%o4
	flush	%l7 + 0x78
	fxnor	%f12,	%f8,	%f20
	stb	%i4,	[%l7 + 0x3A]
	sdivx	%o1,	0x1929,	%o2
	movge	%icc,	%o7,	%l1
	movrgez	%o6,	%l0,	%i6
	bpos,a	loop_2113
	taddcc	%o5,	0x128A,	%g3
	fbg	%fcc0,	loop_2114
	xor	%g5,	0x0E38,	%i5
loop_2113:
	siam	0x7
	mulscc	%i2,	%l2,	%l6
loop_2114:
	ldx	[%l7 + 0x78],	%i1
	edge32ln	%l4,	%g2,	%l5
	bleu,a	loop_2115
	fbug,a	%fcc2,	loop_2116
	tsubcctv	%i0,	0x0C53,	%i3
	fmovd	%f22,	%f6
loop_2115:
	array32	%g6,	%g7,	%g4
loop_2116:
	bcs	loop_2117
	popc	0x08E4,	%l3
	movrlz	%g1,	%o3,	%i7
	fbne,a	%fcc0,	loop_2118
loop_2117:
	fnot1s	%f1,	%f15
	fpsub32s	%f1,	%f30,	%f25
	taddcctv	%o4,	0x1D7F,	%i4
loop_2118:
	alignaddrl	%o0,	%o2,	%o1
	movleu	%xcc,	%o7,	%l1
	tsubcc	%l0,	0x0DAF,	%i6
	orncc	%o6,	%o5,	%g3
	faligndata	%f0,	%f14,	%f20
	umulcc	%i5,	0x1EC1,	%g5
	bcc,pn	%icc,	loop_2119
	array32	%i2,	%l6,	%l2
	fmuld8ulx16	%f27,	%f9,	%f2
	fmovdl	%icc,	%f16,	%f15
loop_2119:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x46] %asi,	%i1
	movrgez	%l4,	0x115,	%g2
	stw	%l5,	[%l7 + 0x10]
	sll	%i3,	%g6,	%g7
	edge32l	%g4,	%l3,	%i0
	array8	%g1,	%o3,	%o4
	edge8n	%i7,	%o0,	%o2
	srlx	%o1,	0x1D,	%i4
	movrlz	%l1,	%o7,	%i6
	fzeros	%f16
	std	%o6,	[%l7 + 0x08]
	taddcctv	%l0,	%g3,	%i5
	fmul8sux16	%f2,	%f20,	%f4
	movl	%icc,	%g5,	%i2
	movn	%xcc,	%l6,	%o5
	std	%f14,	[%l7 + 0x68]
	edge16ln	%i1,	%l2,	%g2
	edge8ln	%l4,	%i3,	%g6
	orncc	%g7,	%l5,	%g4
	fors	%f28,	%f25,	%f9
	std	%l2,	[%l7 + 0x70]
	movcs	%xcc,	%g1,	%o3
	fbue	%fcc1,	loop_2120
	fsrc1	%f28,	%f8
	brnz	%i0,	loop_2121
	umul	%o4,	0x1C8F,	%o0
loop_2120:
	movl	%icc,	%o2,	%i7
	fzeros	%f24
loop_2121:
	fnot1	%f0,	%f2
	stx	%i4,	[%l7 + 0x58]
	mova	%icc,	%l1,	%o1
	call	loop_2122
	tneg	%icc,	0x6
	fmovdpos	%icc,	%f10,	%f26
	movn	%icc,	%i6,	%o6
loop_2122:
	movneg	%icc,	%o7,	%g3
	taddcc	%l0,	%i5,	%g5
	fxor	%f4,	%f28,	%f4
	fbne,a	%fcc2,	loop_2123
	movre	%l6,	%i2,	%o5
	addcc	%i1,	0x0DAD,	%l2
	taddcctv	%g2,	%i3,	%g6
loop_2123:
	nop
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf0
	membar	#Sync
	edge8	%l4,	%l5,	%g4
	fmovsneg	%icc,	%f18,	%f20
	movne	%xcc,	%g7,	%l3
	tn	%icc,	0x2
	prefetch	[%l7 + 0x70],	 0x3
	alignaddr	%o3,	%g1,	%o4
	fnand	%f28,	%f28,	%f30
	subccc	%o0,	%o2,	%i7
	bl	%icc,	loop_2124
	movrgez	%i4,	%i0,	%o1
	prefetch	[%l7 + 0x3C],	 0x2
	brnz	%i6,	loop_2125
loop_2124:
	bcc	%icc,	loop_2126
	fnegd	%f22,	%f26
	ld	[%l7 + 0x50],	%f24
loop_2125:
	tn	%icc,	0x2
loop_2126:
	subc	%o6,	0x17BD,	%o7
	movrlez	%g3,	0x162,	%l0
	tgu	%xcc,	0x2
	popc	0x00B9,	%i5
	fone	%f28
	fmovrdne	%l1,	%f4,	%f24
	swap	[%l7 + 0x78],	%g5
	nop
	setx loop_2127, %l0, %l1
	jmpl %l1, %l6
	andcc	%o5,	%i1,	%l2
	taddcctv	%i2,	%i3,	%g6
	srlx	%l4,	%g2,	%l5
loop_2127:
	brlz	%g4,	loop_2128
	movleu	%xcc,	%l3,	%g7
	tsubcctv	%o3,	%g1,	%o0
	fornot1	%f2,	%f20,	%f6
loop_2128:
	ldstub	[%l7 + 0x71],	%o4
	sdiv	%o2,	0x18FF,	%i7
	xnor	%i0,	%i4,	%i6
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x40] %asi
	fnands	%f9,	%f1,	%f7
	xorcc	%o1,	%o6,	%o7
	set	0x78, %i5
	ldsba	[%l7 + %i5] 0x15,	%l0
	andcc	%g3,	0x1E1C,	%l1
	xnor	%i5,	0x1738,	%g5
	te	%icc,	0x1
	movge	%xcc,	%l6,	%i1
	array16	%l2,	%i2,	%o5
	edge8	%g6,	%l4,	%g2
	ldsb	[%l7 + 0x68],	%i3
	tl	%xcc,	0x1
	alignaddr	%g4,	%l3,	%l5
	taddcctv	%o3,	%g1,	%g7
	fbl	%fcc0,	loop_2129
	fba,a	%fcc0,	loop_2130
	fnegd	%f30,	%f14
	bne,a,pn	%icc,	loop_2131
loop_2129:
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%f0
loop_2130:
	brgz,a	%o4,	loop_2132
	edge16n	%o2,	%o0,	%i0
loop_2131:
	array16	%i4,	%i6,	%o1
	brgz,a	%o6,	loop_2133
loop_2132:
	lduh	[%l7 + 0x78],	%o7
	movgu	%icc,	%l0,	%g3
	set	0x78, %g7
	stda	%l0,	[%l7 + %g7] 0x0c
loop_2133:
	tg	%icc,	0x7
	subcc	%i5,	0x113D,	%i7
	tcs	%xcc,	0x0
	edge16l	%l6,	%g5,	%l2
	fblg	%fcc3,	loop_2134
	and	%i2,	%i1,	%g6
	fpmerge	%f17,	%f16,	%f12
	addc	%l4,	0x0A18,	%o5
loop_2134:
	fcmpne16	%f2,	%f14,	%i3
	movcc	%xcc,	%g2,	%g4
	brz	%l3,	loop_2135
	edge8ln	%o3,	%g1,	%l5
	andn	%g7,	0x1582,	%o2
	fbn	%fcc0,	loop_2136
loop_2135:
	fmovsle	%xcc,	%f20,	%f9
	movcs	%icc,	%o4,	%o0
	xnorcc	%i4,	0x01D6,	%i0
loop_2136:
	movneg	%icc,	%o1,	%i6
	fmovrdne	%o7,	%f8,	%f2
	fmovrde	%l0,	%f4,	%f14
	movle	%xcc,	%o6,	%g3
	subccc	%i5,	%i7,	%l1
	alignaddr	%l6,	%l2,	%g5
	sllx	%i1,	0x0F,	%g6
	std	%f10,	[%l7 + 0x78]
	move	%xcc,	%i2,	%o5
	std	%f30,	[%l7 + 0x28]
	stb	%i3,	[%l7 + 0x24]
	fmovsne	%xcc,	%f5,	%f17
	fandnot2s	%f11,	%f30,	%f25
	fcmpd	%fcc0,	%f0,	%f18
	tsubcc	%g2,	0x0891,	%l4
	tne	%icc,	0x6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l3
	std	%g4,	[%l7 + 0x48]
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x48] %asi,	%o3
	sra	%l5,	%g7,	%o2
	movle	%icc,	%g1,	%o4
	tn	%icc,	0x7
	sll	%o0,	%i0,	%o1
	edge32n	%i6,	%i4,	%l0
	sll	%o7,	%g3,	%o6
	tsubcctv	%i7,	0x152D,	%i5
	fba	%fcc0,	loop_2137
	fandnot2	%f14,	%f16,	%f6
	fba	%fcc1,	loop_2138
	taddcc	%l1,	%l2,	%g5
loop_2137:
	array16	%i1,	%l6,	%g6
	brnz	%i2,	loop_2139
loop_2138:
	fmovsneg	%icc,	%f25,	%f7
	orcc	%i3,	%o5,	%g2
	edge8	%l4,	%l3,	%o3
loop_2139:
	sdivcc	%g4,	0x18F4,	%g7
	bgu,a,pn	%icc,	loop_2140
	sll	%o2,	%l5,	%g1
	udivx	%o0,	0x1D5F,	%i0
	sdivcc	%o4,	0x1CAF,	%i6
loop_2140:
	sllx	%o1,	0x19,	%l0
	edge32l	%o7,	%i4,	%o6
	fmovse	%icc,	%f8,	%f31
	fbug	%fcc2,	loop_2141
	edge32ln	%i7,	%g3,	%i5
	srlx	%l1,	0x1C,	%g5
	fmovrdgez	%l2,	%f26,	%f0
loop_2141:
	fbg	%fcc0,	loop_2142
	fmuld8sux16	%f3,	%f7,	%f22
	wr	%g0,	0x2b,	%asi
	stxa	%i1,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2142:
	edge16ln	%g6,	%i2,	%i3
	bvc,a	loop_2143
	udiv	%l6,	0x1ED8,	%g2
	movne	%xcc,	%o5,	%l3
	fzeros	%f2
loop_2143:
	fand	%f22,	%f2,	%f10
	orncc	%l4,	0x032C,	%o3
	set	0x5C, %i4
	stha	%g4,	[%l7 + %i4] 0x23
	membar	#Sync
	fmovdcs	%xcc,	%f27,	%f29
	sdivcc	%g7,	0x06C4,	%l5
	membar	0x57
	andncc	%g1,	%o0,	%i0
	edge16l	%o2,	%o4,	%o1
	fmovsl	%xcc,	%f20,	%f18
	bn,pt	%icc,	loop_2144
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f12,	%f9
	edge8ln	%l0,	%o7,	%i6
loop_2144:
	fmovdvc	%xcc,	%f30,	%f16
	movg	%icc,	%i4,	%o6
	taddcctv	%i7,	0x1AB8,	%i5
	array8	%l1,	%g3,	%l2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x20] %asi,	%g5
	alignaddr	%g6,	%i2,	%i1
	fand	%f12,	%f8,	%f16
	srlx	%l6,	0x1E,	%g2
	fcmpne16	%f20,	%f20,	%i3
	alignaddrl	%l3,	%l4,	%o5
	tg	%xcc,	0x5
	alignaddr	%o3,	%g4,	%g7
	edge8ln	%l5,	%o0,	%g1
	set	0x40, %i2
	stda	%o2,	[%l7 + %i2] 0x2f
	membar	#Sync
	fmovrslz	%o4,	%f22,	%f25
	array16	%i0,	%o1,	%l0
	tneg	%icc,	0x4
	stx	%o7,	[%l7 + 0x40]
	bneg,a,pt	%xcc,	loop_2145
	fcmpd	%fcc3,	%f2,	%f8
	srlx	%i6,	%o6,	%i4
	fands	%f29,	%f3,	%f18
loop_2145:
	fmovrslez	%i5,	%f7,	%f7
	tleu	%xcc,	0x6
	mulx	%l1,	0x18A6,	%i7
	tg	%icc,	0x2
	brnz,a	%g3,	loop_2146
	fbo,a	%fcc1,	loop_2147
	fmovdle	%icc,	%f24,	%f24
	prefetch	[%l7 + 0x34],	 0x2
loop_2146:
	stbar
loop_2147:
	array8	%g5,	%g6,	%i2
	membar	0x3F
	sdivx	%l2,	0x0A39,	%l6
	movn	%icc,	%i1,	%g2
	fmovspos	%xcc,	%f12,	%f3
	xnorcc	%l3,	%l4,	%i3
	fmovdgu	%xcc,	%f13,	%f6
	tsubcctv	%o3,	0x1B48,	%g4
	andncc	%g7,	%l5,	%o5
	st	%f31,	[%l7 + 0x50]
	fbu,a	%fcc2,	loop_2148
	tsubcc	%o0,	0x183E,	%g1
	te	%xcc,	0x7
	bleu,a,pn	%xcc,	loop_2149
loop_2148:
	fzeros	%f15
	std	%o4,	[%l7 + 0x68]
	set	0x08, %g5
	lduha	[%l7 + %g5] 0x18,	%i0
loop_2149:
	movrlz	%o1,	0x2B7,	%l0
	fmovrslez	%o2,	%f28,	%f1
	bn,a	loop_2150
	tn	%icc,	0x5
	movrlez	%i6,	0x27B,	%o7
	sub	%i4,	%o6,	%l1
loop_2150:
	fmovrdlez	%i5,	%f16,	%f30
	fors	%f0,	%f24,	%f21
	fmovsneg	%xcc,	%f22,	%f28
	edge32n	%i7,	%g3,	%g5
	bneg,a,pt	%xcc,	loop_2151
	bn,pt	%xcc,	loop_2152
	fbne	%fcc2,	loop_2153
	popc	%i2,	%l2
loop_2151:
	fmovdge	%xcc,	%f2,	%f31
loop_2152:
	swap	[%l7 + 0x18],	%g6
loop_2153:
	bvc	%xcc,	loop_2154
	sir	0x0C25
	fmuld8ulx16	%f29,	%f2,	%f6
	or	%i1,	%g2,	%l6
loop_2154:
	fpackfix	%f10,	%f16
	sir	0x0B06
	movcs	%icc,	%l3,	%l4
	movleu	%xcc,	%o3,	%i3
	fbe,a	%fcc1,	loop_2155
	popc	0x05B6,	%g7
	movl	%icc,	%l5,	%g4
	orncc	%o5,	%g1,	%o0
loop_2155:
	sub	%o4,	%o1,	%l0
	set	0x64, %o6
	stwa	%o2,	[%l7 + %o6] 0x11
	movcc	%icc,	%i0,	%o7
	udiv	%i6,	0x177F,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l1,	%i4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i7
	tle	%icc,	0x7
	nop
	setx	loop_2156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x5
	fbu,a	%fcc1,	loop_2157
	movg	%xcc,	%i5,	%g3
loop_2156:
	movrgez	%g5,	%i2,	%g6
	tcc	%xcc,	0x4
loop_2157:
	addccc	%i1,	%g2,	%l2
	fxor	%f10,	%f20,	%f18
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l4
	fmul8x16al	%f10,	%f0,	%f30
	tvc	%icc,	0x2
	mulx	%l6,	0x145E,	%o3
	tn	%xcc,	0x5
	array8	%i3,	%l5,	%g7
	call	loop_2158
	bcs,a	%xcc,	loop_2159
	movre	%o5,	0x0B7,	%g4
	edge8ln	%g1,	%o0,	%o4
loop_2158:
	edge32	%o1,	%o2,	%i0
loop_2159:
	umul	%o7,	%l0,	%o6
	fbug,a	%fcc2,	loop_2160
	edge16ln	%i6,	%i4,	%i7
	array32	%l1,	%i5,	%g3
	fbuge,a	%fcc2,	loop_2161
loop_2160:
	lduw	[%l7 + 0x0C],	%g5
	subc	%i2,	0x15E3,	%g6
	tvc	%icc,	0x0
loop_2161:
	tle	%icc,	0x4
	fpsub16s	%f2,	%f10,	%f25
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%g2
	brz,a	%i1,	loop_2162
	tcs	%xcc,	0x2
	sra	%l2,	%l4,	%l6
	movrlez	%o3,	0x273,	%i3
loop_2162:
	fmovdl	%icc,	%f0,	%f16
	fmovsvs	%xcc,	%f23,	%f6
	taddcc	%l5,	%g7,	%l3
	wr	%g0,	0x52,	%asi
	stxa	%g4,	[%g0 + 0x118] %asi
	fbn	%fcc3,	loop_2163
	mulx	%o5,	%o0,	%o4
	tleu	%icc,	0x1
	andcc	%o1,	0x04DF,	%o2
loop_2163:
	ldx	[%l7 + 0x58],	%i0
	srl	%g1,	%o7,	%o6
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	sll	%i4,	%i7,	%i6
	ldd	[%l7 + 0x18],	%f14
	xor	%l1,	%g3,	%g5
	edge8	%i2,	%g6,	%g2
	andcc	%i5,	%i1,	%l4
	array16	%l2,	%o3,	%l6
	taddcctv	%i3,	0x03E2,	%g7
	edge32ln	%l3,	%g4,	%o5
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tneg	%icc,	0x6
	edge16	%o0,	%o4,	%l5
	srlx	%o1,	0x00,	%o2
	movpos	%icc,	%i0,	%g1
	flush	%l7 + 0x78
	taddcctv	%o7,	0x1869,	%o6
	nop
	setx	loop_2164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot1s	%f16,	%f2
	movrgz	%i4,	%i7,	%l0
	tne	%icc,	0x1
loop_2164:
	fors	%f16,	%f18,	%f0
	sethi	0x1691,	%l1
	sll	%g3,	%i6,	%g5
	set	0x48, %l5
	lduwa	[%l7 + %l5] 0x18,	%i2
	siam	0x5
	array8	%g6,	%g2,	%i1
	xnorcc	%i5,	0x00EE,	%l2
	umul	%l4,	0x1AD0,	%o3
	bcc,pn	%xcc,	loop_2165
	or	%l6,	0x099A,	%g7
	xor	%l3,	0x12EB,	%g4
	fmovdle	%icc,	%f15,	%f22
loop_2165:
	or	%i3,	%o0,	%o4
	movrgz	%o5,	0x3F2,	%l5
	movcs	%icc,	%o1,	%o2
	fpmerge	%f9,	%f5,	%f10
	sdivcc	%i0,	0x1F72,	%g1
	movrgez	%o7,	0x160,	%i4
	fors	%f12,	%f17,	%f8
	udivcc	%o6,	0x0DC6,	%l0
	edge16ln	%i7,	%l1,	%i6
	fsrc2s	%f29,	%f12
	set	0x74, %o7
	ldsha	[%l7 + %o7] 0x18,	%g3
	ta	%xcc,	0x0
	bvs	%xcc,	loop_2166
	orn	%g5,	%i2,	%g2
	movrgez	%i1,	%g6,	%l2
	addc	%l4,	0x167E,	%o3
loop_2166:
	array32	%i5,	%l6,	%g7
	tpos	%icc,	0x0
	tle	%icc,	0x2
	tgu	%xcc,	0x3
	sdiv	%l3,	0x0257,	%i3
	tcs	%xcc,	0x2
	sub	%g4,	0x1758,	%o4
	fnot2	%f30,	%f24
	bne,a,pt	%icc,	loop_2167
	movleu	%icc,	%o0,	%o5
	fblg	%fcc2,	loop_2168
	bleu	%xcc,	loop_2169
loop_2167:
	tsubcc	%l5,	%o2,	%o1
	popc	%g1,	%i0
loop_2168:
	add	%o7,	%o6,	%l0
loop_2169:
	edge8n	%i7,	%i4,	%l1
	fbule,a	%fcc3,	loop_2170
	bgu,a,pn	%xcc,	loop_2171
	subccc	%i6,	%g5,	%i2
	add	%g2,	0x0C71,	%g3
loop_2170:
	xnor	%i1,	%l2,	%l4
loop_2171:
	addcc	%g6,	%o3,	%l6
	alignaddrl	%g7,	%l3,	%i5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array8	%g4,	%o4,	%i3
	edge16ln	%o0,	%o5,	%o2
	smulcc	%o1,	0x072A,	%g1
	lduw	[%l7 + 0x68],	%l5
	fmul8x16al	%f26,	%f4,	%f6
	tsubcc	%o7,	0x0486,	%i0
	edge16n	%l0,	%o6,	%i7
	fmovrslz	%i4,	%f1,	%f29
	nop
	setx loop_2172, %l0, %l1
	jmpl %l1, %l1
	st	%f5,	[%l7 + 0x20]
	fmovdvs	%icc,	%f30,	%f25
	edge16l	%g5,	%i2,	%i6
loop_2172:
	siam	0x5
	stbar
	movgu	%xcc,	%g2,	%g3
	fcmped	%fcc0,	%f30,	%f12
	mulx	%l2,	0x13B2,	%l4
	array32	%g6,	%i1,	%l6
	fmovsneg	%icc,	%f26,	%f26
	popc	%g7,	%l3
	fmovsge	%icc,	%f25,	%f21
	bl	loop_2173
	addcc	%o3,	0x116A,	%g4
	edge16	%i5,	%o4,	%o0
	fmovsg	%xcc,	%f10,	%f25
loop_2173:
	orncc	%i3,	0x0AC9,	%o2
	movgu	%xcc,	%o5,	%o1
	tg	%icc,	0x2
	addc	%g1,	0x038D,	%l5
	bn	loop_2174
	movle	%xcc,	%i0,	%o7
	sir	0x11C4
	fmovdvc	%xcc,	%f19,	%f26
loop_2174:
	sll	%l0,	%o6,	%i4
	movg	%xcc,	%i7,	%g5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x50] %asi,	%i2
	fmovsle	%xcc,	%f20,	%f3
	edge8ln	%l1,	%i6,	%g2
	sdiv	%g3,	0x1609,	%l2
	swap	[%l7 + 0x30],	%g6
	tvs	%icc,	0x7
	movleu	%xcc,	%i1,	%l4
	array8	%l6,	%g7,	%l3
	bpos,pn	%icc,	loop_2175
	fpadd32	%f14,	%f16,	%f10
	tcs	%icc,	0x5
	fcmpd	%fcc1,	%f16,	%f26
loop_2175:
	fmovdne	%icc,	%f4,	%f5
	movleu	%icc,	%o3,	%i5
	fmovspos	%xcc,	%f10,	%f22
	tg	%icc,	0x2
	movpos	%xcc,	%o4,	%o0
	ta	%xcc,	0x4
	mulscc	%i3,	%g4,	%o2
	ldsh	[%l7 + 0x42],	%o1
	pdist	%f22,	%f30,	%f18
	movgu	%xcc,	%g1,	%o5
	fzeros	%f12
	sth	%l5,	[%l7 + 0x74]
	alignaddr	%o7,	%i0,	%l0
	fones	%f15
	set	0x42, %l6
	ldsha	[%l7 + %l6] 0x18,	%i4
	movvc	%icc,	%i7,	%g5
	sllx	%o6,	0x15,	%i2
	fpack16	%f6,	%f8
	edge16ln	%l1,	%g2,	%i6
	and	%g3,	0x1442,	%l2
	movpos	%xcc,	%i1,	%g6
	movle	%xcc,	%l4,	%l6
	bleu	%icc,	loop_2176
	brz,a	%g7,	loop_2177
	movrgez	%o3,	%l3,	%i5
	fbuge	%fcc3,	loop_2178
loop_2176:
	tcs	%xcc,	0x7
loop_2177:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o0,	%i3,	%g4
loop_2178:
	ta	%icc,	0x2
	fcmps	%fcc3,	%f21,	%f8
	xnorcc	%o2,	0x1D22,	%o4
	fcmpeq16	%f10,	%f20,	%g1
	movvc	%xcc,	%o5,	%l5
	fxnor	%f2,	%f20,	%f6
	andn	%o1,	0x1F2E,	%o7
	edge32ln	%l0,	%i4,	%i7
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdiv	%i0,	0x1478,	%o6
	movrlez	%i2,	%l1,	%g5
	wr	%g0,	0xe2,	%asi
	stha	%i6,	[%l7 + 0x66] %asi
	membar	#Sync
	andn	%g3,	0x17A1,	%l2
	array32	%g2,	%g6,	%i1
	for	%f10,	%f6,	%f16
	tne	%icc,	0x2
	set	0x2C, %o1
	sta	%f11,	[%l7 + %o1] 0x80
	bg,pt	%xcc,	loop_2179
	sth	%l4,	[%l7 + 0x46]
	sdiv	%g7,	0x081F,	%l6
	array16	%l3,	%i5,	%o0
loop_2179:
	sdiv	%i3,	0x1DC5,	%g4
	tne	%icc,	0x7
	edge16n	%o3,	%o4,	%g1
	fmovdvs	%icc,	%f10,	%f6
	set	0x7E, %l4
	lduha	[%l7 + %l4] 0x14,	%o2
	fbe	%fcc1,	loop_2180
	fbuge	%fcc0,	loop_2181
	edge8l	%o5,	%o1,	%o7
	fmovsle	%icc,	%f13,	%f25
loop_2180:
	fcmpd	%fcc0,	%f20,	%f12
loop_2181:
	xnorcc	%l5,	0x02A9,	%i4
	fcmpgt16	%f12,	%f18,	%l0
	fmovdvc	%icc,	%f12,	%f1
	fcmpne32	%f30,	%f0,	%i7
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xe2,	%o6
	brlz	%i0,	loop_2182
	ldd	[%l7 + 0x68],	%f4
	add	%i2,	0x0834,	%l1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i6
loop_2182:
	tneg	%icc,	0x7
	fsrc1	%f28,	%f10
	fmovrslz	%l2,	%f29,	%f15
	movl	%icc,	%g3,	%g6
	sll	%i1,	0x00,	%g2
	fbg,a	%fcc1,	loop_2183
	sub	%l4,	0x192C,	%l6
	fmovsvc	%icc,	%f5,	%f24
	movl	%icc,	%l3,	%i5
loop_2183:
	mulscc	%g7,	%i3,	%g4
	fba	%fcc2,	loop_2184
	add	%o3,	%o4,	%g1
	mulscc	%o2,	0x0D26,	%o0
	fmul8ulx16	%f4,	%f0,	%f30
loop_2184:
	orcc	%o1,	%o7,	%o5
	srlx	%i4,	0x03,	%l0
	mova	%icc,	%i7,	%l5
	bleu,a,pn	%icc,	loop_2185
	movrgez	%i0,	%o6,	%l1
	fmovrde	%i2,	%f22,	%f18
	edge32	%i6,	%l2,	%g3
loop_2185:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%g5
	ldstub	[%l7 + 0x7C],	%g6
	tsubcc	%i1,	%l4,	%g2
	movle	%icc,	%l3,	%l6
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f0
	brlez	%i5,	loop_2186
	tvc	%icc,	0x3
	fmovdcc	%xcc,	%f23,	%f17
	edge16n	%i3,	%g4,	%o3
loop_2186:
	ldsb	[%l7 + 0x27],	%o4
	orcc	%g7,	0x11E8,	%o2
	andcc	%o0,	0x149A,	%o1
	sra	%o7,	0x1C,	%g1
	tge	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x48] %asi,	%i4
	move	%icc,	%l0,	%o5
	fnors	%f13,	%f30,	%f4
	fmovrslz	%i7,	%f16,	%f0
	edge16	%l5,	%o6,	%l1
	movleu	%icc,	%i2,	%i6
	ba,pn	%icc,	loop_2187
	fcmpeq32	%f30,	%f12,	%i0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g3
loop_2187:
	tgu	%xcc,	0x0
	taddcc	%g5,	0x1D5D,	%i1
	fbl,a	%fcc3,	loop_2188
	add	%g6,	%g2,	%l3
	tvs	%icc,	0x7
	fnot1	%f28,	%f26
loop_2188:
	nop
	set	0x10, %o4
	ldxa	[%g0 + %o4] 0x4f,	%l4
	movrlz	%l6,	%i5,	%g4
	fbug	%fcc3,	loop_2189
	tg	%icc,	0x2
	fmul8ulx16	%f16,	%f18,	%f26
	andncc	%o3,	%o4,	%g7
loop_2189:
	or	%i3,	%o0,	%o2
	set	0x50, %o5
	stha	%o7,	[%l7 + %o5] 0x89
	movrne	%g1,	%o1,	%l0
	udivx	%o5,	0x14A7,	%i4
	fmovscs	%xcc,	%f22,	%f0
	fornot1	%f10,	%f30,	%f14
	nop
	setx	loop_2190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ld	[%l7 + 0x08],	%f23
	sir	0x0DB9
	fmovdge	%xcc,	%f22,	%f18
loop_2190:
	tn	%xcc,	0x4
	tsubcctv	%l5,	0x18CF,	%o6
	andn	%l1,	%i2,	%i7
	fnor	%f24,	%f24,	%f10
	tn	%icc,	0x0
	srl	%i0,	%l2,	%i6
	brlez	%g5,	loop_2191
	edge32l	%g3,	%i1,	%g6
	movrgz	%g2,	0x056,	%l3
	movcc	%icc,	%l6,	%i5
loop_2191:
	movle	%icc,	%g4,	%o3
	movcc	%icc,	%l4,	%g7
	fsrc1	%f28,	%f26
	popc	%i3,	%o0
	add	%o4,	%o2,	%g1
	fblg,a	%fcc1,	loop_2192
	udivcc	%o7,	0x1BAC,	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l0,	%o5
loop_2192:
	edge32ln	%i4,	%l5,	%l1
	alignaddr	%o6,	%i2,	%i0
	movrlez	%l2,	0x056,	%i7
	swap	[%l7 + 0x48],	%i6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%g5
	set	0x2D, %g3
	stba	%g3,	[%l7 + %g3] 0x81
	brlez	%i1,	loop_2193
	pdist	%f2,	%f2,	%f14
	sra	%g6,	0x05,	%l3
	be	%icc,	loop_2194
loop_2193:
	fnegd	%f4,	%f14
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l6,	%g2
loop_2194:
	orncc	%i5,	0x1F36,	%g4
	movne	%icc,	%l4,	%o3
	ble,a,pt	%xcc,	loop_2195
	edge8n	%i3,	%g7,	%o0
	bn	loop_2196
	srax	%o2,	%g1,	%o7
loop_2195:
	sllx	%o4,	0x18,	%o1
	fbn,a	%fcc1,	loop_2197
loop_2196:
	fandnot1	%f6,	%f14,	%f26
	movrgez	%l0,	0x0CD,	%i4
	tg	%xcc,	0x4
loop_2197:
	udiv	%l5,	0x1093,	%o5
	smul	%l1,	%i2,	%o6
	alignaddrl	%i0,	%l2,	%i7
	fmul8x16al	%f18,	%f17,	%f8
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	edge32n	%g3,	%i6,	%i1
	fmovsgu	%xcc,	%f7,	%f3
	fcmpeq16	%f26,	%f6,	%l3
	orcc	%g6,	%g2,	%l6
	fble,a	%fcc2,	loop_2198
	addcc	%i5,	%g4,	%l4
	edge8	%o3,	%i3,	%o0
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%g6
loop_2198:
	sdivcc	%o2,	0x1B29,	%o7
	orcc	%o4,	0x1817,	%o1
	srax	%g1,	%i4,	%l0
	movn	%icc,	%o5,	%l1
	fmovdvs	%icc,	%f20,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l5,	%i2,	%o6
	ldx	[%l7 + 0x48],	%l2
	brnz,a	%i7,	loop_2199
	fcmpgt32	%f4,	%f8,	%i0
	sdivcc	%g5,	0x04E4,	%g3
	tvs	%xcc,	0x1
loop_2199:
	nop
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0x2
	fmovsne	%icc,	%f22,	%f25
	array8	%i6,	%g6,	%l3
	fmovrsgz	%g2,	%f14,	%f29
	tvs	%xcc,	0x5
	addccc	%i5,	0x0435,	%g4
	fpsub16s	%f21,	%f18,	%f30
	fmovsvc	%icc,	%f28,	%f1
	movle	%icc,	%l4,	%l6
	udivx	%o3,	0x0F89,	%o0
	mova	%xcc,	%g7,	%o2
	fmul8sux16	%f0,	%f20,	%f20
	stx	%o7,	[%l7 + 0x58]
	edge16n	%i3,	%o4,	%g1
	movg	%icc,	%i4,	%o1
	tge	%xcc,	0x4
	alignaddrl	%o5,	%l1,	%l5
	fcmpd	%fcc1,	%f14,	%f30
	edge32l	%i2,	%l0,	%o6
	brlez	%i7,	loop_2200
	bn,a,pt	%xcc,	loop_2201
	bshuffle	%f12,	%f0,	%f20
	edge16	%l2,	%g5,	%g3
loop_2200:
	fnegs	%f21,	%f3
loop_2201:
	udiv	%i1,	0x1C9D,	%i0
	std	%g6,	[%l7 + 0x10]
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%i6
	fbne,a	%fcc2,	loop_2202
	smulcc	%g2,	%l3,	%g4
	tl	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i5
loop_2202:
	subcc	%l6,	0x07AC,	%o3
	brlz	%l4,	loop_2203
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g7,	%o2,	%o0
	fbge,a	%fcc0,	loop_2204
loop_2203:
	fmovrsgez	%o7,	%f10,	%f9
	sdivx	%i3,	0x0751,	%g1
	edge16ln	%o4,	%o1,	%i4
loop_2204:
	tn	%icc,	0x5
	membar	0x30
	movrlz	%l1,	%o5,	%i2
	stx	%l0,	[%l7 + 0x38]
	movleu	%xcc,	%o6,	%i7
	move	%xcc,	%l2,	%g5
	fnor	%f2,	%f22,	%f22
	edge8ln	%g3,	%i1,	%l5
	or	%i0,	%i6,	%g6
	smulcc	%l3,	%g4,	%g2
	fbo,a	%fcc1,	loop_2205
	sth	%l6,	[%l7 + 0x5A]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o3,	%i5,	%g7
loop_2205:
	nop
	set	0x7C, %i3
	lda	[%l7 + %i3] 0x19,	%f19
	edge32	%l4,	%o2,	%o7
	fcmpd	%fcc1,	%f8,	%f0
	movgu	%xcc,	%i3,	%o0
	movle	%icc,	%g1,	%o1
	edge16l	%o4,	%l1,	%i4
	movge	%xcc,	%o5,	%l0
	fmuld8ulx16	%f31,	%f0,	%f0
	wr	%g0,	0x27,	%asi
	stda	%i2,	[%l7 + 0x78] %asi
	membar	#Sync
	fzeros	%f28
	array32	%o6,	%i7,	%l2
	movrlez	%g3,	0x187,	%i1
	movrgz	%l5,	%g5,	%i6
	ldsh	[%l7 + 0x42],	%g6
	orn	%i0,	%g4,	%l3
	fmovdvs	%icc,	%f31,	%f15
	bleu,pn	%xcc,	loop_2206
	sir	0x19F9
	add	%l6,	%g2,	%i5
	movg	%xcc,	%o3,	%l4
loop_2206:
	brlez	%g7,	loop_2207
	srl	%o2,	0x1F,	%i3
	wr	%g0,	0x10,	%asi
	stba	%o7,	[%l7 + 0x29] %asi
loop_2207:
	add	%o0,	%o1,	%g1
	sethi	0x017F,	%l1
	movcc	%icc,	%i4,	%o4
	fmovrdgez	%l0,	%f30,	%f14
	ba	loop_2208
	nop
	setx	loop_2209,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ble,a	%xcc,	loop_2210
	siam	0x5
loop_2208:
	fmovdvs	%xcc,	%f8,	%f24
loop_2209:
	fbul,a	%fcc1,	loop_2211
loop_2210:
	fandnot2s	%f16,	%f2,	%f28
	fmovrdne	%i2,	%f0,	%f2
	nop
	set	0x21, %g2
	ldstub	[%l7 + %g2],	%o6
loop_2211:
	xorcc	%i7,	%o5,	%l2
	fbo	%fcc0,	loop_2212
	brgez,a	%i1,	loop_2213
	fmovdgu	%xcc,	%f7,	%f10
	addc	%g3,	%l5,	%i6
loop_2212:
	smulcc	%g5,	%g6,	%i0
loop_2213:
	bne,a	%xcc,	loop_2214
	ta	%xcc,	0x7
	ldd	[%l7 + 0x40],	%g4
	fnand	%f16,	%f8,	%f6
loop_2214:
	nop
	setx	loop_2215,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x62
	tsubcctv	%l3,	0x0092,	%l6
	tg	%xcc,	0x5
loop_2215:
	movle	%xcc,	%i5,	%o3
	fpadd32s	%f28,	%f7,	%f17
	fexpand	%f17,	%f20
	fandnot1	%f18,	%f8,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc3,	%f23,	%f19
	tcs	%icc,	0x0
	movge	%icc,	%g2,	%l4
	fmul8ulx16	%f26,	%f24,	%f14
	move	%xcc,	%o2,	%i3
	fmovdvs	%xcc,	%f21,	%f23
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	orncc	%o0,	%o1,	%g7
	sllx	%l1,	0x1A,	%i4
	flush	%l7 + 0x70
	ld	[%l7 + 0x58],	%f12
	fbo,a	%fcc3,	loop_2216
	stbar
	set	0x54, %g6
	stha	%o4,	[%l7 + %g6] 0xe2
	membar	#Sync
loop_2216:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f6,	%f22,	%f16
	wr	%g0,	0x27,	%asi
	stxa	%g1,	[%l7 + 0x40] %asi
	membar	#Sync
	brgez	%i2,	loop_2217
	fpsub16s	%f20,	%f27,	%f8
	taddcctv	%o6,	%l0,	%i7
	fmovsleu	%icc,	%f18,	%f8
loop_2217:
	fmovsge	%icc,	%f8,	%f30
	udiv	%o5,	0x0E38,	%i1
	edge16	%l2,	%l5,	%i6
	fbug,a	%fcc3,	loop_2218
	udivcc	%g5,	0x0137,	%g6
	movg	%icc,	%g3,	%g4
	movpos	%xcc,	%l3,	%l6
loop_2218:
	std	%i4,	[%l7 + 0x50]
	edge32	%o3,	%g2,	%i0
	movvs	%icc,	%o2,	%l4
	srax	%i3,	0x07,	%o7
	edge16n	%o0,	%o1,	%g7
	fnot1s	%f25,	%f28
	taddcctv	%i4,	0x0A40,	%o4
	stb	%g1,	[%l7 + 0x61]
	array8	%l1,	%i2,	%o6
	fsrc2s	%f14,	%f21
	move	%icc,	%i7,	%o5
	ldd	[%l7 + 0x60],	%i0
	fmovsl	%xcc,	%f27,	%f30
	ldx	[%l7 + 0x68],	%l0
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x2e,	%l2
	andcc	%i6,	0x01ED,	%l5
	fmovrdne	%g6,	%f16,	%f4
	movg	%icc,	%g3,	%g5
	brlez	%l3,	loop_2219
	udivcc	%l6,	0x1882,	%g4
	fbo,a	%fcc2,	loop_2220
	bvs	%icc,	loop_2221
loop_2219:
	sdivx	%i5,	0x0E74,	%g2
	siam	0x0
loop_2220:
	taddcctv	%i0,	0x1E5D,	%o3
loop_2221:
	and	%l4,	0x06F7,	%i3
	std	%f26,	[%l7 + 0x68]
	stw	%o7,	[%l7 + 0x2C]
	tvc	%xcc,	0x7
	tneg	%icc,	0x0
	movleu	%xcc,	%o2,	%o0
	smulcc	%g7,	%o1,	%o4
	andn	%g1,	%i4,	%i2
	nop
	setx loop_2222, %l0, %l1
	jmpl %l1, %l1
	taddcc	%i7,	0x16F7,	%o5
	alignaddr	%o6,	%i1,	%l0
	add	%i6,	%l5,	%g6
loop_2222:
	orn	%l2,	0x1344,	%g3
	fpadd16	%f30,	%f18,	%f10
	orcc	%g5,	%l6,	%l3
	ldstub	[%l7 + 0x6A],	%g4
	brlz	%i5,	loop_2223
	edge32l	%i0,	%o3,	%l4
	addc	%i3,	%g2,	%o7
	srl	%o0,	%g7,	%o2
loop_2223:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o4,	%g1
	fble	%fcc1,	loop_2224
	brnz,a	%i4,	loop_2225
	edge16	%o1,	%l1,	%i7
	subc	%o5,	%i2,	%o6
loop_2224:
	addccc	%i1,	%i6,	%l0
loop_2225:
	fmovse	%icc,	%f19,	%f29
	nop
	setx	loop_2226,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%g6,	0x082F,	%l5
	fmovrsgez	%l2,	%f12,	%f13
	fandnot1	%f26,	%f26,	%f26
loop_2226:
	edge32n	%g5,	%l6,	%l3
	movcc	%icc,	%g4,	%i5
	umulcc	%g3,	%i0,	%l4
	movge	%icc,	%o3,	%i3
	fandnot2s	%f27,	%f29,	%f6
	xor	%o7,	%g2,	%g7
	alignaddr	%o2,	%o0,	%o4
	movpos	%xcc,	%g1,	%i4
	edge16	%l1,	%o1,	%o5
	fcmpne32	%f10,	%f12,	%i7
	sir	0x035C
	tpos	%xcc,	0x5
	andcc	%o6,	%i2,	%i6
	tgu	%xcc,	0x3
	tcc	%xcc,	0x6
	fmovrdgez	%i1,	%f8,	%f6
	smulcc	%g6,	0x098A,	%l0
	stb	%l5,	[%l7 + 0x73]
	movrgez	%l2,	%g5,	%l6
	fmovdge	%xcc,	%f21,	%f25
	tvc	%icc,	0x7
	tsubcctv	%g4,	0x0399,	%l3
	brlz	%g3,	loop_2227
	movvs	%icc,	%i5,	%l4
	ldd	[%l7 + 0x20],	%o2
	or	%i0,	0x199C,	%i3
loop_2227:
	tsubcctv	%o7,	0x139D,	%g2
	set	0x34, %l0
	stwa	%g7,	[%l7 + %l0] 0x04
	tcs	%xcc,	0x0
	movneg	%icc,	%o0,	%o4
	movl	%icc,	%o2,	%g1
	bvc,a,pn	%icc,	loop_2228
	fbne,a	%fcc3,	loop_2229
	umul	%i4,	%l1,	%o5
	fble,a	%fcc2,	loop_2230
loop_2228:
	xnorcc	%o1,	%o6,	%i7
loop_2229:
	sllx	%i2,	0x0F,	%i1
	ldsw	[%l7 + 0x30],	%i6
loop_2230:
	array8	%l0,	%l5,	%g6
	fmovsa	%xcc,	%f20,	%f1
	orcc	%l2,	%g5,	%l6
	fcmpgt16	%f16,	%f10,	%l3
	st	%f20,	[%l7 + 0x30]
	fcmped	%fcc2,	%f20,	%f20
	taddcctv	%g3,	0x081B,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l4,	0x1C13,	%o3
	sethi	0x03A2,	%g4
	movgu	%icc,	%i3,	%i0
	edge16n	%g2,	%o7,	%o0
	bpos,pn	%xcc,	loop_2231
	fpackfix	%f14,	%f16
	move	%icc,	%g7,	%o2
	fmovdvs	%icc,	%f8,	%f5
loop_2231:
	flush	%l7 + 0x78
	ble	%icc,	loop_2232
	andncc	%o4,	%g1,	%l1
	fzero	%f28
	movvc	%icc,	%o5,	%i4
loop_2232:
	sub	%o1,	%i7,	%i2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i1
	umul	%o6,	%l0,	%l5
	tle	%icc,	0x7
	smul	%i6,	%g6,	%g5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x7C] %asi,	%l6
	tge	%icc,	0x4
	addcc	%l2,	%g3,	%l3
	fmovsneg	%icc,	%f2,	%f27
	array32	%l4,	%i5,	%g4
	edge16n	%i3,	%i0,	%g2
	set	0x32, %o0
	stha	%o3,	[%l7 + %o0] 0x81
	sdiv	%o0,	0x0B55,	%o7
	tvs	%xcc,	0x3
	fcmpgt32	%f26,	%f8,	%o2
	andn	%g7,	%o4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o5,	%l1,	%i4
	ld	[%l7 + 0x24],	%f13
	ldsb	[%l7 + 0x73],	%i7
	popc	%o1,	%i2
	tgu	%xcc,	0x7
	srlx	%o6,	%l0,	%l5
	fmovdge	%icc,	%f11,	%f18
	fbn	%fcc3,	loop_2233
	andncc	%i1,	%g6,	%g5
	tn	%icc,	0x3
	mulscc	%l6,	0x1AEC,	%i6
loop_2233:
	edge8	%l2,	%g3,	%l4
	brlz	%l3,	loop_2234
	fabss	%f5,	%f30
	flush	%l7 + 0x48
	movrlz	%i5,	%g4,	%i3
loop_2234:
	tvs	%icc,	0x6
	bgu	%xcc,	loop_2235
	fmovrdne	%g2,	%f16,	%f14
	ldsb	[%l7 + 0x0A],	%i0
	sdiv	%o3,	0x1395,	%o0
loop_2235:
	fbue,a	%fcc1,	loop_2236
	bne,pn	%icc,	loop_2237
	movrlz	%o7,	0x164,	%o2
	fmovscc	%icc,	%f7,	%f11
loop_2236:
	fpsub16s	%f21,	%f20,	%f25
loop_2237:
	tcs	%xcc,	0x3
	subcc	%g7,	%o4,	%g1
	sdivcc	%l1,	0x11CD,	%i4
	stx	%o5,	[%l7 + 0x68]
	udivx	%o1,	0x082A,	%i7
	edge16	%i2,	%l0,	%o6
	tcs	%xcc,	0x0
	xor	%i1,	0x057C,	%g6
	prefetch	[%l7 + 0x40],	 0x0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%g5
	fnors	%f31,	%f17,	%f11
	subcc	%l5,	0x065A,	%l6
	fbuge,a	%fcc3,	loop_2238
	xorcc	%l2,	0x11EB,	%g3
	fones	%f8
	taddcc	%l4,	%l3,	%i6
loop_2238:
	movvs	%icc,	%i5,	%g4
	subccc	%i3,	%g2,	%i0
	sub	%o3,	0x078D,	%o7
	fors	%f14,	%f28,	%f1
	fbl	%fcc1,	loop_2239
	udiv	%o2,	0x193E,	%o0
	edge32l	%o4,	%g1,	%l1
	movrlez	%i4,	0x162,	%o5
loop_2239:
	movcs	%xcc,	%o1,	%i7
	tg	%icc,	0x7
	edge32ln	%g7,	%i2,	%o6
	tvs	%xcc,	0x5
	pdist	%f8,	%f20,	%f14
	ta	%icc,	0x5
	fpadd32	%f12,	%f10,	%f16
	edge16l	%i1,	%g6,	%g5
	tsubcc	%l0,	%l6,	%l5
	edge8ln	%l2,	%g3,	%l3
	fbug	%fcc0,	loop_2240
	bneg,a	loop_2241
	edge32ln	%l4,	%i5,	%g4
	and	%i6,	%g2,	%i3
loop_2240:
	st	%f12,	[%l7 + 0x40]
loop_2241:
	fsrc2	%f6,	%f14
	stw	%i0,	[%l7 + 0x58]
	fpsub16	%f16,	%f28,	%f2
	orn	%o7,	0x1E08,	%o2
	stbar
	bvs,a	loop_2242
	tvs	%xcc,	0x0
	movrgz	%o0,	%o4,	%o3
	movre	%g1,	0x1E9,	%l1
loop_2242:
	st	%f25,	[%l7 + 0x58]
	popc	0x0BD9,	%o5
	fcmple16	%f28,	%f10,	%o1
	movvc	%xcc,	%i7,	%i4
	sllx	%g7,	%o6,	%i2
	array32	%i1,	%g6,	%l0
	edge16ln	%l6,	%l5,	%l2
	tsubcc	%g3,	0x04D0,	%l3
	sir	0x0DB8
	xnorcc	%l4,	%g5,	%i5
	wr	%g0,	0x19,	%asi
	stba	%i6,	[%l7 + 0x6A] %asi
	or	%g4,	%i3,	%g2
	swap	[%l7 + 0x74],	%o7
	bleu,a,pt	%icc,	loop_2243
	srl	%i0,	%o2,	%o4
	fpack32	%f8,	%f0,	%f22
	bcc,pn	%icc,	loop_2244
loop_2243:
	sdivcc	%o0,	0x0C18,	%o3
	orncc	%l1,	0x1D00,	%o5
	sdiv	%g1,	0x05EE,	%i7
loop_2244:
	array16	%i4,	%o1,	%o6
	membar	0x6C
	xnor	%g7,	%i1,	%g6
	movge	%xcc,	%i2,	%l0
	tcs	%xcc,	0x5
	movgu	%xcc,	%l6,	%l5
	smulcc	%l2,	%g3,	%l3
	tgu	%icc,	0x7
	andncc	%g5,	%l4,	%i6
	prefetch	[%l7 + 0x14],	 0x0
	fones	%f21
	movre	%g4,	0x1B9,	%i5
	movleu	%icc,	%i3,	%o7
	tcs	%xcc,	0x3
	fmovsl	%icc,	%f25,	%f7
	edge32n	%g2,	%i0,	%o4
	fmovda	%xcc,	%f20,	%f11
	membar	0x67
	fmovrsne	%o2,	%f9,	%f16
	fmovrdgz	%o0,	%f14,	%f18
	bgu,pt	%icc,	loop_2245
	fmovspos	%icc,	%f17,	%f25
	movgu	%icc,	%l1,	%o3
	fbne,a	%fcc1,	loop_2246
loop_2245:
	fmul8x16al	%f9,	%f26,	%f10
	movn	%xcc,	%o5,	%g1
	srl	%i4,	0x1E,	%i7
loop_2246:
	fpsub16s	%f17,	%f7,	%f22
	umul	%o1,	0x121A,	%o6
	fsrc2	%f10,	%f4
	sethi	0x1F8F,	%g7
	fmovsvs	%icc,	%f7,	%f21
	subc	%i1,	%i2,	%l0
	taddcctv	%l6,	0x1958,	%l5
	addc	%l2,	%g3,	%g6
	bg,pn	%xcc,	loop_2247
	movne	%xcc,	%l3,	%l4
	movg	%xcc,	%g5,	%i6
	array32	%g4,	%i3,	%i5
loop_2247:
	bcc,a	loop_2248
	addcc	%o7,	%i0,	%o4
	fba	%fcc0,	loop_2249
	sethi	0x1387,	%o2
loop_2248:
	edge32n	%g2,	%l1,	%o3
	fcmple16	%f26,	%f2,	%o0
loop_2249:
	sdivcc	%g1,	0x0691,	%o5
	bpos	loop_2250
	tpos	%icc,	0x7
	fnor	%f6,	%f0,	%f30
	fzero	%f0
loop_2250:
	fbue	%fcc0,	loop_2251
	fbl,a	%fcc0,	loop_2252
	movneg	%icc,	%i7,	%o1
	fmovdleu	%xcc,	%f17,	%f27
loop_2251:
	andncc	%i4,	%o6,	%g7
loop_2252:
	addcc	%i2,	0x0451,	%l0
	ldd	[%l7 + 0x70],	%i0
	movne	%icc,	%l5,	%l2
	sir	0x1CF4
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	brgez	%g3,	loop_2253
	membar	0x16
	edge8l	%l6,	%g6,	%l4
	sub	%g5,	%l3,	%g4
loop_2253:
	fbne	%fcc0,	loop_2254
	tg	%xcc,	0x3
	fbg,a	%fcc2,	loop_2255
	fpack32	%f28,	%f22,	%f20
loop_2254:
	fsrc2s	%f23,	%f25
	srlx	%i3,	0x01,	%i5
loop_2255:
	edge8	%o7,	%i0,	%o4
	xorcc	%o2,	%i6,	%l1
	tn	%icc,	0x7
	brlez,a	%o3,	loop_2256
	ta	%xcc,	0x3
	stbar
	fmovdvs	%xcc,	%f1,	%f16
loop_2256:
	movl	%icc,	%g2,	%g1
	movrlez	%o5,	0x056,	%o0
	add	%i7,	0x046F,	%i4
	fbug	%fcc0,	loop_2257
	movvs	%xcc,	%o6,	%o1
	movrgez	%g7,	%l0,	%i2
	orn	%l5,	%i1,	%g3
loop_2257:
	andcc	%l6,	%l2,	%l4
	andncc	%g6,	%g5,	%l3
	tsubcc	%i3,	0x11D1,	%i5
	fpadd32	%f14,	%f22,	%f26
	subccc	%g4,	0x0D50,	%i0
	std	%o6,	[%l7 + 0x60]
	subccc	%o2,	0x1F25,	%i6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o4
	fxnors	%f25,	%f21,	%f2
	movrgez	%o3,	%g2,	%g1
	bcs,pt	%icc,	loop_2258
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1C, %l3
	lduha	[%l7 + %l3] 0x80,	%l1
loop_2258:
	movleu	%icc,	%o0,	%o5
	fbl	%fcc1,	loop_2259
	edge32n	%i7,	%i4,	%o6
	movre	%g7,	%l0,	%o1
	stw	%i2,	[%l7 + 0x14]
loop_2259:
	sdiv	%l5,	0x138E,	%g3
	fxors	%f21,	%f0,	%f5
	fba	%fcc2,	loop_2260
	edge16ln	%i1,	%l2,	%l6
	fexpand	%f28,	%f14
	movle	%xcc,	%g6,	%g5
loop_2260:
	movcc	%icc,	%l3,	%i3
	bcs	loop_2261
	srlx	%i5,	0x15,	%l4
	fsrc2s	%f15,	%f17
	stw	%i0,	[%l7 + 0x40]
loop_2261:
	fmovscs	%xcc,	%f31,	%f23
	tgu	%icc,	0x0
	sllx	%o7,	%o2,	%g4
	edge8l	%o4,	%i6,	%g2
	brlez	%g1,	loop_2262
	fcmpne16	%f8,	%f28,	%l1
	popc	%o0,	%o5
	orn	%o3,	0x0DA6,	%i4
loop_2262:
	nop
	set	0x47, %l2
	ldsba	[%l7 + %l2] 0x0c,	%i7
	fornot1s	%f23,	%f1,	%f16
	ldsw	[%l7 + 0x40],	%g7
	fmul8x16	%f20,	%f18,	%f20
	brlz,a	%l0,	loop_2263
	bvs	loop_2264
	edge16n	%o1,	%o6,	%l5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f22
loop_2263:
	fbu,a	%fcc1,	loop_2265
loop_2264:
	mova	%xcc,	%i2,	%g3
	bg	%xcc,	loop_2266
	fones	%f29
loop_2265:
	fmovs	%f10,	%f0
	bn,a	loop_2267
loop_2266:
	tne	%xcc,	0x1
	mulx	%i1,	%l6,	%g6
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
loop_2267:
	addccc	%g5,	%i3,	%i5
	edge32ln	%l3,	%l4,	%i0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f0
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	tcc	%icc,	0x2
	mulscc	%o7,	%g4,	%i6
	xor	%g2,	%o4,	%g1
	movcs	%icc,	%l1,	%o5
	movrne	%o0,	0x27D,	%i4
	smul	%o3,	0x17BE,	%i7
	fzeros	%f22
	ld	[%l7 + 0x18],	%f9
	set	0x60, %g4
	ldsha	[%l7 + %g4] 0x18,	%g7
	movrne	%l0,	%o1,	%l5
	fbue,a	%fcc1,	loop_2268
	edge32l	%i2,	%g3,	%o6
	fmovscs	%xcc,	%f7,	%f14
	fba	%fcc0,	loop_2269
loop_2268:
	fbg	%fcc3,	loop_2270
	tl	%xcc,	0x4
	movvc	%xcc,	%i1,	%g6
loop_2269:
	sir	0x150B
loop_2270:
	nop
	setx loop_2271, %l0, %l1
	jmpl %l1, %l6
	brz,a	%l2,	loop_2272
	fmovdcc	%icc,	%f30,	%f13
	sdivcc	%g5,	0x159F,	%i3
loop_2271:
	xorcc	%l3,	0x0B63,	%l4
loop_2272:
	or	%i0,	%i5,	%o7
	sllx	%g4,	%o2,	%i6
	orncc	%o4,	0x1CAE,	%g2
	sdivx	%g1,	0x1D16,	%l1
	addccc	%o5,	0x1731,	%i4
	tne	%icc,	0x6
	bcs,pt	%xcc,	loop_2273
	fbge,a	%fcc2,	loop_2274
	orn	%o0,	0x139A,	%i7
	fmovdvs	%xcc,	%f8,	%f4
loop_2273:
	edge32	%o3,	%l0,	%o1
loop_2274:
	fnot1	%f18,	%f28
	and	%l5,	%i2,	%g7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x30] %asi,	%o6
	movneg	%xcc,	%i1,	%g6
	be	loop_2275
	or	%l6,	%l2,	%g3
	set	0x78, %i5
	stba	%i3,	[%l7 + %i5] 0x22
	membar	#Sync
loop_2275:
	edge16	%g5,	%l3,	%l4
	fnegs	%f22,	%f22
	alignaddrl	%i0,	%i5,	%g4
	movge	%icc,	%o7,	%o2
	stbar
	fmovs	%f30,	%f30
	bne,a,pt	%icc,	loop_2276
	fcmpeq32	%f20,	%f6,	%o4
	tge	%xcc,	0x0
	orcc	%i6,	%g1,	%g2
loop_2276:
	edge8	%o5,	%l1,	%o0
	ldstub	[%l7 + 0x6E],	%i7
	udivcc	%o3,	0x0F6B,	%i4
	ldub	[%l7 + 0x29],	%o1
	edge32ln	%l0,	%i2,	%l5
	alignaddr	%o6,	%g7,	%i1
	fblg,a	%fcc2,	loop_2277
	swap	[%l7 + 0x10],	%g6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
loop_2277:
	fpsub32	%f20,	%f30,	%f10
	movvc	%xcc,	%g3,	%l6
	brgz	%i3,	loop_2278
	orcc	%l3,	0x0E69,	%g5
	mulscc	%l4,	0x1519,	%i0
	fmovda	%xcc,	%f27,	%f0
loop_2278:
	edge32	%i5,	%o7,	%o2
	fcmped	%fcc3,	%f28,	%f12
	udivcc	%g4,	0x198B,	%o4
	sllx	%i6,	%g2,	%o5
	fbo,a	%fcc0,	loop_2279
	tsubcc	%g1,	%o0,	%l1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x5C] %asi,	%f7
loop_2279:
	fmovdgu	%xcc,	%f30,	%f25
	movrgz	%i7,	%o3,	%i4
	tcs	%icc,	0x2
	fmovdneg	%xcc,	%f21,	%f4
	tl	%xcc,	0x0
	sub	%o1,	0x1EE3,	%l0
	tn	%icc,	0x1
	sll	%i2,	0x15,	%l5
	tsubcc	%o6,	%g7,	%i1
	membar	0x6C
	ldsh	[%l7 + 0x56],	%l2
	add	%g3,	0x0726,	%l6
	fmul8x16al	%f18,	%f23,	%f28
	movneg	%icc,	%g6,	%i3
	movvs	%icc,	%l3,	%g5
	fmovrse	%i0,	%f18,	%f4
	fabss	%f16,	%f0
	fmovrsgz	%i5,	%f0,	%f5
	fmovsg	%xcc,	%f1,	%f16
	fmovdneg	%xcc,	%f19,	%f21
	bvs,a,pt	%xcc,	loop_2280
	tsubcc	%l4,	0x0681,	%o7
	srax	%o2,	0x1F,	%g4
	bcs,pt	%xcc,	loop_2281
loop_2280:
	fbug,a	%fcc1,	loop_2282
	edge8ln	%o4,	%i6,	%o5
	xorcc	%g2,	0x17AC,	%o0
loop_2281:
	movgu	%icc,	%g1,	%l1
loop_2282:
	fmovdneg	%icc,	%f2,	%f31
	tn	%icc,	0x3
	popc	0x068D,	%i7
	edge16n	%o3,	%i4,	%o1
	tvs	%icc,	0x2
	fblg	%fcc3,	loop_2283
	umulcc	%i2,	0x0EAE,	%l0
	fmuld8ulx16	%f2,	%f7,	%f22
	fmovrde	%o6,	%f0,	%f2
loop_2283:
	movne	%xcc,	%l5,	%g7
	tgu	%xcc,	0x0
	movpos	%icc,	%l2,	%g3
	fabss	%f17,	%f30
	movvc	%icc,	%i1,	%l6
	movl	%xcc,	%g6,	%l3
	edge8	%i3,	%g5,	%i0
	tvc	%icc,	0x4
	ba,a,pt	%icc,	loop_2284
	movgu	%xcc,	%i5,	%l4
	set	0x44, %i7
	sta	%f27,	[%l7 + %i7] 0x15
loop_2284:
	umulcc	%o2,	0x0C88,	%o7
	lduw	[%l7 + 0x5C],	%o4
	fandnot1	%f16,	%f26,	%f12
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x3C] %asi,	%f19
	movne	%icc,	%i6,	%g4
	tne	%xcc,	0x5
	tn	%xcc,	0x1
	nop
	setx	loop_2285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f30,	%f18
	set	0x4D, %o3
	ldsba	[%l7 + %o3] 0x19,	%o5
loop_2285:
	fnot2s	%f24,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g2,	%g1,	%l1
	fcmpgt16	%f28,	%f28,	%o0
	movvs	%icc,	%o3,	%i7
	umulcc	%o1,	0x0BDD,	%i4
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l0
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	orncc	%o6,	0x0465,	%l5
	tneg	%icc,	0x0
	orncc	%l2,	%g7,	%g3
	sth	%i1,	[%l7 + 0x1C]
	umul	%g6,	%l3,	%i3
	flush	%l7 + 0x28
	ldd	[%l7 + 0x08],	%f10
	taddcc	%g5,	%i0,	%i5
	bshuffle	%f6,	%f4,	%f2
	fmovdg	%icc,	%f30,	%f22
	fcmpeq32	%f14,	%f8,	%l6
	ldsh	[%l7 + 0x38],	%o2
	movrgz	%l4,	0x099,	%o4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o7,	[%g0 + 0x198] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	andn	%g4,	0x1E0A,	%o5
	tsubcctv	%g2,	%g1,	%i6
	movrgz	%o0,	0x36A,	%l1
	membar	0x71
	sllx	%o3,	0x07,	%o1
	xnorcc	%i4,	0x0C53,	%l0
	movne	%xcc,	%i7,	%o6
	nop
	setx	loop_2286,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez,a	%i2,	loop_2287
	fxors	%f18,	%f0,	%f5
	fcmped	%fcc2,	%f24,	%f14
loop_2286:
	movcc	%xcc,	%l2,	%g7
loop_2287:
	udivx	%l5,	0x0C20,	%i1
	nop
	setx	loop_2288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%g6,	%l3,	%i3
	sdivx	%g3,	0x1943,	%g5
	stw	%i0,	[%l7 + 0x34]
loop_2288:
	stw	%i5,	[%l7 + 0x3C]
	tvs	%icc,	0x3
	tneg	%xcc,	0x1
	nop
	setx	loop_2289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%icc,	0x0
	wr	%g0,	0xeb,	%asi
	stwa	%o2,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_2289:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x4
	brz,a	%l6,	loop_2290
	and	%o4,	0x03EA,	%o7
	fand	%f10,	%f8,	%f22
	bcs	%xcc,	loop_2291
loop_2290:
	popc	0x125D,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l4,	%o5
loop_2291:
	mova	%icc,	%g2,	%i6
	smul	%o0,	0x19E7,	%g1
	edge8l	%l1,	%o3,	%i4
	ldub	[%l7 + 0x63],	%o1
	and	%l0,	%i7,	%i2
	brgez	%l2,	loop_2292
	xorcc	%g7,	0x1B07,	%o6
	fmovrdgez	%i1,	%f26,	%f18
	sllx	%l5,	0x0E,	%g6
loop_2292:
	fnot1	%f20,	%f18
	udivx	%i3,	0x0781,	%l3
	udivcc	%g3,	0x05DE,	%g5
	orncc	%i0,	0x089E,	%o2
	tneg	%icc,	0x7
	fmovsa	%icc,	%f28,	%f1
	fmovsneg	%xcc,	%f7,	%f30
	subcc	%i5,	0x11BD,	%o4
	subcc	%o7,	0x04BD,	%l6
	fmovrdgez	%g4,	%f12,	%f14
	fabsd	%f22,	%f28
	movn	%xcc,	%o5,	%g2
	fbug,a	%fcc0,	loop_2293
	fnor	%f6,	%f24,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i6,	%l4,	%o0
loop_2293:
	bcc,pn	%xcc,	loop_2294
	movcs	%xcc,	%g1,	%o3
	movneg	%icc,	%i4,	%o1
	nop
	set	0x30, %g7
	stw	%l0,	[%l7 + %g7]
loop_2294:
	brlez,a	%i7,	loop_2295
	srlx	%l1,	0x13,	%i2
	fsrc2	%f22,	%f16
	bne,pn	%icc,	loop_2296
loop_2295:
	alignaddrl	%l2,	%g7,	%o6
	set	0x30, %i4
	stxa	%i1,	[%l7 + %i4] 0x80
loop_2296:
	fxors	%f13,	%f2,	%f20
	edge16n	%l5,	%i3,	%l3
	fmuld8sux16	%f16,	%f27,	%f28
	tn	%xcc,	0x1
	edge8n	%g6,	%g3,	%i0
	movle	%icc,	%g5,	%o2
	fbuge,a	%fcc2,	loop_2297
	udivx	%i5,	0x1E79,	%o4
	fzero	%f12
	fmovsn	%xcc,	%f27,	%f19
loop_2297:
	nop
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x11,	%o7
	sir	0x0BE4
	smulcc	%l6,	0x08D9,	%g4
	tvs	%icc,	0x7
	fba	%fcc0,	loop_2298
	edge8l	%g2,	%i6,	%l4
	nop
	set	0x68, %o6
	std	%f28,	[%l7 + %o6]
	smul	%o0,	0x117B,	%o5
loop_2298:
	movge	%xcc,	%o3,	%i4
	fmovsleu	%xcc,	%f10,	%f3
	tleu	%xcc,	0x4
	fbue	%fcc3,	loop_2299
	fmovspos	%xcc,	%f7,	%f11
	addc	%o1,	0x096E,	%g1
	movne	%xcc,	%i7,	%l1
loop_2299:
	movrlz	%l0,	%l2,	%g7
	edge16	%o6,	%i1,	%l5
	bl,a,pn	%icc,	loop_2300
	andn	%i3,	%i2,	%l3
	subc	%g6,	0x1E1E,	%g3
	fbge,a	%fcc2,	loop_2301
loop_2300:
	udivcc	%i0,	0x13C9,	%o2
	ble,a	%icc,	loop_2302
	stx	%g5,	[%l7 + 0x28]
loop_2301:
	fmovdne	%xcc,	%f24,	%f13
	bcs,pn	%xcc,	loop_2303
loop_2302:
	fmovsge	%icc,	%f13,	%f30
	orncc	%o4,	0x027C,	%i5
	ldsw	[%l7 + 0x24],	%o7
loop_2303:
	tcs	%xcc,	0x4
	fpadd32s	%f6,	%f28,	%f9
	sethi	0x0EC3,	%l6
	movpos	%xcc,	%g2,	%i6
	edge8n	%l4,	%g4,	%o0
	fble	%fcc2,	loop_2304
	tneg	%xcc,	0x7
	xnor	%o5,	%o3,	%o1
	fzeros	%f22
loop_2304:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g1,	%i4
	fmovdle	%icc,	%f3,	%f29
	lduh	[%l7 + 0x66],	%l1
	popc	0x1E31,	%i7
	movrlez	%l2,	%l0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f7,	%f25,	%f19
	tneg	%xcc,	0x0
	movge	%xcc,	%g7,	%l5
	ldub	[%l7 + 0x09],	%i1
	tn	%icc,	0x0
	movn	%xcc,	%i3,	%l3
	edge8	%i2,	%g6,	%i0
	ld	[%l7 + 0x74],	%f18
	tcc	%xcc,	0x3
	set	0x20, %l5
	stxa	%o2,	[%l7 + %l5] 0x04
	movg	%icc,	%g3,	%g5
	edge16	%i5,	%o7,	%o4
	fmovdcc	%icc,	%f24,	%f6
	addccc	%g2,	%l6,	%i6
	edge8	%l4,	%g4,	%o5
	fcmpne16	%f30,	%f14,	%o0
	andncc	%o3,	%o1,	%i4
	wr	%g0,	0x11,	%asi
	stxa	%l1,	[%l7 + 0x68] %asi
	tgu	%icc,	0x5
	bg,a	loop_2305
	tvs	%xcc,	0x5
	edge8n	%i7,	%g1,	%l2
	fcmpgt16	%f18,	%f4,	%o6
loop_2305:
	tpos	%icc,	0x6
	srl	%g7,	0x0B,	%l0
	edge8	%l5,	%i1,	%i3
	ba,a,pt	%icc,	loop_2306
	subc	%i2,	0x008B,	%g6
	bg,a,pn	%icc,	loop_2307
	tl	%icc,	0x0
loop_2306:
	fnors	%f18,	%f22,	%f31
	movn	%icc,	%i0,	%l3
loop_2307:
	orcc	%g3,	0x048A,	%g5
	movge	%icc,	%i5,	%o7
	tneg	%icc,	0x2
	prefetch	[%l7 + 0x54],	 0x3
	set	0x20, %i2
	stwa	%o4,	[%l7 + %i2] 0x2a
	membar	#Sync
	fpadd16s	%f26,	%f12,	%f0
	fmovdn	%xcc,	%f24,	%f11
	edge32ln	%g2,	%l6,	%i6
	fbul	%fcc2,	loop_2308
	fmuld8ulx16	%f2,	%f2,	%f8
	edge16	%o2,	%g4,	%o5
	fmul8x16au	%f11,	%f11,	%f12
loop_2308:
	smulcc	%o0,	0x08F2,	%l4
	edge32	%o1,	%o3,	%l1
	wr	%g0,	0x19,	%asi
	stxa	%i7,	[%l7 + 0x08] %asi
	tvs	%icc,	0x1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i4
	movrgz	%g1,	0x3A1,	%l2
	movrlz	%g7,	0x17B,	%o6
	fmovrdne	%l5,	%f30,	%f14
	edge32n	%i1,	%i3,	%i2
	movge	%icc,	%l0,	%i0
	brlez	%g6,	loop_2309
	movvs	%xcc,	%l3,	%g5
	bge,pn	%xcc,	loop_2310
	lduw	[%l7 + 0x08],	%i5
loop_2309:
	udivx	%o7,	0x085F,	%g3
	movne	%icc,	%o4,	%g2
loop_2310:
	stx	%i6,	[%l7 + 0x28]
	edge32n	%o2,	%g4,	%l6
	xorcc	%o5,	%l4,	%o1
	subc	%o0,	%o3,	%l1
	movn	%xcc,	%i7,	%g1
	tge	%xcc,	0x1
	nop
	setx loop_2311, %l0, %l1
	jmpl %l1, %i4
	tcc	%xcc,	0x1
	fxnors	%f16,	%f26,	%f9
	movcc	%xcc,	%l2,	%g7
loop_2311:
	edge32	%l5,	%o6,	%i3
	or	%i1,	0x1C8F,	%l0
	fmovsle	%xcc,	%f13,	%f17
	fxnor	%f16,	%f12,	%f6
	umulcc	%i2,	%g6,	%l3
	movl	%xcc,	%i0,	%g5
	fmovrdlez	%i5,	%f14,	%f24
	smul	%g3,	%o4,	%o7
	srax	%g2,	0x15,	%o2
	be,a,pn	%xcc,	loop_2312
	fpack16	%f20,	%f2
	tsubcc	%i6,	0x11F4,	%g4
	sdivcc	%o5,	0x1516,	%l6
loop_2312:
	fxors	%f2,	%f21,	%f12
	movg	%xcc,	%l4,	%o1
	brnz	%o0,	loop_2313
	fblg	%fcc1,	loop_2314
	sdivcc	%o3,	0x1C69,	%i7
	srl	%l1,	%g1,	%l2
loop_2313:
	movrgez	%g7,	0x169,	%l5
loop_2314:
	srl	%i4,	%i3,	%i1
	smul	%o6,	%i2,	%l0
	mulscc	%g6,	0x0C08,	%i0
	andcc	%l3,	0x14C3,	%i5
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g5
	mova	%xcc,	%g3,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%o2,	%o7
	brlz	%g4,	loop_2315
	fmovsgu	%xcc,	%f18,	%f14
	umul	%o5,	0x0922,	%l6
	ld	[%l7 + 0x70],	%f29
loop_2315:
	movrne	%l4,	%i6,	%o0
	xorcc	%o1,	%i7,	%o3
	taddcctv	%l1,	0x1EC2,	%l2
	alignaddrl	%g1,	%l5,	%g7
	fnot2s	%f28,	%f15
	smul	%i3,	%i4,	%o6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f4
	sllx	%i1,	0x0E,	%l0
	edge8n	%i2,	%i0,	%g6
	tg	%xcc,	0x4
	tneg	%icc,	0x7
	tcs	%xcc,	0x4
	tleu	%xcc,	0x4
	ldd	[%l7 + 0x30],	%l2
	ta	%xcc,	0x0
	ldstub	[%l7 + 0x40],	%i5
	orncc	%g3,	0x1C55,	%o4
	movrgz	%g5,	0x243,	%o2
	andn	%o7,	0x1E1D,	%g4
	sethi	0x1288,	%o5
	std	%f22,	[%l7 + 0x28]
	fbl,a	%fcc3,	loop_2316
	fmovde	%icc,	%f14,	%f18
	fpsub16s	%f28,	%f7,	%f7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x1C] %asi,	%f4
loop_2316:
	movgu	%icc,	%l6,	%l4
	and	%g2,	0x1947,	%o0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x04,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f11,	%f31,	%f3
	fcmpgt32	%f26,	%f10,	%o1
	andcc	%i6,	%i7,	%l1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x08] %asi,	%o3
	movg	%icc,	%g1,	%l2
	fzeros	%f22
	fxors	%f20,	%f12,	%f1
	edge16l	%g7,	%l5,	%i3
	udiv	%i4,	0x0181,	%i1
	call	loop_2317
	movneg	%xcc,	%l0,	%o6
	xorcc	%i2,	%g6,	%i0
	tle	%icc,	0x6
loop_2317:
	fbn	%fcc3,	loop_2318
	fzero	%f26
	fmovsl	%xcc,	%f12,	%f11
	edge8ln	%i5,	%g3,	%l3
loop_2318:
	srl	%g5,	0x13,	%o2
	bg,pn	%xcc,	loop_2319
	bcs	loop_2320
	movleu	%icc,	%o7,	%g4
	fbuge	%fcc0,	loop_2321
loop_2319:
	ta	%icc,	0x5
loop_2320:
	nop
	setx	loop_2322,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,a	loop_2323
loop_2321:
	popc	%o5,	%l6
	fbge	%fcc3,	loop_2324
loop_2322:
	fmuld8sux16	%f2,	%f22,	%f28
loop_2323:
	edge32l	%o4,	%g2,	%o0
	xorcc	%l4,	%i6,	%o1
loop_2324:
	xnor	%i7,	%l1,	%g1
	movneg	%xcc,	%l2,	%o3
	bcs,pn	%xcc,	loop_2325
	edge8	%l5,	%i3,	%g7
	fpadd32s	%f5,	%f29,	%f27
	edge8ln	%i1,	%l0,	%i4
loop_2325:
	movvc	%icc,	%i2,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o6,	0x14BF,	%i5
	tcc	%xcc,	0x3
	prefetch	[%l7 + 0x78],	 0x3
	bge,a,pn	%xcc,	loop_2326
	orn	%i0,	0x0ABB,	%g3
	tleu	%icc,	0x2
	fnegs	%f30,	%f27
loop_2326:
	fzero	%f14
	nop
	set	0x43, %o7
	stb	%g5,	[%l7 + %o7]
	nop
	setx loop_2327, %l0, %l1
	jmpl %l1, %l3
	movrne	%o2,	0x3D2,	%o7
	andncc	%g4,	%o5,	%o4
	movle	%xcc,	%g2,	%o0
loop_2327:
	movrgz	%l6,	0x36A,	%i6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x6E] %asi,	%o1
	ble,pt	%xcc,	loop_2328
	ldstub	[%l7 + 0x4B],	%i7
	andncc	%l1,	%g1,	%l2
	ldsh	[%l7 + 0x0A],	%l4
loop_2328:
	fnot1s	%f2,	%f30
	subcc	%l5,	0x1304,	%i3
	udivx	%o3,	0x19F8,	%g7
	fmovsvc	%xcc,	%f7,	%f14
	and	%i1,	0x125C,	%i4
	stw	%i2,	[%l7 + 0x44]
	ta	%xcc,	0x7
	orn	%g6,	%o6,	%l0
	fnot1	%f6,	%f24
	fbug,a	%fcc0,	loop_2329
	nop
	set	0x58, %o1
	ldx	[%l7 + %o1],	%i5
	fxnors	%f20,	%f15,	%f21
	tleu	%xcc,	0x6
loop_2329:
	fmovsgu	%icc,	%f16,	%f5
	array8	%g3,	%g5,	%i0
	tg	%icc,	0x0
	srax	%l3,	%o2,	%o7
	taddcctv	%o5,	0x02D6,	%o4
	fbl,a	%fcc0,	loop_2330
	fmovrsgez	%g4,	%f7,	%f25
	fxors	%f19,	%f26,	%f10
	ble	%icc,	loop_2331
loop_2330:
	tle	%xcc,	0x2
	fbue	%fcc2,	loop_2332
	brlz,a	%g2,	loop_2333
loop_2331:
	popc	0x1E89,	%l6
	alignaddr	%o0,	%o1,	%i6
loop_2332:
	addc	%l1,	%g1,	%i7
loop_2333:
	nop
	set	0x18, %o2
	ldxa	[%l7 + %o2] 0x81,	%l2
	movrgz	%l4,	0x0B5,	%i3
	fandnot1	%f12,	%f10,	%f24
	fbe	%fcc0,	loop_2334
	movle	%xcc,	%o3,	%l5
	movvc	%icc,	%i1,	%i4
	fnot2	%f30,	%f14
loop_2334:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i2,	%g6
	fmovrdgez	%g7,	%f0,	%f30
	brgez	%l0,	loop_2335
	array32	%o6,	%g3,	%i5
	edge16n	%i0,	%l3,	%g5
	fexpand	%f14,	%f12
loop_2335:
	orcc	%o7,	%o2,	%o5
	fandnot2	%f30,	%f26,	%f10
	alignaddrl	%g4,	%o4,	%g2
	fba	%fcc0,	loop_2336
	movrne	%l6,	%o0,	%o1
	fblg,a	%fcc0,	loop_2337
	fcmps	%fcc3,	%f19,	%f11
loop_2336:
	movcs	%xcc,	%l1,	%i6
	fbg	%fcc2,	loop_2338
loop_2337:
	tle	%icc,	0x3
	prefetch	[%l7 + 0x7C],	 0x3
	fmovsne	%xcc,	%f24,	%f1
loop_2338:
	fxnor	%f14,	%f12,	%f14
	fbuge,a	%fcc0,	loop_2339
	fmovsa	%xcc,	%f2,	%f8
	fmovrdgz	%i7,	%f28,	%f0
	fsrc2s	%f28,	%f12
loop_2339:
	brnz,a	%l2,	loop_2340
	movn	%icc,	%g1,	%i3
	fnand	%f0,	%f28,	%f18
	tsubcc	%l4,	0x1947,	%l5
loop_2340:
	fandnot1s	%f29,	%f7,	%f8
	orncc	%i1,	%i4,	%o3
	edge32l	%g6,	%i2,	%g7
	tgu	%icc,	0x1
	udivcc	%o6,	0x03B2,	%l0
	array16	%i5,	%i0,	%g3
	stw	%l3,	[%l7 + 0x6C]
	tgu	%xcc,	0x0
	tsubcc	%g5,	0x0031,	%o2
	taddcctv	%o5,	%o7,	%g4
	sir	0x19ED
	sdiv	%g2,	0x0E3C,	%o4
	tge	%icc,	0x4
	or	%o0,	%o1,	%l6
	xnor	%i6,	%l1,	%l2
	fmovse	%xcc,	%f6,	%f8
	bvs,a	%icc,	loop_2341
	bgu,pt	%icc,	loop_2342
	smulcc	%g1,	%i7,	%l4
	movg	%icc,	%i3,	%l5
loop_2341:
	fnegd	%f24,	%f8
loop_2342:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i4,	0x1053,	%i1
	sub	%o3,	%i2,	%g6
	set	0x38, %g1
	stda	%g6,	[%l7 + %g1] 0x10
	addccc	%l0,	%i5,	%o6
	movcs	%xcc,	%g3,	%l3
	movrgz	%g5,	%i0,	%o5
	fandnot1s	%f17,	%f29,	%f30
	addccc	%o7,	%o2,	%g2
	movne	%icc,	%g4,	%o4
	add	%o0,	%l6,	%o1
	movvs	%xcc,	%i6,	%l2
	fpsub32s	%f31,	%f6,	%f4
	set	0x18, %o4
	stda	%l0,	[%l7 + %o4] 0x10
	brgz	%i7,	loop_2343
	umul	%l4,	0x196F,	%g1
	wr	%g0,	0xe2,	%asi
	stda	%l4,	[%l7 + 0x20] %asi
	membar	#Sync
loop_2343:
	or	%i3,	%i4,	%o3
	brlz	%i2,	loop_2344
	movrgez	%g6,	0x36B,	%i1
	andcc	%g7,	0x053E,	%l0
	fandnot2	%f22,	%f24,	%f6
loop_2344:
	stbar
	fble,a	%fcc0,	loop_2345
	fornot2s	%f21,	%f11,	%f4
	fmovrse	%i5,	%f6,	%f1
	orncc	%g3,	0x0DF5,	%o6
loop_2345:
	orn	%g5,	0x10F1,	%i0
	smulcc	%o5,	0x1E44,	%o7
	movg	%icc,	%l3,	%o2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g4
	sth	%o4,	[%l7 + 0x64]
	bshuffle	%f22,	%f18,	%f24
	fabss	%f28,	%f27
	udiv	%g2,	0x0F8F,	%l6
	fnot1	%f12,	%f4
	addccc	%o1,	%i6,	%l2
	stb	%l1,	[%l7 + 0x57]
	ldub	[%l7 + 0x38],	%i7
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x18,	 0x2
	ldub	[%l7 + 0x4C],	%g1
	prefetch	[%l7 + 0x50],	 0x0
	fnot1	%f24,	%f16
	brz	%l5,	loop_2346
	mulx	%i3,	0x10EC,	%i4
	andcc	%l4,	%i2,	%g6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x25] %asi,	%i1
loop_2346:
	fors	%f12,	%f1,	%f5
	fandnot2s	%f24,	%f2,	%f20
	tsubcctv	%o3,	0x026F,	%l0
	fxors	%f12,	%f11,	%f28
	umul	%i5,	0x1938,	%g3
	fba	%fcc1,	loop_2347
	orn	%g7,	0x0262,	%g5
	smulcc	%i0,	0x1270,	%o5
	edge32l	%o7,	%l3,	%o6
loop_2347:
	fnot2	%f30,	%f20
	fmovrdlz	%o2,	%f12,	%f24
	brgz	%g4,	loop_2348
	fmovdleu	%xcc,	%f13,	%f20
	smulcc	%g2,	0x06F6,	%l6
	tneg	%xcc,	0x4
loop_2348:
	fpackfix	%f4,	%f22
	edge16n	%o4,	%o1,	%l2
	nop
	set	0x32, %l4
	ldsh	[%l7 + %l4],	%l1
	movrne	%i7,	0x320,	%i6
	movg	%xcc,	%g1,	%l5
	addcc	%o0,	0x13A5,	%i4
	sethi	0x0E8F,	%l4
	mova	%icc,	%i3,	%i2
	addcc	%g6,	0x0E46,	%i1
	ble,a	loop_2349
	tcs	%xcc,	0x6
	subcc	%l0,	0x03A7,	%o3
	xnor	%g3,	0x14CB,	%g7
loop_2349:
	andn	%i5,	0x19E6,	%g5
	fbuge	%fcc3,	loop_2350
	te	%icc,	0x1
	tneg	%icc,	0x3
	taddcctv	%i0,	%o5,	%o7
loop_2350:
	edge8ln	%o6,	%o2,	%l3
	sra	%g4,	0x07,	%l6
	edge8l	%g2,	%o4,	%o1
	bn,a,pn	%xcc,	loop_2351
	orn	%l2,	0x0D32,	%l1
	mova	%xcc,	%i6,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2351:
	tn	%icc,	0x0
	fnot2s	%f18,	%f25
	movcs	%xcc,	%l5,	%g1
	smulcc	%o0,	%i4,	%l4
	taddcc	%i2,	0x1483,	%i3
	smulcc	%g6,	0x0ED4,	%l0
	mulx	%o3,	0x1ECB,	%g3
	movne	%icc,	%i1,	%g7
	popc	%i5,	%i0
	te	%icc,	0x0
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	sub	%o5,	%o7,	%o6
	fnand	%f20,	%f28,	%f12
	movrgz	%o2,	0x2B4,	%l3
	edge8ln	%l6,	%g2,	%g4
	fcmple16	%f0,	%f6,	%o1
	swap	[%l7 + 0x78],	%o4
	srax	%l1,	0x02,	%i6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x10] %asi,	%i7
	fbuge,a	%fcc2,	loop_2352
	movre	%l2,	0x1EA,	%l5
	movn	%icc,	%g1,	%i4
	sdivx	%l4,	0x0CA1,	%o0
loop_2352:
	tvs	%icc,	0x6
	movcc	%xcc,	%i3,	%i2
	ld	[%l7 + 0x50],	%f31
	xorcc	%l0,	0x1C93,	%g6
	fmovsne	%icc,	%f24,	%f18
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%o3
	edge8ln	%g3,	%g7,	%i5
	fbug	%fcc0,	loop_2353
	fpmerge	%f22,	%f23,	%f30
	xnorcc	%i0,	%g5,	%i1
	ldsh	[%l7 + 0x74],	%o7
loop_2353:
	andcc	%o5,	0x0027,	%o2
	addcc	%l3,	%l6,	%o6
	fpmerge	%f13,	%f11,	%f24
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
	tge	%icc,	0x5
	fbule,a	%fcc3,	loop_2354
	udivx	%g2,	0x18DA,	%o4
	tleu	%xcc,	0x7
	fnot2s	%f0,	%f2
loop_2354:
	nop
	set	0x12, %i6
	lduha	[%l7 + %i6] 0x80,	%o1
	prefetch	[%l7 + 0x20],	 0x0
	fmovda	%xcc,	%f14,	%f9
	sethi	0x18DC,	%l1
	fmovrde	%i6,	%f16,	%f28
	sethi	0x0128,	%l2
	udiv	%i7,	0x1E75,	%l5
	tne	%icc,	0x5
	orcc	%i4,	%g1,	%l4
	sub	%i3,	0x0BE3,	%o0
	membar	0x2E
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i2,	0x06A3,	%l0
	fpadd32s	%f23,	%f31,	%f8
	tle	%xcc,	0x0
	fornot1s	%f21,	%f25,	%f5
	sra	%o3,	0x0E,	%g3
	add	%g6,	%g7,	%i0
	fnot2	%f4,	%f0
	movvc	%icc,	%i5,	%g5
	ble,a,pn	%xcc,	loop_2355
	tvc	%xcc,	0x0
	bl,a	%icc,	loop_2356
	edge8l	%o7,	%o5,	%i1
loop_2355:
	fbge,a	%fcc0,	loop_2357
	call	loop_2358
loop_2356:
	edge32ln	%o2,	%l6,	%o6
	fbn	%fcc0,	loop_2359
loop_2357:
	sll	%l3,	0x0E,	%g2
loop_2358:
	movge	%xcc,	%o4,	%o1
	movrlz	%g4,	0x295,	%l1
loop_2359:
	flush	%l7 + 0x2C
	fmovrde	%l2,	%f2,	%f16
	movrgez	%i6,	%i7,	%l5
	fxors	%f23,	%f13,	%f9
	fmovdcs	%xcc,	%f22,	%f20
	siam	0x3
	andn	%i4,	%g1,	%i3
	andcc	%o0,	0x094C,	%l4
	srlx	%l0,	%i2,	%g3
	bvs,pt	%icc,	loop_2360
	brgez,a	%o3,	loop_2361
	fba,a	%fcc0,	loop_2362
	xnorcc	%g7,	%g6,	%i0
loop_2360:
	xorcc	%g5,	0x0D2F,	%i5
loop_2361:
	sll	%o7,	%o5,	%o2
loop_2362:
	fmovsvc	%icc,	%f27,	%f18
	fmovdg	%xcc,	%f4,	%f28
	orncc	%i1,	0x18D7,	%l6
	srax	%l3,	%g2,	%o6
	fmovdge	%xcc,	%f8,	%f0
	bneg,pt	%icc,	loop_2363
	movpos	%icc,	%o4,	%g4
	membar	0x78
	tcc	%icc,	0x0
loop_2363:
	sub	%o1,	0x1FE8,	%l1
	srax	%l2,	0x03,	%i7
	subc	%i6,	0x0AA3,	%l5
	tne	%icc,	0x1
	tvc	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	stwa	%i4,	[%l7 + 0x08] %asi
	fbug	%fcc2,	loop_2364
	bn,a,pt	%icc,	loop_2365
	fmovsn	%icc,	%f2,	%f1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%g1
loop_2364:
	faligndata	%f12,	%f30,	%f18
loop_2365:
	bpos,a,pn	%xcc,	loop_2366
	taddcc	%o0,	%i3,	%l4
	fsrc1s	%f27,	%f1
	fmovsg	%icc,	%f12,	%f22
loop_2366:
	orn	%i2,	0x134B,	%l0
	set	0x60, %g3
	swapa	[%l7 + %g3] 0x89,	%o3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x18] %asi,	%g7
	movleu	%xcc,	%g6,	%g3
	andncc	%g5,	%i5,	%o7
	te	%xcc,	0x6
	umulcc	%o5,	%o2,	%i0
	fmul8sux16	%f12,	%f30,	%f8
	bshuffle	%f4,	%f20,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%l6,	loop_2367
	sll	%l3,	%g2,	%i1
	set	0x7C, %i3
	ldswa	[%l7 + %i3] 0x81,	%o6
loop_2367:
	edge16	%g4,	%o4,	%o1
	fmovdcc	%icc,	%f26,	%f22
	tsubcctv	%l2,	%l1,	%i6
	movpos	%icc,	%l5,	%i7
	nop
	setx	loop_2368,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbo	%fcc0,	loop_2369
	movg	%xcc,	%g1,	%i4
	subc	%o0,	0x1793,	%i3
loop_2368:
	brlz	%l4,	loop_2370
loop_2369:
	movvc	%xcc,	%i2,	%l0
	bcc,a	%icc,	loop_2371
	move	%xcc,	%o3,	%g6
loop_2370:
	fabsd	%f30,	%f28
	xorcc	%g7,	0x1410,	%g3
loop_2371:
	bneg,pn	%icc,	loop_2372
	movcs	%icc,	%i5,	%o7
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%o4
loop_2372:
	sll	%o2,	0x04,	%g5
	array8	%i0,	%l3,	%l6
	for	%f16,	%f20,	%f30
	bg,pt	%xcc,	loop_2373
	fsrc2	%f12,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x49, %i1
	ldsba	[%l7 + %i1] 0x15,	%g2
loop_2373:
	fsrc2	%f16,	%f16
	te	%icc,	0x4
	bcs,a,pt	%xcc,	loop_2374
	fabsd	%f6,	%f2
	sdivx	%o6,	0x1B7E,	%i1
	fmovspos	%xcc,	%f3,	%f3
loop_2374:
	tvc	%xcc,	0x4
	addc	%o4,	0x162B,	%o1
	fcmple16	%f12,	%f6,	%l2
	edge8l	%g4,	%l1,	%l5
	taddcctv	%i7,	%i6,	%i4
	tneg	%icc,	0x7
	ldx	[%l7 + 0x18],	%g1
	tpos	%icc,	0x6
	bn,a,pn	%icc,	loop_2375
	subccc	%o0,	0x07DF,	%i3
	fbne	%fcc3,	loop_2376
	xnorcc	%i2,	0x0325,	%l4
loop_2375:
	subc	%o3,	0x043F,	%l0
	movrgz	%g7,	%g3,	%i5
loop_2376:
	ldd	[%l7 + 0x78],	%f6
	sllx	%g6,	0x05,	%o5
	bpos,a,pt	%xcc,	loop_2377
	movrgez	%o7,	0x2C8,	%o2
	fba	%fcc2,	loop_2378
	sir	0x161B
loop_2377:
	edge16	%i0,	%l3,	%g5
	std	%g2,	[%l7 + 0x58]
loop_2378:
	addccc	%o6,	0x1C80,	%i1
	brgez,a	%l6,	loop_2379
	sub	%o4,	%o1,	%g4
	fmovsge	%icc,	%f7,	%f13
	subc	%l1,	0x0889,	%l5
loop_2379:
	fmovdvc	%xcc,	%f6,	%f3
	ldd	[%l7 + 0x38],	%l2
	brlz,a	%i7,	loop_2380
	movne	%icc,	%i6,	%g1
	bvs	%icc,	loop_2381
	fbue,a	%fcc1,	loop_2382
loop_2380:
	popc	0x1A1E,	%o0
	movn	%icc,	%i4,	%i2
loop_2381:
	fcmpes	%fcc1,	%f1,	%f28
loop_2382:
	array16	%l4,	%o3,	%l0
	bgu,pt	%xcc,	loop_2383
	udivcc	%g7,	0x18B9,	%i3
	xnorcc	%g3,	%i5,	%g6
	edge8l	%o7,	%o5,	%i0
loop_2383:
	movleu	%icc,	%o2,	%l3
	bleu,pn	%icc,	loop_2384
	tleu	%icc,	0x7
	movrgz	%g2,	%g5,	%i1
	movpos	%xcc,	%l6,	%o6
loop_2384:
	movcs	%icc,	%o1,	%o4
	fornot2s	%f17,	%f5,	%f23
	tvc	%xcc,	0x0
	stx	%l1,	[%l7 + 0x10]
	lduw	[%l7 + 0x74],	%g4
	movrlez	%l2,	0x0C4,	%l5
	alignaddr	%i6,	%g1,	%o0
	fmovsvs	%icc,	%f12,	%f21
	move	%xcc,	%i7,	%i2
	edge8l	%l4,	%o3,	%i4
	sll	%g7,	0x16,	%i3
	edge16	%l0,	%g3,	%i5
	membar	0x1D
	movcs	%xcc,	%o7,	%o5
	movg	%xcc,	%g6,	%o2
	xor	%l3,	0x14EE,	%i0
	nop
	setx	loop_2385,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu,a,pn	%icc,	loop_2386
	and	%g5,	%i1,	%g2
	tn	%icc,	0x5
loop_2385:
	bgu,pt	%xcc,	loop_2387
loop_2386:
	fxnor	%f4,	%f20,	%f14
	fpsub16s	%f20,	%f19,	%f5
	mulx	%l6,	0x11D6,	%o6
loop_2387:
	fmovrdgz	%o1,	%f26,	%f18
	tleu	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x38] %asi,	%l1
	movpos	%xcc,	%g4,	%l2
	orcc	%o4,	%i6,	%g1
	ldsw	[%l7 + 0x2C],	%o0
	array32	%l5,	%i2,	%l4
	movrlez	%i7,	%i4,	%o3
	fmovdvc	%xcc,	%f13,	%f26
	xorcc	%g7,	%i3,	%l0
	addccc	%g3,	0x0E70,	%i5
	tsubcctv	%o5,	0x1B8C,	%g6
	fble,a	%fcc0,	loop_2388
	array8	%o2,	%o7,	%i0
	sll	%g5,	0x13,	%l3
	edge8l	%i1,	%l6,	%o6
loop_2388:
	and	%g2,	0x0D43,	%l1
	membar	0x59
	orncc	%o1,	%l2,	%o4
	nop
	setx loop_2389, %l0, %l1
	jmpl %l1, %i6
	fmovrdgz	%g1,	%f14,	%f24
	fbne	%fcc1,	loop_2390
	tcs	%xcc,	0x4
loop_2389:
	movg	%icc,	%o0,	%g4
	set	0x0F, %g2
	ldsba	[%l7 + %g2] 0x10,	%i2
loop_2390:
	movg	%icc,	%l4,	%l5
	popc	0x0415,	%i4
	fbu	%fcc0,	loop_2391
	bn,pt	%icc,	loop_2392
	bvc,pt	%xcc,	loop_2393
	edge32	%i7,	%g7,	%o3
loop_2391:
	brnz	%i3,	loop_2394
loop_2392:
	fmovdgu	%xcc,	%f7,	%f16
loop_2393:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x58] %asi,	%g3
loop_2394:
	edge32	%l0,	%o5,	%g6
	ldd	[%l7 + 0x48],	%o2
	lduw	[%l7 + 0x40],	%o7
	fands	%f11,	%f30,	%f21
	swap	[%l7 + 0x24],	%i5
	srlx	%g5,	%i0,	%l3
	movcs	%icc,	%i1,	%o6
	fbuge,a	%fcc0,	loop_2395
	mova	%xcc,	%g2,	%l6
	tl	%icc,	0x0
	fbuge,a	%fcc2,	loop_2396
loop_2395:
	movrgz	%l1,	%l2,	%o4
	fmul8ulx16	%f8,	%f0,	%f0
	tcc	%xcc,	0x2
loop_2396:
	edge32ln	%o1,	%g1,	%i6
	ldsb	[%l7 + 0x4B],	%g4
	movg	%xcc,	%o0,	%l4
	movpos	%xcc,	%i2,	%l5
	umul	%i7,	0x0915,	%i4
	st	%f21,	[%l7 + 0x78]
	andn	%o3,	0x1815,	%g7
	ta	%icc,	0x4
	subc	%i3,	0x025B,	%l0
	fmovscs	%icc,	%f27,	%f17
	umulcc	%g3,	%g6,	%o2
	fmovrdne	%o5,	%f2,	%f22
	fblg	%fcc1,	loop_2397
	fnot2s	%f23,	%f12
	taddcc	%o7,	0x0F64,	%g5
	bneg,a	%xcc,	loop_2398
loop_2397:
	taddcc	%i0,	0x0A1E,	%i5
	fbe	%fcc2,	loop_2399
	brz,a	%l3,	loop_2400
loop_2398:
	fmovsleu	%icc,	%f0,	%f14
	movrlez	%i1,	0x172,	%g2
loop_2399:
	fblg,a	%fcc3,	loop_2401
loop_2400:
	edge16ln	%l6,	%o6,	%l1
	fpsub32	%f10,	%f30,	%f16
	ldstub	[%l7 + 0x0D],	%o4
loop_2401:
	edge8n	%o1,	%g1,	%i6
	subcc	%l2,	%g4,	%o0
	tge	%icc,	0x4
	for	%f30,	%f10,	%f18
	movrgz	%i2,	%l5,	%l4
	subcc	%i4,	0x1E0F,	%o3
	ld	[%l7 + 0x4C],	%f6
	xor	%i7,	0x061F,	%g7
	nop
	setx	loop_2402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%l0,	%g3,	%i3
	tgu	%icc,	0x3
	tpos	%xcc,	0x7
loop_2402:
	orncc	%g6,	%o2,	%o5
	fcmpd	%fcc1,	%f10,	%f2
	edge8ln	%g5,	%o7,	%i0
	fbn,a	%fcc0,	loop_2403
	smul	%i5,	%i1,	%g2
	fnegs	%f11,	%f29
	movleu	%icc,	%l6,	%o6
loop_2403:
	edge32l	%l3,	%l1,	%o1
	fnands	%f23,	%f24,	%f21
	fsrc2	%f28,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g1,	%i6
	st	%f7,	[%l7 + 0x3C]
	movg	%icc,	%o4,	%g4
	xorcc	%o0,	0x0657,	%l2
	edge8	%i2,	%l5,	%i4
	edge32ln	%o3,	%l4,	%i7
	srax	%g7,	%l0,	%i3
	edge32n	%g6,	%o2,	%g3
	fmovsne	%xcc,	%f20,	%f12
	xnor	%g5,	0x1BA1,	%o7
	edge32ln	%o5,	%i0,	%i1
	tl	%icc,	0x5
	movge	%icc,	%g2,	%i5
	srax	%o6,	0x07,	%l6
	fors	%f29,	%f20,	%f14
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l3
	brgez	%o1,	loop_2404
	nop
	setx loop_2405, %l0, %l1
	jmpl %l1, %l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f28,	%f2
loop_2404:
	orcc	%i6,	0x09A6,	%o4
loop_2405:
	te	%xcc,	0x7
	fmovrde	%g4,	%f30,	%f8
	movle	%icc,	%g1,	%o0
	edge16n	%i2,	%l5,	%l2
	movrgz	%i4,	0x23B,	%l4
	srlx	%o3,	%i7,	%l0
	fornot2s	%f5,	%f31,	%f7
	tcs	%xcc,	0x6
	edge32ln	%g7,	%g6,	%i3
	fmovda	%icc,	%f10,	%f5
	fexpand	%f16,	%f16
	andcc	%g3,	%g5,	%o7
	udivx	%o5,	0x0969,	%o2
	fsrc2s	%f20,	%f21
	fxnors	%f31,	%f29,	%f0
	sub	%i0,	%i1,	%i5
	fpack16	%f2,	%f1
	tl	%icc,	0x7
	edge16l	%o6,	%g2,	%l3
	sra	%l6,	0x0A,	%l1
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x11,	%f0
	bne,a,pt	%icc,	loop_2406
	andn	%o1,	%o4,	%g4
	fcmped	%fcc3,	%f18,	%f12
	orncc	%g1,	%o0,	%i2
loop_2406:
	edge32l	%i6,	%l2,	%i4
	sethi	0x18A0,	%l4
	and	%l5,	%o3,	%i7
	fbg	%fcc2,	loop_2407
	bcc,a,pn	%icc,	loop_2408
	sll	%g7,	%g6,	%l0
	movne	%icc,	%i3,	%g3
loop_2407:
	movre	%g5,	0x39F,	%o5
loop_2408:
	taddcctv	%o7,	%o2,	%i0
	udiv	%i5,	0x03A4,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o6,	%l3,	%g2
	movleu	%xcc,	%l1,	%l6
	edge16	%o1,	%g4,	%g1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f20,	%f30
	tleu	%xcc,	0x5
	taddcc	%o4,	0x0637,	%o0
	movgu	%xcc,	%i6,	%l2
	edge16l	%i4,	%i2,	%l4
	movneg	%xcc,	%o3,	%i7
	fnot2s	%f31,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x7D],	%g7
	std	%f10,	[%l7 + 0x58]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x19
	sllx	%l5,	0x0C,	%l0
	movcc	%xcc,	%g6,	%i3
	fmul8sux16	%f0,	%f18,	%f12
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%g5
	call	loop_2409
	tne	%icc,	0x2
	movl	%xcc,	%g3,	%o7
	edge16n	%o5,	%i0,	%i5
loop_2409:
	srlx	%o2,	%i1,	%l3
	orcc	%o6,	%l1,	%l6
	fones	%f12
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3D] %asi,	%g2
	be,a	loop_2410
	fornot1s	%f6,	%f26,	%f26
	bvc,a	loop_2411
	andncc	%g4,	%g1,	%o4
loop_2410:
	fornot2s	%f7,	%f28,	%f8
	prefetch	[%l7 + 0x6C],	 0x0
loop_2411:
	movl	%icc,	%o0,	%i6
	fmovdpos	%xcc,	%f22,	%f0
	fmovsleu	%icc,	%f24,	%f5
	fbug	%fcc3,	loop_2412
	fpsub32s	%f7,	%f27,	%f1
	or	%l2,	0x0E35,	%o1
	edge8ln	%i2,	%l4,	%i4
loop_2412:
	ldsw	[%l7 + 0x58],	%i7
	nop
	set	0x7B, %l1
	ldstub	[%l7 + %l1],	%o3
	movcs	%icc,	%l5,	%g7
	edge16	%l0,	%g6,	%i3
	tneg	%icc,	0x1
	mulscc	%g3,	0x1F5A,	%o7
	tl	%xcc,	0x1
	edge8n	%o5,	%g5,	%i5
	ta	%icc,	0x3
	fpadd32	%f20,	%f14,	%f18
	xor	%o2,	0x098B,	%i1
	udivx	%i0,	0x02E7,	%o6
	fpsub16s	%f28,	%f11,	%f15
	or	%l1,	0x154F,	%l3
	mova	%icc,	%l6,	%g2
	flush	%l7 + 0x4C
	membar	0x07
	fmovrdlez	%g4,	%f6,	%f0
	movpos	%xcc,	%g1,	%o0
	xnorcc	%i6,	0x001F,	%o4
	stbar
	fzero	%f10
	movpos	%icc,	%o1,	%l2
	tleu	%xcc,	0x2
	sir	0x1647
	alignaddr	%i2,	%l4,	%i7
	tneg	%xcc,	0x7
	srl	%o3,	%l5,	%i4
	tsubcctv	%g7,	0x1A80,	%g6
	fmovsa	%icc,	%f16,	%f31
	tsubcc	%l0,	0x0F68,	%i3
	addcc	%g3,	0x1E5F,	%o5
	andncc	%g5,	%o7,	%o2
	movneg	%icc,	%i5,	%i0
	or	%o6,	0x0B46,	%l1
	popc	0x04E7,	%i1
	edge16ln	%l6,	%g2,	%l3
	fmovsle	%icc,	%f12,	%f11
	nop
	setx	loop_2413,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%g4,	%g1,	%o0
	movvc	%xcc,	%i6,	%o1
	fnot2s	%f20,	%f22
loop_2413:
	fmovd	%f18,	%f18
	array8	%o4,	%l2,	%l4
	stbar
	sethi	0x1CB5,	%i7
	umul	%i2,	0x05DB,	%l5
	fornot1	%f22,	%f22,	%f26
	fandnot1s	%f18,	%f22,	%f24
	tle	%icc,	0x6
	edge8	%o3,	%i4,	%g7
	movvc	%icc,	%g6,	%l0
	movre	%i3,	%o5,	%g5
	movvs	%icc,	%o7,	%g3
	array8	%i5,	%o2,	%i0
	tcs	%xcc,	0x6
	fbge,a	%fcc1,	loop_2414
	fpsub16s	%f31,	%f7,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f28,	%f8
loop_2414:
	brgez	%l1,	loop_2415
	tle	%icc,	0x2
	fone	%f8
	fnors	%f4,	%f3,	%f22
loop_2415:
	fmovrsgz	%o6,	%f22,	%f29
	edge16	%l6,	%i1,	%g2
	move	%icc,	%g4,	%g1
	ta	%icc,	0x0
	sll	%o0,	0x19,	%l3
	sdivx	%o1,	0x1EFB,	%o4
	tvc	%xcc,	0x1
	wr	%g0,	0x2a,	%asi
	stda	%l2,	[%l7 + 0x60] %asi
	membar	#Sync
	fcmpgt32	%f8,	%f6,	%i6
	bl,a	%xcc,	loop_2416
	edge16ln	%i7,	%i2,	%l4
	andncc	%l5,	%o3,	%i4
	fcmpeq16	%f22,	%f20,	%g7
loop_2416:
	fpsub16s	%f1,	%f22,	%f4
	array16	%l0,	%g6,	%o5
	add	%i3,	%o7,	%g5
	edge16l	%i5,	%o2,	%i0
	movl	%xcc,	%g3,	%l1
	tsubcc	%o6,	%i1,	%l6
	movg	%xcc,	%g4,	%g2
	umulcc	%o0,	0x1059,	%l3
	bg	loop_2417
	ldx	[%l7 + 0x60],	%o1
	nop
	set	0x78, %l2
	lduw	[%l7 + %l2],	%g1
	orn	%o4,	%l2,	%i7
loop_2417:
	mulx	%i2,	%i6,	%l5
	movrlez	%l4,	%i4,	%g7
	movrgz	%l0,	0x021,	%o3
	sll	%g6,	%i3,	%o5
	fones	%f5
	fmovrslz	%g5,	%f22,	%f17
	bg,pt	%xcc,	loop_2418
	fsrc2	%f30,	%f12
	smulcc	%o7,	0x0469,	%o2
	brgz,a	%i5,	loop_2419
loop_2418:
	fbg	%fcc3,	loop_2420
	movrgz	%i0,	0x2E8,	%g3
	fpsub16	%f14,	%f14,	%f4
loop_2419:
	umulcc	%o6,	0x18C3,	%i1
loop_2420:
	ld	[%l7 + 0x1C],	%f23
	edge16n	%l6,	%l1,	%g4
	andn	%o0,	0x17C9,	%g2
	fmovrslz	%o1,	%f19,	%f17
	fmuld8ulx16	%f1,	%f0,	%f26
	tneg	%xcc,	0x1
	orcc	%l3,	0x0664,	%g1
	fzeros	%f4
	nop
	setx	loop_2421,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%o4,	%i7
	bvc	%icc,	loop_2422
	ldsb	[%l7 + 0x6B],	%l2
loop_2421:
	fors	%f15,	%f31,	%f21
	lduw	[%l7 + 0x7C],	%i6
loop_2422:
	fmovrdlez	%i2,	%f2,	%f0
	movne	%xcc,	%l4,	%i4
	set	0x3C, %l3
	ldswa	[%l7 + %l3] 0x89,	%l5
	brlz	%l0,	loop_2423
	movl	%icc,	%o3,	%g7
	array32	%g6,	%i3,	%o5
	xnor	%g5,	%o7,	%i5
loop_2423:
	nop
	wr	%g0,	0x88,	%asi
	stba	%i0,	[%l7 + 0x64] %asi
	wr	%g0,	0xea,	%asi
	stda	%g2,	[%l7 + 0x78] %asi
	membar	#Sync
	nop
	setx loop_2424, %l0, %l1
	jmpl %l1, %o2
	nop
	setx	loop_2425,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%i1,	0x1AB4,	%o6
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x04,	%l1
loop_2424:
	ldsw	[%l7 + 0x64],	%g4
loop_2425:
	umulcc	%l6,	0x0E22,	%o0
	fmovrdlez	%o1,	%f4,	%f18
	tcc	%xcc,	0x4
	fba,a	%fcc1,	loop_2426
	movrgz	%l3,	%g1,	%g2
	fmovrdne	%o4,	%f6,	%f20
	fmovdgu	%xcc,	%f6,	%f13
loop_2426:
	tn	%xcc,	0x2
	fbo	%fcc2,	loop_2427
	tgu	%icc,	0x2
	movrgz	%i7,	0x34A,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l2
loop_2427:
	add	%l4,	0x1942,	%i4
	andncc	%l5,	%i2,	%o3
	orcc	%g7,	%g6,	%l0
	fmul8ulx16	%f30,	%f30,	%f24
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x42] %asi,	%i3
	srax	%g5,	%o5,	%o7
	edge16l	%i5,	%i0,	%g3
	fnands	%f18,	%f23,	%f11
	movrlz	%i1,	0x170,	%o2
	movrlez	%o6,	0x16F,	%l1
	tvs	%icc,	0x2
	fabsd	%f6,	%f14
	tcc	%icc,	0x2
	fcmpd	%fcc3,	%f4,	%f0
	te	%icc,	0x2
	sdivcc	%l6,	0x07D5,	%o0
	edge16ln	%o1,	%l3,	%g1
	fblg,a	%fcc1,	loop_2428
	movneg	%icc,	%g4,	%g2
	edge32l	%o4,	%i7,	%l2
	srl	%i6,	%i4,	%l4
loop_2428:
	stx	%i2,	[%l7 + 0x28]
	tneg	%xcc,	0x3
	edge16	%o3,	%l5,	%g7
	tvc	%icc,	0x0
	sll	%g6,	0x18,	%i3
	edge16l	%l0,	%g5,	%o5
	sdiv	%i5,	0x1FF4,	%o7
	fbn,a	%fcc1,	loop_2429
	fxor	%f2,	%f22,	%f10
	or	%g3,	0x0140,	%i1
	andcc	%o2,	%i0,	%o6
loop_2429:
	fabsd	%f24,	%f6
	fmuld8sux16	%f3,	%f20,	%f4
	fmovd	%f30,	%f28
	tneg	%icc,	0x5
	udivcc	%l1,	0x1C65,	%l6
	fpadd32	%f4,	%f10,	%f26
	movg	%icc,	%o1,	%o0
	fmovrslz	%l3,	%f13,	%f22
	movge	%xcc,	%g4,	%g2
	stb	%g1,	[%l7 + 0x5D]
	fbne	%fcc3,	loop_2430
	orn	%i7,	0x1B80,	%l2
	movpos	%xcc,	%o4,	%i4
	addc	%l4,	%i6,	%i2
loop_2430:
	sub	%l5,	%g7,	%g6
	movcs	%icc,	%i3,	%l0
	tg	%icc,	0x6
	tle	%icc,	0x7
	movne	%icc,	%g5,	%o3
	orcc	%o5,	%i5,	%g3
	bcs	loop_2431
	st	%f23,	[%l7 + 0x78]
	addccc	%o7,	%o2,	%i0
	tcc	%xcc,	0x3
loop_2431:
	fmovrsgz	%o6,	%f3,	%f24
	edge32ln	%l1,	%l6,	%i1
	xnorcc	%o0,	0x10EA,	%o1
	sub	%g4,	0x043C,	%g2
	fmovdne	%xcc,	%f1,	%f15
	movgu	%icc,	%g1,	%i7
	fba,a	%fcc0,	loop_2432
	brgz,a	%l2,	loop_2433
	addccc	%l3,	%i4,	%o4
	edge16ln	%i6,	%l4,	%l5
loop_2432:
	stbar
loop_2433:
	ldd	[%l7 + 0x30],	%f24
	tgu	%xcc,	0x2
	sdiv	%g7,	0x03E4,	%g6
	sll	%i2,	0x1A,	%i3
	sth	%g5,	[%l7 + 0x38]
	call	loop_2434
	movvs	%icc,	%l0,	%o3
	movleu	%xcc,	%i5,	%o5
	subcc	%g3,	0x0B06,	%o7
loop_2434:
	fmovsg	%icc,	%f30,	%f0
	for	%f4,	%f4,	%f2
	popc	0x0168,	%o2
	fpadd32	%f8,	%f10,	%f28
	addccc	%i0,	%o6,	%l1
	fxnors	%f3,	%f11,	%f25
	movrgz	%i1,	0x167,	%l6
	set	0x4A, %i5
	stha	%o0,	[%l7 + %i5] 0x80
	fxnor	%f6,	%f14,	%f6
	fsrc1s	%f25,	%f16
	nop
	set	0x70, %i7
	std	%g4,	[%l7 + %i7]
	fble	%fcc2,	loop_2435
	brz	%g2,	loop_2436
	lduh	[%l7 + 0x7E],	%g1
	edge32	%i7,	%o1,	%l3
loop_2435:
	sll	%l2,	0x01,	%i4
loop_2436:
	udivx	%i6,	0x1F9F,	%o4
	movn	%xcc,	%l4,	%l5
	ld	[%l7 + 0x28],	%f2
	fornot2	%f0,	%f16,	%f30
	tcs	%xcc,	0x6
	tleu	%xcc,	0x4
	fmovsn	%xcc,	%f11,	%f11
	fpack32	%f12,	%f6,	%f12
	fpack32	%f30,	%f14,	%f28
	bn	%icc,	loop_2437
	mulx	%g6,	0x0D33,	%g7
	bne,pt	%xcc,	loop_2438
	subcc	%i3,	0x0F10,	%i2
loop_2437:
	tne	%xcc,	0x2
	orcc	%l0,	%g5,	%i5
loop_2438:
	subcc	%o3,	0x01E6,	%o5
	tne	%xcc,	0x6
	edge8ln	%o7,	%o2,	%i0
	lduh	[%l7 + 0x0E],	%g3
	edge16ln	%l1,	%i1,	%l6
	fornot2s	%f8,	%f12,	%f13
	fpmerge	%f30,	%f12,	%f12
	brgz	%o6,	loop_2439
	sdiv	%g4,	0x1B05,	%o0
	addcc	%g2,	0x08D7,	%i7
	fbne,a	%fcc1,	loop_2440
loop_2439:
	movrgz	%o1,	%l3,	%g1
	fors	%f25,	%f28,	%f9
	mova	%xcc,	%l2,	%i6
loop_2440:
	srl	%i4,	%l4,	%l5
	fmovsvs	%xcc,	%f4,	%f28
	fba,a	%fcc2,	loop_2441
	movge	%icc,	%o4,	%g6
	fbn,a	%fcc2,	loop_2442
	fbl,a	%fcc0,	loop_2443
loop_2441:
	fcmpgt16	%f4,	%f6,	%g7
	movrgz	%i2,	0x2A4,	%l0
loop_2442:
	and	%i3,	%g5,	%i5
loop_2443:
	sethi	0x0E8A,	%o5
	edge32l	%o3,	%o2,	%i0
	movcc	%icc,	%g3,	%o7
	tg	%icc,	0x5
	ldub	[%l7 + 0x33],	%l1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l6,	%o6
	xnor	%g4,	0x0A3A,	%i1
	fmovsneg	%icc,	%f7,	%f10
	wr	%g0,	0x80,	%asi
	stwa	%o0,	[%l7 + 0x44] %asi
	srax	%i7,	%g2,	%l3
	stw	%g1,	[%l7 + 0x58]
	movvs	%xcc,	%l2,	%i6
	sub	%i4,	%o1,	%l5
	fandnot2s	%f4,	%f8,	%f26
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sra	%o4,	0x18,	%g6
	ba	loop_2444
	movne	%icc,	%g7,	%l4
	fcmped	%fcc2,	%f28,	%f30
	sll	%i2,	0x0B,	%i3
loop_2444:
	edge8l	%g5,	%l0,	%o5
	fmovrsgez	%o3,	%f15,	%f0
	set	0x54, %o3
	ldsba	[%l7 + %o3] 0x88,	%i5
	ld	[%l7 + 0x50],	%f24
	bl,a	loop_2445
	fmovdne	%xcc,	%f14,	%f1
	tge	%xcc,	0x2
	fpsub16s	%f25,	%f22,	%f13
loop_2445:
	edge32ln	%o2,	%g3,	%o7
	edge32ln	%i0,	%l1,	%l6
	set	0x50, %g4
	stda	%o6,	[%l7 + %g4] 0x15
	movle	%icc,	%i1,	%g4
	sll	%o0,	0x15,	%g2
	fnot2	%f8,	%f20
	array8	%l3,	%g1,	%i7
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x58] %asi,	%i6
	tvs	%icc,	0x1
	popc	%l2,	%o1
	movpos	%xcc,	%i4,	%l5
	fpadd32	%f18,	%f4,	%f14
	subc	%o4,	%g6,	%g7
	addc	%l4,	%i2,	%i3
	bpos,a	%icc,	loop_2446
	sllx	%g5,	0x11,	%l0
	set	0x6C, %i4
	lda	[%l7 + %i4] 0x10,	%f17
loop_2446:
	andn	%o3,	0x09D4,	%i5
	and	%o5,	%g3,	%o2
	fmul8ulx16	%f14,	%f12,	%f8
	xorcc	%o7,	%l1,	%l6
	tg	%xcc,	0x4
	fone	%f24
	tcc	%icc,	0x2
	brgez	%o6,	loop_2447
	movrne	%i1,	0x0E2,	%g4
	edge32n	%i0,	%o0,	%l3
	xnor	%g1,	%g2,	%i7
loop_2447:
	fmovdcc	%icc,	%f14,	%f10
	edge8n	%l2,	%o1,	%i6
	umulcc	%i4,	%o4,	%g6
	fblg,a	%fcc1,	loop_2448
	fcmps	%fcc0,	%f13,	%f15
	stb	%g7,	[%l7 + 0x29]
	ldsh	[%l7 + 0x72],	%l4
loop_2448:
	movrgz	%i2,	0x32F,	%i3
	fmovsvc	%xcc,	%f18,	%f21
	srlx	%g5,	0x16,	%l0
	set	0x61, %g5
	ldsba	[%l7 + %g5] 0x10,	%o3
	stb	%l5,	[%l7 + 0x35]
	ldsh	[%l7 + 0x3E],	%i5
	movrlz	%o5,	%o2,	%o7
	fmul8x16al	%f7,	%f10,	%f4
	fnegs	%f10,	%f29
	siam	0x2
	bge,a	%icc,	loop_2449
	ldsb	[%l7 + 0x29],	%g3
	tgu	%xcc,	0x1
	mulx	%l6,	0x195C,	%o6
loop_2449:
	fxnors	%f20,	%f23,	%f3
	fmovsvc	%icc,	%f3,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x1
	tne	%icc,	0x4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x81
	edge8	%l1,	%i1,	%g4
	fnegs	%f25,	%f4
	movge	%xcc,	%i0,	%l3
	movcs	%icc,	%o0,	%g1
	fone	%f2
	srlx	%i7,	0x1E,	%g2
	tcc	%icc,	0x2
	movn	%icc,	%l2,	%i6
	fmovrdgz	%o1,	%f0,	%f0
	addccc	%o4,	%g6,	%g7
	wr	%g0,	0x89,	%asi
	sta	%f11,	[%l7 + 0x6C] %asi
	sllx	%l4,	0x0D,	%i4
	fmovspos	%icc,	%f15,	%f15
	ble,a,pt	%xcc,	loop_2450
	fmovdg	%icc,	%f16,	%f19
	fand	%f28,	%f24,	%f8
	xor	%i2,	0x0ADA,	%i3
loop_2450:
	tg	%icc,	0x1
	smul	%l0,	0x0018,	%o3
	std	%g4,	[%l7 + 0x10]
	fmovsge	%icc,	%f1,	%f6
	tsubcc	%i5,	%o5,	%o2
	fmovdn	%xcc,	%f29,	%f15
	edge16n	%l5,	%g3,	%l6
	movvs	%icc,	%o7,	%o6
	call	loop_2451
	subcc	%i1,	%g4,	%i0
	tvs	%xcc,	0x0
	fcmpne32	%f16,	%f4,	%l1
loop_2451:
	andncc	%o0,	%l3,	%i7
	addc	%g1,	0x0A6C,	%g2
	sdiv	%i6,	0x0271,	%o1
	mulscc	%o4,	%g6,	%l2
	alignaddr	%g7,	%l4,	%i4
	fmovdneg	%icc,	%f27,	%f16
	set	0x42, %o6
	stha	%i2,	[%l7 + %o6] 0x2a
	membar	#Sync
	sllx	%i3,	%o3,	%l0
	fbne	%fcc2,	loop_2452
	alignaddr	%i5,	%o5,	%g5
	xnor	%o2,	0x177F,	%l5
	bleu	loop_2453
loop_2452:
	fbe,a	%fcc2,	loop_2454
	umulcc	%l6,	%g3,	%o6
	fmovdg	%icc,	%f6,	%f25
loop_2453:
	fcmpne32	%f4,	%f6,	%i1
loop_2454:
	nop
	set	0x08, %l5
	ldswa	[%l7 + %l5] 0x04,	%g4
	movre	%i0,	%l1,	%o7
	tneg	%icc,	0x2
	popc	0x0737,	%l3
	sub	%o0,	0x1025,	%g1
	orncc	%g2,	%i7,	%i6
	fmovdgu	%icc,	%f29,	%f13
	tle	%icc,	0x6
	fmuld8sux16	%f11,	%f5,	%f28
	bge	loop_2455
	andcc	%o4,	%o1,	%l2
	fble	%fcc0,	loop_2456
	fmovrsgez	%g6,	%f19,	%f3
loop_2455:
	edge16ln	%g7,	%l4,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2456:
	fbge	%fcc0,	loop_2457
	ldstub	[%l7 + 0x33],	%i4
	movrgz	%o3,	%l0,	%i3
	fbge	%fcc1,	loop_2458
loop_2457:
	ldsh	[%l7 + 0x5C],	%o5
	set	0x20, %l6
	ldxa	[%g0 + %l6] 0x4f,	%g5
loop_2458:
	orncc	%o2,	0x1FA2,	%i5
	movpos	%icc,	%l5,	%g3
	tn	%xcc,	0x4
	brlez,a	%l6,	loop_2459
	ba,a	loop_2460
	fbue	%fcc3,	loop_2461
	array16	%i1,	%g4,	%o6
loop_2459:
	orcc	%l1,	0x050E,	%i0
loop_2460:
	popc	%o7,	%o0
loop_2461:
	addccc	%l3,	%g2,	%i7
	bpos,pn	%xcc,	loop_2462
	fbug	%fcc1,	loop_2463
	tcs	%icc,	0x2
	tcs	%icc,	0x3
loop_2462:
	brnz	%i6,	loop_2464
loop_2463:
	sub	%o4,	0x1C4E,	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l2,	%g1
loop_2464:
	fblg	%fcc1,	loop_2465
	alignaddr	%g7,	%g6,	%i2
	wr	%g0,	0x88,	%asi
	stwa	%i4,	[%l7 + 0x2C] %asi
loop_2465:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f20,	[%l7 + 0x30] %asi
	array8	%l4,	%l0,	%o3
	sllx	%i3,	0x1B,	%o5
	sethi	0x0FB1,	%o2
	mulscc	%g5,	%i5,	%g3
	lduw	[%l7 + 0x68],	%l5
	move	%xcc,	%l6,	%g4
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	edge32l	%l1,	%i0,	%o7
	std	%i0,	[%l7 + 0x08]
	udivcc	%l3,	0x127B,	%g2
	movrgz	%o0,	%i7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i6,	%o1
	xor	%g1,	%g7,	%g6
	sll	%i2,	%l2,	%i4
	movrlez	%l0,	%l4,	%i3
	bneg,pn	%icc,	loop_2466
	array32	%o3,	%o5,	%g5
	addc	%i5,	%g3,	%o2
	movne	%xcc,	%l6,	%l5
loop_2466:
	movneg	%icc,	%g4,	%l1
	andn	%i0,	%o6,	%o7
	udiv	%i1,	0x05E0,	%l3
	fmovsa	%xcc,	%f8,	%f27
	ble,a	loop_2467
	ldsb	[%l7 + 0x3C],	%o0
	movrlz	%i7,	%o4,	%i6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7E] %asi,	%o1
loop_2467:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x7C] %asi
	flush	%l7 + 0x7C
	mulscc	%g1,	%g2,	%g6
	fzero	%f8
	brlz,a	%g7,	loop_2468
	fsrc2s	%f24,	%f25
	fpsub16	%f26,	%f28,	%f18
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l2
loop_2468:
	movrne	%i4,	0x3D1,	%l0
	bcs,pt	%xcc,	loop_2469
	fmovse	%xcc,	%f9,	%f18
	movne	%xcc,	%l4,	%i3
	fpmerge	%f28,	%f20,	%f22
loop_2469:
	ldstub	[%l7 + 0x4F],	%o3
	sethi	0x0E16,	%o5
	bgu,a	loop_2470
	edge8ln	%i2,	%i5,	%g3
	alignaddrl	%g5,	%o2,	%l6
	umulcc	%l5,	%g4,	%i0
loop_2470:
	brgz	%l1,	loop_2471
	fbue,a	%fcc2,	loop_2472
	fnand	%f0,	%f26,	%f12
	tsubcctv	%o7,	0x13ED,	%o6
loop_2471:
	fexpand	%f12,	%f0
loop_2472:
	tvc	%xcc,	0x4
	umulcc	%l3,	0x103C,	%i1
	movrne	%i7,	0x0B7,	%o0
	srax	%i6,	0x01,	%o1
	flush	%l7 + 0x1C
	orcc	%o4,	0x1004,	%g2
	subcc	%g1,	%g6,	%g7
	fbue	%fcc3,	loop_2473
	orncc	%l2,	0x092D,	%i4
	tcc	%icc,	0x7
	sir	0x1AE7
loop_2473:
	sra	%l4,	%i3,	%o3
	nop
	setx	loop_2474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16au	%f20,	%f1,	%f28
	edge32l	%l0,	%i2,	%o5
	brlez,a	%g3,	loop_2475
loop_2474:
	fmovsge	%icc,	%f2,	%f13
	ldsh	[%l7 + 0x60],	%i5
	tvc	%icc,	0x2
loop_2475:
	bgu,pt	%icc,	loop_2476
	sub	%o2,	0x1274,	%g5
	bl,a,pt	%xcc,	loop_2477
	alignaddr	%l6,	%l5,	%g4
loop_2476:
	membar	0x0F
	edge16ln	%i0,	%l1,	%o6
loop_2477:
	movrlez	%l3,	0x39F,	%i1
	prefetch	[%l7 + 0x58],	 0x3
	ldstub	[%l7 + 0x6C],	%o7
	addccc	%i7,	0x0E29,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o0,	%o1,	%o4
	tn	%xcc,	0x2
	udivcc	%g1,	0x1CAA,	%g2
	set	0x30, %i2
	lduha	[%l7 + %i2] 0x10,	%g6
	tcc	%icc,	0x2
	movrlez	%l2,	%i4,	%g7
	bge,pn	%icc,	loop_2478
	tcc	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l4,	0x1058,	%o3
loop_2478:
	tle	%xcc,	0x5
	movge	%xcc,	%l0,	%i2
	tg	%icc,	0x5
	taddcctv	%o5,	%g3,	%i3
	be,a	loop_2479
	movre	%i5,	0x078,	%o2
	udiv	%g5,	0x0585,	%l5
	fpadd32s	%f6,	%f20,	%f11
loop_2479:
	nop
	set	0x6C, %o1
	lduha	[%l7 + %o1] 0x15,	%l6
	addccc	%i0,	0x0864,	%l1
	ldsw	[%l7 + 0x64],	%o6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2E] %asi,	%g4
	bge	loop_2480
	fmovrdlz	%i1,	%f24,	%f12
	fsrc2	%f8,	%f10
	membar	0x05
loop_2480:
	ta	%icc,	0x3
	edge8l	%o7,	%i7,	%i6
	edge16	%o0,	%l3,	%o4
	fmovd	%f8,	%f2
	faligndata	%f2,	%f30,	%f10
	fmovdcs	%xcc,	%f14,	%f23
	taddcctv	%g1,	0x1B42,	%o1
	movrlez	%g2,	%l2,	%g6
	tgu	%xcc,	0x2
	fxor	%f26,	%f12,	%f26
	movcc	%icc,	%i4,	%g7
	srax	%l4,	%l0,	%o3
	fmuld8ulx16	%f27,	%f11,	%f26
	bcs,a,pn	%xcc,	loop_2481
	fbne,a	%fcc0,	loop_2482
	fmovsn	%xcc,	%f16,	%f6
	subc	%o5,	%i2,	%g3
loop_2481:
	edge8ln	%i3,	%o2,	%g5
loop_2482:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%l5,	%l6
	set	0x7A, %o2
	lduha	[%l7 + %o2] 0x15,	%i5
	ldsb	[%l7 + 0x24],	%l1
	edge8ln	%i0,	%g4,	%i1
	fpmerge	%f4,	%f14,	%f0
	fba,a	%fcc3,	loop_2483
	fcmpgt32	%f18,	%f16,	%o6
	lduw	[%l7 + 0x18],	%o7
	stbar
loop_2483:
	edge32l	%i7,	%o0,	%l3
	edge8	%o4,	%i6,	%g1
	bge,a	%icc,	loop_2484
	tcc	%icc,	0x7
	fmovdvs	%xcc,	%f19,	%f23
	movg	%icc,	%o1,	%g2
loop_2484:
	movg	%icc,	%g6,	%l2
	fmovsg	%xcc,	%f9,	%f8
	alignaddr	%i4,	%g7,	%l0
	fone	%f24
	smulcc	%l4,	%o3,	%o5
	orcc	%g3,	%i2,	%o2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g5
	bpos	%icc,	loop_2485
	movne	%xcc,	%i3,	%l6
	andn	%i5,	%l1,	%l5
	st	%f14,	[%l7 + 0x70]
loop_2485:
	nop
	wr	%g0,	0x2f,	%asi
	stda	%i0,	[%l7 + 0x28] %asi
	membar	#Sync
	movrlez	%g4,	%i1,	%o6
	umulcc	%i7,	0x02EB,	%o7
	srlx	%l3,	0x1B,	%o0
	edge8l	%o4,	%i6,	%g1
	xnorcc	%g2,	0x057B,	%g6
	set	0x0F, %g1
	ldsba	[%l7 + %g1] 0x89,	%l2
	tne	%xcc,	0x7
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o1
	sethi	0x07CF,	%i4
	edge16	%g7,	%l4,	%l0
	popc	0x1E34,	%o3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orcc	%o5,	%i2,	%g3
	umul	%g5,	0x1E68,	%i3
	addc	%l6,	0x0403,	%o2
	movleu	%xcc,	%l1,	%l5
	set	0x68, %o7
	sta	%f13,	[%l7 + %o7] 0x80
	fblg,a	%fcc3,	loop_2486
	movvs	%xcc,	%i0,	%i5
	sdiv	%i1,	0x14C6,	%g4
	faligndata	%f2,	%f28,	%f18
loop_2486:
	fpadd32	%f12,	%f14,	%f24
	movg	%icc,	%o6,	%i7
	udiv	%l3,	0x0D9F,	%o0
	addccc	%o7,	0x1AAF,	%o4
	fmovse	%xcc,	%f21,	%f22
	sth	%g1,	[%l7 + 0x7E]
	fmuld8sux16	%f24,	%f29,	%f8
	sdivcc	%g2,	0x02CE,	%i6
	umul	%l2,	0x120D,	%g6
	movpos	%xcc,	%i4,	%g7
	tl	%icc,	0x6
	prefetch	[%l7 + 0x68],	 0x3
	sra	%l4,	0x12,	%o1
	udivx	%l0,	0x1BB8,	%o5
	movle	%icc,	%i2,	%o3
	bcc,a,pt	%xcc,	loop_2487
	fornot2s	%f12,	%f7,	%f7
	fbl	%fcc2,	loop_2488
	xor	%g5,	0x16F7,	%i3
loop_2487:
	siam	0x5
	addccc	%g3,	0x02FA,	%l6
loop_2488:
	call	loop_2489
	srl	%o2,	%l1,	%i0
	fbu	%fcc1,	loop_2490
	mulscc	%l5,	%i5,	%i1
loop_2489:
	or	%g4,	0x14CF,	%i7
	sll	%o6,	%l3,	%o0
loop_2490:
	alignaddrl	%o7,	%g1,	%g2
	addccc	%o4,	0x1014,	%l2
	move	%icc,	%i6,	%i4
	siam	0x0
	fbge,a	%fcc2,	loop_2491
	movcc	%icc,	%g6,	%l4
	brgz,a	%o1,	loop_2492
	movrgez	%g7,	%o5,	%l0
loop_2491:
	fmovsne	%xcc,	%f17,	%f12
	fcmple16	%f8,	%f16,	%o3
loop_2492:
	tg	%xcc,	0x1
	wr	%g0,	0xea,	%asi
	stha	%i2,	[%l7 + 0x78] %asi
	membar	#Sync
	fmul8x16al	%f6,	%f4,	%f10
	tle	%xcc,	0x1
	fmovdgu	%icc,	%f12,	%f14
	bgu,a,pt	%xcc,	loop_2493
	alignaddrl	%g5,	%i3,	%g3
	membar	0x66
	edge16l	%l6,	%l1,	%i0
loop_2493:
	fpmerge	%f31,	%f27,	%f18
	ble,a	%icc,	loop_2494
	fbo,a	%fcc1,	loop_2495
	smul	%o2,	0x0181,	%l5
	andcc	%i5,	0x1654,	%i1
loop_2494:
	tleu	%xcc,	0x0
loop_2495:
	fcmpes	%fcc3,	%f30,	%f29
	te	%xcc,	0x3
	or	%g4,	%i7,	%l3
	tne	%xcc,	0x6
	fmovsgu	%icc,	%f1,	%f16
	bleu	%icc,	loop_2496
	fcmpeq16	%f18,	%f2,	%o0
	xnor	%o6,	%o7,	%g2
	subcc	%g1,	%l2,	%o4
loop_2496:
	fmovdcs	%xcc,	%f11,	%f15
	fmovsle	%icc,	%f2,	%f5
	array16	%i4,	%g6,	%i6
	fpadd16	%f14,	%f8,	%f24
	array32	%o1,	%g7,	%o5
	udivcc	%l4,	0x10D2,	%o3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	sra	%i2,	0x1F,	%g5
	tneg	%xcc,	0x1
	fmovdcc	%icc,	%f1,	%f20
	alignaddrl	%g3,	%i3,	%l6
	tsubcc	%i0,	0x1736,	%l1
	ldx	[%l7 + 0x38],	%o2
	movvc	%icc,	%i5,	%i1
	fbug	%fcc0,	loop_2497
	fbuge	%fcc3,	loop_2498
	bneg,pn	%icc,	loop_2499
	edge32	%g4,	%i7,	%l3
loop_2497:
	sdivcc	%o0,	0x0413,	%o6
loop_2498:
	movle	%icc,	%l5,	%g2
loop_2499:
	alignaddrl	%o7,	%g1,	%l2
	tpos	%xcc,	0x4
	taddcc	%i4,	0x02D0,	%g6
	fbu	%fcc1,	loop_2500
	brz	%o4,	loop_2501
	fcmps	%fcc2,	%f28,	%f1
	fandnot2s	%f24,	%f19,	%f3
loop_2500:
	edge8ln	%i6,	%g7,	%o1
loop_2501:
	bvs,a,pn	%icc,	loop_2502
	ldx	[%l7 + 0x60],	%o5
	sub	%l4,	0x0DD0,	%l0
	addc	%o3,	0x064C,	%i2
loop_2502:
	fmul8x16au	%f18,	%f10,	%f10
	fxnor	%f16,	%f20,	%f0
	wr	%g0,	0x89,	%asi
	stba	%g3,	[%l7 + 0x30] %asi
	fmovdl	%xcc,	%f21,	%f12
	fandnot1	%f8,	%f10,	%f30
	fmovde	%icc,	%f11,	%f10
	fornot1	%f10,	%f14,	%f0
	tsubcc	%g5,	0x1BC5,	%l6
	xorcc	%i3,	0x1A05,	%i0
	mova	%icc,	%l1,	%i5
	tleu	%icc,	0x4
	brnz,a	%i1,	loop_2503
	tcc	%icc,	0x2
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x15
loop_2503:
	udivx	%g4,	0x189D,	%o2
	array16	%l3,	%i7,	%o6
	orncc	%o0,	0x18DE,	%l5
	fnor	%f12,	%f14,	%f18
	fmovdleu	%icc,	%f3,	%f31
	fmovsvc	%xcc,	%f24,	%f20
	fmovdneg	%icc,	%f30,	%f17
	udiv	%g2,	0x0FF9,	%g1
	flush	%l7 + 0x44
	addcc	%o7,	0x0BB0,	%l2
	fpsub16	%f2,	%f12,	%f10
	xnor	%g6,	%i4,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i6,	0x1DDF,	%o1
	fpadd32s	%f3,	%f3,	%f8
	tl	%xcc,	0x6
	orncc	%g7,	%o5,	%l0
	bg	%icc,	loop_2504
	subc	%o3,	%i2,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0FDD,	%g5
loop_2504:
	sll	%l6,	%i3,	%l4
	sir	0x1A21
	umulcc	%l1,	0x0B6A,	%i0
	fpack16	%f28,	%f10
	fpsub32	%f4,	%f12,	%f18
	wr	%g0,	0x22,	%asi
	stwa	%i5,	[%l7 + 0x20] %asi
	membar	#Sync
	fcmpes	%fcc3,	%f28,	%f19
	wr	%g0,	0x10,	%asi
	stwa	%g4,	[%l7 + 0x48] %asi
	xnor	%i1,	%l3,	%i7
	fornot2s	%f16,	%f23,	%f31
	tn	%icc,	0x3
	movrlez	%o6,	0x34B,	%o0
	edge8n	%o2,	%g2,	%l5
	nop
	setx loop_2505, %l0, %l1
	jmpl %l1, %o7
	fbl	%fcc3,	loop_2506
	sdiv	%g1,	0x1336,	%l2
	nop
	setx	loop_2507,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2505:
	tn	%xcc,	0x2
loop_2506:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x50] %asi,	%g6
loop_2507:
	mova	%xcc,	%i4,	%o4
	mulscc	%i6,	%g7,	%o1
	movrlz	%l0,	%o3,	%i2
	fmovsge	%xcc,	%f28,	%f11
	subccc	%o5,	%g5,	%l6
	tge	%xcc,	0x0
	tpos	%icc,	0x0
	fnot2s	%f17,	%f5
	fbne	%fcc0,	loop_2508
	edge16ln	%i3,	%g3,	%l1
	fmovsgu	%xcc,	%f10,	%f13
	tpos	%icc,	0x2
loop_2508:
	brnz,a	%i0,	loop_2509
	fmovdvc	%xcc,	%f30,	%f29
	xnorcc	%i5,	0x1841,	%g4
	fabss	%f1,	%f4
loop_2509:
	or	%l4,	%i1,	%l3
	tge	%xcc,	0x4
	taddcctv	%o6,	0x0537,	%i7
	addccc	%o0,	%g2,	%o2
	edge32l	%o7,	%g1,	%l2
	edge16n	%g6,	%i4,	%l5
	tne	%icc,	0x4
	wr	%g0,	0xea,	%asi
	stba	%i6,	[%l7 + 0x63] %asi
	membar	#Sync
	fmovrsne	%g7,	%f4,	%f16
	fbule,a	%fcc1,	loop_2510
	or	%o1,	%o4,	%o3
	subc	%i2,	0x153B,	%l0
	tvs	%xcc,	0x1
loop_2510:
	fmul8sux16	%f0,	%f6,	%f28
	fmuld8ulx16	%f3,	%f1,	%f16
	tsubcc	%o5,	0x136B,	%l6
	fcmpgt16	%f6,	%f28,	%g5
	bvs,a	%icc,	loop_2511
	udiv	%g3,	0x0C96,	%i3
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x34] %asi
loop_2511:
	mova	%icc,	%i0,	%i5
	brgez,a	%g4,	loop_2512
	mulx	%l1,	0x0730,	%l4
	fmovsg	%xcc,	%f31,	%f16
	fmovda	%icc,	%f10,	%f22
loop_2512:
	ldsb	[%l7 + 0x17],	%l3
	edge32	%i1,	%o6,	%o0
	orcc	%g2,	%i7,	%o2
	nop
	setx	loop_2513,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%o7,	%l2,	%g6
	udiv	%i4,	0x0C1D,	%l5
	umul	%i6,	%g7,	%g1
loop_2513:
	bvc,a	%icc,	loop_2514
	fmovrdgz	%o4,	%f10,	%f4
	xnorcc	%o1,	%o3,	%i2
	mova	%xcc,	%l0,	%l6
loop_2514:
	fmul8sux16	%f28,	%f2,	%f30
	fpsub16s	%f2,	%f7,	%f6
	wr	%g0,	0xeb,	%asi
	stda	%o4,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8n	%g3,	%i3,	%i0
	fnot2s	%f19,	%f5
	ldsw	[%l7 + 0x44],	%i5
	stb	%g5,	[%l7 + 0x71]
	fxors	%f12,	%f21,	%f2
	wr	%g0,	0x0c,	%asi
	sta	%f10,	[%l7 + 0x40] %asi
	movpos	%icc,	%g4,	%l4
	add	%l1,	%l3,	%o6
	xnorcc	%o0,	0x1124,	%g2
	for	%f20,	%f6,	%f20
	sdivx	%i1,	0x0C01,	%o2
	ta	%icc,	0x2
	addc	%i7,	%o7,	%g6
	and	%l2,	0x114F,	%i4
	fblg	%fcc0,	loop_2515
	fmovdgu	%xcc,	%f18,	%f2
	wr	%g0,	0xe3,	%asi
	stwa	%l5,	[%l7 + 0x24] %asi
	membar	#Sync
loop_2515:
	fbug	%fcc2,	loop_2516
	edge32ln	%i6,	%g1,	%g7
	sllx	%o4,	%o1,	%i2
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l0
loop_2516:
	fbuge,a	%fcc1,	loop_2517
	sethi	0x10AC,	%o3
	fbe,a	%fcc1,	loop_2518
	sdivx	%o5,	0x0580,	%l6
loop_2517:
	nop
	wr	%g0,	0x2b,	%asi
	stba	%g3,	[%l7 + 0x33] %asi
	membar	#Sync
loop_2518:
	sth	%i0,	[%l7 + 0x64]
	udivx	%i5,	0x1A83,	%i3
	bvc	%icc,	loop_2519
	fmovsgu	%icc,	%f5,	%f3
	faligndata	%f2,	%f16,	%f0
	tneg	%icc,	0x1
loop_2519:
	fcmps	%fcc1,	%f20,	%f1
	ldx	[%l7 + 0x40],	%g4
	brlez,a	%l4,	loop_2520
	fpsub16	%f24,	%f6,	%f6
	fxor	%f4,	%f0,	%f24
	tge	%xcc,	0x0
loop_2520:
	taddcctv	%g5,	%l1,	%o6
	fbne	%fcc0,	loop_2521
	xnorcc	%o0,	0x1941,	%g2
	fbule	%fcc1,	loop_2522
	tleu	%xcc,	0x2
loop_2521:
	ld	[%l7 + 0x44],	%f25
	movvc	%icc,	%l3,	%o2
loop_2522:
	tvc	%xcc,	0x2
	alignaddr	%i1,	%o7,	%i7
	brlz,a	%g6,	loop_2523
	tleu	%xcc,	0x7
	xorcc	%i4,	%l5,	%i6
	movg	%xcc,	%l2,	%g1
loop_2523:
	fmovrslz	%g7,	%f28,	%f17
	ldsw	[%l7 + 0x1C],	%o4
	brgez	%o1,	loop_2524
	fones	%f18
	popc	0x1119,	%i2
	fmovdne	%xcc,	%f20,	%f16
loop_2524:
	bpos,a,pn	%icc,	loop_2525
	fbule	%fcc1,	loop_2526
	edge16l	%l0,	%o5,	%o3
	addcc	%l6,	%i0,	%i5
loop_2525:
	fmovdn	%icc,	%f2,	%f27
loop_2526:
	fmovrdgez	%g3,	%f28,	%f30
	fandnot2	%f4,	%f4,	%f6
	bg,pt	%xcc,	loop_2527
	xor	%g4,	0x140C,	%i3
	tleu	%xcc,	0x6
	addccc	%l4,	0x1CE0,	%l1
loop_2527:
	be,pn	%xcc,	loop_2528
	fmovda	%xcc,	%f31,	%f13
	fornot1	%f18,	%f6,	%f0
	xnor	%o6,	0x0609,	%o0
loop_2528:
	nop
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	fmovsa	%icc,	%f11,	%f28
	movvc	%xcc,	%g2,	%o2
	fbg	%fcc2,	loop_2529
	movge	%icc,	%l3,	%o7
	bcc,a	%xcc,	loop_2530
	sll	%i1,	0x19,	%i7
loop_2529:
	stbar
	fnot1	%f18,	%f18
loop_2530:
	movg	%xcc,	%i4,	%l5
	andn	%g6,	%i6,	%g1
	fmovrsgz	%g7,	%f9,	%f7
	edge16l	%l2,	%o4,	%i2
	fmovrslz	%o1,	%f13,	%f24
	ldstub	[%l7 + 0x3D],	%l0
	ldsw	[%l7 + 0x0C],	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%l6
	fcmpeq16	%f10,	%f28,	%i0
	smul	%g3,	0x00D5,	%i5
	fba	%fcc1,	loop_2531
	fand	%f10,	%f6,	%f28
	movne	%xcc,	%i3,	%g4
	movleu	%icc,	%l4,	%o6
loop_2531:
	sdivcc	%o0,	0x15D6,	%g5
	fmovsneg	%xcc,	%f9,	%f29
	move	%icc,	%g2,	%o2
	movpos	%xcc,	%l3,	%l1
	fbl	%fcc2,	loop_2532
	fmovrslez	%i1,	%f12,	%f18
	movpos	%icc,	%i7,	%o7
	sdivcc	%l5,	0x1517,	%i4
loop_2532:
	movrgez	%g6,	%i6,	%g1
	fmul8sux16	%f16,	%f20,	%f10
	sllx	%l2,	0x1E,	%g7
	set	0x28, %o5
	swapa	[%l7 + %o5] 0x88,	%o4
	tcs	%icc,	0x7
	bneg,a	%icc,	loop_2533
	udivx	%i2,	0x1EB6,	%o1
	bge	loop_2534
	xnorcc	%o3,	0x1E9B,	%l0
loop_2533:
	bne,a,pn	%xcc,	loop_2535
	fpackfix	%f26,	%f8
loop_2534:
	taddcc	%o5,	%i0,	%g3
	edge16n	%l6,	%i5,	%g4
loop_2535:
	and	%l4,	0x1573,	%o6
	fba	%fcc2,	loop_2536
	tcc	%xcc,	0x3
	edge32n	%o0,	%i3,	%g5
	tsubcctv	%o2,	0x0260,	%l3
loop_2536:
	nop
	set	0x5C, %i6
	lda	[%l7 + %i6] 0x80,	%f17
	taddcc	%l1,	%g2,	%i7
	udiv	%o7,	0x0632,	%i1
	edge32	%l5,	%g6,	%i4
	fmovde	%icc,	%f26,	%f8
	alignaddr	%i6,	%l2,	%g1
	fnot2s	%f29,	%f12
	add	%l7,	0x64,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g7,	%i2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	andn	%o3,	%l0,	%o4
	ba	loop_2537
	ldd	[%l7 + 0x18],	%f10
	orncc	%i0,	0x054A,	%o5
	fmovrslz	%l6,	%f8,	%f21
loop_2537:
	and	%g3,	%i5,	%g4
	add	%l4,	0x18BA,	%o0
	edge16n	%i3,	%o6,	%g5
	fzero	%f0
	mova	%xcc,	%l3,	%o2
	ldd	[%l7 + 0x28],	%g2
	tne	%icc,	0x5
	subc	%l1,	%o7,	%i7
	sllx	%i1,	%g6,	%l5
	fsrc2s	%f11,	%f27
	edge8n	%i4,	%i6,	%l2
	movrgez	%g7,	0x162,	%g1
	srax	%o1,	0x09,	%o3
	fpsub16s	%f7,	%f26,	%f0
	for	%f4,	%f2,	%f14
	fxnors	%f28,	%f5,	%f6
	andn	%i2,	0x0353,	%l0
	sth	%o4,	[%l7 + 0x62]
	smul	%o5,	%i0,	%g3
	bne	loop_2538
	bcs,a,pt	%icc,	loop_2539
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x4
loop_2538:
	movneg	%icc,	%l6,	%i5
loop_2539:
	movle	%xcc,	%g4,	%o0
	alignaddrl	%i3,	%o6,	%g5
	tcc	%xcc,	0x4
	tne	%icc,	0x3
	alignaddrl	%l4,	%l3,	%g2
	edge16l	%l1,	%o2,	%i7
	edge16	%i1,	%o7,	%l5
	edge8	%i4,	%i6,	%l2
	fmovrdgez	%g6,	%f0,	%f28
	for	%f16,	%f28,	%f10
	taddcc	%g7,	0x1EC1,	%o1
	array16	%g1,	%o3,	%l0
	fmovsvs	%xcc,	%f5,	%f8
	prefetch	[%l7 + 0x70],	 0x2
	st	%f3,	[%l7 + 0x6C]
	sub	%o4,	0x1E52,	%o5
	addcc	%i0,	%g3,	%l6
	movcc	%icc,	%i2,	%i5
	fxnor	%f16,	%f28,	%f28
	fbu,a	%fcc3,	loop_2540
	array16	%o0,	%i3,	%g4
	fmovdcs	%icc,	%f31,	%f17
	fmovrdne	%g5,	%f6,	%f26
loop_2540:
	andn	%o6,	%l3,	%l4
	sethi	0x071C,	%g2
	udiv	%o2,	0x0E04,	%i7
	and	%l1,	%o7,	%i1
	mova	%xcc,	%l5,	%i4
	fbl,a	%fcc2,	loop_2541
	andncc	%l2,	%i6,	%g6
	bleu,pt	%xcc,	loop_2542
	orncc	%o1,	0x1DC1,	%g7
loop_2541:
	fnegs	%f20,	%f0
	fbne,a	%fcc0,	loop_2543
loop_2542:
	ta	%icc,	0x5
	movleu	%xcc,	%g1,	%o3
	sll	%l0,	%o4,	%o5
loop_2543:
	movrgez	%i0,	%g3,	%l6
	tne	%xcc,	0x0
	subc	%i2,	0x1989,	%i5
	stx	%o0,	[%l7 + 0x10]
	sub	%i3,	%g4,	%o6
	fpsub32	%f14,	%f26,	%f0
	edge32ln	%g5,	%l3,	%l4
	fbg	%fcc0,	loop_2544
	udiv	%o2,	0x04AE,	%g2
	fbug,a	%fcc1,	loop_2545
	tcs	%icc,	0x6
loop_2544:
	edge8l	%i7,	%o7,	%l1
	movge	%icc,	%l5,	%i4
loop_2545:
	movneg	%xcc,	%i1,	%l2
	bne,a	%xcc,	loop_2546
	andn	%i6,	0x0E84,	%o1
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x11,	%f16
loop_2546:
	movre	%g6,	0x302,	%g7
	popc	%o3,	%g1
	sllx	%o4,	%l0,	%i0
	fcmps	%fcc0,	%f11,	%f30
	brlz,a	%g3,	loop_2547
	andncc	%o5,	%i2,	%l6
	edge8	%i5,	%o0,	%i3
	fnors	%f12,	%f22,	%f29
loop_2547:
	umul	%o6,	0x0D7B,	%g4
	srlx	%l3,	0x03,	%g5
	fornot1	%f12,	%f10,	%f8
	fbuge,a	%fcc3,	loop_2548
	fand	%f20,	%f26,	%f2
	membar	0x30
	sub	%o2,	%g2,	%l4
loop_2548:
	fsrc2	%f20,	%f2
	array8	%i7,	%o7,	%l1
	xorcc	%l5,	0x0D62,	%i4
	fpadd16s	%f14,	%f16,	%f31
	bl,pt	%icc,	loop_2549
	movneg	%icc,	%i1,	%l2
	addccc	%i6,	%o1,	%g7
	st	%f8,	[%l7 + 0x5C]
loop_2549:
	sra	%o3,	%g1,	%o4
	addc	%g6,	%i0,	%g3
	tn	%xcc,	0x5
	brlez,a	%l0,	loop_2550
	orn	%o5,	%i2,	%i5
	fandnot2	%f30,	%f0,	%f22
	nop
	setx	loop_2551,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2550:
	fmul8x16al	%f29,	%f5,	%f18
	bg,pt	%icc,	loop_2552
	sdiv	%o0,	0x0D83,	%i3
loop_2551:
	brz	%l6,	loop_2553
	fbu	%fcc0,	loop_2554
loop_2552:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g4,	0x35C,	%o6
loop_2553:
	call	loop_2555
loop_2554:
	mulscc	%g5,	%o2,	%g2
	movgu	%icc,	%l4,	%l3
	movge	%xcc,	%o7,	%i7
loop_2555:
	edge32l	%l5,	%i4,	%i1
	fnot1	%f16,	%f16
	srlx	%l1,	%i6,	%o1
	orn	%l2,	0x15D3,	%o3
	fmovdn	%xcc,	%f22,	%f7
	smulcc	%g1,	0x0620,	%o4
	movvs	%icc,	%g7,	%i0
	movg	%xcc,	%g3,	%g6
	brlez	%l0,	loop_2556
	subccc	%i2,	%i5,	%o0
	tvc	%xcc,	0x6
	set	0x50, %g3
	sta	%f8,	[%l7 + %g3] 0x10
loop_2556:
	mova	%xcc,	%i3,	%o5
	movleu	%icc,	%g4,	%l6
	fone	%f14
	sra	%g5,	0x03,	%o2
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x15,	%f16
	taddcc	%g2,	0x1168,	%o6
	movvs	%xcc,	%l3,	%l4
	set	0x7E, %i3
	stha	%i7,	[%l7 + %i3] 0x23
	membar	#Sync
	stw	%l5,	[%l7 + 0x54]
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x76] %asi,	%i4
	ld	[%l7 + 0x6C],	%f6
	add	%i1,	0x1CC5,	%l1
	brlz	%o7,	loop_2557
	fble,a	%fcc2,	loop_2558
	stx	%i6,	[%l7 + 0x40]
	umul	%o1,	%o3,	%l2
loop_2557:
	move	%icc,	%o4,	%g1
loop_2558:
	tsubcctv	%i0,	%g7,	%g3
	set	0x46, %g6
	ldsha	[%l7 + %g6] 0x19,	%g6
	movcs	%xcc,	%i2,	%l0
	or	%i5,	0x03E3,	%o0
	fmovsl	%xcc,	%f25,	%f0
	fornot1s	%f20,	%f13,	%f27
	movrne	%o5,	%g4,	%l6
	movl	%icc,	%i3,	%g5
	tgu	%icc,	0x4
	subc	%g2,	0x11C8,	%o2
	popc	0x1F1B,	%l3
	tne	%icc,	0x3
	brlz	%l4,	loop_2559
	edge16	%o6,	%i7,	%l5
	tvs	%icc,	0x5
	fbge	%fcc2,	loop_2560
loop_2559:
	bl,a	%icc,	loop_2561
	tcc	%icc,	0x6
	ldd	[%l7 + 0x70],	%i4
loop_2560:
	fbu,a	%fcc0,	loop_2562
loop_2561:
	movcc	%icc,	%i1,	%l1
	array8	%o7,	%o1,	%i6
	edge32n	%l2,	%o4,	%o3
loop_2562:
	nop
	set	0x40, %l0
	stxa	%i0,	[%l7 + %l0] 0x89
	movge	%icc,	%g1,	%g7
	fnegs	%f16,	%f13
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x54] %asi,	%g6
	bleu	loop_2563
	fbuge,a	%fcc1,	loop_2564
	tcs	%icc,	0x6
	edge16	%g3,	%l0,	%i2
loop_2563:
	fcmpd	%fcc3,	%f18,	%f4
loop_2564:
	fbue,a	%fcc2,	loop_2565
	fnot2	%f8,	%f2
	srlx	%i5,	0x1F,	%o5
	fmovse	%icc,	%f13,	%f19
loop_2565:
	nop
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf9,	%f16
	udiv	%o0,	0x0FFA,	%l6
	fmovdge	%xcc,	%f29,	%f12
	srlx	%g4,	%g5,	%i3
	set	0x08, %g2
	stda	%g2,	[%l7 + %g2] 0x80
	tvs	%xcc,	0x5
	edge16ln	%o2,	%l4,	%o6
	movleu	%icc,	%i7,	%l5
	taddcctv	%l3,	%i4,	%i1
	udivx	%o7,	0x19FE,	%l1
	addcc	%o1,	0x087D,	%l2
	add	%i6,	%o4,	%i0
	edge32ln	%o3,	%g7,	%g6
	movn	%xcc,	%g1,	%g3
	brgez	%i2,	loop_2566
	fbul,a	%fcc1,	loop_2567
	movl	%xcc,	%l0,	%i5
	movle	%xcc,	%o5,	%l6
loop_2566:
	sub	%g4,	%g5,	%o0
loop_2567:
	stbar
	movneg	%xcc,	%g2,	%i3
	addc	%l4,	%o2,	%i7
	popc	0x060E,	%l5
	edge8	%l3,	%o6,	%i1
	wr	%g0,	0x04,	%asi
	stha	%o7,	[%l7 + 0x7A] %asi
	andncc	%l1,	%o1,	%i4
	popc	0x1F52,	%i6
	edge32	%l2,	%o4,	%i0
	movne	%xcc,	%g7,	%o3
	bg,a,pn	%xcc,	loop_2568
	faligndata	%f28,	%f26,	%f18
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x19,	%f16
loop_2568:
	movre	%g6,	0x194,	%g1
	edge32ln	%i2,	%l0,	%i5
	srax	%g3,	%l6,	%o5
	sdivx	%g4,	0x1525,	%o0
	fbule	%fcc0,	loop_2569
	fbue,a	%fcc3,	loop_2570
	bg,a	loop_2571
	tvc	%xcc,	0x4
loop_2569:
	bcs	%icc,	loop_2572
loop_2570:
	fabss	%f20,	%f1
loop_2571:
	fxnor	%f26,	%f26,	%f20
	fbuge	%fcc3,	loop_2573
loop_2572:
	movrgez	%g2,	%g5,	%l4
	sir	0x1886
	movrne	%i3,	%i7,	%o2
loop_2573:
	udivcc	%l3,	0x1C0A,	%l5
	tgu	%xcc,	0x4
	movne	%xcc,	%i1,	%o7
	movrne	%l1,	0x2CA,	%o1
	umulcc	%i4,	0x070E,	%i6
	tvc	%icc,	0x0
	membar	0x75
	set	0x45, %l1
	lduba	[%l7 + %l1] 0x81,	%o6
	andcc	%l2,	%o4,	%g7
	smul	%o3,	0x117D,	%i0
	fble	%fcc2,	loop_2574
	smulcc	%g1,	%g6,	%i2
	fmovsvs	%icc,	%f11,	%f18
	orcc	%i5,	%l0,	%g3
loop_2574:
	orn	%l6,	0x1D10,	%o5
	xnorcc	%o0,	%g2,	%g4
	mulx	%g5,	0x1816,	%i3
	swap	[%l7 + 0x58],	%l4
	sir	0x1E06
	popc	0x0A5E,	%o2
	movrlez	%l3,	%i7,	%i1
	fmovdl	%icc,	%f27,	%f12
	movle	%xcc,	%l5,	%o7
	nop
	setx	loop_2575,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%xcc,	%o1,	%i4
	movl	%icc,	%i6,	%o6
	te	%icc,	0x6
loop_2575:
	sub	%l2,	0x144B,	%o4
	fornot1s	%f23,	%f28,	%f5
	add	%l1,	%g7,	%o3
	ba,a,pt	%icc,	loop_2576
	movge	%xcc,	%i0,	%g6
	set	0x44, %l3
	lda	[%l7 + %l3] 0x81,	%f7
loop_2576:
	sdivcc	%i2,	0x19E0,	%g1
	movvc	%icc,	%i5,	%l0
	fpsub32s	%f10,	%f18,	%f9
	brlez	%g3,	loop_2577
	movgu	%icc,	%l6,	%o0
	smul	%g2,	%g4,	%g5
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o5
loop_2577:
	fmovsl	%icc,	%f0,	%f1
	xorcc	%i3,	%o2,	%l3
	fmovrdne	%i7,	%f0,	%f24
	nop
	set	0x68, %i5
	stx	%i1,	[%l7 + %i5]
	brlez	%l4,	loop_2578
	fmovspos	%xcc,	%f20,	%f8
	taddcc	%o7,	0x0F6B,	%l5
	fmovrsgez	%i4,	%f25,	%f24
loop_2578:
	smulcc	%o1,	0x1AA1,	%i6
	movrlz	%o6,	%l2,	%o4
	movrlez	%l1,	%o3,	%g7
	movne	%icc,	%g6,	%i0
	tn	%icc,	0x1
	tcc	%icc,	0x5
	fpsub32	%f0,	%f26,	%f22
	fsrc1	%f12,	%f0
	xnorcc	%g1,	%i5,	%i2
	tge	%xcc,	0x4
	membar	0x70
	fpsub16	%f16,	%f16,	%f0
	fbo,a	%fcc3,	loop_2579
	tcc	%icc,	0x7
	ble,pn	%xcc,	loop_2580
	fnot1	%f14,	%f16
loop_2579:
	movl	%xcc,	%g3,	%l6
	fbuge,a	%fcc1,	loop_2581
loop_2580:
	fzero	%f6
	udiv	%o0,	0x1D89,	%g2
	array16	%g4,	%l0,	%g5
loop_2581:
	fornot2	%f22,	%f10,	%f22
	edge32n	%i3,	%o5,	%l3
	nop
	setx	loop_2582,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%o2,	%i1,	%i7
	srax	%l4,	0x1C,	%l5
	lduh	[%l7 + 0x7A],	%o7
loop_2582:
	stx	%o1,	[%l7 + 0x50]
	movrgez	%i6,	%o6,	%i4
	taddcc	%o4,	%l2,	%o3
	fmovsvc	%xcc,	%f7,	%f24
	nop
	setx loop_2583, %l0, %l1
	jmpl %l1, %g7
	movrlz	%g6,	0x129,	%i0
	fnegd	%f12,	%f26
	edge16l	%l1,	%i5,	%g1
loop_2583:
	fbo,a	%fcc3,	loop_2584
	edge8n	%i2,	%l6,	%o0
	fble,a	%fcc0,	loop_2585
	xnor	%g2,	%g4,	%l0
loop_2584:
	sdiv	%g5,	0x02DE,	%g3
	mova	%icc,	%o5,	%i3
loop_2585:
	umulcc	%l3,	%o2,	%i7
	fzero	%f14
	bvs,a	loop_2586
	array32	%l4,	%l5,	%i1
	fmul8x16	%f9,	%f26,	%f20
	fmovda	%xcc,	%f3,	%f8
loop_2586:
	nop
	setx loop_2587, %l0, %l1
	jmpl %l1, %o7
	andncc	%i6,	%o1,	%i4
	smulcc	%o6,	%l2,	%o3
	ldstub	[%l7 + 0x35],	%o4
loop_2587:
	tleu	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x13] %asi,	%g6
	set	0x5D, %i7
	ldsba	[%l7 + %i7] 0x18,	%g7
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x15,	%i0
	subc	%l1,	0x061E,	%g1
	bl,a	%icc,	loop_2588
	xnor	%i5,	0x0219,	%i2
	sdivcc	%l6,	0x1049,	%o0
	mova	%xcc,	%g4,	%l0
loop_2588:
	srax	%g2,	%g3,	%o5
	tle	%xcc,	0x5
	ldsh	[%l7 + 0x48],	%i3
	alignaddr	%g5,	%o2,	%i7
	fnor	%f4,	%f2,	%f18
	fcmpeq16	%f2,	%f6,	%l3
	tneg	%icc,	0x6
	movn	%xcc,	%l4,	%i1
	bvs,a,pn	%icc,	loop_2589
	fmovda	%xcc,	%f29,	%f31
	tl	%xcc,	0x2
	tsubcctv	%l5,	%i6,	%o7
loop_2589:
	tg	%icc,	0x1
	movrlz	%i4,	%o6,	%o1
	sdiv	%l2,	0x0325,	%o4
	add	%g6,	%o3,	%g7
	tl	%icc,	0x0
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x88,	%f24
	fornot2s	%f14,	%f25,	%f18
	fmovscs	%xcc,	%f28,	%f10
	ld	[%l7 + 0x44],	%f21
	movvc	%xcc,	%i0,	%l1
	fcmpes	%fcc2,	%f8,	%f20
	fbule	%fcc1,	loop_2590
	fandnot1s	%f13,	%f22,	%f7
	tvs	%icc,	0x3
	tgu	%xcc,	0x7
loop_2590:
	bgu	%icc,	loop_2591
	pdist	%f12,	%f4,	%f16
	brlz	%i5,	loop_2592
	umulcc	%i2,	0x0D35,	%l6
loop_2591:
	fbl,a	%fcc3,	loop_2593
	sir	0x0FDB
loop_2592:
	bn,a	%xcc,	loop_2594
	fbl	%fcc2,	loop_2595
loop_2593:
	fbue	%fcc2,	loop_2596
	orn	%g1,	%g4,	%o0
loop_2594:
	mova	%xcc,	%l0,	%g2
loop_2595:
	alignaddrl	%o5,	%i3,	%g5
loop_2596:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x77] %asi,	%g3
	movne	%xcc,	%o2,	%l3
	bvs	%icc,	loop_2597
	edge32n	%l4,	%i7,	%i1
	lduw	[%l7 + 0x48],	%i6
	tl	%xcc,	0x0
loop_2597:
	membar	0x3A
	array32	%l5,	%i4,	%o6
	taddcc	%o1,	0x06A9,	%o7
	for	%f8,	%f12,	%f14
	smulcc	%o4,	%l2,	%g6
	wr	%g0,	0x22,	%asi
	stha	%o3,	[%l7 + 0x4E] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g7,	0x1A6C,	%i0
	fabsd	%f24,	%f8
	fmul8x16	%f12,	%f8,	%f4
	tcc	%icc,	0x7
	orn	%i5,	0x18C9,	%l1
	tge	%xcc,	0x6
	edge8n	%i2,	%l6,	%g1
	fornot1	%f12,	%f16,	%f20
	fornot2s	%f12,	%f17,	%f13
	tvs	%icc,	0x0
	sth	%o0,	[%l7 + 0x6C]
	fbul,a	%fcc1,	loop_2598
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	loop_2599
	taddcctv	%l0,	%g4,	%o5
loop_2598:
	movre	%g2,	%g5,	%g3
	popc	%o2,	%i3
loop_2599:
	pdist	%f26,	%f4,	%f18
	taddcctv	%l4,	%l3,	%i1
	fzero	%f4
	fnot2s	%f11,	%f19
	movvs	%icc,	%i6,	%l5
	umul	%i4,	0x0767,	%o6
	sir	0x165A
	fcmpes	%fcc3,	%f28,	%f22
	tl	%xcc,	0x4
	bgu,a,pt	%icc,	loop_2600
	movcs	%icc,	%o1,	%i7
	sllx	%o4,	%l2,	%o7
	udivx	%g6,	0x166C,	%g7
loop_2600:
	movge	%icc,	%o3,	%i5
	bvc,a,pt	%xcc,	loop_2601
	tleu	%icc,	0x1
	std	%f6,	[%l7 + 0x20]
	sllx	%i0,	%i2,	%l1
loop_2601:
	bgu,a,pn	%xcc,	loop_2602
	fbl	%fcc2,	loop_2603
	edge8n	%g1,	%l6,	%l0
	fxnors	%f9,	%f15,	%f18
loop_2602:
	edge32ln	%g4,	%o5,	%o0
loop_2603:
	movrlz	%g5,	%g3,	%g2
	ldsh	[%l7 + 0x16],	%i3
	tgu	%xcc,	0x1
	edge32l	%l4,	%o2,	%i1
	fbge,a	%fcc2,	loop_2604
	movre	%l3,	%l5,	%i6
	edge32	%i4,	%o1,	%i7
	set	0x78, %i0
	sta	%f13,	[%l7 + %i0] 0x10
loop_2604:
	fandnot1	%f2,	%f2,	%f10
	mulscc	%o6,	%l2,	%o4
	srax	%g6,	0x0E,	%g7
	tneg	%xcc,	0x0
	xorcc	%o3,	0x02B4,	%o7
	edge16l	%i0,	%i5,	%i2
	fnot1s	%f15,	%f20
	fmovdge	%icc,	%f2,	%f18
	orcc	%g1,	0x1E32,	%l6
	fmovdpos	%icc,	%f19,	%f15
	fmovrdgz	%l0,	%f2,	%f10
	stx	%g4,	[%l7 + 0x18]
	edge16l	%l1,	%o0,	%o5
	sdiv	%g3,	0x1030,	%g2
	movcs	%icc,	%i3,	%l4
	sdiv	%g5,	0x09B2,	%o2
	ldx	[%l7 + 0x38],	%i1
	ldx	[%l7 + 0x38],	%l3
	ldsh	[%l7 + 0x70],	%l5
	edge16n	%i4,	%i6,	%i7
	tle	%xcc,	0x5
	movg	%xcc,	%o6,	%o1
	edge8l	%o4,	%l2,	%g6
	fornot2s	%f3,	%f0,	%f15
	movrlz	%o3,	%o7,	%i0
	fmovscs	%icc,	%f18,	%f20
	fands	%f7,	%f16,	%f18
	fbug,a	%fcc1,	loop_2605
	stw	%i5,	[%l7 + 0x20]
	tne	%icc,	0x2
	nop
	setx	loop_2606,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2605:
	sethi	0x00A2,	%i2
	fbge	%fcc2,	loop_2607
	bneg,a	%xcc,	loop_2608
loop_2606:
	tge	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	sta	%f31,	[%l7 + 0x30] %asi
loop_2607:
	call	loop_2609
loop_2608:
	andn	%g1,	0x0825,	%l6
	taddcc	%g7,	0x0A4E,	%g4
	bvs,a,pn	%xcc,	loop_2610
loop_2609:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc1,	%f17,	%f19
	fmovdpos	%xcc,	%f22,	%f26
loop_2610:
	tsubcctv	%l1,	0x1943,	%o0
	fpadd16	%f20,	%f6,	%f4
	movcc	%icc,	%o5,	%g3
	call	loop_2611
	movgu	%xcc,	%l0,	%i3
	movrlz	%l4,	%g5,	%g2
	fmovrslz	%i1,	%f19,	%f11
loop_2611:
	movgu	%icc,	%o2,	%l5
	and	%l3,	0x1169,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f17,	%f6
	smulcc	%i7,	0x1CE7,	%i4
	edge32n	%o6,	%o1,	%o4
	edge8	%l2,	%g6,	%o7
	for	%f30,	%f0,	%f20
	bcc,a	loop_2612
	edge8ln	%i0,	%i5,	%o3
	fmul8x16al	%f18,	%f15,	%f26
	fxors	%f16,	%f18,	%f18
loop_2612:
	call	loop_2613
	sdiv	%g1,	0x09B6,	%i2
	edge16l	%l6,	%g7,	%g4
	udiv	%l1,	0x0E2F,	%o5
loop_2613:
	edge8l	%g3,	%o0,	%i3
	edge16ln	%l4,	%l0,	%g5
	fnands	%f1,	%f1,	%f8
	alignaddrl	%i1,	%o2,	%g2
	edge8n	%l3,	%i6,	%i7
	movvc	%xcc,	%l5,	%o6
	ldstub	[%l7 + 0x52],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f21,	%f7
	fbule,a	%fcc3,	loop_2614
	alignaddrl	%o4,	%o1,	%l2
	movgu	%xcc,	%o7,	%i0
	sll	%i5,	0x1C,	%o3
loop_2614:
	fmovsleu	%icc,	%f25,	%f0
	movleu	%icc,	%g1,	%g6
	fcmpgt16	%f24,	%f18,	%l6
	mova	%xcc,	%g7,	%i2
	xor	%g4,	%o5,	%g3
	tle	%xcc,	0x2
	tge	%icc,	0x0
	fcmpne16	%f30,	%f22,	%l1
	fpsub16s	%f24,	%f3,	%f9
	stx	%i3,	[%l7 + 0x68]
	fnegd	%f26,	%f0
	movl	%icc,	%o0,	%l4
	fmovsl	%xcc,	%f31,	%f20
	be,a	%icc,	loop_2615
	fnot1s	%f12,	%f0
	tsubcc	%g5,	0x16AD,	%l0
	fmovrde	%i1,	%f2,	%f4
loop_2615:
	fbule	%fcc2,	loop_2616
	edge16	%o2,	%l3,	%i6
	udiv	%i7,	0x08D1,	%l5
	movneg	%xcc,	%o6,	%g2
loop_2616:
	orcc	%i4,	%o1,	%l2
	edge32ln	%o7,	%o4,	%i0
	movpos	%xcc,	%i5,	%g1
	bcs,a,pn	%xcc,	loop_2617
	fmovdgu	%xcc,	%f1,	%f9
	bvs,pt	%icc,	loop_2618
	xnor	%g6,	0x196A,	%l6
loop_2617:
	fbge	%fcc3,	loop_2619
	edge16n	%o3,	%g7,	%i2
loop_2618:
	membar	0x27
	array32	%o5,	%g3,	%l1
loop_2619:
	fnors	%f4,	%f19,	%f3
	edge32l	%i3,	%g4,	%o0
	andn	%g5,	0x03AC,	%l0
	movcs	%icc,	%i1,	%o2
	sra	%l3,	%l4,	%i7
	fba,a	%fcc3,	loop_2620
	xorcc	%l5,	0x1BDB,	%i6
	xor	%o6,	%i4,	%o1
	tl	%xcc,	0x4
loop_2620:
	andncc	%l2,	%o7,	%o4
	andcc	%i0,	%i5,	%g1
	movrlez	%g2,	0x145,	%l6
	subcc	%o3,	%g7,	%g6
	movvc	%icc,	%i2,	%g3
	mova	%icc,	%l1,	%i3
	ldd	[%l7 + 0x08],	%f24
	sllx	%o5,	%g4,	%g5
	fcmpeq16	%f14,	%f14,	%l0
	tcs	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o0
	movrne	%o2,	0x3B2,	%l3
	sdivx	%i1,	0x0E22,	%l4
	tl	%xcc,	0x4
	movg	%xcc,	%i7,	%i6
	fmovdn	%xcc,	%f24,	%f18
	fmovsle	%xcc,	%f6,	%f30
	fmovdpos	%xcc,	%f20,	%f29
	movrgez	%l5,	%o6,	%o1
	bshuffle	%f24,	%f16,	%f6
	tge	%xcc,	0x1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%o7
	smulcc	%o4,	%l2,	%i5
	xorcc	%i0,	0x12FE,	%g1
	movneg	%xcc,	%g2,	%o3
	sll	%l6,	%g7,	%g6
	fmul8sux16	%f12,	%f24,	%f2
	bvs,pn	%xcc,	loop_2621
	movpos	%xcc,	%g3,	%i2
	umul	%i3,	0x1946,	%l1
	fbo	%fcc2,	loop_2622
loop_2621:
	andcc	%g4,	%o5,	%l0
	fcmple32	%f24,	%f4,	%g5
	tg	%xcc,	0x6
loop_2622:
	fmovda	%xcc,	%f24,	%f2
	xorcc	%o0,	0x0949,	%l3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5A] %asi,	%i1
	and	%l4,	0x1CA1,	%i7
	ldd	[%l7 + 0x20],	%f22
	fnands	%f16,	%f30,	%f9
	udivx	%o2,	0x0191,	%l5
	alignaddrl	%o6,	%i6,	%o1
	tvc	%icc,	0x0
	fbug	%fcc0,	loop_2623
	fmovdne	%xcc,	%f13,	%f30
	tcs	%icc,	0x2
	udivx	%o7,	0x08C1,	%i4
loop_2623:
	for	%f8,	%f4,	%f28
	movvs	%icc,	%l2,	%o4
	tvc	%icc,	0x5
	fbu	%fcc0,	loop_2624
	edge8	%i5,	%i0,	%g1
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o3
loop_2624:
	movrlez	%l6,	0x1D1,	%g2
	edge8	%g7,	%g6,	%i2
	bcs,pt	%icc,	loop_2625
	bneg,a	%icc,	loop_2626
	umulcc	%i3,	%g3,	%l1
	tvs	%icc,	0x6
loop_2625:
	sllx	%g4,	%l0,	%o5
loop_2626:
	fbuge	%fcc0,	loop_2627
	movre	%o0,	0x015,	%l3
	tn	%xcc,	0x3
	orcc	%g5,	0x1463,	%l4
loop_2627:
	taddcctv	%i1,	%i7,	%l5
	fmovsgu	%icc,	%f5,	%f18
	edge32	%o2,	%i6,	%o1
	bvs,a,pt	%xcc,	loop_2628
	bvs,a,pt	%icc,	loop_2629
	brgez,a	%o7,	loop_2630
	edge8	%o6,	%i4,	%o4
loop_2628:
	movcs	%xcc,	%l2,	%i0
loop_2629:
	ldsb	[%l7 + 0x18],	%g1
loop_2630:
	addc	%i5,	%o3,	%g2
	membar	0x39
	wr	%g0,	0xeb,	%asi
	stba	%g7,	[%l7 + 0x37] %asi
	membar	#Sync
	fmovrslz	%g6,	%f10,	%f3
	movrgez	%i2,	%i3,	%g3
	and	%l1,	%g4,	%l0
	movcs	%icc,	%o5,	%o0
	srl	%l6,	%l3,	%l4
	udivx	%i1,	0x1690,	%g5
	fmovdgu	%xcc,	%f28,	%f28
	set	0x22, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i7
	movcs	%icc,	%l5,	%i6
	fmovrslz	%o2,	%f16,	%f27
	flush	%l7 + 0x50
	fcmpne16	%f16,	%f20,	%o7
	move	%xcc,	%o1,	%i4
	fbn,a	%fcc1,	loop_2631
	orn	%o4,	0x1955,	%l2
	umulcc	%o6,	0x04E6,	%i0
	te	%icc,	0x3
loop_2631:
	fpmerge	%f17,	%f21,	%f4
	subcc	%g1,	0x1D4E,	%o3
	set	0x74, %g7
	lda	[%l7 + %g7] 0x88,	%f2
	movrlez	%g2,	%g7,	%g6
	bge,pn	%xcc,	loop_2632
	be,pn	%icc,	loop_2633
	xor	%i2,	%i3,	%g3
	orn	%l1,	%g4,	%l0
loop_2632:
	xnorcc	%i5,	0x185C,	%o0
loop_2633:
	ta	%icc,	0x0
	edge16n	%o5,	%l6,	%l3
	popc	0x03B4,	%i1
	mulx	%g5,	0x072F,	%i7
	membar	0x0D
	set	0x54, %g5
	ldswa	[%l7 + %g5] 0x18,	%l5
	srl	%i6,	0x02,	%o2
	array16	%o7,	%l4,	%o1
	array32	%o4,	%i4,	%o6
	movle	%icc,	%l2,	%i0
	bg,pn	%xcc,	loop_2634
	pdist	%f20,	%f0,	%f24
	bshuffle	%f4,	%f28,	%f4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x88
loop_2634:
	fmul8sux16	%f20,	%f14,	%f2
	fmovrdlez	%o3,	%f18,	%f0
	array8	%g1,	%g7,	%g2
	edge8n	%i2,	%g6,	%g3
	fnot1s	%f9,	%f22
	edge16l	%l1,	%i3,	%l0
	fmovrse	%i5,	%f15,	%f17
	tvs	%xcc,	0x6
	sub	%g4,	0x0F4E,	%o0
	and	%l6,	0x1B8B,	%o5
	popc	%l3,	%i1
	subccc	%i7,	%g5,	%i6
	edge8ln	%l5,	%o2,	%l4
	ldub	[%l7 + 0x1D],	%o7
	wr	%g0,	0xea,	%asi
	stda	%o4,	[%l7 + 0x10] %asi
	membar	#Sync
	movpos	%icc,	%o1,	%i4
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%l2
	brgez,a	%i0,	loop_2635
	sra	%o6,	0x08,	%o3
	sub	%g1,	%g7,	%i2
	umul	%g2,	%g6,	%l1
loop_2635:
	orncc	%i3,	0x0D18,	%l0
	sdiv	%i5,	0x1099,	%g3
	move	%icc,	%g4,	%l6
	ldd	[%l7 + 0x70],	%o0
	ldd	[%l7 + 0x28],	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o5,	%l3,	%i7
	alignaddrl	%i1,	%i6,	%g5
	tn	%xcc,	0x6
	fors	%f12,	%f30,	%f23
	alignaddr	%l5,	%l4,	%o2
	movrlez	%o7,	0x368,	%o1
	movge	%icc,	%o4,	%l2
	fabss	%f4,	%f24
	or	%i0,	0x046D,	%o6
	fmovsvc	%icc,	%f25,	%f27
	movle	%xcc,	%o3,	%g1
	movleu	%icc,	%i4,	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g2,	%i2
	orncc	%l1,	%i3,	%l0
	movrgez	%i5,	0x21F,	%g6
	tcs	%icc,	0x3
	brlz,a	%g3,	loop_2636
	fmovsgu	%icc,	%f24,	%f24
	sub	%g4,	%l6,	%o0
	sub	%o5,	0x1D87,	%i7
loop_2636:
	brlez	%l3,	loop_2637
	siam	0x3
	bpos,pn	%icc,	loop_2638
	movre	%i1,	0x343,	%g5
loop_2637:
	membar	0x7B
	udiv	%i6,	0x048E,	%l5
loop_2638:
	movrlez	%o2,	%l4,	%o1
	tvs	%icc,	0x1
	lduw	[%l7 + 0x68],	%o7
	edge8l	%o4,	%l2,	%i0
	swap	[%l7 + 0x7C],	%o6
	fsrc1	%f26,	%f8
	edge16l	%g1,	%o3,	%g7
	bge,a	%icc,	loop_2639
	fmovdvs	%xcc,	%f15,	%f26
	tcc	%xcc,	0x4
	xor	%g2,	0x0AA0,	%i2
loop_2639:
	fmovsge	%icc,	%f23,	%f5
	movrne	%i4,	0x1AA,	%i3
	edge32l	%l1,	%i5,	%l0
	tneg	%icc,	0x1
	edge8ln	%g6,	%g3,	%g4
	tvs	%icc,	0x6
	array8	%o0,	%l6,	%i7
	alignaddrl	%o5,	%l3,	%g5
	fbo,a	%fcc1,	loop_2640
	movne	%xcc,	%i1,	%l5
	stb	%o2,	[%l7 + 0x0F]
	xnorcc	%l4,	%o1,	%i6
loop_2640:
	sethi	0x1252,	%o4
	fmovsgu	%icc,	%f20,	%f7
	tcs	%icc,	0x1
	fmovrdlez	%o7,	%f6,	%f14
	sir	0x1E07
	movle	%icc,	%i0,	%o6
	subcc	%l2,	0x12CB,	%o3
	tgu	%xcc,	0x5
	taddcc	%g7,	0x177F,	%g1
	brgz,a	%i2,	loop_2641
	udiv	%g2,	0x12C7,	%i4
	movvc	%xcc,	%i3,	%l1
	fnands	%f19,	%f19,	%f9
loop_2641:
	edge8l	%l0,	%g6,	%i5
	movrne	%g4,	0x1B3,	%g3
	set	0x68, %l5
	ldsha	[%l7 + %l5] 0x11,	%l6
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrgz	%i7,	%o5,	%o0
	set	0x14, %i2
	lda	[%l7 + %i2] 0x0c,	%f24
	fmovrdne	%l3,	%f4,	%f20
	movrlez	%i1,	%l5,	%o2
	st	%f25,	[%l7 + 0x74]
	fpadd16	%f28,	%f22,	%f18
	sdivcc	%l4,	0x0578,	%g5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x36] %asi,	%o1
	set	0x5C, %o2
	stwa	%i6,	[%l7 + %o2] 0x23
	membar	#Sync
	tleu	%xcc,	0x3
	movrlz	%o4,	0x201,	%o7
	tl	%xcc,	0x4
	edge8n	%o6,	%l2,	%o3
	ldd	[%l7 + 0x18],	%g6
	popc	%g1,	%i0
	bshuffle	%f28,	%f8,	%f6
	fmovdl	%icc,	%f16,	%f14
	fcmped	%fcc0,	%f6,	%f10
	fandnot2	%f22,	%f16,	%f2
	flush	%l7 + 0x70
	tn	%icc,	0x4
	andn	%i2,	%g2,	%i3
	fmovrse	%l1,	%f4,	%f13
	srl	%l0,	0x02,	%g6
	movvs	%icc,	%i4,	%i5
	smul	%g3,	0x0F20,	%g4
	fcmpgt32	%f6,	%f0,	%l6
	sdivcc	%i7,	0x0BF1,	%o0
	movg	%xcc,	%l3,	%i1
	fmovd	%f16,	%f4
	movge	%icc,	%o5,	%o2
	movg	%icc,	%l5,	%l4
	fbule,a	%fcc2,	loop_2642
	fmovrdgez	%o1,	%f0,	%f10
	taddcctv	%i6,	%g5,	%o7
	set	0x58, %o1
	prefetcha	[%l7 + %o1] 0x80,	 0x1
loop_2642:
	udiv	%o6,	0x081D,	%l2
	array8	%g7,	%g1,	%i0
	fornot2	%f26,	%f10,	%f20
	nop
	setx	loop_2643,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_2644, %l0, %l1
	jmpl %l1, %i2
	edge32l	%o3,	%i3,	%g2
	tvs	%xcc,	0x4
loop_2643:
	sethi	0x0783,	%l1
loop_2644:
	sll	%l0,	0x08,	%g6
	prefetch	[%l7 + 0x74],	 0x3
	edge32ln	%i5,	%i4,	%g3
	smulcc	%l6,	%g4,	%i7
	tvs	%icc,	0x1
	bcc	loop_2645
	sra	%o0,	0x05,	%l3
	ldsw	[%l7 + 0x64],	%i1
	sra	%o2,	%o5,	%l5
loop_2645:
	movrlez	%l4,	%i6,	%o1
	add	%o7,	0x06FD,	%g5
	fmovde	%xcc,	%f5,	%f10
	fmovdvs	%icc,	%f2,	%f14
	fxnor	%f16,	%f4,	%f20
	xorcc	%o6,	%l2,	%g7
	fnot1	%f24,	%f8
	movgu	%icc,	%o4,	%g1
	edge32n	%i2,	%o3,	%i3
	movl	%icc,	%g2,	%l1
	tle	%icc,	0x1
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tne	%xcc,	0x0
	fpmerge	%f30,	%f21,	%f16
	brgez	%l0,	loop_2646
	fmovdpos	%icc,	%f30,	%f25
	movrlz	%i0,	%i5,	%g6
	smulcc	%i4,	0x0599,	%l6
loop_2646:
	bvc,a,pn	%icc,	loop_2647
	fmovspos	%xcc,	%f3,	%f25
	xorcc	%g3,	%g4,	%i7
	movrlz	%o0,	%l3,	%i1
loop_2647:
	fble	%fcc2,	loop_2648
	subc	%o5,	0x03AD,	%l5
	ldsh	[%l7 + 0x40],	%o2
	fbge,a	%fcc2,	loop_2649
loop_2648:
	sth	%l4,	[%l7 + 0x34]
	ba,a	loop_2650
	udivcc	%i6,	0x049C,	%o1
loop_2649:
	prefetch	[%l7 + 0x48],	 0x2
	orn	%o7,	0x1FAA,	%g5
loop_2650:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tleu	%icc,	0x0
	addc	%o6,	0x1D9E,	%g7
	fmul8x16al	%f2,	%f15,	%f12
	fpack16	%f10,	%f4
	or	%o4,	%l2,	%g1
	movle	%icc,	%i2,	%o3
	bpos	%xcc,	loop_2651
	fsrc1s	%f9,	%f13
	addc	%i3,	0x100F,	%l1
	tgu	%xcc,	0x6
loop_2651:
	fandnot2s	%f27,	%f2,	%f2
	umulcc	%l0,	0x1B62,	%g2
	edge8n	%i5,	%i0,	%g6
	movrlez	%i4,	0x3A6,	%g3
	movrlez	%g4,	%i7,	%l6
	nop
	setx	loop_2652,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmple16	%f16,	%f14,	%l3
	movleu	%icc,	%i1,	%o0
	fnand	%f4,	%f14,	%f26
loop_2652:
	fmovsneg	%xcc,	%f28,	%f1
	array16	%o5,	%l5,	%l4
	mulscc	%o2,	%o1,	%i6
	fcmpgt16	%f10,	%f26,	%g5
	andn	%o6,	0x1118,	%o7
	te	%xcc,	0x1
	movl	%icc,	%g7,	%o4
	fmovspos	%xcc,	%f22,	%f16
	fxnors	%f2,	%f24,	%f8
	nop
	setx	loop_2653,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8ulx16	%f8,	%f22,	%f6
	movpos	%icc,	%l2,	%i2
	te	%icc,	0x6
loop_2653:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x40] %asi,	%f1
	udivx	%o3,	0x106F,	%i3
	fcmped	%fcc1,	%f26,	%f2
	movvc	%xcc,	%g1,	%l0
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	bcc,a	%icc,	loop_2654
	fnot1	%f24,	%f4
	addccc	%l1,	%g2,	%i0
	sethi	0x1145,	%i5
loop_2654:
	ld	[%l7 + 0x7C],	%f24
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x30] %asi,	%f14
	movgu	%icc,	%i4,	%g3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g6
	movrgez	%g4,	%i7,	%l6
	fsrc2s	%f22,	%f10
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i1,	%l3
	stw	%o5,	[%l7 + 0x40]
	fmovde	%xcc,	%f25,	%f0
	fmovsvc	%icc,	%f12,	%f20
	tleu	%xcc,	0x1
	sethi	0x0C1A,	%l5
	brz	%o0,	loop_2655
	ldx	[%l7 + 0x10],	%o2
	fnegs	%f12,	%f11
	movg	%icc,	%l4,	%i6
loop_2655:
	ta	%icc,	0x5
	sdiv	%g5,	0x1E12,	%o6
	addcc	%o1,	0x1396,	%o7
	movrgez	%g7,	0x003,	%o4
	brlz,a	%l2,	loop_2656
	movne	%icc,	%o3,	%i3
	movcs	%xcc,	%i2,	%g1
	movre	%l0,	0x121,	%l1
loop_2656:
	alignaddr	%i0,	%i5,	%i4
	umul	%g3,	0x0C08,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g6,	%g4,	%i7
	tvs	%icc,	0x3
	sth	%l6,	[%l7 + 0x5A]
	fmovrsgz	%i1,	%f25,	%f20
	brgz	%l3,	loop_2657
	umulcc	%l5,	%o0,	%o5
	tsubcc	%o2,	%l4,	%g5
	set	0x38, %o7
	lduha	[%l7 + %o7] 0x89,	%o6
loop_2657:
	fpack32	%f10,	%f18,	%f22
	fmovdleu	%xcc,	%f26,	%f2
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x15,	%i6
	tle	%icc,	0x0
	udiv	%o1,	0x0C6D,	%g7
	membar	0x4B
	add	%o7,	%l2,	%o3
	fbge,a	%fcc0,	loop_2658
	fbuge,a	%fcc2,	loop_2659
	fbul,a	%fcc1,	loop_2660
	subc	%o4,	0x17EF,	%i3
loop_2658:
	fpack32	%f6,	%f2,	%f14
loop_2659:
	movge	%xcc,	%i2,	%g1
loop_2660:
	nop
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x0c
	st	%f6,	[%l7 + 0x1C]
	srlx	%l0,	%i0,	%i5
	fmovsleu	%xcc,	%f1,	%f22
	ldd	[%l7 + 0x10],	%f26
	fnor	%f24,	%f10,	%f14
	ldsw	[%l7 + 0x64],	%i4
	set	0x29, %g1
	stba	%l1,	[%l7 + %g1] 0x11
	movgu	%xcc,	%g2,	%g3
	ldsw	[%l7 + 0x38],	%g4
	sllx	%i7,	0x07,	%g6
	movg	%xcc,	%l6,	%l3
	sdivx	%l5,	0x069B,	%o0
	fnegs	%f27,	%f23
	and	%o5,	%o2,	%i1
	fmovrslez	%g5,	%f13,	%f7
	tpos	%icc,	0x2
	movg	%icc,	%l4,	%o6
	fbul,a	%fcc2,	loop_2661
	fnands	%f13,	%f4,	%f25
	siam	0x7
	fcmpne16	%f18,	%f16,	%o1
loop_2661:
	flush	%l7 + 0x40
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%g7
	te	%xcc,	0x0
	bvs	loop_2662
	bge,a,pn	%xcc,	loop_2663
	nop
	setx loop_2664, %l0, %l1
	jmpl %l1, %o7
	fmovd	%f24,	%f16
loop_2662:
	srl	%i6,	%o3,	%l2
loop_2663:
	fcmple32	%f16,	%f28,	%o4
loop_2664:
	fcmpes	%fcc1,	%f5,	%f14
	srax	%i3,	%i2,	%l0
	fblg,a	%fcc2,	loop_2665
	orncc	%g1,	%i5,	%i4
	fpadd32	%f16,	%f18,	%f20
	addc	%l1,	%g2,	%g3
loop_2665:
	smul	%i0,	0x14CE,	%i7
	subccc	%g6,	%g4,	%l6
	movne	%xcc,	%l5,	%l3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%o2
	array16	%o0,	%i1,	%g5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%o1
	sdivcc	%g7,	0x0905,	%o7
	fpsub16s	%f19,	%f15,	%f15
	andcc	%i6,	%o3,	%l2
	fnot2	%f30,	%f0
	udivcc	%o4,	0x1734,	%i3
	tsubcc	%l4,	0x0808,	%l0
	move	%xcc,	%g1,	%i5
	nop
	setx	loop_2666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%i2,	0x0048,	%l1
	ta	%icc,	0x2
	addccc	%i4,	0x08B1,	%g2
loop_2666:
	nop
	set	0x40, %l4
	swapa	[%l7 + %l4] 0x19,	%i0
	fcmpne16	%f12,	%f22,	%i7
	ldsw	[%l7 + 0x5C],	%g3
	bvs,pn	%icc,	loop_2667
	orncc	%g4,	0x1979,	%g6
	fbug	%fcc3,	loop_2668
	nop
	set	0x18, %g3
	std	%f26,	[%l7 + %g3]
loop_2667:
	udivcc	%l6,	0x09E6,	%l3
	fmovdneg	%icc,	%f13,	%f23
loop_2668:
	membar	0x3F
	fabss	%f24,	%f29
	movrgez	%o5,	0x3B9,	%o2
	tneg	%icc,	0x4
	tge	%icc,	0x1
	tl	%xcc,	0x3
	fbl,a	%fcc3,	loop_2669
	movre	%l5,	%i1,	%g5
	sub	%o0,	%o6,	%o1
	movpos	%icc,	%o7,	%i6
loop_2669:
	fmovdcs	%xcc,	%f14,	%f28
	fmovdne	%xcc,	%f22,	%f18
	std	%o2,	[%l7 + 0x28]
	fbne	%fcc0,	loop_2670
	movvc	%icc,	%l2,	%g7
	fmovrdgz	%i3,	%f30,	%f12
	tl	%xcc,	0x2
loop_2670:
	movneg	%icc,	%l4,	%o4
	umul	%l0,	0x1C6B,	%i5
	ldstub	[%l7 + 0x4A],	%i2
	andncc	%l1,	%g1,	%g2
	fones	%f28
	fpadd32	%f24,	%f2,	%f22
	sdiv	%i4,	0x14A8,	%i0
	taddcc	%g3,	0x1593,	%g4
	alignaddr	%g6,	%i7,	%l3
	movrgz	%o5,	%o2,	%l5
	tl	%xcc,	0x1
	movle	%xcc,	%l6,	%g5
	fmovdne	%icc,	%f22,	%f25
	fbuge,a	%fcc0,	loop_2671
	sll	%i1,	%o6,	%o0
	addccc	%o7,	0x084B,	%o1
	ba,a	%xcc,	loop_2672
loop_2671:
	fnot1s	%f18,	%f0
	andncc	%i6,	%l2,	%o3
	edge16ln	%i3,	%l4,	%g7
loop_2672:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	fand	%f16,	%f24,	%f24
	edge8l	%i5,	%i2,	%o4
	tge	%icc,	0x3
	mulx	%l1,	0x045A,	%g1
	tcs	%icc,	0x0
	movrgez	%g2,	0x1E3,	%i4
	std	%f16,	[%l7 + 0x48]
	fxors	%f3,	%f11,	%f20
	add	%g3,	0x05CD,	%i0
	subcc	%g4,	0x075D,	%i7
	set	0x6C, %i3
	swapa	[%l7 + %i3] 0x18,	%l3
	move	%xcc,	%g6,	%o2
	edge16ln	%l5,	%o5,	%l6
	umul	%i1,	%g5,	%o6
	fpsub32s	%f27,	%f19,	%f22
	ba,pt	%xcc,	loop_2673
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f21,	%f2
	movrne	%o7,	%o0,	%i6
loop_2673:
	movneg	%xcc,	%o1,	%l2
	fble,a	%fcc0,	loop_2674
	ldd	[%l7 + 0x28],	%f22
	fmovsge	%icc,	%f7,	%f8
	nop
	set	0x50, %g6
	ldsb	[%l7 + %g6],	%o3
loop_2674:
	bn	%icc,	loop_2675
	edge8l	%i3,	%g7,	%l4
	xorcc	%l0,	%i2,	%i5
	movge	%icc,	%l1,	%o4
loop_2675:
	std	%f26,	[%l7 + 0x08]
	movcs	%icc,	%g2,	%i4
	fmovrdgez	%g1,	%f0,	%f18
	srax	%g3,	%i0,	%g4
	fpsub16	%f26,	%f18,	%f26
	movvs	%xcc,	%i7,	%l3
	fba	%fcc3,	loop_2676
	udivcc	%o2,	0x1DEA,	%g6
	sdiv	%o5,	0x0B17,	%l5
	xor	%i1,	%l6,	%o6
loop_2676:
	umulcc	%g5,	%o0,	%o7
	fmovrdgz	%o1,	%f18,	%f24
	umul	%i6,	0x092C,	%o3
	edge8ln	%l2,	%i3,	%g7
	mulscc	%l0,	0x1EB8,	%l4
	fmovsneg	%icc,	%f23,	%f9
	sdivcc	%i5,	0x1A8C,	%i2
	movneg	%icc,	%l1,	%o4
	movg	%icc,	%i4,	%g1
	nop
	setx	loop_2677,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%g2,	[%l7 + 0x61]
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f31
loop_2677:
	srax	%g3,	0x05,	%i0
	fmovsn	%xcc,	%f23,	%f10
	movrgez	%g4,	%i7,	%o2
	fblg,a	%fcc3,	loop_2678
	tg	%xcc,	0x2
	fmovdle	%icc,	%f18,	%f8
	edge32ln	%l3,	%g6,	%o5
loop_2678:
	add	%i1,	%l5,	%l6
	srax	%o6,	0x09,	%o0
	tle	%xcc,	0x3
	std	%f14,	[%l7 + 0x48]
	nop
	setx	loop_2679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x5
	fmuld8ulx16	%f6,	%f25,	%f14
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2679:
	mova	%xcc,	%o7,	%g5
	fmuld8ulx16	%f10,	%f22,	%f18
	umul	%o1,	%i6,	%o3
	tsubcc	%i3,	0x07A1,	%l2
	addccc	%l0,	0x10AF,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g7,	%i2,	%l1
	movcs	%icc,	%i5,	%o4
	srl	%i4,	%g1,	%g3
	fmovdneg	%xcc,	%f17,	%f23
	movrne	%g2,	0x209,	%i0
	addc	%g4,	%o2,	%l3
	umulcc	%i7,	0x0087,	%o5
	movgu	%xcc,	%g6,	%l5
	set	0x18, %l0
	ldsba	[%l7 + %l0] 0x11,	%i1
	fmovsl	%xcc,	%f27,	%f10
	mulscc	%o6,	%o0,	%o7
	edge8n	%g5,	%l6,	%o1
	array8	%o3,	%i3,	%i6
	movvc	%icc,	%l2,	%l0
	movrne	%g7,	0x134,	%i2
	tsubcc	%l1,	0x0752,	%i5
	st	%f29,	[%l7 + 0x08]
	alignaddr	%o4,	%l4,	%g1
	nop
	setx	loop_2680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbne,a	%fcc1,	loop_2681
	edge32	%g3,	%g2,	%i0
	mulx	%i4,	%o2,	%g4
loop_2680:
	movleu	%xcc,	%l3,	%o5
loop_2681:
	fbu,a	%fcc0,	loop_2682
	addc	%i7,	%g6,	%l5
	tcc	%xcc,	0x3
	sdiv	%o6,	0x195D,	%o0
loop_2682:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	%i1,	%g5
	xnor	%l6,	0x054A,	%o1
	subcc	%o3,	%i3,	%i6
	movrlez	%l0,	%g7,	%i2
	addc	%l1,	%i5,	%l2
	bvc	%xcc,	loop_2683
	movn	%icc,	%l4,	%o4
	fmovrdgz	%g1,	%f6,	%f8
	umulcc	%g2,	%g3,	%i0
loop_2683:
	movvs	%xcc,	%o2,	%g4
	mulscc	%i4,	0x093D,	%l3
	swap	[%l7 + 0x38],	%i7
	lduw	[%l7 + 0x34],	%g6
	fcmple16	%f8,	%f24,	%o5
	udivx	%o6,	0x1870,	%l5
	fmovscc	%icc,	%f26,	%f27
	fsrc1	%f0,	%f16
	mova	%xcc,	%o0,	%o7
	set	0x160, %o0
	nop 	! 	stxa	%g5,	[%g0 + %o0] 0x40 ripped by fixASI40.pl
	tvs	%icc,	0x7
	fcmps	%fcc3,	%f11,	%f7
	movrne	%l6,	%i1,	%o1
	set	0x70, %i1
	stha	%o3,	[%l7 + %i1] 0x80
	movle	%icc,	%i6,	%i3
	fornot1s	%f10,	%f13,	%f9
	brnz	%l0,	loop_2684
	udivcc	%g7,	0x0894,	%l1
	smulcc	%i2,	%l2,	%l4
	tcs	%icc,	0x6
loop_2684:
	fornot2s	%f19,	%f15,	%f19
	siam	0x7
	fmovdl	%icc,	%f11,	%f7
	fmovspos	%icc,	%f27,	%f11
	xor	%i5,	0x066D,	%o4
	andn	%g1,	0x01E2,	%g3
	mulscc	%g2,	0x0270,	%i0
	fpsub32	%f22,	%f20,	%f14
	fmul8x16au	%f23,	%f29,	%f8
	movleu	%icc,	%g4,	%o2
	tsubcc	%i4,	0x144A,	%i7
	fpsub16	%f14,	%f22,	%f24
	subc	%g6,	0x0E52,	%o5
	edge32l	%o6,	%l5,	%o0
	fbne	%fcc3,	loop_2685
	fmovrslez	%l3,	%f12,	%f9
	tsubcctv	%g5,	%l6,	%o7
	umulcc	%i1,	%o1,	%i6
loop_2685:
	sethi	0x1328,	%i3
	tle	%icc,	0x6
	srl	%l0,	%g7,	%l1
	smul	%i2,	0x0270,	%l2
	udivx	%l4,	0x0932,	%o3
	sub	%o4,	%i5,	%g1
	fmovspos	%xcc,	%f9,	%f26
	tl	%xcc,	0x5
	edge8ln	%g3,	%i0,	%g4
	mulx	%g2,	%i4,	%o2
	flush	%l7 + 0x14
	edge32l	%g6,	%o5,	%o6
	fmovdge	%icc,	%f31,	%f14
	fmul8x16al	%f16,	%f5,	%f2
	movrne	%l5,	%i7,	%l3
	xorcc	%g5,	0x102B,	%l6
	movneg	%xcc,	%o7,	%o0
	fmul8ulx16	%f6,	%f16,	%f22
	tn	%xcc,	0x4
	fpadd32s	%f6,	%f2,	%f20
	bge	loop_2686
	fbule	%fcc2,	loop_2687
	sllx	%o1,	0x01,	%i1
	tneg	%icc,	0x3
loop_2686:
	movcs	%icc,	%i6,	%i3
loop_2687:
	movcc	%icc,	%l0,	%l1
	wr	%g0,	0x52,	%asi
	stxa	%g7,	[%g0 + 0x120] %asi
	fmovsgu	%xcc,	%f27,	%f17
	mova	%xcc,	%i2,	%l2
	movrlez	%o3,	0x209,	%l4
	xor	%i5,	%o4,	%g3
	movgu	%xcc,	%g1,	%g4
	fmovsleu	%xcc,	%f23,	%f24
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i0,	%i4
	movn	%icc,	%g2,	%o2
	umulcc	%g6,	0x186B,	%o5
	fmovdge	%icc,	%f9,	%f12
	orcc	%o6,	0x1D7D,	%i7
	smulcc	%l3,	0x09B5,	%g5
	srlx	%l5,	0x17,	%l6
	movne	%icc,	%o7,	%o1
	te	%xcc,	0x6
	fsrc2s	%f0,	%f19
	add	%o0,	%i6,	%i1
	popc	0x10FB,	%l0
	movre	%i3,	0x3BF,	%l1
	fmovrdgez	%i2,	%f0,	%f4
	membar	0x0D
	addc	%l2,	0x1E99,	%o3
	mulscc	%g7,	0x1A80,	%i5
	xnorcc	%o4,	%g3,	%l4
	movrlz	%g1,	0x0DE,	%g4
	movgu	%xcc,	%i4,	%i0
	sdivx	%o2,	0x024F,	%g2
	sllx	%g6,	0x02,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i7,	0x04,	%l3
	fbg,a	%fcc0,	loop_2688
	xor	%g5,	%o5,	%l6
	addcc	%l5,	0x0AB6,	%o7
	edge8n	%o1,	%o0,	%i1
loop_2688:
	fsrc2s	%f7,	%f14
	movl	%icc,	%i6,	%l0
	movg	%xcc,	%l1,	%i2
	fbge,a	%fcc0,	loop_2689
	tn	%icc,	0x4
	set	0x14, %l2
	ldsha	[%l7 + %l2] 0x04,	%i3
loop_2689:
	movn	%icc,	%l2,	%o3
	smulcc	%i5,	%o4,	%g7
	fnegs	%f7,	%f7
	tsubcc	%g3,	%l4,	%g4
	te	%xcc,	0x5
	fmovdg	%icc,	%f1,	%f13
	andncc	%g1,	%i4,	%i0
	membar	0x44
	fnand	%f2,	%f20,	%f28
	fpsub16	%f16,	%f14,	%f2
	edge16	%o2,	%g6,	%o6
	movrgz	%i7,	%l3,	%g2
	orn	%g5,	%l6,	%o5
	movpos	%xcc,	%l5,	%o7
	fmul8sux16	%f24,	%f26,	%f28
	andncc	%o1,	%o0,	%i6
	movgu	%icc,	%l0,	%i1
	fbug	%fcc0,	loop_2690
	bneg	loop_2691
	tneg	%xcc,	0x1
	fpmerge	%f11,	%f1,	%f8
loop_2690:
	tcc	%icc,	0x5
loop_2691:
	fmovrdlz	%i2,	%f24,	%f14
	swap	[%l7 + 0x30],	%i3
	orncc	%l1,	%l2,	%i5
	movvs	%xcc,	%o4,	%g7
	addc	%g3,	0x1E9F,	%o3
	xorcc	%g4,	0x00A7,	%g1
	tge	%xcc,	0x6
	fmul8x16al	%f28,	%f17,	%f28
	fbule,a	%fcc0,	loop_2692
	std	%i4,	[%l7 + 0x48]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i0,	%l4,	%o2
loop_2692:
	fbo,a	%fcc0,	loop_2693
	fbn,a	%fcc3,	loop_2694
	tg	%xcc,	0x7
	bne,pt	%icc,	loop_2695
loop_2693:
	fmovdvs	%xcc,	%f20,	%f26
loop_2694:
	smulcc	%o6,	0x1002,	%i7
	tge	%xcc,	0x5
loop_2695:
	tle	%icc,	0x5
	and	%g6,	0x06C8,	%l3
	fble,a	%fcc2,	loop_2696
	bneg,a,pt	%xcc,	loop_2697
	ldstub	[%l7 + 0x0F],	%g2
	fpadd16	%f10,	%f6,	%f28
loop_2696:
	movleu	%icc,	%l6,	%g5
loop_2697:
	edge8	%l5,	%o7,	%o5
	add	%o1,	0x107A,	%i6
	movne	%icc,	%o0,	%i1
	tge	%xcc,	0x5
	alignaddr	%i2,	%l0,	%l1
	mulscc	%l2,	0x1143,	%i3
	edge16	%o4,	%i5,	%g7
	addc	%g3,	0x0584,	%o3
	edge32	%g1,	%g4,	%i0
	faligndata	%f22,	%f12,	%f26
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%i4
	fsrc1s	%f23,	%f30
	edge8	%o6,	%i7,	%o2
	siam	0x3
	sll	%g6,	%l3,	%g2
	fnor	%f24,	%f16,	%f14
	fmovdvc	%icc,	%f16,	%f13
	std	%f20,	[%l7 + 0x20]
	fbuge,a	%fcc1,	loop_2698
	fpsub32s	%f11,	%f17,	%f0
	edge8	%l6,	%g5,	%o7
	movpos	%icc,	%l5,	%o1
loop_2698:
	bleu,pt	%xcc,	loop_2699
	udivcc	%o5,	0x1F52,	%i6
	fmovrsne	%o0,	%f25,	%f8
	alignaddr	%i2,	%l0,	%l1
loop_2699:
	array8	%i1,	%i3,	%o4
	xnorcc	%i5,	0x10BF,	%l2
	fmovsneg	%icc,	%f6,	%f0
	tcs	%icc,	0x6
	sdivcc	%g3,	0x19AE,	%o3
	fcmple16	%f6,	%f26,	%g7
	udivx	%g4,	0x01A0,	%g1
	sra	%i0,	%l4,	%i4
	fbge,a	%fcc3,	loop_2700
	sra	%i7,	0x16,	%o2
	fmovsl	%xcc,	%f2,	%f25
	fzero	%f26
loop_2700:
	udivx	%o6,	0x07EF,	%g6
	tpos	%icc,	0x1
	fmovrdgez	%g2,	%f22,	%f24
	fmovrdne	%l3,	%f8,	%f4
	tvc	%xcc,	0x5
	edge8ln	%l6,	%o7,	%l5
	edge32	%g5,	%o5,	%i6
	edge16	%o1,	%i2,	%l0
	and	%o0,	%i1,	%l1
	nop
	set	0x76, %g2
	sth	%i3,	[%l7 + %g2]
	fmul8x16au	%f14,	%f25,	%f16
	fmovscc	%icc,	%f2,	%f18
	udivx	%o4,	0x1E8E,	%l2
	fmovsvs	%icc,	%f28,	%f27
	ldd	[%l7 + 0x18],	%i4
	fone	%f12
	popc	%o3,	%g7
	addccc	%g4,	0x1A5B,	%g1
	sllx	%i0,	%l4,	%g3
	sra	%i4,	0x0C,	%i7
	udivcc	%o2,	0x064B,	%g6
	movcs	%xcc,	%o6,	%g2
	udivx	%l6,	0x1C13,	%l3
	fcmple32	%f8,	%f8,	%l5
	bcs	%icc,	loop_2701
	bpos	%xcc,	loop_2702
	tg	%xcc,	0x1
	srlx	%o7,	%o5,	%i6
loop_2701:
	fmovrse	%g5,	%f15,	%f11
loop_2702:
	tne	%icc,	0x3
	edge16l	%o1,	%l0,	%i2
	taddcc	%i1,	0x03CD,	%o0
	set	0x58, %l3
	lduwa	[%l7 + %l3] 0x89,	%l1
	swap	[%l7 + 0x4C],	%i3
	movrlz	%l2,	%o4,	%o3
	orncc	%g7,	0x131B,	%g4
	addc	%g1,	%i5,	%l4
	move	%xcc,	%i0,	%i4
	fornot1	%f6,	%f24,	%f6
	addcc	%i7,	0x088C,	%o2
	orn	%g3,	0x1054,	%g6
	edge32	%g2,	%l6,	%l3
	smulcc	%o6,	%l5,	%o5
	fand	%f4,	%f30,	%f28
	fmul8x16al	%f21,	%f24,	%f14
	fbuge	%fcc3,	loop_2703
	fabss	%f9,	%f8
	fbue,a	%fcc1,	loop_2704
	andncc	%o7,	%i6,	%o1
loop_2703:
	mulscc	%l0,	0x02D6,	%g5
	taddcctv	%i2,	%i1,	%o0
loop_2704:
	lduh	[%l7 + 0x58],	%i3
	subcc	%l2,	%o4,	%o3
	popc	0x1491,	%g7
	st	%f1,	[%l7 + 0x50]
	movrgz	%g4,	0x338,	%l1
	fbug	%fcc3,	loop_2705
	faligndata	%f10,	%f4,	%f30
	call	loop_2706
	brlz,a	%i5,	loop_2707
loop_2705:
	sdiv	%l4,	0x008B,	%i0
	addccc	%g1,	%i4,	%o2
loop_2706:
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%g3
loop_2707:
	sll	%g6,	0x0D,	%g2
	brz,a	%i7,	loop_2708
	edge8	%l6,	%l3,	%l5
	ldstub	[%l7 + 0x17],	%o6
	edge16n	%o5,	%o7,	%i6
loop_2708:
	edge16l	%l0,	%o1,	%g5
	flush	%l7 + 0x40
	orcc	%i2,	%o0,	%i3
	edge32ln	%l2,	%i1,	%o4
	udivx	%o3,	0x08B4,	%g4
	tsubcc	%l1,	0x02C2,	%g7
	fcmpgt32	%f10,	%f2,	%l4
	movne	%xcc,	%i0,	%i5
	flush	%l7 + 0x24
	fmul8x16au	%f12,	%f29,	%f12
	te	%xcc,	0x2
	fbge	%fcc1,	loop_2709
	tl	%icc,	0x0
	srax	%g1,	%o2,	%g3
	movgu	%xcc,	%g6,	%i4
loop_2709:
	fxors	%f21,	%f15,	%f17
	fcmpgt32	%f22,	%f12,	%g2
	fbuge,a	%fcc3,	loop_2710
	ba,pt	%xcc,	loop_2711
	movrgz	%i7,	%l6,	%l3
	srl	%o6,	0x02,	%o5
loop_2710:
	udivx	%o7,	0x134F,	%l5
loop_2711:
	sdiv	%i6,	0x197C,	%l0
	fsrc2s	%f19,	%f9
	addcc	%g5,	0x0739,	%o1
	brnz,a	%o0,	loop_2712
	te	%icc,	0x4
	smulcc	%i3,	%l2,	%i1
	tne	%icc,	0x4
loop_2712:
	fmovsl	%xcc,	%f5,	%f16
	sra	%i2,	0x14,	%o3
	fpsub32	%f12,	%f20,	%f14
	move	%icc,	%g4,	%o4
	edge32l	%g7,	%l1,	%i0
	subc	%i5,	%l4,	%o2
	movvs	%icc,	%g1,	%g3
	smulcc	%g6,	%i4,	%g2
	ldsh	[%l7 + 0x3A],	%i7
	edge8n	%l6,	%o6,	%l3
	tvs	%icc,	0x4
	xnorcc	%o7,	%l5,	%o5
	fmovsleu	%icc,	%f8,	%f3
	subcc	%l0,	%g5,	%i6
	edge32l	%o1,	%o0,	%i3
	fzeros	%f12
	tpos	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i1,	0x0BBB,	%l2
	movrlez	%i2,	0x1B4,	%g4
	edge16n	%o4,	%g7,	%l1
	xorcc	%i0,	%o3,	%l4
	subccc	%o2,	0x1FE1,	%g1
	umulcc	%g3,	%i5,	%g6
	ldd	[%l7 + 0x40],	%g2
	tsubcc	%i7,	%i4,	%l6
	addccc	%o6,	0x1D69,	%o7
	tg	%icc,	0x4
	fmovsn	%icc,	%f7,	%f15
	fpack16	%f6,	%f2
	fmovsle	%xcc,	%f5,	%f10
	bshuffle	%f4,	%f2,	%f20
	movn	%xcc,	%l5,	%l3
	fcmped	%fcc0,	%f8,	%f10
	tpos	%xcc,	0x1
	tpos	%icc,	0x7
	alignaddrl	%o5,	%g5,	%l0
	movcs	%xcc,	%i6,	%o1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
	fbo,a	%fcc0,	loop_2713
	edge16n	%i1,	%o0,	%i2
	bcc	%xcc,	loop_2714
	subcc	%g4,	%o4,	%l2
loop_2713:
	bl,pt	%xcc,	loop_2715
	srlx	%g7,	%i0,	%o3
loop_2714:
	and	%l4,	0x1C52,	%o2
	fnegs	%f25,	%f10
loop_2715:
	fnot2	%f14,	%f14
	andcc	%g1,	%g3,	%i5
	fornot1s	%f29,	%f22,	%f8
	andcc	%l1,	%g2,	%i7
	movrgz	%g6,	%i4,	%l6
	movrlz	%o7,	%l5,	%o6
	and	%l3,	0x00DD,	%g5
	tvs	%xcc,	0x6
	fabss	%f11,	%f27
	fmovse	%xcc,	%f2,	%f31
	fnot2	%f18,	%f12
	tn	%xcc,	0x7
	fsrc1	%f0,	%f10
	sir	0x00CD
	smulcc	%l0,	0x1FA1,	%i6
	orcc	%o1,	%i3,	%i1
	brz	%o0,	loop_2716
	tsubcctv	%o5,	%i2,	%o4
	tn	%icc,	0x4
	fandnot2s	%f22,	%f6,	%f24
loop_2716:
	taddcc	%g4,	%g7,	%i0
	set	0x34, %i5
	sta	%f15,	[%l7 + %i5] 0x11
	membar	0x4A
	movleu	%icc,	%l2,	%l4
	alignaddrl	%o3,	%o2,	%g3
	fbu,a	%fcc0,	loop_2717
	bne	%xcc,	loop_2718
	nop
	set	0x40, %i7
	stw	%g1,	[%l7 + %i7]
	tleu	%icc,	0x0
loop_2717:
	fpadd32s	%f0,	%f21,	%f28
loop_2718:
	ldsw	[%l7 + 0x68],	%i5
	prefetch	[%l7 + 0x20],	 0x3
	fcmps	%fcc0,	%f27,	%f14
	bcs,a,pn	%icc,	loop_2719
	subcc	%l1,	%i7,	%g6
	umul	%g2,	%i4,	%l6
	prefetch	[%l7 + 0x74],	 0x1
loop_2719:
	tgu	%icc,	0x7
	udivx	%l5,	0x0900,	%o6
	edge16n	%o7,	%g5,	%l0
	fpsub16s	%f21,	%f9,	%f10
	sdiv	%l3,	0x19AD,	%i6
	movcs	%xcc,	%i3,	%i1
	edge16	%o1,	%o5,	%o0
	fandnot1	%f24,	%f24,	%f26
	set	0x36, %g4
	stha	%o4,	[%l7 + %g4] 0x18
	fbule,a	%fcc2,	loop_2720
	bvc,a,pt	%xcc,	loop_2721
	alignaddrl	%i2,	%g7,	%i0
	popc	%g4,	%l4
loop_2720:
	bn,a,pn	%icc,	loop_2722
loop_2721:
	movrgez	%o3,	0x191,	%o2
	ldstub	[%l7 + 0x5D],	%l2
	movvs	%icc,	%g1,	%g3
loop_2722:
	edge8ln	%l1,	%i5,	%g6
	fcmpd	%fcc0,	%f28,	%f22
	bn,pt	%xcc,	loop_2723
	fmovrdlz	%i7,	%f12,	%f4
	tn	%xcc,	0x1
	fbe	%fcc2,	loop_2724
loop_2723:
	mulscc	%i4,	0x0A24,	%g2
	fmovrdlez	%l6,	%f6,	%f22
	movcc	%xcc,	%l5,	%o6
loop_2724:
	movrgez	%o7,	%l0,	%l3
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%i6
	fmovdcs	%xcc,	%f15,	%f10
	fbu	%fcc1,	loop_2725
	movleu	%icc,	%i3,	%g5
	bg,a,pt	%icc,	loop_2726
	bpos	%xcc,	loop_2727
loop_2725:
	addcc	%o1,	0x0EAB,	%o5
	st	%f25,	[%l7 + 0x54]
loop_2726:
	smulcc	%i1,	0x0649,	%o4
loop_2727:
	umulcc	%i2,	0x1A8D,	%o0
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovsl	%icc,	%f1,	%f23
	set	0x10, %o3
	stda	%g6,	[%l7 + %o3] 0x2a
	membar	#Sync
	edge8	%g4,	%i0,	%l4
	tpos	%xcc,	0x1
	tpos	%xcc,	0x5
	move	%icc,	%o2,	%l2
	move	%xcc,	%o3,	%g1
	fmovsa	%xcc,	%f8,	%f12
	movne	%icc,	%g3,	%l1
	bvs	%xcc,	loop_2728
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x5
	edge8ln	%g6,	%i5,	%i4
loop_2728:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x18] %asi,	%i7
	mova	%icc,	%l6,	%l5
	ldub	[%l7 + 0x20],	%o6
	bne,a	loop_2729
	fmovs	%f30,	%f17
	bl,a	loop_2730
	edge16n	%g2,	%l0,	%l3
loop_2729:
	array16	%i6,	%o7,	%g5
	movneg	%icc,	%o1,	%i3
loop_2730:
	movg	%xcc,	%i1,	%o5
	bl,pn	%xcc,	loop_2731
	mulx	%i2,	0x1EFE,	%o4
	srl	%o0,	0x16,	%g7
	edge8ln	%i0,	%l4,	%o2
loop_2731:
	xor	%g4,	0x1597,	%o3
	sdivcc	%g1,	0x1A30,	%g3
	move	%xcc,	%l1,	%g6
	tneg	%icc,	0x3
	srax	%l2,	%i4,	%i7
	array32	%l6,	%l5,	%i5
	and	%o6,	%g2,	%l3
	taddcctv	%i6,	%l0,	%g5
	movcs	%xcc,	%o7,	%i3
	fandnot1s	%f25,	%f29,	%f10
	bpos	%xcc,	loop_2732
	fmovrsne	%i1,	%f12,	%f4
	membar	0x5A
	tpos	%icc,	0x0
loop_2732:
	bcc	loop_2733
	movvs	%xcc,	%o5,	%o1
	fbge	%fcc1,	loop_2734
	fone	%f18
loop_2733:
	addccc	%i2,	%o4,	%o0
	edge32l	%i0,	%l4,	%g7
loop_2734:
	edge8	%g4,	%o2,	%g1
	tl	%icc,	0x3
	addccc	%g3,	%o3,	%l1
	brlez,a	%g6,	loop_2735
	sub	%l2,	%i4,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%i7
loop_2735:
	edge32l	%o6,	%g2,	%l3
	tl	%icc,	0x0
	fbu,a	%fcc2,	loop_2736
	orn	%i5,	%i6,	%l0
	bge,a,pn	%icc,	loop_2737
	orcc	%o7,	%i3,	%g5
loop_2736:
	xorcc	%o5,	%i1,	%o1
	edge32n	%i2,	%o0,	%o4
loop_2737:
	fmovsne	%xcc,	%f3,	%f3
	edge8ln	%l4,	%g7,	%i0
	brz	%g4,	loop_2738
	edge8n	%o2,	%g3,	%g1
	edge8l	%o3,	%g6,	%l2
	udiv	%l1,	0x06D6,	%i4
loop_2738:
	fmuld8ulx16	%f13,	%f9,	%f30
	array16	%l6,	%i7,	%l5
	edge8	%g2,	%l3,	%o6
	bge	%icc,	loop_2739
	tg	%icc,	0x1
	brnz,a	%i6,	loop_2740
	movl	%icc,	%i5,	%l0
loop_2739:
	ta	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x55] %asi,	%i3
loop_2740:
	sir	0x1C2C
	tle	%icc,	0x1
	fmul8sux16	%f18,	%f24,	%f4
	fmovsneg	%xcc,	%f0,	%f19
	movg	%icc,	%o7,	%o5
	sdivcc	%i1,	0x17B4,	%g5
	fmovdpos	%icc,	%f31,	%f3
	edge16ln	%o1,	%o0,	%i2
	fandnot2	%f0,	%f18,	%f10
	movrgz	%l4,	%g7,	%o4
	movle	%icc,	%g4,	%o2
	ta	%icc,	0x5
	fmovdgu	%xcc,	%f16,	%f7
	edge16n	%i0,	%g1,	%g3
	movg	%xcc,	%g6,	%o3
	tpos	%icc,	0x1
	movl	%icc,	%l2,	%i4
	edge16	%l6,	%l1,	%i7
	set	0x3B, %i4
	ldstuba	[%l7 + %i4] 0x10,	%l5
	addc	%l3,	%o6,	%g2
	fones	%f16
	call	loop_2741
	siam	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i6,	%i5,	%l0
loop_2741:
	fpadd16	%f2,	%f24,	%f8
	bcc,a	%icc,	loop_2742
	fmovrde	%i3,	%f14,	%f30
	movrgez	%o5,	0x21B,	%i1
	tcs	%xcc,	0x7
loop_2742:
	fcmpeq32	%f2,	%f8,	%g5
	array16	%o1,	%o7,	%i2
	ldub	[%l7 + 0x7E],	%o0
	std	%f24,	[%l7 + 0x38]
	xor	%g7,	%l4,	%o4
	mulscc	%g4,	0x10EC,	%i0
	tvs	%xcc,	0x7
	movne	%icc,	%g1,	%g3
	addcc	%o2,	0x0907,	%g6
	and	%l2,	0x1D68,	%o3
	smulcc	%l6,	%i4,	%i7
	std	%f26,	[%l7 + 0x70]
	brgez	%l5,	loop_2743
	tleu	%xcc,	0x4
	set	0x78, %g5
	stha	%l1,	[%l7 + %g5] 0x19
loop_2743:
	nop
	set	0x44, %g7
	lduha	[%l7 + %g7] 0x10,	%o6
	tn	%icc,	0x0
	movleu	%icc,	%l3,	%g2
	movneg	%icc,	%i5,	%l0
	orncc	%i3,	0x1B75,	%o5
	set	0x24, %l6
	ldsha	[%l7 + %l6] 0x04,	%i1
	xorcc	%g5,	0x12FF,	%o1
	edge16l	%o7,	%i2,	%i6
	fmuld8sux16	%f2,	%f8,	%f24
	tneg	%xcc,	0x3
	smulcc	%o0,	%g7,	%l4
	movn	%icc,	%g4,	%i0
	fbl,a	%fcc1,	loop_2744
	fbug,a	%fcc1,	loop_2745
	movrne	%o4,	%g1,	%o2
	ldsw	[%l7 + 0x18],	%g6
loop_2744:
	nop
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2745:
	movle	%xcc,	%g3,	%l2
	movrlez	%l6,	0x3F3,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f7,	%f16
	tsubcc	%i4,	%i7,	%l5
	fpack16	%f14,	%f8
	movneg	%icc,	%o6,	%l1
	srlx	%l3,	%g2,	%l0
	fblg,a	%fcc2,	loop_2746
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,pt	%icc,	loop_2747
	sir	0x0364
loop_2746:
	sub	%i3,	%o5,	%i1
	set	0x08, %l5
	stxa	%i5,	[%l7 + %l5] 0x2b
	membar	#Sync
loop_2747:
	array32	%o1,	%o7,	%g5
	sllx	%i6,	0x0C,	%i2
	fmovdvs	%xcc,	%f9,	%f2
	bg	loop_2748
	stbar
	sdivcc	%o0,	0x0397,	%g7
	fsrc2s	%f15,	%f6
loop_2748:
	fxors	%f9,	%f6,	%f1
	stbar
	brz	%l4,	loop_2749
	edge8l	%g4,	%o4,	%g1
	wr	%g0,	0x11,	%asi
	stha	%o2,	[%l7 + 0x5A] %asi
loop_2749:
	array8	%g6,	%i0,	%l2
	alignaddrl	%g3,	%o3,	%i4
	tsubcctv	%i7,	%l5,	%l6
	movn	%icc,	%o6,	%l1
	stx	%l3,	[%l7 + 0x40]
	fblg	%fcc0,	loop_2750
	te	%icc,	0x6
	or	%l0,	0x03F2,	%i3
	edge32	%o5,	%i1,	%g2
loop_2750:
	edge8ln	%o1,	%o7,	%i5
	bvc,pn	%xcc,	loop_2751
	fpsub32s	%f17,	%f0,	%f9
	mulscc	%g5,	0x1943,	%i6
	fmovse	%icc,	%f1,	%f31
loop_2751:
	nop
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x10,	%o0
	udivx	%i2,	0x0B3C,	%l4
	bgu,pt	%xcc,	loop_2752
	edge16n	%g7,	%o4,	%g4
	udivcc	%o2,	0x0479,	%g1
	edge32n	%g6,	%i0,	%l2
loop_2752:
	alignaddrl	%g3,	%o3,	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%l6
	fnot2	%f22,	%f30
	brlz,a	%o6,	loop_2753
	umul	%l1,	0x13F2,	%i4
	nop
	set	0x40, %i2
	stx	%l3,	[%l7 + %i2]
	movrne	%i3,	%l0,	%i1
loop_2753:
	tvc	%icc,	0x3
	array16	%g2,	%o1,	%o5
	fbge,a	%fcc2,	loop_2754
	stw	%i5,	[%l7 + 0x38]
	st	%f20,	[%l7 + 0x5C]
	call	loop_2755
loop_2754:
	sllx	%o7,	0x1D,	%g5
	fcmps	%fcc3,	%f22,	%f21
	tl	%icc,	0x6
loop_2755:
	fbule,a	%fcc0,	loop_2756
	fmul8x16al	%f29,	%f14,	%f22
	sethi	0x0B49,	%o0
	bg,a,pn	%icc,	loop_2757
loop_2756:
	smulcc	%i6,	0x1C70,	%l4
	array16	%i2,	%g7,	%g4
	fands	%f23,	%f8,	%f2
loop_2757:
	andncc	%o4,	%o2,	%g1
	edge8ln	%i0,	%g6,	%l2
	movn	%xcc,	%g3,	%i7
	tleu	%icc,	0x5
	bgu,pt	%icc,	loop_2758
	brlz	%l5,	loop_2759
	fcmpgt32	%f8,	%f26,	%l6
	ldd	[%l7 + 0x68],	%f0
loop_2758:
	movvs	%icc,	%o3,	%o6
loop_2759:
	sdivx	%l1,	0x194A,	%l3
	subcc	%i4,	%l0,	%i1
	udivx	%g2,	0x1282,	%o1
	ldd	[%l7 + 0x58],	%i2
	alignaddr	%o5,	%i5,	%o7
	edge8	%g5,	%o0,	%i6
	fmovdl	%icc,	%f0,	%f1
	fabsd	%f14,	%f8
	fmovrsne	%l4,	%f28,	%f13
	bgu,a	%icc,	loop_2760
	movg	%icc,	%g7,	%g4
	movge	%icc,	%i2,	%o2
	taddcc	%o4,	0x1400,	%i0
loop_2760:
	fandnot1s	%f3,	%f18,	%f24
	addcc	%g6,	%g1,	%l2
	fba,a	%fcc0,	loop_2761
	ldx	[%l7 + 0x68],	%g3
	std	%i6,	[%l7 + 0x70]
	smulcc	%l6,	%o3,	%l5
loop_2761:
	edge8l	%o6,	%l3,	%i4
	set	0x30, %o1
	stha	%l1,	[%l7 + %o1] 0x88
	udivcc	%i1,	0x1644,	%g2
	fxnor	%f20,	%f8,	%f16
	umul	%o1,	%l0,	%o5
	alignaddrl	%i5,	%o7,	%g5
	sub	%i3,	0x1A65,	%o0
	fbuge	%fcc2,	loop_2762
	fxnors	%f10,	%f17,	%f23
	fbl,a	%fcc3,	loop_2763
	movvc	%icc,	%i6,	%l4
loop_2762:
	bn,a,pt	%icc,	loop_2764
	lduw	[%l7 + 0x2C],	%g4
loop_2763:
	add	%i2,	%o2,	%g7
	popc	0x00FB,	%o4
loop_2764:
	lduw	[%l7 + 0x24],	%g6
	udiv	%i0,	0x172A,	%l2
	or	%g1,	0x016B,	%g3
	edge8l	%l6,	%i7,	%o3
	fbne	%fcc3,	loop_2765
	edge32	%o6,	%l3,	%l5
	swap	[%l7 + 0x08],	%l1
	sth	%i4,	[%l7 + 0x44]
loop_2765:
	fxnors	%f12,	%f19,	%f21
	membar	0x0B
	fnor	%f20,	%f12,	%f20
	fbge	%fcc3,	loop_2766
	fmovdcs	%xcc,	%f14,	%f13
	fnegs	%f25,	%f18
	fnor	%f26,	%f12,	%f10
loop_2766:
	fbge	%fcc3,	loop_2767
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x4
	fmovsvs	%icc,	%f5,	%f0
loop_2767:
	xnorcc	%g2,	0x0807,	%i1
	orncc	%l0,	0x12AB,	%o5
	addccc	%i5,	%o7,	%o1
	srlx	%g5,	0x05,	%o0
	fblg	%fcc1,	loop_2768
	fpsub32s	%f13,	%f9,	%f11
	bcc,pt	%xcc,	loop_2769
	fmovscc	%xcc,	%f23,	%f26
loop_2768:
	fbne	%fcc0,	loop_2770
	tne	%icc,	0x7
loop_2769:
	fxnors	%f17,	%f3,	%f1
	movrlez	%i6,	0x33A,	%l4
loop_2770:
	srax	%g4,	%i2,	%o2
	flush	%l7 + 0x70
	edge8n	%i3,	%o4,	%g7
	fmovsgu	%icc,	%f6,	%f19
	sdivx	%g6,	0x13E4,	%l2
	stbar
	edge16ln	%g1,	%i0,	%g3
	ldub	[%l7 + 0x41],	%i7
	fmovrdgez	%o3,	%f20,	%f12
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l6,	%o6
	alignaddr	%l5,	%l1,	%l3
	fsrc2s	%f31,	%f3
	orcc	%g2,	0x0505,	%i1
	add	%i4,	0x1137,	%l0
	movleu	%icc,	%o5,	%i5
	fbg,a	%fcc1,	loop_2771
	brlez	%o7,	loop_2772
	addcc	%o1,	0x1BDC,	%o0
	fmovrdlz	%i6,	%f6,	%f30
loop_2771:
	brgez	%g5,	loop_2773
loop_2772:
	movrgez	%l4,	0x235,	%g4
	fpsub32s	%f26,	%f8,	%f2
	sdivcc	%o2,	0x05A3,	%i3
loop_2773:
	smulcc	%o4,	%g7,	%g6
	movcc	%icc,	%i2,	%g1
	movcc	%icc,	%i0,	%g3
	tl	%xcc,	0x4
	sdivx	%i7,	0x16EB,	%o3
	fbo	%fcc0,	loop_2774
	taddcctv	%l6,	0x09D5,	%l2
	ldx	[%l7 + 0x30],	%o6
	subccc	%l1,	0x077B,	%l5
loop_2774:
	edge16	%g2,	%i1,	%i4
	movre	%l0,	%l3,	%o5
	movrgz	%i5,	%o7,	%o1
	ldub	[%l7 + 0x13],	%i6
	fmovrdgez	%o0,	%f6,	%f20
	fcmpes	%fcc3,	%f18,	%f21
	fmuld8ulx16	%f10,	%f31,	%f0
	movl	%xcc,	%g5,	%l4
	array32	%g4,	%o2,	%o4
	fble	%fcc3,	loop_2775
	bcc,pt	%icc,	loop_2776
	fbue,a	%fcc0,	loop_2777
	fmovd	%f6,	%f18
loop_2775:
	fnot1s	%f20,	%f27
loop_2776:
	movrne	%i3,	0x3B4,	%g7
loop_2777:
	sll	%i2,	0x15,	%g1
	fbge	%fcc1,	loop_2778
	te	%xcc,	0x0
	fandnot1s	%f3,	%f4,	%f22
	nop
	setx loop_2779, %l0, %l1
	jmpl %l1, %g6
loop_2778:
	fmovsg	%icc,	%f20,	%f22
	set	0x08, %o7
	stha	%i0,	[%l7 + %o7] 0x2f
	membar	#Sync
loop_2779:
	movre	%g3,	%o3,	%l6
	fexpand	%f31,	%f22
	edge16	%i7,	%o6,	%l2
	movpos	%icc,	%l1,	%l5
	st	%f14,	[%l7 + 0x50]
	sra	%i1,	%g2,	%i4
	fpack16	%f8,	%f18
	movn	%icc,	%l3,	%o5
	prefetch	[%l7 + 0x40],	 0x0
	tleu	%icc,	0x0
	orcc	%l0,	0x11BC,	%o7
	tsubcc	%o1,	%i6,	%o0
	bge,a	%icc,	loop_2780
	movl	%icc,	%g5,	%i5
	fbo,a	%fcc0,	loop_2781
	fmovsge	%icc,	%f7,	%f26
loop_2780:
	umul	%l4,	0x1BEA,	%o2
	wr	%g0,	0xe2,	%asi
	stba	%g4,	[%l7 + 0x47] %asi
	membar	#Sync
loop_2781:
	taddcctv	%o4,	%g7,	%i3
	sethi	0x09B4,	%g1
	fzeros	%f9
	udivx	%g6,	0x1A81,	%i2
	fmovrdne	%g3,	%f14,	%f14
	popc	0x0D5D,	%i0
	movrlez	%o3,	%i7,	%l6
	fmul8x16au	%f3,	%f4,	%f22
	fmovsvc	%xcc,	%f5,	%f11
	addccc	%o6,	%l2,	%l1
	movre	%l5,	0x251,	%i1
	edge32l	%i4,	%l3,	%g2
	sethi	0x1B05,	%o5
	xnor	%o7,	%o1,	%i6
	movrne	%l0,	0x289,	%o0
	movge	%xcc,	%g5,	%l4
	set	0x358, %o4
	nop 	! 	stxa	%o2,	[%g0 + %o4] 0x40 ripped by fixASI40.pl
	tn	%icc,	0x7
	fornot2	%f8,	%f8,	%f14
	fbge	%fcc2,	loop_2782
	alignaddrl	%i5,	%g4,	%o4
	tcs	%xcc,	0x4
	brlez,a	%i3,	loop_2783
loop_2782:
	fmovdle	%icc,	%f9,	%f28
	tvc	%xcc,	0x4
	udivx	%g7,	0x1388,	%g1
loop_2783:
	tne	%icc,	0x6
	fornot2	%f6,	%f16,	%f20
	fbug,a	%fcc1,	loop_2784
	fzero	%f22
	tle	%xcc,	0x3
	popc	0x18D6,	%i2
loop_2784:
	movrlez	%g3,	%g6,	%i0
	fmovrslz	%o3,	%f9,	%f18
	fmovdle	%xcc,	%f1,	%f6
	edge8	%i7,	%o6,	%l2
	fmovrsne	%l1,	%f23,	%f27
	fabsd	%f2,	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l6,	%i1
	fbu	%fcc1,	loop_2785
	fandnot1s	%f21,	%f19,	%f31
	movg	%xcc,	%i4,	%l5
	fmovrslez	%l3,	%f29,	%f14
loop_2785:
	brnz,a	%g2,	loop_2786
	movcs	%icc,	%o5,	%o1
	tneg	%icc,	0x5
	smulcc	%i6,	%o7,	%o0
loop_2786:
	udivx	%l0,	0x19CF,	%g5
	edge8	%l4,	%i5,	%o2
	tvc	%icc,	0x3
	fabsd	%f2,	%f28
	st	%f8,	[%l7 + 0x44]
	nop
	set	0x78, %o5
	lduh	[%l7 + %o5],	%o4
	udiv	%g4,	0x0A90,	%g7
	fbg	%fcc0,	loop_2787
	movcs	%icc,	%g1,	%i2
	addc	%g3,	0x0472,	%i3
	fpsub32s	%f23,	%f16,	%f5
loop_2787:
	udivcc	%i0,	0x0234,	%o3
	andn	%g6,	0x17AF,	%o6
	stw	%i7,	[%l7 + 0x58]
	alignaddrl	%l1,	%l6,	%i1
	sir	0x1A96
	set	0x0C, %o2
	swapa	[%l7 + %o2] 0x11,	%i4
	membar	0x1A
	movrgez	%l2,	%l3,	%g2
	tpos	%icc,	0x2
	movg	%icc,	%l5,	%o5
	udivx	%i6,	0x02AD,	%o7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x36] %asi,	%o0
	addcc	%o1,	0x17BA,	%g5
	movrlez	%l0,	0x207,	%i5
	ldsb	[%l7 + 0x3A],	%l4
	subc	%o4,	0x0F1F,	%o2
	nop
	setx	loop_2788,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%g7,	%g1,	%g4
	fzeros	%f3
	tg	%icc,	0x1
loop_2788:
	fbo	%fcc2,	loop_2789
	tn	%xcc,	0x5
	stx	%g3,	[%l7 + 0x48]
	movn	%icc,	%i2,	%i0
loop_2789:
	fmovdne	%xcc,	%f5,	%f5
	tgu	%xcc,	0x5
	fsrc2	%f12,	%f6
	movgu	%xcc,	%o3,	%i3
	array8	%g6,	%i7,	%l1
	call	loop_2790
	fcmpes	%fcc1,	%f12,	%f26
	mulx	%o6,	%l6,	%i1
	fpsub16	%f14,	%f30,	%f18
loop_2790:
	fxnors	%f12,	%f26,	%f12
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%l3
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g2
	taddcc	%i4,	%l5,	%i6
	fbne	%fcc1,	loop_2791
	fbne	%fcc1,	loop_2792
	sdiv	%o7,	0x118C,	%o0
	array8	%o5,	%o1,	%g5
loop_2791:
	nop
	set	0x6E, %i6
	lduh	[%l7 + %i6],	%i5
loop_2792:
	nop
	set	0x70, %g1
	stx	%l4,	[%l7 + %g1]
	fandnot1s	%f27,	%f18,	%f28
	ba	loop_2793
	std	%l0,	[%l7 + 0x40]
	tvs	%xcc,	0x2
	andcc	%o2,	0x0352,	%g7
loop_2793:
	fpadd16	%f2,	%f10,	%f30
	fnands	%f24,	%f20,	%f13
	taddcc	%o4,	0x0F97,	%g1
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x58] %asi,	%g4
	edge32	%g3,	%i2,	%i0
	tg	%icc,	0x3
	tge	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o3
	smul	%i3,	%g6,	%l1
	bgu,a,pt	%icc,	loop_2794
	bvs,a,pn	%icc,	loop_2795
	movn	%xcc,	%o6,	%i7
	fpmerge	%f15,	%f7,	%f22
loop_2794:
	sethi	0x036B,	%i1
loop_2795:
	edge32	%l2,	%l3,	%g2
	sub	%l6,	0x05CE,	%i4
	andncc	%l5,	%o7,	%o0
	edge32	%o5,	%o1,	%i6
	tgu	%xcc,	0x4
	srax	%i5,	%g5,	%l0
	fnot2	%f6,	%f8
	fmovrsne	%l4,	%f7,	%f24
	fmovsl	%xcc,	%f25,	%f7
	movrne	%g7,	%o4,	%o2
	fones	%f23
	edge16	%g1,	%g3,	%i2
	sdiv	%i0,	0x1414,	%g4
	movrgz	%i3,	0x0D4,	%g6
	set	0x18, %l4
	lduwa	[%l7 + %l4] 0x04,	%l1
	set	0x4F, %g3
	ldsba	[%l7 + %g3] 0x18,	%o6
	set	0x1C, %g6
	ldsba	[%l7 + %g6] 0x89,	%i7
	wr	%g0,	0x89,	%asi
	stha	%o3,	[%l7 + 0x4C] %asi
	andcc	%i1,	%l2,	%l3
	brlz,a	%g2,	loop_2796
	fmovdl	%icc,	%f12,	%f3
	set	0x17, %l0
	ldstuba	[%l7 + %l0] 0x04,	%i4
loop_2796:
	movcc	%xcc,	%l5,	%l6
	srlx	%o7,	%o0,	%o1
	edge8ln	%i6,	%i5,	%o5
	srl	%l0,	%l4,	%g7
	array32	%g5,	%o2,	%o4
	edge32l	%g1,	%i2,	%i0
	sethi	0x17F0,	%g4
	sir	0x0B57
	tsubcctv	%i3,	0x1824,	%g3
	tl	%xcc,	0x6
	sll	%l1,	0x07,	%o6
	lduh	[%l7 + 0x08],	%i7
	fmovde	%icc,	%f9,	%f3
	wr	%g0,	0x81,	%asi
	stda	%g6,	[%l7 + 0x18] %asi
	movpos	%xcc,	%i1,	%l2
	brnz,a	%l3,	loop_2797
	fmul8x16au	%f5,	%f25,	%f16
	swap	[%l7 + 0x50],	%o3
	brgez,a	%g2,	loop_2798
loop_2797:
	andn	%l5,	0x11FB,	%l6
	sethi	0x0AC2,	%o7
	subcc	%i4,	%o0,	%i6
loop_2798:
	movre	%i5,	0x342,	%o1
	fpadd32	%f26,	%f24,	%f8
	srlx	%o5,	%l0,	%g7
	fpadd32s	%f9,	%f18,	%f9
	bvs,pt	%icc,	loop_2799
	movrlez	%l4,	%g5,	%o2
	fcmpne32	%f10,	%f14,	%g1
	andn	%i2,	%o4,	%i0
loop_2799:
	fandnot2s	%f7,	%f4,	%f25
	fpadd32	%f8,	%f28,	%f0
	fnands	%f24,	%f12,	%f13
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x80,	%i3
	fmovdle	%xcc,	%f20,	%f22
	wr	%g0,	0x21,	%asi
	stxa	%g3,	[%g0 + 0x10] %asi
	edge32ln	%g4,	%o6,	%i7
	edge32l	%l1,	%g6,	%l2
	subc	%l3,	0x1CE7,	%i1
	set	0x6C, %i1
	ldswa	[%l7 + %i1] 0x80,	%o3
	movrgz	%g2,	%l5,	%o7
	addccc	%l6,	%i4,	%o0
	brlz,a	%i5,	loop_2800
	taddcctv	%o1,	%i6,	%l0
	edge32ln	%o5,	%l4,	%g7
	nop
	setx loop_2801, %l0, %l1
	jmpl %l1, %o2
loop_2800:
	umul	%g5,	0x0128,	%g1
	movg	%icc,	%o4,	%i0
	edge8l	%i2,	%g3,	%g4
loop_2801:
	movg	%icc,	%o6,	%i7
	subccc	%i3,	%g6,	%l1
	popc	0x0132,	%l3
	movgu	%xcc,	%l2,	%o3
	bleu,pt	%xcc,	loop_2802
	prefetch	[%l7 + 0x78],	 0x2
	fxor	%f0,	%f22,	%f4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x50] %asi,	%i1
loop_2802:
	fcmpeq16	%f22,	%f12,	%g2
	xnorcc	%o7,	%l6,	%l5
	bne,a,pt	%xcc,	loop_2803
	tge	%icc,	0x3
	fnegs	%f2,	%f11
	xor	%o0,	0x1435,	%i4
loop_2803:
	tpos	%xcc,	0x4
	lduh	[%l7 + 0x1C],	%i5
	ldsw	[%l7 + 0x34],	%o1
	bne	loop_2804
	addccc	%i6,	%l0,	%l4
	fbg	%fcc0,	loop_2805
	fornot1	%f10,	%f26,	%f18
loop_2804:
	subcc	%o5,	%o2,	%g7
	bgu,a	%xcc,	loop_2806
loop_2805:
	movrgez	%g1,	0x33E,	%g5
	edge32n	%i0,	%o4,	%i2
	bneg	%xcc,	loop_2807
loop_2806:
	xnorcc	%g3,	%g4,	%i7
	membar	0x0E
	edge32l	%i3,	%g6,	%o6
loop_2807:
	fands	%f31,	%f1,	%f31
	fandnot2s	%f0,	%f2,	%f20
	fbue	%fcc3,	loop_2808
	movvc	%xcc,	%l1,	%l2
	movl	%icc,	%l3,	%o3
	fpsub32	%f16,	%f18,	%f0
loop_2808:
	tvs	%icc,	0x5
	ldub	[%l7 + 0x71],	%g2
	tg	%icc,	0x7
	bvc,a	%icc,	loop_2809
	ta	%icc,	0x0
	set	0x6C, %l2
	lduha	[%l7 + %l2] 0x19,	%i1
loop_2809:
	fsrc2	%f0,	%f22
	bneg,a	%xcc,	loop_2810
	bpos,pn	%xcc,	loop_2811
	tgu	%icc,	0x6
	umulcc	%l6,	0x1552,	%o7
loop_2810:
	fmovdcc	%icc,	%f2,	%f13
loop_2811:
	sethi	0x0637,	%l5
	fmovdg	%icc,	%f1,	%f29
	tvs	%icc,	0x3
	ta	%icc,	0x6
	fnand	%f22,	%f12,	%f12
	udiv	%i4,	0x1D18,	%o0
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x54] %asi,	%o1
	movrgz	%i5,	%l0,	%l4
	bn,pn	%xcc,	loop_2812
	sethi	0x1216,	%i6
	fba,a	%fcc3,	loop_2813
	movrlez	%o5,	0x1D8,	%o2
loop_2812:
	fandnot1s	%f18,	%f7,	%f15
	nop
	setx	loop_2814,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2813:
	fmovsne	%icc,	%f12,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc0,	loop_2815
loop_2814:
	std	%f30,	[%l7 + 0x18]
	movne	%icc,	%g7,	%g5
	fblg	%fcc0,	loop_2816
loop_2815:
	fmul8x16au	%f8,	%f8,	%f26
	array32	%g1,	%i0,	%o4
	fmul8x16	%f13,	%f12,	%f24
loop_2816:
	fmovdne	%xcc,	%f4,	%f13
	fexpand	%f20,	%f14
	fsrc2	%f8,	%f6
	pdist	%f20,	%f18,	%f2
	fnot2	%f10,	%f26
	and	%i2,	%g3,	%g4
	array16	%i3,	%i7,	%g6
	move	%xcc,	%l1,	%o6
	smulcc	%l3,	%o3,	%g2
	movvc	%icc,	%i1,	%l2
	set	0x10, %o0
	ldsha	[%l7 + %o0] 0x04,	%o7
	movcs	%xcc,	%l6,	%i4
	movrlz	%l5,	0x297,	%o0
	sll	%i5,	%o1,	%l4
	tle	%icc,	0x0
	and	%l0,	0x1140,	%i6
	array32	%o5,	%o2,	%g7
	movrlez	%g1,	0x208,	%g5
	tvs	%icc,	0x1
	movne	%icc,	%o4,	%i2
	flush	%l7 + 0x40
	fmovsl	%xcc,	%f22,	%f9
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i0,	%g3
	brnz	%g4,	loop_2817
	flush	%l7 + 0x74
	movgu	%xcc,	%i3,	%i7
	move	%icc,	%g6,	%l1
loop_2817:
	alignaddr	%o6,	%o3,	%l3
	sth	%g2,	[%l7 + 0x32]
	fmovrdgz	%i1,	%f16,	%f22
	movre	%l2,	0x24C,	%o7
	set	0x34, %g2
	sta	%f10,	[%l7 + %g2] 0x11
	movpos	%xcc,	%l6,	%l5
	fbuge	%fcc0,	loop_2818
	movpos	%xcc,	%o0,	%i4
	edge32n	%i5,	%o1,	%l0
	ble,pt	%icc,	loop_2819
loop_2818:
	movrlz	%i6,	%o5,	%l4
	fmovdn	%xcc,	%f24,	%f2
	sdiv	%o2,	0x1772,	%g1
loop_2819:
	fmovscs	%xcc,	%f6,	%f20
	set	0x0C, %l3
	ldswa	[%l7 + %l3] 0x15,	%g5
	bgu,a,pt	%icc,	loop_2820
	fmovrdgez	%o4,	%f18,	%f30
	stx	%g7,	[%l7 + 0x58]
	brlz	%i2,	loop_2821
loop_2820:
	tgu	%xcc,	0x2
	fsrc2s	%f14,	%f26
	sdivcc	%g3,	0x0481,	%g4
loop_2821:
	add	%i3,	0x1425,	%i7
	or	%i0,	0x16BF,	%g6
	fornot1s	%f20,	%f19,	%f28
	fsrc1	%f26,	%f0
	std	%o6,	[%l7 + 0x50]
	xorcc	%o3,	%l3,	%g2
	sdiv	%i1,	0x103F,	%l1
	udivcc	%o7,	0x198B,	%l6
	andncc	%l2,	%o0,	%i4
	fzero	%f26
	fcmps	%fcc2,	%f3,	%f15
	fmovrslez	%l5,	%f4,	%f7
	and	%o1,	%i5,	%l0
	fnot2s	%f28,	%f18
	movrgez	%o5,	0x02E,	%l4
	fpadd16s	%f3,	%f12,	%f3
	tge	%icc,	0x4
	edge16	%o2,	%g1,	%i6
	subc	%o4,	%g5,	%i2
	orncc	%g3,	%g4,	%i3
	andncc	%g7,	%i0,	%g6
	sth	%o6,	[%l7 + 0x42]
	fornot2	%f14,	%f24,	%f16
	xnor	%o3,	0x08F0,	%l3
	fbge,a	%fcc3,	loop_2822
	popc	%g2,	%i1
	ta	%xcc,	0x7
	fnor	%f10,	%f22,	%f4
loop_2822:
	tneg	%icc,	0x4
	movn	%xcc,	%i7,	%l1
	movn	%xcc,	%l6,	%o7
	addc	%l2,	%o0,	%i4
	addccc	%l5,	%o1,	%l0
	fcmpgt16	%f4,	%f26,	%i5
	move	%icc,	%o5,	%o2
	edge32	%l4,	%i6,	%g1
	edge32	%g5,	%i2,	%o4
	srlx	%g3,	0x00,	%i3
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i0,	%g4
	orn	%o6,	0x0505,	%g6
	movneg	%icc,	%o3,	%g2
	movcc	%icc,	%i1,	%l3
	fmul8sux16	%f0,	%f4,	%f10
	fone	%f2
	xnor	%l1,	0x19B6,	%l6
	sdivx	%i7,	0x1B54,	%o7
	bl	loop_2823
	stbar
	bvc,a	%xcc,	loop_2824
	srl	%o0,	0x0A,	%i4
loop_2823:
	udiv	%l2,	0x0C65,	%l5
	fcmped	%fcc1,	%f2,	%f24
loop_2824:
	tcc	%icc,	0x5
	edge8l	%l0,	%o1,	%o5
	movvc	%icc,	%i5,	%l4
	fmuld8sux16	%f10,	%f13,	%f0
	fmovrslez	%o2,	%f13,	%f3
	tsubcctv	%g1,	%i6,	%i2
	andncc	%g5,	%g3,	%i3
	fpadd16	%f26,	%f18,	%f0
	fba	%fcc1,	loop_2825
	sdivx	%g7,	0x15CC,	%i0
	fcmpgt32	%f2,	%f8,	%g4
	array32	%o6,	%g6,	%o4
loop_2825:
	movne	%icc,	%o3,	%i1
	tge	%icc,	0x1
	sethi	0x1DA9,	%g2
	set	0x5D, %l1
	ldstuba	[%l7 + %l1] 0x04,	%l1
	fornot2s	%f1,	%f31,	%f7
	and	%l3,	0x0D0D,	%i7
	fmul8x16	%f19,	%f4,	%f4
	movne	%icc,	%o7,	%l6
	fmovdvs	%xcc,	%f6,	%f0
	ta	%icc,	0x0
	tcs	%icc,	0x0
	orcc	%i4,	%l2,	%o0
	umulcc	%l5,	%o1,	%l0
	fmovrslez	%o5,	%f1,	%f14
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0x2
	tgu	%icc,	0x7
	andcc	%i5,	%g1,	%i6
	alignaddr	%o2,	%i2,	%g5
	fbu,a	%fcc2,	loop_2826
	fzeros	%f23
	edge16	%i3,	%g3,	%g7
	set	0x21, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i0
loop_2826:
	edge8n	%o6,	%g4,	%g6
	fpadd16s	%f26,	%f22,	%f9
	add	%o4,	0x1315,	%o3
	edge8ln	%g2,	%i1,	%l1
	fornot1	%f26,	%f22,	%f30
	nop
	set	0x3B, %i5
	ldub	[%l7 + %i5],	%l3
	fnot2s	%f28,	%f15
	tgu	%icc,	0x7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%l6
	pdist	%f20,	%f0,	%f10
	tn	%xcc,	0x2
	movg	%xcc,	%i4,	%l2
	edge16n	%o0,	%o7,	%o1
	subcc	%l0,	0x0919,	%o5
	fpadd16s	%f31,	%f16,	%f0
	fmovrslz	%l5,	%f3,	%f25
	subcc	%l4,	0x0B84,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pt	%icc,	loop_2827
	sdiv	%i5,	0x1318,	%i6
	wr	%g0,	0x04,	%asi
	stwa	%o2,	[%l7 + 0x10] %asi
loop_2827:
	smul	%g5,	0x0335,	%i2
	movne	%xcc,	%i3,	%g7
	fbge	%fcc2,	loop_2828
	movge	%xcc,	%g3,	%o6
	edge16n	%i0,	%g6,	%o4
	alignaddrl	%g4,	%g2,	%i1
loop_2828:
	prefetch	[%l7 + 0x44],	 0x2
	sethi	0x0DCB,	%l1
	membar	0x07
	xor	%l3,	0x0431,	%i7
	fcmpeq16	%f22,	%f26,	%l6
	brgz,a	%o3,	loop_2829
	movrgez	%i4,	0x1BD,	%l2
	fmovdne	%xcc,	%f7,	%f7
	fbne	%fcc3,	loop_2830
loop_2829:
	xorcc	%o0,	0x14DE,	%o1
	umul	%o7,	%o5,	%l5
	umul	%l0,	%g1,	%i5
loop_2830:
	sth	%i6,	[%l7 + 0x72]
	sdivx	%o2,	0x1233,	%l4
	fbo	%fcc1,	loop_2831
	fmovscs	%xcc,	%f12,	%f14
	addc	%g5,	%i2,	%i3
	ld	[%l7 + 0x48],	%f20
loop_2831:
	smulcc	%g7,	0x187E,	%g3
	taddcctv	%o6,	0x03AB,	%i0
	fones	%f8
	umulcc	%g6,	0x1EC8,	%g4
	subc	%g2,	0x0B2D,	%i1
	subc	%o4,	0x1DC4,	%l1
	tg	%xcc,	0x2
	edge8ln	%l3,	%i7,	%l6
	stb	%i4,	[%l7 + 0x62]
	fsrc1	%f8,	%f14
	xnorcc	%o3,	%o0,	%l2
	fmovrdgz	%o1,	%f24,	%f8
	movrlz	%o5,	0x051,	%l5
	tneg	%xcc,	0x3
	movleu	%icc,	%o7,	%g1
	set	0x77, %i0
	stba	%l0,	[%l7 + %i0] 0x14
	movgu	%xcc,	%i6,	%o2
	and	%l4,	%i5,	%g5
	fmovda	%xcc,	%f15,	%f23
	array8	%i3,	%i2,	%g3
	fbul,a	%fcc3,	loop_2832
	fcmpeq16	%f24,	%f28,	%g7
	sub	%i0,	%g6,	%o6
	ta	%xcc,	0x0
loop_2832:
	bcc,a,pn	%icc,	loop_2833
	fbge	%fcc2,	loop_2834
	fmul8x16au	%f21,	%f3,	%f8
	tleu	%icc,	0x5
loop_2833:
	fmul8x16al	%f2,	%f1,	%f26
loop_2834:
	fnot1s	%f26,	%f17
	fcmpgt32	%f6,	%f0,	%g4
	xor	%g2,	0x0911,	%o4
	smulcc	%l1,	%l3,	%i1
	sll	%l6,	%i4,	%o3
	orn	%i7,	%o0,	%l2
	movgu	%xcc,	%o5,	%l5
	fble	%fcc0,	loop_2835
	tgu	%icc,	0x5
	ldd	[%l7 + 0x40],	%o0
	bneg	loop_2836
loop_2835:
	tpos	%icc,	0x5
	tpos	%icc,	0x4
	ldsb	[%l7 + 0x6C],	%o7
loop_2836:
	subcc	%g1,	%i6,	%l0
	movcc	%xcc,	%o2,	%i5
	fblg,a	%fcc1,	loop_2837
	movcc	%xcc,	%l4,	%g5
	movrlz	%i2,	0x114,	%i3
	nop
	set	0x70, %i4
	stx	%g3,	[%l7 + %i4]
loop_2837:
	bvs,a,pn	%icc,	loop_2838
	membar	0x0F
	fmovdvc	%icc,	%f9,	%f26
	alignaddrl	%g7,	%i0,	%o6
loop_2838:
	movcs	%xcc,	%g4,	%g2
	fcmped	%fcc0,	%f26,	%f14
	fpack32	%f14,	%f4,	%f20
	bn,a	loop_2839
	add	%g6,	0x0C8D,	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x19,	%l1,	%i1
loop_2839:
	movleu	%xcc,	%l6,	%l3
	tgu	%xcc,	0x7
	fzero	%f24
	array16	%i4,	%i7,	%o3
	movrlez	%o0,	0x1F6,	%o5
	tgu	%xcc,	0x1
	brlez	%l2,	loop_2840
	fmovs	%f22,	%f12
	movrgez	%o1,	0x1EA,	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o7,	%g1
loop_2840:
	nop
	setx loop_2841, %l0, %l1
	jmpl %l1, %l0
	fmovdvs	%xcc,	%f11,	%f27
	tne	%icc,	0x4
	sll	%i6,	%o2,	%l4
loop_2841:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x0E] %asi,	%g5
	array32	%i2,	%i3,	%i5
	brnz	%g7,	loop_2842
	fble,a	%fcc1,	loop_2843
	edge32n	%i0,	%g3,	%g4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3f0] %asi,	%g2 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2842:
	smul	%g6,	%o6,	%l1
loop_2843:
	taddcc	%i1,	0x1FBF,	%l6
	fmovdcs	%icc,	%f12,	%f22
	tg	%icc,	0x7
	edge8n	%l3,	%o4,	%i7
	movl	%xcc,	%o3,	%i4
	orn	%o0,	0x1D5F,	%o5
	prefetch	[%l7 + 0x1C],	 0x2
	bleu,a,pn	%icc,	loop_2844
	tneg	%xcc,	0x2
	sdivcc	%l2,	0x07DB,	%o1
	tsubcc	%l5,	%o7,	%g1
loop_2844:
	array32	%l0,	%i6,	%l4
	te	%icc,	0x7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%i2
	bpos,a,pt	%icc,	loop_2845
	edge16ln	%i3,	%i5,	%o2
	set	0x1C, %g5
	swapa	[%l7 + %g5] 0x18,	%g7
loop_2845:
	smulcc	%g3,	0x1893,	%i0
	movl	%icc,	%g2,	%g6
	brgz,a	%o6,	loop_2846
	addcc	%l1,	0x12CF,	%i1
	fbo	%fcc1,	loop_2847
	fandnot2s	%f25,	%f14,	%f8
loop_2846:
	sra	%l6,	0x05,	%g4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%l3
loop_2847:
	fbo	%fcc3,	loop_2848
	ldsh	[%l7 + 0x1A],	%i7
	movle	%icc,	%o4,	%o3
	srlx	%o0,	0x10,	%o5
loop_2848:
	fmovde	%xcc,	%f20,	%f27
	wr	%g0,	0x27,	%asi
	stxa	%i4,	[%l7 + 0x48] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x1C] %asi,	%o1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0E] %asi,	%l2
	alignaddr	%o7,	%l5,	%l0
	tcc	%xcc,	0x1
	stb	%i6,	[%l7 + 0x50]
	fmul8sux16	%f12,	%f0,	%f14
	fabss	%f0,	%f1
	add	%g1,	%l4,	%i2
	umul	%i3,	0x1061,	%g5
	fbo,a	%fcc1,	loop_2849
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc3,	loop_2850
	tl	%icc,	0x6
loop_2849:
	ldd	[%l7 + 0x60],	%i4
	ldstub	[%l7 + 0x54],	%g7
loop_2850:
	fmuld8ulx16	%f22,	%f17,	%f18
	fandnot1s	%f4,	%f14,	%f28
	ble,a	loop_2851
	nop
	setx loop_2852, %l0, %l1
	jmpl %l1, %g3
	srlx	%o2,	0x00,	%g2
	fabsd	%f26,	%f22
loop_2851:
	fmovdcc	%xcc,	%f7,	%f17
loop_2852:
	edge8l	%g6,	%o6,	%i0
	fmovsleu	%xcc,	%f23,	%f26
	ldx	[%l7 + 0x28],	%l1
	bvs,a	%xcc,	loop_2853
	array16	%i1,	%l6,	%l3
	membar	0x75
	fbu	%fcc0,	loop_2854
loop_2853:
	fnot2s	%f28,	%f28
	xnor	%i7,	%o4,	%o3
	sdivx	%o0,	0x0590,	%o5
loop_2854:
	fandnot2s	%f21,	%f13,	%f26
	or	%i4,	0x1304,	%o1
	srl	%g4,	0x14,	%o7
	movrlz	%l2,	%l5,	%l0
	mova	%xcc,	%g1,	%l4
	fmovrdgz	%i6,	%f6,	%f14
	umul	%i3,	%i2,	%g5
	taddcc	%g7,	0x04E8,	%g3
	fnot1s	%f7,	%f21
	ldd	[%l7 + 0x20],	%f30
	umul	%o2,	0x00CB,	%g2
	wr	%g0,	0x5f,	%asi
	stxa	%g6,	[%g0 + 0x0] %asi
	ta	%icc,	0x7
	movpos	%icc,	%o6,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%i1
	movvc	%icc,	%l1,	%l6
	movvs	%icc,	%i7,	%l3
	smul	%o3,	0x1E5E,	%o0
	fcmpgt32	%f10,	%f18,	%o5
	mulx	%o4,	0x15B8,	%o1
	subcc	%i4,	%o7,	%g4
	tvc	%xcc,	0x0
	nop
	setx	loop_2855,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovspos	%icc,	%f15,	%f20
	sethi	0x1B00,	%l2
	ba,pt	%xcc,	loop_2856
loop_2855:
	movneg	%xcc,	%l5,	%g1
	movvc	%icc,	%l4,	%l0
	fandnot2	%f18,	%f22,	%f10
loop_2856:
	fmovsg	%icc,	%f25,	%f14
	xnor	%i6,	0x0850,	%i3
	subccc	%i2,	0x0C75,	%g7
	udiv	%g5,	0x1475,	%o2
	brlz	%g3,	loop_2857
	udivx	%g6,	0x04B4,	%g2
	xnorcc	%i5,	0x1BA7,	%i0
	mulx	%i1,	0x0DC7,	%l1
loop_2857:
	srax	%l6,	0x17,	%i7
	tpos	%icc,	0x1
	and	%o6,	0x17E0,	%l3
	srlx	%o3,	0x06,	%o0
	orn	%o5,	0x1624,	%o4
	bge,pn	%xcc,	loop_2858
	move	%xcc,	%i4,	%o7
	udiv	%o1,	0x004E,	%g4
	fbn	%fcc1,	loop_2859
loop_2858:
	stw	%l5,	[%l7 + 0x50]
	wr	%g0,	0x57,	%asi
	stxa	%g1,	[%g0 + 0x0] %asi
loop_2859:
	sll	%l4,	0x04,	%l0
	fmovrdlz	%i6,	%f30,	%f20
	fbg,a	%fcc1,	loop_2860
	fmovdn	%icc,	%f18,	%f28
	movrlz	%i3,	0x1D3,	%i2
	st	%f19,	[%l7 + 0x54]
loop_2860:
	fcmped	%fcc2,	%f10,	%f28
	movge	%xcc,	%g7,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l2,	0x04C6,	%g3
	tvc	%xcc,	0x1
	nop
	setx	loop_2861,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andn	%o2,	0x1CBF,	%g2
	tsubcctv	%g6,	%i5,	%i0
	sub	%l1,	0x120C,	%l6
loop_2861:
	and	%i1,	%o6,	%l3
	edge8l	%i7,	%o3,	%o5
	edge8n	%o4,	%i4,	%o0
	set	0x50, %o3
	ldswa	[%l7 + %o3] 0x19,	%o7
	fnand	%f8,	%f6,	%f26
	set	0x4A, %g7
	stha	%g4,	[%l7 + %g7] 0x80
	ldd	[%l7 + 0x18],	%l4
	set	0x1E, %l6
	lduba	[%l7 + %l6] 0x15,	%o1
	orncc	%g1,	0x0DAE,	%l4
	sub	%l0,	0x06CC,	%i3
	fbuge,a	%fcc2,	loop_2862
	fmovscc	%xcc,	%f25,	%f18
	movrne	%i2,	%g7,	%i6
	xnor	%l2,	0x1E04,	%g3
loop_2862:
	nop
	setx loop_2863, %l0, %l1
	jmpl %l1, %g5
	brlez	%g2,	loop_2864
	be,pt	%icc,	loop_2865
	tgu	%xcc,	0x3
loop_2863:
	sdivcc	%g6,	0x17D1,	%o2
loop_2864:
	addc	%i5,	0x013F,	%l1
loop_2865:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l6,	%i0,	%i1
	set	0x18, %l5
	ldsba	[%l7 + %l5] 0x18,	%o6
	alignaddr	%i7,	%l3,	%o3
	fbe	%fcc0,	loop_2866
	fnors	%f3,	%f29,	%f29
	addc	%o4,	%o5,	%i4
	addcc	%o7,	%g4,	%l5
loop_2866:
	fmovsge	%xcc,	%f5,	%f13
	fpmerge	%f7,	%f13,	%f0
	edge32n	%o0,	%o1,	%l4
	edge8l	%l0,	%i3,	%i2
	edge8n	%g1,	%i6,	%g7
	ldx	[%l7 + 0x68],	%l2
	pdist	%f26,	%f20,	%f4
	tne	%xcc,	0x7
	addc	%g3,	0x0294,	%g2
	tcs	%icc,	0x3
	bn,a,pn	%icc,	loop_2867
	srl	%g5,	%o2,	%g6
	movre	%i5,	0x3C0,	%l6
	fcmps	%fcc3,	%f17,	%f6
loop_2867:
	fmuld8ulx16	%f24,	%f30,	%f30
	or	%i0,	%i1,	%l1
	bl,pn	%xcc,	loop_2868
	fmovde	%xcc,	%f20,	%f31
	bge,pn	%icc,	loop_2869
	udiv	%i7,	0x1629,	%l3
loop_2868:
	movg	%xcc,	%o3,	%o6
	tpos	%icc,	0x7
loop_2869:
	fmovsn	%xcc,	%f24,	%f8
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x28] %asi,	%o5
	tge	%icc,	0x4
	fpackfix	%f0,	%f26
	tl	%xcc,	0x1
	std	%f4,	[%l7 + 0x78]
	tne	%icc,	0x3
	edge8	%i4,	%o4,	%g4
	movre	%l5,	0x0B0,	%o0
	addcc	%o7,	%o1,	%l4
	fmovdpos	%icc,	%f27,	%f14
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i3
	fmovdcs	%xcc,	%f27,	%f14
	fpsub32	%f30,	%f24,	%f20
	srl	%l0,	%i2,	%i6
	udivcc	%g1,	0x1D61,	%g7
	fbue	%fcc3,	loop_2870
	array32	%g3,	%g2,	%g5
	fmovsn	%xcc,	%f8,	%f20
	udivcc	%o2,	0x1EBB,	%g6
loop_2870:
	srl	%l2,	0x0B,	%i5
	fsrc2s	%f6,	%f26
	fbuge,a	%fcc2,	loop_2871
	xorcc	%l6,	%i0,	%l1
	subcc	%i7,	0x0476,	%l3
	movleu	%xcc,	%o3,	%i1
loop_2871:
	nop
	set	0x76, %o6
	ldsba	[%l7 + %o6] 0x80,	%o5
	fmovdcc	%xcc,	%f23,	%f27
	movl	%xcc,	%i4,	%o4
	set	0x78, %i2
	stxa	%o6,	[%l7 + %i2] 0x89
	ldstub	[%l7 + 0x79],	%g4
	fxor	%f12,	%f14,	%f22
	tcs	%icc,	0x6
	tneg	%xcc,	0x2
	edge8l	%o0,	%o7,	%o1
	fornot1	%f8,	%f20,	%f8
	tle	%icc,	0x1
	movre	%l5,	0x140,	%l4
	mulscc	%i3,	%i2,	%i6
	edge8n	%l0,	%g7,	%g1
	movl	%xcc,	%g2,	%g5
	faligndata	%f0,	%f16,	%f12
	movle	%xcc,	%o2,	%g3
	movrgz	%g6,	%l2,	%i5
	movcc	%icc,	%i0,	%l6
	ta	%icc,	0x2
	tl	%xcc,	0x1
	fmovdcc	%xcc,	%f25,	%f1
	fpadd32	%f12,	%f20,	%f20
	umul	%i7,	%l1,	%l3
	fble	%fcc2,	loop_2872
	call	loop_2873
	fcmpne32	%f28,	%f16,	%o3
	fbuge,a	%fcc2,	loop_2874
loop_2872:
	bn,a,pt	%xcc,	loop_2875
loop_2873:
	fpadd32s	%f20,	%f1,	%f26
	faligndata	%f0,	%f0,	%f10
loop_2874:
	array16	%o5,	%i4,	%o4
loop_2875:
	movleu	%icc,	%o6,	%i1
	umulcc	%g4,	0x0EAE,	%o0
	fbne	%fcc2,	loop_2876
	edge16l	%o7,	%l5,	%o1
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x10,	%l4
loop_2876:
	lduh	[%l7 + 0x3E],	%i2
	tle	%icc,	0x2
	edge8l	%i3,	%i6,	%g7
	fmovdcs	%icc,	%f16,	%f1
	lduw	[%l7 + 0x58],	%g1
	addcc	%g2,	0x0786,	%l0
	edge8n	%o2,	%g3,	%g5
	movvs	%xcc,	%g6,	%i5
	fmovsvc	%icc,	%f5,	%f2
	movrgez	%l2,	%l6,	%i7
	fcmpne16	%f16,	%f16,	%i0
	tvs	%xcc,	0x3
	tcs	%xcc,	0x0
	fcmple32	%f4,	%f2,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o3,	%o5
	edge32n	%i4,	%o4,	%l3
	tge	%xcc,	0x6
	stx	%i1,	[%l7 + 0x60]
	tsubcctv	%g4,	%o6,	%o0
	tsubcc	%l5,	%o7,	%l4
	orn	%i2,	%i3,	%i6
	udivcc	%o1,	0x099A,	%g1
	mulscc	%g2,	0x06C4,	%l0
	fbn,a	%fcc2,	loop_2877
	sir	0x1564
	fcmpne32	%f14,	%f24,	%g7
	fmovscs	%icc,	%f28,	%f22
loop_2877:
	movrlez	%g3,	0x240,	%g5
	tsubcc	%o2,	0x105B,	%g6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x12] %asi,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x4
	srax	%l6,	0x19,	%i7
	fpadd16	%f10,	%f16,	%f8
	addc	%i0,	%l1,	%o3
	sdiv	%l2,	0x1B05,	%i4
	mulscc	%o5,	%l3,	%i1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o4
	set	0x40, %o4
	lda	[%l7 + %o4] 0x15,	%f12
	movrlz	%g4,	%o6,	%o0
	array8	%o7,	%l4,	%i2
	bne	loop_2878
	fmovdge	%icc,	%f3,	%f23
	fmovda	%xcc,	%f8,	%f7
	srlx	%l5,	0x01,	%i6
loop_2878:
	nop
	set	0x5A, %o1
	lduha	[%l7 + %o1] 0x89,	%i3
	membar	0x7A
	fmovdpos	%icc,	%f3,	%f26
	tne	%xcc,	0x2
	movvs	%icc,	%o1,	%g2
	nop
	setx	loop_2879,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%g1,	%l0,	%g3
	and	%g7,	0x012E,	%g5
	sllx	%o2,	%i5,	%l6
loop_2879:
	tge	%xcc,	0x4
	sra	%g6,	%i7,	%i0
	brgz	%l1,	loop_2880
	edge32n	%o3,	%i4,	%l2
	orcc	%l3,	0x1C41,	%i1
	movl	%xcc,	%o4,	%o5
loop_2880:
	fmovd	%f0,	%f26
	fmovrsgz	%o6,	%f12,	%f0
	std	%f20,	[%l7 + 0x48]
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0x1
	ld	[%l7 + 0x58],	%f6
	taddcc	%o0,	%o7,	%i2
	edge16ln	%l5,	%l4,	%i3
	ldsb	[%l7 + 0x5D],	%o1
	movl	%icc,	%i6,	%g1
	tleu	%icc,	0x1
	move	%icc,	%g2,	%g3
	fpsub16	%f22,	%f10,	%f12
	st	%f17,	[%l7 + 0x5C]
	array8	%g7,	%l0,	%o2
	subc	%g5,	0x0280,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g6,	0x0929,	%i7
	addccc	%i5,	0x11D5,	%i0
	fble,a	%fcc0,	loop_2881
	orn	%l1,	0x102B,	%o3
	fmovsn	%xcc,	%f12,	%f20
	fcmpd	%fcc0,	%f8,	%f22
loop_2881:
	brgz,a	%i4,	loop_2882
	tvs	%icc,	0x6
	nop
	setx loop_2883, %l0, %l1
	jmpl %l1, %l3
	stbar
loop_2882:
	ldd	[%l7 + 0x18],	%i0
	fbne	%fcc3,	loop_2884
loop_2883:
	bg,pn	%icc,	loop_2885
	brnz,a	%o4,	loop_2886
	movneg	%xcc,	%o5,	%l2
loop_2884:
	edge16n	%o6,	%o0,	%o7
loop_2885:
	fnot1	%f30,	%f10
loop_2886:
	fmovscs	%icc,	%f2,	%f29
	edge32ln	%i2,	%g4,	%l5
	mulx	%l4,	%i3,	%i6
	fsrc2s	%f17,	%f27
	xnorcc	%o1,	0x035C,	%g2
	edge8l	%g1,	%g3,	%l0
	fcmpeq32	%f26,	%f28,	%o2
	fpack32	%f30,	%f26,	%f2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2C] %asi,	%g7
	fbu	%fcc2,	loop_2887
	flush	%l7 + 0x14
	add	%g5,	0x13FB,	%g6
	fble	%fcc3,	loop_2888
loop_2887:
	movl	%xcc,	%l6,	%i7
	fmovdn	%xcc,	%f24,	%f23
	fmul8sux16	%f8,	%f30,	%f28
loop_2888:
	fpsub16	%f0,	%f8,	%f8
	fbl,a	%fcc3,	loop_2889
	fmovdcc	%xcc,	%f22,	%f9
	tcs	%xcc,	0x0
	edge16ln	%i5,	%l1,	%i0
loop_2889:
	alignaddr	%o3,	%l3,	%i1
	fmovdleu	%icc,	%f8,	%f11
	fmovse	%xcc,	%f15,	%f24
	taddcctv	%i4,	0x1707,	%o5
	nop
	setx loop_2890, %l0, %l1
	jmpl %l1, %o4
	movl	%xcc,	%o6,	%l2
	sllx	%o0,	%o7,	%g4
	ble,a	loop_2891
loop_2890:
	taddcctv	%i2,	0x0388,	%l4
	subcc	%l5,	0x029C,	%i6
	fandnot1s	%f0,	%f18,	%f25
loop_2891:
	movgu	%icc,	%o1,	%g2
	fmovsg	%icc,	%f31,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g1,	0x04,	%g3
	ldsb	[%l7 + 0x5E],	%l0
	fpmerge	%f23,	%f28,	%f18
	array8	%i3,	%o2,	%g7
	subc	%g5,	0x009C,	%l6
	alignaddr	%g6,	%i7,	%l1
	smulcc	%i0,	0x18DB,	%o3
	ba,a,pt	%xcc,	loop_2892
	movleu	%icc,	%l3,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i4,	%i1
loop_2892:
	movrlz	%o5,	%o6,	%l2
	tl	%icc,	0x6
	xnorcc	%o0,	0x0928,	%o4
	xorcc	%g4,	0x0C2D,	%i2
	array8	%l4,	%o7,	%l5
	taddcc	%i6,	0x18BE,	%g2
	edge8l	%o1,	%g3,	%l0
	movg	%xcc,	%g1,	%o2
	fpsub32	%f24,	%f22,	%f16
	fnor	%f6,	%f8,	%f2
	sra	%i3,	0x0C,	%g7
	move	%xcc,	%g5,	%g6
	fornot1	%f22,	%f8,	%f8
	brlz	%l6,	loop_2893
	udiv	%l1,	0x0AF0,	%i0
	fxnors	%f2,	%f17,	%f15
	set	0x36, %o5
	lduba	[%l7 + %o5] 0x80,	%o3
loop_2893:
	nop
	set	0x40, %g1
	lda	[%l7 + %g1] 0x19,	%f5
	alignaddrl	%i7,	%l3,	%i5
	movle	%icc,	%i4,	%i1
	fcmpes	%fcc3,	%f9,	%f5
	orcc	%o5,	0x1400,	%o6
	movrgez	%o0,	0x32E,	%l2
	bgu,pn	%icc,	loop_2894
	movneg	%icc,	%o4,	%i2
	fmul8sux16	%f24,	%f20,	%f12
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x0c,	%g4,	%o7
loop_2894:
	fmul8x16au	%f29,	%f26,	%f16
	movre	%l4,	0x065,	%i6
	udiv	%g2,	0x1F87,	%o1
	bcs,a	loop_2895
	fnot2s	%f18,	%f0
	fornot2s	%f12,	%f19,	%f0
	edge8n	%g3,	%l5,	%g1
loop_2895:
	be,a,pt	%icc,	loop_2896
	array16	%l0,	%i3,	%o2
	movn	%xcc,	%g7,	%g5
	xnorcc	%l6,	0x19E3,	%g6
loop_2896:
	movcs	%icc,	%l1,	%o3
	ble	%xcc,	loop_2897
	alignaddrl	%i0,	%l3,	%i5
	fandnot1s	%f18,	%f12,	%f15
	subc	%i4,	%i1,	%i7
loop_2897:
	fors	%f7,	%f22,	%f14
	edge16l	%o6,	%o0,	%l2
	fmovsle	%icc,	%f20,	%f31
	umul	%o4,	%o5,	%i2
	sll	%o7,	0x15,	%g4
	sethi	0x02AD,	%l4
	andn	%i6,	0x15F0,	%o1
	siam	0x1
	movne	%icc,	%g2,	%g3
	fmovdne	%icc,	%f15,	%f25
	array16	%g1,	%l5,	%i3
	fcmpgt16	%f16,	%f12,	%o2
	udivcc	%l0,	0x0147,	%g7
	movneg	%xcc,	%l6,	%g5
	fmovsneg	%xcc,	%f19,	%f10
	tn	%xcc,	0x6
	srl	%g6,	%o3,	%l1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%l3
	fmovsneg	%xcc,	%f20,	%f28
	brgez,a	%i5,	loop_2898
	sir	0x1E3D
	srax	%i1,	%i4,	%o6
	fnot1s	%f16,	%f11
loop_2898:
	orn	%o0,	0x1E02,	%l2
	movgu	%xcc,	%o4,	%o5
	fmul8x16au	%f15,	%f16,	%f18
	movvs	%xcc,	%i2,	%o7
	andcc	%g4,	0x0E85,	%i7
	movle	%xcc,	%i6,	%l4
	tsubcc	%o1,	%g2,	%g1
	fpack16	%f2,	%f3
	fmovrsgz	%l5,	%f5,	%f11
	fandnot2	%f6,	%f14,	%f4
	movrlz	%i3,	0x36F,	%o2
	umulcc	%g3,	0x1DE7,	%l0
	srax	%g7,	%l6,	%g5
	set	0x100, %i6
	nop 	! 	nop 	! 	ldxa	[%g0 + %i6] 0x40,	%o3 ripped by fixASI40.pl ripped by fixASI40.pl
	fnors	%f0,	%f22,	%f21
	sdivcc	%g6,	0x0933,	%l1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf8
	membar	#Sync
	movcc	%icc,	%l3,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc2,	loop_2899
	fmovdleu	%icc,	%f29,	%f7
	fornot1	%f20,	%f16,	%f6
	taddcctv	%i5,	0x07FD,	%i1
loop_2899:
	fmovdcc	%xcc,	%f25,	%f27
	set	0x64, %g6
	stwa	%i4,	[%l7 + %g6] 0x23
	membar	#Sync
	movneg	%xcc,	%o0,	%l2
	sir	0x111C
	stx	%o4,	[%l7 + 0x60]
	movrlez	%o5,	0x2B3,	%i2
	fcmpne16	%f8,	%f6,	%o6
	add	%o7,	%i7,	%i6
	tn	%xcc,	0x2
	fmovdg	%icc,	%f4,	%f9
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x54] %asi,	%g4
	fmovsgu	%xcc,	%f1,	%f4
	fbl	%fcc3,	loop_2900
	sdivcc	%l4,	0x0ED6,	%o1
	movvc	%xcc,	%g2,	%g1
	edge8n	%l5,	%i3,	%g3
loop_2900:
	fbuge,a	%fcc1,	loop_2901
	brnz,a	%o2,	loop_2902
	fmovrdne	%l0,	%f16,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2901:
	movrgz	%l6,	%g5,	%o3
loop_2902:
	nop
	wr	%g0,	0x27,	%asi
	stha	%g7,	[%l7 + 0x32] %asi
	membar	#Sync
	tsubcctv	%l1,	%g6,	%i0
	fmovsge	%xcc,	%f27,	%f14
	edge8	%l3,	%i5,	%i1
	movrgz	%o0,	%i4,	%l2
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x14,	%o4
	and	%i2,	0x0C11,	%o4
	movne	%xcc,	%o7,	%i7
	srl	%i6,	0x07,	%o6
	fbu,a	%fcc2,	loop_2903
	fmovdg	%icc,	%f14,	%f14
	movg	%icc,	%l4,	%o1
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x1D] %asi,	%g2
loop_2903:
	movcs	%icc,	%g1,	%g4
	movvc	%icc,	%i3,	%g3
	std	%f0,	[%l7 + 0x20]
	nop
	setx	loop_2904,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%l5,	0x0E,	%l0
	srlx	%l6,	%g5,	%o3
	orn	%g7,	%l1,	%g6
loop_2904:
	orn	%i0,	%o2,	%i5
	array8	%l3,	%o0,	%i4
	set	0x18, %i3
	swapa	[%l7 + %i3] 0x89,	%i1
	movgu	%xcc,	%l2,	%o5
	brgez,a	%i2,	loop_2905
	mova	%xcc,	%o4,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i6,	%o6,	%i7
loop_2905:
	sll	%o1,	%g2,	%l4
	taddcc	%g1,	%g4,	%g3
	tsubcctv	%l5,	%i3,	%l6
	lduw	[%l7 + 0x34],	%g5
	fnegd	%f26,	%f22
	fbule	%fcc2,	loop_2906
	brgez	%o3,	loop_2907
	edge16ln	%g7,	%l0,	%l1
	ba	loop_2908
loop_2906:
	orn	%i0,	0x07E1,	%g6
loop_2907:
	fmul8x16	%f10,	%f22,	%f16
	wr	%g0,	0x89,	%asi
	sta	%f14,	[%l7 + 0x0C] %asi
loop_2908:
	addc	%i5,	0x19BD,	%l3
	flush	%l7 + 0x30
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o0
	fmovdl	%icc,	%f12,	%f17
	fxors	%f5,	%f12,	%f23
	tg	%icc,	0x2
	fmovrde	%o2,	%f14,	%f0
	orn	%i4,	%i1,	%l2
	edge32n	%i2,	%o5,	%o7
	tle	%xcc,	0x0
	edge32l	%i6,	%o4,	%i7
	sub	%o1,	%o6,	%l4
	stx	%g2,	[%l7 + 0x30]
	umul	%g4,	%g1,	%l5
	fexpand	%f0,	%f6
	fmovsl	%xcc,	%f20,	%f4
	fmovdgu	%xcc,	%f12,	%f27
	wr	%g0,	0x22,	%asi
	stwa	%g3,	[%l7 + 0x68] %asi
	membar	#Sync
	bvs,a	loop_2909
	movrgez	%l6,	%i3,	%o3
	mulscc	%g5,	0x1745,	%l0
	sll	%l1,	%i0,	%g7
loop_2909:
	fexpand	%f13,	%f10
	fmovde	%icc,	%f10,	%f25
	bgu,pn	%xcc,	loop_2910
	addcc	%g6,	%l3,	%o0
	fzero	%f10
	movl	%icc,	%o2,	%i5
loop_2910:
	edge16	%i1,	%l2,	%i2
	set	0x20, %i1
	lda	[%l7 + %i1] 0x0c,	%f7
	ldd	[%l7 + 0x28],	%f12
	movvs	%xcc,	%o5,	%i4
	tne	%icc,	0x4
	lduw	[%l7 + 0x3C],	%o7
	movg	%icc,	%i6,	%o4
	lduh	[%l7 + 0x60],	%o1
	set	0x6C, %l2
	sta	%f7,	[%l7 + %l2] 0x14
	bneg,pt	%icc,	loop_2911
	popc	0x0E59,	%o6
	sth	%l4,	[%l7 + 0x1E]
	fmovrslez	%i7,	%f22,	%f8
loop_2911:
	sir	0x1093
	subc	%g2,	%g1,	%g4
	fpadd16s	%f28,	%f18,	%f15
	udiv	%g3,	0x1860,	%l6
	movvc	%icc,	%l5,	%o3
	fbg	%fcc0,	loop_2912
	smulcc	%i3,	%l0,	%l1
	bne	loop_2913
	ldsw	[%l7 + 0x18],	%g5
loop_2912:
	ld	[%l7 + 0x44],	%f18
	te	%icc,	0x6
loop_2913:
	fmovrdlez	%g7,	%f14,	%f2
	movre	%i0,	0x17B,	%g6
	fpadd32	%f28,	%f26,	%f12
	subc	%o0,	0x082E,	%o2
	brgez	%l3,	loop_2914
	movcc	%xcc,	%i1,	%l2
	fandnot1s	%f7,	%f30,	%f15
	set	0x30, %o0
	ldswa	[%l7 + %o0] 0x88,	%i5
loop_2914:
	edge32l	%i2,	%o5,	%o7
	mova	%icc,	%i4,	%i6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o4
	ta	%xcc,	0x4
	movne	%icc,	%o6,	%l4
	movvc	%icc,	%o1,	%g2
	bpos	loop_2915
	and	%g1,	0x1728,	%i7
	stx	%g4,	[%l7 + 0x68]
	movre	%g3,	%l6,	%l5
loop_2915:
	swap	[%l7 + 0x48],	%o3
	array8	%i3,	%l0,	%l1
	tvs	%icc,	0x3
	bvc,a,pn	%icc,	loop_2916
	movpos	%icc,	%g7,	%i0
	siam	0x5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2916:
	ldd	[%l7 + 0x08],	%f26
	fbg	%fcc1,	loop_2917
	subccc	%g5,	0x0FC5,	%o0
	fnand	%f18,	%f20,	%f0
	sdivcc	%o2,	0x1BA9,	%l3
loop_2917:
	edge8ln	%i1,	%l2,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g6,	%i2
	movl	%icc,	%o7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pn	%icc,	loop_2918
	fand	%f16,	%f18,	%f20
	fnors	%f2,	%f18,	%f4
	movrlez	%i6,	%o5,	%o6
loop_2918:
	udivcc	%l4,	0x05DC,	%o1
	movneg	%icc,	%o4,	%g1
	edge16l	%i7,	%g2,	%g4
	edge16ln	%l6,	%l5,	%g3
	edge16	%i3,	%o3,	%l1
	movn	%xcc,	%l0,	%g7
	fandnot1	%f16,	%f28,	%f0
	alignaddrl	%g5,	%i0,	%o0
	fmuld8ulx16	%f18,	%f29,	%f2
	fmul8x16al	%f8,	%f14,	%f4
	movneg	%xcc,	%o2,	%l3
	ldx	[%l7 + 0x30],	%l2
	movn	%xcc,	%i5,	%g6
	call	loop_2919
	move	%xcc,	%i2,	%i1
	fbl	%fcc2,	loop_2920
	ldsw	[%l7 + 0x08],	%i4
loop_2919:
	tl	%xcc,	0x5
	udiv	%o7,	0x091D,	%o5
loop_2920:
	movn	%xcc,	%o6,	%i6
	umul	%l4,	%o1,	%o4
	fbug,a	%fcc0,	loop_2921
	srax	%g1,	%i7,	%g4
	movl	%icc,	%g2,	%l6
	stbar
loop_2921:
	or	%l5,	0x1217,	%g3
	fmovdle	%icc,	%f20,	%f9
	fxnors	%f4,	%f21,	%f3
	movneg	%xcc,	%i3,	%l1
	fsrc1	%f22,	%f6
	fpsub16s	%f24,	%f21,	%f16
	fmovd	%f20,	%f26
	fmovrsne	%l0,	%f23,	%f30
	set	0x50, %g2
	stda	%g6,	[%l7 + %g2] 0x18
	edge16n	%o3,	%g5,	%o0
	movrgz	%i0,	0x2B2,	%l3
	fornot1s	%f3,	%f24,	%f21
	movcc	%xcc,	%o2,	%i5
	tcc	%icc,	0x7
	array16	%g6,	%l2,	%i1
	fmovdleu	%xcc,	%f17,	%f1
	set	0x34, %g3
	swapa	[%l7 + %g3] 0x81,	%i4
	xnorcc	%o7,	0x0E6E,	%o5
	fmovdpos	%icc,	%f30,	%f12
	fmovscs	%icc,	%f7,	%f15
	ldsh	[%l7 + 0x4C],	%i2
	movpos	%xcc,	%o6,	%l4
	sir	0x1322
	fmovsa	%icc,	%f18,	%f8
	mova	%icc,	%o1,	%i6
	set	0x50, %l3
	stxa	%g1,	[%l7 + %l3] 0x88
	movge	%xcc,	%o4,	%i7
	edge8n	%g4,	%g2,	%l6
	movg	%xcc,	%l5,	%i3
	fornot2s	%f2,	%f18,	%f7
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f16
	fmovspos	%icc,	%f25,	%f6
	sdivcc	%g3,	0x1A78,	%l1
	bpos,a,pt	%icc,	loop_2922
	fmovse	%xcc,	%f15,	%f18
	movrlez	%g7,	%l0,	%o3
	movleu	%icc,	%o0,	%g5
loop_2922:
	tleu	%xcc,	0x0
	bneg,pt	%xcc,	loop_2923
	fbl	%fcc2,	loop_2924
	orncc	%i0,	%o2,	%l3
	movrne	%i5,	0x10D,	%l2
loop_2923:
	movvs	%icc,	%i1,	%g6
loop_2924:
	movge	%icc,	%o7,	%o5
	tsubcctv	%i4,	0x06AC,	%i2
	tne	%icc,	0x0
	fble	%fcc1,	loop_2925
	fornot1s	%f22,	%f0,	%f30
	te	%icc,	0x0
	udiv	%o6,	0x0B04,	%o1
loop_2925:
	fbue	%fcc3,	loop_2926
	movvs	%icc,	%l4,	%i6
	bneg,a,pn	%icc,	loop_2927
	brlez,a	%o4,	loop_2928
loop_2926:
	alignaddrl	%i7,	%g1,	%g4
	edge16	%l6,	%l5,	%i3
loop_2927:
	fmovdgu	%xcc,	%f17,	%f30
loop_2928:
	nop
	set	0x61, %g4
	lduba	[%l7 + %g4] 0x81,	%g3
	call	loop_2929
	fmovrdlz	%g2,	%f6,	%f16
	set	0x38, %l1
	swapa	[%l7 + %l1] 0x19,	%l1
loop_2929:
	movpos	%icc,	%g7,	%o3
	tne	%xcc,	0x2
	edge32	%l0,	%g5,	%o0
	fcmpne16	%f28,	%f28,	%o2
	tge	%icc,	0x7
	add	%i0,	0x1741,	%l3
	te	%icc,	0x4
	movle	%xcc,	%i5,	%i1
	movvs	%icc,	%l2,	%o7
	array8	%g6,	%i4,	%o5
	tge	%icc,	0x0
	orn	%o6,	0x1607,	%i2
	mulx	%l4,	%i6,	%o1
	andn	%i7,	0x010F,	%g1
	movvs	%xcc,	%g4,	%l6
	wr	%g0,	0x2f,	%asi
	stha	%l5,	[%l7 + 0x3A] %asi
	membar	#Sync
	fnors	%f0,	%f9,	%f1
	ta	%icc,	0x2
	array32	%i3,	%o4,	%g3
	mova	%icc,	%g2,	%l1
	fcmps	%fcc1,	%f28,	%f11
	tgu	%xcc,	0x6
	mulx	%g7,	0x05EA,	%o3
	wr	%g0,	0xe2,	%asi
	stda	%g4,	[%l7 + 0x58] %asi
	membar	#Sync
	sdiv	%o0,	0x0F10,	%l0
	tleu	%xcc,	0x1
	taddcctv	%o2,	0x126D,	%l3
	sdiv	%i0,	0x04BB,	%i1
	movvs	%icc,	%i5,	%o7
	ldx	[%l7 + 0x50],	%l2
	call	loop_2930
	sra	%g6,	%o5,	%i4
	sir	0x0ADF
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
loop_2930:
	ldsb	[%l7 + 0x49],	%l4
	movrgez	%o6,	%o1,	%i6
	sir	0x0142
	edge8ln	%i7,	%g4,	%g1
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x81,	%l6
	mova	%icc,	%l5,	%i3
	brnz,a	%o4,	loop_2931
	tle	%xcc,	0x2
	fpmerge	%f27,	%f1,	%f12
	fmovsne	%icc,	%f9,	%f28
loop_2931:
	sdiv	%g3,	0x06EF,	%l1
	set	0x77, %i5
	stba	%g2,	[%l7 + %i5] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%o3
	set	0x26, %i4
	stha	%o0,	[%l7 + %i4] 0x81
	fzeros	%f24
	ldsh	[%l7 + 0x78],	%g5
	tneg	%xcc,	0x7
	add	%o2,	0x0C2B,	%l3
	stbar
	movg	%icc,	%l0,	%i0
	bne,a	loop_2932
	fmul8x16al	%f27,	%f24,	%f10
	fba,a	%fcc2,	loop_2933
	bneg,a	loop_2934
loop_2932:
	tg	%xcc,	0x5
	umul	%i1,	0x1DAB,	%i5
loop_2933:
	edge16ln	%o7,	%g6,	%o5
loop_2934:
	fbne,a	%fcc3,	loop_2935
	bg,a,pn	%xcc,	loop_2936
	xorcc	%l2,	0x1B59,	%i2
	fbu	%fcc3,	loop_2937
loop_2935:
	and	%i4,	%o6,	%o1
loop_2936:
	edge32l	%i6,	%i7,	%l4
	ldd	[%l7 + 0x48],	%g0
loop_2937:
	membar	0x40
	fmovd	%f20,	%f4
	sdiv	%g4,	0x042B,	%l6
	movneg	%icc,	%l5,	%o4
	edge32	%i3,	%g3,	%g2
	ldsh	[%l7 + 0x5A],	%g7
	ldsw	[%l7 + 0x24],	%l1
	tn	%xcc,	0x3
	fsrc1s	%f25,	%f12
	bneg,a,pn	%icc,	loop_2938
	sdivcc	%o3,	0x1A9C,	%g5
	fxnors	%f16,	%f21,	%f22
	sra	%o2,	0x06,	%l3
loop_2938:
	and	%o0,	%l0,	%i0
	addc	%i5,	%o7,	%i1
	sethi	0x1867,	%g6
	array32	%l2,	%i2,	%o5
	fbn,a	%fcc1,	loop_2939
	tg	%xcc,	0x3
	fba,a	%fcc1,	loop_2940
	flush	%l7 + 0x34
loop_2939:
	bn	%xcc,	loop_2941
	stbar
loop_2940:
	fmovsl	%xcc,	%f4,	%f12
	fmul8x16al	%f15,	%f20,	%f8
loop_2941:
	edge16	%o6,	%i4,	%o1
	tcc	%xcc,	0x1
	taddcctv	%i7,	0x0FA6,	%i6
	alignaddr	%g1,	%l4,	%g4
	fbn	%fcc0,	loop_2942
	movcs	%icc,	%l6,	%o4
	xnor	%l5,	0x17EE,	%g3
	bn	%icc,	loop_2943
loop_2942:
	nop
	setx loop_2944, %l0, %l1
	jmpl %l1, %i3
	sub	%g2,	0x062B,	%g7
	fcmpgt16	%f10,	%f18,	%l1
loop_2943:
	fbe	%fcc0,	loop_2945
loop_2944:
	tpos	%xcc,	0x5
	movre	%g5,	%o3,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2945:
	edge8	%o0,	%l3,	%l0
	tcs	%icc,	0x7
	edge32	%i0,	%o7,	%i5
	umul	%i1,	%g6,	%i2
	xor	%o5,	0x0BB9,	%l2
	add	%i4,	%o1,	%i7
	fmovsg	%xcc,	%f23,	%f10
	alignaddr	%o6,	%i6,	%l4
	fpadd16	%f18,	%f20,	%f14
	fbug	%fcc2,	loop_2946
	swap	[%l7 + 0x08],	%g4
	fxnor	%f12,	%f8,	%f22
	subc	%g1,	%o4,	%l6
loop_2946:
	tne	%xcc,	0x6
	fone	%f16
	nop
	setx loop_2947, %l0, %l1
	jmpl %l1, %g3
	array8	%i3,	%g2,	%l5
	movl	%icc,	%l1,	%g5
	fmovsn	%xcc,	%f24,	%f21
loop_2947:
	edge16n	%g7,	%o3,	%o0
	fpackfix	%f22,	%f29
	tg	%xcc,	0x4
	te	%xcc,	0x1
	tvs	%icc,	0x5
	or	%l3,	0x0FA9,	%o2
	movn	%xcc,	%i0,	%l0
	mova	%icc,	%o7,	%i5
	umulcc	%i1,	%g6,	%i2
	ta	%xcc,	0x2
	edge8ln	%l2,	%i4,	%o1
	orncc	%o5,	%i7,	%o6
	fmul8x16au	%f17,	%f31,	%f20
	ldsw	[%l7 + 0x68],	%l4
	brlz	%g4,	loop_2948
	fmovdl	%icc,	%f12,	%f28
	tleu	%xcc,	0x0
	bleu,pn	%icc,	loop_2949
loop_2948:
	edge32ln	%g1,	%o4,	%l6
	movrgz	%i6,	%g3,	%g2
	xorcc	%i3,	%l1,	%l5
loop_2949:
	sra	%g5,	%g7,	%o3
	movrgez	%l3,	0x2B9,	%o2
	sir	0x086A
	sdiv	%i0,	0x0590,	%o0
	stbar
	wr	%g0,	0x80,	%asi
	stba	%l0,	[%l7 + 0x37] %asi
	movg	%xcc,	%i5,	%i1
	fmovsgu	%icc,	%f13,	%f23
	srax	%o7,	%g6,	%l2
	taddcc	%i4,	0x0148,	%o1
	fmovsleu	%icc,	%f23,	%f22
	tn	%xcc,	0x4
	bgu,pn	%icc,	loop_2950
	fmovrsgez	%o5,	%f23,	%f0
	fandnot1s	%f31,	%f24,	%f4
	movn	%xcc,	%i7,	%i2
loop_2950:
	or	%o6,	0x04AD,	%g4
	array8	%g1,	%o4,	%l6
	fba,a	%fcc0,	loop_2951
	edge16n	%l4,	%i6,	%g3
	andn	%i3,	0x082B,	%l1
	fbe	%fcc3,	loop_2952
loop_2951:
	ldd	[%l7 + 0x30],	%l4
	andcc	%g5,	%g2,	%o3
	tne	%xcc,	0x5
loop_2952:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f2,	%f31,	%f6
	alignaddr	%l3,	%g7,	%i0
	xnor	%o0,	0x09DC,	%o2
	tvs	%xcc,	0x1
	fbuge,a	%fcc3,	loop_2953
	umulcc	%i5,	%l0,	%i1
	tpos	%xcc,	0x7
	sdivx	%g6,	0x111A,	%l2
loop_2953:
	movrne	%o7,	0x2D9,	%o1
	edge32l	%i4,	%o5,	%i2
	move	%icc,	%o6,	%i7
	fble	%fcc1,	loop_2954
	smul	%g1,	%o4,	%l6
	srax	%g4,	0x1E,	%l4
	tle	%icc,	0x7
loop_2954:
	nop
	set	0x44, %o3
	lda	[%l7 + %o3] 0x80,	%f0
	edge8n	%i6,	%i3,	%l1
	tg	%icc,	0x7
	pdist	%f30,	%f2,	%f20
	tneg	%xcc,	0x3
	fmovsne	%icc,	%f19,	%f25
	xnor	%l5,	0x028B,	%g3
	fmovsvs	%xcc,	%f7,	%f3
	nop
	setx	loop_2955,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%g2,	0x1A37,	%o3
	sdivx	%l3,	0x09F8,	%g7
	fmovsneg	%xcc,	%f24,	%f19
loop_2955:
	popc	%i0,	%g5
	bl,a,pn	%xcc,	loop_2956
	fbl,a	%fcc3,	loop_2957
	edge16	%o0,	%o2,	%l0
	sdiv	%i1,	0x0F4E,	%g6
loop_2956:
	bshuffle	%f12,	%f30,	%f14
loop_2957:
	flush	%l7 + 0x34
	addcc	%l2,	0x0055,	%i5
	tsubcctv	%o1,	%i4,	%o5
	fmovsn	%icc,	%f17,	%f13
	movre	%o7,	%i2,	%i7
	movge	%xcc,	%g1,	%o4
	movg	%icc,	%l6,	%o6
	tg	%xcc,	0x2
	fmuld8sux16	%f4,	%f3,	%f2
	fbue	%fcc0,	loop_2958
	fmovse	%xcc,	%f11,	%f26
	tn	%xcc,	0x3
	tleu	%icc,	0x6
loop_2958:
	bcc	%icc,	loop_2959
	fmovdgu	%xcc,	%f24,	%f22
	xor	%l4,	%g4,	%i6
	movleu	%icc,	%i3,	%l5
loop_2959:
	sdivcc	%g3,	0x1A32,	%l1
	sdivcc	%o3,	0x0211,	%g2
	movle	%xcc,	%l3,	%i0
	fornot2	%f2,	%f4,	%f12
	tl	%xcc,	0x0
	fpsub32	%f20,	%f0,	%f20
	sdivx	%g7,	0x1BAB,	%g5
	sllx	%o2,	0x1E,	%o0
	nop
	setx loop_2960, %l0, %l1
	jmpl %l1, %i1
	tne	%xcc,	0x7
	call	loop_2961
	bleu	loop_2962
loop_2960:
	move	%xcc,	%g6,	%l0
	movrgz	%i5,	%l2,	%i4
loop_2961:
	tvs	%icc,	0x3
loop_2962:
	stbar
	movvs	%xcc,	%o5,	%o7
	sth	%i2,	[%l7 + 0x4C]
	fblg,a	%fcc0,	loop_2963
	tn	%xcc,	0x1
	fba,a	%fcc2,	loop_2964
	umulcc	%o1,	%g1,	%i7
loop_2963:
	nop
	set	0x60, %g7
	prefetcha	[%l7 + %g7] 0x10,	 0x1
loop_2964:
	srax	%o4,	0x0E,	%o6
	brgz	%g4,	loop_2965
	sll	%i6,	0x0D,	%i3
	ta	%icc,	0x4
	tne	%xcc,	0x4
loop_2965:
	fabsd	%f24,	%f14
	fcmpgt16	%f22,	%f10,	%l4
	fnot1s	%f3,	%f21
	movgu	%icc,	%l5,	%l1
	movle	%icc,	%o3,	%g3
	fnot1s	%f3,	%f14
	tcc	%icc,	0x0
	movneg	%icc,	%g2,	%i0
	mulx	%l3,	0x086A,	%g7
	fands	%f13,	%f13,	%f12
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x60] %asi,	%g5
	siam	0x6
	umulcc	%o0,	%o2,	%g6
	fmovsg	%icc,	%f8,	%f12
	sdivx	%l0,	0x165C,	%i5
	move	%icc,	%l2,	%i4
	bpos,a	%icc,	loop_2966
	sdiv	%i1,	0x0C4C,	%o5
	orncc	%o7,	0x0103,	%i2
	fmul8x16	%f4,	%f30,	%f22
loop_2966:
	edge32ln	%o1,	%i7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x42, %l6
	stba	%o4,	[%l7 + %l6] 0x0c
	fbue,a	%fcc1,	loop_2967
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x2C],	%o6
	fmovdvs	%xcc,	%f23,	%f22
loop_2967:
	fpmerge	%f17,	%f9,	%f2
	fbug,a	%fcc2,	loop_2968
	fxors	%f26,	%f9,	%f31
	fnand	%f26,	%f12,	%f26
	array8	%g4,	%i6,	%l6
loop_2968:
	sethi	0x0ED0,	%i3
	orcc	%l5,	0x05C7,	%l1
	add	%l4,	0x0604,	%g3
	edge8n	%g2,	%i0,	%o3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%l3
	set	0x08, %g5
	stxa	%g7,	[%l7 + %g5] 0xe3
	membar	#Sync
	sra	%g5,	%o0,	%g6
	bn,a,pt	%xcc,	loop_2969
	fbg,a	%fcc2,	loop_2970
	tneg	%xcc,	0x7
	movre	%o2,	%l0,	%i5
loop_2969:
	nop
	set	0x6E, %l5
	ldsha	[%l7 + %l5] 0x10,	%i4
loop_2970:
	fmuld8sux16	%f17,	%f0,	%f18
	array8	%i1,	%l2,	%o7
	sdivcc	%i2,	0x1841,	%o1
	fand	%f0,	%f28,	%f28
	umulcc	%o5,	%g1,	%i7
	tcc	%xcc,	0x4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	std	%f4,	[%l7 + 0x30]
	edge8	%o6,	%g4,	%i6
	movne	%icc,	%o4,	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%l5
	udivx	%i3,	0x0D05,	%l4
	fnegd	%f4,	%f6
	xor	%g3,	0x0690,	%l1
	tg	%icc,	0x7
	movrne	%i0,	%o3,	%g2
	movn	%xcc,	%g7,	%l3
	xnor	%o0,	0x0B58,	%g5
	nop
	set	0x68, %o6
	stx	%g6,	[%l7 + %o6]
	tsubcctv	%l0,	0x1660,	%i5
	fbl	%fcc3,	loop_2971
	membar	0x7E
	tge	%xcc,	0x4
	popc	0x06C7,	%i4
loop_2971:
	andncc	%i1,	%o2,	%o7
	tne	%xcc,	0x5
	fbo,a	%fcc2,	loop_2972
	fmovdgu	%xcc,	%f26,	%f29
	fmul8ulx16	%f20,	%f14,	%f22
	add	%l2,	%o1,	%o5
loop_2972:
	be,a	loop_2973
	movne	%icc,	%i2,	%i7
	movrne	%g1,	0x159,	%g4
	movneg	%icc,	%i6,	%o6
loop_2973:
	movge	%xcc,	%l6,	%l5
	be,a,pn	%icc,	loop_2974
	tneg	%xcc,	0x2
	bg	loop_2975
	tvc	%icc,	0x2
loop_2974:
	srl	%i3,	0x13,	%o4
	fmovdvc	%icc,	%f29,	%f15
loop_2975:
	nop
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x18,	%f16
	edge16	%l4,	%g3,	%l1
	ldub	[%l7 + 0x59],	%o3
	fbo,a	%fcc1,	loop_2976
	movpos	%icc,	%i0,	%g2
	orncc	%g7,	%o0,	%l3
	udivcc	%g5,	0x0606,	%g6
loop_2976:
	movrgez	%i5,	%l0,	%i4
	andn	%i1,	%o2,	%o7
	sub	%l2,	%o5,	%o1
	sub	%i7,	0x0329,	%g1
	tne	%xcc,	0x4
	sub	%g4,	%i6,	%o6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	array32	%i2,	%l5,	%l6
	ldx	[%l7 + 0x58],	%o4
	sdiv	%i3,	0x02E4,	%g3
	fxnor	%f20,	%f26,	%f6
	fands	%f15,	%f27,	%f13
	sdivcc	%l4,	0x0C3A,	%o3
	swap	[%l7 + 0x7C],	%i0
	tpos	%xcc,	0x2
	fmovdne	%xcc,	%f3,	%f3
	taddcc	%l1,	%g2,	%g7
	fpsub32s	%f8,	%f15,	%f10
	ld	[%l7 + 0x78],	%f27
	fmovdvs	%xcc,	%f19,	%f30
	taddcctv	%l3,	%g5,	%o0
	fnands	%f24,	%f29,	%f14
	fbl	%fcc2,	loop_2977
	sra	%i5,	%g6,	%l0
	tl	%xcc,	0x1
	tvs	%icc,	0x4
loop_2977:
	fcmpeq32	%f12,	%f0,	%i4
	tl	%icc,	0x6
	fmul8x16	%f24,	%f20,	%f14
	sir	0x02B3
	fmovse	%icc,	%f15,	%f1
	and	%o2,	%i1,	%o7
	tcc	%xcc,	0x0
	movn	%xcc,	%o5,	%l2
	nop
	set	0x76, %i2
	stb	%o1,	[%l7 + %i2]
	fexpand	%f15,	%f14
	edge16ln	%g1,	%i7,	%g4
	fbue,a	%fcc1,	loop_2978
	srlx	%i6,	%o6,	%i2
	membar	0x45
	brgz,a	%l5,	loop_2979
loop_2978:
	fpmerge	%f21,	%f17,	%f12
	array32	%o4,	%l6,	%i3
	edge8l	%g3,	%l4,	%o3
loop_2979:
	umulcc	%i0,	%g2,	%g7
	lduw	[%l7 + 0x3C],	%l1
	popc	%l3,	%g5
	fpack32	%f30,	%f20,	%f20
	sll	%i5,	%o0,	%l0
	fblg	%fcc1,	loop_2980
	fbo,a	%fcc1,	loop_2981
	array16	%i4,	%o2,	%g6
	sethi	0x0EE8,	%o7
loop_2980:
	brlez,a	%o5,	loop_2982
loop_2981:
	subc	%l2,	0x0F51,	%i1
	fandnot1	%f28,	%f20,	%f20
	fsrc2	%f20,	%f22
loop_2982:
	bge,a	%icc,	loop_2983
	array8	%o1,	%g1,	%g4
	sdiv	%i7,	0x178C,	%o6
	tvc	%icc,	0x0
loop_2983:
	edge8	%i2,	%l5,	%i6
	movvs	%xcc,	%o4,	%i3
	bneg,a	loop_2984
	sth	%l6,	[%l7 + 0x7A]
	fcmpeq16	%f0,	%f8,	%g3
	umulcc	%o3,	0x1026,	%l4
loop_2984:
	fsrc2s	%f19,	%f10
	tn	%icc,	0x1
	tle	%icc,	0x3
	udivcc	%g2,	0x1E6E,	%g7
	movre	%l1,	0x13F,	%l3
	movg	%icc,	%g5,	%i5
	taddcc	%i0,	%o0,	%l0
	udivcc	%o2,	0x0B11,	%i4
	fbug,a	%fcc3,	loop_2985
	edge16	%g6,	%o5,	%l2
	xorcc	%i1,	%o7,	%o1
	set	0x42, %o4
	stha	%g4,	[%l7 + %o4] 0x14
loop_2985:
	tle	%icc,	0x3
	fbug,a	%fcc1,	loop_2986
	bge,pt	%xcc,	loop_2987
	alignaddr	%i7,	%g1,	%i2
	mulscc	%o6,	0x09BB,	%l5
loop_2986:
	fandnot1s	%f11,	%f17,	%f8
loop_2987:
	edge8l	%i6,	%o4,	%l6
	umul	%i3,	0x0820,	%g3
	faligndata	%f28,	%f30,	%f20
	movn	%icc,	%o3,	%g2
	taddcctv	%l4,	0x09E2,	%l1
	tne	%icc,	0x5
	ldx	[%l7 + 0x08],	%g7
	movcs	%xcc,	%g5,	%l3
	orncc	%i5,	0x1943,	%i0
	or	%o0,	0x06DD,	%l0
	tl	%xcc,	0x5
	tpos	%icc,	0x7
	set	0x32, %o2
	lduha	[%l7 + %o2] 0x11,	%i4
	move	%xcc,	%o2,	%o5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x89
	bge,pn	%xcc,	loop_2988
	bne,a,pt	%xcc,	loop_2989
	tcc	%xcc,	0x1
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf1,	%f16
loop_2988:
	fblg,a	%fcc1,	loop_2990
loop_2989:
	edge8n	%g6,	%i1,	%o7
	fmovsle	%xcc,	%f20,	%f13
	sdiv	%o1,	0x1BE8,	%l2
loop_2990:
	tleu	%xcc,	0x0
	bvs,a	loop_2991
	brnz,a	%i7,	loop_2992
	bg	%xcc,	loop_2993
	edge32ln	%g1,	%i2,	%o6
loop_2991:
	stx	%l5,	[%l7 + 0x60]
loop_2992:
	fpack32	%f28,	%f30,	%f2
loop_2993:
	fzero	%f20
	subcc	%g4,	%i6,	%o4
	fmovscs	%icc,	%f11,	%f11
	or	%l6,	0x127B,	%i3
	edge32n	%o3,	%g3,	%g2
	tvs	%xcc,	0x2
	xnorcc	%l4,	0x1569,	%l1
	edge8n	%g5,	%l3,	%i5
	subcc	%i0,	%g7,	%o0
	bgu,a,pt	%xcc,	loop_2994
	fpadd32s	%f14,	%f31,	%f27
	siam	0x7
	fnot1s	%f30,	%f29
loop_2994:
	bge,pt	%xcc,	loop_2995
	popc	%i4,	%l0
	prefetch	[%l7 + 0x4C],	 0x1
	xnorcc	%o5,	0x0200,	%g6
loop_2995:
	movneg	%icc,	%i1,	%o2
	srax	%o7,	0x0E,	%o1
	movcs	%icc,	%i7,	%l2
	addcc	%g1,	0x19D0,	%o6
	andn	%l5,	0x0DF1,	%g4
	movre	%i6,	0x310,	%i2
	udivx	%o4,	0x11ED,	%i3
	array16	%l6,	%o3,	%g2
	edge32ln	%l4,	%g3,	%g5
	sub	%l1,	%i5,	%i0
	umulcc	%l3,	%g7,	%o0
	srlx	%l0,	%i4,	%o5
	tgu	%icc,	0x2
	fbne,a	%fcc0,	loop_2996
	umulcc	%i1,	0x1AD8,	%g6
	movn	%icc,	%o7,	%o1
	nop
	setx	loop_2997,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2996:
	tsubcctv	%i7,	%l2,	%o2
	sethi	0x1D2D,	%o6
	movleu	%icc,	%g1,	%g4
loop_2997:
	edge8	%l5,	%i2,	%o4
	movrlez	%i3,	0x103,	%l6
	tl	%xcc,	0x4
	or	%i6,	%o3,	%g2
	ldsw	[%l7 + 0x68],	%g3
	fmovdvs	%xcc,	%f20,	%f29
	prefetch	[%l7 + 0x68],	 0x2
	ldd	[%l7 + 0x48],	%f0
	fmovsa	%icc,	%f11,	%f1
	fxnor	%f20,	%f0,	%f4
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g5
	ldsh	[%l7 + 0x24],	%l4
	ta	%icc,	0x4
	andncc	%i5,	%i0,	%l1
	edge8	%l3,	%g7,	%o0
	tleu	%icc,	0x5
	array8	%i4,	%l0,	%i1
	smul	%g6,	0x165E,	%o7
	movneg	%xcc,	%o1,	%i7
	andncc	%l2,	%o5,	%o2
	ldstub	[%l7 + 0x61],	%o6
	array16	%g4,	%l5,	%g1
	brnz	%i2,	loop_2998
	fcmple16	%f0,	%f16,	%o4
	sth	%l6,	[%l7 + 0x7A]
	umulcc	%i6,	0x0469,	%o3
loop_2998:
	movle	%icc,	%i3,	%g2
	movcc	%xcc,	%g3,	%g5
	edge8	%l4,	%i0,	%l1
	be	loop_2999
	ta	%icc,	0x3
	sethi	0x094C,	%l3
	set	0x22, %i6
	stha	%g7,	[%l7 + %i6] 0x27
	membar	#Sync
loop_2999:
	edge8n	%o0,	%i4,	%l0
	movge	%icc,	%i1,	%i5
	lduw	[%l7 + 0x6C],	%g6
	movne	%icc,	%o1,	%o7
	fmovdcs	%icc,	%f21,	%f17
	te	%icc,	0x5
	fmovsleu	%xcc,	%f10,	%f26
	movvs	%xcc,	%i7,	%l2
	fmovsgu	%xcc,	%f5,	%f16
	sir	0x0A1A
	fpack16	%f20,	%f31
	fmovdneg	%xcc,	%f11,	%f1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	set	0x58, %l4
	swapa	[%l7 + %l4] 0x10,	%o6
	subcc	%o5,	0x1A5F,	%l5
	movcc	%icc,	%g4,	%g1
	movgu	%icc,	%o4,	%i2
	set	0x0F, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l6
	udiv	%o3,	0x1D3F,	%i6
	fzeros	%f25
	sdivx	%i3,	0x14A8,	%g2
	fxors	%f19,	%f20,	%f21
	sdivcc	%g5,	0x0826,	%g3
	movrgez	%i0,	%l4,	%l1
	taddcctv	%l3,	0x17EB,	%g7
	srlx	%i4,	0x0A,	%o0
	set	0x56, %g1
	ldsha	[%l7 + %g1] 0x81,	%i1
	sub	%l0,	%i5,	%g6
	srlx	%o1,	%i7,	%l2
	edge16l	%o2,	%o7,	%o6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l5
	stbar
	fbu	%fcc3,	loop_3000
	fnegs	%f4,	%f4
	popc	%g4,	%g1
	fmul8x16al	%f12,	%f17,	%f2
loop_3000:
	nop
	set	0x30, %l0
	stba	%o4,	[%l7 + %l0] 0x14
	tn	%icc,	0x5
	tle	%xcc,	0x0
	fmovsgu	%xcc,	%f7,	%f17
	fcmpes	%fcc0,	%f10,	%f26
	move	%icc,	%i2,	%l6
	fnegd	%f20,	%f30
	tl	%xcc,	0x2
	sdivcc	%o5,	0x156F,	%i6
	te	%icc,	0x7
	ldub	[%l7 + 0x69],	%i3
	tcc	%xcc,	0x2
	fmul8ulx16	%f2,	%f24,	%f28
	bgu,a,pn	%icc,	loop_3001
	movle	%xcc,	%g2,	%g5
	brnz	%o3,	loop_3002
	movle	%icc,	%g3,	%i0
loop_3001:
	nop
	wr	%g0,	0x2f,	%asi
	stda	%l0,	[%l7 + 0x38] %asi
	membar	#Sync
loop_3002:
	nop
	set	0x38, %i1
	std	%f8,	[%l7 + %i1]
	mova	%xcc,	%l3,	%l4
	movge	%xcc,	%i4,	%o0
	be,a,pn	%icc,	loop_3003
	andncc	%i1,	%l0,	%g7
	fbu	%fcc1,	loop_3004
	fmuld8sux16	%f28,	%f2,	%f8
loop_3003:
	fbg	%fcc2,	loop_3005
	tge	%icc,	0x0
loop_3004:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%i5,	[%l7 + 0x78] %asi
loop_3005:
	subccc	%g6,	0x0973,	%i7
	lduh	[%l7 + 0x4E],	%l2
	xor	%o2,	%o7,	%o6
	sll	%o1,	0x1C,	%l5
	addcc	%g1,	%o4,	%i2
	fbug	%fcc2,	loop_3006
	fmovrdlz	%l6,	%f10,	%f30
	bl	%xcc,	loop_3007
	addccc	%g4,	%o5,	%i3
loop_3006:
	mulscc	%g2,	0x1586,	%i6
	brlz,a	%g5,	loop_3008
loop_3007:
	alignaddr	%o3,	%g3,	%i0
	subccc	%l1,	%l3,	%i4
	bcc	loop_3009
loop_3008:
	edge32ln	%l4,	%i1,	%o0
	fmovsg	%xcc,	%f24,	%f17
	fmovdgu	%xcc,	%f26,	%f7
loop_3009:
	addccc	%l0,	%g7,	%g6
	fbl,a	%fcc1,	loop_3010
	addcc	%i5,	0x0A64,	%l2
	umulcc	%i7,	0x0AF1,	%o7
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x18,	 0x1
loop_3010:
	fnors	%f21,	%f7,	%f21
	tsubcc	%o1,	%l5,	%g1
	edge8l	%o6,	%i2,	%l6
	brlz,a	%o4,	loop_3011
	sethi	0x0C73,	%o5
	fnegs	%f18,	%f11
	tn	%icc,	0x0
loop_3011:
	nop
	wr	%g0,	0x0c,	%asi
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2786
!	Type cti   	: 3011
!	Type x   	: 1295
!	Type f   	: 4530
!	Type i   	: 13378
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xC32C10BB
.word 0xC5D02204
.word 0xD2EEF875
.word 0x35D6ED35
.word 0xF3F7F430
.word 0x1CC909D9
.word 0xF4F569D9
.word 0x065CB4FB
.word 0xC81059C6
.word 0xE7EA6D7F
.word 0x9BA93A7C
.word 0x01B04691
.word 0xC8DC5951
.word 0xB930AA4D
.word 0xF9D13FFF
.word 0xE667538C
.word 0x9CCED799
.word 0x034D168E
.word 0xA6934F03
.word 0x1DAFAF8D
.word 0xFA347865
.word 0x08EE537D
.word 0xD57F82F7
.word 0x7A05F452
.word 0xA8E4BCF9
.word 0xE77E159A
.word 0xB9174253
.word 0x2E7DEA95
.word 0x68F4F0B1
.word 0x9C60AA96
.word 0xCAFE8E4D
.word 0x10A30CC1
.word 0x805C1DED
.word 0x4F17E4B4
.word 0x8E350695
.word 0x9B25AB92
.word 0xBB283A6E
.word 0x319AE172
.word 0x449D18EB
.word 0xA8D02DD0
.word 0x402EEE99
.word 0xDDE081DD
.word 0xFEA2EA3F
.word 0xD8B091D8
.word 0xD98D29A6
.word 0xCBE45BBC
.word 0xA948288E
.word 0x10EDDC8A
.word 0x3A706E63
.word 0xB8F3BCF5
.word 0x213FDFEF
.word 0xB9232D05
.word 0x950135D2
.word 0x27763F76
.word 0x791F1AA8
.word 0x526D871C
.word 0x1AA2AEA7
.word 0x60A9E315
.word 0x39183051
.word 0xD528710C
.word 0x0F6FBF00
.word 0x173B0CD6
.word 0x607199E2
.word 0x37ACB420
.end
