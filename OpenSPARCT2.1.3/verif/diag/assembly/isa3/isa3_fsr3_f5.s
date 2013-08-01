/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f5.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f5.s,v 1.1 2007/05/11 17:22:29 drp Exp $"
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
	setx	0xFD683E72607DDA27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0x2,	%g2
	set	0x4,	%g3
	set	0xB,	%g4
	set	0x3,	%g5
	set	0xB,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x8,	%i1
	set	-0x1,	%i2
	set	-0xE,	%i3
	set	-0xA,	%i4
	set	-0x6,	%i5
	set	-0xE,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x474585A2,	%l0
	set	0x077F998F,	%l1
	set	0x5D321D57,	%l2
	set	0x7C08F5E1,	%l3
	set	0x23A13D6E,	%l4
	set	0x60A48941,	%l5
	set	0x6A5B7B96,	%l6
	!# Output registers
	set	0x06DE,	%o0
	set	0x0B14,	%o1
	set	0x03BE,	%o2
	set	-0x1B96,	%o3
	set	0x1827,	%o4
	set	-0x1200,	%o5
	set	0x138F,	%o6
	set	-0x086A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3851DEBE13A5A6B1)
	INIT_TH_FP_REG(%l7,%f2,0xA69435D96093DABB)
	INIT_TH_FP_REG(%l7,%f4,0x8FC295C7E342EDC4)
	INIT_TH_FP_REG(%l7,%f6,0x04785ED90CD8F5DF)
	INIT_TH_FP_REG(%l7,%f8,0x679FA72FF37A6283)
	INIT_TH_FP_REG(%l7,%f10,0xA1C98B90F17AB423)
	INIT_TH_FP_REG(%l7,%f12,0x78CBDFE1B59DACE0)
	INIT_TH_FP_REG(%l7,%f14,0x646B54B8FF13D737)
	INIT_TH_FP_REG(%l7,%f16,0xF641E67F7F7E2571)
	INIT_TH_FP_REG(%l7,%f18,0x9FC6E7158E4B84CB)
	INIT_TH_FP_REG(%l7,%f20,0xBB05E5A343522B25)
	INIT_TH_FP_REG(%l7,%f22,0x7C914600D3310827)
	INIT_TH_FP_REG(%l7,%f24,0xC0AC7DC5E92C7BC0)
	INIT_TH_FP_REG(%l7,%f26,0x9D3C07F76BABA1FC)
	INIT_TH_FP_REG(%l7,%f28,0xEAA2771AC7B2BFE2)
	INIT_TH_FP_REG(%l7,%f30,0xB2DC77C191A307BC)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0BC, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	sir	0x0B09
	orn	%g1,	%i0,	%g7
	membar	0x2B
	nop
	setx	0x2993E5B4A04FD801,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	nop
	setx	loop_1,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrsgez	%i4,	%f3,	%f6
	popc	%g6,	%o7
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f26
	fxtod	%f26,	%f20
loop_1:
	andcc	%o6,	%o3,	%l0
	nop
	setx	0xBC645C1A7C125735,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xDD9C3AB287B78840,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f30,	%f30
	stw	%l5,	[%l7 + 0x68]
	bneg,a,pt	%icc,	loop_2
	mova	%xcc,	%g4,	%l1
	xor	%g5,	0x1421,	%o2
	subcc	%i1,	%i2,	%l2
loop_2:
	movg	%xcc,	%i7,	%i3
	tcs	%xcc,	0x5
	movcs	%icc,	%o0,	%o5
	movvs	%icc,	%l4,	%i5
	ldd	[%l7 + 0x78],	%f10
	orncc	%o1,	%o4,	%l6
	taddcctv	%g3,	0x143E,	%g2
	call	loop_3
	fbe,a	%fcc0,	loop_4
	edge16n	%i6,	%l3,	%g1
	brlez,a	%g7,	loop_5
loop_3:
	fmovrdlz	%i4,	%f20,	%f4
loop_4:
	brlz	%i0,	loop_6
	fmovsneg	%xcc,	%f30,	%f9
loop_5:
	nop
	fitos	%f30,	%f12
	bneg,pn	%xcc,	loop_7
loop_6:
	fones	%f7
	fbue,a	%fcc2,	loop_8
	fnegs	%f17,	%f17
loop_7:
	edge32l	%o7,	%g6,	%o3
	array8	%l0,	%o6,	%g4
loop_8:
	smul	%l1,	%l5,	%o2
	ba,a	loop_9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f4,	%f6,	%f8
	nop
	setx	0xCF77BCE3D73FC025,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6D31C981F165E13F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f20,	%f24
loop_9:
	array16	%g5,	%i1,	%l2
	edge32ln	%i7,	%i3,	%i2
	fmovrdgez	%o5,	%f30,	%f22
	orncc	%l4,	%i5,	%o0
	nop
	fitod	%f4,	%f18
	fdtos	%f18,	%f19
	orcc	%o4,	0x1C9B,	%o1
	fnot1s	%f1,	%f5
	tle	%icc,	0x0
	smulcc	%g3,	%l6,	%g2
	fbuge,a	%fcc2,	loop_10
	fbul	%fcc0,	loop_11
	fbul,a	%fcc2,	loop_12
	fxor	%f26,	%f2,	%f16
loop_10:
	sll	%i6,	%g1,	%l3
loop_11:
	move	%icc,	%g7,	%i0
loop_12:
	orcc	%o7,	%i4,	%o3
	movneg	%icc,	%l0,	%o6
	stx	%g6,	[%l7 + 0x78]
	tleu	%icc,	0x4
	fpsub32	%f20,	%f18,	%f0
	edge8l	%g4,	%l1,	%o2
	fornot1	%f0,	%f18,	%f14
	sra	%g5,	%l5,	%i1
	array32	%l2,	%i7,	%i2
	fors	%f0,	%f18,	%f12
	fmovsne	%icc,	%f10,	%f27
	tgu	%icc,	0x2
	umul	%o5,	0x0958,	%l4
	movre	%i5,	0x14F,	%o0
	fzero	%f4
	sth	%o4,	[%l7 + 0x26]
	ldstub	[%l7 + 0x2C],	%i3
	prefetch	[%l7 + 0x78],	 0x2
	srlx	%g3,	%l6,	%g2
	tle	%xcc,	0x6
	movpos	%xcc,	%i6,	%o1
	fmovsgu	%icc,	%f12,	%f21
	membar	0x57
	fzeros	%f21
	edge32	%l3,	%g1,	%g7
	mulscc	%o7,	0x01E8,	%i4
	tn	%icc,	0x1
	nop
	setx	0x56BD99F2E76D5868,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xEB919F01D2ED7C8E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f8,	%f22
	fcmpne16	%f28,	%f16,	%i0
	addcc	%l0,	%o6,	%g6
	movrgz	%g4,	%o3,	%o2
	addccc	%g5,	0x1723,	%l1
	tle	%xcc,	0x4
	lduh	[%l7 + 0x66],	%i1
	fnor	%f30,	%f2,	%f28
	edge32l	%l2,	%l5,	%i2
	movge	%xcc,	%i7,	%o5
	movrlez	%i5,	0x10A,	%o0
	stw	%o4,	[%l7 + 0x10]
	fandnot2	%f0,	%f26,	%f10
	fbug	%fcc1,	loop_13
	srl	%l4,	0x04,	%g3
	fmovdvs	%xcc,	%f2,	%f9
	fabsd	%f20,	%f18
loop_13:
	udivcc	%l6,	0x120A,	%g2
	subc	%i3,	%i6,	%o1
	fpsub16s	%f24,	%f18,	%f21
	movcs	%icc,	%l3,	%g1
	tneg	%icc,	0x6
	tn	%xcc,	0x3
	fmovse	%icc,	%f7,	%f14
	fmovs	%f8,	%f14
	move	%icc,	%o7,	%i4
	tcc	%xcc,	0x0
	tgu	%icc,	0x6
	flush	%l7 + 0x68
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x80,	%g6
	nop
	setx	0x6531F28EB9F7E593,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x9A1E3CB79C24488D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f22,	%f14
	tcs	%xcc,	0x2
	smulcc	%l0,	%o6,	%i0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%g6,	%o3
	set	0x74, %i0
	ldswa	[%l7 + %i0] 0x11,	%o2
	fcmpne16	%f4,	%f14,	%g4
	tgu	%xcc,	0x4
	fpadd32s	%f11,	%f24,	%f5
	fmovrde	%l1,	%f6,	%f2
	fmovsn	%xcc,	%f15,	%f4
	movneg	%xcc,	%g5,	%l2
	fmul8x16al	%f25,	%f21,	%f20
	subccc	%i1,	0x0CED,	%i2
	edge8n	%l5,	%i7,	%i5
	bgu,a,pt	%icc,	loop_14
	sdivcc	%o0,	0x0EA0,	%o5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%g3
loop_14:
	addccc	%o4,	0x119F,	%g2
	tvs	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l6
	ldsh	[%l7 + 0x44],	%i6
	alignaddr	%o1,	%i3,	%g1
	bneg,a	loop_15
	taddcc	%l3,	%i4,	%o7
	nop
	setx	loop_16,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%g7,	%l0,	%i0
loop_15:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x10] %asi,	%g6
loop_16:
	movvs	%xcc,	%o6,	%o2
	sllx	%o3,	%l1,	%g5
	stx	%g4,	[%l7 + 0x40]
	ta	%xcc,	0x1
	bshuffle	%f18,	%f28,	%f14
	sdivx	%l2,	0x1635,	%i1
	sllx	%i2,	%l5,	%i7
	set	0x10, %o5
	lda	[%l7 + %o5] 0x80,	%f28
	fbue,a	%fcc3,	loop_17
	nop
	setx	0x783E62F45D3F2BC0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xA37B972CAD1A76CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f28,	%f12
	sllx	%o0,	0x1B,	%i5
	fble,a	%fcc0,	loop_18
loop_17:
	ld	[%l7 + 0x24],	%f1
	bge,pt	%xcc,	loop_19
	srl	%o5,	0x1F,	%g3
loop_18:
	tne	%icc,	0x2
	fmuld8sux16	%f6,	%f11,	%f26
loop_19:
	array16	%o4,	%l4,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc2,	loop_20
	sll	%g2,	%o1,	%i3
	andncc	%i6,	%g1,	%l3
	movcc	%icc,	%o7,	%i4
loop_20:
	addc	%l0,	0x061C,	%g7
	movneg	%icc,	%i0,	%o6
	and	%o2,	%g6,	%l1
	subcc	%o3,	0x1837,	%g5
	nop
	setx	0xB43B79CC5000D1B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f10
	bneg	%xcc,	loop_21
	xor	%g4,	%i1,	%l2
	popc	0x0218,	%i2
	edge32ln	%i7,	%l5,	%i5
loop_21:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f8,	[%l7 + 0x5C] %asi
	fmovdcc	%xcc,	%f20,	%f16
	andcc	%o0,	%g3,	%o5
	movrgz	%o4,	0x18F,	%l4
	bpos	loop_22
	subcc	%g2,	0x02C9,	%o1
	move	%icc,	%l6,	%i6
	set	0x68, %g1
	ldswa	[%l7 + %g1] 0x19,	%i3
loop_22:
	udiv	%l3,	0x13AB,	%o7
	tcs	%icc,	0x2
	xnorcc	%g1,	%l0,	%g7
	srlx	%i0,	%i4,	%o6
	subccc	%g6,	%l1,	%o2
	bvc	loop_23
	orcc	%g5,	0x11C6,	%o3
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf0
	membar	#Sync
loop_23:
	xnor	%g4,	%i1,	%l2
	tvc	%icc,	0x0
	movg	%icc,	%i2,	%i7
	subccc	%i5,	%o0,	%l5
	popc	0x0F20,	%g3
	nop
	setx loop_24, %l0, %l1
	jmpl %l1, %o5
	stx	%l4,	[%l7 + 0x60]
	sth	%g2,	[%l7 + 0x68]
	subcc	%o1,	0x01E5,	%o4
loop_24:
	nop
	set	0x0C, %l0
	lda	[%l7 + %l0] 0x10,	%f14
	te	%xcc,	0x1
	edge8n	%l6,	%i6,	%l3
	fblg,a	%fcc2,	loop_25
	bpos,pt	%xcc,	loop_26
	orcc	%o7,	0x1E28,	%i3
	array32	%g1,	%l0,	%i0
loop_25:
	nop
	set	0x20, %g2
	lduha	[%l7 + %g2] 0x18,	%i4
loop_26:
	sir	0x1598
	bne,pt	%icc,	loop_27
	subc	%o6,	%g7,	%g6
	sir	0x15B6
	fmovdne	%xcc,	%f31,	%f27
loop_27:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%l1
	andncc	%g5,	%o2,	%o3
	membar	0x57
	tsubcc	%g4,	0x05C0,	%l2
	fpsub32s	%f17,	%f11,	%f23
	set	0x54, %o3
	stwa	%i2,	[%l7 + %o3] 0x14
	orncc	%i1,	%i7,	%i5
	fmovsn	%xcc,	%f14,	%f14
	nop
	setx	loop_28,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%l5,	%g3,	%o0
	bgu,a	%xcc,	loop_29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28:
	std	%f0,	[%l7 + 0x50]
	fmovdvc	%xcc,	%f0,	%f28
loop_29:
	movgu	%icc,	%l4,	%o5
	fpadd16	%f12,	%f6,	%f6
	edge8ln	%o1,	%g2,	%l6
	umulcc	%o4,	%i6,	%o7
	tn	%xcc,	0x3
	or	%i3,	%g1,	%l3
	tn	%xcc,	0x6
	ba,a	loop_30
	bleu,a,pt	%xcc,	loop_31
	andncc	%i0,	%l0,	%i4
	udiv	%g7,	0x070D,	%o6
loop_30:
	fble	%fcc2,	loop_32
loop_31:
	or	%g6,	%l1,	%g5
	fblg	%fcc2,	loop_33
	fmovse	%xcc,	%f9,	%f23
loop_32:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o2,	0x181A,	%g4
loop_33:
	srl	%o3,	%i2,	%l2
	ldsh	[%l7 + 0x3A],	%i1
	movleu	%xcc,	%i5,	%l5
	orncc	%i7,	0x0F77,	%o0
	edge32ln	%g3,	%l4,	%o5
	fxnors	%f18,	%f21,	%f25
	movgu	%xcc,	%o1,	%g2
	set	0x79, %o0
	stba	%l6,	[%l7 + %o0] 0x14
	edge32l	%o4,	%i6,	%i3
	fmovdneg	%xcc,	%f25,	%f23
	smulcc	%g1,	0x1369,	%l3
	fbug,a	%fcc0,	loop_34
	orcc	%i0,	%o7,	%i4
	fnors	%f28,	%f20,	%f30
	tgu	%xcc,	0x3
loop_34:
	edge8n	%g7,	%o6,	%g6
	udiv	%l1,	0x05FF,	%g5
	ble,a	loop_35
	tle	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
loop_35:
	brlz,a	%g4,	loop_36
	tne	%icc,	0x1
	fpack16	%f10,	%f5
	fmovsn	%xcc,	%f12,	%f11
loop_36:
	for	%f22,	%f28,	%f0
	fones	%f14
	fors	%f8,	%f17,	%f12
	mulscc	%l0,	%i2,	%o3
	set	0x7F, %l4
	lduba	[%l7 + %l4] 0x19,	%l2
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	lduw	[%l7 + 0x6C],	%i5
	sllx	%i1,	0x00,	%i7
	stbar
	lduh	[%l7 + 0x70],	%o0
	fmovda	%xcc,	%f0,	%f11
	movrgez	%g3,	%l5,	%l4
	fmul8x16al	%f27,	%f6,	%f26
	tl	%icc,	0x0
	ble,a,pn	%xcc,	loop_37
	brgez,a	%o5,	loop_38
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f8
	fxtos	%f8,	%f18
	fandnot1s	%f24,	%f12,	%f4
loop_37:
	tge	%icc,	0x3
loop_38:
	tge	%icc,	0x6
	movvs	%xcc,	%o1,	%l6
	udivx	%o4,	0x1C0B,	%i6
	fmovsa	%xcc,	%f10,	%f10
	tsubcctv	%i3,	0x0B20,	%g2
	fmul8x16al	%f7,	%f22,	%f24
	movn	%xcc,	%g1,	%i0
	edge8ln	%o7,	%l3,	%i4
	tcc	%icc,	0x3
	fmovsvc	%icc,	%f18,	%f12
	tgu	%xcc,	0x7
	sllx	%o6,	%g6,	%g7
	fnot2s	%f23,	%f29
	wr	%g0,	0x23,	%asi
	stha	%g5,	[%l7 + 0x66] %asi
	membar	#Sync
	udiv	%l1,	0x1E44,	%g4
	fmovsa	%icc,	%f30,	%f24
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l0,	%o2
	movn	%icc,	%i2,	%o3
	tge	%icc,	0x4
	xor	%i5,	0x1211,	%i1
	fbo,a	%fcc3,	loop_39
	srl	%i7,	0x05,	%o0
	sir	0x00B8
	tvc	%xcc,	0x0
loop_39:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f31
	brlez,a	%g3,	loop_40
	ta	%icc,	0x7
	movpos	%xcc,	%l2,	%l5
	fmovda	%xcc,	%f27,	%f25
loop_40:
	tsubcc	%o5,	%l4,	%l6
	fbl	%fcc1,	loop_41
	movl	%xcc,	%o1,	%i6
	bpos,a	%xcc,	loop_42
	fmovde	%icc,	%f27,	%f15
loop_41:
	sethi	0x1C6F,	%i3
	xorcc	%o4,	%g1,	%i0
loop_42:
	ldd	[%l7 + 0x48],	%o6
	orn	%g2,	%l3,	%i4
	umul	%g6,	%o6,	%g7
	add	%l1,	%g4,	%l0
	movrne	%g5,	%i2,	%o3
	tg	%icc,	0x6
	prefetch	[%l7 + 0x60],	 0x0
	brlz	%i5,	loop_43
	tn	%icc,	0x2
	and	%o2,	%i1,	%o0
	movn	%xcc,	%i7,	%g3
loop_43:
	and	%l5,	%l2,	%o5
	bpos,a	loop_44
	tvs	%xcc,	0x6
	addcc	%l6,	0x16C7,	%l4
	udivx	%i6,	0x04BB,	%o1
loop_44:
	nop
	setx	0x009422F4DC0412DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x4041FBBC97FA79D5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f0,	%f4
	fbue	%fcc1,	loop_45
	fnot1	%f18,	%f30
	tne	%xcc,	0x2
	fbne,a	%fcc1,	loop_46
loop_45:
	movgu	%icc,	%i3,	%g1
	tgu	%icc,	0x1
	orncc	%i0,	%o7,	%g2
loop_46:
	mulscc	%l3,	%o4,	%g6
	fpadd32	%f20,	%f14,	%f20
	srax	%i4,	0x1D,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l1,	%g4,	%o6
	orncc	%l0,	%g5,	%i2
	udiv	%i5,	0x0540,	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%o0
	sll	%o2,	0x13,	%g3
	fbul	%fcc0,	loop_47
	array16	%l5,	%i7,	%o5
	move	%xcc,	%l6,	%l2
	bne,a,pt	%xcc,	loop_48
loop_47:
	fmovrdne	%i6,	%f30,	%f12
	fmovdg	%xcc,	%f10,	%f12
	fpsub16s	%f14,	%f30,	%f19
loop_48:
	fbe,a	%fcc1,	loop_49
	ld	[%l7 + 0x0C],	%f20
	sth	%l4,	[%l7 + 0x7E]
	sdivcc	%o1,	0x0B55,	%i3
loop_49:
	brlz	%i0,	loop_50
	movge	%icc,	%o7,	%g1
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x10,	%l3
loop_50:
	fbe,a	%fcc1,	loop_51
	tn	%xcc,	0x0
	fmovsleu	%icc,	%f31,	%f18
	move	%xcc,	%o4,	%g6
loop_51:
	bgu,a	%icc,	loop_52
	fmovrdlz	%i4,	%f22,	%f2
	tpos	%xcc,	0x5
	ld	[%l7 + 0x3C],	%f6
loop_52:
	nop
	set	0x34, %i4
	ldsha	[%l7 + %i4] 0x89,	%g2
	fpadd16	%f12,	%f20,	%f12
	tle	%icc,	0x6
	array8	%g7,	%l1,	%o6
	xnorcc	%l0,	0x15AC,	%g5
	fmovdvs	%xcc,	%f16,	%f3
	fpsub32s	%f22,	%f16,	%f19
	sra	%i2,	0x18,	%g4
	edge16n	%i5,	%o3,	%i1
	xnor	%o2,	0x0A0C,	%o0
	bl	loop_53
	edge16	%g3,	%l5,	%o5
	move	%icc,	%i7,	%l2
	udiv	%i6,	0x0D3E,	%l4
loop_53:
	membar	0x38
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f20
	fmovdn	%xcc,	%f26,	%f8
	fmovdg	%xcc,	%f11,	%f22
	fbo	%fcc0,	loop_54
	edge16n	%o1,	%i3,	%l6
	fbu	%fcc3,	loop_55
	bne,a	%xcc,	loop_56
loop_54:
	fmovscc	%xcc,	%f23,	%f28
	mova	%xcc,	%o7,	%i0
loop_55:
	bcs	%icc,	loop_57
loop_56:
	tvc	%xcc,	0x7
	fpadd16	%f14,	%f18,	%f10
	movn	%xcc,	%l3,	%g1
loop_57:
	nop
	set	0x58, %l1
	swapa	[%l7 + %l1] 0x18,	%g6
	fzero	%f28
	subc	%o4,	%g2,	%i4
	tg	%icc,	0x7
	fmovrdlez	%g7,	%f26,	%f8
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o6
	fmovrse	%l0,	%f17,	%f24
	sir	0x1D96
	fmovscc	%xcc,	%f6,	%f29
	udivcc	%g5,	0x097D,	%l1
	movg	%xcc,	%g4,	%i2
	fmul8x16al	%f2,	%f0,	%f10
	orcc	%o3,	%i5,	%o2
	sdiv	%o0,	0x1558,	%i1
	nop
	setx	0x385409F95044905F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	set	0x0A, %i3
	sth	%l5,	[%l7 + %i3]
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x04,	 0x1
	fmovrslez	%i7,	%f17,	%f27
	subcc	%l2,	0x1368,	%i6
	fble,a	%fcc3,	loop_58
	tpos	%xcc,	0x3
	brgz	%g3,	loop_59
	mova	%xcc,	%o1,	%l4
loop_58:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%l6,	[%l7 + 0x22] %asi
loop_59:
	nop
	set	0x3C, %i2
	lduba	[%l7 + %i2] 0x89,	%o7
	movvs	%icc,	%i0,	%l3
	stx	%i3,	[%l7 + 0x78]
	fmovdg	%xcc,	%f8,	%f15
	movgu	%xcc,	%g6,	%g1
	andncc	%o4,	%i4,	%g2
	edge16n	%g7,	%l0,	%o6
	brgez	%l1,	loop_60
	alignaddrl	%g4,	%i2,	%g5
	fbug,a	%fcc2,	loop_61
	fnand	%f26,	%f20,	%f28
loop_60:
	fcmple16	%f22,	%f28,	%i5
	fornot2s	%f2,	%f24,	%f4
loop_61:
	ldd	[%l7 + 0x48],	%f24
	fpadd32	%f8,	%f24,	%f30
	bcs,pn	%icc,	loop_62
	tsubcctv	%o3,	0x1A2F,	%o2
	array16	%o0,	%l5,	%i1
	movgu	%xcc,	%i7,	%o5
loop_62:
	move	%icc,	%l2,	%i6
	umulcc	%o1,	0x1258,	%l4
	sir	0x1FED
	edge8	%l6,	%g3,	%i0
	ldd	[%l7 + 0x08],	%f14
	movl	%xcc,	%o7,	%i3
	movpos	%xcc,	%g6,	%g1
	nop
	setx	0x5303E5A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x9BBB15B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f22,	%f7
	tl	%icc,	0x1
	fbu,a	%fcc2,	loop_63
	fmovd	%f14,	%f4
	brlez	%l3,	loop_64
	call	loop_65
loop_63:
	fmovdgu	%icc,	%f2,	%f19
	edge8	%o4,	%g2,	%i4
loop_64:
	add	%g7,	0x031B,	%l0
loop_65:
	srax	%l1,	0x15,	%o6
	movrgez	%g4,	0x38A,	%g5
	for	%f26,	%f0,	%f20
	sir	0x080F
	fble,a	%fcc0,	loop_66
	movvs	%icc,	%i5,	%o3
	fmovse	%xcc,	%f25,	%f12
	edge32ln	%o2,	%i2,	%l5
loop_66:
	fxor	%f4,	%f18,	%f20
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f30
	array8	%o0,	%i7,	%i1
	fmovsne	%icc,	%f3,	%f30
	movgu	%xcc,	%o5,	%i6
	bg,a,pt	%xcc,	loop_67
	fmul8x16	%f25,	%f0,	%f8
	fmovsvc	%xcc,	%f6,	%f4
	udivx	%o1,	0x0270,	%l2
loop_67:
	bleu,a,pn	%icc,	loop_68
	tn	%icc,	0x2
	srax	%l4,	0x03,	%g3
	fand	%f8,	%f24,	%f30
loop_68:
	movn	%xcc,	%i0,	%l6
	udivcc	%o7,	0x01E6,	%g6
	wr	%g0,	0x80,	%asi
	stha	%i3,	[%l7 + 0x14] %asi
	tne	%icc,	0x5
	tl	%icc,	0x4
	fpackfix	%f24,	%f13
	edge16	%g1,	%l3,	%g2
	ldstub	[%l7 + 0x0F],	%i4
	bne,a,pt	%icc,	loop_69
	sir	0x0783
	stb	%g7,	[%l7 + 0x46]
	movl	%xcc,	%o4,	%l1
loop_69:
	sir	0x119A
	tsubcctv	%o6,	0x1F90,	%l0
	nop
	fitod	%f2,	%f0
	fdtos	%f0,	%f20
	bvs	%icc,	loop_70
	edge32l	%g5,	%i5,	%o3
	fcmple16	%f12,	%f14,	%g4
	tcs	%icc,	0x4
loop_70:
	edge8ln	%o2,	%i2,	%o0
	tsubcc	%i7,	%l5,	%i1
	fnor	%f6,	%f20,	%f18
	sethi	0x1D68,	%i6
	sllx	%o5,	0x16,	%l2
	edge32	%l4,	%o1,	%i0
	sethi	0x1388,	%g3
	sll	%l6,	0x12,	%g6
	ldsb	[%l7 + 0x2B],	%o7
	st	%f1,	[%l7 + 0x14]
	edge8l	%g1,	%i3,	%g2
	movne	%icc,	%l3,	%i4
	set	0x58, %o6
	swapa	[%l7 + %o6] 0x80,	%o4
	edge8l	%g7,	%l1,	%l0
	mulscc	%g5,	0x18EA,	%i5
	te	%xcc,	0x2
	fmovdneg	%icc,	%f26,	%f14
	brgz	%o6,	loop_71
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%xcc,	%f10,	%f18
	fbug	%fcc0,	loop_72
loop_71:
	add	%o3,	0x1A43,	%g4
	brgez	%o2,	loop_73
	nop
	setx	0x1D291F0A478DE94E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5E63F92DA3FDA8C9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f14,	%f30
loop_72:
	sub	%i2,	%i7,	%o0
	tcc	%xcc,	0x2
loop_73:
	alignaddr	%l5,	%i1,	%o5
	fcmple32	%f28,	%f6,	%i6
	nop
	setx	0xEAB8C3FDCE35DE58,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0E32DB04DBD92AC1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f14
	nop
	setx	0x5CE2A41470668DB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	srlx	%l4,	%l2,	%o1
	alignaddr	%g3,	%i0,	%l6
	fexpand	%f24,	%f14
	brz	%o7,	loop_74
	andncc	%g1,	%i3,	%g2
	edge8l	%l3,	%g6,	%i4
	sir	0x02E8
loop_74:
	fzeros	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o4,	%l1,	%g7
	nop
	set	0x74, %o1
	lduh	[%l7 + %o1],	%g5
	edge16l	%l0,	%i5,	%o6
	ldx	[%l7 + 0x10],	%o3
	wr	%g0,	0x81,	%asi
	stwa	%o2,	[%l7 + 0x50] %asi
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsge	%icc,	%f12,	%f19
	smulcc	%i2,	%g4,	%o0
	tgu	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x78] %asi,	%i7
	tpos	%icc,	0x2
	movcs	%icc,	%l5,	%o5
	tsubcc	%i1,	0x1FD1,	%i6
	srlx	%l4,	0x1D,	%l2
	movle	%xcc,	%g3,	%i0
	fpsub32	%f20,	%f2,	%f20
	array16	%o1,	%l6,	%o7
	fcmpne16	%f10,	%f30,	%i3
	nop
	setx	0x117CD2AD88412EE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE56E98082B2D096E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f2,	%f12
	array16	%g2,	%l3,	%g6
	fandnot1	%f24,	%f22,	%f16
	sll	%g1,	0x1B,	%o4
	nop
	setx	0x75AA974CE068E691,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	nop
	setx	0x3D1AE180834C511D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x499AC563FEA06D34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f6,	%f10
	umulcc	%l1,	0x1111,	%g7
	fzero	%f8
	fbule	%fcc3,	loop_75
	smulcc	%i4,	0x0BE8,	%l0
	sllx	%g5,	0x03,	%i5
	sll	%o6,	0x0C,	%o2
loop_75:
	fnands	%f0,	%f31,	%f19
	fbe	%fcc3,	loop_76
	te	%xcc,	0x3
	orncc	%i2,	0x0F62,	%o3
	fbne,a	%fcc0,	loop_77
loop_76:
	fbuge	%fcc1,	loop_78
	fpsub32s	%f19,	%f3,	%f16
	movleu	%xcc,	%o0,	%i7
loop_77:
	andncc	%l5,	%o5,	%g4
loop_78:
	movl	%icc,	%i1,	%i6
	movle	%icc,	%l2,	%g3
	movcs	%xcc,	%l4,	%o1
	edge32ln	%i0,	%l6,	%o7
	movrne	%i3,	%l3,	%g6
	mulx	%g2,	%o4,	%g1
	srlx	%g7,	%i4,	%l1
	smulcc	%g5,	0x01F6,	%i5
	fcmpne32	%f22,	%f26,	%o6
	edge16	%o2,	%l0,	%i2
	sll	%o3,	%o0,	%l5
	ldsb	[%l7 + 0x6C],	%i7
	edge32ln	%g4,	%o5,	%i1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x27,	%i6
	edge32l	%l2,	%g3,	%o1
	edge32ln	%l4,	%l6,	%i0
	nop
	set	0x28, %g4
	ldsw	[%l7 + %g4],	%i3
	srl	%l3,	0x00,	%g6
	fbne,a	%fcc3,	loop_79
	movl	%xcc,	%g2,	%o4
	xnor	%o7,	%g1,	%g7
	taddcctv	%l1,	%g5,	%i4
loop_79:
	prefetch	[%l7 + 0x44],	 0x2
	fzero	%f28
	fpack32	%f8,	%f4,	%f24
	fzero	%f22
	movge	%xcc,	%i5,	%o2
	fbug	%fcc1,	loop_80
	nop
	set	0x38, %g5
	ldsh	[%l7 + %g5],	%l0
	flush	%l7 + 0x14
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
loop_80:
	or	%o3,	0x14B7,	%o6
	orcc	%l5,	0x0402,	%o0
	movrlez	%i7,	%g4,	%o5
	fble	%fcc2,	loop_81
	fmovsa	%xcc,	%f2,	%f30
	or	%i1,	%l2,	%i6
	tleu	%xcc,	0x0
loop_81:
	bge	loop_82
	movrgez	%o1,	%l4,	%l6
	movleu	%xcc,	%i0,	%i3
	set	0x66, %g3
	lduha	[%l7 + %g3] 0x04,	%g3
loop_82:
	mova	%xcc,	%g6,	%l3
	movne	%xcc,	%g2,	%o7
	orcc	%o4,	%g7,	%g1
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f0
	mova	%xcc,	%g5,	%i4
	mova	%icc,	%l1,	%i5
	xnor	%o2,	0x0949,	%i2
	smulcc	%o3,	%l0,	%o6
	fbl	%fcc2,	loop_83
	sra	%o0,	%l5,	%g4
	fmovspos	%xcc,	%f8,	%f12
	tsubcctv	%o5,	0x0C49,	%i7
loop_83:
	sllx	%i1,	%l2,	%i6
	tvc	%icc,	0x0
	movrgz	%l4,	%o1,	%i0
	array8	%i3,	%g3,	%g6
	movrgez	%l3,	%g2,	%o7
	fmovrdgz	%l6,	%f26,	%f24
	fsrc2s	%f19,	%f30
	fpadd16	%f2,	%f24,	%f14
	array8	%g7,	%o4,	%g1
	te	%icc,	0x7
	fandnot1s	%f8,	%f20,	%f5
	tcc	%xcc,	0x4
	lduh	[%l7 + 0x3E],	%g5
	ble	loop_84
	sdivx	%i4,	0x1FD5,	%l1
	edge32	%i5,	%o2,	%o3
	edge32l	%l0,	%o6,	%o0
loop_84:
	ld	[%l7 + 0x3C],	%f10
	fpsub32	%f2,	%f10,	%f26
	umul	%i2,	%l5,	%g4
	mulscc	%o5,	%i7,	%i1
	tvc	%xcc,	0x3
	fbne,a	%fcc2,	loop_85
	edge8	%i6,	%l2,	%l4
	movg	%icc,	%o1,	%i3
	fnot1s	%f9,	%f21
loop_85:
	edge16ln	%g3,	%i0,	%g6
	tge	%xcc,	0x0
	tg	%xcc,	0x4
	edge16l	%g2,	%o7,	%l3
	fble	%fcc3,	loop_86
	subccc	%l6,	0x0650,	%g7
	umul	%g1,	0x1B9C,	%o4
	tleu	%xcc,	0x3
loop_86:
	ldx	[%l7 + 0x48],	%i4
	movne	%icc,	%g5,	%l1
	tn	%icc,	0x3
	edge32ln	%i5,	%o2,	%o3
	nop
	fitos	%f10,	%f28
	udivcc	%l0,	0x0DDE,	%o0
	fmul8x16	%f3,	%f30,	%f30
	mulscc	%i2,	%o6,	%g4
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x10,	%l4
	tcc	%icc,	0x3
	tvc	%xcc,	0x7
	umul	%o5,	%i1,	%i7
	bg,a	loop_87
	edge8	%i6,	%l4,	%o1
	fsrc1	%f18,	%f12
	bne	loop_88
loop_87:
	ldd	[%l7 + 0x10],	%f12
	st	%f4,	[%l7 + 0x60]
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i3
loop_88:
	fbul	%fcc0,	loop_89
	add	%g3,	%i0,	%g6
	brz,a	%l2,	loop_90
	st	%f25,	[%l7 + 0x08]
loop_89:
	nop
	setx	0x362CF8ADA94ED5AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB796C1AEE9A5C353,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f10,	%f24
	lduw	[%l7 + 0x30],	%g2
loop_90:
	orcc	%l3,	0x1A6A,	%l6
	mova	%icc,	%g7,	%o7
	fbo	%fcc2,	loop_91
	movrlez	%g1,	0x35E,	%o4
	brnz,a	%g5,	loop_92
	alignaddr	%l1,	%i5,	%i4
loop_91:
	fmovrslz	%o3,	%f5,	%f4
	movrlez	%o2,	%l0,	%i2
loop_92:
	tvc	%icc,	0x6
	sdiv	%o6,	0x0FD0,	%o0
	tge	%icc,	0x3
	movg	%xcc,	%g4,	%o5
	sir	0x133A
	fmovda	%xcc,	%f4,	%f1
	tneg	%icc,	0x7
	stw	%i1,	[%l7 + 0x6C]
	bg	loop_93
	fbl,a	%fcc1,	loop_94
	move	%xcc,	%i7,	%i6
	fmovscc	%xcc,	%f29,	%f1
loop_93:
	subcc	%l4,	0x0069,	%l5
loop_94:
	st	%f14,	[%l7 + 0x20]
	edge32n	%i3,	%o1,	%i0
	tne	%xcc,	0x7
	sll	%g6,	%g3,	%g2
	brz,a	%l2,	loop_95
	alignaddr	%l6,	%l3,	%o7
	movn	%icc,	%g1,	%o4
	call	loop_96
loop_95:
	fpackfix	%f4,	%f6
	tvc	%xcc,	0x4
	wr	%g0,	0x27,	%asi
	stxa	%g7,	[%l7 + 0x60] %asi
	membar	#Sync
loop_96:
	brnz,a	%g5,	loop_97
	nop
	fitos	%f3,	%f21
	fstox	%f21,	%f8
	fxtos	%f8,	%f18
	tneg	%xcc,	0x5
	ba,a,pn	%xcc,	loop_98
loop_97:
	edge32ln	%i5,	%i4,	%l1
	fmovrdne	%o3,	%f14,	%f2
	srax	%l0,	%i2,	%o2
loop_98:
	xor	%o6,	%g4,	%o0
	fmovdcc	%xcc,	%f26,	%f0
	fpsub16s	%f11,	%f30,	%f23
	st	%f9,	[%l7 + 0x10]
	movcc	%icc,	%o5,	%i1
	and	%i6,	0x13F2,	%l4
	ldstub	[%l7 + 0x2B],	%l5
	tvc	%icc,	0x6
	movge	%xcc,	%i3,	%i7
	subc	%o1,	%g6,	%i0
	edge32l	%g2,	%g3,	%l2
	fpsub16s	%f26,	%f24,	%f14
	wr	%g0,	0xe2,	%asi
	stxa	%l3,	[%l7 + 0x10] %asi
	membar	#Sync
	sllx	%l6,	%g1,	%o4
	brz,a	%o7,	loop_99
	fmovspos	%xcc,	%f23,	%f18
	be,a	loop_100
	movrlz	%g7,	0x010,	%i5
loop_99:
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f2
	alignaddr	%g5,	%l1,	%o3
loop_100:
	array16	%i4,	%i2,	%o2
	nop
	fitos	%f13,	%f4
	pdist	%f6,	%f16,	%f22
	move	%icc,	%o6,	%l0
	fsrc1s	%f16,	%f4
	movpos	%icc,	%o0,	%g4
	ldsw	[%l7 + 0x2C],	%o5
	for	%f14,	%f4,	%f4
	fmovdvs	%icc,	%f14,	%f22
	fcmple32	%f0,	%f30,	%i1
	fcmple16	%f10,	%f28,	%l4
	taddcc	%l5,	0x1AD0,	%i6
	nop
	setx	0x94F70B9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xF886B2F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f8,	%f24
	bshuffle	%f6,	%f26,	%f16
	tleu	%icc,	0x7
	tvc	%xcc,	0x6
	edge32n	%i7,	%i3,	%o1
	bpos,pt	%xcc,	loop_101
	subcc	%i0,	0x06FF,	%g2
	fnot2s	%f16,	%f6
	movcs	%xcc,	%g3,	%l2
loop_101:
	and	%l3,	%g6,	%g1
	addcc	%l6,	%o7,	%g7
	ldstub	[%l7 + 0x29],	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i5,	%l1
	tneg	%icc,	0x6
	tcc	%icc,	0x0
	ta	%xcc,	0x7
	edge32ln	%o3,	%i4,	%g5
	set	0x40, %o4
	swapa	[%l7 + %o4] 0x81,	%i2
	umulcc	%o6,	0x0066,	%l0
	tle	%icc,	0x4
	or	%o0,	0x1808,	%g4
	movcc	%icc,	%o2,	%o5
	array16	%l4,	%i1,	%i6
	edge8	%l5,	%i3,	%o1
	srl	%i0,	%i7,	%g2
	mulscc	%g3,	0x1938,	%l2
	fmovrdlz	%l3,	%f30,	%f4
	sra	%g1,	0x0A,	%l6
	subcc	%g6,	%o7,	%o4
	movvc	%xcc,	%i5,	%g7
	edge32	%o3,	%i4,	%g5
	stw	%l1,	[%l7 + 0x10]
	tneg	%icc,	0x1
	addcc	%i2,	%o6,	%o0
	fmovde	%xcc,	%f19,	%f0
	orcc	%g4,	%l0,	%o2
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x17
	membar	#Sync
	wr	%g0,	0x80,	%asi
	stha	%o5,	[%l7 + 0x7A] %asi
	bvs	loop_102
	bl	%xcc,	loop_103
	ldd	[%l7 + 0x10],	%f4
	subcc	%i1,	0x0A4C,	%i6
loop_102:
	tge	%xcc,	0x6
loop_103:
	fmovs	%f20,	%f17
	bn	%icc,	loop_104
	xorcc	%l5,	%l4,	%i3
	fble	%fcc2,	loop_105
	tge	%icc,	0x5
loop_104:
	edge8l	%o1,	%i0,	%i7
	tg	%xcc,	0x0
loop_105:
	fmovdle	%xcc,	%f19,	%f21
	fba	%fcc1,	loop_106
	tl	%icc,	0x4
	fbule,a	%fcc3,	loop_107
	taddcc	%g3,	0x1D36,	%l2
loop_106:
	movrgez	%l3,	0x01D,	%g2
	fbg,a	%fcc3,	loop_108
loop_107:
	nop
	setx	0xA6ED36F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f27
	popc	0x06B7,	%g1
	fbule	%fcc2,	loop_109
loop_108:
	sllx	%g6,	0x0D,	%o7
	andn	%o4,	0x0D2C,	%l6
	fabsd	%f20,	%f24
loop_109:
	tleu	%xcc,	0x3
	sub	%i5,	%o3,	%g7
	membar	0x27
	fsrc2	%f0,	%f16
	movl	%icc,	%i4,	%l1
	sll	%g5,	%o6,	%o0
	brgez,a	%i2,	loop_110
	orn	%l0,	0x159C,	%o2
	movpos	%xcc,	%g4,	%o5
	fpadd32	%f0,	%f16,	%f28
loop_110:
	movre	%i6,	0x29D,	%i1
	mova	%icc,	%l5,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc0,	loop_111
	nop
	setx	0xFE561A11584C9217,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x81F834507BAB6DCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f0,	%f16
	xorcc	%l4,	0x1233,	%i0
	tgu	%xcc,	0x0
loop_111:
	sllx	%i7,	0x01,	%o1
	fand	%f4,	%f8,	%f6
	fzeros	%f31
	sub	%l2,	0x0415,	%l3
	call	loop_112
	fmovrslez	%g3,	%f18,	%f6
	tge	%xcc,	0x3
	or	%g1,	0x08D6,	%g6
loop_112:
	edge32ln	%o7,	%o4,	%l6
	tsubcctv	%i5,	%g2,	%g7
	fmovsg	%xcc,	%f0,	%f26
	movrlez	%o3,	0x226,	%l1
	edge8n	%g5,	%o6,	%i4
	orncc	%i2,	0x1195,	%l0
	movrgez	%o2,	0x0B1,	%g4
	tcs	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1A] %asi,	%o0
	fcmpne16	%f8,	%f12,	%o5
	fors	%f29,	%f16,	%f12
	edge16	%i6,	%l5,	%i1
	movcs	%xcc,	%i3,	%i0
	edge8l	%i7,	%o1,	%l2
	movrgez	%l4,	0x025,	%l3
	movvc	%xcc,	%g1,	%g6
	fnegs	%f28,	%f15
	xnorcc	%g3,	%o4,	%l6
	brlz	%i5,	loop_113
	movneg	%xcc,	%g2,	%g7
	fmovdge	%xcc,	%f4,	%f1
	fbge	%fcc0,	loop_114
loop_113:
	umulcc	%o7,	0x0D4F,	%l1
	tgu	%icc,	0x0
	fmovsl	%icc,	%f4,	%f7
loop_114:
	movvc	%icc,	%g5,	%o3
	fcmple16	%f16,	%f22,	%o6
	edge8	%i2,	%i4,	%l0
	or	%g4,	%o2,	%o5
	subc	%o0,	%i6,	%i1
	tne	%xcc,	0x5
	ldsb	[%l7 + 0x09],	%i3
	ble	loop_115
	tle	%icc,	0x6
	edge32ln	%i0,	%i7,	%o1
	fmovdvc	%xcc,	%f7,	%f5
loop_115:
	ld	[%l7 + 0x5C],	%f5
	xnor	%l5,	0x0CBD,	%l2
	xorcc	%l4,	0x1E17,	%l3
	orn	%g6,	%g1,	%o4
	fbuge,a	%fcc3,	loop_116
	bcs,pt	%icc,	loop_117
	tvs	%xcc,	0x6
	nop
	setx	loop_118,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_116:
	ta	%icc,	0x2
loop_117:
	array32	%l6,	%g3,	%g2
	edge16n	%g7,	%o7,	%l1
loop_118:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i5,	%g5
	set	0x40, %i5
	lduwa	[%l7 + %i5] 0x89,	%o6
	tcs	%xcc,	0x0
	and	%i2,	%i4,	%l0
	fmovsa	%xcc,	%f21,	%f25
	taddcctv	%g4,	0x074E,	%o2
	subc	%o5,	%o0,	%i6
	fmovsleu	%xcc,	%f13,	%f3
	movcs	%icc,	%i1,	%o3
	movne	%xcc,	%i3,	%i0
	tne	%xcc,	0x5
	nop
	setx loop_119, %l0, %l1
	jmpl %l1, %o1
	ldsw	[%l7 + 0x4C],	%l5
	movvc	%xcc,	%l2,	%i7
	fmovs	%f21,	%f5
loop_119:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x5B] %asi,	%l4
	pdist	%f16,	%f28,	%f14
	movrgez	%g6,	0x124,	%l3
	std	%f6,	[%l7 + 0x20]
	umul	%g1,	0x0539,	%o4
	tl	%xcc,	0x3
	movre	%l6,	%g2,	%g7
	for	%f10,	%f10,	%f12
	array8	%o7,	%g3,	%i5
	sub	%g5,	%o6,	%i2
	fmovd	%f20,	%f14
	fmovdl	%icc,	%f1,	%f9
	fandnot1s	%f4,	%f24,	%f29
	sdivcc	%l1,	0x165F,	%i4
	edge8	%l0,	%g4,	%o5
	nop
	setx loop_120, %l0, %l1
	jmpl %l1, %o2
	taddcc	%i6,	%i1,	%o0
	fbuge,a	%fcc0,	loop_121
	fmovsvs	%icc,	%f28,	%f28
loop_120:
	sdiv	%i3,	0x1C94,	%o3
	sra	%o1,	%l5,	%i0
loop_121:
	alignaddrl	%i7,	%l4,	%l2
	fbn,a	%fcc3,	loop_122
	fmovdcs	%icc,	%f27,	%f16
	flush	%l7 + 0x10
	edge32l	%l3,	%g1,	%g6
loop_122:
	fbue	%fcc1,	loop_123
	nop
	fitos	%f6,	%f2
	fstox	%f2,	%f12
	sdivcc	%o4,	0x1355,	%g2
	fmovdcs	%icc,	%f16,	%f19
loop_123:
	fands	%f12,	%f5,	%f29
	xorcc	%l6,	0x1269,	%g7
	fba	%fcc0,	loop_124
	tvs	%icc,	0x3
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x60] %asi
loop_124:
	addc	%g3,	%i5,	%g5
	smul	%o6,	0x1358,	%i2
	and	%o7,	%l1,	%l0
	mova	%xcc,	%g4,	%i4
	movrlz	%o2,	%i6,	%o5
	andncc	%o0,	%i1,	%i3
	fmovsl	%xcc,	%f22,	%f17
	alignaddrl	%o3,	%o1,	%i0
	edge8l	%l5,	%l4,	%i7
	fpack16	%f2,	%f24
	movleu	%xcc,	%l2,	%g1
	orn	%l3,	0x1E77,	%g6
	addccc	%o4,	%g2,	%l6
	movneg	%xcc,	%g7,	%g3
	udivcc	%i5,	0x1483,	%o6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	movcs	%icc,	%o7,	%l1
	wr	%g0,	0x22,	%asi
	stba	%i2,	[%l7 + 0x55] %asi
	membar	#Sync
	brgz	%g4,	loop_125
	sdivcc	%i4,	0x087A,	%l0
	movg	%xcc,	%o2,	%o5
	fmovsl	%icc,	%f28,	%f28
loop_125:
	bshuffle	%f4,	%f14,	%f20
	bcs,a,pt	%xcc,	loop_126
	nop
	fitos	%f0,	%f10
	fstox	%f10,	%f8
	fmovdne	%xcc,	%f7,	%f2
	movrlez	%i6,	0x0CC,	%o0
loop_126:
	movrlez	%i3,	%i1,	%o3
	xnorcc	%i0,	%l5,	%o1
	udivx	%i7,	0x0926,	%l2
	fpadd16s	%f8,	%f6,	%f14
	fmovrde	%g1,	%f14,	%f0
	fmuld8sux16	%f24,	%f6,	%f18
	tne	%xcc,	0x7
	or	%l4,	0x1730,	%g6
	bn	loop_127
	nop
	setx loop_128, %l0, %l1
	jmpl %l1, %o4
	edge8n	%l3,	%g2,	%g7
	move	%xcc,	%l6,	%g3
loop_127:
	fmovrse	%o6,	%f8,	%f1
loop_128:
	umul	%i5,	0x043D,	%g5
	fcmpne16	%f20,	%f2,	%l1
	bvc,pn	%icc,	loop_129
	tpos	%icc,	0x2
	edge32ln	%i2,	%o7,	%g4
	edge8l	%l0,	%o2,	%i4
loop_129:
	lduw	[%l7 + 0x34],	%i6
	fmovsneg	%icc,	%f5,	%f29
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f20
	fmovdgu	%icc,	%f20,	%f16
	te	%xcc,	0x7
	fpack32	%f12,	%f2,	%f26
	movrgez	%o0,	0x306,	%o5
	srl	%i1,	%i3,	%i0
	udivx	%l5,	0x1AC6,	%o3
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	std	%f16,	[%l7 + 0x08]
	tneg	%xcc,	0x2
	movle	%xcc,	%o1,	%i7
	add	%l2,	0x11B6,	%l4
	lduw	[%l7 + 0x44],	%g1
	alignaddrl	%g6,	%l3,	%g2
	umul	%o4,	0x1720,	%g7
	fnand	%f24,	%f10,	%f0
	addccc	%g3,	%l6,	%o6
	sub	%g5,	%l1,	%i2
	fblg	%fcc0,	loop_130
	fmovsvs	%icc,	%f9,	%f4
	sdivx	%i5,	0x0EEF,	%o7
	movrgz	%g4,	0x24E,	%o2
loop_130:
	te	%icc,	0x7
	fmovd	%f18,	%f30
	brz,a	%i4,	loop_131
	fabss	%f2,	%f20
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x58] %asi,	%l0
loop_131:
	fmovrsne	%o0,	%f5,	%f15
	edge8ln	%i6,	%i1,	%i3
	nop
	setx	0xE2960660D1A3C26D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x79B18A28394C2616,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f24,	%f24
	taddcc	%o5,	0x02B0,	%i0
	edge8ln	%l5,	%o1,	%i7
	umul	%l2,	%l4,	%g1
	mova	%icc,	%g6,	%o3
	bvc	loop_132
	sdivx	%g2,	0x0EDA,	%o4
	fxnors	%f26,	%f5,	%f30
	tgu	%icc,	0x6
loop_132:
	ldsh	[%l7 + 0x20],	%l3
	edge16ln	%g7,	%g3,	%l6
	tneg	%icc,	0x1
	fbge	%fcc0,	loop_133
	orncc	%g5,	%o6,	%l1
	bge,a,pn	%icc,	loop_134
	ta	%xcc,	0x0
loop_133:
	sdivcc	%i2,	0x1F6B,	%i5
	nop
	setx	loop_135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_134:
	and	%o7,	%o2,	%i4
	fpadd16	%f18,	%f0,	%f12
	fcmpgt16	%f2,	%f28,	%g4
loop_135:
	ld	[%l7 + 0x24],	%f10
	movle	%icc,	%l0,	%i6
	edge32l	%i1,	%i3,	%o0
	bneg	%icc,	loop_136
	fsrc2	%f2,	%f16
	movrgz	%o5,	0x210,	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l5,	%i7
loop_136:
	brnz,a	%o1,	loop_137
	movrgz	%l4,	%l2,	%g1
	ldd	[%l7 + 0x50],	%f18
	bvc	%icc,	loop_138
loop_137:
	call	loop_139
	movpos	%icc,	%g6,	%g2
	movleu	%icc,	%o4,	%o3
loop_138:
	fcmpeq32	%f6,	%f26,	%l3
loop_139:
	brz	%g7,	loop_140
	fpsub32s	%f7,	%f7,	%f12
	tg	%xcc,	0x7
	taddcc	%l6,	%g5,	%o6
loop_140:
	fmovdvs	%xcc,	%f25,	%f4
	fmovs	%f16,	%f26
	set	0x54, %i7
	lda	[%l7 + %i7] 0x0c,	%f17
	fandnot2	%f16,	%f6,	%f6
	fmovrslez	%l1,	%f10,	%f12
	tg	%xcc,	0x4
	movvc	%icc,	%i2,	%g3
	srax	%o7,	%i5,	%o2
	tl	%xcc,	0x7
	tleu	%icc,	0x7
	movg	%icc,	%i4,	%g4
	tge	%icc,	0x4
	addc	%l0,	%i1,	%i3
	tleu	%icc,	0x5
	array32	%i6,	%o5,	%o0
	movpos	%xcc,	%i0,	%l5
	tcs	%icc,	0x6
	andcc	%i7,	%l4,	%o1
	nop
	setx	0x68D83B223A309C1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f30
	array8	%l2,	%g6,	%g2
	alignaddr	%g1,	%o3,	%o4
	sdiv	%l3,	0x1CD6,	%g7
	tsubcc	%g5,	0x1224,	%o6
	brlez,a	%l6,	loop_141
	fmovdneg	%icc,	%f12,	%f8
	fbe	%fcc1,	loop_142
	movcc	%icc,	%i2,	%l1
loop_141:
	nop
	set	0x5A, %g7
	sth	%g3,	[%l7 + %g7]
	movcs	%xcc,	%o7,	%i5
loop_142:
	movgu	%xcc,	%i4,	%g4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmul8x16	%f8,	%f0,	%f0
	sir	0x0BD4
	call	loop_143
	fmul8x16al	%f12,	%f24,	%f6
	subccc	%l0,	0x06FF,	%i1
	edge16ln	%o2,	%i3,	%o5
loop_143:
	edge32	%o0,	%i6,	%i0
	movvs	%icc,	%l5,	%l4
	bleu,a,pn	%icc,	loop_144
	fandnot1s	%f10,	%f28,	%f4
	nop
	setx	0xEDDAA48410794616,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tcs	%icc,	0x3
loop_144:
	nop
	fitod	%f30,	%f20
	edge8	%o1,	%i7,	%g6
	sra	%g2,	0x07,	%l2
	array16	%g1,	%o4,	%o3
	addc	%l3,	%g7,	%o6
	fornot2s	%f30,	%f11,	%f21
	orn	%g5,	%l6,	%i2
	tgu	%xcc,	0x3
	tcc	%icc,	0x0
	smul	%l1,	%o7,	%i5
	stbar
	tn	%xcc,	0x0
	umul	%i4,	%g4,	%g3
	fmovsne	%xcc,	%f15,	%f4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i1
	sdiv	%o2,	0x1B45,	%l0
	fpsub32s	%f24,	%f22,	%f6
	movcs	%icc,	%i3,	%o0
	nop
	setx	0x3CE617DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x4D3CE624,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f12,	%f7
	umul	%i6,	%o5,	%i0
	popc	%l5,	%l4
	edge16n	%o1,	%i7,	%g2
	ldsb	[%l7 + 0x51],	%l2
	tvs	%icc,	0x3
	edge16ln	%g1,	%g6,	%o3
	nop
	setx	0x71756648F4D8FF3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x41CF7290F96590BD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f12,	%f2
	fmovsneg	%icc,	%f18,	%f25
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f10
	nop
	setx	0x02B79EFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x366F87A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f5,	%f26
	st	%f15,	[%l7 + 0x08]
	set	0x2C, %l2
	lda	[%l7 + %l2] 0x14,	%f0
	edge32ln	%o4,	%l3,	%o6
	brz	%g7,	loop_145
	orn	%g5,	%i2,	%l6
	fors	%f1,	%f30,	%f16
	fandnot2	%f24,	%f14,	%f16
loop_145:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%l1
	srlx	%i5,	0x19,	%i4
	set	0x0D, %i0
	ldstuba	[%l7 + %i0] 0x0c,	%g4
	movrlez	%g3,	%o7,	%i1
	movrlz	%l0,	%i3,	%o0
	addc	%o2,	0x1EBB,	%o5
	or	%i0,	0x0D4B,	%l5
	set	0x78, %o2
	stwa	%l4,	[%l7 + %o2] 0x23
	membar	#Sync
	fmovdvs	%icc,	%f0,	%f1
	fmovsvc	%xcc,	%f2,	%f11
	subccc	%o1,	0x03F6,	%i7
	nop
	setx loop_146, %l0, %l1
	jmpl %l1, %g2
	fmovdleu	%icc,	%f7,	%f20
	fbuge	%fcc2,	loop_147
	movcs	%xcc,	%l2,	%i6
loop_146:
	edge16n	%g6,	%g1,	%o3
	tsubcctv	%o4,	0x1F80,	%o6
loop_147:
	bcc,a	loop_148
	andcc	%g7,	0x08C5,	%g5
	fand	%f0,	%f8,	%f8
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l3
loop_148:
	orn	%l6,	%l1,	%i5
	sra	%i2,	0x10,	%g4
	fbuge,a	%fcc1,	loop_149
	std	%f16,	[%l7 + 0x68]
	orn	%g3,	0x1240,	%i4
	addc	%i1,	0x02C3,	%o7
loop_149:
	edge32ln	%l0,	%i3,	%o0
	fbul,a	%fcc2,	loop_150
	subc	%o5,	0x1B10,	%o2
	membar	0x6F
	fbe,a	%fcc1,	loop_151
loop_150:
	fmovdpos	%xcc,	%f15,	%f14
	fpsub32	%f4,	%f6,	%f18
	fmovdcc	%icc,	%f4,	%f15
loop_151:
	fbu	%fcc1,	loop_152
	udivcc	%i0,	0x121B,	%l4
	xnor	%l5,	%i7,	%o1
	xorcc	%g2,	%l2,	%i6
loop_152:
	st	%f7,	[%l7 + 0x10]
	movvc	%icc,	%g6,	%g1
	sll	%o4,	%o6,	%o3
	nop
	setx loop_153, %l0, %l1
	jmpl %l1, %g7
	movpos	%xcc,	%l3,	%g5
	andn	%l6,	0x1E1A,	%l1
	movleu	%icc,	%i5,	%i2
loop_153:
	nop
	set	0x0B, %o5
	ldsba	[%l7 + %o5] 0x14,	%g4
	tvs	%xcc,	0x5
	edge16n	%i4,	%g3,	%o7
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	fxnor	%f28,	%f4,	%f22
	ldsw	[%l7 + 0x44],	%i3
	taddcctv	%l0,	0x0606,	%o0
	mulscc	%o5,	0x0AE9,	%o2
	srlx	%i0,	%l4,	%i7
	fmovdge	%icc,	%f10,	%f11
	movrlz	%o1,	0x135,	%g2
	lduw	[%l7 + 0x58],	%l2
	brlez	%i6,	loop_154
	array8	%g6,	%l5,	%g1
	edge32n	%o6,	%o4,	%g7
	fabsd	%f2,	%f8
loop_154:
	bgu,a,pn	%xcc,	loop_155
	fnot2	%f24,	%f0
	movvs	%xcc,	%l3,	%g5
	addc	%l6,	%l1,	%i5
loop_155:
	fmovdneg	%xcc,	%f30,	%f8
	smul	%i2,	0x0E62,	%o3
	fmovdcs	%xcc,	%f29,	%f15
	array16	%g4,	%i4,	%g3
	fpsub16	%f10,	%f24,	%f14
	array8	%i1,	%o7,	%l0
	tsubcctv	%o0,	0x1ADB,	%i3
	fornot2s	%f25,	%f28,	%f9
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x18
	fmovrdgz	%o5,	%f0,	%f0
	edge16ln	%i0,	%o2,	%i7
	orn	%l4,	0x1043,	%g2
	set	0x6C, %g6
	lduwa	[%l7 + %g6] 0x04,	%o1
	sdiv	%i6,	0x16F6,	%g6
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x14,	 0x0
	bpos,pn	%icc,	loop_156
	faligndata	%f6,	%f20,	%f28
	movneg	%xcc,	%l5,	%g1
	fnot1	%f20,	%f28
loop_156:
	tl	%xcc,	0x1
	fmovrslez	%o6,	%f23,	%f26
	nop
	setx	0xCCB14432,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f3
	fmovdneg	%xcc,	%f23,	%f22
	movg	%xcc,	%g7,	%o4
	tsubcc	%g5,	%l6,	%l1
	tne	%icc,	0x3
	mulx	%i5,	0x081F,	%i2
	edge16ln	%l3,	%o3,	%i4
	fbule,a	%fcc0,	loop_157
	fmovrdgez	%g3,	%f24,	%f8
	nop
	setx	loop_158,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	0x1FAB,	%g4
loop_157:
	prefetch	[%l7 + 0x28],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_158:
	nop
	set	0x74, %g2
	lda	[%l7 + %g2] 0x14,	%f6
	edge32n	%o7,	%l0,	%i1
	movgu	%icc,	%i3,	%o5
	edge16	%o0,	%o2,	%i7
	ldsw	[%l7 + 0x58],	%i0
	flush	%l7 + 0x0C
	brgez,a	%l4,	loop_159
	andcc	%g2,	0x1204,	%i6
	fbo	%fcc2,	loop_160
	movrgez	%g6,	0x15A,	%l2
loop_159:
	bshuffle	%f24,	%f0,	%f16
	andncc	%l5,	%g1,	%o6
loop_160:
	fcmpne32	%f14,	%f16,	%g7
	xnor	%o1,	0x1A79,	%g5
	fbuge,a	%fcc2,	loop_161
	fbule	%fcc0,	loop_162
	fmovdg	%icc,	%f26,	%f0
	tvc	%xcc,	0x2
loop_161:
	tsubcc	%o4,	0x0D28,	%l1
loop_162:
	fcmpgt32	%f26,	%f0,	%i5
	orncc	%i2,	%l3,	%o3
	movpos	%xcc,	%l6,	%g3
	wr	%g0,	0xe3,	%asi
	stba	%g4,	[%l7 + 0x46] %asi
	membar	#Sync
	bleu,pn	%xcc,	loop_163
	edge8n	%i4,	%o7,	%l0
	addc	%i3,	0x0CA5,	%i1
	bcc,a,pt	%icc,	loop_164
loop_163:
	edge8ln	%o5,	%o2,	%i7
	tsubcctv	%i0,	0x0AF6,	%l4
	udiv	%g2,	0x0A47,	%i6
loop_164:
	sra	%g6,	%o0,	%l5
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldsb	[%l7 + 0x0E],	%g1
	srlx	%l2,	0x0F,	%o6
	membar	0x6C
	fnegs	%f2,	%f27
	sub	%o1,	%g5,	%o4
	fmovdpos	%xcc,	%f21,	%f27
	umul	%g7,	%i5,	%i2
	set	0x54, %o3
	ldsha	[%l7 + %o3] 0x10,	%l3
	fmovrsgz	%l1,	%f22,	%f28
	movl	%icc,	%o3,	%g3
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f12
	fmovse	%xcc,	%f1,	%f21
	subccc	%l6,	%g4,	%o7
	nop
	setx	0x504DFF36,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	tpos	%xcc,	0x3
	fmovsle	%icc,	%f21,	%f19
	fnor	%f20,	%f28,	%f22
	andcc	%l0,	%i4,	%i3
	umulcc	%i1,	%o5,	%i7
	ldsh	[%l7 + 0x12],	%i0
	ble,a	loop_165
	edge8ln	%o2,	%g2,	%l4
	sdiv	%g6,	0x198B,	%o0
	fbe	%fcc0,	loop_166
loop_165:
	sra	%i6,	%g1,	%l2
	fmovsl	%icc,	%f13,	%f25
	fbuge	%fcc2,	loop_167
loop_166:
	fmovrdgez	%o6,	%f22,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f14,	%f3
loop_167:
	movle	%icc,	%l5,	%o1
	move	%icc,	%g5,	%g7
	fmovs	%f25,	%f13
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x26] %asi,	%i5
	fsrc2s	%f8,	%f17
	movcs	%icc,	%o4,	%i2
	call	loop_168
	subc	%l1,	0x0616,	%l3
	array32	%o3,	%l6,	%g3
	tleu	%xcc,	0x2
loop_168:
	tle	%icc,	0x1
	sra	%g4,	%o7,	%i4
	udiv	%l0,	0x1C87,	%i1
	fnand	%f0,	%f26,	%f22
	alignaddr	%i3,	%o5,	%i7
	tle	%xcc,	0x6
	tge	%icc,	0x3
	nop
	fitos	%f11,	%f3
	fstox	%f3,	%f12
	fxtos	%f12,	%f5
	popc	%i0,	%o2
	movcc	%icc,	%l4,	%g2
	movn	%xcc,	%o0,	%i6
	fnegd	%f24,	%f24
	bne	loop_169
	sll	%g6,	0x17,	%l2
	bge,pn	%xcc,	loop_170
	addc	%g1,	0x0B6C,	%l5
loop_169:
	add	%o6,	0x0FED,	%g5
	andcc	%o1,	%g7,	%o4
loop_170:
	fxors	%f21,	%f9,	%f29
	ldstub	[%l7 + 0x7B],	%i5
	tvs	%xcc,	0x1
	nop
	setx	0x8DC05506,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x83A5079E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f21,	%f20
	mulx	%l1,	0x10DB,	%i2
	fmovdle	%icc,	%f26,	%f26
	orncc	%l3,	%l6,	%g3
	bn,pt	%icc,	loop_171
	fmovdle	%xcc,	%f1,	%f23
	movneg	%xcc,	%g4,	%o7
	fmul8x16au	%f28,	%f17,	%f28
loop_171:
	pdist	%f2,	%f18,	%f8
	movcs	%xcc,	%o3,	%i4
	array8	%l0,	%i1,	%o5
	fbl,a	%fcc2,	loop_172
	bge,a	%icc,	loop_173
	movpos	%xcc,	%i3,	%i0
	sub	%o2,	%l4,	%g2
loop_172:
	edge32n	%o0,	%i7,	%g6
loop_173:
	fbl,a	%fcc0,	loop_174
	subcc	%i6,	%l2,	%l5
	stw	%o6,	[%l7 + 0x30]
	fcmpeq16	%f16,	%f2,	%g1
loop_174:
	bl	%icc,	loop_175
	umulcc	%g5,	%o1,	%o4
	sdivx	%i5,	0x0885,	%g7
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f26
loop_175:
	movrlez	%l1,	%l3,	%l6
	set	0x40, %i6
	sta	%f21,	[%l7 + %i6] 0x80
	fabsd	%f22,	%f2
	addc	%g3,	%i2,	%g4
	bne,pn	%icc,	loop_176
	edge8l	%o3,	%o7,	%i4
	movle	%xcc,	%l0,	%o5
	fandnot2	%f28,	%f12,	%f10
loop_176:
	fmovsvc	%xcc,	%f3,	%f25
	fmovrsgez	%i1,	%f30,	%f18
	array32	%i0,	%o2,	%l4
	mulscc	%g2,	%o0,	%i3
	fbuge	%fcc1,	loop_177
	fnand	%f8,	%f20,	%f8
	sdivcc	%g6,	0x0626,	%i7
	addc	%i6,	0x179A,	%l2
loop_177:
	fble,a	%fcc1,	loop_178
	sub	%l5,	0x0C7F,	%g1
	movrne	%g5,	%o1,	%o6
	srax	%o4,	0x1D,	%i5
loop_178:
	ldub	[%l7 + 0x0E],	%l1
	bn,a,pt	%xcc,	loop_179
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x4
	subc	%l3,	0x19C0,	%g7
loop_179:
	fmovrdlez	%g3,	%f16,	%f28
	set	0x3C, %o0
	lda	[%l7 + %o0] 0x0c,	%f5
	fmovrsgz	%l6,	%f5,	%f31
	tcs	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x18AA
	movrgez	%g4,	0x001,	%i2
	fmovrdlz	%o7,	%f0,	%f20
	fmovscs	%xcc,	%f1,	%f3
	and	%o3,	0x1239,	%i4
	te	%icc,	0x3
	movrlz	%l0,	0x237,	%i1
	wr	%g0,	0x89,	%asi
	stba	%i0,	[%l7 + 0x72] %asi
	orn	%o2,	0x1DA1,	%l4
	edge16ln	%o5,	%o0,	%g2
	tcc	%icc,	0x2
	ba,pt	%icc,	loop_180
	bl,a,pt	%icc,	loop_181
	nop
	fitos	%f3,	%f1
	fstoi	%f1,	%f24
	be,a	%xcc,	loop_182
loop_180:
	nop
	setx	0xFD5569DABBB2D3E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f26
loop_181:
	nop
	setx	0x90668B8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	bpos,a,pn	%xcc,	loop_183
loop_182:
	movrlz	%g6,	%i7,	%i6
	addc	%i3,	0x14DD,	%l2
	movg	%xcc,	%l5,	%g5
loop_183:
	sdiv	%g1,	0x0920,	%o1
	addcc	%o4,	0x06C7,	%i5
	sra	%o6,	0x04,	%l1
	udiv	%l3,	0x1582,	%g3
	bcs	%xcc,	loop_184
	nop
	setx	0xF0A6739C49ECD815,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xFC956F981CC890BF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f28,	%f16
	fbne	%fcc3,	loop_185
	bvs,a,pt	%xcc,	loop_186
loop_184:
	orncc	%l6,	0x1684,	%g4
	movrgz	%g7,	%o7,	%o3
loop_185:
	fmovrse	%i4,	%f29,	%f22
loop_186:
	taddcctv	%l0,	%i2,	%i0
	fzeros	%f25
	nop
	setx	0x1290F205EA8FF872,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f14
	fpsub32	%f8,	%f14,	%f22
	udivcc	%i1,	0x1D04,	%l4
	sll	%o5,	0x13,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_187,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%o2,	%g2,	%g6
	xnor	%i7,	%i3,	%l2
	edge32n	%i6,	%l5,	%g1
loop_187:
	fmuld8ulx16	%f3,	%f15,	%f20
	xnor	%o1,	0x1C01,	%o4
	tsubcc	%g5,	0x0690,	%i5
	brlez,a	%l1,	loop_188
	nop
	set	0x6A, %l1
	ldsb	[%l7 + %l1],	%o6
	sdivcc	%g3,	0x1E50,	%l3
	brgez,a	%l6,	loop_189
loop_188:
	movn	%icc,	%g4,	%o7
	fbo,a	%fcc3,	loop_190
	srax	%g7,	%o3,	%l0
loop_189:
	movge	%icc,	%i4,	%i0
	movrlez	%i1,	0x21E,	%l4
loop_190:
	subc	%o5,	0x188F,	%i2
	alignaddr	%o2,	%g2,	%o0
	nop
	setx	0x002C6504,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x5F4ACAD6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f24,	%f31
	fbo	%fcc1,	loop_191
	fmovrslez	%i7,	%f22,	%f29
	or	%g6,	%i3,	%i6
	sub	%l5,	%l2,	%g1
loop_191:
	or	%o1,	%o4,	%i5
	tsubcc	%l1,	0x053E,	%o6
	fnands	%f4,	%f8,	%f9
	bneg,a,pt	%xcc,	loop_192
	sra	%g5,	%g3,	%l3
	fmovdvs	%xcc,	%f8,	%f11
	movge	%xcc,	%g4,	%o7
loop_192:
	movn	%icc,	%l6,	%o3
	fmovd	%f30,	%f22
	fmovrdne	%g7,	%f26,	%f30
	sir	0x1941
	edge8n	%i4,	%i0,	%l0
	popc	0x05E9,	%i1
	edge16	%l4,	%o5,	%o2
	xorcc	%g2,	%o0,	%i2
	movcs	%icc,	%i7,	%g6
	ldub	[%l7 + 0x72],	%i6
	nop
	fitos	%f14,	%f2
	fstox	%f2,	%f2
	tvs	%xcc,	0x0
	sethi	0x0A2A,	%l5
	tvs	%xcc,	0x5
	nop
	fitos	%f12,	%f19
	fstox	%f19,	%f0
	fxtos	%f0,	%f21
	sll	%i3,	0x0F,	%l2
	tn	%icc,	0x0
	edge32	%o1,	%o4,	%g1
	bvs,a	%xcc,	loop_193
	fzeros	%f27
	fnot1s	%f14,	%f14
	sub	%i5,	%o6,	%l1
loop_193:
	edge16ln	%g3,	%l3,	%g4
	set	0x178, %i4
	nop 	! 	nop 	! 	ldxa	[%g0 + %i4] 0x40,	%g5 ripped by fixASI40.pl ripped by fixASI40.pl
	set	0x7C, %l6
	ldsha	[%l7 + %l6] 0x19,	%o7
	array32	%o3,	%g7,	%l6
	fpack16	%f20,	%f17
	fbg,a	%fcc0,	loop_194
	movpos	%xcc,	%i4,	%l0
	orncc	%i0,	%i1,	%l4
	orncc	%o5,	0x0BDA,	%g2
loop_194:
	edge16l	%o2,	%o0,	%i2
	tg	%xcc,	0x2
	fxor	%f10,	%f26,	%f6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i7
	fbu,a	%fcc2,	loop_195
	mova	%xcc,	%g6,	%l5
	mulx	%i3,	%i6,	%o1
	fmovse	%icc,	%f24,	%f7
loop_195:
	movrlez	%l2,	%g1,	%o4
	sllx	%o6,	0x13,	%l1
	edge32l	%i5,	%l3,	%g3
	bge	loop_196
	tsubcctv	%g4,	0x1551,	%o7
	tcc	%icc,	0x0
	movg	%xcc,	%g5,	%o3
loop_196:
	movrlz	%l6,	%i4,	%g7
	tcc	%xcc,	0x1
	popc	%l0,	%i0
	movne	%icc,	%i1,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc2,	loop_197
	tleu	%icc,	0x7
	fbn,a	%fcc3,	loop_198
	umulcc	%l4,	%o2,	%o0
loop_197:
	ldsw	[%l7 + 0x78],	%i2
	fcmple16	%f2,	%f4,	%g2
loop_198:
	taddcctv	%i7,	0x01AF,	%g6
	edge32	%l5,	%i6,	%i3
	sethi	0x07AB,	%l2
	umulcc	%o1,	%g1,	%o4
	stbar
	movn	%xcc,	%l1,	%i5
	fmovdneg	%xcc,	%f8,	%f17
	subcc	%l3,	0x1D27,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x58],	%g3
	array16	%g4,	%o7,	%g5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%o3
	mova	%xcc,	%l6,	%i4
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x4C] %asi,	%g7
	movpos	%icc,	%i0,	%l0
	tcc	%xcc,	0x4
	tl	%xcc,	0x0
	nop
	setx	loop_199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%i1,	%o5,	%l4
	fmovsvc	%icc,	%f29,	%f23
	tpos	%xcc,	0x5
loop_199:
	fnor	%f20,	%f2,	%f0
	fmovdg	%icc,	%f8,	%f4
	set	0x50, %i3
	stxa	%o2,	[%l7 + %i3] 0x11
	edge16ln	%i2,	%o0,	%i7
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x11,	%f16
	movne	%xcc,	%g2,	%l5
	srlx	%i6,	0x0F,	%g6
	edge8	%i3,	%o1,	%l2
	membar	0x09
	ldx	[%l7 + 0x10],	%o4
	ldsb	[%l7 + 0x4B],	%g1
	movne	%icc,	%l1,	%i5
	movre	%o6,	%g3,	%l3
	tpos	%xcc,	0x4
	movrgz	%g4,	0x027,	%g5
	smul	%o7,	0x012E,	%o3
	udiv	%l6,	0x1A08,	%g7
	sethi	0x04D2,	%i4
	fmovrsne	%i0,	%f29,	%f22
	movpos	%icc,	%i1,	%o5
	prefetch	[%l7 + 0x4C],	 0x2
	fmovsleu	%xcc,	%f15,	%f20
	andcc	%l4,	0x0DBF,	%l0
	tn	%xcc,	0x1
	mova	%icc,	%i2,	%o0
	smul	%o2,	%i7,	%g2
	fmovdl	%xcc,	%f15,	%f9
	sdivcc	%i6,	0x192C,	%g6
	set	0x38, %o1
	sta	%f15,	[%l7 + %o1] 0x89
	alignaddrl	%l5,	%i3,	%o1
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movgu	%icc,	%o4,	%l2
	bcc,pn	%icc,	loop_200
	brlez,a	%g1,	loop_201
	std	%f22,	[%l7 + 0x28]
	fbul,a	%fcc2,	loop_202
loop_200:
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%i5
loop_201:
	movneg	%xcc,	%l1,	%g3
	movge	%xcc,	%o6,	%g4
loop_202:
	tne	%icc,	0x3
	movrne	%g5,	0x0B9,	%l3
	umul	%o3,	%l6,	%g7
	nop
	fitos	%f5,	%f27
	fstox	%f27,	%f14
	fxtos	%f14,	%f23
	bge,a,pn	%icc,	loop_203
	umul	%i4,	%o7,	%i0
	movrlz	%i1,	%l4,	%l0
	st	%f3,	[%l7 + 0x50]
loop_203:
	fornot2s	%f19,	%f11,	%f23
	fmovsvc	%icc,	%f5,	%f14
	fbg,a	%fcc2,	loop_204
	te	%xcc,	0x1
	fmuld8ulx16	%f3,	%f10,	%f18
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%o5
loop_204:
	nop
	set	0x0C, %o6
	ldstuba	[%l7 + %o6] 0x10,	%o0
	orcc	%i2,	0x0770,	%o2
	bgu,pt	%icc,	loop_205
	st	%f9,	[%l7 + 0x7C]
	brlez,a	%g2,	loop_206
	movgu	%xcc,	%i6,	%g6
loop_205:
	tleu	%xcc,	0x5
	tpos	%icc,	0x6
loop_206:
	sdivcc	%i7,	0x13BC,	%l5
	stbar
	fmovdcs	%icc,	%f6,	%f30
	movle	%icc,	%o1,	%o4
	tcs	%icc,	0x4
	umul	%l2,	0x11C7,	%i3
	fornot1s	%f16,	%f2,	%f11
	movrlz	%i5,	%l1,	%g3
	bl	loop_207
	fnot1	%f10,	%f16
	bcs,pt	%icc,	loop_208
	tle	%xcc,	0x2
loop_207:
	bvs,a,pn	%xcc,	loop_209
	fbue	%fcc2,	loop_210
loop_208:
	fexpand	%f20,	%f20
	fcmpeq32	%f10,	%f2,	%o6
loop_209:
	andcc	%g1,	%g4,	%g5
loop_210:
	movgu	%xcc,	%l3,	%l6
	brz	%o3,	loop_211
	fornot1	%f0,	%f30,	%f26
	brgz,a	%i4,	loop_212
	sub	%g7,	0x1880,	%o7
loop_211:
	bn,pn	%icc,	loop_213
	srl	%i1,	%l4,	%l0
loop_212:
	andcc	%i0,	0x14FD,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_213:
	movne	%icc,	%o0,	%o2
	set	0x38, %g4
	sta	%f16,	[%l7 + %g4] 0x19
	fnot1s	%f14,	%f4
	edge32	%i2,	%i6,	%g2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x08] %asi,	%f8
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%g6
	edge8ln	%l5,	%o1,	%o4
	sllx	%l2,	%i7,	%i3
	movneg	%xcc,	%i5,	%g3
	fbug,a	%fcc3,	loop_214
	fbuge	%fcc0,	loop_215
	movvc	%xcc,	%o6,	%l1
	edge8ln	%g1,	%g4,	%l3
loop_214:
	tvs	%icc,	0x3
loop_215:
	fabss	%f9,	%f17
	ta	%xcc,	0x4
	move	%icc,	%l6,	%o3
	tge	%xcc,	0x4
	array32	%g5,	%i4,	%g7
	set	0x60, %g5
	lduha	[%l7 + %g5] 0x80,	%i1
	fxnors	%f20,	%f20,	%f20
	ldsw	[%l7 + 0x28],	%l4
	addcc	%o7,	%l0,	%i0
	srl	%o5,	0x08,	%o0
	te	%xcc,	0x1
	std	%f14,	[%l7 + 0x38]
	udivcc	%o2,	0x08EE,	%i6
	tn	%xcc,	0x0
	brlez	%i2,	loop_216
	taddcc	%g6,	0x0EFD,	%l5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
loop_216:
	fxor	%f24,	%f2,	%f8
	fmovda	%icc,	%f16,	%f28
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o4
	flush	%l7 + 0x18
	movvs	%icc,	%i7,	%i3
	lduh	[%l7 + 0x64],	%l2
	fbue,a	%fcc3,	loop_217
	movcs	%xcc,	%i5,	%o6
	movleu	%icc,	%g3,	%l1
	edge32	%g1,	%g4,	%l6
loop_217:
	orncc	%l3,	0x0AC1,	%o3
	movpos	%icc,	%i4,	%g7
	mova	%xcc,	%i1,	%g5
	movre	%o7,	0x138,	%l0
	fpsub32s	%f5,	%f24,	%f4
	bvs	%xcc,	loop_218
	movleu	%icc,	%l4,	%i0
	fbe,a	%fcc3,	loop_219
	nop
	fitos	%f11,	%f22
	fstod	%f22,	%f16
loop_218:
	tsubcctv	%o0,	0x1202,	%o2
	tg	%icc,	0x1
loop_219:
	fnegd	%f10,	%f2
	nop
	setx	loop_220,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%icc,	%o5,	%i6
	fnand	%f16,	%f2,	%f0
	fones	%f10
loop_220:
	srax	%i2,	%l5,	%g6
	wr	%g0,	0xeb,	%asi
	stwa	%g2,	[%l7 + 0x34] %asi
	membar	#Sync
	udivcc	%o1,	0x1B81,	%o4
	sir	0x0F46
	movgu	%icc,	%i3,	%l2
	edge8	%i5,	%o6,	%i7
	brgez	%l1,	loop_221
	movcc	%xcc,	%g3,	%g4
	edge8ln	%g1,	%l3,	%o3
	fpsub16	%f10,	%f0,	%f24
loop_221:
	subcc	%l6,	0x197F,	%i4
	fmovscc	%xcc,	%f3,	%f0
	taddcc	%i1,	0x0F85,	%g7
	brz,a	%o7,	loop_222
	edge16	%l0,	%g5,	%l4
	alignaddr	%i0,	%o0,	%o5
	fmovs	%f0,	%f6
loop_222:
	tcc	%icc,	0x3
	tneg	%icc,	0x3
	udivcc	%o2,	0x1A86,	%i2
	tl	%icc,	0x7
	fba	%fcc3,	loop_223
	srlx	%i6,	0x05,	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%g2
loop_223:
	subcc	%o1,	%i3,	%l2
	fmovrdgz	%i5,	%f16,	%f18
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x10,	%o6
	orcc	%i7,	%l1,	%o4
	fornot2s	%f4,	%f27,	%f30
	fmovdgu	%icc,	%f13,	%f24
	ldsb	[%l7 + 0x5E],	%g4
	set	0x0C, %i1
	swapa	[%l7 + %i1] 0x80,	%g1
	edge16ln	%l3,	%g3,	%l6
	tcc	%icc,	0x1
	xor	%o3,	%i4,	%g7
	srlx	%i1,	%l0,	%g5
	movn	%icc,	%o7,	%l4
	udiv	%o0,	0x02D1,	%i0
	fmul8x16au	%f27,	%f3,	%f18
	andn	%o2,	%i2,	%i6
	movleu	%icc,	%l5,	%g6
	tsubcc	%g2,	0x17A6,	%o5
	edge16n	%i3,	%l2,	%i5
	fmuld8sux16	%f14,	%f28,	%f4
	fblg	%fcc3,	loop_224
	popc	%o1,	%o6
	fmovdcs	%icc,	%f5,	%f4
	fmovscs	%xcc,	%f0,	%f12
loop_224:
	xor	%i7,	%o4,	%l1
	array8	%g1,	%g4,	%g3
	set	0x4F, %o4
	lduba	[%l7 + %o4] 0x10,	%l3
	mulscc	%o3,	%l6,	%g7
	edge32ln	%i1,	%i4,	%l0
	tneg	%icc,	0x6
	fmuld8ulx16	%f5,	%f18,	%f22
	tsubcctv	%g5,	%o7,	%l4
	movrlez	%i0,	%o0,	%i2
	tg	%icc,	0x0
	set	0x68, %l3
	ldsha	[%l7 + %l3] 0x04,	%i6
	movrgz	%l5,	%g6,	%g2
	nop
	setx	loop_225,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%o5,	0x1162,	%i3
	taddcctv	%o2,	%i5,	%o1
	nop
	set	0x4C, %i5
	ldsb	[%l7 + %i5],	%o6
loop_225:
	fbne	%fcc3,	loop_226
	tleu	%xcc,	0x1
	umulcc	%l2,	0x0359,	%o4
	alignaddrl	%l1,	%g1,	%i7
loop_226:
	movrgz	%g4,	0x23F,	%l3
	fnot1	%f22,	%f10
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	edge8	%o3,	%l6,	%g7
	fcmpgt32	%f4,	%f4,	%i4
	popc	0x08CC,	%i1
	ta	%xcc,	0x0
	edge32l	%l0,	%o7,	%l4
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	tcs	%xcc,	0x4
	fors	%f0,	%f7,	%f25
	edge32l	%o0,	%g5,	%i2
	edge32	%i6,	%g6,	%l5
	membar	0x54
	membar	0x6C
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x18,	%g2
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movge	%icc,	%i3,	%o2
	fmovrde	%o5,	%f8,	%f4
	brlz,a	%i5,	loop_227
	tcs	%xcc,	0x6
	movvc	%icc,	%o6,	%o1
	sllx	%o4,	0x0D,	%l1
loop_227:
	tge	%xcc,	0x5
	fnot1s	%f24,	%f4
	fmovrsgez	%l2,	%f28,	%f29
	fnand	%f6,	%f22,	%f8
	bneg,a,pt	%xcc,	loop_228
	fble	%fcc0,	loop_229
	orn	%i7,	%g4,	%l3
	set	0x4C, %o7
	stwa	%g1,	[%l7 + %o7] 0x27
	membar	#Sync
loop_228:
	movrlez	%o3,	0x0CD,	%g3
loop_229:
	nop
	set	0x77, %g7
	lduba	[%l7 + %g7] 0x81,	%g7
	array32	%l6,	%i4,	%i1
	fnor	%f22,	%f14,	%f24
	subccc	%o7,	0x10CE,	%l4
	ldsb	[%l7 + 0x4A],	%i0
	tne	%xcc,	0x1
	fmovdpos	%icc,	%f17,	%f22
	tvc	%icc,	0x0
	edge8n	%l0,	%g5,	%o0
	andn	%i2,	%i6,	%l5
	nop
	fitod	%f4,	%f0
	fdtox	%f0,	%f20
	ldsb	[%l7 + 0x15],	%g2
	andcc	%i3,	%o2,	%g6
	subcc	%i5,	%o5,	%o6
	ldstub	[%l7 + 0x43],	%o1
	and	%l1,	0x107E,	%l2
	fbg	%fcc1,	loop_230
	srlx	%i7,	0x10,	%o4
	ta	%xcc,	0x7
	fbn	%fcc2,	loop_231
loop_230:
	sll	%g4,	0x09,	%g1
	fnand	%f12,	%f28,	%f12
	orn	%o3,	0x1091,	%l3
loop_231:
	tl	%xcc,	0x6
	movl	%xcc,	%g7,	%l6
	movrlez	%i4,	%g3,	%i1
	mulx	%l4,	%o7,	%i0
	set	0x40, %l2
	stwa	%g5,	[%l7 + %l2] 0x18
	movrgez	%l0,	%o0,	%i6
	fornot2s	%f0,	%f16,	%f25
	set	0x64, %o2
	lduwa	[%l7 + %o2] 0x88,	%i2
	andn	%g2,	0x1E46,	%l5
	subcc	%o2,	0x19A3,	%g6
	andncc	%i3,	%o5,	%o6
	fmovspos	%xcc,	%f24,	%f22
	add	%i5,	0x05A0,	%o1
	brlez,a	%l2,	loop_232
	array8	%i7,	%o4,	%g4
	fmul8x16au	%f14,	%f26,	%f16
	subc	%g1,	0x0B0E,	%o3
loop_232:
	nop
	fitod	%f12,	%f0
	fdtox	%f0,	%f2
	movrlez	%l3,	0x35B,	%g7
	st	%f8,	[%l7 + 0x1C]
	tvc	%xcc,	0x4
	ta	%xcc,	0x4
	edge32	%l6,	%i4,	%l1
	movcc	%xcc,	%i1,	%g3
	sdivcc	%o7,	0x0B75,	%i0
	andncc	%g5,	%l0,	%o0
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f6
	umul	%i6,	%i2,	%l4
	movrlz	%g2,	0x0E1,	%o2
	movvs	%icc,	%g6,	%i3
	ldx	[%l7 + 0x30],	%l5
	pdist	%f8,	%f22,	%f0
	fpadd16	%f22,	%f18,	%f0
	bcs,pn	%xcc,	loop_233
	mova	%xcc,	%o5,	%i5
	tneg	%xcc,	0x6
	ba,a,pn	%xcc,	loop_234
loop_233:
	fpsub16	%f20,	%f0,	%f2
	fsrc1	%f12,	%f14
	umulcc	%o1,	0x1EE9,	%o6
loop_234:
	andn	%l2,	%o4,	%g4
	te	%xcc,	0x4
	fbue	%fcc1,	loop_235
	ldsw	[%l7 + 0x68],	%g1
	fpsub32s	%f8,	%f9,	%f9
	tleu	%icc,	0x2
loop_235:
	addc	%o3,	%l3,	%g7
	bn,a	loop_236
	fmovde	%xcc,	%f27,	%f19
	stx	%l6,	[%l7 + 0x28]
	bg,pn	%xcc,	loop_237
loop_236:
	srl	%i7,	%l1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i1,	%o7
loop_237:
	fmovsleu	%xcc,	%f0,	%f9
	fmovrdgz	%i0,	%f6,	%f16
	movre	%g5,	0x003,	%g3
	orn	%o0,	0x07AF,	%i6
	edge32	%l0,	%i2,	%g2
	st	%f4,	[%l7 + 0x58]
	set	0x34, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o2
	tvc	%icc,	0x3
	fbe,a	%fcc1,	loop_238
	fornot1	%f0,	%f16,	%f10
	smulcc	%l4,	%i3,	%g6
	bpos,a	loop_239
loop_238:
	tneg	%xcc,	0x6
	movcs	%xcc,	%o5,	%i5
	pdist	%f10,	%f26,	%f28
loop_239:
	fbn	%fcc3,	loop_240
	edge32l	%o1,	%l5,	%o6
	ldx	[%l7 + 0x60],	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_240:
	andn	%g4,	%g1,	%o3
	edge8	%l3,	%l2,	%g7
	fpsub16s	%f10,	%f20,	%f29
	subccc	%i7,	0x18D3,	%l6
	andn	%l1,	0x072D,	%i1
	udivx	%o7,	0x1126,	%i0
	fone	%f8
	sdiv	%g5,	0x14A3,	%i4
	edge16n	%o0,	%i6,	%g3
	movleu	%xcc,	%i2,	%g2
	fbe	%fcc3,	loop_241
	tle	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f6,	%f16
loop_241:
	alignaddr	%o2,	%l4,	%l0
	fmovrdgez	%g6,	%f16,	%f6
	addc	%i3,	0x05D4,	%o5
	movcs	%xcc,	%o1,	%i5
	sdiv	%o6,	0x17CF,	%o4
	fmovsle	%xcc,	%f13,	%f16
	tgu	%xcc,	0x7
	tvs	%icc,	0x1
	tn	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f30,	%f12
	smulcc	%l5,	%g1,	%g4
	movre	%l3,	%o3,	%l2
	fmovd	%f6,	%f20
	srax	%i7,	0x0B,	%l6
	set	0x6A, %i0
	lduha	[%l7 + %i0] 0x18,	%g7
	array16	%l1,	%i1,	%o7
	ldd	[%l7 + 0x68],	%f14
	sir	0x1FAA
	fnot1s	%f8,	%f20
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x14
	stbar
	movleu	%icc,	%i0,	%g5
	fmovse	%xcc,	%f7,	%f30
	movn	%xcc,	%o0,	%i4
	nop
	set	0x4E, %l0
	sth	%g3,	[%l7 + %l0]
	andn	%i6,	0x0232,	%g2
	fcmpne16	%f20,	%f10,	%i2
	movle	%icc,	%o2,	%l0
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x78] %asi,	%f1
	fmovse	%icc,	%f3,	%f15
	movrne	%l4,	%i3,	%g6
	and	%o5,	%o1,	%i5
	array16	%o6,	%l5,	%o4
	fbne	%fcc1,	loop_242
	fmovdgu	%icc,	%f30,	%f0
	orcc	%g1,	0x0186,	%g4
	bvc,a	loop_243
loop_242:
	xnorcc	%o3,	0x16F7,	%l3
	movcc	%xcc,	%i7,	%l2
	srlx	%l6,	%l1,	%g7
loop_243:
	fsrc1	%f30,	%f22
	fbg	%fcc3,	loop_244
	fmovscs	%icc,	%f8,	%f20
	fmovdvs	%xcc,	%f19,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_244:
	movrlez	%i1,	0x0D6,	%i0
	brgz	%o7,	loop_245
	sdiv	%o0,	0x0BF5,	%g5
	nop
	fitos	%f14,	%f5
	fstoi	%f5,	%f8
	edge32	%i4,	%g3,	%i6
loop_245:
	sll	%i2,	0x10,	%o2
	ldsb	[%l7 + 0x3F],	%g2
	bvc,a	%xcc,	loop_246
	sra	%l4,	0x11,	%l0
	movre	%i3,	%o5,	%o1
	subc	%i5,	%g6,	%o6
loop_246:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x64] %asi,	%l5
	ba,a,pn	%icc,	loop_247
	mulscc	%g1,	%o4,	%g4
	fnot2s	%f18,	%f18
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f4
loop_247:
	te	%xcc,	0x4
	tcs	%xcc,	0x5
	tsubcctv	%l3,	%i7,	%o3
	edge8ln	%l6,	%l2,	%g7
	brz	%l1,	loop_248
	subcc	%i0,	0x0F9E,	%i1
	addc	%o0,	%o7,	%i4
	stx	%g3,	[%l7 + 0x08]
loop_248:
	nop
	fitos	%f4,	%f11
	addccc	%g5,	0x1979,	%i6
	bge,a,pt	%icc,	loop_249
	fnand	%f16,	%f8,	%f0
	fbn	%fcc2,	loop_250
	stw	%i2,	[%l7 + 0x3C]
loop_249:
	sra	%o2,	%g2,	%l0
	tgu	%icc,	0x1
loop_250:
	orncc	%i3,	0x024F,	%l4
	edge8	%o1,	%i5,	%g6
	and	%o5,	0x0C79,	%l5
	fbue,a	%fcc3,	loop_251
	ldsh	[%l7 + 0x7A],	%o6
	subc	%o4,	0x096A,	%g1
	tvs	%xcc,	0x4
loop_251:
	bl,a,pn	%icc,	loop_252
	fbuge	%fcc2,	loop_253
	brgz,a	%l3,	loop_254
	lduw	[%l7 + 0x54],	%i7
loop_252:
	fpack16	%f30,	%f14
loop_253:
	edge32ln	%g4,	%l6,	%o3
loop_254:
	fpackfix	%f2,	%f16
	movcc	%icc,	%g7,	%l2
	stbar
	edge16n	%i0,	%l1,	%i1
	addccc	%o0,	%i4,	%g3
	udivcc	%o7,	0x0D10,	%i6
	taddcc	%g5,	%i2,	%o2
	movrgz	%l0,	%i3,	%l4
	te	%xcc,	0x3
	addccc	%o1,	0x0F8E,	%i5
	sdivx	%g2,	0x16D8,	%g6
	taddcctv	%l5,	0x1AEC,	%o5
	fmovdn	%icc,	%f28,	%f13
	fbl,a	%fcc0,	loop_255
	mova	%icc,	%o4,	%o6
	fcmpeq16	%f6,	%f8,	%l3
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x16] %asi
loop_255:
	fble,a	%fcc0,	loop_256
	sdivx	%i7,	0x1FCA,	%g4
	fbg	%fcc3,	loop_257
	stb	%l6,	[%l7 + 0x1F]
loop_256:
	fbe,a	%fcc2,	loop_258
	stbar
loop_257:
	tl	%icc,	0x4
	xor	%o3,	0x164E,	%g7
loop_258:
	tpos	%xcc,	0x2
	ldx	[%l7 + 0x30],	%l2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l1
	bneg,a	loop_259
	sra	%o0,	%i1,	%i4
	fmovscs	%xcc,	%f28,	%f19
	fabss	%f2,	%f29
loop_259:
	sllx	%o7,	%g3,	%i6
	brnz	%g5,	loop_260
	tn	%xcc,	0x5
	taddcctv	%i2,	%l0,	%i3
	fxnors	%f7,	%f3,	%f0
loop_260:
	or	%l4,	%o2,	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%g6
	sdivx	%l5,	0x1BAE,	%o1
	faligndata	%f4,	%f12,	%f24
	tpos	%xcc,	0x4
	andn	%o5,	0x02AD,	%o6
	movl	%icc,	%l3,	%g1
	fsrc2	%f22,	%f4
	wr	%g0,	0x22,	%asi
	stxa	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	xnor	%i7,	%g4,	%o3
	brz,a	%g7,	loop_261
	tneg	%xcc,	0x3
	movleu	%xcc,	%l6,	%l2
	tvs	%icc,	0x2
loop_261:
	fmovsgu	%xcc,	%f4,	%f8
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x2e,	%i0
	movrgez	%o0,	0x25F,	%i1
	sub	%i4,	%o7,	%l1
	fbge	%fcc1,	loop_262
	xor	%i6,	0x16E2,	%g5
	movrlz	%i2,	%g3,	%l0
	fmul8x16au	%f9,	%f21,	%f12
loop_262:
	mulscc	%l4,	%i3,	%i5
	nop
	setx	0x2D75727445A17B6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f12
	addccc	%o2,	0x1215,	%g6
	bl	loop_263
	tn	%xcc,	0x2
	tvc	%icc,	0x2
	fmovrslez	%g2,	%f11,	%f11
loop_263:
	nop
	set	0x210, %o3
	ldxa	[%g0 + %o3] 0x52,	%l5
	umulcc	%o1,	0x1093,	%o5
	fmovsgu	%xcc,	%f6,	%f23
	fmovrdgez	%l3,	%f26,	%f12
	movneg	%xcc,	%g1,	%o4
	fbge	%fcc0,	loop_264
	fmovrdgez	%o6,	%f26,	%f20
	membar	0x58
	movneg	%xcc,	%i7,	%o3
loop_264:
	andcc	%g4,	%g7,	%l2
	nop
	setx	0x20C72CC79C711DE6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x313FE6AD84068E22,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f6,	%f6
	tneg	%xcc,	0x4
	fnands	%f8,	%f25,	%f11
	movvc	%icc,	%i0,	%l6
	taddcctv	%i1,	0x091F,	%o0
	sir	0x0725
	addc	%o7,	%l1,	%i4
	movrgez	%g5,	%i6,	%i2
	movneg	%xcc,	%l0,	%g3
	xor	%l4,	0x071A,	%i3
	addc	%i5,	%o2,	%g6
	fmuld8sux16	%f30,	%f29,	%f12
	ldx	[%l7 + 0x58],	%g2
	lduw	[%l7 + 0x18],	%l5
	edge32n	%o5,	%o1,	%g1
	fmuld8ulx16	%f7,	%f30,	%f2
	movcs	%xcc,	%o4,	%l3
	fnegd	%f26,	%f12
	subccc	%i7,	0x1348,	%o3
	movcs	%xcc,	%g4,	%g7
	fbule	%fcc3,	loop_265
	sra	%o6,	%l2,	%i0
	addcc	%l6,	0x1AA6,	%o0
	be,a,pt	%xcc,	loop_266
loop_265:
	fmul8x16au	%f0,	%f15,	%f22
	alignaddr	%i1,	%o7,	%i4
	nop
	setx	0x3B94EBE2CAF0509B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF9C17CF4DB6F6FFF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f20,	%f28
loop_266:
	xnorcc	%g5,	0x1125,	%i6
	fmovrdlz	%l1,	%f30,	%f4
	sth	%i2,	[%l7 + 0x0C]
	movgu	%icc,	%g3,	%l4
	brz,a	%l0,	loop_267
	fmovdvc	%icc,	%f17,	%f14
	fmul8sux16	%f6,	%f24,	%f28
	ldd	[%l7 + 0x58],	%f18
loop_267:
	andncc	%i3,	%i5,	%g6
	brlz,a	%g2,	loop_268
	edge8ln	%l5,	%o2,	%o1
	fbue	%fcc0,	loop_269
	sdivcc	%o5,	0x18EB,	%o4
loop_268:
	fmuld8sux16	%f18,	%f15,	%f12
	fbge	%fcc1,	loop_270
loop_269:
	tcs	%xcc,	0x1
	tcc	%icc,	0x4
	smul	%g1,	%i7,	%o3
loop_270:
	fpsub32	%f12,	%f0,	%f18
	nop
	fitod	%f29,	%f22
	sub	%l3,	0x1E26,	%g4
	subcc	%g7,	%l2,	%i0
	stb	%o6,	[%l7 + 0x17]
	edge32l	%l6,	%i1,	%o7
	brgez,a	%i4,	loop_271
	movrgez	%o0,	0x02D,	%g5
	sdivx	%l1,	0x1C3E,	%i6
	brgz,a	%i2,	loop_272
loop_271:
	edge8l	%l4,	%l0,	%g3
	nop
	setx	loop_273,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x12FF
loop_272:
	sir	0x0564
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_273:
	bge,a,pt	%xcc,	loop_274
	orn	%i3,	%i5,	%g6
	edge8l	%l5,	%g2,	%o2
	fmovdg	%icc,	%f11,	%f28
loop_274:
	tvc	%icc,	0x2
	tne	%xcc,	0x2
	fpsub16s	%f19,	%f10,	%f2
	udiv	%o5,	0x1E00,	%o1
	brgez	%g1,	loop_275
	xnorcc	%o4,	0x18C6,	%i7
	movgu	%icc,	%l3,	%o3
	tne	%xcc,	0x3
loop_275:
	edge16l	%g7,	%l2,	%g4
	te	%icc,	0x3
	edge8	%o6,	%l6,	%i0
	and	%i1,	0x070D,	%i4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%o7
	tg	%icc,	0x5
	fmovdg	%icc,	%f2,	%f29
	orn	%o0,	0x07D4,	%g5
	bn,pt	%icc,	loop_276
	ldx	[%l7 + 0x20],	%l1
	addcc	%i6,	%l4,	%l0
	tsubcctv	%i2,	0x0575,	%g3
loop_276:
	swap	[%l7 + 0x68],	%i3
	fnand	%f2,	%f2,	%f26
	movleu	%icc,	%i5,	%g6
	fexpand	%f0,	%f2
	sllx	%g2,	0x08,	%l5
	smulcc	%o5,	%o2,	%o1
	subccc	%o4,	%g1,	%i7
	ldsh	[%l7 + 0x26],	%o3
	movn	%xcc,	%g7,	%l3
	subcc	%g4,	0x0C24,	%o6
	addcc	%l2,	%i0,	%l6
	fxors	%f12,	%f9,	%f4
	movl	%xcc,	%i4,	%i1
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o7
	smulcc	%g5,	%l1,	%i6
	fmovrdgez	%l4,	%f10,	%f26
	sethi	0x017A,	%o0
	fpadd16	%f12,	%f22,	%f10
	movle	%xcc,	%l0,	%i2
	fandnot1s	%f21,	%f17,	%f18
	tl	%icc,	0x7
	movre	%i3,	0x20B,	%g3
	call	loop_277
	fblg,a	%fcc2,	loop_278
	subccc	%i5,	0x1652,	%g6
	sdivx	%g2,	0x0B77,	%l5
loop_277:
	sra	%o5,	%o2,	%o4
loop_278:
	edge8	%o1,	%i7,	%g1
	tvs	%xcc,	0x5
	fmovdleu	%icc,	%f10,	%f27
	nop
	setx loop_279, %l0, %l1
	jmpl %l1, %o3
	ldsb	[%l7 + 0x61],	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g4,	%o6,	%g7
loop_279:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l2,	0x1022,	%l6
	fbe	%fcc1,	loop_280
	movrne	%i4,	%i1,	%o7
	set	0x38, %l4
	lduha	[%l7 + %l4] 0x18,	%i0
loop_280:
	andn	%g5,	%i6,	%l1
	nop
	set	0x18, %i6
	stw	%o0,	[%l7 + %i6]
	xor	%l0,	0x147D,	%i2
	nop
	setx loop_281, %l0, %l1
	jmpl %l1, %l4
	bne,pn	%xcc,	loop_282
	ta	%xcc,	0x0
	addccc	%g3,	0x17C8,	%i3
loop_281:
	movleu	%icc,	%i5,	%g6
loop_282:
	xnor	%l5,	0x0915,	%g2
	fpadd32s	%f16,	%f7,	%f13
	ldd	[%l7 + 0x78],	%o4
	edge32l	%o4,	%o2,	%o1
	sir	0x1554
	smul	%i7,	%g1,	%l3
	movle	%icc,	%o3,	%g4
	movg	%icc,	%g7,	%o6
	stx	%l2,	[%l7 + 0x50]
	taddcc	%i4,	0x1639,	%l6
	tsubcctv	%o7,	%i1,	%i0
	ldsw	[%l7 + 0x54],	%i6
	tgu	%icc,	0x7
	fbue	%fcc2,	loop_283
	orncc	%l1,	0x0D22,	%o0
	sethi	0x0BEB,	%l0
	ldsw	[%l7 + 0x60],	%i2
loop_283:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc2,	loop_284
	fmovscs	%icc,	%f5,	%f17
	set	0x7A, %o0
	ldsha	[%l7 + %o0] 0x14,	%g5
loop_284:
	sethi	0x0940,	%l4
	tleu	%xcc,	0x3
	move	%xcc,	%i3,	%g3
	movrlz	%i5,	%l5,	%g2
	edge16n	%o5,	%o4,	%g6
	tsubcctv	%o1,	%i7,	%g1
	te	%icc,	0x5
	movgu	%icc,	%o2,	%o3
	smulcc	%g4,	%g7,	%l3
	bcs,a,pt	%icc,	loop_285
	fmuld8sux16	%f28,	%f28,	%f18
	xnor	%o6,	%l2,	%i4
	bvs,pt	%icc,	loop_286
loop_285:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f22
	swap	[%l7 + 0x50],	%l6
loop_286:
	fornot1	%f10,	%f2,	%f0
	edge32	%o7,	%i1,	%i0
	fmovrdlez	%l1,	%f2,	%f18
	fmovsne	%icc,	%f25,	%f2
	smulcc	%i6,	%o0,	%i2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x19,	%g5,	%l0
	orncc	%i3,	0x02F8,	%l4
	subc	%i5,	0x1037,	%g3
	tn	%icc,	0x5
	array8	%g2,	%o5,	%l5
	tn	%icc,	0x1
	orn	%o4,	%o1,	%i7
	fmovspos	%icc,	%f9,	%f3
	fbo,a	%fcc2,	loop_287
	fmovdneg	%xcc,	%f17,	%f22
	nop
	fitos	%f3,	%f8
	fstoi	%f8,	%f3
	edge8ln	%g6,	%o2,	%g1
loop_287:
	fmovrslez	%o3,	%f9,	%f19
	sll	%g7,	%g4,	%o6
	ble	%xcc,	loop_288
	xor	%l3,	0x1350,	%i4
	movgu	%xcc,	%l6,	%o7
	fpackfix	%f6,	%f8
loop_288:
	sdivcc	%i1,	0x0D96,	%l2
	fbuge	%fcc2,	loop_289
	movre	%l1,	0x111,	%i0
	stbar
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%o0
loop_289:
	edge8l	%i2,	%g5,	%l0
	movvc	%xcc,	%i6,	%i3
	fmovd	%f4,	%f22
	array8	%l4,	%g3,	%i5
	movleu	%xcc,	%g2,	%o5
	fmul8x16al	%f16,	%f26,	%f12
	stb	%o4,	[%l7 + 0x69]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o1,	%l5
	edge32l	%i7,	%g6,	%g1
	bshuffle	%f20,	%f30,	%f28
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x2c,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o3,	[%l7 + 0x18]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x11,	%g4,	%o6
	for	%f2,	%f10,	%f2
	fbe,a	%fcc3,	loop_290
	addc	%g7,	%l3,	%i4
	movrgez	%o7,	0x21F,	%i1
	fmovs	%f28,	%f28
loop_290:
	sllx	%l6,	%l2,	%i0
	movleu	%icc,	%o0,	%i2
	subcc	%l1,	%l0,	%g5
	movne	%xcc,	%i6,	%i3
	te	%xcc,	0x4
	edge16l	%l4,	%i5,	%g3
	udivx	%g2,	0x0557,	%o5
	te	%xcc,	0x1
	edge32	%o1,	%o4,	%i7
	edge32l	%g6,	%g1,	%l5
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x11,	%f0
	fornot1s	%f28,	%f0,	%f12
	fcmpne16	%f2,	%f2,	%o2
	movrne	%g4,	0x3C6,	%o6
	xnor	%o3,	0x02C0,	%l3
	array8	%i4,	%g7,	%o7
	fmovdg	%icc,	%f14,	%f6
	tneg	%xcc,	0x2
	fmovrsne	%i1,	%f2,	%f7
	brgz,a	%l6,	loop_291
	fcmple32	%f6,	%f16,	%i0
	nop
	setx	0xBB7E4D20A06B67FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	sra	%l2,	0x1E,	%i2
loop_291:
	tge	%icc,	0x4
	fmovd	%f6,	%f26
	movrgez	%l1,	0x386,	%l0
	orn	%g5,	%o0,	%i3
	sub	%l4,	0x036A,	%i5
	tgu	%xcc,	0x7
	wr	%g0,	0x0c,	%asi
	stba	%i6,	[%l7 + 0x38] %asi
	tneg	%xcc,	0x6
	fmul8ulx16	%f0,	%f0,	%f26
	movneg	%icc,	%g3,	%o5
	bne,a,pt	%xcc,	loop_292
	bpos	%icc,	loop_293
	ldd	[%l7 + 0x70],	%o0
	edge32n	%g2,	%i7,	%o4
loop_292:
	popc	%g1,	%g6
loop_293:
	ldsw	[%l7 + 0x1C],	%o2
	xor	%l5,	%g4,	%o6
	brlz,a	%o3,	loop_294
	swap	[%l7 + 0x18],	%l3
	udivx	%i4,	0x051F,	%o7
	orn	%g7,	0x186B,	%i1
loop_294:
	fmovsa	%xcc,	%f19,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i0
	array16	%l2,	%i2,	%l1
	fmovd	%f8,	%f12
	sdivcc	%l6,	0x0482,	%g5
	srl	%o0,	0x16,	%i3
	andn	%l4,	%i5,	%l0
	edge8ln	%g3,	%i6,	%o5
	tleu	%icc,	0x3
	fmovdg	%icc,	%f7,	%f15
	fands	%f23,	%f9,	%f3
	sub	%g2,	%o1,	%i7
	xorcc	%g1,	%g6,	%o4
	fbule,a	%fcc2,	loop_295
	st	%f10,	[%l7 + 0x6C]
	movg	%icc,	%l5,	%g4
	sra	%o2,	0x10,	%o6
loop_295:
	tcc	%icc,	0x1
	edge16n	%o3,	%i4,	%o7
	fbu	%fcc0,	loop_296
	ba,a	%icc,	loop_297
	fba	%fcc1,	loop_298
	movn	%icc,	%g7,	%l3
loop_296:
	tpos	%xcc,	0x2
loop_297:
	sdivx	%i1,	0x1CA8,	%l2
loop_298:
	and	%i0,	%i2,	%l1
	nop
	setx	0x3415A11A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xDB9AFE92,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f6,	%f0
	ble	loop_299
	fandnot1	%f12,	%f10,	%f18
	taddcc	%l6,	0x1B52,	%o0
	fbuge	%fcc3,	loop_300
loop_299:
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f16
	sll	%g5,	0x16,	%i3
	fbul	%fcc1,	loop_301
loop_300:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %i3
	stxa	%i5,	[%l7 + %i3] 0x2a
	membar	#Sync
loop_301:
	ta	%icc,	0x4
	subc	%l4,	%g3,	%l0
	edge8l	%i6,	%o5,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%i7
	bge,pn	%icc,	loop_302
	array16	%g1,	%g6,	%l5
	fnot2s	%f12,	%f2
	popc	%o4,	%o2
loop_302:
	fmovsleu	%icc,	%f27,	%f26
	movl	%xcc,	%g4,	%o3
	orn	%i4,	0x03A3,	%o6
	mova	%icc,	%g7,	%o7
	taddcc	%i1,	0x0A8E,	%l2
	ble,pn	%icc,	loop_303
	edge32l	%i0,	%l3,	%l1
	sllx	%l6,	%o0,	%g5
	tg	%xcc,	0x5
loop_303:
	brz	%i3,	loop_304
	subccc	%i2,	0x12CB,	%l4
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x1f
	membar	#Sync
loop_304:
	fcmple16	%f0,	%f8,	%g3
	alignaddrl	%l0,	%i5,	%i6
	srl	%o5,	0x04,	%o1
	edge16n	%i7,	%g1,	%g6
	orn	%g2,	0x180F,	%l5
	edge8ln	%o4,	%o2,	%o3
	addccc	%g4,	0x1490,	%o6
	fmovdvc	%xcc,	%f16,	%f16
	smul	%i4,	0x0081,	%g7
	set	0x4A, %l6
	ldsha	[%l7 + %l6] 0x11,	%o7
	udiv	%l2,	0x08EB,	%i1
	sth	%i0,	[%l7 + 0x74]
	tl	%icc,	0x2
	tcc	%xcc,	0x6
	subc	%l3,	%l6,	%l1
	fmovsneg	%icc,	%f0,	%f29
	taddcctv	%o0,	%g5,	%i2
	bcs,a	%icc,	loop_305
	fsrc1	%f2,	%f22
	movrgez	%l4,	%g3,	%i3
	bvs,a,pt	%icc,	loop_306
loop_305:
	udiv	%l0,	0x1248,	%i6
	brgz	%i5,	loop_307
	subcc	%o5,	0x0D6C,	%o1
loop_306:
	nop
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf1,	%f0
loop_307:
	brlez	%i7,	loop_308
	tge	%icc,	0x7
	xnorcc	%g6,	0x0B0C,	%g2
	movpos	%icc,	%l5,	%o4
loop_308:
	movl	%xcc,	%g1,	%o2
	tl	%icc,	0x5
	sll	%g4,	0x10,	%o6
	array32	%i4,	%o3,	%g7
	tl	%icc,	0x2
	tcs	%icc,	0x4
	xorcc	%o7,	0x1D6C,	%l2
	movle	%icc,	%i0,	%l3
	addccc	%l6,	0x0DA9,	%l1
	fbn	%fcc3,	loop_309
	movl	%icc,	%i1,	%o0
	movvc	%icc,	%g5,	%i2
	fbule	%fcc2,	loop_310
loop_309:
	subc	%g3,	%i3,	%l4
	stx	%i6,	[%l7 + 0x40]
	fbg	%fcc2,	loop_311
loop_310:
	sdivx	%i5,	0x1DE1,	%l0
	edge16ln	%o1,	%o5,	%i7
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g2
loop_311:
	array8	%g6,	%l5,	%g1
	fmovdgu	%xcc,	%f3,	%f28
	fmul8x16au	%f6,	%f23,	%f20
	tl	%icc,	0x0
	fbug,a	%fcc0,	loop_312
	fmovdcs	%xcc,	%f3,	%f27
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o2
loop_312:
	nop
	setx	0x774929A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x9B0B5313,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f24,	%f18
	fbne	%fcc2,	loop_313
	xor	%g4,	0x0FE4,	%o6
	xnor	%i4,	0x0A3D,	%o4
	fbl	%fcc2,	loop_314
loop_313:
	bn,a,pt	%icc,	loop_315
	xnorcc	%o3,	0x0717,	%o7
	movn	%xcc,	%g7,	%l2
loop_314:
	edge32n	%l3,	%i0,	%l1
loop_315:
	bge,a	loop_316
	movre	%l6,	%o0,	%i1
	movn	%xcc,	%i2,	%g5
	edge16l	%i3,	%l4,	%i6
loop_316:
	taddcc	%i5,	%g3,	%l0
	set	0x34, %o6
	ldswa	[%l7 + %o6] 0x14,	%o1
	fmovsleu	%icc,	%f3,	%f22
	subcc	%o5,	0x0190,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1C, %o1
	swapa	[%l7 + %o1] 0x89,	%i7
	movcs	%icc,	%l5,	%g6
	tn	%xcc,	0x4
	xor	%g1,	0x1ED0,	%g4
	array8	%o2,	%o6,	%o4
	smulcc	%o3,	%o7,	%i4
	membar	0x17
	nop
	setx	0xE8BBA067,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x6B3FB33C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f30,	%f18
	subccc	%l2,	0x0F73,	%g7
	sethi	0x199F,	%l3
	tneg	%xcc,	0x7
	edge32ln	%l1,	%i0,	%l6
	fmovrsgz	%o0,	%f16,	%f12
	fmovsleu	%xcc,	%f20,	%f8
	tsubcc	%i2,	0x1FE0,	%i1
	xorcc	%g5,	0x1E94,	%l4
	fmovscc	%xcc,	%f30,	%f20
	stw	%i3,	[%l7 + 0x28]
	or	%i5,	0x04FB,	%i6
	fmovrsne	%g3,	%f28,	%f3
	tg	%xcc,	0x3
	tsubcctv	%l0,	%o5,	%o1
	mulx	%i7,	%l5,	%g6
	tneg	%icc,	0x7
	subc	%g2,	0x0FC3,	%g1
	fmovsne	%icc,	%f30,	%f16
	faligndata	%f20,	%f4,	%f10
	fmovsleu	%xcc,	%f5,	%f5
	movrlz	%g4,	%o2,	%o4
	brnz,a	%o3,	loop_317
	sll	%o7,	0x15,	%o6
	stw	%i4,	[%l7 + 0x60]
	mova	%icc,	%g7,	%l2
loop_317:
	brz,a	%l1,	loop_318
	nop
	setx	0xBA13A1E4177B29FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xF9938A3C45CA5F09,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f6,	%f6
	or	%l3,	%i0,	%o0
	xnor	%i2,	%i1,	%g5
loop_318:
	movgu	%icc,	%l4,	%i3
	be,a,pt	%icc,	loop_319
	fmovsl	%icc,	%f24,	%f10
	srl	%l6,	0x0D,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_319:
	fbu	%fcc1,	loop_320
	edge16ln	%g3,	%l0,	%i5
	subccc	%o1,	0x14D4,	%i7
	fbug	%fcc2,	loop_321
loop_320:
	tne	%icc,	0x4
	fmovdpos	%icc,	%f26,	%f25
	fmovsg	%icc,	%f12,	%f24
loop_321:
	movvs	%icc,	%l5,	%g6
	ble,pn	%xcc,	loop_322
	nop
	setx	0x691CFD51F9D51B3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF69A13958F86F887,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f0,	%f16
	ldd	[%l7 + 0x30],	%g2
	srlx	%g1,	0x0D,	%g4
loop_322:
	bg,a,pn	%xcc,	loop_323
	nop
	setx	loop_324,	%l0,	%l1
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
	mulx	%o5,	0x005B,	%o2
loop_323:
	mulscc	%o4,	%o3,	%o7
loop_324:
	xnorcc	%o6,	0x03C4,	%g7
	tl	%xcc,	0x1
	srl	%l2,	0x19,	%l1
	fmovdle	%xcc,	%f16,	%f26
	fmovrdgez	%l3,	%f24,	%f18
	tcc	%xcc,	0x1
	tleu	%icc,	0x1
	stx	%i0,	[%l7 + 0x70]
	movcc	%xcc,	%o0,	%i2
	fornot2s	%f11,	%f22,	%f4
	edge8ln	%i1,	%i4,	%g5
	set	0x34, %g4
	lduwa	[%l7 + %g4] 0x0c,	%l4
	bneg,pn	%xcc,	loop_325
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc3,	loop_326
	fsrc2	%f28,	%f12
loop_325:
	or	%l6,	0x0D88,	%i3
	sllx	%g3,	0x02,	%l0
loop_326:
	nop
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x18,	%i6
	movgu	%icc,	%o1,	%i7
	edge32n	%l5,	%g6,	%g2
	smul	%i5,	%g1,	%o5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x6E] %asi,	%o2
	fmovrse	%g4,	%f12,	%f19
	ba,pt	%icc,	loop_327
	brz	%o3,	loop_328
	movgu	%icc,	%o4,	%o6
	set	0x2E, %i1
	stba	%o7,	[%l7 + %i1] 0x80
loop_327:
	edge16	%l2,	%l1,	%l3
loop_328:
	sllx	%g7,	%i0,	%o0
	tg	%xcc,	0x3
	wr	%g0,	0x2a,	%asi
	stxa	%i2,	[%l7 + 0x58] %asi
	membar	#Sync
	edge32n	%i1,	%i4,	%l4
	ld	[%l7 + 0x14],	%f23
	movrgz	%l6,	0x27E,	%i3
	nop
	setx	0xE4EDCCDEBA867626,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD22E001C438C3800,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f26,	%f6
	edge8	%g3,	%l0,	%i6
	movre	%o1,	0x2D5,	%g5
	edge32ln	%l5,	%g6,	%i7
	tcs	%icc,	0x2
	bcs	loop_329
	orcc	%i5,	%g2,	%o5
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x60] %asi,	%g0
loop_329:
	movrlz	%g4,	%o2,	%o4
	prefetch	[%l7 + 0x10],	 0x3
	fmovsneg	%icc,	%f21,	%f27
	set	0x18, %o4
	sta	%f1,	[%l7 + %o4] 0x88
	fmul8x16au	%f11,	%f5,	%f14
	or	%o6,	0x1775,	%o7
	edge8l	%o3,	%l2,	%l3
	tpos	%xcc,	0x6
	nop
	fitod	%f6,	%f20
	fdtos	%f20,	%f24
	mulscc	%l1,	0x0F83,	%g7
	edge32n	%i0,	%o0,	%i1
	set	0x38, %l3
	stha	%i2,	[%l7 + %l3] 0x11
	fmovsa	%icc,	%f21,	%f24
	movl	%icc,	%i4,	%l6
	fbge,a	%fcc2,	loop_330
	nop
	setx	0x65FD382580668173,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fnor	%f2,	%f28,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_330:
	xorcc	%i3,	%l4,	%g3
	fnot1	%f10,	%f12
	tn	%icc,	0x5
	nop
	setx	loop_331,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc	loop_332
	udivx	%i6,	0x083B,	%o1
	orn	%l0,	0x04DC,	%g5
loop_331:
	tcs	%icc,	0x7
loop_332:
	edge8ln	%g6,	%i7,	%i5
	fmovrdgez	%g2,	%f20,	%f16
	fble,a	%fcc2,	loop_333
	membar	0x5E
	brgez	%o5,	loop_334
	nop
	setx	0xDE1C838AB044C9D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_333:
	array16	%l5,	%g1,	%o2
	movn	%xcc,	%o4,	%g4
loop_334:
	movre	%o6,	0x0FC,	%o3
	xorcc	%l2,	%l3,	%o7
	edge16	%g7,	%l1,	%i0
	fandnot1	%f30,	%f22,	%f22
	add	%i1,	0x18DB,	%o0
	movgu	%xcc,	%i2,	%l6
	and	%i4,	%i3,	%l4
	tvs	%xcc,	0x0
	orcc	%i6,	0x12BA,	%g3
	add	%l0,	%o1,	%g6
	bl,a,pn	%xcc,	loop_335
	ldd	[%l7 + 0x78],	%f4
	movvs	%icc,	%g5,	%i7
	mova	%icc,	%g2,	%i5
loop_335:
	movleu	%icc,	%o5,	%g1
	fmovsvc	%icc,	%f27,	%f20
	bleu,a	loop_336
	movle	%icc,	%l5,	%o2
	call	loop_337
	ta	%icc,	0x1
loop_336:
	nop
	set	0x4F, %g5
	ldsba	[%l7 + %g5] 0x80,	%o4
loop_337:
	ldsw	[%l7 + 0x08],	%o6
	std	%f12,	[%l7 + 0x30]
	array16	%o3,	%l2,	%g4
	subc	%o7,	%g7,	%l1
	movne	%icc,	%l3,	%i1
	movcs	%xcc,	%o0,	%i2
	sll	%l6,	0x02,	%i0
	tneg	%icc,	0x7
	fmovsne	%xcc,	%f18,	%f27
	bcc,a,pt	%icc,	loop_338
	movgu	%xcc,	%i4,	%l4
	tsubcctv	%i6,	%i3,	%l0
	fmovse	%icc,	%f4,	%f19
loop_338:
	fnot2	%f4,	%f8
	subc	%o1,	%g6,	%g3
	sir	0x08E1
	andn	%g5,	0x1576,	%i7
	ta	%xcc,	0x1
	stbar
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x0c,	%f0
	orncc	%i5,	0x0B00,	%g2
	prefetch	[%l7 + 0x2C],	 0x0
	alignaddrl	%g1,	%l5,	%o5
	addccc	%o2,	%o4,	%o3
	ba,a,pn	%xcc,	loop_339
	udivx	%o6,	0x0BD6,	%l2
	andn	%o7,	0x1BD2,	%g4
	array32	%g7,	%l1,	%l3
loop_339:
	movrgz	%i1,	0x34E,	%i2
	tg	%xcc,	0x1
	movneg	%xcc,	%o0,	%l6
	sdivx	%i0,	0x0617,	%l4
	movleu	%icc,	%i6,	%i3
	tge	%xcc,	0x6
	stbar
	fbn	%fcc0,	loop_340
	bvc,pt	%xcc,	loop_341
	tvs	%xcc,	0x0
	fmovsge	%xcc,	%f10,	%f30
loop_340:
	array16	%i4,	%l0,	%o1
loop_341:
	ld	[%l7 + 0x28],	%f18
	taddcctv	%g3,	0x0566,	%g5
	bcc,a,pt	%icc,	loop_342
	fmovsgu	%xcc,	%f25,	%f11
	fbn,a	%fcc0,	loop_343
	fmovscs	%xcc,	%f2,	%f17
loop_342:
	movg	%xcc,	%i7,	%g6
	sdivx	%g2,	0x151F,	%i5
loop_343:
	bne,pn	%xcc,	loop_344
	tcc	%xcc,	0x0
	tgu	%xcc,	0x4
	bgu,pn	%xcc,	loop_345
loop_344:
	subcc	%g1,	%l5,	%o2
	tvs	%xcc,	0x2
	brnz	%o4,	loop_346
loop_345:
	fmovs	%f6,	%f0
	bleu,a,pn	%icc,	loop_347
	tneg	%icc,	0x6
loop_346:
	fxnor	%f6,	%f22,	%f18
	subccc	%o3,	%o6,	%o5
loop_347:
	srl	%l2,	%g4,	%g7
	orn	%o7,	%l1,	%i1
	nop
	setx	0xF07BBA1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fmovd	%f4,	%f18
	edge8ln	%i2,	%o0,	%l3
	tg	%xcc,	0x2
	fmovrdgz	%i0,	%f6,	%f22
	stw	%l4,	[%l7 + 0x18]
	tg	%icc,	0x7
	fpadd16	%f30,	%f24,	%f16
	sdivx	%i6,	0x13F6,	%i3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%i4
	addccc	%l6,	0x16F9,	%l0
	brnz	%o1,	loop_348
	udivcc	%g5,	0x178D,	%g3
	lduh	[%l7 + 0x7A],	%i7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x56] %asi,	%g6
loop_348:
	addc	%g2,	0x0C3D,	%i5
	sdivcc	%l5,	0x0191,	%g1
	udivx	%o2,	0x111F,	%o3
	fbg	%fcc3,	loop_349
	sllx	%o6,	%o4,	%o5
	smul	%l2,	%g4,	%g7
	array16	%l1,	%i1,	%o7
loop_349:
	nop
	setx	0x6075C055,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	sll	%o0,	%i2,	%i0
	alignaddrl	%l4,	%i6,	%l3
	fmovdl	%icc,	%f13,	%f31
	array8	%i3,	%i4,	%l6
	tne	%xcc,	0x2
	nop
	setx	0x0128003D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f23
	taddcc	%o1,	%l0,	%g3
	ba	%icc,	loop_350
	tvc	%icc,	0x7
	fbge	%fcc0,	loop_351
	fpmerge	%f18,	%f28,	%f20
loop_350:
	smulcc	%g5,	%g6,	%i7
	tge	%xcc,	0x4
loop_351:
	fmovdge	%icc,	%f4,	%f6
	fcmpgt16	%f26,	%f24,	%i5
	bl,a	%icc,	loop_352
	nop
	setx	0xF469E022,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f19
	fpsub32s	%f26,	%f1,	%f6
	sub	%l5,	%g1,	%o2
loop_352:
	taddcc	%g2,	%o3,	%o6
	fpsub16s	%f2,	%f25,	%f5
	fxors	%f1,	%f9,	%f24
	fnors	%f27,	%f6,	%f4
	sll	%o4,	0x00,	%o5
	sll	%l2,	%g4,	%g7
	sth	%i1,	[%l7 + 0x30]
	fpadd16s	%f31,	%f11,	%f19
	array16	%o7,	%l1,	%o0
	lduw	[%l7 + 0x68],	%i2
	stx	%l4,	[%l7 + 0x20]
	edge8	%i6,	%i0,	%i3
	fcmple32	%f20,	%f4,	%l3
	membar	0x4D
	taddcctv	%l6,	0x1029,	%o1
	sra	%i4,	%g3,	%g5
	addc	%g6,	%i7,	%l0
	tsubcc	%i5,	%l5,	%o2
	edge32	%g2,	%g1,	%o3
	movne	%icc,	%o6,	%o4
	fmovdne	%icc,	%f11,	%f10
	tsubcctv	%o5,	%g4,	%g7
	fbg,a	%fcc1,	loop_353
	stx	%l2,	[%l7 + 0x38]
	alignaddrl	%i1,	%l1,	%o0
	addccc	%i2,	%o7,	%i6
loop_353:
	lduh	[%l7 + 0x58],	%i0
	umul	%i3,	0x1A12,	%l4
	ldstub	[%l7 + 0x58],	%l3
	fnand	%f18,	%f2,	%f18
	srax	%l6,	0x12,	%o1
	fble	%fcc2,	loop_354
	fmovrdgez	%i4,	%f10,	%f26
	movgu	%icc,	%g5,	%g6
	nop
	fitod	%f2,	%f14
loop_354:
	xnorcc	%i7,	%l0,	%g3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0A] %asi,	%l5
	fmovdleu	%icc,	%f4,	%f9
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%i4
	ldd	[%l7 + 0x08],	%g2
	fbo,a	%fcc0,	loop_355
	bcc,a,pt	%xcc,	loop_356
	tn	%xcc,	0x1
	bn,pn	%xcc,	loop_357
loop_355:
	array32	%g1,	%o3,	%o6
loop_356:
	st	%f5,	[%l7 + 0x28]
	ldstub	[%l7 + 0x3A],	%o4
loop_357:
	taddcctv	%o5,	%o2,	%g7
	fxors	%f18,	%f11,	%f2
	tvc	%xcc,	0x5
	subcc	%l2,	0x1DFC,	%g4
	tcs	%icc,	0x7
	xorcc	%l1,	%i1,	%i2
	mova	%xcc,	%o0,	%i6
	fnot1	%f16,	%f22
	bleu,a,pt	%icc,	loop_358
	alignaddr	%i0,	%o7,	%i3
	bshuffle	%f24,	%f12,	%f28
	movrgez	%l3,	0x21C,	%l4
loop_358:
	sth	%l6,	[%l7 + 0x32]
	tvc	%icc,	0x6
	addc	%i4,	0x0343,	%o1
	sdivx	%g5,	0x142B,	%g6
	movne	%icc,	%i7,	%g3
	tgu	%icc,	0x5
	srl	%l0,	0x13,	%i5
	ble,pt	%icc,	loop_359
	bgu,pn	%xcc,	loop_360
	mulscc	%g2,	0x0869,	%g1
	edge16ln	%l5,	%o6,	%o3
loop_359:
	tleu	%xcc,	0x1
loop_360:
	andcc	%o5,	0x0F50,	%o4
	fblg	%fcc1,	loop_361
	bneg	%icc,	loop_362
	fcmpne32	%f12,	%f8,	%g7
	smul	%l2,	0x10E4,	%o2
loop_361:
	prefetch	[%l7 + 0x34],	 0x2
loop_362:
	addc	%l1,	%i1,	%i2
	stw	%g4,	[%l7 + 0x08]
	brgez,a	%o0,	loop_363
	alignaddrl	%i0,	%i6,	%i3
	fbg,a	%fcc3,	loop_364
	edge8	%o7,	%l4,	%l6
loop_363:
	edge8	%i4,	%o1,	%g5
	nop
	fitos	%f14,	%f13
	fstoi	%f13,	%f19
loop_364:
	xnor	%l3,	%i7,	%g6
	fbn	%fcc1,	loop_365
	fnot1s	%f16,	%f22
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f16
loop_365:
	mova	%icc,	%g3,	%l0
	xor	%i5,	%g2,	%g1
	andncc	%l5,	%o6,	%o3
	fmul8x16au	%f5,	%f17,	%f6
	bg,a	loop_366
	lduh	[%l7 + 0x62],	%o5
	mova	%xcc,	%o4,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_366:
	movgu	%icc,	%o2,	%l2
	wr	%g0,	0x89,	%asi
	stba	%i1,	[%l7 + 0x49] %asi
	bshuffle	%f0,	%f10,	%f30
	edge32l	%l1,	%i2,	%o0
	subcc	%g4,	%i0,	%i6
	sdiv	%i3,	0x0D7C,	%l4
	bcc,a	%xcc,	loop_367
	movvs	%icc,	%o7,	%i4
	tleu	%icc,	0x3
	array8	%l6,	%o1,	%g5
loop_367:
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%i7,	[%l7 + 0x0C] %asi
	membar	#Sync
	mulx	%g6,	%l3,	%g3
	fbg	%fcc0,	loop_368
	umul	%l0,	%g2,	%g1
	ldd	[%l7 + 0x28],	%f28
	fmovde	%icc,	%f20,	%f13
loop_368:
	edge32l	%l5,	%i5,	%o3
	fmul8ulx16	%f14,	%f28,	%f10
	tgu	%xcc,	0x7
	lduh	[%l7 + 0x78],	%o6
	sdivx	%o5,	0x0042,	%g7
	srl	%o2,	0x05,	%l2
	fmovrdlez	%o4,	%f10,	%f18
	tge	%xcc,	0x7
	andncc	%i1,	%i2,	%o0
	smul	%g4,	0x1ED3,	%l1
	andncc	%i0,	%i3,	%l4
	sll	%i6,	%o7,	%l6
	edge32n	%o1,	%g5,	%i4
	fbu	%fcc1,	loop_369
	be,pt	%xcc,	loop_370
	mulx	%g6,	0x0D8A,	%i7
	edge32	%g3,	%l0,	%l3
loop_369:
	edge16	%g2,	%g1,	%l5
loop_370:
	ldd	[%l7 + 0x40],	%f28
	fmovrde	%i5,	%f18,	%f14
	movcs	%xcc,	%o6,	%o3
	tge	%icc,	0x4
	fbue,a	%fcc1,	loop_371
	fbug	%fcc2,	loop_372
	mulx	%o5,	%g7,	%o2
	edge8ln	%o4,	%i1,	%l2
loop_371:
	sdivx	%i2,	0x0645,	%o0
loop_372:
	movcc	%xcc,	%l1,	%i0
	movle	%icc,	%g4,	%l4
	fmovsvs	%icc,	%f30,	%f31
	edge8ln	%i3,	%i6,	%l6
	orncc	%o1,	0x0E94,	%g5
	tpos	%icc,	0x7
	move	%icc,	%i4,	%o7
	movg	%xcc,	%g6,	%g3
	nop
	setx	0x4CBA975F1BE9A59F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x63F5C5D489DD886B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f22,	%f22
	stw	%l0,	[%l7 + 0x50]
	tvs	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x07CD7335,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xA05846E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f29,	%f28
	membar	0x57
	bvc,a	loop_373
	fcmple16	%f18,	%f18,	%i7
	fmovsvs	%xcc,	%f14,	%f8
	tne	%xcc,	0x1
loop_373:
	tpos	%xcc,	0x7
	edge8ln	%l3,	%g1,	%l5
	movcc	%icc,	%g2,	%i5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%o5
	fsrc2	%f22,	%f20
	orncc	%o6,	%o2,	%g7
	udiv	%o4,	0x0681,	%i1
	xor	%i2,	0x190F,	%l2
	fmovsvs	%xcc,	%f8,	%f1
	edge32ln	%l1,	%i0,	%o0
	mulscc	%g4,	%i3,	%l4
	edge8ln	%l6,	%i6,	%g5
	tgu	%icc,	0x2
	fandnot1s	%f5,	%f22,	%f22
	sethi	0x00A4,	%o1
	fmovs	%f3,	%f28
	fmovdpos	%icc,	%f11,	%f25
	sdivx	%o7,	0x14CA,	%i4
	xnorcc	%g3,	0x18C5,	%g6
	fble	%fcc2,	loop_374
	udivx	%i7,	0x0E07,	%l3
	nop
	set	0x10, %g7
	stx	%l0,	[%l7 + %g7]
	fpack16	%f26,	%f15
loop_374:
	andn	%g1,	0x19E7,	%l5
	movg	%xcc,	%i5,	%o3
	movrlz	%o5,	0x045,	%o6
	movcc	%xcc,	%g2,	%o2
	nop
	setx	0x97963A1D87F364DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xD574F2768BB256AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f2,	%f30
	nop
	setx	0xE13A31EEF62690EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f16
	nop
	setx	0xE38367DEC14289AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x34118F64A61DBDB0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f4
	smul	%g7,	%o4,	%i1
	tsubcctv	%i2,	0x04E4,	%l2
	mulx	%i0,	%o0,	%l1
	fbo,a	%fcc0,	loop_375
	fcmpgt32	%f14,	%f8,	%i3
	movrne	%g4,	%l4,	%l6
	array8	%i6,	%o1,	%g5
loop_375:
	movre	%i4,	%g3,	%o7
	sub	%i7,	%g6,	%l0
	movrlez	%l3,	0x3FB,	%g1
	edge16l	%l5,	%i5,	%o5
	movneg	%icc,	%o6,	%o3
	edge8n	%o2,	%g2,	%g7
	ldsb	[%l7 + 0x69],	%i1
	subc	%i2,	0x094D,	%l2
	taddcctv	%o4,	0x0704,	%i0
	edge16n	%o0,	%i3,	%g4
	ldstub	[%l7 + 0x6A],	%l1
	tvs	%icc,	0x3
	alignaddrl	%l6,	%i6,	%l4
	movre	%g5,	%i4,	%g3
	udivx	%o7,	0x17EC,	%o1
	nop
	fitos	%f7,	%f30
	fstod	%f30,	%f0
	edge16ln	%g6,	%l0,	%l3
	edge32ln	%i7,	%l5,	%i5
	brgz	%g1,	loop_376
	fnot1	%f2,	%f4
	brz,a	%o6,	loop_377
	or	%o3,	%o2,	%g2
loop_376:
	tcc	%icc,	0x6
	alignaddrl	%o5,	%i1,	%i2
loop_377:
	fpackfix	%f14,	%f13
	fabss	%f23,	%f28
	bgu,a,pn	%xcc,	loop_378
	tleu	%xcc,	0x4
	movleu	%icc,	%g7,	%o4
	tvs	%icc,	0x7
loop_378:
	fmovrdlz	%l2,	%f12,	%f4
	fmovsl	%icc,	%f11,	%f17
	movg	%xcc,	%i0,	%i3
	movrgez	%o0,	0x0E3,	%g4
	flush	%l7 + 0x7C
	xorcc	%l1,	%i6,	%l6
	ldsb	[%l7 + 0x4A],	%l4
	taddcctv	%i4,	%g5,	%o7
	fbul	%fcc3,	loop_379
	tvs	%icc,	0x1
	bpos,a,pn	%icc,	loop_380
	edge32	%g3,	%g6,	%l0
loop_379:
	movn	%icc,	%l3,	%o1
	nop
	setx	0x507AB4D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
loop_380:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x64] %asi,	%f21
	tgu	%icc,	0x4
	udiv	%i7,	0x1509,	%i5
	bcs,pt	%xcc,	loop_381
	fmovdneg	%icc,	%f9,	%f16
	fexpand	%f19,	%f2
	fmovsne	%icc,	%f24,	%f7
loop_381:
	orcc	%g1,	%o6,	%l5
	mova	%icc,	%o2,	%o3
	fbne,a	%fcc1,	loop_382
	sub	%o5,	%i1,	%i2
	ldsb	[%l7 + 0x09],	%g2
	std	%f6,	[%l7 + 0x10]
loop_382:
	edge8ln	%o4,	%g7,	%l2
	tsubcctv	%i3,	%i0,	%g4
	nop
	setx	loop_383,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	0x12AF,	%l1
	fmul8x16al	%f16,	%f4,	%f24
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%i6
loop_383:
	edge16ln	%l6,	%l4,	%i4
	fbge	%fcc2,	loop_384
	flush	%l7 + 0x1C
	alignaddrl	%g5,	%o7,	%g3
	subccc	%g6,	%l3,	%l0
loop_384:
	fabss	%f18,	%f0
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x17
	membar	#Sync
	mova	%icc,	%i7,	%o1
	bg,a	loop_385
	xnor	%i5,	%g1,	%l5
	fbu	%fcc3,	loop_386
	addccc	%o6,	%o3,	%o5
loop_385:
	edge32n	%i1,	%i2,	%o2
	std	%f6,	[%l7 + 0x50]
loop_386:
	add	%g2,	0x07B5,	%g7
	tsubcctv	%l2,	%i3,	%o4
	andncc	%g4,	%l1,	%o0
	sethi	0x0839,	%i0
	ld	[%l7 + 0x0C],	%f8
	srl	%i6,	0x0F,	%l6
	movre	%i4,	0x17D,	%g5
	tne	%xcc,	0x0
	xnorcc	%l4,	0x1512,	%g3
	sub	%o7,	0x1E82,	%l3
	brgez,a	%g6,	loop_387
	tcs	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x1246,	%l0
loop_387:
	fpsub32	%f12,	%f6,	%f2
	te	%icc,	0x5
	srlx	%o1,	%i5,	%l5
	xnorcc	%g1,	%o6,	%o3
	stb	%o5,	[%l7 + 0x2C]
	subc	%i1,	%o2,	%g2
	fzero	%f8
	fsrc1s	%f16,	%f16
	movle	%xcc,	%i2,	%g7
	call	loop_388
	edge32l	%i3,	%o4,	%l2
	xnor	%g4,	%o0,	%i0
	movcs	%xcc,	%l1,	%i6
loop_388:
	bg	loop_389
	edge8l	%i4,	%l6,	%l4
	udivcc	%g3,	0x1540,	%g5
	set	0x3C, %o2
	lduha	[%l7 + %o2] 0x89,	%o7
loop_389:
	ldx	[%l7 + 0x78],	%l3
	movcs	%icc,	%g6,	%i7
	and	%o1,	%l0,	%l5
	subccc	%g1,	%o6,	%i5
	smulcc	%o3,	0x01B4,	%o5
	edge32n	%i1,	%o2,	%g2
	add	%i2,	0x0DAD,	%g7
	fbuge,a	%fcc3,	loop_390
	movrgez	%i3,	%o4,	%l2
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f16
	movcs	%icc,	%g4,	%i0
loop_390:
	nop
	set	0x58, %o5
	stxa	%o0,	[%l7 + %o5] 0xe2
	membar	#Sync
	fmovd	%f12,	%f20
	nop
	setx	0x904649E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fsrc2	%f18,	%f18
	sdivx	%l1,	0x1EA1,	%i4
	brz	%i6,	loop_391
	movcs	%icc,	%l6,	%g3
	fmovrdlez	%g5,	%f0,	%f14
	te	%xcc,	0x6
loop_391:
	array32	%o7,	%l3,	%l4
	edge8ln	%g6,	%o1,	%l0
	swap	[%l7 + 0x68],	%l5
	bge,a,pt	%xcc,	loop_392
	nop
	setx	loop_393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%i7,	%o6,	%i5
	ta	%icc,	0x6
loop_392:
	edge32ln	%o3,	%g1,	%i1
loop_393:
	bshuffle	%f26,	%f22,	%f30
	edge8n	%o5,	%o2,	%i2
	alignaddr	%g2,	%g7,	%i3
	sdiv	%l2,	0x059D,	%g4
	fcmple32	%f18,	%f26,	%i0
	umulcc	%o0,	0x0901,	%o4
	fmuld8sux16	%f6,	%f6,	%f16
	udiv	%l1,	0x1AD7,	%i6
	tvs	%xcc,	0x6
	bn,a	loop_394
	move	%icc,	%i4,	%g3
	fzeros	%f26
	sdivx	%g5,	0x1D0F,	%o7
loop_394:
	lduw	[%l7 + 0x74],	%l3
	movrgez	%l4,	%l6,	%g6
	tg	%icc,	0x1
	movneg	%icc,	%l0,	%l5
	movrgez	%i7,	0x00A,	%o1
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
	smul	%i5,	0x17CF,	%o3
	std	%f10,	[%l7 + 0x20]
	srlx	%o6,	%g1,	%o5
loop_395:
	sethi	0x1C23,	%i1
	stbar
	movneg	%xcc,	%i2,	%o2
	sra	%g7,	%g2,	%i3
	sdivcc	%g4,	0x0BB5,	%i0
	umul	%l2,	%o0,	%l1
	bpos,a	%xcc,	loop_396
	andncc	%o4,	%i4,	%g3
	tpos	%xcc,	0x4
	addcc	%g5,	0x1F3D,	%o7
loop_396:
	nop
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i6
	edge8ln	%l3,	%l4,	%g6
	movpos	%xcc,	%l0,	%l6
	stx	%l5,	[%l7 + 0x50]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o1,	%i5,	%o3
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x0c,	%i6
	ldsw	[%l7 + 0x28],	%g1
	movrne	%o6,	%i1,	%i2
	movrne	%o2,	0x3D6,	%o5
	fmovrdlz	%g7,	%f6,	%f14
	fmovsn	%icc,	%f20,	%f4
	fbue	%fcc0,	loop_397
	tcs	%xcc,	0x7
	edge16	%g2,	%g4,	%i0
	ldsb	[%l7 + 0x0D],	%l2
loop_397:
	bvs,a	loop_398
	movrlz	%i3,	0x094,	%l1
	fble	%fcc1,	loop_399
	sethi	0x0BCC,	%o4
loop_398:
	sdivx	%i4,	0x0231,	%g3
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x89,	 0x3
loop_399:
	ldstub	[%l7 + 0x0E],	%o7
	taddcc	%g5,	0x0E0D,	%l3
	tne	%icc,	0x2
	tgu	%xcc,	0x1
	movpos	%icc,	%l4,	%g6
	movge	%xcc,	%l0,	%l6
	edge8	%l5,	%o1,	%i5
	tleu	%xcc,	0x6
	taddcctv	%i6,	%i7,	%g1
	edge8l	%o3,	%o6,	%i2
	edge16	%o2,	%o5,	%g7
	tcs	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x34] %asi,	%i1
	edge16ln	%g2,	%g4,	%i0
	umulcc	%l2,	%i3,	%o4
	std	%f20,	[%l7 + 0x20]
	ldsb	[%l7 + 0x1E],	%i4
	bg,a	%xcc,	loop_400
	ldsw	[%l7 + 0x7C],	%g3
	fmovdvs	%xcc,	%f30,	%f1
	fbu,a	%fcc2,	loop_401
loop_400:
	fbge	%fcc3,	loop_402
	tn	%xcc,	0x0
	andncc	%o0,	%l1,	%o7
loop_401:
	add	%g5,	%l3,	%l4
loop_402:
	movrne	%l0,	0x11A,	%l6
	fmovdpos	%icc,	%f1,	%f13
	ta	%icc,	0x1
	fmovrsgz	%l5,	%f6,	%f6
	fandnot1s	%f30,	%f12,	%f18
	movrlz	%o1,	%i5,	%i6
	fmovdvs	%xcc,	%f8,	%f11
	ldsw	[%l7 + 0x64],	%g6
	taddcctv	%g1,	0x16B7,	%i7
	fmovdle	%xcc,	%f10,	%f30
	flush	%l7 + 0x70
	be,pt	%xcc,	loop_403
	edge16l	%o6,	%i2,	%o2
	fmul8x16au	%f21,	%f12,	%f10
	fxors	%f19,	%f21,	%f7
loop_403:
	fbug	%fcc3,	loop_404
	ldd	[%l7 + 0x28],	%o4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xe2,	%o2
loop_404:
	taddcc	%i1,	0x02B6,	%g2
	movpos	%xcc,	%g7,	%i0
	nop
	setx	loop_405,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%l2,	%i3,	%g4
	membar	0x71
	tg	%icc,	0x0
loop_405:
	sra	%i4,	%o4,	%o0
	tvc	%xcc,	0x1
	fmovd	%f6,	%f24
	edge32l	%g3,	%o7,	%g5
	smul	%l3,	0x1CEE,	%l4
	fmovdle	%xcc,	%f27,	%f2
	tsubcc	%l1,	0x1841,	%l6
	edge16ln	%l5,	%l0,	%i5
	movre	%i6,	0x201,	%g6
	orcc	%o1,	0x096B,	%g1
	fmovsneg	%xcc,	%f2,	%f7
	ldstub	[%l7 + 0x29],	%i7
	fmovse	%icc,	%f5,	%f24
	fornot1	%f18,	%f18,	%f0
	movcc	%xcc,	%i2,	%o2
	std	%f14,	[%l7 + 0x20]
	fsrc1	%f4,	%f10
	bvc	loop_406
	sub	%o5,	0x0342,	%o6
	brnz,a	%i1,	loop_407
	movvc	%xcc,	%o3,	%g7
loop_406:
	nop
	setx	0x53BC14EDB96219A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x1C421E16FFF63300,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f26,	%f2
	udiv	%g2,	0x1836,	%i0
loop_407:
	tle	%xcc,	0x4
	tg	%icc,	0x0
	set	0x38, %o7
	stxa	%i3,	[%l7 + %o7] 0x89
	tvs	%icc,	0x3
	fbul	%fcc0,	loop_408
	te	%icc,	0x5
	taddcc	%l2,	0x0D50,	%g4
	bcc,a,pn	%xcc,	loop_409
loop_408:
	tn	%icc,	0x4
	membar	0x7B
	subccc	%i4,	0x0CF0,	%o0
loop_409:
	movneg	%xcc,	%g3,	%o7
	andncc	%o4,	%g5,	%l3
	nop
	setx	0x3697022A017E870C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f28
	fnors	%f17,	%f7,	%f11
	sll	%l4,	%l6,	%l5
	popc	0x1CED,	%l1
	fandnot2s	%f8,	%f12,	%f15
	tvs	%icc,	0x7
	stb	%l0,	[%l7 + 0x0E]
	fble,a	%fcc0,	loop_410
	bshuffle	%f6,	%f16,	%f18
	movrne	%i6,	%i5,	%o1
	fnands	%f1,	%f1,	%f16
loop_410:
	tcc	%icc,	0x2
	xor	%g1,	%i7,	%g6
	movrgz	%o2,	%o5,	%i2
	tle	%xcc,	0x6
	tsubcc	%o6,	0x0F07,	%i1
	fand	%f18,	%f8,	%f16
	andn	%g7,	%o3,	%g2
	fcmple16	%f26,	%f24,	%i0
	edge8n	%i3,	%g4,	%i4
	xor	%o0,	%l2,	%o7
	movcs	%icc,	%o4,	%g5
	tleu	%xcc,	0x4
	movcs	%xcc,	%g3,	%l4
	tl	%xcc,	0x7
	movpos	%icc,	%l6,	%l5
	stx	%l1,	[%l7 + 0x58]
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0x0
	bge,pt	%icc,	loop_411
	srax	%l3,	%i6,	%i5
	sllx	%g1,	%i7,	%o1
	bne,pt	%xcc,	loop_412
loop_411:
	movrgz	%g6,	%o5,	%i2
	fpmerge	%f4,	%f17,	%f16
	movrlez	%o6,	0x3AE,	%o2
loop_412:
	tn	%icc,	0x3
	tpos	%icc,	0x5
	bcs,pt	%icc,	loop_413
	lduh	[%l7 + 0x4E],	%i1
	movge	%xcc,	%o3,	%g7
	sth	%g2,	[%l7 + 0x0E]
loop_413:
	nop
	setx	0x0F35A80FC06388D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	taddcc	%i0,	%i3,	%i4
	fmovdvc	%xcc,	%f3,	%f8
	ldub	[%l7 + 0x47],	%o0
	sdiv	%g4,	0x1D6C,	%l2
	smulcc	%o4,	%o7,	%g3
	tsubcctv	%l4,	0x179F,	%g5
	tsubcctv	%l6,	%l5,	%l1
	fnot2	%f12,	%f16
	brlez,a	%l0,	loop_414
	fpadd32s	%f23,	%f0,	%f16
	movrlez	%i6,	0x03A,	%i5
	nop
	setx	0x9FD40F3C60DD3A67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xB6B566CCE29F9262,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f6,	%f24
loop_414:
	sdiv	%l3,	0x1D35,	%g1
	tg	%xcc,	0x7
	orncc	%i7,	%o1,	%g6
	nop
	setx	0x7DD5E671,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB8527560,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f15,	%f6
	movrne	%o5,	%i2,	%o2
	fbne	%fcc2,	loop_415
	movleu	%xcc,	%o6,	%o3
	fmuld8sux16	%f18,	%f30,	%f14
	tleu	%icc,	0x1
loop_415:
	ldd	[%l7 + 0x60],	%f4
	movleu	%xcc,	%g7,	%i1
	tg	%xcc,	0x4
	wr	%g0,	0x23,	%asi
	stxa	%i0,	[%l7 + 0x70] %asi
	membar	#Sync
	movpos	%xcc,	%i3,	%i4
	fmovdcc	%xcc,	%f12,	%f14
	sth	%o0,	[%l7 + 0x54]
	ldx	[%l7 + 0x48],	%g2
	tge	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	stwa	%l2,	[%l7 + 0x34] %asi
	addccc	%o4,	0x106C,	%o7
	fmovd	%f4,	%f18
	movrne	%g3,	0x35E,	%g4
	fmovsgu	%xcc,	%f10,	%f12
	movrlez	%g5,	%l6,	%l4
	alignaddrl	%l1,	%l0,	%i6
	fbu,a	%fcc1,	loop_416
	sth	%l5,	[%l7 + 0x5E]
	ldstub	[%l7 + 0x34],	%l3
	move	%xcc,	%i5,	%g1
loop_416:
	tg	%icc,	0x0
	fcmple16	%f14,	%f12,	%i7
	fmovde	%xcc,	%f10,	%f21
	bgu,pt	%xcc,	loop_417
	nop
	setx	0x074FBBD5DC7C1F52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x32D96D085CC501CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f26,	%f6
	array32	%o1,	%o5,	%i2
	tn	%xcc,	0x5
loop_417:
	fnegs	%f27,	%f8
	tn	%xcc,	0x5
	bneg,pt	%xcc,	loop_418
	ta	%icc,	0x4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x1C] %asi,	%f23
loop_418:
	tvc	%icc,	0x3
	movpos	%icc,	%g6,	%o6
	fbge	%fcc0,	loop_419
	taddcctv	%o2,	%g7,	%o3
	set	0x0C, %l4
	lduwa	[%l7 + %l4] 0x10,	%i0
loop_419:
	ldd	[%l7 + 0x50],	%i2
	alignaddr	%i4,	%o0,	%g2
	call	loop_420
	bg,a,pn	%xcc,	loop_421
	smulcc	%l2,	%o4,	%o7
	edge16	%i1,	%g4,	%g5
loop_420:
	mulx	%g3,	%l6,	%l4
loop_421:
	fmul8x16	%f10,	%f14,	%f22
	tcc	%icc,	0x5
	bneg,a,pt	%icc,	loop_422
	edge16n	%l0,	%i6,	%l1
	ldub	[%l7 + 0x71],	%l5
	bl,pn	%xcc,	loop_423
loop_422:
	nop
	setx	0x359028ADFA6EFA77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x5AA1E91C5100DB77,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f14
	tsubcc	%i5,	0x1628,	%l3
	movne	%icc,	%i7,	%g1
loop_423:
	fnand	%f2,	%f20,	%f4
	set	0x78, %i6
	lduha	[%l7 + %i6] 0x14,	%o5
	ldx	[%l7 + 0x60],	%o1
	nop
	set	0x10, %g6
	std	%f24,	[%l7 + %g6]
	sllx	%i2,	%o6,	%g6
	ldsw	[%l7 + 0x38],	%o2
	tpos	%xcc,	0x7
	fmovdge	%xcc,	%f20,	%f24
	orncc	%g7,	0x1756,	%o3
	addc	%i3,	%i4,	%o0
	movcs	%icc,	%i0,	%g2
	edge16l	%o4,	%l2,	%i1
	xnor	%o7,	0x0A1C,	%g5
	popc	%g4,	%l6
	tvc	%icc,	0x4
	movgu	%xcc,	%l4,	%g3
	te	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x70],	%i6
	fpsub32	%f30,	%f6,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l1,	0x03B8,	%l5
	array8	%i5,	%l3,	%l0
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x19,	%g1
	fnot1	%f8,	%f28
	edge32	%i7,	%o1,	%o5
	fpsub16s	%f28,	%f9,	%f31
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o6
	tneg	%xcc,	0x2
	ldsb	[%l7 + 0x15],	%o2
	orncc	%g7,	0x1E00,	%o3
	bneg,a,pt	%xcc,	loop_424
	alignaddrl	%g6,	%i4,	%i3
	movneg	%icc,	%i0,	%g2
	nop
	setx	0x47675C2210629289,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_424:
	sethi	0x023D,	%o4
	fmul8x16al	%f0,	%f8,	%f8
	edge8	%o0,	%l2,	%i1
	movg	%xcc,	%g5,	%o7
	subc	%l6,	%g4,	%l4
	fbuge,a	%fcc1,	loop_425
	ta	%icc,	0x0
	movne	%xcc,	%g3,	%l1
	subc	%i6,	0x07E9,	%l5
loop_425:
	bcc,a,pn	%icc,	loop_426
	nop
	setx	0xE76E51D3C1BBA862,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f24
	sll	%i5,	%l3,	%g1
	fmovsl	%xcc,	%f24,	%f1
loop_426:
	fmovrslez	%l0,	%f0,	%f7
	fmuld8sux16	%f30,	%f24,	%f20
	swap	[%l7 + 0x2C],	%o1
	fmul8x16	%f6,	%f18,	%f10
	subc	%o5,	0x0E83,	%i2
	taddcctv	%i7,	%o2,	%g7
	tvs	%xcc,	0x5
	nop
	setx	0x86C65F1796CFB40D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f6
	srl	%o3,	0x09,	%o6
	ldsw	[%l7 + 0x34],	%i4
	bne	%xcc,	loop_427
	sub	%g6,	0x1C92,	%i3
	bn	loop_428
	tcc	%icc,	0x5
loop_427:
	nop
	set	0x60, %o0
	ldswa	[%l7 + %o0] 0x88,	%g2
loop_428:
	fmul8sux16	%f10,	%f18,	%f14
	alignaddrl	%o4,	%i0,	%l2
	tgu	%icc,	0x4
	tleu	%icc,	0x5
	edge32	%o0,	%i1,	%g5
	nop
	set	0x34, %g2
	ldub	[%l7 + %g2],	%l6
	tle	%icc,	0x4
	set	0x54, %i4
	sta	%f8,	[%l7 + %i4] 0x80
	fexpand	%f11,	%f24
	ldsb	[%l7 + 0x3E],	%g4
	fmovdpos	%xcc,	%f15,	%f19
	alignaddr	%o7,	%l4,	%l1
	smul	%i6,	0x0096,	%g3
	fmovsa	%xcc,	%f9,	%f19
	fmovrslez	%l5,	%f27,	%f9
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4F] %asi,	%l3
	fmovrdgz	%g1,	%f4,	%f10
	stw	%i5,	[%l7 + 0x58]
	fmovsvc	%icc,	%f1,	%f0
	fmovsg	%xcc,	%f5,	%f27
	movrgz	%o1,	%l0,	%o5
	subccc	%i7,	%o2,	%i2
	andcc	%o3,	0x03ED,	%g7
	movrgez	%i4,	0x27E,	%o6
	ldub	[%l7 + 0x7D],	%i3
	st	%f3,	[%l7 + 0x24]
	orcc	%g2,	%g6,	%i0
	fmul8sux16	%f10,	%f26,	%f0
	edge32n	%l2,	%o0,	%i1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x4E] %asi,	%g5
	srl	%o4,	0x11,	%g4
	subccc	%o7,	0x182A,	%l6
	fnors	%f0,	%f12,	%f21
	xnorcc	%l1,	%l4,	%g3
	array32	%l5,	%i6,	%g1
	udivx	%i5,	0x1539,	%l3
	movne	%xcc,	%l0,	%o1
	fmovscs	%xcc,	%f18,	%f1
	lduw	[%l7 + 0x38],	%o5
	taddcc	%o2,	0x102B,	%i2
	movrgez	%i7,	0x030,	%g7
	tvs	%xcc,	0x4
	stb	%i4,	[%l7 + 0x13]
	fbge,a	%fcc1,	loop_429
	bn,a	loop_430
	edge32ln	%o6,	%o3,	%i3
	fsrc1s	%f14,	%f22
loop_429:
	movrne	%g2,	%i0,	%g6
loop_430:
	orn	%o0,	%i1,	%g5
	fxnors	%f31,	%f29,	%f29
	fmovdpos	%icc,	%f22,	%f19
	edge16l	%o4,	%g4,	%o7
	taddcctv	%l2,	0x1F50,	%l6
	tneg	%icc,	0x1
	movre	%l1,	0x037,	%l4
	tsubcctv	%l5,	0x1F86,	%g3
	ta	%xcc,	0x3
	sethi	0x0531,	%g1
	brlez	%i5,	loop_431
	nop
	setx	0xFB6BEED3A040F5A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xB61CB4E644341ECD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f14,	%f10
	fzeros	%f27
	membar	0x2F
loop_431:
	tpos	%icc,	0x1
	mulx	%i6,	0x1824,	%l0
	movre	%o1,	0x1E2,	%o5
	bge,a,pn	%icc,	loop_432
	fbule	%fcc1,	loop_433
	addc	%o2,	0x0B68,	%i2
	fbug,a	%fcc2,	loop_434
loop_432:
	ldx	[%l7 + 0x40],	%i7
loop_433:
	fblg,a	%fcc0,	loop_435
	movg	%xcc,	%g7,	%i4
loop_434:
	fpack16	%f14,	%f10
	ldsw	[%l7 + 0x78],	%o6
loop_435:
	te	%icc,	0x0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o3
	udiv	%l3,	0x0AE4,	%g2
	movvc	%icc,	%i3,	%i0
	addccc	%o0,	%i1,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%g6
	addccc	%o7,	%g4,	%l2
	ta	%icc,	0x7
	stb	%l1,	[%l7 + 0x30]
	fblg,a	%fcc3,	loop_436
	edge16n	%l4,	%l6,	%l5
	tsubcctv	%g3,	0x01B0,	%g1
	fnot1	%f28,	%f22
loop_436:
	prefetch	[%l7 + 0x28],	 0x3
	ldx	[%l7 + 0x60],	%i6
	udivx	%l0,	0x15D1,	%o1
	set	0x40, %i2
	lda	[%l7 + %i2] 0x19,	%f13
	fbue,a	%fcc0,	loop_437
	subc	%o5,	0x19E1,	%i5
	array8	%i2,	%i7,	%g7
	brz	%i4,	loop_438
loop_437:
	fnegd	%f8,	%f18
	prefetch	[%l7 + 0x24],	 0x2
	movle	%icc,	%o6,	%o2
loop_438:
	orcc	%o3,	0x1CC9,	%g2
	edge32n	%i3,	%i0,	%o0
	nop
	set	0x44, %l6
	prefetch	[%l7 + %l6],	 0x1
	array32	%l3,	%i1,	%g5
	set	0x30, %l5
	ldda	[%l7 + %l5] 0x2e,	%g6
	movn	%icc,	%o4,	%o7
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g4
	fmovsle	%icc,	%f6,	%f3
	tcs	%xcc,	0x6
	fbue	%fcc0,	loop_439
	tsubcctv	%l1,	0x1D19,	%l4
	smulcc	%l6,	0x1D69,	%l2
	tcc	%icc,	0x7
loop_439:
	nop
	setx	0x219E7FAA2EF03254,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f2
	bvc,a	loop_440
	movgu	%xcc,	%l5,	%g3
	xorcc	%i6,	%l0,	%o1
	xor	%o5,	0x0406,	%g1
loop_440:
	add	%i2,	0x0257,	%i5
	smul	%g7,	0x011F,	%i7
	fmovsgu	%xcc,	%f30,	%f17
	array32	%o6,	%i4,	%o3
	bvs,a,pn	%icc,	loop_441
	movge	%xcc,	%g2,	%i3
	xnorcc	%i0,	%o0,	%o2
	array32	%l3,	%g5,	%g6
loop_441:
	tvc	%xcc,	0x5
	sethi	0x0D08,	%o4
	fxor	%f2,	%f20,	%f0
	movcc	%xcc,	%o7,	%g4
	fmovdvc	%icc,	%f10,	%f6
	sir	0x1ACD
	andn	%l1,	0x1F3F,	%i1
	fbo,a	%fcc1,	loop_442
	xnorcc	%l4,	0x1D5F,	%l6
	orn	%l2,	%g3,	%i6
	movvs	%icc,	%l5,	%o1
loop_442:
	alignaddrl	%o5,	%g1,	%l0
	set	0x5C, %o6
	stwa	%i5,	[%l7 + %o6] 0x14
	tg	%xcc,	0x0
	sethi	0x0734,	%i2
	taddcc	%i7,	%g7,	%i4
	subccc	%o3,	%o6,	%i3
	fmovdn	%icc,	%f10,	%f8
	set	0x4E, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i0
	tvc	%icc,	0x1
	wr	%g0,	0x2b,	%asi
	stxa	%o0,	[%l7 + 0x08] %asi
	membar	#Sync
	subccc	%o2,	0x0654,	%l3
	brnz	%g5,	loop_443
	fble,a	%fcc3,	loop_444
	fxor	%f0,	%f14,	%f10
	fpsub16	%f24,	%f26,	%f18
loop_443:
	edge32	%g6,	%g2,	%o7
loop_444:
	fcmpeq32	%f14,	%f12,	%o4
	edge32	%l1,	%g4,	%l4
	srl	%l6,	0x0C,	%i1
	fbuge,a	%fcc2,	loop_445
	subcc	%l2,	%g3,	%l5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%i6
loop_445:
	edge8ln	%o5,	%g1,	%l0
	array16	%i5,	%i2,	%i7
	ldd	[%l7 + 0x10],	%f12
	fbn,a	%fcc2,	loop_446
	brlz,a	%o1,	loop_447
	movleu	%xcc,	%i4,	%o3
	fmovdl	%icc,	%f23,	%f3
loop_446:
	fzero	%f14
loop_447:
	nop
	setx	0xBEF7CEDABCC277C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x77FE6850382FCFC0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f4,	%f20
	edge32l	%o6,	%g7,	%i0
	srl	%i3,	0x05,	%o2
	xorcc	%o0,	%g5,	%g6
	alignaddrl	%g2,	%o7,	%o4
	fmovsleu	%icc,	%f0,	%f7
	movle	%icc,	%l1,	%g4
	subc	%l3,	0x1569,	%l4
	sll	%i1,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvc	%xcc,	0x4
	orn	%l2,	%l5,	%g3
	edge8l	%i6,	%o5,	%l0
	srl	%i5,	%g1,	%i7
	addcc	%o1,	%i4,	%o3
	sethi	0x05A8,	%i2
	fpsub32s	%f16,	%f5,	%f25
	ldsh	[%l7 + 0x2C],	%g7
	stx	%i0,	[%l7 + 0x68]
	fmovrslz	%o6,	%f14,	%f5
	bvc,pt	%xcc,	loop_448
	bpos	%icc,	loop_449
	fmuld8sux16	%f8,	%f8,	%f28
	tvs	%icc,	0x5
loop_448:
	fmovsne	%icc,	%f11,	%f21
loop_449:
	movg	%xcc,	%o2,	%i3
	fmovscc	%xcc,	%f30,	%f28
	alignaddrl	%o0,	%g6,	%g5
	ldd	[%l7 + 0x10],	%f2
	sethi	0x0B9B,	%o7
	fmovdneg	%icc,	%f28,	%f21
	edge16ln	%g2,	%o4,	%g4
	fmovrdne	%l3,	%f2,	%f0
	nop
	setx	0xB98A45A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f9
	udivx	%l4,	0x1AB1,	%i1
	tsubcc	%l6,	0x12B5,	%l1
	flush	%l7 + 0x3C
	ta	%xcc,	0x7
	st	%f30,	[%l7 + 0x14]
	movne	%xcc,	%l5,	%g3
	edge16n	%i6,	%l2,	%o5
	edge32n	%i5,	%l0,	%i7
	edge8l	%g1,	%i4,	%o3
	set	0x28, %g4
	prefetcha	[%l7 + %g4] 0x11,	 0x2
	edge16l	%g7,	%i0,	%i2
	fmovrdgz	%o2,	%f8,	%f4
	set	0x58, %g3
	ldxa	[%l7 + %g3] 0x89,	%i3
	smulcc	%o0,	0x1E53,	%o6
	xorcc	%g5,	%o7,	%g6
	array16	%g2,	%g4,	%o4
	tsubcc	%l3,	0x0ED0,	%l4
	edge16	%i1,	%l1,	%l5
	tge	%icc,	0x5
	bvc,a,pn	%icc,	loop_450
	bg,pt	%icc,	loop_451
	edge8n	%g3,	%l6,	%i6
	edge8n	%o5,	%l2,	%i5
loop_450:
	xnor	%l0,	0x1C3C,	%g1
loop_451:
	fornot2	%f22,	%f24,	%f18
	fmovrdne	%i4,	%f6,	%f16
	sdiv	%i7,	0x1CB4,	%o1
	taddcctv	%g7,	0x102D,	%i0
	edge16n	%i2,	%o3,	%i3
	be,a	%xcc,	loop_452
	bshuffle	%f10,	%f16,	%f26
	std	%f10,	[%l7 + 0x58]
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f21
loop_452:
	ldd	[%l7 + 0x20],	%f4
	movvc	%xcc,	%o2,	%o0
	tpos	%xcc,	0x5
	orn	%g5,	%o7,	%o6
	fba	%fcc2,	loop_453
	tge	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x0
loop_453:
	orncc	%g2,	0x054F,	%g6
	movne	%icc,	%o4,	%g4
	fmovsg	%xcc,	%f13,	%f21
	movcs	%icc,	%l3,	%l4
	tleu	%icc,	0x0
	fmuld8ulx16	%f2,	%f10,	%f2
	sir	0x0966
	fmovspos	%xcc,	%f14,	%f12
	set	0x4E, %i1
	lduba	[%l7 + %i1] 0x19,	%i1
	ba,a,pt	%xcc,	loop_454
	add	%l1,	0x0120,	%l5
	array8	%l6,	%g3,	%o5
	sll	%l2,	0x0C,	%i5
loop_454:
	flush	%l7 + 0x1C
	set	0x1A, %o1
	lduha	[%l7 + %o1] 0x14,	%i6
	srl	%l0,	%i4,	%i7
	andcc	%o1,	0x1BAC,	%g1
	edge8	%g7,	%i2,	%i0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%o2
	tcc	%icc,	0x4
	tsubcctv	%o0,	%g5,	%o3
	tcs	%xcc,	0x5
	nop
	set	0x4C, %l3
	lduh	[%l7 + %l3],	%o7
	tcc	%icc,	0x0
	movpos	%xcc,	%o6,	%g2
	movvs	%icc,	%g6,	%g4
	array32	%l3,	%o4,	%l4
	edge8ln	%l1,	%i1,	%l6
	xor	%g3,	0x14E1,	%o5
	prefetch	[%l7 + 0x5C],	 0x0
	array32	%l2,	%l5,	%i5
	brnz,a	%i6,	loop_455
	fmovrdgz	%i4,	%f16,	%f30
	fbug	%fcc2,	loop_456
	fmovda	%xcc,	%f27,	%f22
loop_455:
	nop
	setx	loop_457,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	std	%f2,	[%l7 + 0x50]
loop_456:
	bgu,a,pn	%xcc,	loop_458
	addcc	%l0,	%o1,	%i7
loop_457:
	xnorcc	%g1,	0x1BFA,	%g7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4B] %asi,	%i2
loop_458:
	edge16ln	%i0,	%o2,	%o0
	lduh	[%l7 + 0x10],	%g5
	ldstub	[%l7 + 0x50],	%o3
	tne	%icc,	0x5
	edge32ln	%o7,	%i3,	%o6
	movrlez	%g2,	%g4,	%g6
	xor	%o4,	%l3,	%l4
	smul	%l1,	0x06A5,	%l6
	set	0x71, %g5
	ldsba	[%l7 + %g5] 0x19,	%i1
	movrgz	%g3,	0x07D,	%o5
	fpadd16	%f30,	%f4,	%f18
	fmovda	%xcc,	%f28,	%f25
	set	0x70, %i5
	sta	%f10,	[%l7 + %i5] 0x89
	tpos	%xcc,	0x7
	membar	0x21
	sdivx	%l2,	0x04CB,	%l5
	movle	%xcc,	%i6,	%i4
	fbl,a	%fcc3,	loop_459
	brnz	%i5,	loop_460
	fmovrslz	%l0,	%f20,	%f27
	bg,pn	%icc,	loop_461
loop_459:
	edge16	%o1,	%i7,	%g1
loop_460:
	edge32n	%i2,	%i0,	%g7
	movrlez	%o0,	0x2DB,	%g5
loop_461:
	nop
	setx	loop_462,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbug	%fcc3,	loop_463
	udivx	%o3,	0x05C6,	%o2
	tcs	%xcc,	0x5
loop_462:
	flush	%l7 + 0x14
loop_463:
	srax	%o7,	%i3,	%o6
	sra	%g2,	0x05,	%g4
	flush	%l7 + 0x7C
	alignaddr	%o4,	%g6,	%l4
	fbg	%fcc0,	loop_464
	edge32l	%l1,	%l6,	%i1
	ta	%icc,	0x1
	flush	%l7 + 0x78
loop_464:
	tpos	%icc,	0x1
	sll	%g3,	%l3,	%o5
	movcs	%xcc,	%l2,	%i6
	nop
	set	0x24, %i7
	lduh	[%l7 + %i7],	%l5
	movrgez	%i5,	0x349,	%l0
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i4
	edge8	%i7,	%o1,	%i2
	fsrc2s	%f5,	%f4
	udivcc	%g1,	0x01D5,	%i0
	srlx	%g7,	%g5,	%o3
	sethi	0x0911,	%o0
	fandnot1	%f30,	%f20,	%f16
	ld	[%l7 + 0x70],	%f4
	bleu,pn	%xcc,	loop_465
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f21,	%f6,	%f6
	srax	%o2,	%o7,	%o6
loop_465:
	movvs	%icc,	%g2,	%g4
	edge16n	%i3,	%o4,	%g6
	udivx	%l1,	0x1F0B,	%l4
	bneg,a,pn	%icc,	loop_466
	tcs	%icc,	0x6
	move	%xcc,	%i1,	%l6
	umul	%l3,	%o5,	%l2
loop_466:
	fba	%fcc3,	loop_467
	edge8l	%g3,	%i6,	%i5
	fmovrdgez	%l5,	%f14,	%f8
	fmovdl	%icc,	%f20,	%f1
loop_467:
	swap	[%l7 + 0x6C],	%l0
	movrgez	%i7,	0x379,	%o1
	sdivx	%i4,	0x0BE2,	%i2
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x04,	%g0
	fornot1	%f20,	%f30,	%f14
	lduh	[%l7 + 0x7A],	%g7
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f6
	mulscc	%g5,	%o3,	%o0
	fmovsg	%xcc,	%f26,	%f4
	pdist	%f26,	%f20,	%f20
	brlez,a	%i0,	loop_468
	tneg	%xcc,	0x1
	fmovrsgez	%o7,	%f30,	%f5
	movleu	%xcc,	%o2,	%g2
loop_468:
	sdivx	%o6,	0x01B6,	%g4
	tneg	%icc,	0x0
	fmul8x16al	%f23,	%f4,	%f28
	orcc	%i3,	0x038D,	%o4
	mulx	%g6,	0x124A,	%l1
	fsrc2s	%f0,	%f3
	smulcc	%i1,	0x02A6,	%l4
	set	0x60, %l2
	ldda	[%l7 + %l2] 0x24,	%l2
	move	%xcc,	%l6,	%l2
	tsubcctv	%o5,	0x019D,	%i6
	tsubcc	%g3,	0x00BE,	%l5
	sdiv	%l0,	0x000D,	%i7
	srax	%i5,	0x01,	%i4
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%i2
	edge16n	%g1,	%g7,	%o1
	call	loop_469
	te	%icc,	0x4
	sth	%o3,	[%l7 + 0x16]
	fbe,a	%fcc2,	loop_470
loop_469:
	ldstub	[%l7 + 0x56],	%o0
	movrgz	%g5,	0x291,	%i0
	edge8	%o2,	%o7,	%o6
loop_470:
	edge16l	%g4,	%g2,	%i3
	fmovrdgz	%g6,	%f8,	%f14
	popc	0x132C,	%o4
	alignaddrl	%l1,	%i1,	%l4
	xorcc	%l3,	%l6,	%l2
	orcc	%o5,	0x10BE,	%i6
	movrlz	%l5,	0x2F8,	%g3
	taddcc	%l0,	0x0AA3,	%i5
	movrlz	%i7,	0x0E3,	%i4
	fbg	%fcc1,	loop_471
	udivcc	%i2,	0x18FE,	%g1
	edge32l	%o1,	%g7,	%o0
	nop
	setx	0xA2E3BE77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xE4866B47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f4,	%f26
loop_471:
	movrgz	%o3,	%g5,	%o2
	sdivcc	%i0,	0x0DB4,	%o7
	alignaddr	%g4,	%g2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g6,	0x0E6D,	%o6
	bvc	%xcc,	loop_472
	sub	%o4,	%i1,	%l4
	fcmpgt32	%f10,	%f18,	%l1
	move	%icc,	%l6,	%l2
loop_472:
	fmovsleu	%xcc,	%f12,	%f20
	fmovsleu	%icc,	%f4,	%f23
	set	0x3C, %o4
	stha	%o5,	[%l7 + %o4] 0x88
	addccc	%l3,	0x0A5E,	%i6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x3C] %asi,	%g3
	orcc	%l0,	%i5,	%i7
	srl	%i4,	0x08,	%i2
	tg	%icc,	0x7
	bvc,pt	%xcc,	loop_473
	movrgz	%l5,	%g1,	%o1
	fmovda	%xcc,	%f13,	%f18
	movgu	%xcc,	%g7,	%o3
loop_473:
	popc	0x1F85,	%o0
	fornot1s	%f5,	%f5,	%f16
	ldub	[%l7 + 0x35],	%o2
	array32	%i0,	%g5,	%g4
	sll	%o7,	%i3,	%g6
	be	loop_474
	sdivx	%g2,	0x0EB6,	%o6
	bg	%icc,	loop_475
	stb	%o4,	[%l7 + 0x55]
loop_474:
	faligndata	%f22,	%f14,	%f20
	ldub	[%l7 + 0x29],	%l4
loop_475:
	udiv	%l1,	0x15B6,	%l6
	set	0x10, %o5
	stxa	%l2,	[%l7 + %o5] 0x23
	membar	#Sync
	xorcc	%i1,	0x15D2,	%l3
	movl	%icc,	%o5,	%i6
	fornot2	%f22,	%f14,	%f8
	edge8l	%l0,	%g3,	%i5
	fnegs	%f18,	%f29
	sdivcc	%i7,	0x1ABA,	%i4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x15] %asi,	%l5
	tle	%xcc,	0x1
	ta	%xcc,	0x2
	fcmpgt32	%f8,	%f6,	%i2
	fpackfix	%f16,	%f1
	umulcc	%g1,	%o1,	%o3
	tpos	%icc,	0x4
	sth	%o0,	[%l7 + 0x34]
	fones	%f26
	edge8n	%o2,	%i0,	%g7
	fba	%fcc0,	loop_476
	edge8l	%g5,	%o7,	%g4
	nop
	fitos	%f14,	%f11
	sub	%g6,	%g2,	%o6
loop_476:
	andn	%i3,	0x0AF3,	%o4
	subccc	%l4,	0x0D01,	%l6
	smul	%l2,	0x0021,	%l1
	xnor	%l3,	%o5,	%i6
	taddcc	%i1,	%l0,	%i5
	wr	%g0,	0x80,	%asi
	stba	%g3,	[%l7 + 0x6D] %asi
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x18,	%i7,	%l5
	edge8l	%i2,	%i4,	%o1
	set	0x120, %i0
	ldxa	[%g0 + %i0] 0x52,	%g1
	orcc	%o3,	%o2,	%o0
	xnor	%i0,	%g5,	%g7
	movrlez	%g4,	%g6,	%g2
	st	%f7,	[%l7 + 0x40]
	fpmerge	%f27,	%f1,	%f18
	srax	%o6,	0x12,	%o7
	umul	%o4,	0x1527,	%i3
	sra	%l6,	%l4,	%l1
	movn	%xcc,	%l3,	%l2
	tle	%icc,	0x5
	add	%i6,	0x0407,	%o5
	fsrc2	%f8,	%f0
	edge16l	%i1,	%i5,	%l0
	fpsub32s	%f14,	%f31,	%f15
	fsrc1s	%f0,	%f28
	orcc	%i7,	0x1A29,	%l5
	pdist	%f28,	%f14,	%f18
	taddcctv	%i2,	0x1B8E,	%g3
	tcs	%icc,	0x3
	fbo,a	%fcc0,	loop_477
	fsrc2	%f12,	%f4
	popc	0x074B,	%i4
	tgu	%xcc,	0x7
loop_477:
	udivx	%g1,	0x0696,	%o1
	ta	%xcc,	0x3
	set	0x6C, %g1
	sta	%f24,	[%l7 + %g1] 0x88
	fmovsle	%icc,	%f19,	%f27
	tge	%icc,	0x1
	edge8ln	%o3,	%o2,	%o0
	tsubcc	%g5,	%g7,	%i0
	sdiv	%g4,	0x091A,	%g6
	fnands	%f11,	%f0,	%f11
	fbne,a	%fcc0,	loop_478
	srl	%o6,	%g2,	%o7
	alignaddrl	%i3,	%o4,	%l6
	ldsb	[%l7 + 0x08],	%l4
loop_478:
	edge32	%l3,	%l2,	%i6
	movg	%xcc,	%l1,	%i1
	fmovsle	%icc,	%f29,	%f23
	movne	%icc,	%i5,	%l0
	tne	%xcc,	0x3
	mulscc	%i7,	%o5,	%l5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x34] %asi,	%f22
	subcc	%i2,	%i4,	%g3
	tsubcctv	%g1,	%o1,	%o3
	andncc	%o2,	%g5,	%g7
	bl,a,pt	%xcc,	loop_479
	fbue,a	%fcc3,	loop_480
	movcc	%icc,	%i0,	%g4
	mulx	%o0,	%g6,	%o6
loop_479:
	fands	%f11,	%f7,	%f24
loop_480:
	fbg	%fcc0,	loop_481
	andcc	%o7,	0x0A10,	%g2
	alignaddrl	%i3,	%l6,	%l4
	tcs	%xcc,	0x4
loop_481:
	edge8	%o4,	%l3,	%i6
	movrlz	%l2,	%l1,	%i1
	fmovsge	%icc,	%f16,	%f21
	tn	%icc,	0x7
	edge32ln	%l0,	%i7,	%o5
	sub	%i5,	%i2,	%i4
	and	%g3,	0x06C9,	%g1
	sub	%o1,	%l5,	%o2
	edge32ln	%g5,	%o3,	%i0
	udivx	%g4,	0x195E,	%o0
	alignaddr	%g6,	%o6,	%g7
	orcc	%o7,	%g2,	%l6
	fbg,a	%fcc0,	loop_482
	sra	%l4,	0x0C,	%i3
	bg,a,pn	%xcc,	loop_483
	fbo	%fcc0,	loop_484
loop_482:
	fpackfix	%f6,	%f29
	tcc	%xcc,	0x3
loop_483:
	movg	%icc,	%o4,	%l3
loop_484:
	fmovdneg	%xcc,	%f30,	%f30
	fxnor	%f30,	%f10,	%f10
	fmovrse	%l2,	%f28,	%f8
	addcc	%i6,	0x15D9,	%i1
	xor	%l0,	0x1F24,	%i7
	bvs,pn	%icc,	loop_485
	nop
	setx loop_486, %l0, %l1
	jmpl %l1, %l1
	fmovsleu	%xcc,	%f25,	%f11
	andncc	%o5,	%i2,	%i5
loop_485:
	movg	%icc,	%g3,	%g1
loop_486:
	tpos	%xcc,	0x4
	bneg,pt	%xcc,	loop_487
	nop
	fitos	%f11,	%f7
	tcc	%xcc,	0x3
	brz	%o1,	loop_488
loop_487:
	bleu	loop_489
	smulcc	%l5,	%o2,	%i4
	srlx	%o3,	0x00,	%g5
loop_488:
	tgu	%xcc,	0x0
loop_489:
	lduw	[%l7 + 0x2C],	%g4
	fors	%f0,	%f10,	%f3
	movneg	%xcc,	%o0,	%i0
	fbuge	%fcc1,	loop_490
	faligndata	%f14,	%f10,	%f14
	movpos	%icc,	%g6,	%g7
	set	0x40, %l0
	sta	%f16,	[%l7 + %l0] 0x18
loop_490:
	edge8l	%o6,	%o7,	%g2
	tcs	%xcc,	0x0
	andncc	%l4,	%i3,	%l6
	fmovdvs	%xcc,	%f23,	%f26
	nop
	fitos	%f3,	%f27
	fstoi	%f27,	%f2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l3
	movvs	%xcc,	%l2,	%o4
	sir	0x1EAE
	movg	%icc,	%i6,	%i1
	tge	%icc,	0x5
	tle	%xcc,	0x6
	movpos	%icc,	%i7,	%l1
	fble,a	%fcc3,	loop_491
	movg	%icc,	%l0,	%o5
	fexpand	%f17,	%f0
	movrne	%i2,	0x2D1,	%i5
loop_491:
	bleu,a	%xcc,	loop_492
	edge8ln	%g3,	%o1,	%g1
	fpsub32	%f18,	%f4,	%f26
	andcc	%l5,	%o2,	%i4
loop_492:
	movge	%xcc,	%o3,	%g5
	orncc	%g4,	%i0,	%o0
	set	0x6C, %o7
	stba	%g6,	[%l7 + %o7] 0xeb
	membar	#Sync
	tleu	%icc,	0x7
	srl	%g7,	0x0C,	%o7
	smulcc	%g2,	%o6,	%i3
	fmovsneg	%icc,	%f15,	%f23
	srlx	%l6,	0x18,	%l3
	xnor	%l2,	0x0A0F,	%l4
	edge16n	%i6,	%i1,	%o4
	fmovd	%f12,	%f30
	fors	%f0,	%f0,	%f12
	udiv	%l1,	0x1B69,	%l0
	xor	%i7,	%i2,	%i5
	srl	%o5,	0x1F,	%o1
	ldstub	[%l7 + 0x4F],	%g1
	sll	%g3,	0x10,	%l5
	nop
	setx	0xC73FD07162513390,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f10
	movvs	%xcc,	%i4,	%o3
	orn	%g5,	%o2,	%i0
	alignaddrl	%g4,	%o0,	%g7
	xor	%g6,	0x00A1,	%g2
	fbg,a	%fcc3,	loop_493
	edge16l	%o6,	%i3,	%o7
	movn	%icc,	%l6,	%l3
	andcc	%l2,	%l4,	%i6
loop_493:
	swap	[%l7 + 0x64],	%o4
	membar	0x48
	alignaddr	%l1,	%i1,	%l0
	array32	%i2,	%i5,	%i7
	fors	%f8,	%f4,	%f2
	srlx	%o1,	%o5,	%g1
	fbe	%fcc0,	loop_494
	fsrc2	%f16,	%f4
	brgez,a	%l5,	loop_495
	nop
	setx	loop_496,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_494:
	orn	%g3,	0x0D51,	%i4
	te	%icc,	0x2
loop_495:
	andcc	%o3,	0x0206,	%g5
loop_496:
	edge16	%i0,	%o2,	%o0
	fbule,a	%fcc2,	loop_497
	fmovda	%icc,	%f23,	%f27
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g7
loop_497:
	fmovsl	%icc,	%f2,	%f7
	fmovsneg	%xcc,	%f4,	%f3
	xorcc	%g6,	0x0AF7,	%g2
	array8	%o6,	%g4,	%o7
	orcc	%i3,	0x131E,	%l3
	fones	%f24
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l2
	brgz	%l4,	loop_498
	nop
	setx	0x599DE216E05DF1C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i6
loop_498:
	movcc	%icc,	%l6,	%o4
	ba,a,pt	%xcc,	loop_499
	tvs	%icc,	0x6
	array16	%i1,	%l1,	%i2
	smulcc	%l0,	%i7,	%o1
loop_499:
	ldub	[%l7 + 0x42],	%i5
	array16	%o5,	%g1,	%l5
	movle	%icc,	%g3,	%i4
	tcs	%xcc,	0x0
	sra	%o3,	%i0,	%o2
	orcc	%g5,	%o0,	%g6
	edge32l	%g7,	%o6,	%g4
	movg	%xcc,	%g2,	%o7
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%i2
	tle	%icc,	0x3
	fmuld8ulx16	%f29,	%f2,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x04,	%l3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fblg,a	%fcc1,	loop_500
	or	%l2,	0x1BB9,	%i6
	tle	%icc,	0x2
	tvc	%icc,	0x7
loop_500:
	udivcc	%l4,	0x02F8,	%o4
	tcc	%icc,	0x4
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x81,	%l6
	sll	%i1,	0x10,	%i2
	movcs	%icc,	%l0,	%i7
	movneg	%xcc,	%l1,	%i5
	tcc	%icc,	0x7
	movn	%xcc,	%o1,	%g1
	fnands	%f31,	%f21,	%f24
	umul	%l5,	%g3,	%o5
	movrgez	%o3,	0x18F,	%i0
	movvc	%icc,	%o2,	%i4
	fabsd	%f6,	%f2
	fbe	%fcc0,	loop_501
	nop
	setx	0xE044256E,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	ble	%icc,	loop_502
	bcc	%xcc,	loop_503
loop_501:
	sdivcc	%g5,	0x1327,	%g6
	movneg	%xcc,	%o0,	%o6
loop_502:
	edge8	%g4,	%g2,	%g7
loop_503:
	alignaddr	%i3,	%o7,	%l3
	tpos	%xcc,	0x4
	xor	%i6,	0x0BBE,	%l2
	edge32n	%o4,	%l6,	%i1
	add	%i2,	%l0,	%i7
	nop
	setx	0x1AF0DC2B68AA3160,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2E32473C42E586C9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f2,	%f26
	fbne	%fcc1,	loop_504
	movpos	%icc,	%l1,	%l4
	tvc	%xcc,	0x5
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x22,	%o0
loop_504:
	st	%f29,	[%l7 + 0x28]
	fbo	%fcc0,	loop_505
	sllx	%i5,	0x0A,	%g1
	fpsub16s	%f3,	%f4,	%f25
	sdivcc	%g3,	0x0B21,	%o5
loop_505:
	sdivcc	%l5,	0x194F,	%o3
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i0
	xnor	%o2,	%i4,	%g6
	fnot2	%f28,	%f4
	fands	%f31,	%f11,	%f23
	or	%g5,	%o0,	%o6
	sdiv	%g2,	0x1722,	%g4
	tsubcctv	%g7,	0x1255,	%i3
	srl	%o7,	0x07,	%l3
	popc	%i6,	%o4
	movgu	%xcc,	%l2,	%i1
	tvc	%icc,	0x3
	lduw	[%l7 + 0x48],	%i2
	mulscc	%l6,	%l0,	%l1
	movleu	%xcc,	%i7,	%o1
	bvc,a,pt	%xcc,	loop_506
	srlx	%l4,	0x03,	%i5
	bleu,a,pn	%xcc,	loop_507
	tcc	%xcc,	0x4
loop_506:
	tcs	%icc,	0x0
	fand	%f28,	%f24,	%f16
loop_507:
	srax	%g3,	%g1,	%l5
	bvs,pn	%icc,	loop_508
	nop
	setx	0x1345872B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f11
	umulcc	%o5,	%o3,	%o2
	tge	%icc,	0x7
loop_508:
	fbg	%fcc1,	loop_509
	movrgz	%i4,	%i0,	%g6
	nop
	setx loop_510, %l0, %l1
	jmpl %l1, %o0
	bpos,a,pn	%xcc,	loop_511
loop_509:
	fnor	%f18,	%f0,	%f20
	fbn,a	%fcc1,	loop_512
loop_510:
	andn	%o6,	%g2,	%g5
loop_511:
	fmovsgu	%xcc,	%f8,	%f13
	array16	%g7,	%g4,	%o7
loop_512:
	fnot2s	%f8,	%f25
	movpos	%icc,	%i3,	%l3
	mulx	%o4,	0x163D,	%l2
	fpack32	%f24,	%f8,	%f26
	xorcc	%i6,	0x0C58,	%i2
	xnorcc	%l6,	0x1868,	%l0
	orncc	%l1,	%i1,	%o1
	brgez,a	%l4,	loop_513
	ta	%icc,	0x3
	array16	%i5,	%i7,	%g1
	bcc,a,pt	%icc,	loop_514
loop_513:
	fmovdne	%xcc,	%f2,	%f25
	set	0x2A, %o3
	lduha	[%l7 + %o3] 0x04,	%g3
loop_514:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o5
	fxnors	%f0,	%f25,	%f4
	udivcc	%o3,	0x04B0,	%o2
	fmovdn	%xcc,	%f5,	%f13
	fmovdpos	%icc,	%f8,	%f15
	popc	%i4,	%i0
	fmovdgu	%xcc,	%f7,	%f21
	stb	%l5,	[%l7 + 0x50]
	movrgz	%g6,	%o6,	%o0
	smulcc	%g2,	0x0557,	%g5
	sllx	%g4,	0x1E,	%o7
	edge32ln	%g7,	%i3,	%l3
	movl	%xcc,	%o4,	%l2
	movle	%xcc,	%i2,	%l6
	edge8	%i6,	%l1,	%i1
	movne	%icc,	%l0,	%o1
	movrgez	%i5,	0x2F8,	%i7
	fbue,a	%fcc1,	loop_515
	ta	%xcc,	0x1
	fzeros	%f14
	udivcc	%l4,	0x1F5D,	%g1
loop_515:
	brlz,a	%o5,	loop_516
	mulx	%o3,	0x034B,	%o2
	set	0x3C, %o0
	stha	%i4,	[%l7 + %o0] 0x11
loop_516:
	sub	%g3,	%i0,	%g6
	brz,a	%l5,	loop_517
	ba	loop_518
	or	%o6,	0x03EE,	%o0
	srax	%g5,	0x0E,	%g2
loop_517:
	udivx	%g4,	0x184F,	%g7
loop_518:
	tvc	%xcc,	0x2
	ldd	[%l7 + 0x10],	%f0
	bcc,pt	%icc,	loop_519
	alignaddr	%o7,	%l3,	%i3
	fxnor	%f8,	%f30,	%f4
	tvc	%icc,	0x3
loop_519:
	array16	%o4,	%i2,	%l6
	te	%xcc,	0x7
	tle	%icc,	0x6
	wr	%g0,	0x81,	%asi
	sta	%f22,	[%l7 + 0x7C] %asi
	fmul8ulx16	%f8,	%f10,	%f20
	tleu	%icc,	0x4
	sdivx	%i6,	0x0E1C,	%l2
	sth	%l1,	[%l7 + 0x52]
	fnors	%f18,	%f18,	%f6
	subcc	%l0,	0x1387,	%o1
	fmul8ulx16	%f4,	%f28,	%f28
	fpadd32s	%f5,	%f6,	%f15
	movgu	%xcc,	%i1,	%i7
	tne	%icc,	0x6
	array8	%i5,	%g1,	%o5
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
	nop
	setx	loop_520,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x1
	smul	%o2,	0x0978,	%i4
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x17,	%f0
loop_520:
	movrlz	%g3,	0x2CD,	%o3
	sethi	0x1635,	%i0
	set	0x40, %g2
	stwa	%l5,	[%l7 + %g2] 0x89
	sra	%o6,	%o0,	%g5
	orcc	%g6,	%g2,	%g4
	edge32	%o7,	%l3,	%g7
	tsubcc	%i3,	%i2,	%l6
	tcc	%icc,	0x5
	movcc	%xcc,	%o4,	%l2
	movneg	%xcc,	%i6,	%l0
	bvs,pt	%xcc,	loop_521
	umul	%o1,	%l1,	%i1
	fsrc2	%f8,	%f10
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f9
loop_521:
	fnegd	%f8,	%f22
	membar	0x73
	orcc	%i7,	0x19E6,	%g1
	set	0x45, %i2
	lduba	[%l7 + %i2] 0x80,	%i5
	fornot2	%f24,	%f4,	%f26
	tsubcctv	%l4,	0x09CF,	%o5
	tgu	%icc,	0x0
	brlz	%o2,	loop_522
	fble,a	%fcc1,	loop_523
	movle	%xcc,	%i4,	%o3
	tge	%icc,	0x6
loop_522:
	edge16n	%i0,	%g3,	%o6
loop_523:
	tneg	%icc,	0x6
	fbg	%fcc3,	loop_524
	fmovdle	%xcc,	%f16,	%f7
	bpos,a	%xcc,	loop_525
	edge32	%l5,	%o0,	%g5
loop_524:
	fmovrsgz	%g6,	%f28,	%f26
	fba,a	%fcc0,	loop_526
loop_525:
	udivx	%g2,	0x01F8,	%o7
	addcc	%l3,	%g4,	%g7
	te	%xcc,	0x2
loop_526:
	array32	%i2,	%i3,	%o4
	and	%l2,	0x0D72,	%l6
	fmovsg	%icc,	%f16,	%f6
	movgu	%xcc,	%i6,	%o1
	fba	%fcc3,	loop_527
	fbu	%fcc2,	loop_528
	edge16ln	%l1,	%l0,	%i7
	mulscc	%i1,	0x102F,	%i5
loop_527:
	orcc	%g1,	0x0079,	%o5
loop_528:
	te	%xcc,	0x4
	andn	%l4,	0x18B9,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x18,	%i4,	%o3
	srl	%g3,	0x19,	%i0
	movn	%icc,	%o6,	%l5
	ba,a,pt	%xcc,	loop_529
	movrlez	%o0,	%g5,	%g2
	movcs	%xcc,	%g6,	%o7
	fmovrslz	%l3,	%f19,	%f4
loop_529:
	bn,pn	%icc,	loop_530
	faligndata	%f18,	%f4,	%f16
	fmuld8sux16	%f30,	%f16,	%f8
	fmovdl	%icc,	%f2,	%f19
loop_530:
	movg	%icc,	%g7,	%i2
	prefetch	[%l7 + 0x78],	 0x3
	mova	%icc,	%g4,	%i3
	nop
	setx	loop_531,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%l2,	%l6,	%o4
	sll	%o1,	0x0B,	%l1
	fpadd32	%f16,	%f18,	%f24
loop_531:
	movpos	%xcc,	%i6,	%l0
	movn	%icc,	%i1,	%i7
	mova	%xcc,	%i5,	%g1
	movge	%xcc,	%o5,	%o2
	fandnot2	%f2,	%f0,	%f18
	fmovsleu	%xcc,	%f25,	%f20
	set	0x58, %l5
	lda	[%l7 + %l5] 0x0c,	%f4
	movvc	%xcc,	%l4,	%o3
	fmovrdlz	%g3,	%f20,	%f8
	popc	%i4,	%o6
	nop
	setx	0x756C22A806F1D196,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4DC31E6C431BAECF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f0
	tvc	%icc,	0x4
	edge32ln	%i0,	%l5,	%o0
	mulx	%g5,	%g2,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x6
	fmovrdgez	%l3,	%f14,	%f28
	fmovdle	%xcc,	%f22,	%f29
	sdivx	%g7,	0x1DB1,	%i2
	udiv	%o7,	0x1885,	%i3
	orncc	%l2,	0x045E,	%g4
	membar	0x5B
	fmovde	%xcc,	%f4,	%f16
	fbuge	%fcc1,	loop_532
	tvc	%icc,	0x5
	movgu	%icc,	%l6,	%o4
	movrlez	%o1,	0x38D,	%i6
loop_532:
	tpos	%xcc,	0x3
	movre	%l0,	0x2EB,	%i1
	edge32n	%i7,	%l1,	%i5
	or	%o5,	0x1877,	%g1
	movrlez	%o2,	%l4,	%g3
	brgez	%i4,	loop_533
	fornot2	%f14,	%f28,	%f12
	ldd	[%l7 + 0x30],	%f0
	bcs	loop_534
loop_533:
	call	loop_535
	std	%f22,	[%l7 + 0x28]
	set	0x48, %l6
	stwa	%o6,	[%l7 + %l6] 0x81
loop_534:
	andncc	%i0,	%o3,	%o0
loop_535:
	fxor	%f4,	%f8,	%f0
	stb	%l5,	[%l7 + 0x23]
	nop
	setx	0x9B51F03D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xC955EAE7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f4,	%f27
	srl	%g5,	%g6,	%l3
	fmovdne	%xcc,	%f26,	%f28
	bl,a	loop_536
	smul	%g2,	%g7,	%o7
	mulx	%i3,	0x1131,	%l2
	movcc	%icc,	%g4,	%i2
loop_536:
	membar	0x17
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x10,	 0x1
	xorcc	%o1,	%l6,	%i6
	umul	%i1,	%l0,	%l1
	fcmpgt16	%f24,	%f22,	%i7
	fbl	%fcc0,	loop_537
	membar	0x46
	addc	%i5,	%g1,	%o2
	sra	%o5,	%g3,	%l4
loop_537:
	nop
	setx loop_538, %l0, %l1
	jmpl %l1, %i4
	nop
	setx	0x69D5CD0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x5747F45F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f1,	%f19
	nop
	fitos	%f16,	%f26
	edge16	%i0,	%o3,	%o0
loop_538:
	subccc	%o6,	0x1D28,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x48, %g4
	lda	[%l7 + %g4] 0x80,	%f7
	edge8ln	%g6,	%l3,	%g2
	sethi	0x1533,	%g7
	for	%f4,	%f16,	%f12
	orn	%l5,	%i3,	%l2
	alignaddr	%g4,	%o7,	%o4
	edge16l	%i2,	%o1,	%l6
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f12
	movcs	%xcc,	%i6,	%l0
	fble	%fcc1,	loop_539
	movvc	%icc,	%i1,	%l1
	fcmpgt16	%f24,	%f22,	%i7
	movpos	%xcc,	%g1,	%o2
loop_539:
	fornot2s	%f31,	%f19,	%f22
	array16	%i5,	%g3,	%o5
	movvc	%icc,	%i4,	%i0
	tsubcc	%l4,	%o3,	%o6
	umulcc	%o0,	%g5,	%g6
	stbar
	tgu	%icc,	0x1
	udivcc	%g2,	0x1671,	%g7
	fnand	%f6,	%f4,	%f6
	ldstub	[%l7 + 0x19],	%l5
	edge16ln	%l3,	%l2,	%g4
	fxnor	%f26,	%f20,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x4
	fmovdcs	%icc,	%f26,	%f27
	fmul8x16	%f24,	%f12,	%f14
	fmovsn	%xcc,	%f2,	%f0
	fmovsleu	%xcc,	%f18,	%f17
	movleu	%xcc,	%o7,	%i3
	set	0x76, %g3
	lduha	[%l7 + %g3] 0x80,	%i2
	edge32n	%o4,	%l6,	%i6
	edge8n	%l0,	%i1,	%o1
	movge	%xcc,	%i7,	%l1
	orn	%g1,	0x1004,	%i5
	set	0x6C, %i3
	sta	%f2,	[%l7 + %i3] 0x18
	orncc	%o2,	0x01B9,	%o5
	tleu	%xcc,	0x4
	fbg,a	%fcc0,	loop_540
	bvs	%xcc,	loop_541
	subc	%i4,	0x15B3,	%g3
	nop
	setx	0xF57731FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x7BF5F1F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f28,	%f20
loop_540:
	tvc	%xcc,	0x1
loop_541:
	movrlz	%l4,	%i0,	%o3
	sdivx	%o6,	0x0B27,	%o0
	mulscc	%g5,	0x0ECC,	%g6
	set	0x30, %o1
	stxa	%g7,	[%l7 + %o1] 0xe3
	membar	#Sync
	fornot2s	%f8,	%f14,	%f3
	nop
	setx loop_542, %l0, %l1
	jmpl %l1, %g2
	movpos	%icc,	%l5,	%l3
	flush	%l7 + 0x50
	movg	%icc,	%l2,	%o7
loop_542:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%g4
	fcmpne16	%f18,	%f0,	%i3
	fmuld8ulx16	%f27,	%f8,	%f22
	fxor	%f20,	%f6,	%f4
	fones	%f21
	array8	%o4,	%l6,	%i6
	movg	%icc,	%l0,	%i1
	xorcc	%o1,	%i7,	%i2
	tg	%icc,	0x0
	fble,a	%fcc2,	loop_543
	tsubcc	%l1,	0x0C9E,	%g1
	fmuld8sux16	%f14,	%f24,	%f0
	andncc	%o2,	%i5,	%i4
loop_543:
	fmovse	%icc,	%f20,	%f6
	tvs	%xcc,	0x3
	fands	%f12,	%f15,	%f11
	tsubcctv	%o5,	0x182C,	%g3
	brgez,a	%l4,	loop_544
	stb	%o3,	[%l7 + 0x4F]
	addccc	%o6,	0x1F92,	%i0
	orn	%o0,	%g5,	%g6
loop_544:
	edge16ln	%g2,	%g7,	%l3
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l5
	nop
	setx	0x519F30073593FCF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD0C9604E7B4B6747,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f22,	%f18
	array16	%l2,	%g4,	%i3
	fbg,a	%fcc0,	loop_545
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o7
loop_545:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x12] %asi,	%l6
	tg	%icc,	0x6
	nop
	setx	0xA5B24934,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x7B618A94,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f26,	%f22
	edge16l	%i6,	%l0,	%o4
	fxnors	%f15,	%f0,	%f5
	mulscc	%o1,	%i7,	%i1
	movg	%icc,	%l1,	%i2
	ldsb	[%l7 + 0x49],	%g1
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f12
	fxtod	%f12,	%f4
	udivcc	%o2,	0x1F12,	%i4
	movle	%icc,	%i5,	%g3
	xor	%o5,	%l4,	%o6
	movvc	%xcc,	%i0,	%o0
	fmovdne	%icc,	%f7,	%f7
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x1f
	membar	#Sync
	fbu	%fcc3,	loop_546
	tneg	%xcc,	0x7
	or	%o3,	%g6,	%g2
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f26
	fxtod	%f26,	%f6
loop_546:
	sdiv	%g7,	0x0AC3,	%l3
	tleu	%icc,	0x3
	fmovsneg	%xcc,	%f5,	%f4
	andcc	%l5,	%g5,	%g4
	tpos	%icc,	0x6
	xnor	%i3,	0x1391,	%l2
	fand	%f10,	%f2,	%f26
	fbue	%fcc1,	loop_547
	fmovrdgez	%l6,	%f4,	%f10
	fbuge	%fcc0,	loop_548
	xorcc	%i6,	%o7,	%l0
loop_547:
	movvc	%xcc,	%o1,	%i7
	sllx	%i1,	0x01,	%o4
loop_548:
	nop
	fitos	%f5,	%f19
	tne	%icc,	0x0
	ba	%xcc,	loop_549
	taddcc	%i2,	%g1,	%o2
	ldd	[%l7 + 0x08],	%f30
	or	%i4,	0x06FB,	%i5
loop_549:
	edge16n	%l1,	%o5,	%g3
	fblg,a	%fcc0,	loop_550
	movrgez	%o6,	%i0,	%o0
	lduw	[%l7 + 0x40],	%o3
	srlx	%l4,	0x14,	%g6
loop_550:
	edge16l	%g7,	%g2,	%l3
	edge32	%l5,	%g5,	%g4
	fpadd16s	%f29,	%f9,	%f17
	tsubcctv	%i3,	%l2,	%i6
	tne	%xcc,	0x1
	nop
	setx	0x6367F065A64607EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x445486CFB6D546F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f18,	%f8
	fcmpeq32	%f16,	%f26,	%o7
	fmovde	%xcc,	%f0,	%f3
	umulcc	%l0,	0x1637,	%o1
	fmovsn	%xcc,	%f2,	%f22
	edge32	%l6,	%i7,	%i1
	movrlez	%i2,	0x1E3,	%g1
	srax	%o2,	%o4,	%i5
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	udiv	%i4,	0x11C5,	%o5
	fbule,a	%fcc2,	loop_551
	fsrc2s	%f26,	%f16
	nop
	setx	0xC8CB16F981535682,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE00D8F3E37CC9903,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f2
	srl	%g3,	0x07,	%l1
loop_551:
	movge	%xcc,	%o6,	%i0
	subc	%o0,	%o3,	%l4
	fzeros	%f24
	fbn	%fcc2,	loop_552
	move	%xcc,	%g7,	%g6
	sdiv	%g2,	0x00B4,	%l5
	fxnor	%f10,	%f16,	%f12
loop_552:
	fmovsleu	%icc,	%f28,	%f14
	xnor	%g5,	0x1BDA,	%l3
	tcs	%xcc,	0x5
	fmovd	%f4,	%f6
	fornot1	%f20,	%f28,	%f8
	fmovrdlz	%i3,	%f0,	%f18
	fbl,a	%fcc0,	loop_553
	fblg	%fcc2,	loop_554
	edge32n	%l2,	%i6,	%o7
	fbug	%fcc1,	loop_555
loop_553:
	fsrc2s	%f6,	%f11
loop_554:
	tleu	%xcc,	0x2
	bcs,a	loop_556
loop_555:
	fbl,a	%fcc1,	loop_557
	fcmpne16	%f14,	%f20,	%l0
	edge16	%o1,	%l6,	%g4
loop_556:
	fxnors	%f1,	%f6,	%f12
loop_557:
	sdivcc	%i1,	0x1F05,	%i7
	membar	0x2E
	srax	%i2,	%o2,	%g1
	movne	%xcc,	%o4,	%i4
	edge16	%i5,	%g3,	%l1
	fbul	%fcc0,	loop_558
	addcc	%o6,	0x0C60,	%o5
	bg,a,pn	%icc,	loop_559
	andn	%o0,	%o3,	%l4
loop_558:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x7C] %asi,	%g7
loop_559:
	fmovsne	%xcc,	%f31,	%f18
	alignaddr	%i0,	%g6,	%l5
	tge	%xcc,	0x0
	movneg	%xcc,	%g5,	%l3
	fmovscs	%icc,	%f21,	%f27
	sdivcc	%i3,	0x106D,	%l2
	fbul,a	%fcc1,	loop_560
	fble	%fcc2,	loop_561
	tpos	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f16
loop_560:
	orcc	%g2,	%o7,	%l0
loop_561:
	fcmpgt16	%f20,	%f12,	%i6
	edge16n	%l6,	%o1,	%i1
	swap	[%l7 + 0x78],	%g4
	fandnot1s	%f6,	%f5,	%f21
	movge	%icc,	%i2,	%o2
	orncc	%g1,	%i7,	%i4
	subc	%o4,	%i5,	%g3
	movrgez	%l1,	0x02C,	%o6
	umul	%o0,	%o5,	%l4
	movle	%icc,	%g7,	%i0
	subcc	%o3,	%g6,	%g5
	edge16l	%l5,	%l3,	%l2
	fmovdneg	%xcc,	%f29,	%f13
	movn	%icc,	%i3,	%o7
	umulcc	%g2,	%i6,	%l6
	pdist	%f28,	%f0,	%f24
	andcc	%o1,	%i1,	%l0
	xor	%g4,	%o2,	%g1
	sdiv	%i2,	0x0790,	%i4
	fornot1	%f14,	%f18,	%f14
	udivx	%i7,	0x0BB4,	%i5
	fmovscs	%icc,	%f4,	%f17
	addc	%o4,	0x1924,	%g3
	set	0x5C, %l3
	ldsha	[%l7 + %l3] 0x89,	%o6
	be,pn	%xcc,	loop_562
	fpadd16s	%f10,	%f21,	%f9
	te	%icc,	0x2
	stx	%l1,	[%l7 + 0x58]
loop_562:
	lduw	[%l7 + 0x38],	%o5
	srlx	%o0,	0x11,	%g7
	fmovsg	%icc,	%f30,	%f20
	fzero	%f4
	movleu	%xcc,	%i0,	%o3
	orncc	%g6,	0x1C24,	%g5
	movg	%xcc,	%l4,	%l5
	fors	%f15,	%f17,	%f9
	xnorcc	%l3,	0x1E0D,	%i3
	xnor	%o7,	0x1866,	%l2
	fmovde	%xcc,	%f24,	%f15
	ta	%icc,	0x3
	edge32n	%i6,	%l6,	%o1
	stw	%g2,	[%l7 + 0x58]
	wr	%g0,	0x0c,	%asi
	stha	%i1,	[%l7 + 0x5C] %asi
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%g4
	fcmpgt32	%f24,	%f20,	%g1
	mova	%xcc,	%o2,	%i2
	smul	%i7,	0x1EB6,	%i5
	ba,a,pt	%icc,	loop_563
	fmovsleu	%icc,	%f25,	%f18
	xor	%i4,	0x09E2,	%g3
	fbg,a	%fcc3,	loop_564
loop_563:
	array8	%o4,	%l1,	%o6
	nop
	setx	loop_565,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpgt32	%f6,	%f18,	%o0
loop_564:
	nop
	setx	0x719C30F9074D71FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x18C049B2FC63A41D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f20,	%f0
	fmovrde	%g7,	%f26,	%f18
loop_565:
	fnot2	%f22,	%f12
	tg	%xcc,	0x7
	fbe,a	%fcc3,	loop_566
	movle	%xcc,	%i0,	%o5
	addc	%g6,	0x1E4B,	%o3
	movneg	%xcc,	%g5,	%l5
loop_566:
	subc	%l3,	%i3,	%o7
	movrgez	%l4,	0x21B,	%i6
	tn	%icc,	0x7
	tge	%xcc,	0x4
	edge16	%l6,	%o1,	%g2
	alignaddr	%l2,	%l0,	%g4
	addc	%i1,	0x0802,	%o2
	movneg	%xcc,	%g1,	%i7
	andn	%i2,	%i5,	%g3
	sub	%i4,	0x1A83,	%l1
	ble,a,pt	%xcc,	loop_567
	fmovdneg	%icc,	%f14,	%f20
	edge32n	%o4,	%o0,	%g7
	add	%i0,	0x034F,	%o5
loop_567:
	edge32l	%o6,	%o3,	%g6
	edge32n	%l5,	%g5,	%i3
	fbe,a	%fcc2,	loop_568
	tge	%xcc,	0x6
	fors	%f15,	%f17,	%f20
	addcc	%o7,	%l3,	%l4
loop_568:
	pdist	%f4,	%f28,	%f30
	edge16	%i6,	%o1,	%g2
	nop
	setx	0x944C246D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xAE583DED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f6,	%f12
	fmovsneg	%icc,	%f4,	%f15
	tpos	%xcc,	0x7
	movre	%l2,	%l0,	%g4
	fbn	%fcc0,	loop_569
	fmovspos	%xcc,	%f4,	%f17
	fpack32	%f18,	%f2,	%f2
	brlz	%i1,	loop_570
loop_569:
	andn	%l6,	0x11DC,	%g1
	fmul8x16	%f30,	%f30,	%f24
	bpos	%icc,	loop_571
loop_570:
	fsrc1	%f22,	%f16
	movvc	%icc,	%o2,	%i2
	orcc	%i7,	0x0109,	%i5
loop_571:
	fmovdpos	%icc,	%f14,	%f3
	fbne	%fcc3,	loop_572
	st	%f7,	[%l7 + 0x38]
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i4
loop_572:
	movne	%xcc,	%l1,	%g3
	be,pt	%icc,	loop_573
	edge32n	%o0,	%o4,	%g7
	membar	0x6F
	fzero	%f10
loop_573:
	fmovdg	%icc,	%f18,	%f7
	mulx	%i0,	%o5,	%o6
	tgu	%xcc,	0x2
	movcc	%icc,	%o3,	%l5
	fandnot1s	%f30,	%f21,	%f27
	fbule	%fcc3,	loop_574
	array8	%g6,	%g5,	%i3
	addcc	%l3,	%o7,	%l4
	edge16ln	%i6,	%g2,	%l2
loop_574:
	fmovsl	%xcc,	%f10,	%f17
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x40] %asi,	%o1
	movvs	%icc,	%g4,	%i1
	umul	%l6,	0x0E77,	%l0
	subcc	%g1,	0x12AE,	%i2
	fmovdle	%xcc,	%f22,	%f21
	xnorcc	%i7,	%i5,	%i4
	fpadd16s	%f29,	%f0,	%f0
	fbne	%fcc1,	loop_575
	fpadd32s	%f9,	%f13,	%f2
	popc	%l1,	%g3
	ta	%icc,	0x7
loop_575:
	fabsd	%f0,	%f22
	movvs	%xcc,	%o2,	%o4
	orn	%o0,	0x027C,	%i0
	movrne	%g7,	0x18E,	%o6
	tle	%xcc,	0x5
	popc	%o5,	%l5
	fbug,a	%fcc2,	loop_576
	movrne	%o3,	%g5,	%g6
	fornot2s	%f6,	%f8,	%f27
	pdist	%f8,	%f2,	%f28
loop_576:
	umulcc	%l3,	0x03F1,	%o7
	nop
	setx	0xD52A7C5014DB4C60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6438FBA17BB1F92D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f12,	%f8
	tsubcctv	%i3,	0x0116,	%i6
	fmovscc	%icc,	%f9,	%f29
	sdivx	%g2,	0x0B7C,	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%g4
	movne	%icc,	%i1,	%o1
	xnor	%l6,	%g1,	%l0
	bcs	loop_577
	tcc	%icc,	0x2
	fbule,a	%fcc0,	loop_578
	xorcc	%i7,	%i2,	%i4
loop_577:
	sir	0x085E
	tgu	%icc,	0x6
loop_578:
	fpack32	%f24,	%f20,	%f12
	tvc	%xcc,	0x2
	movvc	%icc,	%i5,	%g3
	sdiv	%l1,	0x10C2,	%o2
	bleu,a,pn	%icc,	loop_579
	ta	%icc,	0x4
	movvs	%xcc,	%o0,	%o4
	bvc,a	%xcc,	loop_580
loop_579:
	tg	%xcc,	0x2
	movle	%xcc,	%i0,	%o6
	movre	%o5,	%g7,	%l5
loop_580:
	andn	%o3,	%g6,	%g5
	taddcc	%o7,	0x14B9,	%l3
	ldx	[%l7 + 0x48],	%i3
	sdiv	%i6,	0x085C,	%g2
	nop
	setx	0x596E951F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xEF6782B7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f9,	%f23
	fbule	%fcc0,	loop_581
	bgu,pn	%xcc,	loop_582
	orn	%l2,	0x04FD,	%g4
	fpadd32	%f2,	%f30,	%f22
loop_581:
	tge	%icc,	0x7
loop_582:
	sth	%i1,	[%l7 + 0x56]
	andcc	%l4,	%l6,	%g1
	nop
	setx	loop_583,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0xC1E43E64,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xB3BAD57C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f24,	%f17
	umulcc	%l0,	0x0503,	%i7
	edge8	%i2,	%o1,	%i5
loop_583:
	bg,a	%xcc,	loop_584
	movle	%xcc,	%i4,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x6C929ADF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f11
loop_584:
	and	%o2,	0x193D,	%o0
	tn	%xcc,	0x1
	fpack32	%f26,	%f2,	%f2
	fornot1	%f14,	%f14,	%f10
	fmovd	%f16,	%f20
	udiv	%l1,	0x0031,	%o4
	movgu	%xcc,	%i0,	%o6
	bge,pn	%xcc,	loop_585
	sir	0x1553
	tsubcctv	%o5,	0x1AC6,	%l5
	xnor	%g7,	0x1D30,	%g6
loop_585:
	movrlz	%g5,	0x3D5,	%o7
	sethi	0x0C3A,	%o3
	sdiv	%l3,	0x1623,	%i6
	fbg,a	%fcc1,	loop_586
	ldsb	[%l7 + 0x3B],	%g2
	xorcc	%i3,	%l2,	%i1
	udivcc	%g4,	0x040A,	%l6
loop_586:
	xnor	%g1,	0x1EDF,	%l0
	andn	%i7,	%l4,	%o1
	tcs	%icc,	0x5
	movvc	%icc,	%i2,	%i4
	movg	%xcc,	%i5,	%o2
	set	0x19, %i5
	ldsba	[%l7 + %i5] 0x10,	%g3
	fmovsvc	%icc,	%f22,	%f16
	mulscc	%l1,	%o4,	%o0
	fmovsvc	%xcc,	%f12,	%f5
	prefetch	[%l7 + 0x38],	 0x0
	edge16n	%o6,	%o5,	%l5
	sub	%i0,	%g6,	%g5
	movre	%o7,	0x15C,	%g7
	fbug,a	%fcc0,	loop_587
	tvs	%xcc,	0x7
	movne	%xcc,	%l3,	%o3
	bgu,a,pt	%icc,	loop_588
loop_587:
	sll	%i6,	%g2,	%i3
	edge16n	%l2,	%g4,	%i1
	movleu	%xcc,	%l6,	%g1
loop_588:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x0F] %asi,	%i7
	tvs	%xcc,	0x7
	subcc	%l0,	%o1,	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i4,	%i5
	edge16ln	%o2,	%i2,	%g3
	popc	0x0848,	%l1
	tsubcctv	%o0,	0x0A42,	%o6
	movleu	%icc,	%o4,	%o5
	sir	0x16F1
	subccc	%i0,	%g6,	%g5
	array8	%l5,	%g7,	%l3
	fxnor	%f16,	%f12,	%f18
	sdivx	%o3,	0x08C4,	%o7
	fandnot2	%f26,	%f0,	%f2
	fmovdvc	%xcc,	%f22,	%f12
	nop
	setx	0x30405830,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fcmple16	%f28,	%f22,	%i6
	fsrc1s	%f10,	%f9
	fmovrslez	%g2,	%f14,	%f16
	umul	%l2,	0x169B,	%g4
	be,a,pt	%xcc,	loop_589
	array8	%i3,	%l6,	%i1
	edge16l	%i7,	%g1,	%o1
	nop
	setx	0x705BFC8D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x4ED1B92A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f8,	%f24
loop_589:
	fbg,a	%fcc2,	loop_590
	orncc	%l0,	%i4,	%l4
	tge	%xcc,	0x1
	srl	%i5,	%o2,	%g3
loop_590:
	movne	%xcc,	%i2,	%l1
	movrgez	%o0,	%o4,	%o6
	fmovs	%f4,	%f5
	xor	%i0,	0x197B,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g5,	%o5
	bcc,a,pn	%icc,	loop_591
	fbn,a	%fcc0,	loop_592
	orncc	%g7,	%l5,	%o3
	alignaddrl	%l3,	%i6,	%o7
loop_591:
	brnz	%l2,	loop_593
loop_592:
	smulcc	%g2,	%g4,	%l6
	fabss	%f31,	%f19
	sdivcc	%i3,	0x1659,	%i7
loop_593:
	sir	0x1473
	membar	0x2F
	wr	%g0,	0x18,	%asi
	stba	%i1,	[%l7 + 0x11] %asi
	movge	%icc,	%o1,	%g1
	array32	%l0,	%i4,	%i5
	set	0x10, %g5
	ldxa	[%g0 + %g5] 0x21,	%l4
	movrgz	%o2,	%i2,	%l1
	fmovdle	%icc,	%f31,	%f27
	fmovrsgz	%g3,	%f3,	%f2
	fbe	%fcc0,	loop_594
	andcc	%o4,	0x0B0F,	%o6
	addccc	%o0,	0x0A0C,	%i0
	mova	%xcc,	%g6,	%o5
loop_594:
	sub	%g5,	0x1F62,	%g7
	or	%l5,	0x15CE,	%o3
	pdist	%f18,	%f20,	%f4
	edge32ln	%l3,	%o7,	%i6
	fmovrse	%l2,	%f10,	%f25
	movrgz	%g2,	%g4,	%i3
	tneg	%xcc,	0x3
	brlz,a	%l6,	loop_595
	add	%i7,	0x0D59,	%i1
	subcc	%o1,	0x18F8,	%g1
	edge32l	%l0,	%i5,	%i4
loop_595:
	edge8n	%l4,	%i2,	%l1
	taddcctv	%o2,	0x198D,	%g3
	fzeros	%f13
	fandnot1	%f2,	%f14,	%f18
	movgu	%icc,	%o4,	%o0
	fmovdn	%xcc,	%f19,	%f11
	fsrc1s	%f22,	%f11
	fmovrdgez	%i0,	%f4,	%f0
	tle	%icc,	0x3
	set	0x66, %i7
	stha	%o6,	[%l7 + %i7] 0x2f
	membar	#Sync
	mova	%xcc,	%g6,	%g5
	tle	%xcc,	0x0
	fornot2	%f26,	%f16,	%f14
	movvc	%icc,	%o5,	%g7
	nop
	setx	0x0A5C9A553311DB0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0D664946A7DDB405,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f24,	%f24
	tcc	%icc,	0x0
	std	%f24,	[%l7 + 0x28]
	tvs	%icc,	0x2
	fnor	%f24,	%f26,	%f6
	sdivx	%l5,	0x1E4D,	%l3
	fmovse	%xcc,	%f4,	%f17
	smul	%o7,	%i6,	%l2
	addcc	%o3,	%g2,	%g4
	fbe,a	%fcc3,	loop_596
	sethi	0x1926,	%i3
	udivx	%l6,	0x1BDA,	%i7
	fsrc1	%f10,	%f22
loop_596:
	sethi	0x02ED,	%i1
	movgu	%icc,	%g1,	%l0
	ldd	[%l7 + 0x18],	%o0
	sub	%i4,	0x1681,	%i5
	fnors	%f28,	%f21,	%f2
	taddcc	%l4,	0x003E,	%i2
	nop
	setx	0x85F2A8E70E01599C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f18
	tcc	%icc,	0x4
	bge,a,pt	%icc,	loop_597
	tneg	%xcc,	0x1
	fbo,a	%fcc1,	loop_598
	stx	%l1,	[%l7 + 0x08]
loop_597:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g3
loop_598:
	movrlz	%o2,	%o4,	%i0
	fone	%f12
	fcmple16	%f4,	%f16,	%o0
	bpos,a	%xcc,	loop_599
	array16	%g6,	%g5,	%o6
	edge32ln	%g7,	%l5,	%o5
	movrlz	%o7,	%l3,	%l2
loop_599:
	fpsub16s	%f16,	%f5,	%f14
	fornot2	%f20,	%f8,	%f26
	nop
	setx	0xE7CA2179,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x159CA2DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f10,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f28,	%f0
	nop
	setx loop_600, %l0, %l1
	jmpl %l1, %i6
	swap	[%l7 + 0x14],	%o3
	brlez	%g2,	loop_601
	edge16	%g4,	%i3,	%i7
loop_600:
	fbl	%fcc2,	loop_602
	movvs	%icc,	%i1,	%l6
loop_601:
	bne,a	%icc,	loop_603
	fbue,a	%fcc2,	loop_604
loop_602:
	movrlz	%g1,	0x02E,	%o1
	nop
	setx loop_605, %l0, %l1
	jmpl %l1, %l0
loop_603:
	brlz	%i4,	loop_606
loop_604:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i5
loop_605:
	tge	%icc,	0x4
loop_606:
	movrlez	%i2,	%l4,	%l1
	movrgez	%g3,	%o2,	%o4
	tvs	%xcc,	0x2
	mulx	%i0,	0x0ABC,	%o0
	tsubcctv	%g6,	0x0B33,	%o6
	subcc	%g5,	%g7,	%l5
	fpadd32	%f12,	%f26,	%f26
	fpsub16s	%f17,	%f11,	%f17
	srl	%o7,	%o5,	%l2
	movcs	%xcc,	%l3,	%i6
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x49] %asi,	%o3
	bvc,pn	%icc,	loop_607
	fbo,a	%fcc2,	loop_608
	tn	%icc,	0x7
	movrne	%g2,	%g4,	%i3
loop_607:
	fbo,a	%fcc1,	loop_609
loop_608:
	fcmple32	%f24,	%f18,	%i1
	andn	%l6,	%g1,	%i7
	or	%l0,	%i4,	%o1
loop_609:
	edge16l	%i2,	%i5,	%l1
	tle	%icc,	0x2
	set	0x60, %g7
	sta	%f5,	[%l7 + %g7] 0x18
	set	0x39, %l2
	lduba	[%l7 + %l2] 0x18,	%g3
	fmovdleu	%icc,	%f24,	%f27
	fmovsne	%xcc,	%f25,	%f14
	fxors	%f15,	%f7,	%f15
	edge8n	%l4,	%o2,	%o4
	fbo	%fcc0,	loop_610
	pdist	%f2,	%f24,	%f14
	sdivx	%i0,	0x04D3,	%g6
	edge16l	%o6,	%g5,	%o0
loop_610:
	xorcc	%g7,	0x1CD7,	%l5
	orncc	%o5,	%l2,	%o7
	fxnor	%f12,	%f10,	%f8
	tgu	%xcc,	0x0
	addc	%l3,	%i6,	%g2
	fxnor	%f2,	%f6,	%f0
	sllx	%o3,	0x08,	%i3
	movge	%icc,	%i1,	%l6
	bg,a,pt	%icc,	loop_611
	call	loop_612
	bcs,a	%icc,	loop_613
	lduh	[%l7 + 0x54],	%g4
loop_611:
	xnor	%g1,	0x1961,	%l0
loop_612:
	fpsub16	%f30,	%f30,	%f30
loop_613:
	fnot1s	%f0,	%f27
	orcc	%i4,	%o1,	%i2
	array8	%i5,	%i7,	%l1
	sub	%l4,	%o2,	%o4
	sllx	%g3,	%g6,	%o6
	tl	%xcc,	0x2
	edge16	%i0,	%g5,	%o0
	wr	%g0,	0xea,	%asi
	stba	%g7,	[%l7 + 0x7C] %asi
	membar	#Sync
	fexpand	%f20,	%f28
	ldd	[%l7 + 0x68],	%f2
	fmovrse	%l5,	%f6,	%f5
	addccc	%o5,	0x0EA7,	%o7
	fpsub16s	%f4,	%f3,	%f0
	edge16n	%l2,	%i6,	%g2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x32] %asi,	%l3
	fpack16	%f24,	%f19
	tpos	%icc,	0x3
	fpack16	%f18,	%f10
	fbug,a	%fcc1,	loop_614
	orcc	%i3,	%o3,	%l6
	fcmple16	%f24,	%f22,	%g4
	alignaddrl	%g1,	%l0,	%i4
loop_614:
	fbule	%fcc3,	loop_615
	subccc	%i1,	0x0240,	%i2
	fmovrslz	%i5,	%f25,	%f11
	andn	%i7,	0x0A49,	%o1
loop_615:
	movvs	%icc,	%l1,	%l4
	fpadd32s	%f19,	%f2,	%f14
	tvs	%xcc,	0x5
	brlz,a	%o4,	loop_616
	udivx	%g3,	0x0BB9,	%o2
	edge32n	%o6,	%i0,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_616:
	edge8n	%o0,	%g6,	%l5
	sra	%g7,	%o7,	%o5
	andcc	%l2,	0x101A,	%g2
	fmuld8sux16	%f13,	%f17,	%f28
	addc	%i6,	0x01AA,	%i3
	edge16ln	%l3,	%l6,	%o3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x58] %asi,	%g4
	sra	%g1,	%l0,	%i1
	mova	%xcc,	%i2,	%i5
	sir	0x1562
	addcc	%i7,	0x09FE,	%o1
	ba,a	loop_617
	tgu	%icc,	0x3
	tg	%xcc,	0x3
	ta	%xcc,	0x1
loop_617:
	sir	0x05DA
	udiv	%i4,	0x0C1C,	%l1
	taddcc	%l4,	%g3,	%o4
	nop
	setx	0xD043FD9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	xor	%o2,	%i0,	%g5
	fmovdne	%icc,	%f4,	%f20
	fbne	%fcc3,	loop_618
	ld	[%l7 + 0x34],	%f12
	edge32	%o6,	%g6,	%o0
	alignaddrl	%l5,	%o7,	%o5
loop_618:
	edge16n	%l2,	%g7,	%g2
	ba	loop_619
	bpos,a,pt	%xcc,	loop_620
	tg	%xcc,	0x0
	set	0x5C, %o4
	swapa	[%l7 + %o4] 0x89,	%i3
loop_619:
	tn	%xcc,	0x7
loop_620:
	edge8	%i6,	%l6,	%o3
	nop
	setx	0x9AF6BFBFAA25303D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB8DD8E8EBFBD576C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f18,	%f20
	tge	%icc,	0x0
	fmovrse	%l3,	%f2,	%f5
	stbar
	fmovscc	%xcc,	%f1,	%f18
	udivx	%g4,	0x1EA7,	%g1
	smul	%l0,	%i1,	%i2
	subccc	%i7,	0x0E4F,	%i5
	stb	%o1,	[%l7 + 0x36]
	sethi	0x147D,	%i4
	ble	%icc,	loop_621
	xnor	%l4,	%g3,	%o4
	srax	%l1,	%o2,	%g5
	tpos	%icc,	0x4
loop_621:
	sub	%o6,	0x0671,	%g6
	sdiv	%i0,	0x16B3,	%l5
	mova	%icc,	%o0,	%o7
	array32	%l2,	%o5,	%g7
	orcc	%g2,	0x1355,	%i3
	fornot2s	%f30,	%f20,	%f24
	fmovdge	%xcc,	%f15,	%f23
	move	%xcc,	%l6,	%i6
	tgu	%xcc,	0x4
	ldstub	[%l7 + 0x46],	%l3
	sir	0x1634
	movgu	%icc,	%o3,	%g1
	umul	%l0,	0x1A2C,	%i1
	fmovsle	%xcc,	%f24,	%f1
	nop
	setx loop_622, %l0, %l1
	jmpl %l1, %g4
	bn,a,pn	%xcc,	loop_623
	nop
	setx	loop_624,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%i7,	%i5,	%i2
loop_622:
	movl	%xcc,	%i4,	%l4
loop_623:
	edge16n	%o1,	%g3,	%o4
loop_624:
	movne	%xcc,	%l1,	%g5
	fmovde	%xcc,	%f30,	%f16
	movvs	%xcc,	%o2,	%g6
	fxnors	%f23,	%f24,	%f2
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i0
	sdiv	%o6,	0x0215,	%l5
	smulcc	%o7,	0x0D61,	%l2
	nop
	fitos	%f5,	%f2
	fstox	%f2,	%f4
	xor	%o0,	%g7,	%g2
	nop
	set	0x20, %o5
	lduw	[%l7 + %o5],	%i3
	array16	%o5,	%i6,	%l6
	edge32n	%o3,	%l3,	%l0
	movrgz	%g1,	0x152,	%i1
	orncc	%i7,	%g4,	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i5,	%l4
	fmul8ulx16	%f14,	%f24,	%f18
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0x1
	tsubcc	%i4,	0x1047,	%g3
	bcs	%icc,	loop_625
	lduh	[%l7 + 0x50],	%l1
	addcc	%o4,	0x13FD,	%g5
	and	%g6,	%i0,	%o2
loop_625:
	movg	%xcc,	%o6,	%l5
	tn	%icc,	0x4
	nop
	setx	0x536E18A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE4E78F79,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f11,	%f20
	fnor	%f18,	%f8,	%f30
	fbu	%fcc1,	loop_626
	movl	%xcc,	%l2,	%o7
	addc	%o0,	%g7,	%i3
	mova	%xcc,	%g2,	%o5
loop_626:
	tle	%icc,	0x4
	movre	%l6,	%o3,	%l3
	nop
	fitod	%f6,	%f18
	fdtos	%f18,	%f25
	fnegd	%f28,	%f26
	fbg	%fcc2,	loop_627
	tvc	%xcc,	0x7
	fmovrdgez	%l0,	%f8,	%f14
	ldd	[%l7 + 0x68],	%f26
loop_627:
	addc	%g1,	0x1068,	%i6
	fnegd	%f20,	%f2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i1
	edge8ln	%g4,	%i7,	%i2
	edge32l	%l4,	%i5,	%i4
	fsrc2	%f24,	%f8
	brgz	%o1,	loop_628
	movrgz	%l1,	%g3,	%o4
	movge	%xcc,	%g5,	%g6
	nop
	setx	loop_629,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_628:
	srl	%o2,	0x05,	%o6
	movl	%xcc,	%i0,	%l2
	pdist	%f14,	%f18,	%f16
loop_629:
	nop
	set	0x7E, %g1
	lduba	[%l7 + %g1] 0x81,	%l5
	brgez	%o0,	loop_630
	xnor	%g7,	0x1DEF,	%o7
	fabsd	%f6,	%f8
	lduw	[%l7 + 0x50],	%g2
loop_630:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%o5
	add	%l6,	0x0F41,	%i3
	ldsh	[%l7 + 0x4E],	%o3
	edge8n	%l3,	%l0,	%g1
	stw	%i1,	[%l7 + 0x58]
	orn	%i6,	%i7,	%g4
	fmovdpos	%xcc,	%f9,	%f8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f6,	%f19,	%f28
	lduw	[%l7 + 0x4C],	%i5
	fnot2s	%f16,	%f19
	smul	%i4,	0x0872,	%l4
	ldsh	[%l7 + 0x3C],	%l1
	fmovsne	%xcc,	%f1,	%f7
	set	0x44, %l0
	lduha	[%l7 + %l0] 0x19,	%g3
	pdist	%f28,	%f26,	%f22
	fxnor	%f16,	%f4,	%f24
	xnorcc	%o1,	0x12A1,	%o4
	fnot2s	%f1,	%f11
	tsubcctv	%g6,	%g5,	%o6
	fmovrde	%o2,	%f22,	%f6
	mulx	%l2,	%l5,	%o0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i0
	membar	0x1C
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x18,	%o7,	%g7
	fbg	%fcc3,	loop_631
	movge	%icc,	%g2,	%o5
	edge8n	%l6,	%o3,	%l3
	fmovdleu	%icc,	%f23,	%f6
loop_631:
	fnegs	%f3,	%f30
	fblg,a	%fcc2,	loop_632
	edge32l	%i3,	%g1,	%i1
	edge8n	%i6,	%i7,	%l0
	fmovrdne	%i2,	%f6,	%f6
loop_632:
	tl	%icc,	0x2
	alignaddrl	%i5,	%i4,	%l4
	movcs	%xcc,	%g4,	%g3
	nop
	setx	0xFADF00EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x058CA8D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f20,	%f8
	sdiv	%l1,	0x1AE9,	%o4
	st	%f13,	[%l7 + 0x18]
	tcs	%icc,	0x5
	edge8ln	%o1,	%g6,	%o6
	nop
	fitos	%f8,	%f9
	fstoi	%f9,	%f5
	tg	%xcc,	0x6
	nop
	setx	loop_633,	%l0,	%l1
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
	set	0x40, %o2
	ldswa	[%l7 + %o2] 0x15,	%g5
loop_633:
	srl	%l2,	%o2,	%l5
	tsubcctv	%i0,	0x1AF8,	%o7
	array8	%o0,	%g7,	%g2
	nop
	setx	0xDA34A25B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x72A8E43E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f4,	%f8
	tne	%xcc,	0x6
	fmovsne	%icc,	%f31,	%f6
	movrgez	%o5,	0x063,	%o3
	fbul	%fcc1,	loop_634
	fsrc2s	%f21,	%f15
	movrgez	%l6,	0x075,	%l3
	movrgez	%g1,	%i3,	%i1
loop_634:
	array32	%i6,	%i7,	%i2
	movle	%icc,	%i5,	%i4
	be	%icc,	loop_635
	bvs,a,pn	%xcc,	loop_636
	movvc	%xcc,	%l0,	%l4
	srl	%g3,	0x09,	%g4
loop_635:
	sdivx	%l1,	0x0771,	%o1
loop_636:
	nop
	setx	0x520E655477BFDEA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x929C0F0F704B70B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f20,	%f14
	smul	%g6,	0x05AF,	%o4
	addc	%g5,	0x06F8,	%o6
	srax	%o2,	%l2,	%l5
	fcmpgt16	%f16,	%f22,	%i0
	sra	%o0,	%o7,	%g2
	set	0x48, %l4
	lduwa	[%l7 + %l4] 0x11,	%o5
	taddcctv	%o3,	%g7,	%l3
	brgez	%l6,	loop_637
	bg	%xcc,	loop_638
	movneg	%xcc,	%g1,	%i3
	fbg	%fcc2,	loop_639
loop_637:
	tvs	%xcc,	0x6
loop_638:
	subcc	%i1,	0x17FB,	%i7
	tle	%xcc,	0x2
loop_639:
	alignaddrl	%i2,	%i5,	%i6
	addc	%l0,	%i4,	%l4
	edge32n	%g4,	%g3,	%o1
	andn	%g6,	0x050E,	%l1
	stw	%o4,	[%l7 + 0x20]
	edge32ln	%g5,	%o6,	%l2
	alignaddr	%l5,	%o2,	%o0
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x0c,	%i0
	fpackfix	%f4,	%f18
	fzero	%f18
	set	0x40, %o7
	stwa	%o7,	[%l7 + %o7] 0x2b
	membar	#Sync
	fmovsleu	%xcc,	%f8,	%f17
	set	0x4C, %g6
	swapa	[%l7 + %g6] 0x81,	%g2
	addccc	%o3,	0x092C,	%g7
	fbne,a	%fcc1,	loop_640
	array32	%l3,	%o5,	%g1
	nop
	fitod	%f17,	%f14
	nop
	setx	0xDCE147C63052AC08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_640:
	mulscc	%i3,	0x144E,	%i1
	fmul8ulx16	%f16,	%f24,	%f20
	or	%i7,	%l6,	%i5
	movpos	%icc,	%i2,	%l0
	fbu	%fcc0,	loop_641
	fexpand	%f16,	%f28
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
loop_641:
	bne,pt	%icc,	loop_642
	ldd	[%l7 + 0x70],	%f30
	movleu	%icc,	%i4,	%g4
	edge32	%g3,	%l4,	%o1
loop_642:
	array32	%g6,	%l1,	%g5
	fba,a	%fcc0,	loop_643
	movre	%o4,	%o6,	%l5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x10] %asi,	%o2
loop_643:
	array32	%l2,	%o0,	%o7
	bpos,a	%xcc,	loop_644
	mulscc	%g2,	0x12D5,	%i0
	fmovdg	%icc,	%f29,	%f7
	srax	%o3,	0x00,	%g7
loop_644:
	tge	%icc,	0x5
	fcmpne16	%f0,	%f0,	%l3
	movrne	%o5,	0x336,	%i3
	sir	0x1512
	bvs	loop_645
	brz,a	%g1,	loop_646
	orn	%i1,	0x126A,	%l6
	ble,pn	%icc,	loop_647
loop_645:
	subccc	%i5,	0x08DB,	%i2
loop_646:
	fmovdcs	%icc,	%f10,	%f21
	fmul8ulx16	%f26,	%f14,	%f22
loop_647:
	membar	0x3C
	add	%l0,	%i6,	%i4
	movrgez	%i7,	0x3CE,	%g3
	tpos	%xcc,	0x2
	stw	%g4,	[%l7 + 0x0C]
	fand	%f12,	%f16,	%f0
	tvs	%xcc,	0x7
	movg	%xcc,	%l4,	%g6
	tleu	%xcc,	0x3
	array8	%l1,	%g5,	%o4
	edge8	%o6,	%l5,	%o2
	brnz,a	%o1,	loop_648
	fbuge	%fcc2,	loop_649
	fmovdvs	%icc,	%f24,	%f27
	movcc	%xcc,	%o0,	%l2
loop_648:
	sllx	%g2,	0x09,	%i0
loop_649:
	tvs	%icc,	0x2
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o3
	movl	%xcc,	%g7,	%l3
	mova	%xcc,	%o5,	%o7
	srax	%g1,	%i3,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%i2
	brnz	%l0,	loop_650
	nop
	fitod	%f0,	%f6
	wr	%g0,	0x18,	%asi
	stba	%i5,	[%l7 + 0x4D] %asi
loop_650:
	movleu	%xcc,	%i6,	%i4
	ldd	[%l7 + 0x18],	%f8
	fmul8x16au	%f23,	%f14,	%f10
	sllx	%g3,	0x1A,	%i7
	sub	%l4,	%g4,	%g6
	stx	%g5,	[%l7 + 0x48]
	fbo	%fcc0,	loop_651
	movcc	%icc,	%l1,	%o6
	membar	0x29
	edge8ln	%l5,	%o4,	%o2
loop_651:
	fmovspos	%icc,	%f28,	%f24
	fxor	%f12,	%f10,	%f10
	tleu	%xcc,	0x6
	andcc	%o1,	0x18A5,	%l2
	fsrc1s	%f24,	%f15
	smul	%g2,	%i0,	%o3
	edge16	%g7,	%l3,	%o0
	taddcctv	%o5,	%g1,	%o7
	fmovrdne	%i3,	%f28,	%f26
	nop
	setx	0x7B4A96327C098393,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF7F8A6890331B41A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f2,	%f8
	fands	%f1,	%f15,	%f10
	addc	%l6,	0x13E0,	%i1
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x15,	%l0
	fmovdpos	%icc,	%f1,	%f11
	fcmple32	%f28,	%f14,	%i5
	ldd	[%l7 + 0x60],	%i6
	fmovsle	%xcc,	%f15,	%f27
	movn	%icc,	%i2,	%g3
	sra	%i7,	0x1A,	%l4
	tgu	%icc,	0x6
	brlz	%i4,	loop_652
	sllx	%g4,	%g5,	%l1
	andn	%g6,	%l5,	%o6
	movcs	%icc,	%o4,	%o1
loop_652:
	tge	%xcc,	0x5
	fnot2s	%f22,	%f8
	fornot1s	%f12,	%f28,	%f11
	fcmpeq16	%f4,	%f8,	%o2
	edge32n	%g2,	%l2,	%o3
	ta	%xcc,	0x3
	ld	[%l7 + 0x2C],	%f9
	movrgez	%i0,	%l3,	%o0
	tle	%icc,	0x1
	add	%o5,	%g7,	%o7
	tgu	%icc,	0x4
	bcc	loop_653
	umulcc	%g1,	0x112A,	%i3
	andcc	%i1,	0x1722,	%l0
	smul	%l6,	%i5,	%i6
loop_653:
	movre	%i2,	%i7,	%g3
	fxnor	%f10,	%f14,	%f8
	or	%i4,	0x052B,	%g4
	fblg	%fcc3,	loop_654
	addcc	%l4,	0x081D,	%g5
	smul	%g6,	%l1,	%o6
	fmovdgu	%xcc,	%f5,	%f14
loop_654:
	movne	%xcc,	%l5,	%o4
	alignaddr	%o2,	%o1,	%l2
	fbo,a	%fcc3,	loop_655
	sethi	0x02EF,	%o3
	edge8n	%g2,	%i0,	%o0
	taddcc	%o5,	0x16D3,	%g7
loop_655:
	std	%f24,	[%l7 + 0x68]
	brlz,a	%l3,	loop_656
	xor	%o7,	0x1092,	%i3
	nop
	setx	0xF5005DAA0958A3A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f6
	edge16ln	%i1,	%l0,	%l6
loop_656:
	tl	%icc,	0x4
	move	%xcc,	%g1,	%i6
	ldx	[%l7 + 0x20],	%i2
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%i5
	fmovdleu	%icc,	%f10,	%f31
	subc	%i7,	0x0410,	%g3
	addcc	%g4,	%l4,	%g5
	tleu	%xcc,	0x4
	nop
	setx loop_657, %l0, %l1
	jmpl %l1, %i4
	xorcc	%g6,	0x1F35,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x8BAAAFA6CC708A88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xCC7C3DF52AB86185,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f10,	%f16
loop_657:
	fmovsg	%xcc,	%f1,	%f15
	set	0x79, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l1
	orncc	%o4,	0x18FA,	%o2
	taddcctv	%l5,	%o1,	%l2
	fsrc1	%f10,	%f30
	alignaddrl	%o3,	%g2,	%o0
	movge	%icc,	%i0,	%g7
	fbne	%fcc0,	loop_658
	mulscc	%o5,	0x1477,	%l3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
loop_658:
	movre	%i1,	0x380,	%l0
	fmul8x16au	%f19,	%f4,	%f18
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x81,	%l6
	srl	%o7,	0x13,	%g1
	fbge,a	%fcc0,	loop_659
	fsrc2	%f10,	%f28
	array8	%i6,	%i5,	%i7
	bcc,a	%icc,	loop_660
loop_659:
	fnot1s	%f4,	%f16
	mulscc	%g3,	0x1E5B,	%g4
	udiv	%i2,	0x1A54,	%l4
loop_660:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f22,	[%l7 + 0x24]
	edge16n	%g5,	%i4,	%o6
	lduw	[%l7 + 0x10],	%g6
	mulscc	%o4,	%o2,	%l5
	prefetch	[%l7 + 0x64],	 0x0
	xnorcc	%o1,	%l1,	%l2
	movpos	%xcc,	%o3,	%o0
	st	%f17,	[%l7 + 0x20]
	membar	0x1A
	fbn,a	%fcc1,	loop_661
	alignaddr	%i0,	%g7,	%o5
	fbul,a	%fcc1,	loop_662
	membar	0x1E
loop_661:
	smulcc	%l3,	%g2,	%i3
	bvc,pn	%xcc,	loop_663
loop_662:
	subc	%l0,	%l6,	%o7
	fble	%fcc2,	loop_664
	fmul8x16au	%f28,	%f3,	%f20
loop_663:
	movl	%xcc,	%i1,	%g1
	fcmpne16	%f30,	%f22,	%i6
loop_664:
	nop
	fitod	%f6,	%f22
	fdtox	%f22,	%f24
	edge16ln	%i5,	%i7,	%g3
	brz	%i2,	loop_665
	edge32	%g4,	%l4,	%i4
	set	0x60, %g2
	swapa	[%l7 + %g2] 0x04,	%o6
loop_665:
	fbu,a	%fcc3,	loop_666
	be,a	loop_667
	tleu	%xcc,	0x6
	sub	%g6,	%o4,	%g5
loop_666:
	sllx	%l5,	%o1,	%o2
loop_667:
	brnz,a	%l1,	loop_668
	tvc	%icc,	0x4
	fmovrsgez	%o3,	%f16,	%f6
	fbe,a	%fcc2,	loop_669
loop_668:
	edge16ln	%l2,	%o0,	%g7
	ldsb	[%l7 + 0x40],	%i0
	set	0x10, %i2
	stxa	%o5,	[%l7 + %i2] 0xeb
	membar	#Sync
loop_669:
	srax	%l3,	%g2,	%l0
	alignaddr	%l6,	%o7,	%i3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%i1
	ldsw	[%l7 + 0x0C],	%i6
	movneg	%icc,	%i7,	%g3
	movrgez	%i5,	0x00A,	%g4
	movge	%icc,	%i2,	%l4
	srl	%o6,	%i4,	%g6
	edge32	%o4,	%l5,	%o1
	movrne	%g5,	0x28C,	%o2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x32] %asi,	%o3
	and	%l2,	%l1,	%o0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x77] %asi,	%g7
	edge32	%i0,	%l3,	%g2
	sth	%o5,	[%l7 + 0x3E]
	and	%l6,	%o7,	%i3
	edge8l	%l0,	%g1,	%i1
	fmovscs	%xcc,	%f8,	%f1
	smul	%i6,	0x0DB4,	%i7
	fmovrde	%g3,	%f24,	%f12
	fbe,a	%fcc2,	loop_670
	ble,a	loop_671
	addcc	%g4,	%i2,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_670:
	move	%icc,	%o6,	%i4
loop_671:
	prefetch	[%l7 + 0x44],	 0x3
	tsubcctv	%l4,	%g6,	%o4
	set	0x70, %o0
	stxa	%l5,	[%l7 + %o0] 0x2a
	membar	#Sync
	tsubcctv	%g5,	0x0E94,	%o1
	srax	%o2,	0x00,	%o3
	subc	%l1,	%l2,	%o0
	movcc	%icc,	%g7,	%l3
	edge32l	%g2,	%i0,	%l6
	edge8ln	%o7,	%o5,	%i3
	brlez,a	%l0,	loop_672
	alignaddrl	%g1,	%i6,	%i7
	fandnot1s	%f1,	%f0,	%f28
	fmovsl	%xcc,	%f9,	%f21
loop_672:
	sdiv	%i1,	0x1485,	%g4
	bcs,a,pn	%icc,	loop_673
	fbo,a	%fcc2,	loop_674
	fone	%f0
	tvc	%xcc,	0x5
loop_673:
	nop
	setx	loop_675,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_674:
	fandnot1s	%f6,	%f3,	%f24
	brnz,a	%i2,	loop_676
	fpsub16s	%f10,	%f17,	%f19
loop_675:
	sethi	0x1A8C,	%g3
	movcc	%xcc,	%i5,	%i4
loop_676:
	fmovrdgez	%l4,	%f28,	%f2
	fornot2s	%f6,	%f27,	%f11
	sir	0x0362
	xor	%g6,	%o6,	%o4
	stw	%l5,	[%l7 + 0x3C]
	tcc	%xcc,	0x1
	tvc	%icc,	0x0
	swap	[%l7 + 0x30],	%o1
	fcmple16	%f0,	%f6,	%o2
	ldsw	[%l7 + 0x20],	%o3
	movrgz	%l1,	%l2,	%g5
	andcc	%g7,	%o0,	%g2
	sir	0x1329
	movrlez	%i0,	%l6,	%l3
	popc	%o5,	%o7
	udivx	%i3,	0x0EF8,	%l0
	bge,pt	%xcc,	loop_677
	nop
	setx	0xCBEB4E69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE1FF29FC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f12,	%f27
	sub	%i6,	%g1,	%i1
	tgu	%xcc,	0x0
loop_677:
	brz	%g4,	loop_678
	fmovdpos	%icc,	%f7,	%f27
	fbn,a	%fcc0,	loop_679
	ldstub	[%l7 + 0x5C],	%i7
loop_678:
	be	%xcc,	loop_680
	orcc	%i2,	0x1C0E,	%i5
loop_679:
	tvc	%xcc,	0x2
	movre	%g3,	%l4,	%g6
loop_680:
	nop
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	sllx	%o6,	%o4,	%l5
	fmovsg	%icc,	%f15,	%f25
	edge32l	%o1,	%o2,	%o3
	mova	%xcc,	%l1,	%i4
	set	0x60, %l5
	lduwa	[%l7 + %l5] 0x14,	%l2
	ta	%xcc,	0x7
	sethi	0x0ACA,	%g7
	sdivx	%g5,	0x1720,	%g2
	andcc	%i0,	%o0,	%l3
	edge16	%l6,	%o7,	%o5
	fsrc2	%f14,	%f8
	fbl	%fcc3,	loop_681
	movrgez	%l0,	0x344,	%i3
	ldd	[%l7 + 0x18],	%f10
	fba	%fcc0,	loop_682
loop_681:
	srl	%g1,	%i1,	%g4
	edge16n	%i7,	%i6,	%i5
	fbule	%fcc3,	loop_683
loop_682:
	tvc	%xcc,	0x6
	popc	0x148E,	%i2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
loop_683:
	fble,a	%fcc3,	loop_684
	brlez,a	%g3,	loop_685
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f12,	%f14,	%o6
loop_684:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_685:
	movvc	%xcc,	%g6,	%o4
	movl	%xcc,	%l5,	%o1
	sir	0x19D2
	nop
	setx	0xF4B6A939,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x15F020B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f8,	%f9
	bgu	loop_686
	andn	%o3,	0x0FD3,	%o2
	fbl	%fcc2,	loop_687
	fmovrdgez	%i4,	%f26,	%f0
loop_686:
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f10
	fsrc1	%f24,	%f22
loop_687:
	brgz,a	%l1,	loop_688
	brgz	%g7,	loop_689
	xnorcc	%g5,	0x13DF,	%l2
	tsubcctv	%g2,	0x189E,	%o0
loop_688:
	fmovdg	%icc,	%f23,	%f27
loop_689:
	movrlez	%i0,	%l6,	%o7
	movrne	%o5,	0x3FD,	%l3
	tn	%xcc,	0x2
	srlx	%l0,	%i3,	%i1
	array16	%g1,	%i7,	%g4
	edge8l	%i5,	%i2,	%i6
	movge	%icc,	%l4,	%o6
	taddcctv	%g6,	%g3,	%l5
	bge,pt	%xcc,	loop_690
	bneg,a,pn	%icc,	loop_691
	ldsw	[%l7 + 0x18],	%o1
	tvc	%icc,	0x1
loop_690:
	fandnot1s	%f2,	%f1,	%f24
loop_691:
	nop
	setx	0x2063743A,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	tg	%xcc,	0x4
	umulcc	%o4,	%o3,	%i4
	fnor	%f20,	%f26,	%f20
	fpack32	%f2,	%f22,	%f2
	tsubcctv	%o2,	0x1AF2,	%l1
	bl	loop_692
	movre	%g7,	0x1D4,	%l2
	add	%g5,	%g2,	%i0
	nop
	setx	0xBF374260,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f9
loop_692:
	subc	%o0,	0x099F,	%l6
	fmovdpos	%xcc,	%f25,	%f8
	fnegs	%f25,	%f6
	popc	0x17D6,	%o5
	fandnot1s	%f14,	%f15,	%f19
	addccc	%l3,	%l0,	%i3
	sll	%i1,	%o7,	%i7
	array16	%g4,	%i5,	%i2
	fbu	%fcc0,	loop_693
	ldub	[%l7 + 0x30],	%g1
	andcc	%l4,	%o6,	%g6
	set	0x28, %l6
	ldxa	[%l7 + %l6] 0x80,	%g3
loop_693:
	orncc	%l5,	%o1,	%o4
	fcmple16	%f26,	%f24,	%i6
	fba,a	%fcc0,	loop_694
	fmovrslz	%i4,	%f15,	%f10
	nop
	fitod	%f4,	%f28
	fdtos	%f28,	%f24
	sra	%o2,	%l1,	%o3
loop_694:
	nop
	setx	0xB3ABCB73,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xD01E5742,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f10,	%f11
	fmovsleu	%icc,	%f23,	%f15
	umulcc	%l2,	%g5,	%g2
	tcs	%xcc,	0x2
	subc	%i0,	0x1C57,	%o0
	tl	%xcc,	0x2
	ldstub	[%l7 + 0x0E],	%g7
	faligndata	%f16,	%f16,	%f26
	sth	%l6,	[%l7 + 0x48]
	sdivcc	%o5,	0x1A94,	%l3
	tneg	%xcc,	0x3
	prefetch	[%l7 + 0x58],	 0x3
	nop
	setx	0x6B2E34BEA7B9185F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x070BF207680F0C61,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f22,	%f18
	fmul8x16	%f26,	%f4,	%f28
	be,a	%xcc,	loop_695
	edge8ln	%i3,	%i1,	%l0
	smul	%o7,	0x1D6A,	%g4
	movrlz	%i7,	%i2,	%g1
loop_695:
	xor	%i5,	%o6,	%g6
	orcc	%g3,	%l4,	%l5
	edge32l	%o4,	%o1,	%i4
	movvc	%xcc,	%i6,	%l1
	wr	%g0,	0x81,	%asi
	stwa	%o3,	[%l7 + 0x68] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_696
	swap	[%l7 + 0x20],	%l2
	st	%f20,	[%l7 + 0x54]
	movrlez	%o2,	%g5,	%i0
loop_696:
	ble,a,pt	%icc,	loop_697
	addc	%o0,	%g2,	%g7
	fbne	%fcc3,	loop_698
	fba	%fcc3,	loop_699
loop_697:
	stw	%o5,	[%l7 + 0x74]
	movge	%icc,	%l3,	%l6
loop_698:
	tsubcctv	%i3,	%i1,	%l0
loop_699:
	fmovrsgez	%o7,	%f8,	%f6
	smul	%g4,	0x039C,	%i2
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%i7
	array32	%g1,	%o6,	%g6
	subcc	%g3,	0x0E5D,	%l4
	fbg	%fcc1,	loop_700
	edge8ln	%i5,	%l5,	%o4
	movvs	%xcc,	%o1,	%i4
	xnor	%i6,	0x10BB,	%o3
loop_700:
	mulx	%l2,	%o2,	%l1
	fbu	%fcc2,	loop_701
	fbul,a	%fcc0,	loop_702
	nop
	setx	loop_703,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%i0,	%g5
loop_701:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x28] %asi,	%f31
loop_702:
	andn	%o0,	0x0F6B,	%g7
loop_703:
	ldx	[%l7 + 0x58],	%g2
	fmovdne	%xcc,	%f20,	%f6
	sethi	0x1C53,	%l3
	lduh	[%l7 + 0x16],	%l6
	nop
	setx	0x0E7A3B6A8A88ABF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x3755C8C806F51470,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f28,	%f22
	andncc	%i3,	%i1,	%l0
	brlez	%o7,	loop_704
	bg,pt	%xcc,	loop_705
	movl	%xcc,	%g4,	%o5
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f18
loop_704:
	be,a,pt	%icc,	loop_706
loop_705:
	xorcc	%i2,	0x0151,	%i7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o6
loop_706:
	movrgez	%g6,	0x307,	%g1
	xnorcc	%g3,	0x0609,	%i5
	subccc	%l4,	%o4,	%o1
	fbue	%fcc2,	loop_707
	fabsd	%f14,	%f8
	fpack16	%f16,	%f22
	sdivx	%l5,	0x0E98,	%i6
loop_707:
	ldstub	[%l7 + 0x3E],	%i4
	fandnot2s	%f15,	%f13,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l2,	0x0C8,	%o2
	array32	%l1,	%o3,	%g5
	tvs	%xcc,	0x0
	move	%icc,	%o0,	%g7
	udivx	%i0,	0x0925,	%g2
	alignaddrl	%l6,	%l3,	%i3
	wr	%g0,	0x88,	%asi
	stwa	%l0,	[%l7 + 0x44] %asi
	edge32ln	%o7,	%g4,	%o5
	xnorcc	%i2,	%i1,	%o6
	fpsub16	%f2,	%f24,	%f2
	tvs	%icc,	0x1
	membar	0x59
	lduh	[%l7 + 0x5C],	%g6
	nop
	setx	0x70242126F0552672,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	addc	%g1,	0x115D,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs	%icc,	loop_708
	bl,a,pt	%icc,	loop_709
	udivx	%g3,	0x0341,	%l4
	bvs,pt	%xcc,	loop_710
loop_708:
	tcs	%xcc,	0x0
loop_709:
	movn	%xcc,	%i5,	%o1
	fnot1	%f28,	%f18
loop_710:
	movrne	%l5,	%o4,	%i6
	nop
	fitod	%f19,	%f28
	fba	%fcc0,	loop_711
	fmovse	%icc,	%f19,	%f8
	brlz	%i4,	loop_712
	xnor	%l2,	0x0A06,	%o2
loop_711:
	movgu	%icc,	%l1,	%g5
	array32	%o0,	%g7,	%i0
loop_712:
	fpsub16s	%f5,	%f17,	%f7
	taddcc	%o3,	0x0F73,	%g2
	addccc	%l6,	0x0F7A,	%i3
	fmul8x16au	%f0,	%f29,	%f14
	movvc	%xcc,	%l3,	%o7
	array32	%g4,	%o5,	%l0
	tpos	%icc,	0x2
	fpadd16	%f6,	%f6,	%f28
	andncc	%i2,	%i1,	%g6
	set	0x48, %g3
	lduha	[%l7 + %g3] 0x14,	%g1
	fmovsvc	%xcc,	%f22,	%f6
	addccc	%i7,	%g3,	%l4
	fba,a	%fcc3,	loop_713
	movrgez	%i5,	%o6,	%o1
	bcs,a,pt	%xcc,	loop_714
	movvs	%xcc,	%l5,	%i6
loop_713:
	tgu	%xcc,	0x0
	fbug	%fcc1,	loop_715
loop_714:
	fnors	%f15,	%f13,	%f11
	be	%icc,	loop_716
	sllx	%i4,	0x12,	%l2
loop_715:
	fnands	%f3,	%f7,	%f3
	udivcc	%o4,	0x0B64,	%l1
loop_716:
	movre	%g5,	%o2,	%g7
	fpmerge	%f15,	%f23,	%f0
	movgu	%icc,	%o0,	%i0
	andn	%o3,	%g2,	%l6
	fpack32	%f20,	%f6,	%f20
	fmovdg	%icc,	%f2,	%f7
	tcs	%icc,	0x6
	addc	%l3,	0x023D,	%o7
	fornot1	%f10,	%f30,	%f8
	fmovscs	%icc,	%f30,	%f30
	edge32ln	%g4,	%i3,	%l0
	edge8n	%i2,	%i1,	%o5
	orn	%g1,	%g6,	%g3
	fmovrsgz	%l4,	%f12,	%f25
	movle	%icc,	%i7,	%i5
	edge8n	%o6,	%l5,	%o1
	fpack16	%f30,	%f10
	ldsb	[%l7 + 0x42],	%i4
	srlx	%l2,	%o4,	%l1
	fbo	%fcc0,	loop_717
	subc	%g5,	0x084D,	%o2
	fpsub32s	%f0,	%f27,	%f17
	movrlz	%i6,	0x15B,	%o0
loop_717:
	fors	%f12,	%f8,	%f19
	bg	loop_718
	addccc	%g7,	0x1FB3,	%i0
	sdivx	%g2,	0x04E2,	%l6
	fmovsle	%xcc,	%f18,	%f7
loop_718:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%o3,	[%l7 + 0x54] %asi
	fandnot1	%f8,	%f26,	%f26
	ldx	[%l7 + 0x68],	%o7
	umulcc	%g4,	%i3,	%l3
	tcc	%icc,	0x2
	tleu	%xcc,	0x3
	movrgez	%l0,	%i1,	%i2
	srlx	%g1,	0x1F,	%o5
	orcc	%g6,	%g3,	%i7
	edge8l	%l4,	%o6,	%i5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf9
	membar	#Sync
	nop
	setx loop_719, %l0, %l1
	jmpl %l1, %l5
	for	%f12,	%f28,	%f8
	brnz,a	%o1,	loop_720
	andcc	%i4,	%o4,	%l2
loop_719:
	udivx	%l1,	0x1A41,	%g5
	xnorcc	%i6,	%o2,	%g7
loop_720:
	mova	%xcc,	%i0,	%g2
	tsubcctv	%o0,	0x198E,	%l6
	sdivx	%o7,	0x14FB,	%g4
	movrlez	%i3,	0x00A,	%o3
	brlz	%l3,	loop_721
	sub	%i1,	0x1AC2,	%l0
	addc	%g1,	0x07CF,	%o5
	smulcc	%i2,	0x1E3E,	%g3
loop_721:
	fbule,a	%fcc2,	loop_722
	fmovdn	%xcc,	%f18,	%f27
	edge16ln	%i7,	%g6,	%o6
	fmovdle	%icc,	%f26,	%f27
loop_722:
	ldx	[%l7 + 0x48],	%l4
	smulcc	%i5,	%o1,	%l5
	movge	%xcc,	%o4,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%i4,	%f16,	%f24
	tcc	%xcc,	0x6
	fcmpgt32	%f30,	%f26,	%l1
	pdist	%f6,	%f30,	%f4
	orcc	%i6,	%g5,	%o2
	ta	%icc,	0x1
	sethi	0x1ABE,	%g7
	fpackfix	%f4,	%f23
	movpos	%xcc,	%i0,	%g2
	bpos,a,pn	%xcc,	loop_723
	tcc	%icc,	0x1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
loop_723:
	add	%o7,	%g4,	%i3
	fnands	%f28,	%f15,	%f8
	fands	%f27,	%f5,	%f28
	ldsh	[%l7 + 0x78],	%o3
	ldsb	[%l7 + 0x4A],	%l3
	fnot2	%f8,	%f18
	membar	0x69
	stx	%o0,	[%l7 + 0x60]
	addccc	%l0,	0x1C1E,	%i1
	ta	%icc,	0x3
	movpos	%icc,	%g1,	%i2
	or	%o5,	0x068D,	%g3
	fnand	%f14,	%f16,	%f16
	movl	%icc,	%i7,	%o6
	array8	%l4,	%g6,	%o1
	tne	%icc,	0x0
	bcs,a	loop_724
	sdivx	%l5,	0x1A6A,	%i5
	stx	%o4,	[%l7 + 0x08]
	fcmpne16	%f8,	%f2,	%i4
loop_724:
	fmovdle	%xcc,	%f8,	%f10
	addcc	%l2,	0x14C6,	%i6
	tvs	%icc,	0x3
	edge32	%g5,	%l1,	%o2
	add	%i0,	%g2,	%l6
	orcc	%g7,	0x0793,	%g4
	tn	%xcc,	0x7
	stw	%i3,	[%l7 + 0x1C]
	set	0x6A, %o1
	ldsha	[%l7 + %o1] 0x18,	%o3
	orn	%o7,	0x03D4,	%l3
	edge16l	%o0,	%l0,	%g1
	movrgez	%i2,	%o5,	%i1
	fmovsle	%xcc,	%f11,	%f30
	movne	%xcc,	%g3,	%i7
	bvs,a	%xcc,	loop_725
	subccc	%l4,	%o6,	%g6
	andncc	%o1,	%i5,	%l5
	tle	%xcc,	0x1
loop_725:
	subc	%o4,	%l2,	%i6
	stbar
	edge8l	%g5,	%i4,	%o2
	movcs	%icc,	%l1,	%g2
	movne	%icc,	%i0,	%l6
	fbge,a	%fcc0,	loop_726
	udivcc	%g4,	0x1304,	%i3
	edge16n	%o3,	%o7,	%g7
	set	0x78, %i1
	lduwa	[%l7 + %i1] 0x04,	%l3
loop_726:
	movrne	%o0,	0x37D,	%l0
	bl	%xcc,	loop_727
	addcc	%g1,	0x0C09,	%i2
	bcs,a	loop_728
	array32	%o5,	%i1,	%i7
loop_727:
	fbul	%fcc0,	loop_729
	orcc	%g3,	%l4,	%o6
loop_728:
	movn	%icc,	%g6,	%o1
	tcc	%icc,	0x5
loop_729:
	orn	%l5,	0x0FCC,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i5,	%l2,	%i6
	tpos	%xcc,	0x2
	fblg	%fcc1,	loop_730
	movrlez	%i4,	0x1D0,	%g5
	subc	%l1,	%o2,	%g2
	alignaddrl	%l6,	%i0,	%g4
loop_730:
	srax	%o3,	0x06,	%o7
	sir	0x0D66
	tpos	%icc,	0x2
	movcc	%xcc,	%i3,	%l3
	fabsd	%f14,	%f0
	fmovscs	%xcc,	%f5,	%f14
	movrlez	%o0,	%l0,	%g7
	add	%g1,	0x07D0,	%i2
	movgu	%xcc,	%i1,	%o5
	fmovrslez	%i7,	%f16,	%f6
	fpadd32s	%f28,	%f18,	%f2
	pdist	%f6,	%f4,	%f16
	lduh	[%l7 + 0x76],	%l4
	andn	%o6,	0x00C1,	%g3
	array32	%g6,	%o1,	%l5
	membar	0x0B
	addcc	%i5,	0x0302,	%l2
	fpadd32	%f26,	%f6,	%f26
	fnands	%f30,	%f21,	%f23
	movre	%i6,	0x03D,	%o4
	fcmpne16	%f26,	%f4,	%i4
	movg	%icc,	%l1,	%g5
	fbg,a	%fcc2,	loop_731
	fmovrsgez	%o2,	%f1,	%f24
	subcc	%g2,	%i0,	%l6
	nop
	setx loop_732, %l0, %l1
	jmpl %l1, %g4
loop_731:
	fcmpne16	%f0,	%f18,	%o7
	fbn	%fcc1,	loop_733
	bpos	%xcc,	loop_734
loop_732:
	andcc	%i3,	%l3,	%o3
	tsubcc	%l0,	0x1AA5,	%g7
loop_733:
	tsubcc	%o0,	0x0C17,	%i2
loop_734:
	sdiv	%i1,	0x0A9C,	%o5
	fcmpne32	%f10,	%f22,	%g1
	edge32l	%i7,	%o6,	%g3
	movl	%icc,	%l4,	%o1
	fcmpeq32	%f4,	%f28,	%l5
	bshuffle	%f2,	%f8,	%f22
	array16	%i5,	%g6,	%l2
	edge32n	%o4,	%i4,	%i6
	bcc	loop_735
	movre	%g5,	%o2,	%l1
	taddcctv	%i0,	%g2,	%g4
	ldub	[%l7 + 0x1A],	%l6
loop_735:
	movgu	%icc,	%i3,	%o7
	fone	%f14
	fmovsvc	%xcc,	%f20,	%f23
	edge8	%o3,	%l3,	%g7
	fmuld8sux16	%f4,	%f14,	%f12
	movcs	%xcc,	%l0,	%i2
	umulcc	%i1,	0x1C2E,	%o0
	tn	%xcc,	0x6
	sdivcc	%o5,	0x09F1,	%i7
	ldsh	[%l7 + 0x74],	%g1
	flush	%l7 + 0x30
	umul	%o6,	%l4,	%o1
	umul	%g3,	%l5,	%g6
	tne	%xcc,	0x2
	srax	%l2,	0x1B,	%i5
	fabss	%f16,	%f20
	andcc	%i4,	0x1A81,	%o4
	brlz,a	%i6,	loop_736
	fnot1s	%f18,	%f16
	fmovsvs	%icc,	%f16,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_736:
	movrlez	%o2,	%g5,	%i0
	fbn	%fcc1,	loop_737
	andn	%g2,	%g4,	%l6
	tvc	%icc,	0x7
	addccc	%i3,	0x0D34,	%o7
loop_737:
	fble	%fcc1,	loop_738
	add	%l1,	%o3,	%g7
	array32	%l0,	%i2,	%i1
	set	0x17, %l3
	stba	%o0,	[%l7 + %l3] 0x2f
	membar	#Sync
loop_738:
	sdiv	%l3,	0x0CF7,	%o5
	popc	0x11A1,	%g1
	bcc,pt	%icc,	loop_739
	fmovse	%icc,	%f25,	%f29
	sdivcc	%o6,	0x0364,	%l4
	taddcc	%o1,	0x15E4,	%i7
loop_739:
	bneg,a	%icc,	loop_740
	ba	%icc,	loop_741
	xorcc	%g3,	%g6,	%l5
	andn	%i5,	%i4,	%l2
loop_740:
	taddcc	%o4,	%o2,	%g5
loop_741:
	fmovsvc	%xcc,	%f10,	%f16
	movrne	%i6,	%g2,	%g4
	fmovdneg	%icc,	%f12,	%f2
	subccc	%l6,	%i0,	%i3
	fmovdpos	%xcc,	%f20,	%f25
	brgez	%o7,	loop_742
	addc	%l1,	%o3,	%g7
	fba,a	%fcc3,	loop_743
	edge16l	%l0,	%i1,	%o0
loop_742:
	movre	%l3,	0x170,	%i2
	sllx	%g1,	%o5,	%o6
loop_743:
	sdivcc	%l4,	0x1AE1,	%o1
	udivcc	%i7,	0x0711,	%g3
	fmovdge	%xcc,	%f13,	%f20
	sir	0x15D4
	fsrc1	%f22,	%f6
	smul	%l5,	0x1EC1,	%i5
	tvc	%icc,	0x2
	set	0x22, %i5
	ldsha	[%l7 + %i5] 0x81,	%i4
	tcc	%xcc,	0x3
	subccc	%l2,	%g6,	%o2
	ldd	[%l7 + 0x70],	%o4
	nop
	setx loop_744, %l0, %l1
	jmpl %l1, %i6
	tsubcctv	%g2,	0x0522,	%g5
	fxor	%f12,	%f6,	%f16
	edge16n	%g4,	%l6,	%i0
loop_744:
	nop
	set	0x1B, %g5
	ldsba	[%l7 + %g5] 0x14,	%i3
	sra	%o7,	%l1,	%o3
	tsubcctv	%l0,	%g7,	%i1
	sub	%o0,	%i2,	%g1
	movne	%icc,	%o5,	%l3
	ldub	[%l7 + 0x1B],	%o6
	movgu	%xcc,	%o1,	%l4
	movg	%icc,	%g3,	%l5
	sth	%i7,	[%l7 + 0x3A]
	tge	%icc,	0x0
	tvc	%icc,	0x4
	fbn,a	%fcc1,	loop_745
	fmovrdlz	%i4,	%f18,	%f0
	edge8	%l2,	%i5,	%o2
	movcc	%xcc,	%o4,	%g6
loop_745:
	tvs	%icc,	0x4
	edge16n	%i6,	%g5,	%g2
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x18,	%l6
	edge16ln	%g4,	%i3,	%i0
	tgu	%icc,	0x5
	fpsub32s	%f27,	%f17,	%f31
	wr	%g0,	0x19,	%asi
	stxa	%o7,	[%l7 + 0x50] %asi
	popc	0x1A3B,	%o3
	edge8	%l1,	%l0,	%g7
	taddcc	%o0,	0x0F39,	%i1
	andncc	%g1,	%o5,	%i2
	subccc	%l3,	%o1,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l4,	%g3
	fmovde	%icc,	%f15,	%f8
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x80,	%l5
	mulscc	%i7,	0x104C,	%l2
	fsrc2s	%f22,	%f15
	edge16n	%i4,	%i5,	%o2
	edge8n	%o4,	%i6,	%g5
	taddcctv	%g6,	0x1ADA,	%g2
	prefetch	[%l7 + 0x08],	 0x2
	set	0x74, %l2
	swapa	[%l7 + %l2] 0x89,	%g4
	edge8n	%l6,	%i3,	%i0
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1621,	%o7
	movvs	%icc,	%o3,	%l1
	fxnors	%f0,	%f18,	%f8
	fmovse	%xcc,	%f31,	%f23
	sth	%g7,	[%l7 + 0x28]
	srlx	%l0,	0x05,	%o0
	ldub	[%l7 + 0x2F],	%g1
	sdiv	%i1,	0x13B7,	%o5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x63] %asi,	%i2
	fmovrse	%o1,	%f9,	%f7
	sub	%o6,	%l3,	%l4
	subcc	%g3,	0x190B,	%i7
	tsubcctv	%l5,	0x1F9C,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l2,	0x003,	%i5
	fnot2	%f28,	%f4
	faligndata	%f16,	%f30,	%f2
	movleu	%xcc,	%o2,	%i6
	srlx	%o4,	%g6,	%g5
	fone	%f0
	tn	%icc,	0x1
	fnor	%f16,	%f20,	%f6
	fnegd	%f0,	%f0
	movneg	%xcc,	%g4,	%g2
	or	%l6,	%i3,	%o7
	and	%i0,	0x1EF3,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x7
	srax	%l1,	%g7,	%l0
	nop
	setx	loop_746,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc1	%f16,	%f4
	array32	%g1,	%o0,	%i1
	udivcc	%i2,	0x0B4B,	%o1
loop_746:
	bl,a	%xcc,	loop_747
	movneg	%icc,	%o5,	%l3
	movcc	%xcc,	%l4,	%g3
	mova	%icc,	%o6,	%i7
loop_747:
	edge16ln	%i4,	%l5,	%l2
	brnz	%i5,	loop_748
	array8	%i6,	%o2,	%g6
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
loop_748:
	swap	[%l7 + 0x60],	%o4
	orncc	%g4,	0x14AA,	%g5
	fble,a	%fcc0,	loop_749
	move	%xcc,	%l6,	%i3
	be,pn	%xcc,	loop_750
	edge16l	%o7,	%i0,	%g2
loop_749:
	bshuffle	%f20,	%f18,	%f2
	xorcc	%o3,	0x1018,	%l1
loop_750:
	movgu	%xcc,	%g7,	%g1
	addcc	%l0,	0x16F5,	%i1
	nop
	fitos	%f10,	%f19
	fstox	%f19,	%f0
	tl	%icc,	0x2
	addc	%i2,	%o0,	%o1
	fbe,a	%fcc2,	loop_751
	bne	loop_752
	tge	%icc,	0x5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x10
loop_751:
	tle	%xcc,	0x7
loop_752:
	edge16ln	%o5,	%l4,	%g3
	edge32	%o6,	%i7,	%i4
	fnands	%f23,	%f7,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f22
	xor	%l3,	0x1C2D,	%l2
	tvc	%xcc,	0x3
	fxnors	%f29,	%f31,	%f17
	or	%i5,	0x0D48,	%l5
	fone	%f16
	brgz	%i6,	loop_753
	tge	%xcc,	0x2
	sub	%o2,	%o4,	%g4
	addccc	%g6,	0x05A7,	%g5
loop_753:
	stx	%i3,	[%l7 + 0x50]
	tleu	%icc,	0x4
	fmovsa	%icc,	%f4,	%f26
	wr	%g0,	0x81,	%asi
	stxa	%o7,	[%l7 + 0x30] %asi
	movne	%icc,	%i0,	%l6
	ldx	[%l7 + 0x60],	%g2
	fmul8sux16	%f24,	%f20,	%f20
	tcs	%xcc,	0x3
	sra	%o3,	0x01,	%g7
	sra	%l1,	0x09,	%g1
	swap	[%l7 + 0x10],	%i1
	movgu	%icc,	%i2,	%o0
	taddcctv	%l0,	0x04E7,	%o1
	tcs	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l4,	%f4,	%f10
	srlx	%o5,	0x12,	%o6
	movne	%icc,	%i7,	%g3
	edge32l	%l3,	%l2,	%i5
	sdiv	%l5,	0x1585,	%i6
	stbar
	tcc	%icc,	0x5
	fpsub32s	%f25,	%f27,	%f18
	sdivx	%i4,	0x0B71,	%o4
	movge	%xcc,	%g4,	%o2
	edge8	%g6,	%i3,	%g5
	ldsb	[%l7 + 0x24],	%i0
	fxnor	%f8,	%f16,	%f18
	nop
	setx	0x832CF69E40585A2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	be	loop_754
	tvs	%xcc,	0x7
	movre	%l6,	0x175,	%o7
	mulscc	%g2,	%g7,	%l1
loop_754:
	edge8	%g1,	%o3,	%i2
	edge16n	%o0,	%l0,	%i1
	te	%icc,	0x6
	addcc	%l4,	0x0DBC,	%o5
	nop
	setx	loop_755,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%o6,	%i7,	%o1
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x2f,	%l2
loop_755:
	movrlez	%l2,	0x1FF,	%i5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%l5
	tne	%icc,	0x4
	edge16l	%i6,	%g3,	%i4
	nop
	setx	0x40658BE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	tvc	%xcc,	0x6
	movrlz	%o4,	0x2CD,	%g4
	mulscc	%o2,	%i3,	%g6
	ta	%xcc,	0x5
	fcmpeq32	%f26,	%f24,	%i0
	subcc	%g5,	0x0B64,	%o7
	fexpand	%f7,	%f18
	movleu	%xcc,	%g2,	%l6
	tsubcctv	%l1,	0x09A4,	%g7
	fcmpgt16	%f26,	%f10,	%g1
	movre	%o3,	0x0EE,	%o0
	array8	%l0,	%i1,	%i2
	fmuld8sux16	%f9,	%f27,	%f30
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%o5
	movvc	%icc,	%o6,	%l4
	mulx	%i7,	0x1ECD,	%o1
	taddcctv	%l3,	0x105B,	%i5
	xnor	%l5,	%l2,	%g3
	brgez	%i6,	loop_756
	tl	%icc,	0x2
	edge32n	%i4,	%g4,	%o4
	tge	%icc,	0x0
loop_756:
	movrlez	%i3,	0x39F,	%o2
	andncc	%i0,	%g6,	%g5
	fcmpne32	%f18,	%f24,	%g2
	fmovde	%icc,	%f20,	%f25
	set	0x5A, %i0
	ldsha	[%l7 + %i0] 0x11,	%o7
	fnegs	%f5,	%f24
	set	0x0A, %g1
	lduha	[%l7 + %g1] 0x15,	%l6
	fmovdne	%icc,	%f20,	%f19
	fpsub32	%f18,	%f14,	%f6
	sdivcc	%g7,	0x0CA9,	%l1
	nop
	fitod	%f8,	%f8
	bneg,pn	%icc,	loop_757
	movrgz	%g1,	0x01D,	%o3
	be,a	%xcc,	loop_758
	edge32n	%l0,	%i1,	%i2
loop_757:
	add	%o0,	%o6,	%o5
	tg	%icc,	0x5
loop_758:
	bge	%xcc,	loop_759
	sub	%l4,	0x05E5,	%i7
	addcc	%l3,	%o1,	%i5
	tle	%xcc,	0x7
loop_759:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x0E] %asi,	%l2
	srl	%l5,	%i6,	%i4
	tneg	%xcc,	0x7
	edge8l	%g4,	%g3,	%o4
	xorcc	%i3,	0x0EE5,	%o2
	fxnors	%f25,	%f12,	%f15
	movrne	%g6,	%g5,	%i0
	fpsub16s	%f4,	%f1,	%f24
	nop
	setx	0x858D3164,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xF5E38943,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f1,	%f7
	fmovdcs	%xcc,	%f10,	%f8
	fmovdl	%xcc,	%f18,	%f10
	fmovdgu	%xcc,	%f3,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x5
	movrgez	%g2,	0x142,	%o7
	array16	%l6,	%g7,	%l1
	fmovs	%f25,	%f25
	taddcc	%g1,	0x0521,	%l0
	bvc	%icc,	loop_760
	movneg	%xcc,	%i1,	%o3
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x15,	%i2
loop_760:
	andn	%o6,	0x1AB6,	%o0
	ldstub	[%l7 + 0x3D],	%l4
	wr	%g0,	0x89,	%asi
	stha	%i7,	[%l7 + 0x2A] %asi
	fcmpeq16	%f0,	%f10,	%o5
	edge8l	%o1,	%i5,	%l2
	popc	%l3,	%i6
	bl	loop_761
	bneg,pt	%xcc,	loop_762
	movvs	%xcc,	%i4,	%l5
	sub	%g4,	%o4,	%g3
loop_761:
	flush	%l7 + 0x74
loop_762:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x51] %asi,	%i3
	fmovdge	%xcc,	%f11,	%f24
	movre	%g6,	%o2,	%i0
	xnor	%g2,	%o7,	%l6
	fmovscc	%icc,	%f20,	%f0
	alignaddrl	%g7,	%l1,	%g5
	movrgz	%g1,	%l0,	%i1
	and	%i2,	%o6,	%o0
	sllx	%o3,	%l4,	%i7
	fmovs	%f7,	%f8
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x28] %asi,	%f2
	tcs	%icc,	0x1
	fba	%fcc0,	loop_763
	brgz	%o5,	loop_764
	sdivcc	%o1,	0x0076,	%l2
	movleu	%xcc,	%i5,	%i6
loop_763:
	fmovscc	%icc,	%f1,	%f11
loop_764:
	movvs	%xcc,	%i4,	%l5
	movle	%xcc,	%g4,	%o4
	bl,pn	%icc,	loop_765
	fmovrdlez	%l3,	%f22,	%f8
	bvs,pt	%xcc,	loop_766
	sra	%g3,	0x1A,	%i3
loop_765:
	sll	%g6,	0x07,	%i0
	array16	%g2,	%o2,	%l6
loop_766:
	movgu	%xcc,	%o7,	%g7
	edge8	%g5,	%l1,	%g1
	and	%l0,	0x0A68,	%i1
	set	0x38, %l4
	stha	%i2,	[%l7 + %l4] 0x80
	ldub	[%l7 + 0x7C],	%o6
	orncc	%o0,	0x17DC,	%l4
	bcc,a,pn	%xcc,	loop_767
	fpack32	%f6,	%f8,	%f30
	srlx	%i7,	0x1E,	%o3
	fbn	%fcc3,	loop_768
loop_767:
	ldub	[%l7 + 0x0F],	%o5
	array8	%o1,	%l2,	%i5
	edge32l	%i6,	%i4,	%l5
loop_768:
	nop
	setx	0x1072771A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movre	%o4,	%g4,	%g3
	fbue,a	%fcc3,	loop_769
	bn,a	loop_770
	subc	%i3,	%l3,	%i0
	fornot1s	%f25,	%f6,	%f18
loop_769:
	fornot1s	%f2,	%f11,	%f29
loop_770:
	tsubcctv	%g6,	%o2,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l6,	%o7
	tl	%xcc,	0x5
	andncc	%g7,	%l1,	%g5
	bn	%xcc,	loop_771
	fbuge	%fcc2,	loop_772
	te	%icc,	0x5
	set	0x38, %o2
	ldswa	[%l7 + %o2] 0x88,	%l0
loop_771:
	array16	%i1,	%g1,	%i2
loop_772:
	mulscc	%o6,	0x16FE,	%o0
	movg	%icc,	%l4,	%i7
	udivx	%o3,	0x1475,	%o5
	mova	%xcc,	%l2,	%i5
	sll	%o1,	%i4,	%i6
	te	%icc,	0x0
	array32	%o4,	%g4,	%l5
	fnot1	%f2,	%f20
	edge16	%g3,	%l3,	%i0
	fnegd	%f26,	%f6
	nop
	fitod	%f19,	%f4
	movcc	%icc,	%i3,	%g6
	brz	%g2,	loop_773
	edge16ln	%l6,	%o7,	%o2
	fba	%fcc0,	loop_774
	xorcc	%l1,	0x1DC1,	%g5
loop_773:
	fcmpgt32	%f22,	%f2,	%l0
	fmovrse	%g7,	%f16,	%f10
loop_774:
	ld	[%l7 + 0x0C],	%f31
	tneg	%xcc,	0x1
	sllx	%i1,	%g1,	%o6
	movrlez	%o0,	0x1C5,	%i2
	taddcc	%i7,	%l4,	%o3
	set	0x74, %o7
	ldswa	[%l7 + %o7] 0x19,	%o5
	fnot2s	%f20,	%f7
	umul	%i5,	%l2,	%o1
	umulcc	%i4,	0x0787,	%o4
	movrlez	%g4,	0x26F,	%l5
	tgu	%icc,	0x1
	ba,a	%xcc,	loop_775
	edge32	%g3,	%l3,	%i6
	fpack16	%f16,	%f8
	fmovrdgz	%i3,	%f24,	%f24
loop_775:
	movrlz	%g6,	0x13F,	%i0
	bneg,a	loop_776
	xnorcc	%l6,	0x030E,	%o7
	fmovsge	%icc,	%f19,	%f10
	fnands	%f15,	%f25,	%f1
loop_776:
	sethi	0x028F,	%o2
	nop
	fitos	%f3,	%f20
	fstox	%f20,	%f22
	movrgez	%g2,	0x202,	%l1
	fbne,a	%fcc3,	loop_777
	movrlez	%g5,	%g7,	%i1
	fornot1	%f26,	%f22,	%f18
	movl	%icc,	%g1,	%l0
loop_777:
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f6
	smul	%o0,	%i2,	%i7
	fmovdvc	%icc,	%f17,	%f3
	orcc	%o6,	0x10E6,	%o3
	stw	%l4,	[%l7 + 0x10]
	edge32ln	%o5,	%i5,	%o1
	tle	%xcc,	0x4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x15,	%l2
	fba	%fcc1,	loop_778
	tcs	%icc,	0x4
	fbn,a	%fcc3,	loop_779
	array32	%i4,	%o4,	%g4
loop_778:
	bgu,a	loop_780
	edge16	%g3,	%l3,	%l5
loop_779:
	mulscc	%i3,	0x14B4,	%i6
	fmovdpos	%xcc,	%f19,	%f8
loop_780:
	fblg,a	%fcc3,	loop_781
	fmovsg	%xcc,	%f14,	%f6
	fmovdl	%icc,	%f10,	%f10
	movre	%g6,	0x070,	%l6
loop_781:
	nop
	setx	0xA09FD517FEEDEAE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f8
	edge16l	%o7,	%i0,	%o2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x72] %asi,	%g2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	swap	[%l7 + 0x20],	%g7
	xor	%i1,	0x159F,	%g1
	xorcc	%g5,	0x0164,	%o0
	tne	%xcc,	0x6
	xnorcc	%l0,	0x0243,	%i7
	fpadd16	%f22,	%f12,	%f22
	brz	%o6,	loop_782
	edge8l	%i2,	%l4,	%o5
	udivcc	%o3,	0x0428,	%o1
	xor	%i5,	0x1CF0,	%l2
loop_782:
	movrgz	%o4,	%g4,	%i4
	edge8l	%l3,	%g3,	%i3
	fmovdvs	%xcc,	%f15,	%f10
	tneg	%xcc,	0x0
	swap	[%l7 + 0x4C],	%i6
	smulcc	%l5,	%g6,	%o7
	movneg	%xcc,	%l6,	%i0
	flush	%l7 + 0x44
	addcc	%o2,	0x0355,	%l1
	fmovdne	%icc,	%f27,	%f9
	movgu	%xcc,	%g2,	%g7
	array32	%g1,	%g5,	%i1
	udiv	%o0,	0x055B,	%l0
	tneg	%xcc,	0x6
	sdiv	%o6,	0x1DB5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x88A21CDF9212F746,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x64A7CDED4DC02EAC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f16,	%f30
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x70] %asi,	%f2
	subc	%i7,	0x0F65,	%l4
	fmul8sux16	%f24,	%f18,	%f28
	fnand	%f14,	%f28,	%f0
	sdivx	%o3,	0x0C0C,	%o5
	set	0x64, %l1
	stha	%o1,	[%l7 + %l1] 0x27
	membar	#Sync
	edge8n	%l2,	%o4,	%g4
	fmovdl	%icc,	%f31,	%f13
	and	%i4,	%l3,	%i5
	andcc	%g3,	0x0BF4,	%i3
	fmovsl	%icc,	%f29,	%f10
	smul	%i6,	%g6,	%o7
	add	%l5,	%i0,	%l6
	movge	%xcc,	%l1,	%o2
	alignaddrl	%g7,	%g1,	%g5
	andncc	%i1,	%o0,	%g2
	edge32	%o6,	%i2,	%i7
	movcc	%icc,	%l0,	%l4
	tcc	%xcc,	0x1
	smul	%o3,	%o1,	%l2
	fornot2s	%f17,	%f8,	%f23
	fpsub32s	%f10,	%f29,	%f12
	fmovrdne	%o5,	%f16,	%f30
	fmovsvc	%xcc,	%f31,	%f6
	smulcc	%g4,	%i4,	%o4
	fmovdgu	%icc,	%f5,	%f9
	ldsh	[%l7 + 0x26],	%l3
	andncc	%g3,	%i3,	%i6
	fbne,a	%fcc1,	loop_783
	movrgz	%i5,	0x1BD,	%g6
	smulcc	%l5,	%o7,	%l6
	movne	%xcc,	%l1,	%o2
loop_783:
	tleu	%xcc,	0x2
	smul	%g7,	%g1,	%i0
	fmovsvs	%xcc,	%f29,	%f24
	and	%i1,	0x08C1,	%g5
	fmovdgu	%icc,	%f24,	%f10
	fbne	%fcc3,	loop_784
	nop
	setx	0x0899F7A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x613BF24A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f27,	%f23
	taddcctv	%o0,	0x0EAA,	%g2
	fbul,a	%fcc0,	loop_785
loop_784:
	fba	%fcc1,	loop_786
	udivcc	%o6,	0x04BC,	%i2
	movrlez	%l0,	%l4,	%i7
loop_785:
	andncc	%o1,	%l2,	%o5
loop_786:
	fcmpne16	%f24,	%f8,	%g4
	fmovdcs	%icc,	%f10,	%f19
	nop
	fitos	%f6,	%f5
	fstox	%f5,	%f4
	movne	%icc,	%o3,	%i4
	movre	%l3,	0x0E5,	%g3
	nop
	setx	0xC3DC0F8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xE5C1BF6A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f3,	%f27
	tvc	%icc,	0x6
	movrgez	%o4,	%i3,	%i5
	fornot1s	%f8,	%f26,	%f10
	movvs	%icc,	%i6,	%g6
	nop
	setx	0x1C0FE49ED61160B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f2
	add	%l5,	0x19F4,	%l6
	ba,a,pn	%icc,	loop_787
	fbuge,a	%fcc0,	loop_788
	fnot1s	%f31,	%f4
	fmovrsne	%o7,	%f4,	%f9
loop_787:
	mulx	%l1,	%g7,	%g1
loop_788:
	addcc	%o2,	0x08C7,	%i0
	set	0x3F, %g6
	lduba	[%l7 + %g6] 0x14,	%g5
	tvs	%xcc,	0x2
	bpos	loop_789
	movne	%xcc,	%i1,	%o0
	bge,a	%icc,	loop_790
	fcmpne32	%f18,	%f16,	%o6
loop_789:
	tsubcc	%i2,	0x089C,	%l0
	nop
	setx	0x1695E3B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f25
loop_790:
	ldd	[%l7 + 0x38],	%l4
	ldx	[%l7 + 0x70],	%i7
	sethi	0x0B62,	%g2
	movrgez	%l2,	0x2E3,	%o5
	addccc	%o1,	0x142D,	%o3
	add	%i4,	0x1806,	%g4
	fmovsn	%xcc,	%f1,	%f20
	movrlz	%l3,	%g3,	%i3
	array16	%i5,	%o4,	%i6
	movle	%icc,	%g6,	%l6
	and	%l5,	%o7,	%g7
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f8
	ldsh	[%l7 + 0x2E],	%l1
	fmovsgu	%xcc,	%f3,	%f25
	tcs	%xcc,	0x2
	movcs	%icc,	%o2,	%g1
	fbg,a	%fcc2,	loop_791
	srl	%i0,	0x12,	%i1
	sethi	0x115E,	%g5
	fmovspos	%icc,	%f28,	%f31
loop_791:
	fmovsleu	%icc,	%f26,	%f24
	tleu	%xcc,	0x7
	fbne,a	%fcc2,	loop_792
	xnor	%o6,	0x0558,	%o0
	tcc	%xcc,	0x1
	srlx	%l0,	%l4,	%i2
loop_792:
	srlx	%g2,	0x18,	%l2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%o5
	or	%o1,	%o3,	%i7
	fmovsa	%icc,	%f1,	%f31
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%l3
	fors	%f17,	%f14,	%f28
	movg	%icc,	%g3,	%i3
	set	0x5E, %i4
	ldstuba	[%l7 + %i4] 0x11,	%i5
	fcmpgt16	%f0,	%f14,	%o4
	tvc	%xcc,	0x2
	nop
	setx	0x3D2E75D3DA57E619,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC6BBD782FF3A9A5E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f18,	%f14
	subc	%i6,	0x14EB,	%g4
	stbar
	lduw	[%l7 + 0x18],	%g6
	lduh	[%l7 + 0x4E],	%l6
	sll	%o7,	0x0F,	%l5
	alignaddrl	%l1,	%g7,	%o2
	tcc	%icc,	0x6
	ble,a	%icc,	loop_793
	lduh	[%l7 + 0x62],	%g1
	smul	%i1,	0x1F19,	%g5
	fmovsn	%icc,	%f4,	%f4
loop_793:
	movleu	%icc,	%i0,	%o0
	fandnot2	%f14,	%f0,	%f28
	fpadd32	%f20,	%f14,	%f20
	tle	%xcc,	0x5
	ta	%xcc,	0x3
	fnegd	%f4,	%f16
	fpackfix	%f16,	%f13
	movle	%xcc,	%o6,	%l0
	tneg	%xcc,	0x0
	nop
	setx	0x8D9EFE54,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x798DE7BF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f15,	%f8
	tpos	%xcc,	0x4
	edge8ln	%i2,	%g2,	%l4
	udiv	%l2,	0x04EC,	%o1
	umulcc	%o5,	%i7,	%i4
	pdist	%f18,	%f22,	%f18
	movrne	%l3,	%o3,	%g3
	movl	%xcc,	%i3,	%o4
	swap	[%l7 + 0x60],	%i5
	fabss	%f8,	%f11
	movvc	%xcc,	%i6,	%g6
	fmovdpos	%xcc,	%f28,	%f27
	add	%l7,	0x64,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g4,	%o7
	brz	%l5,	loop_794
	fnegs	%f30,	%f26
	movpos	%xcc,	%l1,	%g7
	edge32	%l6,	%o2,	%g1
loop_794:
	edge32ln	%g5,	%i1,	%o0
	movgu	%icc,	%i0,	%l0
	ldd	[%l7 + 0x60],	%f18
	movvs	%xcc,	%o6,	%g2
	andncc	%i2,	%l2,	%l4
	movg	%xcc,	%o5,	%i7
	fmovdpos	%xcc,	%f17,	%f11
	fandnot1	%f26,	%f24,	%f26
	and	%i4,	0x1E19,	%o1
	fpadd16	%f0,	%f16,	%f30
	andn	%o3,	%l3,	%g3
	tne	%icc,	0x5
	fone	%f10
	bvs,a	loop_795
	fornot1s	%f31,	%f25,	%f15
	edge16	%o4,	%i3,	%i5
	popc	%i6,	%g4
loop_795:
	brlez,a	%g6,	loop_796
	swap	[%l7 + 0x28],	%o7
	tsubcc	%l1,	0x1B47,	%g7
	fpadd16	%f30,	%f24,	%f4
loop_796:
	taddcctv	%l6,	%o2,	%l5
	set	0x2C, %o3
	ldstuba	[%l7 + %o3] 0x0c,	%g1
	fbn,a	%fcc0,	loop_797
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f8
	set	0x48, %i2
	ldstuba	[%l7 + %i2] 0x19,	%i1
loop_797:
	udivx	%o0,	0x0159,	%g5
	movrgez	%l0,	%i0,	%g2
	fmovsl	%icc,	%f18,	%f16
	movrgz	%o6,	0x33B,	%i2
	bn,a,pt	%icc,	loop_798
	fba	%fcc1,	loop_799
	tsubcctv	%l4,	%l2,	%o5
	tpos	%icc,	0x4
loop_798:
	sdivcc	%i4,	0x1522,	%o1
loop_799:
	bge,a	loop_800
	addc	%o3,	0x1500,	%l3
	prefetch	[%l7 + 0x58],	 0x3
	fbuge,a	%fcc1,	loop_801
loop_800:
	ble	%icc,	loop_802
	subccc	%g3,	0x1C40,	%o4
	udivx	%i3,	0x0AF4,	%i7
loop_801:
	ldstub	[%l7 + 0x21],	%i5
loop_802:
	nop
	fitod	%f14,	%f28
	fbn	%fcc1,	loop_803
	movvs	%xcc,	%g4,	%i6
	nop
	setx	loop_804,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f6,	%f2
loop_803:
	umulcc	%o7,	%l1,	%g6
	ta	%icc,	0x6
loop_804:
	fsrc1	%f26,	%f6
	movne	%icc,	%g7,	%l6
	set	0x3E, %o0
	ldsha	[%l7 + %o0] 0x19,	%l5
	fmovdl	%icc,	%f2,	%f1
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f30
	alignaddr	%g1,	%i1,	%o2
	xnor	%o0,	%g5,	%i0
	movrlz	%l0,	0x18F,	%o6
	sdivx	%i2,	0x1CBD,	%g2
	fsrc2	%f28,	%f20
	fmuld8ulx16	%f5,	%f20,	%f8
	fmovrde	%l4,	%f2,	%f30
	be	%icc,	loop_805
	fpadd32	%f20,	%f18,	%f10
	udivcc	%l2,	0x1C3C,	%o5
	tcs	%icc,	0x7
loop_805:
	fcmple32	%f4,	%f8,	%o1
	fbuge,a	%fcc2,	loop_806
	move	%icc,	%i4,	%l3
	array8	%o3,	%o4,	%i3
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x10,	 0x3
loop_806:
	add	%g3,	%g4,	%i6
	xnor	%o7,	0x150B,	%i5
	tvs	%icc,	0x3
	taddcctv	%g6,	%g7,	%l1
	edge16	%l5,	%g1,	%i1
	andncc	%l6,	%o0,	%o2
	sth	%i0,	[%l7 + 0x76]
	fzero	%f20
	fmovdg	%xcc,	%f13,	%f18
	prefetch	[%l7 + 0x24],	 0x0
	nop
	setx	0xA14BCF3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x43162654,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f29,	%f23
	fmovrslz	%g5,	%f22,	%f23
	xorcc	%l0,	%o6,	%g2
	edge32l	%l4,	%i2,	%l2
	movn	%xcc,	%o1,	%i4
	set	0x08, %l5
	lduha	[%l7 + %l5] 0x89,	%l3
	movrgez	%o3,	0x29D,	%o4
	tcc	%icc,	0x5
	fbo	%fcc1,	loop_807
	movneg	%xcc,	%o5,	%i3
	udivcc	%g3,	0x077D,	%i7
	tl	%xcc,	0x2
loop_807:
	andncc	%i6,	%g4,	%o7
	movrne	%i5,	0x3A6,	%g6
	call	loop_808
	edge32ln	%g7,	%l1,	%l5
	mulx	%g1,	0x1BAD,	%l6
	fbug	%fcc3,	loop_809
loop_808:
	add	%i1,	%o2,	%i0
	set	0x38, %o6
	ldsha	[%l7 + %o6] 0x11,	%g5
loop_809:
	sdiv	%l0,	0x0068,	%o0
	fmuld8ulx16	%f20,	%f28,	%f10
	fpadd32s	%f31,	%f24,	%f21
	nop
	fitos	%f4,	%f27
	taddcctv	%o6,	%g2,	%i2
	tsubcc	%l2,	%l4,	%i4
	bvc,pn	%xcc,	loop_810
	tgu	%icc,	0x4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x36] %asi,	%l3
loop_810:
	brlz,a	%o3,	loop_811
	fmovsgu	%icc,	%f27,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f14,	%f4,	%f28
loop_811:
	fmovdle	%icc,	%f23,	%f6
	edge16ln	%o4,	%o5,	%i3
	fmovse	%xcc,	%f13,	%f7
	brnz	%g3,	loop_812
	fpadd32	%f10,	%f14,	%f22
	nop
	setx	0xEB7F3C761074FC86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	bpos	%xcc,	loop_813
loop_812:
	edge16n	%i7,	%o1,	%i6
	addccc	%g4,	%i5,	%o7
	alignaddr	%g6,	%l1,	%l5
loop_813:
	call	loop_814
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f4,	%f20
	umul	%g1,	0x1119,	%g7
loop_814:
	movrlez	%i1,	0x101,	%l6
	alignaddr	%i0,	%o2,	%g5
	fbo	%fcc2,	loop_815
	tcc	%xcc,	0x0
	prefetch	[%l7 + 0x34],	 0x0
	mova	%xcc,	%l0,	%o0
loop_815:
	tn	%icc,	0x0
	tsubcctv	%o6,	0x17DE,	%g2
	movrlez	%i2,	%l2,	%l4
	addccc	%l3,	0x1CD1,	%i4
	fandnot1	%f22,	%f28,	%f24
	alignaddr	%o3,	%o4,	%i3
	fmovsne	%icc,	%f5,	%f27
	bcs	loop_816
	mulx	%g3,	%o5,	%i7
	bpos,a	loop_817
	bne,a,pn	%xcc,	loop_818
loop_816:
	srax	%i6,	%g4,	%o1
	bl,a,pt	%xcc,	loop_819
loop_817:
	fnand	%f0,	%f10,	%f2
loop_818:
	fmovd	%f6,	%f20
	addc	%i5,	0x0F8F,	%g6
loop_819:
	fnors	%f7,	%f26,	%f29
	movrne	%l1,	0x132,	%o7
	andcc	%g1,	%g7,	%l5
	fsrc2s	%f15,	%f3
	sdiv	%i1,	0x0FE5,	%l6
	taddcctv	%i0,	0x01DF,	%g5
	movg	%icc,	%o2,	%o0
	add	%o6,	%l0,	%g2
	nop
	fitos	%f6,	%f23
	fstoi	%f23,	%f4
	fnor	%f2,	%f16,	%f28
	movrlez	%l2,	%l4,	%i2
	edge32	%l3,	%i4,	%o4
	movvc	%xcc,	%o3,	%g3
	xor	%o5,	%i3,	%i7
	tsubcc	%i6,	0x1538,	%g4
	edge16	%i5,	%g6,	%l1
	fmovspos	%icc,	%f6,	%f14
	movg	%xcc,	%o1,	%o7
	movg	%icc,	%g1,	%g7
	bpos,a,pt	%icc,	loop_820
	tgu	%xcc,	0x4
	sir	0x1A39
	xnor	%l5,	%l6,	%i1
loop_820:
	edge32l	%i0,	%g5,	%o0
	tg	%icc,	0x2
	fbo,a	%fcc1,	loop_821
	edge8n	%o2,	%l0,	%g2
	subcc	%o6,	%l4,	%i2
	smulcc	%l3,	0x1534,	%l2
loop_821:
	fbg,a	%fcc3,	loop_822
	xnor	%o4,	%o3,	%g3
	xor	%i4,	0x05EA,	%o5
	movn	%xcc,	%i3,	%i6
loop_822:
	umul	%g4,	0x190A,	%i5
	edge8ln	%i7,	%l1,	%g6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf0
	membar	#Sync
	addccc	%o1,	%o7,	%g7
	fmovspos	%icc,	%f10,	%f24
	addccc	%g1,	%l6,	%l5
	bcc,pt	%xcc,	loop_823
	fbul,a	%fcc1,	loop_824
	movrgez	%i0,	0x15D,	%g5
	movrlz	%o0,	0x085,	%o2
loop_823:
	ldx	[%l7 + 0x50],	%l0
loop_824:
	movgu	%icc,	%g2,	%o6
	edge32n	%i1,	%l4,	%l3
	sub	%i2,	0x0871,	%o4
	fpadd32s	%f16,	%f31,	%f7
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l2
	movrgez	%g3,	0x12B,	%i4
	smul	%o5,	%i3,	%o3
	nop
	setx	0x904DAE4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	sub	%g4,	0x1CE4,	%i6
	fmovdcc	%icc,	%f22,	%f26
	sir	0x1387
	wr	%g0,	0x22,	%asi
	stwa	%i5,	[%l7 + 0x38] %asi
	membar	#Sync
	tvc	%xcc,	0x2
	fmul8x16au	%f2,	%f6,	%f6
	nop
	setx	loop_825,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x64
	movvs	%icc,	%i7,	%l1
	andncc	%o1,	%g6,	%g7
loop_825:
	edge16	%o7,	%l6,	%g1
	fnands	%f6,	%f21,	%f10
	edge8	%i0,	%g5,	%o0
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x81,	 0x0
	fbule,a	%fcc2,	loop_826
	fbne	%fcc0,	loop_827
	sir	0x042A
	fcmpne32	%f24,	%f30,	%l0
loop_826:
	edge16n	%o2,	%o6,	%i1
loop_827:
	xnor	%l4,	0x0257,	%l3
	alignaddr	%i2,	%o4,	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%g2,	%i4
	ba,a	%icc,	loop_828
	xorcc	%g3,	0x0429,	%i3
	sethi	0x1E7A,	%o5
	tneg	%xcc,	0x2
loop_828:
	and	%g4,	%i6,	%o3
	set	0x0C, %o1
	lduha	[%l7 + %o1] 0x19,	%i5
	mova	%icc,	%l1,	%o1
	brlez	%i7,	loop_829
	movn	%icc,	%g6,	%o7
	srlx	%l6,	%g7,	%i0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x15,	%f0
loop_829:
	edge32	%g5,	%g1,	%o0
	array16	%l0,	%o2,	%l5
	fmovrde	%o6,	%f28,	%f8
	nop
	fitod	%f28,	%f20
	bgu,pt	%xcc,	loop_830
	sll	%l4,	0x16,	%i1
	brgz	%l3,	loop_831
	mova	%icc,	%o4,	%i2
loop_830:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
loop_831:
	popc	0x1C3A,	%g2
	bcs,pt	%xcc,	loop_832
	fmuld8sux16	%f30,	%f28,	%f14
	fbug,a	%fcc2,	loop_833
	alignaddr	%i4,	%i3,	%g3
loop_832:
	fxnor	%f18,	%f26,	%f12
	tge	%icc,	0x0
loop_833:
	edge16l	%o5,	%g4,	%i6
	xorcc	%o3,	0x0F9E,	%l1
	bvc,pn	%icc,	loop_834
	smulcc	%i5,	%i7,	%o1
	sll	%o7,	%g6,	%g7
	fmuld8ulx16	%f1,	%f6,	%f28
loop_834:
	srl	%i0,	%l6,	%g5
	smulcc	%o0,	0x1452,	%g1
	movg	%icc,	%l0,	%o2
	fbue	%fcc2,	loop_835
	fxnors	%f21,	%f12,	%f29
	fandnot2	%f26,	%f20,	%f2
	ldsw	[%l7 + 0x5C],	%l5
loop_835:
	nop
	setx	0xE04C5D4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	fmovdleu	%xcc,	%f31,	%f5
	fmovsne	%xcc,	%f4,	%f0
	sll	%l4,	0x15,	%o6
	edge16	%l3,	%o4,	%i2
	tvc	%xcc,	0x7
	srax	%i1,	0x12,	%l2
	movcc	%icc,	%g2,	%i3
	fnot1s	%f17,	%f21
	fbne	%fcc1,	loop_836
	sir	0x1DE5
	smulcc	%i4,	0x1D7A,	%g3
	ldsw	[%l7 + 0x78],	%g4
loop_836:
	edge32n	%i6,	%o5,	%l1
	fpadd16	%f18,	%f8,	%f28
	edge16l	%o3,	%i7,	%o1
	fnors	%f7,	%f20,	%f2
	sir	0x15DA
	andn	%o7,	0x107B,	%g6
	st	%f24,	[%l7 + 0x68]
	ble,a,pt	%xcc,	loop_837
	tleu	%icc,	0x5
	nop
	setx	0xFAF3926F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xAC10F0E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f23,	%f14
	bpos	loop_838
loop_837:
	edge8l	%g7,	%i5,	%i0
	smul	%g5,	%o0,	%l6
	movge	%icc,	%l0,	%g1
loop_838:
	tcs	%icc,	0x1
	movrlz	%o2,	%l4,	%l5
	tneg	%icc,	0x2
	udivx	%l3,	0x0F1D,	%o4
	sdivx	%i2,	0x0AA1,	%i1
	edge32ln	%l2,	%o6,	%g2
	bgu,a	loop_839
	nop
	setx loop_840, %l0, %l1
	jmpl %l1, %i4
	fxor	%f22,	%f24,	%f14
	mulscc	%i3,	0x0266,	%g4
loop_839:
	array8	%g3,	%i6,	%o5
loop_840:
	fornot2s	%f29,	%f1,	%f28
	xnor	%l1,	%i7,	%o3
	movrgez	%o7,	0x399,	%g6
	fmovs	%f14,	%f29
	fcmpeq16	%f26,	%f6,	%o1
	tge	%icc,	0x4
	srlx	%g7,	0x17,	%i5
	bgu,a	%xcc,	loop_841
	srlx	%g5,	%o0,	%i0
	brnz,a	%l6,	loop_842
	fnot1	%f8,	%f18
loop_841:
	edge32ln	%l0,	%g1,	%o2
	mulx	%l5,	0x01C5,	%l3
loop_842:
	fpsub32s	%f0,	%f16,	%f22
	swap	[%l7 + 0x24],	%l4
	alignaddrl	%o4,	%i1,	%i2
	fbe	%fcc2,	loop_843
	tvs	%xcc,	0x1
	fand	%f2,	%f16,	%f10
	or	%o6,	0x1282,	%g2
loop_843:
	swap	[%l7 + 0x14],	%i4
	fmovrslz	%l2,	%f30,	%f30
	tgu	%icc,	0x6
	ta	%icc,	0x0
	bvs	%icc,	loop_844
	edge8ln	%i3,	%g3,	%i6
	edge8ln	%o5,	%l1,	%i7
	tleu	%icc,	0x7
loop_844:
	sdiv	%g4,	0x04D6,	%o7
	mulscc	%g6,	0x0E4A,	%o3
	fpack16	%f2,	%f23
	edge16l	%o1,	%g7,	%g5
	fandnot2	%f10,	%f24,	%f0
	nop
	setx	0xF05BEEC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	sdiv	%i5,	0x132D,	%o0
	swap	[%l7 + 0x50],	%l6
	edge16	%l0,	%g1,	%i0
	fnot2s	%f25,	%f19
	fones	%f18
	ldstub	[%l7 + 0x5A],	%l5
	stbar
	movrgez	%l3,	0x02A,	%l4
	sra	%o2,	0x0E,	%i1
	fands	%f8,	%f5,	%f17
	array32	%o4,	%o6,	%i2
	tleu	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f6,	%f3
	array16	%i4,	%l2,	%i3
	set	0x6C, %i1
	sta	%f6,	[%l7 + %i1] 0x11
	tleu	%icc,	0x2
	tvs	%xcc,	0x1
	fble,a	%fcc2,	loop_845
	fbule	%fcc0,	loop_846
	st	%f3,	[%l7 + 0x30]
	nop
	fitod	%f10,	%f28
	fdtox	%f28,	%f30
loop_845:
	tgu	%icc,	0x3
loop_846:
	sll	%g2,	0x1B,	%i6
	brgez,a	%o5,	loop_847
	srax	%g3,	0x07,	%i7
	fbl,a	%fcc3,	loop_848
	tpos	%icc,	0x4
loop_847:
	srax	%g4,	0x1B,	%l1
	movpos	%icc,	%o7,	%o3
loop_848:
	array16	%o1,	%g6,	%g7
	alignaddrl	%i5,	%o0,	%g5
	fmovsg	%icc,	%f17,	%f30
	udiv	%l6,	0x057C,	%l0
	fand	%f26,	%f16,	%f14
	edge32n	%g1,	%l5,	%l3
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%l4
	fmovsleu	%icc,	%f26,	%f8
	tl	%icc,	0x6
	array8	%i0,	%i1,	%o2
	fcmple32	%f26,	%f0,	%o4
	orncc	%o6,	%i4,	%l2
	edge32l	%i3,	%i2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g2,	0x0050,	%g3
	edge16ln	%i7,	%g4,	%o5
	ble,a	%xcc,	loop_849
	orncc	%l1,	%o7,	%o1
	movrlz	%o3,	%g7,	%i5
	set	0x76, %i5
	ldsba	[%l7 + %i5] 0x14,	%g6
loop_849:
	brlz	%g5,	loop_850
	tpos	%xcc,	0x0
	fexpand	%f14,	%f12
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%l6,	%o0
loop_850:
	ldub	[%l7 + 0x2A],	%g1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%l0
	nop
	fitos	%f3,	%f24
	fstoi	%f24,	%f27
	sethi	0x12B6,	%l5
	and	%l4,	0x1322,	%l3
	sth	%i0,	[%l7 + 0x1E]
	subcc	%i1,	%o2,	%o6
	wr	%g0,	0x10,	%asi
	stxa	%i4,	[%l7 + 0x68] %asi
	sir	0x0B8A
	smulcc	%o4,	0x017F,	%i3
	sdivcc	%l2,	0x19AB,	%i6
	edge32l	%g2,	%i2,	%i7
	sir	0x06D5
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x0c,	%f16
	movleu	%xcc,	%g3,	%o5
	taddcctv	%g4,	%l1,	%o1
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%o3
	ldsh	[%l7 + 0x0C],	%g7
	smulcc	%i5,	%g6,	%o7
	array32	%l6,	%o0,	%g5
	sethi	0x081A,	%g1
	nop
	fitos	%f14,	%f6
	fmuld8ulx16	%f10,	%f9,	%f14
	tle	%xcc,	0x6
	call	loop_851
	edge8ln	%l0,	%l4,	%l3
	tleu	%icc,	0x5
	fbne,a	%fcc0,	loop_852
loop_851:
	edge8	%i0,	%l5,	%i1
	bcc,pn	%icc,	loop_853
	fones	%f23
loop_852:
	srlx	%o2,	0x17,	%i4
	fbg	%fcc3,	loop_854
loop_853:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o6,	%o4,	%i3
	mulscc	%i6,	%g2,	%l2
loop_854:
	tneg	%icc,	0x6
	brnz,a	%i7,	loop_855
	fands	%f31,	%f13,	%f6
	tn	%xcc,	0x7
	fmovrsne	%i2,	%f17,	%f23
loop_855:
	sir	0x0AB5
	movrne	%o5,	%g3,	%g4
	set	0x58, %g7
	sta	%f30,	[%l7 + %g7] 0x81
	fmovscc	%xcc,	%f27,	%f7
	xor	%o1,	0x059F,	%l1
	fmul8x16al	%f17,	%f1,	%f26
	bcc,a	loop_856
	tn	%xcc,	0x0
	fcmpgt32	%f12,	%f4,	%g7
	brz	%o3,	loop_857
loop_856:
	movle	%xcc,	%i5,	%o7
	movg	%icc,	%l6,	%g6
	xnor	%g5,	%o0,	%g1
loop_857:
	array32	%l0,	%l3,	%i0
	movrlez	%l4,	%l5,	%o2
	smulcc	%i4,	0x105A,	%i1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrlz	%o4,	0x0D9,	%i3
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x18,	 0x0
	fmovdcs	%icc,	%f4,	%f1
	sdivx	%g2,	0x0A37,	%l2
	and	%i7,	%o6,	%o5
	subc	%i2,	%g4,	%o1
	sub	%g3,	%g7,	%o3
	nop
	fitos	%f14,	%f26
	fstod	%f26,	%f28
	lduw	[%l7 + 0x70],	%l1
	move	%icc,	%i5,	%o7
	be	%xcc,	loop_858
	movge	%icc,	%g6,	%g5
	std	%f22,	[%l7 + 0x68]
	tne	%xcc,	0x5
loop_858:
	be,a	loop_859
	xnor	%l6,	0x07DF,	%o0
	nop
	setx loop_860, %l0, %l1
	jmpl %l1, %g1
	fcmpne32	%f16,	%f18,	%l3
loop_859:
	st	%f22,	[%l7 + 0x40]
	nop
	setx	0x1075D229,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
loop_860:
	add	%i0,	0x1AF0,	%l0
	movneg	%icc,	%l4,	%o2
	bn,pt	%xcc,	loop_861
	edge16n	%l5,	%i1,	%o4
	tvs	%xcc,	0x7
	fmovrde	%i4,	%f6,	%f30
loop_861:
	add	%i6,	%g2,	%i3
	set	0x4C, %i3
	ldsha	[%l7 + %i3] 0x0c,	%i7
	bge,pt	%xcc,	loop_862
	xorcc	%l2,	%o5,	%i2
	fbue,a	%fcc1,	loop_863
	edge16ln	%g4,	%o6,	%g3
loop_862:
	fcmpgt32	%f8,	%f12,	%o1
	ba,a	%xcc,	loop_864
loop_863:
	edge32ln	%o3,	%l1,	%i5
	fbule	%fcc0,	loop_865
	fmovdvc	%xcc,	%f5,	%f27
loop_864:
	sdivcc	%g7,	0x0577,	%o7
	udivcc	%g5,	0x0E45,	%g6
loop_865:
	umulcc	%o0,	0x0A5F,	%g1
	nop
	setx	0xBBE7A669C7E0D31B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x11A51A4D8CDC2AE2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f20,	%f16
	fmovdvc	%xcc,	%f28,	%f2
	tvs	%xcc,	0x1
	bne,a	%icc,	loop_866
	sth	%l3,	[%l7 + 0x7E]
	movpos	%icc,	%i0,	%l0
	nop
	setx	0xE84B2105EED08383,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f4
loop_866:
	nop
	setx	loop_867,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%l6,	%l4,	%l5
	sllx	%i1,	%o4,	%o2
	xnor	%i4,	0x1DA3,	%g2
loop_867:
	edge16ln	%i3,	%i7,	%i6
	bleu	%xcc,	loop_868
	edge16	%o5,	%i2,	%l2
	flush	%l7 + 0x48
	movl	%xcc,	%g4,	%o6
loop_868:
	brlz,a	%o1,	loop_869
	lduw	[%l7 + 0x44],	%o3
	edge32n	%l1,	%i5,	%g7
	nop
	setx	0x8049A59D,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_869:
	fmovdleu	%icc,	%f31,	%f9
	tl	%icc,	0x6
	tg	%xcc,	0x5
	movg	%xcc,	%o7,	%g3
	mulscc	%g5,	%o0,	%g6
	edge8	%g1,	%i0,	%l3
	array8	%l6,	%l4,	%l0
	taddcc	%i1,	%l5,	%o2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o4
	fmovscs	%icc,	%f1,	%f2
	orncc	%g2,	%i3,	%i4
	udivx	%i7,	0x044F,	%i6
	srlx	%o5,	0x19,	%i2
	xnor	%l2,	0x0F9A,	%g4
	set	0x0, %l2
	stxa	%o6,	[%g0 + %l2] 0x5f
	brgez,a	%o1,	loop_870
	fmovrdgz	%o3,	%f24,	%f22
	tg	%icc,	0x6
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x7A] %asi,	%l1
loop_870:
	fcmple16	%f16,	%f0,	%g7
	fbu	%fcc1,	loop_871
	alignaddr	%o7,	%i5,	%g3
	udivx	%g5,	0x0D96,	%g6
	movrgz	%g1,	0x3A9,	%i0
loop_871:
	bgu,a,pn	%xcc,	loop_872
	edge16l	%l3,	%o0,	%l4
	fmul8x16	%f31,	%f16,	%f22
	fmovsvc	%icc,	%f19,	%f6
loop_872:
	pdist	%f2,	%f24,	%f6
	alignaddrl	%l6,	%l0,	%l5
	edge8ln	%o2,	%o4,	%i1
	udivx	%i3,	0x0A3D,	%i4
	ble,a	loop_873
	tvs	%xcc,	0x7
	movl	%icc,	%g2,	%i6
	fbl,a	%fcc1,	loop_874
loop_873:
	movneg	%xcc,	%o5,	%i2
	array32	%i7,	%l2,	%g4
	subc	%o1,	%o6,	%l1
loop_874:
	movre	%o3,	%o7,	%i5
	fmovsn	%xcc,	%f2,	%f6
	ble,a	%xcc,	loop_875
	orcc	%g7,	%g5,	%g3
	movrgez	%g1,	%i0,	%g6
	fba	%fcc0,	loop_876
loop_875:
	fpadd32	%f24,	%f0,	%f8
	tsubcctv	%o0,	%l3,	%l4
	fmovdvs	%xcc,	%f30,	%f26
loop_876:
	movg	%xcc,	%l0,	%l6
	tl	%xcc,	0x3
	andncc	%o2,	%o4,	%i1
	wr	%g0,	0xea,	%asi
	stwa	%i3,	[%l7 + 0x3C] %asi
	membar	#Sync
	tsubcc	%i4,	0x1334,	%g2
	addc	%i6,	0x13BF,	%o5
	or	%l5,	0x1FF6,	%i2
	te	%xcc,	0x1
	fors	%f27,	%f9,	%f4
	bn,a	%icc,	loop_877
	smul	%i7,	0x0909,	%l2
	subcc	%g4,	%o6,	%o1
	andcc	%l1,	%o3,	%i5
loop_877:
	movcc	%icc,	%o7,	%g7
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x81,	%g2
	tle	%xcc,	0x1
	fbug,a	%fcc2,	loop_878
	edge8n	%g5,	%i0,	%g6
	edge8n	%o0,	%l3,	%g1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x14
loop_878:
	ldstub	[%l7 + 0x59],	%l4
	addcc	%l6,	%l0,	%o2
	fxnors	%f28,	%f2,	%f23
	tvc	%xcc,	0x2
	tsubcctv	%o4,	%i1,	%i4
	flush	%l7 + 0x24
	mova	%icc,	%g2,	%i6
	fbne	%fcc3,	loop_879
	fmovsle	%icc,	%f13,	%f26
	sll	%o5,	0x1C,	%i3
	tgu	%xcc,	0x3
loop_879:
	movre	%i2,	%i7,	%l2
	fcmpgt16	%f24,	%f10,	%l5
	fcmpne32	%f22,	%f20,	%g4
	bneg,a,pt	%xcc,	loop_880
	array8	%o1,	%o6,	%o3
	fsrc1s	%f20,	%f23
	fandnot1	%f12,	%f16,	%f8
loop_880:
	move	%icc,	%l1,	%o7
	tcs	%icc,	0x4
	bneg	loop_881
	sdivx	%g7,	0x1408,	%g3
	fpack32	%f28,	%f6,	%f24
	movg	%xcc,	%g5,	%i5
loop_881:
	nop
	setx	loop_882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%i0,	0x0934,	%g6
	tneg	%icc,	0x2
	subccc	%o0,	0x1C44,	%g1
loop_882:
	addc	%l4,	%l6,	%l3
	tleu	%icc,	0x5
	ldsw	[%l7 + 0x74],	%o2
	movn	%xcc,	%l0,	%o4
	subcc	%i1,	0x18DC,	%i4
	popc	0x1389,	%i6
	xor	%g2,	0x0162,	%i3
	set	0x44, %g1
	stwa	%o5,	[%l7 + %g1] 0x89
	fmul8x16	%f8,	%f30,	%f28
	bge,a,pn	%icc,	loop_883
	addccc	%i7,	%i2,	%l2
	sth	%g4,	[%l7 + 0x4E]
	movcs	%xcc,	%o1,	%l5
loop_883:
	bleu,a,pt	%icc,	loop_884
	nop
	fitos	%f12,	%f2
	fstox	%f2,	%f10
	alignaddr	%o3,	%o6,	%l1
	sdivcc	%o7,	0x1847,	%g7
loop_884:
	udivx	%g5,	0x077D,	%i5
	te	%xcc,	0x5
	fcmple32	%f18,	%f16,	%g3
	fxnor	%f12,	%f8,	%f14
	nop
	setx	0xE4874009,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xA4E89126,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f8,	%f31
	fba	%fcc0,	loop_885
	fsrc1s	%f14,	%f1
	movne	%xcc,	%g6,	%o0
	bge	loop_886
loop_885:
	smulcc	%i0,	0x0CF9,	%l4
	movvc	%xcc,	%l6,	%g1
	fmovsvs	%xcc,	%f9,	%f6
loop_886:
	bg	%icc,	loop_887
	nop
	setx	loop_888,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%l3,	%l0,	%o4
	fmovdl	%xcc,	%f29,	%f6
loop_887:
	edge16l	%o2,	%i1,	%i6
loop_888:
	movl	%xcc,	%g2,	%i4
	set	0x2E, %l0
	lduha	[%l7 + %l0] 0x14,	%i3
	fbug,a	%fcc3,	loop_889
	add	%o5,	%i7,	%i2
	set	0x30, %l4
	stxa	%l2,	[%l7 + %l4] 0x2f
	membar	#Sync
loop_889:
	mova	%icc,	%o1,	%g4
	brz,a	%l5,	loop_890
	mova	%xcc,	%o6,	%o3
	fsrc1s	%f19,	%f28
	fmovdgu	%xcc,	%f20,	%f20
loop_890:
	fcmpeq32	%f28,	%f24,	%l1
	nop
	set	0x5C, %o2
	stw	%o7,	[%l7 + %o2]
	fbo	%fcc3,	loop_891
	fbl,a	%fcc1,	loop_892
	tsubcctv	%g5,	0x08B8,	%g7
	movvs	%xcc,	%i5,	%g6
loop_891:
	nop
	set	0x2C, %o7
	swapa	[%l7 + %o7] 0x80,	%g3
loop_892:
	fmovse	%icc,	%f21,	%f24
	addcc	%i0,	0x166A,	%l4
	tleu	%icc,	0x0
	addcc	%l6,	0x0CA1,	%o0
	fcmple32	%f22,	%f22,	%l3
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x2F] %asi,	%g1
	subccc	%o4,	%o2,	%l0
	fbug	%fcc0,	loop_893
	movrlz	%i1,	%i6,	%i4
	fsrc2s	%f25,	%f19
	bleu,pt	%icc,	loop_894
loop_893:
	nop
	fitos	%f10,	%f5
	fstoi	%f5,	%f16
	xor	%g2,	0x1965,	%o5
	edge16ln	%i7,	%i2,	%i3
loop_894:
	ta	%icc,	0x3
	array32	%l2,	%g4,	%o1
	tcs	%xcc,	0x6
	fmovsne	%icc,	%f15,	%f24
	bl,a	loop_895
	nop
	setx	0x06832457,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x71EDBCBC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f12,	%f1
	fmovsvs	%icc,	%f15,	%f22
	edge16l	%l5,	%o6,	%o3
loop_895:
	andcc	%l1,	0x15C0,	%g5
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x5D, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g7
	brlez	%i5,	loop_896
	edge32	%o7,	%g3,	%i0
	sub	%g6,	%l4,	%o0
	fmovrsne	%l6,	%f2,	%f1
loop_896:
	nop
	set	0x35, %l1
	ldstuba	[%l7 + %l1] 0x11,	%g1
	movgu	%xcc,	%o4,	%o2
	movrne	%l3,	0x37D,	%l0
	taddcctv	%i6,	0x0AE6,	%i1
	alignaddrl	%g2,	%o5,	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i7
	fmovsa	%icc,	%f5,	%f10
	stbar
	tcs	%xcc,	0x4
	tg	%icc,	0x2
	ldd	[%l7 + 0x48],	%f14
	ldx	[%l7 + 0x10],	%l2
	tg	%icc,	0x1
	fmovdn	%icc,	%f26,	%f4
	nop
	setx loop_897, %l0, %l1
	jmpl %l1, %g4
	movrlz	%o1,	0x072,	%i3
	umul	%o6,	%l5,	%l1
	movneg	%icc,	%g5,	%o3
loop_897:
	fmul8ulx16	%f30,	%f8,	%f14
	set	0x30, %g6
	ldswa	[%l7 + %g6] 0x88,	%i5
	fmovsg	%xcc,	%f31,	%f17
	tne	%icc,	0x5
	fmovsneg	%xcc,	%f28,	%f20
	subcc	%g7,	0x1D39,	%g3
	smul	%i0,	0x118C,	%g6
	tcc	%xcc,	0x1
	fexpand	%f6,	%f8
	edge8ln	%l4,	%o7,	%o0
	fblg	%fcc3,	loop_898
	xnorcc	%g1,	%o4,	%o2
	bge	%icc,	loop_899
	tg	%xcc,	0x7
loop_898:
	subccc	%l6,	%l0,	%i6
	te	%icc,	0x2
loop_899:
	xnorcc	%i1,	%l3,	%g2
	xor	%o5,	0x0B25,	%i4
	mulscc	%i7,	%i2,	%l2
	edge8n	%o1,	%g4,	%i3
	movle	%xcc,	%o6,	%l1
	subcc	%g5,	%o3,	%l5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	sdiv	%g3,	0x192A,	%i0
	movre	%g7,	0x3BE,	%g6
	fmul8ulx16	%f2,	%f2,	%f4
	bcc	loop_900
	fcmpgt16	%f26,	%f2,	%o7
	edge8l	%l4,	%g1,	%o0
	edge16ln	%o2,	%o4,	%l0
loop_900:
	fmovsn	%xcc,	%f15,	%f27
	fblg	%fcc3,	loop_901
	nop
	setx	0x22625940104BC8D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	udiv	%l6,	0x0E16,	%i6
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
loop_901:
	bcs,a,pn	%xcc,	loop_902
	tvs	%xcc,	0x4
	set	0x4C, %i0
	sta	%f29,	[%l7 + %i0] 0x11
loop_902:
	edge8l	%i1,	%o5,	%g2
	std	%f6,	[%l7 + 0x10]
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i7
	sethi	0x18AB,	%i4
	tneg	%icc,	0x3
	sth	%l2,	[%l7 + 0x56]
	ble	loop_903
	fbu,a	%fcc3,	loop_904
	movrlez	%o1,	0x207,	%i2
	sethi	0x1549,	%i3
loop_903:
	srl	%o6,	%g4,	%g5
loop_904:
	tsubcctv	%o3,	0x001B,	%l1
	andn	%l5,	%g3,	%i5
	wr	%g0,	0x22,	%asi
	stwa	%g7,	[%l7 + 0x1C] %asi
	membar	#Sync
	tcc	%icc,	0x2
	subccc	%i0,	%g6,	%l4
	sll	%o7,	%g1,	%o2
	movge	%xcc,	%o0,	%l0
	bcs,a	%xcc,	loop_905
	movge	%icc,	%l6,	%i6
	edge32	%l3,	%o4,	%i1
	mova	%icc,	%g2,	%o5
loop_905:
	edge16l	%i4,	%l2,	%i7
	fble,a	%fcc1,	loop_906
	fbug	%fcc2,	loop_907
	ldstub	[%l7 + 0x59],	%i2
	edge32ln	%o1,	%o6,	%g4
loop_906:
	movrne	%i3,	0x0D8,	%o3
loop_907:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%l1
	tsubcctv	%g5,	%l5,	%g3
	tneg	%xcc,	0x3
	tg	%xcc,	0x3
	bneg,pn	%xcc,	loop_908
	nop
	setx	0x8064B0B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fnand	%f30,	%f0,	%f4
	edge32n	%g7,	%i0,	%g6
loop_908:
	udiv	%l4,	0x0889,	%o7
	tpos	%xcc,	0x6
	edge32	%g1,	%i5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l0,	0x0214,	%l6
	fpackfix	%f4,	%f30
	fpsub16	%f26,	%f10,	%f8
	move	%icc,	%o0,	%i6
	orn	%o4,	%i1,	%l3
	fnot2s	%f12,	%f1
	tl	%icc,	0x3
	movrlez	%g2,	%i4,	%o5
	sth	%l2,	[%l7 + 0x30]
	set	0x38, %i4
	stba	%i7,	[%l7 + %i4] 0x11
	movrgez	%o1,	%i2,	%g4
	tn	%xcc,	0x6
	sra	%o6,	%o3,	%l1
	ba,a	%xcc,	loop_909
	tg	%xcc,	0x2
	fsrc1s	%f6,	%f6
	prefetch	[%l7 + 0x10],	 0x3
loop_909:
	fblg,a	%fcc0,	loop_910
	xnor	%i3,	%l5,	%g5
	fmovdne	%xcc,	%f13,	%f26
	move	%xcc,	%g3,	%g7
loop_910:
	fmuld8ulx16	%f17,	%f2,	%f22
	nop
	setx	0x65EBDC19FD639257,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA4641A60ADE49667,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f14,	%f20
	tvs	%icc,	0x0
	fbule,a	%fcc3,	loop_911
	edge32l	%g6,	%l4,	%o7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i0,	%i5
loop_911:
	call	loop_912
	nop
	fitos	%f1,	%f31
	subcc	%o2,	%g1,	%l6
	addc	%o0,	0x0E51,	%i6
loop_912:
	srax	%o4,	0x0F,	%i1
	brz	%l0,	loop_913
	movrne	%l3,	0x1DB,	%i4
	fandnot1s	%f6,	%f13,	%f11
	or	%o5,	0x1A2E,	%l2
loop_913:
	movpos	%icc,	%g2,	%o1
	bge,a,pn	%xcc,	loop_914
	movleu	%icc,	%i2,	%i7
	tge	%icc,	0x6
	array16	%g4,	%o6,	%o3
loop_914:
	movne	%xcc,	%i3,	%l1
	tleu	%xcc,	0x6
	smul	%l5,	%g3,	%g7
	fmovscs	%xcc,	%f16,	%f30
	addc	%g5,	%l4,	%g6
	alignaddr	%i0,	%o7,	%i5
	fabss	%f22,	%f12
	xnorcc	%o2,	0x0587,	%g1
	addc	%o0,	0x1382,	%l6
	stw	%o4,	[%l7 + 0x30]
	sllx	%i1,	0x03,	%i6
	addc	%l3,	0x1D02,	%l0
	sllx	%i4,	0x0F,	%o5
	sdivx	%l2,	0x0D2B,	%o1
	fmovs	%f12,	%f14
	fandnot1	%f6,	%f28,	%f24
	fmovsa	%xcc,	%f18,	%f27
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	orn	%i2,	%g4,	%i7
	tpos	%xcc,	0x5
	fmovrdgz	%o6,	%f18,	%f2
	tle	%xcc,	0x4
	bgu,a,pt	%icc,	loop_915
	be,a	%xcc,	loop_916
	nop
	setx	0x2F08B87BFB793612,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBFCB83F3F504A4FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f22,	%f22
	fsrc1s	%f0,	%f15
loop_915:
	movpos	%icc,	%i3,	%o3
loop_916:
	fmovdgu	%xcc,	%f16,	%f6
	movge	%xcc,	%l5,	%l1
	andcc	%g7,	%g5,	%g3
	tleu	%xcc,	0x5
	tleu	%xcc,	0x7
	smul	%l4,	0x107F,	%g6
	popc	0x1F81,	%i0
	sethi	0x0D58,	%o7
	sll	%i5,	%o2,	%g1
	bn,a	loop_917
	orncc	%o0,	%l6,	%i1
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_917:
	nop
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x89,	%o4
	mulx	%i6,	0x0CCD,	%l3
	tcs	%icc,	0x2
	fbg,a	%fcc3,	loop_918
	smul	%l0,	0x03F9,	%i4
	movrgez	%o5,	%o1,	%g2
	addc	%i2,	0x0814,	%g4
loop_918:
	tgu	%icc,	0x6
	orcc	%l2,	0x0055,	%o6
	addcc	%i7,	%i3,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x0
	brz,a	%l1,	loop_919
	xnor	%g7,	0x1C82,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x40],	%g3
loop_919:
	bleu,a,pn	%xcc,	loop_920
	ld	[%l7 + 0x18],	%f17
	tg	%icc,	0x4
	alignaddrl	%l4,	%g6,	%l5
loop_920:
	movl	%icc,	%i0,	%o7
	nop
	setx	0x14F2D10F706B3F7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	sra	%o2,	%i5,	%o0
	wr	%g0,	0x20,	%asi
	stxa	%g1,	[%g0 + 0x8] %asi
	tle	%xcc,	0x2
	set	0x20, %o0
	lduwa	[%l7 + %o0] 0x88,	%i1
	udiv	%l6,	0x1853,	%o4
	fbl	%fcc1,	loop_921
	sethi	0x08B5,	%i6
	stb	%l0,	[%l7 + 0x2B]
	addcc	%i4,	%l3,	%o1
loop_921:
	sdivcc	%o5,	0x1DD1,	%i2
	movrne	%g2,	0x181,	%g4
	nop
	fitod	%f6,	%f28
	fdtox	%f28,	%f24
	fbo	%fcc1,	loop_922
	srax	%l2,	%i7,	%o6
	set	0x18, %g2
	sta	%f4,	[%l7 + %g2] 0x11
loop_922:
	stx	%o3,	[%l7 + 0x20]
	fornot2s	%f11,	%f20,	%f0
	movle	%xcc,	%i3,	%l1
	edge8n	%g5,	%g3,	%g7
	fmovsvc	%xcc,	%f0,	%f0
	fmovrsgez	%l4,	%f30,	%f13
	fmovdleu	%xcc,	%f7,	%f18
	tcc	%xcc,	0x6
	addccc	%g6,	0x0621,	%i0
	add	%l5,	0x1EAF,	%o7
	brnz,a	%i5,	loop_923
	movre	%o2,	0x3C6,	%o0
	alignaddrl	%i1,	%g1,	%l6
	edge8n	%o4,	%i6,	%i4
loop_923:
	sub	%l0,	0x1C77,	%o1
	movneg	%icc,	%l3,	%i2
	fcmple32	%f6,	%f20,	%o5
	ld	[%l7 + 0x28],	%f5
	movge	%xcc,	%g4,	%l2
	fones	%f2
	fcmpgt16	%f2,	%f16,	%g2
	fbul,a	%fcc1,	loop_924
	bge,a,pt	%icc,	loop_925
	ta	%xcc,	0x5
	ldsw	[%l7 + 0x3C],	%i7
loop_924:
	fzeros	%f8
loop_925:
	movg	%xcc,	%o3,	%o6
	add	%l1,	0x1458,	%g5
	fmuld8ulx16	%f14,	%f10,	%f22
	ldsh	[%l7 + 0x7E],	%g3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%l4
	movpos	%xcc,	%g6,	%i0
	movne	%icc,	%l5,	%o7
	fxnor	%f28,	%f8,	%f14
	ld	[%l7 + 0x30],	%f26
	fnot2s	%f24,	%f9
	fmovsn	%xcc,	%f5,	%f5
	srlx	%i3,	%o2,	%i5
	fexpand	%f4,	%f18
	bleu,a	%icc,	loop_926
	movrlez	%o0,	0x314,	%i1
	ldd	[%l7 + 0x08],	%i6
	or	%o4,	0x12E1,	%g1
loop_926:
	srl	%i6,	0x14,	%i4
	brlez	%o1,	loop_927
	ldsh	[%l7 + 0x1C],	%l3
	array32	%i2,	%o5,	%g4
	udivx	%l2,	0x17C0,	%g2
loop_927:
	fmovdle	%xcc,	%f13,	%f21
	bpos,a,pn	%xcc,	loop_928
	array32	%l0,	%o3,	%i7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o6
loop_928:
	edge16ln	%g5,	%g3,	%g7
	fbge,a	%fcc0,	loop_929
	tleu	%icc,	0x4
	orcc	%l4,	%l1,	%i0
	fcmpeq16	%f22,	%f20,	%l5
loop_929:
	sdivx	%o7,	0x0157,	%g6
	tg	%icc,	0x5
	brlez,a	%i3,	loop_930
	fabsd	%f4,	%f24
	edge8ln	%i5,	%o0,	%i1
	fbuge,a	%fcc3,	loop_931
loop_930:
	fmuld8sux16	%f15,	%f12,	%f4
	andn	%o2,	%o4,	%g1
	fcmpeq32	%f26,	%f0,	%i6
loop_931:
	srlx	%i4,	0x00,	%o1
	movrne	%l6,	0x1AF,	%i2
	movvc	%xcc,	%o5,	%l3
	movl	%icc,	%l2,	%g4
	fxors	%f16,	%f18,	%f8
	fcmpgt32	%f4,	%f20,	%l0
	fpadd32	%f22,	%f2,	%f22
	fnors	%f19,	%f12,	%f21
	movcs	%xcc,	%g2,	%i7
	fpadd16s	%f18,	%f20,	%f29
	srax	%o6,	0x08,	%o3
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f20
	fxtos	%f20,	%f21
	edge16ln	%g3,	%g5,	%l4
	fcmpne32	%f14,	%f12,	%g7
	move	%icc,	%l1,	%i0
	ldd	[%l7 + 0x48],	%f20
	nop
	setx loop_932, %l0, %l1
	jmpl %l1, %l5
	tcs	%xcc,	0x6
	tcs	%icc,	0x5
	set	0x24, %l5
	lduwa	[%l7 + %l5] 0x15,	%o7
loop_932:
	movcc	%icc,	%i3,	%i5
	tl	%xcc,	0x5
	array16	%g6,	%i1,	%o0
	addc	%o4,	0x1669,	%g1
	bpos,pn	%icc,	loop_933
	be,a,pn	%xcc,	loop_934
	fcmple16	%f12,	%f26,	%o2
	bne,a,pt	%xcc,	loop_935
loop_933:
	te	%icc,	0x2
loop_934:
	umul	%i4,	%o1,	%l6
	edge16ln	%i2,	%o5,	%l3
loop_935:
	and	%i6,	%l2,	%l0
	xnor	%g2,	0x1E97,	%i7
	movneg	%xcc,	%o6,	%g4
	fzeros	%f2
	call	loop_936
	movle	%icc,	%o3,	%g5
	edge32l	%l4,	%g7,	%g3
	movgu	%icc,	%l1,	%i0
loop_936:
	brnz	%o7,	loop_937
	fmovscs	%xcc,	%f5,	%f9
	mova	%icc,	%l5,	%i5
	andn	%i3,	%i1,	%o0
loop_937:
	nop
	setx	0x6DF48480,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x930F4204,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f17,	%f13
	fblg,a	%fcc0,	loop_938
	edge32l	%o4,	%g6,	%g1
	fbl,a	%fcc2,	loop_939
	andncc	%i4,	%o2,	%o1
loop_938:
	fxor	%f28,	%f10,	%f4
	alignaddr	%l6,	%o5,	%i2
loop_939:
	mova	%icc,	%i6,	%l3
	movrlez	%l0,	0x01E,	%l2
	ldub	[%l7 + 0x6A],	%i7
	tle	%icc,	0x7
	umulcc	%o6,	%g4,	%g2
	tle	%xcc,	0x4
	sdiv	%g5,	0x179C,	%l4
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f10
	edge8ln	%o3,	%g3,	%l1
	fandnot1	%f2,	%f30,	%f10
	edge16ln	%g7,	%o7,	%l5
	te	%icc,	0x6
	wr	%g0,	0x5f,	%asi
	stxa	%i0,	[%g0 + 0x0] %asi
	fsrc1s	%f31,	%f2
	fmovrsgz	%i3,	%f17,	%f16
	lduh	[%l7 + 0x16],	%i5
	tn	%xcc,	0x0
	andncc	%i1,	%o0,	%o4
	swap	[%l7 + 0x4C],	%g1
	xor	%g6,	%i4,	%o1
	tcc	%xcc,	0x1
	fbug	%fcc3,	loop_940
	movcs	%xcc,	%l6,	%o2
	brgez	%i2,	loop_941
	tneg	%xcc,	0x5
loop_940:
	udiv	%i6,	0x17B6,	%o5
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%l3
loop_941:
	bg,a,pn	%xcc,	loop_942
	fnot2s	%f14,	%f9
	ble,pt	%xcc,	loop_943
	mulscc	%l0,	0x1416,	%l2
loop_942:
	nop
	fitod	%f8,	%f28
	movpos	%xcc,	%o6,	%i7
loop_943:
	edge8	%g2,	%g5,	%l4
	sth	%g4,	[%l7 + 0x0E]
	fbn,a	%fcc2,	loop_944
	bvc,a,pt	%xcc,	loop_945
	edge8l	%g3,	%o3,	%g7
	sethi	0x0A37,	%l1
loop_944:
	edge8n	%l5,	%i0,	%o7
loop_945:
	bcs,a	%icc,	loop_946
	edge32n	%i3,	%i1,	%o0
	xnorcc	%o4,	%g1,	%g6
	nop
	set	0x1F, %g3
	ldstub	[%l7 + %g3],	%i5
loop_946:
	movcs	%xcc,	%i4,	%o1
	bvc,a,pn	%icc,	loop_947
	tg	%icc,	0x3
	umul	%l6,	0x17F2,	%o2
	xnor	%i6,	%i2,	%o5
loop_947:
	edge16ln	%l0,	%l2,	%o6
	taddcctv	%l3,	0x1666,	%i7
	movneg	%xcc,	%g2,	%l4
	fbo	%fcc0,	loop_948
	nop
	setx	0xAC7A0334,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x337400BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f0,	%f8
	tsubcctv	%g4,	%g5,	%g3
	movrgez	%g7,	%l1,	%o3
loop_948:
	fpsub16	%f16,	%f0,	%f16
	edge8n	%l5,	%i0,	%o7
	movvs	%xcc,	%i3,	%o0
	xorcc	%i1,	0x16F6,	%o4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g1
	edge32n	%i5,	%i4,	%g6
	tgu	%icc,	0x6
	fba,a	%fcc1,	loop_949
	movne	%xcc,	%o1,	%o2
	edge16n	%i6,	%i2,	%o5
	stbar
loop_949:
	fbge,a	%fcc2,	loop_950
	brnz,a	%l6,	loop_951
	fbg	%fcc1,	loop_952
	nop
	setx	loop_953,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_950:
	edge32n	%l0,	%l2,	%o6
loop_951:
	fcmple32	%f6,	%f26,	%i7
loop_952:
	array8	%l3,	%l4,	%g2
loop_953:
	srlx	%g4,	0x1D,	%g3
	sra	%g5,	%g7,	%o3
	fands	%f31,	%f16,	%f13
	alignaddrl	%l1,	%l5,	%o7
	smulcc	%i0,	%i3,	%o0
	fmovsl	%icc,	%f13,	%f19
	tvc	%icc,	0x5
	udivx	%i1,	0x1A77,	%g1
	fsrc1s	%f24,	%f0
	array32	%o4,	%i4,	%g6
	move	%xcc,	%i5,	%o1
	tcc	%icc,	0x3
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x89
	fnot2	%f30,	%f4
	add	%o2,	0x010B,	%i6
	add	%o5,	0x0713,	%i2
	set	0x7C, %i2
	lda	[%l7 + %i2] 0x19,	%f1
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f4
	fxtos	%f4,	%f6
	tgu	%xcc,	0x1
	tg	%icc,	0x5
	fsrc1s	%f9,	%f13
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l6,	%l2
	udivcc	%o6,	0x0292,	%l0
	tvs	%icc,	0x5
	st	%f5,	[%l7 + 0x18]
	bn	loop_954
	bl	%xcc,	loop_955
	array32	%i7,	%l4,	%g2
	edge8ln	%l3,	%g3,	%g4
loop_954:
	movrlz	%g5,	0x26A,	%o3
loop_955:
	taddcc	%l1,	%l5,	%g7
	edge8ln	%o7,	%i0,	%i3
	nop
	set	0x48, %g4
	lduh	[%l7 + %g4],	%o0
	fsrc2	%f2,	%f16
	array32	%i1,	%o4,	%i4
	sethi	0x05A4,	%g6
	sub	%i5,	%g1,	%o1
	movle	%xcc,	%i6,	%o5
	fbe	%fcc1,	loop_956
	fornot2s	%f7,	%f9,	%f7
	edge32l	%o2,	%l6,	%l2
	fnors	%f12,	%f16,	%f14
loop_956:
	move	%icc,	%i2,	%l0
	fpsub32s	%f15,	%f22,	%f7
	taddcctv	%o6,	%l4,	%i7
	nop
	setx loop_957, %l0, %l1
	jmpl %l1, %l3
	ldsh	[%l7 + 0x24],	%g3
	sir	0x1953
	nop
	setx	0x518F1DC2A61D4B63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x1F3A1DCCF25E569F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f24
loop_957:
	nop
	setx	0xD273E1817065995E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movleu	%icc,	%g2,	%g4
	sdivcc	%g5,	0x0E90,	%o3
	brnz	%l5,	loop_958
	tpos	%xcc,	0x1
	tne	%xcc,	0x6
	movle	%xcc,	%g7,	%l1
loop_958:
	fmovde	%xcc,	%f18,	%f1
	movrgz	%i0,	0x072,	%i3
	udivcc	%o7,	0x1F57,	%i1
	ldub	[%l7 + 0x15],	%o0
	wr	%g0,	0xeb,	%asi
	stwa	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	udivx	%g6,	0x0EF0,	%i5
	fbule	%fcc3,	loop_959
	tcc	%xcc,	0x2
	movl	%icc,	%g1,	%o1
	membar	0x2B
loop_959:
	tvc	%icc,	0x4
	fcmple16	%f28,	%f12,	%i6
	andn	%i4,	0x11EC,	%o5
	tgu	%icc,	0x4
	fmovrsne	%l6,	%f5,	%f31
	or	%l2,	%i2,	%o2
	fba	%fcc3,	loop_960
	tsubcc	%o6,	%l4,	%i7
	udivx	%l3,	0x107F,	%l0
	fmul8x16	%f11,	%f10,	%f16
loop_960:
	sdivx	%g2,	0x191A,	%g3
	edge8ln	%g5,	%g4,	%o3
	wr	%g0,	0x23,	%asi
	stxa	%l5,	[%l7 + 0x70] %asi
	membar	#Sync
	ld	[%l7 + 0x48],	%f10
	fbne	%fcc0,	loop_961
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l1,	0x01BC,	%i0
	fcmpgt16	%f14,	%f0,	%i3
loop_961:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f2,	[%l7 + 0x20] %asi
	bg,a,pn	%icc,	loop_962
	tneg	%xcc,	0x1
	tn	%icc,	0x4
	udivcc	%g7,	0x05A8,	%o7
loop_962:
	movle	%xcc,	%o0,	%o4
	fbuge	%fcc1,	loop_963
	fmovrsgez	%i1,	%f5,	%f6
	tvs	%xcc,	0x1
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f12
	fxtod	%f12,	%f18
loop_963:
	or	%i5,	%g6,	%o1
	sra	%g1,	%i6,	%o5
	mulx	%l6,	0x1BFA,	%l2
	fmovrdlz	%i2,	%f12,	%f16
	tgu	%icc,	0x3
	sll	%o2,	0x09,	%i4
	movg	%xcc,	%l4,	%i7
	brlez	%o6,	loop_964
	fbo,a	%fcc3,	loop_965
	fpack32	%f14,	%f18,	%f24
	stb	%l3,	[%l7 + 0x4A]
loop_964:
	udivx	%g2,	0x17C9,	%l0
loop_965:
	call	loop_966
	movne	%icc,	%g3,	%g4
	orcc	%o3,	0x028F,	%g5
	umul	%l5,	0x1E76,	%l1
loop_966:
	srlx	%i0,	%i3,	%g7
	movle	%icc,	%o0,	%o7
	fble,a	%fcc0,	loop_967
	movrgez	%i1,	0x1D4,	%i5
	xorcc	%o4,	%o1,	%g6
	and	%i6,	0x0A5B,	%o5
loop_967:
	edge8n	%g1,	%l6,	%i2
	tvs	%xcc,	0x6
	movne	%xcc,	%o2,	%i4
	fsrc2	%f4,	%f0
	stb	%l4,	[%l7 + 0x7C]
	set	0x4C, %i1
	sta	%f9,	[%l7 + %i1] 0x11
	sth	%l2,	[%l7 + 0x62]
	fnegs	%f23,	%f12
	edge16	%o6,	%l3,	%g2
	umul	%l0,	%g3,	%i7
	edge8	%o3,	%g5,	%l5
	udiv	%l1,	0x0F9C,	%i0
	sir	0x1366
	andncc	%g4,	%g7,	%i3
	xor	%o7,	%i1,	%i5
	movl	%icc,	%o4,	%o0
	or	%g6,	0x12FA,	%o1
	fbl	%fcc1,	loop_968
	or	%i6,	0x1257,	%g1
	call	loop_969
	sub	%l6,	0x02FA,	%o5
loop_968:
	fnors	%f18,	%f22,	%f27
	srax	%i2,	0x0E,	%o2
loop_969:
	edge16l	%l4,	%i4,	%l2
	xorcc	%o6,	0x0F3F,	%l3
	stb	%l0,	[%l7 + 0x7A]
	tleu	%xcc,	0x0
	edge16l	%g3,	%g2,	%o3
	edge8	%g5,	%l5,	%l1
	edge8ln	%i7,	%g4,	%i0
	tleu	%icc,	0x0
	array32	%i3,	%o7,	%g7
	movl	%xcc,	%i5,	%i1
	bgu,pt	%xcc,	loop_970
	subccc	%o0,	0x130E,	%g6
	tgu	%icc,	0x4
	fmovscc	%icc,	%f19,	%f19
loop_970:
	tge	%icc,	0x1
	bne,a,pn	%xcc,	loop_971
	fornot2s	%f16,	%f18,	%f3
	movrgez	%o4,	%i6,	%o1
	movl	%xcc,	%g1,	%o5
loop_971:
	sdivx	%l6,	0x11F7,	%o2
	edge16	%i2,	%l4,	%l2
	edge8l	%i4,	%l3,	%o6
	ldstub	[%l7 + 0x09],	%g3
	edge32l	%l0,	%g2,	%o3
	fnors	%f15,	%f10,	%f18
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x38] %asi,	%g5
	nop
	setx	loop_972,	%l0,	%l1
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
	ble	%xcc,	loop_973
	xnor	%l1,	%i7,	%g4
loop_972:
	fmovrslz	%l5,	%f5,	%f15
	edge32n	%i3,	%i0,	%o7
loop_973:
	nop
	set	0x38, %l3
	lduha	[%l7 + %l3] 0x04,	%i5
	fmovsa	%xcc,	%f7,	%f23
	edge16l	%i1,	%o0,	%g7
	subc	%o4,	%g6,	%o1
	movn	%icc,	%i6,	%o5
	fmovrsgz	%l6,	%f10,	%f1
	edge16	%o2,	%g1,	%l4
	andncc	%i2,	%l2,	%l3
	mulx	%o6,	%g3,	%i4
	bvc,a	loop_974
	smul	%l0,	%o3,	%g2
	xorcc	%l1,	%g5,	%g4
	movl	%xcc,	%l5,	%i3
loop_974:
	brz	%i0,	loop_975
	movgu	%xcc,	%o7,	%i7
	movrgez	%i1,	0x1D0,	%i5
	fblg	%fcc2,	loop_976
loop_975:
	xnor	%g7,	%o4,	%o0
	ldd	[%l7 + 0x50],	%o0
	popc	0x13A4,	%g6
loop_976:
	movvc	%icc,	%i6,	%o5
	set	0x4C, %i5
	lduwa	[%l7 + %i5] 0x04,	%l6
	fandnot1	%f10,	%f24,	%f26
	ldub	[%l7 + 0x2D],	%g1
	fblg	%fcc0,	loop_977
	movn	%icc,	%o2,	%l4
	ldsb	[%l7 + 0x2B],	%l2
	orncc	%l3,	%o6,	%i2
loop_977:
	tneg	%xcc,	0x5
	orncc	%g3,	0x0AD5,	%l0
	and	%i4,	%g2,	%o3
	tcc	%icc,	0x1
	edge32l	%g5,	%l1,	%g4
	movrlez	%l5,	%i0,	%i3
	popc	%o7,	%i7
	xnor	%i5,	0x1529,	%i1
	nop
	setx	0x2DA119E73066B087,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fxor	%f30,	%f2,	%f14
	tvc	%icc,	0x0
	umul	%o4,	0x074C,	%o0
	fbuge,a	%fcc1,	loop_978
	addc	%g7,	0x1D6C,	%g6
	fbl	%fcc3,	loop_979
	sub	%i6,	0x007D,	%o1
loop_978:
	nop
	fitod	%f2,	%f2
	fdtos	%f2,	%f23
	ba,a,pt	%xcc,	loop_980
loop_979:
	umulcc	%l6,	0x0964,	%o5
	fzero	%f0
	movg	%xcc,	%o2,	%l4
loop_980:
	mova	%icc,	%g1,	%l3
	nop
	setx	0xED072C9A0059C30D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	bge	loop_981
	or	%l2,	%o6,	%g3
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x0C] %asi,	%i2
loop_981:
	movcc	%icc,	%l0,	%i4
	edge8n	%o3,	%g2,	%l1
	tn	%icc,	0x4
	fnand	%f28,	%f16,	%f20
	fmovdpos	%xcc,	%f28,	%f9
	movre	%g4,	%l5,	%g5
	fbug	%fcc1,	loop_982
	movrlez	%i3,	0x3D4,	%i0
	be,a,pn	%xcc,	loop_983
	movvs	%icc,	%o7,	%i5
loop_982:
	fmovdl	%icc,	%f0,	%f21
	tgu	%icc,	0x4
loop_983:
	faligndata	%f26,	%f4,	%f28
	nop
	setx	0xDA303DAED06D29CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fpadd32s	%f3,	%f5,	%f20
	edge16n	%i7,	%o4,	%o0
	array32	%g7,	%i1,	%g6
	subcc	%i6,	0x12A2,	%l6
	fbn	%fcc0,	loop_984
	tsubcc	%o1,	%o2,	%l4
	tsubcc	%o5,	%g1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_984:
	bl	%xcc,	loop_985
	edge8ln	%o6,	%l3,	%i2
	bneg,a	%xcc,	loop_986
	array32	%g3,	%l0,	%i4
loop_985:
	or	%g2,	0x1811,	%o3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g4
loop_986:
	srlx	%l5,	0x1A,	%l1
	addcc	%i3,	0x074C,	%i0
	fmovrsgez	%o7,	%f31,	%f15
	fnands	%f7,	%f9,	%f8
	smul	%i5,	%i7,	%g5
	ldx	[%l7 + 0x30],	%o0
	ldsh	[%l7 + 0x4E],	%g7
	sethi	0x1E90,	%o4
	fzero	%f30
	fmovsgu	%xcc,	%f24,	%f25
	xorcc	%i1,	0x1B18,	%g6
	and	%l6,	0x1B72,	%o1
	xnor	%o2,	%i6,	%l4
	tneg	%xcc,	0x4
	ldd	[%l7 + 0x40],	%f22
	tle	%icc,	0x7
	fmovscs	%icc,	%f21,	%f16
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tge	%xcc,	0x1
	andn	%o5,	0x03AE,	%l2
	subc	%o6,	0x0C0C,	%l3
	tpos	%icc,	0x0
	sth	%g1,	[%l7 + 0x56]
	movge	%icc,	%i2,	%g3
	movrne	%i4,	0x346,	%g2
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x12] %asi,	%l0
	fmovrsne	%g4,	%f21,	%f0
	subc	%o3,	%l5,	%l1
	bl	loop_987
	ldsw	[%l7 + 0x28],	%i0
	ldsw	[%l7 + 0x30],	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_987:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o7,	0x0922,	%i7
	fbul,a	%fcc2,	loop_988
	fmovdneg	%xcc,	%f28,	%f1
	tge	%icc,	0x7
	movvs	%icc,	%i5,	%g5
loop_988:
	mova	%icc,	%o0,	%o4
	set	0x36, %g5
	lduba	[%l7 + %g5] 0x10,	%g7
	movrgez	%g6,	0x36F,	%l6
	subccc	%i1,	0x07E2,	%o1
	or	%o2,	0x1474,	%i6
	tcs	%xcc,	0x5
	mova	%icc,	%l4,	%o5
	movn	%xcc,	%l2,	%l3
	xor	%g1,	%o6,	%g3
	sll	%i2,	0x12,	%i4
	tsubcctv	%g2,	0x0B57,	%l0
	nop
	setx	0x8648652B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f15
	fornot1s	%f1,	%f28,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pt	%xcc,	loop_989
	tleu	%xcc,	0x5
	movgu	%icc,	%o3,	%l5
	fbug	%fcc1,	loop_990
loop_989:
	movn	%xcc,	%g4,	%l1
	fbo,a	%fcc1,	loop_991
	or	%i3,	%i0,	%i7
loop_990:
	edge8n	%o7,	%i5,	%g5
	set	0x08, %g7
	stxa	%o4,	[%l7 + %g7] 0x18
loop_991:
	fmovsvs	%icc,	%f19,	%f8
	bvc,a	%icc,	loop_992
	taddcctv	%g7,	%o0,	%l6
	ldsh	[%l7 + 0x36],	%i1
	movleu	%xcc,	%o1,	%o2
loop_992:
	tne	%xcc,	0x4
	srl	%g6,	0x02,	%i6
	orncc	%o5,	%l2,	%l3
	edge8l	%g1,	%l4,	%o6
	fpadd16	%f4,	%f0,	%f2
	array16	%g3,	%i4,	%i2
	subccc	%l0,	0x1C83,	%g2
	membar	0x2A
	xorcc	%l5,	0x1C03,	%g4
	edge16l	%l1,	%i3,	%i0
	subccc	%i7,	0x00BD,	%o3
	sdivcc	%o7,	0x0DBF,	%i5
	tn	%icc,	0x6
	bcs,a	loop_993
	fmovdpos	%xcc,	%f10,	%f15
	tgu	%xcc,	0x6
	movneg	%icc,	%g5,	%g7
loop_993:
	ta	%xcc,	0x2
	umulcc	%o0,	%o4,	%i1
	fsrc2	%f0,	%f22
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x48] %asi,	%o1
	fmul8x16au	%f22,	%f4,	%f4
	tcs	%xcc,	0x3
	set	0x14, %i7
	lda	[%l7 + %i7] 0x14,	%f25
	brgez,a	%o2,	loop_994
	fmovdge	%xcc,	%f27,	%f23
	orn	%g6,	%l6,	%o5
	movpos	%icc,	%l2,	%l3
loop_994:
	umulcc	%g1,	0x05AA,	%i6
	bn,a,pn	%icc,	loop_995
	ldub	[%l7 + 0x0C],	%l4
	lduh	[%l7 + 0x7E],	%o6
	fpsub32s	%f10,	%f7,	%f6
loop_995:
	srlx	%i4,	%i2,	%g3
	movcc	%xcc,	%l0,	%l5
	movrlez	%g2,	%l1,	%i3
	membar	0x59
	xnor	%i0,	%g4,	%o3
	fmovrsne	%i7,	%f0,	%f4
	array32	%o7,	%g5,	%i5
	movrne	%g7,	0x240,	%o4
	wr	%g0,	0x2b,	%asi
	stha	%i1,	[%l7 + 0x72] %asi
	membar	#Sync
	tge	%icc,	0x3
	movcs	%icc,	%o1,	%o2
	stb	%g6,	[%l7 + 0x12]
	fmul8sux16	%f26,	%f28,	%f12
	orn	%o0,	0x19E1,	%o5
	tg	%icc,	0x0
	nop
	set	0x5C, %i3
	ldstub	[%l7 + %i3],	%l6
	fmovse	%icc,	%f26,	%f17
	array16	%l3,	%l2,	%i6
	srlx	%l4,	%o6,	%i4
	movrne	%i2,	%g1,	%l0
	fbuge,a	%fcc0,	loop_996
	edge32n	%l5,	%g3,	%g2
	movleu	%xcc,	%l1,	%i0
	fmovsvs	%icc,	%f21,	%f22
loop_996:
	movvc	%icc,	%g4,	%o3
	bge,a,pn	%icc,	loop_997
	tvs	%icc,	0x5
	movle	%icc,	%i3,	%o7
	movre	%g5,	%i7,	%g7
loop_997:
	addcc	%o4,	0x0D3C,	%i1
	bshuffle	%f10,	%f12,	%f0
	fpsub32	%f20,	%f8,	%f4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x10,	%o1,	%i5
	fblg	%fcc2,	loop_998
	brlz	%o2,	loop_999
	bl,pn	%xcc,	loop_1000
	udivcc	%g6,	0x12D1,	%o5
loop_998:
	fbo	%fcc2,	loop_1001
loop_999:
	edge32	%l6,	%o0,	%l3
loop_1000:
	fbne	%fcc1,	loop_1002
	movcc	%icc,	%i6,	%l4
loop_1001:
	nop
	setx	0x00D4C65C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xCE75ED82,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f18,	%f31
	subcc	%o6,	0x1881,	%i4
loop_1002:
	sdiv	%l2,	0x1E80,	%g1
	fmuld8sux16	%f18,	%f1,	%f12
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x23] %asi,	%l0
	fmovdn	%icc,	%f23,	%f25
	edge8ln	%l5,	%i2,	%g3
	and	%l1,	%g2,	%g4
	fbo	%fcc3,	loop_1003
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i0,	0x3B7,	%i3
	tn	%xcc,	0x7
loop_1003:
	smul	%o7,	0x1A17,	%o3
	fbul,a	%fcc3,	loop_1004
	edge8	%i7,	%g5,	%o4
	edge32n	%g7,	%o1,	%i1
	for	%f8,	%f20,	%f18
loop_1004:
	sll	%i5,	%g6,	%o2
	set	0x44, %o1
	sta	%f6,	[%l7 + %o1] 0x0c
	andn	%l6,	%o0,	%l3
	ldx	[%l7 + 0x68],	%i6
	mulscc	%l4,	%o6,	%o5
	bne,a,pn	%icc,	loop_1005
	and	%i4,	%l2,	%l0
	mulx	%l5,	0x15E3,	%i2
	edge16ln	%g1,	%l1,	%g3
loop_1005:
	movrne	%g4,	%g2,	%i3
	fxor	%f16,	%f2,	%f10
	movge	%icc,	%o7,	%i0
	fmovsle	%icc,	%f12,	%f0
	movrne	%i7,	0x1CC,	%o3
	tn	%xcc,	0x7
	tcs	%xcc,	0x1
	tcc	%icc,	0x7
	movrlez	%o4,	0x023,	%g7
	tle	%icc,	0x3
	orn	%g5,	0x000A,	%o1
	tsubcctv	%i1,	%i5,	%g6
	tvs	%xcc,	0x6
	orncc	%o2,	0x03A6,	%o0
	brlez	%l3,	loop_1006
	fcmple16	%f22,	%f20,	%i6
	bcc,pn	%icc,	loop_1007
	tg	%xcc,	0x4
loop_1006:
	array16	%l6,	%l4,	%o5
	subccc	%o6,	%l2,	%i4
loop_1007:
	fbg,a	%fcc2,	loop_1008
	fmovsne	%icc,	%f4,	%f27
	fbo	%fcc1,	loop_1009
	fmovrsgz	%l0,	%f6,	%f14
loop_1008:
	edge16n	%i2,	%g1,	%l5
	movne	%xcc,	%g3,	%l1
loop_1009:
	udivcc	%g2,	0x14AD,	%g4
	edge32l	%o7,	%i0,	%i3
	fbule,a	%fcc2,	loop_1010
	fbg	%fcc1,	loop_1011
	sdivx	%i7,	0x0425,	%o3
	fbo,a	%fcc3,	loop_1012
loop_1010:
	array32	%g7,	%g5,	%o4
loop_1011:
	move	%xcc,	%o1,	%i5
	fcmple16	%f18,	%f6,	%i1
loop_1012:
	movrne	%o2,	0x25F,	%o0
	move	%xcc,	%l3,	%g6
	taddcctv	%i6,	0x1314,	%l4
	fzeros	%f30
	movl	%icc,	%o5,	%l6
	tsubcctv	%l2,	0x143D,	%o6
	fzeros	%f3
	st	%f16,	[%l7 + 0x68]
	fmovrslz	%l0,	%f13,	%f1
	edge8ln	%i4,	%i2,	%l5
	bvc,a	loop_1013
	fmovdcc	%icc,	%f5,	%f30
	xnorcc	%g3,	0x0ADD,	%g1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x58] %asi,	%f6
loop_1013:
	tg	%xcc,	0x4
	set	0x75, %o4
	ldstuba	[%l7 + %o4] 0x0c,	%g2
	ble	loop_1014
	fbo	%fcc0,	loop_1015
	tvs	%icc,	0x7
	call	loop_1016
loop_1014:
	bn,pn	%xcc,	loop_1017
loop_1015:
	movl	%icc,	%g4,	%o7
	faligndata	%f16,	%f12,	%f0
loop_1016:
	bge,a	loop_1018
loop_1017:
	fbul,a	%fcc0,	loop_1019
	movvc	%icc,	%i0,	%i3
	stb	%i7,	[%l7 + 0x21]
loop_1018:
	sra	%l1,	%g7,	%g5
loop_1019:
	movgu	%xcc,	%o4,	%o1
	movrgez	%i5,	%o3,	%i1
	sll	%o2,	0x12,	%l3
	subccc	%o0,	0x1F1F,	%i6
	addc	%l4,	0x1AAD,	%g6
	bneg,pt	%xcc,	loop_1020
	movcs	%icc,	%o5,	%l6
	bl	%icc,	loop_1021
	array8	%o6,	%l2,	%i4
loop_1020:
	bgu,pn	%xcc,	loop_1022
	tl	%icc,	0x5
loop_1021:
	fmovdne	%xcc,	%f17,	%f19
	movg	%icc,	%l0,	%l5
loop_1022:
	fornot2s	%f4,	%f6,	%f16
	ba,pt	%icc,	loop_1023
	addc	%g3,	%g1,	%i2
	andncc	%g2,	%o7,	%g4
	te	%xcc,	0x6
loop_1023:
	and	%i3,	0x0C01,	%i7
	orcc	%l1,	0x0299,	%g7
	fbug,a	%fcc2,	loop_1024
	subc	%i0,	%g5,	%o1
	orncc	%i5,	%o4,	%o3
	alignaddr	%i1,	%l3,	%o0
loop_1024:
	mulscc	%i6,	%o2,	%l4
	fba,a	%fcc0,	loop_1025
	addcc	%g6,	0x04EA,	%l6
	fzero	%f30
	fpadd32s	%f11,	%f22,	%f22
loop_1025:
	addccc	%o6,	%l2,	%i4
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sll	%o5,	%l5,	%g3
	fsrc2s	%f8,	%f29
	tcc	%icc,	0x7
	fnand	%f22,	%f24,	%f16
	tn	%icc,	0x7
	edge32n	%g1,	%i2,	%g2
	edge8ln	%l0,	%g4,	%o7
	fmovsge	%icc,	%f6,	%f17
	fnot2s	%f28,	%f26
	edge32l	%i7,	%i3,	%g7
	fbuge	%fcc2,	loop_1026
	nop
	setx loop_1027, %l0, %l1
	jmpl %l1, %l1
	tne	%xcc,	0x3
	subcc	%i0,	0x0726,	%g5
loop_1026:
	addc	%o1,	0x0642,	%o4
loop_1027:
	fbue,a	%fcc3,	loop_1028
	edge8l	%o3,	%i5,	%i1
	fandnot1s	%f13,	%f21,	%f7
	taddcc	%o0,	0x11A0,	%i6
loop_1028:
	edge32n	%l3,	%l4,	%g6
	fnot2s	%f27,	%f30
	fornot1	%f22,	%f16,	%f6
	edge16l	%l6,	%o2,	%o6
	sethi	0x1AF7,	%i4
	tgu	%icc,	0x0
	te	%xcc,	0x1
	set	0x5C, %o5
	stha	%o5,	[%l7 + %o5] 0x81
	movl	%xcc,	%l5,	%g3
	edge8n	%l2,	%g1,	%i2
	fpsub16s	%f15,	%f23,	%f6
	brgz,a	%g2,	loop_1029
	fmovsneg	%icc,	%f14,	%f4
	tneg	%xcc,	0x1
	movge	%icc,	%l0,	%g4
loop_1029:
	udiv	%o7,	0x0458,	%i3
	fmovdg	%xcc,	%f11,	%f10
	array8	%g7,	%i7,	%l1
	tpos	%xcc,	0x2
	tneg	%xcc,	0x4
	edge32	%i0,	%o1,	%g5
	fmovrsgez	%o4,	%f1,	%f6
	tne	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	stha	%i5,	[%l7 + 0x2C] %asi
	set	0x14, %g1
	lduba	[%l7 + %g1] 0x81,	%i1
	set	0x76, %l0
	lduha	[%l7 + %l0] 0x81,	%o3
	fmul8x16	%f11,	%f30,	%f22
	fpmerge	%f21,	%f27,	%f14
	sra	%i6,	%l3,	%o0
	movrlz	%g6,	%l6,	%l4
	mulscc	%o2,	%o6,	%o5
	fmuld8sux16	%f10,	%f26,	%f2
	addccc	%l5,	0x1DDF,	%g3
	bleu,pt	%icc,	loop_1030
	fexpand	%f4,	%f30
	nop
	setx	0x45315B1A703203F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f14
	lduw	[%l7 + 0x70],	%l2
loop_1030:
	fzeros	%f11
	bgu,a,pt	%xcc,	loop_1031
	bvc,a	loop_1032
	addcc	%g1,	%i2,	%i4
	nop
	setx	0x01E206B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xAE3C7D07,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f5,	%f5
loop_1031:
	mulscc	%g2,	0x1103,	%l0
loop_1032:
	orcc	%g4,	%o7,	%g7
	tne	%icc,	0x7
	andcc	%i3,	%l1,	%i0
	fpadd16	%f2,	%f0,	%f10
	movre	%o1,	0x30C,	%g5
	tvc	%icc,	0x5
	bne,pt	%xcc,	loop_1033
	subc	%i7,	%o4,	%i5
	or	%o3,	%i6,	%l3
	tge	%icc,	0x1
loop_1033:
	fble	%fcc1,	loop_1034
	tl	%icc,	0x7
	brz	%i1,	loop_1035
	bleu,pt	%icc,	loop_1036
loop_1034:
	movvc	%icc,	%g6,	%o0
	subccc	%l4,	0x10E0,	%o2
loop_1035:
	te	%icc,	0x0
loop_1036:
	fmovrsgz	%o6,	%f3,	%f7
	set	0x2C, %l2
	swapa	[%l7 + %l2] 0x89,	%l6
	ldsh	[%l7 + 0x22],	%o5
	fmovrdlz	%l5,	%f26,	%f26
	array8	%l2,	%g3,	%g1
	array32	%i2,	%i4,	%g2
	fpackfix	%f12,	%f6
	taddcctv	%l0,	%g4,	%g7
	nop
	setx	0x9607C0A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x56E217AA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f6,	%f28
	mulx	%i3,	0x091F,	%l1
	sll	%i0,	0x14,	%o7
	movvc	%icc,	%g5,	%i7
	fsrc2s	%f15,	%f21
	brlz,a	%o1,	loop_1037
	edge32ln	%o4,	%i5,	%i6
	movle	%icc,	%o3,	%i1
	fsrc1s	%f3,	%f26
loop_1037:
	movg	%xcc,	%l3,	%g6
	brgez,a	%l4,	loop_1038
	smul	%o2,	0x1226,	%o6
	ld	[%l7 + 0x2C],	%f6
	orncc	%l6,	0x1B4E,	%o5
loop_1038:
	nop
	setx	0x805CF7BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fmovrdgez	%l5,	%f30,	%f8
	movge	%icc,	%l2,	%o0
	ldd	[%l7 + 0x28],	%f24
	ta	%icc,	0x6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	and	%i2,	0x0642,	%i4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x24] %asi,	%g1
	sdiv	%l0,	0x1930,	%g2
	fblg,a	%fcc1,	loop_1039
	swap	[%l7 + 0x38],	%g4
	bne,a,pn	%icc,	loop_1040
	movpos	%icc,	%g7,	%i3
loop_1039:
	sll	%i0,	%l1,	%o7
	movre	%i7,	%g5,	%o4
loop_1040:
	sethi	0x0C93,	%i5
	bne,a,pt	%icc,	loop_1041
	call	loop_1042
	subcc	%o1,	0x1DBA,	%i6
	tcc	%icc,	0x6
loop_1041:
	fbug,a	%fcc2,	loop_1043
loop_1042:
	tge	%icc,	0x5
	bcs	%xcc,	loop_1044
	nop
	setx	0xBAA19D2D080AEDEB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xD3FE1F4DF8E17C25,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f4,	%f24
loop_1043:
	edge8ln	%i1,	%o3,	%g6
	fandnot1	%f16,	%f30,	%f24
loop_1044:
	faligndata	%f26,	%f8,	%f4
	xnorcc	%l3,	0x00E4,	%o2
	fmovse	%xcc,	%f0,	%f12
	fnot2	%f6,	%f10
	nop
	setx	0xEFC13E8BA6159A95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x989FB7989E324071,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f26,	%f14
	orn	%o6,	%l6,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc2,	loop_1045
	edge16	%l5,	%o5,	%o0
	fnot1s	%f17,	%f7
	bneg	%xcc,	loop_1046
loop_1045:
	fmovsgu	%xcc,	%f31,	%f14
	tpos	%icc,	0x2
	movrne	%l2,	0x2F2,	%i2
loop_1046:
	nop
	fitod	%f4,	%f6
	fdtoi	%f6,	%f26
	stb	%g3,	[%l7 + 0x62]
	movcc	%icc,	%g1,	%i4
	fcmpgt32	%f22,	%f0,	%l0
	sdivx	%g4,	0x1E95,	%g7
	smul	%g2,	%i0,	%i3
	fnegd	%f6,	%f2
	bpos	loop_1047
	umul	%o7,	0x07EF,	%l1
	umulcc	%g5,	0x05E2,	%o4
	subcc	%i7,	0x0288,	%o1
loop_1047:
	fba,a	%fcc1,	loop_1048
	fmovscs	%icc,	%f30,	%f25
	tleu	%xcc,	0x3
	sethi	0x1023,	%i6
loop_1048:
	fmovspos	%xcc,	%f18,	%f20
	tne	%icc,	0x2
	fzero	%f8
	brgez,a	%i5,	loop_1049
	taddcctv	%o3,	%i1,	%g6
	sllx	%l3,	%o2,	%l6
	movne	%xcc,	%o6,	%l5
loop_1049:
	fandnot2	%f14,	%f12,	%f24
	nop
	fitod	%f0,	%f8
	fdtoi	%f8,	%f14
	edge16n	%l4,	%o5,	%o0
	tne	%icc,	0x5
	edge8l	%i2,	%l2,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x3
	nop
	fitos	%f5,	%f23
	fstod	%f23,	%f22
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i4
	movrne	%g1,	%l0,	%g4
	fbe	%fcc2,	loop_1050
	edge32n	%g2,	%g7,	%i0
	ldsh	[%l7 + 0x4A],	%i3
	udivx	%o7,	0x14DD,	%g5
loop_1050:
	srax	%l1,	%o4,	%o1
	smul	%i6,	0x0EB4,	%i7
	movn	%xcc,	%i5,	%i1
	fnot1	%f30,	%f28
	fmovsleu	%icc,	%f25,	%f1
	sdivcc	%o3,	0x0D4B,	%l3
	umul	%g6,	%l6,	%o6
	movneg	%xcc,	%o2,	%l4
	edge16	%l5,	%o5,	%i2
	fbn,a	%fcc2,	loop_1051
	membar	0x20
	tl	%xcc,	0x0
	srl	%l2,	0x1D,	%o0
loop_1051:
	tcs	%xcc,	0x0
	addccc	%g3,	%i4,	%l0
	addccc	%g1,	0x1CEE,	%g2
	tpos	%icc,	0x0
	fmovdgu	%xcc,	%f20,	%f10
	movgu	%xcc,	%g7,	%g4
	movvc	%xcc,	%i3,	%i0
	tsubcctv	%o7,	0x13CC,	%g5
	tleu	%xcc,	0x7
	movrlz	%l1,	%o1,	%o4
	edge32ln	%i6,	%i5,	%i7
	edge16l	%i1,	%l3,	%g6
	movrgez	%o3,	0x1F3,	%o6
	edge16ln	%o2,	%l6,	%l4
	fbu,a	%fcc2,	loop_1052
	fands	%f19,	%f18,	%f11
	xnor	%o5,	%i2,	%l5
	fcmpne16	%f30,	%f8,	%o0
loop_1052:
	fbg,a	%fcc3,	loop_1053
	taddcc	%g3,	%l2,	%l0
	fba,a	%fcc3,	loop_1054
	fzeros	%f19
loop_1053:
	umulcc	%i4,	%g2,	%g7
	and	%g1,	%g4,	%i0
loop_1054:
	movle	%icc,	%i3,	%g5
	bshuffle	%f26,	%f14,	%f12
	set	0x3A, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o7
	sdivcc	%l1,	0x134F,	%o1
	andcc	%o4,	%i6,	%i5
	fornot2s	%f17,	%f13,	%f19
	fornot1	%f0,	%f30,	%f20
	movl	%xcc,	%i7,	%l3
	fornot1s	%f15,	%f27,	%f16
	movn	%icc,	%i1,	%o3
	movrne	%o6,	0x39C,	%g6
	stbar
	udivcc	%o2,	0x051E,	%l4
	bleu,pn	%xcc,	loop_1055
	sdivx	%l6,	0x063C,	%i2
	fmovrdne	%o5,	%f28,	%f16
	fnegd	%f16,	%f0
loop_1055:
	movvs	%xcc,	%l5,	%o0
	sra	%g3,	%l2,	%l0
	fbge	%fcc3,	loop_1056
	ldsw	[%l7 + 0x70],	%g2
	flush	%l7 + 0x0C
	movn	%xcc,	%i4,	%g1
loop_1056:
	popc	0x123A,	%g4
	subccc	%i0,	%i3,	%g5
	st	%f10,	[%l7 + 0x40]
	smulcc	%g7,	%o7,	%o1
	bvs,a,pt	%xcc,	loop_1057
	move	%xcc,	%o4,	%i6
	udivcc	%i5,	0x01AB,	%l1
	tcc	%icc,	0x0
loop_1057:
	nop
	setx	0x62F3C6B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x13A15298,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f29,	%f28
	srax	%i7,	0x18,	%l3
	fnor	%f0,	%f8,	%f26
	bg,pt	%icc,	loop_1058
	edge16	%i1,	%o3,	%o6
	fmovrde	%g6,	%f14,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1058:
	edge8	%o2,	%l6,	%i2
	ldd	[%l7 + 0x58],	%f22
	sub	%l4,	0x1012,	%o5
	fble	%fcc0,	loop_1059
	andncc	%l5,	%g3,	%l2
	fzeros	%f16
	edge8	%o0,	%l0,	%g2
loop_1059:
	alignaddrl	%i4,	%g4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i0,	%i3
	edge16	%g7,	%g5,	%o1
	andcc	%o4,	0x1390,	%o7
	nop
	setx	0xB7B78925D0428901,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	edge8l	%i5,	%i6,	%i7
	udiv	%l3,	0x1253,	%l1
	and	%o3,	%i1,	%g6
	edge8	%o6,	%l6,	%i2
	edge16	%l4,	%o5,	%l5
	movn	%xcc,	%g3,	%l2
	sub	%o0,	%l0,	%g2
	movn	%xcc,	%o2,	%i4
	fornot2	%f22,	%f12,	%f2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%g1
	alignaddr	%i3,	%i0,	%g5
	edge8n	%g7,	%o1,	%o7
	edge32n	%i5,	%i6,	%o4
	edge32	%l3,	%i7,	%o3
	sir	0x19E7
	fxnor	%f22,	%f22,	%f28
	sra	%i1,	0x13,	%l1
	tneg	%xcc,	0x5
	ba,a	%icc,	loop_1060
	nop
	fitod	%f26,	%f6
	tpos	%xcc,	0x6
	nop
	setx	0x42ECF4FD6050309F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_1060:
	te	%icc,	0x6
	movl	%icc,	%g6,	%o6
	tle	%xcc,	0x6
	bl,a,pt	%icc,	loop_1061
	edge32l	%l6,	%l4,	%i2
	ba	%icc,	loop_1062
	array32	%o5,	%g3,	%l5
loop_1061:
	edge16n	%l2,	%l0,	%o0
	edge32ln	%g2,	%i4,	%o2
loop_1062:
	fmovsg	%xcc,	%f24,	%f29
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2E] %asi,	%g4
	brnz	%i3,	loop_1063
	array8	%g1,	%g5,	%g7
	faligndata	%f0,	%f10,	%f28
	xor	%o1,	0x1269,	%o7
loop_1063:
	fble	%fcc2,	loop_1064
	nop
	setx	0xD92AFA15FEEA5AC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x915B3C01E3528955,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f24,	%f24
	movle	%icc,	%i0,	%i5
	movrlz	%i6,	%l3,	%o4
loop_1064:
	tgu	%icc,	0x2
	xor	%i7,	%o3,	%l1
	smulcc	%g6,	%o6,	%l6
	tneg	%xcc,	0x7
	fmovdle	%icc,	%f15,	%f8
	edge16ln	%i1,	%i2,	%o5
	mulx	%g3,	0x1D01,	%l4
	edge16	%l5,	%l0,	%l2
	edge16l	%o0,	%i4,	%o2
	fbue,a	%fcc3,	loop_1065
	prefetch	[%l7 + 0x1C],	 0x2
	fornot1	%f16,	%f2,	%f12
	move	%icc,	%g2,	%g4
loop_1065:
	mova	%xcc,	%i3,	%g1
	sdiv	%g7,	0x0945,	%o1
	fornot2	%f6,	%f10,	%f10
	srl	%g5,	0x13,	%o7
	udiv	%i5,	0x09A8,	%i6
	andncc	%l3,	%i0,	%i7
	tn	%xcc,	0x4
	edge8n	%o3,	%l1,	%o4
	movvc	%xcc,	%o6,	%l6
	ldsh	[%l7 + 0x30],	%i1
	movge	%icc,	%g6,	%i2
	fbug	%fcc0,	loop_1066
	tl	%xcc,	0x4
	set	0x26, %l4
	stha	%g3,	[%l7 + %l4] 0x14
loop_1066:
	array8	%o5,	%l4,	%l0
	fnegs	%f9,	%f19
	movge	%xcc,	%l5,	%l2
	orcc	%i4,	%o0,	%o2
	movvs	%xcc,	%g2,	%g4
	edge8	%i3,	%g7,	%g1
	or	%o1,	%o7,	%i5
	mova	%xcc,	%i6,	%g5
	ldsh	[%l7 + 0x12],	%l3
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x18] %asi
	call	loop_1067
	edge32ln	%o3,	%l1,	%i7
	prefetch	[%l7 + 0x28],	 0x1
	membar	0x0D
loop_1067:
	sdiv	%o6,	0x1D76,	%l6
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x1e
	membar	#Sync
	bgu	loop_1068
	fmovd	%f18,	%f14
	edge16n	%o4,	%i1,	%g6
	fbu,a	%fcc0,	loop_1069
loop_1068:
	ldd	[%l7 + 0x48],	%f10
	fmovsleu	%icc,	%f7,	%f14
	brgz,a	%g3,	loop_1070
loop_1069:
	fmovsvs	%xcc,	%f28,	%f1
	fmovdn	%xcc,	%f22,	%f14
	movrgz	%i2,	0x29A,	%o5
loop_1070:
	fbg	%fcc1,	loop_1071
	movgu	%xcc,	%l0,	%l4
	nop
	set	0x10, %l1
	lduw	[%l7 + %l1],	%l2
	or	%l5,	%i4,	%o2
loop_1071:
	tle	%xcc,	0x6
	membar	0x08
	andncc	%o0,	%g2,	%i3
	tvs	%xcc,	0x0
	tle	%icc,	0x0
	movrne	%g7,	%g1,	%o1
	ba,a	%icc,	loop_1072
	array32	%g4,	%o7,	%i6
	tn	%xcc,	0x0
	movleu	%xcc,	%i5,	%g5
loop_1072:
	nop
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	orn	%l3,	0x1803,	%i0
	movpos	%icc,	%l1,	%o3
	xorcc	%i7,	%o6,	%l6
	fbule	%fcc0,	loop_1073
	tvs	%icc,	0x1
	tn	%icc,	0x4
	movge	%icc,	%i1,	%o4
loop_1073:
	fmovrde	%g3,	%f0,	%f28
	edge8l	%i2,	%g6,	%o5
	sethi	0x1076,	%l0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x80
	fpadd16s	%f16,	%f8,	%f12
	brlez,a	%l2,	loop_1074
	movle	%icc,	%l5,	%i4
	edge8l	%l4,	%o0,	%g2
	tne	%xcc,	0x4
loop_1074:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x61] %asi,	%o2
	movn	%icc,	%g7,	%i3
	movrne	%o1,	%g4,	%o7
	fornot2s	%f27,	%f9,	%f2
	movpos	%icc,	%i6,	%g1
	subc	%g5,	%l3,	%i5
	swap	[%l7 + 0x08],	%l1
	movcs	%icc,	%i0,	%i7
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
	sll	%o6,	0x1E,	%o3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l6
	sethi	0x1AAD,	%o4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x64] %asi,	%g3
	edge16ln	%i1,	%g6,	%o5
	array16	%l0,	%l2,	%i2
	tvc	%xcc,	0x2
	movg	%xcc,	%l5,	%i4
	set	0x7B, %i6
	ldsba	[%l7 + %i6] 0x15,	%o0
	fnor	%f24,	%f14,	%f18
	fmovrdgez	%l4,	%f8,	%f14
	set	0x46, %i0
	ldsba	[%l7 + %i0] 0x89,	%g2
	edge8l	%g7,	%o2,	%o1
	movcc	%icc,	%i3,	%o7
	movcc	%xcc,	%g4,	%g1
	array32	%i6,	%g5,	%l3
	movcs	%icc,	%i5,	%i0
	lduw	[%l7 + 0x50],	%l1
	andcc	%o6,	%i7,	%o3
	tsubcc	%o4,	0x0CBA,	%g3
	std	%f12,	[%l7 + 0x48]
	movrgz	%i1,	0x2FC,	%g6
	subccc	%o5,	%l6,	%l0
	srlx	%i2,	0x0C,	%l2
	fmovdvs	%xcc,	%f19,	%f10
	smulcc	%i4,	0x1507,	%l5
	fbul	%fcc1,	loop_1075
	fmovdvs	%xcc,	%f0,	%f21
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x74] %asi,	%l4
loop_1075:
	tsubcc	%o0,	0x0A49,	%g2
	bcs,pn	%xcc,	loop_1076
	movgu	%icc,	%o2,	%o1
	movvc	%icc,	%i3,	%o7
	srlx	%g7,	0x07,	%g4
loop_1076:
	fxnors	%f25,	%f25,	%f7
	alignaddrl	%g1,	%g5,	%i6
	tvs	%xcc,	0x2
	fbe	%fcc0,	loop_1077
	tsubcctv	%l3,	0x1964,	%i0
	fbo	%fcc1,	loop_1078
	movvs	%icc,	%i5,	%l1
loop_1077:
	movvs	%xcc,	%o6,	%i7
	fzero	%f8
loop_1078:
	movg	%xcc,	%o3,	%g3
	tleu	%icc,	0x3
	sdivcc	%i1,	0x05DE,	%o4
	tn	%xcc,	0x3
	bg,a	%xcc,	loop_1079
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x35],	%o5
	edge8ln	%l6,	%l0,	%g6
loop_1079:
	fmovrse	%i2,	%f15,	%f2
	fble	%fcc1,	loop_1080
	array32	%i4,	%l5,	%l4
	be	loop_1081
	flush	%l7 + 0x54
loop_1080:
	mulx	%l2,	0x02CC,	%o0
	fmovscs	%xcc,	%f2,	%f19
loop_1081:
	alignaddrl	%o2,	%o1,	%i3
	movleu	%icc,	%g2,	%g7
	st	%f21,	[%l7 + 0x3C]
	nop
	setx	0xFDF6BBD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x54F3A5A4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f25,	%f16
	popc	%g4,	%o7
	nop
	setx	loop_1082,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq32	%f10,	%f22,	%g5
	udivcc	%g1,	0x16C8,	%i6
	umul	%i0,	%i5,	%l1
loop_1082:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x29] %asi,	%l3
	array16	%i7,	%o6,	%o3
	edge16n	%g3,	%o4,	%o5
	edge32	%l6,	%l0,	%i1
	edge8n	%i2,	%i4,	%g6
	ba	%xcc,	loop_1083
	nop
	setx	0x3BDBF5E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x6A70DD1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f17,	%f29
	movleu	%xcc,	%l4,	%l2
	array32	%o0,	%o2,	%o1
loop_1083:
	sllx	%i3,	%l5,	%g2
	tl	%xcc,	0x1
	fnand	%f12,	%f4,	%f2
	edge32l	%g4,	%g7,	%o7
	ld	[%l7 + 0x2C],	%f19
	fbne	%fcc2,	loop_1084
	smul	%g5,	0x0B0D,	%g1
	fnot2	%f0,	%f26
	or	%i6,	%i5,	%l1
loop_1084:
	movl	%icc,	%l3,	%i7
	sdivx	%o6,	0x18B7,	%i0
	sra	%g3,	%o3,	%o5
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x89,	%o4
	tpos	%xcc,	0x6
	membar	0x5F
	addc	%l0,	0x06AF,	%i1
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x2e,	%i2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	te	%xcc,	0x5
	tcs	%xcc,	0x3
	sethi	0x1BC0,	%l6
	fmovspos	%icc,	%f5,	%f4
	be,pn	%icc,	loop_1085
	movle	%icc,	%i4,	%g6
	addccc	%l2,	%l4,	%o0
	fmovdvs	%icc,	%f27,	%f7
loop_1085:
	fbge,a	%fcc0,	loop_1086
	fpsub16s	%f16,	%f11,	%f27
	fcmpne16	%f30,	%f6,	%o2
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
loop_1086:
	array32	%o1,	%l5,	%i3
	tpos	%icc,	0x7
	set	0x34, %g2
	ldswa	[%l7 + %g2] 0x0c,	%g2
loop_1087:
	udivcc	%g4,	0x0C54,	%g7
	movvc	%icc,	%o7,	%g1
	fmovdg	%icc,	%f3,	%f28
	sllx	%g5,	0x00,	%i5
	mulx	%l1,	0x11E7,	%i6
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f4
	udiv	%i7,	0x09E0,	%l3
	movrlz	%o6,	%i0,	%o3
	tsubcc	%o5,	%o4,	%l0
	tge	%xcc,	0x0
	movle	%xcc,	%i1,	%i2
	srlx	%l6,	%g3,	%i4
	popc	%l2,	%g6
	fpadd32	%f16,	%f6,	%f14
	udivx	%l4,	0x0428,	%o0
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%o1
	bne	loop_1088
	ldsh	[%l7 + 0x50],	%l5
	fone	%f8
	fands	%f30,	%f13,	%f5
loop_1088:
	fmovdleu	%icc,	%f11,	%f19
	tgu	%icc,	0x6
	mulscc	%i3,	%o2,	%g4
	alignaddrl	%g2,	%o7,	%g1
	brgez,a	%g7,	loop_1089
	mova	%xcc,	%i5,	%g5
	subccc	%i6,	%i7,	%l1
	bleu,pn	%icc,	loop_1090
loop_1089:
	umulcc	%o6,	0x0AA9,	%i0
	edge8l	%o3,	%o5,	%l3
	nop
	fitod	%f0,	%f4
	fdtos	%f4,	%f17
loop_1090:
	nop
	set	0x71, %l5
	stba	%o4,	[%l7 + %l5] 0x19
	orcc	%i1,	%l0,	%l6
	fandnot2s	%f1,	%f22,	%f31
	bpos,a,pt	%icc,	loop_1091
	fmovdgu	%icc,	%f6,	%f29
	set	0x4A, %o0
	lduba	[%l7 + %o0] 0x10,	%i2
loop_1091:
	bleu	loop_1092
	andn	%g3,	0x1FA9,	%l2
	fones	%f4
	umul	%g6,	%l4,	%o0
loop_1092:
	alignaddrl	%i4,	%o1,	%i3
	movvs	%icc,	%o2,	%g4
	fbule	%fcc1,	loop_1093
	nop
	fitos	%f14,	%f27
	fstod	%f27,	%f16
	ba,a	%xcc,	loop_1094
	nop
	fitos	%f0,	%f3
	fstod	%f3,	%f20
loop_1093:
	edge16ln	%l5,	%o7,	%g2
	andcc	%g1,	%g7,	%g5
loop_1094:
	fbge,a	%fcc0,	loop_1095
	orncc	%i6,	%i5,	%l1
	edge32l	%o6,	%i7,	%o3
	fmovdgu	%xcc,	%f4,	%f16
loop_1095:
	tcs	%icc,	0x5
	edge32ln	%o5,	%i0,	%o4
	tneg	%icc,	0x1
	nop
	setx	0xC0651148,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	sub	%i1,	0x188F,	%l0
	edge16n	%l3,	%l6,	%i2
	fnor	%f16,	%f16,	%f14
	sra	%l2,	%g3,	%g6
	edge16l	%l4,	%o0,	%o1
	fornot1	%f18,	%f8,	%f6
	tvc	%icc,	0x3
	brnz,a	%i4,	loop_1096
	movcs	%xcc,	%o2,	%i3
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1096:
	fnands	%f23,	%f7,	%f28
	tsubcc	%l5,	0x114E,	%o7
	movrlez	%g4,	%g1,	%g7
	tvs	%icc,	0x7
	fxors	%f4,	%f16,	%f22
	sdivx	%g5,	0x03E0,	%g2
	movvs	%xcc,	%i5,	%l1
	fandnot2s	%f7,	%f29,	%f4
	sub	%i6,	0x1AD2,	%i7
	fandnot1	%f30,	%f14,	%f30
	nop
	setx	0x40435882,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fnegs	%f7,	%f13
	umul	%o6,	%o5,	%i0
	srlx	%o3,	%i1,	%o4
	ldsh	[%l7 + 0x2A],	%l0
	nop
	fitod	%f8,	%f12
	fdtoi	%f12,	%f3
	xor	%l6,	%i2,	%l2
	array32	%l3,	%g6,	%l4
	tneg	%icc,	0x3
	movneg	%icc,	%g3,	%o1
	andn	%o0,	%o2,	%i4
	ta	%icc,	0x2
	fmovsg	%icc,	%f29,	%f10
	addcc	%i3,	0x0F01,	%o7
	fmovsl	%icc,	%f8,	%f4
	edge16	%g4,	%g1,	%g7
	tpos	%icc,	0x6
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge32n	%g5,	%l5,	%g2
	membar	0x33
	edge32l	%l1,	%i6,	%i5
	tcs	%xcc,	0x6
	add	%i7,	%o6,	%i0
	wr	%g0,	0x11,	%asi
	sta	%f27,	[%l7 + 0x20] %asi
	movcc	%xcc,	%o5,	%o3
	fmovscs	%icc,	%f21,	%f18
	move	%icc,	%o4,	%i1
	tvs	%icc,	0x4
	movrlz	%l0,	0x103,	%i2
	sub	%l2,	0x0DF8,	%l6
	fmovsn	%icc,	%f23,	%f10
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%g6
	fbo,a	%fcc0,	loop_1097
	alignaddr	%l4,	%g3,	%l3
	nop
	fitod	%f0,	%f10
	fdtos	%f10,	%f11
	tle	%icc,	0x6
loop_1097:
	tge	%icc,	0x0
	udivx	%o1,	0x06A6,	%o2
	edge32ln	%i4,	%i3,	%o7
	fnand	%f20,	%f2,	%f6
	bvc,a,pn	%xcc,	loop_1098
	ldub	[%l7 + 0x15],	%g4
	brgez	%g1,	loop_1099
	fbne,a	%fcc0,	loop_1100
loop_1098:
	fpadd16s	%f15,	%f17,	%f4
	tsubcc	%o0,	%g5,	%l5
loop_1099:
	tl	%xcc,	0x3
loop_1100:
	addccc	%g2,	0x054A,	%l1
	edge16	%g7,	%i6,	%i5
	array16	%o6,	%i7,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_1101
	addccc	%o5,	%o4,	%o3
	taddcctv	%i1,	0x1861,	%l0
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%l2
loop_1101:
	tneg	%xcc,	0x1
	udiv	%i2,	0x1701,	%l6
	fbne,a	%fcc3,	loop_1102
	udiv	%g6,	0x1517,	%g3
	bge,a,pt	%icc,	loop_1103
	fmovrdne	%l4,	%f22,	%f24
loop_1102:
	andcc	%l3,	0x08DC,	%o2
	popc	%o1,	%i4
loop_1103:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%o7,	[%l7 + 0x78] %asi
	ba,a,pn	%xcc,	loop_1104
	edge32n	%i3,	%g4,	%g1
	edge16	%g5,	%l5,	%g2
	and	%l1,	0x0D7B,	%g7
loop_1104:
	bcc,pt	%icc,	loop_1105
	add	%i6,	%i5,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	%icc,	loop_1106
loop_1105:
	movn	%xcc,	%i7,	%o6
	edge8ln	%i0,	%o4,	%o5
	bn,a,pt	%xcc,	loop_1107
loop_1106:
	array16	%o3,	%l0,	%l2
	tg	%xcc,	0x1
	nop
	setx	0x8052A541,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
loop_1107:
	sra	%i2,	%l6,	%g6
	for	%f0,	%f24,	%f0
	andcc	%i1,	0x102A,	%l4
	sdiv	%l3,	0x10CF,	%o2
	sllx	%g3,	0x19,	%i4
	tvs	%icc,	0x7
	edge16ln	%o7,	%i3,	%o1
	flush	%l7 + 0x48
	bgu,a,pn	%xcc,	loop_1108
	tge	%xcc,	0x1
	fbule	%fcc1,	loop_1109
	fpsub16s	%f4,	%f19,	%f6
loop_1108:
	fone	%f20
	fmovsvs	%icc,	%f3,	%f30
loop_1109:
	nop
	setx	0x88A7A7B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x03264130,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f29,	%f18
	fcmpne16	%f8,	%f2,	%g1
	fmovrde	%g5,	%f24,	%f10
	fpadd16	%f30,	%f4,	%f20
	tsubcc	%l5,	0x10E5,	%g2
	bneg,a,pt	%xcc,	loop_1110
	fnegs	%f21,	%f0
	sub	%g4,	%l1,	%g7
	subccc	%i6,	0x059F,	%i5
loop_1110:
	sdiv	%i7,	0x169D,	%o0
	fmovrdlz	%i0,	%f2,	%f24
	edge32n	%o6,	%o5,	%o3
	edge8	%o4,	%l2,	%l0
	bl,a	loop_1111
	smulcc	%l6,	0x17D3,	%i2
	array8	%i1,	%g6,	%l3
	tvc	%icc,	0x1
loop_1111:
	nop
	set	0x6C, %o6
	stwa	%l4,	[%l7 + %o6] 0x14
	nop
	fitos	%f7,	%f24
	fstod	%f24,	%f4
	srlx	%o2,	0x15,	%i4
	bn,pn	%xcc,	loop_1112
	movcc	%xcc,	%o7,	%g3
	tl	%icc,	0x4
	tne	%xcc,	0x3
loop_1112:
	edge32l	%o1,	%g1,	%g5
	ldd	[%l7 + 0x48],	%f6
	brz,a	%l5,	loop_1113
	edge32n	%g2,	%i3,	%g4
	fmovsleu	%xcc,	%f3,	%f5
	fbug,a	%fcc1,	loop_1114
loop_1113:
	sll	%g7,	0x1A,	%i6
	movcc	%xcc,	%i5,	%l1
	tg	%icc,	0x2
loop_1114:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i7
	ldsb	[%l7 + 0x67],	%i0
	mova	%icc,	%o0,	%o5
	ldstub	[%l7 + 0x60],	%o6
	fsrc1s	%f30,	%f14
	fnot1	%f12,	%f16
	tsubcc	%o4,	0x0880,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o3,	%l0,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f30,	%f18,	%f14
	sub	%i2,	%g6,	%l3
	addccc	%i1,	%l4,	%i4
	andn	%o7,	%g3,	%o1
	array32	%g1,	%o2,	%l5
	bneg,pn	%xcc,	loop_1115
	array8	%g5,	%g2,	%i3
	move	%icc,	%g4,	%g7
	sra	%i5,	%l1,	%i6
loop_1115:
	edge32n	%i0,	%o0,	%i7
	edge8	%o6,	%o4,	%l2
	set	0x14, %l6
	lduwa	[%l7 + %l6] 0x88,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l0,	%l6,	%i2
	lduh	[%l7 + 0x7E],	%o3
	movrgez	%g6,	0x1DD,	%i1
	sra	%l3,	0x1D,	%i4
	fmovscc	%xcc,	%f15,	%f8
	membar	0x79
	fmovsg	%xcc,	%f14,	%f29
	brgez	%o7,	loop_1116
	fbuge	%fcc1,	loop_1117
	ta	%icc,	0x1
	fbuge,a	%fcc3,	loop_1118
loop_1116:
	fba	%fcc0,	loop_1119
loop_1117:
	movge	%icc,	%l4,	%g3
	edge8l	%o1,	%g1,	%o2
loop_1118:
	fba	%fcc1,	loop_1120
loop_1119:
	array8	%g5,	%l5,	%i3
	movle	%icc,	%g2,	%g4
	fpsub16s	%f0,	%f8,	%f15
loop_1120:
	edge16l	%i5,	%g7,	%i6
	srax	%l1,	%i0,	%i7
	movcs	%icc,	%o6,	%o4
	srl	%l2,	%o5,	%l0
	xorcc	%l6,	0x1D46,	%i2
	ldx	[%l7 + 0x60],	%o3
	edge32ln	%o0,	%i1,	%g6
	xnorcc	%i4,	%o7,	%l4
	lduw	[%l7 + 0x24],	%g3
	movn	%xcc,	%l3,	%g1
	fmul8sux16	%f28,	%f18,	%f0
	edge8l	%o2,	%g5,	%l5
	bne,a,pt	%xcc,	loop_1121
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%o1,	%f2,	%f4
	movvc	%icc,	%i3,	%g4
loop_1121:
	fcmpeq32	%f28,	%f30,	%i5
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%i6
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x08, %i2
	ldx	[%l7 + %i2],	%l1
	ldsh	[%l7 + 0x6C],	%i0
	fnands	%f2,	%f17,	%f18
	fornot1s	%f30,	%f19,	%f7
	fmovrde	%i7,	%f8,	%f28
	brgz,a	%o6,	loop_1122
	or	%g7,	%o4,	%l2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x77] %asi,	%o5
loop_1122:
	orn	%l6,	%i2,	%o3
	nop
	fitod	%f2,	%f26
	fdtos	%f26,	%f13
	tcs	%icc,	0x1
	set	0x78, %g4
	lda	[%l7 + %g4] 0x10,	%f14
	tle	%xcc,	0x4
	tsubcctv	%l0,	0x1010,	%i1
	fbuge,a	%fcc1,	loop_1123
	movrgez	%g6,	0x086,	%i4
	sdiv	%o7,	0x0ED8,	%o0
	tsubcctv	%g3,	%l3,	%g1
loop_1123:
	edge16	%o2,	%g5,	%l4
	te	%xcc,	0x4
	fmovrdlz	%l5,	%f30,	%f8
	nop
	fitod	%f6,	%f18
	edge32	%o1,	%g4,	%i3
	tl	%xcc,	0x4
	bcc,a,pt	%icc,	loop_1124
	ldstub	[%l7 + 0x66],	%g2
	addc	%i6,	%i5,	%i0
	tvs	%icc,	0x2
loop_1124:
	fornot1	%f10,	%f16,	%f8
	edge32	%i7,	%l1,	%o6
	mulx	%o4,	0x0EC0,	%g7
	brlez	%l2,	loop_1125
	fba	%fcc2,	loop_1126
	udiv	%o5,	0x0AEA,	%i2
	fmovrslez	%l6,	%f20,	%f1
loop_1125:
	fnegd	%f16,	%f8
loop_1126:
	nop
	set	0x40, %i1
	ldswa	[%l7 + %i1] 0x10,	%l0
	taddcc	%i1,	0x0DDA,	%o3
	fmovsge	%icc,	%f30,	%f3
	movvs	%xcc,	%g6,	%o7
	sdivx	%o0,	0x0B33,	%g3
	nop
	setx	0x0056378A,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	sethi	0x0BB8,	%i4
	edge32	%g1,	%l3,	%g5
	subc	%l4,	0x04DE,	%l5
	bg,a	%xcc,	loop_1127
	xorcc	%o1,	%o2,	%g4
	brlez	%g2,	loop_1128
	sll	%i6,	0x13,	%i3
loop_1127:
	mova	%xcc,	%i5,	%i7
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x3C] %asi
loop_1128:
	fmovrdlz	%i0,	%f8,	%f24
	lduh	[%l7 + 0x30],	%o6
	prefetch	[%l7 + 0x1C],	 0x3
	tsubcc	%l1,	%o4,	%l2
	sdivcc	%g7,	0x0A6A,	%o5
	fandnot2	%f30,	%f14,	%f6
	tsubcc	%i2,	%l6,	%i1
	array16	%o3,	%g6,	%l0
	sir	0x148E
	mulx	%o7,	%g3,	%o0
	brlez,a	%i4,	loop_1129
	ta	%icc,	0x3
	move	%icc,	%l3,	%g1
	tsubcctv	%l4,	%g5,	%o1
loop_1129:
	umul	%o2,	0x0768,	%g4
	movrlez	%l5,	0x140,	%g2
	fbg,a	%fcc3,	loop_1130
	fxnors	%f19,	%f30,	%f17
	bne,a	loop_1131
	stbar
loop_1130:
	addcc	%i6,	%i5,	%i3
	fones	%f7
loop_1131:
	taddcctv	%i0,	%i7,	%l1
	bshuffle	%f0,	%f26,	%f30
	alignaddr	%o4,	%o6,	%l2
	movn	%icc,	%o5,	%g7
	swap	[%l7 + 0x58],	%l6
	fblg,a	%fcc3,	loop_1132
	andcc	%i2,	0x1B29,	%o3
	fbue,a	%fcc2,	loop_1133
	edge8l	%i1,	%l0,	%g6
loop_1132:
	fsrc1	%f18,	%f30
	fba,a	%fcc1,	loop_1134
loop_1133:
	edge16ln	%g3,	%o7,	%o0
	fbe	%fcc2,	loop_1135
	sethi	0x0C2F,	%l3
loop_1134:
	bvs,a	%xcc,	loop_1136
	fnot1	%f10,	%f14
loop_1135:
	bpos,a,pn	%xcc,	loop_1137
	fmovrdgez	%g1,	%f4,	%f6
loop_1136:
	tpos	%icc,	0x3
	stb	%l4,	[%l7 + 0x14]
loop_1137:
	bne,a,pt	%icc,	loop_1138
	fmovrdlez	%i4,	%f2,	%f20
	movleu	%xcc,	%o1,	%g5
	tleu	%xcc,	0x2
loop_1138:
	array32	%o2,	%g4,	%g2
	movvc	%icc,	%i6,	%i5
	sdiv	%l5,	0x1350,	%i0
	fmovsg	%icc,	%f0,	%f15
	movn	%icc,	%i3,	%i7
	fmovsa	%xcc,	%f31,	%f31
	lduw	[%l7 + 0x30],	%o4
	tle	%icc,	0x3
	edge32n	%l1,	%o6,	%o5
	tvc	%icc,	0x6
	bcc	loop_1139
	edge16n	%g7,	%l2,	%i2
	tcc	%xcc,	0x7
	move	%icc,	%l6,	%i1
loop_1139:
	movvc	%icc,	%l0,	%g6
	edge8ln	%g3,	%o7,	%o0
	bcc,a	%icc,	loop_1140
	fbuge,a	%fcc2,	loop_1141
	movvc	%icc,	%l3,	%g1
	fsrc2s	%f29,	%f4
loop_1140:
	movle	%xcc,	%l4,	%o3
loop_1141:
	fbule	%fcc3,	loop_1142
	xnor	%i4,	0x109E,	%g5
	edge32n	%o1,	%o2,	%g4
	add	%i6,	%g2,	%i5
loop_1142:
	sdivcc	%l5,	0x1BEE,	%i3
	nop
	setx	0x028406112BAA2E6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE2709363ABE4E86A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f8,	%f22
	bg,pt	%icc,	loop_1143
	tge	%icc,	0x0
	sllx	%i0,	%o4,	%i7
	fnors	%f18,	%f20,	%f26
loop_1143:
	movrne	%o6,	0x26A,	%l1
	array32	%o5,	%l2,	%g7
	set	0x7C, %l3
	stwa	%l6,	[%l7 + %l3] 0x04
	orncc	%i1,	0x1505,	%i2
	bn,a,pn	%icc,	loop_1144
	fmovdpos	%xcc,	%f18,	%f3
	fmovdvs	%icc,	%f31,	%f14
	fsrc2	%f14,	%f6
loop_1144:
	movg	%icc,	%g6,	%g3
	fbue	%fcc1,	loop_1145
	tge	%icc,	0x3
	movrgz	%l0,	%o0,	%l3
	srax	%g1,	%o7,	%l4
loop_1145:
	fbu,a	%fcc1,	loop_1146
	xnorcc	%o3,	%i4,	%o1
	fexpand	%f6,	%f4
	fble,a	%fcc3,	loop_1147
loop_1146:
	umulcc	%g5,	0x0682,	%o2
	fcmpne32	%f22,	%f12,	%g4
	fsrc1	%f18,	%f10
loop_1147:
	andcc	%i6,	0x0F85,	%g2
	bn,a	loop_1148
	movleu	%icc,	%l5,	%i3
	srax	%i5,	0x09,	%o4
	edge8ln	%i7,	%o6,	%l1
loop_1148:
	ldsb	[%l7 + 0x5E],	%i0
	edge8	%l2,	%o5,	%l6
	edge32ln	%g7,	%i2,	%i1
	bvs	%xcc,	loop_1149
	smul	%g6,	%l0,	%o0
	addccc	%l3,	0x015E,	%g3
	fnors	%f28,	%f10,	%f11
loop_1149:
	tsubcc	%g1,	%l4,	%o3
	tvc	%icc,	0x1
	xnorcc	%o7,	%i4,	%g5
	edge16	%o1,	%o2,	%i6
	movcs	%icc,	%g2,	%l5
	nop
	setx	0xFFF02E67346D137D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x43D707993866E284,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f18,	%f0
	fsrc1s	%f31,	%f29
	orncc	%g4,	%i5,	%i3
	fsrc1s	%f16,	%f28
	sethi	0x072F,	%o4
	movrne	%o6,	0x22A,	%i7
	fpsub16	%f12,	%f2,	%f16
	edge16l	%i0,	%l1,	%o5
	array16	%l6,	%g7,	%i2
	xnorcc	%i1,	0x1FFB,	%l2
	fnors	%f12,	%f31,	%f28
	nop
	setx	0x005BE78F,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fpmerge	%f13,	%f19,	%f2
	edge8n	%g6,	%l0,	%o0
	bneg,a,pt	%icc,	loop_1150
	tvs	%xcc,	0x2
	alignaddrl	%l3,	%g3,	%l4
	ldsh	[%l7 + 0x2E],	%g1
loop_1150:
	fmovsgu	%icc,	%f24,	%f22
	andncc	%o7,	%i4,	%o3
	fmovdge	%icc,	%f7,	%f25
	ldstub	[%l7 + 0x3E],	%o1
	stbar
	fmovrde	%g5,	%f22,	%f10
	wr	%g0,	0x27,	%asi
	stwa	%i6,	[%l7 + 0x2C] %asi
	membar	#Sync
	subcc	%g2,	%l5,	%g4
	edge32n	%i5,	%o2,	%o4
	ldsw	[%l7 + 0x20],	%i3
	orcc	%i7,	0x0A9B,	%o6
	umul	%i0,	0x0A94,	%l1
	alignaddrl	%l6,	%g7,	%i2
	fmovsle	%xcc,	%f21,	%f29
	tpos	%icc,	0x3
	brlez,a	%o5,	loop_1151
	smul	%i1,	0x0FD9,	%g6
	sdivcc	%l0,	0x02B5,	%l2
	sllx	%o0,	0x12,	%l3
loop_1151:
	tsubcctv	%l4,	%g1,	%g3
	tcc	%xcc,	0x4
	fornot2s	%f6,	%f7,	%f31
	udiv	%o7,	0x007A,	%i4
	ldsh	[%l7 + 0x1A],	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g5
	andcc	%i6,	0x039A,	%o3
	smulcc	%l5,	0x0811,	%g2
	set	0x2D, %g3
	ldstuba	[%l7 + %g3] 0x11,	%i5
	set	0x54, %i5
	lduba	[%l7 + %i5] 0x04,	%o2
	smulcc	%g4,	%o4,	%i3
	nop
	setx	0x606CD6AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x4157FD19,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f13,	%f3
	taddcc	%i7,	0x187D,	%o6
	fabsd	%f20,	%f18
	set	0x6B, %g5
	ldsba	[%l7 + %g5] 0x0c,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i0,	0x1E7F,	%g7
	nop
	setx	0x65D5FF4BC030CC71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xBAA58D204EEE41F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f30,	%f28
	tcs	%icc,	0x1
	bn,a	loop_1152
	edge32l	%l6,	%i2,	%i1
	set	0x75, %g7
	lduba	[%l7 + %g7] 0x11,	%o5
loop_1152:
	brz,a	%l0,	loop_1153
	fpsub32	%f8,	%f18,	%f20
	brgez	%g6,	loop_1154
	fbne	%fcc3,	loop_1155
loop_1153:
	mova	%icc,	%o0,	%l2
	fba,a	%fcc0,	loop_1156
loop_1154:
	smul	%l4,	%l3,	%g3
loop_1155:
	movne	%xcc,	%o7,	%i4
	alignaddr	%o1,	%g1,	%i6
loop_1156:
	tsubcc	%o3,	%l5,	%g2
	mova	%xcc,	%g5,	%o2
	movg	%xcc,	%i5,	%g4
	tcs	%xcc,	0x1
	fbg	%fcc2,	loop_1157
	tvs	%icc,	0x1
	movge	%icc,	%i3,	%o4
	sdivcc	%o6,	0x0EA3,	%i7
loop_1157:
	nop
	setx	loop_1158,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	%xcc,	loop_1159
loop_1158:
	tg	%xcc,	0x6
	fxors	%f19,	%f2,	%f23
	mulx	%i0,	%l1,	%l6
loop_1159:
	sdivcc	%g7,	0x143D,	%i2
	fblg	%fcc3,	loop_1160
	movpos	%icc,	%o5,	%l0
	alignaddr	%i1,	%o0,	%l2
	smulcc	%g6,	0x0076,	%l4
loop_1160:
	xorcc	%l3,	0x16D3,	%o7
	nop
	fitod	%f12,	%f12
	fdtoi	%f12,	%f28
	xnorcc	%i4,	0x0320,	%o1
	te	%xcc,	0x3
	taddcc	%g1,	%g3,	%o3
	set	0x22, %i7
	stha	%l5,	[%l7 + %i7] 0x2b
	membar	#Sync
	array16	%i6,	%g5,	%o2
	udivcc	%g2,	0x0005,	%g4
	andcc	%i5,	%i3,	%o4
	movpos	%icc,	%i7,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x10],	%l1
	orncc	%o6,	%l6,	%i2
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
	array8	%o5,	%l0,	%i1
	and	%g7,	%o0,	%g6
	te	%xcc,	0x0
	fmovrdne	%l4,	%f2,	%f12
	fsrc2	%f14,	%f10
	movcc	%icc,	%l2,	%o7
	fsrc2	%f2,	%f26
	alignaddr	%i4,	%l3,	%o1
	set	0x1E, %o1
	lduha	[%l7 + %o1] 0x80,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f19,	%f28,	%f16
	tsubcctv	%g1,	%l5,	%o3
	smulcc	%i6,	%g5,	%g2
	orn	%o2,	%i5,	%i3
	movcs	%xcc,	%g4,	%i7
	sdivcc	%o4,	0x1A2E,	%l1
	brgez,a	%i0,	loop_1161
	movg	%xcc,	%l6,	%o6
	membar	0x4F
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1161:
	tcc	%icc,	0x6
	stb	%i2,	[%l7 + 0x42]
	sir	0x12D0
	sllx	%l0,	%i1,	%g7
	movpos	%icc,	%o0,	%g6
	udivcc	%o5,	0x1D20,	%l2
	fabsd	%f22,	%f28
	popc	%o7,	%i4
	movrgz	%l4,	0x2D4,	%o1
	bge,pt	%xcc,	loop_1162
	brz	%l3,	loop_1163
	movrlez	%g1,	%l5,	%g3
	tsubcctv	%o3,	%i6,	%g5
loop_1162:
	bgu,pt	%xcc,	loop_1164
loop_1163:
	umulcc	%g2,	%o2,	%i3
	set	0x64, %o4
	lda	[%l7 + %o4] 0x04,	%f6
loop_1164:
	movl	%xcc,	%i5,	%g4
	edge32n	%o4,	%i7,	%i0
	orn	%l1,	%o6,	%i2
	udiv	%l6,	0x0C78,	%l0
	fornot1	%f10,	%f4,	%f20
	movpos	%icc,	%i1,	%g7
	fmovsvc	%xcc,	%f4,	%f7
	bvc,pt	%icc,	loop_1165
	movleu	%xcc,	%o0,	%o5
	fble	%fcc0,	loop_1166
	sir	0x1AA2
loop_1165:
	sdivcc	%g6,	0x0767,	%o7
	ta	%icc,	0x1
loop_1166:
	fnot1s	%f18,	%f31
	bn,a	%xcc,	loop_1167
	fmovdgu	%icc,	%f31,	%f10
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x0c,	%i4
loop_1167:
	nop
	set	0x28, %g1
	swapa	[%l7 + %g1] 0x0c,	%l4
	alignaddrl	%o1,	%l2,	%l3
	movgu	%xcc,	%l5,	%g3
	fcmple32	%f8,	%f10,	%o3
	call	loop_1168
	edge16l	%i6,	%g5,	%g1
	edge32ln	%g2,	%o2,	%i5
	sra	%g4,	0x1D,	%o4
loop_1168:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i7
	xor	%i3,	%i0,	%l1
	te	%xcc,	0x1
	tsubcc	%i2,	%l6,	%l0
	tleu	%icc,	0x7
	bn,a	loop_1169
	fbg,a	%fcc3,	loop_1170
	sllx	%i1,	0x0C,	%g7
	wr	%g0,	0x80,	%asi
	sta	%f8,	[%l7 + 0x40] %asi
loop_1169:
	fbe	%fcc1,	loop_1171
loop_1170:
	brgz	%o6,	loop_1172
	tn	%xcc,	0x3
	andncc	%o5,	%o0,	%g6
loop_1171:
	movle	%xcc,	%i4,	%o7
loop_1172:
	alignaddrl	%o1,	%l4,	%l3
	tcc	%icc,	0x7
	fba,a	%fcc2,	loop_1173
	umul	%l5,	0x053B,	%g3
	ldub	[%l7 + 0x52],	%o3
	andcc	%i6,	0x0B24,	%l2
loop_1173:
	udivcc	%g1,	0x1C3C,	%g5
	xnorcc	%o2,	0x1C1E,	%i5
	fpadd32s	%f27,	%f20,	%f0
	movcc	%icc,	%g4,	%o4
	movre	%i7,	%i3,	%g2
	fmovdgu	%xcc,	%f14,	%f18
	fand	%f0,	%f20,	%f6
	nop
	setx	0x1070DC42,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	tsubcc	%l1,	0x13BE,	%i0
	addcc	%i2,	0x0368,	%l6
	fmovsgu	%xcc,	%f9,	%f7
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%l0
	mulx	%i1,	0x1CDA,	%o6
	fcmpgt16	%f10,	%f20,	%o5
	sir	0x0F3F
	subc	%g7,	0x0A37,	%g6
	bge,pn	%icc,	loop_1174
	addcc	%o0,	0x122E,	%i4
	fbue,a	%fcc0,	loop_1175
	fbul,a	%fcc2,	loop_1176
loop_1174:
	edge8l	%o1,	%l4,	%o7
	mulscc	%l5,	0x1CFD,	%g3
loop_1175:
	nop
	setx	0x5367B64669C89ED1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA0F51D8C6DC3771B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f26,	%f2
loop_1176:
	movrgez	%l3,	0x112,	%o3
	umulcc	%l2,	0x0F3B,	%i6
	edge16ln	%g1,	%g5,	%i5
	taddcctv	%g4,	0x148A,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x28],	%f24
	sdiv	%i7,	0x0E37,	%o4
	fnegs	%f31,	%f0
	array16	%g2,	%i3,	%i0
	xnorcc	%i2,	0x0F2C,	%l6
	fnand	%f12,	%f20,	%f26
	srax	%l1,	%l0,	%i1
	fbul,a	%fcc2,	loop_1177
	srl	%o6,	0x0F,	%g7
	edge16n	%g6,	%o0,	%i4
	flush	%l7 + 0x68
loop_1177:
	nop
	set	0x40, %l2
	lduba	[%l7 + %l2] 0x19,	%o1
	smul	%l4,	0x104D,	%o7
	udiv	%l5,	0x1EFB,	%g3
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovs	%f13,	%f0
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o5
	fornot1s	%f9,	%f24,	%f0
	movvs	%xcc,	%o3,	%l2
	tneg	%icc,	0x0
	sir	0x076B
	movrne	%l3,	%i6,	%g1
	tle	%icc,	0x4
	taddcc	%i5,	0x071A,	%g4
	smulcc	%o2,	0x029B,	%g5
	edge16ln	%i7,	%g2,	%o4
	move	%icc,	%i3,	%i0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x48] %asi,	%l6
	tl	%xcc,	0x2
	movvc	%xcc,	%l1,	%l0
	andcc	%i2,	%i1,	%o6
	udivcc	%g6,	0x122C,	%o0
	tleu	%xcc,	0x0
	ldsb	[%l7 + 0x1B],	%i4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x78] %asi,	%f6
	ldd	[%l7 + 0x48],	%f22
	alignaddrl	%o1,	%l4,	%o7
	tcc	%xcc,	0x2
	array8	%l5,	%g7,	%o5
	fmovrsgez	%o3,	%f15,	%f10
	movrlez	%l2,	%g3,	%i6
	set	0x28, %o2
	ldsha	[%l7 + %o2] 0x80,	%l3
	movrlez	%g1,	0x283,	%g4
	srlx	%o2,	%i5,	%g5
	movneg	%icc,	%i7,	%g2
	xorcc	%i3,	0x0E4A,	%o4
	set	0x1C, %l4
	lda	[%l7 + %l4] 0x81,	%f12
	array32	%l6,	%i0,	%l1
	xnor	%l0,	%i2,	%i1
	set	0x7C, %o5
	sta	%f21,	[%l7 + %o5] 0x04
	xnorcc	%o6,	0x0D54,	%g6
	membar	0x2A
	fmovdneg	%icc,	%f4,	%f5
	movgu	%icc,	%o0,	%o1
	srax	%l4,	%i4,	%l5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%g7
	or	%o5,	%o3,	%g3
	edge32n	%i6,	%l3,	%g1
	xnorcc	%l2,	%o2,	%i5
	fbn	%fcc3,	loop_1178
	fmovrsne	%g5,	%f19,	%f15
	taddcc	%g4,	0x16D7,	%g2
	andn	%i7,	0x1E46,	%o4
loop_1178:
	subc	%i3,	0x0E22,	%l6
	brlez	%i0,	loop_1179
	movre	%l0,	%i2,	%i1
	sethi	0x031E,	%o6
	tsubcc	%g6,	%l1,	%o0
loop_1179:
	fmovspos	%xcc,	%f5,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o1,	0x16,	%l4
	ldd	[%l7 + 0x18],	%l4
	movvc	%xcc,	%o7,	%g7
	movgu	%icc,	%i4,	%o3
	tpos	%xcc,	0x7
	mova	%xcc,	%o5,	%i6
	edge8ln	%g3,	%l3,	%g1
	orncc	%l2,	%o2,	%i5
	fble,a	%fcc1,	loop_1180
	fmovscs	%xcc,	%f12,	%f19
	taddcctv	%g4,	%g5,	%i7
	edge16	%g2,	%o4,	%l6
loop_1180:
	fmovrdne	%i3,	%f20,	%f14
	nop
	setx	loop_1181,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	flush	%l7 + 0x4C
	set	0x1E, %o7
	stha	%l0,	[%l7 + %o7] 0x2a
	membar	#Sync
loop_1181:
	edge16ln	%i2,	%i0,	%i1
	addccc	%o6,	0x06F5,	%g6
	fbul	%fcc3,	loop_1182
	fmovsn	%xcc,	%f1,	%f5
	movvc	%xcc,	%l1,	%o1
	fmovscc	%xcc,	%f23,	%f26
loop_1182:
	brnz,a	%l4,	loop_1183
	fmovdne	%xcc,	%f10,	%f23
	sll	%o0,	0x19,	%l5
	fmovsleu	%xcc,	%f8,	%f21
loop_1183:
	move	%icc,	%o7,	%i4
	movcs	%xcc,	%o3,	%g7
	movvs	%icc,	%o5,	%i6
	smulcc	%l3,	0x125D,	%g1
	edge32ln	%g3,	%o2,	%l2
	stb	%g4,	[%l7 + 0x50]
	addcc	%i5,	0x05F8,	%g5
	bcc,a,pn	%icc,	loop_1184
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g2,	%f14,	%f4
	subc	%i7,	0x1924,	%l6
loop_1184:
	subc	%i3,	%l0,	%i2
	edge32l	%i0,	%o4,	%i1
	sdivx	%g6,	0x09AF,	%l1
	addccc	%o6,	%l4,	%o1
	stw	%o0,	[%l7 + 0x7C]
	fmovdvs	%icc,	%f17,	%f19
	add	%o7,	0x0506,	%l5
	ldsw	[%l7 + 0x0C],	%o3
	udivcc	%i4,	0x0823,	%o5
	ld	[%l7 + 0x20],	%f25
	tneg	%icc,	0x3
	fmovrse	%g7,	%f14,	%f22
	fbu	%fcc0,	loop_1185
	srl	%i6,	%g1,	%l3
	fornot1	%f26,	%f4,	%f2
	fpsub32	%f18,	%f2,	%f8
loop_1185:
	movvc	%icc,	%g3,	%l2
	umul	%g4,	0x1EDC,	%i5
	fmuld8ulx16	%f0,	%f13,	%f26
	fcmpeq16	%f12,	%f26,	%o2
	smulcc	%g5,	%i7,	%g2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x40] %asi,	%l6
	fpsub32s	%f9,	%f30,	%f17
	array8	%i3,	%l0,	%i0
	fnot1	%f28,	%f16
	xorcc	%o4,	0x147F,	%i2
	movcc	%xcc,	%i1,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o6,	0x164A,	%g6
	movrne	%o1,	0x30F,	%l4
	edge32	%o7,	%l5,	%o3
	tne	%xcc,	0x5
	movn	%icc,	%i4,	%o0
	fnands	%f4,	%f26,	%f12
	stbar
	addc	%g7,	%i6,	%g1
	fnors	%f4,	%f10,	%f31
	te	%icc,	0x2
	fble	%fcc0,	loop_1186
	orn	%o5,	0x1EC7,	%g3
	fbuge	%fcc2,	loop_1187
	nop
	setx	0xB8CE23D62043FE35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
loop_1186:
	stx	%l2,	[%l7 + 0x20]
	fmovdge	%icc,	%f10,	%f21
loop_1187:
	nop
	setx	0xF7E76E84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xAB925125,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f30,	%f25
	addccc	%l3,	0x1286,	%i5
	popc	%o2,	%g4
	sethi	0x0791,	%i7
	fand	%f0,	%f6,	%f2
	fblg	%fcc3,	loop_1188
	movrgez	%g5,	%l6,	%i3
	sdivx	%g2,	0x05BF,	%l0
	taddcctv	%o4,	%i0,	%i1
loop_1188:
	sra	%l1,	%i2,	%g6
	prefetch	[%l7 + 0x6C],	 0x2
	fmovdvs	%xcc,	%f6,	%f17
	fnor	%f14,	%f24,	%f10
	addccc	%o6,	0x1A64,	%o1
	smul	%l4,	0x19DC,	%l5
	tpos	%icc,	0x4
	nop
	setx	0xB235361773298267,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF04CA4B24B042AE1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f8,	%f24
	sll	%o7,	0x0B,	%o3
	fmovsleu	%xcc,	%f28,	%f16
	nop
	setx loop_1189, %l0, %l1
	jmpl %l1, %i4
	srl	%g7,	%i6,	%g1
	sdivcc	%o0,	0x1B70,	%o5
	set	0x38, %l1
	lduwa	[%l7 + %l1] 0x89,	%l2
loop_1189:
	fmovsvc	%xcc,	%f20,	%f27
	wr	%g0,	0xea,	%asi
	stwa	%l3,	[%l7 + 0x70] %asi
	membar	#Sync
	array16	%i5,	%o2,	%g3
	fzero	%f10
	fnot2	%f12,	%f0
	ta	%xcc,	0x1
	alignaddrl	%g4,	%i7,	%g5
	pdist	%f20,	%f12,	%f18
	fmovdl	%icc,	%f9,	%f16
	mulx	%l6,	0x192D,	%i3
	fmovsleu	%icc,	%f14,	%f7
	edge8n	%l0,	%o4,	%i0
	movcc	%xcc,	%i1,	%g2
	smulcc	%l1,	%g6,	%i2
	wr	%g0,	0x18,	%asi
	sta	%f20,	[%l7 + 0x20] %asi
	srl	%o1,	%o6,	%l5
	andn	%l4,	%o7,	%i4
	movcc	%xcc,	%g7,	%o3
	movl	%icc,	%i6,	%o0
	movpos	%icc,	%o5,	%l2
	fmovsne	%icc,	%f27,	%f21
	srlx	%g1,	0x1E,	%i5
	addc	%o2,	%g3,	%l3
	flush	%l7 + 0x78
	nop
	set	0x3A, %g6
	lduh	[%l7 + %g6],	%i7
	edge8l	%g5,	%l6,	%i3
	sdiv	%g4,	0x0E1D,	%l0
	add	%o4,	%i0,	%g2
	mulx	%i1,	0x024F,	%l1
	edge16l	%g6,	%i2,	%o6
	for	%f6,	%f22,	%f16
	set	0x24, %i6
	ldsha	[%l7 + %i6] 0x80,	%o1
	mova	%icc,	%l5,	%l4
	tleu	%icc,	0x1
	edge16l	%i4,	%o7,	%g7
	alignaddrl	%o3,	%o0,	%i6
	andncc	%o5,	%l2,	%g1
	fmovrsne	%o2,	%f2,	%f10
	popc	%i5,	%l3
	ldsw	[%l7 + 0x40],	%g3
	wr	%g0,	0x0c,	%asi
	stha	%g5,	[%l7 + 0x16] %asi
	fmovdn	%icc,	%f23,	%f4
	fba,a	%fcc2,	loop_1190
	sdivx	%i7,	0x1072,	%l6
	andn	%i3,	0x146E,	%l0
	smul	%o4,	0x006B,	%i0
loop_1190:
	sllx	%g2,	%g4,	%i1
	fsrc2s	%f8,	%f6
	fpadd16	%f28,	%f8,	%f24
	set	0x24, %o3
	swapa	[%l7 + %o3] 0x88,	%l1
	edge32ln	%i2,	%g6,	%o6
	addc	%l5,	0x0176,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x5
	addc	%l4,	0x0F25,	%o7
	movg	%xcc,	%g7,	%i4
	wr	%g0,	0x80,	%asi
	stwa	%o3,	[%l7 + 0x1C] %asi
	edge8l	%i6,	%o0,	%o5
	orcc	%l2,	%g1,	%o2
	tvs	%xcc,	0x7
	membar	0x72
	te	%icc,	0x2
	movrlez	%i5,	%l3,	%g3
	xorcc	%g5,	%l6,	%i3
	nop
	setx	0x3D0B1E8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xB4A90180,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f27,	%f10
	fble	%fcc0,	loop_1191
	bneg,pn	%icc,	loop_1192
	fbug,a	%fcc1,	loop_1193
	movg	%icc,	%l0,	%o4
loop_1191:
	bshuffle	%f30,	%f10,	%f30
loop_1192:
	edge16	%i0,	%g2,	%i7
loop_1193:
	or	%i1,	0x00ED,	%g4
	edge32n	%i2,	%g6,	%o6
	addc	%l1,	0x195C,	%o1
	subcc	%l5,	0x0612,	%o7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x2E] %asi,	%l4
	tpos	%xcc,	0x7
	edge32l	%i4,	%o3,	%i6
	nop
	fitos	%f5,	%f3
	edge8n	%o0,	%o5,	%g7
	edge8ln	%g1,	%l2,	%o2
	taddcctv	%l3,	%i5,	%g5
	stbar
	array16	%g3,	%l6,	%i3
	fbne	%fcc3,	loop_1194
	nop
	setx	0xFD9D3C4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x7EC41751,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f27,	%f31
	movrlez	%o4,	0x2E6,	%i0
	addcc	%g2,	%l0,	%i1
loop_1194:
	sra	%i7,	0x0A,	%i2
	bn,pn	%xcc,	loop_1195
	lduh	[%l7 + 0x2E],	%g6
	edge16ln	%o6,	%l1,	%g4
	fmovse	%xcc,	%f24,	%f2
loop_1195:
	addcc	%l5,	0x0010,	%o7
	movgu	%xcc,	%o1,	%l4
	srl	%i4,	%o3,	%i6
	nop
	fitos	%f14,	%f14
	fstox	%f14,	%f6
	array16	%o0,	%o5,	%g1
	mova	%icc,	%l2,	%o2
	wr	%g0,	0x11,	%asi
	sta	%f28,	[%l7 + 0x44] %asi
	fble	%fcc3,	loop_1196
	sub	%l3,	%g7,	%g5
	mova	%xcc,	%i5,	%g3
	move	%icc,	%l6,	%o4
loop_1196:
	edge16ln	%i0,	%i3,	%l0
	edge32n	%i1,	%g2,	%i7
	smul	%g6,	%o6,	%i2
	movre	%l1,	0x2FA,	%l5
	swap	[%l7 + 0x48],	%o7
	xnor	%o1,	%g4,	%i4
	movvc	%icc,	%o3,	%i6
	movrne	%l4,	0x3F6,	%o5
	movgu	%icc,	%o0,	%g1
	fbge,a	%fcc3,	loop_1197
	mova	%xcc,	%l2,	%l3
	orcc	%g7,	%g5,	%o2
	tneg	%xcc,	0x5
loop_1197:
	fone	%f20
	alignaddr	%g3,	%l6,	%i5
	array32	%o4,	%i0,	%l0
	stbar
	te	%xcc,	0x3
	movgu	%icc,	%i3,	%i1
	movvs	%xcc,	%g2,	%g6
	sllx	%i7,	0x1F,	%i2
	stbar
	orncc	%l1,	%l5,	%o7
	fbue	%fcc2,	loop_1198
	movn	%xcc,	%o6,	%g4
	fnot2	%f4,	%f22
	bpos,a	%xcc,	loop_1199
loop_1198:
	tleu	%icc,	0x1
	mova	%icc,	%o1,	%i4
	bpos,a	loop_1200
loop_1199:
	tleu	%icc,	0x4
	fsrc1	%f8,	%f30
	movrne	%i6,	0x1D9,	%o3
loop_1200:
	fnot2s	%f15,	%f11
	fors	%f9,	%f29,	%f14
	sub	%o5,	%o0,	%l4
	fbge,a	%fcc0,	loop_1201
	fors	%f23,	%f15,	%f27
	edge8	%g1,	%l2,	%l3
	alignaddr	%g7,	%o2,	%g3
loop_1201:
	tleu	%xcc,	0x6
	movl	%icc,	%g5,	%l6
	tsubcc	%o4,	%i0,	%l0
	taddcc	%i3,	0x10C7,	%i5
	tg	%icc,	0x5
	fnands	%f10,	%f24,	%f27
	sdiv	%i1,	0x0E80,	%g2
	andncc	%i7,	%g6,	%i2
	fmovdcc	%icc,	%f11,	%f16
	tge	%icc,	0x2
	tl	%xcc,	0x1
	fmovrdgez	%l1,	%f0,	%f0
	movrgez	%o7,	%l5,	%o6
	array16	%g4,	%i4,	%o1
	subc	%o3,	%i6,	%o5
	nop
	setx	0x1C771BFCE3A3B554,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x67634F241976C7D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f10,	%f14
	ble	loop_1202
	sdiv	%l4,	0x0499,	%o0
	taddcc	%l2,	%l3,	%g7
	mova	%xcc,	%g1,	%g3
loop_1202:
	sll	%o2,	%l6,	%g5
	sethi	0x132B,	%i0
	fmovrsgz	%l0,	%f16,	%f1
	movneg	%icc,	%i3,	%o4
	bg,a	loop_1203
	popc	%i5,	%i1
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2F] %asi,	%g2
loop_1203:
	taddcc	%i7,	0x0A00,	%g6
	srax	%l1,	%o7,	%l5
	movcc	%xcc,	%o6,	%g4
	bg,a	loop_1204
	fmovsvs	%icc,	%f4,	%f20
	movgu	%icc,	%i2,	%i4
	swap	[%l7 + 0x50],	%o1
loop_1204:
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f19
	movcs	%icc,	%o3,	%o5
	taddcc	%l4,	0x0D77,	%o0
	sdivcc	%i6,	0x0BD7,	%l2
	tcs	%xcc,	0x3
	nop
	fitos	%f15,	%f21
	movre	%g7,	0x313,	%g1
	nop
	setx	0x3CCB7415,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x8ABBB47D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f9,	%f2
	set	0x3C, %i4
	sta	%f4,	[%l7 + %i4] 0x10
	srax	%g3,	%l3,	%o2
	for	%f16,	%f16,	%f16
	bn	%xcc,	loop_1205
	edge16ln	%g5,	%i0,	%l6
	tvc	%icc,	0x7
	xor	%l0,	%i3,	%i5
loop_1205:
	tl	%xcc,	0x7
	tsubcc	%i1,	0x034B,	%g2
	fpadd32	%f28,	%f22,	%f28
	ta	%xcc,	0x4
	edge16ln	%i7,	%o4,	%g6
	fpackfix	%f14,	%f27
	fmovrde	%o7,	%f6,	%f20
	nop
	fitos	%f9,	%f2
	fstox	%f2,	%f24
	nop
	setx	0x958ECDD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x4E824B38,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f1,	%f22
	edge8l	%l5,	%o6,	%g4
	edge16l	%l1,	%i2,	%o1
	xnor	%i4,	0x1A14,	%o5
	srl	%o3,	%o0,	%l4
	tneg	%icc,	0x3
	movvs	%xcc,	%i6,	%g7
	fmovdneg	%icc,	%f17,	%f23
	bpos,a,pt	%icc,	loop_1206
	srax	%l2,	%g1,	%l3
	edge32l	%g3,	%g5,	%o2
	edge32ln	%i0,	%l6,	%l0
loop_1206:
	tvc	%xcc,	0x2
	edge16l	%i3,	%i5,	%g2
	tsubcc	%i7,	0x1A67,	%i1
	nop
	fitos	%f11,	%f19
	fstox	%f19,	%f0
	fxtos	%f0,	%f21
	udivx	%o4,	0x0663,	%o7
	tvs	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
	fzeros	%f16
	nop
	setx	0xD071A13E,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	tg	%xcc,	0x7
	subc	%o6,	0x1ADA,	%g4
	tvs	%icc,	0x6
	edge16l	%l1,	%i2,	%l5
	nop
	fitos	%f6,	%f9
	fstox	%f9,	%f20
	fxtos	%f20,	%f10
	set	0x4C, %i0
	sta	%f9,	[%l7 + %i0] 0x15
	membar	0x76
	fbu	%fcc0,	loop_1207
	edge16n	%o1,	%i4,	%o5
	fmovdcc	%icc,	%f20,	%f8
	brgz	%o0,	loop_1208
loop_1207:
	fbe	%fcc0,	loop_1209
	subccc	%o3,	0x061F,	%l4
	fandnot1s	%f12,	%f15,	%f0
loop_1208:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1209:
	fbue,a	%fcc3,	loop_1210
	fbge	%fcc2,	loop_1211
	fmovsvc	%icc,	%f8,	%f27
	edge16n	%g7,	%l2,	%i6
loop_1210:
	fmovsn	%icc,	%f18,	%f5
loop_1211:
	stw	%g1,	[%l7 + 0x24]
	fmovdvc	%xcc,	%f22,	%f18
	fpack32	%f28,	%f26,	%f4
	set	0x44, %g2
	lduwa	[%l7 + %g2] 0x10,	%g3
	array8	%l3,	%g5,	%i0
	ldd	[%l7 + 0x60],	%o2
	edge8ln	%l0,	%l6,	%i5
	movg	%xcc,	%i3,	%i7
	brlz,a	%g2,	loop_1212
	tvs	%xcc,	0x2
	sdivcc	%i1,	0x027F,	%o7
	fbuge	%fcc1,	loop_1213
loop_1212:
	orncc	%g6,	%o4,	%o6
	fmovdne	%xcc,	%f22,	%f25
	subc	%g4,	0x0425,	%i2
loop_1213:
	tsubcctv	%l5,	%l1,	%i4
	nop
	setx	0xDC4B7353006D4C75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fxnor	%f18,	%f26,	%f24
	movrlez	%o1,	%o0,	%o3
	nop
	fitod	%f10,	%f16
	fdtoi	%f16,	%f9
	edge32	%o5,	%g7,	%l2
	nop
	setx	0xB6DBD332,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f25
	fbne	%fcc0,	loop_1214
	popc	%l4,	%i6
	ldx	[%l7 + 0x40],	%g3
	fmovscs	%xcc,	%f17,	%f10
loop_1214:
	fmovscc	%xcc,	%f12,	%f22
	tsubcctv	%l3,	%g1,	%g5
	tsubcctv	%o2,	0x0E9B,	%i0
	udivx	%l6,	0x1241,	%i5
	umul	%i3,	0x1E7F,	%l0
	edge16	%i7,	%i1,	%g2
	mulscc	%g6,	0x0EED,	%o7
	fxnor	%f18,	%f26,	%f22
	nop
	setx	0x95722C16D3EFA2C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5056C67ACF3CA5AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f24,	%f4
	sdivx	%o4,	0x160F,	%o6
	fbule,a	%fcc1,	loop_1215
	tcc	%xcc,	0x1
	addcc	%i2,	%l5,	%g4
	te	%xcc,	0x4
loop_1215:
	ldd	[%l7 + 0x60],	%f28
	bge,pn	%icc,	loop_1216
	nop
	setx	0x3D09B196FDFB8027,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x4A36DBF5FC879E0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f12,	%f28
	fmuld8sux16	%f0,	%f12,	%f8
	stb	%l1,	[%l7 + 0x6C]
loop_1216:
	membar	0x69
	or	%i4,	0x0CDE,	%o0
	edge32	%o3,	%o1,	%g7
	movcs	%xcc,	%o5,	%l4
	and	%l2,	%i6,	%g3
	fmovsg	%xcc,	%f12,	%f31
	fcmple32	%f28,	%f16,	%l3
	tle	%xcc,	0x6
	movvc	%icc,	%g5,	%o2
	edge16ln	%g1,	%i0,	%i5
	tn	%xcc,	0x3
	fbn	%fcc1,	loop_1217
	tcc	%xcc,	0x1
	edge16n	%l6,	%l0,	%i3
	mulscc	%i7,	0x0928,	%g2
loop_1217:
	movpos	%icc,	%g6,	%o7
	nop
	fitos	%f0,	%f9
	fstox	%f9,	%f28
	nop
	fitos	%f2,	%f9
	fstox	%f9,	%f22
	fxtos	%f22,	%f30
	movcs	%xcc,	%i1,	%o6
	movleu	%xcc,	%i2,	%o4
	array8	%l5,	%l1,	%i4
	fpadd16	%f6,	%f14,	%f16
	smul	%o0,	%o3,	%o1
	sdivcc	%g7,	0x0828,	%o5
	fmovdge	%icc,	%f21,	%f20
	taddcctv	%l4,	%g4,	%i6
	subccc	%l2,	%g3,	%g5
	nop
	set	0x15, %o0
	ldsb	[%l7 + %o0],	%l3
	movrne	%g1,	0x129,	%i0
	nop
	setx	0x50E1C61B8783D2B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x120DBC6197A8655A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f2,	%f10
	nop
	setx	0x7354496450671F85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	bneg	loop_1218
	udivcc	%o2,	0x093E,	%i5
	subccc	%l6,	0x1C60,	%l0
	ta	%icc,	0x4
loop_1218:
	tle	%xcc,	0x7
	fbuge,a	%fcc2,	loop_1219
	srax	%i7,	%g2,	%g6
	set	0x08, %l5
	stwa	%i3,	[%l7 + %l5] 0xe2
	membar	#Sync
loop_1219:
	movvs	%xcc,	%i1,	%o6
	array8	%i2,	%o4,	%o7
	udiv	%l1,	0x1B0F,	%i4
	fpack32	%f18,	%f4,	%f18
	movge	%icc,	%l5,	%o0
	udiv	%o3,	0x0608,	%o1
	movge	%xcc,	%g7,	%o5
	movgu	%xcc,	%g4,	%l4
	tcc	%icc,	0x2
	brnz,a	%i6,	loop_1220
	ld	[%l7 + 0x2C],	%f29
	bgu,a	loop_1221
	movgu	%icc,	%g3,	%g5
loop_1220:
	taddcctv	%l2,	%l3,	%i0
	movrlez	%g1,	%o2,	%l6
loop_1221:
	fsrc1	%f30,	%f0
	subc	%l0,	0x1CA9,	%i7
	fpsub32s	%f0,	%f28,	%f11
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x28] %asi,	%g2
	ldd	[%l7 + 0x60],	%g6
	bgu,a	loop_1222
	xorcc	%i5,	%i1,	%o6
	edge8	%i3,	%i2,	%o4
	ldd	[%l7 + 0x38],	%l0
loop_1222:
	fmovdpos	%xcc,	%f4,	%f13
	nop
	set	0x70, %l6
	lduw	[%l7 + %l6],	%o7
	movleu	%xcc,	%l5,	%i4
	udivx	%o0,	0x06C4,	%o1
	nop
	fitos	%f1,	%f24
	taddcctv	%o3,	0x08B1,	%o5
	smul	%g7,	%g4,	%i6
	mulscc	%l4,	0x1468,	%g3
	brz	%g5,	loop_1223
	tvs	%icc,	0x6
	bne	loop_1224
	movneg	%icc,	%l2,	%l3
loop_1223:
	movre	%g1,	%o2,	%i0
	fmovsl	%icc,	%f16,	%f16
loop_1224:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bl,a	%icc,	loop_1225
	edge32	%l0,	%l6,	%i7
	edge8	%g6,	%i5,	%i1
	movrlez	%g2,	0x24F,	%i3
loop_1225:
	tcc	%xcc,	0x4
	ldd	[%l7 + 0x08],	%o6
	movneg	%xcc,	%o4,	%l1
	movrgz	%o7,	0x256,	%l5
	fbuge	%fcc1,	loop_1226
	srl	%i4,	%o0,	%o1
	movrne	%o3,	%i2,	%o5
	movrgez	%g4,	%g7,	%i6
loop_1226:
	movgu	%xcc,	%l4,	%g3
	fbug	%fcc2,	loop_1227
	fmovdvs	%xcc,	%f12,	%f20
	edge8ln	%l2,	%l3,	%g5
	fmovsgu	%icc,	%f3,	%f8
loop_1227:
	fzeros	%f26
	sllx	%o2,	0x1B,	%i0
	edge8	%g1,	%l6,	%i7
	brnz,a	%g6,	loop_1228
	bgu	loop_1229
	nop
	setx	0x052914A677DCBD67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f14
	tvs	%xcc,	0x3
loop_1228:
	edge8ln	%l0,	%i1,	%i5
loop_1229:
	fmovsvc	%xcc,	%f8,	%f17
	tpos	%xcc,	0x1
	fpackfix	%f4,	%f8
	fnands	%f27,	%f22,	%f31
	swap	[%l7 + 0x2C],	%i3
	tleu	%icc,	0x1
	fmovsle	%icc,	%f26,	%f15
	brz	%o6,	loop_1230
	edge8ln	%g2,	%o4,	%l1
	array8	%l5,	%i4,	%o7
	tn	%icc,	0x1
loop_1230:
	fabss	%f17,	%f28
	taddcctv	%o0,	%o1,	%i2
	pdist	%f18,	%f28,	%f26
	tgu	%xcc,	0x0
	smul	%o3,	%o5,	%g7
	srax	%i6,	%l4,	%g3
	xor	%g4,	0x144D,	%l3
	fba	%fcc3,	loop_1231
	fmovrsgz	%g5,	%f14,	%f13
	call	loop_1232
	xnor	%o2,	0x063B,	%i0
loop_1231:
	te	%xcc,	0x0
	fzeros	%f24
loop_1232:
	edge32l	%g1,	%l2,	%i7
	nop
	fitos	%f10,	%f26
	fstox	%f26,	%f22
	fbn,a	%fcc1,	loop_1233
	tle	%icc,	0x1
	xnor	%l6,	0x1808,	%g6
	edge32	%l0,	%i1,	%i5
loop_1233:
	prefetch	[%l7 + 0x74],	 0x3
	edge16ln	%o6,	%g2,	%o4
	te	%xcc,	0x6
	fmovsvc	%icc,	%f9,	%f18
	tn	%icc,	0x6
	fba	%fcc3,	loop_1234
	fornot2	%f20,	%f10,	%f4
	fmovdvc	%xcc,	%f1,	%f1
	lduh	[%l7 + 0x6A],	%i3
loop_1234:
	ldd	[%l7 + 0x60],	%l4
	xnorcc	%l1,	0x0E34,	%o7
	sub	%i4,	0x0543,	%o0
	movpos	%xcc,	%i2,	%o3
	edge16ln	%o5,	%o1,	%i6
	udivx	%l4,	0x1ABC,	%g7
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x15,	 0x3
	nop
	setx	loop_1235,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sll	%g4,	%l3,	%o2
	movg	%icc,	%i0,	%g5
	edge16l	%g1,	%l2,	%i7
loop_1235:
	movg	%icc,	%g6,	%l6
	fmovdpos	%xcc,	%f26,	%f12
	edge32l	%i1,	%l0,	%i5
	array16	%o6,	%g2,	%i3
	fbne,a	%fcc0,	loop_1236
	tsubcctv	%o4,	0x0B4A,	%l1
	tvs	%xcc,	0x5
	edge16n	%l5,	%i4,	%o0
loop_1236:
	fnegd	%f20,	%f12
	fmovspos	%icc,	%f24,	%f7
	fmovrsgez	%i2,	%f24,	%f9
	fone	%f2
	fpack32	%f30,	%f14,	%f16
	udivcc	%o3,	0x1C13,	%o7
	sra	%o1,	0x0C,	%i6
	fbul	%fcc2,	loop_1237
	movne	%icc,	%o5,	%l4
	sllx	%g3,	0x15,	%g4
	pdist	%f8,	%f0,	%f14
loop_1237:
	subcc	%g7,	%l3,	%i0
	fble,a	%fcc3,	loop_1238
	edge32ln	%o2,	%g5,	%l2
	tg	%xcc,	0x0
	addc	%i7,	%g6,	%l6
loop_1238:
	fmovsn	%icc,	%f0,	%f8
	movge	%icc,	%i1,	%g1
	ldsb	[%l7 + 0x71],	%i5
	fbuge,a	%fcc1,	loop_1239
	tg	%icc,	0x6
	fbne,a	%fcc0,	loop_1240
	smulcc	%l0,	0x1B29,	%o6
loop_1239:
	array8	%g2,	%i3,	%o4
	addc	%l1,	%l5,	%o0
loop_1240:
	tn	%icc,	0x4
	be,a,pn	%icc,	loop_1241
	be,pt	%xcc,	loop_1242
	fbug,a	%fcc2,	loop_1243
	tne	%xcc,	0x2
loop_1241:
	add	%i2,	0x1B39,	%i4
loop_1242:
	array16	%o7,	%o1,	%i6
loop_1243:
	nop
	setx	0x60537B6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fpsub32	%f28,	%f28,	%f4
	wr	%g0,	0x0c,	%asi
	sta	%f23,	[%l7 + 0x6C] %asi
	add	%o3,	0x11BA,	%l4
	edge32	%o5,	%g3,	%g4
	nop
	setx	0x6E4FE7AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xDB64EB7F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f8,	%f29
	nop
	fitod	%f2,	%f28
	fdtox	%f28,	%f30
	fnot1	%f20,	%f0
	smulcc	%l3,	%i0,	%o2
	brgz,a	%g5,	loop_1244
	sdiv	%g7,	0x134C,	%l2
	tsubcc	%i7,	0x09F0,	%l6
	addccc	%i1,	%g6,	%g1
loop_1244:
	xor	%i5,	0x1AC4,	%l0
	sllx	%o6,	%g2,	%o4
	tleu	%icc,	0x4
	movrlez	%l1,	0x059,	%l5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o0
	array32	%i3,	%i2,	%i4
	movrne	%o1,	0x0D5,	%i6
	mulx	%o7,	0x1A63,	%o3
	sir	0x18C5
	nop
	fitod	%f6,	%f12
	edge16n	%l4,	%g3,	%o5
	fmovscc	%icc,	%f31,	%f8
	fcmpgt16	%f20,	%f0,	%l3
	movrne	%i0,	%g4,	%o2
	tcc	%icc,	0x6
	ld	[%l7 + 0x78],	%f6
	andcc	%g5,	%l2,	%i7
	fcmpne16	%f4,	%f10,	%l6
	membar	0x1C
	fandnot1	%f20,	%f8,	%f26
	set	0x4B, %g4
	ldsba	[%l7 + %g4] 0x81,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%g7,	%g1
	smul	%g6,	%l0,	%i5
	fmul8x16au	%f31,	%f13,	%f16
	andn	%g2,	%o4,	%l1
	fbg,a	%fcc1,	loop_1245
	xorcc	%l5,	0x10AF,	%o0
	fbe	%fcc3,	loop_1246
	bvc,a	loop_1247
loop_1245:
	nop
	setx	0x1DBE5E6A9BB1B3B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x0BF17B2DDBA4495D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f30,	%f10
	movneg	%icc,	%o6,	%i3
loop_1246:
	movneg	%icc,	%i4,	%i2
loop_1247:
	fnegs	%f31,	%f23
	bpos,a,pt	%icc,	loop_1248
	taddcctv	%i6,	%o7,	%o1
	edge16ln	%o3,	%g3,	%o5
	sub	%l3,	0x17AC,	%l4
loop_1248:
	subccc	%g4,	0x0C59,	%i0
	brgz	%g5,	loop_1249
	sub	%l2,	%i7,	%o2
	stx	%i1,	[%l7 + 0x68]
	tl	%xcc,	0x0
loop_1249:
	brlez	%l6,	loop_1250
	bn	%icc,	loop_1251
	bpos,pt	%xcc,	loop_1252
	umul	%g1,	0x0E31,	%g6
loop_1250:
	edge16	%l0,	%i5,	%g2
loop_1251:
	sll	%g7,	%o4,	%l1
loop_1252:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movcc	%icc,	%l5,	%o6
	xor	%o0,	0x066E,	%i4
	mova	%icc,	%i2,	%i3
	fcmple16	%f8,	%f16,	%i6
	fbo,a	%fcc0,	loop_1253
	tge	%icc,	0x3
	sdiv	%o1,	0x1A6F,	%o7
	sth	%o3,	[%l7 + 0x7C]
loop_1253:
	tle	%icc,	0x6
	tg	%icc,	0x2
	sdiv	%g3,	0x0EBA,	%o5
	edge16	%l4,	%l3,	%i0
	smulcc	%g4,	%g5,	%l2
	fsrc1s	%f1,	%f1
	andncc	%o2,	%i7,	%i1
	xor	%l6,	0x0141,	%g1
	brgz	%l0,	loop_1254
	xnor	%g6,	0x030B,	%g2
	bleu,a,pn	%xcc,	loop_1255
	bcs	%xcc,	loop_1256
loop_1254:
	fbn,a	%fcc2,	loop_1257
	edge16n	%i5,	%g7,	%o4
loop_1255:
	array8	%l1,	%o6,	%o0
loop_1256:
	edge32l	%l5,	%i2,	%i4
loop_1257:
	fmovrde	%i6,	%f2,	%f12
	nop
	setx	0x411E6695DDDCB05A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x702BB584C3141719,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f14,	%f16
	fmovdgu	%icc,	%f18,	%f24
	bn,pn	%icc,	loop_1258
	umulcc	%i3,	%o7,	%o3
	te	%icc,	0x1
	sth	%o1,	[%l7 + 0x0A]
loop_1258:
	movvc	%icc,	%o5,	%g3
	array16	%l3,	%l4,	%i0
	te	%xcc,	0x5
	edge16	%g4,	%g5,	%o2
	taddcctv	%i7,	0x12D1,	%i1
	fabss	%f17,	%f26
	and	%l2,	0x04C9,	%g1
	array8	%l0,	%l6,	%g6
	fnands	%f23,	%f17,	%f30
	fmovsgu	%xcc,	%f31,	%f23
	set	0x1A, %i1
	ldsha	[%l7 + %i1] 0x88,	%i5
	ta	%xcc,	0x2
	array8	%g2,	%g7,	%o4
	movrgez	%l1,	0x246,	%o6
	tneg	%icc,	0x0
	andcc	%l5,	0x0F6A,	%i2
	udiv	%o0,	0x097A,	%i6
	umul	%i4,	%o7,	%i3
	ta	%icc,	0x1
	movn	%xcc,	%o1,	%o3
	edge8ln	%o5,	%l3,	%l4
	orn	%g3,	%i0,	%g4
	ldd	[%l7 + 0x78],	%g4
	andncc	%o2,	%i7,	%l2
	fnands	%f2,	%f30,	%f27
	sdivx	%i1,	0x05E7,	%l0
	sdivx	%l6,	0x1C7A,	%g1
	andcc	%i5,	%g6,	%g7
	movrgez	%o4,	0x1F1,	%l1
	fpadd16	%f4,	%f10,	%f0
	andncc	%g2,	%o6,	%i2
	nop
	fitos	%f5,	%f7
	fstoi	%f7,	%f14
	orn	%l5,	%i6,	%o0
	tne	%xcc,	0x1
	fmovdne	%icc,	%f25,	%f4
	add	%o7,	0x1733,	%i4
	tneg	%xcc,	0x2
	umul	%i3,	%o1,	%o3
	movre	%l3,	%o5,	%g3
	sll	%l4,	0x03,	%g4
	fbuge,a	%fcc0,	loop_1259
	andn	%g5,	%i0,	%i7
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o2
loop_1259:
	tsubcc	%l2,	%l0,	%i1
	bgu	loop_1260
	fblg	%fcc1,	loop_1261
	fexpand	%f14,	%f28
	movge	%icc,	%g1,	%l6
loop_1260:
	subccc	%g6,	0x14F3,	%i5
loop_1261:
	nop
	wr	%g0,	0x10,	%asi
	stha	%o4,	[%l7 + 0x3C] %asi
	tsubcc	%g7,	%g2,	%o6
	udiv	%l1,	0x066A,	%i2
	fand	%f12,	%f28,	%f10
	movrlz	%i6,	0x362,	%l5
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f20
	fmovrdgez	%o0,	%f22,	%f4
	set	0x2E, %i2
	stba	%o7,	[%l7 + %i2] 0x0c
	xnor	%i4,	%i3,	%o3
	movcc	%icc,	%o1,	%l3
	nop
	setx	0x32B8DBA1CB359F40,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x08CD723A7F11D155,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f28,	%f24
	xnor	%o5,	%g3,	%l4
	fsrc1	%f4,	%f30
	and	%g4,	%g5,	%i7
	tg	%icc,	0x2
	array8	%i0,	%o2,	%l2
	tsubcc	%i1,	0x0EB1,	%g1
	set	0x0D, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l0
	bn,a,pt	%xcc,	loop_1262
	ta	%icc,	0x4
	sll	%l6,	%g6,	%o4
	set	0x56, %i5
	ldsha	[%l7 + %i5] 0x10,	%g7
loop_1262:
	tgu	%xcc,	0x6
	tne	%xcc,	0x7
	srlx	%i5,	0x0E,	%o6
	set	0x60, %g3
	ldda	[%l7 + %g3] 0xeb,	%l0
	stb	%i2,	[%l7 + 0x5A]
	bn,a	loop_1263
	membar	0x01
	edge8	%g2,	%i6,	%l5
	movpos	%xcc,	%o7,	%i4
loop_1263:
	fmovrdne	%i3,	%f14,	%f2
	ldsh	[%l7 + 0x2E],	%o0
	addcc	%o3,	0x0D14,	%l3
	edge8ln	%o5,	%o1,	%g3
	tleu	%icc,	0x7
	orcc	%g4,	%g5,	%i7
	edge32n	%l4,	%o2,	%l2
	tpos	%icc,	0x5
	fpadd16	%f28,	%f6,	%f30
	fble,a	%fcc0,	loop_1264
	ble,pt	%icc,	loop_1265
	taddcc	%i0,	%i1,	%g1
	fbl	%fcc2,	loop_1266
loop_1264:
	fbul,a	%fcc3,	loop_1267
loop_1265:
	movleu	%icc,	%l6,	%l0
	ba	%xcc,	loop_1268
loop_1266:
	add	%g6,	%g7,	%o4
loop_1267:
	movrlez	%i5,	%l1,	%i2
	tcs	%xcc,	0x2
loop_1268:
	sdivx	%g2,	0x12AA,	%o6
	srlx	%i6,	%l5,	%o7
	orn	%i4,	0x0F71,	%o0
	array16	%o3,	%i3,	%o5
	tvc	%xcc,	0x3
	array8	%o1,	%l3,	%g4
	sub	%g3,	%g5,	%l4
	brnz	%o2,	loop_1269
	xorcc	%i7,	0x1682,	%l2
	brgz,a	%i1,	loop_1270
	edge8	%g1,	%i0,	%l6
loop_1269:
	fbug,a	%fcc2,	loop_1271
	movcs	%xcc,	%g6,	%g7
loop_1270:
	andcc	%o4,	0x171D,	%l0
	bne	loop_1272
loop_1271:
	movge	%icc,	%l1,	%i5
	mova	%xcc,	%i2,	%o6
	fbge,a	%fcc0,	loop_1273
loop_1272:
	movleu	%xcc,	%i6,	%g2
	sdivx	%l5,	0x08A7,	%i4
	sdiv	%o7,	0x09FB,	%o3
loop_1273:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o0
	movl	%xcc,	%i3,	%o1
	movre	%l3,	0x2DB,	%g4
	edge16n	%o5,	%g3,	%l4
	xnorcc	%g5,	0x1FA5,	%o2
	sub	%l2,	%i1,	%g1
	or	%i7,	0x04D1,	%i0
	movrgz	%g6,	0x23F,	%l6
	fble	%fcc2,	loop_1274
	fzeros	%f18
	subc	%o4,	0x05C1,	%g7
	tge	%xcc,	0x2
loop_1274:
	tg	%xcc,	0x5
	stbar
	movrgz	%l0,	0x3E1,	%l1
	be,a	loop_1275
	fbu	%fcc1,	loop_1276
	movre	%i2,	%i5,	%o6
	edge32	%g2,	%i6,	%i4
loop_1275:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f1
loop_1276:
	alignaddr	%o7,	%o3,	%l5
	orn	%i3,	%o1,	%o0
	fbue,a	%fcc2,	loop_1277
	movrlez	%g4,	0x2B3,	%o5
	movcs	%icc,	%l3,	%g3
	or	%l4,	%o2,	%l2
loop_1277:
	movrlz	%i1,	0x179,	%g5
	mulscc	%g1,	%i0,	%g6
	movneg	%icc,	%l6,	%i7
	fbl	%fcc3,	loop_1278
	bcs,pt	%xcc,	loop_1279
	andncc	%o4,	%g7,	%l0
	fpack16	%f4,	%f28
loop_1278:
	umulcc	%l1,	%i2,	%i5
loop_1279:
	edge16	%g2,	%o6,	%i6
	brgz	%i4,	loop_1280
	call	loop_1281
	fmovsvs	%icc,	%f26,	%f20
	andn	%o7,	%o3,	%l5
loop_1280:
	xnor	%i3,	%o0,	%o1
loop_1281:
	te	%icc,	0x4
	for	%f14,	%f20,	%f8
	tle	%xcc,	0x5
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x11,	%g4
	sra	%l3,	0x04,	%o5
	ldub	[%l7 + 0x56],	%g3
	tle	%icc,	0x0
	fbe,a	%fcc1,	loop_1282
	sllx	%l4,	%o2,	%i1
	edge32n	%l2,	%g5,	%i0
	nop
	setx	0x65FAC760104420C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_1282:
	nop
	fitos	%f7,	%f3
	fstoi	%f3,	%f19
	add	%g1,	0x1D38,	%l6
	alignaddrl	%i7,	%o4,	%g7
	be,pn	%xcc,	loop_1283
	brnz	%l0,	loop_1284
	movle	%icc,	%l1,	%i2
	brgez	%g6,	loop_1285
loop_1283:
	brlez,a	%i5,	loop_1286
loop_1284:
	ldub	[%l7 + 0x50],	%g2
	fmovrsgez	%i6,	%f25,	%f11
loop_1285:
	edge32l	%o6,	%i4,	%o7
loop_1286:
	fpsub16	%f18,	%f26,	%f8
	ldstub	[%l7 + 0x2F],	%l5
	movgu	%xcc,	%o3,	%i3
	nop
	setx	0xEB5DD451806F5373,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	setx	0xF3ED1A26,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x5A335427,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f10,	%f6
	nop
	fitod	%f10,	%f12
	fdtos	%f12,	%f28
	tleu	%icc,	0x2
	movg	%xcc,	%o0,	%g4
	brgz,a	%o1,	loop_1287
	udivcc	%l3,	0x1528,	%o5
	edge16	%l4,	%g3,	%o2
	tvc	%xcc,	0x1
loop_1287:
	addcc	%l2,	0x103C,	%g5
	addccc	%i1,	%g1,	%i0
	xor	%i7,	0x1310,	%o4
	sll	%l6,	0x11,	%l0
	brlez	%l1,	loop_1288
	fblg,a	%fcc1,	loop_1289
	srlx	%i2,	0x0F,	%g7
	fnot1s	%f10,	%f21
loop_1288:
	andcc	%i5,	%g2,	%g6
loop_1289:
	tcs	%icc,	0x3
	edge8	%o6,	%i6,	%i4
	tvc	%icc,	0x2
	fbu,a	%fcc3,	loop_1290
	movvc	%xcc,	%l5,	%o7
	movle	%xcc,	%i3,	%o0
	addc	%g4,	0x0AE9,	%o1
loop_1290:
	movn	%xcc,	%o3,	%o5
	edge16ln	%l4,	%g3,	%l3
	orn	%l2,	0x081A,	%o2
	fbue	%fcc2,	loop_1291
	movgu	%xcc,	%g5,	%g1
	addcc	%i0,	0x0C83,	%i1
	set	0x1E, %g5
	stha	%i7,	[%l7 + %g5] 0x81
loop_1291:
	fmul8x16	%f30,	%f2,	%f22
	mulscc	%l6,	0x08C3,	%o4
	nop
	set	0x30, %i7
	std	%f8,	[%l7 + %i7]
	stw	%l1,	[%l7 + 0x38]
	and	%i2,	0x0B76,	%l0
	tg	%icc,	0x0
	tleu	%xcc,	0x2
	movl	%icc,	%i5,	%g7
	nop
	setx	0xE040C325,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fabss	%f28,	%f21
	movge	%icc,	%g6,	%g2
	movneg	%icc,	%o6,	%i4
	tcc	%icc,	0x1
	nop
	setx	0x894A0C3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x9E4217D3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f3,	%f5
	movpos	%xcc,	%i6,	%l5
	array16	%i3,	%o0,	%o7
	movrlz	%o1,	%g4,	%o3
	xnorcc	%l4,	%g3,	%o5
	fbne,a	%fcc2,	loop_1292
	udivx	%l2,	0x1E41,	%l3
	brz	%g5,	loop_1293
	movpos	%xcc,	%o2,	%i0
loop_1292:
	movg	%icc,	%i1,	%g1
	mulx	%l6,	%i7,	%o4
loop_1293:
	ldd	[%l7 + 0x58],	%f20
	set	0x68, %o4
	lduwa	[%l7 + %o4] 0x18,	%i2
	sdivcc	%l1,	0x1479,	%l0
	bpos,pt	%icc,	loop_1294
	andncc	%g7,	%i5,	%g6
	sir	0x0481
	movrlz	%o6,	%i4,	%i6
loop_1294:
	nop
	set	0x5F, %i3
	stb	%g2,	[%l7 + %i3]
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x1A] %asi,	%l5
	movneg	%icc,	%i3,	%o7
	movne	%xcc,	%o1,	%g4
	ldub	[%l7 + 0x2A],	%o3
	edge32n	%o0,	%l4,	%g3
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l2
	fbue,a	%fcc0,	loop_1295
	fbn,a	%fcc2,	loop_1296
	fmovrdgez	%l3,	%f0,	%f14
	tcs	%icc,	0x6
loop_1295:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1296:
	tcc	%icc,	0x1
	brnz,a	%o5,	loop_1297
	ble,a,pn	%icc,	loop_1298
	movpos	%icc,	%o2,	%i0
	udivx	%i1,	0x06B3,	%g1
loop_1297:
	edge8l	%l6,	%i7,	%o4
loop_1298:
	tge	%xcc,	0x5
	nop
	setx	0xDC503D2E0BC062A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f16
	fmovrdlez	%g5,	%f16,	%f12
	subc	%l1,	%i2,	%l0
	fmul8x16al	%f17,	%f29,	%f20
	bl,a,pt	%xcc,	loop_1299
	tne	%xcc,	0x1
	add	%i5,	0x1A19,	%g6
	std	%f16,	[%l7 + 0x08]
loop_1299:
	ld	[%l7 + 0x74],	%f23
	movrgez	%o6,	%g7,	%i6
	andcc	%i4,	0x11EB,	%g2
	fmovrslz	%i3,	%f12,	%f30
	fmul8sux16	%f16,	%f0,	%f2
	bg,a,pn	%xcc,	loop_1300
	or	%o7,	%l5,	%o1
	edge32l	%g4,	%o3,	%o0
	tvc	%xcc,	0x5
loop_1300:
	bvc	%icc,	loop_1301
	sll	%g3,	%l4,	%l3
	ldsh	[%l7 + 0x30],	%l2
	and	%o5,	%i0,	%i1
loop_1301:
	taddcctv	%o2,	%l6,	%i7
	wr	%g0,	0x0c,	%asi
	stha	%g1,	[%l7 + 0x08] %asi
	fmovsneg	%xcc,	%f27,	%f21
	tgu	%icc,	0x0
	addc	%o4,	0x15DA,	%g5
	tne	%icc,	0x2
	array8	%l1,	%l0,	%i2
	alignaddr	%g6,	%i5,	%o6
	edge8	%g7,	%i6,	%i4
	brlz	%g2,	loop_1302
	fpsub16s	%f12,	%f23,	%f8
	movneg	%icc,	%i3,	%o7
	mulx	%l5,	%o1,	%g4
loop_1302:
	sdivx	%o0,	0x1E72,	%o3
	popc	%l4,	%g3
	ldsw	[%l7 + 0x60],	%l2
	taddcctv	%o5,	%l3,	%i0
	edge8	%o2,	%i1,	%i7
	edge16ln	%g1,	%o4,	%g5
	stbar
	fmul8x16au	%f2,	%f30,	%f16
	sethi	0x1BB5,	%l6
	call	loop_1303
	srlx	%l0,	0x1D,	%l1
	sdivcc	%g6,	0x1F57,	%i5
	brlz,a	%i2,	loop_1304
loop_1303:
	movcc	%xcc,	%o6,	%g7
	sth	%i4,	[%l7 + 0x40]
	orcc	%i6,	0x043A,	%g2
loop_1304:
	movvs	%xcc,	%i3,	%l5
	tle	%xcc,	0x2
	edge16ln	%o7,	%g4,	%o1
	alignaddrl	%o3,	%l4,	%g3
	flush	%l7 + 0x40
	flush	%l7 + 0x18
	brlz	%l2,	loop_1305
	fmovrdlez	%o0,	%f0,	%f16
	movrlez	%o5,	0x2B7,	%i0
	tpos	%icc,	0x0
loop_1305:
	ldsw	[%l7 + 0x28],	%o2
	array32	%l3,	%i7,	%i1
	fble,a	%fcc1,	loop_1306
	popc	%g1,	%g5
	fandnot2	%f30,	%f2,	%f8
	movrlez	%o4,	%l6,	%l0
loop_1306:
	nop
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x19,	 0x0
	tcs	%icc,	0x2
	nop
	setx	0x441FB024FBBB22F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD05DDD0BEFF6F94E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f16,	%f14
	xor	%g6,	%i2,	%i5
	fmovdne	%icc,	%f30,	%f7
	addccc	%o6,	0x0CBE,	%i4
	srl	%g7,	0x1B,	%g2
	fmovrslez	%i6,	%f9,	%f4
	udivx	%l5,	0x1BA9,	%i3
	movleu	%xcc,	%o7,	%o1
	srax	%o3,	0x14,	%g4
	brnz,a	%l4,	loop_1307
	movge	%xcc,	%l2,	%g3
	nop
	setx	0x477BC081E94F7F74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xFEEC22B679D5B87D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f22
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%o0
loop_1307:
	srlx	%i0,	%l3,	%i7
	tle	%icc,	0x3
	fmovdleu	%xcc,	%f12,	%f2
	fmovsgu	%xcc,	%f6,	%f13
	fnegs	%f2,	%f29
	fmul8x16au	%f10,	%f19,	%f14
	movneg	%xcc,	%i1,	%o2
	nop
	setx	0x77D4D26C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f10
	taddcctv	%g5,	0x19F4,	%o4
	ldsb	[%l7 + 0x69],	%g1
	bgu,a,pn	%icc,	loop_1308
	fabsd	%f4,	%f10
	fmul8x16au	%f14,	%f6,	%f12
	fbug	%fcc2,	loop_1309
loop_1308:
	nop
	setx	loop_1310,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsne	%icc,	%f19,	%f21
	tne	%xcc,	0x6
loop_1309:
	nop
	setx	0x2177FD2DF04D95DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x6F84A511BFB776D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f26,	%f0
loop_1310:
	taddcctv	%l6,	%l1,	%g6
	tsubcc	%i2,	%i5,	%o6
	fmovsle	%icc,	%f27,	%f23
	fnot1s	%f11,	%f25
	fpackfix	%f30,	%f17
	nop
	setx	0xF250A079D94EA214,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2E01852DE7D862A7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f30,	%f24
	sdiv	%l0,	0x03C8,	%g7
	ldsh	[%l7 + 0x24],	%g2
	fmovrsne	%i6,	%f10,	%f10
	edge16	%i4,	%i3,	%o7
	movrgz	%o1,	%l5,	%o3
	subc	%g4,	0x0F66,	%l2
	bshuffle	%f16,	%f24,	%f22
	andn	%g3,	0x1115,	%o5
	movl	%icc,	%l4,	%o0
	brgz	%l3,	loop_1311
	edge8n	%i0,	%i1,	%i7
	movpos	%xcc,	%o2,	%o4
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f18
loop_1311:
	tle	%icc,	0x2
	set	0x09, %l0
	stba	%g5,	[%l7 + %l0] 0x19
	edge32l	%g1,	%l6,	%g6
	sdivcc	%l1,	0x1A90,	%i5
	mulscc	%o6,	0x04BD,	%i2
	ld	[%l7 + 0x44],	%f6
	move	%icc,	%l0,	%g7
	edge8n	%g2,	%i6,	%i4
	bgu	loop_1312
	sdiv	%i3,	0x1B52,	%o1
	fmovsleu	%icc,	%f3,	%f29
	tcc	%xcc,	0x1
loop_1312:
	brgez,a	%o7,	loop_1313
	fmovrdlez	%o3,	%f6,	%f14
	tpos	%xcc,	0x0
	tcc	%icc,	0x5
loop_1313:
	popc	0x1E4F,	%g4
	edge32l	%l5,	%g3,	%l2
	tne	%xcc,	0x4
	and	%o5,	%o0,	%l3
	mulx	%i0,	0x1AD8,	%i1
	sdiv	%i7,	0x06BF,	%o2
	tpos	%icc,	0x2
	movcc	%icc,	%o4,	%l4
	sdiv	%g1,	0x005F,	%l6
	bvc,a,pn	%icc,	loop_1314
	mova	%xcc,	%g6,	%g5
	fmovrdne	%l1,	%f2,	%f6
	membar	0x15
loop_1314:
	fmovsleu	%xcc,	%f23,	%f0
	edge16n	%o6,	%i5,	%i2
	bge,a,pn	%xcc,	loop_1315
	addccc	%g7,	%g2,	%l0
	andn	%i4,	0x04C6,	%i3
	subcc	%o1,	0x124D,	%o7
loop_1315:
	xnorcc	%o3,	%i6,	%g4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldsh	[%l7 + 0x0C],	%g3
	andn	%l2,	0x07CD,	%o5
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	movl	%icc,	%o0,	%l3
	tvs	%xcc,	0x6
	bne,pt	%icc,	loop_1316
	tneg	%icc,	0x3
	fbg,a	%fcc0,	loop_1317
	bl,pt	%icc,	loop_1318
loop_1316:
	movrne	%l5,	0x013,	%i0
	sra	%i7,	%o2,	%o4
loop_1317:
	sllx	%i1,	%l4,	%g1
loop_1318:
	andcc	%l6,	0x17C6,	%g5
	fnot2	%f24,	%f16
	nop
	setx	0xC07C5BD4,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	sdivx	%l1,	0x1DD8,	%g6
	movrgz	%o6,	0x17F,	%i2
	tle	%icc,	0x6
	wr	%g0,	0x23,	%asi
	stxa	%i5,	[%l7 + 0x70] %asi
	membar	#Sync
	mulscc	%g7,	0x0DA1,	%g2
	srl	%i4,	%i3,	%l0
	tpos	%xcc,	0x1
	fmovsvc	%xcc,	%f6,	%f13
	fmul8ulx16	%f24,	%f6,	%f0
	movn	%xcc,	%o1,	%o3
	orn	%i6,	0x15CA,	%g4
	movne	%xcc,	%o7,	%g3
	edge8ln	%l2,	%o0,	%l3
	fmovrsne	%l5,	%f0,	%f31
	sth	%i0,	[%l7 + 0x36]
	stbar
	mulx	%i7,	%o2,	%o4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x19,	%f0
	edge8n	%i1,	%l4,	%o5
	sdivx	%g1,	0x0E33,	%g5
	nop
	set	0x1C, %o2
	lduw	[%l7 + %o2],	%l6
	bvs,a	loop_1319
	smul	%l1,	%g6,	%o6
	bcs,a,pn	%xcc,	loop_1320
	sir	0x03DD
loop_1319:
	tpos	%icc,	0x7
	fnands	%f4,	%f26,	%f21
loop_1320:
	nop
	setx loop_1321, %l0, %l1
	jmpl %l1, %i2
	fpsub32	%f8,	%f26,	%f16
	movcs	%icc,	%i5,	%g2
	fpsub16s	%f17,	%f15,	%f27
loop_1321:
	movle	%xcc,	%g7,	%i4
	tcc	%icc,	0x3
	nop
	setx	0x6E79AE8D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f27
	fmovdle	%icc,	%f23,	%f10
	fcmpeq16	%f20,	%f14,	%i3
	stx	%l0,	[%l7 + 0x28]
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%o0
	fxors	%f29,	%f9,	%f8
	fabss	%f5,	%f14
	srl	%o3,	%g4,	%i6
	sethi	0x00D3,	%o7
	sdiv	%g3,	0x0C36,	%o0
	brz	%l3,	loop_1322
	sdivcc	%l5,	0x0AA7,	%i0
	addccc	%i7,	0x0B37,	%o2
	fba	%fcc2,	loop_1323
loop_1322:
	ldstub	[%l7 + 0x3E],	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x4
loop_1323:
	tcc	%icc,	0x4
	st	%f24,	[%l7 + 0x4C]
	fabss	%f24,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f6,	%f2,	%f16
	bcs,pn	%xcc,	loop_1324
	te	%xcc,	0x3
	brgz,a	%i1,	loop_1325
	stx	%l4,	[%l7 + 0x30]
loop_1324:
	fbue,a	%fcc1,	loop_1326
	tneg	%xcc,	0x3
loop_1325:
	nop
	set	0x76, %o5
	stba	%o5,	[%l7 + %o5] 0xeb
	membar	#Sync
loop_1326:
	movn	%xcc,	%g1,	%o4
	tleu	%xcc,	0x0
	tleu	%icc,	0x5
	nop
	setx	0xACDDF7F910569A67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	orn	%g5,	0x093D,	%l1
	fbule	%fcc2,	loop_1327
	sllx	%l6,	0x18,	%o6
	tgu	%xcc,	0x3
	nop
	fitos	%f10,	%f7
	fstoi	%f7,	%f9
loop_1327:
	nop
	setx	0x6BC865F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x60FF1680,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f2,	%f0
	array16	%i2,	%g6,	%g2
	brz,a	%g7,	loop_1328
	edge8	%i4,	%i5,	%i3
	for	%f14,	%f24,	%f28
	and	%o1,	0x06C7,	%l0
loop_1328:
	fbug,a	%fcc3,	loop_1329
	bpos,pn	%xcc,	loop_1330
	fmovscs	%xcc,	%f3,	%f8
	ldx	[%l7 + 0x50],	%g4
loop_1329:
	nop
	fitos	%f8,	%f5
	fstoi	%f5,	%f29
loop_1330:
	add	%i6,	0x105C,	%o7
	edge16l	%g3,	%o0,	%o3
	nop
	setx	0xCB857689790F2B49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x3A16636B5A4A90A7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f6
	edge32ln	%l5,	%l3,	%i0
	movcc	%icc,	%i7,	%o2
	fnegs	%f30,	%f11
	fba,a	%fcc0,	loop_1331
	fbg	%fcc3,	loop_1332
	andcc	%i1,	0x1A25,	%l2
	sllx	%l4,	%g1,	%o5
loop_1331:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g5
loop_1332:
	xnorcc	%l1,	%o4,	%l6
	brz	%i2,	loop_1333
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f12
	fxtos	%f12,	%f28
	fpsub16s	%f12,	%f2,	%f30
	srlx	%g6,	%g2,	%g7
loop_1333:
	move	%xcc,	%i4,	%i5
	stw	%i3,	[%l7 + 0x4C]
	stx	%o6,	[%l7 + 0x68]
	bcc,a,pt	%xcc,	loop_1334
	fxnor	%f12,	%f2,	%f10
	tcs	%icc,	0x6
	tpos	%icc,	0x3
loop_1334:
	fmovdpos	%icc,	%f3,	%f15
	tneg	%icc,	0x5
	prefetch	[%l7 + 0x4C],	 0x0
	xorcc	%l0,	%g4,	%o1
	edge16ln	%o7,	%g3,	%i6
	edge32ln	%o3,	%l5,	%l3
	orn	%o0,	0x118A,	%i7
	orn	%o2,	%i1,	%i0
	movcs	%icc,	%l2,	%l4
	stb	%o5,	[%l7 + 0x42]
	movn	%icc,	%g5,	%g1
	brlz,a	%o4,	loop_1335
	te	%icc,	0x2
	fmovscc	%icc,	%f8,	%f29
	nop
	setx	0x662B7535,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x7BBF6091,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f21,	%f22
loop_1335:
	te	%xcc,	0x1
	bvs	%xcc,	loop_1336
	movre	%l6,	%i2,	%l1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g2,	%g7
loop_1336:
	edge32l	%g6,	%i5,	%i3
	movrne	%o6,	0x16F,	%l0
	for	%f16,	%f24,	%f8
	fpadd32	%f26,	%f22,	%f28
	movpos	%icc,	%g4,	%o1
	fcmple16	%f16,	%f12,	%o7
	fpadd16	%f28,	%f6,	%f2
	andn	%g3,	%i6,	%i4
	te	%icc,	0x2
	tge	%icc,	0x7
	fpack16	%f8,	%f7
	subc	%o3,	%l3,	%l5
	edge8l	%i7,	%o0,	%i1
	set	0x53, %l1
	ldstuba	[%l7 + %l1] 0x19,	%i0
	movvs	%xcc,	%o2,	%l2
	umulcc	%o5,	%g5,	%g1
	swap	[%l7 + 0x20],	%l4
	fmovrsgez	%o4,	%f0,	%f29
	movleu	%xcc,	%i2,	%l6
	movrlez	%l1,	%g2,	%g6
	addcc	%i5,	0x1C7E,	%g7
	smul	%o6,	%i3,	%l0
	fsrc1	%f26,	%f22
	edge32ln	%o1,	%g4,	%o7
	sllx	%g3,	0x0C,	%i6
	srax	%o3,	%l3,	%l5
	bcs,a	%icc,	loop_1337
	and	%i4,	0x0238,	%i7
	movvs	%xcc,	%i1,	%i0
	movleu	%xcc,	%o0,	%o2
loop_1337:
	nop
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovdleu	%icc,	%f14,	%f27
	andn	%o5,	0x1EC0,	%g5
	movvs	%icc,	%g1,	%l4
	tgu	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o4
	srax	%i2,	%l6,	%l1
	fbo	%fcc3,	loop_1338
	movrgz	%l2,	%g2,	%i5
	fandnot1	%f10,	%f16,	%f22
	tle	%icc,	0x2
loop_1338:
	stw	%g6,	[%l7 + 0x60]
	tcc	%icc,	0x0
	tsubcctv	%g7,	%o6,	%l0
	movne	%icc,	%i3,	%o1
	fmul8x16	%f3,	%f14,	%f4
	xnorcc	%o7,	0x07C4,	%g4
	addccc	%i6,	%o3,	%g3
	and	%l3,	%l5,	%i4
	fnot1	%f12,	%f0
	movvc	%xcc,	%i7,	%i1
	movrne	%o0,	0x068,	%o2
	tcs	%icc,	0x4
	add	%i0,	%g5,	%o5
	fxnor	%f2,	%f4,	%f24
	movcs	%icc,	%l4,	%g1
	fmovd	%f0,	%f16
	nop
	setx	0x474C4764D4045D74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f18
	brlez	%o4,	loop_1339
	nop
	fitod	%f6,	%f28
	fdtos	%f28,	%f19
	ldx	[%l7 + 0x08],	%i2
	sll	%l6,	%l1,	%g2
loop_1339:
	add	%i5,	%g6,	%g7
	nop
	setx	0x8BF2310B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x473AEF49,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f3,	%f12
	nop
	setx	loop_1340,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%o6,	%l2,	%i3
	fble,a	%fcc3,	loop_1341
	movcc	%xcc,	%o1,	%o7
loop_1340:
	tcc	%icc,	0x0
	tn	%icc,	0x3
loop_1341:
	stb	%l0,	[%l7 + 0x50]
	fmovdvs	%icc,	%f30,	%f11
	tvc	%icc,	0x6
	array8	%g4,	%o3,	%g3
	fpadd32	%f26,	%f2,	%f2
	fand	%f28,	%f2,	%f30
	fmovsl	%xcc,	%f23,	%f21
	brnz,a	%l3,	loop_1342
	movne	%icc,	%l5,	%i6
	edge16n	%i4,	%i1,	%o0
	movg	%icc,	%i7,	%o2
loop_1342:
	edge32n	%i0,	%g5,	%l4
	umulcc	%g1,	%o5,	%i2
	fnegd	%f14,	%f0
	edge32ln	%l6,	%o4,	%g2
	ldx	[%l7 + 0x40],	%i5
	for	%f30,	%f28,	%f10
	stw	%l1,	[%l7 + 0x5C]
	edge8	%g6,	%g7,	%o6
	sdivcc	%l2,	0x04A2,	%o1
	orn	%i3,	0x0312,	%l0
	xor	%g4,	%o7,	%g3
	array8	%o3,	%l5,	%l3
	membar	0x70
	andncc	%i6,	%i1,	%o0
	udivx	%i4,	0x072B,	%o2
	array8	%i0,	%g5,	%l4
	smul	%i7,	0x15D3,	%o5
	bl,a,pt	%icc,	loop_1343
	alignaddr	%g1,	%i2,	%o4
	sdiv	%g2,	0x0476,	%l6
	bcc	%icc,	loop_1344
loop_1343:
	andncc	%i5,	%g6,	%g7
	brnz	%l1,	loop_1345
	sth	%l2,	[%l7 + 0x10]
loop_1344:
	srax	%o1,	%o6,	%l0
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f10
	fxtod	%f10,	%f14
loop_1345:
	movcs	%icc,	%i3,	%o7
	fbul,a	%fcc3,	loop_1346
	edge32l	%g3,	%g4,	%l5
	movl	%xcc,	%o3,	%i6
	xnor	%l3,	0x1C14,	%i1
loop_1346:
	sub	%i4,	0x1E17,	%o2
	nop
	set	0x74, %o7
	ldsw	[%l7 + %o7],	%i0
	tgu	%xcc,	0x7
	fbule	%fcc1,	loop_1347
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o0,	%l4
	udiv	%i7,	0x1214,	%g5
loop_1347:
	fbn,a	%fcc1,	loop_1348
	nop
	setx	loop_1349,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%o5,	0x02A1,	%i2
	addcc	%o4,	0x0D38,	%g2
loop_1348:
	popc	%l6,	%g1
loop_1349:
	andncc	%g6,	%g7,	%i5
	add	%l2,	0x1CFB,	%l1
	fbne	%fcc3,	loop_1350
	subc	%o6,	0x1AC1,	%l0
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f19
	fnot1	%f26,	%f10
loop_1350:
	nop
	setx	0xC6FCD23E73CEFC4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3ADFBC7C9F5278B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f20,	%f18
	st	%f25,	[%l7 + 0x0C]
	movvc	%xcc,	%o1,	%o7
	movcc	%xcc,	%g3,	%g4
	edge16	%i3,	%l5,	%o3
	tne	%xcc,	0x4
	set	0x10, %i6
	stxa	%l3,	[%g0 + %i6] 0x21
	fpsub32	%f22,	%f14,	%f16
	set	0x26, %g6
	ldsha	[%l7 + %g6] 0x15,	%i1
	nop
	setx	0x60BCE521,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f21
	srax	%i4,	0x10,	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x10,	%i0,	%i6
	bvc,a,pn	%xcc,	loop_1351
	movne	%xcc,	%l4,	%o0
	fexpand	%f11,	%f12
	and	%i7,	0x01BA,	%g5
loop_1351:
	te	%icc,	0x0
	movne	%icc,	%i2,	%o4
	subccc	%g2,	%o5,	%l6
	fmul8x16al	%f3,	%f8,	%f20
	movg	%xcc,	%g1,	%g6
	std	%f24,	[%l7 + 0x28]
	smul	%g7,	%i5,	%l1
	fbu	%fcc0,	loop_1352
	srl	%o6,	%l2,	%o1
	fnot1	%f12,	%f28
	addc	%o7,	%l0,	%g4
loop_1352:
	edge32	%i3,	%l5,	%g3
	fbule,a	%fcc0,	loop_1353
	fmul8x16al	%f26,	%f18,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4E, %o3
	lduba	[%l7 + %o3] 0x89,	%o3
loop_1353:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f26,	%f20,	%f16
	movvs	%xcc,	%i1,	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o2,	%i0
	fmovrde	%i4,	%f4,	%f0
	edge8l	%i6,	%o0,	%l4
	edge32ln	%i7,	%i2,	%o4
	udivx	%g2,	0x05A1,	%o5
	sth	%l6,	[%l7 + 0x36]
	movpos	%xcc,	%g1,	%g5
	nop
	setx	0x63A4389579DA1D52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f20
	xor	%g7,	0x142E,	%g6
	bne,a,pt	%icc,	loop_1354
	taddcc	%i5,	%o6,	%l2
	fmul8x16au	%f7,	%f3,	%f10
	fmul8sux16	%f10,	%f10,	%f2
loop_1354:
	andcc	%o1,	0x0EBE,	%o7
	tl	%icc,	0x0
	set	0x30, %i4
	ldstuba	[%l7 + %i4] 0x19,	%l0
	tneg	%icc,	0x4
	fbul,a	%fcc1,	loop_1355
	array8	%g4,	%l1,	%l5
	srl	%g3,	0x13,	%i3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x20] %asi,	%i1
loop_1355:
	fmovdleu	%icc,	%f10,	%f2
	srax	%o3,	%l3,	%i0
	tsubcc	%o2,	0x03D9,	%i6
	udiv	%o0,	0x06CE,	%l4
	movl	%xcc,	%i7,	%i2
	bge,a	loop_1356
	brlez,a	%o4,	loop_1357
	udiv	%g2,	0x078F,	%i4
	udiv	%l6,	0x1F8E,	%o5
loop_1356:
	sllx	%g1,	0x1B,	%g5
loop_1357:
	brz	%g6,	loop_1358
	nop
	setx	0x50AF3029,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x718C539A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f0,	%f14
	edge16	%g7,	%o6,	%i5
	movg	%xcc,	%l2,	%o1
loop_1358:
	subc	%o7,	0x0DEE,	%g4
	wr	%g0,	0x0c,	%asi
	stwa	%l1,	[%l7 + 0x14] %asi
	taddcctv	%l5,	%g3,	%i3
	bcc,pn	%icc,	loop_1359
	edge8l	%i1,	%o3,	%l3
	fandnot1s	%f1,	%f6,	%f24
	edge16l	%i0,	%o2,	%l0
loop_1359:
	edge16ln	%o0,	%l4,	%i7
	fnors	%f28,	%f14,	%f24
	stb	%i2,	[%l7 + 0x46]
	alignaddrl	%o4,	%i6,	%g2
	fmovsne	%xcc,	%f18,	%f17
	fcmpgt16	%f20,	%f16,	%i4
	array8	%o5,	%g1,	%g5
	fcmpeq16	%f12,	%f20,	%l6
	movl	%icc,	%g7,	%o6
	fandnot1s	%f1,	%f31,	%f0
	ld	[%l7 + 0x40],	%f23
	xor	%i5,	0x08F0,	%g6
	bcs,a	loop_1360
	array32	%l2,	%o7,	%o1
	movcc	%xcc,	%l1,	%g4
	tcs	%icc,	0x6
loop_1360:
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f2
	tl	%icc,	0x0
	sra	%l5,	%g3,	%i3
	call	loop_1361
	alignaddrl	%o3,	%l3,	%i0
	st	%f1,	[%l7 + 0x20]
	edge16ln	%i1,	%l0,	%o2
loop_1361:
	ld	[%l7 + 0x6C],	%f24
	membar	0x3B
	ta	%xcc,	0x4
	movrlz	%o0,	0x3E1,	%i7
	fnot2s	%f19,	%f30
	subccc	%i2,	%l4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o4,	[%l7 + 0x2D]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%f24
	tvs	%xcc,	0x1
	fmovdn	%xcc,	%f2,	%f26
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0x1
	edge16	%o5,	%i4,	%g1
	tle	%icc,	0x5
	srax	%g5,	0x0A,	%l6
	tcs	%icc,	0x0
	tn	%icc,	0x5
	andncc	%g7,	%i5,	%g6
	tn	%icc,	0x1
	ldstub	[%l7 + 0x68],	%o6
	bleu,a	loop_1362
	mulx	%l2,	0x0AEC,	%o1
	sdiv	%l1,	0x1DB0,	%o7
	bgu,a	loop_1363
loop_1362:
	fpadd16s	%f28,	%f27,	%f11
	movrne	%l5,	%g3,	%i3
	udivcc	%o3,	0x1ABB,	%l3
loop_1363:
	movrlz	%i0,	%g4,	%i1
	fbo,a	%fcc0,	loop_1364
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x24, %i0
	sta	%f25,	[%l7 + %i0] 0x19
loop_1364:
	mova	%xcc,	%l0,	%o0
	smul	%o2,	%i2,	%i7
	umul	%i6,	%o4,	%g2
	set	0x2E, %l5
	lduha	[%l7 + %l5] 0x10,	%o5
	array8	%l4,	%g1,	%g5
	wr	%g0,	0x04,	%asi
	sta	%f29,	[%l7 + 0x30] %asi
	bne,pn	%xcc,	loop_1365
	sdivx	%l6,	0x03EA,	%g7
	movvc	%xcc,	%i5,	%i4
	alignaddrl	%g6,	%l2,	%o6
loop_1365:
	fsrc1	%f22,	%f26
	bpos,a,pn	%xcc,	loop_1366
	edge8l	%l1,	%o1,	%l5
	udivcc	%o7,	0x082D,	%i3
	fmovrsne	%g3,	%f0,	%f30
loop_1366:
	fornot2	%f22,	%f2,	%f8
	edge16ln	%o3,	%l3,	%g4
	addccc	%i0,	0x0302,	%i1
	fexpand	%f18,	%f22
	bcc,a	%xcc,	loop_1367
	fmul8x16au	%f12,	%f12,	%f6
	tvc	%icc,	0x4
	fmuld8ulx16	%f6,	%f23,	%f8
loop_1367:
	fbe,a	%fcc2,	loop_1368
	andncc	%o0,	%l0,	%i2
	xor	%i7,	%o2,	%i6
	andn	%g2,	%o5,	%o4
loop_1368:
	xnorcc	%g1,	0x0555,	%g5
	faligndata	%f16,	%f14,	%f20
	fblg,a	%fcc3,	loop_1369
	smul	%l6,	0x0B0C,	%g7
	nop
	setx	0x6878B729,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x20DA2E15,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f28,	%f29
	sll	%l4,	0x05,	%i4
loop_1369:
	tl	%xcc,	0x6
	tsubcctv	%g6,	0x1450,	%l2
	wr	%g0,	0x19,	%asi
	stwa	%o6,	[%l7 + 0x2C] %asi
	fmovsn	%icc,	%f11,	%f6
	movre	%l1,	0x170,	%i5
	tgu	%xcc,	0x7
	fcmpgt32	%f26,	%f26,	%o1
	movpos	%icc,	%o7,	%l5
	fbe	%fcc2,	loop_1370
	nop
	fitos	%f6,	%f28
	tpos	%icc,	0x2
	smulcc	%i3,	0x0EFF,	%o3
loop_1370:
	bleu,pt	%xcc,	loop_1371
	srlx	%g3,	0x1D,	%g4
	subc	%l3,	0x01DA,	%i0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o0,	%i1
loop_1371:
	nop
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x04,	%l0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i7
	edge16l	%i2,	%i6,	%g2
	ldsh	[%l7 + 0x3C],	%o2
	fmul8x16	%f22,	%f12,	%f2
	fmovrdlz	%o5,	%f4,	%f4
	tvc	%xcc,	0x3
	xorcc	%o4,	%g5,	%g1
	ld	[%l7 + 0x78],	%f29
	movg	%xcc,	%l6,	%g7
	bcs,a	%icc,	loop_1372
	fnot1	%f20,	%f14
	stx	%l4,	[%l7 + 0x08]
	edge16ln	%i4,	%g6,	%l2
loop_1372:
	edge16l	%l1,	%i5,	%o6
	edge32l	%o1,	%l5,	%o7
	tcs	%icc,	0x5
	ldsh	[%l7 + 0x60],	%i3
	set	0x41, %g4
	lduba	[%l7 + %g4] 0x11,	%o3
	subc	%g4,	%l3,	%i0
	brlz,a	%g3,	loop_1373
	srax	%i1,	0x04,	%l0
	nop
	setx	0x39DEE2AF21929E37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x3C9B3102C52EA387,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f2,	%f22
	smulcc	%i7,	0x1452,	%i2
loop_1373:
	edge8ln	%i6,	%o0,	%g2
	edge32	%o5,	%o2,	%g5
	movle	%xcc,	%o4,	%l6
	fpack32	%f20,	%f18,	%f20
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x19,	 0x0
	nop
	setx	0xEAA9306D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xD7B0D88F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f6,	%f3
	fmovdn	%xcc,	%f10,	%f21
	tsubcc	%g1,	0x1723,	%i4
	nop
	set	0x36, %i1
	ldsb	[%l7 + %i1],	%l4
	tpos	%icc,	0x3
	subc	%l2,	0x133A,	%l1
	fors	%f3,	%f20,	%f10
	fbne	%fcc1,	loop_1374
	bpos,a	%xcc,	loop_1375
	fmovrsgez	%i5,	%f8,	%f4
	fabss	%f0,	%f2
loop_1374:
	popc	0x08D7,	%g6
loop_1375:
	nop
	setx	0x148A6D39,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f15
	movrgz	%o1,	0x199,	%l5
	smul	%o7,	%i3,	%o3
	fnors	%f25,	%f8,	%f2
	movrlz	%o6,	0x0EE,	%l3
	addcc	%i0,	0x0703,	%g4
	nop
	fitod	%f0,	%f30
	fdtos	%f30,	%f6
	umul	%g3,	0x0DA4,	%i1
	fbule	%fcc3,	loop_1376
	ta	%icc,	0x4
	movrne	%i7,	%l0,	%i2
	fnor	%f12,	%f24,	%f10
loop_1376:
	addc	%i6,	%g2,	%o0
	andncc	%o5,	%o2,	%o4
	tn	%xcc,	0x7
	ldd	[%l7 + 0x48],	%i6
	brnz	%g5,	loop_1377
	fpsub16s	%f11,	%f6,	%f27
	fones	%f7
	movcs	%icc,	%g7,	%i4
loop_1377:
	fnot1s	%f11,	%f21
	bgu,pn	%xcc,	loop_1378
	sllx	%g1,	0x11,	%l4
	edge16ln	%l1,	%l2,	%i5
	tcc	%xcc,	0x1
loop_1378:
	sll	%o1,	0x13,	%g6
	andcc	%l5,	0x15FF,	%o7
	mulx	%o3,	%o6,	%l3
	movle	%icc,	%i3,	%g4
	xor	%g3,	0x0977,	%i0
	srax	%i7,	0x0F,	%l0
	bl	loop_1379
	fpack32	%f14,	%f20,	%f30
	fbl,a	%fcc3,	loop_1380
	membar	0x5F
loop_1379:
	umul	%i1,	%i6,	%i2
	ldd	[%l7 + 0x60],	%f8
loop_1380:
	edge32ln	%g2,	%o0,	%o2
	addcc	%o5,	%l6,	%g5
	fmovsvs	%xcc,	%f22,	%f23
	udivcc	%g7,	0x1A1D,	%o4
	sll	%i4,	0x1D,	%g1
	movcs	%icc,	%l4,	%l1
	set	0x2C, %l3
	ldswa	[%l7 + %l3] 0x11,	%l2
	array8	%o1,	%i5,	%g6
	mulscc	%l5,	0x157D,	%o7
	edge8l	%o6,	%l3,	%i3
	xnorcc	%g4,	%o3,	%g3
	srl	%i0,	0x14,	%l0
	udivx	%i7,	0x0993,	%i6
	tle	%xcc,	0x5
	fbn	%fcc3,	loop_1381
	movleu	%xcc,	%i2,	%g2
	movne	%xcc,	%i1,	%o0
	umul	%o2,	0x10DD,	%l6
loop_1381:
	movn	%xcc,	%o5,	%g7
	smulcc	%g5,	%o4,	%g1
	movrne	%l4,	0x302,	%i4
	fpsub16	%f30,	%f16,	%f10
	array8	%l1,	%o1,	%i5
	brlz,a	%g6,	loop_1382
	nop
	setx	0x3694DDFFE04B453C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fbn	%fcc0,	loop_1383
	edge8ln	%l2,	%o7,	%o6
loop_1382:
	tgu	%xcc,	0x6
	movl	%xcc,	%l3,	%l5
loop_1383:
	movpos	%xcc,	%g4,	%i3
	fmovrdgz	%g3,	%f2,	%f28
	movg	%xcc,	%o3,	%l0
	array32	%i0,	%i7,	%i6
	taddcc	%g2,	0x1E33,	%i2
	umul	%i1,	0x1595,	%o2
	smulcc	%l6,	%o5,	%g7
	fmuld8ulx16	%f17,	%f26,	%f8
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g5
	fmovrdlz	%o4,	%f12,	%f2
	sethi	0x0DCA,	%g1
	stw	%o0,	[%l7 + 0x24]
	edge32l	%l4,	%l1,	%i4
	bn,a	loop_1384
	mulscc	%o1,	0x0D30,	%g6
	fmul8x16au	%f13,	%f31,	%f10
	smulcc	%l2,	0x0B61,	%i5
loop_1384:
	edge32n	%o7,	%o6,	%l5
	sdivcc	%l3,	0x1B6E,	%g4
	edge16l	%g3,	%i3,	%o3
	tcs	%icc,	0x1
	edge8l	%i0,	%i7,	%i6
	fzeros	%f24
	taddcctv	%l0,	0x14F9,	%g2
	ldd	[%l7 + 0x70],	%f12
	movvc	%icc,	%i2,	%o2
	ta	%icc,	0x3
	prefetch	[%l7 + 0x10],	 0x0
	sir	0x0895
	fpsub16s	%f8,	%f26,	%f13
	movneg	%icc,	%l6,	%i1
	ba,pt	%icc,	loop_1385
	movcs	%icc,	%g7,	%o5
	edge32n	%g5,	%g1,	%o4
	move	%icc,	%l4,	%o0
loop_1385:
	fpmerge	%f2,	%f16,	%f16
	add	%l7,	0x74,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x04,	%l1,	%o1
	brz,a	%g6,	loop_1386
	tcc	%xcc,	0x1
	movvc	%icc,	%i4,	%i5
	fbo,a	%fcc0,	loop_1387
loop_1386:
	movrgez	%o7,	%l2,	%o6
	edge32n	%l3,	%l5,	%g3
	brlez	%i3,	loop_1388
loop_1387:
	fbe	%fcc1,	loop_1389
	addcc	%g4,	0x1D73,	%o3
	movrgz	%i0,	0x255,	%i6
loop_1388:
	or	%i7,	%g2,	%l0
loop_1389:
	add	%i2,	0x1F82,	%o2
	tge	%icc,	0x1
	movneg	%icc,	%i1,	%l6
	bl,a	%xcc,	loop_1390
	movne	%xcc,	%o5,	%g7
	fpmerge	%f9,	%f22,	%f26
	fblg,a	%fcc1,	loop_1391
loop_1390:
	nop
	setx	loop_1392,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bge,a,pt	%icc,	loop_1393
	brlz,a	%g5,	loop_1394
loop_1391:
	andn	%g1,	%o4,	%o0
loop_1392:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l4
loop_1393:
	nop
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x1e
	membar	#Sync
loop_1394:
	tcc	%xcc,	0x6
	fbul,a	%fcc0,	loop_1395
	popc	%l1,	%o1
	andn	%i4,	%i5,	%o7
	mova	%icc,	%g6,	%o6
loop_1395:
	array16	%l3,	%l2,	%g3
	smul	%l5,	0x19F0,	%g4
	te	%icc,	0x1
	edge8ln	%i3,	%o3,	%i0
	movvc	%xcc,	%i7,	%i6
	udiv	%g2,	0x1BBD,	%i2
	brz	%o2,	loop_1396
	tg	%xcc,	0x2
	subccc	%l0,	%l6,	%o5
	mulx	%i1,	0x0A5B,	%g7
loop_1396:
	fsrc2	%f0,	%f20
	fxor	%f16,	%f14,	%f28
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x18] %asi,	%g1
	fmovrsgz	%g5,	%f3,	%f6
	sethi	0x1D96,	%o4
	fpadd16s	%f28,	%f23,	%f4
	orn	%l4,	0x1356,	%o0
	fbule,a	%fcc0,	loop_1397
	ldd	[%l7 + 0x78],	%f16
	andncc	%l1,	%o1,	%i4
	bg,pt	%xcc,	loop_1398
loop_1397:
	tneg	%icc,	0x5
	ldsh	[%l7 + 0x54],	%i5
	movrne	%o7,	0x277,	%o6
loop_1398:
	fsrc2	%f8,	%f26
	smulcc	%g6,	%l3,	%l2
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	fmovsleu	%xcc,	%f4,	%f9
	smulcc	%l5,	%g3,	%g4
	udivcc	%i3,	0x0E7B,	%i0
	fmovdvs	%icc,	%f9,	%f27
	tvs	%xcc,	0x7
	fmovs	%f6,	%f7
	orncc	%i7,	%i6,	%g2
	bcs,a	loop_1399
	alignaddrl	%i2,	%o2,	%l0
	tn	%icc,	0x3
	edge32ln	%o3,	%o5,	%l6
loop_1399:
	udivcc	%g7,	0x1D46,	%i1
	fmovdge	%xcc,	%f13,	%f29
	fbo,a	%fcc0,	loop_1400
	subc	%g5,	%o4,	%g1
	tleu	%xcc,	0x0
	movgu	%icc,	%o0,	%l4
loop_1400:
	edge16	%l1,	%o1,	%i4
	movre	%i5,	0x34C,	%o6
	popc	0x12DD,	%g6
	udiv	%o7,	0x039A,	%l2
	stw	%l5,	[%l7 + 0x14]
	ble,a,pt	%icc,	loop_1401
	tvc	%xcc,	0x3
	subcc	%g3,	%g4,	%l3
	movrne	%i0,	%i7,	%i3
loop_1401:
	nop
	setx	0xB77CD31510CECB7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f28
	tleu	%xcc,	0x1
	movle	%xcc,	%i6,	%g2
	fmul8sux16	%f18,	%f6,	%f22
	std	%f28,	[%l7 + 0x68]
	flush	%l7 + 0x28
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	nop
	setx	0x3A5AE2DF9552E70F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE5DB2BD7977D554A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f12,	%f28
	tn	%xcc,	0x3
	nop
	setx	0x0A435BA34BAF6720,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x53621F27AEBF8A60,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f0,	%f2
	movg	%xcc,	%i2,	%o3
	tne	%icc,	0x0
	brlez	%l0,	loop_1402
	fcmpeq32	%f4,	%f22,	%l6
	udivcc	%o5,	0x18A0,	%i1
	fandnot2s	%f26,	%f4,	%f25
loop_1402:
	movvc	%icc,	%g7,	%g5
	addcc	%g1,	%o4,	%l4
	tg	%icc,	0x3
	membar	0x29
	membar	0x5F
	movre	%l1,	0x166,	%o0
	nop
	setx	0x5457E052,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xBD5D8FD6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f12,	%f30
	sir	0x0121
	nop
	setx	0x7CF774F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x46207EFC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f0,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x2B
	mulx	%o1,	%i5,	%i4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o6
	fzero	%f6
	addc	%l2,	%l5,	%o7
	edge32ln	%g3,	%g4,	%l3
	or	%i7,	0x1928,	%i3
	fmovdge	%icc,	%f0,	%f28
	fbug	%fcc0,	loop_1403
	fmovdcc	%xcc,	%f14,	%f23
	movrlez	%i6,	%g2,	%o2
	taddcc	%i0,	0x12C2,	%i2
loop_1403:
	edge32	%o3,	%l0,	%o5
	fmovsg	%icc,	%f15,	%f18
	edge16l	%l6,	%i1,	%g5
	movg	%xcc,	%g7,	%o4
	fnot2s	%f31,	%f16
	mova	%xcc,	%g1,	%l4
	sethi	0x1616,	%l1
	brlz	%o0,	loop_1404
	fpadd16	%f4,	%f24,	%f4
	wr	%g0,	0x81,	%asi
	sta	%f8,	[%l7 + 0x3C] %asi
loop_1404:
	movcc	%xcc,	%o1,	%i4
	fzero	%f2
	sdivcc	%g6,	0x09D6,	%o6
	fbo,a	%fcc2,	loop_1405
	edge8	%l2,	%i5,	%o7
	set	0x70, %g7
	lduba	[%l7 + %g7] 0x81,	%g3
loop_1405:
	sllx	%l5,	%l3,	%i7
	alignaddr	%i3,	%g4,	%i6
	membar	0x0B
	edge16n	%g2,	%i0,	%o2
	edge8l	%i2,	%o3,	%o5
	nop
	setx	0x6DA820E543BEC84F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x63F1B3BAA4248C0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f28,	%f16
	edge16n	%l6,	%l0,	%g5
	fmul8x16au	%f22,	%f20,	%f20
	ldsw	[%l7 + 0x20],	%i1
	orn	%g7,	0x062A,	%g1
	addc	%l4,	0x02F9,	%o4
	xor	%o0,	0x15A7,	%l1
	tcc	%xcc,	0x2
	fmovrdgz	%o1,	%f2,	%f26
	te	%xcc,	0x1
	ldub	[%l7 + 0x75],	%g6
	or	%o6,	0x0939,	%l2
	add	%i5,	0x0080,	%o7
	srl	%g3,	0x1B,	%l5
	fmovdle	%icc,	%f28,	%f2
	movle	%icc,	%l3,	%i4
	edge16	%i7,	%i3,	%i6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%i0
	st	%f9,	[%l7 + 0x74]
	and	%g4,	0x03E0,	%i2
	xor	%o3,	%o5,	%l6
	taddcc	%o2,	%g5,	%i1
	fpack32	%f18,	%f12,	%f30
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g7,	%g1
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l0
	tsubcc	%l4,	0x1FF0,	%o4
	tvs	%icc,	0x2
	sdivcc	%l1,	0x1E57,	%o0
	edge8ln	%o1,	%g6,	%l2
	nop
	setx	0xC0460D1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	st	%f4,	[%l7 + 0x20]
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o6
	call	loop_1406
	nop
	setx	loop_1407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%o7,	0x1D51,	%g3
	fmovsge	%xcc,	%f0,	%f11
loop_1406:
	sll	%i5,	0x0C,	%l3
loop_1407:
	tn	%xcc,	0x1
	edge8ln	%i4,	%i7,	%l5
	membar	0x7D
	taddcctv	%i6,	0x0F27,	%g2
	array16	%i3,	%g4,	%i2
	udivcc	%i0,	0x1E39,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l6,	%o5
	edge16	%g5,	%i1,	%g7
	tcs	%xcc,	0x6
	tcs	%icc,	0x1
	fpsub16	%f12,	%f16,	%f4
	tg	%icc,	0x2
	xorcc	%g1,	0x03EE,	%l0
	tsubcctv	%o2,	%l4,	%l1
	umul	%o0,	0x0FA7,	%o4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%o1
	fbne	%fcc1,	loop_1408
	tsubcctv	%g6,	%l2,	%o6
	bvs,pn	%icc,	loop_1409
	movgu	%icc,	%g3,	%o7
loop_1408:
	array8	%l3,	%i5,	%i7
	fbn	%fcc1,	loop_1410
loop_1409:
	andncc	%l5,	%i6,	%i4
	movle	%xcc,	%i3,	%g2
	subccc	%i2,	%i0,	%o3
loop_1410:
	movvc	%icc,	%l6,	%o5
	srl	%g5,	%g4,	%g7
	umulcc	%g1,	0x1720,	%l0
	fmovdpos	%xcc,	%f29,	%f17
	addcc	%o2,	0x00B6,	%l4
	nop
	setx	0xDCA8B9C9EE1048B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD0BEE6AB78C80F29,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f30,	%f0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	set	0x64, %i2
	lduwa	[%l7 + %i2] 0x88,	%o0
	movvs	%icc,	%o4,	%l1
	wr	%g0,	0x23,	%asi
	stha	%g6,	[%l7 + 0x5E] %asi
	membar	#Sync
	bl	%icc,	loop_1411
	xnor	%o1,	%o6,	%l2
	udivx	%o7,	0x05D6,	%l3
	movcs	%xcc,	%g3,	%i7
loop_1411:
	udivcc	%l5,	0x1221,	%i5
	smul	%i4,	%i6,	%i3
	fbne	%fcc2,	loop_1412
	fmovrdlez	%i2,	%f8,	%f4
	lduh	[%l7 + 0x3C],	%i0
	nop
	setx	loop_1413,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1412:
	fbge,a	%fcc3,	loop_1414
	srax	%g2,	0x01,	%o3
	fmovrdlez	%l6,	%f4,	%f16
loop_1413:
	mulscc	%o5,	0x1787,	%g5
loop_1414:
	movg	%icc,	%g4,	%g1
	and	%g7,	%l0,	%l4
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f22
	fmul8ulx16	%f30,	%f2,	%f14
	fpadd16s	%f16,	%f5,	%f5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x45] %asi,	%i1
	tg	%xcc,	0x5
	nop
	set	0x60, %g5
	sth	%o2,	[%l7 + %g5]
	xnor	%o0,	%l1,	%g6
	fmovrdne	%o1,	%f24,	%f8
	edge32	%o4,	%l2,	%o7
	orncc	%o6,	%l3,	%g3
	sethi	0x040E,	%i7
	faligndata	%f26,	%f12,	%f2
	bvc,a	%xcc,	loop_1415
	fmovrdgez	%i5,	%f4,	%f4
	mova	%xcc,	%l5,	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x19,	%i6,	%i3
loop_1415:
	sra	%i0,	%g2,	%i2
	mulscc	%l6,	0x0C56,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o5,	%g5
	tne	%icc,	0x1
	fxnors	%f10,	%f1,	%f15
	fpadd32s	%f15,	%f30,	%f5
	fmovdle	%xcc,	%f19,	%f30
	fbug	%fcc1,	loop_1416
	movvc	%icc,	%g1,	%g4
	fbuge,a	%fcc2,	loop_1417
	move	%icc,	%g7,	%l0
loop_1416:
	fmovda	%icc,	%f21,	%f10
	or	%i1,	%l4,	%o2
loop_1417:
	tg	%xcc,	0x7
	array16	%o0,	%l1,	%o1
	andcc	%o4,	%l2,	%o7
	movrlz	%g6,	0x282,	%o6
	tvc	%icc,	0x2
	fmovscs	%icc,	%f25,	%f9
	fmovrsne	%g3,	%f10,	%f22
	fmovs	%f25,	%f8
	ldstub	[%l7 + 0x63],	%l3
	brz	%i7,	loop_1418
	tleu	%icc,	0x4
	movgu	%icc,	%i5,	%i4
	movrne	%l5,	%i6,	%i0
loop_1418:
	sllx	%g2,	0x03,	%i3
	bgu,pn	%xcc,	loop_1419
	movcs	%icc,	%l6,	%o3
	tvs	%xcc,	0x3
	tneg	%xcc,	0x5
loop_1419:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f2
	sll	%o5,	0x18,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f12,	%f18,	%f14
	fmovdne	%xcc,	%f25,	%f25
	fcmpne16	%f2,	%f26,	%g1
	udivx	%g4,	0x1DCD,	%i2
	fbuge,a	%fcc3,	loop_1420
	bpos,a	%icc,	loop_1421
	tgu	%xcc,	0x3
	fornot2s	%f6,	%f25,	%f30
loop_1420:
	fornot2	%f22,	%f22,	%f28
loop_1421:
	movcs	%xcc,	%l0,	%g7
	fbug,a	%fcc3,	loop_1422
	smul	%l4,	0x1790,	%o2
	umul	%i1,	%o0,	%l1
	fxnors	%f25,	%f8,	%f20
loop_1422:
	te	%xcc,	0x6
	fmul8ulx16	%f4,	%f26,	%f22
	fmul8x16au	%f17,	%f17,	%f10
	fmovrslz	%o4,	%f1,	%f4
	edge8ln	%l2,	%o7,	%g6
	brgez,a	%o1,	loop_1423
	xnorcc	%o6,	%l3,	%i7
	stbar
	mulscc	%i5,	%g3,	%l5
loop_1423:
	std	%f4,	[%l7 + 0x58]
	popc	%i4,	%i6
	tg	%xcc,	0x6
	stw	%g2,	[%l7 + 0x18]
	fbule,a	%fcc1,	loop_1424
	smul	%i0,	0x1120,	%i3
	fsrc1	%f14,	%f0
	movleu	%icc,	%o3,	%l6
loop_1424:
	fnot2	%f26,	%f26
	tleu	%xcc,	0x0
	tsubcc	%g5,	%o5,	%g4
	movn	%icc,	%i2,	%g1
	subccc	%g7,	0x1631,	%l4
	movcs	%xcc,	%o2,	%i1
	edge32n	%o0,	%l0,	%o4
	brlz	%l2,	loop_1425
	umulcc	%l1,	0x0071,	%o7
	movn	%icc,	%o1,	%o6
	ta	%xcc,	0x7
loop_1425:
	tge	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g6,	0x0628,	%i7
	ldd	[%l7 + 0x20],	%f14
	orn	%i5,	%l3,	%g3
	and	%i4,	%i6,	%g2
	fnor	%f6,	%f10,	%f18
	fblg,a	%fcc1,	loop_1426
	mulx	%i0,	%i3,	%o3
	array8	%l6,	%l5,	%g5
	smul	%g4,	%i2,	%o5
loop_1426:
	movg	%xcc,	%g1,	%l4
	ble,a,pn	%xcc,	loop_1427
	movne	%xcc,	%o2,	%g7
	alignaddr	%i1,	%l0,	%o0
	tl	%xcc,	0x6
loop_1427:
	fmul8x16au	%f3,	%f31,	%f0
	movvs	%xcc,	%o4,	%l2
	nop
	setx loop_1428, %l0, %l1
	jmpl %l1, %o7
	andn	%o1,	%o6,	%g6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i7
loop_1428:
	alignaddrl	%i5,	%l3,	%g3
	addcc	%i4,	0x1FEF,	%l1
	tpos	%xcc,	0x5
	fmovrse	%g2,	%f16,	%f24
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x79] %asi,	%i0
	tvs	%xcc,	0x4
	set	0x2E, %i7
	lduba	[%l7 + %i7] 0x89,	%i6
	edge32l	%i3,	%l6,	%l5
	mulscc	%g5,	%g4,	%i2
	fpadd32	%f0,	%f14,	%f16
	sth	%o5,	[%l7 + 0x72]
	wr	%g0,	0xe2,	%asi
	stha	%g1,	[%l7 + 0x4E] %asi
	membar	#Sync
	subccc	%o3,	0x02C7,	%o2
	addcc	%l4,	%i1,	%g7
	fnegs	%f23,	%f11
	movpos	%xcc,	%o0,	%o4
	movrne	%l0,	%o7,	%o1
	sllx	%o6,	0x03,	%g6
	movcs	%xcc,	%l2,	%i5
	fexpand	%f14,	%f16
	and	%l3,	0x1B69,	%i7
	stx	%i4,	[%l7 + 0x78]
	fnot1	%f6,	%f0
	ldx	[%l7 + 0x28],	%l1
	movleu	%icc,	%g2,	%g3
	andcc	%i6,	0x1F6B,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc3,	loop_1429
	nop
	setx	loop_1430,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%icc,	%i3,	%l5
	tpos	%icc,	0x6
loop_1429:
	fmovd	%f28,	%f2
loop_1430:
	nop
	set	0x50, %o4
	sta	%f14,	[%l7 + %o4] 0x0c
	sdivx	%l6,	0x0F03,	%g5
	sethi	0x1584,	%i2
	sub	%g4,	0x004B,	%g1
	tleu	%xcc,	0x3
	nop
	setx	0x404CA5AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o5
	fbu,a	%fcc2,	loop_1431
	fbl	%fcc1,	loop_1432
	fmovscc	%icc,	%f28,	%f20
	pdist	%f0,	%f26,	%f24
loop_1431:
	andcc	%o2,	%l4,	%o3
loop_1432:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x79] %asi,	%g7
	fmovsgu	%icc,	%f6,	%f1
	movrlz	%i1,	0x122,	%o0
	sra	%l0,	%o7,	%o1
	array16	%o4,	%o6,	%l2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g6,	%l3
	edge8ln	%i5,	%i7,	%i4
	fmovsneg	%icc,	%f3,	%f17
	popc	%g2,	%g3
	te	%icc,	0x6
	andcc	%i6,	0x0F14,	%i0
	orcc	%i3,	0x08C0,	%l1
	fbul	%fcc2,	loop_1433
	brgz	%l5,	loop_1434
	edge32ln	%g5,	%l6,	%i2
	stx	%g1,	[%l7 + 0x18]
loop_1433:
	fbu	%fcc3,	loop_1435
loop_1434:
	edge32n	%o5,	%o2,	%l4
	movrgz	%g4,	%o3,	%i1
	fbul,a	%fcc1,	loop_1436
loop_1435:
	movneg	%xcc,	%g7,	%o0
	andcc	%o7,	%l0,	%o4
	fands	%f15,	%f11,	%f5
loop_1436:
	sethi	0x0C45,	%o1
	ldd	[%l7 + 0x50],	%f24
	fmovde	%icc,	%f17,	%f23
	nop
	setx	0x0F98512712CF1B4B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x9C6CA39B8FA38BA7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f2,	%f30
	taddcctv	%o6,	%g6,	%l3
	orcc	%i5,	%i7,	%l2
	tne	%icc,	0x6
	tleu	%xcc,	0x1
	udiv	%g2,	0x0674,	%i4
	orncc	%i6,	%g3,	%i0
	nop
	setx	loop_1437,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovde	%icc,	%f12,	%f21
	stw	%l1,	[%l7 + 0x44]
	bpos,a	%xcc,	loop_1438
loop_1437:
	fmovsneg	%icc,	%f5,	%f18
	bge,a	loop_1439
	movpos	%icc,	%i3,	%g5
loop_1438:
	fxors	%f22,	%f26,	%f31
	movcc	%xcc,	%l5,	%l6
loop_1439:
	membar	0x4F
	edge32l	%i2,	%g1,	%o2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l4
	srax	%g4,	0x1D,	%o5
	movne	%icc,	%i1,	%g7
	fornot2s	%f3,	%f9,	%f15
	fcmpgt16	%f24,	%f6,	%o3
	fabsd	%f16,	%f28
	udivcc	%o0,	0x19F5,	%l0
	brgz,a	%o4,	loop_1440
	array32	%o1,	%o6,	%o7
	array32	%g6,	%i5,	%i7
	xorcc	%l3,	%g2,	%i4
loop_1440:
	fmovrdne	%i6,	%f18,	%f26
	andcc	%g3,	%l2,	%l1
	smulcc	%i0,	0x0DE6,	%i3
	and	%g5,	0x05B9,	%l5
	te	%xcc,	0x6
	movleu	%xcc,	%i2,	%g1
	smul	%l6,	0x0D26,	%o2
	xnor	%g4,	%o5,	%l4
	sll	%i1,	0x08,	%o3
	nop
	set	0x72, %g1
	stb	%g7,	[%l7 + %g1]
	popc	%o0,	%l0
	mulx	%o1,	%o4,	%o7
	bg,pt	%icc,	loop_1441
	membar	0x26
	tle	%xcc,	0x3
	te	%xcc,	0x5
loop_1441:
	subc	%o6,	0x1636,	%g6
	tne	%icc,	0x5
	fornot2	%f14,	%f20,	%f16
	fmul8sux16	%f12,	%f2,	%f2
	fmovscc	%xcc,	%f1,	%f14
	andncc	%i5,	%i7,	%g2
	movn	%xcc,	%l3,	%i6
	tgu	%xcc,	0x1
	sdivcc	%i4,	0x14AE,	%g3
	srlx	%l2,	%i0,	%l1
	movrgz	%i3,	0x04A,	%l5
	sra	%g5,	0x12,	%g1
	sra	%i2,	0x08,	%o2
	fmovsgu	%icc,	%f31,	%f27
	movre	%l6,	0x2BD,	%o5
	ta	%icc,	0x3
	fblg,a	%fcc2,	loop_1442
	sllx	%l4,	%i1,	%g4
	sllx	%o3,	0x14,	%g7
	xor	%l0,	%o1,	%o4
loop_1442:
	edge16n	%o7,	%o0,	%o6
	movrlez	%g6,	0x3AE,	%i5
	smul	%g2,	%i7,	%l3
	fmovrdgez	%i6,	%f22,	%f20
	udiv	%i4,	0x1202,	%l2
	fornot2s	%f31,	%f3,	%f20
	be,a	%icc,	loop_1443
	edge32l	%i0,	%g3,	%l1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
loop_1443:
	fnot2	%f6,	%f20
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x04,	%f16
	set	0x78, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0x2
	te	%xcc,	0x6
	sub	%i3,	%g1,	%i2
	movleu	%icc,	%o2,	%g5
	srl	%o5,	0x1A,	%l6
	edge32ln	%l4,	%i1,	%g4
	tn	%icc,	0x2
	be,pn	%icc,	loop_1444
	orncc	%g7,	0x10F1,	%o3
	subccc	%l0,	0x1A64,	%o1
	edge32ln	%o7,	%o0,	%o4
loop_1444:
	tsubcc	%g6,	0x1D72,	%o6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x48] %asi,	%i5
	srl	%g2,	%i7,	%l3
	fmovdl	%xcc,	%f30,	%f10
	bvs,a,pn	%xcc,	loop_1445
	tl	%icc,	0x4
	fbue	%fcc2,	loop_1446
	stb	%i4,	[%l7 + 0x68]
loop_1445:
	fmovdn	%xcc,	%f22,	%f31
	fpsub16s	%f6,	%f31,	%f7
loop_1446:
	addcc	%l2,	%i0,	%g3
	ba,a,pn	%xcc,	loop_1447
	bcc,a,pt	%xcc,	loop_1448
	movg	%xcc,	%l1,	%l5
	udivcc	%i3,	0x12E0,	%i6
loop_1447:
	movrlez	%i2,	%g1,	%g5
loop_1448:
	fnot1s	%f30,	%f21
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x10] %asi,	%o2
	tgu	%icc,	0x4
	xor	%l6,	%o5,	%i1
	fxnor	%f30,	%f30,	%f30
	array16	%g4,	%l4,	%o3
	tpos	%xcc,	0x4
	fexpand	%f18,	%f6
	fmovs	%f1,	%f20
	addcc	%l0,	%g7,	%o1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x5C] %asi,	%f5
	addc	%o7,	%o4,	%g6
	movl	%xcc,	%o0,	%i5
	brlez,a	%o6,	loop_1449
	srlx	%i7,	0x02,	%g2
	srl	%l3,	%i4,	%l2
	movgu	%xcc,	%g3,	%i0
loop_1449:
	brlz,a	%l5,	loop_1450
	bvs,a,pt	%xcc,	loop_1451
	movrgz	%i3,	0x0F7,	%i6
	fmovdgu	%icc,	%f12,	%f0
loop_1450:
	popc	0x0162,	%i2
loop_1451:
	nop
	setx	0x4B9EDBD26E6E9A98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f10
	srl	%l1,	%g5,	%o2
	ldd	[%l7 + 0x48],	%f4
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0x2
	bpos,a	%xcc,	loop_1452
	movrgz	%g1,	%o5,	%i1
	be,a,pt	%icc,	loop_1453
	mulx	%g4,	0x1F8B,	%o3
loop_1452:
	fmovdvc	%xcc,	%f8,	%f0
	edge32	%l4,	%l0,	%o1
loop_1453:
	movrlz	%o7,	0x294,	%g7
	array16	%g6,	%o0,	%o4
	movge	%xcc,	%i5,	%i7
	alignaddrl	%o6,	%g2,	%i4
	set	0x4C, %o1
	ldsba	[%l7 + %o1] 0x0c,	%l2
	nop
	setx	0x4E18967C05C4EE5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x91FF61FC16C1EEC6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f8,	%f18
	set	0x62, %l4
	lduba	[%l7 + %l4] 0x0c,	%l3
	subc	%g3,	0x0659,	%i0
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	fcmpgt32	%f2,	%f24,	%i6
	nop
	fitos	%f4,	%f14
	fstoi	%f14,	%f22
	mova	%icc,	%i2,	%l1
	edge8n	%i3,	%o2,	%g5
	tcs	%xcc,	0x1
	movcs	%xcc,	%g1,	%l6
	fpack32	%f14,	%f2,	%f8
	fone	%f20
	bpos,a,pn	%icc,	loop_1454
	fpsub32s	%f29,	%f2,	%f4
	brgz	%o5,	loop_1455
	tsubcc	%g4,	%o3,	%i1
loop_1454:
	movvc	%icc,	%l0,	%l4
	tvc	%xcc,	0x7
loop_1455:
	subc	%o7,	%o1,	%g6
	fbuge,a	%fcc2,	loop_1456
	ldsh	[%l7 + 0x56],	%o0
	fmovrde	%g7,	%f0,	%f6
	fmovdleu	%icc,	%f25,	%f17
loop_1456:
	fbug,a	%fcc3,	loop_1457
	sethi	0x0189,	%o4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x5A] %asi,	%i5
loop_1457:
	smul	%o6,	0x1F5D,	%g2
	tl	%xcc,	0x7
	sdiv	%i7,	0x139A,	%l2
	set	0x7C, %l1
	sta	%f4,	[%l7 + %l1] 0x04
	tpos	%xcc,	0x2
	alignaddr	%i4,	%l3,	%i0
	nop
	setx	0x44290FFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x63857729,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f23,	%f7
	bneg	loop_1458
	addccc	%l5,	%g3,	%i2
	srl	%i6,	%i3,	%o2
	orn	%l1,	%g1,	%l6
loop_1458:
	subcc	%o5,	%g5,	%o3
	fnegd	%f14,	%f14
	subccc	%i1,	%l0,	%g4
	edge32ln	%l4,	%o1,	%o7
	alignaddr	%o0,	%g7,	%o4
	andncc	%g6,	%i5,	%g2
	fand	%f14,	%f28,	%f18
	nop
	setx	0x25514BAFB7F5A256,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB5B6A8BABAF4190A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f16,	%f2
	tvs	%icc,	0x5
	tcs	%xcc,	0x0
	fpsub16	%f10,	%f28,	%f24
	srlx	%i7,	0x12,	%o6
	smulcc	%l2,	%i4,	%i0
	mova	%icc,	%l3,	%g3
	fmovdg	%icc,	%f4,	%f14
	fnor	%f12,	%f2,	%f30
	movn	%icc,	%i2,	%i6
	orncc	%i3,	0x0A7F,	%o2
	bn,pt	%xcc,	loop_1459
	movge	%xcc,	%l1,	%l5
	fbo,a	%fcc2,	loop_1460
	fbu	%fcc2,	loop_1461
loop_1459:
	add	%g1,	%o5,	%l6
	ldub	[%l7 + 0x78],	%g5
loop_1460:
	fba,a	%fcc0,	loop_1462
loop_1461:
	movgu	%xcc,	%i1,	%o3
	smul	%g4,	0x0A10,	%l4
	addc	%o1,	%l0,	%o0
loop_1462:
	fmovrse	%o7,	%f3,	%f22
	nop
	setx	0x025A86BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x370CCC6C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f1,	%f21
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	fmul8ulx16	%f30,	%f2,	%f14
	fpsub32s	%f16,	%f11,	%f19
	bge	%icc,	loop_1463
	fand	%f22,	%f22,	%f30
	udivx	%o4,	0x04E8,	%g6
	alignaddr	%i5,	%g2,	%o6
loop_1463:
	fandnot1s	%f30,	%f9,	%f23
	be,a,pn	%icc,	loop_1464
	andcc	%l2,	0x0D74,	%i4
	mulx	%i7,	0x0FB4,	%i0
	fors	%f26,	%f3,	%f3
loop_1464:
	fmovsneg	%xcc,	%f23,	%f27
	fmovrslez	%g3,	%f15,	%f30
	fmovrdgz	%i2,	%f12,	%f22
	tvc	%xcc,	0x0
	udivx	%l3,	0x15F9,	%i3
	fmovrse	%o2,	%f5,	%f16
	nop
	fitod	%f22,	%f20
	umul	%i6,	%l5,	%g1
	movrlz	%l1,	%l6,	%g5
	srax	%i1,	0x11,	%o3
	fnot1s	%f10,	%f22
	fmul8ulx16	%f26,	%f30,	%f16
	orcc	%o5,	0x08E3,	%g4
	brlez,a	%l4,	loop_1465
	fmovrse	%o1,	%f14,	%f13
	nop
	set	0x4C, %o5
	sth	%l0,	[%l7 + %o5]
	xnorcc	%o0,	%g7,	%o7
loop_1465:
	srlx	%g6,	0x0C,	%o4
	stb	%g2,	[%l7 + 0x0F]
	movrgz	%i5,	%o6,	%l2
	orn	%i7,	%i4,	%g3
	tgu	%icc,	0x7
	andncc	%i0,	%i2,	%l3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%i3
	movrlez	%o2,	0x251,	%l5
	sir	0x0B5A
	andn	%g1,	%i6,	%l1
	std	%f30,	[%l7 + 0x78]
	movleu	%xcc,	%g5,	%i1
	edge8n	%l6,	%o5,	%g4
	tg	%xcc,	0x7
	set	0x24, %o7
	lda	[%l7 + %o7] 0x19,	%f11
	move	%icc,	%o3,	%l4
	set	0x78, %g6
	stwa	%l0,	[%l7 + %g6] 0x89
	xnorcc	%o1,	0x1247,	%o0
	fands	%f4,	%f18,	%f24
	tsubcc	%g7,	%o7,	%g6
	ble	%xcc,	loop_1466
	movn	%xcc,	%o4,	%i5
	for	%f26,	%f6,	%f20
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%l2
loop_1466:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x54] %asi,	%g2
	tvs	%icc,	0x2
	fnot1	%f30,	%f14
	array32	%i7,	%i4,	%g3
	ldub	[%l7 + 0x0C],	%i2
	set	0x5F, %i6
	ldsba	[%l7 + %i6] 0x14,	%l3
	movre	%i3,	%i0,	%o2
	fba,a	%fcc3,	loop_1467
	ta	%xcc,	0x7
	fpmerge	%f12,	%f10,	%f14
	tvc	%xcc,	0x1
loop_1467:
	fmovde	%icc,	%f22,	%f13
	smul	%g1,	%l5,	%i6
	movre	%l1,	0x095,	%g5
	nop
	setx	0xCE533FBAC42B2A9F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f10
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f24
	fxtod	%f24,	%f18
	set	0x6C, %o3
	stba	%l6,	[%l7 + %o3] 0x2b
	membar	#Sync
	subc	%i1,	%o5,	%o3
	fmovse	%xcc,	%f16,	%f3
	popc	%g4,	%l4
	addcc	%o1,	%l0,	%g7
	fmovdneg	%icc,	%f26,	%f2
	brz,a	%o7,	loop_1468
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x54, %g2
	stha	%o0,	[%l7 + %g2] 0x2a
	membar	#Sync
loop_1468:
	sir	0x0A94
	udivx	%o4,	0x0B68,	%g6
	fnors	%f17,	%f12,	%f17
	sra	%o6,	0x1A,	%l2
	mulx	%i5,	%i7,	%i4
	fpack32	%f14,	%f24,	%f22
	fmovdle	%xcc,	%f15,	%f29
	brgz,a	%g2,	loop_1469
	te	%icc,	0x4
	fornot1	%f20,	%f12,	%f4
	tvc	%xcc,	0x6
loop_1469:
	taddcc	%i2,	%g3,	%l3
	brlez	%i3,	loop_1470
	ta	%icc,	0x2
	fmovdcc	%xcc,	%f7,	%f29
	mulscc	%o2,	%g1,	%l5
loop_1470:
	movcs	%xcc,	%i0,	%l1
	wr	%g0,	0x10,	%asi
	stha	%i6,	[%l7 + 0x16] %asi
	xorcc	%g5,	%l6,	%i1
	edge8l	%o5,	%o3,	%g4
	bge,pt	%xcc,	loop_1471
	udivcc	%l4,	0x1DF0,	%l0
	andcc	%o1,	%g7,	%o7
	ldsw	[%l7 + 0x24],	%o4
loop_1471:
	taddcc	%g6,	%o0,	%l2
	tpos	%xcc,	0x4
	fpmerge	%f26,	%f1,	%f26
	udiv	%i5,	0x01DD,	%o6
	brgz,a	%i7,	loop_1472
	subc	%i4,	%i2,	%g3
	fbul	%fcc1,	loop_1473
	udivx	%l3,	0x184F,	%i3
loop_1472:
	tvc	%xcc,	0x5
	addc	%g2,	0x06E0,	%g1
loop_1473:
	nop
	set	0x20, %o0
	swapa	[%l7 + %o0] 0x18,	%l5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x04,	%o2,	%i0
	edge8	%i6,	%l1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez,a	%g5,	loop_1474
	udivcc	%o5,	0x0FB5,	%o3
	fmovrsgz	%i1,	%f7,	%f11
	brnz,a	%l4,	loop_1475
loop_1474:
	edge16l	%g4,	%o1,	%l0
	smul	%g7,	0x00A6,	%o7
	array32	%g6,	%o0,	%l2
loop_1475:
	brgez,a	%i5,	loop_1476
	fmovse	%xcc,	%f30,	%f27
	fbo,a	%fcc2,	loop_1477
	andncc	%o4,	%i7,	%i4
loop_1476:
	fmovda	%xcc,	%f29,	%f5
	mulscc	%i2,	%o6,	%g3
loop_1477:
	fpsub16	%f20,	%f24,	%f28
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f16
	fxtod	%f16,	%f22
	fble	%fcc1,	loop_1478
	taddcctv	%i3,	%g2,	%l3
	fmovscs	%icc,	%f11,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1478:
	movrlez	%l5,	%g1,	%i0
	fandnot2s	%f26,	%f30,	%f11
	tgu	%icc,	0x4
	ldsh	[%l7 + 0x5A],	%o2
	fnegs	%f28,	%f8
	ble,pn	%xcc,	loop_1479
	ldsw	[%l7 + 0x5C],	%l1
	taddcc	%l6,	0x1A99,	%g5
	array32	%i6,	%o3,	%i1
loop_1479:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x2
	fbne	%fcc3,	loop_1480
	fandnot2	%f26,	%f26,	%f20
	movle	%xcc,	%l4,	%o5
	set	0x74, %i0
	ldswa	[%l7 + %i0] 0x88,	%o1
loop_1480:
	tsubcctv	%l0,	0x1E1A,	%g4
	fmovsa	%xcc,	%f9,	%f31
	fmovrdlez	%o7,	%f6,	%f30
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f15
	nop
	fitos	%f13,	%f31
	fstod	%f31,	%f26
	fandnot1	%f26,	%f10,	%f18
	movrlez	%g7,	%o0,	%l2
	swap	[%l7 + 0x2C],	%i5
	fornot1	%f20,	%f18,	%f10
	fmuld8ulx16	%f18,	%f25,	%f24
	xor	%g6,	%i7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o4,	%o6
	movpos	%xcc,	%g3,	%i3
	st	%f23,	[%l7 + 0x14]
	array32	%i2,	%g2,	%l3
	nop
	setx	0x3798072906B691EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x47FBD5950868FC4B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f4,	%f24
	fble	%fcc0,	loop_1481
	fmovrdgez	%g1,	%f30,	%f14
	sll	%l5,	%i0,	%o2
	sdiv	%l6,	0x1219,	%g5
loop_1481:
	sra	%l1,	%i6,	%i1
	sir	0x1316
	fmovsn	%icc,	%f9,	%f25
	fmovscc	%icc,	%f25,	%f8
	tcs	%icc,	0x6
	addcc	%l4,	%o5,	%o1
	addccc	%o3,	0x0422,	%g4
	nop
	set	0x1B, %l5
	ldstub	[%l7 + %l5],	%o7
	subcc	%g7,	%o0,	%l2
	ldstub	[%l7 + 0x53],	%i5
	fbule,a	%fcc2,	loop_1482
	brlez,a	%l0,	loop_1483
	sir	0x10C9
	fxor	%f22,	%f18,	%f28
loop_1482:
	sra	%i7,	0x1D,	%i4
loop_1483:
	brgez	%o4,	loop_1484
	nop
	setx	0xC2129B5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xE7BE9095,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f5,	%f21
	fnegd	%f18,	%f26
	sdivcc	%g6,	0x0FE4,	%g3
loop_1484:
	sdivx	%o6,	0x1EC8,	%i2
	tl	%icc,	0x3
	fnot1	%f14,	%f18
	fbu,a	%fcc0,	loop_1485
	array32	%i3,	%g2,	%g1
	tg	%icc,	0x2
	set	0x28, %l6
	ldxa	[%l7 + %l6] 0x0c,	%l3
loop_1485:
	tg	%icc,	0x2
	fbl	%fcc2,	loop_1486
	movre	%l5,	%o2,	%i0
	fmovrde	%g5,	%f14,	%f8
	movg	%icc,	%l1,	%i6
loop_1486:
	fpadd16	%f8,	%f0,	%f0
	orn	%i1,	0x12E7,	%l4
	tneg	%xcc,	0x3
	movne	%icc,	%o5,	%o1
	fmovdg	%icc,	%f30,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o3,	%g4
	add	%l6,	0x1E5A,	%o7
	bl,pn	%xcc,	loop_1487
	movrgez	%o0,	%l2,	%g7
	taddcc	%i5,	0x1EF1,	%l0
	set	0x68, %i4
	prefetcha	[%l7 + %i4] 0x10,	 0x3
loop_1487:
	fabss	%f20,	%f19
	tsubcctv	%o4,	0x175D,	%i4
	brlz,a	%g3,	loop_1488
	stb	%o6,	[%l7 + 0x23]
	movvc	%xcc,	%g6,	%i2
	nop
	set	0x47, %o6
	ldstub	[%l7 + %o6],	%i3
loop_1488:
	tvc	%xcc,	0x6
	fnor	%f30,	%f22,	%f10
	fbug,a	%fcc0,	loop_1489
	fmovrse	%g2,	%f24,	%f1
	movcc	%xcc,	%g1,	%l5
	orn	%l3,	0x18BD,	%o2
loop_1489:
	fsrc2	%f12,	%f12
	fnot2	%f8,	%f12
	array16	%g5,	%i0,	%l1
	fbe,a	%fcc1,	loop_1490
	be,a	loop_1491
	movvs	%icc,	%i6,	%i1
	tl	%icc,	0x1
loop_1490:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
loop_1491:
	tneg	%xcc,	0x6
	ldub	[%l7 + 0x4E],	%o1
	fnot1s	%f16,	%f2
	lduh	[%l7 + 0x6E],	%o5
	nop
	set	0x2C, %i1
	prefetch	[%l7 + %i1],	 0x2
	sdivx	%o3,	0x0FEB,	%g4
	set	0x60, %g4
	swapa	[%l7 + %g4] 0x81,	%o7
	bvc,a	loop_1492
	tle	%icc,	0x4
	tcc	%xcc,	0x7
	fands	%f26,	%f3,	%f20
loop_1492:
	bge,a,pt	%icc,	loop_1493
	sir	0x122C
	fmovdgu	%xcc,	%f5,	%f18
	edge16n	%o0,	%l2,	%l6
loop_1493:
	addc	%g7,	0x00E5,	%i5
	movle	%icc,	%i7,	%o4
	movvc	%icc,	%l0,	%g3
	fmovdpos	%xcc,	%f31,	%f19
	fsrc1s	%f11,	%f28
	movrlz	%o6,	%g6,	%i2
	edge16n	%i4,	%g2,	%g1
	smulcc	%i3,	0x047A,	%l5
	xnor	%o2,	%g5,	%i0
	movgu	%icc,	%l1,	%l3
	fmovrdlez	%i1,	%f14,	%f22
	edge8n	%i6,	%l4,	%o1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x18,	%o5,	%o3
	nop
	setx	0x6E5238CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f0
	subcc	%g4,	0x0020,	%o0
	edge16n	%o7,	%l6,	%l2
	taddcctv	%g7,	%i5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1494,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdg	%icc,	%f10,	%f24
	srax	%l0,	0x10,	%o4
	sub	%g3,	0x1EA2,	%g6
loop_1494:
	bge,a,pt	%icc,	loop_1495
	orcc	%i2,	0x0B6E,	%o6
	fmul8ulx16	%f28,	%f0,	%f20
	fmuld8sux16	%f22,	%f26,	%f4
loop_1495:
	movrgez	%i4,	0x3B3,	%g2
	movre	%g1,	%l5,	%o2
	movgu	%xcc,	%g5,	%i0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%i3
	nop
	fitod	%f16,	%f10
	lduw	[%l7 + 0x34],	%l3
	tgu	%xcc,	0x6
	sth	%i1,	[%l7 + 0x0E]
	add	%l1,	0x0C09,	%l4
	ba,a,pn	%xcc,	loop_1496
	smulcc	%i6,	0x0253,	%o5
	tneg	%xcc,	0x6
	st	%f26,	[%l7 + 0x50]
loop_1496:
	ldub	[%l7 + 0x5C],	%o1
	sllx	%o3,	0x07,	%o0
	brgz	%o7,	loop_1497
	fmuld8sux16	%f6,	%f15,	%f26
	ldsb	[%l7 + 0x5C],	%g4
	tn	%xcc,	0x3
loop_1497:
	st	%f10,	[%l7 + 0x44]
	fnor	%f12,	%f14,	%f24
	movrlez	%l2,	0x002,	%g7
	edge32n	%i5,	%l6,	%i7
	set	0x08, %l3
	stxa	%o4,	[%l7 + %l3] 0x15
	alignaddr	%g3,	%l0,	%i2
	xnor	%o6,	%g6,	%i4
	fand	%f14,	%f2,	%f16
	nop
	setx	0x8CC3A9E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xF95471D0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f7,	%f4
	add	%g2,	0x0B2B,	%l5
	fnand	%f22,	%f22,	%f30
	movrgez	%g1,	0x2A1,	%o2
	fmovrsgz	%i0,	%f17,	%f31
	bgu,a	loop_1498
	bg,pt	%xcc,	loop_1499
	edge16n	%i3,	%l3,	%g5
	call	loop_1500
loop_1498:
	movge	%icc,	%i1,	%l4
loop_1499:
	subc	%l1,	%o5,	%i6
	tneg	%icc,	0x7
loop_1500:
	andn	%o1,	%o3,	%o0
	fmovrdlez	%o7,	%f6,	%f14
	fcmpeq32	%f2,	%f4,	%l2
	umulcc	%g7,	%i5,	%g4
	and	%l6,	%o4,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l0,	%i2,	%o6
	nop
	setx	0xAE6238AB614545FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xF241C0DA2D9A5229,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f6,	%f28
	edge8ln	%g3,	%g6,	%i4
	std	%f6,	[%l7 + 0x78]
	nop
	setx	loop_1501,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%g2,	%l5,	%o2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%i0
loop_1501:
	fbn,a	%fcc1,	loop_1502
	umulcc	%g1,	%i3,	%l3
	bcc,a,pt	%icc,	loop_1503
	or	%g5,	0x1960,	%l4
loop_1502:
	nop
	set	0x4C, %i5
	lduwa	[%l7 + %i5] 0x0c,	%l1
loop_1503:
	ldsw	[%l7 + 0x54],	%o5
	movrgez	%i1,	%i6,	%o3
	movrlez	%o0,	%o7,	%l2
	bcs,a	%icc,	loop_1504
	addccc	%g7,	%i5,	%o1
	nop
	setx	0xD05362AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fmovrse	%g4,	%f2,	%f2
loop_1504:
	ldx	[%l7 + 0x40],	%l6
	taddcc	%o4,	0x085E,	%l0
	move	%icc,	%i7,	%i2
	bpos,a,pn	%xcc,	loop_1505
	sir	0x032F
	swap	[%l7 + 0x08],	%g3
	udivx	%g6,	0x1E2B,	%o6
loop_1505:
	taddcc	%g2,	%l5,	%o2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x24] %asi,	%i0
	tle	%xcc,	0x2
	edge16l	%i4,	%i3,	%g1
	tleu	%xcc,	0x7
	set	0x7C, %g7
	ldsba	[%l7 + %g7] 0x88,	%g5
	nop
	setx	0x30531C15,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	tg	%xcc,	0x1
	fbule	%fcc0,	loop_1506
	smulcc	%l3,	0x0D42,	%l4
	andncc	%o5,	%l1,	%i1
	smul	%o3,	%i6,	%o0
loop_1506:
	nop
	fitos	%f9,	%f29
	fstox	%f29,	%f10
	fxtos	%f10,	%f24
	fpadd32s	%f3,	%f9,	%f14
	orcc	%l2,	0x11B0,	%g7
	edge32	%o7,	%o1,	%i5
	mulx	%g4,	0x1A82,	%o4
	fmovs	%f28,	%f24
	sdiv	%l6,	0x17CA,	%l0
	fmovsn	%xcc,	%f8,	%f15
	stbar
	bg	%xcc,	loop_1507
	edge8	%i7,	%i2,	%g3
	tgu	%xcc,	0x0
	sethi	0x150D,	%g6
loop_1507:
	add	%o6,	%g2,	%l5
	fxors	%f28,	%f6,	%f8
	movneg	%xcc,	%i0,	%o2
	sir	0x10DF
	or	%i4,	0x1F47,	%i3
	sethi	0x0296,	%g1
	movge	%xcc,	%g5,	%l3
	fpsub32s	%f20,	%f30,	%f31
	movre	%l4,	%l1,	%i1
	srl	%o3,	0x05,	%o5
	ld	[%l7 + 0x68],	%f22
	tvc	%xcc,	0x3
	fbuge	%fcc2,	loop_1508
	tsubcc	%o0,	0x0AE7,	%i6
	edge16l	%g7,	%o7,	%l2
	mulscc	%i5,	0x0DA7,	%o1
loop_1508:
	edge8	%g4,	%l6,	%o4
	edge8	%i7,	%i2,	%g3
	tvc	%xcc,	0x0
	fors	%f23,	%f5,	%f29
	fpadd32s	%f17,	%f26,	%f11
	be,a,pn	%xcc,	loop_1509
	mulscc	%g6,	%o6,	%l0
	sllx	%g2,	%l5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1509:
	xnorcc	%i4,	0x1903,	%i3
	movrgez	%g1,	%i0,	%g5
	edge32l	%l3,	%l1,	%l4
	ldsw	[%l7 + 0x64],	%o3
	umul	%o5,	0x13EF,	%i1
	fsrc2	%f28,	%f8
	smul	%o0,	0x0DA3,	%g7
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bvc,a,pn	%xcc,	loop_1510
	ldd	[%l7 + 0x58],	%f26
	sub	%o7,	%l2,	%i5
	tpos	%xcc,	0x3
loop_1510:
	fmovrde	%o1,	%f0,	%f24
	stw	%g4,	[%l7 + 0x54]
	fmovsvs	%icc,	%f13,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xAB695144F0533E59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	tne	%icc,	0x6
	movrne	%l6,	%o4,	%i7
	tge	%icc,	0x4
	andn	%i6,	0x0270,	%i2
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%g3
	movrgez	%g6,	0x0D8,	%l0
	sdivx	%o6,	0x0CB5,	%l5
	srax	%g2,	0x13,	%i4
	movl	%icc,	%o2,	%i3
	popc	%i0,	%g1
	set	0x08, %g5
	stxa	%l3,	[%l7 + %g5] 0x2b
	membar	#Sync
	ldstub	[%l7 + 0x13],	%l1
	tge	%icc,	0x6
	fmovrslz	%g5,	%f24,	%f21
	fandnot1s	%f2,	%f23,	%f15
	te	%xcc,	0x6
	and	%l4,	0x030A,	%o5
	andcc	%o3,	0x061D,	%i1
	set	0x10, %g3
	stxa	%g7,	[%l7 + %g3] 0x22
	membar	#Sync
	addcc	%o0,	0x1811,	%l2
	movrlez	%o7,	%i5,	%g4
	ld	[%l7 + 0x20],	%f6
	bge,a	loop_1511
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	0x0EC7,	%l6
	fmovdge	%xcc,	%f31,	%f8
loop_1511:
	movpos	%xcc,	%o4,	%i6
	nop
	setx	0x7C13FB14E066D581,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	movpos	%icc,	%i7,	%i2
	popc	%g3,	%l0
	ldub	[%l7 + 0x6E],	%o6
	bne,pn	%icc,	loop_1512
	nop
	setx	0x77C514314B2660E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x83A323C482032011,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f12,	%f4
	movge	%xcc,	%g6,	%g2
	alignaddrl	%i4,	%o2,	%l5
loop_1512:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%i3
	tgu	%xcc,	0x2
	fbl	%fcc0,	loop_1513
	andn	%i0,	%l3,	%g1
	xor	%g5,	%l1,	%o5
	andn	%o3,	0x0DFB,	%i1
loop_1513:
	edge16ln	%g7,	%o0,	%l4
	fpadd16	%f28,	%f26,	%f6
	tvc	%icc,	0x1
	fmovrse	%o7,	%f28,	%f4
	fble	%fcc3,	loop_1514
	movge	%xcc,	%l2,	%i5
	edge32l	%o1,	%g4,	%o4
	be,a	loop_1515
loop_1514:
	fandnot2	%f10,	%f14,	%f2
	movre	%l6,	%i7,	%i6
	fmovrdgz	%i2,	%f22,	%f12
loop_1515:
	tpos	%icc,	0x1
	movneg	%xcc,	%g3,	%o6
	fbg,a	%fcc0,	loop_1516
	fnand	%f2,	%f0,	%f18
	fmul8ulx16	%f8,	%f20,	%f30
	srax	%l0,	%g2,	%i4
loop_1516:
	edge8n	%o2,	%l5,	%g6
	fblg	%fcc1,	loop_1517
	fmovdcs	%xcc,	%f29,	%f6
	udivcc	%i3,	0x1C9B,	%l3
	taddcctv	%i0,	%g1,	%g5
loop_1517:
	fsrc1	%f2,	%f22
	st	%f28,	[%l7 + 0x18]
	xnor	%l1,	%o5,	%o3
	ldd	[%l7 + 0x58],	%f2
	movrgez	%i1,	0x2E3,	%o0
	fmovrdlez	%l4,	%f8,	%f28
	movrlz	%g7,	%l2,	%i5
	fbule,a	%fcc3,	loop_1518
	tvc	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o7
loop_1518:
	nop
	setx	loop_1519,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%o1,	0x16C5,	%o4
	edge16	%l6,	%i7,	%g4
	edge16	%i2,	%i6,	%g3
loop_1519:
	fandnot1s	%f10,	%f15,	%f14
	movgu	%xcc,	%l0,	%g2
	fnegs	%f28,	%f26
	fbe,a	%fcc0,	loop_1520
	ble	%xcc,	loop_1521
	fxors	%f11,	%f23,	%f17
	ldd	[%l7 + 0x78],	%i4
loop_1520:
	smulcc	%o6,	0x0A32,	%l5
loop_1521:
	addcc	%g6,	0x17C9,	%i3
	umul	%o2,	%i0,	%l3
	udivx	%g5,	0x0263,	%g1
	sllx	%o5,	%o3,	%l1
	bcs,pt	%xcc,	loop_1522
	xnor	%o0,	0x0118,	%l4
	xor	%g7,	0x033F,	%i1
	orn	%i5,	0x03BE,	%l2
loop_1522:
	membar	0x00
	te	%xcc,	0x7
	pdist	%f24,	%f18,	%f4
	andncc	%o7,	%o1,	%l6
	movgu	%xcc,	%o4,	%g4
	fbule	%fcc1,	loop_1523
	fbn,a	%fcc3,	loop_1524
	st	%f12,	[%l7 + 0x34]
	sra	%i7,	0x0A,	%i6
loop_1523:
	fmovrdgez	%g3,	%f18,	%f10
loop_1524:
	edge8	%i2,	%l0,	%i4
	bpos	loop_1525
	movn	%xcc,	%g2,	%o6
	for	%f2,	%f8,	%f26
	movgu	%xcc,	%g6,	%i3
loop_1525:
	edge32l	%o2,	%i0,	%l3
	brlz	%g5,	loop_1526
	edge16ln	%l5,	%g1,	%o3
	edge32l	%l1,	%o0,	%o5
	bne,pn	%icc,	loop_1527
loop_1526:
	ldx	[%l7 + 0x28],	%g7
	set	0x60, %o4
	lduha	[%l7 + %o4] 0x18,	%l4
loop_1527:
	movl	%xcc,	%i5,	%l2
	edge8	%i1,	%o7,	%o1
	orn	%l6,	%o4,	%g4
	set	0x0D, %g1
	stba	%i6,	[%l7 + %g1] 0x2a
	membar	#Sync
	bne	%xcc,	loop_1528
	alignaddrl	%i7,	%i2,	%l0
	fmovsleu	%xcc,	%f3,	%f6
	andcc	%i4,	%g3,	%o6
loop_1528:
	edge8ln	%g6,	%g2,	%i3
	movrlez	%o2,	%i0,	%g5
	bcc,a,pt	%icc,	loop_1529
	sllx	%l3,	%l5,	%g1
	ld	[%l7 + 0x28],	%f6
	tle	%icc,	0x4
loop_1529:
	tn	%xcc,	0x7
	ta	%xcc,	0x6
	brlez	%l1,	loop_1530
	or	%o0,	0x0E00,	%o5
	tsubcctv	%o3,	%l4,	%g7
	fxnor	%f20,	%f18,	%f14
loop_1530:
	srax	%l2,	0x0D,	%i1
	tg	%xcc,	0x1
	fxor	%f4,	%f24,	%f8
	array32	%o7,	%i5,	%o1
	set	0x54, %l0
	lda	[%l7 + %l0] 0x19,	%f18
	udivx	%o4,	0x1837,	%g4
	wr	%g0,	0x88,	%asi
	stba	%l6,	[%l7 + 0x5B] %asi
	subcc	%i7,	%i2,	%i6
	mulscc	%i4,	%l0,	%g3
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o6
	edge8l	%g6,	%i3,	%g2
	movrlz	%o2,	0x08D,	%i0
	alignaddrl	%g5,	%l5,	%g1
	st	%f3,	[%l7 + 0x74]
	array8	%l3,	%o0,	%o5
	movl	%xcc,	%o3,	%l4
	call	loop_1531
	mulscc	%l1,	0x08FB,	%g7
	orcc	%i1,	0x1D86,	%o7
	fmul8sux16	%f6,	%f28,	%f20
loop_1531:
	fmovs	%f3,	%f30
	sub	%i5,	%l2,	%o1
	fsrc2s	%f31,	%f8
	brlz	%o4,	loop_1532
	ldsb	[%l7 + 0x4A],	%l6
	fornot2	%f22,	%f24,	%f12
	fmuld8sux16	%f2,	%f29,	%f16
loop_1532:
	sdivx	%i7,	0x04CA,	%i2
	bvc,a,pn	%xcc,	loop_1533
	fornot1	%f6,	%f10,	%f18
	fmul8x16	%f7,	%f24,	%f8
	umulcc	%i6,	0x06AB,	%g4
loop_1533:
	movcc	%icc,	%l0,	%g3
	tvc	%icc,	0x3
	or	%o6,	%i4,	%i3
	sllx	%g6,	0x01,	%g2
	subcc	%o2,	0x0104,	%i0
	brlz,a	%g5,	loop_1534
	movre	%l5,	%l3,	%g1
	movrlz	%o0,	%o5,	%l4
	tpos	%icc,	0x1
loop_1534:
	fsrc1s	%f2,	%f12
	sdiv	%l1,	0x1CFD,	%g7
	tg	%xcc,	0x1
	prefetch	[%l7 + 0x68],	 0x0
	movvs	%xcc,	%i1,	%o3
	mulscc	%o7,	%i5,	%o1
	taddcctv	%l2,	0x18AC,	%l6
	array16	%o4,	%i2,	%i7
	bvs	%xcc,	loop_1535
	edge32ln	%i6,	%l0,	%g3
	popc	%g4,	%i4
	fbule	%fcc0,	loop_1536
loop_1535:
	tsubcc	%o6,	%g6,	%g2
	movgu	%xcc,	%i3,	%o2
	tcs	%icc,	0x0
loop_1536:
	nop
	setx	0xE673FF509A122036,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f24
	andn	%g5,	%i0,	%l5
	tgu	%xcc,	0x6
	subcc	%g1,	0x0C13,	%o0
	movrgez	%l3,	0x26F,	%l4
	fpsub16	%f14,	%f24,	%f16
	fmovrse	%o5,	%f25,	%f9
	alignaddr	%g7,	%l1,	%o3
	movg	%icc,	%o7,	%i1
	movrlz	%o1,	0x2EE,	%i5
	tg	%xcc,	0x2
	membar	0x60
	move	%icc,	%l2,	%l6
	tvc	%icc,	0x4
	fornot2s	%f19,	%f11,	%f17
	fsrc1	%f30,	%f10
	fmovsneg	%xcc,	%f7,	%f3
	or	%i2,	0x1B61,	%i7
	membar	0x1D
	nop
	setx	0x683B3B05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x45B26034,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f13,	%f5
	fmovsvs	%xcc,	%f31,	%f29
	sdiv	%i6,	0x18A4,	%o4
	mulscc	%l0,	0x08CC,	%g3
	nop
	setx	0xE1BBD1D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x5241CEC3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f28,	%f12
	fbue,a	%fcc3,	loop_1537
	fmovdge	%icc,	%f9,	%f10
	fcmpeq16	%f0,	%f4,	%g4
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1537:
	array8	%i4,	%g6,	%g2
	set	0x30, %i7
	ldsha	[%l7 + %i7] 0x89,	%i3
	std	%f24,	[%l7 + 0x58]
	tvc	%xcc,	0x2
	movneg	%icc,	%o2,	%o6
	std	%f10,	[%l7 + 0x20]
	bcc,a	loop_1538
	nop
	setx	0xF07FBDE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tpos	%xcc,	0x1
	bpos,a	%icc,	loop_1539
loop_1538:
	swap	[%l7 + 0x14],	%i0
	ta	%icc,	0x0
	sll	%g5,	0x19,	%l5
loop_1539:
	sra	%g1,	0x05,	%l3
	fnor	%f4,	%f28,	%f18
	srlx	%o0,	%o5,	%l4
	fabss	%f25,	%f17
	movg	%icc,	%l1,	%o3
	edge8	%g7,	%i1,	%o1
	movne	%xcc,	%o7,	%l2
	tg	%icc,	0x0
	movcs	%xcc,	%l6,	%i5
	bge,a	loop_1540
	edge8	%i7,	%i2,	%i6
	tneg	%xcc,	0x3
	subccc	%o4,	0x16D4,	%g3
loop_1540:
	fpsub16	%f18,	%f18,	%f16
	tneg	%icc,	0x4
	tsubcc	%g4,	0x147F,	%i4
	fxnors	%f3,	%f6,	%f30
	fblg	%fcc1,	loop_1541
	brlz,a	%l0,	loop_1542
	fbul	%fcc0,	loop_1543
	array32	%g6,	%g2,	%o2
loop_1541:
	array32	%o6,	%i3,	%i0
loop_1542:
	array16	%l5,	%g1,	%g5
loop_1543:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o0
	bvs,a,pn	%xcc,	loop_1544
	edge16	%o5,	%l3,	%l1
	xor	%l4,	0x1E6E,	%g7
	fbug	%fcc3,	loop_1545
loop_1544:
	array8	%o3,	%o1,	%i1
	edge8l	%l2,	%o7,	%l6
	fbule,a	%fcc2,	loop_1546
loop_1545:
	fmuld8ulx16	%f29,	%f14,	%f2
	fmovrslez	%i5,	%f5,	%f25
	nop
	fitod	%f2,	%f28
	fdtox	%f28,	%f28
loop_1546:
	fcmpne16	%f26,	%f30,	%i7
	tle	%icc,	0x3
	fbuge,a	%fcc3,	loop_1547
	fbue,a	%fcc3,	loop_1548
	xor	%i2,	%o4,	%g3
	umulcc	%g4,	%i6,	%i4
loop_1547:
	fmovdcc	%icc,	%f25,	%f10
loop_1548:
	sub	%l0,	0x19F9,	%g6
	edge8ln	%g2,	%o2,	%o6
	fands	%f9,	%f25,	%f29
	fmovsneg	%xcc,	%f12,	%f11
	ldsb	[%l7 + 0x4F],	%i3
	fmovsvs	%xcc,	%f25,	%f1
	taddcc	%l5,	%i0,	%g5
	bl,a,pt	%icc,	loop_1549
	tle	%xcc,	0x7
	tcc	%xcc,	0x1
	or	%o0,	0x1FC9,	%g1
loop_1549:
	mulscc	%l3,	%o5,	%l4
	bpos,pt	%xcc,	loop_1550
	taddcc	%l1,	%g7,	%o3
	mova	%xcc,	%i1,	%o1
	brgez	%o7,	loop_1551
loop_1550:
	tvc	%icc,	0x6
	fmovdcs	%xcc,	%f17,	%f21
	lduw	[%l7 + 0x6C],	%l6
loop_1551:
	array32	%l2,	%i7,	%i2
	movrlz	%o4,	%i5,	%g4
	smulcc	%i6,	%g3,	%l0
	bg,a	loop_1552
	tleu	%xcc,	0x1
	nop
	fitos	%f11,	%f14
	fstox	%f14,	%f12
	fmovrsgez	%g6,	%f25,	%f1
loop_1552:
	movre	%i4,	0x2BE,	%o2
	udivx	%g2,	0x0CEC,	%i3
	andcc	%o6,	0x12E2,	%i0
	udiv	%g5,	0x0D9E,	%l5
	orn	%o0,	%l3,	%g1
	bne,a	loop_1553
	smul	%o5,	%l1,	%l4
	sethi	0x1DB4,	%o3
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f30
	fxtod	%f30,	%f22
loop_1553:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x12] %asi,	%i1
	sll	%g7,	%o7,	%l6
	fornot1	%f0,	%f18,	%f14
	edge16l	%l2,	%i7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f26,	[%l7 + 0x30]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o4,	0x1864,	%i2
	srl	%g4,	0x06,	%i5
	set	0x26, %i3
	lduha	[%l7 + %i3] 0x88,	%i6
	movgu	%icc,	%g3,	%l0
	edge32n	%i4,	%g6,	%g2
	tge	%icc,	0x6
	movrgez	%o2,	0x340,	%o6
	edge8	%i3,	%i0,	%g5
	tgu	%icc,	0x2
	stw	%l5,	[%l7 + 0x2C]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o0,	%l3
	tpos	%icc,	0x6
	alignaddr	%g1,	%l1,	%o5
	orn	%l4,	0x0D94,	%i1
	fpmerge	%f1,	%f15,	%f26
	fmovse	%icc,	%f21,	%f9
	nop
	setx	0x6AC9D2DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xBE86C8D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f31,	%f28
	fmovdpos	%icc,	%f5,	%f1
	xnorcc	%o3,	%g7,	%o7
	stbar
	te	%icc,	0x4
	andncc	%l2,	%i7,	%o1
	alignaddrl	%l6,	%o4,	%i2
	nop
	fitos	%f0,	%f25
	fstod	%f25,	%f4
	fmovsa	%icc,	%f2,	%f9
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%g4
	or	%i6,	%i5,	%g3
	bne,a	%xcc,	loop_1554
	move	%icc,	%l0,	%g6
	tvc	%icc,	0x1
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x54] %asi,	%g2
loop_1554:
	fbn,a	%fcc3,	loop_1555
	fmovdne	%xcc,	%f26,	%f3
	tcs	%icc,	0x7
	nop
	fitos	%f14,	%f3
	fstod	%f3,	%f2
loop_1555:
	edge32	%i4,	%o6,	%i3
	movrlz	%o2,	%i0,	%g5
	array32	%o0,	%l3,	%g1
	and	%l5,	%o5,	%l4
	wr	%g0,	0x81,	%asi
	sta	%f18,	[%l7 + 0x1C] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i1,	%l1,	%o3
	xor	%g7,	%o7,	%l2
	brnz	%i7,	loop_1556
	fpadd32s	%f11,	%f19,	%f25
	tcs	%icc,	0x0
	fpack32	%f2,	%f8,	%f26
loop_1556:
	fcmpgt16	%f20,	%f4,	%o1
	xnor	%o4,	0x0FF5,	%i2
	smulcc	%g4,	%l6,	%i5
	edge32	%i6,	%g3,	%l0
	fbo	%fcc1,	loop_1557
	nop
	setx	loop_1558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xF9F6AAFE505F86B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tsubcc	%g2,	0x04BF,	%i4
loop_1557:
	movrgz	%g6,	%i3,	%o6
loop_1558:
	movgu	%xcc,	%o2,	%g5
	subc	%i0,	0x1EB9,	%l3
	umul	%o0,	%l5,	%g1
	array8	%l4,	%i1,	%l1
	edge16ln	%o3,	%g7,	%o7
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x19,	 0x1
	taddcc	%i7,	0x1506,	%l2
	fabsd	%f4,	%f14
	edge16	%o4,	%o1,	%g4
	fmovrde	%l6,	%f24,	%f0
	fba	%fcc2,	loop_1559
	sra	%i5,	0x0B,	%i6
	fornot2s	%f12,	%f16,	%f5
	be,a,pn	%xcc,	loop_1560
loop_1559:
	and	%g3,	%i2,	%g2
	tsubcc	%i4,	0x07B7,	%l0
	fmovsne	%xcc,	%f5,	%f24
loop_1560:
	movrgz	%i3,	%g6,	%o2
	array16	%o6,	%g5,	%i0
	tcc	%xcc,	0x0
	srax	%l3,	%l5,	%o0
	set	0x38, %o2
	lda	[%l7 + %o2] 0x14,	%f8
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x10,	%f16
	fmovdcs	%xcc,	%f0,	%f23
	sir	0x1C30
	fandnot2s	%f26,	%f27,	%f20
	sdiv	%l4,	0x10A4,	%g1
	movvc	%icc,	%i1,	%o3
	movle	%icc,	%g7,	%l1
	orcc	%o5,	0x1F50,	%i7
	and	%l2,	0x1FC6,	%o7
	nop
	setx	0xDB89DF35,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x4BDFC4AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f27,	%f28
	fmovdle	%icc,	%f21,	%f6
	fmovdgu	%xcc,	%f1,	%f13
	fpackfix	%f4,	%f12
	nop
	fitos	%f6,	%f25
	fstoi	%f25,	%f2
	tneg	%xcc,	0x7
	array8	%o4,	%g4,	%o1
	bvc,pn	%icc,	loop_1561
	nop
	setx loop_1562, %l0, %l1
	jmpl %l1, %l6
	fbu	%fcc0,	loop_1563
	and	%i5,	%g3,	%i6
loop_1561:
	addccc	%g2,	%i4,	%l0
loop_1562:
	movrgez	%i2,	0x14E,	%g6
loop_1563:
	fpsub16	%f2,	%f12,	%f18
	edge8l	%o2,	%o6,	%g5
	fmovse	%icc,	%f17,	%f1
	sll	%i0,	0x16,	%i3
	alignaddr	%l3,	%o0,	%l5
	movcc	%xcc,	%g1,	%l4
	fmovdne	%icc,	%f15,	%f0
	mulx	%i1,	%o3,	%g7
	bn	%xcc,	loop_1564
	swap	[%l7 + 0x1C],	%o5
	tge	%xcc,	0x5
	movcc	%icc,	%l1,	%i7
loop_1564:
	umulcc	%o7,	0x02DC,	%o4
	sllx	%g4,	0x0C,	%l2
	fble,a	%fcc0,	loop_1565
	movcs	%icc,	%l6,	%o1
	fmovsvc	%icc,	%f4,	%f25
	ldsh	[%l7 + 0x1E],	%g3
loop_1565:
	fbne,a	%fcc0,	loop_1566
	tneg	%xcc,	0x4
	or	%i5,	%g2,	%i6
	movle	%xcc,	%l0,	%i4
loop_1566:
	udiv	%i2,	0x1835,	%o2
	fble,a	%fcc3,	loop_1567
	movrgz	%g6,	%g5,	%i0
	tge	%xcc,	0x3
	array32	%i3,	%l3,	%o0
loop_1567:
	subc	%o6,	0x0CB3,	%l5
	or	%l4,	0x12E0,	%i1
	flush	%l7 + 0x58
	tn	%xcc,	0x2
	orcc	%o3,	0x0F75,	%g1
	bge	loop_1568
	fpackfix	%f28,	%f23
	tpos	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	sta	%f18,	[%l7 + 0x6C] %asi
loop_1568:
	movgu	%xcc,	%g7,	%l1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5A] %asi,	%i7
	ba,a	%icc,	loop_1569
	movl	%xcc,	%o5,	%o7
	movle	%xcc,	%g4,	%o4
	fbule,a	%fcc3,	loop_1570
loop_1569:
	fcmple32	%f16,	%f30,	%l2
	movg	%icc,	%l6,	%o1
	bn,a,pt	%xcc,	loop_1571
loop_1570:
	lduh	[%l7 + 0x34],	%i5
	fnors	%f28,	%f1,	%f16
	ldx	[%l7 + 0x60],	%g2
loop_1571:
	nop
	setx	0x65DA200210568E9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fbuge	%fcc0,	loop_1572
	movneg	%icc,	%g3,	%l0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x6C] %asi,	%i4
loop_1572:
	lduh	[%l7 + 0x66],	%i6
	fmovdleu	%icc,	%f10,	%f30
	nop
	setx	loop_1573,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%xcc,	%i2,	%o2
	movge	%xcc,	%g6,	%g5
	sll	%i3,	0x0A,	%i0
loop_1573:
	lduw	[%l7 + 0x30],	%l3
	brgez,a	%o0,	loop_1574
	fmovdcs	%icc,	%f0,	%f29
	movg	%xcc,	%o6,	%l4
	sir	0x00DC
loop_1574:
	subc	%l5,	%i1,	%o3
	fmovsneg	%icc,	%f23,	%f22
	add	%g1,	0x0E99,	%g7
	xorcc	%l1,	0x0B74,	%o5
	edge16	%i7,	%o7,	%g4
	fmovdcs	%icc,	%f11,	%f13
	fpadd32s	%f24,	%f28,	%f3
	faligndata	%f14,	%f8,	%f10
	srlx	%l2,	0x11,	%l6
	tleu	%xcc,	0x0
	subc	%o1,	0x117F,	%o4
	bcc,a	%icc,	loop_1575
	or	%i5,	0x0CC9,	%g3
	nop
	setx	0xF4A3A0A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xEC095AD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f31,	%f19
	alignaddr	%l0,	%i4,	%i6
loop_1575:
	movrne	%g2,	%i2,	%o2
	edge16	%g6,	%i3,	%g5
	te	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l3,	%i0,	%o6
	srl	%l4,	%o0,	%l5
	popc	%o3,	%i1
	tvc	%icc,	0x2
	tge	%icc,	0x6
	movgu	%icc,	%g7,	%l1
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f26
	xnor	%o5,	%g1,	%o7
	srlx	%g4,	%l2,	%l6
	ldub	[%l7 + 0x0B],	%o1
	sth	%i7,	[%l7 + 0x42]
	movvs	%xcc,	%i5,	%o4
	movvc	%xcc,	%l0,	%g3
	taddcctv	%i4,	0x0BEA,	%g2
	movvs	%xcc,	%i2,	%o2
	brnz,a	%i6,	loop_1576
	ba	loop_1577
	fones	%f5
	andcc	%g6,	%i3,	%l3
loop_1576:
	edge16	%i0,	%g5,	%l4
loop_1577:
	udiv	%o6,	0x1EB7,	%o0
	fandnot2s	%f18,	%f21,	%f9
	fbue,a	%fcc3,	loop_1578
	movn	%icc,	%l5,	%i1
	bne,pn	%icc,	loop_1579
	tsubcctv	%o3,	%l1,	%o5
loop_1578:
	brz,a	%g1,	loop_1580
	taddcc	%g7,	%o7,	%l2
loop_1579:
	movneg	%icc,	%g4,	%o1
	std	%f18,	[%l7 + 0x70]
loop_1580:
	taddcctv	%l6,	%i5,	%i7
	bvc,pt	%icc,	loop_1581
	lduw	[%l7 + 0x68],	%o4
	fornot2s	%f21,	%f30,	%f20
	fmovrdlz	%g3,	%f4,	%f12
loop_1581:
	fandnot1	%f2,	%f24,	%f8
	or	%i4,	%g2,	%l0
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	fbule	%fcc3,	loop_1582
	udivcc	%i6,	0x001D,	%o2
	tl	%xcc,	0x4
	lduh	[%l7 + 0x08],	%g6
loop_1582:
	fmovsg	%xcc,	%f16,	%f7
	nop
	setx	0x707609BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fmovdcc	%icc,	%f8,	%f7
	movpos	%icc,	%l3,	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%g5
	set	0x61, %l1
	ldsba	[%l7 + %l1] 0x89,	%o6
	edge8	%o0,	%l4,	%l5
	fmovscs	%icc,	%f31,	%f15
	nop
	setx loop_1583, %l0, %l1
	jmpl %l1, %i1
	edge32l	%l1,	%o5,	%o3
	tsubcc	%g7,	0x16A3,	%o7
	subccc	%g1,	0x04F3,	%g4
loop_1583:
	fxor	%f10,	%f20,	%f20
	fbul	%fcc1,	loop_1584
	srax	%l2,	%l6,	%o1
	for	%f30,	%f30,	%f26
	tvs	%xcc,	0x7
loop_1584:
	fbule,a	%fcc0,	loop_1585
	fnegd	%f30,	%f26
	orcc	%i7,	%i5,	%g3
	nop
	setx loop_1586, %l0, %l1
	jmpl %l1, %o4
loop_1585:
	nop
	setx	0x5957FE5A31272DB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9EB0E37CBCCC7D3E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f24,	%f10
	edge32n	%g2,	%i4,	%l0
	edge8ln	%i2,	%i6,	%g6
loop_1586:
	fbue,a	%fcc2,	loop_1587
	fornot2s	%f10,	%f23,	%f16
	edge16l	%o2,	%i0,	%l3
	array32	%i3,	%g5,	%o0
loop_1587:
	nop
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x18,	 0x1
	movneg	%icc,	%l4,	%i1
	fand	%f26,	%f26,	%f22
	bneg,pt	%xcc,	loop_1588
	tleu	%icc,	0x0
	movcc	%icc,	%l5,	%l1
	edge32l	%o5,	%o3,	%o7
loop_1588:
	brnz,a	%g7,	loop_1589
	tcs	%xcc,	0x6
	andcc	%g1,	0x054F,	%l2
	fsrc2s	%f15,	%f14
loop_1589:
	ble,a	loop_1590
	fsrc1s	%f10,	%f5
	ldsw	[%l7 + 0x18],	%l6
	fandnot1s	%f24,	%f15,	%f12
loop_1590:
	bg,pt	%xcc,	loop_1591
	xorcc	%o1,	0x0EAF,	%i7
	nop
	setx loop_1592, %l0, %l1
	jmpl %l1, %i5
	movcc	%xcc,	%g4,	%o4
loop_1591:
	tsubcctv	%g3,	%i4,	%g2
	fbne,a	%fcc0,	loop_1593
loop_1592:
	array16	%l0,	%i6,	%g6
	tsubcctv	%i2,	0x1D3C,	%i0
	sdivx	%o2,	0x12E4,	%l3
loop_1593:
	sll	%g5,	%i3,	%o6
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f12
	fzeros	%f10
	movrgz	%o0,	0x166,	%l4
	tn	%xcc,	0x5
	tpos	%icc,	0x4
	array8	%l5,	%l1,	%o5
	edge16	%i1,	%o7,	%o3
	fmovdl	%xcc,	%f8,	%f17
	fnands	%f0,	%f22,	%f24
	movg	%icc,	%g7,	%g1
	fmovrsgz	%l6,	%f7,	%f7
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x18,	%l2
	fpsub32s	%f10,	%f26,	%f7
	tne	%icc,	0x2
	ble,pn	%icc,	loop_1594
	move	%icc,	%o1,	%i7
	orcc	%g4,	0x156A,	%o4
	sethi	0x13D3,	%i5
loop_1594:
	addc	%i4,	%g2,	%g3
	bvc,a	loop_1595
	brgz,a	%i6,	loop_1596
	edge16ln	%l0,	%i2,	%g6
	nop
	setx	0x7AEB1783A211EE6D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2FC6700C44718C18,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f30,	%f14
loop_1595:
	fzero	%f18
loop_1596:
	fbu,a	%fcc1,	loop_1597
	nop
	setx loop_1598, %l0, %l1
	jmpl %l1, %o2
	addccc	%l3,	0x03FD,	%i0
	bgu	loop_1599
loop_1597:
	xnorcc	%i3,	0x1B38,	%g5
loop_1598:
	fzero	%f2
	std	%f14,	[%l7 + 0x70]
loop_1599:
	alignaddr	%o0,	%l4,	%o6
	tle	%icc,	0x2
	fmovdne	%icc,	%f13,	%f3
	fcmpne16	%f14,	%f22,	%l5
	brz,a	%o5,	loop_1600
	fnot1s	%f18,	%f15
	fbule,a	%fcc1,	loop_1601
	fcmpgt16	%f12,	%f6,	%i1
loop_1600:
	edge32n	%o7,	%o3,	%l1
	ldstub	[%l7 + 0x6D],	%g7
loop_1601:
	nop
	set	0x14, %g6
	swapa	[%l7 + %g6] 0x89,	%g1
	fbue,a	%fcc0,	loop_1602
	edge32n	%l6,	%o1,	%l2
	nop
	setx	loop_1603,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%i7,	0x081E,	%g4
loop_1602:
	fbo	%fcc2,	loop_1604
	fbne,a	%fcc2,	loop_1605
loop_1603:
	bg	loop_1606
	sth	%o4,	[%l7 + 0x7C]
loop_1604:
	edge16ln	%i4,	%g2,	%g3
loop_1605:
	movge	%xcc,	%i5,	%i6
loop_1606:
	movrgez	%l0,	%g6,	%i2
	fmovrslez	%l3,	%f3,	%f25
	movleu	%xcc,	%o2,	%i0
	fsrc1	%f10,	%f18
	array8	%i3,	%o0,	%l4
	brgez,a	%g5,	loop_1607
	ldx	[%l7 + 0x18],	%l5
	xorcc	%o6,	%o5,	%i1
	fbn	%fcc2,	loop_1608
loop_1607:
	or	%o3,	0x0497,	%l1
	xorcc	%g7,	0x1E6A,	%o7
	tl	%icc,	0x7
loop_1608:
	alignaddrl	%g1,	%l6,	%o1
	fmul8sux16	%f26,	%f24,	%f24
	taddcctv	%l2,	%g4,	%i7
	fbg	%fcc1,	loop_1609
	tcs	%icc,	0x3
	movrgez	%i4,	0x242,	%g2
	brnz	%g3,	loop_1610
loop_1609:
	fmovrdlz	%o4,	%f12,	%f24
	andn	%i6,	0x1EF1,	%l0
	ldd	[%l7 + 0x48],	%i4
loop_1610:
	be	loop_1611
	fmovda	%xcc,	%f9,	%f3
	fabsd	%f6,	%f14
	edge32ln	%i2,	%g6,	%l3
loop_1611:
	ldd	[%l7 + 0x20],	%i0
	andn	%i3,	0x07B7,	%o0
	call	loop_1612
	bn,a,pt	%xcc,	loop_1613
	fmovd	%f24,	%f4
	sethi	0x0347,	%l4
loop_1612:
	tsubcc	%g5,	%o2,	%o6
loop_1613:
	brgz,a	%l5,	loop_1614
	ta	%xcc,	0x3
	sra	%o5,	0x0A,	%i1
	umul	%o3,	%g7,	%l1
loop_1614:
	fmovdpos	%xcc,	%f24,	%f2
	fmovdgu	%icc,	%f5,	%f10
	udivcc	%o7,	0x0809,	%g1
	addc	%l6,	%o1,	%g4
	xorcc	%l2,	%i7,	%g2
	subc	%g3,	%i4,	%i6
	bne,pn	%icc,	loop_1615
	nop
	setx	0x403FFCFA177DFE61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x8C930DCAE8EA562D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f10,	%f18
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l0
loop_1615:
	edge16	%o4,	%i2,	%g6
	fexpand	%f6,	%f2
	movcc	%xcc,	%l3,	%i0
	udiv	%i5,	0x1057,	%i3
	sll	%l4,	%o0,	%o2
	bl	loop_1616
	edge8	%o6,	%l5,	%g5
	umulcc	%o5,	%i1,	%o3
	alignaddrl	%g7,	%l1,	%o7
loop_1616:
	fbo	%fcc1,	loop_1617
	addc	%l6,	0x132E,	%o1
	bpos,a	%xcc,	loop_1618
	popc	%g4,	%g1
loop_1617:
	movge	%xcc,	%i7,	%l2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
loop_1618:
	fmovsle	%xcc,	%f11,	%f14
	bpos,pt	%icc,	loop_1619
	udivcc	%i4,	0x16A7,	%g2
	fmovdcc	%xcc,	%f21,	%f17
	smulcc	%i6,	0x0596,	%l0
loop_1619:
	xnor	%o4,	%i2,	%g6
	orn	%i0,	0x09DB,	%l3
	fmovsg	%icc,	%f6,	%f18
	fbul,a	%fcc3,	loop_1620
	taddcc	%i3,	0x1349,	%i5
	smul	%l4,	%o0,	%o2
	bleu,pt	%xcc,	loop_1621
loop_1620:
	andncc	%o6,	%g5,	%o5
	tl	%icc,	0x6
	fmovde	%icc,	%f26,	%f11
loop_1621:
	fblg,a	%fcc0,	loop_1622
	fmovdcs	%icc,	%f26,	%f14
	movrgez	%i1,	%o3,	%g7
	bneg	%xcc,	loop_1623
loop_1622:
	tge	%xcc,	0x1
	mova	%xcc,	%l1,	%o7
	nop
	setx	0x6BF94E8E693C878A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xCC490AD63618748D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f4,	%f0
loop_1623:
	edge16n	%l5,	%o1,	%g4
	edge32n	%g1,	%l6,	%l2
	bcc,pn	%icc,	loop_1624
	mulscc	%g3,	%i7,	%i4
	fcmpeq32	%f26,	%f24,	%i6
	move	%icc,	%g2,	%o4
loop_1624:
	edge8l	%i2,	%l0,	%g6
	sethi	0x0C8A,	%i0
	bgu,a,pn	%icc,	loop_1625
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x6
	nop
	set	0x14, %i6
	ldsw	[%l7 + %i6],	%l3
loop_1625:
	array16	%i5,	%l4,	%i3
	movneg	%icc,	%o0,	%o6
	tl	%icc,	0x1
	movge	%icc,	%g5,	%o5
	array8	%i1,	%o3,	%o2
	fmovsvc	%icc,	%f20,	%f22
	bcs,a,pn	%icc,	loop_1626
	fbug	%fcc0,	loop_1627
	addccc	%l1,	0x193D,	%o7
	addcc	%l5,	0x04C0,	%o1
loop_1626:
	fpadd16s	%f4,	%f7,	%f31
loop_1627:
	fmovsvc	%icc,	%f23,	%f2
	movrlz	%g7,	0x32E,	%g4
	sllx	%g1,	0x08,	%l2
	nop
	setx	0x606C83DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	te	%icc,	0x6
	bl,a	%xcc,	loop_1628
	fmovdleu	%xcc,	%f12,	%f14
	wr	%g0,	0x80,	%asi
	sta	%f28,	[%l7 + 0x74] %asi
loop_1628:
	xnor	%g3,	0x1DEF,	%l6
	subc	%i4,	%i7,	%i6
	set	0x66, %o3
	lduha	[%l7 + %o3] 0x88,	%g2
	edge8ln	%o4,	%i2,	%g6
	brgez,a	%i0,	loop_1629
	bge,a,pt	%icc,	loop_1630
	fornot2	%f12,	%f8,	%f28
	ldsh	[%l7 + 0x44],	%l0
loop_1629:
	sllx	%l3,	0x07,	%l4
loop_1630:
	fxor	%f10,	%f28,	%f22
	fmovsg	%icc,	%f7,	%f26
	or	%i5,	%o0,	%o6
	fmovrdne	%g5,	%f16,	%f10
	sub	%i3,	%o5,	%i1
	ble,pt	%xcc,	loop_1631
	fabss	%f11,	%f25
	bn,a,pn	%xcc,	loop_1632
	bge,pn	%xcc,	loop_1633
loop_1631:
	tne	%icc,	0x6
	tge	%icc,	0x4
loop_1632:
	fmovrdne	%o2,	%f24,	%f24
loop_1633:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x11,	%l1,	%o7
	nop
	setx	0x0F2BD3FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f22
	fmul8x16al	%f18,	%f26,	%f6
	movrne	%l5,	%o1,	%o3
	movre	%g4,	%g7,	%g1
	set	0x12, %l4
	lduba	[%l7 + %l4] 0x80,	%g3
	xorcc	%l6,	%l2,	%i7
	fbg,a	%fcc2,	loop_1634
	sdiv	%i6,	0x186D,	%g2
	nop
	set	0x42, %o0
	ldsh	[%l7 + %o0],	%i4
	array8	%o4,	%g6,	%i0
loop_1634:
	move	%xcc,	%l0,	%i2
	nop
	setx	loop_1635,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovscc	%icc,	%f8,	%f18
	tl	%xcc,	0x3
	sdivcc	%l4,	0x05DA,	%i5
loop_1635:
	tvs	%icc,	0x2
	sub	%o0,	0x1C89,	%o6
	fmovrde	%l3,	%f18,	%f2
	fbe,a	%fcc1,	loop_1636
	sir	0x1312
	te	%xcc,	0x7
	fbo	%fcc1,	loop_1637
loop_1636:
	tcc	%icc,	0x3
	fmovrdgz	%i3,	%f18,	%f14
	addc	%g5,	0x1A10,	%o5
loop_1637:
	srax	%i1,	0x01,	%o2
	fmovda	%xcc,	%f9,	%f26
	andcc	%o7,	%l1,	%l5
	subc	%o3,	%g4,	%g7
	sth	%g1,	[%l7 + 0x1C]
	edge16	%g3,	%l6,	%l2
	tvc	%xcc,	0x4
	sra	%i7,	0x00,	%i6
	tgu	%icc,	0x1
	nop
	fitos	%f22,	%f3
	andn	%g2,	%o1,	%i4
	andcc	%o4,	%i0,	%l0
	pdist	%f18,	%f12,	%f20
	udiv	%g6,	0x0707,	%l4
	orcc	%i2,	0x0CF0,	%o0
	edge32l	%i5,	%o6,	%i3
	set	0x60, %i0
	sta	%f6,	[%l7 + %i0] 0x81
	movg	%xcc,	%l3,	%g5
	movrlez	%o5,	0x2E1,	%o2
	subccc	%i1,	0x0506,	%l1
	edge8n	%l5,	%o3,	%o7
	sir	0x101E
	fmovdpos	%icc,	%f11,	%f21
	fmovrsne	%g7,	%f22,	%f20
	fmovsle	%xcc,	%f15,	%f24
	tsubcc	%g1,	0x00EB,	%g4
	andcc	%g3,	%l2,	%i7
	lduw	[%l7 + 0x7C],	%i6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x7C] %asi,	%f26
	srlx	%g2,	0x0B,	%l6
	set	0x76, %g2
	stha	%o1,	[%l7 + %g2] 0x11
	nop
	setx	0x921065D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x5E6DD84C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f12,	%f22
	tl	%icc,	0x4
	bcc	%xcc,	loop_1638
	fbu	%fcc2,	loop_1639
	fmovdn	%icc,	%f17,	%f10
	tcc	%icc,	0x5
loop_1638:
	addcc	%o4,	%i0,	%i4
loop_1639:
	fmovsge	%xcc,	%f12,	%f12
	tsubcc	%l0,	%l4,	%i2
	movrne	%o0,	%i5,	%g6
	tgu	%icc,	0x5
	movgu	%icc,	%o6,	%l3
	movg	%icc,	%g5,	%i3
	tgu	%xcc,	0x4
	nop
	fitod	%f12,	%f24
	fdtoi	%f24,	%f10
	set	0x3D, %l6
	stba	%o5,	[%l7 + %l6] 0x19
	movvs	%icc,	%i1,	%o2
	nop
	setx	0xD4977618BFD00786,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xEF4B6AB6C055CC9E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f4,	%f16
	membar	0x36
	fandnot2	%f4,	%f8,	%f8
	bge,a	loop_1640
	fcmpne16	%f22,	%f14,	%l5
	sllx	%o3,	%o7,	%g7
	xorcc	%g1,	0x187B,	%g4
loop_1640:
	movrgz	%g3,	%l1,	%i7
	nop
	setx	0x18B422D8A07ABB0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	xor	%i6,	0x0BB8,	%l2
	fbo	%fcc3,	loop_1641
	fandnot1s	%f1,	%f23,	%f10
	flush	%l7 + 0x40
	fmovdg	%xcc,	%f5,	%f3
loop_1641:
	addc	%g2,	%o1,	%l6
	tvc	%xcc,	0x3
	tgu	%icc,	0x2
	tvc	%xcc,	0x2
	edge32n	%i0,	%i4,	%o4
	brlez	%l4,	loop_1642
	edge16	%i2,	%l0,	%o0
	fzero	%f30
	tge	%xcc,	0x3
loop_1642:
	fbl,a	%fcc1,	loop_1643
	ba	%xcc,	loop_1644
	ldd	[%l7 + 0x38],	%g6
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f22
loop_1643:
	fbul	%fcc3,	loop_1645
loop_1644:
	addcc	%i5,	%o6,	%g5
	taddcctv	%l3,	0x199D,	%i3
	movvs	%xcc,	%i1,	%o5
loop_1645:
	tle	%icc,	0x0
	bcs	%icc,	loop_1646
	tn	%xcc,	0x2
	fpack16	%f24,	%f6
	addc	%l5,	0x020D,	%o3
loop_1646:
	andncc	%o2,	%g7,	%g1
	brgz	%o7,	loop_1647
	addccc	%g3,	%g4,	%i7
	edge16n	%l1,	%l2,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1647:
	sra	%o1,	%i6,	%i0
	tn	%icc,	0x1
	alignaddrl	%l6,	%i4,	%l4
	brgez,a	%o4,	loop_1648
	edge8l	%l0,	%i2,	%o0
	edge32n	%g6,	%i5,	%g5
	fmovsneg	%icc,	%f2,	%f4
loop_1648:
	movgu	%icc,	%l3,	%o6
	fmovdneg	%icc,	%f11,	%f12
	array16	%i1,	%i3,	%o5
	fbe,a	%fcc0,	loop_1649
	nop
	fitod	%f4,	%f12
	fdtoi	%f12,	%f21
	srlx	%o3,	%o2,	%g7
	srl	%l5,	%g1,	%g3
loop_1649:
	fbn,a	%fcc1,	loop_1650
	fmovdgu	%xcc,	%f11,	%f7
	nop
	setx	0x0B7C4F485071CD13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	ta	%icc,	0x4
loop_1650:
	sethi	0x12C3,	%o7
	mulscc	%g4,	%l1,	%i7
	movrne	%g2,	%o1,	%i6
	movgu	%xcc,	%i0,	%l2
	tleu	%icc,	0x2
	nop
	setx	0x7490D2DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xE66E4FFA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f30,	%f30
	ble	%icc,	loop_1651
	tvc	%xcc,	0x7
	edge32l	%l6,	%l4,	%i4
	addc	%o4,	0x036D,	%i2
loop_1651:
	edge16ln	%l0,	%g6,	%i5
	bne,a,pn	%xcc,	loop_1652
	membar	0x53
	sll	%o0,	0x19,	%l3
	tvc	%icc,	0x1
loop_1652:
	fandnot2s	%f7,	%f7,	%f5
	udivcc	%o6,	0x0429,	%g5
	fmovrdgz	%i3,	%f22,	%f24
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x81
	movne	%icc,	%i1,	%o5
	fbue	%fcc0,	loop_1653
	fxnor	%f0,	%f10,	%f20
	fnor	%f0,	%f18,	%f22
	or	%o2,	0x1652,	%g7
loop_1653:
	subc	%o3,	%l5,	%g1
	wr	%g0,	0xe2,	%asi
	stha	%o7,	[%l7 + 0x74] %asi
	membar	#Sync
	fmul8x16al	%f5,	%f3,	%f26
	bge,a,pn	%xcc,	loop_1654
	add	%g4,	%l1,	%g3
	fbuge	%fcc1,	loop_1655
	sll	%i7,	%g2,	%i6
loop_1654:
	for	%f14,	%f12,	%f4
	mova	%xcc,	%i0,	%o1
loop_1655:
	fmovsvc	%xcc,	%f7,	%f24
	edge32l	%l6,	%l4,	%l2
	lduw	[%l7 + 0x2C],	%o4
	srlx	%i4,	%l0,	%i2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	edge16n	%o0,	%i5,	%o6
	edge8	%g5,	%l3,	%i1
	movne	%xcc,	%i3,	%o2
	sll	%o5,	%o3,	%l5
	nop
	setx	0x456D54BBB9B8697E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5BF995F6FEE816F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f14,	%f18
	tcs	%xcc,	0x2
	tneg	%xcc,	0x7
	fbge,a	%fcc0,	loop_1656
	stx	%g1,	[%l7 + 0x08]
	xnorcc	%g7,	%g4,	%l1
	umul	%o7,	0x0A84,	%i7
loop_1656:
	movrgz	%g2,	%i6,	%i0
	tl	%xcc,	0x1
	set	0x14, %l5
	sta	%f10,	[%l7 + %l5] 0x81
	set	0x78, %o6
	lda	[%l7 + %o6] 0x04,	%f23
	te	%xcc,	0x7
	subcc	%g3,	%l6,	%l4
	ldx	[%l7 + 0x60],	%o1
	fmovs	%f5,	%f7
	fmuld8ulx16	%f15,	%f17,	%f14
	srl	%o4,	%i4,	%l2
	movle	%icc,	%l0,	%i2
	fands	%f11,	%f4,	%f31
	subccc	%o0,	%g6,	%i5
	sir	0x1A5A
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xea,	%g4
	movpos	%xcc,	%l3,	%i1
	fmovdleu	%icc,	%f24,	%f24
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
	edge16ln	%o6,	%o5,	%o2
	fnegd	%f28,	%f2
	set	0x34, %l3
	ldsba	[%l7 + %l3] 0x80,	%o3
	edge8ln	%l5,	%g7,	%g1
	tgu	%icc,	0x0
	std	%f30,	[%l7 + 0x60]
	movpos	%icc,	%l1,	%o7
	tleu	%icc,	0x2
	tcs	%icc,	0x6
	ba	%xcc,	loop_1657
	srax	%g4,	0x05,	%g2
	andcc	%i7,	0x0D02,	%i0
	mulscc	%g3,	0x1098,	%i6
loop_1657:
	fmovdle	%icc,	%f13,	%f7
	andn	%l4,	%l6,	%o1
	edge32ln	%i4,	%l2,	%o4
	movge	%xcc,	%i2,	%o0
	mulscc	%l0,	%g6,	%i5
	udiv	%g5,	0x1B9D,	%i1
	alignaddr	%l3,	%o6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x7D, %i5
	ldsb	[%l7 + %i5],	%o2
	fpadd16s	%f24,	%f19,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f8,	%f28,	%f17
	bvc	%xcc,	loop_1658
	edge16l	%o3,	%l5,	%i3
	bn,pt	%icc,	loop_1659
	edge8ln	%g7,	%l1,	%o7
loop_1658:
	bneg,a	%icc,	loop_1660
	bg,a	loop_1661
loop_1659:
	fsrc2	%f16,	%f20
	movge	%xcc,	%g4,	%g2
loop_1660:
	orncc	%i7,	0x1809,	%i0
loop_1661:
	udivx	%g1,	0x1521,	%g3
	orn	%l4,	%i6,	%o1
	fmovdle	%xcc,	%f25,	%f3
	fmul8ulx16	%f8,	%f10,	%f28
	set	0x5E, %g7
	stba	%l6,	[%l7 + %g7] 0x2f
	membar	#Sync
	tvs	%xcc,	0x7
	bg,pn	%icc,	loop_1662
	sethi	0x00A9,	%i4
	ldd	[%l7 + 0x28],	%o4
	taddcc	%i2,	0x1A7F,	%o0
loop_1662:
	bn	%icc,	loop_1663
	fbug,a	%fcc2,	loop_1664
	movge	%xcc,	%l0,	%l2
	fmul8sux16	%f10,	%f4,	%f0
loop_1663:
	xnor	%i5,	%g6,	%g5
loop_1664:
	sub	%i1,	%l3,	%o5
	fnot2s	%f18,	%f18
	udivx	%o6,	0x0B62,	%o3
	sdiv	%l5,	0x1D20,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g7,	0x105B,	%i3
	fornot2	%f12,	%f22,	%f26
	umul	%o7,	0x1F5B,	%l1
	nop
	set	0x0C, %g4
	lduh	[%l7 + %g4],	%g2
	flush	%l7 + 0x78
	udivcc	%i7,	0x0215,	%g4
	edge32ln	%g1,	%g3,	%l4
	fnot1s	%f16,	%f16
	fxors	%f27,	%f7,	%f2
	edge32n	%i0,	%o1,	%i6
	tgu	%xcc,	0x1
	sra	%i4,	%o4,	%l6
	tpos	%icc,	0x4
	taddcc	%o0,	0x14C8,	%l0
	sir	0x100C
	tvc	%icc,	0x1
	std	%f24,	[%l7 + 0x68]
	tcs	%xcc,	0x7
	tg	%icc,	0x2
	fnand	%f4,	%f8,	%f14
	prefetch	[%l7 + 0x4C],	 0x3
	ldd	[%l7 + 0x70],	%i2
	movcc	%icc,	%l2,	%g6
	movle	%icc,	%i5,	%g5
	edge16ln	%l3,	%o5,	%i1
	movleu	%xcc,	%o3,	%o6
	edge32l	%l5,	%o2,	%i3
	edge32n	%g7,	%l1,	%g2
	swap	[%l7 + 0x14],	%i7
	taddcctv	%g4,	%o7,	%g3
	fmovsle	%icc,	%f22,	%f0
	tge	%xcc,	0x5
	movvs	%xcc,	%l4,	%i0
	fmul8x16al	%f27,	%f9,	%f4
	xorcc	%o1,	0x1039,	%i6
	orncc	%g1,	%i4,	%o4
	tgu	%xcc,	0x1
	tge	%xcc,	0x1
	tgu	%icc,	0x6
	nop
	setx	0xF4D57CD367D7A651,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9ABE9FB12F3BC3EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f4,	%f2
	taddcc	%l6,	%o0,	%l0
	nop
	setx	0xA3F61C66,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xC5006B27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f18,	%f27
	fmovspos	%icc,	%f9,	%f5
	fmul8sux16	%f14,	%f28,	%f2
	fnand	%f4,	%f24,	%f0
	flush	%l7 + 0x08
	taddcc	%i2,	%l2,	%g6
	movrlez	%i5,	%l3,	%g5
	movge	%xcc,	%o5,	%i1
	movgu	%icc,	%o3,	%o6
	movcc	%xcc,	%o2,	%l5
	tcc	%icc,	0x2
	sdivcc	%g7,	0x1A83,	%i3
	orcc	%l1,	%i7,	%g2
	ldsb	[%l7 + 0x29],	%g4
	movrgz	%o7,	0x1BD,	%g3
	nop
	setx	0x5B4F885F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x75E19461,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f17,	%f11
	set	0x20, %i2
	lduwa	[%l7 + %i2] 0x89,	%i0
	movle	%icc,	%o1,	%i6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l4,	%i4
	fbe	%fcc2,	loop_1665
	movvc	%icc,	%g1,	%o4
	xnorcc	%l6,	0x125A,	%l0
	srax	%i2,	%l2,	%g6
loop_1665:
	xnor	%o0,	%i5,	%g5
	addc	%o5,	%i1,	%l3
	add	%o6,	0x14B5,	%o2
	tcc	%xcc,	0x1
	movneg	%icc,	%o3,	%l5
	flush	%l7 + 0x7C
	xnorcc	%g7,	%l1,	%i7
	ldstub	[%l7 + 0x1A],	%g2
	fbuge	%fcc3,	loop_1666
	edge16n	%g4,	%i3,	%g3
	edge16l	%i0,	%o7,	%i6
	stb	%o1,	[%l7 + 0x55]
loop_1666:
	taddcc	%l4,	0x07E7,	%i4
	mulx	%o4,	0x1D7E,	%g1
	edge8	%l6,	%l0,	%l2
	be,a,pt	%xcc,	loop_1667
	movrgez	%g6,	%o0,	%i5
	orncc	%i2,	0x0E61,	%g5
	fmovrdne	%o5,	%f24,	%f12
loop_1667:
	udiv	%i1,	0x1CA8,	%o6
	te	%xcc,	0x0
	tl	%icc,	0x4
	edge32ln	%l3,	%o3,	%l5
	srl	%g7,	0x08,	%l1
	array32	%i7,	%o2,	%g2
	set	0x4E, %g5
	lduha	[%l7 + %g5] 0x10,	%g4
	stbar
	subcc	%g3,	0x068D,	%i3
	movg	%xcc,	%o7,	%i0
	bshuffle	%f22,	%f12,	%f16
	popc	%i6,	%o1
	edge8	%i4,	%l4,	%o4
	xnorcc	%l6,	0x17C1,	%l0
	brlez	%g1,	loop_1668
	fcmpne32	%f6,	%f8,	%g6
	fbg,a	%fcc3,	loop_1669
	orncc	%o0,	0x1EF9,	%l2
loop_1668:
	tsubcctv	%i2,	0x16E5,	%i5
	edge32	%o5,	%g5,	%o6
loop_1669:
	bcs,pn	%xcc,	loop_1670
	ldd	[%l7 + 0x20],	%f28
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2
loop_1670:
	array32	%i1,	%l5,	%o3
	sllx	%l1,	%i7,	%g7
	taddcc	%g2,	%o2,	%g4
	tge	%xcc,	0x1
	movleu	%xcc,	%g3,	%o7
	edge32ln	%i3,	%i6,	%o1
	tge	%xcc,	0x0
	lduw	[%l7 + 0x24],	%i0
	ldsw	[%l7 + 0x58],	%l4
	fexpand	%f12,	%f2
	fornot2	%f2,	%f12,	%f8
	fabsd	%f22,	%f26
	fmovdge	%icc,	%f21,	%f12
	sdivcc	%i4,	0x1638,	%o4
	alignaddrl	%l6,	%g1,	%g6
	xnorcc	%l0,	0x09AD,	%l2
	bl,a	loop_1671
	sethi	0x00F7,	%i2
	udivcc	%o0,	0x1B4C,	%i5
	movg	%icc,	%g5,	%o5
loop_1671:
	te	%xcc,	0x5
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l3
	movvs	%icc,	%i1,	%o6
	fmovrsgez	%l5,	%f31,	%f20
	andcc	%l1,	0x1296,	%o3
	tge	%icc,	0x3
	fmovsl	%icc,	%f17,	%f7
	lduw	[%l7 + 0x64],	%g7
	fmovsneg	%icc,	%f15,	%f4
	nop
	fitos	%f8,	%f5
	fstox	%f5,	%f14
	fxtos	%f14,	%f22
	fones	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f29,	%f18
	array8	%i7,	%g2,	%o2
	prefetch	[%l7 + 0x50],	 0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g4,	%o7,	%i3
	nop
	setx	0xE9A8B1AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f13
	be	%xcc,	loop_1672
	movcs	%icc,	%g3,	%o1
	popc	0x1D28,	%i0
	tleu	%icc,	0x3
loop_1672:
	fzero	%f14
	edge16l	%i6,	%i4,	%o4
	brz	%l6,	loop_1673
	fmovdcs	%xcc,	%f26,	%f16
	addcc	%g1,	0x1035,	%l4
	fmovda	%xcc,	%f22,	%f12
loop_1673:
	lduw	[%l7 + 0x10],	%l0
	set	0x50, %g3
	swapa	[%l7 + %g3] 0x81,	%g6
	fmovdneg	%xcc,	%f10,	%f25
	bcs,a	%xcc,	loop_1674
	bgu,pn	%icc,	loop_1675
	fcmpgt32	%f12,	%f16,	%i2
	sethi	0x13A1,	%o0
loop_1674:
	fnand	%f14,	%f22,	%f26
loop_1675:
	nop
	set	0x0D, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i5
	wr	%g0,	0x81,	%asi
	stba	%l2,	[%l7 + 0x42] %asi
	udivx	%g5,	0x0221,	%l3
	udivcc	%o5,	0x1BF6,	%i1
	subccc	%o6,	0x0D62,	%l5
	movrlez	%l1,	0x3A0,	%g7
	move	%xcc,	%i7,	%o3
	mova	%icc,	%o2,	%g2
	ldstub	[%l7 + 0x1C],	%o7
	sllx	%i3,	%g4,	%o1
	sethi	0x0E9D,	%i0
	movne	%icc,	%i6,	%g3
	te	%icc,	0x4
	subcc	%o4,	0x07B2,	%i4
	brz,a	%l6,	loop_1676
	movrne	%g1,	0x3AD,	%l4
	sllx	%l0,	0x10,	%i2
	set	0x50, %o4
	lda	[%l7 + %o4] 0x89,	%f31
loop_1676:
	for	%f12,	%f28,	%f14
	ble	loop_1677
	fbg,a	%fcc2,	loop_1678
	stb	%o0,	[%l7 + 0x2A]
	fandnot2	%f12,	%f4,	%f26
loop_1677:
	call	loop_1679
loop_1678:
	array8	%g6,	%l2,	%g5
	fbue,a	%fcc3,	loop_1680
	bne,a	loop_1681
loop_1679:
	alignaddrl	%i5,	%l3,	%o5
	sra	%i1,	0x07,	%l5
loop_1680:
	srlx	%o6,	%l1,	%i7
loop_1681:
	fcmpeq16	%f10,	%f6,	%g7
	bge,a	%icc,	loop_1682
	nop
	fitos	%f18,	%f25
	sllx	%o2,	0x18,	%o3
	bcc	%xcc,	loop_1683
loop_1682:
	movre	%g2,	%o7,	%i3
	or	%o1,	0x0415,	%i0
	srl	%g4,	%i6,	%g3
loop_1683:
	edge8	%i4,	%l6,	%g1
	movre	%l4,	0x137,	%o4
	fmovsgu	%icc,	%f25,	%f3
	edge16ln	%i2,	%l0,	%o0
	sub	%g6,	%l2,	%i5
	bne,a	loop_1684
	bg	%icc,	loop_1685
	sllx	%g5,	0x06,	%o5
	srl	%l3,	0x12,	%l5
loop_1684:
	fabss	%f3,	%f8
loop_1685:
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%i1
	orncc	%o6,	0x1CBD,	%i7
	addc	%g7,	%o2,	%l1
	fpadd16	%f10,	%f8,	%f18
	tpos	%icc,	0x2
	movle	%icc,	%o3,	%o7
	andcc	%g2,	%i3,	%o1
	movpos	%icc,	%i0,	%g4
	brz	%i6,	loop_1686
	bn,a,pt	%icc,	loop_1687
	fmovdvc	%icc,	%f8,	%f13
	edge16l	%i4,	%g3,	%l6
loop_1686:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1687:
	te	%icc,	0x1
	subc	%g1,	0x116F,	%l4
	sdivx	%i2,	0x09A4,	%l0
	movvs	%xcc,	%o0,	%g6
	movrlz	%l2,	%o4,	%i5
	membar	0x00
	andn	%g5,	%o5,	%l3
	movleu	%xcc,	%l5,	%o6
	subcc	%i1,	0x15E2,	%g7
	fcmple16	%f14,	%f20,	%i7
	move	%xcc,	%l1,	%o2
	set	0x24, %l0
	ldsha	[%l7 + %l0] 0x10,	%o7
	array32	%g2,	%i3,	%o1
	tgu	%xcc,	0x4
	udiv	%o3,	0x1CDC,	%i0
	fnegs	%f4,	%f22
	nop
	setx	0x786D4EE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f28
	fnor	%f8,	%f30,	%f14
	fmovdge	%icc,	%f24,	%f16
	taddcc	%g4,	0x01A5,	%i4
	smul	%i6,	%l6,	%g3
	stbar
	ldsb	[%l7 + 0x0D],	%l4
	addccc	%g1,	%l0,	%i2
	fone	%f0
	movvs	%icc,	%g6,	%o0
	mulx	%l2,	%i5,	%g5
	movvs	%xcc,	%o4,	%o5
	tgu	%icc,	0x2
	sra	%l5,	0x0D,	%l3
	taddcc	%o6,	%g7,	%i7
	edge32	%l1,	%o2,	%i1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%g2
	fnot2s	%f18,	%f15
	subcc	%o7,	%o1,	%o3
	mulscc	%i3,	%i0,	%i4
	fnot2s	%f12,	%f23
	orcc	%i6,	0x137A,	%l6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%g4
	umul	%l4,	0x051E,	%g1
	movrgz	%i2,	0x147,	%l0
	tgu	%icc,	0x2
	set	0x7C, %l2
	lda	[%l7 + %l2] 0x15,	%f26
	sll	%o0,	0x10,	%g6
	fzeros	%f9
	andncc	%l2,	%i5,	%g5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	flush	%l7 + 0x2C
	te	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l5
	fmovrde	%o5,	%f26,	%f12
	fbug,a	%fcc1,	loop_1688
	fzeros	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	%g7,	%i7
loop_1688:
	nop
	setx	0xB61E7EEA23CDCA39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x64D38E8B9A0BB16A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f10,	%f26
	brnz	%l1,	loop_1689
	movrlez	%o2,	%i1,	%g2
	fmuld8ulx16	%f23,	%f18,	%f30
	bg,pn	%xcc,	loop_1690
loop_1689:
	mova	%icc,	%o6,	%o7
	nop
	setx	0xF936BC3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x245B6A12,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f30,	%f6
	bcc,pt	%xcc,	loop_1691
loop_1690:
	bgu,a,pt	%icc,	loop_1692
	movcs	%icc,	%o3,	%o1
	edge32l	%i3,	%i4,	%i0
loop_1691:
	xnor	%l6,	0x03D0,	%g3
loop_1692:
	add	%g4,	%i6,	%l4
	fand	%f24,	%f10,	%f30
	movrgz	%g1,	0x211,	%l0
	tle	%xcc,	0x7
	bcs,a,pt	%xcc,	loop_1693
	sdivcc	%o0,	0x0CF9,	%g6
	tneg	%xcc,	0x7
	fmovrsgez	%l2,	%f31,	%f29
loop_1693:
	srax	%i5,	%i2,	%g5
	sdivcc	%l5,	0x1C0E,	%o4
	fblg,a	%fcc1,	loop_1694
	or	%l3,	0x1011,	%g7
	edge32	%o5,	%l1,	%o2
	xor	%i1,	%i7,	%g2
loop_1694:
	movcc	%xcc,	%o7,	%o6
	mulx	%o3,	%o1,	%i3
	edge32l	%i4,	%i0,	%g3
	stx	%g4,	[%l7 + 0x18]
	ta	%icc,	0x6
	srlx	%l6,	%i6,	%g1
	fbug	%fcc2,	loop_1695
	orncc	%l0,	%l4,	%o0
	srlx	%l2,	0x00,	%i5
	fmovdcs	%xcc,	%f29,	%f24
loop_1695:
	orcc	%i2,	%g5,	%l5
	fbu	%fcc0,	loop_1696
	fone	%f0
	movcc	%xcc,	%o4,	%g6
	swap	[%l7 + 0x78],	%g7
loop_1696:
	fpsub32s	%f2,	%f18,	%f25
	edge32n	%l3,	%l1,	%o5
	fzero	%f24
	edge32	%i1,	%o2,	%g2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x6E] %asi,	%i7
	smulcc	%o7,	0x007A,	%o6
	bvs,pn	%icc,	loop_1697
	xnorcc	%o3,	%i3,	%i4
	fmovrdlz	%i0,	%f20,	%f18
	fbue	%fcc3,	loop_1698
loop_1697:
	brlz,a	%o1,	loop_1699
	sllx	%g4,	0x17,	%g3
	orncc	%l6,	0x0C6C,	%i6
loop_1698:
	nop
	set	0x7A, %o2
	ldsba	[%l7 + %o2] 0x15,	%l0
loop_1699:
	for	%f10,	%f28,	%f24
	fmovsne	%icc,	%f1,	%f22
	set	0x38, %o1
	ldsha	[%l7 + %o1] 0x11,	%g1
	fcmple16	%f26,	%f18,	%o0
	edge32l	%l2,	%l4,	%i5
	alignaddrl	%g5,	%l5,	%o4
	tle	%xcc,	0x7
	fmovda	%icc,	%f24,	%f30
	array32	%i2,	%g6,	%g7
	umul	%l1,	%o5,	%l3
	fandnot1s	%f15,	%f19,	%f0
	or	%o2,	%i1,	%g2
	fmovdneg	%icc,	%f17,	%f14
	addcc	%o7,	%i7,	%o3
	fpsub32s	%f29,	%f2,	%f1
	edge16l	%i3,	%o6,	%i4
	stbar
	movre	%o1,	%g4,	%i0
	movre	%g3,	0x3E9,	%i6
	sethi	0x0F32,	%l0
	xor	%g1,	0x0DD1,	%o0
	edge8l	%l6,	%l4,	%i5
	fmovsge	%icc,	%f20,	%f28
	edge16	%l2,	%l5,	%g5
	ldd	[%l7 + 0x78],	%f20
	edge16	%o4,	%g6,	%i2
	fxor	%f20,	%f16,	%f22
	andn	%l1,	%o5,	%l3
	or	%g7,	0x05B8,	%o2
	movvc	%icc,	%i1,	%o7
	sllx	%g2,	0x16,	%o3
	brz,a	%i3,	loop_1700
	alignaddr	%i7,	%o6,	%i4
	nop
	fitod	%f21,	%f24
	movn	%xcc,	%g4,	%o1
loop_1700:
	fors	%f19,	%f31,	%f7
	movpos	%icc,	%i0,	%g3
	ldstub	[%l7 + 0x11],	%l0
	edge16ln	%g1,	%i6,	%l6
	movrgez	%l4,	%i5,	%l2
	set	0x7C, %l1
	ldswa	[%l7 + %l1] 0x15,	%l5
	membar	0x04
	movn	%icc,	%o0,	%o4
	movpos	%xcc,	%g5,	%g6
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f6
	fxtos	%f6,	%f21
	ld	[%l7 + 0x78],	%f26
	movgu	%icc,	%l1,	%i2
	sethi	0x1F30,	%l3
	udivcc	%g7,	0x1362,	%o5
	fsrc2	%f12,	%f14
	fbu	%fcc1,	loop_1701
	lduh	[%l7 + 0x18],	%i1
	stx	%o2,	[%l7 + 0x50]
	fbg,a	%fcc2,	loop_1702
loop_1701:
	taddcc	%g2,	%o3,	%i3
	tge	%icc,	0x7
	array8	%o7,	%o6,	%i4
loop_1702:
	membar	0x0C
	tl	%xcc,	0x4
	fcmpgt16	%f10,	%f30,	%g4
	sdiv	%o1,	0x1104,	%i7
	nop
	fitos	%f8,	%f11
	fstod	%f11,	%f20
	fmovspos	%icc,	%f3,	%f8
	nop
	setx	0x6C64C0C65075AE90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	edge16ln	%g3,	%i0,	%g1
	mova	%xcc,	%i6,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f16,	%f9,	%f20
	ldd	[%l7 + 0x38],	%l0
	set	0x68, %o5
	ldswa	[%l7 + %o5] 0x88,	%l4
	fblg	%fcc0,	loop_1703
	fnegd	%f8,	%f6
	subccc	%l2,	0x04AB,	%l5
	sir	0x004B
loop_1703:
	fbge,a	%fcc0,	loop_1704
	mulscc	%o0,	%o4,	%g5
	te	%icc,	0x4
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%g6
loop_1704:
	addc	%l1,	0x0A14,	%i2
	edge16l	%l3,	%g7,	%i5
	edge8n	%o5,	%o2,	%g2
	orcc	%i1,	0x08AC,	%i3
	ta	%icc,	0x5
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o7
	fpackfix	%f28,	%f31
	brgz,a	%o3,	loop_1705
	taddcc	%i4,	0x0E38,	%g4
	alignaddrl	%o6,	%o1,	%g3
	addc	%i0,	0x1E87,	%i7
loop_1705:
	ldsh	[%l7 + 0x6C],	%i6
	fmul8ulx16	%f28,	%f10,	%f2
	mulscc	%g1,	%l6,	%l4
	xnor	%l2,	0x0CF5,	%l0
	fmovdleu	%icc,	%f2,	%f16
	sll	%o0,	0x01,	%l5
	tsubcc	%o4,	%g6,	%l1
	sra	%g5,	0x00,	%l3
	ldx	[%l7 + 0x50],	%g7
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x34] %asi,	%i2
	tpos	%xcc,	0x0
	be	loop_1706
	fba,a	%fcc0,	loop_1707
	sll	%i5,	%o5,	%g2
	srlx	%o2,	0x1A,	%i1
loop_1706:
	fmovrdlez	%i3,	%f26,	%f22
loop_1707:
	movl	%xcc,	%o7,	%o3
	nop
	setx	0x004DE305,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x4C0BA149,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f20,	%f17
	popc	%i4,	%o6
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%f6
	addc	%g4,	%o1,	%i0
	umulcc	%i7,	0x134E,	%i6
	bgu,a,pn	%xcc,	loop_1708
	umul	%g3,	%g1,	%l4
	fbn	%fcc0,	loop_1709
	srl	%l2,	%l0,	%l6
loop_1708:
	smulcc	%o0,	%l5,	%o4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
loop_1709:
	edge8ln	%g6,	%g5,	%g7
	tl	%xcc,	0x4
	umulcc	%l3,	0x18EB,	%i5
	fcmple32	%f30,	%f22,	%o5
	tsubcc	%i2,	0x10A8,	%g2
	tvs	%xcc,	0x5
	fmuld8sux16	%f15,	%f18,	%f26
	edge16ln	%o2,	%i3,	%i1
	fcmpeq16	%f22,	%f26,	%o3
	andncc	%o7,	%i4,	%o6
	umul	%o1,	0x13E7,	%g4
	set	0x3C, %i3
	ldsba	[%l7 + %i3] 0x88,	%i7
	orcc	%i0,	0x1A0F,	%g3
	srl	%g1,	%l4,	%l2
	movrgz	%l0,	%l6,	%i6
	fmovdgu	%icc,	%f0,	%f27
	movrlz	%l5,	%o0,	%o4
	nop
	setx	0xA1A7D806,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xC215887D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f24,	%f10
	movleu	%xcc,	%l1,	%g5
	subc	%g7,	%l3,	%g6
	fbg,a	%fcc1,	loop_1710
	xnor	%o5,	%i5,	%g2
	fmovrdlez	%i2,	%f28,	%f2
	fnot2s	%f13,	%f6
loop_1710:
	nop
	setx loop_1711, %l0, %l1
	jmpl %l1, %o2
	mova	%xcc,	%i1,	%i3
	fnot2	%f20,	%f26
	tl	%xcc,	0x5
loop_1711:
	flush	%l7 + 0x64
	edge32	%o7,	%o3,	%i4
	udiv	%o6,	0x0DC8,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i7,	%i0
	and	%o1,	0x0EE3,	%g3
	st	%f13,	[%l7 + 0x20]
	ta	%icc,	0x7
	udivx	%g1,	0x15B9,	%l2
	nop
	setx	0x8199268C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f5
	fmovdvs	%xcc,	%f14,	%f25
	alignaddr	%l4,	%l0,	%i6
	movcs	%icc,	%l5,	%l6
	tvc	%icc,	0x2
	tneg	%icc,	0x5
	fbe,a	%fcc1,	loop_1712
	bpos,a,pn	%xcc,	loop_1713
	movrgz	%o4,	0x092,	%o0
	movvs	%xcc,	%g5,	%l1
loop_1712:
	nop
	setx	0xDD29469E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xD084D7C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f20,	%f23
loop_1713:
	nop
	set	0x10, %o3
	ldswa	[%l7 + %o3] 0x11,	%g7
	subc	%l3,	0x1EE9,	%o5
	addccc	%g6,	%g2,	%i5
	addccc	%i2,	0x1E40,	%i1
	fmovsgu	%xcc,	%f31,	%f16
	edge8	%i3,	%o7,	%o3
	addc	%o2,	0x1BEC,	%o6
	fexpand	%f30,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i4,	%g4,	%i0
	movvc	%icc,	%o1,	%i7
	smul	%g3,	%g1,	%l2
	edge16ln	%l0,	%i6,	%l5
	andn	%l6,	%l4,	%o4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%g5
	movle	%icc,	%l1,	%o0
	edge16l	%l3,	%o5,	%g6
	nop
	setx	0x1C41934130D84141,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f18
	movrlz	%g2,	%g7,	%i5
	bleu,pt	%icc,	loop_1714
	sub	%i2,	%i1,	%i3
	edge32ln	%o3,	%o2,	%o6
	set	0x70, %l4
	stxa	%o7,	[%l7 + %l4] 0x14
loop_1714:
	tcs	%xcc,	0x1
	alignaddrl	%g4,	%i4,	%i0
	tgu	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x6
	move	%icc,	%i7,	%o1
	movne	%xcc,	%g1,	%l2
	fones	%f17
	alignaddr	%l0,	%g3,	%i6
	fbule,a	%fcc3,	loop_1715
	andncc	%l6,	%l5,	%o4
	fbo	%fcc0,	loop_1716
	xorcc	%l4,	%l1,	%g5
loop_1715:
	sll	%o0,	%l3,	%o5
	mova	%icc,	%g2,	%g7
loop_1716:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g6
	ld	[%l7 + 0x30],	%f27
	addc	%i2,	%i5,	%i1
	sdiv	%o3,	0x132F,	%o2
	fbu,a	%fcc2,	loop_1717
	movrgez	%i3,	0x2FF,	%o6
	movrgz	%o7,	0x36E,	%i4
	taddcctv	%g4,	%i7,	%o1
loop_1717:
	fsrc1s	%f18,	%f30
	brgz	%g1,	loop_1718
	xnor	%i0,	%l2,	%g3
	orcc	%l0,	0x18AA,	%l6
	fmovsa	%xcc,	%f21,	%f31
loop_1718:
	movneg	%icc,	%i6,	%o4
	subc	%l5,	0x116B,	%l1
	fpsub16	%f14,	%f14,	%f16
	stw	%l4,	[%l7 + 0x38]
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addcc	%o0,	0x0C14,	%g5
	orncc	%l3,	0x11EE,	%o5
	tvs	%icc,	0x5
	fsrc2	%f28,	%f12
	fmovsneg	%xcc,	%f30,	%f0
	subcc	%g2,	0x0A6C,	%g7
	addc	%i2,	0x1A1A,	%g6
	movrgez	%i5,	0x344,	%i1
	xorcc	%o2,	0x0B88,	%i3
	fmovsleu	%xcc,	%f24,	%f22
	add	%o3,	0x058A,	%o6
	tcc	%xcc,	0x6
	orncc	%i4,	0x1A3E,	%g4
	lduw	[%l7 + 0x18],	%i7
	edge8ln	%o7,	%o1,	%i0
	movrlz	%l2,	0x349,	%g3
	addc	%g1,	0x00EB,	%l6
	bvc	%xcc,	loop_1719
	srax	%l0,	0x11,	%i6
	wr	%g0,	0x23,	%asi
	stha	%o4,	[%l7 + 0x46] %asi
	membar	#Sync
loop_1719:
	tl	%icc,	0x3
	fmovsg	%icc,	%f26,	%f0
	nop
	setx	0xBDE0F529AE72BF95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x28AF8E586686C1C8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f18,	%f10
	tgu	%icc,	0x1
	movn	%xcc,	%l1,	%l4
	sdivcc	%l5,	0x0A71,	%g5
	movvc	%icc,	%o0,	%l3
	fblg,a	%fcc1,	loop_1720
	bcc,a	loop_1721
	fpack32	%f10,	%f22,	%f16
	set	0x2C, %i6
	lduwa	[%l7 + %i6] 0x89,	%g2
loop_1720:
	tcs	%xcc,	0x7
loop_1721:
	popc	%g7,	%o5
	bcc,pt	%icc,	loop_1722
	edge16n	%g6,	%i2,	%i1
	movre	%i5,	0x2DD,	%o2
	tvc	%xcc,	0x1
loop_1722:
	fbule,a	%fcc3,	loop_1723
	alignaddr	%o3,	%o6,	%i4
	tgu	%xcc,	0x0
	fabsd	%f28,	%f8
loop_1723:
	tvs	%icc,	0x2
	array16	%g4,	%i3,	%o7
	orn	%o1,	%i0,	%l2
	tcs	%xcc,	0x5
	movrgz	%i7,	%g3,	%g1
	fbne	%fcc1,	loop_1724
	nop
	setx	0xB218739F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x15B7B239,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f7,	%f26
	edge32n	%l6,	%l0,	%i6
	smul	%l1,	0x1BAB,	%l4
loop_1724:
	fandnot1	%f24,	%f24,	%f26
	sdivcc	%l5,	0x044A,	%o4
	ldsh	[%l7 + 0x2E],	%g5
	fcmple32	%f8,	%f30,	%l3
	wr	%g0,	0x2a,	%asi
	stba	%o0,	[%l7 + 0x2F] %asi
	membar	#Sync
	alignaddr	%g7,	%o5,	%g6
	nop
	fitos	%f16,	%f31
	orcc	%i2,	0x0758,	%i1
	sethi	0x03A9,	%g2
	xor	%o2,	0x15CD,	%i5
	addccc	%o6,	0x06D1,	%i4
	fnegs	%f16,	%f17
	alignaddr	%o3,	%g4,	%o7
	wr	%g0,	0xeb,	%asi
	stxa	%i3,	[%l7 + 0x70] %asi
	membar	#Sync
	fxnors	%f9,	%f1,	%f24
	edge8l	%o1,	%l2,	%i7
	movpos	%xcc,	%g3,	%i0
	xorcc	%l6,	0x1111,	%l0
	tl	%icc,	0x4
	movl	%xcc,	%i6,	%l1
	bne,a,pn	%xcc,	loop_1725
	nop
	fitos	%f4,	%f5
	fstoi	%f5,	%f29
	addc	%g1,	0x069E,	%l5
	movleu	%xcc,	%o4,	%g5
loop_1725:
	edge8l	%l3,	%o0,	%l4
	alignaddrl	%g7,	%g6,	%o5
	fornot2	%f12,	%f2,	%f26
	subcc	%i2,	%i1,	%o2
	movcs	%icc,	%g2,	%i5
	udivcc	%o6,	0x0ECF,	%o3
	call	loop_1726
	edge16n	%i4,	%o7,	%i3
	fcmple32	%f14,	%f8,	%o1
	sdiv	%l2,	0x0E20,	%i7
loop_1726:
	std	%f22,	[%l7 + 0x70]
	addcc	%g3,	0x0808,	%g4
	movcc	%xcc,	%i0,	%l0
	movcc	%icc,	%i6,	%l6
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x71, %i0
	ldstuba	[%l7 + %i0] 0x18,	%l1
	fbge	%fcc3,	loop_1727
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f28,	%f5
	andn	%l5,	0x031C,	%o4
loop_1727:
	movne	%xcc,	%g1,	%l3
	fmovsle	%xcc,	%f26,	%f26
	tne	%xcc,	0x3
	edge8l	%g5,	%o0,	%l4
	nop
	setx loop_1728, %l0, %l1
	jmpl %l1, %g7
	bl,a,pt	%icc,	loop_1729
	fbu,a	%fcc0,	loop_1730
	ldstub	[%l7 + 0x41],	%o5
loop_1728:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
loop_1729:
	tpos	%icc,	0x7
loop_1730:
	sdiv	%i2,	0x139B,	%i1
	umul	%o2,	0x0F1B,	%i5
	set	0x7C, %o0
	stwa	%o6,	[%l7 + %o0] 0x2f
	membar	#Sync
	edge8l	%o3,	%i4,	%g2
	fmovdn	%icc,	%f26,	%f0
	fsrc2s	%f2,	%f26
	fcmpeq32	%f12,	%f10,	%o7
	fbo,a	%fcc2,	loop_1731
	sll	%o1,	%l2,	%i7
	movneg	%xcc,	%g3,	%i3
	tvs	%xcc,	0x2
loop_1731:
	fmovdgu	%icc,	%f4,	%f22
	movrgez	%i0,	0x2C0,	%g4
	fmovs	%f16,	%f2
	orcc	%i6,	0x1EFC,	%l6
	sra	%l0,	%l5,	%l1
	tsubcctv	%o4,	%l3,	%g5
	bvs	loop_1732
	smulcc	%g1,	%l4,	%o0
	fmovdleu	%xcc,	%f4,	%f2
	tn	%xcc,	0x7
loop_1732:
	nop
	setx	0x80627C33,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	movl	%xcc,	%g7,	%o5
	fpadd16s	%f25,	%f25,	%f30
	ba,pn	%icc,	loop_1733
	bn,pt	%icc,	loop_1734
	fmovs	%f18,	%f11
	st	%f19,	[%l7 + 0x60]
loop_1733:
	tgu	%xcc,	0x1
loop_1734:
	tpos	%xcc,	0x5
	udivx	%i2,	0x10D4,	%i1
	srax	%g6,	%i5,	%o2
	brlz,a	%o6,	loop_1735
	add	%i4,	%g2,	%o7
	fbge	%fcc3,	loop_1736
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1735:
	fcmpgt32	%f28,	%f20,	%o1
	edge16l	%o3,	%i7,	%g3
loop_1736:
	fpadd16s	%f19,	%f4,	%f25
	array16	%l2,	%i0,	%g4
	tgu	%xcc,	0x5
	wr	%g0,	0x2f,	%asi
	stha	%i3,	[%l7 + 0x14] %asi
	membar	#Sync
	bcs,a	%xcc,	loop_1737
	orcc	%l6,	0x01C8,	%l0
	brgez,a	%l5,	loop_1738
	orcc	%i6,	0x06C2,	%o4
loop_1737:
	edge32n	%l3,	%g5,	%g1
	tne	%icc,	0x2
loop_1738:
	xnor	%l4,	%l1,	%g7
	tsubcctv	%o5,	%o0,	%i2
	stbar
	edge32n	%g6,	%i5,	%o2
	movvc	%xcc,	%o6,	%i4
	tgu	%icc,	0x6
	umulcc	%i1,	0x0C9D,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %g2
	stxa	%o1,	[%l7 + %g2] 0x27
	membar	#Sync
	tg	%icc,	0x6
	movle	%icc,	%o3,	%i7
	taddcctv	%o7,	0x1433,	%l2
	udivcc	%g3,	0x1071,	%g4
	edge8l	%i0,	%i3,	%l6
	edge8ln	%l0,	%l5,	%o4
	subccc	%l3,	0x0D59,	%i6
	ld	[%l7 + 0x38],	%f27
	fpsub16	%f20,	%f4,	%f4
	fzero	%f26
	sub	%g1,	0x1C91,	%g5
	mova	%icc,	%l4,	%l1
	bpos,a,pt	%xcc,	loop_1739
	flush	%l7 + 0x40
	tge	%xcc,	0x4
	tpos	%icc,	0x2
loop_1739:
	ba	%xcc,	loop_1740
	fnors	%f4,	%f25,	%f3
	tcs	%xcc,	0x5
	edge32n	%g7,	%o5,	%i2
loop_1740:
	udivx	%o0,	0x07B7,	%g6
	movneg	%xcc,	%o2,	%o6
	set	0x2E, %i4
	lduha	[%l7 + %i4] 0x0c,	%i4
	fmul8ulx16	%f2,	%f4,	%f12
	set	0x6C, %l5
	sta	%f20,	[%l7 + %l5] 0x14
	fsrc2	%f6,	%f30
	movneg	%icc,	%i1,	%g2
	sdiv	%i5,	0x1C99,	%o1
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x56] %asi,	%o3
	subcc	%o7,	0x0A77,	%i7
	fpack16	%f18,	%f11
	fbuge	%fcc3,	loop_1741
	tgu	%xcc,	0x5
	move	%icc,	%g3,	%l2
	tvs	%icc,	0x7
loop_1741:
	xnor	%i0,	%g4,	%l6
	stx	%l0,	[%l7 + 0x20]
	fxnors	%f24,	%f24,	%f16
	udivcc	%i3,	0x0DD9,	%l5
	brz	%l3,	loop_1742
	fpack16	%f6,	%f11
	fmovs	%f31,	%f0
	xor	%o4,	0x0415,	%i6
loop_1742:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x40] %asi,	%g5
	ldd	[%l7 + 0x40],	%l4
	fmovdg	%icc,	%f8,	%f17
	std	%f28,	[%l7 + 0x08]
	movvs	%xcc,	%g1,	%g7
	te	%icc,	0x7
	ta	%icc,	0x6
	fmul8sux16	%f24,	%f28,	%f22
	fble	%fcc3,	loop_1743
	movgu	%icc,	%o5,	%i2
	ldub	[%l7 + 0x31],	%l1
	fmovdle	%icc,	%f2,	%f20
loop_1743:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g6,	0x11D5,	%o0
	swap	[%l7 + 0x28],	%o2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%o6
	bcc,a	loop_1744
	movn	%icc,	%i1,	%i4
	nop
	setx	0xD049135E,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	taddcctv	%i5,	%g2,	%o3
loop_1744:
	movrgz	%o1,	0x371,	%i7
	andcc	%g3,	%o7,	%i0
	nop
	fitod	%f29,	%f24
	wr	%g0,	0x2f,	%asi
	stha	%l2,	[%l7 + 0x0C] %asi
	membar	#Sync
	fpsub32s	%f31,	%f28,	%f28
	tvc	%xcc,	0x0
	fmovdleu	%xcc,	%f26,	%f21
	fpadd32	%f26,	%f10,	%f10
	fbe,a	%fcc0,	loop_1745
	and	%g4,	%l6,	%l0
	mova	%icc,	%i3,	%l5
	andn	%o4,	%l3,	%g5
loop_1745:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x50],	%l4
	fnot1s	%f18,	%f11
	wr	%g0,	0x81,	%asi
	sta	%f10,	[%l7 + 0x30] %asi
	orncc	%i6,	%g1,	%g7
	fmovdvc	%icc,	%f20,	%f19
	be,a	%icc,	loop_1746
	fbul,a	%fcc0,	loop_1747
	subccc	%o5,	%l1,	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i2,	%o2
loop_1746:
	fpackfix	%f16,	%f15
loop_1747:
	tle	%xcc,	0x6
	taddcctv	%o0,	%o6,	%i1
	fzeros	%f24
	pdist	%f18,	%f16,	%f2
	set	0x30, %o6
	stxa	%i5,	[%l7 + %o6] 0x0c
	fxnors	%f10,	%f23,	%f0
	fbo,a	%fcc3,	loop_1748
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f10
	taddcctv	%i4,	%g2,	%o3
	fmovdleu	%xcc,	%f9,	%f27
loop_1748:
	taddcc	%o1,	0x1ED4,	%g3
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	addc	%o7,	%i7,	%i0
	fmovse	%xcc,	%f5,	%f6
	bcs,a	%xcc,	loop_1749
	fmovdvs	%icc,	%f12,	%f19
	tvc	%icc,	0x4
	sllx	%l2,	0x01,	%g4
loop_1749:
	sdiv	%l0,	0x01D1,	%l6
	wr	%g0,	0xeb,	%asi
	stha	%l5,	[%l7 + 0x62] %asi
	membar	#Sync
	tleu	%icc,	0x2
	edge8	%i3,	%l3,	%o4
	fmovdpos	%xcc,	%f24,	%f15
	move	%icc,	%l4,	%g5
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f8
	fxtod	%f8,	%f16
	fmovdpos	%xcc,	%f29,	%f20
	xor	%i6,	0x06F8,	%g7
	tne	%icc,	0x4
	movrgez	%g1,	%o5,	%g6
	tsubcctv	%i2,	0x11EC,	%o2
	srlx	%o0,	0x1C,	%l1
	fmovdleu	%icc,	%f22,	%f13
	alignaddrl	%o6,	%i5,	%i4
	brnz,a	%i1,	loop_1750
	movpos	%xcc,	%o3,	%o1
	bshuffle	%f20,	%f12,	%f10
	fmovrde	%g2,	%f18,	%f2
loop_1750:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f12,	%f27
	fstox	%f27,	%f10
	xnor	%g3,	%o7,	%i0
	andn	%l2,	%i7,	%g4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l6,	%l0
	subc	%l5,	0x1963,	%i3
	ldx	[%l7 + 0x48],	%o4
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x14] %asi,	%l3
	srax	%g5,	%l4,	%g7
	nop
	setx	loop_1751,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%g1,	%o5
	set	0x14, %i1
	sta	%f22,	[%l7 + %i1] 0x88
loop_1751:
	fmovrsne	%g6,	%f22,	%f18
	movvs	%xcc,	%i6,	%i2
	tleu	%icc,	0x7
	set	0x54, %l3
	sta	%f13,	[%l7 + %l3] 0x0c
	set	0x52, %l6
	ldsha	[%l7 + %l6] 0x18,	%o0
	be	%icc,	loop_1752
	bpos,pn	%xcc,	loop_1753
	mulx	%l1,	0x01BF,	%o2
	sub	%i5,	%o6,	%i4
loop_1752:
	brz	%o3,	loop_1754
loop_1753:
	fblg,a	%fcc0,	loop_1755
	fbe	%fcc1,	loop_1756
	fpadd16s	%f2,	%f0,	%f6
loop_1754:
	fzeros	%f8
loop_1755:
	ba,a	loop_1757
loop_1756:
	udivcc	%o1,	0x05AF,	%i1
	orn	%g2,	%o7,	%g3
	ba	loop_1758
loop_1757:
	ba	%icc,	loop_1759
	tl	%xcc,	0x0
	fmovdneg	%icc,	%f27,	%f30
loop_1758:
	movn	%icc,	%l2,	%i0
loop_1759:
	alignaddr	%g4,	%l6,	%l0
	tcc	%icc,	0x0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l5,	%i7
	tle	%icc,	0x1
	sdivx	%o4,	0x136E,	%i3
	movpos	%xcc,	%l3,	%l4
	alignaddrl	%g7,	%g5,	%o5
	subc	%g1,	%i6,	%i2
	fbl,a	%fcc3,	loop_1760
	movgu	%icc,	%o0,	%g6
	tcc	%icc,	0x2
	movrgez	%l1,	0x28A,	%i5
loop_1760:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x25] %asi,	%o2
	ldx	[%l7 + 0x18],	%i4
	bg,a,pn	%xcc,	loop_1761
	movle	%icc,	%o3,	%o1
	edge8ln	%o6,	%g2,	%i1
	tvs	%xcc,	0x2
loop_1761:
	stb	%g3,	[%l7 + 0x7C]
	sllx	%o7,	0x11,	%l2
	set	0x50, %g7
	ldda	[%l7 + %g7] 0x22,	%g4
	tge	%icc,	0x2
	movrlez	%i0,	%l6,	%l5
	subccc	%i7,	0x0ECD,	%l0
	tge	%icc,	0x3
	tleu	%xcc,	0x4
	movrgz	%o4,	%i3,	%l4
	tvc	%xcc,	0x5
	move	%xcc,	%g7,	%g5
	set	0x4A, %g4
	ldstuba	[%l7 + %g4] 0x89,	%l3
	xor	%g1,	%i6,	%o5
	ta	%icc,	0x7
	edge8n	%o0,	%i2,	%g6
	ldub	[%l7 + 0x19],	%l1
	xor	%i5,	%o2,	%o3
	fcmpgt32	%f6,	%f8,	%i4
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o6
	or	%g2,	%i1,	%o1
	subccc	%g3,	%l2,	%g4
	movge	%xcc,	%o7,	%l6
	fors	%f14,	%f5,	%f18
	edge16n	%l5,	%i0,	%i7
	tge	%xcc,	0x1
	fba	%fcc0,	loop_1762
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x09FD
	fba	%fcc2,	loop_1763
loop_1762:
	tcc	%xcc,	0x5
	fmovrde	%l0,	%f16,	%f10
	movpos	%icc,	%i3,	%o4
loop_1763:
	fornot1s	%f4,	%f31,	%f7
	fmovdgu	%xcc,	%f2,	%f5
	te	%icc,	0x4
	fxnors	%f19,	%f25,	%f14
	srax	%l4,	0x10,	%g5
	ld	[%l7 + 0x7C],	%f19
	edge8l	%l3,	%g7,	%g1
	orn	%i6,	%o0,	%o5
	brgz,a	%i2,	loop_1764
	array8	%l1,	%i5,	%o2
	fmovdn	%icc,	%f12,	%f24
	fmovdvs	%icc,	%f20,	%f31
loop_1764:
	fcmpgt32	%f20,	%f14,	%g6
	sllx	%o3,	0x1A,	%i4
	sethi	0x0155,	%o6
	fbue,a	%fcc1,	loop_1765
	nop
	set	0x1C, %i2
	stb	%i1,	[%l7 + %i2]
	fmovse	%xcc,	%f25,	%f20
	bcc,a	loop_1766
loop_1765:
	nop
	setx loop_1767, %l0, %l1
	jmpl %l1, %o1
	movvs	%xcc,	%g2,	%l2
	ldx	[%l7 + 0x48],	%g3
loop_1766:
	edge16n	%g4,	%l6,	%o7
loop_1767:
	ldstub	[%l7 + 0x19],	%l5
	mulx	%i7,	0x05E9,	%l0
	fmovrslez	%i0,	%f10,	%f11
	edge32n	%i3,	%o4,	%g5
	stbar
	edge8l	%l3,	%g7,	%l4
	sir	0x106F
	andcc	%i6,	0x0164,	%g1
	sdivcc	%o0,	0x08CD,	%i2
	tpos	%icc,	0x0
	stb	%o5,	[%l7 + 0x23]
	movn	%xcc,	%i5,	%o2
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movleu	%icc,	%g6,	%o3
	fbu	%fcc1,	loop_1768
	nop
	set	0x29, %g5
	ldub	[%l7 + %g5],	%i4
	fbo,a	%fcc3,	loop_1769
	fbe,a	%fcc2,	loop_1770
loop_1768:
	movg	%icc,	%o6,	%i1
	tl	%xcc,	0x1
loop_1769:
	edge16l	%l1,	%o1,	%g2
loop_1770:
	fandnot2s	%f29,	%f27,	%f10
	tl	%xcc,	0x2
	fornot2s	%f1,	%f7,	%f0
	array8	%g3,	%l2,	%g4
	fnors	%f16,	%f26,	%f0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f7
	sdivx	%o7,	0x125C,	%l5
	add	%i7,	0x0D13,	%l0
	movrlez	%l6,	%i3,	%o4
	edge16	%g5,	%i0,	%g7
	fsrc1s	%f28,	%f15
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x15
	bcs,pn	%icc,	loop_1771
	edge16n	%l4,	%l3,	%i6
	movn	%xcc,	%o0,	%g1
	edge8ln	%i2,	%i5,	%o2
loop_1771:
	edge8ln	%o5,	%g6,	%o3
	edge8l	%o6,	%i4,	%l1
	bleu	loop_1772
	ldd	[%l7 + 0x58],	%f8
	nop
	fitos	%f3,	%f9
	fstox	%f9,	%f24
	fxtos	%f24,	%f13
	movne	%icc,	%o1,	%i1
loop_1772:
	fnot1s	%f14,	%f27
	ta	%xcc,	0x1
	fpmerge	%f25,	%f11,	%f26
	stx	%g3,	[%l7 + 0x38]
	fbl	%fcc3,	loop_1773
	umul	%l2,	%g2,	%g4
	tl	%xcc,	0x6
	nop
	fitod	%f10,	%f28
	fdtox	%f28,	%f28
loop_1773:
	tl	%icc,	0x5
	tl	%icc,	0x7
	fbne,a	%fcc3,	loop_1774
	fbo	%fcc1,	loop_1775
	fxnor	%f28,	%f8,	%f16
	fnor	%f10,	%f0,	%f30
loop_1774:
	sdivx	%l5,	0x1C63,	%i7
loop_1775:
	ldsb	[%l7 + 0x79],	%o7
	tne	%xcc,	0x0
	fmovdleu	%icc,	%f30,	%f19
	xorcc	%l0,	%i3,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f13,	%f14
	fnegd	%f18,	%f26
	movge	%xcc,	%l6,	%g5
	wr	%g0,	0x10,	%asi
	sta	%f24,	[%l7 + 0x58] %asi
	fmovdcs	%icc,	%f17,	%f16
	set	0x55, %g1
	lduba	[%l7 + %g1] 0x80,	%g7
	array32	%l4,	%l3,	%i6
	fmovsleu	%icc,	%f7,	%f25
	set	0x5C, %i5
	lduha	[%l7 + %i5] 0x88,	%o0
	fmovrdne	%g1,	%f26,	%f12
	fornot1	%f8,	%f26,	%f4
	ldd	[%l7 + 0x48],	%f16
	tvc	%xcc,	0x2
	nop
	fitos	%f7,	%f7
	fstoi	%f7,	%f18
	edge16	%i0,	%i2,	%i5
	tn	%xcc,	0x6
	tsubcc	%o5,	0x18AC,	%g6
	edge16ln	%o2,	%o6,	%o3
	mulx	%i4,	0x176A,	%o1
	sdiv	%i1,	0x1DCF,	%l1
	ldd	[%l7 + 0x58],	%g2
	sdiv	%g2,	0x04B7,	%l2
	brnz,a	%l5,	loop_1776
	array16	%i7,	%g4,	%o7
	fones	%f29
	popc	0x01F9,	%i3
loop_1776:
	fbne	%fcc0,	loop_1777
	edge8ln	%l0,	%l6,	%g5
	movrlez	%g7,	0x17F,	%o4
	sll	%l3,	0x0B,	%l4
loop_1777:
	bcs,a,pt	%icc,	loop_1778
	sll	%i6,	0x14,	%g1
	sdivx	%o0,	0x0841,	%i0
	edge16ln	%i2,	%i5,	%g6
loop_1778:
	movne	%icc,	%o5,	%o2
	tpos	%xcc,	0x0
	orcc	%o3,	%o6,	%o1
	nop
	setx	loop_1779,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%i4,	%l1,	%g3
	tle	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i1
loop_1779:
	addcc	%l2,	0x1DAF,	%l5
	movcs	%icc,	%g2,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o7,	%i3
	movleu	%icc,	%l0,	%g4
	ldstub	[%l7 + 0x26],	%l6
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fmovsne	%icc,	%f27,	%f11
	ta	%icc,	0x6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o4
	movge	%xcc,	%l3,	%g7
	srlx	%l4,	0x1E,	%g1
	bne,a,pt	%icc,	loop_1780
	sub	%i6,	0x0858,	%i0
	andcc	%o0,	0x0213,	%i2
	bleu,a	%icc,	loop_1781
loop_1780:
	movcs	%xcc,	%i5,	%o5
	mova	%icc,	%o2,	%o3
	array32	%g6,	%o1,	%o6
loop_1781:
	fmovdleu	%icc,	%f16,	%f12
	set	0x38, %i7
	ldxa	[%g0 + %i7] 0x20,	%i4
	movvs	%icc,	%g3,	%l1
	fble	%fcc0,	loop_1782
	fpadd16s	%f9,	%f20,	%f12
	edge8ln	%l2,	%l5,	%g2
	bneg,pt	%icc,	loop_1783
loop_1782:
	tgu	%icc,	0x0
	stx	%i1,	[%l7 + 0x40]
	tsubcctv	%i7,	%o7,	%i3
loop_1783:
	fmovrsgez	%l0,	%f0,	%f4
	edge32	%g4,	%g5,	%o4
	fpadd32s	%f15,	%f5,	%f23
	sdivx	%l3,	0x06E7,	%l6
	fnot1	%f12,	%f16
	fnands	%f6,	%f5,	%f11
	fbn	%fcc0,	loop_1784
	udiv	%g7,	0x070B,	%g1
	nop
	setx loop_1785, %l0, %l1
	jmpl %l1, %i6
	movl	%icc,	%i0,	%l4
loop_1784:
	brgz	%i2,	loop_1786
	srax	%i5,	0x12,	%o0
loop_1785:
	fandnot1	%f0,	%f12,	%f22
	subc	%o2,	%o5,	%g6
loop_1786:
	andncc	%o1,	%o3,	%i4
	xorcc	%o6,	%g3,	%l2
	tne	%icc,	0x0
	fxnors	%f5,	%f0,	%f18
	sdivcc	%l1,	0x1396,	%l5
	sra	%g2,	0x12,	%i1
	sdiv	%o7,	0x150E,	%i3
	nop
	setx	0x572F3E2652FEA6E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xC5F7F9452E7E0797,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f24,	%f26
	movl	%xcc,	%l0,	%g4
	movg	%xcc,	%i7,	%g5
	srlx	%l3,	%o4,	%g7
	bpos,pn	%xcc,	loop_1787
	mova	%icc,	%g1,	%l6
	movrgez	%i6,	%l4,	%i2
	movle	%xcc,	%i5,	%i0
loop_1787:
	bgu,pt	%xcc,	loop_1788
	fmovrslez	%o0,	%f16,	%f0
	fsrc2s	%f5,	%f25
	std	%f28,	[%l7 + 0x78]
loop_1788:
	bg,pn	%icc,	loop_1789
	sir	0x1403
	fpsub32	%f4,	%f4,	%f18
	edge8	%o2,	%o5,	%o1
loop_1789:
	umulcc	%o3,	0x188C,	%i4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	movpos	%xcc,	%g3,	%l2
	udivx	%l1,	0x150B,	%l5
	nop
	setx	loop_1790,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%g2,	%i1,	%o7
	sra	%o6,	%l0,	%i3
	fbuge	%fcc3,	loop_1791
loop_1790:
	fnor	%f20,	%f2,	%f10
	xor	%i7,	0x063F,	%g4
	sethi	0x0623,	%l3
loop_1791:
	ba	loop_1792
	flush	%l7 + 0x64
	fpadd32	%f18,	%f30,	%f26
	xnorcc	%o4,	%g7,	%g5
loop_1792:
	brgz	%g1,	loop_1793
	andncc	%l6,	%i6,	%l4
	stbar
	tvs	%xcc,	0x3
loop_1793:
	xorcc	%i5,	0x1506,	%i0
	addcc	%i2,	0x171C,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x3
	std	%f16,	[%l7 + 0x48]
	fors	%f11,	%f22,	%f22
	bpos	%xcc,	loop_1794
	mulx	%o5,	0x00DC,	%o1
	movrlz	%o3,	0x2B9,	%i4
	taddcctv	%g6,	%g3,	%o0
loop_1794:
	ta	%xcc,	0x3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	movrgz	%l2,	0x0B1,	%l5
	set	0x64, %l2
	lda	[%l7 + %l2] 0x0c,	%f19
	te	%xcc,	0x0
	fmovsa	%xcc,	%f11,	%f27
	fmovrdlz	%l1,	%f10,	%f14
	fmovdle	%icc,	%f10,	%f29
	taddcc	%g2,	0x0B86,	%i1
	andcc	%o7,	0x1316,	%o6
	tvs	%icc,	0x0
	andncc	%l0,	%i3,	%i7
	tcc	%xcc,	0x0
	umul	%g4,	0x1D66,	%l3
	fmovdcs	%icc,	%f12,	%f22
	tcs	%xcc,	0x6
	movrlez	%g7,	0x206,	%g5
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
	fornot2	%f22,	%f0,	%f24
	array8	%g1,	%o4,	%i6
	brnz	%l4,	loop_1796
loop_1795:
	xnorcc	%l6,	%i0,	%i2
	tn	%icc,	0x4
	fpmerge	%f22,	%f0,	%f16
loop_1796:
	fors	%f17,	%f29,	%f18
	brnz,a	%o2,	loop_1797
	stbar
	ldsb	[%l7 + 0x3D],	%o5
	movneg	%xcc,	%o1,	%i5
loop_1797:
	fmovsle	%icc,	%f12,	%f27
	fbule	%fcc1,	loop_1798
	xor	%o3,	%g6,	%g3
	st	%f7,	[%l7 + 0x70]
	tg	%icc,	0x7
loop_1798:
	or	%i4,	%l2,	%o0
	fpadd32	%f16,	%f20,	%f12
	andncc	%l5,	%g2,	%i1
	ldx	[%l7 + 0x78],	%o7
	fbe	%fcc0,	loop_1799
	tg	%xcc,	0x0
	fbn,a	%fcc1,	loop_1800
	bne,pn	%icc,	loop_1801
loop_1799:
	movl	%xcc,	%o6,	%l1
	edge32n	%l0,	%i7,	%g4
loop_1800:
	fmovdneg	%xcc,	%f2,	%f6
loop_1801:
	nop
	fitos	%f4,	%f18
	fstoi	%f18,	%f30
	nop
	setx	0xC868F6EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x87C293FC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f7,	%f22
	ldub	[%l7 + 0x16],	%l3
	taddcc	%i3,	%g7,	%g5
	addcc	%o4,	%g1,	%l4
	tleu	%icc,	0x1
	fornot2s	%f18,	%f18,	%f21
	edge16l	%i6,	%l6,	%i2
	fpsub16	%f8,	%f4,	%f4
	edge16	%o2,	%i0,	%o1
	movrgz	%i5,	%o3,	%o5
	fmovsge	%icc,	%f11,	%f28
	movrgez	%g3,	0x0DD,	%i4
	tvs	%xcc,	0x7
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	fmovsg	%icc,	%f26,	%f22
	tcs	%icc,	0x6
	be,pn	%icc,	loop_1802
	nop
	setx loop_1803, %l0, %l1
	jmpl %l1, %o0
	andcc	%l5,	%g2,	%l2
	movleu	%xcc,	%o7,	%i1
loop_1802:
	tvc	%xcc,	0x3
loop_1803:
	fmovscc	%icc,	%f15,	%f5
	edge16	%l1,	%o6,	%l0
	st	%f1,	[%l7 + 0x3C]
	addccc	%g4,	%l3,	%i7
	brgez	%i3,	loop_1804
	sllx	%g5,	%o4,	%g1
	movrgez	%g7,	%i6,	%l4
	addc	%i2,	%o2,	%i0
loop_1804:
	sir	0x1584
	srlx	%l6,	0x1F,	%o1
	sth	%o3,	[%l7 + 0x24]
	mova	%icc,	%i5,	%g3
	fbu,a	%fcc0,	loop_1805
	bpos,pt	%icc,	loop_1806
	add	%i4,	0x014F,	%o5
	bcs,pt	%xcc,	loop_1807
loop_1805:
	prefetch	[%l7 + 0x14],	 0x0
loop_1806:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x36] %asi,	%o0
loop_1807:
	fba,a	%fcc2,	loop_1808
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%f16
	nop
	setx	0xB40215D238AE36ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f24
loop_1808:
	addccc	%l5,	%g2,	%g6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o7
	tgu	%icc,	0x2
	movrne	%l2,	0x2A4,	%i1
	edge16l	%o6,	%l0,	%g4
	ldd	[%l7 + 0x30],	%l0
	fandnot1	%f14,	%f24,	%f2
	movn	%icc,	%l3,	%i7
	fbuge	%fcc3,	loop_1809
	movcc	%xcc,	%i3,	%o4
	te	%xcc,	0x1
	andncc	%g1,	%g7,	%i6
loop_1809:
	tsubcctv	%l4,	0x1F2F,	%i2
	tn	%icc,	0x4
	fcmpne16	%f12,	%f26,	%g5
	ld	[%l7 + 0x3C],	%f31
	tge	%xcc,	0x0
	fbne,a	%fcc3,	loop_1810
	te	%icc,	0x4
	ble	loop_1811
	bgu,a	%xcc,	loop_1812
loop_1810:
	tle	%xcc,	0x0
	nop
	fitod	%f0,	%f4
	fdtos	%f4,	%f26
loop_1811:
	nop
	set	0x2D, %o2
	ldstuba	[%l7 + %o2] 0x88,	%i0
loop_1812:
	nop
	setx loop_1813, %l0, %l1
	jmpl %l1, %o2
	fbo	%fcc0,	loop_1814
	taddcctv	%o1,	%o3,	%l6
	fpmerge	%f25,	%f17,	%f24
loop_1813:
	edge8l	%g3,	%i4,	%i5
loop_1814:
	lduh	[%l7 + 0x50],	%o0
	set	0x220, %o4
	ldxa	[%g0 + %o4] 0x52,	%l5
	ldsw	[%l7 + 0x3C],	%g2
	movrgez	%o5,	%o7,	%g6
	fbg,a	%fcc2,	loop_1815
	fnand	%f2,	%f16,	%f8
	bvs	loop_1816
	stb	%l2,	[%l7 + 0x77]
loop_1815:
	fmovdg	%xcc,	%f5,	%f27
	mulx	%o6,	%i1,	%g4
loop_1816:
	mulx	%l1,	0x0AC2,	%l3
	fcmpne16	%f4,	%f16,	%i7
	taddcc	%l0,	%o4,	%i3
	tleu	%xcc,	0x3
	edge8	%g7,	%g1,	%i6
	movl	%icc,	%i2,	%g5
	xorcc	%i0,	0x19CB,	%o2
	bleu	loop_1817
	xor	%o1,	%o3,	%l4
	movgu	%icc,	%g3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1817:
	nop
	set	0x7C, %l1
	stw	%i4,	[%l7 + %l1]
	set	0x10, %o1
	sta	%f31,	[%l7 + %o1] 0x88
	call	loop_1818
	taddcc	%i5,	0x03D6,	%l5
	andn	%g2,	%o0,	%o7
	movg	%icc,	%g6,	%l2
loop_1818:
	fmovse	%icc,	%f16,	%f4
	fmovrdgez	%o5,	%f6,	%f12
	udivcc	%o6,	0x1E50,	%i1
	sir	0x13A3
	nop
	fitos	%f11,	%f5
	fstoi	%f5,	%f30
	membar	0x21
	udiv	%g4,	0x00D6,	%l3
	xorcc	%l1,	%i7,	%o4
	movn	%xcc,	%l0,	%i3
	tge	%xcc,	0x3
	fmovdge	%xcc,	%f6,	%f26
	fmovsg	%xcc,	%f20,	%f30
	nop
	setx	0x917A0383,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xE46C76B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f29,	%f23
	stb	%g1,	[%l7 + 0x34]
	edge8ln	%i6,	%i2,	%g5
	brgz,a	%g7,	loop_1819
	edge16ln	%i0,	%o1,	%o2
	bshuffle	%f14,	%f16,	%f6
	alignaddrl	%l4,	%o3,	%l6
loop_1819:
	fpadd16	%f12,	%f8,	%f8
	nop
	setx	0xAA67E487815B4E54,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x19C21E9B8CD5C7F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f12,	%f18
	xorcc	%i4,	0x0B51,	%i5
	fmovse	%icc,	%f31,	%f13
	sdivx	%g3,	0x19B8,	%l5
	umul	%g2,	0x1FCD,	%o0
	movrgez	%o7,	%l2,	%o5
	edge32l	%g6,	%i1,	%g4
	edge8l	%o6,	%l1,	%i7
	bcs	loop_1820
	nop
	setx	0x45F1353C585F2BEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f24
	membar	0x30
	array8	%l3,	%l0,	%o4
loop_1820:
	nop
	set	0x70, %o7
	stxa	%g1,	[%l7 + %o7] 0x81
	umulcc	%i6,	%i3,	%i2
	edge8n	%g7,	%g5,	%i0
	array16	%o2,	%o1,	%o3
	xnorcc	%l4,	%i4,	%i5
	umul	%g3,	0x1CF2,	%l5
	nop
	setx	loop_1821,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x3D, %g6
	ldsb	[%l7 + %g6],	%l6
	edge32l	%g2,	%o0,	%l2
	tle	%icc,	0x6
loop_1821:
	movl	%icc,	%o5,	%g6
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f28
	sir	0x1C1F
	tsubcctv	%o7,	0x0CBC,	%i1
	taddcc	%g4,	0x0EAC,	%l1
	fcmple16	%f2,	%f0,	%o6
	tvs	%icc,	0x5
	ldd	[%l7 + 0x48],	%i6
	addccc	%l0,	0x037E,	%o4
	fpsub16	%f22,	%f26,	%f4
	xnorcc	%g1,	%l3,	%i6
	fornot2	%f2,	%f16,	%f8
	edge16	%i3,	%i2,	%g5
	fmovrdlz	%g7,	%f12,	%f14
	tg	%xcc,	0x6
	umul	%o2,	%i0,	%o3
	xnor	%o1,	%l4,	%i5
	sub	%g3,	0x169A,	%i4
	fbu,a	%fcc2,	loop_1822
	nop
	setx	loop_1823,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivx	%l6,	0x13D3,	%l5
	addcc	%g2,	0x016A,	%o0
loop_1822:
	movrgez	%o5,	0x124,	%g6
loop_1823:
	smul	%o7,	0x0050,	%l2
	tg	%icc,	0x2
	fmovda	%xcc,	%f20,	%f7
	fcmpeq32	%f10,	%f8,	%g4
	tle	%icc,	0x2
	fnot2	%f10,	%f4
	orcc	%i1,	%o6,	%l1
	fmovsgu	%icc,	%f8,	%f14
	movpos	%icc,	%i7,	%l0
	sethi	0x1181,	%g1
	sll	%o4,	0x01,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i6,	0x0F,	%i3
	set	0x18, %o5
	stxa	%i2,	[%l7 + %o5] 0x27
	membar	#Sync
	fmovsl	%xcc,	%f13,	%f2
	taddcctv	%g7,	0x0F26,	%o2
	tl	%icc,	0x4
	std	%f6,	[%l7 + 0x78]
	addc	%i0,	0x1BE1,	%o3
	movrgez	%o1,	%l4,	%i5
	tn	%icc,	0x7
	st	%f3,	[%l7 + 0x64]
	brlez	%g3,	loop_1824
	movrgez	%g5,	%i4,	%l6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
loop_1824:
	sub	%g2,	%o0,	%g6
	mova	%xcc,	%o7,	%o5
	fnot2	%f0,	%f26
	edge8n	%l2,	%i1,	%g4
	fmovdpos	%xcc,	%f21,	%f19
	movrgez	%l1,	%i7,	%l0
	movrlez	%o6,	0x1B8,	%o4
	andcc	%l3,	%g1,	%i3
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bvc,pn	%icc,	loop_1825
	srl	%i2,	0x10,	%g7
	fnands	%f25,	%f1,	%f15
	movg	%xcc,	%o2,	%i0
loop_1825:
	addcc	%i6,	%o1,	%l4
	fmovdl	%xcc,	%f15,	%f30
	ldd	[%l7 + 0x18],	%f0
	alignaddrl	%o3,	%g3,	%g5
	movl	%icc,	%i5,	%i4
	fandnot1	%f12,	%f0,	%f4
	tne	%xcc,	0x0
	orn	%l5,	0x1676,	%l6
	fpmerge	%f12,	%f0,	%f10
	or	%o0,	%g2,	%o7
	fbe	%fcc0,	loop_1826
	udiv	%g6,	0x0735,	%o5
	brlez	%l2,	loop_1827
	movleu	%xcc,	%i1,	%l1
loop_1826:
	tg	%xcc,	0x2
	edge32ln	%g4,	%i7,	%l0
loop_1827:
	fpadd16	%f20,	%f14,	%f4
	fmovrsne	%o6,	%f18,	%f5
	ta	%icc,	0x7
	tcc	%icc,	0x0
	orncc	%l3,	0x17BD,	%o4
	umul	%g1,	0x0091,	%i3
	edge8l	%i2,	%g7,	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i0,	%o1
	fbuge,a	%fcc0,	loop_1828
	edge8	%i6,	%l4,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x5
loop_1828:
	nop
	setx	0xDBE22DDEF45645F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xA4F59D906DA17B32,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f18,	%f14
	fmovsg	%icc,	%f28,	%f7
	movvc	%xcc,	%g5,	%i5
	tleu	%xcc,	0x4
	ldsw	[%l7 + 0x70],	%i4
	bvs,a	loop_1829
	tl	%icc,	0x4
	fbuge,a	%fcc2,	loop_1830
	nop
	setx	0x9AE9C9961054D64E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_1829:
	fbl,a	%fcc1,	loop_1831
	move	%xcc,	%o3,	%l5
loop_1830:
	fxnors	%f8,	%f14,	%f4
	tleu	%xcc,	0x4
loop_1831:
	lduh	[%l7 + 0x36],	%o0
	fmovdneg	%icc,	%f22,	%f9
	mulx	%g2,	0x00F1,	%o7
	sdiv	%g6,	0x01B2,	%l6
	ldsw	[%l7 + 0x60],	%l2
	sdiv	%i1,	0x052A,	%o5
	nop
	setx	0x87D65EBD60545E30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	brgz,a	%l1,	loop_1832
	tvs	%xcc,	0x0
	andn	%i7,	0x010E,	%g4
	tneg	%xcc,	0x4
loop_1832:
	lduw	[%l7 + 0x68],	%o6
	call	loop_1833
	edge32ln	%l0,	%o4,	%l3
	set	0x3C, %o3
	sta	%f16,	[%l7 + %o3] 0x15
loop_1833:
	mulscc	%g1,	0x0D9C,	%i3
	srlx	%i2,	0x04,	%o2
	movcc	%icc,	%i0,	%o1
	edge16n	%g7,	%l4,	%g3
	fbe,a	%fcc3,	loop_1834
	sub	%i6,	%g5,	%i5
	sdiv	%i4,	0x0BDC,	%l5
	brnz,a	%o0,	loop_1835
loop_1834:
	xorcc	%o3,	0x0CDC,	%o7
	nop
	setx	loop_1836,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%g6,	%g2,	%l6
loop_1835:
	umulcc	%i1,	0x1D37,	%l2
	ba,a,pn	%xcc,	loop_1837
loop_1836:
	movre	%l1,	0x12E,	%o5
	edge32l	%i7,	%g4,	%l0
	taddcctv	%o6,	%l3,	%g1
loop_1837:
	srax	%i3,	0x13,	%o4
	fnands	%f3,	%f2,	%f7
	tneg	%xcc,	0x6
	addcc	%i2,	0x07FD,	%o2
	addcc	%o1,	0x0CB3,	%i0
	movpos	%icc,	%g7,	%g3
	srlx	%l4,	0x0D,	%i6
	tcc	%icc,	0x7
	tleu	%icc,	0x7
	stx	%g5,	[%l7 + 0x70]
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x89,	%i4
	mulx	%i5,	0x095C,	%l5
	wr	%g0,	0x0c,	%asi
	sta	%f17,	[%l7 + 0x34] %asi
	faligndata	%f12,	%f8,	%f6
	array32	%o0,	%o7,	%g6
	nop
	setx	loop_1838,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%g2,	0x1FC2,	%l6
	fpack16	%f28,	%f27
	fbl,a	%fcc1,	loop_1839
loop_1838:
	nop
	set	0x20, %i0
	stx	%o3,	[%l7 + %i0]
	edge8l	%i1,	%l1,	%o5
	brz	%i7,	loop_1840
loop_1839:
	movle	%icc,	%l2,	%g4
	movl	%xcc,	%o6,	%l0
	udivx	%l3,	0x1EA5,	%i3
loop_1840:
	fbule,a	%fcc0,	loop_1841
	sllx	%o4,	0x06,	%i2
	fnors	%f14,	%f9,	%f21
	fpsub32	%f16,	%f20,	%f6
loop_1841:
	nop
	setx	0x864353D64046B82E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movre	%o2,	%g1,	%o1
	tcs	%xcc,	0x2
	set	0x72, %l4
	stha	%g7,	[%l7 + %l4] 0x0c
	bleu,a	loop_1842
	edge16n	%i0,	%g3,	%l4
	movrlez	%i6,	%g5,	%i4
	move	%icc,	%i5,	%l5
loop_1842:
	tvc	%icc,	0x4
	sra	%o7,	%o0,	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l6
	nop
	fitos	%f3,	%f18
	fstod	%f18,	%f2
	fand	%f6,	%f24,	%f20
	nop
	setx	0x505161F8,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	movrgz	%g6,	0x32C,	%o3
	sdivx	%i1,	0x1189,	%l1
	tne	%icc,	0x7
	subcc	%o5,	%i7,	%l2
	movrne	%o6,	0x2D5,	%g4
	fbg	%fcc1,	loop_1843
	sllx	%l3,	0x0B,	%i3
	ldsh	[%l7 + 0x2E],	%l0
	fmovsneg	%icc,	%f6,	%f25
loop_1843:
	nop
	set	0x10, %g2
	lduh	[%l7 + %g2],	%i2
	membar	0x22
	addccc	%o2,	0x0BFD,	%o4
	srl	%g1,	0x07,	%o1
	sub	%g7,	0x1B3A,	%g3
	set	0x48, %i4
	lduha	[%l7 + %i4] 0x0c,	%i0
	fmul8sux16	%f18,	%f18,	%f26
	set	0x3B, %l5
	stba	%l4,	[%l7 + %l5] 0x27
	membar	#Sync
	srl	%i6,	0x13,	%g5
	stbar
	umul	%i5,	%i4,	%l5
	bn,a,pn	%xcc,	loop_1844
	fzeros	%f21
	sir	0x134C
	fbl,a	%fcc3,	loop_1845
loop_1844:
	nop
	setx	0xF5CB288F2FBF9DE3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x242C67359D2AF030,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f24,	%f4
	set	0x16, %o0
	ldsba	[%l7 + %o0] 0x11,	%o7
loop_1845:
	ld	[%l7 + 0x18],	%f26
	or	%o0,	0x0509,	%g2
	edge16n	%g6,	%l6,	%o3
	fbul	%fcc0,	loop_1846
	tgu	%xcc,	0x0
	fsrc1	%f8,	%f6
	orncc	%i1,	0x02A3,	%o5
loop_1846:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x04,	%i7,	%l1
	udiv	%l2,	0x17B0,	%o6
	edge8	%l3,	%i3,	%l0
	brlz,a	%g4,	loop_1847
	stbar
	fnor	%f18,	%f2,	%f10
	movn	%xcc,	%i2,	%o4
loop_1847:
	nop
	setx	loop_1848,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%g1,	0x1264,	%o1
	nop
	set	0x58, %o6
	ldsw	[%l7 + %o6],	%g7
	srlx	%o2,	0x1A,	%i0
loop_1848:
	fmul8x16al	%f7,	%f2,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc0,	loop_1849
	edge8ln	%l4,	%g3,	%g5
	movpos	%xcc,	%i6,	%i4
	fone	%f30
loop_1849:
	flush	%l7 + 0x24
	fornot2	%f6,	%f12,	%f8
	fandnot1	%f18,	%f16,	%f14
	fbge,a	%fcc0,	loop_1850
	array8	%l5,	%o7,	%i5
	edge16l	%g2,	%g6,	%o0
	orcc	%l6,	0x01C4,	%i1
loop_1850:
	taddcctv	%o5,	%o3,	%i7
	be,a	loop_1851
	lduw	[%l7 + 0x28],	%l2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x13] %asi,	%l1
loop_1851:
	std	%f0,	[%l7 + 0x60]
	add	%o6,	%l3,	%l0
	movrlz	%i3,	%g4,	%i2
	fmovrdlz	%g1,	%f30,	%f26
	fmovsne	%icc,	%f18,	%f19
	edge16ln	%o4,	%o1,	%o2
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i0
	movn	%icc,	%g7,	%g3
	move	%icc,	%g5,	%l4
	tvs	%icc,	0x2
	fmovrsgez	%i4,	%f12,	%f13
	fmovsle	%icc,	%f26,	%f28
	movrlez	%l5,	0x219,	%o7
	movvc	%icc,	%i5,	%i6
	membar	0x12
	mova	%icc,	%g6,	%g2
	movneg	%xcc,	%l6,	%o0
	fpadd16s	%f19,	%f23,	%f8
	tleu	%xcc,	0x5
	addccc	%o5,	%o3,	%i7
	wr	%g0,	0x18,	%asi
	stba	%l2,	[%l7 + 0x60] %asi
	orncc	%i1,	0x059E,	%o6
	st	%f15,	[%l7 + 0x2C]
	fnands	%f2,	%f3,	%f12
	fpsub16s	%f5,	%f0,	%f6
	bvs	%xcc,	loop_1852
	fmovdgu	%xcc,	%f26,	%f11
	tgu	%xcc,	0x4
	movg	%icc,	%l1,	%l0
loop_1852:
	fmovrsgz	%i3,	%f21,	%f12
	fmovdvs	%icc,	%f2,	%f4
	movrgez	%g4,	0x288,	%l3
	fnands	%f5,	%f2,	%f20
	wr	%g0,	0x2b,	%asi
	stwa	%i2,	[%l7 + 0x08] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %l3
	lduha	[%l7 + %l3] 0x15,	%o4
	udivcc	%o1,	0x11E1,	%o2
	ld	[%l7 + 0x10],	%f4
	tsubcc	%g1,	0x15E2,	%g7
	movg	%xcc,	%g3,	%i0
	brlz,a	%l4,	loop_1853
	tg	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x74] %asi,	%f4
loop_1853:
	edge8ln	%i4,	%l5,	%g5
	brgez	%i5,	loop_1854
	fpmerge	%f15,	%f0,	%f10
	alignaddrl	%i6,	%o7,	%g6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%l6
loop_1854:
	xnorcc	%o0,	%g2,	%o3
	fcmple32	%f4,	%f24,	%o5
	array16	%i7,	%i1,	%l2
	brlez	%l1,	loop_1855
	orcc	%o6,	%l0,	%i3
	srl	%l3,	0x00,	%i2
	array32	%o4,	%o1,	%o2
loop_1855:
	subcc	%g1,	%g4,	%g7
	fpsub32	%f24,	%f26,	%f10
	taddcctv	%g3,	0x119D,	%l4
	tne	%xcc,	0x4
	bleu	loop_1856
	sll	%i0,	%i4,	%g5
	fmovsvc	%icc,	%f21,	%f30
	fpsub32	%f2,	%f26,	%f8
loop_1856:
	movvc	%icc,	%i5,	%l5
	tneg	%icc,	0x7
	or	%o7,	%i6,	%l6
	movleu	%icc,	%o0,	%g6
	fmul8x16au	%f16,	%f17,	%f0
	ta	%xcc,	0x7
	nop
	set	0x44, %l6
	sth	%g2,	[%l7 + %l6]
	movcs	%xcc,	%o3,	%i7
	fpadd16	%f26,	%f4,	%f0
	fmul8x16	%f22,	%f20,	%f22
	sub	%o5,	0x10D8,	%i1
	set	0x40, %g7
	sta	%f3,	[%l7 + %g7] 0x19
	nop
	setx	0x31A26E99AD72C9F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f10
	array16	%l2,	%l1,	%o6
	pdist	%f14,	%f30,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l0,	%l3
	set	0x23, %i1
	lduba	[%l7 + %i1] 0x18,	%i3
	udivcc	%o4,	0x136A,	%i2
	tn	%icc,	0x0
	fmovdneg	%xcc,	%f6,	%f31
	xnor	%o1,	%g1,	%o2
	st	%f14,	[%l7 + 0x0C]
	bleu	%xcc,	loop_1857
	fbg,a	%fcc2,	loop_1858
	umul	%g4,	%g7,	%l4
	fmovrdlz	%i0,	%f20,	%f24
loop_1857:
	ta	%icc,	0x7
loop_1858:
	brz,a	%i4,	loop_1859
	fmovdg	%xcc,	%f12,	%f9
	fcmpgt16	%f24,	%f8,	%g5
	tsubcc	%g3,	%l5,	%i5
loop_1859:
	nop
	setx	0x460FD94B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f27
	fmovrsgez	%o7,	%f17,	%f31
	edge32	%l6,	%i6,	%g6
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x0c
	edge32ln	%o0,	%g2,	%i7
	array8	%o5,	%i1,	%o3
	tl	%xcc,	0x6
	array16	%l1,	%l2,	%o6
	andncc	%l3,	%i3,	%o4
	tleu	%icc,	0x4
	popc	0x1FB7,	%l0
	sdivcc	%o1,	0x0F17,	%g1
	tsubcc	%o2,	%g4,	%g7
	bl,pn	%icc,	loop_1860
	fmovdle	%icc,	%f26,	%f30
	stbar
	array16	%i2,	%l4,	%i0
loop_1860:
	movre	%i4,	%g3,	%g5
	fandnot1	%f30,	%f22,	%f0
	xnor	%i5,	%o7,	%l5
	for	%f20,	%f28,	%f20
	tneg	%icc,	0x1
	edge32l	%l6,	%g6,	%o0
	ta	%icc,	0x5
	movpos	%icc,	%g2,	%i7
	srlx	%o5,	%i1,	%o3
	nop
	setx	0x71BCE781,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x7CECA393,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f20,	%f23
	ld	[%l7 + 0x60],	%f7
	fmovsle	%icc,	%f4,	%f30
	bl,a	loop_1861
	tsubcc	%l1,	0x0300,	%l2
	fmovdcc	%xcc,	%f26,	%f12
	tleu	%icc,	0x5
loop_1861:
	sdiv	%i6,	0x1DFB,	%l3
	sethi	0x17AA,	%o6
	brlez	%o4,	loop_1862
	fmovrdlz	%l0,	%f4,	%f6
	fmul8x16al	%f1,	%f31,	%f26
	movleu	%icc,	%i3,	%g1
loop_1862:
	sra	%o1,	%g4,	%o2
	fpackfix	%f26,	%f11
	fmovdcc	%icc,	%f0,	%f17
	mova	%xcc,	%i2,	%l4
	tvc	%xcc,	0x3
	movle	%icc,	%g7,	%i0
	bcc,a,pt	%xcc,	loop_1863
	tl	%icc,	0x4
	srax	%g3,	%i4,	%g5
	membar	0x1B
loop_1863:
	nop
	setx	0x606AD655,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	lduh	[%l7 + 0x6E],	%o7
	stx	%l5,	[%l7 + 0x18]
	sir	0x121C
	movge	%icc,	%i5,	%l6
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g6
	tne	%icc,	0x6
	fpackfix	%f12,	%f0
	tg	%xcc,	0x5
	fmovdl	%xcc,	%f5,	%f22
	addccc	%o0,	0x1576,	%i7
	ldsw	[%l7 + 0x28],	%g2
	fbne,a	%fcc0,	loop_1864
	movg	%icc,	%i1,	%o3
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x19
loop_1864:
	addccc	%l1,	0x03CD,	%o5
	nop
	setx	0x0EA4033D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x80209AF5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f11,	%f27
	movneg	%icc,	%l2,	%i6
	edge32	%l3,	%o6,	%l0
	sllx	%i3,	%g1,	%o4
	tcs	%icc,	0x7
	brlz,a	%g4,	loop_1865
	sethi	0x14BD,	%o1
	movle	%xcc,	%o2,	%i2
	xor	%l4,	0x1C48,	%g7
loop_1865:
	fmovdg	%icc,	%f8,	%f9
	membar	0x61
	fmovspos	%xcc,	%f26,	%f5
	brgez,a	%i0,	loop_1866
	tle	%icc,	0x2
	fsrc2s	%f0,	%f28
	addc	%g3,	0x149E,	%g5
loop_1866:
	nop
	fitos	%f5,	%f23
	fstox	%f23,	%f12
	fxtos	%f12,	%f31
	nop
	setx loop_1867, %l0, %l1
	jmpl %l1, %i4
	call	loop_1868
	taddcc	%o7,	0x0F88,	%i5
	subccc	%l5,	0x04CE,	%g6
loop_1867:
	edge8	%l6,	%i7,	%g2
loop_1868:
	lduw	[%l7 + 0x68],	%o0
	bne,a	loop_1869
	edge8	%i1,	%l1,	%o5
	smulcc	%l2,	%i6,	%l3
	fble,a	%fcc1,	loop_1870
loop_1869:
	andn	%o3,	0x1BF6,	%l0
	sethi	0x1BE1,	%o6
	nop
	setx	0xD89DCFB13FE1655C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xA765B02B15C24A78,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f12,	%f10
loop_1870:
	tcs	%xcc,	0x6
	xorcc	%g1,	%i3,	%g4
	array16	%o4,	%o2,	%i2
	fmul8x16au	%f15,	%f30,	%f6
	bvs,pt	%xcc,	loop_1871
	movneg	%icc,	%l4,	%o1
	udivx	%i0,	0x1A70,	%g3
	array8	%g7,	%i4,	%g5
loop_1871:
	add	%i5,	%o7,	%l5
	tsubcctv	%l6,	0x019D,	%g6
	bleu,pt	%xcc,	loop_1872
	fnegs	%f20,	%f0
	membar	0x13
	fnands	%f3,	%f0,	%f9
loop_1872:
	fbe	%fcc2,	loop_1873
	tgu	%icc,	0x6
	fbn	%fcc1,	loop_1874
	array8	%i7,	%o0,	%g2
loop_1873:
	tcc	%icc,	0x3
	tsubcc	%l1,	%o5,	%i1
loop_1874:
	fand	%f16,	%f20,	%f22
	alignaddr	%i6,	%l3,	%l2
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x50] %asi,	%l0
	stb	%o6,	[%l7 + 0x1D]
	call	loop_1875
	fnors	%f19,	%f24,	%f9
	brgez	%g1,	loop_1876
	fcmpne16	%f20,	%f30,	%i3
loop_1875:
	edge16ln	%g4,	%o3,	%o4
	bneg,pt	%icc,	loop_1877
loop_1876:
	edge16n	%o2,	%l4,	%i2
	brgz,a	%i0,	loop_1878
	stx	%o1,	[%l7 + 0x78]
loop_1877:
	smulcc	%g7,	%i4,	%g5
	te	%xcc,	0x0
loop_1878:
	tne	%icc,	0x3
	array16	%i5,	%o7,	%g3
	udivx	%l6,	0x0A9D,	%l5
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i7
	brlz,a	%g6,	loop_1879
	tvc	%icc,	0x6
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
	sub	%g2,	%l1,	%o5
loop_1879:
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f24
	bcc	loop_1881
loop_1880:
	sdiv	%i1,	0x1169,	%o0
	st	%f29,	[%l7 + 0x5C]
	nop
	set	0x48, %g1
	ldsw	[%l7 + %g1],	%i6
loop_1881:
	movneg	%icc,	%l2,	%l3
	xnorcc	%l0,	0x1A8D,	%o6
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	be	loop_1882
	fsrc2s	%f24,	%f16
	movg	%xcc,	%g1,	%i3
	array16	%o3,	%o4,	%o2
loop_1882:
	xor	%l4,	0x1A5B,	%g4
	movcs	%xcc,	%i0,	%o1
	sllx	%i2,	0x16,	%g7
	fmovrdlz	%i4,	%f6,	%f30
	set	0x62, %i5
	lduha	[%l7 + %i5] 0x0c,	%i5
	fandnot1	%f20,	%f20,	%f12
	lduh	[%l7 + 0x4C],	%o7
	fnors	%f16,	%f12,	%f9
	subccc	%g5,	0x06D6,	%l6
	fmovdcs	%xcc,	%f17,	%f14
	brgez,a	%l5,	loop_1883
	subc	%g3,	%i7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l1,	%g6,	%i1
loop_1883:
	taddcctv	%o0,	%o5,	%l2
	mova	%icc,	%i6,	%l0
	ldsh	[%l7 + 0x20],	%l3
	andncc	%g1,	%i3,	%o3
	sllx	%o4,	0x0F,	%o6
	fmul8x16al	%f10,	%f9,	%f6
	movl	%xcc,	%l4,	%g4
	fmovscc	%icc,	%f14,	%f19
	nop
	setx	0xEB4BBF51EDB78E60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x0524CBDD737C24D9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f6,	%f18
	fandnot2	%f24,	%f4,	%f8
	swap	[%l7 + 0x68],	%o2
	alignaddrl	%i0,	%i2,	%o1
	bgu,pt	%icc,	loop_1884
	edge32n	%i4,	%i5,	%g7
	ldx	[%l7 + 0x38],	%o7
	fbne,a	%fcc2,	loop_1885
loop_1884:
	fmovdle	%icc,	%f5,	%f12
	addc	%l6,	%l5,	%g5
	addcc	%i7,	0x1D8E,	%g3
loop_1885:
	mova	%xcc,	%l1,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i1,	0x0AED,	%g6
	xnorcc	%o5,	%l2,	%i6
	be,pt	%xcc,	loop_1886
	bneg	loop_1887
	bvs,a	%xcc,	loop_1888
	movvc	%xcc,	%l0,	%l3
loop_1886:
	edge32ln	%g1,	%i3,	%o3
loop_1887:
	movleu	%xcc,	%o0,	%o4
loop_1888:
	edge32ln	%o6,	%g4,	%l4
	bcs	loop_1889
	tcs	%xcc,	0x0
	tneg	%xcc,	0x7
	mulx	%i0,	%o2,	%i2
loop_1889:
	tneg	%xcc,	0x6
	brz,a	%i4,	loop_1890
	fnegd	%f30,	%f14
	movre	%i5,	0x293,	%o1
	fmovdg	%xcc,	%f20,	%f20
loop_1890:
	fmovdleu	%xcc,	%f22,	%f8
	udivcc	%o7,	0x0AFE,	%g7
	fnot1s	%f15,	%f0
	movrne	%l5,	0x2AE,	%g5
	swap	[%l7 + 0x30],	%i7
	edge32n	%l6,	%l1,	%g2
	xnor	%i1,	0x0F9B,	%g6
	udivx	%o5,	0x0D53,	%g3
	move	%icc,	%i6,	%l0
	fbg,a	%fcc0,	loop_1891
	swap	[%l7 + 0x0C],	%l2
	tl	%icc,	0x1
	sdivx	%l3,	0x092B,	%g1
loop_1891:
	movvs	%xcc,	%i3,	%o0
	srlx	%o4,	0x06,	%o3
	nop
	setx	0xCCC6B5E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x035FE6C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f31,	%f10
	or	%o6,	%g4,	%l4
	popc	%o2,	%i2
	fmovsvc	%xcc,	%f9,	%f20
	brlz,a	%i0,	loop_1892
	edge8	%i4,	%o1,	%o7
	array8	%g7,	%l5,	%g5
	fors	%f1,	%f0,	%f27
loop_1892:
	add	%i7,	0x1363,	%i5
	movpos	%xcc,	%l1,	%l6
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xe2,	%i0
	movrgez	%g6,	%g2,	%o5
	movge	%xcc,	%i6,	%g3
	wr	%g0,	0x89,	%asi
	stha	%l2,	[%l7 + 0x76] %asi
	fmovs	%f19,	%f5
	movrne	%l3,	0x273,	%l0
	andcc	%i3,	0x14E2,	%g1
	tg	%xcc,	0x4
	fnot1s	%f4,	%f20
	fmovse	%icc,	%f31,	%f24
	edge16	%o4,	%o3,	%o0
	andncc	%g4,	%l4,	%o6
	alignaddrl	%i2,	%i0,	%i4
	nop
	fitod	%f10,	%f20
	fdtox	%f20,	%f14
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%o7
	fnot1	%f20,	%f4
	fmovrdgez	%g7,	%f10,	%f12
	ldsh	[%l7 + 0x48],	%o2
	movge	%xcc,	%g5,	%l5
	brgz,a	%i5,	loop_1893
	ble,a,pt	%icc,	loop_1894
	brgez,a	%l1,	loop_1895
	addc	%l6,	%i1,	%i7
loop_1893:
	fabss	%f3,	%f4
loop_1894:
	ldstub	[%l7 + 0x5A],	%g6
loop_1895:
	movgu	%icc,	%o5,	%g2
	set	0x0D, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i6
	fpsub16	%f22,	%f0,	%f14
	tn	%xcc,	0x3
	udivcc	%g3,	0x0A4C,	%l2
	tvs	%icc,	0x4
	fmovdcs	%icc,	%f24,	%f8
	movleu	%icc,	%l0,	%i3
	brgz,a	%l3,	loop_1896
	sdivcc	%o4,	0x1282,	%o3
	movrgez	%g1,	%g4,	%l4
	tg	%icc,	0x2
loop_1896:
	andn	%o0,	0x02D1,	%o6
	array32	%i0,	%i4,	%i2
	tpos	%xcc,	0x7
	movrgez	%o1,	0x371,	%o7
	swap	[%l7 + 0x4C],	%g7
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f12
	fxor	%f10,	%f28,	%f18
	tsubcc	%o2,	%g5,	%l5
	xorcc	%l1,	0x0701,	%i5
	stbar
	srlx	%l6,	%i7,	%i1
	fmovdcc	%icc,	%f15,	%f20
	movne	%xcc,	%o5,	%g2
	xor	%i6,	0x1971,	%g3
	tcc	%xcc,	0x5
	std	%f20,	[%l7 + 0x28]
	xor	%l2,	%l0,	%g6
	movrlez	%i3,	0x12D,	%o4
	fxnors	%f27,	%f21,	%f24
	wr	%g0,	0x88,	%asi
	sta	%f15,	[%l7 + 0x58] %asi
	fpsub32s	%f14,	%f25,	%f10
	fcmpeq32	%f24,	%f10,	%l3
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o3
	edge32n	%g4,	%l4,	%o0
	fmovs	%f20,	%f3
	xorcc	%o6,	%i0,	%g1
	fbue,a	%fcc1,	loop_1897
	taddcctv	%i2,	%i4,	%o1
	and	%g7,	0x008A,	%o7
	fbule,a	%fcc1,	loop_1898
loop_1897:
	fnot2s	%f16,	%f8
	subc	%g5,	%o2,	%l5
	fpack32	%f6,	%f22,	%f0
loop_1898:
	fmovrdlez	%l1,	%f30,	%f0
	nop
	setx	0x03BC7A4B40406C8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movvc	%icc,	%i5,	%l6
	fmovda	%icc,	%f10,	%f22
	movgu	%xcc,	%i1,	%i7
	tleu	%xcc,	0x2
	wr	%g0,	0x23,	%asi
	stba	%g2,	[%l7 + 0x68] %asi
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f0
	addcc	%i6,	%g3,	%l2
	addcc	%o5,	%l0,	%i3
	addcc	%o4,	0x100B,	%l3
	fbue	%fcc2,	loop_1899
	fmovsg	%xcc,	%f28,	%f27
	set	0x30, %o2
	ldsha	[%l7 + %o2] 0x15,	%g6
loop_1899:
	umul	%g4,	%o3,	%l4
	movrgez	%o6,	0x2DE,	%i0
	bvs,a	loop_1900
	fmovsa	%icc,	%f9,	%f24
	fmovdvc	%xcc,	%f18,	%f29
	edge8l	%o0,	%i2,	%i4
loop_1900:
	alignaddr	%g1,	%o1,	%o7
	edge8n	%g7,	%g5,	%l5
	array16	%l1,	%o2,	%i5
	nop
	setx	0x005E3564,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	mulscc	%i1,	%l6,	%g2
	fnegd	%f20,	%f18
	membar	0x2D
	edge8ln	%i7,	%i6,	%g3
	edge16ln	%l2,	%o5,	%i3
	fmovdn	%icc,	%f27,	%f9
	ldsh	[%l7 + 0x68],	%l0
	fpsub32	%f14,	%f2,	%f22
	xor	%o4,	%l3,	%g4
	fble,a	%fcc0,	loop_1901
	movrgz	%g6,	0x0DE,	%o3
	subc	%l4,	%i0,	%o6
	nop
	setx	0x677342AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f4
loop_1901:
	fmovsneg	%xcc,	%f12,	%f4
	fand	%f6,	%f22,	%f14
	fmovsvc	%icc,	%f8,	%f26
	nop
	setx	loop_1902,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%o0,	%i4,	%g1
	stbar
	fmovrdlz	%i2,	%f30,	%f26
loop_1902:
	movl	%xcc,	%o1,	%o7
	sllx	%g5,	%l5,	%g7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o2
	fcmple16	%f14,	%f10,	%i5
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f9
	array16	%l1,	%i1,	%g2
	sethi	0x1340,	%i7
	udivx	%l6,	0x15DF,	%i6
	tleu	%xcc,	0x2
	fpack32	%f14,	%f10,	%f26
	addccc	%g3,	%l2,	%o5
	fbo,a	%fcc0,	loop_1903
	nop
	setx	0x6D68CE0B3EA9B952,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDEA0F54B187C767D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f14,	%f28
	srax	%i3,	0x0C,	%o4
	edge8	%l3,	%g4,	%g6
loop_1903:
	fornot1	%f6,	%f26,	%f16
	movrgz	%o3,	0x34B,	%l4
	addcc	%i0,	%o6,	%l0
	umulcc	%i4,	%o0,	%g1
	nop
	set	0x1C, %i7
	prefetch	[%l7 + %i7],	 0x2
	or	%o1,	%o7,	%i2
	bne,pt	%icc,	loop_1904
	fmovrsgz	%g5,	%f10,	%f19
	fbl	%fcc3,	loop_1905
	edge16ln	%g7,	%o2,	%l5
loop_1904:
	taddcctv	%i5,	%i1,	%l1
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g2
loop_1905:
	nop
	set	0x0, %l1
	stxa	%i7,	[%g0 + %l1] 0x57
	addccc	%i6,	0x042F,	%g3
	wr	%g0,	0x81,	%asi
	stba	%l2,	[%l7 + 0x5D] %asi
	movge	%xcc,	%l6,	%i3
	srax	%o4,	%l3,	%g4
	tvc	%icc,	0x2
	and	%g6,	0x0140,	%o5
	membar	0x7D
	nop
	fitod	%f0,	%f8
	fdtos	%f8,	%f11
	fmovdpos	%xcc,	%f27,	%f25
	xnor	%l4,	0x0E3C,	%o3
	movle	%xcc,	%i0,	%o6
	fbge	%fcc1,	loop_1906
	tneg	%xcc,	0x5
	movle	%icc,	%i4,	%l0
	array16	%o0,	%g1,	%o1
loop_1906:
	edge8l	%o7,	%i2,	%g7
	fmovdge	%icc,	%f29,	%f10
	bl,pn	%icc,	loop_1907
	fsrc2s	%f1,	%f27
	fnot1s	%f12,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1907:
	movrlz	%g5,	0x14E,	%o2
	fmovsa	%xcc,	%f4,	%f2
	edge16n	%l5,	%i5,	%l1
	set	0x11, %o4
	stba	%g2,	[%l7 + %o4] 0xeb
	membar	#Sync
	fbe,a	%fcc0,	loop_1908
	fabss	%f14,	%f4
	add	%i1,	%i6,	%g3
	ba	loop_1909
loop_1908:
	udivcc	%l2,	0x05DC,	%l6
	srlx	%i3,	%i7,	%o4
	or	%l3,	0x1806,	%g6
loop_1909:
	orn	%g4,	%l4,	%o3
	movre	%i0,	0x032,	%o6
	and	%i4,	0x1752,	%l0
	movle	%xcc,	%o5,	%o0
	fmovdgu	%xcc,	%f25,	%f28
	bge	loop_1910
	fexpand	%f4,	%f4
	tvs	%xcc,	0x3
	nop
	setx	0x96BF290D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xF59272DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f24,	%f20
loop_1910:
	fba,a	%fcc0,	loop_1911
	smulcc	%g1,	%o7,	%o1
	movre	%g7,	%g5,	%o2
	fsrc2s	%f5,	%f31
loop_1911:
	tcs	%icc,	0x3
	fmovrdgz	%l5,	%f26,	%f20
	fmovsg	%xcc,	%f22,	%f5
	lduh	[%l7 + 0x24],	%i2
	mova	%xcc,	%i5,	%l1
	array32	%i1,	%g2,	%i6
	mova	%icc,	%l2,	%l6
	andn	%g3,	0x097D,	%i3
	tvc	%xcc,	0x4
	fmovde	%xcc,	%f15,	%f27
	sdivcc	%o4,	0x0C56,	%i7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f3
	brgz,a	%l3,	loop_1912
	tne	%xcc,	0x6
	umul	%g4,	%l4,	%o3
	bcs,a,pn	%xcc,	loop_1913
loop_1912:
	edge8ln	%i0,	%o6,	%g6
	te	%icc,	0x1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%o5
loop_1913:
	ble	loop_1914
	tleu	%xcc,	0x4
	xnorcc	%l0,	%o0,	%o7
	movcc	%xcc,	%o1,	%g1
loop_1914:
	stbar
	subcc	%g5,	%g7,	%o2
	sdiv	%l5,	0x170F,	%i5
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f16
	tvc	%xcc,	0x0
	nop
	setx	0x6D42FE21F07F2C42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xDFFC51ED283CC56A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f2,	%f24
	movleu	%icc,	%i2,	%l1
	movrlz	%g2,	0x315,	%i1
	movrgz	%l2,	%i6,	%l6
	alignaddr	%g3,	%o4,	%i7
	smulcc	%l3,	%g4,	%i3
	nop
	setx	0xC0B3E820207AACFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	edge32	%o3,	%i0,	%o6
	bpos,a	%icc,	loop_1915
	nop
	setx	0xB139A3B9307F2A19,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	movleu	%icc,	%l4,	%g6
	ble,pn	%icc,	loop_1916
loop_1915:
	orn	%o5,	%l0,	%i4
	edge32ln	%o0,	%o1,	%g1
	bg,a	loop_1917
loop_1916:
	nop
	setx	loop_1918,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%icc,	0x7
	edge32l	%o7,	%g7,	%g5
loop_1917:
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f24
loop_1918:
	edge16	%l5,	%o2,	%i5
	fornot1s	%f18,	%f15,	%f9
	subc	%l1,	0x15A0,	%g2
	fxor	%f30,	%f14,	%f24
	movg	%xcc,	%i1,	%l2
	movcc	%xcc,	%i2,	%l6
	tl	%icc,	0x5
	nop
	setx	0x4E3C21E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f3
	set	0x08, %o7
	lda	[%l7 + %o7] 0x0c,	%f29
	edge8	%i6,	%g3,	%i7
	fbule,a	%fcc2,	loop_1919
	xorcc	%o4,	0x0BA7,	%g4
	fnegs	%f17,	%f11
	edge16l	%i3,	%o3,	%l3
loop_1919:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o6
	fabsd	%f18,	%f18
	ldsb	[%l7 + 0x3F],	%l4
	movcs	%xcc,	%g6,	%o5
	tle	%xcc,	0x6
	fandnot2	%f16,	%f20,	%f24
	edge8l	%l0,	%i0,	%i4
	orncc	%o0,	%g1,	%o1
	tge	%xcc,	0x7
	stbar
	fxor	%f28,	%f16,	%f2
	tl	%xcc,	0x1
	movpos	%icc,	%g7,	%o7
	sdivcc	%l5,	0x0E78,	%g5
	nop
	setx	0xB077BF4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%i5
	alignaddr	%l1,	%o2,	%i1
	tn	%xcc,	0x2
	xor	%l2,	0x172F,	%i2
	tsubcc	%g2,	0x0528,	%i6
	sdivx	%g3,	0x0323,	%l6
	nop
	fitod	%f6,	%f28
	fdtos	%f28,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o4,	%g4,	%i3
	sll	%i7,	%o3,	%l3
	orcc	%l4,	0x0B0F,	%g6
	movge	%icc,	%o5,	%o6
	xorcc	%l0,	0x0B90,	%i0
	orcc	%i4,	%o0,	%g1
	edge32	%g7,	%o7,	%l5
	array32	%g5,	%i5,	%l1
	edge8l	%o2,	%i1,	%o1
	fsrc2	%f24,	%f8
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x78] %asi,	%l2
	bpos,pn	%xcc,	loop_1920
	movrne	%i2,	%i6,	%g3
	fmul8x16au	%f28,	%f25,	%f6
	movrlez	%g2,	%l6,	%g4
loop_1920:
	sdivx	%i3,	0x1BB8,	%i7
	movge	%icc,	%o3,	%o4
	tsubcctv	%l3,	0x1C57,	%l4
	movn	%icc,	%g6,	%o5
	smulcc	%l0,	%i0,	%i4
	ta	%xcc,	0x5
	orn	%o6,	%g1,	%o0
	bcc	%icc,	loop_1921
	fzeros	%f28
	be	loop_1922
	bn,a	loop_1923
loop_1921:
	brgez,a	%o7,	loop_1924
	sdiv	%l5,	0x1B07,	%g7
loop_1922:
	tl	%icc,	0x6
loop_1923:
	fbul	%fcc1,	loop_1925
loop_1924:
	mulx	%g5,	0x0E75,	%i5
	movneg	%xcc,	%l1,	%i1
	subcc	%o1,	0x0A93,	%l2
loop_1925:
	brnz	%i2,	loop_1926
	sub	%i6,	0x1A7F,	%o2
	nop
	set	0x5F, %g6
	ldub	[%l7 + %g6],	%g2
	fmovd	%f12,	%f12
loop_1926:
	ldsw	[%l7 + 0x74],	%g3
	tne	%icc,	0x1
	bcc,pt	%xcc,	loop_1927
	fnot1	%f26,	%f16
	alignaddr	%l6,	%i3,	%g4
	tneg	%icc,	0x6
loop_1927:
	fornot1	%f30,	%f16,	%f30
	movcs	%icc,	%o3,	%o4
	array32	%i7,	%l4,	%l3
	smulcc	%o5,	%g6,	%l0
	fbn,a	%fcc1,	loop_1928
	movrlz	%i4,	%i0,	%g1
	wr	%g0,	0x2f,	%asi
	stba	%o6,	[%l7 + 0x4C] %asi
	membar	#Sync
loop_1928:
	brgz	%o0,	loop_1929
	fmovdge	%icc,	%f22,	%f10
	set	0x60, %i3
	sta	%f8,	[%l7 + %i3] 0x0c
loop_1929:
	fbul,a	%fcc3,	loop_1930
	tsubcc	%o7,	0x01E8,	%g7
	tvs	%icc,	0x5
	be	%icc,	loop_1931
loop_1930:
	srax	%g5,	%l5,	%i5
	fbuge,a	%fcc2,	loop_1932
	sdivx	%l1,	0x1876,	%i1
loop_1931:
	edge32n	%l2,	%i2,	%o1
	udivx	%o2,	0x08BE,	%i6
loop_1932:
	fmovdleu	%xcc,	%f18,	%f10
	fbne	%fcc3,	loop_1933
	tn	%xcc,	0x2
	tge	%xcc,	0x3
	fxors	%f12,	%f14,	%f2
loop_1933:
	movn	%xcc,	%g3,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g2
	sub	%g4,	%i3,	%o3
	nop
	setx	0x89EF65F5206F75E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	edge8n	%o4,	%l4,	%i7
	tvc	%xcc,	0x6
	srax	%o5,	%g6,	%l3
	edge8l	%i4,	%i0,	%l0
	tl	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc3,	loop_1934
	umulcc	%o6,	0x1CA9,	%g1
	taddcctv	%o7,	0x024B,	%g7
	tcs	%xcc,	0x7
loop_1934:
	mulscc	%g5,	%o0,	%i5
	edge32l	%l5,	%l1,	%l2
	fandnot2s	%f13,	%f7,	%f23
	sub	%i2,	%i1,	%o2
	set	0x30, %o5
	ldxa	[%g0 + %o5] 0x20,	%o1
	brnz,a	%g3,	loop_1935
	mova	%xcc,	%l6,	%i6
	popc	0x1DA8,	%g2
	bge,a	loop_1936
loop_1935:
	umulcc	%i3,	0x05C1,	%g4
	nop
	setx loop_1937, %l0, %l1
	jmpl %l1, %o3
	andncc	%l4,	%o4,	%i7
loop_1936:
	udivcc	%g6,	0x0301,	%o5
	fbg	%fcc1,	loop_1938
loop_1937:
	tvs	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f6,	%f24,	%f20
loop_1938:
	movgu	%xcc,	%i4,	%i0
	andncc	%l3,	%l0,	%o6
	ta	%icc,	0x3
	subcc	%o7,	%g1,	%g5
	edge32ln	%o0,	%g7,	%l5
	udivcc	%l1,	0x0B8B,	%i5
	edge16l	%l2,	%i1,	%o2
	tl	%icc,	0x7
	fmuld8ulx16	%f24,	%f6,	%f8
	andncc	%i2,	%o1,	%g3
	nop
	setx	0x116D44F55316D4F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x117DFB5DC0CEC90F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f4
	tgu	%icc,	0x6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrgez	%l6,	%i6,	%g2
	array32	%i3,	%g4,	%o3
	movne	%icc,	%l4,	%o4
	movrlez	%i7,	%o5,	%i4
	srl	%i0,	0x1D,	%l3
	udiv	%l0,	0x0421,	%o6
	nop
	setx	loop_1939,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%icc,	0x1
	brgz	%g6,	loop_1940
	sra	%g1,	0x1E,	%g5
loop_1939:
	nop
	set	0x2D, %o1
	ldub	[%l7 + %o1],	%o0
	tle	%xcc,	0x0
loop_1940:
	tpos	%icc,	0x5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%g7
	sth	%l5,	[%l7 + 0x16]
	movcs	%xcc,	%o7,	%i5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l2
	umul	%i1,	%o2,	%i2
	edge8l	%o1,	%g3,	%l1
	sdivcc	%i6,	0x069B,	%l6
	sra	%i3,	0x15,	%g4
	bvc	loop_1941
	movvs	%icc,	%o3,	%l4
	nop
	fitos	%f5,	%f14
	fstoi	%f14,	%f9
	tcs	%xcc,	0x6
loop_1941:
	nop
	setx	0x996EF9C75076B055,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fnot2s	%f9,	%f9
	movre	%g2,	0x092,	%o4
	taddcctv	%i7,	0x0CF9,	%o5
	movrgz	%i4,	0x17D,	%i0
	subcc	%l3,	0x0B58,	%l0
	fnand	%f4,	%f26,	%f10
	or	%o6,	%g1,	%g5
	popc	%o0,	%g6
	andn	%g7,	0x0A97,	%l5
	ta	%icc,	0x0
	fxnors	%f25,	%f6,	%f11
	movg	%icc,	%o7,	%i5
	fbuge,a	%fcc0,	loop_1942
	lduw	[%l7 + 0x1C],	%l2
	bn,pn	%icc,	loop_1943
	edge16l	%i1,	%i2,	%o2
loop_1942:
	bneg,pn	%xcc,	loop_1944
	nop
	setx	loop_1945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1943:
	tn	%xcc,	0x0
	andn	%g3,	%o1,	%l1
loop_1944:
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f14
loop_1945:
	ta	%icc,	0x4
	srl	%i6,	0x12,	%l6
	fpsub32	%f20,	%f24,	%f18
	alignaddr	%g4,	%i3,	%o3
	te	%icc,	0x6
	fmovda	%xcc,	%f20,	%f10
	fmovsneg	%xcc,	%f17,	%f19
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x6B] %asi,	%g2
	taddcc	%l4,	%o4,	%o5
	nop
	set	0x2C, %i6
	sth	%i4,	[%l7 + %i6]
	ldx	[%l7 + 0x08],	%i0
	sir	0x02A3
	fornot2	%f6,	%f16,	%f4
	taddcc	%i7,	%l0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l3,	0x06ED,	%g1
	fmovda	%icc,	%f16,	%f4
	fsrc2s	%f22,	%f19
	sllx	%o0,	0x1F,	%g5
	fbne	%fcc3,	loop_1946
	addc	%g6,	0x038D,	%l5
	fmovdne	%xcc,	%f25,	%f5
	addccc	%o7,	0x016E,	%g7
loop_1946:
	edge8	%i5,	%l2,	%i1
	bneg,pn	%xcc,	loop_1947
	sllx	%i2,	%o2,	%g3
	nop
	setx	0xBD95B3E0B05AEC48,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fornot1	%f4,	%f28,	%f30
loop_1947:
	movleu	%xcc,	%o1,	%i6
	membar	0x5A
	fmovsneg	%xcc,	%f2,	%f22
	prefetch	[%l7 + 0x58],	 0x0
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	faligndata	%f10,	%f2,	%f4
	bne	%icc,	loop_1948
	bcs	%icc,	loop_1949
	fmovspos	%xcc,	%f14,	%f7
	ldsh	[%l7 + 0x44],	%g4
loop_1948:
	orncc	%i3,	0x068F,	%l1
loop_1949:
	fbn,a	%fcc1,	loop_1950
	edge32	%g2,	%o3,	%l4
	xor	%o5,	%o4,	%i4
	set	0x28, %i0
	stxa	%i0,	[%l7 + %i0] 0x0c
loop_1950:
	prefetch	[%l7 + 0x68],	 0x3
	sra	%i7,	%l0,	%l3
	bvc,a	%xcc,	loop_1951
	movge	%xcc,	%o6,	%o0
	array16	%g5,	%g1,	%g6
	udivx	%l5,	0x07A6,	%o7
loop_1951:
	movrne	%i5,	%l2,	%i1
	movle	%xcc,	%i2,	%o2
	srl	%g3,	0x19,	%o1
	tcs	%icc,	0x2
	sub	%g7,	0x1937,	%i6
	edge8n	%l6,	%i3,	%l1
	sdivcc	%g2,	0x0FCB,	%o3
	fmovrde	%l4,	%f26,	%f2
	edge8l	%o5,	%g4,	%i4
	edge32n	%i0,	%i7,	%l0
	edge8	%o4,	%l3,	%o6
	nop
	setx	0x8176E96A1FB570EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC143E254EA830668,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f12,	%f8
	sethi	0x08D1,	%g5
	sethi	0x180D,	%o0
	sll	%g6,	0x1B,	%l5
	fpadd32s	%f26,	%f18,	%f11
	tvc	%xcc,	0x1
	sth	%g1,	[%l7 + 0x2E]
	fpack16	%f10,	%f19
	fmovdpos	%xcc,	%f20,	%f16
	andcc	%o7,	0x0CEC,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i1,	0x0CD9,	%i5
	movl	%xcc,	%i2,	%o2
	fmovspos	%xcc,	%f31,	%f0
	orncc	%o1,	%g3,	%g7
	sra	%l6,	0x19,	%i3
	brgez	%i6,	loop_1952
	fpmerge	%f1,	%f25,	%f14
	ldsb	[%l7 + 0x1F],	%l1
	tpos	%xcc,	0x1
loop_1952:
	edge16	%o3,	%l4,	%o5
	sra	%g2,	0x18,	%g4
	ldd	[%l7 + 0x50],	%f28
	sub	%i0,	%i4,	%l0
	udivcc	%i7,	0x18B8,	%o4
	tpos	%icc,	0x4
	bvc	%icc,	loop_1953
	ta	%icc,	0x5
	xnorcc	%l3,	0x051D,	%o6
	stbar
loop_1953:
	movgu	%icc,	%o0,	%g6
	move	%xcc,	%l5,	%g5
	edge8n	%o7,	%g1,	%l2
	tg	%xcc,	0x3
	subcc	%i5,	0x004A,	%i1
	fmovrdgez	%i2,	%f8,	%f10
	ldx	[%l7 + 0x78],	%o2
	edge32n	%o1,	%g3,	%g7
	set	0x08, %o3
	lda	[%l7 + %o3] 0x14,	%f0
	fba,a	%fcc0,	loop_1954
	tvs	%xcc,	0x2
	array8	%i3,	%l6,	%i6
	tpos	%xcc,	0x3
loop_1954:
	edge8n	%o3,	%l4,	%o5
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x18
	move	%xcc,	%g2,	%g4
	addccc	%l1,	%i4,	%l0
	edge16l	%i7,	%i0,	%l3
	nop
	setx	loop_1955,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnor	%f16,	%f10,	%f16
	fmovsne	%xcc,	%f11,	%f18
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1955:
	fbo,a	%fcc0,	loop_1956
	fmovscs	%icc,	%f18,	%f9
	or	%o6,	0x01BE,	%o4
	bvc	loop_1957
loop_1956:
	fbn	%fcc1,	loop_1958
	stw	%g6,	[%l7 + 0x1C]
	movl	%icc,	%o0,	%l5
loop_1957:
	umul	%o7,	0x0F31,	%g5
loop_1958:
	ldx	[%l7 + 0x38],	%l2
	ba,a,pn	%icc,	loop_1959
	bneg,a,pt	%icc,	loop_1960
	movcc	%icc,	%i5,	%i1
	fzeros	%f31
loop_1959:
	addccc	%i2,	0x0739,	%o2
loop_1960:
	tcs	%icc,	0x0
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x15,	 0x0
	fmovdpos	%icc,	%f31,	%f6
	edge16n	%g1,	%g7,	%g3
	tgu	%xcc,	0x0
	nop
	fitos	%f14,	%f1
	fstox	%f1,	%f2
	fxtos	%f2,	%f24
	array16	%i3,	%i6,	%o3
	fzero	%f10
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l6
	tne	%xcc,	0x4
	bleu,a,pt	%icc,	loop_1961
	tne	%icc,	0x1
	array32	%l4,	%g2,	%o5
	nop
	setx	loop_1962,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1961:
	nop
	set	0x48, %i4
	prefetch	[%l7 + %i4],	 0x2
	bvc,pt	%xcc,	loop_1963
	fnegs	%f22,	%f31
loop_1962:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x50] %asi,	%l1
loop_1963:
	te	%icc,	0x5
	bcs,a,pn	%xcc,	loop_1964
	fmovsleu	%xcc,	%f30,	%f21
	array16	%g4,	%l0,	%i4
	nop
	setx	loop_1965,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1964:
	pdist	%f30,	%f22,	%f18
	sdivcc	%i7,	0x11EA,	%l3
	prefetch	[%l7 + 0x0C],	 0x3
loop_1965:
	array16	%o6,	%o4,	%i0
	sra	%o0,	%l5,	%o7
	prefetch	[%l7 + 0x44],	 0x0
	andn	%g5,	0x049B,	%l2
	movcs	%xcc,	%g6,	%i5
	fmuld8ulx16	%f14,	%f18,	%f12
	movvs	%icc,	%i2,	%i1
	ldstub	[%l7 + 0x68],	%o2
	movneg	%xcc,	%o1,	%g7
	ldub	[%l7 + 0x5B],	%g1
	popc	%g3,	%i6
	tsubcctv	%i3,	0x0521,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f18
	udivcc	%l4,	0x0C87,	%g2
	udivcc	%o3,	0x1C2A,	%o5
	umul	%g4,	%l0,	%l1
	wr	%g0,	0x88,	%asi
	stba	%i7,	[%l7 + 0x64] %asi
	set	0x25, %l5
	ldsba	[%l7 + %l5] 0x04,	%l3
	edge8n	%i4,	%o4,	%i0
	tvs	%xcc,	0x7
	edge32ln	%o0,	%l5,	%o6
	array32	%o7,	%g5,	%l2
	tcc	%icc,	0x6
	movrne	%g6,	%i2,	%i5
	ba	loop_1966
	tvc	%icc,	0x0
	prefetch	[%l7 + 0x34],	 0x0
	fxnors	%f9,	%f31,	%f4
loop_1966:
	tpos	%icc,	0x7
	fones	%f13
	array32	%i1,	%o2,	%o1
	subc	%g1,	0x0AA0,	%g3
	or	%i6,	%g7,	%l6
	sra	%l4,	0x0A,	%i3
	addcc	%g2,	%o3,	%g4
	fcmpne16	%f14,	%f16,	%o5
	nop
	setx	loop_1967,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0595,	%l1
	array16	%l0,	%l3,	%i7
	edge32l	%i4,	%i0,	%o4
loop_1967:
	ba	loop_1968
	brz	%o0,	loop_1969
	taddcctv	%l5,	0x194A,	%o6
	movle	%xcc,	%g5,	%o7
loop_1968:
	nop
	setx	0xB56C35B52CFDEC65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x839F3FF0F0D02F24,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f14,	%f0
loop_1969:
	array8	%g6,	%l2,	%i2
	sir	0x1C95
	taddcctv	%i1,	%o2,	%o1
	ta	%xcc,	0x7
	ble	%xcc,	loop_1970
	movn	%icc,	%i5,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g1,	%i6
loop_1970:
	edge8	%g7,	%l6,	%i3
	umulcc	%l4,	%o3,	%g4
	movg	%xcc,	%o5,	%l1
	ta	%xcc,	0x7
	movrne	%g2,	0x042,	%l3
	tn	%xcc,	0x7
	fpsub32s	%f7,	%f4,	%f26
	fmovscs	%xcc,	%f22,	%f29
	taddcc	%i7,	0x1466,	%l0
	add	%i0,	0x1B23,	%o4
	fbul	%fcc0,	loop_1971
	or	%i4,	%o0,	%o6
	sra	%l5,	%o7,	%g6
	movgu	%xcc,	%l2,	%i2
loop_1971:
	alignaddr	%g5,	%i1,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o1,	%i5,	%g3
	set	0x53, %o6
	lduba	[%l7 + %o6] 0x0c,	%g1
	fmovrsgez	%i6,	%f4,	%f3
	fpadd16s	%f8,	%f12,	%f11
	membar	0x4D
	fornot1	%f20,	%f8,	%f16
	fbo,a	%fcc1,	loop_1972
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x08],	%g7
	fbule	%fcc0,	loop_1973
loop_1972:
	bgu,a	%xcc,	loop_1974
	movrlez	%i3,	0x24E,	%l6
	andncc	%l4,	%g4,	%o5
loop_1973:
	for	%f22,	%f6,	%f4
loop_1974:
	ta	%xcc,	0x7
	fmovsge	%icc,	%f3,	%f14
	movrgz	%o3,	%g2,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l3,	0x0B2,	%l0
	stbar
	fmul8x16	%f12,	%f2,	%f8
	brz,a	%i0,	loop_1975
	edge32l	%i7,	%o4,	%i4
	bvc,a,pt	%icc,	loop_1976
	fmovdvc	%icc,	%f6,	%f6
loop_1975:
	tg	%icc,	0x2
	fornot1s	%f28,	%f10,	%f20
loop_1976:
	smulcc	%o0,	0x0CF2,	%l5
	fbge	%fcc2,	loop_1977
	ldsh	[%l7 + 0x2A],	%o7
	fcmple16	%f2,	%f10,	%g6
	fornot2s	%f11,	%f24,	%f16
loop_1977:
	movrgez	%o6,	%i2,	%l2
	fmovrsgez	%i1,	%f5,	%f18
	movrne	%g5,	0x117,	%o2
	nop
	fitos	%f28,	%f13
	edge8l	%i5,	%o1,	%g1
	fbg,a	%fcc2,	loop_1978
	fpsub32s	%f9,	%f7,	%f23
	andncc	%i6,	%g3,	%g7
	xnor	%l6,	%i3,	%l4
loop_1978:
	ldub	[%l7 + 0x26],	%o5
	movvc	%icc,	%g4,	%o3
	sdiv	%l1,	0x04D6,	%g2
	tne	%xcc,	0x5
	add	%l0,	%i0,	%l3
	edge32n	%o4,	%i7,	%o0
	tgu	%xcc,	0x6
	fandnot2	%f18,	%f8,	%f0
	smulcc	%l5,	%i4,	%o7
	bvc	loop_1979
	andn	%o6,	0x04B6,	%g6
	movre	%i2,	%l2,	%g5
	smul	%o2,	%i1,	%o1
loop_1979:
	sethi	0x1603,	%g1
	nop
	setx	0xC910EBAB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xC8DB501F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f0,	%f20
	nop
	set	0x46, %o0
	ldstub	[%l7 + %o0],	%i5
	tvc	%icc,	0x1
	movre	%g3,	%i6,	%g7
	fone	%f6
	movneg	%icc,	%i3,	%l4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o5
	nop
	setx	0xCDE559375979FAE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f26
	orcc	%g4,	%l6,	%o3
	ba	%xcc,	loop_1980
	fsrc1	%f2,	%f26
	fmovspos	%icc,	%f0,	%f27
	ldub	[%l7 + 0x0C],	%g2
loop_1980:
	fnot2	%f12,	%f8
	fbul,a	%fcc2,	loop_1981
	mulx	%l0,	%i0,	%l1
	edge32n	%l3,	%i7,	%o4
	ldub	[%l7 + 0x11],	%l5
loop_1981:
	fbn,a	%fcc2,	loop_1982
	array16	%i4,	%o7,	%o6
	bcc,pt	%xcc,	loop_1983
	brgez,a	%o0,	loop_1984
loop_1982:
	fbl,a	%fcc1,	loop_1985
	array8	%g6,	%l2,	%g5
loop_1983:
	movneg	%icc,	%i2,	%i1
loop_1984:
	tcs	%xcc,	0x2
loop_1985:
	subccc	%o2,	%o1,	%i5
	movgu	%icc,	%g1,	%i6
	movrgz	%g3,	%i3,	%g7
	bleu	loop_1986
	tsubcctv	%l4,	%g4,	%l6
	nop
	fitod	%f0,	%f8
	fdtoi	%f8,	%f25
	popc	0x162F,	%o5
loop_1986:
	udivcc	%o3,	0x03B0,	%l0
	movle	%icc,	%i0,	%l1
	array32	%g2,	%i7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc2,	loop_1987
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f14
	fxtod	%f14,	%f4
	set	0x48, %l3
	stba	%l5,	[%l7 + %l3] 0x2b
	membar	#Sync
loop_1987:
	popc	%l3,	%o7
	andn	%i4,	0x1780,	%o0
	fsrc1s	%f10,	%f4
	fpsub32s	%f27,	%f14,	%f12
	tsubcctv	%g6,	0x1CBA,	%o6
	movneg	%xcc,	%g5,	%i2
	movpos	%xcc,	%l2,	%i1
	fmovscs	%xcc,	%f10,	%f13
	fmovsvc	%xcc,	%f24,	%f20
	swap	[%l7 + 0x60],	%o2
	fcmpeq32	%f10,	%f10,	%i5
	xnor	%o1,	%i6,	%g3
	brlez	%g1,	loop_1988
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f2,	%f19,	%f27
	taddcc	%g7,	0x177E,	%l4
loop_1988:
	ba,a,pt	%xcc,	loop_1989
	edge16n	%i3,	%g4,	%o5
	umulcc	%l6,	%l0,	%o3
	movrlez	%i0,	%l1,	%i7
loop_1989:
	fbue,a	%fcc0,	loop_1990
	brnz,a	%g2,	loop_1991
	tne	%icc,	0x7
	subcc	%l5,	0x19C5,	%o4
loop_1990:
	tsubcctv	%o7,	%l3,	%o0
loop_1991:
	fbge,a	%fcc1,	loop_1992
	fones	%f3
	sll	%i4,	0x0F,	%g6
	alignaddrl	%o6,	%g5,	%l2
loop_1992:
	andcc	%i1,	%o2,	%i2
	nop
	setx	0x78D4AF2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x06ACC3CA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f30,	%f15
	fmovdneg	%icc,	%f0,	%f31
	fmovrdgz	%o1,	%f16,	%f6
	nop
	setx loop_1993, %l0, %l1
	jmpl %l1, %i5
	bn,pt	%xcc,	loop_1994
	movrgz	%g3,	%g1,	%i6
	mova	%xcc,	%l4,	%g7
loop_1993:
	edge8n	%g4,	%o5,	%l6
loop_1994:
	tge	%xcc,	0x2
	fbule	%fcc0,	loop_1995
	edge16n	%i3,	%l0,	%i0
	fsrc2	%f26,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1995:
	movleu	%icc,	%l1,	%i7
	fbule,a	%fcc2,	loop_1996
	fcmpgt16	%f0,	%f2,	%o3
	tne	%xcc,	0x6
	te	%xcc,	0x7
loop_1996:
	fbuge,a	%fcc0,	loop_1997
	mulscc	%g2,	0x163F,	%o4
	movvc	%xcc,	%o7,	%l5
	bn	loop_1998
loop_1997:
	sll	%l3,	%o0,	%g6
	fmovsa	%icc,	%f23,	%f13
	tne	%xcc,	0x2
loop_1998:
	ldd	[%l7 + 0x30],	%f12
	fpack16	%f12,	%f12
	edge8	%o6,	%g5,	%l2
	edge32ln	%i4,	%o2,	%i2
	mulx	%o1,	%i5,	%g3
	bvc,a	loop_1999
	ldx	[%l7 + 0x58],	%i1
	edge32ln	%g1,	%l4,	%i6
	orncc	%g7,	0x0797,	%g4
loop_1999:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f16,	%f22,	%f18
	alignaddrl	%l6,	%i3,	%l0
	fcmpeq32	%f12,	%f16,	%i0
	sll	%l1,	0x09,	%o5
	movcc	%icc,	%o3,	%i7
	sra	%o4,	0x1E,	%o7
	stw	%l5,	[%l7 + 0x20]
	fmovrdlz	%l3,	%f2,	%f4
	fmovsg	%icc,	%f15,	%f31
	tl	%xcc,	0x4
	fmovsgu	%xcc,	%f29,	%f7
	brlz,a	%g2,	loop_2000
	popc	%g6,	%o0
	xnor	%g5,	%o6,	%i4
	orn	%l2,	%i2,	%o1
loop_2000:
	fmovsvc	%icc,	%f24,	%f6
	tneg	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movl	%xcc,	%i5,	%o2
	lduw	[%l7 + 0x44],	%g3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5E] %asi,	%i1
	fmul8x16au	%f21,	%f13,	%f2
	movl	%xcc,	%g1,	%l4
	sethi	0x02ED,	%i6
	nop
	setx	0x804EF1DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	sth	%g7,	[%l7 + 0x22]
	movneg	%xcc,	%g4,	%l6
	fmul8ulx16	%f14,	%f28,	%f8
	and	%l0,	0x1AE1,	%i0
	array8	%l1,	%o5,	%o3
	udivcc	%i7,	0x1B59,	%i3
	lduh	[%l7 + 0x50],	%o7
	edge8	%l5,	%l3,	%o4
	fmovsl	%icc,	%f7,	%f3
	tl	%xcc,	0x4
	lduh	[%l7 + 0x14],	%g6
	sra	%o0,	%g2,	%o6
	fandnot1	%f16,	%f26,	%f24
	sub	%g5,	0x1D07,	%l2
	ld	[%l7 + 0x08],	%f17
	taddcc	%i4,	%i2,	%i5
	addccc	%o1,	0x1A97,	%o2
	fbo,a	%fcc3,	loop_2001
	fmovs	%f27,	%f11
	brgz,a	%g3,	loop_2002
	edge32ln	%g1,	%i1,	%l4
loop_2001:
	ldd	[%l7 + 0x58],	%f26
	sll	%g7,	%g4,	%i6
loop_2002:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l6,	[%l7 + 0x60]
	xor	%i0,	%l0,	%o5
	wr	%g0,	0x19,	%asi
	stwa	%o3,	[%l7 + 0x70] %asi
	movrlez	%l1,	%i7,	%o7
	nop
	setx	loop_2003,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fble	%fcc2,	loop_2004
	edge32	%i3,	%l3,	%l5
	array8	%g6,	%o4,	%o0
loop_2003:
	bvs,a,pt	%xcc,	loop_2005
loop_2004:
	fmovrse	%g2,	%f5,	%f15
	movleu	%icc,	%g5,	%l2
	fmovsleu	%xcc,	%f12,	%f20
loop_2005:
	bvc	loop_2006
	fzeros	%f7
	tneg	%icc,	0x6
	nop
	setx	0x30487349,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_2006:
	brgez	%o6,	loop_2007
	fblg	%fcc1,	loop_2008
	sub	%i2,	%i4,	%i5
	movl	%xcc,	%o1,	%o2
loop_2007:
	fones	%f2
loop_2008:
	fabsd	%f18,	%f24
	fsrc2	%f6,	%f10
	fmovrdlez	%g1,	%f14,	%f16
	nop
	setx	0xE93A20F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x0B19627B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f17,	%f9
	movvc	%xcc,	%i1,	%g3
	orcc	%l4,	0x18A6,	%g7
	umulcc	%i6,	0x0CAC,	%g4
	fmovrsgez	%i0,	%f5,	%f1
	bge,a,pt	%icc,	loop_2009
	edge8ln	%l0,	%o5,	%o3
	fmovdge	%xcc,	%f17,	%f17
	tvc	%icc,	0x1
loop_2009:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l6
	xnorcc	%l1,	%i7,	%o7
	move	%xcc,	%i3,	%l3
	fmovscc	%xcc,	%f25,	%f12
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x68] %asi,	%l5
	fbue,a	%fcc0,	loop_2010
	te	%icc,	0x5
	orncc	%g6,	%o0,	%o4
	sir	0x1828
loop_2010:
	tcs	%xcc,	0x0
	fmovdpos	%icc,	%f4,	%f24
	tne	%xcc,	0x4
	for	%f4,	%f24,	%f14
	nop
	set	0x28, %g7
	lduh	[%l7 + %g7],	%g5
	sethi	0x1D80,	%g2
	orcc	%o6,	0x0EEB,	%i2
	subccc	%i4,	%l2,	%o1
	bleu	%xcc,	loop_2011
	tleu	%xcc,	0x3
	fsrc2	%f0,	%f24
	fmovsge	%xcc,	%f19,	%f31
loop_2011:
	mulscc	%o2,	0x136F,	%g1
	alignaddrl	%i5,	%i1,	%l4
	fnegs	%f12,	%f12
	fornot2	%f4,	%f16,	%f20
	subc	%g3,	%i6,	%g7
	ldd	[%l7 + 0x58],	%i0
	fpadd32s	%f25,	%f8,	%f25
	ta	%icc,	0x4
	sdivx	%g4,	0x1D6E,	%o5
	nop
	fitos	%f9,	%f23
	mulx	%l0,	0x0B3F,	%o3
	ldub	[%l7 + 0x7E],	%l6
	ldsb	[%l7 + 0x62],	%i7
	tsubcctv	%o7,	0x1F35,	%i3
	brz,a	%l1,	loop_2012
	tvs	%icc,	0x0
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x34] %asi,	%l3
loop_2012:
	nop
	setx	0x897CBEA710683D30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fcmpeq16	%f2,	%f20,	%g6
	sethi	0x19FF,	%o0
	addc	%l5,	0x0EC8,	%g5
	call	loop_2013
	tcs	%xcc,	0x1
	nop
	fitos	%f12,	%f4
	fstod	%f4,	%f26
	sllx	%g2,	0x01,	%o6
loop_2013:
	smul	%o4,	%i2,	%i4
	fmovdvc	%icc,	%f28,	%f23
	xnor	%o1,	%o2,	%l2
	fmul8ulx16	%f20,	%f14,	%f10
	tne	%xcc,	0x7
	fexpand	%f1,	%f20
	fbuge,a	%fcc2,	loop_2014
	tge	%icc,	0x0
	nop
	setx	loop_2015,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgez,a	%g1,	loop_2016
loop_2014:
	fbuge	%fcc0,	loop_2017
	stw	%i5,	[%l7 + 0x6C]
loop_2015:
	fmovsle	%xcc,	%f5,	%f8
loop_2016:
	taddcctv	%i1,	%l4,	%g3
loop_2017:
	fble	%fcc1,	loop_2018
	fbuge	%fcc0,	loop_2019
	sethi	0x151D,	%g7
	subccc	%i6,	%g4,	%i0
loop_2018:
	mulx	%l0,	%o3,	%l6
loop_2019:
	add	%o5,	0x04E2,	%o7
	srl	%i3,	0x1F,	%l1
	fbg,a	%fcc0,	loop_2020
	fmovscc	%icc,	%f10,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc2,	loop_2021
loop_2020:
	fba	%fcc0,	loop_2022
	te	%icc,	0x3
	udivx	%i7,	0x0338,	%l3
loop_2021:
	fmul8x16al	%f22,	%f3,	%f18
loop_2022:
	nop
	wr	%g0,	0x19,	%asi
	stha	%g6,	[%l7 + 0x24] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	0x0707,	%g5
	alignaddrl	%g2,	%o6,	%o0
	orcc	%i2,	0x0E2E,	%o4
	smulcc	%o1,	%i4,	%l2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x04,	%o2,	%g1
	edge16n	%i1,	%i5,	%g3
	taddcctv	%l4,	0x1EA4,	%g7
	fmovse	%icc,	%f4,	%f27
	fpsub32	%f10,	%f0,	%f6
	fmovrsgez	%g4,	%f0,	%f25
	tcc	%icc,	0x5
	bg	loop_2023
	ldub	[%l7 + 0x70],	%i6
	sdivcc	%i0,	0x0571,	%o3
	tge	%icc,	0x3
loop_2023:
	or	%l0,	%o5,	%o7
	fpack16	%f20,	%f27
	fexpand	%f12,	%f4
	movcs	%xcc,	%l6,	%i3
	te	%xcc,	0x6
	fcmpeq16	%f24,	%f4,	%l1
	fmovdne	%icc,	%f30,	%f15
	tsubcctv	%l3,	%g6,	%i7
	bg,pn	%xcc,	loop_2024
	fands	%f26,	%f11,	%f1
	wr	%g0,	0x89,	%asi
	sta	%f1,	[%l7 + 0x34] %asi
loop_2024:
	lduh	[%l7 + 0x54],	%l5
	movre	%g5,	%g2,	%o0
	stw	%i2,	[%l7 + 0x34]
	umulcc	%o4,	%o6,	%i4
	fbu	%fcc3,	loop_2025
	array16	%o1,	%l2,	%o2
	fmovrdlez	%i1,	%f6,	%f28
	tvs	%icc,	0x1
loop_2025:
	srax	%g1,	%g3,	%i5
	fmovrdgz	%l4,	%f10,	%f20
	edge8ln	%g7,	%g4,	%i0
	movleu	%xcc,	%i6,	%o3
	fnot1s	%f21,	%f28
	fblg	%fcc0,	loop_2026
	fbge	%fcc0,	loop_2027
	tg	%xcc,	0x2
	fmul8x16au	%f16,	%f23,	%f6
loop_2026:
	fpsub32	%f22,	%f10,	%f18
loop_2027:
	fmovdpos	%xcc,	%f8,	%f27
	nop
	set	0x46, %l6
	ldsh	[%l7 + %l6],	%l0
	taddcctv	%o5,	0x1E49,	%l6
	fmovd	%f4,	%f26
	subccc	%o7,	0x049E,	%l1
	popc	0x152B,	%i3
	fbu,a	%fcc2,	loop_2028
	movrgez	%g6,	%l3,	%l5
	andcc	%i7,	%g2,	%o0
	set	0x23, %i1
	ldsba	[%l7 + %i1] 0x14,	%i2
loop_2028:
	nop
	setx	0xFC9C4361,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x9CF8AD5F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f19,	%f21
	tvs	%icc,	0x3
	srax	%o4,	0x1C,	%o6
	fcmpne32	%f22,	%f0,	%g5
	tleu	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	sta	%f6,	[%l7 + 0x18] %asi
	fmovrdgz	%i4,	%f20,	%f28
	tgu	%xcc,	0x0
	set	0x1C, %g5
	stwa	%o1,	[%l7 + %g5] 0x80
	tsubcctv	%l2,	0x0897,	%o2
	set	0x60, %g4
	swapa	[%l7 + %g4] 0x89,	%i1
	ble,a	loop_2029
	subc	%g1,	0x19D2,	%i5
	alignaddrl	%g3,	%l4,	%g7
	fbo,a	%fcc2,	loop_2030
loop_2029:
	smul	%g4,	%i6,	%o3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x11,	%f16
loop_2030:
	movle	%icc,	%i0,	%o5
	fpsub32	%f4,	%f0,	%f14
	bleu	loop_2031
	fbuge,a	%fcc3,	loop_2032
	tgu	%xcc,	0x3
	fmul8x16al	%f1,	%f28,	%f0
loop_2031:
	tgu	%xcc,	0x5
loop_2032:
	nop
	set	0x75, %g1
	ldsb	[%l7 + %g1],	%l0
	sra	%l6,	%l1,	%i3
	tl	%xcc,	0x5
	movn	%xcc,	%o7,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x4
	stbar
	fmovrslez	%l5,	%f25,	%f20
	tvs	%icc,	0x7
	lduh	[%l7 + 0x6A],	%i7
	alignaddr	%l3,	%o0,	%i2
	ta	%xcc,	0x7
	fpadd16s	%f9,	%f15,	%f4
	movrgz	%g2,	0x1FA,	%o6
	addcc	%g5,	%i4,	%o1
	alignaddrl	%l2,	%o4,	%i1
	movge	%xcc,	%o2,	%g1
	fmovsle	%xcc,	%f25,	%f27
	movg	%icc,	%g3,	%l4
	sethi	0x0D1F,	%g7
	set	0x148, %i5
	nop 	! 	nop 	! 	ldxa	[%g0 + %i5] 0x40,	%g4 ripped by fixASI40.pl ripped by fixASI40.pl
	movre	%i5,	0x2A5,	%o3
	membar	0x18
	fmuld8sux16	%f17,	%f6,	%f20
	fmovdgu	%xcc,	%f29,	%f16
	call	loop_2033
	call	loop_2034
	movvc	%icc,	%i6,	%o5
	ta	%icc,	0x3
loop_2033:
	fones	%f2
loop_2034:
	sllx	%l0,	%l6,	%i0
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f22
	umulcc	%i3,	%o7,	%l1
	array8	%g6,	%l5,	%i7
	fornot2	%f22,	%f8,	%f14
	stb	%o0,	[%l7 + 0x09]
	set	0x44, %i2
	lda	[%l7 + %i2] 0x19,	%f20
	sdivcc	%l3,	0x01E5,	%i2
	ldd	[%l7 + 0x48],	%o6
	te	%xcc,	0x0
	set	0x0C, %l0
	sta	%f27,	[%l7 + %l0] 0x11
	srax	%g5,	0x15,	%i4
	xnorcc	%g2,	%o1,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o2
	sra	%g1,	%g3,	%l4
	nop
	setx	0xFC90FBDB15F1016A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xEAE7FBE85DD64E8D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f10,	%f28
	fornot1	%f0,	%f26,	%f28
	sub	%i1,	0x083F,	%g7
	fmovdg	%icc,	%f22,	%f6
	fmuld8ulx16	%f17,	%f24,	%f22
	ldd	[%l7 + 0x30],	%g4
	sub	%o3,	0x04E7,	%i6
	andcc	%o5,	0x1C5B,	%i5
	fmovdgu	%xcc,	%f19,	%f19
	set	0x38, %o2
	sta	%f20,	[%l7 + %o2] 0x04
	fbul,a	%fcc3,	loop_2035
	andn	%l0,	%l6,	%i0
	brlez	%o7,	loop_2036
	movvc	%xcc,	%i3,	%g6
loop_2035:
	movvs	%icc,	%l5,	%i7
	fmovdle	%icc,	%f9,	%f8
loop_2036:
	tcs	%xcc,	0x1
	bgu	loop_2037
	movcs	%xcc,	%o0,	%l1
	fzeros	%f15
	edge16n	%i2,	%o6,	%l3
loop_2037:
	nop
	wr	%g0,	0x04,	%asi
	stha	%i4,	[%l7 + 0x24] %asi
	brgez,a	%g5,	loop_2038
	array16	%o1,	%g2,	%o4
	fnot1s	%f8,	%f10
	addcc	%o2,	%g1,	%l2
loop_2038:
	fmovrdlz	%g3,	%f26,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i1,	%g7,	%g4
	sllx	%o3,	0x1B,	%i6
	ldsh	[%l7 + 0x4E],	%o5
	fbl	%fcc1,	loop_2039
	movpos	%xcc,	%i5,	%l4
	nop
	setx	0x0218C6ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x8FBC70E7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f28,	%f17
	movpos	%xcc,	%l6,	%l0
loop_2039:
	array32	%i0,	%o7,	%i3
	tgu	%icc,	0x4
	fba,a	%fcc0,	loop_2040
	movle	%xcc,	%l5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o0,	0x19EF,	%g6
loop_2040:
	movrlez	%l1,	0x314,	%i2
	xnor	%o6,	0x12A4,	%l3
	sllx	%g5,	0x19,	%i4
	prefetch	[%l7 + 0x78],	 0x2
	ldstub	[%l7 + 0x31],	%o1
	fpsub32s	%f8,	%f8,	%f12
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	fmovdn	%icc,	%f2,	%f27
	movrlez	%o4,	%g1,	%l2
	tge	%xcc,	0x2
	nop
	setx	loop_2041,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8sux16	%f6,	%f24,	%f24
	movne	%xcc,	%g3,	%i1
	addc	%o2,	0x0231,	%g4
loop_2041:
	addc	%o3,	0x15B3,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o5,	%g7
	bshuffle	%f4,	%f12,	%f4
	movrlz	%i5,	0x190,	%l6
	edge16ln	%l4,	%i0,	%l0
	fmovsneg	%icc,	%f22,	%f2
	addccc	%o7,	%i3,	%i7
	array16	%o0,	%l5,	%l1
	xorcc	%i2,	%o6,	%l3
	tneg	%xcc,	0x3
	fmovrslz	%g5,	%f7,	%f10
	xorcc	%i4,	0x0095,	%o1
	edge32n	%g6,	%o4,	%g1
	edge8l	%g2,	%l2,	%i1
	set	0x45, %i7
	lduba	[%l7 + %i7] 0x14,	%o2
	orcc	%g3,	0x1BD4,	%o3
	fmovdvc	%icc,	%f21,	%f20
	xorcc	%i6,	%o5,	%g7
	srax	%g4,	0x08,	%l6
	xor	%l4,	0x0C4F,	%i5
	orcc	%i0,	0x1568,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i3,	%o7
	tne	%icc,	0x6
	fmovdge	%icc,	%f20,	%f5
	srlx	%i7,	0x08,	%o0
	tpos	%xcc,	0x4
	ta	%icc,	0x7
	brz,a	%l1,	loop_2042
	membar	0x4C
	fnands	%f4,	%f6,	%f12
	ble	%xcc,	loop_2043
loop_2042:
	pdist	%f18,	%f18,	%f24
	set	0x5C, %l1
	stwa	%i2,	[%l7 + %l1] 0x22
	membar	#Sync
loop_2043:
	ldsb	[%l7 + 0x13],	%l5
	tpos	%xcc,	0x6
	fble,a	%fcc2,	loop_2044
	fmovsl	%icc,	%f14,	%f29
	fnand	%f22,	%f10,	%f28
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x04,	 0x3
loop_2044:
	tl	%icc,	0x5
	udivcc	%g5,	0x1562,	%l3
	edge16n	%i4,	%g6,	%o4
	tg	%xcc,	0x2
	nop
	fitos	%f8,	%f27
	fstox	%f27,	%f14
	fxtos	%f14,	%f28
	or	%g1,	0x1A5A,	%g2
	move	%icc,	%o1,	%l2
	fbule,a	%fcc0,	loop_2045
	stw	%o2,	[%l7 + 0x08]
	movne	%xcc,	%i1,	%o3
	fpmerge	%f9,	%f28,	%f20
loop_2045:
	tcs	%icc,	0x1
	be,a,pt	%xcc,	loop_2046
	ld	[%l7 + 0x38],	%f14
	st	%f27,	[%l7 + 0x7C]
	srax	%i6,	0x1D,	%g3
loop_2046:
	movpos	%xcc,	%g7,	%o5
	ldstub	[%l7 + 0x73],	%g4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	fmovsne	%icc,	%f1,	%f11
	fmovs	%f11,	%f20
	and	%i5,	0x0F13,	%i0
	move	%icc,	%l6,	%l0
	array8	%i3,	%i7,	%o0
	ldd	[%l7 + 0x28],	%f18
	fmovdneg	%xcc,	%f3,	%f21
	fbue	%fcc2,	loop_2047
	nop
	setx	0xEC1AF19AD32F2D89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x69EC5DACE82D9A6A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f0,	%f10
	fsrc1	%f26,	%f6
	movcs	%xcc,	%o7,	%i2
loop_2047:
	alignaddr	%l1,	%l5,	%o6
	movn	%icc,	%l3,	%g5
	fpadd32s	%f23,	%f26,	%f16
	movrne	%i4,	%g6,	%o4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	sllx	%o1,	%l2,	%o2
	tle	%icc,	0x2
	fsrc2	%f18,	%f26
	nop
	setx	0xE8E3BC65049EAD2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9CAAD8B2098371CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f4,	%f12
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f2
	fmovsleu	%xcc,	%f25,	%f10
	edge8n	%g1,	%o3,	%i1
	wr	%g0,	0x18,	%asi
	stha	%i6,	[%l7 + 0x0E] %asi
	xor	%g3,	%o5,	%g4
	fmul8sux16	%f26,	%f14,	%f26
	nop
	setx	0x369B49422049F003,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	umulcc	%g7,	%i5,	%l4
	tgu	%xcc,	0x5
	fxnors	%f20,	%f25,	%f16
	set	0x6C, %o4
	lduwa	[%l7 + %o4] 0x15,	%i0
	movrne	%l6,	%i3,	%l0
	fmovsg	%xcc,	%f4,	%f14
	fexpand	%f20,	%f30
	array32	%i7,	%o0,	%i2
	sub	%o7,	%l1,	%l5
	alignaddrl	%l3,	%g5,	%o6
	fsrc2s	%f6,	%f20
	ta	%xcc,	0x1
	tge	%xcc,	0x3
	tsubcctv	%i4,	0x0E4F,	%o4
	tle	%icc,	0x3
	edge16l	%g2,	%o1,	%g6
	movvc	%icc,	%o2,	%l2
	bgu,a	%icc,	loop_2048
	alignaddr	%o3,	%g1,	%i1
	fmovsleu	%icc,	%f15,	%f22
	edge32	%g3,	%i6,	%o5
loop_2048:
	movpos	%icc,	%g4,	%i5
	tpos	%xcc,	0x1
	popc	0x0C9E,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%l6
	umulcc	%i0,	%i3,	%l0
	brnz,a	%o0,	loop_2049
	ldd	[%l7 + 0x30],	%i6
	fbule	%fcc3,	loop_2050
	fmul8x16au	%f30,	%f28,	%f26
loop_2049:
	movrlz	%i2,	%o7,	%l1
	edge32l	%l3,	%l5,	%o6
loop_2050:
	fmovrde	%g5,	%f18,	%f26
	fnot1s	%f26,	%f20
	udiv	%o4,	0x1CB6,	%g2
	fandnot2	%f0,	%f16,	%f10
	bgu	%icc,	loop_2051
	fmovrse	%o1,	%f1,	%f18
	fmovsn	%xcc,	%f23,	%f19
	bl,a,pt	%icc,	loop_2052
loop_2051:
	fmovdneg	%icc,	%f27,	%f16
	edge16l	%i4,	%o2,	%g6
	fbul,a	%fcc1,	loop_2053
loop_2052:
	edge8ln	%o3,	%l2,	%g1
	ldub	[%l7 + 0x7A],	%i1
	movpos	%xcc,	%g3,	%o5
loop_2053:
	nop
	set	0x38, %g6
	lduwa	[%l7 + %g6] 0x15,	%i6
	tvc	%icc,	0x6
	edge32l	%g4,	%i5,	%g7
	fbg,a	%fcc0,	loop_2054
	or	%l6,	0x0743,	%i0
	std	%f0,	[%l7 + 0x70]
	movrgz	%l4,	%l0,	%o0
loop_2054:
	mulx	%i7,	0x1DAC,	%i2
	edge8	%o7,	%l1,	%l3
	subccc	%l5,	%i3,	%g5
	fmovrdlz	%o6,	%f12,	%f2
	fcmple16	%f8,	%f26,	%o4
	subccc	%g2,	0x1888,	%o1
	movvc	%xcc,	%i4,	%g6
	sir	0x19EB
	brlez	%o2,	loop_2055
	edge8n	%l2,	%o3,	%g1
	orcc	%i1,	0x188D,	%o5
	udiv	%g3,	0x06D9,	%i6
loop_2055:
	subc	%i5,	0x1A39,	%g4
	bvs,pn	%icc,	loop_2056
	fpack32	%f4,	%f4,	%f4
	fnor	%f18,	%f18,	%f22
	tpos	%xcc,	0x4
loop_2056:
	edge8l	%l6,	%i0,	%l4
	movcc	%icc,	%l0,	%g7
	te	%xcc,	0x6
	smul	%o0,	%i7,	%i2
	addc	%l1,	0x0C1C,	%o7
	edge16l	%l3,	%i3,	%l5
	edge8n	%o6,	%g5,	%o4
	movrgz	%o1,	%i4,	%g6
	wr	%g0,	0x27,	%asi
	stwa	%g2,	[%l7 + 0x20] %asi
	membar	#Sync
	fexpand	%f5,	%f20
	bneg,pt	%icc,	loop_2057
	edge16n	%l2,	%o3,	%g1
	edge32	%i1,	%o2,	%g3
	brgez	%o5,	loop_2058
loop_2057:
	popc	0x1996,	%i5
	edge8ln	%g4,	%l6,	%i0
	bgu	loop_2059
loop_2058:
	subcc	%l4,	%i6,	%l0
	te	%icc,	0x6
	edge32ln	%o0,	%i7,	%i2
loop_2059:
	nop
	setx	0x21AA543E5E779CFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x21B1F4BF594BD2CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f0,	%f6
	fnot1s	%f28,	%f0
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f4
	tpos	%xcc,	0x3
	ldub	[%l7 + 0x6B],	%g7
	ldsw	[%l7 + 0x48],	%o7
	movcs	%xcc,	%l3,	%l1
	sdiv	%l5,	0x1F0E,	%o6
	tl	%xcc,	0x1
	nop
	fitos	%f1,	%f15
	fstod	%f15,	%f2
	addccc	%i3,	%o4,	%g5
	fbule	%fcc2,	loop_2060
	membar	0x1D
	alignaddrl	%o1,	%g6,	%i4
	fpack16	%f12,	%f25
loop_2060:
	membar	0x09
	udivcc	%g2,	0x13CB,	%l2
	edge8l	%o3,	%i1,	%g1
	bge,pn	%xcc,	loop_2061
	ldsh	[%l7 + 0x68],	%o2
	movgu	%xcc,	%g3,	%o5
	movn	%icc,	%i5,	%l6
loop_2061:
	edge8ln	%g4,	%i0,	%l4
	lduh	[%l7 + 0x54],	%l0
	movre	%i6,	0x2B7,	%i7
	fmul8x16au	%f9,	%f12,	%f6
	fbug,a	%fcc3,	loop_2062
	fcmpgt16	%f8,	%f0,	%o0
	movl	%xcc,	%g7,	%i2
	addc	%l3,	%o7,	%l5
loop_2062:
	brnz,a	%o6,	loop_2063
	stx	%i3,	[%l7 + 0x18]
	edge32	%l1,	%g5,	%o4
	fmul8x16al	%f2,	%f0,	%f18
loop_2063:
	movrgz	%g6,	0x344,	%i4
	xor	%o1,	0x15A9,	%g2
	fbue	%fcc3,	loop_2064
	bgu	loop_2065
	xorcc	%o3,	0x1775,	%l2
	bcs	%xcc,	loop_2066
loop_2064:
	pdist	%f28,	%f18,	%f20
loop_2065:
	tge	%xcc,	0x0
	movre	%i1,	%o2,	%g1
loop_2066:
	edge32l	%o5,	%i5,	%l6
	andn	%g4,	%g3,	%l4
	fmovde	%icc,	%f2,	%f31
	be,a	loop_2067
	movn	%xcc,	%i0,	%l0
	fnegd	%f20,	%f4
	fmovsa	%icc,	%f2,	%f15
loop_2067:
	xnorcc	%i7,	%i6,	%o0
	fxnors	%f0,	%f5,	%f16
	edge32n	%g7,	%i2,	%l3
	edge16	%l5,	%o6,	%i3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x38] %asi,	%o7
	edge16	%l1,	%g5,	%o4
	tge	%xcc,	0x4
	edge16l	%i4,	%o1,	%g2
	fmovse	%xcc,	%f23,	%f24
	sllx	%o3,	%l2,	%i1
	and	%g6,	0x1CEE,	%o2
	movrgz	%o5,	0x0B2,	%g1
	tn	%icc,	0x6
	fmovsvs	%icc,	%f14,	%f12
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i5,	[%g0 + 0x3b8] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fpadd32s	%f27,	%f30,	%f26
	movre	%l6,	%g4,	%g3
	movn	%icc,	%i0,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%i6
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xe3,	%i6
	tcs	%icc,	0x1
	edge16n	%o0,	%i2,	%g7
	fsrc1	%f22,	%f14
	smul	%l3,	%l5,	%i3
	membar	0x5F
	edge16l	%o6,	%o7,	%l1
	edge32	%o4,	%i4,	%o1
	movrlez	%g2,	%o3,	%l2
	fmovrdne	%g5,	%f16,	%f4
	orcc	%g6,	0x07E7,	%i1
	tpos	%icc,	0x1
	tcc	%icc,	0x3
	andcc	%o2,	0x1650,	%o5
	nop
	setx	loop_2068,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot1	%f20,	%f22,	%f24
	subccc	%g1,	0x0431,	%i5
	nop
	setx	0xC8DD28AA035F51AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f0
loop_2068:
	movne	%xcc,	%g4,	%g3
	or	%l6,	%i0,	%l0
	fmovsleu	%icc,	%f27,	%f23
	fmovsvc	%xcc,	%f31,	%f2
	te	%icc,	0x6
	edge8	%i6,	%i7,	%o0
	bcs,a	loop_2069
	bne	%icc,	loop_2070
	tge	%icc,	0x2
	wr	%g0,	0x04,	%asi
	stwa	%i2,	[%l7 + 0x28] %asi
loop_2069:
	bvc,pt	%icc,	loop_2071
loop_2070:
	tn	%icc,	0x0
	add	%l4,	%g7,	%l3
	array32	%i3,	%l5,	%o7
loop_2071:
	be	loop_2072
	fpackfix	%f0,	%f6
	movgu	%icc,	%o6,	%o4
	nop
	fitos	%f5,	%f31
	fstoi	%f31,	%f11
loop_2072:
	edge16ln	%i4,	%l1,	%g2
	fbule,a	%fcc3,	loop_2073
	addc	%o3,	0x0249,	%o1
	subc	%l2,	%g6,	%i1
	tge	%icc,	0x0
loop_2073:
	fand	%f0,	%f4,	%f16
	sir	0x1438
	fpmerge	%f0,	%f14,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g5,	%o5
	std	%f12,	[%l7 + 0x38]
	tsubcc	%o2,	0x0ECB,	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%g1
	tneg	%icc,	0x5
	srlx	%g3,	0x1A,	%i0
	fmovrsne	%l0,	%f8,	%f25
	andncc	%i6,	%i7,	%o0
	lduh	[%l7 + 0x3C],	%i2
	edge16	%l4,	%l6,	%g7
	xor	%i3,	%l3,	%l5
	mova	%icc,	%o6,	%o4
	tsubcc	%o7,	%i4,	%g2
	fbul,a	%fcc2,	loop_2074
	membar	0x1F
	movleu	%icc,	%o3,	%o1
	fbu	%fcc3,	loop_2075
loop_2074:
	movrgez	%l1,	0x3A7,	%g6
	movre	%i1,	0x28D,	%l2
	stb	%g5,	[%l7 + 0x4D]
loop_2075:
	te	%xcc,	0x3
	tn	%xcc,	0x0
	tle	%xcc,	0x4
	fbne,a	%fcc2,	loop_2076
	bshuffle	%f2,	%f0,	%f26
	xnorcc	%o2,	0x1044,	%i5
	bvc,a	loop_2077
loop_2076:
	fnot1s	%f11,	%f27
	movle	%icc,	%g4,	%g1
	fcmpgt32	%f8,	%f2,	%g3
loop_2077:
	umul	%o5,	0x0D2D,	%l0
	fnand	%f10,	%f14,	%f22
	addccc	%i0,	%i6,	%o0
	tleu	%xcc,	0x4
	fbl	%fcc1,	loop_2078
	fbg,a	%fcc3,	loop_2079
	srax	%i2,	0x05,	%i7
	fblg,a	%fcc0,	loop_2080
loop_2078:
	udiv	%l4,	0x0511,	%l6
loop_2079:
	fmovdcs	%xcc,	%f5,	%f3
	and	%g7,	%i3,	%l3
loop_2080:
	fcmpne32	%f28,	%f6,	%o6
	be,pn	%icc,	loop_2081
	bn	loop_2082
	tcc	%xcc,	0x3
	edge8l	%o4,	%o7,	%i4
loop_2081:
	sra	%g2,	0x16,	%o3
loop_2082:
	call	loop_2083
	srax	%l5,	0x1E,	%o1
	edge8ln	%g6,	%i1,	%l1
	be,a	%icc,	loop_2084
loop_2083:
	fbul,a	%fcc0,	loop_2085
	bne	%xcc,	loop_2086
	movrlz	%g5,	0x095,	%o2
loop_2084:
	brz	%i5,	loop_2087
loop_2085:
	andcc	%l2,	0x0539,	%g4
loop_2086:
	edge16l	%g3,	%g1,	%l0
	movle	%icc,	%o5,	%i6
loop_2087:
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f6
	sdivx	%i0,	0x0864,	%i2
	udivx	%i7,	0x042B,	%o0
	srl	%l6,	0x1F,	%l4
	movrgz	%i3,	0x3F2,	%g7
	set	0x108, %o5
	stxa	%l3,	[%g0 + %o5] 0x21
	for	%f14,	%f30,	%f0
	udivcc	%o4,	0x1E20,	%o6
	xorcc	%o7,	0x084A,	%g2
	orncc	%i4,	%l5,	%o3
	addc	%g6,	0x17B8,	%i1
	stb	%o1,	[%l7 + 0x66]
	fmovse	%xcc,	%f4,	%f31
	tgu	%icc,	0x7
	tge	%xcc,	0x6
	fmovdgu	%icc,	%f29,	%f22
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1A] %asi,	%l1
	bleu	%xcc,	loop_2088
	edge8l	%g5,	%o2,	%l2
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0x0
loop_2088:
	andncc	%g4,	%g3,	%l0
	smul	%o5,	%i6,	%i0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x28] %asi,	%i2
	movne	%icc,	%i7,	%o0
	fcmpgt16	%f2,	%f22,	%g1
	fmovrse	%l6,	%f19,	%f16
	orncc	%l4,	0x037B,	%g7
	tle	%icc,	0x1
	andncc	%l3,	%i3,	%o4
	set	0x68, %i6
	stxa	%o6,	[%l7 + %i6] 0x19
	movrlez	%g2,	0x07F,	%o7
	fmovd	%f6,	%f20
	umul	%l5,	0x1E2F,	%o3
	fble	%fcc0,	loop_2089
	fbl,a	%fcc2,	loop_2090
	fbu	%fcc3,	loop_2091
	stbar
loop_2089:
	tsubcctv	%i4,	0x0C82,	%g6
loop_2090:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%o1,	[%l7 + 0x48] %asi
	membar	#Sync
loop_2091:
	sra	%l1,	%i1,	%o2
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g5
	edge32n	%l2,	%i5,	%g4
	movrlez	%g3,	%o5,	%l0
	mova	%xcc,	%i6,	%i2
	tleu	%icc,	0x1
	prefetch	[%l7 + 0x5C],	 0x0
	ldd	[%l7 + 0x20],	%f12
	tne	%icc,	0x3
	movge	%icc,	%i7,	%i0
	add	%g1,	0x0D70,	%l6
	edge32n	%o0,	%g7,	%l3
	nop
	setx	loop_2092,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%l4,	%o4,	%i3
	tsubcctv	%o6,	0x1DA2,	%o7
	fbn	%fcc2,	loop_2093
loop_2092:
	fpack16	%f26,	%f25
	fmul8x16au	%f21,	%f7,	%f26
	addc	%l5,	%o3,	%g2
loop_2093:
	edge32	%g6,	%i4,	%o1
	bge,pt	%xcc,	loop_2094
	add	%l1,	%i1,	%o2
	fcmple16	%f8,	%f16,	%g5
	fba,a	%fcc3,	loop_2095
loop_2094:
	fmovsgu	%icc,	%f8,	%f8
	sllx	%i5,	%g4,	%l2
	ldd	[%l7 + 0x50],	%o4
loop_2095:
	movvc	%xcc,	%l0,	%g3
	and	%i2,	0x13B8,	%i6
	tle	%icc,	0x1
	wr	%g0,	0x04,	%asi
	sta	%f8,	[%l7 + 0x48] %asi
	fbe	%fcc0,	loop_2096
	sir	0x1ADA
	bpos	%xcc,	loop_2097
	nop
	setx	0x799461387B2AC2E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6787D2554A96C619,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f18,	%f28
loop_2096:
	tg	%xcc,	0x0
	fpadd32	%f24,	%f8,	%f28
loop_2097:
	tvs	%xcc,	0x6
	fcmpeq16	%f8,	%f10,	%i0
	edge16l	%g1,	%l6,	%i7
	and	%g7,	%o0,	%l3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x1E] %asi,	%o4
	tn	%icc,	0x7
	xnorcc	%l4,	%i3,	%o7
	fcmpgt32	%f18,	%f16,	%l5
	edge16ln	%o6,	%o3,	%g2
	edge8n	%g6,	%i4,	%o1
	movrgez	%l1,	%i1,	%o2
	movpos	%xcc,	%g5,	%g4
	fmovrslz	%i5,	%f12,	%f19
	movrne	%o5,	0x279,	%l0
	fmovsl	%icc,	%f8,	%f15
	fcmpgt32	%f0,	%f20,	%l2
	tvs	%icc,	0x7
	andncc	%i2,	%g3,	%i0
	tn	%icc,	0x2
	or	%g1,	0x1D93,	%l6
	smulcc	%i7,	%g7,	%o0
	nop
	setx	0x11CBDE5714B14E92,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f22,	%f12,	%f14
	fmovdge	%xcc,	%f8,	%f20
	orncc	%l3,	0x0D33,	%o4
	movne	%icc,	%l4,	%i6
	xor	%i3,	0x1F64,	%l5
	call	loop_2098
	tl	%icc,	0x7
	tle	%xcc,	0x2
	movge	%icc,	%o7,	%o3
loop_2098:
	sir	0x0BB1
	xnorcc	%o6,	%g2,	%i4
	ldsw	[%l7 + 0x14],	%g6
	bshuffle	%f28,	%f16,	%f4
	call	loop_2099
	movrne	%l1,	%o1,	%o2
	sdivcc	%g5,	0x14A8,	%i1
	ldd	[%l7 + 0x60],	%g4
loop_2099:
	movpos	%xcc,	%i5,	%o5
	taddcctv	%l2,	0x0699,	%l0
	fornot2	%f30,	%f22,	%f16
	movrgz	%i2,	0x131,	%g3
	sdivx	%i0,	0x11ED,	%g1
	fandnot1s	%f11,	%f16,	%f25
	movrgez	%l6,	%g7,	%i7
	xor	%o0,	%o4,	%l4
	mulx	%l3,	%i6,	%l5
	fblg,a	%fcc2,	loop_2100
	fmovrdgz	%i3,	%f28,	%f16
	addc	%o3,	%o7,	%g2
	umul	%o6,	%i4,	%g6
loop_2100:
	movn	%icc,	%o1,	%o2
	nop
	setx loop_2101, %l0, %l1
	jmpl %l1, %g5
	subcc	%i1,	%g4,	%l1
	movvc	%xcc,	%o5,	%l2
	tsubcc	%l0,	0x0C06,	%i2
loop_2101:
	fmovrde	%i5,	%f28,	%f20
	edge32ln	%g3,	%g1,	%i0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fblg	%fcc3,	loop_2102
	fpadd16s	%f11,	%f21,	%f21
	sllx	%l6,	%i7,	%g7
	xorcc	%o4,	0x0671,	%o0
loop_2102:
	tsubcctv	%l4,	0x0CD6,	%i6
	sdiv	%l5,	0x1F9A,	%i3
	movpos	%icc,	%o3,	%o7
	fpadd32s	%f7,	%f3,	%f10
	swap	[%l7 + 0x3C],	%g2
	tcs	%icc,	0x6
	movrne	%l3,	%o6,	%g6
	andncc	%i4,	%o2,	%o1
	tge	%xcc,	0x6
	fbn	%fcc1,	loop_2103
	and	%i1,	0x129D,	%g5
	mova	%xcc,	%l1,	%g4
	fmovsneg	%xcc,	%f8,	%f23
loop_2103:
	fmovdvs	%icc,	%f14,	%f14
	fbue,a	%fcc3,	loop_2104
	fnands	%f0,	%f5,	%f22
	fmovrsne	%l2,	%f9,	%f4
	tneg	%xcc,	0x0
loop_2104:
	and	%l0,	0x0BB1,	%o5
	udivcc	%i5,	0x0DE1,	%g3
	fbule,a	%fcc2,	loop_2105
	fmovsl	%xcc,	%f25,	%f6
	lduh	[%l7 + 0x58],	%i2
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f18
loop_2105:
	fbul,a	%fcc2,	loop_2106
	movl	%icc,	%i0,	%l6
	tg	%icc,	0x5
	ba	%icc,	loop_2107
loop_2106:
	popc	0x0349,	%i7
	movrlez	%g1,	0x3A4,	%o4
	nop
	setx	0xFC290FF7934B61FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xAA972F74F1BFD646,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f26,	%f10
loop_2107:
	nop
	setx loop_2108, %l0, %l1
	jmpl %l1, %o0
	fnands	%f25,	%f16,	%f11
	membar	0x75
	wr	%g0,	0x19,	%asi
	stwa	%g7,	[%l7 + 0x3C] %asi
loop_2108:
	fnor	%f28,	%f10,	%f26
	fmovdleu	%icc,	%f21,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xCEB6FFFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f18
	fbge,a	%fcc2,	loop_2109
	ta	%icc,	0x2
	or	%l4,	%l5,	%i6
	addcc	%o3,	%i3,	%g2
loop_2109:
	nop
	setx	loop_2110,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o7,	0x0C2,	%o6
	edge32ln	%l3,	%g6,	%i4
	fmovscc	%icc,	%f24,	%f27
loop_2110:
	movl	%icc,	%o1,	%o2
	andcc	%i1,	%g5,	%g4
	movge	%xcc,	%l1,	%l0
	fmovrdlez	%l2,	%f28,	%f22
	membar	0x45
	fbu,a	%fcc2,	loop_2111
	fsrc1	%f18,	%f30
	movre	%o5,	%i5,	%i2
	smul	%i0,	0x07E1,	%l6
loop_2111:
	taddcc	%i7,	0x16B2,	%g3
	bcs,pt	%xcc,	loop_2112
	lduh	[%l7 + 0x44],	%g1
	fabsd	%f28,	%f26
	fbule	%fcc2,	loop_2113
loop_2112:
	fbn,a	%fcc0,	loop_2114
	and	%o0,	%g7,	%l4
	tvs	%xcc,	0x4
loop_2113:
	tn	%xcc,	0x2
loop_2114:
	tcs	%xcc,	0x7
	bleu	loop_2115
	prefetch	[%l7 + 0x50],	 0x1
	subcc	%o4,	0x16A6,	%l5
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i6
loop_2115:
	ldsw	[%l7 + 0x40],	%i3
	ldstub	[%l7 + 0x18],	%g2
	andncc	%o3,	%o6,	%l3
	subcc	%o7,	0x0EBD,	%g6
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f4
	fxtod	%f4,	%f28
	edge16n	%i4,	%o1,	%i1
	fcmpeq16	%f14,	%f28,	%o2
	edge16ln	%g5,	%l1,	%l0
	smulcc	%l2,	%o5,	%g4
	fmovrdlez	%i2,	%f18,	%f30
	edge8	%i5,	%l6,	%i7
	fpackfix	%f20,	%f18
	udivcc	%g3,	0x0F6B,	%i0
	wr	%g0,	0x0c,	%asi
	stba	%o0,	[%l7 + 0x3B] %asi
	subcc	%g7,	%g1,	%l4
	orncc	%l5,	%o4,	%i3
	movg	%icc,	%g2,	%i6
	fnot1s	%f20,	%f27
	popc	0x04A5,	%o6
	edge16l	%l3,	%o7,	%g6
	orcc	%o3,	0x1E43,	%o1
	fmovscs	%xcc,	%f15,	%f25
	movne	%xcc,	%i4,	%o2
	tleu	%xcc,	0x4
	tvs	%icc,	0x7
	fmul8ulx16	%f4,	%f30,	%f4
	srl	%g5,	%i1,	%l1
	fbo,a	%fcc3,	loop_2116
	edge16n	%l2,	%l0,	%g4
	sra	%i2,	%i5,	%l6
	bshuffle	%f10,	%f20,	%f14
loop_2116:
	mulx	%i7,	0x0659,	%o5
	fbne	%fcc1,	loop_2117
	movleu	%xcc,	%g3,	%i0
	sdivx	%g7,	0x1791,	%g1
	fmovrsne	%o0,	%f11,	%f28
loop_2117:
	bn,a,pt	%icc,	loop_2118
	fmovdle	%xcc,	%f21,	%f11
	flush	%l7 + 0x50
	swap	[%l7 + 0x20],	%l4
loop_2118:
	fxnors	%f4,	%f2,	%f16
	movpos	%xcc,	%l5,	%i3
	fnor	%f4,	%f14,	%f18
	smul	%g2,	%o4,	%o6
	tsubcctv	%i6,	%l3,	%o7
	edge16	%o3,	%o1,	%g6
	membar	0x3B
	sub	%o2,	%i4,	%i1
	membar	0x7B
	bleu,pn	%xcc,	loop_2119
	ld	[%l7 + 0x78],	%f29
	fble	%fcc1,	loop_2120
	movrne	%l1,	0x1AE,	%g5
loop_2119:
	subc	%l0,	0x1106,	%g4
	movl	%icc,	%i2,	%l2
loop_2120:
	nop
	setx	0xFA848ACCC5447A77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x8855A9B0C65F5C0E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f28,	%f18
	fmovsneg	%icc,	%f21,	%f28
	sir	0x08A3
	xorcc	%i5,	0x1B62,	%l6
	movrgez	%o5,	%g3,	%i7
	xnorcc	%g7,	%i0,	%g1
	set	0x3F, %o1
	stba	%l4,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	setx	0x7064300F,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	movrlez	%o0,	0x2FD,	%l5
	te	%icc,	0x2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g2
	movcc	%xcc,	%o6,	%o4
	edge32n	%i6,	%l3,	%o7
	orncc	%o3,	%o1,	%o2
	edge32	%i4,	%g6,	%i1
	movrgez	%g5,	0x0FF,	%l0
	array8	%l1,	%g4,	%i2
	fzero	%f0
	movgu	%icc,	%l2,	%l6
	subccc	%i5,	%o5,	%g3
	orcc	%i7,	%g7,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f8,	%f0,	%f24
	movne	%xcc,	%g1,	%o0
	taddcctv	%l4,	0x1CB5,	%i3
	edge32	%g2,	%o6,	%l5
	fornot2	%f30,	%f20,	%f2
	sir	0x1039
	fbg,a	%fcc0,	loop_2121
	fpmerge	%f3,	%f9,	%f6
	udivcc	%o4,	0x0F87,	%i6
	bn,a	loop_2122
loop_2121:
	fmovdcs	%xcc,	%f31,	%f22
	xor	%l3,	%o3,	%o1
	movre	%o7,	%o2,	%i4
loop_2122:
	ble,a	loop_2123
	tsubcctv	%i1,	%g5,	%g6
	fbu,a	%fcc1,	loop_2124
	movge	%icc,	%l0,	%g4
loop_2123:
	udiv	%l1,	0x1139,	%i2
	fble	%fcc2,	loop_2125
loop_2124:
	movleu	%xcc,	%l2,	%l6
	stw	%i5,	[%l7 + 0x28]
	nop
	setx	0x689C27C7CBB5102E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB8900215FEC6EB09,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f2,	%f30
loop_2125:
	nop
	set	0x70, %i0
	lduwa	[%l7 + %i0] 0x81,	%g3
	nop
	setx	0x4974B1F09DC2D05C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f30
	ldsh	[%l7 + 0x28],	%i7
	fbul	%fcc2,	loop_2126
	srl	%g7,	0x02,	%i0
	movcc	%icc,	%o5,	%o0
	edge32	%l4,	%i3,	%g2
loop_2126:
	sub	%o6,	%l5,	%o4
	and	%g1,	%i6,	%l3
	movrgez	%o1,	0x237,	%o7
	tn	%icc,	0x5
	nop
	setx	loop_2127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul	%fcc0,	loop_2128
	sethi	0x10A8,	%o2
	fabss	%f30,	%f19
loop_2127:
	edge8l	%o3,	%i1,	%g5
loop_2128:
	edge8n	%g6,	%l0,	%i4
	fmul8sux16	%f10,	%f28,	%f12
	tsubcc	%l1,	0x14D0,	%g4
	membar	0x56
	tvs	%icc,	0x1
	xorcc	%l2,	%l6,	%i5
	udivx	%i2,	0x1189,	%g3
	subccc	%g7,	0x0203,	%i7
	fbe,a	%fcc0,	loop_2129
	tcc	%xcc,	0x6
	fmovsgu	%xcc,	%f25,	%f17
	sdiv	%o5,	0x0FC1,	%o0
loop_2129:
	fcmpgt16	%f6,	%f18,	%l4
	ba,pt	%icc,	loop_2130
	tle	%xcc,	0x5
	fmovsle	%icc,	%f17,	%f21
	and	%i3,	0x13DE,	%i0
loop_2130:
	orcc	%o6,	%g2,	%l5
	mulx	%g1,	0x126D,	%i6
	fcmpne16	%f14,	%f4,	%o4
	bshuffle	%f22,	%f4,	%f4
	stw	%o1,	[%l7 + 0x3C]
	bvs,a,pn	%xcc,	loop_2131
	movrgz	%l3,	%o7,	%o2
	fornot2	%f12,	%f6,	%f12
	tle	%icc,	0x3
loop_2131:
	tne	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x6
	fornot1	%f14,	%f18,	%f22
	movrlez	%o3,	0x078,	%g5
	movvc	%xcc,	%g6,	%i1
	tl	%icc,	0x5
	brz	%l0,	loop_2132
	fcmpeq16	%f18,	%f6,	%l1
	udiv	%g4,	0x16C9,	%l2
	andn	%i4,	0x1F41,	%i5
loop_2132:
	orcc	%i2,	0x1979,	%l6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%g3
	andcc	%g7,	0x1BFA,	%o5
	movcc	%icc,	%i7,	%l4
	edge16ln	%i3,	%o0,	%o6
	tsubcc	%i0,	0x1503,	%g2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%g1
	array32	%i6,	%o1,	%l3
	fones	%f15
	movrgz	%o4,	0x063,	%o7
	tvc	%icc,	0x4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o2,	%o3
	tvs	%icc,	0x2
	sllx	%g6,	%i1,	%l0
	tpos	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f18,	%f8,	%f26
	sdivcc	%g5,	0x0029,	%g4
	set	0x48, %l4
	sta	%f9,	[%l7 + %l4] 0x04
	fba,a	%fcc2,	loop_2133
	tg	%xcc,	0x1
	bcc	loop_2134
	sethi	0x0741,	%l1
loop_2133:
	movrlez	%l2,	%i5,	%i4
	edge8ln	%l6,	%i2,	%g7
loop_2134:
	ldd	[%l7 + 0x58],	%f24
	ta	%icc,	0x2
	fmul8x16al	%f29,	%f8,	%f6
	sdivx	%g3,	0x17BA,	%o5
	nop
	setx loop_2135, %l0, %l1
	jmpl %l1, %l4
	orcc	%i7,	%o0,	%o6
	smul	%i3,	%i0,	%l5
	udiv	%g1,	0x0C5F,	%i6
loop_2135:
	xor	%o1,	%g2,	%o4
	set	0x68, %o3
	stba	%o7,	[%l7 + %o3] 0xea
	membar	#Sync
	array16	%l3,	%o3,	%g6
	brgez,a	%o2,	loop_2136
	tl	%icc,	0x0
	fbu	%fcc3,	loop_2137
	umulcc	%l0,	%g5,	%i1
loop_2136:
	movneg	%xcc,	%l1,	%g4
	addcc	%i5,	%i4,	%l2
loop_2137:
	ldd	[%l7 + 0x28],	%i6
	fmovdne	%icc,	%f31,	%f13
	addcc	%i2,	0x1056,	%g7
	fbu	%fcc1,	loop_2138
	fmovspos	%icc,	%f11,	%f15
	xorcc	%o5,	0x137A,	%g3
	fbne	%fcc3,	loop_2139
loop_2138:
	smulcc	%i7,	0x1619,	%l4
	udiv	%o0,	0x06D4,	%o6
	tleu	%xcc,	0x3
loop_2139:
	fcmpeq16	%f2,	%f30,	%i3
	edge8ln	%i0,	%g1,	%i6
	wr	%g0,	0x19,	%asi
	sta	%f10,	[%l7 + 0x2C] %asi
	nop
	setx	loop_2140,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%o1,	0x11,	%l5
	srax	%g2,	%o4,	%l3
	movrlez	%o7,	0x0AA,	%o3
loop_2140:
	fpadd16s	%f7,	%f21,	%f1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	umulcc	%l0,	%o2,	%g5
	stx	%l1,	[%l7 + 0x20]
	subccc	%i1,	0x11BA,	%i5
	tvs	%xcc,	0x0
	tpos	%icc,	0x3
	orn	%i4,	0x055D,	%l2
	st	%f7,	[%l7 + 0x3C]
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x80,	 0x0
	addcc	%g4,	%g7,	%o5
	edge8l	%g3,	%i7,	%i2
	movrlez	%o0,	0x0D5,	%l4
	edge8l	%o6,	%i0,	%g1
	movle	%icc,	%i6,	%i3
	edge32l	%o1,	%l5,	%o4
	srlx	%l3,	0x00,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o7,	%g6
	fpack16	%f10,	%f31
	nop
	setx	0x10447370,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	movge	%xcc,	%l0,	%o3
	bneg	loop_2141
	mulx	%o2,	%g5,	%l1
	edge32l	%i5,	%i1,	%l2
	movneg	%icc,	%i4,	%l6
loop_2141:
	add	%g4,	%o5,	%g7
	ldd	[%l7 + 0x18],	%f24
	fble	%fcc3,	loop_2142
	fmovrslz	%i7,	%f18,	%f9
	fands	%f12,	%f11,	%f2
	ld	[%l7 + 0x58],	%f9
loop_2142:
	movrlz	%i2,	0x13C,	%o0
	nop
	setx loop_2143, %l0, %l1
	jmpl %l1, %g3
	tcs	%xcc,	0x2
	tsubcc	%o6,	0x17AE,	%l4
	fmul8x16au	%f19,	%f15,	%f8
loop_2143:
	smulcc	%g1,	%i0,	%i3
	andcc	%i6,	%l5,	%o1
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f15
	edge32l	%l3,	%g2,	%o4
	bgu,a,pt	%xcc,	loop_2144
	tg	%xcc,	0x0
	membar	0x30
	movle	%icc,	%o7,	%l0
loop_2144:
	tvc	%icc,	0x0
	taddcc	%o3,	%g6,	%g5
	tgu	%icc,	0x0
	xorcc	%l1,	0x126A,	%o2
	edge32l	%i1,	%i5,	%i4
	fmovdne	%icc,	%f15,	%f16
	membar	0x27
	andcc	%l2,	0x1219,	%l6
	fpsub16s	%f16,	%f26,	%f31
	tcs	%icc,	0x3
	movn	%icc,	%o5,	%g4
	edge16ln	%i7,	%g7,	%o0
	tsubcc	%g3,	%o6,	%i2
	movle	%icc,	%l4,	%i0
	movrne	%i3,	%i6,	%g1
	or	%o1,	%l3,	%g2
	fpack16	%f6,	%f9
	fmovsl	%icc,	%f1,	%f6
	nop
	setx	0xA9FEB75FACC48166,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xCECCF008212DB7A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f24,	%f10
	edge32ln	%l5,	%o7,	%l0
	fmovse	%icc,	%f30,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f13,	%f8
	tle	%xcc,	0x6
	movrgez	%o4,	0x327,	%o3
	edge8n	%g5,	%g6,	%l1
	edge8ln	%i1,	%o2,	%i4
	tn	%icc,	0x2
	smulcc	%l2,	0x1BF1,	%l6
	udiv	%o5,	0x1639,	%i5
	brlz	%i7,	loop_2145
	movleu	%xcc,	%g4,	%o0
	movne	%icc,	%g3,	%g7
	movrne	%i2,	%o6,	%i0
loop_2145:
	edge32l	%l4,	%i6,	%i3
	movle	%icc,	%o1,	%g1
	movvc	%xcc,	%g2,	%l3
	nop
	set	0x70, %l5
	ldsw	[%l7 + %l5],	%l5
	sll	%l0,	0x0A,	%o4
	sth	%o3,	[%l7 + 0x78]
	fmovdgu	%xcc,	%f14,	%f23
	sra	%o7,	0x17,	%g5
	fmovsne	%icc,	%f19,	%f28
	ldx	[%l7 + 0x60],	%g6
	tpos	%icc,	0x2
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%i1
	fmovrslz	%l1,	%f8,	%f18
	fbul,a	%fcc0,	loop_2146
	fbne,a	%fcc3,	loop_2147
	fmovdne	%xcc,	%f11,	%f19
	sdivcc	%i4,	0x0D5B,	%o2
loop_2146:
	fbn,a	%fcc3,	loop_2148
loop_2147:
	edge16n	%l2,	%l6,	%i5
	mova	%icc,	%i7,	%o5
	fcmple32	%f16,	%f4,	%g4
loop_2148:
	fbl,a	%fcc1,	loop_2149
	sub	%g3,	0x0AFD,	%g7
	movgu	%xcc,	%o0,	%o6
	tsubcc	%i2,	0x0DED,	%l4
loop_2149:
	fmovdle	%xcc,	%f23,	%f28
	fble,a	%fcc0,	loop_2150
	orn	%i0,	%i6,	%o1
	smul	%i3,	0x181B,	%g1
	edge32ln	%l3,	%g2,	%l5
loop_2150:
	fandnot2	%f12,	%f8,	%f24
	fmovsn	%xcc,	%f28,	%f12
	fsrc2	%f0,	%f28
	std	%f2,	[%l7 + 0x28]
	fpack32	%f28,	%f0,	%f24
	tle	%icc,	0x4
	call	loop_2151
	movre	%o4,	0x075,	%l0
	edge8n	%o3,	%o7,	%g6
	subc	%g5,	%i1,	%i4
loop_2151:
	call	loop_2152
	add	%l1,	0x0F5A,	%o2
	or	%l2,	%l6,	%i5
	edge8ln	%o5,	%g4,	%g3
loop_2152:
	movn	%xcc,	%i7,	%g7
	fmovdpos	%icc,	%f8,	%f26
	bneg,pt	%xcc,	loop_2153
	orcc	%o0,	%o6,	%l4
	tcs	%icc,	0x7
	movle	%xcc,	%i2,	%i0
loop_2153:
	fsrc1	%f12,	%f14
	andncc	%i6,	%o1,	%i3
	orncc	%l3,	%g1,	%g2
	edge32ln	%l5,	%l0,	%o4
	alignaddr	%o3,	%g6,	%g5
	edge16n	%i1,	%i4,	%o7
	tne	%xcc,	0x1
	edge16n	%o2,	%l2,	%l1
	membar	0x78
	xnor	%l6,	%o5,	%g4
	srax	%g3,	%i5,	%g7
	movrlz	%o0,	0x1CA,	%o6
	fbu	%fcc3,	loop_2154
	fmuld8sux16	%f0,	%f25,	%f10
	movne	%xcc,	%i7,	%l4
	edge16ln	%i0,	%i2,	%o1
loop_2154:
	subcc	%i3,	0x10E0,	%i6
	tg	%icc,	0x6
	orn	%g1,	0x0481,	%g2
	array32	%l5,	%l3,	%l0
	fble,a	%fcc2,	loop_2155
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o4,	%o3,	%g5
	ldsh	[%l7 + 0x6A],	%g6
loop_2155:
	taddcctv	%i1,	%o7,	%i4
	addccc	%l2,	0x0073,	%o2
	edge16ln	%l6,	%l1,	%g4
	fmul8x16au	%f15,	%f8,	%f4
	fmovdvs	%xcc,	%f15,	%f29
	andcc	%g3,	%i5,	%g7
	tn	%xcc,	0x7
	movrgez	%o0,	0x1A0,	%o5
	tvc	%icc,	0x2
	umul	%i7,	0x0DA4,	%o6
	tn	%icc,	0x6
	smul	%i0,	0x19DB,	%l4
	edge32ln	%o1,	%i2,	%i3
	tvs	%xcc,	0x2
	brz	%g1,	loop_2156
	srlx	%i6,	0x09,	%g2
	addcc	%l5,	0x0F18,	%l0
	edge16ln	%o4,	%l3,	%g5
loop_2156:
	bneg,pn	%icc,	loop_2157
	stbar
	sdivcc	%g6,	0x1DCF,	%o3
	nop
	setx	0x1B4FCB19,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f24
loop_2157:
	fmovsn	%xcc,	%f23,	%f3
	fmovdge	%xcc,	%f14,	%f27
	fpsub32	%f2,	%f10,	%f30
	or	%i1,	%o7,	%i4
	fxor	%f2,	%f12,	%f0
	flush	%l7 + 0x30
	sll	%l2,	0x14,	%o2
	fnot2	%f0,	%f30
	umul	%l6,	%l1,	%g3
	sdivcc	%g4,	0x03A6,	%g7
	tvs	%xcc,	0x6
	udivx	%o0,	0x120F,	%o5
	fcmpne16	%f2,	%f10,	%i5
	edge32	%o6,	%i0,	%i7
	alignaddr	%o1,	%l4,	%i3
	taddcc	%g1,	%i2,	%g2
	subcc	%i6,	%l0,	%o4
	stbar
	nop
	setx	0xA0C4C686,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f1
	movleu	%icc,	%l3,	%l5
	tl	%icc,	0x3
	edge16n	%g5,	%g6,	%o3
	membar	0x23
	nop
	set	0x76, %i4
	lduh	[%l7 + %i4],	%i1
	movcc	%xcc,	%i4,	%l2
	movre	%o2,	0x139,	%o7
	fmovdpos	%xcc,	%f22,	%f27
	subc	%l6,	%g3,	%g4
	umul	%l1,	0x117A,	%g7
	or	%o5,	0x17FC,	%i5
	movvs	%xcc,	%o0,	%o6
	tpos	%xcc,	0x2
	movneg	%icc,	%i0,	%o1
	movle	%xcc,	%i7,	%l4
	movleu	%icc,	%g1,	%i3
	fcmpne16	%f6,	%f10,	%i2
	edge8n	%i6,	%l0,	%g2
	brgez	%o4,	loop_2158
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l5,	0x17,	%g5
	ldub	[%l7 + 0x5C],	%l3
loop_2158:
	udivcc	%g6,	0x01B8,	%o3
	edge8l	%i1,	%i4,	%l2
	add	%o7,	%o2,	%g3
	taddcc	%g4,	%l1,	%l6
	fmovdgu	%xcc,	%f10,	%f4
	sethi	0x15C9,	%o5
	taddcctv	%g7,	0x0327,	%o0
	fmovdvc	%xcc,	%f29,	%f12
	edge16ln	%o6,	%i5,	%o1
	sll	%i0,	%i7,	%l4
	orcc	%i3,	%i2,	%g1
	ble,a,pn	%icc,	loop_2159
	move	%icc,	%i6,	%l0
	edge32n	%g2,	%l5,	%o4
	fnegs	%f25,	%f6
loop_2159:
	ldsw	[%l7 + 0x1C],	%l3
	brnz,a	%g6,	loop_2160
	mulx	%g5,	%i1,	%i4
	nop
	fitos	%f14,	%f7
	fstoi	%f7,	%f29
	movg	%icc,	%o3,	%o7
loop_2160:
	fandnot2	%f12,	%f0,	%f26
	fmul8x16au	%f5,	%f16,	%f2
	edge16n	%l2,	%o2,	%g3
	or	%l1,	%g4,	%o5
	tsubcc	%l6,	0x16CD,	%g7
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x38] %asi,	%o6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o0
	ldsb	[%l7 + 0x0F],	%o1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmul8x16au	%f1,	%f3,	%f22
	fnot2	%f30,	%f16
	fbu	%fcc0,	loop_2161
	tle	%xcc,	0x6
	edge16ln	%i5,	%i0,	%l4
	array32	%i7,	%i3,	%i2
loop_2161:
	te	%xcc,	0x2
	movre	%g1,	0x153,	%l0
	tgu	%xcc,	0x6
	fbul	%fcc0,	loop_2162
	srl	%g2,	0x15,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o4,	%l3,	%g6
loop_2162:
	fones	%f31
	fbn	%fcc2,	loop_2163
	alignaddr	%l5,	%i1,	%g5
	fones	%f5
	nop
	setx	0x2C96EB00,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f9
loop_2163:
	taddcctv	%o3,	%o7,	%l2
	tne	%icc,	0x4
	fxnor	%f0,	%f6,	%f18
	or	%i4,	0x1F9B,	%o2
	bne,a,pt	%icc,	loop_2164
	sub	%g3,	0x1DC1,	%g4
	bn,a	%icc,	loop_2165
	fmovscc	%icc,	%f29,	%f9
loop_2164:
	nop
	set	0x17, %o0
	ldstuba	[%l7 + %o0] 0x10,	%l1
loop_2165:
	xnorcc	%o5,	0x0908,	%l6
	fblg,a	%fcc2,	loop_2166
	fmovrdgez	%g7,	%f20,	%f18
	subcc	%o6,	%o1,	%i5
	add	%i0,	%l4,	%o0
loop_2166:
	movl	%xcc,	%i7,	%i2
	sth	%i3,	[%l7 + 0x72]
	array16	%l0,	%g1,	%g2
	tsubcc	%i6,	0x0BD4,	%l3
	brnz,a	%o4,	loop_2167
	movle	%icc,	%g6,	%l5
	movgu	%icc,	%i1,	%g5
	tcs	%icc,	0x5
loop_2167:
	nop
	set	0x4C, %l3
	stwa	%o3,	[%l7 + %l3] 0xeb
	membar	#Sync
	fmovsne	%xcc,	%f17,	%f28
	fmuld8sux16	%f4,	%f22,	%f16
	addc	%l2,	0x144F,	%o7
	tvc	%xcc,	0x6
	stw	%i4,	[%l7 + 0x3C]
	array8	%g3,	%g4,	%l1
	tn	%icc,	0x5
	fnors	%f18,	%f14,	%f12
	tl	%icc,	0x5
	andncc	%o5,	%o2,	%g7
	nop
	setx	0x6073791C,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fmovrslez	%l6,	%f15,	%f9
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f28
	taddcc	%o6,	%o1,	%i5
	smulcc	%l4,	0x09F0,	%i0
	ldub	[%l7 + 0x58],	%i7
	movle	%xcc,	%i2,	%o0
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%i3
	and	%l0,	0x17D9,	%g1
	tsubcctv	%i6,	0x0BF8,	%g2
	popc	%l3,	%o4
	fornot2s	%f16,	%f0,	%f26
	fbl	%fcc2,	loop_2168
	edge16n	%l5,	%g6,	%i1
	fsrc1	%f20,	%f6
	tle	%xcc,	0x2
loop_2168:
	xnorcc	%o3,	0x0884,	%l2
	movrgez	%o7,	%i4,	%g5
	tg	%xcc,	0x2
	subccc	%g4,	0x07B5,	%l1
	bneg,pn	%icc,	loop_2169
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a	loop_2170
	fmovdl	%xcc,	%f2,	%f2
loop_2169:
	subccc	%o5,	0x19B3,	%g3
	fbn	%fcc0,	loop_2171
loop_2170:
	taddcctv	%o2,	%g7,	%o6
	swap	[%l7 + 0x3C],	%l6
	bgu,a,pn	%icc,	loop_2172
loop_2171:
	movrne	%i5,	%o1,	%l4
	srl	%i7,	%i0,	%o0
	fbo,a	%fcc0,	loop_2173
loop_2172:
	subcc	%i3,	0x1E87,	%i2
	set	0x64, %g7
	lduwa	[%l7 + %g7] 0x18,	%l0
loop_2173:
	fmovdle	%icc,	%f5,	%f15
	edge32ln	%g1,	%i6,	%l3
	sir	0x18BF
	for	%f14,	%f0,	%f28
	tsubcc	%g2,	%l5,	%o4
	fbge	%fcc2,	loop_2174
	sethi	0x080F,	%i1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x19,	%f0
loop_2174:
	fcmpeq32	%f4,	%f20,	%o3
	alignaddrl	%g6,	%l2,	%o7
	alignaddrl	%i4,	%g5,	%l1
	sir	0x03B1
	mulx	%o5,	0x0A95,	%g4
	umul	%g3,	0x12ED,	%o2
	sth	%g7,	[%l7 + 0x4E]
	nop
	setx	loop_2175,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%l6,	0x05AF,	%o6
	fmovse	%xcc,	%f1,	%f16
	fornot2s	%f10,	%f5,	%f1
loop_2175:
	fsrc2	%f0,	%f16
	fbul,a	%fcc0,	loop_2176
	edge32l	%o1,	%i5,	%l4
	bg,a	%xcc,	loop_2177
	edge16n	%i0,	%o0,	%i7
loop_2176:
	popc	0x04B7,	%i2
	movrlez	%l0,	%g1,	%i3
loop_2177:
	tneg	%xcc,	0x7
	ldd	[%l7 + 0x38],	%l2
	sra	%g2,	0x1F,	%l5
	sir	0x159C
	umul	%i6,	0x1806,	%o4
	addccc	%i1,	0x1027,	%g6
	movvc	%icc,	%o3,	%o7
	fbo	%fcc2,	loop_2178
	tl	%xcc,	0x6
	tgu	%xcc,	0x5
	edge32	%l2,	%i4,	%l1
loop_2178:
	brgez	%o5,	loop_2179
	smulcc	%g5,	%g3,	%g4
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
loop_2179:
	nop
	setx loop_2180, %l0, %l1
	jmpl %l1, %g7
	movneg	%xcc,	%o2,	%o6
	edge16ln	%o1,	%l6,	%l4
	alignaddrl	%i5,	%o0,	%i7
loop_2180:
	tl	%xcc,	0x1
	tneg	%icc,	0x1
	fmovsge	%xcc,	%f16,	%f13
	tleu	%icc,	0x7
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f6
	fnors	%f12,	%f19,	%f28
	fnot1s	%f29,	%f9
	lduh	[%l7 + 0x7E],	%i0
	movneg	%icc,	%i2,	%g1
	sub	%l0,	%l3,	%g2
	bne	loop_2181
	fmovdcs	%xcc,	%f13,	%f13
	tsubcc	%i3,	%i6,	%l5
	set	0x7C, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i1
loop_2181:
	orncc	%g6,	%o3,	%o7
	addcc	%l2,	0x12D8,	%o4
	ldsw	[%l7 + 0x38],	%l1
	udivcc	%i4,	0x106B,	%o5
	fcmpeq32	%f30,	%f2,	%g5
	movleu	%icc,	%g4,	%g7
	movle	%xcc,	%g3,	%o2
	movcs	%icc,	%o1,	%o6
	tneg	%icc,	0x3
	movl	%icc,	%l6,	%i5
	addccc	%o0,	0x14BC,	%l4
	srl	%i7,	0x05,	%i0
	fmovdge	%icc,	%f2,	%f8
	fmovdvc	%icc,	%f23,	%f11
	andcc	%g1,	%l0,	%l3
	alignaddrl	%i2,	%i3,	%g2
	edge16ln	%l5,	%i1,	%i6
	srlx	%o3,	%o7,	%l2
	movre	%o4,	%l1,	%g6
	membar	0x6D
	or	%i4,	0x0A95,	%o5
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f24
	nop
	setx	loop_2182,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%g4,	0x1A,	%g7
	tg	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x3A] %asi,	%g3
loop_2182:
	sdiv	%g5,	0x0D0C,	%o2
	fmovrde	%o6,	%f22,	%f14
	tneg	%xcc,	0x6
	edge16l	%l6,	%i5,	%o1
	fmul8ulx16	%f22,	%f24,	%f0
	fbule	%fcc1,	loop_2183
	fones	%f26
	movneg	%xcc,	%o0,	%l4
	fbue	%fcc0,	loop_2184
loop_2183:
	srlx	%i7,	0x1C,	%i0
	flush	%l7 + 0x58
	ldsw	[%l7 + 0x44],	%l0
loop_2184:
	ldd	[%l7 + 0x20],	%l2
	umul	%g1,	0x1EEA,	%i2
	fpsub16	%f20,	%f14,	%f20
	fand	%f12,	%f4,	%f22
	mulscc	%g2,	%i3,	%i1
	fba,a	%fcc3,	loop_2185
	tgu	%icc,	0x7
	edge8l	%i6,	%o3,	%o7
	movneg	%xcc,	%l2,	%l5
loop_2185:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1918,	%l1
	fbo,a	%fcc1,	loop_2186
	fmovrdgz	%o4,	%f14,	%f24
	fandnot1s	%f13,	%f21,	%f2
	edge16ln	%g6,	%o5,	%i4
loop_2186:
	bge	%xcc,	loop_2187
	fandnot1	%f2,	%f10,	%f30
	tsubcc	%g7,	0x1927,	%g4
	movcc	%xcc,	%g3,	%o2
loop_2187:
	movrgez	%o6,	0x347,	%g5
	ta	%icc,	0x4
	orcc	%l6,	%o1,	%i5
	taddcc	%o0,	%l4,	%i7
	bn,a,pt	%xcc,	loop_2188
	nop
	setx loop_2189, %l0, %l1
	jmpl %l1, %i0
	fmovdleu	%icc,	%f19,	%f18
	move	%xcc,	%l3,	%g1
loop_2188:
	fmul8x16	%f13,	%f20,	%f18
loop_2189:
	ble,a	loop_2190
	edge32	%i2,	%g2,	%l0
	fand	%f22,	%f10,	%f14
	subc	%i3,	%i6,	%i1
loop_2190:
	fmovdcc	%icc,	%f7,	%f27
	mulx	%o3,	%o7,	%l2
	edge16l	%l5,	%l1,	%g6
	fmovdcc	%xcc,	%f12,	%f28
	tleu	%icc,	0x7
	brgz	%o4,	loop_2191
	sdivx	%o5,	0x0F43,	%g7
	ldstub	[%l7 + 0x14],	%i4
	ta	%xcc,	0x2
loop_2191:
	tle	%xcc,	0x0
	bcc	loop_2192
	nop
	fitos	%f11,	%f12
	fstoi	%f12,	%f7
	orn	%g4,	0x0F87,	%g3
	st	%f5,	[%l7 + 0x60]
loop_2192:
	alignaddrl	%o6,	%g5,	%o2
	ldx	[%l7 + 0x68],	%o1
	movvs	%xcc,	%i5,	%l6
	udiv	%l4,	0x041D,	%o0
	movn	%xcc,	%i7,	%l3
	fmovsg	%icc,	%f31,	%f27
	orncc	%i0,	%i2,	%g1
	or	%g2,	0x0829,	%i3
	ldub	[%l7 + 0x10],	%l0
	stb	%i6,	[%l7 + 0x5A]
	fmovsge	%xcc,	%f4,	%f8
	sdiv	%i1,	0x0D84,	%o7
	udiv	%o3,	0x1EB4,	%l5
	te	%xcc,	0x5
	pdist	%f22,	%f2,	%f22
	popc	%l2,	%g6
	edge8l	%o4,	%o5,	%l1
	fmovspos	%icc,	%f31,	%f24
	edge32ln	%i4,	%g7,	%g3
	fmovscc	%icc,	%f15,	%f22
	subcc	%g4,	%o6,	%g5
	nop
	setx	0x14266C5D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x42E6A2AE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f18,	%f5
	tcc	%icc,	0x5
	fmovsvs	%xcc,	%f8,	%f5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%o1
	fandnot2	%f28,	%f24,	%f12
	movl	%icc,	%l6,	%i5
	movgu	%icc,	%l4,	%o0
	alignaddr	%l3,	%i0,	%i2
	movl	%icc,	%i7,	%g1
	ld	[%l7 + 0x14],	%f8
	nop
	setx loop_2193, %l0, %l1
	jmpl %l1, %i3
	membar	0x1E
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x38] %asi,	%g2
loop_2193:
	fbn	%fcc1,	loop_2194
	xnorcc	%l0,	%i6,	%i1
	fbg,a	%fcc3,	loop_2195
	fbge	%fcc0,	loop_2196
loop_2194:
	srlx	%o7,	%o3,	%l2
	fmovrde	%g6,	%f10,	%f24
loop_2195:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2196:
	umul	%o4,	%o5,	%l1
	xorcc	%i4,	%l5,	%g3
	mulscc	%g7,	0x1B9C,	%g4
	array8	%o6,	%g5,	%o1
	tpos	%xcc,	0x7
	addccc	%l6,	%o2,	%l4
	sdivcc	%o0,	0x00AC,	%i5
	addc	%i0,	0x0445,	%i2
	nop
	fitos	%f3,	%f3
	fstox	%f3,	%f8
	fbu,a	%fcc0,	loop_2197
	ldd	[%l7 + 0x08],	%l2
	addcc	%i7,	0x0F23,	%i3
	sdivcc	%g2,	0x1930,	%g1
loop_2197:
	edge8ln	%l0,	%i6,	%i1
	set	0x48, %o6
	swapa	[%l7 + %o6] 0x10,	%o3
	tgu	%xcc,	0x5
	edge16n	%l2,	%o7,	%g6
	nop
	set	0x10, %g5
	ldsh	[%l7 + %g5],	%o4
	tpos	%xcc,	0x0
	mulscc	%l1,	0x128A,	%o5
	bvc,pn	%icc,	loop_2198
	taddcc	%i4,	0x1DBF,	%l5
	tvc	%xcc,	0x6
	bl,a,pn	%xcc,	loop_2199
loop_2198:
	taddcc	%g3,	%g7,	%g4
	set	0x0E, %g4
	ldsha	[%l7 + %g4] 0x15,	%g5
loop_2199:
	ldstub	[%l7 + 0x5B],	%o6
	tcc	%icc,	0x3
	mulx	%o1,	0x069E,	%l6
	movre	%l4,	0x14E,	%o2
	fbl	%fcc1,	loop_2200
	tpos	%icc,	0x2
	movleu	%icc,	%i5,	%o0
	tvs	%icc,	0x1
loop_2200:
	tg	%xcc,	0x7
	tcs	%xcc,	0x5
	tcc	%icc,	0x3
	andn	%i2,	0x0AE8,	%l3
	bcc,pt	%icc,	loop_2201
	movleu	%xcc,	%i7,	%i3
	udivx	%i0,	0x18CE,	%g1
	tsubcc	%g2,	%i6,	%i1
loop_2201:
	xnorcc	%l0,	0x0936,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x3
	brgz	%o7,	loop_2202
	movgu	%xcc,	%g6,	%o4
	xorcc	%o3,	%o5,	%l1
	sdivcc	%i4,	0x04DD,	%l5
loop_2202:
	fornot1	%f18,	%f4,	%f16
	std	%f0,	[%l7 + 0x50]
	fmovrsgez	%g3,	%f23,	%f16
	lduw	[%l7 + 0x7C],	%g7
	srlx	%g5,	0x02,	%o6
	fmovsn	%xcc,	%f31,	%f26
	fbul	%fcc0,	loop_2203
	xorcc	%g4,	0x017D,	%l6
	sdivx	%o1,	0x149D,	%o2
	movre	%i5,	%l4,	%i2
loop_2203:
	ldd	[%l7 + 0x50],	%f20
	fbuge,a	%fcc0,	loop_2204
	srlx	%l3,	%o0,	%i7
	set	0x44, %g3
	swapa	[%l7 + %g3] 0x0c,	%i3
loop_2204:
	tvs	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x4C] %asi,	%g1
	bgu,a	%icc,	loop_2205
	edge32n	%i0,	%i6,	%g2
	orncc	%i1,	0x1C46,	%l2
	nop
	setx	0x293D4F85C0662AF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_2205:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%o7
	sth	%g6,	[%l7 + 0x6C]
	fpadd16s	%f2,	%f19,	%f5
	fmovsl	%xcc,	%f11,	%f24
	tneg	%xcc,	0x3
	movre	%o4,	%o3,	%o5
	edge8ln	%l1,	%l0,	%i4
	subcc	%l5,	0x016E,	%g7
	udiv	%g3,	0x1142,	%o6
	alignaddr	%g5,	%g4,	%o1
	orcc	%o2,	0x1270,	%l6
	array32	%l4,	%i2,	%l3
	fsrc1	%f4,	%f22
	ldsb	[%l7 + 0x36],	%o0
	fmul8ulx16	%f16,	%f26,	%f14
	set	0x08, %i5
	swapa	[%l7 + %i5] 0x81,	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%i5
	orcc	%g1,	0x1953,	%i6
	fpackfix	%f10,	%f1
	mulscc	%g2,	0x1F32,	%i1
	subc	%l2,	0x1959,	%i0
	movleu	%icc,	%g6,	%o7
	fcmpeq16	%f6,	%f2,	%o3
	movge	%icc,	%o4,	%o5
	fmovdpos	%xcc,	%f18,	%f10
	edge16n	%l1,	%l0,	%l5
	tpos	%icc,	0x1
	ldx	[%l7 + 0x70],	%i4
	orncc	%g7,	0x12E9,	%g3
	ble,a,pt	%xcc,	loop_2206
	movne	%icc,	%g5,	%o6
	movrgez	%g4,	%o2,	%l6
	movvs	%xcc,	%o1,	%i2
loop_2206:
	fmovrdlez	%l4,	%f4,	%f8
	movrgez	%o0,	%l3,	%i3
	swap	[%l7 + 0x18],	%i7
	alignaddrl	%g1,	%i5,	%g2
	ldsw	[%l7 + 0x40],	%i6
	edge16l	%i1,	%l2,	%g6
	bcs	%icc,	loop_2207
	bcs,pn	%icc,	loop_2208
	tn	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	stwa	%i0,	[%l7 + 0x48] %asi
loop_2207:
	subccc	%o3,	0x0938,	%o4
loop_2208:
	taddcc	%o5,	0x038A,	%o7
	movre	%l0,	%l5,	%i4
	udiv	%g7,	0x168C,	%g3
	mulscc	%g5,	%l1,	%g4
	xnor	%o2,	%l6,	%o6
	fmovrsgez	%o1,	%f19,	%f27
	addccc	%i2,	%o0,	%l3
	tneg	%xcc,	0x0
	bgu,a	%xcc,	loop_2209
	movrgez	%l4,	%i7,	%i3
	ldstub	[%l7 + 0x10],	%i5
	fcmple32	%f26,	%f6,	%g1
loop_2209:
	fpsub32	%f24,	%f0,	%f8
	fabsd	%f14,	%f0
	edge8	%i6,	%i1,	%g2
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f26
	fxtod	%f26,	%f6
	tvc	%xcc,	0x4
	movrgez	%g6,	0x0F2,	%i0
	tcc	%xcc,	0x2
	srax	%l2,	%o3,	%o4
	alignaddr	%o5,	%l0,	%l5
	nop
	fitos	%f21,	%f12
	bge,a	loop_2210
	prefetch	[%l7 + 0x68],	 0x3
	smulcc	%i4,	%g7,	%g3
	addcc	%g5,	%l1,	%o7
loop_2210:
	move	%xcc,	%o2,	%g4
	fmovdleu	%xcc,	%f15,	%f18
	movrgez	%l6,	0x340,	%o1
	brgez,a	%o6,	loop_2211
	edge16	%o0,	%i2,	%l4
	fcmple32	%f28,	%f22,	%l3
	wr	%g0,	0x89,	%asi
	stha	%i7,	[%l7 + 0x46] %asi
loop_2211:
	fmovda	%icc,	%f18,	%f10
	andncc	%i5,	%g1,	%i3
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x128] %asi,	%i6 ripped by fixASI40.pl ripped by fixASI40.pl
	tcs	%xcc,	0x6
	fmovsg	%xcc,	%f26,	%f15
	fabsd	%f20,	%f14
	tn	%icc,	0x1
	or	%i1,	%g6,	%g2
	movge	%xcc,	%l2,	%o3
	movleu	%icc,	%i0,	%o5
	edge32ln	%o4,	%l5,	%i4
	movg	%xcc,	%l0,	%g7
	umulcc	%g3,	0x151E,	%g5
	xnorcc	%l1,	0x0F7C,	%o7
	subc	%o2,	%l6,	%g4
	bge,a	%icc,	loop_2212
	udivcc	%o1,	0x0FCC,	%o0
	nop
	setx loop_2213, %l0, %l1
	jmpl %l1, %i2
	subccc	%l4,	0x127D,	%l3
loop_2212:
	tne	%xcc,	0x1
	movge	%icc,	%o6,	%i5
loop_2213:
	fmovrdgez	%i7,	%f0,	%f28
	orn	%i3,	0x040A,	%g1
	tle	%xcc,	0x4
	faligndata	%f26,	%f28,	%f16
	fpadd32	%f0,	%f4,	%f4
	fbg,a	%fcc2,	loop_2214
	sll	%i6,	%g6,	%i1
	fpadd32	%f6,	%f30,	%f0
	tcs	%xcc,	0x4
loop_2214:
	srl	%l2,	0x1B,	%o3
	taddcc	%g2,	%o5,	%i0
	ta	%icc,	0x2
	fmul8x16al	%f7,	%f9,	%f4
	movre	%l5,	0x001,	%i4
	fbo,a	%fcc0,	loop_2215
	fornot1	%f24,	%f20,	%f2
	movrgez	%l0,	%g7,	%g3
	set	0x08, %g1
	ldxa	[%l7 + %g1] 0x10,	%g5
loop_2215:
	array8	%l1,	%o7,	%o2
	edge8	%o4,	%l6,	%o1
	orncc	%o0,	%i2,	%g4
	nop
	set	0x72, %l0
	lduh	[%l7 + %l0],	%l4
	edge32l	%l3,	%i5,	%i7
	edge32n	%o6,	%i3,	%i6
	move	%xcc,	%g1,	%i1
	edge8n	%g6,	%o3,	%g2
	tgu	%xcc,	0x0
	bn	%xcc,	loop_2216
	nop
	fitos	%f6,	%f25
	fstoi	%f25,	%f12
	edge8l	%o5,	%i0,	%l5
	nop
	setx	0x6078DC1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_2216:
	ldsh	[%l7 + 0x30],	%i4
	ldsh	[%l7 + 0x4C],	%l2
	addc	%l0,	%g7,	%g5
	tge	%icc,	0x1
	subccc	%l1,	%g3,	%o7
	stbar
	edge32ln	%o4,	%o2,	%l6
	addcc	%o0,	%o1,	%i2
	movcc	%icc,	%g4,	%l3
	fxnors	%f21,	%f0,	%f19
	movrlez	%i5,	%i7,	%o6
	fbn	%fcc3,	loop_2217
	fbe,a	%fcc1,	loop_2218
	tsubcc	%i3,	0x1BDD,	%i6
	fmovsneg	%xcc,	%f4,	%f22
loop_2217:
	nop
	set	0x2B, %o2
	ldub	[%l7 + %o2],	%l4
loop_2218:
	fand	%f24,	%f8,	%f20
	array16	%g1,	%g6,	%o3
	andcc	%g2,	0x19C4,	%i1
	tleu	%xcc,	0x7
	nop
	setx	0xB9406946EE62091F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xAA8BFF63D4C80436,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f20,	%f10
	ldsw	[%l7 + 0x78],	%i0
	edge16l	%o5,	%l5,	%i4
	tleu	%xcc,	0x0
	sir	0x09B3
	fbe	%fcc1,	loop_2219
	ldstub	[%l7 + 0x35],	%l0
	tvs	%xcc,	0x1
	tne	%xcc,	0x2
loop_2219:
	fmovsn	%xcc,	%f31,	%f1
	pdist	%f28,	%f0,	%f22
	sdivcc	%g7,	0x042B,	%l2
	taddcc	%l1,	%g3,	%g5
	fnor	%f10,	%f24,	%f26
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x55] %asi,	%o7
	array8	%o2,	%l6,	%o4
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	alignaddr	%o0,	%i2,	%g4
	set	0x4C, %i2
	stha	%o1,	[%l7 + %i2] 0x04
	movleu	%icc,	%i5,	%l3
	sir	0x1570
	taddcc	%o6,	%i3,	%i6
	ldsb	[%l7 + 0x3E],	%l4
	movrlez	%g1,	0x23E,	%g6
	fmovrsgz	%o3,	%f2,	%f13
	sra	%g2,	%i1,	%i0
	edge32ln	%o5,	%l5,	%i4
	set	0x7C, %l1
	stha	%i7,	[%l7 + %l1] 0x23
	membar	#Sync
	tge	%icc,	0x6
	edge16	%l0,	%g7,	%l2
	movvc	%icc,	%l1,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o7,	%g5,	%o2
	fmovs	%f25,	%f22
	brlez	%l6,	loop_2220
	smulcc	%o4,	%i2,	%o0
	flush	%l7 + 0x24
	sllx	%o1,	%g4,	%i5
loop_2220:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x6
	sll	%l3,	%o6,	%i6
	ta	%icc,	0x3
	orncc	%l4,	0x1542,	%i3
	udiv	%g1,	0x1C72,	%g6
	edge32ln	%g2,	%o3,	%i1
	fble	%fcc0,	loop_2221
	add	%i0,	%l5,	%i4
	edge16	%i7,	%o5,	%l0
	umulcc	%g7,	0x0081,	%l1
loop_2221:
	movge	%xcc,	%l2,	%g3
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f6
	edge8	%g5,	%o7,	%o2
	edge32l	%l6,	%i2,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o4,	0x0AA4,	%o1
	srl	%g4,	%i5,	%o6
	swap	[%l7 + 0x50],	%l3
	flush	%l7 + 0x58
	te	%icc,	0x6
	tcc	%xcc,	0x4
	orcc	%i6,	%i3,	%l4
	movcs	%icc,	%g6,	%g1
	tg	%icc,	0x7
	edge8l	%g2,	%i1,	%i0
	fmul8x16	%f22,	%f2,	%f18
	tne	%icc,	0x4
	bvc	%xcc,	loop_2222
	subc	%o3,	0x1835,	%i4
	movrlz	%i7,	%o5,	%l0
	tvc	%icc,	0x6
loop_2222:
	prefetch	[%l7 + 0x14],	 0x2
	edge32n	%l5,	%g7,	%l2
	xorcc	%l1,	0x0E83,	%g3
	set	0x48, %l2
	lda	[%l7 + %l2] 0x89,	%f11
	array16	%g5,	%o2,	%l6
	fmovse	%xcc,	%f26,	%f22
	tleu	%icc,	0x2
	edge8n	%o7,	%i2,	%o4
	fmul8sux16	%f14,	%f8,	%f22
	movvc	%xcc,	%o0,	%g4
	tn	%xcc,	0x3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x16,	%f0
	popc	%o1,	%i5
	movn	%icc,	%o6,	%l3
	tge	%icc,	0x7
	fba	%fcc3,	loop_2223
	nop
	setx	0x0951DA09B0706C4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fandnot1	%f28,	%f24,	%f8
	lduw	[%l7 + 0x14],	%i3
loop_2223:
	fpadd32	%f6,	%f18,	%f10
	tvc	%xcc,	0x3
	tne	%xcc,	0x3
	mulscc	%i6,	0x0A87,	%g6
	movrne	%g1,	0x168,	%g2
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f30
	tleu	%xcc,	0x7
	fcmpgt16	%f8,	%f12,	%i1
	fandnot2s	%f21,	%f0,	%f16
	edge32ln	%i0,	%l4,	%o3
	subcc	%i4,	0x0ED7,	%o5
	sth	%l0,	[%l7 + 0x56]
	set	0x70, %o4
	stxa	%l5,	[%l7 + %o4] 0x19
	andncc	%g7,	%l2,	%l1
	movle	%icc,	%i7,	%g5
	bcs,a	%xcc,	loop_2224
	edge16ln	%o2,	%g3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o7,	0x1A0F,	%o4
loop_2224:
	edge8n	%i2,	%g4,	%o1
	taddcctv	%o0,	%i5,	%l3
	fbu,a	%fcc0,	loop_2225
	sllx	%o6,	%i3,	%i6
	umulcc	%g6,	%g2,	%g1
	fbn	%fcc3,	loop_2226
loop_2225:
	fmovrsne	%i1,	%f13,	%f27
	sub	%l4,	0x1077,	%i0
	popc	%o3,	%o5
loop_2226:
	popc	%i4,	%l5
	tg	%icc,	0x4
	subc	%l0,	0x00BA,	%g7
	movvs	%icc,	%l1,	%l2
	srlx	%g5,	%i7,	%o2
	set	0x2E, %g6
	ldstuba	[%l7 + %g6] 0x11,	%l6
	fxnor	%f14,	%f16,	%f22
	fbu	%fcc2,	loop_2227
	movrgz	%o7,	0x2A0,	%g3
	bgu,pn	%xcc,	loop_2228
	stw	%i2,	[%l7 + 0x6C]
loop_2227:
	fmovsgu	%icc,	%f10,	%f2
	srl	%g4,	%o4,	%o1
loop_2228:
	fmovda	%icc,	%f31,	%f4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x54] %asi,	%i5
	udivcc	%o0,	0x126B,	%o6
	edge8	%l3,	%i3,	%i6
	udivx	%g6,	0x19D2,	%g1
	sllx	%g2,	0x16,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i0,	0x185C,	%o3
	brlz	%i1,	loop_2229
	movrlez	%i4,	%o5,	%l0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x19] %asi,	%g7
loop_2229:
	ba,a,pn	%xcc,	loop_2230
	ba,a	%icc,	loop_2231
	fpadd32s	%f17,	%f4,	%f29
	umulcc	%l1,	%l2,	%l5
loop_2230:
	smul	%i7,	%o2,	%g5
loop_2231:
	smul	%l6,	%g3,	%o7
	srlx	%i2,	0x17,	%g4
	fbuge	%fcc2,	loop_2232
	udivx	%o4,	0x11F1,	%i5
	nop
	setx	0x3174E325,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x776455BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f23,	%f4
	mulx	%o0,	%o1,	%l3
loop_2232:
	srl	%o6,	0x11,	%i3
	array16	%g6,	%g1,	%g2
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	movrlz	%l4,	0x1B0,	%o3
	fcmpne16	%f10,	%f6,	%i1
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x0c,	 0x2
	sll	%i4,	0x1B,	%l0
	ld	[%l7 + 0x1C],	%f7
	movcc	%xcc,	%o5,	%l1
	tle	%icc,	0x6
	tvc	%icc,	0x5
	edge8	%l2,	%l5,	%g7
	fpadd32s	%f4,	%f28,	%f17
	brz	%o2,	loop_2233
	fmuld8ulx16	%f4,	%f5,	%f2
	orcc	%g5,	0x1274,	%l6
	fbo	%fcc0,	loop_2234
loop_2233:
	fbl	%fcc3,	loop_2235
	fbug,a	%fcc3,	loop_2236
	array32	%g3,	%o7,	%i2
loop_2234:
	fmovrdgez	%g4,	%f16,	%f22
loop_2235:
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f25
loop_2236:
	fble	%fcc3,	loop_2237
	alignaddr	%i7,	%o4,	%i5
	fmovsvc	%icc,	%f14,	%f6
	fzeros	%f20
loop_2237:
	orncc	%o0,	0x1950,	%l3
	fmovrse	%o6,	%f28,	%f14
	fand	%f24,	%f30,	%f30
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xnorcc	%i3,	0x02CE,	%g6
	array16	%g1,	%g2,	%i6
	array32	%o1,	%o3,	%l4
	movrlz	%i1,	%i0,	%i4
	fandnot2s	%f22,	%f18,	%f18
	tne	%icc,	0x5
	fmovsn	%icc,	%f9,	%f10
	fmovrdgez	%o5,	%f16,	%f4
	andncc	%l0,	%l1,	%l2
	brgz	%l5,	loop_2238
	srax	%o2,	0x1F,	%g5
	nop
	setx	loop_2239,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%g7,	0x08B1,	%l6
loop_2238:
	tgu	%xcc,	0x5
	tvs	%icc,	0x3
loop_2239:
	smul	%g3,	0x1996,	%o7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i2
	fbne	%fcc0,	loop_2240
	smul	%i7,	%o4,	%g4
	movn	%xcc,	%o0,	%i5
	fmovs	%f1,	%f5
loop_2240:
	srl	%l3,	0x1E,	%i3
	mulx	%o6,	%g6,	%g1
	move	%xcc,	%i6,	%o1
	fble,a	%fcc0,	loop_2241
	tg	%icc,	0x1
	stx	%g2,	[%l7 + 0x68]
	fmovsne	%icc,	%f24,	%f19
loop_2241:
	udiv	%l4,	0x0366,	%i1
	srax	%i0,	0x1D,	%i4
	fmovsleu	%icc,	%f23,	%f17
	edge16	%o5,	%l0,	%o3
	sll	%l2,	%l1,	%o2
	alignaddrl	%l5,	%g7,	%g5
	fnot2	%f12,	%f10
	subccc	%g3,	%l6,	%o7
	movgu	%icc,	%i2,	%o4
	bvs,a	%xcc,	loop_2242
	fcmpgt32	%f6,	%f18,	%i7
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f21
	smul	%g4,	%i5,	%l3
loop_2242:
	ta	%icc,	0x6
	fcmpeq32	%f20,	%f0,	%o0
	edge8n	%i3,	%g6,	%g1
	fsrc2s	%f30,	%f29
	smulcc	%o6,	0x1C35,	%i6
	movg	%icc,	%g2,	%l4
	fbu,a	%fcc2,	loop_2243
	xorcc	%i1,	%i0,	%i4
	sdiv	%o5,	0x0B76,	%l0
	mulscc	%o1,	%l2,	%o3
loop_2243:
	xnor	%l1,	0x039A,	%o2
	add	%g7,	0x04D8,	%g5
	fandnot2	%f0,	%f0,	%f28
	edge8l	%g3,	%l5,	%o7
	fabss	%f21,	%f4
	tpos	%icc,	0x7
	fmovdneg	%icc,	%f0,	%f14
	fmovsvs	%icc,	%f10,	%f19
	movne	%icc,	%i2,	%o4
	umul	%l6,	0x1C85,	%g4
	bvc,pn	%xcc,	loop_2244
	fcmpne16	%f24,	%f4,	%i5
	movg	%icc,	%i7,	%l3
	sllx	%i3,	0x1B,	%g6
loop_2244:
	fcmpne16	%f18,	%f8,	%g1
	udivcc	%o6,	0x1618,	%i6
	fmovdne	%xcc,	%f25,	%f6
	udiv	%g2,	0x0E5B,	%l4
	tcs	%xcc,	0x1
	movvc	%xcc,	%i1,	%o0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x38] %asi,	%f31
	movle	%icc,	%i4,	%o5
	andn	%l0,	%o1,	%l2
	tl	%icc,	0x5
	movrne	%i0,	0x3FE,	%o3
	tvc	%xcc,	0x4
	srl	%o2,	0x1C,	%g7
	alignaddrl	%g5,	%l1,	%g3
	fnor	%f22,	%f18,	%f8
	udiv	%l5,	0x1163,	%o7
	tne	%xcc,	0x6
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x11,	 0x0
	fmovdpos	%icc,	%f10,	%f3
	fxnors	%f12,	%f20,	%f22
	popc	%o4,	%l6
	udivx	%i5,	0x07E6,	%i7
	movgu	%xcc,	%g4,	%l3
	faligndata	%f8,	%f20,	%f26
	nop
	setx	0x8D11AE4DB1DE26E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x3841AEE13BDC5EE0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f2,	%f16
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	mulscc	%g6,	%i3,	%g1
	movrgez	%o6,	0x270,	%g2
	tgu	%icc,	0x6
	fnand	%f6,	%f10,	%f12
	sllx	%i6,	0x03,	%i1
	movcc	%xcc,	%l4,	%o0
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
	move	%icc,	%i4,	%o5
	tleu	%icc,	0x6
	tle	%xcc,	0x0
	tpos	%xcc,	0x0
	brgez,a	%o1,	loop_2245
	fzero	%f26
	membar	0x6F
	subccc	%l2,	%i0,	%l0
loop_2245:
	te	%xcc,	0x3
	edge32	%o3,	%g7,	%g5
	fnands	%f3,	%f23,	%f28
	fmovdneg	%icc,	%f5,	%f27
	movre	%l1,	%g3,	%o2
	subc	%o7,	0x057F,	%l5
	ld	[%l7 + 0x18],	%f13
	sethi	0x1EDC,	%i2
	subcc	%l6,	%i5,	%i7
	stw	%o4,	[%l7 + 0x28]
	movleu	%icc,	%l3,	%g4
	movl	%xcc,	%i3,	%g1
	sllx	%g6,	0x15,	%g2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x18] %asi,	%o6
	fcmpeq32	%f22,	%f4,	%i6
	fbe,a	%fcc1,	loop_2246
	fpackfix	%f20,	%f17
	subcc	%i1,	%l4,	%i4
	fsrc2	%f6,	%f30
loop_2246:
	tsubcc	%o0,	0x1401,	%o1
	fors	%f23,	%f11,	%f21
	fornot1	%f10,	%f12,	%f2
	tneg	%icc,	0x3
	ba,a,pt	%icc,	loop_2247
	andncc	%o5,	%l2,	%i0
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l0
loop_2247:
	nop
	set	0x60, %o1
	lduha	[%l7 + %o1] 0x14,	%g7
	edge16ln	%o3,	%l1,	%g5
	andncc	%o2,	%g3,	%o7
	sdivx	%i2,	0x0B16,	%l5
	fbule,a	%fcc2,	loop_2248
	addccc	%i5,	%l6,	%o4
	fbu,a	%fcc2,	loop_2249
	tcs	%xcc,	0x6
loop_2248:
	sethi	0x04DC,	%i7
	edge16	%g4,	%l3,	%i3
loop_2249:
	sra	%g6,	%g2,	%g1
	edge16ln	%i6,	%i1,	%l4
	sdiv	%o6,	0x0A7C,	%i4
	fpackfix	%f22,	%f30
	edge32	%o1,	%o0,	%o5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x10,	%i0,	%l0
	sub	%l2,	0x0B07,	%o3
	movl	%xcc,	%l1,	%g5
	movne	%icc,	%g7,	%g3
	fpadd16s	%f7,	%f6,	%f6
	set	0x2C, %i6
	ldsba	[%l7 + %i6] 0x14,	%o2
	edge16l	%o7,	%i2,	%i5
	andn	%l5,	0x05E4,	%o4
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrsne	%i7,	%f18,	%f10
	movrgz	%l6,	0x11A,	%l3
	fnot1	%f12,	%f14
	taddcc	%g4,	0x1BD4,	%i3
	udiv	%g2,	0x140E,	%g1
	fmovd	%f16,	%f26
	brgz	%g6,	loop_2250
	be	loop_2251
	tg	%icc,	0x2
	swap	[%l7 + 0x24],	%i1
loop_2250:
	movvc	%xcc,	%l4,	%o6
loop_2251:
	stbar
	ldstub	[%l7 + 0x33],	%i4
	fcmpne32	%f2,	%f6,	%i6
	movle	%xcc,	%o1,	%o0
	prefetch	[%l7 + 0x78],	 0x3
	array32	%i0,	%l0,	%l2
	alignaddrl	%o5,	%o3,	%l1
	te	%icc,	0x1
	xorcc	%g7,	%g5,	%g3
	bvs,pn	%xcc,	loop_2252
	popc	0x1C0C,	%o7
	umulcc	%o2,	%i2,	%l5
	xnor	%i5,	0x19CC,	%i7
loop_2252:
	prefetch	[%l7 + 0x70],	 0x0
	fmovsleu	%icc,	%f14,	%f10
	tne	%icc,	0x4
	and	%o4,	0x0FB1,	%l3
	srlx	%g4,	%l6,	%i3
	tn	%xcc,	0x0
	te	%xcc,	0x7
	nop
	setx loop_2253, %l0, %l1
	jmpl %l1, %g2
	popc	0x04D1,	%g1
	fba,a	%fcc2,	loop_2254
	fmovrslez	%g6,	%f7,	%f6
loop_2253:
	brlez	%i1,	loop_2255
	taddcc	%l4,	0x01C2,	%o6
loop_2254:
	andncc	%i4,	%o1,	%i6
	edge32ln	%o0,	%l0,	%i0
loop_2255:
	tleu	%xcc,	0x5
	bcs,pt	%icc,	loop_2256
	srl	%o5,	0x1C,	%l2
	xnor	%l1,	0x00D1,	%o3
	bg,a	%xcc,	loop_2257
loop_2256:
	fmovdg	%icc,	%f31,	%f29
	edge32ln	%g7,	%g5,	%o7
	tleu	%icc,	0x6
loop_2257:
	fbu	%fcc2,	loop_2258
	xorcc	%g3,	0x1B95,	%i2
	movrgz	%l5,	0x14E,	%i5
	movn	%icc,	%o2,	%o4
loop_2258:
	te	%xcc,	0x2
	fmovsneg	%icc,	%f11,	%f2
	orn	%l3,	0x103F,	%g4
	tvc	%icc,	0x6
	fmovsleu	%icc,	%f9,	%f14
	fbn	%fcc3,	loop_2259
	edge16	%i7,	%l6,	%g2
	smul	%i3,	0x022E,	%g6
	addc	%i1,	%l4,	%g1
loop_2259:
	fmovrdgez	%i4,	%f8,	%f12
	fmovsle	%xcc,	%f20,	%f7
	nop
	fitos	%f6,	%f26
	fstox	%f26,	%f14
	edge32	%o1,	%i6,	%o0
	umul	%l0,	0x0C92,	%o6
	bneg,a,pt	%xcc,	loop_2260
	nop
	setx	loop_2261,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%o5,	%i0,	%l2
	fcmple32	%f16,	%f10,	%o3
loop_2260:
	tn	%icc,	0x1
loop_2261:
	nop
	setx loop_2262, %l0, %l1
	jmpl %l1, %g7
	nop
	setx	loop_2263,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu,a	%fcc0,	loop_2264
	movrgz	%g5,	0x084,	%o7
loop_2262:
	fbuge,a	%fcc2,	loop_2265
loop_2263:
	fornot1	%f4,	%f20,	%f26
loop_2264:
	edge8	%g3,	%l1,	%i2
	edge16l	%l5,	%o2,	%o4
loop_2265:
	fmuld8sux16	%f23,	%f19,	%f0
	set	0x6B, %l4
	stba	%i5,	[%l7 + %l4] 0x2b
	membar	#Sync
	set	0x48, %i0
	ldxa	[%l7 + %i0] 0x15,	%l3
	edge32n	%g4,	%i7,	%g2
	fnot1	%f14,	%f0
	fmovd	%f28,	%f18
	andncc	%l6,	%g6,	%i1
	movl	%icc,	%l4,	%i3
	umulcc	%g1,	0x0F55,	%i4
	membar	0x10
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f0
	movpos	%xcc,	%i6,	%o0
	alignaddrl	%l0,	%o6,	%o1
	fmovdvc	%xcc,	%f30,	%f9
	edge16l	%i0,	%o5,	%l2
	brgez	%g7,	loop_2266
	tne	%icc,	0x6
	movpos	%icc,	%o3,	%g5
	movre	%o7,	0x21A,	%g3
loop_2266:
	edge16l	%l1,	%l5,	%i2
	ba	loop_2267
	edge16ln	%o2,	%i5,	%l3
	fmovdg	%xcc,	%f1,	%f26
	tge	%icc,	0x4
loop_2267:
	edge32l	%o4,	%g4,	%g2
	fmovrsgz	%l6,	%f29,	%f9
	fbule	%fcc0,	loop_2268
	movn	%icc,	%i7,	%g6
	fmovdcs	%xcc,	%f9,	%f25
	fexpand	%f20,	%f8
loop_2268:
	nop
	setx	loop_2269,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x2
	fpack16	%f0,	%f23
	tleu	%icc,	0x5
loop_2269:
	edge32n	%i1,	%l4,	%i3
	ldub	[%l7 + 0x79],	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o0
	fmovsvc	%icc,	%f20,	%f21
	edge32l	%l0,	%o6,	%i4
	popc	%i0,	%o1
	bg,pt	%xcc,	loop_2270
	fbg,a	%fcc2,	loop_2271
	tl	%icc,	0x3
	smul	%o5,	0x0F1B,	%g7
loop_2270:
	fzero	%f20
loop_2271:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o3
	set	0x70, %g2
	ldda	[%l7 + %g2] 0xea,	%g4
	fone	%f12
	bleu,a	%icc,	loop_2272
	fandnot2s	%f11,	%f31,	%f20
	orncc	%o7,	0x125F,	%g3
	nop
	setx	0x6E032501,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x098D45ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f14,	%f11
loop_2272:
	edge32n	%l2,	%l5,	%l1
	brgez,a	%o2,	loop_2273
	movcc	%icc,	%i5,	%i2
	fxors	%f19,	%f0,	%f25
	and	%l3,	%o4,	%g4
loop_2273:
	fxnor	%f30,	%f18,	%f22
	udivcc	%g2,	0x0AED,	%l6
	sll	%g6,	%i1,	%i7
	movgu	%xcc,	%l4,	%g1
	nop
	set	0x50, %l5
	ldstub	[%l7 + %l5],	%i6
	umulcc	%i3,	0x1A0F,	%l0
	xor	%o6,	0x0407,	%i4
	fbl,a	%fcc1,	loop_2274
	xor	%o0,	0x1DEA,	%i0
	tsubcc	%o5,	0x0100,	%g7
	fmovsneg	%xcc,	%f8,	%f23
loop_2274:
	addccc	%o1,	%o3,	%o7
	membar	0x51
	nop
	fitos	%f10,	%f15
	bpos,a,pt	%icc,	loop_2275
	fmovdn	%icc,	%f2,	%f7
	movneg	%xcc,	%g3,	%g5
	fandnot2	%f30,	%f0,	%f26
loop_2275:
	movre	%l5,	%l2,	%l1
	movne	%icc,	%i5,	%i2
	movl	%icc,	%l3,	%o2
	brgz	%o4,	loop_2276
	array8	%g4,	%l6,	%g6
	bvs,a,pn	%icc,	loop_2277
	movrne	%g2,	0x143,	%i7
loop_2276:
	nop
	fitod	%f4,	%f8
	fdtoi	%f8,	%f31
	orncc	%i1,	0x0006,	%l4
loop_2277:
	tvc	%xcc,	0x6
	popc	0x0391,	%i6
	movrgz	%i3,	%g1,	%l0
	edge32n	%i4,	%o0,	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%o5
	udiv	%o1,	0x1ABB,	%g7
	fors	%f14,	%f0,	%f9
	tge	%icc,	0x2
	fmovsne	%xcc,	%f20,	%f27
	sdiv	%o7,	0x12AF,	%g3
	stbar
	movrlz	%g5,	0x3D3,	%l5
	stb	%o3,	[%l7 + 0x13]
	flush	%l7 + 0x7C
	edge32n	%l1,	%l2,	%i5
	and	%l3,	0x1469,	%i2
	movrlez	%o2,	%g4,	%o4
	for	%f12,	%f28,	%f30
	tgu	%xcc,	0x2
	bg,a,pt	%icc,	loop_2278
	fornot2	%f14,	%f22,	%f6
	xor	%l6,	0x0397,	%g2
	movl	%xcc,	%i7,	%i1
loop_2278:
	addccc	%l4,	0x0F74,	%i6
	fpadd32	%f28,	%f18,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7B, %o0
	stba	%i3,	[%l7 + %o0] 0xeb
	membar	#Sync
	addccc	%g6,	%l0,	%i4
	xorcc	%g1,	0x16C4,	%o0
	movpos	%icc,	%i0,	%o6
	set	0x21, %i4
	ldsba	[%l7 + %i4] 0x0c,	%o5
	edge16n	%g7,	%o1,	%g3
	fba	%fcc1,	loop_2279
	sub	%o7,	%l5,	%g5
	movne	%xcc,	%l1,	%o3
	orn	%i5,	0x1A6B,	%l3
loop_2279:
	movleu	%icc,	%i2,	%l2
	sdivcc	%g4,	0x07B8,	%o4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x64] %asi,	%l6
	sdivx	%g2,	0x12B7,	%i7
	bcs,pn	%icc,	loop_2280
	brlez,a	%o2,	loop_2281
	fbuge	%fcc2,	loop_2282
	movrlz	%i1,	%l4,	%i3
loop_2280:
	nop
	setx	0x398832EF5C252DC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f6
loop_2281:
	sethi	0x09A9,	%i6
loop_2282:
	fexpand	%f27,	%f28
	tvs	%icc,	0x5
	bge	%icc,	loop_2283
	fandnot1	%f20,	%f16,	%f8
	set	0x20, %l3
	lduwa	[%l7 + %l3] 0x0c,	%l0
loop_2283:
	edge32l	%g6,	%g1,	%i4
	set	0x0E, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o0
	fbe,a	%fcc3,	loop_2284
	movge	%xcc,	%o6,	%o5
	fmovdvs	%xcc,	%f27,	%f15
	edge16l	%i0,	%g7,	%o1
loop_2284:
	fpsub16s	%f0,	%f16,	%f3
	fcmpgt32	%f8,	%f28,	%g3
	fabss	%f0,	%f7
	nop
	setx loop_2285, %l0, %l1
	jmpl %l1, %l5
	orncc	%o7,	0x0C3E,	%l1
	subccc	%g5,	0x1B87,	%o3
	andcc	%i5,	%i2,	%l3
loop_2285:
	movrlz	%g4,	%l2,	%l6
	bge	%icc,	loop_2286
	tl	%xcc,	0x4
	edge32ln	%g2,	%o4,	%i7
	fmul8sux16	%f16,	%f14,	%f24
loop_2286:
	stx	%o2,	[%l7 + 0x10]
	sethi	0x12CA,	%i1
	sdivx	%l4,	0x05F1,	%i6
	membar	0x78
	fbu	%fcc3,	loop_2287
	call	loop_2288
	fmovsvs	%xcc,	%f2,	%f14
	edge16n	%l0,	%i3,	%g1
loop_2287:
	pdist	%f0,	%f20,	%f16
loop_2288:
	stw	%g6,	[%l7 + 0x30]
	bg,a,pt	%icc,	loop_2289
	bg,pn	%xcc,	loop_2290
	brlz	%o0,	loop_2291
	fnot1s	%f21,	%f31
loop_2289:
	brgez,a	%o6,	loop_2292
loop_2290:
	ldd	[%l7 + 0x50],	%f6
loop_2291:
	tcc	%icc,	0x7
	fabss	%f14,	%f13
loop_2292:
	mova	%icc,	%i4,	%i0
	sdivcc	%o5,	0x057B,	%g7
	orcc	%o1,	0x0F04,	%l5
	fmovrdlz	%g3,	%f20,	%f6
	movcc	%xcc,	%l1,	%g5
	ldd	[%l7 + 0x70],	%f8
	srl	%o3,	0x17,	%o7
	orcc	%i2,	%i5,	%g4
	srl	%l3,	%l6,	%g2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x11,	%o4,	%i7
	bvc,a	loop_2293
	tg	%xcc,	0x2
	umulcc	%l2,	0x0D6C,	%i1
	fble,a	%fcc3,	loop_2294
loop_2293:
	movvs	%icc,	%o2,	%l4
	edge32n	%i6,	%i3,	%g1
	edge32n	%g6,	%o0,	%l0
loop_2294:
	taddcctv	%o6,	0x0852,	%i0
	tsubcctv	%o5,	0x0B4A,	%i4
	movre	%o1,	%l5,	%g7
	lduh	[%l7 + 0x40],	%g3
	xor	%l1,	%o3,	%g5
	movl	%icc,	%o7,	%i5
	tn	%icc,	0x1
	ldstub	[%l7 + 0x66],	%i2
	and	%l3,	%l6,	%g2
	brnz	%o4,	loop_2295
	fmovrslez	%g4,	%f9,	%f12
	fpmerge	%f31,	%f8,	%f0
	ldx	[%l7 + 0x18],	%i7
loop_2295:
	bn	loop_2296
	fzeros	%f16
	movcc	%icc,	%i1,	%o2
	ldub	[%l7 + 0x50],	%l2
loop_2296:
	srl	%l4,	%i6,	%g1
	movge	%icc,	%i3,	%o0
	fmovdcs	%xcc,	%f29,	%f7
	fbn	%fcc2,	loop_2297
	movleu	%icc,	%g6,	%l0
	sll	%o6,	%o5,	%i4
	set	0x5A, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i0
loop_2297:
	fbg,a	%fcc3,	loop_2298
	ldsh	[%l7 + 0x78],	%o1
	call	loop_2299
	fnot2	%f6,	%f2
loop_2298:
	movpos	%xcc,	%l5,	%g7
	subcc	%g3,	%l1,	%o3
loop_2299:
	movl	%icc,	%g5,	%o7
	fbule,a	%fcc0,	loop_2300
	subc	%i2,	%l3,	%l6
	nop
	setx	0x9C834D8411177449,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x8CE7C790FAA17286,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f12,	%f0
	fblg	%fcc1,	loop_2301
loop_2300:
	addc	%g2,	%o4,	%g4
	subccc	%i7,	%i1,	%o2
	st	%f18,	[%l7 + 0x70]
loop_2301:
	movne	%icc,	%i5,	%l2
	tpos	%xcc,	0x3
	xorcc	%l4,	0x05F2,	%g1
	mova	%icc,	%i6,	%i3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g6
	movre	%o0,	0x259,	%l0
	fsrc1	%f18,	%f22
	nop
	setx	0x91F2EED1A4C164BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xCE320CC7FA81771F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f14,	%f10
	tne	%xcc,	0x6
	edge8n	%o5,	%i4,	%o6
	movre	%o1,	%l5,	%i0
	udivcc	%g7,	0x0E7E,	%g3
	movrgez	%o3,	%g5,	%o7
	move	%xcc,	%l1,	%l3
	subccc	%i2,	%g2,	%o4
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	ta	%xcc,	0x0
	tleu	%xcc,	0x1
	edge32ln	%i7,	%i1,	%g4
	sll	%o2,	%i5,	%l2
	fmovrsgz	%g1,	%f8,	%f23
	tpos	%xcc,	0x4
	sdivx	%i6,	0x097E,	%i3
	movl	%xcc,	%g6,	%l4
	tvc	%icc,	0x5
	std	%f26,	[%l7 + 0x18]
	sethi	0x00A0,	%l0
	movrne	%o0,	0x3E4,	%o5
	andncc	%o6,	%i4,	%l5
	movle	%xcc,	%o1,	%i0
	array32	%g3,	%o3,	%g7
	fcmpeq16	%f16,	%f4,	%g5
	edge32n	%l1,	%o7,	%i2
	addcc	%l3,	0x152B,	%g2
	edge16	%o4,	%l6,	%i1
	sdivcc	%i7,	0x1E07,	%g4
	fmul8ulx16	%f28,	%f12,	%f30
	edge16	%i5,	%o2,	%g1
	fornot2	%f10,	%f10,	%f8
	andncc	%i6,	%i3,	%l2
	tleu	%xcc,	0x0
	mulx	%l4,	0x1251,	%g6
	movne	%xcc,	%l0,	%o0
	udivcc	%o5,	0x0FFF,	%i4
	bg	%icc,	loop_2302
	movleu	%xcc,	%l5,	%o6
	sir	0x02CE
	nop
	fitos	%f10,	%f26
	fstod	%f26,	%f30
loop_2302:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x10] %asi,	%o1
	fbe	%fcc2,	loop_2303
	te	%icc,	0x0
	fmovsge	%xcc,	%f1,	%f28
	fbuge	%fcc2,	loop_2304
loop_2303:
	bvs,a	loop_2305
	array8	%i0,	%o3,	%g7
	ldsw	[%l7 + 0x3C],	%g5
loop_2304:
	edge16n	%l1,	%o7,	%i2
loop_2305:
	nop
	setx	0xDEE1DA9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f9
	movcc	%xcc,	%g3,	%g2
	nop
	setx	0xB1A4450148DB00CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x76B4E525B3B4E6E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f10,	%f16
	tgu	%xcc,	0x4
	add	%o4,	%l3,	%i1
	movrgez	%l6,	0x248,	%g4
	set	0x48, %o6
	stxa	%i7,	[%l7 + %o6] 0x2f
	membar	#Sync
	movvs	%icc,	%i5,	%o2
	fsrc1	%f14,	%f28
	fpackfix	%f26,	%f3
	sethi	0x057F,	%i6
	movne	%icc,	%i3,	%l2
	umulcc	%g1,	0x1510,	%l4
	subccc	%l0,	%g6,	%o5
	fmovsvc	%icc,	%f14,	%f25
	tvs	%icc,	0x2
	movrgz	%o0,	0x33F,	%l5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i4
	addc	%o1,	%i0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2306, %l0, %l1
	jmpl %l1, %g7
	edge8n	%o3,	%l1,	%o7
	fbule	%fcc2,	loop_2307
	stx	%g5,	[%l7 + 0x30]
loop_2306:
	edge8ln	%i2,	%g2,	%o4
	sdivx	%g3,	0x185C,	%i1
loop_2307:
	edge32ln	%l3,	%g4,	%l6
	edge32ln	%i5,	%o2,	%i6
	edge8n	%i7,	%l2,	%g1
	fmovdg	%icc,	%f20,	%f30
	brnz	%i3,	loop_2308
	umulcc	%l0,	%l4,	%o5
	swap	[%l7 + 0x2C],	%o0
	orn	%g6,	%i4,	%o1
loop_2308:
	smul	%i0,	0x10C4,	%o6
	xor	%l5,	0x1E59,	%g7
	fbne	%fcc0,	loop_2309
	brgez	%l1,	loop_2310
	sub	%o3,	%o7,	%i2
	array32	%g5,	%o4,	%g3
loop_2309:
	nop
	set	0x14, %l6
	lduha	[%l7 + %l6] 0x18,	%g2
loop_2310:
	popc	%l3,	%i1
	sra	%l6,	0x13,	%i5
	ldsb	[%l7 + 0x63],	%o2
	nop
	setx	0x367995B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xBA77D1AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f31,	%f3
	movgu	%icc,	%i6,	%i7
	movvc	%xcc,	%g4,	%g1
	tne	%icc,	0x6
	udivcc	%i3,	0x19D7,	%l2
	udivx	%l0,	0x1073,	%l4
	movcs	%xcc,	%o5,	%g6
	nop
	setx	0x4EBA4EFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f20
	fmovdvc	%xcc,	%f12,	%f4
	ldsw	[%l7 + 0x78],	%i4
	fcmpeq32	%f26,	%f18,	%o1
	ldsb	[%l7 + 0x13],	%i0
	srlx	%o6,	%o0,	%g7
	fnors	%f3,	%f29,	%f13
	movrgez	%l5,	0x011,	%o3
	movl	%xcc,	%l1,	%o7
	movgu	%xcc,	%g5,	%o4
	srlx	%g3,	%g2,	%i2
	fornot2s	%f5,	%f30,	%f31
	edge16n	%l3,	%l6,	%i5
	subc	%i1,	%o2,	%i6
	flush	%l7 + 0x10
	fbo,a	%fcc2,	loop_2311
	fmovsgu	%xcc,	%f24,	%f19
	edge16ln	%i7,	%g1,	%i3
	ld	[%l7 + 0x4C],	%f17
loop_2311:
	fbg,a	%fcc1,	loop_2312
	movl	%xcc,	%g4,	%l2
	movne	%icc,	%l0,	%l4
	fnot2	%f20,	%f10
loop_2312:
	tvc	%xcc,	0x6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%g6
	nop
	setx	0x89DA3776,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x7F4F581C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f16,	%f13
	fble	%fcc3,	loop_2313
	edge8ln	%o5,	%i4,	%i0
	movneg	%xcc,	%o6,	%o0
	bg,a,pt	%xcc,	loop_2314
loop_2313:
	xnor	%g7,	0x0386,	%o1
	bg,a,pn	%icc,	loop_2315
	array32	%l5,	%o3,	%o7
loop_2314:
	tle	%xcc,	0x0
	st	%f3,	[%l7 + 0x48]
loop_2315:
	add	%l1,	0x0EC7,	%o4
	tl	%xcc,	0x0
	mulx	%g5,	%g2,	%i2
	tcs	%xcc,	0x6
	fmovsle	%xcc,	%f6,	%f0
	lduh	[%l7 + 0x38],	%g3
	srlx	%l3,	%l6,	%i1
	nop
	setx	loop_2316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%i5,	%o2,	%i6
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2316:
	nop
	fitos	%f14,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f22
	nop
	setx	0x6E3AAE3BD75C598B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x793FF699325C0537,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f30,	%f10
	orncc	%i7,	0x0A2C,	%i3
	wr	%g0,	0x89,	%asi
	stwa	%g1,	[%l7 + 0x74] %asi
	fbl	%fcc0,	loop_2317
	subcc	%l2,	%g4,	%l4
	fandnot1	%f4,	%f10,	%f12
	or	%l0,	%o5,	%i4
loop_2317:
	fmovsneg	%xcc,	%f11,	%f10
	xorcc	%i0,	0x185E,	%g6
	nop
	setx	loop_2318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovde	%icc,	%f1,	%f13
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%o0
loop_2318:
	ble,a,pt	%icc,	loop_2319
	movn	%xcc,	%o6,	%g7
	brz	%l5,	loop_2320
	sllx	%o3,	0x1F,	%o7
loop_2319:
	xor	%l1,	0x1948,	%o1
	subccc	%g5,	%g2,	%i2
loop_2320:
	andcc	%o4,	%g3,	%l3
	smulcc	%l6,	%i5,	%i1
	fornot2s	%f30,	%f18,	%f7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x46] %asi,	%o2
	or	%i7,	0x1919,	%i3
	tvs	%icc,	0x6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g1
	set	0x70, %g4
	sta	%f5,	[%l7 + %g4] 0x0c
	fpackfix	%f24,	%f31
	fmovs	%f30,	%f1
	swap	[%l7 + 0x14],	%i6
	stx	%l2,	[%l7 + 0x40]
	movrgz	%g4,	0x3C3,	%l0
	and	%l4,	0x1A06,	%i4
	fmul8ulx16	%f18,	%f0,	%f20
	tsubcctv	%o5,	%g6,	%o0
	andncc	%i0,	%g7,	%l5
	fmovsleu	%icc,	%f5,	%f24
	movleu	%xcc,	%o3,	%o6
	tn	%xcc,	0x6
	fmul8x16al	%f15,	%f5,	%f22
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x0c,	%f16
	bvs	%icc,	loop_2321
	bgu,a	%xcc,	loop_2322
	sllx	%o7,	%l1,	%g5
	nop
	setx	0x887ED828C6A6601D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f30
loop_2321:
	nop
	set	0x0C, %g5
	lduw	[%l7 + %g5],	%o1
loop_2322:
	nop
	setx	0x416AD870528EA33B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x71759185D012302A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f2,	%f20
	addccc	%g2,	%i2,	%g3
	fzeros	%f22
	tsubcctv	%l3,	%l6,	%o4
	stw	%i5,	[%l7 + 0x30]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x0
	addc	%i1,	%o2,	%i3
	ld	[%l7 + 0x60],	%f22
	fbe	%fcc1,	loop_2323
	edge8n	%i7,	%i6,	%l2
	te	%xcc,	0x6
	brnz	%g4,	loop_2324
loop_2323:
	edge16l	%l0,	%l4,	%i4
	nop
	setx	0x136C284B505965A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	srl	%g1,	%g6,	%o0
loop_2324:
	fnot2	%f30,	%f4
	bpos,a	%xcc,	loop_2325
	fpsub32s	%f4,	%f20,	%f27
	st	%f18,	[%l7 + 0x74]
	movleu	%icc,	%o5,	%g7
loop_2325:
	sth	%i0,	[%l7 + 0x50]
	mulx	%l5,	%o6,	%o3
	fmovda	%xcc,	%f14,	%f14
	subc	%l1,	%o7,	%g5
	movcc	%xcc,	%g2,	%i2
	tsubcctv	%g3,	%o1,	%l3
	tvs	%icc,	0x4
	movrgez	%o4,	%l6,	%i5
	subcc	%i1,	%i3,	%o2
	movle	%icc,	%i7,	%l2
	srlx	%g4,	%i6,	%l0
	ble	%xcc,	loop_2326
	nop
	set	0x60, %g1
	stb	%l4,	[%l7 + %g1]
	movgu	%icc,	%g1,	%i4
	edge8	%o0,	%o5,	%g7
loop_2326:
	fba,a	%fcc0,	loop_2327
	fbg,a	%fcc2,	loop_2328
	or	%i0,	%g6,	%l5
	fbu,a	%fcc1,	loop_2329
loop_2327:
	movgu	%xcc,	%o3,	%o6
loop_2328:
	brnz	%o7,	loop_2330
	sir	0x07D0
loop_2329:
	movvs	%icc,	%l1,	%g5
	for	%f30,	%f10,	%f18
loop_2330:
	fbg,a	%fcc2,	loop_2331
	nop
	fitos	%f2,	%f7
	fstox	%f7,	%f24
	fblg,a	%fcc0,	loop_2332
	movrgez	%i2,	0x2C7,	%g2
loop_2331:
	tg	%xcc,	0x6
	brlez,a	%g3,	loop_2333
loop_2332:
	udivx	%o1,	0x0787,	%l3
	sll	%l6,	%o4,	%i5
	taddcc	%i1,	%i3,	%i7
loop_2333:
	stbar
	subc	%o2,	0x0199,	%g4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x34] %asi,	%i6
	umulcc	%l0,	0x1FAA,	%l4
	bvs,a,pn	%icc,	loop_2334
	call	loop_2335
	nop
	fitod	%f21,	%f26
	srax	%g1,	%l2,	%o0
loop_2334:
	tl	%icc,	0x0
loop_2335:
	fpackfix	%f8,	%f15
	fmovdg	%icc,	%f19,	%f22
	nop
	setx	0xFBFCA75CB06030D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	be	%xcc,	loop_2336
	andcc	%i4,	%g7,	%o5
	srlx	%g6,	0x04,	%i0
	nop
	set	0x30, %l0
	stx	%o3,	[%l7 + %l0]
loop_2336:
	ldx	[%l7 + 0x28],	%o6
	fmovdge	%icc,	%f30,	%f28
	subc	%o7,	%l1,	%l5
	std	%f24,	[%l7 + 0x78]
	movpos	%icc,	%g5,	%i2
	edge32l	%g3,	%g2,	%o1
	fbuge,a	%fcc3,	loop_2337
	alignaddrl	%l3,	%o4,	%l6
	udivcc	%i1,	0x1F3A,	%i3
	srax	%i5,	0x1E,	%i7
loop_2337:
	bvc,pt	%icc,	loop_2338
	movre	%g4,	%o2,	%i6
	subcc	%l4,	0x10DC,	%l0
	and	%g1,	0x1F2E,	%l2
loop_2338:
	umulcc	%i4,	0x0930,	%g7
	fpadd16	%f24,	%f14,	%f2
	sdiv	%o0,	0x1D61,	%g6
	set	0x08, %i5
	lduha	[%l7 + %i5] 0x14,	%o5
	movcs	%icc,	%i0,	%o3
	std	%f28,	[%l7 + 0x50]
	tneg	%xcc,	0x7
	tl	%xcc,	0x6
	edge32n	%o6,	%o7,	%l5
	fandnot1	%f2,	%f8,	%f0
	wr	%g0,	0x22,	%asi
	stha	%l1,	[%l7 + 0x36] %asi
	membar	#Sync
	and	%g5,	0x11F4,	%i2
	taddcc	%g2,	%g3,	%l3
	sllx	%o1,	%o4,	%l6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%i1
	edge32n	%i3,	%i7,	%g4
	orcc	%o2,	0x0027,	%i6
	nop
	set	0x38, %i2
	stx	%i5,	[%l7 + %i2]
	umulcc	%l0,	%g1,	%l2
	fmovsn	%icc,	%f8,	%f30
	movle	%icc,	%l4,	%i4
	te	%xcc,	0x7
	sllx	%o0,	0x1A,	%g7
	fpadd16s	%f3,	%f7,	%f0
	and	%o5,	0x1C86,	%i0
	edge16	%o3,	%g6,	%o7
	fbug	%fcc2,	loop_2339
	sir	0x1FFD
	nop
	setx	loop_2340,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	call	loop_2341
loop_2339:
	edge16n	%o6,	%l5,	%l1
	ldsw	[%l7 + 0x64],	%i2
loop_2340:
	std	%f10,	[%l7 + 0x50]
loop_2341:
	udivx	%g2,	0x1A94,	%g5
	fands	%f4,	%f7,	%f2
	fmovspos	%xcc,	%f16,	%f15
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l3,	%o1
	tleu	%icc,	0x5
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x04,	 0x2
	movpos	%xcc,	%l6,	%g3
	brz,a	%i3,	loop_2342
	taddcc	%i7,	%i1,	%g4
	stx	%o2,	[%l7 + 0x38]
	nop
	setx	loop_2343,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2342:
	andncc	%i6,	%l0,	%i5
	movcs	%xcc,	%g1,	%l4
	addcc	%i4,	%l2,	%g7
loop_2343:
	movcc	%icc,	%o0,	%o5
	fbo,a	%fcc1,	loop_2344
	fpadd32s	%f3,	%f16,	%f24
	taddcc	%i0,	%o3,	%o7
	set	0x5E, %l2
	stha	%g6,	[%l7 + %l2] 0x88
loop_2344:
	fornot2	%f26,	%f30,	%f10
	fba,a	%fcc3,	loop_2345
	fblg,a	%fcc0,	loop_2346
	srlx	%o6,	0x08,	%l5
	tvc	%icc,	0x3
loop_2345:
	fmovsl	%icc,	%f12,	%f8
loop_2346:
	tl	%icc,	0x5
	lduh	[%l7 + 0x2A],	%i2
	fmovdl	%xcc,	%f5,	%f0
	alignaddr	%l1,	%g2,	%l3
	fors	%f5,	%f11,	%f13
	brgz	%o1,	loop_2347
	movge	%icc,	%g5,	%o4
	tsubcctv	%g3,	%i3,	%i7
	brgz	%l6,	loop_2348
loop_2347:
	addc	%g4,	%i1,	%i6
	fpack16	%f20,	%f28
	tsubcc	%l0,	0x0EA6,	%o2
loop_2348:
	mulx	%g1,	0x1031,	%l4
	subccc	%i4,	0x11F1,	%l2
	fsrc2	%f26,	%f14
	fmovrsgz	%g7,	%f17,	%f16
	addccc	%o0,	%o5,	%i5
	fbl,a	%fcc1,	loop_2349
	mulx	%i0,	%o3,	%g6
	nop
	setx	loop_2350,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2s	%f5,	%f5
loop_2349:
	fmovdg	%icc,	%f26,	%f10
	fpmerge	%f29,	%f24,	%f4
loop_2350:
	fzeros	%f20
	tvs	%xcc,	0x5
	fnor	%f2,	%f20,	%f22
	fbe,a	%fcc0,	loop_2351
	edge8	%o6,	%l5,	%o7
	bn,pt	%icc,	loop_2352
	movrne	%l1,	%g2,	%i2
loop_2351:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2E] %asi,	%o1
loop_2352:
	nop
	fitos	%f7,	%f22
	fstox	%f22,	%f18
	fbg	%fcc3,	loop_2353
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f31
	fbo	%fcc1,	loop_2354
	umulcc	%g5,	%l3,	%g3
loop_2353:
	st	%f9,	[%l7 + 0x70]
	edge8l	%o4,	%i3,	%l6
loop_2354:
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i7,	%g4
	add	%i6,	%l0,	%i1
	movcs	%icc,	%o2,	%g1
	array32	%i4,	%l2,	%l4
	subccc	%o0,	0x0158,	%g7
	tl	%icc,	0x0
	srlx	%o5,	%i0,	%i5
	fmovsneg	%xcc,	%f7,	%f26
	stx	%g6,	[%l7 + 0x48]
	sll	%o3,	0x11,	%o6
	array32	%l5,	%l1,	%o7
	alignaddrl	%i2,	%o1,	%g5
	xorcc	%l3,	%g2,	%g3
	fpadd32s	%f28,	%f3,	%f12
	te	%icc,	0x3
	fandnot2s	%f5,	%f0,	%f19
	bge,a	loop_2355
	movrgez	%i3,	0x078,	%l6
	fmovscs	%icc,	%f5,	%f16
	brgez,a	%i7,	loop_2356
loop_2355:
	movcc	%xcc,	%o4,	%g4
	movn	%xcc,	%i6,	%l0
	movl	%xcc,	%o2,	%i1
loop_2356:
	be,pt	%xcc,	loop_2357
	orn	%i4,	%l2,	%g1
	fpack16	%f26,	%f31
	sub	%o0,	0x14CE,	%g7
loop_2357:
	edge32	%o5,	%l4,	%i5
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x0c,	 0x3
	move	%xcc,	%i0,	%o6
	fors	%f29,	%f20,	%f19
	ble,a,pn	%xcc,	loop_2358
	ldsw	[%l7 + 0x64],	%l5
	movneg	%icc,	%l1,	%o7
	edge8ln	%o3,	%i2,	%g5
loop_2358:
	edge32ln	%o1,	%l3,	%g3
	smulcc	%i3,	0x1C77,	%l6
	andn	%g2,	%o4,	%i7
	ta	%icc,	0x6
	bgu	%icc,	loop_2359
	addcc	%g4,	%i6,	%l0
	brnz	%o2,	loop_2360
	fbug	%fcc1,	loop_2361
loop_2359:
	sub	%i4,	%i1,	%l2
	stx	%g1,	[%l7 + 0x38]
loop_2360:
	fpsub16	%f6,	%f26,	%f28
loop_2361:
	srax	%g7,	0x16,	%o0
	tneg	%icc,	0x0
	tne	%icc,	0x4
	fmovsneg	%xcc,	%f11,	%f12
	nop
	setx	0x573A5B94506B2EFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	stx	%o5,	[%l7 + 0x20]
	pdist	%f10,	%f16,	%f26
	movge	%xcc,	%i5,	%l4
	fblg	%fcc3,	loop_2362
	subc	%i0,	%g6,	%l5
	fandnot2	%f6,	%f30,	%f0
	bgu,pn	%icc,	loop_2363
loop_2362:
	bshuffle	%f12,	%f28,	%f24
	brlez,a	%o6,	loop_2364
	taddcc	%o7,	%l1,	%i2
loop_2363:
	edge8n	%g5,	%o1,	%l3
	movvs	%xcc,	%g3,	%i3
loop_2364:
	edge32ln	%l6,	%o3,	%g2
	xorcc	%o4,	%g4,	%i6
	array8	%i7,	%o2,	%i4
	te	%icc,	0x3
	nop
	set	0x48, %l1
	stw	%i1,	[%l7 + %l1]
	move	%xcc,	%l0,	%g1
	movg	%xcc,	%g7,	%l2
	movcs	%icc,	%o0,	%o5
	fmovsleu	%xcc,	%f15,	%f4
	movrlz	%i5,	%l4,	%g6
	sdiv	%l5,	0x0B7F,	%i0
	nop
	setx	loop_2365,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%xcc,	%o6,	%o7
	nop
	setx	0xA5869A1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xCA278463,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f2,	%f5
	movrne	%i2,	%l1,	%o1
loop_2365:
	movneg	%xcc,	%l3,	%g3
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x1e,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x24, %o4
	sta	%f23,	[%l7 + %o4] 0x15
	subccc	%i3,	0x0F38,	%l6
	fbg	%fcc3,	loop_2366
	fcmpeq32	%f4,	%f18,	%g5
	addccc	%g2,	0x180E,	%o3
	movre	%g4,	0x0AB,	%o4
loop_2366:
	bshuffle	%f26,	%f12,	%f16
	tsubcctv	%i6,	0x0BA1,	%i7
	movrlz	%i4,	%o2,	%l0
	or	%i1,	0x1DF7,	%g1
	subcc	%g7,	0x069C,	%l2
	subc	%o5,	0x024B,	%i5
	edge16	%o0,	%l4,	%g6
	array8	%l5,	%o6,	%o7
	call	loop_2367
	bgu	%icc,	loop_2368
	movrgz	%i0,	%i2,	%o1
	fxors	%f8,	%f0,	%f29
loop_2367:
	ldsh	[%l7 + 0x56],	%l1
loop_2368:
	fmuld8sux16	%f31,	%f12,	%f28
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	movleu	%xcc,	%l3,	%i3
	prefetch	[%l7 + 0x14],	 0x3
	movcc	%xcc,	%l6,	%g5
	fnand	%f24,	%f18,	%f12
	fbe,a	%fcc1,	loop_2369
	movcs	%icc,	%o3,	%g2
	ldub	[%l7 + 0x46],	%o4
	umulcc	%i6,	0x15BE,	%i7
loop_2369:
	tcs	%icc,	0x1
	tpos	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i4,	%g4
	fbn	%fcc0,	loop_2370
	addccc	%l0,	%i1,	%o2
	movpos	%icc,	%g7,	%g1
	subc	%o5,	%l2,	%o0
loop_2370:
	subcc	%i5,	%l4,	%g6
	ldsb	[%l7 + 0x73],	%o6
	ldx	[%l7 + 0x20],	%o7
	edge16n	%l5,	%i0,	%o1
	sdivcc	%l1,	0x0400,	%g3
	alignaddrl	%l3,	%i2,	%i3
	movneg	%icc,	%g5,	%l6
	fcmple16	%f4,	%f0,	%o3
	st	%f9,	[%l7 + 0x78]
	edge16n	%o4,	%g2,	%i7
	brz	%i4,	loop_2371
	tcc	%xcc,	0x1
	movpos	%icc,	%i6,	%g4
	movrne	%l0,	0x14D,	%i1
loop_2371:
	fpadd32s	%f22,	%f10,	%f4
	array16	%o2,	%g7,	%g1
	sdiv	%o5,	0x0C7C,	%o0
	popc	0x08ED,	%l2
	xorcc	%l4,	0x106E,	%i5
	lduh	[%l7 + 0x2A],	%o6
	fbe	%fcc1,	loop_2372
	tle	%icc,	0x0
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f24
	fxtos	%f24,	%f4
	fnands	%f27,	%f18,	%f9
loop_2372:
	tpos	%xcc,	0x6
	ldx	[%l7 + 0x70],	%g6
	fcmpgt32	%f18,	%f16,	%l5
	set	0x74, %i3
	sta	%f24,	[%l7 + %i3] 0x89
	movrlez	%o7,	0x07E,	%o1
	tneg	%icc,	0x5
	fmovdn	%xcc,	%f4,	%f19
	std	%f2,	[%l7 + 0x30]
	array8	%i0,	%l1,	%g3
	nop
	setx	loop_2373,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%l3,	%i3,	%i2
	srlx	%g5,	0x14,	%l6
	ldd	[%l7 + 0x08],	%f12
loop_2373:
	sdiv	%o3,	0x06E8,	%o4
	ldstub	[%l7 + 0x69],	%g2
	fandnot1	%f6,	%f14,	%f24
	tne	%icc,	0x6
	fbo	%fcc3,	loop_2374
	bvc	%xcc,	loop_2375
	brgez,a	%i4,	loop_2376
	sllx	%i7,	%g4,	%i6
loop_2374:
	srax	%i1,	0x12,	%o2
loop_2375:
	srl	%l0,	%g1,	%g7
loop_2376:
	andncc	%o0,	%l2,	%l4
	fcmpgt16	%f26,	%f18,	%o5
	fabsd	%f30,	%f30
	fpackfix	%f10,	%f28
	orn	%o6,	0x035F,	%g6
	xnor	%l5,	0x04C0,	%i5
	andncc	%o7,	%i0,	%l1
	fexpand	%f25,	%f30
	subcc	%o1,	0x02BE,	%l3
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	fpsub32	%f0,	%f14,	%f10
	fpsub16s	%f6,	%f10,	%f29
	xorcc	%g3,	0x057B,	%i2
	edge16	%l6,	%g5,	%o3
	fpack16	%f12,	%f26
	edge32l	%o4,	%g2,	%i7
	subcc	%g4,	%i6,	%i1
	ldstub	[%l7 + 0x37],	%o2
	or	%i4,	%l0,	%g1
	brnz,a	%g7,	loop_2377
	edge32ln	%o0,	%l4,	%o5
	umul	%l2,	0x0328,	%o6
	fmovrdgz	%l5,	%f6,	%f20
loop_2377:
	fbule,a	%fcc1,	loop_2378
	and	%g6,	%o7,	%i5
	nop
	setx	0xF07538A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	edge16	%i0,	%o1,	%l3
loop_2378:
	andcc	%i3,	%l1,	%i2
	sdivcc	%l6,	0x0D2A,	%g5
	bvc,a	loop_2379
	movge	%xcc,	%o3,	%g3
	bvc,pn	%icc,	loop_2380
	addcc	%g2,	%i7,	%o4
loop_2379:
	movne	%icc,	%g4,	%i6
	edge8n	%i1,	%o2,	%l0
loop_2380:
	fxnor	%f8,	%f26,	%f8
	fble	%fcc0,	loop_2381
	edge8	%g1,	%g7,	%o0
	fmovscs	%icc,	%f25,	%f20
	movre	%i4,	%o5,	%l4
loop_2381:
	srl	%l2,	0x00,	%o6
	alignaddr	%l5,	%o7,	%i5
	xnorcc	%i0,	0x0832,	%o1
	movle	%icc,	%g6,	%i3
	bcc,pn	%icc,	loop_2382
	tg	%xcc,	0x1
	fbul,a	%fcc3,	loop_2383
	movgu	%icc,	%l1,	%i2
loop_2382:
	array8	%l6,	%l3,	%o3
	fmul8x16au	%f28,	%f9,	%f12
loop_2383:
	smulcc	%g3,	0x0B0F,	%g5
	tsubcctv	%i7,	0x0CCF,	%g2
	ldsh	[%l7 + 0x56],	%o4
	fxors	%f4,	%f10,	%f26
	movl	%xcc,	%i6,	%g4
	movre	%i1,	%o2,	%l0
	movcs	%icc,	%g1,	%g7
	bgu,a,pt	%xcc,	loop_2384
	movrlez	%o0,	0x1A2,	%o5
	movne	%icc,	%l4,	%i4
	fzero	%f6
loop_2384:
	flush	%l7 + 0x54
	tvc	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l2,	0x0B3C,	%l5
	tge	%xcc,	0x3
	nop
	fitod	%f6,	%f26
	fdtoi	%f26,	%f15
	edge8l	%o6,	%i5,	%o7
	bvc,a	loop_2385
	fbug,a	%fcc1,	loop_2386
	edge8l	%i0,	%o1,	%g6
	movvs	%xcc,	%i3,	%i2
loop_2385:
	nop
	fitod	%f12,	%f4
	fdtox	%f4,	%f14
loop_2386:
	bcc,a,pt	%icc,	loop_2387
	nop
	setx	0x07222B26FD8B3D2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x19417C44E7797CDE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f0,	%f22
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf1
	membar	#Sync
loop_2387:
	movpos	%icc,	%l6,	%l1
	tge	%icc,	0x4
	move	%xcc,	%l3,	%o3
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f26
	fxtod	%f26,	%f4
	srl	%g5,	0x1C,	%i7
	udivcc	%g2,	0x1A2A,	%o4
	ldd	[%l7 + 0x30],	%f24
	srlx	%g3,	%g4,	%i6
	movne	%xcc,	%o2,	%i1
	tsubcctv	%l0,	0x0480,	%g7
	udivx	%o0,	0x02B1,	%g1
	edge32n	%o5,	%i4,	%l2
	fbu	%fcc3,	loop_2388
	alignaddr	%l5,	%o6,	%i5
	smulcc	%o7,	%i0,	%o1
	tneg	%xcc,	0x1
loop_2388:
	tvc	%xcc,	0x5
	fands	%f27,	%f30,	%f26
	set	0x28, %o1
	ldstuba	[%l7 + %o1] 0x0c,	%l4
	xor	%i3,	%g6,	%l6
	nop
	setx loop_2389, %l0, %l1
	jmpl %l1, %i2
	srl	%l3,	%o3,	%l1
	edge8	%i7,	%g2,	%o4
	set	0x4B, %i6
	ldsba	[%l7 + %i6] 0x80,	%g3
loop_2389:
	movpos	%xcc,	%g4,	%g5
	nop
	setx	0x45F1E7AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xFBC80EC3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f4,	%f9
	fmovdpos	%icc,	%f3,	%f8
	movrlz	%o2,	%i6,	%l0
	fpsub32s	%f10,	%f11,	%f15
	fxnor	%f26,	%f20,	%f14
	movrlez	%g7,	0x063,	%o0
	fmovrde	%g1,	%f18,	%f30
	nop
	setx	0xABC27C8A40401695,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fmovrdlz	%o5,	%f26,	%f28
	andn	%i4,	%l2,	%i1
	fbge,a	%fcc1,	loop_2390
	sub	%o6,	%i5,	%l5
	alignaddr	%i0,	%o1,	%o7
	movvs	%icc,	%l4,	%g6
loop_2390:
	ba	%icc,	loop_2391
	ldx	[%l7 + 0x18],	%i3
	fmovsgu	%icc,	%f9,	%f26
	udiv	%i2,	0x0383,	%l6
loop_2391:
	fpadd32	%f2,	%f6,	%f2
	udivcc	%o3,	0x1566,	%l3
	edge32l	%l1,	%i7,	%g2
	fbul	%fcc3,	loop_2392
	movrlez	%g3,	0x203,	%o4
	fba	%fcc2,	loop_2393
	addccc	%g5,	%g4,	%o2
loop_2392:
	ba,a	%xcc,	loop_2394
	fsrc2	%f0,	%f26
loop_2393:
	udivcc	%l0,	0x0913,	%i6
	fmovrdgez	%g7,	%f18,	%f10
loop_2394:
	fabss	%f27,	%f27
	fnegd	%f24,	%f14
	tl	%icc,	0x0
	wr	%g0,	0x2b,	%asi
	stwa	%o0,	[%l7 + 0x08] %asi
	membar	#Sync
	add	%g1,	%i4,	%o5
	tg	%icc,	0x2
	fba	%fcc1,	loop_2395
	brnz,a	%l2,	loop_2396
	edge32ln	%o6,	%i5,	%i1
	movcc	%icc,	%i0,	%l5
loop_2395:
	xnor	%o1,	0x1CBD,	%o7
loop_2396:
	fbn	%fcc0,	loop_2397
	fsrc1	%f2,	%f6
	movpos	%icc,	%l4,	%g6
	addcc	%i3,	0x03A0,	%i2
loop_2397:
	array16	%l6,	%o3,	%l3
	set	0x0C, %l4
	swapa	[%l7 + %l4] 0x88,	%l1
	lduh	[%l7 + 0x2C],	%i7
	fbul	%fcc3,	loop_2398
	tg	%xcc,	0x6
	st	%f21,	[%l7 + 0x54]
	nop
	fitos	%f7,	%f19
	fstox	%f19,	%f10
	fxtos	%f10,	%f23
loop_2398:
	fnor	%f28,	%f20,	%f22
	mulscc	%g2,	%g3,	%o4
	sllx	%g4,	0x00,	%g5
	andcc	%l0,	%i6,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f8,	%f0,	%f14
	tg	%icc,	0x2
	sethi	0x11D0,	%o0
	fpack32	%f0,	%f6,	%f0
	orcc	%g7,	0x08EA,	%g1
	sdiv	%i4,	0x0EEE,	%l2
	mova	%xcc,	%o6,	%o5
	fnor	%f0,	%f14,	%f10
	ldsb	[%l7 + 0x4A],	%i5
	fpackfix	%f20,	%f11
	fandnot2	%f28,	%f16,	%f16
	edge8l	%i1,	%l5,	%o1
	move	%icc,	%o7,	%i0
	sdivx	%l4,	0x020D,	%i3
	tpos	%icc,	0x1
	brz	%g6,	loop_2399
	bne,a,pn	%icc,	loop_2400
	ldsw	[%l7 + 0x74],	%l6
	tsubcctv	%i2,	%o3,	%l3
loop_2399:
	nop
	setx	0xE55D8E47289BEFE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x6C739EA3B715CBED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f6,	%f12
loop_2400:
	edge16n	%l1,	%i7,	%g2
	swap	[%l7 + 0x4C],	%g3
	move	%icc,	%o4,	%g4
	tsubcctv	%g5,	0x1246,	%i6
	ta	%icc,	0x2
	array16	%l0,	%o0,	%g7
	nop
	setx	loop_2401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array16	%o2,	%g1,	%i4
	fbne	%fcc1,	loop_2402
	alignaddr	%l2,	%o5,	%i5
loop_2401:
	be,a,pt	%icc,	loop_2403
	sllx	%i1,	%l5,	%o1
loop_2402:
	mova	%xcc,	%o6,	%o7
	sdivx	%l4,	0x0968,	%i3
loop_2403:
	lduh	[%l7 + 0x74],	%i0
	fblg	%fcc3,	loop_2404
	mulx	%l6,	%g6,	%o3
	movcs	%xcc,	%i2,	%l1
	fands	%f20,	%f7,	%f7
loop_2404:
	movn	%icc,	%i7,	%g2
	tg	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x08] %asi,	%l3
	lduh	[%l7 + 0x14],	%g3
	bne,a	%xcc,	loop_2405
	fmovse	%xcc,	%f15,	%f28
	sdiv	%o4,	0x108E,	%g5
	bge,pn	%xcc,	loop_2406
loop_2405:
	bleu,a	loop_2407
	mulscc	%i6,	0x0896,	%g4
	or	%o0,	0x160E,	%g7
loop_2406:
	subcc	%o2,	0x142E,	%l0
loop_2407:
	tvc	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	stxa	%g1,	[%l7 + 0x28] %asi
	fmul8sux16	%f10,	%f12,	%f26
	ta	%icc,	0x2
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f30
	edge32l	%i4,	%l2,	%i5
	add	%i1,	0x1E1A,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o1,	%l5
	fbo	%fcc3,	loop_2408
	faligndata	%f14,	%f4,	%f2
	andn	%o7,	%o6,	%i3
	fxor	%f22,	%f16,	%f18
loop_2408:
	fbge,a	%fcc1,	loop_2409
	fbul,a	%fcc2,	loop_2410
	andncc	%l4,	%l6,	%i0
	subccc	%g6,	%o3,	%i2
loop_2409:
	sra	%l1,	%i7,	%l3
loop_2410:
	nop
	setx	0x90A01C773B859254,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x80FFEC17448D4257,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f12,	%f12
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
	orn	%g3,	0x0BAA,	%g5
	subcc	%o4,	0x0F63,	%g4
	edge16n	%o0,	%i6,	%g7
	ld	[%l7 + 0x08],	%f10
	tgu	%xcc,	0x2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	nop
	fitos	%f8,	%f4
	fstox	%f4,	%f20
	taddcctv	%g1,	%i4,	%l2
	ta	%icc,	0x0
	movre	%o2,	%i1,	%o5
	fbe,a	%fcc3,	loop_2411
	fmovsge	%icc,	%f15,	%f0
	sub	%o1,	%l5,	%i5
	movle	%xcc,	%o7,	%i3
loop_2411:
	call	loop_2412
	brnz,a	%o6,	loop_2413
	tl	%xcc,	0x7
	movne	%icc,	%l4,	%l6
loop_2412:
	addc	%g6,	%o3,	%i0
loop_2413:
	edge32l	%i2,	%i7,	%l3
	set	0x2E, %i0
	ldsha	[%l7 + %i0] 0x14,	%l1
	fcmpgt32	%f0,	%f28,	%g2
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x16,	%f0
	bge,a,pt	%icc,	loop_2414
	bl,pt	%xcc,	loop_2415
	tge	%icc,	0x5
	sdivcc	%g5,	0x08B9,	%g3
loop_2414:
	movrgz	%g4,	%o0,	%o4
loop_2415:
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f21
	fmovrsgz	%g7,	%f13,	%f22
	andcc	%i6,	%l0,	%i4
	movrne	%g1,	0x11A,	%l2
	fcmpgt32	%f2,	%f12,	%o2
	movgu	%icc,	%o5,	%o1
	andn	%i1,	%i5,	%o7
	movne	%xcc,	%l5,	%o6
	movg	%xcc,	%l4,	%l6
	bvs,pt	%icc,	loop_2416
	for	%f20,	%f24,	%f14
	mova	%xcc,	%i3,	%g6
	fbl,a	%fcc1,	loop_2417
loop_2416:
	move	%xcc,	%o3,	%i0
	swap	[%l7 + 0x44],	%i7
	nop
	setx	0xE04E7595,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
loop_2417:
	nop
	set	0x08, %g2
	stha	%i2,	[%l7 + %g2] 0x04
	flush	%l7 + 0x30
	ldsb	[%l7 + 0x69],	%l1
	subc	%g2,	%g5,	%l3
	nop
	setx	0x5C02C6E1749B35E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC5BFFA413621B4B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f12,	%f20
	fnegs	%f3,	%f24
	andn	%g4,	%o0,	%g3
	andn	%g7,	%o4,	%i6
	fmovs	%f13,	%f18
	bgu	loop_2418
	edge16ln	%i4,	%g1,	%l0
	fsrc2	%f8,	%f22
	set	0x20, %o5
	ldda	[%l7 + %o5] 0xe2,	%o2
loop_2418:
	bgu	%icc,	loop_2419
	swap	[%l7 + 0x50],	%o5
	xor	%o1,	0x1174,	%i1
	fbug	%fcc0,	loop_2420
loop_2419:
	alignaddr	%l2,	%i5,	%o7
	udiv	%l5,	0x0B7C,	%l4
	nop
	setx	0x3D634E22C033B3D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x54EF5BEF410B8E3B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f8,	%f10
loop_2420:
	movne	%icc,	%o6,	%i3
	movgu	%xcc,	%g6,	%l6
	movrlz	%i0,	%o3,	%i7
	fmovspos	%icc,	%f23,	%f15
	fnands	%f20,	%f1,	%f23
	sdiv	%l1,	0x0F09,	%g2
	sll	%i2,	%l3,	%g4
	tcs	%xcc,	0x6
	set	0x27, %l5
	stba	%g5,	[%l7 + %l5] 0x04
	or	%o0,	0x01A6,	%g3
	movrgez	%o4,	0x298,	%i6
	tg	%icc,	0x4
	ldsb	[%l7 + 0x64],	%g7
	movrgez	%i4,	0x092,	%l0
	sra	%o2,	%o5,	%g1
	sir	0x10CB
	std	%f26,	[%l7 + 0x38]
	nop
	fitos	%f2,	%f19
	fstox	%f19,	%f14
	fbule,a	%fcc1,	loop_2421
	taddcc	%i1,	%l2,	%o1
	ldd	[%l7 + 0x08],	%f10
	te	%xcc,	0x5
loop_2421:
	bl,a	%icc,	loop_2422
	fmovrdlz	%o7,	%f28,	%f30
	ldd	[%l7 + 0x18],	%l4
	subc	%l4,	%o6,	%i5
loop_2422:
	nop
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x23,	%i2
	fnands	%f22,	%f2,	%f13
	tn	%icc,	0x1
	bgu,a	loop_2423
	and	%l6,	0x0AD1,	%g6
	andncc	%i0,	%i7,	%o3
	addcc	%l1,	0x071F,	%g2
loop_2423:
	nop
	set	0x24, %l3
	stba	%l3,	[%l7 + %l3] 0x10
	ldsw	[%l7 + 0x08],	%i2
	pdist	%f14,	%f14,	%f26
	bleu,a	%icc,	loop_2424
	tgu	%icc,	0x5
	ld	[%l7 + 0x34],	%f6
	udiv	%g5,	0x1827,	%o0
loop_2424:
	fpadd16	%f26,	%f0,	%f26
	fmovde	%icc,	%f24,	%f29
	add	%l7,	0x14,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x19,	%g3,	%o4
	tne	%xcc,	0x4
	addccc	%g4,	%g7,	%i4
	subcc	%i6,	0x09AE,	%l0
	membar	0x0F
	sdivcc	%o2,	0x1A38,	%o5
	fnegd	%f4,	%f18
	tn	%icc,	0x0
	fbu,a	%fcc1,	loop_2425
	fornot2	%f12,	%f26,	%f8
	set	0x43, %g7
	stba	%g1,	[%l7 + %g7] 0x88
loop_2425:
	std	%f20,	[%l7 + 0x48]
	udivx	%l2,	0x15C3,	%o1
	fbug	%fcc1,	loop_2426
	sra	%i1,	%o7,	%l5
	membar	0x63
	for	%f0,	%f14,	%f4
loop_2426:
	taddcctv	%o6,	%i5,	%l4
	set	0x38, %i4
	stha	%i3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	setx	loop_2427,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%g6,	%i0
	movcs	%icc,	%l6,	%o3
	fmul8x16au	%f4,	%f30,	%f30
loop_2427:
	array32	%l1,	%i7,	%l3
	mova	%icc,	%i2,	%g5
	smul	%g2,	0x1478,	%o0
	addccc	%g3,	%o4,	%g7
	mova	%icc,	%g4,	%i4
	fmovdg	%icc,	%f0,	%f18
	movn	%xcc,	%i6,	%o2
	fmovdn	%icc,	%f31,	%f23
	umul	%o5,	0x1B99,	%g1
	andn	%l0,	%o1,	%l2
	nop
	setx	0xBAD766DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xBC73A026,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f27,	%f8
	tcs	%xcc,	0x6
	nop
	fitod	%f2,	%f2
	fdtox	%f2,	%f30
	mulscc	%o7,	0x1F01,	%l5
	edge16n	%i1,	%o6,	%i5
	fxors	%f22,	%f18,	%f7
	set	0x6C, %o6
	sta	%f22,	[%l7 + %o6] 0x04
	edge8ln	%i3,	%l4,	%i0
	movcs	%icc,	%l6,	%o3
	fandnot1	%f10,	%f2,	%f8
	sll	%l1,	%i7,	%l3
	xor	%g6,	0x1F12,	%g5
	fmovda	%icc,	%f7,	%f11
	fmovse	%xcc,	%f29,	%f27
	taddcc	%g2,	%i2,	%g3
	ldsw	[%l7 + 0x30],	%o4
	tge	%icc,	0x7
	sth	%o0,	[%l7 + 0x42]
	udiv	%g7,	0x0B44,	%g4
	add	%i6,	%o2,	%i4
	fble	%fcc0,	loop_2428
	smul	%g1,	%l0,	%o5
	set	0x74, %i1
	ldsba	[%l7 + %i1] 0x10,	%l2
loop_2428:
	movre	%o7,	0x2AB,	%o1
	bl,a,pt	%xcc,	loop_2429
	sra	%i1,	%l5,	%o6
	fpadd16	%f10,	%f12,	%f16
	fmovsge	%icc,	%f29,	%f25
loop_2429:
	ldub	[%l7 + 0x60],	%i5
	brnz	%l4,	loop_2430
	fmovspos	%icc,	%f10,	%f12
	nop
	setx	0x858BEB6D89B7C0AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x72B0FF6B30236A3D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f10
	xor	%i3,	%i0,	%o3
loop_2430:
	movpos	%icc,	%l1,	%i7
	nop
	setx	0xBB8D20C50276286B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x6C4810385B7B259C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f24,	%f12
	nop
	setx	0xBE576E20104917AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tpos	%icc,	0x3
	sra	%l3,	0x11,	%l6
	fmovdne	%xcc,	%f5,	%f17
	popc	%g5,	%g6
	fmovdneg	%xcc,	%f14,	%f4
	nop
	setx	0xBD20A5D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xDB31F4C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f8,	%f1
	fmovsl	%icc,	%f2,	%f23
	ld	[%l7 + 0x1C],	%f4
	edge8l	%g2,	%i2,	%o4
	std	%f12,	[%l7 + 0x58]
	edge16n	%o0,	%g7,	%g4
	be,a	loop_2431
	bvs	loop_2432
	udivcc	%i6,	0x103E,	%o2
	umul	%i4,	0x139B,	%g3
loop_2431:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x74] %asi
loop_2432:
	tcs	%icc,	0x5
	smulcc	%l0,	%o5,	%g1
	orn	%o7,	%o1,	%i1
	orncc	%l5,	0x00CE,	%l2
	subcc	%i5,	0x0440,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i3,	%o6
	ldub	[%l7 + 0x46],	%i0
	fpsub16s	%f29,	%f14,	%f5
	movcs	%icc,	%o3,	%i7
	sdiv	%l3,	0x158E,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l1,	%g5,	%g2
	addccc	%g6,	0x1DD9,	%o4
	smulcc	%o0,	0x0E6B,	%i2
	array8	%g4,	%g7,	%o2
	bneg	loop_2433
	edge8	%i6,	%g3,	%i4
	edge32	%l0,	%g1,	%o7
	brgz,a	%o5,	loop_2434
loop_2433:
	fnand	%f16,	%f20,	%f10
	bvs,a,pt	%xcc,	loop_2435
	ldd	[%l7 + 0x30],	%f24
loop_2434:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x2
loop_2435:
	sir	0x1F48
	tge	%xcc,	0x7
	movge	%xcc,	%o1,	%l5
	bcc,pt	%xcc,	loop_2436
	sra	%i1,	0x01,	%i5
	smulcc	%l4,	%i3,	%o6
	ba,a	%xcc,	loop_2437
loop_2436:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x68],	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2437:
	fmovsgu	%xcc,	%f22,	%f2
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	fnor	%f8,	%f16,	%f16
	tcs	%xcc,	0x6
	sub	%o3,	%l3,	%l6
	bvs,a	loop_2438
	fnor	%f28,	%f28,	%f20
	alignaddr	%l1,	%i7,	%g2
	and	%g5,	0x181C,	%g6
loop_2438:
	edge32ln	%o4,	%i2,	%g4
	tsubcctv	%g7,	%o2,	%o0
	fcmpgt32	%f22,	%f14,	%g3
	flush	%l7 + 0x1C
	fandnot2s	%f30,	%f19,	%f16
	fbg,a	%fcc2,	loop_2439
	andcc	%i4,	0x0024,	%l0
	fbul	%fcc2,	loop_2440
	tcc	%xcc,	0x5
loop_2439:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x48] %asi,	%i6
loop_2440:
	movgu	%icc,	%o7,	%o5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7E] %asi,	%o1
	array16	%g1,	%l5,	%i1
	be,pn	%icc,	loop_2441
	addccc	%l4,	0x0FEE,	%i3
	swap	[%l7 + 0x28],	%i5
	andn	%o6,	%l2,	%o3
loop_2441:
	smul	%i0,	0x1AD5,	%l3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x0c,	%f0
	mulx	%l1,	0x08AE,	%l6
	movcc	%xcc,	%i7,	%g5
	fcmpgt16	%f14,	%f24,	%g6
	movvs	%xcc,	%o4,	%g2
	fbne	%fcc2,	loop_2442
	tsubcctv	%g4,	0x0D54,	%i2
	tcs	%xcc,	0x0
	tle	%icc,	0x4
loop_2442:
	sll	%o2,	0x03,	%g7
	fmuld8ulx16	%f25,	%f23,	%f2
	xor	%o0,	0x14E0,	%i4
	fnot2	%f12,	%f14
	fmovdle	%xcc,	%f23,	%f27
	fbug	%fcc1,	loop_2443
	movl	%icc,	%l0,	%i6
	orcc	%o7,	%o5,	%o1
	taddcc	%g1,	%l5,	%i1
loop_2443:
	bleu,a,pn	%xcc,	loop_2444
	st	%f1,	[%l7 + 0x34]
	ldd	[%l7 + 0x70],	%l4
	orncc	%i3,	%i5,	%g3
loop_2444:
	fmovdn	%icc,	%f23,	%f23
	sra	%l2,	0x17,	%o3
	udivcc	%o6,	0x1F55,	%l3
	fpsub32	%f26,	%f20,	%f22
	fornot2	%f26,	%f30,	%f22
	fblg,a	%fcc3,	loop_2445
	bge,a	%xcc,	loop_2446
	alignaddr	%l1,	%l6,	%i7
	fnot2	%f8,	%f20
loop_2445:
	membar	0x2C
loop_2446:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%g5
	edge16l	%i0,	%g6,	%o4
	nop
	setx	0x37D6DA869FBA73D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f6
	edge16ln	%g4,	%g2,	%o2
	tvs	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i2,	%o0,	%i4
	umulcc	%l0,	0x1563,	%i6
	movg	%xcc,	%g7,	%o5
	bvc,a,pn	%icc,	loop_2447
	udiv	%o7,	0x1FF7,	%o1
	fbule,a	%fcc3,	loop_2448
	fmovse	%icc,	%f16,	%f8
loop_2447:
	be,a,pn	%xcc,	loop_2449
	nop
	set	0x60, %g4
	lduh	[%l7 + %g4],	%g1
loop_2448:
	movge	%icc,	%i1,	%l4
	fbul,a	%fcc0,	loop_2450
loop_2449:
	movle	%icc,	%l5,	%i5
	mulx	%i3,	0x15E9,	%l2
	or	%g3,	0x1778,	%o3
loop_2450:
	tn	%icc,	0x0
	bneg	loop_2451
	srl	%l3,	%l1,	%o6
	orncc	%i7,	%l6,	%g5
	ldx	[%l7 + 0x60],	%i0
loop_2451:
	and	%g6,	0x02C1,	%o4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%g2
	tneg	%xcc,	0x1
	movne	%icc,	%o2,	%g4
	tsubcc	%i2,	%o0,	%l0
	movrne	%i4,	0x141,	%g7
	stbar
	smulcc	%i6,	%o7,	%o1
	tvs	%icc,	0x7
	xnorcc	%g1,	%i1,	%l4
	popc	%l5,	%o5
	fmovdvs	%icc,	%f5,	%f26
	nop
	setx loop_2452, %l0, %l1
	jmpl %l1, %i3
	fmuld8sux16	%f8,	%f10,	%f10
	brnz	%i5,	loop_2453
	bvs,a	%xcc,	loop_2454
loop_2452:
	fmovdg	%xcc,	%f17,	%f4
	tcs	%icc,	0x5
loop_2453:
	nop
	setx loop_2455, %l0, %l1
	jmpl %l1, %l2
loop_2454:
	fmovdvs	%icc,	%f14,	%f23
	tg	%xcc,	0x4
	bvs	loop_2456
loop_2455:
	stb	%g3,	[%l7 + 0x69]
	fmovdn	%icc,	%f30,	%f15
	bcc	%xcc,	loop_2457
loop_2456:
	edge16	%o3,	%l1,	%l3
	umul	%o6,	%i7,	%g5
	fbo,a	%fcc0,	loop_2458
loop_2457:
	fxnor	%f24,	%f22,	%f14
	fmovsn	%xcc,	%f3,	%f28
	fmovsneg	%xcc,	%f3,	%f9
loop_2458:
	fbl	%fcc0,	loop_2459
	orncc	%i0,	%g6,	%l6
	bleu,pn	%icc,	loop_2460
	ldx	[%l7 + 0x28],	%o4
loop_2459:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f11,	[%l7 + 0x1C] %asi
loop_2460:
	tgu	%xcc,	0x1
	brz,a	%o2,	loop_2461
	tg	%xcc,	0x5
	sllx	%g2,	0x10,	%g4
	sllx	%i2,	%o0,	%l0
loop_2461:
	nop
	wr	%g0,	0x11,	%asi
	stba	%g7,	[%l7 + 0x40] %asi
	xnor	%i6,	%o7,	%i4
	fmovrsne	%g1,	%f15,	%f3
	edge16	%o1,	%i1,	%l5
	movge	%xcc,	%l4,	%o5
	std	%f6,	[%l7 + 0x58]
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x68] %asi
	nop
	setx	0xD07BA9C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	wr	%g0,	0x80,	%asi
	stba	%i5,	[%l7 + 0x5B] %asi
	movrgez	%i3,	%l2,	%o3
	pdist	%f6,	%f4,	%f30
	fbge,a	%fcc1,	loop_2462
	fmovrsne	%g3,	%f4,	%f2
	taddcctv	%l1,	0x0CF9,	%l3
	ba,a	%icc,	loop_2463
loop_2462:
	subccc	%o6,	0x0E03,	%i7
	membar	0x59
	edge8n	%g5,	%i0,	%g6
loop_2463:
	movrgz	%o4,	%l6,	%g2
	movcs	%icc,	%g4,	%i2
	subc	%o2,	%l0,	%g7
	movrgz	%i6,	0x162,	%o0
	edge32ln	%i4,	%o7,	%g1
	sra	%i1,	%o1,	%l5
	wr	%g0,	0x80,	%asi
	stba	%o5,	[%l7 + 0x27] %asi
	sir	0x0830
	fbul,a	%fcc2,	loop_2464
	movre	%l4,	0x266,	%i3
	movle	%xcc,	%l2,	%i5
	fmovse	%icc,	%f9,	%f13
loop_2464:
	fbge,a	%fcc2,	loop_2465
	tvc	%icc,	0x4
	movl	%xcc,	%o3,	%g3
	fbl	%fcc1,	loop_2466
loop_2465:
	fmuld8ulx16	%f8,	%f11,	%f12
	sra	%l1,	0x09,	%l3
	mova	%xcc,	%o6,	%i7
loop_2466:
	movpos	%icc,	%g5,	%g6
	sra	%i0,	0x0F,	%l6
	andn	%g2,	0x1FB6,	%g4
	ldsw	[%l7 + 0x6C],	%i2
	nop
	setx	0x3A479CB8ACA91BAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x341B147F1B283244,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f16,	%f24
	edge16	%o4,	%l0,	%g7
	bcs,pn	%icc,	loop_2467
	xorcc	%o2,	0x1578,	%i6
	fmovrdlez	%i4,	%f30,	%f26
	addc	%o7,	%g1,	%o0
loop_2467:
	tg	%xcc,	0x6
	tvc	%icc,	0x0
	fbl	%fcc2,	loop_2468
	xor	%o1,	0x16E2,	%l5
	movre	%i1,	0x3A3,	%o5
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f20
loop_2468:
	fornot1	%f6,	%f18,	%f28
	tcs	%icc,	0x4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i3
	bn,pn	%xcc,	loop_2469
	st	%f22,	[%l7 + 0x34]
	nop
	setx	loop_2470,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdpos	%icc,	%f30,	%f8
loop_2469:
	tge	%icc,	0x3
	movrgz	%l2,	0x3ED,	%l4
loop_2470:
	sll	%i5,	0x0E,	%o3
	and	%l1,	%l3,	%g3
	movrlz	%o6,	%g5,	%i7
	taddcctv	%i0,	0x16F7,	%l6
	fmovrsgez	%g2,	%f2,	%f26
	mulx	%g6,	0x1189,	%i2
	umul	%g4,	%o4,	%g7
	fpsub32s	%f11,	%f8,	%f31
	membar	0x48
	andn	%l0,	0x0FDE,	%i6
	edge32l	%i4,	%o2,	%o7
	sdivx	%o0,	0x1E3D,	%g1
	fmovsle	%xcc,	%f5,	%f20
	fbn,a	%fcc1,	loop_2471
	sir	0x0498
	fmovdgu	%icc,	%f28,	%f29
	xnorcc	%o1,	0x02CE,	%l5
loop_2471:
	smul	%i1,	0x114C,	%o5
	bvs	%icc,	loop_2472
	sdivcc	%l2,	0x04FF,	%l4
	subcc	%i5,	%o3,	%l1
	sdivcc	%l3,	0x1347,	%i3
loop_2472:
	andncc	%g3,	%g5,	%o6
	move	%icc,	%i7,	%l6
	sdiv	%g2,	0x15C2,	%i0
	sir	0x1B49
	nop
	setx	0x643D5CB08E3141A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6796B4FC344E8410,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f22,	%f22
	umulcc	%i2,	0x1EFE,	%g4
	srl	%o4,	%g6,	%g7
	tneg	%xcc,	0x6
	membar	0x3C
	smulcc	%l0,	%i4,	%i6
	sub	%o2,	0x071D,	%o0
	bg	loop_2473
	udivx	%g1,	0x1D52,	%o1
	bgu,a	loop_2474
	edge8ln	%o7,	%l5,	%o5
loop_2473:
	udivx	%l2,	0x1753,	%l4
	bvs,pt	%xcc,	loop_2475
loop_2474:
	alignaddr	%i5,	%o3,	%l1
	udiv	%l3,	0x005A,	%i3
	xorcc	%g3,	0x0EFC,	%i1
loop_2475:
	andcc	%o6,	0x104C,	%g5
	movge	%xcc,	%i7,	%g2
	stw	%l6,	[%l7 + 0x3C]
	fmovrde	%i0,	%f26,	%f2
	call	loop_2476
	sdivx	%g4,	0x0EA8,	%i2
	be,pn	%icc,	loop_2477
	bgu	loop_2478
loop_2476:
	fblg	%fcc2,	loop_2479
	sll	%o4,	%g7,	%g6
loop_2477:
	edge16ln	%i4,	%i6,	%o2
loop_2478:
	tn	%xcc,	0x2
loop_2479:
	bg,pt	%xcc,	loop_2480
	udivx	%o0,	0x16C5,	%l0
	fbug	%fcc1,	loop_2481
	move	%xcc,	%o1,	%o7
loop_2480:
	tpos	%icc,	0x0
	ldstub	[%l7 + 0x41],	%l5
loop_2481:
	fandnot2s	%f10,	%f13,	%f13
	andncc	%o5,	%l2,	%g1
	fbl	%fcc0,	loop_2482
	nop
	setx	0x557767FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x8D2AFB34,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f25,	%f3
	fmovrdgz	%i5,	%f14,	%f0
	movpos	%xcc,	%l4,	%l1
loop_2482:
	nop
	setx	0xBF6C87191C61478E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xF6978B233468878A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f22,	%f6
	edge32ln	%l3,	%o3,	%i3
	orncc	%g3,	%i1,	%g5
	xnor	%i7,	0x0846,	%g2
	movrne	%l6,	%i0,	%o6
	subccc	%i2,	0x1235,	%o4
	nop
	fitod	%f31,	%f8
	fcmpne16	%f0,	%f24,	%g7
	movrlz	%g6,	%g4,	%i6
	srlx	%i4,	0x0A,	%o2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	add	%o0,	%o1,	%l0
	andncc	%l5,	%o7,	%l2
	swap	[%l7 + 0x78],	%g1
	subc	%i5,	%o5,	%l4
	xnorcc	%l1,	0x1335,	%l3
	edge8l	%i3,	%g3,	%o3
	umul	%g5,	%i7,	%i1
	fmul8x16au	%f8,	%f9,	%f8
	nop
	fitos	%f2,	%f8
	fstox	%f8,	%f2
	sllx	%g2,	0x08,	%l6
	movcs	%icc,	%o6,	%i2
	brgz,a	%i0,	loop_2483
	ldd	[%l7 + 0x78],	%f26
	fbul	%fcc1,	loop_2484
	fnot1s	%f23,	%f4
loop_2483:
	membar	0x3E
	movg	%xcc,	%o4,	%g6
loop_2484:
	fmovspos	%xcc,	%f24,	%f24
	add	%g7,	%i6,	%i4
	edge16n	%o2,	%g4,	%o1
	fbul	%fcc3,	loop_2485
	call	loop_2486
	nop
	setx	0x7D5EB7217B828791,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f0
	fpack32	%f16,	%f22,	%f14
loop_2485:
	edge32l	%o0,	%l5,	%o7
loop_2486:
	tgu	%xcc,	0x3
	array8	%l2,	%l0,	%g1
	edge32ln	%o5,	%i5,	%l4
	tcs	%icc,	0x3
	edge32	%l1,	%i3,	%g3
	edge16l	%o3,	%l3,	%g5
	fmovdle	%icc,	%f3,	%f30
	fandnot1	%f24,	%f18,	%f8
	ldsb	[%l7 + 0x22],	%i1
	edge8	%i7,	%g2,	%l6
	be,pt	%xcc,	loop_2487
	fmovsvc	%xcc,	%f17,	%f15
	subccc	%o6,	%i2,	%o4
	movne	%icc,	%g6,	%g7
loop_2487:
	and	%i6,	0x193F,	%i0
	movvs	%xcc,	%o2,	%g4
	tvs	%icc,	0x7
	movvc	%icc,	%i4,	%o0
	tg	%icc,	0x7
	movpos	%icc,	%o1,	%o7
	andn	%l5,	%l2,	%l0
	bcc,pn	%xcc,	loop_2488
	brgz	%o5,	loop_2489
	fmovdg	%xcc,	%f22,	%f25
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x18,	 0x3
loop_2488:
	addcc	%i5,	%l4,	%i3
loop_2489:
	fmovrslz	%l1,	%f12,	%f6
	fmovdvs	%xcc,	%f14,	%f11
	ta	%icc,	0x6
	fmuld8ulx16	%f5,	%f5,	%f14
	fxor	%f2,	%f16,	%f22
	fbue	%fcc3,	loop_2490
	alignaddr	%o3,	%g3,	%g5
	sir	0x0C7D
	edge16l	%i1,	%l3,	%i7
loop_2490:
	subccc	%g2,	%l6,	%i2
	srlx	%o4,	%o6,	%g7
	sdivx	%g6,	0x0484,	%i0
	bcc,a	%icc,	loop_2491
	nop
	setx	0x2957AA2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f25
	edge32n	%i6,	%o2,	%i4
	bgu,a,pt	%icc,	loop_2492
loop_2491:
	andcc	%g4,	0x149E,	%o1
	sdiv	%o0,	0x14AC,	%o7
	fmovsl	%xcc,	%f12,	%f28
loop_2492:
	srax	%l2,	%l5,	%o5
	set	0x74, %g1
	lda	[%l7 + %g1] 0x80,	%f6
	fcmpeq32	%f12,	%f24,	%g1
	orncc	%i5,	0x1CA4,	%l0
	membar	0x19
	ble,pt	%icc,	loop_2493
	movrgz	%i3,	0x1E5,	%l1
	movcs	%icc,	%o3,	%l4
	movcs	%xcc,	%g5,	%i1
loop_2493:
	sra	%l3,	0x16,	%g3
	mulscc	%i7,	%l6,	%g2
	sethi	0x03B4,	%i2
	edge16ln	%o4,	%g7,	%g6
	nop
	fitod	%f6,	%f22
	fdtox	%f22,	%f30
	xnor	%i0,	%i6,	%o6
	fmovrdne	%o2,	%f8,	%f26
	movpos	%icc,	%g4,	%o1
	udivcc	%o0,	0x08D4,	%i4
	movrne	%o7,	0x111,	%l2
	fmul8sux16	%f30,	%f10,	%f8
	fmovsa	%xcc,	%f15,	%f12
	tneg	%icc,	0x5
	fxnor	%f18,	%f0,	%f8
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x60] %asi,	%f18
	tg	%icc,	0x1
	nop
	setx loop_2494, %l0, %l1
	jmpl %l1, %o5
	xor	%g1,	0x1ADC,	%l5
	fornot2s	%f17,	%f18,	%f13
	fones	%f25
loop_2494:
	fornot1	%f0,	%f18,	%f22
	orcc	%l0,	%i5,	%i3
	andcc	%o3,	0x01E9,	%l4
	brgez,a	%g5,	loop_2495
	tg	%xcc,	0x0
	mova	%icc,	%i1,	%l3
	ta	%xcc,	0x0
loop_2495:
	alignaddrl	%g3,	%i7,	%l6
	sir	0x0271
	fmovdn	%xcc,	%f2,	%f18
	sll	%l1,	%i2,	%o4
	movrgz	%g2,	%g7,	%g6
	movcs	%xcc,	%i6,	%i0
	edge8ln	%o2,	%g4,	%o1
	fbne,a	%fcc1,	loop_2496
	nop
	setx	loop_2497,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%o0,	%o6,	%i4
	move	%xcc,	%o7,	%o5
loop_2496:
	edge16n	%g1,	%l2,	%l5
loop_2497:
	subcc	%l0,	0x0B6A,	%i5
	xnor	%o3,	0x0D74,	%i3
	fnegd	%f14,	%f2
	movrlz	%l4,	%i1,	%l3
	nop
	set	0x36, %g5
	sth	%g3,	[%l7 + %g5]
	be	loop_2498
	fpack16	%f6,	%f26
	ldd	[%l7 + 0x08],	%g4
	bleu	%xcc,	loop_2499
loop_2498:
	sllx	%i7,	%l6,	%l1
	movre	%i2,	%g2,	%g7
	swap	[%l7 + 0x2C],	%o4
loop_2499:
	fmovdpos	%icc,	%f14,	%f4
	bvc	loop_2500
	fandnot1s	%f3,	%f31,	%f26
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
loop_2500:
	nop
	fitos	%f11,	%f30
	fstoi	%f30,	%f4
	tne	%icc,	0x1
	fpsub16s	%f15,	%f3,	%f31
	and	%i0,	0x1F69,	%g6
	addc	%o2,	%o1,	%o0
	fmovsne	%xcc,	%f29,	%f17
	edge8	%g4,	%o6,	%o7
	be,a	loop_2501
	sir	0x11F4
	fpsub32s	%f7,	%f6,	%f8
	movg	%icc,	%i4,	%o5
loop_2501:
	pdist	%f14,	%f12,	%f14
	bleu,a	loop_2502
	udiv	%g1,	0x0722,	%l5
	movvs	%xcc,	%l0,	%l2
	sllx	%i5,	0x08,	%i3
loop_2502:
	sllx	%l4,	0x00,	%o3
	tvc	%xcc,	0x5
	smul	%l3,	0x1B65,	%i1
	nop
	fitos	%f3,	%f11
	fstox	%f11,	%f2
	fxtos	%f2,	%f5
	orncc	%g3,	%i7,	%g5
	fbue	%fcc3,	loop_2503
	tcc	%icc,	0x0
	fornot1s	%f22,	%f6,	%f26
	movl	%icc,	%l6,	%i2
loop_2503:
	fmovd	%f26,	%f0
	orn	%l1,	%g7,	%o4
	fbuge	%fcc3,	loop_2504
	taddcctv	%i6,	%g2,	%i0
	st	%f4,	[%l7 + 0x50]
	movrlz	%g6,	%o1,	%o2
loop_2504:
	sethi	0x07C5,	%o0
	movne	%icc,	%g4,	%o6
	fxors	%f26,	%f18,	%f30
	addc	%i4,	0x1E62,	%o5
	brlz	%g1,	loop_2505
	fbne	%fcc3,	loop_2506
	subccc	%o7,	0x1A13,	%l0
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
	movrlez	%l5,	0x2E6,	%i5
loop_2506:
	or	%l2,	%i3,	%o3
	fba,a	%fcc0,	loop_2508
loop_2507:
	andcc	%l4,	%i1,	%l3
	movl	%xcc,	%i7,	%g5
	ld	[%l7 + 0x7C],	%f5
loop_2508:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x60] %asi,	%f17
	faligndata	%f6,	%f20,	%f16
	bg	loop_2509
	nop
	setx	loop_2510,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x6
	fmovsg	%xcc,	%f10,	%f29
loop_2509:
	fornot1	%f20,	%f4,	%f26
loop_2510:
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f21
	fmovde	%icc,	%f6,	%f11
	fsrc2s	%f1,	%f1
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x26] %asi,	%g3
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f8
	bleu,a,pt	%xcc,	loop_2511
	brgez,a	%l6,	loop_2512
	xnorcc	%i2,	0x1839,	%g7
	umul	%o4,	%l1,	%i6
loop_2511:
	edge8ln	%g2,	%g6,	%i0
loop_2512:
	andncc	%o1,	%o0,	%g4
	wr	%g0,	0x80,	%asi
	stwa	%o6,	[%l7 + 0x78] %asi
	fxnors	%f12,	%f29,	%f2
	fmovsle	%icc,	%f13,	%f27
	lduw	[%l7 + 0x5C],	%i4
	xor	%o5,	%g1,	%o2
	te	%icc,	0x5
	fmovrsne	%l0,	%f24,	%f29
	movg	%icc,	%l5,	%i5
	movrlez	%o7,	0x025,	%i3
	edge16n	%l2,	%l4,	%o3
	ble,a	loop_2513
	fornot2s	%f30,	%f28,	%f23
	tneg	%icc,	0x3
	movrgz	%l3,	0x3B3,	%i7
loop_2513:
	movrgz	%i1,	%g5,	%l6
	call	loop_2514
	fmovsvs	%xcc,	%f10,	%f22
	sub	%i2,	%g7,	%g3
	edge16	%o4,	%l1,	%i6
loop_2514:
	bg,a,pt	%icc,	loop_2515
	st	%f25,	[%l7 + 0x18]
	set	0x18, %i5
	lda	[%l7 + %i5] 0x18,	%f10
loop_2515:
	nop
	setx	0x3F146E6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x85EAD95E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f1,	%f3
	fbl	%fcc3,	loop_2516
	fbn,a	%fcc3,	loop_2517
	fmovrdlz	%g2,	%f14,	%f28
	fpadd16	%f4,	%f8,	%f14
loop_2516:
	brgez,a	%i0,	loop_2518
loop_2517:
	ldsh	[%l7 + 0x1C],	%o1
	fbug,a	%fcc3,	loop_2519
	tle	%xcc,	0x2
loop_2518:
	bpos,a,pn	%xcc,	loop_2520
	srl	%g6,	%g4,	%o0
loop_2519:
	fsrc2s	%f30,	%f5
	subcc	%o6,	0x119D,	%i4
loop_2520:
	movrlez	%g1,	0x198,	%o2
	tne	%xcc,	0x4
	tne	%icc,	0x4
	array32	%l0,	%l5,	%i5
	lduh	[%l7 + 0x2C],	%o7
	movle	%xcc,	%o5,	%l2
	andcc	%l4,	%o3,	%i3
	udiv	%l3,	0x0CA0,	%i7
	move	%icc,	%g5,	%l6
	set	0x38, %l0
	ldstuba	[%l7 + %l0] 0x11,	%i2
	sll	%i1,	0x16,	%g3
	brgez,a	%o4,	loop_2521
	tl	%xcc,	0x4
	fpack32	%f10,	%f22,	%f4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x19,	%f16
loop_2521:
	fbul,a	%fcc3,	loop_2522
	tsubcc	%l1,	%i6,	%g7
	udivcc	%g2,	0x1A0A,	%i0
	edge16	%g6,	%g4,	%o0
loop_2522:
	tge	%xcc,	0x0
	tcs	%icc,	0x0
	srl	%o6,	%i4,	%o1
	ta	%icc,	0x7
	lduw	[%l7 + 0x18],	%g1
	tvc	%xcc,	0x2
	alignaddr	%o2,	%l5,	%l0
	ldd	[%l7 + 0x18],	%f14
	bleu,a	loop_2523
	fmovsleu	%xcc,	%f20,	%f14
	fbul	%fcc0,	loop_2524
	alignaddr	%i5,	%o7,	%l2
loop_2523:
	movn	%xcc,	%l4,	%o5
	lduw	[%l7 + 0x6C],	%o3
loop_2524:
	tvc	%xcc,	0x3
	tvs	%icc,	0x5
	popc	%l3,	%i3
	ld	[%l7 + 0x18],	%f9
	fmovdvs	%xcc,	%f12,	%f5
	popc	0x0F1C,	%g5
	movl	%xcc,	%i7,	%l6
	set	0x20, %l2
	lduwa	[%l7 + %l2] 0x81,	%i2
	edge32n	%i1,	%g3,	%l1
	andncc	%o4,	%i6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%i0
	srl	%g6,	0x13,	%g4
	bcc,a	loop_2525
	sethi	0x1AE9,	%o6
	srax	%o0,	%i4,	%g1
	fmovrslz	%o1,	%f12,	%f19
loop_2525:
	edge16	%l5,	%l0,	%o2
	sllx	%i5,	0x17,	%l2
	tne	%icc,	0x7
	fxnor	%f28,	%f22,	%f0
	movrne	%o7,	%o5,	%o3
	sll	%l4,	0x01,	%l3
	fbg,a	%fcc1,	loop_2526
	udivx	%g5,	0x07AA,	%i7
	tn	%icc,	0x7
	sllx	%l6,	0x0A,	%i2
loop_2526:
	sdiv	%i1,	0x09D4,	%i3
	fbu,a	%fcc3,	loop_2527
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g3
loop_2527:
	xor	%o4,	0x05D0,	%i6
	tn	%icc,	0x6
	udivcc	%g7,	0x0A5F,	%l1
	smul	%g2,	0x1335,	%g6
	edge16l	%g4,	%i0,	%o0
	tvc	%icc,	0x6
	umul	%i4,	%o6,	%o1
	fmovdcc	%icc,	%f20,	%f7
	fnegs	%f28,	%f31
	brz,a	%l5,	loop_2528
	ldsb	[%l7 + 0x7F],	%l0
	xnor	%g1,	%i5,	%l2
	subccc	%o2,	%o5,	%o3
loop_2528:
	edge16n	%l4,	%l3,	%g5
	fmovda	%icc,	%f12,	%f19
	srax	%i7,	0x17,	%o7
	wr	%g0,	0x80,	%asi
	stha	%l6,	[%l7 + 0x3C] %asi
	tvs	%xcc,	0x5
	tcs	%icc,	0x7
	sdivcc	%i2,	0x09F4,	%i1
	fmovrslez	%i3,	%f9,	%f21
	movpos	%icc,	%o4,	%g3
	edge16l	%i6,	%g7,	%l1
	sdiv	%g2,	0x1184,	%g6
	sdivcc	%g4,	0x009E,	%i0
	popc	%i4,	%o0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	movg	%icc,	%l5,	%l0
	movrgez	%g1,	0x1E2,	%i5
	tgu	%icc,	0x4
	fmovrdgz	%o1,	%f10,	%f4
	fmovdvc	%icc,	%f2,	%f8
	fsrc2	%f22,	%f16
	and	%l2,	%o2,	%o3
	nop
	setx	0x8E55FE1A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f10
	umul	%l4,	0x0B11,	%o5
	tvc	%icc,	0x6
	movl	%xcc,	%g5,	%i7
	umulcc	%l3,	0x0376,	%l6
	bpos,pn	%icc,	loop_2529
	ldd	[%l7 + 0x10],	%f24
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x80,	%i2
loop_2529:
	fpmerge	%f13,	%f23,	%f18
	tle	%icc,	0x4
	edge16n	%i1,	%o7,	%i3
	xnorcc	%o4,	%i6,	%g3
	movvs	%icc,	%l1,	%g2
	nop
	setx	0x797D0728,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f21
	xor	%g7,	%g6,	%i0
	fpadd32	%f6,	%f30,	%f12
	or	%g4,	0x1850,	%i4
	andn	%o6,	%l5,	%o0
	fmovscs	%icc,	%f2,	%f19
	nop
	set	0x40, %l1
	lduh	[%l7 + %l1],	%g1
	nop
	fitod	%f8,	%f6
	prefetch	[%l7 + 0x7C],	 0x2
	tvs	%xcc,	0x3
	tsubcc	%l0,	0x0A15,	%o1
	movrgz	%i5,	0x213,	%l2
	umul	%o3,	%o2,	%l4
	fornot2s	%f18,	%f13,	%f19
	movrlz	%o5,	0x1F9,	%i7
	fbg,a	%fcc2,	loop_2530
	movle	%xcc,	%l3,	%g5
	set	0x6D, %i2
	stba	%l6,	[%l7 + %i2] 0x88
loop_2530:
	fmovdpos	%xcc,	%f18,	%f0
	edge8l	%i2,	%i1,	%i3
	nop
	setx	0xA717A31D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x90505124,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f1,	%f9
	nop
	setx	0xA0DEDDDFB73D4618,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xEE94654F1E98EC1D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f26,	%f8
	movrlz	%o4,	%i6,	%g3
	bne	loop_2531
	bleu,a,pt	%xcc,	loop_2532
	bn	loop_2533
	orcc	%o7,	%l1,	%g7
loop_2531:
	fmovdgu	%icc,	%f6,	%f28
loop_2532:
	fxor	%f2,	%f16,	%f12
loop_2533:
	movrlz	%g2,	0x3CF,	%i0
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x19,	%g4
	fnors	%f5,	%f12,	%f9
	stb	%i4,	[%l7 + 0x23]
	bcs,a	%icc,	loop_2534
	fpack32	%f12,	%f30,	%f10
	fmovsgu	%icc,	%f1,	%f2
	bg	%icc,	loop_2535
loop_2534:
	add	%g6,	%o6,	%o0
	nop
	setx	0x7F900D51532DF239,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8AF33B172F18DF7E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f14,	%f30
	call	loop_2536
loop_2535:
	bleu,pt	%icc,	loop_2537
	smul	%g1,	%l5,	%l0
	sra	%o1,	0x10,	%l2
loop_2536:
	fblg	%fcc1,	loop_2538
loop_2537:
	membar	0x5E
	movrlz	%o3,	0x312,	%i5
	fmul8ulx16	%f18,	%f30,	%f2
loop_2538:
	fmovsne	%icc,	%f4,	%f24
	udivcc	%l4,	0x1CA3,	%o5
	tleu	%icc,	0x6
	addcc	%o2,	%l3,	%i7
	fbuge,a	%fcc0,	loop_2539
	brlz,a	%l6,	loop_2540
	nop
	setx	0x002BC4D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x22E071DD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f1,	%f1
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x30] %asi
loop_2539:
	tn	%icc,	0x7
loop_2540:
	movne	%icc,	%i2,	%i1
	sethi	0x0A50,	%g5
	mulx	%o4,	%i6,	%i3
	taddcc	%g3,	0x1D99,	%l1
	stb	%o7,	[%l7 + 0x26]
	mulscc	%g2,	0x100B,	%g7
	xnor	%g4,	0x13E9,	%i4
	bn,a	%icc,	loop_2541
	movneg	%icc,	%g6,	%o6
	brlez,a	%i0,	loop_2542
	fmovsg	%icc,	%f19,	%f19
loop_2541:
	fandnot1	%f10,	%f2,	%f22
	fmovdne	%icc,	%f18,	%f15
loop_2542:
	fmovdleu	%xcc,	%f6,	%f7
	fxnor	%f28,	%f0,	%f10
	edge16ln	%g1,	%o0,	%l5
	movcs	%xcc,	%o1,	%l0
	fors	%f30,	%f6,	%f10
	fxnors	%f11,	%f26,	%f13
	tg	%xcc,	0x5
	movpos	%xcc,	%l2,	%o3
	sethi	0x00BA,	%i5
	tn	%xcc,	0x0
	fone	%f28
	bcc,a	%icc,	loop_2543
	bcs,a	loop_2544
	fmovscs	%xcc,	%f7,	%f23
	stw	%o5,	[%l7 + 0x18]
loop_2543:
	te	%xcc,	0x4
loop_2544:
	fbge	%fcc1,	loop_2545
	tsubcctv	%o2,	0x05B8,	%l4
	sdivcc	%i7,	0x18CF,	%l3
	brlez,a	%i2,	loop_2546
loop_2545:
	sdivx	%i1,	0x1D02,	%g5
	edge16l	%l6,	%i6,	%i3
	sdiv	%o4,	0x14FC,	%l1
loop_2546:
	edge8	%g3,	%o7,	%g2
	fbne,a	%fcc2,	loop_2547
	fcmple32	%f6,	%f30,	%g4
	ta	%xcc,	0x4
	fandnot2s	%f4,	%f18,	%f22
loop_2547:
	fmovrdlz	%i4,	%f30,	%f16
	movcs	%icc,	%g6,	%o6
	set	0x4C, %o4
	swapa	[%l7 + %o4] 0x18,	%g7
	fbule	%fcc0,	loop_2548
	fnor	%f2,	%f14,	%f12
	fbu,a	%fcc3,	loop_2549
	edge8n	%i0,	%o0,	%l5
loop_2548:
	fblg	%fcc0,	loop_2550
	swap	[%l7 + 0x24],	%o1
loop_2549:
	nop
	wr	%g0,	0x04,	%asi
	stha	%g1,	[%l7 + 0x38] %asi
loop_2550:
	fmovrslez	%l2,	%f8,	%f19
	movvs	%icc,	%l0,	%o3
	fpack32	%f18,	%f12,	%f12
	swap	[%l7 + 0x40],	%o5
	fzero	%f8
	bcc,a,pt	%icc,	loop_2551
	popc	0x09F2,	%i5
	fbn,a	%fcc1,	loop_2552
	fbue	%fcc2,	loop_2553
loop_2551:
	udiv	%o2,	0x189E,	%i7
	movvs	%icc,	%l3,	%l4
loop_2552:
	fmovsl	%xcc,	%f14,	%f14
loop_2553:
	mulscc	%i1,	%i2,	%g5
	movle	%xcc,	%l6,	%i3
	ldsh	[%l7 + 0x22],	%i6
	fmovsneg	%xcc,	%f29,	%f23
	array16	%l1,	%g3,	%o4
	popc	%o7,	%g4
	prefetch	[%l7 + 0x20],	 0x0
	add	%g2,	0x02ED,	%g6
	add	%i4,	0x0CBA,	%o6
	mova	%xcc,	%g7,	%o0
	movne	%icc,	%i0,	%o1
	movrne	%l5,	0x39E,	%g1
	fandnot1	%f24,	%f6,	%f28
	fmovdgu	%xcc,	%f30,	%f0
	udivx	%l2,	0x0650,	%l0
	ldstub	[%l7 + 0x5B],	%o5
	edge8ln	%o3,	%i5,	%o2
	movg	%icc,	%l3,	%i7
	stbar
	edge32ln	%l4,	%i2,	%i1
	fxors	%f5,	%f18,	%f23
	fnot2s	%f1,	%f5
	orcc	%l6,	%i3,	%g5
	smulcc	%l1,	%g3,	%o4
	sdiv	%o7,	0x15E5,	%i6
	movrlz	%g2,	%g6,	%g4
	fblg,a	%fcc2,	loop_2554
	movre	%o6,	%g7,	%o0
	nop
	fitos	%f6,	%f2
	fstoi	%f2,	%f3
	tvc	%xcc,	0x5
loop_2554:
	smulcc	%i0,	0x0FD1,	%i4
	array8	%l5,	%o1,	%l2
	fexpand	%f6,	%f16
	sethi	0x1DE8,	%l0
	tpos	%xcc,	0x2
	edge16n	%g1,	%o5,	%i5
	tcs	%icc,	0x5
	tvc	%xcc,	0x4
	fexpand	%f8,	%f18
	fmovda	%icc,	%f5,	%f25
	tle	%xcc,	0x7
	movne	%xcc,	%o3,	%o2
	fandnot2	%f12,	%f22,	%f16
	movvs	%xcc,	%i7,	%l4
	taddcc	%i2,	0x1BE4,	%l3
	edge8l	%l6,	%i3,	%i1
	movrgez	%g5,	%l1,	%o4
	xorcc	%g3,	%i6,	%o7
	ldub	[%l7 + 0x59],	%g2
	subc	%g6,	0x0CEB,	%g4
	movleu	%icc,	%o6,	%g7
	fnands	%f18,	%f30,	%f16
	ba,pn	%icc,	loop_2555
	mova	%icc,	%i0,	%i4
	fmovsleu	%xcc,	%f11,	%f31
	movrlez	%o0,	0x1B6,	%o1
loop_2555:
	orn	%l2,	0x1A61,	%l5
	sllx	%g1,	0x05,	%l0
	udivx	%i5,	0x0E8D,	%o5
	udivx	%o2,	0x081D,	%i7
	sllx	%o3,	0x0B,	%i2
	fbn	%fcc3,	loop_2556
	tcc	%xcc,	0x7
	fmovd	%f22,	%f20
	brnz	%l4,	loop_2557
loop_2556:
	movvc	%xcc,	%l6,	%i3
	membar	0x44
	bg,a	loop_2558
loop_2557:
	movge	%xcc,	%l3,	%g5
	fpsub32	%f16,	%f24,	%f30
	array16	%l1,	%o4,	%g3
loop_2558:
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f2
	fmovda	%xcc,	%f0,	%f12
	tsubcctv	%i6,	%o7,	%i1
	tl	%xcc,	0x4
	subc	%g2,	%g6,	%o6
	fandnot1	%f26,	%f4,	%f28
	tleu	%icc,	0x6
	set	0x16, %o7
	stba	%g7,	[%l7 + %o7] 0x15
	tsubcc	%i0,	0x1F70,	%i4
	lduh	[%l7 + 0x10],	%o0
	lduw	[%l7 + 0x30],	%o1
	membar	0x31
	tneg	%icc,	0x4
	lduw	[%l7 + 0x40],	%g4
	movl	%xcc,	%l2,	%g1
	movgu	%xcc,	%l5,	%i5
	std	%f16,	[%l7 + 0x78]
	movrlz	%o5,	%o2,	%i7
	udivcc	%o3,	0x03F6,	%i2
	smulcc	%l0,	0x1A33,	%l4
	sra	%l6,	0x11,	%i3
	addcc	%g5,	%l1,	%o4
	fmovdne	%xcc,	%f19,	%f0
	wr	%g0,	0x0c,	%asi
	stba	%l3,	[%l7 + 0x35] %asi
	tgu	%xcc,	0x7
	fmovsvc	%icc,	%f18,	%f28
	sll	%i6,	%g3,	%o7
	fbn	%fcc0,	loop_2559
	addccc	%g2,	%g6,	%o6
	umulcc	%g7,	0x0485,	%i1
	xnorcc	%i4,	%i0,	%o1
loop_2559:
	edge8ln	%g4,	%o0,	%l2
	fornot1	%f24,	%f16,	%f20
	brgez,a	%l5,	loop_2560
	te	%xcc,	0x0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
loop_2560:
	tg	%icc,	0x6
	movgu	%xcc,	%g1,	%o5
	tneg	%icc,	0x2
	tge	%icc,	0x5
	bcc,a	loop_2561
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_2562
	fbn	%fcc2,	loop_2563
loop_2561:
	edge32	%o2,	%i7,	%i5
	fbne	%fcc3,	loop_2564
loop_2562:
	fmuld8sux16	%f31,	%f30,	%f4
loop_2563:
	sdivx	%i2,	0x1ED4,	%l0
	stb	%l4,	[%l7 + 0x4D]
loop_2564:
	srlx	%l6,	%o3,	%i3
	srl	%g5,	0x06,	%o4
	fcmpeq16	%f8,	%f18,	%l3
	set	0x7D, %o1
	lduba	[%l7 + %o1] 0x0c,	%i6
	fmovrdne	%l1,	%f24,	%f30
	movre	%g3,	0x1FF,	%g2
	movn	%xcc,	%g6,	%o7
	fmovdn	%xcc,	%f20,	%f7
	movvc	%icc,	%o6,	%i1
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i4
	tpos	%xcc,	0x3
	fmovrslz	%g7,	%f2,	%f14
	sir	0x15C9
	movneg	%icc,	%o1,	%g4
	sdivx	%o0,	0x1676,	%i0
	bvc	%icc,	loop_2565
	srlx	%l5,	%l2,	%o5
	fpadd32	%f6,	%f4,	%f8
	andncc	%o2,	%g1,	%i5
loop_2565:
	edge16ln	%i7,	%l0,	%i2
	ldsb	[%l7 + 0x1B],	%l4
	swap	[%l7 + 0x0C],	%l6
	sra	%i3,	0x12,	%g5
	edge8ln	%o4,	%l3,	%i6
	andncc	%o3,	%g3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g6,	%l1
	call	loop_2566
	sethi	0x0EE2,	%o6
	fornot2	%f18,	%f24,	%f8
	movg	%xcc,	%o7,	%i1
loop_2566:
	sub	%i4,	0x08E4,	%g7
	fmovrdlz	%g4,	%f16,	%f4
	tvs	%xcc,	0x7
	movpos	%xcc,	%o1,	%i0
	orncc	%o0,	%l2,	%o5
	smulcc	%l5,	0x1DB0,	%g1
	set	0x0C, %l4
	ldsha	[%l7 + %l4] 0x10,	%o2
	tge	%xcc,	0x6
	fmul8sux16	%f10,	%f18,	%f28
	movne	%icc,	%i5,	%i7
	movvc	%xcc,	%i2,	%l0
	ldd	[%l7 + 0x18],	%f2
	movre	%l4,	%i3,	%l6
	fabsd	%f30,	%f8
	edge32n	%g5,	%o4,	%i6
	fba,a	%fcc3,	loop_2567
	array8	%l3,	%o3,	%g3
	fmovdleu	%icc,	%f3,	%f0
	edge32	%g6,	%g2,	%o6
loop_2567:
	nop
	setx	loop_2568,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srlx	%l1,	0x1D,	%o7
	bshuffle	%f2,	%f16,	%f26
	nop
	setx	0xE23BCABA0CE4BAF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5EE9F80E4A985D8A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f6,	%f4
loop_2568:
	fors	%f0,	%f30,	%f16
	tcs	%xcc,	0x4
	fbu	%fcc1,	loop_2569
	nop
	fitod	%f3,	%f2
	subcc	%i1,	0x1552,	%i4
	sethi	0x13BE,	%g7
loop_2569:
	edge32l	%o1,	%i0,	%g4
	movne	%xcc,	%o0,	%l2
	bn,a,pn	%icc,	loop_2570
	fmul8x16au	%f30,	%f9,	%f0
	edge16n	%l5,	%o5,	%g1
	srax	%o2,	0x0A,	%i5
loop_2570:
	fcmpne16	%f22,	%f16,	%i7
	for	%f30,	%f20,	%f18
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%l4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i3,	%l6
	or	%g5,	%o4,	%i2
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	orn	%o3,	0x16B7,	%l3
	edge32n	%g6,	%g3,	%g2
	fsrc2	%f10,	%f6
	fxors	%f11,	%f21,	%f24
	sethi	0x069D,	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o6,	%o7
	subc	%i1,	0x1145,	%g7
	tne	%xcc,	0x5
	brlz	%o1,	loop_2571
	ba,a,pn	%icc,	loop_2572
	edge16	%i0,	%g4,	%o0
	fnot1s	%f12,	%f14
loop_2571:
	movcc	%icc,	%l2,	%i4
loop_2572:
	addcc	%o5,	0x0773,	%g1
	orncc	%l5,	%i5,	%i7
	movcc	%xcc,	%o2,	%l4
	fmovde	%xcc,	%f0,	%f2
	or	%i3,	0x1C0F,	%l0
	sir	0x1DE2
	fbue,a	%fcc0,	loop_2573
	fbo	%fcc0,	loop_2574
	sdivcc	%l6,	0x1050,	%g5
	umul	%i2,	%o4,	%i6
loop_2573:
	movneg	%icc,	%l3,	%g6
loop_2574:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%o3
	bshuffle	%f18,	%f16,	%f22
	andcc	%g2,	%g3,	%o6
	andncc	%l1,	%o7,	%i1
	set	0x34, %i0
	swapa	[%l7 + %i0] 0x18,	%o1
	sdivcc	%i0,	0x0BA2,	%g7
	movneg	%xcc,	%g4,	%l2
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f16
	orcc	%o0,	0x0F80,	%o5
	andn	%i4,	%l5,	%i5
	tvc	%icc,	0x7
	tsubcc	%g1,	0x05FB,	%o2
	andcc	%i7,	0x0A9A,	%l4
	orncc	%l0,	%i3,	%l6
	udivx	%i2,	0x10A0,	%g5
	srax	%i6,	0x11,	%o4
	tl	%icc,	0x0
	ta	%icc,	0x3
	fbo,a	%fcc1,	loop_2575
	fbg,a	%fcc2,	loop_2576
	move	%xcc,	%l3,	%o3
	fandnot1s	%f14,	%f4,	%f5
loop_2575:
	ta	%xcc,	0x1
loop_2576:
	fmovrsgez	%g6,	%f21,	%f27
	addccc	%g3,	%g2,	%o6
	udivx	%l1,	0x0CD2,	%o7
	subccc	%o1,	0x1FA2,	%i1
	fnor	%f26,	%f18,	%f24
	sethi	0x00B0,	%g7
	fmovdn	%icc,	%f24,	%f25
	bl	%xcc,	loop_2577
	nop
	setx	0x11A1F38D4524A662,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xFC8FACD01EF3D649,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f28,	%f20
	nop
	setx	0x6050E712,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	tvs	%xcc,	0x2
loop_2577:
	orn	%i0,	0x0405,	%g4
	xor	%l2,	%o0,	%o5
	nop
	setx	0x812222C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f23
	popc	%i4,	%i5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f7
	tleu	%icc,	0x5
	fmovrdgz	%l5,	%f24,	%f12
	fpsub16	%f20,	%f26,	%f22
	mulx	%o2,	0x072E,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs	loop_2578
	taddcctv	%g1,	%l0,	%l4
	fmovsle	%icc,	%f0,	%f6
	fsrc1s	%f6,	%f16
loop_2578:
	taddcctv	%l6,	0x1E27,	%i3
	movg	%xcc,	%g5,	%i2
	tcc	%xcc,	0x1
	movneg	%xcc,	%o4,	%l3
	sub	%o3,	0x0732,	%g6
	edge16ln	%g3,	%g2,	%i6
	movl	%xcc,	%l1,	%o6
	movn	%icc,	%o1,	%i1
	fcmpgt16	%f6,	%f28,	%g7
	tpos	%xcc,	0x0
	tl	%icc,	0x1
	fmovdpos	%xcc,	%f21,	%f6
	sra	%i0,	%g4,	%o7
	orncc	%l2,	0x06B9,	%o5
	bcc,a,pn	%xcc,	loop_2579
	movvc	%icc,	%o0,	%i4
	fbul	%fcc1,	loop_2580
	fbuge,a	%fcc3,	loop_2581
loop_2579:
	fmovsne	%icc,	%f23,	%f25
	ble,a	loop_2582
loop_2580:
	movne	%xcc,	%i5,	%o2
loop_2581:
	orncc	%l5,	%i7,	%l0
	ldd	[%l7 + 0x20],	%l4
loop_2582:
	fmovdge	%xcc,	%f4,	%f6
	nop
	setx loop_2583, %l0, %l1
	jmpl %l1, %l6
	nop
	setx	0xB9FB19F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x25CE071C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f13,	%f29
	ld	[%l7 + 0x40],	%f26
	bpos	loop_2584
loop_2583:
	edge32	%i3,	%g5,	%i2
	std	%f28,	[%l7 + 0x08]
	std	%f26,	[%l7 + 0x50]
loop_2584:
	alignaddrl	%o4,	%l3,	%o3
	fmovdle	%xcc,	%f27,	%f26
	fbue	%fcc1,	loop_2585
	movg	%xcc,	%g1,	%g3
	ldstub	[%l7 + 0x67],	%g6
	fsrc2s	%f0,	%f27
loop_2585:
	tg	%icc,	0x7
	tneg	%xcc,	0x6
	orn	%g2,	0x0598,	%i6
	wr	%g0,	0x11,	%asi
	stxa	%o6,	[%l7 + 0x48] %asi
	addccc	%l1,	%o1,	%g7
	pdist	%f14,	%f2,	%f6
	array16	%i0,	%i1,	%g4
	fmovrde	%o7,	%f4,	%f12
	tcs	%icc,	0x1
	fmovde	%xcc,	%f21,	%f16
	bne	%xcc,	loop_2586
	udivx	%l2,	0x1821,	%o5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x3C] %asi,	%i4
loop_2586:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%o0
	bvc	%icc,	loop_2587
	movl	%icc,	%o2,	%l5
	fbul	%fcc1,	loop_2588
	array16	%i7,	%l0,	%i5
loop_2587:
	tsubcctv	%l6,	0x032C,	%l4
	tcs	%icc,	0x7
loop_2588:
	or	%g5,	0x097B,	%i2
	movn	%icc,	%i3,	%o4
	fpadd32s	%f12,	%f2,	%f7
	mulscc	%o3,	0x0EE4,	%g1
	andn	%l3,	%g3,	%g2
	tcc	%xcc,	0x1
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f26
	fxtod	%f26,	%f2
	sll	%g6,	0x11,	%i6
	movcs	%xcc,	%o6,	%o1
	edge8	%l1,	%g7,	%i1
	fmovsgu	%icc,	%f0,	%f1
	subccc	%i0,	0x0D37,	%g4
	xnorcc	%o7,	%o5,	%l2
	fmovse	%icc,	%f28,	%f29
	udiv	%i4,	0x1D34,	%o0
	edge32	%o2,	%i7,	%l5
	edge16	%l0,	%l6,	%i5
	fandnot2s	%f20,	%f6,	%f1
	set	0x48, %g2
	lduha	[%l7 + %g2] 0x15,	%g5
	edge8	%i2,	%l4,	%i3
	bcs,pt	%icc,	loop_2589
	fmovrsgz	%o3,	%f18,	%f8
	nop
	set	0x68, %o5
	std	%f30,	[%l7 + %o5]
	edge8	%o4,	%l3,	%g3
loop_2589:
	edge32ln	%g2,	%g6,	%i6
	nop
	fitod	%f24,	%f22
	fmuld8ulx16	%f7,	%f29,	%f20
	tcs	%icc,	0x7
	nop
	fitos	%f3,	%f31
	fstod	%f31,	%f0
	be	loop_2590
	fbne,a	%fcc2,	loop_2591
	edge16	%o6,	%g1,	%o1
	tne	%icc,	0x5
loop_2590:
	movl	%xcc,	%l1,	%i1
loop_2591:
	fone	%f18
	fmovrdlez	%g7,	%f0,	%f2
	edge32ln	%i0,	%o7,	%g4
	xnorcc	%l2,	%o5,	%i4
	edge32l	%o2,	%o0,	%l5
	sub	%l0,	%l6,	%i5
	movl	%icc,	%g5,	%i2
	movrgz	%i7,	0x16C,	%i3
	tgu	%icc,	0x5
	movg	%icc,	%l4,	%o4
	xnorcc	%o3,	0x00DA,	%g3
	bcs,a,pn	%icc,	loop_2592
	movre	%l3,	0x303,	%g2
	movrlz	%g6,	%i6,	%g1
	fpadd16s	%f27,	%f28,	%f5
loop_2592:
	smul	%o1,	0x072A,	%l1
	andncc	%o6,	%g7,	%i0
	bpos,pt	%xcc,	loop_2593
	membar	0x05
	ba	loop_2594
	bpos,pt	%icc,	loop_2595
loop_2593:
	xor	%i1,	%o7,	%g4
	tl	%icc,	0x4
loop_2594:
	tl	%icc,	0x1
loop_2595:
	sethi	0x0615,	%o5
	ldub	[%l7 + 0x3F],	%l2
	bvs,pn	%icc,	loop_2596
	ldx	[%l7 + 0x48],	%i4
	pdist	%f14,	%f8,	%f28
	tvc	%icc,	0x3
loop_2596:
	tleu	%icc,	0x4
	srl	%o2,	%o0,	%l0
	fone	%f22
	fmovrsgez	%l5,	%f31,	%f3
	lduw	[%l7 + 0x68],	%l6
	fmovde	%icc,	%f29,	%f6
	tl	%xcc,	0x7
	movgu	%xcc,	%g5,	%i5
	alignaddrl	%i2,	%i3,	%l4
	fmovrsgz	%o4,	%f5,	%f15
	ldsh	[%l7 + 0x1E],	%o3
	orn	%i7,	0x064B,	%g3
	array32	%l3,	%g2,	%g6
	subcc	%i6,	%g1,	%o1
	bshuffle	%f0,	%f8,	%f12
	fsrc2	%f16,	%f14
	alignaddrl	%l1,	%o6,	%g7
	andn	%i1,	0x0B2C,	%i0
	fmovdg	%icc,	%f22,	%f0
	edge8n	%o7,	%g4,	%l2
	stb	%o5,	[%l7 + 0x28]
	xnor	%o2,	%i4,	%l0
	tcs	%xcc,	0x3
	fandnot2s	%f28,	%f17,	%f26
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o0
	fmul8x16au	%f24,	%f27,	%f24
	array32	%l6,	%l5,	%g5
	fands	%f8,	%f24,	%f29
	fxnor	%f2,	%f28,	%f10
	tneg	%xcc,	0x5
	sdivcc	%i2,	0x12EE,	%i5
	mulx	%l4,	0x1EF1,	%i3
	tvc	%xcc,	0x2
	sethi	0x1152,	%o4
	set	0x6C, %o3
	lda	[%l7 + %o3] 0x19,	%f8
	mulscc	%i7,	0x0B37,	%g3
	set	0x4B, %o0
	stba	%l3,	[%l7 + %o0] 0x88
	sdivx	%o3,	0x1FBA,	%g6
	tcs	%icc,	0x5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x28] %asi,	%i6
	nop
	setx	0x45EC484D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x58944F08,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f2,	%f28
	movle	%xcc,	%g2,	%g1
	brnz,a	%l1,	loop_2597
	nop
	fitod	%f8,	%f16
	fdtoi	%f16,	%f12
	movre	%o6,	%g7,	%i1
	popc	%o1,	%o7
loop_2597:
	fmovsne	%icc,	%f26,	%f4
	tvc	%xcc,	0x7
	stw	%g4,	[%l7 + 0x44]
	orn	%l2,	0x10F9,	%i0
	movl	%xcc,	%o5,	%o2
	movcc	%icc,	%i4,	%l0
	subccc	%l6,	%o0,	%g5
	addcc	%l5,	0x1411,	%i5
	fba,a	%fcc1,	loop_2598
	movcs	%xcc,	%i2,	%l4
	umul	%i3,	0x0268,	%i7
	nop
	set	0x23, %l3
	ldub	[%l7 + %l3],	%g3
loop_2598:
	edge8n	%l3,	%o4,	%o3
	fbu	%fcc2,	loop_2599
	alignaddr	%g6,	%g2,	%i6
	ba,pn	%icc,	loop_2600
	edge8l	%g1,	%o6,	%g7
loop_2599:
	nop
	wr	%g0,	0x88,	%asi
	stba	%i1,	[%l7 + 0x71] %asi
loop_2600:
	fsrc1s	%f5,	%f26
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x38] %asi,	%f2
	ldub	[%l7 + 0x36],	%o1
	bvc,a,pt	%icc,	loop_2601
	fmovde	%xcc,	%f26,	%f2
	sllx	%o7,	%l1,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2601:
	tcs	%xcc,	0x6
	fmovsge	%xcc,	%f18,	%f9
	or	%l2,	0x15B8,	%i0
	srl	%o5,	%i4,	%o2
	nop
	set	0x40, %g7
	stw	%l6,	[%l7 + %g7]
	movre	%l0,	0x292,	%g5
	tl	%xcc,	0x0
	fpsub32s	%f11,	%f8,	%f3
	edge32	%l5,	%o0,	%i5
	bvs	loop_2602
	movrlz	%l4,	%i2,	%i7
	sdivcc	%i3,	0x0813,	%g3
	orcc	%l3,	%o3,	%g6
loop_2602:
	fnegs	%f6,	%f17
	tg	%xcc,	0x2
	ldd	[%l7 + 0x20],	%f10
	stbar
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o4
	addccc	%i6,	0x003D,	%g2
	fbn	%fcc1,	loop_2603
	fmovrsgz	%g1,	%f20,	%f6
	orcc	%g7,	%i1,	%o6
	lduh	[%l7 + 0x56],	%o1
loop_2603:
	sir	0x05B3
	nop
	setx	0x10613FE6,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	sir	0x1709
	fnot1s	%f12,	%f2
	subcc	%l1,	%g4,	%o7
	ldsw	[%l7 + 0x48],	%i0
	subcc	%o5,	%l2,	%i4
	udiv	%l6,	0x0CF3,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%l0,	loop_2604
	fble	%fcc0,	loop_2605
	orn	%l5,	0x01CE,	%g5
	membar	0x46
loop_2604:
	alignaddrl	%i5,	%l4,	%i2
loop_2605:
	alignaddr	%o0,	%i3,	%g3
	fzero	%f18
	tg	%icc,	0x7
	alignaddr	%i7,	%l3,	%o3
	edge32n	%g6,	%o4,	%g2
	addc	%i6,	%g1,	%g7
	tvc	%icc,	0x0
	bne,a	loop_2606
	addcc	%i1,	%o6,	%l1
	tcc	%icc,	0x1
	tn	%icc,	0x3
loop_2606:
	and	%g4,	%o7,	%o1
	edge8n	%i0,	%l2,	%i4
	stbar
	movrgez	%o5,	0x206,	%l6
	umul	%l0,	%o2,	%l5
	movrlez	%g5,	0x28A,	%i5
	fnors	%f30,	%f21,	%f30
	sra	%i2,	%o0,	%l4
	addccc	%g3,	%i3,	%i7
	brlz,a	%l3,	loop_2607
	fmovdg	%xcc,	%f6,	%f24
	nop
	setx	0x945536979467DD1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x77164CF9626394E8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f12,	%f14
	fmovsleu	%xcc,	%f28,	%f10
loop_2607:
	ldub	[%l7 + 0x47],	%g6
	fba,a	%fcc2,	loop_2608
	bcc,a	loop_2609
	tpos	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x23] %asi,	%o3
loop_2608:
	nop
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x88,	%o4
loop_2609:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrgez	%i6,	%g1,	%g2
	sir	0x0F52
	bcc	loop_2610
	umulcc	%i1,	0x052E,	%o6
	prefetch	[%l7 + 0x74],	 0x3
	movl	%xcc,	%l1,	%g7
loop_2610:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	nop
	setx	loop_2611,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%o1,	%i0,	%g4
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xeb,	%i4
loop_2611:
	fbuge,a	%fcc0,	loop_2612
	fmovdcc	%icc,	%f3,	%f0
	edge16l	%l2,	%o5,	%l6
	andn	%l0,	0x09AD,	%o2
loop_2612:
	subc	%l5,	0x16CF,	%i5
	movvs	%xcc,	%i2,	%g5
	fnors	%f2,	%f8,	%f28
	movvs	%icc,	%l4,	%g3
	fmovdne	%xcc,	%f15,	%f22
	andcc	%o0,	%i7,	%l3
	fbn,a	%fcc3,	loop_2613
	nop
	fitos	%f3,	%f6
	fstoi	%f6,	%f7
	tcc	%xcc,	0x4
	movrlz	%i3,	%g6,	%o3
loop_2613:
	tne	%xcc,	0x6
	edge32	%o4,	%g1,	%i6
	movre	%i1,	0x021,	%o6
	fmul8ulx16	%f16,	%f22,	%f10
	bcc,pt	%xcc,	loop_2614
	edge8ln	%g2,	%l1,	%o7
	xnor	%o1,	%g7,	%i0
	movrne	%g4,	%i4,	%l2
loop_2614:
	sllx	%o5,	%l0,	%l6
	fba,a	%fcc0,	loop_2615
	fmul8x16	%f20,	%f12,	%f14
	fmovscs	%icc,	%f18,	%f1
	movrlz	%l5,	0x152,	%o2
loop_2615:
	mova	%xcc,	%i2,	%g5
	xnorcc	%i5,	%g3,	%l4
	tg	%icc,	0x2
	xnorcc	%i7,	0x02EE,	%o0
	ldsb	[%l7 + 0x48],	%i3
	fbue,a	%fcc0,	loop_2616
	bpos,a	loop_2617
	movpos	%xcc,	%g6,	%o3
	movcc	%icc,	%o4,	%g1
loop_2616:
	sdivx	%l3,	0x0EE4,	%i6
loop_2617:
	edge8ln	%o6,	%i1,	%l1
	alignaddrl	%o7,	%o1,	%g7
	fmovsg	%icc,	%f18,	%f27
	fmuld8ulx16	%f10,	%f28,	%f2
	ble,a,pn	%icc,	loop_2618
	tvs	%icc,	0x5
	udivx	%i0,	0x0C3D,	%g2
	movl	%xcc,	%i4,	%l2
loop_2618:
	stbar
	set	0x50, %l5
	stwa	%g4,	[%l7 + %l5] 0x23
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f1
	movrlez	%l0,	0x1A8,	%l6
	fmovsle	%icc,	%f4,	%f2
	fpadd32	%f26,	%f10,	%f14
	edge8	%o5,	%l5,	%o2
	srax	%i2,	0x0D,	%g5
	membar	0x6A
	fornot2	%f26,	%f22,	%f2
	edge16l	%g3,	%i5,	%l4
	movcs	%icc,	%i7,	%o0
	movge	%icc,	%i3,	%g6
	addcc	%o3,	%g1,	%l3
	fornot1	%f30,	%f16,	%f26
	ldsh	[%l7 + 0x66],	%o4
	bg	%xcc,	loop_2619
	sllx	%o6,	%i6,	%l1
	udivx	%o7,	0x00BA,	%i1
	orcc	%g7,	0x1B18,	%i0
loop_2619:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x18] %asi,	%g2
	fxnors	%f28,	%f19,	%f0
	array32	%i4,	%l2,	%g4
	addc	%o1,	%l0,	%o5
	tn	%icc,	0x2
	nop
	setx	0x90540574,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	xnorcc	%l5,	%l6,	%i2
	movvc	%xcc,	%o2,	%g3
	andncc	%g5,	%i5,	%l4
	movrne	%o0,	0x037,	%i3
	bleu	%icc,	loop_2620
	fmovrse	%i7,	%f29,	%f9
	set	0x36, %l6
	ldsha	[%l7 + %l6] 0x81,	%g6
loop_2620:
	xnorcc	%o3,	%g1,	%l3
	movrlez	%o4,	%o6,	%l1
	fbn,a	%fcc0,	loop_2621
	fbl,a	%fcc1,	loop_2622
	tvs	%xcc,	0x4
	fornot2	%f4,	%f22,	%f14
loop_2621:
	udivx	%o7,	0x1BF1,	%i1
loop_2622:
	array32	%g7,	%i0,	%g2
	array32	%i6,	%i4,	%l2
	tsubcc	%g4,	0x1A11,	%o1
	fbl	%fcc3,	loop_2623
	movvs	%icc,	%o5,	%l5
	movrlz	%l0,	0x036,	%i2
	fxor	%f16,	%f2,	%f18
loop_2623:
	fmuld8ulx16	%f27,	%f14,	%f26
	movg	%xcc,	%o2,	%l6
	andn	%g5,	%g3,	%i5
	fble	%fcc3,	loop_2624
	tsubcc	%l4,	0x1EE1,	%o0
	fmovsleu	%icc,	%f8,	%f21
	nop
	setx	0xA84C5E4BA067A7AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_2624:
	xorcc	%i3,	%g6,	%o3
	fcmpeq32	%f2,	%f20,	%g1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sdivcc	%l3,	0x18F6,	%o4
	fsrc2s	%f30,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc1,	loop_2625
	fmovsgu	%xcc,	%f5,	%f26
	set	0x3E, %i1
	ldsha	[%l7 + %i1] 0x19,	%i7
loop_2625:
	nop
	wr	%g0,	0x27,	%asi
	stwa	%o6,	[%l7 + 0x58] %asi
	membar	#Sync
	ldsw	[%l7 + 0x24],	%o7
	addccc	%i1,	0x03FF,	%l1
	addcc	%g7,	0x113F,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%i4
	fbu,a	%fcc3,	loop_2626
	taddcc	%l2,	%g4,	%i6
	bcc,pt	%icc,	loop_2627
	nop
	set	0x66, %g3
	lduh	[%l7 + %g3],	%o5
loop_2626:
	tpos	%icc,	0x0
	bshuffle	%f16,	%f28,	%f0
loop_2627:
	fxors	%f10,	%f20,	%f6
	bvs,pt	%icc,	loop_2628
	umulcc	%o1,	0x1BC9,	%l0
	fnegd	%f30,	%f22
	andncc	%l5,	%o2,	%l6
loop_2628:
	tgu	%xcc,	0x4
	tle	%xcc,	0x0
	taddcc	%i2,	0x0743,	%g5
	addc	%g3,	%i5,	%o0
	fxnors	%f13,	%f30,	%f22
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f11
	srlx	%l4,	0x13,	%i3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x64] %asi,	%o3
	sdivcc	%g6,	0x0321,	%l3
	fmul8sux16	%f8,	%f14,	%f24
	and	%o4,	%g1,	%i7
	bn,a,pn	%xcc,	loop_2629
	orn	%o6,	%o7,	%l1
	bvs	loop_2630
	nop
	fitod	%f12,	%f2
	fdtos	%f2,	%f16
loop_2629:
	sdiv	%g7,	0x19A1,	%g2
	udivx	%i1,	0x1E56,	%i0
loop_2630:
	fmovdne	%xcc,	%f24,	%f29
	edge16ln	%l2,	%g4,	%i4
	subcc	%o5,	%o1,	%i6
	andncc	%l0,	%o2,	%l5
	movne	%xcc,	%i2,	%g5
	ldsb	[%l7 + 0x29],	%g3
	fpack32	%f6,	%f10,	%f24
	fbg	%fcc2,	loop_2631
	fmovrslz	%i5,	%f6,	%f5
	edge32l	%l6,	%o0,	%l4
	fmuld8sux16	%f7,	%f18,	%f6
loop_2631:
	te	%icc,	0x6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x81
	fmovdpos	%icc,	%f13,	%f9
	nop
	fitos	%f12,	%f26
	fstoi	%f26,	%f27
	tleu	%icc,	0x0
	mulscc	%i3,	%g6,	%l3
	edge32l	%o3,	%g1,	%i7
	wr	%g0,	0xe2,	%asi
	stba	%o6,	[%l7 + 0x56] %asi
	membar	#Sync
	bvs,a,pn	%icc,	loop_2632
	bl,a,pn	%xcc,	loop_2633
	fble	%fcc0,	loop_2634
	nop
	setx	loop_2635,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2632:
	prefetch	[%l7 + 0x74],	 0x0
loop_2633:
	xorcc	%o7,	%o4,	%l1
loop_2634:
	udivx	%g2,	0x19ED,	%i1
loop_2635:
	sir	0x10A7
	fcmpne32	%f24,	%f28,	%i0
	bcc	%icc,	loop_2636
	fmul8x16	%f22,	%f2,	%f24
	alignaddrl	%g7,	%g4,	%i4
	edge32	%l2,	%o1,	%o5
loop_2636:
	array32	%l0,	%i6,	%l5
	fbo,a	%fcc1,	loop_2637
	fble,a	%fcc3,	loop_2638
	sdiv	%i2,	0x1748,	%o2
	fabsd	%f12,	%f14
loop_2637:
	nop
	setx	0xE758CD54504949BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_2638:
	movrlez	%g3,	0x241,	%g5
	smul	%l6,	%i5,	%o0
	xnor	%l4,	%g6,	%i3
	fpsub16s	%f13,	%f14,	%f10
	lduw	[%l7 + 0x2C],	%o3
	tleu	%icc,	0x1
	sth	%g1,	[%l7 + 0x6E]
	mova	%icc,	%i7,	%l3
	membar	0x3A
	xor	%o7,	0x0006,	%o6
	udivx	%o4,	0x1682,	%g2
	movn	%xcc,	%l1,	%i1
	edge8ln	%g7,	%i0,	%g4
	tn	%icc,	0x1
	fmovsgu	%icc,	%f31,	%f4
	andcc	%i4,	%l2,	%o5
	set	0x24, %g5
	swapa	[%l7 + %g5] 0x81,	%o1
	smulcc	%l0,	%i6,	%l5
	bvc,a	loop_2639
	umul	%i2,	%o2,	%g5
	tcs	%xcc,	0x6
	xorcc	%g3,	%i5,	%l6
loop_2639:
	fmovrslz	%o0,	%f8,	%f2
	nop
	setx	loop_2640,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%l4,	%i3
	addc	%o3,	0x0B67,	%g1
	fpack32	%f28,	%f30,	%f20
loop_2640:
	sdivcc	%g6,	0x048C,	%i7
	nop
	fitod	%f12,	%f8
	fdtoi	%f8,	%f26
	fbl,a	%fcc1,	loop_2641
	membar	0x4E
	movge	%xcc,	%o7,	%l3
	faligndata	%f14,	%f14,	%f14
loop_2641:
	edge16ln	%o4,	%g2,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g7
	fbl,a	%fcc1,	loop_2642
	te	%icc,	0x1
	nop
	fitod	%f26,	%f14
	movle	%icc,	%i0,	%i1
loop_2642:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g4,	%l2
	taddcc	%o5,	%i4,	%o1
	flush	%l7 + 0x38
	sub	%l0,	%i6,	%i2
	movcs	%xcc,	%l5,	%g5
	sir	0x14FA
	fmovsn	%icc,	%f21,	%f10
	fnot1	%f2,	%f2
	movrgez	%g3,	0x2C6,	%i5
	fmul8x16	%f17,	%f4,	%f8
	subc	%o2,	%l6,	%o0
	fba,a	%fcc1,	loop_2643
	mulscc	%i3,	0x13FD,	%o3
	bne,pt	%icc,	loop_2644
	fnands	%f11,	%f17,	%f16
loop_2643:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x61] %asi,	%g1
loop_2644:
	stb	%l4,	[%l7 + 0x76]
	fbule	%fcc0,	loop_2645
	fpadd16	%f10,	%f18,	%f4
	bneg,pn	%xcc,	loop_2646
	fbe,a	%fcc1,	loop_2647
loop_2645:
	or	%i7,	%g6,	%l3
	fexpand	%f10,	%f22
loop_2646:
	edge32n	%o4,	%g2,	%o6
loop_2647:
	movrgz	%l1,	%g7,	%o7
	sub	%i1,	%g4,	%i0
	orn	%o5,	0x03E6,	%l2
	bn,a	%icc,	loop_2648
	sll	%i4,	0x0D,	%o1
	fcmpne16	%f22,	%f10,	%l0
	orcc	%i6,	%i2,	%g5
loop_2648:
	fmovse	%xcc,	%f21,	%f0
	umul	%g3,	%l5,	%i5
	bvs,a,pn	%xcc,	loop_2649
	fmovsa	%xcc,	%f8,	%f13
	nop
	setx	loop_2650,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%o2,	%l6,	%i3
loop_2649:
	mulscc	%o0,	%g1,	%l4
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f20
loop_2650:
	fabsd	%f0,	%f22
	sethi	0x08E1,	%i7
	edge16n	%o3,	%l3,	%o4
	fone	%f14
	call	loop_2651
	fnegs	%f30,	%f5
	tsubcctv	%g6,	%o6,	%l1
	movrgz	%g7,	0x283,	%o7
loop_2651:
	movvs	%xcc,	%i1,	%g4
	movvc	%icc,	%g2,	%i0
	edge8n	%o5,	%i4,	%o1
	fexpand	%f15,	%f4
	orncc	%l0,	0x1A85,	%l2
	std	%f16,	[%l7 + 0x68]
	membar	0x3E
	fmul8x16al	%f25,	%f26,	%f2
	add	%i6,	0x1AE1,	%g5
	fba	%fcc3,	loop_2652
	fmovrse	%i2,	%f30,	%f26
	udivcc	%g3,	0x0196,	%i5
	tpos	%xcc,	0x7
loop_2652:
	tge	%icc,	0x0
	movvs	%xcc,	%o2,	%l6
	array8	%i3,	%o0,	%l5
	orn	%l4,	%g1,	%o3
	nop
	setx	loop_2653,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbo	%fcc3,	loop_2654
	orn	%l3,	0x11C3,	%i7
	edge8	%g6,	%o4,	%l1
loop_2653:
	nop
	setx	0x408B1C8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x5CDF0B1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f12,	%f31
loop_2654:
	movle	%xcc,	%o6,	%o7
	tcc	%xcc,	0x6
	movrne	%i1,	%g4,	%g7
	orncc	%g2,	%i0,	%o5
	nop
	set	0x22, %g4
	sth	%i4,	[%l7 + %g4]
	movrgz	%o1,	%l0,	%i6
	subcc	%l2,	0x0901,	%g5
	xorcc	%g3,	0x146B,	%i5
	fmovse	%xcc,	%f6,	%f12
	prefetch	[%l7 + 0x38],	 0x0
	tl	%xcc,	0x4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	edge32l	%l6,	%o0,	%i3
	movvc	%xcc,	%l4,	%g1
	sir	0x0873
	fmovrsne	%o3,	%f22,	%f19
	orn	%l5,	%i7,	%g6
	ta	%xcc,	0x6
	orn	%l3,	0x0240,	%o4
	move	%icc,	%o6,	%l1
	movneg	%icc,	%i1,	%g4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	srax	%g2,	0x00,	%g7
	alignaddr	%i0,	%i4,	%o1
	subccc	%o5,	0x0062,	%i6
	fmovdge	%xcc,	%f25,	%f9
	fabss	%f5,	%f6
	tgu	%xcc,	0x1
	set	0x20, %i5
	ldswa	[%l7 + %i5] 0x04,	%l2
	edge16ln	%g5,	%l0,	%i5
	sdivcc	%i2,	0x03B8,	%g3
	fmovscc	%icc,	%f12,	%f19
	xnorcc	%l6,	%o0,	%i3
	nop
	setx	loop_2655,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc2,	loop_2656
	be,a,pt	%xcc,	loop_2657
	sra	%l4,	0x0B,	%o2
loop_2655:
	edge32n	%g1,	%l5,	%o3
loop_2656:
	tne	%xcc,	0x2
loop_2657:
	srl	%i7,	0x13,	%l3
	tle	%xcc,	0x5
	nop
	setx	loop_2658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnors	%f1,	%f26,	%f31
	movrgz	%g6,	0x219,	%o4
	movrne	%l1,	0x024,	%o6
loop_2658:
	ldstub	[%l7 + 0x0C],	%i1
	fpadd32s	%f12,	%f23,	%f2
	sethi	0x1E2C,	%o7
	sllx	%g4,	%g7,	%i0
	movcc	%xcc,	%i4,	%g2
	membar	0x14
	stbar
	movleu	%icc,	%o1,	%i6
	fbn	%fcc1,	loop_2659
	edge16n	%o5,	%l2,	%g5
	subccc	%i5,	0x0C93,	%i2
	nop
	fitos	%f14,	%f15
	fstod	%f15,	%f28
loop_2659:
	array32	%l0,	%l6,	%o0
	lduh	[%l7 + 0x76],	%i3
	sub	%l4,	%g3,	%o2
	fmovsl	%icc,	%f8,	%f19
	fpadd32s	%f21,	%f21,	%f26
	fornot2	%f10,	%f0,	%f4
	nop
	setx	0xFD23A84D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xC0B86E7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f27,	%f6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%g1
	fblg,a	%fcc3,	loop_2660
	sllx	%o3,	%i7,	%l3
	movne	%icc,	%g6,	%o4
	movrgez	%l1,	0x3E7,	%l5
loop_2660:
	st	%f10,	[%l7 + 0x3C]
	set	0x58, %o2
	lduba	[%l7 + %o2] 0x19,	%i1
	tvs	%icc,	0x6
	mulx	%o7,	%o6,	%g4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i0
	movn	%xcc,	%g7,	%i4
	set	0x0F, %l2
	ldsba	[%l7 + %l2] 0x0c,	%g2
	tcc	%xcc,	0x2
	nop
	setx	0x8060509C,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	subcc	%o1,	%i6,	%l2
	popc	%g5,	%i5
	addccc	%o5,	0x14ED,	%i2
	srax	%l0,	0x04,	%l6
	edge32ln	%i3,	%l4,	%o0
	tvc	%icc,	0x2
	subcc	%g3,	%g1,	%o2
	orcc	%i7,	0x08F7,	%l3
	and	%g6,	0x0F7D,	%o4
	array16	%o3,	%l5,	%i1
	udiv	%l1,	0x192D,	%o7
	nop
	setx	loop_2661,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bneg,pn	%xcc,	loop_2662
	tsubcc	%o6,	%g4,	%i0
	movpos	%xcc,	%i4,	%g7
loop_2661:
	edge16ln	%g2,	%o1,	%l2
loop_2662:
	fxor	%f8,	%f8,	%f12
	fnegs	%f30,	%f20
	movleu	%icc,	%i6,	%i5
	ldd	[%l7 + 0x18],	%f28
	tl	%icc,	0x7
	brnz,a	%o5,	loop_2663
	fblg	%fcc0,	loop_2664
	fba	%fcc2,	loop_2665
	movpos	%xcc,	%i2,	%l0
loop_2663:
	tsubcc	%g5,	%i3,	%l6
loop_2664:
	movrgez	%l4,	0x3F6,	%o0
loop_2665:
	brgz,a	%g1,	loop_2666
	fnot2s	%f18,	%f0
	set	0x68, %i7
	swapa	[%l7 + %i7] 0x88,	%g3
loop_2666:
	fornot2s	%f8,	%f28,	%f18
	srlx	%i7,	0x19,	%l3
	edge16l	%o2,	%g6,	%o4
	popc	0x19B6,	%o3
	fcmpgt16	%f30,	%f4,	%i1
	tvc	%icc,	0x1
	subcc	%l1,	0x13BC,	%l5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
	fbge	%fcc0,	loop_2667
	smulcc	%g4,	0x027F,	%o6
	movcs	%icc,	%i4,	%i0
	movneg	%xcc,	%g7,	%o1
loop_2667:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x08] %asi
	subc	%l2,	0x14D1,	%i6
	taddcc	%i5,	0x1346,	%g2
	addcc	%i2,	%l0,	%g5
	sllx	%i3,	0x1B,	%o5
	edge32n	%l6,	%l4,	%g1
	set	0x6C, %l1
	stwa	%g3,	[%l7 + %l1] 0x18
	fmovse	%xcc,	%f5,	%f31
	bge,pt	%xcc,	loop_2668
	bgu,a	loop_2669
	popc	0x1215,	%i7
	movcc	%icc,	%l3,	%o0
loop_2668:
	nop
	setx	loop_2670,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2669:
	bn	%icc,	loop_2671
	nop
	fitos	%f13,	%f18
	fstoi	%f18,	%f9
	nop
	set	0x14, %l0
	lduw	[%l7 + %l0],	%o2
loop_2670:
	fba,a	%fcc1,	loop_2672
loop_2671:
	fbo	%fcc1,	loop_2673
	movge	%icc,	%o4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2672:
	orncc	%g6,	0x0AC9,	%l1
loop_2673:
	fbue,a	%fcc0,	loop_2674
	nop
	set	0x44, %i2
	lduh	[%l7 + %i2],	%i1
	bcc,a,pn	%xcc,	loop_2675
	nop
	setx loop_2676, %l0, %l1
	jmpl %l1, %o7
loop_2674:
	move	%xcc,	%g4,	%o6
	movne	%icc,	%i4,	%i0
loop_2675:
	ldub	[%l7 + 0x75],	%l5
loop_2676:
	udivcc	%g7,	0x0D8A,	%o1
	subc	%i6,	%l2,	%g2
	bg,a	loop_2677
	fxnors	%f27,	%f16,	%f8
	stx	%i5,	[%l7 + 0x70]
	smul	%l0,	%i2,	%i3
loop_2677:
	tcc	%icc,	0x7
	nop
	setx	0xBF3D1E18606F5D68,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f28,	%f10,	%f0
	movcc	%xcc,	%g5,	%l6
	movvc	%xcc,	%o5,	%g1
	movg	%xcc,	%g3,	%l4
	movpos	%xcc,	%i7,	%o0
	call	loop_2678
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f31,	%f17,	%f24
	fpack32	%f28,	%f28,	%f24
loop_2678:
	srlx	%o2,	%l3,	%o3
	edge8n	%o4,	%g6,	%l1
	membar	0x12
	fmovscs	%xcc,	%f12,	%f11
	popc	%o7,	%g4
	edge16l	%o6,	%i1,	%i0
	set	0x26, %o4
	lduba	[%l7 + %o4] 0x04,	%l5
	set	0x48, %o7
	ldxa	[%l7 + %o7] 0x19,	%g7
	add	%o1,	0x079F,	%i4
	and	%l2,	%g2,	%i5
	membar	0x37
	fcmpgt16	%f6,	%f24,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x10,	%i6,	%i3
	fnegd	%f4,	%f0
	and	%i2,	%l6,	%g5
	tn	%icc,	0x1
	fmovsgu	%xcc,	%f21,	%f8
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g1
	srl	%g3,	0x06,	%l4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o5
	tvc	%xcc,	0x0
	orncc	%o0,	0x07C4,	%o2
	fandnot2s	%f18,	%f6,	%f7
	nop
	set	0x30, %g6
	std	%f18,	[%l7 + %g6]
	addc	%l3,	0x0913,	%i7
	addccc	%o4,	0x1DD7,	%o3
	movge	%xcc,	%g6,	%o7
	andncc	%l1,	%g4,	%o6
	fpsub16s	%f5,	%f1,	%f19
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%i0
	mulx	%l5,	0x13E8,	%o1
	taddcctv	%g7,	%l2,	%g2
	array32	%i4,	%i5,	%i6
	add	%i3,	%l0,	%i2
	nop
	set	0x35, %i3
	ldstub	[%l7 + %i3],	%g5
	lduw	[%l7 + 0x2C],	%l6
	fone	%f10
	addcc	%g3,	%g1,	%l4
	movle	%xcc,	%o5,	%o2
	ldx	[%l7 + 0x58],	%l3
	bl	loop_2679
	tleu	%xcc,	0x0
	taddcctv	%o0,	0x125A,	%i7
	edge32n	%o3,	%o4,	%o7
loop_2679:
	popc	%g6,	%l1
	fbge	%fcc1,	loop_2680
	edge16n	%g4,	%i1,	%i0
	tne	%icc,	0x0
	edge8n	%l5,	%o6,	%o1
loop_2680:
	fmovdgu	%icc,	%f1,	%f23
	sdivx	%l2,	0x06AB,	%g7
	nop
	setx	loop_2681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x07A7,	%g2
	set	0x38, %o1
	ldxa	[%g0 + %o1] 0x20,	%i5
loop_2681:
	fbug	%fcc1,	loop_2682
	edge32	%i6,	%i3,	%l0
	srl	%i2,	%i4,	%l6
	tvs	%icc,	0x7
loop_2682:
	move	%xcc,	%g5,	%g1
	taddcctv	%l4,	0x1B77,	%o5
	set	0x6F, %l4
	lduba	[%l7 + %l4] 0x89,	%o2
	andncc	%g3,	%l3,	%i7
	st	%f9,	[%l7 + 0x18]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	subcc	%o4,	0x0FD3,	%o3
	bge	%icc,	loop_2683
	fmovdg	%xcc,	%f9,	%f24
	fpsub16	%f12,	%f24,	%f26
	tpos	%xcc,	0x5
loop_2683:
	mova	%xcc,	%g6,	%l1
	edge32	%o7,	%i1,	%i0
	pdist	%f26,	%f30,	%f0
	ldstub	[%l7 + 0x37],	%g4
	movleu	%icc,	%o6,	%l5
	fnands	%f14,	%f21,	%f23
	fbn,a	%fcc2,	loop_2684
	movcs	%icc,	%l2,	%g7
	tgu	%xcc,	0x5
	edge8	%o1,	%g2,	%i5
loop_2684:
	alignaddrl	%i6,	%i3,	%i2
	ble,a	%xcc,	loop_2685
	array8	%i4,	%l6,	%g5
	tneg	%xcc,	0x5
	taddcctv	%l0,	0x09D8,	%l4
loop_2685:
	fbg	%fcc3,	loop_2686
	fmovrdgez	%o5,	%f8,	%f12
	ldx	[%l7 + 0x68],	%g1
	sdiv	%o2,	0x0236,	%l3
loop_2686:
	nop
	wr	%g0,	0xe3,	%asi
	stha	%i7,	[%l7 + 0x62] %asi
	membar	#Sync
	movrgz	%o0,	%g3,	%o3
	nop
	fitod	%f9,	%f6
	sir	0x11EF
	membar	0x00
	fmovsne	%icc,	%f6,	%f3
	ld	[%l7 + 0x48],	%f0
	andcc	%o4,	%l1,	%o7
	bneg,a	%xcc,	loop_2687
	tl	%xcc,	0x4
	brnz	%g6,	loop_2688
	taddcctv	%i1,	%g4,	%o6
loop_2687:
	array8	%i0,	%l5,	%g7
	fmul8ulx16	%f8,	%f10,	%f0
loop_2688:
	movcc	%xcc,	%o1,	%g2
	ba,a,pn	%xcc,	loop_2689
	fbul	%fcc1,	loop_2690
	fmul8x16	%f28,	%f16,	%f12
	nop
	setx	0xB49F79BA3ACC6305,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f2
loop_2689:
	membar	0x3B
loop_2690:
	brnz	%l2,	loop_2691
	ldsb	[%l7 + 0x59],	%i6
	fmovdne	%xcc,	%f1,	%f20
	bne,a	%xcc,	loop_2692
loop_2691:
	movrne	%i3,	%i2,	%i5
	tsubcc	%l6,	%g5,	%i4
	movre	%l4,	%l0,	%o5
loop_2692:
	fmuld8ulx16	%f13,	%f1,	%f16
	orncc	%g1,	%l3,	%o2
	call	loop_2693
	and	%o0,	0x0BFE,	%i7
	fands	%f17,	%f31,	%f15
	umulcc	%o3,	0x1E0A,	%g3
loop_2693:
	array16	%o4,	%o7,	%g6
	nop
	setx	0x95788B211AD86619,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f20
	nop
	setx loop_2694, %l0, %l1
	jmpl %l1, %i1
	movneg	%icc,	%g4,	%l1
	array8	%o6,	%i0,	%g7
	movn	%icc,	%l5,	%o1
loop_2694:
	popc	0x1C24,	%l2
	fmovsleu	%icc,	%f5,	%f7
	array32	%g2,	%i6,	%i3
	mulscc	%i2,	%i5,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g5
	st	%f8,	[%l7 + 0x38]
	movrne	%l4,	0x123,	%i4
	movl	%xcc,	%o5,	%l0
	membar	0x45
	bl,a,pt	%icc,	loop_2695
	fmul8x16al	%f2,	%f2,	%f18
	fmovde	%icc,	%f20,	%f19
	fbg	%fcc1,	loop_2696
loop_2695:
	tleu	%xcc,	0x2
	movrgez	%l3,	%o2,	%g1
	sdiv	%i7,	0x0761,	%o0
loop_2696:
	add	%o3,	0x0C04,	%g3
	nop
	fitod	%f10,	%f0
	fdtos	%f0,	%f4
	srlx	%o7,	0x0E,	%g6
	fandnot1s	%f11,	%f20,	%f12
	sllx	%i1,	0x1D,	%o4
	movrlez	%g4,	%l1,	%i0
	fble,a	%fcc0,	loop_2697
	movn	%xcc,	%g7,	%l5
	tvs	%icc,	0x2
	alignaddrl	%o1,	%o6,	%l2
loop_2697:
	orncc	%g2,	0x0615,	%i6
	bvc	%icc,	loop_2698
	movrne	%i3,	0x2D7,	%i2
	taddcctv	%l6,	0x1344,	%g5
	stbar
loop_2698:
	subc	%l4,	0x15AD,	%i5
	tge	%xcc,	0x7
	umulcc	%i4,	0x08FA,	%l0
	bne,a	loop_2699
	xor	%o5,	0x0977,	%o2
	bleu,pn	%xcc,	loop_2700
	movn	%icc,	%g1,	%l3
loop_2699:
	fpsub16s	%f19,	%f11,	%f15
	bn,a,pt	%icc,	loop_2701
loop_2700:
	movne	%xcc,	%i7,	%o3
	movl	%icc,	%g3,	%o7
	wr	%g0,	0x2f,	%asi
	stba	%g6,	[%l7 + 0x7F] %asi
	membar	#Sync
loop_2701:
	ldd	[%l7 + 0x70],	%f28
	srl	%i1,	0x05,	%o4
	brgez	%g4,	loop_2702
	tle	%icc,	0x1
	fmovsvc	%xcc,	%f30,	%f26
	sll	%o0,	%l1,	%g7
loop_2702:
	fpsub32s	%f31,	%f31,	%f23
	tsubcctv	%i0,	0x15BB,	%l5
	sethi	0x1CE4,	%o6
	sth	%l2,	[%l7 + 0x70]
	xnor	%g2,	%o1,	%i6
	edge8l	%i3,	%i2,	%g5
	te	%icc,	0x7
	sdiv	%l4,	0x1C39,	%i5
	bvc,a	%xcc,	loop_2703
	tvc	%xcc,	0x3
	sethi	0x0EEC,	%l6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x64] %asi,	%l0
loop_2703:
	fmovscc	%xcc,	%f11,	%f2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x68] %asi,	%i4
	fbg,a	%fcc2,	loop_2704
	edge32	%o2,	%o5,	%l3
	movrlz	%i7,	%g1,	%g3
	ld	[%l7 + 0x5C],	%f13
loop_2704:
	sllx	%o3,	0x12,	%g6
	brnz,a	%o7,	loop_2705
	taddcc	%i1,	0x1079,	%o4
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x04,	 0x1
loop_2705:
	or	%o0,	%g7,	%i0
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f28
	set	0x40, %g2
	lduha	[%l7 + %g2] 0x11,	%l1
	add	%l5,	0x094B,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g2,	%l2,	%i6
	brgez	%i3,	loop_2706
	fmovsvs	%xcc,	%f20,	%f18
	xnorcc	%i2,	0x159A,	%o1
	nop
	setx	0x94728B6016E3C6F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x0EBAA2D7ABAD56C3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f4,	%f16
loop_2706:
	tge	%icc,	0x1
	movrlz	%l4,	0x374,	%i5
	fmovdn	%xcc,	%f5,	%f7
	sdiv	%g5,	0x12AB,	%l0
	edge16ln	%l6,	%o2,	%i4
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f5
	tvc	%xcc,	0x5
	edge8n	%o5,	%i7,	%l3
	sll	%g3,	0x04,	%g1
	bpos,pn	%xcc,	loop_2707
	te	%xcc,	0x4
	xnorcc	%g6,	%o7,	%o3
	wr	%g0,	0x18,	%asi
	sta	%f7,	[%l7 + 0x44] %asi
loop_2707:
	movge	%xcc,	%o4,	%g4
	subccc	%i1,	0x0777,	%g7
	xnor	%o0,	%l1,	%i0
	movneg	%icc,	%o6,	%g2
	tvc	%icc,	0x6
	fbule	%fcc2,	loop_2708
	bgu,a,pt	%xcc,	loop_2709
	sdivcc	%l5,	0x06E7,	%i6
	brnz	%l2,	loop_2710
loop_2708:
	fbule	%fcc2,	loop_2711
loop_2709:
	fble,a	%fcc3,	loop_2712
	fandnot2	%f4,	%f24,	%f20
loop_2710:
	for	%f20,	%f18,	%f8
loop_2711:
	sub	%i2,	%o1,	%l4
loop_2712:
	fbge,a	%fcc3,	loop_2713
	edge32n	%i5,	%g5,	%l0
	tpos	%icc,	0x3
	xnor	%l6,	0x189F,	%o2
loop_2713:
	bgu,a	%icc,	loop_2714
	movl	%xcc,	%i3,	%o5
	xnor	%i4,	%i7,	%l3
	tvs	%icc,	0x3
loop_2714:
	fmovdcc	%xcc,	%f1,	%f10
	bg	loop_2715
	fbule,a	%fcc0,	loop_2716
	mulx	%g1,	%g3,	%o7
	tle	%icc,	0x4
loop_2715:
	edge8ln	%o3,	%g6,	%o4
loop_2716:
	fzero	%f28
	movrgez	%g4,	0x032,	%i1
	subccc	%o0,	%l1,	%g7
	sethi	0x1096,	%i0
	set	0x3C, %i0
	ldswa	[%l7 + %i0] 0x19,	%o6
	orn	%g2,	%l5,	%i6
	ldstub	[%l7 + 0x50],	%i2
	tcc	%icc,	0x4
	nop
	fitos	%f24,	%f4
	brlz	%l2,	loop_2717
	fpack16	%f0,	%f22
	array32	%o1,	%i5,	%l4
	brlez	%g5,	loop_2718
loop_2717:
	brlz	%l6,	loop_2719
	movrgz	%o2,	0x2A7,	%l0
	tleu	%xcc,	0x6
loop_2718:
	addcc	%i3,	%i4,	%o5
loop_2719:
	brlz,a	%l3,	loop_2720
	fnegd	%f24,	%f26
	fpadd32	%f4,	%f26,	%f14
	tsubcc	%g1,	%i7,	%o7
loop_2720:
	fmovdgu	%xcc,	%f5,	%f6
	edge8l	%o3,	%g6,	%g3
	tne	%icc,	0x1
	tcc	%icc,	0x4
	movg	%icc,	%o4,	%g4
	bshuffle	%f30,	%f22,	%f6
	std	%f8,	[%l7 + 0x18]
	umulcc	%i1,	0x0F62,	%o0
	tcs	%xcc,	0x0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%l1
	smul	%o6,	0x0580,	%i0
	andn	%l5,	0x0613,	%g2
	fmovdle	%icc,	%f9,	%f7
	srax	%i2,	0x01,	%i6
	nop
	fitos	%f12,	%f29
	fstox	%f29,	%f28
	fcmpeq32	%f0,	%f4,	%o1
	sdivcc	%l2,	0x08C5,	%l4
	fmovsl	%icc,	%f22,	%f0
	fmuld8sux16	%f20,	%f29,	%f14
	movrlez	%g5,	%i5,	%l6
	ldstub	[%l7 + 0x7F],	%o2
	edge32n	%l0,	%i3,	%o5
	movre	%l3,	%i4,	%g1
	array32	%i7,	%o7,	%g6
	fmovrslez	%g3,	%f11,	%f19
	srlx	%o4,	0x13,	%o3
	sra	%i1,	%o0,	%g7
	movgu	%xcc,	%g4,	%l1
	fandnot1	%f28,	%f22,	%f10
	tneg	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	umulcc	%i0,	%o6,	%l5
	sdivcc	%i2,	0x0421,	%g2
	tg	%xcc,	0x5
	andn	%o1,	%l2,	%l4
	sub	%g5,	0x14D2,	%i5
	bl,pn	%xcc,	loop_2721
	sdivx	%l6,	0x0592,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f22,	%f20
loop_2721:
	edge8ln	%o2,	%l0,	%o5
	orn	%l3,	0x0FA2,	%i4
	brz,a	%g1,	loop_2722
	brgz	%i7,	loop_2723
	ldsh	[%l7 + 0x5C],	%o7
	nop
	setx	0xAD2D27F9E06F9828,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f8
loop_2722:
	fmovrsgz	%g6,	%f31,	%f29
loop_2723:
	tn	%xcc,	0x4
	array32	%g3,	%o4,	%i3
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
	popc	0x0B3B,	%i1
	tpos	%icc,	0x1
	edge32n	%o3,	%g7,	%g4
loop_2724:
	movrgez	%l1,	0x384,	%i0
	mova	%xcc,	%o6,	%o0
	brlz,a	%i2,	loop_2725
	movneg	%xcc,	%l5,	%g2
	fnot1	%f4,	%f18
	tcc	%xcc,	0x0
loop_2725:
	xnor	%l2,	0x04E6,	%o1
	fpadd16	%f22,	%f2,	%f12
	subccc	%l4,	0x09BC,	%i5
	tg	%xcc,	0x6
	edge8	%l6,	%i6,	%g5
	brnz	%o2,	loop_2726
	ldd	[%l7 + 0x70],	%f12
	sdivx	%l0,	0x098F,	%o5
	sll	%i4,	%l3,	%g1
loop_2726:
	alignaddrl	%o7,	%g6,	%i7
	edge16n	%o4,	%i3,	%g3
	fbn,a	%fcc2,	loop_2727
	addccc	%i1,	0x17E1,	%o3
	tvs	%icc,	0x4
	alignaddr	%g4,	%l1,	%g7
loop_2727:
	movg	%icc,	%o6,	%o0
	ldsb	[%l7 + 0x7C],	%i0
	addcc	%i2,	0x1132,	%l5
	tsubcc	%g2,	0x1E48,	%o1
	fone	%f30
	fandnot1	%f20,	%f24,	%f12
	sdivcc	%l2,	0x05C5,	%i5
	edge32n	%l6,	%i6,	%l4
	movcs	%icc,	%o2,	%l0
	movcc	%icc,	%g5,	%i4
	edge32ln	%o5,	%g1,	%l3
	movvs	%icc,	%o7,	%i7
	nop
	setx	0x1A52B5001029DD39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x0E8635BE317C5D4E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f22,	%f26
	movre	%g6,	0x32F,	%i3
	stb	%g3,	[%l7 + 0x73]
	sth	%o4,	[%l7 + 0x28]
	fbg	%fcc2,	loop_2728
	tvs	%icc,	0x1
	fmovdle	%xcc,	%f22,	%f19
	srax	%o3,	0x19,	%g4
loop_2728:
	umulcc	%i1,	%l1,	%o6
	nop
	set	0x42, %o3
	lduh	[%l7 + %o3],	%o0
	movrlz	%g7,	%i2,	%i0
	addccc	%g2,	0x14F9,	%o1
	movre	%l2,	%i5,	%l6
	movne	%icc,	%l5,	%i6
	sdivcc	%o2,	0x0B28,	%l0
	srax	%g5,	0x00,	%l4
	movle	%xcc,	%i4,	%g1
	fcmpgt32	%f30,	%f22,	%o5
	umul	%o7,	0x121B,	%i7
	tle	%xcc,	0x5
	addc	%l3,	0x1424,	%g6
	tvc	%icc,	0x0
	tvs	%icc,	0x5
	tsubcctv	%i3,	%o4,	%o3
	edge8n	%g4,	%i1,	%l1
	movgu	%icc,	%o6,	%g3
	tgu	%icc,	0x3
	brlz,a	%g7,	loop_2729
	fbg,a	%fcc1,	loop_2730
	tcc	%icc,	0x3
	tgu	%xcc,	0x1
loop_2729:
	udivcc	%o0,	0x0600,	%i0
loop_2730:
	smul	%i2,	0x1CC9,	%g2
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf0
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x1
	fcmpgt32	%f8,	%f2,	%l2
	fbul,a	%fcc1,	loop_2731
	edge32n	%o1,	%i5,	%l6
	sir	0x1685
	movge	%xcc,	%i6,	%l5
loop_2731:
	and	%l0,	0x1DAE,	%g5
	andncc	%o2,	%l4,	%i4
	wr	%g0,	0x11,	%asi
	sta	%f10,	[%l7 + 0x74] %asi
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%o5
	sra	%o7,	0x1D,	%i7
	edge8l	%g6,	%i3,	%o4
	orcc	%o3,	%l3,	%i1
	nop
	set	0x4C, %o0
	ldsw	[%l7 + %o0],	%g4
	movrne	%l1,	%o6,	%g3
	tvs	%xcc,	0x1
	udivx	%o0,	0x07DF,	%g7
	bvs,a,pt	%icc,	loop_2732
	nop
	setx loop_2733, %l0, %l1
	jmpl %l1, %i0
	tleu	%xcc,	0x0
	edge8ln	%g2,	%l2,	%i2
loop_2732:
	fble,a	%fcc3,	loop_2734
loop_2733:
	std	%f18,	[%l7 + 0x20]
	nop
	setx	0xC89E46D91395A50F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD69E9704A322A439,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f16,	%f12
	mulscc	%i5,	%o1,	%i6
loop_2734:
	fnot1	%f4,	%f28
	tvc	%xcc,	0x2
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%l6
	fmovsvc	%icc,	%f23,	%f1
	fmovdvs	%xcc,	%f7,	%f18
	fba,a	%fcc3,	loop_2735
	te	%xcc,	0x5
	lduw	[%l7 + 0x30],	%l5
	fcmpgt16	%f20,	%f26,	%l0
loop_2735:
	fmovrde	%o2,	%f2,	%f12
	fbge,a	%fcc0,	loop_2736
	ldsb	[%l7 + 0x37],	%l4
	ldsb	[%l7 + 0x5F],	%i4
	fand	%f28,	%f12,	%f2
loop_2736:
	umulcc	%g5,	%o5,	%g1
	fmovdgu	%icc,	%f31,	%f4
	edge16	%o7,	%i7,	%g6
	fmovdge	%icc,	%f5,	%f19
	tle	%icc,	0x1
	fmovsneg	%xcc,	%f8,	%f0
	tne	%icc,	0x5
	andn	%i3,	0x18B8,	%o4
	bneg	%xcc,	loop_2737
	movl	%xcc,	%o3,	%l3
	set	0x1A, %i4
	ldsha	[%l7 + %i4] 0x18,	%i1
loop_2737:
	tvc	%xcc,	0x6
	ba,a	%icc,	loop_2738
	ble,pn	%xcc,	loop_2739
	xorcc	%l1,	%g4,	%o6
	movn	%icc,	%o0,	%g7
loop_2738:
	edge32	%g3,	%i0,	%g2
loop_2739:
	membar	0x19
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i2,	%i5
	set	0x4C, %o6
	stba	%o1,	[%l7 + %o6] 0x2a
	membar	#Sync
	fnegd	%f8,	%f26
	umulcc	%i6,	0x0EAA,	%l6
	tcc	%icc,	0x1
	edge8	%l2,	%l0,	%l5
	fzero	%f20
	ble,pt	%icc,	loop_2740
	xnorcc	%l4,	%i4,	%g5
	tge	%icc,	0x2
	orncc	%o2,	%g1,	%o7
loop_2740:
	fcmpne32	%f30,	%f14,	%i7
	sdivcc	%g6,	0x17FF,	%o5
	nop
	setx	0xCDE264E7F5A4BD0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x406E3D4BACFEA1C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f2
	movcs	%xcc,	%i3,	%o3
	tvc	%icc,	0x6
	ldub	[%l7 + 0x1C],	%o4
	orn	%l3,	%l1,	%i1
	bleu,a,pt	%xcc,	loop_2741
	nop
	setx	0x3776575B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xA847F817,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f14,	%f27
	bpos	%xcc,	loop_2742
	sdiv	%g4,	0x05EF,	%o6
loop_2741:
	bl	loop_2743
	xnorcc	%g7,	0x04C7,	%g3
loop_2742:
	sdiv	%o0,	0x08A8,	%g2
	andncc	%i0,	%i2,	%i5
loop_2743:
	tl	%icc,	0x4
	fand	%f2,	%f4,	%f24
	alignaddrl	%o1,	%i6,	%l2
	tcs	%xcc,	0x0
	tcs	%icc,	0x1
	brgz	%l6,	loop_2744
	orncc	%l5,	%l4,	%l0
	ldsh	[%l7 + 0x10],	%g5
	tsubcctv	%o2,	%g1,	%o7
loop_2744:
	movre	%i4,	%i7,	%o5
	fcmple32	%f20,	%f20,	%g6
	movgu	%icc,	%i3,	%o3
	edge16l	%o4,	%l1,	%l3
	fcmpne32	%f26,	%f28,	%g4
	alignaddr	%i1,	%g7,	%g3
	set	0x2B, %l5
	ldsba	[%l7 + %l5] 0x10,	%o6
	movrne	%g2,	0x297,	%o0
	fbl	%fcc2,	loop_2745
	edge8n	%i2,	%i5,	%o1
	nop
	setx loop_2746, %l0, %l1
	jmpl %l1, %i0
	andncc	%i6,	%l2,	%l6
loop_2745:
	movneg	%xcc,	%l4,	%l0
	fsrc1s	%f19,	%f15
loop_2746:
	brnz	%l5,	loop_2747
	movg	%xcc,	%o2,	%g1
	movge	%xcc,	%o7,	%g5
	for	%f30,	%f4,	%f20
loop_2747:
	fmovdneg	%xcc,	%f15,	%f1
	srax	%i7,	%o5,	%i4
	tg	%xcc,	0x3
	movrlez	%i3,	0x32C,	%g6
	smulcc	%o4,	%o3,	%l3
	orn	%l1,	0x0682,	%i1
	bpos,pn	%icc,	loop_2748
	move	%xcc,	%g4,	%g3
	ld	[%l7 + 0x58],	%f10
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x15,	 0x2
loop_2748:
	tl	%icc,	0x6
	movg	%icc,	%o6,	%o0
	taddcctv	%g2,	%i5,	%o1
	udivcc	%i0,	0x03EE,	%i2
	fones	%f14
	tvs	%icc,	0x4
	tn	%icc,	0x6
	sub	%l2,	0x07B6,	%i6
	tgu	%icc,	0x1
	movcc	%icc,	%l4,	%l0
	taddcc	%l5,	0x0B4A,	%o2
	addc	%l6,	%o7,	%g5
	tleu	%xcc,	0x3
	bpos,a	loop_2749
	fbne,a	%fcc2,	loop_2750
	taddcctv	%g1,	0x1A3C,	%i7
	edge16l	%i4,	%i3,	%o5
loop_2749:
	st	%f0,	[%l7 + 0x28]
loop_2750:
	movpos	%icc,	%g6,	%o3
	fbge,a	%fcc2,	loop_2751
	bcc,pt	%icc,	loop_2752
	movn	%icc,	%l3,	%l1
	tsubcc	%o4,	%i1,	%g4
loop_2751:
	array16	%g3,	%g7,	%o6
loop_2752:
	ld	[%l7 + 0x70],	%f17
	fnors	%f21,	%f10,	%f5
	umul	%g2,	%o0,	%o1
	tneg	%icc,	0x6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%i5
	tsubcctv	%i2,	0x0DE2,	%i0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%i6
	edge16ln	%l2,	%l4,	%l5
	movrne	%l0,	0x3F5,	%o2
	movl	%icc,	%l6,	%o7
	fmul8x16au	%f5,	%f15,	%f6
	nop
	fitos	%f27,	%f13
	mulscc	%g1,	%i7,	%i4
	orncc	%i3,	0x0AA2,	%g5
	fbu	%fcc2,	loop_2753
	sth	%o5,	[%l7 + 0x52]
	movleu	%icc,	%o3,	%g6
	fpadd16	%f18,	%f10,	%f26
loop_2753:
	nop
	set	0x30, %l3
	stxa	%l3,	[%l7 + %l3] 0xe3
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x08, %g3
	stha	%l1,	[%l7 + %g3] 0x18
	fbo	%fcc1,	loop_2754
	srlx	%o4,	0x1B,	%g4
	sllx	%i1,	%g3,	%g7
	bleu,a,pn	%icc,	loop_2755
loop_2754:
	movcc	%icc,	%g2,	%o0
	tcc	%xcc,	0x3
	stb	%o1,	[%l7 + 0x54]
loop_2755:
	array8	%o6,	%i5,	%i0
	fba,a	%fcc0,	loop_2756
	movrlez	%i6,	%l2,	%l4
	srax	%i2,	%l5,	%l0
	add	%o2,	%l6,	%o7
loop_2756:
	edge32ln	%i7,	%i4,	%i3
	edge32ln	%g5,	%o5,	%g1
	fmovdpos	%icc,	%f23,	%f5
	tl	%icc,	0x5
	set	0x64, %i1
	sta	%f29,	[%l7 + %i1] 0x04
	fmovsa	%xcc,	%f4,	%f7
	nop
	setx	0xBF29F346D0767EB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	smul	%g6,	0x0717,	%l3
	movre	%o3,	0x231,	%l1
	add	%o4,	0x1A66,	%g4
	tl	%xcc,	0x0
	edge8ln	%i1,	%g7,	%g2
	sir	0x1457
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f25,	%f6,	%f6
	andn	%o0,	0x15EA,	%g3
	sll	%o6,	0x12,	%o1
	sdiv	%i5,	0x0704,	%i6
	tvc	%xcc,	0x1
	sll	%l2,	0x18,	%i0
	fabsd	%f8,	%f6
	fmovsl	%icc,	%f14,	%f5
	fones	%f15
	bvs	loop_2757
	tne	%icc,	0x0
	ldd	[%l7 + 0x08],	%f18
	tg	%icc,	0x2
loop_2757:
	edge8	%l4,	%l5,	%i2
	bcc,a	%xcc,	loop_2758
	movrgz	%o2,	%l6,	%o7
	addccc	%l0,	0x11FE,	%i4
	ta	%xcc,	0x0
loop_2758:
	and	%i7,	0x1776,	%g5
	srax	%o5,	%i3,	%g6
	fbo	%fcc3,	loop_2759
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f14
	membar	0x22
	te	%xcc,	0x1
loop_2759:
	brlez,a	%g1,	loop_2760
	fmovdge	%icc,	%f17,	%f11
	edge16l	%o3,	%l3,	%o4
	umul	%l1,	0x17E5,	%i1
loop_2760:
	alignaddr	%g7,	%g2,	%o0
	edge32l	%g3,	%g4,	%o6
	fpack32	%f28,	%f2,	%f6
	udivx	%i5,	0x144D,	%i6
	fmovsa	%icc,	%f7,	%f16
	edge16	%l2,	%o1,	%i0
	movleu	%icc,	%l4,	%l5
	brgez	%o2,	loop_2761
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l6,	%o7,	%i2
	andn	%l0,	0x096D,	%i7
loop_2761:
	edge16	%i4,	%o5,	%g5
	fcmpgt16	%f10,	%f4,	%g6
	fzero	%f22
	edge32l	%i3,	%g1,	%o3
	orncc	%l3,	%o4,	%i1
	brnz	%g7,	loop_2762
	fnor	%f8,	%f4,	%f14
	srlx	%l1,	%g2,	%g3
	alignaddrl	%g4,	%o6,	%o0
loop_2762:
	flush	%l7 + 0x48
	edge8l	%i5,	%l2,	%i6
	movg	%xcc,	%i0,	%l4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x52] %asi,	%l5
	movn	%xcc,	%o2,	%l6
	tl	%icc,	0x6
	fpadd32	%f0,	%f0,	%f6
	stbar
	set	0x14, %g5
	ldsha	[%l7 + %g5] 0x15,	%o7
	fbo	%fcc3,	loop_2763
	sll	%o1,	%i2,	%l0
	fandnot2s	%f11,	%f1,	%f12
	fmovrse	%i4,	%f19,	%f22
loop_2763:
	tleu	%xcc,	0x3
	fbu	%fcc2,	loop_2764
	fnand	%f12,	%f10,	%f16
	andcc	%i7,	0x188D,	%g5
	fbne,a	%fcc0,	loop_2765
loop_2764:
	movrne	%o5,	%g6,	%g1
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o3
loop_2765:
	st	%f16,	[%l7 + 0x20]
	ldub	[%l7 + 0x58],	%l3
	fblg,a	%fcc2,	loop_2766
	bleu,pn	%xcc,	loop_2767
	nop
	set	0x68, %g4
	std	%f28,	[%l7 + %g4]
	fands	%f3,	%f11,	%f16
loop_2766:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2767:
	array32	%o4,	%i1,	%g7
	movg	%xcc,	%i3,	%l1
	te	%xcc,	0x6
	addcc	%g2,	%g3,	%g4
	tgu	%xcc,	0x6
	set	0x2E, %i5
	lduha	[%l7 + %i5] 0x0c,	%o6
	movrgz	%i5,	%l2,	%i6
	fmovrdgz	%i0,	%f24,	%f6
	and	%o0,	0x18D7,	%l4
	sll	%o2,	%l5,	%l6
	movrlz	%o1,	0x18F,	%i2
	xorcc	%o7,	0x10C7,	%l0
	subccc	%i4,	0x094C,	%i7
	udivx	%o5,	0x1697,	%g5
	xnorcc	%g6,	%o3,	%g1
	movle	%xcc,	%l3,	%i1
	fmovrdlez	%o4,	%f24,	%f24
	te	%icc,	0x1
	tg	%icc,	0x0
	alignaddr	%i3,	%g7,	%l1
	sll	%g2,	%g3,	%o6
	bn	%icc,	loop_2768
	tpos	%xcc,	0x7
	edge32ln	%g4,	%i5,	%i6
	movre	%i0,	%l2,	%l4
loop_2768:
	fbn	%fcc2,	loop_2769
	lduh	[%l7 + 0x10],	%o2
	nop
	setx	0x706474BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	edge8l	%o0,	%l6,	%o1
loop_2769:
	fbue	%fcc0,	loop_2770
	edge8l	%i2,	%l5,	%l0
	fandnot2	%f6,	%f0,	%f30
	tne	%xcc,	0x0
loop_2770:
	xorcc	%o7,	%i4,	%i7
	membar	0x36
	prefetch	[%l7 + 0x34],	 0x3
	fornot1s	%f24,	%f20,	%f18
	fbl,a	%fcc0,	loop_2771
	tg	%icc,	0x2
	edge16ln	%g5,	%g6,	%o5
	nop
	fitos	%f7,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f0
loop_2771:
	array16	%g1,	%o3,	%i1
	set	0x40, %g1
	lduha	[%l7 + %g1] 0x81,	%l3
	movrgz	%i3,	0x32C,	%g7
	movleu	%icc,	%o4,	%g2
	movle	%icc,	%l1,	%o6
	fbo	%fcc3,	loop_2772
	tneg	%xcc,	0x3
	xorcc	%g3,	%i5,	%g4
	bneg,a	%xcc,	loop_2773
loop_2772:
	sdivcc	%i0,	0x1F68,	%i6
	movrlz	%l2,	0x2CB,	%o2
	ldsw	[%l7 + 0x68],	%o0
loop_2773:
	taddcctv	%l6,	%o1,	%l4
	fexpand	%f23,	%f2
	movg	%icc,	%i2,	%l5
	tle	%xcc,	0x5
	movrlz	%o7,	0x106,	%l0
	bcs,a,pn	%icc,	loop_2774
	smulcc	%i7,	0x0987,	%g5
	srl	%i4,	%g6,	%o5
	taddcc	%o3,	0x047D,	%i1
loop_2774:
	nop
	set	0x44, %l2
	lduwa	[%l7 + %l2] 0x18,	%g1
	movleu	%icc,	%l3,	%g7
	taddcctv	%o4,	0x037C,	%g2
	mulx	%i3,	0x09CC,	%o6
	umul	%g3,	%l1,	%i5
	ldsb	[%l7 + 0x60],	%g4
	brgz	%i0,	loop_2775
	faligndata	%f28,	%f8,	%f18
	edge32ln	%i6,	%o2,	%o0
	brnz,a	%l6,	loop_2776
loop_2775:
	bleu,a	%xcc,	loop_2777
	tleu	%icc,	0x0
	edge32	%l2,	%o1,	%i2
loop_2776:
	edge32l	%l4,	%o7,	%l5
loop_2777:
	tg	%xcc,	0x1
	bgu,a	loop_2778
	edge8l	%i7,	%g5,	%l0
	fxnor	%f6,	%f20,	%f26
	movrlez	%i4,	%g6,	%o3
loop_2778:
	tvc	%icc,	0x5
	subccc	%o5,	%i1,	%l3
	movne	%xcc,	%g7,	%g1
	array16	%o4,	%i3,	%o6
	fmuld8ulx16	%f2,	%f7,	%f12
	set	0x60, %i7
	stba	%g3,	[%l7 + %i7] 0x15
	ldstub	[%l7 + 0x1B],	%l1
	movrlz	%i5,	0x038,	%g2
	tg	%icc,	0x6
	fnot2s	%f12,	%f13
	tge	%icc,	0x7
	fcmple32	%f16,	%f14,	%i0
	movn	%icc,	%g4,	%i6
	movrgz	%o2,	%o0,	%l2
	movre	%o1,	%l6,	%i2
	udiv	%o7,	0x1B18,	%l4
	xor	%i7,	%g5,	%l0
	mova	%xcc,	%l5,	%g6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%o3
	edge32n	%i4,	%o5,	%l3
	movcs	%icc,	%g7,	%g1
	bgu,pn	%xcc,	loop_2779
	bvs,a,pt	%icc,	loop_2780
	te	%icc,	0x0
	movge	%xcc,	%o4,	%i3
loop_2779:
	fbne,a	%fcc2,	loop_2781
loop_2780:
	tneg	%xcc,	0x4
	st	%f28,	[%l7 + 0x68]
	bgu,pt	%icc,	loop_2782
loop_2781:
	addc	%o6,	0x004B,	%i1
	smul	%g3,	%i5,	%g2
	nop
	setx	0xBB3B8B5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xAC9C3522,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f11,	%f7
loop_2782:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x24] %asi
	fandnot1s	%f30,	%f3,	%f26
	movgu	%icc,	%l1,	%i6
	edge8n	%g4,	%o2,	%l2
	alignaddr	%o1,	%o0,	%l6
	array8	%i2,	%l4,	%o7
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	membar	0x32
	smulcc	%g5,	%l0,	%l5
	nop
	setx	0x4C7352EA642B5374,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3E59340F7E497437,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f14,	%f2
	fcmpgt32	%f12,	%f10,	%g6
	fmovdl	%xcc,	%f2,	%f18
	mulscc	%i4,	%o5,	%o3
	movg	%icc,	%g7,	%l3
	set	0x50, %o2
	stxa	%o4,	[%l7 + %o2] 0x18
	fmovdcc	%xcc,	%f26,	%f25
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%o6
	fmovdneg	%xcc,	%f9,	%f21
	andn	%i1,	0x049E,	%i3
	fbo,a	%fcc2,	loop_2783
	bcc,pt	%icc,	loop_2784
	movrgez	%i5,	0x0D7,	%g3
	set	0x4D, %l1
	stba	%g2,	[%l7 + %l1] 0x23
	membar	#Sync
loop_2783:
	lduh	[%l7 + 0x4E],	%i0
loop_2784:
	flush	%l7 + 0x38
	movcc	%icc,	%l1,	%i6
	movne	%xcc,	%g4,	%o2
	ldub	[%l7 + 0x0B],	%l2
	fbge	%fcc1,	loop_2785
	fcmpne32	%f22,	%f24,	%o1
	fmovsne	%xcc,	%f7,	%f27
	flush	%l7 + 0x54
loop_2785:
	andncc	%o0,	%l6,	%i2
	bneg	loop_2786
	subccc	%o7,	%i7,	%l4
	movvs	%icc,	%g5,	%l0
	tg	%icc,	0x4
loop_2786:
	fmovdg	%icc,	%f29,	%f2
	faligndata	%f30,	%f28,	%f20
	fmovda	%icc,	%f11,	%f20
	tsubcc	%g6,	0x02B1,	%i4
	nop
	setx	loop_2787,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32	%f22,	%f8,	%f26
	bneg,a,pt	%icc,	loop_2788
	tsubcc	%l5,	0x0043,	%o5
loop_2787:
	edge16ln	%g7,	%o3,	%l3
	ldstub	[%l7 + 0x2F],	%g1
loop_2788:
	movrgz	%o6,	%i1,	%o4
	orncc	%i5,	0x1DAA,	%i3
	membar	0x75
	orncc	%g3,	%i0,	%l1
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	tl	%icc,	0x0
	tpos	%icc,	0x0
	array32	%g2,	%i6,	%g4
	wr	%g0,	0x80,	%asi
	stwa	%l2,	[%l7 + 0x6C] %asi
	fpadd16	%f22,	%f4,	%f20
	xnor	%o1,	%o0,	%o2
	movrgz	%l6,	0x3DA,	%o7
	ldstub	[%l7 + 0x74],	%i7
	srax	%l4,	0x12,	%i2
	faligndata	%f0,	%f18,	%f18
	fandnot2	%f8,	%f22,	%f2
	fmovscc	%icc,	%f7,	%f13
	bg,pn	%icc,	loop_2789
	fmul8x16au	%f18,	%f31,	%f8
	movvs	%xcc,	%l0,	%g6
	movrgz	%i4,	%g5,	%o5
loop_2789:
	sdivcc	%l5,	0x00CF,	%o3
	set	0x360, %o4
	nop 	! 	nop 	! 	ldxa	[%g0 + %o4] 0x40,	%g7 ripped by fixASI40.pl ripped by fixASI40.pl
	subcc	%l3,	%o6,	%i1
	bge	loop_2790
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f18
	ld	[%l7 + 0x30],	%f6
	mulscc	%o4,	%i5,	%i3
loop_2790:
	movpos	%icc,	%g1,	%i0
	xor	%l1,	0x0596,	%g3
	subc	%g2,	0x0B0F,	%i6
	and	%l2,	0x0F55,	%g4
	movpos	%icc,	%o1,	%o0
	movcs	%icc,	%l6,	%o7
	fmovsge	%icc,	%f20,	%f12
	orn	%i7,	%l4,	%o2
	set	0x48, %i2
	stxa	%l0,	[%l7 + %i2] 0x2f
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%i4
	set	0x0A, %g6
	lduba	[%l7 + %g6] 0x18,	%g5
	edge16n	%i2,	%l5,	%o3
	tvs	%xcc,	0x2
	fpsub16	%f12,	%f22,	%f2
	movvc	%xcc,	%g7,	%l3
	tneg	%icc,	0x1
	fcmpeq32	%f18,	%f10,	%o5
	fone	%f4
	array32	%i1,	%o4,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	%icc,	loop_2791
	edge16ln	%i3,	%g1,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f10,	%f27,	%f22
loop_2791:
	sdiv	%o6,	0x1122,	%g3
	movn	%xcc,	%g2,	%i6
	mulscc	%l2,	%l1,	%g4
	ta	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o0
	movn	%icc,	%l6,	%o1
	tl	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x48] %asi,	%f20
	fmovdcc	%xcc,	%f30,	%f17
	array8	%o7,	%i7,	%o2
	fcmpgt16	%f14,	%f22,	%l0
	sir	0x18F8
	or	%g6,	%l4,	%i4
	sdivcc	%i2,	0x070A,	%g5
	movcc	%xcc,	%o3,	%l5
	fpadd16	%f18,	%f0,	%f28
	movpos	%xcc,	%l3,	%o5
	fsrc2s	%f10,	%f13
	ta	%xcc,	0x0
	sll	%i1,	%o4,	%g7
	edge32n	%i3,	%g1,	%i0
	sdiv	%i5,	0x0EB0,	%g3
	array16	%g2,	%o6,	%l2
	edge8n	%i6,	%l1,	%o0
	fcmpne32	%f22,	%f12,	%l6
	tsubcctv	%g4,	0x1ABE,	%o1
	mova	%xcc,	%i7,	%o7
	movge	%icc,	%o2,	%l0
	fbge	%fcc3,	loop_2792
	movne	%icc,	%l4,	%g6
	fbue	%fcc3,	loop_2793
	sdiv	%i2,	0x0451,	%i4
loop_2792:
	fmovdcs	%icc,	%f7,	%f21
	sub	%o3,	%g5,	%l5
loop_2793:
	movne	%xcc,	%o5,	%l3
	brlz,a	%i1,	loop_2794
	fmovrsgez	%o4,	%f27,	%f5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x18] %asi,	%f22
loop_2794:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g7
	taddcc	%i3,	0x18DF,	%i0
	ta	%icc,	0x4
	edge32	%g1,	%i5,	%g3
	stbar
	fbule	%fcc1,	loop_2795
	popc	0x1059,	%o6
	popc	0x10DA,	%l2
	orcc	%g2,	0x08CF,	%l1
loop_2795:
	andncc	%o0,	%i6,	%g4
	be,a,pt	%xcc,	loop_2796
	fpadd16	%f28,	%f16,	%f18
	edge16l	%l6,	%o1,	%o7
	bl,a,pn	%icc,	loop_2797
loop_2796:
	movvs	%icc,	%i7,	%l0
	sllx	%l4,	0x1C,	%g6
	orncc	%i2,	%o2,	%o3
loop_2797:
	fmovsl	%xcc,	%f16,	%f22
	bvs	%xcc,	loop_2798
	udivcc	%i4,	0x074A,	%g5
	movg	%icc,	%l5,	%l3
	edge8ln	%o5,	%i1,	%g7
loop_2798:
	tsubcc	%o4,	0x02CD,	%i3
	tl	%xcc,	0x1
	edge32l	%g1,	%i5,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x2
	smulcc	%i0,	%l2,	%g2
	nop
	fitos	%f8,	%f10
	fstoi	%f10,	%f17
	edge16ln	%l1,	%o0,	%o6
	tvs	%icc,	0x5
	edge16l	%g4,	%i6,	%o1
	alignaddr	%o7,	%i7,	%l6
	movrlz	%l4,	%l0,	%i2
	mulx	%o2,	0x0B8A,	%o3
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f4
	set	0x14, %i3
	ldswa	[%l7 + %i3] 0x15,	%i4
	ldd	[%l7 + 0x78],	%f18
	edge32ln	%g6,	%l5,	%l3
	array8	%o5,	%i1,	%g7
	bneg,a,pn	%icc,	loop_2799
	fabsd	%f8,	%f10
	tne	%xcc,	0x1
	movl	%icc,	%o4,	%g5
loop_2799:
	xnor	%g1,	0x0A2C,	%i3
	brlz,a	%g3,	loop_2800
	ba	%xcc,	loop_2801
	movvc	%xcc,	%i5,	%l2
	sdivcc	%i0,	0x01A3,	%l1
loop_2800:
	movleu	%icc,	%g2,	%o0
loop_2801:
	bl,a	loop_2802
	srlx	%g4,	%i6,	%o1
	addc	%o7,	0x0A52,	%i7
	xnor	%o6,	%l4,	%l6
loop_2802:
	array32	%l0,	%i2,	%o2
	tneg	%icc,	0x7
	tsubcctv	%i4,	0x00D3,	%o3
	move	%xcc,	%g6,	%l5
	fbule,a	%fcc2,	loop_2803
	bne	loop_2804
	faligndata	%f26,	%f8,	%f12
	fors	%f21,	%f3,	%f7
loop_2803:
	movge	%xcc,	%o5,	%i1
loop_2804:
	tn	%icc,	0x4
	stbar
	movvs	%icc,	%g7,	%o4
	movn	%xcc,	%g5,	%g1
	xor	%l3,	%i3,	%i5
	sdiv	%g3,	0x0E66,	%i0
	movge	%xcc,	%l2,	%g2
	ba	%xcc,	loop_2805
	alignaddrl	%l1,	%o0,	%i6
	mulscc	%g4,	0x1C58,	%o1
	prefetch	[%l7 + 0x40],	 0x1
loop_2805:
	edge16n	%i7,	%o6,	%o7
	udivx	%l4,	0x11D0,	%l6
	movneg	%xcc,	%l0,	%i2
	sdiv	%i4,	0x1ABC,	%o2
	fmovsge	%icc,	%f14,	%f7
	wr	%g0,	0x89,	%asi
	stha	%g6,	[%l7 + 0x76] %asi
	bge	%xcc,	loop_2806
	popc	0x1384,	%l5
	edge32l	%o5,	%i1,	%g7
	mulx	%o4,	%o3,	%g1
loop_2806:
	smul	%l3,	%g5,	%i3
	subc	%g3,	0x0B13,	%i5
	bcs,pn	%icc,	loop_2807
	brlez,a	%i0,	loop_2808
	ld	[%l7 + 0x10],	%f1
	fbug,a	%fcc3,	loop_2809
loop_2807:
	movre	%l2,	0x08E,	%g2
loop_2808:
	fbne,a	%fcc0,	loop_2810
	fble	%fcc0,	loop_2811
loop_2809:
	sir	0x0D57
	fandnot1	%f4,	%f26,	%f18
loop_2810:
	edge32n	%l1,	%i6,	%o0
loop_2811:
	tsubcctv	%g4,	%o1,	%o6
	fexpand	%f18,	%f6
	smulcc	%i7,	%l4,	%o7
	srl	%l6,	0x1C,	%i2
	fbg	%fcc1,	loop_2812
	nop
	setx	0x48070998,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x607D4DFC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f25,	%f30
	prefetch	[%l7 + 0x4C],	 0x1
	movrne	%l0,	%i4,	%o2
loop_2812:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
	tcs	%xcc,	0x0
	smulcc	%l5,	0x1A6B,	%o5
	tvc	%xcc,	0x6
	tg	%xcc,	0x3
	movl	%xcc,	%g7,	%i1
	fmovsl	%icc,	%f23,	%f9
	andncc	%o4,	%g1,	%o3
	bgu,a	%xcc,	loop_2813
	fpadd32s	%f5,	%f8,	%f0
	tne	%icc,	0x1
	fmovdgu	%xcc,	%f12,	%f25
loop_2813:
	andn	%g5,	%l3,	%g3
	fbul,a	%fcc2,	loop_2814
	tvs	%xcc,	0x7
	nop
	setx	0x804FBC8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	stbar
loop_2814:
	tne	%icc,	0x4
	edge16	%i5,	%i0,	%l2
	andcc	%i3,	0x1515,	%l1
	taddcc	%i6,	%g2,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_2815
	movpos	%xcc,	%o0,	%o1
	tneg	%xcc,	0x3
	sethi	0x131B,	%o6
loop_2815:
	mulx	%l4,	0x1276,	%i7
	tge	%xcc,	0x0
	tcc	%xcc,	0x0
	xor	%l6,	0x18CC,	%i2
	swap	[%l7 + 0x30],	%l0
	fnot1	%f2,	%f24
	umulcc	%i4,	0x0E22,	%o7
	wr	%g0,	0x57,	%asi
	stxa	%g6,	[%g0 + 0x0] %asi
	taddcc	%o2,	%o5,	%g7
	fmovsg	%icc,	%f10,	%f9
	tge	%xcc,	0x0
	movcc	%xcc,	%i1,	%o4
	nop
	setx	loop_2816,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitos	%f4,	%f25
	fstod	%f25,	%f14
	fmovse	%xcc,	%f23,	%f15
	array8	%l5,	%g1,	%g5
loop_2816:
	fmovscc	%icc,	%f27,	%f14
	fmovrslez	%l3,	%f18,	%f18
	fpadd32	%f30,	%f30,	%f12
	array16	%g3,	%o3,	%i0
	smulcc	%i5,	0x0EA5,	%i3
	ldx	[%l7 + 0x68],	%l2
	nop
	setx	loop_2817,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l1,	0x123A,	%g2
	orcc	%i6,	0x1014,	%g4
	fmovsvc	%icc,	%f8,	%f30
loop_2817:
	fmovsa	%xcc,	%f5,	%f6
	mova	%xcc,	%o0,	%o1
	xor	%l4,	0x1018,	%o6
	fbe	%fcc2,	loop_2818
	bvs,a,pt	%xcc,	loop_2819
	fpsub32s	%f17,	%f16,	%f25
	fmovrdne	%i7,	%f12,	%f4
loop_2818:
	nop
	set	0x35, %o7
	stba	%l6,	[%l7 + %o7] 0x15
loop_2819:
	movle	%xcc,	%i2,	%l0
	fbl	%fcc1,	loop_2820
	nop
	fitos	%f1,	%f10
	fstod	%f10,	%f6
	mulscc	%i4,	%g6,	%o7
	bl,pt	%icc,	loop_2821
loop_2820:
	alignaddrl	%o5,	%o2,	%i1
	nop
	fitod	%f2,	%f4
	fdtos	%f4,	%f0
	flush	%l7 + 0x5C
loop_2821:
	movne	%icc,	%o4,	%l5
	fbe	%fcc2,	loop_2822
	call	loop_2823
	array32	%g7,	%g5,	%l3
	edge8n	%g3,	%o3,	%i0
loop_2822:
	movn	%xcc,	%g1,	%i3
loop_2823:
	movrgez	%l2,	%i5,	%g2
	andcc	%i6,	%l1,	%o0
	ble,a,pt	%icc,	loop_2824
	st	%f25,	[%l7 + 0x50]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%g4
loop_2824:
	alignaddrl	%o6,	%i7,	%l6
	tcc	%xcc,	0x5
	sdivcc	%i2,	0x09F7,	%l0
	fbul	%fcc0,	loop_2825
	move	%xcc,	%l4,	%g6
	sdivx	%i4,	0x1BDD,	%o5
	movpos	%xcc,	%o2,	%o7
loop_2825:
	fandnot1s	%f16,	%f13,	%f12
	mulscc	%i1,	%o4,	%g7
	set	0x25, %o1
	ldstuba	[%l7 + %o1] 0x04,	%l5
	movrgez	%l3,	%g5,	%g3
	edge32	%i0,	%o3,	%g1
	mulscc	%l2,	0x057F,	%i3
	set	0x70, %l4
	lduha	[%l7 + %l4] 0x80,	%g2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%l1
	movcs	%xcc,	%i5,	%o1
	fpsub32s	%f18,	%f14,	%f5
	set	0x20, %g2
	lduwa	[%l7 + %g2] 0x15,	%g4
	srl	%o6,	0x09,	%i7
	set	0x63, %i0
	ldsba	[%l7 + %i0] 0x19,	%o0
	addc	%i2,	0x0EF3,	%l0
	sllx	%l6,	0x01,	%g6
	smul	%l4,	%i4,	%o5
	lduh	[%l7 + 0x3E],	%o2
	tvs	%icc,	0x4
	fmovdvs	%icc,	%f19,	%f22
	movrlez	%o7,	0x281,	%o4
	ldub	[%l7 + 0x0A],	%i1
	alignaddr	%g7,	%l5,	%g5
	mulx	%g3,	%l3,	%o3
	edge32	%i0,	%g1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f30,	%f26,	%g2
	movcc	%xcc,	%i6,	%l1
	fnors	%f1,	%f21,	%f29
	fxor	%f0,	%f2,	%f20
	bcs	%icc,	loop_2826
	tsubcc	%i3,	%i5,	%g4
	subcc	%o1,	0x053C,	%o6
	movrlz	%i7,	%i2,	%o0
loop_2826:
	movrlz	%l0,	%l6,	%g6
	fandnot2s	%f25,	%f31,	%f27
	fmovdcs	%xcc,	%f29,	%f18
	fmovdcs	%icc,	%f25,	%f23
	xorcc	%l4,	0x0875,	%i4
	sll	%o5,	%o7,	%o2
	edge16	%o4,	%g7,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f12,	%f6,	%f12
	fnand	%f12,	%f12,	%f2
	subcc	%l5,	%g5,	%g3
	umulcc	%l3,	0x18A0,	%o3
	fabss	%f25,	%f31
	sub	%i0,	%g1,	%l2
	tge	%icc,	0x6
	tne	%icc,	0x0
	fmovdcs	%xcc,	%f26,	%f10
	nop
	setx	0x7D99447CEEE973A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xAAE7DFD5388DA52C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f10,	%f10
	fnegs	%f9,	%f1
	array8	%i6,	%g2,	%i3
	fsrc2	%f22,	%f10
	tl	%icc,	0x5
	movne	%icc,	%l1,	%i5
	fbn,a	%fcc1,	loop_2827
	srax	%g4,	%o6,	%o1
	movrlz	%i7,	0x0CB,	%i2
	te	%xcc,	0x7
loop_2827:
	sdiv	%o0,	0x18A8,	%l0
	andncc	%g6,	%l6,	%l4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f10
	edge32l	%i4,	%o5,	%o7
	ldsb	[%l7 + 0x52],	%o2
	subcc	%o4,	%g7,	%l5
	movrgez	%g5,	%g3,	%i1
	fmovrsgz	%o3,	%f29,	%f23
	movrne	%i0,	0x064,	%l3
	edge16ln	%g1,	%l2,	%i6
	movrlez	%i3,	%g2,	%l1
	sth	%g4,	[%l7 + 0x74]
	umul	%i5,	0x13FD,	%o1
	alignaddrl	%i7,	%i2,	%o6
	set	0x33, %o3
	ldsba	[%l7 + %o3] 0x0c,	%o0
	add	%l0,	0x1C66,	%l6
	srax	%l4,	0x05,	%i4
	taddcc	%o5,	%g6,	%o7
	sllx	%o4,	%g7,	%o2
	fornot1	%f6,	%f20,	%f28
	subc	%l5,	%g5,	%i1
	nop
	fitos	%f7,	%f16
	fstod	%f16,	%f20
	xnorcc	%g3,	%o3,	%i0
	lduh	[%l7 + 0x72],	%g1
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0x1
	fexpand	%f3,	%f24
	popc	0x011D,	%l2
	add	%i3,	0x1448,	%i6
	movleu	%xcc,	%l1,	%g2
	tvc	%icc,	0x3
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i5
	fmovrdlz	%g4,	%f0,	%f4
	edge8l	%i7,	%o1,	%o6
	ta	%xcc,	0x5
	edge16n	%o0,	%l0,	%i2
	fnors	%f22,	%f19,	%f22
	mulscc	%l4,	0x0E4D,	%l6
	sub	%i4,	%g6,	%o5
	edge8l	%o4,	%g7,	%o7
	addcc	%o2,	0x1427,	%g5
	fpadd32s	%f9,	%f24,	%f3
	brgz	%l5,	loop_2828
	fsrc1	%f26,	%f12
	set	0x4C, %o5
	ldswa	[%l7 + %o5] 0x81,	%i1
loop_2828:
	fbn	%fcc1,	loop_2829
	addcc	%o3,	0x02FB,	%g3
	brnz,a	%i0,	loop_2830
	fble,a	%fcc0,	loop_2831
loop_2829:
	add	%l3,	0x0147,	%l2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i3
loop_2830:
	tcc	%xcc,	0x6
loop_2831:
	addc	%i6,	%l1,	%g2
	umulcc	%g1,	%i5,	%i7
	fmovsa	%icc,	%f14,	%f7
	addcc	%g4,	%o6,	%o1
	lduw	[%l7 + 0x64],	%l0
	movrgez	%o0,	%l4,	%l6
	fbo,a	%fcc1,	loop_2832
	fones	%f0
	srl	%i2,	0x02,	%i4
	udiv	%o5,	0x03C4,	%o4
loop_2832:
	fornot2	%f2,	%f8,	%f2
	tsubcc	%g7,	0x1E9A,	%g6
	movcc	%xcc,	%o2,	%o7
	sir	0x1ECE
	andcc	%l5,	0x150B,	%g5
	std	%f30,	[%l7 + 0x08]
	fmovdn	%xcc,	%f24,	%f4
	xnor	%i1,	0x09A0,	%g3
	fmovrdgz	%o3,	%f18,	%f8
	edge8l	%l3,	%i0,	%i3
	udivcc	%i6,	0x0273,	%l1
	andcc	%l2,	%g1,	%g2
	fmuld8ulx16	%f8,	%f4,	%f30
	array8	%i7,	%i5,	%g4
	fmovrsgz	%o1,	%f0,	%f4
	fbug,a	%fcc2,	loop_2833
	ldd	[%l7 + 0x18],	%f16
	tle	%xcc,	0x5
	bgu,a	loop_2834
loop_2833:
	bneg,a	%icc,	loop_2835
	fandnot2s	%f10,	%f7,	%f20
	sdiv	%l0,	0x1778,	%o6
loop_2834:
	addccc	%o0,	0x14DA,	%l4
loop_2835:
	nop
	set	0x48, %g7
	std	%f28,	[%l7 + %g7]
	smulcc	%i2,	0x06AF,	%i4
	popc	0x0BE5,	%l6
	fmovrslz	%o5,	%f30,	%f31
	sdivcc	%o4,	0x0409,	%g7
	fbu	%fcc2,	loop_2836
	edge16ln	%o2,	%g6,	%l5
	edge16	%o7,	%i1,	%g5
	udivx	%g3,	0x1014,	%o3
loop_2836:
	subccc	%i0,	%i3,	%l3
	subcc	%i6,	0x1AB7,	%l1
	fcmpne16	%f18,	%f28,	%l2
	umulcc	%g2,	0x1A8E,	%g1
	brnz	%i7,	loop_2837
	movrlez	%g4,	0x033,	%o1
	movvc	%icc,	%l0,	%o6
	ldd	[%l7 + 0x78],	%o0
loop_2837:
	movne	%xcc,	%l4,	%i5
	fmovdg	%icc,	%f29,	%f25
	movrlez	%i4,	0x0F7,	%i2
	ba,pn	%icc,	loop_2838
	edge32ln	%l6,	%o4,	%g7
	orcc	%o2,	0x02AA,	%g6
	sethi	0x18A5,	%l5
loop_2838:
	fmovs	%f6,	%f2
	udivcc	%o5,	0x0928,	%o7
	fxnors	%f5,	%f9,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%xcc,	%f18,	%f3
	fmovdcs	%icc,	%f9,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f8,	%f26,	%f10
	tsubcc	%g5,	0x0EAB,	%g3
	fpadd16s	%f4,	%f31,	%f20
	nop
	fitos	%f14,	%f29
	fstox	%f29,	%f26
	fxtos	%f26,	%f11
	fbuge	%fcc2,	loop_2839
	movcc	%xcc,	%i1,	%o3
	udivx	%i3,	0x00DB,	%l3
	fmovdcc	%xcc,	%f13,	%f29
loop_2839:
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f7
	tcs	%xcc,	0x0
	andncc	%i6,	%l1,	%l2
	umulcc	%i0,	%g2,	%i7
	tsubcctv	%g1,	%o1,	%l0
	edge32ln	%o6,	%g4,	%o0
	tsubcctv	%i5,	%i4,	%i2
	fornot2s	%f2,	%f8,	%f9
	mulscc	%l6,	%l4,	%o4
	nop
	fitod	%f18,	%f22
	edge32l	%g7,	%g6,	%o2
	movvc	%xcc,	%o5,	%l5
	movrne	%o7,	0x1E9,	%g3
	set	0x30, %o0
	swapa	[%l7 + %o0] 0x0c,	%i1
	lduw	[%l7 + 0x3C],	%o3
	fmul8x16al	%f17,	%f28,	%f24
	fpack32	%f24,	%f12,	%f22
	srl	%i3,	0x05,	%l3
	fmovs	%f13,	%f25
	fsrc2	%f2,	%f20
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%g5
	fmovrdlz	%i6,	%f2,	%f8
	mova	%icc,	%l2,	%i0
	fandnot1	%f6,	%f4,	%f14
	fmovde	%icc,	%f6,	%f31
	fpmerge	%f8,	%f19,	%f14
	prefetch	[%l7 + 0x38],	 0x3
	pdist	%f26,	%f4,	%f14
	tge	%icc,	0x6
	or	%l1,	0x137C,	%g2
	edge32l	%g1,	%i7,	%l0
	tn	%xcc,	0x7
	orncc	%o1,	%o6,	%g4
	tn	%xcc,	0x7
	tge	%icc,	0x3
	nop
	set	0x27, %i4
	ldstub	[%l7 + %i4],	%o0
	movge	%xcc,	%i5,	%i4
	fmovsa	%xcc,	%f11,	%f24
	movre	%l6,	0x383,	%l4
	sll	%o4,	%i2,	%g6
	addcc	%o2,	%g7,	%o5
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovdg	%icc,	%f4,	%f16
	tl	%icc,	0x7
	tvs	%xcc,	0x5
	movvs	%icc,	%o7,	%l5
	subc	%g3,	%o3,	%i3
	movrlez	%l3,	%g5,	%i6
	stw	%l2,	[%l7 + 0x74]
	sdivcc	%i1,	0x1C03,	%i0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%l1
	bneg,a,pt	%xcc,	loop_2840
	edge16	%g1,	%g2,	%l0
	sll	%i7,	0x00,	%o6
	movne	%xcc,	%g4,	%o1
loop_2840:
	brgz	%i5,	loop_2841
	edge16	%i4,	%l6,	%o0
	sdiv	%o4,	0x0027,	%i2
	ldd	[%l7 + 0x58],	%f12
loop_2841:
	subc	%l4,	0x00DB,	%o2
	tvc	%icc,	0x4
	fmovda	%icc,	%f2,	%f18
	brz	%g7,	loop_2842
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%g6
	movvc	%xcc,	%o7,	%o5
	fcmple32	%f0,	%f8,	%l5
loop_2842:
	fpack32	%f12,	%f2,	%f8
	bn	%icc,	loop_2843
	tle	%icc,	0x6
	fbo,a	%fcc1,	loop_2844
	fmovdvc	%icc,	%f16,	%f25
loop_2843:
	fpsub32s	%f13,	%f0,	%f2
	fbug,a	%fcc2,	loop_2845
loop_2844:
	addcc	%o3,	0x135D,	%g3
	fbuge,a	%fcc1,	loop_2846
	fors	%f24,	%f0,	%f17
loop_2845:
	sll	%i3,	0x17,	%g5
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f18
	fxtos	%f18,	%f15
loop_2846:
	subc	%i6,	0x19AB,	%l2
	tle	%icc,	0x2
	add	%i1,	0x0103,	%l3
	tgu	%xcc,	0x1
	array16	%l1,	%g1,	%g2
	fands	%f21,	%f14,	%f24
	sethi	0x1F02,	%l0
	movre	%i7,	0x3AA,	%o6
	mulx	%i0,	%o1,	%i5
	edge16	%g4,	%l6,	%o0
	set	0x28, %l6
	prefetcha	[%l7 + %l6] 0x10,	 0x2
	wr	%g0,	0x04,	%asi
	stba	%o4,	[%l7 + 0x6D] %asi
	nop
	setx	0xAFD2A8DCBFB0887B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x13B3ECDE887179E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f2,	%f14
	fmovrsne	%i2,	%f28,	%f3
	fmovdge	%xcc,	%f1,	%f12
	nop
	setx	0x9ABFD880,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x659642B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f9,	%f20
	xor	%l4,	0x06B2,	%o2
	sth	%g7,	[%l7 + 0x40]
	bne,pt	%xcc,	loop_2847
	fnegs	%f5,	%f7
	bgu,a	loop_2848
	addc	%g6,	%o7,	%l5
loop_2847:
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%o3
	sdivx	%g3,	0x1DD3,	%o5
loop_2848:
	movleu	%icc,	%g5,	%i3
	edge8	%i6,	%i1,	%l2
	set	0x8, %l3
	stxa	%l1,	[%g0 + %l3] 0x21
	fnot1s	%f30,	%f19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc0,	loop_2849
	subc	%l3,	%g2,	%g1
	movrlez	%l0,	0x182,	%i7
	orncc	%o6,	%i0,	%o1
loop_2849:
	bleu	%icc,	loop_2850
	nop
	setx	0x50D4FD67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xDF8F69FC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f11,	%f17
	tleu	%icc,	0x6
	tne	%xcc,	0x0
loop_2850:
	ldsh	[%l7 + 0x48],	%g4
	movcs	%xcc,	%l6,	%o0
	wr	%g0,	0x80,	%asi
	stwa	%i4,	[%l7 + 0x08] %asi
	call	loop_2851
	sll	%i5,	%i2,	%l4
	fandnot2	%f16,	%f24,	%f2
	nop
	setx	0x9F533ED7D05EEA64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_2851:
	sir	0x199E
	movg	%xcc,	%o4,	%o2
	sllx	%g6,	0x17,	%g7
	sir	0x0F76
	tcs	%xcc,	0x2
	tgu	%icc,	0x6
	array8	%l5,	%o3,	%g3
	sub	%o7,	0x1C37,	%o5
	fmovdl	%xcc,	%f6,	%f18
	udivcc	%g5,	0x1964,	%i6
	orn	%i3,	0x0A2B,	%l2
	lduw	[%l7 + 0x38],	%l1
	edge8ln	%l3,	%g2,	%i1
	edge16ln	%g1,	%l0,	%i7
	tl	%xcc,	0x1
	ldsb	[%l7 + 0x38],	%o6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x17
	membar	#Sync
	fmovsn	%icc,	%f15,	%f11
	tvc	%xcc,	0x3
	fbul	%fcc1,	loop_2852
	tleu	%xcc,	0x1
	umul	%i0,	0x07A5,	%o1
	ldx	[%l7 + 0x38],	%g4
loop_2852:
	sra	%o0,	%l6,	%i4
	addcc	%i2,	%i5,	%o4
	fmovsle	%xcc,	%f0,	%f8
	movle	%icc,	%o2,	%l4
	fxnor	%f18,	%f26,	%f22
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g6
	tl	%icc,	0x1
	fmovsge	%icc,	%f1,	%f18
	tneg	%icc,	0x0
	sir	0x055C
	faligndata	%f10,	%f26,	%f26
	array8	%l5,	%o3,	%g3
	brnz	%g7,	loop_2853
	brlz,a	%o7,	loop_2854
	movvc	%icc,	%g5,	%o5
	mulx	%i3,	0x1D2C,	%i6
loop_2853:
	nop
	fitos	%f6,	%f19
	fstox	%f19,	%f14
	fxtos	%f14,	%f14
loop_2854:
	sll	%l1,	0x09,	%l3
	fbule	%fcc2,	loop_2855
	ldsw	[%l7 + 0x64],	%l2
	fmovdle	%xcc,	%f20,	%f18
	umulcc	%g2,	%g1,	%l0
loop_2855:
	fmul8sux16	%f18,	%f4,	%f30
	te	%xcc,	0x0
	fbuge,a	%fcc0,	loop_2856
	lduw	[%l7 + 0x08],	%i1
	tle	%xcc,	0x1
	popc	0x105B,	%i7
loop_2856:
	tgu	%icc,	0x6
	set	0x2C, %i1
	sta	%f4,	[%l7 + %i1] 0x14
	mulscc	%i0,	%o6,	%g4
	tvc	%icc,	0x1
	tpos	%icc,	0x4
	fbuge,a	%fcc0,	loop_2857
	edge32	%o0,	%l6,	%o1
	movn	%xcc,	%i2,	%i4
	tge	%icc,	0x4
loop_2857:
	edge16	%o4,	%i5,	%l4
	edge16	%g6,	%o2,	%o3
	fmul8x16au	%f5,	%f24,	%f8
	fbue,a	%fcc2,	loop_2858
	bcc	%xcc,	loop_2859
	bcc,a,pt	%xcc,	loop_2860
	fnands	%f25,	%f2,	%f23
loop_2858:
	flush	%l7 + 0x60
loop_2859:
	bgu,a,pn	%xcc,	loop_2861
loop_2860:
	ld	[%l7 + 0x60],	%f26
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x40] %asi,	%g3
loop_2861:
	andcc	%l5,	0x06BF,	%o7
	sdivcc	%g5,	0x1DB0,	%g7
	edge8l	%o5,	%i6,	%i3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x68] %asi,	%f0
	fmovsneg	%xcc,	%f12,	%f13
	movne	%xcc,	%l1,	%l2
	fmul8x16	%f25,	%f4,	%f30
	edge8ln	%l3,	%g2,	%g1
	fble,a	%fcc1,	loop_2862
	fmovdleu	%xcc,	%f15,	%f24
	movcs	%xcc,	%l0,	%i7
	fmovda	%xcc,	%f23,	%f24
loop_2862:
	sll	%i0,	%i1,	%o6
	tpos	%icc,	0x0
	subccc	%g4,	%o0,	%l6
	srlx	%o1,	0x1F,	%i2
	membar	0x65
	udivx	%i4,	0x063F,	%i5
	nop
	setx	0xE2612A16DD68A8F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xF210EEFAB9474709,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f28,	%f10
	fpsub16	%f8,	%f12,	%f6
	udiv	%l4,	0x0B95,	%g6
	array32	%o4,	%o2,	%o3
	prefetch	[%l7 + 0x34],	 0x0
	fbul,a	%fcc2,	loop_2863
	alignaddrl	%g3,	%l5,	%g5
	nop
	setx	0x6F8769C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x95B37380,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f20,	%f23
	nop
	setx	0x758F6A95,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x189D15BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f31,	%f19
loop_2863:
	ldx	[%l7 + 0x08],	%o7
	movvc	%xcc,	%o5,	%g7
	fbne,a	%fcc1,	loop_2864
	movvc	%xcc,	%i3,	%l1
	fbul,a	%fcc1,	loop_2865
	xor	%i6,	0x1CD5,	%l2
loop_2864:
	sub	%g2,	0x1183,	%l3
	tsubcctv	%g1,	%l0,	%i7
loop_2865:
	movpos	%icc,	%i1,	%o6
	fmovdpos	%icc,	%f22,	%f3
	set	0x7C, %g5
	stwa	%g4,	[%l7 + %g5] 0x23
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f13,	%f14
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x18,	%i0,	%l6
	set	0x50, %g4
	lda	[%l7 + %g4] 0x11,	%f13
	fcmpne32	%f8,	%f20,	%o0
	orcc	%o1,	%i4,	%i2
	fbue	%fcc3,	loop_2866
	ta	%xcc,	0x0
	fcmpeq32	%f12,	%f30,	%i5
	fcmpgt32	%f8,	%f18,	%g6
loop_2866:
	sra	%o4,	0x1E,	%l4
	movge	%xcc,	%o3,	%g3
	tcs	%icc,	0x6
	bcc	loop_2867
	movg	%xcc,	%l5,	%o2
	movvs	%xcc,	%g5,	%o7
	movrlez	%g7,	%o5,	%i3
loop_2867:
	tn	%icc,	0x3
	set	0x28, %g1
	lda	[%l7 + %g1] 0x10,	%f3
	fmovrdlez	%i6,	%f22,	%f14
	fnands	%f9,	%f21,	%f21
	movrlez	%l1,	%g2,	%l2
	tle	%xcc,	0x0
	sub	%l3,	%g1,	%i7
	udivcc	%l0,	0x0989,	%o6
	movg	%icc,	%g4,	%i1
	alignaddr	%l6,	%i0,	%o0
	ldsh	[%l7 + 0x1E],	%i4
	umul	%o1,	%i2,	%g6
	smul	%i5,	%l4,	%o4
	nop
	fitod	%f22,	%f0
	sth	%o3,	[%l7 + 0x0E]
	tvc	%icc,	0x7
	fmovrse	%l5,	%f20,	%f23
	umulcc	%g3,	0x19D3,	%g5
	fbu	%fcc3,	loop_2868
	fpsub32s	%f31,	%f8,	%f19
	sdivcc	%o7,	0x1603,	%o2
	fandnot2	%f26,	%f10,	%f18
loop_2868:
	xorcc	%o5,	%i3,	%g7
	tne	%icc,	0x0
	movleu	%icc,	%l1,	%i6
	fpadd32s	%f22,	%f29,	%f24
	fbuge,a	%fcc1,	loop_2869
	fnot1	%f22,	%f20
	umul	%g2,	0x1CBE,	%l2
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f26
	fxtos	%f26,	%f1
loop_2869:
	nop
	fitod	%f30,	%f20
	movrlez	%l3,	0x06A,	%g1
	edge16ln	%i7,	%o6,	%g4
	bg,pt	%icc,	loop_2870
	edge16n	%l0,	%l6,	%i0
	tpos	%xcc,	0x7
	std	%f22,	[%l7 + 0x08]
loop_2870:
	array16	%i1,	%o0,	%o1
	fnand	%f24,	%f4,	%f6
	fmovrde	%i2,	%f22,	%f0
	mova	%xcc,	%i4,	%g6
	bpos,a,pt	%icc,	loop_2871
	brlez,a	%i5,	loop_2872
	edge16n	%l4,	%o4,	%o3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x2C] %asi,	%l5
loop_2871:
	tne	%icc,	0x6
loop_2872:
	nop
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x1e,	%f0
	fandnot1s	%f12,	%f2,	%f30
	alignaddr	%g3,	%o7,	%o2
	tge	%icc,	0x7
	smulcc	%o5,	0x078E,	%i3
	umulcc	%g7,	%g5,	%i6
	xorcc	%g2,	0x1FBD,	%l1
	orn	%l3,	0x0DE2,	%g1
	fbug,a	%fcc1,	loop_2873
	fnot2	%f28,	%f12
	nop
	setx	0xE1BD09B6E47A13C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xD1F08E1656814A34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f2,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2873:
	taddcc	%i7,	0x0A1B,	%o6
	fpsub32s	%f27,	%f19,	%f2
	fmovrsne	%l2,	%f24,	%f12
	tsubcc	%g4,	%l0,	%l6
	set	0x10, %i7
	lda	[%l7 + %i7] 0x15,	%f16
	smul	%i0,	%o0,	%i1
	tgu	%icc,	0x1
	fmovdle	%xcc,	%f13,	%f20
	fmovsge	%xcc,	%f15,	%f24
	tn	%icc,	0x0
	fornot2s	%f16,	%f27,	%f23
	move	%icc,	%o1,	%i2
	edge8ln	%g6,	%i4,	%i5
	fcmpgt16	%f26,	%f24,	%l4
	set	0x08, %l2
	stwa	%o4,	[%l7 + %l2] 0x10
	fmuld8sux16	%f11,	%f10,	%f20
	movcs	%icc,	%l5,	%g3
	st	%f1,	[%l7 + 0x54]
	nop
	set	0x5E, %l1
	lduh	[%l7 + %l1],	%o3
	nop
	setx	0xE0495CCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	fpsub32	%f4,	%f16,	%f20
	fbule	%fcc3,	loop_2874
	bleu,a	loop_2875
	brgz	%o2,	loop_2876
	fmovscs	%icc,	%f22,	%f15
loop_2874:
	movneg	%icc,	%o7,	%i3
loop_2875:
	fnot1	%f2,	%f24
loop_2876:
	tsubcc	%g7,	%o5,	%i6
	addccc	%g5,	%l1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x4A],	%g2
	add	%i7,	%g1,	%o6
	fornot2s	%f12,	%f27,	%f23
	alignaddr	%l2,	%l0,	%l6
	nop
	setx	0xC4D24BFABF21F4ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6070CB2E2629E15A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f12,	%f16
	tleu	%icc,	0x6
	ldsh	[%l7 + 0x10],	%i0
	move	%icc,	%g4,	%i1
	tleu	%icc,	0x0
	nop
	setx	loop_2877,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	faligndata	%f28,	%f16,	%f16
	fcmpgt32	%f26,	%f6,	%o0
	edge8n	%i2,	%o1,	%g6
loop_2877:
	tsubcc	%i4,	0x15D2,	%i5
	xor	%l4,	0x0109,	%o4
	fbul	%fcc1,	loop_2878
	srax	%l5,	0x18,	%g3
	lduh	[%l7 + 0x60],	%o3
	popc	%o2,	%i3
loop_2878:
	fbe,a	%fcc2,	loop_2879
	fbl,a	%fcc2,	loop_2880
	fmovde	%icc,	%f14,	%f16
	brgez	%g7,	loop_2881
loop_2879:
	fnors	%f28,	%f31,	%f11
loop_2880:
	addcc	%o7,	%o5,	%i6
	fbne,a	%fcc2,	loop_2882
loop_2881:
	movl	%icc,	%l1,	%g5
	brlz	%l3,	loop_2883
	ldsb	[%l7 + 0x7C],	%i7
loop_2882:
	sll	%g1,	0x0D,	%o6
	bn	%xcc,	loop_2884
loop_2883:
	fmovrdgez	%l2,	%f10,	%f28
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
loop_2884:
	fexpand	%f12,	%f22
	ldstub	[%l7 + 0x1E],	%l6
	edge16l	%i0,	%g4,	%i1
	tneg	%icc,	0x0
	movvs	%icc,	%g2,	%o0
	set	0x3C, %o2
	lda	[%l7 + %o2] 0x88,	%f25
	fmovrse	%o1,	%f11,	%f11
	array32	%i2,	%i4,	%g6
	tn	%xcc,	0x1
	fmovdgu	%xcc,	%f2,	%f15
	edge8	%l4,	%o4,	%l5
	fnot1	%f2,	%f10
	popc	%g3,	%o3
	movn	%xcc,	%i5,	%o2
	fbue	%fcc0,	loop_2885
	sllx	%i3,	0x05,	%g7
	movn	%icc,	%o5,	%i6
	set	0x50, %o4
	ldswa	[%l7 + %o4] 0x0c,	%l1
loop_2885:
	sdivx	%o7,	0x15B0,	%g5
	fmovrdgez	%i7,	%f4,	%f22
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x34] %asi,	%l3
	array8	%o6,	%l2,	%l0
	tsubcc	%g1,	0x0D69,	%i0
	udivx	%l6,	0x1D0F,	%i1
	orncc	%g2,	%o0,	%g4
	fpadd16	%f4,	%f22,	%f24
	xor	%o1,	0x141F,	%i4
	movvs	%xcc,	%i2,	%g6
	fone	%f30
	movneg	%xcc,	%l4,	%o4
	movvc	%xcc,	%g3,	%o3
	ldd	[%l7 + 0x10],	%i4
	tcc	%icc,	0x5
	nop
	setx	0xE2574405772C295E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x9EA380B5771BAD9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f22,	%f30
	alignaddrl	%o2,	%l5,	%g7
	fone	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f18,	%f6,	%f4
	fpack16	%f30,	%f19
	fmovscs	%icc,	%f17,	%f29
	xorcc	%i3,	%i6,	%l1
	umulcc	%o7,	0x060A,	%o5
	fmuld8sux16	%f14,	%f22,	%f12
	smul	%i7,	%l3,	%g5
	fmovsne	%xcc,	%f30,	%f22
	srax	%l2,	%l0,	%o6
	brlz	%i0,	loop_2886
	edge8n	%l6,	%g1,	%g2
	nop
	setx	0xFF2D7A67B607F134,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x404DBAB7746C85A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f14,	%f6
	flush	%l7 + 0x6C
loop_2886:
	brlz,a	%o0,	loop_2887
	brlz	%g4,	loop_2888
	ldd	[%l7 + 0x70],	%f20
	nop
	fitos	%f5,	%f6
	fstod	%f6,	%f0
loop_2887:
	fors	%f23,	%f18,	%f31
loop_2888:
	fmovrdgz	%o1,	%f20,	%f14
	tpos	%icc,	0x5
	sdivx	%i4,	0x0199,	%i1
	tcs	%icc,	0x3
	movg	%icc,	%i2,	%g6
	sdiv	%l4,	0x1E4D,	%g3
	xor	%o4,	0x0A17,	%i5
	fmovrdgez	%o3,	%f16,	%f0
	fmovscs	%icc,	%f6,	%f27
	fors	%f16,	%f16,	%f1
	sra	%l5,	%o2,	%i3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i6
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x04,	 0x2
	edge16ln	%o7,	%l1,	%i7
	sllx	%l3,	%g5,	%o5
	mulx	%l0,	%l2,	%o6
	bleu,a,pn	%icc,	loop_2889
	orn	%l6,	%i0,	%g1
	edge16n	%o0,	%g4,	%g2
	fbue,a	%fcc3,	loop_2890
loop_2889:
	std	%f4,	[%l7 + 0x10]
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o1
loop_2890:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f9,	[%l7 + 0x1C] %asi
	addc	%i1,	%i2,	%i4
	movrlz	%g6,	0x3F6,	%l4
	fmovdne	%icc,	%f26,	%f9
	bcc,pt	%xcc,	loop_2891
	movle	%icc,	%g3,	%o4
	fmovdvc	%xcc,	%f3,	%f29
	movge	%icc,	%i5,	%l5
loop_2891:
	movrlez	%o3,	0x3F8,	%i3
	smulcc	%o2,	0x1538,	%g7
	fpack32	%f14,	%f6,	%f2
	movvs	%icc,	%o7,	%l1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x38] %asi,	%f23
	fmuld8sux16	%f21,	%f28,	%f18
	fmovse	%xcc,	%f5,	%f8
	movrne	%i7,	%i6,	%g5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x68] %asi,	%o5
	fcmpne16	%f24,	%f6,	%l0
	edge16	%l3,	%o6,	%l2
	smulcc	%i0,	%l6,	%g1
	bn,a,pt	%icc,	loop_2892
	andcc	%g4,	0x0735,	%o0
	te	%xcc,	0x3
	movl	%xcc,	%g2,	%o1
loop_2892:
	orcc	%i2,	0x085F,	%i1
	edge32n	%i4,	%l4,	%g3
	brgez,a	%g6,	loop_2893
	fmovrdgez	%o4,	%f8,	%f18
	or	%l5,	0x04A0,	%i5
	bcs,pn	%xcc,	loop_2894
loop_2893:
	sdivcc	%i3,	0x1389,	%o2
	ba,pn	%xcc,	loop_2895
	fnot2	%f14,	%f16
loop_2894:
	bg	loop_2896
	movrlz	%o3,	0x160,	%g7
loop_2895:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2896:
	fmovrdlz	%o7,	%f26,	%f26
	edge16n	%l1,	%i7,	%i6
	umulcc	%o5,	%l0,	%l3
	fnor	%f28,	%f30,	%f12
	nop
	setx	0x30FB60A15072AFBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	sllx	%o6,	0x02,	%l2
	orcc	%i0,	0x043C,	%g5
	movneg	%icc,	%l6,	%g1
	nop
	fitos	%f7,	%f16
	fstod	%f16,	%f14
	xorcc	%g4,	0x09E4,	%o0
	fmovdg	%icc,	%f12,	%f17
	srax	%g2,	%o1,	%i2
	fmul8ulx16	%f14,	%f18,	%f8
	brlez	%i1,	loop_2897
	orncc	%i4,	0x0701,	%g3
	tvc	%xcc,	0x0
	mulx	%g6,	%l4,	%o4
loop_2897:
	popc	%i5,	%l5
	tg	%icc,	0x3
	fmovse	%xcc,	%f26,	%f24
	add	%o2,	0x1CBD,	%i3
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f13
	mulscc	%o3,	0x1F04,	%g7
	st	%f31,	[%l7 + 0x7C]
	add	%l1,	0x0532,	%o7
	taddcc	%i7,	0x16B9,	%o5
	nop
	setx	loop_2898,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%i6,	%l3,	%l0
	movg	%icc,	%l2,	%i0
	move	%icc,	%g5,	%o6
loop_2898:
	fpsub16s	%f2,	%f10,	%f15
	swap	[%l7 + 0x44],	%l6
	andcc	%g1,	0x116F,	%o0
	bpos	%icc,	loop_2899
	srlx	%g2,	0x15,	%g4
	movleu	%icc,	%o1,	%i2
	sdivcc	%i1,	0x08E4,	%g3
loop_2899:
	bleu,a,pt	%icc,	loop_2900
	tvs	%icc,	0x6
	umulcc	%i4,	%l4,	%o4
	brlz,a	%g6,	loop_2901
loop_2900:
	movrne	%l5,	0x25E,	%i5
	smul	%i3,	0x1BD9,	%o2
	tg	%icc,	0x7
loop_2901:
	fbu,a	%fcc2,	loop_2902
	subcc	%g7,	0x0B7D,	%o3
	nop
	setx	0x879155BB8060C273,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fbuge,a	%fcc3,	loop_2903
loop_2902:
	tvs	%icc,	0x6
	fnot1s	%f28,	%f11
	tl	%icc,	0x2
loop_2903:
	flush	%l7 + 0x08
	alignaddrl	%l1,	%i7,	%o7
	brnz,a	%i6,	loop_2904
	subcc	%o5,	%l0,	%l2
	addcc	%i0,	%g5,	%l3
	movneg	%icc,	%l6,	%o6
loop_2904:
	movgu	%xcc,	%o0,	%g1
	movleu	%xcc,	%g2,	%g4
	fmovsne	%xcc,	%f1,	%f7
	bneg,a,pt	%icc,	loop_2905
	bvc	loop_2906
	bg,pt	%icc,	loop_2907
	fbne	%fcc3,	loop_2908
loop_2905:
	te	%xcc,	0x5
loop_2906:
	nop
	set	0x08, %g6
	std	%f16,	[%l7 + %g6]
loop_2907:
	fnand	%f10,	%f10,	%f4
loop_2908:
	taddcctv	%i2,	0x11C4,	%o1
	bn,a	%xcc,	loop_2909
	nop
	setx	0x00E43FBBDBC02D7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC8562649DD9098F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f14,	%f0
	edge16	%i1,	%i4,	%g3
	fbne,a	%fcc0,	loop_2910
loop_2909:
	brlez,a	%l4,	loop_2911
	fbg	%fcc3,	loop_2912
	fbg	%fcc0,	loop_2913
loop_2910:
	mulscc	%g6,	0x1E09,	%l5
loop_2911:
	movge	%xcc,	%o4,	%i5
loop_2912:
	fmovdcs	%xcc,	%f27,	%f3
loop_2913:
	stb	%o2,	[%l7 + 0x66]
	orn	%i3,	0x0541,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l1,	%i7,	%o7
	te	%xcc,	0x4
	fpmerge	%f18,	%f9,	%f18
	fmovdl	%icc,	%f24,	%f9
	brgz	%i6,	loop_2914
	sir	0x097E
	edge16n	%o3,	%o5,	%l2
	sub	%l0,	%i0,	%g5
loop_2914:
	ld	[%l7 + 0x14],	%f17
	popc	%l3,	%l6
	add	%o0,	0x0A40,	%o6
	ldsw	[%l7 + 0x78],	%g1
	subcc	%g2,	%i2,	%g4
	brlz,a	%i1,	loop_2915
	nop
	setx	0x87F538A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f28
	sll	%o1,	%g3,	%i4
	fmovdleu	%xcc,	%f1,	%f28
loop_2915:
	tneg	%icc,	0x7
	edge16l	%g6,	%l5,	%l4
	sdiv	%o4,	0x0B67,	%o2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x38] %asi,	%i5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	sir	0x1930
	flush	%l7 + 0x20
	movgu	%icc,	%i7,	%l1
	nop
	setx	0x3567D110C068ECAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o7
	srl	%o5,	%o3,	%l0
	fxor	%f14,	%f26,	%f14
	addcc	%l2,	0x183D,	%g5
	brnz	%i0,	loop_2916
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f22
	fzero	%f14
	fsrc1s	%f7,	%f14
loop_2916:
	fmovrsne	%l6,	%f25,	%f12
	orcc	%o0,	0x0571,	%o6
	fmovrde	%l3,	%f22,	%f0
	bne,a,pt	%xcc,	loop_2917
	tle	%xcc,	0x6
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f26
	edge8l	%g2,	%i2,	%g1
loop_2917:
	xnor	%i1,	%g4,	%o1
	swap	[%l7 + 0x64],	%i4
	andcc	%g3,	%l5,	%g6
	move	%xcc,	%l4,	%o2
	srl	%o4,	%i5,	%i3
	udivcc	%g7,	0x1851,	%l1
	tge	%xcc,	0x1
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i7
	fpsub16	%f18,	%f14,	%f18
	sir	0x1AF2
	tsubcc	%i6,	%o5,	%o7
	sethi	0x0C9D,	%o3
	sra	%l0,	%l2,	%i0
	srl	%g5,	%l6,	%o0
	umul	%o6,	0x1D5D,	%l3
	smul	%i2,	%g1,	%g2
	edge16n	%i1,	%o1,	%i4
	xnor	%g3,	0x1B49,	%g4
	movrlz	%l5,	0x1C8,	%l4
	nop
	setx	0x8570E13E88936D66,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x551F1F4281A568B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f0,	%f22
	array8	%o2,	%o4,	%g6
	stw	%i3,	[%l7 + 0x3C]
	edge8n	%i5,	%g7,	%l1
	srl	%i6,	%i7,	%o7
	movrlz	%o3,	%l0,	%l2
	fmovdleu	%icc,	%f22,	%f29
	edge16n	%o5,	%i0,	%l6
	tne	%icc,	0x0
	nop
	set	0x5A, %i2
	sth	%g5,	[%l7 + %i2]
	fsrc1s	%f25,	%f22
	movcc	%icc,	%o0,	%o6
	umul	%i2,	%g1,	%l3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%g2
	fba	%fcc1,	loop_2918
	lduh	[%l7 + 0x18],	%i4
	or	%g3,	0x1A01,	%g4
	call	loop_2919
loop_2918:
	srl	%l5,	%o1,	%l4
	fmovsn	%xcc,	%f9,	%f20
	subcc	%o4,	%g6,	%i3
loop_2919:
	tsubcc	%o2,	0x0E75,	%g7
	stbar
	sll	%i5,	%i6,	%l1
	tle	%icc,	0x5
	movrlez	%i7,	0x343,	%o3
	edge32ln	%o7,	%l0,	%l2
	be	loop_2920
	mova	%icc,	%o5,	%i0
	alignaddr	%l6,	%o0,	%o6
	wr	%g0,	0x04,	%asi
	sta	%f30,	[%l7 + 0x24] %asi
loop_2920:
	swap	[%l7 + 0x74],	%g5
	tpos	%icc,	0x2
	taddcctv	%g1,	%l3,	%i1
	fmovrsgez	%i2,	%f12,	%f13
	fbne	%fcc3,	loop_2921
	or	%i4,	%g2,	%g3
	set	0x48, %o7
	sta	%f2,	[%l7 + %o7] 0x81
loop_2921:
	ldd	[%l7 + 0x28],	%l4
	edge32ln	%o1,	%l4,	%o4
	sll	%g4,	%g6,	%i3
	bneg	loop_2922
	tsubcc	%g7,	%i5,	%i6
	andncc	%l1,	%o2,	%o3
	fbug,a	%fcc2,	loop_2923
loop_2922:
	bcs,a,pt	%xcc,	loop_2924
	fmovsneg	%xcc,	%f16,	%f8
	movge	%icc,	%i7,	%o7
loop_2923:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%o5
loop_2924:
	andncc	%i0,	%l2,	%o0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	tn	%xcc,	0x3
	movle	%xcc,	%g5,	%g1
	add	%l6,	%l3,	%i1
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x5C] %asi,	%f26
	fexpand	%f14,	%f18
	sra	%i4,	0x06,	%i2
	smulcc	%g2,	%l5,	%o1
	movrlz	%l4,	0x265,	%o4
	fzeros	%f26
	orn	%g3,	0x15F3,	%g4
	fbne	%fcc3,	loop_2925
	movneg	%xcc,	%g6,	%i3
	set	0x08, %o1
	lduha	[%l7 + %o1] 0x80,	%g7
loop_2925:
	tvs	%icc,	0x2
	tn	%xcc,	0x6
	tl	%icc,	0x5
	stw	%i5,	[%l7 + 0x3C]
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f0
	ta	%icc,	0x1
	set	0x2E, %l4
	lduha	[%l7 + %l4] 0x18,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f8,	%f23
	sth	%o2,	[%l7 + 0x26]
	movrlz	%l1,	0x3B5,	%o3
	movrlez	%i7,	0x2AF,	%o7
	movrgez	%o5,	%i0,	%l0
	nop
	setx	0xF9BF748D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x1F5DBED2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f12,	%f27
	bg	%icc,	loop_2926
	nop
	fitos	%f12,	%f3
	fstod	%f3,	%f16
	sdivcc	%l2,	0x02E2,	%o6
	stbar
loop_2926:
	udiv	%g5,	0x0359,	%o0
	fmovdvc	%xcc,	%f31,	%f17
	tcc	%icc,	0x1
	array8	%l6,	%g1,	%i1
	srax	%i4,	%i2,	%l3
	movcs	%icc,	%g2,	%l5
	membar	0x6F
	nop
	fitod	%f24,	%f26
	sir	0x0C2A
	bg,a	loop_2927
	subcc	%l4,	%o1,	%g3
	movne	%icc,	%g4,	%o4
	fornot1	%f28,	%f8,	%f10
loop_2927:
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f26
	edge8ln	%i3,	%g7,	%i5
	and	%i6,	0x0F87,	%g6
	swap	[%l7 + 0x18],	%o2
	fmovsl	%xcc,	%f25,	%f25
	movgu	%xcc,	%o3,	%l1
	bne	loop_2928
	tne	%xcc,	0x6
	nop
	fitos	%f2,	%f13
	fstod	%f13,	%f20
	alignaddr	%i7,	%o5,	%o7
loop_2928:
	fmovsge	%icc,	%f0,	%f14
	tvs	%icc,	0x0
	fmovdleu	%icc,	%f5,	%f20
	movg	%icc,	%i0,	%l0
	array32	%l2,	%g5,	%o6
	xor	%l6,	0x1121,	%g1
	te	%icc,	0x5
	fbo	%fcc2,	loop_2929
	ldstub	[%l7 + 0x69],	%o0
	set	0x0A, %i0
	ldsba	[%l7 + %i0] 0x80,	%i4
loop_2929:
	fbne	%fcc1,	loop_2930
	bvc,a	loop_2931
	add	%i1,	0x02CB,	%l3
	fmovse	%icc,	%f21,	%f16
loop_2930:
	smul	%g2,	0x135F,	%l5
loop_2931:
	brnz	%l4,	loop_2932
	edge32l	%i2,	%g3,	%o1
	edge16	%o4,	%g4,	%i3
	andncc	%g7,	%i5,	%g6
loop_2932:
	edge16	%o2,	%i6,	%l1
	bgu,a	%xcc,	loop_2933
	membar	0x08
	andn	%i7,	%o3,	%o5
	tle	%icc,	0x3
loop_2933:
	ldx	[%l7 + 0x10],	%i0
	tsubcc	%l0,	%l2,	%g5
	fmovrslez	%o7,	%f13,	%f2
	tcs	%xcc,	0x5
	array8	%l6,	%o6,	%o0
	bvs,pn	%xcc,	loop_2934
	call	loop_2935
	fandnot2s	%f16,	%f24,	%f7
	mulscc	%g1,	%i4,	%i1
loop_2934:
	movle	%icc,	%l3,	%g2
loop_2935:
	movl	%xcc,	%l5,	%l4
	tne	%icc,	0x4
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
	set	0x70, %g2
	stwa	%g3,	[%l7 + %g2] 0xea
	membar	#Sync
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sllx	%i2,	%o4,	%g4
	bne,pn	%xcc,	loop_2936
	lduw	[%l7 + 0x54],	%o1
	swap	[%l7 + 0x74],	%g7
	fblg,a	%fcc0,	loop_2937
loop_2936:
	fornot1	%f16,	%f2,	%f2
	te	%xcc,	0x6
	srl	%i3,	%i5,	%g6
loop_2937:
	tl	%icc,	0x7
	st	%f12,	[%l7 + 0x28]
	sth	%o2,	[%l7 + 0x5A]
	movl	%icc,	%i6,	%i7
	array32	%l1,	%o5,	%i0
	movcc	%icc,	%o3,	%l2
	edge32ln	%l0,	%o7,	%g5
	swap	[%l7 + 0x74],	%l6
	taddcc	%o0,	0x0591,	%g1
	fnot2	%f20,	%f30
	tge	%icc,	0x5
	sdivcc	%i4,	0x14E3,	%i1
	addc	%o6,	0x0D0F,	%l3
	fmovsne	%icc,	%f18,	%f5
	bne,a,pt	%icc,	loop_2938
	fmul8ulx16	%f10,	%f10,	%f18
	bcc,a	loop_2939
	ld	[%l7 + 0x3C],	%f7
loop_2938:
	xnor	%l5,	0x12A4,	%g2
	tsubcctv	%g3,	0x11A9,	%i2
loop_2939:
	nop
	set	0x38, %o3
	sta	%f25,	[%l7 + %o3] 0x11
	fmuld8sux16	%f31,	%f7,	%f22
	nop
	setx	0x332B5B1E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x3EF2EA51,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f26,	%f6
	move	%xcc,	%o4,	%g4
	sub	%o1,	0x0769,	%g7
	fsrc1	%f14,	%f20
	bvc	loop_2940
	bge,a	%xcc,	loop_2941
	fmovdg	%xcc,	%f15,	%f19
	subc	%l4,	%i3,	%i5
loop_2940:
	nop
	set	0x26, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o2
loop_2941:
	nop
	setx	0xA4D2B498E8E32958,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x64876EE3EA50A5F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f18,	%f16
	edge16n	%g6,	%i7,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f30,	%f29
	fblg,a	%fcc2,	loop_2942
	sub	%o5,	0x065A,	%i6
	ld	[%l7 + 0x08],	%f3
	fmovscc	%xcc,	%f7,	%f15
loop_2942:
	fmul8x16	%f4,	%f30,	%f2
	nop
	setx	0xA90FC2A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x21AA63A6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f0,	%f10
	smul	%o3,	0x18DA,	%l2
	fmovsleu	%icc,	%f4,	%f13
	movvs	%icc,	%i0,	%l0
	move	%xcc,	%o7,	%g5
	tgu	%xcc,	0x0
	fmovdge	%xcc,	%f2,	%f21
	edge16ln	%o0,	%g1,	%l6
	nop
	setx	loop_2943,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%icc,	0x0
	xnor	%i4,	%o6,	%l3
	array32	%l5,	%g2,	%i1
loop_2943:
	nop
	setx	0x00CC1237,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x2CE0B67D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f31,	%f22
	fpsub16s	%f17,	%f30,	%f9
	tneg	%xcc,	0x0
	fnors	%f19,	%f28,	%f6
	edge16l	%g3,	%o4,	%i2
	fmovsa	%icc,	%f22,	%f14
	add	%o1,	%g4,	%l4
	tleu	%icc,	0x1
	subc	%g7,	0x0856,	%i3
	tcc	%xcc,	0x4
	mova	%xcc,	%i5,	%g6
	xnorcc	%i7,	%o2,	%o5
	edge8l	%i6,	%l1,	%l2
	set	0x50, %g7
	sta	%f25,	[%l7 + %g7] 0x18
	edge8ln	%o3,	%i0,	%o7
	fmovdcs	%icc,	%f29,	%f7
	ld	[%l7 + 0x14],	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x24
	fornot2s	%f10,	%f2,	%f23
	nop
	setx	loop_2944,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%l0,	%o0,	%g1
	bcs	loop_2945
	nop
	setx	0x0C94D65B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xE784AF6E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f16,	%f2
loop_2944:
	smul	%g5,	%l6,	%o6
	bgu,a,pt	%icc,	loop_2946
loop_2945:
	alignaddr	%i4,	%l3,	%g2
	sdivx	%l5,	0x0AF6,	%g3
	bg,a,pt	%xcc,	loop_2947
loop_2946:
	tl	%xcc,	0x7
	tle	%icc,	0x0
	fones	%f29
loop_2947:
	be,pn	%icc,	loop_2948
	tpos	%xcc,	0x7
	udivcc	%i1,	0x14F2,	%i2
	fsrc2s	%f29,	%f15
loop_2948:
	and	%o1,	%o4,	%g4
	tgu	%xcc,	0x4
	sllx	%g7,	0x04,	%i3
	tsubcc	%i5,	%g6,	%i7
	fcmpne16	%f26,	%f26,	%l4
	fcmpeq16	%f22,	%f20,	%o5
	fmovdl	%xcc,	%f19,	%f28
	ldub	[%l7 + 0x0B],	%o2
	edge8l	%i6,	%l2,	%l1
	fmovrde	%i0,	%f6,	%f24
	array32	%o3,	%o7,	%l0
	fbu	%fcc2,	loop_2949
	xnor	%g1,	0x0155,	%g5
	swap	[%l7 + 0x14],	%o0
	fmovdn	%xcc,	%f18,	%f8
loop_2949:
	smul	%l6,	0x1CC5,	%o6
	movleu	%icc,	%i4,	%l3
	wr	%g0,	0x52,	%asi
	stxa	%g2,	[%g0 + 0x220] %asi
	srlx	%l5,	0x17,	%g3
	tn	%icc,	0x0
	fcmpgt16	%f4,	%f20,	%i1
	flush	%l7 + 0x7C
	tne	%xcc,	0x6
	smul	%o1,	0x1751,	%o4
	sdivcc	%i2,	0x17B6,	%g4
	edge8ln	%i3,	%i5,	%g6
	nop
	setx	loop_2950,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%i7,	%l4
	brgz	%g7,	loop_2951
	te	%icc,	0x0
loop_2950:
	for	%f24,	%f28,	%f18
	array8	%o2,	%i6,	%l2
loop_2951:
	brz	%o5,	loop_2952
	umulcc	%l1,	0x0923,	%i0
	tpos	%xcc,	0x0
	array8	%o3,	%l0,	%g1
loop_2952:
	movl	%icc,	%g5,	%o7
	xorcc	%l6,	%o0,	%o6
	fnegs	%f6,	%f16
	movre	%l3,	%g2,	%l5
	sllx	%g3,	0x11,	%i4
	tleu	%xcc,	0x5
	fbn,a	%fcc3,	loop_2953
	movgu	%xcc,	%o1,	%o4
	edge8	%i1,	%i2,	%i3
	st	%f8,	[%l7 + 0x7C]
loop_2953:
	prefetch	[%l7 + 0x20],	 0x2
	movn	%icc,	%i5,	%g4
	sir	0x1C13
	xor	%g6,	%i7,	%g7
	xor	%l4,	%o2,	%l2
	fmovspos	%icc,	%f8,	%f14
	brnz	%i6,	loop_2954
	fandnot2	%f10,	%f30,	%f26
	xorcc	%l1,	%i0,	%o3
	movrlz	%l0,	0x11E,	%g1
loop_2954:
	tgu	%xcc,	0x2
	orcc	%o5,	0x18A4,	%g5
	edge8n	%o7,	%l6,	%o0
	fpsub16s	%f14,	%f3,	%f21
	sll	%l3,	0x1E,	%o6
	fbug,a	%fcc1,	loop_2955
	fcmple32	%f16,	%f10,	%l5
	brlez,a	%g2,	loop_2956
	umulcc	%g3,	%i4,	%o1
loop_2955:
	tgu	%icc,	0x0
	fornot2	%f20,	%f20,	%f18
loop_2956:
	edge32n	%o4,	%i1,	%i3
	movrgz	%i2,	%g4,	%i5
	stw	%g6,	[%l7 + 0x34]
	edge16l	%g7,	%l4,	%o2
	subc	%l2,	%i7,	%i6
	bpos,a	%icc,	loop_2957
	sra	%i0,	%o3,	%l1
	tvs	%xcc,	0x7
	fzeros	%f29
loop_2957:
	fzero	%f18
	udivx	%g1,	0x177F,	%o5
	movge	%icc,	%g5,	%l0
	array32	%l6,	%o0,	%o7
	fpsub32	%f6,	%f28,	%f10
	sdivx	%o6,	0x1BF7,	%l3
	orn	%g2,	0x167A,	%g3
	movrgz	%l5,	0x0A2,	%o1
	fbuge	%fcc1,	loop_2958
	fmovdge	%icc,	%f20,	%f9
	or	%o4,	%i1,	%i3
	fnegs	%f0,	%f22
loop_2958:
	fmovsleu	%icc,	%f4,	%f3
	movneg	%xcc,	%i2,	%g4
	lduw	[%l7 + 0x78],	%i4
	fmul8ulx16	%f30,	%f20,	%f2
	flush	%l7 + 0x58
	fbue	%fcc0,	loop_2959
	movne	%icc,	%g6,	%i5
	fmovdvc	%xcc,	%f28,	%f0
	fnot2s	%f30,	%f26
loop_2959:
	fbe,a	%fcc0,	loop_2960
	fpsub32s	%f2,	%f9,	%f11
	bn	%xcc,	loop_2961
	fcmpeq16	%f0,	%f20,	%g7
loop_2960:
	nop
	setx	loop_2962,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%xcc,	0x7
loop_2961:
	swap	[%l7 + 0x44],	%o2
	fmovsgu	%xcc,	%f13,	%f12
loop_2962:
	movcs	%xcc,	%l2,	%i7
	bne,pn	%xcc,	loop_2963
	fmovrsne	%i6,	%f17,	%f22
	orn	%l4,	0x00DD,	%o3
	fmovde	%xcc,	%f3,	%f26
loop_2963:
	subc	%i0,	0x0562,	%g1
	movpos	%icc,	%o5,	%g5
	array8	%l1,	%l6,	%o0
	fmovrdne	%o7,	%f30,	%f14
	set	0x34, %i6
	ldswa	[%l7 + %i6] 0x81,	%l0
	addcc	%l3,	0x1254,	%o6
	tcc	%xcc,	0x3
	sdiv	%g2,	0x030F,	%l5
	fnegs	%f24,	%f22
	mulx	%g3,	%o4,	%o1
	fmovsle	%xcc,	%f7,	%f16
	tvc	%xcc,	0x3
	umulcc	%i3,	%i1,	%i2
	fbe	%fcc1,	loop_2964
	subc	%i4,	0x0FD3,	%g4
	subcc	%i5,	%g6,	%o2
	fmovsa	%xcc,	%f21,	%f6
loop_2964:
	edge16	%g7,	%l2,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i6,	0x0E0F,	%l4
	fxors	%f19,	%f3,	%f25
	sir	0x018B
	set	0x72, %o0
	stha	%o3,	[%l7 + %o0] 0x11
	add	%l7,	0x74,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%o5
	tne	%icc,	0x5
	movvs	%xcc,	%i0,	%l1
	movle	%icc,	%l6,	%o0
	tleu	%icc,	0x0
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
	movl	%xcc,	%g5,	%l0
	stw	%l3,	[%l7 + 0x44]
	tleu	%xcc,	0x4
loop_2965:
	fba,a	%fcc3,	loop_2966
	fbue,a	%fcc3,	loop_2967
	orcc	%o6,	%g2,	%l5
	edge32	%g3,	%o4,	%o7
loop_2966:
	fmovsa	%xcc,	%f28,	%f14
loop_2967:
	udivx	%o1,	0x042E,	%i3
	nop
	setx	0xD403E25C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f29
	tg	%xcc,	0x5
	movg	%icc,	%i2,	%i1
	fmovsvs	%xcc,	%f17,	%f29
	fpadd32	%f24,	%f6,	%f24
	edge8	%g4,	%i5,	%i4
	fmul8sux16	%f4,	%f20,	%f22
	fbg,a	%fcc0,	loop_2968
	movne	%xcc,	%g6,	%g7
	nop
	setx	0x7052217B,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	te	%icc,	0x0
loop_2968:
	lduh	[%l7 + 0x42],	%l2
	fones	%f31
	brlez	%i7,	loop_2969
	srax	%i6,	0x0E,	%l4
	bcc	loop_2970
	add	%o3,	0x1AF4,	%o2
loop_2969:
	movvs	%icc,	%g1,	%i0
	fmovrdlz	%o5,	%f10,	%f4
loop_2970:
	nop
	set	0x20, %o6
	stha	%l6,	[%l7 + %o6] 0x88
	fbo	%fcc2,	loop_2971
	sth	%l1,	[%l7 + 0x62]
	tcc	%xcc,	0x1
	movge	%icc,	%o0,	%l0
loop_2971:
	movrgz	%l3,	0x30C,	%o6
	membar	0x61
	or	%g2,	0x1F99,	%g5
	fmovs	%f11,	%f3
	sra	%g3,	0x17,	%l5
	bgu,a	loop_2972
	bleu	loop_2973
	brlez	%o4,	loop_2974
	fpack16	%f22,	%f11
loop_2972:
	nop
	set	0x48, %l6
	stb	%o7,	[%l7 + %l6]
loop_2973:
	popc	%o1,	%i3
loop_2974:
	array32	%i1,	%g4,	%i2
	tgu	%xcc,	0x7
	movrne	%i5,	%i4,	%g7
	fnot1s	%f0,	%f29
	andncc	%l2,	%i7,	%i6
	orncc	%g6,	0x012A,	%l4
	alignaddr	%o3,	%o2,	%i0
	ldub	[%l7 + 0x2D],	%g1
	umulcc	%l6,	0x049E,	%l1
	fmovrslez	%o5,	%f23,	%f13
	set	0x70, %l5
	sta	%f21,	[%l7 + %l5] 0x18
	mova	%xcc,	%l0,	%o0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4C] %asi,	%o6
	edge8	%g2,	%l3,	%g3
	xnorcc	%g5,	%o4,	%l5
	movvc	%xcc,	%o1,	%i3
	fmovsn	%xcc,	%f18,	%f5
	edge16l	%o7,	%g4,	%i1
	mulscc	%i2,	0x0D9B,	%i5
	movn	%icc,	%g7,	%l2
	movrne	%i4,	%i7,	%i6
	bshuffle	%f24,	%f20,	%f24
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g6
	or	%l4,	%o2,	%i0
	movvc	%xcc,	%o3,	%l6
	edge8ln	%g1,	%o5,	%l0
	orncc	%l1,	%o6,	%g2
	movvc	%xcc,	%o0,	%l3
	fornot1s	%f28,	%f9,	%f8
	movl	%icc,	%g5,	%o4
	fpmerge	%f31,	%f6,	%f16
	bn,a,pt	%icc,	loop_2975
	movneg	%xcc,	%l5,	%g3
	fabsd	%f12,	%f10
	ldx	[%l7 + 0x20],	%o1
loop_2975:
	fmovrdlez	%i3,	%f26,	%f28
	tsubcctv	%g4,	%o7,	%i1
	edge8l	%i5,	%g7,	%i2
	fbu	%fcc0,	loop_2976
	fmovscs	%xcc,	%f27,	%f26
	movre	%l2,	%i4,	%i6
	edge16	%i7,	%g6,	%o2
loop_2976:
	bneg	loop_2977
	andcc	%i0,	%o3,	%l6
	sir	0x1EE9
	fbu,a	%fcc2,	loop_2978
loop_2977:
	mova	%icc,	%l4,	%o5
	movrgz	%g1,	%l0,	%o6
	taddcctv	%l1,	0x0A39,	%g2
loop_2978:
	umulcc	%l3,	0x09DF,	%g5
	stx	%o0,	[%l7 + 0x20]
	movne	%xcc,	%l5,	%g3
	set	0x54, %i4
	lduha	[%l7 + %i4] 0x11,	%o1
	tl	%icc,	0x7
	or	%i3,	0x0076,	%o4
	taddcctv	%g4,	0x0FF4,	%i1
	tcs	%xcc,	0x4
	edge16l	%i5,	%g7,	%i2
	tsubcc	%l2,	0x1E3A,	%o7
	xor	%i6,	%i7,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pn	%xcc,	loop_2979
	fmovdne	%icc,	%f13,	%f29
	addcc	%o2,	0x1FD1,	%i0
	tvc	%xcc,	0x0
loop_2979:
	umulcc	%i4,	%l6,	%l4
	mulx	%o5,	%g1,	%l0
	tle	%xcc,	0x4
	fcmple32	%f6,	%f30,	%o3
	movle	%icc,	%o6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g2,	0x1A32,	%g5
	fbug	%fcc0,	loop_2980
	tcs	%xcc,	0x0
	movcc	%xcc,	%o0,	%l3
	movcc	%xcc,	%g3,	%o1
loop_2980:
	tgu	%icc,	0x0
	edge32l	%i3,	%o4,	%g4
	smul	%l5,	%i1,	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i5,	%l2
	addccc	%o7,	%i2,	%i6
	ta	%icc,	0x7
	tcs	%icc,	0x7
	fbue,a	%fcc1,	loop_2981
	umul	%i7,	%o2,	%g6
	srlx	%i0,	%l6,	%l4
	subcc	%i4,	%g1,	%o5
loop_2981:
	array32	%o3,	%o6,	%l1
	movrgez	%l0,	0x14C,	%g5
	fpsub32s	%f13,	%f21,	%f14
	ldub	[%l7 + 0x2E],	%g2
	movgu	%xcc,	%l3,	%o0
	nop
	set	0x2E, %l3
	ldsh	[%l7 + %l3],	%o1
	ldstub	[%l7 + 0x58],	%g3
	brlez	%o4,	loop_2982
	ldd	[%l7 + 0x30],	%f0
	andcc	%i3,	%g4,	%l5
	fbul,a	%fcc2,	loop_2983
loop_2982:
	ldd	[%l7 + 0x18],	%f16
	ldsw	[%l7 + 0x18],	%g7
	movl	%icc,	%i1,	%i5
loop_2983:
	srl	%l2,	%o7,	%i2
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i7
	fcmpgt32	%f22,	%f12,	%o2
	array32	%g6,	%i6,	%i0
	st	%f27,	[%l7 + 0x0C]
	tneg	%icc,	0x2
	brgz,a	%l6,	loop_2984
	movn	%xcc,	%i4,	%g1
	udivx	%o5,	0x196F,	%l4
	mulscc	%o3,	0x1787,	%o6
loop_2984:
	tleu	%xcc,	0x3
	movrlez	%l0,	0x3D0,	%l1
	movrgez	%g2,	0x30D,	%g5
	movneg	%xcc,	%o0,	%o1
	bn,pt	%xcc,	loop_2985
	fnands	%f1,	%f19,	%f20
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f28
	addc	%g3,	0x1D75,	%o4
loop_2985:
	fabsd	%f24,	%f16
	movg	%xcc,	%i3,	%l3
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x18,	%l4
	fmovspos	%xcc,	%f3,	%f30
	tvs	%icc,	0x2
	nop
	setx	loop_2986,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bneg,pn	%icc,	loop_2987
	movpos	%xcc,	%g4,	%i1
	tge	%xcc,	0x5
loop_2986:
	edge8ln	%i5,	%g7,	%l2
loop_2987:
	fcmple16	%f16,	%f22,	%i2
	bge	loop_2988
	movn	%xcc,	%i7,	%o7
	lduw	[%l7 + 0x60],	%g6
	tvs	%icc,	0x0
loop_2988:
	movre	%o2,	0x235,	%i0
	edge16ln	%l6,	%i4,	%i6
	orncc	%g1,	0x073A,	%o5
	movre	%l4,	%o3,	%l0
	nop
	setx	0xD044F58F,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	taddcc	%o6,	%g2,	%g5
	fbule,a	%fcc2,	loop_2989
	fmovdle	%xcc,	%f17,	%f30
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x80,	 0x3
loop_2989:
	fmuld8sux16	%f22,	%f9,	%f28
	fmovrdlz	%o1,	%f22,	%f12
	movvs	%icc,	%o0,	%o4
	bn,a	%xcc,	loop_2990
	andcc	%g3,	%i3,	%l3
	fnor	%f8,	%f10,	%f30
	fmovrdgz	%l5,	%f12,	%f6
loop_2990:
	fmovdcc	%xcc,	%f31,	%f7
	lduw	[%l7 + 0x14],	%i1
	brgz,a	%g4,	loop_2991
	move	%icc,	%i5,	%l2
	movre	%i2,	%i7,	%g7
	fxor	%f16,	%f6,	%f12
loop_2991:
	taddcc	%g6,	%o2,	%o7
	subccc	%i0,	0x032D,	%i4
	movre	%l6,	%g1,	%o5
	sllx	%i6,	%l4,	%o3
	addc	%l0,	%o6,	%g2
	bneg,a,pn	%xcc,	loop_2992
	fmovrslz	%l1,	%f21,	%f16
	ld	[%l7 + 0x40],	%f17
	subccc	%g5,	%o0,	%o4
loop_2992:
	movle	%icc,	%o1,	%g3
	fmovrde	%i3,	%f28,	%f12
	andncc	%l3,	%l5,	%i1
	fbule	%fcc0,	loop_2993
	mulx	%g4,	%i5,	%i2
	edge8ln	%l2,	%g7,	%i7
	nop
	fitod	%f12,	%f30
	fdtos	%f30,	%f31
loop_2993:
	movpos	%xcc,	%o2,	%g6
	movrgez	%o7,	0x1C9,	%i4
	tneg	%xcc,	0x4
	sllx	%l6,	%i0,	%g1
	bshuffle	%f30,	%f14,	%f0
	fands	%f28,	%f25,	%f4
	ldstub	[%l7 + 0x5F],	%i6
	udivx	%l4,	0x1501,	%o5
	movrlez	%o3,	%l0,	%g2
	mulscc	%o6,	0x0E26,	%l1
	membar	0x78
	tgu	%xcc,	0x3
	movrne	%o0,	%g5,	%o1
	fmovsn	%icc,	%f6,	%f31
	brlz,a	%g3,	loop_2994
	st	%f2,	[%l7 + 0x2C]
	be,a	%icc,	loop_2995
	movre	%o4,	%i3,	%l3
loop_2994:
	taddcctv	%i1,	%l5,	%i5
	srax	%i2,	0x05,	%l2
loop_2995:
	bleu,pn	%xcc,	loop_2996
	sll	%g4,	0x18,	%g7
	array32	%o2,	%g6,	%o7
	movgu	%xcc,	%i7,	%i4
loop_2996:
	fmovsgu	%icc,	%f14,	%f22
	sdivcc	%i0,	0x10D1,	%l6
	fbl	%fcc3,	loop_2997
	movre	%g1,	0x39E,	%l4
	brlz	%o5,	loop_2998
	ld	[%l7 + 0x64],	%f26
loop_2997:
	bgu	%xcc,	loop_2999
	fmovsle	%xcc,	%f0,	%f22
loop_2998:
	fpackfix	%f14,	%f15
	fmovrslz	%o3,	%f7,	%f1
loop_2999:
	tsubcctv	%l0,	%i6,	%g2
	subccc	%l1,	%o0,	%o6
	sdivcc	%o1,	0x02B6,	%g3
	movrlz	%o4,	0x297,	%i3
	xnorcc	%g5,	0x148C,	%l3
	tle	%xcc,	0x0
	tg	%icc,	0x0
	movge	%xcc,	%i1,	%i5
	lduw	[%l7 + 0x28],	%l5
	addccc	%i2,	%g4,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc3,	loop_3000
	alignaddr	%o2,	%g6,	%o7
	move	%icc,	%l2,	%i7
	alignaddr	%i0,	%i4,	%g1
loop_3000:
	nop
	set	0x46, %g4
	lduha	[%l7 + %g4] 0x19,	%l6
	fmovrsgez	%l4,	%f11,	%f19
	fmovsne	%icc,	%f11,	%f15
	tvs	%icc,	0x0
	ldub	[%l7 + 0x75],	%o3
	nop
	set	0x30, %g1
	ldsw	[%l7 + %g1],	%o5
	xor	%i6,	0x0B64,	%l0
	brnz	%l1,	loop_3001
	bgu,a	%xcc,	loop_3002
	bne	%xcc,	loop_3003
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3001:
	andn	%g2,	%o6,	%o0
loop_3002:
	movcc	%icc,	%o1,	%g3
loop_3003:
	movvc	%xcc,	%i3,	%o4
	sethi	0x070D,	%l3
	fcmpeq32	%f14,	%f16,	%i1
	movle	%xcc,	%g5,	%l5
	bcc,pt	%icc,	loop_3004
	xnor	%i2,	%i5,	%g7
	fmovdcs	%icc,	%f3,	%f13
	udivx	%g4,	0x185F,	%g6
loop_3004:
	movle	%xcc,	%o7,	%o2
	be,pt	%icc,	loop_3005
	orcc	%l2,	%i0,	%i7
	membar	0x54
	udivcc	%g1,	0x1788,	%l6
loop_3005:
	tge	%xcc,	0x7
	brgez	%i4,	loop_3006
	movrgez	%l4,	0x1CC,	%o3
	sethi	0x06A5,	%o5
	array32	%i6,	%l0,	%l1
loop_3006:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%g2
	popc	0x1D0A,	%o0
	alignaddrl	%g3,	%i3,	%o1
	tn	%xcc,	0x4
	fnors	%f11,	%f27,	%f3
	fmovse	%xcc,	%f28,	%f18
	edge8l	%o4,	%i1,	%g5
	udivx	%l3,	0x02FF,	%l5
	sdiv	%i2,	0x06AD,	%i5
	movn	%xcc,	%g7,	%g4
	bn	loop_3007
	tge	%icc,	0x0
	tvc	%xcc,	0x1
	tneg	%icc,	0x0
loop_3007:
	array16	%g6,	%o2,	%l2
	edge8l	%i0,	%i7,	%g1
	fmul8sux16	%f30,	%f10,	%f14
	bgu,a,pn	%xcc,	loop_3008
	movrne	%o7,	%l6,	%l4
	movvc	%xcc,	%o3,	%o5
	subccc	%i6,	0x05FB,	%i4
loop_3008:
	tne	%xcc,	0x5
	tvs	%icc,	0x7
	brnz,a	%l0,	loop_3009
	fsrc2	%f24,	%f20
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x0c,	%f16
loop_3009:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x38] %asi,	%f4
	fmovdvs	%icc,	%f20,	%f19
	brlez	%l1,	loop_3010
	subcc	%g2,	%o0,	%g3
	tg	%icc,	0x0
	movn	%xcc,	%i3,	%o1
loop_3010:
	mulscc	%o6,	0x06A6,	%i1
	move	%icc,	%o4,	%l3
	orcc	%l5,	0x122D,	%g5
	ldsh	[%l7 + 0x54],	%i2
	tleu	%xcc,	0x5
	subcc	%i5,	0x0BAF,	%g7
	edge16l	%g4,	%o2,	%g6
	fmuld8ulx16	%f5,	%f23,	%f2
	movge	%xcc,	%l2,	%i0
	taddcc	%i7,	%o7,	%l6
	fmovrdgez	%g1,	%f22,	%f20
	fxnors	%f29,	%f18,	%f1
	tpos	%icc,	0x2
	sdivx	%l4,	0x0208,	%o5
	sdivcc	%i6,	0x17A6,	%o3
	tgu	%xcc,	0x1
	nop
	setx	loop_3011,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovs	%f12,	%f0
	set	0x14, %i5
	sta	%f30,	[%l7 + %i5] 0x11
loop_3011:
	movn	%icc,	%i4,	%l0
	fbue,a	%fcc2,	loop_3012
	edge16l	%l1,	%g2,	%o0
	tvc	%icc,	0x6
	bleu,pn	%xcc,	loop_3013
loop_3012:
	fnegd	%f24,	%f16
	taddcc	%i3,	%o1,	%o6
	ta	%icc,	0x0
loop_3013:
	nop
	setx	0x1048FC05,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	fmovdcc	%icc,	%f27,	%f16
	smulcc	%g3,	%o4,	%l3
	sra	%l5,	0x01,	%i1
	wr	%g0,	0x80,	%asi
	stha	%i2,	[%l7 + 0x20] %asi
	set	0x48, %i7
	stxa	%g5,	[%l7 + %i7] 0x14
	movrlz	%g7,	0x0A8,	%g4
	fmovdne	%xcc,	%f25,	%f10
	edge8n	%i5,	%o2,	%g6
	fblg,a	%fcc0,	loop_3014
	fbul	%fcc0,	loop_3015
	movle	%xcc,	%l2,	%i0
	sir	0x03AF
loop_3014:
	alignaddrl	%i7,	%o7,	%l6
loop_3015:
	fbo	%fcc1,	loop_3016
	srl	%g1,	0x0C,	%o5
	addcc	%l4,	0x112E,	%o3
	ldub	[%l7 + 0x47],	%i4
loop_3016:
	fsrc1	%f4,	%f26
	fnands	%f22,	%f24,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pt	%xcc,	loop_3017
	ta	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i6,	%l0,	%l1
loop_3017:
	popc	%g2,	%o0
	fbne,a	%fcc3,	loop_3018
	tl	%xcc,	0x2
	edge16ln	%i3,	%o6,	%g3
	fmovrse	%o1,	%f31,	%f15
loop_3018:
	brnz,a	%o4,	loop_3019
	sllx	%l5,	0x0F,	%l3
	edge32	%i2,	%g5,	%i1
	movrgz	%g7,	%g4,	%i5
loop_3019:
	xor	%g6,	%o2,	%i0
	tl	%icc,	0x4
	nop
	setx	0x710E1D48207F50E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	xorcc	%i7,	0x1112,	%l2
	movg	%icc,	%o7,	%g1
	edge8	%o5,	%l6,	%o3
	sra	%i4,	%l4,	%l0
	nop
	set	0x69, %l1
	ldsb	[%l7 + %l1],	%i6
	fmovrdgez	%l1,	%f0,	%f4
	move	%icc,	%o0,	%g2
	subc	%o6,	%g3,	%o1
	umulcc	%i3,	0x1506,	%o4
	brgz,a	%l5,	loop_3020
	tl	%icc,	0x3
	add	%i2,	0x1229,	%g5
	fbl,a	%fcc2,	loop_3021
loop_3020:
	and	%i1,	0x0D1F,	%g7
	edge8	%g4,	%i5,	%g6
	tl	%xcc,	0x2
loop_3021:
	nop
	setx	0xA2E2F9C3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x0FCB9D92,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f8,	%f12
	fpadd16s	%f14,	%f22,	%f28
	smulcc	%l3,	%o2,	%i0
	taddcc	%i7,	%l2,	%o7
	bgu,a	loop_3022
	fsrc1	%f10,	%f22
	bleu,pn	%xcc,	loop_3023
	subc	%o5,	%g1,	%o3
loop_3022:
	stw	%l6,	[%l7 + 0x7C]
	stbar
loop_3023:
	fpadd32	%f8,	%f10,	%f18
	movle	%xcc,	%i4,	%l0
	tn	%icc,	0x7
	xnorcc	%i6,	0x0B37,	%l1
	for	%f22,	%f26,	%f24
	fnand	%f16,	%f14,	%f28
	fmovsgu	%icc,	%f26,	%f20
	nop
	setx	0x00127DB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f1
	fmovrdne	%o0,	%f18,	%f26
	array16	%g2,	%l4,	%g3
	movg	%icc,	%o6,	%i3
	tcs	%icc,	0x3
	mova	%xcc,	%o1,	%l5
	alignaddrl	%i2,	%o4,	%i1
	fcmpne16	%f6,	%f26,	%g5
	tge	%icc,	0x6
	movg	%xcc,	%g7,	%g4
	flush	%l7 + 0x2C
	subcc	%g6,	0x151E,	%i5
	edge32	%l3,	%o2,	%i7
	tsubcctv	%i0,	0x1E3D,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x1
	mova	%xcc,	%l2,	%o5
	taddcc	%g1,	%o3,	%l6
	movn	%icc,	%i4,	%i6
	bg,pt	%icc,	loop_3024
	brgz,a	%l0,	loop_3025
	movrlez	%o0,	0x3B2,	%l1
	fornot2s	%f2,	%f29,	%f17
loop_3024:
	andn	%g2,	%l4,	%o6
loop_3025:
	movvc	%icc,	%i3,	%g3
	movle	%xcc,	%l5,	%o1
	udiv	%o4,	0x0C0D,	%i2
	movcs	%icc,	%i1,	%g5
	fsrc2s	%f8,	%f31
	umul	%g4,	%g7,	%i5
	sdiv	%l3,	0x1888,	%g6
	edge8n	%i7,	%o2,	%o7
	movvc	%xcc,	%i0,	%l2
	stbar
	fmul8sux16	%f8,	%f2,	%f0
	tge	%xcc,	0x7
	orn	%g1,	0x1761,	%o3
	movrne	%o5,	%i4,	%i6
	orncc	%l0,	%o0,	%l6
	movleu	%xcc,	%g2,	%l1
	sdiv	%l4,	0x1ABB,	%i3
	xnorcc	%g3,	%l5,	%o1
	sll	%o6,	0x05,	%i2
	ldd	[%l7 + 0x70],	%f16
	xor	%i1,	0x0B39,	%o4
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f28
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%g5
	edge8	%g4,	%g7,	%i5
	te	%xcc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%g6
	tne	%icc,	0x7
	fbne	%fcc1,	loop_3026
	sra	%o2,	0x00,	%o7
	nop
	set	0x44, %o4
	ldsb	[%l7 + %o4],	%i7
	movcc	%xcc,	%i0,	%g1
loop_3026:
	edge8ln	%l2,	%o5,	%i4
	fmul8ulx16	%f22,	%f20,	%f10
	set	0x64, %l0
	ldswa	[%l7 + %l0] 0x0c,	%o3
	tg	%xcc,	0x7
	ldstub	[%l7 + 0x5A],	%l0
	addcc	%o0,	%i6,	%g2
	movrlez	%l1,	0x0A8,	%l4
	fmovrdlz	%i3,	%f18,	%f0
	ldub	[%l7 + 0x7E],	%l6
	edge32l	%l5,	%o1,	%g3
	fxors	%f3,	%f16,	%f16
	tsubcctv	%o6,	0x1019,	%i2
	movre	%i1,	%g5,	%g4
	movneg	%xcc,	%g7,	%o4
	fmovsleu	%icc,	%f18,	%f12
	fbu	%fcc3,	loop_3027
	xor	%i5,	%l3,	%o2
	set	0x16, %o2
	lduba	[%l7 + %o2] 0x11,	%o7
loop_3027:
	movne	%xcc,	%i7,	%i0
	addcc	%g6,	0x0D97,	%l2
	brgz	%g1,	loop_3028
	smul	%o5,	%o3,	%l0
	fands	%f29,	%f10,	%f11
	fpadd16s	%f27,	%f29,	%f2
loop_3028:
	fbuge,a	%fcc1,	loop_3029
	fbl,a	%fcc3,	loop_3030
	call	loop_3031
	and	%o0,	0x0428,	%i4
loop_3029:
	udiv	%g2,	0x000E,	%l1
loop_3030:
	nop
	setx	0x1FFE0640E8BA982F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f14
loop_3031:
	ldub	[%l7 + 0x25],	%i6
	sdivx	%l4,	0x118B,	%i3
	movne	%xcc,	%l5,	%o1
	orncc	%l6,	0x1379,	%g3
	membar	0x3D
	edge16ln	%i2,	%o6,	%g5
	fbn	%fcc1,	loop_3032
	fmovrdgz	%g4,	%f22,	%f4
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x81,	%i0
loop_3032:
	alignaddr	%g7,	%i5,	%o4
	array8	%l3,	%o7,	%o2
	sllx	%i7,	0x12,	%i0
	edge32ln	%l2,	%g6,	%o5
	array32	%g1,	%l0,	%o0
	fmovrsgz	%o3,	%f31,	%f6
	bne,pt	%icc,	loop_3033
	bge	%icc,	loop_3034
	fmovs	%f21,	%f18
	edge32n	%g2,	%i4,	%l1
loop_3033:
	udivx	%i6,	0x1875,	%l4
loop_3034:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a,pt	%icc,	loop_3035
	fmovd	%f22,	%f20
	for	%f22,	%f10,	%f20
	edge32ln	%i3,	%o1,	%l6
loop_3035:
	ld	[%l7 + 0x24],	%f16
	fmovdleu	%xcc,	%f3,	%f28
	edge8l	%l5,	%i2,	%g3
	umul	%o6,	%g4,	%g5
	fmovde	%xcc,	%f26,	%f19
	xnor	%g7,	%i1,	%o4
	wr	%g0,	0x80,	%asi
	stba	%l3,	[%l7 + 0x5B] %asi
	movl	%xcc,	%i5,	%o7
	umul	%i7,	%o2,	%l2
	mulx	%i0,	0x1E32,	%o5
	tvc	%xcc,	0x7
	umul	%g6,	0x0C25,	%g1
	taddcctv	%l0,	%o3,	%g2
	movl	%xcc,	%i4,	%l1
	movle	%xcc,	%o0,	%l4
	prefetch	[%l7 + 0x70],	 0x2
	movn	%xcc,	%i6,	%i3
	fmovrdgez	%o1,	%f18,	%f26
	brz,a	%l5,	loop_3036
	edge8l	%l6,	%i2,	%o6
	fmovrdne	%g4,	%f16,	%f16
	srlx	%g5,	0x14,	%g3
loop_3036:
	brgez	%g7,	loop_3037
	fmovsleu	%xcc,	%f19,	%f3
	sllx	%i1,	%l3,	%o4
	tge	%icc,	0x6
loop_3037:
	fmovdn	%icc,	%f30,	%f20
	ble	loop_3038
	xor	%o7,	0x08FF,	%i5
	sth	%i7,	[%l7 + 0x1E]
	xnor	%o2,	%i0,	%l2
loop_3038:
	sra	%o5,	0x1A,	%g1
	fmovrslz	%g6,	%f8,	%f27
	fnors	%f9,	%f17,	%f23
	tsubcctv	%l0,	0x044E,	%g2
	faligndata	%f0,	%f22,	%f10
	fxnors	%f18,	%f10,	%f3
	movne	%icc,	%i4,	%o3
	fnors	%f2,	%f4,	%f0
	tpos	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o0,	%l4
	fcmple32	%f28,	%f28,	%i6
	sll	%l1,	%o1,	%i3
	fabsd	%f2,	%f2
	movne	%icc,	%l6,	%i2
	tneg	%xcc,	0x3
	addccc	%o6,	%l5,	%g4
	fnegd	%f22,	%f10
	nop
	setx	0x8948F14C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f17
	orncc	%g3,	%g5,	%i1
	movcc	%icc,	%l3,	%g7
	fornot1s	%f6,	%f11,	%f24
	fmovsneg	%icc,	%f5,	%f22
	fbn,a	%fcc1,	loop_3039
	nop
	fitod	%f24,	%f8
	move	%icc,	%o4,	%o7
	st	%f16,	[%l7 + 0x54]
loop_3039:
	fornot2	%f12,	%f0,	%f20
	srl	%i5,	0x12,	%i7
	stw	%o2,	[%l7 + 0x54]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2832
!	Type x   	: 1254
!	Type cti   	: 3039
!	Type f   	: 4521
!	Type i   	: 13354
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x39FE8AB0
.word 0x679AEF04
.word 0x65E51964
.word 0x76BC91C4
.word 0x3922D569
.word 0x4BCBB4AB
.word 0x4C35C15B
.word 0xA72422C7
.word 0xA9EE838E
.word 0x8C4B6C12
.word 0x81BEFF27
.word 0x33C65906
.word 0xB55C64F5
.word 0x4281A881
.word 0xF1065B09
.word 0xD550FE2B
.word 0x4B216B9B
.word 0x73A1C620
.word 0x19630168
.word 0x20F4DDF1
.word 0x1A21A3AA
.word 0xD038EB22
.word 0x8C7CE64C
.word 0x9097CA0C
.word 0x98D8B914
.word 0xE566E1FA
.word 0x50642DB9
.word 0x19950763
.word 0x10033FD6
.word 0x93CEBE1F
.word 0x6D7C598A
.word 0xF58C97BB
.word 0x5EB08A61
.word 0x3AE8D455
.word 0x08FC84CF
.word 0x4C49DEEF
.word 0x241B2978
.word 0xE7A1CF55
.word 0x10726D31
.word 0xE9425B4A
.word 0x0E8E6672
.word 0x06C37045
.word 0x3181EFCE
.word 0xD2296A92
.word 0x76C60EE8
.word 0x61D7D2A5
.word 0x1A75A12A
.word 0x092F9480
.word 0xF0B1D934
.word 0x49FB62F4
.word 0x6DAC73C3
.word 0xBCA99D4F
.word 0xA69E5D71
.word 0xC570C9A2
.word 0x79CD16FD
.word 0xB1D11A68
.word 0xC58924CF
.word 0xD2351713
.word 0x65B774A8
.word 0x8893A718
.word 0xE1606E11
.word 0x9081DB8E
.word 0xB6C607F2
.word 0x15FCB949
.end
