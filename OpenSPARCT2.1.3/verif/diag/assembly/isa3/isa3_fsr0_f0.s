/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr0_f0.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr0_f0.s,v 1.1.1.1 2007/02/13 22:20:15 drp Exp $"
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
	setx	0x1F427414B06F54F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0xF,	%g2
	set	0xB,	%g3
	set	0x3,	%g4
	set	0x3,	%g5
	set	0x6,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xE,	%i1
	set	-0x2,	%i2
	set	-0x2,	%i3
	set	-0xF,	%i4
	set	-0x2,	%i5
	set	-0x0,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x071C29AF,	%l0
	set	0x02930A51,	%l1
	set	0x75A7DF71,	%l2
	set	0x03E3F597,	%l3
	set	0x27382906,	%l4
	set	0x346820B5,	%l5
	set	0x0AE5E775,	%l6
	!# Output registers
	set	-0x1455,	%o0
	set	0x0878,	%o1
	set	0x1D5A,	%o2
	set	-0x18A3,	%o3
	set	0x0C7A,	%o4
	set	-0x04DB,	%o5
	set	0x078D,	%o6
	set	0x143B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xED925375584818A2)
	INIT_TH_FP_REG(%l7,%f2,0x073CA580E8B24ACE)
	INIT_TH_FP_REG(%l7,%f4,0x59958C912396A1DB)
	INIT_TH_FP_REG(%l7,%f6,0x6A3C9BD698151904)
	INIT_TH_FP_REG(%l7,%f8,0x5576B62969D6B709)
	INIT_TH_FP_REG(%l7,%f10,0x5CC7035EB4FE0CEC)
	INIT_TH_FP_REG(%l7,%f12,0xCCD05C16CEFA64BA)
	INIT_TH_FP_REG(%l7,%f14,0x9181EA7E9839232B)
	INIT_TH_FP_REG(%l7,%f16,0xF09508EDFDF16E71)
	INIT_TH_FP_REG(%l7,%f18,0x254CFE92E64E1EF2)
	INIT_TH_FP_REG(%l7,%f20,0x2CDFBE5666EB60A8)
	INIT_TH_FP_REG(%l7,%f22,0x061AA8920DA41075)
	INIT_TH_FP_REG(%l7,%f24,0x46779C14BC13ED8F)
	INIT_TH_FP_REG(%l7,%f26,0xBE39B065BDDA5696)
	INIT_TH_FP_REG(%l7,%f28,0x46AD5A25591D6063)
	INIT_TH_FP_REG(%l7,%f30,0x2FE0DD887486322C)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB90, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	swap	[%l7 + 0x28],	%g2
	mulx	%g6,	%l4,	%i3
	fmovs	%f25,	%f15
	tpos	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f21,	%f3,	%f3
	set	0x09, %o6
	ldstuba	[%l7 + %o6] 0x89,	%g4
	brgez	%g7,	loop_1
	fornot2	%f8,	%f12,	%f28
	fmovdpos	%icc,	%f16,	%f25
	xnor	%i6,	%g1,	%g5
loop_1:
	nop
	fitos	%f9,	%f28
	fstod	%f28,	%f14
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x64] %asi,	%o2
	ldd	[%l7 + 0x20],	%f16
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o4
	popc	0x100F,	%l1
	umul	%g3,	0x0F63,	%l2
	be	%icc,	loop_2
	fpsub32s	%f25,	%f18,	%f27
	nop
	setx	0xB20CAC755B149574,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x174BF5774130B6D1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f30
	tsubcctv	%i0,	%o5,	%l3
loop_2:
	fpack16	%f16,	%f29
	or	%o6,	%l0,	%i7
	xnorcc	%l6,	0x190E,	%i1
	movg	%icc,	%i5,	%l5
	tsubcctv	%o7,	0x17CE,	%i4
	fbuge	loop_3
	edge16	%i2,	%o3,	%o1
	ta	%icc,	0x2
	udiv	%g2,	0x1593,	%o0
loop_3:
	movvs	%xcc,	%g6,	%l4
	tsubcctv	%i3,	0x0C94,	%g4
	bne	loop_4
	tneg	%icc,	0x2
	movle	%xcc,	%g7,	%i6
	taddcctv	%g5,	0x1DD5,	%g1
loop_4:
	tvs	%icc,	0x1
	bcc,a	%xcc,	loop_5
	tg	%xcc,	0x7
	bcs,a	%icc,	loop_6
	fbne,a	%fcc2,	loop_7
loop_5:
	movre	%o4,	0x07C,	%o2
	orncc	%g3,	%l2,	%l1
loop_6:
	tcc	%xcc,	0x0
loop_7:
	st	%f9,	[%l7 + 0x74]
	fbg,a	%fcc0,	loop_8
	tgu	%xcc,	0x7
	fcmple32	%f8,	%f10,	%i0
	xnor	%o5,	%l3,	%o6
loop_8:
	move	%icc,	%i7,	%l6
	movne	%icc,	%l0,	%i5
	flush	%l7 + 0x74
	lduw	[%l7 + 0x38],	%l5
	stw	%i1,	[%l7 + 0x78]
	nop
	fitos	%f17,	%f6
	fsrc2s	%f19,	%f30
	ld	[%l7 + 0x08],	%f10
	andncc	%o7,	%i4,	%i2
	srlx	%o3,	0x1A,	%o1
	fmovrde	%o0,	%f18,	%f26
	fpsub32	%f28,	%f12,	%f8
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g6
	movvc	%icc,	%g2,	%l4
	udivcc	%i3,	0x0C04,	%g4
	nop
	setx	0xA7E578826049F0CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	movvc	%icc,	%i6,	%g7
	fmovdle	%xcc,	%f0,	%f25
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%g5
	subc	%o4,	0x17E5,	%g1
	nop
	setx	0x557C0A8450799BAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fpsub16	%f20,	%f14,	%f10
	edge16n	%g3,	%l2,	%l1
	edge8ln	%o2,	%o5,	%l3
	sll	%i0,	0x1B,	%i7
	fxors	%f25,	%f24,	%f5
	movpos	%xcc,	%l6,	%o6
	sll	%l0,	%l5,	%i5
	tneg	%icc,	0x0
	nop
	setx	loop_9,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu,a	%icc,	loop_10
	fmovdne	%icc,	%f8,	%f15
	tgu	%xcc,	0x7
loop_9:
	for	%f4,	%f12,	%f20
loop_10:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x0C] %asi,	%i1
	nop
	setx	loop_11,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1s	%f28,	%f18
	tge	%xcc,	0x5
	nop
	fitod	%f25,	%f24
loop_11:
	fsrc1	%f18,	%f26
	subccc	%i4,	0x0E45,	%i2
	ta	%icc,	0x6
	tl	%xcc,	0x4
	movrgz	%o7,	%o3,	%o0
	fnot1	%f14,	%f24
	edge16ln	%o1,	%g6,	%g2
	fbn,a	%fcc1,	loop_12
	edge32	%l4,	%i3,	%g4
	sdivcc	%g7,	0x1ACF,	%g5
	tge	%xcc,	0x1
loop_12:
	and	%i6,	%o4,	%g1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g3
	fmul8ulx16	%f6,	%f12,	%f22
	bl,a,pn	%xcc,	loop_13
	tle	%xcc,	0x1
	fbue,a	%fcc0,	loop_14
	ldx	[%l7 + 0x20],	%l2
loop_13:
	tsubcctv	%o2,	%l1,	%l3
	movle	%icc,	%i0,	%i7
loop_14:
	movg	%xcc,	%o5,	%o6
	tvs	%xcc,	0x1
	fbul,a	%fcc0,	loop_15
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f10
	tsubcc	%l6,	0x122C,	%l5
	ld	[%l7 + 0x34],	%f7
loop_15:
	fcmpne32	%f24,	%f24,	%l0
	movcc	%xcc,	%i1,	%i4
	add	%i2,	0x132C,	%o7
	move	%icc,	%o3,	%o0
	fmovrsne	%o1,	%f5,	%f3
	array8	%i5,	%g2,	%l4
	te	%xcc,	0x1
	nop
	setx	0x402FC8B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x684717DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f28,	%f7
	edge32ln	%g6,	%i3,	%g4
	tneg	%xcc,	0x2
	fmovsne	%icc,	%f31,	%f31
	fmul8x16au	%f2,	%f23,	%f24
	tsubcc	%g5,	0x1AE6,	%g7
	ldstub	[%l7 + 0x3A],	%o4
	set	0x26, %i3
	ldstuba	[%l7 + %i3] 0x0c,	%g1
	stb	%g3,	[%l7 + 0x0C]
	wr	%g0,	0x21,	%asi
	stxa	%i6,	[%g0 + 0x110] %asi
	sra	%o2,	0x07,	%l2
	movre	%l3,	0x1ED,	%l1
	movge	%icc,	%i0,	%i7
	fornot2s	%f16,	%f26,	%f4
	fmovdneg	%xcc,	%f26,	%f31
	andcc	%o5,	%l6,	%o6
	movcs	%xcc,	%l0,	%l5
	fmovdg	%xcc,	%f17,	%f3
	fbg	%fcc1,	loop_16
	fmovda	%icc,	%f5,	%f19
	edge8	%i4,	%i1,	%o7
	movrlez	%o3,	%o0,	%o1
loop_16:
	xnor	%i2,	0x1A1C,	%g2
	fcmpd	%fcc3,	%f8,	%f10
	fzeros	%f8
	edge8n	%i5,	%l4,	%i3
	andcc	%g4,	%g5,	%g6
	fornot1	%f4,	%f24,	%f6
	srlx	%g7,	%o4,	%g3
	tl	%icc,	0x7
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	and	%o2,	%l2,	%l3
	fmovdvc	%icc,	%f28,	%f3
	orcc	%i6,	0x1E28,	%i0
	tcc	%xcc,	0x1
	bneg,a,pn	%xcc,	loop_17
	ldx	[%l7 + 0x48],	%l1
	andncc	%o5,	%i7,	%o6
	taddcc	%l0,	%l5,	%l6
loop_17:
	movne	%xcc,	%i4,	%o7
	fzero	%f18
	ldd	[%l7 + 0x08],	%f0
	sub	%o3,	%o0,	%o1
	fsrc1s	%f0,	%f20
	bshuffle	%f8,	%f4,	%f2
	smul	%i2,	0x07F7,	%i1
	fbo,a	%fcc3,	loop_18
	movg	%xcc,	%g2,	%l4
	bcc,a	%icc,	loop_19
	sir	0x1E94
loop_18:
	fbn	loop_20
	fcmpgt32	%f24,	%f16,	%i3
loop_19:
	taddcc	%i5,	0x00E3,	%g4
	movge	%xcc,	%g5,	%g6
loop_20:
	nop
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd8,	%f0
	movneg	%xcc,	%g7,	%g3
	tne	%icc,	0x2
	edge32	%g1,	%o2,	%o4
	sdiv	%l3,	0x03C2,	%i6
	movrne	%l2,	%i0,	%l1
	ldsb	[%l7 + 0x2A],	%i7
	set	0x50, %o3
	lduwa	[%l7 + %o3] 0x80,	%o6
	array16	%l0,	%l5,	%l6
	movl	%icc,	%i4,	%o5
	nop
	fitod	%f0,	%f22
	fdtos	%f22,	%f14
	fbn,a	loop_21
	movgu	%icc,	%o7,	%o3
	ba,a	%xcc,	loop_22
	fbo	loop_23
loop_21:
	srl	%o1,	0x1E,	%i2
	movrne	%o0,	%i1,	%g2
loop_22:
	sdivx	%l4,	0x1FB6,	%i3
loop_23:
	fbe	loop_24
	alignaddr	%i5,	%g5,	%g6
	movleu	%icc,	%g7,	%g3
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x15,	 0x2
loop_24:
	movcc	%xcc,	%o2,	%g4
	fmovdge	%xcc,	%f4,	%f10
	movle	%xcc,	%o4,	%l3
	nop
	setx	loop_25,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlez,a	%l2,	loop_26
	fmovsgu	%xcc,	%f25,	%f8
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x16,	%f16
loop_25:
	edge32	%i0,	%i6,	%l1
loop_26:
	tgu	%icc,	0x4
	tge	%xcc,	0x6
	movcc	%xcc,	%o6,	%l0
	fmovdcc	%icc,	%f14,	%f11
	fmovsvc	%icc,	%f24,	%f27
	smul	%i7,	%l6,	%l5
	tg	%xcc,	0x6
	mulx	%i4,	0x11EA,	%o7
	edge16ln	%o3,	%o1,	%o5
	ldd	[%l7 + 0x40],	%o0
	movg	%icc,	%i1,	%i2
	edge8	%g2,	%i3,	%l4
	edge8l	%g5,	%i5,	%g7
	orncc	%g3,	0x173B,	%g6
	movrgz	%o2,	0x204,	%g4
	tcc	%xcc,	0x1
	stbar
	sub	%o4,	0x1371,	%l3
	fcmpeq16	%f4,	%f26,	%g1
	fands	%f1,	%f17,	%f14
	xor	%l2,	0x1152,	%i6
	stw	%l1,	[%l7 + 0x7C]
	movrgez	%o6,	0x399,	%l0
	brlez	%i7,	loop_27
	movrlez	%i0,	%l5,	%i4
	mova	%icc,	%o7,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27:
	bge,a,pn	%icc,	loop_28
	bge,a	%icc,	loop_29
	ld	[%l7 + 0x78],	%f16
	tvc	%xcc,	0x0
loop_28:
	udiv	%l6,	0x1290,	%o5
loop_29:
	mulx	%o1,	%i1,	%o0
	mova	%xcc,	%i2,	%g2
	bgu,a	loop_30
	edge16n	%l4,	%g5,	%i5
	tg	%xcc,	0x0
	mova	%xcc,	%g7,	%i3
loop_30:
	fpmerge	%f14,	%f13,	%f0
	bgu	loop_31
	nop
	fitos	%f30,	%f23
	fmovsle	%icc,	%f24,	%f7
	sra	%g6,	%o2,	%g3
loop_31:
	movg	%xcc,	%o4,	%l3
	sth	%g4,	[%l7 + 0x1C]
	set	0x6C, %g6
	lduwa	[%l7 + %g6] 0x0c,	%l2
	fmovrde	%g1,	%f10,	%f18
	fors	%f31,	%f1,	%f11
	edge8	%i6,	%o6,	%l1
	wr	%g0,	0x89,	%asi
	stba	%l0,	[%l7 + 0x69] %asi
	nop
	setx	0x3C53B1E000658EC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fbge	%fcc1,	loop_32
	fmovdvc	%xcc,	%f2,	%f9
	or	%i7,	%l5,	%i0
	smulcc	%i4,	0x05DA,	%o7
loop_32:
	fmovrslz	%l6,	%f7,	%f10
	addc	%o5,	0x07CC,	%o3
	tl	%xcc,	0x5
	sll	%i1,	%o1,	%i2
	bgu	%icc,	loop_33
	fzero	%f22
	movgu	%icc,	%g2,	%o0
	smul	%g5,	0x0225,	%l4
loop_33:
	orcc	%g7,	%i5,	%g6
	tl	%icc,	0x4
	fmovrse	%o2,	%f16,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g3,	[%l7 + 0x30]
	fmovrslz	%o4,	%f24,	%f29
	edge32ln	%i3,	%l3,	%g4
	fandnot1	%f28,	%f8,	%f2
	taddcc	%l2,	0x1DC5,	%i6
	xnorcc	%o6,	%g1,	%l1
	movneg	%icc,	%i7,	%l0
	andn	%i0,	0x16BF,	%i4
	membar	0x13
	ldsb	[%l7 + 0x1B],	%l5
	edge32ln	%o7,	%o5,	%o3
	edge16l	%i1,	%l6,	%o1
	fmovse	%icc,	%f18,	%f26
	movvc	%xcc,	%i2,	%o0
	alignaddrl	%g2,	%l4,	%g7
	srl	%i5,	0x12,	%g5
	movre	%o2,	%g3,	%g6
	nop
	setx	0xF37E1ECD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f20
	movrgz	%i3,	0x01C,	%l3
	andncc	%o4,	%g4,	%i6
	xnorcc	%l2,	0x0034,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i7
	edge32n	%g1,	%i0,	%l0
	brgez	%i4,	loop_34
	fmovdleu	%icc,	%f27,	%f13
	set	0x42, %i2
	ldstuba	[%l7 + %i2] 0x89,	%l5
loop_34:
	sll	%o5,	0x08,	%o7
	tge	%icc,	0x4
	movrlz	%i1,	%l6,	%o3
	fbue,a	loop_35
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%o1
	membar	0x61
	nop
	fitos	%f7,	%f24
	fstoi	%f24,	%f26
loop_35:
	nop
	set	0x48, %l3
	stha	%i2,	[%l7 + %l3] 0x22
	membar	#Sync
	ldd	[%l7 + 0x40],	%o0
	brz,a	%l4,	loop_36
	fbug,a	loop_37
	movle	%icc,	%g2,	%i5
	fnor	%f14,	%f10,	%f4
loop_36:
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f20
	fxtod	%f20,	%f30
loop_37:
	umulcc	%g7,	%o2,	%g5
	udiv	%g6,	0x02B2,	%g3
	set	0x70, %i5
	stxa	%l3,	[%l7 + %i5] 0x10
	fcmpeq32	%f14,	%f16,	%o4
	movvs	%icc,	%i3,	%i6
	edge16	%g4,	%o6,	%l1
	srl	%l2,	%g1,	%i0
	sethi	0x0C8B,	%l0
	fbge,a	%fcc2,	loop_38
	ta	%icc,	0x5
	nop
	setx	0x3EE4D53936D83936,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f18
	fmul8x16	%f11,	%f14,	%f2
loop_38:
	taddcc	%i4,	0x1928,	%i7
	add	%l5,	0x0D9E,	%o7
	edge32l	%o5,	%l6,	%o3
	movgu	%icc,	%i1,	%o1
	taddcc	%o0,	0x1ED2,	%l4
	fmovdleu	%icc,	%f27,	%f8
	bg,a,pn	%icc,	loop_39
	brz	%i2,	loop_40
	bne,a	loop_41
	fmovs	%f28,	%f26
loop_39:
	nop
	setx	loop_42,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_40:
	tcs	%icc,	0x7
loop_41:
	ldsh	[%l7 + 0x08],	%i5
	srl	%g7,	0x16,	%o2
loop_42:
	tcc	%xcc,	0x1
	tge	%icc,	0x3
	fornot1	%f10,	%f8,	%f8
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sdiv	%g2,	0x1445,	%g5
	tl	%xcc,	0x5
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f1
	fcmpne32	%f8,	%f12,	%g6
	umul	%g3,	%o4,	%l3
	fmovdgu	%xcc,	%f14,	%f14
	tvc	%icc,	0x2
	udivx	%i3,	0x07A8,	%i6
	andncc	%g4,	%o6,	%l1
	sethi	0x1127,	%g1
	edge16	%i0,	%l2,	%i4
	bpos,a,pn	%icc,	loop_43
	mova	%icc,	%l0,	%i7
	subccc	%l5,	%o5,	%l6
	tpos	%xcc,	0x2
loop_43:
	fmovrse	%o7,	%f10,	%f30
	and	%o3,	0x0AFD,	%o1
	set	0x4C, %o2
	ldsha	[%l7 + %o2] 0x0c,	%i1
	fnot2	%f16,	%f2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%i2
	addc	%i5,	0x04F0,	%g7
	fpadd32s	%f4,	%f24,	%f4
	fandnot2	%f0,	%f16,	%f30
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
	fmovrsne	%l4,	%f4,	%f9
	movvs	%xcc,	%g2,	%g6
	fnot1	%f2,	%f20
	fmovse	%xcc,	%f5,	%f30
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x20] %asi,	%f26
	add	%g3,	%o4,	%l3
	fnand	%f22,	%f2,	%f20
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f30
	addccc	%g5,	0x0915,	%i6
	movcs	%icc,	%i3,	%g4
	xorcc	%o6,	%l1,	%g1
	brnz	%i0,	loop_44
	nop
	set	0x50, %g5
	stx	%l2,	[%l7 + %g5]
	ld	[%l7 + 0x40],	%f9
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x54] %asi,	%i4
loop_44:
	movrgz	%i7,	%l0,	%l5
	fabss	%f28,	%f22
	and	%l6,	0x0D7F,	%o7
	tgu	%icc,	0x6
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%o2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x34] %asi,	%o1
	set	0x74, %l6
	sta	%f31,	[%l7 + %l6] 0x04
	edge8ln	%i1,	%o0,	%i2
	edge16l	%i5,	%g7,	%o5
	xorcc	%o2,	%g2,	%l4
	mulscc	%g3,	%o4,	%g6
	tneg	%icc,	0x7
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd1,	%f0
	edge32	%l3,	%g5,	%i3
	xorcc	%g4,	%o6,	%l1
	nop
	fitos	%f0,	%f8
	fstod	%f8,	%f30
	smulcc	%g1,	0x1C6A,	%i6
	sdiv	%l2,	0x02E6,	%i0
	edge8ln	%i7,	%i4,	%l0
	movn	%icc,	%l5,	%l6
	nop
	setx	0xDA28719C105A64CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fmovdle	%icc,	%f7,	%f25
	fandnot1s	%f6,	%f12,	%f4
	fxor	%f14,	%f0,	%f24
	set	0x4C, %o4
	sta	%f9,	[%l7 + %o4] 0x14
	tcs	%icc,	0x0
	subcc	%o3,	%o7,	%o1
	stw	%o0,	[%l7 + 0x14]
	call	loop_45
	edge16l	%i2,	%i5,	%i1
	or	%o5,	0x0B7A,	%g7
	edge32ln	%g2,	%l4,	%o2
loop_45:
	nop
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xc9
	tvc	%xcc,	0x1
	lduh	[%l7 + 0x38],	%g3
	bne,a	loop_46
	fmuld8sux16	%f23,	%f15,	%f16
	srlx	%g6,	0x05,	%l3
	subccc	%g5,	%i3,	%g4
loop_46:
	udivx	%o6,	0x0118,	%o4
	andncc	%l1,	%i6,	%l2
	faligndata	%f2,	%f26,	%f10
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i0
	movrne	%g1,	%i4,	%l0
	tge	%icc,	0x1
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x04
	nop
	setx	0x17176B6FEB7D34D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x03476CCEEC46141B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f0,	%f14
	movge	%icc,	%i7,	%l6
	subc	%o3,	0x0D20,	%l5
	ta	%xcc,	0x5
	movcc	%icc,	%o1,	%o0
	sethi	0x064B,	%i2
	andncc	%i5,	%o7,	%o5
	udivcc	%i1,	0x1386,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l4,	%o2,	%g3
	fmovdleu	%xcc,	%f9,	%f2
	sdivcc	%g6,	0x0DA8,	%l3
	edge8	%g5,	%g2,	%i3
	tsubcc	%o6,	%g4,	%o4
	movpos	%icc,	%i6,	%l1
	nop
	set	0x53, %l4
	ldstub	[%l7 + %l4],	%i0
	array8	%l2,	%g1,	%i4
	flush	%l7 + 0x14
	addc	%l0,	%i7,	%o3
	addc	%l5,	0x0123,	%o1
	fba,a	loop_47
	edge8ln	%o0,	%i2,	%l6
	bl,a	loop_48
	fbe	loop_49
loop_47:
	sethi	0x160B,	%o7
	andncc	%i5,	%o5,	%g7
loop_48:
	edge32l	%l4,	%i1,	%o2
loop_49:
	fandnot1	%f2,	%f6,	%f12
	fble	loop_50
	fbule	loop_51
	movpos	%xcc,	%g3,	%l3
	bne,a	%icc,	loop_52
loop_50:
	tne	%icc,	0x0
loop_51:
	movrgez	%g5,	0x3AE,	%g6
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i3
loop_52:
	nop
	set	0x40, %g2
	lduwa	[%l7 + %g2] 0x18,	%o6
	set	0x40, %o5
	stxa	%g4,	[%l7 + %o5] 0xe3
	membar	#Sync
	movl	%icc,	%g2,	%i6
	brgez,a	%l1,	loop_53
	tgu	%xcc,	0x5
	ble,a	loop_54
	smul	%o4,	0x1F87,	%l2
loop_53:
	fmovrdne	%g1,	%f30,	%f26
	fcmpd	%fcc3,	%f22,	%f28
loop_54:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x60] %asi,	%i0
	sra	%l0,	%i7,	%i4
	movge	%icc,	%o3,	%l5
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
	ldd	[%l7 + 0x70],	%o0
	edge8	%o0,	%i2,	%o7
	tn	%xcc,	0x0
loop_55:
	tvs	%icc,	0x5
	nop
	setx loop_56, %l0, %l1
	jmpl %l1, %i5
	array16	%o5,	%g7,	%l6
	sll	%l4,	%o2,	%g3
	movge	%icc,	%i1,	%l3
loop_56:
	udiv	%g6,	0x1FA7,	%i3
	sth	%o6,	[%l7 + 0x78]
	bvc	%xcc,	loop_57
	fbge	%fcc2,	loop_58
	movrgz	%g4,	0x34D,	%g5
	set	0x15, %i7
	ldsba	[%l7 + %i7] 0x10,	%i6
loop_57:
	movvc	%xcc,	%g2,	%l1
loop_58:
	or	%l2,	0x0D92,	%g1
	xnorcc	%i0,	%o4,	%i7
	brlz,a	%i4,	loop_59
	edge16ln	%l0,	%l5,	%o1
	fmuld8ulx16	%f23,	%f24,	%f28
	tpos	%icc,	0x0
loop_59:
	nop
	set	0x110, %o1
	ldxa	[%g0 + %o1] 0x21,	%o3
	movneg	%xcc,	%i2,	%o0
	bne,a,pn	%xcc,	loop_60
	movneg	%icc,	%i5,	%o5
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f22
	addccc	%o7,	%g7,	%l4
loop_60:
	ldd	[%l7 + 0x28],	%o2
	smul	%l6,	0x02D4,	%i1
	fpsub32s	%f26,	%f14,	%f10
	bcs,a	loop_61
	nop
	fitos	%f2,	%f18
	fstoi	%f18,	%f7
	edge16n	%g3,	%g6,	%i3
	movn	%icc,	%o6,	%l3
loop_61:
	edge16l	%g4,	%g5,	%g2
	ldd	[%l7 + 0x40],	%i6
	edge32	%l1,	%l2,	%g1
	movl	%icc,	%o4,	%i7
	brgez	%i4,	loop_62
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%i0
	tn	%icc,	0x1
	fpackfix	%f6,	%f31
loop_62:
	nop
	set	0x24, %o0
	swapa	[%l7 + %o0] 0x10,	%l0
	tsubcc	%o1,	%o3,	%l5
	addcc	%o0,	0x05AC,	%i2
	fandnot2s	%f23,	%f21,	%f5
	fandnot2	%f18,	%f26,	%f6
	bg,a	loop_63
	fmovdge	%icc,	%f24,	%f20
	ldx	[%l7 + 0x18],	%i5
	movpos	%xcc,	%o5,	%g7
loop_63:
	ldsw	[%l7 + 0x30],	%o7
	taddcc	%o2,	0x18E7,	%l6
	fxnors	%f20,	%f12,	%f21
	fmul8x16al	%f18,	%f17,	%f8
	edge8l	%i1,	%g3,	%l4
	addcc	%i3,	%g6,	%l3
	fabsd	%f20,	%f24
	srl	%o6,	%g5,	%g2
	edge8	%g4,	%i6,	%l1
	sll	%g1,	%o4,	%l2
	sdivx	%i7,	0x0BBB,	%i4
	alignaddrl	%i0,	%l0,	%o3
	nop
	setx	0xE018B3656E410CDF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x678237C7F70A7055,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f22,	%f26
	fpadd16	%f10,	%f12,	%f12
	fnors	%f8,	%f12,	%f30
	fabsd	%f8,	%f24
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x0c,	%o0
	subccc	%l5,	%i2,	%o0
	edge16n	%i5,	%g7,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o2,	%o5
	sdivcc	%l6,	0x1C95,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l4,	%i3
	bl,pn	%icc,	loop_64
	fornot2s	%f5,	%f20,	%f21
	brlz	%g6,	loop_65
	nop
	set	0x2B, %i4
	ldstub	[%l7 + %i4],	%l3
loop_64:
	orn	%i1,	%g5,	%o6
	subc	%g2,	%g4,	%i6
loop_65:
	xnor	%l1,	0x10F9,	%o4
	fornot1	%f28,	%f12,	%f6
	set	0x76, %o6
	stba	%l2,	[%l7 + %o6] 0x2a
	membar	#Sync
	movge	%xcc,	%g1,	%i7
	subcc	%i4,	0x1B03,	%l0
	nop
	setx	0x6399F3037AFEBFEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x319E1C7198F58A4F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f6,	%f22
	fabsd	%f22,	%f26
	fmovdneg	%xcc,	%f11,	%f31
	set	0x18, %i3
	stxa	%o3,	[%l7 + %i3] 0x0c
	stx	%i0,	[%l7 + 0x20]
	fmovdpos	%xcc,	%f18,	%f8
	subcc	%l5,	%i2,	%o0
	st	%f24,	[%l7 + 0x08]
	membar	0x31
	tneg	%icc,	0x2
	set	0x4A, %g1
	stba	%i5,	[%l7 + %g1] 0x04
	xnorcc	%g7,	%o7,	%o1
	edge8ln	%o2,	%l6,	%o5
	fba,a	loop_66
	bge,a	loop_67
	brgez	%l4,	loop_68
	fmovscs	%xcc,	%f3,	%f15
loop_66:
	addccc	%i3,	0x13A3,	%g3
loop_67:
	sdivcc	%g6,	0x13C0,	%l3
loop_68:
	fcmpne16	%f0,	%f24,	%i1
	sdivx	%g5,	0x1C1C,	%o6
	udivx	%g2,	0x1ABC,	%g4
	tcc	%icc,	0x1
	bn,pn	%xcc,	loop_69
	movn	%xcc,	%i6,	%o4
	bvc	loop_70
	udiv	%l2,	0x08CB,	%g1
loop_69:
	swap	[%l7 + 0x4C],	%l1
	bne,pt	%xcc,	loop_71
loop_70:
	fors	%f2,	%f6,	%f5
	fmovrsgez	%i7,	%f24,	%f29
	fsrc1s	%f17,	%f21
loop_71:
	fmovs	%f9,	%f7
	andncc	%l0,	%o3,	%i0
	edge8l	%i4,	%l5,	%i2
	sdivcc	%i5,	0x0A82,	%g7
	mulscc	%o0,	0x0F03,	%o1
	fones	%f12
	movrlez	%o2,	0x2FA,	%o7
	movneg	%icc,	%l6,	%o5
	fpadd32	%f4,	%f16,	%f16
	andn	%l4,	0x184E,	%g3
	nop
	set	0x28, %g3
	ldsh	[%l7 + %g3],	%g6
	xnorcc	%l3,	0x017D,	%i1
	tleu	%icc,	0x0
	fornot2	%f12,	%f6,	%f24
	set	0x44, %g7
	sta	%f12,	[%l7 + %g7] 0x10
	tcs	%icc,	0x3
	fmovdn	%xcc,	%f30,	%f17
	movrne	%i3,	%o6,	%g2
	tsubcctv	%g5,	%g4,	%o4
	wr	%g0,	0xe2,	%asi
	stxa	%i6,	[%l7 + 0x50] %asi
	membar	#Sync
	edge8n	%g1,	%l2,	%l1
	nop
	setx	loop_72,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%i7,	%l0,	%o3
	fbue	loop_73
	xnorcc	%i0,	0x169B,	%l5
loop_72:
	or	%i4,	%i5,	%g7
	tl	%icc,	0x4
loop_73:
	fbl	%fcc0,	loop_74
	fmovsvs	%icc,	%f11,	%f22
	andcc	%o0,	0x0D7B,	%i2
	be,a,pt	%xcc,	loop_75
loop_74:
	smulcc	%o1,	0x1026,	%o7
	fornot2s	%f13,	%f7,	%f10
	edge8	%l6,	%o5,	%o2
loop_75:
	bvs,a	loop_76
	edge16	%g3,	%g6,	%l3
	fmovdge	%xcc,	%f3,	%f17
	movvs	%xcc,	%i1,	%l4
loop_76:
	movrlz	%o6,	0x3E7,	%i3
	stbar
	bpos,a	loop_77
	taddcc	%g2,	0x1BE9,	%g4
	fmovdpos	%icc,	%f11,	%f25
	fmovdleu	%xcc,	%f14,	%f17
loop_77:
	tl	%icc,	0x5
	ld	[%l7 + 0x08],	%f5
	orncc	%g5,	%o4,	%g1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x3C] %asi,	%i6
	bvc,a,pt	%icc,	loop_78
	sllx	%l1,	0x1B,	%l2
	movrgz	%i7,	%l0,	%o3
	subcc	%i0,	0x011A,	%l5
loop_78:
	lduw	[%l7 + 0x0C],	%i5
	brgez,a	%i4,	loop_79
	tsubcctv	%o0,	0x0967,	%g7
	prefetch	[%l7 + 0x1C],	 0x3
	array8	%o1,	%i2,	%o7
loop_79:
	fmovsgu	%xcc,	%f2,	%f21
	srl	%o5,	0x1E,	%o2
	set	0x74, %g6
	ldsba	[%l7 + %g6] 0x11,	%l6
	movrlz	%g6,	0x259,	%g3
	fpadd32	%f2,	%f28,	%f0
	fbuge	loop_80
	tl	%icc,	0x0
	call	loop_81
	bleu,a	%icc,	loop_82
loop_80:
	andcc	%i1,	0x07FE,	%l4
	tneg	%xcc,	0x2
loop_81:
	sub	%o6,	%i3,	%g2
loop_82:
	mulscc	%g4,	0x1D3E,	%l3
	nop
	setx	0x44D30D31B0769646,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x7
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc9
	fbuge	%fcc0,	loop_83
	edge8n	%g5,	%g1,	%o4
	taddcctv	%l1,	%i6,	%i7
	tvs	%icc,	0x5
loop_83:
	fbne	loop_84
	fmovsneg	%xcc,	%f22,	%f10
	addc	%l0,	0x0D7E,	%l2
	bgu,a,pt	%icc,	loop_85
loop_84:
	st	%f17,	[%l7 + 0x74]
	fbn	%fcc3,	loop_86
	movl	%xcc,	%i0,	%l5
loop_85:
	nop
	set	0x37, %o3
	ldsba	[%l7 + %o3] 0x19,	%o3
loop_86:
	brlz,a	%i4,	loop_87
	umul	%i5,	0x1061,	%o0
	subccc	%o1,	0x10B3,	%g7
	be,a	%icc,	loop_88
loop_87:
	brnz	%o7,	loop_89
	fmul8x16al	%f25,	%f6,	%f4
	xorcc	%i2,	%o2,	%l6
loop_88:
	sll	%o5,	%g6,	%g3
loop_89:
	sethi	0x1F83,	%l4
	edge8ln	%i1,	%i3,	%o6
	movneg	%xcc,	%g4,	%l3
	nop
	fitos	%f9,	%f13
	fstod	%f13,	%f14
	alignaddrl	%g2,	%g5,	%g1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	or	%o4,	%l1,	%i6
	fcmpeq16	%f8,	%f12,	%i7
	membar	0x39
	sra	%l0,	0x08,	%l2
	stb	%i0,	[%l7 + 0x54]
	movcc	%icc,	%l5,	%o3
	alignaddr	%i4,	%o0,	%o1
	sdivx	%g7,	0x0721,	%i5
	udivcc	%i2,	0x193F,	%o2
	orncc	%l6,	%o5,	%g6
	movle	%icc,	%o7,	%l4
	tn	%icc,	0x1
	fnot2	%f10,	%f8
	subc	%i1,	0x0ACB,	%i3
	ldsh	[%l7 + 0x2E],	%g3
	tle	%icc,	0x5
	fbne,a	loop_90
	edge32ln	%o6,	%l3,	%g4
	orncc	%g2,	%g5,	%o4
	fbug	loop_91
loop_90:
	taddcctv	%l1,	%g1,	%i7
	movneg	%icc,	%l0,	%i6
	srax	%l2,	0x11,	%i0
loop_91:
	fmovdne	%icc,	%f20,	%f17
	tvs	%xcc,	0x5
	sll	%l5,	%o3,	%i4
	fmovspos	%icc,	%f26,	%f2
	tne	%xcc,	0x2
	subccc	%o1,	%o0,	%g7
	ldstub	[%l7 + 0x37],	%i2
	movl	%icc,	%i5,	%o2
	tl	%xcc,	0x1
	stx	%o5,	[%l7 + 0x08]
	nop
	fitod	%f4,	%f30
	fdtoi	%f30,	%f14
	sra	%l6,	0x15,	%o7
	bneg,pt	%xcc,	loop_92
	edge32l	%l4,	%g6,	%i1
	xnorcc	%g3,	%i3,	%l3
	fmovsvc	%xcc,	%f18,	%f29
loop_92:
	udiv	%o6,	0x1067,	%g4
	fnot2	%f16,	%f26
	move	%icc,	%g5,	%o4
	nop
	setx	0xFD8E951A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x0159B5DD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f10,	%f19
	fmovrse	%l1,	%f17,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g2,	%i7,	%l0
	edge8	%g1,	%i6,	%i0
	subcc	%l5,	0x186C,	%o3
	smulcc	%i4,	0x1EA8,	%l2
	subccc	%o1,	%g7,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x0c,	%i2,	%o2
	bge,pt	%xcc,	loop_93
	bneg,a,pt	%xcc,	loop_94
	ble,a	%xcc,	loop_95
	tneg	%xcc,	0x3
loop_93:
	fmovscs	%icc,	%f26,	%f26
loop_94:
	array16	%i5,	%l6,	%o7
loop_95:
	tsubcctv	%l4,	0x0FA2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g6,	%i1,	%i3
	movcc	%icc,	%l3,	%o6
	smulcc	%g4,	%g3,	%o4
	andncc	%l1,	%g5,	%i7
	fpsub32s	%f31,	%f14,	%f6
	sll	%l0,	0x15,	%g2
	tvs	%icc,	0x2
	fble	loop_96
	smulcc	%i6,	%i0,	%l5
	movrlez	%o3,	%i4,	%g1
	fcmpeq32	%f12,	%f26,	%o1
loop_96:
	bvc,a,pn	%xcc,	loop_97
	edge32	%g7,	%l2,	%i2
	tn	%xcc,	0x3
	fones	%f15
loop_97:
	array16	%o0,	%i5,	%o2
	movne	%icc,	%o7,	%l4
	andcc	%l6,	%g6,	%i1
	brnz	%o5,	loop_98
	fpsub32s	%f30,	%f21,	%f29
	or	%l3,	%i3,	%g4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x34] %asi,	%f31
loop_98:
	fbug	%fcc1,	loop_99
	fmovdcc	%icc,	%f7,	%f26
	fmovrde	%o6,	%f8,	%f18
	fsrc2s	%f26,	%f10
loop_99:
	ldsh	[%l7 + 0x4A],	%g3
	tsubcc	%l1,	0x159E,	%o4
	fcmps	%fcc3,	%f13,	%f6
	fpsub16s	%f20,	%f28,	%f7
	alignaddr	%g5,	%i7,	%l0
	movneg	%xcc,	%i6,	%g2
	movle	%xcc,	%i0,	%o3
	smul	%i4,	%g1,	%l5
	nop
	set	0x1E, %l3
	lduh	[%l7 + %l3],	%g7
	brz,a	%l2,	loop_100
	srlx	%i2,	0x11,	%o0
	fnegd	%f14,	%f24
	edge8	%o1,	%o2,	%o7
loop_100:
	addc	%l4,	0x05CB,	%i5
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x14,	%i6
	addc	%i1,	%o5,	%l3
	ldub	[%l7 + 0x22],	%i3
	movrlz	%g6,	%g4,	%g3
	movneg	%xcc,	%l1,	%o6
	fzero	%f30
	tvs	%xcc,	0x5
	sdiv	%g5,	0x1CA6,	%i7
	fblg,a	%fcc0,	loop_101
	fnands	%f29,	%f3,	%f14
	fsrc1s	%f15,	%f17
	flush	%l7 + 0x7C
loop_101:
	fornot1	%f16,	%f26,	%f22
	movrlez	%o4,	%l0,	%i6
	srlx	%g2,	%o3,	%i0
	andcc	%i4,	0x08F4,	%g1
	nop
	setx	0x5A8C411D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x7AFEAA55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f20,	%f3
	fbn,a	%fcc1,	loop_102
	stx	%l5,	[%l7 + 0x20]
	set	0x58, %i5
	stxa	%l2,	[%l7 + %i5] 0x10
loop_102:
	fones	%f18
	set	0x44, %o2
	ldsha	[%l7 + %o2] 0x04,	%i2
	movl	%icc,	%g7,	%o1
	andcc	%o2,	%o7,	%o0
	movl	%icc,	%i5,	%l6
	te	%icc,	0x1
	move	%xcc,	%l4,	%i1
	fbule,a	%fcc2,	loop_103
	umul	%l3,	0x1DB3,	%i3
	fmovdg	%icc,	%f13,	%f18
	sir	0x0131
loop_103:
	membar	0x7A
	fbge,a	%fcc1,	loop_104
	fmovdne	%xcc,	%f26,	%f17
	edge32ln	%o5,	%g4,	%g3
	xnor	%l1,	0x057B,	%o6
loop_104:
	add	%g6,	0x1A9B,	%i7
	brgz,a	%g5,	loop_105
	tneg	%icc,	0x2
	movcc	%xcc,	%l0,	%o4
	edge8	%g2,	%i6,	%o3
loop_105:
	fmovsleu	%xcc,	%f14,	%f3
	edge8n	%i4,	%g1,	%i0
	movneg	%icc,	%l2,	%i2
	stw	%l5,	[%l7 + 0x3C]
	sth	%o1,	[%l7 + 0x22]
	edge16ln	%o2,	%g7,	%o7
	sir	0x1788
	alignaddrl	%i5,	%o0,	%l4
	sir	0x0C93
	popc	%l6,	%i1
	flush	%l7 + 0x2C
	sethi	0x0534,	%l3
	lduh	[%l7 + 0x46],	%i3
	set	0x30, %i0
	swapa	[%l7 + %i0] 0x81,	%o5
	sir	0x18E0
	fmovspos	%icc,	%f0,	%f2
	movn	%xcc,	%g3,	%g4
	fmovdn	%icc,	%f10,	%f6
	nop
	fitos	%f27,	%f23
	alignaddrl	%o6,	%g6,	%i7
	lduw	[%l7 + 0x54],	%l1
	movrgez	%l0,	%g5,	%o4
	movgu	%xcc,	%g2,	%o3
	smul	%i6,	0x1782,	%g1
	prefetch	[%l7 + 0x0C],	 0x2
	fpsub32s	%f5,	%f22,	%f29
	wr	%g0,	0x80,	%asi
	stwa	%i4,	[%l7 + 0x14] %asi
	tg	%icc,	0x5
	addcc	%l2,	%i0,	%i2
	movge	%icc,	%o1,	%l5
	array32	%g7,	%o2,	%i5
	sth	%o0,	[%l7 + 0x3A]
	ldd	[%l7 + 0x68],	%f4
	stbar
	orn	%l4,	0x0960,	%l6
	nop
	setx	0xFAD4551E7358399F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xFF4444E5E4EF5EA9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f16,	%f10
	movrne	%o7,	0x204,	%i1
	fmovdcc	%xcc,	%f22,	%f31
	fpadd32s	%f15,	%f11,	%f19
	fmovdcs	%icc,	%f30,	%f24
	popc	%i3,	%l3
	movcs	%xcc,	%o5,	%g4
	fbn	loop_106
	andcc	%g3,	%g6,	%o6
	fcmpes	%fcc1,	%f16,	%f14
	tcc	%icc,	0x1
loop_106:
	movneg	%xcc,	%i7,	%l0
	subc	%l1,	0x1B32,	%o4
	popc	0x16E4,	%g2
	fcmpeq16	%f0,	%f22,	%g5
	edge32	%i6,	%o3,	%g1
	sdivx	%l2,	0x1D2C,	%i0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%i4
	edge8l	%i2,	%o1,	%g7
	sdivx	%l5,	0x19C7,	%o2
	fbug,a	loop_107
	movcs	%icc,	%o0,	%i5
	bcc	loop_108
	subc	%l6,	0x0502,	%o7
loop_107:
	edge8l	%i1,	%l4,	%l3
	tgu	%icc,	0x3
loop_108:
	alignaddrl	%o5,	%g4,	%i3
	tvs	%icc,	0x4
	or	%g6,	0x1F1C,	%g3
	addcc	%i7,	%o6,	%l1
	edge8ln	%o4,	%l0,	%g2
	nop
	fitos	%f2,	%f23
	fstod	%f23,	%f20
	brlez	%g5,	loop_109
	fbul,a	loop_110
	edge8	%i6,	%o3,	%l2
	swap	[%l7 + 0x34],	%i0
loop_109:
	tsubcc	%g1,	%i2,	%i4
loop_110:
	fpack16	%f12,	%f5
	st	%f16,	[%l7 + 0x58]
	fxors	%f10,	%f28,	%f18
	fmovsne	%icc,	%f21,	%f5
	fbug	%fcc3,	loop_111
	movneg	%icc,	%g7,	%o1
	bpos,a	loop_112
	sdivcc	%l5,	0x1E69,	%o2
loop_111:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
loop_112:
	fmul8x16	%f22,	%f26,	%f14
	andncc	%i5,	%o7,	%l6
	ble,a,pt	%icc,	loop_113
	fornot1s	%f15,	%f11,	%f2
	fnegd	%f22,	%f20
	fbule,a	loop_114
loop_113:
	tsubcctv	%l4,	%l3,	%i1
	xnor	%o5,	0x0370,	%g4
	movg	%xcc,	%g6,	%g3
loop_114:
	tg	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i3
	udivx	%o6,	0x081B,	%i7
	movrgez	%l1,	%o4,	%l0
	fabss	%f18,	%f19
	fmovdge	%icc,	%f25,	%f6
	udivcc	%g5,	0x12B5,	%g2
	fcmple32	%f14,	%f18,	%o3
	ldsw	[%l7 + 0x38],	%i6
	movrlez	%i0,	%g1,	%l2
	edge16l	%i4,	%i2,	%g7
	movvc	%icc,	%o1,	%l5
	set	0x10, %i1
	stxa	%o0,	[%g0 + %i1] 0x20
	edge32ln	%i5,	%o2,	%l6
	alignaddr	%l4,	%o7,	%i1
	stbar
	tvs	%icc,	0x0
	brlz,a	%l3,	loop_115
	edge32n	%g4,	%o5,	%g6
	alignaddrl	%g3,	%o6,	%i3
	fbu,a	loop_116
loop_115:
	tcs	%xcc,	0x7
	nop
	setx	0x1C782913,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x795C4233,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f26,	%f14
	brlez	%i7,	loop_117
loop_116:
	edge8n	%l1,	%l0,	%g5
	fmovrslez	%g2,	%f24,	%f26
	set	0x48, %l6
	lduba	[%l7 + %l6] 0x19,	%o4
loop_117:
	membar	0x1E
	nop
	setx	0xFFB20BFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x15C51915,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f9,	%f6
	fcmpeq32	%f18,	%f22,	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%g1
	taddcctv	%o3,	0x08ED,	%i4
	srax	%l2,	%i2,	%o1
	ta	%icc,	0x6
	movpos	%icc,	%l5,	%o0
	ldstub	[%l7 + 0x35],	%i5
	stb	%o2,	[%l7 + 0x66]
	tneg	%icc,	0x3
	orncc	%l6,	%g7,	%o7
	fbuge,a	loop_118
	edge8n	%l4,	%i1,	%g4
	tsubcctv	%l3,	0x1CEA,	%o5
	array32	%g3,	%o6,	%i3
loop_118:
	alignaddrl	%g6,	%i7,	%l1
	fmovde	%icc,	%f19,	%f13
	fabsd	%f6,	%f4
	add	%g5,	%g2,	%o4
	sdivcc	%l0,	0x141A,	%i6
	orcc	%g1,	%o3,	%i4
	subccc	%i0,	%l2,	%o1
	tvc	%xcc,	0x1
	fblg	%fcc0,	loop_119
	brlez	%l5,	loop_120
	ldx	[%l7 + 0x30],	%i2
	popc	%i5,	%o0
loop_119:
	orn	%l6,	%g7,	%o7
loop_120:
	nop
	setx	0x0E876F98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f27
	udivx	%l4,	0x1467,	%i1
	fbn,a	%fcc2,	loop_121
	tg	%icc,	0x1
	fmovsvc	%xcc,	%f4,	%f19
	edge8ln	%g4,	%o2,	%o5
loop_121:
	brlez,a	%g3,	loop_122
	sethi	0x0F89,	%l3
	bg,a,pt	%icc,	loop_123
	fcmpeq32	%f20,	%f10,	%o6
loop_122:
	fmul8x16au	%f19,	%f5,	%f12
	subc	%g6,	0x1133,	%i3
loop_123:
	mulscc	%i7,	%l1,	%g2
	fblg	loop_124
	sra	%g5,	0x07,	%o4
	tg	%icc,	0x4
	edge32l	%l0,	%g1,	%o3
loop_124:
	fbule,a	%fcc1,	loop_125
	fbo,a	%fcc2,	loop_126
	stb	%i4,	[%l7 + 0x4D]
	edge8	%i6,	%l2,	%i0
loop_125:
	fmovdneg	%xcc,	%f10,	%f13
loop_126:
	nop
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x15,	 0x3
	brlez	%o1,	loop_127
	add	%i5,	%i2,	%l6
	movleu	%icc,	%g7,	%o7
	mulx	%l4,	%o0,	%g4
loop_127:
	umulcc	%o2,	%o5,	%i1
	array16	%l3,	%g3,	%o6
	tl	%icc,	0x6
	membar	0x28
	tg	%icc,	0x6
	subc	%g6,	0x0A73,	%i3
	fxor	%f12,	%f24,	%f30
	edge8	%i7,	%g2,	%l1
	sir	0x13BE
	alignaddr	%g5,	%o4,	%l0
	sth	%o3,	[%l7 + 0x46]
	tle	%xcc,	0x1
	smulcc	%i4,	%i6,	%l2
	fmovdn	%xcc,	%f4,	%f23
	bleu,pt	%xcc,	loop_128
	andncc	%g1,	%i0,	%o1
	edge8	%l5,	%i2,	%l6
	orncc	%g7,	%i5,	%l4
loop_128:
	movrgz	%o0,	%g4,	%o2
	movrlz	%o7,	%i1,	%l3
	lduh	[%l7 + 0x46],	%g3
	movn	%xcc,	%o6,	%g6
	fbl,a	loop_129
	ld	[%l7 + 0x3C],	%f9
	tvs	%icc,	0x2
	movrlez	%o5,	%i3,	%i7
loop_129:
	sub	%g2,	0x0B77,	%l1
	sllx	%o4,	0x0E,	%g5
	movrgez	%o3,	%i4,	%i6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x44] %asi,	%l0
	tg	%xcc,	0x4
	xnor	%l2,	0x0E47,	%g1
	edge8n	%o1,	%i0,	%i2
	fcmped	%fcc3,	%f4,	%f24
	edge8	%l5,	%g7,	%i5
	movre	%l6,	0x184,	%o0
	nop
	setx	0x72AF712E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x6D833E3C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f23,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x1
	sdivcc	%l4,	0x08F4,	%g4
	umul	%o2,	0x1CF5,	%i1
	movvc	%xcc,	%l3,	%o7
	sethi	0x13DD,	%g3
	edge16ln	%o6,	%o5,	%i3
	fpadd32s	%f17,	%f9,	%f20
	fbul	loop_130
	ldsb	[%l7 + 0x47],	%g6
	tsubcc	%i7,	%l1,	%g2
	stw	%o4,	[%l7 + 0x10]
loop_130:
	fornot1s	%f15,	%f4,	%f18
	xor	%o3,	%g5,	%i6
	movl	%xcc,	%i4,	%l0
	nop
	setx	loop_131,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x4
	bneg,a,pt	%icc,	loop_132
	edge32l	%g1,	%o1,	%i0
loop_131:
	tcs	%xcc,	0x5
	be,a,pt	%xcc,	loop_133
loop_132:
	add	%i2,	%l5,	%g7
	tvs	%xcc,	0x6
	ldsh	[%l7 + 0x58],	%l2
loop_133:
	fbue,a	%fcc1,	loop_134
	movrgz	%l6,	0x3EC,	%o0
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
	edge16ln	%l4,	%i5,	%o2
loop_134:
	xorcc	%g4,	%i1,	%l3
	orn	%g3,	%o7,	%o6
loop_135:
	bl,a	%icc,	loop_136
	mova	%xcc,	%i3,	%o5
	nop
	fitod	%f7,	%f0
	nop
	setx	0x61741041491C4187,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x24DB17CECD1E6172,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f16
loop_136:
	mova	%icc,	%g6,	%l1
	fmovrdne	%g2,	%f8,	%f4
	movne	%icc,	%o4,	%o3
	st	%f11,	[%l7 + 0x60]
	umul	%i7,	0x127E,	%i6
	fnors	%f31,	%f17,	%f20
	bne	%icc,	loop_137
	bleu	loop_138
	popc	0x0BB2,	%i4
	add	%l0,	%g1,	%g5
loop_137:
	nop
	setx	0xD70BDB05F06C58E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_138:
	udivcc	%i0,	0x1425,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f1,	%f24,	%f6
	fmovrsne	%l5,	%f19,	%f5
	xnorcc	%g7,	%l2,	%o1
	array32	%l6,	%l4,	%o0
	fbe,a	loop_139
	brlez,a	%o2,	loop_140
	movg	%icc,	%i5,	%i1
	movrne	%l3,	%g4,	%g3
loop_139:
	xnorcc	%o7,	%o6,	%i3
loop_140:
	edge8	%g6,	%o5,	%g2
	edge8l	%l1,	%o4,	%o3
	addc	%i6,	0x19EB,	%i7
	membar	0x18
	smul	%l0,	%g1,	%i4
	bshuffle	%f8,	%f12,	%f18
	nop
	setx	loop_141,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_142,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%i0,	%i2,	%g5
	tpos	%xcc,	0x5
loop_141:
	edge32ln	%g7,	%l2,	%l5
loop_142:
	tsubcc	%l6,	%o1,	%o0
	fbul,a	%fcc1,	loop_143
	srlx	%l4,	0x02,	%o2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x68] %asi,	%i1
loop_143:
	edge16ln	%l3,	%g4,	%g3
	fabss	%f25,	%f8
	tneg	%icc,	0x0
	alignaddr	%o7,	%i5,	%i3
	sdivcc	%o6,	0x1756,	%g6
	tgu	%icc,	0x4
	tsubcctv	%o5,	%g2,	%o4
	sethi	0x19CB,	%o3
	array16	%l1,	%i7,	%l0
	brgz	%g1,	loop_144
	fbuge	%fcc2,	loop_145
	prefetch	[%l7 + 0x24],	 0x2
	fmovdl	%xcc,	%f9,	%f28
loop_144:
	nop
	set	0x40, %o4
	std	%f8,	[%l7 + %o4]
loop_145:
	movrlz	%i6,	%i0,	%i4
	ldstub	[%l7 + 0x57],	%g5
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x14] %asi,	%i2
	edge16l	%l2,	%g7,	%l6
	fbg	loop_146
	bn,pn	%xcc,	loop_147
	be,a	loop_148
	fmovs	%f1,	%f20
loop_146:
	fnands	%f22,	%f29,	%f2
loop_147:
	nop
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xca
loop_148:
	fexpand	%f9,	%f20
	fmovrslz	%l5,	%f22,	%f23
	movcs	%icc,	%o1,	%o0
	nop
	setx	0x9D7A6FFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xEEDA5944,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f23,	%f4
	mulscc	%l4,	0x0671,	%o2
	edge32ln	%l3,	%i1,	%g4
	srl	%o7,	%g3,	%i3
	bge	loop_149
	edge8ln	%i5,	%o6,	%o5
	tsubcc	%g6,	0x0199,	%g2
	umul	%o3,	0x02AF,	%l1
loop_149:
	movleu	%xcc,	%o4,	%i7
	udivcc	%g1,	0x0F8A,	%l0
	srl	%i6,	0x04,	%i4
	sir	0x19B6
	fmovscc	%xcc,	%f14,	%f4
	fpmerge	%f27,	%f5,	%f28
	xor	%i0,	0x0ABC,	%g5
	sll	%l2,	0x0F,	%g7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6A] %asi,	%i2
	smul	%l5,	%o1,	%o0
	flush	%l7 + 0x6C
	subccc	%l4,	0x0B2D,	%l6
	nop
	setx	0x2061B5F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fpack16	%f26,	%f24
	ba,a	loop_150
	movl	%icc,	%o2,	%i1
	or	%l3,	%g4,	%o7
	ldsb	[%l7 + 0x3E],	%i3
loop_150:
	fnor	%f14,	%f14,	%f10
	fpack16	%f16,	%f28
	nop
	setx	loop_151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%g3,	%o6,	%o5
	tvs	%xcc,	0x4
	move	%icc,	%g6,	%g2
loop_151:
	tne	%xcc,	0x5
	subcc	%i5,	0x0EF1,	%l1
	alignaddr	%o4,	%i7,	%g1
	mulscc	%l0,	0x1937,	%o3
	orncc	%i4,	%i0,	%i6
	nop
	fitod	%f12,	%f2
	fdtox	%f2,	%f8
	tsubcctv	%g5,	%l2,	%i2
	bneg,a,pt	%icc,	loop_152
	fabss	%f19,	%f1
	tleu	%icc,	0x0
	edge16l	%l5,	%g7,	%o0
loop_152:
	addccc	%o1,	0x1D65,	%l4
	tne	%xcc,	0x1
	bn	loop_153
	tvs	%xcc,	0x6
	ldstub	[%l7 + 0x74],	%o2
	or	%i1,	0x1FEC,	%l6
loop_153:
	movneg	%xcc,	%g4,	%l3
	tvc	%xcc,	0x7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o7
	sethi	0x051A,	%o6
	bcs,a,pt	%xcc,	loop_154
	umul	%g3,	0x02AA,	%g6
	edge32	%o5,	%g2,	%i5
	movl	%xcc,	%o4,	%i7
loop_154:
	movn	%xcc,	%l1,	%l0
	andn	%o3,	%g1,	%i0
	fmovdleu	%xcc,	%f26,	%f28
	ldd	[%l7 + 0x18],	%f22
	tneg	%xcc,	0x0
	tneg	%icc,	0x1
	fmovrslz	%i6,	%f12,	%f4
	xor	%g5,	0x0B45,	%l2
	fpackfix	%f16,	%f14
	movneg	%xcc,	%i2,	%i4
	addccc	%l5,	%g7,	%o0
	movl	%xcc,	%l4,	%o1
	sra	%i1,	%l6,	%o2
	umul	%g4,	0x11AC,	%i3
	bcc,a	%icc,	loop_155
	fmul8sux16	%f20,	%f4,	%f22
	tneg	%xcc,	0x0
	movpos	%icc,	%l3,	%o6
loop_155:
	andncc	%g3,	%g6,	%o7
	fones	%f5
	fcmple16	%f4,	%f4,	%o5
	edge16ln	%i5,	%o4,	%i7
	tleu	%icc,	0x0
	fmovsa	%xcc,	%f27,	%f27
	movn	%icc,	%l1,	%l0
	fble	%fcc3,	loop_156
	array32	%o3,	%g1,	%g2
	nop
	fitos	%f11,	%f6
	fstod	%f6,	%f8
	addc	%i0,	%g5,	%i6
loop_156:
	fbu,a	%fcc2,	loop_157
	fands	%f10,	%f7,	%f19
	xorcc	%l2,	%i2,	%i4
	nop
	setx	0xF6886E28197CD656,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f14
loop_157:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x18, %l5
	ldxa	[%g0 + %l5] 0x4f,	%g7
	bl,pt	%xcc,	loop_158
	tsubcc	%o0,	%l4,	%l5
	fpadd16s	%f9,	%f31,	%f22
	tpos	%icc,	0x5
loop_158:
	movn	%xcc,	%o1,	%i1
	fpsub16s	%f17,	%f21,	%f3
	set	0x7C, %l4
	stha	%o2,	[%l7 + %l4] 0x2b
	membar	#Sync
	tneg	%xcc,	0x0
	bl,pn	%xcc,	loop_159
	fble,a	loop_160
	brnz	%l6,	loop_161
	fone	%f2
loop_159:
	ta	%icc,	0x4
loop_160:
	tn	%xcc,	0x1
loop_161:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x29] %asi,	%i3
	tcs	%icc,	0x5
	fbuge	%fcc2,	loop_162
	edge16n	%g4,	%l3,	%g3
	edge16l	%o6,	%g6,	%o5
	nop
	setx	loop_163,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_162:
	tvs	%icc,	0x2
	tn	%icc,	0x0
	sdivx	%i5,	0x062C,	%o4
loop_163:
	fbl,a	%fcc0,	loop_164
	udivx	%o7,	0x0F2B,	%l1
	fpadd16s	%f7,	%f3,	%f28
	nop
	set	0x14, %o7
	prefetch	[%l7 + %o7],	 0x1
loop_164:
	edge32n	%i7,	%l0,	%o3
	fmul8x16au	%f10,	%f6,	%f0
	fmovde	%icc,	%f11,	%f16
	brgez	%g2,	loop_165
	fpack16	%f6,	%f3
	tl	%xcc,	0x3
	add	%i0,	0x1256,	%g5
loop_165:
	fcmpd	%fcc2,	%f6,	%f0
	membar	0x61
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g1,	%i6
	set	0x5C, %g2
	ldsba	[%l7 + %g2] 0x89,	%l2
	bvc	loop_166
	addcc	%i2,	%i4,	%o0
	umul	%l4,	%l5,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_166:
	movcs	%icc,	%g7,	%o2
	edge16ln	%l6,	%i3,	%i1
	bgu	loop_167
	movrgz	%l3,	%g3,	%o6
	edge8n	%g6,	%o5,	%i5
	bge,a	loop_168
loop_167:
	fnand	%f12,	%f8,	%f4
	wr	%g0,	0x80,	%asi
	stha	%g4,	[%l7 + 0x54] %asi
loop_168:
	movvs	%xcc,	%o4,	%o7
	fexpand	%f18,	%f16
	udivcc	%l1,	0x0A36,	%l0
	addc	%i7,	0x03C8,	%o3
	srl	%g2,	0x16,	%g5
	edge32l	%g1,	%i0,	%l2
	bg	loop_169
	tsubcc	%i2,	0x0362,	%i4
	orncc	%i6,	0x1F1C,	%o0
	array8	%l5,	%o1,	%l4
loop_169:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g7
	tle	%icc,	0x0
	ldd	[%l7 + 0x60],	%i6
	fmovsle	%xcc,	%f14,	%f24
	umul	%i3,	0x170A,	%o2
	sdivx	%l3,	0x04A8,	%i1
	taddcc	%o6,	0x0503,	%g6
	tn	%icc,	0x7
	nop
	setx	0xF9C4D9D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x570032A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f22,	%f21
	movleu	%icc,	%o5,	%i5
	tsubcctv	%g4,	0x142A,	%g3
	tn	%icc,	0x7
	fpackfix	%f20,	%f29
	fsrc2	%f0,	%f30
	brnz,a	%o4,	loop_170
	and	%o7,	%l1,	%l0
	fornot2	%f6,	%f14,	%f30
	fcmpgt32	%f6,	%f20,	%i7
loop_170:
	bvs	loop_171
	taddcctv	%g2,	0x0B41,	%o3
	taddcctv	%g1,	%i0,	%l2
	sllx	%i2,	%g5,	%i4
loop_171:
	nop
	set	0x4E, %i7
	ldsha	[%l7 + %i7] 0x19,	%o0
	movvs	%icc,	%l5,	%i6
	and	%o1,	0x1396,	%l4
	subccc	%l6,	0x1FA7,	%g7
	udivcc	%i3,	0x0EF2,	%o2
	tcs	%icc,	0x6
	movle	%icc,	%l3,	%o6
	movn	%xcc,	%i1,	%o5
	array8	%i5,	%g4,	%g3
	fnors	%f30,	%f8,	%f12
	edge8l	%g6,	%o7,	%l1
	bl	%xcc,	loop_172
	brgez	%o4,	loop_173
	movvs	%icc,	%i7,	%l0
	and	%o3,	0x0F21,	%g1
loop_172:
	fmovdgu	%xcc,	%f23,	%f23
loop_173:
	add	%g2,	%l2,	%i2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd1,	%f0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g5
	alignaddr	%i0,	%o0,	%l5
	set	0x53, %o1
	ldstuba	[%l7 + %o1] 0x04,	%i4
	popc	%i6,	%l4
	tge	%icc,	0x5
	smul	%l6,	%g7,	%i3
	bvc,pn	%icc,	loop_174
	tg	%icc,	0x3
	movg	%xcc,	%o1,	%l3
	fbug	loop_175
loop_174:
	udiv	%o2,	0x18A5,	%i1
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x60] %asi,	%o6
loop_175:
	taddcc	%o5,	0x07E9,	%i5
	popc	%g3,	%g4
	movvs	%icc,	%o7,	%l1
	fmovrsgez	%g6,	%f17,	%f0
	fmovdneg	%icc,	%f10,	%f22
	fmul8x16al	%f7,	%f25,	%f0
	stw	%i7,	[%l7 + 0x4C]
	movvs	%icc,	%l0,	%o3
	sethi	0x1FDF,	%o4
	sdivx	%g2,	0x1185,	%g1
	movvc	%xcc,	%l2,	%i2
	edge16n	%g5,	%o0,	%i0
	sir	0x1155
	movre	%i4,	%l5,	%i6
	movcs	%icc,	%l4,	%g7
	fornot1	%f24,	%f26,	%f0
	edge32	%i3,	%l6,	%o1
	ldsb	[%l7 + 0x73],	%l3
	sir	0x097D
	fmovrslz	%i1,	%f28,	%f20
	fabss	%f30,	%f28
	move	%icc,	%o6,	%o2
	brlez,a	%o5,	loop_176
	movleu	%xcc,	%i5,	%g4
	fcmps	%fcc1,	%f28,	%f31
	movge	%xcc,	%g3,	%o7
loop_176:
	nop
	setx	loop_177,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x09ED,	%l1
	nop
	setx	0x754E43094FA90F32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9072BE8E37A75334,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f0,	%f18
	movrlez	%g6,	%l0,	%o3
loop_177:
	fbuge,a	%fcc1,	loop_178
	nop
	setx	0x2D09CE896C5872B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x55FE50989E8DC396,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f22,	%f22
	bshuffle	%f6,	%f18,	%f4
	tsubcc	%o4,	0x1675,	%g2
loop_178:
	ldsh	[%l7 + 0x2C],	%i7
	tge	%xcc,	0x1
	ldsh	[%l7 + 0x4E],	%g1
	fandnot2	%f2,	%f2,	%f30
	tn	%icc,	0x1
	ldd	[%l7 + 0x20],	%f12
	bne,a	%xcc,	loop_179
	or	%l2,	%g5,	%i2
	brgz	%o0,	loop_180
	movge	%xcc,	%i0,	%l5
loop_179:
	alignaddrl	%i4,	%i6,	%g7
	nop
	fitos	%f25,	%f23
loop_180:
	fandnot2	%f24,	%f24,	%f18
	movne	%xcc,	%l4,	%l6
	udiv	%i3,	0x0828,	%l3
	brz	%o1,	loop_181
	fbug,a	%fcc3,	loop_182
	fmovdvs	%icc,	%f20,	%f15
	subcc	%i1,	0x13D9,	%o2
loop_181:
	stbar
loop_182:
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f13
	movgu	%xcc,	%o5,	%o6
	fmul8sux16	%f6,	%f24,	%f10
	alignaddrl	%g4,	%i5,	%o7
	addccc	%g3,	0x1F79,	%g6
	edge32n	%l0,	%l1,	%o4
	tn	%icc,	0x7
	fmovdcc	%xcc,	%f4,	%f2
	ta	%xcc,	0x7
	fbe,a	%fcc0,	loop_183
	sdivx	%o3,	0x010C,	%i7
	addcc	%g1,	%g2,	%l2
	movcc	%xcc,	%i2,	%o0
loop_183:
	ble,pt	%xcc,	loop_184
	nop
	setx loop_185, %l0, %l1
	jmpl %l1, %i0
	sdivx	%l5,	0x060F,	%g5
	brnz	%i6,	loop_186
loop_184:
	ldsb	[%l7 + 0x43],	%i4
loop_185:
	edge8ln	%g7,	%l6,	%i3
	edge16ln	%l3,	%l4,	%i1
loop_186:
	movpos	%xcc,	%o1,	%o2
	edge8l	%o6,	%o5,	%i5
	tleu	%icc,	0x2
	sdivcc	%g4,	0x097D,	%o7
	movne	%xcc,	%g6,	%l0
	fones	%f7
	smulcc	%l1,	%o4,	%o3
	set	0x7A, %g4
	stha	%i7,	[%l7 + %g4] 0x27
	membar	#Sync
	fmovdn	%xcc,	%f24,	%f18
	fandnot2s	%f13,	%f26,	%f9
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g1
	fba,a	%fcc0,	loop_187
	srl	%g3,	%l2,	%i2
	fmuld8ulx16	%f29,	%f30,	%f18
	tcc	%xcc,	0x6
loop_187:
	tge	%xcc,	0x7
	orn	%o0,	0x13C2,	%i0
	srl	%g2,	0x0D,	%l5
	tneg	%icc,	0x3
	fpadd32	%f18,	%f16,	%f10
	fmovsge	%xcc,	%f1,	%f1
	sll	%i6,	0x1C,	%i4
	addc	%g7,	0x01AA,	%g5
	umulcc	%l6,	%i3,	%l4
	membar	0x18
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l3
	movgu	%xcc,	%o1,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	loop_188
	srlx	%o6,	%o5,	%i5
	fcmpeq32	%f26,	%f20,	%o2
	xnor	%o7,	0x0D36,	%g6
loop_188:
	fpsub32	%f2,	%f6,	%f0
	fbg	loop_189
	nop
	setx	0x8256F073CCF36C50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x39C0C0FB71F361B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f24,	%f20
	tle	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%l0
loop_189:
	fandnot2s	%f8,	%f16,	%f14
	sdivcc	%g4,	0x17CC,	%o4
	ta	%icc,	0x1
	tvs	%icc,	0x3
	bleu,a	loop_190
	movcc	%xcc,	%o3,	%l1
	movvc	%xcc,	%i7,	%g3
	ldd	[%l7 + 0x20],	%f26
loop_190:
	fbul	%fcc1,	loop_191
	movl	%icc,	%l2,	%i2
	fmovdle	%xcc,	%f0,	%f15
	stbar
loop_191:
	fmovrdgz	%g1,	%f2,	%f16
	ba,a,pn	%icc,	loop_192
	fsrc2	%f18,	%f0
	be,a	loop_193
	orcc	%i0,	%g2,	%o0
loop_192:
	fornot2s	%f18,	%f20,	%f27
	movgu	%icc,	%l5,	%i4
loop_193:
	tneg	%icc,	0x0
	bn,a,pt	%xcc,	loop_194
	fbne	loop_195
	subcc	%i6,	%g7,	%g5
	udiv	%i3,	0x14C7,	%l6
loop_194:
	fornot1	%f14,	%f14,	%f18
loop_195:
	edge32	%l4,	%l3,	%o1
	sra	%o6,	%o5,	%i1
	set	0x68, %o0
	ldswa	[%l7 + %o0] 0x14,	%i5
	nop
	fitos	%f14,	%f6
	fzero	%f4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o7
	fmovrslz	%g6,	%f31,	%f4
	tg	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l0
	fsrc2	%f28,	%f18
	udiv	%g4,	0x0E1C,	%o4
	tn	%xcc,	0x3
	fcmpeq32	%f28,	%f6,	%o3
	fnands	%f23,	%f16,	%f17
	smulcc	%l1,	%i7,	%g3
	movgu	%xcc,	%o2,	%i2
	edge16n	%g1,	%i0,	%g2
	fmovdneg	%xcc,	%f12,	%f10
	fmuld8sux16	%f18,	%f12,	%f20
	edge32ln	%o0,	%l5,	%l2
	nop
	setx	0x0FA1EB54E04ADBF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	xnor	%i6,	0x10C3,	%g7
	fbne,a	%fcc1,	loop_196
	fpadd32	%f2,	%f24,	%f22
	movne	%xcc,	%i4,	%g5
	fsrc1s	%f7,	%f18
loop_196:
	tsubcc	%l6,	0x113D,	%i3
	array32	%l3,	%l4,	%o6
	stx	%o1,	[%l7 + 0x20]
	sra	%o5,	%i1,	%i5
	set	0x78, %i6
	sta	%f29,	[%l7 + %i6] 0x11
	udiv	%g6,	0x14D4,	%o7
	tcs	%xcc,	0x5
	fnand	%f14,	%f4,	%f22
	nop
	fitos	%f24,	%f26
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f8
	fxtod	%f8,	%f18
	ldub	[%l7 + 0x4D],	%g4
	fnands	%f4,	%f18,	%f17
	swap	[%l7 + 0x68],	%o4
	edge16	%o3,	%l1,	%i7
	tge	%xcc,	0x7
	andncc	%l0,	%o2,	%i2
	tge	%xcc,	0x1
	bleu,a	%xcc,	loop_197
	fnands	%f2,	%f22,	%f12
	fmuld8sux16	%f0,	%f23,	%f28
	movrgz	%g1,	0x011,	%g3
loop_197:
	ta	%xcc,	0x6
	udivcc	%g2,	0x13A5,	%i0
	stbar
	wr	%g0,	0x2f,	%asi
	stba	%o0,	[%l7 + 0x55] %asi
	membar	#Sync
	edge16n	%l5,	%i6,	%g7
	sra	%l2,	0x09,	%g5
	edge8	%i4,	%i3,	%l6
	orn	%l3,	%o6,	%o1
	fornot1s	%f20,	%f26,	%f26
	bn,a,pn	%icc,	loop_198
	xorcc	%l4,	0x1138,	%o5
	nop
	setx	loop_199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16al	%f24,	%f21,	%f8
loop_198:
	xorcc	%i1,	0x1E2A,	%g6
	fmovsvc	%xcc,	%f7,	%f25
loop_199:
	ta	%icc,	0x7
	udivx	%i5,	0x06FA,	%o7
	xorcc	%g4,	%o4,	%o3
	fnors	%f29,	%f21,	%f8
	fmovsneg	%icc,	%f22,	%f22
	array32	%l1,	%i7,	%l0
	fcmpgt16	%f2,	%f18,	%i2
	fornot1	%f18,	%f12,	%f16
	fbule	%fcc3,	loop_200
	fbu,a	%fcc2,	loop_201
	sir	0x0C2F
	taddcctv	%g1,	%o2,	%g3
loop_200:
	fmovdvc	%icc,	%f3,	%f16
loop_201:
	edge16l	%i0,	%g2,	%o0
	movrlez	%l5,	0x103,	%g7
	be,pn	%icc,	loop_202
	stbar
	xor	%l2,	0x0147,	%i6
	fmovsn	%xcc,	%f14,	%f9
loop_202:
	sub	%g5,	%i3,	%i4
	xnor	%l3,	%l6,	%o1
	movneg	%xcc,	%o6,	%o5
	movvs	%icc,	%i1,	%g6
	fsrc2	%f20,	%f18
	bpos,a,pn	%xcc,	loop_203
	edge16ln	%l4,	%i5,	%g4
	bgu,pt	%xcc,	loop_204
	fbuge	%fcc1,	loop_205
loop_203:
	nop
	setx loop_206, %l0, %l1
	jmpl %l1, %o4
	movg	%xcc,	%o3,	%o7
loop_204:
	nop
	set	0x28, %i4
	stxa	%l1,	[%g0 + %i4] 0x4f
loop_205:
	fpackfix	%f22,	%f25
loop_206:
	movcc	%icc,	%i7,	%l0
	umulcc	%g1,	0x167D,	%o2
	bvc,a,pn	%icc,	loop_207
	array8	%i2,	%g3,	%g2
	fpack16	%f26,	%f30
	tne	%icc,	0x7
loop_207:
	ldsh	[%l7 + 0x74],	%o0
	movgu	%icc,	%l5,	%g7
	set	0x67, %l0
	lduba	[%l7 + %l0] 0x80,	%l2
	nop
	setx loop_208, %l0, %l1
	jmpl %l1, %i6
	orn	%i0,	0x11DB,	%g5
	bne,pn	%xcc,	loop_209
	fcmple16	%f16,	%f22,	%i4
loop_208:
	ldx	[%l7 + 0x78],	%l3
	umul	%i3,	%l6,	%o6
loop_209:
	ta	%xcc,	0x5
	ta	%icc,	0x7
	tcc	%xcc,	0x6
	fble,a	%fcc0,	loop_210
	movleu	%icc,	%o5,	%i1
	ldd	[%l7 + 0x38],	%o0
	lduh	[%l7 + 0x0A],	%l4
loop_210:
	tne	%icc,	0x4
	mulscc	%g6,	%g4,	%o4
	wr	%g0,	0xe2,	%asi
	stba	%o3,	[%l7 + 0x3D] %asi
	membar	#Sync
	sub	%i5,	0x1A6D,	%l1
	edge16ln	%o7,	%l0,	%i7
	bgu,a,pn	%xcc,	loop_211
	add	%o2,	0x0F7D,	%i2
	sdivx	%g1,	0x0C17,	%g2
	fbule	loop_212
loop_211:
	popc	0x090B,	%g3
	movrlz	%o0,	0x1E7,	%l5
	edge32	%l2,	%i6,	%i0
loop_212:
	umulcc	%g7,	0x0C02,	%i4
	fblg,a	loop_213
	movrgz	%l3,	0x228,	%i3
	movle	%xcc,	%l6,	%g5
	edge16l	%o5,	%i1,	%o1
loop_213:
	movcc	%xcc,	%l4,	%g6
	bvs,pn	%icc,	loop_214
	fblg,a	loop_215
	sdiv	%g4,	0x0A39,	%o6
	tcs	%xcc,	0x6
loop_214:
	sth	%o3,	[%l7 + 0x38]
loop_215:
	fmovdcs	%icc,	%f16,	%f4
	fmovsneg	%icc,	%f30,	%f4
	tle	%icc,	0x5
	bl,a,pt	%icc,	loop_216
	umul	%o4,	0x093A,	%l1
	bcs	%icc,	loop_217
	movpos	%xcc,	%i5,	%o7
loop_216:
	srl	%l0,	%o2,	%i7
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x40] %asi,	%i2
loop_217:
	bvs,a	loop_218
	fnors	%f23,	%f29,	%f4
	movrne	%g2,	%g3,	%g1
	fmovdle	%icc,	%f5,	%f21
loop_218:
	stb	%o0,	[%l7 + 0x3C]
	sdiv	%l2,	0x128E,	%i6
	brlz,a	%i0,	loop_219
	edge32n	%l5,	%g7,	%l3
	tpos	%xcc,	0x5
	popc	0x0BCD,	%i3
loop_219:
	orn	%l6,	%g5,	%o5
	tgu	%xcc,	0x6
	array32	%i1,	%o1,	%l4
	movvs	%xcc,	%i4,	%g6
	set	0x60, %o6
	ldswa	[%l7 + %o6] 0x10,	%o6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%o3
	tcs	%xcc,	0x3
	fands	%f17,	%f30,	%f4
	ta	%icc,	0x0
	movl	%xcc,	%o4,	%g4
	mova	%icc,	%l1,	%i5
	edge32n	%l0,	%o2,	%i7
	addccc	%i2,	%o7,	%g3
	tcs	%xcc,	0x2
	sdivcc	%g2,	0x0182,	%o0
	bvs,a	loop_220
	tle	%icc,	0x6
	subc	%g1,	0x0410,	%l2
	fnegs	%f12,	%f15
loop_220:
	for	%f18,	%f2,	%f30
	udivx	%i0,	0x025C,	%i6
	tpos	%xcc,	0x1
	std	%f28,	[%l7 + 0x68]
	ldd	[%l7 + 0x50],	%l4
	tneg	%icc,	0x5
	srlx	%g7,	0x0A,	%l3
	movvs	%icc,	%i3,	%l6
	fpsub32s	%f6,	%f26,	%f13
	nop
	setx	0x65BA9C3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x1B753178,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f14,	%f27
	sethi	0x1460,	%o5
	movgu	%icc,	%i1,	%g5
	movvs	%icc,	%l4,	%i4
	fblg	%fcc2,	loop_221
	udivx	%o1,	0x06BB,	%g6
	bpos,pt	%xcc,	loop_222
	fba,a	loop_223
loop_221:
	sdiv	%o3,	0x0E52,	%o6
	tleu	%icc,	0x3
loop_222:
	flush	%l7 + 0x1C
loop_223:
	xnor	%g4,	%o4,	%i5
	sra	%l1,	%o2,	%i7
	array8	%i2,	%l0,	%g3
	tsubcc	%g2,	%o0,	%g1
	fmul8x16	%f21,	%f26,	%f22
	xnorcc	%l2,	0x0B39,	%o7
	popc	0x0633,	%i0
	orcc	%i6,	%g7,	%l5
	edge16ln	%i3,	%l6,	%l3
	tleu	%icc,	0x7
	be,pn	%icc,	loop_224
	fmovsg	%xcc,	%f13,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o5,	%i1
loop_224:
	xnor	%l4,	0x01D8,	%i4
	sdivcc	%g5,	0x000A,	%o1
	fbuge	%fcc1,	loop_225
	fmovrslez	%g6,	%f5,	%f28
	movvc	%xcc,	%o3,	%g4
	fbe,a	%fcc2,	loop_226
loop_225:
	edge32l	%o6,	%o4,	%i5
	xorcc	%o2,	%l1,	%i2
	ldsw	[%l7 + 0x70],	%l0
loop_226:
	movleu	%xcc,	%g3,	%g2
	fpsub32	%f0,	%f22,	%f24
	srlx	%o0,	%i7,	%l2
	fmovrdgez	%o7,	%f10,	%f2
	movrlz	%i0,	0x35A,	%i6
	orn	%g1,	%l5,	%i3
	set	0x40, %i3
	stxa	%g7,	[%l7 + %i3] 0x2f
	membar	#Sync
	edge8	%l3,	%o5,	%i1
	ldx	[%l7 + 0x48],	%l4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l6
	or	%i4,	0x00D0,	%g5
	tl	%xcc,	0x4
	udivcc	%o1,	0x1F02,	%o3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x14,	%g6
	fmovsgu	%icc,	%f26,	%f20
	ldsh	[%l7 + 0x54],	%o6
	edge32n	%g4,	%i5,	%o2
	fbug	%fcc2,	loop_227
	fmovde	%xcc,	%f14,	%f17
	set	0x5B, %g1
	ldstuba	[%l7 + %g1] 0x0c,	%o4
loop_227:
	orn	%i2,	0x17A4,	%l1
	fnegd	%f28,	%f12
	stw	%g3,	[%l7 + 0x44]
	movpos	%icc,	%g2,	%l0
	nop
	setx	0xA023A46A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x7011ED10,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f19,	%f15
	movge	%icc,	%o0,	%l2
	subc	%i7,	%i0,	%i6
	sir	0x1036
	fors	%f5,	%f8,	%f12
	sdiv	%o7,	0x0B1C,	%g1
	orncc	%l5,	%i3,	%g7
	tcs	%xcc,	0x1
	bcc,a,pn	%icc,	loop_228
	movge	%xcc,	%o5,	%l3
	brgez,a	%l4,	loop_229
	edge32n	%i1,	%i4,	%l6
loop_228:
	addcc	%g5,	0x03D6,	%o3
	subc	%g6,	0x122C,	%o1
loop_229:
	fpsub16	%f6,	%f28,	%f2
	addc	%o6,	%i5,	%o2
	bneg	%icc,	loop_230
	edge8l	%g4,	%i2,	%l1
	umulcc	%o4,	0x097A,	%g3
	movleu	%xcc,	%l0,	%o0
loop_230:
	andncc	%g2,	%i7,	%i0
	nop
	setx	loop_231,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%l2,	%i6,	%o7
	movvc	%xcc,	%l5,	%i3
	movge	%icc,	%g7,	%g1
loop_231:
	and	%o5,	%l4,	%i1
	tvc	%xcc,	0x5
	umulcc	%i4,	%l6,	%l3
	movrlez	%g5,	0x247,	%o3
	bg,a	loop_232
	movcs	%xcc,	%g6,	%o6
	tpos	%xcc,	0x4
	edge32n	%o1,	%o2,	%g4
loop_232:
	srl	%i2,	%l1,	%i5
	movre	%g3,	%o4,	%o0
	set	0x64, %g6
	swapa	[%l7 + %g6] 0x89,	%l0
	subc	%i7,	0x067B,	%g2
	movrgz	%l2,	0x010,	%i6
	movn	%xcc,	%o7,	%i0
	movvc	%icc,	%i3,	%g7
	fbu,a	loop_233
	alignaddr	%g1,	%o5,	%l5
	tne	%icc,	0x3
	fmovdne	%xcc,	%f28,	%f11
loop_233:
	edge16n	%l4,	%i1,	%l6
	sll	%i4,	0x04,	%g5
	nop
	fitod	%f12,	%f28
	fdtos	%f28,	%f8
	udivcc	%l3,	0x14E5,	%g6
	tvs	%xcc,	0x4
	movpos	%xcc,	%o6,	%o3
	tcs	%xcc,	0x7
	subccc	%o2,	%o1,	%g4
	tgu	%icc,	0x1
	ldsh	[%l7 + 0x60],	%l1
	nop
	setx	loop_234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%i2,	%i5,	%g3
	popc	0x0D13,	%o4
	nop
	setx	0x3115B99613A38D16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x08CE94F5033EBE0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f20,	%f16
loop_234:
	fmovscs	%xcc,	%f19,	%f13
	alignaddrl	%o0,	%l0,	%i7
	subc	%l2,	0x10B0,	%i6
	movge	%xcc,	%g2,	%o7
	fbne	%fcc3,	loop_235
	edge32l	%i3,	%g7,	%g1
	fcmpeq32	%f10,	%f24,	%o5
	subccc	%i0,	0x1169,	%l5
loop_235:
	udiv	%i1,	0x1AF0,	%l4
	fzero	%f10
	movne	%icc,	%l6,	%g5
	tvc	%icc,	0x5
	ble	%xcc,	loop_236
	fmovsl	%xcc,	%f27,	%f21
	fpackfix	%f0,	%f17
	orn	%l3,	%i4,	%o6
loop_236:
	fors	%f18,	%f1,	%f1
	fpsub32s	%f31,	%f28,	%f2
	tvc	%xcc,	0x7
	ldx	[%l7 + 0x38],	%g6
	faligndata	%f20,	%f14,	%f24
	mulx	%o3,	%o1,	%o2
	set	0x53, %g7
	lduba	[%l7 + %g7] 0x89,	%l1
	movl	%xcc,	%g4,	%i5
	xnor	%i2,	%o4,	%g3
	tne	%xcc,	0x2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l0
	bpos,pt	%xcc,	loop_237
	fmovsle	%xcc,	%f2,	%f17
	edge16l	%i7,	%o0,	%l2
	taddcc	%i6,	%o7,	%g2
loop_237:
	tpos	%icc,	0x6
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f14
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	mulx	%i3,	%g1,	%o5
	srlx	%g7,	%l5,	%i0
	fmovdle	%icc,	%f0,	%f9
	fcmps	%fcc1,	%f10,	%f7
	tle	%icc,	0x4
	nop
	setx	0x6BABA676D554677A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3C8A5BEB890142D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f26,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l4,	0x1A,	%i1
	tn	%xcc,	0x6
	mulx	%l6,	%g5,	%l3
	tcs	%xcc,	0x5
	nop
	setx	loop_238,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbule,a	%fcc1,	loop_239
	movleu	%icc,	%i4,	%g6
	fmul8sux16	%f20,	%f20,	%f20
loop_238:
	bgu	loop_240
loop_239:
	call	loop_241
	fmovde	%xcc,	%f30,	%f9
	be	%icc,	loop_242
loop_240:
	fmovsg	%xcc,	%f2,	%f0
loop_241:
	ba,pn	%icc,	loop_243
	lduh	[%l7 + 0x5E],	%o3
loop_242:
	edge8n	%o6,	%o1,	%o2
	fmovrslez	%l1,	%f9,	%f12
loop_243:
	fbg	loop_244
	fpsub16s	%f15,	%f16,	%f5
	mova	%icc,	%i5,	%i2
	edge8	%g4,	%g3,	%l0
loop_244:
	ldsw	[%l7 + 0x0C],	%o4
	alignaddrl	%i7,	%o0,	%l2
	fbu	loop_245
	tg	%icc,	0x4
	taddcctv	%i6,	0x05B7,	%g2
	sdivx	%i3,	0x04C7,	%g1
loop_245:
	fmul8ulx16	%f0,	%f4,	%f18
	udivcc	%o5,	0x1C7C,	%o7
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%g6
	mulscc	%i0,	%l4,	%i1
	sub	%l5,	%l6,	%g5
	edge8l	%l3,	%g6,	%i4
	fbul,a	loop_246
	fmovscs	%icc,	%f8,	%f2
	udivcc	%o6,	0x13B1,	%o3
	and	%o1,	0x0CBA,	%o2
loop_246:
	brlez,a	%l1,	loop_247
	fzero	%f0
	orn	%i2,	%i5,	%g4
	fmovrsne	%l0,	%f22,	%f22
loop_247:
	lduh	[%l7 + 0x3C],	%g3
	fcmpeq32	%f2,	%f18,	%i7
	ldx	[%l7 + 0x18],	%o0
	ldstub	[%l7 + 0x2E],	%o4
	tleu	%xcc,	0x1
	udiv	%l2,	0x0684,	%i6
	movrne	%g2,	%g1,	%i3
	movrne	%o7,	0x232,	%g7
	ldub	[%l7 + 0x6C],	%o5
	movrlz	%l4,	0x3A9,	%i0
	andn	%i1,	%l6,	%l5
	tl	%icc,	0x3
	bg,a	%xcc,	loop_248
	movcs	%icc,	%g5,	%l3
	srax	%i4,	0x17,	%g6
	nop
	setx	0x0288D57D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x37CCF932,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f20,	%f21
loop_248:
	orn	%o3,	%o1,	%o6
	xor	%l1,	0x17F3,	%i2
	addccc	%i5,	0x1D35,	%g4
	orn	%l0,	0x11FC,	%g3
	movcc	%icc,	%i7,	%o0
	fnot1s	%f13,	%f20
	fbn,a	loop_249
	sethi	0x0BBD,	%o2
	edge8l	%o4,	%l2,	%i6
	tsubcctv	%g2,	0x0D5C,	%i3
loop_249:
	mulscc	%o7,	%g1,	%o5
	wr	%g0,	0xd1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%g7,	0x1DA7,	%l4
	bcc,a,pn	%xcc,	loop_250
	movvs	%icc,	%i1,	%i0
	set	0x2E, %i2
	ldsha	[%l7 + %i2] 0x10,	%l6
loop_250:
	movcc	%icc,	%l5,	%g5
	addc	%i4,	0x1203,	%l3
	alignaddrl	%g6,	%o3,	%o1
	mulx	%o6,	0x0AE6,	%i2
	edge8n	%i5,	%l1,	%g4
	tge	%xcc,	0x7
	fone	%f10
	xor	%l0,	0x1208,	%g3
	fmovdne	%xcc,	%f0,	%f6
	ldsb	[%l7 + 0x48],	%o0
	andcc	%o2,	%o4,	%l2
	nop
	setx loop_251, %l0, %l1
	jmpl %l1, %i6
	fmovdle	%icc,	%f7,	%f6
	nop
	fitod	%f0,	%f22
	fdtox	%f22,	%f24
	add	%l7,	0x64,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i7,	%i3
loop_251:
	movvs	%icc,	%g2,	%g1
	nop
	fitod	%f8,	%f10
	srl	%o7,	0x0F,	%g7
	mulscc	%o5,	%i1,	%i0
	edge8ln	%l6,	%l4,	%g5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l5,	%l3
	sdivcc	%g6,	0x19DE,	%o3
	flush	%l7 + 0x28
	fmovde	%xcc,	%f26,	%f8
	movn	%icc,	%i4,	%o1
	fors	%f5,	%f26,	%f28
	fandnot2s	%f27,	%f13,	%f7
	alignaddr	%o6,	%i5,	%l1
	edge16n	%i2,	%g4,	%l0
	fmovrdne	%o0,	%f2,	%f6
	xnor	%g3,	%o4,	%l2
	movn	%xcc,	%i6,	%i7
	fmovsneg	%xcc,	%f10,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f12,	%f4
	fdtox	%f4,	%f4
	fmovsleu	%icc,	%f10,	%f23
	edge16n	%o2,	%i3,	%g2
	srax	%o7,	0x1A,	%g7
	fmul8x16al	%f2,	%f19,	%f22
	nop
	setx	loop_252,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%o5,	0x10,	%g1
	movn	%xcc,	%i1,	%l6
	movrlez	%i0,	0x172,	%l4
loop_252:
	bcs	loop_253
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f28,	%f24,	%f22
	brgez,a	%l5,	loop_254
loop_253:
	fpack16	%f30,	%f14
	movne	%icc,	%g5,	%l3
	ldd	[%l7 + 0x28],	%o2
loop_254:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%i4
	tle	%xcc,	0x1
	orncc	%g6,	0x1327,	%o6
	movre	%i5,	%l1,	%i2
	tge	%icc,	0x4
	set	0x4C, %l2
	swapa	[%l7 + %l2] 0x81,	%o1
	tneg	%xcc,	0x1
	mova	%xcc,	%g4,	%o0
	subccc	%g3,	0x06CB,	%o4
	bl,a	%icc,	loop_255
	fmuld8sux16	%f22,	%f3,	%f20
	prefetch	[%l7 + 0x78],	 0x2
	call	loop_256
loop_255:
	movvc	%xcc,	%l0,	%i6
	nop
	fitod	%f6,	%f8
	fdtoi	%f8,	%f8
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x08] %asi,	%l2
loop_256:
	nop
	setx	0xF742168D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x408226E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f5,	%f22
	pdist	%f2,	%f28,	%f26
	tcc	%icc,	0x1
	ldsw	[%l7 + 0x40],	%i7
	brgz	%o2,	loop_257
	fmovsl	%icc,	%f8,	%f22
	bneg,a	loop_258
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_257:
	movpos	%icc,	%g2,	%i3
	srlx	%o7,	%o5,	%g1
loop_258:
	xnor	%g7,	0x02C2,	%i1
	tvs	%xcc,	0x4
	addcc	%i0,	0x1B27,	%l4
	xor	%l6,	0x1B89,	%g5
	tcs	%xcc,	0x0
	fsrc1s	%f4,	%f2
	edge32l	%l5,	%o3,	%i4
	tneg	%icc,	0x1
	fble	loop_259
	movne	%icc,	%g6,	%l3
	movneg	%icc,	%i5,	%o6
	bg	%icc,	loop_260
loop_259:
	fbuge	loop_261
	fblg,a	%fcc3,	loop_262
	ble,a	%icc,	loop_263
loop_260:
	umul	%i2,	%o1,	%g4
loop_261:
	membar	0x5F
loop_262:
	brgz	%o0,	loop_264
loop_263:
	movge	%icc,	%l1,	%o4
	ta	%icc,	0x0
	fmovdge	%icc,	%f28,	%f17
loop_264:
	lduh	[%l7 + 0x6E],	%g3
	tn	%icc,	0x6
	xorcc	%i6,	0x0E88,	%l0
	edge16n	%l2,	%i7,	%g2
	array32	%o2,	%o7,	%o5
	movvc	%xcc,	%g1,	%i3
	ldx	[%l7 + 0x68],	%i1
	fcmple16	%f8,	%f30,	%g7
	tneg	%xcc,	0x7
	fcmpes	%fcc3,	%f6,	%f25
	stb	%l4,	[%l7 + 0x3F]
	movrgez	%i0,	%l6,	%g5
	movl	%xcc,	%l5,	%o3
	tcc	%xcc,	0x0
	addc	%i4,	%g6,	%i5
	fmovde	%xcc,	%f31,	%f26
	ble	loop_265
	movrne	%o6,	%l3,	%o1
	alignaddr	%g4,	%o0,	%l1
	fmovdpos	%xcc,	%f25,	%f18
loop_265:
	alignaddrl	%o4,	%i2,	%i6
	edge16	%l0,	%l2,	%i7
	tl	%xcc,	0x2
	edge8l	%g2,	%o2,	%o7
	prefetch	[%l7 + 0x50],	 0x2
	nop
	setx	loop_266,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%icc,	0x0
	edge8	%g3,	%o5,	%g1
	srlx	%i1,	0x01,	%i3
loop_266:
	nop
	set	0x7C, %l3
	stwa	%g7,	[%l7 + %l3] 0x14
	sethi	0x0B54,	%i0
	fmovsle	%xcc,	%f5,	%f3
	fandnot1	%f24,	%f28,	%f4
	smul	%l6,	0x0E9C,	%g5
	addcc	%l5,	%l4,	%o3
	andn	%g6,	0x1208,	%i4
	sdivx	%i5,	0x1ADB,	%o6
	tne	%xcc,	0x4
	fcmpgt32	%f8,	%f30,	%l3
	edge32ln	%o1,	%g4,	%o0
	nop
	setx	0x350587CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x1D841446,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f25,	%f0
	tpos	%xcc,	0x2
	fmovda	%xcc,	%f25,	%f2
	fpadd32	%f20,	%f0,	%f12
	alignaddrl	%l1,	%i2,	%o4
	srl	%i6,	0x19,	%l0
	be,a	%xcc,	loop_267
	or	%i7,	%l2,	%o2
	fbl,a	loop_268
	call	loop_269
loop_267:
	sdivcc	%o7,	0x0CFC,	%g3
	set	0x210, %o2
	stxa	%o5,	[%g0 + %o2] 0x52
loop_268:
	swap	[%l7 + 0x5C],	%g1
loop_269:
	fands	%f28,	%f15,	%f6
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%i1
	sdivx	%i3,	0x0587,	%g7
	andn	%i0,	0x016D,	%g2
	bne,pt	%xcc,	loop_270
	tle	%xcc,	0x2
	fmovsg	%icc,	%f1,	%f14
	nop
	setx	0xB015B6DE1531E460,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xBD86195B721C0E63,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f20,	%f6
loop_270:
	tne	%icc,	0x3
	ldsb	[%l7 + 0x0F],	%l6
	fzero	%f16
	fpackfix	%f26,	%f10
	sub	%g5,	0x0098,	%l5
	fpadd32s	%f31,	%f29,	%f12
	movne	%xcc,	%o3,	%l4
	xorcc	%i4,	%i5,	%o6
	fpsub16s	%f21,	%f6,	%f9
	or	%l3,	%o1,	%g6
	sdivcc	%g4,	0x063A,	%l1
	fnot2s	%f19,	%f5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x77] %asi,	%o0
	array16	%o4,	%i2,	%i6
	fnot1s	%f17,	%f18
	fmovdn	%icc,	%f28,	%f20
	andcc	%l0,	0x0096,	%l2
	taddcctv	%o2,	%o7,	%g3
	fbue,a	loop_271
	ldd	[%l7 + 0x48],	%f28
	sdiv	%i7,	0x1069,	%g1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o5,	%i3
loop_271:
	mulx	%i1,	0x1ADC,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f14,	%f30,	%f4
	movg	%icc,	%i0,	%g2
	movge	%icc,	%l6,	%l5
	xnorcc	%o3,	%g5,	%l4
	sth	%i4,	[%l7 + 0x78]
	fbl,a	%fcc1,	loop_272
	edge32	%i5,	%l3,	%o6
	array32	%g6,	%o1,	%l1
	sdivx	%g4,	0x0319,	%o0
loop_272:
	nop
	setx	0xD2610755E0F4DD07,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x749AEEB21F806200,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f26
	edge16ln	%o4,	%i6,	%i2
	tneg	%icc,	0x4
	brz,a	%l2,	loop_273
	addccc	%l0,	0x11F6,	%o7
	prefetch	[%l7 + 0x20],	 0x3
	array32	%g3,	%i7,	%g1
loop_273:
	popc	%o5,	%o2
	fpadd32s	%f20,	%f23,	%f10
	udivx	%i3,	0x1F44,	%i1
	andcc	%i0,	0x131F,	%g7
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xdb
	fmovrdne	%l6,	%f0,	%f12
	movleu	%xcc,	%l5,	%o3
	andcc	%g2,	0x0A71,	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x19,	%i4,	%g5
	wr	%g0,	0xe3,	%asi
	stha	%l3,	[%l7 + 0x78] %asi
	membar	#Sync
	edge32ln	%i5,	%g6,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f28,	%f26,	%f16
	fxors	%f18,	%f0,	%f3
	fmovsg	%xcc,	%f7,	%f20
	edge32n	%l1,	%g4,	%o0
	fbuge	%fcc1,	loop_274
	te	%xcc,	0x0
	set	0x4C, %i1
	ldswa	[%l7 + %i1] 0x15,	%o4
loop_274:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i6,	%i2
	sdivcc	%o1,	0x1313,	%l0
	fbul,a	loop_275
	fabss	%f12,	%f14
	nop
	set	0x76, %i5
	stb	%l2,	[%l7 + %i5]
	bne,a,pt	%icc,	loop_276
loop_275:
	movneg	%icc,	%g3,	%o7
	move	%icc,	%i7,	%g1
	tpos	%icc,	0x2
loop_276:
	fornot2s	%f11,	%f16,	%f8
	tcs	%icc,	0x7
	udiv	%o2,	0x0DB6,	%i3
	edge32n	%i1,	%i0,	%g7
	alignaddrl	%l6,	%l5,	%o3
	smul	%g2,	%l4,	%o5
	tl	%xcc,	0x6
	wr	%g0,	0xea,	%asi
	stba	%g5,	[%l7 + 0x11] %asi
	membar	#Sync
	xnorcc	%l3,	0x08CB,	%i5
	movne	%icc,	%g6,	%i4
	addccc	%l1,	%g4,	%o0
	ld	[%l7 + 0x0C],	%f11
	tne	%xcc,	0x0
	nop
	setx loop_277, %l0, %l1
	jmpl %l1, %o4
	taddcctv	%o6,	%i6,	%o1
	fpmerge	%f6,	%f4,	%f10
	fnot2	%f14,	%f12
loop_277:
	fbul	loop_278
	mulx	%l0,	%l2,	%i2
	brlez	%o7,	loop_279
	ldx	[%l7 + 0x28],	%i7
loop_278:
	fpackfix	%f10,	%f4
	movl	%icc,	%g3,	%g1
loop_279:
	tge	%xcc,	0x5
	fmovdg	%xcc,	%f26,	%f11
	movre	%i3,	%i1,	%i0
	bvc	loop_280
	xnorcc	%o2,	0x0E88,	%g7
	nop
	set	0x5C, %l1
	prefetch	[%l7 + %l1],	 0x0
	tle	%icc,	0x0
loop_280:
	nop
	setx	loop_281,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%icc,	0x0
	taddcctv	%l6,	%o3,	%g2
	tcs	%icc,	0x5
loop_281:
	movgu	%icc,	%l4,	%o5
	sth	%l5,	[%l7 + 0x50]
	andn	%l3,	0x0CA5,	%i5
	udivx	%g5,	0x19DE,	%g6
	tcs	%xcc,	0x0
	for	%f16,	%f16,	%f0
	addcc	%l1,	%g4,	%i4
	fmovscs	%icc,	%f21,	%f20
	fpsub16s	%f2,	%f2,	%f26
	edge32	%o0,	%o4,	%i6
	tgu	%xcc,	0x4
	udivx	%o6,	0x0212,	%o1
	fcmpeq16	%f18,	%f8,	%l0
	movleu	%icc,	%l2,	%o7
	nop
	fitos	%f1,	%f10
	fstox	%f10,	%f8
	prefetch	[%l7 + 0x28],	 0x3
	movneg	%icc,	%i7,	%i2
	fnot2	%f14,	%f18
	flush	%l7 + 0x38
	bne,pt	%icc,	loop_282
	edge16	%g3,	%i3,	%g1
	movrgez	%i0,	%i1,	%g7
	movl	%xcc,	%l6,	%o2
loop_282:
	ta	%icc,	0x7
	fbule,a	loop_283
	for	%f24,	%f2,	%f24
	movrgz	%g2,	%o3,	%o5
	sub	%l4,	%l3,	%i5
loop_283:
	movg	%xcc,	%g5,	%g6
	tvs	%xcc,	0x5
	nop
	setx	loop_284,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xor	%l5,	0x1BC4,	%l1
	fmovdl	%icc,	%f15,	%f31
	srax	%g4,	%o0,	%i4
loop_284:
	smul	%o4,	0x1D28,	%i6
	edge8l	%o6,	%l0,	%l2
	edge32	%o7,	%i7,	%o1
	edge32ln	%g3,	%i3,	%g1
	ldd	[%l7 + 0x50],	%i0
	array32	%i1,	%i2,	%l6
	fands	%f14,	%f12,	%f24
	nop
	set	0x0A, %o4
	lduh	[%l7 + %o4],	%o2
	fandnot2	%f2,	%f4,	%f12
	movl	%xcc,	%g7,	%o3
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%g2
	mulx	%l4,	0x1098,	%o5
	alignaddr	%l3,	%g5,	%g6
	ld	[%l7 + 0x1C],	%f26
	bgu	loop_285
	mulscc	%i5,	%l5,	%g4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%o0
loop_285:
	fmovsa	%xcc,	%f10,	%f24
	edge16l	%i4,	%l1,	%o4
	nop
	setx	0x93F65EF2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x22F1D78B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f31,	%f11
	fbule	%fcc1,	loop_286
	movne	%icc,	%o6,	%l0
	andcc	%l2,	0x0EE4,	%o7
	tpos	%icc,	0x4
loop_286:
	andn	%i6,	0x19BB,	%i7
	stb	%g3,	[%l7 + 0x3F]
	edge16l	%o1,	%g1,	%i0
	sll	%i3,	0x02,	%i2
	fcmpgt32	%f16,	%f20,	%i1
	srlx	%l6,	%o2,	%g7
	ba,a,pn	%icc,	loop_287
	tne	%xcc,	0x1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l4
loop_287:
	xnor	%o5,	%g2,	%l3
	edge32ln	%g6,	%i5,	%l5
	tvs	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tge	%icc,	0x1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2F] %asi,	%g4
	addccc	%g5,	0x096F,	%o0
	xorcc	%i4,	%o4,	%o6
	movrgez	%l0,	%l1,	%l2
	movcs	%xcc,	%o7,	%i7
	fbe	%fcc2,	loop_288
	andn	%g3,	0x145B,	%o1
	udiv	%g1,	0x0D84,	%i6
	lduw	[%l7 + 0x14],	%i0
loop_288:
	nop
	set	0x4C, %g5
	lduba	[%l7 + %g5] 0x0c,	%i3
	nop
	setx	0x8B6D457A80644B5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	alignaddr	%i2,	%l6,	%o2
	nop
	setx	0x60746757,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	orncc	%g7,	%i1,	%o3
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%f14
	fpack16	%f0,	%f5
	bleu,a	loop_289
	umulcc	%o5,	0x1F13,	%l4
	wr	%g0,	0x2b,	%asi
	stba	%l3,	[%l7 + 0x17] %asi
	membar	#Sync
loop_289:
	st	%f22,	[%l7 + 0x60]
	fxor	%f2,	%f10,	%f16
	fnot2	%f14,	%f12
	movrlz	%g6,	%i5,	%l5
	popc	0x146C,	%g4
	fmovrsne	%g2,	%f18,	%f27
	movvc	%icc,	%g5,	%o0
	tle	%icc,	0x7
	umulcc	%o4,	%i4,	%o6
	tneg	%icc,	0x3
	edge32l	%l1,	%l2,	%o7
	edge8	%l0,	%i7,	%o1
	nop
	fitos	%f4,	%f10
	fstod	%f10,	%f22
	movcc	%icc,	%g1,	%g3
	popc	0x1663,	%i6
	ldsw	[%l7 + 0x0C],	%i3
	subcc	%i0,	0x0746,	%l6
	ldx	[%l7 + 0x10],	%o2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g7
	add	%i1,	%o3,	%i2
	move	%icc,	%o5,	%l4
	fcmpne32	%f20,	%f6,	%g6
	movleu	%xcc,	%i5,	%l5
	fandnot1	%f20,	%f18,	%f20
	taddcctv	%g4,	0x1919,	%g2
	or	%g5,	%l3,	%o0
	xor	%o4,	%i4,	%l1
	bneg,pn	%xcc,	loop_290
	edge16n	%l2,	%o7,	%o6
	fblg,a	loop_291
	andncc	%l0,	%i7,	%o1
loop_290:
	stb	%g3,	[%l7 + 0x7A]
	fands	%f7,	%f23,	%f30
loop_291:
	andn	%i6,	0x0DD4,	%g1
	tg	%icc,	0x1
	bpos,pn	%xcc,	loop_292
	mulx	%i0,	0x06AC,	%i3
	tle	%icc,	0x6
	tge	%icc,	0x4
loop_292:
	movne	%icc,	%l6,	%g7
	mova	%icc,	%i1,	%o3
	movre	%o2,	%o5,	%l4
	move	%xcc,	%g6,	%i5
	add	%i2,	0x07BC,	%l5
	tn	%icc,	0x3
	te	%xcc,	0x5
	fmovrdgz	%g4,	%f8,	%f16
	movvs	%icc,	%g2,	%g5
	sdivcc	%l3,	0x1F0C,	%o0
	wr	%g0,	0x89,	%asi
	stha	%i4,	[%l7 + 0x6A] %asi
	set	0x16, %o7
	lduha	[%l7 + %o7] 0x10,	%l1
	xnorcc	%o4,	%l2,	%o7
	tsubcc	%o6,	%l0,	%i7
	movleu	%xcc,	%o1,	%g3
	movne	%xcc,	%g1,	%i0
	fxors	%f5,	%f18,	%f20
	addcc	%i6,	0x1474,	%i3
	mulx	%l6,	%g7,	%o3
	movneg	%xcc,	%o2,	%o5
	fmovdg	%icc,	%f6,	%f31
	mulx	%i1,	0x0B8E,	%g6
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x80,	%l4
	movre	%i2,	%i5,	%g4
	flush	%l7 + 0x5C
	ldsb	[%l7 + 0x23],	%g2
	tne	%icc,	0x7
	srax	%l5,	0x11,	%g5
	bleu	%icc,	loop_293
	addc	%l3,	0x0C8B,	%o0
	taddcc	%l1,	0x1320,	%o4
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i4
loop_293:
	stw	%o7,	[%l7 + 0x64]
	brgez,a	%l2,	loop_294
	fmovdl	%icc,	%f2,	%f26
	nop
	setx	0x3176A8CB405EC2C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	addccc	%l0,	%i7,	%o6
loop_294:
	tsubcctv	%o1,	%g3,	%i0
	fpackfix	%f2,	%f0
	brlz,a	%g1,	loop_295
	add	%i6,	0x0AB1,	%i3
	fbue	%fcc1,	loop_296
	fnot2s	%f21,	%f16
loop_295:
	nop
	setx	0xA91DAD7C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f22
	movrlz	%g7,	%l6,	%o2
loop_296:
	sub	%o3,	0x00EC,	%o5
	movvs	%xcc,	%g6,	%i1
	fcmpne16	%f10,	%f28,	%i2
	addcc	%l4,	%i5,	%g4
	array8	%g2,	%g5,	%l3
	fmovse	%icc,	%f0,	%f31
	movneg	%icc,	%o0,	%l5
	addcc	%l1,	%i4,	%o4
	movrne	%l2,	0x254,	%o7
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x38] %asi,	%f23
	ldsw	[%l7 + 0x58],	%i7
	brz	%o6,	loop_297
	movn	%xcc,	%o1,	%l0
	fcmps	%fcc0,	%f26,	%f29
	edge8ln	%g3,	%i0,	%i6
loop_297:
	brgz	%i3,	loop_298
	popc	%g1,	%g7
	fsrc2s	%f11,	%f0
	ta	%xcc,	0x3
loop_298:
	addccc	%o2,	%o3,	%l6
	bvc,a	loop_299
	movpos	%xcc,	%o5,	%i1
	srax	%i2,	%g6,	%l4
	movpos	%xcc,	%g4,	%i5
loop_299:
	ta	%xcc,	0x6
	nop
	setx	loop_300,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x3
	ldd	[%l7 + 0x40],	%f0
	fcmpne32	%f14,	%f16,	%g5
loop_300:
	movcs	%icc,	%l3,	%o0
	taddcc	%l5,	%l1,	%i4
	bvc,a	loop_301
	fmovrslez	%g2,	%f4,	%f15
	lduw	[%l7 + 0x74],	%l2
	mulx	%o4,	%i7,	%o7
loop_301:
	ta	%xcc,	0x6
	alignaddr	%o1,	%o6,	%l0
	tvs	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x76, %l4
	lduba	[%l7 + %l4] 0x81,	%g3
	fmovdge	%icc,	%f17,	%f17
	movrlez	%i0,	%i6,	%g1
	andncc	%i3,	%o2,	%o3
	call	loop_302
	xor	%g7,	0x1A80,	%o5
	fmovdvs	%icc,	%f21,	%f10
	movvs	%icc,	%i1,	%i2
loop_302:
	movle	%xcc,	%g6,	%l6
	fba,a	loop_303
	mulx	%g4,	0x1131,	%i5
	movvc	%xcc,	%l4,	%g5
	std	%f18,	[%l7 + 0x78]
loop_303:
	movne	%xcc,	%l3,	%l5
	movvc	%icc,	%l1,	%i4
	fxnor	%f18,	%f0,	%f24
	movleu	%xcc,	%o0,	%l2
	fnors	%f19,	%f21,	%f27
	bleu	loop_304
	brz,a	%o4,	loop_305
	fbuge,a	%fcc2,	loop_306
	udiv	%i7,	0x1F74,	%o7
loop_304:
	movgu	%icc,	%o1,	%g2
loop_305:
	orncc	%o6,	%g3,	%i0
loop_306:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x44] %asi,	%l0
	andn	%g1,	0x1135,	%i6
	edge16	%i3,	%o3,	%g7
	tcs	%icc,	0x0
	tne	%xcc,	0x0
	pdist	%f18,	%f16,	%f16
	fmovsle	%icc,	%f28,	%f0
	nop
	setx	0x438B2F0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f29
	nop
	fitod	%f12,	%f20
	fdtox	%f20,	%f2
	fsrc2	%f10,	%f8
	subccc	%o2,	%o5,	%i1
	edge16n	%g6,	%i2,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i5,	%l6
	smulcc	%l4,	0x116D,	%g5
	alignaddr	%l3,	%l1,	%i4
	fmovrsgz	%l5,	%f14,	%f3
	nop
	setx	0x7358FDAB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x737FCA55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f15,	%f16
	tne	%xcc,	0x3
	movrlz	%o0,	%o4,	%i7
	fmovdg	%icc,	%f5,	%f26
	orn	%o7,	0x0C60,	%o1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	st	%f21,	[%l7 + 0x34]
	tneg	%icc,	0x7
	udiv	%g2,	0x1ABE,	%g3
	fmovrdlz	%o6,	%f12,	%f0
	movrlz	%l0,	0x189,	%g1
	popc	0x068B,	%i6
	tn	%xcc,	0x0
	fpsub32	%f30,	%f22,	%f26
	move	%xcc,	%i0,	%i3
	fba,a	loop_307
	tneg	%icc,	0x6
	tleu	%icc,	0x4
	fbe,a	%fcc0,	loop_308
loop_307:
	tneg	%icc,	0x4
	orn	%g7,	%o2,	%o3
	taddcc	%o5,	%i1,	%i2
loop_308:
	fone	%f22
	umulcc	%g4,	0x124C,	%i5
	sethi	0x1CC0,	%g6
	fsrc2s	%f6,	%f16
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xe2,	%i6
	fmovspos	%icc,	%f10,	%f30
	edge8	%g5,	%l3,	%l4
	nop
	setx	0x407A4B6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	set	0x6A, %i7
	ldsha	[%l7 + %i7] 0x81,	%l1
	fbue	%fcc2,	loop_309
	fbe	loop_310
	addccc	%l5,	0x0311,	%i4
	tvs	%icc,	0x4
loop_309:
	movrlz	%o4,	0x3B9,	%o0
loop_310:
	udivcc	%i7,	0x044C,	%o1
	movrlez	%o7,	0x214,	%g2
	fmul8sux16	%f18,	%f8,	%f30
	tne	%xcc,	0x3
	bge,a,pn	%xcc,	loop_311
	movrlz	%g3,	%l2,	%o6
	tg	%icc,	0x5
	or	%l0,	%i6,	%g1
loop_311:
	tle	%icc,	0x3
	udivcc	%i0,	0x0DF3,	%g7
	ta	%icc,	0x1
	bvs,a	loop_312
	movn	%icc,	%i3,	%o3
	bgu	loop_313
	srax	%o5,	%i1,	%i2
loop_312:
	orcc	%o2,	%i5,	%g6
	fxnors	%f27,	%f11,	%f23
loop_313:
	fmovrsgz	%l6,	%f2,	%f12
	fones	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f10
	tsubcc	%g5,	0x1B52,	%g4
	movn	%xcc,	%l3,	%l1
	alignaddrl	%l4,	%l5,	%o4
	tle	%icc,	0x2
	addc	%i4,	0x00B9,	%o0
	tvs	%icc,	0x6
	fnegs	%f30,	%f17
	bcc	%icc,	loop_314
	array16	%o1,	%o7,	%i7
	nop
	setx	0x1073F158,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fpsub32s	%f12,	%f9,	%f29
loop_314:
	prefetch	[%l7 + 0x78],	 0x0
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x36] %asi,	%g2
	ldstub	[%l7 + 0x66],	%g3
	edge16n	%o6,	%l0,	%i6
	bne,a	%xcc,	loop_315
	edge32l	%g1,	%l2,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g7,	%i3,	%o5
loop_315:
	and	%o3,	0x1603,	%i2
	fpsub32	%f28,	%f22,	%f30
	bpos,a,pt	%icc,	loop_316
	tne	%xcc,	0x4
	sllx	%i1,	0x16,	%i5
	xnorcc	%o2,	%g6,	%g5
loop_316:
	fsrc1	%f30,	%f24
	andn	%g4,	%l3,	%l1
	fcmpgt16	%f16,	%f0,	%l6
	movrlz	%l4,	0x1B5,	%o4
	tpos	%xcc,	0x3
	fxors	%f16,	%f19,	%f19
	tn	%xcc,	0x1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%l5
	movg	%xcc,	%o0,	%o7
	pdist	%f16,	%f6,	%f2
	srl	%o1,	0x1F,	%g2
	srlx	%i7,	0x1E,	%o6
	edge32ln	%l0,	%i6,	%g3
	taddcctv	%l2,	%i0,	%g1
	movpos	%xcc,	%i3,	%g7
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f0
	edge32l	%o3,	%o5,	%i2
	subc	%i1,	0x00A1,	%o2
	ldsw	[%l7 + 0x58],	%i5
	nop
	setx	0xA5B3E42D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x05462660,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f1,	%f14
	mova	%xcc,	%g6,	%g5
	sra	%l3,	0x00,	%l1
	tcc	%icc,	0x2
	fpadd32	%f4,	%f8,	%f18
	fmul8x16au	%f20,	%f23,	%f10
	fzeros	%f7
	edge32l	%l6,	%g4,	%o4
	nop
	setx	loop_317,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f14,	%f12
	sth	%l4,	[%l7 + 0x26]
	fcmple16	%f6,	%f0,	%l5
loop_317:
	membar	0x70
	fble,a	%fcc2,	loop_318
	nop
	setx	0x17CDCE4B3056596D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	sethi	0x056E,	%o0
	tvs	%xcc,	0x7
loop_318:
	lduw	[%l7 + 0x24],	%i4
	nop
	fitos	%f14,	%f7
	fstox	%f7,	%f0
	taddcc	%o7,	0x1960,	%g2
	movrgez	%i7,	%o1,	%o6
	fmovscs	%icc,	%f9,	%f13
	edge8n	%i6,	%l0,	%g3
	taddcc	%i0,	0x0828,	%g1
	edge16ln	%l2,	%g7,	%o3
	array8	%i3,	%i2,	%o5
	edge8l	%o2,	%i1,	%g6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%i5
	fandnot2	%f28,	%f16,	%f26
	taddcctv	%l3,	%g5,	%l6
	fcmpgt16	%f10,	%f28,	%g4
	edge16l	%o4,	%l1,	%l4
	ldub	[%l7 + 0x21],	%l5
	fandnot1s	%f19,	%f28,	%f24
	nop
	setx	0xE55A179C51FC3F50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3F0A7A8D8DB33B14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f12,	%f2
	array16	%o0,	%o7,	%g2
	fbug,a	loop_319
	movl	%xcc,	%i7,	%i4
	ldsw	[%l7 + 0x3C],	%o6
	and	%i6,	%o1,	%l0
loop_319:
	st	%f27,	[%l7 + 0x74]
	brz,a	%g3,	loop_320
	srl	%g1,	0x00,	%l2
	st	%f22,	[%l7 + 0x38]
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x18,	 0x1
loop_320:
	movn	%xcc,	%i0,	%o3
	tcc	%icc,	0x7
	bne,pn	%icc,	loop_321
	edge16	%i3,	%i2,	%o5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x14,	%f0
loop_321:
	orncc	%o2,	%g6,	%i1
	tl	%xcc,	0x3
	set	0x20, %i4
	prefetcha	[%l7 + %i4] 0x14,	 0x1
	set	0x7C, %i6
	lduba	[%l7 + %i6] 0x11,	%i5
	mulx	%g5,	%l6,	%o4
	edge8l	%g4,	%l4,	%l5
	andncc	%l1,	%o7,	%g2
	fornot2s	%f6,	%f6,	%f22
	wr	%g0,	0x22,	%asi
	stxa	%i7,	[%l7 + 0x20] %asi
	membar	#Sync
	sir	0x109D
	movcs	%xcc,	%o0,	%o6
	nop
	setx	0x396B6B75,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xF3FF8AD4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f10,	%f6
	fandnot1s	%f24,	%f19,	%f27
	tn	%xcc,	0x7
	xnorcc	%i4,	0x0F35,	%i6
	sdiv	%l0,	0x03E0,	%o1
	fmovdg	%xcc,	%f26,	%f10
	bpos,pt	%icc,	loop_322
	fbge	loop_323
	bgu,pt	%xcc,	loop_324
	tne	%xcc,	0x6
loop_322:
	edge32l	%g3,	%l2,	%g7
loop_323:
	tcc	%xcc,	0x3
loop_324:
	tneg	%xcc,	0x4
	udivx	%g1,	0x16BA,	%o3
	tge	%icc,	0x6
	fmovdg	%icc,	%f9,	%f17
	bg,pn	%xcc,	loop_325
	tcs	%icc,	0x5
	tsubcctv	%i3,	0x1DA0,	%i2
	sir	0x0865
loop_325:
	bcc,a	%xcc,	loop_326
	andcc	%i0,	%o5,	%o2
	edge32ln	%g6,	%i1,	%l3
	alignaddr	%i5,	%l6,	%g5
loop_326:
	fmul8sux16	%f20,	%f28,	%f24
	fbu	%fcc1,	loop_327
	taddcctv	%o4,	0x0323,	%g4
	fmovdvs	%xcc,	%f30,	%f2
	alignaddr	%l4,	%l1,	%l5
loop_327:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g2,	0x1BDB,	%i7
	fcmpeq32	%f26,	%f8,	%o7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x15,	%f16
	te	%xcc,	0x5
	movre	%o6,	%o0,	%i6
	movre	%l0,	0x02C,	%i4
	set	0x18, %i3
	stba	%o1,	[%l7 + %i3] 0x15
	fmovdle	%xcc,	%f18,	%f2
	fmovrsne	%g3,	%f28,	%f2
	fblg,a	loop_328
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g7,	%g1,	%l2
	smulcc	%i3,	%o3,	%i0
loop_328:
	xnor	%i2,	0x0FFD,	%o5
	tsubcctv	%o2,	%g6,	%i1
	std	%f12,	[%l7 + 0x30]
	tle	%xcc,	0x1
	fmovde	%xcc,	%f11,	%f8
	tleu	%icc,	0x6
	movl	%xcc,	%l3,	%l6
	bl	loop_329
	edge16n	%i5,	%g5,	%o4
	ba	%xcc,	loop_330
	fblg,a	loop_331
loop_329:
	sra	%l4,	0x16,	%g4
	edge32ln	%l1,	%l5,	%g2
loop_330:
	tne	%xcc,	0x4
loop_331:
	fxnor	%f8,	%f16,	%f10
	ld	[%l7 + 0x58],	%f0
	add	%i7,	0x09BE,	%o7
	bg,pt	%icc,	loop_332
	brz,a	%o0,	loop_333
	ldub	[%l7 + 0x4E],	%i6
	fsrc1	%f6,	%f2
loop_332:
	fmovrdne	%l0,	%f10,	%f24
loop_333:
	movvc	%xcc,	%o6,	%i4
	fbg	%fcc0,	loop_334
	movpos	%xcc,	%o1,	%g7
	nop
	setx	0x70A8E78D404C179E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x70] %asi,	%g1
loop_334:
	movvs	%icc,	%l2,	%g3
	array32	%o3,	%i3,	%i2
	andncc	%i0,	%o2,	%g6
	xnor	%o5,	0x1766,	%l3
	mulx	%i1,	0x0196,	%i5
	srlx	%g5,	%o4,	%l6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x48] %asi,	%g4
	set	0x54, %g3
	stwa	%l4,	[%l7 + %g3] 0x88
	tcc	%xcc,	0x6
	xnor	%l1,	0x1A6D,	%l5
	tgu	%icc,	0x7
	fxor	%f14,	%f14,	%f14
	alignaddrl	%g2,	%o7,	%o0
	fpackfix	%f26,	%f21
	ta	%icc,	0x0
	fmovdleu	%icc,	%f0,	%f27
	tleu	%icc,	0x4
	st	%f10,	[%l7 + 0x10]
	movleu	%icc,	%i7,	%l0
	edge32n	%o6,	%i6,	%o1
	fmovsle	%icc,	%f5,	%f11
	movrgz	%g7,	0x231,	%i4
	tg	%icc,	0x6
	bge	%xcc,	loop_335
	ld	[%l7 + 0x5C],	%f7
	tpos	%icc,	0x3
	std	%f28,	[%l7 + 0x08]
loop_335:
	movne	%icc,	%l2,	%g1
	movrlz	%o3,	%g3,	%i3
	nop
	fitod	%f0,	%f16
	fdtoi	%f16,	%f17
	movvc	%icc,	%i0,	%i2
	nop
	setx	0x054F2AFC66E179BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9580EF1C23B7B9A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f26,	%f8
	sdivcc	%g6,	0x1660,	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l3
	stx	%i1,	[%l7 + 0x40]
	udivx	%i5,	0x0A80,	%o5
	fcmpeq32	%f22,	%f24,	%g5
	edge32ln	%l6,	%g4,	%o4
	nop
	setx loop_336, %l0, %l1
	jmpl %l1, %l1
	fbue	%fcc3,	loop_337
	array16	%l5,	%g2,	%o7
	orncc	%l4,	%i7,	%l0
loop_336:
	movrlez	%o0,	0x34E,	%i6
loop_337:
	edge32l	%o6,	%o1,	%g7
	tgu	%xcc,	0x5
	sdivcc	%i4,	0x1CED,	%g1
	fbo,a	loop_338
	movgu	%icc,	%l2,	%g3
	tn	%icc,	0x6
	brgez,a	%i3,	loop_339
loop_338:
	fmovs	%f7,	%f15
	ldsh	[%l7 + 0x42],	%o3
	tsubcc	%i2,	0x077B,	%g6
loop_339:
	movle	%icc,	%o2,	%l3
	nop
	setx	0xEEBB02D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x2A06A87E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f29,	%f23
	fbn	%fcc3,	loop_340
	fzero	%f12
	movrgez	%i0,	0x166,	%i5
	tne	%xcc,	0x3
loop_340:
	fmovrsne	%o5,	%f30,	%f20
	sdivx	%g5,	0x130B,	%l6
	sra	%i1,	%o4,	%l1
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	edge8l	%l5,	%o7,	%g2
	sir	0x1D13
	movneg	%icc,	%l4,	%l0
	subcc	%i7,	%o0,	%o6
	fmul8x16al	%f15,	%f31,	%f20
	xnorcc	%i6,	0x034B,	%o1
	andncc	%i4,	%g1,	%g7
	andn	%g3,	0x1394,	%i3
	bleu,pt	%icc,	loop_341
	nop
	setx	loop_342,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc,pn	%xcc,	loop_343
	subc	%o3,	0x03C1,	%l2
loop_341:
	prefetch	[%l7 + 0x70],	 0x0
loop_342:
	movle	%xcc,	%g6,	%i2
loop_343:
	edge16ln	%l3,	%i0,	%i5
	fxnors	%f19,	%f18,	%f23
	brnz,a	%o2,	loop_344
	fnand	%f2,	%f26,	%f18
	tl	%icc,	0x2
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x1e,	%f0
loop_344:
	membar	0x43
	nop
	setx	0x38F64E77092B5F81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f2
	fmovse	%icc,	%f17,	%f1
	srlx	%g5,	0x07,	%l6
	te	%xcc,	0x6
	movrgz	%o5,	%o4,	%i1
	tge	%icc,	0x5
	nop
	setx	0xA070293C,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	ble,pt	%icc,	loop_345
	sra	%l1,	0x1D,	%l5
	smul	%o7,	0x1256,	%g2
	addcc	%l4,	0x0EB2,	%l0
loop_345:
	tleu	%icc,	0x0
	mulx	%i7,	%o0,	%g4
	edge16n	%o6,	%o1,	%i4
	fabss	%f20,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f31
	orcc	%i6,	%g1,	%g3
	smul	%i3,	%o3,	%g7
	te	%xcc,	0x7
	be,a,pn	%xcc,	loop_346
	edge8n	%g6,	%l2,	%i2
	movrne	%i0,	%l3,	%o2
	move	%xcc,	%g5,	%l6
loop_346:
	movvc	%icc,	%i5,	%o4
	tvs	%icc,	0x6
	set	0x48, %g6
	stxa	%i1,	[%l7 + %g6] 0x0c
	edge8l	%l1,	%l5,	%o7
	fnot1s	%f18,	%f3
	sdivx	%o5,	0x0FF3,	%l4
	tvc	%xcc,	0x2
	fbl	loop_347
	subccc	%g2,	%i7,	%o0
	edge16	%l0,	%g4,	%o1
	xnor	%i4,	%i6,	%o6
loop_347:
	ldsh	[%l7 + 0x3E],	%g1
	set	0x54, %g7
	ldsha	[%l7 + %g7] 0x18,	%i3
	and	%g3,	%o3,	%g6
	addcc	%g7,	%i2,	%i0
	nop
	setx	0xE058BC57,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	movneg	%xcc,	%l3,	%l2
	brgez	%o2,	loop_348
	fbne	loop_349
	umul	%g5,	%i5,	%o4
	te	%xcc,	0x3
loop_348:
	umul	%l6,	0x0989,	%i1
loop_349:
	nop
	setx	loop_350,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%icc,	%l1,	%l5
	movle	%xcc,	%o7,	%l4
	fmovdvs	%xcc,	%f0,	%f22
loop_350:
	fornot2s	%f1,	%f3,	%f8
	udiv	%g2,	0x01F4,	%o5
	andcc	%i7,	%l0,	%g4
	taddcctv	%o1,	%o0,	%i6
	fmovrdgez	%i4,	%f16,	%f28
	srax	%g1,	%i3,	%o6
	movne	%xcc,	%o3,	%g6
	fnors	%f1,	%f4,	%f26
	sdivx	%g3,	0x0172,	%g7
	addc	%i0,	%i2,	%l3
	andn	%l2,	0x016E,	%g5
	movrgz	%i5,	%o2,	%o4
	nop
	setx	loop_351,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcc	%xcc,	%f27,	%f31
	tneg	%xcc,	0x1
	or	%i1,	%l6,	%l1
loop_351:
	tneg	%xcc,	0x3
	fbne,a	%fcc3,	loop_352
	subccc	%o7,	%l4,	%g2
	smulcc	%l5,	%o5,	%l0
	fmovdcc	%icc,	%f8,	%f27
loop_352:
	tpos	%icc,	0x7
	call	loop_353
	tvc	%icc,	0x0
	set	0x0B, %o3
	ldsba	[%l7 + %o3] 0x18,	%i7
loop_353:
	mova	%xcc,	%o1,	%g4
	taddcctv	%o0,	0x0C68,	%i4
	be	%icc,	loop_354
	fabsd	%f10,	%f24
	bg,a,pt	%icc,	loop_355
	tn	%icc,	0x0
loop_354:
	fnors	%f1,	%f7,	%f26
	tn	%xcc,	0x1
loop_355:
	fnegd	%f26,	%f12
	movl	%icc,	%i6,	%g1
	fxnors	%f25,	%f23,	%f14
	edge8	%o6,	%i3,	%g6
	sllx	%o3,	%g3,	%g7
	array8	%i2,	%l3,	%l2
	bshuffle	%f22,	%f0,	%f22
	fbuge	loop_356
	sub	%g5,	0x1A72,	%i5
	movg	%xcc,	%o2,	%i0
	movle	%xcc,	%i1,	%o4
loop_356:
	taddcc	%l6,	%l1,	%o7
	mulscc	%g2,	0x1754,	%l5
	fmovs	%f6,	%f29
	brlz,a	%l4,	loop_357
	fsrc1	%f20,	%f22
	taddcctv	%o5,	0x0004,	%i7
	fmovse	%icc,	%f30,	%f2
loop_357:
	array16	%o1,	%l0,	%g4
	edge16l	%o0,	%i4,	%i6
	bcc	loop_358
	bge,pt	%icc,	loop_359
loop_358:
	nop

loop_359:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 368
!	Type cti   	: 359
!	Type x   	: 164
!	Type f   	: 535
!	Type i   	: 1574
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x1BC78CFD
.word 0x80F535D8
.word 0xAADE2B91
.word 0x195B2254
.word 0x87870B9B
.word 0x15861E2D
.word 0xB9686549
.word 0x086999F3
.word 0xC0321CD9
.word 0xC9A0E4A3
.word 0xF8BBDA82
.word 0x4109AB33
.word 0x034F2A51
.word 0xE7309AC9
.word 0x95176D39
.word 0x84102293
.word 0xC01C2B3B
.word 0xCF60252A
.word 0x8D3BC811
.word 0x626133F2
.word 0x1D3F08F4
.word 0x0D379237
.word 0xD7BAC3D4
.word 0xEF11AFEE
.word 0x13680F1A
.word 0x3C785A9B
.word 0xAC502194
.word 0x812476C9
.word 0x1A3B301B
.word 0xC6C7C2E7
.word 0x7A121D76
.word 0x99A56435
.word 0x76CA4F1B
.word 0xF32A5999
.word 0x7C7FD53B
.word 0x1CAFB1E9
.word 0xF70BA925
.word 0xF43CAA28
.word 0x8A9F1539
.word 0x8EFAD151
.word 0xBBBA32CA
.word 0x4D846439
.word 0x8664CFFE
.word 0x833D45A8
.word 0x833E8893
.word 0x35816822
.word 0xA9BB7D9A
.word 0xDCE9F925
.word 0x3B8AA863
.word 0x453146BD
.word 0x0C37C693
.word 0xCD32D967
.word 0xEF9EBDD9
.word 0x6CB8FAA4
.word 0xE2EC5126
.word 0x3522C99C
.word 0x0F97093B
.word 0x7C51058F
.word 0xBC951E85
.word 0x6175D4B1
.word 0xA7257140
.word 0xAE010DBF
.word 0xF35BAC87
.word 0x5BEB3F05
.end
