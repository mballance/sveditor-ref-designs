/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f14.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f14.s,v 1.1 2007/05/11 17:22:26 drp Exp $"
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
	setx	0x5BE436E98050A87D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0x4,	%g2
	set	0x5,	%g3
	set	0x3,	%g4
	set	0xA,	%g5
	set	0x6,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xB,	%i1
	set	-0x3,	%i2
	set	-0x9,	%i3
	set	-0x8,	%i4
	set	-0xE,	%i5
	set	-0x3,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x08088AC4,	%l0
	set	0x55F4F8A7,	%l1
	set	0x1BD13897,	%l2
	set	0x3A8C6BB6,	%l3
	set	0x6E753FE3,	%l4
	set	0x44C135AB,	%l5
	set	0x0D0AC190,	%l6
	!# Output registers
	set	-0x1814,	%o0
	set	-0x156C,	%o1
	set	-0x0EB6,	%o2
	set	0x022C,	%o3
	set	0x15FD,	%o4
	set	0x1CBF,	%o5
	set	-0x1E70,	%o6
	set	0x1BA6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xFFED6F1F43416CAA)
	INIT_TH_FP_REG(%l7,%f2,0xCE4E5013348F8B2D)
	INIT_TH_FP_REG(%l7,%f4,0xF60677111EBFE2BB)
	INIT_TH_FP_REG(%l7,%f6,0xBD864176B50D5C18)
	INIT_TH_FP_REG(%l7,%f8,0x1C36D05C3DF18CDD)
	INIT_TH_FP_REG(%l7,%f10,0x524255BC2809EE11)
	INIT_TH_FP_REG(%l7,%f12,0x7C67410EA25C96F0)
	INIT_TH_FP_REG(%l7,%f14,0x57F0CA8ED664E4E2)
	INIT_TH_FP_REG(%l7,%f16,0x6F435A369729FE7E)
	INIT_TH_FP_REG(%l7,%f18,0xFED24585B98054B5)
	INIT_TH_FP_REG(%l7,%f20,0x0D16C82FF7630549)
	INIT_TH_FP_REG(%l7,%f22,0x72F11EDBBC8D8210)
	INIT_TH_FP_REG(%l7,%f24,0x1FAFA09779AF0E4A)
	INIT_TH_FP_REG(%l7,%f26,0x244B8ED2213C2AF4)
	INIT_TH_FP_REG(%l7,%f28,0x31228FD7580C2A07)
	INIT_TH_FP_REG(%l7,%f30,0xB4BCCD6ACD8F39FA)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	array32	%i1,	%o1,	%l4
	movpos	%xcc,	%o3,	%l5
	alignaddrl	%i2,	%i6,	%g2
	tl	%icc,	0x6
	fmovrdgz	%o0,	%f6,	%f18
	tn	%icc,	0x0
	te	%xcc,	0x7
	edge8	%l3,	%l2,	%i4
	ldsw	[%l7 + 0x48],	%o7
	sethi	0x18E0,	%g7
	movre	%g6,	0x3D8,	%i5
	tcc	%icc,	0x5
	alignaddrl	%o4,	%g3,	%g4
	nop
	set	0x20, %i1
	stx	%g5,	[%l7 + %i1]
	brnz,a	%l6,	loop_1
	ldsb	[%l7 + 0x2B],	%l0
	xnor	%i0,	%g1,	%o2
	edge16ln	%o6,	%l1,	%i7
loop_1:
	edge32	%o5,	%i1,	%o1
	orcc	%l4,	0x167D,	%i3
	set	0x14, %g6
	stwa	%o3,	[%l7 + %g6] 0x2b
	membar	#Sync
	movl	%icc,	%i2,	%l5
	fandnot2s	%f25,	%f2,	%f21
	srlx	%i6,	0x1F,	%o0
	taddcc	%l3,	0x0DF0,	%l2
	edge8ln	%i4,	%g2,	%g7
	set	0x7F, %l2
	ldstuba	[%l7 + %l2] 0x19,	%o7
	tpos	%xcc,	0x7
	fbe,a	%fcc1,	loop_2
	edge16	%g6,	%o4,	%g3
	nop
	fitos	%f21,	%f1
	fnors	%f11,	%f17,	%f20
loop_2:
	fmovd	%f0,	%f8
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i5
	edge16n	%g5,	%l6,	%g4
	tvs	%xcc,	0x2
	andcc	%i0,	0x0EA9,	%g1
	udiv	%o2,	0x1221,	%l0
	fsrc2s	%f23,	%f15
	sll	%l1,	0x01,	%i7
	mulx	%o5,	0x0E63,	%i1
	movrgz	%o1,	%l4,	%i3
	subccc	%o3,	%o6,	%i2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x19,	%l5,	%i6
	orcc	%o0,	%l3,	%l2
	fmovdvs	%icc,	%f27,	%f0
	tgu	%xcc,	0x6
	tn	%xcc,	0x4
	fbl,a	%fcc2,	loop_3
	bleu	loop_4
	movcs	%xcc,	%g2,	%g7
	fbg	%fcc3,	loop_5
loop_3:
	and	%o7,	%i4,	%g6
loop_4:
	mulx	%g3,	%o4,	%i5
	tsubcctv	%l6,	0x1408,	%g4
loop_5:
	sth	%g5,	[%l7 + 0x5A]
	or	%g1,	0x0AB5,	%o2
	sll	%i0,	%l0,	%i7
	fbo,a	%fcc3,	loop_6
	edge16ln	%o5,	%i1,	%l1
	ldx	[%l7 + 0x40],	%l4
	fbu,a	%fcc3,	loop_7
loop_6:
	edge32l	%i3,	%o1,	%o6
	sdivcc	%i2,	0x083B,	%o3
	fmovsneg	%xcc,	%f17,	%f24
loop_7:
	fpmerge	%f6,	%f28,	%f8
	fors	%f20,	%f20,	%f24
	fbue,a	%fcc3,	loop_8
	fsrc1	%f2,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x28],	%l5
loop_8:
	movneg	%icc,	%i6,	%l3
	orncc	%o0,	%g2,	%g7
	std	%f12,	[%l7 + 0x50]
	tn	%xcc,	0x7
	bpos,a	%xcc,	loop_9
	subc	%o7,	0x1542,	%i4
	fmovdvs	%icc,	%f26,	%f11
	sth	%l2,	[%l7 + 0x10]
loop_9:
	smul	%g6,	%o4,	%i5
	swap	[%l7 + 0x54],	%l6
	sethi	0x1116,	%g3
	array32	%g5,	%g4,	%g1
	pdist	%f16,	%f14,	%f22
	move	%xcc,	%o2,	%l0
	bpos,a,pt	%icc,	loop_10
	fnot1	%f18,	%f22
	brgz	%i7,	loop_11
	st	%f10,	[%l7 + 0x5C]
loop_10:
	movre	%o5,	0x235,	%i1
	xnorcc	%l1,	0x00DF,	%i0
loop_11:
	call	loop_12
	movrgez	%l4,	0x21E,	%o1
	edge16ln	%o6,	%i2,	%o3
	array16	%l5,	%i3,	%i6
loop_12:
	mulx	%o0,	0x049E,	%g2
	smulcc	%g7,	%l3,	%i4
	ldub	[%l7 + 0x43],	%l2
	sir	0x1920
	alignaddrl	%g6,	%o4,	%o7
	tleu	%xcc,	0x0
	fbl	%fcc0,	loop_13
	fmovdn	%xcc,	%f8,	%f27
	nop
	fitos	%f24,	%f9
	xor	%i5,	%l6,	%g3
loop_13:
	edge8n	%g5,	%g4,	%g1
	srax	%l0,	0x18,	%i7
	nop
	setx	0x02F3A7E4406C0DEA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	setx	0xDAA5D1DFBED03DDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0EA494E5CFA587EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f0,	%f10
	ldd	[%l7 + 0x18],	%f8
	fpadd16s	%f29,	%f12,	%f5
	movge	%xcc,	%o2,	%o5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%l1
	brlez	%i0,	loop_14
	movcs	%xcc,	%l4,	%i1
	fmovrsgez	%o1,	%f26,	%f22
	set	0x72, %o4
	stba	%i2,	[%l7 + %o4] 0x2b
	membar	#Sync
loop_14:
	bg,a	loop_15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%o3,	%i3
	nop
	setx	0x70787280,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
loop_15:
	fnot1	%f4,	%f12
	edge8n	%l5,	%o0,	%i6
	brnz	%g7,	loop_16
	bg,pt	%icc,	loop_17
	lduw	[%l7 + 0x10],	%g2
	call	loop_18
loop_16:
	edge16n	%l3,	%i4,	%l2
loop_17:
	movpos	%xcc,	%o4,	%o7
	stw	%i5,	[%l7 + 0x7C]
loop_18:
	sllx	%g6,	%g3,	%g5
	fcmpgt32	%f8,	%f6,	%g4
	udivcc	%g1,	0x0B38,	%l6
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i7
	subccc	%o2,	%o5,	%l0
	fbge	%fcc0,	loop_19
	tleu	%xcc,	0x6
	edge32l	%l1,	%l4,	%i0
	wr	%g0,	0x04,	%asi
	stxa	%i1,	[%l7 + 0x10] %asi
loop_19:
	tsubcc	%i2,	%o1,	%o3
	and	%i3,	%l5,	%o6
	fmovrdgez	%o0,	%f22,	%f12
	fcmpeq16	%f12,	%f28,	%i6
	brgez	%g7,	loop_20
	movl	%xcc,	%g2,	%l3
	alignaddrl	%l2,	%i4,	%o7
	xnor	%i5,	%o4,	%g3
loop_20:
	mulscc	%g6,	0x02B8,	%g4
	xnorcc	%g1,	0x12D5,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x12C0
	stbar
	fxors	%f27,	%f1,	%f21
	bge,a	%xcc,	loop_21
	tvc	%xcc,	0x0
	andcc	%g5,	%o2,	%i7
	movg	%icc,	%l0,	%o5
loop_21:
	movn	%icc,	%l4,	%l1
	movl	%icc,	%i0,	%i2
	and	%o1,	%i1,	%o3
	fmovscc	%xcc,	%f27,	%f6
	edge8n	%i3,	%l5,	%o0
	sdivx	%o6,	0x0C66,	%g7
	fmovsg	%icc,	%f3,	%f27
	movge	%xcc,	%g2,	%i6
	ble,pn	%icc,	loop_22
	mulscc	%l3,	0x0EC2,	%i4
	sub	%l2,	0x0950,	%o7
	movrlez	%i5,	0x23E,	%g3
loop_22:
	fbo	%fcc0,	loop_23
	edge8l	%o4,	%g4,	%g6
	sethi	0x1F4A,	%g1
	fmovspos	%icc,	%f23,	%f13
loop_23:
	nop
	setx	loop_24,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%l6,	%o2,	%g5
	ba	%icc,	loop_25
	fcmpne32	%f30,	%f28,	%l0
loop_24:
	move	%xcc,	%o5,	%l4
	addc	%l1,	0x09BD,	%i0
loop_25:
	bneg,a,pt	%icc,	loop_26
	ta	%icc,	0x7
	subcc	%i2,	0x01C4,	%i7
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x89,	%o1
loop_26:
	edge32l	%i1,	%i3,	%o3
	nop
	setx	0xE5DB7702E06047FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	tcs	%xcc,	0x5
	edge32ln	%o0,	%l5,	%g7
	fmovsvs	%xcc,	%f29,	%f10
	tne	%icc,	0x5
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x15] %asi,	%g2
	andn	%i6,	0x0435,	%l3
	movcc	%xcc,	%o6,	%l2
	fpack32	%f14,	%f30,	%f14
	add	%i4,	%o7,	%i5
	st	%f21,	[%l7 + 0x64]
	movneg	%icc,	%g3,	%o4
	movrgez	%g4,	%g1,	%l6
	movge	%icc,	%g6,	%g5
	array32	%l0,	%o2,	%o5
	tvs	%xcc,	0x3
	sub	%l4,	%i0,	%l1
	bg,pt	%icc,	loop_27
	movneg	%xcc,	%i7,	%o1
	edge32l	%i1,	%i3,	%o3
	movleu	%xcc,	%o0,	%i2
loop_27:
	fmul8x16	%f31,	%f30,	%f26
	st	%f23,	[%l7 + 0x54]
	fnegs	%f7,	%f13
	edge32ln	%l5,	%g7,	%i6
	lduh	[%l7 + 0x12],	%g2
	movvc	%xcc,	%o6,	%l2
	ldx	[%l7 + 0x38],	%i4
	fbuge,a	%fcc2,	loop_28
	tcs	%icc,	0x2
	set	0x24, %g3
	sta	%f28,	[%l7 + %g3] 0x11
loop_28:
	fmovdvc	%xcc,	%f4,	%f12
	movcs	%icc,	%o7,	%l3
	and	%i5,	%o4,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g1,	%l6
	stbar
	tgu	%icc,	0x7
	or	%g3,	%g6,	%g5
	bge,pn	%icc,	loop_29
	movle	%xcc,	%o2,	%o5
	fcmple32	%f4,	%f2,	%l4
	andcc	%l0,	0x1208,	%l1
loop_29:
	movneg	%xcc,	%i0,	%i7
	mulx	%i1,	0x1085,	%i3
	ble,a	loop_30
	brgz,a	%o3,	loop_31
	fbe	%fcc0,	loop_32
	ld	[%l7 + 0x6C],	%f13
loop_30:
	fbn	%fcc3,	loop_33
loop_31:
	add	%o1,	%i2,	%l5
loop_32:
	popc	%o0,	%i6
	bne,a,pt	%icc,	loop_34
loop_33:
	sub	%g7,	0x02B1,	%o6
	bgu,a	%xcc,	loop_35
	fmovrdgz	%l2,	%f22,	%f28
loop_34:
	bg,pt	%icc,	loop_36
	movge	%xcc,	%i4,	%g2
loop_35:
	edge16	%l3,	%i5,	%o4
	popc	0x1521,	%o7
loop_36:
	fmovrdgez	%g1,	%f6,	%f6
	ta	%xcc,	0x6
	fabsd	%f20,	%f10
	nop
	setx	0x662E2EE0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x02D81033,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f6,	%f1
	bleu	loop_37
	orcc	%l6,	%g3,	%g6
	te	%xcc,	0x2
	fmovsg	%icc,	%f14,	%f6
loop_37:
	edge8	%g4,	%o2,	%o5
	movrgz	%g5,	0x2CC,	%l0
	fnot2s	%f18,	%f14
	nop
	setx	0x961B6394,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x4D056799,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f13,	%f23
	nop
	set	0x24, %l5
	ldsw	[%l7 + %l5],	%l4
	fmovrslez	%l1,	%f5,	%f11
	tg	%icc,	0x1
	ldd	[%l7 + 0x40],	%i0
	tcc	%icc,	0x6
	sll	%i7,	0x12,	%i3
	edge32	%o3,	%i1,	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%o0
	udiv	%i6,	0x0212,	%g7
	movne	%icc,	%l5,	%o6
	fmovdpos	%icc,	%f18,	%f5
	movrlz	%l2,	%i4,	%l3
	tg	%icc,	0x6
	tl	%icc,	0x5
	nop
	setx	0x7E4AE7ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xFECC8CEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f29,	%f1
	fmovsne	%xcc,	%f18,	%f17
	subc	%g2,	%i5,	%o7
	array8	%o4,	%g1,	%l6
	set	0x78, %l6
	stxa	%g3,	[%l7 + %l6] 0x10
	alignaddr	%g6,	%o2,	%g4
	bl,pn	%icc,	loop_38
	xnor	%g5,	%l0,	%l4
	fbg,a	%fcc1,	loop_39
	edge16l	%o5,	%l1,	%i7
loop_38:
	edge8	%i3,	%o3,	%i1
	set	0x48, %l3
	lda	[%l7 + %l3] 0x18,	%f9
loop_39:
	brlez,a	%i0,	loop_40
	sll	%o1,	0x1C,	%o0
	set	0x4A, %i6
	stba	%i2,	[%l7 + %i6] 0xe3
	membar	#Sync
loop_40:
	nop
	fitos	%f3,	%f30
	fstoi	%f30,	%f9
	edge16ln	%i6,	%g7,	%l5
	ldd	[%l7 + 0x58],	%l2
	fzero	%f8
	edge16ln	%i4,	%o6,	%g2
	alignaddr	%i5,	%l3,	%o4
	xnor	%o7,	0x1AAC,	%g1
	sdiv	%g3,	0x13C3,	%l6
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	udivcc	%g6,	0x1544,	%o2
	movcs	%icc,	%g5,	%g4
	addc	%l0,	%l4,	%o5
	tvs	%xcc,	0x2
	fbuge	%fcc0,	loop_41
	bpos,a,pn	%icc,	loop_42
	fmovd	%f0,	%f12
	mova	%icc,	%l1,	%i7
loop_41:
	or	%i3,	0x1F8C,	%o3
loop_42:
	array8	%i1,	%i0,	%o0
	movgu	%icc,	%o1,	%i6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x89
	bg,a	%xcc,	loop_43
	tpos	%icc,	0x4
	addc	%i2,	%l5,	%g7
	fnors	%f31,	%f22,	%f14
loop_43:
	ldx	[%l7 + 0x68],	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%l2
	ble	%xcc,	loop_44
	movrgz	%g2,	0x096,	%l3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
loop_44:
	popc	%o4,	%o7
	sdiv	%g1,	0x191D,	%i5
	srl	%l6,	0x14,	%g3
	movrne	%g6,	%o2,	%g5
	tcc	%xcc,	0x6
	movrgz	%l0,	0x246,	%g4
	edge16n	%o5,	%l4,	%l1
	tle	%xcc,	0x4
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x0c,	%i3
	sethi	0x1799,	%o3
	ta	%xcc,	0x7
	movvc	%xcc,	%i7,	%i0
	xnorcc	%o0,	%i1,	%o1
	movrgz	%i6,	%i2,	%l5
	fpsub32	%f2,	%f24,	%f8
	fmovs	%f7,	%f2
	fbn	%fcc2,	loop_45
	srl	%g7,	0x14,	%i4
	mova	%xcc,	%o6,	%l2
	edge8n	%g2,	%l3,	%o7
loop_45:
	edge8ln	%g1,	%i5,	%o4
	edge8n	%g3,	%g6,	%o2
	edge16l	%g5,	%l0,	%g4
	set	0x3E, %g4
	ldsha	[%l7 + %g4] 0x15,	%o5
	edge32l	%l6,	%l4,	%i3
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f0
	faligndata	%f12,	%f18,	%f4
	sdivx	%o3,	0x067F,	%l1
	fcmple32	%f0,	%f20,	%i0
	or	%i7,	%o0,	%i1
	move	%icc,	%i6,	%o1
	fcmpeq32	%f28,	%f22,	%l5
	fmovdg	%icc,	%f24,	%f0
	set	0x30, %o1
	stwa	%i2,	[%l7 + %o1] 0x10
	andcc	%i4,	%g7,	%l2
	array16	%g2,	%l3,	%o7
	fmovse	%xcc,	%f15,	%f9
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g1
	addcc	%o6,	%i5,	%g3
	fbg	%fcc1,	loop_46
	and	%o4,	%g6,	%o2
	edge8	%g5,	%g4,	%o5
	nop
	setx	0x8DE29CC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f24
loop_46:
	bgu,a	loop_47
	bg,a	loop_48
	fmovdleu	%xcc,	%f18,	%f26
	tcs	%icc,	0x1
loop_47:
	edge16ln	%l6,	%l0,	%l4
loop_48:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o3
	orncc	%l1,	%i0,	%i3
	movleu	%xcc,	%i7,	%i1
	movge	%xcc,	%i6,	%o0
	set	0x340, %o0
	nop 	! 	nop 	! 	ldxa	[%g0 + %o0] 0x40,	%l5 ripped by fixASI40.pl ripped by fixASI40.pl
	movgu	%xcc,	%i2,	%o1
	brnz,a	%i4,	loop_49
	sdivcc	%l2,	0x0FEB,	%g2
	be,pn	%xcc,	loop_50
	edge32n	%l3,	%o7,	%g1
loop_49:
	fnot2	%f8,	%f6
	edge16l	%g7,	%o6,	%i5
loop_50:
	movrgez	%o4,	0x399,	%g6
	smulcc	%o2,	0x1B24,	%g5
	nop
	setx	0xEC479868,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xA7F1C4BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f2,	%f20
	fmovdcs	%icc,	%f23,	%f15
	nop
	setx	0x806139880D5D1232,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x531E8DF6C2FF8A0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f16,	%f18
	movg	%icc,	%g3,	%g4
	fnot2	%f28,	%f4
	srlx	%o5,	0x1B,	%l6
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f8
	srl	%l4,	%l0,	%o3
	tge	%xcc,	0x3
	ldsw	[%l7 + 0x30],	%l1
	array8	%i0,	%i3,	%i1
	wr	%g0,	0x19,	%asi
	stxa	%i7,	[%l7 + 0x10] %asi
	edge32l	%i6,	%l5,	%i2
	popc	%o1,	%i4
	alignaddrl	%o0,	%g2,	%l3
	ble,pn	%icc,	loop_51
	edge32	%l2,	%g1,	%g7
	fbul	%fcc2,	loop_52
	fmovscc	%xcc,	%f18,	%f29
loop_51:
	tge	%xcc,	0x5
	nop
	setx	loop_53,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_52:
	orncc	%o6,	%o7,	%i5
	fabss	%f8,	%f17
	fmul8x16al	%f11,	%f0,	%f0
loop_53:
	taddcc	%o4,	%o2,	%g5
	fmovsne	%icc,	%f7,	%f23
	set	0x6E, %g1
	lduha	[%l7 + %g1] 0x80,	%g3
	movgu	%xcc,	%g4,	%g6
	nop
	set	0x60, %l1
	std	%f28,	[%l7 + %l1]
	fcmpne16	%f22,	%f26,	%l6
	edge8l	%o5,	%l4,	%o3
	sdivx	%l1,	0x156C,	%l0
	stx	%i3,	[%l7 + 0x20]
	sth	%i1,	[%l7 + 0x50]
	alignaddrl	%i0,	%i6,	%i7
	fmovscc	%xcc,	%f28,	%f23
	movl	%xcc,	%i2,	%o1
	bvs,a,pt	%xcc,	loop_54
	nop
	setx	loop_55,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%icc,	0x0
	smul	%l5,	0x0D91,	%o0
loop_54:
	movleu	%icc,	%g2,	%i4
loop_55:
	tvs	%xcc,	0x6
	orcc	%l3,	%g1,	%l2
	sdivx	%o6,	0x057C,	%g7
	tne	%icc,	0x1
	ldd	[%l7 + 0x70],	%o6
	addccc	%i5,	%o2,	%o4
	move	%xcc,	%g3,	%g5
	srl	%g4,	%l6,	%g6
	fabss	%f22,	%f27
	movneg	%icc,	%o5,	%o3
	fpackfix	%f26,	%f22
	sdivx	%l4,	0x17B1,	%l1
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0x3
	movl	%icc,	%l0,	%i1
	fnegs	%f18,	%f14
	fmovscs	%icc,	%f0,	%f19
	subccc	%i6,	0x0183,	%i7
	udiv	%i0,	0x1715,	%o1
	smulcc	%l5,	0x01DB,	%o0
	st	%f27,	[%l7 + 0x6C]
	fmovdle	%icc,	%f25,	%f14
	stw	%g2,	[%l7 + 0x48]
	fmovdgu	%icc,	%f27,	%f27
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x89
	subccc	%i2,	%i4,	%l3
	fones	%f6
	brgez	%g1,	loop_56
	fbg	%fcc3,	loop_57
	umulcc	%l2,	%g7,	%o7
	fcmpne32	%f22,	%f6,	%o6
loop_56:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x7C] %asi,	%i5
loop_57:
	bleu,a	loop_58
	edge16ln	%o4,	%o2,	%g3
	taddcctv	%g4,	0x0159,	%l6
	array16	%g6,	%g5,	%o5
loop_58:
	tleu	%icc,	0x3
	edge16ln	%l4,	%o3,	%i3
	fnors	%f4,	%f12,	%f10
	brlez	%l1,	loop_59
	edge32n	%i1,	%l0,	%i6
	or	%i0,	0x10E1,	%i7
	fbg	%fcc3,	loop_60
loop_59:
	udiv	%o1,	0x10C2,	%o0
	edge16ln	%l5,	%i2,	%g2
	array32	%i4,	%g1,	%l2
loop_60:
	fpackfix	%f22,	%f3
	mulx	%g7,	0x0FFA,	%o7
	fmovsg	%icc,	%f14,	%f16
	popc	0x066B,	%o6
	udiv	%i5,	0x107E,	%l3
	alignaddr	%o2,	%g3,	%g4
	fmovdvc	%icc,	%f19,	%f7
	ldstub	[%l7 + 0x48],	%l6
	fmovs	%f5,	%f11
	fsrc2s	%f29,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g6,	0x0033,	%g5
	edge8	%o5,	%o4,	%l4
	fbe,a	%fcc2,	loop_61
	sethi	0x0509,	%i3
	fmul8x16	%f31,	%f10,	%f22
	and	%o3,	%l1,	%i1
loop_61:
	movn	%xcc,	%l0,	%i0
	umulcc	%i7,	0x1E8C,	%i6
	orncc	%o0,	0x0498,	%o1
	stx	%i2,	[%l7 + 0x50]
	andcc	%g2,	%l5,	%g1
	fmovdn	%xcc,	%f26,	%f30
	fpadd32s	%f2,	%f14,	%f11
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f6
	fxtod	%f6,	%f6
	tneg	%icc,	0x6
	xor	%i4,	%g7,	%o7
	addccc	%o6,	%l2,	%i5
	fmovdneg	%icc,	%f31,	%f7
	sll	%o2,	0x1D,	%g3
	or	%g4,	%l3,	%l6
	fmovsleu	%xcc,	%f25,	%f0
	array8	%g6,	%o5,	%g5
	stx	%l4,	[%l7 + 0x38]
	fmovsl	%icc,	%f28,	%f24
	edge16	%i3,	%o4,	%l1
	nop
	setx loop_62, %l0, %l1
	jmpl %l1, %i1
	tpos	%icc,	0x6
	set	0x20, %i0
	stxa	%l0,	[%l7 + %i0] 0x18
loop_62:
	tl	%xcc,	0x0
	udivx	%o3,	0x119A,	%i0
	lduh	[%l7 + 0x08],	%i6
	srl	%i7,	%o0,	%o1
	fmovrdne	%g2,	%f24,	%f8
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%i2
	movvs	%xcc,	%g1,	%l5
	subc	%g7,	%o7,	%o6
	brlez,a	%i4,	loop_63
	movge	%xcc,	%i5,	%l2
	subc	%g3,	%o2,	%l3
	tvs	%icc,	0x4
loop_63:
	tcs	%icc,	0x6
	ld	[%l7 + 0x0C],	%f14
	udivcc	%g4,	0x1C76,	%g6
	call	loop_64
	subccc	%o5,	0x11BB,	%l6
	fsrc1s	%f14,	%f25
	andn	%g5,	%l4,	%o4
loop_64:
	tgu	%xcc,	0x5
	movrgz	%i3,	%l1,	%i1
	tpos	%xcc,	0x4
	smulcc	%l0,	0x0DB8,	%i0
	move	%icc,	%o3,	%i6
	bge	%icc,	loop_65
	addcc	%i7,	%o0,	%g2
	bn	loop_66
	bn,a	loop_67
loop_65:
	nop
	set	0x74, %i5
	ldstub	[%l7 + %i5],	%o1
	tne	%icc,	0x4
loop_66:
	alignaddr	%i2,	%l5,	%g7
loop_67:
	sll	%g1,	0x03,	%o6
	fxnors	%f8,	%f28,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba	%xcc,	loop_68
	brz	%o7,	loop_69
	tpos	%icc,	0x1
	movrlez	%i4,	%l2,	%g3
loop_68:
	fpack32	%f6,	%f10,	%f20
loop_69:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	brlez,a	%i5,	loop_70
	xor	%g4,	0x1125,	%l3
	sth	%g6,	[%l7 + 0x56]
	bcs,pt	%icc,	loop_71
loop_70:
	fcmpeq16	%f4,	%f28,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
loop_71:
	bne,a	%xcc,	loop_72
	movle	%xcc,	%o5,	%l4
	fmovrdgez	%g5,	%f12,	%f18
	sdivcc	%o4,	0x138E,	%i3
loop_72:
	fmovsle	%icc,	%f26,	%f4
	popc	0x0192,	%i1
	addcc	%l0,	%l1,	%o3
	fpsub16s	%f19,	%f18,	%f31
	orn	%i6,	0x0069,	%i7
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	faligndata	%f6,	%f26,	%f8
	edge32	%g2,	%i0,	%i2
	xnorcc	%o1,	%l5,	%g1
	nop
	fitod	%f12,	%f30
	fdtos	%f30,	%f2
	srl	%o6,	0x19,	%o7
	movvc	%icc,	%g7,	%i4
	tl	%icc,	0x1
	move	%icc,	%g3,	%l2
	membar	0x2D
	fsrc2s	%f31,	%f21
	fmovsvs	%icc,	%f29,	%f4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x34] %asi,	%o2
	nop
	setx	0xC8663E6F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x1BFF7414,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f11,	%f20
	orncc	%i5,	%l3,	%g6
	fble	%fcc1,	loop_73
	fcmpne16	%f18,	%f10,	%l6
	tcc	%xcc,	0x4
	andcc	%g4,	%l4,	%o5
loop_73:
	fors	%f20,	%f14,	%f23
	bcs,pn	%icc,	loop_74
	tleu	%icc,	0x1
	tneg	%xcc,	0x1
	sdivx	%o4,	0x0EB8,	%i3
loop_74:
	movcs	%icc,	%i1,	%g5
	ba,a	%xcc,	loop_75
	tcs	%xcc,	0x6
	or	%l1,	%l0,	%i6
	edge8	%i7,	%o0,	%g2
loop_75:
	tsubcc	%i0,	%o3,	%o1
	umulcc	%l5,	%g1,	%i2
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%o6
	fmovrsne	%o7,	%f21,	%f27
	fsrc1s	%f3,	%f28
	pdist	%f0,	%f6,	%f28
	fmovdne	%xcc,	%f13,	%f11
	fnors	%f9,	%f0,	%f23
	ldsw	[%l7 + 0x40],	%i4
	fbul	%fcc3,	loop_76
	sllx	%g3,	0x05,	%g7
	addccc	%l2,	0x04F3,	%o2
	fabss	%f28,	%f31
loop_76:
	bcs	%icc,	loop_77
	fmovrsgez	%i5,	%f31,	%f16
	movcs	%xcc,	%g6,	%l3
	ldd	[%l7 + 0x30],	%f0
loop_77:
	bpos	%xcc,	loop_78
	edge16l	%g4,	%l4,	%l6
	edge16n	%o5,	%i3,	%o4
	movrlez	%i1,	%l1,	%g5
loop_78:
	bcc,a	loop_79
	orncc	%i6,	0x10C4,	%l0
	set	0x58, %g7
	stwa	%o0,	[%l7 + %g7] 0x19
loop_79:
	edge32	%i7,	%i0,	%o3
	edge16ln	%g2,	%l5,	%o1
	edge16n	%i2,	%o6,	%o7
	bgu,a	%xcc,	loop_80
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x40],	%f16
	mulx	%i4,	0x05CE,	%g3
loop_80:
	fornot2s	%f22,	%f7,	%f10
	tpos	%icc,	0x2
	edge16n	%g7,	%l2,	%g1
	edge8	%o2,	%g6,	%l3
	fble,a	%fcc3,	loop_81
	fmul8x16al	%f1,	%f1,	%f20
	andn	%g4,	0x1775,	%i5
	movne	%icc,	%l6,	%l4
loop_81:
	fba	%fcc1,	loop_82
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f8
	tcc	%icc,	0x0
	orncc	%i3,	0x00D0,	%o4
loop_82:
	fmovscc	%xcc,	%f27,	%f29
	nop
	fitod	%f2,	%f10
	fdtoi	%f10,	%f4
	addc	%o5,	0x0FB6,	%i1
	sir	0x0339
	movrne	%l1,	%i6,	%g5
	xnorcc	%l0,	%o0,	%i0
	xnor	%o3,	%i7,	%l5
	movrgz	%g2,	0x2DA,	%o1
	tsubcc	%i2,	%o6,	%i4
	st	%f31,	[%l7 + 0x1C]
	fone	%f4
	fsrc2	%f28,	%f24
	movvc	%icc,	%o7,	%g7
	tcs	%xcc,	0x2
	andn	%l2,	0x0571,	%g1
	bl	%xcc,	loop_83
	movrgez	%g3,	%o2,	%g6
	fnor	%f20,	%f2,	%f16
	sdivcc	%l3,	0x047B,	%g4
loop_83:
	movcc	%icc,	%i5,	%l6
	movneg	%xcc,	%i3,	%l4
	fmovrse	%o5,	%f16,	%f20
	set	0x4C, %l4
	lduwa	[%l7 + %l4] 0x81,	%i1
	edge32ln	%l1,	%o4,	%i6
	alignaddr	%g5,	%o0,	%i0
	nop
	fitod	%f1,	%f20
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x24,	%o2
	alignaddr	%l0,	%l5,	%i7
	taddcctv	%o1,	0x18E1,	%g2
	fnor	%f0,	%f2,	%f8
	tcs	%xcc,	0x7
	fbe	%fcc3,	loop_84
	subc	%i2,	0x1046,	%i4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x04
loop_84:
	fbuge	%fcc1,	loop_85
	fbe	%fcc1,	loop_86
	array8	%o6,	%o7,	%g7
	fmul8ulx16	%f8,	%f4,	%f20
loop_85:
	bshuffle	%f28,	%f2,	%f20
loop_86:
	srl	%g1,	%g3,	%o2
	nop
	setx	loop_87,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%l2,	%l3,	%g4
	brlez,a	%i5,	loop_88
	udivx	%l6,	0x0781,	%i3
loop_87:
	movle	%xcc,	%l4,	%g6
	set	0x20, %o6
	lduwa	[%l7 + %o6] 0x81,	%i1
loop_88:
	taddcctv	%o5,	%o4,	%i6
	movre	%l1,	0x34A,	%o0
	fcmpne16	%f8,	%f2,	%g5
	tneg	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16l	%o3,	%l0,	%l5
	ta	%xcc,	0x0
	sdivcc	%i0,	0x0697,	%i7
	add	%g2,	0x1C69,	%i2
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x23,	%i4
	brnz	%o6,	loop_89
	movcs	%icc,	%o7,	%o1
	ldstub	[%l7 + 0x4F],	%g1
	umul	%g7,	0x0234,	%g3
loop_89:
	tvc	%icc,	0x7
	fmovscs	%xcc,	%f5,	%f6
	movleu	%icc,	%o2,	%l2
	sdiv	%g4,	0x1D07,	%i5
	movl	%xcc,	%l6,	%i3
	subcc	%l3,	%g6,	%l4
	umulcc	%o5,	%i1,	%i6
	fble,a	%fcc2,	loop_90
	fandnot1	%f10,	%f22,	%f28
	fmovsg	%icc,	%f17,	%f30
	edge8ln	%l1,	%o4,	%o0
loop_90:
	sub	%g5,	0x082F,	%l0
	taddcctv	%o3,	0x1726,	%i0
	movg	%icc,	%l5,	%i7
	tleu	%icc,	0x4
	nop
	setx	0x3BA5639A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x8280469E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f18,	%f0
	bl,pn	%icc,	loop_91
	ldx	[%l7 + 0x48],	%g2
	movl	%icc,	%i2,	%i4
	movcs	%icc,	%o7,	%o6
loop_91:
	ldd	[%l7 + 0x38],	%g0
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x14,	%g7
	tcc	%xcc,	0x4
	udivx	%g3,	0x11DD,	%o2
	edge32	%o1,	%g4,	%i5
	smulcc	%l6,	%i3,	%l2
	movn	%xcc,	%l3,	%g6
	sll	%l4,	%o5,	%i1
	ta	%icc,	0x5
	tsubcctv	%l1,	0x11B2,	%i6
	sir	0x0B8A
	st	%f15,	[%l7 + 0x5C]
	tvs	%icc,	0x3
	fones	%f28
	fmovdvc	%xcc,	%f31,	%f25
	fmovrse	%o0,	%f19,	%f26
	fmovspos	%icc,	%f30,	%f2
	movpos	%xcc,	%g5,	%l0
	udivx	%o3,	0x1FA1,	%o4
	nop
	fitos	%f1,	%f12
	fstod	%f12,	%f12
	movrlez	%i0,	%i7,	%l5
	movn	%icc,	%g2,	%i4
	fands	%f1,	%f12,	%f4
	movrgz	%i2,	%o6,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f14,	%f10,	%f12
	tg	%icc,	0x2
	nop
	setx	0x54FC1DB6EC36322C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x837B1D0318EB5B05,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f6
	array32	%g7,	%g3,	%o2
	smulcc	%o7,	%g4,	%i5
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x10,	%f16
	tcc	%xcc,	0x0
	fands	%f3,	%f23,	%f29
	srlx	%l6,	%o1,	%l2
	edge16n	%l3,	%i3,	%l4
	nop
	setx loop_92, %l0, %l1
	jmpl %l1, %o5
	alignaddr	%i1,	%l1,	%g6
	set	0x128, %g6
	nop 	! 	nop 	! 	ldxa	[%g0 + %g6] 0x40,	%i6 ripped by fixASI40.pl ripped by fixASI40.pl
loop_92:
	swap	[%l7 + 0x5C],	%o0
	move	%xcc,	%l0,	%g5
	add	%o4,	%i0,	%o3
	tneg	%icc,	0x7
	set	0x10, %i2
	ldswa	[%l7 + %i2] 0x10,	%i7
	tn	%xcc,	0x6
	ldsw	[%l7 + 0x54],	%l5
	brlz,a	%g2,	loop_93
	sllx	%i2,	0x13,	%o6
	tl	%icc,	0x5
	brgez	%i4,	loop_94
loop_93:
	fmovsvs	%xcc,	%f4,	%f29
	tsubcc	%g1,	%g3,	%o2
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f14
loop_94:
	fmovsa	%xcc,	%f11,	%f16
	edge32	%o7,	%g7,	%i5
	fmovdvs	%xcc,	%f13,	%f29
	edge32	%g4,	%l6,	%o1
	membar	0x34
	fcmpne16	%f26,	%f8,	%l2
	flush	%l7 + 0x78
	fmovdne	%xcc,	%f8,	%f31
	fcmpne16	%f16,	%f0,	%l3
	movleu	%icc,	%i3,	%o5
	srlx	%i1,	0x07,	%l1
	fmovrdlez	%l4,	%f0,	%f14
	bgu,a,pn	%icc,	loop_95
	fmovdne	%xcc,	%f18,	%f31
	tsubcctv	%i6,	%o0,	%g6
	set	0x14, %o4
	lduwa	[%l7 + %o4] 0x19,	%l0
loop_95:
	edge32	%g5,	%i0,	%o3
	ble	loop_96
	fcmpeq32	%f16,	%f20,	%i7
	taddcc	%o4,	%g2,	%l5
	ld	[%l7 + 0x1C],	%f18
loop_96:
	nop
	set	0x74, %l2
	swapa	[%l7 + %l2] 0x89,	%i2
	fmovsn	%xcc,	%f14,	%f11
	array8	%i4,	%g1,	%o6
	srlx	%o2,	0x00,	%g3
	addccc	%g7,	0x0E23,	%o7
	fbl,a	%fcc0,	loop_97
	movneg	%icc,	%i5,	%g4
	fmovdleu	%xcc,	%f3,	%f28
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x12] %asi,	%l6
loop_97:
	fpack16	%f2,	%f22
	fsrc2s	%f30,	%f1
	array32	%l2,	%l3,	%o1
	movg	%icc,	%i3,	%i1
	tne	%xcc,	0x4
	edge8ln	%o5,	%l4,	%i6
	set	0x7C, %l0
	sta	%f26,	[%l7 + %l0] 0x14
	bcs,a,pn	%xcc,	loop_98
	bgu	%xcc,	loop_99
	tpos	%xcc,	0x5
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf0
	membar	#Sync
loop_98:
	subccc	%l1,	%o0,	%g6
loop_99:
	sra	%g5,	0x1F,	%l0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%o3
	andcc	%i0,	%o4,	%g2
	lduw	[%l7 + 0x78],	%i7
	mulx	%l5,	0x19B6,	%i4
	mova	%icc,	%i2,	%g1
	nop
	setx	0xA05EE6F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f19
	srlx	%o6,	0x1D,	%o2
	fxnor	%f8,	%f14,	%f18
	udiv	%g3,	0x0AC2,	%o7
	fmovdneg	%xcc,	%f23,	%f30
	fmovrdgz	%i5,	%f8,	%f10
	fblg,a	%fcc1,	loop_100
	fnand	%f20,	%f12,	%f6
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g7
loop_100:
	array8	%l6,	%g4,	%l3
	xnorcc	%o1,	0x00BD,	%l2
	bvs,pt	%icc,	loop_101
	move	%icc,	%i1,	%o5
	subcc	%l4,	%i3,	%i6
	ta	%icc,	0x7
loop_101:
	edge32	%o0,	%l1,	%g6
	ta	%icc,	0x5
	nop
	set	0x64, %g3
	ldsw	[%l7 + %g3],	%l0
	movl	%icc,	%o3,	%g5
	fmovscc	%icc,	%f10,	%f0
	be,pn	%xcc,	loop_102
	sub	%o4,	%i0,	%i7
	fnors	%f16,	%f22,	%f5
	edge32	%g2,	%i4,	%l5
loop_102:
	sra	%g1,	0x10,	%o6
	taddcctv	%i2,	0x0ED1,	%g3
	nop
	setx	0xA0DEFE4EC06A8E7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	tne	%xcc,	0x5
	fmuld8ulx16	%f27,	%f31,	%f4
	fbg	%fcc2,	loop_103
	movpos	%icc,	%o2,	%i5
	membar	0x2C
	sdivcc	%g7,	0x0268,	%l6
loop_103:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%l3
	fpadd32s	%f23,	%f20,	%f2
	mova	%icc,	%o1,	%g4
	movle	%icc,	%i1,	%o5
	flush	%l7 + 0x0C
	andncc	%l2,	%i3,	%i6
	taddcc	%l4,	0x1D59,	%o0
	stbar
	movgu	%icc,	%l1,	%g6
	sll	%o3,	0x1D,	%l0
	edge32ln	%o4,	%i0,	%i7
	sethi	0x1EB1,	%g2
	fbe	%fcc2,	loop_104
	smulcc	%i4,	%l5,	%g1
	andcc	%o6,	%g5,	%g3
	edge8ln	%o2,	%i5,	%i2
loop_104:
	sllx	%l6,	%g7,	%l3
	fmovdne	%xcc,	%f11,	%f16
	orn	%o7,	%g4,	%o1
	array8	%i1,	%l2,	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%i6
	umul	%l4,	%l1,	%o0
	srax	%g6,	%l0,	%o3
	sdivcc	%o4,	0x119E,	%i7
	sdivx	%g2,	0x1D2F,	%i0
	movrgz	%i4,	%g1,	%l5
	fmovsle	%xcc,	%f5,	%f21
	wr	%g0,	0x27,	%asi
	stba	%g5,	[%l7 + 0x76] %asi
	membar	#Sync
	call	loop_105
	edge32	%g3,	%o2,	%i5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_105:
	fornot1s	%f24,	%f18,	%f29
	edge8n	%o6,	%l6,	%g7
	movge	%xcc,	%i2,	%o7
	movn	%xcc,	%l3,	%g4
	nop
	setx	0xE9B4E6C541D5A138,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x5BADAB9CA964F92B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f18,	%f0
	fmovdvc	%icc,	%f17,	%f22
	tcc	%xcc,	0x0
	tg	%xcc,	0x3
	swap	[%l7 + 0x68],	%o1
	movcs	%xcc,	%i1,	%l2
	array16	%i3,	%i6,	%l4
	nop
	fitod	%f0,	%f20
	fdtox	%f20,	%f12
	or	%o5,	0x1549,	%l1
	tleu	%icc,	0x5
	smul	%o0,	0x1B56,	%l0
	nop
	fitos	%f8,	%f23
	fstod	%f23,	%f18
	and	%g6,	0x076C,	%o4
	tcs	%xcc,	0x0
	sdivx	%o3,	0x169A,	%i7
	movg	%xcc,	%g2,	%i0
	edge8ln	%g1,	%l5,	%g5
	st	%f28,	[%l7 + 0x34]
	edge16ln	%i4,	%g3,	%i5
	fxnor	%f16,	%f26,	%f0
	fbue,a	%fcc0,	loop_106
	tne	%icc,	0x4
	tneg	%xcc,	0x4
	tge	%icc,	0x2
loop_106:
	bcc,a	loop_107
	bvs	loop_108
	array8	%o2,	%o6,	%l6
	udivx	%g7,	0x0A3E,	%i2
loop_107:
	edge32n	%o7,	%g4,	%l3
loop_108:
	sir	0x1958
	subccc	%i1,	0x0307,	%l2
	fbo	%fcc2,	loop_109
	bg	%xcc,	loop_110
	tge	%icc,	0x7
	sll	%i3,	0x0D,	%o1
loop_109:
	edge16n	%l4,	%o5,	%i6
loop_110:
	tsubcctv	%l1,	%l0,	%o0
	tgu	%icc,	0x1
	tcc	%icc,	0x1
	movvs	%icc,	%g6,	%o3
	fnot1	%f4,	%f2
	tsubcctv	%o4,	%i7,	%i0
	movg	%xcc,	%g2,	%l5
	fbn,a	%fcc3,	loop_111
	sdivcc	%g5,	0x1EF0,	%i4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x42] %asi,	%g3
loop_111:
	nop
	set	0x50, %l3
	lduwa	[%l7 + %l3] 0x18,	%g1
	addcc	%i5,	%o6,	%o2
	tn	%icc,	0x0
	andncc	%g7,	%l6,	%o7
	edge8	%i2,	%l3,	%i1
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x10,	%l2
	tle	%icc,	0x1
	fmovrsgz	%g4,	%f2,	%f24
	fmovrslz	%o1,	%f29,	%f25
	mova	%xcc,	%l4,	%o5
	xor	%i3,	%i6,	%l0
	fmovrse	%o0,	%f0,	%f0
	fpadd32	%f10,	%f30,	%f24
	move	%xcc,	%g6,	%l1
	array32	%o3,	%i7,	%o4
	fornot1s	%f17,	%f26,	%f23
	bcc	%xcc,	loop_112
	tgu	%xcc,	0x6
	edge16	%i0,	%l5,	%g2
	srl	%g5,	%i4,	%g1
loop_112:
	movvc	%icc,	%i5,	%g3
	mova	%xcc,	%o2,	%o6
	fbo,a	%fcc3,	loop_113
	movneg	%icc,	%g7,	%l6
	andn	%o7,	0x0BC6,	%i2
	fpmerge	%f15,	%f14,	%f30
loop_113:
	array32	%i1,	%l3,	%l2
	fnegs	%f30,	%f14
	subccc	%o1,	%g4,	%o5
	movrlz	%i3,	%i6,	%l0
	addcc	%o0,	%g6,	%l4
	fmul8x16au	%f30,	%f27,	%f20
	orncc	%o3,	%l1,	%i7
	array32	%i0,	%o4,	%g2
	movl	%xcc,	%g5,	%i4
	fbul,a	%fcc3,	loop_114
	xorcc	%g1,	0x0F28,	%l5
	st	%f29,	[%l7 + 0x28]
	sethi	0x0384,	%i5
loop_114:
	edge16l	%o2,	%g3,	%o6
	fmovdne	%icc,	%f28,	%f5
	movle	%xcc,	%g7,	%o7
	tpos	%xcc,	0x0
	tgu	%icc,	0x0
	xnorcc	%i2,	0x0F84,	%l6
	ble	%xcc,	loop_115
	movle	%icc,	%l3,	%i1
	sub	%o1,	%l2,	%o5
	fone	%f10
loop_115:
	fabss	%f30,	%f30
	edge8l	%i3,	%g4,	%l0
	tcc	%icc,	0x7
	nop
	setx	0xC05AE9C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	ba,pt	%xcc,	loop_116
	bvs,a	loop_117
	stw	%i6,	[%l7 + 0x1C]
	tge	%icc,	0x2
loop_116:
	fands	%f18,	%f15,	%f25
loop_117:
	fbue	%fcc3,	loop_118
	te	%xcc,	0x0
	edge32ln	%g6,	%o0,	%l4
	fpsub32s	%f24,	%f18,	%f8
loop_118:
	fbue	%fcc3,	loop_119
	tge	%xcc,	0x3
	xnor	%l1,	0x1BC4,	%o3
	sir	0x06AE
loop_119:
	edge8ln	%i0,	%o4,	%g2
	and	%i7,	%i4,	%g5
	membar	0x56
	prefetch	[%l7 + 0x40],	 0x2
	fmovsle	%icc,	%f21,	%f10
	umul	%l5,	%g1,	%i5
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f30
	fxtod	%f30,	%f6
	movrlz	%o2,	0x365,	%g3
	fxnor	%f26,	%f10,	%f22
	fnot2s	%f8,	%f6
	sra	%g7,	0x05,	%o6
	fmovsvc	%xcc,	%f23,	%f6
	call	loop_120
	sdiv	%o7,	0x1842,	%l6
	fnot1s	%f25,	%f21
	brgz	%i2,	loop_121
loop_120:
	bn	loop_122
	movneg	%xcc,	%l3,	%o1
	stw	%i1,	[%l7 + 0x44]
loop_121:
	nop
	setx	0x153CB8CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x368C4AD9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f13,	%f11
loop_122:
	movle	%xcc,	%o5,	%i3
	movn	%xcc,	%l2,	%g4
	std	%f2,	[%l7 + 0x50]
	tleu	%icc,	0x1
	mulscc	%l0,	%g6,	%o0
	set	0x18, %g2
	ldswa	[%l7 + %g2] 0x18,	%i6
	sir	0x0AA9
	fmul8x16al	%f16,	%f19,	%f0
	orncc	%l4,	0x0300,	%o3
	brgez,a	%l1,	loop_123
	te	%xcc,	0x5
	srl	%o4,	0x06,	%g2
	mova	%xcc,	%i7,	%i4
loop_123:
	nop
	setx	loop_124,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2	%f16,	%f28,	%f28
	addc	%g5,	0x1F0C,	%l5
	array16	%g1,	%i5,	%o2
loop_124:
	xorcc	%g3,	0x18F5,	%i0
	xnorcc	%o6,	%o7,	%l6
	fornot1s	%f30,	%f3,	%f25
	udivx	%g7,	0x01C5,	%l3
	tvc	%xcc,	0x6
	faligndata	%f18,	%f28,	%f6
	andcc	%i2,	0x029A,	%o1
	addccc	%i1,	0x118B,	%i3
	umul	%o5,	0x1942,	%g4
	srl	%l0,	0x06,	%g6
	movneg	%icc,	%o0,	%i6
	fmovrdgez	%l2,	%f10,	%f26
	brgez,a	%l4,	loop_125
	fmul8x16al	%f29,	%f31,	%f30
	movgu	%icc,	%o3,	%l1
	fmovda	%xcc,	%f23,	%f10
loop_125:
	sdiv	%g2,	0x1F59,	%o4
	bcc,a	loop_126
	bgu,a	%xcc,	loop_127
	umulcc	%i7,	0x0205,	%g5
	sub	%i4,	%g1,	%l5
loop_126:
	fmovsgu	%xcc,	%f1,	%f9
loop_127:
	umul	%o2,	0x0FE9,	%g3
	tle	%icc,	0x4
	tne	%icc,	0x7
	fmovsn	%xcc,	%f5,	%f16
	tleu	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x20] %asi,	%i0
	andcc	%i5,	0x07D6,	%o7
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	udivcc	%o6,	0x0BF0,	%g7
	sir	0x0C9B
	xnorcc	%l3,	%i2,	%o1
	array8	%i1,	%i3,	%o5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x50] %asi,	%l6
	sub	%l0,	0x0095,	%g6
	taddcc	%g4,	0x0DDD,	%o0
	brz	%l2,	loop_128
	fmovdpos	%xcc,	%f12,	%f30
	sethi	0x1583,	%i6
	movge	%icc,	%o3,	%l1
loop_128:
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
	ta	%icc,	0x6
	add	%l4,	%g2,	%i7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%o4
loop_129:
	tvc	%icc,	0x0
	sll	%i4,	0x06,	%g5
	fblg	%fcc2,	loop_130
	array16	%g1,	%l5,	%o2
	fbe	%fcc2,	loop_131
	movneg	%xcc,	%g3,	%i5
loop_130:
	movleu	%xcc,	%o7,	%i0
	fmovsvc	%xcc,	%f28,	%f20
loop_131:
	fmul8x16	%f10,	%f18,	%f28
	fblg	%fcc2,	loop_132
	bg,pn	%icc,	loop_133
	sir	0x18D9
	set	0x18, %l6
	sta	%f16,	[%l7 + %l6] 0x15
loop_132:
	fabss	%f13,	%f2
loop_133:
	array8	%o6,	%l3,	%g7
	edge16ln	%o1,	%i1,	%i3
	add	%o5,	%i2,	%l6
	nop
	fitos	%f11,	%f25
	fstox	%f25,	%f26
	fxtos	%f26,	%f30
	tgu	%icc,	0x7
	ta	%xcc,	0x6
	subcc	%g6,	%g4,	%o0
	move	%xcc,	%l0,	%l2
	nop
	set	0x3C, %o5
	ldsh	[%l7 + %o5],	%i6
	fpadd16	%f14,	%f6,	%f8
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l1
	subc	%l4,	%g2,	%o3
	orn	%i7,	0x1223,	%o4
	and	%i4,	0x1763,	%g1
	sub	%l5,	%o2,	%g5
	andncc	%i5,	%g3,	%o7
	movrgez	%i0,	%l3,	%o6
	sll	%g7,	%o1,	%i1
	sdivcc	%o5,	0x0E75,	%i2
	addcc	%i3,	0x1B2A,	%g6
	alignaddrl	%l6,	%g4,	%l0
	movpos	%icc,	%l2,	%i6
	taddcctv	%o0,	0x164D,	%l1
	array16	%g2,	%o3,	%i7
	movn	%xcc,	%o4,	%i4
	set	0x11, %i3
	lduba	[%l7 + %i3] 0x18,	%l4
	move	%icc,	%l5,	%g1
	fmovdgu	%icc,	%f12,	%f7
	edge8	%g5,	%o2,	%i5
	fbuge	%fcc3,	loop_134
	movcs	%xcc,	%g3,	%o7
	sdivx	%i0,	0x1313,	%l3
	fbul,a	%fcc0,	loop_135
loop_134:
	st	%f19,	[%l7 + 0x0C]
	movgu	%xcc,	%o6,	%o1
	xorcc	%g7,	%o5,	%i1
loop_135:
	array32	%i3,	%g6,	%i2
	edge32n	%l6,	%l0,	%g4
	nop
	fitos	%f1,	%f29
	fstox	%f29,	%f16
	fxtos	%f16,	%f8
	mulscc	%l2,	0x0ACE,	%o0
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x11
	movg	%xcc,	%i6,	%g2
	fmovsa	%xcc,	%f17,	%f9
	edge32n	%o3,	%i7,	%l1
	srax	%o4,	0x00,	%l4
	sdiv	%l5,	0x0D12,	%i4
	orncc	%g5,	%g1,	%i5
	movneg	%xcc,	%g3,	%o2
	movrgz	%i0,	0x05E,	%o7
	call	loop_136
	movrlez	%o6,	%l3,	%o1
	bg	loop_137
	edge16ln	%g7,	%i1,	%o5
loop_136:
	fbe	%fcc3,	loop_138
	tleu	%icc,	0x2
loop_137:
	fmul8x16	%f17,	%f0,	%f0
	stbar
loop_138:
	sll	%i3,	%i2,	%l6
	brlez	%l0,	loop_139
	smul	%g6,	0x19D3,	%g4
	sir	0x1488
	fcmpgt32	%f8,	%f20,	%o0
loop_139:
	xnor	%l2,	0x0615,	%i6
	nop
	setx	0x2302F2788040DF5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fbl	%fcc3,	loop_140
	fxors	%f7,	%f12,	%f23
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g2
loop_140:
	fbg,a	%fcc3,	loop_141
	mova	%icc,	%o3,	%l1
	srax	%i7,	%l4,	%o4
	set	0x2C, %g4
	ldstuba	[%l7 + %g4] 0x11,	%l5
loop_141:
	nop
	setx	0x004B3DF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	umul	%i4,	0x1D5C,	%g1
	fnands	%f13,	%f20,	%f1
	edge8	%g5,	%i5,	%g3
	nop
	fitod	%f6,	%f30
	fdtos	%f30,	%f9
	edge32ln	%o2,	%i0,	%o7
	mulscc	%o6,	%o1,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%o5
	tvs	%icc,	0x0
	set	0x54, %o0
	sta	%f14,	[%l7 + %o0] 0x14
	edge32l	%i3,	%i1,	%l6
	brlez	%l0,	loop_142
	mulscc	%g6,	0x0034,	%i2
	bneg,pn	%icc,	loop_143
	fmovsa	%icc,	%f9,	%f1
loop_142:
	sdivx	%g4,	0x1ADB,	%o0
	bgu,a	%xcc,	loop_144
loop_143:
	fands	%f15,	%f28,	%f5
	fbue	%fcc1,	loop_145
	udiv	%i6,	0x05BF,	%l2
loop_144:
	sdivx	%o3,	0x145E,	%l1
	smulcc	%g2,	%l4,	%i7
loop_145:
	fpack32	%f30,	%f0,	%f26
	addc	%l5,	0x01F0,	%i4
	fba	%fcc0,	loop_146
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f0
	membar	0x16
	stbar
loop_146:
	ldd	[%l7 + 0x68],	%g0
	sub	%o4,	0x0359,	%i5
	movne	%icc,	%g3,	%o2
	edge32n	%g5,	%i0,	%o6
	fblg	%fcc3,	loop_147
	orcc	%o7,	0x1A73,	%g7
	orn	%l3,	0x1617,	%o5
	fmovrse	%i3,	%f24,	%f17
loop_147:
	fba	%fcc1,	loop_148
	array8	%o1,	%i1,	%l0
	bn	loop_149
	pdist	%f10,	%f30,	%f4
loop_148:
	ld	[%l7 + 0x10],	%f17
	movrgz	%g6,	0x014,	%i2
loop_149:
	fones	%f28
	fpadd32s	%f0,	%f12,	%f1
	fmovrdlz	%l6,	%f16,	%f8
	srlx	%o0,	0x15,	%g4
	fmovdgu	%icc,	%f12,	%f17
	nop
	setx	0x64AA0D7BC04B9DF9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	and	%l2,	0x0B36,	%o3
	nop
	setx	0xC0B99C8DB9CC583A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x94D23B1254A6867C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f12,	%f24
	bge	loop_150
	tpos	%icc,	0x0
	movvs	%xcc,	%l1,	%g2
	array8	%i6,	%l4,	%i7
loop_150:
	movcc	%xcc,	%l5,	%g1
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovdge	%xcc,	%f11,	%f15
	fmovrde	%i4,	%f6,	%f4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x18
	popc	0x1EF6,	%i5
	fbe,a	%fcc0,	loop_151
	movneg	%icc,	%o4,	%g3
	ldd	[%l7 + 0x50],	%f8
	membar	0x32
loop_151:
	fblg,a	%fcc1,	loop_152
	stx	%o2,	[%l7 + 0x40]
	ldsb	[%l7 + 0x4B],	%i0
	fpadd32s	%f27,	%f17,	%f31
loop_152:
	array32	%o6,	%o7,	%g7
	movne	%icc,	%g5,	%l3
	srl	%i3,	%o5,	%i1
	fpmerge	%f29,	%f22,	%f20
	movg	%icc,	%o1,	%g6
	fbug	%fcc2,	loop_153
	sdivcc	%i2,	0x0497,	%l6
	movre	%l0,	0x3C2,	%g4
	fbne	%fcc2,	loop_154
loop_153:
	sra	%l2,	0x03,	%o0
	movre	%o3,	0x27B,	%g2
	fcmpgt32	%f20,	%f22,	%l1
loop_154:
	fbn	%fcc1,	loop_155
	andncc	%i6,	%i7,	%l4
	ta	%icc,	0x1
	udiv	%g1,	0x086C,	%l5
loop_155:
	movrne	%i5,	0x2DC,	%i4
	movcc	%xcc,	%g3,	%o4
	array8	%i0,	%o2,	%o6
	stb	%o7,	[%l7 + 0x69]
	movl	%xcc,	%g7,	%g5
	udivx	%i3,	0x1D6F,	%l3
	movl	%icc,	%o5,	%i1
	tle	%icc,	0x7
	bgu,a	%icc,	loop_156
	swap	[%l7 + 0x60],	%o1
	nop
	setx loop_157, %l0, %l1
	jmpl %l1, %i2
	tcs	%icc,	0x6
loop_156:
	tne	%icc,	0x4
	fmovdl	%icc,	%f1,	%f25
loop_157:
	movrgz	%g6,	0x0B3,	%l0
	bl	%icc,	loop_158
	movleu	%icc,	%l6,	%g4
	faligndata	%f24,	%f20,	%f22
	umulcc	%o0,	%l2,	%g2
loop_158:
	orn	%l1,	%o3,	%i7
	array32	%i6,	%g1,	%l4
	movl	%xcc,	%i5,	%l5
	lduw	[%l7 + 0x18],	%g3
	movrne	%o4,	0x1DF,	%i0
	fmovrdgz	%i4,	%f28,	%f30
	udivcc	%o2,	0x15A6,	%o6
	tl	%xcc,	0x1
	mova	%icc,	%g7,	%o7
	or	%g5,	%l3,	%o5
	edge16	%i3,	%o1,	%i1
	ble,a,pt	%xcc,	loop_159
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%i2,	loop_160
	srlx	%g6,	0x08,	%l6
loop_159:
	ld	[%l7 + 0x08],	%f24
	set	0x0A, %o2
	ldsha	[%l7 + %o2] 0x80,	%l0
loop_160:
	srl	%o0,	%l2,	%g4
	sllx	%l1,	%g2,	%i7
	orcc	%o3,	0x1740,	%g1
	subcc	%i6,	%l4,	%i5
	tleu	%icc,	0x2
	mulx	%g3,	0x1801,	%l5
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f0
	fxtos	%f0,	%f21
	nop
	set	0x2C, %o7
	ldsb	[%l7 + %o7],	%i0
	addccc	%i4,	0x170E,	%o4
	subc	%o2,	0x1049,	%o6
	fandnot2	%f14,	%f30,	%f6
	fpadd16	%f0,	%f10,	%f6
	fmovde	%xcc,	%f12,	%f22
	brgz,a	%o7,	loop_161
	fpsub16	%f18,	%f16,	%f12
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f23
	bn,pt	%xcc,	loop_162
loop_161:
	flush	%l7 + 0x4C
	te	%xcc,	0x0
	fbo,a	%fcc3,	loop_163
loop_162:
	tvs	%xcc,	0x2
	fmovsne	%icc,	%f9,	%f21
	array8	%g7,	%g5,	%o5
loop_163:
	tge	%icc,	0x6
	movrgez	%l3,	%i3,	%i1
	fmovsgu	%xcc,	%f3,	%f24
	mulscc	%i2,	0x1ED8,	%g6
	tpos	%xcc,	0x3
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x0c,	%f16
	smulcc	%o1,	0x0026,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o0,	%l2
	edge8ln	%g4,	%l6,	%g2
	fmovrsgz	%l1,	%f23,	%f9
	move	%icc,	%o3,	%i7
	movrgz	%g1,	%i6,	%l4
	fbuge	%fcc2,	loop_164
	movle	%xcc,	%g3,	%l5
	orn	%i5,	0x1AF1,	%i0
	movg	%xcc,	%i4,	%o2
loop_164:
	movpos	%icc,	%o6,	%o7
	fmul8ulx16	%f22,	%f24,	%f28
	lduw	[%l7 + 0x20],	%g7
	nop
	fitos	%f2,	%f31
	fstoi	%f31,	%f18
	fcmpeq32	%f4,	%f20,	%g5
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x16,	%f16
	std	%f20,	[%l7 + 0x30]
	mova	%icc,	%o5,	%l3
	movgu	%xcc,	%i3,	%i1
	nop
	setx	0x73440610,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x8EC5D142,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f8,	%f13
	fbg,a	%fcc2,	loop_165
	movre	%o4,	%g6,	%o1
	set	0x28, %i5
	ldswa	[%l7 + %i5] 0x15,	%i2
loop_165:
	popc	%l0,	%o0
	edge8n	%g4,	%l6,	%l2
	ldsw	[%l7 + 0x38],	%g2
	addcc	%o3,	0x0EED,	%l1
	tcc	%xcc,	0x6
	movgu	%icc,	%g1,	%i7
	alignaddrl	%i6,	%l4,	%g3
	udivcc	%i5,	0x016D,	%l5
	fxors	%f16,	%f17,	%f13
	edge8l	%i0,	%o2,	%i4
	tcs	%xcc,	0x0
	fmovscs	%xcc,	%f19,	%f6
	ld	[%l7 + 0x38],	%f14
	brgz	%o6,	loop_166
	brgz	%g7,	loop_167
	prefetch	[%l7 + 0x34],	 0x3
	fmovrslz	%o7,	%f3,	%f28
loop_166:
	fmovsne	%icc,	%f28,	%f22
loop_167:
	ta	%icc,	0x6
	bgu,pn	%xcc,	loop_168
	tn	%icc,	0x3
	stbar
	movcs	%xcc,	%g5,	%l3
loop_168:
	tpos	%icc,	0x6
	subccc	%o5,	0x0265,	%i3
	fmovsle	%xcc,	%f16,	%f8
	xnor	%i1,	0x1069,	%o4
	array8	%g6,	%i2,	%l0
	fsrc2	%f20,	%f26
	srlx	%o0,	%g4,	%l6
	movl	%xcc,	%o1,	%g2
	udivcc	%o3,	0x1072,	%l2
	bcc,a	loop_169
	bge,a,pt	%xcc,	loop_170
	nop
	setx	0x53B4306B0067A297,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	udiv	%g1,	0x0F3E,	%i7
loop_169:
	te	%icc,	0x4
loop_170:
	edge8l	%i6,	%l4,	%l1
	bcc,a	%xcc,	loop_171
	array8	%g3,	%l5,	%i5
	fands	%f5,	%f26,	%f5
	nop
	set	0x18, %l4
	stx	%i0,	[%l7 + %l4]
loop_171:
	bvs,a	loop_172
	fornot2	%f24,	%f16,	%f24
	fsrc1	%f0,	%f22
	ldd	[%l7 + 0x48],	%f8
loop_172:
	swap	[%l7 + 0x58],	%i4
	nop
	fitos	%f0,	%f29
	fstox	%f29,	%f8
	fxtos	%f8,	%f7
	sdivcc	%o2,	0x0336,	%g7
	bn,pt	%xcc,	loop_173
	array8	%o7,	%o6,	%l3
	smul	%g5,	0x0443,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_173:
	tge	%xcc,	0x4
	alignaddr	%i3,	%o4,	%g6
	fmovdneg	%xcc,	%f4,	%f6
	fmovdle	%icc,	%f18,	%f0
	array32	%i1,	%l0,	%i2
	nop
	fitod	%f25,	%f18
	prefetch	[%l7 + 0x38],	 0x2
	alignaddr	%o0,	%g4,	%o1
	fcmpeq16	%f2,	%f14,	%g2
	tleu	%icc,	0x5
	fmovdcs	%xcc,	%f12,	%f0
	edge32l	%l6,	%l2,	%o3
	bcc,pn	%xcc,	loop_174
	fnot2	%f6,	%f8
	fnegs	%f29,	%f30
	tvs	%icc,	0x7
loop_174:
	ld	[%l7 + 0x10],	%f10
	movvs	%icc,	%i7,	%i6
	popc	0x0E0D,	%l4
	tvc	%xcc,	0x3
	edge16	%g1,	%l1,	%l5
	fba	%fcc3,	loop_175
	xnor	%i5,	%i0,	%i4
	bl,a,pt	%icc,	loop_176
	movrgez	%g3,	0x3F2,	%o2
loop_175:
	umul	%o7,	%g7,	%l3
	movg	%icc,	%o6,	%o5
loop_176:
	andncc	%i3,	%o4,	%g6
	fbu,a	%fcc1,	loop_177
	te	%icc,	0x4
	brlez,a	%i1,	loop_178
	tcs	%xcc,	0x4
loop_177:
	fbne	%fcc0,	loop_179
	andncc	%l0,	%i2,	%o0
loop_178:
	fmovdg	%xcc,	%f11,	%f8
	tn	%xcc,	0x1
loop_179:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g5,	%o1
	fxnors	%f12,	%f24,	%f15
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%l6
	tleu	%xcc,	0x1
	ldsb	[%l7 + 0x6F],	%l2
	bpos,pt	%icc,	loop_180
	subccc	%g2,	%i7,	%o3
	set	0x08, %g5
	ldswa	[%l7 + %g5] 0x14,	%l4
loop_180:
	movrne	%i6,	%l1,	%g1
	tn	%xcc,	0x0
	tg	%icc,	0x6
	edge8l	%i5,	%l5,	%i0
	sdiv	%g3,	0x06AB,	%i4
	std	%f10,	[%l7 + 0x28]
	ldd	[%l7 + 0x40],	%o6
	or	%g7,	%o2,	%l3
	movge	%xcc,	%o5,	%i3
	tl	%xcc,	0x0
	smulcc	%o4,	0x105A,	%g6
	srax	%o6,	%i1,	%l0
	edge8n	%o0,	%i2,	%g5
	tvc	%xcc,	0x4
	xorcc	%g4,	0x19BA,	%l6
	tle	%xcc,	0x7
	nop
	setx	0xA707C80D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xD40EBC01,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f29,	%f3
	tsubcc	%l2,	%g2,	%i7
	fbn	%fcc1,	loop_181
	add	%o1,	%o3,	%i6
	bge,a,pn	%xcc,	loop_182
	popc	0x04DF,	%l1
loop_181:
	sdiv	%l4,	0x17C9,	%i5
	edge8n	%l5,	%i0,	%g1
loop_182:
	edge32	%i4,	%o7,	%g3
	addc	%g7,	%l3,	%o5
	fsrc1	%f4,	%f26
	movpos	%xcc,	%i3,	%o2
	array8	%o4,	%o6,	%g6
	tneg	%icc,	0x4
	fblg,a	%fcc2,	loop_183
	faligndata	%f26,	%f16,	%f6
	set	0x34, %g7
	lduba	[%l7 + %g7] 0x11,	%l0
loop_183:
	ldx	[%l7 + 0x20],	%i1
	nop
	setx	0xD076B15B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x7CB4322D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f10,	%f22
	fmul8ulx16	%f24,	%f22,	%f2
	tl	%xcc,	0x3
	nop
	fitod	%f19,	%f12
	edge32ln	%o0,	%i2,	%g5
	addccc	%l6,	%l2,	%g2
	fnot2	%f18,	%f12
	fmovdleu	%icc,	%f31,	%f10
	tleu	%icc,	0x7
	movne	%icc,	%i7,	%g4
	orn	%o3,	0x1263,	%o1
	fandnot2s	%f17,	%f4,	%f25
	fmovdcc	%xcc,	%f20,	%f11
	orn	%l1,	%l4,	%i5
	add	%l5,	%i6,	%i0
	tg	%icc,	0x1
	fmovsn	%icc,	%f10,	%f8
	srlx	%i4,	%g1,	%g3
	movge	%icc,	%g7,	%l3
	fcmple16	%f16,	%f10,	%o5
	fornot2	%f30,	%f2,	%f4
	subccc	%i3,	0x0AC8,	%o7
	fmovda	%xcc,	%f17,	%f21
	fbn,a	%fcc0,	loop_184
	mulx	%o4,	0x002F,	%o2
	movre	%o6,	0x24C,	%g6
	edge16	%i1,	%o0,	%l0
loop_184:
	movne	%icc,	%i2,	%l6
	edge8ln	%g5,	%g2,	%i7
	movrlz	%l2,	0x0A8,	%g4
	st	%f8,	[%l7 + 0x7C]
	fmovdn	%icc,	%f0,	%f20
	call	loop_185
	orncc	%o1,	%o3,	%l1
	movvs	%xcc,	%i5,	%l4
	sdivcc	%i6,	0x1A67,	%i0
loop_185:
	sll	%l5,	0x16,	%g1
	ta	%icc,	0x1
	mulx	%g3,	%g7,	%i4
	fornot2	%f30,	%f26,	%f2
	brlz	%l3,	loop_186
	nop
	setx	0x50641056,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	fand	%f0,	%f18,	%f22
	edge8ln	%o5,	%o7,	%o4
loop_186:
	brgz	%o2,	loop_187
	tg	%xcc,	0x2
	umulcc	%i3,	0x192F,	%o6
	fbul	%fcc3,	loop_188
loop_187:
	sdivcc	%g6,	0x0E4F,	%i1
	subcc	%o0,	0x0ADC,	%l0
	taddcctv	%l6,	0x1074,	%i2
loop_188:
	movcs	%icc,	%g2,	%i7
	set	0x0B, %i7
	stba	%g5,	[%l7 + %i7] 0x88
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%l2
	tneg	%xcc,	0x3
	tcs	%xcc,	0x7
	edge8	%g4,	%o3,	%l1
	tpos	%icc,	0x3
	fbl	%fcc1,	loop_189
	fbo,a	%fcc3,	loop_190
	movvc	%icc,	%i5,	%l4
	nop
	setx	loop_191,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_189:
	fmul8x16au	%f25,	%f17,	%f8
loop_190:
	edge32l	%i6,	%o1,	%i0
	movrlez	%l5,	0x0D5,	%g1
loop_191:
	tsubcctv	%g7,	%i4,	%g3
	set	0x1A, %o3
	stha	%l3,	[%l7 + %o3] 0x2a
	membar	#Sync
	mova	%icc,	%o7,	%o4
	edge8l	%o5,	%i3,	%o6
	brnz	%g6,	loop_192
	sdivx	%o2,	0x0002,	%i1
	orn	%l0,	%o0,	%l6
	bvc,a,pn	%xcc,	loop_193
loop_192:
	ba	%xcc,	loop_194
	brgz,a	%i2,	loop_195
	fmovspos	%xcc,	%f17,	%f9
loop_193:
	nop
	setx	0x046B88904F4A6CAE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f28
loop_194:
	nop
	set	0x7C, %o6
	ldswa	[%l7 + %o6] 0x14,	%i7
loop_195:
	ta	%xcc,	0x0
	fmovrdlz	%g5,	%f10,	%f12
	fnot2s	%f25,	%f15
	tcc	%icc,	0x6
	movrlez	%l2,	%g2,	%g4
	mulscc	%l1,	0x1CFD,	%i5
	popc	%o3,	%i6
	fexpand	%f8,	%f16
	fexpand	%f24,	%f18
	sllx	%l4,	%o1,	%i0
	movcs	%icc,	%g1,	%g7
	movcc	%icc,	%i4,	%l5
	edge8ln	%g3,	%l3,	%o4
	membar	0x04
	edge16	%o5,	%i3,	%o6
	ble,pt	%icc,	loop_196
	ta	%xcc,	0x3
	array32	%o7,	%g6,	%i1
	movrgez	%o2,	0x121,	%l0
loop_196:
	edge16	%l6,	%o0,	%i7
	fbule,a	%fcc2,	loop_197
	fmovs	%f29,	%f15
	and	%g5,	%l2,	%g2
	bl,pn	%xcc,	loop_198
loop_197:
	edge32	%g4,	%i2,	%l1
	umulcc	%o3,	0x0B1E,	%i5
	movleu	%icc,	%i6,	%o1
loop_198:
	stb	%l4,	[%l7 + 0x49]
	sllx	%g1,	%i0,	%g7
	movn	%icc,	%i4,	%g3
	array16	%l3,	%o4,	%l5
	sir	0x1A50
	fcmpeq32	%f26,	%f26,	%o5
	xnor	%o6,	%o7,	%i3
	tsubcctv	%i1,	0x104E,	%o2
	ble,pn	%xcc,	loop_199
	fmovrdlz	%l0,	%f12,	%f20
	sra	%g6,	0x0A,	%l6
	movre	%i7,	%g5,	%l2
loop_199:
	fmul8ulx16	%f26,	%f0,	%f10
	fmovs	%f21,	%f12
	movvs	%xcc,	%g2,	%g4
	ta	%xcc,	0x7
	movcs	%xcc,	%i2,	%o0
	fnot2s	%f18,	%f13
	fnand	%f8,	%f6,	%f16
	fpsub32	%f16,	%f26,	%f16
	sra	%o3,	%l1,	%i6
	nop
	setx	loop_200,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%i5,	%o1,	%l4
	fabsd	%f18,	%f26
	sir	0x100B
loop_200:
	sll	%i0,	0x0A,	%g7
	array32	%i4,	%g3,	%l3
	fexpand	%f23,	%f30
	ldd	[%l7 + 0x10],	%g0
	tg	%xcc,	0x2
	tneg	%xcc,	0x0
	edge32l	%o4,	%l5,	%o5
	fcmpne32	%f2,	%f8,	%o7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x10,	%i3,	%o6
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x14,	%i0
	flush	%l7 + 0x4C
	movl	%icc,	%l0,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f29
	ta	%xcc,	0x3
	fbue	%fcc1,	loop_201
	ta	%icc,	0x3
	orcc	%g6,	%l6,	%g5
	ldx	[%l7 + 0x50],	%l2
loop_201:
	membar	0x7A
	bcc,a,pt	%xcc,	loop_202
	edge32l	%g2,	%g4,	%i7
	set	0x58, %g6
	ldsha	[%l7 + %g6] 0x15,	%o0
loop_202:
	tg	%xcc,	0x0
	fbug	%fcc1,	loop_203
	nop
	setx	0x705E6B7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	bshuffle	%f18,	%f0,	%f18
	array8	%i2,	%o3,	%i6
loop_203:
	fbo,a	%fcc0,	loop_204
	ta	%xcc,	0x1
	movcc	%icc,	%i5,	%o1
	sir	0x1025
loop_204:
	movneg	%icc,	%l4,	%i0
	sethi	0x043E,	%g7
	sllx	%i4,	%l1,	%g3
	edge32n	%l3,	%o4,	%g1
	fmovdl	%icc,	%f28,	%f29
	tcc	%icc,	0x6
	movneg	%icc,	%l5,	%o5
	edge16l	%o7,	%o6,	%i3
	tn	%icc,	0x1
	fmovrsgez	%l0,	%f19,	%f0
	edge16n	%o2,	%g6,	%l6
	edge16ln	%g5,	%i1,	%g2
	tgu	%xcc,	0x7
	edge16n	%l2,	%i7,	%o0
	ldd	[%l7 + 0x08],	%g4
	fornot1s	%f22,	%f17,	%f6
	popc	0x0A3F,	%o3
	edge16ln	%i6,	%i5,	%o1
	udiv	%i2,	0x053E,	%i0
	udivcc	%g7,	0x11D6,	%l4
	movcc	%xcc,	%i4,	%l1
	orcc	%l3,	0x1B24,	%o4
	brlez,a	%g1,	loop_205
	addcc	%g3,	%o5,	%o7
	movn	%icc,	%o6,	%l5
	addc	%i3,	0x1574,	%o2
loop_205:
	addc	%g6,	%l6,	%l0
	fblg,a	%fcc2,	loop_206
	bne,a	%xcc,	loop_207
	fnot2s	%f20,	%f9
	fmovdle	%icc,	%f4,	%f4
loop_206:
	bcc,a	%xcc,	loop_208
loop_207:
	edge16ln	%i1,	%g2,	%g5
	faligndata	%f4,	%f20,	%f26
	ba,a	%xcc,	loop_209
loop_208:
	movrlez	%i7,	0x2E0,	%l2
	tgu	%icc,	0x6
	array32	%g4,	%o3,	%o0
loop_209:
	fnot1s	%f15,	%f3
	subc	%i5,	%i6,	%i2
	sub	%i0,	0x0695,	%g7
	fmovs	%f10,	%f10
	sdivx	%l4,	0x03D3,	%i4
	fmovrsgez	%o1,	%f31,	%f6
	fmovsne	%xcc,	%f11,	%f1
	bne,a	%icc,	loop_210
	andncc	%l3,	%o4,	%g1
	nop
	setx	0x2E6F2DA1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xD4A3CB5E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f31,	%f14
	sdiv	%g3,	0x0BF4,	%o5
loop_210:
	movle	%icc,	%l1,	%o6
	bge	loop_211
	sethi	0x1CCC,	%l5
	tl	%xcc,	0x3
	movneg	%xcc,	%o7,	%i3
loop_211:
	edge16	%o2,	%l6,	%l0
	bshuffle	%f26,	%f8,	%f6
	ba,a	loop_212
	bvc	loop_213
	fnot1	%f6,	%f16
	fnands	%f29,	%f10,	%f18
loop_212:
	xnor	%i1,	%g6,	%g5
loop_213:
	nop
	set	0x31, %i2
	ldstuba	[%l7 + %i2] 0x81,	%g2
	xorcc	%l2,	0x0C5C,	%g4
	set	0x33, %i4
	ldstuba	[%l7 + %i4] 0x10,	%o3
	sir	0x0010
	srax	%i7,	%i5,	%i6
	mulscc	%i2,	%o0,	%i0
	xnorcc	%l4,	%g7,	%i4
	udivcc	%l3,	0x0090,	%o4
	wr	%g0,	0x23,	%asi
	stha	%g1,	[%l7 + 0x74] %asi
	membar	#Sync
	fbo	%fcc3,	loop_214
	std	%f14,	[%l7 + 0x38]
	tcc	%xcc,	0x2
	nop
	fitod	%f2,	%f2
	fdtoi	%f2,	%f22
loop_214:
	xorcc	%g3,	%o5,	%o1
	or	%o6,	0x0CAA,	%l5
	sra	%o7,	0x14,	%i3
	array16	%l1,	%l6,	%o2
	brgz,a	%l0,	loop_215
	fmovsgu	%icc,	%f12,	%f15
	fbe	%fcc0,	loop_216
	edge16	%g6,	%i1,	%g2
loop_215:
	fmovdge	%xcc,	%f2,	%f4
	array32	%l2,	%g5,	%o3
loop_216:
	tgu	%xcc,	0x7
	udivx	%i7,	0x18A1,	%g4
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f2
	fxtod	%f2,	%f2
	nop
	setx	loop_217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f16,	%f20
	fmovdvc	%xcc,	%f10,	%f0
	bvs,pn	%icc,	loop_218
loop_217:
	fpsub32s	%f6,	%f10,	%f26
	bcs	%icc,	loop_219
	ta	%icc,	0x1
loop_218:
	tsubcctv	%i5,	%i2,	%o0
	fbue	%fcc2,	loop_220
loop_219:
	smulcc	%i6,	0x12E5,	%i0
	sll	%g7,	%l4,	%l3
	fnegs	%f9,	%f24
loop_220:
	fmovrdgz	%i4,	%f10,	%f22
	tpos	%xcc,	0x3
	fmovsneg	%icc,	%f16,	%f24
	te	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x09] %asi,	%o4
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x108] %asi,	%g3
	fmovdl	%xcc,	%f13,	%f23
	movgu	%xcc,	%o5,	%g1
	smul	%o6,	%l5,	%o7
	bgu,pn	%icc,	loop_221
	stx	%o1,	[%l7 + 0x78]
	alignaddrl	%l1,	%i3,	%o2
	bvs,a	%xcc,	loop_222
loop_221:
	andn	%l6,	0x0CC5,	%g6
	udivx	%l0,	0x17FB,	%i1
	call	loop_223
loop_222:
	fornot1	%f10,	%f16,	%f2
	fsrc1	%f0,	%f2
	movcs	%icc,	%l2,	%g2
loop_223:
	fcmpne16	%f0,	%f24,	%o3
	fsrc2	%f12,	%f2
	sll	%i7,	%g5,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%i2
	sdiv	%o0,	0x0214,	%i6
	fbne	%fcc2,	loop_224
	sllx	%i0,	%g7,	%l4
	edge16	%l3,	%o4,	%i4
	movgu	%xcc,	%o5,	%g3
loop_224:
	subc	%g1,	%l5,	%o7
	xnorcc	%o1,	0x1666,	%o6
	fmovsne	%xcc,	%f29,	%f8
	fmuld8sux16	%f17,	%f14,	%f18
	tge	%icc,	0x4
	tneg	%icc,	0x7
	edge16l	%l1,	%o2,	%i3
	array32	%l6,	%l0,	%g6
	fpack16	%f12,	%f26
	tn	%xcc,	0x4
	fbne,a	%fcc3,	loop_225
	movge	%icc,	%i1,	%g2
	fmul8x16	%f9,	%f8,	%f8
	umulcc	%l2,	%o3,	%g5
loop_225:
	tn	%xcc,	0x1
	xnor	%i5,	0x0416,	%i7
	fmovrsne	%g4,	%f25,	%f25
	flush	%l7 + 0x0C
	be,pt	%xcc,	loop_226
	movneg	%xcc,	%o0,	%i6
	movvs	%xcc,	%i2,	%i0
	bpos,pt	%xcc,	loop_227
loop_226:
	add	%g7,	0x1B49,	%l3
	sdiv	%l4,	0x066E,	%o4
	movcc	%icc,	%i4,	%g3
loop_227:
	alignaddr	%g1,	%o5,	%o7
	movgu	%xcc,	%o1,	%o6
	edge8ln	%l1,	%o2,	%l5
	brz	%l6,	loop_228
	edge16l	%i3,	%g6,	%l0
	ldx	[%l7 + 0x78],	%i1
	flush	%l7 + 0x38
loop_228:
	sra	%g2,	0x01,	%l2
	fone	%f6
	subccc	%o3,	0x0796,	%g5
	sth	%i7,	[%l7 + 0x54]
	umul	%g4,	0x177E,	%i5
	bn,pt	%icc,	loop_229
	movrlz	%i6,	%o0,	%i0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x48] %asi,	%g7
loop_229:
	sra	%i2,	%l4,	%o4
	orn	%l3,	0x1025,	%g3
	sth	%g1,	[%l7 + 0x50]
	movvc	%xcc,	%o5,	%i4
	movrgez	%o1,	0x1E2,	%o7
	edge8l	%o6,	%l1,	%o2
	popc	0x01BB,	%l5
	orn	%i3,	%g6,	%l6
	std	%f26,	[%l7 + 0x78]
	set	0x5C, %o4
	ldsha	[%l7 + %o4] 0x10,	%i1
	alignaddrl	%g2,	%l0,	%l2
	subccc	%o3,	0x1EFF,	%g5
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x16
	membar	#Sync
	array32	%i7,	%g4,	%i5
	fsrc1	%f6,	%f14
	movrgez	%o0,	0x2CF,	%i0
	sdivcc	%i6,	0x1FBA,	%g7
	tgu	%xcc,	0x2
	sethi	0x0E38,	%l4
	movcc	%icc,	%o4,	%l3
	bpos	%xcc,	loop_230
	edge32n	%i2,	%g1,	%o5
	fandnot2	%f4,	%f24,	%f30
	membar	0x09
loop_230:
	nop
	set	0x2A, %l2
	lduh	[%l7 + %l2],	%i4
	subccc	%o1,	0x0309,	%g3
	orn	%o7,	0x1D39,	%o6
	sll	%o2,	0x06,	%l1
	movre	%l5,	0x3ED,	%i3
	tvc	%icc,	0x2
	set	0x74, %l5
	ldsha	[%l7 + %l5] 0x80,	%l6
	edge32l	%g6,	%g2,	%l0
	sub	%i1,	%l2,	%o3
	ta	%icc,	0x4
	nop
	setx	0x01259C32,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x79FC8FDA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f1,	%f20
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%i7
	nop
	setx	0x17FC4558,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f27
	set	0x48, %l3
	lduwa	[%l7 + %l3] 0x18,	%g5
	fmovsgu	%icc,	%f25,	%f1
	addccc	%g4,	%i5,	%o0
	movrlez	%i6,	%i0,	%l4
	addcc	%g7,	0x1958,	%l3
	tvc	%xcc,	0x4
	alignaddrl	%i2,	%g1,	%o5
	sdiv	%i4,	0x0036,	%o4
	bge,a	%icc,	loop_231
	tneg	%xcc,	0x3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x19,	%f16
loop_231:
	movrgz	%o1,	%g3,	%o6
	fmovrsne	%o7,	%f2,	%f11
	nop
	fitos	%f7,	%f31
	fstox	%f31,	%f6
	orncc	%l1,	%o2,	%l5
	tgu	%icc,	0x7
	edge8l	%l6,	%i3,	%g2
	movrlz	%g6,	0x27B,	%i1
	edge32n	%l0,	%l2,	%o3
	tsubcc	%g5,	%i7,	%g4
	bneg,pn	%icc,	loop_232
	stbar
	edge16	%o0,	%i6,	%i0
	movl	%xcc,	%i5,	%l4
loop_232:
	brlez	%g7,	loop_233
	bgu,a,pt	%xcc,	loop_234
	mulx	%l3,	0x09B9,	%i2
	bvs	loop_235
loop_233:
	edge16n	%g1,	%o5,	%i4
loop_234:
	fcmple32	%f18,	%f14,	%o1
	movleu	%icc,	%o4,	%g3
loop_235:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o7
	bl,a	%xcc,	loop_236
	ld	[%l7 + 0x74],	%f12
	xorcc	%l1,	0x1108,	%o6
	mulx	%o2,	0x1BE1,	%l6
loop_236:
	sllx	%l5,	0x02,	%g2
	and	%g6,	0x1E96,	%i1
	add	%i3,	%l2,	%o3
	fsrc2	%f20,	%f8
	tge	%icc,	0x2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	fpmerge	%f18,	%f2,	%f22
	tcs	%icc,	0x6
	tcc	%icc,	0x4
	mova	%icc,	%l0,	%i7
	sdivx	%g4,	0x1F6D,	%i6
	ta	%icc,	0x4
	andcc	%o0,	0x0F65,	%i5
	movle	%icc,	%i0,	%g7
	movrlez	%l3,	%i2,	%g1
	stb	%l4,	[%l7 + 0x67]
	andcc	%i4,	%o5,	%o4
	stbar
	fbu,a	%fcc3,	loop_237
	tle	%icc,	0x7
	fpadd32	%f2,	%f0,	%f10
	nop
	setx	0x145E9D58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x40D8252C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f26,	%f16
loop_237:
	te	%icc,	0x3
	subc	%o1,	0x071F,	%o7
	nop
	setx	0x220B84B36413EB24,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFB05CC444772E850,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f2,	%f30
	nop
	setx	0xAA96BDFBF070F2DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	wr	%g0,	0x2a,	%asi
	stba	%l1,	[%l7 + 0x5F] %asi
	membar	#Sync
	te	%xcc,	0x2
	orncc	%o6,	0x15A6,	%g3
	pdist	%f30,	%f14,	%f26
	movge	%xcc,	%o2,	%l5
	sethi	0x1682,	%l6
	addc	%g2,	0x162D,	%i1
	ta	%xcc,	0x2
	srl	%i3,	0x1E,	%l2
	movrlz	%g6,	%o3,	%g5
	fmovrdlz	%i7,	%f6,	%f8
	st	%f7,	[%l7 + 0x0C]
	st	%f20,	[%l7 + 0x1C]
	movne	%xcc,	%g4,	%i6
	fbe,a	%fcc3,	loop_238
	movvc	%xcc,	%o0,	%i5
	membar	0x70
	sethi	0x0490,	%i0
loop_238:
	fcmpeq16	%f10,	%f22,	%l0
	fbn	%fcc2,	loop_239
	edge16l	%l3,	%g7,	%i2
	edge16l	%g1,	%l4,	%i4
	ble,a	loop_240
loop_239:
	te	%icc,	0x5
	tneg	%icc,	0x4
	stw	%o5,	[%l7 + 0x64]
loop_240:
	fbo,a	%fcc3,	loop_241
	ble,a,pn	%xcc,	loop_242
	andcc	%o4,	0x1A0C,	%o1
	srax	%o7,	%l1,	%g3
loop_241:
	fpack32	%f12,	%f22,	%f18
loop_242:
	edge32	%o6,	%o2,	%l5
	fbe,a	%fcc2,	loop_243
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f27,	%f20
	fmovsneg	%icc,	%f28,	%f22
loop_243:
	mova	%xcc,	%g2,	%i1
	fmuld8sux16	%f19,	%f22,	%f10
	edge16ln	%i3,	%l6,	%l2
	andn	%o3,	%g5,	%i7
	fnors	%f6,	%f19,	%f8
	or	%g4,	%i6,	%o0
	bge,pn	%xcc,	loop_244
	srax	%g6,	0x0B,	%i0
	st	%f4,	[%l7 + 0x18]
	fandnot1s	%f23,	%f28,	%f28
loop_244:
	movg	%xcc,	%l0,	%i5
	fpackfix	%f0,	%f8
	fmovrslez	%l3,	%f12,	%f12
	fxors	%f0,	%f19,	%f31
	bgu,pn	%xcc,	loop_245
	fbuge,a	%fcc3,	loop_246
	array32	%g7,	%g1,	%i2
	fmovsn	%icc,	%f4,	%f9
loop_245:
	ldsb	[%l7 + 0x63],	%i4
loop_246:
	sir	0x1167
	xnor	%o5,	%o4,	%l4
	addcc	%o1,	%l1,	%o7
	fabss	%f29,	%f18
	tvc	%xcc,	0x5
	movneg	%icc,	%o6,	%o2
	sir	0x18C8
	alignaddr	%g3,	%g2,	%l5
	edge8	%i3,	%l6,	%l2
	bg,a	%xcc,	loop_247
	brnz	%i1,	loop_248
	fnot1	%f6,	%f6
	set	0x1C, %g3
	swapa	[%l7 + %g3] 0x88,	%g5
loop_247:
	array16	%o3,	%i7,	%i6
loop_248:
	movre	%o0,	0x0F1,	%g6
	set	0x5D, %l6
	stba	%i0,	[%l7 + %l6] 0x89
	fbg	%fcc0,	loop_249
	array8	%g4,	%i5,	%l0
	fbu	%fcc3,	loop_250
	addc	%g7,	0x172A,	%l3
loop_249:
	subccc	%i2,	%g1,	%i4
	taddcc	%o5,	0x101F,	%l4
loop_250:
	subccc	%o4,	0x160C,	%l1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x41] %asi,	%o7
	movne	%xcc,	%o6,	%o2
	taddcctv	%o1,	%g2,	%g3
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	brz,a	%l5,	loop_251
	tsubcc	%l6,	0x188B,	%i3
	edge8ln	%l2,	%i1,	%o3
	edge16ln	%i7,	%g5,	%i6
loop_251:
	movre	%g6,	0x1EF,	%o0
	movvc	%icc,	%g4,	%i0
	xnorcc	%i5,	%g7,	%l3
	mulscc	%l0,	0x11A5,	%g1
	movrgz	%i2,	0x1AB,	%i4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x0c,	%f16
	addcc	%o5,	%l4,	%l1
	taddcctv	%o4,	%o7,	%o6
	brgz	%o2,	loop_252
	edge8l	%g2,	%g3,	%o1
	sdivx	%l5,	0x019F,	%l6
	tle	%icc,	0x1
loop_252:
	ldsw	[%l7 + 0x24],	%i3
	alignaddr	%l2,	%o3,	%i7
	brnz	%g5,	loop_253
	mulscc	%i1,	%g6,	%o0
	fmovdn	%xcc,	%f23,	%f10
	movrlez	%g4,	0x1AA,	%i6
loop_253:
	nop
	set	0x58, %o5
	stxa	%i5,	[%l7 + %o5] 0x89
	movg	%icc,	%g7,	%i0
	movg	%xcc,	%l0,	%l3
	fcmpgt32	%f18,	%f30,	%i2
	fbug	%fcc0,	loop_254
	xnorcc	%i4,	%g1,	%l4
	tvc	%xcc,	0x4
	movge	%xcc,	%o5,	%l1
loop_254:
	nop
	setx	loop_255,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bge,a	%xcc,	loop_256
	fmovsl	%xcc,	%f6,	%f0
	nop
	setx loop_257, %l0, %l1
	jmpl %l1, %o4
loop_255:
	edge16ln	%o7,	%o2,	%g2
loop_256:
	ldd	[%l7 + 0x08],	%g2
	bvs	%xcc,	loop_258
loop_257:
	tg	%icc,	0x1
	tvc	%xcc,	0x3
	taddcc	%o6,	0x1092,	%o1
loop_258:
	edge8n	%l6,	%i3,	%l5
	bneg	loop_259
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc0,	loop_260
	edge32l	%o3,	%i7,	%g5
loop_259:
	edge32	%l2,	%g6,	%i1
	fmovsgu	%icc,	%f8,	%f17
loop_260:
	movneg	%icc,	%o0,	%g4
	swap	[%l7 + 0x34],	%i5
	sub	%i6,	%i0,	%g7
	ta	%xcc,	0x6
	sub	%l0,	%l3,	%i4
	nop
	setx	0x64904C6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x492C6D0E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f19,	%f24
	addc	%g1,	0x01F4,	%l4
	ba,pn	%icc,	loop_261
	fbe,a	%fcc0,	loop_262
	fmovdne	%xcc,	%f23,	%f30
	edge16ln	%i2,	%l1,	%o4
loop_261:
	tvc	%xcc,	0x2
loop_262:
	tcc	%icc,	0x1
	tgu	%icc,	0x4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%o2
	sub	%g2,	%o7,	%o6
	subc	%o1,	%l6,	%i3
	umulcc	%g3,	0x15EE,	%o3
	nop
	setx	0xA022A7E625D90E1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x055458D3D9CAD163,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f8,	%f0
	call	loop_263
	nop
	setx	0x96F989FD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x15DDC052,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f1,	%f20
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%l5
loop_263:
	fpack16	%f12,	%f1
	movre	%l2,	%g6,	%i1
	movrgz	%o0,	%g4,	%i5
	ldsb	[%l7 + 0x11],	%g5
	or	%i0,	%i6,	%g7
	xorcc	%l0,	0x1459,	%i4
	fxnors	%f11,	%f16,	%f18
	add	%l3,	%l4,	%g1
	move	%xcc,	%i2,	%l1
	tleu	%icc,	0x5
	movl	%icc,	%o5,	%o2
	fmovde	%xcc,	%f22,	%f22
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g2
	nop
	setx	loop_264,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%o4,	0x04,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o7,	%o1
loop_264:
	fmovrse	%l6,	%f21,	%f1
	movcc	%xcc,	%g3,	%i3
	tl	%xcc,	0x4
	nop
	setx loop_265, %l0, %l1
	jmpl %l1, %i7
	fpsub16	%f14,	%f24,	%f24
	brlez	%l5,	loop_266
	fzeros	%f5
loop_265:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x64] %asi,	%o3
loop_266:
	fmovrdgz	%g6,	%f14,	%f26
	flush	%l7 + 0x50
	fors	%f4,	%f10,	%f8
	edge32n	%i1,	%l2,	%g4
	edge8l	%o0,	%g5,	%i5
	lduw	[%l7 + 0x78],	%i6
	fba,a	%fcc0,	loop_267
	fbuge	%fcc1,	loop_268
	andn	%i0,	%g7,	%i4
	brnz,a	%l3,	loop_269
loop_267:
	edge8l	%l0,	%l4,	%g1
loop_268:
	xorcc	%i2,	0x017A,	%o5
	bneg,pn	%xcc,	loop_270
loop_269:
	mulx	%o2,	0x02B5,	%l1
	lduw	[%l7 + 0x54],	%g2
	fmovrdgez	%o6,	%f14,	%f16
loop_270:
	movrlz	%o4,	%o7,	%l6
	fbn	%fcc2,	loop_271
	call	loop_272
	edge32l	%g3,	%o1,	%i3
	fmovde	%icc,	%f2,	%f11
loop_271:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_272:
	fcmpgt32	%f0,	%f4,	%i7
	fmovrslz	%o3,	%f15,	%f17
	or	%g6,	0x02DC,	%i1
	and	%l5,	%l2,	%g4
	movl	%xcc,	%g5,	%i5
	tne	%icc,	0x1
	edge8n	%o0,	%i6,	%g7
	fmovdgu	%xcc,	%f24,	%f22
	orcc	%i0,	0x1B83,	%i4
	nop
	setx	loop_273,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	pdist	%f12,	%f8,	%f2
	set	0x2C, %i3
	stba	%l0,	[%l7 + %i3] 0x10
loop_273:
	bgu,a,pt	%xcc,	loop_274
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l4,	%l3,	%g1
	nop
	setx	loop_275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_274:
	edge16l	%i2,	%o2,	%o5
	udivcc	%l1,	0x0C64,	%g2
	tsubcctv	%o4,	0x0E4E,	%o7
loop_275:
	edge32	%o6,	%g3,	%o1
	fmovrdlz	%l6,	%f14,	%f0
	orncc	%i7,	%o3,	%g6
	fands	%f14,	%f16,	%f24
	nop
	setx	loop_276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsb	[%l7 + 0x68],	%i3
	fmovsl	%icc,	%f15,	%f9
	fxnor	%f12,	%f30,	%f30
loop_276:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%l5,	[%g0 + 0x38] %asi
	fbul,a	%fcc0,	loop_277
	fnegd	%f6,	%f22
	ldd	[%l7 + 0x30],	%f26
	movne	%icc,	%i1,	%g4
loop_277:
	bne,a,pt	%xcc,	loop_278
	orncc	%g5,	0x15A6,	%i5
	bcc,a	loop_279
	xnorcc	%o0,	0x02FB,	%l2
loop_278:
	sethi	0x0B48,	%g7
	lduw	[%l7 + 0x64],	%i0
loop_279:
	tge	%icc,	0x4
	subcc	%i4,	0x02B2,	%i6
	fzero	%f10
	tcs	%xcc,	0x1
	fmovsneg	%xcc,	%f17,	%f15
	tg	%xcc,	0x5
	udivcc	%l4,	0x0195,	%l3
	add	%g1,	0x06EF,	%i2
	edge32n	%l0,	%o5,	%l1
	movg	%icc,	%g2,	%o2
	movl	%icc,	%o4,	%o6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g3
	add	%o7,	%o1,	%l6
	tn	%icc,	0x0
	tcc	%icc,	0x0
	edge32	%o3,	%g6,	%i3
	array8	%i7,	%l5,	%g4
	fandnot2	%f16,	%f8,	%f24
	alignaddrl	%g5,	%i5,	%i1
	nop
	setx	0x17DF6157504F6F50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fpsub32s	%f7,	%f4,	%f7
	set	0x6C, %g4
	stwa	%o0,	[%l7 + %g4] 0xe2
	membar	#Sync
	fbo	%fcc3,	loop_280
	movrgez	%g7,	0x304,	%l2
	bge,a	loop_281
	bpos,a,pt	%xcc,	loop_282
loop_280:
	st	%f12,	[%l7 + 0x3C]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x19
loop_281:
	edge32	%i4,	%i0,	%i6
loop_282:
	movneg	%xcc,	%l4,	%g1
	prefetch	[%l7 + 0x58],	 0x3
	wr	%g0,	0x22,	%asi
	stha	%l3,	[%l7 + 0x14] %asi
	membar	#Sync
	tge	%xcc,	0x2
	andn	%i2,	%l0,	%o5
	umulcc	%g2,	%o2,	%l1
	xnor	%o4,	0x12B1,	%o6
	orcc	%g3,	0x16FE,	%o7
	edge8l	%l6,	%o3,	%o1
	udivx	%g6,	0x0A60,	%i3
	tcc	%xcc,	0x0
	fmovdneg	%icc,	%f26,	%f2
	fmovrdgez	%i7,	%f12,	%f6
	edge32n	%l5,	%g5,	%g4
	orncc	%i1,	0x19EA,	%i5
	xnor	%g7,	%o0,	%i4
	fabsd	%f20,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i0,	%i6
	tg	%xcc,	0x4
	tsubcctv	%l2,	0x026B,	%g1
	fpsub16s	%f8,	%f7,	%f6
	movpos	%xcc,	%l4,	%i2
	movre	%l0,	0x06E,	%l3
	edge16ln	%o5,	%o2,	%l1
	xnor	%o4,	0x1BFA,	%o6
	brgz	%g2,	loop_283
	tleu	%xcc,	0x6
	movrne	%g3,	%l6,	%o7
	sll	%o3,	%o1,	%g6
loop_283:
	fmovdl	%icc,	%f18,	%f20
	wr	%g0,	0x2a,	%asi
	stba	%i7,	[%l7 + 0x12] %asi
	membar	#Sync
	sub	%i3,	%l5,	%g5
	bcs,pn	%icc,	loop_284
	sdivx	%g4,	0x1A32,	%i1
	subcc	%i5,	0x024A,	%o0
	edge32ln	%i4,	%g7,	%i6
loop_284:
	movne	%xcc,	%i0,	%l2
	fblg	%fcc2,	loop_285
	fpsub16s	%f13,	%f24,	%f16
	nop
	setx	0xA04C48D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	nop
	setx	0x2D0F24204E5C5F9F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x269843E09892D1A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f18,	%f8
loop_285:
	movle	%xcc,	%l4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i2,	%l3,	%l0
	fmovrdne	%o2,	%f12,	%f24
	set	0x0F, %o0
	ldsba	[%l7 + %o0] 0x89,	%l1
	be,a	%icc,	loop_286
	fsrc2s	%f7,	%f25
	edge32n	%o4,	%o5,	%g2
	orn	%g3,	%l6,	%o7
loop_286:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o3,	0x1073,	%o1
	fbl	%fcc2,	loop_287
	edge32	%o6,	%g6,	%i3
	fands	%f6,	%f18,	%f15
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
loop_287:
	edge8ln	%l5,	%g4,	%g5
	edge16	%i1,	%i5,	%i4
	addc	%o0,	%i6,	%i0
	movge	%xcc,	%g7,	%l2
	or	%l4,	0x0183,	%i2
	tvs	%xcc,	0x0
	sra	%l3,	%g1,	%l0
	sllx	%l1,	%o2,	%o5
	movneg	%icc,	%g2,	%o4
	pdist	%f22,	%f6,	%f12
	movcc	%icc,	%l6,	%g3
	fnands	%f1,	%f18,	%f26
	popc	0x0E07,	%o3
	fabsd	%f26,	%f30
	tle	%icc,	0x0
	tleu	%icc,	0x5
	taddcc	%o7,	0x04B4,	%o6
	or	%g6,	%i3,	%i7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%l5
	st	%f2,	[%l7 + 0x68]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f18,	%f22,	%g4
	move	%icc,	%o1,	%g5
	umulcc	%i5,	0x019A,	%i4
	sra	%o0,	%i1,	%i0
	edge32	%g7,	%i6,	%l4
	move	%icc,	%i2,	%l2
	ldd	[%l7 + 0x18],	%g0
	tsubcctv	%l0,	%l3,	%o2
	nop
	setx	0xC6EADBEA09F54B6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x814FDEDFB1920DC2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f4,	%f4
	sdivcc	%o5,	0x17B2,	%l1
	movrgez	%o4,	%g2,	%g3
	tvs	%icc,	0x0
	prefetch	[%l7 + 0x44],	 0x3
	movge	%xcc,	%o3,	%l6
	fbg,a	%fcc2,	loop_288
	tsubcc	%o7,	0x114E,	%o6
	edge32ln	%i3,	%i7,	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g4,	%l5
loop_288:
	edge32ln	%o1,	%g5,	%i4
	fmovrsne	%o0,	%f23,	%f3
	movvs	%xcc,	%i1,	%i5
	stbar
	set	0x08, %o2
	lda	[%l7 + %o2] 0x18,	%f18
	srlx	%g7,	0x1E,	%i6
	brlez	%i0,	loop_289
	tcc	%icc,	0x0
	fmovsgu	%xcc,	%f20,	%f8
	bgu	%icc,	loop_290
loop_289:
	addc	%l4,	0x0F33,	%l2
	fbug,a	%fcc1,	loop_291
	addccc	%g1,	%i2,	%l0
loop_290:
	udivcc	%l3,	0x0B80,	%o2
	fbo,a	%fcc1,	loop_292
loop_291:
	nop
	set	0x72, %g1
	sth	%o5,	[%l7 + %g1]
	fcmpgt16	%f4,	%f20,	%o4
	taddcc	%l1,	%g2,	%g3
loop_292:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l6,	%o3
	fmovsa	%icc,	%f11,	%f19
	addcc	%o7,	%o6,	%i7
	mova	%xcc,	%g6,	%i3
	umulcc	%g4,	%o1,	%l5
	fpadd16	%f8,	%f8,	%f22
	movcs	%xcc,	%g5,	%o0
	udiv	%i4,	0x02BF,	%i1
	movge	%xcc,	%i5,	%i6
	fandnot1s	%f16,	%f13,	%f27
	fmovse	%icc,	%f27,	%f12
	tleu	%icc,	0x6
	tgu	%xcc,	0x5
	movle	%xcc,	%g7,	%i0
	sllx	%l4,	%g1,	%l2
	srax	%i2,	0x01,	%l3
	move	%icc,	%o2,	%l0
	udiv	%o5,	0x13C9,	%l1
	sllx	%o4,	%g3,	%g2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	fmovdne	%icc,	%f7,	%f28
	orn	%l6,	%o6,	%i7
	set	0x2C, %l1
	lduwa	[%l7 + %l1] 0x19,	%o7
	ld	[%l7 + 0x3C],	%f5
	ldstub	[%l7 + 0x1F],	%g6
	wr	%g0,	0x19,	%asi
	sta	%f30,	[%l7 + 0x50] %asi
	andncc	%i3,	%g4,	%l5
	movcc	%icc,	%g5,	%o1
	ldx	[%l7 + 0x18],	%i4
	xnor	%i1,	0x071D,	%i5
	nop
	setx	0xA4ACAC20,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xAEA61572,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f14,	%f3
	taddcc	%i6,	0x16FF,	%g7
	nop
	setx	0xE40FFD03,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x9F10A74A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f14,	%f19
	movrgz	%o0,	%l4,	%i0
	wr	%g0,	0x10,	%asi
	stxa	%g1,	[%l7 + 0x58] %asi
	fcmpne16	%f4,	%f30,	%i2
	tvs	%xcc,	0x2
	orn	%l3,	0x1356,	%l2
	mova	%icc,	%l0,	%o2
	fnegd	%f0,	%f10
	ldd	[%l7 + 0x30],	%l0
	umul	%o5,	0x0790,	%g3
	nop
	setx	loop_293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%g2,	%o4,	%l6
	fmovdg	%xcc,	%f28,	%f2
	smul	%o3,	0x0D96,	%o6
loop_293:
	sllx	%o7,	%i7,	%g6
	sethi	0x140E,	%g4
	srl	%i3,	0x0A,	%l5
	or	%o1,	%i4,	%i1
	xor	%i5,	%g5,	%g7
	nop
	setx	0x355511F6C35D8319,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f2
	umulcc	%i6,	0x1C57,	%l4
	fmovrsne	%i0,	%f6,	%f23
	fxors	%f24,	%f27,	%f3
	edge32l	%g1,	%i2,	%l3
	alignaddrl	%o0,	%l0,	%l2
	andncc	%o2,	%o5,	%g3
	nop
	setx	0x27A1CA72,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f17
	fbn,a	%fcc1,	loop_294
	fzeros	%f6
	movne	%xcc,	%g2,	%o4
	tcc	%xcc,	0x7
loop_294:
	alignaddr	%l6,	%o3,	%o6
	fmovdleu	%xcc,	%f23,	%f29
	be,a,pn	%icc,	loop_295
	movre	%l1,	%o7,	%i7
	array32	%g4,	%i3,	%l5
	umul	%g6,	%o1,	%i4
loop_295:
	fxor	%f20,	%f2,	%f18
	tg	%xcc,	0x5
	udivx	%i5,	0x1BEC,	%g5
	popc	%g7,	%i6
	fcmple32	%f16,	%f8,	%i1
	fpadd16s	%f31,	%f8,	%f2
	movgu	%icc,	%i0,	%g1
	fornot2s	%f15,	%f16,	%f21
	mulx	%i2,	%l3,	%o0
	edge32ln	%l0,	%l2,	%o2
	movne	%icc,	%l4,	%o5
	fpadd16s	%f12,	%f12,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x40],	%g2
	edge32	%g3,	%o4,	%l6
	tcs	%xcc,	0x2
	bshuffle	%f6,	%f2,	%f12
	movg	%icc,	%o6,	%o3
	bl,pt	%xcc,	loop_296
	udivcc	%o7,	0x0070,	%i7
	tpos	%icc,	0x3
	sll	%g4,	%i3,	%l1
loop_296:
	movcc	%icc,	%l5,	%g6
	movrlz	%o1,	%i4,	%g5
	array32	%g7,	%i6,	%i1
	tl	%icc,	0x6
	popc	%i0,	%g1
	ldsw	[%l7 + 0x58],	%i5
	tpos	%icc,	0x4
	taddcc	%i2,	0x11F6,	%o0
	movcs	%xcc,	%l0,	%l3
	sdivcc	%l2,	0x1FE4,	%l4
	and	%o2,	%o5,	%g2
	sdiv	%o4,	0x010B,	%l6
	srlx	%g3,	%o3,	%o7
	fmovrdlez	%o6,	%f12,	%f14
	nop
	setx loop_297, %l0, %l1
	jmpl %l1, %i7
	umulcc	%i3,	0x17D8,	%g4
	flush	%l7 + 0x74
	sdivx	%l1,	0x02DB,	%l5
loop_297:
	fpadd32s	%f18,	%f8,	%f20
	mulscc	%o1,	0x0285,	%g6
	edge32n	%g5,	%i4,	%i6
	array16	%i1,	%i0,	%g7
	udivx	%i5,	0x0D75,	%i2
	edge32n	%o0,	%g1,	%l3
	xorcc	%l0,	0x1343,	%l4
	alignaddr	%l2,	%o5,	%g2
	lduh	[%l7 + 0x74],	%o4
	andncc	%o2,	%l6,	%g3
	tg	%icc,	0x5
	ld	[%l7 + 0x48],	%f4
	addcc	%o7,	%o6,	%i7
	movle	%xcc,	%i3,	%g4
	tneg	%icc,	0x3
	movre	%l1,	0x1D0,	%l5
	alignaddr	%o1,	%g6,	%o3
	edge16	%g5,	%i6,	%i1
	orn	%i0,	0x1E29,	%g7
	orn	%i5,	%i4,	%i2
	nop
	fitos	%f14,	%f13
	fstod	%f13,	%f28
	tle	%xcc,	0x0
	st	%f7,	[%l7 + 0x4C]
	brlez,a	%g1,	loop_298
	tsubcctv	%l3,	%l0,	%l4
	move	%xcc,	%l2,	%o0
	popc	0x08E7,	%g2
loop_298:
	tg	%xcc,	0x0
	fmul8ulx16	%f2,	%f6,	%f22
	ldd	[%l7 + 0x60],	%f28
	andncc	%o5,	%o4,	%l6
	addc	%g3,	%o7,	%o6
	call	loop_299
	fnot1	%f12,	%f18
	movrne	%o2,	0x02A,	%i7
	fmovrsne	%g4,	%f2,	%f12
loop_299:
	srl	%l1,	%i3,	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%l5
	taddcc	%o3,	%g5,	%i6
	movleu	%icc,	%i1,	%i0
	movrlz	%g7,	0x09C,	%i4
	fnot1	%f16,	%f24
	lduw	[%l7 + 0x78],	%i5
	stbar
	edge8l	%i2,	%l3,	%g1
	udivx	%l4,	0x199B,	%l2
	set	0x110, %i0
	ldxa	[%g0 + %i0] 0x21,	%o0
	xorcc	%g2,	0x1662,	%l0
	alignaddr	%o5,	%o4,	%l6
	movvs	%xcc,	%o7,	%g3
	fpadd32s	%f14,	%f7,	%f20
	bl	%xcc,	loop_300
	fmovsge	%xcc,	%f8,	%f30
	fornot1s	%f12,	%f26,	%f1
	brlz	%o6,	loop_301
loop_300:
	fble	%fcc3,	loop_302
	fpackfix	%f10,	%f1
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%o2
loop_301:
	tneg	%icc,	0x4
loop_302:
	fble,a	%fcc1,	loop_303
	fmovda	%icc,	%f15,	%f14
	tg	%xcc,	0x1
	taddcctv	%i7,	%g4,	%l1
loop_303:
	edge32ln	%o1,	%g6,	%i3
	edge8ln	%l5,	%g5,	%i6
	fmovsn	%xcc,	%f14,	%f6
	sdivcc	%o3,	0x07D7,	%i0
	addcc	%g7,	%i1,	%i4
	edge32	%i5,	%l3,	%g1
	ble,a	loop_304
	movneg	%xcc,	%l4,	%i2
	tvs	%icc,	0x0
	ldsb	[%l7 + 0x58],	%o0
loop_304:
	xnor	%g2,	%l2,	%o5
	nop
	setx	0xE05154D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	tcc	%icc,	0x3
	tpos	%icc,	0x0
	sll	%o4,	%l6,	%o7
	fandnot1s	%f5,	%f0,	%f12
	taddcctv	%g3,	%l0,	%o2
	fblg,a	%fcc3,	loop_305
	edge8n	%i7,	%o6,	%l1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x18] %asi,	%o1
loop_305:
	edge8ln	%g6,	%g4,	%i3
	ta	%icc,	0x5
	edge8	%g5,	%l5,	%i6
	fornot2s	%f21,	%f23,	%f1
	array16	%i0,	%o3,	%g7
	ldub	[%l7 + 0x79],	%i4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x50] %asi,	%i5
	ldsw	[%l7 + 0x68],	%l3
	subcc	%g1,	%i1,	%l4
	fmovrslez	%o0,	%f0,	%f10
	array8	%g2,	%l2,	%i2
	fba,a	%fcc2,	loop_306
	fxnors	%f4,	%f23,	%f9
	movl	%xcc,	%o5,	%o4
	sub	%o7,	%l6,	%l0
loop_306:
	ldx	[%l7 + 0x68],	%o2
	movre	%i7,	%o6,	%g3
	bvs	%icc,	loop_307
	fandnot1	%f6,	%f26,	%f4
	fbo	%fcc1,	loop_308
	nop
	setx	0x15F1B94F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x6BA6BC00,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f10,	%f2
loop_307:
	subcc	%l1,	%o1,	%g4
	nop
	setx	loop_309,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_308:
	tge	%xcc,	0x7
	mulx	%i3,	%g5,	%g6
	fpack32	%f24,	%f20,	%f26
loop_309:
	alignaddr	%l5,	%i0,	%o3
	taddcctv	%i6,	%g7,	%i4
	fcmpgt32	%f12,	%f10,	%i5
	xnor	%g1,	0x0BF4,	%i1
	fmovrdne	%l4,	%f12,	%f8
	movre	%o0,	%l3,	%l2
	sth	%g2,	[%l7 + 0x44]
	fbuge	%fcc0,	loop_310
	edge32l	%i2,	%o4,	%o5
	fmovrslz	%o7,	%f27,	%f5
	edge32n	%l0,	%o2,	%l6
loop_310:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x4
	sir	0x16B8
	fexpand	%f9,	%f22
	srl	%i7,	%o6,	%l1
	set	0x6C, %i5
	sta	%f13,	[%l7 + %i5] 0x11
	movge	%icc,	%o1,	%g3
	fbug	%fcc3,	loop_311
	tpos	%xcc,	0x6
	fpack16	%f20,	%f25
	array8	%g4,	%g5,	%g6
loop_311:
	fbge	%fcc2,	loop_312
	tvc	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_313
loop_312:
	sdivx	%i3,	0x1D82,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f29,	%f18,	%f5
loop_313:
	movne	%xcc,	%l5,	%o3
	udiv	%i6,	0x09A1,	%g7
	fxors	%f25,	%f28,	%f17
	nop
	setx	0x5F2A9ECB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x5F23E4F6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f19,	%f8
	smulcc	%i5,	%g1,	%i1
	edge16	%i4,	%o0,	%l4
	fnand	%f24,	%f28,	%f8
	ta	%icc,	0x4
	ta	%xcc,	0x3
	bcs	%xcc,	loop_314
	edge16l	%l3,	%g2,	%i2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o4,	%o5
loop_314:
	nop
	set	0x48, %l4
	sta	%f11,	[%l7 + %l4] 0x14
	tcs	%xcc,	0x6
	brlez	%o7,	loop_315
	srl	%l0,	0x1D,	%l2
	fandnot1	%f30,	%f2,	%f24
	alignaddrl	%l6,	%o2,	%i7
loop_315:
	movrne	%o6,	0x18C,	%l1
	movcc	%icc,	%g3,	%o1
	addc	%g5,	0x0E4E,	%g6
	udivcc	%i3,	0x175F,	%g4
	nop
	setx loop_316, %l0, %l1
	jmpl %l1, %i0
	edge8n	%l5,	%i6,	%g7
	movg	%xcc,	%o3,	%g1
	alignaddr	%i5,	%i4,	%i1
loop_316:
	xor	%o0,	0x1828,	%l3
	sdiv	%g2,	0x06E1,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o4,	%o5,	%o7
	bleu,a	%xcc,	loop_317
	andncc	%l0,	%l4,	%l6
	fnegd	%f12,	%f24
	andn	%l2,	0x0EBA,	%i7
loop_317:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%o2
	movneg	%xcc,	%o6,	%g3
	tl	%xcc,	0x6
	fmovdle	%icc,	%f29,	%f27
	edge32ln	%o1,	%l1,	%g6
	bgu	%icc,	loop_318
	taddcc	%g5,	0x1F9E,	%i3
	fbug,a	%fcc1,	loop_319
	andcc	%i0,	%l5,	%i6
loop_318:
	nop
	fitod	%f25,	%f6
	nop
	setx	0x4B444B87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f19
loop_319:
	edge8l	%g7,	%g4,	%g1
	set	0x24, %o7
	ldswa	[%l7 + %o7] 0x10,	%i5
	fmovsleu	%xcc,	%f14,	%f3
	srlx	%o3,	%i1,	%o0
	movcc	%xcc,	%l3,	%g2
	stbar
	bcs,a,pn	%icc,	loop_320
	smulcc	%i2,	0x19F6,	%o4
	popc	0x00CA,	%i4
	edge8n	%o5,	%l0,	%o7
loop_320:
	tleu	%icc,	0x2
	set	0x48, %g5
	stxa	%l4,	[%l7 + %g5] 0x2a
	membar	#Sync
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4C] %asi,	%l2
	fbue,a	%fcc0,	loop_321
	array32	%i7,	%l6,	%o2
	bneg,a	%icc,	loop_322
	fcmpgt16	%f16,	%f6,	%g3
loop_321:
	tsubcc	%o6,	0x00FB,	%l1
	sdivx	%o1,	0x19C9,	%g5
loop_322:
	movg	%xcc,	%i3,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xF0F7E1584BE4EA70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x10551C55F1CC468B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f30,	%f12
	be	loop_323
	bleu,pn	%xcc,	loop_324
	sllx	%i0,	0x08,	%i6
	movpos	%icc,	%l5,	%g4
loop_323:
	movleu	%icc,	%g1,	%g7
loop_324:
	alignaddr	%i5,	%o3,	%o0
	bvs	%icc,	loop_325
	nop
	setx	0x608F90B1987C68E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x67F0DB154F8C5DCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f14,	%f18
	fbul	%fcc3,	loop_326
	xorcc	%i1,	0x1CC3,	%l3
loop_325:
	edge8ln	%i2,	%o4,	%g2
	fornot1s	%f27,	%f11,	%f2
loop_326:
	bpos	%xcc,	loop_327
	edge16l	%o5,	%i4,	%l0
	bvc,pn	%icc,	loop_328
	bge,a	loop_329
loop_327:
	brlez	%o7,	loop_330
	array8	%l4,	%i7,	%l6
loop_328:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_329:
	tgu	%xcc,	0x0
loop_330:
	brlz,a	%l2,	loop_331
	fpackfix	%f20,	%f14
	fmul8x16al	%f17,	%f23,	%f4
	ldsh	[%l7 + 0x74],	%g3
loop_331:
	mova	%icc,	%o6,	%l1
	andcc	%o1,	0x1D2A,	%o2
	fcmple32	%f14,	%f14,	%i3
	edge8l	%g5,	%g6,	%i0
	bleu,a	%xcc,	loop_332
	tsubcctv	%i6,	%g4,	%l5
	lduh	[%l7 + 0x44],	%g7
	brnz	%g1,	loop_333
loop_332:
	brnz	%i5,	loop_334
	fmovdg	%xcc,	%f5,	%f24
	fpsub16	%f0,	%f30,	%f30
loop_333:
	andn	%o0,	0x1A39,	%i1
loop_334:
	andn	%l3,	%o3,	%i2
	popc	0x1A79,	%o4
	tne	%xcc,	0x5
	stbar
	mulx	%g2,	0x0C10,	%o5
	alignaddrl	%l0,	%o7,	%i4
	movvc	%xcc,	%l4,	%l6
	ta	%icc,	0x0
	movrne	%l2,	%g3,	%i7
	movvc	%icc,	%l1,	%o1
	or	%o6,	%i3,	%g5
	nop
	fitos	%f11,	%f4
	fstod	%f4,	%f26
	fabss	%f21,	%f16
	fpsub16	%f28,	%f16,	%f12
	mulx	%g6,	%o2,	%i0
	movne	%icc,	%g4,	%i6
	tsubcctv	%l5,	0x1627,	%g1
	fnand	%f28,	%f16,	%f12
	movre	%g7,	%o0,	%i1
	tneg	%icc,	0x6
	fmovdneg	%xcc,	%f26,	%f3
	fmovscs	%icc,	%f23,	%f26
	stw	%l3,	[%l7 + 0x60]
	stx	%o3,	[%l7 + 0x08]
	fmovrsgez	%i2,	%f12,	%f18
	set	0x78, %g7
	ldswa	[%l7 + %g7] 0x04,	%o4
	movrlez	%i5,	0x2FE,	%o5
	sdivx	%g2,	0x100D,	%l0
	fandnot2s	%f11,	%f20,	%f3
	array32	%o7,	%i4,	%l4
	mulscc	%l2,	0x1252,	%l6
	tvs	%xcc,	0x4
	movrlz	%i7,	%g3,	%l1
	udiv	%o1,	0x16BC,	%i3
	popc	%g5,	%g6
	tcc	%icc,	0x4
	movne	%xcc,	%o2,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x0c,	%i0,	%g4
	nop
	setx	0xF0563163,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movrlez	%l5,	%i6,	%g7
	set	0x5C, %i7
	lda	[%l7 + %i7] 0x10,	%f0
	fbue,a	%fcc0,	loop_335
	sdivx	%o0,	0x079B,	%i1
	bg,a,pn	%xcc,	loop_336
	sth	%g1,	[%l7 + 0x38]
loop_335:
	movcs	%xcc,	%o3,	%l3
	ldstub	[%l7 + 0x59],	%o4
loop_336:
	nop
	set	0x10, %o6
	lduwa	[%l7 + %o6] 0x88,	%i2
	movrlez	%o5,	0x1C0,	%i5
	nop
	setx	loop_337,	%l0,	%l1
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
	sub	%l0,	%o7,	%g2
	edge32n	%i4,	%l4,	%l2
loop_337:
	sethi	0x02FC,	%i7
	mulscc	%l6,	%g3,	%l1
	flush	%l7 + 0x64
	mova	%icc,	%o1,	%g5
	edge8n	%i3,	%o2,	%g6
	tn	%icc,	0x3
	ldd	[%l7 + 0x10],	%i0
	fmovsge	%xcc,	%f31,	%f28
	fsrc1	%f20,	%f24
	movgu	%xcc,	%g4,	%o6
	nop
	setx	0x68133EB2B7B66DBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC6EE77BCA3CAF635,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f2,	%f0
	andn	%l5,	%i6,	%o0
	movg	%icc,	%g7,	%i1
	fble,a	%fcc1,	loop_338
	movrgz	%o3,	0x23E,	%g1
	bgu,a,pn	%xcc,	loop_339
	movvc	%icc,	%o4,	%l3
loop_338:
	fbue	%fcc1,	loop_340
	be	%xcc,	loop_341
loop_339:
	sdivx	%o5,	0x0B21,	%i5
	set	0x48, %i1
	lduwa	[%l7 + %i1] 0x04,	%l0
loop_340:
	ld	[%l7 + 0x54],	%f14
loop_341:
	bneg,pn	%icc,	loop_342
	brnz,a	%i2,	loop_343
	prefetch	[%l7 + 0x3C],	 0x3
	movgu	%xcc,	%g2,	%i4
loop_342:
	move	%icc,	%o7,	%l4
loop_343:
	add	%i7,	%l6,	%l2
	fcmpgt16	%f26,	%f26,	%l1
	ta	%xcc,	0x1
	addccc	%o1,	0x19D7,	%g5
	smulcc	%g3,	%o2,	%i3
	set	0x5E, %o3
	lduba	[%l7 + %o3] 0x18,	%i0
	alignaddr	%g6,	%g4,	%l5
	fbg	%fcc2,	loop_344
	bgu,a	%xcc,	loop_345
	srlx	%o6,	%i6,	%g7
	fmovdpos	%xcc,	%f15,	%f24
loop_344:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_345:
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f8
	tpos	%icc,	0x6
	ldsh	[%l7 + 0x4A],	%i1
	fnot1	%f6,	%f0
	fblg,a	%fcc2,	loop_346
	sll	%o0,	0x10,	%g1
	srax	%o4,	0x10,	%o3
	mulx	%o5,	0x168E,	%l3
loop_346:
	brgz	%l0,	loop_347
	fmovrsgez	%i2,	%f25,	%f13
	bleu	loop_348
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_347:
	fmovdpos	%xcc,	%f7,	%f11
	tl	%icc,	0x7
loop_348:
	nop
	wr	%g0,	0xea,	%asi
	stha	%g2,	[%l7 + 0x78] %asi
	membar	#Sync
	movne	%xcc,	%i4,	%o7
	movgu	%xcc,	%i5,	%i7
	mova	%xcc,	%l6,	%l4
	movvc	%xcc,	%l2,	%o1
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	fxnors	%f7,	%f27,	%f19
	tgu	%icc,	0x1
	orn	%g3,	%l1,	%o2
	fmovda	%xcc,	%f13,	%f14
	fpadd32s	%f26,	%f0,	%f31
	tg	%icc,	0x2
	fbne	%fcc2,	loop_349
	sllx	%i3,	0x1A,	%g6
	fandnot2	%f6,	%f8,	%f0
	edge16n	%i0,	%g4,	%o6
loop_349:
	tpos	%xcc,	0x3
	subccc	%i6,	0x12A3,	%l5
	fbo,a	%fcc0,	loop_350
	flush	%l7 + 0x30
	alignaddrl	%i1,	%o0,	%g1
	sllx	%g7,	0x02,	%o3
loop_350:
	fmovsge	%icc,	%f15,	%f9
	edge32n	%o5,	%l3,	%l0
	srax	%o4,	%i2,	%g2
	fmovrsne	%i4,	%f22,	%f27
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f0
	fbl	%fcc0,	loop_351
	fmovs	%f12,	%f31
	fcmpgt16	%f14,	%f6,	%i5
	fxors	%f2,	%f14,	%f5
loop_351:
	lduw	[%l7 + 0x40],	%o7
	or	%l6,	0x0542,	%i7
	ldd	[%l7 + 0x30],	%f20
	movpos	%icc,	%l4,	%l2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	fbge	%fcc2,	loop_352
	sethi	0x123D,	%g5
	fmovsvc	%xcc,	%f19,	%f26
	tpos	%icc,	0x6
loop_352:
	pdist	%f20,	%f22,	%f14
	or	%l1,	0x1D89,	%g3
	fmovdgu	%xcc,	%f13,	%f2
	alignaddr	%o2,	%i3,	%g6
	bvs,a,pt	%xcc,	loop_353
	alignaddrl	%g4,	%o6,	%i6
	move	%xcc,	%l5,	%i0
	sll	%o0,	%i1,	%g1
loop_353:
	movleu	%xcc,	%o3,	%g7
	umul	%l3,	%o5,	%l0
	array16	%o4,	%g2,	%i4
	edge16n	%i2,	%o7,	%i5
	set	0x42, %g6
	stba	%i7,	[%l7 + %g6] 0x81
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x14] %asi,	%l6
	nop
	setx	0xDC24F9C48A02B192,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xEDE3E15B58F084BB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f28,	%f2
	ble	loop_354
	movrgz	%l4,	0x390,	%o1
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f2
	movge	%icc,	%g5,	%l2
loop_354:
	edge16n	%l1,	%o2,	%i3
	fandnot1	%f6,	%f26,	%f14
	movvs	%icc,	%g3,	%g6
	set	0x68, %o4
	ldswa	[%l7 + %o4] 0x89,	%g4
	edge8n	%o6,	%i6,	%l5
	movne	%icc,	%i0,	%i1
	bvc,pn	%icc,	loop_355
	movrlz	%g1,	%o0,	%g7
	movleu	%xcc,	%l3,	%o3
	or	%l0,	0x0944,	%o4
loop_355:
	movrlez	%o5,	%i4,	%g2
	tleu	%xcc,	0x2
	fblg	%fcc1,	loop_356
	brnz,a	%o7,	loop_357
	mulx	%i5,	0x1779,	%i2
	tgu	%icc,	0x7
loop_356:
	nop
	setx	loop_358,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_357:
	movg	%xcc,	%i7,	%l4
	andn	%l6,	0x09A6,	%g5
	fblg,a	%fcc3,	loop_359
loop_358:
	fbe,a	%fcc2,	loop_360
	flush	%l7 + 0x38
	tl	%xcc,	0x6
loop_359:
	sth	%o1,	[%l7 + 0x48]
loop_360:
	orcc	%l1,	%l2,	%i3
	fmovsneg	%xcc,	%f1,	%f16
	bvc,pt	%xcc,	loop_361
	bshuffle	%f16,	%f24,	%f24
	fpmerge	%f11,	%f19,	%f16
	movne	%icc,	%o2,	%g6
loop_361:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x31] %asi,	%g3
	fbge	%fcc2,	loop_362
	brlez	%o6,	loop_363
	xorcc	%i6,	0x112B,	%g4
	xnorcc	%l5,	0x08E8,	%i1
loop_362:
	fpsub16	%f20,	%f18,	%f28
loop_363:
	orn	%i0,	0x0B88,	%g1
	edge16	%g7,	%l3,	%o0
	movn	%xcc,	%o3,	%l0
	subcc	%o4,	%i4,	%g2
	mulscc	%o5,	%i5,	%i2
	fbe	%fcc3,	loop_364
	sub	%i7,	%l4,	%l6
	stbar
	nop
	setx	loop_365,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_364:
	tleu	%icc,	0x7
	andncc	%o7,	%o1,	%g5
	subccc	%l1,	%i3,	%o2
loop_365:
	ble	loop_366
	movpos	%icc,	%g6,	%l2
	movre	%g3,	0x2AC,	%o6
	fmovrdlez	%g4,	%f12,	%f2
loop_366:
	fbue,a	%fcc2,	loop_367
	movge	%icc,	%i6,	%i1
	fmul8sux16	%f6,	%f12,	%f12
	fmovsne	%xcc,	%f14,	%f4
loop_367:
	fmovdge	%icc,	%f7,	%f8
	brlez,a	%l5,	loop_368
	and	%i0,	0x0F9A,	%g7
	set	0x70, %i4
	lda	[%l7 + %i4] 0x19,	%f16
loop_368:
	movvs	%xcc,	%l3,	%g1
	sll	%o3,	0x1B,	%l0
	te	%icc,	0x7
	movne	%icc,	%o4,	%i4
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	srlx	%o5,	0x00,	%g2
	srl	%i5,	0x1C,	%i2
	xor	%i7,	%l6,	%o7
	or	%o1,	0x1B23,	%g5
	tl	%icc,	0x5
	lduw	[%l7 + 0x14],	%l1
	movcs	%icc,	%l4,	%i3
	andncc	%o2,	%l2,	%g6
	fble,a	%fcc2,	loop_369
	addccc	%o6,	%g4,	%g3
	movn	%icc,	%i6,	%l5
	xnor	%i1,	0x0B90,	%g7
loop_369:
	sdivx	%i0,	0x0B2B,	%l3
	bvc,pt	%icc,	loop_370
	tleu	%xcc,	0x6
	move	%icc,	%o3,	%g1
	lduw	[%l7 + 0x0C],	%l0
loop_370:
	fxnor	%f26,	%f18,	%f10
	bne,a	loop_371
	tsubcc	%o4,	%i4,	%o0
	taddcc	%o5,	%g2,	%i2
	lduh	[%l7 + 0x4E],	%i5
loop_371:
	edge8	%i7,	%l6,	%o7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x62] %asi,	%g5
	movrgz	%o1,	0x147,	%l1
	nop
	fitos	%f20,	%f0
	edge32l	%l4,	%o2,	%l2
	subc	%g6,	0x0320,	%i3
	fbue,a	%fcc0,	loop_372
	orcc	%o6,	%g3,	%g4
	smulcc	%i6,	%i1,	%g7
	fpadd32s	%f21,	%f23,	%f6
loop_372:
	movre	%l5,	0x049,	%l3
	umulcc	%o3,	0x0DE6,	%g1
	addc	%i0,	0x01FF,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x56],	%o4
	mova	%icc,	%o0,	%i4
	set	0x58, %l0
	lduwa	[%l7 + %l0] 0x19,	%g2
	udiv	%o5,	0x04BF,	%i2
	fmovsvs	%icc,	%f27,	%f6
	set	0x5C, %l5
	swapa	[%l7 + %l5] 0x0c,	%i7
	fmuld8sux16	%f13,	%f31,	%f4
	te	%xcc,	0x4
	edge16	%i5,	%l6,	%g5
	smul	%o1,	0x0CA1,	%l1
	fcmple32	%f2,	%f26,	%l4
	movn	%icc,	%o2,	%l2
	sub	%g6,	%o7,	%i3
	sllx	%o6,	0x08,	%g4
	and	%i6,	%i1,	%g3
	mulx	%l5,	0x1C67,	%l3
	movrlz	%o3,	%g7,	%i0
	fbe,a	%fcc2,	loop_373
	fxnors	%f24,	%f28,	%f21
	movle	%xcc,	%g1,	%l0
	nop
	fitos	%f11,	%f15
	fstoi	%f15,	%f7
loop_373:
	nop
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x04
	stw	%o0,	[%l7 + 0x50]
	fcmpeq32	%f14,	%f30,	%o4
	swap	[%l7 + 0x34],	%i4
	stb	%g2,	[%l7 + 0x1D]
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i2
	nop
	setx	0xEC4AF86D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x1A9C63E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f6,	%f30
	tcc	%xcc,	0x7
	movg	%xcc,	%i7,	%o5
	sethi	0x1445,	%l6
	udivcc	%i5,	0x135E,	%o1
	movleu	%icc,	%g5,	%l1
	fxor	%f18,	%f16,	%f14
	fnand	%f8,	%f22,	%f10
	movcc	%icc,	%l4,	%l2
	brgez,a	%o2,	loop_374
	swap	[%l7 + 0x08],	%o7
	movleu	%xcc,	%g6,	%i3
	movl	%xcc,	%o6,	%i6
loop_374:
	movle	%icc,	%i1,	%g3
	fmovdvc	%icc,	%f29,	%f24
	umul	%g4,	%l3,	%l5
	nop
	setx	loop_375,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc2	%f30,	%f30
	nop
	setx	0x084C315A5D2139F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xBD92B0948037049A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f4,	%f6
	nop
	setx	0xAE3C0B3E1B78D251,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x2AD4565D17BAAED0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f8,	%f14
loop_375:
	sllx	%g7,	0x15,	%o3
	sdivcc	%i0,	0x1DD3,	%g1
	fxnors	%f8,	%f13,	%f10
	taddcctv	%l0,	%o0,	%o4
	fmovdleu	%xcc,	%f14,	%f20
	fnor	%f12,	%f8,	%f0
	fpsub16	%f26,	%f0,	%f14
	edge16	%g2,	%i2,	%i4
	movne	%xcc,	%i7,	%l6
	movvc	%icc,	%i5,	%o1
	sdivx	%o5,	0x1C0C,	%g5
	tvc	%icc,	0x2
	sub	%l4,	0x1C91,	%l2
	fmul8sux16	%f0,	%f12,	%f0
	nop
	setx	0x804C7BBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fbg	%fcc3,	loop_376
	fmovdvc	%icc,	%f2,	%f7
	xorcc	%l1,	0x0C67,	%o2
	movcc	%xcc,	%o7,	%i3
loop_376:
	fpmerge	%f17,	%f16,	%f22
	fmovrdlez	%g6,	%f16,	%f26
	sdivcc	%o6,	0x13CF,	%i1
	bneg,a,pt	%xcc,	loop_377
	srax	%i6,	0x11,	%g4
	nop
	setx	0x51A0BFDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x3176D293,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f31,	%f5
	addccc	%g3,	%l5,	%g7
loop_377:
	fabsd	%f12,	%f26
	movne	%xcc,	%l3,	%i0
	edge16ln	%g1,	%l0,	%o3
	mova	%xcc,	%o0,	%o4
	bpos,a,pn	%xcc,	loop_378
	orcc	%g2,	0x1D71,	%i4
	array16	%i7,	%l6,	%i5
	movl	%xcc,	%i2,	%o1
loop_378:
	membar	0x2C
	edge8l	%g5,	%o5,	%l2
	movpos	%icc,	%l4,	%l1
	edge8	%o2,	%o7,	%i3
	fbue	%fcc0,	loop_379
	tl	%xcc,	0x6
	edge8n	%o6,	%i1,	%g6
	brz,a	%i6,	loop_380
loop_379:
	movn	%icc,	%g3,	%g4
	faligndata	%f16,	%f26,	%f22
	fmovspos	%xcc,	%f5,	%f16
loop_380:
	fmovdvs	%xcc,	%f17,	%f15
	udivx	%g7,	0x1BC1,	%l3
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f9
	faligndata	%f26,	%f24,	%f2
	movleu	%xcc,	%i0,	%g1
	movrgez	%l5,	0x3A1,	%l0
	sdivx	%o3,	0x1817,	%o0
	movre	%o4,	%i4,	%g2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x12] %asi,	%l6
	lduh	[%l7 + 0x44],	%i5
	bgu	%xcc,	loop_381
	tn	%xcc,	0x7
	edge32n	%i7,	%o1,	%i2
	mova	%xcc,	%g5,	%o5
loop_381:
	fmovse	%xcc,	%f29,	%f26
	subccc	%l4,	0x0545,	%l2
	andcc	%o2,	0x0A9D,	%o7
	tne	%xcc,	0x3
	fpmerge	%f17,	%f5,	%f26
	fmul8x16au	%f12,	%f24,	%f4
	stb	%l1,	[%l7 + 0x73]
	stb	%o6,	[%l7 + 0x45]
	tvs	%icc,	0x5
	fexpand	%f24,	%f22
	sdiv	%i3,	0x12FC,	%i1
	fpsub16s	%f8,	%f25,	%f21
	ldd	[%l7 + 0x68],	%i6
	sra	%g6,	0x15,	%g3
	fbue,a	%fcc0,	loop_382
	edge32ln	%g7,	%g4,	%i0
	fpsub32s	%f1,	%f21,	%f18
	fnors	%f2,	%f31,	%f17
loop_382:
	fbge	%fcc1,	loop_383
	orcc	%l3,	0x13E8,	%l5
	movcs	%xcc,	%g1,	%o3
	fmovsg	%icc,	%f31,	%f18
loop_383:
	movrlez	%o0,	%o4,	%i4
	fble	%fcc0,	loop_384
	taddcc	%l0,	0x0162,	%g2
	ldub	[%l7 + 0x26],	%i5
	fmovrdlez	%l6,	%f22,	%f26
loop_384:
	ldsw	[%l7 + 0x30],	%i7
	tvs	%xcc,	0x4
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0x1
	swap	[%l7 + 0x4C],	%g5
	tn	%xcc,	0x7
	movneg	%xcc,	%i2,	%l4
	xnor	%o5,	0x0A7C,	%l2
	be,pn	%xcc,	loop_385
	fmovscc	%icc,	%f13,	%f28
	bvs,a,pt	%icc,	loop_386
	brz	%o2,	loop_387
loop_385:
	edge32	%l1,	%o7,	%o6
	nop
	fitos	%f7,	%f22
	fstoi	%f22,	%f11
loop_386:
	fmovsneg	%icc,	%f13,	%f29
loop_387:
	fmovdg	%xcc,	%f18,	%f30
	subcc	%i3,	%i6,	%i1
	addccc	%g3,	0x0CD1,	%g6
	movle	%xcc,	%g7,	%g4
	alignaddr	%i0,	%l3,	%l5
	or	%g1,	0x1909,	%o3
	andncc	%o0,	%i4,	%o4
	movvs	%icc,	%l0,	%g2
	andncc	%i5,	%l6,	%i7
	movneg	%icc,	%g5,	%i2
	fmovdge	%icc,	%f9,	%f8
	umulcc	%l4,	%o1,	%l2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o5
	movleu	%icc,	%o2,	%o7
	call	loop_388
	fblg,a	%fcc0,	loop_389
	sub	%l1,	0x18D2,	%o6
	swap	[%l7 + 0x54],	%i6
loop_388:
	mulscc	%i3,	%g3,	%g6
loop_389:
	or	%g7,	0x1B9F,	%i1
	move	%xcc,	%g4,	%i0
	sir	0x1011
	brgz	%l3,	loop_390
	fmovda	%icc,	%f5,	%f20
	sllx	%l5,	0x05,	%g1
	fornot1	%f16,	%f20,	%f0
loop_390:
	move	%icc,	%o0,	%o3
	andncc	%i4,	%o4,	%g2
	fcmple16	%f20,	%f0,	%i5
	tle	%icc,	0x1
	edge16l	%l0,	%l6,	%g5
	set	0x24, %g3
	stwa	%i2,	[%l7 + %g3] 0x23
	membar	#Sync
	mulscc	%i7,	0x062A,	%o1
	fbul,a	%fcc3,	loop_391
	sdivcc	%l2,	0x16CE,	%l4
	udivcc	%o5,	0x0433,	%o2
	fble,a	%fcc2,	loop_392
loop_391:
	fxnors	%f21,	%f1,	%f26
	sth	%o7,	[%l7 + 0x46]
	fbn,a	%fcc2,	loop_393
loop_392:
	fbne	%fcc2,	loop_394
	nop
	setx	loop_395,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2s	%f9,	%f1,	%f20
loop_393:
	bshuffle	%f6,	%f30,	%f18
loop_394:
	movn	%xcc,	%o6,	%i6
loop_395:
	movcs	%xcc,	%l1,	%g3
	edge32l	%i3,	%g6,	%i1
	edge8l	%g7,	%i0,	%l3
	movrlez	%l5,	0x3B7,	%g4
	fmovrde	%o0,	%f8,	%f16
	fzero	%f26
	srlx	%o3,	%i4,	%g1
	fmovdg	%xcc,	%f31,	%f3
	fmovsge	%xcc,	%f7,	%f13
	fones	%f5
	tge	%xcc,	0x3
	array16	%o4,	%i5,	%g2
	taddcc	%l6,	0x170F,	%l0
	smul	%i2,	0x0F32,	%i7
	faligndata	%f22,	%f20,	%f0
	brgez,a	%o1,	loop_396
	tl	%xcc,	0x6
	movvs	%xcc,	%l2,	%g5
	fpsub16s	%f25,	%f18,	%f6
loop_396:
	mulscc	%o5,	%o2,	%l4
	udiv	%o6,	0x09DF,	%o7
	andcc	%l1,	0x0166,	%i6
	xor	%g3,	%i3,	%g6
	sub	%g7,	0x0CA3,	%i0
	edge16n	%l3,	%l5,	%i1
	udivx	%g4,	0x05F3,	%o3
	alignaddrl	%i4,	%g1,	%o4
	movg	%icc,	%o0,	%i5
	set	0x0B, %l3
	ldsba	[%l7 + %l3] 0x80,	%g2
	edge32n	%l0,	%i2,	%i7
	edge32n	%o1,	%l2,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%o2
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
	subc	%l4,	%l6,	%o7
	fmovdge	%icc,	%f9,	%f11
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrgez	%o6,	0x3C1,	%i6
	fbu	%fcc2,	loop_397
	edge8ln	%l1,	%i3,	%g3
	edge16n	%g6,	%g7,	%i0
	udiv	%l5,	0x1661,	%i1
loop_397:
	fandnot1	%f14,	%f12,	%f10
	set	0x11, %l6
	lduba	[%l7 + %l6] 0x18,	%g4
	orncc	%l3,	0x07FF,	%o3
	fmovdvs	%icc,	%f28,	%f26
	tn	%icc,	0x0
	fmovdl	%xcc,	%f4,	%f11
	tg	%xcc,	0x2
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f30
	fpadd16s	%f23,	%f13,	%f4
	fabsd	%f18,	%f4
	tge	%icc,	0x2
	xor	%g1,	0x1D52,	%o4
	array8	%i4,	%i5,	%o0
	bl	%xcc,	loop_398
	subc	%l0,	%i2,	%i7
	tcc	%xcc,	0x6
	edge32l	%g2,	%l2,	%o1
loop_398:
	subccc	%g5,	%o2,	%l4
	orn	%l6,	0x1A58,	%o5
	lduw	[%l7 + 0x34],	%o7
	movg	%xcc,	%o6,	%i6
	smulcc	%i3,	%g3,	%l1
	addcc	%g6,	0x12D5,	%g7
	taddcctv	%l5,	0x090A,	%i1
	alignaddr	%g4,	%l3,	%i0
	movleu	%icc,	%o3,	%o4
	fmovrse	%g1,	%f22,	%f22
	tcc	%xcc,	0x6
	edge8	%i4,	%o0,	%l0
	srax	%i5,	%i7,	%g2
	movleu	%xcc,	%l2,	%i2
	fbuge,a	%fcc0,	loop_399
	srl	%o1,	0x1A,	%o2
	addcc	%g5,	0x16DA,	%l6
	tpos	%xcc,	0x1
loop_399:
	movneg	%icc,	%l4,	%o5
	edge8ln	%o7,	%o6,	%i6
	edge16n	%i3,	%l1,	%g3
	membar	0x35
	movne	%icc,	%g7,	%g6
	movrlez	%i1,	%l5,	%l3
	fmovdgu	%icc,	%f27,	%f2
	movrlz	%i0,	0x06D,	%o3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x64] %asi,	%g4
	movn	%icc,	%g1,	%o4
	edge8ln	%i4,	%l0,	%i5
	addc	%i7,	%o0,	%l2
	movne	%xcc,	%g2,	%o1
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xe2,	%i2
	addc	%o2,	0x0866,	%g5
	tpos	%xcc,	0x4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l4
	set	0x20, %g4
	stwa	%o7,	[%l7 + %g4] 0xe3
	membar	#Sync
	fornot1	%f26,	%f24,	%f18
	movrlz	%o6,	0x179,	%o5
	edge32	%i3,	%l1,	%g3
	fnot2	%f0,	%f10
	movrne	%i6,	0x2E9,	%g6
	fmovscs	%xcc,	%f12,	%f10
	tn	%icc,	0x5
	srax	%i1,	%g7,	%l3
	udivx	%i0,	0x1653,	%l5
	tvc	%xcc,	0x6
	fcmpeq32	%f16,	%f14,	%g4
	move	%icc,	%o3,	%g1
	set	0x75, %o1
	lduba	[%l7 + %o1] 0x81,	%i4
	set	0x4F, %o2
	lduba	[%l7 + %o2] 0x89,	%l0
	srl	%i5,	%o4,	%i7
	movneg	%xcc,	%o0,	%g2
	movrlz	%o1,	%l2,	%i2
	mova	%icc,	%o2,	%g5
	be,a	loop_400
	fone	%f8
	nop
	setx	0x77DE9FDE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xEBD4C39A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f19,	%f9
	andcc	%l6,	%o7,	%l4
loop_400:
	mulscc	%o5,	0x1AFA,	%o6
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x12] %asi,	%l1
	std	%f22,	[%l7 + 0x68]
	fexpand	%f27,	%f6
	set	0x23, %o0
	stba	%g3,	[%l7 + %o0] 0x10
	fexpand	%f0,	%f30
	mulscc	%i6,	0x0043,	%i3
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f7
	fbug,a	%fcc0,	loop_401
	ldsw	[%l7 + 0x60],	%i1
	bpos	loop_402
	sdivx	%g7,	0x1924,	%l3
loop_401:
	fmovdge	%xcc,	%f18,	%f8
	movgu	%icc,	%g6,	%i0
loop_402:
	movrne	%l5,	0x06F,	%o3
	nop
	setx	0xB7D8FA867624C677,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC1F075754799268A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f0,	%f4
	movne	%icc,	%g1,	%g4
	tleu	%icc,	0x3
	fcmple32	%f10,	%f16,	%i4
	tge	%xcc,	0x2
	udivx	%l0,	0x1E97,	%i5
	tpos	%icc,	0x6
	fbul,a	%fcc2,	loop_403
	tvs	%xcc,	0x4
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f8
	fxtos	%f8,	%f16
	bne,pn	%icc,	loop_404
loop_403:
	fnegd	%f4,	%f28
	fblg	%fcc0,	loop_405
	fcmple32	%f12,	%f4,	%i7
loop_404:
	subccc	%o0,	0x059C,	%g2
	sll	%o4,	0x13,	%l2
loop_405:
	call	loop_406
	edge16l	%i2,	%o2,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a	loop_407
loop_406:
	nop
	setx loop_408, %l0, %l1
	jmpl %l1, %o1
	tvc	%xcc,	0x4
	movcs	%icc,	%l6,	%l4
loop_407:
	fmuld8ulx16	%f3,	%f29,	%f6
loop_408:
	fcmpgt16	%f12,	%f24,	%o5
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf9
	membar	#Sync
	smul	%o6,	%l1,	%g3
	movvc	%xcc,	%o7,	%i3
	set	0x54, %g1
	stwa	%i1,	[%l7 + %g1] 0x19
	nop
	setx loop_409, %l0, %l1
	jmpl %l1, %g7
	array16	%i6,	%g6,	%i0
	srlx	%l5,	%l3,	%o3
	addcc	%g4,	%i4,	%g1
loop_409:
	tvc	%icc,	0x0
	std	%f0,	[%l7 + 0x78]
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	addccc	%i5,	0x0160,	%i7
	fmovsa	%icc,	%f24,	%f8
	sll	%o0,	0x1F,	%g2
	tgu	%xcc,	0x6
	movneg	%xcc,	%l0,	%o4
	array16	%i2,	%o2,	%l2
	edge32l	%g5,	%l6,	%l4
	and	%o1,	0x17CC,	%o6
	orncc	%l1,	%g3,	%o5
	fnegd	%f24,	%f22
	fpmerge	%f25,	%f1,	%f28
	tn	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	stba	%o7,	[%l7 + 0x21] %asi
	fnegs	%f13,	%f19
	nop
	fitos	%f11,	%f15
	fstoi	%f15,	%f6
	movcs	%xcc,	%i3,	%g7
	subc	%i1,	%g6,	%i0
	alignaddr	%l5,	%l3,	%o3
	movpos	%icc,	%i6,	%i4
	movn	%xcc,	%g1,	%i5
	smul	%g4,	0x0D65,	%i7
	fcmpeq32	%f12,	%f30,	%g2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x68] %asi,	%o0
	tleu	%icc,	0x3
	xnorcc	%l0,	%o4,	%o2
	ld	[%l7 + 0x18],	%f19
	membar	0x65
	stw	%i2,	[%l7 + 0x50]
	bcc,pt	%icc,	loop_410
	taddcctv	%g5,	%l2,	%l6
	array32	%o1,	%o6,	%l1
	set	0x14, %i5
	lda	[%l7 + %i5] 0x10,	%f24
loop_410:
	bcc,a	loop_411
	bcs,a	%icc,	loop_412
	mulx	%l4,	0x1E2A,	%o5
	alignaddrl	%o7,	%g3,	%i3
loop_411:
	movcs	%icc,	%g7,	%i1
loop_412:
	movge	%icc,	%g6,	%l5
	umul	%l3,	%o3,	%i0
	fmovdneg	%icc,	%f28,	%f27
	mova	%icc,	%i4,	%g1
	ldx	[%l7 + 0x78],	%i6
	wr	%g0,	0x89,	%asi
	stba	%g4,	[%l7 + 0x1F] %asi
	sub	%i7,	%i5,	%o0
	edge8ln	%l0,	%g2,	%o2
	fbug,a	%fcc2,	loop_413
	ldsb	[%l7 + 0x0B],	%i2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x35] %asi,	%o4
loop_413:
	fcmpgt16	%f10,	%f2,	%g5
	edge16l	%l2,	%o1,	%o6
	fmovdn	%xcc,	%f25,	%f18
	edge16ln	%l1,	%l4,	%o5
	fmul8x16au	%f3,	%f13,	%f12
	edge16n	%l6,	%g3,	%o7
	nop
	fitod	%f2,	%f18
	fdtoi	%f18,	%f26
	fpsub32s	%f10,	%f12,	%f2
	movrlez	%i3,	%g7,	%g6
	tgu	%icc,	0x1
	fpack16	%f18,	%f0
	movpos	%xcc,	%l5,	%i1
	movrlez	%o3,	%l3,	%i4
	fbn	%fcc0,	loop_414
	fcmpeq32	%f8,	%f10,	%g1
	movvc	%icc,	%i6,	%g4
	tge	%xcc,	0x7
loop_414:
	fbo,a	%fcc2,	loop_415
	tl	%icc,	0x2
	tgu	%xcc,	0x3
	xor	%i0,	%i7,	%o0
loop_415:
	edge16	%i5,	%l0,	%o2
	tcc	%icc,	0x5
	nop
	setx	0xD054F454,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i2,	%o4,	%g5
	smulcc	%l2,	0x005C,	%o1
	nop
	setx loop_416, %l0, %l1
	jmpl %l1, %g2
	movg	%xcc,	%l1,	%o6
	nop
	setx	0xF040CF64,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	sra	%l4,	0x08,	%l6
loop_416:
	udiv	%o5,	0x1121,	%o7
	edge32ln	%g3,	%i3,	%g7
	nop
	set	0x7E, %l4
	lduh	[%l7 + %l4],	%l5
	fmovdne	%icc,	%f2,	%f12
	sub	%g6,	0x01C0,	%i1
	fbge,a	%fcc2,	loop_417
	sdiv	%o3,	0x0BBB,	%i4
	udiv	%g1,	0x152C,	%i6
	tcs	%icc,	0x3
loop_417:
	nop
	setx	0xD1C79CB0062BFC23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x3DC7E86CC0DDEA3F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f8,	%f8
	fmovdcs	%xcc,	%f0,	%f30
	movvc	%icc,	%g4,	%l3
	array8	%i0,	%i7,	%o0
	fmovdcs	%xcc,	%f21,	%f5
	sub	%l0,	0x0183,	%o2
	andcc	%i2,	%o4,	%g5
	fmovdvs	%xcc,	%f16,	%f28
	fmovrdgz	%i5,	%f0,	%f30
	tpos	%xcc,	0x1
	orncc	%l2,	%g2,	%o1
	nop
	setx	loop_418,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%xcc,	0x4
	ta	%icc,	0x0
	bn,pn	%xcc,	loop_419
loop_418:
	movvc	%xcc,	%o6,	%l1
	nop
	setx	0x3B469F338EA55524,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF9EFF6F64222AE2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f2,	%f0
	fandnot2s	%f3,	%f30,	%f9
loop_419:
	tvc	%icc,	0x0
	xnor	%l4,	%o5,	%o7
	fmovspos	%icc,	%f20,	%f31
	movn	%xcc,	%g3,	%l6
	tle	%xcc,	0x5
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f10
	xor	%g7,	0x0099,	%l5
	fpadd16s	%f10,	%f24,	%f14
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%g6
	edge8ln	%i1,	%i3,	%i4
	movrgez	%o3,	0x0B1,	%g1
	tle	%icc,	0x4
	movl	%xcc,	%i6,	%l3
	addccc	%g4,	0x13B8,	%i7
	movrgez	%o0,	0x243,	%i0
	ldx	[%l7 + 0x18],	%o2
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f8
	and	%l0,	0x119E,	%i2
	edge32	%o4,	%g5,	%l2
	tvs	%xcc,	0x0
	ldx	[%l7 + 0x58],	%g2
	bcs,a	loop_420
	sdivx	%o1,	0x07E5,	%i5
	tge	%icc,	0x2
	movrgez	%l1,	%o6,	%o5
loop_420:
	stb	%o7,	[%l7 + 0x08]
	tleu	%xcc,	0x7
	addcc	%g3,	%l6,	%l4
	fmovdcs	%icc,	%f27,	%f20
	bshuffle	%f26,	%f10,	%f28
	movcs	%icc,	%l5,	%g7
	movleu	%icc,	%g6,	%i1
	movrlz	%i3,	0x12D,	%i4
	fmovrdgez	%o3,	%f0,	%f20
	fbn	%fcc0,	loop_421
	fba	%fcc3,	loop_422
	sll	%g1,	0x07,	%l3
	fmovdvs	%icc,	%f24,	%f2
loop_421:
	smulcc	%i6,	0x0CE3,	%g4
loop_422:
	movcc	%icc,	%i7,	%i0
	mova	%icc,	%o0,	%o2
	fba,a	%fcc2,	loop_423
	edge16l	%l0,	%o4,	%g5
	bn,a	%icc,	loop_424
	fandnot1s	%f21,	%f30,	%f1
loop_423:
	bvc	loop_425
	fxors	%f26,	%f23,	%f0
loop_424:
	fandnot2s	%f30,	%f19,	%f25
	movre	%l2,	%g2,	%o1
loop_425:
	movn	%icc,	%i2,	%i5
	tcs	%xcc,	0x2
	xnorcc	%o6,	%o5,	%o7
	movcs	%xcc,	%g3,	%l1
	nop
	setx	0x110E07A1DB643DAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x7EF8FAD5A5F0A0E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f8,	%f8
	mulscc	%l4,	%l5,	%l6
	fmovsvc	%xcc,	%f15,	%f0
	movle	%icc,	%g6,	%g7
	fmovrsgz	%i1,	%f20,	%f6
	xor	%i3,	0x07E6,	%o3
	sll	%g1,	0x03,	%l3
	lduh	[%l7 + 0x20],	%i4
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f26
	fmul8ulx16	%f0,	%f8,	%f24
	nop
	setx	0x1CB5EB7D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xCDD9E34A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f27,	%f17
	edge32n	%g4,	%i6,	%i0
	tgu	%xcc,	0x1
	nop
	setx	0x8D1C2170C049920C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	tcs	%icc,	0x4
	udiv	%o0,	0x151E,	%o2
	tg	%icc,	0x4
	brgez,a	%l0,	loop_426
	movge	%icc,	%o4,	%g5
	fbge	%fcc1,	loop_427
	fbue,a	%fcc3,	loop_428
loop_426:
	movgu	%icc,	%l2,	%i7
	stbar
loop_427:
	bneg,a,pt	%icc,	loop_429
loop_428:
	udivx	%o1,	0x1051,	%g2
	tne	%icc,	0x3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i2,	%i5
loop_429:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x2C
	mulscc	%o6,	%o7,	%g3
	bleu,a,pt	%xcc,	loop_430
	bn,pt	%icc,	loop_431
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l1,	0x00,	%l4
loop_430:
	nop
	fitod	%f0,	%f10
loop_431:
	bcs	%icc,	loop_432
	tsubcctv	%l5,	0x0CD2,	%o5
	addc	%g6,	%g7,	%l6
	tcc	%xcc,	0x6
loop_432:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i3
	nop
	setx	0x056FE80A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xB14FA981,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f2,	%f31
	edge32n	%i1,	%g1,	%l3
	sllx	%i4,	%g4,	%o3
	stbar
	fabss	%f26,	%f25
	tcs	%xcc,	0x1
	tsubcc	%i0,	%o0,	%o2
	tvc	%xcc,	0x7
	bl,pt	%xcc,	loop_433
	move	%xcc,	%i6,	%l0
	movrlz	%o4,	%l2,	%g5
	mova	%icc,	%o1,	%g2
loop_433:
	fmovsne	%icc,	%f29,	%f25
	umulcc	%i7,	%i2,	%o6
	popc	%i5,	%g3
	taddcctv	%o7,	%l1,	%l5
	andncc	%o5,	%g6,	%l4
	array32	%g7,	%l6,	%i1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x10] %asi,	%g1
	faligndata	%f18,	%f28,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l3,	0x16DB,	%i3
	movvc	%xcc,	%i4,	%g4
	subc	%o3,	0x0EF1,	%i0
	ta	%xcc,	0x1
	tvc	%icc,	0x2
	ldsw	[%l7 + 0x68],	%o0
	fornot2s	%f30,	%f10,	%f7
	fbn	%fcc3,	loop_434
	fmuld8sux16	%f11,	%f4,	%f14
	bcs,pt	%xcc,	loop_435
	alignaddr	%i6,	%o2,	%o4
loop_434:
	movleu	%xcc,	%l0,	%l2
	edge8	%g5,	%g2,	%i7
loop_435:
	andncc	%i2,	%o6,	%i5
	movl	%icc,	%g3,	%o1
	edge16	%l1,	%o7,	%o5
	tpos	%icc,	0x0
	stx	%g6,	[%l7 + 0x60]
	movl	%xcc,	%l4,	%g7
	movvc	%xcc,	%l6,	%i1
	subc	%g1,	%l3,	%l5
	fornot2s	%f9,	%f23,	%f13
	fmovse	%xcc,	%f12,	%f5
	fbe	%fcc2,	loop_436
	movcc	%xcc,	%i4,	%i3
	smulcc	%g4,	0x1FE9,	%o3
	sethi	0x1129,	%o0
loop_436:
	te	%xcc,	0x7
	fba,a	%fcc0,	loop_437
	fbne,a	%fcc0,	loop_438
	fxnors	%f22,	%f22,	%f19
	nop
	setx	0xFA1FE469,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x14699B50,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f20,	%f9
loop_437:
	fmovdcc	%xcc,	%f27,	%f3
loop_438:
	nop
	set	0x3C, %g5
	stwa	%i0,	[%l7 + %g5] 0x2b
	membar	#Sync
	nop
	setx	loop_439,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcs,a	loop_440
	fandnot1	%f6,	%f2,	%f22
	fbu,a	%fcc2,	loop_441
loop_439:
	tsubcctv	%i6,	%o4,	%l0
loop_440:
	sll	%o2,	0x06,	%l2
	edge32l	%g5,	%g2,	%i2
loop_441:
	bneg,a,pn	%icc,	loop_442
	xnor	%i7,	0x1382,	%o6
	add	%g3,	0x10A8,	%i5
	fsrc2	%f20,	%f14
loop_442:
	ldsw	[%l7 + 0x48],	%l1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
	movneg	%xcc,	%o5,	%o1
	fblg,a	%fcc3,	loop_443
	sdivx	%g6,	0x02ED,	%g7
	xorcc	%l4,	%l6,	%i1
	tn	%icc,	0x3
loop_443:
	sub	%l3,	0x0026,	%g1
	fmovdvs	%icc,	%f0,	%f22
	bn,pt	%xcc,	loop_444
	tne	%icc,	0x4
	nop
	setx	loop_445,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrslez	%i4,	%f31,	%f20
loop_444:
	nop
	fitos	%f9,	%f30
	fstod	%f30,	%f14
	tsubcctv	%l5,	0x08FE,	%g4
loop_445:
	array16	%i3,	%o0,	%i0
	tn	%xcc,	0x2
	tsubcc	%i6,	%o3,	%o4
	movn	%xcc,	%l0,	%l2
	brlz	%g5,	loop_446
	fbo	%fcc3,	loop_447
	tsubcc	%o2,	0x136E,	%i2
	mulscc	%i7,	0x191D,	%o6
loop_446:
	xnorcc	%g2,	%g3,	%l1
loop_447:
	nop
	set	0x110, %i7
	nop 	! 	nop 	! 	ldxa	[%g0 + %i7] 0x40,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
	nop
	set	0x1B, %o6
	stb	%o5,	[%l7 + %o6]
	set	0x58, %i1
	sta	%f22,	[%l7 + %i1] 0x81
	mulscc	%o1,	0x1D4C,	%g6
	xorcc	%o7,	%g7,	%l6
	edge32ln	%i1,	%l3,	%g1
	xnorcc	%l4,	%i4,	%g4
	movpos	%xcc,	%l5,	%i3
	taddcc	%o0,	%i6,	%i0
	alignaddrl	%o4,	%o3,	%l0
	move	%icc,	%g5,	%l2
	addcc	%i2,	%i7,	%o2
	ldsw	[%l7 + 0x50],	%g2
	andn	%o6,	0x0B20,	%l1
	ba,a	%xcc,	loop_448
	or	%g3,	0x100F,	%o5
	udiv	%o1,	0x0967,	%g6
	set	0x6C, %o3
	ldswa	[%l7 + %o3] 0x80,	%o7
loop_448:
	edge32l	%g7,	%l6,	%i5
	array32	%i1,	%g1,	%l3
	brnz,a	%l4,	loop_449
	taddcctv	%g4,	0x0FCD,	%l5
	srlx	%i3,	0x10,	%o0
	bcs	%xcc,	loop_450
loop_449:
	nop
	setx	0xD2B37796D7BD16ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x8423C955052F295D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f16,	%f18
	addc	%i6,	0x1854,	%i4
	umulcc	%i0,	0x1EBA,	%o3
loop_450:
	membar	0x76
	fbl	%fcc1,	loop_451
	call	loop_452
	or	%l0,	0x1B14,	%o4
	smul	%g5,	0x096D,	%i2
loop_451:
	fand	%f28,	%f28,	%f4
loop_452:
	subc	%l2,	0x16F1,	%i7
	movcs	%icc,	%o2,	%o6
	nop
	fitos	%f0,	%f28
	fstod	%f28,	%f26
	tcc	%icc,	0x4
	brnz,a	%l1,	loop_453
	fabsd	%f26,	%f24
	fornot1s	%f14,	%f25,	%f7
	alignaddrl	%g2,	%o5,	%o1
loop_453:
	bg,a,pt	%icc,	loop_454
	fmul8ulx16	%f26,	%f0,	%f8
	fmul8x16	%f31,	%f22,	%f8
	movge	%xcc,	%g3,	%g6
loop_454:
	nop
	wr	%g0,	0x2f,	%asi
	stha	%o7,	[%l7 + 0x5A] %asi
	membar	#Sync
	fpadd16s	%f14,	%f12,	%f22
	andn	%l6,	%i5,	%i1
	tn	%icc,	0x2
	edge32l	%g7,	%g1,	%l4
	fbl	%fcc3,	loop_455
	fmul8x16au	%f13,	%f16,	%f20
	sra	%g4,	%l3,	%l5
	and	%o0,	%i3,	%i6
loop_455:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i4,	%i0,	%o3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%o4
	andn	%l0,	%i2,	%g5
	fmovrdlz	%i7,	%f28,	%f26
	popc	%l2,	%o6
	sub	%l1,	%g2,	%o5
	fbul,a	%fcc1,	loop_456
	udivx	%o2,	0x0008,	%o1
	andncc	%g6,	%g3,	%l6
	bcs	%icc,	loop_457
loop_456:
	membar	0x1F
	addc	%i5,	%o7,	%g7
	sub	%i1,	0x08B7,	%l4
loop_457:
	and	%g4,	%l3,	%l5
	bcs,pn	%xcc,	loop_458
	tleu	%xcc,	0x0
	subc	%g1,	%i3,	%i6
	fbu,a	%fcc3,	loop_459
loop_458:
	fbg	%fcc3,	loop_460
	srax	%i4,	0x16,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_459:
	fmovrdne	%i0,	%f14,	%f14
loop_460:
	sub	%o3,	0x1558,	%o4
	subcc	%i2,	0x199B,	%g5
	fones	%f25
	edge8n	%l0,	%l2,	%o6
	movleu	%xcc,	%l1,	%g2
	tge	%xcc,	0x6
	nop
	setx	0xD9E01D4364294008,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x81987973DCB7B22A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f2,	%f20
	edge8	%o5,	%i7,	%o2
	movvs	%icc,	%g6,	%o1
	ldstub	[%l7 + 0x5E],	%l6
	nop
	setx	0x406D65FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fmovsge	%xcc,	%f1,	%f12
	tneg	%icc,	0x5
	srlx	%i5,	0x13,	%g3
	sdivcc	%g7,	0x1CD8,	%i1
	movrgez	%o7,	0x3C5,	%g4
	tne	%xcc,	0x3
	xorcc	%l4,	0x0F6C,	%l5
	fnor	%f14,	%f4,	%f22
	lduh	[%l7 + 0x66],	%g1
	mulscc	%l3,	0x0F16,	%i6
	edge32	%i4,	%o0,	%i0
	nop
	fitod	%f30,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i3,	%o3,	%i2
	tg	%xcc,	0x1
	edge16n	%o4,	%l0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%g5,	loop_461
	edge8n	%l1,	%o6,	%o5
	tg	%xcc,	0x1
	sth	%i7,	[%l7 + 0x32]
loop_461:
	nop
	set	0x53, %i2
	stba	%g2,	[%l7 + %i2] 0x15
	sdiv	%o2,	0x1CDF,	%o1
	tgu	%icc,	0x7
	set	0x16, %g6
	stba	%g6,	[%l7 + %g6] 0xea
	membar	#Sync
	movcc	%icc,	%i5,	%l6
	taddcc	%g3,	0x01C7,	%i1
	umul	%o7,	%g4,	%g7
	addc	%l4,	%g1,	%l5
	fmovde	%xcc,	%f7,	%f18
	nop
	set	0x3E, %g7
	ldsb	[%l7 + %g7],	%i6
	bgu,a	%xcc,	loop_462
	nop
	setx	loop_463,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	be,a	loop_464
	fnand	%f12,	%f24,	%f14
loop_462:
	edge16ln	%l3,	%i4,	%i0
loop_463:
	fpsub16	%f20,	%f14,	%f8
loop_464:
	xorcc	%o0,	0x006F,	%i3
	tle	%xcc,	0x3
	bne,pt	%xcc,	loop_465
	faligndata	%f0,	%f18,	%f16
	set	0x24, %i4
	lda	[%l7 + %i4] 0x10,	%f9
loop_465:
	ldstub	[%l7 + 0x1C],	%o3
	sir	0x06FA
	bgu,a	loop_466
	ldub	[%l7 + 0x6D],	%i2
	movcs	%xcc,	%l0,	%o4
	alignaddrl	%g5,	%l2,	%o6
loop_466:
	fmovrsgez	%o5,	%f0,	%f16
	nop
	setx	0xEBB94A36405B60C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fbl,a	%fcc2,	loop_467
	andncc	%l1,	%i7,	%o2
	subcc	%g2,	0x14A7,	%g6
	bvs,a,pn	%xcc,	loop_468
loop_467:
	tsubcctv	%o1,	0x095E,	%i5
	andncc	%l6,	%i1,	%o7
	tsubcc	%g3,	0x1AD6,	%g4
loop_468:
	tn	%icc,	0x2
	add	%l4,	0x14D6,	%g1
	movpos	%icc,	%g7,	%i6
	fornot2	%f20,	%f0,	%f20
	bg,a,pt	%xcc,	loop_469
	bleu	%icc,	loop_470
	fba,a	%fcc2,	loop_471
	ldsh	[%l7 + 0x6C],	%l3
loop_469:
	call	loop_472
loop_470:
	tleu	%xcc,	0x1
loop_471:
	tneg	%icc,	0x7
	fbne	%fcc2,	loop_473
loop_472:
	tne	%xcc,	0x2
	udiv	%l5,	0x001C,	%i0
	udivx	%o0,	0x1F3D,	%i4
loop_473:
	edge16n	%o3,	%i2,	%i3
	fbul	%fcc2,	loop_474
	or	%l0,	0x0747,	%o4
	andncc	%l2,	%o6,	%o5
	edge8	%l1,	%g5,	%i7
loop_474:
	fblg,a	%fcc0,	loop_475
	movne	%xcc,	%g2,	%g6
	alignaddr	%o2,	%o1,	%i5
	move	%xcc,	%i1,	%o7
loop_475:
	edge16ln	%l6,	%g4,	%g3
	fcmpne16	%f18,	%f24,	%g1
	bge,a	%icc,	loop_476
	fandnot1s	%f22,	%f4,	%f25
	fandnot1	%f6,	%f30,	%f12
	array16	%g7,	%i6,	%l4
loop_476:
	edge8	%l5,	%l3,	%i0
	bvc,a	loop_477
	taddcc	%o0,	0x0F59,	%o3
	nop
	fitod	%f1,	%f26
	andcc	%i4,	0x003F,	%i3
loop_477:
	edge32	%i2,	%o4,	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l2,	%o5
	edge16l	%o6,	%g5,	%l1
	ldsh	[%l7 + 0x66],	%g2
	edge8	%g6,	%o2,	%i7
	fmovs	%f15,	%f21
	add	%o1,	0x1148,	%i1
	brgez	%i5,	loop_478
	movl	%xcc,	%o7,	%l6
	movrgez	%g4,	0x254,	%g1
	sra	%g3,	0x09,	%i6
loop_478:
	edge16l	%g7,	%l5,	%l3
	fmovsge	%xcc,	%f19,	%f20
	fmovsneg	%icc,	%f13,	%f10
	fpadd16	%f10,	%f26,	%f2
	umulcc	%i0,	%l4,	%o3
	fmovsneg	%icc,	%f19,	%f2
	fmovscc	%xcc,	%f19,	%f15
	subcc	%i4,	0x053F,	%o0
	movvc	%xcc,	%i3,	%o4
	edge8n	%l0,	%i2,	%l2
	pdist	%f20,	%f28,	%f16
	or	%o6,	%g5,	%l1
	fblg	%fcc2,	loop_479
	fpsub32s	%f20,	%f17,	%f23
	sir	0x07E1
	mulx	%o5,	0x18A2,	%g2
loop_479:
	nop
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x04,	 0x0
	fbue	%fcc0,	loop_480
	andn	%i7,	%g6,	%o1
	array32	%i1,	%i5,	%o7
	srax	%l6,	0x1C,	%g4
loop_480:
	mulx	%g3,	0x013C,	%g1
	movrgez	%g7,	0x25C,	%l5
	umul	%i6,	0x1EEB,	%l3
	nop
	setx	0x10632478,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	flush	%l7 + 0x48
	andncc	%i0,	%o3,	%i4
	tsubcc	%l4,	%o0,	%o4
	edge16ln	%i3,	%i2,	%l0
	fpadd32	%f26,	%f28,	%f30
	movne	%xcc,	%l2,	%o6
	movcc	%icc,	%g5,	%o5
	and	%l1,	%o2,	%g2
	ldsh	[%l7 + 0x26],	%g6
	fmovdne	%xcc,	%f24,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	loop_481
	taddcc	%i7,	%o1,	%i1
	array32	%o7,	%l6,	%i5
	fmovrse	%g3,	%f10,	%f10
loop_481:
	flush	%l7 + 0x60
	fnegd	%f4,	%f12
	set	0x50, %l5
	stba	%g4,	[%l7 + %l5] 0x10
	subcc	%g1,	%l5,	%i6
	ta	%icc,	0x6
	popc	%g7,	%i0
	sir	0x13A9
	alignaddr	%o3,	%l3,	%i4
	bneg,pn	%icc,	loop_482
	taddcc	%o0,	%l4,	%o4
	andn	%i2,	0x0CE0,	%l0
	edge32	%i3,	%o6,	%l2
loop_482:
	tsubcctv	%g5,	%o5,	%l1
	edge32n	%g2,	%g6,	%i7
	bg	loop_483
	fmovrslez	%o1,	%f31,	%f29
	ldsh	[%l7 + 0x76],	%o2
	edge16l	%o7,	%l6,	%i5
loop_483:
	fpadd32	%f24,	%f0,	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i1,	%g4
	fornot1s	%f19,	%f11,	%f30
	andcc	%g1,	%g3,	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%g7
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%o3
	fxor	%f26,	%f26,	%f30
	movre	%l3,	0x1D2,	%i0
	fmovscs	%icc,	%f12,	%f4
	sir	0x0013
	movne	%xcc,	%o0,	%l4
	movle	%xcc,	%o4,	%i4
	srl	%l0,	%i2,	%o6
	movrne	%i3,	%g5,	%l2
	movcs	%xcc,	%o5,	%l1
	movvs	%xcc,	%g2,	%i7
	fpack16	%f6,	%f21
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x68] %asi,	%g6
	fmul8x16	%f8,	%f18,	%f22
	andncc	%o1,	%o2,	%o7
	alignaddr	%i5,	%l6,	%i1
	udiv	%g1,	0x00B2,	%g3
	fmovscc	%icc,	%f13,	%f31
	membar	0x3E
	ldsb	[%l7 + 0x68],	%l5
	fmovsle	%xcc,	%f1,	%f29
	pdist	%f26,	%f2,	%f10
	addc	%g4,	0x131E,	%i6
	tvc	%xcc,	0x4
	fbue,a	%fcc1,	loop_484
	andn	%g7,	0x0E20,	%l3
	fbn,a	%fcc1,	loop_485
	fmovsleu	%xcc,	%f2,	%f13
loop_484:
	subcc	%o3,	%i0,	%o0
	fbe	%fcc1,	loop_486
loop_485:
	nop
	fitos	%f2,	%f5
	fstox	%f5,	%f12
	nop
	setx	0xA00BFCFC705E5494,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	edge16	%l4,	%i4,	%l0
loop_486:
	fcmpgt16	%f30,	%f20,	%i2
	fmovsg	%xcc,	%f5,	%f20
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o4
	udivx	%i3,	0x1871,	%g5
	ta	%icc,	0x0
	xnorcc	%l2,	0x083A,	%o5
	movvs	%xcc,	%o6,	%g2
	movvs	%icc,	%i7,	%l1
	tsubcctv	%g6,	0x1623,	%o2
	xorcc	%o7,	0x0EA4,	%o1
	set	0x14, %l0
	lduwa	[%l7 + %l0] 0x88,	%l6
	tgu	%xcc,	0x4
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f17
	edge16l	%i1,	%g1,	%g3
	sub	%i5,	0x1385,	%g4
	ldub	[%l7 + 0x13],	%l5
	movrgz	%g7,	0x03A,	%i6
	nop
	setx	0x03C2EB43,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xA2C52244,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f23,	%f10
	alignaddrl	%o3,	%l3,	%i0
	movg	%icc,	%l4,	%o0
	movleu	%icc,	%i4,	%i2
	or	%o4,	0x0BA7,	%i3
	movrgez	%l0,	%l2,	%o5
	bleu,a	loop_487
	movl	%icc,	%o6,	%g5
	fmovs	%f7,	%f6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i7,	%g2
loop_487:
	xnor	%g6,	0x17EA,	%l1
	udiv	%o7,	0x1166,	%o2
	wr	%g0,	0x89,	%asi
	stwa	%o1,	[%l7 + 0x30] %asi
	sra	%i1,	%g1,	%g3
	call	loop_488
	orn	%i5,	0x1A61,	%g4
	mova	%icc,	%l5,	%g7
	edge16l	%i6,	%l6,	%l3
loop_488:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o3,	%l4
	set	0x7C, %l2
	sta	%f25,	[%l7 + %l2] 0x15
	alignaddrl	%i0,	%i4,	%i2
	set	0x58, %i6
	swapa	[%l7 + %i6] 0x19,	%o0
	movvs	%xcc,	%o4,	%i3
	fors	%f10,	%f5,	%f6
	xnor	%l0,	0x01BA,	%l2
	fmovse	%xcc,	%f17,	%f27
	edge16ln	%o6,	%g5,	%i7
	movrlez	%o5,	%g6,	%l1
	sth	%g2,	[%l7 + 0x66]
	ldsw	[%l7 + 0x08],	%o7
	tsubcc	%o1,	0x1676,	%i1
	nop
	fitos	%f6,	%f13
	fstod	%f13,	%f20
	movrgez	%g1,	%o2,	%g3
	ldstub	[%l7 + 0x49],	%i5
	fbo	%fcc1,	loop_489
	fbn,a	%fcc1,	loop_490
	ta	%icc,	0x1
	nop
	setx	0xDCAFEA3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x2214583F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f12,	%f6
loop_489:
	nop
	set	0x50, %l3
	lduwa	[%l7 + %l3] 0x88,	%g4
loop_490:
	nop
	set	0x48, %g2
	prefetch	[%l7 + %g2],	 0x2
	tsubcc	%g7,	0x1329,	%l5
	taddcc	%l6,	%l3,	%o3
	movrgez	%l4,	0x0E3,	%i6
	edge8ln	%i0,	%i4,	%o0
	sth	%i2,	[%l7 + 0x30]
	sll	%o4,	%i3,	%l0
	move	%icc,	%l2,	%g5
	nop
	fitos	%f10,	%f3
	movvc	%icc,	%o6,	%i7
	tn	%icc,	0x1
	sll	%g6,	%l1,	%o5
	mova	%icc,	%o7,	%g2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x64] %asi,	%f1
	subc	%o1,	0x0AB7,	%i1
	andcc	%o2,	0x14AE,	%g1
	nop
	set	0x18, %l6
	prefetch	[%l7 + %l6],	 0x3
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x04,	 0x3
	move	%xcc,	%i5,	%g4
	stw	%l5,	[%l7 + 0x50]
	fba,a	%fcc3,	loop_491
	udiv	%g7,	0x1D19,	%l6
	movne	%icc,	%o3,	%l4
	array32	%i6,	%l3,	%i4
loop_491:
	sub	%i0,	0x11A0,	%i2
	srl	%o0,	%o4,	%l0
	brz	%i3,	loop_492
	edge16ln	%l2,	%o6,	%i7
	sub	%g6,	%g5,	%o5
	movvc	%xcc,	%o7,	%l1
loop_492:
	nop
	setx	0x1B6C2483,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xCAA484F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f9,	%f15
	tleu	%xcc,	0x5
	tvc	%icc,	0x5
	fbge,a	%fcc3,	loop_493
	tneg	%icc,	0x1
	xor	%g2,	0x1A3C,	%i1
	smulcc	%o1,	%g1,	%g3
loop_493:
	edge8l	%i5,	%o2,	%l5
	ldx	[%l7 + 0x30],	%g4
	fmovdleu	%icc,	%f26,	%f11
	ldd	[%l7 + 0x08],	%f8
	mova	%xcc,	%g7,	%o3
	edge16ln	%l4,	%l6,	%i6
	swap	[%l7 + 0x7C],	%i4
	movn	%icc,	%i0,	%i2
	fmovdvs	%icc,	%f8,	%f12
	lduw	[%l7 + 0x50],	%o0
	fandnot1	%f24,	%f10,	%f14
	ta	%icc,	0x0
	brz,a	%l3,	loop_494
	nop
	setx	0x4146F1CDD27DCC17,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5467BEFCE021157C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f26
	fmovdn	%xcc,	%f12,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_494:
	movrne	%l0,	0x2C6,	%o4
	addccc	%l2,	%o6,	%i7
	nop
	setx	loop_495,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%i3,	%g6,	%g5
	edge16n	%o7,	%l1,	%o5
	sub	%g2,	%o1,	%g1
loop_495:
	movrlez	%i1,	%g3,	%i5
	fcmpne16	%f12,	%f10,	%o2
	andn	%l5,	%g7,	%g4
	movl	%icc,	%l4,	%o3
	smul	%l6,	%i6,	%i0
	umulcc	%i2,	%i4,	%o0
	fnands	%f12,	%f22,	%f3
	alignaddrl	%l3,	%o4,	%l2
	tl	%icc,	0x6
	nop
	setx	0x505C5F52607A224F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	smul	%o6,	0x1A63,	%i7
	fbn	%fcc2,	loop_496
	tvs	%icc,	0x2
	nop
	setx	0x29266916,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA4FD0AD8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f0,	%f11
	fabsd	%f6,	%f6
loop_496:
	tn	%xcc,	0x5
	subcc	%i3,	%g6,	%g5
	fblg,a	%fcc2,	loop_497
	bvc,a	%xcc,	loop_498
	tg	%icc,	0x5
	fmovd	%f20,	%f26
loop_497:
	fmovsg	%xcc,	%f12,	%f29
loop_498:
	edge16	%l0,	%l1,	%o5
	fmovsn	%icc,	%f23,	%f7
	fmovsvs	%icc,	%f24,	%f7
	edge16n	%g2,	%o1,	%g1
	bshuffle	%f30,	%f26,	%f28
	std	%f6,	[%l7 + 0x18]
	edge16ln	%i1,	%o7,	%g3
	sdivcc	%o2,	0x09CF,	%l5
	fbn	%fcc1,	loop_499
	movl	%xcc,	%g7,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i5,	%o3,	%l6
loop_499:
	fnands	%f22,	%f16,	%f22
	fsrc1	%f30,	%f30
	movle	%icc,	%l4,	%i6
	fmovsleu	%icc,	%f29,	%f2
	or	%i2,	0x1B59,	%i0
	fmovsne	%icc,	%f14,	%f0
	mulx	%o0,	0x1A71,	%l3
	fmovrse	%i4,	%f26,	%f13
	bge,pn	%icc,	loop_500
	movl	%xcc,	%o4,	%l2
	xnorcc	%o6,	0x1530,	%i7
	tcs	%xcc,	0x2
loop_500:
	movge	%icc,	%i3,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f28,	%f20
	tsubcctv	%l0,	%l1,	%g5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x60] %asi,	%g2
	and	%o5,	0x0224,	%g1
	fmovrsne	%o1,	%f23,	%f2
	bneg	loop_501
	fbuge,a	%fcc2,	loop_502
	fmovsneg	%xcc,	%f20,	%f1
	movleu	%icc,	%i1,	%g3
loop_501:
	umul	%o7,	0x1CA2,	%o2
loop_502:
	fmovdleu	%icc,	%f12,	%f29
	tsubcc	%g7,	0x09CB,	%l5
	swap	[%l7 + 0x34],	%g4
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x11,	%o2
	prefetch	[%l7 + 0x3C],	 0x3
	sub	%l6,	0x169E,	%l4
	sub	%i5,	%i6,	%i2
	edge16ln	%o0,	%l3,	%i4
	bn,a,pt	%xcc,	loop_503
	movrgz	%i0,	0x104,	%l2
	fmovrdlz	%o6,	%f14,	%f12
	fmovdg	%xcc,	%f26,	%f28
loop_503:
	nop
	set	0x1C, %g4
	sth	%o4,	[%l7 + %g4]
	movpos	%xcc,	%i7,	%g6
	tleu	%xcc,	0x4
	sdiv	%l0,	0x0206,	%l1
	movcc	%icc,	%i3,	%g2
	fmovdle	%xcc,	%f24,	%f11
	movge	%xcc,	%o5,	%g5
	popc	0x0C83,	%o1
	edge32n	%i1,	%g3,	%g1
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f28
	fxtos	%f28,	%f28
	sll	%o7,	0x04,	%g7
	sir	0x13E5
	subcc	%l5,	0x1BB5,	%g4
	fpadd16s	%f23,	%f30,	%f21
	xnor	%o3,	%o2,	%l4
	sdivcc	%l6,	0x064C,	%i5
	nop
	fitod	%f2,	%f2
	fdtos	%f2,	%f17
	sll	%i2,	%i6,	%l3
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%f24
	edge8ln	%i4,	%i0,	%l2
	nop
	fitos	%f14,	%f26
	fstod	%f26,	%f18
	movn	%xcc,	%o0,	%o4
	movcc	%icc,	%i7,	%o6
	movrlez	%l0,	%g6,	%l1
	srlx	%i3,	0x0D,	%o5
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f8
	tle	%icc,	0x7
	fabss	%f2,	%f10
	nop
	setx	loop_504,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%g5,	0x0F72,	%o1
	movn	%icc,	%g2,	%i1
	fble	%fcc2,	loop_505
loop_504:
	fmovdne	%xcc,	%f17,	%f3
	smul	%g1,	%o7,	%g7
	nop
	setx	0x9A4CD09C1849B6D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x841A1322B3AA6F88,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f18
loop_505:
	fmovda	%icc,	%f8,	%f19
	ba,a	loop_506
	tle	%xcc,	0x6
	edge8ln	%l5,	%g4,	%g3
	movrne	%o2,	0x039,	%o3
loop_506:
	fbule,a	%fcc3,	loop_507
	movvs	%xcc,	%l6,	%l4
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i2
loop_507:
	orncc	%i5,	%l3,	%i6
	fble	%fcc2,	loop_508
	ta	%xcc,	0x2
	mova	%icc,	%i0,	%l2
	movpos	%icc,	%i4,	%o0
loop_508:
	taddcc	%i7,	%o6,	%o4
	popc	%g6,	%l0
	tn	%xcc,	0x6
	array32	%l1,	%o5,	%g5
	movleu	%icc,	%o1,	%g2
	lduh	[%l7 + 0x4A],	%i3
	brlz	%i1,	loop_509
	bg,a,pt	%xcc,	loop_510
	std	%f2,	[%l7 + 0x68]
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o7
loop_509:
	nop
	setx	0xA7673463,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x4A7DB511,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f11,	%f24
loop_510:
	fmovde	%icc,	%f24,	%f1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g1
	edge16ln	%l5,	%g4,	%g3
	fbge	%fcc3,	loop_511
	fba,a	%fcc0,	loop_512
	lduw	[%l7 + 0x7C],	%g7
	nop
	setx	0x6118A004,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xE800F7D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f5,	%f5
loop_511:
	fnot1s	%f28,	%f4
loop_512:
	andcc	%o3,	%o2,	%l6
	orn	%i2,	%l4,	%i5
	movrne	%l3,	%i6,	%i0
	fpadd32s	%f27,	%f10,	%f11
	fmovrde	%i4,	%f8,	%f12
	fbo,a	%fcc3,	loop_513
	tvc	%icc,	0x0
	fmovrslez	%o0,	%f17,	%f4
	tpos	%icc,	0x0
loop_513:
	fpsub32s	%f2,	%f23,	%f31
	array8	%i7,	%o6,	%l2
	stb	%o4,	[%l7 + 0x67]
	taddcc	%l0,	%g6,	%l1
	sra	%o5,	%o1,	%g5
	fnand	%f14,	%f28,	%f18
	array16	%g2,	%i1,	%o7
	nop
	fitos	%f9,	%f27
	tleu	%xcc,	0x7
	udiv	%g1,	0x0362,	%l5
	tpos	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f12,	%f0,	%f30
	fmovdg	%icc,	%f28,	%f24
	membar	0x61
	nop
	fitod	%f28,	%f30
	edge16l	%g4,	%g3,	%i3
	movrlez	%o3,	0x2AD,	%o2
	movre	%g7,	0x272,	%l6
	fandnot1	%f22,	%f14,	%f8
	fmovsne	%xcc,	%f2,	%f23
	tn	%xcc,	0x5
	andcc	%i2,	0x1EC8,	%l4
	mova	%xcc,	%i5,	%i6
	fornot2	%f20,	%f24,	%f18
	tsubcc	%i0,	0x10B3,	%i4
	ldstub	[%l7 + 0x35],	%l3
	nop
	setx loop_514, %l0, %l1
	jmpl %l1, %i7
	and	%o6,	%o0,	%o4
	fmovdl	%xcc,	%f20,	%f21
	xor	%l0,	%g6,	%l2
loop_514:
	movneg	%icc,	%l1,	%o1
	tn	%icc,	0x7
	ld	[%l7 + 0x08],	%f3
	wr	%g0,	0x18,	%asi
	sta	%f7,	[%l7 + 0x48] %asi
	srax	%g5,	%g2,	%i1
	movn	%xcc,	%o5,	%g1
	sdivx	%l5,	0x02A3,	%o7
	tcs	%xcc,	0x0
	subccc	%g3,	%i3,	%o3
	fbl	%fcc2,	loop_515
	movge	%xcc,	%o2,	%g4
	fpadd16	%f26,	%f12,	%f2
	fmovsgu	%icc,	%f26,	%f13
loop_515:
	movle	%xcc,	%l6,	%i2
	popc	0x05C1,	%g7
	movre	%i5,	%l4,	%i6
	taddcctv	%i0,	%i4,	%i7
	edge32l	%o6,	%o0,	%l3
	fpsub16	%f22,	%f8,	%f24
	andcc	%o4,	0x183B,	%l0
	orn	%g6,	0x0DBF,	%l2
	ldstub	[%l7 + 0x72],	%l1
	array8	%o1,	%g2,	%g5
	xnor	%i1,	%g1,	%o5
	ldd	[%l7 + 0x20],	%f26
	fcmple32	%f30,	%f28,	%l5
	fzeros	%f13
	addc	%o7,	0x1DE9,	%g3
	fbne,a	%fcc1,	loop_516
	ldsh	[%l7 + 0x40],	%o3
	sdiv	%i3,	0x1C4E,	%o2
	xnorcc	%g4,	0x1111,	%i2
loop_516:
	fpack16	%f22,	%f5
	taddcc	%g7,	%l6,	%l4
	movre	%i6,	0x254,	%i0
	fsrc2	%f18,	%f8
	edge8n	%i5,	%i4,	%o6
	movn	%xcc,	%o0,	%l3
	fbule,a	%fcc3,	loop_517
	subcc	%o4,	0x1CE5,	%l0
	fpack32	%f14,	%f16,	%f14
	ldstub	[%l7 + 0x0C],	%g6
loop_517:
	movgu	%icc,	%i7,	%l2
	edge16l	%o1,	%l1,	%g2
	for	%f22,	%f22,	%f16
	andncc	%i1,	%g1,	%o5
	addccc	%l5,	0x07A3,	%g5
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x89,	%o6
	andn	%o3,	0x089E,	%g3
	subcc	%o2,	0x016D,	%g4
	fone	%f10
	movcc	%icc,	%i2,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	%xcc,	loop_518
	fbo,a	%fcc2,	loop_519
	popc	0x18A3,	%l6
	edge16l	%g7,	%i6,	%l4
loop_518:
	fblg,a	%fcc2,	loop_520
loop_519:
	std	%f6,	[%l7 + 0x10]
	fmovsn	%xcc,	%f21,	%f19
	array16	%i5,	%i0,	%o6
loop_520:
	te	%xcc,	0x1
	edge8n	%o0,	%l3,	%o4
	addc	%i4,	%g6,	%i7
	fsrc2	%f16,	%f8
	srl	%l2,	%l0,	%l1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	udiv	%o1,	0x0AEC,	%i1
	bcc,a	loop_521
	fzeros	%f17
	lduw	[%l7 + 0x5C],	%g1
	movleu	%icc,	%l5,	%g5
loop_521:
	nop
	setx	0x143310FEF051A7F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmuld8ulx16	%f13,	%f4,	%f24
	fcmple32	%f4,	%f4,	%o5
	nop
	setx	0xF6080A54306E28A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	prefetch	[%l7 + 0x64],	 0x2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	sub	%o7,	%g3,	%o2
	mulx	%i2,	%g4,	%l6
	bn,a,pt	%icc,	loop_522
	udivx	%g7,	0x09B0,	%i3
	movneg	%icc,	%l4,	%i5
	udiv	%i6,	0x039E,	%o6
loop_522:
	movne	%icc,	%o0,	%i0
	sllx	%l3,	%o4,	%g6
	lduh	[%l7 + 0x2E],	%i7
	fsrc1s	%f27,	%f6
	taddcctv	%l2,	%l0,	%l1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	movpos	%icc,	%o1,	%i1
	xnorcc	%g1,	%l5,	%g5
	bleu,a,pn	%xcc,	loop_523
	edge8	%o5,	%o3,	%o7
	fbge,a	%fcc1,	loop_524
	bpos,a	loop_525
loop_523:
	edge32l	%g3,	%g2,	%i2
	fmovdn	%xcc,	%f5,	%f16
loop_524:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%o2
loop_525:
	fpsub32s	%f26,	%f19,	%f13
	ld	[%l7 + 0x68],	%f25
	bcc,pt	%icc,	loop_526
	udivcc	%l6,	0x0107,	%g4
	ldsh	[%l7 + 0x10],	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_526:
	bne	loop_527
	te	%xcc,	0x5
	tsubcc	%i3,	%i5,	%i6
	set	0x46, %o0
	stha	%l4,	[%l7 + %o0] 0x22
	membar	#Sync
loop_527:
	subcc	%o6,	%i0,	%l3
	fmovdvs	%icc,	%f21,	%f9
	edge32l	%o4,	%o0,	%g6
	edge8ln	%l2,	%l0,	%i7
	fabss	%f3,	%f16
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i4
	sll	%o1,	0x10,	%l1
	fmovd	%f8,	%f26
	fcmpne32	%f16,	%f10,	%g1
	movgu	%xcc,	%l5,	%i1
	addc	%o5,	%o3,	%g5
	tg	%icc,	0x2
	edge16ln	%o7,	%g3,	%i2
	nop
	setx	0x5AE0E30426BBABFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x6B1CCA64BB516A35,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f4,	%f24
	tne	%xcc,	0x4
	fpsub16	%f28,	%f24,	%f14
	popc	0x1650,	%o2
	fornot1s	%f24,	%f13,	%f25
	srlx	%l6,	%g2,	%g4
	ldsb	[%l7 + 0x62],	%g7
	tcc	%icc,	0x3
	alignaddrl	%i5,	%i3,	%l4
	xorcc	%i6,	0x164C,	%o6
	be	loop_528
	addc	%i0,	0x085F,	%o4
	movrne	%l3,	0x321,	%g6
	andn	%o0,	%l0,	%l2
loop_528:
	fornot2	%f0,	%f20,	%f24
	tvs	%xcc,	0x0
	movcs	%icc,	%i7,	%o1
	movrlez	%l1,	%i4,	%g1
	nop
	setx	0xD7F51733,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xB0C1BDD7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f10,	%f15
	membar	0x2A
	brgz	%i1,	loop_529
	bleu,a	%icc,	loop_530
	fmovsa	%icc,	%f2,	%f27
	nop
	setx	0x87D94004907608E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_529:
	fmovrsgz	%o5,	%f11,	%f24
loop_530:
	tne	%xcc,	0x6
	lduw	[%l7 + 0x58],	%o3
	fmovrsgez	%g5,	%f6,	%f13
	brnz	%l5,	loop_531
	fbge	%fcc1,	loop_532
	fnot2s	%f24,	%f0
	set	0x28, %l1
	sta	%f9,	[%l7 + %l1] 0x19
loop_531:
	ba,a,pt	%icc,	loop_533
loop_532:
	edge32n	%g3,	%i2,	%o7
	wr	%g0,	0x19,	%asi
	stba	%o2,	[%l7 + 0x08] %asi
loop_533:
	fsrc2	%f28,	%f26
	andncc	%g2,	%g4,	%l6
	fmovrdne	%g7,	%f20,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x1
	bn,a,pt	%xcc,	loop_534
	movne	%xcc,	%i5,	%i3
	orcc	%i6,	0x1B43,	%o6
	fmovrslz	%i0,	%f30,	%f9
loop_534:
	movl	%xcc,	%o4,	%l4
	movrgez	%l3,	%g6,	%l0
	lduh	[%l7 + 0x60],	%o0
	fmovsgu	%xcc,	%f27,	%f1
	orncc	%l2,	0x0590,	%o1
	te	%xcc,	0x0
	fpack32	%f10,	%f2,	%f8
	umulcc	%i7,	%i4,	%g1
	udiv	%i1,	0x0E61,	%o5
	bge,a,pn	%icc,	loop_535
	sethi	0x0D29,	%l1
	fbuge	%fcc3,	loop_536
	xnorcc	%o3,	%l5,	%g5
loop_535:
	addc	%g3,	%i2,	%o7
	edge32n	%g2,	%o2,	%l6
loop_536:
	te	%icc,	0x6
	fbl	%fcc3,	loop_537
	movrgz	%g4,	0x3EC,	%i5
	fmovdgu	%icc,	%f10,	%f12
	fmovsg	%icc,	%f13,	%f14
loop_537:
	fble	%fcc0,	loop_538
	membar	0x25
	set	0x2D, %o1
	stba	%g7,	[%l7 + %o1] 0x0c
loop_538:
	popc	0x0FF1,	%i3
	movre	%i6,	0x14F,	%i0
	edge8ln	%o4,	%o6,	%l3
	tcc	%xcc,	0x5
	subc	%l4,	%l0,	%o0
	stbar
	fabsd	%f6,	%f14
	set	0x44, %g1
	sta	%f17,	[%l7 + %g1] 0x15
	edge16	%l2,	%o1,	%i7
	udivcc	%i4,	0x0855,	%g6
	fbug	%fcc2,	loop_539
	fpsub32s	%f21,	%f31,	%f31
	movle	%xcc,	%i1,	%g1
	fbule	%fcc1,	loop_540
loop_539:
	edge32n	%o5,	%o3,	%l5
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x17,	%f16
loop_540:
	nop
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
	xorcc	%g3,	0x191C,	%l1
	bge	%xcc,	loop_541
	brlez	%o7,	loop_542
	taddcc	%i2,	%g2,	%o2
	fandnot1	%f28,	%f10,	%f20
loop_541:
	bn,a	loop_543
loop_542:
	movl	%icc,	%l6,	%g4
	tle	%icc,	0x7
	taddcctv	%i5,	0x15A1,	%g7
loop_543:
	srl	%i6,	0x15,	%i3
	movleu	%icc,	%o4,	%i0
	smulcc	%o6,	0x0345,	%l3
	fbge,a	%fcc0,	loop_544
	fzeros	%f1
	ldub	[%l7 + 0x77],	%l4
	srl	%l0,	%o0,	%o1
loop_544:
	nop
	set	0x6E, %o7
	stba	%i7,	[%l7 + %o7] 0x10
	fmovsne	%icc,	%f17,	%f24
	fornot1	%f26,	%f30,	%f20
	brgz,a	%i4,	loop_545
	srl	%g6,	%i1,	%l2
	orn	%o5,	%g1,	%o3
	bcs,a	%icc,	loop_546
loop_545:
	stx	%l5,	[%l7 + 0x60]
	std	%f10,	[%l7 + 0x70]
	te	%icc,	0x4
loop_546:
	fmovse	%icc,	%f16,	%f6
	taddcc	%g5,	0x18F2,	%g3
	tle	%icc,	0x5
	movrgez	%l1,	0x2BC,	%o7
	movvc	%icc,	%i2,	%o2
	fbue,a	%fcc1,	loop_547
	ldstub	[%l7 + 0x7A],	%l6
	st	%f28,	[%l7 + 0x64]
	swap	[%l7 + 0x78],	%g4
loop_547:
	array32	%g2,	%i5,	%g7
	movl	%xcc,	%i6,	%o4
	popc	0x0679,	%i3
	orn	%o6,	%l3,	%l4
	movrgz	%i0,	%o0,	%o1
	fbg,a	%fcc0,	loop_548
	taddcctv	%l0,	0x100F,	%i4
	smulcc	%g6,	%i7,	%i1
	edge8ln	%o5,	%l2,	%o3
loop_548:
	sir	0x0474
	tneg	%xcc,	0x2
	nop
	set	0x52, %i5
	ldub	[%l7 + %i5],	%l5
	movrgz	%g5,	0x039,	%g1
	smul	%l1,	%g3,	%o7
	be,a,pn	%xcc,	loop_549
	for	%f26,	%f0,	%f26
	fmovdg	%icc,	%f12,	%f28
	fmovse	%icc,	%f9,	%f9
loop_549:
	bgu,pt	%xcc,	loop_550
	brz,a	%o2,	loop_551
	bgu,a,pn	%xcc,	loop_552
	srax	%i2,	%g4,	%g2
loop_550:
	for	%f4,	%f26,	%f28
loop_551:
	nop
	set	0x70, %i0
	stba	%i5,	[%l7 + %i0] 0x15
loop_552:
	and	%l6,	%g7,	%i6
	set	0x36, %g5
	ldsha	[%l7 + %g5] 0x88,	%i3
	addcc	%o4,	%l3,	%o6
	membar	0x67
	nop
	fitod	%f30,	%f30
	fsrc2s	%f24,	%f31
	movneg	%icc,	%i0,	%l4
	movrne	%o1,	0x23A,	%o0
	addc	%l0,	%i4,	%g6
	orn	%i7,	0x1BDB,	%i1
	nop
	fitos	%f21,	%f14
	fbne,a	%fcc0,	loop_553
	ldx	[%l7 + 0x78],	%l2
	edge32n	%o3,	%o5,	%l5
	addccc	%g5,	%g1,	%l1
loop_553:
	nop
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x15,	%o7
	fexpand	%f13,	%f20
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%o2
	fbge	%fcc0,	loop_554
	taddcc	%i2,	0x1D3C,	%g2
	fbg	%fcc2,	loop_555
	movle	%xcc,	%g4,	%i5
loop_554:
	fbne,a	%fcc1,	loop_556
	bpos,pn	%xcc,	loop_557
loop_555:
	alignaddrl	%l6,	%g7,	%i3
	fnot1s	%f8,	%f13
loop_556:
	andncc	%o4,	%l3,	%o6
loop_557:
	bgu,a	loop_558
	fmovdvc	%xcc,	%f5,	%f30
	movgu	%icc,	%i0,	%l4
	fpack32	%f2,	%f6,	%f24
loop_558:
	fmovdvs	%icc,	%f6,	%f12
	tn	%xcc,	0x4
	tleu	%icc,	0x0
	fandnot2s	%f14,	%f13,	%f28
	fmovrdgez	%o1,	%f24,	%f8
	stbar
	tl	%icc,	0x3
	ldd	[%l7 + 0x38],	%i6
	edge8n	%o0,	%i4,	%l0
	xorcc	%g6,	%i1,	%i7
	bleu,pt	%xcc,	loop_559
	fmovdne	%xcc,	%f8,	%f1
	movgu	%xcc,	%o3,	%l2
	membar	0x2C
loop_559:
	umul	%o5,	%g5,	%g1
	fbule,a	%fcc3,	loop_560
	te	%xcc,	0x6
	swap	[%l7 + 0x50],	%l1
	brgz	%l5,	loop_561
loop_560:
	add	%g3,	%o7,	%o2
	movle	%icc,	%i2,	%g2
	movneg	%xcc,	%g4,	%i5
loop_561:
	fornot2s	%f17,	%f1,	%f2
	edge32n	%g7,	%l6,	%i3
	fmul8x16	%f30,	%f14,	%f16
	taddcc	%o4,	%l3,	%i0
	fbo,a	%fcc3,	loop_562
	xnorcc	%l4,	%o6,	%o1
	fmovdpos	%xcc,	%f24,	%f6
	mulx	%i6,	0x1CC9,	%i4
loop_562:
	udivcc	%o0,	0x0C03,	%g6
	orncc	%l0,	%i7,	%i1
	movn	%icc,	%o3,	%l2
	fcmpeq16	%f10,	%f8,	%g5
	nop
	fitod	%f12,	%f8
	fdtoi	%f8,	%f22
	fcmpne32	%f12,	%f24,	%o5
	fmovdpos	%xcc,	%f26,	%f3
	tpos	%icc,	0x2
	tsubcc	%g1,	0x0DC9,	%l1
	sdivcc	%g3,	0x0BCA,	%o7
	udivx	%o2,	0x05F6,	%l5
	fors	%f25,	%f17,	%f1
	set	0x3A, %i1
	lduha	[%l7 + %i1] 0x0c,	%g2
	set	0x10, %o6
	lda	[%l7 + %o6] 0x0c,	%f25
	movrgez	%i2,	%g4,	%i5
	move	%icc,	%g7,	%i3
	edge8ln	%l6,	%o4,	%l3
	bl,a,pn	%icc,	loop_563
	bpos,a,pt	%icc,	loop_564
	brgz	%l4,	loop_565
	tvc	%xcc,	0x7
loop_563:
	movge	%xcc,	%i0,	%o1
loop_564:
	movrlez	%i6,	%o6,	%o0
loop_565:
	fbug	%fcc2,	loop_566
	fmovsne	%icc,	%f22,	%f8
	movn	%icc,	%i4,	%g6
	edge32ln	%l0,	%i7,	%o3
loop_566:
	fmovrdgez	%l2,	%f0,	%f6
	set	0x4A, %i2
	ldsha	[%l7 + %i2] 0x88,	%g5
	or	%i1,	%g1,	%o5
	umulcc	%g3,	0x1C35,	%o7
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x64] %asi,	%f28
	sll	%l1,	0x15,	%o2
	popc	0x0909,	%l5
	edge8n	%g2,	%i2,	%i5
	add	%g4,	%i3,	%l6
	bpos	loop_567
	array32	%o4,	%l3,	%g7
	brgez,a	%l4,	loop_568
	lduh	[%l7 + 0x60],	%o1
loop_567:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x4C],	%f24
loop_568:
	and	%i6,	%o6,	%i0
	fbul,a	%fcc3,	loop_569
	subcc	%o0,	%i4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f6,	%f16,	%f0
loop_569:
	movrlez	%i7,	%g6,	%o3
	fandnot1s	%f5,	%f21,	%f21
	edge32ln	%l2,	%g5,	%g1
	fnegd	%f16,	%f22
	movvs	%xcc,	%i1,	%o5
	fnand	%f4,	%f10,	%f2
	nop
	setx	0xACB39724,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xDBD22E39,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f29,	%f21
	movre	%o7,	0x1E2,	%l1
	andn	%g3,	0x1624,	%o2
	fnot1	%f18,	%f10
	nop
	setx	0x2D8EA07BC0657D79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fnor	%f4,	%f2,	%f8
	fmovdcc	%icc,	%f14,	%f7
	alignaddrl	%g2,	%l5,	%i2
	mova	%icc,	%g4,	%i5
	fnot2	%f30,	%f6
	fpack16	%f12,	%f0
	sethi	0x1A6C,	%i3
	wr	%g0,	0x89,	%asi
	stxa	%o4,	[%l7 + 0x08] %asi
	edge32n	%l3,	%g7,	%l6
	tneg	%xcc,	0x2
	brgz	%o1,	loop_570
	nop
	fitos	%f4,	%f0
	fstox	%f0,	%f28
	fbn,a	%fcc3,	loop_571
	sethi	0x0DF3,	%l4
loop_570:
	addcc	%o6,	%i0,	%i6
	fxors	%f23,	%f13,	%f8
loop_571:
	nop
	setx	0x104FB045,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	fmovsneg	%icc,	%f3,	%f8
	membar	0x1F
	mulx	%i4,	0x0251,	%l0
	movrne	%o0,	0x150,	%i7
	array8	%o3,	%g6,	%l2
	or	%g1,	0x12C2,	%i1
	movl	%icc,	%o5,	%o7
	fbe,a	%fcc0,	loop_572
	tle	%icc,	0x2
	tvs	%xcc,	0x6
	tn	%xcc,	0x5
loop_572:
	mova	%xcc,	%g5,	%g3
	orncc	%o2,	0x0C17,	%g2
	fmovrdgz	%l5,	%f18,	%f8
	fbne	%fcc2,	loop_573
	tl	%icc,	0x5
	bvs	loop_574
	srlx	%l1,	0x16,	%i2
loop_573:
	bneg	%xcc,	loop_575
	edge32n	%i5,	%g4,	%o4
loop_574:
	nop
	set	0x70, %o3
	stxa	%l3,	[%l7 + %o3] 0x19
loop_575:
	tneg	%xcc,	0x4
	and	%i3,	0x187C,	%g7
	ldsb	[%l7 + 0x18],	%l6
	fpack32	%f10,	%f6,	%f20
	bvc,pt	%icc,	loop_576
	edge16n	%o1,	%l4,	%i0
	nop
	setx loop_577, %l0, %l1
	jmpl %l1, %o6
	or	%i4,	0x1B2D,	%i6
loop_576:
	array32	%l0,	%i7,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_577:
	fmovrsgz	%g6,	%f9,	%f13
	movrgez	%l2,	0x3FE,	%o3
	fabsd	%f16,	%f16
	fbuge	%fcc0,	loop_578
	std	%f6,	[%l7 + 0x58]
	andn	%i1,	0x0533,	%g1
	sethi	0x0FCF,	%o5
loop_578:
	fmul8x16	%f21,	%f10,	%f4
	fnands	%f11,	%f2,	%f8
	fbge,a	%fcc2,	loop_579
	popc	0x04EF,	%g5
	edge16ln	%g3,	%o7,	%g2
	fmovdvc	%xcc,	%f19,	%f28
loop_579:
	mulscc	%l5,	0x1630,	%l1
	xnorcc	%o2,	%i5,	%i2
	fmovrslz	%o4,	%f10,	%f6
	umulcc	%l3,	0x1372,	%i3
	nop
	fitod	%f4,	%f24
	fdtox	%f24,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x0
	sdivcc	%g7,	0x151B,	%l6
	fmovdvc	%icc,	%f25,	%f23
	tge	%xcc,	0x4
	ldsh	[%l7 + 0x30],	%g4
	fmul8x16al	%f17,	%f24,	%f28
	tge	%icc,	0x0
	movneg	%icc,	%l4,	%o1
	movneg	%xcc,	%i0,	%i4
	sdivx	%i6,	0x0E74,	%o6
	nop
	fitod	%f21,	%f30
	array8	%i7,	%l0,	%o0
	fbe	%fcc2,	loop_580
	tneg	%xcc,	0x3
	mova	%icc,	%g6,	%o3
	movvc	%icc,	%i1,	%g1
loop_580:
	tvc	%icc,	0x6
	tcc	%icc,	0x7
	movn	%icc,	%l2,	%g5
	bvc,a	%icc,	loop_581
	fors	%f22,	%f20,	%f13
	addccc	%o5,	%o7,	%g2
	set	0x42, %g7
	ldsba	[%l7 + %g7] 0x14,	%g3
loop_581:
	xnorcc	%l5,	0x1F2A,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x11,	%i5,	%i2
	edge8n	%o4,	%o2,	%l3
	set	0x44, %g6
	stwa	%g7,	[%l7 + %g6] 0x11
	fnor	%f28,	%f28,	%f16
	nop
	setx	0xBF037C39B0527D12,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	movne	%icc,	%l6,	%g4
	fexpand	%f25,	%f28
	smulcc	%i3,	0x0468,	%o1
	array32	%i0,	%l4,	%i4
	movgu	%icc,	%o6,	%i7
	tpos	%xcc,	0x7
	brgez,a	%i6,	loop_582
	fmovdcc	%icc,	%f28,	%f2
	add	%l0,	%o0,	%o3
	edge16ln	%g6,	%g1,	%l2
loop_582:
	nop
	fitos	%f25,	%f0
	set	0x18, %o4
	stwa	%g5,	[%l7 + %o4] 0x2a
	membar	#Sync
	fpadd32s	%f9,	%f6,	%f9
	ta	%xcc,	0x1
	edge8ln	%i1,	%o7,	%o5
	bg,a,pt	%xcc,	loop_583
	srl	%g2,	%g3,	%l5
	fbge	%fcc3,	loop_584
	array32	%l1,	%i5,	%i2
loop_583:
	srax	%o4,	%l3,	%g7
	ld	[%l7 + 0x58],	%f18
loop_584:
	tvs	%icc,	0x2
	fornot2s	%f10,	%f0,	%f4
	fxnor	%f0,	%f26,	%f24
	xnorcc	%o2,	0x0C4B,	%l6
	mova	%icc,	%i3,	%g4
	addccc	%i0,	0x1B99,	%o1
	movne	%xcc,	%i4,	%l4
	fmovscs	%xcc,	%f31,	%f20
	movrlez	%o6,	%i6,	%i7
	tvc	%xcc,	0x5
	xor	%l0,	0x0836,	%o3
	andcc	%o0,	%g1,	%g6
	fornot1	%f6,	%f8,	%f22
	movneg	%icc,	%l2,	%i1
	movre	%g5,	%o7,	%o5
	ldx	[%l7 + 0x30],	%g2
	fnot1	%f26,	%f20
	fornot2	%f16,	%f28,	%f14
	sth	%l5,	[%l7 + 0x40]
	bshuffle	%f0,	%f30,	%f12
	fpmerge	%f27,	%f11,	%f30
	fabss	%f5,	%f23
	fmovdleu	%xcc,	%f4,	%f14
	smulcc	%l1,	0x16DD,	%g3
	std	%f10,	[%l7 + 0x30]
	tcc	%xcc,	0x1
	brlez	%i5,	loop_585
	lduh	[%l7 + 0x5A],	%i2
	movge	%icc,	%o4,	%g7
	fpack32	%f4,	%f28,	%f30
loop_585:
	nop
	set	0x2A, %l5
	ldsha	[%l7 + %l5] 0x15,	%o2
	fmovsleu	%xcc,	%f3,	%f29
	fornot1	%f30,	%f30,	%f28
	brgz,a	%l3,	loop_586
	tsubcc	%l6,	0x1E25,	%i3
	ta	%icc,	0x3
	movrne	%g4,	%o1,	%i0
loop_586:
	nop
	set	0x37, %l0
	ldsba	[%l7 + %l0] 0x0c,	%i4
	taddcctv	%l4,	0x1FF9,	%i6
	std	%f16,	[%l7 + 0x10]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f10,	%f3
	fstox	%f3,	%f6
	fxtos	%f6,	%f24
	xnor	%i7,	%l0,	%o6
	movge	%xcc,	%o0,	%o3
	taddcc	%g6,	0x0EE5,	%l2
	fandnot2s	%f0,	%f4,	%f12
	tcs	%icc,	0x3
	ldsw	[%l7 + 0x7C],	%i1
	xorcc	%g5,	0x1380,	%o7
	srl	%o5,	%g1,	%g2
	taddcctv	%l5,	%g3,	%l1
	stbar
	tgu	%xcc,	0x4
	tsubcctv	%i2,	%o4,	%i5
	tvc	%icc,	0x0
	edge16	%o2,	%l3,	%l6
	popc	0x167C,	%i3
	fzeros	%f0
	sdivcc	%g4,	0x0545,	%g7
	sir	0x12DA
	add	%o1,	%i0,	%l4
	brlz,a	%i4,	loop_587
	tge	%xcc,	0x5
	tne	%xcc,	0x7
	fmovsgu	%xcc,	%f8,	%f9
loop_587:
	fmovsg	%icc,	%f26,	%f19
	udivx	%i7,	0x13BF,	%i6
	subcc	%l0,	%o6,	%o0
	tvc	%icc,	0x7
	taddcctv	%g6,	%o3,	%l2
	tcs	%icc,	0x0
	ta	%icc,	0x7
	fmovrdlz	%g5,	%f14,	%f10
	fmovsg	%xcc,	%f27,	%f20
	fornot1s	%f5,	%f2,	%f2
	subc	%i1,	%o7,	%g1
	fmovrde	%g2,	%f20,	%f6
	prefetch	[%l7 + 0x78],	 0x0
	array32	%o5,	%l5,	%g3
	andcc	%l1,	0x0084,	%o4
	fble,a	%fcc2,	loop_588
	movvc	%xcc,	%i5,	%o2
	fbug,a	%fcc1,	loop_589
	pdist	%f0,	%f16,	%f0
loop_588:
	fcmpgt32	%f20,	%f16,	%i2
	sllx	%l6,	0x11,	%i3
loop_589:
	bshuffle	%f28,	%f12,	%f10
	movle	%icc,	%l3,	%g4
	xorcc	%o1,	0x18A7,	%g7
	movne	%icc,	%i0,	%i4
	fmovrdlz	%i7,	%f18,	%f16
	edge32ln	%i6,	%l0,	%o6
	brgez	%o0,	loop_590
	move	%xcc,	%l4,	%g6
	brlz,a	%o3,	loop_591
	orcc	%l2,	0x1ECA,	%g5
loop_590:
	movn	%xcc,	%o7,	%i1
	nop
	setx	0xFFB9E0491DA45ABB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x8AF38C6343878587,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f4,	%f12
loop_591:
	nop
	set	0x60, %i4
	stx	%g2,	[%l7 + %i4]
	mova	%xcc,	%g1,	%o5
	xor	%l5,	%g3,	%l1
	sdiv	%i5,	0x0C58,	%o2
	fpackfix	%f16,	%f14
	fmovsneg	%icc,	%f7,	%f15
	movvs	%xcc,	%i2,	%o4
	brlez,a	%l6,	loop_592
	array16	%l3,	%i3,	%o1
	nop
	setx	0xC24DAAC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x21349BCB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f26,	%f21
	sub	%g7,	%g4,	%i4
loop_592:
	mova	%icc,	%i7,	%i6
	tpos	%xcc,	0x3
	lduw	[%l7 + 0x5C],	%i0
	popc	%o6,	%o0
	movneg	%icc,	%l0,	%l4
	umul	%g6,	0x18EC,	%o3
	andcc	%l2,	%o7,	%g5
	subccc	%i1,	%g2,	%g1
	tsubcctv	%l5,	0x0D35,	%g3
	edge8ln	%l1,	%o5,	%i5
	tvs	%xcc,	0x5
	sir	0x1996
	fbul	%fcc1,	loop_593
	fpsub32	%f22,	%f18,	%f24
	ldd	[%l7 + 0x70],	%f16
	edge16l	%o2,	%i2,	%o4
loop_593:
	nop
	setx loop_594, %l0, %l1
	jmpl %l1, %l6
	movn	%xcc,	%i3,	%l3
	nop
	fitod	%f28,	%f2
	edge8	%o1,	%g7,	%g4
loop_594:
	fmovsge	%icc,	%f26,	%f28
	bleu,a	loop_595
	edge16	%i4,	%i7,	%i0
	fmovscc	%icc,	%f31,	%f21
	lduw	[%l7 + 0x24],	%o6
loop_595:
	movgu	%icc,	%o0,	%l0
	ble	%xcc,	loop_596
	movleu	%xcc,	%l4,	%i6
	brz,a	%g6,	loop_597
	lduh	[%l7 + 0x30],	%l2
loop_596:
	movcs	%icc,	%o3,	%g5
	fbne,a	%fcc3,	loop_598
loop_597:
	array16	%i1,	%g2,	%o7
	xor	%g1,	%l5,	%l1
	bne,a	%xcc,	loop_599
loop_598:
	edge16ln	%g3,	%i5,	%o5
	be,a	loop_600
	sdivx	%o2,	0x1164,	%o4
loop_599:
	fsrc1	%f18,	%f14
	movneg	%xcc,	%i2,	%l6
loop_600:
	fsrc2s	%f14,	%f1
	and	%i3,	0x0E35,	%l3
	addccc	%o1,	0x03E9,	%g7
	sdivcc	%i4,	0x1C9C,	%i7
	stw	%g4,	[%l7 + 0x38]
	movneg	%xcc,	%o6,	%o0
	alignaddrl	%i0,	%l0,	%i6
	array16	%g6,	%l2,	%l4
	fpsub16	%f22,	%f26,	%f12
	sethi	0x044A,	%g5
	edge16n	%i1,	%g2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f24,	%f12,	%o3
	umulcc	%l5,	0x00DA,	%g1
	movge	%xcc,	%l1,	%i5
	subccc	%o5,	0x026D,	%g3
	sllx	%o4,	%i2,	%o2
	set	0x08, %l2
	stha	%i3,	[%l7 + %l2] 0x0c
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l3
	nop
	setx	0x7061C8C2A8F28951,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFE510AA26C57FBF0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f12
	movvs	%icc,	%o1,	%l6
	fabsd	%f6,	%f10
	nop
	setx	0xA3A6436F70480289,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	mulx	%i4,	0x0DDB,	%g7
	tn	%xcc,	0x4
	bge,a,pt	%xcc,	loop_601
	ldsw	[%l7 + 0x18],	%g4
	movrgez	%o6,	%i7,	%i0
	fmovsvc	%icc,	%f1,	%f28
loop_601:
	sir	0x0019
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x80
	nop
	setx	0x666F59AE8643E920,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x85E55C163C0DE9C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f14,	%f4
	fbl,a	%fcc1,	loop_602
	fzero	%f26
	tsubcctv	%o0,	0x1F83,	%i6
	fmul8x16	%f8,	%f12,	%f4
loop_602:
	udiv	%g6,	0x1AD4,	%l0
	taddcctv	%l4,	%l2,	%i1
	fpsub16	%f8,	%f0,	%f6
	tgu	%icc,	0x1
	bcs,a	loop_603
	fmovsle	%icc,	%f3,	%f25
	andncc	%g2,	%o7,	%g5
	tneg	%xcc,	0x3
loop_603:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x38] %asi,	%o3
	brgz,a	%l5,	loop_604
	brz	%g1,	loop_605
	tg	%icc,	0x7
	movcs	%icc,	%l1,	%o5
loop_604:
	sll	%i5,	0x06,	%o4
loop_605:
	bgu,a,pn	%xcc,	loop_606
	bgu,a,pn	%xcc,	loop_607
	sra	%i2,	0x00,	%g3
	movre	%i3,	0x0A5,	%l3
loop_606:
	mova	%xcc,	%o1,	%o2
loop_607:
	fandnot1s	%f22,	%f6,	%f5
	fpsub32s	%f20,	%f0,	%f16
	fmovdg	%icc,	%f2,	%f20
	fbule,a	%fcc3,	loop_608
	bleu,pt	%xcc,	loop_609
	edge8ln	%i4,	%g7,	%g4
	membar	0x75
loop_608:
	movvs	%icc,	%o6,	%l6
loop_609:
	orncc	%i0,	0x10DE,	%o0
	fbu,a	%fcc0,	loop_610
	tsubcctv	%i6,	%g6,	%l0
	fbu,a	%fcc1,	loop_611
	be,pt	%xcc,	loop_612
loop_610:
	lduh	[%l7 + 0x66],	%l4
	fexpand	%f14,	%f24
loop_611:
	popc	%i7,	%l2
loop_612:
	pdist	%f26,	%f4,	%f20
	sllx	%i1,	%g2,	%g5
	movvc	%icc,	%o3,	%l5
	taddcc	%g1,	%l1,	%o5
	srl	%i5,	%o7,	%i2
	nop
	setx	0x09A5B858,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f5
	movg	%xcc,	%g3,	%o4
	subcc	%i3,	%o1,	%l3
	fbue	%fcc2,	loop_613
	tle	%xcc,	0x7
	fbl	%fcc0,	loop_614
	subccc	%i4,	0x1EC8,	%o2
loop_613:
	sdivx	%g4,	0x158D,	%o6
	tpos	%icc,	0x5
loop_614:
	xorcc	%l6,	0x18F7,	%g7
	swap	[%l7 + 0x3C],	%o0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x0c
	movleu	%xcc,	%i6,	%i0
	ldstub	[%l7 + 0x3B],	%l0
	orncc	%g6,	%l4,	%i7
	fpadd16s	%f16,	%f20,	%f2
	sub	%i1,	0x14FB,	%l2
	fba	%fcc0,	loop_615
	edge8ln	%g5,	%g2,	%l5
	fxor	%f28,	%f18,	%f16
	tvc	%icc,	0x6
loop_615:
	bcc,a	%xcc,	loop_616
	brlz	%g1,	loop_617
	andcc	%o3,	0x0B34,	%o5
	edge8l	%i5,	%o7,	%l1
loop_616:
	fmovrdgz	%i2,	%f14,	%f28
loop_617:
	fcmpeq16	%f16,	%f2,	%g3
	ble,a,pt	%xcc,	loop_618
	smul	%i3,	0x0FF2,	%o4
	addccc	%l3,	%i4,	%o1
	nop
	setx	0x7E205AA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xB6C68FC0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f28,	%f18
loop_618:
	array16	%o2,	%o6,	%g4
	bcs,pt	%xcc,	loop_619
	edge8l	%g7,	%l6,	%o0
	fandnot1	%f10,	%f18,	%f2
	movvs	%icc,	%i6,	%i0
loop_619:
	fmul8x16al	%f24,	%f2,	%f16
	te	%icc,	0x4
	bvs,a	loop_620
	brgz	%l0,	loop_621
	movcc	%xcc,	%l4,	%i7
	fbg,a	%fcc2,	loop_622
loop_620:
	tleu	%xcc,	0x3
loop_621:
	movcc	%xcc,	%i1,	%g6
	movn	%icc,	%l2,	%g2
loop_622:
	ldsw	[%l7 + 0x20],	%l5
	alignaddrl	%g5,	%o3,	%o5
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%i4
	xnor	%o7,	0x1688,	%g1
	sethi	0x1C09,	%l1
	sll	%g3,	0x08,	%i3
	fnegd	%f14,	%f2
	fmovsne	%icc,	%f2,	%f0
	tne	%xcc,	0x2
	fpadd32s	%f3,	%f15,	%f5
	edge16	%i2,	%o4,	%l3
	movrlez	%i4,	%o1,	%o2
	andcc	%g4,	%o6,	%g7
	std	%f14,	[%l7 + 0x58]
	tsubcctv	%l6,	%i6,	%i0
	movl	%xcc,	%o0,	%l0
	movrgez	%l4,	%i7,	%g6
	fones	%f5
	fmovdneg	%icc,	%f1,	%f8
	mulx	%i1,	0x0763,	%g2
	move	%xcc,	%l5,	%l2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	array8	%o5,	%i5,	%o7
	orn	%o3,	0x05F9,	%g1
	sir	0x1449
	fandnot1	%f22,	%f10,	%f10
	nop
	fitos	%f26,	%f7
	tvs	%icc,	0x5
	fblg	%fcc1,	loop_623
	addc	%g3,	0x1AD9,	%i3
	set	0x70, %l6
	stba	%i2,	[%l7 + %l6] 0x10
loop_623:
	fexpand	%f5,	%f4
	movne	%xcc,	%o4,	%l1
	subcc	%i4,	%o1,	%o2
	fbg,a	%fcc3,	loop_624
	edge8n	%l3,	%g4,	%g7
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x0F] %asi,	%l6
loop_624:
	fbuge,a	%fcc1,	loop_625
	edge32l	%o6,	%i6,	%i0
	sdivx	%l0,	0x09E0,	%l4
	nop
	setx	0xBFB84618FF026EF7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x2EE058A36E9A1D4D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f16,	%f24
loop_625:
	movneg	%xcc,	%i7,	%g6
	edge8ln	%i1,	%o0,	%l5
	movrne	%l2,	%g5,	%g2
	tsubcc	%o5,	0x1D31,	%i5
	bcc,pn	%icc,	loop_626
	movn	%icc,	%o3,	%g1
	movne	%xcc,	%o7,	%i3
	sdivx	%i2,	0x0D24,	%o4
loop_626:
	ba,pn	%xcc,	loop_627
	tne	%icc,	0x3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x74] %asi,	%f30
loop_627:
	fmovspos	%icc,	%f2,	%f5
	fba	%fcc0,	loop_628
	tn	%icc,	0x2
	fbug,a	%fcc2,	loop_629
	tcs	%xcc,	0x5
loop_628:
	umulcc	%g3,	0x1636,	%i4
	set	0x34, %g3
	sta	%f30,	[%l7 + %g3] 0x80
loop_629:
	bcs,pn	%icc,	loop_630
	movle	%icc,	%l1,	%o2
	swap	[%l7 + 0x6C],	%l3
	tvs	%icc,	0x1
loop_630:
	popc	%g4,	%o1
	fmovdne	%xcc,	%f29,	%f0
	nop
	fitod	%f6,	%f24
	fdtoi	%f24,	%f21
	nop
	setx	0xBE8E5090CCC2C0B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f24
	movne	%xcc,	%l6,	%o6
	bcc,a	loop_631
	addccc	%i6,	%i0,	%g7
	fmovsvc	%icc,	%f17,	%f29
	subccc	%l0,	0x116A,	%i7
loop_631:
	taddcctv	%g6,	%l4,	%o0
	fmovd	%f30,	%f14
	fmovsle	%xcc,	%f14,	%f28
	fpsub32	%f12,	%f6,	%f10
	fandnot1	%f8,	%f22,	%f20
	edge32n	%l5,	%l2,	%i1
	ldx	[%l7 + 0x38],	%g2
	fsrc1	%f26,	%f26
	edge16n	%g5,	%o5,	%i5
	srax	%o3,	%o7,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x1
	sdivcc	%i2,	0x1367,	%o4
	fcmpeq16	%f14,	%f0,	%i3
	bleu,a	%icc,	loop_632
	addccc	%g3,	%l1,	%o2
	stx	%l3,	[%l7 + 0x18]
	smulcc	%g4,	%i4,	%l6
loop_632:
	srlx	%o6,	%o1,	%i0
	move	%icc,	%g7,	%i6
	ld	[%l7 + 0x6C],	%f1
	swap	[%l7 + 0x44],	%i7
	fmuld8ulx16	%f2,	%f16,	%f28
	sir	0x06A0
	nop
	setx	loop_633,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f12,	%f4,	%f16
	movrne	%g6,	0x18D,	%l4
loop_633:
	umulcc	%l0,	%o0,	%l5
	edge32l	%i1,	%g2,	%g5
	pdist	%f0,	%f30,	%f8
	faligndata	%f30,	%f0,	%f24
	movrne	%l2,	0x369,	%o5
	brlz,a	%i5,	loop_634
	fmovdle	%icc,	%f4,	%f6
	taddcctv	%o7,	%g1,	%i2
	swap	[%l7 + 0x24],	%o3
loop_634:
	tcs	%icc,	0x0
	andcc	%o4,	%i3,	%g3
	movvs	%xcc,	%o2,	%l3
	tneg	%icc,	0x6
	orncc	%l1,	0x16C5,	%g4
	sethi	0x1E88,	%i4
	subc	%o6,	%o1,	%l6
	fpadd16	%f20,	%f14,	%f12
	array8	%g7,	%i0,	%i6
	fble	%fcc0,	loop_635
	array16	%i7,	%g6,	%l0
	sethi	0x04C7,	%o0
	movneg	%icc,	%l4,	%l5
loop_635:
	sdivx	%i1,	0x1929,	%g5
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f16
	xorcc	%g2,	%l2,	%i5
	edge32	%o5,	%o7,	%g1
	fors	%f19,	%f31,	%f29
	fmovrde	%i2,	%f2,	%f0
	alignaddrl	%o3,	%o4,	%g3
	nop
	setx	0x6D6547F858637919,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xF39F63C6432C0F0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f16,	%f2
	movneg	%icc,	%o2,	%i3
	add	%l1,	0x1FE4,	%g4
	sir	0x1F57
	fmovscc	%xcc,	%f16,	%f24
	array16	%i4,	%o6,	%l3
	fbg,a	%fcc0,	loop_636
	prefetch	[%l7 + 0x2C],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug	%fcc0,	loop_637
loop_636:
	fmovsle	%xcc,	%f27,	%f23
	tcc	%xcc,	0x1
	sub	%o1,	%g7,	%i0
loop_637:
	subcc	%i6,	0x15E3,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x11,	%i7,	%l0
	pdist	%f20,	%f2,	%f4
	fmovdne	%icc,	%f1,	%f30
	movge	%xcc,	%g6,	%l4
	fandnot1s	%f7,	%f21,	%f12
	orn	%o0,	%i1,	%l5
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f16
	movrne	%g5,	0x340,	%g2
	movrgz	%l2,	%i5,	%o7
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x11,	%f30
	alignaddr	%o5,	%i2,	%g1
	fmovdcc	%xcc,	%f12,	%f22
	tle	%xcc,	0x0
	te	%xcc,	0x0
	movrne	%o4,	%g3,	%o2
	edge8n	%i3,	%o3,	%g4
	movcs	%icc,	%l1,	%i4
	nop
	setx	0x0071E1F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	movn	%icc,	%l3,	%o6
	edge16n	%o1,	%g7,	%i6
	edge32	%l6,	%i7,	%l0
	edge8l	%i0,	%g6,	%l4
	fandnot1	%f10,	%f24,	%f22
	andn	%i1,	%l5,	%o0
	fmovdg	%icc,	%f17,	%f25
	movvs	%xcc,	%g5,	%g2
	flush	%l7 + 0x78
	and	%i5,	0x1F8B,	%l2
	add	%o5,	0x1AC3,	%o7
	movrne	%g1,	0x149,	%i2
	sra	%g3,	%o2,	%o4
	fbl	%fcc1,	loop_638
	te	%icc,	0x0
	brlz	%i3,	loop_639
	tge	%xcc,	0x7
loop_638:
	sll	%o3,	%g4,	%i4
	set	0x30, %i3
	stxa	%l3,	[%l7 + %i3] 0x10
loop_639:
	array16	%o6,	%o1,	%l1
	fblg,a	%fcc1,	loop_640
	bg,a	loop_641
	fand	%f24,	%f2,	%f14
	sllx	%i6,	0x1A,	%l6
loop_640:
	subccc	%i7,	%l0,	%g7
loop_641:
	xnor	%i0,	0x0A3A,	%l4
	fbul,a	%fcc3,	loop_642
	call	loop_643
	tneg	%icc,	0x0
	movcs	%xcc,	%g6,	%l5
loop_642:
	popc	%o0,	%i1
loop_643:
	fmovdgu	%icc,	%f26,	%f15
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x08] %asi,	%g5
	fbne	%fcc3,	loop_644
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x41],	%g2
	st	%f16,	[%l7 + 0x10]
loop_644:
	edge32	%l2,	%i5,	%o7
	fpadd16s	%f15,	%f11,	%f27
	edge16n	%o5,	%g1,	%g3
	udivx	%i2,	0x1D77,	%o2
	ldsh	[%l7 + 0x78],	%i3
	smul	%o4,	%o3,	%g4
	movcs	%xcc,	%i4,	%l3
	subc	%o6,	0x185F,	%o1
	udivx	%l1,	0x12B5,	%i6
	smulcc	%l6,	%i7,	%g7
	nop
	setx	0x14B212E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x977355BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f9,	%f4
	movneg	%icc,	%l0,	%l4
	fmovdl	%icc,	%f15,	%f12
	smul	%i0,	%l5,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i1,	0x0732,	%g6
	prefetch	[%l7 + 0x64],	 0x0
	bg,a,pt	%icc,	loop_645
	brlez	%g5,	loop_646
	sll	%g2,	0x0C,	%i5
	sir	0x1AFB
loop_645:
	movg	%icc,	%l2,	%o7
loop_646:
	movgu	%icc,	%o5,	%g1
	tneg	%xcc,	0x7
	edge32ln	%i2,	%o2,	%g3
	fxnor	%f30,	%f14,	%f4
	ldub	[%l7 + 0x44],	%o4
	movvs	%xcc,	%i3,	%g4
	tleu	%icc,	0x0
	nop
	setx	0x392D24EFA041693E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	array16	%o3,	%i4,	%l3
	stx	%o6,	[%l7 + 0x30]
	ld	[%l7 + 0x18],	%f12
	fcmpne16	%f18,	%f0,	%l1
	fmovrdlez	%o1,	%f28,	%f8
	sth	%l6,	[%l7 + 0x74]
	mulscc	%i6,	0x0B5F,	%i7
	edge32	%l0,	%l4,	%i0
	orncc	%l5,	0x1F66,	%o0
	ldd	[%l7 + 0x48],	%g6
	sir	0x1B92
	brgz	%g6,	loop_647
	and	%g5,	%g2,	%i5
	movrlz	%i1,	%o7,	%o5
	fands	%f28,	%f11,	%f0
loop_647:
	addccc	%g1,	0x0A23,	%l2
	nop
	setx	loop_648,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x007A9B33,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movl	%icc,	%o2,	%i2
	udivx	%o4,	0x1B11,	%i3
loop_648:
	ldd	[%l7 + 0x08],	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x6
	tgu	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x26] %asi,	%g4
	tsubcctv	%o3,	0x0EE3,	%l3
	addcc	%i4,	0x1938,	%l1
	membar	0x6A
	tleu	%icc,	0x4
	edge16	%o6,	%l6,	%i6
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f26
	fnor	%f14,	%f8,	%f28
	movre	%i7,	0x12F,	%l0
	bvs,a	%xcc,	loop_649
	alignaddrl	%l4,	%i0,	%o1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x04,	%o0,	%g7
loop_649:
	tvs	%xcc,	0x4
	smulcc	%g6,	0x14B4,	%l5
	and	%g5,	0x02AC,	%g2
	andn	%i5,	0x1768,	%o7
	fmovsle	%icc,	%f27,	%f11
	mova	%xcc,	%o5,	%i1
	ldstub	[%l7 + 0x20],	%g1
	nop
	setx	loop_650,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%xcc,	0x5
	xnor	%l2,	%o2,	%o4
	fmovdleu	%xcc,	%f23,	%f17
loop_650:
	fsrc2s	%f25,	%f6
	fpsub16	%f6,	%f22,	%f2
	movre	%i3,	0x13D,	%i2
	fbl,a	%fcc0,	loop_651
	nop
	setx	0x29D458C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x2992AB41,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f10,	%f11
	st	%f15,	[%l7 + 0x2C]
	tpos	%xcc,	0x2
loop_651:
	ba,a,pn	%icc,	loop_652
	xorcc	%g4,	%o3,	%g3
	edge32n	%l3,	%l1,	%i4
	nop
	setx	0x69461BAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xC1DCA8E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f23,	%f11
loop_652:
	flush	%l7 + 0x14
	movrlz	%l6,	%o6,	%i7
	fpadd16s	%f4,	%f4,	%f17
	fmovdn	%icc,	%f5,	%f2
	fbe,a	%fcc0,	loop_653
	sllx	%l0,	0x12,	%i6
	fpmerge	%f9,	%f20,	%f12
	fmul8sux16	%f0,	%f24,	%f20
loop_653:
	nop
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0x2
	movcc	%icc,	%o1,	%o0
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0x2
	subccc	%g7,	0x0472,	%l5
	st	%f29,	[%l7 + 0x48]
	edge16	%g5,	%g2,	%g6
	fcmpeq16	%f24,	%f2,	%o7
	array8	%o5,	%i5,	%i1
	xor	%l2,	0x1F7C,	%g1
	array8	%o2,	%o4,	%i2
	fmovsvs	%icc,	%f10,	%f3
	brgez,a	%g4,	loop_654
	subccc	%o3,	0x1765,	%i3
	umul	%g3,	0x1ACB,	%l1
	bgu	loop_655
loop_654:
	mulx	%l3,	0x0343,	%l6
	subccc	%o6,	0x05F8,	%i7
	and	%i4,	%i6,	%l0
loop_655:
	edge32	%o1,	%l4,	%i0
	bne	%xcc,	loop_656
	tge	%xcc,	0x1
	edge8n	%o0,	%g7,	%l5
	fmovdne	%icc,	%f13,	%f4
loop_656:
	edge32ln	%g2,	%g6,	%g5
	fbuge,a	%fcc1,	loop_657
	mulx	%o5,	%i5,	%i1
	edge16	%o7,	%l2,	%g1
	fmovsa	%xcc,	%f15,	%f14
loop_657:
	bvc,pn	%xcc,	loop_658
	swap	[%l7 + 0x18],	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x08] %asi,	%o4
loop_658:
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f28
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f30
	orn	%g4,	%i2,	%o3
	stb	%g3,	[%l7 + 0x2B]
	movn	%xcc,	%i3,	%l3
	fpadd32	%f4,	%f18,	%f22
	tl	%icc,	0x5
	sdivcc	%l6,	0x0BD7,	%l1
	smulcc	%o6,	0x1A95,	%i7
	set	0x5C, %o1
	ldswa	[%l7 + %o1] 0x80,	%i4
	xnorcc	%i6,	0x0DCD,	%l0
	movneg	%xcc,	%l4,	%o1
	nop
	setx	0x13B9270786DC5DF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x54F8577A7D1F29FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f30,	%f8
	wr	%g0,	0x89,	%asi
	stba	%o0,	[%l7 + 0x3E] %asi
	srl	%i0,	%g7,	%g2
	movl	%xcc,	%l5,	%g5
	bleu	%icc,	loop_659
	fbge,a	%fcc2,	loop_660
	ta	%xcc,	0x3
	fxors	%f31,	%f3,	%f21
loop_659:
	nop
	set	0x7B, %l1
	ldsb	[%l7 + %l1],	%o5
loop_660:
	fands	%f24,	%f10,	%f17
	tneg	%xcc,	0x0
	sdivcc	%i5,	0x10C7,	%i1
	smulcc	%g6,	0x0DC7,	%l2
	fnot1	%f22,	%f24
	tsubcctv	%o7,	%o2,	%o4
	fmovrsgez	%g4,	%f10,	%f16
	udivcc	%g1,	0x1B44,	%o3
	movrlez	%g3,	%i2,	%l3
	fmovsvs	%xcc,	%f10,	%f15
	edge16n	%l6,	%i3,	%l1
	mova	%icc,	%i7,	%o6
	srl	%i4,	0x05,	%i6
	sll	%l4,	%l0,	%o1
	fnot1	%f24,	%f10
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf1
	membar	#Sync
	xor	%o0,	%i0,	%g2
	movcs	%xcc,	%g7,	%g5
	ba,pn	%xcc,	loop_661
	edge32ln	%l5,	%o5,	%i5
	xorcc	%i1,	0x1D04,	%l2
	fmovdcc	%xcc,	%f22,	%f29
loop_661:
	nop
	set	0x67, %o7
	ldub	[%l7 + %o7],	%g6
	stx	%o2,	[%l7 + 0x68]
	andncc	%o7,	%o4,	%g1
	fnot2	%f28,	%f22
	movn	%icc,	%o3,	%g4
	std	%f22,	[%l7 + 0x38]
	edge8	%i2,	%l3,	%g3
	movre	%l6,	%l1,	%i3
	fmovsge	%xcc,	%f28,	%f12
	fbn	%fcc1,	loop_662
	movn	%icc,	%o6,	%i4
	te	%xcc,	0x1
	sdiv	%i6,	0x185B,	%l4
loop_662:
	udiv	%i7,	0x1903,	%l0
	edge32	%o0,	%o1,	%i0
	set	0x16, %g1
	lduba	[%l7 + %g1] 0x04,	%g7
	sll	%g2,	0x0E,	%g5
	fxnor	%f4,	%f2,	%f26
	movle	%xcc,	%o5,	%i5
	tleu	%xcc,	0x0
	brlz,a	%l5,	loop_663
	fmovs	%f24,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i1,	%g6,	%o2
loop_663:
	srl	%o7,	0x15,	%l2
	tneg	%xcc,	0x1
	movcc	%icc,	%g1,	%o3
	movrgz	%g4,	0x04A,	%i2
	fmovdge	%icc,	%f9,	%f24
	brgz	%o4,	loop_664
	sth	%l3,	[%l7 + 0x78]
	orncc	%l6,	%l1,	%i3
	fmovrdgez	%o6,	%f22,	%f6
loop_664:
	fmovrdgz	%g3,	%f24,	%f14
	ldsb	[%l7 + 0x24],	%i6
	tl	%icc,	0x2
	alignaddrl	%i4,	%l4,	%l0
	taddcc	%i7,	0x0718,	%o0
	nop
	setx	0xA077DB64,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	xorcc	%i0,	%o1,	%g7
	fbo	%fcc0,	loop_665
	fornot1s	%f28,	%f13,	%f0
	movrgez	%g2,	%g5,	%o5
	tcs	%icc,	0x5
loop_665:
	andn	%i5,	%l5,	%i1
	tleu	%icc,	0x7
	ta	%icc,	0x5
	stx	%o2,	[%l7 + 0x48]
	tcs	%xcc,	0x5
	fands	%f3,	%f3,	%f26
	edge32	%g6,	%l2,	%g1
	sra	%o7,	0x13,	%o3
	brlez,a	%i2,	loop_666
	addccc	%g4,	0x1656,	%l3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%o4
loop_666:
	ldx	[%l7 + 0x38],	%l1
	movleu	%xcc,	%i3,	%l6
	taddcctv	%g3,	0x0315,	%i6
	sdivx	%o6,	0x1CB5,	%i4
	udivx	%l0,	0x1999,	%i7
	bvc,pt	%xcc,	loop_667
	ble	loop_668
	stb	%o0,	[%l7 + 0x4A]
	movrgez	%l4,	%i0,	%o1
loop_667:
	nop
	fitos	%f11,	%f1
	fstox	%f1,	%f28
loop_668:
	fmovse	%xcc,	%f25,	%f27
	fxor	%f12,	%f24,	%f24
	sdivcc	%g7,	0x102E,	%g5
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f28
	fxtod	%f28,	%f26
	alignaddrl	%o5,	%g2,	%i5
	edge16l	%l5,	%o2,	%g6
	tcc	%icc,	0x7
	movrgez	%l2,	0x266,	%i1
	xorcc	%o7,	%g1,	%i2
	stw	%o3,	[%l7 + 0x7C]
	subc	%l3,	0x1D93,	%g4
	bgu,pt	%icc,	loop_669
	nop
	set	0x48, %i5
	stx	%l1,	[%l7 + %i5]
	bvs,pt	%xcc,	loop_670
	ta	%icc,	0x7
loop_669:
	nop
	setx	0xBC51AC9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f21
	addc	%o4,	0x1045,	%i3
loop_670:
	tsubcc	%l6,	%i6,	%g3
	movleu	%xcc,	%i4,	%o6
	xnor	%l0,	0x17F6,	%o0
	mova	%xcc,	%i7,	%l4
	orcc	%o1,	%i0,	%g7
	nop
	setx	0x269E7D9A58DCCCDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f16
	edge8n	%g5,	%g2,	%i5
	nop
	setx	0x97958294,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x60880348,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f29,	%f22
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%o5
	flush	%l7 + 0x68
	tg	%xcc,	0x4
	edge8ln	%l5,	%o2,	%l2
	movle	%icc,	%i1,	%g6
	nop
	setx	0xB057CFCB,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fmovsn	%icc,	%f25,	%f22
	for	%f24,	%f26,	%f10
	orcc	%g1,	%o7,	%o3
	set	0x24, %i7
	sta	%f5,	[%l7 + %i7] 0x80
	bn	loop_671
	fsrc1s	%f28,	%f6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l3,	%g4
loop_671:
	fnors	%f8,	%f15,	%f6
	movvs	%icc,	%i2,	%o4
	movvs	%icc,	%l1,	%i3
	bl	%icc,	loop_672
	bn,a,pt	%xcc,	loop_673
	bgu,a,pt	%icc,	loop_674
	sra	%l6,	0x16,	%g3
loop_672:
	movn	%icc,	%i4,	%o6
loop_673:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f19,	[%l7 + 0x60] %asi
loop_674:
	srlx	%l0,	%i6,	%i7
	sll	%l4,	%o0,	%o1
	bg,pn	%icc,	loop_675
	te	%xcc,	0x4
	fbn,a	%fcc1,	loop_676
	brlez,a	%g7,	loop_677
loop_675:
	fmovrdgz	%g5,	%f24,	%f12
	fnegd	%f14,	%f2
loop_676:
	sth	%i0,	[%l7 + 0x50]
loop_677:
	popc	%i5,	%o5
	nop
	setx	loop_678,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdneg	%xcc,	%f8,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc0,	loop_679
loop_678:
	tneg	%xcc,	0x2
	movpos	%icc,	%g2,	%l5
	movgu	%xcc,	%o2,	%i1
loop_679:
	fand	%f6,	%f22,	%f28
	lduw	[%l7 + 0x64],	%l2
	fxor	%f4,	%f16,	%f30
	tcs	%xcc,	0x7
	tsubcc	%g6,	0x0242,	%g1
	brgz	%o3,	loop_680
	fmovdneg	%xcc,	%f20,	%f23
	movge	%xcc,	%l3,	%o7
	sir	0x18F2
loop_680:
	movrgz	%i2,	%o4,	%g4
	tvs	%icc,	0x2
	fnands	%f14,	%f6,	%f12
	fbul,a	%fcc1,	loop_681
	te	%icc,	0x4
	xorcc	%l1,	0x11DC,	%l6
	fbne	%fcc1,	loop_682
loop_681:
	movrgez	%g3,	%i3,	%o6
	or	%i4,	%l0,	%i7
	array8	%i6,	%l4,	%o1
loop_682:
	fpadd16s	%f17,	%f13,	%f31
	smulcc	%g7,	0x072B,	%o0
	edge32l	%i0,	%i5,	%g5
	std	%f4,	[%l7 + 0x40]
	fbne	%fcc3,	loop_683
	movl	%icc,	%o5,	%g2
	te	%xcc,	0x7
	orcc	%o2,	0x082D,	%l5
loop_683:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x5C] %asi,	%i1
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f16
	fxtod	%f16,	%f24
	movre	%g6,	%l2,	%g1
	edge16	%l3,	%o7,	%i2
	sth	%o3,	[%l7 + 0x70]
	fornot2	%f24,	%f12,	%f26
	fmovrse	%g4,	%f23,	%f14
	fabsd	%f26,	%f4
	sir	0x036C
	edge32l	%l1,	%o4,	%g3
	pdist	%f8,	%f16,	%f4
	movrlez	%i3,	0x360,	%o6
	tleu	%icc,	0x3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%l6
	fcmpeq16	%f4,	%f22,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f9,	%f22,	%f19
	fmovdgu	%icc,	%f10,	%f5
	fbe	%fcc1,	loop_684
	tsubcc	%i7,	0x111A,	%i6
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f5
	xnorcc	%l4,	0x19F6,	%g7
loop_684:
	orncc	%o0,	0x023D,	%i0
	add	%i5,	%g5,	%o5
	fbn	%fcc0,	loop_685
	stx	%g2,	[%l7 + 0x50]
	fpadd32s	%f13,	%f23,	%f1
	movpos	%icc,	%o1,	%l5
loop_685:
	movl	%xcc,	%o2,	%g6
	wr	%g0,	0x0c,	%asi
	stwa	%i1,	[%l7 + 0x38] %asi
	wr	%g0,	0x22,	%asi
	stxa	%l2,	[%l7 + 0x78] %asi
	membar	#Sync
	bvs	loop_686
	nop
	setx	0xE9A7804FFF5A9C98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f30
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x34] %asi,	%l3
loop_686:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%g1
	movrlez	%o7,	%o3,	%g4
	membar	0x37
	movcs	%icc,	%i2,	%o4
	nop
	fitos	%f11,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f22
	mulx	%g3,	%l1,	%i3
	nop
	fitos	%f10,	%f23
	fstox	%f23,	%f14
	array32	%i4,	%l6,	%l0
	subccc	%i7,	%o6,	%l4
	ta	%xcc,	0x7
	edge16l	%g7,	%o0,	%i6
	brlez,a	%i0,	loop_687
	tpos	%xcc,	0x6
	edge32	%g5,	%o5,	%g2
	srl	%i5,	%l5,	%o2
loop_687:
	addcc	%o1,	0x0F52,	%g6
	tne	%icc,	0x7
	udivcc	%l2,	0x1C2D,	%i1
	stbar
	fpadd32	%f8,	%f24,	%f24
	sdivcc	%g1,	0x1F61,	%o7
	andn	%o3,	0x0DAB,	%l3
	orn	%i2,	0x161C,	%g4
	membar	0x3C
	fbl	%fcc2,	loop_688
	fnors	%f6,	%f3,	%f24
	movcc	%xcc,	%o4,	%g3
	fmovd	%f26,	%f22
loop_688:
	fmovsleu	%xcc,	%f19,	%f26
	subc	%i3,	%i4,	%l1
	sll	%l0,	0x0F,	%l6
	bge,pt	%icc,	loop_689
	xnorcc	%i7,	%l4,	%g7
	ble,pt	%icc,	loop_690
	movrlz	%o6,	0x361,	%o0
loop_689:
	edge8l	%i0,	%i6,	%g5
	tg	%icc,	0x7
loop_690:
	addccc	%g2,	0x1BD2,	%o5
	array16	%i5,	%o2,	%l5
	movrlz	%g6,	%l2,	%i1
	array32	%g1,	%o7,	%o3
	fbo	%fcc1,	loop_691
	fcmple16	%f16,	%f14,	%o1
	or	%i2,	%l3,	%g4
	sth	%o4,	[%l7 + 0x7E]
loop_691:
	tvs	%xcc,	0x4
	membar	0x64
	brgz	%g3,	loop_692
	edge16	%i4,	%i3,	%l1
	orn	%l6,	%l0,	%i7
	fmovrdlez	%g7,	%f24,	%f16
loop_692:
	fmovrde	%o6,	%f4,	%f12
	xorcc	%l4,	0x0FD7,	%o0
	movle	%icc,	%i6,	%g5
	addc	%g2,	%i0,	%i5
	add	%o5,	%l5,	%g6
	movg	%icc,	%o2,	%i1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l2,	%g1
	nop
	fitos	%f8,	%f31
	fstod	%f31,	%f2
	ldstub	[%l7 + 0x19],	%o7
	mulx	%o3,	0x0A41,	%o1
	fcmpne32	%f18,	%f10,	%i2
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x81,	%l3
	nop
	setx	loop_693,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%o4,	0x02FB,	%g4
	sra	%g3,	%i4,	%i3
	fmovdvc	%icc,	%f26,	%f30
loop_693:
	bvs,a,pt	%icc,	loop_694
	fsrc1s	%f8,	%f21
	sdivx	%l6,	0x1B33,	%l0
	sdivx	%l1,	0x1A0C,	%g7
loop_694:
	andncc	%o6,	%l4,	%o0
	edge8ln	%i7,	%i6,	%g5
	bcs,a,pn	%icc,	loop_695
	addcc	%g2,	%i0,	%i5
	tneg	%xcc,	0x5
	tsubcctv	%o5,	0x1136,	%g6
loop_695:
	nop
	set	0x44, %g5
	stw	%l5,	[%l7 + %g5]
	nop
	setx loop_696, %l0, %l1
	jmpl %l1, %o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x60],	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_696:
	edge32ln	%g1,	%i1,	%o7
	edge8l	%o1,	%i2,	%l3
	fnot1	%f8,	%f10
	ldstub	[%l7 + 0x59],	%o3
	swap	[%l7 + 0x68],	%o4
	tne	%icc,	0x4
	edge8ln	%g3,	%g4,	%i4
	subccc	%i3,	0x0B0F,	%l0
	set	0x2C, %o6
	stwa	%l6,	[%l7 + %o6] 0x22
	membar	#Sync
	movpos	%icc,	%l1,	%g7
	movcs	%icc,	%o6,	%o0
	ldstub	[%l7 + 0x1D],	%i7
	lduw	[%l7 + 0x24],	%l4
	brlez	%g5,	loop_697
	srax	%g2,	%i6,	%i0
	nop
	setx	0x13736047,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x318BFFBD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f29,	%f0
	array8	%o5,	%g6,	%l5
loop_697:
	movge	%icc,	%i5,	%o2
	orn	%g1,	%i1,	%o7
	subccc	%o1,	0x12F1,	%i2
	fmovdne	%icc,	%f23,	%f22
	brlz,a	%l3,	loop_698
	tle	%xcc,	0x1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%o4
loop_698:
	ldsh	[%l7 + 0x42],	%g3
	array32	%l2,	%i4,	%g4
	movn	%xcc,	%i3,	%l0
	tsubcc	%l1,	%l6,	%g7
	nop
	setx	loop_699,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x40],	%o0
	edge16l	%i7,	%o6,	%g5
	tneg	%xcc,	0x1
loop_699:
	sllx	%g2,	%i6,	%l4
	fcmple16	%f2,	%f28,	%o5
	bpos,a,pn	%xcc,	loop_700
	subccc	%i0,	%l5,	%i5
	bgu,pt	%xcc,	loop_701
	addc	%g6,	%g1,	%i1
loop_700:
	udivcc	%o7,	0x1E23,	%o1
	fmovrslez	%i2,	%f11,	%f4
loop_701:
	edge16l	%l3,	%o2,	%o3
	umulcc	%g3,	0x0233,	%l2
	stb	%i4,	[%l7 + 0x27]
	fbul,a	%fcc2,	loop_702
	flush	%l7 + 0x2C
	sub	%o4,	%g4,	%l0
	edge32n	%i3,	%l6,	%l1
loop_702:
	mova	%xcc,	%o0,	%g7
	sra	%i7,	0x13,	%o6
	sll	%g2,	0x1E,	%i6
	tn	%xcc,	0x0
	sub	%l4,	%o5,	%g5
	set	0x108, %o3
	stxa	%l5,	[%g0 + %o3] 0x52
	edge32	%i0,	%i5,	%g6
	srax	%g1,	0x01,	%o7
	tvs	%icc,	0x7
	movre	%i1,	0x1B7,	%o1
	nop
	fitos	%f7,	%f15
	fstoi	%f15,	%f24
	subccc	%l3,	%i2,	%o2
	fbo	%fcc2,	loop_703
	fmovdvc	%xcc,	%f27,	%f16
	movpos	%xcc,	%g3,	%l2
	addc	%i4,	0x1C83,	%o3
loop_703:
	ldsw	[%l7 + 0x74],	%g4
	srl	%o4,	0x11,	%i3
	prefetch	[%l7 + 0x50],	 0x2
	edge32	%l0,	%l1,	%o0
	bshuffle	%f16,	%f28,	%f26
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x63] %asi,	%l6
	movneg	%xcc,	%g7,	%i7
	movvs	%icc,	%o6,	%i6
	bn,a,pt	%icc,	loop_704
	umulcc	%l4,	%g2,	%o5
	movneg	%xcc,	%l5,	%g5
	fbg,a	%fcc2,	loop_705
loop_704:
	smul	%i0,	%i5,	%g1
	fbn,a	%fcc0,	loop_706
	bge,pt	%xcc,	loop_707
loop_705:
	nop
	fitos	%f7,	%f24
	movge	%icc,	%o7,	%g6
loop_706:
	sth	%i1,	[%l7 + 0x78]
loop_707:
	tvc	%xcc,	0x4
	pdist	%f14,	%f8,	%f12
	movne	%icc,	%l3,	%o1
	movcs	%xcc,	%o2,	%g3
	set	0x2C, %i2
	lduba	[%l7 + %i2] 0x15,	%l2
	for	%f4,	%f30,	%f10
	fmovsvs	%icc,	%f0,	%f31
	or	%i2,	0x0187,	%o3
	set	0x30, %g6
	stwa	%g4,	[%l7 + %g6] 0x14
	array32	%o4,	%i4,	%i3
	smulcc	%l0,	%o0,	%l6
	fbo	%fcc3,	loop_708
	movne	%icc,	%l1,	%i7
	andcc	%o6,	0x1A1F,	%i6
	udiv	%g7,	0x12D5,	%l4
loop_708:
	alignaddrl	%g2,	%l5,	%o5
	andn	%i0,	%i5,	%g1
	bg	%xcc,	loop_709
	sethi	0x0C15,	%g5
	orn	%g6,	%i1,	%l3
	srax	%o7,	0x1F,	%o2
loop_709:
	movne	%xcc,	%g3,	%l2
	xorcc	%i2,	0x1DEB,	%o3
	fcmpeq32	%f0,	%f18,	%o1
	edge8	%o4,	%i4,	%i3
	edge32ln	%l0,	%o0,	%g4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i7
	fbu,a	%fcc3,	loop_710
	fmovsl	%xcc,	%f9,	%f14
	fnegs	%f26,	%f2
	array32	%o6,	%i6,	%g7
loop_710:
	umulcc	%l6,	0x1204,	%g2
	andcc	%l4,	0x1735,	%o5
	movrlez	%i0,	%i5,	%l5
	brlez	%g5,	loop_711
	bcc	loop_712
	fornot2s	%f0,	%f9,	%f8
	srlx	%g6,	%g1,	%l3
loop_711:
	nop
	fitod	%f4,	%f18
loop_712:
	udivcc	%o7,	0x0E34,	%i1
	brlz,a	%g3,	loop_713
	movn	%xcc,	%l2,	%i2
	popc	0x0942,	%o3
	alignaddrl	%o1,	%o2,	%i4
loop_713:
	fmovdleu	%icc,	%f17,	%f18
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i3
	umulcc	%o0,	0x0ABB,	%l0
	tsubcc	%l1,	%i7,	%g4
	taddcctv	%o6,	0x05D8,	%g7
	addccc	%l6,	%i6,	%g2
	wr	%g0,	0x88,	%asi
	stba	%o5,	[%l7 + 0x5B] %asi
	fands	%f11,	%f18,	%f10
	fmovdn	%xcc,	%f27,	%f27
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i5
	andncc	%l5,	%i0,	%g6
	set	0x70, %g7
	ldswa	[%l7 + %g7] 0x88,	%g1
	bgu	%icc,	loop_714
	movcc	%xcc,	%g5,	%o7
	addccc	%i1,	0x11AA,	%g3
	nop
	setx	0xAF91B041,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x12EE5540,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f12,	%f0
loop_714:
	fmovrslz	%l3,	%f22,	%f30
	movre	%i2,	0x286,	%o3
	edge16l	%l2,	%o1,	%i4
	ldub	[%l7 + 0x6B],	%o2
	move	%icc,	%i3,	%o0
	tg	%icc,	0x4
	sdivx	%l0,	0x1A24,	%l1
	fcmple16	%f14,	%f24,	%o4
	swap	[%l7 + 0x78],	%g4
	movneg	%xcc,	%i7,	%g7
	fzeros	%f19
	nop
	setx	0x2049F6E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	bl,a,pn	%xcc,	loop_715
	xor	%l6,	0x028A,	%o6
	movn	%icc,	%i6,	%g2
	tvs	%xcc,	0x3
loop_715:
	bcs,a	%xcc,	loop_716
	ldstub	[%l7 + 0x25],	%l4
	movgu	%icc,	%i5,	%l5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
loop_716:
	tn	%icc,	0x2
	ta	%xcc,	0x7
	srl	%i0,	%g1,	%g6
	udiv	%g5,	0x0CB2,	%o7
	mulscc	%g3,	%l3,	%i1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	fbne,a	%fcc3,	loop_717
	fmul8sux16	%f12,	%f22,	%f14
	call	loop_718
	tge	%icc,	0x0
loop_717:
	fsrc1	%f22,	%f18
	orcc	%l2,	%o3,	%o1
loop_718:
	for	%f8,	%f16,	%f26
	sdivcc	%i4,	0x17F5,	%o2
	brgez,a	%o0,	loop_719
	tvc	%xcc,	0x6
	or	%l0,	%i3,	%o4
	fmovdvs	%icc,	%f22,	%f31
loop_719:
	edge16n	%g4,	%l1,	%g7
	fcmpeq16	%f12,	%f18,	%l6
	tgu	%xcc,	0x4
	bpos	%xcc,	loop_720
	fxors	%f8,	%f31,	%f30
	bvs,pt	%icc,	loop_721
	tge	%icc,	0x2
loop_720:
	bl,a,pn	%xcc,	loop_722
	std	%f16,	[%l7 + 0x28]
loop_721:
	bcs,a,pt	%icc,	loop_723
	tcs	%icc,	0x5
loop_722:
	edge8	%o6,	%i6,	%i7
	fbule,a	%fcc1,	loop_724
loop_723:
	tgu	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f22,	%f8
loop_724:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x34] %asi,	%l4
	bpos,pn	%xcc,	loop_725
	alignaddr	%i5,	%g2,	%o5
	xnorcc	%l5,	%i0,	%g1
	movrgez	%g6,	0x0A3,	%o7
loop_725:
	fabss	%f21,	%f28
	smul	%g3,	%g5,	%i1
	udiv	%i2,	0x130E,	%l2
	fmovsn	%xcc,	%f23,	%f31
	edge32l	%l3,	%o3,	%i4
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x24] %asi
	nop
	fitos	%f8,	%f31
	ba	loop_726
	alignaddrl	%o1,	%o0,	%l0
	tcs	%xcc,	0x3
	array16	%i3,	%o2,	%g4
loop_726:
	andcc	%o4,	0x02A8,	%l1
	nop
	setx loop_727, %l0, %l1
	jmpl %l1, %l6
	te	%icc,	0x0
	tleu	%xcc,	0x5
	sir	0x1C4D
loop_727:
	movl	%icc,	%g7,	%i6
	sdivx	%i7,	0x0E94,	%l4
	fxor	%f14,	%f6,	%f12
	std	%f26,	[%l7 + 0x40]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%g2
	movrne	%o6,	0x13D,	%l5
	tsubcctv	%o5,	%g1,	%i0
	ta	%xcc,	0x0
	orcc	%g6,	0x0F7D,	%o7
	brlez,a	%g5,	loop_728
	tpos	%xcc,	0x2
	mova	%icc,	%g3,	%i2
	movpos	%icc,	%l2,	%i1
loop_728:
	bpos	%icc,	loop_729
	brlez	%o3,	loop_730
	st	%f19,	[%l7 + 0x0C]
	orn	%i4,	%l3,	%o1
loop_729:
	xor	%l0,	0x0A34,	%o0
loop_730:
	srlx	%i3,	%g4,	%o2
	edge32	%o4,	%l6,	%l1
	edge8l	%g7,	%i7,	%l4
	andcc	%i6,	%i5,	%o6
	array32	%l5,	%o5,	%g1
	fabsd	%f18,	%f18
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%i0
	srlx	%g6,	0x1A,	%g5
	udivx	%o7,	0x1A27,	%g3
	edge32	%i2,	%l2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x20],	%f7
	bne	loop_731
	fnot1	%f22,	%f26
	addccc	%i4,	%i1,	%l3
	bge,a	loop_732
loop_731:
	te	%icc,	0x0
	fmovsvs	%icc,	%f5,	%f27
	movg	%xcc,	%l0,	%o0
loop_732:
	fmovrsgz	%o1,	%f10,	%f21
	tvc	%xcc,	0x7
	bvc,pt	%xcc,	loop_733
	edge32n	%g4,	%i3,	%o2
	tvs	%xcc,	0x5
	movgu	%icc,	%o4,	%l6
loop_733:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l1,	%g7,	%l4
	xnorcc	%i6,	%i5,	%o6
	bge	%icc,	loop_734
	movleu	%xcc,	%i7,	%l5
	fblg	%fcc1,	loop_735
	nop
	set	0x2A, %o4
	ldsh	[%l7 + %o4],	%o5
loop_734:
	fbn	%fcc1,	loop_736
	edge32ln	%g2,	%i0,	%g1
loop_735:
	srlx	%g6,	%g5,	%g3
	fxnors	%f28,	%f31,	%f10
loop_736:
	fpadd16	%f8,	%f28,	%f16
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f4
	fmovse	%icc,	%f23,	%f28
	orcc	%o7,	%l2,	%i2
	fand	%f20,	%f2,	%f20
	for	%f28,	%f4,	%f2
	movge	%icc,	%i4,	%i1
	fmovsvc	%xcc,	%f1,	%f17
	srl	%l3,	%o3,	%l0
	fzeros	%f0
	srlx	%o1,	%g4,	%o0
	fxor	%f6,	%f24,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x04,	 0x0
	set	0x30, %l5
	ldswa	[%l7 + %l5] 0x19,	%o4
	tle	%xcc,	0x0
	edge32	%l6,	%i3,	%l1
	fxor	%f14,	%f26,	%f6
	fmovsle	%icc,	%f16,	%f13
	edge16n	%g7,	%l4,	%i6
	fmovrse	%i5,	%f10,	%f24
	edge8l	%i7,	%o6,	%o5
	bcc,a,pn	%xcc,	loop_737
	fandnot1	%f30,	%f6,	%f12
	tne	%xcc,	0x7
	movrlz	%l5,	0x00A,	%i0
loop_737:
	movcc	%icc,	%g1,	%g2
	fnegd	%f18,	%f20
	sth	%g5,	[%l7 + 0x36]
	tpos	%xcc,	0x5
	xnor	%g3,	0x1AE7,	%g6
	popc	0x092F,	%o7
	edge32l	%i2,	%i4,	%l2
	ldstub	[%l7 + 0x31],	%l3
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf0
	membar	#Sync
	xnor	%i1,	0x02D5,	%o3
	edge32ln	%o1,	%l0,	%o0
	fbuge,a	%fcc3,	loop_738
	nop
	fitos	%f1,	%f6
	fnot2s	%f16,	%f27
	fmovdge	%xcc,	%f23,	%f5
loop_738:
	movneg	%icc,	%g4,	%o4
	nop
	setx	loop_739,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pn	%xcc,	loop_740
	sll	%o2,	0x1D,	%i3
loop_739:
	ldd	[%l7 + 0x38],	%l0
	array32	%l6,	%l4,	%g7
loop_740:
	movge	%icc,	%i5,	%i7
	tvc	%xcc,	0x6
	add	%o6,	%o5,	%i6
	fmovdcs	%xcc,	%f31,	%f31
	st	%f1,	[%l7 + 0x30]
	fmovdgu	%xcc,	%f25,	%f20
	and	%i0,	%l5,	%g2
	nop
	setx loop_741, %l0, %l1
	jmpl %l1, %g5
	movgu	%icc,	%g1,	%g6
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
	xnorcc	%o7,	0x0E86,	%i2
loop_741:
	nop
	setx	0xCDD07C53,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xED31A32C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f13,	%f16
	movvs	%xcc,	%i4,	%g3
loop_742:
	brnz	%l2,	loop_743
	mova	%xcc,	%i1,	%l3
	fmul8x16	%f4,	%f16,	%f30
	fnot1	%f18,	%f16
loop_743:
	edge32l	%o1,	%l0,	%o0
	addc	%o3,	%o4,	%g4
	edge16n	%o2,	%l1,	%l6
	smulcc	%l4,	0x1A81,	%g7
	fandnot1s	%f25,	%f7,	%f31
	nop
	setx	0xA96F4E7E99D01CFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xD2D90F5D1D17B45B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f14,	%f8
	fmul8ulx16	%f22,	%f20,	%f10
	movcs	%icc,	%i3,	%i7
	set	0x22, %l2
	lduha	[%l7 + %l2] 0x04,	%i5
	fbl	%fcc3,	loop_744
	edge16	%o6,	%o5,	%i0
	bvs,a	loop_745
	movvc	%xcc,	%l5,	%g2
loop_744:
	tpos	%xcc,	0x0
	udivcc	%g5,	0x08C6,	%i6
loop_745:
	lduw	[%l7 + 0x5C],	%g1
	fmovrdlez	%g6,	%f18,	%f20
	movre	%o7,	0x26A,	%i4
	udivx	%i2,	0x0137,	%l2
	sdiv	%i1,	0x0A25,	%g3
	sllx	%o1,	0x0B,	%l3
	fbn,a	%fcc2,	loop_746
	addc	%l0,	0x0179,	%o0
	be,a,pn	%xcc,	loop_747
	tl	%xcc,	0x5
loop_746:
	movrlz	%o3,	%o4,	%g4
	srl	%l1,	%o2,	%l6
loop_747:
	movrlz	%g7,	%l4,	%i7
	bge,a,pt	%xcc,	loop_748
	bge,a	%xcc,	loop_749
	tpos	%icc,	0x1
	fmovsneg	%icc,	%f6,	%f18
loop_748:
	xnorcc	%i5,	%i3,	%o6
loop_749:
	tle	%xcc,	0x2
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i0
	movne	%xcc,	%l5,	%o5
	fmovsa	%xcc,	%f16,	%f10
	tcs	%xcc,	0x7
	sethi	0x09D5,	%g5
	nop
	setx	0xD5AF3D9F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f30
	bvs,a,pn	%icc,	loop_750
	move	%icc,	%g2,	%g1
	sth	%i6,	[%l7 + 0x5E]
	fandnot1s	%f10,	%f20,	%f23
loop_750:
	fpsub32	%f6,	%f12,	%f4
	array32	%g6,	%i4,	%o7
	addccc	%l2,	%i1,	%g3
	nop
	setx	0xA1BCE5DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xF4977924,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f5,	%f8
	tg	%icc,	0x0
	subcc	%o1,	0x18E6,	%i2
	stbar
	stb	%l0,	[%l7 + 0x4B]
	edge8ln	%o0,	%o3,	%o4
	movrne	%g4,	0x09D,	%l1
	movrgez	%o2,	0x33E,	%l3
	umulcc	%l6,	0x1104,	%l4
	smulcc	%g7,	0x0722,	%i7
	tneg	%icc,	0x5
	bg,a	loop_751
	fmovrdne	%i3,	%f8,	%f8
	stx	%i5,	[%l7 + 0x40]
	movcc	%xcc,	%i0,	%o6
loop_751:
	movrgez	%o5,	0x1CE,	%g5
	fmovde	%icc,	%f4,	%f18
	movrne	%l5,	%g1,	%g2
	fnor	%f14,	%f20,	%f26
	movleu	%icc,	%g6,	%i4
	fnegs	%f17,	%f4
	alignaddrl	%o7,	%l2,	%i6
	fmul8ulx16	%f0,	%f20,	%f18
	udivx	%i1,	0x028C,	%g3
	udivcc	%o1,	0x0C06,	%i2
	fpackfix	%f18,	%f28
	sth	%l0,	[%l7 + 0x0C]
	sra	%o0,	0x16,	%o3
	movrlez	%o4,	0x110,	%g4
	addc	%l1,	0x11CD,	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%l6
	tsubcctv	%g7,	0x1ED1,	%i7
	stx	%l4,	[%l7 + 0x70]
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f11
	movrlez	%i3,	0x046,	%i0
	brlez,a	%i5,	loop_752
	edge32	%o5,	%g5,	%o6
	fpsub32	%f20,	%f20,	%f8
	sllx	%l5,	%g1,	%g6
loop_752:
	movre	%i4,	0x128,	%o7
	stw	%l2,	[%l7 + 0x68]
	alignaddrl	%g2,	%i6,	%g3
	set	0x28, %l3
	swapa	[%l7 + %l3] 0x81,	%o1
	nop
	fitos	%f9,	%f15
	fstox	%f15,	%f12
	fxtos	%f12,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i1,	0x0B2E,	%l0
	tg	%icc,	0x1
	stb	%o0,	[%l7 + 0x31]
	popc	%o3,	%o4
	tvs	%icc,	0x6
	mulscc	%i2,	%g4,	%o2
	alignaddr	%l3,	%l6,	%g7
	ble	%xcc,	loop_753
	umul	%i7,	0x0DFE,	%l1
	movpos	%icc,	%i3,	%l4
	movge	%icc,	%i0,	%i5
loop_753:
	fmovdcc	%icc,	%f1,	%f22
	nop
	set	0x10, %i6
	sth	%o5,	[%l7 + %i6]
	fsrc2	%f8,	%f12
	ta	%icc,	0x3
	edge8l	%o6,	%g5,	%l5
	fmovdcs	%icc,	%f17,	%f19
	movn	%icc,	%g6,	%i4
	brgz	%g1,	loop_754
	stb	%l2,	[%l7 + 0x58]
	fmovdgu	%xcc,	%f31,	%f13
	fpsub16s	%f21,	%f30,	%f24
loop_754:
	edge32	%o7,	%i6,	%g3
	fxor	%f8,	%f10,	%f10
	stw	%g2,	[%l7 + 0x3C]
	udiv	%i1,	0x17AC,	%l0
	movle	%icc,	%o0,	%o3
	fcmpeq16	%f30,	%f8,	%o4
	nop
	setx	0x4AA25C9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x4FE943B6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f11,	%f0
	brnz	%i2,	loop_755
	add	%g4,	%o1,	%l3
	fors	%f29,	%f31,	%f6
	stbar
loop_755:
	fmul8x16au	%f8,	%f27,	%f12
	move	%xcc,	%o2,	%l6
	ldx	[%l7 + 0x28],	%i7
	sub	%g7,	%l1,	%i3
	te	%icc,	0x5
	te	%xcc,	0x4
	movvs	%xcc,	%l4,	%i5
	nop
	setx	loop_756,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16al	%f8,	%f11,	%f20
	movre	%o5,	%i0,	%g5
	fmovsvs	%xcc,	%f31,	%f20
loop_756:
	fabss	%f1,	%f14
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x44] %asi,	%l5
	fnegs	%f9,	%f18
	movpos	%xcc,	%g6,	%i4
	edge32n	%g1,	%o6,	%l2
	wr	%g0,	0x2f,	%asi
	stwa	%o7,	[%l7 + 0x30] %asi
	membar	#Sync
	addccc	%g3,	0x0D07,	%g2
	membar	0x57
	fpmerge	%f8,	%f21,	%f24
	fmovdn	%xcc,	%f7,	%f19
	bgu,a,pn	%icc,	loop_757
	fbo	%fcc1,	loop_758
	taddcctv	%i6,	0x1767,	%i1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x42] %asi,	%o0
loop_757:
	taddcc	%o3,	%o4,	%i2
loop_758:
	fmovsvs	%xcc,	%f5,	%f5
	tpos	%icc,	0x2
	fbn,a	%fcc3,	loop_759
	edge16	%l0,	%o1,	%l3
	fpsub16	%f22,	%f2,	%f0
	xor	%g4,	0x09A1,	%o2
loop_759:
	fmovs	%f23,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l6,	%i7,	%g7
	fble,a	%fcc0,	loop_760
	sethi	0x1D96,	%i3
	bg,a,pn	%xcc,	loop_761
	movvc	%xcc,	%l1,	%i5
loop_760:
	tne	%xcc,	0x6
	array32	%l4,	%o5,	%g5
loop_761:
	fbuge	%fcc3,	loop_762
	nop
	setx	loop_763,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovde	%icc,	%f19,	%f22
	movcc	%xcc,	%i0,	%g6
loop_762:
	movge	%xcc,	%l5,	%i4
loop_763:
	ldstub	[%l7 + 0x49],	%g1
	sdivcc	%o6,	0x1D11,	%l2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%g3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o7
	te	%icc,	0x7
	subcc	%i6,	0x05A8,	%o0
	ldub	[%l7 + 0x12],	%i1
	fone	%f20
	te	%xcc,	0x2
	nop
	fitos	%f13,	%f19
	fstox	%f19,	%f6
	brz	%o4,	loop_764
	umulcc	%i2,	0x1912,	%l0
	mulx	%o3,	0x023A,	%l3
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f16
loop_764:
	taddcctv	%g4,	%o1,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i7
	fcmpeq32	%f20,	%f28,	%o2
	fexpand	%f8,	%f20
	bge,a	loop_765
	array16	%g7,	%i3,	%i5
	fpmerge	%f27,	%f19,	%f8
	st	%f4,	[%l7 + 0x34]
loop_765:
	tge	%xcc,	0x6
	addc	%l4,	%l1,	%g5
	sub	%o5,	0x1506,	%g6
	umul	%l5,	0x13F2,	%i4
	edge32	%g1,	%o6,	%l2
	edge16	%g3,	%g2,	%i0
	xnorcc	%i6,	0x1D3E,	%o7
	subcc	%o0,	0x18C1,	%i1
	srax	%o4,	%i2,	%o3
	set	0x24, %l6
	lduwa	[%l7 + %l6] 0x18,	%l3
	movrgz	%g4,	%l0,	%l6
	fblg	%fcc0,	loop_766
	edge16n	%i7,	%o1,	%o2
	nop
	setx	0x2164FC18,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x2A80A928,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f19,	%f7
	movvs	%xcc,	%i3,	%g7
loop_766:
	fmovdvc	%icc,	%f28,	%f0
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f24
	addcc	%l4,	0x1795,	%i5
	nop
	fitod	%f2,	%f4
	fdtox	%f4,	%f22
	orn	%g5,	0x06DA,	%l1
	sdivcc	%g6,	0x1A1A,	%o5
	fmuld8ulx16	%f7,	%f8,	%f20
	fmovrsgz	%i4,	%f15,	%f19
	umul	%g1,	0x03CC,	%l5
	fbne,a	%fcc3,	loop_767
	nop
	setx	0xE38D911E3FE5EFCD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x284B7719B5219C19,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f4,	%f24
	edge16ln	%o6,	%l2,	%g3
	movvs	%icc,	%g2,	%i6
loop_767:
	fmovrse	%o7,	%f31,	%f31
	bg,pn	%xcc,	loop_768
	andn	%o0,	0x0E7E,	%i1
	edge32n	%i0,	%i2,	%o3
	set	0x68, %g2
	ldsha	[%l7 + %g2] 0x15,	%o4
loop_768:
	tl	%xcc,	0x5
	edge32l	%l3,	%l0,	%g4
	fnands	%f6,	%f15,	%f24
	move	%xcc,	%l6,	%i7
	fbne,a	%fcc1,	loop_769
	ta	%xcc,	0x0
	mulx	%o2,	0x1FB8,	%i3
	xor	%o1,	%g7,	%i5
loop_769:
	movrlez	%g5,	%l4,	%l1
	bgu	%xcc,	loop_770
	fmovdneg	%icc,	%f28,	%f5
	ldx	[%l7 + 0x28],	%g6
	srl	%o5,	%g1,	%i4
loop_770:
	tn	%xcc,	0x5
	tgu	%xcc,	0x4
	subccc	%o6,	0x03C7,	%l5
	tpos	%xcc,	0x7
	subc	%g3,	%g2,	%i6
	movrgez	%l2,	%o0,	%i1
	wr	%g0,	0x80,	%asi
	sta	%f23,	[%l7 + 0x44] %asi
	nop
	fitos	%f7,	%f9
	fstoi	%f9,	%f21
	ldsh	[%l7 + 0x4C],	%o7
	or	%i0,	0x126D,	%o3
	fbul	%fcc1,	loop_771
	tn	%xcc,	0x2
	movge	%icc,	%i2,	%o4
	tneg	%icc,	0x2
loop_771:
	nop
	set	0x20, %g3
	stxa	%l3,	[%l7 + %g3] 0xe2
	membar	#Sync
	ba	loop_772
	ble,a,pt	%xcc,	loop_773
	nop
	fitos	%f1,	%f14
	fstoi	%f14,	%f31
	fmovsvs	%xcc,	%f17,	%f10
loop_772:
	brgez	%l0,	loop_774
loop_773:
	fandnot2	%f8,	%f6,	%f28
	bge,pt	%xcc,	loop_775
	movrlz	%g4,	%i7,	%l6
loop_774:
	edge16l	%i3,	%o1,	%o2
	or	%i5,	0x1909,	%g5
loop_775:
	orcc	%l4,	0x1DED,	%l1
	tsubcctv	%g7,	0x1834,	%g6
	ba,a	loop_776
	movcs	%xcc,	%o5,	%i4
	bpos,a	loop_777
	nop
	setx	0x32170D3F59BEF9DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA24D6474E045BD17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f26,	%f24
loop_776:
	membar	0x44
	tneg	%icc,	0x0
loop_777:
	bge,pt	%xcc,	loop_778
	subccc	%o6,	0x05EC,	%l5
	smul	%g1,	0x1991,	%g3
	tg	%xcc,	0x1
loop_778:
	tvc	%xcc,	0x3
	fcmple32	%f4,	%f16,	%g2
	array32	%i6,	%o0,	%l2
	edge16l	%o7,	%i1,	%o3
	nop
	fitos	%f14,	%f10
	fstoi	%f10,	%f31
	lduw	[%l7 + 0x28],	%i2
	brnz,a	%o4,	loop_779
	stx	%l3,	[%l7 + 0x28]
	edge8l	%l0,	%i0,	%i7
	movrlez	%g4,	0x1FE,	%i3
loop_779:
	addc	%o1,	0x01C1,	%l6
	alignaddr	%o2,	%i5,	%g5
	and	%l1,	%g7,	%g6
	stx	%l4,	[%l7 + 0x28]
	taddcc	%o5,	%i4,	%l5
	fmovsg	%xcc,	%f30,	%f1
	smul	%o6,	%g1,	%g2
	movrgz	%i6,	0x11A,	%g3
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x89
	fpadd16	%f14,	%f24,	%f24
	bg,pn	%xcc,	loop_780
	umul	%l2,	%o7,	%o0
	ld	[%l7 + 0x3C],	%f12
	movrgz	%o3,	0x0E2,	%i2
loop_780:
	nop
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x17
	membar	#Sync
	movrgez	%i1,	0x3B2,	%o4
	taddcctv	%l0,	0x01E8,	%l3
	te	%icc,	0x1
	ldsw	[%l7 + 0x18],	%i7
	edge16l	%g4,	%i3,	%i0
	tl	%xcc,	0x3
	subcc	%o1,	%o2,	%l6
	smul	%g5,	0x0053,	%i5
	stw	%g7,	[%l7 + 0x28]
	xnorcc	%l1,	0x0E53,	%g6
	movg	%xcc,	%l4,	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%o5
	fmovdne	%xcc,	%f27,	%f30
	movpos	%icc,	%g1,	%g2
	subcc	%o6,	0x1561,	%i6
	ld	[%l7 + 0x68],	%f29
	edge16l	%g3,	%o7,	%l2
	sll	%o3,	%o0,	%i2
	fpack32	%f6,	%f30,	%f20
	tcs	%icc,	0x6
	andcc	%o4,	%l0,	%l3
	bcs,a,pt	%icc,	loop_781
	fpackfix	%f2,	%f5
	sir	0x1710
	addcc	%i7,	%i1,	%g4
loop_781:
	edge16l	%i0,	%o1,	%i3
	brnz,a	%o2,	loop_782
	subc	%l6,	0x121A,	%g5
	bcc	%icc,	loop_783
	ldub	[%l7 + 0x31],	%i5
loop_782:
	membar	0x49
	tne	%xcc,	0x3
loop_783:
	sub	%g7,	0x01EC,	%g6
	set	0x70, %o2
	lduwa	[%l7 + %o2] 0x0c,	%l1
	tl	%xcc,	0x1
	addccc	%l4,	0x00C2,	%i4
	edge8ln	%o5,	%g1,	%g2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x38] %asi,	%o6
	nop
	fitod	%f8,	%f24
	fdtoi	%f24,	%f25
	taddcc	%l5,	%i6,	%o7
	sdivcc	%g3,	0x10B5,	%l2
	edge32n	%o3,	%i2,	%o0
	fabss	%f14,	%f10
	fxnors	%f25,	%f23,	%f29
	sdivcc	%o4,	0x1599,	%l3
	fmovdvs	%icc,	%f18,	%f6
	movvs	%xcc,	%l0,	%i1
	fcmpne32	%f20,	%f26,	%i7
	alignaddrl	%g4,	%i0,	%i3
	alignaddr	%o2,	%l6,	%g5
	movrlez	%o1,	0x078,	%g7
	and	%g6,	0x10B0,	%l1
	fmovdneg	%icc,	%f17,	%f15
	fmovrdgez	%i5,	%f20,	%f18
	fxnors	%f11,	%f28,	%f28
	fcmple32	%f8,	%f28,	%i4
	fbul	%fcc3,	loop_784
	edge32	%l4,	%o5,	%g1
	alignaddr	%g2,	%o6,	%i6
	fbul	%fcc2,	loop_785
loop_784:
	fxor	%f14,	%f8,	%f22
	fandnot1s	%f7,	%f22,	%f30
	movpos	%xcc,	%l5,	%g3
loop_785:
	ldd	[%l7 + 0x38],	%f12
	fmovrsgez	%o7,	%f21,	%f15
	srl	%l2,	%i2,	%o3
	tsubcc	%o4,	%l3,	%o0
	fcmple32	%f28,	%f0,	%l0
	orcc	%i7,	0x1A0F,	%i1
	fbge,a	%fcc2,	loop_786
	xor	%i0,	0x1B62,	%i3
	fandnot2	%f26,	%f0,	%f16
	fxnor	%f0,	%f14,	%f18
loop_786:
	fornot2	%f8,	%f20,	%f8
	fxor	%f18,	%f2,	%f26
	movcc	%xcc,	%o2,	%l6
	faligndata	%f2,	%f24,	%f10
	set	0x30, %o0
	ldda	[%l7 + %o0] 0xe2,	%g4
	fmul8sux16	%f28,	%f26,	%f12
	fblg,a	%fcc2,	loop_787
	taddcctv	%g4,	0x1A15,	%g7
	fabss	%f11,	%f27
	fmovdleu	%xcc,	%f25,	%f8
loop_787:
	movl	%xcc,	%o1,	%l1
	set	0x54, %g4
	stwa	%g6,	[%l7 + %g4] 0x88
	fmovsgu	%xcc,	%f19,	%f9
	prefetch	[%l7 + 0x2C],	 0x0
	bge,pn	%icc,	loop_788
	sub	%i4,	0x0A1C,	%i5
	fmovrsne	%o5,	%f23,	%f20
	mova	%icc,	%l4,	%g2
loop_788:
	andcc	%o6,	%i6,	%l5
	sllx	%g3,	%o7,	%g1
	ba,a,pn	%xcc,	loop_789
	subc	%l2,	0x17BE,	%i2
	taddcc	%o3,	0x147C,	%l3
	sth	%o4,	[%l7 + 0x70]
loop_789:
	xorcc	%l0,	%i7,	%o0
	fmovsle	%icc,	%f21,	%f3
	ldsb	[%l7 + 0x2C],	%i0
	nop
	setx loop_790, %l0, %l1
	jmpl %l1, %i3
	fmovrsgz	%o2,	%f25,	%f31
	nop
	setx	0x8E74573E0AA64E79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x63AD5156C381D6FB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f2,	%f2
	fnot1s	%f2,	%f15
loop_790:
	sdivx	%l6,	0x15B9,	%g5
	umulcc	%g4,	%g7,	%i1
	taddcc	%o1,	0x13A7,	%l1
	taddcc	%i4,	%g6,	%o5
	edge32ln	%i5,	%l4,	%g2
	subc	%o6,	0x14B3,	%l5
	fmovsle	%icc,	%f20,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g3,	%o7,	%g1
	tle	%xcc,	0x5
	andn	%i6,	%l2,	%o3
	edge8ln	%l3,	%o4,	%i2
	tne	%icc,	0x1
	array32	%l0,	%i7,	%i0
	call	loop_791
	fcmpeq16	%f26,	%f8,	%i3
	sllx	%o2,	0x1E,	%o0
	ba,a,pn	%icc,	loop_792
loop_791:
	movrgez	%l6,	%g5,	%g4
	movcc	%icc,	%i1,	%o1
	movleu	%icc,	%g7,	%i4
loop_792:
	udivx	%l1,	0x0637,	%g6
	fnor	%f16,	%f0,	%f28
	movrgz	%o5,	%i5,	%l4
	lduh	[%l7 + 0x56],	%o6
	xor	%g2,	%l5,	%o7
	bleu,a,pt	%xcc,	loop_793
	edge8ln	%g1,	%i6,	%g3
	st	%f19,	[%l7 + 0x3C]
	andncc	%l2,	%l3,	%o4
loop_793:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o3
	edge8	%l0,	%i7,	%i2
	edge32	%i3,	%o2,	%o0
	movle	%icc,	%i0,	%l6
	subcc	%g4,	%i1,	%o1
	fmovrdne	%g7,	%f16,	%f6
	smulcc	%i4,	0x1865,	%l1
	addc	%g6,	0x152D,	%g5
	orn	%o5,	%i5,	%o6
	movvs	%xcc,	%g2,	%l4
	edge16	%l5,	%g1,	%i6
	srax	%g3,	%o7,	%l2
	set	0x2A, %o1
	lduha	[%l7 + %o1] 0x18,	%l3
	xnor	%o4,	%l0,	%o3
	ldub	[%l7 + 0x73],	%i7
	nop
	setx	0xF5AF4D237EF671DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f30
	tpos	%icc,	0x1
	fpmerge	%f7,	%f11,	%f8
	movneg	%xcc,	%i3,	%o2
	te	%xcc,	0x7
	fmovrde	%o0,	%f2,	%f28
	taddcctv	%i0,	0x156C,	%i2
	lduw	[%l7 + 0x54],	%g4
	umulcc	%i1,	0x0992,	%o1
	fmovdl	%xcc,	%f10,	%f18
	nop
	setx	0x1043DD8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	movrgz	%l6,	0x2DB,	%g7
	nop
	setx	0x30656C39,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	movn	%xcc,	%l1,	%i4
	popc	%g5,	%o5
	xorcc	%i5,	%o6,	%g2
	edge32l	%g6,	%l4,	%g1
	addccc	%l5,	%i6,	%o7
	srl	%l2,	%l3,	%o4
	sra	%g3,	0x01,	%l0
	movpos	%xcc,	%i7,	%i3
	bpos,pn	%xcc,	loop_794
	or	%o3,	%o2,	%i0
	edge32ln	%i2,	%g4,	%o0
	sdivcc	%o1,	0x0803,	%i1
loop_794:
	bl	loop_795
	xnor	%l6,	0x157C,	%l1
	movne	%icc,	%g7,	%g5
	xnor	%o5,	0x1CB7,	%i5
loop_795:
	tvc	%xcc,	0x5
	fbule,a	%fcc0,	loop_796
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x4
	nop
	setx	0xDEF907BD9077042D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_796:
	nop
	setx	0xBB203F60,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f19
	fornot2	%f0,	%f2,	%f8
	fones	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i4,	%g2,	%g6
	set	0x74, %l1
	swapa	[%l7 + %l1] 0x80,	%o6
	umulcc	%l4,	%g1,	%i6
	smul	%l5,	0x1E3A,	%o7
	orncc	%l2,	0x079D,	%l3
	subccc	%g3,	%o4,	%i7
	udivx	%i3,	0x1D7D,	%l0
	edge8	%o3,	%i0,	%i2
	bleu,a,pt	%xcc,	loop_797
	mulscc	%g4,	0x0F46,	%o0
	fnegs	%f21,	%f17
	movle	%xcc,	%o2,	%o1
loop_797:
	sllx	%i1,	%l6,	%l1
	movrlez	%g7,	%g5,	%i5
	tle	%icc,	0x2
	fmovdle	%xcc,	%f3,	%f27
	call	loop_798
	movrlz	%i4,	%g2,	%g6
	st	%f6,	[%l7 + 0x68]
	set	0x1C, %o7
	lduha	[%l7 + %o7] 0x10,	%o6
loop_798:
	fbe,a	%fcc3,	loop_799
	tne	%xcc,	0x1
	tsubcc	%l4,	0x0FB7,	%g1
	fmovrse	%o5,	%f19,	%f19
loop_799:
	fmovsvc	%icc,	%f15,	%f13
	set	0x5C, %l4
	lda	[%l7 + %l4] 0x81,	%f29
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%l5
	sir	0x1E77
	ldsh	[%l7 + 0x6C],	%o7
	udivcc	%i6,	0x05B3,	%l3
	movrlez	%l2,	%o4,	%i7
	srax	%i3,	%g3,	%l0
	or	%o3,	%i2,	%i0
	set	0x5E, %i5
	ldsba	[%l7 + %i5] 0x89,	%o0
	array8	%o2,	%g4,	%i1
	tle	%icc,	0x5
	fmovsn	%icc,	%f24,	%f20
	tpos	%icc,	0x5
	fpadd32s	%f11,	%f27,	%f11
	bvs	%xcc,	loop_800
	movrne	%l6,	0x3FA,	%l1
	andn	%g7,	0x026B,	%g5
	movrgez	%i5,	0x0E0,	%i4
loop_800:
	edge8l	%g2,	%o1,	%g6
	movl	%xcc,	%l4,	%g1
	tsubcctv	%o6,	0x0BCE,	%l5
	fmul8x16au	%f30,	%f1,	%f8
	nop
	fitos	%f7,	%f25
	fstod	%f25,	%f14
	brz	%o5,	loop_801
	nop
	fitod	%f0,	%f0
	fdtox	%f0,	%f0
	nop
	setx	0xA04C8D6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	sir	0x0F38
loop_801:
	nop
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf1,	%f16
	edge8ln	%i6,	%o7,	%l3
	and	%o4,	0x1781,	%l2
	sir	0x143B
	bneg,pn	%xcc,	loop_802
	fcmple16	%f18,	%f20,	%i3
	edge8l	%i7,	%g3,	%l0
	array32	%o3,	%i2,	%i0
loop_802:
	tge	%xcc,	0x4
	fmovsvs	%xcc,	%f16,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x4
	movneg	%xcc,	%o0,	%g4
	movrgz	%o2,	0x131,	%i1
	edge16ln	%l6,	%l1,	%g7
	andncc	%i5,	%i4,	%g2
	fpadd16s	%f15,	%f10,	%f2
	movg	%xcc,	%o1,	%g6
	addcc	%l4,	0x03AA,	%g1
	edge32n	%g5,	%l5,	%o6
	te	%icc,	0x5
	brlz	%o5,	loop_803
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f2
	nop
	set	0x4C, %g1
	ldub	[%l7 + %g1],	%o7
	movrgez	%l3,	0x1F4,	%i6
loop_803:
	fbo,a	%fcc0,	loop_804
	sth	%l2,	[%l7 + 0x08]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%o4
loop_804:
	tcs	%icc,	0x3
	fmovdvc	%icc,	%f14,	%f5
	nop
	setx loop_805, %l0, %l1
	jmpl %l1, %g3
	sir	0x1771
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o3
loop_805:
	edge8ln	%i2,	%i0,	%l0
	movrlez	%g4,	%o2,	%o0
	addc	%i1,	0x10A2,	%l6
	call	loop_806
	tvs	%icc,	0x4
	sub	%l1,	%i5,	%g7
	edge16ln	%g2,	%i4,	%o1
loop_806:
	nop
	setx	loop_807,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x66775F86C723A3FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE64E982F3694A24C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f2,	%f24
	brgez	%g6,	loop_808
	fnor	%f12,	%f10,	%f14
loop_807:
	fmovspos	%xcc,	%f22,	%f14
	tsubcctv	%g1,	%g5,	%l4
loop_808:
	edge32l	%l5,	%o5,	%o7
	fpack32	%f10,	%f16,	%f14
	subccc	%l3,	%i6,	%o6
	fones	%f26
	edge8	%i3,	%l2,	%o4
	movrlez	%g3,	%o3,	%i2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x52] %asi,	%i0
	tvc	%icc,	0x5
	swap	[%l7 + 0x1C],	%l0
	bge,pn	%xcc,	loop_809
	fba	%fcc1,	loop_810
	addccc	%g4,	%i7,	%o0
	andcc	%i1,	0x1CAE,	%l6
loop_809:
	alignaddr	%l1,	%o2,	%g7
loop_810:
	bvc,pn	%xcc,	loop_811
	fmovdge	%icc,	%f2,	%f23
	udivcc	%g2,	0x0751,	%i4
	movneg	%xcc,	%i5,	%o1
loop_811:
	fmovdneg	%xcc,	%f27,	%f14
	fpsub32s	%f0,	%f17,	%f3
	movleu	%icc,	%g6,	%g5
	ldsb	[%l7 + 0x13],	%l4
	tvs	%xcc,	0x1
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x04,	%g1
	tpos	%icc,	0x5
	mulscc	%o5,	%l5,	%l3
	fbug,a	%fcc3,	loop_812
	taddcc	%o7,	0x1348,	%i6
	ldub	[%l7 + 0x55],	%o6
	andcc	%i3,	0x0167,	%o4
loop_812:
	srl	%g3,	%o3,	%i2
	fmovdvs	%xcc,	%f19,	%f8
	movvc	%xcc,	%i0,	%l0
	tleu	%xcc,	0x4
	sdivcc	%g4,	0x0321,	%i7
	ba,a,pn	%xcc,	loop_813
	srlx	%l2,	0x1F,	%o0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%l6
loop_813:
	movge	%icc,	%i1,	%o2
	movrlz	%l1,	%g7,	%g2
	addccc	%i4,	%i5,	%o1
	addcc	%g5,	0x067C,	%l4
	bvs,a	%icc,	loop_814
	brlz,a	%g6,	loop_815
	tleu	%icc,	0x0
	sdivcc	%o5,	0x1976,	%g1
loop_814:
	and	%l5,	0x1997,	%l3
loop_815:
	xor	%i6,	%o7,	%o6
	or	%i3,	0x1B7B,	%o4
	tsubcctv	%g3,	%i2,	%o3
	tcs	%icc,	0x5
	ldx	[%l7 + 0x08],	%i0
	set	0x4C, %i7
	ldswa	[%l7 + %i7] 0x14,	%g4
	movgu	%icc,	%i7,	%l2
	movre	%o0,	0x378,	%l6
	andn	%l0,	%o2,	%l1
	edge8ln	%g7,	%i1,	%g2
	nop
	fitos	%f22,	%f15
	stx	%i5,	[%l7 + 0x78]
	membar	0x30
	movrne	%i4,	%o1,	%l4
	umulcc	%g6,	%o5,	%g5
	ldstub	[%l7 + 0x48],	%g1
	edge16l	%l5,	%l3,	%o7
	and	%i6,	%o6,	%i3
	edge8l	%g3,	%i2,	%o4
	tcs	%xcc,	0x0
	stbar
	movl	%icc,	%i0,	%g4
	movre	%o3,	%i7,	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o0,	%l0
	sra	%l6,	0x01,	%o2
	fmovse	%xcc,	%f16,	%f5
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x1f,	%f16
	ble	loop_816
	nop
	fitos	%f17,	%f29
	mulx	%l1,	0x0B42,	%i1
	taddcc	%g7,	%g2,	%i4
loop_816:
	edge16n	%o1,	%l4,	%i5
	fmovs	%f24,	%f7
	movrne	%g6,	0x2D9,	%o5
	fble,a	%fcc1,	loop_817
	fbule,a	%fcc1,	loop_818
	movge	%icc,	%g5,	%g1
	fbl	%fcc3,	loop_819
loop_817:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_818:
	tle	%xcc,	0x4
	st	%f2,	[%l7 + 0x5C]
loop_819:
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
	fmovdleu	%icc,	%f11,	%f2
	xor	%l3,	0x042B,	%l5
	fmovsn	%icc,	%f30,	%f5
	ldsb	[%l7 + 0x1E],	%i6
	set	0x0, %o3
	ldxa	[%g0 + %o3] 0x4f,	%o6
	fbuge,a	%fcc2,	loop_820
	ld	[%l7 + 0x6C],	%f24
	fandnot1	%f14,	%f22,	%f12
	fsrc2	%f22,	%f28
loop_820:
	fbn	%fcc2,	loop_821
	mova	%xcc,	%i3,	%g3
	tsubcctv	%i2,	0x1A9B,	%o7
	movl	%icc,	%i0,	%g4
loop_821:
	fabss	%f27,	%f5
	tvs	%xcc,	0x3
	sra	%o4,	%o3,	%i7
	bleu,a	loop_822
	bneg,a	%xcc,	loop_823
	and	%o0,	0x18EE,	%l2
	alignaddrl	%l0,	%o2,	%l1
loop_822:
	ld	[%l7 + 0x54],	%f18
loop_823:
	popc	0x13E0,	%i1
	tne	%xcc,	0x2
	fbo,a	%fcc2,	loop_824
	tsubcc	%g7,	%g2,	%i4
	tvc	%icc,	0x3
	nop
	setx	loop_825,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_824:
	xnor	%l6,	%l4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x24, %g5
	ldswa	[%l7 + %g5] 0x80,	%i5
loop_825:
	brnz,a	%o5,	loop_826
	edge32n	%g6,	%g1,	%l3
	tcc	%xcc,	0x5
	ta	%xcc,	0x3
loop_826:
	addccc	%g5,	%l5,	%o6
	movleu	%icc,	%i3,	%i6
	srl	%g3,	%o7,	%i0
	movpos	%icc,	%g4,	%i2
	tne	%xcc,	0x2
	bcc,a	loop_827
	nop
	setx	0x35FA6881A31F2B1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x5954905E318C8B6D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f28,	%f14
	nop
	setx	0x93A63869AC502F6E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xF621512D43D72388,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f6,	%f24
	set	0x42, %i2
	lduha	[%l7 + %i2] 0x10,	%o4
loop_827:
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f14
	fxtos	%f14,	%f4
	fands	%f20,	%f7,	%f5
	movg	%icc,	%i7,	%o0
	ldd	[%l7 + 0x18],	%f6
	edge16l	%l2,	%o3,	%l0
	udivx	%l1,	0x1229,	%i1
	swap	[%l7 + 0x7C],	%g7
	brlz,a	%g2,	loop_828
	ba,a,pn	%icc,	loop_829
	movcs	%icc,	%i4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_828:
	brnz	%l6,	loop_830
loop_829:
	fnot1s	%f11,	%f5
	fpadd16s	%f20,	%f10,	%f16
	fands	%f12,	%f5,	%f12
loop_830:
	fcmpeq16	%f14,	%f26,	%l4
	ldd	[%l7 + 0x20],	%i4
	movl	%icc,	%o1,	%o5
	fxors	%f25,	%f6,	%f10
	tge	%xcc,	0x1
	srax	%g6,	%g1,	%l3
	set	0x4A, %g7
	ldstuba	[%l7 + %g7] 0x89,	%l5
	fpack16	%f22,	%f1
	bvc	%icc,	loop_831
	edge8l	%o6,	%g5,	%i6
	orncc	%g3,	%i3,	%i0
	addccc	%o7,	%i2,	%o4
loop_831:
	tg	%icc,	0x3
	fmovdvs	%icc,	%f29,	%f24
	sdivcc	%i7,	0x156E,	%g4
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x10] %asi,	%o0
	fbo,a	%fcc3,	loop_832
	brlez,a	%o3,	loop_833
	tpos	%icc,	0x7
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x20] %asi,	%f19
loop_832:
	andn	%l2,	0x119E,	%l1
loop_833:
	xnorcc	%l0,	0x0D28,	%i1
	smulcc	%g2,	0x0A50,	%g7
	edge16	%o2,	%i4,	%l4
	stx	%i5,	[%l7 + 0x40]
	xnorcc	%o1,	%l6,	%o5
	movgu	%icc,	%g1,	%l3
	tcc	%icc,	0x5
	bl	loop_834
	nop
	setx	0x6B16D5E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xDA368E89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f7,	%f19
	nop
	setx	0xB752A349047AA20B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2E39EAAD9190B0B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f8
	fmovsn	%xcc,	%f8,	%f5
loop_834:
	for	%f12,	%f28,	%f20
	edge8n	%l5,	%o6,	%g5
	srax	%g6,	0x0D,	%g3
	sll	%i3,	%i6,	%i0
	edge32l	%i2,	%o4,	%o7
	movrgez	%i7,	%g4,	%o0
	edge32n	%o3,	%l1,	%l0
	fmovrse	%l2,	%f30,	%f23
	addcc	%i1,	0x139F,	%g2
	edge16ln	%g7,	%o2,	%i4
	smul	%l4,	%i5,	%o1
	ldstub	[%l7 + 0x46],	%l6
	fxor	%f18,	%f28,	%f4
	movre	%o5,	%g1,	%l5
	movrlz	%l3,	0x191,	%g5
	xor	%o6,	0x00AE,	%g3
	subcc	%g6,	0x1401,	%i3
	mova	%xcc,	%i0,	%i6
	alignaddrl	%i2,	%o7,	%o4
	fmovdvs	%icc,	%f4,	%f29
	fmovsvs	%icc,	%f5,	%f30
	array8	%g4,	%i7,	%o3
	andn	%l1,	0x0410,	%l0
	fpsub32	%f6,	%f10,	%f2
	bgu,pn	%xcc,	loop_835
	subc	%o0,	%i1,	%l2
	movvs	%icc,	%g2,	%g7
	ble,pn	%xcc,	loop_836
loop_835:
	fbuge	%fcc0,	loop_837
	bgu,a,pt	%xcc,	loop_838
	nop
	set	0x70, %g6
	lduw	[%l7 + %g6],	%i4
loop_836:
	fbule	%fcc2,	loop_839
loop_837:
	fmovdneg	%icc,	%f12,	%f13
loop_838:
	fnor	%f24,	%f26,	%f2
	fandnot2	%f22,	%f2,	%f18
loop_839:
	fsrc2	%f10,	%f16
	ta	%icc,	0x6
	ldsw	[%l7 + 0x10],	%l4
	movvc	%icc,	%o2,	%i5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x64] %asi,	%f10
	bshuffle	%f26,	%f0,	%f12
	fmovdn	%xcc,	%f17,	%f30
	bvc,a,pt	%icc,	loop_840
	movle	%icc,	%o1,	%l6
	or	%g1,	%o5,	%l3
	fbn	%fcc0,	loop_841
loop_840:
	stbar
	fpsub32	%f28,	%f22,	%f0
	fsrc2	%f16,	%f16
loop_841:
	subccc	%l5,	0x0154,	%o6
	movrgz	%g3,	%g5,	%i3
	movg	%icc,	%g6,	%i6
	sdivcc	%i0,	0x0389,	%i2
	fba	%fcc2,	loop_842
	array32	%o7,	%g4,	%i7
	movpos	%xcc,	%o3,	%o4
	tgu	%xcc,	0x0
loop_842:
	movl	%xcc,	%l1,	%o0
	nop
	set	0x62, %l0
	ldsb	[%l7 + %l0],	%i1
	udiv	%l0,	0x04C4,	%g2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%i4
	movvs	%xcc,	%l4,	%o2
	fpsub32	%f30,	%f16,	%f20
	wr	%g0,	0xe3,	%asi
	stwa	%i5,	[%l7 + 0x40] %asi
	membar	#Sync
	movge	%icc,	%l2,	%l6
	mulx	%g1,	%o1,	%l3
	fmovdpos	%xcc,	%f26,	%f8
	fmovrde	%o5,	%f6,	%f18
	fmul8x16al	%f6,	%f20,	%f22
	bcc,a,pt	%xcc,	loop_843
	sll	%o6,	0x1B,	%g3
	tcc	%xcc,	0x7
	movrlz	%g5,	%l5,	%i3
loop_843:
	and	%i6,	0x0DB2,	%i0
	nop
	setx	0xDBF4AD81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x2FF2F818,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f3,	%f1
	edge8	%i2,	%o7,	%g4
	sir	0x11C6
	andncc	%g6,	%o3,	%i7
	bneg,a	%xcc,	loop_844
	sra	%o4,	0x0F,	%o0
	fbule	%fcc1,	loop_845
	mova	%icc,	%i1,	%l1
loop_844:
	movvc	%icc,	%g2,	%l0
	tle	%xcc,	0x6
loop_845:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i4,	%l4,	%o2
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x80,	%g6
	movrne	%i5,	0x10C,	%l6
	tg	%xcc,	0x1
	mulx	%l2,	%o1,	%l3
	xnor	%o5,	%o6,	%g1
	nop
	fitos	%f16,	%f16
	edge16ln	%g3,	%l5,	%g5
	movg	%icc,	%i6,	%i0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i3,	%o7
	nop
	setx	loop_846,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%g4,	%g6,	%i2
	bleu,a,pn	%xcc,	loop_847
	movgu	%xcc,	%o3,	%i7
loop_846:
	add	%o4,	%i1,	%o0
	fbue,a	%fcc2,	loop_848
loop_847:
	bge,a,pn	%xcc,	loop_849
	fbe,a	%fcc0,	loop_850
	andn	%g2,	0x16A3,	%l1
loop_848:
	movrne	%l0,	0x0B3,	%i4
loop_849:
	edge16	%o2,	%l4,	%i5
loop_850:
	ldd	[%l7 + 0x30],	%g6
	addc	%l6,	%o1,	%l2
	tl	%xcc,	0x5
	orcc	%l3,	%o6,	%o5
	ble,pt	%xcc,	loop_851
	tvc	%icc,	0x3
	fpsub32	%f16,	%f4,	%f2
	subccc	%g3,	%g1,	%g5
loop_851:
	tl	%xcc,	0x0
	udiv	%l5,	0x1FF7,	%i0
	fxors	%f5,	%f25,	%f20
	brgz	%i6,	loop_852
	fmovdg	%icc,	%f1,	%f5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i3
loop_852:
	subc	%g4,	0x1809,	%g6
	sra	%i2,	%o7,	%o3
	andcc	%o4,	0x12F2,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%o0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l1
	alignaddrl	%g2,	%l0,	%o2
	edge32n	%i4,	%i5,	%l4
	bneg,a,pn	%icc,	loop_853
	call	loop_854
	fmovdpos	%xcc,	%f29,	%f26
	edge32l	%g7,	%l6,	%l2
loop_853:
	sllx	%o1,	%l3,	%o6
loop_854:
	nop
	fitos	%f19,	%f24
	movl	%icc,	%g3,	%o5
	fcmpeq16	%f26,	%f10,	%g5
	fcmpeq32	%f12,	%f0,	%l5
	edge16ln	%i0,	%g1,	%i6
	set	0x76, %i4
	ldsba	[%l7 + %i4] 0x14,	%g4
	bcc,a	loop_855
	ldd	[%l7 + 0x30],	%g6
	movrlez	%i2,	%i3,	%o3
	edge16n	%o7,	%o4,	%i1
loop_855:
	nop
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x14,	%i7
	for	%f0,	%f0,	%f0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l1
	fbug	%fcc0,	loop_856
	movneg	%icc,	%g2,	%l0
	xorcc	%o0,	0x1C7A,	%i4
	fbl	%fcc1,	loop_857
loop_856:
	udiv	%o2,	0x17AE,	%i5
	fbul	%fcc3,	loop_858
	fnot1	%f20,	%f14
loop_857:
	bn,a	%icc,	loop_859
	subccc	%l4,	0x0433,	%g7
loop_858:
	xor	%l2,	0x100F,	%o1
	bvs,pn	%icc,	loop_860
loop_859:
	movrgz	%l3,	0x3DD,	%l6
	edge16n	%g3,	%o5,	%g5
	xnorcc	%l5,	0x128D,	%i0
loop_860:
	nop
	setx	0xCC464CC7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xD34D4574,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f7,	%f3
	alignaddr	%g1,	%o6,	%g4
	fsrc1	%f14,	%f20
	tvs	%xcc,	0x6
	bl,pt	%xcc,	loop_861
	sdiv	%i6,	0x0018,	%g6
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x15,	%i2
loop_861:
	nop
	set	0x08, %i6
	sta	%f23,	[%l7 + %i6] 0x89
	movl	%icc,	%i2,	%o3
	movrlz	%o4,	0x2CD,	%i1
	fbul	%fcc0,	loop_862
	tsubcc	%i7,	0x11F5,	%o7
	fpsub32	%f24,	%f30,	%f30
	edge8ln	%l1,	%g2,	%l0
loop_862:
	movvc	%xcc,	%o0,	%i4
	movrlz	%i5,	0x048,	%o2
	wr	%g0,	0x11,	%asi
	sta	%f4,	[%l7 + 0x60] %asi
	movrne	%l4,	%g7,	%l2
	movle	%xcc,	%l3,	%o1
	fmovrdgez	%l6,	%f18,	%f24
	set	0x52, %l6
	stha	%o5,	[%l7 + %l6] 0x81
	brlez,a	%g5,	loop_863
	stb	%g3,	[%l7 + 0x3F]
	udivx	%l5,	0x193A,	%i0
	mulx	%o6,	0x090E,	%g1
loop_863:
	alignaddrl	%g4,	%i6,	%g6
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x22,	%i2
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brz	%o3,	loop_864
	fmovdne	%xcc,	%f27,	%f24
	mova	%xcc,	%o4,	%i3
	srl	%i7,	0x09,	%i1
loop_864:
	fornot1	%f28,	%f16,	%f0
	movg	%xcc,	%l1,	%g2
	fxnor	%f8,	%f24,	%f6
	set	0x3C, %g3
	ldswa	[%l7 + %g3] 0x11,	%l0
	set	0x24, %o4
	stwa	%o0,	[%l7 + %o4] 0x14
	fpadd16s	%f10,	%f21,	%f25
	tl	%xcc,	0x3
	mova	%xcc,	%o7,	%i4
	fmovrsne	%i5,	%f10,	%f15
	fmovscc	%icc,	%f24,	%f0
	taddcctv	%o2,	0x12F2,	%l4
	fpack16	%f16,	%f19
	fandnot2s	%f30,	%f23,	%f26
	subcc	%g7,	%l2,	%l3
	umul	%o1,	%o5,	%l6
	tvs	%xcc,	0x1
	fmovsl	%icc,	%f6,	%f4
	edge32l	%g3,	%g5,	%l5
	movgu	%icc,	%o6,	%i0
	xor	%g1,	0x1BDF,	%i6
	array8	%g4,	%i2,	%g6
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x18,	%f10
	fpadd32	%f14,	%f16,	%f18
	fbul	%fcc2,	loop_865
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f23
	sllx	%o3,	%o4,	%i7
	movne	%xcc,	%i1,	%l1
loop_865:
	bcc,pn	%xcc,	loop_866
	srax	%g2,	0x08,	%l0
	membar	0x61
	fmovspos	%xcc,	%f19,	%f22
loop_866:
	edge8ln	%i3,	%o7,	%i4
	movvs	%xcc,	%i5,	%o2
	be,a,pt	%xcc,	loop_867
	movgu	%icc,	%l4,	%g7
	tle	%xcc,	0x6
	edge16l	%l2,	%l3,	%o1
loop_867:
	tsubcc	%o0,	%l6,	%o5
	fcmpeq16	%f26,	%f4,	%g3
	sllx	%g5,	%o6,	%l5
	tn	%icc,	0x0
	fmovrsne	%i0,	%f23,	%f5
	stw	%i6,	[%l7 + 0x38]
	udivx	%g1,	0x0AC3,	%i2
	or	%g6,	%g4,	%o3
	fmovdneg	%icc,	%f30,	%f15
	xor	%o4,	0x09D7,	%i7
	fmovrse	%l1,	%f4,	%f16
	array16	%g2,	%l0,	%i1
	wr	%g0,	0x89,	%asi
	stwa	%o7,	[%l7 + 0x60] %asi
	fmovdpos	%xcc,	%f3,	%f6
	edge32	%i4,	%i3,	%i5
	ba,a	%xcc,	loop_868
	movle	%icc,	%l4,	%g7
	membar	0x75
	nop
	setx	0x63EB345DBF53BE31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f18
loop_868:
	nop
	setx	0xAE88B95D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x6FA1BA37,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f6,	%f30
	srlx	%l2,	%o2,	%o1
	brz	%o0,	loop_869
	mulx	%l6,	%l3,	%o5
	tge	%icc,	0x2
	brgz,a	%g5,	loop_870
loop_869:
	umulcc	%o6,	%l5,	%i0
	fble,a	%fcc1,	loop_871
	tvc	%icc,	0x0
loop_870:
	tsubcc	%i6,	%g1,	%g3
	fbn	%fcc0,	loop_872
loop_871:
	fnot1s	%f25,	%f31
	tcs	%icc,	0x0
	edge16ln	%i2,	%g4,	%o3
loop_872:
	edge8	%o4,	%g6,	%l1
	ba,a,pt	%xcc,	loop_873
	fble,a	%fcc2,	loop_874
	lduh	[%l7 + 0x42],	%g2
	movgu	%icc,	%i7,	%l0
loop_873:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_874:
	movneg	%xcc,	%i1,	%o7
	udiv	%i3,	0x082D,	%i5
	umul	%i4,	%l4,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc2,	loop_875
	array16	%o2,	%o1,	%o0
	tgu	%icc,	0x6
	orncc	%l6,	0x01BC,	%l2
loop_875:
	pdist	%f8,	%f6,	%f20
	nop
	fitos	%f7,	%f29
	fstoi	%f29,	%f9
	edge32	%l3,	%g5,	%o5
	fmovsne	%xcc,	%f11,	%f6
	orcc	%o6,	%l5,	%i6
	faligndata	%f10,	%f28,	%f22
	fandnot2s	%f2,	%f18,	%f0
	xnor	%g1,	%g3,	%i0
	brnz	%g4,	loop_876
	movge	%xcc,	%o3,	%o4
	andn	%i2,	%g6,	%l1
	movrlez	%i7,	0x0D3,	%l0
loop_876:
	mulscc	%g2,	%i1,	%i3
	fmovsge	%icc,	%f19,	%f30
	sdivx	%o7,	0x14E9,	%i4
	nop
	setx loop_877, %l0, %l1
	jmpl %l1, %i5
	edge32ln	%l4,	%o2,	%o1
	movpos	%icc,	%g7,	%l6
	popc	0x1C4D,	%o0
loop_877:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%l3
	sdiv	%g5,	0x04A1,	%o5
	array8	%o6,	%i6,	%l5
	andn	%g3,	0x0C0C,	%g1
	fmul8x16	%f12,	%f14,	%f28
	fnot1s	%f26,	%f24
	nop
	setx	loop_878,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%i0,	%g4,	%o4
	fble,a	%fcc2,	loop_879
	tcc	%xcc,	0x1
loop_878:
	nop
	set	0x78, %o2
	stwa	%o3,	[%l7 + %o2] 0xea
	membar	#Sync
loop_879:
	movrgz	%g6,	0x1E5,	%l1
	stb	%i7,	[%l7 + 0x2E]
	fmovsle	%xcc,	%f17,	%f22
	srax	%l0,	0x16,	%g2
	edge32l	%i1,	%i3,	%o7
	sth	%i4,	[%l7 + 0x30]
	brnz	%i2,	loop_880
	fbe	%fcc2,	loop_881
	srax	%i5,	%l4,	%o1
	bvs	%xcc,	loop_882
loop_880:
	edge32n	%g7,	%o2,	%o0
loop_881:
	tpos	%xcc,	0x6
	tsubcc	%l6,	%l2,	%l3
loop_882:
	movge	%icc,	%o5,	%g5
	wr	%g0,	0x10,	%asi
	sta	%f6,	[%l7 + 0x30] %asi
	movrlez	%i6,	%o6,	%l5
	sra	%g1,	%g3,	%i0
	flush	%l7 + 0x18
	movcs	%xcc,	%g4,	%o4
	andn	%g6,	0x14D8,	%o3
	faligndata	%f8,	%f30,	%f6
	set	0x24, %o0
	stha	%l1,	[%l7 + %o0] 0x11
	fmovd	%f2,	%f14
	fbul,a	%fcc1,	loop_883
	fmovsneg	%icc,	%f7,	%f19
	fxnors	%f14,	%f19,	%f0
	xnorcc	%i7,	%l0,	%i1
loop_883:
	nop
	setx	loop_884,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%i3,	0x0D4,	%o7
	fcmpgt32	%f30,	%f12,	%g2
	smul	%i2,	%i4,	%i5
loop_884:
	tvc	%icc,	0x7
	and	%l4,	%g7,	%o1
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%o0
	movrne	%l6,	0x2EF,	%l2
	bn	%xcc,	loop_885
	tsubcc	%o2,	0x194B,	%o5
	movrgez	%g5,	0x225,	%l3
	mova	%icc,	%o6,	%i6
loop_885:
	tle	%icc,	0x3
	fba	%fcc3,	loop_886
	movrgez	%l5,	%g1,	%i0
	ldx	[%l7 + 0x18],	%g4
	swap	[%l7 + 0x74],	%g3
loop_886:
	movcc	%icc,	%o4,	%o3
	ta	%icc,	0x1
	ldd	[%l7 + 0x10],	%f18
	orn	%l1,	0x0C43,	%g6
	fbuge,a	%fcc1,	loop_887
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f1,	%f4
	array32	%l0,	%i1,	%i7
loop_887:
	ld	[%l7 + 0x48],	%f17
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i3,	%o7
	tpos	%xcc,	0x4
	ldub	[%l7 + 0x74],	%i2
	edge16l	%i4,	%i5,	%g2
	tpos	%xcc,	0x2
	fmovsleu	%xcc,	%f28,	%f30
	edge16n	%l4,	%o1,	%o0
	edge32	%g7,	%l2,	%l6
	movn	%icc,	%o2,	%o5
	alignaddrl	%l3,	%g5,	%i6
	movle	%xcc,	%o6,	%g1
	popc	%i0,	%g4
	fmovrsgez	%g3,	%f22,	%f25
	edge32ln	%o4,	%l5,	%o3
	fmovsvs	%xcc,	%f1,	%f20
	edge16n	%l1,	%g6,	%l0
	fbne	%fcc0,	loop_888
	fmovdle	%xcc,	%f3,	%f21
	membar	0x04
	fpsub32	%f20,	%f24,	%f18
loop_888:
	bne	%icc,	loop_889
	orcc	%i1,	%i3,	%i7
	bvc	%xcc,	loop_890
	movneg	%icc,	%o7,	%i4
loop_889:
	taddcc	%i2,	0x0BC9,	%g2
	udivcc	%l4,	0x1FE6,	%i5
loop_890:
	alignaddr	%o1,	%o0,	%g7
	nop
	setx	0x466989E71046DD03,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	or	%l2,	%o2,	%l6
	set	0x1A, %i3
	stba	%l3,	[%l7 + %i3] 0xea
	membar	#Sync
	te	%icc,	0x6
	nop
	fitod	%f6,	%f22
	fdtoi	%f22,	%f2
	fsrc1s	%f16,	%f9
	bne,pt	%xcc,	loop_891
	subcc	%g5,	%o5,	%i6
	movrne	%g1,	0x06F,	%o6
	fpackfix	%f8,	%f18
loop_891:
	nop
	setx	loop_892,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos,a	%xcc,	loop_893
	ldd	[%l7 + 0x58],	%f4
	fbule,a	%fcc3,	loop_894
loop_892:
	sra	%i0,	%g3,	%g4
loop_893:
	alignaddrl	%o4,	%o3,	%l1
	srax	%l5,	0x09,	%g6
loop_894:
	nop
	setx	loop_895,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%i1,	%l0,	%i3
	movn	%icc,	%i7,	%i4
	udivx	%o7,	0x0F5F,	%g2
loop_895:
	fba	%fcc0,	loop_896
	xor	%i2,	0x172B,	%l4
	fnands	%f17,	%f14,	%f28
	tl	%xcc,	0x7
loop_896:
	edge32ln	%o1,	%i5,	%o0
	set	0x1D, %g4
	ldsba	[%l7 + %g4] 0x19,	%l2
	stbar
	movg	%xcc,	%o2,	%g7
	ldsb	[%l7 + 0x24],	%l3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x08] %asi,	%f8
	fbuge	%fcc2,	loop_897
	andncc	%l6,	%o5,	%i6
	tpos	%icc,	0x6
	movpos	%xcc,	%g1,	%g5
loop_897:
	fbo	%fcc1,	loop_898
	smul	%o6,	0x0B48,	%g3
	sll	%g4,	%i0,	%o3
	fbue	%fcc3,	loop_899
loop_898:
	fxor	%f26,	%f6,	%f10
	addccc	%l1,	0x1DD9,	%o4
	set	0x50, %o1
	ldstuba	[%l7 + %o1] 0x10,	%g6
loop_899:
	sub	%i1,	%l5,	%i3
	movne	%icc,	%l0,	%i4
	bneg,a,pt	%xcc,	loop_900
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x3
	array32	%i7,	%g2,	%o7
loop_900:
	fmovsle	%xcc,	%f1,	%f26
	stx	%i2,	[%l7 + 0x78]
	udiv	%l4,	0x1159,	%o1
	fblg,a	%fcc3,	loop_901
	orncc	%o0,	%i5,	%o2
	fornot2	%f2,	%f14,	%f24
	array8	%g7,	%l2,	%l6
loop_901:
	bvs,a,pn	%icc,	loop_902
	andncc	%o5,	%i6,	%g1
	tl	%icc,	0x2
	call	loop_903
loop_902:
	array32	%g5,	%o6,	%g3
	ldx	[%l7 + 0x10],	%g4
	xnorcc	%i0,	%o3,	%l1
loop_903:
	brnz	%o4,	loop_904
	subcc	%l3,	%i1,	%g6
	flush	%l7 + 0x10
	ldstub	[%l7 + 0x67],	%l5
loop_904:
	tvc	%xcc,	0x5
	orncc	%i3,	%l0,	%i4
	fmovd	%f4,	%f22
	movg	%xcc,	%i7,	%o7
	fmovrslz	%i2,	%f31,	%f28
	te	%xcc,	0x4
	set	0x54, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l4
	movrlz	%o1,	0x202,	%o0
	set	0x6C, %l1
	sta	%f10,	[%l7 + %l1] 0x10
	ldd	[%l7 + 0x10],	%g2
	fmovse	%xcc,	%f11,	%f10
	orcc	%i5,	%o2,	%l2
	fcmple32	%f0,	%f12,	%g7
	nop
	setx	0x4A71DFAAB1CB7A64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4719D05C2452E55A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f16,	%f22
	fsrc2s	%f27,	%f10
	movcc	%xcc,	%l6,	%i6
	tn	%xcc,	0x0
	ld	[%l7 + 0x0C],	%f5
	addcc	%g1,	%o5,	%g5
	alignaddr	%g3,	%g4,	%o6
	move	%xcc,	%o3,	%l1
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f16
	andcc	%i0,	0x09DE,	%o4
	bg	loop_905
	movrlez	%l3,	%i1,	%l5
	array16	%g6,	%i3,	%i4
	fmovdneg	%icc,	%f24,	%f4
loop_905:
	fmovsvc	%icc,	%f30,	%f20
	ldub	[%l7 + 0x6B],	%l0
	fones	%f0
	fble	%fcc1,	loop_906
	mulscc	%i7,	0x1361,	%i2
	set	0x40, %i5
	stxa	%l4,	[%l7 + %i5] 0x80
loop_906:
	sdiv	%o7,	0x16C5,	%o1
	brz	%o0,	loop_907
	movrne	%g2,	0x392,	%i5
	edge32l	%o2,	%l2,	%l6
	te	%xcc,	0x1
loop_907:
	tvc	%icc,	0x0
	edge8ln	%i6,	%g7,	%o5
	fbn	%fcc1,	loop_908
	add	%g5,	0x029F,	%g1
	xorcc	%g4,	%o6,	%o3
	xor	%l1,	%g3,	%i0
loop_908:
	fmovrdlez	%o4,	%f0,	%f2
	fmovsle	%xcc,	%f15,	%f12
	movvc	%icc,	%l3,	%i1
	sth	%g6,	[%l7 + 0x7E]
	movrgez	%i3,	%i4,	%l0
	subccc	%l5,	%i7,	%l4
	sll	%i2,	0x06,	%o7
	fxor	%f28,	%f28,	%f24
	lduh	[%l7 + 0x66],	%o1
	movne	%icc,	%g2,	%o0
	ble,pt	%xcc,	loop_909
	move	%xcc,	%o2,	%l2
	fands	%f1,	%f13,	%f9
	nop
	fitod	%f2,	%f18
	fdtoi	%f18,	%f13
loop_909:
	tsubcctv	%i5,	%l6,	%i6
	edge16l	%o5,	%g5,	%g1
	tvs	%icc,	0x3
	faligndata	%f8,	%f22,	%f26
	bge,pn	%xcc,	loop_910
	brgz,a	%g7,	loop_911
	andcc	%g4,	%o3,	%l1
	edge8n	%g3,	%o6,	%o4
loop_910:
	movre	%l3,	0x18A,	%i1
loop_911:
	fmovdne	%icc,	%f6,	%f17
	fpadd32s	%f19,	%f26,	%f23
	sdivx	%i0,	0x1778,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc3,	loop_912
	movleu	%xcc,	%i3,	%i4
	movcs	%icc,	%l5,	%l0
	move	%xcc,	%l4,	%i7
loop_912:
	membar	0x1B
	ta	%icc,	0x6
	udivcc	%i2,	0x1AC1,	%o1
	call	loop_913
	bleu,pn	%icc,	loop_914
	fands	%f20,	%f7,	%f26
	movcc	%icc,	%g2,	%o0
loop_913:
	orncc	%o7,	0x142D,	%o2
loop_914:
	movvs	%xcc,	%l2,	%l6
	fmovdneg	%xcc,	%f1,	%f0
	edge16l	%i6,	%o5,	%i5
	fornot2s	%f17,	%f9,	%f29
	set	0x24, %i0
	sta	%f15,	[%l7 + %i0] 0x19
	set	0x44, %g1
	swapa	[%l7 + %g1] 0x19,	%g5
	andncc	%g7,	%g4,	%g1
	edge32ln	%l1,	%g3,	%o6
	movl	%icc,	%o4,	%l3
	fexpand	%f16,	%f6
	tneg	%icc,	0x2
	swap	[%l7 + 0x74],	%i1
	fcmpgt32	%f20,	%f2,	%i0
	array8	%g6,	%o3,	%i3
	movrlz	%i4,	%l5,	%l4
	sdivx	%l0,	0x1FEE,	%i2
	orcc	%i7,	%o1,	%g2
	srax	%o0,	%o7,	%o2
	ldx	[%l7 + 0x28],	%l6
	and	%i6,	%o5,	%i5
	stw	%g5,	[%l7 + 0x68]
	te	%xcc,	0x6
	fmul8ulx16	%f30,	%f4,	%f2
	fmovrdgez	%l2,	%f22,	%f22
	nop
	fitod	%f2,	%f12
	fdtoi	%f12,	%f3
	faligndata	%f2,	%f6,	%f20
	smulcc	%g4,	%g7,	%l1
	subc	%g1,	%g3,	%o6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	call	loop_915
	nop
	setx	0x7CC62CCF0DAD7FC7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x76549D4F48DFABCB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f4,	%f6
	srl	%l3,	0x07,	%i1
	tvc	%xcc,	0x5
loop_915:
	andn	%g6,	%i0,	%o3
	bvc,a,pn	%icc,	loop_916
	edge16l	%i3,	%i4,	%l5
	fmovdg	%xcc,	%f15,	%f30
	mova	%xcc,	%l4,	%i2
loop_916:
	ba,pt	%icc,	loop_917
	nop
	set	0x40, %l4
	ldsw	[%l7 + %l4],	%l0
	fmovsn	%xcc,	%f5,	%f22
	fpadd32s	%f23,	%f12,	%f5
loop_917:
	nop
	set	0x54, %i7
	ldswa	[%l7 + %i7] 0x10,	%i7
	fbl,a	%fcc2,	loop_918
	fbe	%fcc3,	loop_919
	sdivx	%o1,	0x0D0D,	%o0
	alignaddr	%g2,	%o2,	%l6
loop_918:
	fnors	%f25,	%f7,	%f25
loop_919:
	tpos	%icc,	0x5
	edge32l	%o7,	%o5,	%i6
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmpeq16	%f10,	%f18,	%i5
	and	%g5,	%l2,	%g7
	bcc,pt	%icc,	loop_920
	edge32ln	%l1,	%g4,	%g1
	movpos	%icc,	%g3,	%o6
	andcc	%o4,	0x0810,	%i1
loop_920:
	movrlez	%g6,	0x2E0,	%l3
	andncc	%o3,	%i3,	%i4
	addcc	%l5,	0x1A5F,	%i0
	alignaddr	%l4,	%l0,	%i7
	bne,a	loop_921
	bpos,a,pn	%icc,	loop_922
	edge32ln	%i2,	%o0,	%o1
	umul	%o2,	%g2,	%l6
loop_921:
	fmul8x16au	%f12,	%f18,	%f28
loop_922:
	tl	%icc,	0x6
	nop
	setx	0x2718374A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x25DB14A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f12,	%f24
	fba,a	%fcc2,	loop_923
	andn	%o7,	%o5,	%i5
	sub	%i6,	0x1987,	%l2
	taddcc	%g7,	0x00B8,	%g5
loop_923:
	ldub	[%l7 + 0x68],	%g4
	andn	%g1,	%g3,	%o6
	fnand	%f14,	%f14,	%f20
	bn,a,pt	%icc,	loop_924
	movg	%xcc,	%l1,	%o4
	bneg,a,pn	%icc,	loop_925
	fpadd32	%f8,	%f24,	%f2
loop_924:
	tsubcc	%i1,	%l3,	%g6
	sub	%o3,	0x0A15,	%i3
loop_925:
	fmul8x16au	%f24,	%f18,	%f22
	xnor	%l5,	0x1032,	%i0
	edge32ln	%l4,	%l0,	%i4
	edge8n	%i2,	%o0,	%i7
	fbu,a	%fcc0,	loop_926
	nop
	setx	loop_927,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe	%fcc1,	loop_928
	movrgez	%o1,	%o2,	%l6
loop_926:
	fandnot1s	%f19,	%f10,	%f3
loop_927:
	subcc	%o7,	%o5,	%i5
loop_928:
	movn	%icc,	%i6,	%g2
	ld	[%l7 + 0x60],	%f24
	fcmpeq16	%f18,	%f2,	%l2
	fble,a	%fcc2,	loop_929
	faligndata	%f12,	%f10,	%f26
	umulcc	%g5,	%g4,	%g7
	sub	%g1,	%g3,	%o6
loop_929:
	movneg	%xcc,	%o4,	%i1
	movcc	%xcc,	%l3,	%l1
	edge8n	%g6,	%o3,	%l5
	srl	%i0,	%i3,	%l0
	movneg	%icc,	%i4,	%l4
	movrne	%i2,	%o0,	%i7
	smulcc	%o2,	0x0E2B,	%o1
	lduh	[%l7 + 0x56],	%l6
	movgu	%xcc,	%o7,	%i5
	fmovrdlez	%o5,	%f30,	%f14
	tsubcctv	%i6,	%l2,	%g5
	movl	%xcc,	%g2,	%g4
	tne	%icc,	0x5
	fmul8ulx16	%f0,	%f6,	%f6
	bgu	%xcc,	loop_930
	movgu	%xcc,	%g1,	%g3
	smul	%o6,	0x0894,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_930:
	fbul	%fcc1,	loop_931
	tleu	%icc,	0x0
	fmovrse	%i1,	%f26,	%f7
	fbe,a	%fcc1,	loop_932
loop_931:
	ta	%xcc,	0x7
	bn,a,pn	%xcc,	loop_933
	tl	%xcc,	0x1
loop_932:
	brgz,a	%l3,	loop_934
	movl	%xcc,	%g7,	%l1
loop_933:
	movg	%icc,	%o3,	%l5
	subcc	%g6,	%i3,	%i0
loop_934:
	subccc	%l0,	0x0594,	%i4
	or	%l4,	%i2,	%o0
	nop
	setx	loop_935,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16ln	%i7,	%o1,	%l6
	bcs,a	loop_936
	bgu,a,pt	%xcc,	loop_937
loop_935:
	nop
	setx	0x467DDA0CD0635D7E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	add	%o2,	0x193F,	%i5
loop_936:
	edge16l	%o7,	%o5,	%i6
loop_937:
	movrgz	%l2,	0x028,	%g2
	fpsub32s	%f6,	%f30,	%f26
	stw	%g4,	[%l7 + 0x6C]
	bge,a	%xcc,	loop_938
	ldd	[%l7 + 0x68],	%f16
	movrne	%g5,	0x3C9,	%g1
	srl	%o6,	0x00,	%o4
loop_938:
	nop
	set	0x64, %i1
	lduba	[%l7 + %i1] 0x0c,	%i1
	sra	%l3,	0x04,	%g7
	stx	%g3,	[%l7 + 0x20]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a	%icc,	loop_939
	nop
	setx	0x8CCE86D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x39D0AA06,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f10,	%f24
	bcs,pt	%icc,	loop_940
	fbne,a	%fcc0,	loop_941
loop_939:
	fexpand	%f3,	%f30
	stx	%o3,	[%l7 + 0x70]
loop_940:
	sub	%l1,	%g6,	%i3
loop_941:
	movgu	%icc,	%i0,	%l5
	fmovdge	%icc,	%f30,	%f23
	xnorcc	%i4,	%l4,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x34] %asi,	%o0
	subcc	%i7,	%o1,	%i2
	edge32n	%o2,	%i5,	%o7
	edge32	%o5,	%i6,	%l6
	movrlez	%g2,	%l2,	%g4
	fmovrsne	%g1,	%f4,	%f19
	fsrc2s	%f13,	%f25
	tleu	%xcc,	0x2
	xnor	%o6,	%g5,	%i1
	orcc	%o4,	%g7,	%l3
	tsubcc	%o3,	0x1FCF,	%l1
	edge16	%g3,	%g6,	%i0
	subcc	%i3,	%i4,	%l5
	fsrc2s	%f4,	%f14
	umulcc	%l4,	%l0,	%i7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i2
	fnand	%f6,	%f6,	%f30
	movl	%xcc,	%o0,	%o2
	subc	%o7,	%o5,	%i5
	umul	%l6,	%g2,	%i6
	faligndata	%f26,	%f14,	%f10
	bcs,a,pt	%xcc,	loop_942
	fcmpgt32	%f24,	%f10,	%g4
	sdivcc	%l2,	0x1B90,	%o6
	taddcctv	%g1,	0x03D4,	%i1
loop_942:
	or	%o4,	0x1A53,	%g7
	subccc	%l3,	%o3,	%l1
	fmovsvs	%icc,	%f1,	%f17
	umul	%g5,	0x1A3F,	%g3
	subc	%g6,	%i3,	%i0
	fmovdg	%xcc,	%f8,	%f1
	movn	%xcc,	%i4,	%l4
	srl	%l0,	%l5,	%o1
	brlz	%i2,	loop_943
	tcs	%xcc,	0x4
	fsrc2	%f0,	%f6
	tl	%icc,	0x1
loop_943:
	movge	%xcc,	%i7,	%o0
	fbne	%fcc3,	loop_944
	edge16	%o7,	%o5,	%o2
	set	0x78, %o6
	ldsha	[%l7 + %o6] 0x89,	%l6
loop_944:
	brz	%g2,	loop_945
	fmovdvs	%xcc,	%f21,	%f11
	tle	%icc,	0x3
	fpadd32	%f26,	%f26,	%f2
loop_945:
	movrlez	%i6,	%g4,	%l2
	fbn,a	%fcc1,	loop_946
	nop
	setx	0x0783BD0C3D14DEBF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x75EBC07B5014EB22,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f24,	%f2
	tl	%icc,	0x2
	movl	%xcc,	%i5,	%g1
loop_946:
	fba	%fcc2,	loop_947
	sir	0x1336
	taddcc	%o6,	%i1,	%o4
	flush	%l7 + 0x20
loop_947:
	mulx	%g7,	%o3,	%l3
	membar	0x1D
	fmovsa	%xcc,	%f8,	%f14
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x17] %asi,	%g5
	mulscc	%g3,	0x0FB1,	%g6
	tg	%icc,	0x0
	and	%l1,	0x07D6,	%i3
	tle	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i4
	fornot1	%f22,	%f26,	%f6
	fzero	%f0
	mulscc	%l4,	%l0,	%i0
	stbar
	tsubcctv	%l5,	0x1769,	%i2
	call	loop_948
	fbe,a	%fcc1,	loop_949
	move	%xcc,	%i7,	%o1
	addc	%o0,	0x1686,	%o7
loop_948:
	edge32l	%o2,	%l6,	%o5
loop_949:
	brlz,a	%i6,	loop_950
	fble,a	%fcc2,	loop_951
	tne	%icc,	0x5
	sub	%g2,	%l2,	%i5
loop_950:
	bgu,a,pt	%xcc,	loop_952
loop_951:
	umul	%g1,	0x08D3,	%g4
	edge8	%i1,	%o6,	%o4
	movrgez	%o3,	0x08F,	%g7
loop_952:
	mulx	%l3,	%g5,	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%i3
	movge	%icc,	%l1,	%l4
	bcs,pn	%xcc,	loop_953
	nop
	setx	0x10477978,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	or	%i4,	%i0,	%l0
	movrlez	%l5,	0x3AF,	%i7
loop_953:
	movl	%icc,	%o1,	%i2
	fmovrsne	%o7,	%f5,	%f23
	set	0x4C, %g5
	lduha	[%l7 + %g5] 0x19,	%o0
	fbl	%fcc2,	loop_954
	edge16n	%l6,	%o5,	%o2
	tpos	%icc,	0x6
	sdivx	%g2,	0x0521,	%i6
loop_954:
	andcc	%l2,	0x1AD8,	%g1
	udiv	%i5,	0x044F,	%i1
	fandnot1s	%f10,	%f28,	%f0
	fbug	%fcc1,	loop_955
	nop
	set	0x6B, %i2
	ldub	[%l7 + %i2],	%g4
	movvs	%xcc,	%o4,	%o3
	movl	%xcc,	%o6,	%l3
loop_955:
	ta	%icc,	0x4
	nop
	setx loop_956, %l0, %l1
	jmpl %l1, %g5
	tpos	%xcc,	0x3
	sra	%g6,	%g3,	%g7
	movvc	%icc,	%i3,	%l1
loop_956:
	sdiv	%l4,	0x0429,	%i4
	sdivx	%i0,	0x0BA4,	%l0
	fcmpeq32	%f30,	%f28,	%i7
	fmovsneg	%icc,	%f25,	%f21
	nop
	setx loop_957, %l0, %l1
	jmpl %l1, %o1
	fnot1s	%f19,	%f24
	tsubcc	%l5,	%o7,	%i2
	movvs	%xcc,	%l6,	%o5
loop_957:
	fmovscs	%icc,	%f11,	%f19
	brgez,a	%o0,	loop_958
	fmovsne	%icc,	%f4,	%f15
	set	0x55, %o3
	ldsba	[%l7 + %o3] 0x81,	%g2
loop_958:
	ldd	[%l7 + 0x30],	%f22
	fmovsle	%icc,	%f9,	%f3
	edge8ln	%o2,	%l2,	%g1
	tsubcctv	%i5,	0x1EB5,	%i1
	srl	%g4,	%o4,	%o3
	srax	%i6,	0x07,	%l3
	movcs	%xcc,	%g5,	%o6
	taddcctv	%g3,	0x15C2,	%g7
	ta	%icc,	0x6
	movg	%xcc,	%g6,	%i3
	fmovrsgez	%l4,	%f12,	%f1
	tn	%xcc,	0x4
	movrne	%l1,	0x0CA,	%i4
	movge	%icc,	%i0,	%l0
	smulcc	%o1,	0x0FBA,	%i7
	tleu	%xcc,	0x0
	movge	%xcc,	%o7,	%l5
	fsrc2s	%f0,	%f30
	andcc	%i2,	%o5,	%o0
	fbg,a	%fcc3,	loop_959
	bgu	loop_960
	xnor	%g2,	0x1991,	%o2
	sub	%l2,	0x0141,	%g1
loop_959:
	xnorcc	%i5,	%i1,	%g4
loop_960:
	smulcc	%l6,	%o3,	%o4
	subccc	%i6,	%l3,	%g5
	tsubcc	%g3,	%o6,	%g6
	bl,a	%xcc,	loop_961
	tvs	%xcc,	0x5
	movpos	%xcc,	%g7,	%i3
	mulscc	%l4,	%l1,	%i0
loop_961:
	subc	%l0,	%o1,	%i7
	add	%o7,	%l5,	%i4
	sdiv	%o5,	0x19D7,	%o0
	te	%icc,	0x1
	fbge	%fcc0,	loop_962
	nop
	setx	loop_963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdpos	%xcc,	%f22,	%f27
	andn	%i2,	0x10C5,	%g2
loop_962:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l2
loop_963:
	movl	%xcc,	%o2,	%i5
	edge32n	%g1,	%g4,	%l6
	nop
	fitos	%f4,	%f12
	fstod	%f12,	%f12
	fors	%f20,	%f20,	%f19
	sethi	0x032D,	%o3
	fsrc2	%f28,	%f26
	ldub	[%l7 + 0x3C],	%i1
	orncc	%o4,	0x0D82,	%i6
	bneg,a,pn	%icc,	loop_964
	srlx	%l3,	0x15,	%g3
	nop
	setx loop_965, %l0, %l1
	jmpl %l1, %o6
	bn	loop_966
loop_964:
	movne	%xcc,	%g5,	%g7
	bne,pn	%xcc,	loop_967
loop_965:
	fba,a	%fcc0,	loop_968
loop_966:
	fmovscs	%icc,	%f13,	%f16
	edge8l	%g6,	%i3,	%l1
loop_967:
	array16	%i0,	%l0,	%l4
loop_968:
	fmovrdgz	%o1,	%f14,	%f10
	alignaddr	%o7,	%i7,	%l5
	popc	%i4,	%o5
	ldsh	[%l7 + 0x6A],	%o0
	edge8l	%i2,	%l2,	%g2
	fnors	%f14,	%f28,	%f5
	fcmple16	%f10,	%f24,	%o2
	xnorcc	%i5,	%g1,	%g4
	fmovsn	%xcc,	%f12,	%f31
	movneg	%xcc,	%o3,	%l6
	movvs	%icc,	%i1,	%i6
	nop
	setx	0xE05809FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	udivcc	%o4,	0x1D15,	%g3
	addcc	%l3,	%o6,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%g7,	%f9,	%f4
	fsrc2s	%f11,	%f8
	bcc,a	loop_969
	array16	%g6,	%l1,	%i3
	fmovscs	%icc,	%f18,	%f28
	fsrc1s	%f23,	%f27
loop_969:
	stb	%l0,	[%l7 + 0x5C]
	addc	%l4,	0x04A2,	%o1
	popc	%o7,	%i7
	bl,a,pn	%icc,	loop_970
	fornot2	%f0,	%f30,	%f20
	fbge,a	%fcc3,	loop_971
	movge	%icc,	%l5,	%i0
loop_970:
	tle	%icc,	0x2
	edge8n	%i4,	%o5,	%o0
loop_971:
	edge32n	%i2,	%g2,	%o2
	mulx	%l2,	%g1,	%i5
	nop
	fitos	%f2,	%f30
	fstox	%f30,	%f8
	smulcc	%o3,	0x073F,	%g4
	sll	%i1,	%i6,	%l6
	sir	0x03BD
	udivx	%g3,	0x0FEA,	%o4
	array32	%o6,	%g5,	%g7
	tneg	%icc,	0x4
	movpos	%icc,	%l3,	%l1
	tsubcc	%g6,	0x16BF,	%l0
	srax	%i3,	%l4,	%o7
	addc	%i7,	0x16B4,	%o1
	fnand	%f14,	%f18,	%f28
	edge16l	%l5,	%i4,	%i0
	smul	%o5,	%i2,	%g2
	ldsh	[%l7 + 0x3A],	%o2
	set	0x38, %g7
	ldxa	[%l7 + %g7] 0x0c,	%l2
	movg	%xcc,	%o0,	%i5
	movrlz	%g1,	0x310,	%o3
	fpack32	%f0,	%f6,	%f4
	fmovsvs	%icc,	%f3,	%f14
	smul	%g4,	%i1,	%l6
	nop
	setx	0x6076A57C,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	sub	%i6,	%o4,	%g3
	and	%o6,	0x1BA9,	%g7
	add	%g5,	%l3,	%g6
	andcc	%l0,	%l1,	%l4
	udivcc	%i3,	0x12CA,	%o7
	movrgez	%i7,	%o1,	%l5
	add	%i4,	0x123C,	%i0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x19,	%f0
	nop
	fitos	%f4,	%f29
	bvs	loop_972
	orn	%i2,	%o5,	%g2
	edge8l	%o2,	%l2,	%o0
	tn	%icc,	0x2
loop_972:
	fmovrslz	%g1,	%f16,	%f31
	fmul8ulx16	%f12,	%f8,	%f28
	fmovrdne	%o3,	%f10,	%f14
	set	0x50, %g6
	stha	%i5,	[%l7 + %g6] 0x18
	edge32	%g4,	%i1,	%l6
	fmovsle	%icc,	%f3,	%f0
	tleu	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	pdist	%f24,	%f0,	%f2
	xnor	%g3,	0x0D68,	%o4
	move	%xcc,	%o6,	%g5
	sdivx	%g7,	0x01D7,	%l3
	array16	%g6,	%l0,	%l1
	fcmpgt16	%f12,	%f18,	%l4
	fnot1s	%f13,	%f11
	movvc	%icc,	%i3,	%i7
	fmovdpos	%icc,	%f15,	%f14
	tneg	%xcc,	0x3
	movpos	%xcc,	%o7,	%l5
	brz	%o1,	loop_973
	fpack32	%f26,	%f6,	%f22
	array8	%i4,	%i2,	%i0
	movvc	%icc,	%o5,	%g2
loop_973:
	edge32l	%o2,	%o0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x1
	fmovrse	%o3,	%f16,	%f31
	andncc	%g1,	%i5,	%g4
	edge8ln	%i1,	%l6,	%g3
	andn	%o4,	%i6,	%g5
	tg	%icc,	0x4
	bpos,a,pt	%xcc,	loop_974
	movle	%icc,	%o6,	%g7
	xor	%g6,	0x1DC9,	%l3
	std	%f10,	[%l7 + 0x50]
loop_974:
	nop
	setx	0xC76B918F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x31A2476E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f18,	%f8
	addcc	%l1,	0x1895,	%l0
	sll	%i3,	%i7,	%o7
	bneg,a	loop_975
	tl	%icc,	0x2
	tsubcctv	%l4,	0x11E3,	%o1
	fnor	%f0,	%f14,	%f14
loop_975:
	movre	%l5,	%i4,	%i2
	lduw	[%l7 + 0x2C],	%i0
	taddcc	%g2,	%o5,	%o2
	be,a,pt	%icc,	loop_976
	movcs	%icc,	%l2,	%o3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x75] %asi,	%o0
loop_976:
	addccc	%i5,	0x006D,	%g4
	andcc	%i1,	0x0166,	%g1
	tleu	%xcc,	0x5
	movrlez	%g3,	%l6,	%i6
	srl	%g5,	%o4,	%g7
	nop
	setx	0xDA7ED42407CD5E04,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2B5FA1A4B5168524,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f22,	%f12
	add	%o6,	0x0859,	%l3
	sdivcc	%g6,	0x135C,	%l1
	flush	%l7 + 0x10
	tl	%xcc,	0x1
	movcc	%icc,	%i3,	%i7
	orncc	%o7,	%l0,	%l4
	tleu	%xcc,	0x2
	bl	loop_977
	fexpand	%f28,	%f26
	bne	loop_978
	movrne	%o1,	0x307,	%l5
loop_977:
	nop
	set	0x60, %l5
	lduw	[%l7 + %l5],	%i4
	set	0x1F, %i4
	ldstuba	[%l7 + %i4] 0x89,	%i2
loop_978:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%g2,	%o5
	subcc	%o2,	0x15F0,	%l2
	fba	%fcc1,	loop_979
	fbg,a	%fcc1,	loop_980
	xnor	%i0,	0x0F7A,	%o3
	tsubcc	%i5,	0x0A65,	%g4
loop_979:
	smul	%i1,	0x0D59,	%o0
loop_980:
	or	%g3,	%g1,	%i6
	tg	%xcc,	0x1
	udivx	%l6,	0x182B,	%g5
	nop
	setx	0x410A180BCFDCA6FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5A79AD9FA425AF24,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f24,	%f10
	add	%g7,	%o6,	%o4
	xorcc	%l3,	0x1601,	%g6
	sdivx	%l1,	0x0919,	%i3
	fmovdn	%xcc,	%f9,	%f30
	andn	%i7,	0x01BA,	%l0
	fbg	%fcc1,	loop_981
	fabss	%f26,	%f3
	fpsub32	%f12,	%f2,	%f30
	lduh	[%l7 + 0x62],	%o7
loop_981:
	srax	%o1,	%l4,	%l5
	fbug,a	%fcc1,	loop_982
	lduh	[%l7 + 0x6C],	%i2
	brlz,a	%g2,	loop_983
	fbue	%fcc3,	loop_984
loop_982:
	edge32n	%i4,	%o5,	%l2
	bne,a	loop_985
loop_983:
	tg	%xcc,	0x1
loop_984:
	fbo	%fcc2,	loop_986
	te	%icc,	0x6
loop_985:
	orn	%o2,	0x12AB,	%i0
	tcs	%icc,	0x3
loop_986:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x58] %asi,	%i5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x15,	%f16
	umul	%o3,	%g4,	%o0
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	move	%icc,	%i1,	%g3
	addcc	%i6,	%l6,	%g5
	ta	%icc,	0x4
	tleu	%icc,	0x2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	tg	%icc,	0x1
	sra	%o6,	%g1,	%o4
	bgu,a	loop_987
	edge32n	%g6,	%l1,	%i3
	bge,a,pn	%xcc,	loop_988
	bleu,pt	%icc,	loop_989
loop_987:
	edge8	%l3,	%l0,	%o7
	call	loop_990
loop_988:
	prefetch	[%l7 + 0x38],	 0x3
loop_989:
	andn	%o1,	%i7,	%l4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x14
loop_990:
	te	%xcc,	0x5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	movle	%xcc,	%l5,	%g2
	edge16ln	%i4,	%l2,	%o2
	fandnot1s	%f19,	%f17,	%f29
	fmul8x16al	%f16,	%f13,	%f10
	sub	%o5,	0x1094,	%i0
	alignaddrl	%o3,	%g4,	%i5
	nop
	setx	0x702F491D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xE80B9A47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f30,	%f28
	stb	%o0,	[%l7 + 0x11]
	movvs	%icc,	%g3,	%i1
	bgu,a	%xcc,	loop_991
	bpos,pt	%xcc,	loop_992
	sdivx	%i6,	0x0FF2,	%l6
	fmovdne	%xcc,	%f16,	%f30
loop_991:
	subcc	%g5,	0x16D1,	%g7
loop_992:
	bg,a,pn	%icc,	loop_993
	sir	0x0D48
	edge8	%g1,	%o4,	%o6
	be,pn	%xcc,	loop_994
loop_993:
	std	%f4,	[%l7 + 0x30]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g6,	%i3
loop_994:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f31,	[%l7 + 0x44] %asi
	movgu	%icc,	%l3,	%l0
	ba,a,pt	%xcc,	loop_995
	edge32ln	%o7,	%o1,	%i7
	tsubcc	%l4,	%l1,	%l5
	tleu	%icc,	0x7
loop_995:
	taddcc	%g2,	0x1B1F,	%i2
	nop
	setx	0x85F3B6177F3FBC29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x817B6662888F5E36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f0,	%f24
	fsrc2s	%f22,	%f23
	tn	%xcc,	0x0
	fmuld8sux16	%f2,	%f0,	%f26
	addc	%l2,	%o2,	%o5
	sdivcc	%i4,	0x1DA0,	%i0
	fnegd	%f20,	%f12
	be,pn	%xcc,	loop_996
	tn	%xcc,	0x5
	wr	%g0,	0x19,	%asi
	stba	%o3,	[%l7 + 0x09] %asi
loop_996:
	subccc	%i5,	%g4,	%o0
	fmul8ulx16	%f10,	%f6,	%f18
	bgu,pn	%icc,	loop_997
	fmovd	%f18,	%f24
	fpsub16s	%f26,	%f2,	%f7
	call	loop_998
loop_997:
	ldd	[%l7 + 0x28],	%i0
	lduw	[%l7 + 0x78],	%g3
	edge32l	%i6,	%g5,	%g7
loop_998:
	alignaddrl	%l6,	%g1,	%o6
	edge8n	%g6,	%i3,	%o4
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f30
	movcs	%xcc,	%l3,	%o7
	fmovsn	%icc,	%f7,	%f6
	andcc	%l0,	0x17E5,	%i7
	movcc	%icc,	%o1,	%l1
	movvs	%icc,	%l5,	%g2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l4
	or	%l2,	%o2,	%o5
	srax	%i4,	%i2,	%o3
	sethi	0x0FE7,	%i5
	stx	%g4,	[%l7 + 0x38]
	fpsub16	%f20,	%f2,	%f12
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i0
	fornot2s	%f15,	%f10,	%f0
	fmovrdgez	%o0,	%f6,	%f16
	fxors	%f31,	%f26,	%f22
	alignaddrl	%i1,	%i6,	%g5
	nop
	setx	loop_999,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%g7,	%g3,	%l6
	fcmple16	%f8,	%f6,	%g1
	bcc	loop_1000
loop_999:
	tcs	%xcc,	0x0
	fnot1	%f20,	%f28
	subccc	%g6,	0x1A47,	%o6
loop_1000:
	movg	%xcc,	%o4,	%l3
	fornot1s	%f3,	%f4,	%f18
	lduh	[%l7 + 0x38],	%o7
	mova	%icc,	%l0,	%i3
	array32	%o1,	%i7,	%l5
	array8	%l1,	%g2,	%l4
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movcc	%xcc,	%o2,	%l2
	fpadd32s	%f4,	%f25,	%f9
	smulcc	%o5,	%i4,	%i2
	tn	%xcc,	0x5
	movle	%icc,	%i5,	%g4
	fbl,a	%fcc1,	loop_1001
	tpos	%icc,	0x4
	alignaddr	%o3,	%o0,	%i1
	tneg	%xcc,	0x3
loop_1001:
	nop
	set	0x73, %i6
	ldstuba	[%l7 + %i6] 0x11,	%i0
	andn	%g5,	%g7,	%g3
	tneg	%icc,	0x1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf0
	membar	#Sync
	xnorcc	%l6,	0x1CDD,	%i6
	edge16l	%g1,	%o6,	%o4
	ba,pn	%icc,	loop_1002
	movrgez	%l3,	%o7,	%g6
	movl	%xcc,	%l0,	%i3
	movneg	%xcc,	%o1,	%l5
loop_1002:
	alignaddrl	%i7,	%g2,	%l1
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%l4
	tvc	%xcc,	0x5
	sir	0x1BE1
	movcc	%xcc,	%l2,	%o2
	fandnot1	%f2,	%f6,	%f8
	srax	%o5,	%i4,	%i2
	ta	%icc,	0x6
	mulx	%g4,	0x1029,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x56] %asi,	%o0
	movrgz	%i1,	%i0,	%o3
	orncc	%g7,	0x039A,	%g3
	tne	%xcc,	0x6
	edge8n	%g5,	%i6,	%l6
	nop
	fitos	%f5,	%f13
	fstod	%f13,	%f16
	xorcc	%o6,	%g1,	%l3
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0x0
	edge32	%o4,	%l0,	%g6
	sdivx	%o1,	0x19A7,	%l5
	or	%i7,	0x0EFF,	%i3
	andncc	%g2,	%l4,	%l2
	addcc	%o2,	%l1,	%i4
	movne	%xcc,	%o5,	%g4
	edge32ln	%i5,	%i2,	%o0
	tl	%icc,	0x4
	array16	%i0,	%o3,	%i1
	fsrc1s	%f12,	%f27
	fmovsg	%xcc,	%f1,	%f6
	nop
	setx	0x61A409C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xB9076CF4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f27,	%f28
	movne	%xcc,	%g3,	%g7
	nop
	fitos	%f12,	%f6
	fstoi	%f6,	%f22
	edge16	%i6,	%g5,	%l6
	popc	%g1,	%o6
	add	%o7,	%o4,	%l3
	bpos,a	%icc,	loop_1003
	edge16ln	%l0,	%o1,	%l5
	array16	%g6,	%i7,	%i3
	std	%f24,	[%l7 + 0x38]
loop_1003:
	nop
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x18,	 0x3
	movg	%icc,	%g2,	%o2
	movneg	%xcc,	%l2,	%i4
	fmovdvs	%icc,	%f14,	%f1
	fbug	%fcc1,	loop_1004
	alignaddr	%l1,	%g4,	%i5
	edge16	%o5,	%i2,	%i0
	edge32	%o3,	%o0,	%i1
loop_1004:
	ldsh	[%l7 + 0x24],	%g3
	fmul8x16au	%f26,	%f28,	%f16
	tn	%xcc,	0x5
	for	%f2,	%f6,	%f26
	fornot1	%f20,	%f24,	%f16
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%i6
	fbne	%fcc1,	loop_1005
	smulcc	%g7,	%g5,	%l6
	edge8l	%g1,	%o7,	%o4
	fand	%f0,	%f16,	%f14
loop_1005:
	brlez	%o6,	loop_1006
	fand	%f6,	%f24,	%f24
	array16	%l3,	%o1,	%l5
	sll	%g6,	%l0,	%i3
loop_1006:
	srax	%l4,	0x13,	%i7
	tvc	%icc,	0x7
	ld	[%l7 + 0x08],	%f17
	subcc	%g2,	%o2,	%i4
	tleu	%icc,	0x7
	fmovdge	%xcc,	%f11,	%f18
	ta	%icc,	0x5
	bn,a	%xcc,	loop_1007
	fornot2s	%f30,	%f21,	%f14
	fmovdcc	%icc,	%f10,	%f29
	movrgez	%l1,	0x1BD,	%l2
loop_1007:
	sllx	%i5,	0x1C,	%g4
	or	%i2,	0x013D,	%i0
	te	%icc,	0x5
	andcc	%o5,	%o0,	%i1
	xorcc	%o3,	%i6,	%g3
	smul	%g5,	%l6,	%g7
	xnor	%g1,	%o7,	%o4
	fbl	%fcc3,	loop_1008
	subccc	%l3,	0x1389,	%o6
	ble,a	%xcc,	loop_1009
	or	%l5,	%g6,	%l0
loop_1008:
	movrlz	%o1,	%i3,	%i7
	xor	%l4,	0x182A,	%g2
loop_1009:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	set	0x74, %o4
	swapa	[%l7 + %o4] 0x10,	%l1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i4
	fbuge,a	%fcc0,	loop_1010
	fmul8x16au	%f12,	%f8,	%f22
	fbge	%fcc3,	loop_1011
	tge	%icc,	0x6
loop_1010:
	fmuld8ulx16	%f16,	%f2,	%f24
	fmovrdlez	%i5,	%f28,	%f28
loop_1011:
	array32	%g4,	%l2,	%i0
	fmovde	%icc,	%f16,	%f21
	fba	%fcc3,	loop_1012
	fmovspos	%xcc,	%f6,	%f10
	movleu	%icc,	%i2,	%o5
	fmovrse	%i1,	%f17,	%f15
loop_1012:
	nop
	set	0x5C, %o2
	stwa	%o0,	[%l7 + %o2] 0x0c
	tsubcc	%i6,	%g3,	%g5
	xor	%l6,	0x1E0C,	%g7
	call	loop_1013
	orncc	%o3,	0x0CD8,	%g1
	fmovsa	%xcc,	%f28,	%f4
	orn	%o7,	%l3,	%o4
loop_1013:
	bcs	loop_1014
	tneg	%xcc,	0x5
	alignaddr	%o6,	%g6,	%l5
	nop
	setx	0x24CB1E99,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f16
loop_1014:
	array32	%l0,	%o1,	%i7
	array16	%l4,	%i3,	%g2
	fpsub16	%f4,	%f12,	%f26
	tne	%icc,	0x1
	lduh	[%l7 + 0x52],	%l1
	orcc	%o2,	0x0A7D,	%i4
	popc	0x091C,	%g4
	edge32n	%l2,	%i0,	%i2
	be,a	loop_1015
	edge16n	%o5,	%i1,	%o0
	nop
	fitos	%f9,	%f5
	fstox	%f5,	%f10
	fmovsvs	%xcc,	%f16,	%f8
loop_1015:
	fbul	%fcc1,	loop_1016
	nop
	setx	0x7070B6AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	tvc	%icc,	0x2
	fpack16	%f22,	%f2
loop_1016:
	edge8	%i5,	%i6,	%g3
	sir	0x1CE3
	fxnors	%f17,	%f12,	%f26
	xor	%l6,	0x0E3B,	%g5
	movgu	%icc,	%o3,	%g7
	fcmple32	%f28,	%f16,	%g1
	sdivx	%l3,	0x0A19,	%o4
	movpos	%icc,	%o6,	%g6
	move	%icc,	%l5,	%l0
	fand	%f24,	%f4,	%f12
	subcc	%o7,	0x04EF,	%i7
	movl	%icc,	%o1,	%i3
	orn	%l4,	0x0B70,	%g2
	ldstub	[%l7 + 0x08],	%o2
	movne	%icc,	%i4,	%l1
	tn	%icc,	0x3
	edge8l	%l2,	%g4,	%i0
	stb	%o5,	[%l7 + 0x46]
	movrne	%i1,	0x1B6,	%i2
	mulx	%o0,	%i5,	%i6
	swap	[%l7 + 0x10],	%g3
	sdivcc	%g5,	0x18A4,	%o3
	fnor	%f20,	%f6,	%f0
	fmovdle	%icc,	%f1,	%f13
	fmovdvc	%xcc,	%f23,	%f27
	ldx	[%l7 + 0x78],	%g7
	fbue	%fcc2,	loop_1017
	fcmpgt16	%f16,	%f26,	%g1
	stbar
	bvs,a,pn	%icc,	loop_1018
loop_1017:
	edge8l	%l6,	%o4,	%l3
	fmovdneg	%xcc,	%f24,	%f11
	swap	[%l7 + 0x10],	%o6
loop_1018:
	taddcc	%g6,	%l0,	%l5
	movleu	%icc,	%i7,	%o1
	bvc,a	loop_1019
	tsubcctv	%i3,	%o7,	%g2
	fpack16	%f28,	%f31
	fnegs	%f31,	%f5
loop_1019:
	tg	%xcc,	0x5
	umul	%l4,	%i4,	%l1
	ld	[%l7 + 0x40],	%f0
	ldx	[%l7 + 0x20],	%l2
	tgu	%icc,	0x2
	set	0x36, %o5
	ldstuba	[%l7 + %o5] 0x11,	%g4
	udivcc	%o2,	0x1972,	%o5
	brz	%i0,	loop_1020
	movl	%xcc,	%i1,	%o0
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i2
loop_1020:
	tvs	%xcc,	0x5
	bge	loop_1021
	edge8	%i6,	%g3,	%g5
	udivx	%i5,	0x0722,	%o3
	sir	0x0ED1
loop_1021:
	xorcc	%g7,	0x0C70,	%g1
	sdiv	%l6,	0x032D,	%l3
	sir	0x0341
	edge16n	%o4,	%g6,	%o6
	nop
	fitos	%f11,	%f2
	fstoi	%f2,	%f4
	sll	%l0,	0x0A,	%i7
	subc	%l5,	0x0626,	%i3
	sdiv	%o1,	0x0BAE,	%g2
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f12
	xnor	%o7,	%i4,	%l4
	fble,a	%fcc3,	loop_1022
	fba	%fcc2,	loop_1023
	tsubcctv	%l1,	%l2,	%g4
	movcc	%icc,	%o5,	%i0
loop_1022:
	fmovdl	%icc,	%f3,	%f2
loop_1023:
	add	%i1,	0x0D0A,	%o2
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x81
	alignaddrl	%i2,	%i6,	%g3
	movrgez	%o0,	0x298,	%g5
	movge	%xcc,	%i5,	%g7
	sdivx	%o3,	0x173D,	%g1
	tg	%icc,	0x4
	edge16ln	%l3,	%l6,	%o4
	lduw	[%l7 + 0x1C],	%o6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%l0
	tle	%icc,	0x7
	array32	%l5,	%i3,	%o1
	edge32	%g2,	%i7,	%i4
	movn	%xcc,	%l4,	%o7
	nop
	setx	loop_1024,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsb	[%l7 + 0x70],	%l2
	smulcc	%l1,	0x1DA5,	%o5
	ble,a	loop_1025
loop_1024:
	movrgez	%g4,	%i1,	%o2
	set	0x7A, %g4
	ldsha	[%l7 + %g4] 0x81,	%i0
loop_1025:
	tg	%icc,	0x0
	fbu,a	%fcc0,	loop_1026
	fmovrdlz	%i6,	%f0,	%f30
	bg,pt	%icc,	loop_1027
	movre	%i2,	0x29D,	%g3
loop_1026:
	movneg	%xcc,	%g5,	%o0
	sll	%g7,	%i5,	%g1
loop_1027:
	edge8ln	%o3,	%l3,	%l6
	tle	%xcc,	0x5
	addc	%o4,	0x15E6,	%g6
	fmovscc	%icc,	%f18,	%f3
	flush	%l7 + 0x64
	nop
	fitos	%f2,	%f9
	fstox	%f9,	%f6
	fxtos	%f6,	%f9
	movl	%xcc,	%o6,	%l5
	fmovdvc	%icc,	%f19,	%f8
	movl	%xcc,	%l0,	%o1
	fmovsvc	%icc,	%f0,	%f30
	movvs	%xcc,	%g2,	%i7
	subc	%i3,	0x0DA3,	%l4
	fmovdne	%icc,	%f13,	%f30
	tvc	%icc,	0x4
	or	%i4,	0x0FA6,	%l2
	fmovsle	%icc,	%f29,	%f29
	fbo	%fcc3,	loop_1028
	add	%o7,	%o5,	%l1
	fmovs	%f12,	%f27
	fmovrdlz	%i1,	%f8,	%f16
loop_1028:
	fnegd	%f30,	%f30
	addccc	%g4,	0x04D7,	%i0
	edge16l	%o2,	%i6,	%g3
	ldsw	[%l7 + 0x18],	%g5
	popc	0x1969,	%i2
	subcc	%o0,	0x1CD5,	%i5
	nop
	setx	0xC07121C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	add	%g7,	0x1FE4,	%o3
	be,a,pt	%icc,	loop_1029
	movrgz	%l3,	%g1,	%o4
	bcs	%xcc,	loop_1030
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1029:
	orcc	%l6,	0x08E6,	%o6
	tn	%xcc,	0x5
loop_1030:
	brlez	%g6,	loop_1031
	ldstub	[%l7 + 0x28],	%l0
	movneg	%xcc,	%o1,	%g2
	movg	%icc,	%l5,	%i7
loop_1031:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i3,	%l4,	%i4
	add	%l2,	%o7,	%l1
	mova	%xcc,	%i1,	%o5
	fmovsn	%icc,	%f29,	%f23
	subc	%g4,	0x0649,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f30,	%f20
	fpsub16	%f26,	%f2,	%f0
	edge16	%i6,	%g3,	%o2
	fmovsn	%icc,	%f9,	%f2
	andcc	%g5,	0x030C,	%i2
	fmovsne	%xcc,	%f26,	%f28
	edge32ln	%o0,	%g7,	%o3
	popc	0x02B4,	%l3
	bg,a	%icc,	loop_1032
	edge32l	%g1,	%i5,	%o4
	popc	%o6,	%l6
	fpadd16s	%f24,	%f27,	%f11
loop_1032:
	addccc	%l0,	0x066D,	%o1
	bvs,a	loop_1033
	alignaddr	%g6,	%g2,	%i7
	fbul	%fcc2,	loop_1034
	bneg,a	loop_1035
loop_1033:
	fble	%fcc0,	loop_1036
	nop
	setx	0x531C1C8EB07B026C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_1034:
	ld	[%l7 + 0x50],	%f10
loop_1035:
	nop
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x0c,	%f16
loop_1036:
	fmovdne	%xcc,	%f24,	%f26
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f4
	fmovs	%f24,	%f2
	fmovda	%icc,	%f24,	%f20
	edge32n	%l5,	%l4,	%i4
	movl	%icc,	%i3,	%o7
	sllx	%l1,	%i1,	%o5
	movl	%icc,	%l2,	%i0
	nop
	setx	0x606E685B,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	tn	%xcc,	0x6
	mulscc	%g4,	%g3,	%o2
	edge32l	%i6,	%i2,	%o0
	wr	%g0,	0x18,	%asi
	stha	%g5,	[%l7 + 0x48] %asi
	edge16	%g7,	%l3,	%o3
	edge8l	%i5,	%o4,	%o6
	fxnors	%f2,	%f27,	%f12
	fxnors	%f4,	%f23,	%f9
	sub	%l6,	%l0,	%o1
	fnors	%f9,	%f31,	%f18
	nop
	setx	0x307BD74B,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fors	%f8,	%f12,	%f10
	tge	%icc,	0x0
	movne	%xcc,	%g1,	%g2
	xnor	%g6,	0x02CE,	%i7
	edge16	%l4,	%l5,	%i4
	fpsub32	%f10,	%f2,	%f30
	edge16n	%i3,	%l1,	%i1
	fmul8x16al	%f23,	%f23,	%f24
	bge,pt	%icc,	loop_1037
	fcmpeq32	%f26,	%f18,	%o5
	sth	%o7,	[%l7 + 0x24]
	bvc	%icc,	loop_1038
loop_1037:
	andn	%i0,	%l2,	%g4
	sdivx	%o2,	0x055B,	%g3
	movl	%xcc,	%i6,	%o0
loop_1038:
	movrlez	%g5,	%i2,	%l3
	orcc	%o3,	0x0CFC,	%i5
	sdiv	%g7,	0x1460,	%o6
	smulcc	%o4,	%l6,	%o1
	movne	%icc,	%g1,	%l0
	tneg	%icc,	0x3
	tvc	%icc,	0x5
	movvc	%icc,	%g6,	%i7
	nop
	set	0x62, %o1
	lduh	[%l7 + %o1],	%l4
	edge16	%g2,	%i4,	%i3
	brlez	%l5,	loop_1039
	movge	%icc,	%i1,	%o5
	sth	%o7,	[%l7 + 0x26]
	umulcc	%i0,	0x0CD2,	%l2
loop_1039:
	movneg	%xcc,	%l1,	%o2
	tcc	%xcc,	0x7
	tn	%icc,	0x6
	tge	%xcc,	0x0
	fpsub16s	%f18,	%f20,	%f4
	array8	%g4,	%g3,	%i6
	movgu	%icc,	%o0,	%g5
	add	%l3,	0x1952,	%i2
	orcc	%i5,	0x19ED,	%o3
	st	%f28,	[%l7 + 0x18]
	tn	%icc,	0x1
	movrgez	%g7,	0x399,	%o6
	taddcc	%l6,	0x0169,	%o4
	fmovrsgez	%g1,	%f15,	%f20
	movpos	%xcc,	%o1,	%g6
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x80,	%l0
	tge	%icc,	0x5
	nop
	fitos	%f3,	%f8
	fstoi	%f8,	%f14
	fmovsne	%xcc,	%f0,	%f28
	mulx	%i7,	%l4,	%i4
	fpsub32s	%f22,	%f8,	%f28
	sub	%g2,	0x16FD,	%i3
	movpos	%xcc,	%i1,	%l5
	taddcc	%o5,	%i0,	%o7
	set	0x7C, %l1
	lduwa	[%l7 + %l1] 0x14,	%l1
	bleu,pn	%icc,	loop_1040
	srlx	%o2,	%l2,	%g4
	tl	%icc,	0x3
	fblg	%fcc2,	loop_1041
loop_1040:
	brgez,a	%i6,	loop_1042
	edge32ln	%o0,	%g5,	%l3
	fands	%f24,	%f0,	%f17
loop_1041:
	stw	%i2,	[%l7 + 0x14]
loop_1042:
	edge8l	%g3,	%i5,	%g7
	fmovdn	%xcc,	%f27,	%f9
	srax	%o3,	0x14,	%l6
	smul	%o4,	%g1,	%o1
	brgz,a	%o6,	loop_1043
	smulcc	%l0,	%g6,	%i7
	orncc	%i4,	%l4,	%g2
	or	%i1,	%i3,	%o5
loop_1043:
	fmovsg	%icc,	%f11,	%f5
	fxors	%f2,	%f16,	%f15
	fmovrdne	%l5,	%f18,	%f0
	umul	%o7,	0x1017,	%l1
	fnands	%f8,	%f28,	%f30
	fmovrdlz	%o2,	%f24,	%f6
	fxnors	%f22,	%f23,	%f0
	set	0x60, %i0
	ldsha	[%l7 + %i0] 0x80,	%i0
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f6
	tne	%xcc,	0x6
	ldd	[%l7 + 0x78],	%f22
	movpos	%xcc,	%g4,	%l2
	taddcc	%i6,	%o0,	%l3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%i2
	movge	%icc,	%g3,	%g5
	movcc	%xcc,	%g7,	%i5
	edge8ln	%l6,	%o4,	%o3
	fornot1s	%f2,	%f5,	%f29
	addc	%g1,	0x0EBA,	%o6
	set	0x57, %g1
	ldstuba	[%l7 + %g1] 0x19,	%o1
	subcc	%g6,	0x0B85,	%i7
	bge,a,pn	%icc,	loop_1044
	nop
	setx	0x8FC33AA3196D296E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xAADBB81B5106AB89,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f6,	%f0
	fmovspos	%xcc,	%f30,	%f24
	nop
	setx	loop_1045,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1044:
	mulx	%l0,	%i4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a	%xcc,	loop_1046
loop_1045:
	fpsub32	%f24,	%f2,	%f8
	edge32n	%l4,	%i3,	%i1
	fmovd	%f0,	%f20
loop_1046:
	array32	%o5,	%l5,	%l1
	ta	%xcc,	0x7
	movvs	%xcc,	%o2,	%o7
	subc	%g4,	%l2,	%i0
	movrlez	%o0,	0x1F8,	%l3
	edge8	%i2,	%g3,	%i6
	edge16l	%g7,	%i5,	%l6
	array8	%o4,	%o3,	%g1
	bgu,a,pn	%xcc,	loop_1047
	edge32	%g5,	%o6,	%g6
	ble,a	loop_1048
	fbne,a	%fcc0,	loop_1049
loop_1047:
	sir	0x00C0
	movgu	%xcc,	%o1,	%l0
loop_1048:
	xnorcc	%i4,	0x0A8F,	%g2
loop_1049:
	edge8n	%l4,	%i7,	%i1
	wr	%g0,	0x19,	%asi
	stwa	%o5,	[%l7 + 0x14] %asi
	movrlez	%i3,	0x11F,	%l1
	te	%xcc,	0x1
	srax	%l5,	%o7,	%g4
	tneg	%xcc,	0x5
	wr	%g0,	0x2b,	%asi
	stwa	%o2,	[%l7 + 0x64] %asi
	membar	#Sync
	fandnot1s	%f29,	%f25,	%f25
	set	0x38, %l4
	lduha	[%l7 + %l4] 0x15,	%l2
	nop
	set	0x67, %i7
	stb	%o0,	[%l7 + %i7]
	fbge	%fcc1,	loop_1050
	tne	%xcc,	0x7
	fbe,a	%fcc2,	loop_1051
	ta	%xcc,	0x3
loop_1050:
	fbe,a	%fcc2,	loop_1052
	movneg	%icc,	%i0,	%i2
loop_1051:
	nop
	setx	0xB99472B8D3DF1618,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x460EB8592E92A25C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f22,	%f24
	edge16	%g3,	%l3,	%g7
loop_1052:
	array16	%i6,	%l6,	%i5
	movgu	%icc,	%o4,	%o3
	fpadd32	%f28,	%f16,	%f16
	srax	%g5,	%g1,	%g6
	xorcc	%o1,	0x1243,	%l0
	edge32n	%o6,	%i4,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x585AB936299EE98A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA7269B387142AB1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f6,	%f28
	add	%i7,	0x0932,	%i1
	fmovsvc	%icc,	%f27,	%f4
	fsrc1	%f20,	%f0
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f2
	fxtod	%f2,	%f20
	movl	%icc,	%l4,	%i3
	stbar
	movleu	%icc,	%l1,	%l5
	movl	%icc,	%o5,	%o7
	fbuge	%fcc2,	loop_1053
	lduh	[%l7 + 0x18],	%o2
	fmovsleu	%xcc,	%f15,	%f10
	fxnors	%f10,	%f1,	%f8
loop_1053:
	subcc	%g4,	0x1ED2,	%l2
	movpos	%xcc,	%i0,	%i2
	movge	%xcc,	%g3,	%o0
	srl	%g7,	%l3,	%i6
	std	%f12,	[%l7 + 0x08]
	tcc	%xcc,	0x2
	sllx	%l6,	%i5,	%o4
	fmul8x16	%f27,	%f0,	%f26
	movg	%icc,	%o3,	%g5
	xnor	%g1,	0x0FE5,	%g6
	tcc	%icc,	0x0
	sra	%o1,	%l0,	%o6
	subc	%i4,	%i7,	%i1
	sra	%l4,	%i3,	%g2
	fbule,a	%fcc0,	loop_1054
	tg	%icc,	0x0
	movn	%xcc,	%l1,	%l5
	edge32l	%o5,	%o2,	%o7
loop_1054:
	fnot1s	%f18,	%f8
	orcc	%g4,	0x0681,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i2,	%i0
	bg,a	loop_1055
	fmovsneg	%xcc,	%f28,	%f6
	nop
	setx loop_1056, %l0, %l1
	jmpl %l1, %o0
	edge16l	%g3,	%g7,	%i6
loop_1055:
	tl	%xcc,	0x5
	andcc	%l6,	0x098C,	%l3
loop_1056:
	edge8l	%i5,	%o3,	%o4
	orcc	%g5,	%g6,	%g1
	movle	%xcc,	%l0,	%o6
	fbl,a	%fcc2,	loop_1057
	sth	%i4,	[%l7 + 0x0C]
	movg	%icc,	%o1,	%i7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x5B] %asi,	%l4
loop_1057:
	ld	[%l7 + 0x5C],	%f27
	tl	%xcc,	0x3
	movrlez	%i3,	0x1B5,	%i1
	bneg	%icc,	loop_1058
	nop
	set	0x44, %i5
	prefetch	[%l7 + %i5],	 0x3
	srl	%l1,	%l5,	%g2
	movre	%o2,	%o7,	%o5
loop_1058:
	fmovd	%f2,	%f16
	bleu	loop_1059
	udivcc	%l2,	0x0066,	%g4
	and	%i2,	0x13ED,	%o0
	fbuge,a	%fcc1,	loop_1060
loop_1059:
	tvs	%xcc,	0x5
	fands	%f10,	%f8,	%f12
	bg,a	loop_1061
loop_1060:
	fbl,a	%fcc1,	loop_1062
	fnor	%f16,	%f16,	%f8
	edge16l	%g3,	%g7,	%i6
loop_1061:
	movne	%xcc,	%l6,	%i0
loop_1062:
	fmul8sux16	%f6,	%f30,	%f22
	xor	%i5,	%o3,	%o4
	bvc,a,pt	%xcc,	loop_1063
	fmovrdgz	%l3,	%f14,	%f20
	alignaddrl	%g6,	%g1,	%g5
	movrgez	%l0,	%i4,	%o6
loop_1063:
	taddcc	%i7,	%l4,	%i3
	umul	%o1,	%l1,	%l5
	addc	%g2,	%o2,	%i1
	tsubcc	%o5,	%l2,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x74, %i1
	lduwa	[%l7 + %i1] 0x04,	%o7
	fcmpgt16	%f20,	%f14,	%i2
	movn	%xcc,	%o0,	%g7
	tge	%icc,	0x4
	subcc	%i6,	0x03C3,	%g3
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i0
	tl	%icc,	0x4
	movne	%icc,	%i5,	%l6
	movne	%icc,	%o3,	%o4
	orcc	%g6,	%g1,	%l3
	fcmple16	%f10,	%f10,	%g5
	fone	%f20
	set	0x10, %g5
	lda	[%l7 + %g5] 0x89,	%f4
	tcc	%icc,	0x0
	fcmple32	%f4,	%f20,	%l0
	fmovsle	%xcc,	%f24,	%f11
	fabsd	%f16,	%f16
	brz	%o6,	loop_1064
	fmovsn	%icc,	%f30,	%f21
	mova	%icc,	%i7,	%i4
	movvc	%icc,	%i3,	%o1
loop_1064:
	fnot1	%f28,	%f22
	flush	%l7 + 0x28
	fones	%f16
	mova	%xcc,	%l1,	%l4
	movvs	%xcc,	%l5,	%g2
	fmovd	%f2,	%f16
	nop
	setx	0x1DCD56A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xD1F31562,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f15,	%f19
	fpadd32s	%f17,	%f16,	%f15
	tneg	%icc,	0x3
	fmuld8ulx16	%f21,	%f0,	%f30
	popc	%o2,	%i1
	tle	%xcc,	0x1
	fmovdcs	%xcc,	%f17,	%f8
	xor	%l2,	%g4,	%o7
	orn	%i2,	%o5,	%o0
	srlx	%g7,	%i6,	%g3
	edge16	%i5,	%i0,	%o3
	mulscc	%l6,	%o4,	%g1
	fbu	%fcc2,	loop_1065
	movg	%icc,	%l3,	%g6
	bcc,a	%xcc,	loop_1066
	tsubcctv	%g5,	%o6,	%l0
loop_1065:
	mova	%icc,	%i4,	%i3
	edge32	%i7,	%l1,	%o1
loop_1066:
	ldx	[%l7 + 0x78],	%l5
	brlez	%g2,	loop_1067
	bgu	%xcc,	loop_1068
	tneg	%icc,	0x6
	edge32ln	%l4,	%o2,	%l2
loop_1067:
	mulscc	%i1,	0x05EE,	%g4
loop_1068:
	fbu	%fcc1,	loop_1069
	edge32	%i2,	%o7,	%o5
	subc	%o0,	0x0C5C,	%g7
	set	0x10, %o6
	lduwa	[%l7 + %o6] 0x11,	%i6
loop_1069:
	alignaddr	%i5,	%i0,	%o3
	mova	%xcc,	%l6,	%g3
	movcs	%icc,	%o4,	%l3
	bne,a,pn	%icc,	loop_1070
	fmovsvc	%icc,	%f15,	%f8
	orn	%g1,	0x1ECE,	%g5
	orn	%g6,	0x16F8,	%l0
loop_1070:
	movrgez	%i4,	0x35C,	%i3
	ta	%xcc,	0x6
	stb	%i7,	[%l7 + 0x4E]
	nop
	setx	0x49ECE28B9BC9F7DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x145FEB971EAF9634,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f0,	%f10
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
	edge32ln	%l1,	%o6,	%o1
	srax	%l5,	0x0B,	%l4
	mulx	%o2,	%g2,	%l2
	movvs	%xcc,	%i1,	%g4
	fabss	%f2,	%f24
	fnot1s	%f21,	%f21
	fnegs	%f9,	%f21
	tsubcc	%o7,	0x0511,	%i2
	sdivcc	%o5,	0x03C6,	%o0
	wr	%g0,	0x2b,	%asi
	stxa	%i6,	[%l7 + 0x28] %asi
	membar	#Sync
	sdivx	%g7,	0x1B8E,	%i5
	tpos	%icc,	0x4
	nop
	setx	0x2973A7049051409E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fpsub16s	%f31,	%f19,	%f24
	fmovsl	%xcc,	%f8,	%f22
	fbue	%fcc2,	loop_1071
	ldd	[%l7 + 0x38],	%i0
	smul	%l6,	%g3,	%o4
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x76] %asi,	%o3
loop_1071:
	bvc,a	loop_1072
	xnor	%g1,	%l3,	%g5
	srax	%l0,	0x0C,	%i4
	movvs	%icc,	%g6,	%i3
loop_1072:
	xorcc	%i7,	0x1BC9,	%l1
	xorcc	%o1,	%l5,	%l4
	fbe	%fcc3,	loop_1073
	srl	%o6,	%o2,	%l2
	fcmpgt16	%f14,	%f2,	%i1
	fmuld8ulx16	%f3,	%f27,	%f12
loop_1073:
	fmovdgu	%icc,	%f14,	%f3
	fmul8sux16	%f4,	%f8,	%f24
	movcc	%xcc,	%g2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o7,	0x1A,	%i2
	taddcc	%o5,	0x1AE4,	%o0
	subccc	%g7,	0x1D8D,	%i6
	nop
	setx	loop_1074,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue	%fcc1,	loop_1075
	nop
	fitod	%f8,	%f28
	fdtox	%f28,	%f16
	edge16l	%i0,	%i5,	%l6
loop_1074:
	brlz	%g3,	loop_1076
loop_1075:
	prefetch	[%l7 + 0x20],	 0x3
	sll	%o4,	0x16,	%g1
	array8	%l3,	%o3,	%g5
loop_1076:
	edge32l	%l0,	%i4,	%g6
	nop
	setx	0x90CCF100,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x8CBE7F25,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f8,	%f18
	bshuffle	%f16,	%f26,	%f20
	andn	%i7,	0x13F3,	%i3
	tgu	%xcc,	0x0
	orncc	%o1,	0x040D,	%l1
	set	0x27, %g7
	stba	%l4,	[%l7 + %g7] 0x2b
	membar	#Sync
	movne	%icc,	%o6,	%o2
	movge	%icc,	%l2,	%l5
	tpos	%icc,	0x2
	fexpand	%f27,	%f20
	call	loop_1077
	tvc	%icc,	0x6
	fandnot1	%f20,	%f28,	%f12
	andncc	%i1,	%g2,	%o7
loop_1077:
	array8	%i2,	%g4,	%o0
	movvc	%icc,	%o5,	%i6
	stx	%i0,	[%l7 + 0x30]
	fpadd32	%f14,	%f30,	%f6
	ldstub	[%l7 + 0x78],	%i5
	fornot2	%f14,	%f4,	%f14
	tcs	%icc,	0x4
	fmovsneg	%icc,	%f6,	%f28
	movne	%icc,	%l6,	%g3
	srl	%g7,	0x04,	%g1
	be,pt	%icc,	loop_1078
	fbn	%fcc2,	loop_1079
	addcc	%o4,	0x0722,	%l3
	popc	%o3,	%l0
loop_1078:
	smul	%g5,	%g6,	%i7
loop_1079:
	or	%i3,	%i4,	%o1
	edge16n	%l4,	%l1,	%o6
	tcc	%icc,	0x4
	sth	%l2,	[%l7 + 0x14]
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x38] %asi
	movrne	%l5,	0x148,	%o2
	edge8	%g2,	%i1,	%i2
	movvs	%icc,	%o7,	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%i6
	nop
	setx	0x06DE43F06065AE3C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	bn,a,pn	%icc,	loop_1080
	fmovda	%icc,	%f22,	%f7
	movre	%i0,	%i5,	%l6
	bgu,a	loop_1081
loop_1080:
	tgu	%icc,	0x4
	fbule	%fcc0,	loop_1082
	xnor	%g3,	%g7,	%g4
loop_1081:
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f12
	tn	%icc,	0x1
loop_1082:
	sir	0x0EC5
	tpos	%icc,	0x6
	taddcctv	%g1,	0x1758,	%l3
	lduh	[%l7 + 0x2E],	%o4
	edge16ln	%o3,	%g5,	%l0
	fmovrsne	%g6,	%f26,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	%xcc,	loop_1083
	edge32l	%i7,	%i3,	%i4
	subccc	%o1,	0x1D25,	%l1
	fmovsneg	%xcc,	%f22,	%f2
loop_1083:
	stx	%l4,	[%l7 + 0x28]
	movcs	%xcc,	%l2,	%l5
	fpackfix	%f6,	%f21
	tpos	%xcc,	0x6
	for	%f24,	%f26,	%f22
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
	fbuge	%fcc2,	loop_1084
	move	%xcc,	%o6,	%g2
	orn	%i2,	0x0C45,	%o7
	tle	%icc,	0x4
loop_1084:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x08, %i2
	stxa	%o0,	[%l7 + %i2] 0x10
	wr	%g0,	0xe3,	%asi
	stwa	%o5,	[%l7 + 0x20] %asi
	membar	#Sync
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x1C] %asi,	%f19
	fmovda	%xcc,	%f26,	%f3
	fbue	%fcc3,	loop_1085
	movpos	%icc,	%i6,	%i0
	nop
	setx	0x77892B0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x546DCF0F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f23,	%f22
	brz	%i1,	loop_1086
loop_1085:
	nop
	set	0x5D, %l0
	stb	%i5,	[%l7 + %l0]
	fnot1	%f6,	%f18
	nop
	fitod	%f6,	%f4
	fdtos	%f4,	%f16
loop_1086:
	add	%l6,	0x1A68,	%g3
	edge32ln	%g4,	%g1,	%g7
	edge32n	%o4,	%o3,	%g5
	ldub	[%l7 + 0x66],	%l0
	tleu	%xcc,	0x2
	movpos	%xcc,	%g6,	%i7
	movge	%xcc,	%l3,	%i4
	ldd	[%l7 + 0x60],	%o0
	nop
	setx	0xFE0DB7DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x859CC404,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f15,	%f26
	edge8ln	%l1,	%l4,	%l2
	stbar
	nop
	fitos	%f9,	%f13
	fstoi	%f13,	%f1
	movrne	%l5,	%i3,	%o6
	fcmpgt32	%f18,	%f12,	%o2
	lduw	[%l7 + 0x0C],	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i2
	for	%f6,	%f26,	%f0
	fmovsg	%xcc,	%f29,	%f23
	movrlz	%o0,	%o7,	%o5
	sub	%i0,	0x176E,	%i1
	movrgz	%i6,	0x297,	%i5
	edge32n	%g3,	%l6,	%g1
	fnot2	%f14,	%f22
	fmovdn	%icc,	%f13,	%f6
	popc	%g7,	%g4
	udiv	%o3,	0x1AF9,	%o4
	sth	%l0,	[%l7 + 0x4C]
	popc	%g5,	%i7
	sdivx	%g6,	0x0E2B,	%l3
	movrne	%o1,	%i4,	%l4
	nop
	setx	0x204B934A,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	nop
	setx	loop_1087,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%l1,	0x0BFD,	%l5
	fandnot1s	%f22,	%f26,	%f25
	movn	%icc,	%i3,	%o6
loop_1087:
	fcmpne16	%f24,	%f26,	%l2
	movvs	%xcc,	%g2,	%o2
	taddcctv	%o0,	0x150A,	%o7
	andcc	%o5,	0x0626,	%i0
	movl	%xcc,	%i1,	%i2
	fpackfix	%f30,	%f2
	nop
	setx loop_1088, %l0, %l1
	jmpl %l1, %i6
	fbn,a	%fcc3,	loop_1089
	popc	%g3,	%i5
	brnz,a	%l6,	loop_1090
loop_1088:
	bcs	loop_1091
loop_1089:
	tle	%xcc,	0x1
	sllx	%g7,	0x0D,	%g4
loop_1090:
	movg	%icc,	%o3,	%o4
loop_1091:
	edge32n	%l0,	%g5,	%g1
	tle	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movpos	%icc,	%i7,	%l3
	xor	%o1,	%i4,	%l4
	fzeros	%f5
	fmul8ulx16	%f30,	%f16,	%f20
	movvc	%xcc,	%l1,	%l5
	tsubcctv	%g6,	0x1532,	%o6
	tvc	%icc,	0x3
	sllx	%l2,	0x0E,	%g2
	movneg	%icc,	%i3,	%o2
	orn	%o7,	0x097E,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%i1
	or	%i0,	%i6,	%i2
	edge16l	%i5,	%l6,	%g7
	andn	%g3,	0x1B61,	%o3
	tcs	%icc,	0x1
	movrgz	%o4,	%l0,	%g4
	mulscc	%g5,	%i7,	%g1
	udiv	%o1,	0x0230,	%i4
	udivx	%l3,	0x0143,	%l4
	movleu	%icc,	%l1,	%l5
	edge32l	%o6,	%g6,	%l2
	wr	%g0,	0x20,	%asi
	stxa	%i3,	[%g0 + 0x28] %asi
	fornot1s	%f15,	%f21,	%f30
	sdiv	%o2,	0x09F4,	%g2
	fmuld8sux16	%f20,	%f18,	%f0
	fnands	%f17,	%f27,	%f6
	edge8ln	%o7,	%o0,	%i1
	movneg	%xcc,	%o5,	%i6
	fbule,a	%fcc1,	loop_1092
	sll	%i2,	%i5,	%i0
	fsrc1	%f28,	%f2
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x54] %asi,	%l6
loop_1092:
	tvc	%icc,	0x6
	movvs	%icc,	%g7,	%o3
	sra	%o4,	0x14,	%g3
	set	0x49, %l5
	ldstuba	[%l7 + %l5] 0x0c,	%l0
	fnot2	%f12,	%f22
	sdivcc	%g5,	0x0A91,	%g4
	bvc	%icc,	loop_1093
	bg,pn	%xcc,	loop_1094
	tgu	%xcc,	0x7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x7C] %asi,	%f11
loop_1093:
	fbue	%fcc3,	loop_1095
loop_1094:
	tl	%xcc,	0x0
	ldsh	[%l7 + 0x18],	%g1
	fbg	%fcc0,	loop_1096
loop_1095:
	movne	%icc,	%o1,	%i4
	andn	%l3,	%l4,	%i7
	swap	[%l7 + 0x6C],	%l1
loop_1096:
	umul	%o6,	%l5,	%g6
	movcc	%icc,	%l2,	%o2
	stx	%i3,	[%l7 + 0x70]
	sdivcc	%o7,	0x16E0,	%g2
	fabss	%f9,	%f9
	sdivx	%o0,	0x18D1,	%o5
	fbug	%fcc3,	loop_1097
	fbuge	%fcc2,	loop_1098
	udiv	%i1,	0x1783,	%i2
	fmovrdlez	%i5,	%f8,	%f8
loop_1097:
	movg	%xcc,	%i0,	%l6
loop_1098:
	array8	%i6,	%g7,	%o3
	movgu	%icc,	%o4,	%g3
	popc	0x0269,	%l0
	movrlz	%g5,	0x272,	%g1
	taddcc	%g4,	%i4,	%o1
	tne	%xcc,	0x3
	fmul8x16au	%f12,	%f8,	%f20
	add	%l3,	0x126B,	%i7
	xorcc	%l1,	0x18AF,	%o6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x40] %asi,	%l4
	ldsw	[%l7 + 0x44],	%l5
	edge8n	%l2,	%g6,	%o2
	call	loop_1099
	movrlez	%o7,	0x375,	%g2
	sra	%i3,	%o0,	%o5
	nop
	setx	0xBDEF08C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xE9EB1C74,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f30,	%f4
loop_1099:
	tsubcctv	%i1,	%i2,	%i5
	movvc	%xcc,	%l6,	%i6
	membar	0x36
	fzeros	%f9
	subccc	%g7,	%i0,	%o4
	umulcc	%o3,	%l0,	%g3
	smul	%g5,	0x1101,	%g1
	xnorcc	%g4,	0x039D,	%o1
	xorcc	%l3,	%i4,	%i7
	movne	%xcc,	%l1,	%o6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l4,	[%g0 + 0x388] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fmovdn	%xcc,	%f0,	%f2
	bvc	loop_1100
	movrlez	%l5,	0x38A,	%l2
	array32	%g6,	%o7,	%o2
	sethi	0x14EE,	%i3
loop_1100:
	fmovdneg	%xcc,	%f30,	%f9
	nop
	setx	loop_1101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x57D920846C6A2114,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x16344E7ECC7668C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f14,	%f26
	fmul8x16au	%f4,	%f5,	%f8
	set	0x32, %g6
	lduha	[%l7 + %g6] 0x88,	%o0
loop_1101:
	nop
	fitos	%f13,	%f0
	fstod	%f0,	%f20
	tneg	%icc,	0x0
	nop
	setx	0x3A6D9884005F0688,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	edge8ln	%o5,	%g2,	%i1
	fba	%fcc2,	loop_1102
	xor	%i5,	%i2,	%i6
	movle	%xcc,	%g7,	%l6
	popc	%o4,	%o3
loop_1102:
	move	%icc,	%i0,	%l0
	brz	%g3,	loop_1103
	bgu,pn	%xcc,	loop_1104
	addc	%g1,	%g5,	%g4
	tsubcc	%o1,	%i4,	%i7
loop_1103:
	movne	%xcc,	%l1,	%o6
loop_1104:
	nop
	setx	0x66DF13D2D0680BAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	set	0x24, %l3
	sta	%f26,	[%l7 + %l3] 0x18
	stx	%l4,	[%l7 + 0x08]
	and	%l3,	0x0BB4,	%l5
	fand	%f20,	%f28,	%f12
	umulcc	%g6,	%o7,	%l2
	bgu,a	%xcc,	loop_1105
	brnz,a	%i3,	loop_1106
	sdiv	%o2,	0x1CDD,	%o5
	edge8	%g2,	%o0,	%i5
loop_1105:
	fbg,a	%fcc0,	loop_1107
loop_1106:
	fbo	%fcc1,	loop_1108
	movrgez	%i2,	%i6,	%i1
	edge16l	%l6,	%o4,	%o3
loop_1107:
	nop
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1108:
	udivcc	%g7,	0x0FB9,	%l0
	fsrc1	%f2,	%f28
	sllx	%i0,	%g3,	%g5
	brlz	%g1,	loop_1109
	swap	[%l7 + 0x7C],	%o1
	ldsw	[%l7 + 0x1C],	%i4
	sllx	%i7,	0x1D,	%l1
loop_1109:
	fornot2s	%f13,	%f9,	%f21
	sub	%g4,	%l4,	%l3
	movleu	%xcc,	%l5,	%o6
	mulx	%o7,	%g6,	%l2
	movleu	%xcc,	%i3,	%o5
	movvs	%icc,	%g2,	%o2
	fcmpne32	%f26,	%f4,	%o0
	edge16	%i5,	%i2,	%i6
	brnz	%i1,	loop_1110
	udiv	%o4,	0x1EEE,	%o3
	fmovrdgz	%g7,	%f14,	%f12
	orn	%l0,	%l6,	%i0
loop_1110:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%g1,	%g5
	movre	%o1,	0x1EE,	%i4
	umulcc	%l1,	%g4,	%i7
	brnz	%l3,	loop_1111
	tsubcc	%l5,	0x02CF,	%o6
	popc	%l4,	%g6
	sllx	%l2,	%o7,	%o5
loop_1111:
	bgu,pt	%icc,	loop_1112
	bgu,pt	%xcc,	loop_1113
	movvc	%icc,	%g2,	%o2
	tg	%xcc,	0x7
loop_1112:
	fpsub16s	%f6,	%f4,	%f0
loop_1113:
	addcc	%o0,	0x034C,	%i3
	ld	[%l7 + 0x18],	%f11
	fmovsleu	%icc,	%f2,	%f23
	edge16ln	%i5,	%i2,	%i6
	fmul8x16al	%f30,	%f10,	%f20
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brlez	%o4,	loop_1114
	fnand	%f0,	%f2,	%f18
	popc	%o3,	%i1
	ldsh	[%l7 + 0x7A],	%l0
loop_1114:
	fmovdvs	%icc,	%f14,	%f24
	edge8l	%g7,	%l6,	%g3
	sub	%i0,	%g5,	%o1
	bcs,a	loop_1115
	alignaddrl	%i4,	%g1,	%l1
	orn	%g4,	0x072F,	%l3
	set	0x00, %i4
	ldxa	[%g0 + %i4] 0x50,	%i7
loop_1115:
	xnorcc	%o6,	0x0CED,	%l4
	fba	%fcc3,	loop_1116
	movne	%icc,	%l5,	%l2
	fpadd16	%f30,	%f26,	%f6
	orn	%g6,	0x1CF5,	%o7
loop_1116:
	fnot2	%f0,	%f0
	sethi	0x0E92,	%g2
	xorcc	%o5,	0x0693,	%o0
	fmovrsne	%i3,	%f27,	%f2
	fmovsge	%xcc,	%f25,	%f5
	movrlez	%o2,	0x381,	%i2
	sll	%i6,	0x12,	%i5
	movne	%icc,	%o4,	%i1
	nop
	fitos	%f23,	%f24
	movre	%o3,	%l0,	%l6
	subccc	%g3,	%i0,	%g5
	edge8n	%o1,	%g7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g1,	%l1
	xnor	%g4,	0x034B,	%i7
	taddcctv	%l3,	%l4,	%o6
	bvs,a	%icc,	loop_1117
	umul	%l5,	0x0002,	%l2
	fmuld8sux16	%f29,	%f13,	%f0
	fones	%f15
loop_1117:
	mulscc	%o7,	0x1456,	%g6
	movg	%xcc,	%o5,	%o0
	movpos	%icc,	%g2,	%i3
	movrgz	%o2,	%i2,	%i6
	edge32	%o4,	%i1,	%i5
	srl	%l0,	0x0A,	%o3
	bpos	%icc,	loop_1118
	xnorcc	%l6,	%g3,	%i0
	fsrc2s	%f21,	%f18
	tgu	%xcc,	0x2
loop_1118:
	tsubcctv	%o1,	%g7,	%i4
	bvc	loop_1119
	nop
	setx	0x5AED4B6A8DE7D336,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD3228BD63448F004,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f16,	%f20
	sdivcc	%g1,	0x11B8,	%l1
	movcs	%icc,	%g4,	%i7
loop_1119:
	std	%f10,	[%l7 + 0x58]
	subc	%g5,	0x0F6E,	%l4
	tsubcc	%l3,	%l5,	%l2
	mulscc	%o6,	%g6,	%o5
	bg,pt	%icc,	loop_1120
	movg	%icc,	%o7,	%o0
	fmovsneg	%icc,	%f24,	%f5
	ta	%xcc,	0x3
loop_1120:
	movne	%xcc,	%g2,	%i3
	tneg	%xcc,	0x6
	movge	%icc,	%o2,	%i2
	movcc	%xcc,	%i6,	%o4
	fsrc2s	%f7,	%f18
	taddcctv	%i5,	%i1,	%o3
	alignaddrl	%l0,	%l6,	%i0
	smul	%o1,	0x0C3F,	%g3
	edge8l	%i4,	%g1,	%g7
	orcc	%l1,	%g4,	%g5
	movpos	%xcc,	%l4,	%l3
	or	%i7,	%l5,	%l2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	srlx	%g6,	%o6,	%o7
	movne	%icc,	%o0,	%g2
	taddcctv	%i3,	%o5,	%i2
	fandnot1	%f30,	%f24,	%f4
	set	0x30, %i6
	ldswa	[%l7 + %i6] 0x10,	%o2
	addcc	%o4,	%i6,	%i1
	taddcctv	%o3,	%i5,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x10,	%i0,	%o1
	xnor	%g3,	0x0E81,	%l0
	bpos,a,pt	%icc,	loop_1121
	bpos,pt	%xcc,	loop_1122
	tvs	%icc,	0x7
	fmovscs	%xcc,	%f9,	%f8
loop_1121:
	tvc	%icc,	0x0
loop_1122:
	fmul8sux16	%f16,	%f24,	%f18
	edge8	%g1,	%i4,	%l1
	brgz	%g7,	loop_1123
	tvc	%xcc,	0x3
	fbg,a	%fcc2,	loop_1124
	add	%g4,	0x1277,	%l4
loop_1123:
	sra	%g5,	0x0F,	%i7
	tn	%icc,	0x0
loop_1124:
	tl	%xcc,	0x5
	lduh	[%l7 + 0x22],	%l3
	ld	[%l7 + 0x24],	%f23
	fpack32	%f22,	%f18,	%f6
	edge8ln	%l2,	%l5,	%g6
	fmovrsgz	%o7,	%f29,	%f22
	movl	%xcc,	%o0,	%g2
	sll	%o6,	%o5,	%i2
	addcc	%i3,	%o4,	%o2
	or	%i6,	0x1D37,	%o3
	set	0x36, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i5
	udiv	%l6,	0x0A7C,	%i1
	edge32n	%o1,	%g3,	%l0
	edge8l	%i0,	%g1,	%l1
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tpos	%icc,	0x3
	membar	0x6E
	edge8n	%i4,	%g7,	%l4
	tvc	%xcc,	0x1
	fpsub16s	%f27,	%f5,	%f9
	bne,pn	%xcc,	loop_1125
	tg	%icc,	0x2
	sir	0x0787
	stb	%g5,	[%l7 + 0x50]
loop_1125:
	nop
	setx	0x379EF27D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x47184A29,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f11,	%f9
	brgez,a	%g4,	loop_1126
	movrgz	%l3,	%l2,	%l5
	tneg	%icc,	0x0
	smulcc	%g6,	0x12E1,	%i7
loop_1126:
	movrgz	%o7,	%g2,	%o6
	fmovscc	%icc,	%f15,	%f6
	fnegd	%f22,	%f18
	fblg,a	%fcc0,	loop_1127
	sllx	%o0,	%o5,	%i3
	movn	%icc,	%o4,	%i2
	subc	%i6,	0x196C,	%o3
loop_1127:
	fpsub16	%f28,	%f10,	%f22
	movcs	%xcc,	%i5,	%l6
	array8	%o2,	%o1,	%i1
	fmovdgu	%xcc,	%f16,	%f4
	mulx	%g3,	0x1F6A,	%i0
	xnor	%l0,	0x1282,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x60],	%f10
	edge8n	%i4,	%l1,	%l4
	xnor	%g5,	0x0B20,	%g4
	fnand	%f18,	%f8,	%f10
	tleu	%icc,	0x5
	fbuge	%fcc2,	loop_1128
	tleu	%xcc,	0x2
	fmovsleu	%xcc,	%f0,	%f15
	smulcc	%g7,	%l3,	%l5
loop_1128:
	fpadd16s	%f14,	%f2,	%f20
	fsrc1	%f26,	%f24
	sir	0x0746
	xorcc	%g6,	%i7,	%o7
	tvs	%xcc,	0x7
	move	%xcc,	%l2,	%g2
	sllx	%o6,	%o5,	%o0
	nop
	setx	0x707ABF36,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fblg	%fcc1,	loop_1129
	movcc	%icc,	%i3,	%o4
	movl	%xcc,	%i2,	%o3
	brlez,a	%i5,	loop_1130
loop_1129:
	movn	%xcc,	%i6,	%l6
	movrlez	%o2,	0x0A4,	%o1
	xor	%g3,	0x14CA,	%i1
loop_1130:
	andncc	%l0,	%g1,	%i4
	tgu	%xcc,	0x0
	bg	loop_1131
	addc	%i0,	0x0398,	%l1
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x04,	%f0
loop_1131:
	tne	%icc,	0x5
	nop
	setx	0xBBD7DBDED75503E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x283DCF67DC3493A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f18,	%f30
	sub	%l4,	0x0115,	%g4
	set	0x08, %g3
	lda	[%l7 + %g3] 0x80,	%f16
	ble,a	%xcc,	loop_1132
	fpadd32	%f22,	%f2,	%f8
	fmovrdgz	%g7,	%f2,	%f16
	fmovrde	%g5,	%f8,	%f10
loop_1132:
	fmovdl	%xcc,	%f6,	%f29
	sdivx	%l5,	0x1127,	%g6
	smul	%l3,	0x0D90,	%i7
	sth	%l2,	[%l7 + 0x56]
	tpos	%xcc,	0x4
	bg,pt	%xcc,	loop_1133
	fpackfix	%f18,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o7,	0x0F0C,	%g2
loop_1133:
	edge8n	%o5,	%o6,	%o0
	movrne	%i3,	0x141,	%i2
	smulcc	%o3,	0x1243,	%o4
	movgu	%icc,	%i6,	%i5
	bne,pn	%icc,	loop_1134
	bl,a,pt	%xcc,	loop_1135
	andncc	%o2,	%l6,	%g3
	movne	%icc,	%i1,	%l0
loop_1134:
	tpos	%xcc,	0x0
loop_1135:
	movpos	%xcc,	%o1,	%g1
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x30] %asi,	%i0
	ldx	[%l7 + 0x48],	%i4
	popc	0x1AA8,	%l1
	xorcc	%l4,	0x08FD,	%g7
	sdivx	%g4,	0x1930,	%g5
	movne	%xcc,	%g6,	%l5
	mova	%icc,	%i7,	%l2
	xorcc	%o7,	0x076D,	%g2
	andn	%o5,	0x0597,	%o6
	movrlez	%l3,	0x1E8,	%i3
	xor	%i2,	%o3,	%o4
	fpadd32s	%f10,	%f15,	%f29
	nop
	setx	0xE7A0CFBE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f26
	tvc	%xcc,	0x3
	edge8ln	%o0,	%i5,	%i6
	fone	%f6
	mulscc	%o2,	0x14B4,	%g3
	andncc	%i1,	%l6,	%l0
	sub	%o1,	0x072C,	%g1
	movl	%icc,	%i0,	%l1
	movn	%xcc,	%l4,	%i4
	fba,a	%fcc3,	loop_1136
	umulcc	%g7,	%g4,	%g6
	movg	%icc,	%g5,	%l5
	orn	%i7,	%o7,	%g2
loop_1136:
	movrlz	%l2,	0x02E,	%o5
	brgez	%l3,	loop_1137
	sdiv	%o6,	0x0312,	%i2
	orn	%i3,	%o3,	%o0
	fpadd32	%f8,	%f12,	%f30
loop_1137:
	srax	%i5,	0x15,	%i6
	popc	0x1A4C,	%o4
	edge8	%g3,	%o2,	%i1
	xor	%l0,	%o1,	%g1
	sllx	%l6,	0x17,	%i0
	te	%xcc,	0x0
	stb	%l1,	[%l7 + 0x7F]
	ba,pt	%xcc,	loop_1138
	orcc	%l4,	%i4,	%g4
	fmul8ulx16	%f6,	%f0,	%f30
	nop
	fitos	%f4,	%f21
	fstox	%f21,	%f8
	fxtos	%f8,	%f28
loop_1138:
	edge32ln	%g7,	%g6,	%l5
	movle	%xcc,	%g5,	%o7
	alignaddr	%i7,	%g2,	%o5
	fornot2	%f4,	%f18,	%f0
	move	%xcc,	%l2,	%o6
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%l3
	fmovsleu	%xcc,	%f8,	%f27
	movrlz	%i2,	%i3,	%o0
	tleu	%xcc,	0x5
	movgu	%xcc,	%o3,	%i6
	stbar
	nop
	set	0x74, %o2
	prefetch	[%l7 + %o2],	 0x3
	bpos,a,pt	%icc,	loop_1139
	edge8ln	%o4,	%g3,	%i5
	set	0x08, %l6
	lduha	[%l7 + %l6] 0x18,	%o2
loop_1139:
	tl	%icc,	0x1
	movle	%icc,	%i1,	%l0
	xnor	%o1,	%l6,	%g1
	andcc	%i0,	%l4,	%l1
	bg,a	loop_1140
	tge	%xcc,	0x6
	bl,pt	%icc,	loop_1141
	swap	[%l7 + 0x7C],	%i4
loop_1140:
	umulcc	%g7,	0x1285,	%g4
	fpack16	%f2,	%f19
loop_1141:
	swap	[%l7 + 0x18],	%l5
	addc	%g6,	0x1104,	%g5
	fcmpeq32	%f28,	%f8,	%i7
	smul	%o7,	%g2,	%l2
	fnegd	%f30,	%f0
	fcmpne32	%f18,	%f12,	%o6
	edge16	%l3,	%i2,	%o5
	tle	%icc,	0x0
	addccc	%i3,	0x0666,	%o0
	movrne	%o3,	%o4,	%i6
	sub	%g3,	%o2,	%i1
	movrgz	%l0,	%o1,	%l6
	tg	%icc,	0x1
	fmovda	%icc,	%f19,	%f13
	edge16	%g1,	%i0,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l1,	0x0E1E,	%i5
	sdiv	%i4,	0x130C,	%g4
	movn	%xcc,	%l5,	%g6
	umulcc	%g7,	%g5,	%o7
	smul	%i7,	0x0490,	%l2
	sir	0x0729
	popc	%o6,	%l3
	ba,pt	%icc,	loop_1142
	udivx	%g2,	0x0A97,	%o5
	edge16	%i3,	%o0,	%i2
	fmovd	%f28,	%f24
loop_1142:
	movne	%xcc,	%o3,	%o4
	fexpand	%f19,	%f0
	fmovsg	%icc,	%f22,	%f23
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x48] %asi,	%i6
	sllx	%g3,	0x17,	%o2
	movvc	%xcc,	%i1,	%l0
	brgz,a	%l6,	loop_1143
	array16	%g1,	%i0,	%l4
	edge8	%l1,	%o1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1143:
	ldd	[%l7 + 0x20],	%i4
	swap	[%l7 + 0x60],	%g4
	fcmpne32	%f10,	%f8,	%l5
	stbar
	umulcc	%g6,	%g5,	%g7
	fpadd16	%f6,	%f4,	%f0
	membar	0x62
	tg	%icc,	0x3
	movneg	%icc,	%i7,	%o7
	addc	%l2,	%o6,	%g2
	fbe	%fcc0,	loop_1144
	bpos	%icc,	loop_1145
	alignaddr	%o5,	%i3,	%l3
	add	%i2,	%o0,	%o3
loop_1144:
	fbuge	%fcc3,	loop_1146
loop_1145:
	fmovrsgz	%o4,	%f26,	%f7
	movcs	%icc,	%g3,	%i6
	sdivx	%i1,	0x1B3C,	%l0
loop_1146:
	fabsd	%f18,	%f30
	fnors	%f16,	%f31,	%f20
	edge16n	%o2,	%g1,	%l6
	mulscc	%l4,	0x1EDC,	%l1
	brgez	%o1,	loop_1147
	movrlz	%i5,	%i0,	%g4
	te	%xcc,	0x5
	nop
	setx	0x73287207,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x8AFA5756,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f23,	%f7
loop_1147:
	movpos	%xcc,	%i4,	%g6
	brnz,a	%g5,	loop_1148
	array16	%l5,	%i7,	%o7
	addccc	%g7,	%o6,	%l2
	movrlz	%g2,	0x0A7,	%i3
loop_1148:
	tgu	%icc,	0x7
	sub	%o5,	%l3,	%o0
	ldsh	[%l7 + 0x1E],	%o3
	movge	%icc,	%o4,	%g3
	tcc	%xcc,	0x6
	fmovsge	%xcc,	%f11,	%f21
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i6
	subcc	%i2,	%i1,	%l0
	movvs	%xcc,	%o2,	%l6
	set	0x38, %i3
	stha	%g1,	[%l7 + %i3] 0x14
	xnorcc	%l4,	0x13FE,	%l1
	movle	%xcc,	%i5,	%i0
	movpos	%icc,	%g4,	%i4
	tn	%xcc,	0x7
	tn	%xcc,	0x2
	sethi	0x0909,	%o1
	membar	0x60
	tsubcctv	%g5,	0x0228,	%g6
	tge	%xcc,	0x1
	fmovrdlez	%i7,	%f18,	%f28
	bn	%icc,	loop_1149
	ble,a	loop_1150
	or	%l5,	0x0C0D,	%o7
	sra	%g7,	%o6,	%l2
loop_1149:
	smul	%g2,	0x1867,	%o5
loop_1150:
	tl	%icc,	0x0
	fnor	%f8,	%f2,	%f16
	edge8n	%i3,	%o0,	%o3
	movneg	%icc,	%l3,	%o4
	move	%xcc,	%i6,	%g3
	tle	%xcc,	0x1
	movrlez	%i1,	%i2,	%l0
	movneg	%icc,	%o2,	%l6
	fmovrse	%g1,	%f28,	%f2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0E] %asi,	%l1
	array32	%l4,	%i0,	%g4
	fbue,a	%fcc3,	loop_1151
	alignaddr	%i5,	%i4,	%o1
	or	%g5,	0x1DDA,	%g6
	edge16ln	%i7,	%l5,	%o7
loop_1151:
	tpos	%icc,	0x2
	tle	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%g7
	udivx	%o6,	0x1008,	%l2
	bvs,pn	%icc,	loop_1152
	array32	%g2,	%i3,	%o5
	fmovsn	%icc,	%f25,	%f9
	srl	%o3,	%l3,	%o0
loop_1152:
	alignaddrl	%i6,	%g3,	%i1
	sth	%o4,	[%l7 + 0x3C]
	edge8ln	%l0,	%i2,	%o2
	nop
	setx	0x76AC5EC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xF25927ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f8,	%f0
	addc	%g1,	%l1,	%l4
	fbe	%fcc2,	loop_1153
	movpos	%xcc,	%l6,	%i0
	srlx	%g4,	%i5,	%o1
	orncc	%g5,	%i4,	%i7
loop_1153:
	sllx	%g6,	%l5,	%g7
	movle	%icc,	%o6,	%o7
	nop
	setx	0xD7A6B4FFF393358C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x604A3DED1A222D0C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f22,	%f0
	fmovdvs	%xcc,	%f25,	%f22
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x68] %asi,	%l2
	fzeros	%f19
	set	0x54, %g4
	stba	%g2,	[%l7 + %g4] 0x2a
	membar	#Sync
	move	%xcc,	%i3,	%o5
	edge8l	%o3,	%o0,	%l3
	fzero	%f8
	tvc	%xcc,	0x5
	tvs	%icc,	0x5
	edge32ln	%i6,	%g3,	%i1
	movrne	%o4,	%i2,	%o2
	fpack32	%f20,	%f8,	%f0
	movcc	%icc,	%g1,	%l0
	addc	%l1,	0x015D,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l4
	movgu	%icc,	%g4,	%i5
	taddcc	%o1,	0x11A9,	%i0
	fbule	%fcc2,	loop_1154
	tpos	%xcc,	0x6
	tpos	%icc,	0x3
	fmul8x16au	%f14,	%f2,	%f18
loop_1154:
	bleu,a	%xcc,	loop_1155
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f12,	%f31
	taddcc	%i4,	%i7,	%g6
loop_1155:
	bne	loop_1156
	fbu	%fcc1,	loop_1157
	fpack32	%f2,	%f28,	%f2
	edge8l	%g5,	%g7,	%o6
loop_1156:
	movrgz	%o7,	%l5,	%g2
loop_1157:
	sub	%i3,	0x0ED5,	%o5
	movneg	%xcc,	%l2,	%o3
	tge	%xcc,	0x5
	fmovsneg	%xcc,	%f2,	%f5
	stbar
	te	%icc,	0x7
	bl,a,pn	%icc,	loop_1158
	tge	%icc,	0x0
	tpos	%icc,	0x6
	fmovdgu	%icc,	%f21,	%f11
loop_1158:
	popc	%o0,	%i6
	std	%f26,	[%l7 + 0x58]
	fpadd16	%f6,	%f22,	%f8
	edge32l	%g3,	%l3,	%i1
	smulcc	%o4,	0x0FF4,	%i2
	movneg	%icc,	%o2,	%l0
	edge32n	%l1,	%g1,	%l4
	sra	%l6,	%i5,	%o1
	ble	loop_1159
	bn	loop_1160
	tsubcctv	%i0,	0x0B32,	%i4
	fpadd16s	%f21,	%f13,	%f1
loop_1159:
	udivx	%i7,	0x02F1,	%g4
loop_1160:
	fpackfix	%f0,	%f2
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ldd	[%l7 + 0x30],	%f6
	nop
	setx	0x799D3B672397FB6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x27286DA5045597BE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f4,	%f26
	fble	%fcc3,	loop_1161
	bleu,a	loop_1162
	fmovdleu	%xcc,	%f28,	%f19
	brgez,a	%g5,	loop_1163
loop_1161:
	srl	%g7,	%g6,	%o7
loop_1162:
	array16	%l5,	%g2,	%o6
	fmovsvs	%icc,	%f24,	%f14
loop_1163:
	edge16	%o5,	%l2,	%o3
	movgu	%xcc,	%o0,	%i6
	tneg	%icc,	0x6
	tpos	%icc,	0x5
	pdist	%f22,	%f28,	%f6
	nop
	setx	0x8759743E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xB1A41A30,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f2,	%f29
	ld	[%l7 + 0x5C],	%f12
	movvs	%icc,	%g3,	%l3
	orcc	%i1,	%o4,	%i3
	array32	%i2,	%l0,	%o2
	ta	%xcc,	0x0
	tle	%icc,	0x0
	fabsd	%f22,	%f18
	fabsd	%f8,	%f2
	movleu	%xcc,	%g1,	%l1
	sir	0x0E82
	andncc	%l6,	%i5,	%l4
	set	0x2D, %o0
	stba	%i0,	[%l7 + %o0] 0x2f
	membar	#Sync
	te	%icc,	0x2
	udivx	%o1,	0x0B1E,	%i4
	fandnot2	%f12,	%f26,	%f8
	movre	%g4,	%i7,	%g7
	tge	%icc,	0x2
	fmovdvs	%xcc,	%f21,	%f26
	fandnot2	%f6,	%f24,	%f24
	popc	0x0DE1,	%g6
	sdivcc	%g5,	0x0C1B,	%l5
	tn	%icc,	0x3
	sethi	0x1BED,	%o7
	bpos,pn	%icc,	loop_1164
	stx	%o6,	[%l7 + 0x48]
	fpadd32	%f28,	%f0,	%f4
	umulcc	%o5,	%l2,	%o3
loop_1164:
	fmovse	%icc,	%f1,	%f21
	xnorcc	%g2,	%i6,	%o0
	bcs	loop_1165
	sdivcc	%g3,	0x1882,	%l3
	fbge	%fcc0,	loop_1166
	fbn,a	%fcc0,	loop_1167
loop_1165:
	ble,pn	%icc,	loop_1168
	ldstub	[%l7 + 0x10],	%o4
loop_1166:
	movvc	%xcc,	%i1,	%i3
loop_1167:
	ta	%icc,	0x3
loop_1168:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f4
	for	%f14,	%f0,	%f4
	fmovrdlz	%i2,	%f26,	%f18
	tsubcc	%l0,	%g1,	%o2
	popc	%l1,	%i5
	subccc	%l6,	0x04DC,	%l4
	movle	%icc,	%o1,	%i4
	bge	%icc,	loop_1169
	array32	%g4,	%i7,	%i0
	subcc	%g7,	%g5,	%l5
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x24] %asi,	%g6
loop_1169:
	tcc	%xcc,	0x3
	tcc	%xcc,	0x0
	fba,a	%fcc3,	loop_1170
	xorcc	%o6,	0x17D3,	%o7
	edge8n	%o5,	%l2,	%g2
	addcc	%i6,	%o0,	%g3
loop_1170:
	fmovsle	%icc,	%f18,	%f23
	edge32l	%l3,	%o3,	%i1
	sth	%o4,	[%l7 + 0x5A]
	fbn	%fcc0,	loop_1171
	prefetch	[%l7 + 0x48],	 0x0
	fbo	%fcc3,	loop_1172
	fmovrde	%i2,	%f8,	%f16
loop_1171:
	array32	%i3,	%g1,	%l0
	smulcc	%l1,	%i5,	%o2
loop_1172:
	sth	%l4,	[%l7 + 0x5A]
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	for	%f10,	%f14,	%f8
	flush	%l7 + 0x54
	ta	%xcc,	0x7
	udiv	%i4,	0x1090,	%g4
	ldsw	[%l7 + 0x10],	%l6
	edge8l	%i0,	%g7,	%g5
	fornot1	%f28,	%f26,	%f10
	mulscc	%i7,	%l5,	%o6
	srlx	%o7,	0x0D,	%o5
	add	%g6,	%g2,	%l2
	fnegd	%f2,	%f18
	fmovsg	%icc,	%f16,	%f26
	bvs,a,pn	%xcc,	loop_1173
	bshuffle	%f26,	%f6,	%f2
	edge8l	%o0,	%i6,	%g3
	tneg	%icc,	0x3
loop_1173:
	xnor	%l3,	0x1EA8,	%o3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	fmul8ulx16	%f24,	%f22,	%f26
	xnor	%i2,	%i3,	%g1
	fnegs	%f20,	%f4
	srlx	%l0,	%l1,	%i1
	fpsub16s	%f19,	%f9,	%f15
	fandnot2	%f0,	%f16,	%f18
	wr	%g0,	0x80,	%asi
	stwa	%i5,	[%l7 + 0x44] %asi
	brgez,a	%o2,	loop_1174
	fzero	%f4
	bge	loop_1175
	movcc	%icc,	%o1,	%l4
loop_1174:
	addc	%g4,	%i4,	%i0
	movpos	%icc,	%l6,	%g5
loop_1175:
	edge16l	%i7,	%g7,	%o6
	movrlz	%o7,	%o5,	%l5
	edge32	%g2,	%l2,	%g6
	fbuge,a	%fcc0,	loop_1176
	fmovsvs	%xcc,	%f25,	%f24
	srlx	%i6,	0x18,	%o0
	set	0x46, %o1
	lduha	[%l7 + %o1] 0x19,	%l3
loop_1176:
	tge	%icc,	0x3
	mulx	%o3,	%g3,	%o4
	array8	%i2,	%i3,	%l0
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x34] %asi,	%l1
	fbo	%fcc0,	loop_1177
	taddcc	%i1,	0x0668,	%g1
	fmuld8ulx16	%f17,	%f21,	%f22
	nop
	fitod	%f30,	%f0
loop_1177:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o2,	0x0F8F,	%i5
	nop
	setx	loop_1178,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_1179,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f12,	%f28,	%f18
	fbul	%fcc0,	loop_1180
loop_1178:
	andcc	%l4,	%o1,	%i4
loop_1179:
	nop
	setx	0xD2C9F3D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xFE378BC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f16,	%f27
	bneg,pn	%xcc,	loop_1181
loop_1180:
	mulscc	%g4,	0x005E,	%i0
	popc	%g5,	%l6
	movrlez	%i7,	0x2C4,	%o6
loop_1181:
	fmovdvc	%icc,	%f2,	%f9
	xnorcc	%g7,	%o7,	%l5
	umulcc	%o5,	%g2,	%g6
	wr	%g0,	0xeb,	%asi
	stba	%l2,	[%l7 + 0x42] %asi
	membar	#Sync
	movleu	%icc,	%o0,	%l3
	edge8l	%o3,	%g3,	%i6
	set	0x7C, %o5
	swapa	[%l7 + %o5] 0x89,	%o4
	fbge,a	%fcc3,	loop_1182
	fblg	%fcc3,	loop_1183
	sethi	0x17E2,	%i3
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%l0
loop_1182:
	ble,pn	%icc,	loop_1184
loop_1183:
	fbne,a	%fcc3,	loop_1185
	srax	%l1,	0x13,	%i1
	and	%i2,	%o2,	%i5
loop_1184:
	fandnot1s	%f12,	%f6,	%f23
loop_1185:
	nop
	set	0x66, %l1
	stba	%l4,	[%l7 + %l1] 0x15
	wr	%g0,	0xea,	%asi
	stha	%o1,	[%l7 + 0x0A] %asi
	membar	#Sync
	movrlez	%g1,	%g4,	%i4
	subcc	%i0,	%g5,	%i7
	movrgz	%l6,	0x3E8,	%g7
	fornot2s	%f4,	%f21,	%f6
	fpack32	%f18,	%f20,	%f10
	tg	%xcc,	0x5
	orn	%o7,	%o6,	%o5
	subccc	%l5,	0x06B4,	%g2
	andncc	%g6,	%o0,	%l3
	nop
	setx	0x69F2CD880276F23A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xDACC22992E23A9CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f6,	%f20
	fmovs	%f4,	%f17
	and	%o3,	0x1EBF,	%g3
	bvs,a,pt	%icc,	loop_1186
	edge16n	%i6,	%l2,	%o4
	movrgz	%i3,	0x02B,	%l0
	movrgez	%i1,	0x241,	%l1
loop_1186:
	tcs	%icc,	0x5
	fzero	%f30
	mulscc	%i2,	%i5,	%o2
	sra	%l4,	%o1,	%g1
	tsubcctv	%i4,	0x1607,	%g4
	fandnot1s	%f6,	%f13,	%f24
	stbar
	ldub	[%l7 + 0x24],	%i0
	membar	0x77
	ta	%xcc,	0x4
	tcs	%xcc,	0x4
	udivcc	%g5,	0x1714,	%l6
	sra	%i7,	0x00,	%g7
	tcs	%icc,	0x7
	movrgez	%o7,	0x390,	%o6
	be	loop_1187
	tge	%xcc,	0x6
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1187:
	tvc	%xcc,	0x2
	ldsb	[%l7 + 0x26],	%o5
	subcc	%g2,	%l5,	%o0
	movn	%icc,	%g6,	%o3
	tvs	%xcc,	0x0
	ldub	[%l7 + 0x0E],	%l3
	fcmpgt32	%f8,	%f18,	%i6
	movneg	%xcc,	%g3,	%l2
	movn	%xcc,	%o4,	%l0
	fbule	%fcc2,	loop_1188
	and	%i3,	0x18E0,	%i1
	movrne	%i2,	%i5,	%o2
	orncc	%l1,	0x1C87,	%o1
loop_1188:
	edge16n	%l4,	%i4,	%g1
	tge	%icc,	0x7
	edge32n	%i0,	%g4,	%g5
	subccc	%i7,	0x0A52,	%g7
	tleu	%xcc,	0x2
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f16
	edge32ln	%l6,	%o6,	%o7
	movg	%icc,	%o5,	%l5
	add	%g2,	0x06C9,	%o0
	set	0x24, %o7
	swapa	[%l7 + %o7] 0x89,	%g6
	tl	%icc,	0x2
	sll	%o3,	0x14,	%l3
	tcs	%xcc,	0x6
	edge32n	%g3,	%i6,	%o4
	tpos	%xcc,	0x7
	edge32	%l2,	%i3,	%i1
	tle	%xcc,	0x2
	movl	%icc,	%l0,	%i2
	tvc	%icc,	0x2
	move	%xcc,	%o2,	%i5
	movrne	%l1,	%l4,	%o1
	movn	%icc,	%g1,	%i4
	subccc	%i0,	0x0D2D,	%g5
	fcmple16	%f24,	%f14,	%g4
	fmovscc	%xcc,	%f7,	%f20
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	movcs	%icc,	%l6,	%g7
	wr	%g0,	0x21,	%asi
	stxa	%o7,	[%g0 + 0x8] %asi
	movleu	%xcc,	%o6,	%o5
	set	0x10, %i0
	stwa	%l5,	[%l7 + %i0] 0x19
	smulcc	%g2,	0x1A0C,	%g6
	be,pn	%icc,	loop_1189
	edge32n	%o0,	%l3,	%g3
	bleu,a,pt	%icc,	loop_1190
	sdivx	%i6,	0x101C,	%o4
loop_1189:
	mova	%icc,	%l2,	%i3
	xorcc	%o3,	%i1,	%l0
loop_1190:
	fmovsl	%xcc,	%f24,	%f8
	fxor	%f8,	%f4,	%f14
	sub	%o2,	%i5,	%i2
	taddcc	%l1,	%o1,	%l4
	fmul8sux16	%f26,	%f30,	%f6
	sub	%g1,	0x0A81,	%i4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	edge8	%g4,	%g5,	%l6
	or	%g7,	0x1FD0,	%i7
	sdiv	%o7,	0x1E58,	%o6
	sdivcc	%o5,	0x1E22,	%l5
	subcc	%g6,	0x1200,	%o0
	brgez	%g2,	loop_1191
	edge8n	%l3,	%i6,	%o4
	fblg	%fcc3,	loop_1192
	fmovsne	%icc,	%f2,	%f16
loop_1191:
	nop
	set	0x3C, %l4
	lduwa	[%l7 + %l4] 0x18,	%l2
loop_1192:
	nop
	setx	0xF19D9D17EBAA376F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x62028F214F7E47D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f30,	%f18
	edge16n	%g3,	%i3,	%i1
	mulx	%o3,	0x1195,	%o2
	sll	%l0,	%i2,	%i5
	fmovsa	%icc,	%f7,	%f29
	sdivx	%o1,	0x1B4C,	%l4
	srlx	%l1,	0x0C,	%i4
	sllx	%g1,	0x14,	%i0
	andncc	%g4,	%g5,	%l6
	fpsub32	%f4,	%f8,	%f10
	xnor	%i7,	0x1D91,	%o7
	tvs	%xcc,	0x3
	nop
	setx	0x104B797E,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	ble	%xcc,	loop_1193
	nop
	set	0x78, %i7
	stx	%g7,	[%l7 + %i7]
	sdivcc	%o6,	0x08A1,	%o5
	alignaddr	%l5,	%g6,	%g2
loop_1193:
	fmovsgu	%icc,	%f29,	%f13
	brgez,a	%l3,	loop_1194
	move	%xcc,	%o0,	%o4
	fbn,a	%fcc0,	loop_1195
	taddcc	%i6,	%l2,	%i3
loop_1194:
	fpack32	%f8,	%f16,	%f12
	array32	%i1,	%g3,	%o2
loop_1195:
	sub	%l0,	0x0E3A,	%o3
	edge32n	%i2,	%i5,	%o1
	brgez	%l4,	loop_1196
	srl	%l1,	%g1,	%i0
	sdivcc	%g4,	0x07CA,	%i4
	array8	%g5,	%i7,	%o7
loop_1196:
	tn	%xcc,	0x4
	brz,a	%l6,	loop_1197
	bge,a,pt	%xcc,	loop_1198
	brlez,a	%g7,	loop_1199
	movl	%xcc,	%o6,	%l5
loop_1197:
	mova	%xcc,	%g6,	%o5
loop_1198:
	array16	%g2,	%l3,	%o0
loop_1199:
	edge16	%o4,	%l2,	%i6
	alignaddrl	%i3,	%i1,	%g3
	fpsub32	%f22,	%f0,	%f16
	tsubcc	%o2,	%l0,	%i2
	andn	%o3,	%o1,	%i5
	ldd	[%l7 + 0x50],	%f26
	umul	%l1,	0x1B0E,	%g1
	movrlz	%i0,	%g4,	%i4
	srax	%l4,	0x0E,	%g5
	move	%icc,	%o7,	%l6
	movvc	%icc,	%i7,	%o6
	tle	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%g7,	loop_1200
	addc	%l5,	%g6,	%o5
	sll	%l3,	%o0,	%o4
	edge16l	%g2,	%l2,	%i6
loop_1200:
	movvc	%icc,	%i1,	%i3
	prefetch	[%l7 + 0x34],	 0x3
	fbue,a	%fcc0,	loop_1201
	sra	%g3,	%l0,	%i2
	set	0x10, %g1
	stwa	%o3,	[%l7 + %g1] 0x0c
loop_1201:
	addcc	%o1,	%i5,	%l1
	fmovdg	%xcc,	%f14,	%f28
	fmovdpos	%xcc,	%f0,	%f6
	ldsh	[%l7 + 0x5A],	%o2
	movrlz	%g1,	%g4,	%i4
	fmovrdlez	%i0,	%f2,	%f14
	orcc	%l4,	0x05C3,	%o7
	smulcc	%g5,	0x1E01,	%i7
	andn	%l6,	0x1CE5,	%o6
	movvc	%xcc,	%g7,	%l5
	fmovsg	%xcc,	%f12,	%f23
	fsrc1s	%f9,	%f4
	movvc	%icc,	%o5,	%g6
	flush	%l7 + 0x18
	bl,pn	%icc,	loop_1202
	fxnors	%f28,	%f19,	%f14
	xnorcc	%o0,	0x0380,	%l3
	srl	%g2,	0x17,	%l2
loop_1202:
	fcmple16	%f8,	%f16,	%o4
	ldx	[%l7 + 0x50],	%i1
	edge8ln	%i3,	%i6,	%l0
	call	loop_1203
	alignaddr	%g3,	%i2,	%o3
	tcs	%icc,	0x3
	movleu	%xcc,	%i5,	%l1
loop_1203:
	fnot1s	%f23,	%f28
	bleu,pn	%xcc,	loop_1204
	nop
	setx	0x21B2340F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x1643851F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f7,	%f15
	tcc	%xcc,	0x1
	fcmpeq32	%f20,	%f26,	%o1
loop_1204:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%g4
	tsubcctv	%g1,	%i4,	%l4
	alignaddr	%i0,	%o7,	%g5
	sub	%l6,	%i7,	%o6
	movn	%icc,	%g7,	%l5
	nop
	set	0x60, %i1
	ldsh	[%l7 + %i1],	%g6
	orn	%o5,	%l3,	%o0
	tneg	%icc,	0x3
	std	%f12,	[%l7 + 0x40]
	edge32ln	%l2,	%o4,	%i1
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x1C] %asi,	%f17
	tneg	%icc,	0x0
	addc	%g2,	%i3,	%l0
	fpackfix	%f28,	%f9
	movne	%icc,	%i6,	%g3
	popc	0x024B,	%o3
	movneg	%icc,	%i2,	%i5
	sdivcc	%l1,	0x008C,	%o1
	fmovsa	%icc,	%f28,	%f2
	xnorcc	%o2,	%g4,	%g1
	tgu	%icc,	0x2
	te	%xcc,	0x6
	tvc	%xcc,	0x6
	xorcc	%l4,	%i4,	%o7
	swap	[%l7 + 0x54],	%g5
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x1f,	%f16
	fmovdge	%xcc,	%f28,	%f29
	movrne	%i0,	%i7,	%o6
	tgu	%icc,	0x4
	subc	%l6,	0x09B2,	%l5
	brgez	%g6,	loop_1205
	andcc	%o5,	%l3,	%o0
	taddcc	%l2,	%o4,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%i1
loop_1205:
	smul	%i3,	0x08F2,	%l0
	tvc	%xcc,	0x1
	swap	[%l7 + 0x34],	%i6
	fpack32	%f8,	%f26,	%f0
	udiv	%o3,	0x0DBD,	%g3
	fmuld8ulx16	%f20,	%f31,	%f26
	movn	%icc,	%i2,	%i5
	nop
	fitod	%f29,	%f0
	bpos	%xcc,	loop_1206
	fornot2s	%f18,	%f16,	%f18
	tsubcctv	%l1,	%o1,	%g4
	nop
	setx loop_1207, %l0, %l1
	jmpl %l1, %g1
loop_1206:
	andcc	%l4,	%o2,	%o7
	tn	%icc,	0x6
	edge32	%i4,	%i0,	%i7
loop_1207:
	edge16l	%g5,	%l6,	%o6
	edge32	%g6,	%l5,	%l3
	nop
	setx	loop_1208,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegs	%f9,	%f19
	nop
	setx	0xE27A7676,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x4170DB36,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f2,	%f11
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f12
	fxtod	%f12,	%f16
loop_1208:
	sir	0x1859
	nop
	setx	0x23F57291,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xD0271C06,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f19,	%f20
	membar	0x24
	udiv	%o5,	0x1829,	%o0
	sllx	%l2,	0x0D,	%g7
	movle	%xcc,	%g2,	%i1
	ldub	[%l7 + 0x55],	%o4
	and	%l0,	%i6,	%o3
	fbn	%fcc1,	loop_1209
	fnot2	%f0,	%f24
	be,pn	%xcc,	loop_1210
	bcs,a,pt	%icc,	loop_1211
loop_1209:
	fornot2s	%f9,	%f11,	%f3
	bvc,a,pn	%icc,	loop_1212
loop_1210:
	movre	%g3,	0x048,	%i2
loop_1211:
	edge8l	%i3,	%l1,	%i5
	popc	%g4,	%o1
loop_1212:
	tleu	%icc,	0x3
	tleu	%icc,	0x0
	brlz,a	%g1,	loop_1213
	stw	%o2,	[%l7 + 0x54]
	sth	%o7,	[%l7 + 0x66]
	fbg,a	%fcc3,	loop_1214
loop_1213:
	std	%f0,	[%l7 + 0x10]
	fcmpeq32	%f18,	%f16,	%l4
	fpadd16	%f14,	%f24,	%f20
loop_1214:
	addcc	%i0,	%i7,	%g5
	fmovrdlz	%i4,	%f12,	%f26
	movcs	%icc,	%o6,	%l6
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f20
	fandnot1s	%f24,	%f5,	%f0
	tn	%icc,	0x0
	tn	%icc,	0x1
	movrlez	%g6,	0x25C,	%l5
	smulcc	%o5,	0x0D25,	%l3
	addc	%o0,	%g7,	%g2
	fmovdge	%icc,	%f22,	%f12
	fmovs	%f0,	%f25
	stw	%l2,	[%l7 + 0x5C]
	brgez,a	%o4,	loop_1215
	fmovd	%f22,	%f2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i1,	%l0
loop_1215:
	tleu	%icc,	0x4
	fble	%fcc3,	loop_1216
	movrgz	%o3,	0x18F,	%g3
	fexpand	%f27,	%f10
	edge32	%i6,	%i2,	%i3
loop_1216:
	alignaddrl	%i5,	%l1,	%o1
	fone	%f18
	fmovdg	%icc,	%f28,	%f20
	smulcc	%g4,	%o2,	%o7
	fmovdcc	%icc,	%f24,	%f0
	bn,a	loop_1217
	edge8	%g1,	%l4,	%i7
	set	0x1B, %g5
	lduba	[%l7 + %g5] 0x81,	%i0
loop_1217:
	nop
	setx	loop_1218,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%icc,	%i4,	%o6
	edge16l	%g5,	%g6,	%l5
	brgz,a	%o5,	loop_1219
loop_1218:
	mulscc	%l3,	0x0F20,	%l6
	nop
	set	0x10, %o6
	stw	%o0,	[%l7 + %o6]
	tg	%icc,	0x7
loop_1219:
	tvc	%icc,	0x5
	tcc	%xcc,	0x0
	fmul8sux16	%f12,	%f22,	%f6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g2
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x68] %asi,	%g7
	tg	%icc,	0x3
	srlx	%l2,	%o4,	%i1
	tvs	%icc,	0x6
	movrne	%l0,	0x392,	%o3
	add	%g3,	%i2,	%i3
	fand	%f18,	%f6,	%f14
	fbuge,a	%fcc0,	loop_1220
	fcmple32	%f18,	%f18,	%i5
	movcs	%xcc,	%i6,	%o1
	tleu	%icc,	0x0
loop_1220:
	tne	%xcc,	0x5
	tcs	%xcc,	0x1
	set	0x20, %o3
	lda	[%l7 + %o3] 0x15,	%f14
	fbu	%fcc2,	loop_1221
	mulx	%g4,	0x1DD7,	%l1
	fmovsa	%icc,	%f2,	%f12
	fble	%fcc0,	loop_1222
loop_1221:
	sethi	0x0F51,	%o7
	udivcc	%g1,	0x1F0D,	%o2
	udivx	%l4,	0x1A53,	%i0
loop_1222:
	sdiv	%i4,	0x16A1,	%i7
	alignaddrl	%o6,	%g6,	%l5
	ldd	[%l7 + 0x30],	%f14
	bg,a,pn	%icc,	loop_1223
	movvs	%xcc,	%g5,	%l3
	lduh	[%l7 + 0x52],	%o5
	subccc	%o0,	%g2,	%l6
loop_1223:
	sra	%g7,	%l2,	%i1
	fnors	%f9,	%f23,	%f3
	edge8n	%l0,	%o3,	%g3
	tsubcctv	%i2,	%i3,	%o4
	stx	%i6,	[%l7 + 0x50]
	wr	%g0,	0xea,	%asi
	stwa	%o1,	[%l7 + 0x3C] %asi
	membar	#Sync
	tsubcc	%g4,	0x104D,	%i5
	mulscc	%o7,	%g1,	%o2
	sdiv	%l1,	0x1BDA,	%l4
	fpsub16s	%f3,	%f30,	%f16
	fors	%f5,	%f10,	%f7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%i0
	array32	%i4,	%i7,	%o6
	sdiv	%g6,	0x05C6,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f5,	%f4
	movge	%icc,	%l3,	%l5
	tgu	%icc,	0x7
	fbe,a	%fcc0,	loop_1224
	fmovsvs	%xcc,	%f10,	%f15
	sdiv	%o5,	0x1DB3,	%g2
	ldsw	[%l7 + 0x50],	%l6
loop_1224:
	fpack16	%f22,	%f29
	ldx	[%l7 + 0x20],	%g7
	set	0x46, %i2
	ldsba	[%l7 + %i2] 0x15,	%l2
	movrlz	%o0,	0x0AA,	%i1
	fmovrde	%l0,	%f2,	%f24
	nop
	setx	0x8F0E737D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x4BBE5C3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f2,	%f30
	brnz,a	%g3,	loop_1225
	fmovda	%icc,	%f18,	%f9
	pdist	%f20,	%f22,	%f24
	wr	%g0,	0x2a,	%asi
	stba	%i2,	[%l7 + 0x5D] %asi
	membar	#Sync
loop_1225:
	edge32l	%o3,	%i3,	%o4
	andn	%i6,	0x15CC,	%o1
	sethi	0x036A,	%i5
	tle	%icc,	0x5
	brnz,a	%o7,	loop_1226
	sir	0x06EB
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1226:
	fxor	%f30,	%f2,	%f30
	bvc,a	%icc,	loop_1227
	xor	%g4,	0x1620,	%o2
	movne	%icc,	%g1,	%l4
	edge8ln	%l1,	%i4,	%i0
loop_1227:
	movvc	%xcc,	%i7,	%g6
	fmovsvs	%icc,	%f1,	%f16
	array8	%g5,	%l3,	%l5
	stbar
	udivcc	%o6,	0x0DE1,	%o5
	be	%xcc,	loop_1228
	movrgz	%g2,	0x00C,	%l6
	ldd	[%l7 + 0x78],	%l2
	fbg	%fcc2,	loop_1229
loop_1228:
	fnot1	%f24,	%f20
	fbge	%fcc2,	loop_1230
	fmovsleu	%icc,	%f7,	%f2
loop_1229:
	subcc	%g7,	%i1,	%l0
	for	%f4,	%f24,	%f4
loop_1230:
	movrlez	%g3,	%o0,	%o3
	udivx	%i2,	0x0B55,	%o4
	ldd	[%l7 + 0x10],	%f12
	tvs	%icc,	0x5
	brnz	%i3,	loop_1231
	sll	%o1,	%i6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g4,	0x199,	%o2
loop_1231:
	sth	%i5,	[%l7 + 0x4E]
	fmovdpos	%icc,	%f28,	%f2
	move	%xcc,	%l4,	%l1
	fbue	%fcc2,	loop_1232
	move	%xcc,	%g1,	%i4
	stbar
	edge8n	%i7,	%i0,	%g6
loop_1232:
	sethi	0x084B,	%l3
	fpadd32	%f4,	%f24,	%f24
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%l5
	fmovsge	%icc,	%f24,	%f31
	movcs	%xcc,	%g5,	%o6
	edge8	%g2,	%l6,	%o5
	fbul,a	%fcc1,	loop_1233
	sll	%l2,	%g7,	%l0
	udiv	%i1,	0x1599,	%o0
	prefetch	[%l7 + 0x24],	 0x1
loop_1233:
	udivcc	%o3,	0x0E1F,	%i2
	fmovdneg	%icc,	%f14,	%f16
	ble,pn	%icc,	loop_1234
	andncc	%g3,	%i3,	%o4
	and	%o1,	%i6,	%o7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%g4
loop_1234:
	nop
	set	0x28, %g7
	stha	%i5,	[%l7 + %g7] 0x89
	sra	%l4,	0x13,	%l1
	bneg	loop_1235
	ta	%xcc,	0x1
	sra	%g1,	%o2,	%i4
	brz	%i0,	loop_1236
loop_1235:
	tge	%icc,	0x3
	set	0x62, %l5
	stba	%i7,	[%l7 + %l5] 0x19
loop_1236:
	udivcc	%l3,	0x1C08,	%g6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x64] %asi,	%l5
	addccc	%g5,	%g2,	%o6
	sdivx	%o5,	0x1A65,	%l2
	edge8	%l6,	%l0,	%g7
	fbul	%fcc0,	loop_1237
	addccc	%o0,	%i1,	%i2
	fbg,a	%fcc3,	loop_1238
	xnorcc	%o3,	%g3,	%i3
loop_1237:
	umul	%o1,	%i6,	%o7
	fcmpne32	%f20,	%f4,	%g4
loop_1238:
	nop
	setx	loop_1239,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbge	%fcc1,	loop_1240
	tcs	%icc,	0x1
	nop
	setx	0x239C75585045FD92,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_1239:
	tsubcctv	%o4,	0x02BA,	%l4
loop_1240:
	tvs	%icc,	0x5
	movneg	%icc,	%l1,	%g1
	fsrc1s	%f13,	%f11
	membar	0x19
	ldstub	[%l7 + 0x7A],	%i5
	bn,a,pn	%icc,	loop_1241
	andncc	%o2,	%i4,	%i0
	movcs	%xcc,	%i7,	%l3
	movl	%xcc,	%g6,	%g5
loop_1241:
	tneg	%xcc,	0x7
	bneg,a	loop_1242
	mova	%icc,	%l5,	%g2
	umul	%o6,	%o5,	%l6
	fbo,a	%fcc1,	loop_1243
loop_1242:
	umulcc	%l2,	%g7,	%l0
	movleu	%icc,	%o0,	%i2
	prefetch	[%l7 + 0x3C],	 0x0
loop_1243:
	ble,pt	%xcc,	loop_1244
	alignaddrl	%i1,	%o3,	%g3
	srl	%o1,	0x1B,	%i6
	fmovrsgz	%i3,	%f4,	%f5
loop_1244:
	movrlez	%o7,	0x163,	%o4
	membar	0x03
	fbul	%fcc2,	loop_1245
	andncc	%l4,	%l1,	%g1
	andcc	%g4,	%o2,	%i4
	set	0x48, %l0
	stha	%i5,	[%l7 + %l0] 0x2a
	membar	#Sync
loop_1245:
	movneg	%xcc,	%i7,	%i0
	set	0x0C, %l3
	sta	%f27,	[%l7 + %l3] 0x19
	edge16l	%g6,	%g5,	%l5
	smul	%g2,	0x009E,	%o6
	fxor	%f8,	%f18,	%f20
	ldsb	[%l7 + 0x34],	%l3
	tleu	%icc,	0x0
	taddcc	%l6,	%l2,	%g7
	movrlz	%l0,	%o0,	%i2
	ldsw	[%l7 + 0x54],	%o5
	movcs	%xcc,	%i1,	%o3
	fones	%f4
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f12
	movle	%xcc,	%o1,	%g3
	fnegd	%f8,	%f24
	sdivcc	%i6,	0x1546,	%o7
	array32	%i3,	%o4,	%l4
	brnz	%l1,	loop_1246
	nop
	setx	0xBF383E54,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f16
	fands	%f29,	%f14,	%f5
	mulx	%g1,	%o2,	%i4
loop_1246:
	ldub	[%l7 + 0x7E],	%g4
	subcc	%i7,	%i0,	%g6
	fmovrde	%i5,	%f6,	%f4
	fmovscs	%xcc,	%f27,	%f1
	membar	0x7F
	tgu	%icc,	0x5
	mova	%xcc,	%l5,	%g2
	fpack16	%f2,	%f17
	bl	%xcc,	loop_1247
	tpos	%icc,	0x5
	ldub	[%l7 + 0x10],	%o6
	movpos	%xcc,	%g5,	%l6
loop_1247:
	alignaddr	%l3,	%g7,	%l2
	movrlez	%o0,	%i2,	%o5
	movleu	%icc,	%i1,	%o3
	movrlez	%o1,	0x022,	%g3
	edge16l	%i6,	%l0,	%o7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fxors	%f8,	%f23,	%f7
	movrgez	%l4,	0x16B,	%i3
	sdivcc	%l1,	0x1C85,	%g1
	ldstub	[%l7 + 0x30],	%o2
	edge32ln	%i4,	%i7,	%g4
	orn	%i0,	%i5,	%g6
	fmovrdgz	%l5,	%f28,	%f30
	edge32l	%o6,	%g5,	%l6
	tle	%xcc,	0x6
	sdiv	%l3,	0x025C,	%g7
	nop
	fitos	%f2,	%f14
	fstox	%f14,	%f26
	subc	%g2,	0x0690,	%o0
	array32	%l2,	%i2,	%o5
	orncc	%o3,	%o1,	%g3
	bneg,pn	%icc,	loop_1248
	srax	%i1,	%i6,	%l0
	tsubcc	%o4,	%l4,	%i3
	fornot2s	%f25,	%f7,	%f29
loop_1248:
	orcc	%l1,	%o7,	%g1
	fzeros	%f10
	fmovsneg	%icc,	%f13,	%f31
	mulx	%o2,	%i4,	%i7
	wr	%g0,	0x10,	%asi
	stha	%g4,	[%l7 + 0x36] %asi
	edge8l	%i0,	%i5,	%l5
	fbule	%fcc0,	loop_1249
	addccc	%g6,	%o6,	%l6
	edge16n	%l3,	%g5,	%g2
	edge32n	%g7,	%o0,	%i2
loop_1249:
	movrgz	%l2,	%o3,	%o5
	wr	%g0,	0x04,	%asi
	sta	%f27,	[%l7 + 0x34] %asi
	taddcc	%o1,	%i1,	%i6
	ldstub	[%l7 + 0x51],	%g3
	fbe	%fcc0,	loop_1250
	ta	%xcc,	0x3
	fcmpeq32	%f16,	%f30,	%l0
	movpos	%xcc,	%o4,	%l4
loop_1250:
	nop
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l1
	sra	%i3,	%o7,	%o2
	fmovscc	%xcc,	%f24,	%f18
	sdivcc	%g1,	0x093E,	%i7
	fbo	%fcc1,	loop_1251
	sethi	0x05F6,	%i4
	movleu	%xcc,	%g4,	%i5
	tvc	%icc,	0x2
loop_1251:
	sethi	0x1363,	%l5
	tpos	%xcc,	0x7
	fcmpne16	%f8,	%f18,	%g6
	fsrc2	%f2,	%f10
	fmovsvs	%xcc,	%f2,	%f6
	movcc	%xcc,	%i0,	%o6
	srax	%l6,	0x1B,	%g5
	edge8ln	%l3,	%g7,	%g2
	movle	%icc,	%o0,	%i2
	fzeros	%f26
	bneg	loop_1252
	movg	%xcc,	%l2,	%o5
	tneg	%xcc,	0x7
	movrlez	%o1,	0x2A4,	%i1
loop_1252:
	array16	%i6,	%g3,	%o3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x3C] %asi,	%f9
	mova	%icc,	%o4,	%l0
	sub	%l4,	0x0C7E,	%i3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x19,	%f16
	srl	%l1,	%o7,	%g1
	sll	%o2,	0x10,	%i7
	nop
	fitod	%f27,	%f0
	xor	%i4,	%g4,	%i5
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%l4
	fnegd	%f4,	%f20
	movcs	%xcc,	%i0,	%o6
	fmul8x16al	%f1,	%f20,	%f28
	ta	%xcc,	0x6
	fpadd32s	%f3,	%f31,	%f3
	fnegs	%f8,	%f12
	fblg,a	%fcc2,	loop_1253
	bcs	loop_1254
	xor	%g6,	%g5,	%l6
	ldstub	[%l7 + 0x15],	%l3
loop_1253:
	tvs	%xcc,	0x0
loop_1254:
	xnor	%g7,	%o0,	%g2
	edge16n	%i2,	%o5,	%l2
	nop
	setx	loop_1255,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg	%fcc2,	loop_1256
	edge16	%i1,	%i6,	%o1
	move	%icc,	%g3,	%o4
loop_1255:
	addccc	%o3,	%l4,	%i3
loop_1256:
	srax	%l0,	%o7,	%l1
	te	%icc,	0x3
	sra	%o2,	%i7,	%i4
	fcmpgt32	%f6,	%f2,	%g1
	movcs	%xcc,	%i5,	%l5
	ldsb	[%l7 + 0x47],	%g4
	movneg	%xcc,	%o6,	%i0
	edge8n	%g5,	%l6,	%l3
	sir	0x162B
	tneg	%xcc,	0x5
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f4
	prefetch	[%l7 + 0x44],	 0x2
	sdivx	%g6,	0x0729,	%g7
	brnz	%g2,	loop_1257
	sdivx	%o0,	0x170D,	%o5
	brlz,a	%l2,	loop_1258
	mulx	%i1,	%i2,	%i6
loop_1257:
	movrgz	%g3,	%o4,	%o1
	fbl	%fcc0,	loop_1259
loop_1258:
	edge32ln	%o3,	%i3,	%l0
	andcc	%l4,	0x08F0,	%l1
	mulx	%o7,	%i7,	%i4
loop_1259:
	sdivcc	%o2,	0x090D,	%i5
	udiv	%l5,	0x1039,	%g1
	srl	%g4,	%i0,	%o6
	edge16l	%l6,	%l3,	%g5
	nop
	fitos	%f6,	%f1
	fstox	%f1,	%f0
	fxtos	%f0,	%f16
	fmovrdgez	%g6,	%f12,	%f26
	tne	%xcc,	0x4
	fmovd	%f2,	%f10
	set	0x20, %l2
	lda	[%l7 + %l2] 0x0c,	%f13
	udivcc	%g7,	0x1A09,	%o0
	st	%f5,	[%l7 + 0x40]
	fmovsleu	%icc,	%f5,	%f10
	brgz,a	%g2,	loop_1260
	edge16ln	%l2,	%o5,	%i2
	fmovdleu	%xcc,	%f29,	%f16
	fmovrsne	%i1,	%f28,	%f9
loop_1260:
	move	%icc,	%i6,	%o4
	tge	%icc,	0x0
	alignaddr	%o1,	%g3,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x69, %g2
	ldstub	[%l7 + %g2],	%l0
	call	loop_1261
	fxnor	%f8,	%f18,	%f24
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x20] %asi,	%f8
loop_1261:
	bg	loop_1262
	array32	%l4,	%i3,	%o7
	edge8ln	%l1,	%i4,	%i7
	fbge	%fcc1,	loop_1263
loop_1262:
	edge16l	%i5,	%l5,	%o2
	movrne	%g1,	%i0,	%g4
	fnot1	%f14,	%f0
loop_1263:
	stb	%o6,	[%l7 + 0x1E]
	udivx	%l3,	0x0649,	%g5
	ldsb	[%l7 + 0x66],	%g6
	fmovdn	%icc,	%f25,	%f26
	fbo,a	%fcc3,	loop_1264
	array32	%l6,	%o0,	%g7
	subcc	%g2,	%o5,	%i2
	swap	[%l7 + 0x40],	%i1
loop_1264:
	sub	%i6,	%l2,	%o1
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	fbue,a	%fcc3,	loop_1265
	xor	%g3,	%l0,	%l4
	fmovdle	%xcc,	%f29,	%f19
	stb	%o3,	[%l7 + 0x78]
loop_1265:
	fbuge	%fcc0,	loop_1266
	movleu	%xcc,	%o7,	%i3
	fmovsa	%icc,	%f5,	%f16
	tgu	%icc,	0x2
loop_1266:
	sir	0x18C6
	edge8	%i4,	%i7,	%l1
	umul	%i5,	%l5,	%o2
	ba,pt	%icc,	loop_1267
	fmovsn	%xcc,	%f27,	%f19
	tgu	%icc,	0x5
	sra	%g1,	%g4,	%i0
loop_1267:
	tn	%xcc,	0x3
	set	0x10, %g3
	ldxa	[%g0 + %g3] 0x4f,	%o6
	bne,a,pt	%icc,	loop_1268
	pdist	%f14,	%f14,	%f30
	nop
	setx loop_1269, %l0, %l1
	jmpl %l1, %l3
	brgez	%g6,	loop_1270
loop_1268:
	movrlz	%g5,	0x192,	%o0
	mulx	%g7,	%l6,	%o5
loop_1269:
	tvs	%xcc,	0x4
loop_1270:
	edge8n	%i2,	%i1,	%i6
	fbue	%fcc1,	loop_1271
	fmovrse	%l2,	%f31,	%f11
	brgez	%g2,	loop_1272
	tn	%icc,	0x4
loop_1271:
	xnorcc	%o4,	0x1240,	%o1
	movre	%g3,	%l4,	%o3
loop_1272:
	brnz,a	%o7,	loop_1273
	taddcc	%l0,	%i4,	%i3
	bvs,a,pt	%icc,	loop_1274
	srax	%i7,	%l1,	%l5
loop_1273:
	subcc	%i5,	0x1AC0,	%o2
	swap	[%l7 + 0x70],	%g4
loop_1274:
	nop
	setx	0x02DA9C89706208D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	movleu	%icc,	%g1,	%i0
	movrlez	%l3,	%o6,	%g5
	tge	%xcc,	0x2
	srl	%g6,	0x0B,	%g7
	fpsub32s	%f15,	%f25,	%f8
	edge16ln	%o0,	%o5,	%i2
	movl	%icc,	%l6,	%i1
	movrlez	%l2,	0x31A,	%i6
	alignaddr	%g2,	%o1,	%g3
	lduw	[%l7 + 0x4C],	%l4
	set	0x30, %o4
	lduha	[%l7 + %o4] 0x89,	%o3
	orncc	%o4,	0x1CF6,	%o7
	srlx	%l0,	%i3,	%i4
	nop
	setx loop_1275, %l0, %l1
	jmpl %l1, %l1
	movge	%xcc,	%l5,	%i5
	brz	%i7,	loop_1276
	nop
	setx	0x36144007F1C5B7EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f4
loop_1275:
	fsrc2s	%f5,	%f2
	movg	%xcc,	%o2,	%g1
loop_1276:
	fble,a	%fcc1,	loop_1277
	movle	%xcc,	%i0,	%l3
	wr	%g0,	0x22,	%asi
	stha	%o6,	[%l7 + 0x60] %asi
	membar	#Sync
loop_1277:
	udivcc	%g5,	0x18DC,	%g4
	bge,a	loop_1278
	bge,a,pn	%icc,	loop_1279
	fblg	%fcc1,	loop_1280
	tcc	%xcc,	0x1
loop_1278:
	addccc	%g7,	%o0,	%g6
loop_1279:
	fmovdne	%icc,	%f9,	%f28
loop_1280:
	fsrc1s	%f30,	%f8
	movle	%icc,	%o5,	%i2
	taddcc	%i1,	%l2,	%i6
	tneg	%icc,	0x4
	movle	%xcc,	%g2,	%o1
	fmovsgu	%icc,	%f27,	%f31
	movge	%icc,	%l6,	%g3
	fmovsg	%xcc,	%f7,	%f15
	tvs	%xcc,	0x5
	fmovsneg	%xcc,	%f9,	%f24
	bvs,a,pn	%icc,	loop_1281
	fbne	%fcc3,	loop_1282
	stbar
	sdivx	%l4,	0x0E28,	%o4
loop_1281:
	sllx	%o3,	0x13,	%l0
loop_1282:
	membar	0x4F
	fmovscs	%icc,	%f4,	%f30
	movge	%icc,	%o7,	%i4
	fbule,a	%fcc1,	loop_1283
	edge8	%l1,	%l5,	%i3
	movleu	%xcc,	%i5,	%i7
	movrlz	%o2,	%i0,	%g1
loop_1283:
	edge8n	%l3,	%o6,	%g4
	tg	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g5
	array8	%g7,	%o0,	%o5
	array32	%g6,	%i1,	%i2
	fsrc2s	%f0,	%f16
	sethi	0x02C5,	%l2
	fmovrdgez	%i6,	%f8,	%f10
	sdivcc	%g2,	0x1C1F,	%l6
	bcc,pn	%xcc,	loop_1284
	umul	%g3,	0x0C7A,	%o1
	edge8n	%l4,	%o4,	%o3
	fornot2s	%f2,	%f5,	%f16
loop_1284:
	fba	%fcc0,	loop_1285
	addcc	%o7,	0x0EA3,	%l0
	fpmerge	%f12,	%f24,	%f10
	tgu	%icc,	0x1
loop_1285:
	nop
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f16
	umul	%l1,	0x116E,	%l5
	fmovdcs	%xcc,	%f6,	%f8
	umulcc	%i4,	%i3,	%i7
	tpos	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2A] %asi,	%i5
	orncc	%i0,	0x03F0,	%o2
	mulscc	%g1,	%l3,	%o6
	tgu	%icc,	0x6
	fmul8ulx16	%f4,	%f0,	%f14
	ldx	[%l7 + 0x40],	%g5
	sub	%g7,	%g4,	%o0
	addcc	%o5,	%i1,	%g6
	fpmerge	%f12,	%f5,	%f8
	tcc	%xcc,	0x2
	edge8	%i2,	%i6,	%l2
	movvs	%icc,	%l6,	%g3
	fblg	%fcc0,	loop_1286
	std	%f12,	[%l7 + 0x08]
	fmovdpos	%icc,	%f11,	%f20
	fexpand	%f9,	%f8
loop_1286:
	ldx	[%l7 + 0x48],	%o1
	stbar
	subccc	%g2,	%l4,	%o4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%l0
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f4
	fxtos	%f4,	%f27
	fmul8x16	%f26,	%f24,	%f16
	ldd	[%l7 + 0x20],	%f22
	tne	%xcc,	0x3
	xorcc	%o3,	0x18B2,	%l5
	edge16	%i4,	%i3,	%l1
	movre	%i7,	%i5,	%o2
	nop
	fitos	%f9,	%f31
	fstox	%f31,	%f2
	taddcctv	%g1,	0x13C4,	%i0
	wr	%g0,	0x89,	%asi
	stba	%l3,	[%l7 + 0x1F] %asi
	movle	%icc,	%g5,	%o6
	edge32l	%g7,	%o0,	%g4
	bvc,a	loop_1287
	taddcctv	%o5,	0x1D8A,	%i1
	movneg	%xcc,	%g6,	%i6
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%i2
loop_1287:
	ba	%xcc,	loop_1288
	nop
	setx	loop_1289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l2,	0x1265,	%l6
	edge32ln	%g3,	%g2,	%o1
loop_1288:
	array8	%l4,	%o7,	%o4
loop_1289:
	stb	%o3,	[%l7 + 0x4B]
	movg	%icc,	%l0,	%l5
	fmovde	%icc,	%f26,	%f25
	bvc	%xcc,	loop_1290
	prefetch	[%l7 + 0x1C],	 0x0
	ld	[%l7 + 0x40],	%f31
	fpsub16s	%f7,	%f26,	%f15
loop_1290:
	membar	0x05
	bneg,pt	%icc,	loop_1291
	tl	%xcc,	0x6
	udivx	%i3,	0x11FA,	%i4
	and	%i7,	%i5,	%o2
loop_1291:
	movne	%xcc,	%l1,	%g1
	add	%i0,	0x04D6,	%g5
	fpmerge	%f7,	%f7,	%f12
	bpos,a	%icc,	loop_1292
	addccc	%l3,	0x1337,	%g7
	taddcc	%o0,	%g4,	%o6
	fandnot1	%f4,	%f22,	%f22
loop_1292:
	udiv	%i1,	0x1C0F,	%o5
	fmovscc	%icc,	%f7,	%f25
	sllx	%g6,	0x19,	%i2
	sdivcc	%l2,	0x0094,	%l6
	set	0x46, %g4
	ldsba	[%l7 + %g4] 0x15,	%g3
	sethi	0x065C,	%g2
	fmovdvs	%icc,	%f21,	%f20
	fbn,a	%fcc2,	loop_1293
	srax	%i6,	%l4,	%o1
	add	%o7,	%o3,	%l0
	fbl	%fcc2,	loop_1294
loop_1293:
	and	%l5,	%o4,	%i4
	movrne	%i7,	0x044,	%i5
	sir	0x19A3
loop_1294:
	edge8	%i3,	%l1,	%o2
	udivx	%g1,	0x182D,	%g5
	fbn	%fcc3,	loop_1295
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f2
	tn	%xcc,	0x6
	srlx	%i0,	0x08,	%l3
loop_1295:
	tvc	%xcc,	0x1
	tl	%icc,	0x5
	sub	%o0,	%g4,	%g7
	movvc	%xcc,	%o6,	%i1
	ldsb	[%l7 + 0x46],	%g6
	ldub	[%l7 + 0x22],	%o5
	sllx	%i2,	0x12,	%l6
	movne	%icc,	%g3,	%g2
	fandnot2	%f26,	%f14,	%f20
	taddcc	%i6,	0x1F8B,	%l2
	nop
	setx	0xA9FD57C25BF4F40C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x061FE3B984375DB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f26,	%f4
	movcs	%xcc,	%l4,	%o7
	movneg	%xcc,	%o1,	%l0
	movgu	%xcc,	%l5,	%o3
	fbu	%fcc0,	loop_1296
	fmovda	%xcc,	%f17,	%f1
	ble,pn	%icc,	loop_1297
	tge	%xcc,	0x6
loop_1296:
	fbuge,a	%fcc2,	loop_1298
	alignaddr	%i4,	%o4,	%i5
loop_1297:
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%i6
	tpos	%icc,	0x2
loop_1298:
	tvc	%xcc,	0x4
	movn	%icc,	%l1,	%i3
	sub	%g1,	%o2,	%g5
	fmovse	%icc,	%f25,	%f0
	fandnot1s	%f27,	%f26,	%f2
	ldsb	[%l7 + 0x6F],	%l3
	set	0x22, %o0
	ldstuba	[%l7 + %o0] 0x04,	%o0
	movle	%xcc,	%g4,	%i0
	andn	%g7,	0x1B6F,	%i1
	edge16n	%g6,	%o6,	%i2
	ba,a,pt	%icc,	loop_1299
	movl	%xcc,	%l6,	%g3
	tg	%xcc,	0x3
	array32	%o5,	%i6,	%l2
loop_1299:
	tneg	%xcc,	0x3
	fpack16	%f8,	%f1
	fmovde	%xcc,	%f3,	%f23
	or	%g2,	%o7,	%l4
	fnegd	%f6,	%f10
	subc	%l0,	0x1AA0,	%l5
	tgu	%icc,	0x7
	fmovdne	%xcc,	%f28,	%f0
	fmovspos	%icc,	%f15,	%f30
	fmovscs	%icc,	%f22,	%f26
	orncc	%o1,	0x1EAB,	%o3
	movrlz	%i4,	%o4,	%i5
	array8	%i7,	%i3,	%g1
	movle	%icc,	%l1,	%g5
	alignaddrl	%o2,	%o0,	%l3
	fbg,a	%fcc3,	loop_1300
	sub	%i0,	%g7,	%i1
	ba	%icc,	loop_1301
	umulcc	%g4,	0x08CB,	%g6
loop_1300:
	tneg	%icc,	0x6
	sll	%o6,	%i2,	%g3
loop_1301:
	fpadd16s	%f28,	%f26,	%f25
	ldstub	[%l7 + 0x53],	%l6
	brgez,a	%i6,	loop_1302
	movpos	%icc,	%l2,	%g2
	subc	%o5,	%l4,	%o7
	fpack32	%f26,	%f18,	%f20
loop_1302:
	movpos	%xcc,	%l5,	%l0
	mulscc	%o1,	%i4,	%o3
	and	%o4,	0x1F4D,	%i7
	umulcc	%i5,	%g1,	%l1
	sethi	0x0304,	%g5
	edge16	%o2,	%i3,	%l3
	edge32	%o0,	%i0,	%i1
	movg	%xcc,	%g7,	%g6
	fmuld8sux16	%f2,	%f2,	%f2
	fcmpeq32	%f22,	%f22,	%g4
	fmovdneg	%icc,	%f19,	%f6
	bn	loop_1303
	movg	%icc,	%o6,	%g3
	sdivcc	%i2,	0x1AC5,	%l6
	set	0x58, %o1
	stxa	%l2,	[%l7 + %o1] 0x15
loop_1303:
	movrgz	%g2,	0x3D0,	%o5
	bl,a	%icc,	loop_1304
	fmovrdgz	%l4,	%f6,	%f8
	xnor	%o7,	%l5,	%i6
	tg	%xcc,	0x4
loop_1304:
	tsubcctv	%o1,	0x1D50,	%l0
	edge16ln	%o3,	%o4,	%i7
	fornot2s	%f18,	%f18,	%f0
	brlez	%i4,	loop_1305
	fone	%f20
	fmovrdlez	%g1,	%f16,	%f24
	nop
	setx	loop_1306,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1305:
	movcs	%icc,	%l1,	%i5
	bcs,a,pt	%xcc,	loop_1307
	fnors	%f2,	%f16,	%f9
loop_1306:
	brz	%o2,	loop_1308
	fmovdg	%xcc,	%f13,	%f14
loop_1307:
	movrgz	%g5,	%l3,	%i3
	movre	%i0,	%i1,	%g7
loop_1308:
	movge	%icc,	%g6,	%o0
	nop
	setx	loop_1309,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f12,	%f22
	fmovsa	%icc,	%f21,	%f13
loop_1309:
	ldstub	[%l7 + 0x41],	%g4
	bge,a,pt	%xcc,	loop_1310
	fandnot1s	%f14,	%f14,	%f4
	ldd	[%l7 + 0x38],	%g2
	sethi	0x0575,	%i2
loop_1310:
	movleu	%xcc,	%l6,	%o6
	andn	%l2,	%g2,	%l4
	orcc	%o7,	%l5,	%o5
	popc	%o1,	%l0
	mulscc	%i6,	0x1E3E,	%o4
	tcs	%icc,	0x4
	movl	%icc,	%i7,	%o3
	fandnot2s	%f24,	%f4,	%f16
	tvs	%xcc,	0x3
	fbue	%fcc3,	loop_1311
	fbue,a	%fcc3,	loop_1312
	movge	%icc,	%g1,	%l1
	array8	%i5,	%o2,	%g5
loop_1311:
	mova	%xcc,	%l3,	%i4
loop_1312:
	brnz,a	%i0,	loop_1313
	movn	%xcc,	%i1,	%g7
	movneg	%xcc,	%i3,	%g6
	subcc	%o0,	0x1F81,	%g3
loop_1313:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x3C] %asi
	movre	%g4,	0x19C,	%i2
	bg,pn	%xcc,	loop_1314
	bg	loop_1315
	edge16	%o6,	%l2,	%g2
	bge	%xcc,	loop_1316
loop_1314:
	alignaddr	%l4,	%o7,	%l6
loop_1315:
	srax	%o5,	0x1E,	%o1
	membar	0x7A
loop_1316:
	ldsb	[%l7 + 0x1E],	%l0
	andn	%l5,	%o4,	%i7
	brlz	%o3,	loop_1317
	sub	%i6,	0x0B86,	%g1
	nop
	setx	0x198EE963FBD6A655,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4D2E943BD0FD1397,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f28,	%f14
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7C] %asi,	%l1
loop_1317:
	nop
	fitod	%f8,	%f12
	fdtoi	%f12,	%f1
	fors	%f20,	%f19,	%f20
	set	0x50, %o5
	stwa	%o2,	[%l7 + %o5] 0x11
	pdist	%f28,	%f6,	%f10
	tcs	%icc,	0x3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%i5
	sdivx	%g5,	0x0225,	%i4
	call	loop_1318
	xor	%l3,	0x189B,	%i0
	fpackfix	%f20,	%f1
	set	0x32, %l1
	stha	%i1,	[%l7 + %l1] 0x14
loop_1318:
	movcs	%xcc,	%g7,	%i3
	edge16ln	%g6,	%g3,	%o0
	te	%xcc,	0x2
	tvs	%xcc,	0x4
	fpadd32	%f8,	%f26,	%f26
	edge8ln	%i2,	%g4,	%o6
	array32	%l2,	%l4,	%g2
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f24
	fxtod	%f24,	%f10
	fmul8x16al	%f5,	%f25,	%f2
	fbo,a	%fcc3,	loop_1319
	ld	[%l7 + 0x34],	%f27
	fmovspos	%xcc,	%f5,	%f20
	nop
	setx	loop_1320,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1319:
	fzeros	%f4
	fnor	%f20,	%f26,	%f24
	udivcc	%l6,	0x1A2E,	%o7
loop_1320:
	nop
	set	0x38, %i0
	lduwa	[%l7 + %i0] 0x81,	%o1
	fmovdcs	%icc,	%f19,	%f24
	movle	%icc,	%l0,	%l5
	orcc	%o4,	%o5,	%o3
	movre	%i7,	%i6,	%l1
	sra	%o2,	0x1D,	%i5
	fands	%f23,	%f11,	%f20
	set	0x44, %l4
	lduba	[%l7 + %l4] 0x0c,	%g5
	bvs	loop_1321
	movrne	%i4,	0x05F,	%l3
	addc	%g1,	0x085D,	%i0
	add	%i1,	0x0A19,	%g7
loop_1321:
	nop
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x14,	%g6
	subc	%i3,	0x1E8A,	%o0
	fmovdgu	%xcc,	%f16,	%f23
	tvs	%xcc,	0x1
	and	%g3,	%g4,	%i2
	fblg	%fcc1,	loop_1322
	tneg	%xcc,	0x6
	fmovscc	%xcc,	%f2,	%f27
	movleu	%xcc,	%l2,	%o6
loop_1322:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x34] %asi,	%g2
	sll	%l6,	0x0E,	%l4
	tneg	%icc,	0x2
	edge8ln	%o1,	%l0,	%o7
	orcc	%o4,	0x0566,	%o5
	ldub	[%l7 + 0x75],	%l5
	edge16ln	%i7,	%i6,	%o3
	tneg	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o2,	%l1,	%g5
	tn	%icc,	0x5
	call	loop_1323
	udivx	%i4,	0x0257,	%l3
	ta	%icc,	0x4
	orcc	%g1,	%i5,	%i1
loop_1323:
	edge16ln	%g7,	%g6,	%i0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i3,	%g3
	fornot2s	%f17,	%f19,	%f10
	bvs,a	%icc,	loop_1324
	movle	%icc,	%o0,	%i2
	set	0x44, %g1
	lda	[%l7 + %g1] 0x18,	%f10
loop_1324:
	taddcctv	%g4,	%l2,	%o6
	andcc	%g2,	0x061B,	%l4
	fbge	%fcc3,	loop_1325
	tg	%xcc,	0x1
	bcc,pt	%icc,	loop_1326
	fnands	%f19,	%f29,	%f18
loop_1325:
	fbo,a	%fcc1,	loop_1327
	smul	%l6,	%l0,	%o1
loop_1326:
	srax	%o4,	0x0C,	%o7
	fmovdneg	%icc,	%f14,	%f27
loop_1327:
	tvc	%icc,	0x4
	sir	0x1569
	set	0x1C, %o7
	lduwa	[%l7 + %o7] 0x04,	%l5
	tcc	%icc,	0x3
	ldx	[%l7 + 0x50],	%i7
	ld	[%l7 + 0x1C],	%f16
	movg	%icc,	%o5,	%i6
	fmovsgu	%icc,	%f11,	%f0
	udiv	%o3,	0x1774,	%l1
	tg	%xcc,	0x2
	popc	0x1E9D,	%o2
	sra	%g5,	0x06,	%l3
	fbne	%fcc2,	loop_1328
	fbg	%fcc0,	loop_1329
	xorcc	%i4,	0x0BF4,	%g1
	fbule,a	%fcc3,	loop_1330
loop_1328:
	bleu,pn	%xcc,	loop_1331
loop_1329:
	edge32l	%i5,	%i1,	%g7
	tneg	%icc,	0x6
loop_1330:
	nop
	fitod	%f30,	%f0
loop_1331:
	alignaddrl	%g6,	%i0,	%i3
	movcc	%xcc,	%o0,	%g3
	fmuld8sux16	%f27,	%f0,	%f14
	set	0x68, %i1
	ldsha	[%l7 + %i1] 0x88,	%i2
	ldub	[%l7 + 0x1C],	%g4
	array8	%o6,	%l2,	%l4
	fnot1s	%f25,	%f1
	movrgz	%g2,	%l6,	%o1
	sethi	0x1E9E,	%o4
	umul	%l0,	%o7,	%l5
	bl	%xcc,	loop_1332
	movrgez	%o5,	0x256,	%i6
	udivcc	%i7,	0x0B75,	%l1
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
loop_1332:
	subccc	%o2,	%o3,	%g5
	tne	%xcc,	0x7
	tn	%icc,	0x5
loop_1333:
	fmovsle	%xcc,	%f29,	%f17
	umul	%i4,	%g1,	%l3
	stbar
	pdist	%f18,	%f6,	%f10
	fmovdgu	%icc,	%f14,	%f5
	ldd	[%l7 + 0x78],	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f25,	%f4
	smul	%i5,	0x1731,	%g6
	movrlez	%i0,	%i3,	%g7
	movcs	%icc,	%g3,	%i2
	nop
	setx	0x4E549D8743102681,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x60E6C47B34DCB89E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f12,	%f14
	orncc	%g4,	0x165E,	%o6
	umul	%l2,	%o0,	%g2
	fpack16	%f14,	%f6
	nop
	fitos	%f14,	%f1
	fstox	%f1,	%f4
	fxtos	%f4,	%f7
	edge16	%l4,	%o1,	%l6
	movre	%l0,	0x367,	%o7
	tle	%xcc,	0x0
	sll	%l5,	%o4,	%o5
	andn	%i6,	%i7,	%l1
	edge16ln	%o3,	%o2,	%i4
	fornot1	%f8,	%f26,	%f2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	fbne	%fcc1,	loop_1334
	ldsb	[%l7 + 0x54],	%g5
	movge	%xcc,	%g1,	%i1
	fmul8sux16	%f2,	%f0,	%f28
loop_1334:
	fnegs	%f16,	%f15
	movge	%icc,	%l3,	%g6
	brgz	%i0,	loop_1335
	fornot2s	%f11,	%f29,	%f1
	fornot2	%f6,	%f4,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1335:
	fxnor	%f28,	%f28,	%f12
	movpos	%xcc,	%i3,	%g7
	fmovrdgz	%g3,	%f26,	%f4
	ldstub	[%l7 + 0x7C],	%i5
	fmovsneg	%icc,	%f14,	%f22
	fands	%f12,	%f30,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i2,	%o6
	taddcctv	%l2,	0x0CFE,	%o0
	fbug	%fcc1,	loop_1336
	nop
	setx	loop_1337,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%g2,	%l4,	%g4
	wr	%g0,	0x4f,	%asi
	stxa	%o1,	[%g0 + 0x30] %asi
loop_1336:
	edge16ln	%l0,	%o7,	%l6
loop_1337:
	edge8l	%o4,	%o5,	%i6
	fandnot1	%f4,	%f16,	%f0
	sub	%l5,	%l1,	%o3
	orncc	%i7,	0x01FB,	%i4
	set	0x18, %g5
	stwa	%o2,	[%l7 + %g5] 0x18
	brlez	%g5,	loop_1338
	fnegd	%f6,	%f26
	bn,pn	%xcc,	loop_1339
	fmovrdne	%g1,	%f20,	%f8
loop_1338:
	ldd	[%l7 + 0x30],	%f16
	movg	%xcc,	%l3,	%i1
loop_1339:
	array32	%i0,	%g6,	%i3
	edge8l	%g3,	%g7,	%i5
	xnor	%o6,	%l2,	%i2
	bge,a,pn	%xcc,	loop_1340
	fpadd32	%f8,	%f10,	%f10
	nop
	setx	0x2C367524,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x839F67B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f25,	%f28
	sdiv	%g2,	0x15AD,	%o0
loop_1340:
	bn,a,pt	%icc,	loop_1341
	tleu	%xcc,	0x5
	set	0x68, %o6
	stxa	%g4,	[%l7 + %o6] 0x2b
	membar	#Sync
loop_1341:
	xor	%o1,	%l0,	%l4
	nop
	setx	loop_1342,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%icc,	0x3
	tleu	%xcc,	0x3
	array32	%o7,	%l6,	%o5
loop_1342:
	ldsh	[%l7 + 0x50],	%i6
	popc	0x17B4,	%l5
	popc	0x1F4D,	%o4
	fmul8x16al	%f7,	%f13,	%f0
	movg	%icc,	%o3,	%i7
	xnor	%l1,	%i4,	%g5
	nop
	setx	0x663A6741,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xF6E9D641,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f17,	%f12
	st	%f19,	[%l7 + 0x38]
	fcmpne16	%f26,	%f14,	%o2
	set	0x74, %i2
	ldsha	[%l7 + %i2] 0x14,	%g1
	sdivx	%i1,	0x1884,	%l3
	movleu	%icc,	%i0,	%i3
	tcc	%icc,	0x4
	tne	%icc,	0x0
	fandnot2s	%f13,	%f21,	%f31
	fbn,a	%fcc0,	loop_1343
	te	%xcc,	0x7
	fmovrdgz	%g3,	%f8,	%f30
	fbne,a	%fcc0,	loop_1344
loop_1343:
	fpadd16s	%f25,	%f25,	%f21
	movvc	%xcc,	%g7,	%i5
	sir	0x1D51
loop_1344:
	fmul8x16	%f12,	%f12,	%f18
	tgu	%xcc,	0x1
	ba,a,pn	%xcc,	loop_1345
	alignaddr	%g6,	%o6,	%l2
	fbe,a	%fcc1,	loop_1346
	udivx	%i2,	0x1EFA,	%g2
loop_1345:
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f19
	ble	loop_1347
loop_1346:
	mova	%icc,	%g4,	%o1
	srlx	%l0,	0x00,	%o0
	sll	%l4,	0x1E,	%o7
loop_1347:
	fblg	%fcc3,	loop_1348
	tle	%icc,	0x2
	fbul,a	%fcc1,	loop_1349
	fmovdge	%icc,	%f18,	%f2
loop_1348:
	add	%l6,	%o5,	%i6
	orncc	%l5,	0x1162,	%o3
loop_1349:
	fmovsn	%xcc,	%f0,	%f31
	tvs	%xcc,	0x2
	stw	%i7,	[%l7 + 0x60]
	fblg	%fcc3,	loop_1350
	fbu	%fcc3,	loop_1351
	mova	%xcc,	%o4,	%l1
	movpos	%icc,	%i4,	%o2
loop_1350:
	nop
	setx	0x177028D4AEF4CECB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x52A365D25C2D2E59,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f8,	%f10
loop_1351:
	tne	%xcc,	0x4
	orncc	%g1,	%i1,	%l3
	movle	%xcc,	%i0,	%g5
	fmovdn	%icc,	%f5,	%f10
	ldsh	[%l7 + 0x22],	%g3
	smulcc	%g7,	%i3,	%g6
	tsubcc	%i5,	0x1A45,	%l2
	fmovse	%xcc,	%f20,	%f26
	ldub	[%l7 + 0x2D],	%o6
	sra	%i2,	%g4,	%g2
	movn	%xcc,	%l0,	%o1
	set	0x80, %g7
	ldxa	[%g0 + %g7] 0x58,	%l4
	move	%icc,	%o0,	%o7
	ldsb	[%l7 + 0x61],	%o5
	nop
	setx	0x107FB19C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x4206218F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f30,	%f20
	set	0x48, %l5
	ldsba	[%l7 + %l5] 0x0c,	%i6
	tg	%icc,	0x2
	stb	%l5,	[%l7 + 0x58]
	xnor	%o3,	%i7,	%o4
	fba,a	%fcc3,	loop_1352
	or	%l1,	0x14A7,	%i4
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x04,	%i6
loop_1352:
	xnor	%o2,	%i1,	%l3
	fxor	%f26,	%f12,	%f30
	edge16l	%i0,	%g1,	%g5
	movrlz	%g3,	%i3,	%g7
	movneg	%xcc,	%g6,	%i5
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x11,	 0x1
	and	%i2,	0x1746,	%o6
	edge8ln	%g4,	%l0,	%o1
	smulcc	%l4,	0x17E8,	%o0
	edge16	%g2,	%o5,	%i6
	orn	%l5,	%o3,	%i7
	fbul,a	%fcc1,	loop_1353
	movrlez	%o4,	%l1,	%i4
	fble	%fcc0,	loop_1354
	mova	%xcc,	%o7,	%l6
loop_1353:
	call	loop_1355
	movcc	%xcc,	%o2,	%l3
loop_1354:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i1
loop_1355:
	nop
	set	0x1A, %o3
	ldub	[%l7 + %o3],	%g1
	set	0x7C, %i6
	ldswa	[%l7 + %i6] 0x18,	%i0
	tvs	%icc,	0x5
	fpadd16	%f26,	%f14,	%f16
	ldsh	[%l7 + 0x78],	%g5
	mulscc	%i3,	0x0296,	%g7
	tge	%icc,	0x3
	add	%g6,	0x1924,	%i5
	te	%xcc,	0x1
	srl	%g3,	%l2,	%o6
	fbu,a	%fcc0,	loop_1356
	ldsb	[%l7 + 0x1D],	%g4
	tleu	%xcc,	0x4
	andn	%l0,	%i2,	%o1
loop_1356:
	array8	%o0,	%l4,	%o5
	edge32n	%i6,	%l5,	%g2
	array32	%i7,	%o3,	%o4
	tneg	%icc,	0x6
	ta	%icc,	0x7
	fmovsge	%icc,	%f15,	%f26
	tle	%icc,	0x7
	xnorcc	%i4,	%o7,	%l6
	nop
	setx	0xD9869B2268BF0798,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f4
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	subcc	%o2,	0x1A07,	%l3
	taddcctv	%i1,	%g1,	%i0
	array8	%g5,	%i3,	%g7
	movcs	%icc,	%g6,	%l1
	st	%f27,	[%l7 + 0x7C]
	orncc	%i5,	0x0966,	%g3
	tne	%xcc,	0x3
	edge8n	%l2,	%o6,	%l0
	mulscc	%i2,	%o1,	%o0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
	orn	%l4,	0x0E49,	%g4
	nop
	fitod	%f2,	%f18
	umul	%i6,	0x0AF4,	%l5
	add	%o5,	%g2,	%i7
	fmul8x16al	%f4,	%f13,	%f14
	movre	%o4,	0x096,	%i4
	array32	%o3,	%o7,	%o2
	fpmerge	%f4,	%f29,	%f12
	edge16n	%l6,	%i1,	%l3
	fmovdge	%xcc,	%f30,	%f11
	bge,pt	%xcc,	loop_1357
	bg	loop_1358
	tvc	%xcc,	0x7
	nop
	setx	0x3F9E28CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xA71488DD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f9,	%f8
loop_1357:
	brlz,a	%g1,	loop_1359
loop_1358:
	fmovdl	%xcc,	%f18,	%f27
	addc	%i0,	0x0FF9,	%i3
	movrlz	%g7,	0x0ED,	%g5
loop_1359:
	popc	%l1,	%g6
	lduh	[%l7 + 0x1E],	%i5
	edge16	%l2,	%g3,	%o6
	fmovsvc	%icc,	%f4,	%f15
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	fbne,a	%fcc1,	loop_1360
	movvs	%xcc,	%l0,	%o1
	edge16ln	%l4,	%g4,	%o0
	bcc,a	%xcc,	loop_1361
loop_1360:
	sdivx	%i6,	0x1ACB,	%o5
	add	%l5,	0x0AD9,	%g2
	ta	%icc,	0x7
loop_1361:
	tl	%icc,	0x5
	brlez	%o4,	loop_1362
	ldd	[%l7 + 0x58],	%f24
	fmovrsgz	%i4,	%f22,	%f14
	fba	%fcc1,	loop_1363
loop_1362:
	sdivcc	%o3,	0x0B52,	%o7
	nop
	setx	0x7D73DFD4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xCE26C9D7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f6,	%f8
	and	%i7,	%o2,	%i1
loop_1363:
	tneg	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%l3,	%l6
	ldsh	[%l7 + 0x68],	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%i0,	loop_1364
	edge8ln	%i3,	%g5,	%g7
	edge16n	%g6,	%l1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1364:
	movre	%l2,	%g3,	%i2
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f30
	fxtos	%f30,	%f8
	flush	%l7 + 0x1C
	srlx	%o6,	0x05,	%l0
	edge8	%l4,	%o1,	%g4
	fbl,a	%fcc3,	loop_1365
	edge8n	%i6,	%o0,	%l5
	fabsd	%f10,	%f26
	edge32ln	%g2,	%o4,	%o5
loop_1365:
	nop
	set	0x08, %l2
	ldsba	[%l7 + %l2] 0x19,	%i4
	umul	%o7,	0x0373,	%i7
	taddcc	%o3,	%i1,	%o2
	fmovrslez	%l6,	%f5,	%f0
	ldstub	[%l7 + 0x71],	%l3
	bn	%xcc,	loop_1366
	brgez,a	%g1,	loop_1367
	fmovrdgez	%i0,	%f8,	%f2
	tleu	%xcc,	0x7
loop_1366:
	std	%f20,	[%l7 + 0x50]
loop_1367:
	sir	0x18F8
	taddcc	%g5,	%i3,	%g6
	fabsd	%f2,	%f24
	andncc	%l1,	%i5,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x54, %g2
	swapa	[%l7 + %g2] 0x80,	%l2
	addc	%i2,	0x10D7,	%g3
	movrgz	%o6,	%l0,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x2A] %asi,	%g4
	nop
	setx	0xB5EDE1E8C8E98C23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB6EAA9949D03B4D5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f30,	%f30
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x0c,	 0x3
	taddcc	%i6,	%o0,	%l5
	mova	%xcc,	%g2,	%o4
	movneg	%icc,	%i4,	%o7
	xor	%i7,	%o3,	%o5
	set	0x64, %o4
	stwa	%i1,	[%l7 + %o4] 0x14
	fpack32	%f2,	%f26,	%f10
	subc	%o2,	0x1AF5,	%l3
	xorcc	%l6,	0x1FBD,	%i0
	edge16ln	%g1,	%i3,	%g6
	srl	%g5,	%l1,	%i5
	addccc	%g7,	%l2,	%i2
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x89,	 0x3
	fmovdvs	%icc,	%f31,	%f11
	subc	%g3,	%l0,	%g4
	edge32ln	%o1,	%l4,	%i6
	nop
	setx	0x862341FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x9158825B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f14,	%f7
	taddcctv	%l5,	0x1C15,	%g2
	umul	%o4,	%i4,	%o0
	ta	%icc,	0x3
	bgu	%icc,	loop_1368
	fbu	%fcc0,	loop_1369
	edge16ln	%i7,	%o7,	%o5
	stbar
loop_1368:
	movrne	%o3,	%i1,	%l3
loop_1369:
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f14
	fxtod	%f14,	%f24
	call	loop_1370
	edge8n	%l6,	%o2,	%g1
	st	%f30,	[%l7 + 0x7C]
	umul	%i3,	0x060C,	%i0
loop_1370:
	tcc	%xcc,	0x3
	movcs	%xcc,	%g6,	%l1
	movpos	%icc,	%i5,	%g5
	addccc	%l2,	0x1D2E,	%i2
	fcmpgt32	%f16,	%f2,	%o6
	addccc	%g3,	0x11F5,	%l0
	bneg	%xcc,	loop_1371
	movn	%xcc,	%g4,	%o1
	xor	%g7,	%i6,	%l4
	srlx	%g2,	0x10,	%l5
loop_1371:
	tvc	%icc,	0x2
	stw	%o4,	[%l7 + 0x5C]
	nop
	setx	loop_1372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%o0,	%i4,	%o7
	tne	%icc,	0x5
	lduh	[%l7 + 0x32],	%o5
loop_1372:
	orcc	%o3,	0x1F2F,	%i7
	nop
	set	0x22, %o2
	sth	%i1,	[%l7 + %o2]
	add	%l6,	0x07B8,	%l3
	tg	%xcc,	0x1
	tg	%xcc,	0x4
	udivx	%g1,	0x051A,	%i3
	orcc	%i0,	%g6,	%o2
	movvs	%icc,	%l1,	%g5
	movg	%icc,	%l2,	%i5
	lduh	[%l7 + 0x20],	%o6
	fone	%f12
	orncc	%g3,	0x0284,	%i2
	bvs,pt	%icc,	loop_1373
	fbge,a	%fcc1,	loop_1374
	srl	%l0,	0x0C,	%o1
	tvc	%xcc,	0x1
loop_1373:
	movvs	%xcc,	%g4,	%i6
loop_1374:
	edge8	%l4,	%g7,	%l5
	movl	%xcc,	%o4,	%o0
	xor	%g2,	0x12C5,	%i4
	popc	0x04AC,	%o7
	tne	%icc,	0x6
	addcc	%o5,	%o3,	%i1
	sethi	0x13B3,	%l6
	movcs	%icc,	%l3,	%g1
	fbne	%fcc0,	loop_1375
	stw	%i3,	[%l7 + 0x44]
	sth	%i0,	[%l7 + 0x42]
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1375:
	tge	%icc,	0x5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g6
	brlz	%i7,	loop_1376
	nop
	fitos	%f14,	%f18
	fstox	%f18,	%f20
	mova	%xcc,	%o2,	%g5
	fbu	%fcc2,	loop_1377
loop_1376:
	edge32l	%l1,	%l2,	%o6
	bl,pn	%icc,	loop_1378
	mulx	%g3,	%i2,	%i5
loop_1377:
	fnor	%f22,	%f0,	%f16
	ba,a,pn	%icc,	loop_1379
loop_1378:
	edge32ln	%o1,	%l0,	%g4
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
loop_1379:
	nop
	fitos	%f10,	%f27
	bgu,pn	%xcc,	loop_1380
	edge32	%g7,	%i6,	%l5
	movg	%xcc,	%o0,	%g2
	xnorcc	%i4,	0x0AAF,	%o4
loop_1380:
	nop
	setx	0xF2495363,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f6
	sra	%o7,	0x14,	%o5
	edge8l	%o3,	%i1,	%l6
	set	0x44, %l6
	stwa	%l3,	[%l7 + %l6] 0xeb
	membar	#Sync
	edge8	%g1,	%i3,	%g6
	fxors	%f21,	%f24,	%f25
	taddcc	%i7,	%i0,	%o2
	fmovd	%f18,	%f4
	alignaddr	%l1,	%g5,	%l2
	fpmerge	%f27,	%f2,	%f6
	smulcc	%o6,	%g3,	%i2
	nop
	setx	0x0267AB1B2AD55287,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xFB9FCFF3B91EA8DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f28,	%f8
	nop
	setx	0x1E9AB832,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xC7E0C7A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f31,	%f10
	sdivcc	%o1,	0x0380,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
	sra	%g4,	0x18,	%l0
	fmovrse	%g7,	%f26,	%f12
	andncc	%l4,	%l5,	%o0
	srl	%i6,	%i4,	%o4
	movneg	%xcc,	%g2,	%o7
	movg	%xcc,	%o3,	%i1
	fnegd	%f12,	%f8
	fbe	%fcc1,	loop_1381
	addc	%l6,	0x0790,	%l3
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x89,	%g1
loop_1381:
	fandnot1s	%f1,	%f31,	%f6
	sdiv	%o5,	0x0246,	%g6
	fmovrdgz	%i7,	%f26,	%f12
	fxor	%f2,	%f28,	%f8
	movg	%icc,	%i0,	%i3
	fnegd	%f18,	%f24
	movrlz	%o2,	0x3D1,	%l1
	sub	%g5,	%l2,	%o6
	brgez	%g3,	loop_1382
	sll	%o1,	0x0E,	%i5
	movn	%icc,	%i2,	%l0
	fba	%fcc0,	loop_1383
loop_1382:
	tgu	%icc,	0x3
	set	0x58, %o0
	stxa	%g7,	[%l7 + %o0] 0x80
loop_1383:
	movvc	%icc,	%g4,	%l5
	fmovsa	%xcc,	%f9,	%f22
	nop
	setx	loop_1384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%xcc,	0x0
	edge32n	%l4,	%i6,	%i4
	ba,a,pt	%xcc,	loop_1385
loop_1384:
	fbue,a	%fcc0,	loop_1386
	edge32l	%o4,	%o0,	%o7
	sub	%o3,	0x1480,	%i1
loop_1385:
	fbl,a	%fcc1,	loop_1387
loop_1386:
	pdist	%f16,	%f8,	%f30
	std	%f22,	[%l7 + 0x50]
	movle	%icc,	%l6,	%g2
loop_1387:
	edge32	%l3,	%g1,	%o5
	nop
	setx	0xECFEA5BB9969C110,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xF529C13ABABAD451,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f28,	%f26
	fpsub16	%f8,	%f28,	%f18
	orcc	%g6,	%i0,	%i3
	tg	%xcc,	0x1
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x14,	 0x2
	ldsb	[%l7 + 0x2C],	%i7
	fzero	%f26
	sir	0x17EE
	sdiv	%l1,	0x0EB9,	%g5
	andncc	%o6,	%g3,	%l2
	edge32	%o1,	%i5,	%l0
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x30] %asi,	%i2
	movrlez	%g7,	0x015,	%g4
	fands	%f0,	%f12,	%f0
	edge32	%l5,	%l4,	%i4
	fmovda	%icc,	%f20,	%f10
	brlez,a	%i6,	loop_1388
	movre	%o0,	%o4,	%o3
	andn	%o7,	0x0851,	%l6
	movrgz	%i1,	0x0F5,	%g2
loop_1388:
	prefetch	[%l7 + 0x2C],	 0x1
	te	%xcc,	0x0
	fnot2s	%f28,	%f22
	movre	%l3,	0x31A,	%o5
	bge,pn	%xcc,	loop_1389
	orn	%g1,	%g6,	%i0
	prefetch	[%l7 + 0x48],	 0x3
	edge32	%i3,	%o2,	%i7
loop_1389:
	udivcc	%g5,	0x1B2E,	%o6
	alignaddr	%g3,	%l2,	%l1
	bg,a,pn	%icc,	loop_1390
	tpos	%xcc,	0x1
	sll	%o1,	%l0,	%i5
	movcc	%icc,	%i2,	%g7
loop_1390:
	or	%l5,	%l4,	%g4
	fandnot1	%f6,	%f18,	%f26
	fmovrse	%i4,	%f26,	%f9
	tg	%xcc,	0x5
	ta	%xcc,	0x2
	tsubcc	%o0,	%o4,	%o3
	smulcc	%i6,	0x0422,	%l6
	fbge	%fcc3,	loop_1391
	nop
	setx	0x962AD88E2FF886E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6A8CA8D36E300594,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f20,	%f26
	fbn	%fcc1,	loop_1392
	sir	0x0790
loop_1391:
	fxnors	%f25,	%f23,	%f24
	fbn	%fcc2,	loop_1393
loop_1392:
	movgu	%icc,	%o7,	%i1
	fbn,a	%fcc1,	loop_1394
	fornot1	%f6,	%f22,	%f14
loop_1393:
	edge16l	%g2,	%l3,	%g1
	fcmpeq16	%f26,	%f22,	%g6
loop_1394:
	sdivx	%o5,	0x097C,	%i0
	bge	%xcc,	loop_1395
	ble,a,pn	%icc,	loop_1396
	subc	%o2,	0x1967,	%i3
	tpos	%xcc,	0x6
loop_1395:
	smulcc	%g5,	0x0C01,	%i7
loop_1396:
	and	%g3,	%o6,	%l1
	set	0x20, %o5
	lduha	[%l7 + %o5] 0x04,	%o1
	sdiv	%l2,	0x1C77,	%l0
	tle	%xcc,	0x2
	fornot2	%f8,	%f0,	%f4
	ldstub	[%l7 + 0x54],	%i5
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	add	%g7,	%l5,	%l4
	nop
	setx	0xA8560A0E4EA346C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xAFF149B7D2E83DCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f8,	%f4
	movle	%icc,	%g4,	%i2
	movn	%icc,	%i4,	%o4
	fornot2	%f30,	%f6,	%f28
	nop
	setx	0x20492B36,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	tvc	%icc,	0x5
	movneg	%icc,	%o0,	%o3
	edge16ln	%l6,	%o7,	%i6
	std	%f8,	[%l7 + 0x28]
	taddcctv	%g2,	%l3,	%i1
	fmovrde	%g1,	%f30,	%f24
	sub	%o5,	0x048C,	%i0
	tl	%xcc,	0x6
	movrne	%o2,	%g6,	%g5
	fcmpgt16	%f6,	%f22,	%i7
	tl	%icc,	0x2
	fsrc1	%f4,	%f2
	wr	%g0,	0x2a,	%asi
	stxa	%g3,	[%l7 + 0x58] %asi
	membar	#Sync
	movrgez	%i3,	0x1F2,	%o6
	sdivx	%o1,	0x00BC,	%l1
	move	%icc,	%l2,	%i5
	andcc	%g7,	0x1EF2,	%l5
	ldx	[%l7 + 0x68],	%l4
	fnot2	%f12,	%f8
	nop
	setx	loop_1397,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%icc,	%l0,	%g4
	fmul8sux16	%f24,	%f6,	%f28
	fmovdcc	%icc,	%f20,	%f25
loop_1397:
	popc	0x1F1E,	%i2
	fbuge,a	%fcc0,	loop_1398
	edge32n	%i4,	%o4,	%o3
	sub	%l6,	%o7,	%i6
	tle	%icc,	0x4
loop_1398:
	udiv	%o0,	0x10A3,	%g2
	edge32ln	%l3,	%i1,	%g1
	set	0x18, %o1
	stxa	%i0,	[%l7 + %o1] 0x11
	set	0x7E, %l1
	stha	%o5,	[%l7 + %l1] 0x27
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f27,	%f28,	%f3
	fands	%f29,	%f1,	%f16
	fands	%f0,	%f12,	%f15
	array8	%g6,	%o2,	%g5
	subcc	%i7,	%i3,	%g3
	brgez	%o6,	loop_1399
	edge32l	%o1,	%l2,	%i5
	sllx	%g7,	0x00,	%l5
	bvc,pt	%xcc,	loop_1400
loop_1399:
	addcc	%l1,	%l0,	%g4
	udiv	%i2,	0x161F,	%i4
	brlez,a	%l4,	loop_1401
loop_1400:
	mulx	%o3,	%l6,	%o7
	andcc	%o4,	%i6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1401:
	move	%icc,	%l3,	%o0
	mulscc	%i1,	0x1C0D,	%g1
	movpos	%xcc,	%o5,	%i0
	movrlz	%o2,	0x09C,	%g5
	movl	%xcc,	%g6,	%i3
	tsubcctv	%i7,	%g3,	%o1
	lduh	[%l7 + 0x3A],	%l2
	fmovrdlz	%i5,	%f24,	%f6
	edge32n	%g7,	%l5,	%o6
	tpos	%icc,	0x4
	edge16	%l0,	%g4,	%l1
	alignaddrl	%i2,	%i4,	%l4
	subcc	%l6,	%o3,	%o7
	brz	%o4,	loop_1402
	fba	%fcc2,	loop_1403
	mulx	%i6,	0x16AE,	%l3
	fpsub32	%f2,	%f4,	%f16
loop_1402:
	fone	%f30
loop_1403:
	fbne,a	%fcc1,	loop_1404
	xorcc	%o0,	0x1DA0,	%i1
	subc	%g1,	0x15DA,	%g2
	edge8l	%o5,	%o2,	%g5
loop_1404:
	stw	%g6,	[%l7 + 0x54]
	fmovrsgz	%i3,	%f13,	%f4
	tsubcc	%i7,	0x024A,	%i0
	nop
	setx	0x344460FE904BD1F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fbu,a	%fcc1,	loop_1405
	te	%icc,	0x5
	sdivx	%g3,	0x1275,	%o1
	fmovsvc	%icc,	%f16,	%f17
loop_1405:
	or	%l2,	%i5,	%g7
	ba,pn	%xcc,	loop_1406
	mova	%icc,	%l5,	%l0
	mulx	%o6,	0x1587,	%l1
	movrgz	%i2,	0x1EA,	%i4
loop_1406:
	xnor	%g4,	%l4,	%o3
	edge16n	%o7,	%o4,	%i6
	movn	%xcc,	%l6,	%o0
	movcs	%icc,	%l3,	%i1
	srlx	%g1,	%o5,	%g2
	fbe,a	%fcc0,	loop_1407
	tle	%icc,	0x7
	movneg	%xcc,	%o2,	%g6
	stw	%i3,	[%l7 + 0x24]
loop_1407:
	andncc	%i7,	%g5,	%i0
	fmovrse	%g3,	%f12,	%f2
	nop
	setx	0x148A174A1074C7D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movg	%icc,	%o1,	%i5
	udiv	%l2,	0x1688,	%l5
	movrgz	%g7,	%l0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i2
	fone	%f0
	st	%f22,	[%l7 + 0x5C]
	bl,pt	%icc,	loop_1408
	fmovdcc	%icc,	%f19,	%f27
	fsrc1	%f0,	%f8
	umulcc	%i4,	%g4,	%o6
loop_1408:
	popc	0x14AF,	%l4
	tge	%xcc,	0x1
	tvc	%icc,	0x5
	brz	%o7,	loop_1409
	bcc,a,pt	%xcc,	loop_1410
	fexpand	%f12,	%f22
	sdivcc	%o3,	0x1F04,	%o4
loop_1409:
	ldd	[%l7 + 0x58],	%f6
loop_1410:
	sra	%l6,	%o0,	%l3
	movrlez	%i6,	%i1,	%g1
	tsubcc	%g2,	0x1646,	%o2
	edge16l	%o5,	%g6,	%i7
	fnot1	%f18,	%f28
	and	%i3,	%g5,	%g3
	sub	%o1,	%i5,	%l2
	movrne	%l5,	0x151,	%g7
	nop
	set	0x48, %l4
	stx	%i0,	[%l7 + %l4]
	ldd	[%l7 + 0x40],	%f30
	bcc,a	%xcc,	loop_1411
	smul	%l1,	%l0,	%i2
	subc	%i4,	%o6,	%g4
	addccc	%l4,	%o7,	%o4
loop_1411:
	edge32n	%o3,	%o0,	%l6
	tge	%icc,	0x4
	popc	%i6,	%l3
	edge16l	%g1,	%i1,	%g2
	udiv	%o2,	0x1AFE,	%o5
	brnz,a	%g6,	loop_1412
	fbe	%fcc0,	loop_1413
	tsubcc	%i7,	0x1415,	%i3
	lduw	[%l7 + 0x74],	%g3
loop_1412:
	tgu	%icc,	0x5
loop_1413:
	tleu	%xcc,	0x7
	fmul8sux16	%f22,	%f14,	%f22
	umul	%g5,	%i5,	%l2
	tgu	%icc,	0x3
	tl	%icc,	0x7
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f12
	wr	%g0,	0x11,	%asi
	stwa	%o1,	[%l7 + 0x38] %asi
	taddcc	%l5,	0x0F48,	%i0
	bne,a	loop_1414
	subccc	%g7,	0x1C98,	%l0
	fandnot2	%f24,	%f20,	%f28
	or	%l1,	%i4,	%i2
loop_1414:
	fpack32	%f28,	%f24,	%f18
	movrgz	%g4,	%l4,	%o6
	bshuffle	%f2,	%f28,	%f24
	sdivx	%o4,	0x00F9,	%o7
	fbuge,a	%fcc3,	loop_1415
	fbu,a	%fcc2,	loop_1416
	te	%icc,	0x2
	tsubcc	%o0,	%l6,	%i6
loop_1415:
	edge8l	%o3,	%g1,	%l3
loop_1416:
	membar	0x65
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%o2
	tgu	%icc,	0x3
	tneg	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o5,	0x17C6,	%i1
	and	%i7,	0x0413,	%g6
	bleu,a	loop_1417
	tvs	%icc,	0x5
	fmovdg	%icc,	%f26,	%f31
	fmovd	%f2,	%f0
loop_1417:
	fbl	%fcc3,	loop_1418
	mova	%xcc,	%g3,	%i3
	mulscc	%i5,	%l2,	%g5
	subc	%o1,	%l5,	%i0
loop_1418:
	ldx	[%l7 + 0x68],	%l0
	sub	%g7,	0x02BA,	%i4
	bshuffle	%f0,	%f8,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i2,	%g4,	%l1
	fmovrdgz	%l4,	%f22,	%f20
	call	loop_1419
	movne	%xcc,	%o6,	%o4
	bne,a	loop_1420
	fxnors	%f10,	%f4,	%f16
loop_1419:
	movgu	%xcc,	%o0,	%o7
	edge32n	%i6,	%o3,	%g1
loop_1420:
	addcc	%l3,	%l6,	%o2
	udivx	%g2,	0x013D,	%o5
	set	0x3E, %i0
	lduha	[%l7 + %i0] 0x18,	%i7
	edge8	%g6,	%g3,	%i1
	fones	%f27
	fbuge,a	%fcc0,	loop_1421
	fmovrsne	%i5,	%f20,	%f30
	movrlez	%l2,	%g5,	%o1
	srax	%l5,	%i3,	%l0
loop_1421:
	nop
	set	0x20, %i7
	ldda	[%l7 + %i7] 0xe2,	%i0
	fmovsa	%xcc,	%f25,	%f8
	fmovscs	%xcc,	%f13,	%f13
	orcc	%g7,	%i4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l1,	0x0534,	%l4
	andcc	%g4,	0x0651,	%o6
	fmovrsne	%o4,	%f28,	%f19
	fxnor	%f26,	%f22,	%f10
	movrgez	%o7,	0x22C,	%o0
	tge	%xcc,	0x1
	fxnors	%f3,	%f18,	%f9
	add	%o3,	%i6,	%l3
	membar	0x3E
	edge32l	%l6,	%g1,	%g2
	tn	%icc,	0x3
	fzeros	%f3
	array8	%o5,	%o2,	%g6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	xorcc	%i1,	%i5,	%i7
	movgu	%xcc,	%g5,	%o1
	set	0x48, %g1
	stha	%l2,	[%l7 + %g1] 0x22
	membar	#Sync
	movvs	%icc,	%i3,	%l0
	ta	%xcc,	0x1
	orn	%l5,	%i0,	%g7
	umulcc	%i2,	%l1,	%l4
	tsubcctv	%g4,	%o6,	%o4
	tn	%xcc,	0x1
	tsubcc	%i4,	0x0D96,	%o0
	umulcc	%o3,	%o7,	%l3
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x14,	 0x3
	smulcc	%g1,	0x15CA,	%g2
	movgu	%icc,	%i6,	%o2
	fcmpeq16	%f6,	%f30,	%g6
	taddcc	%o5,	%i1,	%i5
	movg	%icc,	%i7,	%g5
	stw	%g3,	[%l7 + 0x68]
	fornot2	%f20,	%f6,	%f22
	srl	%o1,	%l2,	%l0
	xnor	%i3,	0x0904,	%l5
	fmovdcc	%icc,	%f30,	%f12
	movcs	%xcc,	%g7,	%i0
	orcc	%i2,	0x18D1,	%l4
	fmovdl	%xcc,	%f9,	%f12
	fbne	%fcc0,	loop_1422
	fblg,a	%fcc1,	loop_1423
	bvs,a,pn	%xcc,	loop_1424
	fpsub16	%f30,	%f8,	%f30
loop_1422:
	fbug,a	%fcc1,	loop_1425
loop_1423:
	bn,a	%icc,	loop_1426
loop_1424:
	nop
	setx	0x41FC6FC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x8A0015DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f10,	%f13
	mulscc	%g4,	0x194C,	%o6
loop_1425:
	nop
	set	0x7A, %i5
	ldsh	[%l7 + %i5],	%l1
loop_1426:
	fbue,a	%fcc2,	loop_1427
	movn	%xcc,	%i4,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,pn	%icc,	loop_1428
loop_1427:
	subc	%o0,	%o7,	%o3
	mulscc	%l3,	%l6,	%g2
	edge16ln	%i6,	%g1,	%o2
loop_1428:
	ta	%xcc,	0x1
	prefetch	[%l7 + 0x10],	 0x1
	fcmple16	%f18,	%f0,	%g6
	bshuffle	%f16,	%f30,	%f6
	mulscc	%o5,	0x092D,	%i1
	edge32ln	%i7,	%g5,	%i5
	addc	%o1,	0x07A2,	%l2
	fbuge,a	%fcc3,	loop_1429
	fbo	%fcc2,	loop_1430
	movneg	%xcc,	%g3,	%l0
	set	0x60, %g5
	stxa	%l5,	[%l7 + %g5] 0x88
loop_1429:
	fpadd16	%f8,	%f26,	%f18
loop_1430:
	flush	%l7 + 0x78
	bpos,a,pn	%icc,	loop_1431
	fornot2	%f28,	%f4,	%f26
	fmovsvs	%xcc,	%f4,	%f29
	fmovdn	%xcc,	%f24,	%f30
loop_1431:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0332,	%g7
	array32	%i0,	%i3,	%l4
	movneg	%xcc,	%i2,	%g4
	fpadd32s	%f23,	%f13,	%f17
	fbl,a	%fcc2,	loop_1432
	sdiv	%o6,	0x16F6,	%i4
	fmovsleu	%icc,	%f16,	%f11
	sdiv	%l1,	0x15D9,	%o0
loop_1432:
	movleu	%icc,	%o7,	%o3
	tge	%xcc,	0x4
	mulscc	%l3,	%l6,	%o4
	addc	%i6,	0x1B1B,	%g1
	nop
	setx	loop_1433,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%o2,	0x0590,	%g2
	set	0x70, %o7
	lda	[%l7 + %o7] 0x0c,	%f28
loop_1433:
	tne	%icc,	0x5
	movrlz	%o5,	%g6,	%i7
	sub	%g5,	%i1,	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o1,	%g3
	fmovdleu	%icc,	%f19,	%f2
	fnor	%f12,	%f24,	%f24
	fbge	%fcc1,	loop_1434
	edge32	%l2,	%l0,	%l5
	fpack16	%f12,	%f12
	fands	%f21,	%f15,	%f15
loop_1434:
	mulx	%i0,	0x058D,	%g7
	smul	%i3,	%l4,	%g4
	sir	0x01C8
	edge32n	%o6,	%i4,	%l1
	edge8	%i2,	%o7,	%o3
	fnands	%f12,	%f9,	%f2
	sra	%l3,	0x0A,	%o0
	sub	%o4,	%l6,	%i6
	fnegs	%f8,	%f6
	movrlez	%o2,	%g2,	%g1
	subcc	%o5,	%g6,	%i7
	movpos	%xcc,	%g5,	%i5
	movleu	%xcc,	%o1,	%i1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g3
	tleu	%icc,	0x5
	sub	%l0,	0x1274,	%l5
	bge,pn	%icc,	loop_1435
	fcmple32	%f8,	%f0,	%l2
	fzero	%f6
	fmul8x16au	%f9,	%f5,	%f14
loop_1435:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i0,	%i3
	smulcc	%g7,	%l4,	%o6
	mova	%icc,	%i4,	%g4
	movrne	%l1,	0x0AF,	%i2
	fmovdcs	%icc,	%f23,	%f8
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	sll	%o3,	%o7,	%o0
	bg	loop_1436
	lduh	[%l7 + 0x7A],	%o4
	sllx	%l6,	0x0B,	%i6
	edge8ln	%o2,	%l3,	%g2
loop_1436:
	alignaddrl	%o5,	%g1,	%i7
	fblg,a	%fcc0,	loop_1437
	brnz	%g6,	loop_1438
	edge16	%i5,	%g5,	%o1
	ldsw	[%l7 + 0x38],	%g3
loop_1437:
	fnor	%f14,	%f20,	%f8
loop_1438:
	addc	%l0,	0x0B79,	%l5
	andncc	%l2,	%i1,	%i3
	stbar
	set	0x2D, %g7
	ldsba	[%l7 + %g7] 0x80,	%g7
	fcmple16	%f0,	%f8,	%i0
	lduw	[%l7 + 0x44],	%l4
	mulscc	%i4,	0x1185,	%o6
	movge	%xcc,	%l1,	%i2
	tn	%xcc,	0x5
	bn,a,pn	%icc,	loop_1439
	ldsw	[%l7 + 0x60],	%g4
	tpos	%icc,	0x2
	ldsw	[%l7 + 0x70],	%o3
loop_1439:
	orcc	%o7,	%o0,	%o4
	wr	%g0,	0x27,	%asi
	stba	%i6,	[%l7 + 0x16] %asi
	membar	#Sync
	fbo,a	%fcc1,	loop_1440
	bgu,a	%icc,	loop_1441
	bge	loop_1442
	edge8ln	%l6,	%l3,	%o2
loop_1440:
	fmovrdgez	%g2,	%f22,	%f8
loop_1441:
	nop
	setx	loop_1443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1442:
	fandnot2s	%f8,	%f8,	%f20
	fmovdpos	%xcc,	%f6,	%f12
	movre	%o5,	0x060,	%g1
loop_1443:
	fmovdleu	%icc,	%f23,	%f5
	mulx	%i7,	%g6,	%g5
	movgu	%icc,	%o1,	%g3
	edge32	%i5,	%l0,	%l2
	addcc	%l5,	%i1,	%i3
	tgu	%icc,	0x6
	popc	%i0,	%g7
	brgez	%l4,	loop_1444
	sethi	0x0996,	%i4
	fbul	%fcc1,	loop_1445
	edge8ln	%o6,	%i2,	%g4
loop_1444:
	pdist	%f0,	%f16,	%f10
	smul	%l1,	%o7,	%o3
loop_1445:
	edge8ln	%o4,	%i6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l3,	%o2,	%g2
	tvc	%icc,	0x3
	set	0x10, %i2
	ldxa	[%g0 + %i2] 0x21,	%o5
	fpack32	%f18,	%f8,	%f0
	fnegd	%f12,	%f18
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x46] %asi,	%g1
	udivx	%l6,	0x0412,	%i7
	bge,a,pn	%icc,	loop_1446
	bne,a,pn	%icc,	loop_1447
	movne	%icc,	%g6,	%g5
	tge	%xcc,	0x2
loop_1446:
	fpackfix	%f10,	%f14
loop_1447:
	tleu	%icc,	0x7
	or	%o1,	%g3,	%i5
	nop
	fitos	%f14,	%f8
	fstod	%f8,	%f26
	set	0x74, %l0
	lduwa	[%l7 + %l0] 0x81,	%l0
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x11,	%l5
	tvs	%icc,	0x5
	nop
	fitos	%f31,	%f21
	fcmple16	%f4,	%f8,	%l2
	sra	%i3,	0x18,	%i0
	andcc	%i1,	0x0864,	%l4
	srlx	%i4,	%o6,	%i2
	bg	loop_1448
	st	%f16,	[%l7 + 0x2C]
	alignaddrl	%g7,	%g4,	%l1
	bn	%xcc,	loop_1449
loop_1448:
	movpos	%icc,	%o3,	%o4
	fpadd32	%f2,	%f26,	%f0
	fmovrde	%o7,	%f10,	%f2
loop_1449:
	bgu,a,pn	%xcc,	loop_1450
	array16	%i6,	%l3,	%o0
	fpackfix	%f30,	%f3
	taddcc	%o2,	%o5,	%g2
loop_1450:
	edge32	%g1,	%i7,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l6,	0x0CA1,	%o1
	fbue	%fcc3,	loop_1451
	ld	[%l7 + 0x14],	%f27
	fbn,a	%fcc2,	loop_1452
	nop
	setx	0xD2F75498DB398A04,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xCDB28A1A930B6263,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f26,	%f10
loop_1451:
	addccc	%g5,	0x1A6B,	%i5
	fmul8x16	%f3,	%f28,	%f2
loop_1452:
	fpack16	%f22,	%f19
	fornot1	%f0,	%f22,	%f4
	fmovdle	%xcc,	%f25,	%f16
	fcmpne16	%f6,	%f0,	%g3
	fmul8x16	%f27,	%f26,	%f20
	fbg,a	%fcc2,	loop_1453
	array32	%l0,	%l2,	%i3
	xorcc	%l5,	%i0,	%i1
	fmul8x16	%f9,	%f22,	%f24
loop_1453:
	tvs	%xcc,	0x0
	xnorcc	%l4,	0x0BA6,	%i4
	brlez,a	%o6,	loop_1454
	fmovrslz	%i2,	%f15,	%f29
	bge,pn	%icc,	loop_1455
	movl	%xcc,	%g7,	%l1
loop_1454:
	xnor	%g4,	%o3,	%o7
	movvs	%icc,	%o4,	%i6
loop_1455:
	nop
	set	0x3E, %l5
	ldsha	[%l7 + %l5] 0x04,	%l3
	movneg	%xcc,	%o0,	%o2
	andncc	%g2,	%g1,	%o5
	orn	%g6,	%i7,	%o1
	orcc	%g5,	0x1B46,	%i5
	fmovsa	%icc,	%f20,	%f19
	nop
	set	0x38, %o3
	lduw	[%l7 + %o3],	%l6
	fmovda	%icc,	%f3,	%f21
	addcc	%l0,	0x1A7D,	%g3
	array16	%i3,	%l2,	%i0
	ta	%xcc,	0x4
	brgez	%l5,	loop_1456
	tsubcc	%i1,	%i4,	%l4
	sdivx	%i2,	0x0D8C,	%g7
	mova	%icc,	%o6,	%g4
loop_1456:
	umulcc	%o3,	%l1,	%o7
	movrne	%i6,	%l3,	%o4
	alignaddr	%o0,	%o2,	%g1
	movcc	%xcc,	%g2,	%o5
	fbne	%fcc3,	loop_1457
	brz	%g6,	loop_1458
	sub	%i7,	%o1,	%g5
	sdiv	%l6,	0x19DF,	%l0
loop_1457:
	std	%f30,	[%l7 + 0x20]
loop_1458:
	ldd	[%l7 + 0x30],	%g2
	edge8ln	%i5,	%l2,	%i3
	nop
	setx	0x75041C3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xD652E6AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f18,	%f31
	fbu,a	%fcc1,	loop_1459
	movn	%icc,	%l5,	%i0
	sub	%i4,	0x06B2,	%i1
	fnot1	%f6,	%f22
loop_1459:
	st	%f9,	[%l7 + 0x68]
	sllx	%l4,	0x0B,	%g7
	bcc,pn	%icc,	loop_1460
	edge16ln	%i2,	%g4,	%o6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
loop_1460:
	nop
	fitos	%f12,	%f2
	fstod	%f2,	%f26
	tleu	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o3
	addc	%o7,	%i6,	%o4
	edge16ln	%l3,	%o0,	%g1
	movvs	%xcc,	%o2,	%g2
	tsubcctv	%g6,	%o5,	%o1
	nop
	setx	0x49576A7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x463D6B93,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f7,	%f5
	taddcc	%g5,	0x0034,	%i7
	orcc	%l6,	0x1E8C,	%l0
	movneg	%xcc,	%i5,	%l2
	orcc	%i3,	0x0ECD,	%g3
	addc	%l5,	0x1CC2,	%i0
	fpsub16s	%f30,	%f31,	%f26
	fnegd	%f26,	%f12
	edge32l	%i4,	%i1,	%g7
	movge	%icc,	%l4,	%g4
	nop
	fitos	%f13,	%f10
	fstox	%f10,	%f24
	brlz	%i2,	loop_1461
	tsubcc	%l1,	0x1A23,	%o6
	movcc	%icc,	%o7,	%i6
	tpos	%icc,	0x2
loop_1461:
	fxors	%f1,	%f5,	%f6
	brlez,a	%o4,	loop_1462
	edge16ln	%o3,	%l3,	%o0
	movgu	%xcc,	%o2,	%g1
	edge16ln	%g6,	%o5,	%o1
loop_1462:
	sir	0x18DD
	nop
	set	0x60, %g6
	ldsw	[%l7 + %g6],	%g2
	movrlz	%i7,	%l6,	%g5
	addc	%l0,	0x0851,	%l2
	fmovscc	%xcc,	%f30,	%f8
	fnot2	%f4,	%f14
	orncc	%i3,	0x0647,	%i5
	udivcc	%l5,	0x1144,	%i0
	fxor	%f2,	%f20,	%f0
	fmovdcs	%xcc,	%f5,	%f7
	movrlz	%g3,	%i1,	%i4
	move	%xcc,	%g7,	%l4
	tcc	%icc,	0x7
	xnor	%i2,	0x017F,	%g4
	be	%icc,	loop_1463
	bcc	loop_1464
	array8	%o6,	%o7,	%i6
	mulscc	%o4,	0x0BA0,	%o3
loop_1463:
	smul	%l3,	0x0FD4,	%o0
loop_1464:
	taddcc	%o2,	%l1,	%g6
	edge16n	%o5,	%o1,	%g2
	orn	%i7,	%g1,	%l6
	xor	%g5,	%l2,	%i3
	mulscc	%l0,	0x0EC8,	%i5
	movvc	%xcc,	%l5,	%g3
	movrne	%i0,	0x174,	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%g7
	movneg	%xcc,	%l4,	%i2
	movneg	%xcc,	%o6,	%g4
	fbge,a	%fcc0,	loop_1465
	movle	%xcc,	%i6,	%o7
	tne	%xcc,	0x0
	tvc	%icc,	0x6
loop_1465:
	tn	%xcc,	0x3
	orncc	%o3,	%o4,	%o0
	subc	%l3,	0x08E4,	%o2
	sethi	0x0031,	%l1
	sdivcc	%o5,	0x0402,	%g6
	udivx	%o1,	0x18D0,	%i7
	ta	%icc,	0x1
	nop
	setx	0x52F0104BBF5D5C99,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x58B4AB58B3A18E1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f2,	%f30
	movneg	%icc,	%g1,	%g2
	sdiv	%l6,	0x10F3,	%l2
	ta	%xcc,	0x2
	edge32l	%i3,	%g5,	%i5
	fbe	%fcc3,	loop_1466
	edge8l	%l0,	%g3,	%l5
	swap	[%l7 + 0x60],	%i0
	array8	%i1,	%i4,	%l4
loop_1466:
	nop
	set	0x14, %l2
	lduwa	[%l7 + %l2] 0x04,	%i2
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f17
	tne	%icc,	0x0
	tn	%xcc,	0x2
	membar	0x70
	andn	%g7,	%o6,	%i6
	movcc	%xcc,	%o7,	%g4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x37] %asi,	%o3
	addc	%o4,	%l3,	%o0
	movvc	%icc,	%l1,	%o2
	or	%g6,	0x020D,	%o1
	ldd	[%l7 + 0x28],	%f16
	ld	[%l7 + 0x2C],	%f27
	andn	%o5,	0x1AC9,	%i7
	tcc	%xcc,	0x5
	sra	%g2,	%g1,	%l2
	fors	%f30,	%f20,	%f17
	movleu	%icc,	%i3,	%g5
	fmovrslz	%i5,	%f22,	%f10
	orcc	%l0,	0x1331,	%l6
	fand	%f6,	%f12,	%f10
	srl	%g3,	0x02,	%i0
	nop
	set	0x50, %i6
	stx	%l5,	[%l7 + %i6]
	fbue,a	%fcc3,	loop_1467
	fcmpne32	%f14,	%f10,	%i4
	tge	%icc,	0x0
	edge32ln	%l4,	%i2,	%g7
loop_1467:
	smul	%i1,	%o6,	%i6
	tvs	%icc,	0x0
	fnegd	%f16,	%f30
	tsubcc	%g4,	%o3,	%o7
	nop
	setx	0xB049DFA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	addccc	%l3,	0x0B65,	%o0
	nop
	setx	0xBEADA102169E9FB2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x729CF70B0741DD00,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f6,	%f10
	fmovdl	%icc,	%f23,	%f0
	orn	%l1,	%o2,	%g6
	movcs	%icc,	%o4,	%o5
	xnorcc	%i7,	0x1A58,	%g2
	udivx	%o1,	0x1562,	%l2
	tne	%icc,	0x2
	fmovdcs	%xcc,	%f22,	%f5
	nop
	setx	0xE9D6CC7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x11C5BA18,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f14,	%f13
	move	%xcc,	%g1,	%i3
	sdiv	%g5,	0x10A4,	%i5
	fba,a	%fcc0,	loop_1468
	andcc	%l6,	0x0A94,	%g3
	nop
	fitos	%f3,	%f14
	fstod	%f14,	%f6
	fmovrdlez	%i0,	%f16,	%f4
loop_1468:
	stx	%l5,	[%l7 + 0x58]
	fble	%fcc0,	loop_1469
	flush	%l7 + 0x60
	and	%i4,	0x1666,	%l0
	bcc,a,pt	%xcc,	loop_1470
loop_1469:
	edge8n	%l4,	%i2,	%i1
	bvs,pn	%xcc,	loop_1471
	fmovsge	%icc,	%f5,	%f2
loop_1470:
	brlz	%g7,	loop_1472
	sub	%i6,	0x081E,	%g4
loop_1471:
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f19
	tneg	%icc,	0x0
loop_1472:
	popc	0x12A6,	%o6
	andn	%o7,	%o3,	%o0
	sir	0x0B03
	fpack32	%f14,	%f20,	%f4
	udiv	%l3,	0x1E16,	%o2
	srax	%l1,	%o4,	%o5
	edge8n	%g6,	%g2,	%i7
	tsubcc	%l2,	%g1,	%o1
	tn	%xcc,	0x0
	movvc	%icc,	%g5,	%i5
	xorcc	%i3,	%l6,	%g3
	swap	[%l7 + 0x74],	%l5
	edge16n	%i4,	%l0,	%i0
	ble,pn	%xcc,	loop_1473
	brnz	%l4,	loop_1474
	edge8l	%i1,	%i2,	%i6
	popc	0x1FE8,	%g4
loop_1473:
	fors	%f12,	%f8,	%f23
loop_1474:
	addccc	%g7,	0x0D9E,	%o6
	edge16n	%o3,	%o0,	%o7
	bneg,a	loop_1475
	fbe	%fcc0,	loop_1476
	fba,a	%fcc0,	loop_1477
	fpadd16s	%f13,	%f5,	%f30
loop_1475:
	sllx	%l3,	0x1C,	%o2
loop_1476:
	smul	%l1,	0x04AF,	%o4
loop_1477:
	andn	%o5,	0x0838,	%g6
	movge	%icc,	%i7,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g1,	%o1
	edge8n	%g5,	%g2,	%i5
	edge32	%l6,	%i3,	%g3
	ble	%xcc,	loop_1478
	nop
	setx	0x307F54A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	brlz	%i4,	loop_1479
	edge16	%l0,	%l5,	%l4
loop_1478:
	fpadd32s	%f3,	%f20,	%f11
	bne,a	loop_1480
loop_1479:
	sll	%i0,	%i1,	%i6
	fmovrsne	%i2,	%f23,	%f19
	movvs	%xcc,	%g7,	%g4
loop_1480:
	ldd	[%l7 + 0x28],	%o2
	fpackfix	%f8,	%f29
	tvc	%icc,	0x5
	edge32	%o6,	%o7,	%l3
	add	%o0,	%o2,	%o4
	andn	%l1,	0x0376,	%g6
	fzero	%f28
	andcc	%i7,	0x045F,	%l2
	mulscc	%o5,	0x0459,	%o1
	mulx	%g1,	0x103F,	%g5
	movleu	%xcc,	%g2,	%i5
	for	%f14,	%f14,	%f10
	nop
	setx	0xF21768BFCAC5F282,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f14
	te	%xcc,	0x6
	fsrc2	%f16,	%f14
	tne	%icc,	0x0
	sub	%l6,	%i3,	%i4
	edge32n	%l0,	%g3,	%l5
	movge	%icc,	%l4,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f22,	%f30,	%f2
	fmovs	%f4,	%f7
	tvs	%xcc,	0x1
	fnot1s	%f18,	%f21
	edge32	%i0,	%i2,	%i6
	nop
	fitos	%f11,	%f30
	fstox	%f30,	%f4
	movge	%icc,	%g7,	%o3
	movleu	%xcc,	%g4,	%o7
	ld	[%l7 + 0x20],	%f26
	sll	%o6,	%l3,	%o2
	bn,a	%icc,	loop_1481
	xorcc	%o4,	0x0007,	%o0
	nop
	set	0x16, %g3
	sth	%l1,	[%l7 + %g3]
	nop
	setx	loop_1482,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1481:
	tcc	%xcc,	0x0
	sethi	0x1430,	%i7
	fmovrsne	%g6,	%f29,	%f24
loop_1482:
	fmovsvs	%icc,	%f13,	%f3
	lduh	[%l7 + 0x0C],	%l2
	alignaddrl	%o1,	%o5,	%g5
	subc	%g2,	0x129D,	%i5
	smul	%g1,	0x1534,	%i3
	addcc	%i4,	%l0,	%g3
	set	0x0E, %g2
	stha	%l6,	[%l7 + %g2] 0x88
	movneg	%icc,	%l4,	%l5
	orncc	%i1,	%i0,	%i6
	fmovscc	%icc,	%f9,	%f16
	sll	%g7,	%o3,	%g4
	fmovrdne	%i2,	%f28,	%f18
	tgu	%xcc,	0x3
	sllx	%o7,	0x1D,	%l3
	ta	%xcc,	0x4
	subccc	%o2,	0x08AE,	%o4
	fpadd16	%f24,	%f26,	%f4
	tcs	%icc,	0x5
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%o6
	fsrc2s	%f23,	%f18
	andncc	%o0,	%l1,	%i7
	udiv	%g6,	0x04CC,	%l2
	fmovdneg	%icc,	%f6,	%f30
	fbge	%fcc3,	loop_1483
	be,a,pn	%xcc,	loop_1484
	move	%icc,	%o5,	%g5
	edge8n	%g2,	%i5,	%g1
loop_1483:
	fmovsne	%xcc,	%f5,	%f14
loop_1484:
	edge16l	%o1,	%i3,	%i4
	tsubcc	%g3,	%l0,	%l4
	tne	%icc,	0x3
	fbue,a	%fcc0,	loop_1485
	sll	%l6,	%l5,	%i0
	wr	%g0,	0x11,	%asi
	stba	%i1,	[%l7 + 0x6C] %asi
loop_1485:
	edge32n	%i6,	%g7,	%o3
	srl	%i2,	0x0F,	%g4
	movvs	%icc,	%l3,	%o7
	orcc	%o4,	0x05BE,	%o6
	bgu,pn	%icc,	loop_1486
	edge8ln	%o0,	%l1,	%o2
	te	%xcc,	0x0
	brlz,a	%i7,	loop_1487
loop_1486:
	fpsub32	%f10,	%f14,	%f12
	wr	%g0,	0x0c,	%asi
	sta	%f14,	[%l7 + 0x20] %asi
loop_1487:
	umul	%g6,	%o5,	%g5
	fbge,a	%fcc2,	loop_1488
	tneg	%xcc,	0x0
	fmovrsne	%l2,	%f8,	%f7
	sdiv	%i5,	0x12DD,	%g2
loop_1488:
	edge8l	%o1,	%i3,	%g1
	movleu	%icc,	%i4,	%l0
	edge8l	%g3,	%l6,	%l5
	xnor	%i0,	0x1900,	%i1
	xor	%i6,	%g7,	%o3
	movrgz	%i2,	%l4,	%l3
	fxors	%f16,	%f5,	%f27
	alignaddrl	%g4,	%o4,	%o7
	fmovdcs	%icc,	%f7,	%f18
	srl	%o6,	%l1,	%o2
	fnot1	%f4,	%f0
	tsubcc	%i7,	0x12B8,	%o0
	movvc	%icc,	%g6,	%o5
	ldsb	[%l7 + 0x4F],	%l2
	addccc	%i5,	%g2,	%g5
	movrlez	%o1,	0x0F2,	%g1
	ldx	[%l7 + 0x70],	%i4
	fpadd32s	%f21,	%f28,	%f20
	sll	%l0,	%i3,	%g3
	udivcc	%l5,	0x1DFF,	%i0
	array16	%i1,	%i6,	%l6
	set	0x32, %o2
	lduba	[%l7 + %o2] 0x14,	%o3
	movgu	%icc,	%g7,	%l4
	movl	%icc,	%l3,	%g4
	tcc	%icc,	0x5
	tvc	%xcc,	0x2
	movleu	%xcc,	%i2,	%o7
	tleu	%xcc,	0x6
	edge8	%o6,	%o4,	%l1
	nop
	setx loop_1489, %l0, %l1
	jmpl %l1, %o2
	nop
	set	0x2C, %i4
	lduw	[%l7 + %i4],	%i7
	udivx	%o0,	0x070D,	%g6
	ldstub	[%l7 + 0x36],	%o5
loop_1489:
	fmovrde	%i5,	%f16,	%f8
	srl	%g2,	%l2,	%g5
	ba,pn	%icc,	loop_1490
	fones	%f9
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f8
	fxtod	%f8,	%f8
	sethi	0x0145,	%g1
loop_1490:
	tcc	%icc,	0x4
	fmovrsgz	%i4,	%f19,	%f31
	edge32l	%o1,	%l0,	%g3
	fmul8x16au	%f1,	%f18,	%f14
	subc	%i3,	0x0599,	%i0
	orcc	%l5,	0x162A,	%i1
	bneg,a	%xcc,	loop_1491
	orn	%i6,	%l6,	%g7
	fcmpgt32	%f6,	%f0,	%l4
	st	%f12,	[%l7 + 0x70]
loop_1491:
	ldx	[%l7 + 0x40],	%o3
	srl	%g4,	0x1E,	%l3
	fba	%fcc1,	loop_1492
	bneg,a,pn	%icc,	loop_1493
	movrlz	%o7,	0x371,	%i2
	fmovsn	%icc,	%f15,	%f17
loop_1492:
	bvc	%xcc,	loop_1494
loop_1493:
	bvs	loop_1495
	array8	%o4,	%o6,	%l1
	movrlz	%i7,	%o0,	%o2
loop_1494:
	fnegs	%f24,	%f14
loop_1495:
	bne	loop_1496
	sra	%o5,	0x15,	%i5
	edge32ln	%g2,	%l2,	%g5
	mulx	%g6,	%g1,	%i4
loop_1496:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	ta	%icc,	0x4
	tcs	%icc,	0x3
	sllx	%o1,	0x14,	%g3
	movn	%xcc,	%i0,	%l5
	movne	%xcc,	%i1,	%i3
	fmovda	%xcc,	%f16,	%f15
	tle	%icc,	0x1
	tvc	%icc,	0x6
	fpsub16	%f8,	%f2,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1E54,	%l6
	xor	%g7,	%l4,	%i6
	fbne,a	%fcc2,	loop_1497
	fbe,a	%fcc0,	loop_1498
	movneg	%xcc,	%o3,	%l3
	fbe	%fcc3,	loop_1499
loop_1497:
	brgz	%o7,	loop_1500
loop_1498:
	addc	%i2,	%g4,	%o6
	edge16l	%l1,	%o4,	%o0
loop_1499:
	nop
	setx	0x5FDA84AFF3CD2D59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8C285B5B5C5BD53A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f14,	%f16
loop_1500:
	te	%xcc,	0x0
	edge16l	%i7,	%o5,	%i5
	tle	%xcc,	0x0
	set	0x28, %l6
	stxa	%o2,	[%g0 + %l6] 0x20
	xor	%l2,	%g5,	%g2
	sethi	0x0EA4,	%g1
	edge8	%i4,	%g6,	%l0
	alignaddrl	%o1,	%i0,	%l5
	movle	%xcc,	%i1,	%g3
	addcc	%l6,	%g7,	%l4
	move	%xcc,	%i6,	%i3
	movrlez	%o3,	0x07D,	%o7
	fmovrslez	%l3,	%f6,	%f19
	tn	%icc,	0x2
	mulx	%g4,	0x0179,	%o6
	fand	%f26,	%f12,	%f14
	bg	loop_1501
	add	%l1,	%i2,	%o4
	wr	%g0,	0x19,	%asi
	stba	%i7,	[%l7 + 0x53] %asi
loop_1501:
	addcc	%o5,	%i5,	%o2
	movge	%icc,	%l2,	%o0
	mulscc	%g2,	%g1,	%i4
	orcc	%g5,	0x0F51,	%g6
	fbug,a	%fcc1,	loop_1502
	tge	%xcc,	0x2
	fmovsa	%icc,	%f10,	%f24
	tneg	%icc,	0x3
loop_1502:
	fornot2s	%f26,	%f0,	%f24
	add	%l0,	%i0,	%l5
	udivcc	%o1,	0x17C5,	%i1
	ta	%xcc,	0x1
	bneg	%icc,	loop_1503
	movvs	%xcc,	%g3,	%l6
	sdivcc	%g7,	0x04B6,	%i6
	srl	%i3,	0x18,	%o3
loop_1503:
	movneg	%xcc,	%l4,	%l3
	xnor	%o7,	%g4,	%o6
	udiv	%l1,	0x062D,	%i2
	movcc	%xcc,	%o4,	%o5
	umulcc	%i5,	%i7,	%o2
	fnors	%f9,	%f28,	%f23
	sll	%o0,	0x0B,	%g2
	bge,a,pt	%xcc,	loop_1504
	fmul8ulx16	%f30,	%f8,	%f0
	move	%xcc,	%g1,	%l2
	tleu	%icc,	0x1
loop_1504:
	andcc	%i4,	0x0C1C,	%g6
	orncc	%g5,	%i0,	%l0
	tle	%icc,	0x1
	tleu	%icc,	0x5
	alignaddr	%o1,	%l5,	%g3
	array16	%l6,	%g7,	%i6
	xnorcc	%i1,	0x13FF,	%o3
	fbn	%fcc1,	loop_1505
	smulcc	%i3,	%l4,	%l3
	tcs	%icc,	0x2
	subccc	%o7,	0x0616,	%g4
loop_1505:
	edge32l	%o6,	%i2,	%o4
	edge32n	%l1,	%i5,	%i7
	sub	%o5,	%o2,	%g2
	fmovdg	%xcc,	%f0,	%f25
	nop
	setx	loop_1506,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%icc,	0x7
	alignaddr	%g1,	%l2,	%o0
	std	%f12,	[%l7 + 0x78]
loop_1506:
	movcc	%xcc,	%g6,	%g5
	mulx	%i0,	0x0E56,	%l0
	nop
	setx	loop_1507,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos	%icc,	loop_1508
	fabss	%f10,	%f27
	move	%xcc,	%o1,	%l5
loop_1507:
	edge32ln	%i4,	%g3,	%g7
loop_1508:
	movn	%xcc,	%l6,	%i1
	fzeros	%f13
	mulscc	%o3,	0x09EE,	%i6
	nop
	setx	loop_1509,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32s	%f23,	%f27,	%f12
	fmovdle	%xcc,	%f9,	%f3
	nop
	setx	0x407AF949,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_1509:
	edge8	%l4,	%i3,	%l3
	movgu	%icc,	%g4,	%o6
	lduh	[%l7 + 0x12],	%i2
	addccc	%o7,	%l1,	%i5
	edge32ln	%i7,	%o5,	%o2
	fpadd32s	%f10,	%f20,	%f14
	nop
	set	0x79, %i3
	stb	%o4,	[%l7 + %i3]
	fandnot1s	%f5,	%f18,	%f10
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x60] %asi,	%g2
	movgu	%icc,	%g1,	%l2
	sdivx	%o0,	0x08F7,	%g6
	movne	%icc,	%g5,	%i0
	addc	%o1,	%l0,	%l5
	sdiv	%g3,	0x189F,	%i4
	edge32n	%l6,	%i1,	%g7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x16] %asi,	%i6
	tvs	%icc,	0x6
	brgez	%o3,	loop_1510
	tleu	%icc,	0x2
	tvc	%xcc,	0x7
	nop
	setx	0x10DCB9ECD074084E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_1510:
	fbo,a	%fcc3,	loop_1511
	bgu	%xcc,	loop_1512
	sll	%i3,	%l4,	%l3
	alignaddr	%g4,	%o6,	%o7
loop_1511:
	tg	%xcc,	0x5
loop_1512:
	bne	loop_1513
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l1,	0x0C5A,	%i2
	fnor	%f20,	%f28,	%f18
loop_1513:
	fpsub32	%f26,	%f12,	%f10
	xorcc	%i7,	%i5,	%o2
	tleu	%xcc,	0x1
	smul	%o5,	%o4,	%g1
	udiv	%g2,	0x137D,	%l2
	movl	%icc,	%o0,	%g6
	edge32ln	%i0,	%o1,	%l0
	edge16ln	%g5,	%l5,	%i4
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x11,	%g2
	bge,pt	%xcc,	loop_1514
	fmovsvs	%icc,	%f28,	%f17
	xorcc	%l6,	0x178A,	%g7
	srl	%i1,	0x0D,	%i6
loop_1514:
	sdivcc	%i3,	0x0B68,	%o3
	and	%l3,	%l4,	%g4
	fmovdg	%xcc,	%f24,	%f30
	edge32ln	%o6,	%o7,	%i2
	fble	%fcc0,	loop_1515
	fabsd	%f12,	%f10
	movneg	%icc,	%i7,	%i5
	fble	%fcc1,	loop_1516
loop_1515:
	tle	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l1,	%o2,	%o5
loop_1516:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f2,	%f28
	fpsub16	%f4,	%f22,	%f26
	subccc	%o4,	%g2,	%l2
	fmovdcc	%icc,	%f19,	%f31
	fcmpeq32	%f24,	%f8,	%g1
	orncc	%o0,	%i0,	%o1
	tcs	%xcc,	0x0
	edge8n	%l0,	%g6,	%l5
	fornot2	%f24,	%f12,	%f22
	andncc	%i4,	%g3,	%g5
	movrgez	%l6,	%i1,	%g7
	srlx	%i3,	%i6,	%o3
	bleu	loop_1517
	fmovrdgez	%l3,	%f4,	%f30
	fbn,a	%fcc1,	loop_1518
	tvc	%icc,	0x3
loop_1517:
	fbuge	%fcc3,	loop_1519
	alignaddr	%l4,	%g4,	%o6
loop_1518:
	movleu	%icc,	%i2,	%i7
	fbug	%fcc3,	loop_1520
loop_1519:
	sethi	0x0CC8,	%o7
	xor	%l1,	0x0F94,	%o2
	edge16	%i5,	%o4,	%g2
loop_1520:
	fmovspos	%icc,	%f2,	%f16
	umul	%o5,	0x12C0,	%g1
	for	%f4,	%f0,	%f18
	movneg	%icc,	%o0,	%i0
	tle	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x44] %asi,	%f14
	movg	%xcc,	%o1,	%l0
	bcc	loop_1521
	sir	0x1585
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f16
loop_1521:
	fnot2s	%f6,	%f22
	andncc	%g6,	%l2,	%i4
	xor	%g3,	0x0E2E,	%g5
	array16	%l5,	%l6,	%g7
	ld	[%l7 + 0x1C],	%f29
	mulscc	%i3,	0x1B38,	%i1
	subc	%o3,	%i6,	%l3
	set	0x48, %o5
	stxa	%l4,	[%l7 + %o5] 0x80
	fandnot1s	%f16,	%f22,	%f18
	pdist	%f24,	%f4,	%f10
	st	%f2,	[%l7 + 0x38]
	tne	%xcc,	0x5
	udivcc	%o6,	0x0959,	%g4
	fbo,a	%fcc3,	loop_1522
	add	%i2,	0x16AF,	%i7
	movle	%xcc,	%o7,	%l1
	sra	%o2,	%o4,	%i5
loop_1522:
	alignaddr	%o5,	%g2,	%g1
	set	0x64, %o1
	stwa	%o0,	[%l7 + %o1] 0x2f
	membar	#Sync
	sethi	0x041A,	%i0
	fcmpeq32	%f22,	%f4,	%o1
	andn	%g6,	0x03D1,	%l0
	fmovrslz	%l2,	%f9,	%f16
	fmovdn	%xcc,	%f1,	%f14
	fmovsge	%xcc,	%f30,	%f16
	array8	%g3,	%i4,	%g5
	nop
	setx	0x9F180153629106B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2F3094FD5F193224,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f26,	%f18
	set	0x50, %l1
	lduwa	[%l7 + %l1] 0x14,	%l5
	tne	%xcc,	0x7
	fnand	%f0,	%f18,	%f28
	fands	%f16,	%f26,	%f15
	fpackfix	%f10,	%f4
	edge32ln	%g7,	%i3,	%l6
	set	0x57, %i0
	stba	%o3,	[%l7 + %i0] 0x18
	fone	%f22
	fbn,a	%fcc3,	loop_1523
	tcs	%xcc,	0x0
	movrgz	%i1,	%l3,	%i6
	fors	%f11,	%f14,	%f29
loop_1523:
	fmovdge	%xcc,	%f3,	%f25
	movvc	%icc,	%o6,	%l4
	movcc	%icc,	%g4,	%i2
	sdiv	%o7,	0x058F,	%i7
	edge16ln	%o2,	%l1,	%i5
	fabss	%f14,	%f26
	sllx	%o5,	%o4,	%g2
	tl	%xcc,	0x1
	wr	%g0,	0xe2,	%asi
	stha	%o0,	[%l7 + 0x34] %asi
	membar	#Sync
	movleu	%icc,	%i0,	%o1
	bn,a	%xcc,	loop_1524
	array32	%g1,	%l0,	%g6
	edge16ln	%g3,	%l2,	%i4
	fmovrdgz	%g5,	%f6,	%f2
loop_1524:
	fbn	%fcc0,	loop_1525
	movrlz	%l5,	0x22F,	%g7
	sub	%i3,	%l6,	%i1
	set	0x4A, %i7
	ldsha	[%l7 + %i7] 0x18,	%l3
loop_1525:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%o3,	[%l7 + 0x14] %asi
	tne	%icc,	0x2
	fcmpeq32	%f8,	%f30,	%o6
	fbue,a	%fcc2,	loop_1526
	bpos,pt	%xcc,	loop_1527
	fbo	%fcc3,	loop_1528
	fmovsge	%icc,	%f5,	%f3
loop_1526:
	brlz,a	%i6,	loop_1529
loop_1527:
	movl	%xcc,	%g4,	%i2
loop_1528:
	fbul,a	%fcc0,	loop_1530
	edge16l	%o7,	%l4,	%i7
loop_1529:
	edge16	%o2,	%i5,	%o5
	move	%icc,	%l1,	%g2
loop_1530:
	edge32	%o0,	%o4,	%i0
	sllx	%g1,	0x13,	%o1
	movpos	%xcc,	%g6,	%l0
	udiv	%l2,	0x1D78,	%i4
	orn	%g3,	0x0764,	%l5
	movrgz	%g5,	0x056,	%g7
	fmovsleu	%icc,	%f27,	%f4
	andcc	%l6,	0x02C7,	%i3
	movrlez	%i1,	%l3,	%o3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%g4
	fpmerge	%f16,	%f0,	%f0
	fmovsa	%icc,	%f7,	%f13
	nop
	setx loop_1531, %l0, %l1
	jmpl %l1, %i2
	add	%o7,	%i6,	%i7
	tsubcctv	%o2,	%l4,	%o5
	edge8	%i5,	%g2,	%l1
loop_1531:
	fmovsa	%xcc,	%f30,	%f3
	tcs	%xcc,	0x7
	srax	%o4,	0x04,	%o0
	edge8n	%g1,	%o1,	%i0
	subccc	%g6,	%l0,	%i4
	tn	%icc,	0x0
	fpadd32s	%f14,	%f18,	%f22
	umul	%l2,	0x0CD9,	%g3
	popc	0x030B,	%g5
	fbue,a	%fcc0,	loop_1532
	movrgez	%l5,	0x292,	%l6
	nop
	setx	0x3289ED4140A80ACD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2CA597979B7FC191,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f30,	%f20
	nop
	setx	0x6CBECDC574AF9D9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xAC73691BCBEDADC4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f14,	%f30
loop_1532:
	sub	%i3,	0x08A0,	%g7
	umulcc	%i1,	0x13DC,	%l3
	ldub	[%l7 + 0x2B],	%o6
	fmovdgu	%xcc,	%f24,	%f3
	tsubcctv	%o3,	%i2,	%o7
	fcmpgt16	%f20,	%f10,	%g4
	sll	%i6,	%i7,	%o2
	fmovscs	%xcc,	%f30,	%f29
	movge	%icc,	%o5,	%l4
	tge	%icc,	0x3
	tsubcc	%g2,	%l1,	%i5
	movre	%o4,	%g1,	%o0
	bcc	loop_1533
	ta	%xcc,	0x3
	fnor	%f26,	%f0,	%f10
	ta	%icc,	0x2
loop_1533:
	umul	%o1,	%g6,	%l0
	set	0x14, %g1
	lda	[%l7 + %g1] 0x19,	%f26
	ldsb	[%l7 + 0x5D],	%i0
	edge16ln	%l2,	%i4,	%g5
	movrlez	%l5,	%l6,	%i3
	movpos	%icc,	%g3,	%i1
	sll	%l3,	%g7,	%o3
	andcc	%i2,	%o7,	%g4
	set	0x74, %l4
	ldswa	[%l7 + %l4] 0x88,	%i6
	fble	%fcc1,	loop_1534
	srlx	%i7,	0x15,	%o6
	set	0x40, %i1
	stxa	%o5,	[%l7 + %i1] 0x22
	membar	#Sync
loop_1534:
	sub	%l4,	0x02D1,	%g2
	fmovsg	%icc,	%f2,	%f10
	smulcc	%l1,	0x1370,	%o2
	andncc	%i5,	%o4,	%o0
	edge8ln	%o1,	%g1,	%l0
	fnand	%f24,	%f12,	%f2
	tpos	%icc,	0x6
	fmovdne	%xcc,	%f18,	%f8
	fmovscc	%xcc,	%f31,	%f27
	movgu	%xcc,	%i0,	%l2
	tneg	%icc,	0x0
	tvs	%icc,	0x6
	set	0x28, %g5
	lduwa	[%l7 + %g5] 0x88,	%g6
	stb	%g5,	[%l7 + 0x29]
	fpadd16	%f20,	%f18,	%f20
	nop
	fitos	%f6,	%f10
	fstod	%f10,	%f18
	fmovrde	%l5,	%f14,	%f22
	fxnors	%f13,	%f0,	%f9
	tn	%xcc,	0x7
	and	%l6,	0x06A4,	%i4
	nop
	setx loop_1535, %l0, %l1
	jmpl %l1, %g3
	call	loop_1536
	edge16ln	%i1,	%i3,	%l3
	mulscc	%o3,	0x0EF7,	%g7
loop_1535:
	tl	%icc,	0x3
loop_1536:
	fblg,a	%fcc3,	loop_1537
	tvs	%xcc,	0x7
	taddcctv	%i2,	0x0254,	%o7
	or	%i6,	%i7,	%o6
loop_1537:
	movcc	%xcc,	%o5,	%l4
	fbo,a	%fcc1,	loop_1538
	movneg	%icc,	%g4,	%l1
	fmovdgu	%icc,	%f30,	%f19
	andncc	%g2,	%o2,	%i5
loop_1538:
	mulx	%o0,	0x060D,	%o4
	tsubcctv	%g1,	0x17A4,	%o1
	nop
	setx	loop_1539,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%l0,	%i0,	%l2
	bpos,pn	%icc,	loop_1540
	addccc	%g5,	%g6,	%l6
loop_1539:
	smul	%i4,	0x13CC,	%l5
	umulcc	%g3,	%i3,	%i1
loop_1540:
	alignaddrl	%l3,	%g7,	%o3
	xnor	%i2,	0x1729,	%i6
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f28
	sll	%i7,	0x18,	%o6
	fexpand	%f4,	%f14
	bl,a	%xcc,	loop_1541
	bge,a	loop_1542
	movcs	%xcc,	%o7,	%o5
	mova	%xcc,	%l4,	%g4
loop_1541:
	sra	%l1,	%g2,	%i5
loop_1542:
	brlez	%o0,	loop_1543
	tge	%icc,	0x0
	array16	%o2,	%o4,	%g1
	sdivx	%l0,	0x129B,	%o1
loop_1543:
	subccc	%i0,	%l2,	%g6
	bn,a,pt	%xcc,	loop_1544
	movcc	%xcc,	%l6,	%i4
	mova	%xcc,	%l5,	%g3
	set	0x50, %i5
	ldsha	[%l7 + %i5] 0x11,	%i3
loop_1544:
	bcs	%icc,	loop_1545
	sllx	%i1,	0x0F,	%l3
	lduh	[%l7 + 0x7E],	%g7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%g5
loop_1545:
	bne,pt	%icc,	loop_1546
	fble,a	%fcc3,	loop_1547
	mulx	%i2,	%i7,	%o6
	fcmpne32	%f8,	%f20,	%i6
loop_1546:
	bleu,pn	%icc,	loop_1548
loop_1547:
	move	%icc,	%o7,	%o5
	fsrc1s	%f18,	%f12
	array16	%g4,	%l1,	%l4
loop_1548:
	tneg	%xcc,	0x2
	movrne	%i5,	%g2,	%o0
	set	0x0A, %o7
	lduba	[%l7 + %o7] 0x10,	%o4
	smul	%o2,	0x166E,	%g1
	brgz,a	%l0,	loop_1549
	and	%i0,	%l2,	%o1
	orcc	%l6,	%i4,	%g6
	fbg,a	%fcc2,	loop_1550
loop_1549:
	movvs	%icc,	%l5,	%i3
	edge16l	%g3,	%l3,	%i1
	fbug,a	%fcc2,	loop_1551
loop_1550:
	fblg	%fcc0,	loop_1552
	tl	%xcc,	0x0
	nop
	setx	loop_1553,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1551:
	edge8l	%g7,	%o3,	%i2
loop_1552:
	edge32n	%i7,	%o6,	%g5
	te	%icc,	0x7
loop_1553:
	tge	%icc,	0x1
	subcc	%o7,	%o5,	%g4
	movge	%xcc,	%i6,	%l4
	bleu	loop_1554
	array32	%l1,	%g2,	%o0
	fmovrslz	%i5,	%f25,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o4
loop_1554:
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f28
	or	%l0,	%g1,	%l2
	fbule	%fcc3,	loop_1555
	fmovdn	%xcc,	%f7,	%f17
	tvc	%icc,	0x6
	fbule	%fcc0,	loop_1556
loop_1555:
	sethi	0x0610,	%o1
	tcs	%icc,	0x2
	fbl	%fcc3,	loop_1557
loop_1556:
	udiv	%i0,	0x0F72,	%l6
	xor	%i4,	%l5,	%i3
	movn	%icc,	%g3,	%l3
loop_1557:
	subccc	%g6,	%g7,	%o3
	udivx	%i2,	0x0FB4,	%i1
	fmovdcc	%xcc,	%f5,	%f18
	fnor	%f6,	%f10,	%f18
	fzeros	%f5
	subcc	%o6,	%g5,	%i7
	or	%o5,	0x18BD,	%g4
	bne,a,pn	%icc,	loop_1558
	move	%xcc,	%i6,	%o7
	ba,a	%icc,	loop_1559
	sra	%l4,	%g2,	%l1
loop_1558:
	nop
	setx loop_1560, %l0, %l1
	jmpl %l1, %i5
	movcc	%icc,	%o0,	%o2
loop_1559:
	popc	%l0,	%o4
	nop
	setx	0x6058D225,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_1560:
	ba	loop_1561
	xorcc	%l2,	%o1,	%g1
	sdivx	%i0,	0x0E82,	%l6
	fbul,a	%fcc3,	loop_1562
loop_1561:
	sir	0x1CD8
	xnor	%i4,	0x080E,	%i3
	array32	%l5,	%g3,	%l3
loop_1562:
	xor	%g6,	0x0F15,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f20,	%f6
	sdivcc	%g7,	0x06C2,	%i1
	smul	%i2,	%o6,	%g5
	fnot2	%f28,	%f2
	smulcc	%o5,	0x199D,	%i7
	fsrc1s	%f4,	%f7
	sir	0x055E
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a,pt	%xcc,	loop_1563
	sir	0x135A
	brlez,a	%g4,	loop_1564
	fmul8ulx16	%f8,	%f30,	%f0
loop_1563:
	std	%f28,	[%l7 + 0x78]
	movpos	%xcc,	%o7,	%i6
loop_1564:
	nop
	set	0x47, %o6
	stba	%l4,	[%l7 + %o6] 0x2f
	membar	#Sync
	edge8n	%g2,	%i5,	%o0
	fbule	%fcc3,	loop_1565
	fandnot1	%f26,	%f18,	%f28
	bpos	%icc,	loop_1566
	fmovda	%xcc,	%f6,	%f19
loop_1565:
	fxor	%f30,	%f14,	%f24
	movrgz	%o2,	%l0,	%l1
loop_1566:
	tpos	%xcc,	0x5
	tvc	%xcc,	0x7
	nop
	fitod	%f4,	%f8
	movcs	%xcc,	%l2,	%o4
	fbug,a	%fcc1,	loop_1567
	tn	%xcc,	0x2
	mulx	%g1,	%o1,	%i0
	movrlz	%l6,	%i4,	%i3
loop_1567:
	movrne	%l5,	0x0F7,	%l3
	edge16	%g6,	%o3,	%g7
	fabss	%f13,	%f14
	move	%icc,	%g3,	%i2
	addccc	%o6,	0x00E3,	%g5
	and	%o5,	0x0CED,	%i1
	xorcc	%g4,	0x0EBA,	%i7
	fandnot2	%f14,	%f26,	%f12
	alignaddr	%l4,	%i6,	%i5
	fpackfix	%f16,	%f1
	ble,a	%icc,	loop_1568
	sdivcc	%g2,	0x0555,	%o2
	movl	%xcc,	%l0,	%l1
	fbne	%fcc0,	loop_1569
loop_1568:
	smul	%o0,	%l2,	%o4
	fnot1	%f16,	%f22
	movle	%icc,	%o1,	%g1
loop_1569:
	alignaddr	%l6,	%i4,	%i3
	set	0x39, %g7
	ldsba	[%l7 + %g7] 0x14,	%l5
	fmovdcs	%xcc,	%f13,	%f19
	sll	%l3,	0x07,	%i0
	fmovrde	%g6,	%f30,	%f2
	fcmple32	%f22,	%f8,	%o3
	udivx	%g7,	0x0B69,	%g3
	orn	%i2,	0x0473,	%g5
	addc	%o6,	%i1,	%g4
	fmovsvs	%icc,	%f12,	%f28
	add	%i7,	%o5,	%o7
	sethi	0x0BA9,	%i6
	array8	%l4,	%i5,	%g2
	subccc	%l0,	0x0C8F,	%o2
	subccc	%o0,	%l1,	%l2
	sllx	%o4,	0x0E,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g1,	%l6
	sra	%i4,	0x0E,	%i3
	set	0x44, %l0
	lduwa	[%l7 + %l0] 0x81,	%l3
	movrgz	%i0,	%l5,	%g6
	fmovsl	%icc,	%f10,	%f0
	fmovde	%xcc,	%f3,	%f9
	sdiv	%o3,	0x0F71,	%g3
	movvc	%icc,	%g7,	%i2
	movn	%xcc,	%o6,	%g5
	movpos	%xcc,	%i1,	%i7
	fmovdle	%icc,	%f19,	%f0
	fpsub32s	%f23,	%f18,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o5,	0x0E46,	%g4
	ldsb	[%l7 + 0x3F],	%i6
	movg	%icc,	%l4,	%o7
	edge32n	%i5,	%g2,	%o2
	movpos	%icc,	%o0,	%l0
	fpackfix	%f12,	%f15
	tcc	%xcc,	0x6
	orncc	%l1,	0x0E7C,	%l2
	std	%f22,	[%l7 + 0x70]
	tneg	%icc,	0x7
	orcc	%o1,	%g1,	%o4
	fxors	%f1,	%f8,	%f8
	fmovdl	%icc,	%f0,	%f7
	sra	%i4,	%i3,	%l3
	movg	%icc,	%l6,	%l5
	movle	%icc,	%g6,	%o3
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x58] %asi,	%g3
	xor	%g7,	0x13A6,	%i0
	mova	%icc,	%i2,	%g5
	orn	%i1,	0x1BE0,	%o6
	tgu	%xcc,	0x1
	fsrc2	%f14,	%f8
	udivcc	%o5,	0x18E7,	%g4
	tvc	%icc,	0x3
	fbl	%fcc0,	loop_1570
	fnands	%f29,	%f13,	%f20
	sra	%i7,	%i6,	%l4
	bne	loop_1571
loop_1570:
	addcc	%i5,	%g2,	%o7
	fandnot2	%f6,	%f2,	%f18
	srax	%o2,	0x1A,	%l0
loop_1571:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o0,	%l1,	%o1
	tvs	%xcc,	0x7
	tg	%icc,	0x2
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2
	fpmerge	%f13,	%f22,	%f2
	movge	%icc,	%g1,	%o4
	fpsub32	%f10,	%f6,	%f4
	fbl	%fcc1,	loop_1572
	tgu	%icc,	0x0
	andncc	%i3,	%l3,	%l6
	alignaddrl	%i4,	%g6,	%o3
loop_1572:
	nop
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x81,	 0x0
	fornot2s	%f13,	%f23,	%f9
	edge32ln	%g7,	%l5,	%i0
	nop
	fitos	%f3,	%f3
	fstoi	%f3,	%f20
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%g5
	fmovsne	%icc,	%f4,	%f10
	nop
	fitos	%f20,	%f25
	movneg	%icc,	%o6,	%o5
	set	0x54, %o3
	sta	%f19,	[%l7 + %o3] 0x10
	sdiv	%g4,	0x1305,	%i7
	swap	[%l7 + 0x34],	%i1
	bne,a	%xcc,	loop_1573
	alignaddrl	%i6,	%l4,	%g2
	fnegd	%f20,	%f22
	fmovdg	%icc,	%f27,	%f31
loop_1573:
	brz	%o7,	loop_1574
	fbul,a	%fcc1,	loop_1575
	ldstub	[%l7 + 0x1B],	%i5
	edge8l	%o2,	%l0,	%o0
loop_1574:
	fbul	%fcc0,	loop_1576
loop_1575:
	movrlez	%l1,	0x055,	%o1
	movleu	%icc,	%g1,	%o4
	fbule,a	%fcc3,	loop_1577
loop_1576:
	fmovsvc	%icc,	%f6,	%f31
	movle	%icc,	%i3,	%l2
	or	%l3,	%l6,	%g6
loop_1577:
	srl	%o3,	%g3,	%i4
	bneg,a	loop_1578
	fnot2	%f0,	%f28
	bneg,a,pn	%icc,	loop_1579
	movrlz	%g7,	%i0,	%i2
loop_1578:
	movvs	%icc,	%g5,	%l5
	popc	%o6,	%g4
loop_1579:
	edge32l	%o5,	%i1,	%i6
	fmuld8sux16	%f27,	%f2,	%f2
	fnot2s	%f2,	%f31
	tle	%xcc,	0x1
	ba,a,pn	%xcc,	loop_1580
	fmovdneg	%icc,	%f4,	%f27
	fmovdg	%icc,	%f13,	%f21
	xor	%i7,	0x1AF1,	%g2
loop_1580:
	nop
	setx	0x0048DA40,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	set	0x30, %g6
	swapa	[%l7 + %g6] 0x81,	%o7
	fmovrsgez	%l4,	%f20,	%f11
	movcs	%icc,	%o2,	%l0
	andcc	%o0,	%l1,	%i5
	fcmpeq16	%f26,	%f14,	%o1
	edge8	%g1,	%i3,	%o4
	fnegd	%f4,	%f12
	nop
	setx	0x17F5C8BD9076FD7F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fbn	%fcc2,	loop_1581
	bcc	loop_1582
	brgez,a	%l2,	loop_1583
	movn	%xcc,	%l6,	%g6
loop_1581:
	fmovdl	%icc,	%f11,	%f14
loop_1582:
	movl	%icc,	%o3,	%l3
loop_1583:
	nop
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x04,	 0x3
	sdivcc	%g7,	0x07D5,	%i0
	edge32n	%i4,	%i2,	%l5
	edge16l	%o6,	%g5,	%g4
	movge	%xcc,	%i1,	%o5
	bpos,a,pn	%xcc,	loop_1584
	fsrc2s	%f20,	%f29
	fpadd32s	%f7,	%f17,	%f29
	tleu	%icc,	0x1
loop_1584:
	tneg	%icc,	0x5
	te	%icc,	0x7
	andncc	%i7,	%g2,	%i6
	srax	%l4,	%o7,	%o2
	edge32	%l0,	%o0,	%l1
	smulcc	%i5,	0x1D4B,	%g1
	udivx	%i3,	0x199C,	%o1
	for	%f4,	%f20,	%f18
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%o4
	fxor	%f10,	%f4,	%f18
	fexpand	%f2,	%f10
	add	%l2,	%l6,	%o3
	set	0x74, %i6
	lduwa	[%l7 + %i6] 0x89,	%g6
	udivx	%g3,	0x0393,	%g7
	edge8ln	%l3,	%i4,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x18],	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f26,	%f9
	ble,a,pt	%xcc,	loop_1585
	sll	%l5,	%i2,	%o6
	alignaddrl	%g4,	%i1,	%g5
	movrgez	%i7,	%o5,	%i6
loop_1585:
	sub	%l4,	0x1485,	%o7
	fmovrdlz	%o2,	%f12,	%f30
	edge8l	%l0,	%o0,	%l1
	fmovrdgz	%g2,	%f14,	%f12
	std	%f14,	[%l7 + 0x70]
	fmovdvs	%xcc,	%f27,	%f27
	orcc	%g1,	0x0DBA,	%i5
	movne	%xcc,	%i3,	%o1
	fmovsleu	%xcc,	%f9,	%f15
	fmovdpos	%xcc,	%f13,	%f17
	swap	[%l7 + 0x1C],	%o4
	array8	%l2,	%l6,	%g6
	mulx	%g3,	0x0E07,	%g7
	edge8	%l3,	%o3,	%i0
	array8	%i4,	%i2,	%o6
	nop
	fitos	%f8,	%f2
	fstod	%f2,	%f20
	tg	%icc,	0x6
	fblg	%fcc1,	loop_1586
	array32	%l5,	%i1,	%g5
	movrlz	%g4,	0x220,	%i7
	flush	%l7 + 0x44
loop_1586:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i6,	%l4
	movrlz	%o5,	0x0E0,	%o2
	fpack16	%f6,	%f7
	tpos	%xcc,	0x2
	or	%o7,	%o0,	%l0
	ble,a,pt	%icc,	loop_1587
	array32	%l1,	%g1,	%i5
	fmul8ulx16	%f6,	%f18,	%f8
	array8	%g2,	%o1,	%o4
loop_1587:
	te	%icc,	0x4
	set	0x0A, %l3
	ldsha	[%l7 + %l3] 0x80,	%l2
	sllx	%i3,	0x19,	%g6
	tne	%icc,	0x5
	movpos	%icc,	%g3,	%l6
	ta	%icc,	0x3
	orncc	%l3,	%o3,	%i0
	tcc	%icc,	0x7
	brz	%i4,	loop_1588
	fmuld8sux16	%f17,	%f17,	%f4
	mova	%icc,	%i2,	%o6
	movrne	%g7,	0x289,	%i1
loop_1588:
	fmul8x16au	%f9,	%f26,	%f22
	prefetch	[%l7 + 0x48],	 0x3
	fbg	%fcc0,	loop_1589
	fmovrdgez	%g5,	%f28,	%f28
	lduw	[%l7 + 0x28],	%g4
	addccc	%i7,	%i6,	%l5
loop_1589:
	movrgz	%o5,	0x0AB,	%o2
	mova	%icc,	%o7,	%l4
	ldsb	[%l7 + 0x0F],	%o0
	bne,a,pt	%xcc,	loop_1590
	tne	%icc,	0x6
	tge	%xcc,	0x0
	nop
	setx	loop_1591,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1590:
	bg	loop_1592
	fcmpgt16	%f12,	%f20,	%l0
	tle	%icc,	0x3
loop_1591:
	addcc	%l1,	%i5,	%g2
loop_1592:
	addc	%o1,	%g1,	%l2
	edge8l	%o4,	%i3,	%g6
	edge16ln	%l6,	%l3,	%g3
	fmovsne	%icc,	%f22,	%f11
	movrgez	%i0,	%i4,	%i2
	mulscc	%o3,	0x1B61,	%o6
	movle	%icc,	%i1,	%g5
	move	%icc,	%g4,	%i7
	udivx	%g7,	0x16BD,	%i6
	tl	%xcc,	0x0
	tvc	%icc,	0x4
	brlez,a	%l5,	loop_1593
	bgu,pn	%icc,	loop_1594
	fbe	%fcc0,	loop_1595
	srl	%o5,	0x06,	%o2
loop_1593:
	addccc	%l4,	%o0,	%l0
loop_1594:
	alignaddrl	%l1,	%o7,	%i5
loop_1595:
	xorcc	%g2,	0x1E8B,	%g1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movcc	%icc,	%l2,	%o4
	brnz,a	%i3,	loop_1596
	edge32n	%o1,	%l6,	%g6
	movcc	%icc,	%l3,	%g3
	subc	%i4,	0x1496,	%i0
loop_1596:
	brgz,a	%o3,	loop_1597
	stb	%i2,	[%l7 + 0x44]
	tgu	%xcc,	0x6
	edge16ln	%i1,	%g5,	%g4
loop_1597:
	udivx	%o6,	0x06E1,	%i7
	membar	0x5B
	array16	%i6,	%l5,	%o5
	udivcc	%g7,	0x1962,	%o2
	nop
	setx	0x2443DA9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xF436E33E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f8,	%f30
	te	%icc,	0x0
	tne	%xcc,	0x6
	andncc	%o0,	%l0,	%l1
	fmovsn	%icc,	%f16,	%f1
	tneg	%icc,	0x1
	array8	%l4,	%o7,	%i5
	umul	%g2,	0x1C5C,	%g1
	taddcc	%l2,	0x170F,	%i3
	fmul8x16al	%f24,	%f0,	%f26
	fnegd	%f12,	%f12
	xorcc	%o4,	0x13EA,	%l6
	nop
	setx	0xD4C0833C3518BC2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1DC2F18A121197AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f10,	%f18
	umul	%o1,	0x0FAB,	%g6
	fnors	%f20,	%f19,	%f15
	lduw	[%l7 + 0x14],	%g3
	sdiv	%l3,	0x0853,	%i4
	wr	%g0,	0xeb,	%asi
	stba	%i0,	[%l7 + 0x5D] %asi
	membar	#Sync
	addcc	%o3,	0x17D3,	%i2
	tle	%xcc,	0x6
	array8	%i1,	%g5,	%g4
	array16	%i7,	%o6,	%l5
	tvs	%icc,	0x7
	fmovdcc	%xcc,	%f4,	%f26
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f1
	edge8n	%o5,	%g7,	%i6
	membar	0x14
	tne	%icc,	0x4
	bneg,a	%icc,	loop_1598
	umulcc	%o0,	0x1985,	%l0
	umul	%l1,	0x156F,	%l4
	fand	%f16,	%f26,	%f26
loop_1598:
	edge16	%o7,	%o2,	%i5
	movneg	%icc,	%g2,	%g1
	array16	%l2,	%i3,	%l6
	tn	%icc,	0x7
	fmovd	%f16,	%f30
	stw	%o1,	[%l7 + 0x78]
	sethi	0x0201,	%o4
	nop
	set	0x50, %g3
	stb	%g3,	[%l7 + %g3]
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%l3
	andcc	%i4,	%i0,	%g6
	bge,pt	%xcc,	loop_1599
	xnorcc	%i2,	%i1,	%o3
	movg	%icc,	%g4,	%i7
	sra	%g5,	0x14,	%o6
loop_1599:
	fpsub16	%f26,	%f20,	%f0
	fmovdvc	%xcc,	%f5,	%f1
	tcc	%xcc,	0x3
	nop
	setx	0xA07ECE3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x68] %asi,	%l5
	xnorcc	%o5,	%i6,	%o0
	fbu	%fcc0,	loop_1600
	membar	0x48
	smulcc	%l0,	0x101D,	%g7
	fmovdgu	%xcc,	%f0,	%f26
loop_1600:
	ta	%xcc,	0x2
	xnor	%l4,	0x0D73,	%l1
	fmovsle	%xcc,	%f29,	%f15
	tvc	%icc,	0x2
	udivcc	%o7,	0x188D,	%i5
	array16	%g2,	%g1,	%l2
	fmovdne	%icc,	%f12,	%f15
	fnand	%f26,	%f24,	%f24
	brgez	%o2,	loop_1601
	fpadd32	%f8,	%f12,	%f20
	xor	%i3,	0x1673,	%o1
	fbue	%fcc3,	loop_1602
loop_1601:
	sra	%o4,	0x11,	%g3
	tsubcctv	%l6,	0x1795,	%i4
	mulscc	%i0,	0x1C6A,	%g6
loop_1602:
	addc	%i2,	%l3,	%i1
	movn	%icc,	%o3,	%g4
	xnorcc	%i7,	%g5,	%l5
	fmovsvc	%xcc,	%f29,	%f21
	fmovdl	%xcc,	%f10,	%f12
	movrlez	%o5,	0x239,	%o6
	fcmpgt16	%f16,	%f14,	%o0
	srl	%i6,	0x03,	%l0
	tvc	%xcc,	0x3
	movne	%icc,	%l4,	%g7
	nop
	set	0x50, %g2
	std	%f0,	[%l7 + %g2]
	brlez,a	%o7,	loop_1603
	smulcc	%l1,	0x1FBB,	%g2
	tsubcctv	%g1,	0x1F8A,	%i5
	and	%o2,	%l2,	%o1
loop_1603:
	sllx	%o4,	%i3,	%g3
	brnz	%i4,	loop_1604
	smul	%l6,	%i0,	%g6
	faligndata	%f16,	%f30,	%f16
	tvs	%icc,	0x4
loop_1604:
	movcc	%xcc,	%l3,	%i2
	fmovsl	%icc,	%f9,	%f13
	tvs	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i1,	%g4,	%o3
	sdivcc	%i7,	0x06B2,	%g5
	andncc	%l5,	%o5,	%o6
	fbue,a	%fcc0,	loop_1605
	movrne	%o0,	0x017,	%l0
	fmovdle	%xcc,	%f14,	%f3
	orn	%l4,	0x1836,	%g7
loop_1605:
	srl	%o7,	%l1,	%i6
	sll	%g2,	%i5,	%o2
	movre	%l2,	%g1,	%o1
	addc	%i3,	0x1C21,	%g3
	movcs	%xcc,	%i4,	%o4
	ta	%xcc,	0x1
	movrlz	%l6,	%g6,	%l3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4A] %asi,	%i2
	srl	%i1,	%g4,	%i0
	fsrc2s	%f18,	%f20
	movg	%icc,	%o3,	%g5
	subcc	%l5,	0x12B2,	%i7
	edge16l	%o6,	%o5,	%o0
	te	%xcc,	0x5
	nop
	set	0x20, %o4
	ldub	[%l7 + %o4],	%l0
	brnz	%g7,	loop_1606
	bvc	loop_1607
	std	%f2,	[%l7 + 0x50]
	edge16l	%l4,	%o7,	%i6
loop_1606:
	te	%icc,	0x3
loop_1607:
	sdiv	%g2,	0x0B9F,	%i5
	fnegs	%f5,	%f11
	fornot1	%f14,	%f4,	%f6
	tne	%xcc,	0x1
	tsubcc	%l1,	%o2,	%g1
	fnot1	%f30,	%f6
	umulcc	%o1,	0x04FB,	%i3
	sll	%g3,	0x16,	%l2
	srl	%o4,	%l6,	%g6
	ldub	[%l7 + 0x4D],	%i4
	tle	%icc,	0x6
	fmovdpos	%icc,	%f17,	%f1
	fandnot1s	%f29,	%f0,	%f12
	edge32l	%i2,	%l3,	%i1
	taddcctv	%g4,	0x15D9,	%o3
	movle	%icc,	%g5,	%i0
	fmovspos	%icc,	%f22,	%f0
	fbo,a	%fcc0,	loop_1608
	edge16l	%i7,	%l5,	%o5
	fcmpeq32	%f14,	%f10,	%o6
	xorcc	%l0,	%g7,	%l4
loop_1608:
	fmovscc	%xcc,	%f12,	%f27
	te	%xcc,	0x5
	bcc,pn	%xcc,	loop_1609
	sll	%o0,	%i6,	%g2
	add	%i5,	0x1AD5,	%o7
	bne,a,pn	%xcc,	loop_1610
loop_1609:
	tcc	%icc,	0x1
	movl	%icc,	%l1,	%o2
	movle	%icc,	%o1,	%i3
loop_1610:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%g3
	movne	%xcc,	%l2,	%g1
	movleu	%xcc,	%l6,	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i4,	%i2
	sir	0x051D
	mulx	%g6,	0x017A,	%i1
	tneg	%xcc,	0x1
	fmovrdlez	%g4,	%f26,	%f28
	popc	%l3,	%g5
	sdivx	%i0,	0x1DB4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	fmovdl	%icc,	%f1,	%f30
	fsrc2	%f16,	%f30
	popc	%i7,	%l5
	sub	%o5,	0x1F1D,	%o6
	movcs	%icc,	%l0,	%g7
	tleu	%xcc,	0x6
	fnegd	%f4,	%f8
	tleu	%xcc,	0x1
	or	%l4,	%o0,	%i6
	array32	%g2,	%i5,	%l1
	andncc	%o2,	%o1,	%o7
	subccc	%g3,	%i3,	%l2
	movrlez	%l6,	%g1,	%o4
	tleu	%xcc,	0x4
	bneg	%icc,	loop_1611
	ta	%icc,	0x2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i2,	%i4
loop_1611:
	sllx	%i1,	%g6,	%g4
	edge32l	%g5,	%l3,	%i0
	xorcc	%o3,	0x05CA,	%i7
	te	%xcc,	0x7
	movle	%icc,	%l5,	%o5
	tgu	%xcc,	0x6
	xorcc	%o6,	%g7,	%l4
	edge32	%o0,	%i6,	%g2
	taddcctv	%l0,	0x0585,	%l1
	taddcctv	%i5,	0x01A3,	%o2
	movrgz	%o7,	0x01E,	%o1
	sdiv	%i3,	0x1A79,	%g3
	fpsub16s	%f10,	%f2,	%f24
	bleu,a	loop_1612
	stbar
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l6,	%l2
loop_1612:
	movpos	%icc,	%g1,	%o4
	fmovrdlez	%i2,	%f26,	%f4
	set	0x54, %o2
	stha	%i4,	[%l7 + %o2] 0x27
	membar	#Sync
	mulscc	%i1,	%g6,	%g5
	flush	%l7 + 0x44
	fmovdpos	%xcc,	%f18,	%f10
	andn	%l3,	0x1911,	%g4
	fnot1	%f0,	%f0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%o3
	movgu	%icc,	%i7,	%l5
	tsubcc	%i0,	0x0D74,	%o5
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o6
	sdivx	%g7,	0x1013,	%l4
	ble,a	%icc,	loop_1613
	tgu	%icc,	0x3
	movrgz	%o0,	0x33D,	%g2
	fmovsl	%xcc,	%f10,	%f13
loop_1613:
	move	%xcc,	%i6,	%l0
	udivx	%l1,	0x179B,	%o2
	lduw	[%l7 + 0x18],	%i5
	tl	%xcc,	0x6
	edge8n	%o1,	%i3,	%o7
	nop
	fitos	%f9,	%f15
	fstod	%f15,	%f16
	subccc	%l6,	0x1A8C,	%l2
	nop
	setx	0x14025C6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x73E396BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f3,	%f16
	ta	%xcc,	0x7
	nop
	setx	loop_1614,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%icc,	%g1,	%g3
	set	0x1C, %l6
	stba	%o4,	[%l7 + %l6] 0x89
loop_1614:
	srax	%i4,	%i2,	%i1
	subcc	%g6,	%l3,	%g5
	nop
	fitos	%f2,	%f30
	fstox	%f30,	%f22
	addcc	%o3,	%g4,	%i7
	fmovrdne	%i0,	%f10,	%f18
	add	%o5,	0x073D,	%o6
	be	loop_1615
	tsubcctv	%g7,	%l5,	%l4
	fmovsl	%icc,	%f29,	%f30
	fexpand	%f12,	%f26
loop_1615:
	tne	%xcc,	0x0
	fsrc2	%f26,	%f18
	fmovrslz	%o0,	%f0,	%f31
	tvs	%xcc,	0x7
	umulcc	%g2,	0x0056,	%l0
	nop
	setx	0x5F321B2F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xBE578A25,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f7,	%f13
	fblg,a	%fcc0,	loop_1616
	fmovrsgz	%i6,	%f26,	%f22
	sll	%o2,	%i5,	%o1
	stbar
loop_1616:
	move	%icc,	%i3,	%o7
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x19,	%l6
	smulcc	%l1,	%g1,	%l2
	tl	%xcc,	0x5
	movle	%xcc,	%o4,	%g3
	edge8ln	%i2,	%i4,	%i1
	tcs	%icc,	0x3
	smul	%g6,	0x057A,	%l3
	set	0x24, %i3
	sta	%f28,	[%l7 + %i3] 0x18
	xor	%g5,	0x1249,	%o3
	bne,a	loop_1617
	movgu	%xcc,	%i7,	%g4
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x17,	%f0
loop_1617:
	sethi	0x1046,	%o5
	lduw	[%l7 + 0x18],	%i0
	movrlez	%g7,	0x0E8,	%l5
	bvc,pn	%icc,	loop_1618
	fcmpgt16	%f12,	%f8,	%o6
	movrgz	%o0,	%l4,	%g2
	tsubcctv	%i6,	0x0A0B,	%l0
loop_1618:
	nop
	set	0x58, %g4
	ldx	[%l7 + %g4],	%o2
	stbar
	movre	%o1,	%i3,	%o7
	subccc	%i5,	0x161B,	%l1
	xnorcc	%g1,	%l6,	%l2
	sdiv	%o4,	0x1925,	%g3
	fornot2	%f16,	%f22,	%f18
	movrgez	%i2,	0x0A5,	%i1
	sth	%g6,	[%l7 + 0x7C]
	andncc	%i4,	%l3,	%g5
	tpos	%xcc,	0x0
	fcmpeq32	%f2,	%f14,	%i7
	fbug	%fcc1,	loop_1619
	movgu	%icc,	%g4,	%o5
	bne	%xcc,	loop_1620
	tgu	%icc,	0x3
loop_1619:
	mova	%icc,	%i0,	%o3
	swap	[%l7 + 0x48],	%l5
loop_1620:
	fbue,a	%fcc2,	loop_1621
	stbar
	nop
	setx	0xB5C2C1CBF1E9312B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f0
	xnorcc	%g7,	0x03CD,	%o0
loop_1621:
	sdivx	%l4,	0x148F,	%g2
	udivx	%i6,	0x19C6,	%l0
	fpack16	%f26,	%f26
	fbge	%fcc2,	loop_1622
	umulcc	%o2,	%o6,	%o1
	fzero	%f0
	sth	%o7,	[%l7 + 0x28]
loop_1622:
	fnot1s	%f1,	%f25
	fmovspos	%icc,	%f28,	%f23
	umul	%i3,	%i5,	%l1
	smul	%g1,	0x064D,	%l6
	tge	%xcc,	0x4
	sll	%l2,	%o4,	%i2
	sub	%g3,	%g6,	%i1
	fbne	%fcc1,	loop_1623
	movn	%xcc,	%l3,	%i4
	sllx	%i7,	%g5,	%g4
	orn	%i0,	%o5,	%o3
loop_1623:
	array32	%g7,	%l5,	%l4
	movn	%icc,	%g2,	%o0
	nop
	setx	0xBB55CE16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x810EA7F5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f5,	%f12
	tge	%xcc,	0x0
	nop
	setx	0xD23D9483D0D9F47F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x30683752019944A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f14,	%f28
	tvs	%xcc,	0x1
	fmovsvs	%icc,	%f17,	%f18
	tl	%xcc,	0x6
	udivcc	%l0,	0x0645,	%o2
	move	%xcc,	%i6,	%o1
	fmovsleu	%icc,	%f16,	%f9
	fone	%f2
	nop
	fitod	%f6,	%f30
	fdtoi	%f30,	%f7
	fmovsleu	%icc,	%f25,	%f4
	sdivx	%o6,	0x0EB0,	%i3
	fbue,a	%fcc1,	loop_1624
	brnz	%o7,	loop_1625
	addcc	%l1,	%g1,	%l6
	edge8ln	%i5,	%l2,	%o4
loop_1624:
	nop
	setx loop_1626, %l0, %l1
	jmpl %l1, %i2
loop_1625:
	subc	%g6,	0x1F95,	%g3
	movre	%i1,	%l3,	%i4
	xnorcc	%g5,	%g4,	%i7
loop_1626:
	edge32ln	%i0,	%o3,	%o5
	edge32n	%g7,	%l5,	%l4
	movrlez	%g2,	%l0,	%o0
	fmovdgu	%icc,	%f16,	%f20
	fmovdleu	%icc,	%f1,	%f2
	array32	%i6,	%o2,	%o1
	fmovsleu	%xcc,	%f24,	%f13
	movrgz	%i3,	0x2A7,	%o7
	udivx	%o6,	0x1BAF,	%g1
	ldx	[%l7 + 0x40],	%l1
	movvs	%icc,	%i5,	%l2
	popc	0x1F21,	%o4
	ldd	[%l7 + 0x20],	%f12
	edge16l	%i2,	%g6,	%l6
	movge	%icc,	%g3,	%l3
	fmul8ulx16	%f24,	%f24,	%f26
	sllx	%i4,	%i1,	%g4
	fmovrdlez	%g5,	%f0,	%f18
	or	%i7,	0x00A6,	%i0
	fmovdcc	%icc,	%f2,	%f20
	ba	%xcc,	loop_1627
	tle	%xcc,	0x3
	umulcc	%o5,	%g7,	%o3
	srlx	%l5,	%g2,	%l0
loop_1627:
	edge32ln	%l4,	%o0,	%i6
	sllx	%o2,	%o1,	%i3
	movne	%icc,	%o7,	%g1
	fmovsa	%xcc,	%f7,	%f3
	sdivx	%l1,	0x0622,	%i5
	nop
	fitos	%f3,	%f25
	fstox	%f25,	%f30
	fxtos	%f30,	%f20
	edge8n	%o6,	%o4,	%l2
	subccc	%i2,	%g6,	%g3
	movpos	%icc,	%l6,	%i4
	nop
	setx	0x56FC63EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x2E504433,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f28,	%f10
	flush	%l7 + 0x18
	stbar
	edge8	%l3,	%i1,	%g5
	te	%icc,	0x4
	mulx	%i7,	%i0,	%o5
	movgu	%xcc,	%g7,	%g4
	add	%o3,	%l5,	%l0
	bcc,a,pn	%xcc,	loop_1628
	udivx	%l4,	0x1542,	%o0
	call	loop_1629
	fmovrsne	%g2,	%f14,	%f7
loop_1628:
	swap	[%l7 + 0x20],	%i6
	ldx	[%l7 + 0x60],	%o2
loop_1629:
	bl	loop_1630
	fbg	%fcc3,	loop_1631
	smulcc	%o1,	%i3,	%g1
	fmovrdlez	%o7,	%f10,	%f14
loop_1630:
	movg	%icc,	%i5,	%o6
loop_1631:
	sllx	%o4,	0x1E,	%l1
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l2
	addcc	%g6,	0x1B29,	%i2
	ldsh	[%l7 + 0x66],	%g3
	nop
	fitos	%f13,	%f19
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i4
	tle	%xcc,	0x6
	fandnot2	%f6,	%f6,	%f10
	set	0x4D, %o5
	stba	%l3,	[%l7 + %o5] 0x04
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%i6
	fcmpgt32	%f2,	%f24,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g5,	%i0,	%o5
	sll	%g7,	0x0A,	%i7
	fbne,a	%fcc1,	loop_1632
	sth	%g4,	[%l7 + 0x60]
	tcc	%icc,	0x6
	tg	%icc,	0x5
loop_1632:
	move	%xcc,	%l5,	%l0
	tcs	%xcc,	0x1
	swap	[%l7 + 0x6C],	%l4
	tl	%xcc,	0x5
	edge16n	%o0,	%o3,	%i6
	be,pn	%xcc,	loop_1633
	edge32	%g2,	%o1,	%i3
	taddcctv	%g1,	0x05C8,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1633:
	ldub	[%l7 + 0x1C],	%i5
	fpadd32	%f24,	%f18,	%f30
	tleu	%icc,	0x2
	andn	%o7,	0x14C5,	%o4
	subccc	%l1,	%l2,	%g6
	bge	loop_1634
	fpack16	%f4,	%f9
	fpadd32	%f10,	%f10,	%f24
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x54] %asi,	%f29
loop_1634:
	fornot1s	%f5,	%f26,	%f16
	fmovsg	%xcc,	%f16,	%f4
	movl	%icc,	%i2,	%o6
	te	%icc,	0x5
	sllx	%g3,	%i4,	%l3
	sll	%i1,	0x00,	%l6
	array32	%g5,	%i0,	%o5
	tsubcctv	%i7,	0x0ACC,	%g4
	alignaddrl	%l5,	%g7,	%l4
	fbe,a	%fcc1,	loop_1635
	array16	%o0,	%o3,	%i6
	movrne	%l0,	%g2,	%i3
	sir	0x1D10
loop_1635:
	bvc,a,pt	%xcc,	loop_1636
	umul	%g1,	0x056F,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f22,	%f6,	%f26
loop_1636:
	tneg	%xcc,	0x1
	smul	%i5,	0x16E9,	%o1
	xor	%o7,	%o4,	%l1
	fmovdge	%xcc,	%f22,	%f26
	flush	%l7 + 0x40
	xor	%g6,	0x1E92,	%l2
	subc	%o6,	0x0896,	%i2
	wr	%g0,	0x23,	%asi
	stwa	%g3,	[%l7 + 0x30] %asi
	membar	#Sync
	addccc	%i4,	%l3,	%i1
	mova	%icc,	%g5,	%l6
	fpackfix	%f16,	%f30
	fmovde	%xcc,	%f10,	%f3
	tsubcc	%o5,	0x0A40,	%i7
	fmovrdgz	%i0,	%f28,	%f6
	edge16	%l5,	%g7,	%l4
	set	0x1C, %i0
	ldswa	[%l7 + %i0] 0x80,	%o0
	srl	%g4,	%o3,	%l0
	fzeros	%f0
	brgez,a	%g2,	loop_1637
	tg	%xcc,	0x2
	std	%f26,	[%l7 + 0x18]
	movn	%xcc,	%i6,	%g1
loop_1637:
	te	%icc,	0x7
	flush	%l7 + 0x20
	fblg,a	%fcc1,	loop_1638
	xnorcc	%o2,	0x0F57,	%i5
	andcc	%o1,	0x035C,	%i3
	movneg	%icc,	%o7,	%o4
loop_1638:
	ta	%icc,	0x7
	tvs	%icc,	0x7
	bcc,pn	%xcc,	loop_1639
	brlez	%g6,	loop_1640
	fmul8sux16	%f0,	%f20,	%f22
	fmovsg	%xcc,	%f26,	%f13
loop_1639:
	edge8ln	%l1,	%o6,	%l2
loop_1640:
	tn	%xcc,	0x3
	fors	%f24,	%f27,	%f6
	movg	%icc,	%g3,	%i4
	smul	%i2,	0x03FC,	%l3
	swap	[%l7 + 0x10],	%g5
	fsrc2	%f16,	%f0
	fmovsleu	%icc,	%f8,	%f20
	edge8l	%l6,	%i1,	%i7
	subccc	%o5,	%l5,	%g7
	fmovdl	%xcc,	%f24,	%f17
	bg	%icc,	loop_1641
	edge16n	%i0,	%o0,	%g4
	ldd	[%l7 + 0x20],	%o2
	movne	%xcc,	%l4,	%l0
loop_1641:
	udivx	%g2,	0x029F,	%i6
	subcc	%g1,	0x097E,	%o2
	orcc	%i5,	0x0035,	%i3
	tvs	%xcc,	0x0
	brnz	%o7,	loop_1642
	fmovdvs	%icc,	%f14,	%f13
	umul	%o4,	0x041F,	%o1
	bge,a	loop_1643
loop_1642:
	fandnot1	%f26,	%f6,	%f0
	add	%g6,	%o6,	%l2
	taddcc	%g3,	%l1,	%i2
loop_1643:
	smulcc	%l3,	0x085A,	%i4
	te	%xcc,	0x7
	restored
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
	nop
	setx	0xE755A95F47EF4B46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f6
	fcmple16	%f10,	%f18,	%g5
	edge16	%i1,	%i7,	%o5
	bgu,a	%icc,	loop_1644
	tge	%xcc,	0x3
	taddcc	%l6,	%g7,	%i0
	fmovdgu	%icc,	%f29,	%f25
loop_1644:
	tgu	%icc,	0x1
	fornot1	%f30,	%f6,	%f28
	bne,a	loop_1645
	fnot2s	%f18,	%f22
	movcc	%xcc,	%l5,	%g4
	tn	%icc,	0x6
loop_1645:
	ld	[%l7 + 0x20],	%f23
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o0,	%o3
	fmul8ulx16	%f30,	%f22,	%f20
	movn	%xcc,	%l4,	%l0
	xorcc	%i6,	%g2,	%g1
	stb	%o2,	[%l7 + 0x72]
	subccc	%i3,	%i5,	%o7
	add	%o1,	%o4,	%g6
	ldsw	[%l7 + 0x64],	%l2
	fbo	%fcc1,	loop_1646
	sllx	%o6,	0x0C,	%g3
	movle	%icc,	%l1,	%l3
	tvs	%icc,	0x0
loop_1646:
	edge8ln	%i4,	%g5,	%i1
	edge8ln	%i2,	%i7,	%o5
	mulx	%g7,	0x176A,	%i0
	ble	loop_1647
	edge8n	%l5,	%g4,	%l6
	movrlz	%o3,	%l4,	%o0
	fpsub16s	%f4,	%f1,	%f30
loop_1647:
	subc	%l0,	0x1831,	%g2
	fbue,a	%fcc0,	loop_1648
	sdivx	%g1,	0x17A4,	%o2
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f30
	fxtod	%f30,	%f24
	movre	%i3,	0x13A,	%i6
loop_1648:
	array8	%i5,	%o7,	%o4
	sllx	%o1,	0x0F,	%l2
	swap	[%l7 + 0x78],	%o6
	tl	%icc,	0x0
	set	0x30, %o1
	ldstuba	[%l7 + %o1] 0x81,	%g3
	set	0x4C, %i7
	ldswa	[%l7 + %i7] 0x88,	%g6
	tge	%xcc,	0x3
	fbule,a	%fcc1,	loop_1649
	taddcc	%l3,	%i4,	%l1
	brz,a	%g5,	loop_1650
	nop
	fitos	%f4,	%f4
loop_1649:
	orncc	%i1,	%i2,	%i7
	fbul	%fcc2,	loop_1651
loop_1650:
	movrgz	%o5,	%g7,	%i0
	edge16l	%g4,	%l5,	%l6
	udiv	%l4,	0x02DE,	%o3
loop_1651:
	tsubcctv	%l0,	%g2,	%o0
	nop
	setx	0xA170A047BCDABBBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xEC80A836B94FF63A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f22,	%f18
	xorcc	%o2,	0x1FF4,	%g1
	ta	%icc,	0x4
	array32	%i6,	%i5,	%i3
	bgu,a,pn	%icc,	loop_1652
	sdiv	%o7,	0x1E75,	%o4
	orncc	%o1,	0x078C,	%o6
	edge32	%l2,	%g3,	%l3
loop_1652:
	ta	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g6
	subccc	%i4,	%g5,	%i1
	fnegs	%f16,	%f23
	movvc	%xcc,	%l1,	%i7
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x20] %asi,	%i2
	fmovdcc	%icc,	%f8,	%f15
	edge8	%g7,	%o5,	%i0
	call	loop_1653
	srl	%l5,	0x0A,	%l6
	movcs	%icc,	%l4,	%o3
	nop
	setx	loop_1654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1653:
	addc	%g4,	%g2,	%o0
	fmovdne	%xcc,	%f24,	%f16
	tsubcc	%o2,	%l0,	%i6
loop_1654:
	bcs,pn	%xcc,	loop_1655
	move	%xcc,	%g1,	%i5
	movre	%i3,	0x27A,	%o7
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f1
loop_1655:
	tg	%xcc,	0x4
	nop
	setx	0xDDEF2E16390D3C9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x9054D5FBC745ED05,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f30,	%f2
	fmovsg	%icc,	%f12,	%f30
	flush	%l7 + 0x0C
	taddcctv	%o1,	0x12EE,	%o6
	umul	%l2,	0x15E4,	%g3
	edge32l	%o4,	%g6,	%i4
	fbg	%fcc1,	loop_1656
	tn	%icc,	0x4
	xorcc	%l3,	%i1,	%g5
	flush	%l7 + 0x1C
loop_1656:
	tpos	%xcc,	0x4
	tl	%xcc,	0x0
	fmovsvc	%icc,	%f29,	%f27
	brlz	%i7,	loop_1657
	movre	%l1,	%i2,	%o5
	fpmerge	%f31,	%f28,	%f6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%g7
loop_1657:
	movleu	%xcc,	%l5,	%i0
	fble	%fcc3,	loop_1658
	tl	%icc,	0x0
	movrgez	%l4,	%o3,	%l6
	smul	%g2,	%g4,	%o0
loop_1658:
	edge32n	%o2,	%i6,	%g1
	array32	%i5,	%l0,	%o7
	te	%icc,	0x2
	mulx	%i3,	0x16D3,	%o6
	brlez,a	%o1,	loop_1659
	nop
	setx	0xF989CC5D76FEBACD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f14
	edge16	%g3,	%o4,	%l2
	andn	%i4,	0x0E2B,	%g6
loop_1659:
	ldub	[%l7 + 0x0B],	%l3
	movcc	%icc,	%g5,	%i7
	sub	%l1,	%i2,	%o5
	sra	%g7,	0x14,	%i1
	fandnot2s	%f12,	%f17,	%f20
	brnz	%l5,	loop_1660
	addc	%i0,	0x0C79,	%o3
	subc	%l4,	%l6,	%g4
	popc	0x1665,	%o0
loop_1660:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%o2
	popc	%i6,	%g2
	movne	%xcc,	%i5,	%g1
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x188] %asi,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
	srl	%l0,	%o6,	%o1
	movgu	%xcc,	%i3,	%o4
	fnot2	%f24,	%f0
	swap	[%l7 + 0x78],	%l2
	set	0x30, %g1
	stba	%i4,	[%l7 + %g1] 0x89
	tn	%xcc,	0x7
	fmovsl	%xcc,	%f31,	%f2
	sub	%g6,	%l3,	%g3
	tle	%icc,	0x3
	popc	%g5,	%i7
	movneg	%icc,	%i2,	%l1
	or	%g7,	%o5,	%l5
	te	%xcc,	0x7
	fcmpgt32	%f14,	%f4,	%i0
	fmovda	%xcc,	%f7,	%f25
	fpack16	%f4,	%f10
	fmovsle	%xcc,	%f9,	%f23
	bcs,pt	%icc,	loop_1661
	bcc,pt	%icc,	loop_1662
	fba,a	%fcc3,	loop_1663
	popc	%o3,	%l4
loop_1661:
	bleu,a	%xcc,	loop_1664
loop_1662:
	fmovdl	%xcc,	%f5,	%f23
loop_1663:
	nop
	setx	0xC4F0CAF51BFA5444,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x3D3552F662709457,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f0,	%f20
	movcs	%icc,	%i1,	%g4
loop_1664:
	movleu	%xcc,	%l6,	%o0
	edge16	%i6,	%g2,	%i5
	mova	%xcc,	%g1,	%o7
	swap	[%l7 + 0x20],	%l0
	nop
	fitod	%f26,	%f16
	bge,a	loop_1665
	movpos	%icc,	%o6,	%o1
	std	%f28,	[%l7 + 0x60]
	tne	%xcc,	0x5
loop_1665:
	edge32ln	%o2,	%i3,	%l2
	edge16l	%i4,	%o4,	%g6
	fmovsle	%xcc,	%f11,	%f15
	smulcc	%g3,	%l3,	%g5
	brlz,a	%i7,	loop_1666
	tvs	%icc,	0x2
	edge8l	%i2,	%l1,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1666:
	fcmpgt16	%f8,	%f16,	%l5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	nop
	setx loop_1667, %l0, %l1
	jmpl %l1, %g7
	udiv	%l4,	0x0F42,	%i1
	array16	%g4,	%o3,	%l6
	set	0x78, %i1
	lda	[%l7 + %i1] 0x15,	%f26
loop_1667:
	edge32ln	%i6,	%o0,	%i5
	tvc	%icc,	0x7
	nop
	setx	0x06AF97210F3C31E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6887FCAA76F8F76E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f26
	tvc	%xcc,	0x3
	ba,pn	%icc,	loop_1668
	udiv	%g1,	0x04A2,	%g2
	addccc	%l0,	%o6,	%o1
	fmovse	%xcc,	%f26,	%f27
loop_1668:
	fpsub16	%f2,	%f22,	%f24
	tpos	%icc,	0x7
	fmovsg	%xcc,	%f16,	%f2
	sdivx	%o2,	0x1A0A,	%i3
	tge	%icc,	0x1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%i4
	array16	%o4,	%l2,	%g3
	sir	0x18A6
	fbu	%fcc2,	loop_1669
	movcs	%xcc,	%l3,	%g5
	xnor	%g6,	%i7,	%i2
	ld	[%l7 + 0x08],	%f12
loop_1669:
	ldd	[%l7 + 0x70],	%f22
	tne	%xcc,	0x1
	tle	%icc,	0x7
	taddcctv	%o5,	%l5,	%i0
	fbn	%fcc0,	loop_1670
	addcc	%g7,	0x1AA3,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g4
loop_1670:
	nop
	set	0x0D, %g5
	lduba	[%l7 + %g5] 0x15,	%i1
	xor	%l6,	0x0572,	%o3
	sub	%o0,	%i5,	%i6
	bvs,a,pn	%xcc,	loop_1671
	tvc	%icc,	0x5
	movgu	%xcc,	%g2,	%l0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
loop_1671:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	tge	%icc,	0x7
	set	0x48, %l4
	lduwa	[%l7 + %l4] 0x14,	%o2
	fmovdcs	%icc,	%f1,	%f30
	movrgz	%o1,	%o7,	%i4
	edge8n	%o4,	%l2,	%i3
	ldx	[%l7 + 0x68],	%l3
	mulx	%g3,	0x144C,	%g6
	udivx	%i7,	0x148A,	%i2
	bcs,a	%icc,	loop_1672
	subcc	%o5,	%l5,	%g5
	tne	%xcc,	0x4
	fmovsn	%xcc,	%f19,	%f22
loop_1672:
	addccc	%g7,	0x15C2,	%i0
	ba,a,pn	%icc,	loop_1673
	xnor	%l1,	0x0C03,	%g4
	edge16l	%l4,	%l6,	%o3
	fblg	%fcc0,	loop_1674
loop_1673:
	mulscc	%i1,	0x1B77,	%i5
	tvs	%icc,	0x6
	udivcc	%o0,	0x0821,	%i6
loop_1674:
	movcc	%xcc,	%l0,	%g2
	tvs	%xcc,	0x5
	movrgez	%o6,	%o2,	%g1
	fmovdgu	%icc,	%f19,	%f20
	st	%f24,	[%l7 + 0x74]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o1,	%o7
	swap	[%l7 + 0x4C],	%i4
	movrgz	%o4,	0x1A9,	%l2
	ldub	[%l7 + 0x20],	%i3
	tn	%xcc,	0x3
	tgu	%icc,	0x7
	brz	%g3,	loop_1675
	movrlez	%l3,	0x272,	%i7
	xnorcc	%i2,	0x07C7,	%g6
	fmovsle	%xcc,	%f0,	%f17
loop_1675:
	nop
	setx	0xEC57613D2051C416,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	pdist	%f28,	%f18,	%f0
	fsrc2s	%f22,	%f29
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x44] %asi,	%l5
	movrgez	%o5,	%g7,	%g5
	edge16l	%i0,	%l1,	%g4
	or	%l4,	0x18C7,	%o3
	movl	%xcc,	%l6,	%i1
	sdivcc	%i5,	0x1552,	%o0
	movleu	%icc,	%l0,	%i6
	tcs	%icc,	0x7
	ldub	[%l7 + 0x62],	%o6
	fmovrdgez	%g2,	%f12,	%f8
	tsubcctv	%g1,	%o2,	%o7
	movleu	%icc,	%i4,	%o4
	udivcc	%o1,	0x1AE4,	%l2
	nop
	setx	0x7059F5FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	mulscc	%i3,	%g3,	%l3
	fones	%f10
	edge32ln	%i2,	%i7,	%g6
	fmovdne	%xcc,	%f31,	%f25
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f0
	fnors	%f30,	%f13,	%f26
	tvs	%xcc,	0x4
	stbar
	tvc	%xcc,	0x7
	ble,a,pt	%xcc,	loop_1676
	fabss	%f6,	%f24
	movre	%o5,	0x1B3,	%g7
	edge8l	%l5,	%i0,	%l1
loop_1676:
	tvc	%xcc,	0x2
	xorcc	%g4,	0x16BD,	%g5
	nop
	setx	0xCD94AE6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x9B066863,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f10,	%f2
	subccc	%o3,	0x0DCE,	%l4
	fbge	%fcc2,	loop_1677
	fmovdl	%xcc,	%f16,	%f11
	nop
	setx	0x4F58F25E3E97E22F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f18
	movcs	%xcc,	%i1,	%i5
loop_1677:
	fnands	%f16,	%f13,	%f14
	movrne	%o0,	0x004,	%l0
	fmovrsgez	%l6,	%f5,	%f1
	ldub	[%l7 + 0x6B],	%i6
	fmovsl	%xcc,	%f27,	%f12
	mova	%xcc,	%g2,	%o6
	nop
	setx	0xD3CE314D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xF4095AC3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f24,	%f23
	movrlz	%o2,	%g1,	%o7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x52] %asi,	%o4
	fbl,a	%fcc1,	loop_1678
	tvs	%icc,	0x3
	movle	%xcc,	%o1,	%l2
	addcc	%i3,	0x0339,	%g3
loop_1678:
	taddcctv	%l3,	0x0DA7,	%i2
	fmovdvs	%xcc,	%f24,	%f2
	fmovdcs	%icc,	%f20,	%f29
	udivx	%i4,	0x0456,	%g6
	fcmpeq32	%f24,	%f16,	%o5
	sir	0x1059
	ldd	[%l7 + 0x30],	%f24
	nop
	fitos	%f13,	%f1
	fstod	%f1,	%f22
	umulcc	%g7,	0x11F4,	%i7
	andcc	%i0,	0x0113,	%l5
	fbul	%fcc2,	loop_1679
	fmul8ulx16	%f12,	%f24,	%f16
	mova	%xcc,	%g4,	%l1
	srax	%g5,	0x10,	%o3
loop_1679:
	faligndata	%f16,	%f4,	%f12
	fble	%fcc1,	loop_1680
	addc	%l4,	%i1,	%o0
	tcc	%icc,	0x6
	nop
	setx	loop_1681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1680:
	sllx	%i5,	%l0,	%l6
	brlez,a	%g2,	loop_1682
	stbar
loop_1681:
	fmovrdlz	%o6,	%f18,	%f26
	popc	0x115A,	%o2
loop_1682:
	edge32n	%g1,	%o7,	%o4
	fbe,a	%fcc2,	loop_1683
	tcc	%icc,	0x1
	nop
	set	0x58, %o6
	sth	%o1,	[%l7 + %o6]
	fbn,a	%fcc3,	loop_1684
loop_1683:
	ba,a	loop_1685
	prefetch	[%l7 + 0x24],	 0x1
	srlx	%i6,	0x18,	%l2
loop_1684:
	movge	%xcc,	%i3,	%g3
loop_1685:
	movle	%icc,	%i2,	%i4
	nop
	fitod	%f4,	%f22
	fdtox	%f22,	%f26
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f30
	popc	%l3,	%o5
	ta	%xcc,	0x2
	movneg	%icc,	%g7,	%g6
	nop
	setx	0x2B794987445231D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5EECEB0766C56EDB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f0,	%f6
	fmovrslez	%i7,	%f8,	%f24
	taddcctv	%i0,	%g4,	%l5
	set	0x50, %o7
	swapa	[%l7 + %o7] 0x04,	%g5
	call	loop_1686
	fmovdg	%xcc,	%f23,	%f3
	bl,a,pt	%xcc,	loop_1687
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1686:
	tge	%xcc,	0x4
	fpackfix	%f6,	%f18
loop_1687:
	edge32n	%l1,	%l4,	%o3
	tleu	%icc,	0x6
	umulcc	%i1,	0x09F9,	%i5
	fmovrsne	%o0,	%f2,	%f17
	fmul8x16	%f23,	%f24,	%f8
	faligndata	%f4,	%f24,	%f20
	fmovdcc	%icc,	%f19,	%f7
	movge	%xcc,	%l0,	%l6
	edge32ln	%g2,	%o6,	%g1
	movrgz	%o7,	0x30C,	%o2
	set	0x72, %g7
	lduha	[%l7 + %g7] 0x80,	%o1
	edge32n	%o4,	%l2,	%i6
	ldsb	[%l7 + 0x4B],	%g3
	addccc	%i3,	%i2,	%l3
	bl	loop_1688
	movne	%icc,	%o5,	%g7
	array32	%g6,	%i7,	%i0
	fpackfix	%f8,	%f12
loop_1688:
	nop
	set	0x40, %i2
	stxa	%i4,	[%l7 + %i2] 0xeb
	membar	#Sync
	fmovrsgez	%g4,	%f12,	%f23
	fmul8ulx16	%f24,	%f4,	%f18
	umulcc	%g5,	0x182D,	%l1
	set	0x2C, %l0
	swapa	[%l7 + %l0] 0x81,	%l5
	or	%l4,	%o3,	%i1
	brlez,a	%o0,	loop_1689
	movrgez	%l0,	%i5,	%l6
	addcc	%o6,	0x051C,	%g1
	fmovsvc	%icc,	%f14,	%f3
loop_1689:
	movgu	%icc,	%g2,	%o2
	pdist	%f12,	%f24,	%f8
	fsrc2	%f12,	%f20
	fbuge	%fcc0,	loop_1690
	fpack32	%f14,	%f0,	%f24
	bpos,pn	%xcc,	loop_1691
	fpadd32s	%f4,	%f22,	%f26
loop_1690:
	bpos	loop_1692
	srax	%o7,	0x0B,	%o1
loop_1691:
	movrlez	%l2,	0x3CA,	%i6
	bn,a,pt	%xcc,	loop_1693
loop_1692:
	movrgez	%o4,	%g3,	%i2
	fmovrdne	%l3,	%f0,	%f6
	fbue,a	%fcc1,	loop_1694
loop_1693:
	sir	0x1971
	tvs	%xcc,	0x5
	movvc	%icc,	%o5,	%g7
loop_1694:
	sdivcc	%i3,	0x1C72,	%g6
	set	0x26, %l5
	lduba	[%l7 + %l5] 0x88,	%i7
	subcc	%i4,	%g4,	%g5
	brlez	%l1,	loop_1695
	nop
	fitos	%f6,	%f1
	fstox	%f1,	%f16
	bn,a	%icc,	loop_1696
	bcs	loop_1697
loop_1695:
	fandnot1s	%f22,	%f8,	%f20
	fmul8ulx16	%f2,	%f4,	%f10
loop_1696:
	movn	%icc,	%l5,	%i0
loop_1697:
	tge	%icc,	0x6
	fabss	%f12,	%f11
	sll	%l4,	%o3,	%o0
	sir	0x0548
	movrlz	%l0,	0x3CE,	%i1
	movne	%xcc,	%i5,	%o6
	movg	%xcc,	%g1,	%l6
	movg	%icc,	%g2,	%o2
	call	loop_1698
	umulcc	%o7,	%l2,	%o1
	nop
	setx	0x2B737C9B1EB1ECB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f12
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x89,	%i6
loop_1698:
	ta	%xcc,	0x7
	fnot2	%f26,	%f28
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x2
	umul	%o4,	%i2,	%g3
	sra	%o5,	%g7,	%i3
	fmovsleu	%icc,	%f27,	%f27
	movl	%icc,	%g6,	%l3
	movn	%xcc,	%i7,	%g4
	edge16	%g5,	%l1,	%i4
	array32	%i0,	%l5,	%o3
	fmovsl	%xcc,	%f17,	%f12
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x50] %asi,	%o0
	sethi	0x0686,	%l4
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x10,	%i1
	addc	%l0,	%i5,	%o6
	fxor	%f26,	%f16,	%f6
	fbn	%fcc1,	loop_1699
	fmovscs	%icc,	%f29,	%f1
	move	%xcc,	%l6,	%g1
	tleu	%xcc,	0x5
loop_1699:
	ld	[%l7 + 0x7C],	%f1
	tne	%xcc,	0x5
	tvc	%icc,	0x0
	movrgez	%o2,	%o7,	%g2
	mulscc	%o1,	%i6,	%o4
	edge16n	%l2,	%g3,	%o5
	srl	%i2,	0x09,	%g7
	tsubcctv	%i3,	0x02C7,	%g6
	tsubcc	%i7,	0x0BD4,	%l3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f28
	addccc	%g4,	%l1,	%g5
	ldd	[%l7 + 0x28],	%f28
	mulx	%i4,	0x141E,	%i0
	fmovdneg	%xcc,	%f24,	%f9
	set	0x2E, %l2
	lduha	[%l7 + %l2] 0x18,	%l5
	sllx	%o0,	%o3,	%i1
	fmovsneg	%icc,	%f24,	%f16
	movn	%icc,	%l4,	%l0
	movrgez	%i5,	0x17E,	%l6
	and	%g1,	0x0092,	%o6
	movn	%icc,	%o7,	%o2
	movg	%xcc,	%o1,	%g2
	taddcc	%i6,	%o4,	%g3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%o5
	bcc,a	loop_1700
	tvc	%icc,	0x0
	sth	%i2,	[%l7 + 0x4A]
	st	%f5,	[%l7 + 0x20]
loop_1700:
	fpadd16s	%f12,	%f12,	%f6
	fbne	%fcc1,	loop_1701
	fpadd16	%f18,	%f24,	%f24
	edge8	%g7,	%i3,	%g6
	edge32n	%l2,	%i7,	%l3
loop_1701:
	tgu	%xcc,	0x6
	mova	%xcc,	%g4,	%l1
	movle	%xcc,	%i4,	%i0
	tn	%xcc,	0x4
	xnor	%l5,	%o0,	%g5
	umulcc	%i1,	0x0CC4,	%o3
	set	0x2C, %i6
	sta	%f8,	[%l7 + %i6] 0x80
	subc	%l4,	0x007F,	%l0
	mulx	%i5,	0x1B57,	%l6
	srl	%g1,	0x00,	%o6
	orn	%o7,	%o2,	%o1
	ldstub	[%l7 + 0x59],	%i6
	popc	0x03BC,	%g2
	movrne	%g3,	0x1B2,	%o4
	tne	%icc,	0x2
	movne	%icc,	%i2,	%o5
	srax	%g7,	%i3,	%l2
	movrne	%g6,	%i7,	%g4
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x10] %asi
	sll	%i4,	0x12,	%l3
	tvs	%icc,	0x1
	sir	0x1F08
	tsubcc	%l5,	0x1BEA,	%i0
	sll	%o0,	%i1,	%g5
	xorcc	%l4,	0x19CD,	%o3
	membar	0x62
	tneg	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	stxa	%i5,	[%l7 + 0x30] %asi
	ble	loop_1702
	movrgz	%l6,	%l0,	%g1
	subc	%o7,	0x0C3C,	%o2
	andn	%o6,	0x121A,	%o1
loop_1702:
	array32	%i6,	%g3,	%o4
	edge32n	%i2,	%g2,	%g7
	and	%o5,	0x03AB,	%i3
	udivcc	%g6,	0x160B,	%l2
	fbuge,a	%fcc2,	loop_1703
	movgu	%icc,	%i7,	%g4
	nop
	fitos	%f0,	%f0
	fstox	%f0,	%f30
	fmovdne	%xcc,	%f13,	%f18
loop_1703:
	brz	%l1,	loop_1704
	tleu	%xcc,	0x1
	srax	%i4,	0x0A,	%l5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x6C] %asi,	%i0
loop_1704:
	movvs	%icc,	%o0,	%i1
	movne	%xcc,	%g5,	%l4
	tsubcc	%l3,	0x07E7,	%i5
	fmovrde	%o3,	%f28,	%f6
	array32	%l6,	%g1,	%l0
	sllx	%o2,	%o7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i6,	0x12D,	%g3
	nop
	setx	0x87C4643C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xDDF15DB6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f25,	%f30
	addcc	%o4,	0x0550,	%i2
	fmovsle	%xcc,	%f14,	%f21
	fmul8x16al	%f30,	%f20,	%f24
	movrlz	%o6,	0x1CD,	%g7
	sllx	%g2,	%i3,	%g6
	array16	%o5,	%i7,	%l2
	orcc	%l1,	%i4,	%g4
	tge	%xcc,	0x3
	ldx	[%l7 + 0x60],	%i0
	tn	%xcc,	0x6
	set	0x40, %g3
	ldswa	[%l7 + %g3] 0x15,	%o0
	bg,a,pt	%icc,	loop_1705
	tl	%icc,	0x1
	ldstub	[%l7 + 0x42],	%l5
	ldstub	[%l7 + 0x34],	%i1
loop_1705:
	nop
	set	0x60, %l3
	ldswa	[%l7 + %l3] 0x15,	%l4
	edge16ln	%l3,	%i5,	%g5
	edge8n	%l6,	%g1,	%o3
	nop
	fitos	%f3,	%f2
	fstox	%f2,	%f6
	edge8n	%l0,	%o7,	%o2
	smul	%o1,	0x0E27,	%g3
	nop
	setx	0x506EBFC3,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	subcc	%o4,	0x08B2,	%i6
	ldsh	[%l7 + 0x70],	%i2
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f14
	fmuld8ulx16	%f11,	%f4,	%f28
	movre	%g7,	%o6,	%i3
	fpsub32	%f0,	%f22,	%f14
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x2f,	%g6
	movge	%xcc,	%o5,	%g2
	fxors	%f9,	%f11,	%f11
	tcc	%xcc,	0x0
	fmovscc	%xcc,	%f18,	%f25
	movge	%xcc,	%l2,	%l1
	movpos	%xcc,	%i7,	%i4
	bleu	loop_1706
	fbue,a	%fcc0,	loop_1707
	fmul8x16au	%f16,	%f19,	%f14
	smulcc	%i0,	%o0,	%g4
loop_1706:
	move	%icc,	%l5,	%i1
loop_1707:
	bn,a,pn	%icc,	loop_1708
	edge32l	%l4,	%i5,	%g5
	subc	%l6,	0x05F0,	%l3
	mulscc	%o3,	%g1,	%l0
loop_1708:
	nop
	fitos	%f31,	%f12
	movpos	%icc,	%o2,	%o7
	fand	%f18,	%f28,	%f18
	sethi	0x01B8,	%g3
	fandnot1s	%f9,	%f24,	%f26
	movl	%xcc,	%o4,	%o1
	movge	%icc,	%i2,	%i6
	tl	%icc,	0x2
	mova	%icc,	%o6,	%i3
	edge16n	%g6,	%o5,	%g2
	alignaddr	%g7,	%l1,	%i7
	fzero	%f12
	tsubcc	%i4,	0x157C,	%l2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%i0
	udivx	%o0,	0x05C5,	%g4
	bvc,pt	%icc,	loop_1709
	move	%xcc,	%i1,	%l5
	fbule,a	%fcc2,	loop_1710
	orn	%l4,	0x0FE2,	%i5
loop_1709:
	mulscc	%l6,	%g5,	%l3
	edge32l	%g1,	%o3,	%o2
loop_1710:
	tle	%xcc,	0x3
	xorcc	%l0,	%g3,	%o7
	edge32	%o1,	%i2,	%i6
	edge16ln	%o4,	%o6,	%g6
	sub	%i3,	%o5,	%g7
	array32	%g2,	%l1,	%i4
	movvc	%xcc,	%i7,	%i0
	srlx	%o0,	%l2,	%g4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	fmovdvs	%xcc,	%f25,	%f20
	movge	%xcc,	%l4,	%l5
	movge	%xcc,	%l6,	%g5
	fpadd16	%f0,	%f22,	%f2
	sethi	0x1103,	%l3
	set	0x10, %o4
	stxa	%i5,	[%g0 + %o4] 0x21
	edge32ln	%g1,	%o3,	%o2
	mova	%xcc,	%l0,	%g3
	brlz	%o1,	loop_1711
	udivcc	%o7,	0x1FC7,	%i6
	srax	%i2,	0x17,	%o6
	fpadd16	%f24,	%f28,	%f20
loop_1711:
	edge16l	%o4,	%i3,	%o5
	fmuld8sux16	%f15,	%f9,	%f14
	wr	%g0,	0x2f,	%asi
	stxa	%g7,	[%l7 + 0x48] %asi
	membar	#Sync
	fabsd	%f20,	%f28
	movrlz	%g6,	0x0A2,	%g2
	alignaddr	%i4,	%i7,	%l1
	tcs	%icc,	0x6
	fmovdg	%icc,	%f25,	%f6
	udivcc	%i0,	0x05C9,	%o0
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x80,	%g4
	tvc	%icc,	0x4
	call	loop_1712
	mulscc	%l2,	%l4,	%i1
	fbe	%fcc2,	loop_1713
	xor	%l6,	0x1459,	%g5
loop_1712:
	mulscc	%l3,	%l5,	%i5
	bvc,pt	%icc,	loop_1714
loop_1713:
	subc	%o3,	%g1,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f16,	%f13
loop_1714:
	fone	%f2
	subccc	%g3,	%l0,	%o7
	sllx	%o1,	0x02,	%i2
	sth	%i6,	[%l7 + 0x6E]
	movpos	%icc,	%o6,	%o4
	andn	%o5,	%g7,	%g6
	alignaddr	%i3,	%g2,	%i4
	addcc	%l1,	%i7,	%i0
	membar	0x21
	tneg	%xcc,	0x0
	tn	%xcc,	0x3
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o0
	smul	%g4,	%l4,	%i1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%l2
	fnot2	%f30,	%f2
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x1A] %asi,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l6,	0x1A19,	%l5
	tcc	%xcc,	0x3
	sllx	%i5,	0x04,	%o3
	orn	%g1,	%o2,	%g3
	subcc	%l3,	0x136B,	%l0
	fbe,a	%fcc1,	loop_1715
	add	%o7,	0x1B5A,	%i2
	movleu	%icc,	%o1,	%o6
	movleu	%xcc,	%i6,	%o4
loop_1715:
	fand	%f4,	%f2,	%f2
	std	%f6,	[%l7 + 0x10]
	movcs	%xcc,	%g7,	%o5
	addccc	%g6,	0x08BC,	%g2
	fblg	%fcc3,	loop_1716
	movg	%xcc,	%i3,	%l1
	nop
	setx	loop_1717,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%i4,	0x1E8D,	%i0
loop_1716:
	smulcc	%o0,	0x0C03,	%g4
	xor	%l4,	%i1,	%i7
loop_1717:
	add	%l2,	0x113F,	%l6
	tgu	%icc,	0x1
	addc	%g5,	0x10B8,	%i5
	tn	%icc,	0x7
	fble	%fcc2,	loop_1718
	movpos	%xcc,	%l5,	%o3
	fmovscs	%xcc,	%f27,	%f28
	edge8n	%g1,	%g3,	%l3
loop_1718:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x4313858E78554CF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x36F328E33A441352,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f18,	%f20
	bl,a,pn	%icc,	loop_1719
	movcc	%icc,	%o2,	%o7
	umulcc	%i2,	%l0,	%o1
	fabss	%f15,	%f25
loop_1719:
	alignaddrl	%i6,	%o6,	%o4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x10] %asi,	%f1
	sllx	%g7,	%g6,	%o5
	sethi	0x1992,	%i3
	udivx	%g2,	0x08A2,	%i4
	fmovsl	%xcc,	%f8,	%f4
	fpmerge	%f20,	%f8,	%f22
	andncc	%i0,	%l1,	%o0
	bshuffle	%f26,	%f4,	%f30
	movrgz	%l4,	%g4,	%i7
	xor	%l2,	0x1D33,	%l6
	fmul8x16au	%f5,	%f6,	%f14
	andcc	%i1,	%g5,	%i5
	edge32n	%l5,	%o3,	%g1
	ta	%icc,	0x3
	fmovrsgz	%g3,	%f19,	%f3
	tsubcc	%o2,	%o7,	%l3
	array32	%l0,	%i2,	%i6
	array8	%o6,	%o4,	%o1
	and	%g7,	0x04DC,	%o5
	edge32	%g6,	%g2,	%i3
	subccc	%i4,	%l1,	%o0
	fzeros	%f2
	brz,a	%l4,	loop_1720
	tcc	%icc,	0x1
	fbul	%fcc2,	loop_1721
	sllx	%i0,	0x03,	%i7
loop_1720:
	andncc	%l2,	%l6,	%g4
	ldsb	[%l7 + 0x55],	%i1
loop_1721:
	tne	%icc,	0x7
	fmovsge	%xcc,	%f17,	%f0
	sll	%i5,	0x03,	%l5
	add	%o3,	0x02F1,	%g1
	movre	%g5,	0x3DC,	%g3
	ldsb	[%l7 + 0x78],	%o2
	fcmpeq16	%f6,	%f20,	%l3
	tle	%xcc,	0x2
	edge16n	%l0,	%i2,	%i6
	add	%o6,	0x13BB,	%o7
	fornot2	%f4,	%f12,	%f2
	xor	%o4,	0x044F,	%o1
	nop
	fitod	%f6,	%f28
	tg	%xcc,	0x1
	fbo,a	%fcc2,	loop_1722
	sll	%o5,	0x09,	%g6
	fmovsleu	%icc,	%f14,	%f13
	nop
	setx	loop_1723,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1722:
	ba,a	%icc,	loop_1724
	tg	%xcc,	0x6
	xnor	%g2,	0x17B0,	%i3
loop_1723:
	brgz,a	%i4,	loop_1725
loop_1724:
	sethi	0x0E75,	%l1
	orncc	%o0,	0x0548,	%l4
	edge16	%i0,	%g7,	%l2
loop_1725:
	movrgz	%l6,	%i7,	%g4
	sdiv	%i1,	0x0CB4,	%i5
	brgz,a	%o3,	loop_1726
	subcc	%l5,	0x082E,	%g1
	fxor	%f2,	%f4,	%f12
	ldd	[%l7 + 0x18],	%f28
loop_1726:
	edge16l	%g5,	%g3,	%o2
	tcs	%icc,	0x4
	tcc	%icc,	0x0
	sdivcc	%l3,	0x19EC,	%i2
	set	0x72, %o2
	ldstuba	[%l7 + %o2] 0x19,	%i6
	sllx	%o6,	0x00,	%o7
	fcmple16	%f4,	%f26,	%l0
	xor	%o4,	%o1,	%o5
	fzeros	%f27
	bcs,a	%icc,	loop_1727
	brgz,a	%g6,	loop_1728
	umulcc	%g2,	%i4,	%i3
	alignaddr	%o0,	%l1,	%i0
loop_1727:
	tsubcctv	%g7,	0x0300,	%l4
loop_1728:
	ldsb	[%l7 + 0x66],	%l2
	tge	%xcc,	0x5
	udiv	%l6,	0x0FFB,	%g4
	tl	%xcc,	0x5
	tne	%icc,	0x7
	fnegd	%f12,	%f8
	fmovsn	%xcc,	%f12,	%f0
	xorcc	%i7,	%i1,	%o3
	movl	%xcc,	%l5,	%g1
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f26
	fxtos	%f26,	%f1
	fmovsneg	%icc,	%f3,	%f4
	fmovdleu	%icc,	%f17,	%f26
	orn	%g5,	%i5,	%g3
	nop
	set	0x20, %i4
	stw	%o2,	[%l7 + %i4]
	fzeros	%f17
	ldsb	[%l7 + 0x49],	%l3
	movne	%icc,	%i2,	%o6
	srl	%i6,	0x19,	%l0
	fmovda	%xcc,	%f10,	%f27
	udiv	%o7,	0x13CC,	%o1
	andcc	%o4,	0x0E4B,	%o5
	bneg	loop_1729
	bgu	%xcc,	loop_1730
	brlz	%g6,	loop_1731
	tsubcctv	%g2,	%i4,	%o0
loop_1729:
	edge8n	%l1,	%i0,	%i3
loop_1730:
	or	%g7,	0x0B4D,	%l4
loop_1731:
	edge32ln	%l6,	%l2,	%g4
	fmovsge	%xcc,	%f6,	%f3
	nop
	setx loop_1732, %l0, %l1
	jmpl %l1, %i7
	prefetch	[%l7 + 0x48],	 0x1
	fmovsge	%icc,	%f23,	%f15
	fexpand	%f21,	%f16
loop_1732:
	fmovrslz	%i1,	%f24,	%f3
	sra	%l5,	%g1,	%g5
	nop
	setx loop_1733, %l0, %l1
	jmpl %l1, %o3
	edge8ln	%g3,	%i5,	%o2
	fornot1s	%f26,	%f16,	%f30
	subcc	%i2,	%l3,	%i6
loop_1733:
	edge8l	%l0,	%o7,	%o1
	or	%o4,	0x01FB,	%o5
	ldd	[%l7 + 0x30],	%g6
	edge32ln	%o6,	%g2,	%o0
	brgez	%i4,	loop_1734
	sllx	%l1,	0x03,	%i0
	movrne	%g7,	0x0F0,	%i3
	udiv	%l6,	0x0DDE,	%l2
loop_1734:
	umul	%g4,	%l4,	%i1
	nop
	fitod	%f0,	%f6
	tn	%icc,	0x6
	edge32l	%l5,	%i7,	%g5
	xnorcc	%o3,	0x18A1,	%g3
	set	0x20, %i3
	stxa	%i5,	[%l7 + %i3] 0x81
	bvc,a	loop_1735
	fmovscc	%icc,	%f5,	%f22
	fblg	%fcc3,	loop_1736
	movre	%o2,	%g1,	%i2
loop_1735:
	fbue	%fcc3,	loop_1737
	bleu,a,pn	%xcc,	loop_1738
loop_1736:
	movrne	%i6,	0x1C1,	%l3
	edge8ln	%l0,	%o1,	%o4
loop_1737:
	xnor	%o5,	%o7,	%o6
loop_1738:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x5C] %asi,	%g6
	movre	%o0,	0x331,	%g2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%i0
	wr	%g0,	0x2f,	%asi
	stba	%g7,	[%l7 + 0x2F] %asi
	membar	#Sync
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf1
	membar	#Sync
	movcs	%icc,	%i3,	%l6
	sth	%l1,	[%l7 + 0x34]
	ldsh	[%l7 + 0x3E],	%l2
	fbge	%fcc1,	loop_1739
	ldsb	[%l7 + 0x25],	%g4
	orn	%l4,	%i1,	%l5
	tg	%icc,	0x0
loop_1739:
	popc	%i7,	%g5
	tcs	%icc,	0x2
	bg,pn	%icc,	loop_1740
	fbu,a	%fcc3,	loop_1741
	srax	%o3,	0x03,	%i5
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x11,	%o2
loop_1740:
	fmovse	%xcc,	%f27,	%f10
loop_1741:
	nop
	set	0x50, %l1
	lduwa	[%l7 + %l1] 0x88,	%g3
	edge32l	%i2,	%g1,	%i6
	membar	0x69
	stx	%l0,	[%l7 + 0x40]
	fsrc2s	%f27,	%f5
	brlez,a	%l3,	loop_1742
	stx	%o4,	[%l7 + 0x40]
	edge8	%o1,	%o5,	%o6
	ldx	[%l7 + 0x18],	%g6
loop_1742:
	umul	%o7,	%g2,	%i4
	ldx	[%l7 + 0x60],	%o0
	ldsh	[%l7 + 0x22],	%g7
	subccc	%i3,	0x1814,	%l6
	movge	%xcc,	%l1,	%i0
	tsubcc	%l2,	%g4,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc2,	loop_1743
	movrne	%i1,	%l5,	%i7
	fones	%f25
	faligndata	%f20,	%f16,	%f14
loop_1743:
	fornot2	%f0,	%f16,	%f8
	or	%g5,	%o3,	%o2
	fnor	%f0,	%f24,	%f6
	movrlz	%i5,	0x35A,	%i2
	tvs	%icc,	0x3
	edge32l	%g1,	%i6,	%g3
	fmul8x16	%f7,	%f6,	%f14
	umul	%l3,	%l0,	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o1,	%o5
	wr	%g0,	0x89,	%asi
	sta	%f12,	[%l7 + 0x74] %asi
	sdivcc	%g6,	0x0AB0,	%o6
	fmovs	%f14,	%f8
	st	%f9,	[%l7 + 0x3C]
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x88
	sra	%g2,	0x00,	%o7
	movge	%icc,	%i4,	%g7
	fmovrsgz	%i3,	%f29,	%f8
	ldsw	[%l7 + 0x58],	%l6
	fnegd	%f12,	%f30
	fzero	%f6
	taddcc	%o0,	0x02A0,	%i0
	te	%icc,	0x4
	st	%f2,	[%l7 + 0x30]
	andn	%l1,	%g4,	%l4
	srax	%i1,	0x15,	%l2
	sethi	0x0F5E,	%i7
	taddcc	%l5,	%o3,	%o2
	andn	%i5,	0x0852,	%g5
	lduh	[%l7 + 0x20],	%g1
	tcc	%xcc,	0x2
	brlez	%i2,	loop_1744
	stx	%g3,	[%l7 + 0x08]
	bcc,a	loop_1745
	move	%xcc,	%l3,	%l0
loop_1744:
	tne	%xcc,	0x4
	fnot2	%f0,	%f2
loop_1745:
	fble	%fcc0,	loop_1746
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f13,	%f30,	%f28
	subccc	%o4,	0x154F,	%o1
loop_1746:
	fsrc1	%f12,	%f18
	tl	%xcc,	0x4
	fzero	%f0
	tgu	%xcc,	0x6
	srlx	%i6,	0x0E,	%g6
	fbo,a	%fcc0,	loop_1747
	or	%o6,	0x0F94,	%g2
	tleu	%xcc,	0x1
	fpsub16s	%f12,	%f5,	%f13
loop_1747:
	bge,a	%xcc,	loop_1748
	ldd	[%l7 + 0x40],	%f8
	movge	%icc,	%o7,	%o5
	sethi	0x0C58,	%g7
loop_1748:
	fbne	%fcc0,	loop_1749
	te	%xcc,	0x7
	mulscc	%i4,	%i3,	%o0
	edge16ln	%i0,	%l6,	%l1
loop_1749:
	edge16l	%l4,	%i1,	%l2
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmuld8sux16	%f26,	%f29,	%f14
	bl	%icc,	loop_1750
	fsrc2	%f16,	%f0
	set	0x42, %o1
	stha	%g4,	[%l7 + %o1] 0x0c
loop_1750:
	umul	%i7,	%o3,	%o2
	prefetch	[%l7 + 0x7C],	 0x3
	fbge,a	%fcc2,	loop_1751
	fnors	%f11,	%f9,	%f4
	movrne	%l5,	%g5,	%i5
	fmul8sux16	%f28,	%f12,	%f18
loop_1751:
	brgz,a	%i2,	loop_1752
	brgez	%g1,	loop_1753
	membar	0x3C
	ldub	[%l7 + 0x50],	%l3
loop_1752:
	edge32	%l0,	%g3,	%o1
loop_1753:
	tleu	%icc,	0x7
	movrgz	%i6,	0x1B4,	%o4
	move	%icc,	%g6,	%o6
	fexpand	%f6,	%f16
	ba	loop_1754
	sllx	%o7,	0x16,	%g2
	fsrc1s	%f0,	%f29
	mulx	%g7,	%o5,	%i3
loop_1754:
	movre	%o0,	%i4,	%l6
	ta	%xcc,	0x5
	fmovdgu	%xcc,	%f27,	%f18
	sllx	%i0,	%l4,	%i1
	edge8ln	%l2,	%g4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f13,	%f25
	tge	%xcc,	0x5
	edge16n	%l1,	%o3,	%l5
	sdivcc	%o2,	0x1784,	%g5
	wr	%g0,	0xea,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	membar	#Sync
	tsubcctv	%i2,	0x03F3,	%l3
	tle	%icc,	0x2
	tcs	%icc,	0x5
	fmovrsgez	%g1,	%f9,	%f4
	fbg,a	%fcc3,	loop_1755
	bvs,pt	%icc,	loop_1756
	flush	%l7 + 0x14
	movre	%l0,	%g3,	%o1
loop_1755:
	movcc	%xcc,	%i6,	%g6
loop_1756:
	xnorcc	%o4,	%o7,	%g2
	bn	loop_1757
	movre	%g7,	%o6,	%i3
	tleu	%xcc,	0x3
	mulscc	%o5,	0x1D1D,	%i4
loop_1757:
	ldd	[%l7 + 0x08],	%o0
	mova	%icc,	%l6,	%i0
	mulscc	%i1,	%l2,	%g4
	fmovsgu	%icc,	%f1,	%f14
	udivx	%i7,	0x1148,	%l1
	movgu	%xcc,	%l4,	%l5
	subccc	%o3,	%o2,	%g5
	andcc	%i5,	%i2,	%g1
	nop
	setx	0xF8F2640776943EBB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xCD5B43340C076976,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f10
	xor	%l0,	0x16EF,	%g3
	fandnot2s	%f4,	%f4,	%f11
	movleu	%xcc,	%l3,	%o1
	fnot2	%f10,	%f28
	fsrc2	%f18,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i6,	%o4,	%g6
	st	%f15,	[%l7 + 0x3C]
	nop
	fitod	%f0,	%f22
	fdtoi	%f22,	%f27
	movle	%icc,	%g2,	%o7
	mulscc	%o6,	%g7,	%i3
	movpos	%icc,	%o5,	%o0
	tne	%icc,	0x7
	faligndata	%f0,	%f22,	%f24
	srl	%l6,	%i4,	%i0
	brlz,a	%l2,	loop_1758
	orn	%i1,	%i7,	%g4
	fble	%fcc0,	loop_1759
	tl	%xcc,	0x1
loop_1758:
	sdivcc	%l1,	0x012E,	%l5
	fble,a	%fcc3,	loop_1760
loop_1759:
	bvc,a	%xcc,	loop_1761
	orncc	%l4,	%o3,	%o2
	be,pn	%xcc,	loop_1762
loop_1760:
	movre	%i5,	%i2,	%g1
loop_1761:
	srl	%l0,	0x08,	%g3
	srax	%l3,	%o1,	%i6
loop_1762:
	tpos	%icc,	0x7
	sub	%o4,	%g6,	%g2
	bleu,pn	%xcc,	loop_1763
	edge16ln	%g5,	%o6,	%o7
	edge32l	%g7,	%o5,	%o0
	or	%l6,	%i3,	%i0
loop_1763:
	tneg	%xcc,	0x7
	nop
	fitod	%f16,	%f24
	array32	%i4,	%i1,	%l2
	sethi	0x0B88,	%i7
	array16	%l1,	%l5,	%g4
	movleu	%xcc,	%l4,	%o2
	addc	%o3,	%i2,	%i5
	nop
	setx	0xCC0895F2D82C59E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x2A91F16E469E5FA9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f16,	%f2
	movrgz	%g1,	0x03F,	%l0
	alignaddr	%g3,	%o1,	%i6
	fxor	%f30,	%f8,	%f8
	movl	%xcc,	%o4,	%l3
	movcc	%icc,	%g2,	%g6
	array8	%g5,	%o6,	%o7
	addccc	%o5,	0x1D4D,	%g7
	edge16n	%l6,	%o0,	%i0
	fnot2s	%f30,	%f23
	array8	%i3,	%i1,	%i4
	brlz,a	%i7,	loop_1764
	fmovsvc	%icc,	%f12,	%f4
	umulcc	%l2,	%l1,	%l5
	stw	%g4,	[%l7 + 0x4C]
loop_1764:
	edge8	%l4,	%o2,	%i2
	fcmpeq16	%f24,	%f14,	%i5
	fbug	%fcc2,	loop_1765
	popc	0x1A0A,	%o3
	tl	%icc,	0x6
	movn	%icc,	%l0,	%g1
loop_1765:
	umul	%g3,	0x0827,	%i6
	movrgz	%o4,	%l3,	%g2
	ta	%xcc,	0x4
	tne	%xcc,	0x4
	movgu	%icc,	%g6,	%g5
	movl	%icc,	%o1,	%o6
	mova	%xcc,	%o7,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x7
	edge16n	%l6,	%g7,	%o0
	movrgz	%i0,	0x219,	%i3
	fpsub16s	%f27,	%f15,	%f9
	fmovrdlez	%i1,	%f2,	%f18
	udivcc	%i7,	0x0EC1,	%l2
	movg	%icc,	%i4,	%l1
	udiv	%l5,	0x1B20,	%g4
	movvc	%xcc,	%l4,	%i2
	tcc	%xcc,	0x3
	nop
	fitod	%f6,	%f30
	fdtos	%f30,	%f27
	ldstub	[%l7 + 0x55],	%i5
	subccc	%o3,	0x13E6,	%o2
	fmovrslz	%l0,	%f5,	%f27
	fnands	%f19,	%f1,	%f5
	move	%xcc,	%g1,	%i6
	tleu	%icc,	0x7
	fpadd16s	%f5,	%f14,	%f23
	fmovdg	%icc,	%f11,	%f16
	tge	%xcc,	0x2
	bvs,pt	%xcc,	loop_1766
	edge16ln	%g3,	%o4,	%l3
	sub	%g6,	0x0A42,	%g2
	srlx	%o1,	%g5,	%o6
loop_1766:
	movn	%icc,	%o5,	%l6
	xnorcc	%g7,	%o7,	%o0
	set	0x18, %i7
	ldsha	[%l7 + %i7] 0x89,	%i0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%i3
	nop
	fitos	%f30,	%f6
	fmovrsne	%i7,	%f2,	%f8
	fmovdn	%icc,	%f11,	%f31
	srax	%i1,	0x06,	%i4
	bneg,a	%icc,	loop_1767
	movcc	%xcc,	%l2,	%l1
	nop
	fitos	%f19,	%f14
	flush	%l7 + 0x20
loop_1767:
	sub	%l5,	%l4,	%i2
	ble,a	loop_1768
	edge8n	%i5,	%o3,	%g4
	mulx	%o2,	0x1C8F,	%l0
	set	0x60, %g1
	ldda	[%l7 + %g1] 0xe3,	%i6
loop_1768:
	fmovde	%icc,	%f25,	%f25
	movne	%xcc,	%g3,	%o4
	sub	%g1,	0x072A,	%g6
	andn	%g2,	%l3,	%g5
	flush	%l7 + 0x48
	nop
	setx	0xC045FD03,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	ble,pt	%xcc,	loop_1769
	ldx	[%l7 + 0x60],	%o6
	movrne	%o1,	%l6,	%g7
	xnorcc	%o5,	0x1F3A,	%o7
loop_1769:
	mulx	%o0,	%i3,	%i7
	tcs	%icc,	0x7
	sra	%i0,	%i1,	%i4
	set	0x54, %i1
	stwa	%l1,	[%l7 + %i1] 0x04
	fnegd	%f24,	%f26
	movge	%xcc,	%l2,	%l5
	movvc	%icc,	%i2,	%i5
	xnorcc	%l4,	0x10F8,	%g4
	for	%f24,	%f18,	%f18
	movrne	%o3,	0x060,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f13,	%f1,	%f2
	movcs	%xcc,	%l0,	%g3
	addcc	%i6,	0x1A1F,	%g1
	stx	%o4,	[%l7 + 0x38]
	movn	%icc,	%g2,	%l3
	movle	%xcc,	%g6,	%o6
	fbule	%fcc3,	loop_1770
	prefetch	[%l7 + 0x24],	 0x1
	bleu	loop_1771
	addccc	%g5,	%l6,	%o1
loop_1770:
	bn,a	%icc,	loop_1772
	brgez,a	%g7,	loop_1773
loop_1771:
	be,a,pt	%xcc,	loop_1774
	tcs	%icc,	0x5
loop_1772:
	udivcc	%o5,	0x1C1A,	%o7
loop_1773:
	sll	%o0,	0x16,	%i7
loop_1774:
	fblg	%fcc1,	loop_1775
	sll	%i0,	%i1,	%i4
	xorcc	%l1,	%i3,	%l2
	stw	%l5,	[%l7 + 0x68]
loop_1775:
	movcc	%xcc,	%i5,	%i2
	fnors	%f29,	%f14,	%f23
	fmovs	%f14,	%f28
	edge16ln	%l4,	%o3,	%g4
	fxnors	%f21,	%f13,	%f19
	fcmpne32	%f12,	%f14,	%l0
	movrlz	%g3,	%i6,	%o2
	bcs,a	loop_1776
	bcc	loop_1777
	movn	%icc,	%g1,	%g2
	fba	%fcc1,	loop_1778
loop_1776:
	fbug	%fcc0,	loop_1779
loop_1777:
	sdivx	%o4,	0x1037,	%g6
	fbu	%fcc1,	loop_1780
loop_1778:
	brz	%o6,	loop_1781
loop_1779:
	alignaddrl	%l3,	%l6,	%g5
	flush	%l7 + 0x78
loop_1780:
	fpmerge	%f14,	%f6,	%f28
loop_1781:
	umulcc	%g7,	0x1D13,	%o5
	edge16	%o7,	%o0,	%o1
	membar	0x2F
	fmovsvs	%xcc,	%f30,	%f10
	fbue	%fcc1,	loop_1782
	fba	%fcc2,	loop_1783
	tg	%icc,	0x6
	bpos,pn	%xcc,	loop_1784
loop_1782:
	sdivcc	%i7,	0x188F,	%i0
loop_1783:
	nop
	set	0x0D, %g5
	ldstub	[%l7 + %g5],	%i4
	nop
	fitos	%f4,	%f6
	fstoi	%f6,	%f16
loop_1784:
	tn	%icc,	0x7
	fbule,a	%fcc3,	loop_1785
	tvc	%xcc,	0x3
	brlez,a	%i1,	loop_1786
	edge16ln	%l1,	%i3,	%l5
loop_1785:
	add	%l2,	0x01BF,	%i5
	edge16l	%l4,	%i2,	%g4
loop_1786:
	fnot2	%f18,	%f16
	tgu	%icc,	0x0
	movneg	%icc,	%l0,	%o3
	fnand	%f28,	%f18,	%f18
	ldsh	[%l7 + 0x62],	%g3
	alignaddrl	%o2,	%g1,	%i6
	fmovrslez	%g2,	%f31,	%f25
	fcmpeq16	%f4,	%f18,	%o4
	fmovrde	%o6,	%f24,	%f20
	fmovsg	%icc,	%f7,	%f20
	brgez	%g6,	loop_1787
	smul	%l3,	0x1163,	%l6
	xnor	%g7,	%o5,	%g5
	tcc	%xcc,	0x4
loop_1787:
	ldsw	[%l7 + 0x30],	%o0
	fcmple32	%f22,	%f8,	%o7
	fexpand	%f8,	%f22
	set	0x50, %l4
	ldda	[%l7 + %l4] 0xea,	%i6
	brlez	%i0,	loop_1788
	fbl	%fcc3,	loop_1789
	mulscc	%o1,	%i1,	%l1
	fmovdne	%icc,	%f4,	%f8
loop_1788:
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f18
loop_1789:
	xnorcc	%i3,	0x0C24,	%i4
	edge16n	%l5,	%i5,	%l4
	tcc	%icc,	0x0
	ldstub	[%l7 + 0x15],	%l2
	ldstub	[%l7 + 0x54],	%g4
	stx	%l0,	[%l7 + 0x20]
	brgez,a	%o3,	loop_1790
	fmovsl	%xcc,	%f29,	%f10
	movle	%xcc,	%i2,	%g3
	edge32n	%g1,	%o2,	%g2
loop_1790:
	be,a	loop_1791
	fcmpgt16	%f30,	%f26,	%i6
	brz,a	%o6,	loop_1792
	nop
	set	0x34, %i5
	sth	%g6,	[%l7 + %i5]
loop_1791:
	fmovda	%icc,	%f23,	%f12
	sub	%o4,	%l6,	%g7
loop_1792:
	movrlez	%o5,	%g5,	%l3
	fpack16	%f8,	%f15
	taddcc	%o0,	%o7,	%i0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x15,	%f0
	wr	%g0,	0x11,	%asi
	stxa	%o1,	[%l7 + 0x48] %asi
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrdne	%i7,	%f24,	%f0
	bneg,pn	%xcc,	loop_1793
	tg	%icc,	0x2
	tvc	%xcc,	0x6
	add	%l1,	%i1,	%i3
loop_1793:
	movrgez	%i4,	%i5,	%l5
	fbue,a	%fcc1,	loop_1794
	xnorcc	%l4,	0x0004,	%l2
	tvc	%icc,	0x2
	tgu	%icc,	0x5
loop_1794:
	add	%g4,	0x15BB,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f16
	sdivcc	%l0,	0x141D,	%g3
	movle	%xcc,	%g1,	%i2
	bne	%xcc,	loop_1795
	mulx	%o2,	%g2,	%i6
	addc	%o6,	%g6,	%o4
	fzeros	%f11
loop_1795:
	tcc	%icc,	0x7
	edge16n	%l6,	%g7,	%g5
	bcc,a	loop_1796
	membar	0x55
	sub	%l3,	%o0,	%o7
	ldd	[%l7 + 0x68],	%i0
loop_1796:
	fmovdgu	%icc,	%f15,	%f14
	ta	%icc,	0x2
	movg	%icc,	%o1,	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o5
	mulx	%i1,	%i3,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i5,	0x1DCF,	%l5
	taddcctv	%l2,	%l4,	%g4
	tle	%icc,	0x3
	fornot1	%f20,	%f6,	%f22
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x19,	%l0,	%g3
	edge32l	%o3,	%i2,	%o2
	bne,pn	%xcc,	loop_1797
	edge32l	%g1,	%g2,	%i6
	sub	%g6,	%o6,	%l6
	set	0x28, %o7
	stha	%o4,	[%l7 + %o7] 0x88
loop_1797:
	movrgez	%g7,	0x316,	%l3
	fpsub16s	%f24,	%f23,	%f24
	edge8ln	%g5,	%o7,	%o0
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x0c,	%o1
	taddcctv	%i7,	%i0,	%o5
	ba,pn	%icc,	loop_1798
	addcc	%i1,	%l1,	%i3
	tle	%xcc,	0x6
	stbar
loop_1798:
	udivx	%i4,	0x1FAC,	%l5
	fmuld8ulx16	%f8,	%f24,	%f12
	edge8ln	%l2,	%i5,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l0,	%l4,	%o3
	st	%f18,	[%l7 + 0x74]
	smulcc	%g3,	0x08D5,	%o2
	std	%f2,	[%l7 + 0x48]
	bpos,a,pt	%xcc,	loop_1799
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g1,	0x138B,	%i2
	movre	%g2,	0x212,	%g6
loop_1799:
	ldsb	[%l7 + 0x20],	%o6
	edge8l	%i6,	%o4,	%l6
	stw	%l3,	[%l7 + 0x30]
	udiv	%g5,	0x03EA,	%o7
	fpackfix	%f26,	%f31
	bne,a	%xcc,	loop_1800
	bg,a,pn	%xcc,	loop_1801
	andncc	%o0,	%g7,	%i7
	edge8n	%i0,	%o5,	%o1
loop_1800:
	bne,a,pt	%xcc,	loop_1802
loop_1801:
	alignaddr	%i1,	%l1,	%i3
	movrne	%i4,	%l5,	%l2
	bpos,pn	%xcc,	loop_1803
loop_1802:
	tle	%icc,	0x2
	tn	%xcc,	0x0
	be,pn	%xcc,	loop_1804
loop_1803:
	movge	%xcc,	%g4,	%i5
	bl,a,pt	%xcc,	loop_1805
	fpsub32	%f12,	%f12,	%f16
loop_1804:
	sdivx	%l0,	0x195D,	%l4
	fmul8ulx16	%f26,	%f8,	%f26
loop_1805:
	fcmpgt32	%f16,	%f16,	%g3
	fnot2s	%f10,	%f16
	sdivcc	%o2,	0x1F60,	%g1
	mova	%xcc,	%i2,	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%o6
	fmovdge	%xcc,	%f30,	%f9
	udivx	%g2,	0x1D32,	%o4
	fba,a	%fcc3,	loop_1806
	fpmerge	%f6,	%f14,	%f22
	fmovdvc	%icc,	%f19,	%f16
	movne	%xcc,	%i6,	%l6
loop_1806:
	fmovdn	%xcc,	%f15,	%f26
	add	%l3,	0x0B6E,	%g5
	umul	%o0,	0x01B4,	%g7
	brnz	%i7,	loop_1807
	bge	loop_1808
	fbe	%fcc1,	loop_1809
	and	%i0,	%o7,	%o1
loop_1807:
	smul	%i1,	%o5,	%l1
loop_1808:
	movvs	%xcc,	%i4,	%l5
loop_1809:
	tpos	%icc,	0x7
	fmovrsgez	%l2,	%f17,	%f31
	fone	%f2
	mulscc	%i3,	0x0E2F,	%g4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xCBFFB961121B4B26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x52FA98B0D675EAD5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f24
	flush	%l7 + 0x28
	fmovsne	%icc,	%f5,	%f9
	fexpand	%f21,	%f10
	nop
	setx	loop_1810,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l4,	%g3,	%i5
	be,pn	%xcc,	loop_1811
	popc	0x1745,	%g1
loop_1810:
	popc	0x0311,	%o2
	movrlz	%o3,	0x2D1,	%i2
loop_1811:
	bgu,pt	%xcc,	loop_1812
	movle	%icc,	%o6,	%g2
	flush	%l7 + 0x6C
	ldd	[%l7 + 0x78],	%g6
loop_1812:
	membar	0x68
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x33] %asi,	%i6
	udivx	%o4,	0x176A,	%l6
	mulx	%l3,	%g5,	%g7
	or	%i7,	0x0F8D,	%i0
	xnor	%o7,	%o1,	%o0
	edge8	%o5,	%i1,	%l1
	stb	%l5,	[%l7 + 0x6A]
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x44] %asi,	%l2
	fpadd32s	%f19,	%f12,	%f19
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	tpos	%icc,	0x7
	tsubcc	%i4,	0x02A8,	%l0
	fbge,a	%fcc3,	loop_1813
	mova	%icc,	%l4,	%g4
	fnegd	%f8,	%f2
	movrne	%i5,	%g1,	%g3
loop_1813:
	edge16l	%o2,	%i2,	%o3
	movrne	%g2,	0x2C7,	%o6
	tl	%xcc,	0x0
	fsrc1s	%f23,	%f27
	tle	%xcc,	0x5
	andn	%i6,	0x1D15,	%g6
	fxnor	%f30,	%f28,	%f8
	ldx	[%l7 + 0x18],	%l6
	fmovsg	%icc,	%f29,	%f26
	tl	%icc,	0x1
	fnor	%f12,	%f2,	%f24
	fornot2s	%f24,	%f7,	%f4
	orn	%l3,	0x17FE,	%g5
	nop
	setx loop_1814, %l0, %l1
	jmpl %l1, %g7
	movne	%xcc,	%o4,	%i0
	fmovdpos	%xcc,	%f25,	%f16
	umul	%o7,	%i7,	%o0
loop_1814:
	fbuge,a	%fcc2,	loop_1815
	sra	%o5,	%o1,	%l1
	mova	%icc,	%l5,	%l2
	movre	%i3,	%i4,	%l0
loop_1815:
	movn	%xcc,	%l4,	%i1
	nop
	setx	loop_1816,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	lduh	[%l7 + 0x74],	%g4
	xorcc	%g1,	%i5,	%g3
	fpmerge	%f12,	%f13,	%f6
loop_1816:
	srl	%o2,	0x02,	%i2
	sdivcc	%g2,	0x1380,	%o6
	umulcc	%o3,	0x037A,	%g6
	fbg,a	%fcc0,	loop_1817
	fmovdvs	%icc,	%f1,	%f2
	nop
	set	0x58, %i0
	lduh	[%l7 + %i0],	%i6
	andcc	%l6,	%g5,	%l3
loop_1817:
	sub	%o4,	%g7,	%o7
	edge8ln	%i7,	%i0,	%o0
	array8	%o5,	%l1,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc1,	loop_1818
	edge16ln	%l2,	%i3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f4,	%f22
loop_1818:
	smul	%o1,	%l0,	%i1
	movleu	%xcc,	%l4,	%g4
	movn	%icc,	%i5,	%g1
	fabsd	%f24,	%f2
	pdist	%f20,	%f22,	%f16
	movle	%xcc,	%o2,	%i2
	movge	%icc,	%g2,	%g3
	membar	0x0F
	edge8l	%o6,	%o3,	%g6
	fmovrdlez	%l6,	%f2,	%f12
	ldsh	[%l7 + 0x08],	%g5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1f,	%f16
	movvc	%xcc,	%i6,	%g7
	udivx	%o4,	0x0A17,	%o7
	orn	%i7,	%o0,	%i0
	fmovdneg	%icc,	%f8,	%f18
	tsubcctv	%l1,	0x1968,	%o5
	fbule	%fcc3,	loop_1819
	fmovrdgz	%l2,	%f0,	%f14
	fmovsne	%xcc,	%f23,	%f12
	tle	%icc,	0x7
loop_1819:
	tg	%icc,	0x2
	edge32	%l5,	%i4,	%o1
	edge16	%l0,	%i1,	%i3
	srl	%l4,	0x1C,	%i5
	bl,a,pt	%icc,	loop_1820
	fmovrdgz	%g1,	%f6,	%f18
	subcc	%g4,	0x0D48,	%i2
	fcmpne16	%f6,	%f28,	%o2
loop_1820:
	subccc	%g2,	%o6,	%o3
	movrne	%g3,	0x270,	%l6
	sra	%g5,	%g6,	%i6
	set	0x78, %l5
	stba	%l3,	[%l7 + %l5] 0x2b
	membar	#Sync
	fmovdn	%icc,	%f26,	%f8
	fmovda	%icc,	%f7,	%f26
	fxor	%f18,	%f16,	%f4
	fnot2	%f12,	%f8
	orncc	%o4,	0x0950,	%g7
	srax	%o7,	0x11,	%i7
	xnorcc	%i0,	0x192E,	%o0
	movcc	%icc,	%o5,	%l2
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f30
	bcc,a,pn	%xcc,	loop_1821
	nop
	set	0x7C, %l0
	stw	%l1,	[%l7 + %l0]
	fmovsa	%icc,	%f27,	%f8
	std	%f10,	[%l7 + 0x30]
loop_1821:
	tn	%icc,	0x3
	nop
	setx loop_1822, %l0, %l1
	jmpl %l1, %i4
	fxnor	%f10,	%f26,	%f10
	fands	%f0,	%f16,	%f13
	edge8	%o1,	%l0,	%i1
loop_1822:
	sth	%l5,	[%l7 + 0x4E]
	srl	%i3,	0x0F,	%i5
	fpsub16s	%f8,	%f5,	%f4
	array32	%l4,	%g1,	%g4
	bgu,a	loop_1823
	fmovsneg	%icc,	%f13,	%f23
	sub	%o2,	0x031E,	%i2
	ldstub	[%l7 + 0x36],	%o6
loop_1823:
	addcc	%o3,	0x0648,	%g2
	st	%f20,	[%l7 + 0x6C]
	brz,a	%l6,	loop_1824
	addc	%g3,	0x0E92,	%g5
	fbg	%fcc3,	loop_1825
	fones	%f25
loop_1824:
	udivx	%i6,	0x1D85,	%l3
	movrlez	%g6,	0x27B,	%o4
loop_1825:
	ldub	[%l7 + 0x3F],	%o7
	srlx	%i7,	0x16,	%g7
	nop
	setx	0xF9653ABA57D9F73B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x41E5C1FCE082C0D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f10,	%f18
	fmovrsgez	%o0,	%f27,	%f1
	andncc	%o5,	%i0,	%l1
	sdivx	%l2,	0x04DA,	%o1
	tg	%icc,	0x5
	fpmerge	%f18,	%f19,	%f20
	membar	0x26
	edge8	%i4,	%i1,	%l0
	edge16	%l5,	%i3,	%l4
	movle	%xcc,	%g1,	%g4
	fmovrde	%o2,	%f12,	%f26
	be,a,pn	%icc,	loop_1826
	edge8l	%i2,	%o6,	%i5
	srlx	%g2,	%o3,	%g3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1826:
	nop
	setx loop_1827, %l0, %l1
	jmpl %l1, %l6
	fcmple32	%f22,	%f8,	%i6
	or	%l3,	%g6,	%g5
	bne,pn	%xcc,	loop_1828
loop_1827:
	fmovdge	%icc,	%f16,	%f28
	edge8	%o7,	%o4,	%i7
	fmovs	%f29,	%f26
loop_1828:
	movrgez	%g7,	%o5,	%i0
	ldub	[%l7 + 0x37],	%o0
	sth	%l2,	[%l7 + 0x7E]
	smulcc	%o1,	%i4,	%l1
	fbe	%fcc1,	loop_1829
	andncc	%i1,	%l0,	%l5
	edge32l	%l4,	%g1,	%i3
	ldd	[%l7 + 0x78],	%f2
loop_1829:
	fsrc2	%f10,	%f28
	movgu	%xcc,	%o2,	%g4
	nop
	fitos	%f1,	%f13
	fstox	%f13,	%f24
	fxtos	%f24,	%f23
	tn	%xcc,	0x7
	fble,a	%fcc3,	loop_1830
	edge8ln	%i2,	%i5,	%g2
	edge16ln	%o6,	%o3,	%l6
	fpadd32	%f26,	%f28,	%f18
loop_1830:
	umul	%g3,	%i6,	%g6
	srlx	%l3,	%o7,	%o4
	subc	%i7,	0x18F6,	%g5
	taddcc	%o5,	%i0,	%g7
	array32	%l2,	%o1,	%o0
	subc	%l1,	%i4,	%i1
	fmovdg	%xcc,	%f10,	%f16
	xnor	%l5,	%l4,	%l0
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f0
	sdiv	%g1,	0x0C87,	%i3
	wr	%g0,	0x2b,	%asi
	stba	%o2,	[%l7 + 0x7A] %asi
	membar	#Sync
	tl	%xcc,	0x4
	bge,a	%xcc,	loop_1831
	faligndata	%f6,	%f22,	%f6
	xnorcc	%i2,	%i5,	%g4
	srl	%g2,	%o3,	%l6
loop_1831:
	taddcctv	%g3,	0x1AA0,	%i6
	subccc	%o6,	%g6,	%l3
	movvs	%xcc,	%o4,	%i7
	fmovsg	%icc,	%f24,	%f18
	fbge,a	%fcc2,	loop_1832
	movge	%icc,	%o7,	%g5
	nop
	fitos	%f2,	%f21
	fstod	%f21,	%f24
	sllx	%i0,	%g7,	%o5
loop_1832:
	stbar
	tn	%xcc,	0x3
	movl	%xcc,	%o1,	%o0
	bcc	loop_1833
	umulcc	%l1,	%i4,	%i1
	sdiv	%l2,	0x096E,	%l5
	umul	%l4,	%g1,	%l0
loop_1833:
	tg	%xcc,	0x6
	nop
	setx	0x7E34B95E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x123CD711,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f30,	%f26
	wr	%g0,	0xeb,	%asi
	stha	%i3,	[%l7 + 0x10] %asi
	membar	#Sync
	ldd	[%l7 + 0x18],	%f0
	fpadd16	%f12,	%f2,	%f12
	alignaddrl	%i2,	%i5,	%g4
	movl	%icc,	%o2,	%g2
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x04,	%l6
	tvs	%xcc,	0x5
	movl	%xcc,	%g3,	%i6
	xnor	%o3,	0x0478,	%o6
	fbn,a	%fcc1,	loop_1834
	tleu	%xcc,	0x4
	movcc	%icc,	%l3,	%g6
	and	%o4,	0x1613,	%i7
loop_1834:
	xor	%g5,	%i0,	%g7
	bgu,pn	%xcc,	loop_1835
	nop
	setx	0x07D6B85A20663E52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%o5
	array8	%o7,	%o0,	%o1
loop_1835:
	andncc	%l1,	%i4,	%l2
	subcc	%i1,	%l4,	%g1
	srl	%l5,	%i3,	%l0
	edge8n	%i2,	%i5,	%o2
	edge16	%g2,	%l6,	%g4
	sdivcc	%i6,	0x0FB7,	%g3
	array16	%o3,	%l3,	%g6
	movvc	%xcc,	%o6,	%i7
	edge16ln	%o4,	%i0,	%g5
	srax	%g7,	%o7,	%o0
	stx	%o5,	[%l7 + 0x78]
	fcmpeq16	%f4,	%f22,	%o1
	fcmpgt16	%f20,	%f14,	%i4
	fcmpgt32	%f18,	%f0,	%l1
	nop
	fitod	%f2,	%f6
	fdtos	%f6,	%f19
	fbuge	%fcc0,	loop_1836
	alignaddr	%i1,	%l2,	%l4
	srax	%g1,	%i3,	%l5
	fmul8x16	%f1,	%f30,	%f4
loop_1836:
	fabsd	%f10,	%f16
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x6C] %asi,	%i2
	bpos,a,pn	%icc,	loop_1837
	tcs	%icc,	0x2
	te	%xcc,	0x6
	bvc	%xcc,	loop_1838
loop_1837:
	movvs	%xcc,	%l0,	%o2
	fcmpgt16	%f2,	%f16,	%g2
	ldsb	[%l7 + 0x5C],	%i5
loop_1838:
	fmul8ulx16	%f2,	%f4,	%f16
	tsubcctv	%l6,	%g4,	%g3
	edge16n	%i6,	%o3,	%g6
	edge32l	%o6,	%l3,	%o4
	tg	%icc,	0x6
	fba,a	%fcc2,	loop_1839
	movpos	%icc,	%i7,	%i0
	subcc	%g5,	%o7,	%o0
	brgez,a	%o5,	loop_1840
loop_1839:
	tne	%xcc,	0x0
	udivcc	%g7,	0x10A7,	%i4
	xnor	%o1,	0x037E,	%l1
loop_1840:
	nop
	set	0x14, %g3
	swapa	[%l7 + %g3] 0x80,	%i1
	edge32n	%l2,	%l4,	%g1
	fzero	%f24
	subcc	%i3,	0x07C5,	%i2
	nop
	fitod	%f12,	%f10
	alignaddr	%l5,	%l0,	%g2
	subccc	%o2,	0x03C0,	%i5
	fbuge	%fcc1,	loop_1841
	ldsb	[%l7 + 0x19],	%l6
	movn	%xcc,	%g3,	%g4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%g6
loop_1841:
	fcmpeq16	%f4,	%f28,	%o6
	edge8n	%o3,	%o4,	%l3
	movrlez	%i7,	%i0,	%o7
	fmovsne	%icc,	%f5,	%f16
	umulcc	%g5,	%o5,	%g7
	sdivcc	%o0,	0x18D7,	%i4
	subccc	%o1,	0x1D95,	%l1
	tg	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a	%xcc,	loop_1842
	fsrc2s	%f5,	%f11
	sdiv	%i1,	0x0F79,	%l4
	fmovsle	%icc,	%f29,	%f17
loop_1842:
	srax	%g1,	0x1F,	%l2
	movleu	%xcc,	%i3,	%i2
	tneg	%xcc,	0x3
	nop
	setx	loop_1843,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack16	%f10,	%f20
	bgu,pt	%xcc,	loop_1844
	nop
	set	0x11, %g6
	stb	%l5,	[%l7 + %g6]
loop_1843:
	array8	%g2,	%o2,	%l0
	movre	%i5,	%g3,	%l6
loop_1844:
	array8	%g4,	%i6,	%g6
	orn	%o6,	0x1EE2,	%o3
	tge	%xcc,	0x3
	addc	%o4,	%l3,	%i7
	ldsw	[%l7 + 0x30],	%o7
	fmovrsgz	%i0,	%f6,	%f8
	taddcctv	%o5,	%g7,	%g5
	tcc	%icc,	0x2
	tsubcctv	%i4,	0x08B7,	%o1
	fand	%f24,	%f30,	%f0
	mulx	%l1,	0x0D20,	%i1
	fmovsvs	%icc,	%f12,	%f2
	tvs	%icc,	0x5
	mulscc	%o0,	0x179C,	%g1
	edge32ln	%l4,	%i3,	%l2
	xnorcc	%i2,	0x0EC9,	%l5
	movge	%xcc,	%g2,	%o2
	addccc	%l0,	0x0D18,	%g3
	umul	%l6,	%g4,	%i6
	te	%xcc,	0x3
	movre	%i5,	%g6,	%o3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x28] %asi,	%f27
	stbar
	subc	%o6,	0x1513,	%l3
	movrlz	%i7,	%o4,	%o7
	sethi	0x0133,	%o5
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%g7
	call	loop_1845
	movrgez	%g5,	0x147,	%i0
	fbge	%fcc2,	loop_1846
	lduh	[%l7 + 0x4A],	%i4
loop_1845:
	udivcc	%l1,	0x1C53,	%o1
	fba,a	%fcc1,	loop_1847
loop_1846:
	movg	%xcc,	%i1,	%o0
	sir	0x10A5
	sdivx	%g1,	0x1EDF,	%l4
loop_1847:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	fitos	%f14,	%f30
	fstoi	%f30,	%f31
	edge32n	%i3,	%l2,	%i2
	ldsw	[%l7 + 0x28],	%l5
	movleu	%icc,	%g2,	%o2
	brz	%g3,	loop_1848
	fmovrse	%l6,	%f8,	%f4
	tcs	%icc,	0x7
	nop
	fitos	%f4,	%f2
	fstox	%f2,	%f14
loop_1848:
	tsubcc	%l0,	%g4,	%i5
	sth	%i6,	[%l7 + 0x20]
	fbu	%fcc2,	loop_1849
	movn	%icc,	%g6,	%o3
	movrne	%o6,	0x134,	%l3
	lduh	[%l7 + 0x58],	%i7
loop_1849:
	bge	loop_1850
	xor	%o4,	%o5,	%o7
	andcc	%g7,	0x0E33,	%g5
	tne	%icc,	0x6
loop_1850:
	sethi	0x10D6,	%i0
	taddcctv	%l1,	%i4,	%o1
	te	%icc,	0x5
	movg	%icc,	%o0,	%i1
	fbug,a	%fcc3,	loop_1851
	tneg	%xcc,	0x7
	fornot1	%f30,	%f10,	%f18
	flush	%l7 + 0x4C
loop_1851:
	fnors	%f26,	%f4,	%f12
	fmovrse	%l4,	%f7,	%f4
	fmovscc	%xcc,	%f5,	%f21
	ldd	[%l7 + 0x10],	%g0
	sth	%i3,	[%l7 + 0x50]
	udiv	%i2,	0x09E5,	%l2
	alignaddr	%l5,	%g2,	%g3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%o2
	movleu	%xcc,	%l6,	%l0
	orn	%g4,	0x1E45,	%i5
	fbue,a	%fcc2,	loop_1852
	fble	%fcc3,	loop_1853
	fbu	%fcc1,	loop_1854
	tn	%xcc,	0x7
loop_1852:
	movrlez	%i6,	0x158,	%g6
loop_1853:
	xnorcc	%o6,	0x1C5E,	%l3
loop_1854:
	edge16l	%i7,	%o4,	%o5
	umul	%o7,	%g7,	%g5
	set	0x44, %g2
	stha	%o3,	[%l7 + %g2] 0x22
	membar	#Sync
	fornot2s	%f30,	%f13,	%f29
	bcc,a,pt	%icc,	loop_1855
	fnegs	%f21,	%f20
	fmovsg	%xcc,	%f21,	%f14
	sdivcc	%i0,	0x164B,	%i4
loop_1855:
	fcmple32	%f6,	%f22,	%l1
	swap	[%l7 + 0x38],	%o1
	set	0x62, %l3
	stba	%o0,	[%l7 + %l3] 0x11
	fmovscs	%xcc,	%f0,	%f18
	or	%l4,	%g1,	%i3
	movleu	%xcc,	%i1,	%i2
	movneg	%xcc,	%l5,	%l2
	taddcc	%g2,	%g3,	%l6
	movpos	%xcc,	%l0,	%o2
	nop
	set	0x34, %l6
	lduw	[%l7 + %l6],	%g4
	tne	%xcc,	0x0
	srlx	%i5,	0x13,	%i6
	edge16n	%g6,	%l3,	%i7
	fpack16	%f8,	%f7
	ldsb	[%l7 + 0x0D],	%o6
	fbge	%fcc3,	loop_1856
	faligndata	%f2,	%f24,	%f6
	edge32	%o4,	%o7,	%o5
	subc	%g5,	0x1BDA,	%g7
loop_1856:
	movgu	%xcc,	%i0,	%i4
	set	0x15, %o2
	stba	%o3,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	setx	0xA4E46D83E030B5C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f22
	orncc	%o1,	%o0,	%l1
	mulx	%l4,	0x0BC4,	%i3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%i1
	tn	%icc,	0x5
	fbo,a	%fcc1,	loop_1857
	sth	%l5,	[%l7 + 0x1C]
	fxnors	%f1,	%f21,	%f25
	edge32n	%l2,	%i2,	%g3
loop_1857:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g2,	0x07E1,	%l0
	stw	%l6,	[%l7 + 0x7C]
	edge16n	%g4,	%i5,	%o2
	xnorcc	%g6,	0x0814,	%i6
	xnor	%l3,	%i7,	%o6
	movrlez	%o7,	0x1AA,	%o5
	lduh	[%l7 + 0x46],	%g5
	movn	%xcc,	%o4,	%i0
	ldub	[%l7 + 0x7D],	%g7
	fbue,a	%fcc2,	loop_1858
	movneg	%icc,	%i4,	%o1
	move	%icc,	%o3,	%o0
	array16	%l1,	%l4,	%g1
loop_1858:
	edge32l	%i3,	%l5,	%i1
	mulx	%l2,	%i2,	%g2
	xnorcc	%l0,	%l6,	%g3
	srlx	%i5,	0x15,	%g4
	tle	%icc,	0x6
	lduh	[%l7 + 0x12],	%o2
	or	%g6,	0x1FFB,	%i6
	brlz	%l3,	loop_1859
	ba,a	%icc,	loop_1860
	fnor	%f30,	%f8,	%f12
	tle	%xcc,	0x7
loop_1859:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1860:
	smulcc	%o6,	%i7,	%o5
	movrlz	%g5,	%o4,	%i0
	mulx	%o7,	0x1D2D,	%i4
	sdivx	%o1,	0x0806,	%o3
	movcs	%xcc,	%g7,	%l1
	fsrc2	%f6,	%f20
	fmovrdgez	%o0,	%f10,	%f22
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l4
	for	%f26,	%f16,	%f6
	movrlz	%g1,	%i3,	%l5
	fxors	%f24,	%f16,	%f6
	ta	%xcc,	0x0
	umul	%i1,	0x0F3B,	%i2
	edge16l	%l2,	%l0,	%g2
	tcc	%xcc,	0x2
	subc	%g3,	%i5,	%g4
	tgu	%icc,	0x7
	nop
	setx	loop_1861,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f1,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f11
	fbne,a	%fcc0,	loop_1862
	tsubcctv	%o2,	0x1290,	%g6
loop_1861:
	mulscc	%l6,	%i6,	%o6
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
loop_1862:
	movn	%xcc,	%o5,	%l3
	fmovsne	%xcc,	%f24,	%f29
	movgu	%xcc,	%o4,	%i0
	ldsb	[%l7 + 0x1C],	%o7
	movge	%icc,	%g5,	%i4
	srl	%o1,	0x06,	%g7
	nop
	setx	0x41BCD1A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x483526B4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f25,	%f13
	te	%icc,	0x6
	fmovrdne	%l1,	%f16,	%f16
	mulx	%o0,	0x1ADA,	%l4
	tgu	%xcc,	0x0
	or	%g1,	%o3,	%i3
	bvs,a	loop_1863
	taddcc	%l5,	%i1,	%l2
	movrgez	%l0,	%i2,	%g2
	fmovrslz	%i5,	%f12,	%f14
loop_1863:
	fbu,a	%fcc0,	loop_1864
	movneg	%icc,	%g4,	%g3
	movrlez	%o2,	0x192,	%g6
	fmovdcc	%xcc,	%f17,	%f2
loop_1864:
	swap	[%l7 + 0x3C],	%i6
	bcc,a	loop_1865
	movrne	%o6,	0x22A,	%i7
	taddcc	%o5,	0x1A75,	%l3
	sra	%l6,	0x11,	%i0
loop_1865:
	nop
	setx	loop_1866,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%o7,	0x231,	%g5
	orn	%o4,	%i4,	%o1
	orcc	%l1,	%o0,	%g7
loop_1866:
	popc	%g1,	%l4
	sra	%o3,	%l5,	%i1
	udivcc	%l2,	0x0126,	%i3
	edge32ln	%l0,	%i2,	%i5
	tgu	%xcc,	0x5
	set	0x48, %o4
	stwa	%g4,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	fitod	%f2,	%f24
	fnand	%f14,	%f20,	%f12
	fxnors	%f5,	%f27,	%f26
	bcs	loop_1867
	movgu	%xcc,	%g3,	%g2
	sdivcc	%o2,	0x1571,	%g6
	sra	%i6,	%o6,	%i7
loop_1867:
	movvs	%icc,	%o5,	%l3
	ldx	[%l7 + 0x20],	%l6
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x2C] %asi
	orn	%i0,	0x0642,	%o7
	smulcc	%o4,	%i4,	%o1
	fbuge	%fcc0,	loop_1868
	stb	%g5,	[%l7 + 0x42]
	ldstub	[%l7 + 0x7F],	%l1
	fmovsa	%icc,	%f0,	%f24
loop_1868:
	nop
	fitos	%f4,	%f9
	fstod	%f9,	%f22
	fandnot2	%f24,	%f4,	%f30
	movrne	%g7,	0x0FE,	%o0
	movle	%icc,	%l4,	%g1
	ldd	[%l7 + 0x70],	%l4
	andn	%o3,	0x0506,	%l2
	movgu	%icc,	%i3,	%i1
	movge	%xcc,	%i2,	%i5
	ba,a	%icc,	loop_1869
	sdiv	%g4,	0x0CE8,	%l0
	movneg	%icc,	%g2,	%g3
	alignaddrl	%o2,	%g6,	%o6
loop_1869:
	alignaddr	%i7,	%i6,	%l3
	movre	%l6,	%o5,	%o7
	edge8ln	%o4,	%i4,	%i0
	fmovrsgz	%o1,	%f2,	%f23
	fbe	%fcc0,	loop_1870
	movle	%xcc,	%g5,	%g7
	smul	%l1,	%l4,	%g1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%l5
loop_1870:
	ldsb	[%l7 + 0x30],	%l2
	mova	%xcc,	%o3,	%i1
	fbu,a	%fcc3,	loop_1871
	sdivcc	%i2,	0x13CC,	%i3
	fmovdn	%xcc,	%f10,	%f28
	alignaddr	%i5,	%g4,	%g2
loop_1871:
	edge32ln	%l0,	%g3,	%g6
	fmovrse	%o6,	%f8,	%f2
	movleu	%xcc,	%i7,	%o2
	brz,a	%i6,	loop_1872
	fbuge	%fcc0,	loop_1873
	fcmpgt16	%f26,	%f2,	%l3
	fabss	%f15,	%f11
loop_1872:
	andncc	%l6,	%o5,	%o7
loop_1873:
	tleu	%icc,	0x4
	edge8	%i4,	%i0,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x30, %i4
	lduwa	[%l7 + %i4] 0x14,	%o1
	sub	%g7,	%l1,	%g5
	movrne	%g1,	0x0D8,	%l4
	fbg	%fcc0,	loop_1874
	add	%l5,	%o0,	%o3
	stx	%i1,	[%l7 + 0x68]
	fpack16	%f28,	%f9
loop_1874:
	mulscc	%i2,	%i3,	%i5
	fble,a	%fcc1,	loop_1875
	movrlz	%g4,	%g2,	%l0
	tl	%icc,	0x0
	fba,a	%fcc3,	loop_1876
loop_1875:
	sir	0x1D24
	srax	%l2,	%g3,	%o6
	fcmpeq32	%f28,	%f0,	%g6
loop_1876:
	fmovsn	%icc,	%f23,	%f9
	srax	%i7,	0x0F,	%o2
	fbg,a	%fcc3,	loop_1877
	nop
	setx	0x7D39FAA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xD493FDDE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f9,	%f18
	xor	%l3,	%i6,	%l6
	prefetch	[%l7 + 0x48],	 0x1
loop_1877:
	addcc	%o7,	%i4,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o5,	%o1
	movl	%icc,	%g7,	%o4
	tgu	%icc,	0x4
	movvc	%icc,	%g5,	%l1
	udivx	%g1,	0x0A54,	%l4
	movrgez	%l5,	%o0,	%i1
	fornot2s	%f26,	%f9,	%f9
	movvs	%icc,	%o3,	%i2
	bn,a,pn	%icc,	loop_1878
	tl	%icc,	0x4
	fbu	%fcc0,	loop_1879
	ldd	[%l7 + 0x70],	%f4
loop_1878:
	tvc	%xcc,	0x6
	tle	%icc,	0x2
loop_1879:
	edge32	%i5,	%i3,	%g4
	fbl	%fcc0,	loop_1880
	xnorcc	%g2,	0x0873,	%l0
	alignaddrl	%l2,	%o6,	%g6
	move	%icc,	%g3,	%o2
loop_1880:
	stx	%l3,	[%l7 + 0x78]
	ldsw	[%l7 + 0x14],	%i6
	fmovd	%f18,	%f26
	prefetch	[%l7 + 0x50],	 0x1
	edge16ln	%l6,	%i7,	%o7
	movrne	%i4,	%o5,	%i0
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f16
	fsrc1s	%f0,	%f16
	nop
	setx	0xC6A5611C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f21
	bg,a	loop_1881
	tl	%icc,	0x4
	subc	%o1,	0x1400,	%g7
	movcs	%icc,	%g5,	%l1
loop_1881:
	sll	%o4,	0x1C,	%l4
	fmuld8sux16	%f19,	%f26,	%f26
	membar	0x4B
	bcc,a,pn	%icc,	loop_1882
	ta	%icc,	0x4
	membar	0x7A
	nop
	set	0x78, %i3
	stw	%g1,	[%l7 + %i3]
loop_1882:
	tneg	%xcc,	0x0
	udivcc	%l5,	0x0D7A,	%o0
	andncc	%i1,	%o3,	%i5
	set	0x08, %o0
	stha	%i3,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x0A, %o5
	stba	%i2,	[%l7 + %o5] 0x04
	edge16n	%g2,	%g4,	%l2
	tpos	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%o6
	add	%l0,	%g6,	%g3
	bshuffle	%f26,	%f2,	%f18
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x88,	%o2
	fmovsg	%xcc,	%f24,	%f14
	tsubcctv	%i6,	%l6,	%l3
	fbue	%fcc2,	loop_1883
	srax	%o7,	0x04,	%i7
	fcmpgt32	%f30,	%f6,	%o5
	edge32ln	%i4,	%o1,	%i0
loop_1883:
	nop
	set	0x1E, %g4
	ldsba	[%l7 + %g4] 0x18,	%g7
	edge32l	%l1,	%o4,	%g5
	edge32	%l4,	%g1,	%l5
	edge16	%o0,	%i1,	%i5
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x19,	%o3
	tcc	%xcc,	0x3
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f14
	movcs	%xcc,	%i2,	%i3
	andcc	%g4,	%l2,	%o6
	fbu	%fcc0,	loop_1884
	taddcctv	%l0,	%g2,	%g3
	alignaddr	%g6,	%o2,	%l6
	edge16	%i6,	%o7,	%i7
loop_1884:
	andn	%o5,	%l3,	%i4
	movne	%xcc,	%o1,	%g7
	tcs	%icc,	0x1
	fexpand	%f6,	%f4
	array32	%i0,	%l1,	%g5
	edge32	%l4,	%o4,	%g1
	ble	%xcc,	loop_1885
	edge16ln	%o0,	%i1,	%l5
	bcs,pt	%icc,	loop_1886
	tl	%icc,	0x1
loop_1885:
	fblg,a	%fcc1,	loop_1887
	nop
	setx	0x6A69BF18B05D9394,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x99BC0B1C25506EDF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f10,	%f28
loop_1886:
	movge	%icc,	%o3,	%i2
	fbu,a	%fcc2,	loop_1888
loop_1887:
	tgu	%icc,	0x0
	mulscc	%i3,	0x1F52,	%i5
	ldsh	[%l7 + 0x54],	%g4
loop_1888:
	movcc	%icc,	%o6,	%l0
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x21] %asi,	%g2
	te	%icc,	0x3
	sllx	%l2,	0x02,	%g3
	fmul8x16	%f9,	%f16,	%f10
	set	0x6E, %g1
	ldsha	[%l7 + %g1] 0x18,	%g6
	or	%o2,	%l6,	%o7
	ldsh	[%l7 + 0x4A],	%i7
	bneg,a	loop_1889
	swap	[%l7 + 0x4C],	%i6
	srlx	%l3,	%o5,	%o1
	and	%g7,	%i0,	%i4
loop_1889:
	movrlez	%l1,	0x0C6,	%l4
	srl	%g5,	0x18,	%o4
	wr	%g0,	0x21,	%asi
	stxa	%o0,	[%g0 + 0x108] %asi
	tleu	%xcc,	0x5
	edge16ln	%g1,	%l5,	%i1
	movcc	%xcc,	%i2,	%i3
	fblg,a	%fcc1,	loop_1890
	bn	%icc,	loop_1891
	bleu,a,pn	%xcc,	loop_1892
	fxnor	%f22,	%f20,	%f0
loop_1890:
	sub	%i5,	%g4,	%o3
loop_1891:
	movrlez	%o6,	%l0,	%g2
loop_1892:
	udiv	%l2,	0x02E9,	%g3
	mulscc	%o2,	%g6,	%o7
	fmul8x16	%f30,	%f12,	%f2
	subccc	%i7,	%i6,	%l3
	fandnot1	%f18,	%f4,	%f24
	tg	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x6
	mova	%icc,	%o5,	%o1
	movg	%icc,	%g7,	%l6
	tge	%xcc,	0x7
	stx	%i0,	[%l7 + 0x30]
	nop
	fitos	%f3,	%f3
	fstod	%f3,	%f24
	movleu	%xcc,	%l1,	%l4
	brgez,a	%i4,	loop_1893
	swap	[%l7 + 0x2C],	%g5
	tge	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1893:
	sdivx	%o4,	0x0258,	%o0
	movrlz	%l5,	%g1,	%i2
	edge16	%i1,	%i3,	%i5
	mulx	%o3,	0x0613,	%o6
	array16	%g4,	%l0,	%g2
	fexpand	%f28,	%f12
	sdivcc	%l2,	0x1975,	%g3
	tcs	%icc,	0x3
	or	%g6,	0x1E82,	%o7
	movl	%xcc,	%o2,	%i7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x34] %asi,	%f22
	fpadd32	%f26,	%f24,	%f18
	brgez	%l3,	loop_1894
	sub	%i6,	%o5,	%o1
	movleu	%icc,	%g7,	%i0
	fmul8sux16	%f18,	%f30,	%f16
loop_1894:
	edge8	%l1,	%l4,	%i4
	mova	%xcc,	%g5,	%l6
	tn	%icc,	0x1
	fors	%f6,	%f19,	%f27
	add	%o0,	0x1918,	%l5
	nop
	setx	0x383439FEC7E14862,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA84AB047012BDED1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f14,	%f2
	movcc	%icc,	%o4,	%g1
	movcs	%xcc,	%i2,	%i1
	wr	%g0,	0x80,	%asi
	sta	%f20,	[%l7 + 0x60] %asi
	umulcc	%i5,	0x0CCE,	%i3
	fpackfix	%f14,	%f10
	flush	%l7 + 0x38
	fmovdle	%xcc,	%f11,	%f19
	srl	%o6,	0x19,	%o3
	fcmple16	%f10,	%f30,	%g4
	movcc	%icc,	%l0,	%g2
	fnands	%f10,	%f3,	%f12
	array16	%g3,	%l2,	%o7
	movvs	%xcc,	%o2,	%i7
	brz	%g6,	loop_1895
	movne	%xcc,	%l3,	%i6
	xorcc	%o5,	0x03CE,	%g7
	movcs	%xcc,	%o1,	%i0
loop_1895:
	fones	%f25
	edge8	%l1,	%l4,	%i4
	set	0x7E, %i1
	stha	%g5,	[%l7 + %i1] 0xeb
	membar	#Sync
	sdivcc	%o0,	0x1691,	%l5
	movvc	%icc,	%l6,	%o4
	membar	0x75
	nop
	setx	0x0D0F23B2606F5D55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	sllx	%i2,	%g1,	%i5
	fandnot2s	%f7,	%f9,	%f3
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	fmovdn	%xcc,	%f28,	%f3
	movneg	%icc,	%i3,	%o3
	orn	%o6,	0x11BC,	%g4
	nop
	setx	0x349E2509,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x94198B97,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f25,	%f16
	edge8l	%l0,	%g2,	%g3
	movle	%xcc,	%o7,	%l2
	sdiv	%i7,	0x0913,	%o2
	stw	%l3,	[%l7 + 0x7C]
	movvs	%xcc,	%i6,	%o5
	movrlz	%g7,	0x21B,	%o1
	tg	%icc,	0x2
	movle	%icc,	%g6,	%l1
	ldx	[%l7 + 0x20],	%i0
	nop
	fitos	%f13,	%f6
	fstox	%f6,	%f8
	movrne	%i4,	0x040,	%g5
	bpos,a	%xcc,	loop_1896
	fble	%fcc3,	loop_1897
	st	%f30,	[%l7 + 0x0C]
	tge	%icc,	0x1
loop_1896:
	sll	%o0,	0x0B,	%l5
loop_1897:
	xor	%l6,	0x04E5,	%l4
	edge32	%o4,	%g1,	%i2
	smulcc	%i1,	0x011B,	%i5
	and	%o3,	0x0249,	%i3
	orcc	%o6,	%l0,	%g4
	subccc	%g3,	%g2,	%o7
	fcmpne32	%f24,	%f8,	%i7
	sir	0x0AB0
	movne	%xcc,	%l2,	%o2
	nop
	setx	0xFFC83E45,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x88413C45,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f16,	%f12
	array8	%i6,	%l3,	%g7
	srax	%o5,	0x1D,	%o1
	fblg	%fcc0,	loop_1898
	tvs	%xcc,	0x5
	subcc	%l1,	0x1386,	%i0
	fmovrsne	%i4,	%f28,	%f0
loop_1898:
	umul	%g6,	0x1066,	%o0
	fpack16	%f28,	%f21
	set	0x12, %g5
	stba	%l5,	[%l7 + %g5] 0xea
	membar	#Sync
	movrne	%l6,	%l4,	%g5
	srax	%g1,	%o4,	%i1
	tvs	%xcc,	0x4
	set	0x50, %i7
	sta	%f15,	[%l7 + %i7] 0x11
	popc	%i5,	%o3
	subcc	%i2,	0x0123,	%o6
	bge,a,pt	%xcc,	loop_1899
	fmul8x16au	%f29,	%f1,	%f14
	fnor	%f20,	%f28,	%f26
	pdist	%f6,	%f16,	%f10
loop_1899:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%l0,	[%l7 + 0x16] %asi
	membar	#Sync
	tgu	%icc,	0x5
	tneg	%icc,	0x6
	sdiv	%g4,	0x1DAA,	%i3
	fpadd16s	%f7,	%f6,	%f0
	fcmpne32	%f12,	%f2,	%g3
	fcmple16	%f20,	%f8,	%o7
	sra	%i7,	%g2,	%o2
	sethi	0x0A23,	%l2
	tleu	%icc,	0x5
	taddcctv	%i6,	%l3,	%g7
	set	0x28, %l4
	swapa	[%l7 + %l4] 0x80,	%o1
	fmovsvc	%icc,	%f17,	%f1
	movneg	%xcc,	%l1,	%o5
	edge32ln	%i0,	%i4,	%g6
	st	%f4,	[%l7 + 0x24]
	ldd	[%l7 + 0x38],	%f20
	array8	%o0,	%l5,	%l6
	array32	%l4,	%g5,	%o4
	srlx	%i1,	0x03,	%i5
	fone	%f28
	ldd	[%l7 + 0x70],	%f12
	edge8n	%o3,	%g1,	%i2
	fnot1	%f20,	%f18
	xorcc	%l0,	0x1A1A,	%g4
	tcs	%icc,	0x3
	brgez,a	%o6,	loop_1900
	edge32ln	%i3,	%g3,	%o7
	movre	%g2,	%o2,	%l2
	movne	%icc,	%i6,	%i7
loop_1900:
	fnand	%f18,	%f0,	%f8
	tge	%xcc,	0x7
	addcc	%g7,	0x0CE0,	%o1
	movn	%xcc,	%l3,	%l1
	xnor	%o5,	0x1DB3,	%i0
	fcmpgt32	%f18,	%f26,	%i4
	bcs	%icc,	loop_1901
	be,a,pn	%icc,	loop_1902
	sll	%g6,	%o0,	%l5
	subcc	%l4,	%g5,	%l6
loop_1901:
	udivx	%o4,	0x1EA1,	%i5
loop_1902:
	membar	0x00
	array16	%o3,	%g1,	%i2
	ldsw	[%l7 + 0x40],	%i1
	tsubcctv	%l0,	%o6,	%i3
	taddcctv	%g3,	0x1DCA,	%g4
	fmovsleu	%icc,	%f15,	%f18
	nop
	fitos	%f6,	%f28
	fstox	%f28,	%f6
	sllx	%g2,	0x08,	%o2
	edge8l	%o7,	%l2,	%i7
	sub	%g7,	0x1D35,	%o1
	ble,a	loop_1903
	movn	%icc,	%l3,	%l1
	edge32	%i6,	%o5,	%i4
	movg	%icc,	%i0,	%g6
loop_1903:
	fpsub16s	%f7,	%f10,	%f2
	subc	%o0,	%l4,	%g5
	tpos	%xcc,	0x5
	stx	%l6,	[%l7 + 0x50]
	add	%l5,	%o4,	%o3
	xnorcc	%g1,	%i2,	%i1
	fble,a	%fcc1,	loop_1904
	nop
	setx	0x07D05354C05296D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	prefetch	[%l7 + 0x60],	 0x3
	fcmpne16	%f22,	%f14,	%l0
loop_1904:
	fbo,a	%fcc2,	loop_1905
	bgu,pn	%icc,	loop_1906
	edge8	%o6,	%i5,	%i3
	ta	%xcc,	0x6
loop_1905:
	fmovsn	%icc,	%f17,	%f29
loop_1906:
	tl	%xcc,	0x3
	tn	%xcc,	0x0
	tne	%xcc,	0x2
	srl	%g4,	0x04,	%g3
	set	0x20, %o6
	swapa	[%l7 + %o6] 0x80,	%g2
	movge	%icc,	%o7,	%o2
	fmovrdlez	%l2,	%f20,	%f4
	movgu	%icc,	%g7,	%o1
	bleu,a,pt	%icc,	loop_1907
	std	%f22,	[%l7 + 0x20]
	xor	%l3,	%i7,	%i6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x08] %asi,	%f24
loop_1907:
	alignaddr	%l1,	%i4,	%i0
	nop
	setx	0xBD3F15C4F05A35DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	lduw	[%l7 + 0x38],	%o5
	alignaddrl	%o0,	%l4,	%g5
	fbug	%fcc2,	loop_1908
	xorcc	%l6,	0x0031,	%l5
	std	%f30,	[%l7 + 0x48]
	fmovsleu	%xcc,	%f23,	%f5
loop_1908:
	fnands	%f0,	%f30,	%f7
	edge32l	%g6,	%o3,	%o4
	xnor	%g1,	%i2,	%i1
	tneg	%xcc,	0x6
	nop
	setx	0xA06AF554,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	bgu,a,pt	%xcc,	loop_1909
	edge32n	%o6,	%i5,	%i3
	umul	%g4,	0x126E,	%l0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x60] %asi,	%f19
loop_1909:
	fmovdpos	%xcc,	%f15,	%f14
	mulx	%g2,	%g3,	%o2
	fmovsvs	%icc,	%f1,	%f1
	or	%o7,	%g7,	%l2
	fbuge,a	%fcc0,	loop_1910
	nop
	set	0x78, %i5
	ldsh	[%l7 + %i5],	%o1
	addcc	%i7,	%l3,	%l1
	sll	%i4,	0x0A,	%i0
loop_1910:
	srl	%i6,	0x0D,	%o0
	fmovdge	%xcc,	%f29,	%f17
	movrgz	%l4,	0x160,	%o5
	tsubcctv	%g5,	%l5,	%g6
	fmovdneg	%xcc,	%f30,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o3,	%o4,	%l6
	fmovsl	%xcc,	%f8,	%f3
	fzeros	%f22
	fmuld8ulx16	%f22,	%f1,	%f2
	tsubcc	%g1,	%i1,	%i2
	set	0x50, %o7
	lduba	[%l7 + %o7] 0x88,	%o6
	edge16l	%i3,	%i5,	%l0
	tleu	%xcc,	0x6
	mova	%icc,	%g2,	%g3
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o2
	tcs	%icc,	0x1
	umul	%o7,	%g4,	%g7
	membar	0x2E
	bl,pt	%icc,	loop_1911
	tn	%icc,	0x4
	movleu	%icc,	%l2,	%i7
	movle	%xcc,	%l3,	%o1
loop_1911:
	nop
	setx	0x80579857,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	te	%icc,	0x2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x11] %asi,	%l1
	nop
	setx	0x8C3A3E66A0657C43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	subcc	%i4,	%i6,	%o0
	bl	%icc,	loop_1912
	fbe	%fcc2,	loop_1913
	bneg	loop_1914
	tsubcctv	%l4,	%o5,	%i0
loop_1912:
	srax	%l5,	0x19,	%g5
loop_1913:
	fmovrde	%o3,	%f12,	%f26
loop_1914:
	fmovdn	%icc,	%f7,	%f26
	orcc	%g6,	0x0144,	%l6
	ta	%xcc,	0x5
	stw	%g1,	[%l7 + 0x38]
	srlx	%o4,	%i1,	%o6
	udiv	%i2,	0x16FB,	%i5
	edge32n	%i3,	%l0,	%g2
	xnor	%g3,	0x039E,	%o7
	movpos	%xcc,	%g4,	%g7
	orn	%o2,	%i7,	%l2
	movne	%icc,	%o1,	%l1
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x68] %asi,	%f21
	subc	%l3,	0x0093,	%i6
	movvs	%icc,	%o0,	%i4
	xnorcc	%o5,	%i0,	%l5
	srlx	%l4,	0x0B,	%g5
	tvs	%xcc,	0x5
	orcc	%o3,	0x1435,	%l6
	stw	%g1,	[%l7 + 0x08]
	tl	%xcc,	0x6
	sdiv	%o4,	0x0FD1,	%g6
	movleu	%xcc,	%i1,	%i2
	edge32	%o6,	%i3,	%l0
	add	%i5,	0x0C0D,	%g3
	edge32l	%g2,	%o7,	%g4
	fmovdne	%xcc,	%f7,	%f31
	array8	%o2,	%i7,	%g7
	movre	%l2,	%l1,	%o1
	array16	%l3,	%i6,	%i4
	nop
	set	0x60, %g7
	ldsw	[%l7 + %g7],	%o5
	srax	%o0,	%i0,	%l4
	fpackfix	%f4,	%f30
	orn	%g5,	%o3,	%l6
	movrne	%g1,	0x28F,	%o4
	stb	%l5,	[%l7 + 0x76]
	edge32l	%i1,	%i2,	%g6
	andncc	%o6,	%i3,	%l0
	ba,a,pt	%icc,	loop_1915
	fmovd	%f6,	%f20
	tl	%xcc,	0x6
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f6
loop_1915:
	fmovscc	%icc,	%f12,	%f26
	tne	%icc,	0x6
	popc	0x0F65,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g2,	%o7
	set	0x54, %i2
	stwa	%g4,	[%l7 + %i2] 0x04
	edge16ln	%o2,	%g3,	%g7
	fbug	%fcc2,	loop_1916
	bgu,pn	%icc,	loop_1917
	bneg	%icc,	loop_1918
	srlx	%i7,	0x00,	%l2
loop_1916:
	nop
	setx	0xDDCFADAF219546D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x5FB0BCADADA92C40,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f26,	%f12
loop_1917:
	xor	%o1,	%l1,	%l3
loop_1918:
	movne	%icc,	%i4,	%o5
	fzero	%f0
	subccc	%i6,	%i0,	%l4
	alignaddr	%g5,	%o3,	%o0
	orncc	%g1,	0x1B4D,	%l6
	taddcctv	%o4,	0x11F6,	%i1
	movrgez	%l5,	%i2,	%o6
	fpack16	%f16,	%f28
	mova	%xcc,	%i3,	%g6
	sdivx	%l0,	0x18FF,	%i5
	edge8n	%o7,	%g2,	%g4
	edge16	%g3,	%g7,	%i7
	sll	%o2,	0x0B,	%l2
	tcc	%xcc,	0x1
	fmovsge	%icc,	%f2,	%f23
	fba	%fcc1,	loop_1919
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f20
	popc	0x040F,	%l1
	subc	%l3,	0x1448,	%o1
loop_1919:
	ldsh	[%l7 + 0x76],	%i4
	movre	%i6,	%o5,	%i0
	movcc	%icc,	%l4,	%o3
	movn	%icc,	%o0,	%g1
	nop
	setx	0x80B85AEB504B13B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l6,	%o4,	%i1
	movre	%g5,	0x3B3,	%i2
	flush	%l7 + 0x78
	tle	%icc,	0x5
	fone	%f14
	fornot1	%f2,	%f10,	%f0
	xorcc	%o6,	0x024C,	%l5
	movleu	%xcc,	%i3,	%l0
	sdiv	%i5,	0x14BF,	%o7
	sth	%g2,	[%l7 + 0x2A]
	movl	%xcc,	%g4,	%g3
	xnor	%g6,	%g7,	%i7
	movre	%l2,	0x1EA,	%o2
	move	%icc,	%l3,	%l1
	edge32l	%i4,	%i6,	%o5
	xor	%i0,	0x0588,	%o1
	tgu	%xcc,	0x6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l4,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%l6
	edge8ln	%g1,	%o4,	%g5
	tpos	%xcc,	0x5
	ldstub	[%l7 + 0x11],	%i1
	fbne	%fcc2,	loop_1920
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f22
	stb	%i2,	[%l7 + 0x73]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
loop_1920:
	addcc	%o6,	%i3,	%l5
	movrne	%l0,	0x13C,	%i5
	orcc	%o7,	0x0261,	%g2
	smulcc	%g3,	0x113C,	%g6
	array32	%g4,	%i7,	%g7
	set	0x54, %i0
	ldsha	[%l7 + %i0] 0x81,	%l2
	movleu	%icc,	%l3,	%l1
	nop
	setx	loop_1921,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%o2,	%i6,	%i4
	fmovd	%f10,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1921:
	ba	%icc,	loop_1922
	fbuge,a	%fcc0,	loop_1923
	xnor	%o5,	0x08EB,	%i0
	mulx	%l4,	%o1,	%o3
loop_1922:
	sub	%o0,	%l6,	%o4
loop_1923:
	move	%icc,	%g1,	%i1
	addc	%g5,	%i2,	%o6
	sll	%l5,	%l0,	%i3
	tsubcc	%i5,	%g2,	%g3
	edge8l	%g6,	%g4,	%i7
	fmovsvc	%icc,	%f25,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,pn	%icc,	loop_1924
	fxnor	%f28,	%f8,	%f2
	srax	%o7,	0x01,	%l2
	movgu	%icc,	%l3,	%l1
loop_1924:
	movrne	%o2,	%i6,	%g7
	movvs	%icc,	%i4,	%i0
	orcc	%l4,	0x015D,	%o1
	edge16n	%o5,	%o3,	%o0
	edge8ln	%o4,	%l6,	%i1
	or	%g1,	0x17F3,	%i2
	fmovrdlz	%g5,	%f26,	%f30
	edge8ln	%l5,	%o6,	%i3
	stbar
	faligndata	%f10,	%f12,	%f12
	tpos	%icc,	0x7
	add	%l0,	0x0FF9,	%i5
	nop
	setx	0xD07CCA956071037F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	edge8l	%g2,	%g3,	%g6
	popc	%g4,	%i7
	andncc	%o7,	%l2,	%l1
	bvc	%icc,	loop_1925
	tpos	%xcc,	0x4
	ble,pn	%xcc,	loop_1926
	mulscc	%l3,	0x0F4F,	%o2
loop_1925:
	fmovspos	%xcc,	%f26,	%f10
	fxors	%f20,	%f21,	%f16
loop_1926:
	tg	%xcc,	0x6
	fpack16	%f20,	%f17
	subc	%g7,	0x1824,	%i4
	tcs	%icc,	0x0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x14,	%f0
	flush	%l7 + 0x24
	membar	0x79
	popc	%i6,	%l4
	bne,a,pt	%xcc,	loop_1927
	edge16n	%i0,	%o5,	%o3
	fxors	%f11,	%f28,	%f15
	fmovsle	%xcc,	%f25,	%f16
loop_1927:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x0
	wr	%g0,	0x88,	%asi
	stwa	%o0,	[%l7 + 0x50] %asi
	sdivx	%o4,	0x1EFB,	%l6
	array32	%o1,	%g1,	%i2
	udiv	%i1,	0x0389,	%l5
	fbg	%fcc0,	loop_1928
	ldub	[%l7 + 0x3E],	%o6
	popc	0x05F3,	%g5
	movge	%icc,	%l0,	%i3
loop_1928:
	movrne	%i5,	0x2DC,	%g2
	and	%g6,	0x0FEF,	%g4
	movrgz	%i7,	%o7,	%g3
	sdiv	%l2,	0x192D,	%l1
	umul	%o2,	%g7,	%i4
	tg	%icc,	0x6
	nop
	setx	0x305A64C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fbe,a	%fcc3,	loop_1929
	xnorcc	%i6,	0x0E0F,	%l4
	sra	%i0,	0x00,	%o5
	bn,a,pn	%xcc,	loop_1930
loop_1929:
	edge16l	%o3,	%l3,	%o0
	movrlez	%o4,	%o1,	%g1
	prefetch	[%l7 + 0x64],	 0x1
loop_1930:
	movge	%icc,	%l6,	%i1
	fpack16	%f20,	%f23
	fmul8ulx16	%f24,	%f14,	%f28
	bleu,a,pn	%icc,	loop_1931
	fbug,a	%fcc1,	loop_1932
	fornot2s	%f28,	%f18,	%f23
	nop
	setx	0x5E2208058070AA81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
loop_1931:
	andcc	%i2,	%l5,	%o6
loop_1932:
	orcc	%l0,	0x175D,	%g5
	wr	%g0,	0x18,	%asi
	sta	%f12,	[%l7 + 0x20] %asi
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%i5
	tge	%xcc,	0x0
	edge32ln	%i3,	%g2,	%g6
	fmovrse	%i7,	%f24,	%f12
	fmovrdgez	%g4,	%f28,	%f0
	fpack16	%f14,	%f10
	tl	%icc,	0x2
	alignaddrl	%g3,	%o7,	%l2
	nop
	setx	loop_1933,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%icc,	%o2,	%l1
	tsubcctv	%g7,	0x123A,	%i4
	tcc	%xcc,	0x0
loop_1933:
	or	%l4,	0x0638,	%i0
	srax	%o5,	0x06,	%o3
	edge32n	%l3,	%o0,	%i6
	tg	%icc,	0x0
	nop
	setx	0xD046580C,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	bshuffle	%f0,	%f8,	%f8
	srax	%o4,	%g1,	%l6
	mulx	%o1,	%i1,	%i2
	srax	%l5,	%l0,	%g5
	movvc	%icc,	%i5,	%o6
	addcc	%g2,	0x18B6,	%g6
	flush	%l7 + 0x64
	addccc	%i3,	0x06F1,	%g4
	ble,pn	%xcc,	loop_1934
	fbue	%fcc3,	loop_1935
	subccc	%g3,	%o7,	%i7
	edge32n	%l2,	%o2,	%l1
loop_1934:
	sdivx	%i4,	0x08FE,	%l4
loop_1935:
	movrgez	%g7,	0x37D,	%o5
	edge32	%o3,	%i0,	%l3
	set	0x28, %o3
	lduba	[%l7 + %o3] 0x0c,	%o0
	tvc	%xcc,	0x7
	fandnot1	%f22,	%f2,	%f2
	nop
	setx	0xF950B08ACE85EE4B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xFE798336B6EB8F9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f8,	%f24
	xnor	%i6,	%o4,	%g1
	tvs	%xcc,	0x0
	popc	%l6,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i2,	[%l7 + 0x08]
	fnot1s	%f26,	%f19
	edge32l	%l5,	%o1,	%l0
	wr	%g0,	0xeb,	%asi
	stba	%g5,	[%l7 + 0x4B] %asi
	membar	#Sync
	fmovrdgez	%i5,	%f6,	%f28
	membar	0x40
	xorcc	%g2,	0x1F97,	%o6
	edge16ln	%i3,	%g4,	%g6
	fbue	%fcc1,	loop_1936
	fnor	%f12,	%f16,	%f4
	fbul,a	%fcc0,	loop_1937
	bl,a,pt	%icc,	loop_1938
loop_1936:
	stb	%o7,	[%l7 + 0x40]
	fandnot1	%f0,	%f12,	%f2
loop_1937:
	te	%icc,	0x2
loop_1938:
	movg	%icc,	%g3,	%i7
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f4
	lduh	[%l7 + 0x2A],	%l2
	movcs	%icc,	%o2,	%l1
	alignaddrl	%l4,	%g7,	%o5
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o3
	edge8ln	%i4,	%i0,	%l3
	ldx	[%l7 + 0x60],	%o0
	fcmpeq32	%f30,	%f26,	%o4
	smulcc	%g1,	%l6,	%i6
	orcc	%i1,	0x1932,	%l5
	set	0x0A, %l2
	ldsha	[%l7 + %l2] 0x10,	%o1
	add	%i2,	%g5,	%l0
	edge16ln	%g2,	%o6,	%i5
	fmovsn	%xcc,	%f17,	%f25
	ldd	[%l7 + 0x78],	%f24
	sir	0x0AB9
	umulcc	%g4,	0x0C51,	%i3
	nop
	setx	0xAEA4A857,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x06F09458,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f5,	%f9
	andncc	%o7,	%g6,	%i7
	bne	%icc,	loop_1939
	srl	%g3,	0x02,	%o2
	mulx	%l1,	0x06BF,	%l2
	or	%l4,	%g7,	%o3
loop_1939:
	udivcc	%i4,	0x1F1F,	%o5
	edge16	%l3,	%o0,	%i0
	tl	%xcc,	0x3
	fand	%f2,	%f18,	%f16
	popc	0x0AD8,	%o4
	fmovdne	%icc,	%f1,	%f6
	addc	%g1,	%i6,	%i1
	xnor	%l5,	0x1C43,	%l6
	brlez,a	%o1,	loop_1940
	sth	%g5,	[%l7 + 0x44]
	movgu	%icc,	%i2,	%l0
	srax	%g2,	%i5,	%o6
loop_1940:
	fmul8x16al	%f9,	%f29,	%f16
	fnegd	%f0,	%f0
	addcc	%i3,	%o7,	%g4
	orncc	%g6,	%i7,	%g3
	movle	%xcc,	%l1,	%o2
	fble	%fcc1,	loop_1941
	movrlz	%l2,	0x242,	%l4
	array8	%g7,	%i4,	%o5
	tpos	%icc,	0x6
loop_1941:
	tge	%icc,	0x1
	edge8	%l3,	%o3,	%i0
	bneg	%icc,	loop_1942
	taddcc	%o4,	%o0,	%i6
	tg	%icc,	0x6
	xorcc	%g1,	%i1,	%l6
loop_1942:
	fbue	%fcc3,	loop_1943
	movge	%xcc,	%o1,	%l5
	fands	%f12,	%f22,	%f10
	xor	%i2,	%l0,	%g5
loop_1943:
	and	%g2,	0x1B90,	%o6
	tsubcctv	%i5,	0x15E9,	%o7
	movl	%icc,	%g4,	%g6
	srax	%i3,	%i7,	%g3
	sdiv	%o2,	0x0EC7,	%l2
	smul	%l1,	0x0D8D,	%l4
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x81
	nop
	fitos	%f2,	%f16
	fstoi	%f16,	%f7
	sdivx	%i4,	0x10F7,	%o5
	tgu	%xcc,	0x7
	movvc	%xcc,	%l3,	%o3
	movgu	%xcc,	%i0,	%g7
	xor	%o0,	%i6,	%o4
	array32	%i1,	%l6,	%g1
	tleu	%xcc,	0x5
	bleu,pt	%icc,	loop_1944
	bg,a	%xcc,	loop_1945
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f28,	%f9
loop_1944:
	udivx	%l5,	0x03E1,	%i2
loop_1945:
	tgu	%xcc,	0x6
	tn	%icc,	0x5
	fnot1	%f26,	%f2
	taddcctv	%l0,	0x1227,	%o1
	edge16l	%g5,	%o6,	%i5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf0,	%f0
	array32	%o7,	%g4,	%g2
	movrlz	%g6,	0x173,	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o2
	movg	%icc,	%g3,	%l1
	movgu	%icc,	%l4,	%i4
	edge32n	%o5,	%l2,	%o3
	movgu	%icc,	%i0,	%g7
	fpsub16s	%f15,	%f14,	%f23
	fmul8x16au	%f18,	%f0,	%f22
	fnand	%f6,	%f24,	%f4
	orncc	%l3,	0x0B9F,	%i6
	fpsub32	%f30,	%f6,	%f28
	fpadd16	%f8,	%f6,	%f30
	brgez,a	%o4,	loop_1946
	sra	%o0,	%i1,	%g1
	ta	%icc,	0x0
	fmovrdlz	%l5,	%f16,	%f2
loop_1946:
	bpos,a,pn	%icc,	loop_1947
	edge32l	%i2,	%l6,	%l0
	fcmple16	%f20,	%f26,	%o1
	edge32	%g5,	%i5,	%o7
loop_1947:
	tle	%xcc,	0x5
	fones	%f27
	ldub	[%l7 + 0x2C],	%o6
	fmovrdgez	%g4,	%f24,	%f6
	nop
	fitos	%f14,	%f25
	popc	0x0A7B,	%g6
	movrlz	%g2,	0x1AE,	%i7
	fpadd16s	%f12,	%f8,	%f16
	smulcc	%o2,	%g3,	%l1
	mulscc	%i3,	0x08B4,	%i4
	bne,a,pn	%icc,	loop_1948
	movne	%xcc,	%l4,	%o5
	nop
	setx	0x61479313B3612B85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2E1B6C8611C5DF35,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f26,	%f26
	fmovdvs	%icc,	%f10,	%f29
loop_1948:
	edge16	%l2,	%o3,	%i0
	add	%g7,	0x06B4,	%l3
	bn,pt	%icc,	loop_1949
	edge16	%o4,	%o0,	%i6
	movcs	%xcc,	%i1,	%l5
	movre	%i2,	0x344,	%g1
loop_1949:
	fnands	%f17,	%f29,	%f2
	edge32l	%l6,	%l0,	%g5
	tn	%icc,	0x0
	fbl,a	%fcc0,	loop_1950
	fbu	%fcc1,	loop_1951
	andcc	%o1,	0x1923,	%i5
	brlz,a	%o6,	loop_1952
loop_1950:
	fba	%fcc0,	loop_1953
loop_1951:
	tvs	%xcc,	0x2
	sdiv	%g4,	0x1363,	%o7
loop_1952:
	xorcc	%g2,	%g6,	%o2
loop_1953:
	sethi	0x1B30,	%g3
	tg	%icc,	0x1
	alignaddr	%l1,	%i3,	%i4
	sdivcc	%i7,	0x0F9C,	%l4
	fmovda	%xcc,	%f3,	%f28
	movpos	%xcc,	%l2,	%o5
	nop
	set	0x37, %g2
	ldub	[%l7 + %g2],	%i0
	edge32ln	%g7,	%l3,	%o4
	tge	%icc,	0x7
	orcc	%o3,	%o0,	%i1
	tg	%xcc,	0x2
	movvc	%icc,	%i6,	%l5
	fmovdge	%xcc,	%f16,	%f24
	movgu	%xcc,	%g1,	%l6
	fmul8x16	%f31,	%f18,	%f2
	fpadd16s	%f1,	%f22,	%f4
	subc	%i2,	%l0,	%o1
	tge	%xcc,	0x4
	sdivcc	%i5,	0x1E75,	%o6
	set	0x18, %l3
	stwa	%g5,	[%l7 + %l3] 0x80
	bneg,a,pn	%xcc,	loop_1954
	movvc	%icc,	%g4,	%g2
	nop
	setx	0x58E84773,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xF140525F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f10,	%f4
	faligndata	%f30,	%f26,	%f10
loop_1954:
	tn	%icc,	0x2
	alignaddr	%o7,	%o2,	%g3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x78] %asi,	%l1
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f18
	fxtod	%f18,	%f14
	movre	%g6,	%i4,	%i3
	sll	%i7,	%l2,	%o5
	andncc	%l4,	%g7,	%i0
	fmovrdlez	%o4,	%f16,	%f8
	tvc	%xcc,	0x0
	move	%icc,	%o3,	%o0
	sllx	%i1,	0x16,	%i6
	brz	%l5,	loop_1955
	fmovdpos	%icc,	%f27,	%f0
	srlx	%g1,	%l6,	%i2
	andncc	%l3,	%l0,	%i5
loop_1955:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%o6
	srlx	%g5,	0x19,	%g4
	ldsb	[%l7 + 0x6E],	%o1
	fbule,a	%fcc0,	loop_1956
	prefetch	[%l7 + 0x50],	 0x3
	sll	%o7,	%o2,	%g2
	edge32l	%l1,	%g3,	%i4
loop_1956:
	fbn,a	%fcc3,	loop_1957
	fpackfix	%f12,	%f2
	subcc	%i3,	0x06A5,	%g6
	edge8n	%l2,	%i7,	%l4
loop_1957:
	movrne	%o5,	0x069,	%g7
	fcmpeq32	%f24,	%f18,	%i0
	fbu,a	%fcc2,	loop_1958
	edge16ln	%o4,	%o0,	%o3
	srax	%i6,	%i1,	%l5
	movrgez	%g1,	%l6,	%l3
loop_1958:
	ldstub	[%l7 + 0x2E],	%l0
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f7
	tsubcc	%i2,	0x065A,	%o6
	tsubcc	%i5,	0x0523,	%g4
	bshuffle	%f28,	%f26,	%f20
	edge16	%g5,	%o1,	%o2
	fpack32	%f22,	%f14,	%f4
	orcc	%o7,	0x1753,	%g2
	nop
	setx	0x3638788243AFC8A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6E6E21A295440702,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f8,	%f14
	andcc	%g3,	%i4,	%i3
	nop
	fitos	%f11,	%f13
	fstox	%f13,	%f30
	tg	%icc,	0x4
	andcc	%g6,	0x069E,	%l1
	fmovsge	%xcc,	%f12,	%f7
	edge8	%i7,	%l2,	%o5
	edge8ln	%l4,	%i0,	%g7
	nop
	fitos	%f7,	%f12
	fstox	%f12,	%f16
	andcc	%o0,	0x07D5,	%o3
	nop
	fitod	%f12,	%f28
	fdtox	%f28,	%f10
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	tn	%icc,	0x0
	fnot2	%f18,	%f0
	fxnors	%f1,	%f0,	%f20
	smulcc	%i1,	%l5,	%g1
	fcmpgt32	%f8,	%f0,	%i6
	fbue	%fcc0,	loop_1959
	fnot2s	%f22,	%f9
	fmovrdgez	%l6,	%f12,	%f18
	fandnot2s	%f27,	%f20,	%f3
loop_1959:
	sir	0x065E
	fbu,a	%fcc2,	loop_1960
	fmovs	%f1,	%f3
	tne	%xcc,	0x6
	sdivx	%l3,	0x1EFE,	%i2
loop_1960:
	nop
	setx	loop_1961,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxors	%f5,	%f15,	%f4
	fone	%f30
	movrne	%l0,	%i5,	%o6
loop_1961:
	fmul8sux16	%f6,	%f6,	%f22
	movcs	%xcc,	%g4,	%o1
	fbug	%fcc0,	loop_1962
	fzeros	%f10
	movre	%g5,	%o2,	%o7
	subc	%g2,	0x146E,	%g3
loop_1962:
	nop
	setx	loop_1963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%icc,	0x2
	wr	%g0,	0xe2,	%asi
	stxa	%i4,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1963:
	edge8	%i3,	%g6,	%i7
	udivcc	%l1,	0x02FF,	%o5
	tn	%icc,	0x6
	srl	%l4,	0x0B,	%l2
	fornot1s	%f16,	%f18,	%f22
	sir	0x044F
	udivcc	%g7,	0x1D6C,	%i0
	bpos	loop_1964
	brlz,a	%o0,	loop_1965
	te	%xcc,	0x1
	sdivx	%o4,	0x1429,	%i1
loop_1964:
	subcc	%o3,	%l5,	%i6
loop_1965:
	array16	%l6,	%l3,	%i2
	movcc	%xcc,	%g1,	%l0
	array32	%o6,	%i5,	%g4
	movre	%o1,	%o2,	%o7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g5
	bcs,pn	%xcc,	loop_1966
	fnor	%f2,	%f0,	%f12
	or	%g3,	%i4,	%g2
	tleu	%xcc,	0x2
loop_1966:
	nop
	set	0x30, %l6
	stxa	%i3,	[%l7 + %l6] 0x27
	membar	#Sync
	xorcc	%i7,	0x059D,	%g6
	fpsub16s	%f18,	%f26,	%f4
	membar	0x73
	add	%o5,	0x095B,	%l1
	subcc	%l4,	0x1E86,	%l2
	fcmpeq32	%f16,	%f22,	%i0
	move	%icc,	%o0,	%o4
	set	0x44, %o2
	lda	[%l7 + %o2] 0x89,	%f10
	bgu	%xcc,	loop_1967
	udivcc	%g7,	0x1E17,	%i1
	nop
	setx	0x102DF6F2FFEEAF15,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB3C5C5A2B100F567,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f30,	%f26
	fmovsvs	%xcc,	%f19,	%f5
loop_1967:
	nop
	setx loop_1968, %l0, %l1
	jmpl %l1, %o3
	movcc	%xcc,	%i6,	%l6
	fmovd	%f30,	%f24
	movrgez	%l3,	%l5,	%i2
loop_1968:
	ldstub	[%l7 + 0x6C],	%g1
	taddcctv	%o6,	0x0049,	%i5
	tg	%icc,	0x1
	edge32n	%g4,	%o1,	%l0
	xorcc	%o2,	0x06E9,	%g5
	fmovdpos	%xcc,	%f27,	%f4
	addccc	%g3,	%i4,	%g2
	sdivcc	%i3,	0x019F,	%i7
	array16	%o7,	%o5,	%g6
	lduw	[%l7 + 0x20],	%l1
	tg	%xcc,	0x7
	sdivx	%l2,	0x0376,	%l4
	tgu	%icc,	0x5
	fmuld8ulx16	%f31,	%f12,	%f28
	array32	%i0,	%o0,	%o4
	tcc	%icc,	0x0
	brlz,a	%i1,	loop_1969
	taddcc	%g7,	%o3,	%i6
	nop
	setx loop_1970, %l0, %l1
	jmpl %l1, %l6
	stbar
loop_1969:
	fmovsn	%xcc,	%f14,	%f16
	movg	%xcc,	%l3,	%i2
loop_1970:
	fbue	%fcc0,	loop_1971
	brz	%l5,	loop_1972
	sdivx	%o6,	0x0F23,	%i5
	umulcc	%g1,	0x1FF6,	%g4
loop_1971:
	sth	%o1,	[%l7 + 0x1C]
loop_1972:
	edge8l	%o2,	%g5,	%g3
	xor	%l0,	0x1720,	%g2
	membar	0x23
	tcc	%icc,	0x6
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%i3
	srax	%i4,	0x17,	%i7
	fandnot2	%f8,	%f18,	%f2
	edge32l	%o5,	%o7,	%l1
	tpos	%icc,	0x3
	tvc	%xcc,	0x7
	tg	%icc,	0x0
	orncc	%g6,	%l4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x16A4,	%o0
	movne	%icc,	%i0,	%o4
	fmovsleu	%icc,	%f29,	%f29
	fornot1	%f0,	%f10,	%f22
	umulcc	%i1,	%o3,	%i6
	nop
	setx	0x0A391F2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x8812DC89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f26,	%f14
	movne	%xcc,	%g7,	%l6
	fpack16	%f6,	%f10
	fmovscs	%icc,	%f1,	%f5
	fpsub16s	%f2,	%f31,	%f22
	sllx	%l3,	%l5,	%o6
	bneg,a,pt	%icc,	loop_1973
	srl	%i2,	0x0C,	%i5
	popc	%g1,	%o1
	fbl,a	%fcc2,	loop_1974
loop_1973:
	mulx	%o2,	%g4,	%g5
	orcc	%g3,	0x00F4,	%g2
	brlez,a	%i3,	loop_1975
loop_1974:
	lduh	[%l7 + 0x2C],	%i4
	fmovsne	%xcc,	%f16,	%f16
	fpadd16	%f30,	%f4,	%f8
loop_1975:
	fmovrdlz	%i7,	%f24,	%f12
	tg	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x0C] %asi,	%o5
	set	0x24, %i4
	ldsba	[%l7 + %i4] 0x89,	%o7
	flush	%l7 + 0x18
	mulscc	%l0,	0x03AF,	%g6
	fbl	%fcc3,	loop_1976
	sra	%l4,	0x1B,	%l2
	alignaddrl	%l1,	%i0,	%o0
	srl	%i1,	0x0E,	%o4
loop_1976:
	sir	0x08BD
	nop
	setx	0xB0579CB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fmovdcc	%xcc,	%f3,	%f9
	ld	[%l7 + 0x10],	%f20
	movvc	%xcc,	%i6,	%o3
	movle	%xcc,	%g7,	%l3
	movcs	%icc,	%l5,	%o6
	ldd	[%l7 + 0x68],	%f14
	movle	%icc,	%l6,	%i5
	set	0x68, %i3
	stwa	%g1,	[%l7 + %i3] 0x2f
	membar	#Sync
	fxnors	%f12,	%f9,	%f20
	membar	0x21
	edge8	%i2,	%o2,	%o1
	umulcc	%g4,	0x0FA1,	%g3
	fpadd16	%f26,	%f20,	%f28
	tleu	%xcc,	0x6
	fcmpeq16	%f30,	%f16,	%g5
	add	%g2,	0x09DA,	%i4
	mova	%icc,	%i3,	%o5
	set	0x50, %o0
	swapa	[%l7 + %o0] 0x04,	%i7
	srlx	%o7,	0x06,	%l0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	tcs	%icc,	0x4
	brz	%l2,	loop_1977
	add	%g6,	0x000D,	%l1
	fbne	%fcc1,	loop_1978
	fmovdcs	%xcc,	%f4,	%f17
loop_1977:
	alignaddrl	%o0,	%i1,	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i6,	%i0
loop_1978:
	movle	%icc,	%o3,	%l3
	movre	%g7,	0x191,	%o6
	movrgez	%l6,	%l5,	%g1
	array16	%i2,	%i5,	%o2
	bpos,pt	%icc,	loop_1979
	movl	%icc,	%o1,	%g4
	subcc	%g3,	%g2,	%g5
	movre	%i3,	0x2A2,	%o5
loop_1979:
	nop
	wr	%g0,	0x27,	%asi
	stwa	%i7,	[%l7 + 0x3C] %asi
	membar	#Sync
	tg	%xcc,	0x2
	tg	%xcc,	0x7
	taddcc	%i4,	0x14A2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l4,	%l2,	%l0
	movg	%xcc,	%g6,	%o0
	bcc,pn	%xcc,	loop_1980
	udivcc	%i1,	0x015B,	%l1
	fornot2s	%f24,	%f31,	%f4
	bpos,a	%xcc,	loop_1981
loop_1980:
	umul	%i6,	%i0,	%o3
	subccc	%l3,	0x1936,	%g7
	sth	%o4,	[%l7 + 0x16]
loop_1981:
	nop
	fitos	%f12,	%f9
	fstod	%f9,	%f10
	sdivcc	%o6,	0x1DC8,	%l5
	tsubcctv	%l6,	0x1814,	%i2
	tg	%xcc,	0x1
	edge16ln	%g1,	%i5,	%o1
	bpos,pt	%xcc,	loop_1982
	mulx	%o2,	0x0C59,	%g4
	edge32l	%g2,	%g3,	%i3
	te	%xcc,	0x7
loop_1982:
	call	loop_1983
	movgu	%icc,	%o5,	%g5
	fsrc1s	%f25,	%f17
	nop
	setx	0x2C77A3AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9C5F4597,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f7,	%f16
loop_1983:
	alignaddrl	%i7,	%i4,	%l4
	fmuld8ulx16	%f0,	%f31,	%f2
	fbe,a	%fcc2,	loop_1984
	subc	%o7,	%l0,	%l2
	fmovrdgez	%g6,	%f14,	%f10
	sethi	0x1317,	%o0
loop_1984:
	movne	%icc,	%l1,	%i1
	movneg	%xcc,	%i0,	%o3
	fmovd	%f28,	%f22
	edge16ln	%i6,	%g7,	%o4
	orn	%l3,	0x00E9,	%l5
	tvc	%icc,	0x6
	tge	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l6,	%i2
	popc	0x06FD,	%o6
	movcc	%xcc,	%i5,	%o1
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x81,	%o2
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x04,	%g1
	add	%g4,	0x02EB,	%g2
	fsrc1s	%f13,	%f21
	sir	0x0A7B
	ldx	[%l7 + 0x40],	%g3
	add	%o5,	0x053C,	%g5
	fornot1	%f24,	%f24,	%f6
	mulscc	%i7,	0x1306,	%i3
	fornot1	%f0,	%f20,	%f4
	edge16n	%l4,	%o7,	%i4
	fmovrsgez	%l2,	%f16,	%f18
	orcc	%g6,	0x006D,	%l0
	stb	%o0,	[%l7 + 0x73]
	srlx	%l1,	0x04,	%i0
	tsubcctv	%o3,	%i1,	%g7
	udivx	%o4,	0x0B25,	%i6
	fbuge	%fcc0,	loop_1985
	movge	%icc,	%l3,	%l6
	edge16	%l5,	%o6,	%i5
	tsubcc	%i2,	%o2,	%o1
loop_1985:
	nop
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x16
	membar	#Sync
	flush	%l7 + 0x1C
	tvs	%icc,	0x0
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x18] %asi
	andncc	%g2,	%g3,	%o5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2B] %asi,	%g5
	tgu	%icc,	0x0
	array16	%g4,	%i3,	%i7
	array32	%o7,	%i4,	%l2
	tcs	%xcc,	0x0
	srax	%g6,	%l0,	%l4
	set	0x60, %o1
	lduwa	[%l7 + %o1] 0x11,	%l1
	array32	%i0,	%o0,	%o3
	tcc	%xcc,	0x0
	movl	%xcc,	%g7,	%i1
	srlx	%o4,	0x0A,	%i6
	fmovdge	%icc,	%f11,	%f24
	movre	%l3,	0x0B3,	%l6
	movleu	%icc,	%l5,	%i5
	movvc	%xcc,	%o6,	%i2
	edge8l	%o2,	%o1,	%g1
	be,a	%xcc,	loop_1986
	movl	%xcc,	%g3,	%g2
	stbar
	ta	%xcc,	0x6
loop_1986:
	ldsb	[%l7 + 0x58],	%o5
	bneg	%icc,	loop_1987
	movre	%g5,	%g4,	%i3
	srax	%o7,	%i7,	%i4
	smul	%g6,	%l0,	%l4
loop_1987:
	ta	%xcc,	0x0
	fnor	%f6,	%f16,	%f0
	fmul8x16al	%f12,	%f14,	%f6
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x24,	%l0
	for	%f0,	%f2,	%f14
	fmovdl	%xcc,	%f19,	%f31
	bne	loop_1988
	te	%icc,	0x0
	movre	%i0,	%l2,	%o0
	tge	%icc,	0x7
loop_1988:
	movle	%xcc,	%o3,	%g7
	subc	%i1,	0x05B3,	%o4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i6,	%l6
	tcc	%icc,	0x5
	nop
	set	0x6C, %l1
	ldsw	[%l7 + %l1],	%l3
	fpadd16s	%f5,	%f3,	%f8
	flush	%l7 + 0x48
	bgu,a	%xcc,	loop_1989
	umul	%l5,	%i5,	%o6
	bneg	%xcc,	loop_1990
	xnorcc	%i2,	%o1,	%o2
loop_1989:
	movre	%g1,	0x1EA,	%g2
	bneg	loop_1991
loop_1990:
	edge8	%g3,	%g5,	%g4
	fabsd	%f10,	%f2
	sth	%i3,	[%l7 + 0x76]
loop_1991:
	nop
	set	0x50, %g5
	stxa	%o7,	[%l7 + %g5] 0x15
	array16	%i7,	%o5,	%i4
	edge32	%g6,	%l4,	%l1
	fmovsleu	%xcc,	%f5,	%f22
	mulscc	%l0,	%i0,	%o0
	addccc	%l2,	%o3,	%i1
	ldsb	[%l7 + 0x7B],	%o4
	bcc,a	loop_1992
	xorcc	%i6,	0x0A69,	%l6
	set	0x2D, %i1
	ldsba	[%l7 + %i1] 0x11,	%l3
loop_1992:
	nop
	setx	loop_1993,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%xcc,	0x7
	addccc	%g7,	%l5,	%i5
	tsubcctv	%i2,	%o6,	%o1
loop_1993:
	or	%g1,	0x1A11,	%o2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%g3
	fxor	%f10,	%f0,	%f30
	smul	%g2,	0x1F78,	%g5
	bcs,a,pt	%xcc,	loop_1994
	bl	loop_1995
	andncc	%i3,	%g4,	%i7
	srax	%o5,	0x03,	%o7
loop_1994:
	nop
	setx	0xB8729381,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x11A47FA3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f26,	%f23
loop_1995:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x50] %asi,	%g6
	fcmpgt16	%f6,	%f22,	%l4
	stx	%i4,	[%l7 + 0x48]
	movneg	%xcc,	%l0,	%l1
	movvc	%xcc,	%i0,	%l2
	mulx	%o3,	0x0095,	%o0
	fmovs	%f9,	%f26
	edge32l	%i1,	%o4,	%l6
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x0c,	 0x3
	bg,a,pn	%icc,	loop_1996
	prefetch	[%l7 + 0x74],	 0x2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%g7
loop_1996:
	andncc	%i6,	%i5,	%l5
	movneg	%icc,	%o6,	%o1
	lduh	[%l7 + 0x4C],	%i2
	sll	%g1,	0x17,	%g3
	nop
	setx	0x21644268A29EAEBB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE6E74CB97D25A84D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f4,	%f2
	taddcc	%g2,	0x0F43,	%g5
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	fands	%f24,	%f19,	%f29
	smulcc	%o2,	0x0597,	%g4
	fmovsg	%icc,	%f1,	%f1
	tneg	%icc,	0x4
	bleu,pt	%icc,	loop_1997
	orncc	%i7,	%i3,	%o5
	brgez,a	%g6,	loop_1998
	fcmpgt16	%f26,	%f6,	%l4
loop_1997:
	movre	%o7,	%l0,	%l1
	move	%icc,	%i4,	%l2
loop_1998:
	umul	%o3,	0x0637,	%i0
	taddcc	%o0,	0x1D0D,	%o4
	fnot1s	%f19,	%f27
	fmovsn	%xcc,	%f27,	%f23
	edge16ln	%i1,	%l3,	%g7
	tvs	%icc,	0x2
	edge32n	%i6,	%i5,	%l5
	tneg	%xcc,	0x6
	fbn,a	%fcc3,	loop_1999
	bne,a,pn	%icc,	loop_2000
	smulcc	%l6,	0x0BDC,	%o1
	bshuffle	%f12,	%f30,	%f12
loop_1999:
	fmovrdne	%o6,	%f24,	%f6
loop_2000:
	movleu	%xcc,	%i2,	%g3
	brnz	%g2,	loop_2001
	stb	%g5,	[%l7 + 0x0A]
	brlez	%g1,	loop_2002
	tleu	%icc,	0x4
loop_2001:
	fmovdpos	%xcc,	%f30,	%f23
	movcs	%icc,	%o2,	%i7
loop_2002:
	movvs	%xcc,	%i3,	%o5
	xor	%g6,	0x07B9,	%g4
	fandnot2	%f18,	%f26,	%f14
	fbge	%fcc3,	loop_2003
	fbuge,a	%fcc0,	loop_2004
	lduw	[%l7 + 0x30],	%o7
	tpos	%icc,	0x1
loop_2003:
	edge32	%l4,	%l0,	%l1
loop_2004:
	srax	%i4,	0x08,	%l2
	addccc	%i0,	0x1717,	%o3
	fnot2s	%f23,	%f25
	brnz	%o4,	loop_2005
	sir	0x0DFA
	bpos,a,pn	%xcc,	loop_2006
	nop
	setx	loop_2007,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2005:
	sethi	0x0D07,	%i1
	popc	%o0,	%l3
loop_2006:
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f24
loop_2007:
	sdiv	%i6,	0x0865,	%i5
	edge16n	%l5,	%l6,	%g7
	edge8n	%o6,	%o1,	%i2
	brz,a	%g3,	loop_2008
	fmovrsgz	%g2,	%f17,	%f12
	tvs	%xcc,	0x5
	taddcctv	%g1,	%g5,	%i7
loop_2008:
	edge16	%o2,	%i3,	%o5
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x04,	 0x2
	tge	%xcc,	0x5
	ldsw	[%l7 + 0x14],	%g4
	bcc,a	%xcc,	loop_2009
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o7,	0x00DB,	%l0
	edge8l	%l4,	%l1,	%i4
loop_2009:
	movrlez	%l2,	0x28F,	%o3
	swap	[%l7 + 0x1C],	%o4
	ldx	[%l7 + 0x10],	%i0
	sir	0x1F60
	umul	%o0,	0x0719,	%i1
	sllx	%i6,	0x10,	%l3
	fpsub16s	%f3,	%f2,	%f11
	andn	%l5,	0x1322,	%l6
	fmovdl	%xcc,	%f11,	%f14
	srlx	%i5,	0x16,	%g7
	orn	%o6,	%i2,	%g3
	xor	%o1,	%g1,	%g2
	sllx	%g5,	%i7,	%i3
	tcs	%icc,	0x3
	udivx	%o5,	0x14C2,	%o2
	fornot1	%f12,	%f0,	%f16
	fmovrsne	%g4,	%f2,	%f4
	ldsb	[%l7 + 0x20],	%o7
	ldstub	[%l7 + 0x3F],	%g6
	ldd	[%l7 + 0x60],	%l0
	tcc	%xcc,	0x0
	edge8l	%l1,	%i4,	%l2
	mulscc	%o3,	0x13AE,	%o4
	orncc	%l4,	%o0,	%i0
	nop
	setx	loop_2010,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x68],	 0x1
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
loop_2010:
	nop
	fitod	%f6,	%f4
	fdtos	%f4,	%f5
	ldx	[%l7 + 0x78],	%i1
	udiv	%l3,	0x11FC,	%l6
	tn	%icc,	0x6
	movrlez	%l5,	0x1D8,	%i5
	movleu	%xcc,	%g7,	%i2
	fbuge	%fcc3,	loop_2011
	fmovsg	%xcc,	%f7,	%f27
	nop
	setx	0x34434924,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x0B1F67EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f8,	%f8
	fmovsl	%icc,	%f13,	%f3
loop_2011:
	move	%icc,	%o6,	%o1
	movcc	%xcc,	%g1,	%g2
	tneg	%xcc,	0x0
	std	%f16,	[%l7 + 0x50]
	bl	loop_2012
	smul	%g3,	0x180E,	%g5
	set	0x27, %i5
	ldstuba	[%l7 + %i5] 0x18,	%i7
loop_2012:
	tneg	%icc,	0x1
	fbg,a	%fcc0,	loop_2013
	fnot1	%f20,	%f22
	orcc	%i3,	0x0CBB,	%o2
	nop
	setx	0x90029772,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f22
loop_2013:
	fxor	%f18,	%f0,	%f6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g4
	set	0x2A, %o7
	stha	%o7,	[%l7 + %o7] 0x19
	fcmpgt16	%f0,	%f16,	%g6
	tne	%icc,	0x3
	srl	%l1,	0x11,	%i4
	xnorcc	%l2,	0x17FF,	%l0
	xorcc	%o4,	%o3,	%o0
	andcc	%i0,	0x127F,	%i6
	movvc	%xcc,	%l4,	%i1
	edge16n	%l3,	%l5,	%i5
	fmovsneg	%icc,	%f22,	%f27
	fmovdcs	%xcc,	%f20,	%f1
	subcc	%l6,	0x14BC,	%g7
	tpos	%icc,	0x7
	udivx	%i2,	0x05AC,	%o1
	movl	%icc,	%o6,	%g2
	tpos	%xcc,	0x3
	sra	%g1,	0x0F,	%g5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g3
	nop
	setx	0x9864D7D709DA1DCD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f28
	ldsw	[%l7 + 0x38],	%i7
	array16	%o2,	%o5,	%g4
	movcc	%xcc,	%o7,	%g6
	orn	%l1,	%i4,	%i3
	tl	%icc,	0x0
	sra	%l2,	%o4,	%l0
	fmovdgu	%xcc,	%f31,	%f31
	addcc	%o3,	%o0,	%i6
	ldd	[%l7 + 0x08],	%f14
	edge32	%i0,	%i1,	%l4
	tsubcc	%l3,	0x0584,	%i5
	fbue,a	%fcc0,	loop_2014
	sir	0x16B7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%l6
loop_2014:
	edge16l	%l5,	%i2,	%o1
	array32	%g7,	%g2,	%o6
	ldd	[%l7 + 0x58],	%g0
	movl	%xcc,	%g5,	%g3
	tcc	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x0
	tcs	%xcc,	0x6
	brlz	%o2,	loop_2015
	fmovse	%xcc,	%f20,	%f7
	sdiv	%i7,	0x0ABB,	%g4
	fble,a	%fcc3,	loop_2016
loop_2015:
	move	%xcc,	%o5,	%g6
	fbu	%fcc0,	loop_2017
	tneg	%xcc,	0x7
loop_2016:
	fmovdg	%xcc,	%f4,	%f23
	fbug,a	%fcc2,	loop_2018
loop_2017:
	st	%f15,	[%l7 + 0x70]
	for	%f14,	%f2,	%f20
	movle	%icc,	%o7,	%l1
loop_2018:
	sra	%i3,	0x0E,	%l2
	tvs	%icc,	0x6
	edge8n	%i4,	%l0,	%o3
	edge32	%o4,	%o0,	%i6
	bvs,pt	%icc,	loop_2019
	orcc	%i1,	%l4,	%l3
	addc	%i5,	%i0,	%l5
	mova	%xcc,	%i2,	%o1
loop_2019:
	fmovrdlz	%l6,	%f12,	%f4
	sir	0x0BA0
	bn,a	loop_2020
	xnorcc	%g7,	%o6,	%g2
	brlez,a	%g1,	loop_2021
	umul	%g3,	0x1ABA,	%g5
loop_2020:
	ble	%xcc,	loop_2022
	lduh	[%l7 + 0x1C],	%o2
loop_2021:
	alignaddrl	%i7,	%o5,	%g6
	edge8n	%g4,	%l1,	%o7
loop_2022:
	movg	%icc,	%l2,	%i3
	tsubcc	%l0,	%i4,	%o4
	orncc	%o3,	0x076A,	%i6
	fornot1s	%f8,	%f10,	%f5
	for	%f18,	%f0,	%f16
	ldd	[%l7 + 0x30],	%f12
	xnorcc	%o0,	%i1,	%l4
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f8
	fxtos	%f8,	%f18
	ta	%xcc,	0x0
	bvc,pn	%xcc,	loop_2023
	fpadd32	%f28,	%f14,	%f26
	fmovdvs	%icc,	%f18,	%f7
	movpos	%xcc,	%l3,	%i0
loop_2023:
	fpmerge	%f6,	%f12,	%f24
	fmovsvs	%icc,	%f10,	%f20
	nop
	setx	0xD83223D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x4236DB49,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f3,	%f11
	fmovd	%f30,	%f26
	sdivcc	%i5,	0x143F,	%i2
	ldsh	[%l7 + 0x2A],	%l5
	movgu	%icc,	%l6,	%o1
	subcc	%o6,	%g2,	%g1
	movneg	%icc,	%g3,	%g7
	fornot1s	%f4,	%f4,	%f30
	nop
	setx	0xF439D1F030540885,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	alignaddrl	%g5,	%o2,	%o5
	wr	%g0,	0x2b,	%asi
	stba	%i7,	[%l7 + 0x63] %asi
	membar	#Sync
	sethi	0x0E4C,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l1,	0x1990,	%o7
	ba,pn	%xcc,	loop_2024
	taddcc	%g4,	0x1373,	%i3
	set	0x5B, %i2
	lduba	[%l7 + %i2] 0x04,	%l0
loop_2024:
	movle	%icc,	%i4,	%l2
	fbg,a	%fcc1,	loop_2025
	sth	%o4,	[%l7 + 0x3A]
	array16	%i6,	%o3,	%o0
	movvc	%icc,	%i1,	%l4
loop_2025:
	movneg	%xcc,	%l3,	%i0
	array8	%i5,	%i2,	%l5
	smul	%o1,	0x1D45,	%l6
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0x2
	fornot1	%f14,	%f10,	%f0
	sth	%g1,	[%l7 + 0x50]
	array16	%g3,	%g7,	%o6
	alignaddr	%g5,	%o5,	%i7
	tleu	%xcc,	0x6
	stw	%g6,	[%l7 + 0x2C]
	fpsub32s	%f1,	%f13,	%f30
	popc	0x0F1D,	%o2
	addcc	%l1,	%o7,	%g4
	movrlez	%l0,	%i3,	%l2
	swap	[%l7 + 0x44],	%i4
	sub	%i6,	%o3,	%o4
	movrne	%i1,	%l4,	%o0
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
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x7A] %asi,	%i0
	movn	%xcc,	%i5,	%i2
	fmovsgu	%xcc,	%f11,	%f25
	movcc	%xcc,	%l5,	%l3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o1,	%g2
	fmovrsgez	%l6,	%f13,	%f21
	movvs	%xcc,	%g1,	%g7
	tle	%icc,	0x5
	movl	%xcc,	%g3,	%g5
	edge8	%o6,	%o5,	%g6
	tneg	%icc,	0x3
	fandnot1s	%f18,	%f8,	%f25
	sethi	0x1CBD,	%i7
	bgu,a	loop_2026
	movl	%xcc,	%l1,	%o2
	sth	%g4,	[%l7 + 0x54]
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l0
loop_2026:
	edge8ln	%o7,	%i3,	%i4
	umul	%i6,	%o3,	%o4
	orncc	%l2,	0x1314,	%l4
	ld	[%l7 + 0x64],	%f5
	tge	%icc,	0x0
	edge8n	%o0,	%i0,	%i1
	umulcc	%i2,	0x03E8,	%l5
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f24
	fxtos	%f24,	%f16
	membar	0x22
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	bge,pt	%icc,	loop_2027
	movrlez	%l3,	%i5,	%o1
	tgu	%xcc,	0x0
	sll	%g2,	0x0E,	%l6
loop_2027:
	edge16l	%g1,	%g3,	%g5
	fsrc1s	%f15,	%f27
	subcc	%g7,	0x1611,	%o5
	fzeros	%f18
	fmovsgu	%icc,	%f27,	%f30
	edge16l	%o6,	%g6,	%i7
	edge32	%o2,	%l1,	%l0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	edge16l	%i3,	%i4,	%i6
	fmovsne	%icc,	%f5,	%f27
	fcmple32	%f4,	%f22,	%o3
	fornot1	%f30,	%f18,	%f28
	nop
	setx	0x14E512BBF07FD4DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fnegs	%f9,	%f7
	taddcctv	%o4,	0x0297,	%o7
	movg	%icc,	%l2,	%o0
	subcc	%l4,	0x167E,	%i0
	tneg	%icc,	0x4
	fbue	%fcc3,	loop_2028
	fmovrsne	%i2,	%f28,	%f10
	movvs	%icc,	%i1,	%l3
	array16	%i5,	%o1,	%g2
loop_2028:
	sdivx	%l5,	0x0D9F,	%g1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%l6
	sir	0x04F0
	fbue,a	%fcc3,	loop_2029
	fmovscs	%icc,	%f12,	%f26
	fblg	%fcc2,	loop_2030
	umul	%g3,	%g7,	%o5
loop_2029:
	movrlez	%g5,	0x11E,	%o6
	edge32n	%i7,	%o2,	%l1
loop_2030:
	tcc	%icc,	0x2
	fbule,a	%fcc2,	loop_2031
	fandnot1s	%f12,	%f27,	%f15
	movpos	%icc,	%l0,	%g6
	set	0x38, %l5
	stxa	%g4,	[%l7 + %l5] 0x15
loop_2031:
	addcc	%i4,	0x1769,	%i6
	fandnot2	%f4,	%f28,	%f10
	brlz,a	%o3,	loop_2032
	bgu	loop_2033
	andcc	%o4,	%i3,	%l2
	brgz	%o0,	loop_2034
loop_2032:
	tge	%xcc,	0x5
loop_2033:
	mulx	%l4,	%o7,	%i0
	ldsw	[%l7 + 0x28],	%i2
loop_2034:
	tsubcc	%l3,	0x1F21,	%i1
	fble	%fcc1,	loop_2035
	popc	%i5,	%g2
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o1
loop_2035:
	tneg	%xcc,	0x5
	move	%xcc,	%g1,	%l6
	xnor	%g3,	0x1C8D,	%l5
	ldstub	[%l7 + 0x0F],	%o5
	udivcc	%g7,	0x027A,	%g5
	fmovdneg	%icc,	%f22,	%f9
	fmul8sux16	%f12,	%f30,	%f0
	movg	%xcc,	%o6,	%o2
	sir	0x1DD0
	fand	%f22,	%f14,	%f30
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%l0
	tpos	%xcc,	0x3
	movgu	%xcc,	%g6,	%g4
	nop
	fitod	%f11,	%f10
	fand	%f0,	%f22,	%f4
	orncc	%i7,	0x1164,	%i4
	sra	%i6,	0x02,	%o3
	fpack16	%f12,	%f13
	addcc	%i3,	%l2,	%o4
	umulcc	%o0,	%o7,	%l4
	addc	%i0,	0x1C53,	%l3
	sir	0x15A4
	edge8	%i1,	%i5,	%g2
	set	0x0A, %o3
	stha	%i2,	[%l7 + %o3] 0x80
	movneg	%icc,	%o1,	%l6
	sth	%g3,	[%l7 + 0x2A]
	subcc	%l5,	0x0CDC,	%g1
	tleu	%icc,	0x5
	edge32n	%o5,	%g7,	%g5
	fmovrslz	%o2,	%f31,	%f5
	array32	%l1,	%o6,	%g6
	fand	%f28,	%f16,	%f0
	swap	[%l7 + 0x40],	%l0
	nop
	setx	0xA020D943,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x47793E3E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f2,	%f9
	andcc	%g4,	0x0B80,	%i4
	popc	0x0B98,	%i6
	movcc	%xcc,	%i7,	%o3
	srax	%i3,	0x1F,	%l2
	popc	%o0,	%o7
	fmovdvs	%icc,	%f14,	%f2
	fble,a	%fcc0,	loop_2036
	andn	%l4,	%o4,	%i0
	movne	%icc,	%l3,	%i1
	fbul,a	%fcc1,	loop_2037
loop_2036:
	ldsw	[%l7 + 0x7C],	%i5
	array32	%i2,	%o1,	%l6
	edge16n	%g3,	%l5,	%g2
loop_2037:
	ta	%xcc,	0x7
	taddcctv	%g1,	%g7,	%g5
	be,pn	%xcc,	loop_2038
	fxors	%f21,	%f10,	%f24
	faligndata	%f26,	%f26,	%f24
	xnor	%o2,	%o5,	%l1
loop_2038:
	edge32l	%g6,	%l0,	%g4
	stbar
	set	0x18, %l2
	lduwa	[%l7 + %l2] 0x80,	%i4
	movvs	%icc,	%o6,	%i6
	lduh	[%l7 + 0x10],	%o3
	sub	%i7,	0x015C,	%l2
	alignaddrl	%i3,	%o0,	%l4
	membar	0x59
	alignaddr	%o4,	%i0,	%l3
	sdiv	%i1,	0x169F,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x04,	%i2,	%o1
	movpos	%icc,	%i5,	%l6
	fpsub16s	%f1,	%f20,	%f0
	fmovdcs	%xcc,	%f8,	%f13
	movleu	%icc,	%l5,	%g2
	bvs,pn	%xcc,	loop_2039
	nop
	setx	0x9113AB3039A41D67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4810846348D61661,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f22,	%f14
	bpos,a,pt	%icc,	loop_2040
	movge	%icc,	%g1,	%g7
loop_2039:
	fmovrse	%g5,	%f4,	%f3
	movrlz	%o2,	0x0BA,	%g3
loop_2040:
	fmovsg	%icc,	%f24,	%f24
	addccc	%o5,	%l1,	%g6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	movgu	%xcc,	%l0,	%i4
	fmovspos	%xcc,	%f11,	%f18
	bvc,a,pn	%icc,	loop_2041
	fmovdn	%icc,	%f10,	%f14
	bne,pt	%xcc,	loop_2042
	movrgez	%i6,	%o3,	%o6
loop_2041:
	fmovdn	%icc,	%f14,	%f1
	bpos,a	loop_2043
loop_2042:
	ldstub	[%l7 + 0x5F],	%i7
	ldd	[%l7 + 0x38],	%i2
	tcc	%icc,	0x5
loop_2043:
	sir	0x0034
	alignaddrl	%o0,	%l2,	%o4
	be,a,pt	%icc,	loop_2044
	movle	%icc,	%l4,	%l3
	fornot2	%f16,	%f28,	%f4
	brnz,a	%i1,	loop_2045
loop_2044:
	bcs,a,pn	%xcc,	loop_2046
	fmovdl	%xcc,	%f11,	%f11
	movrlz	%o7,	0x186,	%i0
loop_2045:
	fbul,a	%fcc1,	loop_2047
loop_2046:
	tn	%xcc,	0x0
	membar	0x03
	smulcc	%o1,	0x0E1E,	%i2
loop_2047:
	fmovdge	%icc,	%f5,	%f28
	xnor	%l6,	%l5,	%i5
	add	%g1,	%g2,	%g7
	andncc	%g5,	%g3,	%o5
	wr	%g0,	0x19,	%asi
	sta	%f2,	[%l7 + 0x24] %asi
	nop
	setx	0x8A45E01AB0636EFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	edge8	%l1,	%o2,	%g6
	set	0x3E, %l0
	lduha	[%l7 + %l0] 0x81,	%l0
	fnegd	%f20,	%f30
	sll	%i4,	0x00,	%g4
	smulcc	%o3,	0x146B,	%i6
	andcc	%i7,	%o6,	%i3
	movg	%xcc,	%l2,	%o0
	fba	%fcc0,	loop_2048
	movneg	%xcc,	%o4,	%l4
	mulx	%l3,	0x10B3,	%o7
	movgu	%icc,	%i0,	%o1
loop_2048:
	nop
	set	0x1A, %i6
	sth	%i2,	[%l7 + %i6]
	movrlz	%l6,	%l5,	%i5
	bge,a	%icc,	loop_2049
	fnegd	%f8,	%f20
	movl	%icc,	%g1,	%g2
	fcmple16	%f6,	%f16,	%g7
loop_2049:
	fmovspos	%icc,	%f29,	%f22
	movrlez	%i1,	0x38B,	%g5
	edge16ln	%g3,	%o5,	%l1
	andn	%g6,	0x0F31,	%l0
	fxor	%f30,	%f8,	%f12
	fsrc2	%f16,	%f26
	nop
	fitos	%f1,	%f31
	fstox	%f31,	%f26
	movge	%icc,	%i4,	%g4
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	fornot2	%f22,	%f28,	%f20
	orn	%o2,	0x0A89,	%i6
	sll	%i7,	0x1A,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l2,	%o6,	%o4
	sub	%o0,	%l4,	%o7
	fmovdge	%xcc,	%f2,	%f27
	nop
	fitos	%f12,	%f19
	fstod	%f19,	%f0
	fmovdpos	%icc,	%f3,	%f25
	tne	%icc,	0x5
	movg	%icc,	%l3,	%i0
	bvc,a	%icc,	loop_2050
	edge8n	%o1,	%i2,	%l5
	array16	%l6,	%i5,	%g1
	movcs	%xcc,	%g7,	%g2
loop_2050:
	or	%g5,	0x1831,	%i1
	nop
	setx	loop_2051,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%o5,	%g3,	%l1
	subccc	%g6,	0x0136,	%i4
	tn	%icc,	0x1
loop_2051:
	nop
	set	0x0A, %g2
	stha	%g4,	[%l7 + %g2] 0x0c
	movcc	%icc,	%o3,	%l0
	smulcc	%i6,	0x0E5B,	%i7
	membar	0x7B
	fmovrsgz	%i3,	%f24,	%f0
	fmovsleu	%icc,	%f3,	%f26
	tn	%xcc,	0x3
	nop
	setx	0xCD258E609B3627B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA6F13CB652E998F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f8,	%f22
	fandnot1s	%f17,	%f30,	%f12
	movge	%xcc,	%o2,	%o6
	te	%icc,	0x6
	fmovrslz	%o4,	%f1,	%f11
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%f10
	add	%o0,	%l4,	%l2
	fabsd	%f6,	%f24
	fbo	%fcc1,	loop_2052
	orn	%l3,	0x042D,	%i0
	nop
	setx loop_2053, %l0, %l1
	jmpl %l1, %o1
	tpos	%xcc,	0x7
loop_2052:
	tcs	%icc,	0x1
	fmovdn	%xcc,	%f29,	%f30
loop_2053:
	fxnor	%f8,	%f28,	%f28
	andn	%i2,	0x1B0B,	%o7
	bne	loop_2054
	srax	%l6,	%i5,	%g1
	nop
	setx	0xA8F6ED17E04186C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	edge16ln	%l5,	%g2,	%g5
loop_2054:
	orn	%g7,	%o5,	%g3
	movrgez	%l1,	0x2DE,	%g6
	set	0x64, %l6
	lduha	[%l7 + %l6] 0x89,	%i4
	fmuld8ulx16	%f14,	%f20,	%f4
	call	loop_2055
	udiv	%g4,	0x1994,	%i1
	fxor	%f2,	%f2,	%f16
	tcs	%icc,	0x5
loop_2055:
	bpos,a	loop_2056
	nop
	setx loop_2057, %l0, %l1
	jmpl %l1, %o3
	taddcc	%i6,	0x1501,	%l0
	fmovrslz	%i3,	%f13,	%f2
loop_2056:
	udivcc	%i7,	0x0C67,	%o6
loop_2057:
	fxnor	%f14,	%f10,	%f20
	xor	%o4,	%o0,	%o2
	and	%l2,	0x0CEB,	%l3
	array16	%l4,	%o1,	%i0
	brz,a	%i2,	loop_2058
	fmovsg	%xcc,	%f13,	%f1
	movcs	%xcc,	%o7,	%i5
	tge	%xcc,	0x1
loop_2058:
	movleu	%icc,	%g1,	%l5
	nop
	fitos	%f13,	%f12
	movrne	%l6,	0x0F8,	%g5
	set	0x78, %o2
	lda	[%l7 + %o2] 0x18,	%f20
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sir	0x01C8
	edge16n	%g2,	%o5,	%g7
	tsubcctv	%g3,	%g6,	%i4
	fexpand	%f21,	%f14
	ta	%xcc,	0x1
	fmovdgu	%icc,	%f5,	%f2
	fmovrsgez	%g4,	%f15,	%f18
	andncc	%l1,	%i1,	%i6
	sra	%l0,	%i3,	%o3
	bcc,a	loop_2059
	edge8l	%i7,	%o6,	%o0
	move	%xcc,	%o4,	%l2
	set	0x28, %o4
	stwa	%l3,	[%l7 + %o4] 0xe2
	membar	#Sync
loop_2059:
	movneg	%xcc,	%l4,	%o1
	tl	%xcc,	0x5
	andn	%i0,	0x130E,	%o2
	srl	%i2,	%i5,	%g1
	movrgz	%l5,	0x277,	%l6
	edge16ln	%o7,	%g2,	%o5
	nop
	setx	0x706CCE9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	movn	%icc,	%g5,	%g3
	smulcc	%g7,	%g6,	%i4
	edge16	%g4,	%i1,	%i6
	edge32ln	%l1,	%l0,	%i3
	edge16n	%i7,	%o6,	%o0
	or	%o3,	0x0258,	%o4
	bvc,a	loop_2060
	udivx	%l3,	0x1138,	%l4
	ldub	[%l7 + 0x22],	%o1
	movn	%xcc,	%i0,	%o2
loop_2060:
	nop
	wr	%g0,	0x2b,	%asi
	stha	%i2,	[%l7 + 0x6A] %asi
	membar	#Sync
	udivcc	%i5,	0x04D3,	%g1
	movpos	%xcc,	%l2,	%l6
	tg	%xcc,	0x2
	movl	%icc,	%o7,	%g2
	movne	%icc,	%o5,	%g5
	srlx	%l5,	0x1B,	%g3
	fmovrdgez	%g6,	%f22,	%f14
	sll	%g7,	%i4,	%g4
	array16	%i1,	%i6,	%l0
	fmovsa	%icc,	%f21,	%f14
	fba	%fcc0,	loop_2061
	fmovscs	%icc,	%f30,	%f29
	subcc	%i3,	%l1,	%i7
	ldub	[%l7 + 0x28],	%o0
loop_2061:
	edge16n	%o6,	%o4,	%l3
	fbuge	%fcc0,	loop_2062
	udivcc	%l4,	0x0D04,	%o1
	fmovse	%xcc,	%f25,	%f6
	movvc	%icc,	%o3,	%i0
loop_2062:
	tgu	%icc,	0x7
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x37] %asi,	%i2
	swap	[%l7 + 0x10],	%o2
	xorcc	%i5,	%g1,	%l2
	ldsw	[%l7 + 0x58],	%o7
	movvs	%xcc,	%l6,	%g2
	te	%icc,	0x1
	smul	%g5,	%o5,	%l5
	fmovdcc	%icc,	%f19,	%f2
	sethi	0x1C88,	%g6
	ldd	[%l7 + 0x30],	%f20
	movne	%xcc,	%g3,	%i4
	bcs,a	loop_2063
	edge32	%g4,	%i1,	%i6
	movl	%xcc,	%g7,	%l0
	nop
	setx	0xFAA5F1EC25E3588A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x495A25427A2E97B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f18,	%f0
loop_2063:
	fmovrdlz	%i3,	%f6,	%f26
	addccc	%l1,	%i7,	%o6
	movle	%xcc,	%o4,	%o0
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x11,	%l2
	bge,a	%xcc,	loop_2064
	fmovsge	%xcc,	%f16,	%f30
	srax	%l4,	%o3,	%o1
	umulcc	%i0,	0x16C8,	%o2
loop_2064:
	ta	%xcc,	0x2
	mulx	%i2,	%i5,	%g1
	fpsub32	%f2,	%f10,	%f4
	array16	%o7,	%l6,	%g2
	movg	%icc,	%l2,	%g5
	fpsub16s	%f20,	%f27,	%f13
	xor	%l5,	%o5,	%g6
	alignaddr	%i4,	%g3,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a,pn	%xcc,	loop_2065
	ldsb	[%l7 + 0x08],	%i6
	movrlz	%g7,	%l0,	%i3
	edge32ln	%l1,	%i1,	%o6
loop_2065:
	srl	%o4,	%o0,	%l3
	fcmpne16	%f0,	%f22,	%i7
	alignaddrl	%o3,	%o1,	%i0
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x24] %asi,	%f22
	sra	%o2,	0x14,	%i2
	fmovrslez	%l4,	%f24,	%f29
	movrne	%g1,	0x0AD,	%i5
	sdiv	%l6,	0x0DF9,	%o7
	subcc	%g2,	0x1825,	%l2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x14] %asi,	%g5
	nop
	setx	loop_2066,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%xcc,	%o5,	%g6
	movg	%xcc,	%i4,	%l5
	tg	%icc,	0x6
loop_2066:
	fbug,a	%fcc2,	loop_2067
	fnot2	%f16,	%f12
	edge16l	%g4,	%g3,	%g7
	edge8n	%i6,	%i3,	%l0
loop_2067:
	fandnot2	%f12,	%f22,	%f10
	subcc	%i1,	0x1040,	%o6
	stw	%l1,	[%l7 + 0x74]
	set	0x1A, %i4
	ldsba	[%l7 + %i4] 0x11,	%o0
	movge	%xcc,	%l3,	%o4
	fmovdn	%xcc,	%f20,	%f8
	edge16n	%o3,	%o1,	%i0
	ldd	[%l7 + 0x78],	%f20
	movvs	%xcc,	%o2,	%i2
	add	%l4,	%i7,	%i5
	andcc	%l6,	0x1F77,	%o7
	ta	%xcc,	0x7
	brlz	%g2,	loop_2068
	fbul	%fcc3,	loop_2069
	tge	%icc,	0x7
	fmovdl	%xcc,	%f8,	%f0
loop_2068:
	addc	%l2,	%g5,	%g1
loop_2069:
	fexpand	%f29,	%f30
	wr	%g0,	0xea,	%asi
	stxa	%g6,	[%l7 + 0x50] %asi
	membar	#Sync
	set	0x10, %o0
	sta	%f17,	[%l7 + %o0] 0x04
	fcmpgt16	%f0,	%f10,	%o5
	fxor	%f2,	%f10,	%f14
	movrne	%l5,	0x195,	%g4
	bleu	%xcc,	loop_2070
	brlz	%i4,	loop_2071
	nop
	setx	loop_2072,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%g3,	%i6,	%i3
loop_2070:
	movrgz	%g7,	%l0,	%o6
loop_2071:
	ldd	[%l7 + 0x70],	%f2
loop_2072:
	fbn	%fcc3,	loop_2073
	smul	%i1,	0x0C3F,	%l1
	nop
	setx	0x8D518240A179179B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f16
	add	%o0,	0x1614,	%l3
loop_2073:
	nop
	fitos	%f9,	%f30
	fstod	%f30,	%f18
	subcc	%o3,	0x1845,	%o4
	fmovdl	%xcc,	%f9,	%f18
	move	%xcc,	%o1,	%o2
	std	%f0,	[%l7 + 0x68]
	fxor	%f28,	%f18,	%f2
	sir	0x07B6
	fbl,a	%fcc1,	loop_2074
	bneg,pt	%xcc,	loop_2075
	tl	%icc,	0x0
	ta	%xcc,	0x5
loop_2074:
	membar	0x01
loop_2075:
	orncc	%i0,	0x1F9B,	%l4
	fblg,a	%fcc3,	loop_2076
	fmuld8sux16	%f26,	%f21,	%f18
	srl	%i7,	%i5,	%l6
	fmovdge	%xcc,	%f24,	%f30
loop_2076:
	addcc	%o7,	%g2,	%i2
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fbn	%fcc1,	loop_2077
	fmuld8sux16	%f14,	%f27,	%f18
	movcc	%xcc,	%l2,	%g5
	movrlz	%g6,	%g1,	%o5
loop_2077:
	addccc	%l5,	%i4,	%g3
	tge	%icc,	0x2
	nop
	set	0x14, %i3
	ldub	[%l7 + %i3],	%g4
	fcmpgt16	%f4,	%f18,	%i6
	movcs	%xcc,	%g7,	%i3
	fbug,a	%fcc2,	loop_2078
	array32	%o6,	%l0,	%i1
	movg	%xcc,	%o0,	%l3
	tcc	%xcc,	0x5
loop_2078:
	andncc	%l1,	%o4,	%o3
	prefetch	[%l7 + 0x34],	 0x2
	tl	%xcc,	0x7
	te	%icc,	0x6
	ta	%xcc,	0x1
	sra	%o2,	%i0,	%o1
	tle	%xcc,	0x6
	fbe,a	%fcc3,	loop_2079
	tleu	%xcc,	0x4
	set	0x10, %o5
	ldswa	[%l7 + %o5] 0x15,	%l4
loop_2079:
	tsubcctv	%i5,	%l6,	%i7
	brz,a	%o7,	loop_2080
	udivcc	%g2,	0x0C94,	%i2
	mulx	%g5,	%l2,	%g1
	ldsb	[%l7 + 0x36],	%g6
loop_2080:
	bn,a	loop_2081
	fbl	%fcc1,	loop_2082
	fbue,a	%fcc1,	loop_2083
	te	%icc,	0x3
loop_2081:
	sdivx	%o5,	0x1FF0,	%i4
loop_2082:
	sethi	0x19FF,	%l5
loop_2083:
	movcc	%xcc,	%g4,	%g3
	bvc,a	%icc,	loop_2084
	nop
	setx	0xF107D0C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x46D7E3E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f0,	%f28
	tvc	%icc,	0x0
	tleu	%icc,	0x5
loop_2084:
	addcc	%i6,	0x1B82,	%g7
	tn	%xcc,	0x1
	lduw	[%l7 + 0x44],	%o6
	set	0x3E, %g3
	ldsha	[%l7 + %g3] 0x89,	%i3
	alignaddrl	%i1,	%o0,	%l3
	bn,a	%icc,	loop_2085
	bvs,pn	%icc,	loop_2086
	fmovscc	%xcc,	%f25,	%f25
	nop
	setx	0x7FA5E1E840578C9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_2085:
	fmovsle	%icc,	%f10,	%f10
loop_2086:
	fblg,a	%fcc3,	loop_2087
	ldd	[%l7 + 0x78],	%f18
	addc	%l1,	0x19D5,	%o4
	move	%icc,	%o3,	%l0
loop_2087:
	addcc	%o2,	%i0,	%l4
	fcmpeq32	%f22,	%f6,	%i5
	subccc	%o1,	%i7,	%o7
	set	0x56, %g4
	ldsha	[%l7 + %g4] 0x04,	%g2
	srax	%i2,	%g5,	%l6
	nop
	setx	0x6BF59EC7D07B59DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fmovsle	%xcc,	%f1,	%f24
	edge32ln	%g1,	%g6,	%o5
	nop
	setx	0x352BF7A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x1056C1F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f28,	%f24
	te	%xcc,	0x5
	sub	%i4,	0x193E,	%l2
	fornot1s	%f12,	%f28,	%f22
	ta	%xcc,	0x5
	edge16ln	%g4,	%l5,	%i6
	movcs	%xcc,	%g7,	%o6
	movre	%i3,	%i1,	%g3
	edge16n	%o0,	%l3,	%o4
	umulcc	%l1,	0x0ADB,	%l0
	fnands	%f2,	%f19,	%f30
	fbg	%fcc3,	loop_2088
	for	%f24,	%f4,	%f12
	edge32n	%o2,	%o3,	%i0
	fbl	%fcc1,	loop_2089
loop_2088:
	fmovsn	%icc,	%f26,	%f8
	xorcc	%i5,	%o1,	%i7
	edge8ln	%l4,	%o7,	%i2
loop_2089:
	addcc	%g2,	0x16AF,	%l6
	srax	%g1,	0x18,	%g5
	sll	%g6,	%o5,	%i4
	xor	%l2,	0x15A2,	%l5
	bneg	%xcc,	loop_2090
	movneg	%icc,	%g4,	%g7
	fxnor	%f10,	%f28,	%f22
	brz,a	%i6,	loop_2091
loop_2090:
	xnorcc	%i3,	0x1C27,	%i1
	lduh	[%l7 + 0x6C],	%o6
	edge8n	%g3,	%l3,	%o4
loop_2091:
	tn	%icc,	0x5
	brlez,a	%l1,	loop_2092
	movge	%xcc,	%l0,	%o0
	xorcc	%o2,	0x1F69,	%o3
	orncc	%i0,	0x17BF,	%o1
loop_2092:
	edge16ln	%i7,	%i5,	%l4
	fnor	%f18,	%f10,	%f10
	fbul,a	%fcc2,	loop_2093
	edge32n	%o7,	%g2,	%i2
	sra	%l6,	%g5,	%g6
	movrgz	%g1,	0x006,	%o5
loop_2093:
	nop
	setx	0x3BCFA121505C47FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	andn	%l2,	0x11BE,	%l5
	ba,a,pt	%xcc,	loop_2094
	nop
	setx	loop_2095,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%icc,	%i4,	%g4
	fbl	%fcc0,	loop_2096
loop_2094:
	udivcc	%g7,	0x14FD,	%i6
loop_2095:
	sub	%i1,	%o6,	%i3
	edge16	%l3,	%o4,	%l1
loop_2096:
	edge16l	%l0,	%o0,	%o2
	fmovscs	%icc,	%f29,	%f12
	andn	%g3,	0x0909,	%o3
	fsrc2	%f6,	%f0
	array8	%i0,	%o1,	%i7
	sllx	%l4,	%o7,	%g2
	fcmpne16	%f22,	%f28,	%i5
	fmovsleu	%icc,	%f16,	%f6
	andncc	%i2,	%g5,	%l6
	ldub	[%l7 + 0x37],	%g6
	movrlez	%g1,	%o5,	%l5
	addccc	%l2,	0x1EB9,	%i4
	movrlez	%g7,	0x0F2,	%g4
	ldstub	[%l7 + 0x57],	%i1
	udiv	%i6,	0x16A1,	%o6
	te	%icc,	0x1
	movle	%xcc,	%i3,	%o4
	smul	%l3,	0x05AA,	%l0
	tsubcctv	%o0,	%o2,	%g3
	addcc	%o3,	%i0,	%o1
	tsubcctv	%i7,	0x06BB,	%l1
	te	%icc,	0x6
	alignaddrl	%l4,	%g2,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%o7
	lduw	[%l7 + 0x44],	%l6
	set	0x64, %o1
	ldsha	[%l7 + %o1] 0x19,	%g6
	and	%g1,	%g5,	%o5
	movrgz	%l5,	%l2,	%i4
	nop
	fitos	%f7,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f0
	tneg	%xcc,	0x5
	movcc	%icc,	%g7,	%i1
	bn	loop_2097
	umul	%g4,	0x1855,	%i6
	movgu	%icc,	%i3,	%o4
	ld	[%l7 + 0x50],	%f22
loop_2097:
	fba,a	%fcc0,	loop_2098
	addc	%o6,	0x1F9A,	%l3
	movne	%xcc,	%l0,	%o2
	addc	%o0,	%g3,	%i0
loop_2098:
	fnot2	%f4,	%f18
	movne	%xcc,	%o1,	%i7
	set	0x10, %l1
	swapa	[%l7 + %l1] 0x0c,	%o3
	tsubcctv	%l1,	0x1702,	%l4
	movre	%i5,	%i2,	%g2
	fba	%fcc0,	loop_2099
	andncc	%o7,	%g6,	%g1
	fmovdpos	%xcc,	%f8,	%f1
	sth	%l6,	[%l7 + 0x16]
loop_2099:
	ldub	[%l7 + 0x37],	%g5
	tsubcc	%o5,	%l2,	%l5
	fmovrsgez	%i4,	%f27,	%f4
	movne	%xcc,	%g7,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc3,	loop_2100
	nop
	setx	0xF0593E84,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	sdiv	%i1,	0x13E6,	%i3
	swap	[%l7 + 0x28],	%o4
loop_2100:
	bneg,pt	%icc,	loop_2101
	ldub	[%l7 + 0x70],	%i6
	fbul	%fcc3,	loop_2102
	movrgez	%l3,	%l0,	%o6
loop_2101:
	tneg	%xcc,	0x0
	nop
	setx	0xD978C7AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x06DED55A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f4,	%f31
loop_2102:
	tcc	%xcc,	0x7
	edge32n	%o2,	%g3,	%o0
	tcs	%xcc,	0x1
	stb	%o1,	[%l7 + 0x19]
	set	0x58, %g5
	ldswa	[%l7 + %g5] 0x81,	%i0
	tvc	%xcc,	0x2
	nop
	setx	0x484017548C1F7BEB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f28
	flush	%l7 + 0x38
	movgu	%xcc,	%o3,	%i7
	tgu	%icc,	0x1
	ta	%xcc,	0x7
	bn,a	loop_2103
	tcc	%xcc,	0x7
	tvs	%icc,	0x6
	xor	%l4,	0x1726,	%i5
loop_2103:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x20] %asi,	%i2
	subcc	%l1,	%o7,	%g6
	orncc	%g1,	%l6,	%g5
	st	%f29,	[%l7 + 0x58]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0E8A,	%g2
	umulcc	%l2,	0x0E6A,	%l5
	edge8	%o5,	%g7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x6D],	%i1
	fmovdle	%icc,	%f31,	%f0
	movcs	%icc,	%g4,	%o4
	bneg,a,pt	%icc,	loop_2104
	udivx	%i6,	0x1926,	%l3
	movrne	%i3,	0x286,	%l0
	sll	%o2,	0x16,	%g3
loop_2104:
	udiv	%o6,	0x07AF,	%o0
	srl	%o1,	%i0,	%i7
	fbul,a	%fcc0,	loop_2105
	edge32n	%o3,	%l4,	%i5
	tl	%icc,	0x5
	sdivx	%i2,	0x0F82,	%o7
loop_2105:
	nop
	setx	0xE528D20A8F3F0E2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x30A69BC34C524680,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f0,	%f2
	fpack32	%f16,	%f30,	%f0
	fpadd32s	%f22,	%f11,	%f25
	movne	%xcc,	%l1,	%g6
	movne	%icc,	%l6,	%g5
	movgu	%xcc,	%g2,	%g1
	array8	%l2,	%o5,	%g7
	edge8ln	%l5,	%i4,	%g4
	move	%xcc,	%o4,	%i1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l3,	%i3
	nop
	fitos	%f9,	%f29
	fstox	%f29,	%f14
	or	%l0,	0x1D3F,	%o2
	fcmple16	%f30,	%f6,	%i6
	umul	%g3,	%o6,	%o1
	nop
	set	0x20, %i1
	stx	%i0,	[%l7 + %i1]
	orn	%o0,	%o3,	%i7
	sllx	%l4,	0x04,	%i2
	lduh	[%l7 + 0x52],	%i5
	bvc	loop_2106
	umulcc	%o7,	%l1,	%g6
	movge	%icc,	%l6,	%g5
	edge16	%g2,	%l2,	%o5
loop_2106:
	or	%g1,	0x0B8D,	%g7
	array16	%i4,	%g4,	%l5
	fmovrdgz	%i1,	%f10,	%f26
	fone	%f26
	nop
	setx	0xD449C15A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x648FCB7D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f29,	%f0
	st	%f23,	[%l7 + 0x44]
	nop
	setx	0xB075715C,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fpadd16	%f28,	%f26,	%f22
	tcs	%icc,	0x7
	fmovrde	%o4,	%f26,	%f10
	fcmpeq32	%f26,	%f20,	%i3
	fmovdl	%icc,	%f10,	%f21
	stbar
	tg	%icc,	0x2
	tvc	%icc,	0x2
	set	0x42, %g1
	lduha	[%l7 + %g1] 0x04,	%l0
	fnot1s	%f2,	%f7
	smul	%o2,	%i6,	%l3
	tge	%icc,	0x7
	sdivcc	%g3,	0x1FA2,	%o6
	movcs	%xcc,	%i0,	%o1
	movrne	%o0,	0x13C,	%i7
	movrgz	%l4,	%i2,	%o3
	ta	%icc,	0x0
	fbn	%fcc1,	loop_2107
	fbu	%fcc1,	loop_2108
	brgez,a	%o7,	loop_2109
	sth	%i5,	[%l7 + 0x22]
loop_2107:
	and	%g6,	%l1,	%g5
loop_2108:
	ba,pt	%xcc,	loop_2110
loop_2109:
	fnot1	%f10,	%f14
	call	loop_2111
	nop
	setx	loop_2112,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2110:
	umulcc	%g2,	%l2,	%o5
	umulcc	%g1,	0x1816,	%g7
loop_2111:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2112:
	movrlz	%l6,	%i4,	%g4
	nop
	set	0x0E, %i7
	lduh	[%l7 + %i7],	%i1
	xnorcc	%l5,	0x0702,	%i3
	edge8ln	%o4,	%o2,	%l0
	movre	%i6,	%g3,	%l3
	mulscc	%i0,	%o6,	%o1
	edge16ln	%o0,	%l4,	%i7
	movrlz	%o3,	%o7,	%i5
	tn	%icc,	0x1
	fbue,a	%fcc1,	loop_2113
	smulcc	%i2,	0x11F3,	%g6
	movrlez	%l1,	%g5,	%g2
	movrgz	%o5,	0x0CE,	%g1
loop_2113:
	tge	%xcc,	0x6
	or	%l2,	%g7,	%i4
	orncc	%l6,	%i1,	%g4
	srax	%l5,	%o4,	%o2
	tsubcc	%i3,	0x0AF0,	%l0
	fandnot2	%f30,	%f24,	%f16
	andncc	%g3,	%i6,	%l3
	tcs	%icc,	0x4
	edge8l	%o6,	%i0,	%o1
	tvs	%xcc,	0x0
	nop
	setx	0x90418EE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	fnot1	%f0,	%f6
	brnz	%o0,	loop_2114
	mova	%xcc,	%l4,	%i7
	udivx	%o7,	0x1996,	%o3
	movle	%icc,	%i5,	%i2
loop_2114:
	edge8l	%l1,	%g6,	%g5
	fsrc2s	%f8,	%f6
	tcs	%xcc,	0x4
	edge32	%o5,	%g2,	%l2
	tcs	%xcc,	0x4
	set	0x22, %o6
	ldsba	[%l7 + %o6] 0x81,	%g7
	fble	%fcc2,	loop_2115
	call	loop_2116
	tg	%icc,	0x6
	andn	%i4,	0x14D0,	%g1
loop_2115:
	tn	%icc,	0x5
loop_2116:
	array32	%i1,	%g4,	%l5
	sdivcc	%o4,	0x12E7,	%l6
	smul	%i3,	0x0235,	%l0
	bl,a,pt	%icc,	loop_2117
	bpos	%xcc,	loop_2118
	fpadd32s	%f27,	%f23,	%f12
	sdiv	%o2,	0x1438,	%i6
loop_2117:
	edge32l	%g3,	%l3,	%i0
loop_2118:
	xor	%o1,	0x1AD6,	%o6
	tgu	%icc,	0x0
	taddcc	%l4,	0x161A,	%i7
	alignaddr	%o7,	%o0,	%o3
	fandnot2s	%f15,	%f21,	%f9
	bcs	%xcc,	loop_2119
	srl	%i2,	%l1,	%g6
	bge,pn	%icc,	loop_2120
	brlez,a	%i5,	loop_2121
loop_2119:
	fandnot1s	%f31,	%f27,	%f24
	smulcc	%g5,	%g2,	%o5
loop_2120:
	edge32n	%g7,	%l2,	%g1
loop_2121:
	umul	%i1,	0x09EC,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l5,	0x001A,	%o4
	movpos	%xcc,	%i4,	%l6
	fmovdcs	%xcc,	%f2,	%f13
	fone	%f18
	sdiv	%i3,	0x1B1E,	%l0
	movvs	%xcc,	%i6,	%g3
	set	0x36, %i5
	lduba	[%l7 + %i5] 0x11,	%o2
	nop
	setx	0xD5287BFCE05D862B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	tvc	%icc,	0x0
	fcmpeq32	%f4,	%f24,	%l3
	fba	%fcc2,	loop_2122
	srax	%o1,	%i0,	%o6
	fmovrdne	%i7,	%f4,	%f28
	brlz	%o7,	loop_2123
loop_2122:
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f10
	udivcc	%l4,	0x05F3,	%o3
	smulcc	%o0,	%i2,	%g6
loop_2123:
	ldx	[%l7 + 0x08],	%i5
	fmul8ulx16	%f0,	%f10,	%f14
	addc	%l1,	0x0BEC,	%g2
	movvc	%xcc,	%g5,	%g7
	taddcctv	%l2,	0x04FA,	%o5
	ldsw	[%l7 + 0x20],	%i1
	edge8ln	%g4,	%g1,	%o4
	smul	%i4,	0x1AB2,	%l6
	movne	%xcc,	%l5,	%i3
	srlx	%i6,	0x12,	%l0
	movl	%xcc,	%g3,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc2,	loop_2124
	udiv	%o1,	0x083F,	%o2
	edge32n	%o6,	%i7,	%o7
	be,a,pn	%xcc,	loop_2125
loop_2124:
	edge8ln	%l4,	%o3,	%o0
	tge	%icc,	0x6
	ldd	[%l7 + 0x40],	%i0
loop_2125:
	fxnor	%f0,	%f12,	%f16
	movre	%g6,	%i2,	%l1
	orncc	%i5,	0x148C,	%g5
	andn	%g7,	0x04E1,	%g2
	addc	%l2,	0x1BF9,	%i1
	nop
	setx	0x4879C9EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f30
	ldx	[%l7 + 0x58],	%o5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x24] %asi,	%f4
	subc	%g4,	0x0E0B,	%g1
	fmovdvc	%icc,	%f25,	%f11
	alignaddrl	%i4,	%o4,	%l5
	stb	%i3,	[%l7 + 0x5D]
	fbg	%fcc2,	loop_2126
	orn	%l6,	0x18CE,	%l0
	subc	%g3,	%i6,	%o1
	xnorcc	%o2,	0x0AA1,	%l3
loop_2126:
	fcmple16	%f28,	%f4,	%i7
	for	%f30,	%f30,	%f18
	edge32ln	%o6,	%l4,	%o3
	andncc	%o0,	%i0,	%g6
	umulcc	%i2,	%l1,	%o7
	array16	%i5,	%g7,	%g2
	edge8n	%l2,	%i1,	%g5
	tge	%xcc,	0x2
	ble,a,pt	%xcc,	loop_2127
	nop
	setx loop_2128, %l0, %l1
	jmpl %l1, %g4
	nop
	setx	0xF7211B3D19AC570C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE402175EC5A6CCBE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f8,	%f2
	edge16	%o5,	%i4,	%g1
loop_2127:
	fexpand	%f0,	%f26
loop_2128:
	and	%l5,	%o4,	%i3
	ldub	[%l7 + 0x7A],	%l6
	xor	%g3,	%l0,	%i6
	movrlz	%o1,	%l3,	%o2
	fmovs	%f1,	%f19
	stbar
	edge8l	%o6,	%i7,	%o3
	movn	%icc,	%l4,	%o0
	set	0x220, %i2
	ldxa	[%g0 + %i2] 0x52,	%g6
	sub	%i0,	%l1,	%i2
	fbne,a	%fcc1,	loop_2129
	bge,a,pn	%xcc,	loop_2130
	nop
	setx	0x2382B9D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x029487FA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f8,	%f27
	array16	%i5,	%g7,	%o7
loop_2129:
	fandnot2	%f8,	%f22,	%f2
loop_2130:
	movleu	%icc,	%l2,	%i1
	fpmerge	%f16,	%f12,	%f28
	tle	%icc,	0x3
	fbg,a	%fcc0,	loop_2131
	movrlz	%g5,	0x3E2,	%g4
	movrgz	%o5,	%g2,	%g1
	nop
	fitos	%f1,	%f31
	fstoi	%f31,	%f19
loop_2131:
	tleu	%xcc,	0x3
	fmovdcs	%xcc,	%f1,	%f17
	movne	%icc,	%i4,	%o4
	brgez,a	%i3,	loop_2132
	tneg	%icc,	0x5
	edge32n	%l5,	%l6,	%g3
	fmovdvs	%icc,	%f21,	%f23
loop_2132:
	nop
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f16
	movle	%xcc,	%l0,	%i6
	umul	%o1,	%o2,	%l3
	edge32	%i7,	%o3,	%l4
	xnor	%o6,	%o0,	%g6
	alignaddrl	%i0,	%i2,	%l1
	addccc	%g7,	0x1E9F,	%o7
	movcc	%xcc,	%i5,	%i1
	addcc	%l2,	0x19DB,	%g5
	st	%f19,	[%l7 + 0x60]
	add	%g4,	%o5,	%g2
	fmovda	%xcc,	%f30,	%f30
	fnot1s	%f25,	%f22
	tneg	%xcc,	0x5
	movleu	%xcc,	%g1,	%i4
	movcc	%xcc,	%o4,	%i3
	fand	%f6,	%f10,	%f28
	ldsw	[%l7 + 0x58],	%l5
	for	%f18,	%f26,	%f24
	ldsb	[%l7 + 0x38],	%g3
	movrne	%l6,	%i6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x6C],	%o2
	stbar
	fbul,a	%fcc1,	loop_2133
	movpos	%icc,	%o1,	%i7
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o3
loop_2133:
	fandnot2	%f16,	%f18,	%f28
	fnor	%f28,	%f6,	%f16
	fmovsvc	%icc,	%f25,	%f16
	mova	%icc,	%l3,	%l4
	srl	%o6,	%o0,	%g6
	taddcctv	%i2,	0x04A0,	%l1
	fnor	%f8,	%f0,	%f22
	tpos	%icc,	0x7
	movneg	%icc,	%g7,	%i0
	andcc	%o7,	0x0A71,	%i1
	wr	%g0,	0x27,	%asi
	stwa	%l2,	[%l7 + 0x3C] %asi
	membar	#Sync
	fmovscc	%icc,	%f12,	%f4
	edge8ln	%g5,	%i5,	%g4
	alignaddr	%o5,	%g2,	%g1
	alignaddrl	%o4,	%i3,	%i4
	sra	%g3,	%l6,	%i6
	fand	%f18,	%f12,	%f18
	tge	%xcc,	0x2
	taddcc	%l5,	%l0,	%o2
	bgu,a	loop_2134
	fmovrde	%o1,	%f18,	%f6
	fnot1s	%f30,	%f0
	edge8n	%o3,	%i7,	%l3
loop_2134:
	sdivcc	%o6,	0x10A0,	%l4
	srax	%o0,	%i2,	%l1
	and	%g7,	%i0,	%g6
	fsrc2s	%f22,	%f10
	fnors	%f16,	%f20,	%f5
	movvs	%icc,	%o7,	%i1
	addcc	%l2,	0x03FD,	%i5
	te	%xcc,	0x1
	be,pn	%icc,	loop_2135
	tvc	%icc,	0x6
	udiv	%g4,	0x1310,	%g5
	addccc	%g2,	%o5,	%g1
loop_2135:
	for	%f2,	%f10,	%f30
	mulx	%i3,	%i4,	%g3
	sll	%o4,	%i6,	%l5
	tgu	%xcc,	0x7
	nop
	fitos	%f7,	%f12
	fstox	%f12,	%f28
	stbar
	fpsub16	%f6,	%f22,	%f10
	brnz	%l6,	loop_2136
	sll	%o2,	0x11,	%l0
	call	loop_2137
	edge16l	%o1,	%o3,	%l3
loop_2136:
	brnz	%o6,	loop_2138
	addc	%l4,	%i7,	%o0
loop_2137:
	move	%xcc,	%i2,	%g7
	fmovspos	%icc,	%f2,	%f23
loop_2138:
	nop
	wr	%g0,	0xe3,	%asi
	stba	%i0,	[%l7 + 0x4B] %asi
	membar	#Sync
	fmovdg	%icc,	%f5,	%f7
	tleu	%xcc,	0x6
	bcc	%xcc,	loop_2139
	tvc	%icc,	0x0
	fcmpne16	%f26,	%f28,	%l1
	sir	0x16FD
loop_2139:
	tvs	%icc,	0x5
	xnorcc	%o7,	%g6,	%i1
	stb	%l2,	[%l7 + 0x26]
	fbe,a	%fcc3,	loop_2140
	array8	%i5,	%g5,	%g4
	ldsw	[%l7 + 0x18],	%g2
	ldstub	[%l7 + 0x0F],	%g1
loop_2140:
	andncc	%o5,	%i4,	%i3
	edge32n	%o4,	%g3,	%l5
	fbo	%fcc2,	loop_2141
	tcc	%icc,	0x3
	sdivcc	%l6,	0x0456,	%i6
	array8	%o2,	%l0,	%o1
loop_2141:
	brlez	%l3,	loop_2142
	fbe	%fcc1,	loop_2143
	fpadd32s	%f15,	%f7,	%f15
	tcs	%xcc,	0x6
loop_2142:
	sra	%o6,	0x0F,	%l4
loop_2143:
	edge32ln	%i7,	%o3,	%i2
	fnot2	%f8,	%f18
	brz	%o0,	loop_2144
	orcc	%i0,	0x04EC,	%l1
	taddcctv	%o7,	%g6,	%i1
	sethi	0x1C0F,	%l2
loop_2144:
	fbne,a	%fcc3,	loop_2145
	movne	%xcc,	%g7,	%g5
	tgu	%xcc,	0x3
	fmovdg	%xcc,	%f31,	%f21
loop_2145:
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f14
	fxtos	%f14,	%f5
	set	0x3D, %i0
	ldstuba	[%l7 + %i0] 0x88,	%g4
	mulx	%i5,	%g2,	%o5
	nop
	setx	0x660CEC5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f26
	bpos,pt	%icc,	loop_2146
	fpsub16s	%f20,	%f4,	%f20
	udivcc	%g1,	0x132C,	%i4
	movrgz	%i3,	0x168,	%g3
loop_2146:
	fmovsvs	%xcc,	%f17,	%f4
	st	%f16,	[%l7 + 0x6C]
	tle	%icc,	0x0
	fabss	%f27,	%f23
	umulcc	%l5,	%l6,	%o4
	edge32ln	%i6,	%l0,	%o1
	subccc	%o2,	0x0DE3,	%o6
	tpos	%icc,	0x2
	movg	%xcc,	%l4,	%l3
	movge	%icc,	%i7,	%i2
	xor	%o0,	%i0,	%o3
	tg	%icc,	0x0
	fmovrde	%l1,	%f4,	%f2
	te	%xcc,	0x7
	fbuge	%fcc2,	loop_2147
	mulscc	%o7,	0x12D5,	%g6
	array16	%i1,	%g7,	%g5
	movle	%icc,	%g4,	%i5
loop_2147:
	movre	%g2,	%l2,	%g1
	bgu,a,pt	%xcc,	loop_2148
	sdivx	%i4,	0x017D,	%o5
	fornot2	%f16,	%f18,	%f26
	fmovsge	%xcc,	%f1,	%f18
loop_2148:
	movleu	%xcc,	%g3,	%l5
	array8	%i3,	%l6,	%i6
	fmovdneg	%icc,	%f12,	%f17
	nop
	setx	loop_2149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlz,a	%o4,	loop_2150
	stx	%o1,	[%l7 + 0x48]
	fbue,a	%fcc1,	loop_2151
loop_2149:
	fpackfix	%f20,	%f23
loop_2150:
	fmuld8sux16	%f31,	%f27,	%f8
	taddcc	%o2,	%l0,	%o6
loop_2151:
	smul	%l4,	%l3,	%i7
	udivcc	%i2,	0x1688,	%i0
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f26
	bneg,pn	%xcc,	loop_2152
	or	%o0,	%l1,	%o7
	fors	%f26,	%f9,	%f25
	call	loop_2153
loop_2152:
	sir	0x0046
	fsrc1s	%f21,	%f1
	sdivx	%o3,	0x134D,	%i1
loop_2153:
	fpadd32	%f2,	%f10,	%f6
	te	%xcc,	0x6
	fbule,a	%fcc3,	loop_2154
	tvc	%icc,	0x3
	movrlez	%g6,	0x12C,	%g7
	fcmple16	%f30,	%f0,	%g5
loop_2154:
	xorcc	%g4,	%i5,	%l2
	fmovsa	%xcc,	%f13,	%f27
	fpack16	%f10,	%f5
	umul	%g2,	0x1D60,	%g1
	ble,a,pn	%icc,	loop_2155
	fpadd16s	%f20,	%f2,	%f29
	tvs	%xcc,	0x0
	fornot2	%f22,	%f30,	%f18
loop_2155:
	umul	%o5,	0x1E28,	%g3
	mulx	%i4,	%i3,	%l6
	addcc	%l5,	%i6,	%o1
	tvs	%xcc,	0x3
	fcmpne16	%f2,	%f26,	%o2
	bne,pt	%xcc,	loop_2156
	fmovscc	%xcc,	%f3,	%f12
	brgez,a	%o4,	loop_2157
	xor	%l0,	0x1EE2,	%l4
loop_2156:
	addccc	%o6,	%l3,	%i7
	tvs	%xcc,	0x5
loop_2157:
	nop
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x14,	%f8
	fbn,a	%fcc2,	loop_2158
	fors	%f30,	%f0,	%f3
	xorcc	%i0,	0x1B36,	%o0
	xorcc	%l1,	0x11BA,	%i2
loop_2158:
	edge32n	%o3,	%i1,	%g6
	edge16l	%o7,	%g7,	%g5
	fmul8sux16	%f14,	%f30,	%f4
	subccc	%g4,	0x0A48,	%i5
	fmovrsgez	%l2,	%f27,	%f13
	xnorcc	%g1,	%g2,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i4,	%g3
	movrlez	%l6,	0x287,	%l5
	fbn,a	%fcc2,	loop_2159
	bcs	loop_2160
	or	%i3,	0x1DC1,	%i6
	tsubcctv	%o2,	%o4,	%l0
loop_2159:
	bpos	loop_2161
loop_2160:
	stx	%o1,	[%l7 + 0x20]
	orncc	%l4,	0x0138,	%l3
	sdiv	%o6,	0x0D9F,	%i0
loop_2161:
	fmovdn	%xcc,	%f0,	%f20
	fmovrse	%i7,	%f14,	%f7
	ba,a,pt	%xcc,	loop_2162
	sdivcc	%o0,	0x1F7A,	%l1
	ta	%icc,	0x2
	xorcc	%i2,	0x062D,	%o3
loop_2162:
	taddcctv	%g6,	0x04FA,	%o7
	movge	%icc,	%g7,	%g5
	sir	0x15C5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%i5
	tcs	%icc,	0x3
	mulx	%l2,	%g4,	%g2
	or	%g1,	%i4,	%o5
	bg	loop_2163
	fpsub16	%f2,	%f0,	%f20
	move	%icc,	%g3,	%l6
	swap	[%l7 + 0x7C],	%i3
loop_2163:
	sdivx	%l5,	0x0DA2,	%i6
	nop
	fitos	%f11,	%f17
	fmovrslz	%o2,	%f30,	%f25
	edge32l	%l0,	%o4,	%l4
	sllx	%l3,	%o6,	%i0
	fors	%f24,	%f2,	%f16
	sllx	%i7,	%o0,	%o1
	set	0x2C, %o3
	stha	%i2,	[%l7 + %o3] 0x15
	edge32l	%l1,	%g6,	%o3
	fornot1	%f20,	%f10,	%f8
	srl	%g7,	0x0A,	%o7
	smulcc	%g5,	%i1,	%l2
	swap	[%l7 + 0x18],	%g4
	fbule	%fcc3,	loop_2164
	edge16n	%i5,	%g2,	%g1
	fmovdne	%xcc,	%f26,	%f24
	tgu	%icc,	0x5
loop_2164:
	fbu	%fcc2,	loop_2165
	mulscc	%i4,	0x1959,	%o5
	movrne	%l6,	%i3,	%g3
	udiv	%l5,	0x1F10,	%o2
loop_2165:
	brz	%l0,	loop_2166
	fmovsneg	%icc,	%f13,	%f7
	mulscc	%i6,	%l4,	%o4
	brgez	%o6,	loop_2167
loop_2166:
	sdivcc	%i0,	0x1FA4,	%i7
	srlx	%o0,	%o1,	%i2
	edge8l	%l3,	%g6,	%l1
loop_2167:
	fnot1s	%f24,	%f13
	prefetch	[%l7 + 0x74],	 0x3
	tleu	%xcc,	0x3
	fbul,a	%fcc3,	loop_2168
	fmul8x16au	%f27,	%f5,	%f20
	nop
	setx	0xF3B6B3B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x4E2A18A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f14,	%f31
	membar	0x18
loop_2168:
	sll	%g7,	%o3,	%g5
	tneg	%xcc,	0x2
	wr	%g0,	0xea,	%asi
	stha	%i1,	[%l7 + 0x62] %asi
	membar	#Sync
	tne	%xcc,	0x1
	tvc	%icc,	0x2
	andn	%o7,	%g4,	%l2
	fmovsne	%icc,	%f30,	%f21
	mulx	%g2,	%i5,	%g1
	te	%xcc,	0x3
	nop
	setx	0x44E58C178BBE9B6E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x264EF15B22F81860,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f24,	%f4
	nop
	setx loop_2169, %l0, %l1
	jmpl %l1, %i4
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f5
	addc	%l6,	0x03BB,	%o5
	addccc	%g3,	0x0FA0,	%i3
loop_2169:
	subccc	%o2,	%l0,	%l5
	sth	%l4,	[%l7 + 0x60]
	fpsub32s	%f5,	%f11,	%f5
	movre	%o4,	0x3D1,	%o6
	subc	%i0,	0x082A,	%i7
	set	0x5C, %l5
	lduwa	[%l7 + %l5] 0x89,	%o0
	membar	0x58
	brnz,a	%i6,	loop_2170
	fmul8x16al	%f3,	%f19,	%f6
	xnorcc	%i2,	%l3,	%o1
	bvc,a	%icc,	loop_2171
loop_2170:
	srax	%l1,	0x06,	%g7
	edge32l	%o3,	%g5,	%i1
	fmovsvs	%xcc,	%f2,	%f13
loop_2171:
	nop
	setx	0xF375B4C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x714F1DAA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f20,	%f21
	fornot2s	%f28,	%f1,	%f5
	fmovdvs	%xcc,	%f23,	%f27
	fbule	%fcc0,	loop_2172
	tcs	%icc,	0x0
	fpadd32	%f2,	%f4,	%f12
	bpos	%xcc,	loop_2173
loop_2172:
	fba	%fcc2,	loop_2174
	movre	%o7,	0x2C8,	%g6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l2,	%g2
loop_2173:
	or	%g4,	%g1,	%i5
loop_2174:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x39],	%l6
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%o5
	edge16n	%g3,	%i3,	%o2
	bleu	%icc,	loop_2175
	srlx	%i4,	0x0B,	%l0
	ta	%xcc,	0x7
	movre	%l5,	%l4,	%o4
loop_2175:
	te	%xcc,	0x2
	prefetch	[%l7 + 0x20],	 0x2
	fcmpne32	%f20,	%f14,	%i0
	prefetch	[%l7 + 0x4C],	 0x2
	sra	%i7,	%o0,	%o6
	orn	%i2,	0x0E64,	%i6
	stx	%o1,	[%l7 + 0x08]
	udiv	%l1,	0x15FA,	%l3
	array32	%g7,	%g5,	%o3
	edge32l	%i1,	%o7,	%g6
	ldsh	[%l7 + 0x64],	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g4,	%g1,	%g2
	andcc	%i5,	%l6,	%o5
	fmovrdlz	%i3,	%f6,	%f28
	tn	%icc,	0x1
	fbn,a	%fcc2,	loop_2176
	tneg	%xcc,	0x7
	andncc	%g3,	%o2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2176:
	fnegd	%f20,	%f4
	umulcc	%l5,	%l0,	%o4
	srax	%i0,	0x02,	%l4
	nop
	setx	0x47B356DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x3DB518CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f18,	%f16
	nop
	fitos	%f9,	%f5
	fstox	%f5,	%f24
	fxtos	%f24,	%f30
	fpadd16	%f6,	%f20,	%f4
	mulscc	%i7,	0x1918,	%o6
	sdivx	%o0,	0x060A,	%i2
	fmovsle	%xcc,	%f0,	%f0
	sllx	%i6,	0x14,	%o1
	edge16l	%l3,	%g7,	%l1
	fbue,a	%fcc0,	loop_2177
	bcs,a	%icc,	loop_2178
	fmovde	%xcc,	%f30,	%f20
	xor	%g5,	0x0C11,	%o3
loop_2177:
	tvc	%icc,	0x5
loop_2178:
	membar	0x33
	popc	%i1,	%o7
	sllx	%g6,	%g4,	%l2
	ld	[%l7 + 0x58],	%f17
	orncc	%g1,	%i5,	%g2
	tpos	%icc,	0x2
	umul	%l6,	%i3,	%g3
	te	%xcc,	0x1
	fnot2	%f22,	%f20
	andn	%o2,	%i4,	%o5
	edge16l	%l5,	%l0,	%o4
	movgu	%xcc,	%l4,	%i0
	sdivx	%i7,	0x1E84,	%o6
	tpos	%icc,	0x4
	bn,pt	%xcc,	loop_2179
	fpackfix	%f18,	%f9
	movge	%xcc,	%o0,	%i2
	brnz,a	%o1,	loop_2180
loop_2179:
	fpadd16s	%f31,	%f24,	%f16
	wr	%g0,	0x88,	%asi
	sta	%f16,	[%l7 + 0x0C] %asi
loop_2180:
	tsubcctv	%i6,	0x0635,	%g7
	brlz	%l1,	loop_2181
	sra	%g5,	0x1F,	%o3
	sir	0x1372
	sdiv	%i1,	0x0682,	%o7
loop_2181:
	movvs	%icc,	%l3,	%g6
	fzeros	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f17,	%f13
	brlez	%l2,	loop_2182
	fmovrdgez	%g1,	%f26,	%f0
	movrne	%i5,	0x19B,	%g4
	edge16l	%g2,	%i3,	%l6
loop_2182:
	brz	%g3,	loop_2183
	subcc	%i4,	%o2,	%o5
	andncc	%l0,	%l5,	%l4
	fxors	%f10,	%f19,	%f18
loop_2183:
	ba,pn	%xcc,	loop_2184
	mulscc	%o4,	0x1602,	%i0
	edge8	%i7,	%o0,	%o6
	alignaddrl	%i2,	%o1,	%i6
loop_2184:
	fnand	%f0,	%f14,	%f8
	edge16ln	%l1,	%g7,	%o3
	mulx	%i1,	0x1D9E,	%g5
	move	%icc,	%o7,	%l3
	sub	%g6,	0x0E57,	%l2
	mulx	%g1,	%g4,	%i5
	fmovrdgz	%i3,	%f10,	%f26
	taddcctv	%l6,	0x18E7,	%g3
	fmovdn	%icc,	%f24,	%f9
	edge16n	%g2,	%o2,	%i4
	taddcctv	%l0,	0x0916,	%o5
	edge16l	%l5,	%o4,	%l4
	subc	%i7,	%i0,	%o6
	ta	%xcc,	0x4
	srlx	%i2,	0x0E,	%o0
	tn	%icc,	0x7
	tn	%xcc,	0x5
	taddcc	%o1,	%l1,	%i6
	addc	%o3,	%g7,	%i1
	udivx	%o7,	0x00D8,	%g5
	tg	%xcc,	0x4
	fbule	%fcc0,	loop_2185
	tvc	%xcc,	0x5
	movn	%xcc,	%l3,	%l2
	tne	%xcc,	0x0
loop_2185:
	stw	%g1,	[%l7 + 0x60]
	orcc	%g6,	%g4,	%i5
	wr	%g0,	0x18,	%asi
	stha	%l6,	[%l7 + 0x1A] %asi
	tsubcctv	%g3,	0x0E57,	%i3
	stw	%o2,	[%l7 + 0x40]
	movge	%xcc,	%g2,	%i4
	fbue,a	%fcc3,	loop_2186
	fcmpne16	%f24,	%f16,	%o5
	fmuld8sux16	%f28,	%f23,	%f10
	tle	%icc,	0x3
loop_2186:
	tcc	%icc,	0x3
	tsubcctv	%l0,	0x1573,	%o4
	fmovsa	%icc,	%f2,	%f12
	tcs	%icc,	0x5
	fbg,a	%fcc2,	loop_2187
	movpos	%icc,	%l4,	%l5
	fmovdg	%xcc,	%f10,	%f6
	bcc	loop_2188
loop_2187:
	udiv	%i7,	0x02C1,	%i0
	smul	%i2,	0x1C0C,	%o0
	fmovdvs	%icc,	%f25,	%f6
loop_2188:
	tcs	%icc,	0x1
	fmovrsne	%o6,	%f29,	%f11
	sub	%l1,	%o1,	%o3
	udiv	%g7,	0x0C3B,	%i1
	fmovdl	%icc,	%f29,	%f1
	tl	%icc,	0x4
	movgu	%icc,	%o7,	%i6
	movre	%g5,	%l3,	%g1
	wr	%g0,	0x10,	%asi
	sta	%f22,	[%l7 + 0x70] %asi
	fmovdge	%icc,	%f10,	%f18
	fxor	%f22,	%f6,	%f26
	fble	%fcc0,	loop_2189
	subcc	%l2,	0x07EF,	%g4
	movleu	%xcc,	%g6,	%l6
	tsubcctv	%i5,	%g3,	%o2
loop_2189:
	fbu,a	%fcc2,	loop_2190
	edge8	%g2,	%i3,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f26,	%f2,	%f2
loop_2190:
	sub	%l0,	0x0EF8,	%o5
	and	%l4,	0x1157,	%o4
	membar	0x39
	nop
	setx	0x8FE18B8A70651B4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	subc	%l5,	0x1024,	%i7
	fmovsa	%xcc,	%f19,	%f6
	bge,a,pn	%xcc,	loop_2191
	movn	%icc,	%i2,	%i0
	wr	%g0,	0xea,	%asi
	stwa	%o6,	[%l7 + 0x2C] %asi
	membar	#Sync
loop_2191:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o0
	set	0x44, %l2
	swapa	[%l7 + %l2] 0x19,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	0x0A52,	%g7
	and	%i1,	0x1CC7,	%o7
	nop
	set	0x40, %i6
	stw	%g5,	[%l7 + %i6]
	ldub	[%l7 + 0x0D],	%i6
	andn	%g1,	%l2,	%g4
	bgu,a	%xcc,	loop_2192
	sir	0x1D42
	tle	%xcc,	0x2
	fpsub32s	%f22,	%f31,	%f17
loop_2192:
	movgu	%xcc,	%g6,	%l3
	ldd	[%l7 + 0x58],	%i6
	xor	%i5,	0x1DEF,	%g3
	ta	%xcc,	0x1
	mova	%xcc,	%g2,	%i3
	bl,a,pn	%icc,	loop_2193
	andn	%i4,	%l0,	%o2
	fsrc2	%f18,	%f4
	tneg	%icc,	0x6
loop_2193:
	tneg	%xcc,	0x1
	nop
	setx	loop_2194,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldstub	[%l7 + 0x16],	%o5
	fbe,a	%fcc0,	loop_2195
	tn	%xcc,	0x5
loop_2194:
	tcc	%icc,	0x1
	fbue	%fcc3,	loop_2196
loop_2195:
	movcc	%xcc,	%l4,	%o4
	movn	%xcc,	%i7,	%l5
	udivx	%i2,	0x12CA,	%i0
loop_2196:
	sll	%o6,	%o0,	%l1
	wr	%g0,	0x80,	%asi
	sta	%f26,	[%l7 + 0x64] %asi
	udivcc	%o1,	0x0F66,	%g7
	movl	%icc,	%i1,	%o7
	for	%f22,	%f22,	%f24
	tcc	%icc,	0x0
	sdivx	%o3,	0x1538,	%i6
	sub	%g5,	0x1995,	%g1
	edge16	%l2,	%g4,	%l3
	fmul8x16	%f9,	%f22,	%f4
	tpos	%xcc,	0x7
	brgez	%g6,	loop_2197
	subcc	%i5,	%g3,	%g2
	edge32l	%i3,	%l6,	%l0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
loop_2197:
	ldd	[%l7 + 0x20],	%f4
	edge8l	%o2,	%o5,	%l4
	orn	%i7,	0x0FF3,	%l5
	stx	%i2,	[%l7 + 0x60]
	taddcc	%i0,	0x121D,	%o6
	tle	%xcc,	0x3
	movge	%xcc,	%o4,	%o0
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0x0
	udivcc	%g7,	0x0DFD,	%l1
	tpos	%xcc,	0x4
	addcc	%o7,	0x159D,	%i1
	addccc	%o3,	0x0231,	%g5
	edge8l	%g1,	%i6,	%l2
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x27,	%g4
	tneg	%xcc,	0x3
	xor	%l3,	%i5,	%g3
	subc	%g2,	0x1866,	%i3
	orn	%g6,	%l0,	%i4
	sdivx	%l6,	0x0936,	%o2
	edge32ln	%l4,	%i7,	%o5
	tgu	%icc,	0x6
	udiv	%l5,	0x1D08,	%i0
	mulx	%i2,	0x04B2,	%o6
	srax	%o4,	%o0,	%g7
	addcc	%l1,	0x030E,	%o7
	fandnot2	%f24,	%f26,	%f0
	fmovsgu	%xcc,	%f28,	%f28
	subccc	%i1,	%o1,	%o3
	membar	0x00
	fornot2s	%f20,	%f2,	%f24
	array32	%g5,	%g1,	%l2
	andncc	%g4,	%i6,	%l3
	tl	%xcc,	0x5
	sll	%i5,	0x0D,	%g3
	movre	%i3,	0x31F,	%g6
	move	%xcc,	%g2,	%l0
	orn	%l6,	0x1A66,	%i4
	fbl	%fcc3,	loop_2198
	fbo	%fcc3,	loop_2199
	fbuge,a	%fcc3,	loop_2200
	sra	%l4,	%i7,	%o2
loop_2198:
	mova	%icc,	%l5,	%i0
loop_2199:
	movvc	%xcc,	%i2,	%o5
loop_2200:
	fbg,a	%fcc0,	loop_2201
	edge8ln	%o6,	%o4,	%o0
	array8	%g7,	%o7,	%l1
	nop
	fitos	%f9,	%f6
	fstox	%f6,	%f12
loop_2201:
	fnegd	%f24,	%f0
	orn	%i1,	%o3,	%g5
	nop
	fitos	%f15,	%f4
	array32	%g1,	%l2,	%g4
	add	%i6,	%o1,	%l3
	edge8ln	%g3,	%i5,	%i3
	fbe	%fcc3,	loop_2202
	orcc	%g2,	%l0,	%g6
	movcc	%icc,	%i4,	%l6
	edge8n	%l4,	%i7,	%l5
loop_2202:
	bneg	loop_2203
	umul	%o2,	0x1106,	%i2
	umul	%o5,	%o6,	%i0
	nop
	setx loop_2204, %l0, %l1
	jmpl %l1, %o4
loop_2203:
	tsubcc	%o0,	0x14B2,	%g7
	nop
	setx	loop_2205,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%l1,	%o7,	%o3
loop_2204:
	fmovsge	%xcc,	%f1,	%f18
	ldub	[%l7 + 0x3B],	%g5
loop_2205:
	bvs,a,pn	%xcc,	loop_2206
	movg	%xcc,	%i1,	%l2
	fbu	%fcc3,	loop_2207
	brgz,a	%g1,	loop_2208
loop_2206:
	movvc	%xcc,	%i6,	%o1
	fsrc2	%f10,	%f28
loop_2207:
	alignaddrl	%l3,	%g4,	%g3
loop_2208:
	sdivx	%i3,	0x056B,	%i5
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f27
	fmovrslez	%l0,	%f11,	%f4
	sllx	%g2,	%g6,	%l6
	set	0x67, %l6
	ldstuba	[%l7 + %l6] 0x81,	%i4
	fbe,a	%fcc3,	loop_2209
	movgu	%xcc,	%i7,	%l4
	sdivx	%l5,	0x035C,	%i2
	ta	%xcc,	0x5
loop_2209:
	te	%xcc,	0x0
	edge8ln	%o5,	%o6,	%i0
	edge16ln	%o4,	%o0,	%g7
	fnands	%f14,	%f25,	%f24
	nop
	fitod	%f10,	%f0
	fdtos	%f0,	%f21
	bcs	%xcc,	loop_2210
	movvc	%icc,	%l1,	%o2
	edge32ln	%o7,	%o3,	%i1
	movrne	%l2,	0x0AC,	%g5
loop_2210:
	brlz,a	%g1,	loop_2211
	edge8	%i6,	%l3,	%g4
	tleu	%icc,	0x2
	taddcc	%o1,	%i3,	%g3
loop_2211:
	orcc	%i5,	%l0,	%g6
	tne	%xcc,	0x2
	movcc	%icc,	%l6,	%g2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	taddcctv	%i7,	%l5,	%l4
	fble,a	%fcc0,	loop_2212
	subcc	%o5,	%o6,	%i0
	movrne	%o4,	%i2,	%o0
	fmovdcs	%xcc,	%f21,	%f29
loop_2212:
	tsubcc	%l1,	0x0FF4,	%g7
	fmovrslz	%o7,	%f21,	%f17
	set	0x49, %g2
	lduba	[%l7 + %g2] 0x10,	%o2
	fmovsle	%icc,	%f25,	%f21
	tge	%xcc,	0x5
	fnor	%f16,	%f14,	%f20
	stw	%i1,	[%l7 + 0x3C]
	brlez	%o3,	loop_2213
	tgu	%xcc,	0x4
	sethi	0x099C,	%g5
	fandnot1s	%f2,	%f17,	%f28
loop_2213:
	fbu,a	%fcc0,	loop_2214
	fnegd	%f24,	%f12
	smul	%g1,	%l2,	%i6
	mulscc	%l3,	%o1,	%g4
loop_2214:
	std	%f8,	[%l7 + 0x78]
	addc	%i3,	0x0DDD,	%g3
	edge32n	%i5,	%g6,	%l6
	fmovsge	%xcc,	%f0,	%f11
	set	0x53, %o4
	lduba	[%l7 + %o4] 0x14,	%l0
	orn	%g2,	0x19FB,	%i7
	ldub	[%l7 + 0x51],	%l5
	srl	%l4,	0x12,	%o5
	and	%i4,	%o6,	%o4
	fbuge,a	%fcc1,	loop_2215
	ble,pt	%icc,	loop_2216
	sdivx	%i2,	0x05C8,	%i0
	sllx	%o0,	0x04,	%l1
loop_2215:
	tpos	%icc,	0x1
loop_2216:
	movpos	%xcc,	%g7,	%o7
	bvc	%xcc,	loop_2217
	umulcc	%i1,	0x01B4,	%o2
	set	0x10, %l3
	stxa	%o3,	[%g0 + %l3] 0x21
loop_2217:
	orncc	%g1,	0x1166,	%g5
	set	0x0A, %i4
	ldstuba	[%l7 + %i4] 0x10,	%i6
	fandnot2	%f16,	%f10,	%f16
	fandnot2	%f20,	%f30,	%f6
	movre	%l3,	%l2,	%g4
	subccc	%i3,	%o1,	%i5
	bg,pn	%xcc,	loop_2218
	fpadd32	%f14,	%f4,	%f28
	fnegs	%f1,	%f24
	orn	%g6,	%l6,	%g3
loop_2218:
	edge32ln	%l0,	%g2,	%l5
	movcs	%xcc,	%i7,	%l4
	bgu	%icc,	loop_2219
	alignaddr	%o5,	%i4,	%o4
	edge8n	%o6,	%i0,	%i2
	movge	%xcc,	%l1,	%g7
loop_2219:
	fmul8sux16	%f2,	%f18,	%f6
	stx	%o7,	[%l7 + 0x48]
	edge16	%o0,	%i1,	%o2
	bshuffle	%f0,	%f16,	%f6
	tg	%icc,	0x5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o3,	%g5
	movl	%xcc,	%g1,	%l3
	fbge	%fcc3,	loop_2220
	sll	%i6,	%l2,	%g4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x40] %asi,	%f3
loop_2220:
	tgu	%xcc,	0x0
	movpos	%icc,	%o1,	%i3
	edge16ln	%i5,	%g6,	%g3
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x14] %asi
	movne	%icc,	%l6,	%g2
	umulcc	%l5,	0x18EF,	%l0
	stb	%l4,	[%l7 + 0x6C]
	bn,a,pn	%icc,	loop_2221
	subccc	%i7,	%o5,	%i4
	movleu	%icc,	%o4,	%i0
	nop
	fitos	%f8,	%f30
	fstoi	%f30,	%f21
loop_2221:
	fmovdleu	%xcc,	%f27,	%f23
	set	0x75, %o0
	stba	%o6,	[%l7 + %o0] 0x80
	sth	%i2,	[%l7 + 0x50]
	smulcc	%g7,	0x1B43,	%l1
	fxors	%f21,	%f26,	%f12
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f26
	fnor	%f10,	%f16,	%f28
	fcmpgt32	%f2,	%f22,	%o0
	andn	%i1,	0x16BD,	%o2
	subc	%o3,	0x1355,	%g5
	wr	%g0,	0x89,	%asi
	stwa	%g1,	[%l7 + 0x30] %asi
	tg	%icc,	0x7
	movcc	%icc,	%l3,	%o7
	srl	%i6,	%g4,	%o1
	srl	%i3,	0x1F,	%l2
	subc	%i5,	0x0953,	%g6
	edge8l	%g3,	%g2,	%l6
	set	0x50, %o2
	stxa	%l0,	[%l7 + %o2] 0x22
	membar	#Sync
	set	0x58, %o5
	ldstuba	[%l7 + %o5] 0x81,	%l5
	tl	%icc,	0x6
	fbn	%fcc2,	loop_2222
	array32	%i7,	%l4,	%i4
	movcc	%icc,	%o4,	%i0
	nop
	set	0x38, %g3
	stx	%o5,	[%l7 + %g3]
loop_2222:
	tle	%xcc,	0x7
	fbne	%fcc2,	loop_2223
	bcc	%icc,	loop_2224
	movrgez	%i2,	%g7,	%l1
	fnot1s	%f11,	%f15
loop_2223:
	fnors	%f24,	%f17,	%f22
loop_2224:
	sir	0x1370
	fmovdne	%xcc,	%f30,	%f19
	sra	%o0,	0x13,	%o6
	edge8	%i1,	%o3,	%g5
	and	%o2,	0x1145,	%g1
	tsubcc	%o7,	0x1EC2,	%i6
	alignaddrl	%l3,	%o1,	%g4
	sub	%i3,	0x1802,	%l2
	tcs	%icc,	0x1
	edge16	%i5,	%g6,	%g3
	movre	%l6,	0x158,	%g2
	tsubcctv	%l5,	%l0,	%l4
	fors	%f1,	%f24,	%f10
	nop
	setx	loop_2225,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%i7,	%o4,	%i4
	edge8l	%i0,	%i2,	%g7
	fmovdcc	%icc,	%f3,	%f30
loop_2225:
	flush	%l7 + 0x68
	fpsub32	%f24,	%f0,	%f14
	wr	%g0,	0x2f,	%asi
	stba	%o5,	[%l7 + 0x14] %asi
	membar	#Sync
	swap	[%l7 + 0x18],	%o0
	sdiv	%o6,	0x1FB8,	%l1
	tleu	%icc,	0x5
	move	%icc,	%i1,	%g5
	set	0x14, %i3
	lduwa	[%l7 + %i3] 0x80,	%o3
	smulcc	%g1,	%o2,	%i6
	add	%o7,	%l3,	%o1
	brz	%i3,	loop_2226
	fbn	%fcc0,	loop_2227
	tneg	%xcc,	0x4
	fbul,a	%fcc3,	loop_2228
loop_2226:
	sub	%g4,	%l2,	%g6
loop_2227:
	sdivcc	%g3,	0x1E71,	%i5
	nop
	fitos	%f30,	%f14
loop_2228:
	fnand	%f2,	%f20,	%f14
	tsubcctv	%g2,	%l6,	%l0
	ldx	[%l7 + 0x68],	%l4
	sll	%l5,	%i7,	%i4
	fmovrdgz	%o4,	%f10,	%f24
	move	%xcc,	%i2,	%g7
	tpos	%icc,	0x7
	bpos,pn	%xcc,	loop_2229
	orcc	%i0,	0x1B92,	%o5
	movre	%o0,	0x2B0,	%l1
	array16	%i1,	%o6,	%o3
loop_2229:
	fnors	%f0,	%f17,	%f26
	xorcc	%g5,	0x186E,	%o2
	movvs	%icc,	%i6,	%g1
	fpsub16	%f12,	%f12,	%f2
	fbe	%fcc2,	loop_2230
	array8	%l3,	%o7,	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%g4
loop_2230:
	ldstub	[%l7 + 0x56],	%g6
	lduw	[%l7 + 0x4C],	%l2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i5
	mulx	%g3,	0x05EF,	%g2
	ldsh	[%l7 + 0x58],	%l6
	smul	%l4,	0x0774,	%l5
	tsubcctv	%i7,	0x07EE,	%l0
	movcc	%icc,	%o4,	%i4
	lduh	[%l7 + 0x08],	%g7
	tneg	%icc,	0x7
	smul	%i2,	%o5,	%o0
	tn	%icc,	0x6
	fmovdne	%icc,	%f28,	%f15
	ldd	[%l7 + 0x08],	%l0
	fmovsne	%icc,	%f18,	%f22
	brnz	%i1,	loop_2231
	array8	%o6,	%i0,	%g5
	bvs,a	%icc,	loop_2232
	fbl	%fcc3,	loop_2233
loop_2231:
	andcc	%o3,	0x0A71,	%i6
	edge32l	%g1,	%l3,	%o7
loop_2232:
	tge	%icc,	0x1
loop_2233:
	ldx	[%l7 + 0x58],	%i3
	fxnors	%f30,	%f19,	%f0
	alignaddr	%o1,	%o2,	%g6
	fba	%fcc0,	loop_2234
	fmul8x16al	%f30,	%f19,	%f0
	sdivcc	%l2,	0x0870,	%g4
	edge16	%g3,	%i5,	%l6
loop_2234:
	taddcc	%g2,	0x09C9,	%l4
	edge8	%l5,	%l0,	%o4
	movcs	%xcc,	%i7,	%g7
	sethi	0x14DC,	%i2
	fpsub32	%f12,	%f22,	%f12
	movge	%icc,	%i4,	%o0
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x18
	smul	%o5,	0x065A,	%l1
	nop
	setx	0x478AB389,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xB0845DA0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f7,	%f26
	movcs	%icc,	%i1,	%i0
	sub	%g5,	%o6,	%i6
	udivx	%o3,	0x1E46,	%g1
	xorcc	%l3,	%o7,	%o1
	movg	%xcc,	%o2,	%i3
	fpack32	%f12,	%f18,	%f14
	xorcc	%l2,	0x0C32,	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%g6
	fzeros	%f1
	array8	%i5,	%g2,	%l6
	sir	0x172B
	fpadd16	%f22,	%f6,	%f2
	movgu	%xcc,	%l5,	%l0
	srax	%l4,	0x17,	%i7
	smulcc	%g7,	%o4,	%i4
	addccc	%o0,	0x0FE3,	%i2
	udiv	%l1,	0x073A,	%i1
	tneg	%xcc,	0x4
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf9
	membar	#Sync
	set	0x10, %g5
	lda	[%l7 + %g5] 0x0c,	%f4
	fbo,a	%fcc1,	loop_2235
	addccc	%o5,	0x1681,	%g5
	array8	%o6,	%i6,	%i0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o3,	%g1
loop_2235:
	movcc	%icc,	%o7,	%o1
	tsubcc	%o2,	0x1E83,	%i3
	membar	0x19
	movre	%l2,	%l3,	%g3
	fbg	%fcc1,	loop_2236
	tl	%icc,	0x7
	edge8n	%g6,	%i5,	%g2
	ta	%icc,	0x7
loop_2236:
	movrne	%l6,	0x32E,	%g4
	fbu	%fcc3,	loop_2237
	sir	0x1C39
	st	%f31,	[%l7 + 0x6C]
	set	0x7C, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l5
loop_2237:
	fpack16	%f26,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l0,	0x18BC,	%i7
	edge16l	%l4,	%g7,	%i4
	fone	%f14
	ldd	[%l7 + 0x40],	%f14
	wr	%g0,	0xe3,	%asi
	stha	%o4,	[%l7 + 0x48] %asi
	membar	#Sync
	fbo,a	%fcc0,	loop_2238
	ldsh	[%l7 + 0x76],	%o0
	faligndata	%f26,	%f22,	%f10
	sir	0x1DF4
loop_2238:
	nop
	set	0x54, %g1
	lduwa	[%l7 + %g1] 0x89,	%i2
	stw	%i1,	[%l7 + 0x7C]
	set	0x68, %i7
	ldswa	[%l7 + %i7] 0x10,	%l1
	brgez,a	%g5,	loop_2239
	edge8n	%o6,	%i6,	%i0
	sethi	0x1CC8,	%o5
	tneg	%icc,	0x4
loop_2239:
	movcs	%icc,	%g1,	%o3
	movvc	%xcc,	%o7,	%o2
	fnor	%f14,	%f16,	%f28
	nop
	setx	0x0F326D58E297D616,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f8
	and	%i3,	%l2,	%l3
	andncc	%o1,	%g3,	%g6
	movrgz	%i5,	0x158,	%g2
	movn	%xcc,	%g4,	%l5
	movrgez	%l6,	%l0,	%l4
	nop
	fitos	%f0,	%f7
	fstox	%f7,	%f2
	movleu	%icc,	%g7,	%i7
	fnot2	%f28,	%f18
	subccc	%o4,	%o0,	%i2
	fmul8sux16	%f16,	%f0,	%f26
	set	0x72, %o6
	lduha	[%l7 + %o6] 0x19,	%i1
	tle	%icc,	0x0
	alignaddr	%i4,	%l1,	%o6
	tn	%icc,	0x7
	move	%icc,	%i6,	%g5
	addcc	%i0,	0x1FDA,	%o5
	tsubcc	%g1,	%o7,	%o2
	andn	%i3,	%l2,	%o3
	tpos	%xcc,	0x1
	brlz	%l3,	loop_2240
	fmovsleu	%xcc,	%f1,	%f28
	sdivx	%o1,	0x1C8D,	%g3
	tleu	%xcc,	0x2
loop_2240:
	movneg	%icc,	%i5,	%g2
	bleu,a	loop_2241
	movrlez	%g4,	%g6,	%l6
	set	0x10, %i5
	stxa	%l5,	[%l7 + %i5] 0x11
loop_2241:
	bcs,a	%xcc,	loop_2242
	ldd	[%l7 + 0x78],	%l0
	bleu	%xcc,	loop_2243
	movne	%icc,	%g7,	%i7
loop_2242:
	fzeros	%f27
	tpos	%icc,	0x7
loop_2243:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l4,	%o0
	orn	%i2,	%o4,	%i4
	nop
	setx loop_2244, %l0, %l1
	jmpl %l1, %i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l1,	%i6
	fmovsn	%icc,	%f0,	%f17
loop_2244:
	srlx	%o6,	%i0,	%g5
	fmovdge	%xcc,	%f24,	%f16
	std	%f8,	[%l7 + 0x68]
	add	%g1,	0x11B2,	%o7
	andn	%o5,	0x05B5,	%o2
	set	0x47, %i1
	stba	%i3,	[%l7 + %i1] 0x0c
	ta	%xcc,	0x4
	nop
	set	0x32, %i2
	stb	%l2,	[%l7 + %i2]
	andncc	%l3,	%o1,	%g3
	umulcc	%i5,	%o3,	%g2
	tne	%icc,	0x7
	edge8n	%g6,	%l6,	%l5
	tl	%icc,	0x6
	fmovda	%icc,	%f10,	%f2
	orcc	%l0,	%g7,	%i7
	edge32n	%g4,	%l4,	%i2
	edge16l	%o0,	%o4,	%i1
	lduw	[%l7 + 0x28],	%i4
	edge16n	%l1,	%i6,	%i0
	ldsb	[%l7 + 0x41],	%o6
	bneg,a,pt	%icc,	loop_2245
	edge32	%g5,	%g1,	%o7
	movvs	%icc,	%o5,	%i3
	movrne	%l2,	0x3D1,	%o2
loop_2245:
	fbge,a	%fcc1,	loop_2246
	bleu,pt	%xcc,	loop_2247
	tg	%icc,	0x4
	brgz	%l3,	loop_2248
loop_2246:
	lduw	[%l7 + 0x74],	%o1
loop_2247:
	fandnot1s	%f4,	%f7,	%f29
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%i5
loop_2248:
	fmovsvc	%icc,	%f22,	%f1
	fmovdge	%xcc,	%f8,	%f28
	mulscc	%g2,	0x0840,	%o3
	set	0x70, %g7
	lduha	[%l7 + %g7] 0x19,	%l6
	fpack32	%f6,	%f26,	%f8
	tleu	%icc,	0x5
	fba,a	%fcc1,	loop_2249
	movl	%xcc,	%l5,	%l0
	movge	%icc,	%g6,	%i7
	subcc	%g7,	%g4,	%l4
loop_2249:
	fmovse	%icc,	%f15,	%f31
	xor	%o0,	0x0011,	%o4
	tvs	%xcc,	0x0
	brlez,a	%i1,	loop_2250
	srl	%i2,	0x0C,	%i4
	sdiv	%i6,	0x0E86,	%l1
	stw	%o6,	[%l7 + 0x70]
loop_2250:
	movrne	%g5,	%g1,	%i0
	fmovsleu	%xcc,	%f22,	%f24
	bcs,a,pt	%xcc,	loop_2251
	bge,a	%icc,	loop_2252
	movg	%xcc,	%o7,	%i3
	ldx	[%l7 + 0x48],	%o5
loop_2251:
	tsubcc	%o2,	%l2,	%o1
loop_2252:
	te	%xcc,	0x2
	tl	%icc,	0x3
	mulx	%l3,	0x040B,	%i5
	fnegd	%f24,	%f24
	stw	%g2,	[%l7 + 0x78]
	movrgez	%g3,	0x27E,	%o3
	fbuge,a	%fcc1,	loop_2253
	sra	%l5,	%l0,	%g6
	subc	%l6,	%i7,	%g7
	alignaddr	%l4,	%o0,	%g4
loop_2253:
	addcc	%o4,	%i2,	%i4
	alignaddr	%i6,	%i1,	%o6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x0C] %asi,	%f4
	subccc	%g5,	0x1CAD,	%l1
	fmovs	%f3,	%f9
	sdivcc	%i0,	0x0D62,	%o7
	fmovrde	%g1,	%f26,	%f28
	stb	%o5,	[%l7 + 0x66]
	fpsub32	%f30,	%f0,	%f4
	fpadd16	%f2,	%f4,	%f28
	movvs	%icc,	%i3,	%o2
	fnegd	%f6,	%f0
	ta	%icc,	0x3
	stbar
	tcc	%xcc,	0x0
	movne	%icc,	%o1,	%l2
	bg,pt	%icc,	loop_2254
	fsrc1	%f26,	%f26
	xor	%l3,	0x19E3,	%g2
	movne	%xcc,	%g3,	%o3
loop_2254:
	brgez	%l5,	loop_2255
	sir	0x00B0
	srax	%l0,	0x03,	%i5
	movg	%icc,	%l6,	%g6
loop_2255:
	edge8l	%g7,	%l4,	%o0
	fmovde	%xcc,	%f6,	%f12
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x76] %asi,	%g4
	edge32l	%o4,	%i2,	%i4
	fbn,a	%fcc3,	loop_2256
	tpos	%xcc,	0x3
	andcc	%i6,	%i7,	%o6
	udivx	%i1,	0x04DA,	%l1
loop_2256:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f2,	[%l7 + 0x08] %asi
	fmovrdgez	%i0,	%f24,	%f0
	andncc	%g5,	%o7,	%g1
	sra	%o5,	%o2,	%i3
	edge32ln	%l2,	%l3,	%g2
	movrlez	%g3,	%o1,	%o3
	ble,a	loop_2257
	movrlez	%l5,	0x0F5,	%i5
	fmovdvc	%icc,	%f26,	%f12
	fblg,a	%fcc3,	loop_2258
loop_2257:
	movcc	%xcc,	%l6,	%g6
	bgu	loop_2259
	or	%l0,	%l4,	%g7
loop_2258:
	fsrc2	%f12,	%f6
	fbue,a	%fcc0,	loop_2260
loop_2259:
	fmovsvs	%icc,	%f6,	%f27
	tgu	%icc,	0x1
	brgz	%o0,	loop_2261
loop_2260:
	sdiv	%g4,	0x0B3B,	%o4
	fbg,a	%fcc1,	loop_2262
	sub	%i4,	0x158F,	%i6
loop_2261:
	brnz,a	%i2,	loop_2263
	stb	%o6,	[%l7 + 0x54]
loop_2262:
	sdiv	%i7,	0x1F90,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2263:
	fcmple16	%f12,	%f10,	%l1
	fcmpne32	%f12,	%f30,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%g5,	%o7
	set	0x62, %l4
	lduha	[%l7 + %l4] 0x89,	%o5
	brlz,a	%g1,	loop_2264
	movrgez	%i3,	%l2,	%l3
	subc	%o2,	0x125E,	%g2
	edge16l	%g3,	%o1,	%l5
loop_2264:
	bl	loop_2265
	subccc	%o3,	%l6,	%g6
	movvs	%xcc,	%l0,	%i5
	xnorcc	%g7,	0x126D,	%l4
loop_2265:
	fcmple16	%f28,	%f26,	%g4
	brnz,a	%o0,	loop_2266
	tvc	%icc,	0x0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2F] %asi,	%o4
loop_2266:
	sdivx	%i4,	0x113B,	%i6
	fmovrdne	%o6,	%f4,	%f26
	nop
	setx loop_2267, %l0, %l1
	jmpl %l1, %i2
	tne	%icc,	0x7
	movcc	%icc,	%i1,	%l1
	set	0x0C, %o7
	lda	[%l7 + %o7] 0x14,	%f18
loop_2267:
	fmovdpos	%icc,	%f25,	%f7
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x2b,	%i0
	lduw	[%l7 + 0x08],	%g5
	xor	%o7,	0x1FFD,	%i7
	movpos	%xcc,	%o5,	%i3
	sra	%g1,	0x11,	%l3
	addcc	%l2,	%o2,	%g2
	fmovrdgz	%o1,	%f6,	%f6
	tcc	%icc,	0x5
	tsubcc	%g3,	0x1581,	%o3
	subc	%l6,	0x1CE5,	%l5
	movne	%xcc,	%l0,	%g6
	fandnot1s	%f15,	%f0,	%f26
	udiv	%g7,	0x1547,	%l4
	srax	%g4,	0x16,	%i5
	brlz	%o0,	loop_2268
	st	%f24,	[%l7 + 0x4C]
	fblg,a	%fcc2,	loop_2269
	edge32	%o4,	%i6,	%o6
loop_2268:
	stb	%i2,	[%l7 + 0x42]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%i1
loop_2269:
	fbg	%fcc1,	loop_2270
	brlez,a	%l1,	loop_2271
	te	%icc,	0x4
	movvc	%xcc,	%i0,	%g5
loop_2270:
	fmovscs	%icc,	%f23,	%f3
loop_2271:
	xorcc	%o7,	0x19BA,	%i7
	and	%o5,	%g1,	%i3
	fmovsgu	%icc,	%f26,	%f8
	taddcctv	%l2,	0x1DC4,	%l3
	movrne	%o2,	0x01F,	%o1
	fba,a	%fcc2,	loop_2272
	umul	%g2,	0x1F08,	%g3
	array32	%l6,	%o3,	%l5
	taddcc	%l0,	%g6,	%g7
loop_2272:
	movl	%icc,	%g4,	%i5
	sll	%o0,	0x11,	%l4
	nop
	setx	0xB540C1C16C74D9E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x37D3C9D8621008DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f22,	%f2
	array8	%i6,	%o4,	%o6
	set	0x28, %o3
	stwa	%i2,	[%l7 + %o3] 0x81
	srlx	%i4,	%i1,	%i0
	nop
	set	0x40, %l2
	sth	%g5,	[%l7 + %l2]
	sll	%l1,	%o7,	%o5
	fbe	%fcc0,	loop_2273
	fpsub32	%f26,	%f2,	%f20
	fmovrdgz	%i7,	%f4,	%f28
	fbuge	%fcc2,	loop_2274
loop_2273:
	ldsb	[%l7 + 0x3C],	%i3
	fbne,a	%fcc1,	loop_2275
	nop
	fitos	%f0,	%f19
	fstod	%f19,	%f4
loop_2274:
	std	%f6,	[%l7 + 0x50]
	fmovsleu	%xcc,	%f21,	%f6
loop_2275:
	edge8n	%l2,	%l3,	%g1
	lduw	[%l7 + 0x30],	%o2
	fandnot2s	%f9,	%f8,	%f8
	ldx	[%l7 + 0x30],	%o1
	nop
	fitos	%f10,	%f9
	fstox	%f9,	%f6
	nop
	setx	0xA071A67C,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	sethi	0x0790,	%g3
	movne	%icc,	%l6,	%g2
	set	0x70, %l5
	lduwa	[%l7 + %l5] 0x04,	%l5
	fmovdgu	%icc,	%f3,	%f14
	std	%f24,	[%l7 + 0x60]
	or	%o3,	0x06D3,	%g6
	nop
	fitod	%f6,	%f24
	fdtoi	%f24,	%f7
	set	0x2C, %i6
	stwa	%l0,	[%l7 + %i6] 0x04
	sub	%g4,	0x105D,	%g7
	fcmpgt32	%f6,	%f10,	%i5
	alignaddr	%l4,	%i6,	%o4
	udivx	%o6,	0x1282,	%i2
	fabsd	%f22,	%f30
	tne	%xcc,	0x6
	orcc	%o0,	0x1DCB,	%i4
	fmovsg	%icc,	%f1,	%f13
	movn	%xcc,	%i1,	%g5
	bcs	%icc,	loop_2276
	sdiv	%i0,	0x15D1,	%l1
	fmovscc	%icc,	%f2,	%f9
	fmovdleu	%xcc,	%f20,	%f22
loop_2276:
	fmovrslez	%o7,	%f22,	%f17
	set	0x08, %g6
	lda	[%l7 + %g6] 0x80,	%f26
	srl	%i7,	0x09,	%o5
	stb	%l2,	[%l7 + 0x14]
	andn	%l3,	0x0C2D,	%g1
	te	%icc,	0x5
	taddcctv	%i3,	0x0C89,	%o1
	xorcc	%g3,	%o2,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f28,	%f8,	%f20
	movrlez	%g2,	0x3E4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pn	%xcc,	loop_2277
	addccc	%g6,	%l5,	%l0
	tleu	%icc,	0x5
	tpos	%xcc,	0x1
loop_2277:
	swap	[%l7 + 0x44],	%g7
	movrlz	%g4,	0x199,	%l4
	fcmpeq32	%f28,	%f14,	%i6
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x1C] %asi,	%f24
	udivcc	%o4,	0x1253,	%o6
	edge8	%i2,	%o0,	%i5
	edge8	%i4,	%g5,	%i1
	fmovsge	%xcc,	%f3,	%f6
	fsrc1	%f10,	%f10
	movcc	%icc,	%l1,	%o7
	popc	0x0CA7,	%i0
	ldsw	[%l7 + 0x0C],	%o5
	tneg	%xcc,	0x2
	xnorcc	%l2,	0x03EC,	%i7
	edge32l	%g1,	%l3,	%o1
	set	0x0C, %l6
	ldsha	[%l7 + %l6] 0x18,	%i3
	movrlz	%o2,	0x1EC,	%l6
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%g2
	fmovsle	%xcc,	%f23,	%f16
	edge16n	%g2,	%g6,	%l5
	tleu	%icc,	0x7
	sir	0x0D79
	mova	%xcc,	%o3,	%l0
	stbar
	movleu	%xcc,	%g7,	%g4
	nop
	setx	0x62D707A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x55216253,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f24,	%f3
	array8	%i6,	%l4,	%o6
	mulx	%i2,	0x1AF6,	%o0
	subccc	%i5,	%i4,	%o4
	sllx	%i1,	0x03,	%l1
	andncc	%g5,	%o7,	%o5
	sdiv	%i0,	0x05C6,	%i7
	call	loop_2278
	tn	%xcc,	0x2
	ldsw	[%l7 + 0x58],	%l2
	fnands	%f31,	%f23,	%f9
loop_2278:
	movg	%icc,	%g1,	%l3
	xorcc	%o1,	0x1202,	%o2
	tpos	%icc,	0x5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addc	%l6,	0x01AB,	%g3
	orncc	%i3,	0x097A,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g6,	%o3
	fbule,a	%fcc2,	loop_2279
	fbul,a	%fcc1,	loop_2280
	subcc	%l5,	%l0,	%g4
	mulscc	%i6,	%g7,	%l4
loop_2279:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%o0
loop_2280:
	umul	%o6,	0x0D28,	%i4
	stbar
	mulx	%i5,	0x1136,	%i1
	ldsb	[%l7 + 0x32],	%o4
	set	0x6C, %o4
	ldstuba	[%l7 + %o4] 0x10,	%g5
	tle	%icc,	0x6
	edge16	%o7,	%o5,	%l1
	fcmpne16	%f14,	%f6,	%i0
	andcc	%i7,	%g1,	%l2
	movcs	%xcc,	%l3,	%o1
	bn	loop_2281
	array32	%o2,	%l6,	%i3
	array16	%g3,	%g2,	%g6
	nop
	setx loop_2282, %l0, %l1
	jmpl %l1, %o3
loop_2281:
	tle	%icc,	0x6
	tg	%icc,	0x0
	sub	%l0,	0x0256,	%g4
loop_2282:
	swap	[%l7 + 0x3C],	%l5
	fbg	%fcc1,	loop_2283
	movg	%xcc,	%i6,	%l4
	tcs	%icc,	0x7
	smul	%g7,	%o0,	%i2
loop_2283:
	std	%f8,	[%l7 + 0x28]
	fpadd16s	%f25,	%f30,	%f28
	smul	%i4,	0x0890,	%o6
	nop
	setx	0x904816DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	movrlez	%i1,	%o4,	%g5
	edge16n	%i5,	%o5,	%o7
	movneg	%icc,	%i0,	%i7
	bvs,a	loop_2284
	brlz,a	%g1,	loop_2285
	brlz,a	%l1,	loop_2286
	bvc	%icc,	loop_2287
loop_2284:
	movrlz	%l2,	0x2BC,	%l3
loop_2285:
	tgu	%xcc,	0x1
loop_2286:
	xor	%o2,	0x02C0,	%o1
loop_2287:
	movleu	%xcc,	%l6,	%i3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x14,	%f16
	tsubcc	%g2,	%g6,	%o3
	set	0x08, %i4
	stwa	%l0,	[%l7 + %i4] 0xeb
	membar	#Sync
	movcc	%xcc,	%g4,	%g3
	tleu	%icc,	0x5
	array16	%l5,	%i6,	%l4
	edge32ln	%g7,	%o0,	%i4
	sll	%i2,	%o6,	%i1
	movrgez	%o4,	%g5,	%i5
	addccc	%o5,	0x1C43,	%i0
	fornot2s	%f10,	%f19,	%f21
	bleu	loop_2288
	move	%xcc,	%o7,	%g1
	fnegd	%f20,	%f28
	tsubcc	%i7,	0x0E7B,	%l1
loop_2288:
	tn	%icc,	0x1
	udivx	%l2,	0x10F8,	%o2
	fmul8x16	%f2,	%f14,	%f2
	edge32l	%o1,	%l3,	%l6
	nop
	fitos	%f4,	%f27
	fstoi	%f27,	%f5
	xor	%i3,	0x0B0B,	%g6
	sll	%g2,	0x0E,	%l0
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g4
	edge32n	%o3,	%l5,	%i6
	fpadd16	%f4,	%f20,	%f4
	fmovdpos	%icc,	%f27,	%f31
	edge8l	%l4,	%g7,	%o0
	fbug	%fcc0,	loop_2289
	fandnot1s	%f25,	%f10,	%f22
	nop
	setx loop_2290, %l0, %l1
	jmpl %l1, %g3
	edge16l	%i4,	%i2,	%i1
loop_2289:
	xorcc	%o4,	%g5,	%i5
	fandnot1s	%f20,	%f22,	%f4
loop_2290:
	brlz	%o5,	loop_2291
	subcc	%i0,	%o6,	%o7
	sdiv	%g1,	0x1FBB,	%l1
	set	0x74, %g2
	lda	[%l7 + %g2] 0x10,	%f31
loop_2291:
	brz,a	%i7,	loop_2292
	add	%o2,	%l2,	%o1
	tvs	%icc,	0x5
	tge	%icc,	0x5
loop_2292:
	fbn,a	%fcc0,	loop_2293
	std	%f14,	[%l7 + 0x08]
	bg	loop_2294
	tgu	%icc,	0x7
loop_2293:
	fmovsle	%xcc,	%f29,	%f23
	orncc	%l6,	%l3,	%i3
loop_2294:
	sra	%g6,	0x1F,	%l0
	movvs	%xcc,	%g2,	%g4
	ta	%icc,	0x2
	alignaddrl	%l5,	%i6,	%l4
	fands	%f5,	%f19,	%f8
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x15
	movcs	%icc,	%o3,	%o0
	tneg	%xcc,	0x5
	mulscc	%g3,	0x1415,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4A, %o5
	ldsha	[%l7 + %o5] 0x04,	%i2
	movrlz	%i4,	%i1,	%g5
	movcs	%xcc,	%o4,	%i5
	bgu,a,pt	%icc,	loop_2295
	fbul,a	%fcc1,	loop_2296
	movgu	%icc,	%o5,	%i0
	bpos	loop_2297
loop_2295:
	subccc	%o7,	%g1,	%o6
loop_2296:
	ldsb	[%l7 + 0x6A],	%i7
	bpos,pn	%xcc,	loop_2298
loop_2297:
	addc	%o2,	0x10AA,	%l2
	fba	%fcc2,	loop_2299
	andcc	%l1,	%l6,	%o1
loop_2298:
	andcc	%l3,	%i3,	%g6
	alignaddr	%g2,	%l0,	%g4
loop_2299:
	edge32	%l5,	%i6,	%l4
	andn	%o3,	0x1E5E,	%o0
	sir	0x1525
	fmuld8sux16	%f16,	%f0,	%f14
	or	%g3,	%g7,	%i4
	srax	%i1,	0x13,	%g5
	te	%icc,	0x2
	edge16l	%o4,	%i5,	%o5
	fcmpgt16	%f20,	%f24,	%i0
	srax	%i2,	0x0F,	%o7
	and	%o6,	%g1,	%o2
	fbl,a	%fcc0,	loop_2300
	tpos	%icc,	0x0
	movne	%xcc,	%i7,	%l2
	call	loop_2301
loop_2300:
	mulx	%l1,	%o1,	%l6
	addc	%i3,	%g6,	%g2
	ldx	[%l7 + 0x38],	%l3
loop_2301:
	mulscc	%g4,	0x1B25,	%l0
	subc	%l5,	%i6,	%o3
	sra	%o0,	%l4,	%g7
	srax	%g3,	%i1,	%i4
	tl	%icc,	0x1
	st	%f17,	[%l7 + 0x3C]
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%o4
	nop
	setx	0x1503732A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xC3AC0BAF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f9,	%f21
	xnorcc	%g5,	0x0B2D,	%o5
	fnot2	%f22,	%f8
	tn	%xcc,	0x1
	movpos	%xcc,	%i0,	%i2
	fmovrdne	%o7,	%f4,	%f10
	movcc	%icc,	%i5,	%g1
	call	loop_2302
	ta	%xcc,	0x4
	fnot1	%f28,	%f30
	fmovdneg	%xcc,	%f31,	%f6
loop_2302:
	movl	%xcc,	%o2,	%o6
	fmovd	%f30,	%f2
	edge8n	%i7,	%l2,	%o1
	nop
	fitos	%f4,	%f30
	fstoi	%f30,	%f17
	movl	%icc,	%l6,	%l1
	edge8ln	%g6,	%g2,	%i3
	movneg	%xcc,	%l3,	%l0
	fble,a	%fcc0,	loop_2303
	edge16ln	%g4,	%l5,	%i6
	stw	%o3,	[%l7 + 0x28]
	ba,a,pt	%xcc,	loop_2304
loop_2303:
	bcc	loop_2305
	fmovsvs	%xcc,	%f24,	%f24
	andn	%l4,	%o0,	%g7
loop_2304:
	movvc	%xcc,	%g3,	%i1
loop_2305:
	fornot2	%f28,	%f6,	%f18
	st	%f30,	[%l7 + 0x1C]
	fbge,a	%fcc3,	loop_2306
	movge	%icc,	%i4,	%g5
	edge16	%o4,	%i0,	%o5
	bg,a,pt	%xcc,	loop_2307
loop_2306:
	popc	%i2,	%i5
	andcc	%o7,	%o2,	%g1
	or	%o6,	0x0E6D,	%l2
loop_2307:
	brnz	%i7,	loop_2308
	tsubcctv	%o1,	%l6,	%g6
	tleu	%icc,	0x3
	tl	%icc,	0x1
loop_2308:
	bneg,a	loop_2309
	tvs	%icc,	0x1
	tl	%icc,	0x6
	addc	%l1,	0x1CBF,	%i3
loop_2309:
	tvc	%icc,	0x2
	brz,a	%l3,	loop_2310
	popc	%g2,	%g4
	brgez,a	%l0,	loop_2311
	fmovdle	%xcc,	%f28,	%f2
loop_2310:
	fmovda	%icc,	%f22,	%f4
	add	%l5,	0x1A1F,	%i6
loop_2311:
	andncc	%l4,	%o0,	%o3
	alignaddrl	%g7,	%g3,	%i4
	fmovdvs	%xcc,	%f28,	%f31
	addc	%g5,	0x0B61,	%i1
	move	%xcc,	%i0,	%o5
	addcc	%o4,	0x02A0,	%i2
	fmovdleu	%icc,	%f22,	%f3
	edge32ln	%i5,	%o2,	%o7
	xorcc	%g1,	%l2,	%o6
	edge16ln	%i7,	%l6,	%g6
	movrlz	%l1,	%o1,	%i3
	tsubcctv	%g2,	%l3,	%g4
	orn	%l5,	%l0,	%i6
	brlez	%o0,	loop_2312
	and	%o3,	0x0394,	%l4
	brlez	%g3,	loop_2313
	addccc	%i4,	0x1214,	%g5
loop_2312:
	taddcc	%g7,	%i1,	%o5
	array8	%o4,	%i2,	%i0
loop_2313:
	fpack16	%f28,	%f9
	edge8	%o2,	%o7,	%g1
	movrlz	%i5,	0x296,	%o6
	movre	%i7,	%l2,	%l6
	stw	%g6,	[%l7 + 0x5C]
	andncc	%o1,	%i3,	%l1
	te	%xcc,	0x6
	and	%l3,	0x04C5,	%g2
	alignaddrl	%l5,	%l0,	%g4
	edge8ln	%i6,	%o3,	%o0
	fbul,a	%fcc2,	loop_2314
	ldd	[%l7 + 0x10],	%l4
	xorcc	%i4,	0x0CB1,	%g5
	fbne	%fcc1,	loop_2315
loop_2314:
	subcc	%g7,	%g3,	%i1
	fmovrslez	%o5,	%f19,	%f17
	edge16l	%o4,	%i2,	%i0
loop_2315:
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f17
	fnor	%f12,	%f20,	%f16
	movle	%xcc,	%o2,	%o7
	sllx	%i5,	0x12,	%g1
	nop
	setx	0xDA68A30D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xF20330FA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f28,	%f1
	subc	%o6,	0x054F,	%l2
	fbe	%fcc1,	loop_2316
	srlx	%i7,	0x11,	%l6
	tcc	%xcc,	0x7
	sir	0x1974
loop_2316:
	bpos	%xcc,	loop_2317
	edge32n	%g6,	%i3,	%l1
	fbule	%fcc3,	loop_2318
	stb	%o1,	[%l7 + 0x65]
loop_2317:
	fmovsl	%icc,	%f1,	%f11
	edge32ln	%g2,	%l5,	%l3
loop_2318:
	fmovsle	%icc,	%f15,	%f25
	tvc	%xcc,	0x5
	nop
	set	0x2B, %o0
	ldub	[%l7 + %o0],	%g4
	taddcctv	%i6,	%l0,	%o0
	fxors	%f15,	%f3,	%f18
	smul	%o3,	0x1D23,	%i4
	tgu	%icc,	0x5
	std	%f18,	[%l7 + 0x40]
	wr	%g0,	0xea,	%asi
	stha	%g5,	[%l7 + 0x5C] %asi
	membar	#Sync
	fnands	%f19,	%f29,	%f0
	movge	%xcc,	%l4,	%g7
	xorcc	%i1,	0x1DED,	%o5
	alignaddr	%o4,	%i2,	%i0
	xorcc	%g3,	%o7,	%i5
	bgu,a,pt	%xcc,	loop_2319
	edge16ln	%g1,	%o2,	%o6
	edge16ln	%i7,	%l6,	%g6
	set	0x5C, %g4
	swapa	[%l7 + %g4] 0x04,	%i3
loop_2319:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l2,	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%l5
	fmovrdne	%l3,	%f10,	%f26
	fmovrdlz	%g4,	%f4,	%f0
	movne	%xcc,	%l1,	%l0
	tcs	%xcc,	0x7
	tcs	%xcc,	0x0
	nop
	fitod	%f2,	%f2
	fdtoi	%f2,	%f20
	nop
	setx	loop_2320,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%o0,	0x1A99,	%o3
	fnot1	%f22,	%f16
	tsubcctv	%i4,	%g5,	%i6
loop_2320:
	andcc	%l4,	%g7,	%o5
	fmovrde	%i1,	%f22,	%f4
	tge	%xcc,	0x1
	fbne,a	%fcc2,	loop_2321
	array8	%o4,	%i0,	%i2
	xnor	%o7,	0x1BBD,	%i5
	set	0x68, %o1
	stxa	%g3,	[%l7 + %o1] 0x15
loop_2321:
	brz	%g1,	loop_2322
	smulcc	%o6,	%o2,	%l6
	umulcc	%g6,	%i3,	%i7
	bl	loop_2323
loop_2322:
	ble,a	loop_2324
	fcmple16	%f16,	%f30,	%o1
	smul	%l2,	0x1634,	%g2
loop_2323:
	fornot2	%f28,	%f14,	%f6
loop_2324:
	alignaddr	%l3,	%g4,	%l1
	array8	%l0,	%o0,	%o3
	nop
	setx	0x54548BD612C08C98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xA4055F21E7E8C02E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f28,	%f16
	brz,a	%i4,	loop_2325
	add	%g5,	0x06AD,	%l5
	fbu	%fcc3,	loop_2326
	fpadd16	%f18,	%f2,	%f6
loop_2325:
	tsubcc	%i6,	%g7,	%o5
	movne	%xcc,	%l4,	%i1
loop_2326:
	fbo	%fcc2,	loop_2327
	tcs	%xcc,	0x6
	bcs	loop_2328
	edge16	%i0,	%i2,	%o4
loop_2327:
	array8	%o7,	%g3,	%g1
	ldsb	[%l7 + 0x59],	%i5
loop_2328:
	brnz,a	%o6,	loop_2329
	popc	0x0C70,	%l6
	lduh	[%l7 + 0x1E],	%o2
	movpos	%icc,	%i3,	%g6
loop_2329:
	sub	%o1,	%l2,	%g2
	movpos	%icc,	%i7,	%g4
	xnor	%l1,	0x03CF,	%l0
	fbu	%fcc2,	loop_2330
	fbe	%fcc1,	loop_2331
	orcc	%l3,	0x1B49,	%o3
	movge	%xcc,	%i4,	%g5
loop_2330:
	fmovrdgz	%l5,	%f6,	%f24
loop_2331:
	nop
	set	0x28, %i3
	swapa	[%l7 + %i3] 0x80,	%i6
	edge8n	%o0,	%o5,	%g7
	tvc	%icc,	0x5
	edge8l	%l4,	%i0,	%i2
	add	%i1,	%o4,	%o7
	fmovd	%f0,	%f30
	movne	%xcc,	%g1,	%i5
	fmovrdlz	%o6,	%f26,	%f26
	lduw	[%l7 + 0x08],	%g3
	movrgz	%l6,	0x36F,	%i3
	nop
	setx	0x1CAAF971,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xDE66746F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f25,	%f19
	movrlez	%g6,	0x142,	%o1
	move	%icc,	%l2,	%o2
	sir	0x0F58
	lduw	[%l7 + 0x78],	%g2
	fandnot2	%f20,	%f12,	%f10
	udivx	%g4,	0x00F1,	%l1
	addccc	%l0,	0x11F1,	%i7
	movgu	%xcc,	%o3,	%i4
	st	%f8,	[%l7 + 0x34]
	bcs,pn	%xcc,	loop_2332
	tpos	%icc,	0x3
	fzeros	%f24
	fcmpgt32	%f10,	%f4,	%l3
loop_2332:
	udiv	%l5,	0x1CBA,	%g5
	tpos	%xcc,	0x2
	add	%i6,	0x1785,	%o5
	edge16n	%g7,	%o0,	%l4
	sra	%i0,	%i2,	%i1
	orncc	%o4,	0x1C7B,	%o7
	sdiv	%g1,	0x0704,	%i5
	fandnot2	%f28,	%f18,	%f14
	prefetch	[%l7 + 0x40],	 0x1
	brgz	%o6,	loop_2333
	subccc	%l6,	0x041D,	%i3
	movrne	%g3,	0x31D,	%g6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f3
loop_2333:
	bn,pt	%icc,	loop_2334
	sdiv	%l2,	0x181A,	%o2
	taddcctv	%g2,	%g4,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2334:
	popc	0x0393,	%l0
	bvc,pn	%xcc,	loop_2335
	addc	%i7,	%o3,	%o1
	bcs,a	%xcc,	loop_2336
	edge8l	%l3,	%i4,	%g5
loop_2335:
	fba	%fcc1,	loop_2337
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2336:
	brz	%l5,	loop_2338
	brgz	%i6,	loop_2339
loop_2337:
	edge16l	%g7,	%o0,	%o5
	fmovrslz	%l4,	%f14,	%f18
loop_2338:
	fbu	%fcc2,	loop_2340
loop_2339:
	bvs,a	loop_2341
	ld	[%l7 + 0x14],	%f15
	tleu	%xcc,	0x2
loop_2340:
	mulscc	%i2,	%i0,	%i1
loop_2341:
	tgu	%icc,	0x6
	srl	%o4,	%g1,	%i5
	set	0x50, %g5
	lduwa	[%l7 + %g5] 0x81,	%o6
	fbuge,a	%fcc0,	loop_2342
	edge8ln	%o7,	%l6,	%g3
	edge16n	%g6,	%l2,	%i3
	andn	%g2,	%g4,	%o2
loop_2342:
	udivcc	%l1,	0x19DC,	%l0
	andncc	%i7,	%o3,	%o1
	tcc	%xcc,	0x3
	sll	%l3,	0x00,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g5,	%i6,	%l5
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xeb,	%g6
	set	0x20, %l1
	lduwa	[%l7 + %l1] 0x19,	%o5
	array8	%l4,	%i2,	%i0
	movrlez	%o0,	%o4,	%g1
	sir	0x1BBE
	tg	%xcc,	0x7
	movleu	%icc,	%i1,	%o6
	brlz,a	%i5,	loop_2343
	or	%l6,	0x062A,	%o7
	edge16n	%g3,	%g6,	%i3
	andncc	%g2,	%l2,	%g4
loop_2343:
	sub	%o2,	%l1,	%i7
	fcmpgt16	%f8,	%f2,	%o3
	edge16	%o1,	%l3,	%i4
	sll	%g5,	0x14,	%i6
	fzeros	%f3
	movcs	%xcc,	%l0,	%g7
	wr	%g0,	0x89,	%asi
	sta	%f24,	[%l7 + 0x38] %asi
	fmovsa	%icc,	%f7,	%f16
	fbo,a	%fcc3,	loop_2344
	edge32l	%o5,	%l4,	%l5
	move	%xcc,	%i2,	%i0
	edge8ln	%o0,	%o4,	%g1
loop_2344:
	membar	0x7F
	edge16	%o6,	%i5,	%i1
	fblg,a	%fcc2,	loop_2345
	smulcc	%o7,	0x1CDF,	%l6
	edge32l	%g3,	%g6,	%g2
	add	%i3,	%l2,	%g4
loop_2345:
	nop
	set	0x60, %o6
	stxa	%l1,	[%l7 + %o6] 0x89
	bgu	loop_2346
	fzeros	%f21
	movg	%xcc,	%i7,	%o3
	move	%icc,	%o1,	%l3
loop_2346:
	fble,a	%fcc3,	loop_2347
	edge8l	%o2,	%g5,	%i6
	be	loop_2348
	brz,a	%l0,	loop_2349
loop_2347:
	brgez,a	%g7,	loop_2350
	edge8n	%i4,	%o5,	%l5
loop_2348:
	fmovspos	%icc,	%f5,	%f17
loop_2349:
	nop
	set	0x66, %i5
	lduha	[%l7 + %i5] 0x88,	%l4
loop_2350:
	tneg	%icc,	0x5
	movn	%xcc,	%i2,	%o0
	sll	%i0,	%g1,	%o4
	brlz	%o6,	loop_2351
	fsrc2s	%f31,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc3,	loop_2352
loop_2351:
	mova	%xcc,	%i5,	%o7
	sra	%l6,	%i1,	%g3
	xorcc	%g6,	0x12E7,	%i3
loop_2352:
	andcc	%l2,	%g2,	%l1
	edge16n	%i7,	%o3,	%g4
	edge32l	%o1,	%o2,	%g5
	umul	%i6,	%l0,	%g7
	or	%l3,	0x07D5,	%o5
	flush	%l7 + 0x54
	tneg	%icc,	0x6
	stbar
	movcc	%icc,	%i4,	%l5
	swap	[%l7 + 0x44],	%l4
	movrne	%i2,	0x054,	%o0
	fmovde	%xcc,	%f17,	%f16
	nop
	setx	0x5D260377F55B306B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE489920DB4EFF3FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f2,	%f18
	umul	%i0,	%o4,	%o6
	edge16n	%i5,	%o7,	%l6
	bg	%xcc,	loop_2353
	movl	%icc,	%g1,	%g3
	fnors	%f15,	%f4,	%f13
	orncc	%i1,	%i3,	%l2
loop_2353:
	smulcc	%g2,	0x0605,	%g6
	sethi	0x0701,	%i7
	fornot2s	%f26,	%f5,	%f31
	ldstub	[%l7 + 0x3C],	%l1
	fmovrde	%g4,	%f16,	%f10
	edge8l	%o1,	%o2,	%g5
	fands	%f5,	%f27,	%f7
	edge16ln	%o3,	%i6,	%g7
	tn	%icc,	0x6
	tcs	%icc,	0x7
	movrlz	%l3,	0x21B,	%o5
	movpos	%icc,	%l0,	%i4
	nop
	setx	0xA07D5F0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	movgu	%icc,	%l5,	%i2
	fbe,a	%fcc1,	loop_2354
	brgez	%o0,	loop_2355
	ldsw	[%l7 + 0x68],	%l4
	tsubcctv	%o4,	0x1FB1,	%o6
loop_2354:
	movcc	%xcc,	%i0,	%i5
loop_2355:
	ldd	[%l7 + 0x50],	%f6
	bge,pn	%xcc,	loop_2356
	sllx	%l6,	%g1,	%o7
	fmovsneg	%icc,	%f15,	%f26
	fmul8x16au	%f9,	%f1,	%f24
loop_2356:
	array8	%i1,	%i3,	%l2
	ldx	[%l7 + 0x68],	%g3
	movrgez	%g6,	0x39A,	%g2
	fmovdge	%xcc,	%f2,	%f2
	fbul,a	%fcc2,	loop_2357
	movneg	%icc,	%i7,	%g4
	smul	%l1,	0x16A9,	%o1
	tsubcctv	%o2,	0x0A78,	%o3
loop_2357:
	nop
	setx	loop_2358,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%i6,	%g7
	fmovrdlz	%g5,	%f10,	%f20
	popc	%o5,	%l0
loop_2358:
	sra	%l3,	%i4,	%l5
	fpsub32s	%f6,	%f28,	%f5
	brnz	%i2,	loop_2359
	fmovsg	%xcc,	%f7,	%f11
	orn	%l4,	%o4,	%o6
	edge16l	%i0,	%i5,	%l6
loop_2359:
	fbu,a	%fcc0,	loop_2360
	smul	%o0,	0x0A56,	%g1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%i1
loop_2360:
	movle	%xcc,	%i3,	%g3
	bcc,a	%xcc,	loop_2361
	edge16	%l2,	%g6,	%g2
	nop
	setx	loop_2362,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%xcc,	0x7
loop_2361:
	nop
	setx	loop_2363,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%g4,	%i7,	%o1
loop_2362:
	movleu	%xcc,	%o2,	%l1
	bcc,pt	%xcc,	loop_2364
loop_2363:
	brnz	%o3,	loop_2365
	fmovrslez	%g7,	%f18,	%f12
	popc	0x0328,	%g5
loop_2364:
	addcc	%i6,	%o5,	%l3
loop_2365:
	edge8n	%l0,	%l5,	%i4
	ldsw	[%l7 + 0x74],	%l4
	fbug	%fcc3,	loop_2366
	orn	%i2,	0x13F1,	%o4
	ldd	[%l7 + 0x18],	%i0
	xnor	%o6,	0x153C,	%i5
loop_2366:
	bge	loop_2367
	andn	%l6,	0x12B0,	%g1
	ta	%xcc,	0x7
	bpos,pn	%xcc,	loop_2368
loop_2367:
	andn	%o0,	0x08CC,	%o7
	edge8l	%i1,	%g3,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2368:
	nop
	setx	loop_2369,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbg	%fcc2,	loop_2370
	edge32ln	%g6,	%g2,	%i3
	or	%i7,	0x19BA,	%g4
loop_2369:
	fmovrse	%o2,	%f6,	%f5
loop_2370:
	orncc	%l1,	%o3,	%g7
	fmul8x16	%f9,	%f28,	%f30
	movleu	%icc,	%o1,	%g5
	movcc	%icc,	%i6,	%l3
	fnand	%f30,	%f12,	%f0
	fmovspos	%icc,	%f8,	%f11
	orcc	%o5,	0x0423,	%l0
	nop
	setx	0xF1ACCE9FB2E9B816,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE8ADFF0CEAF9BED2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f2,	%f12
	sdivx	%l5,	0x122E,	%l4
	bvc,a,pt	%xcc,	loop_2371
	fors	%f30,	%f6,	%f22
	fmovdvc	%icc,	%f19,	%f25
	bneg,a	%icc,	loop_2372
loop_2371:
	tge	%icc,	0x6
	bgu,a,pn	%xcc,	loop_2373
	tneg	%xcc,	0x0
loop_2372:
	addcc	%i2,	0x092B,	%i4
	array32	%o4,	%i0,	%i5
loop_2373:
	xor	%o6,	0x0461,	%g1
	umul	%o0,	%l6,	%o7
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fzero	%f14
	fcmpne32	%f20,	%f26,	%g3
	fmovd	%f12,	%f18
	nop
	setx	0x5F8E840FD04627A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	subccc	%i1,	0x16F9,	%g6
	movg	%xcc,	%l2,	%g2
	fbl	%fcc2,	loop_2374
	sll	%i3,	%i7,	%g4
	sdiv	%o2,	0x1707,	%o3
	fabsd	%f8,	%f16
loop_2374:
	movg	%xcc,	%l1,	%g7
	mova	%icc,	%o1,	%g5
	fbue	%fcc0,	loop_2375
	edge8n	%l3,	%o5,	%i6
	movcc	%xcc,	%l5,	%l0
	fabsd	%f28,	%f18
loop_2375:
	and	%l4,	0x1D9D,	%i4
	fblg	%fcc3,	loop_2376
	fmovrdgz	%i2,	%f0,	%f4
	be,a,pt	%xcc,	loop_2377
	nop
	setx	0xA31DA94350DA9469,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x714DF29F80E97931,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f6,	%f10
loop_2376:
	add	%o4,	%i0,	%i5
	movle	%icc,	%o6,	%g1
loop_2377:
	orncc	%o0,	%l6,	%o7
	fbu	%fcc0,	loop_2378
	xnorcc	%i1,	0x15E3,	%g6
	stb	%l2,	[%l7 + 0x3F]
	fmuld8sux16	%f19,	%f12,	%f26
loop_2378:
	fbul,a	%fcc3,	loop_2379
	movrne	%g2,	%g3,	%i3
	sethi	0x0D93,	%i7
	fand	%f16,	%f18,	%f2
loop_2379:
	movrlez	%o2,	%o3,	%l1
	edge16l	%g4,	%o1,	%g5
	sir	0x18E8
	movne	%icc,	%g7,	%o5
	udiv	%l3,	0x1D09,	%l5
	tsubcctv	%l0,	0x1D70,	%i6
	tle	%icc,	0x4
	movle	%icc,	%l4,	%i2
	bshuffle	%f30,	%f22,	%f20
	ld	[%l7 + 0x70],	%f4
	taddcc	%o4,	%i0,	%i5
	fmovsn	%icc,	%f0,	%f13
	fnot1	%f0,	%f8
	move	%xcc,	%i4,	%o6
	movn	%xcc,	%g1,	%l6
	tvs	%xcc,	0x2
	fmovsn	%xcc,	%f0,	%f27
	sdiv	%o7,	0x17C3,	%o0
	fbug	%fcc1,	loop_2380
	array16	%i1,	%l2,	%g6
	fornot1s	%f23,	%f17,	%f16
	fpmerge	%f1,	%f6,	%f16
loop_2380:
	fnors	%f31,	%f26,	%f13
	fxor	%f4,	%f8,	%f22
	fxnors	%f16,	%f1,	%f23
	edge8	%g2,	%i3,	%g3
	tn	%xcc,	0x3
	ldx	[%l7 + 0x70],	%o2
	stbar
	sllx	%i7,	0x1B,	%l1
	fmovda	%icc,	%f22,	%f29
	orn	%o3,	%g4,	%g5
	edge32l	%o1,	%g7,	%l3
	movrgez	%l5,	0x316,	%o5
	fbne	%fcc3,	loop_2381
	fbule	%fcc2,	loop_2382
	fmovrdlz	%i6,	%f6,	%f30
	smul	%l4,	0x068A,	%i2
loop_2381:
	tvc	%xcc,	0x5
loop_2382:
	and	%l0,	%o4,	%i0
	alignaddrl	%i4,	%o6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a	loop_2383
	fexpand	%f22,	%f6
	addcc	%g1,	0x0D80,	%o7
	nop
	setx loop_2384, %l0, %l1
	jmpl %l1, %l6
loop_2383:
	tgu	%xcc,	0x4
	sdivx	%i1,	0x0BBD,	%l2
	fmovrdlz	%o0,	%f18,	%f28
loop_2384:
	bg,a,pt	%xcc,	loop_2385
	nop
	fitos	%f23,	%f14
	tcc	%icc,	0x3
	nop
	setx	loop_2386,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2385:
	fornot1s	%f9,	%f1,	%f7
	fnot1	%f12,	%f30
	movrne	%g2,	0x24F,	%i3
loop_2386:
	edge16n	%g3,	%o2,	%i7
	fmovde	%xcc,	%f13,	%f22
	add	%l1,	0x0984,	%o3
	taddcc	%g6,	0x02FD,	%g5
	bg,a,pt	%xcc,	loop_2387
	fblg,a	%fcc2,	loop_2388
	std	%f26,	[%l7 + 0x30]
	movgu	%xcc,	%o1,	%g7
loop_2387:
	fble,a	%fcc2,	loop_2389
loop_2388:
	udivcc	%g4,	0x071B,	%l3
	fpadd16	%f4,	%f28,	%f2
	fnands	%f27,	%f4,	%f25
loop_2389:
	fornot1	%f18,	%f0,	%f8
	edge8	%l5,	%o5,	%i6
	tne	%xcc,	0x4
	fxnors	%f30,	%f27,	%f18
	st	%f19,	[%l7 + 0x1C]
	addccc	%i2,	%l4,	%o4
	movrlez	%l0,	0x004,	%i4
	bn,a,pn	%icc,	loop_2390
	nop
	setx	0xEB9ABE7ECAFE0C2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x36FFDA41594F1DDA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f2,	%f24
	fpsub32s	%f5,	%f3,	%f2
	sll	%i0,	0x07,	%i5
loop_2390:
	ba,a	%xcc,	loop_2391
	ta	%icc,	0x6
	addccc	%g1,	%o6,	%o7
	xnorcc	%i1,	0x01A4,	%l2
loop_2391:
	movgu	%icc,	%o0,	%l6
	edge32n	%g2,	%i3,	%o2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x78] %asi,	%g3
	udivcc	%i7,	0x06E5,	%o3
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x24,	%g6
	bcc,pt	%xcc,	loop_2392
	movvc	%xcc,	%l1,	%g5
	andcc	%g7,	0x13D1,	%o1
	movrne	%g4,	0x2C3,	%l5
loop_2392:
	fmovsvs	%xcc,	%f17,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f22,	%f4,	%f20
	smul	%l3,	%i6,	%o5
	umul	%i2,	%l4,	%o4
	fpsub16s	%f16,	%f11,	%f3
	fmuld8ulx16	%f26,	%f6,	%f8
	popc	0x018F,	%l0
	movcc	%xcc,	%i4,	%i0
	fbe	%fcc3,	loop_2393
	be,a	%icc,	loop_2394
	addcc	%i5,	%o6,	%o7
	movn	%xcc,	%g1,	%i1
loop_2393:
	bleu	%xcc,	loop_2395
loop_2394:
	tle	%icc,	0x3
	and	%o0,	%l6,	%l2
	edge8l	%g2,	%o2,	%g3
loop_2395:
	fmovsneg	%icc,	%f16,	%f2
	tcs	%icc,	0x6
	srax	%i3,	%o3,	%g6
	subc	%i7,	%l1,	%g7
	fpack16	%f6,	%f25
	bcs,pt	%xcc,	loop_2396
	or	%o1,	%g4,	%g5
	subc	%l5,	0x1BAD,	%l3
	fmovdne	%icc,	%f31,	%f17
loop_2396:
	udivcc	%i6,	0x0F5E,	%i2
	smulcc	%l4,	0x12B1,	%o5
	stw	%o4,	[%l7 + 0x20]
	taddcc	%i4,	%i0,	%l0
	set	0x20, %i2
	ldsba	[%l7 + %i2] 0x15,	%i5
	flush	%l7 + 0x54
	sdivcc	%o6,	0x0268,	%o7
	andcc	%i1,	%g1,	%l6
	fba	%fcc0,	loop_2397
	smulcc	%o0,	%l2,	%o2
	bvc,a	%xcc,	loop_2398
	fmul8ulx16	%f4,	%f6,	%f6
loop_2397:
	movrne	%g3,	%g2,	%i3
	movvc	%icc,	%g6,	%i7
loop_2398:
	ta	%icc,	0x5
	edge32ln	%l1,	%g7,	%o3
	orcc	%o1,	%g5,	%g4
	fornot1s	%f9,	%f6,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%l3,	loop_2399
	fbl	%fcc2,	loop_2400
	edge32n	%l5,	%i6,	%i2
	fmovdcc	%icc,	%f16,	%f27
loop_2399:
	orn	%o5,	%o4,	%i4
loop_2400:
	faligndata	%f24,	%f14,	%f26
	andn	%i0,	0x15DB,	%l0
	edge32l	%l4,	%o6,	%i5
	movrgez	%i1,	%o7,	%g1
	set	0x4E, %i1
	stha	%l6,	[%l7 + %i1] 0x22
	membar	#Sync
	fmovsgu	%icc,	%f6,	%f25
	fbule	%fcc0,	loop_2401
	movre	%o0,	%o2,	%l2
	tsubcctv	%g2,	0x1741,	%i3
	fornot2	%f8,	%f18,	%f6
loop_2401:
	fbu	%fcc0,	loop_2402
	movvc	%xcc,	%g3,	%g6
	subc	%i7,	0x18EA,	%l1
	edge16	%o3,	%o1,	%g5
loop_2402:
	fbge,a	%fcc3,	loop_2403
	tsubcc	%g4,	0x0C85,	%l3
	bne,a	%icc,	loop_2404
	lduw	[%l7 + 0x68],	%l5
loop_2403:
	tge	%xcc,	0x4
	movrne	%g7,	0x066,	%i2
loop_2404:
	xnorcc	%o5,	%i6,	%i4
	array8	%o4,	%i0,	%l4
	xorcc	%o6,	0x0252,	%i5
	fcmpeq16	%f12,	%f0,	%i1
	tn	%xcc,	0x7
	ba,a,pt	%icc,	loop_2405
	edge32	%o7,	%g1,	%l6
	fmovsneg	%icc,	%f30,	%f9
	array8	%l0,	%o0,	%o2
loop_2405:
	swap	[%l7 + 0x3C],	%l2
	edge8n	%i3,	%g3,	%g2
	bleu	%xcc,	loop_2406
	fnand	%f12,	%f8,	%f22
	tgu	%icc,	0x5
	movcs	%icc,	%i7,	%g6
loop_2406:
	movg	%icc,	%l1,	%o3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x17] %asi,	%g5
	tsubcctv	%g4,	0x0C43,	%l3
	srlx	%o1,	0x07,	%g7
	srl	%i2,	%l5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a,pn	%xcc,	loop_2407
	fbge	%fcc2,	loop_2408
	movgu	%xcc,	%o5,	%i4
	srax	%i0,	%l4,	%o4
loop_2407:
	bgu,a,pn	%icc,	loop_2409
loop_2408:
	fmovsa	%icc,	%f11,	%f1
	srlx	%i5,	0x10,	%i1
	nop
	setx	loop_2410,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2409:
	edge8n	%o6,	%g1,	%o7
	nop
	setx	0xD5F0DEF54EF87BE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2087AAF2FB025179,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f10,	%f16
	tle	%icc,	0x7
loop_2410:
	tsubcc	%l6,	0x0262,	%l0
	udivcc	%o2,	0x0714,	%o0
	tge	%xcc,	0x0
	edge8	%l2,	%g3,	%i3
	fpackfix	%f14,	%f18
	fbne,a	%fcc1,	loop_2411
	movleu	%icc,	%g2,	%i7
	movrne	%g6,	0x09B,	%l1
	udivcc	%g5,	0x0B25,	%o3
loop_2411:
	fmovsgu	%icc,	%f26,	%f15
	movn	%xcc,	%g4,	%l3
	srlx	%g7,	0x01,	%o1
	xnor	%i2,	%i6,	%o5
	fnot1	%f8,	%f26
	movle	%icc,	%i4,	%i0
	bneg,a,pt	%xcc,	loop_2412
	sir	0x07FF
	bge,a	%xcc,	loop_2413
	membar	0x4E
loop_2412:
	edge8ln	%l5,	%o4,	%l4
	add	%i5,	0x03A3,	%o6
loop_2413:
	sir	0x10E3
	fblg	%fcc1,	loop_2414
	edge16	%g1,	%i1,	%l6
	tneg	%icc,	0x2
	ldstub	[%l7 + 0x61],	%l0
loop_2414:
	movneg	%xcc,	%o7,	%o0
	fmovsvs	%xcc,	%f28,	%f3
	brlez	%l2,	loop_2415
	and	%g3,	%i3,	%o2
	edge32	%i7,	%g6,	%g2
	fsrc1s	%f3,	%f25
loop_2415:
	nop
	set	0x68, %g7
	stxa	%l1,	[%l7 + %g7] 0x04
	udivx	%o3,	0x00CF,	%g4
	alignaddr	%g5,	%g7,	%l3
	udivx	%i2,	0x1720,	%i6
	nop
	setx	0xF01322DF5062756E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o5
	array32	%i4,	%o1,	%i0
	edge16ln	%l5,	%l4,	%i5
	ta	%icc,	0x2
	nop
	fitos	%f2,	%f22
	fstod	%f22,	%f26
	fbne,a	%fcc0,	loop_2416
	ta	%xcc,	0x5
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f12
	tsubcc	%o6,	0x15C5,	%o4
loop_2416:
	ble,a	%icc,	loop_2417
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x7A, %l4
	ldsb	[%l7 + %l4],	%g1
	array32	%l6,	%i1,	%l0
loop_2417:
	subc	%o7,	%o0,	%g3
	ble	%xcc,	loop_2418
	edge32	%l2,	%i3,	%o2
	st	%f29,	[%l7 + 0x60]
	fbne	%fcc3,	loop_2419
loop_2418:
	ldsh	[%l7 + 0x6C],	%i7
	lduh	[%l7 + 0x2A],	%g6
	andcc	%g2,	0x1428,	%o3
loop_2419:
	tcs	%xcc,	0x3
	stw	%g4,	[%l7 + 0x50]
	movge	%icc,	%g5,	%l1
	edge8n	%g7,	%l3,	%i2
	fmovdgu	%xcc,	%f16,	%f3
	tleu	%icc,	0x0
	array8	%i6,	%i4,	%o5
	sra	%i0,	%l5,	%l4
	bl	loop_2420
	fmovda	%icc,	%f25,	%f12
	fpadd16s	%f8,	%f7,	%f12
	addc	%i5,	0x1CD6,	%o1
loop_2420:
	bneg,pt	%xcc,	loop_2421
	tvc	%xcc,	0x5
	subc	%o6,	0x0C38,	%g1
	movleu	%xcc,	%l6,	%i1
loop_2421:
	edge8n	%l0,	%o4,	%o7
	fbl	%fcc0,	loop_2422
	xor	%g3,	%o0,	%i3
	nop
	setx	loop_2423,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8ulx16	%f14,	%f10,	%f14
loop_2422:
	movle	%icc,	%l2,	%i7
	nop
	setx	0x4C966327FEE242F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6F18C097DE4BEE7F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f22,	%f20
loop_2423:
	add	%o2,	%g6,	%o3
	fmovsvc	%xcc,	%f4,	%f25
	smulcc	%g4,	0x01A7,	%g5
	movrgz	%l1,	%g7,	%g2
	andn	%l3,	%i2,	%i6
	tge	%icc,	0x2
	array16	%i4,	%o5,	%i0
	fbe	%fcc0,	loop_2424
	alignaddrl	%l5,	%l4,	%o1
	tvc	%icc,	0x7
	addc	%o6,	0x06FD,	%i5
loop_2424:
	fcmpeq32	%f28,	%f0,	%l6
	fpsub16s	%f9,	%f28,	%f4
	alignaddrl	%g1,	%i1,	%o4
	orn	%l0,	0x1FA8,	%g3
	mulx	%o0,	0x0AA9,	%i3
	udiv	%l2,	0x1DA6,	%o7
	fzero	%f24
	tpos	%xcc,	0x1
	edge32l	%o2,	%i7,	%g6
	bn,a,pt	%icc,	loop_2425
	sra	%g4,	%g5,	%o3
	smulcc	%l1,	%g2,	%g7
	tsubcc	%i2,	0x0B98,	%i6
loop_2425:
	array32	%l3,	%o5,	%i4
	movvc	%xcc,	%i0,	%l5
	brz	%l4,	loop_2426
	orn	%o6,	%i5,	%l6
	movrne	%g1,	%o1,	%i1
	fmovdle	%icc,	%f20,	%f26
loop_2426:
	movrgez	%l0,	%g3,	%o4
	srax	%i3,	0x14,	%o0
	movrne	%o7,	0x0B7,	%o2
	fmovsne	%xcc,	%f19,	%f8
	bge,a,pn	%icc,	loop_2427
	fcmpgt32	%f8,	%f2,	%l2
	be	%icc,	loop_2428
	edge16	%i7,	%g4,	%g5
loop_2427:
	bg,a	%icc,	loop_2429
	nop
	setx loop_2430, %l0, %l1
	jmpl %l1, %o3
loop_2428:
	taddcctv	%g6,	%g2,	%g7
	tleu	%icc,	0x2
loop_2429:
	add	%i2,	0x1F40,	%l1
loop_2430:
	fmovdn	%xcc,	%f0,	%f28
	movrgez	%i6,	0x1D0,	%l3
	srlx	%o5,	%i4,	%l5
	ldd	[%l7 + 0x10],	%i0
	udivcc	%l4,	0x11D1,	%i5
	sub	%l6,	0x0A74,	%g1
	udivx	%o1,	0x19FB,	%i1
	fornot1s	%f13,	%f12,	%f27
	subcc	%o6,	0x0A3E,	%l0
	bne,a,pn	%icc,	loop_2431
	movn	%xcc,	%o4,	%g3
	popc	%i3,	%o0
	srax	%o2,	0x1E,	%o7
loop_2431:
	movcs	%icc,	%i7,	%g4
	tne	%icc,	0x3
	sdivx	%l2,	0x1356,	%g5
	subc	%o3,	%g2,	%g6
	sub	%i2,	0x0950,	%l1
	stb	%g7,	[%l7 + 0x31]
	fcmpeq32	%f26,	%f2,	%l3
	wr	%g0,	0x19,	%asi
	stba	%o5,	[%l7 + 0x50] %asi
	edge8ln	%i4,	%i6,	%l5
	fone	%f6
	movrlz	%l4,	0x3BA,	%i5
	movle	%icc,	%i0,	%g1
	fnors	%f9,	%f0,	%f6
	fmovdneg	%icc,	%f26,	%f0
	subcc	%l6,	%o1,	%i1
	fsrc1	%f24,	%f6
	movrgz	%o6,	%o4,	%l0
	bl,a	%icc,	loop_2432
	popc	0x1F07,	%g3
	mulscc	%o0,	%o2,	%o7
	bl,a,pt	%icc,	loop_2433
loop_2432:
	movrlz	%i3,	%g4,	%i7
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x18,	 0x2
loop_2433:
	fmovrdlez	%l2,	%f18,	%f24
	movneg	%icc,	%o3,	%g6
	array8	%i2,	%l1,	%g7
	movn	%xcc,	%l3,	%o5
	alignaddr	%i4,	%i6,	%g2
	fba,a	%fcc3,	loop_2434
	fbu,a	%fcc2,	loop_2435
	bpos,pt	%icc,	loop_2436
	taddcc	%l5,	%i5,	%l4
loop_2434:
	nop
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0x1
loop_2435:
	ldd	[%l7 + 0x68],	%f26
loop_2436:
	taddcc	%l6,	0x053C,	%i0
	brz,a	%o1,	loop_2437
	fexpand	%f4,	%f20
	tvc	%icc,	0x0
	xnorcc	%i1,	%o4,	%l0
loop_2437:
	tg	%xcc,	0x5
	fand	%f28,	%f22,	%f6
	brgz	%g3,	loop_2438
	movn	%xcc,	%o6,	%o2
	tsubcc	%o7,	%o0,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2438:
	alignaddrl	%i7,	%g4,	%l2
	sdiv	%o3,	0x150D,	%g6
	umulcc	%g5,	0x1434,	%l1
	fnot1s	%f3,	%f12
	fble,a	%fcc2,	loop_2439
	udivcc	%i2,	0x1D7B,	%l3
	fnot1	%f10,	%f12
	array32	%g7,	%o5,	%i4
loop_2439:
	fmul8x16	%f11,	%f26,	%f14
	fbe,a	%fcc2,	loop_2440
	umul	%i6,	%l5,	%i5
	fmovdpos	%xcc,	%f31,	%f13
	xorcc	%g2,	%g1,	%l6
loop_2440:
	movvs	%xcc,	%l4,	%o1
	brlez	%i0,	loop_2441
	edge32ln	%i1,	%l0,	%g3
	sethi	0x05AB,	%o4
	udiv	%o6,	0x0359,	%o2
loop_2441:
	andn	%o0,	0x0994,	%o7
	xorcc	%i7,	%i3,	%l2
	edge8ln	%g4,	%g6,	%o3
	andn	%l1,	%i2,	%l3
	tsubcctv	%g7,	%o5,	%i4
	edge16	%i6,	%l5,	%i5
	sth	%g2,	[%l7 + 0x40]
	swap	[%l7 + 0x28],	%g5
	sethi	0x08C7,	%g1
	subc	%l4,	%o1,	%i0
	fmul8x16	%f14,	%f6,	%f0
	edge16	%i1,	%l6,	%l0
	movcs	%xcc,	%o4,	%o6
	movrlz	%g3,	%o2,	%o7
	bcs	%icc,	loop_2442
	fbuge,a	%fcc1,	loop_2443
	membar	0x08
	sdivx	%i7,	0x128C,	%o0
loop_2442:
	edge8l	%l2,	%i3,	%g6
loop_2443:
	addccc	%g4,	0x1186,	%o3
	fbule	%fcc0,	loop_2444
	sir	0x0C8A
	sethi	0x1AED,	%l1
	andncc	%i2,	%g7,	%l3
loop_2444:
	or	%o5,	%i4,	%l5
	movrne	%i5,	%g2,	%i6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x44] %asi,	%g1
	call	loop_2445
	edge16ln	%l4,	%g5,	%o1
	movvs	%xcc,	%i1,	%l6
	sir	0x07D0
loop_2445:
	sth	%l0,	[%l7 + 0x08]
	xnor	%o4,	%i0,	%o6
	xnor	%o2,	%g3,	%i7
	movl	%xcc,	%o7,	%o0
	taddcctv	%l2,	%g6,	%i3
	tcs	%xcc,	0x2
	fmovrdgz	%o3,	%f2,	%f6
	bge,a	loop_2446
	edge8	%g4,	%l1,	%i2
	set	0x50, %l2
	ldsba	[%l7 + %l2] 0x14,	%l3
loop_2446:
	fpmerge	%f10,	%f17,	%f24
	movleu	%icc,	%g7,	%o5
	edge8ln	%l5,	%i4,	%g2
	fpack32	%f24,	%f20,	%f16
	movpos	%icc,	%i6,	%i5
	set	0x2C, %i0
	sta	%f27,	[%l7 + %i0] 0x0c
	brgez	%l4,	loop_2447
	fcmpgt16	%f24,	%f24,	%g1
	nop
	setx	0xB06B0736305E4E2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	ta	%xcc,	0x3
loop_2447:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%g5
	st	%f12,	[%l7 + 0x60]
	fmovrse	%o1,	%f22,	%f0
	addcc	%l6,	%l0,	%i1
	tvs	%xcc,	0x2
	tneg	%xcc,	0x1
	fmul8sux16	%f0,	%f2,	%f22
	alignaddrl	%o4,	%i0,	%o2
	fmovs	%f21,	%f12
	tleu	%icc,	0x6
	membar	0x7B
	fors	%f4,	%f18,	%f14
	nop
	setx	loop_2448,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16n	%g3,	%i7,	%o7
	ldsb	[%l7 + 0x2C],	%o0
	fmovsg	%xcc,	%f0,	%f24
loop_2448:
	edge8n	%l2,	%g6,	%i3
	udivcc	%o6,	0x14E5,	%o3
	movre	%l1,	%i2,	%l3
	movrne	%g7,	0x2D6,	%g4
	fmovrde	%o5,	%f24,	%f10
	movle	%xcc,	%l5,	%g2
	sth	%i4,	[%l7 + 0x1E]
	bneg	loop_2449
	brgez,a	%i6,	loop_2450
	edge8	%l4,	%g1,	%g5
	nop
	setx	0xC179B3974D56818A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1984DBA94F1C1BD2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f10,	%f30
loop_2449:
	fbg	%fcc2,	loop_2451
loop_2450:
	subc	%i5,	%l6,	%l0
	edge8n	%o1,	%o4,	%i1
	andncc	%i0,	%o2,	%g3
loop_2451:
	ldsw	[%l7 + 0x20],	%i7
	smul	%o0,	0x1819,	%o7
	subcc	%g6,	%l2,	%o6
	edge16ln	%o3,	%i3,	%i2
	ld	[%l7 + 0x58],	%f2
	edge32ln	%l1,	%l3,	%g4
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x6A] %asi,	%o5
	fnot1	%f18,	%f24
	st	%f20,	[%l7 + 0x54]
	tgu	%icc,	0x4
	mulscc	%l5,	0x08B9,	%g2
	bcc,pn	%xcc,	loop_2452
	ldub	[%l7 + 0x35],	%g7
	array32	%i6,	%i4,	%l4
	movcc	%icc,	%g1,	%g5
loop_2452:
	xnor	%l6,	0x0259,	%l0
	tsubcctv	%o1,	%o4,	%i1
	movleu	%xcc,	%i0,	%i5
	udivcc	%g3,	0x1267,	%o2
	orn	%o0,	%i7,	%g6
	fmuld8ulx16	%f15,	%f9,	%f20
	move	%xcc,	%o7,	%l2
	fbu	%fcc3,	loop_2453
	xor	%o3,	0x0525,	%i3
	movge	%icc,	%i2,	%l1
	fbug,a	%fcc1,	loop_2454
loop_2453:
	taddcc	%l3,	%g4,	%o6
	stw	%l5,	[%l7 + 0x48]
	edge16l	%o5,	%g7,	%i6
loop_2454:
	tne	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f18,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc0,	loop_2455
	fmovdle	%icc,	%f11,	%f1
	mulscc	%g2,	%i4,	%l4
	or	%g1,	%l6,	%l0
loop_2455:
	fmovsvc	%xcc,	%f26,	%f18
	move	%xcc,	%o1,	%g5
	fpadd16s	%f7,	%f25,	%f8
	subcc	%i1,	%o4,	%i5
	stb	%i0,	[%l7 + 0x1C]
	nop
	fitos	%f13,	%f3
	fstox	%f3,	%f12
	fxtos	%f12,	%f11
	nop
	setx	0xD5A9E3EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xE9567E24,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f10,	%f6
	fbe	%fcc3,	loop_2456
	addcc	%o2,	0x18C1,	%g3
	fornot1	%f14,	%f30,	%f12
	fones	%f12
loop_2456:
	tvs	%icc,	0x5
	edge32l	%o0,	%g6,	%i7
	nop
	fitos	%f4,	%f4
	fbg,a	%fcc3,	loop_2457
	edge8l	%o7,	%o3,	%l2
	flush	%l7 + 0x30
	set	0x75, %i6
	ldsba	[%l7 + %i6] 0x18,	%i3
loop_2457:
	movge	%icc,	%l1,	%l3
	movrlz	%i2,	0x152,	%g4
	sdivcc	%o6,	0x04CB,	%o5
	movrlz	%g7,	%i6,	%l5
	add	%i4,	0x1720,	%l4
	ta	%xcc,	0x2
	udivx	%g2,	0x01F6,	%g1
	fones	%f8
	edge8	%l0,	%l6,	%o1
	movrne	%g5,	%i1,	%i5
	smulcc	%o4,	%o2,	%i0
	edge8	%o0,	%g3,	%g6
	movrlez	%o7,	%i7,	%l2
	orcc	%i3,	0x134D,	%o3
	nop
	setx	0x638DF66149D2B871,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3B9946E2DD934DBA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f20,	%f22
	brgz,a	%l3,	loop_2458
	umul	%l1,	0x002B,	%g4
	nop
	fitod	%f8,	%f26
	fdtos	%f26,	%f14
	edge16ln	%o6,	%i2,	%o5
loop_2458:
	bpos,a,pn	%xcc,	loop_2459
	movrgz	%i6,	%l5,	%i4
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f12
	fxtos	%f12,	%f0
	nop
	set	0x47, %g6
	ldsb	[%l7 + %g6],	%l4
loop_2459:
	fbule,a	%fcc2,	loop_2460
	umul	%g2,	%g1,	%g7
	fsrc2s	%f30,	%f5
	fmul8x16	%f31,	%f26,	%f14
loop_2460:
	movle	%icc,	%l6,	%l0
	movrlez	%g5,	%i1,	%o1
	edge8l	%o4,	%o2,	%i5
	fbu	%fcc1,	loop_2461
	nop
	setx	0x18D1A0268CB4EF05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1D5767A8166B05CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f22,	%f20
	subccc	%i0,	%g3,	%o0
	fsrc2s	%f0,	%f5
loop_2461:
	fandnot2	%f2,	%f18,	%f14
	fmovrde	%g6,	%f28,	%f12
	nop
	setx	0xE07DCD2F,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	lduh	[%l7 + 0x24],	%i7
	fbn,a	%fcc2,	loop_2462
	fba,a	%fcc2,	loop_2463
	tn	%xcc,	0x2
	tvc	%xcc,	0x2
loop_2462:
	tpos	%xcc,	0x7
loop_2463:
	srl	%l2,	0x19,	%o7
	nop
	setx	0x676168DB415DC0DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0940044B4E5A8E6A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f0,	%f10
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x88,	%o3
	edge32	%l3,	%i3,	%l1
	fand	%f16,	%f30,	%f6
	fbn,a	%fcc3,	loop_2464
	ldd	[%l7 + 0x08],	%f8
	fones	%f18
	movl	%icc,	%g4,	%o6
loop_2464:
	fnot1	%f20,	%f24
	edge8l	%o5,	%i6,	%l5
	movre	%i4,	0x3EC,	%l4
	sth	%i2,	[%l7 + 0x58]
	fbu	%fcc1,	loop_2465
	fbne,a	%fcc0,	loop_2466
	ldsb	[%l7 + 0x76],	%g1
	umul	%g7,	%g2,	%l6
loop_2465:
	fzero	%f24
loop_2466:
	call	loop_2467
	tn	%xcc,	0x2
	alignaddr	%l0,	%g5,	%i1
	xnorcc	%o1,	0x127C,	%o2
loop_2467:
	xnorcc	%o4,	%i5,	%g3
	fbug,a	%fcc1,	loop_2468
	movleu	%xcc,	%i0,	%o0
	bne,a	loop_2469
	bg	%icc,	loop_2470
loop_2468:
	tcs	%xcc,	0x5
	fbo	%fcc0,	loop_2471
loop_2469:
	edge32l	%g6,	%i7,	%l2
loop_2470:
	udivx	%o7,	0x105F,	%l3
	fabss	%f22,	%f22
loop_2471:
	addcc	%o3,	%l1,	%i3
	brnz,a	%o6,	loop_2472
	sdiv	%o5,	0x1C46,	%i6
	edge32	%g4,	%i4,	%l4
	movle	%xcc,	%l5,	%g1
loop_2472:
	fmovsvc	%icc,	%f8,	%f31
	orcc	%i2,	0x092F,	%g7
	add	%g2,	%l0,	%l6
	array8	%g5,	%i1,	%o2
	fnor	%f4,	%f16,	%f4
	tl	%icc,	0x1
	taddcc	%o4,	%o1,	%g3
	edge8ln	%i5,	%o0,	%g6
	movrgz	%i7,	0x11B,	%l2
	tcc	%xcc,	0x4
	fba	%fcc0,	loop_2473
	stw	%i0,	[%l7 + 0x74]
	taddcc	%l3,	0x1E23,	%o7
	fnot1s	%f20,	%f28
loop_2473:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l1
	bg,a,pn	%xcc,	loop_2474
	alignaddr	%o3,	%o6,	%i3
	sir	0x0A3D
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o5
loop_2474:
	edge16l	%i6,	%i4,	%g4
	fmovrdgz	%l5,	%f2,	%f24
	set	0x7A, %l0
	stha	%l4,	[%l7 + %l0] 0x81
	movre	%g1,	%i2,	%g2
	edge32n	%l0,	%l6,	%g7
	xnor	%i1,	0x08EE,	%g5
	fmovde	%icc,	%f15,	%f16
	fornot2s	%f21,	%f2,	%f17
	andncc	%o2,	%o4,	%g3
	ldsw	[%l7 + 0x7C],	%i5
	fmovrdlz	%o0,	%f30,	%f12
	edge32ln	%o1,	%g6,	%l2
	smul	%i7,	0x0DDD,	%i0
	fand	%f14,	%f30,	%f8
	be	%icc,	loop_2475
	bpos,a	%xcc,	loop_2476
	fpack32	%f28,	%f6,	%f8
	taddcctv	%o7,	%l1,	%o3
loop_2475:
	edge32n	%l3,	%i3,	%o6
loop_2476:
	fxor	%f0,	%f26,	%f24
	movge	%xcc,	%i6,	%i4
	edge8ln	%o5,	%l5,	%l4
	edge16ln	%g1,	%g4,	%g2
	movgu	%icc,	%i2,	%l6
	fpack32	%f30,	%f30,	%f16
	fands	%f26,	%f8,	%f19
	edge16ln	%g7,	%i1,	%l0
	movpos	%xcc,	%g5,	%o4
	nop
	setx	loop_2477,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpgt32	%f28,	%f20,	%g3
	edge32ln	%o2,	%i5,	%o0
	srl	%g6,	0x16,	%o1
loop_2477:
	edge8n	%i7,	%l2,	%i0
	fbge,a	%fcc0,	loop_2478
	fornot2s	%f10,	%f17,	%f14
	fmovscc	%icc,	%f3,	%f2
	movg	%icc,	%l1,	%o3
loop_2478:
	tvc	%xcc,	0x5
	lduw	[%l7 + 0x70],	%l3
	movrgez	%o7,	0x013,	%o6
	sll	%i3,	0x1C,	%i6
	fabsd	%f10,	%f4
	brnz	%o5,	loop_2479
	nop
	setx loop_2480, %l0, %l1
	jmpl %l1, %i4
	tcs	%xcc,	0x7
	orcc	%l4,	0x0737,	%l5
loop_2479:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x48] %asi,	%g1
loop_2480:
	fble	%fcc1,	loop_2481
	fmovrdlz	%g2,	%f28,	%f2
	set	0x64, %o4
	sta	%f31,	[%l7 + %o4] 0x81
loop_2481:
	tge	%xcc,	0x1
	movrlez	%i2,	%l6,	%g7
	tvs	%icc,	0x4
	fpack16	%f30,	%f24
	ble,a,pn	%icc,	loop_2482
	taddcc	%g4,	%l0,	%i1
	movl	%xcc,	%o4,	%g3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g5,	%i5
loop_2482:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	bl	loop_2483
	andn	%g6,	%o1,	%o2
	alignaddr	%l2,	%i7,	%l1
	sub	%i0,	0x139A,	%o3
loop_2483:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l3,	%o6,	%i3
	nop
	setx	0xCEC9C12B4FEDBE60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5123F6DEAAA5EF39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f22,	%f24
	ldub	[%l7 + 0x6C],	%i6
	bvs,pn	%xcc,	loop_2484
	xorcc	%o5,	%i4,	%l4
	movrgz	%l5,	0x336,	%o7
	tvs	%xcc,	0x5
loop_2484:
	tle	%icc,	0x2
	popc	0x135A,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a	%xcc,	loop_2485
	bcc,a	%icc,	loop_2486
	nop
	setx	loop_2487,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x7
loop_2485:
	tpos	%xcc,	0x6
loop_2486:
	tpos	%xcc,	0x6
loop_2487:
	fands	%f31,	%f17,	%f11
	or	%i2,	0x0556,	%l6
	movcc	%icc,	%g2,	%g7
	popc	0x013D,	%l0
	addccc	%g4,	%o4,	%g3
	tvc	%xcc,	0x5
	mova	%icc,	%g5,	%i5
	tpos	%icc,	0x0
	ba,pt	%icc,	loop_2488
	orn	%i1,	0x187A,	%o0
	tvs	%icc,	0x0
	movrgz	%g6,	0x38B,	%o1
loop_2488:
	nop
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x81
	sethi	0x073C,	%l2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x30] %asi,	%o2
	movn	%icc,	%l1,	%i0
	fcmpeq16	%f16,	%f2,	%i7
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%o3
	tcc	%icc,	0x7
	brlez,a	%l3,	loop_2489
	movne	%xcc,	%o6,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i3,	0x076E,	%o5
loop_2489:
	movvc	%xcc,	%l4,	%i4
	fmovrsgz	%o7,	%f2,	%f26
	orn	%l5,	%i2,	%l6
	fpack32	%f24,	%f0,	%f16
	popc	0x0D16,	%g2
	udiv	%g1,	0x1E75,	%g7
	edge32ln	%g4,	%l0,	%g3
	fmovd	%f12,	%f22
	xnor	%o4,	%i5,	%g5
	fmovrsne	%i1,	%f19,	%f10
	ld	[%l7 + 0x74],	%f7
	sra	%o0,	%o1,	%g6
	sir	0x02EB
	fsrc2	%f0,	%f0
	edge16	%l2,	%l1,	%i0
	tne	%xcc,	0x3
	alignaddr	%i7,	%o2,	%o3
	bl	%icc,	loop_2490
	orncc	%l3,	0x094C,	%o6
	sethi	0x1DD6,	%i6
	srax	%o5,	%i3,	%i4
loop_2490:
	movl	%xcc,	%o7,	%l5
	fone	%f8
	edge16	%l4,	%i2,	%l6
	std	%f16,	[%l7 + 0x30]
	sdiv	%g1,	0x01CE,	%g2
	movneg	%xcc,	%g4,	%g7
	fnand	%f18,	%f4,	%f24
	fbule,a	%fcc2,	loop_2491
	mulx	%g3,	%l0,	%i5
	fmovd	%f8,	%f14
	sub	%o4,	%i1,	%g5
loop_2491:
	ldsb	[%l7 + 0x62],	%o1
	array16	%o0,	%g6,	%l1
	fornot1s	%f14,	%f31,	%f16
	st	%f2,	[%l7 + 0x50]
	edge8n	%i0,	%l2,	%o2
	fbuge,a	%fcc1,	loop_2492
	sdivx	%i7,	0x13D9,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l3,	%f30,	%f4
loop_2492:
	mulx	%o6,	%o5,	%i6
	movrne	%i3,	%i4,	%l5
	for	%f0,	%f14,	%f28
	movrne	%l4,	0x0F3,	%o7
	fmovs	%f10,	%f12
	fbg,a	%fcc0,	loop_2493
	movcc	%icc,	%i2,	%l6
	array32	%g2,	%g1,	%g7
	edge8l	%g3,	%g4,	%l0
loop_2493:
	sra	%o4,	0x15,	%i1
	srax	%i5,	0x19,	%g5
	edge8n	%o1,	%g6,	%o0
	edge32n	%i0,	%l2,	%o2
	movvs	%icc,	%i7,	%l1
	udivx	%o3,	0x0C6A,	%o6
	subcc	%l3,	%i6,	%o5
	edge8	%i3,	%i4,	%l4
	bge,a,pt	%icc,	loop_2494
	sdiv	%o7,	0x0C4A,	%l5
	sir	0x1879
	edge32l	%i2,	%g2,	%g1
loop_2494:
	edge8	%l6,	%g3,	%g7
	membar	0x3C
	movge	%icc,	%l0,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x64] %asi,	%o4
	ta	%xcc,	0x7
	fmovdle	%icc,	%f12,	%f4
	movle	%xcc,	%i5,	%i1
	brgz	%o1,	loop_2495
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f2
	stw	%g6,	[%l7 + 0x40]
	fone	%f14
loop_2495:
	xnorcc	%g5,	0x0C9A,	%i0
	udivcc	%o0,	0x1365,	%o2
	movrgz	%l2,	0x214,	%l1
	mova	%xcc,	%o3,	%i7
	nop
	fitod	%f2,	%f12
	fdtos	%f12,	%f3
	movn	%icc,	%o6,	%i6
	fbe	%fcc3,	loop_2496
	tne	%icc,	0x7
	edge8n	%l3,	%o5,	%i3
	fcmpgt32	%f24,	%f20,	%l4
loop_2496:
	movle	%xcc,	%i4,	%l5
	tvs	%icc,	0x5
	fmovsge	%xcc,	%f15,	%f7
	movne	%xcc,	%i2,	%o7
	fmovdcs	%icc,	%f2,	%f14
	fmovdpos	%icc,	%f28,	%f31
	fabsd	%f22,	%f14
	movleu	%xcc,	%g2,	%g1
	array32	%g3,	%l6,	%g7
	flush	%l7 + 0x74
	fpackfix	%f4,	%f16
	fbge,a	%fcc0,	loop_2497
	for	%f12,	%f14,	%f10
	edge16	%g4,	%o4,	%i5
	ldsh	[%l7 + 0x0E],	%l0
loop_2497:
	edge8	%i1,	%g6,	%o1
	andncc	%i0,	%o0,	%o2
	edge32ln	%g5,	%l2,	%l1
	tne	%icc,	0x6
	srlx	%o3,	0x16,	%o6
	andn	%i7,	%i6,	%o5
	fbn,a	%fcc3,	loop_2498
	movgu	%xcc,	%l3,	%l4
	membar	0x4E
	subc	%i4,	0x0B61,	%i3
loop_2498:
	addccc	%l5,	%o7,	%g2
	ldsh	[%l7 + 0x32],	%g1
	ldub	[%l7 + 0x1F],	%g3
	fcmpne16	%f30,	%f28,	%i2
	tcc	%icc,	0x3
	nop
	setx loop_2499, %l0, %l1
	jmpl %l1, %g7
	mulscc	%l6,	0x03FE,	%g4
	sll	%o4,	0x04,	%i5
	edge16l	%i1,	%g6,	%o1
loop_2499:
	fors	%f31,	%f4,	%f31
	movrne	%i0,	%o0,	%l0
	movge	%icc,	%o2,	%l2
	wr	%g0,	0x80,	%asi
	stxa	%g5,	[%l7 + 0x20] %asi
	fmovrslz	%l1,	%f22,	%f5
	fcmpne16	%f12,	%f16,	%o3
	movvc	%xcc,	%o6,	%i7
	fbuge	%fcc1,	loop_2500
	smulcc	%i6,	0x0C4C,	%o5
	set	0x56, %i4
	stha	%l4,	[%l7 + %i4] 0x23
	membar	#Sync
loop_2500:
	tcc	%xcc,	0x3
	call	loop_2501
	edge16n	%l3,	%i4,	%i3
	movleu	%icc,	%l5,	%g2
	xnorcc	%o7,	%g3,	%g1
loop_2501:
	fmovdneg	%icc,	%f5,	%f27
	smul	%i2,	%l6,	%g4
	tsubcc	%g7,	0x1F0E,	%o4
	bpos,a	loop_2502
	for	%f28,	%f24,	%f30
	edge8n	%i1,	%i5,	%g6
	brgez,a	%i0,	loop_2503
loop_2502:
	fmovscc	%icc,	%f6,	%f31
	fble	%fcc1,	loop_2504
	fcmpne32	%f16,	%f16,	%o1
loop_2503:
	nop
	fitos	%f4,	%f1
	fstod	%f1,	%f6
	bshuffle	%f10,	%f14,	%f22
loop_2504:
	tpos	%xcc,	0x0
	fbne	%fcc0,	loop_2505
	movg	%icc,	%l0,	%o2
	array16	%l2,	%g5,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o3,	%l1
loop_2505:
	subcc	%o6,	0x07E7,	%i6
	edge32	%i7,	%o5,	%l3
	xnor	%i4,	%i3,	%l5
	be,a,pt	%xcc,	loop_2506
	tl	%xcc,	0x6
	edge8n	%g2,	%l4,	%g3
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
loop_2506:
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f19
	popc	%o7,	%i2
	tcc	%icc,	0x4
loop_2507:
	edge32ln	%l6,	%g1,	%g4
	stb	%g7,	[%l7 + 0x31]
	movvc	%icc,	%o4,	%i1
	fbe	%fcc1,	loop_2508
	edge32l	%g6,	%i0,	%i5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%o1
loop_2508:
	edge16l	%l0,	%o2,	%l2
	nop
	setx	0x506CA387,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	addcc	%g5,	%o3,	%o0
	movge	%icc,	%o6,	%i6
	edge8n	%l1,	%o5,	%i7
	call	loop_2509
	brnz,a	%l3,	loop_2510
	for	%f28,	%f12,	%f6
	nop
	fitos	%f0,	%f4
loop_2509:
	smul	%i3,	%i4,	%l5
loop_2510:
	fmuld8ulx16	%f21,	%f11,	%f30
	tle	%icc,	0x2
	fnor	%f4,	%f8,	%f20
	bleu,a,pt	%icc,	loop_2511
	movpos	%xcc,	%l4,	%g3
	fmovdne	%xcc,	%f13,	%f23
	movrne	%g2,	0x2E1,	%i2
loop_2511:
	addccc	%l6,	0x0B1D,	%o7
	movle	%icc,	%g4,	%g7
	edge8ln	%g1,	%i1,	%o4
	movrne	%g6,	0x3EE,	%i5
	bgu,a	loop_2512
	nop
	setx	0x5AB7BC318B2B5DBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE4C8EF90F9D79902,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f0,	%f0
	movrne	%i0,	0x3ED,	%l0
	fble,a	%fcc3,	loop_2513
loop_2512:
	fbo,a	%fcc2,	loop_2514
	bvs,a,pt	%xcc,	loop_2515
	addc	%o1,	%o2,	%g5
loop_2513:
	fnot2s	%f9,	%f24
loop_2514:
	movrne	%o3,	0x1D5,	%l2
loop_2515:
	tge	%icc,	0x5
	fmovdg	%icc,	%f19,	%f15
	alignaddr	%o0,	%i6,	%o6
	sdivx	%l1,	0x0A69,	%o5
	alignaddr	%l3,	%i3,	%i7
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l5
	edge32l	%l4,	%g3,	%g2
	fmul8x16al	%f0,	%f13,	%f18
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i4,	%i2
	nop
	setx	0xE9255EF2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x6A49DA74,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f20,	%f3
	fmul8x16	%f12,	%f26,	%f8
	movle	%xcc,	%l6,	%g4
	nop
	setx	loop_2516,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%icc,	0x1
	edge16	%g7,	%g1,	%o7
	bl,a	%icc,	loop_2517
loop_2516:
	fmovde	%xcc,	%f5,	%f2
	movrne	%o4,	%i1,	%i5
	smul	%g6,	0x11D7,	%i0
loop_2517:
	popc	0x0755,	%l0
	subccc	%o1,	0x0813,	%g5
	tsubcc	%o2,	0x1DE5,	%o3
	wr	%g0,	0x19,	%asi
	stxa	%l2,	[%l7 + 0x68] %asi
	bcc,a,pn	%xcc,	loop_2518
	movl	%icc,	%o0,	%i6
	tneg	%xcc,	0x1
	edge8ln	%l1,	%o6,	%l3
loop_2518:
	movrgez	%i3,	%i7,	%o5
	brlz	%l5,	loop_2519
	tl	%icc,	0x4
	movn	%xcc,	%l4,	%g2
	fpmerge	%f13,	%f21,	%f14
loop_2519:
	udivx	%g3,	0x0C0B,	%i2
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x11
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbule,a	%fcc2,	loop_2520
	fmul8ulx16	%f28,	%f26,	%f12
	alignaddrl	%l6,	%i4,	%g4
	fornot1	%f6,	%f30,	%f16
loop_2520:
	fnand	%f24,	%f12,	%f30
	edge16ln	%g1,	%o7,	%g7
	fsrc1	%f28,	%f26
	fandnot1	%f20,	%f6,	%f24
	sethi	0x16DD,	%o4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x40] %asi,	%i1
	tgu	%xcc,	0x0
	fbu	%fcc2,	loop_2521
	tvs	%icc,	0x4
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
loop_2521:
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f12
	fxtos	%f12,	%f0
	mulscc	%i5,	%l0,	%i0
	sra	%o1,	%o2,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o3,	%l2,	%o0
	array8	%i6,	%l1,	%o6
	sub	%l3,	0x01C7,	%i7
	set	0x38, %o2
	lduha	[%l7 + %o2] 0x11,	%o5
	smul	%l5,	0x1E8D,	%l4
	umul	%i3,	%g3,	%i2
	fble	%fcc0,	loop_2522
	tleu	%xcc,	0x4
	set	0x110, %g2
	ldxa	[%g0 + %g2] 0x52,	%g2
loop_2522:
	fmovsgu	%xcc,	%f5,	%f17
	edge32n	%l6,	%g4,	%g1
	smul	%o7,	%g7,	%i4
	wr	%g0,	0xe2,	%asi
	stxa	%o4,	[%l7 + 0x20] %asi
	membar	#Sync
	tsubcc	%i1,	0x0B38,	%g6
	edge16ln	%i5,	%i0,	%o1
	orn	%l0,	0x1570,	%o2
	set	0x18, %o5
	swapa	[%l7 + %o5] 0x04,	%g5
	movrne	%l2,	%o0,	%i6
	bne,a,pt	%icc,	loop_2523
	popc	%l1,	%o3
	brlez	%o6,	loop_2524
	tl	%xcc,	0x0
loop_2523:
	tsubcctv	%i7,	%l3,	%o5
	tne	%icc,	0x1
loop_2524:
	alignaddrl	%l4,	%l5,	%i3
	movcc	%xcc,	%i2,	%g3
	fmovsgu	%icc,	%f12,	%f12
	stx	%g2,	[%l7 + 0x30]
	tcc	%icc,	0x1
	ldd	[%l7 + 0x60],	%i6
	tn	%icc,	0x5
	movrgez	%g1,	%o7,	%g4
	fmovsle	%xcc,	%f10,	%f12
	mulscc	%i4,	%g7,	%i1
	addcc	%g6,	%o4,	%i0
	tsubcc	%i5,	0x1014,	%o1
	set	0x74, %o0
	lda	[%l7 + %o0] 0x04,	%f27
	orcc	%l0,	0x16E9,	%o2
	bgu,a	%icc,	loop_2525
	fmovdg	%xcc,	%f21,	%f30
	subccc	%g5,	0x1B43,	%o0
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f10
	fxtod	%f10,	%f0
loop_2525:
	sll	%l2,	0x17,	%l1
	sdiv	%i6,	0x198F,	%o6
	fmovspos	%icc,	%f14,	%f6
	edge16	%i7,	%l3,	%o3
	sdivx	%o5,	0x0246,	%l5
	set	0x4C, %g3
	stwa	%l4,	[%l7 + %g3] 0x04
	fmovsn	%xcc,	%f13,	%f27
	fmovdcs	%icc,	%f7,	%f24
	nop
	fitos	%f13,	%f8
	tn	%icc,	0x5
	fmovrsne	%i3,	%f27,	%f2
	lduh	[%l7 + 0x48],	%i2
	edge16l	%g3,	%l6,	%g2
	flush	%l7 + 0x0C
	movrlez	%o7,	0x1A3,	%g4
	sllx	%i4,	%g1,	%i1
	srax	%g6,	%o4,	%i0
	bvs,pt	%icc,	loop_2526
	edge32ln	%g7,	%o1,	%i5
	ldsh	[%l7 + 0x4C],	%o2
	tcs	%icc,	0x2
loop_2526:
	edge16ln	%g5,	%o0,	%l0
	sra	%l1,	%i6,	%l2
	ldstub	[%l7 + 0x5E],	%i7
	movrne	%l3,	%o3,	%o5
	bne,a	%icc,	loop_2527
	tg	%xcc,	0x1
	movvs	%icc,	%o6,	%l5
	movn	%xcc,	%i3,	%l4
loop_2527:
	movcc	%xcc,	%i2,	%g3
	taddcc	%g2,	0x0647,	%o7
	fxor	%f12,	%f10,	%f24
	flush	%l7 + 0x20
	or	%l6,	%i4,	%g1
	membar	0x4C
	bne	loop_2528
	fnor	%f24,	%f20,	%f0
	fmul8x16	%f7,	%f24,	%f8
	ldsh	[%l7 + 0x38],	%i1
loop_2528:
	brlz	%g6,	loop_2529
	tge	%icc,	0x5
	bleu	%icc,	loop_2530
	orncc	%o4,	0x1043,	%g4
loop_2529:
	fbge	%fcc1,	loop_2531
	orcc	%g7,	0x15E9,	%i0
loop_2530:
	movcc	%xcc,	%i5,	%o1
	fmovrdne	%g5,	%f14,	%f10
loop_2531:
	fmovse	%icc,	%f20,	%f26
	array8	%o2,	%o0,	%l1
	fbne	%fcc1,	loop_2532
	udiv	%i6,	0x1320,	%l0
	fors	%f23,	%f9,	%f12
	fcmpgt16	%f22,	%f0,	%i7
loop_2532:
	sra	%l3,	0x1B,	%l2
	movl	%xcc,	%o5,	%o6
	move	%icc,	%o3,	%i3
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	tpos	%icc,	0x1
	fmovdg	%xcc,	%f17,	%f22
	udivx	%l5,	0x00D1,	%i2
	ldsb	[%l7 + 0x6E],	%g2
	fmovdcc	%xcc,	%f19,	%f15
	xor	%o7,	%l6,	%g3
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f18
	andn	%g1,	%i4,	%i1
	te	%xcc,	0x4
	nop
	setx	0x90AA9BA2C14F4FA8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC5978AD33EE7EC3E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f8,	%f26
	fcmpgt32	%f14,	%f26,	%g6
	bne,pt	%xcc,	loop_2533
	fcmpgt16	%f4,	%f24,	%g4
	and	%g7,	0x130E,	%o4
	alignaddrl	%i5,	%i0,	%g5
loop_2533:
	fones	%f6
	tge	%xcc,	0x6
	ldsw	[%l7 + 0x38],	%o1
	srlx	%o0,	%o2,	%i6
	bcc,a,pt	%xcc,	loop_2534
	mova	%xcc,	%l1,	%i7
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2534:
	nop
	set	0x10, %g4
	ldxa	[%g0 + %g4] 0x4f,	%l0
	te	%icc,	0x1
	fmovscs	%xcc,	%f9,	%f26
	fmovrsgz	%l2,	%f9,	%f21
	fmovrslez	%l3,	%f6,	%f23
	movcs	%xcc,	%o6,	%o5
	fcmple32	%f20,	%f18,	%o3
	fmovrdlz	%i3,	%f12,	%f16
	sdivcc	%l5,	0x0A63,	%i2
	movrgez	%l4,	0x167,	%o7
	call	loop_2535
	mova	%icc,	%l6,	%g3
	fnegd	%f14,	%f10
	fbe	%fcc2,	loop_2536
loop_2535:
	fpmerge	%f20,	%f12,	%f0
	fmovd	%f4,	%f22
	ldd	[%l7 + 0x40],	%g0
loop_2536:
	nop
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x89,	%i4
	movle	%xcc,	%g2,	%g6
	fxors	%f24,	%f31,	%f23
	xnor	%i1,	0x0BBA,	%g4
	tpos	%icc,	0x6
	orncc	%o4,	0x140B,	%i5
	movl	%xcc,	%i0,	%g5
	bne	%xcc,	loop_2537
	fornot1	%f20,	%f6,	%f4
	tleu	%xcc,	0x6
	fnors	%f11,	%f28,	%f11
loop_2537:
	fmovrdgz	%g7,	%f20,	%f22
	ldd	[%l7 + 0x30],	%o0
	movre	%o0,	0x003,	%o2
	udiv	%i6,	0x1A4C,	%i7
	stb	%l1,	[%l7 + 0x6A]
	addc	%l2,	%l3,	%l0
	nop
	setx	0xB8EBBE31B04CDA51,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	brnz,a	%o5,	loop_2538
	tl	%icc,	0x6
	movcs	%xcc,	%o3,	%o6
	tcs	%xcc,	0x5
loop_2538:
	fmovdcc	%icc,	%f16,	%f1
	bg,a,pn	%xcc,	loop_2539
	fandnot1s	%f11,	%f19,	%f28
	sra	%l5,	%i3,	%i2
	mulscc	%l4,	%l6,	%o7
loop_2539:
	andncc	%g1,	%g3,	%g2
	edge8	%g6,	%i1,	%g4
	nop
	setx	0x505A5B1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	subccc	%i4,	0x1739,	%i5
	xnorcc	%i0,	%o4,	%g5
	ldsw	[%l7 + 0x68],	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o0,	0x0944,	%o1
	mulscc	%i6,	%o2,	%l1
	tn	%xcc,	0x3
	udivcc	%l2,	0x1495,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	loop_2540
	movcs	%icc,	%l3,	%o5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l0,	%o6
loop_2540:
	srlx	%l5,	%i3,	%i2
	ba	%icc,	loop_2541
	tvc	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x34, %g5
	swapa	[%l7 + %g5] 0x80,	%o3
loop_2541:
	srl	%l4,	0x02,	%l6
	movre	%o7,	0x3CC,	%g1
	nop
	fitod	%f8,	%f16
	fdtoi	%f16,	%f17
	xorcc	%g2,	0x1CB6,	%g6
	edge32l	%i1,	%g3,	%i4
	tg	%xcc,	0x5
	sdivcc	%g4,	0x1C7A,	%i0
	umulcc	%i5,	0x16C2,	%g5
	and	%g7,	0x10B6,	%o4
	movrlez	%o1,	0x0FF,	%i6
	sdiv	%o0,	0x0CD3,	%l1
	fxors	%f12,	%f26,	%f0
	ldsb	[%l7 + 0x0F],	%l2
	nop
	setx loop_2542, %l0, %l1
	jmpl %l1, %o2
	smul	%i7,	%o5,	%l0
	bvs,pt	%xcc,	loop_2543
	tsubcc	%l3,	%l5,	%o6
loop_2542:
	edge16n	%i3,	%o3,	%l4
	movne	%xcc,	%i2,	%o7
loop_2543:
	fnor	%f0,	%f0,	%f18
	be,a,pn	%xcc,	loop_2544
	movleu	%xcc,	%l6,	%g1
	orcc	%g2,	0x089B,	%i1
	movrgz	%g6,	0x2B8,	%g3
loop_2544:
	edge32l	%g4,	%i0,	%i5
	nop
	setx	0xE8A45FC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f8
	sll	%i4,	%g7,	%o4
	tcs	%xcc,	0x2
	swap	[%l7 + 0x30],	%o1
	movvs	%xcc,	%g5,	%i6
	orncc	%l1,	%o0,	%l2
	fandnot1s	%f29,	%f11,	%f2
	nop
	setx	0x59F9BC70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x3F14B14C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f27,	%f6
	smulcc	%o2,	%i7,	%l0
	tle	%icc,	0x2
	tpos	%xcc,	0x7
	addcc	%o5,	%l3,	%l5
	movle	%xcc,	%o6,	%i3
	umul	%o3,	%l4,	%i2
	umul	%l6,	%o7,	%g2
	fmovdgu	%icc,	%f23,	%f28
	nop
	setx	loop_2545,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f10,	%f16,	%f16
	movne	%xcc,	%g1,	%i1
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f0
	fxtod	%f0,	%f8
loop_2545:
	nop
	set	0x28, %g1
	stxa	%g6,	[%l7 + %g1] 0x23
	membar	#Sync
	popc	0x0766,	%g4
	taddcc	%i0,	0x03FE,	%i5
	nop
	setx	0xB05DC346,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fblg	%fcc0,	loop_2546
	popc	0x1E99,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g3,	%o4
loop_2546:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g7
	alignaddr	%g5,	%o1,	%i6
	addccc	%o0,	%l2,	%l1
	orcc	%i7,	%o2,	%l0
	movne	%icc,	%o5,	%l5
	sir	0x0C32
	nop
	setx	0x4A67BF2AFBC8C054,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1A13AF26ADA8119D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f6,	%f0
	and	%l3,	0x135B,	%i3
	tvs	%icc,	0x3
	xor	%o3,	0x169A,	%o6
	popc	%l4,	%i2
	fblg,a	%fcc3,	loop_2547
	faligndata	%f14,	%f4,	%f10
	nop
	fitod	%f10,	%f26
	fdtos	%f26,	%f23
	sdivcc	%l6,	0x0F38,	%o7
loop_2547:
	nop
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x15,	 0x3
	tsubcc	%i1,	0x183C,	%g1
	fmovdcs	%icc,	%f23,	%f16
	edge16l	%g4,	%i0,	%g6
	fnot2s	%f20,	%f27
	ta	%icc,	0x7
	udivcc	%i5,	0x0897,	%g3
	ta	%xcc,	0x5
	fmovrsgz	%i4,	%f30,	%f11
	edge16ln	%o4,	%g7,	%g5
	fmuld8ulx16	%f14,	%f6,	%f24
	umul	%o1,	%o0,	%l2
	nop
	setx	0xA629CA68,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x250E1BDE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f1,	%f23
	sethi	0x0670,	%l1
	fpackfix	%f14,	%f14
	sethi	0x1E65,	%i6
	fbule	%fcc3,	loop_2548
	movl	%icc,	%o2,	%i7
	edge32n	%o5,	%l5,	%l3
	smulcc	%l0,	%o3,	%o6
loop_2548:
	fmovrdgez	%l4,	%f22,	%f8
	movrne	%i2,	%i3,	%o7
	umulcc	%g2,	%i1,	%l6
	udivx	%g1,	0x08E3,	%g4
	sdivcc	%i0,	0x11B2,	%i5
	fandnot2s	%f11,	%f12,	%f13
	tge	%icc,	0x6
	prefetch	[%l7 + 0x14],	 0x1
	fble,a	%fcc0,	loop_2549
	tcc	%icc,	0x7
	bg,a	loop_2550
	fmovde	%xcc,	%f26,	%f29
loop_2549:
	movcc	%xcc,	%g6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2550:
	sllx	%i4,	0x11,	%o4
	tg	%xcc,	0x2
	fble,a	%fcc2,	loop_2551
	tneg	%xcc,	0x4
	bge,a,pt	%icc,	loop_2552
	tneg	%icc,	0x5
loop_2551:
	movrgez	%g7,	%g5,	%o1
	mova	%icc,	%l2,	%l1
loop_2552:
	andcc	%i6,	%o0,	%o2
	alignaddr	%i7,	%o5,	%l5
	alignaddr	%l3,	%o3,	%l0
	edge16l	%o6,	%l4,	%i3
	movvs	%icc,	%o7,	%i2
	orncc	%i1,	%g2,	%g1
	mulscc	%g4,	0x1624,	%l6
	andcc	%i0,	%g6,	%i5
	sra	%i4,	0x0C,	%g3
	lduw	[%l7 + 0x5C],	%g7
	fsrc2s	%f26,	%f0
	mulx	%g5,	%o4,	%o1
	alignaddr	%l1,	%i6,	%o0
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x19
	orcc	%o2,	%i7,	%l2
	brgez	%l5,	loop_2553
	and	%o5,	%o3,	%l3
	ld	[%l7 + 0x58],	%f8
	orncc	%o6,	%l0,	%l4
loop_2553:
	alignaddr	%i3,	%i2,	%i1
	fbo	%fcc0,	loop_2554
	movre	%g2,	%o7,	%g4
	srl	%g1,	%l6,	%g6
	srlx	%i0,	%i5,	%g3
loop_2554:
	edge8ln	%i4,	%g5,	%o4
	sra	%o1,	0x04,	%g7
	mova	%icc,	%l1,	%i6
	fcmpeq32	%f18,	%f30,	%o2
	array16	%o0,	%i7,	%l5
	smul	%l2,	%o3,	%l3
	taddcc	%o5,	0x0482,	%o6
	orn	%l0,	%l4,	%i2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i1
	movvs	%icc,	%i3,	%o7
	nop
	setx	loop_2555,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%icc,	0x3
	movvc	%icc,	%g2,	%g1
	srax	%g4,	%g6,	%i0
loop_2555:
	udivx	%i5,	0x077B,	%l6
	sllx	%i4,	0x1E,	%g5
	andcc	%g3,	%o4,	%o1
	bvc,pt	%icc,	loop_2556
	tg	%xcc,	0x7
	bvs,pt	%icc,	loop_2557
	fbne	%fcc1,	loop_2558
loop_2556:
	tl	%xcc,	0x3
	fsrc2s	%f15,	%f6
loop_2557:
	sir	0x1DE0
loop_2558:
	tl	%icc,	0x0
	fbuge	%fcc2,	loop_2559
	nop
	setx	loop_2560,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%g7,	%l1,	%o2
	tvs	%xcc,	0x2
loop_2559:
	te	%xcc,	0x5
loop_2560:
	movn	%xcc,	%i6,	%i7
	fmovrsgez	%l5,	%f7,	%f13
	fmovscc	%xcc,	%f12,	%f10
	orncc	%o0,	%o3,	%l3
	fpadd16s	%f8,	%f13,	%f11
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%o5
	fpadd16	%f10,	%f20,	%f0
	bshuffle	%f10,	%f6,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l2,	0x0221,	%o6
	tle	%xcc,	0x2
	array8	%l0,	%l4,	%i1
	fbg,a	%fcc0,	loop_2561
	brnz,a	%i2,	loop_2562
	fmovsgu	%xcc,	%f1,	%f0
	edge16l	%o7,	%g2,	%i3
loop_2561:
	stw	%g4,	[%l7 + 0x54]
loop_2562:
	mulx	%g1,	%g6,	%i5
	tpos	%xcc,	0x7
	fand	%f10,	%f30,	%f4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x70] %asi,	%f11
	wr	%g0,	0x81,	%asi
	stxa	%l6,	[%l7 + 0x50] %asi
	movn	%xcc,	%i4,	%g5
	srlx	%i0,	%g3,	%o4
	orcc	%o1,	0x17FE,	%l1
	brlz,a	%g7,	loop_2563
	alignaddr	%i6,	%i7,	%l5
	fmovsne	%xcc,	%f6,	%f31
	edge8l	%o2,	%o0,	%o3
loop_2563:
	and	%l3,	0x1E75,	%o5
	mulscc	%o6,	0x0C8C,	%l2
	fmovsge	%xcc,	%f24,	%f8
	bleu,a	loop_2564
	addccc	%l0,	%l4,	%i2
	array8	%i1,	%o7,	%i3
	edge32ln	%g2,	%g1,	%g4
loop_2564:
	lduh	[%l7 + 0x2A],	%i5
	subc	%l6,	0x0E1A,	%i4
	tleu	%icc,	0x3
	brlez	%g5,	loop_2565
	movre	%g6,	0x2D5,	%i0
	tle	%icc,	0x4
	brlz,a	%g3,	loop_2566
loop_2565:
	edge8	%o4,	%o1,	%l1
	std	%f2,	[%l7 + 0x28]
	addcc	%g7,	0x0DB8,	%i6
loop_2566:
	subcc	%l5,	%i7,	%o2
	edge32	%o0,	%l3,	%o5
	set	0x78, %i3
	sta	%f3,	[%l7 + %i3] 0x88
	fbl,a	%fcc1,	loop_2567
	xnorcc	%o3,	%l2,	%o6
	bge,a,pn	%xcc,	loop_2568
	fornot1s	%f29,	%f9,	%f31
loop_2567:
	umul	%l4,	0x069A,	%l0
	fmovdne	%xcc,	%f24,	%f2
loop_2568:
	tvs	%xcc,	0x3
	alignaddrl	%i2,	%o7,	%i3
	movvc	%xcc,	%g2,	%i1
	srl	%g4,	0x07,	%i5
	bcc	%xcc,	loop_2569
	orcc	%l6,	0x0756,	%i4
	movne	%icc,	%g5,	%g1
	fmovde	%xcc,	%f11,	%f4
loop_2569:
	lduh	[%l7 + 0x58],	%g6
	ba,a,pn	%icc,	loop_2570
	fmul8x16au	%f5,	%f30,	%f26
	fsrc1	%f20,	%f4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%i0
loop_2570:
	srax	%g3,	0x07,	%o1
	mova	%icc,	%o4,	%l1
	nop
	fitos	%f14,	%f2
	fstod	%f2,	%f16
	orn	%g7,	%l5,	%i7
	or	%o2,	%i6,	%l3
	movrne	%o0,	%o5,	%o3
	or	%o6,	0x1D44,	%l2
	fmovdne	%xcc,	%f18,	%f0
	tsubcctv	%l0,	%i2,	%o7
	fmovdne	%xcc,	%f9,	%f13
	mulscc	%l4,	%g2,	%i1
	sir	0x01E6
	fbue,a	%fcc3,	loop_2571
	addc	%i3,	0x1560,	%i5
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f29
	smul	%g4,	%l6,	%g5
loop_2571:
	movcc	%xcc,	%g1,	%g6
	popc	0x1E3C,	%i0
	movpos	%xcc,	%i4,	%o1
	tge	%icc,	0x4
	subc	%g3,	%l1,	%o4
	nop
	setx	0xDDD1A3CC10590963,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fpsub32s	%f30,	%f2,	%f9
	fbule,a	%fcc1,	loop_2572
	brlz	%g7,	loop_2573
	movvs	%icc,	%l5,	%i7
	addccc	%o2,	0x1F0D,	%l3
loop_2572:
	udivx	%i6,	0x06BE,	%o5
loop_2573:
	xor	%o3,	0x1882,	%o6
	movcc	%xcc,	%l2,	%l0
	smul	%i2,	%o0,	%o7
	ldd	[%l7 + 0x18],	%g2
	umulcc	%i1,	%l4,	%i5
	fba	%fcc1,	loop_2574
	fxor	%f22,	%f14,	%f20
	tcs	%xcc,	0x0
	ta	%xcc,	0x6
loop_2574:
	mulscc	%i3,	%l6,	%g5
	movn	%icc,	%g4,	%g6
	smulcc	%i0,	%i4,	%o1
	fandnot2s	%f28,	%f14,	%f0
	srlx	%g3,	0x15,	%l1
	udivcc	%o4,	0x07DA,	%g7
	nop
	setx	0xC99B74D6F53583E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x447A995225502474,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f14,	%f20
	bneg,a,pn	%icc,	loop_2575
	fornot2	%f10,	%f12,	%f0
	mova	%icc,	%g1,	%i7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x38] %asi,	%f4
loop_2575:
	taddcctv	%o2,	0x09AE,	%l5
	movrgez	%i6,	%l3,	%o5
	fpmerge	%f25,	%f13,	%f24
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x35] %asi,	%o3
	movl	%icc,	%l2,	%o6
	srlx	%i2,	%o0,	%o7
	udivcc	%g2,	0x11C7,	%l0
	udivcc	%l4,	0x0394,	%i1
	bneg,pt	%xcc,	loop_2576
	movcc	%icc,	%i3,	%i5
	fbg	%fcc1,	loop_2577
	alignaddrl	%l6,	%g5,	%g6
loop_2576:
	movge	%xcc,	%i0,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2577:
	orncc	%o1,	0x04EA,	%g4
	fmovsgu	%icc,	%f28,	%f26
	set	0x08, %i5
	prefetcha	[%l7 + %i5] 0x0c,	 0x3
	move	%icc,	%l1,	%o4
	subccc	%g1,	0x1EC0,	%i7
	bpos,pn	%icc,	loop_2578
	movvc	%icc,	%g7,	%l5
	ta	%xcc,	0x6
	bcs,pn	%icc,	loop_2579
loop_2578:
	add	%i6,	%l3,	%o2
	brz	%o3,	loop_2580
	fbug	%fcc0,	loop_2581
loop_2579:
	fcmpgt16	%f10,	%f6,	%l2
	nop
	setx	0x813923DF84B13916,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x7EC9B19C863D9A66,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f26,	%f16
loop_2580:
	ble,pn	%icc,	loop_2582
loop_2581:
	tsubcctv	%o5,	%o6,	%o0
	andcc	%o7,	%g2,	%i2
	srl	%l4,	0x0A,	%l0
loop_2582:
	nop
	wr	%g0,	0xea,	%asi
	stwa	%i1,	[%l7 + 0x54] %asi
	membar	#Sync
	orncc	%i5,	0x18E5,	%i3
	array16	%g5,	%l6,	%i0
	nop
	setx	0xBA6DE901,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f23
	fbug,a	%fcc3,	loop_2583
	sdiv	%i4,	0x14D6,	%g6
	wr	%g0,	0x5f,	%asi
	stxa	%g4,	[%g0 + 0x0] %asi
loop_2583:
	andn	%g3,	%o1,	%l1
	tg	%icc,	0x5
	udiv	%g1,	0x05AE,	%i7
	fmovda	%icc,	%f11,	%f10
	edge32ln	%g7,	%l5,	%i6
	movrlez	%o4,	0x286,	%o2
	ldub	[%l7 + 0x5D],	%l3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	xor	%l2,	0x1446,	%o5
	bpos,pn	%icc,	loop_2584
	add	%o0,	0x160F,	%o6
	movrlz	%g2,	0x2BF,	%o7
	ldsb	[%l7 + 0x28],	%i2
loop_2584:
	nop
	setx	0x20A4F9AEFA241B76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xD4226669A4CAD74F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f8,	%f20
	stw	%l4,	[%l7 + 0x58]
	set	0x27, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l0
	addc	%i1,	%i3,	%g5
	fbn,a	%fcc2,	loop_2585
	movneg	%xcc,	%l6,	%i5
	movcs	%icc,	%i0,	%g6
	ldsh	[%l7 + 0x1A],	%i4
loop_2585:
	st	%f26,	[%l7 + 0x30]
	set	0x38, %i1
	ldxa	[%g0 + %i1] 0x4f,	%g3
	edge16l	%g4,	%o1,	%g1
	tgu	%icc,	0x7
	mova	%xcc,	%i7,	%l1
	movcs	%xcc,	%g7,	%i6
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x19
	fbug	%fcc1,	loop_2586
	fnand	%f16,	%f24,	%f14
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f16
loop_2586:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
	tleu	%icc,	0x4
	fmovrse	%o2,	%f1,	%f12
	orcc	%o4,	%o3,	%l3
	edge16ln	%l2,	%o0,	%o5
	fmovrslz	%o6,	%f1,	%f24
	bcc,a	loop_2587
	faligndata	%f24,	%f0,	%f22
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2587:
	fmovrsgz	%o7,	%f14,	%f9
	fbul,a	%fcc2,	loop_2588
	srlx	%i2,	%l4,	%g2
	srax	%l0,	%i3,	%g5
	taddcctv	%i1,	0x0B7D,	%l6
loop_2588:
	subccc	%i5,	%g6,	%i4
	mova	%icc,	%i0,	%g4
	fornot2	%f22,	%f30,	%f14
	brgz,a	%o1,	loop_2589
	alignaddrl	%g3,	%g1,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f4,	%f10
loop_2589:
	array32	%g7,	%l1,	%i6
	movpos	%icc,	%l5,	%o2
	ldx	[%l7 + 0x28],	%o4
	edge32ln	%l3,	%o3,	%l2
	fmovrse	%o0,	%f9,	%f29
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x50] %asi,	%o6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o7
	nop
	setx	loop_2590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%o5,	%l4,	%g2
	tg	%xcc,	0x2
	sll	%i2,	0x16,	%i3
loop_2590:
	smul	%l0,	0x1EEB,	%i1
	and	%l6,	0x0429,	%i5
	edge8ln	%g6,	%g5,	%i4
	tge	%xcc,	0x6
	andn	%i0,	%o1,	%g3
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x24] %asi,	%f21
	udiv	%g1,	0x0032,	%g4
	fmovsle	%icc,	%f30,	%f17
	edge16	%i7,	%g7,	%i6
	udivcc	%l1,	0x056A,	%o2
	movl	%icc,	%o4,	%l5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o3
	sdivx	%l2,	0x1708,	%o0
	movvc	%xcc,	%l3,	%o7
	sra	%o5,	0x0C,	%o6
	bcs,a	loop_2591
	sth	%g2,	[%l7 + 0x16]
	fbn	%fcc2,	loop_2592
	brgez	%l4,	loop_2593
loop_2591:
	fbl,a	%fcc1,	loop_2594
	nop
	setx	0xEB6B95767C836B8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x15D4380AD7959BEE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f6,	%f16
loop_2592:
	sllx	%i2,	%i3,	%i1
loop_2593:
	bcc,a,pt	%icc,	loop_2595
loop_2594:
	fmovsge	%xcc,	%f11,	%f3
	brlz,a	%l0,	loop_2596
	faligndata	%f28,	%f22,	%f0
loop_2595:
	movl	%icc,	%i5,	%g6
	movre	%g5,	0x1E2,	%l6
loop_2596:
	nop
	setx	0x40705994,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	udiv	%i4,	0x0E2F,	%i0
	fpack16	%f28,	%f24
	fmovsle	%xcc,	%f19,	%f24
	and	%g3,	%g1,	%g4
	fcmpeq32	%f26,	%f16,	%o1
	alignaddr	%g7,	%i7,	%i6
	fcmple16	%f18,	%f8,	%o2
	nop
	setx	0xB46524A9CEE93963,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xC445D43675C670A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f22,	%f14
	subcc	%l1,	0x1461,	%l5
	bneg,pt	%xcc,	loop_2597
	tn	%icc,	0x7
	bpos,a	loop_2598
	mulscc	%o4,	0x1C6C,	%o3
loop_2597:
	bpos,a,pt	%icc,	loop_2599
	movn	%icc,	%l2,	%o0
loop_2598:
	tsubcctv	%l3,	%o5,	%o7
	fbul	%fcc1,	loop_2600
loop_2599:
	tpos	%icc,	0x3
	fornot1s	%f12,	%f13,	%f4
	movleu	%icc,	%g2,	%l4
loop_2600:
	brlez,a	%i2,	loop_2601
	movne	%xcc,	%i3,	%o6
	bshuffle	%f0,	%f8,	%f8
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l0
loop_2601:
	movcc	%icc,	%i1,	%g6
	fmovsa	%icc,	%f14,	%f11
	subc	%i5,	%g5,	%i4
	ba,pn	%xcc,	loop_2602
	sll	%i0,	%g3,	%g1
	subccc	%g4,	%l6,	%g7
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i7
loop_2602:
	srax	%o1,	%i6,	%l1
	smulcc	%o2,	%o4,	%l5
	orcc	%o3,	%o0,	%l2
	udiv	%o5,	0x104F,	%o7
	set	0x110, %o7
	ldxa	[%g0 + %o7] 0x21,	%l3
	movpos	%icc,	%g2,	%l4
	movgu	%icc,	%i2,	%i3
	subc	%o6,	%i1,	%g6
	ldd	[%l7 + 0x08],	%l0
	orcc	%g5,	0x1B7E,	%i5
	fmovdge	%xcc,	%f27,	%f25
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf1
	membar	#Sync
	srl	%i0,	%g3,	%i4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x89
	tl	%xcc,	0x5
	edge32ln	%g1,	%g4,	%l6
	fones	%f2
	bvs,pn	%icc,	loop_2603
	fnand	%f30,	%f16,	%f6
	sllx	%g7,	0x1E,	%o1
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f3
loop_2603:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2604,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i6,	0x00C8,	%l1
	sra	%o2,	%o4,	%l5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x58] %asi,	%o3
loop_2604:
	movcc	%xcc,	%i7,	%o0
	movn	%icc,	%o5,	%o7
	ldub	[%l7 + 0x7E],	%l2
	movge	%icc,	%l3,	%g2
	sll	%i2,	%l4,	%o6
	ldsh	[%l7 + 0x62],	%i3
	set	0x1C, %i0
	sta	%f1,	[%l7 + %i0] 0x81
	bcc,a,pn	%xcc,	loop_2605
	movn	%icc,	%g6,	%i1
	edge16l	%g5,	%i5,	%l0
	orncc	%i0,	0x18B1,	%i4
loop_2605:
	tle	%icc,	0x3
	movl	%icc,	%g1,	%g4
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sub	%l6,	0x07B4,	%g3
	edge32l	%o1,	%i6,	%g7
	smulcc	%o2,	0x110E,	%o4
	fble	%fcc0,	loop_2606
	movn	%xcc,	%l5,	%l1
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2606:
	fbn	%fcc1,	loop_2607
	fbl	%fcc3,	loop_2608
	mova	%icc,	%o3,	%o0
	sir	0x12A0
loop_2607:
	addcc	%i7,	0x05E1,	%o7
loop_2608:
	lduh	[%l7 + 0x0A],	%o5
	and	%l2,	%l3,	%g2
	edge8	%l4,	%i2,	%o6
	fnot1s	%f12,	%f26
	tg	%icc,	0x5
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%i2
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f12
	fxtos	%f12,	%f7
	set	0x6D, %g6
	ldstuba	[%l7 + %g6] 0x11,	%g6
	fmuld8ulx16	%f1,	%f24,	%f26
	ba,a,pt	%xcc,	loop_2609
	fbo	%fcc0,	loop_2610
	edge16ln	%g5,	%i5,	%i1
	for	%f12,	%f30,	%f18
loop_2609:
	fnot1	%f10,	%f10
loop_2610:
	tvs	%icc,	0x3
	srlx	%i0,	%i4,	%l0
	movge	%xcc,	%g4,	%l6
	add	%g1,	%g3,	%o1
	sdivcc	%i6,	0x1EE8,	%o2
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f14
	tcc	%xcc,	0x6
	tcs	%xcc,	0x5
	sdivx	%o4,	0x0733,	%g7
	xor	%l5,	%l1,	%o3
	fandnot2	%f2,	%f2,	%f18
	set	0x70, %l6
	lduwa	[%l7 + %l6] 0x15,	%o0
	umul	%o7,	0x1C19,	%o5
	edge16	%i7,	%l3,	%g2
	tgu	%xcc,	0x7
	edge32ln	%l4,	%l2,	%i2
	membar	0x52
	bg,a	%icc,	loop_2611
	fbl,a	%fcc2,	loop_2612
	tge	%icc,	0x7
	nop
	setx	loop_2613,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2611:
	fmovda	%icc,	%f9,	%f23
loop_2612:
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
	call	loop_2615
loop_2613:
	nop
	setx	0x180D96EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x4C0D2A08,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f2,	%f18
	tgu	%xcc,	0x6
loop_2614:
	nop
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x18,	 0x2
loop_2615:
	nop
	set	0x75, %i6
	lduba	[%l7 + %i6] 0x14,	%o6
	nop
	set	0x18, %l3
	ldsw	[%l7 + %l3],	%g5
	subcc	%i5,	%i1,	%g6
	fandnot2s	%f18,	%f11,	%f20
	ldx	[%l7 + 0x50],	%i4
	ldsh	[%l7 + 0x34],	%i0
	movneg	%xcc,	%g4,	%l6
	bneg,a,pn	%icc,	loop_2616
	tleu	%icc,	0x6
	be,a	%icc,	loop_2617
	sll	%l0,	%g3,	%g1
loop_2616:
	flush	%l7 + 0x54
	movrgz	%i6,	0x003,	%o2
loop_2617:
	addcc	%o1,	%o4,	%g7
	brlez	%l5,	loop_2618
	fands	%f12,	%f19,	%f27
	ldsw	[%l7 + 0x6C],	%l1
	movcs	%xcc,	%o0,	%o7
loop_2618:
	bl	%xcc,	loop_2619
	tpos	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o5
loop_2619:
	edge16ln	%o3,	%l3,	%g2
	popc	%i7,	%l4
	fmovdcc	%xcc,	%f19,	%f20
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addccc	%i2,	0x0D26,	%i3
	movne	%xcc,	%o6,	%g5
	orcc	%l2,	%i1,	%i5
	orcc	%i4,	0x0C4B,	%g6
	fsrc2s	%f29,	%f25
	edge16	%i0,	%g4,	%l6
	fxor	%f4,	%f2,	%f30
	tsubcctv	%g3,	0x006F,	%l0
	fmovrdne	%g1,	%f20,	%f10
	movne	%xcc,	%o2,	%o1
	wr	%g0,	0x89,	%asi
	sta	%f14,	[%l7 + 0x64] %asi
	subcc	%o4,	0x02A3,	%i6
	brlez	%g7,	loop_2620
	smul	%l5,	%l1,	%o7
	tg	%icc,	0x2
	fandnot1s	%f2,	%f1,	%f20
loop_2620:
	edge32l	%o0,	%o3,	%l3
	bvs,a	loop_2621
	movle	%xcc,	%o5,	%i7
	bcc,pt	%xcc,	loop_2622
	bvc,a,pt	%icc,	loop_2623
loop_2621:
	fabsd	%f6,	%f24
	tsubcctv	%g2,	0x04C3,	%l4
loop_2622:
	movl	%icc,	%i2,	%i3
loop_2623:
	edge16n	%o6,	%l2,	%i1
	brgz,a	%g5,	loop_2624
	tle	%xcc,	0x1
	fmovde	%xcc,	%f21,	%f2
	edge16	%i5,	%i4,	%i0
loop_2624:
	fbge	%fcc3,	loop_2625
	fpsub32s	%f30,	%f24,	%f2
	bleu,a,pn	%icc,	loop_2626
	movvs	%xcc,	%g6,	%l6
loop_2625:
	fpmerge	%f3,	%f24,	%f10
	edge16	%g4,	%l0,	%g1
loop_2626:
	fble	%fcc0,	loop_2627
	movl	%icc,	%g3,	%o2
	umulcc	%o4,	0x0DD0,	%o1
	edge16	%g7,	%i6,	%l5
loop_2627:
	sdivcc	%l1,	0x1C2B,	%o7
	addc	%o0,	%o3,	%l3
	edge32ln	%i7,	%g2,	%o5
	srlx	%l4,	%i2,	%i3
	lduh	[%l7 + 0x76],	%l2
	set	0x58, %i4
	swapa	[%l7 + %i4] 0x04,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x5
	tsubcc	%g5,	%i5,	%o6
	fzeros	%f26
	nop
	setx	0x379F86508FBFEA97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3C6A3C94497A08CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f26,	%f18
	set	0x11, %o4
	stba	%i0,	[%l7 + %o4] 0x80
	nop
	setx	0xB6175AEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x520055CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f7,	%f10
	movne	%xcc,	%i4,	%g6
	fmovsneg	%icc,	%f26,	%f12
	movle	%xcc,	%l6,	%g4
	brgez	%l0,	loop_2628
	alignaddrl	%g1,	%g3,	%o4
	edge8ln	%o2,	%o1,	%i6
	tl	%icc,	0x7
loop_2628:
	popc	0x1859,	%l5
	bn,a,pt	%xcc,	loop_2629
	tvs	%icc,	0x4
	fmovscs	%icc,	%f8,	%f11
	nop
	setx	loop_2630,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2629:
	brz,a	%l1,	loop_2631
	tvs	%xcc,	0x3
	nop
	setx	0x84E7E3A459A62109,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x518A1CB53413B685,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f8,	%f16
loop_2630:
	brlez,a	%g7,	loop_2632
loop_2631:
	udiv	%o0,	0x0B14,	%o3
	mova	%icc,	%o7,	%l3
	ta	%icc,	0x0
loop_2632:
	fpadd32	%f24,	%f22,	%f0
	movne	%icc,	%g2,	%i7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x5C] %asi,	%f1
	bvc,pt	%xcc,	loop_2633
	add	%l4,	%o5,	%i2
	sdivx	%i3,	0x00DB,	%l2
	movn	%icc,	%i1,	%g5
loop_2633:
	sir	0x1D9C
	movg	%icc,	%o6,	%i5
	andncc	%i0,	%i4,	%g6
	bg,pt	%xcc,	loop_2634
	brgz,a	%l6,	loop_2635
	ldstub	[%l7 + 0x13],	%l0
	movgu	%icc,	%g1,	%g4
loop_2634:
	edge32l	%o4,	%o2,	%o1
loop_2635:
	edge16	%i6,	%l5,	%g3
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f2
	tl	%xcc,	0x6
	sub	%g7,	%l1,	%o3
	fpsub32s	%f25,	%f8,	%f23
	fba,a	%fcc3,	loop_2636
	xor	%o0,	0x1344,	%o7
	movgu	%icc,	%g2,	%l3
	bleu,a	%xcc,	loop_2637
loop_2636:
	tcs	%icc,	0x4
	nop
	setx	loop_2638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%i7,	%l4,	%o5
loop_2637:
	xorcc	%i2,	0x19E4,	%i3
	or	%i1,	0x0C76,	%l2
loop_2638:
	nop
	set	0x2C, %l5
	lduw	[%l7 + %l5],	%o6
	array8	%g5,	%i0,	%i4
	tsubcc	%g6,	0x0B81,	%i5
	movrne	%l0,	%g1,	%g4
	fcmpgt32	%f18,	%f20,	%l6
	bvc,a	%icc,	loop_2639
	pdist	%f28,	%f2,	%f28
	xor	%o4,	0x0054,	%o1
	fble	%fcc2,	loop_2640
loop_2639:
	ldsw	[%l7 + 0x14],	%i6
	fmovrdlez	%l5,	%f8,	%f16
	movrgez	%g3,	0x090,	%g7
loop_2640:
	edge8n	%o2,	%o3,	%l1
	tsubcctv	%o7,	0x0897,	%o0
	srlx	%g2,	%l3,	%i7
	srax	%l4,	0x17,	%i2
	nop
	setx	0x149B9CD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x9BE68707,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f6,	%f5
	wr	%g0,	0x21,	%asi
	stxa	%i3,	[%g0 + 0x10] %asi
	lduw	[%l7 + 0x68],	%o5
	edge8	%i1,	%o6,	%l2
	tge	%icc,	0x1
	fxnor	%f12,	%f0,	%f18
	subcc	%i0,	0x071B,	%i4
	smulcc	%g5,	0x0158,	%i5
	movcs	%icc,	%g6,	%g1
	fxnors	%f23,	%f13,	%f24
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x89,	%l0
	movn	%xcc,	%l6,	%o4
	bge,a	loop_2641
	movn	%xcc,	%o1,	%i6
	srl	%g4,	%l5,	%g3
	fsrc2s	%f6,	%f4
loop_2641:
	fmovdpos	%icc,	%f13,	%f1
	bcs	loop_2642
	fbne	%fcc2,	loop_2643
	nop
	setx	loop_2644,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcs	%icc,	loop_2645
loop_2642:
	ldsw	[%l7 + 0x70],	%g7
loop_2643:
	st	%f12,	[%l7 + 0x20]
loop_2644:
	tge	%icc,	0x3
loop_2645:
	nop
	setx	0xC044700E,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	array8	%o3,	%o2,	%o7
	tsubcc	%l1,	%o0,	%g2
	udivcc	%i7,	0x0E9E,	%l3
	fbue,a	%fcc0,	loop_2646
	te	%icc,	0x3
	fble	%fcc3,	loop_2647
	movpos	%icc,	%i2,	%i3
loop_2646:
	tg	%icc,	0x2
	tsubcctv	%o5,	0x0A8D,	%l4
loop_2647:
	fmovrslez	%o6,	%f9,	%f17
	swap	[%l7 + 0x7C],	%l2
	fpack32	%f24,	%f10,	%f4
	tcc	%icc,	0x1
	ldub	[%l7 + 0x11],	%i1
	movvs	%icc,	%i4,	%g5
	tcs	%icc,	0x6
	fornot1	%f20,	%f0,	%f2
	xor	%i0,	%i5,	%g1
	te	%icc,	0x2
	fmovrdgez	%g6,	%f6,	%f20
	fbuge,a	%fcc1,	loop_2648
	edge32l	%l0,	%l6,	%o1
	sra	%i6,	%o4,	%g4
	ldstub	[%l7 + 0x57],	%l5
loop_2648:
	srax	%g7,	0x1B,	%o3
	edge16	%g3,	%o7,	%l1
	sll	%o2,	0x0D,	%o0
	fbe	%fcc1,	loop_2649
	add	%i7,	0x07C7,	%g2
	umulcc	%l3,	%i2,	%o5
	tneg	%icc,	0x7
loop_2649:
	nop
	set	0x1E, %o5
	lduha	[%l7 + %o5] 0x19,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	%l2,	%o6
	set	0x7B, %o0
	stba	%i4,	[%l7 + %o0] 0x22
	membar	#Sync
	mulscc	%i1,	0x151D,	%i0
	xnor	%g5,	0x0AD8,	%i5
	movcs	%xcc,	%g6,	%l0
	fmovsleu	%xcc,	%f0,	%f3
	movneg	%icc,	%g1,	%l6
	edge16ln	%o1,	%i6,	%g4
	umul	%o4,	%l5,	%g7
	nop
	set	0x64, %g2
	prefetch	[%l7 + %g2],	 0x0
	fbe	%fcc3,	loop_2650
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f10
	tgu	%icc,	0x4
	tsubcctv	%g3,	%o7,	%l1
loop_2650:
	call	loop_2651
	tge	%xcc,	0x5
	tpos	%icc,	0x6
	fbl	%fcc3,	loop_2652
loop_2651:
	lduh	[%l7 + 0x0A],	%o2
	tge	%xcc,	0x7
	nop
	setx	0xAFFA8890,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xABEB5C1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f22,	%f1
loop_2652:
	fbule	%fcc3,	loop_2653
	tgu	%xcc,	0x5
	tsubcctv	%o3,	0x0320,	%i7
	bge	loop_2654
loop_2653:
	edge16	%g2,	%l3,	%o0
	fpackfix	%f26,	%f30
	sub	%i2,	0x00C5,	%o5
loop_2654:
	bl	%icc,	loop_2655
	udiv	%i3,	0x06D8,	%l2
	fmovrsgez	%l4,	%f19,	%f31
	fcmpne32	%f30,	%f26,	%o6
loop_2655:
	mulx	%i1,	0x1594,	%i0
	edge16n	%g5,	%i4,	%i5
	fbn,a	%fcc0,	loop_2656
	movrgz	%l0,	%g1,	%l6
	and	%o1,	%i6,	%g6
	tl	%icc,	0x0
loop_2656:
	movg	%xcc,	%g4,	%l5
	or	%o4,	0x06CC,	%g7
	sllx	%o7,	0x07,	%l1
	subc	%g3,	%o3,	%o2
	fsrc1	%f28,	%f8
	fornot2	%f16,	%f26,	%f10
	tsubcc	%g2,	%i7,	%o0
	umulcc	%l3,	0x0A85,	%o5
	fxor	%f28,	%f18,	%f22
	tcs	%icc,	0x0
	udivcc	%i2,	0x1F15,	%i3
	fmovrse	%l2,	%f24,	%f5
	tcs	%xcc,	0x3
	fbn	%fcc2,	loop_2657
	fpack16	%f10,	%f26
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
loop_2657:
	srax	%l4,	0x02,	%i1
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f0
	nop
	setx	0x7050C160,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i0,	0x1254,	%g5
	udiv	%i4,	0x0196,	%i5
	tgu	%xcc,	0x5
	orncc	%l0,	0x1482,	%g1
	movneg	%xcc,	%o1,	%l6
	movg	%xcc,	%i6,	%g6
	fones	%f29
	udivx	%g4,	0x15AB,	%o4
	orncc	%l5,	%g7,	%o7
	fzeros	%f23
	mova	%icc,	%g3,	%o3
	edge16l	%o2,	%l1,	%i7
	movrlez	%g2,	0x10B,	%o0
	taddcc	%o5,	0x00E8,	%l3
	tsubcc	%i3,	0x1567,	%l2
	ta	%icc,	0x5
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x19,	 0x3
	udivx	%i2,	0x1471,	%i1
	tneg	%icc,	0x7
	movcc	%icc,	%i0,	%g5
	tg	%xcc,	0x3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x04,	%i4,	%i5
	fmul8x16au	%f15,	%f28,	%f24
	alignaddr	%l0,	%g1,	%l4
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x38] %asi,	%l6
	edge8n	%i6,	%g6,	%o1
	sdivx	%g4,	0x02E9,	%l5
	fandnot2	%f28,	%f4,	%f10
	move	%xcc,	%o4,	%g7
	fmovdgu	%icc,	%f12,	%f19
	movle	%icc,	%g3,	%o3
	addc	%o7,	0x04C2,	%l1
	array16	%o2,	%i7,	%o0
	alignaddr	%g2,	%o5,	%l3
	subc	%l2,	%o6,	%i2
	fmovdvs	%icc,	%f25,	%f3
	fmovsn	%icc,	%f28,	%f12
	bl,a	loop_2658
	fmuld8sux16	%f11,	%f13,	%f8
	tcc	%icc,	0x7
	bne,a	loop_2659
loop_2658:
	fmovda	%xcc,	%f17,	%f2
	sllx	%i3,	%i0,	%i1
	andcc	%g5,	0x1782,	%i5
loop_2659:
	edge16ln	%l0,	%g1,	%i4
	move	%icc,	%l6,	%i6
	smulcc	%g6,	%l4,	%g4
	movge	%xcc,	%l5,	%o4
	addcc	%o1,	%g7,	%o3
	movgu	%icc,	%g3,	%o7
	umulcc	%o2,	%i7,	%o0
	edge32	%g2,	%o5,	%l3
	fandnot1	%f10,	%f26,	%f22
	add	%l2,	%o6,	%l1
	tsubcctv	%i3,	%i0,	%i1
	subc	%g5,	%i2,	%l0
	movrne	%g1,	0x0C1,	%i5
	fmovsge	%xcc,	%f27,	%f22
	movne	%icc,	%l6,	%i6
	bvc,pn	%xcc,	loop_2660
	orcc	%i4,	0x1C70,	%g6
	sllx	%g4,	%l5,	%l4
	flush	%l7 + 0x38
loop_2660:
	fmovdcc	%icc,	%f0,	%f18
	movgu	%icc,	%o4,	%o1
	tne	%icc,	0x7
	tsubcc	%o3,	%g7,	%o7
	brlz,a	%o2,	loop_2661
	smul	%i7,	0x0079,	%o0
	fmovse	%icc,	%f7,	%f20
	ldx	[%l7 + 0x70],	%g3
loop_2661:
	edge8	%g2,	%o5,	%l3
	edge32n	%l2,	%l1,	%o6
	edge16l	%i3,	%i0,	%g5
	movvs	%xcc,	%i2,	%l0
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x2f,	%g0
	fmovdvc	%icc,	%f17,	%f19
	te	%xcc,	0x3
	andn	%i5,	0x103F,	%l6
	movcs	%xcc,	%i6,	%i1
	sll	%g6,	0x01,	%i4
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x81,	%g4
	fmul8x16	%f14,	%f30,	%f28
	edge32	%l4,	%o4,	%o1
	srlx	%o3,	0x17,	%g7
	sdivcc	%o7,	0x1531,	%o2
	subcc	%l5,	0x036F,	%o0
	taddcctv	%i7,	0x0D06,	%g2
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0x2
	add	%l3,	0x1C2A,	%l2
	bvc	loop_2662
	fpackfix	%f10,	%f6
	fmovrde	%o5,	%f12,	%f28
	bgu	loop_2663
loop_2662:
	andncc	%o6,	%i3,	%l1
	movne	%icc,	%i0,	%i2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g5
loop_2663:
	fba,a	%fcc0,	loop_2664
	udiv	%g1,	0x0099,	%l0
	fmovscc	%icc,	%f14,	%f7
	edge8ln	%i5,	%l6,	%i6
loop_2664:
	fbn	%fcc1,	loop_2665
	xnor	%g6,	0x0233,	%i4
	bcc,pt	%icc,	loop_2666
	brlz,a	%i1,	loop_2667
loop_2665:
	array32	%g4,	%o4,	%o1
	flush	%l7 + 0x1C
loop_2666:
	sir	0x1A02
loop_2667:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x6
	fbge	%fcc0,	loop_2668
	nop
	fitos	%f10,	%f5
	fstoi	%f5,	%f20
	srl	%o3,	%g7,	%o7
	bgu,pn	%xcc,	loop_2669
loop_2668:
	nop
	set	0x2C, %g1
	ldstub	[%l7 + %g1],	%l4
	mova	%xcc,	%l5,	%o2
	sllx	%i7,	0x1D,	%o0
loop_2669:
	tn	%xcc,	0x4
	sdiv	%g3,	0x07C2,	%g2
	set	0x78, %i3
	stxa	%l3,	[%l7 + %i3] 0xe2
	membar	#Sync
	movrgz	%o5,	%o6,	%l2
	fmovrde	%i3,	%f22,	%f12
	edge32	%i0,	%i2,	%g5
	udiv	%l1,	0x1C9B,	%g1
	stw	%l0,	[%l7 + 0x4C]
	set	0x0C, %i5
	ldstuba	[%l7 + %i5] 0x80,	%l6
	fblg,a	%fcc2,	loop_2670
	fbug	%fcc1,	loop_2671
	ldsw	[%l7 + 0x58],	%i6
	addcc	%g6,	0x1820,	%i4
loop_2670:
	movn	%icc,	%i1,	%g4
loop_2671:
	nop
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x17,	%f16
	bne,a	%icc,	loop_2672
	subcc	%i5,	%o4,	%o1
	movvs	%xcc,	%g7,	%o3
	edge16l	%o7,	%l4,	%o2
loop_2672:
	tcc	%icc,	0x3
	edge16ln	%l5,	%i7,	%o0
	fba	%fcc0,	loop_2673
	movvs	%icc,	%g3,	%l3
	stx	%g2,	[%l7 + 0x78]
	lduw	[%l7 + 0x08],	%o5
loop_2673:
	movn	%xcc,	%l2,	%i3
	nop
	set	0x7C, %o6
	ldsh	[%l7 + %o6],	%i0
	movleu	%icc,	%o6,	%g5
	fbl,a	%fcc3,	loop_2674
	movcc	%icc,	%l1,	%i2
	fmovdle	%xcc,	%f17,	%f13
	movre	%g1,	0x03A,	%l0
loop_2674:
	smulcc	%l6,	0x0856,	%g6
	orn	%i4,	0x070A,	%i1
	subccc	%i6,	0x073B,	%g4
	tpos	%xcc,	0x6
	smulcc	%i5,	0x078B,	%o4
	tneg	%xcc,	0x0
	edge32l	%o1,	%o3,	%o7
	edge16	%l4,	%g7,	%o2
	fsrc1	%f18,	%f2
	sllx	%i7,	0x1A,	%l5
	bpos	loop_2675
	movpos	%xcc,	%o0,	%g3
	edge16	%l3,	%o5,	%l2
	srl	%i3,	0x1F,	%g2
loop_2675:
	sub	%o6,	%g5,	%l1
	edge16ln	%i2,	%i0,	%g1
	addc	%l6,	0x0EFA,	%g6
	swap	[%l7 + 0x70],	%l0
	bl,a,pt	%icc,	loop_2676
	tcc	%xcc,	0x7
	tne	%xcc,	0x1
	movcs	%xcc,	%i4,	%i1
loop_2676:
	movvs	%xcc,	%i6,	%g4
	fandnot2	%f16,	%f14,	%f10
	tn	%icc,	0x5
	udiv	%o4,	0x04CA,	%i5
	nop
	setx loop_2677, %l0, %l1
	jmpl %l1, %o3
	movn	%xcc,	%o7,	%o1
	edge32ln	%l4,	%o2,	%i7
	movvc	%xcc,	%g7,	%l5
loop_2677:
	orn	%o0,	0x1A92,	%g3
	fmovrdgez	%l3,	%f14,	%f2
	mova	%icc,	%l2,	%o5
	movg	%icc,	%g2,	%o6
	movg	%xcc,	%i3,	%l1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movgu	%icc,	%g5,	%i0
	fbn,a	%fcc3,	loop_2678
	movl	%icc,	%i2,	%g1
	movg	%icc,	%g6,	%l0
	brnz,a	%i4,	loop_2679
loop_2678:
	fmovdpos	%icc,	%f22,	%f28
	mulx	%l6,	0x072D,	%i6
	movne	%xcc,	%i1,	%o4
loop_2679:
	fmovdcc	%xcc,	%f15,	%f30
	set	0x64, %i7
	lda	[%l7 + %i7] 0x11,	%f24
	call	loop_2680
	addc	%i5,	0x000F,	%g4
	array32	%o3,	%o7,	%o1
	fmovd	%f8,	%f8
loop_2680:
	brgz	%o2,	loop_2681
	mova	%icc,	%l4,	%g7
	set	0x7C, %g7
	ldswa	[%l7 + %g7] 0x04,	%i7
loop_2681:
	te	%icc,	0x5
	brnz,a	%l5,	loop_2682
	movvc	%icc,	%g3,	%o0
	tn	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	stha	%l2,	[%l7 + 0x4E] %asi
loop_2682:
	taddcctv	%l3,	0x0C7B,	%g2
	popc	%o6,	%o5
	ldsb	[%l7 + 0x2F],	%i3
	move	%xcc,	%l1,	%i0
	tpos	%icc,	0x4
	edge8ln	%i2,	%g1,	%g6
	fmovdle	%xcc,	%f23,	%f6
	tsubcc	%l0,	%g5,	%l6
	sllx	%i6,	0x02,	%i1
	array8	%o4,	%i4,	%g4
	sth	%i5,	[%l7 + 0x78]
	movn	%xcc,	%o3,	%o1
	alignaddrl	%o7,	%o2,	%l4
	tsubcc	%i7,	%l5,	%g3
	tvc	%xcc,	0x7
	movrlez	%g7,	%o0,	%l3
	ble,a	%xcc,	loop_2683
	edge8l	%g2,	%o6,	%o5
	edge16	%i3,	%l2,	%l1
	movpos	%icc,	%i2,	%i0
loop_2683:
	fcmpne16	%f4,	%f16,	%g1
	orn	%g6,	0x16F8,	%g5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%l0
	array16	%i6,	%l6,	%i1
	edge16n	%o4,	%g4,	%i4
	sdivx	%o3,	0x1FC9,	%o1
	tn	%xcc,	0x0
	movcc	%xcc,	%i5,	%o7
	movcc	%xcc,	%l4,	%o2
	xorcc	%i7,	%l5,	%g3
	popc	0x132E,	%o0
	orcc	%l3,	%g7,	%g2
	brgz	%o5,	loop_2684
	tge	%xcc,	0x4
	fcmpgt32	%f16,	%f6,	%o6
	fmul8x16au	%f28,	%f8,	%f20
loop_2684:
	sdivx	%i3,	0x0BBE,	%l1
	st	%f2,	[%l7 + 0x24]
	udiv	%l2,	0x0795,	%i0
	sethi	0x1354,	%i2
	addc	%g1,	%g5,	%g6
	set	0x32, %o7
	stha	%i6,	[%l7 + %o7] 0x14
	edge8ln	%l6,	%i1,	%o4
	tleu	%icc,	0x5
	tvs	%icc,	0x2
	edge16l	%l0,	%g4,	%i4
	umulcc	%o3,	%o1,	%o7
	std	%f18,	[%l7 + 0x10]
	smul	%i5,	%l4,	%i7
	movl	%xcc,	%o2,	%l5
	tg	%icc,	0x2
	movrlz	%o0,	0x1CE,	%l3
	movpos	%xcc,	%g3,	%g7
	edge8l	%g2,	%o5,	%o6
	move	%icc,	%l1,	%l2
	srl	%i3,	0x19,	%i0
	set	0x58, %l4
	stha	%i2,	[%l7 + %l4] 0x2b
	membar	#Sync
	edge32ln	%g5,	%g6,	%i6
	edge32ln	%l6,	%i1,	%o4
	udiv	%g1,	0x054B,	%g4
	ldsb	[%l7 + 0x34],	%i4
	ba,a,pn	%icc,	loop_2685
	fnegs	%f4,	%f0
	be,a	loop_2686
	andcc	%l0,	%o3,	%o1
loop_2685:
	fmovdgu	%icc,	%f0,	%f20
	taddcctv	%o7,	%l4,	%i5
loop_2686:
	fnot2	%f30,	%f6
	sdivx	%o2,	0x106E,	%l5
	ldsb	[%l7 + 0x53],	%o0
	sir	0x1658
	orncc	%l3,	%g3,	%g7
	xnor	%i7,	%o5,	%o6
	movrlz	%l1,	0x132,	%l2
	set	0x3D, %i1
	lduba	[%l7 + %i1] 0x18,	%i3
	ba,a,pn	%icc,	loop_2687
	udivcc	%i0,	0x17F2,	%i2
	movrlz	%g5,	0x0EB,	%g2
	fmovdg	%xcc,	%f5,	%f3
loop_2687:
	nop
	set	0x4F, %l2
	lduba	[%l7 + %l2] 0x18,	%g6
	array32	%l6,	%i6,	%i1
	edge8ln	%o4,	%g1,	%g4
	edge32l	%i4,	%l0,	%o3
	fsrc2	%f28,	%f10
	subccc	%o1,	0x0742,	%o7
	orn	%l4,	0x14AA,	%o2
	movleu	%xcc,	%i5,	%l5
	bne,a	loop_2688
	tn	%icc,	0x4
	tpos	%icc,	0x7
	tge	%xcc,	0x2
loop_2688:
	edge32ln	%l3,	%o0,	%g7
	sll	%i7,	0x0F,	%g3
	brnz	%o5,	loop_2689
	sra	%l1,	0x1C,	%l2
	array32	%o6,	%i3,	%i0
	andn	%g5,	0x0805,	%i2
loop_2689:
	bleu	%xcc,	loop_2690
	subccc	%g2,	%l6,	%i6
	tn	%xcc,	0x1
	edge16	%i1,	%g6,	%o4
loop_2690:
	fands	%f3,	%f17,	%f17
	wr	%g0,	0x04,	%asi
	stha	%g4,	[%l7 + 0x2C] %asi
	movg	%icc,	%g1,	%l0
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x89,	%o3
	set	0x6C, %i0
	stba	%i4,	[%l7 + %i0] 0x19
	nop
	fitos	%f5,	%f5
	fstox	%f5,	%f16
	fxtos	%f16,	%f12
	te	%xcc,	0x4
	movneg	%icc,	%o1,	%l4
	srax	%o7,	%o2,	%i5
	fbne	%fcc0,	loop_2691
	movpos	%icc,	%l5,	%o0
	bleu,a	%xcc,	loop_2692
	tleu	%xcc,	0x3
loop_2691:
	call	loop_2693
	fmovse	%icc,	%f25,	%f6
loop_2692:
	nop
	fitos	%f11,	%f29
	fstod	%f29,	%f12
	sdivcc	%g7,	0x15AF,	%i7
loop_2693:
	brz,a	%l3,	loop_2694
	sllx	%g3,	0x05,	%l1
	nop
	set	0x50, %l6
	ldstub	[%l7 + %l6],	%l2
	fcmpne16	%f18,	%f26,	%o5
loop_2694:
	tge	%xcc,	0x7
	sethi	0x1EC7,	%o6
	umulcc	%i3,	%i0,	%i2
	movcc	%icc,	%g2,	%l6
	fblg	%fcc1,	loop_2695
	ldsh	[%l7 + 0x20],	%g5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x3C] %asi,	%i1
loop_2695:
	sir	0x1FE8
	membar	0x45
	ta	%icc,	0x7
	orn	%i6,	%o4,	%g4
	fmovrde	%g6,	%f16,	%f20
	udivcc	%l0,	0x1510,	%o3
	fmovrsgez	%g1,	%f11,	%f1
	wr	%g0,	0x18,	%asi
	stwa	%o1,	[%l7 + 0x70] %asi
	fcmpgt16	%f10,	%f4,	%l4
	nop
	setx	0x379B376E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f12
	fcmple32	%f10,	%f24,	%i4
	movn	%xcc,	%o7,	%i5
	bneg,a,pt	%icc,	loop_2696
	edge16	%l5,	%o0,	%g7
	tvc	%xcc,	0x2
	fexpand	%f14,	%f4
loop_2696:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f8,	[%l7 + 0x74] %asi
	edge16l	%o2,	%l3,	%i7
	movcc	%icc,	%l1,	%l2
	edge16	%o5,	%g3,	%o6
	edge16l	%i3,	%i0,	%g2
	move	%xcc,	%i2,	%l6
	movne	%icc,	%g5,	%i6
	tvs	%xcc,	0x6
	lduw	[%l7 + 0x6C],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%g4
	taddcctv	%l0,	0x0DB7,	%o3
	fsrc1	%f10,	%f16
	fbg	%fcc3,	loop_2697
	orncc	%g6,	0x14DE,	%o1
	set	0x0C, %l0
	stwa	%l4,	[%l7 + %l0] 0x2f
	membar	#Sync
loop_2697:
	fcmpeq16	%f16,	%f24,	%i4
	popc	0x15D7,	%g1
	bl,pn	%xcc,	loop_2698
	popc	0x1FB1,	%o7
	orncc	%l5,	%i5,	%o0
	lduh	[%l7 + 0x20],	%g7
loop_2698:
	bg,a	loop_2699
	andcc	%o2,	%l3,	%i7
	edge16n	%l1,	%l2,	%o5
	andncc	%o6,	%g3,	%i0
loop_2699:
	nop
	setx	0xF2ED634A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x5E5654B6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f21,	%f29
	edge8n	%g2,	%i2,	%i3
	fcmpne32	%f18,	%f4,	%l6
	ldx	[%l7 + 0x50],	%g5
	fbug,a	%fcc1,	loop_2700
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2700:
	fbge,a	%fcc2,	loop_2701
	edge32	%o4,	%i1,	%i6
	sll	%g4,	%l0,	%o3
	array8	%o1,	%l4,	%i4
loop_2701:
	fmul8x16au	%f0,	%f8,	%f4
	addc	%g1,	%g6,	%l5
	set	0x218, %g6
	ldxa	[%g0 + %g6] 0x52,	%o7
	movcc	%icc,	%i5,	%g7
	tvs	%xcc,	0x5
	fmovdl	%icc,	%f28,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x6E, %i4
	lduba	[%l7 + %i4] 0x10,	%o2
	umulcc	%l3,	%i7,	%l1
	srlx	%l2,	%o5,	%o0
	fpack32	%f18,	%f8,	%f2
	udivx	%o6,	0x0D75,	%i0
	xnorcc	%g2,	0x0E92,	%g3
	set	0x0A, %o4
	lduha	[%l7 + %o4] 0x80,	%i2
	xor	%l6,	%i3,	%g5
	add	%o4,	0x0F32,	%i6
	tge	%xcc,	0x7
	tn	%icc,	0x1
	tvc	%xcc,	0x6
	srlx	%i1,	0x17,	%l0
	smul	%g4,	0x0D21,	%o3
	fone	%f4
	fmovdle	%xcc,	%f12,	%f15
	swap	[%l7 + 0x4C],	%l4
	subcc	%o1,	0x1B37,	%i4
	tcs	%icc,	0x5
	fba	%fcc1,	loop_2702
	movvs	%icc,	%g1,	%l5
	movcc	%icc,	%g6,	%i5
	edge32l	%o7,	%g7,	%o2
loop_2702:
	fmul8x16au	%f27,	%f7,	%f2
	tn	%xcc,	0x2
	udivcc	%l3,	0x1534,	%l1
	edge32l	%i7,	%l2,	%o5
	bneg,a	%icc,	loop_2703
	srl	%o0,	%o6,	%i0
	sdivx	%g3,	0x0FE6,	%i2
	edge8n	%g2,	%l6,	%g5
loop_2703:
	popc	%i3,	%o4
	set	0x51, %l5
	stba	%i6,	[%l7 + %l5] 0x2b
	membar	#Sync
	fbne	%fcc1,	loop_2704
	movn	%icc,	%l0,	%i1
	tvs	%xcc,	0x4
	subccc	%g4,	0x1057,	%o3
loop_2704:
	te	%xcc,	0x5
	udivcc	%l4,	0x1D8D,	%i4
	fcmple32	%f2,	%f20,	%g1
	movvc	%xcc,	%l5,	%g6
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f10
	edge8n	%i5,	%o1,	%o7
	fmovsne	%xcc,	%f22,	%f5
	fzeros	%f27
	fnot1	%f26,	%f6
	movrgez	%g7,	%l3,	%o2
	bcc,a	%icc,	loop_2705
	tleu	%xcc,	0x6
	tcc	%xcc,	0x4
	brlz,a	%i7,	loop_2706
loop_2705:
	array16	%l2,	%l1,	%o0
	addcc	%o5,	0x046B,	%i0
	subcc	%g3,	0x0DD2,	%i2
loop_2706:
	fands	%f8,	%f29,	%f19
	edge8l	%g2,	%l6,	%g5
	edge8n	%o6,	%i3,	%o4
	tcc	%icc,	0x1
	umulcc	%i6,	0x0C3B,	%l0
	te	%icc,	0x5
	movge	%xcc,	%i1,	%g4
	and	%o3,	0x19E2,	%l4
	set	0x08, %o2
	stha	%g1,	[%l7 + %o2] 0x19
	or	%l5,	%g6,	%i4
	edge8ln	%o1,	%i5,	%o7
	movleu	%icc,	%l3,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%l2
	fmovdn	%icc,	%f14,	%f8
	fmovrslez	%i7,	%f3,	%f28
	array16	%l1,	%o0,	%i0
	or	%g3,	%o5,	%g2
	fsrc1	%f14,	%f2
	fandnot1s	%f2,	%f19,	%f14
	stbar
	or	%l6,	0x0E9B,	%g5
	xnorcc	%o6,	0x0A5C,	%i3
	edge32ln	%o4,	%i2,	%l0
	popc	0x175F,	%i1
	movge	%xcc,	%i6,	%o3
	fcmple16	%f22,	%f26,	%l4
	brgz,a	%g4,	loop_2707
	ldd	[%l7 + 0x48],	%g0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%g6
loop_2707:
	nop
	setx	0xE07173A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	mova	%xcc,	%i4,	%o1
	smul	%i5,	%l5,	%l3
	movpos	%xcc,	%o2,	%o7
	fbuge	%fcc0,	loop_2708
	swap	[%l7 + 0x20],	%g7
	edge16ln	%i7,	%l2,	%o0
	sub	%l1,	0x066E,	%i0
loop_2708:
	alignaddrl	%o5,	%g2,	%g3
	tle	%icc,	0x4
	fbge,a	%fcc3,	loop_2709
	st	%f23,	[%l7 + 0x18]
	movrlz	%l6,	0x019,	%g5
	fmovrdlz	%i3,	%f14,	%f24
loop_2709:
	movrne	%o4,	0x2A3,	%i2
	fandnot2s	%f19,	%f1,	%f19
	tle	%icc,	0x3
	srax	%l0,	%i1,	%i6
	ldd	[%l7 + 0x20],	%f10
	andcc	%o6,	%o3,	%g4
	movleu	%xcc,	%g1,	%g6
	nop
	setx loop_2710, %l0, %l1
	jmpl %l1, %i4
	tg	%icc,	0x0
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o1
loop_2710:
	nop
	setx loop_2711, %l0, %l1
	jmpl %l1, %l4
	move	%icc,	%i5,	%l5
	movne	%icc,	%o2,	%l3
	umul	%g7,	%o7,	%i7
loop_2711:
	array32	%o0,	%l2,	%l1
	mova	%xcc,	%o5,	%g2
	ldd	[%l7 + 0x18],	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g3,	%l6,	%g5
	subc	%i0,	%o4,	%i2
	be	%xcc,	loop_2712
	ldsb	[%l7 + 0x4F],	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i1,	0x1BD7,	%i3
loop_2712:
	fmovsneg	%icc,	%f4,	%f28
	fbg	%fcc2,	loop_2713
	fbe,a	%fcc1,	loop_2714
	bvc,a	loop_2715
	ldsh	[%l7 + 0x1C],	%o6
loop_2713:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2714:
	brgz,a	%o3,	loop_2716
loop_2715:
	movrne	%i6,	%g1,	%g4
	fnors	%f28,	%f4,	%f2
	ldsh	[%l7 + 0x66],	%g6
loop_2716:
	edge32ln	%o1,	%i4,	%l4
	sdivx	%l5,	0x1848,	%i5
	nop
	setx	0x890BB6E71B3D8F32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x82DD0CAB286BFB42,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f0,	%f20
	fpsub32s	%f21,	%f27,	%f21
	tvc	%xcc,	0x0
	bpos,a,pt	%icc,	loop_2717
	fmovrse	%o2,	%f23,	%f23
	umul	%g7,	0x0A5B,	%l3
	edge8l	%i7,	%o7,	%o0
loop_2717:
	nop
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	fmul8sux16	%f26,	%f6,	%f6
	orncc	%o5,	%l2,	%g2
	tpos	%xcc,	0x2
	bne	loop_2718
	nop
	setx	0xA9F47F16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x329D9B3B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f12,	%f2
	tge	%xcc,	0x1
	wr	%g0,	0x2b,	%asi
	stha	%g3,	[%l7 + 0x56] %asi
	membar	#Sync
loop_2718:
	xor	%g5,	%i0,	%l6
	movrgz	%o4,	0x0E0,	%i2
	udivcc	%i1,	0x1A5A,	%i3
	movvs	%xcc,	%l0,	%o3
	fmul8x16al	%f12,	%f15,	%f24
	bge	%icc,	loop_2719
	movcs	%xcc,	%o6,	%g1
	fble,a	%fcc0,	loop_2720
	fmul8x16au	%f18,	%f10,	%f28
loop_2719:
	fxor	%f6,	%f14,	%f20
	nop
	setx loop_2721, %l0, %l1
	jmpl %l1, %g4
loop_2720:
	andn	%g6,	0x10AA,	%i6
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x14,	 0x1
loop_2721:
	fpadd16	%f20,	%f22,	%f18
	umul	%l4,	0x0F06,	%o1
	fmovrslz	%l5,	%f3,	%f14
	mulx	%o2,	0x0B84,	%g7
	movrlz	%i5,	0x023,	%i7
	fmovrdne	%o7,	%f12,	%f12
	edge32n	%l3,	%o0,	%o5
	sdivx	%l1,	0x0C48,	%l2
	popc	%g2,	%g5
	lduw	[%l7 + 0x6C],	%g3
	fmul8sux16	%f12,	%f8,	%f2
	tpos	%icc,	0x0
	fble	%fcc2,	loop_2722
	sll	%l6,	0x09,	%o4
	fpsub32s	%f27,	%f5,	%f30
	fornot2s	%f0,	%f2,	%f1
loop_2722:
	tl	%icc,	0x2
	tgu	%icc,	0x6
	movn	%xcc,	%i0,	%i1
	nop
	set	0x64, %l3
	prefetch	[%l7 + %l3],	 0x3
	tneg	%xcc,	0x5
	orcc	%i3,	0x1A72,	%i2
	movl	%icc,	%l0,	%o3
	movle	%icc,	%g1,	%o6
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f8
	movvs	%xcc,	%g6,	%g4
	andn	%i6,	%l4,	%i4
	movne	%icc,	%o1,	%o2
	set	0x48, %o0
	lda	[%l7 + %o0] 0x80,	%f27
	ldstub	[%l7 + 0x38],	%l5
	swap	[%l7 + 0x68],	%i5
	bleu,pt	%xcc,	loop_2723
	prefetch	[%l7 + 0x4C],	 0x2
	set	0x5F, %g2
	ldstuba	[%l7 + %g2] 0x89,	%g7
loop_2723:
	tcc	%xcc,	0x3
	fcmple16	%f24,	%f10,	%o7
	fmovsleu	%icc,	%f3,	%f13
	tcc	%icc,	0x1
	fnot1s	%f13,	%f14
	udivx	%i7,	0x0AEC,	%l3
	edge16l	%o0,	%l1,	%o5
	tleu	%xcc,	0x7
	movg	%icc,	%g2,	%g5
	fbl,a	%fcc1,	loop_2724
	movg	%icc,	%g3,	%l6
	nop
	setx	0x706D3FE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	andcc	%l2,	%o4,	%i1
loop_2724:
	udivcc	%i3,	0x07BA,	%i0
	fcmpne16	%f8,	%f2,	%l0
	sdivcc	%o3,	0x1EF2,	%g1
	ldx	[%l7 + 0x20],	%i2
	set	0x3F, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o6
	nop
	fitod	%f23,	%f18
	bvc,a	%icc,	loop_2725
	andn	%g6,	0x0434,	%g4
	fsrc2	%f18,	%f22
	udiv	%l4,	0x01FD,	%i4
loop_2725:
	ta	%icc,	0x0
	wr	%g0,	0x23,	%asi
	stwa	%i6,	[%l7 + 0x44] %asi
	membar	#Sync
	sir	0x1124
	orncc	%o1,	%o2,	%i5
	edge8l	%g7,	%l5,	%o7
	taddcc	%i7,	0x0AEB,	%l3
	nop
	set	0x4C, %g4
	ldsh	[%l7 + %g4],	%o0
	udivx	%o5,	0x01CD,	%g2
	brnz,a	%g5,	loop_2726
	bn	%xcc,	loop_2727
	fmovdcc	%icc,	%f3,	%f15
	edge8n	%g3,	%l6,	%l2
loop_2726:
	tne	%icc,	0x7
loop_2727:
	movg	%icc,	%o4,	%l1
	nop
	setx	0x4095FB79,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x8FAE8B5D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f10,	%f16
	movne	%icc,	%i1,	%i0
	brgez,a	%l0,	loop_2728
	ldub	[%l7 + 0x1C],	%i3
	bcc,pn	%icc,	loop_2729
	fmovsn	%xcc,	%f2,	%f0
loop_2728:
	fmovdvs	%icc,	%f11,	%f21
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
loop_2729:
	fbule,a	%fcc0,	loop_2730
	fbge,a	%fcc1,	loop_2731
	movleu	%icc,	%g1,	%o6
	movre	%i2,	%g4,	%g6
loop_2730:
	edge8ln	%l4,	%i4,	%o1
loop_2731:
	fmovrslz	%o2,	%f23,	%f30
	srl	%i6,	0x05,	%g7
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	bgu,a,pt	%icc,	loop_2732
	swap	[%l7 + 0x40],	%l5
	and	%o7,	0x11FA,	%i7
	edge32l	%o0,	%o5,	%l3
loop_2732:
	udivx	%g5,	0x1169,	%g3
	fands	%f10,	%f18,	%f7
	fbuge,a	%fcc0,	loop_2733
	fmovsvs	%xcc,	%f25,	%f17
	movre	%l6,	%l2,	%o4
	addc	%g2,	%l1,	%i1
loop_2733:
	array8	%l0,	%i0,	%o3
	fnot2	%f30,	%f18
	nop
	setx	loop_2734,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fba	%fcc1,	loop_2735
	andn	%g1,	0x0A7A,	%i3
	set	0x30, %o1
	ldxa	[%l7 + %o1] 0x18,	%o6
loop_2734:
	ldd	[%l7 + 0x60],	%f24
loop_2735:
	ldsb	[%l7 + 0x6A],	%i2
	sethi	0x1C2E,	%g4
	nop
	fitos	%f1,	%f25
	fstox	%f25,	%f12
	fxtos	%f12,	%f21
	bl,a	%xcc,	loop_2736
	tg	%xcc,	0x5
	movge	%xcc,	%l4,	%g6
	ldd	[%l7 + 0x78],	%i4
loop_2736:
	andn	%o1,	%i6,	%g7
	fbule,a	%fcc0,	loop_2737
	fmovspos	%icc,	%f23,	%f27
	andn	%i5,	%l5,	%o7
	mova	%xcc,	%o2,	%o0
loop_2737:
	movne	%icc,	%o5,	%i7
	edge8n	%g5,	%l3,	%l6
	movpos	%icc,	%g3,	%l2
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x64] %asi
	tneg	%xcc,	0x5
	mova	%icc,	%g2,	%o4
	orcc	%i1,	%l1,	%l0
	tneg	%xcc,	0x4
	movne	%xcc,	%o3,	%i0
	fmul8sux16	%f30,	%f4,	%f18
	fble	%fcc1,	loop_2738
	edge8	%g1,	%i3,	%o6
	tle	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x44] %asi,	%g4
loop_2738:
	movrgez	%l4,	%i2,	%i4
	fxnors	%f8,	%f21,	%f26
	tneg	%icc,	0x5
	sllx	%g6,	0x1B,	%o1
	fcmple16	%f16,	%f6,	%g7
	fmovrslz	%i5,	%f9,	%f18
	nop
	setx	0x9BF92965,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x0DA65714,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f31,	%f19
	nop
	setx	0x4D1433D2505A9DAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tg	%xcc,	0x7
	fbe	%fcc2,	loop_2739
	tge	%xcc,	0x1
	andcc	%i6,	0x0C1A,	%o7
	edge16n	%o2,	%l5,	%o0
loop_2739:
	movge	%icc,	%i7,	%g5
	membar	0x75
	alignaddrl	%l3,	%o5,	%g3
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16n	%l2,	%g2,	%o4
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f2
	fmovsvc	%icc,	%f12,	%f0
	sub	%l6,	%i1,	%l0
	brlez	%o3,	loop_2740
	edge16l	%l1,	%g1,	%i3
	fbug,a	%fcc0,	loop_2741
	srax	%o6,	0x0A,	%g4
loop_2740:
	edge8n	%i0,	%i2,	%l4
	umul	%i4,	%o1,	%g7
loop_2741:
	mulscc	%g6,	%i5,	%i6
	addc	%o2,	0x0E6B,	%o7
	set	0x52, %g5
	lduha	[%l7 + %g5] 0x10,	%o0
	bgu,pn	%xcc,	loop_2742
	stx	%i7,	[%l7 + 0x50]
	lduw	[%l7 + 0x44],	%g5
	edge32n	%l3,	%o5,	%g3
loop_2742:
	tge	%icc,	0x6
	bn,a,pt	%xcc,	loop_2743
	tneg	%xcc,	0x6
	set	0x28, %l1
	swapa	[%l7 + %l1] 0x89,	%l2
loop_2743:
	fba,a	%fcc2,	loop_2744
	mulscc	%l5,	0x1848,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l6,	0x0DD3,	%i1
loop_2744:
	fmovrdgez	%o4,	%f28,	%f26
	tcs	%xcc,	0x1
	mova	%icc,	%l0,	%o3
	sllx	%l1,	0x12,	%i3
	fexpand	%f8,	%f16
	fnot1	%f12,	%f2
	movg	%icc,	%o6,	%g1
	tle	%icc,	0x7
	movge	%xcc,	%g4,	%i2
	smulcc	%l4,	0x175F,	%i4
	fabss	%f11,	%f7
	edge32l	%o1,	%g7,	%i0
	for	%f22,	%f10,	%f12
	xorcc	%i5,	%g6,	%i6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sub	%o2,	0x0958,	%o7
	srax	%i7,	%g5,	%l3
	sdiv	%o0,	0x145F,	%o5
	fba	%fcc1,	loop_2745
	andncc	%l2,	%l5,	%g3
	bge,pn	%xcc,	loop_2746
	fnand	%f6,	%f24,	%f14
loop_2745:
	sdivcc	%g2,	0x0A93,	%l6
	fnand	%f4,	%f26,	%f16
loop_2746:
	fbule,a	%fcc3,	loop_2747
	fmovrsgez	%i1,	%f10,	%f15
	movl	%icc,	%o4,	%o3
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf8
	membar	#Sync
loop_2747:
	alignaddr	%l1,	%i3,	%l0
	alignaddr	%o6,	%g1,	%g4
	edge32n	%i2,	%l4,	%i4
	fone	%f2
	tge	%icc,	0x3
	smul	%o1,	%i0,	%g7
	popc	0x10D8,	%g6
	movgu	%xcc,	%i5,	%i6
	movcs	%xcc,	%o7,	%o2
	fbg	%fcc2,	loop_2748
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x60],	%f19
	fmovsge	%icc,	%f25,	%f0
loop_2748:
	movcc	%icc,	%g5,	%i7
	sdivx	%l3,	0x016E,	%o0
	brnz,a	%l2,	loop_2749
	edge32ln	%o5,	%l5,	%g3
	sll	%l6,	%i1,	%g2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%o3
loop_2749:
	fbul,a	%fcc2,	loop_2750
	taddcctv	%o4,	%i3,	%l1
	fpsub32s	%f11,	%f28,	%f26
	brnz	%o6,	loop_2751
loop_2750:
	movneg	%xcc,	%g1,	%l0
	ldsw	[%l7 + 0x4C],	%g4
	orncc	%i2,	%i4,	%o1
loop_2751:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x34] %asi,	%f4
	sdivx	%i0,	0x0362,	%g7
	fcmpne16	%f28,	%f8,	%g6
	fxors	%f9,	%f29,	%f19
	tvs	%icc,	0x3
	movcc	%xcc,	%l4,	%i5
	fmovsneg	%xcc,	%f24,	%f8
	array32	%o7,	%o2,	%i6
	fmovrslz	%g5,	%f10,	%f3
	nop
	setx	0x8250F2E59B0BD8A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xAF947B49AA4194DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f16,	%f10
	edge16l	%i7,	%l3,	%o0
	ld	[%l7 + 0x64],	%f6
	pdist	%f12,	%f4,	%f30
	tpos	%xcc,	0x7
	brz,a	%l2,	loop_2752
	fmovdgu	%xcc,	%f25,	%f27
	popc	%o5,	%g3
	subc	%l6,	%l5,	%g2
loop_2752:
	nop
	set	0x7E, %i3
	stha	%i1,	[%l7 + %i3] 0x19
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldub	[%l7 + 0x32],	%o3
	ble,pt	%xcc,	loop_2753
	addc	%o4,	0x1915,	%i3
	ble,pn	%icc,	loop_2754
	subc	%o6,	%l1,	%g1
loop_2753:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2754:
	andcc	%g4,	%l0,	%i2
	fbo,a	%fcc2,	loop_2755
	bne,pt	%icc,	loop_2756
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x68
loop_2755:
	srax	%o1,	0x10,	%i4
loop_2756:
	brlez,a	%i0,	loop_2757
	fbe	%fcc3,	loop_2758
	sir	0x1346
	udivcc	%g7,	0x000F,	%g6
loop_2757:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2758:
	movpos	%xcc,	%i5,	%l4
	addccc	%o7,	0x037F,	%o2
	umul	%g5,	0x130D,	%i6
	xnor	%l3,	0x1231,	%i7
	edge16l	%o0,	%l2,	%o5
	edge32n	%g3,	%l5,	%l6
	sra	%i1,	0x0A,	%g2
	tne	%xcc,	0x7
	lduw	[%l7 + 0x28],	%o4
	fones	%f5
	fmovsne	%xcc,	%f19,	%f5
	or	%o3,	%i3,	%l1
	xor	%g1,	0x08FB,	%g4
	fmovd	%f16,	%f24
	sdiv	%l0,	0x0C1E,	%i2
	fmovdpos	%xcc,	%f12,	%f15
	fbu,a	%fcc3,	loop_2759
	sdivx	%o6,	0x0B84,	%o1
	tn	%xcc,	0x6
	fmovsn	%xcc,	%f12,	%f30
loop_2759:
	bleu,pn	%icc,	loop_2760
	brnz	%i0,	loop_2761
	edge8n	%g7,	%g6,	%i5
	fmovsgu	%xcc,	%f18,	%f31
loop_2760:
	fbo,a	%fcc3,	loop_2762
loop_2761:
	movpos	%icc,	%l4,	%o7
	movpos	%xcc,	%o2,	%i4
	fbue	%fcc2,	loop_2763
loop_2762:
	movre	%i6,	%l3,	%i7
	membar	0x5E
	nop
	fitos	%f7,	%f31
	fstox	%f31,	%f26
loop_2763:
	call	loop_2764
	mulx	%o0,	%l2,	%o5
	orncc	%g5,	%l5,	%g3
	edge32l	%i1,	%l6,	%o4
loop_2764:
	tcs	%xcc,	0x4
	ldd	[%l7 + 0x60],	%f30
	sdiv	%o3,	0x1F1D,	%g2
	edge16n	%i3,	%g1,	%g4
	andncc	%l1,	%l0,	%i2
	membar	0x61
	xorcc	%o1,	%i0,	%g7
	bg,a	loop_2765
	fmovsl	%icc,	%f1,	%f27
	tcc	%icc,	0x5
	nop
	setx	0xDEF5910A807F001C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
loop_2765:
	movle	%xcc,	%o6,	%i5
	fbl	%fcc2,	loop_2766
	nop
	setx	0x9BE3123F9040C916,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	umulcc	%l4,	0x090B,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2766:
	edge8ln	%g6,	%o2,	%i6
	edge16n	%l3,	%i4,	%i7
	subc	%o0,	%l2,	%g5
	fors	%f5,	%f24,	%f31
	srlx	%l5,	%o5,	%i1
	fbe	%fcc1,	loop_2767
	edge32	%g3,	%o4,	%o3
	subcc	%l6,	%g2,	%g1
	sub	%g4,	0x1E87,	%l1
loop_2767:
	movl	%icc,	%l0,	%i2
	fbug	%fcc0,	loop_2768
	sub	%i3,	0x019B,	%o1
	umul	%g7,	0x0F1B,	%i0
	swap	[%l7 + 0x0C],	%i5
loop_2768:
	andncc	%l4,	%o6,	%o7
	movvs	%icc,	%g6,	%i6
	alignaddr	%l3,	%i4,	%o2
	edge8n	%o0,	%i7,	%g5
	array8	%l5,	%l2,	%i1
	srl	%o5,	0x09,	%g3
	fors	%f17,	%f17,	%f10
	popc	%o4,	%l6
	movneg	%xcc,	%o3,	%g2
	fpack16	%f26,	%f31
	fands	%f6,	%f16,	%f20
	movg	%icc,	%g1,	%g4
	bpos	loop_2769
	move	%icc,	%l0,	%i2
	sdivx	%i3,	0x06D6,	%l1
	fmovdcc	%icc,	%f0,	%f15
loop_2769:
	nop
	setx	0x7358170E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xF79771F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f28,	%f3
	bcs,a	loop_2770
	array8	%g7,	%o1,	%i0
	srax	%i5,	0x0E,	%l4
	fcmple32	%f2,	%f16,	%o6
loop_2770:
	fbo	%fcc1,	loop_2771
	tcc	%xcc,	0x3
	movcc	%xcc,	%o7,	%i6
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0x3
loop_2771:
	fmovrslz	%l3,	%f4,	%f10
	sub	%o2,	0x0890,	%i4
	smulcc	%i7,	%g5,	%l5
	for	%f22,	%f20,	%f8
	ble,a	%xcc,	loop_2772
	mova	%xcc,	%o0,	%l2
	stw	%i1,	[%l7 + 0x5C]
	nop
	setx	loop_2773,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2772:
	array32	%g3,	%o4,	%o5
	edge8	%o3,	%g2,	%l6
	ldd	[%l7 + 0x60],	%f16
loop_2773:
	movvc	%icc,	%g4,	%l0
	sdivcc	%g1,	0x1F08,	%i3
	umul	%l1,	0x1378,	%g7
	ta	%xcc,	0x6
	alignaddrl	%i2,	%o1,	%i5
	movpos	%xcc,	%l4,	%o6
	nop
	setx	0xC0612119,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	nop
	set	0x28, %i2
	lduh	[%l7 + %i2],	%i0
	movle	%xcc,	%i6,	%g6
	ldx	[%l7 + 0x50],	%l3
	fnors	%f16,	%f1,	%f21
	fmovrdgez	%o2,	%f22,	%f26
	edge16ln	%i4,	%o7,	%g5
	movne	%xcc,	%l5,	%o0
	edge32ln	%i7,	%l2,	%g3
	fabss	%f31,	%f12
	bne	%xcc,	loop_2774
	lduw	[%l7 + 0x5C],	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o5,	%o3,	%i1
loop_2774:
	bvc,pn	%xcc,	loop_2775
	tsubcc	%g2,	%g4,	%l6
	nop
	setx	0x6BF885A25C354CEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0A199EB51DACAD41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f0,	%f26
	movle	%icc,	%l0,	%i3
loop_2775:
	edge16n	%l1,	%g7,	%g1
	smul	%o1,	0x07E2,	%i2
	edge8n	%l4,	%o6,	%i5
	fornot1	%f16,	%f30,	%f26
	edge16l	%i6,	%i0,	%g6
	and	%o2,	0x12F9,	%l3
	movl	%icc,	%o7,	%i4
	fsrc2s	%f21,	%f18
	sdivx	%l5,	0x1C46,	%o0
	set	0x74, %i7
	lda	[%l7 + %i7] 0x14,	%f29
	brgz	%i7,	loop_2776
	fcmpgt16	%f4,	%f0,	%g5
	addc	%g3,	0x0B37,	%o4
	bneg,a,pt	%xcc,	loop_2777
loop_2776:
	tgu	%icc,	0x4
	srl	%o5,	0x07,	%o3
	ldstub	[%l7 + 0x73],	%l2
loop_2777:
	ble,a	loop_2778
	movgu	%icc,	%g2,	%g4
	fbug,a	%fcc0,	loop_2779
	fcmpne32	%f20,	%f0,	%l6
loop_2778:
	tge	%xcc,	0x4
	movne	%xcc,	%l0,	%i3
loop_2779:
	udivx	%i1,	0x1761,	%g7
	sth	%l1,	[%l7 + 0x48]
	fmovdg	%xcc,	%f23,	%f1
	move	%icc,	%g1,	%i2
	umul	%o1,	0x0A73,	%o6
	ta	%xcc,	0x0
	add	%i5,	%l4,	%i6
	fandnot1	%f4,	%f20,	%f8
	or	%g6,	0x07D3,	%i0
	movrgez	%o2,	%o7,	%i4
	bcs,pt	%xcc,	loop_2780
	bgu	%icc,	loop_2781
	ldsh	[%l7 + 0x0E],	%l3
	bvc,pn	%icc,	loop_2782
loop_2780:
	fnot1	%f30,	%f18
loop_2781:
	fble	%fcc2,	loop_2783
	nop
	setx	0xAEF6079417516CB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x5C3C725D39B04A46,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f12,	%f18
loop_2782:
	bvc,pn	%xcc,	loop_2784
	edge32ln	%l5,	%o0,	%i7
loop_2783:
	bne,a	%icc,	loop_2785
	fpsub16	%f4,	%f14,	%f28
loop_2784:
	movneg	%xcc,	%g3,	%g5
	and	%o4,	%o3,	%l2
loop_2785:
	bcs,a	%icc,	loop_2786
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x7
	edge32ln	%o5,	%g4,	%l6
loop_2786:
	orn	%g2,	0x0F55,	%l0
	mulscc	%i3,	%g7,	%l1
	xnor	%i1,	%g1,	%i2
	fbue,a	%fcc1,	loop_2787
	fba,a	%fcc2,	loop_2788
	fornot1	%f24,	%f18,	%f16
	orcc	%o1,	%i5,	%o6
loop_2787:
	fcmpne32	%f18,	%f26,	%l4
loop_2788:
	movrne	%g6,	0x2CE,	%i6
	edge16	%i0,	%o2,	%i4
	movneg	%icc,	%l3,	%l5
	and	%o7,	0x15F0,	%o0
	fsrc1	%f14,	%f26
	ldstub	[%l7 + 0x6C],	%g3
	edge32	%i7,	%g5,	%o4
	fbn,a	%fcc1,	loop_2789
	fmovdcs	%xcc,	%f0,	%f0
	tneg	%xcc,	0x5
	membar	0x3B
loop_2789:
	fble,a	%fcc0,	loop_2790
	tvc	%icc,	0x2
	move	%icc,	%l2,	%o5
	te	%xcc,	0x1
loop_2790:
	edge16n	%o3,	%g4,	%l6
	brlz	%g2,	loop_2791
	movgu	%icc,	%l0,	%g7
	edge8ln	%l1,	%i3,	%i1
	and	%i2,	%o1,	%i5
loop_2791:
	movneg	%icc,	%g1,	%o6
	movleu	%xcc,	%g6,	%l4
	fnor	%f8,	%f28,	%f12
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x1f,	%f0
	fmul8x16	%f3,	%f20,	%f18
	tl	%icc,	0x3
	ta	%xcc,	0x4
	xor	%i6,	0x17B1,	%i0
	move	%icc,	%o2,	%i4
	fmul8x16al	%f4,	%f24,	%f22
	xnor	%l5,	0x1F3A,	%l3
	membar	0x46
	fbne,a	%fcc3,	loop_2792
	bl	%icc,	loop_2793
	sethi	0x1A4C,	%o0
	tneg	%xcc,	0x6
loop_2792:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x28] %asi,	%g3
loop_2793:
	subcc	%o7,	0x193F,	%i7
	nop
	setx	0x78C0BE07D051696B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movcs	%xcc,	%o4,	%l2
	udivcc	%o5,	0x04DA,	%g5
	fmovrde	%g4,	%f20,	%f12
	set	0x3C, %g7
	stwa	%l6,	[%l7 + %g7] 0x19
	ldx	[%l7 + 0x30],	%o3
	movge	%icc,	%l0,	%g7
	fmovdg	%icc,	%f2,	%f19
	movpos	%xcc,	%g2,	%i3
	xorcc	%l1,	0x1BF3,	%i1
	bcs,a	loop_2794
	fmovsl	%icc,	%f10,	%f22
	fmovrsgez	%i2,	%f3,	%f25
	membar	0x70
loop_2794:
	fmovsle	%xcc,	%f24,	%f11
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x70] %asi,	%o1
	edge8	%i5,	%g1,	%g6
	xor	%l4,	%o6,	%i0
	bpos	%xcc,	loop_2795
	movrlz	%i6,	0x3D3,	%i4
	for	%f0,	%f24,	%f22
	nop
	setx	0x68BE044B307F7EF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
loop_2795:
	tneg	%xcc,	0x6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x19,	%f0
	fmovsgu	%icc,	%f10,	%f19
	srl	%l5,	%o2,	%l3
	edge16n	%o0,	%o7,	%g3
	subcc	%o4,	%i7,	%l2
	sll	%o5,	%g5,	%l6
	tsubcc	%o3,	0x1C48,	%g4
	set	0x1D, %o7
	lduba	[%l7 + %o7] 0x88,	%l0
	nop
	setx	loop_2796,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%g7,	0x1C1D,	%g2
	ld	[%l7 + 0x78],	%f9
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l1,	%i3
loop_2796:
	mulscc	%i2,	%i1,	%o1
	edge16	%i5,	%g6,	%g1
	edge8	%o6,	%i0,	%i6
	fpsub16	%f24,	%f24,	%f20
	xnorcc	%l4,	0x1419,	%i4
	set	0x5F, %i1
	ldstuba	[%l7 + %i1] 0x10,	%o2
	subc	%l5,	%l3,	%o0
	nop
	fitos	%f16,	%f26
	fmovde	%xcc,	%f20,	%f8
	fmovscs	%icc,	%f31,	%f7
	sllx	%g3,	0x02,	%o7
	nop
	setx	0xBBDD411DDAF75F9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7208080693D04454,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f30,	%f2
	xnor	%o4,	0x18D5,	%i7
	nop
	setx	loop_2797,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%o5,	%l2,	%g5
	xor	%o3,	0x024A,	%g4
	array16	%l0,	%g7,	%g2
loop_2797:
	fbg,a	%fcc0,	loop_2798
	tpos	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,pn	%icc,	loop_2799
loop_2798:
	edge16l	%l6,	%l1,	%i2
	edge8n	%i1,	%i3,	%o1
	lduh	[%l7 + 0x6A],	%g6
loop_2799:
	fmovsneg	%xcc,	%f18,	%f30
	fmovsge	%xcc,	%f14,	%f14
	tne	%xcc,	0x4
	fcmpeq32	%f10,	%f26,	%i5
	nop
	setx loop_2800, %l0, %l1
	jmpl %l1, %g1
	fbe	%fcc1,	loop_2801
	tge	%icc,	0x4
	alignaddrl	%i0,	%o6,	%l4
loop_2800:
	addccc	%i6,	0x06FC,	%o2
loop_2801:
	subc	%i4,	%l3,	%l5
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g3
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f22
	fxtod	%f22,	%f16
	movleu	%icc,	%o0,	%o4
	sra	%o7,	0x16,	%o5
	fmovsa	%icc,	%f0,	%f25
	movge	%xcc,	%l2,	%i7
	srax	%o3,	0x11,	%g4
	array32	%g5,	%l0,	%g2
	subccc	%l6,	0x01BC,	%l1
	nop
	set	0x50, %o3
	prefetch	[%l7 + %o3],	 0x0
	te	%icc,	0x3
	set	0x30, %l2
	lduha	[%l7 + %l2] 0x11,	%i2
	addcc	%g7,	%i3,	%i1
	prefetch	[%l7 + 0x68],	 0x3
	orcc	%o1,	%g6,	%g1
	array32	%i0,	%i5,	%l4
	fsrc2	%f22,	%f22
	tge	%icc,	0x0
	orn	%o6,	%o2,	%i6
	movrne	%i4,	%l3,	%g3
	fmovrde	%o0,	%f22,	%f18
	xorcc	%l5,	0x0D22,	%o7
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x18,	 0x1
	subcc	%l2,	0x132F,	%i7
	movvc	%icc,	%o3,	%o5
	alignaddrl	%g4,	%g5,	%l0
	ble,pt	%icc,	loop_2802
	mulx	%l6,	%l1,	%i2
	movcc	%xcc,	%g7,	%i3
	fmovdle	%icc,	%f1,	%f11
loop_2802:
	tl	%xcc,	0x0
	fmovrsgez	%g2,	%f1,	%f1
	or	%o1,	0x1826,	%i1
	movcc	%xcc,	%g1,	%i0
	nop
	fitos	%f0,	%f1
	fstox	%f1,	%f28
	fxtos	%f28,	%f24
	fcmple32	%f20,	%f24,	%i5
	movneg	%icc,	%g6,	%o6
	sra	%l4,	%o2,	%i6
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x15
	tneg	%icc,	0x2
	sub	%l3,	0x0605,	%i4
	or	%o0,	%g3,	%l5
	fnot2s	%f6,	%f16
	fmovspos	%xcc,	%f5,	%f6
	te	%icc,	0x0
	edge8ln	%o4,	%l2,	%i7
	tneg	%icc,	0x7
	tg	%xcc,	0x3
	andncc	%o3,	%o7,	%o5
	flush	%l7 + 0x78
	fnand	%f14,	%f8,	%f20
	fbg,a	%fcc0,	loop_2803
	pdist	%f26,	%f0,	%f22
	movcs	%icc,	%g5,	%g4
	fsrc2s	%f11,	%f0
loop_2803:
	fnegd	%f12,	%f14
	fmovsle	%icc,	%f11,	%f2
	bleu,a	loop_2804
	fmovspos	%icc,	%f31,	%f22
	srl	%l0,	%l6,	%i2
	movvc	%xcc,	%g7,	%l1
loop_2804:
	edge16ln	%g2,	%o1,	%i3
	movleu	%xcc,	%g1,	%i0
	orn	%i5,	%g6,	%i1
	fmovrdne	%l4,	%f14,	%f8
	movle	%icc,	%o2,	%i6
	fbge,a	%fcc0,	loop_2805
	fmovdge	%icc,	%f4,	%f18
	stbar
	bge,pn	%xcc,	loop_2806
loop_2805:
	tsubcctv	%l3,	0x18DA,	%o6
	fcmpne32	%f8,	%f4,	%o0
	sllx	%i4,	0x1B,	%g3
loop_2806:
	sdiv	%l5,	0x18E1,	%o4
	fpadd16s	%f24,	%f1,	%f21
	movrlz	%i7,	0x1F2,	%l2
	tn	%icc,	0x4
	subccc	%o3,	0x1BED,	%o7
	fbne,a	%fcc1,	loop_2807
	sdivx	%g5,	0x15D0,	%g4
	fzeros	%f31
	fornot1	%f30,	%f30,	%f2
loop_2807:
	fmovdle	%xcc,	%f7,	%f27
	smulcc	%l0,	0x14E5,	%o5
	te	%xcc,	0x6
	fmovda	%icc,	%f31,	%f24
	fmovscc	%xcc,	%f10,	%f22
	membar	0x53
	alignaddrl	%l6,	%i2,	%l1
	movvs	%icc,	%g2,	%o1
	fmovdg	%xcc,	%f21,	%f24
	fandnot1	%f26,	%f0,	%f12
	fornot1s	%f28,	%f13,	%f8
	swap	[%l7 + 0x68],	%i3
	ldub	[%l7 + 0x65],	%g7
	fmovsne	%icc,	%f6,	%f30
	alignaddrl	%g1,	%i0,	%g6
	fmovrsgez	%i1,	%f10,	%f7
	tcc	%xcc,	0x2
	fblg,a	%fcc0,	loop_2808
	fmovdgu	%xcc,	%f22,	%f31
	subccc	%l4,	0x10DA,	%o2
	tgu	%icc,	0x0
loop_2808:
	stx	%i6,	[%l7 + 0x18]
	add	%i5,	0x06E5,	%l3
	edge8l	%o6,	%o0,	%g3
	movl	%xcc,	%i4,	%o4
	movl	%xcc,	%l5,	%i7
	membar	0x05
	movleu	%icc,	%l2,	%o3
	tgu	%icc,	0x3
	nop
	setx loop_2809, %l0, %l1
	jmpl %l1, %o7
	sub	%g5,	%g4,	%l0
	fpadd16s	%f17,	%f19,	%f21
	subc	%o5,	%l6,	%i2
loop_2809:
	srlx	%l1,	%g2,	%o1
	srl	%g7,	%i3,	%g1
	fmovsle	%xcc,	%f24,	%f29
	andn	%i0,	0x1AD8,	%g6
	ldub	[%l7 + 0x69],	%l4
	fmovdgu	%icc,	%f31,	%f16
	movrlez	%i1,	0x1FD,	%o2
	fbg,a	%fcc3,	loop_2810
	ldstub	[%l7 + 0x1C],	%i6
	fmovrdgez	%i5,	%f8,	%f12
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
loop_2810:
	fbge	%fcc1,	loop_2811
	edge32	%o0,	%l3,	%g3
	movg	%xcc,	%o4,	%i4
	fmovsvc	%xcc,	%f24,	%f3
loop_2811:
	udivx	%l5,	0x0CC2,	%i7
	brlez	%o3,	loop_2812
	st	%f14,	[%l7 + 0x28]
	udivx	%l2,	0x1ADD,	%g5
	bg,a,pt	%icc,	loop_2813
loop_2812:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f21,	%f14
	fcmple16	%f18,	%f30,	%g4
loop_2813:
	nop
	set	0x48, %i0
	stha	%o7,	[%l7 + %i0] 0x04
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%o5,	%f27,	%f18
	nop
	set	0x3C, %i6
	prefetch	[%l7 + %i6],	 0x1
	fpack32	%f12,	%f8,	%f0
	add	%l6,	0x0A67,	%i2
	tpos	%icc,	0x0
	std	%f10,	[%l7 + 0x78]
	mulx	%l1,	0x1996,	%l0
	bcc,a	loop_2814
	nop
	setx	0xF98FD6C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x831123F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f20,	%f2
	stb	%o1,	[%l7 + 0x48]
	fbuge	%fcc3,	loop_2815
loop_2814:
	fmovdl	%xcc,	%f28,	%f9
	edge8n	%g7,	%g2,	%i3
	tpos	%icc,	0x2
loop_2815:
	fors	%f2,	%f20,	%f26
	bcs,a,pn	%icc,	loop_2816
	fba	%fcc1,	loop_2817
	tle	%icc,	0x7
	lduw	[%l7 + 0x2C],	%g1
loop_2816:
	edge32l	%i0,	%g6,	%l4
loop_2817:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o2,	0x1101,	%i1
	sllx	%i5,	0x1B,	%o6
	fbug,a	%fcc1,	loop_2818
	andn	%i6,	0x17FE,	%l3
	edge8l	%o0,	%g3,	%o4
	orcc	%l5,	0x1902,	%i7
loop_2818:
	tpos	%xcc,	0x0
	edge16n	%i4,	%o3,	%l2
	ldd	[%l7 + 0x78],	%g4
	bleu	%xcc,	loop_2819
	tge	%xcc,	0x2
	tg	%icc,	0x2
	andn	%o7,	%o5,	%l6
loop_2819:
	nop
	setx	loop_2820,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsh	[%l7 + 0x32],	%g4
	sdivcc	%i2,	0x120B,	%l1
	mova	%xcc,	%o1,	%g7
loop_2820:
	fpadd16	%f26,	%f18,	%f24
	tneg	%xcc,	0x2
	subc	%g2,	%l0,	%i3
	movneg	%xcc,	%g1,	%g6
	taddcctv	%i0,	0x013C,	%o2
	and	%i1,	0x0D81,	%i5
	fmovse	%xcc,	%f31,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f8,	%f8,	%f8
	bcs,a	loop_2821
	edge8n	%l4,	%i6,	%o6
	nop
	setx	0x6B6EEC0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x32339426,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f28,	%f14
	movrgez	%l3,	%g3,	%o0
loop_2821:
	orcc	%o4,	%l5,	%i4
	fones	%f12
	fmovrde	%o3,	%f30,	%f16
	sub	%i7,	0x0F87,	%l2
	sra	%o7,	0x1A,	%g5
	array16	%l6,	%o5,	%g4
	faligndata	%f22,	%f4,	%f22
	addcc	%l1,	%i2,	%g7
	move	%icc,	%o1,	%g2
	fnor	%f16,	%f8,	%f30
	set	0x46, %i4
	stha	%i3,	[%l7 + %i4] 0xeb
	membar	#Sync
	fandnot2s	%f12,	%f26,	%f22
	xor	%g1,	0x0664,	%g6
	fmovdpos	%xcc,	%f5,	%f21
	andcc	%l0,	0x13F8,	%o2
	smul	%i1,	%i0,	%l4
	movne	%xcc,	%i5,	%i6
	stbar
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x50] %asi,	%f30
	tn	%icc,	0x3
	edge32ln	%l3,	%g3,	%o6
	udivcc	%o0,	0x11C0,	%l5
	nop
	setx	loop_2822,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%i4,	0x02,	%o4
	xorcc	%i7,	0x1014,	%o3
	flush	%l7 + 0x48
loop_2822:
	sdivcc	%o7,	0x1E0F,	%l2
	nop
	setx	0x0572EEB80047635E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	sdiv	%l6,	0x1923,	%g5
	stbar
	fmovdvs	%icc,	%f15,	%f22
	srl	%o5,	0x1E,	%l1
	stbar
	bvs,a	loop_2823
	array32	%i2,	%g4,	%o1
	edge16	%g7,	%i3,	%g2
	move	%xcc,	%g6,	%l0
loop_2823:
	nop
	set	0x70, %g6
	lda	[%l7 + %g6] 0x11,	%f19
	umul	%o2,	0x02DF,	%i1
	fbne	%fcc3,	loop_2824
	taddcc	%i0,	%g1,	%i5
	tgu	%xcc,	0x4
	nop
	fitod	%f6,	%f4
	fdtoi	%f4,	%f6
loop_2824:
	ldd	[%l7 + 0x70],	%l4
	edge16n	%i6,	%g3,	%o6
	umulcc	%o0,	0x0CEC,	%l5
	sdivx	%l3,	0x1F73,	%o4
	edge32	%i4,	%o3,	%i7
	fpadd32s	%f19,	%f30,	%f21
	brgez	%o7,	loop_2825
	stx	%l6,	[%l7 + 0x50]
	edge32n	%g5,	%o5,	%l1
	fmovsle	%icc,	%f30,	%f20
loop_2825:
	fmovdle	%xcc,	%f4,	%f31
	stbar
	tgu	%xcc,	0x0
	ta	%icc,	0x4
	fmovsg	%xcc,	%f23,	%f25
	sethi	0x025F,	%i2
	movre	%g4,	%l2,	%o1
	fmovdneg	%xcc,	%f6,	%f16
	sth	%i3,	[%l7 + 0x38]
	edge32	%g7,	%g6,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l0,	%o2
	and	%i0,	0x1050,	%i1
	edge8n	%i5,	%l4,	%g1
	fors	%f11,	%f3,	%f22
	ldx	[%l7 + 0x68],	%g3
	udivx	%o6,	0x1C96,	%o0
	movleu	%xcc,	%i6,	%l5
	sdiv	%o4,	0x0B15,	%l3
	tvs	%xcc,	0x5
	stx	%i4,	[%l7 + 0x48]
	movrlz	%i7,	%o7,	%l6
	movleu	%icc,	%o3,	%g5
	set	0x08, %o4
	ldswa	[%l7 + %o4] 0x14,	%o5
	edge16l	%l1,	%i2,	%l2
	edge32ln	%g4,	%o1,	%i3
	ldub	[%l7 + 0x30],	%g7
	membar	0x1C
	or	%g2,	0x1C6F,	%g6
	andcc	%o2,	0x11FA,	%i0
	bne,a	%xcc,	loop_2826
	tleu	%xcc,	0x7
	edge8ln	%l0,	%i5,	%i1
	brgez,a	%g1,	loop_2827
loop_2826:
	smul	%l4,	%o6,	%o0
	move	%xcc,	%g3,	%l5
	movpos	%xcc,	%o4,	%l3
loop_2827:
	xorcc	%i6,	0x12D3,	%i7
	fcmple32	%f26,	%f2,	%o7
	subcc	%i4,	0x0DF5,	%o3
	bcs,pn	%icc,	loop_2828
	fbo	%fcc2,	loop_2829
	movrgez	%g5,	%l6,	%o5
	call	loop_2830
loop_2828:
	tneg	%xcc,	0x0
loop_2829:
	movl	%xcc,	%l1,	%l2
	taddcc	%i2,	0x08FA,	%o1
loop_2830:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f7,	[%l7 + 0x24] %asi
	taddcctv	%i3,	0x16C2,	%g7
	fmovscs	%xcc,	%f1,	%f27
	sub	%g2,	%g4,	%g6
	fsrc2s	%f20,	%f23
	wr	%g0,	0x80,	%asi
	stxa	%i0,	[%l7 + 0x60] %asi
	set	0x28, %l5
	stxa	%l0,	[%l7 + %l5] 0x23
	membar	#Sync
	movrgez	%i5,	%o2,	%i1
	set	0x36, %o5
	stba	%g1,	[%l7 + %o5] 0x10
	tge	%icc,	0x1
	set	0x1B, %o2
	ldsba	[%l7 + %o2] 0x89,	%o6
	movvc	%xcc,	%o0,	%g3
	movpos	%xcc,	%l4,	%l5
	edge32	%o4,	%i6,	%i7
	movcs	%xcc,	%l3,	%o7
	fbn	%fcc2,	loop_2831
	movgu	%xcc,	%i4,	%g5
	movg	%xcc,	%l6,	%o5
	alignaddr	%o3,	%l1,	%l2
loop_2831:
	nop
	fitos	%f14,	%f27
	fstoi	%f27,	%f13
	nop
	setx	loop_2832,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%o1,	%i3,	%i2
	tne	%xcc,	0x6
	tvc	%xcc,	0x1
loop_2832:
	sub	%g2,	0x012C,	%g4
	fba,a	%fcc1,	loop_2833
	movle	%xcc,	%g7,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g6,	0x0731,	%l0
loop_2833:
	movn	%icc,	%o2,	%i5
	edge32	%g1,	%o6,	%o0
	movleu	%icc,	%i1,	%l4
	xorcc	%g3,	0x1B6A,	%o4
	andn	%i6,	%l5,	%l3
	tl	%icc,	0x0
	fmul8ulx16	%f26,	%f20,	%f24
	tvc	%xcc,	0x2
	tvc	%xcc,	0x6
	fmovrse	%i7,	%f8,	%f3
	fcmpne16	%f18,	%f16,	%o7
	movle	%xcc,	%g5,	%i4
	sllx	%o5,	0x1E,	%o3
	movvs	%xcc,	%l6,	%l1
	nop
	fitos	%f6,	%f17
	fstoi	%f17,	%f17
	fbl,a	%fcc0,	loop_2834
	tg	%icc,	0x5
	popc	0x01E6,	%l2
	bvs	%xcc,	loop_2835
loop_2834:
	xnor	%i3,	0x0140,	%o1
	movgu	%xcc,	%g2,	%g4
	ld	[%l7 + 0x74],	%f23
loop_2835:
	taddcc	%i2,	%g7,	%g6
	movre	%i0,	0x312,	%l0
	stx	%o2,	[%l7 + 0x58]
	nop
	setx	0x4AA47AB3107E4DC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movrlz	%g1,	%i5,	%o6
	fmovsge	%icc,	%f22,	%f3
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f10
	movrlez	%o0,	%i1,	%g3
	tne	%xcc,	0x0
	tgu	%xcc,	0x5
	tcs	%icc,	0x6
	set	0x6E, %l3
	stha	%l4,	[%l7 + %l3] 0x11
	bg,a	loop_2836
	tg	%xcc,	0x7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%l5
loop_2836:
	bleu,pn	%xcc,	loop_2837
	ta	%xcc,	0x5
	prefetch	[%l7 + 0x3C],	 0x0
	tleu	%icc,	0x4
loop_2837:
	subcc	%o4,	%l3,	%o7
	fnor	%f26,	%f28,	%f10
	array8	%g5,	%i7,	%o5
	movrne	%i4,	%o3,	%l6
	ldub	[%l7 + 0x3E],	%l1
	sth	%l2,	[%l7 + 0x1C]
	add	%o1,	%g2,	%g4
	fnot1s	%f21,	%f11
	movle	%xcc,	%i2,	%g7
	add	%i3,	0x132F,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f0
	bgu,pn	%xcc,	loop_2838
	tn	%xcc,	0x1
	sdivcc	%l0,	0x0D3F,	%i0
	tsubcc	%o2,	0x0CE9,	%g1
loop_2838:
	sdivcc	%o6,	0x13EB,	%i5
	tgu	%xcc,	0x6
	movrne	%i1,	%o0,	%g3
	sll	%i6,	%l4,	%l5
	tcs	%xcc,	0x3
	xnorcc	%l3,	%o4,	%o7
	subcc	%i7,	0x0DBA,	%g5
	fblg	%fcc1,	loop_2839
	tsubcc	%i4,	0x0470,	%o3
	fmovrse	%l6,	%f10,	%f31
	addc	%o5,	%l2,	%l1
loop_2839:
	orncc	%o1,	0x0013,	%g2
	fpmerge	%f7,	%f29,	%f18
	nop
	setx	0x4045437A,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	mova	%icc,	%g4,	%i2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x20] %asi,	%f26
	tg	%icc,	0x3
	nop
	fitod	%f4,	%f30
	fdtoi	%f30,	%f22
	xor	%i3,	0x0990,	%g7
	sir	0x0017
	srl	%l0,	%i0,	%o2
	fpadd16s	%f9,	%f6,	%f31
	bne	%icc,	loop_2840
	edge16ln	%g6,	%o6,	%g1
	bpos,a,pt	%icc,	loop_2841
	st	%f23,	[%l7 + 0x54]
loop_2840:
	fbge,a	%fcc1,	loop_2842
	array32	%i5,	%o0,	%g3
loop_2841:
	fcmpgt16	%f16,	%f20,	%i6
	movvc	%xcc,	%i1,	%l4
loop_2842:
	fnand	%f4,	%f26,	%f0
	edge8	%l5,	%o4,	%o7
	xorcc	%i7,	%g5,	%l3
	xnor	%i4,	%o3,	%o5
	sethi	0x0B4A,	%l6
	std	%f10,	[%l7 + 0x18]
	edge32l	%l1,	%l2,	%g2
	lduh	[%l7 + 0x7C],	%o1
	array32	%i2,	%i3,	%g4
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f14
	fpsub16	%f8,	%f18,	%f14
	addc	%g7,	%l0,	%i0
	tn	%xcc,	0x1
	fmovdne	%xcc,	%f21,	%f4
	sdivx	%o2,	0x0A8F,	%g6
	add	%o6,	0x1EAF,	%i5
	udiv	%g1,	0x1C28,	%o0
	fnot2s	%f19,	%f20
	edge32l	%g3,	%i1,	%i6
	brgz,a	%l5,	loop_2843
	array32	%o4,	%o7,	%i7
	stx	%g5,	[%l7 + 0x28]
	fmovrsgz	%l4,	%f22,	%f5
loop_2843:
	mova	%icc,	%i4,	%o3
	ble,a	%icc,	loop_2844
	movle	%xcc,	%o5,	%l6
	sll	%l3,	0x05,	%l1
	set	0x0C, %g3
	ldsba	[%l7 + %g3] 0x0c,	%g2
loop_2844:
	nop
	set	0x38, %g4
	swapa	[%l7 + %g4] 0x80,	%o1
	ldd	[%l7 + 0x60],	%f24
	brgez	%i2,	loop_2845
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l2,	%g4,	%i3
	mova	%xcc,	%l0,	%g7
loop_2845:
	fone	%f6
	brlez	%o2,	loop_2846
	movcc	%xcc,	%g6,	%i0
	tpos	%xcc,	0x5
	addc	%i5,	%g1,	%o6
loop_2846:
	movrlz	%g3,	0x2FC,	%i1
	tvs	%icc,	0x1
	fmovrsgz	%i6,	%f29,	%f23
	fnegs	%f24,	%f27
	fnot2s	%f26,	%f5
	mulscc	%l5,	0x1268,	%o0
	fmovrdne	%o7,	%f12,	%f22
	edge16ln	%i7,	%g5,	%o4
	srlx	%l4,	0x14,	%o3
	tgu	%xcc,	0x0
	movl	%xcc,	%o5,	%i4
	orncc	%l6,	%l3,	%g2
	udivcc	%l1,	0x18DB,	%o1
	fornot1s	%f7,	%f17,	%f10
	brgz	%l2,	loop_2847
	fmovrdgz	%g4,	%f10,	%f16
	tcc	%icc,	0x1
	tcc	%icc,	0x1
loop_2847:
	fmovrse	%i2,	%f0,	%f12
	ldsb	[%l7 + 0x51],	%i3
	ta	%xcc,	0x5
	tsubcctv	%l0,	0x1031,	%g7
	taddcc	%g6,	0x12AF,	%i0
	orncc	%o2,	%i5,	%g1
	ldsw	[%l7 + 0x50],	%o6
	fblg	%fcc2,	loop_2848
	ldub	[%l7 + 0x22],	%g3
	add	%i6,	0x1739,	%i1
	fmovdge	%xcc,	%f14,	%f7
loop_2848:
	xor	%o0,	%o7,	%l5
	smul	%i7,	0x1DBC,	%o4
	tcc	%icc,	0x4
	fpsub16	%f16,	%f24,	%f0
	movl	%icc,	%g5,	%l4
	movre	%o3,	0x220,	%i4
	bpos,a,pt	%icc,	loop_2849
	bge,a	loop_2850
	fsrc1	%f20,	%f18
	addc	%l6,	0x1537,	%o5
loop_2849:
	edge16	%l3,	%l1,	%o1
loop_2850:
	edge32n	%l2,	%g2,	%i2
	array32	%i3,	%l0,	%g4
	subccc	%g7,	0x19D5,	%g6
	movge	%xcc,	%i0,	%i5
	movneg	%xcc,	%g1,	%o2
	mulscc	%o6,	0x1980,	%i6
	fmovrde	%g3,	%f18,	%f26
	udiv	%o0,	0x0709,	%i1
	fmul8x16al	%f31,	%f26,	%f10
	fbule,a	%fcc0,	loop_2851
	orncc	%o7,	0x0444,	%l5
	orncc	%i7,	0x0C01,	%g5
	bpos,a,pt	%xcc,	loop_2852
loop_2851:
	fmovdvs	%xcc,	%f30,	%f1
	sir	0x09FA
	movrlz	%o4,	%o3,	%i4
loop_2852:
	brz,a	%l4,	loop_2853
	edge16ln	%o5,	%l6,	%l3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x49] %asi,	%l1
loop_2853:
	smul	%o1,	%g2,	%i2
	sdivcc	%l2,	0x089C,	%l0
	smulcc	%i3,	0x0E2C,	%g7
	movcs	%xcc,	%g4,	%i0
	fors	%f4,	%f7,	%f19
	movle	%xcc,	%g6,	%g1
	tpos	%xcc,	0x4
	subcc	%i5,	0x05A4,	%o6
	sethi	0x1775,	%o2
	movleu	%xcc,	%i6,	%o0
	movleu	%xcc,	%i1,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f1,	%f7,	%f6
	movrlez	%l5,	%i7,	%g5
	tg	%icc,	0x6
	nop
	fitod	%f13,	%f12
	edge8	%o4,	%g3,	%i4
	movcs	%icc,	%l4,	%o5
	fmovrdlz	%o3,	%f16,	%f6
	ta	%xcc,	0x0
	nop
	setx	0x5661EEEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB743BCD1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f11,	%f24
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f6
	fmovdneg	%xcc,	%f14,	%f18
	fpack16	%f6,	%f30
	movrlz	%l3,	%l6,	%l1
	be	%xcc,	loop_2854
	membar	0x29
	te	%icc,	0x1
	smul	%o1,	0x0322,	%g2
loop_2854:
	edge16n	%i2,	%l2,	%i3
	brlz,a	%g7,	loop_2855
	movl	%icc,	%g4,	%i0
	bneg,a	loop_2856
	fbue,a	%fcc3,	loop_2857
loop_2855:
	fbl	%fcc1,	loop_2858
	andncc	%l0,	%g1,	%i5
loop_2856:
	udivx	%g6,	0x0696,	%o2
loop_2857:
	sir	0x01BE
loop_2858:
	nop
	wr	%g0,	0x04,	%asi
	stxa	%o6,	[%l7 + 0x28] %asi
	andcc	%i6,	%o0,	%o7
	array8	%i1,	%i7,	%g5
	tgu	%xcc,	0x4
	bpos,a	loop_2859
	fblg	%fcc3,	loop_2860
	fnor	%f2,	%f8,	%f14
	umulcc	%o4,	%g3,	%i4
loop_2859:
	srax	%l4,	0x0F,	%o5
loop_2860:
	edge8	%l5,	%o3,	%l3
	mova	%icc,	%l1,	%l6
	srl	%o1,	0x1A,	%g2
	edge8l	%l2,	%i3,	%i2
	subcc	%g7,	%i0,	%l0
	fmovrslez	%g4,	%f6,	%f12
	move	%xcc,	%g1,	%i5
	udivcc	%o2,	0x1F43,	%g6
	fbl,a	%fcc2,	loop_2861
	edge32ln	%o6,	%o0,	%o7
	bleu,pn	%xcc,	loop_2862
	tle	%xcc,	0x4
loop_2861:
	srl	%i6,	%i7,	%i1
	xor	%o4,	0x1408,	%g3
loop_2862:
	movcc	%icc,	%i4,	%l4
	fmovrslez	%g5,	%f9,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o5,	%o3
	movne	%xcc,	%l5,	%l3
	fbuge,a	%fcc3,	loop_2863
	andn	%l6,	0x1130,	%o1
	xor	%l1,	0x1CF8,	%g2
	addc	%l2,	%i2,	%i3
loop_2863:
	sll	%g7,	%l0,	%i0
	movrgz	%g1,	0x2FD,	%g4
	ta	%icc,	0x6
	brz,a	%i5,	loop_2864
	movne	%icc,	%g6,	%o2
	tsubcc	%o0,	0x11D3,	%o7
	array16	%o6,	%i7,	%i6
loop_2864:
	edge32ln	%i1,	%g3,	%i4
	fpadd16	%f30,	%f6,	%f16
	udiv	%l4,	0x12FB,	%g5
	edge32ln	%o4,	%o3,	%l5
	sllx	%l3,	0x0C,	%o5
	movrlez	%o1,	0x0A1,	%l1
	fmovsle	%xcc,	%f12,	%f22
	fbn,a	%fcc1,	loop_2865
	fmovrslez	%g2,	%f26,	%f20
	edge16	%l6,	%l2,	%i3
	movrne	%g7,	%l0,	%i0
loop_2865:
	tsubcc	%i2,	0x142D,	%g4
	srl	%i5,	%g6,	%g1
	lduh	[%l7 + 0x2E],	%o2
	andn	%o7,	%o6,	%o0
	andn	%i6,	0x1B5F,	%i7
	fmul8x16al	%f16,	%f26,	%f24
	fmovse	%icc,	%f28,	%f21
	movge	%xcc,	%g3,	%i1
	nop
	setx	0x79B24C86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x4657735A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f12,	%f23
	addcc	%l4,	0x18D9,	%i4
	edge32	%o4,	%o3,	%g5
	edge32ln	%l3,	%l5,	%o5
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	alignaddr	%l1,	%g2,	%l6
	fcmpeq32	%f6,	%f12,	%o1
	move	%xcc,	%i3,	%l2
	orn	%l0,	0x01AC,	%i0
	fcmpgt32	%f0,	%f24,	%g7
	fmovsl	%icc,	%f4,	%f10
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x17
	membar	#Sync
	movneg	%icc,	%g4,	%i2
	set	0x1B, %g5
	lduba	[%l7 + %g5] 0x18,	%g6
	fpadd16s	%f13,	%f24,	%f28
	fmovdleu	%icc,	%f3,	%f18
	sethi	0x105E,	%g1
	nop
	setx	loop_2866,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%o2,	0x1367,	%o7
	fbn,a	%fcc3,	loop_2867
	edge16ln	%i5,	%o0,	%i6
loop_2866:
	srlx	%o6,	0x0C,	%i7
	set	0x20, %l1
	stxa	%g3,	[%l7 + %l1] 0x23
	membar	#Sync
loop_2867:
	nop
	fitos	%f9,	%f3
	fstox	%f3,	%f10
	fpsub16s	%f25,	%f21,	%f19
	taddcctv	%i1,	0x07AF,	%l4
	tvc	%icc,	0x4
	fmovdge	%icc,	%f6,	%f16
	stw	%o4,	[%l7 + 0x38]
	edge8l	%i4,	%o3,	%l3
	tvs	%xcc,	0x2
	fpackfix	%f6,	%f15
	movleu	%xcc,	%l5,	%o5
	set	0x4E, %g1
	lduba	[%l7 + %g1] 0x11,	%g5
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f0
	brnz	%g2,	loop_2868
	movl	%icc,	%l1,	%o1
	set	0x1C, %i3
	ldstuba	[%l7 + %i3] 0x04,	%l6
loop_2868:
	bgu,a,pn	%xcc,	loop_2869
	fmovspos	%icc,	%f26,	%f14
	movre	%l2,	%i3,	%i0
	fbl,a	%fcc0,	loop_2870
loop_2869:
	fmovrdne	%l0,	%f22,	%f0
	fbg,a	%fcc3,	loop_2871
	taddcctv	%g4,	0x197F,	%g7
loop_2870:
	fbuge	%fcc0,	loop_2872
	move	%icc,	%i2,	%g1
loop_2871:
	fornot2	%f4,	%f4,	%f0
	tvs	%xcc,	0x3
loop_2872:
	umul	%o2,	%g6,	%o7
	alignaddrl	%o0,	%i5,	%i6
	fbo	%fcc2,	loop_2873
	stw	%i7,	[%l7 + 0x4C]
	fmul8x16au	%f1,	%f6,	%f6
	sdivcc	%g3,	0x1D6E,	%o6
loop_2873:
	fbule,a	%fcc0,	loop_2874
	bleu	loop_2875
	tne	%xcc,	0x1
	tcc	%icc,	0x1
loop_2874:
	fmovsle	%icc,	%f10,	%f18
loop_2875:
	sdivcc	%l4,	0x02E4,	%i1
	orncc	%o4,	0x14C1,	%i4
	nop
	setx	0x80E85F74,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xDACB1848,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f15,	%f24
	sllx	%l3,	0x14,	%l5
	brlz	%o5,	loop_2876
	fnegs	%f27,	%f30
	array32	%o3,	%g2,	%l1
	edge32l	%o1,	%l6,	%l2
loop_2876:
	fmovsvc	%icc,	%f30,	%f17
	umul	%g5,	%i0,	%i3
	fornot2	%f0,	%f20,	%f12
	fsrc1s	%f14,	%f29
	orncc	%g4,	0x0C1C,	%l0
	fpadd32	%f24,	%f0,	%f16
	fmovrse	%g7,	%f15,	%f30
	edge32	%i2,	%o2,	%g1
	smulcc	%o7,	0x1332,	%o0
	movcc	%xcc,	%g6,	%i6
	tcc	%xcc,	0x3
	sth	%i5,	[%l7 + 0x62]
	taddcctv	%g3,	%o6,	%l4
	sdiv	%i7,	0x164C,	%o4
	fabsd	%f0,	%f4
	stx	%i1,	[%l7 + 0x10]
	movg	%icc,	%i4,	%l3
	fmul8ulx16	%f18,	%f20,	%f20
	nop
	setx	0x56F16E5AD581D3F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x29D38255F9BC3228,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f18,	%f18
	fmovrdlz	%l5,	%f16,	%f22
	fmovrdgz	%o5,	%f12,	%f20
	fbo,a	%fcc2,	loop_2877
	fpadd16s	%f24,	%f11,	%f7
	mulscc	%o3,	%l1,	%g2
	xorcc	%l6,	0x0E5B,	%l2
loop_2877:
	umul	%g5,	%i0,	%i3
	tsubcc	%g4,	0x150E,	%o1
	fmovrsne	%g7,	%f10,	%f27
	xnor	%l0,	0x1612,	%o2
	xnorcc	%g1,	0x06A3,	%o7
	set	0x24, %i5
	swapa	[%l7 + %i5] 0x11,	%o0
	fmovspos	%xcc,	%f15,	%f6
	movrgz	%g6,	0x11E,	%i2
	ble,pn	%icc,	loop_2878
	udiv	%i6,	0x1205,	%g3
	fcmpeq32	%f6,	%f24,	%o6
	taddcc	%l4,	%i5,	%i7
loop_2878:
	xnorcc	%o4,	0x1952,	%i4
	mulscc	%l3,	%i1,	%o5
	movge	%xcc,	%l5,	%l1
	movre	%o3,	0x1AE,	%g2
	udiv	%l2,	0x0F5A,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc1,	loop_2879
	mulscc	%i0,	%i3,	%g4
	addccc	%g5,	%g7,	%l0
	udivcc	%o1,	0x19B0,	%g1
loop_2879:
	brlz,a	%o2,	loop_2880
	tn	%xcc,	0x2
	movre	%o0,	%o7,	%i2
	fbue,a	%fcc3,	loop_2881
loop_2880:
	sdivcc	%i6,	0x1690,	%g6
	nop
	setx loop_2882, %l0, %l1
	jmpl %l1, %o6
	movrgz	%l4,	%i5,	%i7
loop_2881:
	nop
	wr	%g0,	0xe3,	%asi
	stba	%o4,	[%l7 + 0x0C] %asi
	membar	#Sync
loop_2882:
	subccc	%i4,	%g3,	%l3
	tneg	%xcc,	0x5
	udiv	%o5,	0x0B21,	%l5
	orcc	%i1,	0x13B3,	%l1
	fmul8x16al	%f15,	%f30,	%f20
	umul	%g2,	0x1050,	%o3
	udiv	%l2,	0x05FE,	%l6
	udiv	%i3,	0x1B91,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i0,	%g5,	%g7
	wr	%g0,	0x04,	%asi
	sta	%f7,	[%l7 + 0x14] %asi
	movgu	%icc,	%o1,	%l0
	fpack16	%f6,	%f9
	sethi	0x0166,	%g1
	nop
	setx	0x98BF75FD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x2A2AD470,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f11,	%f7
	te	%icc,	0x2
	fmovdvs	%xcc,	%f27,	%f31
	tn	%xcc,	0x6
	brz	%o2,	loop_2883
	and	%o0,	%i2,	%i6
	fzero	%f24
	fbg,a	%fcc1,	loop_2884
loop_2883:
	fmovdgu	%xcc,	%f30,	%f21
	nop
	setx	loop_2885,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%xcc,	%g6,	%o6
loop_2884:
	xnor	%o7,	0x0CC6,	%i5
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f14
loop_2885:
	tle	%icc,	0x5
	ldsh	[%l7 + 0x12],	%i7
	tcc	%icc,	0x7
	bg,pn	%xcc,	loop_2886
	array32	%o4,	%i4,	%l4
	tvc	%xcc,	0x2
	fands	%f0,	%f5,	%f22
loop_2886:
	edge16l	%g3,	%l3,	%l5
	movrgz	%i1,	0x353,	%l1
	andncc	%g2,	%o5,	%l2
	fmovrslz	%o3,	%f21,	%f30
	tleu	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x60] %asi,	%i3
	stb	%l6,	[%l7 + 0x2C]
	fbul,a	%fcc2,	loop_2887
	tcc	%xcc,	0x6
	bneg,pn	%xcc,	loop_2888
	fnegs	%f27,	%f28
loop_2887:
	std	%f22,	[%l7 + 0x18]
	movcs	%xcc,	%i0,	%g5
loop_2888:
	umul	%g4,	%o1,	%l0
	movge	%xcc,	%g7,	%o2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x89
	addcc	%g1,	%o0,	%i6
	fnors	%f14,	%f0,	%f30
	set	0x4E, %i2
	ldstuba	[%l7 + %i2] 0x0c,	%g6
	edge16	%o6,	%i2,	%i5
	fmovrdgz	%o7,	%f24,	%f4
	std	%f14,	[%l7 + 0x58]
	stb	%i7,	[%l7 + 0x51]
	fmovsleu	%xcc,	%f4,	%f14
	udivx	%i4,	0x1A22,	%o4
	movrgz	%g3,	0x219,	%l3
	fmul8ulx16	%f22,	%f2,	%f30
	edge32	%l5,	%i1,	%l1
	prefetch	[%l7 + 0x20],	 0x0
	nop
	setx	0x0E22AFDA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xC6BE0CEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f6,	%f29
	bg,a,pt	%icc,	loop_2889
	fbn,a	%fcc3,	loop_2890
	ldx	[%l7 + 0x38],	%l4
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%o5
loop_2889:
	andn	%g2,	0x0061,	%l2
loop_2890:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i3,	%l6,	%i0
	taddcc	%o3,	%g5,	%g4
	fmovrdne	%o1,	%f0,	%f16
	tne	%xcc,	0x5
	tn	%xcc,	0x2
	tpos	%icc,	0x0
	fmovrslez	%g7,	%f0,	%f0
	tcc	%xcc,	0x6
	fandnot1s	%f3,	%f21,	%f27
	udiv	%o2,	0x195A,	%g1
	sdivx	%l0,	0x06EA,	%o0
	orncc	%g6,	%o6,	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i2,	%i5
	orncc	%i7,	%i4,	%o4
	edge32ln	%o7,	%l3,	%l5
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x81,	 0x2
	ldd	[%l7 + 0x50],	%l0
	smulcc	%g3,	%o5,	%g2
	movge	%icc,	%l2,	%l4
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f14
	brgez	%i3,	loop_2891
	edge32ln	%i0,	%l6,	%g5
	movne	%icc,	%o3,	%o1
	addc	%g4,	%o2,	%g7
loop_2891:
	fmovdl	%xcc,	%f0,	%f1
	fmovdl	%xcc,	%f16,	%f26
	tcc	%xcc,	0x3
	fornot2	%f2,	%f2,	%f2
	fzeros	%f13
	fmovdn	%xcc,	%f8,	%f11
	andncc	%g1,	%l0,	%o0
	move	%xcc,	%g6,	%i6
	movrgez	%o6,	%i2,	%i5
	bge,a	%icc,	loop_2892
	edge8l	%i4,	%i7,	%o4
	umulcc	%o7,	%l5,	%l3
	ldsh	[%l7 + 0x34],	%i1
loop_2892:
	edge8l	%g3,	%l1,	%g2
	andncc	%l2,	%o5,	%i3
	prefetch	[%l7 + 0x50],	 0x2
	tleu	%xcc,	0x0
	sdiv	%l4,	0x0723,	%l6
	fmovsvs	%icc,	%f28,	%f1
	movneg	%icc,	%i0,	%o3
	subccc	%g5,	%g4,	%o1
	orn	%o2,	0x0C39,	%g7
	edge32l	%g1,	%l0,	%o0
	andncc	%g6,	%i6,	%o6
	movl	%xcc,	%i2,	%i4
	orncc	%i5,	%i7,	%o7
	sth	%o4,	[%l7 + 0x5C]
	bcc,a,pt	%xcc,	loop_2893
	movrlez	%l5,	0x225,	%i1
	tn	%icc,	0x5
	fbule	%fcc0,	loop_2894
loop_2893:
	fzero	%f8
	alignaddr	%l3,	%g3,	%l1
	movvc	%icc,	%l2,	%g2
loop_2894:
	subcc	%i3,	0x0E8D,	%o5
	ta	%xcc,	0x5
	fandnot2	%f8,	%f4,	%f2
	call	loop_2895
	bvc,a,pt	%icc,	loop_2896
	ldsh	[%l7 + 0x12],	%l6
	movrne	%i0,	%l4,	%o3
loop_2895:
	brnz	%g5,	loop_2897
loop_2896:
	fmovrsne	%g4,	%f17,	%f3
	sdiv	%o1,	0x1F5D,	%o2
	movneg	%xcc,	%g1,	%l0
loop_2897:
	move	%xcc,	%g7,	%g6
	tge	%icc,	0x0
	swap	[%l7 + 0x08],	%i6
	stx	%o6,	[%l7 + 0x18]
	movge	%icc,	%i2,	%i4
	subc	%i5,	%i7,	%o0
	fbo,a	%fcc0,	loop_2898
	add	%o4,	%o7,	%l5
	xnorcc	%i1,	0x1A67,	%l3
	sethi	0x0E69,	%g3
loop_2898:
	movrgez	%l2,	0x3A8,	%g2
	fors	%f29,	%f17,	%f24
	udivcc	%i3,	0x0DD7,	%o5
	tvs	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	sta	%f20,	[%l7 + 0x4C] %asi
	set	0x2A, %l4
	ldsha	[%l7 + %l4] 0x19,	%l1
	fmovsneg	%icc,	%f13,	%f11
	andcc	%l6,	%i0,	%l4
	add	%g5,	%g4,	%o3
	fcmpgt16	%f10,	%f4,	%o2
	fmovsg	%xcc,	%f18,	%f30
	move	%icc,	%g1,	%l0
	movrgz	%g7,	0x058,	%o1
	ldsw	[%l7 + 0x50],	%i6
	mulscc	%g6,	%o6,	%i2
	edge8	%i4,	%i5,	%o0
	fnot1s	%f23,	%f14
	ldd	[%l7 + 0x38],	%o4
	srlx	%i7,	%o7,	%i1
	tsubcc	%l5,	0x157D,	%g3
	orn	%l2,	%g2,	%i3
	movcs	%icc,	%l3,	%l1
	tcs	%icc,	0x0
	call	loop_2899
	stbar
	sdivcc	%l6,	0x165D,	%o5
	fandnot1s	%f29,	%f4,	%f21
loop_2899:
	xor	%l4,	0x188F,	%i0
	andcc	%g4,	%g5,	%o3
	mova	%xcc,	%g1,	%l0
	fba,a	%fcc1,	loop_2900
	xnorcc	%g7,	%o2,	%i6
	add	%o1,	%o6,	%g6
	popc	%i2,	%i4
loop_2900:
	bvc,a	loop_2901
	mulx	%i5,	0x187C,	%o0
	edge16n	%o4,	%i7,	%o7
	smul	%l5,	%g3,	%l2
loop_2901:
	bn,pt	%xcc,	loop_2902
	movrne	%g2,	%i1,	%l3
	umul	%l1,	0x16C3,	%l6
	movvs	%xcc,	%o5,	%l4
loop_2902:
	nop
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x19,	%i3
	fbl,a	%fcc0,	loop_2903
	fblg	%fcc3,	loop_2904
	nop
	setx	0x2ED0BEE5A04EB70A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	xor	%i0,	0x053E,	%g4
loop_2903:
	fmovse	%xcc,	%f30,	%f30
loop_2904:
	add	%o3,	0x0C07,	%g5
	fmovdcc	%xcc,	%f27,	%f24
	fpsub16s	%f22,	%f27,	%f5
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f25
	orncc	%g1,	0x1266,	%l0
	fbue	%fcc1,	loop_2905
	nop
	setx loop_2906, %l0, %l1
	jmpl %l1, %o2
	std	%f10,	[%l7 + 0x20]
	fornot2	%f0,	%f14,	%f24
loop_2905:
	nop
	fitos	%f10,	%f19
	fstox	%f19,	%f18
loop_2906:
	sra	%g7,	%i6,	%o1
	movge	%icc,	%o6,	%g6
	nop
	setx	0xABF859E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xA46ADEE8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f27,	%f8
	fornot1	%f22,	%f10,	%f10
	srax	%i2,	0x19,	%i5
	fbl	%fcc1,	loop_2907
	xorcc	%i4,	0x02E3,	%o0
	movle	%icc,	%o4,	%i7
	lduh	[%l7 + 0x58],	%l5
loop_2907:
	array16	%g3,	%o7,	%g2
	umul	%i1,	%l3,	%l2
	umul	%l6,	%l1,	%l4
	fandnot2s	%f14,	%f21,	%f28
	taddcc	%o5,	0x0488,	%i3
	nop
	setx	0x80BE23541E7A3F23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8CA7402B1B2E1B9F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f20,	%f28
	sdiv	%g4,	0x0EC6,	%i0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x18,	%g5,	%o3
	andcc	%g1,	%o2,	%l0
	tcc	%icc,	0x0
	sir	0x1C78
	and	%g7,	%o1,	%i6
	bvc	%xcc,	loop_2908
	fnor	%f18,	%f20,	%f26
	sdivcc	%o6,	0x005E,	%g6
	fsrc2	%f22,	%f14
loop_2908:
	fzero	%f28
	popc	0x00EF,	%i2
	fmovdpos	%xcc,	%f18,	%f2
	nop
	setx	0xE0342B625B519598,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f4
	nop
	setx	0xA3DF29FA307062F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	xorcc	%i5,	0x1DD7,	%o0
	fmovrse	%i4,	%f12,	%f3
	fmovdle	%icc,	%f22,	%f2
	bneg	%icc,	loop_2909
	umul	%o4,	0x06E8,	%l5
	edge32n	%i7,	%g3,	%o7
	fpack16	%f22,	%f5
loop_2909:
	call	loop_2910
	bneg	%xcc,	loop_2911
	bshuffle	%f2,	%f4,	%f20
	srl	%i1,	%g2,	%l3
loop_2910:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%l2,	[%l7 + 0x34] %asi
loop_2911:
	fnegd	%f8,	%f0
	xorcc	%l1,	0x0B34,	%l4
	movpos	%icc,	%l6,	%o5
	stb	%i3,	[%l7 + 0x60]
	subcc	%g4,	%g5,	%o3
	smul	%g1,	%o2,	%l0
	fbg	%fcc2,	loop_2912
	ldd	[%l7 + 0x28],	%g6
	subccc	%o1,	%i0,	%o6
	bneg	loop_2913
loop_2912:
	edge8ln	%g6,	%i2,	%i6
	nop
	setx	loop_2914,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%o0,	%i5,	%i4
loop_2913:
	subcc	%l5,	0x0D3D,	%i7
	fsrc2s	%f12,	%f16
loop_2914:
	edge8n	%g3,	%o4,	%i1
	flush	%l7 + 0x70
	srl	%g2,	%o7,	%l3
	call	loop_2915
	std	%f20,	[%l7 + 0x58]
	srlx	%l2,	0x0D,	%l1
	fpadd16	%f24,	%f8,	%f20
loop_2915:
	movrgez	%l4,	0x0D1,	%o5
	array32	%l6,	%g4,	%g5
	fpadd16	%f2,	%f14,	%f8
	movcs	%xcc,	%o3,	%i3
	subccc	%o2,	0x1DE6,	%g1
	movpos	%icc,	%l0,	%o1
	fbul,a	%fcc3,	loop_2916
	fmuld8sux16	%f29,	%f28,	%f10
	movcs	%xcc,	%i0,	%g7
	mulx	%g6,	%o6,	%i6
loop_2916:
	tneg	%icc,	0x7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x18,	%o0,	%i5
	edge8	%i2,	%l5,	%i4
	brnz,a	%i7,	loop_2917
	fandnot2s	%f22,	%f2,	%f23
	movrgez	%o4,	%g3,	%i1
	fmovsne	%xcc,	%f25,	%f6
loop_2917:
	orncc	%g2,	0x0E69,	%l3
	sethi	0x112D,	%l2
	fbug	%fcc3,	loop_2918
	fbne,a	%fcc0,	loop_2919
	bgu,pt	%icc,	loop_2920
	tcc	%icc,	0x6
loop_2918:
	nop
	set	0x7F, %g7
	ldsba	[%l7 + %g7] 0x18,	%l1
loop_2919:
	tsubcctv	%l4,	%o5,	%l6
loop_2920:
	sdivx	%g4,	0x0FB1,	%g5
	and	%o3,	%i3,	%o2
	wr	%g0,	0x11,	%asi
	stxa	%o7,	[%l7 + 0x58] %asi
	smul	%g1,	%l0,	%i0
	edge16n	%g7,	%o1,	%o6
	movvs	%xcc,	%g6,	%i6
	sdivx	%i5,	0x0055,	%o0
	edge32l	%l5,	%i4,	%i7
	fmovrslez	%i2,	%f0,	%f3
	xorcc	%o4,	%i1,	%g3
	fmovdcc	%xcc,	%f21,	%f5
	addccc	%l3,	%l2,	%g2
	udivx	%l1,	0x021A,	%o5
	array8	%l4,	%l6,	%g5
	alignaddr	%g4,	%o3,	%o2
	xnorcc	%o7,	0x12AD,	%g1
	xorcc	%i3,	%l0,	%i0
	alignaddr	%g7,	%o6,	%g6
	edge16ln	%i6,	%i5,	%o0
	nop
	setx	0x5554EB27211E4DA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o1,	%i4
	edge8l	%i7,	%i2,	%l5
	tn	%xcc,	0x1
	fmovsneg	%xcc,	%f14,	%f17
	bcc,a,pt	%icc,	loop_2921
	fcmpgt16	%f28,	%f22,	%i1
	ldsw	[%l7 + 0x7C],	%o4
	fble	%fcc3,	loop_2922
loop_2921:
	movpos	%xcc,	%g3,	%l3
	addccc	%g2,	0x15CD,	%l2
	andcc	%l1,	%o5,	%l6
loop_2922:
	fbg	%fcc3,	loop_2923
	xor	%g5,	0x0B0E,	%g4
	and	%o3,	0x15C5,	%o2
	brnz,a	%o7,	loop_2924
loop_2923:
	sll	%g1,	%i3,	%l0
	edge16l	%i0,	%g7,	%o6
	alignaddrl	%g6,	%i6,	%i5
loop_2924:
	nop
	set	0x60, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o0
	sllx	%l4,	0x18,	%o1
	be,a,pt	%xcc,	loop_2925
	sdivcc	%i4,	0x0CBA,	%i7
	fba,a	%fcc3,	loop_2926
	fbne	%fcc2,	loop_2927
loop_2925:
	xnorcc	%i2,	%i1,	%l5
	fble	%fcc1,	loop_2928
loop_2926:
	te	%xcc,	0x3
loop_2927:
	nop
	wr	%g0,	0x5f,	%asi
	stxa	%o4,	[%g0 + 0x0] %asi
loop_2928:
	sir	0x13DC
	alignaddrl	%g3,	%g2,	%l2
	subc	%l1,	0x034C,	%l3
	fmovsg	%xcc,	%f28,	%f24
	sdivcc	%o5,	0x0244,	%l6
	xnor	%g4,	%g5,	%o3
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	alignaddrl	%g1,	%i3,	%l0
	sll	%o7,	%g7,	%i0
	sir	0x0C63
	sdivcc	%g6,	0x1F3A,	%i6
	fpmerge	%f1,	%f10,	%f10
	tne	%xcc,	0x6
	edge32	%i5,	%o0,	%o6
	movrgz	%l4,	%o1,	%i4
	fbg,a	%fcc2,	loop_2929
	xnor	%i2,	%i1,	%i7
	mulx	%o4,	%g3,	%l5
	edge8ln	%l2,	%l1,	%g2
loop_2929:
	movrgz	%l3,	%o5,	%l6
	nop
	fitos	%f0,	%f23
	fstox	%f23,	%f2
	set	0x74, %o3
	lduwa	[%l7 + %o3] 0x89,	%g4
	nop
	setx	0xD1671B0CFB86839F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x29791454E8742E30,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f8,	%f12
	smul	%o3,	0x0E84,	%o2
	movge	%icc,	%g1,	%i3
	edge16ln	%g5,	%o7,	%g7
	ldd	[%l7 + 0x20],	%i0
	fmovde	%xcc,	%f13,	%f10
	fmovdge	%xcc,	%f23,	%f27
	bgu	%xcc,	loop_2930
	subc	%l0,	0x19EA,	%g6
	sllx	%i6,	0x0A,	%i5
	tgu	%xcc,	0x3
loop_2930:
	tsubcctv	%o0,	%o6,	%l4
	fsrc1	%f12,	%f0
	movcc	%icc,	%i4,	%o1
	fbue,a	%fcc3,	loop_2931
	mova	%icc,	%i1,	%i2
	set	0x30, %l2
	lduha	[%l7 + %l2] 0x04,	%i7
loop_2931:
	fxors	%f17,	%f25,	%f25
	fmovdge	%icc,	%f28,	%f22
	and	%g3,	%l5,	%o4
	fmovscc	%xcc,	%f23,	%f26
	fmovde	%xcc,	%f3,	%f10
	edge16n	%l2,	%l1,	%g2
	move	%icc,	%l3,	%l6
	xnorcc	%o5,	%o3,	%g4
	edge8ln	%g1,	%o2,	%g5
	nop
	fitos	%f13,	%f14
	fstox	%f14,	%f30
	udiv	%i3,	0x012E,	%g7
	edge16ln	%o7,	%i0,	%g6
	ta	%icc,	0x1
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x1e
	membar	#Sync
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l0
	bg,a,pn	%xcc,	loop_2932
	ldsh	[%l7 + 0x42],	%i6
	movn	%icc,	%o0,	%i5
	umul	%o6,	0x1469,	%l4
loop_2932:
	fmovdle	%icc,	%f25,	%f18
	fbo,a	%fcc0,	loop_2933
	nop
	setx	0xE3C4929910581C5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fpsub16s	%f2,	%f30,	%f10
	fba	%fcc3,	loop_2934
loop_2933:
	fmovdvs	%icc,	%f26,	%f18
	tge	%icc,	0x1
	brlz	%i4,	loop_2935
loop_2934:
	fmovrdgez	%o1,	%f26,	%f22
	nop
	setx loop_2936, %l0, %l1
	jmpl %l1, %i1
	srl	%i7,	%i2,	%l5
loop_2935:
	sethi	0x1AB6,	%g3
	tge	%icc,	0x5
loop_2936:
	edge8	%l2,	%l1,	%g2
	edge32n	%o4,	%l3,	%l6
	fpadd16s	%f25,	%f4,	%f11
	ld	[%l7 + 0x54],	%f30
	tvc	%icc,	0x0
	fmovdle	%xcc,	%f28,	%f3
	fmovdvc	%icc,	%f31,	%f3
	mulx	%o3,	0x03F5,	%o5
	ldd	[%l7 + 0x60],	%g4
	movge	%icc,	%o2,	%g5
	edge32l	%i3,	%g7,	%o7
	movvs	%icc,	%i0,	%g1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l0,	%g6
	fcmpne16	%f0,	%f30,	%i6
	bg,pt	%xcc,	loop_2937
	sth	%o0,	[%l7 + 0x3C]
	andn	%i5,	%o6,	%l4
	umulcc	%i4,	%i1,	%i7
loop_2937:
	subcc	%i2,	%l5,	%o1
	srl	%l2,	%g3,	%l1
	std	%f6,	[%l7 + 0x60]
	fbg,a	%fcc1,	loop_2938
	nop
	fitos	%f7,	%f17
	fstox	%f17,	%f10
	fxtos	%f10,	%f11
	stb	%o4,	[%l7 + 0x14]
	fba	%fcc2,	loop_2939
loop_2938:
	edge16ln	%g2,	%l3,	%o3
	movrne	%o5,	0x3D1,	%g4
	array32	%l6,	%o2,	%i3
loop_2939:
	fmovse	%xcc,	%f12,	%f6
	sdivx	%g7,	0x115F,	%o7
	srlx	%i0,	%g5,	%l0
	mova	%icc,	%g6,	%i6
	tl	%xcc,	0x2
	and	%g1,	%o0,	%o6
	te	%icc,	0x6
	tg	%xcc,	0x2
	edge32	%i5,	%i4,	%l4
	edge8n	%i1,	%i2,	%l5
	wr	%g0,	0x0c,	%asi
	sta	%f17,	[%l7 + 0x34] %asi
	fnands	%f17,	%f9,	%f12
	fblg,a	%fcc0,	loop_2940
	fcmpne32	%f8,	%f22,	%o1
	edge16ln	%l2,	%i7,	%l1
	fba	%fcc1,	loop_2941
loop_2940:
	xorcc	%o4,	0x1F6A,	%g2
	andcc	%g3,	%l3,	%o3
	tsubcctv	%g4,	%l6,	%o2
loop_2941:
	fandnot1s	%f30,	%f28,	%f3
	movg	%icc,	%i3,	%o5
	fcmpne16	%f18,	%f10,	%o7
	addcc	%i0,	0x0956,	%g5
	edge8l	%l0,	%g7,	%i6
	fblg	%fcc2,	loop_2942
	st	%f14,	[%l7 + 0x08]
	nop
	setx	loop_2943,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16au	%f16,	%f9,	%f22
loop_2942:
	ldsh	[%l7 + 0x68],	%g1
	tgu	%xcc,	0x3
loop_2943:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x30] %asi,	%f6
	set	0x5E, %l6
	ldsha	[%l7 + %l6] 0x89,	%o0
	sdivcc	%g6,	0x1E11,	%i5
	fmovse	%xcc,	%f8,	%f14
	umul	%o6,	0x0EEC,	%i4
	orncc	%i1,	0x03E1,	%i2
	taddcc	%l5,	%o1,	%l4
	ldd	[%l7 + 0x40],	%i6
	fbn	%fcc2,	loop_2944
	edge16	%l1,	%o4,	%l2
	addcc	%g2,	0x00AF,	%l3
	fbl	%fcc0,	loop_2945
loop_2944:
	movneg	%icc,	%g3,	%o3
	sth	%l6,	[%l7 + 0x6A]
	addccc	%o2,	0x1A76,	%i3
loop_2945:
	movneg	%icc,	%o5,	%g4
	movvs	%icc,	%i0,	%o7
	tle	%xcc,	0x4
	te	%xcc,	0x0
	set	0x14, %i6
	ldswa	[%l7 + %i6] 0x81,	%l0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%g6
	fbo,a	%fcc0,	loop_2946
	fsrc2s	%f5,	%f19
	edge32l	%i6,	%g1,	%o0
	andn	%g5,	0x1F2D,	%g6
loop_2946:
	membar	0x6C
	fmovrdgz	%i5,	%f14,	%f30
	fandnot1s	%f24,	%f9,	%f26
	xnorcc	%i4,	0x0754,	%i1
	tn	%xcc,	0x4
	smul	%o6,	%i2,	%o1
	edge16	%l4,	%i7,	%l1
	tne	%icc,	0x1
	edge32l	%o4,	%l2,	%l5
	fbe	%fcc1,	loop_2947
	prefetch	[%l7 + 0x64],	 0x0
	movge	%icc,	%g2,	%l3
	or	%o3,	%l6,	%o2
loop_2947:
	te	%xcc,	0x1
	nop
	setx	loop_2948,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fble	%fcc3,	loop_2949
	taddcctv	%g3,	%i3,	%g4
	fpack32	%f2,	%f8,	%f12
loop_2948:
	fbo,a	%fcc1,	loop_2950
loop_2949:
	add	%o5,	%o7,	%i0
	smulcc	%l0,	%i6,	%g7
	fbule,a	%fcc2,	loop_2951
loop_2950:
	fpsub16	%f26,	%f24,	%f14
	tl	%icc,	0x7
	fmovdcc	%xcc,	%f4,	%f16
loop_2951:
	edge16n	%o0,	%g5,	%g1
	edge32	%i5,	%i4,	%g6
	mulx	%o6,	0x1E53,	%i2
	subccc	%i1,	%l4,	%o1
	sth	%i7,	[%l7 + 0x28]
	edge8n	%l1,	%o4,	%l2
	alignaddr	%l5,	%l3,	%g2
	tcs	%xcc,	0x4
	edge16n	%o3,	%l6,	%g3
	edge8	%i3,	%g4,	%o5
	udiv	%o7,	0x1449,	%i0
	udivcc	%o2,	0x1A44,	%i6
	fbn	%fcc1,	loop_2952
	ta	%icc,	0x6
	ldsb	[%l7 + 0x38],	%l0
	andncc	%g7,	%g5,	%o0
loop_2952:
	array16	%g1,	%i5,	%g6
	array8	%o6,	%i4,	%i1
	tle	%xcc,	0x6
	tleu	%xcc,	0x2
	tvc	%xcc,	0x6
	tneg	%xcc,	0x6
	fbn,a	%fcc3,	loop_2953
	ldd	[%l7 + 0x48],	%l4
	edge32	%i2,	%i7,	%l1
	brgz	%o4,	loop_2954
loop_2953:
	bvc,a	%icc,	loop_2955
	fmovdg	%xcc,	%f18,	%f5
	fsrc2	%f18,	%f16
loop_2954:
	movvs	%xcc,	%l2,	%l5
loop_2955:
	orcc	%l3,	%g2,	%o3
	fblg,a	%fcc3,	loop_2956
	fmovde	%xcc,	%f15,	%f14
	fpadd32s	%f31,	%f5,	%f10
	popc	0x0576,	%o1
loop_2956:
	brnz,a	%l6,	loop_2957
	edge8	%g3,	%i3,	%o5
	tge	%icc,	0x4
	movg	%xcc,	%o7,	%i0
loop_2957:
	fandnot2	%f12,	%f6,	%f24
	addc	%o2,	0x0916,	%g4
	edge16n	%l0,	%g7,	%i6
	edge16n	%o0,	%g5,	%g1
	bn,pt	%icc,	loop_2958
	xor	%i5,	0x09F7,	%o6
	movrgz	%g6,	0x16B,	%i4
	andcc	%i1,	0x025B,	%i2
loop_2958:
	fmovdvs	%icc,	%f2,	%f0
	orn	%i7,	%l4,	%l1
	movn	%icc,	%o4,	%l2
	xnor	%l3,	%g2,	%o3
	fmul8sux16	%f12,	%f18,	%f24
	sllx	%o1,	0x1A,	%l6
	brlz	%g3,	loop_2959
	array8	%i3,	%l5,	%o5
	fmovdne	%icc,	%f1,	%f11
	for	%f14,	%f4,	%f6
loop_2959:
	mova	%icc,	%i0,	%o2
	tsubcctv	%o7,	%g4,	%l0
	movvs	%xcc,	%i6,	%o0
	fandnot2s	%f18,	%f8,	%f4
	fmovse	%icc,	%f19,	%f10
	fpadd32s	%f5,	%f31,	%f2
	movrlez	%g5,	%g7,	%i5
	edge8	%o6,	%g1,	%i4
	movre	%i1,	%i2,	%i7
	bl,a	loop_2960
	tcs	%xcc,	0x2
	bshuffle	%f18,	%f22,	%f12
	movrlez	%l4,	0x186,	%l1
loop_2960:
	fxors	%f18,	%f18,	%f1
	set	0x48, %g6
	ldswa	[%l7 + %g6] 0x0c,	%o4
	stw	%l2,	[%l7 + 0x6C]
	te	%xcc,	0x3
	ta	%xcc,	0x1
	movleu	%icc,	%g6,	%g2
	taddcc	%o3,	%l3,	%o1
	tvc	%xcc,	0x7
	sub	%l6,	0x0BBD,	%i3
	udivcc	%l5,	0x0A53,	%g3
	fornot1s	%f28,	%f0,	%f19
	edge16	%o5,	%i0,	%o2
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f28
	fxtod	%f28,	%f18
	fmovsvc	%icc,	%f0,	%f30
	fcmpgt16	%f18,	%f14,	%o7
	fmovsneg	%xcc,	%f2,	%f8
	fpadd16s	%f14,	%f31,	%f6
	nop
	setx	0x37CD6754F494FE43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x9D5284AAFC1F6C2F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f6,	%f10
	nop
	setx	loop_2961,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%g4,	%l0,	%o0
	edge8l	%g5,	%g7,	%i6
	wr	%g0,	0x52,	%asi
	stxa	%o6,	[%g0 + 0x110] %asi
loop_2961:
	sub	%g1,	%i5,	%i4
	set	0x70, %o4
	stha	%i2,	[%l7 + %o4] 0xe2
	membar	#Sync
	fmovdleu	%icc,	%f8,	%f9
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fbn	%fcc3,	loop_2962
	fmovs	%f21,	%f14
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f12
	fnot2	%f26,	%f28
loop_2962:
	be,a,pn	%xcc,	loop_2963
	fandnot2	%f2,	%f18,	%f30
	movn	%xcc,	%i7,	%l4
	ldsh	[%l7 + 0x7C],	%i1
loop_2963:
	tcs	%icc,	0x0
	fmovsn	%xcc,	%f21,	%f11
	ta	%xcc,	0x2
	bvc,a	loop_2964
	tgu	%icc,	0x2
	andcc	%l1,	0x029A,	%o4
	sra	%l2,	%g6,	%o3
loop_2964:
	nop
	set	0x31, %i4
	ldub	[%l7 + %i4],	%l3
	wr	%g0,	0x52,	%asi
	stxa	%g2,	[%g0 + 0x120] %asi
	udivx	%o1,	0x0DE4,	%l6
	nop
	setx	0x9061FC0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	movneg	%xcc,	%i3,	%l5
	bn,pt	%xcc,	loop_2965
	movn	%icc,	%g3,	%i0
	fble	%fcc2,	loop_2966
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2965:
	fsrc1	%f18,	%f24
	fexpand	%f2,	%f6
loop_2966:
	brgez,a	%o5,	loop_2967
	bne,a,pn	%icc,	loop_2968
	te	%xcc,	0x5
	fnegd	%f12,	%f22
loop_2967:
	fmovdleu	%xcc,	%f31,	%f14
loop_2968:
	fmovdvs	%icc,	%f9,	%f21
	fxnor	%f10,	%f18,	%f20
	orncc	%o2,	0x115E,	%g4
	fmovdleu	%icc,	%f21,	%f7
	movvc	%xcc,	%o7,	%o0
	movneg	%icc,	%g5,	%l0
	srlx	%i6,	0x18,	%o6
	taddcctv	%g7,	0x0D1D,	%g1
	fandnot1s	%f31,	%f12,	%f21
	movgu	%icc,	%i5,	%i2
	fmovrdgz	%i7,	%f10,	%f28
	fcmpeq16	%f12,	%f8,	%i4
	umulcc	%i1,	0x00DC,	%l4
	mova	%icc,	%l1,	%l2
	movrlz	%g6,	0x183,	%o3
	mulx	%o4,	%l3,	%g2
	bcc,a,pt	%xcc,	loop_2969
	ldd	[%l7 + 0x50],	%o0
	edge32n	%l6,	%i3,	%g3
	fmovrsgz	%l5,	%f25,	%f13
loop_2969:
	movle	%xcc,	%i0,	%o2
	tg	%icc,	0x3
	ld	[%l7 + 0x20],	%f22
	addc	%o5,	%o7,	%o0
	orncc	%g5,	%g4,	%i6
	movl	%icc,	%o6,	%l0
	movvc	%xcc,	%g7,	%g1
	fbn	%fcc1,	loop_2970
	fandnot1	%f20,	%f0,	%f2
	fmovrde	%i5,	%f14,	%f20
	movrgz	%i2,	0x096,	%i7
loop_2970:
	fmovrde	%i4,	%f26,	%f24
	fmovse	%icc,	%f24,	%f15
	bn,pt	%icc,	loop_2971
	fmovrsne	%i1,	%f25,	%f8
	lduh	[%l7 + 0x48],	%l4
	ldsw	[%l7 + 0x68],	%l2
loop_2971:
	flush	%l7 + 0x24
	fbn,a	%fcc2,	loop_2972
	st	%f6,	[%l7 + 0x7C]
	bge	loop_2973
	edge16	%g6,	%o3,	%l1
loop_2972:
	movrne	%o4,	0x02D,	%g2
	andcc	%o1,	0x03A5,	%l3
loop_2973:
	subcc	%l6,	%g3,	%i3
	taddcctv	%l5,	0x1307,	%i0
	stbar
	fmul8x16	%f12,	%f2,	%f18
	tle	%icc,	0x4
	membar	0x21
	sethi	0x064D,	%o2
	movneg	%xcc,	%o7,	%o5
	brz	%o0,	loop_2974
	edge8	%g4,	%i6,	%o6
	fabsd	%f24,	%f30
	udivcc	%g5,	0x1F43,	%g7
loop_2974:
	fnegd	%f18,	%f14
	fornot2s	%f20,	%f13,	%f4
	fmovsl	%icc,	%f21,	%f25
	xor	%g1,	%i5,	%i2
	tle	%xcc,	0x0
	movvc	%xcc,	%l0,	%i4
	umul	%i7,	%l4,	%i1
	fpsub32	%f22,	%f24,	%f24
	udivx	%l2,	0x0368,	%o3
	bleu,pt	%icc,	loop_2975
	brnz,a	%l1,	loop_2976
	brz	%o4,	loop_2977
	umulcc	%g6,	%g2,	%o1
loop_2975:
	fcmpeq16	%f10,	%f14,	%l3
loop_2976:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%g3,	%i3
loop_2977:
	fmovsgu	%icc,	%f0,	%f5
	sub	%l6,	%l5,	%i0
	edge32ln	%o7,	%o5,	%o0
	array32	%g4,	%o2,	%i6
	smul	%g5,	%o6,	%g7
	fcmpgt32	%f12,	%f20,	%g1
	fbul	%fcc1,	loop_2978
	sethi	0x08A7,	%i2
	movge	%icc,	%l0,	%i5
	edge16ln	%i7,	%l4,	%i1
loop_2978:
	fsrc1s	%f26,	%f30
	tneg	%xcc,	0x7
	alignaddrl	%i4,	%o3,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o4,	%g6
	bne,pt	%icc,	loop_2979
	bge,a,pt	%icc,	loop_2980
	flush	%l7 + 0x10
	tl	%xcc,	0x6
loop_2979:
	bpos	%icc,	loop_2981
loop_2980:
	udivcc	%g2,	0x059D,	%l1
	tcc	%icc,	0x4
	umulcc	%l3,	%o1,	%g3
loop_2981:
	nop
	set	0x30, %o5
	sth	%i3,	[%l7 + %o5]
	set	0x64, %l5
	lduwa	[%l7 + %l5] 0x14,	%l5
	nop
	setx	0x1BFD4EF3FBE20D14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x260F293074547983,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f10,	%f4
	movle	%icc,	%l6,	%i0
	fpmerge	%f6,	%f21,	%f2
	ldub	[%l7 + 0x35],	%o7
	movrlz	%o0,	%o5,	%g4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i6
	fbn	%fcc0,	loop_2982
	fmovde	%icc,	%f14,	%f22
	subccc	%g5,	%o6,	%g7
	alignaddr	%g1,	%i2,	%i5
loop_2982:
	std	%f30,	[%l7 + 0x50]
	tneg	%icc,	0x4
	movg	%icc,	%i7,	%l0
	popc	0x052E,	%i1
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x20] %asi,	%l4
	fpack32	%f24,	%f12,	%f0
	array8	%o3,	%l2,	%i4
	movvs	%icc,	%g6,	%o4
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sir	0x027D
	tleu	%icc,	0x5
	sir	0x0C48
	alignaddrl	%l1,	%g2,	%l3
	fmovdcc	%xcc,	%f4,	%f18
	fmovrsgz	%o1,	%f21,	%f29
	sll	%g3,	0x0C,	%l5
	ldsb	[%l7 + 0x09],	%l6
	sdivcc	%i3,	0x1E7F,	%o7
	set	0x50, %o2
	swapa	[%l7 + %o2] 0x88,	%i0
	movle	%xcc,	%o0,	%g4
	tl	%icc,	0x0
	addccc	%o5,	0x0ECD,	%i6
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f20
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x11
	subc	%o2,	0x1394,	%o6
	alignaddrl	%g7,	%g1,	%i2
	ble,a,pn	%xcc,	loop_2983
	edge8	%i5,	%i7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x0
loop_2983:
	fmul8sux16	%f8,	%f30,	%f12
	fnot1	%f22,	%f30
	fandnot1	%f16,	%f26,	%f0
	tneg	%xcc,	0x2
	fmovsne	%icc,	%f18,	%f4
	tg	%xcc,	0x3
	srl	%g5,	%l4,	%o3
	fmul8ulx16	%f26,	%f14,	%f12
	fbue,a	%fcc0,	loop_2984
	movgu	%xcc,	%l2,	%i4
	be,a,pn	%xcc,	loop_2985
	prefetch	[%l7 + 0x10],	 0x0
loop_2984:
	taddcc	%g6,	0x17D6,	%o4
	sdivx	%i1,	0x0F0B,	%g2
loop_2985:
	movrgez	%l3,	%o1,	%l1
	ldd	[%l7 + 0x28],	%l4
	wr	%g0,	0x27,	%asi
	stxa	%l6,	[%l7 + 0x10] %asi
	membar	#Sync
	array8	%g3,	%o7,	%i3
	nop
	setx	0xC9ED5E94,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f15
	fmovsne	%icc,	%f4,	%f9
	udiv	%o0,	0x136E,	%g4
	tcs	%xcc,	0x1
	fmovsge	%icc,	%f20,	%f8
	ble,a	loop_2986
	fornot1	%f6,	%f10,	%f22
	call	loop_2987
	movle	%xcc,	%o5,	%i6
loop_2986:
	fxor	%f4,	%f18,	%f4
	tle	%xcc,	0x7
loop_2987:
	movpos	%xcc,	%i0,	%o2
	edge32	%g7,	%g1,	%i2
	orn	%i5,	0x012E,	%i7
	edge8n	%o6,	%g5,	%l0
	nop
	setx	0x637DF29E6E0FE9A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8BA136043F39670D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f20,	%f10
	movl	%xcc,	%o3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i4,	%g6,	%o4
	bcc,a,pt	%xcc,	loop_2988
	movneg	%icc,	%i1,	%l2
	fbo	%fcc2,	loop_2989
	addcc	%l3,	0x073B,	%o1
loop_2988:
	ba,a,pn	%xcc,	loop_2990
	tne	%xcc,	0x4
loop_2989:
	tvs	%xcc,	0x0
	fmovrse	%l1,	%f18,	%f3
loop_2990:
	fcmple16	%f18,	%f0,	%l5
	ldd	[%l7 + 0x20],	%f0
	edge32l	%l6,	%g2,	%g3
	fmovrdlz	%i3,	%f2,	%f4
	fpmerge	%f22,	%f8,	%f2
	edge32n	%o0,	%g4,	%o7
	bcs,pt	%icc,	loop_2991
	fabss	%f5,	%f30
	sll	%o5,	%i6,	%o2
	movl	%icc,	%i0,	%g1
loop_2991:
	call	loop_2992
	popc	%g7,	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%o6
loop_2992:
	bvc,a,pt	%xcc,	loop_2993
	stw	%g5,	[%l7 + 0x74]
	mova	%icc,	%l0,	%o3
	addc	%l4,	%i4,	%i2
loop_2993:
	srlx	%o4,	0x0D,	%i1
	set	0x40, %l3
	ldstuba	[%l7 + %l3] 0x11,	%l2
	tg	%xcc,	0x7
	ldd	[%l7 + 0x30],	%g6
	fcmpne32	%f14,	%f24,	%o1
	fmovrsne	%l3,	%f11,	%f19
	prefetch	[%l7 + 0x24],	 0x3
	udivx	%l5,	0x0D60,	%l6
	srl	%l1,	0x08,	%g2
	fexpand	%f18,	%f2
	xorcc	%g3,	0x1E77,	%o0
	edge8l	%i3,	%g4,	%o5
	bvs	%xcc,	loop_2994
	fbule,a	%fcc3,	loop_2995
	edge8	%i6,	%o2,	%i0
	movgu	%xcc,	%o7,	%g1
loop_2994:
	andcc	%g7,	0x0738,	%i7
loop_2995:
	movrne	%o6,	0x356,	%g5
	ble,pt	%icc,	loop_2996
	fmovrdgez	%l0,	%f30,	%f6
	alignaddrl	%o3,	%l4,	%i4
	addcc	%i5,	0x1BE4,	%i2
loop_2996:
	smul	%i1,	%o4,	%l2
	mulscc	%g6,	%l3,	%l5
	lduh	[%l7 + 0x48],	%l6
	umulcc	%l1,	%o1,	%g3
	srax	%o0,	%i3,	%g4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%o5
	movcs	%icc,	%g2,	%i6
	ldx	[%l7 + 0x30],	%o2
	movgu	%icc,	%i0,	%g1
	sll	%g7,	0x11,	%o7
	prefetch	[%l7 + 0x50],	 0x2
	orncc	%i7,	0x1008,	%g5
	flush	%l7 + 0x74
	fbo,a	%fcc0,	loop_2997
	edge32n	%l0,	%o6,	%o3
	tle	%xcc,	0x7
	fmovdl	%xcc,	%f18,	%f10
loop_2997:
	umul	%l4,	%i5,	%i4
	tpos	%icc,	0x6
	movre	%i2,	0x0A7,	%o4
	ba,pn	%icc,	loop_2998
	edge8l	%l2,	%g6,	%l3
	umulcc	%l5,	0x1CB1,	%i1
	srax	%l6,	0x08,	%o1
loop_2998:
	bn,a,pt	%xcc,	loop_2999
	edge32	%l1,	%g3,	%o0
	tneg	%xcc,	0x5
	ldstub	[%l7 + 0x20],	%i3
loop_2999:
	movcs	%xcc,	%g4,	%g2
	move	%icc,	%i6,	%o2
	wr	%g0,	0x19,	%asi
	stxa	%o5,	[%l7 + 0x50] %asi
	tvs	%xcc,	0x4
	movcs	%icc,	%g1,	%i0
	tsubcctv	%o7,	%g7,	%g5
	srl	%l0,	%i7,	%o6
	edge32l	%l4,	%i5,	%o3
	udiv	%i2,	0x1009,	%i4
	fmovdne	%xcc,	%f27,	%f5
	mulscc	%o4,	0x1FCF,	%g6
	fmovdge	%icc,	%f7,	%f4
	fba,a	%fcc2,	loop_3000
	st	%f3,	[%l7 + 0x34]
	tge	%icc,	0x1
	movpos	%icc,	%l3,	%l2
loop_3000:
	edge16ln	%i1,	%l6,	%l5
	mulscc	%l1,	%g3,	%o1
	tgu	%icc,	0x4
	fbg,a	%fcc3,	loop_3001
	fmovdn	%xcc,	%f20,	%f1
	movre	%i3,	%o0,	%g2
	orcc	%i6,	0x18F2,	%g4
loop_3001:
	orcc	%o5,	%o2,	%g1
	xorcc	%i0,	0x1569,	%g7
	fbn	%fcc1,	loop_3002
	tvc	%xcc,	0x0
	mulscc	%g5,	%o7,	%i7
	subccc	%o6,	0x0E54,	%l4
loop_3002:
	brz	%i5,	loop_3003
	umul	%o3,	0x1679,	%l0
	xnor	%i2,	%i4,	%g6
	ldd	[%l7 + 0x48],	%o4
loop_3003:
	fbuge,a	%fcc3,	loop_3004
	fbne,a	%fcc3,	loop_3005
	edge8ln	%l2,	%i1,	%l6
	bneg,pt	%xcc,	loop_3006
loop_3004:
	bl,a	%xcc,	loop_3007
loop_3005:
	taddcctv	%l5,	%l1,	%g3
	ldsb	[%l7 + 0x1F],	%l3
loop_3006:
	brz	%i3,	loop_3008
loop_3007:
	fcmpgt16	%f12,	%f0,	%o0
	array16	%g2,	%i6,	%g4
	movre	%o5,	0x373,	%o1
loop_3008:
	sir	0x0527
	movcs	%xcc,	%o2,	%g1
	bge,a,pt	%xcc,	loop_3009
	andcc	%i0,	%g7,	%o7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%g5
loop_3009:
	sdiv	%i7,	0x190E,	%l4
	srlx	%i5,	%o6,	%l0
	tneg	%xcc,	0x0
	xnorcc	%i2,	0x1468,	%i4
	xor	%o3,	%g6,	%o4
	fandnot1s	%f24,	%f28,	%f5
	movleu	%icc,	%l2,	%i1
	fbl,a	%fcc0,	loop_3010
	movcc	%icc,	%l6,	%l5
	movrgz	%g3,	0x3F6,	%l1
	fmovscs	%icc,	%f5,	%f20
loop_3010:
	sdivx	%l3,	0x1FB6,	%o0
	tsubcc	%g2,	0x1D27,	%i6
	array32	%i3,	%o5,	%g4
	movre	%o2,	%o1,	%g1
	fnegs	%f0,	%f2
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%g6
	mulscc	%i0,	%o7,	%i7
	set	0x5C, %o1
	sta	%f21,	[%l7 + %o1] 0x89
	movneg	%icc,	%g5,	%i5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	movgu	%icc,	%l4,	%i2
	tle	%icc,	0x5
	be,a	loop_3011
	ta	%xcc,	0x1
	edge16l	%i4,	%o3,	%l0
	nop
	setx	0xB35B6DD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x689A9CCF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f12,	%f27
loop_3011:
	fpmerge	%f12,	%f25,	%f20
	movge	%xcc,	%g6,	%l2
	nop
	fitod	%f4,	%f2
	fdtox	%f2,	%f28
	array32	%i1,	%l6,	%o4
	fmovs	%f6,	%f26
	fmovdpos	%xcc,	%f20,	%f6
	andcc	%l5,	%g3,	%l3
	brgez,a	%o0,	loop_3012
	movrlez	%g2,	%l1,	%i6
	nop
	fitos	%f25,	%f8
	bgu,pn	%icc,	loop_3013
loop_3012:
	sdivcc	%o5,	0x1738,	%g4
	fcmpgt32	%f22,	%f24,	%i3
	umul	%o1,	%g1,	%g7
loop_3013:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x50] %asi,	%f18
	movne	%icc,	%i0,	%o2
	add	%o7,	0x1C00,	%g5
	fmul8x16au	%f13,	%f26,	%f2
	sir	0x0FD2
	nop
	setx	loop_3014,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x6E],	%i7
	tle	%icc,	0x2
	st	%f19,	[%l7 + 0x14]
loop_3014:
	fcmpne32	%f16,	%f10,	%i5
	set	0x42, %g5
	ldstuba	[%l7 + %g5] 0x89,	%l4
	taddcc	%o6,	%i4,	%i2
	fxnor	%f8,	%f10,	%f6
	fcmpgt32	%f26,	%f10,	%l0
	movcc	%xcc,	%o3,	%g6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%i1
	tleu	%xcc,	0x4
	edge32n	%l2,	%o4,	%l6
	subc	%g3,	0x03C0,	%l3
	udivcc	%l5,	0x0109,	%o0
	popc	0x0556,	%g2
	sllx	%i6,	%l1,	%o5
	tsubcc	%i3,	0x1505,	%g4
	edge16l	%o1,	%g7,	%g1
	fbo	%fcc2,	loop_3015
	or	%o2,	0x0D3B,	%i0
	array16	%o7,	%g5,	%i5
	movge	%xcc,	%l4,	%i7
loop_3015:
	movge	%xcc,	%i4,	%i2
	mulx	%o6,	0x14EC,	%o3
	sub	%l0,	0x0C30,	%i1
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5E] %asi,	%g6
	fnors	%f27,	%f6,	%f28
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o4
	tn	%xcc,	0x0
	stbar
	ldub	[%l7 + 0x37],	%l6
	movg	%xcc,	%g3,	%l5
	fmovrdgz	%l3,	%f16,	%f8
	tvs	%icc,	0x5
	movrlz	%o0,	0x3D9,	%i6
	movvs	%icc,	%g2,	%o5
	nop
	setx	loop_3016,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%i3,	0x17D4,	%g4
	smulcc	%o1,	0x146E,	%l1
	edge16ln	%g1,	%g7,	%o2
loop_3016:
	fbug	%fcc2,	loop_3017
	movleu	%xcc,	%o7,	%i0
	mova	%icc,	%i5,	%l4
	srl	%g5,	0x01,	%i7
loop_3017:
	movcc	%icc,	%i4,	%o6
	tvc	%xcc,	0x6
	tge	%xcc,	0x2
	andn	%o3,	0x1608,	%i2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2872
!	Type x   	: 1275
!	Type cti   	: 3017
!	Type f   	: 4394
!	Type i   	: 13442
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xF8CA9310
.word 0x395DD450
.word 0x70296AA4
.word 0x89378632
.word 0x8CB4F329
.word 0x758F427C
.word 0xBD7141E2
.word 0x508F47B2
.word 0xBAF6A313
.word 0x6C67EADE
.word 0xE999CC30
.word 0x20045C77
.word 0x1484324C
.word 0x0A3E6EAB
.word 0x66805619
.word 0xCEFD80AD
.word 0xD3DE0B1E
.word 0x67522A59
.word 0xA2E0DAF6
.word 0xBAA8B8E9
.word 0xD3EA78D1
.word 0x5647B6D3
.word 0x12487382
.word 0xDA77ABC0
.word 0x244CD842
.word 0x2FB8B451
.word 0x97D44ED8
.word 0x505B5C63
.word 0x693C4D28
.word 0xBC2FCE79
.word 0xBC2201CE
.word 0xAA84DEF7
.word 0x737B6623
.word 0x2630C7AD
.word 0xB65C6960
.word 0xCD076B7E
.word 0xE6783424
.word 0xC2129034
.word 0x1C6F2BBA
.word 0x17325DC4
.word 0x4C0FAA7F
.word 0x359AC8C8
.word 0x62B10F62
.word 0xECBA9507
.word 0x2BE298EE
.word 0x66051794
.word 0x435602E3
.word 0x5BEE96CD
.word 0x0D9493DD
.word 0x647F28C3
.word 0xC3D078A9
.word 0x5AB99EC4
.word 0x3DA5D011
.word 0xF75D860D
.word 0x26EF73D6
.word 0xA25B263A
.word 0xA2DCDD15
.word 0x05BF53ED
.word 0x7765AAF9
.word 0xD7B4A145
.word 0x6A31A163
.word 0x0C4FD9F5
.word 0xFC7EF781
.word 0xA18D6A87
.end
