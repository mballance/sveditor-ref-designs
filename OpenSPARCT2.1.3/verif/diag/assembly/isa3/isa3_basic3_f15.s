/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f15.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f15.s,v 1.1 2007/05/11 17:22:21 drp Exp $"
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
	setx	0xBCF4D70F4061F7A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0xE,	%g2
	set	0x1,	%g3
	set	0x9,	%g4
	set	0xE,	%g5
	set	0x0,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xE,	%i1
	set	-0x6,	%i2
	set	-0x5,	%i3
	set	-0xB,	%i4
	set	-0x9,	%i5
	set	-0x9,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x2AE1948E,	%l0
	set	0x0ADBA7DA,	%l1
	set	0x731778D7,	%l2
	set	0x38ABFAF7,	%l3
	set	0x3B34442C,	%l4
	set	0x2B89D78B,	%l5
	set	0x73446676,	%l6
	!# Output registers
	set	-0x0947,	%o0
	set	-0x026F,	%o1
	set	0x0C46,	%o2
	set	0x1900,	%o3
	set	0x1B12,	%o4
	set	0x0201,	%o5
	set	-0x11A6,	%o6
	set	-0x16C0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF725E8426A32960C)
	INIT_TH_FP_REG(%l7,%f2,0xF9FACFF4F1F727DE)
	INIT_TH_FP_REG(%l7,%f4,0xC7DABA0BF8DB1DAB)
	INIT_TH_FP_REG(%l7,%f6,0xF00AFE0AD9EE013F)
	INIT_TH_FP_REG(%l7,%f8,0x1AA452CE7C0D7F1A)
	INIT_TH_FP_REG(%l7,%f10,0xD6C3F2E9E7597AA9)
	INIT_TH_FP_REG(%l7,%f12,0xD4537112D30E2047)
	INIT_TH_FP_REG(%l7,%f14,0x6D09BA7ADD10C4B0)
	INIT_TH_FP_REG(%l7,%f16,0x5518C7EF1D96601F)
	INIT_TH_FP_REG(%l7,%f18,0x82E5E14C945CCB3B)
	INIT_TH_FP_REG(%l7,%f20,0xA6A55E8E337106EE)
	INIT_TH_FP_REG(%l7,%f22,0x0B2F2D23B5765585)
	INIT_TH_FP_REG(%l7,%f24,0x8DEDCFCDFE1F3548)
	INIT_TH_FP_REG(%l7,%f26,0x5BC91438B823B972)
	INIT_TH_FP_REG(%l7,%f28,0x9303CF73A61311E8)
	INIT_TH_FP_REG(%l7,%f30,0xD4E685FAB4CE553B)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fnegd	%f18,	%f6
	srl	%o1,	%g7,	%o4
	edge16n	%g5,	%l6,	%o2
	fblg,a	%fcc2,	loop_1
	ldx	[%l7 + 0x60],	%g1
	sllx	%i3,	0x00,	%o3
	xnorcc	%i7,	0x1B7D,	%l1
loop_1:
	alignaddr	%i1,	%o0,	%g6
	sdivcc	%l2,	0x14A5,	%g4
	fbn	%fcc0,	loop_2
	ldstub	[%l7 + 0x3A],	%i2
	movrne	%i5,	0x101,	%i4
	movle	%icc,	%i6,	%o7
loop_2:
	fbule	%fcc1,	loop_3
	movrlez	%g2,	0x3C4,	%l4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l5
loop_3:
	movrlz	%l0,	0x2DE,	%i0
	fba,a	%fcc1,	loop_4
	bg,a	%icc,	loop_5
	movrlez	%o6,	0x330,	%o5
	fbg,a	%fcc2,	loop_6
loop_4:
	fbule,a	%fcc1,	loop_7
loop_5:
	fmovdleu	%icc,	%f6,	%f17
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%g2
loop_6:
	ba,a	%icc,	loop_8
loop_7:
	bleu,a,pt	%icc,	loop_9
	sdivcc	%o1,	0x1AB3,	%g7
	bshuffle	%f24,	%f20,	%f20
loop_8:
	movrlz	%l3,	%g5,	%l6
loop_9:
	tvc	%xcc,	0x4
	movrgz	%o2,	%g1,	%o4
	movl	%xcc,	%o3,	%i7
	sir	0x0048
	xor	%l1,	%i3,	%o0
	mova	%xcc,	%g6,	%l2
	array32	%i1,	%g4,	%i5
	edge16l	%i2,	%i4,	%i6
	sllx	%g2,	%o7,	%l5
	edge16l	%l4,	%l0,	%o6
	movge	%xcc,	%i0,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g3,	%g7
	subc	%o1,	0x0479,	%g5
	orncc	%l6,	%l3,	%g1
	edge8	%o4,	%o3,	%i7
	sir	0x0E3A
	ldstub	[%l7 + 0x61],	%l1
	fmovspos	%icc,	%f20,	%f4
	set	0x22, %l0
	stha	%o2,	[%l7 + %l0] 0xeb
	membar	#Sync
	or	%i3,	%o0,	%l2
	fexpand	%f2,	%f10
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	udivcc	%g4,	0x1ED4,	%i5
	tcc	%xcc,	0x5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i1
	tg	%xcc,	0x4
	tsubcc	%i2,	0x1F6E,	%i6
	subc	%g2,	%i4,	%l5
	srl	%o7,	0x15,	%l0
	tvc	%icc,	0x1
	fmovdcc	%xcc,	%f17,	%f26
	movneg	%icc,	%l4,	%o6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x51] %asi,	%i0
	add	%o5,	0x0DEE,	%g3
	srax	%o1,	%g5,	%g7
	fmovs	%f2,	%f0
	fornot1	%f26,	%f6,	%f30
	swap	[%l7 + 0x0C],	%l6
	smul	%g1,	0x0325,	%o4
	tn	%xcc,	0x5
	movge	%icc,	%l3,	%i7
	movle	%xcc,	%o3,	%o2
	tcs	%icc,	0x2
	fsrc1	%f14,	%f20
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x19,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f27,	%f17
	nop
	setx loop_10, %l0, %l1
	jmpl %l1, %o0
	tcs	%icc,	0x4
	fandnot2	%f14,	%f22,	%f28
	array32	%l2,	%g6,	%l1
loop_10:
	xorcc	%g4,	0x1191,	%i1
	taddcctv	%i5,	%i2,	%g2
	fcmple32	%f16,	%f16,	%i6
	sub	%i4,	%l5,	%l0
	fcmpne16	%f28,	%f26,	%o7
	fpadd32s	%f31,	%f15,	%f27
	edge8ln	%o6,	%l4,	%o5
	movgu	%xcc,	%i0,	%g3
	fandnot2s	%f2,	%f6,	%f0
	fmovdvs	%icc,	%f1,	%f28
	fpmerge	%f30,	%f18,	%f28
	fmovde	%xcc,	%f5,	%f19
	andcc	%o1,	0x139A,	%g5
	fnand	%f8,	%f22,	%f20
	fnot2	%f28,	%f18
	popc	%g7,	%l6
	movvc	%icc,	%g1,	%o4
	fmovdcs	%xcc,	%f30,	%f9
	array32	%i7,	%o3,	%o2
	array16	%i3,	%l3,	%l2
	fmovdgu	%icc,	%f26,	%f12
	move	%xcc,	%o0,	%g6
	bneg	%icc,	loop_11
	udiv	%g4,	0x19DB,	%l1
	alignaddr	%i5,	%i1,	%g2
	tcc	%xcc,	0x3
loop_11:
	tle	%icc,	0x3
	taddcc	%i2,	%i6,	%i4
	edge32l	%l0,	%l5,	%o7
	movcc	%xcc,	%o6,	%l4
	addcc	%i0,	0x1A56,	%o5
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x0c,	%f16
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x0C] %asi,	%g3
	fcmped	%fcc2,	%f24,	%f28
	orcc	%g5,	%o1,	%l6
	wr	%g0,	0x19,	%asi
	stwa	%g1,	[%l7 + 0x60] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o4,	0x0872,	%i7
	fmovse	%icc,	%f15,	%f3
	te	%icc,	0x6
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x10,	%g6
	sub	%o3,	0x1366,	%i3
	bg,a	loop_12
	movvc	%icc,	%l3,	%l2
	fmovdn	%xcc,	%f26,	%f1
	movneg	%icc,	%o0,	%o2
loop_12:
	movre	%g4,	0x279,	%l1
	smulcc	%i5,	%g6,	%i1
	set	0x10, %o3
	stxa	%g2,	[%l7 + %o3] 0x19
	array32	%i6,	%i2,	%l0
	taddcctv	%l5,	%o7,	%i4
	fpsub16s	%f0,	%f29,	%f15
	fmovdge	%icc,	%f14,	%f24
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o6
	lduw	[%l7 + 0x2C],	%i0
	orcc	%l4,	%g3,	%o5
	movcc	%icc,	%g5,	%l6
	nop
	set	0x78, %g6
	stx	%o1,	[%l7 + %g6]
	fmovrdgz	%o4,	%f14,	%f22
	ldstub	[%l7 + 0x2C],	%i7
	fzeros	%f15
	bn	loop_13
	fandnot1	%f10,	%f30,	%f12
	sdivx	%g7,	0x17D5,	%o3
	ldd	[%l7 + 0x18],	%f6
loop_13:
	stb	%g1,	[%l7 + 0x76]
	fble,a	%fcc0,	loop_14
	movrgez	%l3,	%i3,	%o0
	fmovsa	%icc,	%f8,	%f6
	fornot1	%f14,	%f30,	%f10
loop_14:
	srax	%l2,	0x04,	%o2
	subcc	%l1,	%i5,	%g4
	tvc	%xcc,	0x7
	fnot2	%f0,	%f26
	te	%icc,	0x0
	fzeros	%f17
	sdiv	%i1,	0x1804,	%g2
	fbue,a	%fcc3,	loop_15
	edge16	%g6,	%i6,	%i2
	bvs,pn	%icc,	loop_16
	srlx	%l5,	%o7,	%l0
loop_15:
	bn	%icc,	loop_17
	fmul8x16au	%f30,	%f6,	%f0
loop_16:
	stx	%i4,	[%l7 + 0x38]
	fmovrdlez	%i0,	%f18,	%f20
loop_17:
	xorcc	%o6,	0x06A0,	%g3
	fcmpeq32	%f14,	%f8,	%o5
	stbar
	be,pn	%icc,	loop_18
	sll	%g5,	%l6,	%l4
	fpadd16	%f20,	%f24,	%f20
	addccc	%o1,	%i7,	%g7
loop_18:
	fnegs	%f9,	%f9
	movvs	%icc,	%o3,	%o4
	tg	%xcc,	0x3
	set	0x44, %o4
	ldsha	[%l7 + %o4] 0x15,	%g1
	edge16	%l3,	%o0,	%i3
	mova	%xcc,	%l2,	%l1
	set	0x4C, %l6
	lduha	[%l7 + %l6] 0x88,	%i5
	fmovdgu	%xcc,	%f15,	%f3
	edge16	%g4,	%i1,	%g2
	fsrc1s	%f26,	%f11
	ldd	[%l7 + 0x40],	%f0
	movgu	%xcc,	%o2,	%i6
	tcs	%xcc,	0x1
	fpack16	%f14,	%f19
	fmuld8ulx16	%f17,	%f16,	%f14
	edge16n	%g6,	%i2,	%o7
	movle	%xcc,	%l0,	%l5
	fnands	%f7,	%f19,	%f20
	fmovd	%f10,	%f22
	sdivcc	%i0,	0x0CF6,	%i4
	sub	%g3,	%o5,	%g5
	bneg,pn	%icc,	loop_19
	fcmple32	%f24,	%f22,	%l6
	movrgz	%o6,	0x3FA,	%o1
	tneg	%icc,	0x2
loop_19:
	edge8	%l4,	%g7,	%o3
	mulscc	%o4,	0x1057,	%i7
	smul	%l3,	%g1,	%o0
	bpos	loop_20
	sra	%i3,	%l2,	%i5
	fnot2	%f0,	%f6
	alignaddrl	%g4,	%l1,	%g2
loop_20:
	mulx	%i1,	0x0311,	%o2
	fnot1s	%f15,	%f17
	fnegs	%f19,	%f12
	bpos,pn	%icc,	loop_21
	stbar
	fnot2s	%f9,	%f23
	edge16l	%g6,	%i2,	%o7
loop_21:
	fbne	%fcc0,	loop_22
	xor	%l0,	0x15D1,	%i6
	set	0x0E, %i4
	stha	%i0,	[%l7 + %i4] 0x2b
	membar	#Sync
loop_22:
	tle	%icc,	0x5
	fbule	%fcc2,	loop_23
	fmovsvc	%xcc,	%f18,	%f20
	edge16l	%l5,	%g3,	%o5
	fmovd	%f0,	%f28
loop_23:
	fmul8ulx16	%f8,	%f14,	%f0
	sir	0x1E80
	orncc	%i4,	%g5,	%l6
	move	%xcc,	%o1,	%o6
	and	%l4,	0x1272,	%g7
	tvc	%icc,	0x1
	fbue,a	%fcc3,	loop_24
	xnor	%o4,	0x12D6,	%o3
	edge32n	%l3,	%g1,	%i7
	fmovdpos	%xcc,	%f21,	%f28
loop_24:
	xorcc	%o0,	%l2,	%i5
	ldd	[%l7 + 0x58],	%g4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x32] %asi,	%l1
	sdivcc	%i3,	0x1FDA,	%g2
	edge32ln	%o2,	%i1,	%g6
	fbuge	%fcc3,	loop_25
	xnor	%i2,	%l0,	%o7
	ldx	[%l7 + 0x78],	%i0
	fmovsleu	%icc,	%f12,	%f23
loop_25:
	mulscc	%i6,	0x09D5,	%l5
	fornot1	%f2,	%f18,	%f8
	fmovsvs	%xcc,	%f16,	%f4
	movvs	%icc,	%g3,	%o5
	tsubcc	%g5,	%l6,	%o1
	andncc	%i4,	%o6,	%g7
	fmovrse	%l4,	%f6,	%f23
	taddcc	%o4,	%l3,	%g1
	tvc	%xcc,	0x0
	edge16	%i7,	%o0,	%o3
	taddcctv	%l2,	%i5,	%g4
	fnors	%f27,	%f24,	%f1
	edge8n	%l1,	%i3,	%o2
	fmovrdgz	%i1,	%f20,	%f30
	tpos	%icc,	0x5
	movrlez	%g6,	0x377,	%i2
	te	%xcc,	0x2
	bvc,pn	%xcc,	loop_26
	subcc	%l0,	0x1012,	%g2
	fxor	%f20,	%f16,	%f0
	ldstub	[%l7 + 0x20],	%i0
loop_26:
	or	%i6,	%o7,	%l5
	edge16	%o5,	%g5,	%l6
	movrlz	%g3,	%i4,	%o1
	te	%icc,	0x4
	fbg	%fcc3,	loop_27
	taddcctv	%g7,	0x00EA,	%o6
	addcc	%o4,	0x0511,	%l3
	xnorcc	%g1,	0x1802,	%i7
loop_27:
	sllx	%o0,	0x0F,	%o3
	fpadd16s	%f13,	%f14,	%f1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0E] %asi,	%l4
	edge16	%i5,	%g4,	%l1
	fpsub16	%f28,	%f26,	%f16
	udivcc	%i3,	0x0489,	%o2
	flush	%l7 + 0x10
	fbu,a	%fcc0,	loop_28
	sll	%l2,	0x1E,	%i1
	array8	%i2,	%g6,	%l0
	movl	%icc,	%i0,	%g2
loop_28:
	fmovrsgez	%o7,	%f24,	%f14
	fpadd32	%f14,	%f18,	%f14
	taddcctv	%i6,	%o5,	%g5
	fmovsneg	%xcc,	%f20,	%f21
	mova	%icc,	%l5,	%g3
	addccc	%i4,	0x0BF3,	%l6
	mova	%xcc,	%g7,	%o1
	bcs,a	loop_29
	ble	loop_30
	fmovsg	%xcc,	%f21,	%f15
	tneg	%xcc,	0x4
loop_29:
	fpsub32	%f24,	%f16,	%f16
loop_30:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o6,	0x19,	%l3
	fxor	%f14,	%f14,	%f8
	sll	%g1,	%o4,	%i7
	bvs,a,pn	%icc,	loop_31
	movne	%xcc,	%o3,	%o0
	umul	%i5,	0x0E08,	%l4
	taddcctv	%g4,	%i3,	%o2
loop_31:
	movcs	%xcc,	%l1,	%i1
	tg	%icc,	0x3
	tneg	%xcc,	0x5
	xnor	%i2,	%g6,	%l2
	movne	%xcc,	%l0,	%i0
	and	%o7,	0x1E9A,	%g2
	movn	%xcc,	%i6,	%o5
	fones	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f20,	%f20
	fnor	%f30,	%f28,	%f4
	stw	%l5,	[%l7 + 0x14]
	umul	%g5,	0x0DEB,	%g3
	tvs	%icc,	0x1
	ldstub	[%l7 + 0x1B],	%l6
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x0c,	%g7
	orncc	%o1,	%o6,	%l3
	ta	%xcc,	0x0
	movvs	%xcc,	%g1,	%i4
	fmovrse	%i7,	%f27,	%f1
	subcc	%o4,	%o3,	%o0
	movneg	%xcc,	%l4,	%g4
	ldsb	[%l7 + 0x21],	%i5
	smul	%o2,	0x1B91,	%i3
	ldd	[%l7 + 0x20],	%l0
	taddcc	%i2,	0x060B,	%i1
	fcmple16	%f12,	%f2,	%l2
	fmovscs	%xcc,	%f28,	%f25
	movre	%g6,	%l0,	%i0
	bvs	%icc,	loop_32
	st	%f17,	[%l7 + 0x38]
	smul	%o7,	%g2,	%i6
	andn	%l5,	%g5,	%o5
loop_32:
	fbg	%fcc0,	loop_33
	movneg	%icc,	%g3,	%g7
	nop
	setx loop_34, %l0, %l1
	jmpl %l1, %l6
	ta	%xcc,	0x0
loop_33:
	bl,a	loop_35
	movcs	%xcc,	%o6,	%l3
loop_34:
	fbo,a	%fcc3,	loop_36
	xnor	%o1,	0x12BB,	%i4
loop_35:
	sdiv	%i7,	0x1B18,	%g1
	call	loop_37
loop_36:
	tpos	%xcc,	0x2
	ldsh	[%l7 + 0x6C],	%o3
	fmovdg	%xcc,	%f29,	%f22
loop_37:
	fmovsvs	%icc,	%f4,	%f24
	sllx	%o4,	%l4,	%g4
	bneg,a	%icc,	loop_38
	prefetch	[%l7 + 0x48],	 0x3
	bneg	loop_39
	movcc	%xcc,	%i5,	%o2
loop_38:
	call	loop_40
	subccc	%o0,	%i3,	%i2
loop_39:
	srlx	%l1,	0x18,	%i1
	fbue,a	%fcc2,	loop_41
loop_40:
	fbo	%fcc3,	loop_42
	fbue	%fcc0,	loop_43
	tle	%icc,	0x7
loop_41:
	fornot1	%f16,	%f6,	%f24
loop_42:
	fmovspos	%xcc,	%f21,	%f8
loop_43:
	nop
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x81,	%g6
	fones	%f12
	fbuge	%fcc1,	loop_44
	edge32	%l0,	%l2,	%i0
	or	%o7,	0x0556,	%i6
	fmul8ulx16	%f16,	%f16,	%f8
loop_44:
	sdivx	%l5,	0x1DC9,	%g2
	movneg	%icc,	%g5,	%g3
	edge8l	%g7,	%o5,	%o6
	array8	%l3,	%o1,	%i4
	udiv	%i7,	0x1BF4,	%l6
	movre	%g1,	0x257,	%o3
	edge16ln	%o4,	%l4,	%i5
	umul	%o2,	0x0881,	%o0
	pdist	%f26,	%f28,	%f24
	sir	0x07F4
	fmovdcc	%icc,	%f3,	%f26
	alignaddr	%i3,	%g4,	%l1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i1
	subcc	%g6,	%l0,	%i0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x57] %asi,	%l2
	prefetch	[%l7 + 0x3C],	 0x1
	srl	%i6,	0x16,	%o7
	fcmpne16	%f24,	%f2,	%g2
	tcc	%icc,	0x6
	fmuld8sux16	%f20,	%f12,	%f4
	edge16	%g5,	%g3,	%g7
	edge32l	%l5,	%o5,	%l3
	movrlez	%o1,	%i4,	%i7
	nop
	setx	loop_45,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%icc,	0x6
	sdiv	%o6,	0x08C6,	%g1
	sdiv	%l6,	0x1D56,	%o3
loop_45:
	fmovdneg	%icc,	%f7,	%f15
	alignaddrl	%o4,	%i5,	%l4
	move	%xcc,	%o2,	%o0
	lduh	[%l7 + 0x44],	%g4
	brz	%l1,	loop_46
	sra	%i2,	0x1D,	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g6,	%l0
loop_46:
	ble,a,pn	%icc,	loop_47
	andn	%i3,	0x0BAC,	%l2
	stw	%i6,	[%l7 + 0x54]
	tsubcc	%o7,	0x0095,	%g2
loop_47:
	orn	%g5,	0x152A,	%g3
	subc	%i0,	%g7,	%l5
	alignaddr	%o5,	%o1,	%i4
	fmovsl	%xcc,	%f29,	%f3
	fmovsneg	%xcc,	%f7,	%f12
	stbar
	sub	%l3,	0x1061,	%i7
	andcc	%o6,	0x068B,	%g1
	subcc	%l6,	0x04FE,	%o3
	fornot1s	%f29,	%f2,	%f15
	fbl	%fcc3,	loop_48
	orncc	%i5,	%o4,	%l4
	fmovsvc	%xcc,	%f0,	%f11
	orn	%o2,	%g4,	%o0
loop_48:
	edge32l	%l1,	%i1,	%g6
	taddcctv	%l0,	%i3,	%l2
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i6
	tpos	%icc,	0x1
	bcc	loop_49
	ba,pt	%icc,	loop_50
	fmuld8sux16	%f12,	%f25,	%f12
	srlx	%i2,	0x02,	%o7
loop_49:
	ta	%xcc,	0x6
loop_50:
	nop
	set	0x5C, %g2
	lduha	[%l7 + %g2] 0x10,	%g2
	tgu	%xcc,	0x6
	fbne	%fcc3,	loop_51
	fmovrsgz	%g3,	%f14,	%f25
	tne	%xcc,	0x2
	fbule	%fcc3,	loop_52
loop_51:
	tl	%icc,	0x5
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_52:
	orncc	%g5,	%g7,	%i0
	andcc	%o5,	0x086C,	%o1
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f26
	fmovsne	%icc,	%f0,	%f21
	edge32ln	%l5,	%l3,	%i7
	stw	%o6,	[%l7 + 0x4C]
	ta	%xcc,	0x6
	edge16ln	%i4,	%g1,	%l6
	nop
	set	0x46, %g5
	ldsh	[%l7 + %g5],	%o3
	array32	%i5,	%l4,	%o2
	array32	%g4,	%o4,	%o0
	set	0x62, %o5
	ldsha	[%l7 + %o5] 0x18,	%i1
	edge8ln	%l1,	%l0,	%i3
	movrgz	%g6,	%l2,	%i2
	subccc	%i6,	0x032B,	%o7
	movre	%g2,	%g5,	%g7
	edge32l	%i0,	%g3,	%o1
	udiv	%l5,	0x0C4F,	%o5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x49] %asi,	%l3
	orcc	%i7,	0x0E6E,	%i4
	bshuffle	%f2,	%f0,	%f24
	addcc	%o6,	%l6,	%g1
	fpsub32	%f2,	%f10,	%f8
	add	%i5,	%o3,	%l4
	brlez,a	%g4,	loop_53
	swap	[%l7 + 0x5C],	%o4
	fmovspos	%icc,	%f21,	%f25
	sub	%o0,	%o2,	%l1
loop_53:
	sir	0x1ACD
	or	%l0,	%i1,	%g6
	movn	%xcc,	%i3,	%i2
	tvs	%icc,	0x3
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%l2
	call	loop_54
	fxnor	%f0,	%f20,	%f8
	tvc	%xcc,	0x7
	sdivcc	%i6,	0x0E07,	%o7
loop_54:
	srax	%g5,	%g7,	%g2
	fbe,a	%fcc1,	loop_55
	fnot2	%f6,	%f12
	edge16ln	%i0,	%g3,	%o1
	fmovsn	%icc,	%f28,	%f21
loop_55:
	fpackfix	%f14,	%f9
	fcmpne16	%f4,	%f26,	%o5
	sir	0x06C8
	edge8ln	%l5,	%l3,	%i7
	movne	%icc,	%i4,	%l6
	tneg	%icc,	0x2
	fmovrsne	%g1,	%f20,	%f29
	fmovde	%icc,	%f29,	%f2
	stb	%o6,	[%l7 + 0x47]
	edge8ln	%o3,	%i5,	%g4
	movrgez	%o4,	0x3C7,	%l4
	fmovdle	%xcc,	%f14,	%f9
	movg	%icc,	%o2,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%l0,	%o0
	siam	0x1
	edge32n	%g6,	%i1,	%i3
	movrgz	%l2,	0x141,	%i2
	fmovrdgez	%o7,	%f2,	%f16
	sllx	%g5,	0x0D,	%i6
	stbar
	set	0x18, %g7
	sta	%f0,	[%l7 + %g7] 0x0c
	array32	%g7,	%g2,	%g3
	tpos	%xcc,	0x5
	fmovde	%icc,	%f12,	%f22
	smulcc	%i0,	0x1114,	%o5
	fmovdle	%xcc,	%f17,	%f22
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%l5
	ldsb	[%l7 + 0x36],	%o1
	wr	%g0,	0x80,	%asi
	stwa	%l3,	[%l7 + 0x24] %asi
	fbge	%fcc1,	loop_56
	fpadd16	%f24,	%f12,	%f0
	movg	%icc,	%i7,	%l6
	fbule,a	%fcc3,	loop_57
loop_56:
	udiv	%g1,	0x0CB9,	%i4
	addccc	%o6,	0x0AE8,	%i5
	stw	%g4,	[%l7 + 0x20]
loop_57:
	fsrc1s	%f10,	%f30
	brz,a	%o3,	loop_58
	tn	%icc,	0x6
	xnor	%l4,	%o2,	%o4
	tsubcc	%l1,	0x0125,	%l0
loop_58:
	sll	%o0,	0x0B,	%g6
	fbe	%fcc2,	loop_59
	ldstub	[%l7 + 0x4C],	%i3
	membar	0x37
	call	loop_60
loop_59:
	orn	%i1,	%i2,	%o7
	membar	0x4C
	fcmpeq16	%f14,	%f18,	%l2
loop_60:
	te	%icc,	0x7
	movleu	%icc,	%i6,	%g7
	fmovdg	%xcc,	%f14,	%f31
	edge32n	%g5,	%g2,	%i0
	movneg	%icc,	%g3,	%l5
	ble,a,pt	%icc,	loop_61
	bneg,a	loop_62
	tl	%xcc,	0x0
	set	0x1C, %i6
	lda	[%l7 + %i6] 0x88,	%f19
loop_61:
	udivcc	%o1,	0x19D5,	%l3
loop_62:
	addc	%i7,	%o5,	%l6
	mulscc	%g1,	%o6,	%i4
	tsubcc	%g4,	0x05F1,	%i5
	fmovspos	%xcc,	%f0,	%f19
	movcs	%xcc,	%l4,	%o3
	tcc	%xcc,	0x5
	fcmple16	%f24,	%f16,	%o2
	fmovsl	%icc,	%f0,	%f5
	movcc	%icc,	%l1,	%l0
	set	0x68, %o1
	stda	%o0,	[%l7 + %o1] 0x89
	lduh	[%l7 + 0x34],	%g6
	and	%o4,	%i1,	%i2
	sra	%o7,	0x1E,	%i3
	array8	%l2,	%g7,	%i6
	fpack16	%f18,	%f21
	tn	%xcc,	0x3
	ldsh	[%l7 + 0x70],	%g5
	taddcc	%i0,	0x0A16,	%g3
	alignaddrl	%l5,	%g2,	%o1
	stbar
	taddcctv	%i7,	%o5,	%l3
	fcmped	%fcc3,	%f0,	%f2
	mova	%xcc,	%g1,	%o6
	fmovse	%xcc,	%f25,	%f26
	st	%f13,	[%l7 + 0x6C]
	udiv	%l6,	0x03B0,	%g4
	movneg	%icc,	%i4,	%i5
	tge	%icc,	0x4
	movg	%xcc,	%o3,	%l4
	sdivcc	%l1,	0x09D6,	%l0
	fbul,a	%fcc2,	loop_63
	xor	%o2,	0x15C4,	%o0
	tneg	%icc,	0x4
	movg	%xcc,	%o4,	%i1
loop_63:
	taddcc	%g6,	0x01A7,	%o7
	tgu	%icc,	0x5
	edge8ln	%i2,	%l2,	%i3
	wr	%g0,	0x04,	%asi
	sta	%f21,	[%l7 + 0x3C] %asi
	array8	%g7,	%g5,	%i0
	edge8ln	%g3,	%i6,	%g2
	umulcc	%l5,	0x1328,	%i7
	fcmple32	%f22,	%f24,	%o1
	tl	%xcc,	0x0
	edge32n	%l3,	%g1,	%o5
	fbue,a	%fcc0,	loop_64
	movvs	%xcc,	%l6,	%o6
	move	%icc,	%g4,	%i5
	fmovs	%f28,	%f1
loop_64:
	fmovde	%icc,	%f4,	%f31
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%l4
	fmovdcc	%icc,	%f18,	%f3
	tvs	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f0,	%f24
	sll	%l1,	%l0,	%o2
	ldsw	[%l7 + 0x60],	%o3
	set	0x10, %i2
	lduba	[%l7 + %i2] 0x88,	%o0
	stb	%o4,	[%l7 + 0x69]
	fnot2s	%f2,	%f9
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g6,	%i1
	fornot1	%f2,	%f14,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o7,	0x0E5F,	%l2
	smul	%i2,	%i3,	%g5
	fble	%fcc3,	loop_65
	lduw	[%l7 + 0x64],	%i0
	fmovrslz	%g3,	%f9,	%f7
	fbug,a	%fcc1,	loop_66
loop_65:
	xnorcc	%i6,	0x0803,	%g2
	fpack32	%f6,	%f20,	%f20
	edge8l	%l5,	%g7,	%o1
loop_66:
	subccc	%i7,	0x073B,	%l3
	xnorcc	%o5,	%l6,	%o6
	array16	%g4,	%i5,	%g1
	sdivcc	%l4,	0x1542,	%i4
	fands	%f28,	%f2,	%f8
	edge16	%l0,	%l1,	%o3
	addc	%o0,	0x1147,	%o2
	andcc	%o4,	0x0C14,	%g6
	tcs	%xcc,	0x1
	xnor	%o7,	%i1,	%i2
	edge32ln	%i3,	%g5,	%i0
	bcc	%icc,	loop_67
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l2,	0x01C9,	%i6
	smulcc	%g3,	%l5,	%g2
loop_67:
	movle	%icc,	%g7,	%o1
	fnands	%f0,	%f2,	%f27
	movrgz	%i7,	0x24B,	%l3
	fbu,a	%fcc0,	loop_68
	movcc	%xcc,	%l6,	%o6
	fxors	%f16,	%f19,	%f9
	ta	%icc,	0x7
loop_68:
	add	%o5,	%g4,	%i5
	tvs	%icc,	0x3
	alignaddrl	%g1,	%l4,	%l0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x08] %asi,	%i4
	brgez,a	%o3,	loop_69
	fmovd	%f12,	%f14
	xnorcc	%o0,	%l1,	%o2
	st	%f13,	[%l7 + 0x54]
loop_69:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pt	%icc,	loop_70
	movl	%icc,	%o4,	%o7
	sdivx	%i1,	0x020F,	%i2
	siam	0x0
loop_70:
	fmul8ulx16	%f22,	%f4,	%f26
	edge16l	%i3,	%g6,	%i0
	xor	%g5,	0x148D,	%l2
	add	%i6,	%l5,	%g2
	nop
	setx	loop_71,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%icc,	%f20,	%f2
	be	loop_72
	sll	%g3,	0x1A,	%g7
loop_71:
	fbg	%fcc3,	loop_73
	sub	%i7,	%l3,	%o1
loop_72:
	umul	%l6,	%o5,	%g4
	fmovdn	%xcc,	%f4,	%f22
loop_73:
	and	%i5,	0x1D55,	%o6
	movle	%xcc,	%l4,	%l0
	tsubcctv	%i4,	%g1,	%o0
	edge8n	%l1,	%o3,	%o2
	bl,a	%xcc,	loop_74
	tcc	%xcc,	0x1
	for	%f18,	%f6,	%f14
	fmul8sux16	%f8,	%f14,	%f4
loop_74:
	edge32ln	%o4,	%o7,	%i1
	add	%i3,	%i2,	%i0
	fcmpd	%fcc1,	%f26,	%f12
	ba,a	%xcc,	loop_75
	alignaddr	%g6,	%l2,	%g5
	fblg,a	%fcc3,	loop_76
	xor	%i6,	0x19A9,	%g2
loop_75:
	array8	%g3,	%l5,	%g7
	fpack16	%f20,	%f13
loop_76:
	nop
	set	0x72, %i0
	stha	%i7,	[%l7 + %i0] 0x0c
	umul	%l3,	%o1,	%o5
	movne	%xcc,	%l6,	%i5
	srl	%g4,	0x1F,	%o6
	edge16ln	%l4,	%l0,	%g1
	umul	%o0,	0x1363,	%l1
	fblg,a	%fcc2,	loop_77
	movpos	%xcc,	%i4,	%o3
	mova	%xcc,	%o4,	%o2
	udiv	%i1,	0x17A0,	%o7
loop_77:
	mulscc	%i3,	%i2,	%g6
	orncc	%l2,	0x13D0,	%g5
	fmovsvc	%icc,	%f19,	%f20
	fsrc1	%f28,	%f6
	mova	%icc,	%i0,	%i6
	array32	%g3,	%l5,	%g7
	ldx	[%l7 + 0x40],	%i7
	mulscc	%g2,	%o1,	%o5
	ldsh	[%l7 + 0x4A],	%l3
	fcmps	%fcc3,	%f28,	%f20
	andcc	%l6,	0x1D0C,	%g4
	te	%icc,	0x3
	fmul8ulx16	%f20,	%f10,	%f18
	fpsub32	%f26,	%f24,	%f18
	edge32n	%o6,	%l4,	%i5
	edge8ln	%l0,	%g1,	%l1
	fmovdpos	%xcc,	%f12,	%f17
	movcc	%icc,	%i4,	%o3
	fbl,a	%fcc0,	loop_78
	sdiv	%o4,	0x0F36,	%o0
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o2
loop_78:
	tcs	%xcc,	0x2
	movpos	%icc,	%i1,	%i3
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovdn	%xcc,	%f27,	%f1
	orcc	%o7,	0x1D97,	%g6
	sdivcc	%l2,	0x15EE,	%i2
	fbe	%fcc3,	loop_79
	alignaddrl	%i0,	%g5,	%i6
	fmovs	%f27,	%f5
	tcs	%xcc,	0x6
loop_79:
	fcmple32	%f30,	%f30,	%l5
	fand	%f20,	%f2,	%f6
	tn	%icc,	0x5
	tcs	%icc,	0x3
	wr	%g0,	0x04,	%asi
	sta	%f19,	[%l7 + 0x78] %asi
	set	0x3C, %i5
	stha	%g7,	[%l7 + %i5] 0x2a
	membar	#Sync
	tcc	%xcc,	0x7
	edge32ln	%i7,	%g3,	%g2
	tpos	%xcc,	0x6
	popc	0x11B1,	%o5
	fmovdpos	%xcc,	%f22,	%f13
	fpackfix	%f8,	%f7
	fmovrdne	%o1,	%f26,	%f6
	movgu	%icc,	%l6,	%l3
	tpos	%icc,	0x4
	swap	[%l7 + 0x28],	%o6
	udiv	%g4,	0x1DBF,	%i5
	fandnot2s	%f29,	%f16,	%f3
	movcs	%icc,	%l4,	%l0
	movg	%icc,	%l1,	%g1
	fmul8x16au	%f17,	%f11,	%f10
	tvs	%xcc,	0x1
	xnorcc	%o3,	%i4,	%o4
	orn	%o0,	0x0468,	%o2
	movrne	%i3,	0x3DA,	%o7
	smulcc	%g6,	0x1809,	%i1
	movrgz	%l2,	0x173,	%i2
	fmovrdlz	%g5,	%f18,	%f18
	sdiv	%i6,	0x0556,	%i0
	edge16	%g7,	%i7,	%l5
	fmovsn	%icc,	%f11,	%f13
	srax	%g2,	0x03,	%o5
	andncc	%o1,	%g3,	%l6
	fnands	%f31,	%f19,	%f8
	smulcc	%o6,	%l3,	%i5
	fcmpne32	%f22,	%f24,	%g4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%l4
	taddcctv	%l1,	0x02FB,	%g1
	fmovdneg	%icc,	%f0,	%f2
	edge8n	%l0,	%o3,	%i4
	bvs,a,pn	%xcc,	loop_80
	andn	%o0,	0x07B9,	%o2
	orncc	%i3,	0x0F43,	%o4
	ld	[%l7 + 0x6C],	%f17
loop_80:
	fmovdvs	%icc,	%f7,	%f11
	taddcctv	%g6,	%o7,	%l2
	fpadd16s	%f28,	%f20,	%f0
	fbo	%fcc0,	loop_81
	bne,a,pt	%icc,	loop_82
	edge8	%i1,	%g5,	%i2
	fnor	%f16,	%f2,	%f26
loop_81:
	nop
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
loop_82:
	ld	[%l7 + 0x4C],	%f3
	udivx	%i0,	0x13E7,	%g7
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x88
	brgz	%i7,	loop_83
	fmovrsne	%l5,	%f13,	%f24
	movvc	%icc,	%g2,	%o5
	edge32ln	%o1,	%g3,	%l6
loop_83:
	fbul	%fcc0,	loop_84
	and	%l3,	%i5,	%o6
	fsrc2	%f26,	%f4
	edge8	%g4,	%l4,	%l1
loop_84:
	sethi	0x19E2,	%g1
	movneg	%icc,	%l0,	%o3
	fsrc2	%f20,	%f2
	smulcc	%i4,	0x062A,	%o0
	subccc	%o2,	0x075D,	%i3
	sub	%o4,	%o7,	%l2
	tn	%icc,	0x0
	set	0x70, %i3
	stha	%g6,	[%l7 + %i3] 0xeb
	membar	#Sync
	sethi	0x033F,	%i1
	fzeros	%f8
	popc	%g5,	%i6
	call	loop_85
	add	%i0,	0x1022,	%g7
	fmovrdgez	%i7,	%f26,	%f26
	ta	%xcc,	0x7
loop_85:
	subccc	%l5,	%i2,	%g2
	tleu	%icc,	0x3
	brlez	%o5,	loop_86
	tvs	%xcc,	0x2
	edge32ln	%o1,	%l6,	%g3
	fcmpgt16	%f4,	%f0,	%i5
loop_86:
	fblg,a	%fcc2,	loop_87
	tcs	%icc,	0x6
	fmovsn	%icc,	%f26,	%f13
	edge8n	%o6,	%g4,	%l3
loop_87:
	ta	%xcc,	0x7
	fbuge	%fcc3,	loop_88
	sll	%l4,	0x13,	%l1
	stx	%g1,	[%l7 + 0x30]
	brlez	%o3,	loop_89
loop_88:
	fmovrdgez	%i4,	%f10,	%f0
	bvs,pt	%icc,	loop_90
	tne	%icc,	0x7
loop_89:
	mulx	%o0,	0x190C,	%o2
	edge8	%l0,	%i3,	%o7
loop_90:
	taddcctv	%o4,	0x056F,	%l2
	bgu	loop_91
	fmovrdlez	%g6,	%f6,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i1,	%g5,	%i0
loop_91:
	fbug,a	%fcc2,	loop_92
	fmovsneg	%icc,	%f8,	%f12
	mulscc	%i6,	%g7,	%i7
	movrlez	%i2,	%l5,	%o5
loop_92:
	fmovdvc	%icc,	%f21,	%f20
	edge16ln	%o1,	%l6,	%g3
	xnorcc	%i5,	%g2,	%g4
	mova	%xcc,	%l3,	%l4
	be,pn	%icc,	loop_93
	faligndata	%f12,	%f2,	%f24
	lduh	[%l7 + 0x50],	%o6
	tcs	%icc,	0x4
loop_93:
	sllx	%g1,	%l1,	%i4
	sir	0x17D7
	tvs	%icc,	0x4
	edge8l	%o3,	%o0,	%l0
	array8	%i3,	%o7,	%o2
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f28
	bg,a	loop_94
	tn	%icc,	0x0
	fnot2s	%f30,	%f22
	tvs	%icc,	0x0
loop_94:
	bn,pn	%icc,	loop_95
	orcc	%l2,	0x1502,	%o4
	fmovdvs	%xcc,	%f22,	%f18
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x7C] %asi,	%i1
loop_95:
	movcs	%icc,	%g5,	%g6
	xor	%i0,	0x15B1,	%g7
	lduh	[%l7 + 0x12],	%i7
	orn	%i2,	%i6,	%l5
	fcmple32	%f12,	%f12,	%o5
	stw	%l6,	[%l7 + 0x10]
	bn,a	loop_96
	subccc	%g3,	%o1,	%g2
	ldd	[%l7 + 0x38],	%i4
	fmovscc	%xcc,	%f4,	%f24
loop_96:
	fmovdcc	%xcc,	%f11,	%f3
	fmovsleu	%xcc,	%f5,	%f17
	array16	%l3,	%l4,	%g4
	tsubcc	%g1,	%o6,	%l1
	sll	%o3,	0x07,	%i4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x20] %asi,	%f9
	movle	%icc,	%o0,	%l0
	movgu	%xcc,	%o7,	%i3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x04,	%o2,	%l2
	set	0x0C, %l1
	lduwa	[%l7 + %l1] 0x10,	%o4
	bcc	loop_97
	tcc	%xcc,	0x7
	fba,a	%fcc0,	loop_98
	bvs,pt	%xcc,	loop_99
loop_97:
	taddcc	%g5,	0x089E,	%g6
	addccc	%i0,	0x1638,	%g7
loop_98:
	fbug	%fcc1,	loop_100
loop_99:
	movneg	%icc,	%i7,	%i1
	edge8l	%i2,	%i6,	%l5
	call	loop_101
loop_100:
	edge8ln	%o5,	%g3,	%o1
	edge32ln	%l6,	%g2,	%l3
	nop
	set	0x18, %l2
	stx	%i5,	[%l7 + %l2]
loop_101:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%g4,	loop_102
	sdiv	%l4,	0x186D,	%o6
	tle	%icc,	0x3
	orn	%g1,	0x022D,	%l1
loop_102:
	brz	%o3,	loop_103
	fbge,a	%fcc3,	loop_104
	movn	%xcc,	%o0,	%i4
	tsubcc	%o7,	%l0,	%i3
loop_103:
	xnor	%o2,	%o4,	%l2
loop_104:
	fmovdge	%icc,	%f5,	%f21
	lduh	[%l7 + 0x40],	%g6
	add	%g5,	0x0B43,	%g7
	fmovrslez	%i0,	%f10,	%f21
	tgu	%xcc,	0x6
	fpsub16s	%f6,	%f12,	%f23
	edge32ln	%i7,	%i1,	%i2
	mulscc	%i6,	0x01C1,	%o5
	umulcc	%g3,	0x1561,	%l5
	tl	%icc,	0x7
	xnorcc	%o1,	0x15DA,	%g2
	fcmple16	%f12,	%f16,	%l6
	tne	%icc,	0x7
	fcmple16	%f6,	%f30,	%i5
	fmul8ulx16	%f16,	%f8,	%f6
	taddcc	%l3,	%l4,	%o6
	fmovsle	%xcc,	%f26,	%f25
	fmovsvs	%icc,	%f4,	%f12
	mulx	%g4,	0x0203,	%g1
	srax	%o3,	%o0,	%i4
	set	0x58, %l5
	stba	%l1,	[%l7 + %l5] 0x11
	movre	%o7,	0x052,	%i3
	tne	%xcc,	0x3
	andncc	%o2,	%o4,	%l2
	tvs	%xcc,	0x0
	fbul	%fcc3,	loop_105
	tne	%xcc,	0x7
	bcs	%xcc,	loop_106
	fmul8x16al	%f15,	%f3,	%f10
loop_105:
	fmovdvs	%xcc,	%f22,	%f20
	brz,a	%l0,	loop_107
loop_106:
	srax	%g6,	%g7,	%g5
	tleu	%xcc,	0x1
	fmovdle	%icc,	%f26,	%f22
loop_107:
	mulx	%i7,	0x0B8F,	%i0
	mova	%xcc,	%i2,	%i6
	fbo,a	%fcc1,	loop_108
	siam	0x0
	fxor	%f26,	%f24,	%f2
	tge	%icc,	0x3
loop_108:
	call	loop_109
	xnorcc	%o5,	%g3,	%l5
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
loop_109:
	stw	%o1,	[%l7 + 0x2C]
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	tvs	%icc,	0x2
	set	0x18, %g3
	stda	%i4,	[%l7 + %g3] 0xea
	membar	#Sync
	ldsh	[%l7 + 0x42],	%l3
	movpos	%xcc,	%l4,	%g2
	edge16n	%g4,	%o6,	%g1
	ldstub	[%l7 + 0x2B],	%o3
	fmovdvs	%icc,	%f26,	%f19
	fblg,a	%fcc3,	loop_110
	fxors	%f5,	%f1,	%f31
	bpos,a	%icc,	loop_111
	movre	%i4,	%l1,	%o0
loop_110:
	edge8ln	%o7,	%i3,	%o2
	ldx	[%l7 + 0x48],	%o4
loop_111:
	udiv	%l0,	0x17AF,	%l2
	subcc	%g7,	0x002D,	%g6
	call	loop_112
	edge8ln	%i7,	%g5,	%i2
	movvc	%icc,	%i6,	%o5
	fble,a	%fcc1,	loop_113
loop_112:
	fcmple32	%f24,	%f6,	%g3
	fbge	%fcc3,	loop_114
	fornot2s	%f12,	%f17,	%f18
loop_113:
	edge8l	%l5,	%i1,	%o1
	tne	%icc,	0x2
loop_114:
	movpos	%icc,	%l6,	%i5
	flush	%l7 + 0x30
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
	fnegs	%f8,	%f16
	tpos	%icc,	0x4
	bcc,pn	%xcc,	loop_115
	addccc	%l4,	%i0,	%g2
	ba,a,pn	%icc,	loop_116
	movrgez	%o6,	%g1,	%g4
loop_115:
	fmovsl	%xcc,	%f5,	%f25
	tneg	%xcc,	0x4
loop_116:
	brz,a	%o3,	loop_117
	tsubcctv	%i4,	%l1,	%o0
	ta	%icc,	0x6
	bl	%xcc,	loop_118
loop_117:
	movrne	%o7,	0x302,	%o2
	fnegs	%f1,	%f1
	bgu,a	loop_119
loop_118:
	fmovdneg	%icc,	%f8,	%f26
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x18,	%f0
loop_119:
	sub	%i3,	0x0E92,	%l0
	fmul8x16	%f15,	%f18,	%f14
	mova	%xcc,	%o4,	%g7
	array16	%l2,	%i7,	%g6
	fxors	%f20,	%f28,	%f7
	fbl	%fcc1,	loop_120
	fmovrse	%i2,	%f18,	%f13
	ldstub	[%l7 + 0x65],	%g5
	fpadd16s	%f30,	%f17,	%f27
loop_120:
	array16	%o5,	%g3,	%l5
	xor	%i6,	%i1,	%l6
	fbg,a	%fcc1,	loop_121
	bl,a	loop_122
	movgu	%icc,	%o1,	%i5
	fmovdvs	%icc,	%f19,	%f21
loop_121:
	fmovrsne	%l4,	%f21,	%f30
loop_122:
	nop
	set	0x14, %o7
	stwa	%i0,	[%l7 + %o7] 0x80
	edge16n	%g2,	%o6,	%g1
	add	%l3,	%o3,	%g4
	fbule	%fcc3,	loop_123
	brgz	%l1,	loop_124
	fandnot1	%f28,	%f10,	%f2
	nop
	setx	loop_125,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_123:
	nop
	setx	loop_126,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_124:
	xnor	%o0,	%o7,	%o2
	fmovs	%f2,	%f13
loop_125:
	bpos,pt	%icc,	loop_127
loop_126:
	fpadd16s	%f15,	%f28,	%f23
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i3,	%i4
loop_127:
	movcs	%xcc,	%o4,	%l0
	movvc	%icc,	%g7,	%i7
	for	%f20,	%f20,	%f28
	fmovdvc	%xcc,	%f16,	%f1
	ldx	[%l7 + 0x18],	%l2
	fbue	%fcc1,	loop_128
	fmovdn	%icc,	%f16,	%f10
	movge	%icc,	%i2,	%g6
	fcmpd	%fcc1,	%f16,	%f16
loop_128:
	bvs,a,pn	%icc,	loop_129
	umul	%g5,	%o5,	%l5
	fbule	%fcc3,	loop_130
	prefetch	[%l7 + 0x64],	 0x2
loop_129:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%g3
loop_130:
	fmovsgu	%xcc,	%f23,	%f9
	addc	%i1,	%i6,	%l6
	std	%i4,	[%l7 + 0x70]
	srlx	%l4,	%o1,	%g2
	sir	0x1B49
	subc	%o6,	%i0,	%g1
	orcc	%l3,	0x017E,	%o3
	tvc	%xcc,	0x3
	ldd	[%l7 + 0x30],	%f18
	stbar
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x18] %asi,	%f10
	andn	%l1,	%g4,	%o7
	and	%o0,	%o2,	%i3
	ta	%xcc,	0x0
	andn	%o4,	0x1C96,	%i4
	srlx	%g7,	0x15,	%i7
	tgu	%xcc,	0x6
	fsrc1s	%f28,	%f15
	tgu	%icc,	0x7
	fbug,a	%fcc0,	loop_131
	fnot1s	%f20,	%f2
	movcs	%xcc,	%l0,	%l2
	xor	%g6,	%i2,	%o5
loop_131:
	bneg,pt	%xcc,	loop_132
	st	%f0,	[%l7 + 0x3C]
	fmovdneg	%xcc,	%f13,	%f31
	tcc	%xcc,	0x3
loop_132:
	fcmpgt16	%f22,	%f8,	%g5
	fxnor	%f18,	%f2,	%f18
	ldd	[%l7 + 0x50],	%f14
	movne	%icc,	%l5,	%g3
	array32	%i1,	%i6,	%l6
	orn	%l4,	%o1,	%i5
	edge16n	%o6,	%i0,	%g2
	ble,pn	%icc,	loop_133
	movcs	%xcc,	%g1,	%l3
	sth	%o3,	[%l7 + 0x3A]
	movle	%xcc,	%l1,	%o7
loop_133:
	st	%f27,	[%l7 + 0x78]
	srax	%g4,	%o0,	%o2
	set	0x25, %g4
	ldstuba	[%l7 + %g4] 0x80,	%o4
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	udivx	%i4,	0x1A2A,	%g7
	addccc	%i7,	0x0C71,	%l0
	mulscc	%i3,	%l2,	%i2
	wr	%g0,	0x80,	%asi
	stwa	%o5,	[%l7 + 0x50] %asi
	edge16l	%g6,	%g5,	%l5
	tgu	%xcc,	0x4
	movvs	%xcc,	%g3,	%i1
	tge	%xcc,	0x2
	movne	%xcc,	%i6,	%l6
	fmovdne	%xcc,	%f31,	%f4
	movrlz	%o1,	0x135,	%l4
	srax	%i5,	0x10,	%i0
	tsubcc	%o6,	%g1,	%l3
	ldub	[%l7 + 0x71],	%o3
	subc	%l1,	0x0BA1,	%o7
	addccc	%g2,	%o0,	%o2
	tg	%icc,	0x6
	addccc	%g4,	%o4,	%i4
	tcc	%xcc,	0x0
	tle	%xcc,	0x2
	xnor	%g7,	0x0EE3,	%l0
	fpsub16	%f16,	%f30,	%f20
	edge32l	%i7,	%i3,	%i2
	fcmpeq16	%f16,	%f12,	%l2
	fpadd32	%f10,	%f2,	%f12
	fba	%fcc2,	loop_134
	movcs	%icc,	%g6,	%g5
	smulcc	%o5,	%g3,	%i1
	ldsh	[%l7 + 0x6C],	%l5
loop_134:
	edge32	%i6,	%o1,	%l6
	sll	%i5,	0x1B,	%i0
	fsrc2	%f12,	%f4
	add	%l4,	0x084A,	%g1
	sdiv	%l3,	0x007D,	%o3
	addcc	%o6,	%l1,	%g2
	bvc	%icc,	loop_135
	umul	%o7,	0x0E75,	%o0
	ldub	[%l7 + 0x27],	%g4
	set	0x17, %o2
	stba	%o2,	[%l7 + %o2] 0x81
loop_135:
	alignaddrl	%o4,	%i4,	%l0
	prefetch	[%l7 + 0x1C],	 0x2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x1C] %asi,	%f15
	ble,a	%icc,	loop_136
	fxor	%f12,	%f24,	%f18
	tsubcc	%i7,	0x098D,	%g7
	tl	%xcc,	0x5
loop_136:
	nop
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f16
	fmovse	%icc,	%f28,	%f30
	nop
	setx loop_137, %l0, %l1
	jmpl %l1, %i3
	bcc,a	loop_138
	andncc	%l2,	%g6,	%i2
	set	0x48, %o3
	stda	%o4,	[%l7 + %o3] 0xea
	membar	#Sync
loop_137:
	srlx	%g5,	%i1,	%l5
loop_138:
	sdivcc	%g3,	0x103C,	%i6
	movgu	%icc,	%l6,	%i5
	std	%i0,	[%l7 + 0x58]
	or	%o1,	0x0F15,	%g1
	fandnot2s	%f18,	%f24,	%f0
	fmovdl	%icc,	%f5,	%f9
	brnz,a	%l3,	loop_139
	fcmpgt16	%f24,	%f8,	%l4
	tn	%icc,	0x3
	edge32l	%o6,	%o3,	%l1
loop_139:
	bcc,pt	%xcc,	loop_140
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f24,	%f2
	edge16l	%g2,	%o0,	%o7
loop_140:
	bg,a	loop_141
	edge8ln	%g4,	%o2,	%i4
	srax	%o4,	%l0,	%g7
	fsrc2	%f8,	%f0
loop_141:
	sra	%i7,	%l2,	%g6
	fors	%f28,	%f8,	%f25
	popc	0x13A5,	%i2
	edge16l	%i3,	%g5,	%i1
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x18,	%f0
	tpos	%icc,	0x5
	fmovsgu	%icc,	%f13,	%f1
	xnorcc	%l5,	%g3,	%o5
	bneg,a,pn	%xcc,	loop_142
	ta	%xcc,	0x6
	xor	%l6,	%i5,	%i0
	ba	loop_143
loop_142:
	umulcc	%o1,	%i6,	%g1
	edge32n	%l4,	%l3,	%o6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%o3
loop_143:
	tcs	%xcc,	0x7
	fba	%fcc2,	loop_144
	fbe,a	%fcc0,	loop_145
	sir	0x0390
	ble	loop_146
loop_144:
	orn	%g2,	%o0,	%l1
loop_145:
	fmul8x16	%f7,	%f8,	%f0
	membar	0x47
loop_146:
	fpsub32	%f0,	%f14,	%f12
	ldsh	[%l7 + 0x26],	%g4
	fpackfix	%f6,	%f11
	prefetch	[%l7 + 0x6C],	 0x1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%o7
	mova	%xcc,	%o2,	%i4
	lduw	[%l7 + 0x20],	%l0
	ldd	[%l7 + 0x78],	%f6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%o4
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf1
	membar	#Sync
	srl	%i7,	%g7,	%l2
	tpos	%xcc,	0x1
	edge32	%g6,	%i2,	%i3
	subcc	%g5,	%i1,	%l5
	bvs,a,pn	%xcc,	loop_147
	movrgz	%g3,	0x369,	%o5
	set	0x64, %l6
	lduha	[%l7 + %l6] 0x0c,	%l6
loop_147:
	movcs	%icc,	%i5,	%i0
	umulcc	%i6,	%g1,	%o1
	tneg	%xcc,	0x7
	edge16ln	%l4,	%o6,	%l3
	ba,a	%icc,	loop_148
	fbe,a	%fcc1,	loop_149
	membar	0x15
	fnot2s	%f27,	%f7
loop_148:
	movleu	%xcc,	%g2,	%o0
loop_149:
	nop
	wr	%g0,	0x2b,	%asi
	stha	%o3,	[%l7 + 0x38] %asi
	membar	#Sync
	movneg	%icc,	%l1,	%g4
	edge32ln	%o7,	%o2,	%i4
	orcc	%o4,	0x0BAE,	%i7
	movcc	%xcc,	%l0,	%l2
	edge8l	%g6,	%g7,	%i3
	faligndata	%f18,	%f6,	%f8
	ta	%xcc,	0x4
	fpsub16s	%f23,	%f6,	%f15
	tvc	%xcc,	0x4
	movcs	%xcc,	%g5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l5,	%i2
	ba,a,pt	%xcc,	loop_150
	edge16l	%o5,	%g3,	%i5
	membar	0x74
	fnot2s	%f28,	%f25
loop_150:
	stw	%l6,	[%l7 + 0x14]
	array32	%i6,	%g1,	%o1
	andcc	%l4,	%i0,	%l3
	brgez,a	%g2,	loop_151
	st	%f16,	[%l7 + 0x40]
	subccc	%o6,	%o0,	%l1
	movrgez	%o3,	0x1B2,	%o7
loop_151:
	fmovdvc	%xcc,	%f2,	%f2
	set	0x2B, %i4
	stba	%g4,	[%l7 + %i4] 0x10
	tsubcctv	%o2,	%o4,	%i7
	set	0x28, %i7
	swapa	[%l7 + %i7] 0x81,	%l0
	sdivx	%i4,	0x1449,	%l2
	mova	%xcc,	%g6,	%i3
	mulx	%g5,	%i1,	%l5
	movge	%icc,	%g7,	%i2
	fbul,a	%fcc0,	loop_152
	fmovscc	%icc,	%f12,	%f21
	ldx	[%l7 + 0x68],	%g3
	fbug	%fcc2,	loop_153
loop_152:
	array8	%o5,	%i5,	%l6
	fmovsl	%xcc,	%f7,	%f4
	addc	%i6,	%g1,	%o1
loop_153:
	movcc	%icc,	%l4,	%l3
	stb	%i0,	[%l7 + 0x0A]
	tneg	%xcc,	0x7
	srl	%g2,	%o0,	%o6
	srl	%l1,	0x05,	%o3
	or	%o7,	0x1F8C,	%g4
	fones	%f15
	fbo,a	%fcc0,	loop_154
	movre	%o2,	0x1B2,	%i7
	udivcc	%l0,	0x15B3,	%o4
	andn	%i4,	%l2,	%i3
loop_154:
	nop
	wr	%g0,	0x2b,	%asi
	stwa	%g6,	[%l7 + 0x4C] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g5,	%i1,	%g7
	brgz,a	%l5,	loop_155
	srax	%g3,	%i2,	%o5
	set	0x1A, %o0
	stba	%i5,	[%l7 + %o0] 0x81
loop_155:
	mulscc	%l6,	%i6,	%o1
	edge16	%l4,	%l3,	%g1
	subcc	%g2,	%i0,	%o6
	fbug	%fcc0,	loop_156
	fmovrsne	%o0,	%f4,	%f18
	ble,a	loop_157
	fble,a	%fcc2,	loop_158
loop_156:
	sir	0x1FD5
	taddcctv	%l1,	0x06D0,	%o7
loop_157:
	edge8l	%o3,	%g4,	%i7
loop_158:
	membar	0x20
	movrlz	%o2,	%l0,	%o4
	edge16l	%l2,	%i3,	%g6
	tpos	%icc,	0x0
	subc	%i4,	0x1A63,	%i1
	fmovrse	%g7,	%f19,	%f8
	fbg	%fcc3,	loop_159
	movrgez	%g5,	0x336,	%g3
	fsrc2s	%f1,	%f28
	fsrc2	%f16,	%f8
loop_159:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i2,	0x1D9A,	%l5
	fxor	%f20,	%f6,	%f16
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%o5
	sdivx	%l6,	0x097F,	%i6
	bgu	%icc,	loop_160
	fmovrdgez	%l4,	%f10,	%f16
	tleu	%icc,	0x1
	fmovdle	%xcc,	%f16,	%f27
loop_160:
	movn	%icc,	%o1,	%g1
	sra	%g2,	0x18,	%i0
	sll	%o6,	%o0,	%l1
	tgu	%icc,	0x6
	movn	%icc,	%l3,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g4,	%i7
	movn	%icc,	%o2,	%l0
	smulcc	%o3,	0x050D,	%o4
	fmovdcs	%icc,	%f13,	%f28
	xorcc	%l2,	0x18F7,	%g6
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x89,	%i2
	sra	%i1,	%g7,	%i4
	srlx	%g3,	0x09,	%i2
	tl	%xcc,	0x7
	movgu	%icc,	%l5,	%i5
	bvc,a,pn	%xcc,	loop_161
	te	%icc,	0x5
	movvs	%icc,	%g5,	%l6
	andncc	%i6,	%o5,	%o1
loop_161:
	ldsw	[%l7 + 0x40],	%g1
	edge16	%g2,	%l4,	%i0
	fmovrsgez	%o6,	%f7,	%f28
	fmovscs	%icc,	%f29,	%f9
	fmovrse	%o0,	%f3,	%f19
	add	%l3,	0x0AD1,	%l1
	movrgez	%g4,	0x04F,	%o7
	tsubcctv	%o2,	0x022C,	%l0
	xor	%o3,	0x1A4C,	%i7
	edge32n	%l2,	%g6,	%o4
	sdivx	%i1,	0x1709,	%g7
	fmovdvs	%xcc,	%f27,	%f22
	fmovsle	%xcc,	%f25,	%f22
	fmovsgu	%icc,	%f5,	%f4
	sdiv	%i4,	0x1CB3,	%g3
	fabsd	%f14,	%f28
	fcmpeq16	%f4,	%f4,	%i3
	fbule	%fcc1,	loop_162
	edge32l	%i2,	%i5,	%g5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x64] %asi,	%l5
loop_162:
	add	%l6,	%o5,	%i6
	ba,pn	%icc,	loop_163
	orn	%o1,	%g1,	%g2
	subc	%i0,	%l4,	%o0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x20] %asi,	%l3
loop_163:
	addccc	%o6,	%g4,	%o7
	set	0x1F, %g1
	ldsba	[%l7 + %g1] 0x18,	%l1
	movvc	%icc,	%o2,	%o3
	fabsd	%f8,	%f6
	fbl	%fcc0,	loop_164
	umulcc	%i7,	%l2,	%g6
	movrne	%l0,	%i1,	%o4
	fabsd	%f0,	%f18
loop_164:
	andncc	%i4,	%g3,	%g7
	stb	%i3,	[%l7 + 0x1A]
	wr	%g0,	0x2f,	%asi
	stda	%i2,	[%l7 + 0x10] %asi
	membar	#Sync
	fsrc1s	%f6,	%f20
	edge32l	%i5,	%g5,	%l5
	movrlez	%l6,	%o5,	%o1
	movg	%icc,	%g1,	%g2
	fpmerge	%f14,	%f14,	%f30
	sra	%i0,	0x1D,	%l4
	fmovrse	%o0,	%f25,	%f12
	call	loop_165
	bpos	loop_166
	edge8	%l3,	%i6,	%g4
	srax	%o7,	%l1,	%o2
loop_165:
	udivx	%o6,	0x1280,	%o3
loop_166:
	fmovs	%f29,	%f13
	bl,pn	%icc,	loop_167
	add	%i7,	0x10C4,	%g6
	sdivx	%l2,	0x17EF,	%l0
	ldsw	[%l7 + 0x1C],	%i1
loop_167:
	fmovdn	%xcc,	%f13,	%f28
	edge16l	%o4,	%g3,	%i4
	sir	0x1105
	fnot1	%f0,	%f4
	mulscc	%g7,	0x1FDF,	%i2
	movge	%xcc,	%i5,	%i3
	fsrc1	%f8,	%f0
	prefetch	[%l7 + 0x38],	 0x1
	fmovsleu	%xcc,	%f1,	%f20
	ldstub	[%l7 + 0x6E],	%g5
	sra	%l6,	0x1D,	%l5
	movrgz	%o1,	%g1,	%o5
	fcmpeq16	%f16,	%f8,	%g2
	set	0x28, %g2
	ldsha	[%l7 + %g2] 0x14,	%i0
	and	%o0,	0x0B98,	%l3
	wr	%g0,	0x11,	%asi
	sta	%f17,	[%l7 + 0x0C] %asi
	edge8ln	%i6,	%l4,	%o7
	wr	%g0,	0x27,	%asi
	stba	%g4,	[%l7 + 0x0B] %asi
	membar	#Sync
	fcmpes	%fcc1,	%f25,	%f7
	fmovrslz	%o2,	%f0,	%f1
	edge32	%l1,	%o6,	%o3
	addc	%g6,	%l2,	%l0
	movre	%i1,	%i7,	%o4
	ldsh	[%l7 + 0x0C],	%i4
	move	%xcc,	%g3,	%g7
	ld	[%l7 + 0x38],	%f5
	udivx	%i2,	0x00BF,	%i5
	fcmple32	%f2,	%f22,	%g5
	fbge,a	%fcc1,	loop_168
	ba,a,pn	%xcc,	loop_169
	array16	%i3,	%l5,	%o1
	tsubcctv	%l6,	%g1,	%o5
loop_168:
	edge32ln	%g2,	%o0,	%l3
loop_169:
	tsubcc	%i0,	0x0AB7,	%i6
	membar	0x7F
	fmovsge	%xcc,	%f9,	%f7
	fbul,a	%fcc3,	loop_170
	sra	%o7,	%l4,	%o2
	mulx	%g4,	0x16BD,	%l1
	fmovdle	%xcc,	%f24,	%f23
loop_170:
	fmovrslz	%o3,	%f13,	%f27
	addccc	%g6,	%o6,	%l2
	movn	%icc,	%l0,	%i7
	fcmpeq32	%f6,	%f26,	%o4
	fpsub16	%f28,	%f10,	%f28
	sdivx	%i1,	0x0F95,	%i4
	edge16ln	%g3,	%i2,	%g7
	andcc	%i5,	0x1E65,	%i3
	fmovrdlz	%l5,	%f28,	%f14
	fpsub16	%f0,	%f18,	%f16
	fzeros	%f30
	fmovdvs	%icc,	%f0,	%f8
	faligndata	%f20,	%f26,	%f16
	fmovrslez	%o1,	%f25,	%f10
	bgu,pn	%icc,	loop_171
	tsubcctv	%g5,	0x03CB,	%l6
	movrgez	%g1,	%o5,	%g2
	ble,pt	%xcc,	loop_172
loop_171:
	movneg	%xcc,	%l3,	%i0
	udivcc	%i6,	0x184A,	%o0
	tl	%icc,	0x3
loop_172:
	call	loop_173
	fble,a	%fcc2,	loop_174
	fcmpgt16	%f8,	%f18,	%o7
	edge16	%l4,	%g4,	%l1
loop_173:
	move	%xcc,	%o3,	%o2
loop_174:
	nop
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x11,	%g6
	bg,a	loop_175
	membar	0x51
	orn	%o6,	0x0842,	%l2
	st	%f28,	[%l7 + 0x44]
loop_175:
	udivx	%l0,	0x16FB,	%i7
	edge32ln	%o4,	%i4,	%g3
	andn	%i2,	0x10C6,	%i1
	sll	%g7,	%i5,	%i3
	membar	0x7A
	fmovda	%icc,	%f9,	%f19
	fmovd	%f18,	%f6
	umulcc	%o1,	0x161A,	%g5
	movrlz	%l6,	0x07C,	%l5
	fnors	%f23,	%f31,	%f28
	fornot1	%f10,	%f12,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x5
	tsubcc	%g1,	%o5,	%l3
	tsubcc	%i0,	0x0257,	%i6
	bg,pn	%icc,	loop_176
	udiv	%o0,	0x09D7,	%g2
	fmul8x16au	%f30,	%f23,	%f4
	sth	%o7,	[%l7 + 0x54]
loop_176:
	tvs	%icc,	0x4
	bcc,a	%icc,	loop_177
	movcs	%xcc,	%g4,	%l4
	fcmpne32	%f30,	%f26,	%o3
	std	%f30,	[%l7 + 0x10]
loop_177:
	fxnors	%f3,	%f10,	%f28
	set	0x22, %g5
	ldsba	[%l7 + %g5] 0x04,	%l1
	fmovrdne	%o2,	%f30,	%f14
	movle	%xcc,	%g6,	%o6
	subc	%l2,	0x069E,	%l0
	tcc	%icc,	0x5
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x19
	lduh	[%l7 + 0x6A],	%i7
	bleu	%icc,	loop_178
	fbge,a	%fcc2,	loop_179
	movvs	%xcc,	%i4,	%g3
	orcc	%o4,	%i1,	%i2
loop_178:
	fpmerge	%f23,	%f30,	%f24
loop_179:
	brnz,a	%i5,	loop_180
	movre	%i3,	%g7,	%g5
	bcs,pt	%xcc,	loop_181
	umulcc	%o1,	0x0598,	%l5
loop_180:
	fzeros	%f26
	xnorcc	%g1,	%o5,	%l6
loop_181:
	umulcc	%l3,	0x17D5,	%i6
	addccc	%i0,	0x1945,	%g2
	movgu	%icc,	%o0,	%o7
	andn	%l4,	0x134C,	%g4
	sdivx	%o3,	0x046B,	%o2
	mova	%icc,	%g6,	%o6
	alignaddr	%l1,	%l2,	%l0
	sdivx	%i4,	0x0461,	%g3
	ldsw	[%l7 + 0x20],	%i7
	movvc	%xcc,	%o4,	%i2
	fpadd32s	%f14,	%f27,	%f8
	smul	%i5,	%i1,	%i3
	wr	%g0,	0xe3,	%asi
	stwa	%g5,	[%l7 + 0x58] %asi
	membar	#Sync
	edge16n	%g7,	%l5,	%g1
	movvc	%icc,	%o1,	%o5
	fmovdg	%icc,	%f26,	%f22
	edge16n	%l6,	%l3,	%i6
	edge16n	%g2,	%i0,	%o0
	siam	0x7
	membar	0x16
	alignaddrl	%o7,	%g4,	%l4
	bshuffle	%f18,	%f30,	%f4
	fmovs	%f4,	%f25
	umul	%o3,	%g6,	%o2
	fmovdcc	%icc,	%f24,	%f8
	std	%l0,	[%l7 + 0x78]
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x60] %asi,	%l2
	te	%xcc,	0x1
	edge8l	%l0,	%o6,	%i4
	andn	%i7,	0x0593,	%g3
	fcmpgt32	%f24,	%f24,	%i2
	sethi	0x0DC1,	%o4
	popc	%i5,	%i3
	movle	%icc,	%i1,	%g7
	movn	%xcc,	%g5,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o1,	%o5,	%l6
	udivcc	%l3,	0x1E49,	%l5
	fcmpgt32	%f28,	%f24,	%i6
	orncc	%g2,	0x0F31,	%o0
	fbne	%fcc3,	loop_182
	tvs	%xcc,	0x2
	sethi	0x0E75,	%i0
	movrne	%o7,	0x336,	%g4
loop_182:
	fbne	%fcc2,	loop_183
	tg	%xcc,	0x7
	edge32n	%o3,	%g6,	%l4
	edge32ln	%o2,	%l2,	%l1
loop_183:
	ble,a,pt	%icc,	loop_184
	array16	%o6,	%i4,	%l0
	tcc	%icc,	0x5
	fmovdgu	%xcc,	%f23,	%f31
loop_184:
	fpsub16s	%f0,	%f4,	%f19
	bcs,a,pn	%icc,	loop_185
	bvc,a	%xcc,	loop_186
	taddcc	%i7,	%g3,	%o4
	mulx	%i2,	0x00D7,	%i5
loop_185:
	edge32	%i1,	%i3,	%g5
loop_186:
	edge16ln	%g1,	%o1,	%g7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o5,	%l3
	fcmple32	%f26,	%f2,	%l5
	wr	%g0,	0x80,	%asi
	stwa	%i6,	[%l7 + 0x24] %asi
	fmovdg	%xcc,	%f17,	%f4
	sth	%g2,	[%l7 + 0x60]
	movle	%icc,	%o0,	%i0
	fabss	%f11,	%f28
	movvc	%xcc,	%l6,	%g4
	nop
	setx	loop_187,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne,pt	%icc,	loop_188
	bge,a,pt	%xcc,	loop_189
	movcs	%icc,	%o3,	%o7
loop_187:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%l4
loop_188:
	fmul8x16al	%f13,	%f16,	%f6
loop_189:
	andncc	%l2,	%o2,	%o6
	movg	%xcc,	%l1,	%l0
	fnand	%f20,	%f12,	%f12
	umul	%i4,	%i7,	%o4
	taddcctv	%g3,	0x0479,	%i5
	bneg,a	loop_190
	fmovdl	%icc,	%f31,	%f4
	fbe	%fcc2,	loop_191
	fblg,a	%fcc3,	loop_192
loop_190:
	edge32ln	%i2,	%i3,	%i1
	brgez,a	%g5,	loop_193
loop_191:
	nop
	set	0x4C, %o1
	stw	%o1,	[%l7 + %o1]
loop_192:
	bneg,a	%icc,	loop_194
	fbl,a	%fcc3,	loop_195
loop_193:
	sdiv	%g7,	0x0C97,	%g1
	srax	%l3,	%l5,	%o5
loop_194:
	fmuld8ulx16	%f18,	%f9,	%f18
loop_195:
	lduw	[%l7 + 0x5C],	%i6
	sub	%g2,	0x0F39,	%o0
	srlx	%l6,	0x1A,	%i0
	tne	%xcc,	0x3
	fmovsg	%icc,	%f25,	%f16
	add	%o3,	0x040D,	%o7
	taddcc	%g6,	%g4,	%l4
	fpsub32s	%f29,	%f27,	%f16
	andn	%o2,	%l2,	%o6
	array16	%l1,	%l0,	%i4
	array8	%o4,	%i7,	%i5
	edge32l	%i2,	%i3,	%i1
	edge16n	%g5,	%g3,	%o1
	fors	%f3,	%f7,	%f13
	fmovdge	%xcc,	%f27,	%f21
	tgu	%icc,	0x3
	array16	%g7,	%l3,	%g1
	ba,a,pn	%icc,	loop_196
	fmovspos	%xcc,	%f21,	%f13
	set	0x38, %i2
	lduwa	[%l7 + %i2] 0x18,	%l5
loop_196:
	taddcctv	%o5,	0x0999,	%i6
	edge16l	%g2,	%o0,	%l6
	sth	%o3,	[%l7 + 0x16]
	bcc,a	%xcc,	loop_197
	srl	%i0,	%o7,	%g6
	movrlez	%l4,	0x324,	%g4
	movl	%icc,	%o2,	%l2
loop_197:
	tgu	%xcc,	0x1
	nop
	setx	loop_198,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsleu	%icc,	%f17,	%f2
	movge	%icc,	%l1,	%o6
	movre	%l0,	0x27E,	%o4
loop_198:
	movne	%icc,	%i4,	%i5
	prefetch	[%l7 + 0x48],	 0x2
	edge8	%i2,	%i7,	%i1
	fsrc1	%f4,	%f30
	addc	%g5,	0x0F85,	%g3
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x14
	edge32l	%o1,	%i3,	%l3
	be	%xcc,	loop_199
	ldsw	[%l7 + 0x6C],	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l5,	0x16D3,	%o5
loop_199:
	brlez,a	%g7,	loop_200
	fornot1	%f8,	%f6,	%f2
	bcs	%xcc,	loop_201
	movcs	%icc,	%i6,	%o0
loop_200:
	srax	%l6,	%o3,	%i0
	sethi	0x086D,	%o7
loop_201:
	movre	%g2,	0x070,	%g6
	umulcc	%l4,	%o2,	%g4
	fbue	%fcc1,	loop_202
	tg	%icc,	0x4
	fblg,a	%fcc2,	loop_203
	subcc	%l1,	0x1806,	%l2
loop_202:
	umul	%o6,	%o4,	%i4
	alignaddrl	%i5,	%l0,	%i2
loop_203:
	edge16ln	%i1,	%i7,	%g5
	tge	%icc,	0x2
	fbe	%fcc2,	loop_204
	fcmple32	%f0,	%f2,	%g3
	umul	%o1,	%i3,	%l3
	tcc	%xcc,	0x2
loop_204:
	srl	%l5,	0x1C,	%g1
	sub	%g7,	0x036B,	%o5
	fpadd16s	%f1,	%f28,	%f25
	or	%o0,	%i6,	%l6
	tl	%xcc,	0x4
	alignaddr	%o3,	%i0,	%o7
	taddcctv	%g6,	%g2,	%l4
	orcc	%g4,	0x1B8E,	%l1
	fornot1s	%f3,	%f10,	%f1
	tge	%xcc,	0x1
	fpack32	%f26,	%f24,	%f6
	sethi	0x1BD9,	%o2
	fxnor	%f28,	%f4,	%f6
	bg,a	loop_205
	orncc	%l2,	0x1E58,	%o6
	subcc	%o4,	0x1164,	%i5
	tvc	%icc,	0x0
loop_205:
	fmovsvc	%icc,	%f10,	%f18
	fpsub16s	%f16,	%f11,	%f21
	edge8n	%i4,	%i2,	%i1
	smulcc	%i7,	0x18B7,	%l0
	nop
	set	0x70, %i6
	lduw	[%l7 + %i6],	%g5
	fmovsl	%xcc,	%f11,	%f0
	nop
	setx loop_206, %l0, %l1
	jmpl %l1, %o1
	tle	%xcc,	0x5
	popc	%i3,	%g3
	fmovdneg	%icc,	%f7,	%f25
loop_206:
	fcmpeq16	%f10,	%f10,	%l5
	addccc	%g1,	%l3,	%g7
	udivcc	%o5,	0x1CA1,	%o0
	fxors	%f13,	%f16,	%f11
	srlx	%i6,	0x08,	%l6
	tvc	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	sta	%f19,	[%l7 + 0x1C] %asi
	fmovdcc	%xcc,	%f27,	%f1
	xorcc	%o3,	%o7,	%i0
	edge32ln	%g6,	%g2,	%g4
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%l0
	fbug,a	%fcc1,	loop_207
	mova	%xcc,	%l4,	%o2
	std	%l2,	[%l7 + 0x18]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_207:
	fmovsleu	%xcc,	%f31,	%f29
	sll	%o6,	%o4,	%i5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i4
	bg	loop_208
	addc	%i7,	%l0,	%i1
	fmovsle	%xcc,	%f20,	%f22
	addccc	%o1,	%i3,	%g5
loop_208:
	tle	%xcc,	0x2
	fbg,a	%fcc0,	loop_209
	taddcctv	%l5,	%g3,	%l3
	tvc	%xcc,	0x0
	tpos	%xcc,	0x1
loop_209:
	movre	%g1,	0x19D,	%o5
	udivcc	%g7,	0x1F78,	%i6
	fones	%f28
	bcc	loop_210
	for	%f4,	%f26,	%f2
	edge32ln	%o0,	%o3,	%o7
	stx	%l6,	[%l7 + 0x58]
loop_210:
	edge8	%i0,	%g2,	%g6
	bne,a,pn	%xcc,	loop_211
	fmovdcs	%xcc,	%f20,	%f28
	fmovrdne	%g4,	%f4,	%f0
	set	0x70, %l3
	stda	%l0,	[%l7 + %l3] 0xeb
	membar	#Sync
loop_211:
	orncc	%l4,	0x125D,	%l2
	fmovdvc	%icc,	%f20,	%f15
	tne	%icc,	0x4
	tl	%icc,	0x6
	fxors	%f10,	%f15,	%f17
	movrgz	%o6,	%o2,	%o4
	andncc	%i2,	%i5,	%i7
	and	%i4,	%i1,	%l0
	alignaddr	%i3,	%g5,	%l5
	fmovrslez	%o1,	%f11,	%f28
	sdivx	%g3,	0x0312,	%g1
	fmovrslz	%l3,	%f21,	%f13
	tgu	%xcc,	0x1
	movpos	%icc,	%g7,	%i6
	tsubcctv	%o0,	%o5,	%o7
	movgu	%xcc,	%l6,	%i0
	membar	0x04
	array32	%g2,	%g6,	%o3
	tpos	%icc,	0x1
	fnot2s	%f8,	%f20
	sra	%l1,	%g4,	%l4
	tleu	%icc,	0x2
	ld	[%l7 + 0x54],	%f4
	mulx	%o6,	%o2,	%o4
	edge8ln	%i2,	%i5,	%i7
	udivcc	%i4,	0x156F,	%l2
	sir	0x0448
	membar	0x4A
	fmovse	%xcc,	%f30,	%f0
	edge32n	%i1,	%i3,	%g5
	fmovscc	%icc,	%f29,	%f20
	fbne,a	%fcc3,	loop_212
	fnot1	%f2,	%f14
	alignaddr	%l5,	%o1,	%l0
	ble,a,pn	%xcc,	loop_213
loop_212:
	edge8l	%g3,	%g1,	%l3
	srlx	%g7,	0x1B,	%i6
	fmovdpos	%xcc,	%f19,	%f21
loop_213:
	fxnor	%f18,	%f12,	%f2
	tleu	%xcc,	0x0
	sethi	0x1174,	%o5
	edge8l	%o0,	%o7,	%l6
	brgz	%g2,	loop_214
	bcs,a	%icc,	loop_215
	pdist	%f12,	%f8,	%f18
	movg	%icc,	%i0,	%g6
loop_214:
	movgu	%icc,	%l1,	%g4
loop_215:
	movpos	%xcc,	%o3,	%l4
	movge	%icc,	%o6,	%o2
	sir	0x1AC4
	tneg	%xcc,	0x0
	edge8	%i2,	%i5,	%i7
	brnz	%o4,	loop_216
	srlx	%i4,	0x00,	%i1
	movrgez	%i3,	0x090,	%g5
	fabss	%f31,	%f1
loop_216:
	edge32ln	%l2,	%o1,	%l0
	movcc	%xcc,	%g3,	%l5
	bn	loop_217
	edge16	%l3,	%g7,	%g1
	andncc	%i6,	%o0,	%o5
	bl	loop_218
loop_217:
	fbuge	%fcc3,	loop_219
	lduw	[%l7 + 0x38],	%l6
	tcc	%icc,	0x2
loop_218:
	movne	%xcc,	%g2,	%o7
loop_219:
	bvc,pt	%xcc,	loop_220
	move	%icc,	%i0,	%g6
	fbg,a	%fcc2,	loop_221
	movn	%icc,	%l1,	%g4
loop_220:
	fbe	%fcc0,	loop_222
	bvs,pn	%xcc,	loop_223
loop_221:
	fmovsl	%xcc,	%f7,	%f24
	edge32n	%l4,	%o6,	%o3
loop_222:
	sdivx	%i2,	0x03FB,	%o2
loop_223:
	fbue,a	%fcc2,	loop_224
	xnor	%i7,	%i5,	%i4
	nop
	set	0x41, %i3
	ldub	[%l7 + %i3],	%o4
	movn	%xcc,	%i1,	%g5
loop_224:
	alignaddr	%l2,	%o1,	%i3
	umul	%g3,	%l0,	%l5
	orn	%g7,	%l3,	%i6
	xnorcc	%g1,	%o0,	%o5
	brgez,a	%l6,	loop_225
	bshuffle	%f18,	%f28,	%f24
	fcmped	%fcc0,	%f16,	%f24
	addccc	%g2,	%i0,	%o7
loop_225:
	sll	%g6,	0x07,	%l1
	fmovspos	%icc,	%f11,	%f0
	edge32ln	%l4,	%o6,	%o3
	fmul8x16al	%f24,	%f19,	%f26
	fabsd	%f22,	%f22
	srl	%i2,	0x11,	%g4
	fabss	%f30,	%f25
	fandnot2	%f10,	%f6,	%f24
	set	0x48, %o6
	stxa	%o2,	[%l7 + %o6] 0x2f
	membar	#Sync
	edge32n	%i7,	%i5,	%o4
	fnot2	%f14,	%f10
	tsubcctv	%i1,	%i4,	%l2
	addccc	%g5,	%i3,	%g3
	sethi	0x0432,	%l0
	movvs	%icc,	%o1,	%g7
	fmovsvc	%icc,	%f9,	%f8
	sethi	0x0F31,	%l3
	fbge,a	%fcc0,	loop_226
	edge32ln	%i6,	%g1,	%o0
	mova	%icc,	%o5,	%l5
	movne	%icc,	%g2,	%i0
loop_226:
	fpadd32s	%f4,	%f24,	%f9
	sdiv	%l6,	0x0957,	%g6
	tn	%xcc,	0x6
	movvc	%xcc,	%l1,	%o7
	movgu	%xcc,	%l4,	%o6
	add	%i2,	0x1C2F,	%o3
	ldsh	[%l7 + 0x64],	%o2
	fsrc2	%f18,	%f8
	edge8	%g4,	%i5,	%i7
	movle	%xcc,	%o4,	%i1
	movcc	%icc,	%i4,	%g5
	andcc	%l2,	%i3,	%l0
	taddcctv	%o1,	0x1C52,	%g3
	brnz	%l3,	loop_227
	andncc	%g7,	%g1,	%o0
	fpsub16	%f12,	%f10,	%f22
	fbn	%fcc0,	loop_228
loop_227:
	udiv	%i6,	0x0752,	%o5
	fmovsge	%xcc,	%f7,	%f10
	smul	%g2,	0x0A83,	%i0
loop_228:
	nop
	set	0x0C, %i5
	sta	%f31,	[%l7 + %i5] 0x0c
	alignaddrl	%l5,	%l6,	%g6
	membar	0x67
	fbul	%fcc1,	loop_229
	edge32l	%o7,	%l1,	%o6
	addc	%i2,	0x1427,	%o3
	bge,pn	%icc,	loop_230
loop_229:
	edge16n	%l4,	%o2,	%g4
	edge8n	%i5,	%o4,	%i1
	fmovda	%xcc,	%f25,	%f8
loop_230:
	brz	%i7,	loop_231
	srax	%g5,	%i4,	%i3
	sdivx	%l0,	0x0B57,	%l2
	prefetch	[%l7 + 0x0C],	 0x2
loop_231:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f24,	%f23
	and	%o1,	0x174E,	%l3
	movleu	%xcc,	%g7,	%g3
	set	0x28, %l2
	stxa	%g1,	[%l7 + %l2] 0x19
	orncc	%o0,	0x01EC,	%o5
	movcc	%icc,	%g2,	%i6
	edge32ln	%l5,	%i0,	%l6
	array32	%o7,	%g6,	%l1
	fandnot1s	%f24,	%f23,	%f10
	set	0x34, %l1
	lda	[%l7 + %l1] 0x14,	%f4
	and	%o6,	0x1762,	%o3
	movneg	%xcc,	%l4,	%i2
	ta	%icc,	0x6
	fbn	%fcc1,	loop_232
	movg	%xcc,	%g4,	%o2
	movleu	%xcc,	%o4,	%i5
	fbug,a	%fcc0,	loop_233
loop_232:
	movpos	%icc,	%i1,	%g5
	std	%i6,	[%l7 + 0x30]
	movpos	%xcc,	%i3,	%i4
loop_233:
	xor	%l2,	0x17FE,	%l0
	movl	%icc,	%o1,	%l3
	orcc	%g3,	%g1,	%g7
	fmovrslz	%o0,	%f17,	%f6
	movrgez	%o5,	%g2,	%l5
	movrlz	%i6,	%i0,	%o7
	fble	%fcc1,	loop_234
	sra	%g6,	0x12,	%l6
	movre	%o6,	0x0ED,	%l1
	mova	%xcc,	%l4,	%o3
loop_234:
	ldsw	[%l7 + 0x20],	%i2
	sdivcc	%g4,	0x171F,	%o2
	fcmpeq16	%f18,	%f28,	%i5
	andcc	%o4,	0x0BD0,	%g5
	swap	[%l7 + 0x54],	%i1
	alignaddr	%i7,	%i4,	%l2
	orncc	%i3,	%o1,	%l0
	set	0x5E, %g3
	lduha	[%l7 + %g3] 0x19,	%g3
	ldsw	[%l7 + 0x7C],	%l3
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x2b,	%g0
	movvs	%xcc,	%g7,	%o5
	wr	%g0,	0x18,	%asi
	stda	%o0,	[%l7 + 0x18] %asi
	fmovsne	%xcc,	%f6,	%f2
	ble,pn	%icc,	loop_235
	andcc	%l5,	%g2,	%i0
	tl	%icc,	0x3
	edge32l	%i6,	%g6,	%o7
loop_235:
	subc	%o6,	%l6,	%l4
	fmovs	%f25,	%f2
	lduh	[%l7 + 0x0C],	%l1
	movneg	%icc,	%i2,	%o3
	tsubcctv	%o2,	%g4,	%i5
	fcmpgt16	%f20,	%f2,	%o4
	addc	%i1,	0x1A75,	%i7
	bvs,pt	%icc,	loop_236
	fbul	%fcc2,	loop_237
	lduw	[%l7 + 0x50],	%i4
	tle	%xcc,	0x5
loop_236:
	nop
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x80,	%l2
loop_237:
	fcmpd	%fcc1,	%f12,	%f28
	fandnot1s	%f3,	%f8,	%f2
	fmovsg	%icc,	%f7,	%f13
	sdivx	%i3,	0x1834,	%o1
	fsrc2	%f22,	%f16
	sra	%l0,	0x0D,	%g3
	array8	%g5,	%l3,	%g1
	subcc	%g7,	%o0,	%l5
	st	%f31,	[%l7 + 0x34]
	mova	%icc,	%g2,	%o5
	lduh	[%l7 + 0x3E],	%i0
	tn	%xcc,	0x3
	sdivcc	%g6,	0x1BB8,	%o7
	lduh	[%l7 + 0x12],	%o6
	fpsub16	%f4,	%f6,	%f22
	set	0x2C, %l5
	sta	%f21,	[%l7 + %l5] 0x89
	taddcctv	%i6,	%l6,	%l4
	mulscc	%l1,	0x1FA2,	%o3
	membar	0x22
	sra	%i2,	0x0C,	%o2
	movn	%icc,	%i5,	%o4
	tleu	%xcc,	0x6
	ldx	[%l7 + 0x40],	%i1
	fmovrdlez	%i7,	%f2,	%f30
	edge16	%g4,	%i4,	%i3
	fbu	%fcc0,	loop_238
	edge8ln	%l2,	%l0,	%o1
	movne	%xcc,	%g3,	%l3
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x2c,	%g4
loop_238:
	tvc	%xcc,	0x1
	movleu	%xcc,	%g1,	%g7
	fsrc1s	%f2,	%f11
	movpos	%icc,	%o0,	%l5
	fexpand	%f7,	%f10
	edge32ln	%o5,	%g2,	%i0
	fandnot2	%f2,	%f0,	%f10
	tgu	%icc,	0x2
	fmovsneg	%xcc,	%f30,	%f10
	xor	%g6,	0x19E6,	%o6
	edge8	%i6,	%l6,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o7,	%l1
	edge16	%o3,	%o2,	%i5
	tvc	%xcc,	0x3
	orn	%o4,	%i1,	%i7
	lduw	[%l7 + 0x40],	%g4
	xor	%i4,	%i2,	%i3
	tleu	%xcc,	0x6
	tgu	%icc,	0x5
	fxnor	%f4,	%f26,	%f28
	fbul	%fcc2,	loop_239
	fbne	%fcc1,	loop_240
	tg	%icc,	0x4
	mulscc	%l2,	%o1,	%g3
loop_239:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x35] %asi,	%l0
loop_240:
	addcc	%l3,	%g5,	%g1
	fnor	%f22,	%f0,	%f6
	ldsh	[%l7 + 0x6E],	%g7
	ld	[%l7 + 0x58],	%f31
	movge	%xcc,	%l5,	%o5
	addc	%g2,	0x0DE1,	%o0
	array8	%i0,	%g6,	%o6
	st	%f15,	[%l7 + 0x64]
	udivcc	%l6,	0x1CCE,	%l4
	and	%o7,	0x01B9,	%i6
	tvs	%xcc,	0x5
	movn	%xcc,	%l1,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o3,	%o4
	andn	%i5,	%i7,	%g4
	xorcc	%i1,	0x1012,	%i2
	smul	%i4,	%l2,	%i3
	sir	0x1312
	tcc	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o1,	%g3,	%l3
	mulx	%l0,	0x0172,	%g1
	mulscc	%g5,	%g7,	%o5
	edge16ln	%g2,	%o0,	%l5
	subcc	%g6,	%o6,	%l6
	umul	%i0,	0x1428,	%l4
	movvs	%xcc,	%o7,	%l1
	taddcc	%o2,	0x0D5C,	%i6
	membar	0x3B
	stbar
	addcc	%o3,	%i5,	%o4
	orn	%g4,	0x10DB,	%i7
	xorcc	%i1,	%i2,	%i4
	edge16	%l2,	%i3,	%g3
	array8	%o1,	%l3,	%l0
	addccc	%g5,	0x0A48,	%g1
	bcc	%icc,	loop_241
	smul	%g7,	0x1E29,	%o5
	lduh	[%l7 + 0x4E],	%g2
	fmul8ulx16	%f24,	%f20,	%f20
loop_241:
	bl,pt	%xcc,	loop_242
	edge32n	%l5,	%g6,	%o6
	fone	%f2
	fmovsle	%xcc,	%f8,	%f17
loop_242:
	fbue,a	%fcc3,	loop_243
	tvs	%xcc,	0x1
	fmovrslz	%o0,	%f11,	%f15
	bg,pn	%icc,	loop_244
loop_243:
	fmovse	%xcc,	%f20,	%f21
	sir	0x0772
	tgu	%xcc,	0x4
loop_244:
	edge8ln	%i0,	%l4,	%l6
	fpadd16s	%f5,	%f23,	%f29
	movleu	%xcc,	%l1,	%o7
	fbl,a	%fcc3,	loop_245
	fmul8x16al	%f26,	%f17,	%f22
	bg,a,pt	%icc,	loop_246
	ld	[%l7 + 0x1C],	%f20
loop_245:
	fnot1	%f4,	%f8
	fxor	%f20,	%f22,	%f12
loop_246:
	fmovrslz	%i6,	%f27,	%f2
	xor	%o3,	%i5,	%o2
	movl	%icc,	%o4,	%i7
	set	0x5E, %l0
	lduba	[%l7 + %l0] 0x89,	%i1
	movrlez	%g4,	%i2,	%l2
	stx	%i4,	[%l7 + 0x38]
	popc	%g3,	%o1
	set	0x18, %g4
	lduha	[%l7 + %g4] 0x0c,	%i3
	tl	%xcc,	0x2
	addc	%l3,	0x0EE4,	%l0
	movleu	%xcc,	%g5,	%g1
	bge,pt	%xcc,	loop_247
	fmovde	%icc,	%f27,	%f23
	edge32	%o5,	%g7,	%l5
	array32	%g2,	%g6,	%o6
loop_247:
	movcc	%icc,	%i0,	%o0
	nop
	setx loop_248, %l0, %l1
	jmpl %l1, %l4
	fba	%fcc3,	loop_249
	siam	0x1
	taddcc	%l6,	0x0183,	%l1
loop_248:
	fnands	%f12,	%f22,	%f15
loop_249:
	and	%i6,	0x1AFF,	%o3
	ld	[%l7 + 0x54],	%f3
	tleu	%icc,	0x0
	fmovse	%icc,	%f29,	%f20
	edge8	%i5,	%o2,	%o7
	membar	0x05
	bcs,a,pt	%icc,	loop_250
	ldstub	[%l7 + 0x47],	%o4
	sub	%i7,	%g4,	%i2
	set	0x0C, %o3
	lduwa	[%l7 + %o3] 0x0c,	%i1
loop_250:
	movcs	%xcc,	%l2,	%i4
	fba	%fcc2,	loop_251
	prefetch	[%l7 + 0x08],	 0x0
	edge16ln	%g3,	%i3,	%l3
	ldub	[%l7 + 0x6B],	%l0
loop_251:
	fmovsleu	%icc,	%f1,	%f15
	brgez,a	%o1,	loop_252
	fmovrslz	%g1,	%f27,	%f17
	sllx	%o5,	%g7,	%g5
	call	loop_253
loop_252:
	popc	0x051D,	%g2
	tgu	%xcc,	0x4
	edge16	%l5,	%g6,	%i0
loop_253:
	movrlz	%o0,	0x2E3,	%o6
	movne	%icc,	%l4,	%l6
	fmovrsgz	%i6,	%f0,	%f31
	movleu	%xcc,	%l1,	%i5
	udiv	%o2,	0x1CEC,	%o3
	edge8ln	%o7,	%i7,	%g4
	fandnot1s	%f29,	%f15,	%f18
	tleu	%xcc,	0x6
	movge	%icc,	%o4,	%i1
	andcc	%l2,	0x0B45,	%i2
	udivx	%i4,	0x0A5D,	%g3
	set	0x3C, %l4
	sta	%f26,	[%l7 + %l4] 0x04
	tvc	%icc,	0x6
	fbule,a	%fcc1,	loop_254
	fmovdpos	%xcc,	%f5,	%f10
	bpos,a	%xcc,	loop_255
	xor	%l3,	%l0,	%i3
loop_254:
	orcc	%g1,	%o1,	%o5
	sethi	0x123C,	%g5
loop_255:
	fandnot2s	%f7,	%f14,	%f18
	smul	%g7,	0x14B5,	%l5
	fmovrdne	%g2,	%f12,	%f2
	mulscc	%g6,	0x1090,	%i0
	alignaddr	%o6,	%l4,	%o0
	fnot2	%f4,	%f30
	fblg	%fcc3,	loop_256
	fpack16	%f6,	%f31
	mulx	%l6,	%i6,	%i5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x7C] %asi,	%l1
loop_256:
	edge8	%o3,	%o7,	%i7
	fmovrsgz	%o2,	%f10,	%f2
	wr	%g0,	0x23,	%asi
	stxa	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	swap	[%l7 + 0x08],	%i1
	array32	%l2,	%i2,	%g4
	movrgez	%g3,	%i4,	%l0
	stb	%l3,	[%l7 + 0x52]
	tne	%icc,	0x7
	array8	%g1,	%i3,	%o5
	movrlz	%g5,	0x1B8,	%o1
	fmuld8sux16	%f30,	%f29,	%f14
	movcc	%xcc,	%g7,	%g2
	sra	%g6,	0x16,	%i0
	udivx	%l5,	0x12FE,	%l4
	fpack16	%f4,	%f5
	flush	%l7 + 0x54
	tgu	%icc,	0x5
	sll	%o6,	%o0,	%l6
	movleu	%xcc,	%i6,	%l1
	movrlz	%o3,	%o7,	%i5
	fmovdcs	%icc,	%f5,	%f23
	addccc	%o2,	0x047D,	%i7
	array8	%i1,	%o4,	%i2
	edge8n	%l2,	%g4,	%i4
	xor	%l0,	0x1A7E,	%l3
	edge16l	%g1,	%g3,	%i3
	brlez	%g5,	loop_257
	fmovdvc	%xcc,	%f29,	%f29
	wr	%g0,	0x0c,	%asi
	sta	%f12,	[%l7 + 0x68] %asi
loop_257:
	sir	0x1F2B
	xorcc	%o5,	%o1,	%g7
	tge	%icc,	0x3
	nop
	set	0x76, %o4
	ldsb	[%l7 + %o4],	%g6
	fmovrse	%i0,	%f16,	%f9
	fmovrdgz	%g2,	%f2,	%f28
	movge	%icc,	%l4,	%l5
	tcs	%xcc,	0x1
	ldd	[%l7 + 0x48],	%f26
	sethi	0x0BD3,	%o6
	taddcc	%l6,	%i6,	%l1
	nop
	setx	loop_258,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu,a,pt	%xcc,	loop_259
	sdivcc	%o3,	0x0D71,	%o7
	fbg,a	%fcc1,	loop_260
loop_258:
	movne	%icc,	%o0,	%i5
loop_259:
	sllx	%i7,	0x1E,	%i1
	set	0x24, %i4
	ldswa	[%l7 + %i4] 0x81,	%o4
loop_260:
	movneg	%xcc,	%i2,	%l2
	edge32ln	%o2,	%g4,	%i4
	array32	%l0,	%l3,	%g3
	edge32	%i3,	%g1,	%o5
	fornot2s	%f16,	%f9,	%f8
	fbo,a	%fcc1,	loop_261
	sdivx	%o1,	0x0F14,	%g5
	movrne	%g6,	%i0,	%g7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x44] %asi,	%l4
loop_261:
	fnot2	%f12,	%f26
	tcs	%icc,	0x7
	tl	%xcc,	0x7
	fmovda	%icc,	%f7,	%f21
	std	%l4,	[%l7 + 0x50]
	nop
	setx	loop_262,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%icc,	0x6
	array16	%o6,	%g2,	%i6
	taddcc	%l1,	0x0CEC,	%o3
loop_262:
	orncc	%l6,	%o7,	%o0
	edge8	%i5,	%i7,	%i1
	siam	0x5
	movpos	%icc,	%o4,	%i2
	movleu	%icc,	%l2,	%o2
	ldd	[%l7 + 0x08],	%f2
	bcs	loop_263
	subccc	%g4,	0x1361,	%i4
	brlez	%l3,	loop_264
	srl	%l0,	0x1E,	%i3
loop_263:
	fbl,a	%fcc2,	loop_265
	orcc	%g3,	%g1,	%o5
loop_264:
	edge32ln	%o1,	%g5,	%g6
	fxors	%f17,	%f25,	%f27
loop_265:
	nop
	set	0x40, %i7
	prefetch	[%l7 + %i7],	 0x0
	fsrc1	%f20,	%f22
	xor	%g7,	%l4,	%i0
	edge16n	%l5,	%g2,	%i6
	subc	%o6,	0x140E,	%l1
	movleu	%xcc,	%l6,	%o7
	sethi	0x0A08,	%o3
	fbne,a	%fcc3,	loop_266
	membar	0x3A
	fmovdcs	%icc,	%f20,	%f7
	tsubcctv	%i5,	%o0,	%i7
loop_266:
	stbar
	fcmps	%fcc0,	%f29,	%f31
	sdiv	%i1,	0x1A6B,	%i2
	fmovd	%f20,	%f2
	sll	%l2,	%o4,	%o2
	array32	%i4,	%g4,	%l0
	addcc	%l3,	%i3,	%g1
	fpack32	%f18,	%f6,	%f6
	nop
	setx	loop_267,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%g3,	%o5,	%o1
	sra	%g5,	0x12,	%g6
	fandnot2s	%f31,	%f3,	%f0
loop_267:
	taddcc	%g7,	0x09FA,	%l4
	bneg,a,pt	%icc,	loop_268
	fbu	%fcc2,	loop_269
	fmul8x16	%f5,	%f14,	%f24
	movcs	%icc,	%i0,	%l5
loop_268:
	fmuld8sux16	%f17,	%f28,	%f8
loop_269:
	tneg	%xcc,	0x5
	movvs	%icc,	%i6,	%o6
	wr	%g0,	0x11,	%asi
	stda	%g2,	[%l7 + 0x20] %asi
	tleu	%xcc,	0x4
	sir	0x0C23
	fbule	%fcc2,	loop_270
	edge32n	%l1,	%l6,	%o3
	andcc	%i5,	%o0,	%o7
	umul	%i1,	0x1541,	%i2
loop_270:
	fnegs	%f13,	%f12
	sdiv	%i7,	0x08B8,	%l2
	sllx	%o4,	0x1B,	%i4
	sdiv	%g4,	0x089D,	%l0
	movg	%xcc,	%o2,	%l3
	edge8	%i3,	%g3,	%o5
	fmovscs	%icc,	%f16,	%f9
	fbe,a	%fcc2,	loop_271
	taddcctv	%g1,	%g5,	%g6
	xorcc	%o1,	%l4,	%i0
	tpos	%xcc,	0x1
loop_271:
	movn	%xcc,	%g7,	%i6
	array16	%l5,	%o6,	%g2
	orncc	%l1,	%o3,	%i5
	xnor	%o0,	%o7,	%l6
	set	0x2E, %o0
	lduha	[%l7 + %o0] 0x11,	%i2
	fmovscc	%icc,	%f14,	%f9
	stb	%i1,	[%l7 + 0x2D]
	fxor	%f26,	%f16,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i7,	%l2,	%i4
	fbuge	%fcc3,	loop_272
	fcmpgt32	%f20,	%f8,	%o4
	fmuld8sux16	%f31,	%f3,	%f26
	fba,a	%fcc1,	loop_273
loop_272:
	ldd	[%l7 + 0x08],	%f28
	fzero	%f0
	mulx	%g4,	0x1061,	%o2
loop_273:
	sub	%l0,	%i3,	%l3
	fcmpeq32	%f4,	%f4,	%g3
	taddcctv	%g1,	0x1322,	%g5
	call	loop_274
	edge32	%o5,	%g6,	%l4
	movcc	%xcc,	%i0,	%o1
	andcc	%g7,	%l5,	%i6
loop_274:
	ldstub	[%l7 + 0x74],	%o6
	fmul8sux16	%f0,	%f24,	%f10
	st	%f28,	[%l7 + 0x78]
	mulscc	%g2,	%o3,	%i5
	array8	%l1,	%o7,	%o0
	movrgz	%i2,	0x0BE,	%l6
	addcc	%i7,	%i1,	%l2
	std	%i4,	[%l7 + 0x78]
	movleu	%icc,	%g4,	%o4
	wr	%g0,	0x19,	%asi
	sta	%f2,	[%l7 + 0x54] %asi
	fcmps	%fcc1,	%f20,	%f6
	tne	%xcc,	0x5
	sth	%o2,	[%l7 + 0x7E]
	tgu	%icc,	0x5
	orncc	%l0,	0x0C2D,	%l3
	movg	%xcc,	%i3,	%g3
	fcmpne32	%f14,	%f0,	%g5
	nop
	setx loop_275, %l0, %l1
	jmpl %l1, %o5
	andn	%g6,	%l4,	%i0
	fbne	%fcc3,	loop_276
	fbue,a	%fcc0,	loop_277
loop_275:
	ba,pt	%icc,	loop_278
	andcc	%o1,	0x1D35,	%g7
loop_276:
	sir	0x1CB5
loop_277:
	addcc	%g1,	%l5,	%o6
loop_278:
	fmovsleu	%xcc,	%f16,	%f30
	fnot2	%f10,	%f6
	edge8	%g2,	%o3,	%i5
	move	%xcc,	%i6,	%l1
	bne,pt	%icc,	loop_279
	sdiv	%o0,	0x0A0B,	%o7
	fmuld8sux16	%f18,	%f9,	%f30
	sth	%i2,	[%l7 + 0x4C]
loop_279:
	sethi	0x1A51,	%l6
	movcc	%xcc,	%i1,	%i7
	ldsh	[%l7 + 0x52],	%i4
	swap	[%l7 + 0x70],	%l2
	movrlz	%g4,	0x232,	%o2
	brnz	%o4,	loop_280
	fbge	%fcc0,	loop_281
	and	%l3,	0x1896,	%i3
	tleu	%icc,	0x4
loop_280:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_281:
	pdist	%f30,	%f24,	%f0
	fmovsge	%icc,	%f14,	%f20
	udiv	%l0,	0x043A,	%g3
	brgez,a	%o5,	loop_282
	call	loop_283
	brlez,a	%g5,	loop_284
	xorcc	%l4,	0x0A43,	%g6
loop_282:
	tg	%icc,	0x7
loop_283:
	nop
	setx	loop_285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_284:
	tl	%xcc,	0x4
	andn	%o1,	0x03CA,	%i0
	subc	%g7,	%l5,	%o6
loop_285:
	movg	%xcc,	%g2,	%o3
	fmovrdlz	%g1,	%f6,	%f20
	movleu	%icc,	%i6,	%i5
	sdivx	%o0,	0x06CA,	%o7
	be,a	loop_286
	call	loop_287
	tneg	%xcc,	0x1
	bn,a	%icc,	loop_288
loop_286:
	tpos	%xcc,	0x6
loop_287:
	fsrc2s	%f6,	%f3
	tn	%xcc,	0x4
loop_288:
	edge16ln	%i2,	%l1,	%l6
	edge32l	%i7,	%i4,	%i1
	fandnot1s	%f26,	%f19,	%f21
	tl	%icc,	0x6
	xnor	%g4,	0x139E,	%o2
	srax	%l2,	0x08,	%l3
	movne	%icc,	%o4,	%i3
	faligndata	%f24,	%f10,	%f22
	fba	%fcc2,	loop_289
	srl	%l0,	0x15,	%g3
	nop
	setx loop_290, %l0, %l1
	jmpl %l1, %g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_289:
	fmovrdne	%o5,	%f10,	%f14
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_290:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%g6
	xor	%o1,	%i0,	%g7
	xnorcc	%l4,	%l5,	%g2
	bcs,a,pn	%xcc,	loop_291
	fmul8x16	%f10,	%f30,	%f16
	fbo	%fcc0,	loop_292
	fabsd	%f22,	%f20
loop_291:
	sth	%o6,	[%l7 + 0x3A]
	tn	%xcc,	0x5
loop_292:
	orcc	%o3,	0x1ABF,	%g1
	set	0x6B, %g6
	stba	%i5,	[%l7 + %g6] 0x15
	array8	%o0,	%o7,	%i2
	fzero	%f16
	addcc	%l1,	%l6,	%i7
	fmovdn	%icc,	%f12,	%f3
	fmuld8ulx16	%f15,	%f28,	%f4
	fmovde	%xcc,	%f2,	%f20
	xorcc	%i6,	%i1,	%g4
	bl,a	loop_293
	tle	%icc,	0x6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%l2
loop_293:
	bn,a,pt	%xcc,	loop_294
	nop
	setx	loop_295,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x5
	wr	%g0,	0x89,	%asi
	sta	%f26,	[%l7 + 0x7C] %asi
loop_294:
	smul	%l3,	%i4,	%o4
loop_295:
	movcs	%icc,	%i3,	%g3
	umul	%l0,	%o5,	%g6
	movg	%xcc,	%o1,	%g5
	fcmpeq16	%f2,	%f18,	%i0
	array32	%l4,	%g7,	%l5
	tne	%icc,	0x5
	udivcc	%g2,	0x042C,	%o3
	tleu	%icc,	0x2
	orn	%o6,	0x05A8,	%g1
	taddcctv	%i5,	%o7,	%o0
	subccc	%l1,	%i2,	%l6
	fmovrslz	%i6,	%f25,	%f27
	movrlz	%i1,	0x141,	%i7
	movne	%icc,	%g4,	%l2
	ldsb	[%l7 + 0x48],	%l3
	fmul8x16al	%f6,	%f15,	%f26
	andcc	%o2,	0x0562,	%i4
	sir	0x0876
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f5,	%f8
	ta	%icc,	0x7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o4,	%i3
	sdivx	%l0,	0x073A,	%g3
	subccc	%o5,	0x0809,	%o1
	fpsub32s	%f13,	%f25,	%f28
	movrlez	%g5,	0x211,	%i0
	movne	%icc,	%l4,	%g6
	be	loop_296
	tle	%xcc,	0x3
	sdivx	%g7,	0x1DED,	%g2
	xor	%o3,	%l5,	%o6
loop_296:
	fbug,a	%fcc1,	loop_297
	array8	%g1,	%o7,	%o0
	movleu	%icc,	%l1,	%i5
	set	0x20, %g1
	stxa	%l6,	[%l7 + %g1] 0x23
	membar	#Sync
loop_297:
	edge32	%i2,	%i1,	%i6
	fbue,a	%fcc0,	loop_298
	tvs	%xcc,	0x1
	bleu,pn	%icc,	loop_299
	array32	%i7,	%l2,	%g4
loop_298:
	fcmpeq16	%f0,	%f30,	%l3
	movleu	%xcc,	%o2,	%o4
loop_299:
	orcc	%i4,	0x0D7F,	%i3
	xorcc	%g3,	0x1468,	%l0
	bshuffle	%f10,	%f2,	%f30
	movle	%xcc,	%o1,	%g5
	fbul,a	%fcc2,	loop_300
	edge32	%o5,	%l4,	%g6
	ldstub	[%l7 + 0x78],	%g7
	fnot2	%f28,	%f16
loop_300:
	std	%f8,	[%l7 + 0x50]
	fornot2s	%f14,	%f15,	%f11
	movg	%icc,	%g2,	%o3
	andncc	%l5,	%o6,	%i0
	tvc	%icc,	0x0
	udiv	%o7,	0x1AC8,	%g1
	ldsb	[%l7 + 0x0C],	%o0
	edge16	%i5,	%l6,	%l1
	tne	%xcc,	0x3
	taddcctv	%i2,	%i6,	%i7
	brlez	%i1,	loop_301
	fpadd32s	%f5,	%f31,	%f9
	sdivx	%l2,	0x1BCF,	%g4
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x15
loop_301:
	mulscc	%l3,	0x0384,	%o2
	tn	%icc,	0x1
	nop
	setx	loop_302,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%xcc,	%i4,	%i3
	taddcctv	%g3,	0x0FC1,	%o4
	sllx	%l0,	0x00,	%g5
loop_302:
	tcc	%xcc,	0x7
	andncc	%o5,	%o1,	%g6
	tgu	%xcc,	0x3
	addcc	%g7,	0x03DA,	%l4
	edge32n	%o3,	%g2,	%o6
	fzero	%f12
	sdiv	%i0,	0x06A6,	%o7
	edge32n	%l5,	%g1,	%i5
	orncc	%o0,	0x03CA,	%l6
	udivx	%i2,	0x1C0D,	%i6
	mulx	%l1,	%i7,	%l2
	tpos	%xcc,	0x1
	popc	%g4,	%i1
	set	0x80, %o5
	ldxa	[%g0 + %o5] 0x58,	%l3
	fblg,a	%fcc2,	loop_303
	movgu	%xcc,	%o2,	%i3
	alignaddr	%g3,	%o4,	%l0
	fnot1s	%f31,	%f28
loop_303:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g5
	fmovrsgez	%o5,	%f29,	%f6
	bl	loop_304
	srl	%i4,	0x05,	%o1
	fmovsl	%icc,	%f7,	%f19
	sra	%g7,	0x08,	%l4
loop_304:
	bge	%xcc,	loop_305
	fbul	%fcc3,	loop_306
	fmovspos	%xcc,	%f10,	%f9
	brgez	%o3,	loop_307
loop_305:
	addcc	%g6,	0x16DB,	%g2
loop_306:
	tleu	%xcc,	0x5
	fcmpeq16	%f0,	%f16,	%o6
loop_307:
	fmul8x16au	%f11,	%f14,	%f2
	fpadd32	%f22,	%f12,	%f6
	xnorcc	%i0,	%o7,	%g1
	sra	%l5,	0x00,	%i5
	sethi	0x1022,	%l6
	set	0x34, %g5
	lda	[%l7 + %g5] 0x10,	%f17
	fpadd32	%f6,	%f30,	%f6
	fnand	%f12,	%f6,	%f14
	movl	%icc,	%i2,	%o0
	edge8l	%i6,	%l1,	%l2
	tn	%icc,	0x7
	bvs,pt	%xcc,	loop_308
	pdist	%f16,	%f16,	%f14
	tleu	%icc,	0x1
	srax	%i7,	%g4,	%l3
loop_308:
	or	%i1,	%o2,	%i3
	srl	%g3,	%l0,	%o4
	umul	%g5,	0x1B99,	%i4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x48] %asi,	%f8
	mulx	%o1,	0x0DE1,	%o5
	membar	0x68
	tpos	%xcc,	0x0
	srax	%l4,	%g7,	%o3
	andcc	%g6,	%o6,	%i0
	brnz	%g2,	loop_309
	movl	%icc,	%g1,	%o7
	fmovdleu	%icc,	%f25,	%f3
	nop
	set	0x46, %g7
	ldub	[%l7 + %g7],	%i5
loop_309:
	fmovd	%f10,	%f8
	movle	%icc,	%l6,	%i2
	edge32l	%o0,	%i6,	%l1
	andn	%l2,	0x00A1,	%l5
	edge32ln	%i7,	%g4,	%i1
	subc	%o2,	%i3,	%g3
	fpsub16	%f24,	%f30,	%f0
	fmovdne	%icc,	%f7,	%f8
	bleu,pn	%icc,	loop_310
	fmul8x16au	%f10,	%f7,	%f4
	fcmpne32	%f20,	%f20,	%l0
	tg	%xcc,	0x4
loop_310:
	popc	%o4,	%g5
	fmovrde	%l3,	%f8,	%f26
	movge	%xcc,	%o1,	%o5
	or	%l4,	0x19C0,	%g7
	movleu	%icc,	%i4,	%g6
	subccc	%o6,	0x0FCA,	%i0
	bvs,pt	%xcc,	loop_311
	fnands	%f20,	%f16,	%f25
	set	0x44, %g2
	lduba	[%l7 + %g2] 0x19,	%g2
loop_311:
	subccc	%g1,	0x0962,	%o7
	tg	%icc,	0x5
	andcc	%i5,	0x1B37,	%o3
	fcmpd	%fcc2,	%f16,	%f10
	fcmpd	%fcc1,	%f30,	%f30
	movn	%icc,	%l6,	%o0
	tsubcctv	%i6,	0x1F4C,	%i2
	fbl	%fcc0,	loop_312
	fmovrdgez	%l2,	%f2,	%f0
	fbu	%fcc1,	loop_313
	udivx	%l1,	0x15D4,	%l5
loop_312:
	brgez,a	%g4,	loop_314
	smulcc	%i1,	0x18A3,	%i7
loop_313:
	fcmpgt16	%f16,	%f10,	%o2
	brlz	%g3,	loop_315
loop_314:
	tl	%xcc,	0x3
	siam	0x5
	tvc	%xcc,	0x1
loop_315:
	fmovrslz	%l0,	%f1,	%f3
	set	0x3C, %o1
	stwa	%i3,	[%l7 + %o1] 0xe2
	membar	#Sync
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	te	%icc,	0x5
	fpsub32s	%f21,	%f9,	%f23
	edge16l	%g5,	%l3,	%o1
	tleu	%xcc,	0x1
	movrne	%o5,	%l4,	%g7
	fnot2	%f8,	%f30
	sth	%i4,	[%l7 + 0x58]
	edge8ln	%g6,	%o6,	%i0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f7
	set	0x48, %i0
	ldswa	[%l7 + %i0] 0x81,	%g2
	fcmpd	%fcc1,	%f10,	%f22
	set	0x1C, %i2
	ldsba	[%l7 + %i2] 0x04,	%o4
	addccc	%o7,	0x0602,	%i5
	set	0x3C, %i6
	sta	%f5,	[%l7 + %i6] 0x89
	movvs	%xcc,	%o3,	%l6
	alignaddrl	%o0,	%i6,	%g1
	taddcc	%l2,	0x1CCD,	%i2
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x89,	%l1
	nop
	setx	loop_316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdneg	%icc,	%f8,	%f14
	edge16ln	%l5,	%i1,	%g4
	sir	0x0644
loop_316:
	edge32	%o2,	%g3,	%i7
	edge8l	%i3,	%g5,	%l0
	edge16	%o1,	%l3,	%o5
	andncc	%g7,	%l4,	%i4
	sdiv	%o6,	0x17E6,	%g6
	edge16l	%g2,	%i0,	%o4
	pdist	%f6,	%f14,	%f16
	array32	%i5,	%o7,	%l6
	smul	%o0,	0x0E7B,	%i6
	subcc	%o3,	0x1038,	%g1
	fsrc2	%f12,	%f0
	fmovrsne	%l2,	%f0,	%f17
	addccc	%l1,	0x187C,	%i2
	array16	%l5,	%g4,	%i1
	srlx	%o2,	%i7,	%i3
	movcc	%xcc,	%g3,	%g5
	stbar
	fble	%fcc3,	loop_317
	edge16l	%l0,	%o1,	%l3
	fmovda	%icc,	%f30,	%f22
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xe2,	%g6
loop_317:
	subcc	%l4,	%o5,	%o6
	movrlez	%i4,	0x05D,	%g6
	bvs	loop_318
	ble	%xcc,	loop_319
	fors	%f6,	%f25,	%f26
	fcmps	%fcc2,	%f0,	%f7
loop_318:
	alignaddr	%i0,	%o4,	%g2
loop_319:
	tge	%xcc,	0x5
	tge	%icc,	0x3
	fmovsneg	%xcc,	%f14,	%f27
	fmovscc	%xcc,	%f14,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i5,	%o7,	%l6
	fsrc2s	%f16,	%f13
	fbue,a	%fcc2,	loop_320
	xnor	%i6,	0x196A,	%o0
	movre	%o3,	0x09B,	%g1
	bge,a,pt	%xcc,	loop_321
loop_320:
	tl	%icc,	0x7
	udiv	%l1,	0x0CB1,	%l2
	movcc	%icc,	%l5,	%i2
loop_321:
	movneg	%xcc,	%g4,	%o2
	fones	%f8
	fnot2	%f30,	%f26
	fmovrdlez	%i1,	%f12,	%f8
	orn	%i7,	0x096A,	%g3
	fmul8ulx16	%f12,	%f6,	%f18
	xnorcc	%g5,	0x0132,	%i3
	fbne	%fcc2,	loop_322
	tgu	%icc,	0x1
	tsubcctv	%l0,	%o1,	%l3
	or	%l4,	0x0C31,	%o5
loop_322:
	sll	%o6,	0x19,	%g7
	nop
	setx loop_323, %l0, %l1
	jmpl %l1, %g6
	fcmpne16	%f14,	%f28,	%i0
	tpos	%icc,	0x4
	andn	%o4,	0x1E82,	%g2
loop_323:
	fmovrdgz	%i4,	%f0,	%f12
	subcc	%i5,	%o7,	%i6
	brz	%o0,	loop_324
	tg	%xcc,	0x3
	ldstub	[%l7 + 0x55],	%o3
	stb	%l6,	[%l7 + 0x0D]
loop_324:
	tcc	%xcc,	0x1
	orcc	%l1,	0x0912,	%g1
	udiv	%l5,	0x172D,	%i2
	xnorcc	%l2,	0x1462,	%o2
	ba,pn	%icc,	loop_325
	orncc	%g4,	%i7,	%g3
	bneg	%icc,	loop_326
	movrgz	%g5,	%i3,	%l0
loop_325:
	alignaddrl	%i1,	%l3,	%l4
	fbe	%fcc3,	loop_327
loop_326:
	edge32ln	%o5,	%o6,	%g7
	fmul8x16al	%f14,	%f26,	%f4
	wr	%g0,	0x04,	%asi
	sta	%f12,	[%l7 + 0x6C] %asi
loop_327:
	fbo,a	%fcc3,	loop_328
	edge8ln	%g6,	%i0,	%o1
	edge32l	%g2,	%o4,	%i5
	fors	%f13,	%f8,	%f16
loop_328:
	bpos,a	loop_329
	tge	%xcc,	0x5
	bvs,a	loop_330
	fmovdle	%xcc,	%f28,	%f12
loop_329:
	fmovdge	%xcc,	%f11,	%f30
	set	0x45, %i3
	lduba	[%l7 + %i3] 0x81,	%o7
loop_330:
	sdivx	%i4,	0x019A,	%i6
	edge32l	%o3,	%o0,	%l6
	fbule,a	%fcc3,	loop_331
	xnorcc	%g1,	%l1,	%l5
	sth	%i2,	[%l7 + 0x7A]
	ldstub	[%l7 + 0x1C],	%l2
loop_331:
	umul	%o2,	%g4,	%g3
	flush	%l7 + 0x38
	tge	%icc,	0x1
	mulx	%i7,	0x1409,	%g5
	taddcctv	%i3,	%l0,	%l3
	bshuffle	%f8,	%f20,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i1,	0x076,	%l4
	andn	%o5,	%g7,	%o6
	edge8n	%g6,	%i0,	%o1
	umul	%o4,	%i5,	%o7
	fbn,a	%fcc3,	loop_332
	and	%i4,	%g2,	%o3
	fbuge,a	%fcc1,	loop_333
	edge16ln	%i6,	%o0,	%l6
loop_332:
	fandnot1s	%f14,	%f9,	%f14
	tneg	%xcc,	0x6
loop_333:
	fmul8x16	%f6,	%f0,	%f0
	movn	%icc,	%g1,	%l5
	membar	0x36
	subcc	%l1,	%i2,	%l2
	ta	%icc,	0x7
	mulscc	%g4,	0x1739,	%g3
	brlz	%i7,	loop_334
	or	%g5,	0x0F7A,	%i3
	edge32l	%l0,	%l3,	%o2
	andn	%i1,	0x187D,	%o5
loop_334:
	fmovdge	%icc,	%f26,	%f12
	addcc	%l4,	0x1AA1,	%g7
	orcc	%g6,	0x0CC2,	%o6
	move	%icc,	%o1,	%o4
	movvc	%icc,	%i5,	%i0
	popc	%o7,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x10],	%f15
	set	0x60, %l2
	stxa	%o3,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	setx loop_335, %l0, %l1
	jmpl %l1, %g2
	andcc	%o0,	0x14EF,	%i6
	tne	%icc,	0x7
	bgu	%icc,	loop_336
loop_335:
	addccc	%g1,	0x05D2,	%l6
	addccc	%l1,	0x1BFA,	%i2
	fcmple16	%f22,	%f14,	%l2
loop_336:
	alignaddr	%l5,	%g4,	%i7
	fbo	%fcc3,	loop_337
	tvc	%xcc,	0x4
	orncc	%g5,	0x1401,	%i3
	sdivcc	%g3,	0x18DC,	%l0
loop_337:
	ldd	[%l7 + 0x58],	%o2
	movrne	%l3,	0x040,	%o5
	movrlz	%l4,	%g7,	%g6
	edge16	%o6,	%o1,	%i1
	orncc	%i5,	%o4,	%o7
	bvc,pt	%xcc,	loop_338
	array16	%i0,	%i4,	%g2
	movgu	%icc,	%o3,	%o0
	fmovrde	%g1,	%f24,	%f12
loop_338:
	fmovse	%icc,	%f13,	%f22
	orncc	%l6,	%l1,	%i6
	ldsw	[%l7 + 0x68],	%i2
	fmovse	%xcc,	%f4,	%f6
	ldub	[%l7 + 0x40],	%l2
	tgu	%icc,	0x0
	array8	%l5,	%i7,	%g5
	movvs	%xcc,	%i3,	%g4
	smulcc	%l0,	0x082D,	%g3
	array8	%l3,	%o5,	%l4
	fbge,a	%fcc2,	loop_339
	std	%g6,	[%l7 + 0x18]
	set	0x47, %l1
	lduba	[%l7 + %l1] 0x11,	%g6
loop_339:
	orn	%o6,	%o2,	%o1
	fbe,a	%fcc3,	loop_340
	tpos	%xcc,	0x4
	fnors	%f14,	%f23,	%f10
	edge16	%i1,	%o4,	%o7
loop_340:
	bne,a	%icc,	loop_341
	fmovdleu	%icc,	%f8,	%f30
	stbar
	fmul8ulx16	%f28,	%f2,	%f28
loop_341:
	xor	%i5,	0x0DDD,	%i4
	andcc	%i0,	%o3,	%o0
	tleu	%icc,	0x5
	set	0x1D, %i5
	stba	%g1,	[%l7 + %i5] 0x18
	edge8ln	%l6,	%g2,	%i6
	swap	[%l7 + 0x24],	%l1
	edge16n	%l2,	%i2,	%l5
	fandnot2s	%f5,	%f20,	%f2
	brgez,a	%g5,	loop_342
	fmul8x16al	%f2,	%f28,	%f24
	ta	%icc,	0x5
	movleu	%xcc,	%i3,	%g4
loop_342:
	te	%xcc,	0x7
	fcmped	%fcc1,	%f20,	%f0
	fmul8x16	%f30,	%f30,	%f6
	bpos	loop_343
	tgu	%icc,	0x6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%g3
loop_343:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x6
	tn	%xcc,	0x6
	edge32l	%l0,	%o5,	%l4
	sethi	0x0025,	%g7
	tsubcctv	%g6,	%l3,	%o6
	udivx	%o2,	0x0E7D,	%i1
	andncc	%o4,	%o7,	%o1
	movcc	%xcc,	%i4,	%i5
	fandnot2	%f18,	%f10,	%f12
	sllx	%o3,	0x07,	%i0
	fbul,a	%fcc3,	loop_344
	subc	%o0,	%l6,	%g2
	std	%g0,	[%l7 + 0x38]
	smul	%l1,	%i6,	%i2
loop_344:
	fnegd	%f20,	%f12
	fmovspos	%icc,	%f1,	%f9
	mulscc	%l5,	0x1363,	%g5
	brz	%l2,	loop_345
	membar	0x2F
	fbue,a	%fcc1,	loop_346
	srl	%i3,	%i7,	%g3
loop_345:
	xorcc	%l0,	0x052B,	%o5
	movle	%icc,	%g4,	%g7
loop_346:
	sdiv	%l4,	0x11BD,	%g6
	fmovrse	%l3,	%f22,	%f8
	fpadd16s	%f17,	%f10,	%f19
	orncc	%o6,	%o2,	%o4
	set	0x68, %i1
	ldswa	[%l7 + %i1] 0x14,	%i1
	movle	%xcc,	%o7,	%o1
	tge	%xcc,	0x2
	edge32	%i5,	%i4,	%i0
	fornot2	%f10,	%f8,	%f24
	fornot1	%f26,	%f28,	%f30
	tneg	%icc,	0x6
	srlx	%o3,	%l6,	%g2
	fnands	%f22,	%f11,	%f7
	bgu,a,pn	%xcc,	loop_347
	brz	%g1,	loop_348
	brgez,a	%o0,	loop_349
	tleu	%icc,	0x3
loop_347:
	fnegs	%f0,	%f23
loop_348:
	fnors	%f28,	%f7,	%f25
loop_349:
	sdivcc	%l1,	0x1590,	%i2
	fpadd16	%f10,	%f24,	%f12
	fbne	%fcc1,	loop_350
	sdiv	%l5,	0x011D,	%i6
	fmovdleu	%icc,	%f11,	%f8
	movrgez	%g5,	0x008,	%l2
loop_350:
	tpos	%icc,	0x4
	fxnors	%f1,	%f13,	%f29
	sdivcc	%i3,	0x0B6A,	%g3
	smulcc	%i7,	0x1737,	%o5
	fxnors	%f30,	%f4,	%f29
	mova	%icc,	%l0,	%g7
	xnor	%g4,	%l4,	%l3
	mova	%icc,	%g6,	%o2
	fabsd	%f18,	%f4
	xnor	%o6,	0x0FA7,	%o4
	smul	%o7,	0x161B,	%o1
	smul	%i1,	0x1BF5,	%i4
	fmovrslez	%i5,	%f24,	%f3
	fornot1	%f22,	%f28,	%f30
	edge32	%i0,	%o3,	%g2
	edge8n	%g1,	%l6,	%o0
	array16	%i2,	%l5,	%i6
	fabsd	%f12,	%f20
	tpos	%xcc,	0x1
	subc	%g5,	0x0B71,	%l1
	ble	%xcc,	loop_351
	ldub	[%l7 + 0x68],	%l2
	tpos	%icc,	0x7
	fmovdg	%icc,	%f13,	%f18
loop_351:
	fba,a	%fcc3,	loop_352
	sir	0x09C6
	taddcctv	%i3,	0x131C,	%g3
	fxor	%f26,	%f18,	%f10
loop_352:
	tne	%xcc,	0x4
	fzero	%f8
	fmovsne	%xcc,	%f17,	%f10
	movrne	%i7,	0x3CA,	%l0
	movre	%g7,	0x3EC,	%o5
	ldd	[%l7 + 0x68],	%f20
	movcc	%icc,	%g4,	%l3
	tn	%xcc,	0x2
	st	%f11,	[%l7 + 0x6C]
	sdiv	%g6,	0x17FB,	%o2
	fbue,a	%fcc1,	loop_353
	bne	%xcc,	loop_354
	tvs	%icc,	0x0
	fmovrdgz	%o6,	%f8,	%f28
loop_353:
	sdiv	%o4,	0x0DE7,	%l4
loop_354:
	fmovde	%icc,	%f6,	%f22
	be,a	%xcc,	loop_355
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%o7,	%f22,	%f14
	popc	0x0F8D,	%o1
loop_355:
	tpos	%icc,	0x2
	sethi	0x12B1,	%i1
	edge8	%i4,	%i5,	%i0
	addc	%g2,	0x1D12,	%o3
	taddcctv	%g1,	0x05CF,	%o0
	addccc	%l6,	%i2,	%i6
	ble	%icc,	loop_356
	and	%l5,	0x1B0A,	%g5
	fmovsle	%xcc,	%f5,	%f22
	movneg	%icc,	%l2,	%i3
loop_356:
	std	%l0,	[%l7 + 0x38]
	bn,a,pt	%xcc,	loop_357
	ldsw	[%l7 + 0x54],	%i7
	addcc	%g3,	0x0460,	%g7
	fmovsvc	%icc,	%f14,	%f5
loop_357:
	add	%l0,	0x19DF,	%g4
	movg	%icc,	%l3,	%g6
	movleu	%icc,	%o2,	%o5
	sra	%o6,	%l4,	%o7
	bpos,a	loop_358
	subccc	%o4,	0x085D,	%i1
	ldsb	[%l7 + 0x1B],	%i4
	orcc	%o1,	%i0,	%i5
loop_358:
	fsrc1	%f16,	%f26
	and	%o3,	0x1DEF,	%g1
	addcc	%g2,	0x1E55,	%l6
	edge8l	%o0,	%i2,	%l5
	udiv	%g5,	0x0E0C,	%l2
	wr	%g0,	0x10,	%asi
	stwa	%i6,	[%l7 + 0x14] %asi
	nop
	setx loop_359, %l0, %l1
	jmpl %l1, %l1
	edge32	%i3,	%i7,	%g3
	orn	%l0,	%g7,	%g4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x52] %asi,	%l3
loop_359:
	fxors	%f11,	%f8,	%f23
	movne	%icc,	%o2,	%o5
	tneg	%xcc,	0x1
	fmovdle	%xcc,	%f9,	%f9
	fbne,a	%fcc1,	loop_360
	fmovsgu	%icc,	%f17,	%f21
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf0
	membar	#Sync
loop_360:
	xor	%o6,	%g6,	%l4
	alignaddrl	%o4,	%i1,	%o7
	movcs	%xcc,	%o1,	%i0
	edge8ln	%i4,	%o3,	%i5
	tsubcctv	%g1,	0x189F,	%g2
	bpos,pt	%xcc,	loop_361
	taddcc	%o0,	%l6,	%i2
	tg	%icc,	0x5
	xnor	%l5,	%g5,	%i6
loop_361:
	stx	%l2,	[%l7 + 0x60]
	add	%l1,	%i7,	%i3
	movvc	%xcc,	%l0,	%g7
	sir	0x0E93
	addccc	%g3,	0x0842,	%g4
	fbge	%fcc2,	loop_362
	call	loop_363
	movneg	%icc,	%l3,	%o2
	bl	loop_364
loop_362:
	movl	%xcc,	%o6,	%g6
loop_363:
	xnorcc	%o5,	0x0B41,	%l4
	fmovse	%icc,	%f3,	%f0
loop_364:
	fbge,a	%fcc2,	loop_365
	movle	%icc,	%o4,	%o7
	membar	0x66
	umulcc	%o1,	0x1760,	%i0
loop_365:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%o3
	tcc	%xcc,	0x6
	movre	%i5,	0x34E,	%g1
	set	0x34, %o7
	stwa	%g2,	[%l7 + %o7] 0x22
	membar	#Sync
	sub	%o0,	0x1071,	%l6
	srlx	%i1,	0x01,	%l5
	sdiv	%g5,	0x01D5,	%i6
	movrlz	%l2,	%i2,	%i7
	andcc	%l1,	0x09B0,	%i3
	smulcc	%l0,	%g7,	%g4
	membar	0x72
	movrgez	%l3,	%o2,	%g3
	tvs	%xcc,	0x1
	fnand	%f6,	%f2,	%f26
	movpos	%xcc,	%o6,	%o5
	sub	%l4,	0x04AB,	%g6
	orn	%o7,	0x08F3,	%o4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x50] %asi,	%i0
	movrgez	%o1,	%o3,	%i5
	tne	%icc,	0x2
	tcc	%xcc,	0x4
	fmovrde	%g1,	%f8,	%f8
	fnot2	%f4,	%f4
	movne	%xcc,	%g2,	%i4
	bne	loop_366
	movcc	%icc,	%l6,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i1,	%g5,	%i6
loop_366:
	ldsh	[%l7 + 0x50],	%l2
	fcmpes	%fcc2,	%f23,	%f29
	fsrc1s	%f18,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x5
	ba,a	loop_367
	smulcc	%l5,	0x1EAE,	%i2
	sub	%l1,	0x02C8,	%i3
	brlez,a	%l0,	loop_368
loop_367:
	mova	%icc,	%i7,	%g4
	udiv	%g7,	0x1B37,	%o2
	fmovdneg	%xcc,	%f6,	%f24
loop_368:
	subccc	%l3,	%g3,	%o6
	xorcc	%l4,	%g6,	%o5
	ldsh	[%l7 + 0x44],	%o7
	taddcc	%o4,	0x1AC5,	%o1
	fandnot1s	%f24,	%f27,	%f21
	edge8ln	%i0,	%o3,	%g1
	sll	%g2,	%i4,	%l6
	edge16l	%o0,	%i5,	%g5
	bvc,a	loop_369
	ble,a,pt	%icc,	loop_370
	edge32n	%i6,	%l2,	%l5
	wr	%g0,	0xea,	%asi
	stda	%i2,	[%l7 + 0x68] %asi
	membar	#Sync
loop_369:
	ldsw	[%l7 + 0x7C],	%l1
loop_370:
	fands	%f22,	%f0,	%f11
	fbuge,a	%fcc1,	loop_371
	sdivx	%i3,	0x07A9,	%l0
	edge8n	%i1,	%i7,	%g4
	fba,a	%fcc3,	loop_372
loop_371:
	nop
	setx loop_373, %l0, %l1
	jmpl %l1, %g7
	fpmerge	%f29,	%f22,	%f8
	tleu	%icc,	0x3
loop_372:
	be	%icc,	loop_374
loop_373:
	array32	%l3,	%g3,	%o2
	fmul8ulx16	%f14,	%f26,	%f0
	tsubcctv	%l4,	%o6,	%g6
loop_374:
	bcs,a	%icc,	loop_375
	fmovsa	%xcc,	%f6,	%f29
	alignaddr	%o7,	%o4,	%o1
	membar	0x1E
loop_375:
	fmovrdgz	%i0,	%f24,	%f22
	srlx	%o5,	%o3,	%g1
	fornot1	%f6,	%f22,	%f12
	movneg	%icc,	%g2,	%i4
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o0
	ldsw	[%l7 + 0x6C],	%l6
	sdivcc	%g5,	0x1895,	%i6
	ldstub	[%l7 + 0x6D],	%i5
	fmovrde	%l5,	%f20,	%f28
	be,a,pn	%icc,	loop_376
	prefetch	[%l7 + 0x30],	 0x2
	movneg	%icc,	%l2,	%i2
	fcmpd	%fcc1,	%f22,	%f8
loop_376:
	tpos	%xcc,	0x0
	xorcc	%i3,	0x06FE,	%l1
	fmovdvc	%xcc,	%f27,	%f10
	set	0x3C, %o2
	stwa	%l0,	[%l7 + %o2] 0x81
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tleu	%xcc,	0x6
	fmovrdlz	%i7,	%f0,	%f28
	tn	%xcc,	0x6
	sethi	0x1BA3,	%g4
	edge32ln	%i1,	%g7,	%g3
	andn	%o2,	0x1A31,	%l4
	popc	0x0F88,	%o6
	move	%icc,	%l3,	%g6
	ld	[%l7 + 0x44],	%f15
	std	%o4,	[%l7 + 0x18]
	fbu,a	%fcc1,	loop_377
	sra	%o1,	%i0,	%o5
	umulcc	%o3,	0x1408,	%g1
	fmovsl	%xcc,	%f18,	%f13
loop_377:
	movvs	%icc,	%g2,	%o7
	andcc	%i4,	%o0,	%g5
	edge16ln	%l6,	%i6,	%i5
	fcmpd	%fcc0,	%f2,	%f28
	st	%f22,	[%l7 + 0x60]
	tcc	%icc,	0x3
	tl	%icc,	0x4
	xorcc	%l5,	%i2,	%i3
	fcmpeq32	%f14,	%f16,	%l1
	alignaddrl	%l2,	%l0,	%g4
	taddcctv	%i1,	%i7,	%g7
	fmovrsne	%g3,	%f15,	%f5
	nop
	setx	loop_378,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%l4,	%o2,	%o6
	movcc	%xcc,	%g6,	%o4
	nop
	set	0x64, %l0
	ldsh	[%l7 + %l0],	%l3
loop_378:
	nop
	set	0x1A, %g4
	lduha	[%l7 + %g4] 0x14,	%i0
	set	0x6C, %o3
	swapa	[%l7 + %o3] 0x19,	%o5
	lduw	[%l7 + 0x60],	%o3
	fcmpne32	%f16,	%f2,	%g1
	sra	%g2,	%o1,	%o7
	fmovsg	%xcc,	%f24,	%f7
	orncc	%o0,	0x0006,	%i4
	bg,a,pn	%xcc,	loop_379
	tn	%icc,	0x2
	for	%f26,	%f16,	%f14
	taddcctv	%g5,	0x0DFB,	%i6
loop_379:
	edge32ln	%l6,	%l5,	%i2
	siam	0x6
	tle	%xcc,	0x6
	fmovsvs	%icc,	%f22,	%f16
	movn	%xcc,	%i5,	%i3
	movre	%l1,	%l0,	%g4
	fpmerge	%f3,	%f8,	%f12
	edge32l	%i1,	%l2,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l4
	movvc	%xcc,	%o2,	%g7
	fmovsn	%icc,	%f17,	%f21
	fpadd16s	%f22,	%f18,	%f6
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%g6
	andcc	%o4,	%l3,	%i0
	tcc	%xcc,	0x4
	movleu	%xcc,	%o6,	%o3
	fmovde	%xcc,	%f5,	%f31
	array16	%o5,	%g1,	%g2
	srl	%o1,	%o0,	%o7
	fcmpes	%fcc1,	%f28,	%f13
	xor	%i4,	%g5,	%i6
	call	loop_380
	tl	%xcc,	0x2
	bleu	loop_381
	fnegd	%f0,	%f18
loop_380:
	fmovrsne	%l5,	%f1,	%f7
	fbule	%fcc3,	loop_382
loop_381:
	edge16ln	%i2,	%l6,	%i5
	sra	%i3,	0x0D,	%l1
	fble	%fcc1,	loop_383
loop_382:
	srlx	%l0,	%i1,	%g4
	wr	%g0,	0xe2,	%asi
	stda	%l2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_383:
	fnors	%f29,	%f19,	%f18
	sdiv	%g3,	0x1C54,	%i7
	fbl,a	%fcc0,	loop_384
	smul	%o2,	%g7,	%l4
	popc	%o4,	%l3
	array32	%g6,	%i0,	%o6
loop_384:
	andn	%o3,	0x0FF5,	%o5
	edge8	%g1,	%o1,	%o0
	fmovspos	%icc,	%f25,	%f8
	subcc	%g2,	0x1B98,	%o7
	srlx	%g5,	%i4,	%i6
	fmovsleu	%icc,	%f10,	%f17
	edge16n	%l5,	%l6,	%i5
	fmuld8sux16	%f25,	%f21,	%f10
	movg	%xcc,	%i3,	%i2
	fbu,a	%fcc2,	loop_385
	movcs	%xcc,	%l0,	%l1
	fcmpeq32	%f10,	%f20,	%g4
	std	%l2,	[%l7 + 0x30]
loop_385:
	nop
	set	0x30, %o4
	sta	%f15,	[%l7 + %o4] 0x11
	taddcctv	%g3,	0x19F1,	%i1
	fmovsleu	%icc,	%f15,	%f19
	bshuffle	%f4,	%f12,	%f16
	popc	0x1311,	%i7
	movcc	%icc,	%g7,	%o2
	tl	%icc,	0x0
	fmovdg	%icc,	%f22,	%f9
	taddcc	%l4,	%l3,	%o4
	taddcctv	%i0,	0x086D,	%g6
	fands	%f2,	%f27,	%f9
	movg	%icc,	%o3,	%o5
	movge	%xcc,	%o6,	%o1
	xor	%g1,	%o0,	%g2
	mulscc	%g5,	%i4,	%i6
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f0
	umul	%l5,	%l6,	%o7
	mova	%xcc,	%i3,	%i2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x74] %asi,	%f4
	bcc,a	%xcc,	loop_386
	fandnot1	%f28,	%f28,	%f14
	subc	%i5,	0x0978,	%l0
	fcmpeq32	%f0,	%f6,	%g4
loop_386:
	fmovrse	%l2,	%f16,	%f27
	ldstub	[%l7 + 0x3F],	%g3
	call	loop_387
	sdivcc	%l1,	0x1C45,	%i7
	move	%icc,	%g7,	%o2
	andncc	%l4,	%i1,	%o4
loop_387:
	udiv	%l3,	0x1A47,	%i0
	tleu	%xcc,	0x4
	udivcc	%g6,	0x1F9A,	%o3
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	edge32	%o6,	%g1,	%o0
	sra	%o1,	%g2,	%i4
	ld	[%l7 + 0x78],	%f15
	movrgez	%g5,	%l5,	%i6
	smulcc	%l6,	0x16AC,	%i3
	alignaddr	%o7,	%i5,	%i2
	addcc	%g4,	%l0,	%g3
	brlz	%l2,	loop_388
	alignaddr	%l1,	%g7,	%i7
	edge8l	%o2,	%l4,	%o4
	fmovsa	%xcc,	%f26,	%f15
loop_388:
	fcmps	%fcc1,	%f26,	%f13
	edge32n	%l3,	%i1,	%i0
	tsubcctv	%g6,	0x07C5,	%o5
	tgu	%icc,	0x0
	tleu	%icc,	0x0
	wr	%g0,	0xe3,	%asi
	stxa	%o6,	[%l7 + 0x48] %asi
	membar	#Sync
	xnor	%g1,	0x0894,	%o3
	movg	%icc,	%o1,	%g2
	bvc,a	loop_389
	ldd	[%l7 + 0x28],	%f22
	tn	%xcc,	0x6
	fmovsvs	%xcc,	%f23,	%f1
loop_389:
	fcmps	%fcc0,	%f22,	%f24
	st	%f30,	[%l7 + 0x58]
	tpos	%icc,	0x0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i4
	std	%f26,	[%l7 + 0x40]
	movgu	%xcc,	%o0,	%l5
	andn	%i6,	%l6,	%g5
	tl	%icc,	0x1
	sra	%o7,	%i5,	%i2
	fexpand	%f12,	%f4
	alignaddrl	%g4,	%l0,	%i3
	xnorcc	%g3,	0x1604,	%l1
	edge32	%g7,	%l2,	%o2
	srlx	%l4,	%o4,	%i7
	ldub	[%l7 + 0x1C],	%i1
	wr	%g0,	0xe2,	%asi
	stba	%i0,	[%l7 + 0x6E] %asi
	membar	#Sync
	edge16	%g6,	%o5,	%l3
	std	%f28,	[%l7 + 0x70]
	edge16n	%o6,	%g1,	%o1
	sdivcc	%o3,	0x0D70,	%g2
	andcc	%i4,	%l5,	%o0
	orn	%l6,	0x03AB,	%g5
	fbue,a	%fcc3,	loop_390
	array32	%o7,	%i5,	%i6
	srax	%g4,	0x18,	%i2
	brgz	%i3,	loop_391
loop_390:
	movre	%g3,	%l0,	%g7
	tle	%xcc,	0x0
	movcc	%icc,	%l1,	%l2
loop_391:
	tgu	%icc,	0x7
	bpos,a,pt	%xcc,	loop_392
	smulcc	%o2,	%o4,	%l4
	movcs	%xcc,	%i7,	%i1
	movcc	%xcc,	%i0,	%g6
loop_392:
	udiv	%o5,	0x1D7D,	%o6
	brnz	%g1,	loop_393
	tvs	%icc,	0x1
	orn	%o1,	0x0322,	%l3
	alignaddr	%g2,	%i4,	%o3
loop_393:
	fblg,a	%fcc1,	loop_394
	bcc,a,pn	%xcc,	loop_395
	xor	%o0,	%l6,	%g5
	fnors	%f16,	%f0,	%f8
loop_394:
	subccc	%l5,	0x01A1,	%o7
loop_395:
	udiv	%i5,	0x0436,	%i6
	array8	%i2,	%g4,	%g3
	tsubcc	%i3,	%l0,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_396
	fmovrslz	%l1,	%f1,	%f31
	smul	%o2,	0x1DD1,	%l2
	fzero	%f30
loop_396:
	fmovdvc	%icc,	%f30,	%f2
	fxnor	%f0,	%f10,	%f0
	sll	%l4,	%o4,	%i7
	fmovda	%icc,	%f10,	%f27
	te	%xcc,	0x4
	tneg	%xcc,	0x4
	stb	%i0,	[%l7 + 0x4D]
	fmovdvc	%xcc,	%f24,	%f29
	movrlz	%g6,	0x21A,	%i1
	popc	0x0BBC,	%o6
	edge16	%g1,	%o1,	%o5
	fmovrde	%g2,	%f28,	%f26
	faligndata	%f12,	%f14,	%f14
	edge16l	%l3,	%o3,	%i4
	te	%xcc,	0x3
	fmovsge	%icc,	%f16,	%f25
	fbne	%fcc1,	loop_397
	fcmpgt16	%f20,	%f8,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o0,	%g5,	%l5
loop_397:
	sdivcc	%i5,	0x1A64,	%o7
	fabsd	%f30,	%f18
	xnor	%i6,	%g4,	%i2
	edge32	%i3,	%l0,	%g3
	smul	%l1,	0x085F,	%o2
	fxnors	%f8,	%f23,	%f7
	fcmped	%fcc3,	%f0,	%f12
	ldub	[%l7 + 0x2B],	%g7
	tcs	%xcc,	0x5
	tn	%xcc,	0x3
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x04,	%f16
	bleu,a	loop_398
	brlez,a	%l4,	loop_399
	smulcc	%o4,	%l2,	%i7
	fmovda	%xcc,	%f20,	%f5
loop_398:
	movrgz	%g6,	0x04E,	%i0
loop_399:
	nop
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	addccc	%o6,	%g1,	%o1
	subc	%o5,	%i1,	%g2
	movle	%icc,	%o3,	%l3
	addcc	%l6,	0x027B,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f20,	%f31
	stx	%o0,	[%l7 + 0x50]
	popc	%l5,	%g5
	addccc	%o7,	%i6,	%g4
	add	%i5,	%i3,	%i2
	fxnors	%f22,	%f2,	%f21
	udivx	%l0,	0x0606,	%l1
	udivcc	%g3,	0x16EE,	%g7
	ba,pn	%xcc,	loop_400
	edge16ln	%o2,	%l4,	%o4
	fmovrsgz	%i7,	%f19,	%f28
	tgu	%xcc,	0x4
loop_400:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	set	0x3A, %g6
	ldsb	[%l7 + %g6],	%l2
	swap	[%l7 + 0x0C],	%g6
	sdivx	%i0,	0x1520,	%g1
	ba,pt	%icc,	loop_401
	lduh	[%l7 + 0x24],	%o1
	edge16ln	%o6,	%i1,	%g2
	edge8ln	%o5,	%o3,	%l3
loop_401:
	movrgez	%l6,	0x260,	%o0
	movne	%xcc,	%l5,	%i4
	fbo	%fcc2,	loop_402
	tge	%icc,	0x7
	movre	%o7,	0x108,	%i6
	movvs	%xcc,	%g5,	%i5
loop_402:
	movgu	%icc,	%g4,	%i2
	bg,a,pn	%xcc,	loop_403
	move	%icc,	%i3,	%l1
	lduw	[%l7 + 0x44],	%l0
	tcs	%icc,	0x6
loop_403:
	bvc,pt	%xcc,	loop_404
	fmovdcc	%xcc,	%f17,	%f9
	movrlez	%g7,	%o2,	%g3
	smul	%o4,	%l4,	%i7
loop_404:
	call	loop_405
	sdivx	%l2,	0x1FB5,	%i0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x61] %asi,	%g6
loop_405:
	tgu	%xcc,	0x1
	sllx	%o1,	0x13,	%g1
	movpos	%icc,	%o6,	%i1
	srlx	%o5,	%o3,	%g2
	tg	%xcc,	0x2
	subccc	%l3,	%o0,	%l5
	fbg	%fcc3,	loop_406
	srax	%i4,	%o7,	%l6
	srlx	%i6,	0x03,	%g5
	fbul	%fcc3,	loop_407
loop_406:
	movneg	%icc,	%g4,	%i2
	fxnor	%f30,	%f14,	%f0
	fnand	%f2,	%f6,	%f20
loop_407:
	movn	%icc,	%i5,	%i3
	prefetch	[%l7 + 0x18],	 0x1
	stb	%l0,	[%l7 + 0x40]
	tne	%icc,	0x3
	movl	%xcc,	%g7,	%o2
	andn	%g3,	%o4,	%l4
	xnor	%i7,	0x001B,	%l2
	movvc	%icc,	%l1,	%i0
	set	0x50, %g1
	ldxa	[%l7 + %g1] 0x81,	%g6
	movrgz	%g1,	0x13C,	%o1
	fmovdcc	%icc,	%f12,	%f13
	fcmpne32	%f30,	%f24,	%o6
	fsrc2	%f14,	%f12
	tl	%xcc,	0x7
	fmovsvs	%xcc,	%f18,	%f14
	fzero	%f20
	alignaddr	%o5,	%i1,	%o3
	movrgez	%g2,	%o0,	%l3
	fbe,a	%fcc3,	loop_408
	fnand	%f8,	%f20,	%f22
	xorcc	%l5,	0x0220,	%i4
	fbul,a	%fcc1,	loop_409
loop_408:
	ldub	[%l7 + 0x0F],	%o7
	tsubcc	%i6,	%l6,	%g5
	xor	%g4,	0x066E,	%i2
loop_409:
	fmuld8ulx16	%f8,	%f18,	%f24
	array16	%i3,	%i5,	%l0
	movneg	%xcc,	%o2,	%g7
	fmovrdgez	%g3,	%f12,	%f10
	movpos	%xcc,	%l4,	%o4
	fmul8ulx16	%f2,	%f10,	%f20
	sllx	%i7,	%l1,	%l2
	tsubcc	%g6,	%i0,	%o1
	ldd	[%l7 + 0x58],	%f28
	fmovdge	%xcc,	%f13,	%f4
	edge8n	%o6,	%o5,	%g1
	movvc	%icc,	%i1,	%g2
	fnand	%f0,	%f0,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o3,	0x063,	%l3
	array16	%o0,	%l5,	%i4
	smulcc	%i6,	0x012D,	%o7
	movne	%xcc,	%l6,	%g5
	movrgez	%g4,	0x28D,	%i2
	movcc	%xcc,	%i3,	%l0
	smul	%o2,	0x0FDA,	%g7
	taddcctv	%g3,	0x0692,	%l4
	smulcc	%i5,	%i7,	%l1
	fpadd32s	%f2,	%f31,	%f27
	fornot2	%f4,	%f16,	%f12
	movrlez	%o4,	0x141,	%g6
	set	0x30, %l6
	stda	%i0,	[%l7 + %l6] 0xe3
	membar	#Sync
	bl,a	loop_410
	stb	%o1,	[%l7 + 0x20]
	fnot2	%f4,	%f2
	xor	%o6,	%o5,	%l2
loop_410:
	addc	%g1,	0x14F5,	%g2
	movgu	%icc,	%i1,	%l3
	tvs	%icc,	0x0
	sdivcc	%o3,	0x1999,	%o0
	fxnor	%f26,	%f6,	%f0
	sethi	0x04D0,	%i4
	andncc	%i6,	%l5,	%o7
	fzeros	%f1
	tvc	%icc,	0x7
	nop
	set	0x60, %o0
	lduw	[%l7 + %o0],	%l6
	fmovscs	%icc,	%f11,	%f31
	fmovspos	%xcc,	%f31,	%f14
	tne	%xcc,	0x5
	udivcc	%g4,	0x0A87,	%g5
	fmovrslez	%i3,	%f12,	%f20
	fpsub16s	%f5,	%f11,	%f30
	move	%xcc,	%l0,	%i2
	ta	%xcc,	0x4
	orcc	%g7,	%g3,	%o2
	membar	0x5A
	fpackfix	%f4,	%f24
	tleu	%xcc,	0x3
	fandnot1	%f18,	%f24,	%f26
	te	%icc,	0x2
	sll	%l4,	0x04,	%i5
	srlx	%i7,	0x1B,	%l1
	ldd	[%l7 + 0x50],	%g6
	fbe	%fcc0,	loop_411
	edge8n	%i0,	%o4,	%o1
	edge32l	%o6,	%l2,	%o5
	alignaddr	%g1,	%i1,	%l3
loop_411:
	tneg	%xcc,	0x2
	brgz,a	%o3,	loop_412
	bleu,a,pt	%xcc,	loop_413
	fmul8sux16	%f24,	%f10,	%f14
	ldd	[%l7 + 0x78],	%f22
loop_412:
	fmovde	%xcc,	%f16,	%f11
loop_413:
	sdivcc	%g2,	0x18B6,	%o0
	ldsh	[%l7 + 0x20],	%i4
	set	0x5C, %g5
	swapa	[%l7 + %g5] 0x89,	%i6
	lduh	[%l7 + 0x5A],	%o7
	movn	%xcc,	%l6,	%g4
	tgu	%xcc,	0x5
	edge16l	%g5,	%l5,	%l0
	ldsb	[%l7 + 0x60],	%i2
	fsrc1	%f18,	%f8
	orn	%i3,	0x1068,	%g3
	ldsb	[%l7 + 0x42],	%o2
	fmovscc	%icc,	%f29,	%f28
	popc	0x06BC,	%l4
	sir	0x0ECC
	fbu,a	%fcc1,	loop_414
	tvc	%xcc,	0x5
	or	%g7,	0x15C2,	%i5
	tle	%xcc,	0x7
loop_414:
	udiv	%i7,	0x16D2,	%g6
	movge	%xcc,	%i0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o1,	0x0C13,	%o4
	mova	%icc,	%l2,	%o5
	srax	%o6,	%g1,	%l3
	and	%i1,	0x0530,	%g2
	movvs	%icc,	%o3,	%i4
	set	0x78, %o5
	ldswa	[%l7 + %o5] 0x04,	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o7,	%i6
	umulcc	%g4,	0x08D0,	%g5
	nop
	set	0x76, %g7
	ldsh	[%l7 + %g7],	%l5
	set	0x74, %g2
	sta	%f31,	[%l7 + %g2] 0x14
	fxors	%f30,	%f0,	%f17
	fpmerge	%f30,	%f27,	%f4
	fmuld8ulx16	%f13,	%f24,	%f0
	fors	%f28,	%f9,	%f19
	fmovdne	%icc,	%f22,	%f22
	fmovsg	%icc,	%f15,	%f26
	movg	%xcc,	%l0,	%i2
	movvc	%xcc,	%l6,	%g3
	sir	0x1006
	bcs	%xcc,	loop_415
	tcs	%icc,	0x0
	set	0x10, %i0
	lda	[%l7 + %i0] 0x0c,	%f16
loop_415:
	fcmpeq16	%f2,	%f24,	%o2
	fnor	%f26,	%f30,	%f12
	fmovrslez	%i3,	%f8,	%f9
	wr	%g0,	0x04,	%asi
	stwa	%l4,	[%l7 + 0x28] %asi
	fxnors	%f8,	%f5,	%f17
	udivcc	%g7,	0x1BAD,	%i5
	popc	%i7,	%i0
	xnor	%g6,	%l1,	%o1
	edge32	%l2,	%o5,	%o6
	tcs	%icc,	0x3
	movvs	%xcc,	%g1,	%o4
	movrgez	%l3,	0x1BD,	%i1
	udivx	%o3,	0x0D54,	%g2
	udivcc	%i4,	0x1356,	%o0
	mulx	%i6,	0x130D,	%g4
	movrgz	%g5,	%l5,	%l0
	andn	%i2,	%l6,	%g3
	andn	%o2,	0x0A2A,	%o7
	movrne	%i3,	%g7,	%l4
	std	%i6,	[%l7 + 0x48]
	fabss	%f6,	%f23
	movneg	%xcc,	%i5,	%i0
	edge32n	%l1,	%o1,	%l2
	move	%xcc,	%o5,	%g6
	fcmple32	%f30,	%f14,	%o6
	subcc	%g1,	0x0487,	%l3
	for	%f10,	%f26,	%f20
	fmovsneg	%xcc,	%f1,	%f7
	ble,pt	%xcc,	loop_416
	pdist	%f30,	%f4,	%f30
	flush	%l7 + 0x4C
	taddcctv	%i1,	0x1B36,	%o4
loop_416:
	xorcc	%o3,	%g2,	%o0
	movn	%xcc,	%i6,	%i4
	or	%g5,	%l5,	%l0
	ta	%icc,	0x3
	fbne	%fcc2,	loop_417
	edge32ln	%i2,	%l6,	%g4
	udiv	%o2,	0x0E68,	%o7
	ldsh	[%l7 + 0x4E],	%i3
loop_417:
	tsubcctv	%g7,	0x0CE9,	%g3
	addcc	%i7,	%l4,	%i0
	edge16ln	%i5,	%o1,	%l2
	movcs	%icc,	%o5,	%l1
	ldstub	[%l7 + 0x13],	%g6
	fbul	%fcc2,	loop_418
	udiv	%o6,	0x1AEA,	%g1
	fmovdne	%xcc,	%f22,	%f25
	movn	%icc,	%l3,	%o4
loop_418:
	taddcc	%o3,	%i1,	%o0
	fone	%f18
	fba	%fcc3,	loop_419
	tvs	%icc,	0x5
	movcs	%xcc,	%i6,	%g2
	fbuge,a	%fcc1,	loop_420
loop_419:
	add	%i4,	0x1554,	%g5
	edge8n	%l5,	%i2,	%l6
	fsrc2s	%f20,	%f25
loop_420:
	sethi	0x108B,	%l0
	fzeros	%f3
	movge	%icc,	%o2,	%g4
	tsubcctv	%i3,	%g7,	%o7
	fbo,a	%fcc2,	loop_421
	fpadd16	%f10,	%f20,	%f10
	edge16	%i7,	%l4,	%g3
	fpackfix	%f20,	%f27
loop_421:
	udivx	%i0,	0x095C,	%o1
	tsubcctv	%l2,	%i5,	%o5
	bge,a,pn	%xcc,	loop_422
	edge32l	%l1,	%g6,	%g1
	tl	%xcc,	0x4
	fbge,a	%fcc3,	loop_423
loop_422:
	sdiv	%o6,	0x1925,	%l3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
loop_423:
	fbn,a	%fcc3,	loop_424
	fmul8x16au	%f12,	%f21,	%f22
	taddcc	%o4,	0x1AA2,	%i1
	udivcc	%i6,	0x1C5F,	%g2
loop_424:
	ta	%icc,	0x2
	edge8ln	%i4,	%g5,	%l5
	taddcctv	%i2,	0x0FEE,	%o0
	fbe,a	%fcc1,	loop_425
	fblg,a	%fcc1,	loop_426
	sdivx	%l0,	0x09E8,	%o2
	movge	%xcc,	%g4,	%l6
loop_425:
	bcs,a	loop_427
loop_426:
	brgz	%g7,	loop_428
	fmovsvs	%icc,	%f12,	%f9
	set	0x1C, %o1
	ldstuba	[%l7 + %o1] 0x18,	%o7
loop_427:
	fbu,a	%fcc1,	loop_429
loop_428:
	srl	%i3,	%l4,	%g3
	edge8n	%i0,	%o1,	%l2
	fcmple16	%f8,	%f20,	%i5
loop_429:
	sdivcc	%i7,	0x00BA,	%o5
	fblg,a	%fcc3,	loop_430
	movleu	%icc,	%l1,	%g1
	fornot2	%f14,	%f20,	%f6
	tle	%icc,	0x1
loop_430:
	udivcc	%g6,	0x1609,	%o6
	xnorcc	%o3,	%o4,	%l3
	fmovdgu	%xcc,	%f28,	%f30
	fxors	%f13,	%f1,	%f20
	xor	%i6,	%g2,	%i4
	tgu	%icc,	0x0
	bne,pn	%xcc,	loop_431
	srl	%g5,	%i1,	%i2
	movg	%xcc,	%l5,	%l0
	addccc	%o0,	%o2,	%l6
loop_431:
	fbe,a	%fcc2,	loop_432
	fbn,a	%fcc2,	loop_433
	edge32n	%g4,	%g7,	%i3
	tn	%xcc,	0x2
loop_432:
	movre	%l4,	0x316,	%o7
loop_433:
	fabss	%f21,	%f2
	edge16ln	%g3,	%o1,	%l2
	edge16	%i0,	%i5,	%o5
	fbug,a	%fcc0,	loop_434
	fbu	%fcc3,	loop_435
	tle	%xcc,	0x1
	alignaddr	%i7,	%g1,	%g6
loop_434:
	tcs	%icc,	0x4
loop_435:
	array32	%l1,	%o6,	%o4
	fcmpgt16	%f26,	%f12,	%o3
	popc	%i6,	%l3
	udivcc	%i4,	0x0FF5,	%g2
	nop
	setx loop_436, %l0, %l1
	jmpl %l1, %i1
	umul	%i2,	%l5,	%g5
	prefetch	[%l7 + 0x30],	 0x1
	add	%l0,	%o2,	%l6
loop_436:
	edge16	%o0,	%g4,	%g7
	movre	%l4,	%o7,	%g3
	brnz,a	%o1,	loop_437
	movrne	%l2,	0x11F,	%i0
	movpos	%xcc,	%i5,	%o5
	edge32n	%i3,	%i7,	%g6
loop_437:
	subccc	%l1,	%g1,	%o4
	fbe	%fcc2,	loop_438
	fmovrdgez	%o6,	%f0,	%f14
	set	0x20, %i2
	ldxa	[%g0 + %i2] 0x58,	%o3
loop_438:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x58] %asi,	%f4
	fpadd16	%f10,	%f16,	%f22
	addccc	%i6,	%l3,	%i4
	ldsh	[%l7 + 0x18],	%i1
	bcc,a	loop_439
	fpsub16	%f26,	%f28,	%f14
	udivcc	%g2,	0x1C62,	%l5
	be,pt	%icc,	loop_440
loop_439:
	movneg	%xcc,	%i2,	%g5
	smulcc	%l0,	0x0392,	%l6
	fbe	%fcc2,	loop_441
loop_440:
	movge	%icc,	%o0,	%o2
	movcc	%xcc,	%g7,	%g4
	set	0x24, %i6
	stwa	%o7,	[%l7 + %i6] 0x22
	membar	#Sync
loop_441:
	fbg	%fcc2,	loop_442
	fmovrdlz	%l4,	%f22,	%f26
	add	%o1,	%l2,	%i0
	movneg	%xcc,	%i5,	%o5
loop_442:
	tvs	%xcc,	0x4
	tvs	%xcc,	0x1
	brlz,a	%g3,	loop_443
	ld	[%l7 + 0x70],	%f19
	tvc	%icc,	0x0
	tvc	%xcc,	0x3
loop_443:
	siam	0x2
	addcc	%i3,	0x02FB,	%g6
	movrlez	%l1,	0x35D,	%g1
	mova	%xcc,	%i7,	%o6
	and	%o3,	0x008F,	%i6
	fba,a	%fcc3,	loop_444
	bgu,a,pt	%icc,	loop_445
	umulcc	%l3,	0x1B16,	%i4
	membar	0x5B
loop_444:
	popc	0x187B,	%i1
loop_445:
	nop
	set	0x1A, %l3
	ldstuba	[%l7 + %l3] 0x80,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l5,	%i2,	%g5
	tcs	%icc,	0x4
	srlx	%l0,	%l6,	%o0
	fmovdg	%icc,	%f25,	%f21
	call	loop_446
	swap	[%l7 + 0x0C],	%o2
	movcc	%xcc,	%o4,	%g7
	sub	%g4,	0x04C0,	%o7
loop_446:
	tvs	%icc,	0x0
	fmovrdne	%l4,	%f8,	%f24
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x89,	%o0
	sra	%i0,	0x06,	%i5
	edge16n	%o5,	%g3,	%l2
	fzero	%f24
	movne	%xcc,	%g6,	%i3
	movn	%icc,	%l1,	%g1
	call	loop_447
	move	%xcc,	%o6,	%o3
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x89,	%i6
loop_447:
	edge8	%i7,	%i4,	%i1
	fmovs	%f8,	%f27
	fmovrse	%l3,	%f28,	%f12
	umul	%l5,	%g2,	%i2
	popc	0x1736,	%l0
	bge	%icc,	loop_448
	fors	%f10,	%f7,	%f8
	udivcc	%g5,	0x1842,	%o0
	mulx	%o2,	%l6,	%o4
loop_448:
	fmovrdlz	%g7,	%f18,	%f16
	fmovdne	%xcc,	%f8,	%f5
	sdivx	%g4,	0x19C8,	%o7
	sdivx	%l4,	0x1D2E,	%o1
	fandnot1s	%f4,	%f30,	%f7
	edge16	%i0,	%i5,	%o5
	addc	%l2,	%g3,	%g6
	bcc	%icc,	loop_449
	nop
	setx loop_450, %l0, %l1
	jmpl %l1, %l1
	subc	%g1,	%o6,	%i3
	fmovdne	%xcc,	%f7,	%f9
loop_449:
	fnot2	%f14,	%f4
loop_450:
	movvc	%icc,	%o3,	%i7
	set	0x7C, %l1
	ldswa	[%l7 + %l1] 0x14,	%i4
	taddcc	%i6,	0x0F7C,	%i1
	fornot1	%f20,	%f12,	%f20
	ldstub	[%l7 + 0x56],	%l3
	movleu	%icc,	%g2,	%l5
	brlez	%i2,	loop_451
	addc	%l0,	0x0F2A,	%g5
	brlez	%o2,	loop_452
	fmovscs	%xcc,	%f21,	%f2
loop_451:
	srax	%o0,	%o4,	%l6
	edge32l	%g7,	%o7,	%l4
loop_452:
	or	%g4,	0x16B0,	%i0
	fmovdcs	%icc,	%f22,	%f16
	andn	%i5,	%o1,	%o5
	fmovdpos	%xcc,	%f20,	%f5
	taddcctv	%l2,	0x06AC,	%g3
	edge32l	%l1,	%g6,	%g1
	fmovdcs	%xcc,	%f11,	%f30
	orn	%o6,	%o3,	%i3
	membar	0x25
	movg	%icc,	%i7,	%i4
	set	0x10, %l2
	lduba	[%l7 + %l2] 0x11,	%i6
	edge32n	%l3,	%i1,	%g2
	fpsub16s	%f6,	%f10,	%f16
	brz,a	%l5,	loop_453
	sllx	%l0,	%i2,	%o2
	fmovspos	%xcc,	%f31,	%f29
	call	loop_454
loop_453:
	edge16	%g5,	%o4,	%l6
	fbe	%fcc3,	loop_455
	tcc	%xcc,	0x3
loop_454:
	sethi	0x1F70,	%g7
	sll	%o0,	0x03,	%l4
loop_455:
	tcc	%icc,	0x0
	tg	%xcc,	0x2
	orn	%o7,	%g4,	%i0
	edge8n	%i5,	%o5,	%l2
	sllx	%g3,	0x12,	%o1
	bl,a,pn	%icc,	loop_456
	movrlz	%g6,	%l1,	%g1
	andncc	%o6,	%i3,	%i7
	udiv	%o3,	0x08F1,	%i4
loop_456:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x26] %asi,	%i6
	fmovdl	%icc,	%f5,	%f3
	fnands	%f23,	%f23,	%f29
	tl	%icc,	0x4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x5D] %asi,	%i1
	edge16ln	%l3,	%l5,	%l0
	ble,a	%icc,	loop_457
	fmovrdgz	%i2,	%f18,	%f16
	fcmpes	%fcc3,	%f1,	%f14
	xnorcc	%o2,	%g5,	%g2
loop_457:
	movrlz	%o4,	0x216,	%g7
	fpsub32	%f6,	%f6,	%f2
	mova	%icc,	%o0,	%l6
	membar	0x07
	wr	%g0,	0x2f,	%asi
	stba	%l4,	[%l7 + 0x31] %asi
	membar	#Sync
	movleu	%xcc,	%g4,	%o7
	for	%f12,	%f28,	%f30
	taddcc	%i0,	%i5,	%l2
	subcc	%g3,	0x16AF,	%o5
	fmovscs	%icc,	%f21,	%f0
	set	0x4C, %i1
	sta	%f20,	[%l7 + %i1] 0x10
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x2C] %asi,	%f28
	andcc	%o1,	%g6,	%g1
	movrne	%o6,	0x2E2,	%i3
	taddcctv	%l1,	0x1023,	%o3
	ld	[%l7 + 0x48],	%f29
	sllx	%i4,	%i6,	%i1
	srax	%i7,	%l5,	%l0
	brz,a	%l3,	loop_458
	popc	%i2,	%o2
	ta	%xcc,	0x1
	tg	%icc,	0x2
loop_458:
	edge16n	%g2,	%o4,	%g7
	fmovsneg	%xcc,	%f15,	%f19
	srax	%o0,	0x19,	%l6
	edge8ln	%l4,	%g4,	%o7
	ld	[%l7 + 0x70],	%f27
	array32	%i0,	%i5,	%l2
	tge	%xcc,	0x7
	mulscc	%g3,	%g5,	%o5
	fpmerge	%f30,	%f21,	%f2
	smulcc	%g6,	0x06ED,	%o1
	brgz,a	%o6,	loop_459
	fmovrdgz	%i3,	%f4,	%f30
	fbl	%fcc3,	loop_460
	tle	%icc,	0x7
loop_459:
	xnorcc	%g1,	%o3,	%l1
	movle	%icc,	%i4,	%i1
loop_460:
	add	%i7,	0x0E8B,	%l5
	sra	%i6,	%l3,	%l0
	edge8l	%o2,	%i2,	%o4
	fbug,a	%fcc2,	loop_461
	fcmpeq16	%f22,	%f12,	%g2
	fmuld8sux16	%f23,	%f12,	%f20
	tsubcc	%g7,	0x044C,	%o0
loop_461:
	fpsub32s	%f4,	%f12,	%f18
	tg	%icc,	0x7
	fbl,a	%fcc2,	loop_462
	lduw	[%l7 + 0x30],	%l6
	ba,a	loop_463
	bvs,a	loop_464
loop_462:
	stx	%g4,	[%l7 + 0x78]
	movgu	%xcc,	%l4,	%i0
loop_463:
	nop
	setx	loop_465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_464:
	fbg,a	%fcc0,	loop_466
	st	%f11,	[%l7 + 0x5C]
	and	%o7,	%i5,	%l2
loop_465:
	edge32l	%g3,	%o5,	%g5
loop_466:
	edge16ln	%g6,	%o6,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %g3
	lduha	[%l7 + %g3] 0x0c,	%g1
	tpos	%icc,	0x0
	edge8l	%o3,	%i3,	%l1
	fmovsneg	%xcc,	%f3,	%f8
	tl	%xcc,	0x5
	lduh	[%l7 + 0x20],	%i1
	tgu	%icc,	0x2
	sdivx	%i7,	0x0302,	%i4
	xnor	%i6,	%l5,	%l0
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%l3
	edge8l	%i2,	%o4,	%o2
	umulcc	%g7,	%g2,	%o0
	tgu	%icc,	0x0
	tleu	%icc,	0x3
	or	%g4,	%l6,	%i0
	fmovdpos	%xcc,	%f12,	%f2
	call	loop_467
	fpadd32	%f20,	%f16,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l4,	%i5,	%l2
loop_467:
	fnands	%f3,	%f3,	%f31
	fbg	%fcc3,	loop_468
	edge16n	%o7,	%g3,	%g5
	fcmple16	%f2,	%f4,	%o5
	fmovrse	%o6,	%f2,	%f13
loop_468:
	movgu	%xcc,	%g6,	%g1
	fmovsa	%icc,	%f7,	%f11
	stbar
	fcmpgt16	%f16,	%f22,	%o3
	fmovdg	%xcc,	%f18,	%f10
	srlx	%i3,	%o1,	%i1
	sdivcc	%i7,	0x0251,	%l1
	fbg	%fcc1,	loop_469
	xorcc	%i4,	%i6,	%l0
	fmovdg	%xcc,	%f28,	%f28
	fpadd32	%f10,	%f0,	%f4
loop_469:
	bne	%icc,	loop_470
	move	%xcc,	%l3,	%l5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%i2
loop_470:
	fnegd	%f30,	%f6
	fbo	%fcc3,	loop_471
	xnorcc	%o4,	0x14AF,	%o2
	ldx	[%l7 + 0x70],	%g2
	mulx	%g7,	%o0,	%l6
loop_471:
	nop
	set	0x48, %o7
	stda	%i0,	[%l7 + %o7] 0x0c
	fcmple16	%f2,	%f14,	%g4
	fzeros	%f8
	orncc	%l4,	%i5,	%o7
	movl	%xcc,	%l2,	%g5
	sth	%o5,	[%l7 + 0x16]
	edge32ln	%o6,	%g6,	%g1
	movle	%icc,	%g3,	%o3
	bgu	loop_472
	addcc	%o1,	%i3,	%i7
	fmovda	%icc,	%f17,	%f22
	set	0x79, %o2
	stba	%i1,	[%l7 + %o2] 0x2f
	membar	#Sync
loop_472:
	edge16ln	%l1,	%i6,	%l0
	alignaddrl	%i4,	%l5,	%i2
	ldd	[%l7 + 0x08],	%f16
	movl	%xcc,	%o4,	%l3
	fble	%fcc0,	loop_473
	tsubcc	%o2,	0x0086,	%g2
	set	0x38, %i5
	ldswa	[%l7 + %i5] 0x11,	%g7
loop_473:
	tvs	%icc,	0x0
	tgu	%icc,	0x5
	subcc	%l6,	0x1081,	%o0
	or	%g4,	%l4,	%i5
	movne	%xcc,	%o7,	%l2
	fmovs	%f30,	%f15
	movneg	%xcc,	%g5,	%i0
	fornot1s	%f16,	%f4,	%f13
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x16] %asi,	%o6
	tne	%xcc,	0x2
	fors	%f8,	%f9,	%f27
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f24
	bl,a,pn	%icc,	loop_474
	fmovdge	%xcc,	%f20,	%f25
	movrlez	%o5,	0x078,	%g6
	nop
	setx	loop_475,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_474:
	fcmps	%fcc3,	%f17,	%f11
	fmovdne	%icc,	%f2,	%f0
	call	loop_476
loop_475:
	fmovrdlz	%g1,	%f28,	%f24
	sra	%o3,	%o1,	%g3
	fxor	%f4,	%f16,	%f16
loop_476:
	sllx	%i3,	0x1B,	%i1
	alignaddr	%l1,	%i6,	%i7
	tcs	%icc,	0x0
	add	%i4,	%l5,	%i2
	sdivx	%o4,	0x1327,	%l3
	wr	%g0,	0x2a,	%asi
	stwa	%l0,	[%l7 + 0x60] %asi
	membar	#Sync
	movrne	%o2,	0x20E,	%g2
	fmovse	%xcc,	%f9,	%f3
	add	%l6,	0x033D,	%o0
	edge32l	%g7,	%l4,	%i5
	fexpand	%f15,	%f28
	taddcctv	%g4,	0x0C46,	%o7
	ldsb	[%l7 + 0x38],	%g5
	addccc	%i0,	%l2,	%o6
	srlx	%o5,	%g1,	%o3
	tvs	%xcc,	0x4
	taddcctv	%g6,	0x1F1A,	%o1
	movneg	%xcc,	%i3,	%g3
	movvs	%xcc,	%l1,	%i6
	array32	%i1,	%i7,	%i4
	sdiv	%i2,	0x0CE2,	%l5
	bgu	%xcc,	loop_477
	movre	%l3,	0x0F8,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	0x10BE,	%o2
loop_477:
	std	%g2,	[%l7 + 0x50]
	sub	%o0,	0x1FA9,	%l6
	umul	%g7,	0x0063,	%l4
	smulcc	%i5,	%o7,	%g4
	mova	%xcc,	%i0,	%g5
	movgu	%icc,	%o6,	%l2
	fcmps	%fcc1,	%f19,	%f5
	fbne	%fcc3,	loop_478
	orn	%o5,	0x0A72,	%o3
	fnor	%f6,	%f18,	%f6
	sub	%g1,	0x09C2,	%g6
loop_478:
	fmovrsne	%o1,	%f24,	%f4
	bcc	%xcc,	loop_479
	alignaddr	%g3,	%i3,	%l1
	xor	%i1,	%i6,	%i7
	fbl	%fcc1,	loop_480
loop_479:
	bgu,pn	%icc,	loop_481
	bneg	%icc,	loop_482
	fmovrde	%i4,	%f12,	%f6
loop_480:
	stb	%i2,	[%l7 + 0x64]
loop_481:
	fone	%f30
loop_482:
	alignaddr	%l5,	%l3,	%o4
	sdivx	%o2,	0x09C7,	%g2
	xor	%o0,	%l0,	%l6
	movleu	%icc,	%g7,	%i5
	fcmpes	%fcc3,	%f3,	%f15
	fxor	%f26,	%f16,	%f12
	sdivcc	%l4,	0x0B5D,	%g4
	bne,a	%xcc,	loop_483
	fpack16	%f14,	%f3
	fpadd16s	%f0,	%f22,	%f21
	fmuld8sux16	%f11,	%f10,	%f0
loop_483:
	tcs	%xcc,	0x6
	addc	%i0,	%g5,	%o7
	movrgz	%l2,	%o6,	%o5
	fmovdn	%icc,	%f5,	%f15
	fmovrse	%o3,	%f25,	%f16
	nop
	setx loop_484, %l0, %l1
	jmpl %l1, %g1
	subc	%o1,	0x161E,	%g6
	fmuld8sux16	%f31,	%f22,	%f2
	fbl	%fcc2,	loop_485
loop_484:
	fmovsle	%icc,	%f23,	%f25
	ld	[%l7 + 0x2C],	%f17
	and	%g3,	0x1841,	%i3
loop_485:
	fpsub16s	%f14,	%f22,	%f2
	flush	%l7 + 0x58
	std	%f28,	[%l7 + 0x50]
	edge8l	%i1,	%i6,	%l1
	nop
	setx	loop_486,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%i4,	0x1981,	%i2
	fcmpne32	%f0,	%f26,	%i7
	ta	%icc,	0x1
loop_486:
	udivcc	%l3,	0x02BA,	%l5
	movcs	%icc,	%o2,	%o4
	orncc	%o0,	0x0DA7,	%g2
	sethi	0x1A85,	%l0
	fand	%f10,	%f30,	%f28
	udiv	%g7,	0x17D4,	%l6
	tn	%xcc,	0x7
	movle	%icc,	%i5,	%l4
	tg	%xcc,	0x4
	tg	%xcc,	0x2
	udivcc	%g4,	0x0151,	%i0
	taddcctv	%g5,	0x1F01,	%o7
	udivx	%o6,	0x05E6,	%l2
	fbu,a	%fcc0,	loop_487
	udiv	%o3,	0x06B8,	%g1
	nop
	setx	loop_488,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%o5,	%o1
loop_487:
	xnor	%g6,	0x1835,	%g3
	ldstub	[%l7 + 0x70],	%i1
loop_488:
	udivx	%i3,	0x1F7D,	%i6
	tvc	%xcc,	0x0
	xorcc	%i4,	0x0A66,	%l1
	brlz	%i7,	loop_489
	brlez	%l3,	loop_490
	taddcctv	%i2,	0x02CA,	%l5
	movneg	%icc,	%o4,	%o2
loop_489:
	movrgez	%g2,	0x08E,	%o0
loop_490:
	nop
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x80,	%g6
	tcs	%icc,	0x3
	fmul8ulx16	%f16,	%f24,	%f2
	fpmerge	%f26,	%f22,	%f16
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x63] %asi,	%l0
	fbl	%fcc1,	loop_491
	orn	%i5,	0x050C,	%l6
	bneg,a,pn	%xcc,	loop_492
	sdivx	%l4,	0x0C86,	%i0
loop_491:
	sdivcc	%g4,	0x171A,	%o7
	tcc	%icc,	0x0
loop_492:
	fpsub16	%f2,	%f0,	%f28
	fcmpgt16	%f30,	%f16,	%g5
	subccc	%o6,	0x056E,	%l2
	sra	%g1,	%o3,	%o5
	udiv	%o1,	0x0BEB,	%g3
	edge16	%g6,	%i1,	%i3
	nop
	setx	loop_493,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdl	%icc,	%f24,	%f18
	fabsd	%f24,	%f24
	tleu	%icc,	0x5
loop_493:
	edge8	%i4,	%i6,	%i7
	fnor	%f4,	%f26,	%f0
	array8	%l1,	%i2,	%l3
	fpmerge	%f2,	%f0,	%f8
	orncc	%o4,	%o2,	%l5
	fmovrsgez	%g2,	%f28,	%f22
	ldsw	[%l7 + 0x44],	%o0
	tneg	%icc,	0x4
	sdivcc	%g7,	0x173C,	%l0
	bgu,pn	%icc,	loop_494
	edge16n	%i5,	%l4,	%l6
	ldsh	[%l7 + 0x1A],	%i0
	tsubcctv	%o7,	0x026A,	%g5
loop_494:
	sethi	0x042A,	%g4
	udivcc	%l2,	0x0CDE,	%g1
	ldub	[%l7 + 0x7E],	%o6
	taddcctv	%o3,	0x1148,	%o1
	or	%o5,	%g3,	%g6
	movrgez	%i1,	%i3,	%i4
	addc	%i6,	%l1,	%i2
	mulx	%i7,	0x0B08,	%l3
	movleu	%icc,	%o2,	%l5
	movrlez	%o4,	%g2,	%g7
	fbuge	%fcc0,	loop_495
	fmul8x16al	%f3,	%f21,	%f2
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
loop_495:
	andncc	%l0,	%o0,	%i5
	fnor	%f18,	%f14,	%f2
	subc	%l6,	%i0,	%l4
	sll	%g5,	0x1E,	%o7
	stw	%g4,	[%l7 + 0x48]
	nop
	setx	loop_496,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%f24,	[%l7 + 0x28]
	brlz	%l2,	loop_497
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_496:
	tvc	%xcc,	0x1
	sdivx	%o6,	0x095B,	%o3
loop_497:
	fmul8x16au	%f14,	%f16,	%f20
	fexpand	%f1,	%f8
	ba	%xcc,	loop_498
	fmul8sux16	%f14,	%f18,	%f20
	brgz	%o1,	loop_499
	edge32n	%g1,	%g3,	%g6
loop_498:
	sdiv	%o5,	0x1A9B,	%i3
	brgez	%i4,	loop_500
loop_499:
	sdivx	%i6,	0x0178,	%i1
	ld	[%l7 + 0x2C],	%f30
	fsrc1	%f24,	%f18
loop_500:
	fandnot2s	%f24,	%f15,	%f8
	array8	%i2,	%l1,	%i7
	movrne	%l3,	%l5,	%o2
	orn	%o4,	0x007D,	%g7
	edge8l	%g2,	%o0,	%i5
	movrgz	%l0,	0x02B,	%i0
	edge16n	%l4,	%g5,	%o7
	umulcc	%g4,	0x0CAE,	%l2
	membar	0x7C
	tcc	%xcc,	0x6
	brgz	%o6,	loop_501
	brgz,a	%o3,	loop_502
	tle	%xcc,	0x5
	flush	%l7 + 0x30
loop_501:
	ldsb	[%l7 + 0x41],	%l6
loop_502:
	tneg	%xcc,	0x5
	movre	%o1,	%g3,	%g1
	fbg	%fcc3,	loop_503
	bcc,pn	%xcc,	loop_504
	fmovsn	%xcc,	%f21,	%f18
	andcc	%o5,	0x0E12,	%i3
loop_503:
	ldd	[%l7 + 0x60],	%g6
loop_504:
	orncc	%i6,	0x0720,	%i1
	ldd	[%l7 + 0x10],	%f0
	and	%i4,	0x0BE8,	%l1
	alignaddrl	%i7,	%i2,	%l5
	fpadd32s	%f18,	%f11,	%f7
	nop
	setx	loop_505,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x44],	 0x1
	set	0x20, %o3
	stda	%o2,	[%l7 + %o3] 0x15
loop_505:
	tgu	%xcc,	0x4
	tge	%xcc,	0x0
	fbne,a	%fcc1,	loop_506
	te	%icc,	0x2
	tsubcc	%l3,	%g7,	%o4
	xnorcc	%g2,	%o0,	%i5
loop_506:
	fnands	%f13,	%f28,	%f2
	fabss	%f3,	%f10
	udiv	%l0,	0x0414,	%i0
	fmovda	%icc,	%f22,	%f15
	fmovda	%xcc,	%f21,	%f13
	array16	%g5,	%l4,	%o7
	bvs,a,pt	%xcc,	loop_507
	addccc	%g4,	0x0E53,	%o6
	sll	%o3,	%l2,	%l6
	movle	%xcc,	%g3,	%g1
loop_507:
	movl	%xcc,	%o1,	%i3
	brgez	%g6,	loop_508
	fmovrslez	%o5,	%f16,	%f1
	fpack32	%f12,	%f8,	%f28
	fmul8ulx16	%f0,	%f2,	%f18
loop_508:
	fmovrdgz	%i6,	%f10,	%f18
	addcc	%i1,	%l1,	%i4
	fmovdvc	%xcc,	%f11,	%f23
	movne	%xcc,	%i2,	%i7
	orn	%l5,	%l3,	%o2
	fzero	%f10
	brgez	%g7,	loop_509
	sdivx	%g2,	0x0D8B,	%o0
	bg	loop_510
	fmul8sux16	%f0,	%f20,	%f8
loop_509:
	edge8l	%i5,	%l0,	%o4
	lduw	[%l7 + 0x58],	%i0
loop_510:
	bl,pn	%icc,	loop_511
	brgez,a	%l4,	loop_512
	movl	%icc,	%g5,	%g4
	faligndata	%f4,	%f0,	%f0
loop_511:
	fandnot2s	%f7,	%f30,	%f11
loop_512:
	movrgz	%o7,	%o3,	%o6
	sllx	%l2,	%g3,	%l6
	fmovsneg	%icc,	%f11,	%f12
	tsubcctv	%g1,	0x01D0,	%i3
	fmovrsne	%g6,	%f29,	%f5
	membar	0x0B
	tle	%xcc,	0x7
	fornot2s	%f9,	%f21,	%f11
	bvc	%xcc,	loop_513
	movvs	%icc,	%o5,	%i6
	orncc	%i1,	0x118B,	%l1
	edge8l	%o1,	%i2,	%i4
loop_513:
	edge8	%l5,	%l3,	%o2
	brnz,a	%i7,	loop_514
	fmovdcs	%xcc,	%f14,	%f5
	brlez	%g2,	loop_515
	mova	%xcc,	%o0,	%i5
loop_514:
	sllx	%l0,	0x09,	%o4
	fmovrde	%i0,	%f24,	%f26
loop_515:
	tsubcc	%l4,	%g7,	%g4
	ldd	[%l7 + 0x08],	%o6
	pdist	%f10,	%f8,	%f4
	fmovsne	%xcc,	%f0,	%f28
	set	0x30, %l5
	ldda	[%l7 + %l5] 0x81,	%g4
	fmovsle	%icc,	%f17,	%f9
	ldd	[%l7 + 0x78],	%f24
	edge32n	%o3,	%l2,	%g3
	sethi	0x1B49,	%l6
	movrgz	%g1,	0x21E,	%o6
	fpadd32	%f20,	%f2,	%f30
	orcc	%g6,	0x00AB,	%i3
	taddcc	%i6,	%i1,	%o5
	fmovrsgz	%o1,	%f28,	%f5
	edge8n	%i2,	%l1,	%i4
	tleu	%icc,	0x2
	tn	%icc,	0x2
	fmovrdgez	%l3,	%f10,	%f12
	tvs	%xcc,	0x5
	array16	%l5,	%i7,	%g2
	movpos	%icc,	%o2,	%i5
	fpadd16s	%f21,	%f12,	%f2
	ta	%icc,	0x2
	fnot2s	%f14,	%f13
	bn,a,pn	%xcc,	loop_516
	fxnor	%f8,	%f8,	%f14
	fornot1s	%f3,	%f26,	%f24
	st	%f16,	[%l7 + 0x08]
loop_516:
	edge32ln	%l0,	%o4,	%i0
	fnot1s	%f1,	%f20
	addc	%l4,	0x04B9,	%o0
	movrlz	%g7,	%g4,	%g5
	and	%o7,	0x027F,	%o3
	bcc,a,pt	%xcc,	loop_517
	fba,a	%fcc2,	loop_518
	xor	%l2,	%g3,	%l6
	subcc	%g1,	0x125B,	%g6
loop_517:
	taddcctv	%i3,	%i6,	%i1
loop_518:
	tleu	%xcc,	0x0
	fmul8ulx16	%f20,	%f4,	%f2
	udivcc	%o6,	0x0E8C,	%o5
	fmovrsgez	%o1,	%f12,	%f30
	tneg	%xcc,	0x3
	nop
	setx	loop_519,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addcc	%i2,	0x1DCA,	%i4
	smul	%l1,	0x0518,	%l3
	bg	loop_520
loop_519:
	tsubcc	%l5,	0x1A75,	%i7
	fmul8sux16	%f16,	%f18,	%f14
	set	0x70, %l0
	lduwa	[%l7 + %l0] 0x89,	%o2
loop_520:
	alignaddr	%i5,	%l0,	%o4
	fone	%f26
	fmovrse	%i0,	%f29,	%f4
	set	0x2C, %o4
	stwa	%l4,	[%l7 + %o4] 0xe2
	membar	#Sync
	fcmpgt16	%f10,	%f20,	%g2
	set	0x6E, %l4
	lduha	[%l7 + %l4] 0x88,	%o0
	bleu,pt	%xcc,	loop_521
	brlez,a	%g7,	loop_522
	alignaddrl	%g4,	%g5,	%o7
	movrlz	%l2,	0x1B4,	%g3
loop_521:
	tvc	%xcc,	0x5
loop_522:
	sdivx	%o3,	0x1542,	%g1
	udiv	%l6,	0x17D6,	%g6
	fmuld8ulx16	%f11,	%f9,	%f6
	srlx	%i6,	%i3,	%i1
	fandnot2s	%f0,	%f2,	%f5
	sra	%o5,	0x07,	%o1
	udivx	%o6,	0x1643,	%i4
	fmovda	%xcc,	%f24,	%f9
	ldub	[%l7 + 0x1E],	%l1
	fmovdn	%xcc,	%f22,	%f13
	movpos	%xcc,	%l3,	%l5
	smul	%i7,	0x0150,	%o2
	fmovsl	%icc,	%f5,	%f1
	subccc	%i5,	0x0C38,	%l0
	tne	%icc,	0x7
	add	%o4,	%i0,	%i2
	ldsb	[%l7 + 0x46],	%l4
	tle	%icc,	0x2
	fandnot1	%f18,	%f14,	%f6
	udiv	%g2,	0x06D2,	%g7
	movn	%xcc,	%o0,	%g4
	fmul8x16al	%f16,	%f7,	%f30
	popc	%g5,	%o7
	fbuge	%fcc3,	loop_523
	movrlez	%g3,	0x3B1,	%o3
	brgez	%g1,	loop_524
	nop
	set	0x12, %i7
	sth	%l2,	[%l7 + %i7]
loop_523:
	orncc	%g6,	0x0ABC,	%i6
	tl	%xcc,	0x0
loop_524:
	fnand	%f20,	%f4,	%f28
	tg	%icc,	0x1
	swap	[%l7 + 0x6C],	%i3
	movrlez	%l6,	0x30A,	%i1
	movrgez	%o5,	%o6,	%o1
	movrlz	%l1,	0x31E,	%l3
	popc	%l5,	%i4
	sethi	0x1BD9,	%o2
	st	%f20,	[%l7 + 0x14]
	fmovdle	%icc,	%f27,	%f19
	fone	%f4
	fbug,a	%fcc1,	loop_525
	fmovd	%f6,	%f24
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x24,	%i4
loop_525:
	edge16	%i7,	%l0,	%i0
	fmovrsne	%i2,	%f12,	%f28
	subcc	%l4,	%o4,	%g2
	srax	%o0,	%g7,	%g5
	set	0x0E, %g6
	stha	%o7,	[%l7 + %g6] 0x89
	fcmpgt32	%f4,	%f22,	%g3
	tvs	%icc,	0x6
	ldsb	[%l7 + 0x49],	%o3
	nop
	set	0x2C, %g1
	lduw	[%l7 + %g1],	%g1
	fcmpne32	%f26,	%f26,	%g4
	bcc	%icc,	loop_526
	tneg	%xcc,	0x5
	fmovdg	%icc,	%f4,	%f17
	fmovsg	%icc,	%f13,	%f12
loop_526:
	fmovsgu	%xcc,	%f11,	%f2
	movneg	%icc,	%g6,	%i6
	add	%l2,	%l6,	%i1
	fbug	%fcc3,	loop_527
	bvs,a	loop_528
	edge8l	%i3,	%o6,	%o1
	sra	%l1,	0x1A,	%l3
loop_527:
	fmovdl	%xcc,	%f29,	%f23
loop_528:
	mulx	%o5,	0x1E6E,	%l5
	fsrc2s	%f22,	%f10
	umulcc	%i4,	0x1981,	%i5
	bleu,a,pn	%xcc,	loop_529
	sll	%o2,	0x0B,	%l0
	tge	%icc,	0x2
	fcmpes	%fcc2,	%f0,	%f2
loop_529:
	bne,a	loop_530
	fbg,a	%fcc2,	loop_531
	fmovdleu	%xcc,	%f15,	%f4
	movne	%xcc,	%i7,	%i2
loop_530:
	udivx	%i0,	0x0895,	%l4
loop_531:
	array8	%o4,	%g2,	%g7
	fmovsg	%icc,	%f6,	%f10
	fbule,a	%fcc3,	loop_532
	andcc	%g5,	%o0,	%g3
	tpos	%xcc,	0x5
	tsubcc	%o3,	0x17F4,	%g1
loop_532:
	edge8n	%o7,	%g6,	%i6
	tle	%icc,	0x7
	fbne	%fcc3,	loop_533
	fxor	%f24,	%f30,	%f18
	fcmps	%fcc0,	%f31,	%f29
	tcc	%icc,	0x6
loop_533:
	movl	%xcc,	%l2,	%l6
	fzeros	%f13
	fpadd16	%f8,	%f2,	%f22
	tge	%icc,	0x0
	movpos	%icc,	%i1,	%g4
	tleu	%icc,	0x1
	tpos	%xcc,	0x6
	fpack32	%f20,	%f16,	%f8
	nop
	setx	loop_534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsneg	%icc,	%f23,	%f30
	fxor	%f4,	%f22,	%f4
	sra	%o6,	0x13,	%i3
loop_534:
	sllx	%o1,	%l3,	%o5
	fbue	%fcc2,	loop_535
	tle	%icc,	0x4
	ldd	[%l7 + 0x78],	%l4
	movne	%icc,	%i4,	%i5
loop_535:
	fcmpgt16	%f16,	%f16,	%o2
	movneg	%icc,	%l1,	%l0
	fmovrslz	%i2,	%f9,	%f28
	xnorcc	%i7,	%i0,	%l4
	movrne	%o4,	0x382,	%g7
	tge	%icc,	0x5
	tpos	%xcc,	0x3
	move	%xcc,	%g5,	%g2
	taddcctv	%o0,	0x147F,	%o3
	siam	0x1
	edge8ln	%g1,	%o7,	%g6
	movgu	%icc,	%g3,	%l2
	fbuge	%fcc2,	loop_536
	tne	%xcc,	0x5
	brlez,a	%l6,	loop_537
	membar	0x1D
loop_536:
	and	%i6,	0x047B,	%g4
	fmul8sux16	%f20,	%f4,	%f10
loop_537:
	edge32n	%o6,	%i3,	%o1
	fmovdcc	%icc,	%f16,	%f19
	swap	[%l7 + 0x08],	%i1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x15] %asi,	%o5
	taddcctv	%l3,	%l5,	%i5
	fornot1s	%f1,	%f2,	%f28
	fmovrde	%i4,	%f14,	%f30
	fcmpes	%fcc1,	%f27,	%f9
	tg	%icc,	0x1
	movvc	%icc,	%o2,	%l0
	subcc	%i2,	%i7,	%l1
	fxors	%f10,	%f12,	%f25
	ldd	[%l7 + 0x18],	%l4
	alignaddr	%i0,	%o4,	%g5
	alignaddr	%g2,	%g7,	%o3
	xnorcc	%g1,	0x0478,	%o7
	set	0x10, %o0
	swapa	[%l7 + %o0] 0x19,	%g6
	subcc	%o0,	%l2,	%g3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i6
	tleu	%icc,	0x3
	bpos,a	loop_538
	fands	%f12,	%f1,	%f4
	fmovrsne	%g4,	%f8,	%f1
	alignaddr	%o6,	%l6,	%o1
loop_538:
	bpos,pn	%icc,	loop_539
	fnot2	%f18,	%f26
	xnor	%i3,	0x0787,	%o5
	movrgez	%l3,	0x077,	%l5
loop_539:
	tneg	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%i1
	ldsw	[%l7 + 0x18],	%i5
	fnand	%f20,	%f6,	%f10
	addc	%i4,	%o2,	%i2
	edge16l	%l0,	%i7,	%l4
	bcs,pn	%xcc,	loop_540
	fzero	%f10
	udivx	%l1,	0x0EE3,	%i0
	popc	0x0255,	%o4
loop_540:
	fblg,a	%fcc1,	loop_541
	edge8	%g2,	%g5,	%g7
	te	%xcc,	0x5
	smulcc	%o3,	0x0629,	%o7
loop_541:
	nop
	wr	%g0,	0x80,	%asi
	stha	%g6,	[%l7 + 0x3E] %asi
	nop
	setx	loop_542,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbuge	%fcc2,	loop_543
	andncc	%o0,	%g1,	%l2
	fmuld8sux16	%f19,	%f15,	%f26
loop_542:
	edge32l	%g3,	%i6,	%g4
loop_543:
	stbar
	tsubcc	%l6,	%o6,	%i3
	orn	%o5,	%l3,	%l5
	movgu	%icc,	%o1,	%i1
	smulcc	%i5,	%o2,	%i2
	movre	%i4,	%i7,	%l0
	popc	0x1736,	%l4
	brlez,a	%i0,	loop_544
	sllx	%l1,	%g2,	%g5
	fmovdleu	%icc,	%f25,	%f25
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g7,	%o4
loop_544:
	tpos	%icc,	0x2
	fmovdvc	%xcc,	%f29,	%f31
	fabss	%f18,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%o3
	set	0x6C, %g5
	sta	%f0,	[%l7 + %g5] 0x04
	popc	%o7,	%o0
	movne	%xcc,	%g6,	%g1
	tsubcc	%l2,	%g3,	%g4
	sdiv	%i6,	0x01D1,	%o6
	srl	%l6,	0x14,	%o5
	stx	%l3,	[%l7 + 0x48]
	array16	%i3,	%l5,	%o1
	array16	%i5,	%i1,	%i2
	tleu	%xcc,	0x6
	andn	%i4,	%o2,	%l0
	fnot2s	%f1,	%f0
	fmovde	%xcc,	%f26,	%f9
	tleu	%icc,	0x1
	smulcc	%i7,	%i0,	%l4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x31] %asi,	%l1
	fxors	%f17,	%f1,	%f2
	andcc	%g5,	0x0BB4,	%g2
	fnot2	%f24,	%f24
	bvs,pt	%icc,	loop_545
	fandnot1s	%f22,	%f1,	%f17
	andn	%o4,	0x14EC,	%g7
	udivx	%o7,	0x0176,	%o3
loop_545:
	fnot2	%f6,	%f2
	or	%g6,	%o0,	%l2
	sdiv	%g1,	0x0D77,	%g4
	subc	%g3,	%i6,	%l6
	fone	%f8
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	ldsh	[%l7 + 0x7E],	%o6
	fmovdcc	%xcc,	%f7,	%f25
	fmovdn	%xcc,	%f20,	%f21
	movcc	%xcc,	%i3,	%l5
	fnands	%f28,	%f31,	%f11
	fcmps	%fcc3,	%f21,	%f16
	addccc	%o1,	%i5,	%i1
	umul	%i2,	0x115C,	%i4
	fzeros	%f29
	set	0x08, %l6
	ldswa	[%l7 + %l6] 0x80,	%l3
	fba	%fcc0,	loop_546
	fzeros	%f20
	subcc	%o2,	0x0F45,	%l0
	subcc	%i0,	%l4,	%l1
loop_546:
	tneg	%icc,	0x5
	sllx	%g5,	0x01,	%g2
	movvc	%icc,	%i7,	%g7
	sth	%o4,	[%l7 + 0x60]
	move	%xcc,	%o7,	%o3
	call	loop_547
	movvs	%icc,	%g6,	%o0
	fmul8ulx16	%f16,	%f12,	%f26
	sdivcc	%g1,	0x00B9,	%l2
loop_547:
	fblg	%fcc2,	loop_548
	prefetch	[%l7 + 0x64],	 0x1
	subccc	%g4,	0x1931,	%i6
	srlx	%g3,	%l6,	%o6
loop_548:
	ldsh	[%l7 + 0x1E],	%i3
	fnot2s	%f27,	%f3
	movne	%icc,	%l5,	%o1
	tn	%icc,	0x5
	edge16l	%i5,	%o5,	%i1
	movge	%xcc,	%i4,	%l3
	array8	%o2,	%i2,	%i0
	xorcc	%l4,	%l0,	%l1
	movle	%icc,	%g2,	%g5
	ldx	[%l7 + 0x70],	%g7
	sllx	%o4,	%i7,	%o7
	fmul8sux16	%f4,	%f16,	%f22
	fornot2	%f20,	%f24,	%f4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%o3
	edge16ln	%g6,	%o0,	%l2
	sdivcc	%g4,	0x07D9,	%i6
	bshuffle	%f14,	%f16,	%f16
	fmovdn	%icc,	%f27,	%f26
	edge16ln	%g3,	%l6,	%g1
	bne	loop_549
	andncc	%i3,	%o6,	%o1
	tge	%icc,	0x7
	subccc	%l5,	0x003C,	%o5
loop_549:
	fnot2	%f12,	%f14
	or	%i1,	0x1588,	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i4,	%l3
	subccc	%o2,	%i2,	%i0
	fornot1	%f8,	%f26,	%f30
	edge16ln	%l4,	%l0,	%l1
	fbl,a	%fcc3,	loop_550
	movl	%xcc,	%g5,	%g2
	bne,a	%xcc,	loop_551
	membar	0x21
loop_550:
	ble,pn	%icc,	loop_552
	fmovsa	%icc,	%f20,	%f15
loop_551:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%g7
loop_552:
	udivcc	%o4,	0x1D1A,	%o7
	fors	%f26,	%f11,	%f24
	fmovrdlez	%o3,	%f0,	%f2
	edge8	%g6,	%o0,	%l2
	umulcc	%i7,	%g4,	%g3
	fmovdg	%xcc,	%f13,	%f6
	fnands	%f18,	%f27,	%f15
	lduh	[%l7 + 0x10],	%i6
	movcc	%icc,	%l6,	%i3
	fmovrdlez	%o6,	%f28,	%f28
	sdivcc	%o1,	0x0F80,	%g1
	fmovrdlez	%o5,	%f2,	%f6
	fxors	%f19,	%f30,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i1,	0x14C1,	%i5
	tge	%xcc,	0x2
	fxnors	%f3,	%f17,	%f12
	sub	%l5,	%i4,	%o2
	edge32n	%i2,	%l3,	%l4
	fnot1s	%f3,	%f1
	tneg	%icc,	0x5
	mulx	%i0,	%l1,	%g5
	and	%g2,	0x0C80,	%g7
	fmovde	%icc,	%f28,	%f8
	movgu	%icc,	%o4,	%o7
	sir	0x0E66
	tge	%icc,	0x0
	te	%icc,	0x1
	xnorcc	%l0,	0x1233,	%o3
	fmovdcs	%icc,	%f2,	%f4
	andn	%o0,	0x0E0F,	%g6
	bvc	loop_553
	edge16ln	%l2,	%g4,	%g3
	fbl	%fcc1,	loop_554
	fandnot2s	%f26,	%f22,	%f12
loop_553:
	orn	%i6,	0x199C,	%i7
	tl	%icc,	0x7
loop_554:
	subcc	%i3,	%o6,	%l6
	set	0x18, %o5
	sta	%f18,	[%l7 + %o5] 0x80
	movre	%g1,	%o1,	%o5
	fbne	%fcc2,	loop_555
	tpos	%icc,	0x2
	movleu	%icc,	%i5,	%l5
	xorcc	%i4,	%o2,	%i2
loop_555:
	tsubcctv	%l3,	%i1,	%i0
	fbn	%fcc1,	loop_556
	movle	%icc,	%l4,	%l1
	bgu,pn	%xcc,	loop_557
	fble,a	%fcc0,	loop_558
loop_556:
	nop
	setx loop_559, %l0, %l1
	jmpl %l1, %g5
	fcmpeq32	%f28,	%f30,	%g2
loop_557:
	xnor	%g7,	0x02A7,	%o7
loop_558:
	addc	%o4,	%l0,	%o3
loop_559:
	be,pn	%icc,	loop_560
	tvs	%xcc,	0x4
	xorcc	%o0,	%l2,	%g6
	fpsub32s	%f5,	%f24,	%f8
loop_560:
	tsubcctv	%g4,	0x0003,	%g3
	movrgez	%i6,	%i3,	%o6
	movcc	%xcc,	%i7,	%l6
	sllx	%g1,	0x0E,	%o1
	srl	%o5,	0x15,	%i5
	tl	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	stwa	%i4,	[%l7 + 0x48] %asi
	movgu	%icc,	%o2,	%l5
	fbn	%fcc3,	loop_561
	umulcc	%l3,	0x114C,	%i2
	set	0x59, %g2
	ldsba	[%l7 + %g2] 0x10,	%i1
loop_561:
	edge8l	%i0,	%l4,	%l1
	tpos	%xcc,	0x7
	movre	%g5,	%g7,	%o7
	set	0x0E, %i0
	ldstuba	[%l7 + %i0] 0x0c,	%o4
	fbo,a	%fcc3,	loop_562
	edge32ln	%l0,	%o3,	%o0
	tneg	%icc,	0x2
	srax	%g2,	0x16,	%g6
loop_562:
	movge	%xcc,	%g4,	%g3
	tne	%xcc,	0x7
	ldx	[%l7 + 0x48],	%l2
	sll	%i6,	0x13,	%o6
	ta	%icc,	0x5
	fmovsgu	%icc,	%f25,	%f4
	and	%i3,	%l6,	%i7
	movre	%g1,	%o5,	%i5
	ldsw	[%l7 + 0x58],	%o1
	set	0x7C, %g7
	lda	[%l7 + %g7] 0x88,	%f2
	tn	%icc,	0x1
	edge16n	%o2,	%l5,	%l3
	mulx	%i2,	0x08EC,	%i4
	tle	%xcc,	0x6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%i0
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x78] %asi,	%i1
	xnor	%l4,	0x15AB,	%l1
	fxnor	%f0,	%f12,	%f2
	alignaddr	%g5,	%o7,	%o4
	set	0x40, %o1
	ldswa	[%l7 + %o1] 0x89,	%l0
	movrgz	%g7,	0x1EC,	%o3
	edge8n	%g2,	%o0,	%g6
	sllx	%g4,	%l2,	%i6
	edge16ln	%o6,	%g3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i7,	%i3,	%o5
	addcc	%i5,	%o1,	%o2
	sll	%g1,	0x13,	%l3
	set	0x54, %i6
	sta	%f11,	[%l7 + %i6] 0x18
	movne	%icc,	%l5,	%i4
	bleu,pn	%xcc,	loop_563
	ldstub	[%l7 + 0x54],	%i2
	bge,pn	%xcc,	loop_564
	bn,pn	%icc,	loop_565
loop_563:
	movcc	%xcc,	%i1,	%i0
	edge32n	%l1,	%g5,	%o7
loop_564:
	movre	%o4,	0x2CD,	%l4
loop_565:
	srl	%l0,	%o3,	%g7
	addcc	%o0,	0x14D0,	%g6
	fcmpgt16	%f2,	%f4,	%g2
	edge32ln	%g4,	%l2,	%o6
	nop
	setx loop_566, %l0, %l1
	jmpl %l1, %i6
	fnot1	%f18,	%f16
	nop
	setx loop_567, %l0, %l1
	jmpl %l1, %l6
	ldstub	[%l7 + 0x39],	%g3
loop_566:
	movge	%xcc,	%i3,	%i7
	tleu	%xcc,	0x7
loop_567:
	fmovrsgez	%o5,	%f7,	%f24
	fcmple16	%f2,	%f10,	%i5
	srl	%o2,	0x1C,	%g1
	sethi	0x07CC,	%l3
	fxnor	%f16,	%f2,	%f18
	sir	0x0BD5
	movrlz	%o1,	%l5,	%i4
	brgez	%i1,	loop_568
	movvs	%xcc,	%i2,	%l1
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_568:
	sdivcc	%i0,	0x0F42,	%g5
	sdivcc	%o7,	0x0C02,	%l4
	edge16l	%o4,	%o3,	%l0
	set	0x1E, %i2
	lduha	[%l7 + %i2] 0x89,	%o0
	array8	%g6,	%g7,	%g4
	stbar
	andncc	%g2,	%l2,	%i6
	orn	%o6,	%g3,	%i3
	fsrc2	%f22,	%f10
	fandnot1s	%f2,	%f13,	%f30
	tcc	%icc,	0x6
	addc	%l6,	0x00B8,	%o5
	movge	%icc,	%i5,	%i7
	sra	%g1,	%o2,	%l3
	tpos	%xcc,	0x4
	orncc	%o1,	0x1B15,	%i4
	tvs	%icc,	0x0
	sir	0x0E32
	movre	%l5,	0x3F5,	%i2
	add	%i1,	%i0,	%g5
	taddcc	%l1,	0x1E0D,	%l4
	be,a	loop_569
	movpos	%icc,	%o4,	%o3
	tvs	%xcc,	0x3
	movg	%xcc,	%o7,	%l0
loop_569:
	call	loop_570
	stb	%o0,	[%l7 + 0x23]
	xnorcc	%g6,	%g7,	%g2
	umul	%g4,	0x1E6E,	%i6
loop_570:
	bne,pn	%xcc,	loop_571
	edge32l	%l2,	%g3,	%o6
	move	%icc,	%l6,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%i5
loop_571:
	fone	%f28
	xorcc	%i7,	0x1148,	%g1
	fornot1	%f26,	%f8,	%f18
	smul	%l3,	%o2,	%i4
	movvs	%icc,	%o1,	%i2
	nop
	setx	loop_572,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%icc,	0x3
	edge32ln	%l5,	%i0,	%i1
	movrgz	%l1,	0x072,	%g5
loop_572:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f2,	%f26
	udiv	%o4,	0x04FC,	%o3
	edge32ln	%o7,	%l4,	%o0
	fnand	%f6,	%f2,	%f20
	movrgz	%g6,	0x092,	%g7
	fmovsneg	%xcc,	%f16,	%f21
	and	%l0,	0x15AF,	%g2
	array32	%g4,	%i6,	%l2
	nop
	setx loop_573, %l0, %l1
	jmpl %l1, %o6
	ble,a,pt	%xcc,	loop_574
	movrlez	%g3,	%l6,	%i3
	fnors	%f29,	%f25,	%f5
loop_573:
	smul	%o5,	0x02B6,	%i5
loop_574:
	lduw	[%l7 + 0x5C],	%i7
	sdiv	%g1,	0x0AD5,	%l3
	bge,pn	%xcc,	loop_575
	edge32n	%o2,	%i4,	%i2
	ldub	[%l7 + 0x3B],	%l5
	fpsub16s	%f27,	%f10,	%f21
loop_575:
	nop
	setx loop_576, %l0, %l1
	jmpl %l1, %i0
	tsubcctv	%i1,	%o1,	%g5
	movneg	%icc,	%l1,	%o4
	tneg	%icc,	0x1
loop_576:
	subccc	%o7,	%o3,	%l4
	te	%xcc,	0x0
	andn	%g6,	0x1718,	%g7
	edge8ln	%o0,	%l0,	%g4
	sllx	%i6,	%l2,	%g2
	sth	%g3,	[%l7 + 0x0A]
	orncc	%l6,	%o6,	%i3
	array32	%o5,	%i7,	%i5
	edge16l	%l3,	%g1,	%i4
	sdiv	%i2,	0x04E8,	%l5
	tn	%xcc,	0x6
	movre	%o2,	%i1,	%i0
	fbn,a	%fcc1,	loop_577
	fbu,a	%fcc2,	loop_578
	fmovdl	%icc,	%f9,	%f27
	fcmpne16	%f30,	%f24,	%g5
loop_577:
	ldstub	[%l7 + 0x09],	%o1
loop_578:
	tl	%icc,	0x4
	movrgez	%o4,	%o7,	%l1
	bshuffle	%f22,	%f18,	%f24
	tn	%xcc,	0x6
	srax	%l4,	0x1E,	%o3
	set	0x20, %i3
	ldxa	[%l7 + %i3] 0x89,	%g6
	addcc	%o0,	%g7,	%g4
	movrlez	%l0,	0x152,	%l2
	addccc	%i6,	0x140E,	%g2
	edge32l	%g3,	%o6,	%i3
	te	%icc,	0x6
	movrgz	%o5,	%i7,	%l6
	udivx	%i5,	0x0A82,	%l3
	fmovse	%icc,	%f28,	%f7
	udivcc	%g1,	0x15AC,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i2,	%l5,	%o2
	fmovspos	%xcc,	%f23,	%f3
	addc	%i1,	%g5,	%o1
	array16	%i0,	%o7,	%l1
	edge8	%l4,	%o3,	%g6
	subcc	%o4,	%o0,	%g4
	sth	%g7,	[%l7 + 0x46]
	wr	%g0,	0x88,	%asi
	stda	%l2,	[%l7 + 0x08] %asi
	subccc	%l0,	%i6,	%g3
	tpos	%xcc,	0x0
	siam	0x4
	edge16ln	%g2,	%o6,	%o5
	array16	%i3,	%l6,	%i5
	ldsb	[%l7 + 0x64],	%l3
	tg	%icc,	0x0
	udiv	%i7,	0x000A,	%i4
	subcc	%i2,	%g1,	%l5
	edge16n	%o2,	%i1,	%o1
	ldsb	[%l7 + 0x4B],	%g5
	set	0x43, %o6
	stba	%i0,	[%l7 + %o6] 0x10
	movrgez	%o7,	0x0F5,	%l4
	swap	[%l7 + 0x34],	%l1
	fmul8sux16	%f30,	%f12,	%f30
	fmovsneg	%icc,	%f11,	%f1
	brgez	%o3,	loop_579
	lduw	[%l7 + 0x70],	%o4
	edge16ln	%g6,	%o0,	%g4
	movrgz	%l2,	0x23A,	%g7
loop_579:
	nop
	set	0x64, %l1
	lduwa	[%l7 + %l1] 0x04,	%i6
	edge16n	%g3,	%l0,	%o6
	fmovrsgez	%o5,	%f22,	%f22
	sdivcc	%g2,	0x0CF3,	%l6
	fandnot1s	%f31,	%f1,	%f8
	movrlez	%i5,	%l3,	%i7
	fbu	%fcc1,	loop_580
	andncc	%i4,	%i2,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x1C, %l3
	ldsw	[%l7 + %l3],	%l5
loop_580:
	fbl,a	%fcc3,	loop_581
	alignaddrl	%o2,	%i1,	%i3
	addc	%g5,	0x0E59,	%i0
	movpos	%icc,	%o7,	%l4
loop_581:
	fbug,a	%fcc3,	loop_582
	fzero	%f12
	edge32	%o1,	%o3,	%l1
	addc	%o4,	%o0,	%g6
loop_582:
	tvc	%xcc,	0x1
	movn	%xcc,	%g4,	%g7
	flush	%l7 + 0x3C
	sub	%l2,	%i6,	%l0
	ble,pn	%icc,	loop_583
	tle	%xcc,	0x0
	sllx	%o6,	0x17,	%g3
	movrlz	%o5,	%g2,	%i5
loop_583:
	fcmpgt32	%f10,	%f2,	%l6
	tneg	%icc,	0x2
	fzero	%f4
	edge8ln	%l3,	%i7,	%i2
	set	0x78, %i1
	stwa	%i4,	[%l7 + %i1] 0x0c
	st	%f14,	[%l7 + 0x54]
	edge16n	%g1,	%o2,	%i1
	andn	%l5,	0x0E1D,	%g5
	te	%icc,	0x2
	movle	%icc,	%i3,	%o7
	umulcc	%i0,	0x04EE,	%o1
	smul	%l4,	0x0A33,	%l1
	edge32n	%o4,	%o3,	%g6
	movn	%icc,	%o0,	%g7
	sdivx	%g4,	0x070C,	%i6
	edge8ln	%l0,	%o6,	%g3
	movleu	%xcc,	%l2,	%g2
	edge8ln	%i5,	%l6,	%l3
	tsubcc	%i7,	0x1147,	%i2
	fmul8sux16	%f28,	%f0,	%f8
	udivx	%i4,	0x1191,	%o5
	sra	%g1,	%i1,	%o2
	fbn,a	%fcc0,	loop_584
	tneg	%icc,	0x4
	movcc	%icc,	%g5,	%i3
	fbne	%fcc0,	loop_585
loop_584:
	nop
	setx	loop_586,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne,a	loop_587
	std	%o6,	[%l7 + 0x10]
loop_585:
	lduh	[%l7 + 0x3A],	%i0
loop_586:
	stb	%o1,	[%l7 + 0x44]
loop_587:
	movleu	%icc,	%l4,	%l5
	fand	%f4,	%f8,	%f10
	mulx	%o4,	0x08A6,	%o3
	addccc	%g6,	%l1,	%g7
	fmovsgu	%icc,	%f3,	%f8
	taddcctv	%g4,	0x1376,	%o0
	fmovsn	%icc,	%f12,	%f10
	tleu	%icc,	0x7
	ldsb	[%l7 + 0x2E],	%i6
	brz	%l0,	loop_588
	edge8	%o6,	%l2,	%g2
	movrne	%g3,	0x25E,	%l6
	tsubcc	%l3,	0x0160,	%i7
loop_588:
	addccc	%i2,	%i5,	%i4
	fmovse	%xcc,	%f26,	%f10
	tcc	%icc,	0x5
	fbul,a	%fcc3,	loop_589
	tleu	%icc,	0x1
	sethi	0x0BB0,	%o5
	andn	%i1,	%g1,	%o2
loop_589:
	mulscc	%g5,	%i3,	%o7
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o1
	movg	%xcc,	%l4,	%i0
	tl	%xcc,	0x6
	andn	%l5,	%o4,	%g6
	subccc	%l1,	0x1C2A,	%o3
	and	%g7,	%g4,	%i6
	smulcc	%o0,	%o6,	%l0
	fmovdn	%icc,	%f13,	%f9
	add	%g2,	0x1FA4,	%l2
	movrgez	%l6,	0x165,	%g3
	tsubcc	%i7,	0x1EA2,	%l3
	fpadd32s	%f14,	%f16,	%f28
	tgu	%xcc,	0x7
	fbul,a	%fcc2,	loop_590
	fmovsvs	%icc,	%f13,	%f5
	fornot1s	%f6,	%f29,	%f20
	xor	%i5,	0x012C,	%i2
loop_590:
	sdiv	%i4,	0x13F1,	%i1
	tl	%icc,	0x4
	fmovsleu	%xcc,	%f31,	%f8
	fmovrdne	%g1,	%f20,	%f6
	fmovrsgez	%o5,	%f5,	%f15
	addccc	%g5,	%o2,	%i3
	sethi	0x020A,	%o7
	subcc	%l4,	%i0,	%o1
	edge8ln	%l5,	%g6,	%l1
	fnot1	%f28,	%f20
	ta	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o3,	0x130B,	%o4
	fbul,a	%fcc1,	loop_591
	bvc,pn	%icc,	loop_592
	edge32n	%g7,	%g4,	%o0
	movne	%icc,	%o6,	%l0
loop_591:
	movg	%icc,	%i6,	%g2
loop_592:
	nop
	wr	%g0,	0x10,	%asi
	stha	%l6,	[%l7 + 0x6A] %asi
	edge8	%g3,	%i7,	%l3
	fbug	%fcc3,	loop_593
	fmovdcc	%icc,	%f0,	%f31
	membar	0x13
	fba	%fcc1,	loop_594
loop_593:
	bne,a	loop_595
	sdivx	%l2,	0x1789,	%i2
	fandnot1s	%f16,	%f22,	%f23
loop_594:
	or	%i4,	%i1,	%g1
loop_595:
	bleu	%xcc,	loop_596
	bneg,a,pt	%icc,	loop_597
	array8	%o5,	%i5,	%o2
	movcc	%xcc,	%i3,	%g5
loop_596:
	bn,pt	%icc,	loop_598
loop_597:
	srl	%o7,	%i0,	%o1
	xorcc	%l5,	%g6,	%l1
	wr	%g0,	0x22,	%asi
	stda	%o2,	[%l7 + 0x28] %asi
	membar	#Sync
loop_598:
	sdiv	%o4,	0x1385,	%l4
	fexpand	%f4,	%f22
	tne	%xcc,	0x4
	edge8ln	%g7,	%g4,	%o0
	taddcctv	%l0,	0x0B92,	%i6
	movleu	%xcc,	%o6,	%g2
	bshuffle	%f2,	%f30,	%f2
	and	%g3,	0x1A93,	%l6
	bl,a,pt	%xcc,	loop_599
	fmovsl	%xcc,	%f11,	%f31
	tleu	%icc,	0x6
	edge32ln	%l3,	%l2,	%i2
loop_599:
	fba	%fcc3,	loop_600
	tgu	%icc,	0x3
	andcc	%i4,	%i7,	%g1
	fnot1s	%f5,	%f10
loop_600:
	sth	%o5,	[%l7 + 0x10]
	fnand	%f24,	%f12,	%f24
	fornot2	%f10,	%f0,	%f18
	sra	%i1,	0x1F,	%i5
	tsubcc	%i3,	%o2,	%o7
	alignaddr	%i0,	%g5,	%l5
	wr	%g0,	0x81,	%asi
	stda	%g6,	[%l7 + 0x20] %asi
	sdivcc	%l1,	0x1311,	%o1
	andncc	%o3,	%l4,	%g7
	movge	%icc,	%o4,	%g4
	srax	%l0,	%o0,	%i6
	edge8n	%o6,	%g2,	%g3
	edge32ln	%l3,	%l6,	%l2
	alignaddr	%i2,	%i4,	%i7
	fnands	%f18,	%f10,	%f4
	edge32n	%g1,	%o5,	%i5
	fbule	%fcc3,	loop_601
	fmovsneg	%icc,	%f20,	%f14
	fblg,a	%fcc3,	loop_602
	brlz,a	%i3,	loop_603
loop_601:
	bgu	loop_604
	ldd	[%l7 + 0x08],	%f10
loop_602:
	fba,a	%fcc3,	loop_605
loop_603:
	bvs,a	%icc,	loop_606
loop_604:
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%i1
	tne	%xcc,	0x3
loop_605:
	fmovrdgz	%o7,	%f2,	%f30
loop_606:
	xorcc	%o2,	%g5,	%l5
	smul	%i0,	%l1,	%g6
	tvs	%icc,	0x2
	fpack16	%f4,	%f15
	edge16	%o3,	%l4,	%g7
	addccc	%o4,	%o1,	%l0
	edge8n	%g4,	%i6,	%o0
	tg	%xcc,	0x4
	fbn	%fcc1,	loop_607
	array8	%o6,	%g3,	%g2
	fmovrslez	%l3,	%f22,	%f0
	set	0x42, %o7
	lduha	[%l7 + %o7] 0x19,	%l2
loop_607:
	lduh	[%l7 + 0x5A],	%l6
	fpsub32s	%f8,	%f26,	%f5
	srax	%i4,	%i2,	%g1
	sdivcc	%i7,	0x1B5D,	%i5
	fmovrde	%i3,	%f28,	%f18
	sdivx	%i1,	0x1B87,	%o5
	fxnors	%f5,	%f17,	%f26
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x27,	%o2
	fnor	%f8,	%f10,	%f6
	movl	%xcc,	%o7,	%g5
	tcs	%icc,	0x2
	andn	%l5,	%i0,	%g6
	array32	%l1,	%o3,	%g7
	bcc	%icc,	loop_608
	movcc	%icc,	%l4,	%o4
	ta	%icc,	0x7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%g4
loop_608:
	fmovrsgz	%i6,	%f25,	%f5
	fcmple32	%f30,	%f16,	%o0
	tpos	%xcc,	0x1
	alignaddrl	%l0,	%o6,	%g2
	movneg	%xcc,	%l3,	%l2
	fmovd	%f12,	%f26
	addcc	%g3,	%i4,	%l6
	andcc	%g1,	%i2,	%i7
	movl	%icc,	%i3,	%i1
	fbule,a	%fcc0,	loop_609
	movre	%o5,	0x118,	%i5
	fmovsge	%icc,	%f24,	%f26
	movvc	%xcc,	%o7,	%o2
loop_609:
	fmovdvc	%xcc,	%f9,	%f25
	bvc,a	loop_610
	ldub	[%l7 + 0x1D],	%l5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x22] %asi,	%g5
loop_610:
	fmovsneg	%xcc,	%f30,	%f2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%i0
	bl	loop_611
	umul	%l1,	0x137F,	%g6
	mulx	%g7,	0x037A,	%o3
	fnegs	%f23,	%f13
loop_611:
	tl	%xcc,	0x1
	fzeros	%f7
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x24,	%o4
	fmul8x16al	%f0,	%f4,	%f18
	addc	%o1,	%l4,	%i6
	stw	%o0,	[%l7 + 0x34]
	fmovsvs	%xcc,	%f9,	%f25
	sth	%l0,	[%l7 + 0x22]
	fbne,a	%fcc3,	loop_612
	fpsub32s	%f14,	%f30,	%f27
	udivx	%o6,	0x007A,	%g4
	taddcc	%g2,	0x10E8,	%l3
loop_612:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	mulscc	%g3,	0x1932,	%i4
	or	%l6,	%l2,	%g1
	fpackfix	%f20,	%f22
	fbge,a	%fcc3,	loop_613
	taddcc	%i2,	0x06A6,	%i3
	movge	%icc,	%i7,	%o5
	fbue	%fcc1,	loop_614
loop_613:
	tcc	%xcc,	0x0
	ldsh	[%l7 + 0x0E],	%i1
	edge8ln	%o7,	%i5,	%l5
loop_614:
	movrlez	%g5,	%o2,	%l1
	tn	%icc,	0x5
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%i0
	nop
	setx	loop_615,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%g7,	0x1384,	%o3
	siam	0x7
	fmovsn	%xcc,	%f5,	%f11
loop_615:
	mova	%xcc,	%o4,	%g6
	nop
	setx loop_616, %l0, %l1
	jmpl %l1, %l4
	brnz	%o1,	loop_617
	addccc	%o0,	%l0,	%o6
	umul	%g4,	0x1E98,	%i6
loop_616:
	udivx	%g2,	0x1B30,	%l3
loop_617:
	edge8ln	%i4,	%g3,	%l6
	xnor	%g1,	0x1032,	%l2
	call	loop_618
	andcc	%i2,	%i7,	%o5
	ldx	[%l7 + 0x48],	%i3
	tn	%xcc,	0x2
loop_618:
	nop
	setx	loop_619,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x78
	movvc	%icc,	%o7,	%i5
	orn	%l5,	0x14C1,	%i1
loop_619:
	movne	%xcc,	%g5,	%l1
	edge16n	%i0,	%g7,	%o3
	add	%o2,	%g6,	%o4
	tvc	%icc,	0x1
	set	0x28, %i5
	lduha	[%l7 + %i5] 0x11,	%l4
	movrne	%o0,	%o1,	%o6
	movneg	%icc,	%g4,	%l0
	movgu	%icc,	%g2,	%l3
	movcs	%xcc,	%i4,	%g3
	srl	%l6,	%i6,	%l2
	movneg	%xcc,	%g1,	%i7
	be	%icc,	loop_620
	addc	%i2,	%i3,	%o7
	membar	0x76
	sdiv	%o5,	0x1A02,	%i5
loop_620:
	addc	%i1,	%g5,	%l1
	edge32l	%l5,	%i0,	%o3
	fone	%f12
	bleu,pn	%icc,	loop_621
	bne	loop_622
	fbuge	%fcc3,	loop_623
	bleu,pn	%xcc,	loop_624
loop_621:
	fbug	%fcc2,	loop_625
loop_622:
	bleu	loop_626
loop_623:
	movn	%xcc,	%o2,	%g7
loop_624:
	bleu,a,pn	%xcc,	loop_627
loop_625:
	edge16n	%o4,	%g6,	%l4
loop_626:
	tpos	%icc,	0x4
	alignaddrl	%o1,	%o0,	%o6
loop_627:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f10,	%f28,	%f8
	nop
	setx loop_628, %l0, %l1
	jmpl %l1, %g4
	fmovrslz	%g2,	%f15,	%f16
	movrgez	%l0,	0x154,	%i4
	udivcc	%l3,	0x0F7D,	%g3
loop_628:
	srlx	%i6,	%l6,	%g1
	addc	%i7,	%i2,	%l2
	alignaddr	%o7,	%o5,	%i3
	movgu	%xcc,	%i5,	%i1
	edge8ln	%g5,	%l5,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1A57,	%o3
	popc	%l1,	%o2
	fnors	%f19,	%f13,	%f23
	mulx	%g7,	0x139A,	%g6
	tneg	%xcc,	0x6
	movre	%l4,	%o4,	%o0
	fand	%f28,	%f22,	%f4
	tvs	%xcc,	0x6
	tcc	%xcc,	0x1
	mova	%icc,	%o6,	%o1
	tvs	%icc,	0x5
	addc	%g4,	%g2,	%l0
	bcc	loop_629
	fpack32	%f0,	%f26,	%f2
	movl	%icc,	%l3,	%i4
	fpadd32	%f8,	%f0,	%f12
loop_629:
	fblg,a	%fcc2,	loop_630
	sir	0x1D42
	subcc	%i6,	%g3,	%l6
	sethi	0x1DD0,	%g1
loop_630:
	sra	%i2,	0x06,	%i7
	movrgz	%l2,	0x3AB,	%o7
	tgu	%xcc,	0x5
	fnand	%f10,	%f8,	%f10
	or	%i3,	0x0709,	%i5
	sub	%o5,	%g5,	%i1
	movrgez	%l5,	0x0B4,	%i0
	brgez,a	%l1,	loop_631
	edge8n	%o3,	%o2,	%g6
	set	0x18, %o3
	ldswa	[%l7 + %o3] 0x14,	%l4
loop_631:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	edge16l	%g7,	%o0,	%o1
	udivcc	%g4,	0x00E3,	%g2
	addcc	%o6,	%l3,	%l0
	ldsh	[%l7 + 0x52],	%i4
	tvc	%xcc,	0x2
	fmovdvs	%icc,	%f13,	%f18
	sra	%i6,	%l6,	%g1
	fmovrse	%i2,	%f26,	%f5
	edge8n	%i7,	%l2,	%g3
	bn,pt	%xcc,	loop_632
	udivx	%o7,	0x0F63,	%i3
	tge	%icc,	0x0
	fpadd16s	%f29,	%f20,	%f5
loop_632:
	andncc	%i5,	%g5,	%i1
	alignaddr	%o5,	%l5,	%l1
	sll	%i0,	%o2,	%o3
	lduh	[%l7 + 0x76],	%g6
	taddcc	%l4,	0x18EF,	%g7
	edge32	%o4,	%o1,	%g4
	bge,a,pn	%xcc,	loop_633
	sllx	%g2,	%o0,	%l3
	fmovrsgz	%o6,	%f9,	%f12
	fbge	%fcc2,	loop_634
loop_633:
	fsrc1	%f18,	%f20
	movrlez	%l0,	0x331,	%i6
	movn	%xcc,	%l6,	%i4
loop_634:
	lduh	[%l7 + 0x0A],	%i2
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%i7
	fcmpes	%fcc0,	%f16,	%f0
	tg	%xcc,	0x4
	siam	0x3
	bleu	loop_635
	stw	%g1,	[%l7 + 0x54]
	xnor	%g3,	%o7,	%i3
	fmovrsgz	%l2,	%f9,	%f15
loop_635:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g5,	0x02,	%i5
	std	%i0,	[%l7 + 0x70]
	fbu	%fcc3,	loop_636
	movn	%xcc,	%l5,	%l1
	movcc	%icc,	%i0,	%o2
	fandnot2s	%f18,	%f15,	%f28
loop_636:
	edge8	%o5,	%g6,	%o3
	array8	%l4,	%o4,	%o1
	fnegd	%f8,	%f6
	fbe	%fcc2,	loop_637
	array16	%g7,	%g2,	%o0
	tpos	%icc,	0x7
	movleu	%icc,	%g4,	%l3
loop_637:
	movcc	%icc,	%o6,	%l0
	addc	%i6,	0x11AD,	%l6
	fmovd	%f26,	%f4
	subcc	%i2,	0x1428,	%i7
	tpos	%icc,	0x1
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
	fmovdcc	%xcc,	%f23,	%f30
	fmovda	%icc,	%f14,	%f13
	tl	%xcc,	0x0
loop_638:
	subccc	%g1,	0x0101,	%i4
	call	loop_639
	mulscc	%o7,	%g3,	%i3
	srax	%g5,	%l2,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i1,	%l5
loop_639:
	fzeros	%f17
	mulscc	%l1,	%i0,	%o2
	bgu,pt	%icc,	loop_640
	fbge	%fcc2,	loop_641
	ldsb	[%l7 + 0x4B],	%g6
	tpos	%icc,	0x7
loop_640:
	subccc	%o3,	%o5,	%l4
loop_641:
	movrne	%o4,	0x397,	%g7
	sdivcc	%g2,	0x01D2,	%o0
	xor	%o1,	0x0BA2,	%l3
	ldx	[%l7 + 0x08],	%g4
	umulcc	%o6,	%i6,	%l0
	prefetch	[%l7 + 0x18],	 0x0
	fcmpgt16	%f26,	%f6,	%i2
	tvs	%icc,	0x4
	edge32ln	%l6,	%i7,	%g1
	lduw	[%l7 + 0x1C],	%i4
	udivcc	%o7,	0x1BE3,	%g3
	fmovsge	%icc,	%f7,	%f0
	movrne	%i3,	%l2,	%i5
	fbg,a	%fcc3,	loop_642
	brnz,a	%i1,	loop_643
	xorcc	%g5,	%l5,	%l1
	fmovrde	%i0,	%f8,	%f12
loop_642:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_643:
	fmovdn	%xcc,	%f4,	%f19
	smul	%o2,	%o3,	%o5
	movle	%icc,	%g6,	%l4
	andcc	%g7,	0x1430,	%o4
	movn	%xcc,	%g2,	%o1
	srlx	%l3,	%g4,	%o6
	sir	0x0627
	fmovsl	%icc,	%f9,	%f22
	movvc	%xcc,	%i6,	%l0
	tn	%xcc,	0x5
	fpadd16	%f12,	%f24,	%f28
	fmovsl	%icc,	%f24,	%f12
	bl,a,pt	%icc,	loop_644
	membar	0x1E
	addccc	%o0,	%l6,	%i2
	fpsub16s	%f18,	%f12,	%f19
loop_644:
	fbge,a	%fcc0,	loop_645
	srlx	%g1,	0x09,	%i4
	fnegd	%f14,	%f8
	stbar
loop_645:
	fbule,a	%fcc0,	loop_646
	movvc	%xcc,	%i7,	%g3
	bneg,a	loop_647
	edge16	%o7,	%l2,	%i5
loop_646:
	movrlz	%i1,	0x318,	%i3
	bcc,a	%icc,	loop_648
loop_647:
	umul	%g5,	0x153B,	%l5
	udivx	%l1,	0x09EE,	%i0
	fpsub32s	%f23,	%f4,	%f23
loop_648:
	fmovsa	%icc,	%f19,	%f22
	fmovdge	%icc,	%f29,	%f12
	edge16	%o3,	%o5,	%o2
	fcmpes	%fcc1,	%f17,	%f24
	andcc	%l4,	0x0652,	%g6
	nop
	set	0x70, %l0
	std	%o4,	[%l7 + %l0]
	udiv	%g2,	0x11E4,	%o1
	ta	%icc,	0x6
	movl	%icc,	%l3,	%g7
	sdiv	%o6,	0x115A,	%i6
	lduh	[%l7 + 0x14],	%l0
	lduw	[%l7 + 0x10],	%g4
	smul	%l6,	0x118D,	%o0
	movrgez	%g1,	0x36E,	%i4
	taddcctv	%i7,	0x0F76,	%g3
	fxors	%f22,	%f9,	%f19
	addcc	%i2,	%o7,	%l2
	srlx	%i1,	%i3,	%g5
	wr	%g0,	0x19,	%asi
	stba	%i5,	[%l7 + 0x42] %asi
	array32	%l1,	%i0,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o5,	%o2,	%o3
	movcs	%xcc,	%l4,	%g6
	tsubcc	%g2,	0x1602,	%o4
	tneg	%icc,	0x0
	movpos	%icc,	%l3,	%g7
	ble,a,pt	%xcc,	loop_649
	edge16l	%o6,	%o1,	%i6
	andn	%g4,	0x10B5,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%o0
loop_649:
	fmovrde	%g1,	%f24,	%f22
	std	%f8,	[%l7 + 0x30]
	faligndata	%f6,	%f30,	%f8
	bn	loop_650
	fmovsvc	%icc,	%f28,	%f22
	edge16n	%i7,	%g3,	%i2
	tsubcctv	%o7,	%l2,	%i4
loop_650:
	fandnot2s	%f27,	%f19,	%f26
	fbo,a	%fcc1,	loop_651
	udiv	%i3,	0x0CD9,	%g5
	ba,a,pn	%xcc,	loop_652
	or	%i1,	0x0CEC,	%l1
loop_651:
	movne	%xcc,	%i5,	%i0
	mulx	%o5,	%l5,	%o2
loop_652:
	fmovscc	%xcc,	%f27,	%f6
	tn	%xcc,	0x4
	set	0x20, %o4
	stha	%l4,	[%l7 + %o4] 0x2a
	membar	#Sync
	movgu	%xcc,	%g6,	%o3
	or	%o4,	%g2,	%l3
	wr	%g0,	0x89,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
	fands	%f20,	%f5,	%f20
	udivx	%g7,	0x08BB,	%o1
	fble,a	%fcc3,	loop_653
	andcc	%i6,	0x1C1B,	%l6
	ldd	[%l7 + 0x48],	%f18
	andncc	%l0,	%o0,	%g1
loop_653:
	fmul8sux16	%f6,	%f22,	%f8
	fbul,a	%fcc1,	loop_654
	movcs	%xcc,	%g4,	%i7
	fexpand	%f9,	%f12
	movn	%icc,	%g3,	%i2
loop_654:
	movre	%o7,	0x1FA,	%i4
	tgu	%xcc,	0x1
	smulcc	%i3,	%l2,	%g5
	fnot2s	%f19,	%f22
	udivcc	%i1,	0x0B0A,	%i5
	movcs	%icc,	%l1,	%i0
	fbuge	%fcc1,	loop_655
	movn	%xcc,	%o5,	%l5
	nop
	setx loop_656, %l0, %l1
	jmpl %l1, %o2
	nop
	setx loop_657, %l0, %l1
	jmpl %l1, %l4
loop_655:
	movcs	%icc,	%o3,	%o4
	bcc,a,pt	%xcc,	loop_658
loop_656:
	xnor	%g2,	0x03AE,	%g6
loop_657:
	xor	%o6,	0x12AA,	%g7
	movge	%xcc,	%o1,	%l3
loop_658:
	tn	%icc,	0x7
	fmovsle	%xcc,	%f15,	%f9
	bgu,a,pn	%icc,	loop_659
	fmovdne	%xcc,	%f17,	%f1
	sdivcc	%l6,	0x00B4,	%i6
	umul	%o0,	0x0305,	%g1
loop_659:
	edge16ln	%g4,	%l0,	%i7
	bl	loop_660
	edge16l	%i2,	%g3,	%o7
	fmovsvc	%icc,	%f6,	%f1
	tvc	%xcc,	0x5
loop_660:
	movrne	%i4,	%l2,	%i3
	sllx	%g5,	0x19,	%i1
	movpos	%xcc,	%i5,	%l1
	edge16l	%o5,	%i0,	%o2
	edge16l	%l5,	%o3,	%l4
	array16	%g2,	%g6,	%o6
	fnand	%f20,	%f16,	%f26
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o4
	membar	0x43
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%o1
	st	%f26,	[%l7 + 0x58]
	fpsub32s	%f4,	%f25,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x20, %i7
	sta	%f14,	[%l7 + %i7] 0x18
	movre	%l3,	%i6,	%o0
	faligndata	%f6,	%f30,	%f30
	edge8n	%l6,	%g4,	%g1
	tcc	%xcc,	0x3
	swap	[%l7 + 0x14],	%i7
	fmovdl	%xcc,	%f26,	%f26
	fcmpne32	%f6,	%f16,	%i2
	bg	%icc,	loop_661
	bleu,pn	%icc,	loop_662
	fbug,a	%fcc0,	loop_663
	fandnot2	%f4,	%f22,	%f16
loop_661:
	prefetch	[%l7 + 0x7C],	 0x1
loop_662:
	fsrc2s	%f27,	%f9
loop_663:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x50] %asi,	%f2
	movg	%icc,	%l0,	%o7
	smul	%l2,	0x15B5,	%i3
	set	0x19, %l4
	ldsba	[%l7 + %l4] 0x0c,	%g5
	mulx	%i1,	0x084E,	%i4
	or	%l1,	%o5,	%i5
	prefetch	[%l7 + 0x08],	 0x2
	fbn,a	%fcc1,	loop_664
	fmovdn	%icc,	%f5,	%f30
	fpack32	%f6,	%f22,	%f4
	addcc	%i0,	%o2,	%l5
loop_664:
	brgz	%l4,	loop_665
	fbuge	%fcc0,	loop_666
	fmovsl	%icc,	%f27,	%f11
	for	%f0,	%f26,	%f4
loop_665:
	movrgz	%o3,	0x21E,	%g2
loop_666:
	fornot2s	%f31,	%f1,	%f12
	fmovd	%f24,	%f6
	array16	%g6,	%o4,	%g7
	sir	0x1346
	taddcctv	%o6,	0x1213,	%l3
	tsubcctv	%i6,	%o0,	%l6
	subcc	%g4,	%o1,	%i7
	fmovsge	%icc,	%f30,	%f8
	tcs	%xcc,	0x1
	fnegd	%f30,	%f30
	bge,pt	%icc,	loop_667
	mova	%xcc,	%i2,	%g3
	ld	[%l7 + 0x60],	%f8
	movle	%icc,	%g1,	%l0
loop_667:
	movrgez	%l2,	0x193,	%o7
	ldd	[%l7 + 0x30],	%f18
	edge16n	%g5,	%i1,	%i4
	movrlz	%i3,	0x2A7,	%l1
	sll	%o5,	%i5,	%o2
	fmovscs	%xcc,	%f21,	%f0
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x2e,	%i0
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x2C] %asi
	stb	%l5,	[%l7 + 0x7E]
	bne,pt	%icc,	loop_668
	popc	0x0E68,	%l4
	movne	%icc,	%o3,	%g6
	alignaddrl	%o4,	%g2,	%o6
loop_668:
	edge8n	%l3,	%i6,	%g7
	sra	%l6,	0x02,	%o0
	move	%icc,	%g4,	%i7
	tgu	%xcc,	0x5
	for	%f8,	%f26,	%f26
	smulcc	%i2,	0x0AD3,	%o1
	tleu	%icc,	0x5
	fpsub16s	%f10,	%f0,	%f30
	movleu	%icc,	%g3,	%g1
	udiv	%l2,	0x1E12,	%l0
	movrne	%g5,	0x18E,	%i1
	addc	%o7,	%i3,	%l1
	fmovdleu	%xcc,	%f27,	%f7
	edge32n	%i4,	%i5,	%o5
	mulx	%i0,	%o2,	%l4
	xnor	%l5,	0x1FC3,	%g6
	fbue,a	%fcc1,	loop_669
	fbg	%fcc3,	loop_670
	sdivcc	%o3,	0x0E23,	%o4
	edge16	%o6,	%l3,	%g2
loop_669:
	fbl	%fcc1,	loop_671
loop_670:
	tvc	%icc,	0x6
	bvs,a	loop_672
	fcmps	%fcc2,	%f30,	%f29
loop_671:
	nop
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i6
loop_672:
	fmul8x16au	%f13,	%f3,	%f16
	addcc	%g7,	0x03BB,	%l6
	tn	%icc,	0x7
	tneg	%xcc,	0x5
	sll	%g4,	%o0,	%i7
	movcs	%xcc,	%o1,	%i2
	udivx	%g3,	0x1619,	%l2
	fmovrsgz	%g1,	%f10,	%f5
	udivcc	%g5,	0x1111,	%i1
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8l	%o7,	%l0,	%l1
	fmovdle	%xcc,	%f24,	%f0
	alignaddr	%i4,	%i5,	%o5
	sth	%i0,	[%l7 + 0x18]
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f28
	set	0x45, %i4
	lduba	[%l7 + %i4] 0x89,	%o2
	udiv	%l4,	0x1C09,	%i3
	movrlez	%l5,	0x1D6,	%g6
	addcc	%o4,	%o6,	%l3
	bgu,a	%icc,	loop_673
	edge32n	%o3,	%g2,	%g7
	fmovrslz	%l6,	%f31,	%f21
	nop
	setx	loop_674,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_673:
	bvs,pn	%xcc,	loop_675
	bne,a,pn	%xcc,	loop_676
	xnor	%g4,	0x1441,	%o0
loop_674:
	movrlez	%i6,	0x217,	%i7
loop_675:
	fcmpd	%fcc3,	%f18,	%f0
loop_676:
	fmovdgu	%icc,	%f1,	%f1
	smulcc	%i2,	%g3,	%o1
	movle	%icc,	%l2,	%g1
	fmul8ulx16	%f18,	%f26,	%f28
	wr	%g0,	0x18,	%asi
	stba	%g5,	[%l7 + 0x44] %asi
	fmul8sux16	%f30,	%f14,	%f24
	fcmple16	%f4,	%f22,	%i1
	movrlez	%o7,	0x259,	%l1
	bleu	loop_677
	movrne	%l0,	0x3DE,	%i4
	siam	0x0
	alignaddrl	%i5,	%i0,	%o2
loop_677:
	fbo	%fcc2,	loop_678
	fnot1	%f18,	%f26
	edge32	%l4,	%o5,	%i3
	tsubcctv	%l5,	0x1832,	%o4
loop_678:
	fmuld8sux16	%f1,	%f0,	%f10
	movvs	%xcc,	%g6,	%l3
	fbg	%fcc3,	loop_679
	tpos	%icc,	0x7
	sethi	0x1E66,	%o6
	array16	%g2,	%g7,	%o3
loop_679:
	tcc	%xcc,	0x1
	fone	%f8
	tge	%xcc,	0x3
	fmovde	%icc,	%f1,	%f25
	fmuld8ulx16	%f24,	%f15,	%f10
	movg	%icc,	%l6,	%o0
	movvc	%xcc,	%i6,	%i7
	addccc	%g4,	0x143E,	%g3
	movvc	%icc,	%i2,	%o1
	fbul	%fcc3,	loop_680
	tg	%icc,	0x6
	movle	%xcc,	%l2,	%g5
	add	%i1,	%g1,	%o7
loop_680:
	udivcc	%l1,	0x18A0,	%i4
	fzeros	%f31
	alignaddrl	%l0,	%i0,	%o2
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x14,	%l4
	pdist	%f28,	%f20,	%f2
	fbu	%fcc0,	loop_681
	fandnot1s	%f8,	%f12,	%f9
	brz,a	%i5,	loop_682
	tleu	%icc,	0x3
loop_681:
	fmovspos	%xcc,	%f22,	%f21
	sllx	%o5,	%i3,	%o4
loop_682:
	std	%l4,	[%l7 + 0x30]
	movge	%xcc,	%l3,	%o6
	bcs,a	%icc,	loop_683
	bpos,a	loop_684
	umul	%g6,	0x145A,	%g2
	brlz	%o3,	loop_685
loop_683:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_684:
	sllx	%g7,	0x01,	%l6
	srax	%o0,	0x10,	%i6
loop_685:
	nop
	set	0x64, %l6
	lduwa	[%l7 + %l6] 0x04,	%i7
	edge8n	%g3,	%g4,	%o1
	sll	%i2,	0x14,	%l2
	add	%i1,	0x0A97,	%g5
	movrne	%o7,	%l1,	%i4
	sir	0x1B2F
	ldstub	[%l7 + 0x78],	%l0
	sdiv	%i0,	0x02D7,	%o2
	fornot2s	%f30,	%f8,	%f0
	taddcctv	%l4,	%i5,	%o5
	fandnot1	%f8,	%f24,	%f6
	ba,a,pn	%icc,	loop_686
	fmovsne	%icc,	%f28,	%f19
	mulscc	%g1,	%i3,	%l5
	movl	%icc,	%l3,	%o4
loop_686:
	sdivx	%g6,	0x052B,	%o6
	fors	%f19,	%f24,	%f13
	fandnot1	%f16,	%f12,	%f12
	set	0x12, %o0
	ldsha	[%l7 + %o0] 0x0c,	%o3
	fmovde	%icc,	%f13,	%f7
	taddcc	%g2,	0x1CD8,	%l6
	sethi	0x038D,	%g7
	udivcc	%i6,	0x15B1,	%o0
	movneg	%icc,	%i7,	%g4
	fornot1	%f14,	%f4,	%f0
	movcc	%icc,	%o1,	%i2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%g3
	siam	0x3
	wr	%g0,	0x22,	%asi
	stda	%i0,	[%l7 + 0x18] %asi
	membar	#Sync
	movre	%g5,	%l2,	%o7
	andcc	%l1,	0x10A9,	%l0
	array8	%i4,	%i0,	%o2
	srax	%i5,	0x0E,	%l4
	tge	%xcc,	0x3
	fmovsneg	%xcc,	%f30,	%f6
	edge16ln	%o5,	%i3,	%g1
	xnor	%l5,	%o4,	%g6
	edge16	%l3,	%o3,	%g2
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f6
	fmuld8sux16	%f7,	%f1,	%f8
	fands	%f14,	%f0,	%f7
	brlz,a	%l6,	loop_687
	bpos,a,pn	%xcc,	loop_688
	mulx	%o6,	0x1560,	%g7
	andn	%o0,	%i6,	%g4
loop_687:
	nop
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x14,	 0x2
loop_688:
	fcmple32	%f8,	%f30,	%i2
	subccc	%g3,	%i1,	%o1
	tneg	%xcc,	0x7
	alignaddrl	%l2,	%o7,	%g5
	edge8	%l0,	%i4,	%i0
	tle	%icc,	0x1
	fbuge,a	%fcc2,	loop_689
	addccc	%l1,	%i5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o2,	0x0376,	%o5
loop_689:
	fnegd	%f16,	%f12
	fmovda	%xcc,	%f0,	%f8
	set	0x1C, %g7
	lda	[%l7 + %g7] 0x14,	%f4
	fcmpgt32	%f14,	%f10,	%g1
	mova	%xcc,	%i3,	%o4
	fmovd	%f16,	%f28
	smul	%l5,	%l3,	%o3
	fmovrslz	%g6,	%f25,	%f23
	andn	%g2,	0x1E95,	%l6
	movle	%icc,	%o6,	%o0
	andcc	%i6,	%g7,	%g4
	mulscc	%i2,	0x01FB,	%g3
	fabsd	%f10,	%f26
	move	%xcc,	%i1,	%o1
	membar	0x0A
	xor	%l2,	%i7,	%g5
	alignaddr	%o7,	%i4,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x0
	addc	%l0,	%l1,	%i5
	and	%o2,	%l4,	%o5
	bcs	%icc,	loop_690
	sllx	%g1,	%o4,	%l5
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x73] %asi,	%l3
loop_690:
	srax	%o3,	%i3,	%g6
	fbe	%fcc2,	loop_691
	edge32l	%l6,	%o6,	%g2
	bl	%xcc,	loop_692
	and	%o0,	%g7,	%g4
loop_691:
	movpos	%icc,	%i2,	%i6
	ldx	[%l7 + 0x38],	%g3
loop_692:
	fbge	%fcc3,	loop_693
	fzero	%f16
	sdivcc	%o1,	0x10F4,	%l2
	popc	0x1BE9,	%i1
loop_693:
	taddcctv	%i7,	0x1325,	%g5
	tg	%xcc,	0x7
	nop
	setx	loop_694,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%xcc,	0x4
	ba,a	%xcc,	loop_695
	add	%o7,	%i0,	%l0
loop_694:
	edge8	%i4,	%l1,	%o2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i5
loop_695:
	array16	%l4,	%g1,	%o4
	sll	%o5,	0x0F,	%l5
	sethi	0x194B,	%l3
	bn,a,pn	%icc,	loop_696
	orn	%o3,	%g6,	%i3
	movl	%icc,	%l6,	%o6
	movcc	%xcc,	%g2,	%o0
loop_696:
	bg	%icc,	loop_697
	edge32n	%g4,	%i2,	%g7
	tpos	%xcc,	0x6
	xor	%g3,	%o1,	%i6
loop_697:
	edge8l	%i1,	%i7,	%l2
	fmovdcs	%icc,	%f24,	%f28
	bneg,a,pt	%icc,	loop_698
	movle	%xcc,	%o7,	%i0
	orcc	%l0,	%i4,	%l1
	fmovscs	%xcc,	%f9,	%f18
loop_698:
	movrgez	%g5,	%o2,	%i5
	fmuld8sux16	%f21,	%f31,	%f0
	sub	%g1,	0x10B3,	%o4
	tsubcc	%o5,	0x1320,	%l4
	fmovse	%xcc,	%f9,	%f28
	srax	%l5,	%l3,	%o3
	sir	0x171B
	fmovse	%icc,	%f9,	%f13
	fbue,a	%fcc3,	loop_699
	tvc	%xcc,	0x6
	tl	%icc,	0x2
	fmuld8sux16	%f2,	%f30,	%f28
loop_699:
	nop
	set	0x41, %g2
	ldstuba	[%l7 + %g2] 0x10,	%i3
	te	%xcc,	0x5
	move	%icc,	%l6,	%o6
	tsubcc	%g6,	0x109F,	%o0
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x10
	xnorcc	%g2,	%g4,	%i2
	edge32ln	%g7,	%g3,	%i6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movneg	%xcc,	%i1,	%i7
	fpack32	%f30,	%f6,	%f0
	movleu	%xcc,	%o1,	%o7
	fmuld8ulx16	%f14,	%f9,	%f20
	bvc	%xcc,	loop_700
	tvc	%icc,	0x5
	stb	%l2,	[%l7 + 0x72]
	bcc	%icc,	loop_701
loop_700:
	fpadd32s	%f26,	%f28,	%f15
	tge	%xcc,	0x2
	edge8l	%l0,	%i0,	%l1
loop_701:
	fxnor	%f8,	%f24,	%f28
	or	%i4,	0x110A,	%o2
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i5
	fnegs	%f10,	%f31
	edge32n	%g1,	%o4,	%g5
	fpadd32	%f16,	%f28,	%f28
	edge32ln	%l4,	%l5,	%o5
	fabsd	%f22,	%f12
	movl	%icc,	%l3,	%i3
	tneg	%xcc,	0x2
	tcs	%xcc,	0x0
	fpadd32s	%f19,	%f12,	%f28
	edge16n	%o3,	%l6,	%o6
	edge8ln	%o0,	%g2,	%g4
	fbl,a	%fcc0,	loop_702
	fexpand	%f27,	%f2
	sdivx	%g6,	0x19A7,	%g7
	movge	%icc,	%g3,	%i2
loop_702:
	fors	%f23,	%f18,	%f13
	bne,a,pn	%icc,	loop_703
	edge16	%i6,	%i7,	%i1
	movre	%o7,	%o1,	%l2
	edge16ln	%i0,	%l0,	%l1
loop_703:
	bvc,a	%icc,	loop_704
	fpsub16	%f16,	%f18,	%f4
	tg	%icc,	0x1
	sllx	%i4,	%i5,	%g1
loop_704:
	fmovd	%f16,	%f2
	ble	%icc,	loop_705
	sdiv	%o4,	0x0EE8,	%g5
	array16	%o2,	%l5,	%l4
	movne	%icc,	%o5,	%i3
loop_705:
	movl	%icc,	%l3,	%o3
	tle	%icc,	0x1
	edge16ln	%l6,	%o0,	%g2
	fmovsneg	%xcc,	%f11,	%f30
	popc	%g4,	%g6
	set	0x14, %i2
	lduwa	[%l7 + %i2] 0x11,	%g7
	umulcc	%o6,	%g3,	%i2
	tsubcc	%i7,	0x1E87,	%i6
	umulcc	%o7,	0x0114,	%i1
	movgu	%xcc,	%o1,	%i0
	tle	%xcc,	0x1
	udiv	%l2,	0x01B4,	%l0
	sllx	%i4,	%l1,	%i5
	edge16n	%o4,	%g1,	%g5
	ldub	[%l7 + 0x13],	%o2
	nop
	setx loop_706, %l0, %l1
	jmpl %l1, %l4
	srax	%o5,	%l5,	%i3
	sub	%l3,	0x1C21,	%o3
	array8	%l6,	%o0,	%g4
loop_706:
	xor	%g2,	0x08A7,	%g6
	fbe,a	%fcc1,	loop_707
	array32	%g7,	%o6,	%g3
	wr	%g0,	0x23,	%asi
	stda	%i6,	[%l7 + 0x20] %asi
	membar	#Sync
loop_707:
	fmovdneg	%xcc,	%f3,	%f22
	movne	%xcc,	%i2,	%i6
	movvs	%icc,	%i1,	%o7
	set	0x30, %i6
	stxa	%i0,	[%l7 + %i6] 0x0c
	tl	%xcc,	0x6
	sub	%o1,	%l2,	%i4
	umul	%l0,	0x1CE1,	%l1
	edge8n	%i5,	%g1,	%o4
	fmovdge	%xcc,	%f22,	%f30
	movrlz	%o2,	0x356,	%g5
	fmovdvs	%icc,	%f11,	%f29
	edge16ln	%l4,	%l5,	%o5
	udivcc	%i3,	0x1732,	%l3
	ldd	[%l7 + 0x08],	%o2
	and	%o0,	%g4,	%g2
	tcs	%xcc,	0x3
	fmovrsgez	%l6,	%f14,	%f12
	tsubcc	%g6,	0x1004,	%o6
	fbge	%fcc0,	loop_708
	edge16l	%g7,	%g3,	%i2
	brnz	%i7,	loop_709
	fcmpgt32	%f2,	%f4,	%i1
loop_708:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x74] %asi,	%i6
loop_709:
	orcc	%o7,	%o1,	%l2
	sll	%i0,	0x0C,	%l0
	movcs	%xcc,	%l1,	%i5
	fmovd	%f2,	%f14
	ble	loop_710
	edge8n	%g1,	%i4,	%o4
	movle	%icc,	%g5,	%l4
	fones	%f3
loop_710:
	fmovscs	%xcc,	%f18,	%f18
	std	%f16,	[%l7 + 0x60]
	fone	%f4
	edge16	%l5,	%o2,	%o5
	fmovsn	%icc,	%f28,	%f18
	umulcc	%l3,	%i3,	%o3
	movcc	%xcc,	%g4,	%g2
	tcs	%xcc,	0x4
	set	0x20, %i3
	prefetcha	[%l7 + %i3] 0x14,	 0x2
	fmovsa	%icc,	%f16,	%f19
	nop
	set	0x4F, %o6
	stb	%o0,	[%l7 + %o6]
	stbar
	tneg	%xcc,	0x1
	udivcc	%o6,	0x18B5,	%g6
	edge8n	%g7,	%i2,	%i7
	edge32n	%g3,	%i6,	%o7
	sethi	0x1DF8,	%i1
	fmovscc	%xcc,	%f13,	%f29
	sdivcc	%o1,	0x1F87,	%i0
	edge16n	%l2,	%l0,	%l1
	fexpand	%f18,	%f8
	tne	%icc,	0x4
	fbo	%fcc0,	loop_711
	add	%g1,	%i5,	%i4
	fabss	%f21,	%f19
	sdiv	%g5,	0x0A49,	%o4
loop_711:
	sub	%l4,	0x1F2C,	%o2
	movne	%xcc,	%o5,	%l3
	set	0x3E, %l3
	lduha	[%l7 + %l3] 0x80,	%l5
	fsrc1s	%f25,	%f9
	stbar
	ba,pn	%xcc,	loop_712
	fandnot2	%f30,	%f28,	%f2
	movge	%icc,	%o3,	%g4
	set	0x5C, %l1
	stba	%g2,	[%l7 + %l1] 0x18
loop_712:
	movrlez	%l6,	0x317,	%o0
	subccc	%i3,	0x1F01,	%g6
	fmovsvc	%xcc,	%f13,	%f12
	sra	%o6,	0x08,	%i2
	fsrc1s	%f15,	%f13
	brnz,a	%g7,	loop_713
	bpos,a	loop_714
	and	%i7,	%i6,	%g3
	edge32n	%i1,	%o1,	%i0
loop_713:
	fxnors	%f19,	%f26,	%f4
loop_714:
	and	%o7,	0x07E1,	%l0
	fsrc2	%f30,	%f10
	edge8ln	%l1,	%g1,	%l2
	xorcc	%i4,	0x17BB,	%g5
	movcc	%icc,	%o4,	%l4
	fbg,a	%fcc1,	loop_715
	ta	%xcc,	0x2
	movcc	%icc,	%i5,	%o2
	tne	%xcc,	0x0
loop_715:
	be	loop_716
	fmovrdgez	%o5,	%f18,	%f14
	edge16ln	%l3,	%o3,	%g4
	sdivcc	%g2,	0x0CA4,	%l6
loop_716:
	array8	%o0,	%l5,	%g6
	fmovspos	%xcc,	%f19,	%f29
	brgez,a	%o6,	loop_717
	fbug	%fcc3,	loop_718
	orncc	%i2,	0x1F35,	%i3
	edge8l	%i7,	%i6,	%g7
loop_717:
	edge16n	%i1,	%o1,	%g3
loop_718:
	orcc	%i0,	%o7,	%l0
	fmovdneg	%icc,	%f12,	%f2
	fnands	%f19,	%f22,	%f12
	fmovsle	%xcc,	%f11,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g1,	%l1,	%i4
	smulcc	%l2,	%g5,	%l4
	edge16	%i5,	%o2,	%o5
	movg	%xcc,	%l3,	%o4
	sdiv	%o3,	0x12E4,	%g4
	bn,a,pt	%xcc,	loop_719
	fsrc1s	%f21,	%f20
	be	%icc,	loop_720
	subcc	%g2,	0x0F0B,	%o0
loop_719:
	edge8l	%l6,	%g6,	%o6
	set	0x28, %i1
	stda	%i2,	[%l7 + %i1] 0x27
	membar	#Sync
loop_720:
	movrlez	%l5,	0x2F3,	%i3
	andncc	%i7,	%g7,	%i1
	or	%i6,	0x0FEC,	%g3
	faligndata	%f6,	%f28,	%f14
	bneg,pt	%icc,	loop_721
	fmul8sux16	%f28,	%f12,	%f22
	subcc	%o1,	0x1189,	%o7
	fbe	%fcc2,	loop_722
loop_721:
	movvs	%xcc,	%i0,	%g1
	addc	%l1,	%i4,	%l0
	udivx	%g5,	0x1724,	%l4
loop_722:
	movgu	%xcc,	%l2,	%i5
	bneg,a,pn	%icc,	loop_723
	brz,a	%o2,	loop_724
	edge16	%o5,	%l3,	%o4
	movge	%xcc,	%g4,	%g2
loop_723:
	movle	%icc,	%o3,	%l6
loop_724:
	movneg	%xcc,	%g6,	%o0
	fmovdne	%icc,	%f20,	%f21
	fandnot1s	%f31,	%f10,	%f27
	subcc	%i2,	%o6,	%i3
	tgu	%xcc,	0x3
	fcmpgt32	%f30,	%f2,	%i7
	movge	%xcc,	%g7,	%i1
	sllx	%l5,	0x16,	%i6
	udivcc	%o1,	0x0492,	%g3
	fmovdge	%icc,	%f29,	%f28
	brlz,a	%i0,	loop_725
	brlez,a	%o7,	loop_726
	fsrc2	%f2,	%f20
	movcs	%xcc,	%l1,	%g1
loop_725:
	ldub	[%l7 + 0x08],	%l0
loop_726:
	subcc	%g5,	%i4,	%l4
	pdist	%f4,	%f14,	%f18
	sllx	%l2,	%o2,	%i5
	bg	%xcc,	loop_727
	smul	%o5,	%o4,	%g4
	sir	0x0C42
	orcc	%g2,	0x1726,	%o3
loop_727:
	movrgez	%l3,	%l6,	%o0
	tgu	%icc,	0x0
	fnegs	%f28,	%f8
	st	%f21,	[%l7 + 0x14]
	tsubcc	%i2,	0x0342,	%g6
	fmuld8ulx16	%f1,	%f11,	%f0
	fbe	%fcc0,	loop_728
	or	%i3,	0x03F7,	%i7
	move	%xcc,	%o6,	%i1
	fmovrdlez	%g7,	%f4,	%f6
loop_728:
	tneg	%xcc,	0x6
	fones	%f24
	tsubcc	%i6,	0x0960,	%o1
	xnorcc	%l5,	%g3,	%o7
	edge8n	%l1,	%g1,	%l0
	fmovrdlz	%g5,	%f6,	%f14
	movgu	%xcc,	%i4,	%i0
	tsubcc	%l2,	0x1A39,	%o2
	sdivcc	%l4,	0x0091,	%o5
	stw	%i5,	[%l7 + 0x58]
	array8	%g4,	%g2,	%o4
	tg	%icc,	0x2
	tvc	%xcc,	0x3
	fcmpeq16	%f16,	%f14,	%l3
	addccc	%l6,	%o0,	%i2
	fpadd32	%f6,	%f20,	%f28
	movvc	%xcc,	%g6,	%i3
	sethi	0x1357,	%i7
	orn	%o3,	%o6,	%g7
	sdiv	%i1,	0x1EAD,	%o1
	tge	%icc,	0x7
	sra	%l5,	0x01,	%g3
	stx	%o7,	[%l7 + 0x48]
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
	tvs	%xcc,	0x4
	lduh	[%l7 + 0x08],	%i6
	edge32ln	%g1,	%l0,	%g5
	fmovrdgz	%i4,	%f2,	%f0
	bcs	%icc,	loop_729
	movcs	%xcc,	%i0,	%l2
	movg	%icc,	%l1,	%l4
	mulx	%o5,	%i5,	%g4
loop_729:
	srlx	%o2,	%o4,	%g2
	tn	%xcc,	0x3
	fmuld8ulx16	%f9,	%f12,	%f0
	movgu	%icc,	%l3,	%o0
	andncc	%i2,	%l6,	%i3
	edge32l	%i7,	%g6,	%o6
	popc	%o3,	%g7
	alignaddrl	%i1,	%l5,	%g3
	array16	%o1,	%o7,	%i6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3F] %asi,	%g1
	fandnot2	%f8,	%f28,	%f28
	brlez	%g5,	loop_730
	brgez,a	%l0,	loop_731
	movge	%icc,	%i0,	%l2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x78] %asi,	%f24
loop_730:
	tsubcctv	%i4,	0x14E4,	%l4
loop_731:
	fbo,a	%fcc0,	loop_732
	orcc	%o5,	0x0601,	%i5
	bcs,a,pt	%icc,	loop_733
	nop
	setx	loop_734,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_732:
	sir	0x0E9D
	and	%l1,	0x0209,	%g4
loop_733:
	sth	%o2,	[%l7 + 0x1C]
loop_734:
	subccc	%g2,	0x1013,	%o4
	fandnot2s	%f19,	%f20,	%f6
	te	%icc,	0x7
	tneg	%icc,	0x7
	fmul8sux16	%f24,	%f30,	%f4
	ta	%icc,	0x4
	fnor	%f14,	%f26,	%f12
	edge8	%l3,	%o0,	%l6
	fblg	%fcc2,	loop_735
	andcc	%i2,	0x1E84,	%i7
	popc	0x1AD7,	%g6
	fabsd	%f4,	%f8
loop_735:
	tn	%xcc,	0x6
	ta	%xcc,	0x4
	edge32	%o6,	%i3,	%o3
	bshuffle	%f2,	%f0,	%f10
	call	loop_736
	udivx	%g7,	0x1C41,	%l5
	brgez	%g3,	loop_737
	bl,a,pn	%icc,	loop_738
loop_736:
	movrne	%o1,	0x393,	%o7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f0
loop_737:
	srlx	%i1,	0x1E,	%i6
loop_738:
	fandnot2s	%f4,	%f0,	%f31
	tpos	%xcc,	0x0
	sub	%g1,	0x1747,	%g5
	movg	%xcc,	%l0,	%l2
	ldub	[%l7 + 0x6F],	%i0
	sra	%i4,	0x10,	%l4
	tsubcc	%i5,	0x1BEF,	%o5
	fcmpgt32	%f6,	%f22,	%g4
	fabsd	%f30,	%f2
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
	fmovdge	%icc,	%f13,	%f25
	tgu	%icc,	0x0
	fbug	%fcc3,	loop_740
loop_739:
	movge	%xcc,	%o2,	%g2
	movg	%icc,	%l1,	%l3
	udivcc	%o4,	0x1A3F,	%l6
loop_740:
	move	%xcc,	%i2,	%o0
	movrgz	%g6,	0x2BA,	%i7
	fornot2	%f2,	%f16,	%f14
	andcc	%i3,	0x041D,	%o6
	fandnot1s	%f28,	%f12,	%f27
	tg	%xcc,	0x3
	edge8ln	%o3,	%g7,	%g3
	edge32n	%o1,	%l5,	%i1
	movl	%icc,	%o7,	%g1
	edge16l	%i6,	%g5,	%l2
	std	%i0,	[%l7 + 0x78]
	bneg,a	loop_741
	tvs	%xcc,	0x3
	array16	%i4,	%l0,	%l4
	stb	%o5,	[%l7 + 0x10]
loop_741:
	andncc	%g4,	%o2,	%i5
	orn	%l1,	%g2,	%o4
	xorcc	%l6,	%l3,	%o0
	edge16n	%i2,	%g6,	%i7
	fmovrdlz	%i3,	%f14,	%f26
	fpsub16	%f4,	%f20,	%f12
	fbug	%fcc2,	loop_742
	edge8	%o3,	%o6,	%g7
	array32	%g3,	%o1,	%i1
	fmovdge	%icc,	%f27,	%f9
loop_742:
	udivx	%o7,	0x133F,	%g1
	ba,pn	%xcc,	loop_743
	movle	%icc,	%i6,	%g5
	xor	%l5,	%l2,	%i4
	fba,a	%fcc1,	loop_744
loop_743:
	swap	[%l7 + 0x28],	%i0
	fmovdn	%xcc,	%f8,	%f22
	stbar
loop_744:
	fmovrse	%l4,	%f27,	%f20
	fnot2	%f0,	%f22
	movrlez	%o5,	%g4,	%o2
	edge16n	%l0,	%l1,	%i5
	edge8ln	%g2,	%o4,	%l6
	fmuld8sux16	%f15,	%f3,	%f14
	fmovdne	%icc,	%f8,	%f10
	edge32	%l3,	%i2,	%o0
	orn	%g6,	0x1D3D,	%i3
	bvc,pt	%xcc,	loop_745
	edge32l	%o3,	%i7,	%g7
	fmovdgu	%xcc,	%f18,	%f29
	fandnot1s	%f10,	%f20,	%f26
loop_745:
	edge16l	%o6,	%g3,	%i1
	fxnor	%f22,	%f2,	%f4
	set	0x30, %l2
	lduwa	[%l7 + %l2] 0x04,	%o1
	brgz,a	%g1,	loop_746
	udivcc	%o7,	0x1801,	%i6
	set	0x37, %o2
	lduba	[%l7 + %o2] 0x19,	%l5
loop_746:
	fnand	%f4,	%f16,	%f8
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	std	%f4,	[%l7 + 0x30]
	movl	%icc,	%i4,	%g5
	smulcc	%l4,	0x1EFF,	%i0
	fzero	%f30
	brz	%o5,	loop_747
	fmovdn	%icc,	%f22,	%f18
	tle	%icc,	0x1
	movg	%xcc,	%g4,	%o2
loop_747:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x0
	sir	0x0FBC
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l0
	mova	%icc,	%l1,	%g2
	movcc	%icc,	%o4,	%i5
	tneg	%xcc,	0x0
	fcmpne16	%f30,	%f4,	%l6
	movrlez	%i2,	%o0,	%l3
	movrne	%g6,	0x39E,	%i3
	set	0x3C, %g3
	stwa	%o3,	[%l7 + %g3] 0xeb
	membar	#Sync
	movn	%xcc,	%g7,	%i7
	fmovde	%icc,	%f17,	%f6
	srl	%g3,	0x0B,	%o6
	xnor	%o1,	0x0EE1,	%g1
	movrlz	%o7,	0x3A6,	%i6
	taddcctv	%l5,	0x07FF,	%l2
	fabss	%f19,	%f24
	flush	%l7 + 0x4C
	fpadd16s	%f4,	%f7,	%f6
	stw	%i4,	[%l7 + 0x70]
	orcc	%g5,	%i1,	%i0
	sdivcc	%l4,	0x1434,	%o5
	udivcc	%o2,	0x15A4,	%l0
	movge	%icc,	%g4,	%g2
	movg	%icc,	%l1,	%o4
	tleu	%xcc,	0x7
	orn	%i5,	0x0917,	%l6
	fpackfix	%f8,	%f17
	tvc	%xcc,	0x0
	fmovspos	%icc,	%f13,	%f21
	fsrc2s	%f22,	%f2
	tcs	%icc,	0x6
	ldd	[%l7 + 0x10],	%f24
	fmovdg	%icc,	%f20,	%f25
	movre	%o0,	0x3C3,	%i2
	fbo,a	%fcc2,	loop_748
	fbuge	%fcc2,	loop_749
	bge,pn	%icc,	loop_750
	or	%l3,	0x05F3,	%g6
loop_748:
	addcc	%i3,	%o3,	%i7
loop_749:
	array16	%g7,	%g3,	%o6
loop_750:
	bge,a	%xcc,	loop_751
	fcmpne16	%f4,	%f16,	%o1
	movle	%icc,	%o7,	%i6
	tcc	%icc,	0x6
loop_751:
	fcmple32	%f24,	%f4,	%g1
	xor	%l5,	%i4,	%g5
	std	%f14,	[%l7 + 0x10]
	and	%i1,	0x0325,	%i0
	fbule	%fcc3,	loop_752
	fmovdcs	%xcc,	%f26,	%f19
	tn	%icc,	0x5
	tn	%icc,	0x5
loop_752:
	te	%icc,	0x5
	umulcc	%l4,	0x095E,	%o5
	orcc	%l2,	%l0,	%g4
	bcs	%icc,	loop_753
	movge	%xcc,	%g2,	%o2
	alignaddr	%l1,	%i5,	%l6
	stw	%o4,	[%l7 + 0x48]
loop_753:
	tpos	%xcc,	0x7
	fnegd	%f6,	%f0
	movrlz	%o0,	%i2,	%l3
	movpos	%xcc,	%g6,	%o3
	andcc	%i3,	0x152B,	%g7
	fmovsvs	%xcc,	%f21,	%f18
	fsrc1s	%f5,	%f14
	fbul,a	%fcc3,	loop_754
	fmovrslez	%g3,	%f26,	%f27
	movrgz	%o6,	%i7,	%o1
	edge16l	%o7,	%i6,	%g1
loop_754:
	movneg	%xcc,	%i4,	%l5
	stb	%i1,	[%l7 + 0x49]
	fbg,a	%fcc0,	loop_755
	ble,a,pt	%icc,	loop_756
	fbule,a	%fcc3,	loop_757
	movpos	%xcc,	%g5,	%i0
loop_755:
	fpadd16s	%f21,	%f26,	%f2
loop_756:
	fxor	%f24,	%f14,	%f12
loop_757:
	bshuffle	%f2,	%f30,	%f16
	orn	%o5,	0x1649,	%l4
	fbuge,a	%fcc3,	loop_758
	orncc	%l0,	0x1806,	%g4
	movleu	%xcc,	%l2,	%g2
	movrlez	%l1,	%i5,	%o2
loop_758:
	fandnot1s	%f0,	%f20,	%f31
	orcc	%l6,	0x08EF,	%o4
	edge8l	%i2,	%o0,	%l3
	srl	%g6,	%o3,	%g7
	fxors	%f6,	%f16,	%f21
	fxor	%f8,	%f8,	%f30
	fmovrde	%g3,	%f26,	%f4
	brz	%i3,	loop_759
	tvs	%icc,	0x6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x6E] %asi,	%i7
loop_759:
	movl	%xcc,	%o1,	%o6
	movcs	%xcc,	%o7,	%g1
	movn	%xcc,	%i6,	%l5
	tsubcctv	%i1,	0x15FF,	%g5
	ldd	[%l7 + 0x78],	%i4
	fmovspos	%xcc,	%f1,	%f7
	fpackfix	%f20,	%f21
	fsrc1	%f28,	%f14
	movcc	%icc,	%o5,	%i0
	sll	%l0,	%g4,	%l4
	srlx	%g2,	0x0D,	%l2
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x16,	%f0
	brgz	%i5,	loop_760
	fnor	%f12,	%f26,	%f2
	srax	%o2,	%l6,	%o4
	fmovrdlz	%l1,	%f10,	%f0
loop_760:
	movre	%i2,	%o0,	%g6
	umulcc	%o3,	0x0DC0,	%g7
	fbuge,a	%fcc2,	loop_761
	tl	%icc,	0x7
	lduh	[%l7 + 0x68],	%g3
	fsrc1	%f12,	%f6
loop_761:
	sra	%i3,	0x1F,	%l3
	wr	%g0,	0x80,	%asi
	stxa	%o1,	[%l7 + 0x40] %asi
	movrlz	%i7,	0x1BE,	%o7
	xorcc	%o6,	%i6,	%g1
	subccc	%i1,	0x0995,	%g5
	xnorcc	%i4,	%l5,	%o5
	tn	%icc,	0x0
	edge32	%l0,	%i0,	%g4
	stx	%g2,	[%l7 + 0x40]
	nop
	setx	loop_762,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%l2,	0x01F8,	%i5
	edge32n	%l4,	%l6,	%o2
	fmuld8ulx16	%f6,	%f27,	%f10
loop_762:
	fnot2	%f2,	%f24
	fornot1s	%f1,	%f19,	%f1
	alignaddrl	%o4,	%l1,	%o0
	set	0x69, %o3
	stba	%g6,	[%l7 + %o3] 0x10
	taddcctv	%i2,	0x1014,	%o3
	tl	%xcc,	0x0
	tne	%icc,	0x3
	fnors	%f29,	%f23,	%f28
	fone	%f10
	edge32	%g7,	%i3,	%g3
	sra	%l3,	0x00,	%o1
	umulcc	%o7,	%i7,	%i6
	fone	%f30
	edge16l	%o6,	%i1,	%g5
	movg	%icc,	%i4,	%g1
	movpos	%icc,	%o5,	%l0
	taddcctv	%i0,	0x0D9C,	%g4
	fcmple16	%f30,	%f16,	%g2
	xnor	%l2,	%i5,	%l4
	fmovrdne	%l5,	%f8,	%f16
	ldd	[%l7 + 0x10],	%f4
	fbug	%fcc1,	loop_763
	tvs	%xcc,	0x4
	addccc	%l6,	0x1824,	%o4
	fmovrsgez	%l1,	%f13,	%f22
loop_763:
	membar	0x09
	fmovscs	%icc,	%f4,	%f22
	tsubcc	%o2,	0x1E9D,	%o0
	tvs	%icc,	0x5
	smul	%g6,	%o3,	%g7
	edge16n	%i3,	%i2,	%g3
	movvs	%icc,	%o1,	%o7
	membar	0x4F
	umulcc	%i7,	%l3,	%i6
	fmovd	%f22,	%f16
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i1
	orncc	%o6,	0x044F,	%g5
	movg	%xcc,	%i4,	%o5
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x48] %asi,	%f21
	fones	%f13
	sllx	%g1,	0x10,	%i0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x70] %asi,	%g4
	array32	%g2,	%l2,	%i5
	smul	%l4,	%l5,	%l0
	fmovdcs	%icc,	%f12,	%f24
	and	%l6,	%o4,	%l1
	taddcctv	%o0,	0x1104,	%o2
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x35] %asi,	%g6
	ldx	[%l7 + 0x40],	%g7
	movvs	%xcc,	%o3,	%i2
	tg	%xcc,	0x5
	bl,a,pt	%icc,	loop_764
	fmuld8ulx16	%f4,	%f16,	%f22
	for	%f20,	%f10,	%f12
	edge16n	%g3,	%o1,	%o7
loop_764:
	movn	%xcc,	%i3,	%l3
	tle	%xcc,	0x5
	fornot2s	%f20,	%f7,	%f12
	fnot1s	%f28,	%f11
	fmovrde	%i7,	%f18,	%f24
	fmovde	%icc,	%f20,	%f25
	xor	%i6,	%i1,	%g5
	movrlez	%o6,	%i4,	%o5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i0,	%g1
	tge	%icc,	0x0
	sllx	%g4,	0x00,	%g2
	movrgez	%l2,	%i5,	%l5
	edge32ln	%l0,	%l4,	%o4
	array32	%l1,	%o0,	%o2
	bg	%icc,	loop_765
	movn	%icc,	%g6,	%l6
	nop
	setx	loop_766,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%icc,	0x0
loop_765:
	nop
	set	0x58, %g4
	lduwa	[%l7 + %g4] 0x88,	%o3
loop_766:
	fpackfix	%f22,	%f19
	mova	%icc,	%g7,	%i2
	fbg	%fcc2,	loop_767
	edge32ln	%o1,	%o7,	%i3
	fandnot1s	%f21,	%f29,	%f12
	movcs	%xcc,	%g3,	%l3
loop_767:
	fbug	%fcc3,	loop_768
	udiv	%i7,	0x1BE0,	%i6
	fzero	%f20
	edge8n	%i1,	%o6,	%i4
loop_768:
	edge32l	%o5,	%i0,	%g1
	movl	%icc,	%g4,	%g5
	tleu	%xcc,	0x1
	pdist	%f6,	%f28,	%f2
	addccc	%l2,	0x001E,	%g2
	alignaddrl	%i5,	%l5,	%l4
	edge8l	%l0,	%o4,	%o0
	movcc	%xcc,	%o2,	%l1
	movpos	%icc,	%g6,	%o3
	movrne	%g7,	0x332,	%i2
	edge8n	%o1,	%l6,	%i3
	movvs	%xcc,	%g3,	%l3
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x14,	 0x1
	xnorcc	%i7,	0x17E3,	%i6
	movre	%i1,	%o6,	%i4
	fmovscs	%icc,	%f10,	%f27
	xorcc	%i0,	0x08AA,	%o5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	movrlez	%g4,	%l2,	%g2
	sra	%i5,	%l5,	%l4
	set	0x70, %o4
	stxa	%g5,	[%l7 + %o4] 0x27
	membar	#Sync
	fmovsn	%xcc,	%f9,	%f14
	fzeros	%f24
	movrne	%l0,	%o0,	%o4
	fcmple32	%f28,	%f30,	%l1
	sll	%g6,	0x09,	%o2
	fxnors	%f21,	%f11,	%f19
	array32	%g7,	%i2,	%o3
	bvs,a	%icc,	loop_769
	array8	%o1,	%l6,	%g3
	movneg	%xcc,	%l3,	%i3
	andncc	%o7,	%i6,	%i7
loop_769:
	movn	%xcc,	%i1,	%i4
	swap	[%l7 + 0x50],	%i0
	sdiv	%o5,	0x0A63,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%o6,	loop_770
	array8	%l2,	%g2,	%g4
	te	%icc,	0x7
	fbule	%fcc3,	loop_771
loop_770:
	sdivcc	%i5,	0x13A9,	%l5
	sth	%g5,	[%l7 + 0x5E]
	tg	%xcc,	0x0
loop_771:
	edge32l	%l0,	%l4,	%o0
	fone	%f14
	andncc	%o4,	%g6,	%o2
	movge	%icc,	%l1,	%i2
	movleu	%icc,	%g7,	%o1
	udiv	%l6,	0x0051,	%o3
	movge	%icc,	%l3,	%g3
	edge16	%o7,	%i3,	%i7
	ba,a	%xcc,	loop_772
	fbule	%fcc2,	loop_773
	taddcc	%i1,	0x0F43,	%i6
	mova	%icc,	%i0,	%i4
loop_772:
	membar	0x2F
loop_773:
	nop
	set	0x10, %l5
	stha	%g1,	[%l7 + %l5] 0xea
	membar	#Sync
	fpsub16	%f16,	%f20,	%f18
	ta	%xcc,	0x5
	movvc	%icc,	%o6,	%o5
	tleu	%xcc,	0x0
	movrgz	%l2,	%g4,	%g2
	flush	%l7 + 0x70
	fpadd16s	%f30,	%f27,	%f26
	addc	%i5,	%l5,	%g5
	fcmpd	%fcc3,	%f24,	%f4
	sllx	%l0,	0x0F,	%o0
	smul	%l4,	%g6,	%o2
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%o4
	movn	%xcc,	%l1,	%i2
	brgez,a	%g7,	loop_774
	sra	%l6,	0x04,	%o1
	andncc	%l3,	%g3,	%o7
	fmuld8ulx16	%f6,	%f5,	%f12
loop_774:
	edge16l	%o3,	%i7,	%i3
	nop
	setx	loop_775,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%i6,	%i0,	%i1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0E] %asi,	%g1
loop_775:
	fmovrslez	%i4,	%f4,	%f24
	fmovrdne	%o5,	%f28,	%f18
	fcmpeq16	%f12,	%f20,	%o6
	sth	%g4,	[%l7 + 0x58]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,pt	%xcc,	loop_776
	smul	%l2,	0x08D9,	%i5
	movge	%icc,	%g2,	%g5
	edge32l	%l0,	%o0,	%l5
loop_776:
	movrlz	%l4,	0x3A5,	%g6
	tleu	%xcc,	0x5
	brz,a	%o2,	loop_777
	bgu	%xcc,	loop_778
	movrgz	%o4,	%i2,	%l1
	bne,pn	%xcc,	loop_779
loop_777:
	brz,a	%l6,	loop_780
loop_778:
	fcmpeq16	%f30,	%f22,	%o1
	movneg	%xcc,	%g7,	%g3
loop_779:
	edge8	%l3,	%o3,	%o7
loop_780:
	ldub	[%l7 + 0x09],	%i3
	edge16ln	%i6,	%i0,	%i7
	bpos,a,pn	%icc,	loop_781
	addccc	%g1,	0x0CC0,	%i1
	call	loop_782
	fmovdge	%xcc,	%f27,	%f28
loop_781:
	movne	%icc,	%i4,	%o5
	sdiv	%o6,	0x1F39,	%g4
loop_782:
	smulcc	%i5,	0x0BDA,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x6C, %i7
	stwa	%g5,	[%l7 + %i7] 0x88
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x08],	%g2
	mulscc	%l0,	%o0,	%l5
	tvs	%icc,	0x4
	ta	%icc,	0x5
	mulscc	%l4,	%g6,	%o2
	tl	%icc,	0x7
	movl	%xcc,	%o4,	%l1
	tcc	%xcc,	0x3
	st	%f7,	[%l7 + 0x68]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i2,	%o1
	fsrc1s	%f8,	%f19
	set	0x10, %g6
	ldsba	[%l7 + %g6] 0x18,	%l6
	sethi	0x0748,	%g3
	subcc	%g7,	%l3,	%o3
	orcc	%o7,	%i6,	%i3
	movrlz	%i7,	0x374,	%g1
	fble	%fcc3,	loop_783
	fbule,a	%fcc0,	loop_784
	st	%f23,	[%l7 + 0x6C]
	array16	%i0,	%i4,	%i1
loop_783:
	tne	%icc,	0x1
loop_784:
	fmovrdgez	%o5,	%f16,	%f24
	fbo,a	%fcc0,	loop_785
	fzeros	%f1
	fmovrsne	%g4,	%f20,	%f7
	sllx	%i5,	0x18,	%o6
loop_785:
	fmovdne	%xcc,	%f15,	%f30
	array16	%g5,	%l2,	%l0
	taddcctv	%o0,	%g2,	%l5
	fcmpne32	%f10,	%f14,	%l4
	tgu	%xcc,	0x5
	mova	%xcc,	%g6,	%o2
	bn	loop_786
	fbuge,a	%fcc2,	loop_787
	array8	%l1,	%o4,	%o1
	sir	0x0A38
loop_786:
	sth	%i2,	[%l7 + 0x56]
loop_787:
	fmovrsgez	%l6,	%f3,	%f1
	sll	%g7,	%l3,	%o3
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x10,	%f5
	fnands	%f25,	%f2,	%f13
	sub	%g3,	0x00D0,	%i6
	fcmple16	%f30,	%f2,	%i3
	std	%f8,	[%l7 + 0x58]
	tgu	%xcc,	0x4
	fsrc2	%f2,	%f0
	lduh	[%l7 + 0x78],	%o7
	fnot1s	%f31,	%f27
	edge16	%g1,	%i0,	%i7
	edge32ln	%i4,	%o5,	%i1
	movrlz	%g4,	0x202,	%o6
	fmovsvs	%xcc,	%f9,	%f19
	movrlez	%g5,	0x1C1,	%i5
	tne	%xcc,	0x5
	addcc	%l2,	%l0,	%g2
	fmovda	%icc,	%f6,	%f7
	alignaddrl	%l5,	%l4,	%g6
	stw	%o2,	[%l7 + 0x14]
	movcs	%icc,	%o0,	%o4
	fmovrslz	%o1,	%f23,	%f1
	edge8n	%i2,	%l1,	%l6
	fsrc2	%f8,	%f24
	fbe,a	%fcc3,	loop_788
	subc	%l3,	0x1A06,	%o3
	bgu	%icc,	loop_789
	fmovd	%f6,	%f16
loop_788:
	tcc	%icc,	0x1
	mulx	%g7,	0x0967,	%i6
loop_789:
	fnors	%f21,	%f19,	%f0
	edge32ln	%g3,	%o7,	%g1
	edge8n	%i3,	%i0,	%i7
	be	%icc,	loop_790
	stb	%o5,	[%l7 + 0x49]
	fandnot2s	%f31,	%f15,	%f21
	ldx	[%l7 + 0x20],	%i1
loop_790:
	bn,a	%xcc,	loop_791
	tcs	%xcc,	0x1
	srlx	%i4,	0x01,	%o6
	brz	%g4,	loop_792
loop_791:
	fbl	%fcc0,	loop_793
	popc	0x0A21,	%g5
	nop
	setx loop_794, %l0, %l1
	jmpl %l1, %i5
loop_792:
	fcmped	%fcc0,	%f20,	%f22
loop_793:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%l0,	loop_795
loop_794:
	fpsub16s	%f1,	%f29,	%f0
	fcmple32	%f28,	%f18,	%g2
	prefetch	[%l7 + 0x20],	 0x2
loop_795:
	brlz	%l5,	loop_796
	fmovrdgez	%l4,	%f12,	%f22
	movvs	%xcc,	%l2,	%g6
	smul	%o2,	%o4,	%o0
loop_796:
	bleu	%xcc,	loop_797
	alignaddr	%o1,	%i2,	%l6
	ld	[%l7 + 0x58],	%f6
	set	0x0D, %g1
	ldsba	[%l7 + %g1] 0x80,	%l1
loop_797:
	smulcc	%o3,	0x1BD9,	%g7
	fmul8x16al	%f26,	%f5,	%f28
	movleu	%icc,	%i6,	%g3
	xor	%o7,	%l3,	%i3
	edge16	%i0,	%i7,	%g1
	fsrc1	%f18,	%f8
	smulcc	%o5,	%i4,	%o6
	sllx	%i1,	%g4,	%i5
	membar	0x46
	taddcc	%g5,	%g2,	%l5
	stx	%l0,	[%l7 + 0x58]
	srax	%l2,	%l4,	%g6
	edge32n	%o4,	%o2,	%o1
	udiv	%o0,	0x0439,	%i2
	fnot2	%f10,	%f18
	fnegs	%f2,	%f27
	fpack32	%f6,	%f18,	%f28
	fbug	%fcc0,	loop_798
	be,a,pt	%xcc,	loop_799
	sdiv	%l6,	0x1543,	%o3
	fmovdcs	%icc,	%f28,	%f10
loop_798:
	te	%xcc,	0x1
loop_799:
	nop
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x10,	 0x2
	edge16n	%l1,	%i6,	%g3
	xor	%l3,	0x0DB0,	%i3
	brlez,a	%i0,	loop_800
	udivcc	%o7,	0x0846,	%i7
	fbule	%fcc2,	loop_801
	movcs	%xcc,	%g1,	%o5
loop_800:
	fmovsvs	%icc,	%f25,	%f9
	addcc	%i4,	%i1,	%g4
loop_801:
	movn	%icc,	%o6,	%g5
	for	%f26,	%f24,	%f6
	orn	%g2,	0x196F,	%i5
	xnorcc	%l5,	0x0736,	%l2
	bl,pt	%xcc,	loop_802
	fxnor	%f0,	%f16,	%f22
	edge32ln	%l4,	%l0,	%o4
	fcmpne32	%f12,	%f8,	%g6
loop_802:
	bn,pn	%xcc,	loop_803
	taddcc	%o2,	0x06F1,	%o0
	udivx	%o1,	0x1F2A,	%l6
	taddcc	%o3,	%g7,	%l1
loop_803:
	andn	%i2,	0x1791,	%g3
	ld	[%l7 + 0x70],	%f19
	fble,a	%fcc3,	loop_804
	taddcc	%i6,	%l3,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc2,	loop_805
loop_804:
	sra	%i0,	0x0E,	%o7
	fbe	%fcc2,	loop_806
	bl,pn	%icc,	loop_807
loop_805:
	sir	0x0ABA
	mova	%icc,	%i7,	%g1
loop_806:
	fbl,a	%fcc0,	loop_808
loop_807:
	movrgz	%i4,	0x3D3,	%o5
	fmovdg	%xcc,	%f16,	%f15
	fors	%f2,	%f12,	%f31
loop_808:
	alignaddrl	%i1,	%o6,	%g5
	tpos	%icc,	0x3
	fmovsge	%xcc,	%f6,	%f3
	fmovrdgz	%g2,	%f4,	%f28
	fbne,a	%fcc1,	loop_809
	fabsd	%f12,	%f12
	fmovrsgez	%g4,	%f17,	%f1
	fmul8x16au	%f22,	%f8,	%f12
loop_809:
	te	%xcc,	0x1
	tn	%icc,	0x6
	array8	%i5,	%l2,	%l5
	edge16n	%l4,	%o4,	%g6
	add	%o2,	%l0,	%o1
	xor	%l6,	0x1E80,	%o3
	sdiv	%o0,	0x086B,	%l1
	tsubcctv	%g7,	0x1C11,	%g3
	or	%i6,	%i2,	%i3
	st	%f18,	[%l7 + 0x68]
	ba,a	%xcc,	loop_810
	fmovscs	%icc,	%f20,	%f24
	fmovscc	%xcc,	%f12,	%f17
	xnor	%i0,	0x01A3,	%l3
loop_810:
	tg	%xcc,	0x7
	smul	%o7,	0x171C,	%i7
	orncc	%i4,	0x1825,	%g1
	swap	[%l7 + 0x30],	%i1
	addccc	%o5,	0x03B3,	%g5
	tleu	%icc,	0x0
	swap	[%l7 + 0x10],	%g2
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge16l	%g4,	%o6,	%l2
	movl	%icc,	%l5,	%l4
	and	%o4,	%g6,	%i5
	fmovdg	%xcc,	%f26,	%f9
	array16	%o2,	%o1,	%l0
	fsrc2s	%f23,	%f7
	fors	%f2,	%f22,	%f4
	smul	%l6,	%o3,	%l1
	movre	%o0,	%g7,	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%g3
	tn	%xcc,	0x1
	bcc,a,pn	%icc,	loop_811
	fbue	%fcc3,	loop_812
	fpmerge	%f11,	%f9,	%f18
	tsubcctv	%i0,	%l3,	%i3
loop_811:
	fnands	%f16,	%f28,	%f11
loop_812:
	fzeros	%f20
	ba	%xcc,	loop_813
	fmul8x16al	%f29,	%f28,	%f30
	fmovdgu	%xcc,	%f2,	%f26
	orncc	%i7,	0x0257,	%o7
loop_813:
	popc	0x0B9D,	%g1
	xnorcc	%i1,	0x144B,	%i4
	fmovrsgz	%o5,	%f23,	%f10
	tg	%icc,	0x5
	xor	%g2,	%g5,	%g4
	fmul8x16	%f0,	%f30,	%f14
	subccc	%l2,	%o6,	%l4
	std	%f20,	[%l7 + 0x28]
	umulcc	%l5,	%o4,	%g6
	movvs	%icc,	%i5,	%o1
	movgu	%xcc,	%o2,	%l6
	bgu	loop_814
	array32	%l0,	%o3,	%l1
	set	0x40, %l6
	ldsba	[%l7 + %l6] 0x11,	%o0
loop_814:
	fbe	%fcc1,	loop_815
	fbge	%fcc0,	loop_816
	edge8l	%i6,	%i2,	%g3
	fbul	%fcc1,	loop_817
loop_815:
	fble	%fcc3,	loop_818
loop_816:
	bne	%icc,	loop_819
	bvs,a	%icc,	loop_820
loop_817:
	fbul,a	%fcc0,	loop_821
loop_818:
	tle	%icc,	0x7
loop_819:
	fbuge	%fcc1,	loop_822
loop_820:
	sethi	0x03EC,	%g7
loop_821:
	fnors	%f27,	%f6,	%f6
	orn	%l3,	0x154A,	%i3
loop_822:
	fabss	%f0,	%f9
	movrne	%i7,	%o7,	%g1
	fpack16	%f4,	%f13
	movneg	%icc,	%i0,	%i4
	edge8l	%o5,	%i1,	%g2
	subc	%g5,	0x019C,	%l2
	bvs,a	loop_823
	sdivcc	%g4,	0x11DA,	%o6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%l5
loop_823:
	addc	%o4,	%g6,	%l4
	addc	%i5,	%o1,	%l6
	fbug,a	%fcc3,	loop_824
	prefetch	[%l7 + 0x40],	 0x3
	fbuge	%fcc2,	loop_825
	udivx	%l0,	0x0949,	%o3
loop_824:
	move	%xcc,	%o2,	%o0
	lduh	[%l7 + 0x3E],	%i6
loop_825:
	fba,a	%fcc2,	loop_826
	andcc	%i2,	%l1,	%g7
	fmovrdlz	%l3,	%f26,	%f12
	te	%xcc,	0x0
loop_826:
	fpsub32s	%f23,	%f6,	%f19
	fpadd16	%f2,	%f12,	%f4
	brgez,a	%g3,	loop_827
	andcc	%i7,	0x1787,	%i3
	mova	%icc,	%g1,	%i0
	fbg	%fcc3,	loop_828
loop_827:
	fnegd	%f14,	%f24
	fnot1	%f16,	%f16
	orcc	%o7,	0x0FFA,	%i4
loop_828:
	srax	%i1,	%o5,	%g5
	fnors	%f28,	%f19,	%f12
	sth	%l2,	[%l7 + 0x22]
	fmovrdgz	%g4,	%f14,	%f22
	array32	%g2,	%o6,	%l5
	fornot2s	%f18,	%f26,	%f9
	and	%o4,	%l4,	%i5
	addc	%o1,	0x1BE8,	%l6
	xorcc	%l0,	%g6,	%o3
	edge8n	%o2,	%i6,	%o0
	srlx	%l1,	%g7,	%i2
	fmovsvc	%icc,	%f20,	%f26
	ldd	[%l7 + 0x78],	%f22
	movg	%icc,	%l3,	%g3
	fbe,a	%fcc2,	loop_829
	movn	%xcc,	%i3,	%g1
	lduw	[%l7 + 0x48],	%i7
	tgu	%icc,	0x3
loop_829:
	tle	%icc,	0x3
	xnor	%i0,	%o7,	%i1
	siam	0x5
	subc	%o5,	0x049D,	%g5
	subccc	%i4,	0x0B36,	%l2
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	alignaddr	%g4,	%g2,	%l5
	orcc	%o6,	%l4,	%o4
	array8	%o1,	%l6,	%i5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g6
	fcmpeq16	%f10,	%f12,	%o3
	andn	%l0,	0x0972,	%i6
	fnot2s	%f10,	%f16
	tcc	%xcc,	0x0
	fmul8ulx16	%f22,	%f26,	%f4
	edge32ln	%o0,	%o2,	%l1
	array32	%i2,	%l3,	%g3
	movvs	%icc,	%g7,	%g1
	fabss	%f18,	%f19
	edge32n	%i3,	%i7,	%o7
	sethi	0x0CC9,	%i1
	addccc	%i0,	%o5,	%g5
	ldsb	[%l7 + 0x1E],	%i4
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x24] %asi,	%l2
	movrgz	%g2,	0x14A,	%g4
	movcc	%xcc,	%l5,	%l4
	tcs	%xcc,	0x5
	bpos,pn	%xcc,	loop_830
	fblg,a	%fcc3,	loop_831
	edge16l	%o6,	%o1,	%l6
	sra	%o4,	0x19,	%i5
loop_830:
	movrlez	%o3,	0x112,	%g6
loop_831:
	movrgz	%l0,	0x384,	%i6
	taddcctv	%o0,	%o2,	%i2
	bge,a,pn	%icc,	loop_832
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l3,	%g3,	%g7
	nop
	setx loop_833, %l0, %l1
	jmpl %l1, %g1
loop_832:
	and	%i3,	%i7,	%l1
	movrne	%i1,	0x1CF,	%o7
	umulcc	%i0,	%o5,	%i4
loop_833:
	movl	%xcc,	%g5,	%l2
	movrlz	%g2,	%l5,	%l4
	fpackfix	%f6,	%f3
	andn	%o6,	%g4,	%l6
	subccc	%o1,	%o4,	%o3
	tn	%xcc,	0x2
	edge16	%g6,	%l0,	%i6
	set	0x3E, %o0
	lduba	[%l7 + %o0] 0x18,	%i5
	brnz,a	%o0,	loop_834
	umulcc	%i2,	0x10CB,	%l3
	fmovdg	%icc,	%f19,	%f7
	udivcc	%g3,	0x1C7F,	%o2
loop_834:
	edge32n	%g7,	%i3,	%g1
	fbne	%fcc2,	loop_835
	fmovde	%icc,	%f24,	%f29
	st	%f13,	[%l7 + 0x38]
	ta	%xcc,	0x1
loop_835:
	edge16	%i7,	%i1,	%o7
	stbar
	movg	%icc,	%i0,	%l1
	fmovse	%icc,	%f15,	%f21
	sethi	0x1931,	%o5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i4
	fcmpgt32	%f6,	%f26,	%l2
	array16	%g2,	%g5,	%l4
	movne	%xcc,	%l5,	%o6
	movvs	%icc,	%g4,	%o1
	siam	0x6
	ldsh	[%l7 + 0x60],	%l6
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x81
	srlx	%o4,	%g6,	%o3
	array32	%l0,	%i5,	%o0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%i2
	tpos	%icc,	0x3
	fmovscc	%xcc,	%f8,	%f23
	movne	%xcc,	%g3,	%o2
	movrlz	%l3,	%i3,	%g1
	ldsb	[%l7 + 0x4B],	%i7
	brlez	%i1,	loop_836
	bcc	%xcc,	loop_837
	movne	%xcc,	%o7,	%g7
	edge32n	%i0,	%l1,	%i4
loop_836:
	fbge	%fcc2,	loop_838
loop_837:
	andn	%l2,	0x0F29,	%g2
	lduh	[%l7 + 0x0C],	%o5
	set	0x75, %i4
	ldstuba	[%l7 + %i4] 0x11,	%g5
loop_838:
	move	%icc,	%l5,	%l4
	umulcc	%o6,	0x0380,	%g4
	mova	%xcc,	%l6,	%o4
	smulcc	%o1,	0x00CB,	%g6
	tl	%xcc,	0x7
	call	loop_839
	movrlz	%o3,	0x061,	%l0
	bleu,a	loop_840
	fmul8ulx16	%f20,	%f24,	%f22
loop_839:
	bvs	%xcc,	loop_841
	move	%icc,	%o0,	%i6
loop_840:
	array32	%i2,	%g3,	%i5
	smul	%l3,	0x00CF,	%i3
loop_841:
	fbue	%fcc1,	loop_842
	tleu	%icc,	0x3
	sra	%g1,	0x19,	%i7
	fbn,a	%fcc3,	loop_843
loop_842:
	bcs,a,pt	%icc,	loop_844
	fands	%f26,	%f4,	%f21
	alignaddr	%o2,	%i1,	%g7
loop_843:
	subcc	%i0,	0x1551,	%l1
loop_844:
	edge32	%i4,	%l2,	%o7
	stbar
	fbul,a	%fcc1,	loop_845
	ld	[%l7 + 0x40],	%f1
	for	%f2,	%f4,	%f12
	fbug,a	%fcc1,	loop_846
loop_845:
	edge16	%o5,	%g2,	%g5
	edge8l	%l4,	%o6,	%l5
	subcc	%g4,	0x0808,	%l6
loop_846:
	movvc	%xcc,	%o1,	%g6
	sdivx	%o4,	0x123D,	%l0
	fmovdl	%xcc,	%f20,	%f3
	sethi	0x02C6,	%o3
	andcc	%o0,	0x078C,	%i6
	taddcctv	%i2,	0x0FAE,	%i5
	tsubcc	%g3,	0x1684,	%i3
	move	%xcc,	%l3,	%g1
	movpos	%icc,	%i7,	%o2
	fabss	%f3,	%f7
	movrlez	%g7,	0x140,	%i1
	fmovrdlez	%l1,	%f20,	%f8
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i0
	xorcc	%i4,	%l2,	%o7
	subcc	%g2,	0x0A4A,	%o5
	ldx	[%l7 + 0x58],	%l4
	tgu	%xcc,	0x2
	taddcctv	%g5,	0x182C,	%l5
	bneg,a,pn	%icc,	loop_847
	tsubcctv	%g4,	0x1F30,	%o6
	fmovsge	%icc,	%f19,	%f22
	fabsd	%f4,	%f2
loop_847:
	fba	%fcc2,	loop_848
	sdivx	%l6,	0x131D,	%g6
	fmovrse	%o4,	%f16,	%f3
	edge16	%l0,	%o1,	%o0
loop_848:
	fnot2s	%f4,	%f11
	fcmps	%fcc3,	%f26,	%f16
	tcc	%xcc,	0x5
	bn,a,pt	%xcc,	loop_849
	fors	%f31,	%f0,	%f15
	wr	%g0,	0x23,	%asi
	stxa	%i6,	[%l7 + 0x38] %asi
	membar	#Sync
loop_849:
	move	%icc,	%i2,	%i5
	movgu	%xcc,	%g3,	%i3
	edge16ln	%o3,	%g1,	%l3
	fpackfix	%f10,	%f15
	lduh	[%l7 + 0x74],	%i7
	xnorcc	%g7,	0x026F,	%i1
	fnand	%f6,	%f6,	%f4
	andcc	%o2,	%i0,	%l1
	sir	0x1DB5
	te	%icc,	0x1
	movleu	%xcc,	%l2,	%i4
	fornot1	%f30,	%f18,	%f18
	fcmpeq16	%f14,	%f22,	%g2
	umulcc	%o5,	%l4,	%o7
	fmovdle	%xcc,	%f28,	%f14
	fbge	%fcc2,	loop_850
	nop
	setx	loop_851,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot2	%f12,	%f18
	ldsw	[%l7 + 0x64],	%g5
loop_850:
	array16	%g4,	%l5,	%l6
loop_851:
	tleu	%icc,	0x0
	fmovs	%f6,	%f8
	prefetch	[%l7 + 0x6C],	 0x1
	srl	%o6,	%g6,	%l0
	movrlez	%o4,	0x20F,	%o0
	umul	%i6,	%o1,	%i2
	edge32n	%g3,	%i3,	%o3
	fcmpeq32	%f24,	%f28,	%i5
	addccc	%g1,	%i7,	%g7
	fmovdcs	%xcc,	%f13,	%f25
	brgez	%l3,	loop_852
	tl	%xcc,	0x1
	fandnot2	%f4,	%f24,	%f8
	brlez	%i1,	loop_853
loop_852:
	fmovrdgz	%i0,	%f10,	%f22
	membar	0x4B
	stb	%o2,	[%l7 + 0x45]
loop_853:
	movne	%xcc,	%l1,	%i4
	tneg	%xcc,	0x7
	edge16l	%l2,	%o5,	%l4
	tvc	%xcc,	0x5
	fbl	%fcc0,	loop_854
	tcc	%icc,	0x2
	fba,a	%fcc2,	loop_855
	fors	%f5,	%f29,	%f8
loop_854:
	movrgz	%g2,	0x34A,	%o7
	add	%g5,	%g4,	%l6
loop_855:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%o6
	sdiv	%g6,	0x01A6,	%o4
	xnorcc	%l0,	%i6,	%o0
	stb	%i2,	[%l7 + 0x7D]
	umul	%o1,	0x0301,	%g3
	membar	0x3C
	fabsd	%f8,	%f2
	ld	[%l7 + 0x4C],	%f4
	popc	0x0AE4,	%i3
	tvs	%icc,	0x7
	fba,a	%fcc1,	loop_856
	xnorcc	%i5,	%o3,	%g1
	sdiv	%g7,	0x0A34,	%i7
	bge,a,pt	%icc,	loop_857
loop_856:
	taddcctv	%l3,	0x070E,	%i1
	tvc	%xcc,	0x1
	andncc	%i0,	%l1,	%o2
loop_857:
	edge32	%l2,	%i4,	%l4
	edge16l	%o5,	%o7,	%g5
	edge8ln	%g4,	%g2,	%l5
	fmovsg	%icc,	%f11,	%f29
	fnands	%f17,	%f13,	%f27
	fmovdvc	%icc,	%f26,	%f3
	array32	%l6,	%o6,	%g6
	edge16ln	%o4,	%l0,	%o0
	or	%i2,	%i6,	%g3
	movrgz	%i3,	%i5,	%o3
	taddcc	%o1,	0x0978,	%g1
	fcmpeq16	%f10,	%f8,	%i7
	movle	%icc,	%l3,	%g7
	fpadd16s	%f28,	%f31,	%f5
	fbue,a	%fcc1,	loop_858
	xnor	%i1,	0x0BB0,	%i0
	movrlz	%l1,	%o2,	%l2
	tvc	%xcc,	0x6
loop_858:
	fcmpes	%fcc1,	%f15,	%f4
	be,a	loop_859
	umul	%i4,	%o5,	%o7
	edge16ln	%g5,	%l4,	%g2
	edge8ln	%g4,	%l6,	%o6
loop_859:
	sdiv	%l5,	0x123B,	%g6
	lduh	[%l7 + 0x62],	%l0
	mulx	%o0,	%i2,	%i6
	edge32n	%g3,	%o4,	%i3
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	te	%icc,	0x1
	tg	%xcc,	0x4
	st	%f15,	[%l7 + 0x40]
	fcmpne32	%f18,	%f24,	%o1
	edge16	%g1,	%o3,	%l3
	xnorcc	%g7,	0x13EE,	%i1
	fxor	%f8,	%f28,	%f18
	brlz,a	%i7,	loop_860
	mova	%icc,	%i0,	%o2
	ldd	[%l7 + 0x28],	%l2
	edge16	%i4,	%l1,	%o7
loop_860:
	movgu	%xcc,	%g5,	%l4
	bcc,a	loop_861
	tgu	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%o5
loop_861:
	bcc,a,pt	%icc,	loop_862
	fandnot2	%f20,	%f18,	%f26
	sllx	%g2,	%l6,	%g4
	subccc	%o6,	0x102E,	%g6
loop_862:
	nop
	wr	%g0,	0x4f,	%asi
	stxa	%l5,	[%g0 + 0x18] %asi
	fcmple16	%f8,	%f22,	%l0
	edge16ln	%i2,	%i6,	%g3
	or	%o4,	0x0E3F,	%i3
	tneg	%xcc,	0x3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x11,	%o0,	%i5
	stx	%o1,	[%l7 + 0x68]
	movrlez	%o3,	%l3,	%g1
	stx	%g7,	[%l7 + 0x60]
	fxnor	%f20,	%f2,	%f2
	fxor	%f6,	%f18,	%f30
	fmovrdlz	%i1,	%f10,	%f4
	smul	%i0,	0x0B3C,	%i7
	fmovdne	%icc,	%f2,	%f26
	ldx	[%l7 + 0x68],	%o2
	fmovsl	%xcc,	%f31,	%f5
	fmovrdne	%l2,	%f22,	%f8
	movcs	%xcc,	%i4,	%o7
	ld	[%l7 + 0x24],	%f7
	taddcc	%l1,	%l4,	%o5
	fmovsgu	%xcc,	%f6,	%f6
	call	loop_863
	fabsd	%f2,	%f10
	edge8ln	%g5,	%l6,	%g4
	movpos	%icc,	%o6,	%g2
loop_863:
	membar	0x6F
	fpack16	%f14,	%f30
	fand	%f4,	%f14,	%f12
	fmovdneg	%icc,	%f17,	%f31
	fmovspos	%xcc,	%f5,	%f19
	bge,pt	%icc,	loop_864
	udivcc	%l5,	0x062D,	%l0
	edge8n	%g6,	%i2,	%i6
	fmovdpos	%xcc,	%f27,	%f14
loop_864:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x60] %asi,	%f6
	movleu	%xcc,	%o4,	%g3
	fmovrslz	%i3,	%f21,	%f5
	tsubcctv	%o0,	0x02FE,	%o1
	bcs,pn	%xcc,	loop_865
	edge16	%o3,	%i5,	%g1
	brnz,a	%g7,	loop_866
	movrne	%l3,	%i0,	%i1
loop_865:
	edge8l	%o2,	%i7,	%i4
	set	0x00, %g7
	ldxa	[%g0 + %g7] 0x50,	%l2
loop_866:
	xor	%l1,	%o7,	%o5
	fmovrdgez	%l4,	%f20,	%f12
	stbar
	edge16ln	%g5,	%g4,	%l6
	fbne	%fcc2,	loop_867
	tneg	%icc,	0x3
	taddcc	%o6,	%g2,	%l5
	set	0x14, %i0
	ldswa	[%l7 + %i0] 0x81,	%g6
loop_867:
	srax	%l0,	0x03,	%i2
	brnz	%o4,	loop_868
	fbne	%fcc2,	loop_869
	tsubcctv	%i6,	%g3,	%o0
	edge32l	%o1,	%o3,	%i5
loop_868:
	fmovrdgz	%i3,	%f16,	%f14
loop_869:
	sdiv	%g7,	0x06C2,	%g1
	udiv	%i0,	0x1B72,	%i1
	tl	%icc,	0x3
	fcmps	%fcc0,	%f17,	%f27
	tsubcctv	%o2,	0x0B1E,	%l3
	fornot1	%f30,	%f26,	%f26
	siam	0x3
	umulcc	%i4,	0x0B52,	%i7
	sdivcc	%l2,	0x128C,	%o7
	bcs	%xcc,	loop_870
	fcmpgt16	%f8,	%f6,	%o5
	movn	%xcc,	%l4,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_870:
	fbug,a	%fcc2,	loop_871
	subc	%g4,	0x0769,	%l1
	fcmped	%fcc1,	%f24,	%f20
	movrlz	%l6,	%o6,	%g2
loop_871:
	movl	%icc,	%g6,	%l5
	bneg,a	%xcc,	loop_872
	movrgez	%i2,	0x27A,	%o4
	fands	%f14,	%f25,	%f21
	tcc	%xcc,	0x5
loop_872:
	andcc	%l0,	%i6,	%g3
	fcmple16	%f14,	%f6,	%o0
	nop
	setx	loop_873,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ble,a	loop_874
	movrgz	%o3,	0x3B2,	%o1
	movg	%icc,	%i5,	%i3
loop_873:
	array32	%g7,	%g1,	%i0
loop_874:
	nop
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fnegd	%f4,	%f20
	fmovsvc	%icc,	%f12,	%f17
	fpsub32	%f8,	%f22,	%f20
	set	0x78, %g2
	lduwa	[%l7 + %g2] 0x88,	%l3
	tgu	%xcc,	0x6
	umul	%i4,	%o2,	%l2
	movleu	%icc,	%i7,	%o5
	andncc	%l4,	%g5,	%o7
	fandnot2	%f8,	%f20,	%f26
	edge32	%l1,	%l6,	%g4
	te	%icc,	0x1
	addcc	%o6,	0x08E2,	%g6
	fmuld8sux16	%f14,	%f1,	%f28
	movge	%xcc,	%g2,	%l5
	fmovse	%icc,	%f5,	%f28
	fnot1	%f14,	%f28
	mova	%xcc,	%i2,	%l0
	addccc	%o4,	0x1871,	%i6
	movrlez	%o0,	%o3,	%g3
	fmovdcs	%icc,	%f3,	%f16
	bge,pn	%xcc,	loop_875
	fbn	%fcc1,	loop_876
	tvc	%xcc,	0x5
	movne	%xcc,	%o1,	%i3
loop_875:
	tvc	%xcc,	0x7
loop_876:
	tneg	%xcc,	0x6
	nop
	set	0x5C, %i2
	stw	%i5,	[%l7 + %i2]
	fpadd16s	%f5,	%f30,	%f1
	edge16n	%g7,	%g1,	%i0
	tsubcc	%l3,	%i4,	%o2
	tcs	%icc,	0x5
	brnz,a	%l2,	loop_877
	edge32l	%i7,	%o5,	%l4
	fmovrslz	%g5,	%f3,	%f16
	fbug,a	%fcc3,	loop_878
loop_877:
	move	%xcc,	%i1,	%l1
	movpos	%xcc,	%l6,	%o7
	andncc	%g4,	%o6,	%g6
loop_878:
	udivcc	%g2,	0x1559,	%l5
	smul	%i2,	%l0,	%i6
	fmuld8ulx16	%f10,	%f31,	%f26
	tsubcc	%o0,	%o4,	%o3
	fbo,a	%fcc3,	loop_879
	ld	[%l7 + 0x30],	%f0
	andcc	%o1,	0x1963,	%g3
	fmovrdgez	%i5,	%f20,	%f20
loop_879:
	sdivx	%i3,	0x1EFD,	%g7
	umulcc	%i0,	0x113B,	%g1
	edge8l	%l3,	%o2,	%i4
	brgz,a	%l2,	loop_880
	tle	%xcc,	0x5
	fands	%f19,	%f17,	%f1
	edge16ln	%i7,	%o5,	%l4
loop_880:
	fmovdvc	%icc,	%f17,	%f29
	fbule	%fcc3,	loop_881
	xnorcc	%g5,	0x1B97,	%i1
	edge32l	%l6,	%o7,	%l1
	sub	%g4,	0x18AA,	%g6
loop_881:
	xnorcc	%o6,	0x1577,	%g2
	movn	%xcc,	%l5,	%i2
	movleu	%xcc,	%l0,	%o0
	sllx	%i6,	0x02,	%o4
	fmovdne	%icc,	%f13,	%f8
	edge32n	%o3,	%o1,	%g3
	fmovdcc	%xcc,	%f3,	%f17
	smul	%i5,	%i3,	%i0
	prefetch	[%l7 + 0x6C],	 0x3
	or	%g1,	0x0656,	%l3
	prefetch	[%l7 + 0x7C],	 0x3
	bge,a,pn	%icc,	loop_882
	movge	%icc,	%g7,	%o2
	ta	%xcc,	0x1
	fone	%f24
loop_882:
	brz,a	%l2,	loop_883
	movleu	%icc,	%i7,	%i4
	array16	%o5,	%g5,	%l4
	fmovsvc	%xcc,	%f6,	%f1
loop_883:
	fmovsn	%icc,	%f31,	%f0
	membar	0x11
	sllx	%i1,	%l6,	%l1
	tsubcc	%o7,	0x0413,	%g4
	tsubcctv	%o6,	0x171E,	%g6
	edge8n	%l5,	%i2,	%l0
	fbul	%fcc2,	loop_884
	smulcc	%o0,	0x1457,	%g2
	tleu	%icc,	0x4
	sir	0x13ED
loop_884:
	movne	%icc,	%i6,	%o4
	edge8l	%o1,	%g3,	%i5
	tne	%xcc,	0x4
	fsrc1	%f4,	%f10
	umulcc	%o3,	%i3,	%i0
	tcs	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x1C] %asi,	%g1
	ta	%xcc,	0x0
	edge32n	%l3,	%g7,	%o2
	tvs	%icc,	0x0
	array32	%i7,	%l2,	%o5
	sdivcc	%g5,	0x0670,	%i4
	set	0x27, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i1
	fmovspos	%icc,	%f30,	%f5
	movne	%xcc,	%l6,	%l4
	set	0x4C, %i3
	stha	%l1,	[%l7 + %i3] 0xeb
	membar	#Sync
	bcc	%icc,	loop_885
	smulcc	%o7,	0x1F31,	%g4
	alignaddr	%g6,	%o6,	%l5
	fmovrslz	%i2,	%f21,	%f25
loop_885:
	add	%o0,	%g2,	%l0
	ldd	[%l7 + 0x30],	%i6
	fbl	%fcc0,	loop_886
	movrlez	%o1,	%g3,	%i5
	st	%f14,	[%l7 + 0x64]
	sir	0x0B08
loop_886:
	addcc	%o4,	%i3,	%o3
	tgu	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%g1
	movneg	%xcc,	%l3,	%i0
	udivx	%o2,	0x1DDD,	%g7
	brz	%i7,	loop_887
	edge16n	%l2,	%o5,	%i4
	fmovdle	%icc,	%f9,	%f23
	edge32	%g5,	%i1,	%l6
loop_887:
	brlz	%l1,	loop_888
	mulx	%l4,	%g4,	%g6
	edge16n	%o6,	%l5,	%i2
	edge32	%o0,	%o7,	%g2
loop_888:
	movg	%icc,	%l0,	%i6
	fpack32	%f2,	%f4,	%f0
	fxors	%f15,	%f29,	%f0
	tsubcctv	%g3,	0x0099,	%o1
	nop
	set	0x6C, %i6
	prefetch	[%l7 + %i6],	 0x0
	taddcctv	%o4,	%i3,	%o3
	xnor	%g1,	0x0444,	%l3
	and	%i0,	0x0923,	%i5
	edge16	%g7,	%i7,	%o2
	te	%xcc,	0x1
	bneg	loop_889
	movrgez	%l2,	0x1A8,	%o5
	movre	%i4,	%g5,	%l6
	sra	%l1,	0x01,	%i1
loop_889:
	nop
	set	0x78, %l3
	lda	[%l7 + %l3] 0x89,	%f30
	orncc	%g4,	%l4,	%o6
	mulscc	%l5,	%i2,	%o0
	fpadd32s	%f13,	%f21,	%f15
	ta	%icc,	0x5
	fmovscc	%icc,	%f30,	%f25
	nop
	setx	loop_890,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%icc,	0x5
	or	%o7,	%g6,	%g2
	edge8ln	%i6,	%l0,	%g3
loop_890:
	movpos	%xcc,	%o4,	%o1
	smul	%i3,	%o3,	%g1
	fmovdn	%icc,	%f14,	%f15
	fbul,a	%fcc2,	loop_891
	add	%l3,	0x07AA,	%i0
	fzeros	%f15
	bn	%xcc,	loop_892
loop_891:
	smul	%i5,	%i7,	%o2
	movle	%icc,	%l2,	%o5
	srax	%g7,	0x05,	%g5
loop_892:
	addc	%i4,	0x1BFB,	%l1
	brnz,a	%i1,	loop_893
	movrne	%l6,	0x1CE,	%g4
	tle	%icc,	0x2
	andcc	%o6,	%l5,	%l4
loop_893:
	nop
	setx	loop_894,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%o0,	0x0267,	%i2
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf0
	membar	#Sync
loop_894:
	fblg,a	%fcc3,	loop_895
	srax	%g6,	0x19,	%o7
	tne	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_895:
	subc	%i6,	%l0,	%g2
	edge16l	%g3,	%o4,	%o1
	fsrc1s	%f20,	%f25
	movrgz	%o3,	0x2EB,	%i3
	fandnot1s	%f18,	%f12,	%f30
	fbue,a	%fcc2,	loop_896
	fsrc2	%f20,	%f16
	srlx	%g1,	0x02,	%i0
	bvc,a,pt	%xcc,	loop_897
loop_896:
	subccc	%l3,	%i5,	%i7
	andn	%o2,	%l2,	%o5
	stbar
loop_897:
	sdivcc	%g5,	0x19E4,	%i4
	srlx	%g7,	0x14,	%l1
	sth	%l6,	[%l7 + 0x46]
	fpsub32	%f4,	%f0,	%f24
	edge32l	%i1,	%g4,	%l5
	movre	%o6,	%o0,	%i2
	bcc,pt	%xcc,	loop_898
	smulcc	%l4,	%g6,	%o7
	fand	%f24,	%f28,	%f22
	set	0x34, %i1
	ldswa	[%l7 + %i1] 0x04,	%l0
loop_898:
	ta	%xcc,	0x4
	movge	%icc,	%i6,	%g3
	fbo	%fcc0,	loop_899
	srlx	%o4,	0x0E,	%o1
	fmuld8ulx16	%f24,	%f16,	%f12
	stx	%g2,	[%l7 + 0x28]
loop_899:
	fxor	%f20,	%f8,	%f30
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x89,	 0x0
	set	0x40, %l2
	ldswa	[%l7 + %l2] 0x89,	%o3
	sllx	%g1,	0x01,	%l3
	fzero	%f4
	movvs	%xcc,	%i5,	%i0
	movre	%i7,	%l2,	%o5
	movrgez	%g5,	0x180,	%i4
	bcc,a,pn	%xcc,	loop_900
	umulcc	%o2,	%g7,	%l6
	srax	%l1,	%i1,	%l5
	addc	%g4,	%o6,	%i2
loop_900:
	fmovdvs	%xcc,	%f5,	%f19
	sra	%o0,	0x1C,	%l4
	fnands	%f15,	%f15,	%f14
	move	%xcc,	%g6,	%o7
	nop
	setx loop_901, %l0, %l1
	jmpl %l1, %l0
	udiv	%i6,	0x1F32,	%o4
	movrlez	%o1,	%g2,	%g3
	movrlez	%o3,	0x28A,	%g1
loop_901:
	movrne	%l3,	0x090,	%i3
	array8	%i5,	%i7,	%i0
	sethi	0x0C13,	%l2
	fabsd	%f2,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x78, %o6
	lduwa	[%l7 + %o6] 0x04,	%o5
	ta	%icc,	0x5
	wr	%g0,	0x89,	%asi
	stxa	%g5,	[%l7 + 0x08] %asi
	srl	%i4,	0x08,	%g7
	ba	%icc,	loop_902
	srax	%l6,	0x17,	%l1
	movne	%xcc,	%o2,	%l5
	movvc	%icc,	%g4,	%o6
loop_902:
	nop
	setx loop_903, %l0, %l1
	jmpl %l1, %i1
	edge16n	%i2,	%o0,	%g6
	set	0x48, %g3
	stda	%o6,	[%l7 + %g3] 0x04
loop_903:
	fpsub32	%f16,	%f4,	%f22
	sdivx	%l4,	0x1641,	%l0
	fmul8x16au	%f13,	%f16,	%f14
	fornot2	%f22,	%f2,	%f18
	brgez	%i6,	loop_904
	andn	%o1,	%g2,	%o4
	andcc	%o3,	0x0CFB,	%g1
	and	%g3,	0x1498,	%i3
loop_904:
	ta	%xcc,	0x6
	movg	%xcc,	%l3,	%i5
	andcc	%i0,	%i7,	%o5
	fmovdleu	%icc,	%f12,	%f12
	xnor	%g5,	%l2,	%i4
	subc	%l6,	%g7,	%o2
	tge	%xcc,	0x2
	movrgez	%l5,	0x085,	%g4
	tpos	%icc,	0x2
	brgz,a	%l1,	loop_905
	array8	%o6,	%i1,	%i2
	andncc	%o0,	%g6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_905:
	movneg	%icc,	%o7,	%l0
	andcc	%i6,	0x0723,	%o1
	bpos	loop_906
	tcc	%xcc,	0x0
	tvs	%icc,	0x0
	tsubcctv	%o4,	0x1BEF,	%o3
loop_906:
	addcc	%g2,	%g1,	%i3
	set	0x64, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g3
	set	0x7A, %o2
	stha	%i5,	[%l7 + %o2] 0xeb
	membar	#Sync
	umul	%i0,	0x0DA2,	%i7
	sra	%o5,	%l3,	%l2
	fmul8ulx16	%f0,	%f16,	%f10
	stw	%i4,	[%l7 + 0x50]
	move	%icc,	%g5,	%l6
	fmuld8ulx16	%f16,	%f1,	%f4
	alignaddr	%o2,	%g7,	%l5
	fbne	%fcc1,	loop_907
	edge16l	%l1,	%o6,	%i1
	fcmps	%fcc3,	%f9,	%f12
	fmovde	%icc,	%f2,	%f4
loop_907:
	edge32	%i2,	%g4,	%o0
	nop
	setx	loop_908,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fabss	%f25,	%f11
	ldx	[%l7 + 0x50],	%g6
	taddcctv	%l4,	0x1299,	%o7
loop_908:
	fbu,a	%fcc3,	loop_909
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%l0
	tvs	%xcc,	0x5
	fmovrde	%i6,	%f22,	%f14
loop_909:
	fcmple32	%f26,	%f6,	%o1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o3
	fmovsneg	%xcc,	%f14,	%f29
	popc	0x1E26,	%g2
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
	andncc	%g1,	%i3,	%o4
	sllx	%g3,	%i0,	%i7
	movvs	%icc,	%i5,	%l3
loop_910:
	array8	%l2,	%o5,	%g5
	movcc	%icc,	%i4,	%o2
	brz	%g7,	loop_911
	srax	%l5,	%l6,	%o6
	set	0x74, %g4
	ldsha	[%l7 + %g4] 0x88,	%l1
loop_911:
	edge16l	%i1,	%g4,	%i2
	set	0x14, %o4
	lduba	[%l7 + %o4] 0x80,	%o0
	subcc	%g6,	%l4,	%l0
	smulcc	%o7,	0x04F9,	%i6
	ld	[%l7 + 0x60],	%f6
	ld	[%l7 + 0x38],	%f1
	array16	%o1,	%o3,	%g2
	edge8	%i3,	%o4,	%g1
	srax	%i0,	%i7,	%i5
	ta	%icc,	0x6
	sra	%l3,	0x05,	%g3
	edge8n	%l2,	%o5,	%g5
	movgu	%xcc,	%o2,	%i4
	fblg,a	%fcc3,	loop_912
	edge32l	%l5,	%g7,	%l6
	movrlez	%l1,	0x105,	%i1
	edge16ln	%o6,	%i2,	%o0
loop_912:
	edge32ln	%g6,	%g4,	%l4
	brz	%o7,	loop_913
	ba,a,pn	%xcc,	loop_914
	tleu	%icc,	0x7
	movrgez	%i6,	%o1,	%o3
loop_913:
	ta	%icc,	0x3
loop_914:
	sra	%l0,	0x0E,	%i3
	alignaddrl	%g2,	%g1,	%o4
	edge32	%i0,	%i5,	%i7
	andncc	%l3,	%l2,	%o5
	fcmped	%fcc3,	%f18,	%f0
	fbue	%fcc0,	loop_915
	orcc	%g5,	%o2,	%g3
	sdivcc	%i4,	0x146A,	%l5
	movvs	%xcc,	%g7,	%l6
loop_915:
	or	%i1,	%l1,	%i2
	srax	%o6,	%g6,	%g4
	taddcc	%o0,	%o7,	%l4
	tge	%icc,	0x6
	fbule	%fcc3,	loop_916
	xnor	%o1,	0x0AC2,	%o3
	fbne,a	%fcc3,	loop_917
	fbl,a	%fcc2,	loop_918
loop_916:
	fnot1s	%f15,	%f11
	movleu	%xcc,	%i6,	%i3
loop_917:
	tpos	%xcc,	0x4
loop_918:
	movleu	%icc,	%g2,	%l0
	movrne	%o4,	%g1,	%i5
	xor	%i0,	0x16B9,	%l3
	tle	%icc,	0x5
	addc	%l2,	%i7,	%o5
	movre	%g5,	%g3,	%o2
	fmovsa	%icc,	%f17,	%f3
	ld	[%l7 + 0x70],	%f31
	fbule,a	%fcc1,	loop_919
	taddcctv	%i4,	%g7,	%l5
	udiv	%l6,	0x0EB5,	%i1
	mova	%xcc,	%i2,	%o6
loop_919:
	edge32l	%g6,	%l1,	%g4
	fmovdvs	%icc,	%f28,	%f29
	fmovdgu	%xcc,	%f23,	%f24
	ldsw	[%l7 + 0x4C],	%o0
	sllx	%l4,	0x19,	%o7
	edge16l	%o1,	%o3,	%i6
	or	%i3,	0x17FD,	%l0
	fpadd16	%f6,	%f0,	%f24
	bpos,a,pn	%xcc,	loop_920
	mulx	%g2,	%g1,	%o4
	sdiv	%i5,	0x1F60,	%i0
	addc	%l3,	%l2,	%o5
loop_920:
	add	%g5,	0x0084,	%i7
	mulx	%o2,	%i4,	%g3
	edge8l	%g7,	%l6,	%l5
	movneg	%icc,	%i1,	%o6
	movpos	%xcc,	%g6,	%l1
	andncc	%i2,	%o0,	%g4
	fmovrdgez	%o7,	%f24,	%f22
	fandnot1s	%f18,	%f20,	%f21
	bvs,a	loop_921
	smulcc	%l4,	%o3,	%o1
	tvc	%icc,	0x2
	sir	0x116D
loop_921:
	popc	0x0365,	%i6
	siam	0x3
	stx	%i3,	[%l7 + 0x20]
	fcmpne16	%f26,	%f28,	%g2
	stbar
	mova	%xcc,	%g1,	%l0
	ba,pt	%icc,	loop_922
	tvc	%icc,	0x3
	fmovdle	%icc,	%f29,	%f23
	movne	%icc,	%o4,	%i0
loop_922:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udiv	%l3,	0x155B,	%i5
	fsrc1	%f20,	%f24
	udivcc	%o5,	0x1856,	%l2
	fnand	%f6,	%f30,	%f20
	mulx	%g5,	%o2,	%i4
	fmovdpos	%icc,	%f17,	%f13
	tsubcc	%i7,	%g7,	%g3
	subccc	%l5,	0x1B28,	%i1
	orncc	%o6,	0x1D09,	%l6
	set	0x40, %l5
	stda	%g6,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x2E, %l0
	ldstuba	[%l7 + %l0] 0x04,	%l1
	edge32l	%i2,	%g4,	%o7
	movge	%xcc,	%o0,	%l4
	st	%f23,	[%l7 + 0x2C]
	ba,pn	%xcc,	loop_923
	movvs	%xcc,	%o1,	%i6
	fmovrslez	%o3,	%f24,	%f20
	movvs	%icc,	%g2,	%g1
loop_923:
	subccc	%i3,	%o4,	%i0
	edge32n	%l0,	%l3,	%i5
	ldsw	[%l7 + 0x24],	%l2
	addc	%o5,	%g5,	%o2
	bg	loop_924
	ta	%xcc,	0x2
	bcs	loop_925
	taddcc	%i4,	0x16CA,	%g7
loop_924:
	nop
	set	0x4A, %i7
	ldsha	[%l7 + %i7] 0x14,	%g3
loop_925:
	fzeros	%f23
	movge	%icc,	%l5,	%i7
	subc	%i1,	0x1146,	%l6
	nop
	set	0x60, %g6
	sth	%g6,	[%l7 + %g6]
	mulx	%l1,	%o6,	%g4
	orncc	%i2,	0x00C5,	%o7
	bshuffle	%f18,	%f8,	%f10
	movrlez	%o0,	%l4,	%i6
	edge8ln	%o1,	%g2,	%g1
	fpsub32	%f24,	%f16,	%f16
	fcmpes	%fcc3,	%f18,	%f12
	movleu	%icc,	%o3,	%i3
	fmovdne	%icc,	%f26,	%f22
	fsrc1	%f26,	%f6
	fcmple16	%f4,	%f16,	%i0
	stw	%o4,	[%l7 + 0x10]
	edge32l	%l0,	%i5,	%l3
	mulscc	%l2,	0x04EC,	%g5
	fbo,a	%fcc1,	loop_926
	movn	%icc,	%o2,	%i4
	movrgez	%g7,	%g3,	%o5
	set	0x17, %g1
	ldstuba	[%l7 + %g1] 0x10,	%i7
loop_926:
	swap	[%l7 + 0x64],	%l5
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x14,	%f0
	set	0x44, %l6
	lduwa	[%l7 + %l6] 0x89,	%l6
	tl	%xcc,	0x1
	ldstub	[%l7 + 0x15],	%g6
	alignaddrl	%l1,	%i1,	%g4
	fmovsne	%xcc,	%f8,	%f0
	fbuge	%fcc0,	loop_927
	tsubcc	%i2,	%o6,	%o7
	add	%o0,	%l4,	%o1
	edge32ln	%i6,	%g2,	%g1
loop_927:
	tgu	%xcc,	0x1
	addcc	%o3,	0x1FD6,	%i3
	or	%o4,	%l0,	%i5
	subcc	%i0,	%l2,	%l3
	swap	[%l7 + 0x48],	%o2
	mulx	%g5,	%i4,	%g3
	subcc	%o5,	0x02C6,	%i7
	fmovdvs	%icc,	%f5,	%f10
	stbar
	fmovda	%icc,	%f29,	%f9
	movgu	%icc,	%l5,	%g7
	edge16	%l6,	%l1,	%i1
	set	0x54, %o0
	stwa	%g4,	[%l7 + %o0] 0x04
	movre	%i2,	%o6,	%o7
	bge,a	%xcc,	loop_928
	mulx	%o0,	%g6,	%o1
	fmovrdgz	%i6,	%f8,	%f18
	fmovsn	%icc,	%f22,	%f12
loop_928:
	edge8l	%l4,	%g2,	%g1
	array8	%o3,	%i3,	%l0
	movgu	%xcc,	%o4,	%i5
	mova	%icc,	%i0,	%l2
	edge16	%o2,	%l3,	%g5
	xnor	%g3,	%i4,	%o5
	movrlz	%l5,	%g7,	%i7
	fpadd32s	%f30,	%f5,	%f12
	fmovsne	%xcc,	%f27,	%f12
	fmovscc	%icc,	%f2,	%f30
	addccc	%l6,	%i1,	%l1
	fmovsvc	%xcc,	%f8,	%f9
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x08] %asi,	%f14
	tneg	%icc,	0x0
	add	%i2,	0x17A0,	%o6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o7
	fnot1	%f8,	%f28
	fpadd32	%f24,	%f26,	%f14
	ldd	[%l7 + 0x38],	%g4
	edge16n	%g6,	%o0,	%o1
	fmul8x16au	%f14,	%f2,	%f28
	fmovdgu	%xcc,	%f26,	%f3
	orcc	%l4,	%i6,	%g1
	umulcc	%g2,	0x1801,	%o3
	fnand	%f26,	%f30,	%f28
	xnor	%i3,	0x1622,	%l0
	edge32ln	%i5,	%o4,	%i0
	lduh	[%l7 + 0x20],	%l2
	brlz	%l3,	loop_929
	fornot1	%f10,	%f20,	%f14
	fnot1	%f26,	%f8
	movne	%xcc,	%g5,	%o2
loop_929:
	edge16l	%g3,	%i4,	%o5
	sdivx	%l5,	0x0117,	%i7
	fmovdvc	%xcc,	%f26,	%f24
	sir	0x1C05
	fornot2s	%f24,	%f18,	%f25
	fbge,a	%fcc2,	loop_930
	edge32	%l6,	%g7,	%l1
	fandnot1s	%f20,	%f31,	%f15
	andcc	%i2,	%i1,	%o7
loop_930:
	edge8n	%g4,	%o6,	%g6
	bg	%icc,	loop_931
	edge16	%o1,	%l4,	%o0
	tle	%xcc,	0x7
	tvc	%icc,	0x1
loop_931:
	taddcc	%g1,	%i6,	%o3
	andncc	%i3,	%g2,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a,pt	%icc,	loop_932
	sllx	%o4,	0x00,	%i0
	fmovdne	%icc,	%f19,	%f9
	edge32ln	%l2,	%i5,	%l3
loop_932:
	udiv	%o2,	0x1F10,	%g5
	fsrc1s	%f22,	%f27
	fmovrdne	%g3,	%f14,	%f20
	and	%i4,	0x015A,	%l5
	nop
	set	0x34, %l4
	stw	%i7,	[%l7 + %l4]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f18,	%f8,	%f0
	sethi	0x0AFD,	%o5
	flush	%l7 + 0x50
	tge	%xcc,	0x5
	fbe	%fcc1,	loop_933
	udivcc	%g7,	0x1491,	%l1
	alignaddrl	%l6,	%i2,	%o7
	fmuld8ulx16	%f25,	%f2,	%f30
loop_933:
	sir	0x0FD3
	srlx	%g4,	0x0E,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x0
	bpos	%icc,	loop_934
	addccc	%o6,	%g6,	%o1
	smulcc	%o0,	0x09F6,	%g1
	te	%icc,	0x2
loop_934:
	tl	%icc,	0x2
	sub	%i6,	%l4,	%o3
	fandnot1	%f6,	%f20,	%f18
	movrne	%g2,	0x3F4,	%l0
	tcc	%xcc,	0x4
	ld	[%l7 + 0x70],	%f21
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x30] %asi,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1E, %o5
	stba	%o4,	[%l7 + %o5] 0x88
	movvs	%xcc,	%l2,	%i5
	movrgez	%l3,	0x18A,	%o2
	ldub	[%l7 + 0x69],	%i0
	fmovde	%icc,	%f28,	%f29
	sra	%g3,	%g5,	%l5
	set	0x27, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i4
	brlez	%i7,	loop_935
	tne	%xcc,	0x2
	movrgez	%g7,	0x295,	%o5
	stx	%l1,	[%l7 + 0x78]
loop_935:
	tpos	%xcc,	0x1
	tl	%icc,	0x3
	edge16l	%i2,	%l6,	%g4
	fnands	%f2,	%f28,	%f24
	movrne	%i1,	%o7,	%g6
	edge8ln	%o1,	%o0,	%o6
	movrlez	%i6,	%l4,	%o3
	movvs	%xcc,	%g1,	%l0
	tge	%icc,	0x2
	nop
	setx loop_936, %l0, %l1
	jmpl %l1, %g2
	sethi	0x1C31,	%i3
	fmovs	%f6,	%f8
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x56] %asi,	%l2
loop_936:
	udiv	%i5,	0x0258,	%o4
	fmovrsne	%o2,	%f28,	%f6
	fcmpgt16	%f28,	%f24,	%l3
	andncc	%g3,	%i0,	%g5
	addcc	%i4,	0x0144,	%l5
	tneg	%icc,	0x5
	alignaddrl	%i7,	%g7,	%o5
	srax	%l1,	0x1C,	%l6
	edge16	%i2,	%i1,	%o7
	edge8ln	%g4,	%o1,	%g6
	fmovdneg	%icc,	%f4,	%f29
	tgu	%icc,	0x2
	orncc	%o0,	0x1721,	%i6
	fpackfix	%f12,	%f24
	bcs,a,pt	%xcc,	loop_937
	alignaddr	%o6,	%l4,	%g1
	bpos,a	loop_938
	movne	%icc,	%o3,	%l0
loop_937:
	or	%i3,	%l2,	%i5
	edge8l	%o4,	%g2,	%l3
loop_938:
	nop
	set	0x20, %i0
	lda	[%l7 + %i0] 0x0c,	%f9
	set	0x28, %g2
	stxa	%o2,	[%l7 + %g2] 0x2b
	membar	#Sync
	srax	%g3,	%g5,	%i4
	fmovrsgz	%i0,	%f18,	%f10
	subcc	%i7,	%g7,	%l5
	fpsub16	%f12,	%f10,	%f12
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%l1
	taddcc	%o5,	%l6,	%i1
	movrne	%i2,	0x0B8,	%g4
	brgez,a	%o7,	loop_939
	andncc	%g6,	%o1,	%i6
	brnz,a	%o0,	loop_940
	fpmerge	%f6,	%f8,	%f26
loop_939:
	movne	%xcc,	%l4,	%o6
	orcc	%o3,	%g1,	%i3
loop_940:
	fmovrsgz	%l2,	%f19,	%f18
	sdivcc	%l0,	0x0FC8,	%o4
	movre	%g2,	%l3,	%i5
	srl	%o2,	0x01,	%g5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x5E] %asi,	%g3
	st	%f28,	[%l7 + 0x1C]
	ba,a	%xcc,	loop_941
	ble,a	%icc,	loop_942
	fnand	%f6,	%f14,	%f0
	fmul8ulx16	%f16,	%f8,	%f14
loop_941:
	taddcctv	%i0,	%i7,	%i4
loop_942:
	movrlez	%l5,	%l1,	%o5
	set	0x22, %i2
	lduha	[%l7 + %i2] 0x0c,	%g7
	tl	%icc,	0x3
	fmovsleu	%xcc,	%f15,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x4
	edge8n	%l6,	%i2,	%i1
	tvc	%xcc,	0x3
	addccc	%g4,	0x0BDF,	%g6
	edge8	%o1,	%i6,	%o0
	umul	%l4,	0x01CC,	%o7
	orcc	%o6,	%o3,	%g1
	set	0x34, %o1
	stwa	%i3,	[%l7 + %o1] 0x15
	mova	%icc,	%l2,	%o4
	edge16n	%l0,	%g2,	%i5
	fmovdpos	%xcc,	%f13,	%f14
	smulcc	%o2,	%l3,	%g3
	movgu	%xcc,	%g5,	%i0
	fbu,a	%fcc2,	loop_943
	xorcc	%i7,	0x0747,	%i4
	udivx	%l1,	0x1109,	%o5
	siam	0x4
loop_943:
	sra	%g7,	%l6,	%l5
	lduh	[%l7 + 0x26],	%i1
	fpsub32	%f4,	%f28,	%f8
	ldd	[%l7 + 0x40],	%f30
	edge32l	%g4,	%g6,	%o1
	movrne	%i2,	%o0,	%l4
	fmovdge	%icc,	%f27,	%f30
	ld	[%l7 + 0x74],	%f2
	ldd	[%l7 + 0x60],	%f10
	fmovdgu	%xcc,	%f25,	%f21
	set	0x2B, %i3
	ldstuba	[%l7 + %i3] 0x19,	%o7
	tg	%xcc,	0x5
	xnorcc	%o6,	0x1371,	%o3
	fcmpes	%fcc1,	%f25,	%f20
	subc	%g1,	0x01EC,	%i6
	fbue	%fcc3,	loop_944
	movrgez	%i3,	0x10A,	%l2
	nop
	setx	loop_945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	flush	%l7 + 0x6C
loop_944:
	fbge	%fcc0,	loop_946
	tpos	%icc,	0x6
loop_945:
	ta	%xcc,	0x7
	edge16	%o4,	%g2,	%i5
loop_946:
	ldx	[%l7 + 0x48],	%l0
	bshuffle	%f22,	%f24,	%f14
	sdivcc	%l3,	0x103E,	%o2
	sir	0x1CA1
	fnor	%f26,	%f18,	%f18
	bvc	%icc,	loop_947
	fmul8ulx16	%f10,	%f20,	%f10
	tsubcctv	%g3,	0x13F4,	%i0
	fmovspos	%icc,	%f0,	%f13
loop_947:
	movl	%xcc,	%g5,	%i4
	edge8	%i7,	%l1,	%o5
	addccc	%l6,	0x001C,	%l5
	sll	%g7,	%g4,	%g6
	and	%o1,	%i2,	%o0
	sdivcc	%i1,	0x06C0,	%o7
	fabsd	%f12,	%f18
	movl	%xcc,	%o6,	%l4
	ldx	[%l7 + 0x48],	%o3
	bshuffle	%f2,	%f18,	%f20
	taddcc	%i6,	0x1AF2,	%i3
	edge8l	%g1,	%l2,	%o4
	mova	%xcc,	%g2,	%i5
	edge16l	%l0,	%l3,	%o2
	umulcc	%g3,	%i0,	%g5
	orn	%i7,	0x1BC6,	%i4
	fbule,a	%fcc0,	loop_948
	fcmpne32	%f8,	%f22,	%o5
	fnot2s	%f9,	%f26
	bleu,pt	%xcc,	loop_949
loop_948:
	xorcc	%l1,	0x19CA,	%l6
	subc	%g7,	%l5,	%g4
	movre	%g6,	%o1,	%i2
loop_949:
	edge8l	%o0,	%i1,	%o6
	wr	%g0,	0x10,	%asi
	stwa	%o7,	[%l7 + 0x40] %asi
	tge	%xcc,	0x3
	movvc	%xcc,	%l4,	%i6
	tleu	%xcc,	0x4
	umulcc	%o3,	0x03FE,	%g1
	sir	0x03ED
	xnorcc	%l2,	0x1AD2,	%o4
	subccc	%g2,	%i5,	%l0
	fmovs	%f25,	%f1
	bn,a,pt	%icc,	loop_950
	andcc	%l3,	0x0701,	%o2
	tvs	%icc,	0x2
	add	%g3,	%i0,	%i3
loop_950:
	edge32l	%i7,	%g5,	%i4
	fbl,a	%fcc3,	loop_951
	movrlez	%o5,	0x265,	%l6
	fbule	%fcc0,	loop_952
	fpadd16s	%f0,	%f0,	%f19
loop_951:
	movl	%icc,	%g7,	%l1
	bpos,a	%xcc,	loop_953
loop_952:
	and	%g4,	0x18B1,	%g6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x28] %asi,	%o1
loop_953:
	nop
	set	0x48, %g7
	std	%l4,	[%l7 + %g7]
	bleu,a	%icc,	loop_954
	fbo	%fcc0,	loop_955
	movneg	%xcc,	%i2,	%o0
	and	%o6,	%i1,	%l4
loop_954:
	fmovrsne	%i6,	%f5,	%f2
loop_955:
	srl	%o3,	%o7,	%g1
	tleu	%icc,	0x1
	std	%f12,	[%l7 + 0x58]
	fxors	%f24,	%f23,	%f13
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%g2
	movrgz	%i5,	0x075,	%l0
	fbu,a	%fcc0,	loop_956
	fcmpne16	%f18,	%f30,	%l2
	edge16ln	%o2,	%g3,	%i0
	tvs	%xcc,	0x4
loop_956:
	smul	%i3,	%i7,	%g5
	array8	%i4,	%o5,	%l6
	movgu	%icc,	%g7,	%l3
	fnot1s	%f24,	%f29
	orncc	%l1,	0x1AF6,	%g6
	bcs,pt	%icc,	loop_957
	sdivcc	%o1,	0x1D5C,	%g4
	mova	%icc,	%l5,	%o0
	edge32n	%i2,	%i1,	%o6
loop_957:
	tcc	%icc,	0x5
	or	%i6,	%l4,	%o3
	edge8	%g1,	%o7,	%g2
	sdivcc	%i5,	0x1527,	%l0
	movvs	%xcc,	%l2,	%o4
	movgu	%xcc,	%g3,	%o2
	array32	%i0,	%i3,	%i7
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x58] %asi,	%f13
	set	0x1C, %l3
	stwa	%i4,	[%l7 + %l3] 0xe2
	membar	#Sync
	movrlz	%o5,	0x2AB,	%l6
	taddcctv	%g5,	0x03A7,	%l3
	fmovdl	%icc,	%f10,	%f17
	movre	%l1,	0x157,	%g6
	movne	%xcc,	%g7,	%g4
	fbe,a	%fcc1,	loop_958
	edge16n	%l5,	%o0,	%i2
	andn	%o1,	%o6,	%i6
	movge	%icc,	%i1,	%l4
loop_958:
	tleu	%xcc,	0x4
	srl	%g1,	%o7,	%g2
	bleu,a	%icc,	loop_959
	subcc	%o3,	%l0,	%l2
	or	%o4,	%g3,	%o2
	stx	%i5,	[%l7 + 0x78]
loop_959:
	sra	%i3,	%i0,	%i7
	srax	%i4,	%o5,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x2e,	%i6
	fornot2s	%f4,	%f6,	%f16
	edge32n	%l3,	%l1,	%g6
	orn	%g7,	%l5,	%g4
	addc	%i2,	%o0,	%o6
	set	0x40, %i1
	stda	%o0,	[%l7 + %i1] 0x11
	movvc	%xcc,	%i1,	%i6
	movrne	%g1,	%l4,	%o7
	move	%icc,	%g2,	%o3
	bgu,a	loop_960
	fbul	%fcc1,	loop_961
	fbuge	%fcc3,	loop_962
	tle	%icc,	0x4
loop_960:
	mova	%xcc,	%l0,	%o4
loop_961:
	smulcc	%l2,	0x177C,	%g3
loop_962:
	or	%o2,	%i3,	%i0
	fbug,a	%fcc2,	loop_963
	fmovdneg	%xcc,	%f16,	%f15
	andn	%i5,	0x19BF,	%i4
	te	%xcc,	0x6
loop_963:
	nop
	setx	loop_964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnor	%f8,	%f2,	%f14
	edge8	%i7,	%g5,	%o5
	fcmpd	%fcc3,	%f14,	%f28
loop_964:
	subc	%l3,	%l1,	%l6
	umul	%g6,	%g7,	%l5
	ld	[%l7 + 0x18],	%f12
	tle	%xcc,	0x2
	mulx	%g4,	0x1C50,	%i2
	edge32ln	%o0,	%o1,	%o6
	ldd	[%l7 + 0x08],	%f2
	movgu	%icc,	%i6,	%i1
	fandnot1	%f16,	%f18,	%f10
	fbl,a	%fcc1,	loop_965
	tcc	%xcc,	0x3
	fpadd32	%f8,	%f4,	%f4
	bl,pn	%xcc,	loop_966
loop_965:
	srlx	%l4,	0x1A,	%o7
	fnot1	%f2,	%f14
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%g2
loop_966:
	andn	%g1,	%o3,	%l0
	sir	0x0B77
	fxnors	%f16,	%f15,	%f13
	fmul8ulx16	%f18,	%f24,	%f24
	tcs	%xcc,	0x7
	movgu	%icc,	%o4,	%l2
	movvc	%xcc,	%o2,	%g3
	array8	%i0,	%i5,	%i3
	lduh	[%l7 + 0x30],	%i4
	srl	%g5,	0x08,	%i7
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%o5
	and	%l3,	%l1,	%l6
	bg,pn	%icc,	loop_967
	edge8	%g6,	%l5,	%g4
	movrlez	%g7,	%o0,	%i2
	movn	%xcc,	%o1,	%o6
loop_967:
	prefetch	[%l7 + 0x20],	 0x1
	fbl,a	%fcc3,	loop_968
	movvs	%xcc,	%i6,	%i1
	array16	%o7,	%l4,	%g2
	edge8ln	%g1,	%l0,	%o4
loop_968:
	for	%f30,	%f16,	%f24
	brlez,a	%l2,	loop_969
	tsubcc	%o3,	%o2,	%g3
	edge32l	%i0,	%i3,	%i4
	nop
	setx	loop_970,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_969:
	movgu	%icc,	%g5,	%i7
	alignaddr	%o5,	%l3,	%l1
	tvc	%xcc,	0x4
loop_970:
	xnorcc	%l6,	0x0EF1,	%i5
	move	%xcc,	%g6,	%l5
	bn,a	loop_971
	bcs,a	%icc,	loop_972
	sdiv	%g4,	0x0554,	%o0
	fmovsgu	%xcc,	%f11,	%f6
loop_971:
	fornot1s	%f29,	%f0,	%f26
loop_972:
	nop
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x14
	sdiv	%g7,	0x00E8,	%o1
	movle	%icc,	%o6,	%i6
	fpadd16s	%f29,	%f22,	%f14
	fnot2s	%f28,	%f12
	movgu	%xcc,	%i2,	%o7
	stw	%l4,	[%l7 + 0x74]
	set	0x08, %o7
	stwa	%i1,	[%l7 + %o7] 0x80
	tpos	%xcc,	0x2
	tsubcctv	%g1,	%g2,	%l0
	edge8	%l2,	%o4,	%o3
	sllx	%o2,	0x07,	%i0
	movl	%icc,	%g3,	%i4
	fmovsl	%xcc,	%f14,	%f2
	brlez	%g5,	loop_973
	be	%xcc,	loop_974
	fbne,a	%fcc3,	loop_975
	fnands	%f0,	%f24,	%f19
loop_973:
	umulcc	%i3,	%i7,	%o5
loop_974:
	nop
	set	0x51, %o6
	ldsba	[%l7 + %o6] 0x04,	%l1
loop_975:
	tne	%icc,	0x2
	sdivx	%l3,	0x05DD,	%i5
	fcmpne32	%f18,	%f2,	%l6
	tneg	%icc,	0x5
	set	0x18, %l2
	lduha	[%l7 + %l2] 0x80,	%g6
	tpos	%icc,	0x0
	ba,pt	%xcc,	loop_976
	stb	%l5,	[%l7 + 0x76]
	flush	%l7 + 0x78
	fand	%f4,	%f8,	%f28
loop_976:
	sdiv	%o0,	0x00EA,	%g7
	sra	%g4,	%o6,	%o1
	sdiv	%i6,	0x1EDF,	%o7
	fnand	%f22,	%f26,	%f2
	fpadd16s	%f31,	%f2,	%f21
	and	%l4,	0x037C,	%i1
	andcc	%i2,	%g1,	%g2
	movneg	%icc,	%l2,	%o4
	fors	%f5,	%f13,	%f14
	taddcc	%l0,	0x121B,	%o2
	array32	%o3,	%i0,	%i4
	fmovsvs	%icc,	%f16,	%f23
	fpack16	%f26,	%f30
	fpadd32s	%f5,	%f14,	%f20
	taddcc	%g3,	%g5,	%i7
	sdivcc	%i3,	0x1C98,	%o5
	ldub	[%l7 + 0x13],	%l1
	edge32n	%l3,	%l6,	%g6
	fcmpgt32	%f0,	%f6,	%i5
	array16	%l5,	%g7,	%o0
	membar	0x15
	fbuge	%fcc0,	loop_977
	movvs	%icc,	%o6,	%o1
	fone	%f24
	xorcc	%g4,	0x00D2,	%i6
loop_977:
	orncc	%l4,	%o7,	%i2
	fmovrsgz	%g1,	%f12,	%f12
	bn	loop_978
	tgu	%xcc,	0x3
	movg	%icc,	%g2,	%l2
	tsubcc	%o4,	%l0,	%i1
loop_978:
	subcc	%o3,	%i0,	%i4
	fcmped	%fcc2,	%f10,	%f12
	movg	%xcc,	%o2,	%g5
	fmovsgu	%icc,	%f14,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x3
	brz,a	%g3,	loop_979
	bg,a	%xcc,	loop_980
	movrne	%i7,	%i3,	%l1
	tge	%xcc,	0x6
loop_979:
	addcc	%o5,	%l6,	%l3
loop_980:
	movrne	%g6,	0x0C2,	%l5
	tsubcctv	%i5,	0x1854,	%o0
	set	0x18, %i5
	lda	[%l7 + %i5] 0x11,	%f6
	alignaddrl	%o6,	%g7,	%o1
	edge32ln	%g4,	%l4,	%i6
	movvs	%icc,	%o7,	%i2
	call	loop_981
	fornot1s	%f17,	%f0,	%f30
	bge,a,pt	%icc,	loop_982
	edge8ln	%g2,	%g1,	%l2
loop_981:
	edge32n	%o4,	%l0,	%o3
	tn	%icc,	0x5
loop_982:
	edge8	%i0,	%i4,	%i1
	fmovrde	%o2,	%f22,	%f12
	tneg	%xcc,	0x4
	fmovrdgz	%g3,	%f0,	%f6
	smul	%i7,	%i3,	%g5
	taddcc	%o5,	%l6,	%l1
	te	%icc,	0x4
	bne,pt	%xcc,	loop_983
	siam	0x2
	fxnors	%f14,	%f27,	%f28
	fmovsge	%xcc,	%f27,	%f7
loop_983:
	sdivx	%g6,	0x0543,	%l3
	movrlz	%i5,	%l5,	%o6
	umul	%g7,	0x14D5,	%o1
	brlz,a	%o0,	loop_984
	membar	0x29
	andncc	%l4,	%i6,	%o7
	add	%i2,	0x05FF,	%g4
loop_984:
	edge16l	%g1,	%l2,	%o4
	addccc	%g2,	%o3,	%i0
	membar	0x39
	subcc	%i4,	0x027B,	%l0
	sllx	%i1,	0x08,	%o2
	orncc	%i7,	0x106C,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g5,	%o5,	%i3
	movcc	%icc,	%l6,	%g6
	movvc	%icc,	%l3,	%i5
	andncc	%l1,	%o6,	%l5
	xnorcc	%o1,	%o0,	%g7
	te	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	stda	%i6,	[%l7 + 0x28] %asi
	movvs	%icc,	%l4,	%i2
	pdist	%f6,	%f4,	%f14
	brlez	%o7,	loop_985
	fxnors	%f4,	%f1,	%f9
	srlx	%g4,	%g1,	%l2
	subc	%g2,	0x0B53,	%o4
loop_985:
	ld	[%l7 + 0x4C],	%f28
	nop
	set	0x6C, %o2
	ldsw	[%l7 + %o2],	%i0
	edge32ln	%i4,	%l0,	%i1
	fones	%f19
	tge	%icc,	0x4
	fcmpne32	%f18,	%f22,	%o2
	fpack32	%f24,	%f20,	%f8
	ld	[%l7 + 0x6C],	%f29
	umul	%o3,	0x16C6,	%i7
	tle	%icc,	0x6
	fnegs	%f31,	%f17
	fxnor	%f30,	%f26,	%f28
	add	%l7,	0x64,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x19,	%g3,	%o5
	taddcctv	%i3,	0x1AA6,	%g5
	movre	%g6,	%l6,	%i5
	sll	%l3,	%o6,	%l5
	movrlez	%l1,	%o0,	%o1
	fpack32	%f26,	%f2,	%f18
	brgez	%g7,	loop_986
	srl	%i6,	%l4,	%i2
	fsrc2s	%f24,	%f17
	edge8ln	%o7,	%g1,	%g4
loop_986:
	edge16	%g2,	%o4,	%i0
	ta	%xcc,	0x1
	set	0x64, %g3
	lda	[%l7 + %g3] 0x04,	%f14
	brz	%l2,	loop_987
	movcs	%icc,	%l0,	%i4
	sethi	0x08F1,	%o2
	movrlz	%o3,	0x2DD,	%i1
loop_987:
	sdiv	%g3,	0x0AD9,	%o5
	sethi	0x130F,	%i7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x44] %asi,	%i3
	brz,a	%g5,	loop_988
	fones	%f28
	and	%l6,	%i5,	%g6
	fmovsa	%icc,	%f7,	%f23
loop_988:
	ldx	[%l7 + 0x28],	%l3
	umulcc	%o6,	%l5,	%l1
	tn	%xcc,	0x6
	sdivcc	%o0,	0x01E2,	%o1
	set	0x40, %o3
	stxa	%g7,	[%l7 + %o3] 0xea
	membar	#Sync
	umul	%i6,	%l4,	%o7
	fmovda	%xcc,	%f9,	%f28
	tgu	%icc,	0x3
	sethi	0x0ACB,	%i2
	alignaddr	%g4,	%g1,	%o4
	udivcc	%i0,	0x0E4B,	%g2
	fpsub32s	%f23,	%f11,	%f13
	edge16n	%l0,	%l2,	%i4
	nop
	setx	loop_989,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpne32	%f8,	%f4,	%o3
	tvc	%xcc,	0x2
	addc	%i1,	0x0AE8,	%g3
loop_989:
	orcc	%o5,	0x073D,	%i7
	fble	%fcc1,	loop_990
	bcs,a,pn	%xcc,	loop_991
	fnors	%f31,	%f12,	%f29
	membar	0x14
loop_990:
	tsubcctv	%i3,	%o2,	%g5
loop_991:
	stbar
	sdivx	%l6,	0x06E5,	%g6
	fsrc2	%f18,	%f12
	sdivx	%i5,	0x09F3,	%o6
	move	%icc,	%l3,	%l5
	brgez,a	%o0,	loop_992
	movg	%xcc,	%l1,	%g7
	fands	%f13,	%f9,	%f18
	tsubcc	%o1,	%i6,	%l4
loop_992:
	fmovrsgz	%i2,	%f2,	%f9
	fornot1s	%f22,	%f13,	%f23
	add	%o7,	0x0FC8,	%g4
	tle	%xcc,	0x2
	movle	%icc,	%o4,	%i0
	movg	%xcc,	%g2,	%l0
	fbul	%fcc2,	loop_993
	ldd	[%l7 + 0x48],	%l2
	bvc,pt	%icc,	loop_994
	umul	%g1,	0x04A3,	%o3
loop_993:
	nop
	set	0x4A, %o4
	stha	%i1,	[%l7 + %o4] 0x27
	membar	#Sync
loop_994:
	fones	%f26
	fpmerge	%f19,	%f13,	%f16
	fandnot2	%f20,	%f18,	%f24
	edge8n	%i4,	%g3,	%i7
	fblg,a	%fcc2,	loop_995
	tg	%icc,	0x5
	fmuld8ulx16	%f29,	%f20,	%f6
	brlez	%o5,	loop_996
loop_995:
	fmovsle	%icc,	%f17,	%f1
	movleu	%xcc,	%i3,	%g5
	fmovdcc	%icc,	%f14,	%f13
loop_996:
	xnorcc	%l6,	%g6,	%o2
	fmovrse	%o6,	%f8,	%f1
	sdivcc	%i5,	0x08C6,	%l5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%l3
	array32	%l1,	%g7,	%o0
	movrlez	%o1,	0x2BB,	%i6
	ldsh	[%l7 + 0x76],	%i2
	tneg	%icc,	0x3
	tle	%icc,	0x7
	ld	[%l7 + 0x30],	%f0
	lduw	[%l7 + 0x24],	%l4
	fmovrslz	%g4,	%f31,	%f29
	sub	%o7,	%o4,	%i0
	edge32ln	%g2,	%l0,	%g1
	sll	%o3,	0x10,	%l2
	subcc	%i4,	0x1FDB,	%i1
	fxnors	%f12,	%f15,	%f21
	tsubcc	%i7,	%o5,	%i3
	fbug,a	%fcc1,	loop_997
	fmovrslez	%g5,	%f2,	%f12
	edge16n	%l6,	%g3,	%o2
	movvs	%xcc,	%o6,	%g6
loop_997:
	smul	%l5,	0x09D8,	%i5
	fpadd32	%f6,	%f4,	%f22
	movgu	%icc,	%l3,	%l1
	tsubcc	%g7,	0x0410,	%o1
	brlez,a	%o0,	loop_998
	movl	%xcc,	%i2,	%i6
	brnz	%g4,	loop_999
	movleu	%xcc,	%l4,	%o4
loop_998:
	fcmpne32	%f26,	%f10,	%o7
	edge16l	%g2,	%l0,	%i0
loop_999:
	movrlz	%o3,	%l2,	%g1
	move	%icc,	%i1,	%i4
	fbl	%fcc2,	loop_1000
	tpos	%xcc,	0x5
	tcs	%xcc,	0x1
	alignaddr	%o5,	%i7,	%g5
loop_1000:
	udivx	%i3,	0x101B,	%l6
	movne	%icc,	%g3,	%o6
	fmovrde	%o2,	%f18,	%f8
	fbn,a	%fcc0,	loop_1001
	movpos	%icc,	%g6,	%i5
	sra	%l5,	0x00,	%l3
	xor	%g7,	0x1C62,	%o1
loop_1001:
	edge16	%o0,	%i2,	%l1
	mulx	%i6,	%l4,	%o4
	prefetch	[%l7 + 0x08],	 0x0
	add	%o7,	%g2,	%l0
	movvs	%icc,	%g4,	%o3
	ble,pn	%xcc,	loop_1002
	movre	%i0,	%g1,	%i1
	fnand	%f10,	%f0,	%f14
	fornot2s	%f8,	%f12,	%f28
loop_1002:
	or	%i4,	%o5,	%l2
	movl	%xcc,	%i7,	%i3
	fcmpd	%fcc0,	%f4,	%f26
	alignaddrl	%l6,	%g5,	%o6
	fcmpne16	%f26,	%f6,	%o2
	st	%f6,	[%l7 + 0x60]
	sdiv	%g6,	0x147D,	%g3
	tleu	%icc,	0x6
	movrlez	%l5,	%l3,	%g7
	fbl,a	%fcc0,	loop_1003
	fmovdneg	%xcc,	%f26,	%f27
	addc	%i5,	%o0,	%o1
	fpsub16s	%f3,	%f5,	%f13
loop_1003:
	movrne	%i2,	0x226,	%i6
	fmovdcc	%xcc,	%f27,	%f3
	mulx	%l4,	0x09A0,	%o4
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x80
	st	%f16,	[%l7 + 0x28]
	fands	%f21,	%f22,	%f27
	sethi	0x11E8,	%l1
	subccc	%g2,	0x024C,	%l0
	movrne	%g4,	%o3,	%o7
	tl	%xcc,	0x1
	add	%i0,	0x08AA,	%i1
	xnorcc	%i4,	0x1815,	%o5
	fmovdne	%icc,	%f25,	%f24
	tvs	%icc,	0x7
	mulscc	%l2,	0x0407,	%i7
	tne	%xcc,	0x2
	ldstub	[%l7 + 0x0C],	%i3
	sllx	%g1,	%g5,	%o6
	orncc	%o2,	%g6,	%g3
	sll	%l5,	%l3,	%l6
	set	0x16, %l0
	ldstuba	[%l7 + %l0] 0x11,	%i5
	srax	%o0,	0x07,	%g7
	alignaddrl	%i2,	%i6,	%o1
	ble,a,pt	%xcc,	loop_1004
	fbug,a	%fcc0,	loop_1005
	array16	%o4,	%l4,	%g2
	fexpand	%f6,	%f26
loop_1004:
	tvs	%xcc,	0x4
loop_1005:
	bgu,pt	%icc,	loop_1006
	fmovsleu	%icc,	%f14,	%f9
	movle	%xcc,	%l0,	%l1
	fsrc2s	%f23,	%f31
loop_1006:
	bpos,a	loop_1007
	be,pn	%icc,	loop_1008
	brlez	%o3,	loop_1009
	taddcc	%g4,	%o7,	%i0
loop_1007:
	tleu	%icc,	0x6
loop_1008:
	movvc	%xcc,	%i4,	%o5
loop_1009:
	ld	[%l7 + 0x74],	%f14
	sll	%i1,	%i7,	%i3
	fmovsle	%xcc,	%f31,	%f14
	fmovrslz	%l2,	%f22,	%f16
	alignaddrl	%g1,	%o6,	%o2
	add	%g5,	%g3,	%l5
	xnor	%g6,	%l6,	%l3
	ldd	[%l7 + 0x30],	%o0
	fnot2	%f26,	%f24
	mulscc	%i5,	0x0898,	%i2
	movne	%icc,	%g7,	%i6
	taddcctv	%o1,	%l4,	%g2
	edge32n	%o4,	%l0,	%l1
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x88,	%o3
	tcs	%icc,	0x6
	alignaddrl	%o7,	%i0,	%g4
	tl	%icc,	0x3
	array32	%i4,	%o5,	%i1
	edge32	%i7,	%l2,	%g1
	sethi	0x0159,	%o6
	wr	%g0,	0x2f,	%asi
	stda	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	addccc	%i3,	%g3,	%g5
	sll	%l5,	%l6,	%l3
	array8	%o0,	%i5,	%i2
	swap	[%l7 + 0x38],	%g7
	wr	%g0,	0xe2,	%asi
	stxa	%i6,	[%l7 + 0x38] %asi
	membar	#Sync
	set	0x38, %i7
	stxa	%o1,	[%l7 + %i7] 0x88
	tge	%xcc,	0x3
	and	%g6,	0x00DB,	%g2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvc	%xcc,	0x5
	fba,a	%fcc2,	loop_1010
	tl	%icc,	0x1
	srlx	%l4,	0x0F,	%l0
	fzero	%f22
loop_1010:
	fmovdl	%xcc,	%f22,	%f10
	fbn,a	%fcc1,	loop_1011
	alignaddr	%l1,	%o3,	%o4
	srlx	%i0,	0x0A,	%o7
	xnorcc	%g4,	0x05EE,	%o5
loop_1011:
	addcc	%i4,	0x1CFB,	%i1
	tcs	%icc,	0x2
	or	%l2,	0x0592,	%g1
	edge8l	%i7,	%o6,	%o2
	xor	%g3,	%g5,	%l5
	fpsub32s	%f9,	%f20,	%f8
	fmovscc	%xcc,	%f28,	%f19
	brgz,a	%i3,	loop_1012
	tn	%icc,	0x3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x08] %asi,	%l6
loop_1012:
	nop
	set	0x49, %g6
	ldstuba	[%l7 + %g6] 0x10,	%l3
	tgu	%icc,	0x2
	ba	loop_1013
	orcc	%i5,	%i2,	%o0
	fpsub32	%f26,	%f8,	%f20
	movre	%g7,	%o1,	%g6
loop_1013:
	umulcc	%i6,	%l4,	%g2
	fxnors	%f7,	%f17,	%f17
	ldstub	[%l7 + 0x7A],	%l1
	movl	%icc,	%l0,	%o3
	array8	%o4,	%o7,	%g4
	brgz	%i0,	loop_1014
	tne	%xcc,	0x6
	edge8	%o5,	%i1,	%i4
	sdiv	%g1,	0x02A9,	%l2
loop_1014:
	xnorcc	%i7,	%o2,	%g3
	tg	%icc,	0x0
	movcc	%xcc,	%o6,	%g5
	sdivx	%i3,	0x17CA,	%l6
	fmovscc	%xcc,	%f13,	%f4
	std	%f26,	[%l7 + 0x30]
	fmovrsgz	%l5,	%f18,	%f11
	fabss	%f14,	%f1
	array8	%l3,	%i5,	%o0
	xnorcc	%i2,	0x0282,	%g7
	fbu,a	%fcc1,	loop_1015
	fandnot1s	%f7,	%f29,	%f8
	movrgz	%g6,	%i6,	%l4
	fcmpne16	%f10,	%f12,	%o1
loop_1015:
	udivcc	%g2,	0x0949,	%l1
	sir	0x0A8C
	xnor	%l0,	%o3,	%o4
	fxors	%f14,	%f3,	%f4
	edge32ln	%g4,	%o7,	%o5
	bne,a,pt	%icc,	loop_1016
	movn	%icc,	%i0,	%i4
	tl	%icc,	0x1
	fmovscc	%icc,	%f22,	%f11
loop_1016:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x16,	%f16
	movvs	%icc,	%l2,	%i1
	fmovsa	%icc,	%f19,	%f21
	stbar
	srax	%o2,	0x1B,	%i7
	fmuld8sux16	%f7,	%f4,	%f6
	subc	%g3,	%o6,	%g5
	tg	%icc,	0x6
	fone	%f20
	brz	%l6,	loop_1017
	alignaddr	%l5,	%l3,	%i5
	fandnot2s	%f4,	%f1,	%f3
	sll	%i3,	%o0,	%g7
loop_1017:
	movrgez	%i2,	0x05D,	%i6
	bcc,pn	%xcc,	loop_1018
	tvs	%xcc,	0x7
	brnz,a	%g6,	loop_1019
	bshuffle	%f22,	%f0,	%f2
loop_1018:
	fors	%f19,	%f3,	%f4
	addccc	%o1,	%g2,	%l1
loop_1019:
	fba	%fcc2,	loop_1020
	ba,a	%icc,	loop_1021
	fmovscs	%xcc,	%f21,	%f15
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x0c,	%l4
loop_1020:
	call	loop_1022
loop_1021:
	brz	%l0,	loop_1023
	te	%icc,	0x0
	array8	%o3,	%g4,	%o4
loop_1022:
	fbue,a	%fcc3,	loop_1024
loop_1023:
	tgu	%xcc,	0x1
	alignaddr	%o5,	%o7,	%i4
	sir	0x1E95
loop_1024:
	sth	%g1,	[%l7 + 0x46]
	sll	%i0,	0x17,	%l2
	bne,pn	%xcc,	loop_1025
	tg	%icc,	0x3
	fsrc1s	%f17,	%f30
	or	%o2,	%i7,	%i1
loop_1025:
	tvs	%icc,	0x0
	sdivx	%o6,	0x05C7,	%g3
	sub	%g5,	%l5,	%l3
	andn	%i5,	%l6,	%i3
	umul	%g7,	0x1A07,	%o0
	movvc	%xcc,	%i6,	%g6
	fsrc2	%f10,	%f8
	movl	%xcc,	%i2,	%o1
	fcmpne16	%f24,	%f24,	%g2
	fmovscs	%icc,	%f26,	%f29
	add	%l1,	0x07BE,	%l0
	fcmple32	%f14,	%f12,	%o3
	udivcc	%g4,	0x1702,	%o4
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	edge32l	%l4,	%o7,	%g1
	addcc	%i4,	0x08F7,	%i0
	tvs	%xcc,	0x2
	fxnors	%f2,	%f4,	%f14
	fones	%f12
	srlx	%o2,	%i7,	%i1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o6,	%l2
	fbn,a	%fcc0,	loop_1026
	umulcc	%g3,	0x1AC4,	%g5
	bcs,a	loop_1027
	orcc	%l5,	0x0753,	%i5
loop_1026:
	fbule,a	%fcc3,	loop_1028
	movgu	%xcc,	%l6,	%l3
loop_1027:
	tne	%xcc,	0x1
	ldsh	[%l7 + 0x4E],	%g7
loop_1028:
	orncc	%o0,	%i3,	%i6
	brnz,a	%i2,	loop_1029
	movgu	%icc,	%g6,	%o1
	tsubcc	%g2,	0x17D1,	%l0
	tle	%xcc,	0x2
loop_1029:
	fands	%f11,	%f21,	%f2
	fxnor	%f4,	%f10,	%f14
	fmovsa	%icc,	%f0,	%f23
	srax	%o3,	0x15,	%g4
	tgu	%xcc,	0x0
	fcmpne32	%f8,	%f8,	%o4
	move	%icc,	%o5,	%l1
	edge32ln	%o7,	%g1,	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x04,	%l4,	%i0
	or	%o2,	%i7,	%o6
	popc	%i1,	%g3
	stb	%l2,	[%l7 + 0x33]
	set	0x36, %o0
	lduha	[%l7 + %o0] 0x89,	%g5
	tle	%xcc,	0x4
	subccc	%l5,	0x1E88,	%i5
	fpsub16	%f26,	%f4,	%f18
	ld	[%l7 + 0x40],	%f4
	alignaddrl	%l6,	%g7,	%l3
	mova	%icc,	%i3,	%o0
	movre	%i6,	%g6,	%i2
	alignaddrl	%g2,	%l0,	%o1
	fand	%f10,	%f6,	%f18
	fxnors	%f18,	%f29,	%f19
	nop
	setx loop_1030, %l0, %l1
	jmpl %l1, %g4
	udivx	%o4,	0x058F,	%o3
	fmovscc	%xcc,	%f13,	%f6
	fcmpes	%fcc1,	%f24,	%f1
loop_1030:
	andncc	%o5,	%o7,	%l1
	udivx	%i4,	0x10E7,	%g1
	sdivx	%i0,	0x0901,	%l4
	fones	%f25
	edge32n	%o2,	%i7,	%i1
	fmovrdlez	%g3,	%f14,	%f8
	movrgz	%l2,	0x03A,	%g5
	fbule	%fcc0,	loop_1031
	movvs	%xcc,	%o6,	%l5
	lduw	[%l7 + 0x58],	%i5
	for	%f22,	%f2,	%f16
loop_1031:
	alignaddr	%l6,	%l3,	%g7
	bg,a,pt	%xcc,	loop_1032
	edge8n	%i3,	%o0,	%g6
	fand	%f10,	%f16,	%f16
	tcs	%xcc,	0x7
loop_1032:
	orcc	%i2,	0x15B3,	%i6
	fmovscc	%xcc,	%f0,	%f8
	edge16n	%g2,	%o1,	%g4
	smul	%o4,	0x1A48,	%l0
	ldsb	[%l7 + 0x2E],	%o3
	movge	%xcc,	%o5,	%l1
	xnor	%i4,	0x1DA0,	%o7
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x89,	%i0
	array8	%l4,	%g1,	%i7
	alignaddr	%i1,	%g3,	%l2
	bge,a,pn	%xcc,	loop_1033
	fbn,a	%fcc1,	loop_1034
	movg	%xcc,	%g5,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1033:
	orn	%o2,	%l5,	%l6
loop_1034:
	movge	%xcc,	%i5,	%g7
	brnz	%l3,	loop_1035
	fnors	%f11,	%f15,	%f2
	tpos	%xcc,	0x6
	sdivcc	%i3,	0x098D,	%o0
loop_1035:
	addc	%i2,	0x11FE,	%g6
	edge16n	%g2,	%i6,	%o1
	edge8l	%g4,	%o4,	%o3
	fbge	%fcc3,	loop_1036
	umul	%o5,	0x10E4,	%l1
	fbug	%fcc3,	loop_1037
	fmovrdlz	%l0,	%f4,	%f0
loop_1036:
	fpadd16	%f14,	%f4,	%f22
	move	%icc,	%o7,	%i0
loop_1037:
	tvs	%xcc,	0x3
	brnz	%l4,	loop_1038
	fbge	%fcc2,	loop_1039
	srlx	%g1,	0x18,	%i4
	fxor	%f30,	%f6,	%f26
loop_1038:
	movvs	%icc,	%i1,	%g3
loop_1039:
	addcc	%i7,	%l2,	%g5
	tle	%xcc,	0x4
	subc	%o2,	0x1576,	%o6
	set	0x50, %o5
	ldda	[%l7 + %o5] 0xe3,	%i6
	fbug	%fcc3,	loop_1040
	andn	%l5,	%g7,	%i5
	ta	%xcc,	0x7
	edge16n	%i3,	%o0,	%l3
loop_1040:
	brnz,a	%g6,	loop_1041
	edge32n	%i2,	%i6,	%o1
	ld	[%l7 + 0x70],	%f29
	udivcc	%g4,	0x0EB4,	%o4
loop_1041:
	tle	%xcc,	0x6
	edge32ln	%g2,	%o3,	%o5
	edge32	%l1,	%l0,	%i0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o7,	%l4
	edge32	%i4,	%i1,	%g3
	fandnot1	%f6,	%f4,	%f26
	edge32ln	%i7,	%g1,	%l2
	movgu	%icc,	%g5,	%o2
	set	0x4C, %i4
	stwa	%l6,	[%l7 + %i4] 0x04
	edge8ln	%o6,	%g7,	%i5
	edge32ln	%i3,	%o0,	%l5
	orncc	%l3,	0x0C9A,	%g6
	sethi	0x13A1,	%i2
	alignaddrl	%i6,	%o1,	%o4
	lduw	[%l7 + 0x64],	%g4
	bneg,a	loop_1042
	tvs	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%o3
loop_1042:
	tn	%xcc,	0x2
	alignaddrl	%o5,	%l1,	%l0
	movrgz	%i0,	0x320,	%g2
	fcmpeq32	%f26,	%f12,	%l4
	andncc	%o7,	%i1,	%g3
	tge	%xcc,	0x1
	udivcc	%i4,	0x0230,	%i7
	alignaddr	%l2,	%g1,	%g5
	brnz	%o2,	loop_1043
	fbne	%fcc2,	loop_1044
	sth	%l6,	[%l7 + 0x5A]
	tvc	%xcc,	0x4
loop_1043:
	array8	%o6,	%g7,	%i5
loop_1044:
	alignaddr	%o0,	%i3,	%l5
	udiv	%g6,	0x0CE2,	%i2
	xor	%l3,	0x0053,	%i6
	edge16	%o1,	%o4,	%o3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x68] %asi,	%o5
	movrlz	%g4,	0x213,	%l0
	xorcc	%i0,	%l1,	%l4
	tcc	%xcc,	0x2
	tg	%xcc,	0x1
	bg,a	%xcc,	loop_1045
	ble	%xcc,	loop_1046
	subccc	%o7,	0x12A6,	%i1
	fmul8x16	%f1,	%f6,	%f0
loop_1045:
	andcc	%g2,	%i4,	%g3
loop_1046:
	xnor	%i7,	%g1,	%l2
	sllx	%g5,	%o2,	%o6
	movcs	%xcc,	%g7,	%i5
	movg	%xcc,	%l6,	%o0
	membar	0x12
	taddcctv	%l5,	%g6,	%i3
	fpmerge	%f20,	%f31,	%f20
	movle	%icc,	%i2,	%i6
	movrlz	%l3,	0x3FA,	%o4
	sub	%o3,	0x15CB,	%o1
	fbug	%fcc1,	loop_1047
	fxnor	%f16,	%f6,	%f26
	prefetch	[%l7 + 0x58],	 0x0
	subccc	%o5,	0x1D81,	%l0
loop_1047:
	brlz,a	%g4,	loop_1048
	fcmpne16	%f26,	%f24,	%l1
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i0
loop_1048:
	ldsb	[%l7 + 0x24],	%l4
	tsubcctv	%o7,	%g2,	%i4
	brnz,a	%g3,	loop_1049
	ble,a	%icc,	loop_1050
	bleu,a	%xcc,	loop_1051
	ba,a	%icc,	loop_1052
loop_1049:
	tpos	%icc,	0x6
loop_1050:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x74] %asi,	%i1
loop_1051:
	movpos	%icc,	%g1,	%l2
loop_1052:
	bcc,a,pn	%xcc,	loop_1053
	fmuld8ulx16	%f30,	%f17,	%f24
	fbuge	%fcc3,	loop_1054
	fnor	%f8,	%f0,	%f20
loop_1053:
	tne	%xcc,	0x4
	tcc	%xcc,	0x6
loop_1054:
	sdivcc	%i7,	0x00CC,	%g5
	fcmps	%fcc2,	%f6,	%f3
	xorcc	%o6,	0x1477,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g7,	0x0306,	%l6
	fmovrslez	%o0,	%f21,	%f12
	bpos,a	loop_1055
	lduw	[%l7 + 0x44],	%i5
	fmovrdlez	%g6,	%f12,	%f16
	stb	%l5,	[%l7 + 0x3B]
loop_1055:
	tge	%icc,	0x5
	edge8n	%i2,	%i6,	%l3
	fmovsleu	%xcc,	%f0,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i3,	0x146B,	%o4
	edge8	%o3,	%o1,	%o5
	fbule,a	%fcc1,	loop_1056
	fcmped	%fcc0,	%f10,	%f28
	tn	%icc,	0x4
	subcc	%g4,	0x1066,	%l1
loop_1056:
	te	%xcc,	0x5
	tcc	%xcc,	0x5
	ld	[%l7 + 0x50],	%f24
	ta	%xcc,	0x1
	nop
	setx	loop_1057,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%i0,	0x1B83,	%l4
	and	%l0,	0x1C8B,	%o7
	sllx	%g2,	%g3,	%i4
loop_1057:
	fpadd16	%f12,	%f30,	%f28
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x44] %asi,	%f8
	sethi	0x15D7,	%l2
	ble,pt	%icc,	loop_1058
	nop
	setx	loop_1059,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%i1,	%i7
	andcc	%o6,	%g5,	%g7
loop_1058:
	tsubcc	%o2,	0x0F07,	%l6
loop_1059:
	fmovdg	%xcc,	%f5,	%f4
	array32	%i5,	%o0,	%g6
	alignaddr	%i2,	%l5,	%i6
	tl	%icc,	0x7
	fnot2s	%f8,	%f4
	tcs	%xcc,	0x7
	bcs	loop_1060
	edge32l	%i3,	%o4,	%l3
	ba,a	%icc,	loop_1061
	smulcc	%o1,	%o5,	%o3
loop_1060:
	bleu	loop_1062
	ldsw	[%l7 + 0x28],	%g4
loop_1061:
	fmovdge	%xcc,	%f11,	%f27
	bpos,pn	%icc,	loop_1063
loop_1062:
	tne	%xcc,	0x4
	bleu,a,pt	%xcc,	loop_1064
	edge32ln	%i0,	%l4,	%l0
loop_1063:
	array32	%o7,	%l1,	%g3
	umulcc	%g2,	%i4,	%g1
loop_1064:
	tneg	%icc,	0x6
	or	%i1,	0x1B74,	%l2
	movneg	%xcc,	%o6,	%i7
	fmovdleu	%xcc,	%f1,	%f17
	bneg,a	%icc,	loop_1065
	edge32l	%g7,	%g5,	%l6
	ldstub	[%l7 + 0x6E],	%i5
	movcc	%icc,	%o0,	%g6
loop_1065:
	movrlez	%i2,	%o2,	%i6
	xor	%l5,	0x12F8,	%i3
	srl	%o4,	%o1,	%o5
	fba	%fcc1,	loop_1066
	movg	%xcc,	%o3,	%l3
	be,a	%xcc,	loop_1067
	fnot2s	%f5,	%f3
loop_1066:
	fmovsneg	%xcc,	%f30,	%f5
	call	loop_1068
loop_1067:
	movne	%xcc,	%g4,	%l4
	addccc	%i0,	%l0,	%o7
	andn	%g3,	0x1CC1,	%l1
loop_1068:
	st	%f16,	[%l7 + 0x64]
	lduw	[%l7 + 0x74],	%i4
	fcmpeq32	%f16,	%f30,	%g2
	brgez	%g1,	loop_1069
	sll	%l2,	0x10,	%o6
	tl	%icc,	0x5
	edge8	%i7,	%i1,	%g5
loop_1069:
	subc	%l6,	%i5,	%g7
	fmovsge	%xcc,	%f10,	%f12
	tvs	%icc,	0x4
	set	0x28, %l4
	lda	[%l7 + %l4] 0x15,	%f14
	set	0x44, %g2
	sta	%f22,	[%l7 + %g2] 0x04
	tvc	%xcc,	0x5
	sll	%o0,	0x0D,	%i2
	swap	[%l7 + 0x6C],	%g6
	brnz	%o2,	loop_1070
	smul	%i6,	0x0C46,	%l5
	fandnot2	%f18,	%f22,	%f22
	fbule	%fcc3,	loop_1071
loop_1070:
	bl,pt	%icc,	loop_1072
	udivcc	%i3,	0x0A56,	%o1
	stb	%o5,	[%l7 + 0x28]
loop_1071:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
loop_1072:
	bgu,a,pn	%icc,	loop_1073
	udivx	%o4,	0x08E6,	%l3
	fbg	%fcc1,	loop_1074
	fpack16	%f20,	%f24
loop_1073:
	tcs	%xcc,	0x1
	siam	0x1
loop_1074:
	tsubcctv	%g4,	%l4,	%l0
	bshuffle	%f24,	%f24,	%f12
	set	0x54, %i2
	lduwa	[%l7 + %i2] 0x14,	%i0
	faligndata	%f0,	%f2,	%f2
	tsubcctv	%g3,	%o7,	%i4
	fpadd16s	%f19,	%f13,	%f29
	bne,a,pn	%icc,	loop_1075
	mova	%xcc,	%l1,	%g2
	addcc	%l2,	0x102E,	%g1
	edge32n	%o6,	%i7,	%i1
loop_1075:
	movrne	%g5,	0x1E3,	%l6
	sth	%i5,	[%l7 + 0x58]
	tneg	%icc,	0x6
	udiv	%g7,	0x0F9D,	%i2
	smulcc	%o0,	%g6,	%o2
	edge8	%i6,	%i3,	%o1
	lduw	[%l7 + 0x58],	%o5
	movrlez	%o3,	0x393,	%l5
	movcs	%icc,	%l3,	%o4
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	bneg	loop_1076
	movgu	%xcc,	%g4,	%l0
	edge16n	%i0,	%g3,	%o7
	or	%l1,	%g2,	%i4
loop_1076:
	sth	%g1,	[%l7 + 0x2C]
	fmovde	%icc,	%f24,	%f24
	andcc	%l2,	%o6,	%i7
	ble,a	loop_1077
	fmovrslz	%g5,	%f12,	%f16
	membar	0x0C
	fmovrde	%l6,	%f4,	%f28
loop_1077:
	tleu	%xcc,	0x7
	smul	%i5,	%i1,	%i2
	udivx	%g7,	0x046A,	%g6
	xor	%o2,	0x009F,	%i6
	and	%i3,	0x07EC,	%o1
	tvs	%icc,	0x3
	fmovsg	%xcc,	%f7,	%f30
	fandnot2	%f4,	%f8,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x3C, %i0
	ldsha	[%l7 + %i0] 0x04,	%o5
	tsubcc	%o0,	0x1EB3,	%o3
	mova	%icc,	%l3,	%o4
	smul	%l4,	%l5,	%g4
	and	%i0,	0x0D0D,	%l0
	orncc	%g3,	0x145F,	%l1
	movre	%o7,	0x14E,	%i4
	popc	%g1,	%l2
	fornot2s	%f16,	%f21,	%f23
	ba	%icc,	loop_1078
	fbg	%fcc2,	loop_1079
	fandnot2	%f10,	%f0,	%f20
	array32	%o6,	%g2,	%g5
loop_1078:
	bvc,a,pn	%xcc,	loop_1080
loop_1079:
	tge	%icc,	0x3
	udiv	%i7,	0x0705,	%i5
	bleu,pt	%xcc,	loop_1081
loop_1080:
	swap	[%l7 + 0x6C],	%i1
	edge32ln	%l6,	%i2,	%g6
	tsubcc	%g7,	0x1EB1,	%o2
loop_1081:
	tpos	%xcc,	0x0
	fpackfix	%f20,	%f11
	sdivx	%i3,	0x00D2,	%o1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movl	%icc,	%o5,	%i6
	fornot1	%f0,	%f30,	%f4
	wr	%g0,	0x2f,	%asi
	stba	%o3,	[%l7 + 0x11] %asi
	membar	#Sync
	ta	%xcc,	0x6
	and	%o0,	%o4,	%l3
	fbule	%fcc3,	loop_1082
	sub	%l5,	0x1479,	%l4
	edge16ln	%i0,	%l0,	%g4
	tle	%xcc,	0x6
loop_1082:
	movrgz	%l1,	0x2E7,	%o7
	movgu	%icc,	%g3,	%i4
	movpos	%xcc,	%l2,	%g1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%g2
	edge32	%g5,	%o6,	%i7
	nop
	setx	loop_1083,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%xcc,	%i5,	%l6
	fsrc2s	%f20,	%f29
	edge16l	%i1,	%g6,	%i2
loop_1083:
	fands	%f23,	%f23,	%f9
	orcc	%o2,	%g7,	%o1
	fand	%f24,	%f4,	%f24
	ble	%xcc,	loop_1084
	brlez,a	%i3,	loop_1085
	alignaddrl	%o5,	%o3,	%o0
	stx	%i6,	[%l7 + 0x20]
loop_1084:
	movrgez	%l3,	0x233,	%o4
loop_1085:
	fbue	%fcc2,	loop_1086
	stw	%l4,	[%l7 + 0x48]
	fbge	%fcc2,	loop_1087
	srax	%i0,	0x07,	%l5
loop_1086:
	brz,a	%l0,	loop_1088
	movcs	%xcc,	%l1,	%o7
loop_1087:
	tne	%xcc,	0x2
	fmovsvs	%xcc,	%f31,	%f1
loop_1088:
	addcc	%g3,	0x155C,	%i4
	addc	%l2,	%g4,	%g2
	fmovsa	%xcc,	%f7,	%f19
	pdist	%f8,	%f14,	%f14
	set	0x24, %o1
	swapa	[%l7 + %o1] 0x10,	%g5
	srax	%g1,	%o6,	%i5
	prefetch	[%l7 + 0x14],	 0x3
	fandnot2	%f28,	%f30,	%f10
	movn	%xcc,	%i7,	%i1
	movleu	%icc,	%l6,	%i2
	bl,pt	%icc,	loop_1089
	subc	%o2,	0x11FF,	%g7
	edge8n	%o1,	%g6,	%o5
	movgu	%icc,	%i3,	%o0
loop_1089:
	ta	%xcc,	0x6
	sub	%i6,	%l3,	%o4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x20, %g7
	stda	%o2,	[%l7 + %g7] 0xea
	membar	#Sync
	call	loop_1090
	movgu	%xcc,	%i0,	%l4
	nop
	setx loop_1091, %l0, %l1
	jmpl %l1, %l0
	addcc	%l1,	0x09F6,	%l5
loop_1090:
	sll	%o7,	0x03,	%g3
	fblg,a	%fcc0,	loop_1092
loop_1091:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l2,	0x1CDC,	%g4
	tcs	%xcc,	0x5
loop_1092:
	fmovsl	%icc,	%f3,	%f27
	subccc	%i4,	0x1D75,	%g5
	fones	%f4
	mulscc	%g1,	%o6,	%g2
	fcmpgt32	%f6,	%f22,	%i5
	movrne	%i7,	%i1,	%i2
	mulscc	%l6,	0x1DB9,	%g7
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x17,	%f16
	xnor	%o2,	%o1,	%g6
	tg	%icc,	0x7
	addc	%o5,	0x121F,	%o0
	wr	%g0,	0x20,	%asi
	stxa	%i3,	[%g0 + 0x38] %asi
	xorcc	%i6,	%l3,	%o4
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x78] %asi,	%f31
	array8	%o3,	%i0,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l4,	%l1,	%l5
	or	%g3,	%o7,	%g4
	srl	%l2,	%g5,	%i4
	wr	%g0,	0x2b,	%asi
	stha	%g1,	[%l7 + 0x56] %asi
	membar	#Sync
	edge32ln	%g2,	%i5,	%o6
	sdivcc	%i7,	0x19D7,	%i1
	ldsh	[%l7 + 0x2C],	%l6
	srl	%g7,	0x14,	%i2
	array16	%o2,	%g6,	%o5
	tneg	%icc,	0x5
	ldx	[%l7 + 0x08],	%o1
	orncc	%i3,	%o0,	%l3
	fbule	%fcc0,	loop_1093
	be,a	loop_1094
	edge32	%o4,	%o3,	%i6
	sethi	0x16FD,	%l0
loop_1093:
	movpos	%icc,	%l4,	%i0
loop_1094:
	fbne,a	%fcc1,	loop_1095
	alignaddrl	%l1,	%l5,	%o7
	addccc	%g4,	0x10DC,	%g3
	addccc	%g5,	%l2,	%g1
loop_1095:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i4
	udiv	%g2,	0x1950,	%o6
	sdivcc	%i7,	0x19D9,	%i1
	te	%xcc,	0x2
	fmovd	%f20,	%f30
	ldsh	[%l7 + 0x1A],	%l6
	fmovdvs	%icc,	%f14,	%f11
	srlx	%i5,	%g7,	%i2
	fmovdvs	%icc,	%f28,	%f25
	fmovdge	%xcc,	%f16,	%f5
	edge16	%o2,	%g6,	%o1
	fmovdge	%xcc,	%f6,	%f14
	edge8ln	%o5,	%i3,	%l3
	alignaddrl	%o4,	%o3,	%o0
	edge16l	%l0,	%l4,	%i0
	fors	%f14,	%f17,	%f0
	subc	%i6,	%l1,	%l5
	fpadd16	%f16,	%f0,	%f24
	fbne	%fcc1,	loop_1096
	fmovrdne	%g4,	%f8,	%f22
	tcs	%xcc,	0x4
	fmovsneg	%xcc,	%f2,	%f2
loop_1096:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g3,	%o7,	%g5
	movl	%icc,	%g1,	%i4
	fbg	%fcc2,	loop_1097
	bne	loop_1098
	sll	%l2,	0x1F,	%g2
	tsubcc	%i7,	0x0BE9,	%i1
loop_1097:
	nop
	setx loop_1099, %l0, %l1
	jmpl %l1, %l6
loop_1098:
	fbu	%fcc1,	loop_1100
	te	%xcc,	0x0
	fbne	%fcc1,	loop_1101
loop_1099:
	edge32n	%i5,	%o6,	%i2
loop_1100:
	nop
	set	0x70, %l1
	stda	%g6,	[%l7 + %l1] 0x04
loop_1101:
	tg	%xcc,	0x2
	fmovrdgz	%o2,	%f22,	%f12
	sethi	0x05DF,	%g6
	te	%xcc,	0x3
	fcmple16	%f10,	%f4,	%o5
	stx	%i3,	[%l7 + 0x78]
	movg	%icc,	%o1,	%o4
	fbu	%fcc2,	loop_1102
	brlez,a	%l3,	loop_1103
	tcc	%icc,	0x2
	fmovdvc	%xcc,	%f1,	%f17
loop_1102:
	fmovrdlz	%o3,	%f28,	%f20
loop_1103:
	movrlez	%l0,	%o0,	%i0
	fcmpne16	%f6,	%f26,	%l4
	fmovrsne	%l1,	%f7,	%f21
	tgu	%icc,	0x5
	fexpand	%f5,	%f2
	movvs	%xcc,	%l5,	%g4
	fbe	%fcc0,	loop_1104
	xnor	%g3,	%i6,	%g5
	sdiv	%o7,	0x1D41,	%g1
	bcs	loop_1105
loop_1104:
	fzeros	%f31
	movre	%i4,	%g2,	%i7
	xorcc	%l2,	%i1,	%i5
loop_1105:
	fmovsg	%icc,	%f26,	%f28
	taddcctv	%o6,	%l6,	%g7
	prefetch	[%l7 + 0x44],	 0x0
	tne	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	bge,a,pt	%xcc,	loop_1106
	fnot2	%f28,	%f16
	edge8l	%g6,	%o5,	%i2
	bg,a	loop_1107
loop_1106:
	tgu	%xcc,	0x6
	set	0x08, %l3
	ldstuba	[%l7 + %l3] 0x80,	%i3
loop_1107:
	fcmped	%fcc1,	%f26,	%f4
	tne	%xcc,	0x2
	fbne,a	%fcc0,	loop_1108
	brgez,a	%o4,	loop_1109
	brz	%l3,	loop_1110
	fxor	%f2,	%f0,	%f18
loop_1108:
	bneg,pn	%icc,	loop_1111
loop_1109:
	mulx	%o3,	%l0,	%o0
loop_1110:
	fbg	%fcc2,	loop_1112
	movvc	%xcc,	%o1,	%l4
loop_1111:
	movl	%xcc,	%l1,	%i0
	edge32n	%l5,	%g3,	%g4
loop_1112:
	fmul8x16au	%f25,	%f9,	%f16
	tleu	%icc,	0x5
	tsubcc	%g5,	%i6,	%o7
	set	0x6C, %i6
	stwa	%g1,	[%l7 + %i6] 0x15
	stbar
	fcmpgt32	%f26,	%f8,	%i4
	movge	%icc,	%i7,	%l2
	movcs	%icc,	%i1,	%g2
	fsrc2s	%f24,	%f3
	swap	[%l7 + 0x64],	%o6
	ta	%xcc,	0x2
	movvs	%xcc,	%i5,	%l6
	edge16l	%o2,	%g6,	%o5
	brgez,a	%i2,	loop_1113
	bcs,pt	%icc,	loop_1114
	subccc	%g7,	%o4,	%l3
	and	%i3,	0x1A16,	%o3
loop_1113:
	edge32ln	%l0,	%o0,	%l4
loop_1114:
	fcmpes	%fcc3,	%f26,	%f26
	sir	0x03AA
	movrgez	%o1,	0x201,	%l1
	fbug	%fcc1,	loop_1115
	udivcc	%i0,	0x13A2,	%g3
	fmul8x16al	%f28,	%f30,	%f22
	tn	%xcc,	0x5
loop_1115:
	and	%l5,	%g4,	%i6
	fzero	%f12
	bne,a	loop_1116
	movn	%xcc,	%g5,	%g1
	stbar
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f0
loop_1116:
	tgu	%icc,	0x0
	fnand	%f18,	%f2,	%f24
	set	0x24, %o6
	lduwa	[%l7 + %o6] 0x80,	%o7
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x81
	fmul8sux16	%f2,	%f6,	%f0
	fmul8x16au	%f5,	%f1,	%f10
	edge16	%i7,	%i4,	%i1
	fnors	%f0,	%f14,	%f6
	alignaddrl	%g2,	%l2,	%o6
	nop
	setx loop_1117, %l0, %l1
	jmpl %l1, %i5
	sdiv	%o2,	0x1540,	%g6
	movrlz	%o5,	0x2D8,	%l6
	edge32	%g7,	%o4,	%i2
loop_1117:
	fmovsa	%xcc,	%f3,	%f18
	edge8n	%i3,	%l3,	%l0
	xor	%o3,	%l4,	%o1
	movrne	%l1,	0x22A,	%i0
	movvc	%xcc,	%g3,	%l5
	movn	%icc,	%o0,	%i6
	fpsub32s	%f16,	%f19,	%f29
	fbne,a	%fcc1,	loop_1118
	fmuld8ulx16	%f15,	%f27,	%f8
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x44] %asi,	%g4
loop_1118:
	brlz	%g1,	loop_1119
	brz	%g5,	loop_1120
	movvc	%icc,	%o7,	%i7
	fcmpne32	%f0,	%f30,	%i4
loop_1119:
	nop
	set	0x34, %i1
	ldswa	[%l7 + %i1] 0x14,	%i1
loop_1120:
	taddcc	%l2,	%o6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x18,	%f16
	movvs	%icc,	%o2,	%g6
	tsubcctv	%i5,	0x027F,	%l6
	fone	%f0
	sethi	0x1A3C,	%o5
	nop
	set	0x30, %o2
	ldub	[%l7 + %o2],	%o4
	udiv	%g7,	0x0A4E,	%i3
	edge16l	%i2,	%l3,	%o3
	movrlz	%l4,	0x27C,	%l0
	xorcc	%l1,	%o1,	%i0
	tneg	%xcc,	0x0
	set	0x6C, %g3
	ldstuba	[%l7 + %g3] 0x11,	%g3
	movleu	%xcc,	%l5,	%o0
	wr	%g0,	0xe2,	%asi
	stha	%i6,	[%l7 + 0x4C] %asi
	membar	#Sync
	pdist	%f16,	%f4,	%f18
	movrlez	%g1,	0x1A0,	%g5
	edge32	%g4,	%i7,	%i4
	fpadd16s	%f12,	%f29,	%f2
	srax	%o7,	0x01,	%l2
	tneg	%xcc,	0x7
	fmovdge	%icc,	%f24,	%f20
	orcc	%i1,	0x01C4,	%o6
	tneg	%icc,	0x5
	tgu	%xcc,	0x6
	sllx	%o2,	%g2,	%g6
	edge8	%i5,	%l6,	%o4
	fmovse	%xcc,	%f4,	%f21
	sll	%g7,	%i3,	%o5
	fmovsleu	%xcc,	%f30,	%f23
	add	%l3,	0x0C0B,	%o3
	and	%l4,	0x1627,	%l0
	fmovrslez	%l1,	%f7,	%f26
	fcmpne32	%f30,	%f26,	%i2
	popc	%i0,	%g3
	fbl	%fcc1,	loop_1121
	fbl	%fcc3,	loop_1122
	fbne	%fcc0,	loop_1123
	fcmpeq16	%f0,	%f10,	%l5
loop_1121:
	udivcc	%o1,	0x194A,	%i6
loop_1122:
	flush	%l7 + 0x0C
loop_1123:
	orn	%g1,	0x00FE,	%g5
	set	0x70, %o4
	stha	%o0,	[%l7 + %o4] 0x88
	edge8	%g4,	%i4,	%i7
	subccc	%o7,	%i1,	%l2
	xorcc	%o2,	0x1DF3,	%o6
	fsrc1s	%f10,	%f31
	tl	%icc,	0x6
	bneg,a	%icc,	loop_1124
	te	%icc,	0x3
	edge8	%g6,	%i5,	%l6
	std	%f0,	[%l7 + 0x28]
loop_1124:
	fmul8x16au	%f22,	%f28,	%f22
	array8	%o4,	%g2,	%i3
	tsubcc	%g7,	%o5,	%o3
	tge	%xcc,	0x6
	movg	%icc,	%l3,	%l0
	ldd	[%l7 + 0x10],	%f0
	wr	%g0,	0xe2,	%asi
	stha	%l4,	[%l7 + 0x1E] %asi
	membar	#Sync
	fmovrslz	%l1,	%f20,	%f19
	movgu	%xcc,	%i0,	%g3
	bvc,a,pt	%xcc,	loop_1125
	sir	0x1678
	set	0x50, %g4
	lduwa	[%l7 + %g4] 0x19,	%i2
loop_1125:
	nop
	set	0x0E, %o3
	lduba	[%l7 + %o3] 0x10,	%l5
	wr	%g0,	0x81,	%asi
	sta	%f12,	[%l7 + 0x30] %asi
	or	%i6,	0x0D66,	%g1
	fbul	%fcc1,	loop_1126
	popc	0x13FD,	%o1
	fmovdvc	%xcc,	%f17,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1126:
	smulcc	%g5,	0x13C3,	%o0
	fpackfix	%f12,	%f6
	movl	%icc,	%g4,	%i7
	ldsw	[%l7 + 0x7C],	%i4
	movne	%xcc,	%o7,	%l2
	movrgez	%o2,	0x3AB,	%i1
	fmovrdne	%o6,	%f6,	%f12
	pdist	%f10,	%f30,	%f14
	fbg	%fcc0,	loop_1127
	std	%i4,	[%l7 + 0x38]
	fors	%f29,	%f12,	%f16
	ble,pt	%icc,	loop_1128
loop_1127:
	ta	%xcc,	0x5
	movrlez	%g6,	%o4,	%l6
	xorcc	%i3,	0x138F,	%g2
loop_1128:
	udivx	%o5,	0x0BA4,	%o3
	fmovdgu	%icc,	%f24,	%f8
	movl	%xcc,	%l3,	%l0
	swap	[%l7 + 0x78],	%g7
	subccc	%l1,	0x047A,	%l4
	tsubcctv	%i0,	%g3,	%l5
	tvs	%icc,	0x6
	brnz,a	%i6,	loop_1129
	edge8ln	%g1,	%o1,	%i2
	sethi	0x09E3,	%g5
	mulx	%o0,	0x1A28,	%i7
loop_1129:
	be,a,pt	%icc,	loop_1130
	fnot1s	%f21,	%f13
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x54] %asi,	%f31
loop_1130:
	nop
	set	0x10, %l0
	ldsw	[%l7 + %l0],	%i4
	movgu	%xcc,	%g4,	%o7
	edge8ln	%o2,	%l2,	%o6
	udivcc	%i5,	0x13B3,	%i1
	add	%o4,	0x1F37,	%l6
	ldsw	[%l7 + 0x54],	%i3
	sll	%g6,	0x1F,	%g2
	te	%xcc,	0x5
	xnorcc	%o3,	%l3,	%o5
	edge16	%l0,	%g7,	%l1
	fmovsleu	%xcc,	%f9,	%f1
	tsubcc	%i0,	%l4,	%g3
	fxor	%f0,	%f22,	%f24
	swap	[%l7 + 0x34],	%i6
	lduh	[%l7 + 0x74],	%g1
	movpos	%icc,	%o1,	%l5
	fsrc1	%f24,	%f20
	tpos	%icc,	0x7
	tl	%icc,	0x1
	tn	%xcc,	0x1
	movrgez	%i2,	%o0,	%i7
	wr	%g0,	0x11,	%asi
	sta	%f24,	[%l7 + 0x20] %asi
	xnorcc	%i4,	%g5,	%o7
	std	%f14,	[%l7 + 0x40]
	fcmple32	%f30,	%f0,	%o2
	fmovd	%f24,	%f22
	fpadd16s	%f3,	%f21,	%f19
	edge8ln	%l2,	%o6,	%g4
	edge32	%i1,	%o4,	%l6
	bleu,a	loop_1131
	brlez,a	%i3,	loop_1132
	movcs	%icc,	%i5,	%g6
	fmovde	%icc,	%f14,	%f14
loop_1131:
	edge16ln	%g2,	%l3,	%o5
loop_1132:
	subc	%o3,	%l0,	%l1
	movcc	%xcc,	%g7,	%i0
	tge	%icc,	0x7
	movle	%xcc,	%g3,	%i6
	tg	%xcc,	0x4
	fnor	%f8,	%f22,	%f30
	ldub	[%l7 + 0x56],	%l4
	edge32ln	%g1,	%o1,	%l5
	fmovda	%xcc,	%f7,	%f15
	subc	%o0,	%i7,	%i4
	tgu	%icc,	0x4
	call	loop_1133
	fmuld8sux16	%f12,	%f18,	%f0
	set	0x08, %l5
	ldxa	[%l7 + %l5] 0x81,	%g5
loop_1133:
	nop
	setx	loop_1134,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsneg	%icc,	%f19,	%f8
	edge8n	%i2,	%o7,	%l2
	fmovsleu	%xcc,	%f13,	%f14
loop_1134:
	edge16n	%o2,	%o6,	%g4
	std	%f2,	[%l7 + 0x68]
	fmovdpos	%icc,	%f0,	%f3
	and	%o4,	0x1AC9,	%l6
	edge32n	%i1,	%i5,	%g6
	tne	%icc,	0x3
	fmovsneg	%xcc,	%f18,	%f25
	xor	%i3,	0x0D7B,	%l3
	tcc	%icc,	0x7
	edge32ln	%g2,	%o3,	%l0
	brnz	%l1,	loop_1135
	taddcc	%o5,	0x0800,	%i0
	edge32ln	%g3,	%g7,	%i6
	membar	0x6C
loop_1135:
	bleu,a,pt	%icc,	loop_1136
	fandnot2	%f20,	%f18,	%f28
	fmovdvc	%icc,	%f1,	%f9
	addccc	%g1,	%l4,	%l5
loop_1136:
	array16	%o1,	%o0,	%i7
	fcmpgt32	%f26,	%f16,	%i4
	fone	%f16
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x0c,	%g4
	xorcc	%i2,	%o7,	%o2
	edge16l	%l2,	%g4,	%o6
	set	0x3C, %g1
	ldswa	[%l7 + %g1] 0x89,	%l6
	fnegd	%f12,	%f6
	umulcc	%o4,	0x07FE,	%i1
	wr	%g0,	0x18,	%asi
	stwa	%g6,	[%l7 + 0x14] %asi
	umul	%i3,	%i5,	%g2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l0
	brlez,a	%l1,	loop_1137
	fbl,a	%fcc0,	loop_1138
	fpsub16	%f28,	%f14,	%f30
	smulcc	%o3,	%o5,	%g3
loop_1137:
	addcc	%i0,	0x14CE,	%i6
loop_1138:
	bge	loop_1139
	edge8n	%g1,	%l4,	%g7
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x26,	%l4
loop_1139:
	nop
	setx loop_1140, %l0, %l1
	jmpl %l1, %o1
	taddcc	%i7,	0x1F3A,	%i4
	addcc	%o0,	%g5,	%o7
	lduh	[%l7 + 0x6E],	%o2
loop_1140:
	tpos	%icc,	0x5
	orncc	%i2,	0x0FA7,	%l2
	for	%f22,	%f14,	%f26
	alignaddrl	%g4,	%l6,	%o6
	sra	%i1,	%o4,	%i3
	orn	%i5,	0x1591,	%g2
	mulscc	%l3,	%g6,	%l1
	ldd	[%l7 + 0x08],	%f0
	fbne,a	%fcc1,	loop_1141
	fzero	%f18
	fnegd	%f22,	%f28
	fpadd32s	%f7,	%f8,	%f22
loop_1141:
	srl	%l0,	0x0D,	%o5
	move	%icc,	%o3,	%g3
	fmovdle	%icc,	%f14,	%f13
	bne	loop_1142
	brgez,a	%i0,	loop_1143
	edge32ln	%i6,	%l4,	%g1
	fexpand	%f21,	%f0
loop_1142:
	movgu	%icc,	%g7,	%l5
loop_1143:
	fmovdvc	%xcc,	%f16,	%f10
	subcc	%o1,	0x0D03,	%i7
	addccc	%i4,	%o0,	%o7
	addcc	%o2,	0x0053,	%g5
	mova	%icc,	%l2,	%g4
	edge8ln	%l6,	%o6,	%i1
	tn	%icc,	0x5
	std	%f12,	[%l7 + 0x30]
	sir	0x1B08
	srlx	%o4,	%i3,	%i2
	fbul,a	%fcc0,	loop_1144
	fmul8x16	%f18,	%f30,	%f12
	edge16l	%g2,	%i5,	%l3
	edge16l	%g6,	%l0,	%l1
loop_1144:
	tvs	%icc,	0x3
	fandnot2	%f6,	%f20,	%f2
	movre	%o5,	%o3,	%g3
	array32	%i6,	%i0,	%l4
	fnegd	%f30,	%f22
	array16	%g1,	%l5,	%o1
	umulcc	%g7,	0x13C5,	%i7
	tleu	%icc,	0x7
	fmovrsgez	%o0,	%f13,	%f27
	fbe,a	%fcc2,	loop_1145
	tneg	%xcc,	0x1
	movle	%xcc,	%i4,	%o7
	set	0x45, %g6
	ldstuba	[%l7 + %g6] 0x10,	%o2
loop_1145:
	fpadd16s	%f15,	%f29,	%f11
	membar	0x74
	for	%f10,	%f28,	%f4
	bpos	loop_1146
	movcc	%icc,	%l2,	%g4
	bpos	%xcc,	loop_1147
	andcc	%l6,	0x0CD7,	%o6
loop_1146:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i1,	%g5,	%o4
loop_1147:
	array8	%i3,	%i2,	%i5
	edge16	%l3,	%g6,	%g2
	sdivx	%l1,	0x0DCA,	%o5
	array8	%o3,	%g3,	%l0
	ldsb	[%l7 + 0x27],	%i0
	edge8	%i6,	%l4,	%l5
	fmovsl	%icc,	%f1,	%f29
	bl,a	loop_1148
	std	%g0,	[%l7 + 0x50]
	movne	%xcc,	%o1,	%i7
	xor	%o0,	%g7,	%i4
loop_1148:
	tneg	%icc,	0x0
	nop
	setx	loop_1149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot2s	%f4,	%f21,	%f4
	tvs	%xcc,	0x4
	fpsub32s	%f15,	%f15,	%f5
loop_1149:
	movre	%o2,	0x3DD,	%o7
	membar	0x1E
	umulcc	%g4,	%l2,	%o6
	srax	%i1,	%g5,	%l6
	movrlz	%i3,	0x2D0,	%o4
	tneg	%xcc,	0x3
	movrgz	%i2,	0x120,	%i5
	alignaddrl	%l3,	%g2,	%g6
	xnorcc	%l1,	0x1988,	%o3
	fornot2s	%f22,	%f3,	%f3
	fmovsne	%xcc,	%f15,	%f12
	sllx	%o5,	0x02,	%g3
	bvs	%xcc,	loop_1150
	sllx	%i0,	%l0,	%i6
	andn	%l4,	0x0132,	%g1
	xnorcc	%o1,	%i7,	%l5
loop_1150:
	movvc	%icc,	%g7,	%o0
	movg	%icc,	%i4,	%o7
	add	%g4,	%o2,	%l2
	movre	%o6,	%i1,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l6,	0x0E8A,	%i3
	std	%o4,	[%l7 + 0x50]
	bg,a,pt	%xcc,	loop_1151
	fmovrdgez	%i5,	%f10,	%f4
	tleu	%xcc,	0x3
	movrlz	%i2,	0x2CE,	%l3
loop_1151:
	bvc,a,pn	%icc,	loop_1152
	brnz	%g6,	loop_1153
	bneg,a	%xcc,	loop_1154
	fble,a	%fcc1,	loop_1155
loop_1152:
	andn	%l1,	0x05BC,	%g2
loop_1153:
	tge	%icc,	0x2
loop_1154:
	ba,a	%icc,	loop_1156
loop_1155:
	bne,a,pn	%icc,	loop_1157
	tsubcc	%o3,	0x1644,	%o5
	set	0x14, %l6
	swapa	[%l7 + %l6] 0x81,	%i0
loop_1156:
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%g3
loop_1157:
	sir	0x1D52
	fmovscs	%icc,	%f4,	%f20
	edge32n	%l0,	%l4,	%i6
	addcc	%g1,	0x13E3,	%o1
	tl	%xcc,	0x5
	array8	%l5,	%g7,	%o0
	movrgz	%i4,	%i7,	%o7
	xor	%o2,	%l2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f2,	%f8,	%f12
	edge32l	%o6,	%i1,	%l6
	set	0x10, %i4
	stxa	%i3,	[%l7 + %i4] 0x22
	membar	#Sync
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g5
	mova	%icc,	%i5,	%i2
	movvc	%xcc,	%l3,	%o4
	srax	%g6,	0x07,	%g2
	xor	%l1,	%o3,	%i0
	brgz	%g3,	loop_1158
	brz	%o5,	loop_1159
	edge16n	%l0,	%i6,	%l4
	array32	%g1,	%l5,	%g7
loop_1158:
	fbuge	%fcc1,	loop_1160
loop_1159:
	fmovrse	%o0,	%f1,	%f13
	tsubcc	%i4,	0x06EF,	%i7
	move	%xcc,	%o7,	%o1
loop_1160:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l2,	[%g0 + 0x3d0] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	sllx	%o2,	0x15,	%o6
	srax	%g4,	%i1,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%i3
	set	0x34, %l4
	stha	%i2,	[%l7 + %l4] 0x27
	membar	#Sync
	array32	%l3,	%o4,	%i5
	tcs	%xcc,	0x1
	udivcc	%g2,	0x1944,	%g6
	tne	%xcc,	0x1
	sir	0x17B4
	set	0x66, %g2
	ldsha	[%l7 + %g2] 0x14,	%o3
	edge32l	%l1,	%i0,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g3,	%l0,	%l4
	mulscc	%g1,	%i6,	%l5
	orn	%o0,	%i4,	%i7
	fpadd16s	%f16,	%f15,	%f29
	tvs	%icc,	0x5
	movvc	%xcc,	%o7,	%o1
	tvc	%xcc,	0x7
	for	%f10,	%f18,	%f2
	sdiv	%l2,	0x1A93,	%o2
	tsubcctv	%g7,	%g4,	%o6
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%f16
	movneg	%icc,	%l6,	%g5
	ldstub	[%l7 + 0x62],	%i1
	movcs	%icc,	%i2,	%l3
	tneg	%xcc,	0x0
	set	0x10, %o5
	prefetcha	[%l7 + %o5] 0x15,	 0x3
	tsubcc	%i5,	%g2,	%i3
	tpos	%xcc,	0x0
	srax	%g6,	%o3,	%l1
	tpos	%icc,	0x3
	or	%o5,	0x0D8D,	%g3
	srlx	%l0,	%l4,	%i0
	fbl,a	%fcc2,	loop_1161
	fbug,a	%fcc0,	loop_1162
	umulcc	%g1,	0x047E,	%l5
	for	%f2,	%f18,	%f10
loop_1161:
	smul	%o0,	%i4,	%i6
loop_1162:
	array32	%i7,	%o1,	%l2
	tleu	%xcc,	0x1
	movneg	%xcc,	%o2,	%o7
	andn	%g4,	%o6,	%g7
	edge16n	%g5,	%i1,	%l6
	andncc	%i2,	%o4,	%l3
	array32	%i5,	%i3,	%g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%g2
	tsubcc	%l1,	0x1E84,	%o3
	movge	%icc,	%g3,	%o5
	edge32n	%l4,	%l0,	%g1
	fones	%f8
	brz	%l5,	loop_1163
	movneg	%icc,	%o0,	%i0
	movrlz	%i6,	%i4,	%o1
	tneg	%xcc,	0x2
loop_1163:
	or	%l2,	%o2,	%o7
	orn	%g4,	%o6,	%g7
	andn	%i7,	%g5,	%l6
	edge8n	%i1,	%i2,	%l3
	udiv	%i5,	0x1E4A,	%i3
	sir	0x1409
	udiv	%g6,	0x0F14,	%o4
	andcc	%l1,	0x1F92,	%g2
	fmovdneg	%xcc,	%f23,	%f20
	fmovdleu	%xcc,	%f1,	%f5
	sub	%g3,	0x1900,	%o3
	sll	%o5,	0x0D,	%l0
	faligndata	%f28,	%f12,	%f22
	fnegs	%f19,	%f11
	fbne,a	%fcc0,	loop_1164
	tle	%xcc,	0x0
	subc	%g1,	0x13EA,	%l4
	fzero	%f20
loop_1164:
	fbule,a	%fcc0,	loop_1165
	edge8ln	%o0,	%l5,	%i6
	fmovrsgz	%i4,	%f7,	%f11
	movn	%icc,	%o1,	%i0
loop_1165:
	tl	%xcc,	0x3
	popc	0x108C,	%o2
	brz	%o7,	loop_1166
	bvs,a	loop_1167
	sub	%l2,	0x1AB3,	%g4
	ldx	[%l7 + 0x28],	%g7
loop_1166:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x2C] %asi,	%i7
loop_1167:
	fsrc1s	%f7,	%f24
	fmovsg	%icc,	%f7,	%f2
	udiv	%o6,	0x13D2,	%l6
	fbne,a	%fcc2,	loop_1168
	tpos	%xcc,	0x2
	taddcctv	%i1,	%g5,	%i2
	or	%l3,	0x1F49,	%i5
loop_1168:
	edge32	%i3,	%g6,	%o4
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
	tle	%xcc,	0x2
	fbul,a	%fcc1,	loop_1169
	fandnot1s	%f28,	%f29,	%f30
	lduw	[%l7 + 0x5C],	%l1
	andcc	%g3,	%g2,	%o3
loop_1169:
	sir	0x1D36
	edge32ln	%l0,	%g1,	%o5
	movl	%icc,	%l4,	%l5
	fmovdl	%xcc,	%f3,	%f7
	movge	%icc,	%o0,	%i4
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0x1
	subccc	%i0,	0x1361,	%o2
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%o7
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%l2
	movne	%xcc,	%g4,	%g7
	movrlz	%i6,	0x052,	%i7
	movg	%xcc,	%l6,	%o6
	st	%f0,	[%l7 + 0x0C]
	fbuge	%fcc0,	loop_1170
	tl	%xcc,	0x5
	sdiv	%g5,	0x0258,	%i2
	udivcc	%i1,	0x1630,	%i5
loop_1170:
	stw	%i3,	[%l7 + 0x34]
	edge16l	%l3,	%o4,	%g6
	bge,a	loop_1171
	fmuld8ulx16	%f14,	%f9,	%f8
	swap	[%l7 + 0x40],	%l1
	and	%g2,	0x11B5,	%g3
loop_1171:
	sub	%o3,	%l0,	%g1
	movge	%xcc,	%l4,	%l5
	bl,a,pn	%xcc,	loop_1172
	bvs	%icc,	loop_1173
	fmovrdlz	%o5,	%f28,	%f22
	tge	%icc,	0x2
loop_1172:
	std	%o0,	[%l7 + 0x68]
loop_1173:
	lduh	[%l7 + 0x5A],	%i4
	bneg,a	loop_1174
	fnand	%f20,	%f12,	%f2
	movgu	%icc,	%o1,	%o2
	fmovrse	%o7,	%f18,	%f26
loop_1174:
	fblg	%fcc1,	loop_1175
	edge32l	%l2,	%i0,	%g4
	edge8l	%g7,	%i7,	%i6
	set	0x10, %l3
	stba	%l6,	[%l7 + %l3] 0x18
loop_1175:
	fble	%fcc2,	loop_1176
	sir	0x13EF
	st	%f4,	[%l7 + 0x08]
	movcc	%xcc,	%o6,	%g5
loop_1176:
	edge8l	%i2,	%i5,	%i3
	edge8n	%i1,	%l3,	%o4
	fpackfix	%f14,	%f20
	movl	%xcc,	%g6,	%l1
	movge	%xcc,	%g2,	%g3
	fcmps	%fcc2,	%f23,	%f3
	fpsub16	%f14,	%f16,	%f12
	addcc	%l0,	0x1EF6,	%g1
	movrne	%o3,	%l4,	%l5
	fmovspos	%icc,	%f8,	%f15
	mova	%icc,	%o5,	%o0
	tsubcctv	%i4,	%o1,	%o7
	edge32l	%l2,	%i0,	%g4
	wr	%g0,	0x2f,	%asi
	stha	%g7,	[%l7 + 0x70] %asi
	membar	#Sync
	fpack32	%f2,	%f12,	%f16
	brlz,a	%o2,	loop_1177
	movcc	%xcc,	%i7,	%i6
	fbu,a	%fcc1,	loop_1178
	move	%icc,	%l6,	%o6
loop_1177:
	nop
	set	0x68, %l1
	sta	%f4,	[%l7 + %l1] 0x19
loop_1178:
	fbu,a	%fcc0,	loop_1179
	brnz	%i2,	loop_1180
	bcs	%xcc,	loop_1181
	edge32l	%i5,	%g5,	%i1
loop_1179:
	edge16n	%l3,	%i3,	%o4
loop_1180:
	add	%g6,	0x195C,	%g2
loop_1181:
	fbuge,a	%fcc0,	loop_1182
	fors	%f2,	%f18,	%f13
	sub	%l1,	0x0EDA,	%l0
	edge32l	%g3,	%g1,	%o3
loop_1182:
	alignaddrl	%l5,	%o5,	%o0
	addcc	%l4,	0x1BFE,	%o1
	movre	%i4,	%o7,	%l2
	addc	%i0,	%g4,	%o2
	addc	%i7,	%g7,	%i6
	andn	%o6,	%i2,	%l6
	edge8	%g5,	%i5,	%i1
	move	%xcc,	%i3,	%l3
	ble,a,pt	%xcc,	loop_1183
	tsubcc	%g6,	0x0CE4,	%g2
	udiv	%l1,	0x00B9,	%l0
	movrgez	%o4,	%g1,	%g3
loop_1183:
	xorcc	%o3,	0x1251,	%l5
	andcc	%o0,	%o5,	%o1
	fmovrse	%i4,	%f0,	%f22
	fnot2	%f0,	%f20
	tcc	%icc,	0x6
	fmovrsne	%o7,	%f19,	%f7
	fmul8ulx16	%f14,	%f0,	%f8
	nop
	setx	loop_1184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x0
	movleu	%icc,	%l4,	%l2
	orncc	%i0,	0x085E,	%g4
loop_1184:
	bvc,pt	%icc,	loop_1185
	sll	%o2,	0x11,	%i7
	taddcctv	%i6,	%o6,	%i2
	orcc	%g7,	%l6,	%i5
loop_1185:
	movleu	%xcc,	%i1,	%i3
	tleu	%icc,	0x6
	alignaddrl	%g5,	%g6,	%l3
	fmovdcs	%xcc,	%f23,	%f31
	fbuge	%fcc1,	loop_1186
	movrne	%l1,	0x2B7,	%g2
	movre	%o4,	%l0,	%g1
	bvc,a	loop_1187
loop_1186:
	tsubcctv	%g3,	0x0487,	%l5
	add	%o0,	0x04F3,	%o3
	sll	%o1,	0x19,	%o5
loop_1187:
	movvc	%icc,	%o7,	%i4
	wr	%g0,	0x81,	%asi
	stba	%l4,	[%l7 + 0x55] %asi
	subccc	%i0,	%g4,	%o2
	xnor	%l2,	%i7,	%o6
	subc	%i6,	0x101B,	%g7
	membar	0x77
	xor	%l6,	%i2,	%i5
	fmovrsne	%i1,	%f31,	%f12
	add	%i3,	0x100D,	%g5
	udiv	%l3,	0x0622,	%l1
	fmovde	%icc,	%f5,	%f17
	ld	[%l7 + 0x38],	%f22
	bn,pt	%icc,	loop_1188
	fnors	%f20,	%f4,	%f29
	array32	%g2,	%g6,	%l0
	tvc	%xcc,	0x0
loop_1188:
	fpadd16s	%f1,	%f31,	%f19
	andncc	%o4,	%g1,	%g3
	fmovrsne	%o0,	%f26,	%f17
	fandnot2s	%f7,	%f23,	%f8
	ba,a,pn	%icc,	loop_1189
	alignaddrl	%o3,	%l5,	%o5
	bl,a,pt	%xcc,	loop_1190
	tle	%icc,	0x6
loop_1189:
	stbar
	stw	%o1,	[%l7 + 0x2C]
loop_1190:
	umulcc	%o7,	0x081D,	%l4
	faligndata	%f16,	%f6,	%f20
	movneg	%xcc,	%i0,	%g4
	edge16l	%o2,	%i4,	%i7
	sllx	%l2,	%o6,	%g7
	tle	%xcc,	0x4
	movrgz	%l6,	0x1F0,	%i2
	tcs	%xcc,	0x4
	tg	%xcc,	0x4
	alignaddr	%i6,	%i1,	%i3
	fmovsg	%xcc,	%f0,	%f4
	edge8ln	%i5,	%l3,	%l1
	set	0x40, %o7
	stda	%g4,	[%l7 + %o7] 0x18
	fornot2s	%f30,	%f16,	%f18
	fbul,a	%fcc1,	loop_1191
	bpos,pt	%xcc,	loop_1192
	ldub	[%l7 + 0x20],	%g6
	tvc	%xcc,	0x2
loop_1191:
	fmovdleu	%xcc,	%f7,	%f14
loop_1192:
	mova	%icc,	%g2,	%l0
	movvc	%xcc,	%o4,	%g1
	bg	%icc,	loop_1193
	edge16n	%g3,	%o3,	%l5
	movgu	%xcc,	%o0,	%o5
	fandnot2s	%f26,	%f4,	%f1
loop_1193:
	udiv	%o7,	0x19BD,	%l4
	subccc	%o1,	0x1A47,	%g4
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f6
	brgez,a	%o2,	loop_1194
	andncc	%i4,	%i0,	%i7
	popc	%o6,	%g7
	movrlez	%l2,	0x16E,	%i2
loop_1194:
	fmovsvc	%icc,	%f13,	%f30
	addcc	%l6,	0x13C6,	%i6
	srax	%i1,	0x0C,	%i5
	brnz,a	%i3,	loop_1195
	andcc	%l3,	%l1,	%g5
	brlez	%g2,	loop_1196
	fbuge,a	%fcc2,	loop_1197
loop_1195:
	srlx	%l0,	0x04,	%g6
	fmovdpos	%icc,	%f27,	%f30
loop_1196:
	or	%o4,	%g1,	%o3
loop_1197:
	lduw	[%l7 + 0x1C],	%g3
	popc	0x1B1A,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f30,	%f6
	xnor	%o5,	0x1786,	%o7
	addcc	%l4,	0x1A93,	%l5
	bleu,pt	%icc,	loop_1198
	mulx	%g4,	0x144B,	%o2
	bge,a,pt	%xcc,	loop_1199
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1198:
	mulscc	%i4,	%o1,	%i7
	move	%xcc,	%i0,	%o6
loop_1199:
	xnor	%g7,	0x00B4,	%i2
	fpack32	%f18,	%f26,	%f0
	movgu	%icc,	%l6,	%i6
	fmovdvs	%xcc,	%f8,	%f13
	addccc	%l2,	%i5,	%i1
	andn	%i3,	%l3,	%l1
	fors	%f10,	%f28,	%f5
	fblg,a	%fcc3,	loop_1200
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f4,	%f18
	fandnot1	%f10,	%f2,	%f16
loop_1200:
	sdivx	%g2,	0x0E60,	%l0
	fmovdle	%icc,	%f15,	%f25
	smulcc	%g5,	0x19E0,	%g6
	movl	%icc,	%o4,	%o3
	fbl,a	%fcc3,	loop_1201
	bleu,pn	%xcc,	loop_1202
	edge8l	%g1,	%g3,	%o5
	xor	%o7,	0x01DC,	%o0
loop_1201:
	mulx	%l4,	0x1D77,	%g4
loop_1202:
	popc	0x0ED1,	%l5
	smul	%i4,	0x0868,	%o2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fandnot1	%f16,	%f20,	%f10
	fxnor	%f24,	%f30,	%f10
	fcmped	%fcc3,	%f14,	%f26
	edge32ln	%i7,	%o1,	%i0
	fpack16	%f8,	%f26
	ldstub	[%l7 + 0x2E],	%o6
	fmovsleu	%icc,	%f10,	%f25
	fmovrse	%i2,	%f27,	%f23
	and	%l6,	0x0B3A,	%i6
	fmovrdgz	%g7,	%f0,	%f20
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l2
	fmovrsne	%i5,	%f25,	%f16
	fnot2s	%f10,	%f1
	fmovdcc	%icc,	%f9,	%f28
	addcc	%i1,	%l3,	%i3
	fzero	%f22
	tcc	%xcc,	0x5
	fmovsle	%icc,	%f6,	%f13
	edge16l	%g2,	%l0,	%l1
	tl	%icc,	0x2
	movrlz	%g5,	0x07E,	%g6
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x80,	 0x1
	fnands	%f21,	%f7,	%f15
	fmovda	%xcc,	%f17,	%f22
	bgu,a	%icc,	loop_1203
	fmovrdlez	%g1,	%f18,	%f14
	fabsd	%f14,	%f30
	movrgez	%g3,	0x33C,	%o4
loop_1203:
	sllx	%o5,	0x05,	%o0
	ldd	[%l7 + 0x58],	%l4
	move	%icc,	%g4,	%l5
	stw	%i4,	[%l7 + 0x1C]
	movn	%icc,	%o2,	%o7
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%o1
	udivcc	%o6,	0x005A,	%i2
	addccc	%i0,	0x06A6,	%l6
	fmuld8sux16	%f30,	%f12,	%f12
	tn	%icc,	0x7
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x10] %asi,	%f28
	fmovdl	%icc,	%f6,	%f7
	udiv	%l2,	0x12D6,	%g7
	movle	%icc,	%i5,	%l3
	fmovse	%xcc,	%f2,	%f24
	umulcc	%i1,	0x0CCA,	%i3
	stx	%l0,	[%l7 + 0x70]
	edge32l	%g2,	%g5,	%g6
	swap	[%l7 + 0x5C],	%l1
	stx	%g1,	[%l7 + 0x30]
	sdivx	%g3,	0x0EE6,	%o3
	std	%o4,	[%l7 + 0x50]
	fpsub16s	%f20,	%f31,	%f4
	movle	%xcc,	%o4,	%l4
	udiv	%o0,	0x1F8F,	%g4
	movvc	%icc,	%l5,	%i4
	addc	%o7,	0x0C85,	%o2
	fmuld8sux16	%f21,	%f31,	%f0
	udivx	%i7,	0x1D74,	%o6
	fmuld8ulx16	%f11,	%f13,	%f28
	fbge,a	%fcc0,	loop_1204
	tcc	%icc,	0x5
	fmovdgu	%icc,	%f5,	%f14
	orncc	%i2,	%o1,	%i0
loop_1204:
	fxnors	%f25,	%f22,	%f27
	bne,a,pn	%icc,	loop_1205
	stx	%l6,	[%l7 + 0x28]
	be,pn	%icc,	loop_1206
	orn	%l2,	%i6,	%g7
loop_1205:
	fbl	%fcc0,	loop_1207
	movrlez	%i5,	%l3,	%i1
loop_1206:
	edge8n	%i3,	%l0,	%g5
	orn	%g6,	0x11AD,	%g2
loop_1207:
	sll	%g1,	%g3,	%o3
	xnorcc	%o5,	%l1,	%o4
	fsrc1	%f24,	%f10
	xnor	%o0,	0x0179,	%g4
	smulcc	%l4,	0x11BB,	%i4
	umul	%l5,	0x0C72,	%o2
	taddcctv	%i7,	0x1152,	%o7
	fmovdpos	%icc,	%f0,	%f13
	fmovrse	%i2,	%f14,	%f12
	array8	%o1,	%o6,	%l6
	fmovsge	%icc,	%f21,	%f23
	fmovscc	%xcc,	%f20,	%f13
	movcc	%icc,	%i0,	%l2
	ba,a,pn	%icc,	loop_1208
	fcmps	%fcc3,	%f22,	%f7
	ta	%xcc,	0x4
	bvs,a	loop_1209
loop_1208:
	std	%i6,	[%l7 + 0x40]
	ldx	[%l7 + 0x68],	%i5
	ta	%xcc,	0x1
loop_1209:
	fcmpeq16	%f28,	%f20,	%g7
	tne	%xcc,	0x3
	add	%i1,	0x0C69,	%l3
	edge16n	%l0,	%i3,	%g6
	fexpand	%f17,	%f6
	fxor	%f8,	%f12,	%f14
	subccc	%g2,	0x07A4,	%g5
	nop
	setx loop_1210, %l0, %l1
	jmpl %l1, %g1
	tvc	%icc,	0x3
	fone	%f12
	tpos	%xcc,	0x3
loop_1210:
	fbul,a	%fcc0,	loop_1211
	movne	%xcc,	%o3,	%o5
	smulcc	%g3,	0x1BC2,	%l1
	tpos	%icc,	0x0
loop_1211:
	fmovdle	%icc,	%f16,	%f17
	or	%o0,	0x0ECF,	%o4
	orn	%l4,	%i4,	%l5
	fcmpeq16	%f10,	%f4,	%g4
	lduw	[%l7 + 0x08],	%i7
	edge16l	%o2,	%o7,	%i2
	fandnot1	%f16,	%f20,	%f28
	nop
	set	0x20, %i1
	stx	%o6,	[%l7 + %i1]
	te	%xcc,	0x6
	sdivx	%o1,	0x164E,	%l6
	movleu	%xcc,	%i0,	%i6
	fbe,a	%fcc3,	loop_1212
	edge32l	%l2,	%i5,	%g7
	fbl,a	%fcc3,	loop_1213
	fmovsle	%icc,	%f9,	%f6
loop_1212:
	edge32ln	%l3,	%i1,	%l0
	umul	%i3,	%g2,	%g6
loop_1213:
	fabss	%f21,	%f19
	fpsub16s	%f23,	%f9,	%f31
	movcc	%icc,	%g1,	%o3
	fxor	%f22,	%f14,	%f30
	fble	%fcc2,	loop_1214
	mulx	%o5,	0x1FC2,	%g3
	addccc	%g5,	%l1,	%o4
	sethi	0x1CF6,	%o0
loop_1214:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i4
	movvc	%xcc,	%l4,	%l5
	movre	%i7,	0x0A6,	%g4
	brnz,a	%o2,	loop_1215
	subcc	%i2,	0x1986,	%o6
	swap	[%l7 + 0x10],	%o1
	fnand	%f26,	%f8,	%f24
loop_1215:
	movneg	%xcc,	%l6,	%i0
	fcmpgt32	%f28,	%f16,	%i6
	and	%o7,	%i5,	%l2
	srlx	%l3,	%i1,	%l0
	fmul8x16	%f27,	%f6,	%f6
	nop
	setx	loop_1216,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovspos	%xcc,	%f20,	%f3
	fnot1	%f2,	%f10
	fmovsgu	%xcc,	%f20,	%f1
loop_1216:
	array32	%i3,	%g2,	%g7
	fmul8x16	%f29,	%f6,	%f0
	tvc	%xcc,	0x3
	fones	%f14
	tg	%xcc,	0x5
	edge8n	%g1,	%g6,	%o3
	orcc	%g3,	%o5,	%l1
	fpmerge	%f21,	%f26,	%f6
	sllx	%g5,	0x00,	%o0
	sub	%o4,	0x052F,	%l4
	ldd	[%l7 + 0x58],	%i4
	fmovrde	%i7,	%f10,	%f14
	edge32ln	%g4,	%l5,	%o2
	bcc,pt	%xcc,	loop_1217
	xnor	%o6,	0x0EFC,	%i2
	edge32	%l6,	%i0,	%i6
	prefetch	[%l7 + 0x0C],	 0x1
loop_1217:
	bn,pn	%icc,	loop_1218
	te	%icc,	0x2
	ldstub	[%l7 + 0x3A],	%o1
	xorcc	%i5,	%o7,	%l2
loop_1218:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f21,	[%l7 + 0x64] %asi
	add	%l3,	0x133D,	%i1
	fnegs	%f12,	%f3
	ldstub	[%l7 + 0x64],	%i3
	edge16n	%l0,	%g2,	%g7
	xnorcc	%g1,	0x07DA,	%g6
	orcc	%g3,	0x1D36,	%o5
	edge32n	%l1,	%g5,	%o0
	sdiv	%o4,	0x1002,	%o3
	flush	%l7 + 0x28
	or	%l4,	0x110B,	%i4
	sethi	0x1EEE,	%g4
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x10,	%l4
	tg	%xcc,	0x2
	fbuge,a	%fcc0,	loop_1219
	fmovrdlez	%i7,	%f20,	%f10
	and	%o2,	0x18B2,	%i2
	edge8n	%l6,	%i0,	%o6
loop_1219:
	tg	%xcc,	0x0
	fbul,a	%fcc3,	loop_1220
	tge	%xcc,	0x4
	brlz	%o1,	loop_1221
	andncc	%i5,	%o7,	%i6
loop_1220:
	movne	%xcc,	%l2,	%i1
	subc	%l3,	0x145A,	%i3
loop_1221:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x56] %asi,	%g2
	edge8ln	%g7,	%l0,	%g6
	edge8n	%g3,	%g1,	%o5
	set	0x40, %l2
	stba	%l1,	[%l7 + %l2] 0x23
	membar	#Sync
	brgez	%o0,	loop_1222
	tge	%icc,	0x2
	sll	%g5,	%o3,	%l4
	fmovrdlz	%o4,	%f18,	%f6
loop_1222:
	nop
	setx loop_1223, %l0, %l1
	jmpl %l1, %i4
	edge32n	%g4,	%i7,	%l5
	array32	%o2,	%i2,	%l6
	alignaddr	%o6,	%o1,	%i0
loop_1223:
	addc	%i5,	0x09FA,	%o7
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i1
	andcc	%l3,	%g2,	%i3
	fmovrdlz	%l0,	%f10,	%f6
	fors	%f25,	%f21,	%f28
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%g7
	set	0x54, %o2
	lda	[%l7 + %o2] 0x81,	%f9
	fors	%f30,	%f8,	%f13
	add	%g3,	%g6,	%g1
	sdiv	%l1,	0x14FC,	%o5
	and	%g5,	%o0,	%o3
	andncc	%o4,	%l4,	%g4
	edge16n	%i4,	%l5,	%o2
	tcc	%icc,	0x2
	fpmerge	%f23,	%f13,	%f2
	fbn,a	%fcc0,	loop_1224
	flush	%l7 + 0x3C
	bl	loop_1225
	membar	0x04
loop_1224:
	movrne	%i7,	%i2,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1225:
	andn	%o1,	%l6,	%i0
	umul	%i5,	0x18BA,	%l2
	membar	0x08
	edge8n	%o7,	%i6,	%i1
	set	0x5C, %g3
	sta	%f4,	[%l7 + %g3] 0x14
	tl	%icc,	0x2
	sdivx	%g2,	0x1BAC,	%i3
	set	0x0B, %o4
	stba	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	bne,a,pn	%xcc,	loop_1226
	tleu	%xcc,	0x4
	movre	%l3,	%g7,	%g3
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1226:
	movrlz	%g1,	%g6,	%o5
	sub	%l1,	%g5,	%o0
	array8	%o3,	%l4,	%o4
	mova	%xcc,	%g4,	%i4
	fbule	%fcc3,	loop_1227
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%o2
	udivx	%l5,	0x0640,	%i7
	ble,a	loop_1228
loop_1227:
	brlez	%i2,	loop_1229
	tleu	%xcc,	0x5
	ldsw	[%l7 + 0x1C],	%o1
loop_1228:
	fmovspos	%xcc,	%f27,	%f27
loop_1229:
	tle	%xcc,	0x3
	fba,a	%fcc0,	loop_1230
	fmul8x16	%f22,	%f10,	%f28
	fmul8x16au	%f0,	%f16,	%f28
	movg	%xcc,	%o6,	%i0
loop_1230:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%l6,	[%l7 + 0x57] %asi
	membar	#Sync
	movgu	%icc,	%l2,	%i5
	sub	%o7,	0x1563,	%i1
	tg	%xcc,	0x1
	ldsb	[%l7 + 0x42],	%i6
	mulscc	%i3,	0x11A9,	%l0
	orcc	%l3,	%g7,	%g2
	orcc	%g3,	0x1174,	%g1
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movleu	%xcc,	%g6,	%o5
	udivcc	%g5,	0x12E8,	%o0
	brz	%o3,	loop_1231
	orn	%l1,	0x1B4D,	%l4
	te	%xcc,	0x3
	lduw	[%l7 + 0x40],	%g4
loop_1231:
	mova	%icc,	%o4,	%o2
	fzeros	%f16
	st	%f15,	[%l7 + 0x4C]
	brlz	%l5,	loop_1232
	fmovsg	%icc,	%f2,	%f15
	move	%xcc,	%i4,	%i7
	edge8l	%o1,	%i2,	%o6
loop_1232:
	bcs,a	%xcc,	loop_1233
	fmovsleu	%xcc,	%f11,	%f2
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x88,	%l6
loop_1233:
	edge16	%i0,	%i5,	%o7
	tsubcctv	%l2,	0x027D,	%i6
	membar	0x22
	movvs	%xcc,	%i1,	%l0
	fone	%f28
	siam	0x3
	fpsub32s	%f11,	%f14,	%f10
	fmovrdgz	%i3,	%f28,	%f26
	fcmpeq32	%f8,	%f20,	%l3
	edge32n	%g7,	%g3,	%g2
	movg	%icc,	%g1,	%g6
	tg	%icc,	0x5
	tne	%icc,	0x2
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sdivcc	%o5,	0x0166,	%o0
	subc	%g5,	%l1,	%o3
	fmul8x16	%f25,	%f6,	%f20
	fsrc2	%f8,	%f4
	andncc	%l4,	%o4,	%g4
	tsubcc	%o2,	%l5,	%i4
	tg	%xcc,	0x0
	stb	%i7,	[%l7 + 0x2F]
	tl	%xcc,	0x3
	edge8ln	%i2,	%o6,	%l6
	tneg	%icc,	0x0
	movg	%xcc,	%i0,	%i5
	fmovsle	%xcc,	%f25,	%f28
	ldx	[%l7 + 0x48],	%o7
	tgu	%icc,	0x1
	fcmpes	%fcc0,	%f18,	%f25
	orncc	%o1,	0x1814,	%l2
	edge8ln	%i1,	%i6,	%i3
	bvc,a	%xcc,	loop_1234
	udivcc	%l0,	0x179C,	%l3
	add	%g7,	0x0182,	%g3
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x18
loop_1234:
	subcc	%g2,	%g1,	%o5
	movneg	%icc,	%o0,	%g6
	set	0x70, %l5
	stxa	%g5,	[%l7 + %l5] 0xea
	membar	#Sync
	membar	0x55
	edge8n	%o3,	%l1,	%o4
	andcc	%l4,	%g4,	%o2
	fnegs	%f11,	%f6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x36] %asi,	%i4
	ble	%icc,	loop_1235
	array8	%l5,	%i2,	%o6
	umul	%i7,	%l6,	%i5
	movrgz	%i0,	0x3DF,	%o1
loop_1235:
	movge	%xcc,	%l2,	%i1
	fmovdvs	%xcc,	%f17,	%f29
	fmovrdgz	%i6,	%f26,	%f14
	edge32ln	%i3,	%o7,	%l3
	wr	%g0,	0x19,	%asi
	sta	%f19,	[%l7 + 0x6C] %asi
	subccc	%g7,	0x1345,	%l0
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
	fcmpeq16	%f18,	%f30,	%g1
	fcmpne16	%f16,	%f18,	%o5
	edge32ln	%o0,	%g6,	%g2
	subccc	%o3,	%g5,	%l1
	tvs	%xcc,	0x3
	addccc	%o4,	%l4,	%o2
	ldsb	[%l7 + 0x35],	%i4
	sll	%g4,	0x17,	%l5
	fmovdle	%icc,	%f26,	%f15
	fbo	%fcc0,	loop_1236
	edge16	%i2,	%i7,	%o6
	tcs	%icc,	0x6
	fpadd32s	%f15,	%f6,	%f13
loop_1236:
	lduh	[%l7 + 0x44],	%l6
	sdiv	%i0,	0x0BEA,	%i5
	tvc	%icc,	0x2
	edge32n	%o1,	%l2,	%i1
	fpackfix	%f28,	%f7
	fandnot2s	%f5,	%f14,	%f4
	andncc	%i3,	%o7,	%i6
	edge16	%g7,	%l0,	%g3
	fpsub16s	%f10,	%f18,	%f1
	addc	%l3,	%o5,	%o0
	fba	%fcc2,	loop_1237
	xnorcc	%g6,	0x1FA3,	%g2
	fornot2s	%f13,	%f17,	%f5
	edge8l	%g1,	%g5,	%o3
loop_1237:
	tl	%xcc,	0x7
	fmovdne	%xcc,	%f18,	%f12
	faligndata	%f26,	%f22,	%f24
	movrlz	%l1,	0x1E9,	%o4
	fexpand	%f5,	%f18
	fmovrslz	%o2,	%f24,	%f5
	tleu	%xcc,	0x0
	udiv	%i4,	0x1D8E,	%g4
	tg	%xcc,	0x7
	movvs	%xcc,	%l4,	%i2
	edge16ln	%i7,	%o6,	%l5
	taddcc	%i0,	%i5,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l2,	%o1
	alignaddr	%i1,	%o7,	%i6
	bl	loop_1238
	fcmps	%fcc3,	%f27,	%f30
	fmovdle	%xcc,	%f7,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1238:
	sra	%g7,	0x05,	%l0
	bg,a,pn	%icc,	loop_1239
	orncc	%i3,	0x00E3,	%g3
	fxor	%f18,	%f2,	%f12
	sdiv	%o5,	0x1BBD,	%o0
loop_1239:
	smulcc	%g6,	0x0766,	%l3
	array8	%g1,	%g2,	%o3
	sllx	%g5,	0x1A,	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o4,	%o2
	fmovdvc	%xcc,	%f24,	%f13
	edge32ln	%g4,	%l4,	%i2
	fbu,a	%fcc3,	loop_1240
	movpos	%xcc,	%i7,	%i4
	fmovdpos	%xcc,	%f31,	%f15
	xorcc	%l5,	%i0,	%o6
loop_1240:
	ldub	[%l7 + 0x08],	%i5
	sethi	0x0D61,	%l6
	st	%f11,	[%l7 + 0x08]
	alignaddr	%o1,	%i1,	%o7
	edge32	%i6,	%g7,	%l2
	mulscc	%i3,	0x02DB,	%g3
	mova	%icc,	%o5,	%o0
	andcc	%l0,	%l3,	%g6
	membar	0x5B
	movleu	%icc,	%g1,	%g2
	taddcc	%g5,	0x1090,	%l1
	bn,a	%xcc,	loop_1241
	andn	%o4,	%o3,	%o2
	fmuld8ulx16	%f6,	%f0,	%f16
	fcmpne32	%f14,	%f8,	%g4
loop_1241:
	movvc	%xcc,	%i2,	%l4
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x80,	%i7
	edge16	%i4,	%i0,	%l5
	addccc	%i5,	0x1FF1,	%l6
	sdiv	%o1,	0x1C77,	%o6
	tne	%icc,	0x3
	fmovscc	%icc,	%f18,	%f20
	umul	%o7,	%i6,	%g7
	fmuld8sux16	%f26,	%f16,	%f10
	add	%l2,	0x1329,	%i3
	wr	%g0,	0x27,	%asi
	stwa	%g3,	[%l7 + 0x3C] %asi
	membar	#Sync
	movrgez	%i1,	0x1A8,	%o5
	bpos,a	loop_1242
	udiv	%o0,	0x0EF1,	%l0
	movrlz	%l3,	0x210,	%g1
	sub	%g6,	%g5,	%g2
loop_1242:
	andn	%o4,	%l1,	%o3
	srax	%o2,	0x03,	%i2
	fble,a	%fcc0,	loop_1243
	tpos	%xcc,	0x3
	add	%l4,	0x1135,	%g4
	fmovsvs	%icc,	%f5,	%f31
loop_1243:
	array8	%i4,	%i7,	%l5
	fmovda	%icc,	%f1,	%f2
	udivcc	%i0,	0x04A3,	%i5
	alignaddrl	%l6,	%o6,	%o1
	srlx	%o7,	%i6,	%l2
	xor	%i3,	0x1A8D,	%g3
	tcs	%xcc,	0x6
	movrlez	%i1,	%g7,	%o5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x54] %asi,	%f14
	fmul8x16au	%f25,	%f26,	%f22
	tl	%icc,	0x0
	alignaddrl	%o0,	%l0,	%g1
	addc	%g6,	%g5,	%l3
	tcs	%xcc,	0x6
	sir	0x0F9D
	taddcc	%g2,	%o4,	%o3
	movrne	%o2,	%i2,	%l1
	movrlz	%l4,	0x15E,	%g4
	stx	%i7,	[%l7 + 0x30]
	xnor	%i4,	0x08EF,	%l5
	mulx	%i5,	0x1B81,	%l6
	fmul8ulx16	%f4,	%f26,	%f16
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%o1
	fmovsa	%icc,	%f8,	%f16
	fmovrslez	%o7,	%f25,	%f6
	tsubcctv	%i6,	0x1E3B,	%o6
	movgu	%icc,	%l2,	%i3
	set	0x28, %g5
	stxa	%g3,	[%l7 + %g5] 0xe2
	membar	#Sync
	edge32	%i1,	%g7,	%o5
	movrlz	%o0,	%l0,	%g1
	fbg	%fcc3,	loop_1244
	alignaddrl	%g5,	%g6,	%g2
	movpos	%xcc,	%o4,	%l3
	te	%icc,	0x5
loop_1244:
	movvs	%icc,	%o3,	%i2
	movl	%icc,	%l1,	%l4
	stx	%g4,	[%l7 + 0x48]
	movvc	%icc,	%o2,	%i4
	taddcc	%i7,	0x0469,	%l5
	stw	%i5,	[%l7 + 0x74]
	bl,a	loop_1245
	movl	%xcc,	%l6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc1,	loop_1246
loop_1245:
	fsrc1s	%f23,	%f0
	movcc	%icc,	%i0,	%o7
	fnot1s	%f23,	%f18
loop_1246:
	bshuffle	%f0,	%f10,	%f0
	bl,pt	%xcc,	loop_1247
	movrlez	%i6,	0x2F9,	%l2
	orn	%o6,	0x1A9B,	%i3
	edge8l	%i1,	%g3,	%g7
loop_1247:
	fnands	%f3,	%f11,	%f21
	stx	%o0,	[%l7 + 0x68]
	umul	%o5,	%g1,	%g5
	udivcc	%l0,	0x1396,	%g6
	addc	%o4,	0x0C15,	%l3
	array16	%g2,	%o3,	%l1
	set	0x70, %i7
	lda	[%l7 + %i7] 0x18,	%f5
	nop
	set	0x50, %l6
	lduh	[%l7 + %l6],	%i2
	set	0x0C, %g6
	swapa	[%l7 + %g6] 0x19,	%l4
	fsrc2	%f30,	%f30
	xnor	%o2,	0x0230,	%i4
	addcc	%i7,	0x057D,	%l5
	array32	%g4,	%l6,	%o1
	udiv	%i0,	0x18F8,	%o7
	fnot2	%f12,	%f10
	xnor	%i5,	0x0017,	%i6
	movl	%xcc,	%l2,	%i3
	edge16n	%i1,	%g3,	%o6
	move	%icc,	%g7,	%o0
	movvs	%xcc,	%o5,	%g1
	movrlz	%g5,	%g6,	%l0
	fmovscs	%xcc,	%f29,	%f22
	movl	%xcc,	%o4,	%g2
	sdiv	%o3,	0x04BD,	%l3
	taddcctv	%i2,	0x07F4,	%l1
	fbue	%fcc3,	loop_1248
	fnors	%f15,	%f29,	%f29
	fmovrsgez	%l4,	%f4,	%f28
	tsubcc	%i4,	%i7,	%l5
loop_1248:
	fmovsl	%xcc,	%f23,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o2,	%g4
	tge	%icc,	0x6
	andncc	%o1,	%i0,	%l6
	smul	%o7,	0x007F,	%i6
	prefetch	[%l7 + 0x18],	 0x1
	movcc	%xcc,	%l2,	%i5
	fbul	%fcc2,	loop_1249
	umul	%i1,	0x0ED5,	%g3
	srax	%o6,	0x19,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1249:
	array32	%o0,	%o5,	%i3
	stx	%g5,	[%l7 + 0x30]
	andn	%g6,	%l0,	%o4
	tle	%icc,	0x2
	ta	%xcc,	0x0
	movle	%icc,	%g2,	%g1
	umulcc	%o3,	0x17E7,	%i2
	taddcc	%l1,	0x1F62,	%l3
	fbge,a	%fcc1,	loop_1250
	tsubcctv	%i4,	0x1EDB,	%l4
	fnot1s	%f24,	%f20
	edge8ln	%l5,	%o2,	%g4
loop_1250:
	alignaddrl	%o1,	%i0,	%l6
	mulx	%i7,	%o7,	%l2
	xor	%i6,	%i1,	%g3
	movrne	%o6,	%i5,	%g7
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o0,	[%g0 + 0x338] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fbule	%fcc2,	loop_1251
	fnegd	%f30,	%f6
	ble,a,pt	%icc,	loop_1252
	ldsw	[%l7 + 0x34],	%i3
loop_1251:
	fmovsgu	%icc,	%f22,	%f12
	bcc,a	loop_1253
loop_1252:
	movvc	%xcc,	%g5,	%o5
	edge32l	%g6,	%o4,	%g2
	tsubcctv	%l0,	0x1CE2,	%g1
loop_1253:
	ble	%xcc,	loop_1254
	mova	%xcc,	%o3,	%i2
	fpsub32	%f22,	%f30,	%f10
	edge16ln	%l1,	%l3,	%i4
loop_1254:
	tvc	%xcc,	0x6
	umul	%l5,	%l4,	%g4
	fpsub16s	%f16,	%f16,	%f24
	movge	%icc,	%o2,	%i0
	fcmple16	%f0,	%f18,	%o1
	tcs	%icc,	0x2
	movrne	%i7,	%l6,	%o7
	fmul8sux16	%f6,	%f14,	%f28
	edge32ln	%l2,	%i1,	%g3
	fbne,a	%fcc3,	loop_1255
	fabsd	%f10,	%f10
	set	0x58, %o0
	stda	%o6,	[%l7 + %o0] 0x22
	membar	#Sync
loop_1255:
	sllx	%i5,	%g7,	%o0
	fandnot1	%f6,	%f22,	%f10
	tl	%icc,	0x0
	movne	%xcc,	%i6,	%g5
	udivx	%o5,	0x0B49,	%i3
	mova	%icc,	%o4,	%g2
	fcmpeq32	%f2,	%f10,	%g6
	fcmped	%fcc3,	%f18,	%f16
	edge32l	%l0,	%g1,	%o3
	bg	%icc,	loop_1256
	fxors	%f16,	%f5,	%f27
	fnegd	%f16,	%f4
	fmovdle	%xcc,	%f10,	%f12
loop_1256:
	fcmpgt16	%f2,	%f16,	%i2
	tcc	%xcc,	0x0
	array32	%l3,	%i4,	%l1
	sir	0x006B
	orn	%l5,	0x1B0A,	%l4
	fsrc2s	%f3,	%f26
	array16	%g4,	%o2,	%o1
	brlez,a	%i7,	loop_1257
	sir	0x18EA
	sub	%l6,	0x1FE6,	%i0
	edge8ln	%l2,	%i1,	%g3
loop_1257:
	tsubcc	%o6,	0x1CCB,	%i5
	taddcc	%g7,	%o7,	%o0
	fmovdge	%xcc,	%f8,	%f28
	orcc	%i6,	%o5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g5,	%g2,	%g6
	fmovsa	%xcc,	%f20,	%f30
	movvs	%icc,	%l0,	%g1
	alignaddrl	%o4,	%o3,	%l3
	andncc	%i4,	%i2,	%l1
	edge32n	%l4,	%g4,	%o2
	srl	%l5,	%i7,	%o1
	fbue	%fcc3,	loop_1258
	and	%l6,	0x1066,	%i0
	movleu	%icc,	%l2,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1258:
	bvc,a,pn	%xcc,	loop_1259
	fsrc2	%f14,	%f24
	nop
	setx	loop_1260,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%o6,	%i1,	%i5
loop_1259:
	tne	%xcc,	0x1
	umulcc	%g7,	%o0,	%i6
loop_1260:
	fmovsvc	%icc,	%f19,	%f18
	umul	%o5,	%i3,	%g5
	set	0x34, %l4
	ldswa	[%l7 + %l4] 0x18,	%g2
	sethi	0x1A8F,	%o7
	movrlz	%l0,	0x262,	%g1
	std	%o4,	[%l7 + 0x28]
	ldx	[%l7 + 0x18],	%g6
	ldub	[%l7 + 0x24],	%l3
	array32	%i4,	%o3,	%i2
	srlx	%l4,	%g4,	%l1
	std	%f16,	[%l7 + 0x08]
	fnegd	%f26,	%f12
	brlz,a	%o2,	loop_1261
	fbug,a	%fcc2,	loop_1262
	std	%i6,	[%l7 + 0x18]
	or	%l5,	0x0B26,	%o1
loop_1261:
	orcc	%l6,	0x09B4,	%l2
loop_1262:
	fnegs	%f21,	%f8
	set	0x24, %i4
	lduha	[%l7 + %i4] 0x15,	%i0
	tsubcctv	%g3,	0x0BF2,	%i1
	edge16l	%i5,	%o6,	%g7
	edge16ln	%i6,	%o0,	%i3
	taddcctv	%o5,	%g2,	%g5
	movcs	%icc,	%l0,	%o7
	udiv	%o4,	0x0ECB,	%g1
	fbl	%fcc3,	loop_1263
	array32	%l3,	%i4,	%g6
	tcc	%icc,	0x2
	or	%o3,	0x08EF,	%l4
loop_1263:
	udivx	%g4,	0x110B,	%i2
	udivx	%l1,	0x16DA,	%i7
	or	%o2,	%l5,	%o1
	fxors	%f21,	%f7,	%f22
	tne	%xcc,	0x3
	umulcc	%l6,	0x003D,	%l2
	tvs	%xcc,	0x7
	addccc	%i0,	%i1,	%i5
	sdiv	%o6,	0x0105,	%g3
	movg	%icc,	%g7,	%i6
	fandnot1s	%f3,	%f7,	%f24
	brlz	%o0,	loop_1264
	subcc	%i3,	%g2,	%g5
	fmovdl	%icc,	%f23,	%f14
	sra	%o5,	%l0,	%o4
loop_1264:
	sdivx	%o7,	0x1A09,	%l3
	taddcc	%i4,	%g1,	%o3
	ld	[%l7 + 0x1C],	%f25
	brgz	%l4,	loop_1265
	movle	%xcc,	%g6,	%g4
	ba	%icc,	loop_1266
	brlz	%i2,	loop_1267
loop_1265:
	fpsub16	%f12,	%f8,	%f22
	tsubcctv	%l1,	%i7,	%l5
loop_1266:
	fbue,a	%fcc0,	loop_1268
loop_1267:
	nop
	set	0x52, %g2
	lduh	[%l7 + %g2],	%o2
	fmovdn	%icc,	%f7,	%f10
	alignaddrl	%o1,	%l6,	%i0
loop_1268:
	movne	%xcc,	%i1,	%l2
	sllx	%i5,	%o6,	%g3
	movl	%icc,	%g7,	%o0
	bvc,a,pt	%xcc,	loop_1269
	fpadd16	%f16,	%f12,	%f26
	movvs	%xcc,	%i3,	%g2
	edge8n	%g5,	%i6,	%l0
loop_1269:
	fmovrde	%o4,	%f10,	%f0
	fabss	%f8,	%f15
	sir	0x1D6C
	movne	%xcc,	%o5,	%o7
	brnz,a	%l3,	loop_1270
	tneg	%icc,	0x0
	fmovrsne	%i4,	%f21,	%f26
	andcc	%g1,	0x0FEF,	%l4
loop_1270:
	mulx	%o3,	0x0CF2,	%g6
	movl	%icc,	%i2,	%g4
	tsubcctv	%i7,	0x1ADE,	%l5
	movvc	%xcc,	%l1,	%o1
	lduh	[%l7 + 0x4C],	%o2
	membar	0x7D
	sdivcc	%i0,	0x0203,	%i1
	mulscc	%l6,	%i5,	%o6
	fmovs	%f16,	%f3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g3
	lduw	[%l7 + 0x58],	%g7
	set	0x54, %i2
	swapa	[%l7 + %i2] 0x89,	%o0
	movge	%xcc,	%l2,	%g2
	tn	%xcc,	0x2
	fone	%f4
	fbue,a	%fcc1,	loop_1271
	movrgez	%g5,	0x297,	%i3
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf9
	membar	#Sync
loop_1271:
	ldd	[%l7 + 0x48],	%l0
	edge32l	%o4,	%o5,	%i6
	andncc	%l3,	%o7,	%g1
	edge16	%i4,	%l4,	%o3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i2,	%g4
	array8	%g6,	%i7,	%l1
	fcmple32	%f14,	%f6,	%l5
	fmovscc	%xcc,	%f12,	%f9
	andcc	%o1,	0x182B,	%o2
	set	0x58, %i0
	lda	[%l7 + %i0] 0x18,	%f19
	taddcctv	%i1,	%l6,	%i5
	sethi	0x1E76,	%i0
	fmovrsne	%o6,	%f19,	%f28
	xorcc	%g3,	%g7,	%o0
	fbe	%fcc2,	loop_1272
	array8	%g2,	%g5,	%i3
	fmovrse	%l0,	%f26,	%f26
	fbue,a	%fcc0,	loop_1273
loop_1272:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%o4,	loop_1274
	smul	%o5,	0x1389,	%l2
loop_1273:
	xorcc	%l3,	0x088E,	%o7
	fmovrdgez	%i6,	%f0,	%f20
loop_1274:
	nop
	set	0x23, %i3
	ldstuba	[%l7 + %i3] 0x11,	%i4
	tge	%xcc,	0x7
	edge32	%l4,	%o3,	%g1
	xor	%i2,	%g4,	%i7
	tne	%xcc,	0x6
	fzeros	%f12
	edge32ln	%l1,	%g6,	%l5
	umul	%o1,	0x0063,	%o2
	movrne	%l6,	%i1,	%i0
	movl	%xcc,	%i5,	%g3
	edge16ln	%o6,	%o0,	%g7
	subcc	%g5,	%g2,	%l0
	srlx	%o4,	%o5,	%l2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x10,	%i3,	%o7
	subcc	%i6,	0x04B3,	%i4
	umul	%l3,	%l4,	%g1
	movg	%icc,	%i2,	%g4
	movrne	%o3,	0x18F,	%l1
	sdivx	%g6,	0x0DE4,	%i7
	fmovse	%xcc,	%f29,	%f12
	umulcc	%l5,	0x1866,	%o2
	edge32ln	%o1,	%l6,	%i0
	popc	0x08B0,	%i5
	edge16	%g3,	%o6,	%o0
	ldsh	[%l7 + 0x0A],	%g7
	umul	%g5,	%g2,	%l0
	prefetch	[%l7 + 0x24],	 0x2
	stx	%o4,	[%l7 + 0x60]
	stb	%i1,	[%l7 + 0x1C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f7,	%f10
	udivcc	%l2,	0x0EB5,	%i3
	addccc	%o7,	0x0600,	%i6
	umul	%o5,	%i4,	%l4
	orncc	%g1,	0x1BFB,	%l3
	fmul8x16	%f27,	%f10,	%f8
	bcc,a,pt	%xcc,	loop_1275
	array8	%g4,	%o3,	%i2
	tneg	%icc,	0x5
	sdivx	%g6,	0x1525,	%i7
loop_1275:
	udiv	%l5,	0x07A6,	%o2
	bcc,a,pt	%icc,	loop_1276
	fcmpne16	%f26,	%f18,	%o1
	fandnot2s	%f25,	%f15,	%f28
	tcs	%xcc,	0x5
loop_1276:
	movne	%icc,	%l6,	%l1
	mulx	%i0,	0x01E9,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x0
	fmovdle	%icc,	%f8,	%f20
	movvc	%xcc,	%g3,	%o0
	movvc	%xcc,	%o6,	%g5
	brz	%g7,	loop_1277
	nop
	setx	loop_1278,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32l	%g2,	%l0,	%i1
	umul	%l2,	0x1E8E,	%o4
loop_1277:
	nop
	wr	%g0,	0x2f,	%asi
	stda	%i2,	[%l7 + 0x48] %asi
	membar	#Sync
loop_1278:
	sll	%i6,	%o5,	%i4
	tne	%xcc,	0x1
	fnot2	%f28,	%f0
	set	0x30, %g7
	ldsba	[%l7 + %g7] 0x89,	%o7
	fandnot1	%f4,	%f14,	%f26
	movge	%icc,	%l4,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g4,	%o3,	%g1
	fmul8sux16	%f12,	%f8,	%f2
	edge32n	%g6,	%i7,	%i2
	ld	[%l7 + 0x7C],	%f5
	movn	%xcc,	%l5,	%o2
	fmovrsgz	%l6,	%f9,	%f31
	sra	%l1,	%o1,	%i5
	fmuld8ulx16	%f10,	%f3,	%f24
	fmovrde	%i0,	%f0,	%f10
	fbue	%fcc3,	loop_1279
	brlez	%g3,	loop_1280
	tvs	%icc,	0x5
	fcmpeq16	%f4,	%f4,	%o0
loop_1279:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%o6
loop_1280:
	andncc	%g7,	%l0,	%i1
	fzero	%f12
	movrne	%l2,	0x3B5,	%g2
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fba	%fcc3,	loop_1281
	fxnor	%f12,	%f0,	%f20
	fpadd32s	%f12,	%f4,	%f20
	xorcc	%i3,	0x12B9,	%i6
loop_1281:
	xorcc	%o4,	%i4,	%o5
	sir	0x1B03
	fsrc1s	%f25,	%f12
	pdist	%f30,	%f18,	%f12
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%l4
	tgu	%xcc,	0x6
	sth	%l3,	[%l7 + 0x36]
	orn	%g4,	0x1995,	%o7
	addccc	%o3,	0x1C1B,	%g6
	movrgez	%i7,	0x105,	%i2
	for	%f8,	%f26,	%f8
	sir	0x012C
	tg	%icc,	0x3
	fpsub32	%f16,	%f22,	%f18
	bne,pt	%xcc,	loop_1282
	fba,a	%fcc0,	loop_1283
	swap	[%l7 + 0x60],	%l5
	stb	%o2,	[%l7 + 0x2A]
loop_1282:
	movvs	%xcc,	%l6,	%g1
loop_1283:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x4
	bg,a,pt	%xcc,	loop_1284
	fmovrdgz	%o1,	%f16,	%f14
	bne,pn	%xcc,	loop_1285
	tsubcc	%i5,	%i0,	%l1
loop_1284:
	ldd	[%l7 + 0x48],	%f28
	edge8l	%o0,	%g5,	%o6
loop_1285:
	movrgez	%g7,	%g3,	%l0
	bl,a,pt	%xcc,	loop_1286
	fmovsvc	%xcc,	%f0,	%f26
	tvs	%xcc,	0x3
	be,a	%xcc,	loop_1287
loop_1286:
	fpmerge	%f18,	%f0,	%f20
	swap	[%l7 + 0x68],	%l2
	fandnot2	%f6,	%f18,	%f20
loop_1287:
	bleu,a	%icc,	loop_1288
	fmovrdlz	%g2,	%f4,	%f0
	bg,a,pn	%icc,	loop_1289
	alignaddrl	%i1,	%i6,	%i3
loop_1288:
	movleu	%xcc,	%o4,	%i4
	for	%f28,	%f2,	%f4
loop_1289:
	alignaddrl	%o5,	%l3,	%l4
	fmovsg	%xcc,	%f6,	%f22
	alignaddrl	%o7,	%g4,	%o3
	edge8ln	%i7,	%i2,	%g6
	bvs,pn	%xcc,	loop_1290
	movle	%icc,	%l5,	%l6
	fmovsleu	%xcc,	%f28,	%f8
	xnorcc	%g1,	0x0C0D,	%o2
loop_1290:
	nop
	set	0x8, %l3
	stxa	%o1,	[%g0 + %l3] 0x21
	subc	%i5,	0x1858,	%l1
	prefetch	[%l7 + 0x50],	 0x0
	fble	%fcc0,	loop_1291
	fmovdn	%xcc,	%f7,	%f0
	fmovdcs	%icc,	%f19,	%f0
	fmovsvs	%xcc,	%f12,	%f4
loop_1291:
	alignaddr	%o0,	%g5,	%o6
	and	%g7,	%i0,	%l0
	sra	%l2,	0x0D,	%g2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x11,	%f16
	edge16l	%g3,	%i6,	%i1
	nop
	set	0x58, %l1
	std	%o4,	[%l7 + %l1]
	fmovdcc	%xcc,	%f14,	%f26
	edge32n	%i3,	%o5,	%i4
	srlx	%l3,	%l4,	%g4
	call	loop_1292
	taddcc	%o7,	0x001F,	%i7
	bpos,a	loop_1293
	srl	%i2,	0x07,	%o3
loop_1292:
	ldub	[%l7 + 0x27],	%l5
	fnot1s	%f8,	%f13
loop_1293:
	add	%l6,	0x17B0,	%g6
	fnands	%f12,	%f5,	%f29
	edge16l	%o2,	%o1,	%g1
	ldstub	[%l7 + 0x33],	%l1
	subcc	%o0,	0x1729,	%i5
	fmovsl	%xcc,	%f18,	%f1
	fmovdl	%xcc,	%f3,	%f26
	movcc	%icc,	%g5,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x3D, %o7
	ldstuba	[%l7 + %o7] 0x0c,	%i0
	movpos	%icc,	%o6,	%l2
	tcc	%xcc,	0x7
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x19,	 0x0
	edge8	%g3,	%g2,	%i6
	tcs	%icc,	0x1
	tcs	%icc,	0x6
	tn	%icc,	0x7
	sdiv	%i1,	0x0760,	%o4
	movvs	%icc,	%i3,	%o5
	prefetch	[%l7 + 0x10],	 0x2
	ba	%xcc,	loop_1294
	and	%i4,	0x1209,	%l3
	fmuld8sux16	%f12,	%f4,	%f30
	sdivx	%l4,	0x146D,	%g4
loop_1294:
	taddcc	%o7,	%i2,	%o3
	tneg	%xcc,	0x7
	nop
	setx	loop_1295,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%i7,	%l5,	%l6
	mova	%icc,	%g6,	%o1
	movpos	%xcc,	%g1,	%o2
loop_1295:
	mova	%icc,	%l1,	%o0
	sub	%g5,	0x1794,	%g7
	edge32ln	%i0,	%o6,	%i5
	umulcc	%l2,	0x1486,	%g3
	fmovrslz	%g2,	%f0,	%f16
	edge16n	%i6,	%i1,	%o4
	fnot2s	%f16,	%f15
	nop
	setx	loop_1296,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bgu,a,pt	%xcc,	loop_1297
	te	%xcc,	0x5
	movg	%xcc,	%i3,	%l0
loop_1296:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x34] %asi,	%o5
loop_1297:
	std	%l2,	[%l7 + 0x48]
	wr	%g0,	0x80,	%asi
	stha	%l4,	[%l7 + 0x30] %asi
	fpack32	%f4,	%f14,	%f16
	movle	%icc,	%g4,	%i4
	movrne	%i2,	0x2B6,	%o3
	umul	%o7,	%i7,	%l5
	brz	%l6,	loop_1298
	addcc	%g6,	%g1,	%o2
	movgu	%icc,	%o1,	%l1
	mova	%xcc,	%g5,	%g7
loop_1298:
	movvc	%xcc,	%i0,	%o0
	set	0x14, %i1
	lduwa	[%l7 + %i1] 0x88,	%i5
	fmovdneg	%xcc,	%f31,	%f17
	udivcc	%l2,	0x111E,	%o6
	edge8	%g2,	%i6,	%i1
	udivx	%o4,	0x0D2A,	%g3
	fmul8x16au	%f19,	%f24,	%f26
	fnor	%f28,	%f4,	%f12
	edge8n	%l0,	%i3,	%o5
	xnor	%l3,	%g4,	%l4
	fxnors	%f4,	%f22,	%f19
	tn	%xcc,	0x7
	fxnors	%f3,	%f30,	%f24
	fcmple32	%f14,	%f4,	%i2
	array32	%o3,	%o7,	%i7
	tn	%icc,	0x1
	wr	%g0,	0x23,	%asi
	stxa	%l5,	[%l7 + 0x70] %asi
	membar	#Sync
	membar	0x7B
	xnorcc	%i4,	%l6,	%g1
	edge8	%g6,	%o1,	%o2
	tge	%xcc,	0x5
	set	0x17, %o6
	lduba	[%l7 + %o6] 0x11,	%l1
	fnegd	%f14,	%f2
	sub	%g7,	0x1A77,	%g5
	alignaddrl	%o0,	%i0,	%l2
	umul	%i5,	0x0329,	%g2
	movpos	%xcc,	%i6,	%i1
	movle	%xcc,	%o4,	%o6
	movrgez	%l0,	0x343,	%g3
	stx	%i3,	[%l7 + 0x10]
	ldsh	[%l7 + 0x2E],	%l3
	movvs	%xcc,	%g4,	%o5
	or	%i2,	%l4,	%o7
	smulcc	%i7,	0x0D19,	%o3
	mulx	%i4,	%l6,	%g1
	movleu	%icc,	%l5,	%o1
	popc	0x047C,	%o2
	membar	0x0D
	sdivx	%l1,	0x1894,	%g7
	bn	loop_1299
	sethi	0x0FAA,	%g5
	alignaddrl	%o0,	%i0,	%g6
	sdiv	%l2,	0x19E6,	%i5
loop_1299:
	faligndata	%f10,	%f30,	%f30
	edge32ln	%i6,	%g2,	%o4
	fmovse	%xcc,	%f1,	%f1
	nop
	setx	loop_1300,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2s	%f13,	%f22
	orn	%o6,	0x1F12,	%i1
	fsrc1	%f2,	%f0
loop_1300:
	tsubcctv	%l0,	%g3,	%i3
	tge	%icc,	0x7
	xorcc	%l3,	0x0053,	%o5
	fmovsgu	%xcc,	%f29,	%f28
	subc	%i2,	%l4,	%o7
	array32	%i7,	%o3,	%g4
	ta	%icc,	0x4
	bneg	loop_1301
	std	%i4,	[%l7 + 0x70]
	fmovscs	%icc,	%f19,	%f18
	fmovde	%xcc,	%f0,	%f19
loop_1301:
	fnegd	%f30,	%f26
	taddcctv	%g1,	0x0E01,	%l6
	orncc	%o1,	%o2,	%l5
	ba,pn	%icc,	loop_1302
	fcmpgt32	%f30,	%f10,	%l1
	fpsub32s	%f31,	%f2,	%f29
	xnorcc	%g7,	0x1AD6,	%g5
loop_1302:
	edge16n	%o0,	%g6,	%i0
	brgez	%l2,	loop_1303
	mulscc	%i5,	0x0828,	%g2
	andn	%i6,	0x119E,	%o4
	ldsb	[%l7 + 0x63],	%o6
loop_1303:
	fmovsleu	%icc,	%f3,	%f5
	fmovrdgz	%l0,	%f18,	%f26
	sdiv	%i1,	0x1E89,	%g3
	prefetch	[%l7 + 0x1C],	 0x3
	tl	%xcc,	0x2
	fmovsg	%icc,	%f0,	%f24
	smul	%i3,	%o5,	%l3
	umulcc	%l4,	%i2,	%o7
	tsubcc	%o3,	0x1514,	%i7
	udiv	%g4,	0x1ABE,	%g1
	smul	%l6,	0x029D,	%i4
	ldstub	[%l7 + 0x5F],	%o1
	tge	%icc,	0x7
	edge8ln	%o2,	%l5,	%l1
	brlez,a	%g7,	loop_1304
	fcmpne16	%f30,	%f24,	%g5
	bvs,a	%xcc,	loop_1305
	tgu	%xcc,	0x4
loop_1304:
	fabsd	%f14,	%f28
	sethi	0x06EA,	%o0
loop_1305:
	ld	[%l7 + 0x60],	%f31
	fmovrslz	%g6,	%f14,	%f23
	nop
	setx	loop_1306,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%l2,	0x1CB2,	%i0
	andcc	%i5,	0x09CF,	%i6
	subccc	%o4,	%o6,	%g2
loop_1306:
	orcc	%i1,	%l0,	%g3
	set	0x24, %l2
	lduha	[%l7 + %l2] 0x04,	%i3
	fornot2	%f14,	%f18,	%f30
	sir	0x1EF3
	fmovrdne	%o5,	%f2,	%f8
	bge	%xcc,	loop_1307
	movl	%icc,	%l3,	%i2
	call	loop_1308
	and	%l4,	0x1CFA,	%o3
loop_1307:
	movle	%xcc,	%i7,	%o7
	orncc	%g1,	%g4,	%i4
loop_1308:
	tleu	%icc,	0x5
	movrgez	%l6,	0x181,	%o1
	movleu	%xcc,	%l5,	%l1
	sdivcc	%o2,	0x16EB,	%g7
	brlez,a	%g5,	loop_1309
	sth	%o0,	[%l7 + 0x48]
	stx	%l2,	[%l7 + 0x40]
	array32	%g6,	%i5,	%i6
loop_1309:
	ldd	[%l7 + 0x20],	%f6
	stbar
	fmovrse	%o4,	%f24,	%f21
	tn	%icc,	0x5
	edge32l	%i0,	%o6,	%g2
	orcc	%i1,	0x16B9,	%g3
	umul	%i3,	%o5,	%l3
	movneg	%icc,	%l0,	%i2
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf8
	membar	#Sync
	mova	%xcc,	%l4,	%o3
	tle	%icc,	0x4
	edge16n	%i7,	%g1,	%o7
	tge	%icc,	0x5
	taddcctv	%i4,	%l6,	%o1
	ldsb	[%l7 + 0x10],	%l5
	tpos	%icc,	0x1
	ba,a	%xcc,	loop_1310
	edge16l	%g4,	%o2,	%g7
	tvs	%icc,	0x2
	fcmple16	%f28,	%f18,	%l1
loop_1310:
	sdivx	%g5,	0x0E3F,	%o0
	fpsub32	%f20,	%f10,	%f12
	movcs	%xcc,	%g6,	%l2
	fnegs	%f22,	%f11
	tvs	%xcc,	0x3
	fzeros	%f27
	tpos	%icc,	0x1
	array8	%i6,	%o4,	%i0
	udivcc	%i5,	0x1BA7,	%g2
	alignaddr	%i1,	%g3,	%o6
	fornot1s	%f13,	%f19,	%f10
	andcc	%o5,	0x04F0,	%i3
	bn,pt	%xcc,	loop_1311
	addcc	%l3,	%i2,	%l4
	sll	%o3,	%l0,	%g1
	alignaddr	%o7,	%i7,	%i4
loop_1311:
	bne,a,pn	%icc,	loop_1312
	tleu	%icc,	0x6
	bne	%icc,	loop_1313
	fornot2s	%f14,	%f28,	%f4
loop_1312:
	bneg	loop_1314
	movrlz	%l6,	%o1,	%l5
loop_1313:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
loop_1314:
	stbar
	fpsub16	%f12,	%f24,	%f0
	movge	%xcc,	%g4,	%l1
	movrgez	%g7,	0x3D8,	%g5
	edge32l	%o0,	%g6,	%l2
	edge8	%i6,	%o4,	%i5
	udivcc	%g2,	0x0700,	%i0
	edge32	%g3,	%o6,	%i1
	sdiv	%i3,	0x1EFE,	%l3
	mulx	%o5,	%i2,	%o3
	ldub	[%l7 + 0x25],	%l0
	fandnot1s	%f3,	%f10,	%f1
	movrgez	%l4,	0x1C1,	%o7
	andn	%g1,	0x16F0,	%i4
	edge8	%i7,	%o1,	%l5
	edge8ln	%l6,	%o2,	%g4
	fmovda	%icc,	%f0,	%f27
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x34] %asi,	%f4
	mova	%icc,	%l1,	%g5
	membar	0x4D
	fornot1s	%f7,	%f12,	%f10
	fmovsn	%icc,	%f20,	%f16
	bcs	loop_1315
	sra	%o0,	%g6,	%g7
	nop
	set	0x50, %i5
	stw	%i6,	[%l7 + %i5]
	fmovd	%f6,	%f14
loop_1315:
	fble,a	%fcc2,	loop_1316
	std	%l2,	[%l7 + 0x38]
	fbl,a	%fcc1,	loop_1317
	edge32l	%i5,	%o4,	%g2
loop_1316:
	orncc	%i0,	%g3,	%i1
	smulcc	%i3,	0x028C,	%l3
loop_1317:
	stb	%o5,	[%l7 + 0x6D]
	movre	%i2,	0x0E9,	%o3
	mulx	%o6,	0x00F8,	%l0
	edge32ln	%l4,	%o7,	%i4
	xorcc	%i7,	0x0D25,	%g1
	fbg	%fcc1,	loop_1318
	fcmpne32	%f30,	%f10,	%o1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l6
loop_1318:
	fzero	%f24
	srax	%l5,	%g4,	%l1
	bn,a,pt	%xcc,	loop_1319
	movneg	%icc,	%g5,	%o0
	edge32n	%g6,	%g7,	%o2
	orncc	%l2,	0x10A8,	%i5
loop_1319:
	stbar
	bg,pn	%icc,	loop_1320
	move	%xcc,	%o4,	%i6
	sdivx	%g2,	0x1C3B,	%g3
	fornot2	%f6,	%f26,	%f0
loop_1320:
	movvc	%xcc,	%i0,	%i3
	subccc	%i1,	%l3,	%i2
	brnz	%o5,	loop_1321
	movvc	%icc,	%o6,	%l0
	set	0x26, %o4
	ldsha	[%l7 + %o4] 0x15,	%l4
loop_1321:
	nop
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x17
	membar	#Sync
	fbn,a	%fcc1,	loop_1322
	bne,pt	%icc,	loop_1323
	fmovdleu	%xcc,	%f8,	%f0
	bleu,pt	%xcc,	loop_1324
loop_1322:
	ldsb	[%l7 + 0x7D],	%o7
loop_1323:
	fxnors	%f17,	%f25,	%f17
	edge32ln	%o3,	%i7,	%g1
loop_1324:
	tne	%icc,	0x2
	edge8	%o1,	%l6,	%i4
	tgu	%xcc,	0x7
	bl,pt	%icc,	loop_1325
	ldstub	[%l7 + 0x3C],	%l5
	sdivx	%g4,	0x01FA,	%g5
	sdiv	%o0,	0x1A1B,	%l1
loop_1325:
	mulscc	%g7,	0x13D5,	%g6
	brnz	%l2,	loop_1326
	udiv	%o2,	0x0863,	%o4
	tle	%icc,	0x0
	fpack32	%f24,	%f6,	%f10
loop_1326:
	bgu,a	%icc,	loop_1327
	bneg,pt	%xcc,	loop_1328
	movrgez	%i5,	%g2,	%g3
	bcs	%icc,	loop_1329
loop_1327:
	fbg	%fcc3,	loop_1330
loop_1328:
	addcc	%i6,	0x0B19,	%i0
	fbul	%fcc0,	loop_1331
loop_1329:
	movrlz	%i1,	0x02C,	%i3
loop_1330:
	nop
	set	0x28, %g3
	stx	%l3,	[%l7 + %g3]
	sdivcc	%o5,	0x0545,	%o6
loop_1331:
	sllx	%i2,	%l0,	%l4
	movrgz	%o3,	%i7,	%g1
	set	0x28, %g4
	swapa	[%l7 + %g4] 0x80,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f19,	%f13
	movpos	%icc,	%l6,	%i4
	xnorcc	%l5,	%g4,	%o1
	fpadd16	%f6,	%f22,	%f28
	addcc	%g5,	%o0,	%l1
	sub	%g6,	%l2,	%g7
	fmovrdgz	%o4,	%f28,	%f10
	bgu,pt	%xcc,	loop_1332
	fbne	%fcc0,	loop_1333
	movpos	%icc,	%o2,	%g2
	edge8n	%g3,	%i5,	%i6
loop_1332:
	fornot1	%f8,	%f22,	%f26
loop_1333:
	tn	%xcc,	0x2
	sir	0x1EE8
	fble	%fcc2,	loop_1334
	fnegd	%f24,	%f8
	mulscc	%i1,	0x1807,	%i3
	xnor	%l3,	0x0051,	%i0
loop_1334:
	call	loop_1335
	nop
	setx	loop_1336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f4,	%f10,	%f6
	fsrc1	%f22,	%f14
loop_1335:
	edge8l	%o5,	%o6,	%l0
loop_1336:
	fnot1s	%f8,	%f7
	fmovdpos	%xcc,	%f23,	%f4
	fmovrdgz	%l4,	%f10,	%f24
	membar	0x63
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%o3,	loop_1337
	array8	%i7,	%i2,	%o7
	stw	%l6,	[%l7 + 0x70]
	movne	%xcc,	%g1,	%l5
loop_1337:
	nop
	set	0x45, %l0
	lduba	[%l7 + %l0] 0x80,	%i4
	tneg	%icc,	0x6
	taddcctv	%g4,	%g5,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l1,	%g6
	brgez,a	%l2,	loop_1338
	bvc,a,pt	%xcc,	loop_1339
	edge8l	%g7,	%o0,	%o4
	sdiv	%o2,	0x01C3,	%g3
loop_1338:
	edge32l	%i5,	%i6,	%g2
loop_1339:
	fbge	%fcc3,	loop_1340
	fandnot1	%f20,	%f22,	%f20
	sethi	0x1124,	%i3
	fmovrdlz	%l3,	%f30,	%f14
loop_1340:
	fmovrslz	%i0,	%f16,	%f24
	tg	%icc,	0x6
	andcc	%o5,	0x0970,	%o6
	popc	0x0800,	%i1
	fmovs	%f31,	%f5
	prefetch	[%l7 + 0x20],	 0x2
	bcs	loop_1341
	edge32n	%l4,	%l0,	%o3
	fbul	%fcc2,	loop_1342
	brgez,a	%i7,	loop_1343
loop_1341:
	call	loop_1344
	be,a,pt	%xcc,	loop_1345
loop_1342:
	move	%icc,	%o7,	%i2
loop_1343:
	addcc	%l6,	%l5,	%g1
loop_1344:
	smul	%g4,	%i4,	%o1
loop_1345:
	std	%f26,	[%l7 + 0x50]
	fone	%f24
	movre	%g5,	0x309,	%g6
	sethi	0x1F85,	%l1
	sir	0x0819
	fmovdle	%icc,	%f10,	%f19
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	fnands	%f21,	%f7,	%f8
	fpadd32s	%f8,	%f2,	%f20
	fpsub16	%f2,	%f12,	%f8
	be	loop_1346
	udiv	%l2,	0x1EE0,	%o0
	fmul8x16	%f18,	%f18,	%f28
	edge16ln	%o2,	%o4,	%g3
loop_1346:
	subc	%i5,	0x11D3,	%g2
	fxnor	%f4,	%f4,	%f16
	fmuld8ulx16	%f12,	%f23,	%f0
	xnorcc	%i3,	0x1245,	%l3
	fmovrde	%i0,	%f10,	%f8
	umul	%o5,	%o6,	%i1
	ta	%icc,	0x6
	popc	0x145B,	%i6
	tneg	%icc,	0x4
	movle	%xcc,	%l0,	%l4
	movne	%xcc,	%o3,	%o7
	fnot2	%f16,	%f4
	movneg	%icc,	%i2,	%l6
	add	%l5,	0x1C2E,	%g1
	sth	%i7,	[%l7 + 0x32]
	fbe,a	%fcc2,	loop_1347
	movrne	%i4,	%o1,	%g4
	andncc	%g6,	%l1,	%g5
	fcmpgt32	%f24,	%f10,	%g7
loop_1347:
	edge8n	%o0,	%l2,	%o4
	andn	%o2,	0x140A,	%i5
	movn	%icc,	%g3,	%g2
	fcmple32	%f16,	%f8,	%l3
	movrne	%i3,	0x2D2,	%i0
	fmovdneg	%xcc,	%f31,	%f12
	tleu	%xcc,	0x5
	mulx	%o5,	%o6,	%i1
	edge16ln	%i6,	%l4,	%l0
	udivcc	%o3,	0x194B,	%o7
	fmovd	%f30,	%f28
	movn	%icc,	%l6,	%i2
	fbu	%fcc2,	loop_1348
	orncc	%l5,	0x195A,	%g1
	set	0x28, %g1
	lduha	[%l7 + %g1] 0x14,	%i7
loop_1348:
	fmovdvc	%xcc,	%f8,	%f27
	fnot1	%f26,	%f30
	tg	%icc,	0x3
	membar	0x29
	fbue,a	%fcc3,	loop_1349
	srl	%i4,	0x1C,	%o1
	edge16ln	%g4,	%l1,	%g6
	tn	%xcc,	0x4
loop_1349:
	subcc	%g5,	0x030F,	%g7
	fmul8x16au	%f14,	%f5,	%f22
	lduh	[%l7 + 0x32],	%o0
	sir	0x1956
	addcc	%o4,	0x195A,	%l2
	fandnot1s	%f4,	%f15,	%f25
	edge8l	%i5,	%o2,	%g2
	movrlez	%g3,	%l3,	%i0
	edge16n	%i3,	%o5,	%i1
	sth	%o6,	[%l7 + 0x60]
	fcmpgt32	%f0,	%f22,	%i6
	addcc	%l0,	0x1329,	%o3
	smul	%l4,	0x1266,	%l6
	srlx	%o7,	0x01,	%i2
	move	%xcc,	%l5,	%g1
	edge32l	%i4,	%o1,	%g4
	fone	%f18
	movge	%xcc,	%l1,	%g6
	bl,a,pt	%icc,	loop_1350
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x0E] %asi,	%i7
loop_1350:
	fmovsn	%xcc,	%f22,	%f1
	xnor	%g5,	%o0,	%o4
	fmovdneg	%xcc,	%f18,	%f5
	sub	%g7,	%l2,	%i5
	lduw	[%l7 + 0x28],	%o2
	movle	%xcc,	%g3,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i0,	0x08,	%g2
	tle	%icc,	0x5
	tvs	%xcc,	0x4
	edge16l	%o5,	%i1,	%o6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fpsub16s	%f24,	%f5,	%f21
	tsubcctv	%i6,	%l0,	%i3
	sdivcc	%o3,	0x02F2,	%l6
	movle	%icc,	%o7,	%i2
	fnot2	%f4,	%f14
	fmovrde	%l4,	%f8,	%f30
	fabss	%f30,	%f5
	tn	%icc,	0x2
	edge32n	%l5,	%g1,	%i4
	tneg	%icc,	0x5
	udivx	%g4,	0x1E18,	%l1
	bvc	loop_1351
	tvs	%icc,	0x2
	addcc	%g6,	%i7,	%o1
	srlx	%o0,	0x16,	%o4
loop_1351:
	taddcctv	%g5,	0x0089,	%g7
	edge32l	%l2,	%o2,	%i5
	bge	%icc,	loop_1352
	tle	%icc,	0x6
	sub	%g3,	0x1B43,	%i0
	set	0x40, %l5
	lda	[%l7 + %l5] 0x10,	%f6
loop_1352:
	te	%xcc,	0x0
	fbug,a	%fcc1,	loop_1353
	stbar
	movrgz	%g2,	0x169,	%o5
	movge	%icc,	%i1,	%l3
loop_1353:
	fbn,a	%fcc1,	loop_1354
	edge32l	%o6,	%i6,	%l0
	umulcc	%i3,	%l6,	%o3
	sll	%i2,	%l4,	%l5
loop_1354:
	orcc	%o7,	0x0471,	%i4
	sll	%g4,	0x00,	%l1
	fpack32	%f22,	%f12,	%f18
	brlz,a	%g1,	loop_1355
	bcc,a,pn	%icc,	loop_1356
	fmul8sux16	%f28,	%f2,	%f2
	sdivx	%i7,	0x128F,	%g6
loop_1355:
	tgu	%icc,	0x1
loop_1356:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x18,	%o0
	fmovrdlz	%o4,	%f6,	%f12
	brz	%o1,	loop_1357
	ldd	[%l7 + 0x60],	%f24
	brgz,a	%g7,	loop_1358
	fmovdleu	%icc,	%f31,	%f4
loop_1357:
	fmovrde	%g5,	%f6,	%f16
	brnz,a	%o2,	loop_1359
loop_1358:
	fcmpne16	%f16,	%f10,	%i5
	xnor	%l2,	%i0,	%g3
	bpos	%xcc,	loop_1360
loop_1359:
	sra	%o5,	0x06,	%g2
	sub	%i1,	0x03E5,	%o6
	set	0x50, %l6
	stha	%i6,	[%l7 + %l6] 0x11
loop_1360:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f19,	%f27
	ldsw	[%l7 + 0x68],	%l0
	edge8n	%i3,	%l6,	%l3
	membar	0x7D
	ldx	[%l7 + 0x48],	%o3
	sethi	0x0E95,	%l4
	movge	%icc,	%l5,	%i2
	addc	%o7,	0x1A45,	%g4
	nop
	setx loop_1361, %l0, %l1
	jmpl %l1, %l1
	ld	[%l7 + 0x48],	%f26
	andn	%i4,	%i7,	%g1
	tcs	%icc,	0x6
loop_1361:
	tl	%xcc,	0x2
	movgu	%xcc,	%o0,	%g6
	addccc	%o4,	%g7,	%o1
	movne	%xcc,	%o2,	%g5
	movrlez	%l2,	%i0,	%i5
	set	0x20, %g6
	ldswa	[%l7 + %g6] 0x14,	%o5
	tcc	%xcc,	0x5
	umul	%g3,	%i1,	%o6
	alignaddr	%i6,	%g2,	%i3
	mova	%icc,	%l6,	%l0
	fxor	%f14,	%f0,	%f26
	bcc	loop_1362
	sll	%l3,	0x17,	%l4
	movg	%icc,	%l5,	%i2
	movle	%icc,	%o7,	%g4
loop_1362:
	and	%l1,	0x1E7F,	%o3
	fxnors	%f1,	%f13,	%f15
	membar	0x3D
	orcc	%i4,	0x1D83,	%g1
	fcmps	%fcc3,	%f23,	%f13
	fpadd16	%f22,	%f14,	%f30
	tn	%xcc,	0x2
	srl	%i7,	0x11,	%o0
	fpadd16s	%f17,	%f4,	%f4
	fmovdge	%icc,	%f22,	%f3
	edge16l	%o4,	%g7,	%o1
	sub	%g6,	0x1A6C,	%o2
	array8	%g5,	%l2,	%i0
	stbar
	ldd	[%l7 + 0x68],	%f14
	fcmpes	%fcc2,	%f11,	%f5
	popc	%i5,	%o5
	sra	%i1,	0x12,	%g3
	udivx	%o6,	0x0B2E,	%g2
	brgz	%i6,	loop_1363
	fcmpd	%fcc1,	%f2,	%f16
	taddcctv	%i3,	%l0,	%l3
	fbule	%fcc3,	loop_1364
loop_1363:
	or	%l4,	0x1431,	%l5
	fbn	%fcc0,	loop_1365
	xorcc	%l6,	%o7,	%i2
loop_1364:
	edge8ln	%g4,	%o3,	%l1
	taddcctv	%g1,	0x1925,	%i4
loop_1365:
	addccc	%i7,	0x195C,	%o0
	movrlz	%o4,	0x08C,	%o1
	tle	%icc,	0x4
	array32	%g6,	%g7,	%g5
	fbl	%fcc1,	loop_1366
	call	loop_1367
	edge16ln	%o2,	%l2,	%i0
	array8	%o5,	%i5,	%g3
loop_1366:
	taddcctv	%i1,	0x1410,	%g2
loop_1367:
	udiv	%o6,	0x02F8,	%i3
	sra	%l0,	0x01,	%i6
	lduw	[%l7 + 0x14],	%l3
	stb	%l4,	[%l7 + 0x40]
	fmul8x16au	%f26,	%f6,	%f12
	tvs	%xcc,	0x6
	movpos	%icc,	%l5,	%o7
	fmovdvc	%xcc,	%f22,	%f28
	fbn,a	%fcc3,	loop_1368
	fmovrslz	%l6,	%f21,	%f30
	movl	%icc,	%g4,	%i2
	addccc	%o3,	0x08A6,	%g1
loop_1368:
	movvs	%xcc,	%l1,	%i4
	edge16l	%i7,	%o4,	%o0
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x17
	membar	#Sync
	and	%g6,	%g7,	%o1
	sdivcc	%g5,	0x1352,	%o2
	ble,pn	%icc,	loop_1369
	movrne	%l2,	%i0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f28,	%f22
loop_1369:
	movgu	%xcc,	%i5,	%g3
	tneg	%icc,	0x6
	tl	%icc,	0x5
	move	%icc,	%g2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %l4
	lduha	[%l7 + %l4] 0x11,	%o6
	movge	%xcc,	%l0,	%i3
	fcmpne16	%f0,	%f14,	%i6
	nop
	setx	loop_1370,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%l3,	%l5,	%o7
	fandnot2s	%f18,	%f27,	%f28
	movrlz	%l4,	%l6,	%i2
loop_1370:
	brgez	%g4,	loop_1371
	popc	0x1E51,	%g1
	movvs	%icc,	%l1,	%i4
	alignaddrl	%i7,	%o4,	%o3
loop_1371:
	edge8l	%o0,	%g7,	%g6
	sdivx	%g5,	0x1EF2,	%o2
	array16	%l2,	%o1,	%i0
	flush	%l7 + 0x64
	stx	%i5,	[%l7 + 0x08]
	tpos	%icc,	0x2
	fbue	%fcc1,	loop_1372
	srlx	%g3,	0x0E,	%o5
	srl	%g2,	0x02,	%i1
	addc	%l0,	0x11E5,	%o6
loop_1372:
	movre	%i3,	%i6,	%l5
	movg	%icc,	%l3,	%o7
	edge32	%l6,	%l4,	%i2
	orn	%g1,	0x1BAB,	%l1
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x0c,	 0x0
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x10,	%i4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%i7
	edge8	%o4,	%o3,	%o0
	movrne	%g7,	0x24E,	%g6
	fmovspos	%xcc,	%f22,	%f3
	edge16ln	%g5,	%o2,	%o1
	ldsb	[%l7 + 0x09],	%l2
	tneg	%xcc,	0x3
	nop
	setx loop_1373, %l0, %l1
	jmpl %l1, %i0
	faligndata	%f30,	%f26,	%f24
	fmovdg	%icc,	%f4,	%f9
	smul	%g3,	0x05A6,	%o5
loop_1373:
	fpadd16s	%f30,	%f0,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g2,	%i5,	%l0
	udivx	%o6,	0x0F17,	%i3
	movcc	%xcc,	%i1,	%l5
	sub	%i6,	%o7,	%l6
	taddcctv	%l4,	%l3,	%g1
	set	0x4C, %i2
	lda	[%l7 + %i2] 0x81,	%f10
	fmovrslz	%i2,	%f27,	%f2
	movvs	%xcc,	%l1,	%i4
	set	0x48, %o5
	ldswa	[%l7 + %o5] 0x0c,	%g4
	movge	%xcc,	%o4,	%o3
	alignaddrl	%o0,	%g7,	%g6
	or	%g5,	0x019C,	%o2
	brnz	%i7,	loop_1374
	taddcctv	%l2,	%o1,	%i0
	or	%o5,	%g3,	%g2
	be,a,pn	%xcc,	loop_1375
loop_1374:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pt	%icc,	loop_1376
	tgu	%icc,	0x1
loop_1375:
	fmovrdgez	%l0,	%f30,	%f20
	fmovrdne	%o6,	%f2,	%f4
loop_1376:
	edge16l	%i5,	%i1,	%i3
	edge8l	%l5,	%o7,	%l6
	ldd	[%l7 + 0x20],	%i6
	fcmpeq16	%f12,	%f8,	%l3
	te	%icc,	0x2
	movle	%icc,	%g1,	%l4
	fnegs	%f17,	%f8
	srax	%i2,	0x13,	%l1
	fbe,a	%fcc1,	loop_1377
	fexpand	%f5,	%f26
	mulscc	%i4,	0x1851,	%g4
	fbu,a	%fcc1,	loop_1378
loop_1377:
	tsubcctv	%o3,	%o0,	%o4
	tneg	%icc,	0x3
	movrgez	%g7,	%g6,	%g5
loop_1378:
	array8	%i7,	%o2,	%l2
	array16	%i0,	%o1,	%g3
	fabss	%f13,	%f18
	move	%xcc,	%g2,	%l0
	fmovd	%f8,	%f24
	fble	%fcc1,	loop_1379
	array8	%o6,	%o5,	%i5
	stb	%i1,	[%l7 + 0x0D]
	orncc	%i3,	%l5,	%l6
loop_1379:
	movrlez	%i6,	%l3,	%g1
	sra	%l4,	%o7,	%i2
	tg	%icc,	0x5
	xor	%l1,	0x057D,	%i4
	swap	[%l7 + 0x38],	%g4
	fmul8ulx16	%f26,	%f4,	%f22
	movcc	%xcc,	%o0,	%o4
	udiv	%g7,	0x1CA7,	%o3
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xe3,	%g6
	srax	%g5,	0x00,	%o2
	tsubcc	%l2,	0x173C,	%i7
	ta	%xcc,	0x1
	fmovrdgez	%o1,	%f28,	%f6
	tvc	%xcc,	0x4
	fandnot1s	%f19,	%f21,	%f0
	fcmpd	%fcc2,	%f24,	%f22
	edge8l	%i0,	%g3,	%l0
	srlx	%o6,	%g2,	%i5
	fmul8x16al	%f30,	%f24,	%f20
	tcc	%icc,	0x0
	st	%f14,	[%l7 + 0x14]
	ldstub	[%l7 + 0x76],	%o5
	pdist	%f28,	%f18,	%f26
	fornot2	%f14,	%f18,	%f26
	fpadd16s	%f19,	%f25,	%f0
	bneg,a,pn	%xcc,	loop_1380
	movcc	%xcc,	%i3,	%l5
	fmovrdgez	%i1,	%f6,	%f18
	fmovsg	%xcc,	%f31,	%f9
loop_1380:
	srax	%l6,	0x0B,	%i6
	te	%icc,	0x2
	bpos,pt	%icc,	loop_1381
	fpadd32	%f28,	%f2,	%f18
	movrlez	%g1,	%l3,	%l4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1381:
	taddcc	%i2,	0x0537,	%o7
	fcmpne32	%f24,	%f0,	%l1
	orcc	%g4,	%o0,	%i4
	movle	%icc,	%o4,	%g7
	fbug,a	%fcc2,	loop_1382
	tsubcc	%g6,	0x025E,	%o3
	taddcctv	%o2,	%g5,	%l2
	sethi	0x0E23,	%o1
loop_1382:
	udivx	%i7,	0x0D17,	%i0
	tg	%icc,	0x4
	umulcc	%l0,	%o6,	%g2
	popc	%i5,	%o5
	srlx	%g3,	0x1A,	%i3
	brlz	%l5,	loop_1383
	fandnot1s	%f3,	%f28,	%f25
	taddcctv	%l6,	%i1,	%i6
	tsubcc	%g1,	%l4,	%i2
loop_1383:
	movleu	%icc,	%o7,	%l1
	movrlez	%l3,	%g4,	%o0
	fzero	%f2
	subc	%o4,	0x01AB,	%i4
	tne	%xcc,	0x5
	nop
	setx loop_1384, %l0, %l1
	jmpl %l1, %g7
	ldd	[%l7 + 0x30],	%g6
	std	%f30,	[%l7 + 0x28]
	ldd	[%l7 + 0x18],	%f4
loop_1384:
	movn	%xcc,	%o2,	%g5
	and	%o3,	%l2,	%i7
	fmuld8sux16	%f26,	%f2,	%f4
	fabsd	%f4,	%f4
	fmovsle	%xcc,	%f2,	%f6
	srlx	%o1,	%i0,	%o6
	wr	%g0,	0x81,	%asi
	stba	%l0,	[%l7 + 0x68] %asi
	sub	%g2,	%i5,	%g3
	movrlz	%o5,	0x0ED,	%i3
	brnz	%l6,	loop_1385
	fbu,a	%fcc3,	loop_1386
	ldsh	[%l7 + 0x70],	%i1
	ldub	[%l7 + 0x62],	%l5
loop_1385:
	srlx	%g1,	%i6,	%i2
loop_1386:
	fzero	%f10
	movgu	%xcc,	%l4,	%o7
	movrlez	%l3,	%g4,	%l1
	edge16n	%o0,	%i4,	%o4
	sub	%g6,	0x1E94,	%g7
	addc	%o2,	%o3,	%g5
	tge	%icc,	0x0
	call	loop_1387
	fmovse	%icc,	%f13,	%f23
	membar	0x60
	sub	%i7,	0x1BB6,	%o1
loop_1387:
	fmovrdgz	%l2,	%f22,	%f26
	movre	%i0,	0x090,	%l0
	fbue,a	%fcc3,	loop_1388
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
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1388:
	fnot2s	%f2,	%f31
	taddcctv	%o6,	0x01C3,	%i5
	movrlez	%g2,	0x1DD,	%g3
	brgz	%o5,	loop_1389
	tle	%icc,	0x1
	bneg,a,pt	%xcc,	loop_1390
	udivx	%i3,	0x0AD3,	%l6
loop_1389:
	fmovsleu	%xcc,	%f10,	%f12
	ldx	[%l7 + 0x30],	%i1
loop_1390:
	tvc	%icc,	0x2
	movge	%xcc,	%g1,	%i6
	udiv	%l5,	0x0746,	%l4
	alignaddr	%i2,	%l3,	%g4
	sir	0x0500
	tpos	%icc,	0x3
	ble,a,pt	%xcc,	loop_1391
	addccc	%o7,	0x056E,	%l1
	andn	%o0,	%o4,	%i4
	swap	[%l7 + 0x14],	%g7
loop_1391:
	array16	%g6,	%o3,	%g5
	fmovd	%f12,	%f30
	fsrc1	%f8,	%f18
	fornot1s	%f25,	%f6,	%f7
	edge16l	%o2,	%o1,	%l2
	fxnors	%f4,	%f8,	%f12
	tg	%xcc,	0x4
	taddcctv	%i7,	0x0A00,	%l0
	sethi	0x0791,	%o6
	udivx	%i5,	0x06D7,	%g2
	tgu	%icc,	0x6
	movvs	%icc,	%i0,	%o5
	fnot2	%f2,	%f16
	fones	%f1
	popc	0x143E,	%i3
	movge	%xcc,	%l6,	%i1
	movleu	%icc,	%g1,	%i6
	tge	%icc,	0x5
	stw	%g3,	[%l7 + 0x54]
	movcs	%icc,	%l5,	%l4
	ble,a,pn	%icc,	loop_1392
	sth	%i2,	[%l7 + 0x46]
	sra	%l3,	0x15,	%g4
	stbar
loop_1392:
	tl	%icc,	0x2
	tgu	%icc,	0x3
	tvs	%icc,	0x6
	movg	%icc,	%l1,	%o7
	tl	%xcc,	0x2
	sllx	%o0,	0x16,	%i4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o4
	bvs,a,pt	%xcc,	loop_1393
	ldd	[%l7 + 0x68],	%f10
	ldx	[%l7 + 0x38],	%g7
	tn	%icc,	0x4
loop_1393:
	bne,a	%xcc,	loop_1394
	subccc	%o3,	%g6,	%o2
	fsrc2	%f18,	%f28
	tvs	%icc,	0x5
loop_1394:
	sdiv	%g5,	0x0438,	%o1
	tneg	%icc,	0x3
	orncc	%l2,	0x0996,	%l0
	stw	%o6,	[%l7 + 0x64]
	fcmple16	%f6,	%f24,	%i5
	fbule,a	%fcc1,	loop_1395
	movrlz	%g2,	0x364,	%i7
	xnor	%o5,	%i0,	%l6
	edge16n	%i1,	%i3,	%g1
loop_1395:
	fbu,a	%fcc1,	loop_1396
	array16	%i6,	%g3,	%l4
	bshuffle	%f16,	%f0,	%f16
	srl	%l5,	0x1C,	%l3
loop_1396:
	movre	%g4,	%i2,	%l1
	taddcctv	%o7,	%i4,	%o0
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%o4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x40] %asi,	%o3
	bne	loop_1397
	edge8ln	%g7,	%g6,	%o2
	fbne,a	%fcc1,	loop_1398
	fmovs	%f8,	%f23
loop_1397:
	fpsub32s	%f18,	%f29,	%f26
	std	%g4,	[%l7 + 0x28]
loop_1398:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x3E] %asi,	%o1
	sub	%l0,	%o6,	%l2
	umul	%i5,	0x020B,	%i7
	nop
	setx	loop_1399,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%g2,	%o5,	%l6
	fmovsle	%xcc,	%f10,	%f27
	udiv	%i0,	0x1758,	%i1
loop_1399:
	tpos	%icc,	0x0
	movneg	%icc,	%g1,	%i6
	array8	%g3,	%i3,	%l5
	tg	%xcc,	0x7
	fmovdcc	%xcc,	%f30,	%f31
	orcc	%l4,	0x0293,	%l3
	fbule	%fcc0,	loop_1400
	movrne	%i2,	%g4,	%o7
	fbge,a	%fcc0,	loop_1401
	ldub	[%l7 + 0x1B],	%i4
loop_1400:
	orcc	%o0,	%l1,	%o4
	array32	%g7,	%o3,	%g6
loop_1401:
	popc	%g5,	%o2
	srlx	%l0,	0x0A,	%o6
	bvs,a	loop_1402
	fbul,a	%fcc2,	loop_1403
	edge16	%l2,	%o1,	%i5
	set	0x24, %i3
	sta	%f0,	[%l7 + %i3] 0x88
loop_1402:
	alignaddr	%g2,	%i7,	%l6
loop_1403:
	movge	%xcc,	%o5,	%i0
	tge	%xcc,	0x0
	edge32ln	%g1,	%i1,	%i6
	sll	%i3,	%g3,	%l4
	mova	%xcc,	%l3,	%l5
	fmovdleu	%xcc,	%f8,	%f14
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%g4
	brlz	%i2,	loop_1404
	fpack16	%f22,	%f7
	movcc	%xcc,	%o7,	%o0
	edge8ln	%l1,	%i4,	%g7
loop_1404:
	tle	%xcc,	0x4
	flush	%l7 + 0x7C
	udiv	%o4,	0x129D,	%g6
	alignaddr	%o3,	%g5,	%l0
	add	%o2,	0x1A90,	%l2
	sdivx	%o1,	0x16C8,	%o6
	ldd	[%l7 + 0x28],	%f12
	fand	%f26,	%f28,	%f16
	fbe,a	%fcc1,	loop_1405
	bleu,pt	%xcc,	loop_1406
	sdiv	%i5,	0x0CE1,	%i7
	movrgz	%g2,	0x12F,	%o5
loop_1405:
	srax	%i0,	%l6,	%i1
loop_1406:
	addcc	%g1,	%i6,	%g3
	subc	%l4,	0x1361,	%i3
	tcs	%xcc,	0x2
	sdivx	%l5,	0x17AB,	%l3
	xnor	%i2,	0x1D1C,	%o7
	set	0x48, %g7
	stba	%g4,	[%l7 + %g7] 0x27
	membar	#Sync
	andn	%l1,	0x0B0C,	%o0
	movneg	%icc,	%i4,	%g7
	movcs	%xcc,	%o4,	%o3
	xor	%g5,	%l0,	%g6
	tvs	%xcc,	0x4
	ldsb	[%l7 + 0x5F],	%l2
	edge16ln	%o2,	%o6,	%i5
	fmovdpos	%icc,	%f27,	%f31
	movle	%icc,	%i7,	%o1
	edge8	%g2,	%o5,	%l6
	tn	%icc,	0x0
	faligndata	%f10,	%f16,	%f14
	alignaddrl	%i1,	%i0,	%i6
	addccc	%g1,	0x09BD,	%g3
	edge16ln	%i3,	%l5,	%l3
	movrlez	%i2,	%o7,	%g4
	udivcc	%l1,	0x19A4,	%o0
	movrlz	%l4,	%g7,	%o4
	fzero	%f2
	movcc	%icc,	%i4,	%g5
	orn	%l0,	0x0A49,	%o3
	and	%l2,	0x094F,	%o2
	tleu	%xcc,	0x5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%g6
	umulcc	%i5,	%i7,	%g2
	set	0x40, %i0
	stwa	%o1,	[%l7 + %i0] 0x14
	fmovrdgz	%o5,	%f30,	%f0
	array32	%i1,	%l6,	%i0
	wr	%g0,	0x80,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
	fmovrse	%g3,	%f25,	%f16
	movneg	%xcc,	%i3,	%l5
	std	%f28,	[%l7 + 0x10]
	movrgz	%l3,	0x2EB,	%i2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%g4
	bgu,a	loop_1407
	udivcc	%g1,	0x0253,	%l1
	orcc	%o0,	%g7,	%l4
	ldsh	[%l7 + 0x48],	%o4
loop_1407:
	add	%g5,	0x1317,	%i4
	fbug	%fcc0,	loop_1408
	subccc	%o3,	0x1DC3,	%l0
	mulscc	%o2,	%o6,	%g6
	xorcc	%l2,	%i7,	%g2
loop_1408:
	fmovdl	%icc,	%f20,	%f29
	fmovrse	%o1,	%f18,	%f3
	fmovdneg	%xcc,	%f4,	%f7
	subccc	%i5,	0x0BCE,	%i1
	array16	%l6,	%i0,	%i6
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x24] %asi,	%o5
	sdivcc	%g3,	0x1F45,	%l5
	fbl	%fcc3,	loop_1409
	fbul,a	%fcc2,	loop_1410
	edge32ln	%l3,	%i3,	%i2
	bvs	loop_1411
loop_1409:
	be,pn	%xcc,	loop_1412
loop_1410:
	edge16n	%o7,	%g1,	%l1
	movle	%icc,	%o0,	%g7
loop_1411:
	tn	%xcc,	0x5
loop_1412:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%l4,	[%l7 + 0x3C] %asi
	membar	#Sync
	movvc	%icc,	%g4,	%o4
	andn	%g5,	0x09CE,	%o3
	srlx	%i4,	0x1E,	%l0
	membar	0x1B
	tneg	%icc,	0x1
	array8	%o6,	%g6,	%l2
	sll	%o2,	%i7,	%g2
	srl	%i5,	%i1,	%l6
	fbue	%fcc3,	loop_1413
	fmovrde	%i0,	%f30,	%f0
	xor	%o1,	0x0C10,	%o5
	bne,a	%xcc,	loop_1414
loop_1413:
	fornot2s	%f14,	%f0,	%f25
	tge	%xcc,	0x7
	ldsb	[%l7 + 0x0F],	%g3
loop_1414:
	subccc	%i6,	%l3,	%i3
	nop
	setx	loop_1415,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%l5,	0x11,	%i2
	edge32l	%g1,	%o7,	%l1
	faligndata	%f12,	%f28,	%f10
loop_1415:
	nop
	set	0x6C, %o1
	stwa	%g7,	[%l7 + %o1] 0x15
	fpmerge	%f6,	%f3,	%f30
	movvc	%xcc,	%l4,	%g4
	fbule,a	%fcc3,	loop_1416
	smulcc	%o0,	%g5,	%o3
	bge	%icc,	loop_1417
	stx	%o4,	[%l7 + 0x58]
loop_1416:
	edge32l	%l0,	%o6,	%g6
	ldd	[%l7 + 0x30],	%i4
loop_1417:
	movvs	%xcc,	%l2,	%i7
	sll	%o2,	%i5,	%i1
	tvc	%icc,	0x4
	fmul8x16au	%f2,	%f27,	%f22
	subccc	%g2,	0x11C6,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,pt	%xcc,	loop_1418
	brgz,a	%i0,	loop_1419
	xor	%o5,	0x0EB3,	%o1
	te	%xcc,	0x6
loop_1418:
	nop
	wr	%g0,	0x89,	%asi
	stba	%g3,	[%l7 + 0x2A] %asi
loop_1419:
	nop
	set	0x70, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l3
	fcmpne32	%f20,	%f18,	%i6
	fandnot2	%f4,	%f30,	%f30
	fmovda	%icc,	%f23,	%f10
	fcmps	%fcc1,	%f14,	%f12
	movvs	%xcc,	%i3,	%i2
	ldd	[%l7 + 0x60],	%f14
	subc	%l5,	0x060A,	%g1
	srlx	%o7,	%l1,	%g7
	ldd	[%l7 + 0x60],	%f14
	or	%g4,	0x1C74,	%o0
	subccc	%l4,	%g5,	%o3
	swap	[%l7 + 0x0C],	%l0
	edge8ln	%o6,	%g6,	%o4
	stx	%i4,	[%l7 + 0x10]
	fcmpes	%fcc0,	%f1,	%f21
	sll	%l2,	0x0D,	%o2
	taddcc	%i5,	0x0385,	%i7
	fcmpd	%fcc2,	%f8,	%f8
	fcmpgt32	%f2,	%f8,	%i1
	stw	%l6,	[%l7 + 0x3C]
	fbule	%fcc3,	loop_1420
	fmovdl	%xcc,	%f8,	%f26
	smul	%i0,	%o5,	%o1
	alignaddr	%g3,	%g2,	%i6
loop_1420:
	movgu	%xcc,	%i3,	%i2
	ldstub	[%l7 + 0x18],	%l3
	set	0x20, %o7
	stxa	%l5,	[%l7 + %o7] 0x88
	brlz	%o7,	loop_1421
	addc	%g1,	0x041B,	%l1
	taddcc	%g7,	%g4,	%o0
	mova	%icc,	%l4,	%o3
loop_1421:
	alignaddr	%g5,	%o6,	%g6
	lduh	[%l7 + 0x46],	%o4
	movne	%icc,	%l0,	%i4
	edge32l	%l2,	%o2,	%i7
	tle	%xcc,	0x3
	std	%i0,	[%l7 + 0x10]
	or	%l6,	%i5,	%o5
	fandnot1s	%f28,	%f16,	%f0
	edge32n	%o1,	%i0,	%g2
	tle	%icc,	0x2
	movg	%xcc,	%i6,	%g3
	fbne	%fcc0,	loop_1422
	tpos	%icc,	0x0
	bg	%xcc,	loop_1423
	fpadd16	%f0,	%f14,	%f20
loop_1422:
	nop
	setx	loop_1424,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbne,a	%fcc0,	loop_1425
loop_1423:
	taddcc	%i3,	%l3,	%l5
	sll	%o7,	%g1,	%i2
loop_1424:
	sub	%l1,	%g4,	%g7
loop_1425:
	fmovdvs	%xcc,	%f0,	%f19
	xor	%o0,	%o3,	%g5
	movre	%l4,	%g6,	%o6
	ldub	[%l7 + 0x5A],	%l0
	udivx	%o4,	0x0B33,	%i4
	tgu	%xcc,	0x2
	fpmerge	%f20,	%f4,	%f6
	te	%xcc,	0x0
	fpsub32	%f14,	%f30,	%f18
	alignaddr	%o2,	%l2,	%i7
	tvs	%icc,	0x1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x12] %asi,	%i1
	set	0x10, %i6
	stxa	%i5,	[%l7 + %i6] 0x88
	subccc	%l6,	%o1,	%i0
	fmovde	%icc,	%f12,	%f4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
	fmovrdgz	%o5,	%f6,	%f20
	fmovrse	%g3,	%f28,	%f14
	fnot2s	%f11,	%f28
	tgu	%icc,	0x6
	bl,a,pn	%xcc,	loop_1426
	mulscc	%i3,	%i6,	%l3
	fblg,a	%fcc2,	loop_1427
	bn,a,pt	%xcc,	loop_1428
loop_1426:
	subcc	%o7,	0x0D22,	%g1
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
loop_1427:
	fxnor	%f10,	%f0,	%f4
loop_1428:
	nop
	set	0x3F, %o6
	stba	%l5,	[%l7 + %o6] 0xe2
	membar	#Sync
	fpsub32	%f16,	%f20,	%f22
	fcmpgt16	%f8,	%f4,	%i2
	edge32	%l1,	%g7,	%o0
	edge8l	%g4,	%g5,	%o3
	fcmpd	%fcc3,	%f24,	%f8
	set	0x1B, %l2
	stba	%l4,	[%l7 + %l2] 0x19
	fbn	%fcc3,	loop_1429
	addcc	%g6,	%l0,	%o4
	udivcc	%o6,	0x1332,	%o2
	std	%f30,	[%l7 + 0x50]
loop_1429:
	smulcc	%l2,	%i7,	%i1
	set	0x18, %o2
	lduwa	[%l7 + %o2] 0x15,	%i4
	fcmpne16	%f24,	%f16,	%i5
	smul	%o1,	%i0,	%l6
	lduh	[%l7 + 0x7E],	%o5
	bvs,pn	%xcc,	loop_1430
	array8	%g2,	%g3,	%i3
	edge16	%i6,	%l3,	%o7
	movrne	%l5,	%g1,	%l1
loop_1430:
	subcc	%g7,	%o0,	%g4
	ldsh	[%l7 + 0x26],	%g5
	fsrc2s	%f14,	%f21
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
	array32	%o3,	%i2,	%g6
	edge16ln	%l4,	%o4,	%o6
	be,a	%icc,	loop_1432
loop_1431:
	fbn	%fcc0,	loop_1433
	fpsub32	%f30,	%f26,	%f16
	set	0x68, %i1
	lduba	[%l7 + %i1] 0x04,	%l0
loop_1432:
	bne	loop_1434
loop_1433:
	movre	%o2,	0x123,	%i7
	flush	%l7 + 0x2C
	udivx	%l2,	0x1D33,	%i4
loop_1434:
	tsubcc	%i1,	0x1040,	%o1
	ldsw	[%l7 + 0x40],	%i5
	movcc	%xcc,	%i0,	%o5
	movrgz	%g2,	0x0A9,	%l6
	orcc	%i3,	0x16E8,	%i6
	fmovsn	%xcc,	%f15,	%f8
	edge32ln	%g3,	%o7,	%l5
	set	0x44, %o4
	lduwa	[%l7 + %o4] 0x18,	%l3
	tg	%icc,	0x3
	smulcc	%g1,	0x0253,	%l1
	tsubcctv	%o0,	0x1568,	%g7
	fzeros	%f24
	fmul8x16al	%f20,	%f16,	%f30
	or	%g4,	0x1020,	%o3
	sdiv	%g5,	0x00E8,	%g6
	std	%l4,	[%l7 + 0x78]
	umul	%o4,	0x007F,	%i2
	xnorcc	%l0,	%o2,	%o6
	fexpand	%f6,	%f2
	tvs	%icc,	0x2
	call	loop_1435
	movrlz	%i7,	0x020,	%i4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x71] %asi,	%l2
loop_1435:
	nop
	set	0x40, %i5
	stba	%o1,	[%l7 + %i5] 0x2f
	membar	#Sync
	fsrc2s	%f6,	%f1
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
	edge8n	%i5,	%i0,	%o5
	array8	%i1,	%l6,	%g2
	fornot2	%f2,	%f26,	%f4
	edge32n	%i6,	%i3,	%g3
	bg,a,pt	%xcc,	loop_1436
	sir	0x1E55
	taddcc	%l5,	0x0E3C,	%l3
	fmovde	%icc,	%f23,	%f16
loop_1436:
	smul	%g1,	0x109C,	%o7
	tsubcctv	%l1,	%o0,	%g4
	fmuld8ulx16	%f26,	%f24,	%f12
	movre	%g7,	%o3,	%g6
	fbue,a	%fcc2,	loop_1437
	xorcc	%g5,	0x1E62,	%l4
	ldd	[%l7 + 0x10],	%f24
	andncc	%o4,	%l0,	%i2
loop_1437:
	sethi	0x0855,	%o6
	edge32ln	%o2,	%i4,	%i7
	move	%icc,	%l2,	%o1
	sll	%i5,	0x16,	%o5
	array32	%i1,	%i0,	%l6
	movcc	%icc,	%g2,	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x18,	%g3,	%i6
	movcc	%xcc,	%l5,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	loop_1438
	bvs,pn	%xcc,	loop_1439
	movcs	%xcc,	%g1,	%l1
	tn	%icc,	0x6
loop_1438:
	fmovrsgz	%o0,	%f2,	%f3
loop_1439:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o7,	%g4,	%o3
	subc	%g7,	%g5,	%g6
	set	0x0C, %o3
	lda	[%l7 + %o3] 0x10,	%f4
	fmovdvs	%xcc,	%f11,	%f8
	fmovrsne	%o4,	%f22,	%f18
	fcmped	%fcc1,	%f28,	%f4
	faligndata	%f8,	%f8,	%f2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x42] %asi,	%l4
	fmovsge	%xcc,	%f9,	%f29
	set	0x40, %g4
	ldswa	[%l7 + %g4] 0x89,	%i2
	te	%xcc,	0x7
	sll	%o6,	0x03,	%o2
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x2f,	%i4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x0c,	%f0
	fmovdcc	%xcc,	%f31,	%f0
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x36] %asi,	%l0
	fblg,a	%fcc0,	loop_1440
	stb	%l2,	[%l7 + 0x22]
	fmovscs	%xcc,	%f3,	%f28
	bcs,pn	%icc,	loop_1441
loop_1440:
	stb	%o1,	[%l7 + 0x15]
	orncc	%i5,	%o5,	%i1
	movvs	%icc,	%i0,	%i7
loop_1441:
	movvs	%icc,	%l6,	%i3
	ldub	[%l7 + 0x55],	%g2
	movcs	%icc,	%g3,	%i6
	orcc	%l5,	0x0FE0,	%g1
	sllx	%l3,	%o0,	%l1
	tsubcctv	%g4,	%o7,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x7
	movgu	%icc,	%o3,	%g5
	edge32l	%o4,	%l4,	%g6
	set	0x40, %g1
	stxa	%o6,	[%l7 + %g1] 0x23
	membar	#Sync
	movre	%i2,	0x217,	%i4
	srax	%o2,	%l0,	%l2
	movvs	%icc,	%i5,	%o1
	bcs	%icc,	loop_1442
	udivx	%i1,	0x1A74,	%o5
	movvs	%xcc,	%i0,	%i7
	membar	0x5F
loop_1442:
	movneg	%xcc,	%i3,	%l6
	fpsub32s	%f25,	%f15,	%f0
	fmovsle	%xcc,	%f10,	%f14
	edge8n	%g3,	%i6,	%g2
	movvs	%icc,	%g1,	%l3
	xorcc	%o0,	0x1F06,	%l1
	sdivx	%g4,	0x0042,	%o7
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x15,	%g7
	xnorcc	%o3,	0x0AB3,	%l5
	sir	0x09F9
	bn,a,pn	%icc,	loop_1443
	te	%xcc,	0x2
	nop
	set	0x20, %g5
	ldub	[%l7 + %g5],	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1443:
	mova	%icc,	%o4,	%g6
	fbue	%fcc0,	loop_1444
	fmovsn	%xcc,	%f10,	%f20
	flush	%l7 + 0x18
	fmul8x16	%f24,	%f6,	%f16
loop_1444:
	mulx	%l4,	%i2,	%i4
	edge8ln	%o2,	%l0,	%o6
	brz	%i5,	loop_1445
	fnor	%f2,	%f16,	%f0
	nop
	setx loop_1446, %l0, %l1
	jmpl %l1, %o1
	fmul8sux16	%f20,	%f6,	%f18
loop_1445:
	fmovdpos	%xcc,	%f5,	%f30
	tvs	%icc,	0x6
loop_1446:
	edge32ln	%l2,	%i1,	%i0
	fmovsle	%icc,	%f12,	%f8
	tg	%icc,	0x2
	tl	%icc,	0x6
	move	%xcc,	%o5,	%i3
	ld	[%l7 + 0x14],	%f29
	edge8	%l6,	%g3,	%i6
	tl	%icc,	0x2
	bl,a,pn	%icc,	loop_1447
	movle	%icc,	%i7,	%g2
	edge8	%l3,	%o0,	%g1
	sdiv	%g4,	0x1C7A,	%l1
loop_1447:
	fcmple32	%f24,	%f18,	%g7
	movle	%xcc,	%o7,	%o3
	ldx	[%l7 + 0x20],	%g5
	array32	%o4,	%l5,	%g6
	fcmped	%fcc0,	%f12,	%f6
	stw	%i2,	[%l7 + 0x1C]
	fbo	%fcc0,	loop_1448
	array16	%l4,	%i4,	%o2
	stx	%o6,	[%l7 + 0x70]
	xor	%l0,	%i5,	%o1
loop_1448:
	bvs,a,pt	%icc,	loop_1449
	tsubcc	%i1,	0x1B87,	%l2
	tge	%xcc,	0x6
	fbug	%fcc2,	loop_1450
loop_1449:
	ld	[%l7 + 0x58],	%f27
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i0,	%o5
loop_1450:
	sdivx	%l6,	0x0485,	%g3
	edge8	%i3,	%i6,	%i7
	movrne	%l3,	0x3DE,	%o0
	xorcc	%g2,	0x0FDB,	%g4
	movrne	%g1,	0x10C,	%g7
	nop
	setx loop_1451, %l0, %l1
	jmpl %l1, %l1
	and	%o7,	0x1AEF,	%o3
	fmovse	%icc,	%f12,	%f9
	taddcc	%o4,	%l5,	%g5
loop_1451:
	movgu	%xcc,	%g6,	%i2
	movpos	%icc,	%i4,	%l4
	te	%xcc,	0x4
	movg	%icc,	%o2,	%o6
	umulcc	%l0,	0x17D4,	%i5
	call	loop_1452
	movneg	%icc,	%o1,	%i1
	nop
	setx	loop_1453,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsgu	%xcc,	%f21,	%f16
loop_1452:
	andn	%i0,	%l2,	%l6
	bvs,a	loop_1454
loop_1453:
	fcmpd	%fcc3,	%f18,	%f22
	andncc	%o5,	%i3,	%i6
	fbge,a	%fcc1,	loop_1455
loop_1454:
	brgz	%g3,	loop_1456
	movcs	%xcc,	%i7,	%o0
	sdivcc	%g2,	0x0BBB,	%l3
loop_1455:
	fandnot2s	%f19,	%f30,	%f8
loop_1456:
	fbo,a	%fcc3,	loop_1457
	tl	%icc,	0x3
	movne	%xcc,	%g1,	%g7
	addccc	%l1,	%g4,	%o7
loop_1457:
	tle	%xcc,	0x7
	tgu	%icc,	0x5
	andn	%o4,	%o3,	%l5
	sra	%g6,	%g5,	%i2
	tne	%xcc,	0x1
	fbg	%fcc1,	loop_1458
	sll	%l4,	%o2,	%o6
	bleu,a,pt	%icc,	loop_1459
	fsrc1s	%f17,	%f31
loop_1458:
	edge32ln	%i4,	%i5,	%l0
	flush	%l7 + 0x54
loop_1459:
	movn	%xcc,	%o1,	%i1
	taddcc	%i0,	0x0F73,	%l6
	subcc	%l2,	0x1E44,	%i3
	fsrc1	%f16,	%f30
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f8
	fzeros	%f25
	mova	%xcc,	%i6,	%o5
	sethi	0x06AA,	%i7
	fmovda	%icc,	%f3,	%f23
	fbn,a	%fcc2,	loop_1460
	fpsub16s	%f18,	%f31,	%f27
	add	%o0,	%g3,	%l3
	tleu	%xcc,	0x7
loop_1460:
	movpos	%icc,	%g1,	%g2
	edge32n	%g7,	%l1,	%o7
	fbug,a	%fcc0,	loop_1461
	movvc	%icc,	%o4,	%g4
	subccc	%o3,	0x11C8,	%g6
	smulcc	%l5,	%g5,	%i2
loop_1461:
	srl	%l4,	0x1C,	%o2
	fmovrsgz	%i4,	%f14,	%f19
	prefetch	[%l7 + 0x24],	 0x0
	fbe,a	%fcc3,	loop_1462
	te	%xcc,	0x2
	xnorcc	%o6,	0x1B8E,	%l0
	umulcc	%o1,	%i5,	%i0
loop_1462:
	bvc	%xcc,	loop_1463
	brlz	%l6,	loop_1464
	addccc	%l2,	%i1,	%i6
	tn	%icc,	0x4
loop_1463:
	fzeros	%f1
loop_1464:
	brlez,a	%o5,	loop_1465
	stx	%i7,	[%l7 + 0x28]
	sth	%o0,	[%l7 + 0x40]
	wr	%g0,	0x10,	%asi
	sta	%f16,	[%l7 + 0x54] %asi
loop_1465:
	fabss	%f5,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x4
	movne	%icc,	%i3,	%l3
	fxors	%f31,	%f9,	%f9
	fmovsneg	%icc,	%f11,	%f9
	fcmpeq32	%f8,	%f10,	%g3
	subc	%g2,	%g1,	%g7
	movpos	%icc,	%l1,	%o7
	fmovdcs	%icc,	%f26,	%f25
	bn	loop_1466
	movne	%xcc,	%g4,	%o3
	andn	%o4,	0x152B,	%l5
	alignaddr	%g5,	%i2,	%l4
loop_1466:
	alignaddr	%g6,	%i4,	%o6
	ta	%icc,	0x4
	subccc	%l0,	%o2,	%i5
	fpsub32s	%f1,	%f15,	%f17
	fbul,a	%fcc3,	loop_1467
	movrgez	%o1,	0x0EB,	%i0
	fabss	%f11,	%f15
	subcc	%l2,	0x0D4C,	%l6
loop_1467:
	nop
	set	0x5E, %g6
	stha	%i6,	[%l7 + %g6] 0x0c
	fmovrdne	%o5,	%f20,	%f20
	alignaddrl	%i1,	%o0,	%i3
	bgu,a,pt	%xcc,	loop_1468
	alignaddr	%l3,	%i7,	%g3
	be,a	%xcc,	loop_1469
	lduw	[%l7 + 0x78],	%g2
loop_1468:
	fnot1s	%f24,	%f30
	movg	%xcc,	%g7,	%l1
loop_1469:
	fpsub16s	%f21,	%f15,	%f6
	bcs	%icc,	loop_1470
	fmovsgu	%icc,	%f13,	%f8
	fmovdneg	%xcc,	%f19,	%f28
	bgu,a	loop_1471
loop_1470:
	brz,a	%o7,	loop_1472
	fcmpne32	%f18,	%f6,	%g4
	movrgez	%o3,	0x009,	%o4
loop_1471:
	sub	%l5,	0x140B,	%g1
loop_1472:
	fnors	%f15,	%f27,	%f25
	movgu	%icc,	%g5,	%l4
	orcc	%g6,	%i2,	%i4
	alignaddrl	%o6,	%l0,	%i5
	movn	%xcc,	%o2,	%o1
	edge8	%l2,	%l6,	%i6
	ldub	[%l7 + 0x4F],	%i0
	taddcc	%o5,	0x026E,	%o0
	ldub	[%l7 + 0x72],	%i3
	fmovrslz	%i1,	%f21,	%f11
	edge32n	%l3,	%i7,	%g2
	tsubcctv	%g3,	%g7,	%l1
	edge16l	%g4,	%o7,	%o3
	bn	loop_1473
	fblg	%fcc3,	loop_1474
	ta	%xcc,	0x0
	be,a,pt	%icc,	loop_1475
loop_1473:
	movrgez	%o4,	%g1,	%l5
loop_1474:
	fandnot2	%f28,	%f8,	%f26
	fpadd32	%f2,	%f14,	%f20
loop_1475:
	xorcc	%l4,	0x1ADD,	%g5
	fandnot2	%f12,	%f22,	%f26
	movvs	%xcc,	%g6,	%i4
	tne	%icc,	0x3
	sethi	0x04FC,	%o6
	fmovspos	%xcc,	%f23,	%f13
	movneg	%xcc,	%l0,	%i2
	fpsub16s	%f0,	%f9,	%f28
	xorcc	%i5,	0x073E,	%o1
	brlez,a	%l2,	loop_1476
	tvs	%xcc,	0x0
	sethi	0x11F9,	%o2
	fbule	%fcc2,	loop_1477
loop_1476:
	bneg,a	loop_1478
	and	%l6,	0x0492,	%i0
	addc	%o5,	%o0,	%i3
loop_1477:
	fbn	%fcc1,	loop_1479
loop_1478:
	movpos	%xcc,	%i6,	%i1
	fmovdcs	%xcc,	%f10,	%f20
	faligndata	%f22,	%f4,	%f22
loop_1479:
	fmovsleu	%xcc,	%f10,	%f2
	sdiv	%i7,	0x0584,	%l3
	movl	%xcc,	%g3,	%g2
	orcc	%l1,	0x16C2,	%g7
	movne	%icc,	%o7,	%o3
	movge	%xcc,	%g4,	%o4
	andn	%l5,	%g1,	%g5
	set	0x50, %l4
	lduwa	[%l7 + %l4] 0x10,	%g6
	ldd	[%l7 + 0x68],	%l4
	orcc	%i4,	0x012E,	%l0
	tl	%icc,	0x3
	popc	%o6,	%i5
	lduw	[%l7 + 0x30],	%i2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	tneg	%icc,	0x7
	edge8n	%o2,	%l2,	%l6
	edge8l	%o5,	%i0,	%i3
	fbu	%fcc1,	loop_1480
	smulcc	%i6,	0x0C35,	%i1
	mova	%icc,	%o0,	%i7
	edge32ln	%l3,	%g3,	%l1
loop_1480:
	nop
	set	0x2D, %i4
	lduba	[%l7 + %i4] 0x10,	%g2
	array32	%g7,	%o7,	%g4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o3
	fpackfix	%f16,	%f23
	addcc	%l5,	%g1,	%g5
	fbul	%fcc0,	loop_1481
	edge32n	%g6,	%l4,	%i4
	movvc	%xcc,	%o4,	%o6
	fbn,a	%fcc3,	loop_1482
loop_1481:
	fmovdle	%xcc,	%f4,	%f14
	tgu	%xcc,	0x7
	fcmpes	%fcc1,	%f9,	%f21
loop_1482:
	tle	%icc,	0x0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l0,	%i5
	umulcc	%i2,	0x1006,	%o1
	fmovsneg	%xcc,	%f3,	%f31
	nop
	set	0x30, %i7
	ldx	[%l7 + %i7],	%o2
	tvs	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	stba	%l6,	[%l7 + 0x5D] %asi
	set	0x1a8, %g2
	nop 	! 	stxa	%l2,	[%g0 + %g2] 0x40 ripped by fixASI40.pl
	movl	%xcc,	%o5,	%i3
	taddcctv	%i0,	%i6,	%o0
	array8	%i7,	%i1,	%l3
	fmovdcc	%icc,	%f24,	%f29
	fbl	%fcc1,	loop_1483
	fcmpgt16	%f18,	%f10,	%g3
	mova	%icc,	%l1,	%g7
	fmovdcc	%icc,	%f5,	%f13
loop_1483:
	movrgez	%g2,	0x213,	%g4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o7,	%o3
	sdivcc	%l5,	0x0933,	%g5
	fpsub16	%f4,	%f14,	%f2
	fbg	%fcc0,	loop_1484
	movrgez	%g1,	0x0DD,	%g6
	tne	%xcc,	0x1
	move	%xcc,	%l4,	%o4
loop_1484:
	fmovrse	%o6,	%f13,	%f27
	tl	%xcc,	0x0
	call	loop_1485
	fmovdvs	%xcc,	%f5,	%f25
	and	%l0,	0x092F,	%i4
	set	0x2D, %o5
	ldsba	[%l7 + %o5] 0x80,	%i5
loop_1485:
	edge16	%i2,	%o1,	%l6
	fmovscc	%icc,	%f18,	%f29
	tvc	%xcc,	0x2
	subc	%l2,	%o5,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f31,	%f25
	fmovrsne	%o2,	%f11,	%f15
	tg	%xcc,	0x4
	movcs	%xcc,	%i6,	%i0
	brnz	%i7,	loop_1486
	xnorcc	%o0,	0x0B14,	%i1
	fmovdleu	%icc,	%f20,	%f15
	popc	%g3,	%l3
loop_1486:
	movrlz	%g7,	0x15B,	%l1
	bvc,pn	%xcc,	loop_1487
	nop
	setx loop_1488, %l0, %l1
	jmpl %l1, %g2
	bgu	loop_1489
	fmovde	%xcc,	%f6,	%f21
loop_1487:
	brnz	%g4,	loop_1490
loop_1488:
	array32	%o3,	%o7,	%l5
loop_1489:
	fabss	%f12,	%f8
	stbar
loop_1490:
	fcmpne32	%f24,	%f12,	%g1
	or	%g6,	%g5,	%o4
	umul	%l4,	%l0,	%i4
	orn	%i5,	0x0842,	%i2
	udiv	%o6,	0x0F3D,	%o1
	movrlz	%l6,	0x3E3,	%o5
	fmovrse	%l2,	%f1,	%f13
	tvc	%icc,	0x2
	movrlz	%o2,	%i6,	%i3
	edge32	%i0,	%o0,	%i7
	sir	0x145D
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x0C] %asi,	%g3
	fandnot2s	%f17,	%f25,	%f24
	movgu	%xcc,	%l3,	%i1
	fbn	%fcc2,	loop_1491
	movrne	%l1,	0x070,	%g7
	edge16ln	%g4,	%o3,	%g2
	tn	%xcc,	0x4
loop_1491:
	ldub	[%l7 + 0x6E],	%o7
	fmovdgu	%icc,	%f11,	%f20
	fbl	%fcc2,	loop_1492
	srl	%g1,	0x13,	%l5
	movne	%icc,	%g5,	%o4
	wr	%g0,	0x5f,	%asi
	stxa	%g6,	[%g0 + 0x0] %asi
loop_1492:
	membar	0x15
	array8	%l4,	%i4,	%i5
	fmovdvs	%xcc,	%f23,	%f3
	edge16n	%l0,	%o6,	%i2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o1
	movle	%xcc,	%o5,	%l6
	siam	0x2
	edge32n	%o2,	%l2,	%i6
	sth	%i0,	[%l7 + 0x42]
	fandnot1	%f18,	%f12,	%f18
	xnorcc	%i3,	0x014E,	%i7
	fmovrde	%o0,	%f16,	%f10
	set	0x5A, %o0
	ldsha	[%l7 + %o0] 0x14,	%g3
	move	%xcc,	%l3,	%l1
	ldx	[%l7 + 0x78],	%g7
	movg	%xcc,	%g4,	%i1
	edge16ln	%o3,	%o7,	%g2
	edge32l	%l5,	%g1,	%o4
	ldstub	[%l7 + 0x54],	%g5
	tg	%xcc,	0x6
	tsubcc	%l4,	0x0514,	%i4
	tge	%xcc,	0x5
	set	0x40, %i3
	stwa	%g6,	[%l7 + %i3] 0x81
	movl	%icc,	%i5,	%l0
	sethi	0x12F9,	%i2
	popc	%o1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x40],	 0x0
	orn	%l6,	%o5,	%l2
	subcc	%i6,	0x1E3B,	%i0
	movre	%o2,	%i3,	%o0
	fbu,a	%fcc0,	loop_1493
	smulcc	%i7,	%g3,	%l3
	andncc	%l1,	%g7,	%i1
	fmovdvs	%xcc,	%f17,	%f31
loop_1493:
	st	%f16,	[%l7 + 0x10]
	xorcc	%g4,	%o3,	%g2
	bvc	%xcc,	loop_1494
	ba,a	%icc,	loop_1495
	membar	0x4F
	subccc	%o7,	0x15E4,	%l5
loop_1494:
	popc	%o4,	%g1
loop_1495:
	fmuld8sux16	%f8,	%f5,	%f4
	fmuld8ulx16	%f12,	%f16,	%f18
	bge,a,pt	%icc,	loop_1496
	bvs,a,pt	%xcc,	loop_1497
	fmovdl	%xcc,	%f31,	%f5
	alignaddr	%g5,	%l4,	%i4
loop_1496:
	umulcc	%g6,	0x15B5,	%i5
loop_1497:
	fcmps	%fcc3,	%f9,	%f8
	nop
	setx	loop_1498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	membar	0x64
	bn,a	%icc,	loop_1499
	tl	%xcc,	0x1
loop_1498:
	xor	%l0,	0x0115,	%o1
	move	%icc,	%o6,	%l6
loop_1499:
	subccc	%i2,	0x102E,	%l2
	andcc	%o5,	%i6,	%o2
	edge32n	%i3,	%o0,	%i0
	bpos,a	loop_1500
	fors	%f24,	%f28,	%f4
	edge16ln	%i7,	%g3,	%l3
	sra	%g7,	0x0E,	%l1
loop_1500:
	sth	%i1,	[%l7 + 0x0A]
	movge	%xcc,	%g4,	%g2
	fbu	%fcc1,	loop_1501
	udivcc	%o3,	0x0238,	%o7
	sth	%o4,	[%l7 + 0x2E]
	set	0x78, %g7
	stxa	%l5,	[%l7 + %g7] 0x22
	membar	#Sync
loop_1501:
	fmovdleu	%icc,	%f18,	%f20
	andncc	%g5,	%g1,	%i4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l4
	movre	%g6,	%l0,	%o1
	xnorcc	%o6,	%l6,	%i2
	orn	%l2,	%i5,	%i6
	movvc	%icc,	%o2,	%i3
	fmul8x16	%f15,	%f18,	%f30
	tle	%xcc,	0x3
	subcc	%o0,	0x1C02,	%i0
	bvs,a,pt	%xcc,	loop_1502
	movrlz	%o5,	%g3,	%i7
	movne	%xcc,	%g7,	%l1
	bvs,a,pn	%icc,	loop_1503
loop_1502:
	tge	%icc,	0x6
	fbg	%fcc3,	loop_1504
	ldsw	[%l7 + 0x4C],	%i1
loop_1503:
	movre	%l3,	%g4,	%g2
	fmovdpos	%xcc,	%f11,	%f8
loop_1504:
	andcc	%o3,	0x0A0F,	%o7
	addcc	%l5,	%g5,	%o4
	brgez,a	%i4,	loop_1505
	udivx	%l4,	0x1FD5,	%g1
	edge32l	%g6,	%o1,	%l0
	addcc	%o6,	0x1C34,	%l6
loop_1505:
	xorcc	%l2,	%i2,	%i5
	movg	%xcc,	%o2,	%i3
	tle	%xcc,	0x7
	set	0x0D, %i0
	stba	%o0,	[%l7 + %i0] 0x22
	membar	#Sync
	bleu	%icc,	loop_1506
	fcmped	%fcc2,	%f10,	%f30
	popc	%i0,	%i6
	movle	%xcc,	%g3,	%i7
loop_1506:
	nop
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf1
	membar	#Sync
	fnor	%f8,	%f4,	%f18
	siam	0x0
	nop
	setx	loop_1507,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue	%fcc1,	loop_1508
	nop
	set	0x68, %l1
	ldstub	[%l7 + %l1],	%g7
	movneg	%xcc,	%o5,	%i1
loop_1507:
	nop
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f16
loop_1508:
	sth	%l3,	[%l7 + 0x3C]
	udivx	%g4,	0x0A67,	%g2
	mova	%xcc,	%l1,	%o7
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x10,	 0x1
	taddcctv	%g5,	0x1E7D,	%o4
	movrlez	%l5,	0x043,	%l4
	udivx	%i4,	0x01B7,	%g6
	edge16n	%g1,	%o1,	%o6
	sth	%l6,	[%l7 + 0x3E]
	ta	%icc,	0x0
	fnegd	%f20,	%f16
	tle	%icc,	0x2
	movrne	%l0,	0x09D,	%i2
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x18] %asi,	%i5
	tneg	%xcc,	0x5
	ldx	[%l7 + 0x10],	%l2
	fcmpes	%fcc1,	%f18,	%f17
	fbne,a	%fcc0,	loop_1509
	edge8	%i3,	%o2,	%i0
	fxnors	%f22,	%f23,	%f6
	sdivx	%i6,	0x11EF,	%o0
loop_1509:
	mulscc	%g3,	0x157A,	%i7
	array32	%g7,	%o5,	%l3
	movl	%icc,	%i1,	%g2
	sra	%l1,	0x1F,	%o7
	fbl,a	%fcc3,	loop_1510
	fmovdge	%xcc,	%f6,	%f7
	fmovde	%xcc,	%f19,	%f29
	fnot1	%f28,	%f14
loop_1510:
	nop
	set	0x48, %l3
	stha	%o3,	[%l7 + %l3] 0x80
	fmovdvc	%xcc,	%f20,	%f8
	tleu	%xcc,	0x0
	edge8	%g4,	%g5,	%o4
	fcmps	%fcc3,	%f19,	%f29
	bvs,a,pn	%icc,	loop_1511
	move	%icc,	%l4,	%l5
	fcmpes	%fcc1,	%f27,	%f6
	xnor	%g6,	0x0CCE,	%g1
loop_1511:
	ldstub	[%l7 + 0x4C],	%i4
	sll	%o6,	%o1,	%l6
	fone	%f2
	fblg,a	%fcc3,	loop_1512
	bleu	%xcc,	loop_1513
	stbar
	sdivx	%i2,	0x12DA,	%i5
loop_1512:
	andn	%l0,	%l2,	%o2
loop_1513:
	bcc,pt	%icc,	loop_1514
	subcc	%i0,	%i6,	%o0
	smulcc	%i3,	0x199C,	%i7
	addc	%g3,	0x0461,	%g7
loop_1514:
	array32	%l3,	%o5,	%g2
	edge16l	%l1,	%i1,	%o3
	sdivx	%o7,	0x02D3,	%g4
	std	%o4,	[%l7 + 0x18]
	bvc	loop_1515
	fzeros	%f14
	andn	%l4,	%g5,	%g6
	movpos	%icc,	%l5,	%i4
loop_1515:
	nop
	wr	%g0,	0x10,	%asi
	stba	%o6,	[%l7 + 0x7A] %asi
	mulscc	%g1,	0x0F16,	%l6
	alignaddrl	%i2,	%o1,	%l0
	fmovrsne	%l2,	%f10,	%f3
	edge8	%i5,	%i0,	%i6
	orcc	%o2,	%o0,	%i7
	ldd	[%l7 + 0x40],	%g2
	edge32l	%i3,	%g7,	%o5
	fmul8ulx16	%f12,	%f4,	%f24
	xnorcc	%g2,	%l3,	%i1
	movgu	%icc,	%l1,	%o3
	movrlz	%g4,	%o7,	%l4
	alignaddrl	%g5,	%o4,	%g6
	bcs	loop_1516
	fsrc1s	%f25,	%f5
	bne	%xcc,	loop_1517
	fnors	%f6,	%f6,	%f30
loop_1516:
	ldx	[%l7 + 0x08],	%i4
	popc	0x0394,	%o6
loop_1517:
	taddcctv	%l5,	%g1,	%l6
	be,a	%xcc,	loop_1518
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o1,	%i2,	%l2
	edge32	%i5,	%l0,	%i0
loop_1518:
	array32	%o2,	%i6,	%i7
	xorcc	%g3,	0x0BB5,	%o0
	andncc	%g7,	%i3,	%o5
	smulcc	%l3,	%i1,	%g2
	movneg	%icc,	%l1,	%o3
	movrgez	%g4,	0x054,	%o7
	movg	%xcc,	%l4,	%o4
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x14,	%g4
	tge	%xcc,	0x0
	fmuld8ulx16	%f27,	%f17,	%f2
	stb	%i4,	[%l7 + 0x16]
	fbue	%fcc1,	loop_1519
	bneg,pt	%xcc,	loop_1520
	fpadd32	%f10,	%f22,	%f2
	orn	%g6,	%l5,	%o6
loop_1519:
	movcc	%icc,	%l6,	%o1
loop_1520:
	bn,a	loop_1521
	nop
	setx loop_1522, %l0, %l1
	jmpl %l1, %g1
	bvc,a,pn	%icc,	loop_1523
	sethi	0x19E0,	%l2
loop_1521:
	subcc	%i5,	%i2,	%i0
loop_1522:
	fmovspos	%icc,	%f17,	%f30
loop_1523:
	fxor	%f6,	%f14,	%f20
	srlx	%o2,	%l0,	%i6
	tsubcc	%i7,	0x050E,	%o0
	membar	0x3D
	xnorcc	%g3,	0x0AD6,	%i3
	fmovd	%f0,	%f16
	edge8l	%g7,	%l3,	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%o5
	brnz	%o3,	loop_1524
	fbul,a	%fcc2,	loop_1525
	movg	%xcc,	%g4,	%o7
	alignaddr	%l4,	%l1,	%o4
loop_1524:
	fmovrsgez	%i4,	%f21,	%f24
loop_1525:
	xor	%g6,	%g5,	%l5
	fsrc1s	%f21,	%f15
	array8	%l6,	%o6,	%g1
	movle	%icc,	%o1,	%i5
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x0c,	%f0
	tneg	%icc,	0x7
	bg,a,pn	%xcc,	loop_1526
	edge32n	%l2,	%i2,	%o2
	fbuge	%fcc1,	loop_1527
	udivx	%l0,	0x1498,	%i6
loop_1526:
	xor	%i7,	%i0,	%o0
	mulx	%i3,	0x0DF6,	%g7
loop_1527:
	orcc	%g3,	%l3,	%g2
	fmovse	%xcc,	%f21,	%f31
	array8	%i1,	%o3,	%g4
	st	%f29,	[%l7 + 0x50]
	movgu	%xcc,	%o5,	%l4
	addccc	%l1,	%o7,	%i4
	te	%icc,	0x3
	srax	%g6,	%o4,	%g5
	sdiv	%l6,	0x0F0C,	%l5
	andcc	%o6,	0x181D,	%g1
	membar	0x1B
	fmovdn	%xcc,	%f15,	%f21
	fmovdvs	%icc,	%f6,	%f27
	alignaddrl	%i5,	%o1,	%i2
	movrne	%l2,	%o2,	%l0
	fcmpne32	%f12,	%f24,	%i7
	subccc	%i0,	0x1E18,	%o0
	tn	%xcc,	0x6
	movne	%xcc,	%i6,	%i3
	faligndata	%f0,	%f22,	%f10
	movrgz	%g3,	0x05C,	%l3
	fmul8x16al	%f3,	%f4,	%f24
	movne	%icc,	%g7,	%g2
	edge8ln	%i1,	%o3,	%g4
	edge8ln	%l4,	%o5,	%l1
	udivx	%i4,	0x1533,	%g6
	fmul8x16au	%f9,	%f22,	%f28
	tcs	%icc,	0x4
	movcc	%icc,	%o4,	%g5
	tg	%icc,	0x2
	orcc	%o7,	0x10F5,	%l5
	bvc,pn	%icc,	loop_1528
	fbul,a	%fcc2,	loop_1529
	subccc	%l6,	0x0090,	%g1
	array16	%i5,	%o1,	%i2
loop_1528:
	fmovdleu	%xcc,	%f12,	%f7
loop_1529:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x1
	lduw	[%l7 + 0x5C],	%l2
	xor	%o2,	0x1D2F,	%l0
	fbug,a	%fcc2,	loop_1530
	stw	%i7,	[%l7 + 0x70]
	fmovdleu	%xcc,	%f21,	%f28
	fmovda	%icc,	%f14,	%f25
loop_1530:
	andn	%i0,	0x1739,	%o0
	or	%i6,	0x1472,	%i3
	subc	%o6,	%l3,	%g3
	fmovdl	%xcc,	%f25,	%f17
	movne	%icc,	%g2,	%i1
	bgu	%xcc,	loop_1531
	and	%g7,	%o3,	%l4
	edge16l	%o5,	%l1,	%g4
	fsrc2s	%f29,	%f12
loop_1531:
	edge16	%g6,	%i4,	%g5
	edge8ln	%o4,	%l5,	%o7
	movrne	%l6,	0x1FC,	%g1
	movne	%icc,	%i5,	%i2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%l2
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	ble	loop_1532
	edge32l	%o2,	%i7,	%i0
	fmovscs	%icc,	%f25,	%f15
	fcmpne32	%f12,	%f10,	%o0
loop_1532:
	nop
	set	0x10, %i6
	prefetcha	[%l7 + %i6] 0x11,	 0x1
	fbo,a	%fcc1,	loop_1533
	orncc	%i6,	0x0F23,	%o6
	tvc	%xcc,	0x6
	fpack16	%f16,	%f0
loop_1533:
	fbul,a	%fcc1,	loop_1534
	fnors	%f19,	%f0,	%f19
	fsrc2	%f24,	%f8
	fandnot2	%f28,	%f26,	%f30
loop_1534:
	fmul8x16	%f22,	%f16,	%f8
	edge8n	%i3,	%l3,	%g2
	or	%i1,	0x0160,	%g7
	edge16l	%g3,	%l4,	%o3
	fbule	%fcc3,	loop_1535
	movne	%xcc,	%l1,	%o5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g6
loop_1535:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x57] %asi,	%g4
	bgu	loop_1536
	edge16l	%i4,	%o4,	%g5
	udivx	%l5,	0x1B69,	%o7
	movrne	%g1,	%l6,	%i5
loop_1536:
	fnand	%f6,	%f28,	%f14
	mova	%icc,	%i2,	%l2
	fbue	%fcc1,	loop_1537
	fbo	%fcc0,	loop_1538
	subccc	%o1,	%i7,	%o2
	fbo	%fcc3,	loop_1539
loop_1537:
	fabss	%f23,	%f20
loop_1538:
	fmovsleu	%icc,	%f24,	%f10
	fandnot1s	%f13,	%f26,	%f25
loop_1539:
	srax	%i0,	%l0,	%o0
	tleu	%icc,	0x1
	movge	%xcc,	%i6,	%o6
	movle	%xcc,	%i3,	%l3
	taddcctv	%i1,	0x1893,	%g7
	movcs	%icc,	%g3,	%l4
	subc	%o3,	%l1,	%g2
	tne	%xcc,	0x0
	set	0x38, %i1
	stda	%g6,	[%l7 + %i1] 0x0c
	movpos	%icc,	%g4,	%o5
	smulcc	%i4,	%o4,	%g5
	fbne	%fcc0,	loop_1540
	array16	%o7,	%l5,	%l6
	ta	%icc,	0x5
	xnor	%g1,	0x0772,	%i2
loop_1540:
	edge16n	%l2,	%i5,	%o1
	nop
	set	0x22, %o4
	sth	%i7,	[%l7 + %o4]
	set	0x34, %o2
	stwa	%i0,	[%l7 + %o2] 0xe3
	membar	#Sync
	be,a	loop_1541
	move	%xcc,	%o2,	%o0
	fcmpgt16	%f18,	%f4,	%l0
	fbuge	%fcc1,	loop_1542
loop_1541:
	udivx	%i6,	0x015A,	%o6
	fmovdneg	%icc,	%f19,	%f7
	orncc	%l3,	0x18DA,	%i3
loop_1542:
	nop
	set	0x50, %i5
	ldsha	[%l7 + %i5] 0x18,	%i1
	fmovda	%icc,	%f31,	%f12
	bneg,a	%icc,	loop_1543
	or	%g3,	%g7,	%o3
	umulcc	%l1,	0x13A8,	%l4
	sllx	%g2,	%g6,	%g4
loop_1543:
	fpsub16s	%f19,	%f12,	%f18
	andn	%o5,	%i4,	%g5
	alignaddr	%o7,	%l5,	%l6
	bge,pt	%xcc,	loop_1544
	fbul,a	%fcc2,	loop_1545
	fmovd	%f16,	%f30
	brlez,a	%o4,	loop_1546
loop_1544:
	subc	%g1,	%l2,	%i2
loop_1545:
	orn	%i5,	%i7,	%i0
	tneg	%icc,	0x6
loop_1546:
	movrgz	%o1,	0x16B,	%o0
	ld	[%l7 + 0x28],	%f2
	fpadd32	%f16,	%f8,	%f4
	andncc	%o2,	%i6,	%o6
	bleu,pn	%icc,	loop_1547
	ba,pt	%xcc,	loop_1548
	movrlez	%l3,	0x130,	%i3
	orcc	%i1,	%g3,	%g7
loop_1547:
	tpos	%icc,	0x5
loop_1548:
	mulx	%l0,	0x044F,	%o3
	fpadd16	%f2,	%f26,	%f14
	fmovdge	%xcc,	%f20,	%f13
	udivcc	%l4,	0x135E,	%g2
	st	%f3,	[%l7 + 0x6C]
	movl	%icc,	%l1,	%g6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g4
	tcs	%icc,	0x4
	tleu	%icc,	0x3
	fcmpes	%fcc1,	%f9,	%f30
	fmovrsgez	%o5,	%f23,	%f18
	sir	0x1536
	smulcc	%g5,	0x08BA,	%i4
	set	0x48, %g4
	stxa	%l5,	[%l7 + %g4] 0x14
	fbu	%fcc2,	loop_1549
	nop
	setx loop_1550, %l0, %l1
	jmpl %l1, %l6
	xorcc	%o4,	0x1403,	%g1
	edge16l	%o7,	%l2,	%i5
loop_1549:
	xor	%i7,	0x140D,	%i0
loop_1550:
	edge8n	%o1,	%o0,	%i2
	sllx	%i6,	0x03,	%o6
	faligndata	%f18,	%f6,	%f30
	brlez	%o2,	loop_1551
	fandnot2s	%f21,	%f30,	%f23
	movvc	%xcc,	%i3,	%l3
	nop
	setx loop_1552, %l0, %l1
	jmpl %l1, %g3
loop_1551:
	sllx	%g7,	%i1,	%o3
	stx	%l0,	[%l7 + 0x18]
	ba	%xcc,	loop_1553
loop_1552:
	alignaddr	%l4,	%g2,	%l1
	fone	%f26
	lduw	[%l7 + 0x58],	%g4
loop_1553:
	movle	%xcc,	%g6,	%o5
	set	0x38, %o3
	ldswa	[%l7 + %o3] 0x04,	%g5
	edge8n	%l5,	%i4,	%l6
	or	%o4,	0x0B92,	%o7
	fmul8sux16	%f10,	%f2,	%f14
	fmovsne	%xcc,	%f23,	%f27
	fmovrse	%l2,	%f14,	%f27
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%i7
	mulscc	%g1,	%i0,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i6
	subc	%i2,	%o6,	%o2
	ldd	[%l7 + 0x20],	%f18
	taddcc	%i3,	%l3,	%g3
	sdivcc	%g7,	0x0CB8,	%i1
	fmovrslez	%l0,	%f13,	%f3
	edge8ln	%o3,	%g2,	%l4
	taddcctv	%g4,	0x1E53,	%l1
	udivx	%g6,	0x07EE,	%g5
	srl	%o5,	%i4,	%l5
	tvc	%icc,	0x1
	fmovscs	%xcc,	%f28,	%f31
	brgz	%l6,	loop_1554
	edge32l	%o7,	%l2,	%i5
	set	0x34, %g3
	stha	%i7,	[%l7 + %g3] 0x2f
	membar	#Sync
loop_1554:
	smulcc	%o4,	%g1,	%o0
	movvc	%icc,	%i0,	%o1
	tcs	%xcc,	0x3
	tg	%icc,	0x2
	movrgez	%i2,	0x114,	%i6
	fbue,a	%fcc2,	loop_1555
	fzeros	%f17
	or	%o2,	%i3,	%l3
	fabsd	%f28,	%f6
loop_1555:
	mulscc	%g3,	0x00BC,	%o6
	fmul8x16	%f15,	%f16,	%f30
	subccc	%i1,	0x1EF6,	%l0
	brnz	%g7,	loop_1556
	movrlez	%o3,	%g2,	%l4
	movrgez	%g4,	0x13E,	%l1
	bvc,a	loop_1557
loop_1556:
	movne	%icc,	%g5,	%o5
	sll	%g6,	0x15,	%l5
	udiv	%l6,	0x10DB,	%i4
loop_1557:
	fabss	%f24,	%f11
	stb	%o7,	[%l7 + 0x6B]
	tl	%icc,	0x6
	srlx	%i5,	%i7,	%l2
	movl	%icc,	%g1,	%o0
	edge32	%o4,	%o1,	%i0
	tcc	%xcc,	0x6
	udivcc	%i2,	0x10F2,	%o2
	subcc	%i3,	%i6,	%g3
	tsubcctv	%o6,	%i1,	%l0
	movvs	%icc,	%l3,	%o3
	lduw	[%l7 + 0x08],	%g7
	xnorcc	%l4,	0x0E5A,	%g4
	mulx	%g2,	%l1,	%o5
	tsubcc	%g5,	0x03B4,	%l5
	array16	%l6,	%g6,	%i4
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%i5
	alignaddrl	%o7,	%l2,	%g1
	bl,a	loop_1558
	ld	[%l7 + 0x54],	%f20
	addc	%i7,	%o4,	%o1
	bpos	%icc,	loop_1559
loop_1558:
	tgu	%xcc,	0x3
	edge32ln	%i0,	%o0,	%i2
	lduh	[%l7 + 0x6A],	%i3
loop_1559:
	fblg,a	%fcc1,	loop_1560
	srlx	%o2,	0x0A,	%i6
	fnors	%f29,	%f31,	%f26
	fcmple16	%f14,	%f22,	%g3
loop_1560:
	te	%xcc,	0x0
	edge8n	%o6,	%i1,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o3
	movrne	%l3,	%g7,	%g4
	fmovsneg	%icc,	%f12,	%f8
	movrlz	%g2,	0x2EC,	%l1
	srl	%o5,	%g5,	%l4
	xor	%l5,	0x0247,	%g6
	movg	%xcc,	%i4,	%i5
	mova	%xcc,	%l6,	%o7
	sethi	0x0CDA,	%g1
	set	0x54, %l0
	ldsha	[%l7 + %l0] 0x14,	%i7
	fmovscc	%xcc,	%f20,	%f7
	bn,pt	%icc,	loop_1561
	brgz	%l2,	loop_1562
	tcs	%xcc,	0x4
	flush	%l7 + 0x18
loop_1561:
	tpos	%xcc,	0x1
loop_1562:
	membar	0x7C
	siam	0x6
	fnegs	%f19,	%f3
	brlz	%o1,	loop_1563
	andcc	%i0,	%o0,	%i2
	movgu	%xcc,	%i3,	%o4
	xnor	%o2,	0x0B87,	%g3
loop_1563:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i6,	%i1
	subc	%o6,	0x1404,	%l0
	popc	0x0939,	%o3
	sth	%l3,	[%l7 + 0x68]
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g4
	movre	%g2,	%g7,	%l1
	array16	%g5,	%o5,	%l5
	fmovdvs	%xcc,	%f29,	%f11
	tcc	%xcc,	0x5
	wr	%g0,	0x27,	%asi
	stba	%l4,	[%l7 + 0x49] %asi
	membar	#Sync
	movrgz	%i4,	%i5,	%g6
	umul	%o7,	0x0421,	%g1
	faligndata	%f30,	%f2,	%f0
	prefetch	[%l7 + 0x48],	 0x0
	xor	%l6,	%i7,	%l2
	movge	%icc,	%i0,	%o1
	fxnor	%f6,	%f18,	%f18
	movvc	%xcc,	%i2,	%i3
	andncc	%o0,	%o4,	%g3
	fbne	%fcc0,	loop_1564
	andncc	%o2,	%i1,	%i6
	fmovsgu	%icc,	%f10,	%f4
	bneg,a	loop_1565
loop_1564:
	fnot2	%f10,	%f8
	sra	%l0,	%o6,	%o3
	fmovda	%xcc,	%f24,	%f23
loop_1565:
	std	%l2,	[%l7 + 0x50]
	sethi	0x0748,	%g4
	sir	0x1386
	sdivcc	%g2,	0x10E7,	%l1
	tsubcc	%g7,	0x0425,	%g5
	sub	%l5,	%o5,	%l4
	sth	%i5,	[%l7 + 0x76]
	orncc	%g6,	%i4,	%o7
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	array32	%l6,	%i7,	%l2
	sdivx	%g1,	0x0CA1,	%o1
	fands	%f31,	%f13,	%f18
	stx	%i2,	[%l7 + 0x58]
	umulcc	%i3,	%o0,	%o4
	subccc	%i0,	%o2,	%i1
	sdiv	%i6,	0x1EC9,	%g3
	set	0x62, %g5
	ldsha	[%l7 + %g5] 0x14,	%o6
	fbo,a	%fcc3,	loop_1566
	orncc	%l0,	%l3,	%o3
	tn	%icc,	0x7
	sir	0x09DE
loop_1566:
	movleu	%icc,	%g4,	%g2
	movrlz	%g7,	%l1,	%g5
	tcc	%icc,	0x0
	orncc	%l5,	%o5,	%i5
	movrgez	%l4,	0x3DE,	%i4
	fxors	%f17,	%f25,	%f24
	fexpand	%f26,	%f28
	fsrc2	%f20,	%f2
	fmul8sux16	%f6,	%f6,	%f26
	srlx	%g6,	%l6,	%i7
	ldx	[%l7 + 0x38],	%o7
	fmovdg	%icc,	%f16,	%f5
	fmovdne	%xcc,	%f23,	%f22
	tsubcc	%g1,	0x1955,	%o1
	fnot1s	%f11,	%f26
	fzero	%f22
	fcmpeq32	%f28,	%f22,	%i2
	ta	%icc,	0x3
	movn	%icc,	%l2,	%o0
	stw	%i3,	[%l7 + 0x70]
	alignaddr	%o4,	%o2,	%i0
	fbu	%fcc1,	loop_1567
	movcs	%icc,	%i6,	%g3
	addcc	%o6,	%l0,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1567:
	ble,pt	%xcc,	loop_1568
	bshuffle	%f2,	%f4,	%f8
	array16	%o3,	%g4,	%i1
	subcc	%g7,	%l1,	%g5
loop_1568:
	and	%g2,	0x092F,	%l5
	fpadd16s	%f3,	%f3,	%f31
	bpos,pt	%xcc,	loop_1569
	sdiv	%i5,	0x1EF1,	%o5
	or	%i4,	0x15D1,	%g6
	tl	%xcc,	0x0
loop_1569:
	tpos	%icc,	0x1
	array16	%l4,	%i7,	%o7
	srlx	%l6,	%g1,	%o1
	move	%xcc,	%i2,	%o0
	call	loop_1570
	fbu	%fcc2,	loop_1571
	edge8ln	%l2,	%i3,	%o2
	set	0x5E, %l5
	stha	%o4,	[%l7 + %l5] 0x11
loop_1570:
	orn	%i0,	0x0B0D,	%i6
loop_1571:
	fmovsgu	%xcc,	%f2,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o6,	0x09,	%l0
	fcmpd	%fcc1,	%f28,	%f24
	tcs	%icc,	0x3
	ta	%icc,	0x5
	nop
	set	0x62, %g6
	ldstub	[%l7 + %g6],	%g3
	call	loop_1572
	be	loop_1573
	andncc	%o3,	%g4,	%l3
	stw	%i1,	[%l7 + 0x34]
loop_1572:
	fbul,a	%fcc2,	loop_1574
loop_1573:
	addc	%g7,	0x14D5,	%g5
	membar	0x28
	xnorcc	%l1,	0x114F,	%l5
loop_1574:
	alignaddr	%g2,	%i5,	%o5
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f30
	move	%icc,	%g6,	%l4
	fcmple32	%f28,	%f26,	%i4
	tl	%icc,	0x6
	movrgez	%o7,	%l6,	%i7
	stx	%g1,	[%l7 + 0x48]
	membar	0x22
	nop
	setx	loop_1575,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%o1,	0x03B7,	%o0
	fabss	%f28,	%f3
	fsrc2s	%f18,	%f22
loop_1575:
	edge8n	%l2,	%i3,	%o2
	sth	%o4,	[%l7 + 0x68]
	pdist	%f18,	%f8,	%f8
	fandnot2s	%f3,	%f9,	%f23
	fmovspos	%icc,	%f5,	%f10
	fbue,a	%fcc0,	loop_1576
	fmovdn	%xcc,	%f4,	%f1
	fpsub32s	%f27,	%f6,	%f17
	movrne	%i0,	0x038,	%i6
loop_1576:
	tl	%icc,	0x5
	xnor	%o6,	0x1935,	%l0
	bl,a	loop_1577
	sra	%g3,	%o3,	%i2
	sra	%l3,	%g4,	%i1
	movle	%xcc,	%g7,	%g5
loop_1577:
	nop
	set	0x42, %i4
	ldsha	[%l7 + %i4] 0x15,	%l5
	bcc,a	%icc,	loop_1578
	fxor	%f16,	%f4,	%f24
	brgez	%l1,	loop_1579
	andcc	%g2,	%i5,	%o5
loop_1578:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%l4
loop_1579:
	edge8l	%g6,	%o7,	%i4
	fpadd16	%f26,	%f24,	%f28
	smul	%i7,	0x15FE,	%g1
	orn	%l6,	%o1,	%l2
	addcc	%i3,	%o0,	%o4
	fbu,a	%fcc0,	loop_1580
	fbue,a	%fcc1,	loop_1581
	fbge,a	%fcc2,	loop_1582
	xnorcc	%o2,	%i0,	%i6
loop_1580:
	taddcctv	%l0,	%o6,	%o3
loop_1581:
	array32	%i2,	%g3,	%l3
loop_1582:
	srax	%i1,	0x17,	%g7
	array16	%g4,	%g5,	%l5
	edge16l	%l1,	%g2,	%i5
	movgu	%xcc,	%o5,	%g6
	array32	%o7,	%l4,	%i4
	fmovscc	%xcc,	%f24,	%f16
	edge32	%g1,	%l6,	%i7
	movne	%xcc,	%o1,	%l2
	std	%f8,	[%l7 + 0x58]
	tsubcctv	%i3,	0x1BC4,	%o0
	ta	%xcc,	0x5
	nop
	setx loop_1583, %l0, %l1
	jmpl %l1, %o2
	sdivx	%i0,	0x0147,	%o4
	tge	%icc,	0x2
	udiv	%l0,	0x04D2,	%i6
loop_1583:
	sllx	%o6,	%i2,	%g3
	ldstub	[%l7 + 0x43],	%o3
	xnor	%i1,	0x15F6,	%g7
	fcmpgt16	%f2,	%f26,	%g4
	array8	%l3,	%g5,	%l1
	ldx	[%l7 + 0x58],	%g2
	brgz	%l5,	loop_1584
	fxnor	%f16,	%f16,	%f16
	movrlez	%i5,	0x0EB,	%o5
	bvs,a,pt	%icc,	loop_1585
loop_1584:
	fsrc2s	%f20,	%f31
	sdivx	%o7,	0x1185,	%g6
	fcmpgt16	%f6,	%f28,	%l4
loop_1585:
	mova	%xcc,	%i4,	%g1
	tsubcc	%l6,	0x0A26,	%i7
	alignaddr	%o1,	%l2,	%i3
	te	%icc,	0x4
	nop
	setx	loop_1586,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8l	%o0,	%o2,	%i0
	wr	%g0,	0x23,	%asi
	stha	%l0,	[%l7 + 0x2E] %asi
	membar	#Sync
loop_1586:
	fnand	%f14,	%f4,	%f8
	fbue	%fcc1,	loop_1587
	movrlz	%i6,	%o4,	%i2
	udiv	%g3,	0x01C3,	%o6
	fmul8sux16	%f30,	%f8,	%f0
loop_1587:
	movg	%xcc,	%o3,	%i1
	addcc	%g4,	%l3,	%g5
	tsubcc	%g7,	0x17AC,	%l1
	fpack16	%f16,	%f15
	ldx	[%l7 + 0x38],	%g2
	fpack16	%f24,	%f10
	bl,pt	%icc,	loop_1588
	fmovrse	%l5,	%f17,	%f13
	fmul8ulx16	%f10,	%f6,	%f10
	fpack32	%f30,	%f26,	%f26
loop_1588:
	fbl	%fcc0,	loop_1589
	tle	%xcc,	0x2
	fcmpeq16	%f16,	%f24,	%o5
	and	%o7,	%g6,	%l4
loop_1589:
	fcmpgt32	%f20,	%f6,	%i5
	bcc,pn	%xcc,	loop_1590
	lduw	[%l7 + 0x44],	%i4
	tgu	%icc,	0x4
	tl	%xcc,	0x0
loop_1590:
	xor	%g1,	0x01E9,	%l6
	xnor	%i7,	%l2,	%o1
	be,a,pt	%icc,	loop_1591
	fnot2	%f12,	%f20
	ldsh	[%l7 + 0x56],	%i3
	fbule	%fcc3,	loop_1592
loop_1591:
	fpmerge	%f29,	%f19,	%f26
	movpos	%icc,	%o0,	%o2
	te	%xcc,	0x4
loop_1592:
	fmovrsgez	%i0,	%f24,	%f2
	brnz	%l0,	loop_1593
	movrgz	%i6,	%o4,	%i2
	tle	%icc,	0x0
	fsrc2s	%f22,	%f12
loop_1593:
	mova	%icc,	%g3,	%o6
	fornot1s	%f24,	%f22,	%f17
	mulx	%o3,	%i1,	%g4
	udivcc	%g5,	0x0069,	%l3
	fxnors	%f9,	%f24,	%f7
	fzeros	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g7,	%l1,	%g2
	taddcc	%o5,	0x1D7B,	%o7
	nop
	setx loop_1594, %l0, %l1
	jmpl %l1, %g6
	sth	%l5,	[%l7 + 0x6C]
	andncc	%i5,	%l4,	%g1
	fmovsle	%xcc,	%f29,	%f9
loop_1594:
	fblg	%fcc1,	loop_1595
	tleu	%xcc,	0x7
	edge32	%l6,	%i4,	%l2
	nop
	set	0x30, %l4
	std	%f12,	[%l7 + %l4]
loop_1595:
	fmul8x16	%f8,	%f8,	%f22
	xnor	%i7,	0x0401,	%o1
	fpsub32	%f28,	%f14,	%f10
	edge16	%i3,	%o2,	%o0
	udivcc	%l0,	0x0FDE,	%i6
	tl	%icc,	0x0
	addccc	%i0,	%i2,	%g3
	mulx	%o6,	%o4,	%o3
	sllx	%g4,	0x11,	%i1
	fble,a	%fcc0,	loop_1596
	fpadd32	%f2,	%f18,	%f28
	tcc	%xcc,	0x7
	alignaddr	%l3,	%g5,	%l1
loop_1596:
	movle	%xcc,	%g7,	%g2
	ldd	[%l7 + 0x18],	%o6
	fnegs	%f18,	%f18
	and	%g6,	%l5,	%i5
	bge	loop_1597
	orcc	%o5,	0x0EAF,	%l4
	edge8	%g1,	%l6,	%l2
	edge16ln	%i7,	%i4,	%o1
loop_1597:
	sub	%o2,	%i3,	%o0
	move	%xcc,	%i6,	%i0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i2
	addc	%l0,	%g3,	%o4
	mulx	%o3,	0x1281,	%o6
	fcmple32	%f10,	%f20,	%i1
	or	%l3,	%g5,	%g4
	tl	%icc,	0x5
	set	0x38, %i7
	lduwa	[%l7 + %i7] 0x04,	%g7
	addcc	%g2,	0x0964,	%l1
	srlx	%g6,	0x0D,	%o7
	addcc	%l5,	%i5,	%o5
	array32	%l4,	%g1,	%l6
	fmovrsgez	%i7,	%f23,	%f24
	tvs	%xcc,	0x3
	fpsub16s	%f27,	%f25,	%f10
	srl	%i4,	0x09,	%o1
	tvs	%xcc,	0x7
	set	0x31, %o5
	stba	%l2,	[%l7 + %o5] 0x04
	mulx	%o2,	%o0,	%i3
	ldx	[%l7 + 0x10],	%i0
	andcc	%i6,	%i2,	%l0
	fmovsg	%xcc,	%f18,	%f27
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x30] %asi,	%g3
	fbo,a	%fcc0,	loop_1598
	movneg	%icc,	%o3,	%o4
	addcc	%i1,	%l3,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1598:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g4
	tl	%icc,	0x2
	tne	%xcc,	0x0
	ta	%icc,	0x3
	fmovrdne	%o6,	%f8,	%f24
	udivx	%g7,	0x1307,	%g2
	st	%f29,	[%l7 + 0x44]
	movcc	%icc,	%g6,	%l1
	lduw	[%l7 + 0x58],	%o7
	smul	%i5,	%l5,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x4
	tg	%xcc,	0x7
	movvs	%xcc,	%l4,	%g1
	srlx	%i7,	0x09,	%i4
	orn	%o1,	0x0BC5,	%l6
	bpos	%icc,	loop_1599
	mulscc	%o2,	%o0,	%l2
	prefetch	[%l7 + 0x64],	 0x3
	ba	%icc,	loop_1600
loop_1599:
	movle	%icc,	%i3,	%i0
	xnorcc	%i2,	0x0FC7,	%l0
	stw	%i6,	[%l7 + 0x14]
loop_1600:
	fnors	%f29,	%f16,	%f14
	fzero	%f24
	movn	%xcc,	%g3,	%o4
	taddcc	%i1,	0x15E4,	%l3
	fors	%f16,	%f15,	%f25
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf9
	membar	#Sync
	movpos	%xcc,	%o3,	%g5
	umul	%g4,	0x0A94,	%g7
	alignaddr	%g2,	%g6,	%o6
	be,a,pt	%icc,	loop_1601
	xnorcc	%l1,	%i5,	%o7
	alignaddr	%l5,	%o5,	%g1
	fsrc2s	%f20,	%f6
loop_1601:
	and	%l4,	0x0A14,	%i4
	fmovscs	%icc,	%f7,	%f7
	alignaddrl	%i7,	%l6,	%o2
	subccc	%o1,	%l2,	%o0
	addcc	%i0,	%i3,	%i2
	fmovde	%icc,	%f28,	%f12
	flush	%l7 + 0x20
	umulcc	%l0,	%g3,	%i6
	stbar
	te	%icc,	0x6
	tl	%icc,	0x5
	and	%o4,	0x0F42,	%l3
	movn	%xcc,	%i1,	%o3
	sdivx	%g5,	0x15CB,	%g7
	fmovse	%icc,	%f5,	%f5
	fcmps	%fcc3,	%f1,	%f5
	set	0x18, %o0
	swapa	[%l7 + %o0] 0x19,	%g4
	orncc	%g2,	0x0187,	%o6
	tvs	%icc,	0x4
	movpos	%xcc,	%g6,	%i5
	subccc	%l1,	%o7,	%l5
	tn	%xcc,	0x6
	srlx	%g1,	0x08,	%l4
	flush	%l7 + 0x54
	tsubcc	%i4,	%i7,	%l6
	ta	%icc,	0x3
	be,pt	%icc,	loop_1602
	fabss	%f24,	%f23
	movcs	%xcc,	%o5,	%o2
	taddcc	%l2,	0x1FA2,	%o0
loop_1602:
	prefetch	[%l7 + 0x4C],	 0x1
	movgu	%xcc,	%i0,	%i3
	ldd	[%l7 + 0x38],	%i2
	andcc	%o1,	%l0,	%i6
	popc	%o4,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f16,	%f1,	%f5
	umulcc	%g3,	0x0E59,	%o3
	orn	%i1,	%g7,	%g4
	mulx	%g5,	%g2,	%o6
	tgu	%icc,	0x7
	set	0x14, %g7
	ldswa	[%l7 + %g7] 0x81,	%g6
	sir	0x0B48
	brgez	%i5,	loop_1603
	te	%xcc,	0x1
	tcc	%icc,	0x2
	fmovsvc	%xcc,	%f30,	%f15
loop_1603:
	movgu	%xcc,	%o7,	%l1
	ldd	[%l7 + 0x18],	%f22
	fmovscc	%xcc,	%f31,	%f30
	set	0x1E, %i0
	ldsha	[%l7 + %i0] 0x14,	%l5
	edge8ln	%l4,	%g1,	%i4
	edge16l	%i7,	%l6,	%o2
	tl	%icc,	0x0
	sub	%o5,	%l2,	%o0
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i0
	orncc	%i2,	0x19F8,	%i3
	sll	%o1,	0x14,	%l0
	umulcc	%o4,	0x186E,	%i6
	fbne,a	%fcc3,	loop_1604
	mulx	%l3,	%o3,	%i1
	swap	[%l7 + 0x20],	%g3
	fmovdneg	%icc,	%f16,	%f11
loop_1604:
	fbo	%fcc0,	loop_1605
	sir	0x12B1
	fmovdpos	%icc,	%f9,	%f10
	tge	%icc,	0x4
loop_1605:
	tcc	%icc,	0x7
	tpos	%xcc,	0x3
	wr	%g0,	0x23,	%asi
	stba	%g7,	[%l7 + 0x08] %asi
	membar	#Sync
	set	0x49, %i3
	ldsba	[%l7 + %i3] 0x88,	%g4
	fnands	%f17,	%f27,	%f12
	fmovs	%f25,	%f20
	fmovrdgz	%g2,	%f26,	%f24
	prefetch	[%l7 + 0x48],	 0x1
	andcc	%o6,	%g5,	%g6
	edge8ln	%i5,	%l1,	%o7
	fmovsle	%icc,	%f31,	%f17
	fmovrdgz	%l4,	%f12,	%f16
	tneg	%xcc,	0x4
	fnot1	%f16,	%f18
	call	loop_1606
	movgu	%icc,	%g1,	%i4
	membar	0x73
	and	%l5,	%l6,	%i7
loop_1606:
	movvc	%xcc,	%o2,	%o5
	set	0x78, %l1
	lda	[%l7 + %l1] 0x11,	%f24
	bpos	%icc,	loop_1607
	sth	%o0,	[%l7 + 0x0E]
	set	0x08, %o1
	stda	%l2,	[%l7 + %o1] 0x11
loop_1607:
	ldd	[%l7 + 0x68],	%i0
	fnands	%f20,	%f17,	%f10
	te	%icc,	0x3
	fpsub32	%f18,	%f0,	%f2
	prefetch	[%l7 + 0x14],	 0x0
	fzero	%f20
	xnorcc	%i2,	0x08DE,	%o1
	fone	%f6
	edge8	%i3,	%l0,	%i6
	fexpand	%f13,	%f16
	alignaddr	%l3,	%o3,	%i1
	fnegs	%f11,	%f28
	fnand	%f22,	%f10,	%f8
	move	%xcc,	%o4,	%g3
	ldd	[%l7 + 0x78],	%f0
	tvs	%icc,	0x6
	sll	%g7,	0x0D,	%g4
	fandnot2s	%f2,	%f20,	%f6
	ta	%icc,	0x2
	tleu	%icc,	0x4
	xor	%g2,	%o6,	%g6
	movvc	%xcc,	%i5,	%l1
	taddcctv	%o7,	0x1857,	%g5
	fmovsge	%icc,	%f9,	%f12
	stx	%g1,	[%l7 + 0x18]
	addc	%i4,	%l5,	%l4
	fmovsn	%icc,	%f15,	%f26
	fbu,a	%fcc0,	loop_1608
	movle	%xcc,	%l6,	%i7
	ldx	[%l7 + 0x28],	%o2
	ldsb	[%l7 + 0x65],	%o5
loop_1608:
	sethi	0x14CC,	%o0
	fornot2s	%f15,	%f21,	%f19
	orn	%l2,	%i0,	%i2
	fbule,a	%fcc3,	loop_1609
	movrgez	%o1,	%i3,	%l0
	fbg,a	%fcc1,	loop_1610
	srl	%i6,	%l3,	%o3
loop_1609:
	xnor	%o4,	%g3,	%g7
	edge32	%g4,	%i1,	%g2
loop_1610:
	nop
	setx loop_1611, %l0, %l1
	jmpl %l1, %o6
	edge8ln	%i5,	%l1,	%o7
	sethi	0x074C,	%g5
	array32	%g1,	%i4,	%l5
loop_1611:
	smul	%g6,	%l6,	%l4
	sra	%i7,	%o2,	%o5
	flush	%l7 + 0x38
	brz,a	%l2,	loop_1612
	movrne	%i0,	%i2,	%o0
	edge16l	%i3,	%l0,	%i6
	for	%f14,	%f24,	%f18
loop_1612:
	tvc	%icc,	0x4
	fcmpne16	%f16,	%f4,	%o1
	movge	%icc,	%l3,	%o4
	set	0x70, %i2
	lduwa	[%l7 + %i2] 0x81,	%g3
	xnor	%g7,	0x1ABB,	%g4
	movn	%xcc,	%o3,	%i1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x19,	%f16
	set	0x28, %o6
	stxa	%o6,	[%l7 + %o6] 0x2b
	membar	#Sync
	udivx	%i5,	0x0C5E,	%l1
	taddcc	%o7,	%g2,	%g1
	smul	%i4,	0x13E5,	%g5
	sll	%l5,	%l6,	%l4
	subc	%i7,	%g6,	%o2
	movle	%xcc,	%l2,	%o5
	movre	%i0,	0x321,	%o0
	fnor	%f6,	%f20,	%f16
	set	0x4A, %l2
	stha	%i3,	[%l7 + %l2] 0x89
	edge8ln	%l0,	%i6,	%i2
	edge16l	%o1,	%o4,	%g3
	ldub	[%l7 + 0x5D],	%l3
	bpos,a,pt	%icc,	loop_1613
	tg	%xcc,	0x3
	fmovdleu	%icc,	%f20,	%f27
	fnand	%f28,	%f4,	%f26
loop_1613:
	fbule	%fcc3,	loop_1614
	tgu	%xcc,	0x5
	array8	%g7,	%g4,	%i1
	xorcc	%o6,	0x0C2F,	%i5
loop_1614:
	orncc	%l1,	%o7,	%o3
	movvs	%xcc,	%g1,	%i4
	taddcc	%g5,	%g2,	%l6
	mulx	%l5,	%i7,	%l4
	movcc	%xcc,	%g6,	%l2
	xor	%o5,	0x1044,	%o2
	be,a	%icc,	loop_1615
	array8	%i0,	%i3,	%l0
	fmovrdlez	%i6,	%f28,	%f24
	smul	%i2,	0x0BB6,	%o0
loop_1615:
	fmovdn	%icc,	%f1,	%f0
	orncc	%o4,	0x0B5B,	%o1
	movre	%l3,	%g3,	%g4
	movl	%icc,	%g7,	%o6
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%i4
	sll	%i1,	0x09,	%o7
	tcc	%xcc,	0x4
	tl	%icc,	0x7
	array8	%l1,	%g1,	%i4
	edge16n	%o3,	%g2,	%g5
	nop
	setx	loop_1616,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba	%fcc2,	loop_1617
	fmuld8sux16	%f20,	%f19,	%f24
	movrgz	%l6,	0x0BF,	%i7
loop_1616:
	fmovdle	%icc,	%f7,	%f21
loop_1617:
	tcs	%icc,	0x4
	alignaddr	%l5,	%l4,	%g6
	ta	%icc,	0x2
	st	%f6,	[%l7 + 0x40]
	fnand	%f28,	%f0,	%f10
	fpadd16s	%f7,	%f19,	%f1
	fmovdle	%icc,	%f27,	%f8
	array8	%o5,	%l2,	%o2
	tcs	%xcc,	0x2
	bg,a,pn	%icc,	loop_1618
	fmovsne	%xcc,	%f7,	%f31
	movrgez	%i0,	0x0A6,	%i3
	srl	%l0,	0x04,	%i6
loop_1618:
	bpos,pt	%xcc,	loop_1619
	fmovrdgz	%o0,	%f12,	%f24
	fmovse	%xcc,	%f29,	%f5
	array8	%i2,	%o4,	%l3
loop_1619:
	smulcc	%o1,	0x03F9,	%g3
	fmovrdgez	%g4,	%f0,	%f12
	movne	%icc,	%g7,	%i5
	fones	%f22
	wr	%g0,	0x80,	%asi
	stha	%i1,	[%l7 + 0x52] %asi
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x1F] %asi,	%o6
	ldsh	[%l7 + 0x64],	%o7
	smulcc	%g1,	0x0526,	%l1
	movn	%xcc,	%o3,	%i4
	tge	%xcc,	0x5
	fbl	%fcc1,	loop_1620
	fmovsge	%xcc,	%f26,	%f3
	sllx	%g5,	%g2,	%i7
	xor	%l5,	0x1DE0,	%l4
loop_1620:
	alignaddrl	%g6,	%l6,	%l2
	movg	%icc,	%o5,	%i0
	brlz	%i3,	loop_1621
	move	%xcc,	%l0,	%i6
	movg	%icc,	%o0,	%i2
	taddcctv	%o2,	0x16C8,	%l3
loop_1621:
	fornot2s	%f20,	%f31,	%f11
	fmovscs	%icc,	%f4,	%f23
	fpsub16	%f12,	%f22,	%f20
	tgu	%icc,	0x1
	orncc	%o4,	0x002D,	%g3
	movg	%xcc,	%o1,	%g7
	array8	%i5,	%g4,	%o6
	mulscc	%i1,	%o7,	%g1
	sllx	%l1,	0x15,	%o3
	bvc,a,pt	%xcc,	loop_1622
	fmovdvs	%xcc,	%f14,	%f25
	set	0x64, %l3
	sta	%f5,	[%l7 + %l3] 0x04
loop_1622:
	ldstub	[%l7 + 0x7D],	%g5
	fzeros	%f6
	edge8ln	%g2,	%i4,	%l5
	movne	%icc,	%l4,	%i7
	fnot1	%f16,	%f2
	fands	%f30,	%f29,	%f31
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%i6
	std	%l2,	[%l7 + 0x50]
	array8	%o5,	%g6,	%i3
	std	%f28,	[%l7 + 0x68]
	mulscc	%i0,	0x05A0,	%i6
	nop
	set	0x60, %o2
	std	%f14,	[%l7 + %o2]
	nop
	set	0x6E, %o4
	ldub	[%l7 + %o4],	%o0
	set	0x50, %g4
	ldswa	[%l7 + %g4] 0x18,	%i2
	fbe,a	%fcc1,	loop_1623
	edge32	%l0,	%l3,	%o4
	orn	%o2,	0x15BF,	%g3
	nop
	set	0x19, %o3
	ldub	[%l7 + %o3],	%g7
loop_1623:
	nop
	set	0x40, %g3
	swapa	[%l7 + %g3] 0x10,	%o1
	membar	0x40
	fpack16	%f22,	%f27
	tne	%xcc,	0x4
	fmovdl	%icc,	%f20,	%f24
	fpadd32	%f12,	%f10,	%f14
	edge32n	%g4,	%o6,	%i1
	tvc	%xcc,	0x3
	fbo,a	%fcc0,	loop_1624
	fmovrdne	%o7,	%f12,	%f8
	stw	%g1,	[%l7 + 0x6C]
	movg	%xcc,	%l1,	%o3
loop_1624:
	membar	0x23
	edge16n	%i5,	%g5,	%i4
	xorcc	%l5,	%l4,	%i7
	fbue,a	%fcc0,	loop_1625
	fcmpeq16	%f8,	%f18,	%g2
	movgu	%xcc,	%l6,	%o5
	bneg,a,pn	%xcc,	loop_1626
loop_1625:
	tgu	%xcc,	0x6
	std	%l2,	[%l7 + 0x78]
	andn	%i3,	%g6,	%i0
loop_1626:
	tcs	%icc,	0x3
	brgez,a	%i6,	loop_1627
	fbn	%fcc3,	loop_1628
	sdiv	%o0,	0x1BF4,	%i2
	fandnot1s	%f24,	%f3,	%f29
loop_1627:
	fxors	%f23,	%f30,	%f8
loop_1628:
	udivx	%l3,	0x075C,	%o4
	fmovdl	%xcc,	%f19,	%f14
	nop
	set	0x6C, %g1
	ldsh	[%l7 + %g1],	%o2
	orn	%g3,	0x1EDB,	%g7
	nop
	setx	loop_1629,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%o1,	%l0
	tcc	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1629:
	nop
	setx	loop_1630,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsb	[%l7 + 0x69],	%g4
	edge8ln	%i1,	%o6,	%o7
	sir	0x1570
loop_1630:
	xnorcc	%g1,	%l1,	%i5
	alignaddr	%g5,	%i4,	%o3
	movne	%icc,	%l4,	%i7
	fbug	%fcc1,	loop_1631
	fmovrdlez	%g2,	%f16,	%f6
	fmovdg	%icc,	%f5,	%f9
	te	%icc,	0x0
loop_1631:
	fnot2s	%f6,	%f19
	movneg	%xcc,	%l5,	%o5
	xnorcc	%l6,	%i3,	%l2
	fmovrdgz	%g6,	%f18,	%f28
	fbl	%fcc0,	loop_1632
	fmovrse	%i6,	%f17,	%f1
	umul	%o0,	%i2,	%i0
	fpadd16	%f2,	%f28,	%f28
loop_1632:
	orn	%o4,	%o2,	%g3
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovrdlz	%g7,	%f8,	%f12
	lduh	[%l7 + 0x4A],	%o1
	edge8l	%l3,	%g4,	%i1
	wr	%g0,	0x80,	%asi
	stda	%o6,	[%l7 + 0x68] %asi
	udivx	%l0,	0x1CBE,	%o7
	fcmpes	%fcc3,	%f15,	%f24
	fmovdge	%xcc,	%f5,	%f0
	bn,pt	%icc,	loop_1633
	fpadd16s	%f7,	%f3,	%f1
	tne	%icc,	0x2
	movne	%xcc,	%l1,	%i5
loop_1633:
	fmovdn	%icc,	%f31,	%f29
	alignaddrl	%g1,	%g5,	%i4
	fzero	%f20
	addc	%o3,	%i7,	%l4
	tne	%icc,	0x6
	fbue,a	%fcc2,	loop_1634
	fmovdne	%icc,	%f23,	%f3
	and	%l5,	0x070E,	%g2
	membar	0x31
loop_1634:
	subc	%l6,	%i3,	%o5
	movne	%xcc,	%l2,	%i6
	tge	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g6,	%i2,	%o0
	addc	%i0,	%o4,	%o2
	fabss	%f13,	%f22
	srlx	%g7,	%g3,	%l3
	movrlz	%g4,	%o1,	%i1
	call	loop_1635
	udivx	%o6,	0x1BC9,	%o7
	addcc	%l0,	%i5,	%l1
	fcmpes	%fcc0,	%f14,	%f30
loop_1635:
	smul	%g5,	%i4,	%g1
	edge8l	%i7,	%o3,	%l4
	movcs	%xcc,	%g2,	%l5
	andn	%l6,	0x0220,	%o5
	srax	%i3,	%i6,	%l2
	tn	%icc,	0x4
	fbne	%fcc1,	loop_1636
	smulcc	%g6,	0x0241,	%i2
	lduh	[%l7 + 0x2C],	%i0
	ld	[%l7 + 0x58],	%f8
loop_1636:
	edge8	%o4,	%o0,	%o2
	orn	%g7,	0x1B27,	%g3
	fpack16	%f18,	%f28
	edge32	%g4,	%o1,	%i1
	fcmpd	%fcc2,	%f22,	%f18
	movvs	%icc,	%o6,	%o7
	fands	%f17,	%f2,	%f5
	and	%l0,	%l3,	%l1
	ba	loop_1637
	stw	%i5,	[%l7 + 0x4C]
	lduw	[%l7 + 0x74],	%i4
	popc	0x174D,	%g1
loop_1637:
	udiv	%g5,	0x0F2C,	%i7
	edge16n	%l4,	%o3,	%l5
	lduh	[%l7 + 0x1E],	%l6
	udivcc	%o5,	0x0199,	%i3
	tpos	%icc,	0x3
	mulx	%i6,	%g2,	%g6
	brnz,a	%i2,	loop_1638
	movrne	%i0,	%l2,	%o0
	fmuld8ulx16	%f24,	%f24,	%f0
	sll	%o2,	0x15,	%g7
loop_1638:
	fone	%f30
	udiv	%g3,	0x1193,	%o4
	fnor	%f8,	%f4,	%f22
	movge	%xcc,	%g4,	%i1
	movrne	%o6,	%o7,	%l0
	membar	0x2C
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x15] %asi,	%l3
	swap	[%l7 + 0x08],	%l1
	fmovd	%f26,	%f24
	movcs	%icc,	%i5,	%i4
	fpack16	%f4,	%f15
	movg	%xcc,	%g1,	%g5
	tsubcc	%o1,	0x0DB6,	%i7
	taddcc	%o3,	%l5,	%l6
	set	0x18, %i5
	ldxa	[%g0 + %i5] 0x50,	%l4
	edge16	%i3,	%o5,	%i6
	smulcc	%g6,	0x1377,	%i2
	fnot1s	%f17,	%f18
	sub	%i0,	0x1EF2,	%l2
	fornot2s	%f14,	%f19,	%f0
	movvs	%icc,	%g2,	%o2
	fbul,a	%fcc2,	loop_1639
	addccc	%o0,	%g3,	%g7
	nop
	setx	loop_1640,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%o4,	0x1053,	%i1
loop_1639:
	fbule	%fcc1,	loop_1641
	umulcc	%o6,	%o7,	%g4
loop_1640:
	tpos	%xcc,	0x1
	movvc	%icc,	%l0,	%l3
loop_1641:
	nop
	setx	loop_1642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%i5,	0x1FF4,	%i4
	fmovsvc	%xcc,	%f27,	%f5
	set	0x70, %g5
	stxa	%l1,	[%l7 + %g5] 0x2a
	membar	#Sync
loop_1642:
	array32	%g1,	%o1,	%g5
	fmovdge	%icc,	%f19,	%f0
	sth	%i7,	[%l7 + 0x12]
	brnz	%l5,	loop_1643
	tge	%xcc,	0x0
	fcmpgt32	%f12,	%f20,	%l6
	movrne	%o3,	%i3,	%o5
loop_1643:
	edge8n	%i6,	%g6,	%l4
	subccc	%i0,	0x0A4B,	%i2
	tne	%xcc,	0x5
	edge8	%l2,	%o2,	%g2
	fnot2	%f14,	%f28
	fpsub32	%f2,	%f20,	%f2
	taddcctv	%g3,	%g7,	%o0
	nop
	setx loop_1644, %l0, %l1
	jmpl %l1, %o4
	movl	%xcc,	%o6,	%i1
	edge32l	%g4,	%o7,	%l0
	move	%xcc,	%l3,	%i4
loop_1644:
	ldsh	[%l7 + 0x32],	%l1
	fmovsl	%icc,	%f12,	%f31
	addcc	%g1,	%o1,	%i5
	edge32l	%g5,	%l5,	%l6
	fnors	%f4,	%f12,	%f25
	tg	%icc,	0x7
	brgez	%i7,	loop_1645
	fble,a	%fcc2,	loop_1646
	pdist	%f16,	%f10,	%f26
	movcc	%icc,	%i3,	%o5
loop_1645:
	tcs	%icc,	0x2
loop_1646:
	addcc	%o3,	%i6,	%g6
	movpos	%xcc,	%i0,	%i2
	fmovdvs	%icc,	%f20,	%f22
	addcc	%l2,	0x1C51,	%l4
	tg	%xcc,	0x2
	bn,pt	%xcc,	loop_1647
	fxnors	%f8,	%f15,	%f7
	ldsb	[%l7 + 0x20],	%o2
	add	%g2,	%g7,	%g3
loop_1647:
	edge32l	%o4,	%o0,	%o6
	movrlez	%i1,	0x2F3,	%g4
	taddcctv	%l0,	%o7,	%l3
	sdivcc	%l1,	0x0CB0,	%g1
	move	%xcc,	%i4,	%i5
	mova	%icc,	%o1,	%g5
	addccc	%l6,	%i7,	%l5
	fone	%f30
	tleu	%xcc,	0x6
	sra	%i3,	0x1A,	%o5
	fmovdl	%icc,	%f2,	%f18
	ldsb	[%l7 + 0x37],	%o3
	bge,a,pn	%icc,	loop_1648
	bleu,a,pn	%xcc,	loop_1649
	xorcc	%i6,	%i0,	%g6
	tvs	%icc,	0x6
loop_1648:
	movneg	%icc,	%l2,	%i2
loop_1649:
	movrne	%l4,	0x3F6,	%g2
	mulx	%g7,	%o2,	%o4
	smulcc	%o0,	%g3,	%i1
	array32	%o6,	%g4,	%o7
	taddcc	%l0,	0x0AB4,	%l3
	movrgz	%l1,	0x063,	%g1
	array16	%i5,	%i4,	%o1
	fmovscs	%xcc,	%f30,	%f20
	sdivcc	%g5,	0x1C42,	%l6
	fzeros	%f28
	fmovsgu	%xcc,	%f16,	%f5
	edge32	%i7,	%l5,	%o5
	andcc	%i3,	0x16A1,	%i6
	movrne	%i0,	0x12B,	%o3
	ble,a,pn	%icc,	loop_1650
	ldd	[%l7 + 0x50],	%g6
	st	%f26,	[%l7 + 0x74]
	move	%icc,	%l2,	%l4
loop_1650:
	movn	%xcc,	%g2,	%g7
	tsubcc	%o2,	0x14AE,	%i2
	membar	0x09
	umulcc	%o0,	0x1830,	%o4
	fmovse	%icc,	%f6,	%f0
	ldsw	[%l7 + 0x3C],	%g3
	fsrc1	%f20,	%f18
	tg	%icc,	0x6
	movrlz	%i1,	%o6,	%o7
	taddcctv	%g4,	0x1AEF,	%l3
	fcmpne32	%f24,	%f10,	%l1
	array16	%g1,	%l0,	%i4
	fpackfix	%f2,	%f29
	ldsw	[%l7 + 0x58],	%i5
	movneg	%xcc,	%g5,	%l6
	tg	%xcc,	0x7
	fsrc2s	%f13,	%f23
	brnz	%o1,	loop_1651
	move	%xcc,	%i7,	%l5
	wr	%g0,	0x80,	%asi
	stba	%i3,	[%l7 + 0x7F] %asi
loop_1651:
	tle	%xcc,	0x6
	sll	%o5,	0x01,	%i0
	edge8	%o3,	%g6,	%i6
	movrlez	%l2,	0x0CB,	%g2
	xor	%l4,	0x0D67,	%g7
	ldsb	[%l7 + 0x0B],	%o2
	addcc	%o0,	%i2,	%g3
	movcs	%icc,	%i1,	%o4
	fmuld8ulx16	%f23,	%f20,	%f2
	edge16ln	%o6,	%g4,	%o7
	ldx	[%l7 + 0x40],	%l1
	tvc	%icc,	0x0
	movpos	%xcc,	%g1,	%l0
	fzero	%f4
	fmul8x16	%f5,	%f8,	%f2
	or	%i4,	%i5,	%l3
	sdivx	%l6,	0x15A8,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,pt	%icc,	loop_1652
	edge8l	%i7,	%l5,	%o1
	sir	0x10CD
	addcc	%o5,	%i0,	%o3
loop_1652:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f30,	[%l7 + 0x6C] %asi
	sethi	0x0301,	%g6
	udivx	%i6,	0x1706,	%i3
	xnor	%l2,	%g2,	%l4
	addccc	%g7,	0x1EE9,	%o2
	sllx	%o0,	0x0A,	%i2
	sir	0x1A04
	movcc	%xcc,	%g3,	%i1
	fmovse	%xcc,	%f17,	%f9
	fabss	%f21,	%f3
	fba,a	%fcc1,	loop_1653
	tl	%icc,	0x1
	udivx	%o6,	0x1FCE,	%o4
	fmovdg	%icc,	%f14,	%f13
loop_1653:
	lduh	[%l7 + 0x24],	%o7
	call	loop_1654
	movn	%icc,	%l1,	%g1
	bge,a,pt	%xcc,	loop_1655
	fmovrde	%g4,	%f6,	%f12
loop_1654:
	ldd	[%l7 + 0x70],	%l0
	edge8n	%i4,	%i5,	%l3
loop_1655:
	mova	%icc,	%l6,	%g5
	movg	%xcc,	%l5,	%o1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%i0
	set	0x68, %l5
	ldswa	[%l7 + %l5] 0x10,	%i7
	wr	%g0,	0xeb,	%asi
	stxa	%g6,	[%l7 + 0x08] %asi
	membar	#Sync
	edge32ln	%i6,	%o3,	%l2
	te	%icc,	0x7
	movg	%xcc,	%g2,	%i3
	fpmerge	%f21,	%f13,	%f12
	addcc	%l4,	0x108F,	%g7
	fmovrsgez	%o2,	%f23,	%f26
	fpadd32	%f6,	%f12,	%f24
	xor	%i2,	0x091D,	%o0
	brlz,a	%g3,	loop_1656
	movrgez	%o6,	0x27E,	%i1
	movneg	%icc,	%o7,	%l1
	faligndata	%f28,	%f4,	%f4
loop_1656:
	nop
	set	0x5E, %g6
	lduba	[%l7 + %g6] 0x19,	%g1
	edge16	%g4,	%l0,	%i4
	tneg	%xcc,	0x4
	fzeros	%f2
	movgu	%xcc,	%o4,	%i5
	fcmped	%fcc2,	%f18,	%f12
	sllx	%l6,	0x1F,	%g5
	fmovrdgz	%l3,	%f16,	%f28
	be,a,pn	%icc,	loop_1657
	tsubcc	%l5,	%o5,	%i0
	movge	%icc,	%o1,	%g6
	ldd	[%l7 + 0x78],	%i6
loop_1657:
	te	%xcc,	0x6
	srax	%o3,	0x17,	%l2
	wr	%g0,	0x80,	%asi
	sta	%f29,	[%l7 + 0x0C] %asi
	fmovdneg	%xcc,	%f2,	%f29
	subccc	%g2,	%i3,	%l4
	te	%icc,	0x3
	subc	%g7,	0x0F2F,	%i6
	fone	%f26
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x16,	%f16
	fmovdcs	%xcc,	%f7,	%f30
	fmovrde	%i2,	%f30,	%f18
	fpack32	%f10,	%f8,	%f10
	edge16	%o0,	%g3,	%o2
	tleu	%icc,	0x2
	sdivx	%o6,	0x0D09,	%i1
	move	%icc,	%l1,	%g1
	subccc	%o7,	0x14B5,	%l0
	fmovsle	%xcc,	%f14,	%f16
	subc	%i4,	%g4,	%i5
	tleu	%icc,	0x6
	fpsub32s	%f5,	%f15,	%f16
	alignaddrl	%o4,	%g5,	%l6
	movrne	%l3,	%o5,	%l5
	fxnors	%f22,	%f7,	%f13
	addccc	%i0,	%o1,	%i7
	movcc	%xcc,	%g6,	%o3
	orncc	%g2,	%l2,	%i3
	fmul8x16au	%f30,	%f17,	%f22
	bleu,pn	%xcc,	loop_1658
	udiv	%l4,	0x1597,	%i6
	fbuge,a	%fcc0,	loop_1659
	tl	%icc,	0x5
loop_1658:
	taddcctv	%g7,	%i2,	%o0
	sllx	%g3,	%o6,	%i1
loop_1659:
	fmovde	%xcc,	%f29,	%f6
	edge16n	%l1,	%o2,	%g1
	fcmpgt32	%f14,	%f8,	%o7
	set	0x48, %l6
	lduwa	[%l7 + %l6] 0x18,	%i4
	fsrc1	%f28,	%f28
	subc	%l0,	0x1CB8,	%g4
	fmovdgu	%xcc,	%f19,	%f1
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x80,	%o4
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x04,	%i5
	orn	%g5,	%l3,	%o5
	fxnor	%f8,	%f0,	%f10
	tne	%xcc,	0x4
	fbn,a	%fcc2,	loop_1660
	tvc	%icc,	0x1
	sth	%l6,	[%l7 + 0x26]
	membar	0x38
loop_1660:
	fands	%f31,	%f12,	%f3
	fandnot2s	%f4,	%f14,	%f18
	sllx	%l5,	0x08,	%i0
	umulcc	%i7,	0x096F,	%o1
	ble,a	loop_1661
	tgu	%icc,	0x1
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f0
loop_1661:
	orncc	%g6,	0x1459,	%g2
	fpadd32	%f8,	%f2,	%f26
	tvs	%icc,	0x5
	fnors	%f12,	%f15,	%f12
	addc	%l2,	0x1B40,	%i3
	edge16	%o3,	%i6,	%g7
	tgu	%icc,	0x6
	orn	%l4,	%o0,	%g3
	sub	%i2,	%o6,	%i1
	movvc	%icc,	%l1,	%g1
	edge32ln	%o2,	%i4,	%o7
	sir	0x03D5
	xnor	%g4,	0x1510,	%o4
	fblg,a	%fcc2,	loop_1662
	tle	%icc,	0x0
	umulcc	%i5,	0x1DD4,	%l0
	fmovsleu	%icc,	%f23,	%f1
loop_1662:
	tgu	%xcc,	0x3
	movg	%xcc,	%g5,	%o5
	te	%xcc,	0x4
	tne	%xcc,	0x0
	fmul8ulx16	%f20,	%f2,	%f20
	fmovrslez	%l3,	%f26,	%f30
	edge16ln	%l5,	%l6,	%i0
	addcc	%i7,	0x10F3,	%o1
	bg,a	loop_1663
	edge8l	%g2,	%l2,	%g6
	fornot2	%f4,	%f10,	%f24
	edge32l	%i3,	%o3,	%i6
loop_1663:
	sth	%l4,	[%l7 + 0x20]
	array32	%g7,	%g3,	%o0
	srlx	%o6,	0x14,	%i1
	sdivx	%l1,	0x0CCE,	%i2
	fbe,a	%fcc1,	loop_1664
	fnot1s	%f2,	%f22
	nop
	setx	loop_1665,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x48
loop_1664:
	fmovdcc	%icc,	%f7,	%f30
	std	%o2,	[%l7 + 0x30]
loop_1665:
	edge16n	%i4,	%g1,	%o7
	mulx	%o4,	0x15E7,	%g4
	tcs	%xcc,	0x4
	tleu	%xcc,	0x3
	movne	%icc,	%i5,	%g5
	xnor	%l0,	%o5,	%l5
	st	%f17,	[%l7 + 0x48]
	brz,a	%l3,	loop_1666
	subc	%l6,	0x04BE,	%i0
	ldstub	[%l7 + 0x56],	%o1
	fpadd32s	%f26,	%f28,	%f20
loop_1666:
	fmul8x16al	%f13,	%f8,	%f2
	brnz,a	%g2,	loop_1667
	fmovspos	%icc,	%f25,	%f22
	edge16n	%i7,	%g6,	%l2
	edge32	%o3,	%i6,	%i3
loop_1667:
	fnot2	%f30,	%f8
	set	0x34, %g2
	lduwa	[%l7 + %g2] 0x80,	%g7
	sethi	0x1E2F,	%g3
	for	%f12,	%f28,	%f16
	or	%l4,	0x0910,	%o0
	fmovdle	%icc,	%f27,	%f17
	movle	%icc,	%o6,	%i1
	mulx	%l1,	0x15BD,	%i2
	bgu,pn	%xcc,	loop_1668
	tcc	%icc,	0x1
	tg	%icc,	0x0
	movre	%o2,	0x3A8,	%i4
loop_1668:
	ldub	[%l7 + 0x4B],	%o7
	edge8l	%g1,	%g4,	%i5
	fabsd	%f20,	%f8
	sir	0x1359
	fmovsa	%xcc,	%f4,	%f16
	taddcc	%g5,	0x0D82,	%o4
	fnegd	%f18,	%f30
	tcs	%xcc,	0x1
	popc	0x1DA7,	%o5
	fcmpgt16	%f2,	%f26,	%l0
	smul	%l5,	%l6,	%l3
	stb	%o1,	[%l7 + 0x3A]
	movvc	%icc,	%i0,	%i7
	edge16n	%g2,	%l2,	%g6
	edge16l	%i6,	%i3,	%g7
	movrne	%o3,	0x0F8,	%l4
	smul	%g3,	%o0,	%i1
	tneg	%xcc,	0x1
	smul	%l1,	0x0B33,	%i2
	smulcc	%o6,	%i4,	%o7
	tl	%xcc,	0x1
	andn	%o2,	0x1C24,	%g1
	movpos	%xcc,	%i5,	%g4
	st	%f2,	[%l7 + 0x70]
	movn	%icc,	%o4,	%g5
	edge32ln	%o5,	%l0,	%l5
	sll	%l6,	0x16,	%o1
	popc	%l3,	%i7
	fba	%fcc2,	loop_1669
	swap	[%l7 + 0x78],	%g2
	sethi	0x1B4D,	%l2
	fbg,a	%fcc1,	loop_1670
loop_1669:
	tne	%icc,	0x7
	movre	%i0,	0x301,	%i6
	movvc	%icc,	%g6,	%i3
loop_1670:
	subccc	%g7,	%l4,	%o3
	tpos	%icc,	0x1
	fcmple32	%f8,	%f20,	%o0
	orcc	%i1,	0x03C3,	%l1
	sllx	%g3,	0x0E,	%o6
	mova	%icc,	%i2,	%i4
	smulcc	%o7,	0x1305,	%o2
	movrgz	%i5,	0x245,	%g1
	tsubcc	%g4,	0x03B8,	%o4
	fmovdl	%icc,	%f29,	%f17
	tpos	%icc,	0x2
	tn	%xcc,	0x3
	fbne	%fcc2,	loop_1671
	ble,pn	%icc,	loop_1672
	bne,pt	%icc,	loop_1673
	bshuffle	%f4,	%f6,	%f14
loop_1671:
	movg	%icc,	%g5,	%o5
loop_1672:
	and	%l5,	0x0DEF,	%l0
loop_1673:
	taddcctv	%l6,	%l3,	%o1
	andcc	%g2,	0x09B1,	%l2
	bleu,a	loop_1674
	fmovsvs	%icc,	%f12,	%f23
	fmovdcc	%xcc,	%f20,	%f24
	fsrc1s	%f0,	%f6
loop_1674:
	ldsh	[%l7 + 0x76],	%i0
	xnorcc	%i7,	%i6,	%i3
	udivcc	%g6,	0x0C62,	%l4
	ble,pn	%xcc,	loop_1675
	xnor	%o3,	0x105D,	%g7
	movrgz	%i1,	%l1,	%o0
	movpos	%xcc,	%o6,	%g3
loop_1675:
	move	%xcc,	%i4,	%i2
	tg	%icc,	0x4
	smul	%o2,	%o7,	%g1
	set	0x2C, %o5
	lduha	[%l7 + %o5] 0x88,	%g4
	movg	%xcc,	%o4,	%g5
	set	0x5C, %g7
	ldsba	[%l7 + %g7] 0x0c,	%i5
	fpsub32	%f8,	%f22,	%f10
	fcmpes	%fcc2,	%f22,	%f17
	sll	%o5,	%l0,	%l5
	andcc	%l6,	%o1,	%g2
	or	%l3,	%l2,	%i7
	fpadd32	%f22,	%f6,	%f22
	xnor	%i6,	0x1443,	%i3
	edge8ln	%g6,	%i0,	%l4
	edge16	%o3,	%g7,	%l1
	subccc	%i1,	%o6,	%g3
	tvs	%icc,	0x5
	movvs	%xcc,	%o0,	%i2
	subc	%i4,	0x1FBD,	%o7
	fsrc2	%f16,	%f24
	array16	%o2,	%g4,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f1,	%f6,	%f9
	fxnors	%f14,	%f28,	%f6
	tn	%xcc,	0x4
	fcmpne16	%f28,	%f20,	%g1
	sdivcc	%i5,	0x0320,	%g5
	movpos	%xcc,	%l0,	%o5
	edge8l	%l6,	%o1,	%g2
	tcs	%icc,	0x2
	ba	%xcc,	loop_1676
	subccc	%l3,	%l5,	%i7
	edge32	%i6,	%l2,	%g6
	movl	%icc,	%i0,	%l4
loop_1676:
	ble	%icc,	loop_1677
	movn	%icc,	%i3,	%o3
	tcc	%icc,	0x1
	fbuge,a	%fcc1,	loop_1678
loop_1677:
	tn	%xcc,	0x0
	fcmpne16	%f8,	%f16,	%l1
	fpmerge	%f9,	%f5,	%f10
loop_1678:
	movrgez	%i1,	0x05E,	%g7
	fors	%f5,	%f13,	%f25
	movvs	%icc,	%o6,	%o0
	tcc	%icc,	0x2
	movrne	%i2,	%g3,	%o7
	taddcc	%o2,	0x06EF,	%i4
	movrne	%g4,	%o4,	%i5
	tne	%xcc,	0x6
	fmovdneg	%icc,	%f19,	%f14
	edge32l	%g1,	%l0,	%g5
	sth	%o5,	[%l7 + 0x20]
	movrlez	%l6,	0x19A,	%o1
	movre	%g2,	%l3,	%i7
	tge	%xcc,	0x5
	fxors	%f8,	%f18,	%f29
	stw	%l5,	[%l7 + 0x38]
	orncc	%l2,	0x1B7B,	%i6
	array8	%g6,	%l4,	%i3
	sdiv	%o3,	0x037D,	%l1
	bvs,a,pn	%xcc,	loop_1679
	sir	0x123A
	movle	%xcc,	%i1,	%g7
	srl	%i0,	0x04,	%o6
loop_1679:
	membar	0x16
	fbo,a	%fcc0,	loop_1680
	pdist	%f0,	%f18,	%f16
	fmovsge	%icc,	%f14,	%f28
	addcc	%o0,	%g3,	%o7
loop_1680:
	movrlz	%o2,	0x3F5,	%i4
	movl	%xcc,	%i2,	%g4
	movvs	%icc,	%i5,	%o4
	fmovse	%xcc,	%f6,	%f9
	nop
	set	0x2D, %i0
	ldub	[%l7 + %i0],	%l0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x7C] %asi,	%g1
	srlx	%o5,	0x06,	%g5
	udivcc	%l6,	0x18C1,	%o1
	fmovsvc	%icc,	%f12,	%f21
	edge32l	%l3,	%i7,	%l5
	tpos	%icc,	0x1
	fmovde	%xcc,	%f5,	%f10
	orn	%g2,	%l2,	%g6
	fmul8x16	%f31,	%f16,	%f8
	fmovsge	%icc,	%f15,	%f21
	edge32n	%i6,	%l4,	%o3
	taddcc	%l1,	0x0B2E,	%i1
	stw	%i3,	[%l7 + 0x14]
	wr	%g0,	0x18,	%asi
	sta	%f7,	[%l7 + 0x74] %asi
	fandnot1s	%f21,	%f20,	%f28
	add	%g7,	0x03A0,	%i0
	tsubcctv	%o6,	0x0FE9,	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i4,	%i2,	%g4
	orcc	%i5,	%o7,	%o4
	brz	%l0,	loop_1681
	edge8ln	%o5,	%g1,	%g5
	bleu,pn	%icc,	loop_1682
	fmovspos	%icc,	%f27,	%f14
loop_1681:
	fcmpeq32	%f6,	%f26,	%l6
	fbne,a	%fcc3,	loop_1683
loop_1682:
	sra	%l3,	0x03,	%o1
	alignaddr	%i7,	%l5,	%l2
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x11,	%g6
loop_1683:
	edge8n	%g2,	%i6,	%o3
	addccc	%l4,	%l1,	%i1
	orn	%g7,	0x1771,	%i3
	fmovdl	%xcc,	%f27,	%f30
	fandnot2s	%f23,	%f27,	%f18
	bl	loop_1684
	taddcctv	%i0,	%o6,	%g3
	fzeros	%f23
	addcc	%o2,	%i4,	%o0
loop_1684:
	addccc	%i2,	0x08CF,	%g4
	fmovs	%f17,	%f26
	fmovrdlez	%o7,	%f24,	%f18
	fmovsvs	%icc,	%f21,	%f28
	lduw	[%l7 + 0x4C],	%i5
	movn	%icc,	%o4,	%l0
	tvs	%icc,	0x6
	xorcc	%g1,	0x048C,	%o5
	brgz,a	%g5,	loop_1685
	movvs	%icc,	%l3,	%o1
	fabsd	%f20,	%f16
	fcmpes	%fcc1,	%f9,	%f18
loop_1685:
	tvc	%xcc,	0x5
	orn	%i7,	%l6,	%l5
	wr	%g0,	0x81,	%asi
	stda	%g6,	[%l7 + 0x38] %asi
	mulx	%g2,	%i6,	%l2
	tvs	%xcc,	0x3
	tsubcc	%o3,	0x18D9,	%l1
	addccc	%i1,	%g7,	%i3
	alignaddr	%l4,	%o6,	%g3
	sll	%i0,	%i4,	%o2
	fmovdpos	%xcc,	%f16,	%f0
	fcmple32	%f6,	%f30,	%i2
	movvs	%icc,	%o0,	%o7
	andcc	%i5,	%g4,	%o4
	movrlez	%l0,	%g1,	%o5
	taddcctv	%l3,	0x1586,	%o1
	tgu	%icc,	0x1
	tcc	%xcc,	0x4
	brgez,a	%i7,	loop_1686
	sll	%l6,	0x0F,	%g5
	be	loop_1687
	sethi	0x0294,	%g6
loop_1686:
	faligndata	%f2,	%f24,	%f28
	edge16	%l5,	%g2,	%i6
loop_1687:
	subccc	%l2,	%o3,	%l1
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x81
	tge	%icc,	0x0
	movrgez	%g7,	0x1C5,	%i3
	fmovdl	%xcc,	%f11,	%f14
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l4,	%o6
	movl	%xcc,	%i1,	%g3
	fabss	%f7,	%f12
	udivcc	%i4,	0x16CA,	%i0
	fmovsl	%xcc,	%f23,	%f9
	fbge,a	%fcc3,	loop_1688
	tcs	%icc,	0x3
	sll	%i2,	%o2,	%o7
	tleu	%xcc,	0x5
loop_1688:
	srax	%i5,	0x0F,	%o0
	fmovrslz	%o4,	%f8,	%f16
	fbuge,a	%fcc0,	loop_1689
	edge16n	%g4,	%g1,	%o5
	ta	%icc,	0x2
	ldsh	[%l7 + 0x30],	%l0
loop_1689:
	ba,a,pt	%icc,	loop_1690
	bneg	%icc,	loop_1691
	fmul8x16al	%f24,	%f17,	%f16
	smulcc	%o1,	%i7,	%l6
loop_1690:
	std	%l2,	[%l7 + 0x50]
loop_1691:
	call	loop_1692
	ldd	[%l7 + 0x28],	%f12
	fmovrslez	%g6,	%f18,	%f21
	movle	%icc,	%g5,	%g2
loop_1692:
	xnor	%i6,	0x1497,	%l5
	sethi	0x01EA,	%l2
	fmovscs	%icc,	%f8,	%f24
	fxnors	%f18,	%f28,	%f11
	fbg,a	%fcc3,	loop_1693
	sdivcc	%l1,	0x1682,	%g7
	movrgez	%o3,	0x3A5,	%i3
	andncc	%l4,	%o6,	%g3
loop_1693:
	nop
	set	0x4C, %o0
	stwa	%i1,	[%l7 + %o0] 0x2b
	membar	#Sync
	tcc	%icc,	0x4
	orcc	%i0,	%i4,	%i2
	fmovs	%f12,	%f18
	movne	%xcc,	%o7,	%o2
	set	0x18, %o1
	stda	%o0,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x58, %i2
	stha	%o4,	[%l7 + %i2] 0x2a
	membar	#Sync
	set	0x41, %o6
	lduba	[%l7 + %o6] 0x18,	%g4
	addcc	%g1,	0x00B7,	%i5
	fpadd16	%f4,	%f0,	%f22
	smulcc	%o5,	0x1751,	%o1
	tg	%icc,	0x1
	movrlez	%i7,	%l0,	%l3
	srax	%l6,	0x0C,	%g5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x72] %asi,	%g2
	wr	%g0,	0x89,	%asi
	stba	%g6,	[%l7 + 0x19] %asi
	set	0x24, %l2
	sta	%f21,	[%l7 + %l2] 0x0c
	fmovdneg	%icc,	%f1,	%f28
	fbo	%fcc0,	loop_1694
	srlx	%i6,	0x14,	%l2
	bgu,a	loop_1695
	stb	%l1,	[%l7 + 0x38]
loop_1694:
	call	loop_1696
	sth	%l5,	[%l7 + 0x60]
loop_1695:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x50] %asi,	%f18
loop_1696:
	bvc,a	loop_1697
	edge32l	%o3,	%i3,	%l4
	set	0x40, %o7
	lduba	[%l7 + %o7] 0x80,	%g7
loop_1697:
	subc	%o6,	0x1963,	%g3
	fmovdgu	%icc,	%f0,	%f19
	movrgez	%i0,	%i1,	%i4
	fmovsgu	%icc,	%f11,	%f8
	tgu	%xcc,	0x3
	fbge	%fcc2,	loop_1698
	tvs	%xcc,	0x6
	fbue,a	%fcc3,	loop_1699
	bne,a	loop_1700
loop_1698:
	fba	%fcc1,	loop_1701
	edge16ln	%o7,	%o2,	%i2
loop_1699:
	fzero	%f10
loop_1700:
	fnot2	%f14,	%f12
loop_1701:
	tge	%xcc,	0x2
	bvs,a	loop_1702
	bgu,a,pn	%icc,	loop_1703
	fsrc1	%f4,	%f0
	fmovdn	%icc,	%f29,	%f5
loop_1702:
	edge32	%o4,	%o0,	%g4
loop_1703:
	movre	%g1,	%i5,	%o5
	edge8ln	%i7,	%o1,	%l3
	bpos,a,pn	%xcc,	loop_1704
	edge32n	%l0,	%g5,	%g2
	stw	%l6,	[%l7 + 0x28]
	tneg	%icc,	0x2
loop_1704:
	tneg	%xcc,	0x2
	mova	%icc,	%i6,	%g6
	xor	%l2,	%l1,	%l5
	sdivx	%o3,	0x1899,	%i3
	fabsd	%f30,	%f26
	fornot1s	%f21,	%f2,	%f11
	bcs,a,pt	%xcc,	loop_1705
	xnorcc	%l4,	0x0EC3,	%g7
	fmovdcc	%xcc,	%f20,	%f12
	tvs	%icc,	0x6
loop_1705:
	or	%g3,	%o6,	%i0
	bneg,a	%icc,	loop_1706
	srl	%i4,	%o7,	%i1
	tn	%xcc,	0x7
	tsubcc	%o2,	%o4,	%i2
loop_1706:
	edge8l	%o0,	%g4,	%g1
	stw	%i5,	[%l7 + 0x30]
	bne,pn	%icc,	loop_1707
	fabsd	%f28,	%f2
	fbg,a	%fcc0,	loop_1708
	fcmped	%fcc2,	%f16,	%f16
loop_1707:
	tgu	%xcc,	0x1
	ble,a,pt	%icc,	loop_1709
loop_1708:
	fbe	%fcc3,	loop_1710
	ta	%icc,	0x7
	fble,a	%fcc1,	loop_1711
loop_1709:
	bvc,a,pt	%xcc,	loop_1712
loop_1710:
	xor	%o5,	%o1,	%i7
	tleu	%xcc,	0x0
loop_1711:
	taddcc	%l0,	%l3,	%g2
loop_1712:
	tsubcctv	%g5,	0x0F24,	%l6
	sll	%i6,	%l2,	%g6
	fnot1	%f2,	%f18
	tcc	%icc,	0x7
	udivcc	%l1,	0x1D9D,	%o3
	xorcc	%i3,	%l5,	%l4
	movvc	%xcc,	%g3,	%o6
	fornot1	%f6,	%f22,	%f26
	movcs	%xcc,	%i0,	%i4
	fxors	%f8,	%f11,	%f28
	nop
	set	0x64, %l3
	stw	%o7,	[%l7 + %l3]
	fmovdle	%icc,	%f26,	%f8
	fnot1	%f30,	%f10
	fnor	%f26,	%f10,	%f24
	ta	%xcc,	0x4
	orn	%i1,	%g7,	%o2
	brgez,a	%o4,	loop_1713
	popc	%i2,	%g4
	edge16ln	%g1,	%i5,	%o0
	fmovdleu	%xcc,	%f0,	%f28
loop_1713:
	xor	%o5,	0x12A7,	%o1
	tvc	%xcc,	0x7
	sra	%l0,	0x0A,	%i7
	bgu	loop_1714
	add	%l3,	0x1CEA,	%g5
	ble	loop_1715
	lduw	[%l7 + 0x74],	%l6
loop_1714:
	fxnor	%f18,	%f16,	%f18
	fbue	%fcc0,	loop_1716
loop_1715:
	tvs	%icc,	0x5
	tne	%xcc,	0x1
	movleu	%icc,	%g2,	%i6
loop_1716:
	brz	%l2,	loop_1717
	movrlz	%l1,	%o3,	%i3
	alignaddrl	%l5,	%g6,	%g3
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1717:
	sdivcc	%l4,	0x0111,	%i0
	fxor	%f8,	%f2,	%f14
	fblg,a	%fcc3,	loop_1718
	tle	%xcc,	0x4
	tg	%xcc,	0x2
	fbl,a	%fcc2,	loop_1719
loop_1718:
	orn	%i4,	%o6,	%o7
	edge16l	%g7,	%o2,	%i1
	bleu	%icc,	loop_1720
loop_1719:
	subccc	%i2,	%g4,	%g1
	fmovsneg	%xcc,	%f21,	%f14
	orn	%o4,	0x1D6B,	%i5
loop_1720:
	fpadd32	%f14,	%f18,	%f10
	fmovdneg	%icc,	%f10,	%f2
	movgu	%icc,	%o0,	%o1
	tleu	%icc,	0x7
	fba,a	%fcc2,	loop_1721
	edge32ln	%o5,	%i7,	%l0
	movvs	%icc,	%g5,	%l3
	movleu	%xcc,	%g2,	%l6
loop_1721:
	nop
	setx	loop_1722,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovde	%icc,	%f5,	%f9
	fxnors	%f7,	%f24,	%f24
	fmovsge	%xcc,	%f20,	%f8
loop_1722:
	fpsub32	%f18,	%f0,	%f4
	xnorcc	%l2,	%i6,	%o3
	tn	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tsubcctv	%l1,	%l5,	%g6
	brgz	%i3,	loop_1723
	movrlez	%l4,	%i0,	%i4
	movvs	%xcc,	%g3,	%o6
	array16	%g7,	%o7,	%o2
loop_1723:
	fmovdpos	%xcc,	%f1,	%f22
	tgu	%icc,	0x2
	movneg	%xcc,	%i2,	%g4
	array16	%i1,	%g1,	%i5
	wr	%g0,	0x27,	%asi
	stwa	%o0,	[%l7 + 0x2C] %asi
	membar	#Sync
	ld	[%l7 + 0x3C],	%f9
	movneg	%xcc,	%o4,	%o1
	edge8ln	%i7,	%o5,	%l0
	sllx	%g5,	%g2,	%l3
	sllx	%l6,	0x13,	%l2
	movn	%xcc,	%o3,	%l1
	tl	%xcc,	0x3
	taddcc	%i6,	%g6,	%l5
	movl	%xcc,	%i3,	%l4
	movrlz	%i4,	%g3,	%i0
	udivx	%o6,	0x0C44,	%o7
	orcc	%o2,	%i2,	%g4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f0
	movcc	%xcc,	%i1,	%g1
	ba,pn	%xcc,	loop_1724
	orn	%g7,	%o0,	%o4
	udivcc	%i5,	0x0DD8,	%o1
	set	0x24, %o2
	stha	%o5,	[%l7 + %o2] 0x19
loop_1724:
	fcmpeq16	%f8,	%f24,	%l0
	tneg	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x6C] %asi,	%f4
	sub	%g5,	0x1403,	%i7
	fmul8ulx16	%f0,	%f6,	%f22
	fexpand	%f10,	%f2
	fmovdleu	%icc,	%f15,	%f17
	movvc	%xcc,	%l3,	%g2
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	fcmpd	%fcc3,	%f20,	%f10
	tl	%xcc,	0x6
	and	%l2,	%l1,	%o3
	umulcc	%g6,	0x0F9F,	%l5
	udivx	%i6,	0x0EF6,	%i3
	subccc	%l4,	%g3,	%i4
	udiv	%o6,	0x12C1,	%i0
	membar	0x19
	tge	%xcc,	0x6
	movcs	%xcc,	%o2,	%o7
	bneg,a,pn	%xcc,	loop_1725
	tgu	%xcc,	0x7
	tle	%xcc,	0x5
	orncc	%i2,	0x0215,	%g4
loop_1725:
	tsubcc	%i1,	0x0D37,	%g1
	fmovdgu	%xcc,	%f28,	%f13
	bvc,pn	%xcc,	loop_1726
	popc	0x1082,	%o0
	tg	%icc,	0x4
	tsubcc	%g7,	%i5,	%o4
loop_1726:
	fmovdl	%icc,	%f8,	%f5
	fnot2s	%f16,	%f5
	ld	[%l7 + 0x50],	%f4
	tleu	%icc,	0x7
	set	0x38, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o5
	sll	%o1,	0x15,	%l0
	fandnot1	%f14,	%f28,	%f26
	fbn	%fcc2,	loop_1727
	fpadd16	%f22,	%f2,	%f10
	ta	%xcc,	0x1
	fbule	%fcc3,	loop_1728
loop_1727:
	tcc	%xcc,	0x3
	tl	%xcc,	0x5
	orcc	%i7,	%g5,	%g2
loop_1728:
	bpos,a,pt	%icc,	loop_1729
	udivcc	%l6,	0x0445,	%l3
	bshuffle	%f22,	%f26,	%f22
	fcmpeq32	%f4,	%f14,	%l2
loop_1729:
	fpack16	%f18,	%f25
	umul	%l1,	0x1575,	%g6
	movrgz	%l5,	%o3,	%i3
	faligndata	%f16,	%f24,	%f8
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	add	%g3,	0x1863,	%l4
	udivx	%i4,	0x0959,	%o6
	wr	%g0,	0x19,	%asi
	stda	%o2,	[%l7 + 0x60] %asi
	fmovrdlez	%o7,	%f20,	%f0
	fmul8ulx16	%f18,	%f30,	%f14
	umul	%i2,	%g4,	%i1
	array16	%g1,	%o0,	%g7
	tn	%icc,	0x4
	fcmple16	%f10,	%f2,	%i5
	movrgez	%i0,	%o5,	%o1
	fmovsne	%xcc,	%f18,	%f26
	tsubcctv	%l0,	0x0A3B,	%o4
	fmuld8sux16	%f30,	%f20,	%f14
	addcc	%g5,	%g2,	%l6
	bleu,pn	%icc,	loop_1730
	umul	%l3,	%l2,	%l1
	fones	%f28
	fcmpne32	%f28,	%f6,	%g6
loop_1730:
	fpackfix	%f28,	%f26
	xor	%l5,	%i7,	%i3
	fble,a	%fcc3,	loop_1731
	sra	%o3,	%i6,	%l4
	fmovscs	%icc,	%f9,	%f14
	edge32	%g3,	%i4,	%o6
loop_1731:
	be,a,pn	%icc,	loop_1732
	std	%o2,	[%l7 + 0x30]
	fpmerge	%f26,	%f26,	%f0
	fmovrdlez	%i2,	%f28,	%f26
loop_1732:
	srlx	%o7,	0x15,	%g4
	brz,a	%g1,	loop_1733
	tneg	%xcc,	0x0
	fbug,a	%fcc0,	loop_1734
	fmuld8sux16	%f4,	%f23,	%f16
loop_1733:
	move	%xcc,	%i1,	%o0
	ldsw	[%l7 + 0x18],	%g7
loop_1734:
	edge8ln	%i0,	%i5,	%o5
	ldsw	[%l7 + 0x54],	%o1
	brgez	%l0,	loop_1735
	bgu,pn	%xcc,	loop_1736
	faligndata	%f12,	%f28,	%f28
	fors	%f7,	%f22,	%f0
loop_1735:
	move	%xcc,	%o4,	%g5
loop_1736:
	orncc	%g2,	%l3,	%l6
	fsrc1s	%f30,	%f27
	fpmerge	%f26,	%f12,	%f10
	array8	%l1,	%l2,	%g6
	array8	%l5,	%i3,	%i7
	sllx	%o3,	0x16,	%i6
	tleu	%xcc,	0x3
	fnands	%f0,	%f9,	%f6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	sll	%i4,	0x04,	%g3
	sethi	0x1ACA,	%o2
	andcc	%o6,	%i2,	%o7
	fone	%f14
	edge8ln	%g4,	%i1,	%g1
	tsubcc	%g7,	%i0,	%i5
	lduw	[%l7 + 0x54],	%o5
	tg	%icc,	0x5
	ldsh	[%l7 + 0x52],	%o0
	tsubcctv	%l0,	0x0528,	%o1
	bgu,pt	%xcc,	loop_1737
	movcc	%icc,	%o4,	%g2
	fmovsneg	%xcc,	%f14,	%f26
	fmovdvs	%icc,	%f13,	%f9
loop_1737:
	fmovrdgz	%g5,	%f10,	%f10
	lduw	[%l7 + 0x68],	%l6
	tle	%xcc,	0x6
	bl,a	%icc,	loop_1738
	movcs	%xcc,	%l1,	%l3
	wr	%g0,	0x2a,	%asi
	stba	%g6,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_1738:
	tvs	%icc,	0x2
	sdiv	%l2,	0x0D14,	%i3
	fpsub16s	%f10,	%f6,	%f29
	fmovdpos	%xcc,	%f31,	%f9
	movl	%icc,	%l5,	%i7
	andncc	%i6,	%o3,	%l4
	add	%i4,	0x1A20,	%g3
	ldd	[%l7 + 0x48],	%o2
	addccc	%o6,	0x0FC0,	%o7
	movrne	%i2,	%i1,	%g4
	brgz	%g7,	loop_1739
	movrgez	%i0,	%i5,	%o5
	set	0x4F, %g4
	lduba	[%l7 + %g4] 0x0c,	%g1
loop_1739:
	tsubcc	%o0,	%l0,	%o4
	fmovrse	%g2,	%f9,	%f23
	tle	%xcc,	0x0
	umulcc	%o1,	0x1AA7,	%g5
	move	%xcc,	%l1,	%l3
	movleu	%xcc,	%g6,	%l6
	fornot2	%f4,	%f2,	%f10
	move	%icc,	%l2,	%i3
	popc	%l5,	%i7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%i6
	set	0x76, %i1
	stba	%o3,	[%l7 + %i1] 0x88
	sra	%i4,	0x1F,	%l4
	fba	%fcc2,	loop_1740
	tne	%icc,	0x0
	ta	%icc,	0x0
	srax	%o2,	0x19,	%o6
loop_1740:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x1e,	%f16
	stbar
	smulcc	%o7,	%i2,	%i1
	fmovs	%f10,	%f6
	movrgez	%g4,	0x115,	%g3
	fnot2	%f2,	%f12
	srlx	%i0,	%g7,	%o5
	edge8	%g1,	%o0,	%i5
	bleu	%xcc,	loop_1741
	taddcctv	%l0,	0x1EF1,	%o4
	orncc	%o1,	%g5,	%g2
	addcc	%l1,	%l3,	%l6
loop_1741:
	movrgez	%l2,	%g6,	%i3
	fpadd32s	%f1,	%f11,	%f9
	bcc	loop_1742
	bne,a	loop_1743
	fnor	%f8,	%f12,	%f18
	smul	%l5,	0x1E05,	%i7
loop_1742:
	tvc	%icc,	0x4
loop_1743:
	array16	%o3,	%i4,	%i6
	xnorcc	%l4,	%o2,	%o6
	sdivx	%i2,	0x0E54,	%o7
	prefetch	[%l7 + 0x7C],	 0x3
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bleu	loop_1744
	fmuld8ulx16	%f16,	%f19,	%f14
	xorcc	%g4,	%i1,	%g3
	fmovscc	%icc,	%f17,	%f19
loop_1744:
	srlx	%g7,	%o5,	%i0
	edge16	%g1,	%i5,	%l0
	set	0x58, %g3
	stha	%o0,	[%l7 + %g3] 0x23
	membar	#Sync
	fbue,a	%fcc1,	loop_1745
	tsubcctv	%o1,	%o4,	%g2
	udivx	%l1,	0x0209,	%g5
	andcc	%l3,	%l2,	%g6
loop_1745:
	movrgez	%i3,	%l6,	%i7
	fmovrdne	%l5,	%f0,	%f16
	tge	%icc,	0x6
	fands	%f9,	%f10,	%f8
	fmovda	%xcc,	%f28,	%f19
	fbge,a	%fcc2,	loop_1746
	addc	%o3,	0x0EE5,	%i6
	edge16n	%l4,	%o2,	%o6
	fmovdvc	%icc,	%f20,	%f25
loop_1746:
	edge32n	%i2,	%i4,	%g4
	fnot1s	%f12,	%f14
	add	%i1,	0x1B52,	%g3
	fbug,a	%fcc0,	loop_1747
	fmul8sux16	%f14,	%f24,	%f2
	edge32ln	%o7,	%o5,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1747:
	nop
	set	0x110, %i5
	stxa	%g1,	[%g0 + %i5] 0x21
	fandnot1s	%f6,	%f16,	%f0
	umul	%i0,	0x0BCA,	%i5
	fbo	%fcc1,	loop_1748
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f27,	%f6,	%f30
	srax	%o0,	%l0,	%o4
loop_1748:
	sdivcc	%g2,	0x1F9B,	%l1
	sdivx	%g5,	0x15DD,	%o1
	movvc	%xcc,	%l3,	%g6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	%i7,	%l5
	array8	%l2,	%o3,	%l4
	subc	%i6,	0x1932,	%o2
	set	0x28, %g1
	ldxa	[%g0 + %g1] 0x20,	%o6
	fmovda	%xcc,	%f7,	%f23
	fmovdvc	%xcc,	%f22,	%f24
	tsubcctv	%i2,	0x0AEB,	%i4
	tl	%icc,	0x4
	fmovrdlez	%g4,	%f28,	%f14
	fpadd16	%f24,	%f24,	%f10
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x40] %asi,	%g3
	fmovrde	%i1,	%f0,	%f8
	fcmpd	%fcc1,	%f22,	%f8
	movrlez	%o7,	%g7,	%g1
	movleu	%icc,	%o5,	%i0
	movrlz	%o0,	0x31F,	%i5
	srax	%l0,	%g2,	%l1
	movne	%xcc,	%o4,	%o1
	edge32n	%l3,	%g5,	%g6
	bleu,pn	%icc,	loop_1749
	tsubcctv	%i3,	%i7,	%l5
	set	0x5F, %g5
	ldstuba	[%l7 + %g5] 0x04,	%l6
loop_1749:
	movne	%xcc,	%o3,	%l4
	ldub	[%l7 + 0x27],	%i6
	nop
	set	0x43, %g6
	ldstub	[%l7 + %g6],	%o2
	fcmpeq16	%f16,	%f12,	%o6
	fmovdge	%xcc,	%f17,	%f27
	subcc	%l2,	0x0C76,	%i4
	fnegs	%f21,	%f22
	movg	%xcc,	%g4,	%i2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%i1
	lduw	[%l7 + 0x74],	%g7
	brnz,a	%o7,	loop_1750
	movcc	%xcc,	%g1,	%i0
	fmovdle	%icc,	%f14,	%f13
	tne	%xcc,	0x5
loop_1750:
	subc	%o0,	%i5,	%o5
	te	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f4,	%f16,	%f18
	fmovs	%f11,	%f16
	ldsb	[%l7 + 0x28],	%l0
	fmovsl	%icc,	%f0,	%f8
	bgu,a,pt	%xcc,	loop_1751
	move	%icc,	%g2,	%o4
	and	%l1,	%l3,	%g5
	movgu	%xcc,	%g6,	%o1
loop_1751:
	mulx	%i3,	0x179F,	%l5
	fmul8x16	%f29,	%f20,	%f6
	add	%i7,	0x0FB7,	%o3
	fxor	%f4,	%f8,	%f0
	movl	%icc,	%l4,	%i6
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbue,a	%fcc3,	loop_1752
	array16	%o2,	%o6,	%l2
	tge	%icc,	0x7
	fmovdg	%xcc,	%f17,	%f6
loop_1752:
	bge,a,pn	%xcc,	loop_1753
	ld	[%l7 + 0x18],	%f28
	edge8	%i4,	%l6,	%g4
	set	0x60, %l5
	stxa	%i2,	[%l7 + %l5] 0x81
loop_1753:
	udivx	%i1,	0x07C0,	%g3
	fpsub32s	%f9,	%f26,	%f26
	fbul	%fcc0,	loop_1754
	fmovrsgz	%o7,	%f31,	%f24
	fmovsg	%icc,	%f14,	%f18
	mulx	%g7,	0x145D,	%i0
loop_1754:
	umul	%g1,	0x0F67,	%o0
	tl	%icc,	0x6
	fmovsvc	%icc,	%f15,	%f24
	fmovsleu	%xcc,	%f10,	%f18
	fpsub32s	%f22,	%f15,	%f21
	xnorcc	%i5,	0x1ED3,	%l0
	edge8l	%g2,	%o5,	%l1
	swap	[%l7 + 0x3C],	%o4
	membar	0x44
	subcc	%l3,	0x13A0,	%g5
	fxnor	%f0,	%f8,	%f4
	sub	%g6,	0x1D59,	%i3
	edge32	%o1,	%l5,	%o3
	subc	%i7,	%i6,	%l4
	movneg	%icc,	%o2,	%l2
	bge	%icc,	loop_1755
	movn	%icc,	%i4,	%l6
	sub	%o6,	0x0F1C,	%g4
	taddcc	%i1,	%g3,	%o7
loop_1755:
	fbo,a	%fcc1,	loop_1756
	tvc	%xcc,	0x0
	sra	%g7,	%i2,	%i0
	edge8l	%g1,	%o0,	%i5
loop_1756:
	movrgez	%l0,	%g2,	%o5
	nop
	setx	loop_1757,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc3,	loop_1758
	srax	%o4,	%l1,	%l3
	te	%xcc,	0x7
loop_1757:
	fabsd	%f20,	%f8
loop_1758:
	movle	%xcc,	%g6,	%i3
	fzeros	%f21
	membar	0x05
	fcmple16	%f26,	%f22,	%o1
	tleu	%xcc,	0x0
	tle	%xcc,	0x3
	fxor	%f2,	%f30,	%f4
	fornot1	%f0,	%f4,	%f6
	bge	%xcc,	loop_1759
	udiv	%l5,	0x199D,	%o3
	srax	%i7,	0x1E,	%g5
	fmovrslez	%i6,	%f7,	%f5
loop_1759:
	edge32n	%l4,	%l2,	%i4
	fmovdge	%icc,	%f28,	%f4
	set	0x12, %l0
	ldsha	[%l7 + %l0] 0x81,	%o2
	movrlez	%o6,	0x30F,	%g4
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0x0
	edge8ln	%l6,	%g3,	%o7
	movneg	%icc,	%i2,	%g7
	subccc	%i0,	%o0,	%i5
	te	%icc,	0x6
	srlx	%l0,	%g1,	%g2
	xnorcc	%o5,	0x0D29,	%l1
	sub	%o4,	%l3,	%i3
	wr	%g0,	0x80,	%asi
	stda	%g6,	[%l7 + 0x18] %asi
	movleu	%xcc,	%o1,	%o3
	fcmple32	%f22,	%f26,	%l5
	movcs	%icc,	%i7,	%g5
	ldsh	[%l7 + 0x76],	%l4
	for	%f8,	%f20,	%f22
	smul	%l2,	0x0E4B,	%i6
	addccc	%i4,	0x1CA0,	%o2
	fcmpes	%fcc3,	%f21,	%f22
	udivcc	%o6,	0x1486,	%i1
	movrlz	%l6,	0x04A,	%g3
	fmul8x16al	%f18,	%f20,	%f24
	fbne	%fcc2,	loop_1760
	fornot2	%f14,	%f30,	%f26
	set	0x4A, %l4
	ldsha	[%l7 + %l4] 0x88,	%o7
loop_1760:
	fcmpeq16	%f12,	%f20,	%g4
	nop
	setx	loop_1761,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%i2,	%g7,	%i0
	tne	%icc,	0x7
	udivx	%o0,	0x1B4F,	%i5
loop_1761:
	addc	%l0,	0x04E5,	%g1
	set	0x18, %i7
	stha	%o5,	[%l7 + %i7] 0xe3
	membar	#Sync
	std	%g2,	[%l7 + 0x18]
	ba,a,pt	%xcc,	loop_1762
	movrgez	%l1,	0x1CC,	%o4
	fmovsa	%icc,	%f31,	%f29
	fbu,a	%fcc2,	loop_1763
loop_1762:
	movcs	%xcc,	%i3,	%g6
	orn	%o1,	0x1187,	%o3
	tleu	%icc,	0x1
loop_1763:
	movneg	%xcc,	%l3,	%i7
	tneg	%icc,	0x7
	movre	%l5,	0x391,	%l4
	fbo,a	%fcc0,	loop_1764
	mulx	%l2,	%g5,	%i4
	move	%icc,	%o2,	%i6
	fnot2s	%f15,	%f1
loop_1764:
	udiv	%o6,	0x0731,	%l6
	fmovsa	%xcc,	%f1,	%f3
	ba,pn	%icc,	loop_1765
	bneg,a	loop_1766
	srlx	%i1,	0x0F,	%g3
	orncc	%g4,	0x1290,	%o7
loop_1765:
	lduh	[%l7 + 0x56],	%i2
loop_1766:
	std	%f6,	[%l7 + 0x08]
	bge,a,pt	%icc,	loop_1767
	mulx	%g7,	%o0,	%i5
	subccc	%i0,	0x0451,	%l0
	movrlz	%g1,	%g2,	%o5
loop_1767:
	udivcc	%o4,	0x0413,	%l1
	smulcc	%g6,	0x1CC9,	%o1
	fbue	%fcc1,	loop_1768
	orncc	%o3,	%l3,	%i3
	fmovsle	%xcc,	%f7,	%f30
	fcmpd	%fcc0,	%f4,	%f30
loop_1768:
	nop
	set	0x1C, %g2
	stwa	%i7,	[%l7 + %g2] 0x04
	edge8n	%l5,	%l2,	%g5
	sub	%l4,	%i4,	%o2
	tl	%icc,	0x1
	tsubcctv	%i6,	%o6,	%i1
	andn	%l6,	%g4,	%g3
	fsrc2s	%f23,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o7,	%i2,	%g7
	wr	%g0,	0x57,	%asi
	stxa	%i5,	[%g0 + 0x0] %asi
	set	0x0C, %i4
	stwa	%o0,	[%l7 + %i4] 0x0c
	movleu	%icc,	%l0,	%g1
	movpos	%xcc,	%i0,	%o5
	edge16l	%o4,	%l1,	%g6
	fandnot1s	%f15,	%f3,	%f14
	xnorcc	%o1,	0x029D,	%g2
	subc	%l3,	0x0F5C,	%i3
	array8	%o3,	%i7,	%l5
	add	%g5,	0x0826,	%l4
	andncc	%l2,	%i4,	%i6
	xnorcc	%o6,	%o2,	%i1
	alignaddrl	%g4,	%g3,	%l6
	tgu	%xcc,	0x2
	edge16l	%i2,	%o7,	%g7
	lduh	[%l7 + 0x1A],	%i5
	movleu	%xcc,	%l0,	%o0
	edge8n	%g1,	%i0,	%o4
	xorcc	%l1,	0x0949,	%o5
	fpmerge	%f19,	%f26,	%f0
	sdiv	%g6,	0x193D,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l3,	%g2,	%o3
	movpos	%icc,	%i7,	%i3
	array32	%g5,	%l4,	%l5
	bl,pt	%icc,	loop_1769
	sdivx	%l2,	0x0AC5,	%i6
	flush	%l7 + 0x34
	movvs	%icc,	%o6,	%o2
loop_1769:
	std	%f14,	[%l7 + 0x48]
	srax	%i4,	%g4,	%i1
	udiv	%g3,	0x061A,	%i2
	sdivx	%o7,	0x0644,	%g7
	bvs,a	loop_1770
	fnegd	%f8,	%f28
	bl,pn	%xcc,	loop_1771
	bvc	%icc,	loop_1772
loop_1770:
	subcc	%l6,	%l0,	%o0
	xnorcc	%i5,	%i0,	%g1
loop_1771:
	edge8	%l1,	%o4,	%g6
loop_1772:
	ldsh	[%l7 + 0x5A],	%o1
	movleu	%xcc,	%o5,	%l3
	fmovs	%f2,	%f25
	fandnot1	%f14,	%f28,	%f26
	edge8ln	%g2,	%o3,	%i3
	tne	%icc,	0x1
	sdiv	%g5,	0x0549,	%l4
	edge16ln	%l5,	%i7,	%i6
	fmovrsgez	%o6,	%f22,	%f28
	fornot1	%f20,	%f10,	%f6
	fmovdpos	%xcc,	%f31,	%f25
	te	%xcc,	0x2
	smulcc	%l2,	%o2,	%g4
	movrne	%i1,	0x0FF,	%i4
	bg,a	loop_1773
	fabss	%f30,	%f1
	fnot2	%f20,	%f10
	fpsub32s	%f6,	%f31,	%f0
loop_1773:
	udiv	%i2,	0x19E3,	%o7
	orcc	%g7,	0x01F7,	%l6
	fabsd	%f14,	%f28
	fbul,a	%fcc1,	loop_1774
	brlez	%l0,	loop_1775
	orn	%o0,	0x08AC,	%i5
	movvc	%icc,	%g3,	%g1
loop_1774:
	nop
	set	0x30, %o5
	ldswa	[%l7 + %o5] 0x88,	%i0
loop_1775:
	movrlz	%l1,	%o4,	%g6
	movgu	%xcc,	%o5,	%o1
	andn	%l3,	%g2,	%i3
	fnands	%f0,	%f15,	%f10
	set	0x5C, %i0
	ldswa	[%l7 + %i0] 0x88,	%o3
	fabss	%f23,	%f25
	srax	%l4,	%g5,	%i7
	edge32ln	%i6,	%l5,	%o6
	faligndata	%f0,	%f22,	%f0
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%o2
	mulscc	%g4,	%i1,	%i4
	tsubcctv	%i2,	%o7,	%g7
	ldstub	[%l7 + 0x47],	%l6
	te	%icc,	0x1
	tsubcctv	%l0,	0x0CF6,	%l2
	edge16	%i5,	%g3,	%g1
	bvc,a,pn	%icc,	loop_1776
	tvc	%xcc,	0x0
	fble	%fcc2,	loop_1777
	fcmpgt32	%f30,	%f6,	%o0
loop_1776:
	fmovdn	%xcc,	%f0,	%f27
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x44] %asi,	%i0
loop_1777:
	tsubcctv	%o4,	0x0B65,	%l1
	ble,a	%icc,	loop_1778
	sethi	0x003E,	%o5
	edge16	%o1,	%l3,	%g6
	fnot1	%f10,	%f20
loop_1778:
	fmovsge	%icc,	%f0,	%f23
	orn	%i3,	0x047C,	%o3
	movrlez	%g2,	0x2D9,	%g5
	edge32	%l4,	%i7,	%i6
	edge32l	%o6,	%l5,	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i1,	%g4
	fxnors	%f9,	%f19,	%f31
	tg	%icc,	0x4
	ldsw	[%l7 + 0x20],	%i4
	st	%f28,	[%l7 + 0x0C]
	fmovrsgez	%o7,	%f28,	%f20
	swap	[%l7 + 0x38],	%g7
	fpack32	%f30,	%f16,	%f24
	xnorcc	%i2,	%l6,	%l0
	smul	%l2,	%g3,	%i5
	fmovrsgz	%o0,	%f0,	%f15
	orcc	%i0,	%o4,	%g1
	ta	%xcc,	0x7
	tle	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	stxa	%l1,	[%l7 + 0x28] %asi
	fmovdvc	%xcc,	%f11,	%f24
	fmovdgu	%xcc,	%f31,	%f22
	tn	%xcc,	0x3
	fmovdleu	%xcc,	%f11,	%f25
	fandnot2	%f14,	%f10,	%f28
	flush	%l7 + 0x64
	edge8n	%o1,	%l3,	%g6
	tle	%xcc,	0x6
	subc	%o5,	0x0DFB,	%i3
	fbge,a	%fcc1,	loop_1779
	movrgz	%o3,	%g2,	%g5
	mulx	%i7,	0x1106,	%i6
	fandnot1	%f30,	%f10,	%f0
loop_1779:
	fbge,a	%fcc1,	loop_1780
	popc	0x003D,	%l4
	xnorcc	%o6,	0x087F,	%o2
	movrlz	%l5,	%i1,	%g4
loop_1780:
	fbn	%fcc1,	loop_1781
	movl	%icc,	%i4,	%g7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i2,	%o7
loop_1781:
	fbu	%fcc3,	loop_1782
	tcc	%xcc,	0x5
	fornot2s	%f11,	%f13,	%f10
	fmovsa	%icc,	%f8,	%f4
loop_1782:
	xorcc	%l0,	0x046C,	%l6
	membar	0x53
	alignaddr	%l2,	%g3,	%o0
	movvc	%xcc,	%i5,	%o4
	mova	%icc,	%g1,	%i0
	movrgez	%o1,	0x12C,	%l3
	fmovsleu	%icc,	%f26,	%f21
	fmovdge	%xcc,	%f9,	%f26
	srl	%l1,	0x1B,	%g6
	umul	%i3,	0x0E3B,	%o5
	lduw	[%l7 + 0x54],	%o3
	fbe	%fcc1,	loop_1783
	bg	loop_1784
	movre	%g5,	0x2FB,	%g2
	move	%icc,	%i6,	%l4
loop_1783:
	membar	0x7A
loop_1784:
	edge8	%i7,	%o6,	%l5
	edge16l	%o2,	%i1,	%i4
	fmul8sux16	%f24,	%f0,	%f8
	fpsub32s	%f17,	%f21,	%f9
	brgz,a	%g7,	loop_1785
	edge16	%i2,	%o7,	%l0
	sra	%g4,	0x03,	%l2
	edge8	%g3,	%l6,	%o0
loop_1785:
	movrgz	%i5,	0x02A,	%g1
	fbl	%fcc3,	loop_1786
	edge16ln	%o4,	%o1,	%i0
	sethi	0x0552,	%l1
	fmovse	%icc,	%f16,	%f20
loop_1786:
	nop
	set	0x54, %g7
	stwa	%l3,	[%l7 + %g7] 0x89
	movle	%xcc,	%i3,	%g6
	fbu,a	%fcc3,	loop_1787
	sdivcc	%o3,	0x05EF,	%o5
	tg	%icc,	0x3
	movle	%icc,	%g2,	%i6
loop_1787:
	fors	%f13,	%f7,	%f24
	and	%g5,	0x1F7A,	%i7
	fnand	%f0,	%f22,	%f24
	ldd	[%l7 + 0x08],	%f10
	and	%o6,	%l4,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%i4
	movcc	%icc,	%g7,	%i2
	bge,a,pt	%xcc,	loop_1788
	array32	%o7,	%i1,	%l0
	fbule,a	%fcc1,	loop_1789
	ldub	[%l7 + 0x5A],	%g4
loop_1788:
	be	%xcc,	loop_1790
	bl,pt	%icc,	loop_1791
loop_1789:
	andcc	%g3,	0x0450,	%l2
	edge32	%o0,	%l6,	%g1
loop_1790:
	edge16ln	%i5,	%o4,	%i0
loop_1791:
	fmovde	%icc,	%f13,	%f8
	orcc	%o1,	%l3,	%i3
	movrne	%g6,	%l1,	%o3
	mova	%xcc,	%o5,	%g2
	fpmerge	%f27,	%f0,	%f10
	nop
	set	0x54, %o0
	ldsb	[%l7 + %o0],	%g5
	ble	loop_1792
	fcmps	%fcc3,	%f5,	%f11
	fpsub16s	%f9,	%f13,	%f18
	fbo,a	%fcc1,	loop_1793
loop_1792:
	fpack32	%f12,	%f10,	%f22
	mova	%icc,	%i6,	%i7
	array32	%l4,	%o6,	%l5
loop_1793:
	edge32n	%i4,	%o2,	%i2
	fmuld8sux16	%f3,	%f30,	%f2
	fpadd16s	%f13,	%f26,	%f3
	brgz	%g7,	loop_1794
	array8	%i1,	%o7,	%g4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%l2
loop_1794:
	fandnot1	%f4,	%f24,	%f22
	tneg	%icc,	0x0
	fandnot2	%f18,	%f6,	%f10
	subccc	%g3,	%l6,	%o0
	bpos	%icc,	loop_1795
	andncc	%g1,	%o4,	%i5
	fmul8ulx16	%f22,	%f10,	%f20
	fcmpgt32	%f28,	%f20,	%i0
loop_1795:
	fbl	%fcc2,	loop_1796
	tsubcc	%o1,	%l3,	%i3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%l1
loop_1796:
	fcmpgt32	%f8,	%f24,	%o3
	fbul	%fcc3,	loop_1797
	fbo	%fcc2,	loop_1798
	fones	%f14
	tvc	%icc,	0x7
loop_1797:
	fbl,a	%fcc0,	loop_1799
loop_1798:
	edge32	%o5,	%g6,	%g2
	xor	%i6,	%i7,	%l4
	sllx	%o6,	%g5,	%l5
loop_1799:
	fbu,a	%fcc0,	loop_1800
	andncc	%i4,	%i2,	%o2
	sra	%g7,	%o7,	%i1
	edge32ln	%g4,	%l2,	%g3
loop_1800:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l6,	0x02BE,	%l0
	orncc	%g1,	%o4,	%i5
	std	%o0,	[%l7 + 0x40]
	sethi	0x1177,	%o1
	fmovdne	%icc,	%f19,	%f9
	tvs	%icc,	0x2
	array8	%i0,	%l3,	%l1
	array32	%i3,	%o5,	%o3
	edge16l	%g6,	%g2,	%i6
	tne	%xcc,	0x3
	popc	0x1B04,	%l4
	nop
	setx	loop_1801,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fzero	%f6
	edge8l	%i7,	%o6,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1801:
	movle	%xcc,	%i4,	%i2
	sra	%o2,	0x0D,	%g7
	tne	%xcc,	0x6
	fmuld8sux16	%f27,	%f11,	%f0
	subc	%o7,	%i1,	%g4
	nop
	setx loop_1802, %l0, %l1
	jmpl %l1, %l2
	fpsub16s	%f21,	%f15,	%f0
	or	%g5,	%g3,	%l6
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x0c,	%l0
loop_1802:
	addccc	%o4,	%i5,	%g1
	addcc	%o0,	%i0,	%l3
	nop
	setx	loop_1803,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stw	%o1,	[%l7 + 0x08]
	tsubcctv	%l1,	%o5,	%o3
	ldd	[%l7 + 0x48],	%i2
loop_1803:
	fmovsg	%xcc,	%f0,	%f0
	srl	%g6,	%g2,	%i6
	fpadd32	%f24,	%f18,	%f30
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	or	%l4,	%i7,	%o6
	tneg	%icc,	0x3
	movpos	%xcc,	%l5,	%i2
	add	%i4,	0x10C2,	%g7
	bg	%xcc,	loop_1804
	edge32ln	%o7,	%o2,	%g4
	fsrc1s	%f24,	%f7
	movneg	%xcc,	%l2,	%g5
loop_1804:
	orn	%i1,	%l6,	%l0
	fors	%f27,	%f19,	%f15
	brz	%g3,	loop_1805
	tcs	%icc,	0x6
	fmovscs	%xcc,	%f24,	%f15
	sllx	%o4,	0x19,	%g1
loop_1805:
	bcs	%xcc,	loop_1806
	movgu	%xcc,	%o0,	%i5
	sra	%i0,	0x13,	%o1
	tge	%xcc,	0x2
loop_1806:
	fcmped	%fcc3,	%f2,	%f0
	addc	%l1,	0x1049,	%o5
	brz,a	%o3,	loop_1807
	fcmple16	%f16,	%f6,	%i3
	addc	%l3,	%g6,	%g2
	fnegd	%f14,	%f8
loop_1807:
	fornot1s	%f16,	%f30,	%f9
	fpsub32s	%f24,	%f8,	%f15
	smul	%i6,	%l4,	%o6
	set	0x10, %i2
	sta	%f3,	[%l7 + %i2] 0x88
	ldd	[%l7 + 0x68],	%f28
	movl	%icc,	%l5,	%i7
	edge32	%i4,	%i2,	%g7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%g4
	be,pn	%icc,	loop_1808
	movcs	%icc,	%l2,	%g5
	fand	%f12,	%f20,	%f14
	fxor	%f14,	%f10,	%f6
loop_1808:
	fzero	%f22
	add	%i1,	0x1F03,	%o2
	sllx	%l6,	%g3,	%o4
	mova	%xcc,	%g1,	%l0
	fmovsgu	%icc,	%f1,	%f26
	fand	%f10,	%f16,	%f30
	xnor	%i5,	0x1A76,	%o0
	srax	%i0,	0x18,	%l1
	edge16ln	%o1,	%o5,	%o3
	set	0x15, %o6
	ldstuba	[%l7 + %o6] 0x18,	%l3
	fandnot1s	%f16,	%f20,	%f5
	udiv	%g6,	0x0A81,	%g2
	orncc	%i6,	%l4,	%i3
	xnorcc	%l5,	%i7,	%i4
	sethi	0x0FEC,	%o6
	set	0x18, %l1
	sta	%f18,	[%l7 + %l1] 0x14
	movcc	%xcc,	%g7,	%o7
	xor	%g4,	0x0A62,	%i2
	movvs	%icc,	%g5,	%l2
	lduh	[%l7 + 0x40],	%o2
	sdiv	%i1,	0x1796,	%l6
	bvs	%icc,	loop_1809
	ldstub	[%l7 + 0x56],	%g3
	movrlz	%o4,	%g1,	%i5
	tcs	%xcc,	0x5
loop_1809:
	andncc	%l0,	%o0,	%l1
	bcs,a	loop_1810
	movpos	%xcc,	%o1,	%o5
	movge	%icc,	%o3,	%l3
	movle	%xcc,	%g6,	%i0
loop_1810:
	fpack32	%f22,	%f4,	%f24
	fbg	%fcc1,	loop_1811
	fcmpd	%fcc3,	%f10,	%f4
	orn	%g2,	%i6,	%i3
	movle	%icc,	%l4,	%l5
loop_1811:
	movl	%xcc,	%i4,	%i7
	fble,a	%fcc0,	loop_1812
	movrgez	%o6,	0x34C,	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g4,	%i2
loop_1812:
	fmovdn	%xcc,	%f18,	%f5
	tle	%xcc,	0x7
	fnot2s	%f15,	%f18
	orn	%g5,	%l2,	%o2
	udivx	%i1,	0x0778,	%g7
	tl	%xcc,	0x7
	fmovdleu	%xcc,	%f8,	%f22
	fmovrsgz	%l6,	%f24,	%f19
	fmovda	%icc,	%f14,	%f11
	bleu,a	%xcc,	loop_1813
	brnz,a	%g3,	loop_1814
	edge16n	%o4,	%g1,	%l0
	taddcctv	%o0,	%l1,	%o1
loop_1813:
	xnorcc	%o5,	0x12D4,	%i5
loop_1814:
	xnor	%o3,	%l3,	%g6
	sub	%g2,	0x0D26,	%i6
	xor	%i3,	0x13EF,	%l4
	alignaddrl	%i0,	%i4,	%i7
	fmovdg	%icc,	%f28,	%f15
	fnot2	%f28,	%f20
	fmovse	%xcc,	%f1,	%f0
	stbar
	fornot2s	%f26,	%f31,	%f7
	andn	%l5,	%o7,	%g4
	fbo	%fcc3,	loop_1815
	fxnor	%f24,	%f28,	%f26
	udivcc	%o6,	0x1AC6,	%i2
	fsrc2	%f28,	%f30
loop_1815:
	srax	%g5,	0x15,	%o2
	mulx	%i1,	%l2,	%l6
	ldsh	[%l7 + 0x0C],	%g3
	mulscc	%o4,	0x0DF8,	%g1
	edge32l	%g7,	%o0,	%l1
	fnot2	%f24,	%f14
	sir	0x0C38
	tn	%icc,	0x6
	brgz	%o1,	loop_1816
	bg,pn	%icc,	loop_1817
	fmovrdgz	%o5,	%f30,	%f28
	fmovdcs	%xcc,	%f14,	%f4
loop_1816:
	edge8	%l0,	%o3,	%l3
loop_1817:
	srax	%i5,	0x1E,	%g6
	tvs	%xcc,	0x6
	set	0x1C, %l2
	lduha	[%l7 + %l2] 0x11,	%i6
	fcmpeq16	%f28,	%f10,	%i3
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x15
	std	%l4,	[%l7 + 0x78]
	bleu,a,pn	%xcc,	loop_1818
	fmovspos	%icc,	%f15,	%f16
	fcmpd	%fcc3,	%f12,	%f8
	movneg	%icc,	%g2,	%i4
loop_1818:
	fpsub32s	%f10,	%f22,	%f13
	taddcctv	%i7,	%l5,	%i0
	std	%f20,	[%l7 + 0x18]
	taddcctv	%o7,	%o6,	%g4
	fpackfix	%f30,	%f26
	ldx	[%l7 + 0x30],	%g5
	orn	%i2,	0x0874,	%o2
	fmovdle	%icc,	%f3,	%f26
	edge8	%l2,	%i1,	%l6
	movrne	%g3,	0x2B5,	%o4
	fmovscs	%icc,	%f26,	%f28
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%o0
	umulcc	%l1,	0x1360,	%o1
	fcmpes	%fcc0,	%f24,	%f20
	taddcctv	%o5,	%l0,	%g7
	fmul8x16au	%f10,	%f23,	%f24
	sdivx	%o3,	0x125A,	%l3
	fzero	%f30
	fmuld8ulx16	%f25,	%f22,	%f14
	srl	%g6,	%i5,	%i6
	orcc	%i3,	%g2,	%i4
	tge	%icc,	0x6
	umul	%l4,	0x18E9,	%l5
	te	%icc,	0x6
	ldx	[%l7 + 0x18],	%i7
	fbg	%fcc1,	loop_1819
	taddcc	%o7,	0x05C7,	%i0
	sth	%g4,	[%l7 + 0x48]
	udivcc	%g5,	0x04EA,	%i2
loop_1819:
	movvs	%xcc,	%o2,	%o6
	bcs,pn	%xcc,	loop_1820
	sra	%l2,	0x1D,	%i1
	andn	%g3,	%o4,	%g1
	fcmpd	%fcc2,	%f20,	%f4
loop_1820:
	tgu	%icc,	0x2
	fsrc2s	%f8,	%f10
	and	%o0,	0x1F6A,	%l1
	ld	[%l7 + 0x58],	%f31
	set	0x2E, %o7
	lduha	[%l7 + %o7] 0x88,	%o1
	set	0x20, %i6
	ldswa	[%l7 + %i6] 0x80,	%o5
	movleu	%xcc,	%l6,	%l0
	tcs	%icc,	0x7
	sub	%g7,	0x0E9F,	%o3
	movl	%xcc,	%l3,	%g6
	movneg	%xcc,	%i5,	%i3
	set	0x2C, %o4
	stwa	%g2,	[%l7 + %o4] 0x0c
	orncc	%i4,	0x143A,	%l4
	tvc	%xcc,	0x3
	fcmpne16	%f20,	%f30,	%i6
	sir	0x1683
	tne	%xcc,	0x2
	alignaddr	%i7,	%l5,	%i0
	mulscc	%o7,	0x1F99,	%g5
	nop
	setx	loop_1821,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdge	%xcc,	%f13,	%f8
	addccc	%i2,	0x0FEE,	%g4
	tvc	%icc,	0x6
loop_1821:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%o6,	[%g0 + 0x38] %asi
	edge32l	%l2,	%o2,	%g3
	xnor	%i1,	0x0A77,	%o4
	move	%icc,	%o0,	%l1
	fmuld8ulx16	%f13,	%f12,	%f6
	orncc	%o1,	%g1,	%o5
	tge	%icc,	0x6
	udiv	%l6,	0x06AE,	%g7
	fornot2	%f18,	%f4,	%f24
	movge	%icc,	%l0,	%l3
	sdivcc	%g6,	0x0C81,	%i5
	bl,pn	%icc,	loop_1822
	tle	%icc,	0x7
	movne	%xcc,	%o3,	%g2
	srax	%i4,	%l4,	%i6
loop_1822:
	fmovdn	%icc,	%f23,	%f4
	fnand	%f14,	%f4,	%f22
	edge32ln	%i3,	%i7,	%l5
	fbu,a	%fcc3,	loop_1823
	smulcc	%o7,	0x0F8B,	%g5
	xorcc	%i2,	%g4,	%o6
	set	0x118, %o2
	ldxa	[%g0 + %o2] 0x52,	%l2
loop_1823:
	srl	%i0,	%g3,	%i1
	edge8n	%o2,	%o4,	%o0
	umulcc	%l1,	%o1,	%o5
	fpadd32s	%f18,	%f20,	%f13
	bl,a	loop_1824
	subcc	%l6,	%g7,	%l0
	sth	%g1,	[%l7 + 0x14]
	tle	%xcc,	0x0
loop_1824:
	orncc	%g6,	%l3,	%i5
	movneg	%xcc,	%o3,	%i4
	call	loop_1825
	tneg	%xcc,	0x7
	brnz	%g2,	loop_1826
	fcmpeq16	%f20,	%f24,	%l4
loop_1825:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x40] %asi,	%i6
loop_1826:
	tneg	%icc,	0x2
	fornot1s	%f17,	%f23,	%f30
	fsrc1	%f12,	%f22
	movcc	%xcc,	%i3,	%l5
	fones	%f20
	tleu	%xcc,	0x6
	srax	%i7,	0x15,	%o7
	fandnot2s	%f22,	%f7,	%f6
	andcc	%i2,	%g5,	%o6
	set	0x20, %g4
	lduwa	[%l7 + %g4] 0x18,	%g4
	fmovrdgez	%i0,	%f12,	%f24
	subccc	%l2,	0x09F0,	%i1
	movrlez	%o2,	0x3B7,	%g3
	sethi	0x196A,	%o0
	srlx	%l1,	%o4,	%o1
	movneg	%xcc,	%o5,	%g7
	fcmpne16	%f8,	%f8,	%l6
	fnot1s	%f25,	%f29
	fbug,a	%fcc3,	loop_1827
	srax	%g1,	%l0,	%l3
	mova	%icc,	%i5,	%g6
	subccc	%i4,	0x085E,	%g2
loop_1827:
	fba,a	%fcc3,	loop_1828
	tsubcctv	%o3,	0x0383,	%i6
	umul	%i3,	%l5,	%l4
	movvc	%xcc,	%o7,	%i2
loop_1828:
	brnz	%g5,	loop_1829
	membar	0x63
	orcc	%i7,	0x0E40,	%g4
	tpos	%xcc,	0x0
loop_1829:
	edge32l	%i0,	%l2,	%o6
	fpackfix	%f14,	%f9
	udivx	%i1,	0x152F,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f6,	%f4
	fmul8x16al	%f4,	%f18,	%f20
	movrlez	%o0,	%l1,	%o4
	movrne	%o1,	%o2,	%g7
	fmul8x16al	%f30,	%f10,	%f26
	ldd	[%l7 + 0x10],	%f20
	tsubcctv	%l6,	0x1B28,	%o5
	fands	%f24,	%f25,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f30,	%f31,	%f8
	fbuge,a	%fcc2,	loop_1830
	tvc	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
loop_1830:
	orn	%l0,	0x1257,	%l3
	fmovrsne	%g6,	%f11,	%f9
	set	0x60, %o3
	lduwa	[%l7 + %o3] 0x18,	%i4
	movrlez	%g2,	0x15C,	%i5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x62] %asi,	%o3
	brz	%i6,	loop_1831
	fnot2	%f0,	%f20
	movrlz	%i3,	0x2D7,	%l4
	fmovd	%f20,	%f2
loop_1831:
	movgu	%icc,	%l5,	%o7
	ba,a,pt	%icc,	loop_1832
	subc	%g5,	0x1C45,	%i2
	tcs	%icc,	0x2
	fxors	%f25,	%f28,	%f11
loop_1832:
	tsubcctv	%i7,	%i0,	%g4
	fmovdne	%icc,	%f6,	%f21
	stb	%o6,	[%l7 + 0x2D]
	subccc	%i1,	%l2,	%o0
	tl	%xcc,	0x4
	tsubcctv	%l1,	%o4,	%g3
	edge8l	%o1,	%o2,	%g7
	fmovsa	%xcc,	%f11,	%f3
	edge8	%l6,	%g1,	%l0
	tpos	%xcc,	0x7
	edge8	%o5,	%l3,	%g6
	sir	0x0755
	popc	%i4,	%g2
	bcs,pt	%icc,	loop_1833
	srl	%o3,	%i5,	%i6
	tge	%icc,	0x3
	fmovdne	%xcc,	%f7,	%f1
loop_1833:
	tge	%icc,	0x0
	fmovsvs	%icc,	%f31,	%f16
	movrne	%l4,	%l5,	%i3
	alignaddrl	%g5,	%o7,	%i7
	udivcc	%i2,	0x0F56,	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o6,	%g4
	movrlz	%l2,	0x048,	%o0
	subccc	%i1,	0x0668,	%l1
	andcc	%g3,	0x0BAF,	%o1
	fbug,a	%fcc1,	loop_1834
	movre	%o2,	%o4,	%l6
	fmovdvc	%icc,	%f24,	%f25
	ldd	[%l7 + 0x48],	%g6
loop_1834:
	alignaddr	%g1,	%l0,	%l3
	call	loop_1835
	addccc	%o5,	%g6,	%i4
	fmovsle	%xcc,	%f0,	%f30
	pdist	%f4,	%f18,	%f22
loop_1835:
	movpos	%icc,	%o3,	%i5
	fmovsl	%xcc,	%f23,	%f10
	edge32n	%i6,	%l4,	%l5
	movne	%icc,	%i3,	%g2
	sdiv	%g5,	0x1760,	%o7
	addccc	%i7,	0x1FD3,	%i0
	fbuge,a	%fcc0,	loop_1836
	subcc	%o6,	0x1E7C,	%g4
	fmovdcc	%icc,	%f22,	%f24
	orncc	%l2,	0x1EA1,	%o0
loop_1836:
	brgez	%i1,	loop_1837
	membar	0x2A
	movrgz	%l1,	0x0C9,	%g3
	srl	%o1,	%i2,	%o2
loop_1837:
	orncc	%l6,	0x09C8,	%g7
	smulcc	%g1,	0x0618,	%l0
	fornot1	%f6,	%f6,	%f6
	sir	0x072A
	nop
	setx loop_1838, %l0, %l1
	jmpl %l1, %o4
	smul	%l3,	%g6,	%i4
	edge32	%o3,	%i5,	%i6
	brlz	%o5,	loop_1839
loop_1838:
	fnot2	%f6,	%f2
	sethi	0x1582,	%l5
	fmovrdgez	%i3,	%f6,	%f22
loop_1839:
	faligndata	%f18,	%f24,	%f12
	fmovdleu	%xcc,	%f27,	%f9
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g2,	%l4,	%g5
	sll	%o7,	%i7,	%i0
	array16	%o6,	%l2,	%g4
	fmovrdlz	%i1,	%f20,	%f24
	movcc	%xcc,	%o0,	%g3
	fmovdpos	%icc,	%f30,	%f15
	fmovsne	%icc,	%f19,	%f6
	fmovdleu	%xcc,	%f17,	%f24
	sdiv	%l1,	0x18A4,	%i2
	stbar
	fmovspos	%icc,	%f26,	%f15
	tge	%icc,	0x0
	tpos	%xcc,	0x5
	be,a,pt	%xcc,	loop_1840
	udivx	%o1,	0x1EF6,	%l6
	popc	%o2,	%g7
	fcmpgt32	%f28,	%f0,	%l0
loop_1840:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o4
	srax	%l3,	0x0B,	%g1
	udiv	%i4,	0x1E98,	%g6
	movrgez	%i5,	0x0C4,	%i6
	fmovsleu	%icc,	%f8,	%f9
	brnz	%o3,	loop_1841
	edge32l	%o5,	%i3,	%g2
	movrgez	%l4,	0x1B9,	%l5
	te	%xcc,	0x4
loop_1841:
	fmovdvc	%icc,	%f8,	%f14
	xnorcc	%o7,	%i7,	%g5
	sra	%o6,	%l2,	%i0
	movge	%icc,	%i1,	%o0
	fmovsleu	%icc,	%f23,	%f30
	tsubcctv	%g4,	%l1,	%g3
	tvc	%xcc,	0x7
	brgz	%i2,	loop_1842
	membar	0x78
	andncc	%l6,	%o1,	%o2
	xorcc	%l0,	0x0305,	%o4
loop_1842:
	prefetch	[%l7 + 0x40],	 0x2
	bge,a	%icc,	loop_1843
	tne	%xcc,	0x4
	fcmple16	%f14,	%f14,	%g7
	smul	%g1,	%i4,	%l3
loop_1843:
	srl	%g6,	0x1E,	%i6
	movgu	%icc,	%o3,	%o5
	edge8l	%i3,	%i5,	%l4
	fcmpgt32	%f20,	%f26,	%g2
	movneg	%xcc,	%o7,	%i7
	xorcc	%l5,	0x0203,	%g5
	tneg	%xcc,	0x1
	andncc	%l2,	%o6,	%i0
	wr	%g0,	0x18,	%asi
	stwa	%o0,	[%l7 + 0x58] %asi
	wr	%g0,	0x81,	%asi
	sta	%f4,	[%l7 + 0x3C] %asi
	edge32	%i1,	%g4,	%l1
	movrgz	%i2,	%l6,	%o1
	fsrc2	%f2,	%f4
	fornot2s	%f7,	%f8,	%f0
	membar	0x3E
	fpack16	%f24,	%f6
	add	%g3,	0x0EBB,	%l0
	nop
	setx loop_1844, %l0, %l1
	jmpl %l1, %o4
	fmovrdne	%g7,	%f24,	%f16
	movle	%xcc,	%o2,	%i4
	xnorcc	%g1,	0x1434,	%g6
loop_1844:
	fsrc2	%f10,	%f8
	fbge,a	%fcc3,	loop_1845
	umul	%l3,	%i6,	%o5
	fmovdpos	%xcc,	%f5,	%f20
	sdivx	%o3,	0x1FAE,	%i3
loop_1845:
	subcc	%l4,	0x0689,	%i5
	tcs	%icc,	0x1
	bpos	%icc,	loop_1846
	array8	%g2,	%o7,	%i7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x70] %asi,	%f2
loop_1846:
	xorcc	%l5,	0x0199,	%l2
	movg	%xcc,	%g5,	%i0
	fba	%fcc0,	loop_1847
	edge8l	%o6,	%i1,	%o0
	movrlez	%l1,	%g4,	%i2
	array8	%o1,	%g3,	%l6
loop_1847:
	fnegs	%f31,	%f0
	fmovdcc	%xcc,	%f1,	%f23
	subc	%l0,	0x0E3A,	%g7
	sdivcc	%o2,	0x025F,	%o4
	te	%icc,	0x4
	edge32l	%i4,	%g1,	%g6
	orncc	%l3,	%i6,	%o3
	movle	%xcc,	%o5,	%l4
	fmovsg	%icc,	%f4,	%f5
	mulx	%i3,	%i5,	%o7
	sra	%i7,	0x01,	%g2
	lduh	[%l7 + 0x1A],	%l2
	movrne	%g5,	0x184,	%l5
	array16	%o6,	%i0,	%o0
	movneg	%icc,	%i1,	%l1
	fbl,a	%fcc3,	loop_1848
	movle	%xcc,	%i2,	%o1
	fabsd	%f30,	%f8
	xnorcc	%g3,	%l6,	%g4
loop_1848:
	movg	%icc,	%g7,	%l0
	tle	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	fmovrsgez	%i4,	%f11,	%f26
	subccc	%o2,	0x0F3C,	%g1
	pdist	%f6,	%f12,	%f20
	fnand	%f24,	%f28,	%f8
	addcc	%g6,	%l3,	%i6
	bne,a,pn	%xcc,	loop_1849
	andcc	%o3,	0x020A,	%l4
	wr	%g0,	0x04,	%asi
	stha	%i3,	[%l7 + 0x70] %asi
loop_1849:
	te	%icc,	0x2
	tsubcctv	%o5,	0x1C29,	%i5
	st	%f24,	[%l7 + 0x54]
	movcs	%icc,	%i7,	%o7
	movn	%xcc,	%l2,	%g5
	tn	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	sta	%f29,	[%l7 + 0x3C] %asi
	fandnot1s	%f8,	%f0,	%f21
	subccc	%l5,	0x106B,	%o6
	udivx	%i0,	0x074F,	%g2
	sra	%i1,	0x1D,	%o0
	movgu	%xcc,	%l1,	%i2
	sra	%g3,	0x1D,	%l6
	addcc	%o1,	0x1D75,	%g4
	bvs,a	%icc,	loop_1850
	edge8n	%g7,	%o4,	%l0
	andncc	%i4,	%g1,	%g6
	wr	%g0,	0x80,	%asi
	stwa	%o2,	[%l7 + 0x50] %asi
loop_1850:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x58] %asi,	%f30
	taddcctv	%i6,	0x09E7,	%l3
	movgu	%icc,	%l4,	%i3
	edge16ln	%o5,	%o3,	%i7
	or	%i5,	%l2,	%g5
	smulcc	%l5,	0x198F,	%o7
	array16	%i0,	%o6,	%i1
	andcc	%g2,	%l1,	%o0
	xnor	%i2,	0x0867,	%l6
	be,a	%icc,	loop_1851
	movrlz	%g3,	%o1,	%g7
	fxnor	%f2,	%f14,	%f10
	fbuge	%fcc0,	loop_1852
loop_1851:
	fbe	%fcc1,	loop_1853
	movrne	%g4,	0x29F,	%o4
	array8	%l0,	%g1,	%g6
loop_1852:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i4,	%i6
loop_1853:
	edge16ln	%o2,	%l4,	%i3
	edge8ln	%o5,	%o3,	%i7
	movcs	%icc,	%l3,	%i5
	orcc	%g5,	0x0392,	%l2
	movneg	%xcc,	%o7,	%l5
	brz	%i0,	loop_1854
	movvc	%xcc,	%i1,	%g2
	pdist	%f28,	%f16,	%f28
	xorcc	%l1,	%o0,	%o6
loop_1854:
	addccc	%l6,	%g3,	%o1
	brgez	%g7,	loop_1855
	movgu	%icc,	%g4,	%o4
	edge32n	%i2,	%g1,	%l0
	fmovdn	%icc,	%f6,	%f8
loop_1855:
	fsrc2	%f8,	%f6
	sdivcc	%i4,	0x0EE0,	%i6
	fmovsneg	%icc,	%f13,	%f18
	movn	%xcc,	%g6,	%o2
	movvs	%icc,	%l4,	%i3
	mova	%icc,	%o3,	%o5
	fpsub16	%f8,	%f26,	%f10
	srl	%l3,	0x12,	%i5
	fba	%fcc3,	loop_1856
	movrlez	%g5,	%l2,	%o7
	edge16	%l5,	%i0,	%i7
	movpos	%icc,	%i1,	%l1
loop_1856:
	tl	%icc,	0x7
	movrlz	%o0,	0x02A,	%o6
	movle	%xcc,	%l6,	%g2
	movvc	%icc,	%o1,	%g3
	fone	%f14
	fmovrslz	%g4,	%f1,	%f2
	movne	%icc,	%g7,	%i2
	std	%g0,	[%l7 + 0x48]
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	membar	0x31
	bn,a,pt	%xcc,	loop_1857
	fsrc1s	%f0,	%f13
	tvs	%icc,	0x0
	udivx	%i4,	0x0893,	%i6
loop_1857:
	xnor	%o4,	0x0D8E,	%g6
	sdivcc	%l4,	0x13FC,	%o2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i3
	tleu	%xcc,	0x0
	movleu	%xcc,	%o3,	%l3
	taddcc	%o5,	0x0FDC,	%i5
	ldx	[%l7 + 0x68],	%g5
	fbn,a	%fcc2,	loop_1858
	edge8	%l2,	%o7,	%i0
	movg	%icc,	%i7,	%i1
	fcmpne32	%f22,	%f20,	%l1
loop_1858:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	brz,a	%l5,	loop_1859
	fandnot2	%f22,	%f4,	%f4
	fors	%f15,	%f21,	%f0
	xnorcc	%o6,	%l6,	%g2
loop_1859:
	tsubcctv	%o0,	0x0B25,	%o1
	fmovrsgez	%g3,	%f27,	%f18
	andcc	%g4,	%g7,	%i2
	xnor	%g1,	%l0,	%i4
	andn	%o4,	%i6,	%g6
	movrlez	%l4,	0x152,	%o2
	fmul8ulx16	%f28,	%f28,	%f4
	fmovrsne	%i3,	%f23,	%f21
	movleu	%icc,	%l3,	%o3
	nop
	setx loop_1860, %l0, %l1
	jmpl %l1, %o5
	be,a,pn	%icc,	loop_1861
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i5,	%l2,	%o7
loop_1860:
	brgez	%i0,	loop_1862
loop_1861:
	fmul8sux16	%f14,	%f10,	%f2
	taddcctv	%i7,	%i1,	%l1
	fmovrdlez	%g5,	%f6,	%f24
loop_1862:
	bne,a,pt	%xcc,	loop_1863
	fmovrdlz	%l5,	%f4,	%f2
	addccc	%o6,	0x1D5D,	%g2
	fcmpd	%fcc0,	%f8,	%f10
loop_1863:
	fxor	%f10,	%f4,	%f20
	fcmped	%fcc2,	%f24,	%f6
	taddcc	%o0,	0x1035,	%o1
	tsubcc	%l6,	%g4,	%g3
	lduh	[%l7 + 0x0E],	%g7
	xorcc	%g1,	0x08C2,	%i2
	brlez,a	%i4,	loop_1864
	st	%f30,	[%l7 + 0x28]
	xnorcc	%o4,	%i6,	%g6
	bleu,pt	%xcc,	loop_1865
loop_1864:
	srl	%l0,	0x1C,	%o2
	edge32ln	%i3,	%l3,	%l4
	tvs	%xcc,	0x7
loop_1865:
	nop
	set	0x70, %i1
	lduba	[%l7 + %i1] 0x14,	%o5
	edge32l	%i5,	%l2,	%o3
	fabss	%f4,	%f22
	sub	%i0,	%i7,	%i1
	fcmpeq16	%f14,	%f22,	%o7
	srlx	%l1,	0x05,	%l5
	sra	%o6,	%g5,	%g2
	fpsub16s	%f20,	%f8,	%f1
	fandnot1s	%f3,	%f0,	%f24
	array8	%o0,	%l6,	%g4
	fnot2	%f14,	%f30
	addc	%g3,	0x0E3B,	%o1
	lduw	[%l7 + 0x28],	%g7
	fbule	%fcc0,	loop_1866
	sdivx	%g1,	0x1ABE,	%i4
	movrlez	%i2,	0x055,	%i6
	fnors	%f22,	%f19,	%f29
loop_1866:
	popc	0x0C37,	%o4
	ldub	[%l7 + 0x4C],	%l0
	fbug,a	%fcc3,	loop_1867
	fmovdcs	%icc,	%f1,	%f22
	bl,a	%xcc,	loop_1868
	movrgz	%o2,	%g6,	%l3
loop_1867:
	orcc	%l4,	0x03EC,	%i3
	lduw	[%l7 + 0x44],	%i5
loop_1868:
	ldx	[%l7 + 0x68],	%o5
	fmovrdgz	%l2,	%f0,	%f26
	tsubcctv	%o3,	%i0,	%i1
	movne	%icc,	%i7,	%l1
	fmovrsne	%l5,	%f28,	%f4
	ldd	[%l7 + 0x18],	%f8
	fandnot2	%f20,	%f22,	%f16
	call	loop_1869
	fbl,a	%fcc2,	loop_1870
	array8	%o6,	%o7,	%g2
	fbn	%fcc2,	loop_1871
loop_1869:
	fpack32	%f26,	%f6,	%f12
loop_1870:
	tg	%icc,	0x2
	movcs	%icc,	%o0,	%l6
loop_1871:
	tpos	%xcc,	0x3
	fandnot1	%f10,	%f28,	%f10
	call	loop_1872
	bcc,a	loop_1873
	fmul8x16au	%f15,	%f24,	%f2
	movrlez	%g5,	%g3,	%o1
loop_1872:
	fpsub16s	%f13,	%f13,	%f27
loop_1873:
	fmovs	%f23,	%f0
	umulcc	%g4,	%g7,	%g1
	srlx	%i4,	%i6,	%i2
	edge32n	%l0,	%o2,	%o4
	xnorcc	%g6,	0x1EAE,	%l3
	move	%icc,	%i3,	%l4
	bg,pn	%icc,	loop_1874
	ba,pt	%xcc,	loop_1875
	fpsub32s	%f12,	%f13,	%f10
	fxors	%f11,	%f18,	%f5
loop_1874:
	movg	%xcc,	%i5,	%o5
loop_1875:
	nop
	setx	loop_1876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdge	%xcc,	%f24,	%f27
	fbge,a	%fcc0,	loop_1877
	tcc	%xcc,	0x1
loop_1876:
	andcc	%l2,	0x1B7D,	%o3
	addc	%i0,	0x1E22,	%i7
loop_1877:
	bn,a	%xcc,	loop_1878
	tsubcctv	%l1,	0x1642,	%l5
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x81,	%i1
loop_1878:
	fmovdle	%icc,	%f19,	%f26
	fpack16	%f6,	%f1
	sll	%o6,	%g2,	%o0
	bvc,a,pt	%icc,	loop_1879
	fmovdn	%xcc,	%f7,	%f2
	movrlez	%l6,	%g5,	%g3
	move	%xcc,	%o7,	%g4
loop_1879:
	sdivcc	%o1,	0x1DC0,	%g7
	orncc	%i4,	0x0BC6,	%g1
	fble,a	%fcc2,	loop_1880
	nop
	setx	loop_1881,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%i6,	0x1A3A,	%l0
	fnand	%f8,	%f12,	%f18
loop_1880:
	tg	%xcc,	0x7
loop_1881:
	edge16l	%i2,	%o4,	%o2
	sra	%g6,	%l3,	%l4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x58] %asi,	%i3
	std	%f6,	[%l7 + 0x38]
	fbl	%fcc0,	loop_1882
	taddcctv	%o5,	0x0109,	%l2
	tsubcctv	%i5,	%o3,	%i7
	fpsub16	%f30,	%f6,	%f10
loop_1882:
	edge8n	%l1,	%l5,	%i0
	sll	%i1,	0x0E,	%o6
	tpos	%icc,	0x7
	andn	%g2,	0x180E,	%l6
	fnot2s	%f20,	%f24
	fnegd	%f30,	%f2
	movn	%xcc,	%o0,	%g3
	fmovd	%f28,	%f24
	bleu,pt	%xcc,	loop_1883
	fpack32	%f30,	%f18,	%f10
	bneg,a	loop_1884
	fmovdge	%icc,	%f15,	%f30
loop_1883:
	brlz,a	%o7,	loop_1885
	edge16n	%g4,	%o1,	%g7
loop_1884:
	udivcc	%g5,	0x112A,	%g1
	movl	%xcc,	%i6,	%i4
loop_1885:
	bn,a	loop_1886
	fandnot2s	%f18,	%f1,	%f26
	nop
	setx	loop_1887,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%l0,	0x1996,	%o4
loop_1886:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i2
loop_1887:
	fnot1	%f2,	%f16
	fmovrdgez	%g6,	%f16,	%f28
	addcc	%l3,	0x14C9,	%o2
	fbg	%fcc0,	loop_1888
	srl	%l4,	%i3,	%l2
	fzeros	%f9
	set	0x70, %i5
	stwa	%o5,	[%l7 + %i5] 0x27
	membar	#Sync
loop_1888:
	fcmpeq32	%f26,	%f20,	%i5
	movl	%icc,	%o3,	%l1
	movg	%icc,	%l5,	%i7
	taddcctv	%i0,	0x12BF,	%i1
	fbule,a	%fcc3,	loop_1889
	move	%icc,	%g2,	%o6
	fble	%fcc1,	loop_1890
	bneg	loop_1891
loop_1889:
	movcs	%xcc,	%l6,	%o0
	movrlez	%o7,	%g4,	%g3
loop_1890:
	umul	%o1,	0x145F,	%g5
loop_1891:
	fbu	%fcc2,	loop_1892
	fmovsn	%xcc,	%f11,	%f11
	bneg,a	%icc,	loop_1893
	fcmple32	%f26,	%f0,	%g1
loop_1892:
	tvs	%xcc,	0x3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%i4
loop_1893:
	sir	0x11C3
	andn	%l0,	%i6,	%i2
	fmovsl	%xcc,	%f30,	%f11
	sethi	0x110B,	%o4
	fmovrslz	%l3,	%f5,	%f30
	be	loop_1894
	sdivcc	%g6,	0x0511,	%o2
	bcs,a,pt	%icc,	loop_1895
	edge32	%l4,	%l2,	%i3
loop_1894:
	movre	%i5,	0x335,	%o3
	fmul8x16	%f24,	%f4,	%f22
loop_1895:
	call	loop_1896
	movvs	%icc,	%o5,	%l5
	andcc	%i7,	%i0,	%l1
	movl	%icc,	%i1,	%g2
loop_1896:
	andncc	%l6,	%o6,	%o0
	tcs	%icc,	0x2
	subccc	%o7,	%g4,	%o1
	siam	0x1
	wr	%g0,	0xeb,	%asi
	stha	%g5,	[%l7 + 0x5E] %asi
	membar	#Sync
	nop
	set	0x58, %g5
	std	%g0,	[%l7 + %g5]
	fmovdvc	%xcc,	%f11,	%f22
	fmovde	%xcc,	%f17,	%f18
	bshuffle	%f2,	%f16,	%f2
	fnands	%f11,	%f16,	%f25
	fmovrdgez	%g3,	%f6,	%f18
	fzero	%f16
	fmovdle	%xcc,	%f26,	%f14
	fmovrslez	%i4,	%f11,	%f31
	xorcc	%l0,	0x0DF7,	%i6
	addccc	%i2,	%o4,	%g7
	fmovrslez	%g6,	%f14,	%f18
	fsrc2	%f30,	%f28
	alignaddr	%o2,	%l3,	%l4
	sdivx	%l2,	0x1D17,	%i5
	nop
	setx	loop_1897,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x7
	te	%xcc,	0x1
	std	%i2,	[%l7 + 0x60]
loop_1897:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o3,	%l5,	%i7
	fmovsg	%icc,	%f16,	%f10
	set	0x24, %g6
	ldswa	[%l7 + %g6] 0x19,	%i0
	srlx	%l1,	%i1,	%o5
	edge16n	%g2,	%o6,	%l6
	brlez	%o0,	loop_1898
	fble,a	%fcc3,	loop_1899
	swap	[%l7 + 0x68],	%g4
	fcmple16	%f30,	%f6,	%o1
loop_1898:
	tpos	%xcc,	0x6
loop_1899:
	taddcc	%g5,	0x06A7,	%g1
	ba,a	%icc,	loop_1900
	sdivx	%o7,	0x119E,	%g3
	ta	%icc,	0x1
	and	%l0,	0x129B,	%i4
loop_1900:
	sdivx	%i2,	0x1E05,	%o4
	srax	%i6,	%g7,	%g6
	edge16ln	%o2,	%l4,	%l2
	movrlz	%l3,	%i3,	%i5
	udivx	%o3,	0x1436,	%i7
	srlx	%i0,	0x07,	%l5
	tcc	%xcc,	0x6
	bgu,pn	%xcc,	loop_1901
	srl	%l1,	%i1,	%g2
	fbn	%fcc2,	loop_1902
	tvs	%icc,	0x5
loop_1901:
	nop
	setx	loop_1903,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%o5,	0x05,	%l6
loop_1902:
	swap	[%l7 + 0x14],	%o0
	srl	%g4,	%o6,	%g5
loop_1903:
	bn	%icc,	loop_1904
	udiv	%g1,	0x0FC3,	%o7
	fbg	%fcc1,	loop_1905
	brgz	%o1,	loop_1906
loop_1904:
	fmuld8sux16	%f0,	%f26,	%f2
	movl	%icc,	%l0,	%i4
loop_1905:
	ldstub	[%l7 + 0x62],	%i2
loop_1906:
	edge16ln	%g3,	%i6,	%o4
	membar	0x58
	popc	%g6,	%g7
	addcc	%l4,	0x02A7,	%o2
	sra	%l2,	%i3,	%i5
	mova	%icc,	%l3,	%i7
	fsrc2	%f22,	%f22
	fbuge,a	%fcc0,	loop_1907
	bshuffle	%f12,	%f10,	%f30
	tcs	%icc,	0x0
	addcc	%i0,	%l5,	%o3
loop_1907:
	edge16ln	%i1,	%g2,	%o5
	xnor	%l1,	0x034D,	%o0
	fmovsle	%icc,	%f29,	%f26
	mulscc	%l6,	0x05AA,	%g4
	fmovs	%f14,	%f24
	tne	%icc,	0x2
	movg	%icc,	%o6,	%g5
	fba,a	%fcc0,	loop_1908
	movcs	%icc,	%g1,	%o7
	edge8l	%l0,	%o1,	%i2
	sll	%i4,	%g3,	%o4
loop_1908:
	sdiv	%i6,	0x106D,	%g6
	ba,a	loop_1909
	or	%l4,	%g7,	%o2
	edge16n	%i3,	%i5,	%l3
	tgu	%xcc,	0x6
loop_1909:
	fpsub32s	%f27,	%f13,	%f7
	subcc	%l2,	%i7,	%i0
	movpos	%icc,	%o3,	%l5
	movrne	%i1,	%g2,	%l1
	fmovda	%icc,	%f17,	%f8
	swap	[%l7 + 0x50],	%o5
	edge8	%o0,	%g4,	%l6
	fmovrdlez	%g5,	%f6,	%f30
	membar	0x4C
	udivcc	%o6,	0x0A95,	%o7
	nop
	set	0x64, %l5
	lduw	[%l7 + %l5],	%l0
	xorcc	%o1,	%g1,	%i4
	fmuld8sux16	%f27,	%f3,	%f26
	ble,a,pn	%xcc,	loop_1910
	mulx	%g3,	0x1F5E,	%o4
	ldx	[%l7 + 0x70],	%i6
	brz,a	%i2,	loop_1911
loop_1910:
	fornot1s	%f8,	%f18,	%f21
	movrlz	%l4,	0x06D,	%g6
	tvs	%xcc,	0x7
loop_1911:
	srl	%g7,	%i3,	%i5
	fnot1	%f18,	%f30
	srlx	%l3,	%o2,	%l2
	bvs,a	%icc,	loop_1912
	tle	%icc,	0x7
	set	0x40, %g1
	stda	%i6,	[%l7 + %g1] 0x2a
	membar	#Sync
loop_1912:
	fxnor	%f30,	%f24,	%f12
	fmovda	%xcc,	%f16,	%f7
	edge16l	%o3,	%l5,	%i1
	addc	%i0,	%l1,	%o5
	fandnot2	%f18,	%f12,	%f6
	fmovrdgz	%g2,	%f0,	%f14
	umul	%o0,	%g4,	%g5
	ta	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	sta	%f22,	[%l7 + 0x48] %asi
	fbne,a	%fcc0,	loop_1913
	taddcctv	%o6,	0x08B2,	%o7
	fmovda	%xcc,	%f26,	%f16
	swap	[%l7 + 0x54],	%l0
loop_1913:
	fbe,a	%fcc1,	loop_1914
	movgu	%icc,	%l6,	%o1
	fbg,a	%fcc0,	loop_1915
	orn	%i4,	0x10D8,	%g3
loop_1914:
	mova	%xcc,	%g1,	%o4
	fcmpne32	%f22,	%f30,	%i2
loop_1915:
	movvs	%xcc,	%l4,	%i6
	fmul8ulx16	%f16,	%f12,	%f6
	srl	%g6,	0x00,	%i3
	fnands	%f26,	%f18,	%f19
	stw	%g7,	[%l7 + 0x78]
	movleu	%xcc,	%l3,	%o2
	xor	%i5,	0x134D,	%i7
	fpadd32	%f8,	%f10,	%f30
	movl	%xcc,	%l2,	%o3
	edge16n	%l5,	%i1,	%i0
	sub	%o5,	0x1A81,	%g2
	ldsw	[%l7 + 0x30],	%o0
	edge8ln	%l1,	%g4,	%o6
	fandnot1	%f14,	%f18,	%f24
	set	0x1C, %l0
	sta	%f20,	[%l7 + %l0] 0x19
	ldsw	[%l7 + 0x50],	%g5
	fabsd	%f12,	%f8
	fxor	%f28,	%f0,	%f26
	andncc	%l0,	%l6,	%o7
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o1
	xorcc	%g3,	0x0193,	%g1
	fmovdn	%xcc,	%f13,	%f17
	subcc	%i4,	%o4,	%i2
	brnz,a	%l4,	loop_1916
	faligndata	%f24,	%f28,	%f26
	orn	%g6,	0x171A,	%i3
	fmovda	%xcc,	%f12,	%f1
loop_1916:
	tge	%icc,	0x1
	edge8n	%g7,	%l3,	%o2
	array8	%i6,	%i7,	%l2
	movcc	%icc,	%i5,	%l5
	andncc	%i1,	%i0,	%o3
	fcmpne16	%f26,	%f26,	%g2
	movrlz	%o0,	0x3D8,	%l1
	tvc	%icc,	0x0
	andn	%g4,	%o6,	%o5
	movle	%icc,	%l0,	%l6
	fmovscs	%icc,	%f31,	%f0
	umul	%g5,	0x0CF7,	%o7
	andcc	%g3,	%o1,	%i4
	bleu,a,pt	%icc,	loop_1917
	fcmpeq32	%f18,	%f28,	%g1
	movcs	%xcc,	%i2,	%o4
	edge16ln	%l4,	%i3,	%g7
loop_1917:
	fmovda	%icc,	%f25,	%f21
	fbul	%fcc0,	loop_1918
	fornot2	%f14,	%f0,	%f20
	bne	loop_1919
	andn	%g6,	%l3,	%o2
loop_1918:
	fors	%f10,	%f26,	%f22
	movne	%icc,	%i6,	%l2
loop_1919:
	addc	%i7,	%i5,	%l5
	membar	0x5F
	ldd	[%l7 + 0x10],	%i0
	fxnors	%f9,	%f8,	%f6
	fbuge,a	%fcc2,	loop_1920
	movrne	%i0,	0x163,	%o3
	movle	%icc,	%g2,	%o0
	wr	%g0,	0x80,	%asi
	stha	%g4,	[%l7 + 0x1A] %asi
loop_1920:
	movrne	%o6,	0x35E,	%l1
	sllx	%o5,	0x13,	%l6
	fcmpeq32	%f0,	%f22,	%g5
	udivx	%l0,	0x05E5,	%o7
	udivcc	%g3,	0x19AC,	%i4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x63] %asi,	%o1
	sethi	0x052A,	%g1
	ble,pt	%xcc,	loop_1921
	flush	%l7 + 0x0C
	brgez	%i2,	loop_1922
	fblg,a	%fcc0,	loop_1923
loop_1921:
	or	%l4,	%i3,	%o4
	edge16n	%g6,	%g7,	%l3
loop_1922:
	brlez	%o2,	loop_1924
loop_1923:
	movge	%icc,	%i6,	%i7
	sra	%l2,	0x1F,	%l5
	andncc	%i5,	%i1,	%o3
loop_1924:
	andncc	%g2,	%i0,	%g4
	fmovdne	%icc,	%f29,	%f8
	and	%o0,	0x0C3A,	%o6
	ldub	[%l7 + 0x71],	%o5
	fmul8ulx16	%f30,	%f20,	%f2
	nop
	set	0x1C, %l4
	lduh	[%l7 + %l4],	%l6
	sdivcc	%g5,	0x106D,	%l0
	edge8n	%l1,	%o7,	%g3
	fblg	%fcc0,	loop_1925
	bn,a,pn	%icc,	loop_1926
	mova	%icc,	%i4,	%o1
	movrne	%g1,	0x0AB,	%i2
loop_1925:
	fcmpd	%fcc0,	%f18,	%f0
loop_1926:
	te	%xcc,	0x0
	movn	%xcc,	%l4,	%i3
	and	%g6,	%g7,	%l3
	fmovrdlez	%o2,	%f8,	%f2
	tvc	%icc,	0x3
	brnz,a	%i6,	loop_1927
	fmovdneg	%xcc,	%f14,	%f18
	fbue,a	%fcc3,	loop_1928
	fbu	%fcc0,	loop_1929
loop_1927:
	bpos,pn	%xcc,	loop_1930
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1928:
	fcmpeq32	%f22,	%f28,	%i7
loop_1929:
	umul	%l2,	%l5,	%o4
loop_1930:
	fexpand	%f10,	%f12
	sdivx	%i1,	0x0E17,	%i5
	bshuffle	%f24,	%f0,	%f12
	fmovrse	%o3,	%f22,	%f1
	array32	%g2,	%i0,	%o0
	fsrc2	%f22,	%f16
	edge8ln	%o6,	%g4,	%l6
	std	%o4,	[%l7 + 0x58]
	tle	%icc,	0x3
	fblg	%fcc2,	loop_1931
	orcc	%g5,	0x15EB,	%l1
	sllx	%o7,	%g3,	%l0
	mulx	%o1,	0x12EF,	%g1
loop_1931:
	srlx	%i4,	0x1D,	%l4
	sdiv	%i2,	0x0345,	%g6
	movrlz	%i3,	0x382,	%l3
	fsrc1s	%f10,	%f22
	movrlez	%o2,	0x192,	%i6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	fpadd16s	%f13,	%f5,	%f30
	ldsh	[%l7 + 0x32],	%l2
	bneg,a,pt	%xcc,	loop_1932
	tcc	%xcc,	0x6
	fsrc1	%f26,	%f18
	mulscc	%l5,	%o4,	%i1
loop_1932:
	movneg	%icc,	%i5,	%i7
	andcc	%o3,	%i0,	%o0
	bleu,a	%xcc,	loop_1933
	nop
	setx loop_1934, %l0, %l1
	jmpl %l1, %o6
	movne	%xcc,	%g2,	%l6
	fbe,a	%fcc0,	loop_1935
loop_1933:
	ble,a	loop_1936
loop_1934:
	udiv	%g4,	0x1372,	%o5
	fones	%f18
loop_1935:
	fblg	%fcc2,	loop_1937
loop_1936:
	std	%f2,	[%l7 + 0x30]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l1
loop_1937:
	tvs	%icc,	0x1
	sll	%g3,	0x03,	%o7
	edge8l	%l0,	%g1,	%i4
	sdiv	%l4,	0x01B1,	%i2
	flush	%l7 + 0x74
	smulcc	%o1,	%g6,	%i3
	mulx	%o2,	0x03D6,	%i6
	xnorcc	%g7,	%l2,	%l5
	udivx	%l3,	0x005C,	%i1
	array16	%o4,	%i5,	%i7
	movre	%o3,	%i0,	%o0
	sdiv	%g2,	0x09D3,	%o6
	fmovsvs	%xcc,	%f31,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%g4
	array32	%l6,	%g5,	%o5
	fbue,a	%fcc2,	loop_1938
	addcc	%g3,	%o7,	%l0
	fmovrdlz	%l1,	%f24,	%f12
	ldsh	[%l7 + 0x78],	%i4
loop_1938:
	fcmpeq16	%f28,	%f6,	%l4
	movneg	%xcc,	%g1,	%i2
	siam	0x2
	fmovrse	%g6,	%f29,	%f20
	movne	%xcc,	%o1,	%o2
	andn	%i3,	0x0359,	%g7
	fble	%fcc1,	loop_1939
	sir	0x1B3B
	fnor	%f12,	%f6,	%f6
	movgu	%xcc,	%i6,	%l2
loop_1939:
	ldstub	[%l7 + 0x34],	%l3
	xnor	%i1,	%l5,	%o4
	and	%i7,	%i5,	%o3
	tvc	%xcc,	0x4
	fpackfix	%f30,	%f30
	movrlez	%i0,	%g2,	%o0
	subcc	%o6,	0x1643,	%g4
	fnands	%f31,	%f10,	%f0
	fbo	%fcc2,	loop_1940
	fpadd16s	%f21,	%f19,	%f6
	edge8n	%g5,	%l6,	%o5
	xnor	%o7,	0x119F,	%g3
loop_1940:
	alignaddrl	%l0,	%i4,	%l1
	array16	%g1,	%l4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x38],	%g6
	sll	%o1,	%i3,	%o2
	fbe	%fcc0,	loop_1941
	taddcc	%g7,	%i6,	%l3
	alignaddrl	%i1,	%l5,	%l2
	edge32	%i7,	%i5,	%o3
loop_1941:
	orn	%i0,	0x0098,	%g2
	ldsh	[%l7 + 0x32],	%o0
	sdiv	%o6,	0x0235,	%g4
	sub	%g5,	0x1511,	%l6
	movvc	%xcc,	%o4,	%o5
	set	0x20, %l6
	stwa	%o7,	[%l7 + %l6] 0x15
	movre	%l0,	%g3,	%i4
	umul	%g1,	%l1,	%i2
	orcc	%l4,	%o1,	%i3
	fmovsa	%icc,	%f6,	%f7
	udivx	%o2,	0x004F,	%g6
	set	0x28, %g2
	stwa	%g7,	[%l7 + %g2] 0x81
	fmovrdlz	%i6,	%f20,	%f30
	stb	%i1,	[%l7 + 0x78]
	fnot2	%f24,	%f18
	srlx	%l5,	0x07,	%l2
	movrgez	%l3,	%i5,	%i7
	bg	%xcc,	loop_1942
	array16	%i0,	%g2,	%o3
	fnands	%f31,	%f28,	%f19
	bvs,a	loop_1943
loop_1942:
	tsubcc	%o0,	%g4,	%g5
	sub	%l6,	%o4,	%o5
	movn	%icc,	%o6,	%o7
loop_1943:
	andn	%g3,	0x05A2,	%i4
	edge32ln	%g1,	%l0,	%i2
	be	%xcc,	loop_1944
	fcmpeq32	%f18,	%f14,	%l1
	edge16l	%l4,	%i3,	%o1
	add	%o2,	0x016B,	%g6
loop_1944:
	fxnors	%f0,	%f27,	%f14
	wr	%g0,	0x11,	%asi
	stxa	%i6,	[%l7 + 0x20] %asi
	fmovrslez	%g7,	%f31,	%f14
	sdiv	%i1,	0x09A1,	%l5
	nop
	setx loop_1945, %l0, %l1
	jmpl %l1, %l3
	popc	%l2,	%i5
	fornot1s	%f21,	%f26,	%f11
	fxor	%f22,	%f10,	%f18
loop_1945:
	sub	%i0,	0x096F,	%g2
	movrgez	%i7,	%o3,	%g4
	udiv	%g5,	0x0FFD,	%o0
	fba,a	%fcc2,	loop_1946
	fmovdne	%icc,	%f22,	%f18
	fmovdvc	%icc,	%f12,	%f28
	sllx	%o4,	0x04,	%o5
loop_1946:
	fexpand	%f5,	%f30
	bvs,pn	%icc,	loop_1947
	sllx	%l6,	%o6,	%o7
	edge8n	%g3,	%i4,	%l0
	bleu,a	loop_1948
loop_1947:
	orncc	%i2,	%l1,	%g1
	movne	%icc,	%i3,	%l4
	udivcc	%o1,	0x0E75,	%o2
loop_1948:
	sll	%g6,	0x17,	%g7
	fbg	%fcc2,	loop_1949
	fornot2	%f8,	%f14,	%f20
	fmovsvs	%xcc,	%f0,	%f5
	membar	0x3A
loop_1949:
	tn	%xcc,	0x0
	fnot1	%f28,	%f8
	edge8	%i6,	%l5,	%l3
	brgez,a	%i1,	loop_1950
	fzero	%f0
	set	0x44, %i7
	lduwa	[%l7 + %i7] 0x14,	%i5
loop_1950:
	nop
	set	0x3C, %i4
	stwa	%l2,	[%l7 + %i4] 0xe2
	membar	#Sync
	fnegd	%f30,	%f28
	fmovrdgz	%g2,	%f16,	%f14
	tle	%xcc,	0x1
	movvs	%xcc,	%i7,	%i0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	sll	%g5,	%o0,	%g4
	movn	%icc,	%o4,	%o5
	brnz	%l6,	loop_1951
	movrgez	%o7,	0x208,	%o6
	wr	%g0,	0x04,	%asi
	sta	%f29,	[%l7 + 0x30] %asi
loop_1951:
	subc	%i4,	0x1EAB,	%l0
	smulcc	%g3,	0x16F2,	%l1
	sdivcc	%g1,	0x06ED,	%i3
	movre	%i2,	%o1,	%o2
	movge	%xcc,	%g6,	%l4
	smul	%i6,	%l5,	%g7
	xnorcc	%i1,	0x0033,	%l3
	edge32l	%l2,	%i5,	%g2
	ldx	[%l7 + 0x48],	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o3,	%g5,	%o0
	alignaddr	%i0,	%g4,	%o5
	fnot1s	%f12,	%f28
	orncc	%o4,	0x15D6,	%o7
	edge8	%o6,	%i4,	%l0
	umul	%g3,	0x119C,	%l1
	fbge,a	%fcc3,	loop_1952
	srlx	%g1,	%l6,	%i2
	sra	%o1,	0x1E,	%i3
	fcmpgt16	%f6,	%f22,	%g6
loop_1952:
	sub	%o2,	%i6,	%l4
	fbn,a	%fcc1,	loop_1953
	srl	%l5,	%g7,	%l3
	edge16l	%l2,	%i5,	%i1
	movle	%icc,	%i7,	%o3
loop_1953:
	edge16n	%g2,	%g5,	%i0
	call	loop_1954
	orn	%o0,	0x09C4,	%o5
	edge8	%g4,	%o7,	%o4
	movrlez	%i4,	%l0,	%o6
loop_1954:
	edge32ln	%l1,	%g1,	%g3
	orncc	%i2,	%o1,	%l6
	movcc	%xcc,	%i3,	%o2
	movrlez	%i6,	0x00F,	%l4
	udivx	%g6,	0x1BEC,	%l5
	sir	0x015C
	fbuge,a	%fcc1,	loop_1955
	edge16l	%g7,	%l2,	%i5
	nop
	setx	loop_1956,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%i1,	0x135,	%i7
loop_1955:
	tvs	%xcc,	0x3
	fmovsvs	%xcc,	%f9,	%f21
loop_1956:
	xnor	%l3,	%o3,	%g5
	sdiv	%i0,	0x0E49,	%g2
	te	%xcc,	0x3
	edge32n	%o5,	%o0,	%g4
	lduw	[%l7 + 0x74],	%o4
	subcc	%o7,	%l0,	%o6
	movgu	%xcc,	%l1,	%i4
	edge16ln	%g1,	%i2,	%g3
	nop
	setx loop_1957, %l0, %l1
	jmpl %l1, %l6
	tsubcctv	%o1,	%i3,	%o2
	ldsh	[%l7 + 0x54],	%i6
	nop
	setx	loop_1958,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1957:
	fbue	%fcc3,	loop_1959
	taddcc	%l4,	%l5,	%g7
	tle	%xcc,	0x1
loop_1958:
	sdivx	%l2,	0x0B0E,	%g6
loop_1959:
	fcmpes	%fcc0,	%f2,	%f10
	orn	%i1,	0x1F7A,	%i7
	mulscc	%i5,	%l3,	%g5
	srax	%i0,	0x0E,	%g2
	tg	%icc,	0x7
	fmovsle	%icc,	%f4,	%f9
	movrgez	%o3,	0x21A,	%o5
	st	%f12,	[%l7 + 0x5C]
	addcc	%o0,	0x00D4,	%o4
	movcs	%icc,	%g4,	%o7
	orncc	%l0,	0x1F09,	%l1
	edge16l	%i4,	%o6,	%g1
	bneg,pt	%icc,	loop_1960
	andncc	%i2,	%l6,	%o1
	edge16ln	%g3,	%i3,	%o2
	fmovd	%f8,	%f14
loop_1960:
	edge16ln	%l4,	%l5,	%g7
	movn	%xcc,	%l2,	%i6
	tcc	%xcc,	0x6
	movre	%g6,	0x340,	%i1
	fcmpeq16	%f14,	%f26,	%i7
	fbl	%fcc2,	loop_1961
	nop
	setx	loop_1962,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%l3,	%g5,	%i0
	andn	%i5,	%o3,	%g2
loop_1961:
	movrne	%o5,	0x32B,	%o4
loop_1962:
	fpsub16	%f14,	%f30,	%f10
	ta	%xcc,	0x0
	taddcctv	%g4,	0x040F,	%o7
	mulx	%l0,	%o0,	%l1
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o6
	fba	%fcc3,	loop_1963
	movrgz	%g1,	0x141,	%i2
	edge16	%l6,	%i4,	%g3
	fornot1s	%f27,	%f19,	%f3
loop_1963:
	fmovrdne	%o1,	%f6,	%f24
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x79] %asi,	%o2
	edge32ln	%l4,	%i3,	%g7
	edge16ln	%l2,	%l5,	%g6
	srl	%i6,	%i1,	%l3
	fone	%f0
	ld	[%l7 + 0x5C],	%f26
	movrne	%i7,	%g5,	%i0
	udivx	%i5,	0x099F,	%g2
	xnorcc	%o5,	%o3,	%g4
	tcc	%xcc,	0x3
	andncc	%o7,	%l0,	%o0
	alignaddrl	%l1,	%o6,	%g1
	udivx	%o4,	0x04DF,	%i2
	and	%i4,	%g3,	%o1
	movvc	%icc,	%l6,	%l4
	fnot1s	%f30,	%f11
	srlx	%o2,	%i3,	%g7
	fbu	%fcc2,	loop_1964
	mova	%xcc,	%l5,	%g6
	udivx	%l2,	0x0931,	%i1
	movle	%xcc,	%i6,	%l3
loop_1964:
	andcc	%g5,	0x15C8,	%i7
	array8	%i0,	%i5,	%g2
	fmul8x16al	%f25,	%f23,	%f6
	movl	%icc,	%o5,	%g4
	andcc	%o7,	%l0,	%o0
	std	%f2,	[%l7 + 0x20]
	alignaddrl	%o3,	%l1,	%o6
	fxnor	%f2,	%f14,	%f16
	edge8ln	%o4,	%g1,	%i4
	sra	%g3,	0x0F,	%o1
	movrlez	%i2,	0x04C,	%l4
	movvs	%icc,	%o2,	%l6
	movvs	%xcc,	%i3,	%l5
	tcs	%xcc,	0x4
	orn	%g6,	0x157E,	%l2
	sethi	0x1299,	%i1
	movre	%g7,	0x038,	%l3
	sir	0x0140
	tsubcc	%g5,	%i7,	%i0
	fcmple32	%f8,	%f22,	%i5
	xorcc	%g2,	0x1466,	%o5
	tneg	%icc,	0x0
	and	%i6,	%g4,	%l0
	taddcc	%o7,	%o0,	%o3
	subc	%l1,	%o6,	%o4
	tcc	%xcc,	0x4
	fands	%f18,	%f25,	%f27
	movcc	%xcc,	%g1,	%g3
	fxnors	%f8,	%f12,	%f26
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2B] %asi,	%o1
	bleu,a,pn	%icc,	loop_1965
	subcc	%i4,	0x1E49,	%i2
	fabsd	%f8,	%f28
	fxnors	%f20,	%f6,	%f24
loop_1965:
	movpos	%icc,	%o2,	%l6
	sdiv	%l4,	0x0CCF,	%i3
	te	%xcc,	0x4
	fmovrslez	%g6,	%f24,	%f4
	fandnot1s	%f4,	%f20,	%f24
	fandnot1s	%f14,	%f16,	%f7
	fblg,a	%fcc1,	loop_1966
	xorcc	%l5,	0x0F19,	%i1
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
	movge	%icc,	%l2,	%g7
loop_1966:
	sir	0x0AB9
	fmovrdne	%l3,	%f4,	%f6
loop_1967:
	subc	%i7,	0x12CB,	%i0
	alignaddrl	%g5,	%i5,	%o5
	tle	%icc,	0x0
	fbu,a	%fcc1,	loop_1968
	ldsb	[%l7 + 0x23],	%g2
	fandnot2s	%f9,	%f30,	%f16
	fpsub16s	%f15,	%f3,	%f4
loop_1968:
	umul	%g4,	%l0,	%i6
	addcc	%o7,	%o0,	%l1
	swap	[%l7 + 0x08],	%o3
	fmul8x16al	%f11,	%f16,	%f26
	fornot2	%f24,	%f14,	%f24
	alignaddr	%o6,	%o4,	%g3
	tl	%icc,	0x6
	edge16ln	%g1,	%o1,	%i2
	edge8	%i4,	%l6,	%o2
	edge32	%l4,	%g6,	%l5
	nop
	setx	loop_1969,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbge,a	%fcc3,	loop_1970
	swap	[%l7 + 0x30],	%i1
	sdivcc	%l2,	0x0BDF,	%g7
loop_1969:
	fmovrdgez	%l3,	%f12,	%f26
loop_1970:
	bcc,a,pn	%xcc,	loop_1971
	edge16	%i7,	%i0,	%i3
	srax	%g5,	%i5,	%g2
	fmul8sux16	%f8,	%f8,	%f6
loop_1971:
	fnands	%f18,	%f25,	%f7
	movleu	%xcc,	%o5,	%g4
	edge8l	%l0,	%i6,	%o0
	fpackfix	%f20,	%f26
	bpos	%icc,	loop_1972
	fmovdpos	%xcc,	%f21,	%f25
	fmovrsgz	%l1,	%f7,	%f25
	fmovrdne	%o3,	%f30,	%f4
loop_1972:
	udiv	%o6,	0x1A3B,	%o4
	tpos	%xcc,	0x0
	tle	%xcc,	0x3
	stbar
	fmovdne	%xcc,	%f12,	%f27
	fmovscc	%xcc,	%f31,	%f21
	stx	%g3,	[%l7 + 0x28]
	sethi	0x04F1,	%o7
	sllx	%g1,	0x11,	%i2
	wr	%g0,	0x18,	%asi
	stxa	%o1,	[%l7 + 0x78] %asi
	sdiv	%i4,	0x1AF8,	%o2
	fmovda	%xcc,	%f25,	%f25
	set	0x0, %i0
	ldxa	[%g0 + %i0] 0x58,	%l6
	bneg,a	%icc,	loop_1973
	tcs	%icc,	0x7
	movne	%xcc,	%g6,	%l4
	fbg,a	%fcc2,	loop_1974
loop_1973:
	nop
	setx	loop_1975,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%i1,	0x381,	%l2
	ble,pt	%icc,	loop_1976
loop_1974:
	addcc	%l5,	0x081C,	%g7
loop_1975:
	edge16ln	%l3,	%i7,	%i0
	fmovs	%f19,	%f25
loop_1976:
	orcc	%i3,	%g5,	%i5
	fmovsleu	%xcc,	%f18,	%f16
	edge8l	%g2,	%g4,	%o5
	tne	%icc,	0x7
	sdiv	%l0,	0x1D1F,	%i6
	umulcc	%o0,	%o3,	%l1
	orn	%o4,	0x0AFA,	%o6
	wr	%g0,	0x10,	%asi
	sta	%f13,	[%l7 + 0x48] %asi
	fxors	%f20,	%f4,	%f28
	sub	%o7,	%g1,	%g3
	edge32n	%o1,	%i2,	%i4
	srl	%o2,	0x1C,	%l6
	movgu	%icc,	%l4,	%i1
	ldub	[%l7 + 0x42],	%l2
	brnz	%g6,	loop_1977
	call	loop_1978
	tl	%icc,	0x1
	umulcc	%g7,	0x02D3,	%l5
loop_1977:
	fmovdvs	%xcc,	%f17,	%f8
loop_1978:
	movrgez	%i7,	%l3,	%i0
	fornot2	%f18,	%f30,	%f0
	stx	%g5,	[%l7 + 0x20]
	fandnot1s	%f24,	%f18,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i5,	0x0ABD,	%i3
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g4
	fbge	%fcc1,	loop_1979
	and	%g2,	0x0D54,	%l0
	fornot1	%f22,	%f14,	%f28
	fpmerge	%f21,	%f5,	%f10
loop_1979:
	fbe	%fcc3,	loop_1980
	stx	%o5,	[%l7 + 0x40]
	fnor	%f30,	%f20,	%f18
	fmovsleu	%xcc,	%f26,	%f13
loop_1980:
	tgu	%icc,	0x7
	movcc	%xcc,	%o0,	%o3
	tl	%icc,	0x2
	fandnot2	%f12,	%f14,	%f18
	popc	0x0370,	%l1
	fands	%f19,	%f2,	%f12
	tsubcc	%i6,	0x179A,	%o4
	fcmped	%fcc0,	%f20,	%f6
	or	%o7,	0x065D,	%g1
	fbule,a	%fcc2,	loop_1981
	movrgez	%g3,	0x2F3,	%o6
	addcc	%o1,	%i2,	%i4
	fzeros	%f4
loop_1981:
	fmovsa	%icc,	%f11,	%f5
	sll	%o2,	%l6,	%l4
	bg,pn	%icc,	loop_1982
	fba	%fcc1,	loop_1983
	movvs	%icc,	%i1,	%g6
	movrgz	%g7,	0x1F8,	%l2
loop_1982:
	orn	%l5,	0x09D6,	%i7
loop_1983:
	fpadd32	%f16,	%f16,	%f6
	tl	%xcc,	0x7
	nop
	setx loop_1984, %l0, %l1
	jmpl %l1, %l3
	tcc	%xcc,	0x4
	sll	%g5,	0x02,	%i5
	edge8	%i3,	%i0,	%g4
loop_1984:
	alignaddr	%l0,	%o5,	%g2
	taddcc	%o3,	%o0,	%i6
	fmovdpos	%icc,	%f1,	%f1
	orncc	%o4,	0x0F69,	%l1
	bleu,a	loop_1985
	fmul8x16au	%f19,	%f12,	%f20
	brlez,a	%g1,	loop_1986
	movg	%xcc,	%o7,	%o6
loop_1985:
	addcc	%g3,	0x0AFB,	%i2
	fcmple16	%f0,	%f26,	%i4
loop_1986:
	bcs,a,pn	%xcc,	loop_1987
	orcc	%o1,	0x0DB6,	%l6
	tl	%icc,	0x4
	subccc	%l4,	0x0F35,	%i1
loop_1987:
	fbue	%fcc3,	loop_1988
	fone	%f14
	set	0x6B, %o5
	ldsba	[%l7 + %o5] 0x10,	%o2
loop_1988:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f8,	%f20,	%f22
	fmovdvs	%icc,	%f6,	%f11
	fnor	%f24,	%f2,	%f18
	edge16	%g7,	%l2,	%l5
	mulx	%i7,	%l3,	%g6
	fbl	%fcc2,	loop_1989
	edge16l	%g5,	%i5,	%i0
	subccc	%i3,	0x1813,	%g4
	edge32l	%o5,	%g2,	%o3
loop_1989:
	nop
	set	0x3C, %g7
	stwa	%o0,	[%l7 + %g7] 0x27
	membar	#Sync
	nop
	setx loop_1990, %l0, %l1
	jmpl %l1, %i6
	sdiv	%o4,	0x1698,	%l0
	bcc	loop_1991
	movge	%icc,	%g1,	%o7
loop_1990:
	movn	%icc,	%l1,	%g3
	nop
	setx loop_1992, %l0, %l1
	jmpl %l1, %i2
loop_1991:
	fxor	%f28,	%f28,	%f16
	xorcc	%o6,	0x0BA2,	%i4
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x32] %asi,	%o1
loop_1992:
	siam	0x2
	popc	0x0C9E,	%l6
	srax	%i1,	0x03,	%o2
	edge8n	%l4,	%g7,	%l5
	st	%f3,	[%l7 + 0x2C]
	tn	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i7,	%l3
	ld	[%l7 + 0x5C],	%f17
	wr	%g0,	0x81,	%asi
	sta	%f1,	[%l7 + 0x08] %asi
	fmovsvs	%icc,	%f27,	%f24
	tge	%icc,	0x3
	movre	%g6,	0x359,	%l2
	fsrc2	%f28,	%f24
	fpack32	%f18,	%f4,	%f18
	pdist	%f26,	%f6,	%f16
	andn	%g5,	0x04A5,	%i0
	fba,a	%fcc2,	loop_1993
	fmovdcs	%icc,	%f21,	%f11
	andcc	%i3,	0x0BB2,	%g4
	fmovsvc	%icc,	%f6,	%f1
loop_1993:
	tle	%xcc,	0x0
	edge16ln	%o5,	%g2,	%i5
	brgz,a	%o0,	loop_1994
	array8	%i6,	%o4,	%l0
	tsubcctv	%o3,	%g1,	%o7
	tpos	%icc,	0x3
loop_1994:
	nop
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	stbar
	fmovdpos	%icc,	%f13,	%f24
	brgz,a	%g3,	loop_1995
	sir	0x0795
	tl	%icc,	0x6
	set	0x2C, %o0
	lda	[%l7 + %o0] 0x19,	%f20
loop_1995:
	tle	%icc,	0x7
	smul	%i2,	%l1,	%o6
	fbo	%fcc3,	loop_1996
	taddcc	%i4,	0x1345,	%l6
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x04,	%f0
loop_1996:
	tneg	%xcc,	0x2
	fmul8x16au	%f8,	%f16,	%f2
	tpos	%xcc,	0x4
	fcmpne16	%f24,	%f10,	%i1
	set	0x64, %i3
	sta	%f12,	[%l7 + %i3] 0x18
	fmovs	%f28,	%f8
	edge32	%o2,	%l4,	%g7
	movpos	%icc,	%o1,	%i7
	tvs	%icc,	0x5
	wr	%g0,	0xe2,	%asi
	stha	%l3,	[%l7 + 0x60] %asi
	membar	#Sync
	array32	%g6,	%l2,	%l5
	edge16l	%i0,	%g5,	%i3
	fmovde	%xcc,	%f30,	%f27
	movneg	%xcc,	%o5,	%g4
	fsrc2	%f4,	%f18
	sub	%g2,	0x1D9B,	%o0
	andn	%i6,	0x02A6,	%i5
	srl	%o4,	0x14,	%l0
	fmovrslz	%o3,	%f5,	%f19
	fmovdgu	%xcc,	%f8,	%f15
	set	0x78, %i2
	lduwa	[%l7 + %i2] 0x04,	%g1
	movgu	%xcc,	%o7,	%i2
	movneg	%icc,	%g3,	%l1
	fbn,a	%fcc1,	loop_1997
	umul	%i4,	%l6,	%i1
	sth	%o2,	[%l7 + 0x40]
	edge8ln	%o6,	%g7,	%l4
loop_1997:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%i7
	fblg,a	%fcc2,	loop_1998
	fmovs	%f9,	%f16
	fcmple16	%f12,	%f24,	%l3
	fmovrdgz	%g6,	%f2,	%f18
loop_1998:
	edge32l	%l2,	%o1,	%i0
	fmovsleu	%icc,	%f21,	%f11
	movrgez	%l5,	%i3,	%o5
	edge8	%g5,	%g4,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2a,	%asi
	stwa	%g2,	[%l7 + 0x64] %asi
	membar	#Sync
	bne,a	loop_1999
	tvc	%icc,	0x4
	movrgz	%i5,	0x2C6,	%i6
	movge	%icc,	%l0,	%o3
loop_1999:
	bleu,pn	%icc,	loop_2000
	sdivx	%g1,	0x0A4C,	%o4
	fpsub16	%f2,	%f14,	%f2
	std	%i2,	[%l7 + 0x08]
loop_2000:
	fmovda	%xcc,	%f31,	%f29
	movcc	%xcc,	%o7,	%g3
	edge16l	%i4,	%l6,	%l1
	sll	%o2,	%i1,	%g7
	fcmped	%fcc3,	%f28,	%f8
	fnot1	%f28,	%f16
	fabss	%f29,	%f30
	ta	%xcc,	0x5
	set	0x10, %o6
	ldxa	[%g0 + %o6] 0x4f,	%o6
	tvc	%xcc,	0x6
	movneg	%icc,	%i7,	%l4
	movrne	%g6,	%l3,	%o1
	ldx	[%l7 + 0x20],	%l2
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i0
	fmovdle	%icc,	%f17,	%f14
	fzeros	%f23
	taddcc	%l5,	%o5,	%g5
	edge16n	%i3,	%g4,	%o0
	movrgez	%i5,	%i6,	%g2
	bgu,pn	%icc,	loop_2001
	sdiv	%o3,	0x0654,	%g1
	ldsh	[%l7 + 0x62],	%l0
	edge8	%i2,	%o7,	%o4
loop_2001:
	edge16	%g3,	%l6,	%l1
	fcmpeq16	%f30,	%f6,	%o2
	std	%i4,	[%l7 + 0x28]
	sub	%g7,	0x1874,	%i1
	umulcc	%i7,	%o6,	%l4
	add	%g6,	%o1,	%l3
	tneg	%xcc,	0x0
	tvc	%xcc,	0x1
	bneg	%xcc,	loop_2002
	sra	%l2,	%l5,	%o5
	fble	%fcc1,	loop_2003
	umul	%g5,	0x08DE,	%i0
loop_2002:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i3,	%o0,	%i5
loop_2003:
	sll	%g4,	0x05,	%i6
	fnot1s	%f20,	%f21
	subcc	%g2,	0x0E45,	%o3
	fbule	%fcc1,	loop_2004
	brgez	%l0,	loop_2005
	taddcc	%g1,	%i2,	%o4
	alignaddr	%g3,	%o7,	%l1
loop_2004:
	fpadd32	%f8,	%f0,	%f18
loop_2005:
	movpos	%icc,	%o2,	%i4
	movne	%xcc,	%g7,	%i1
	udivx	%l6,	0x08AB,	%i7
	sll	%l4,	0x07,	%o6
	xorcc	%g6,	0x0AD0,	%l3
	addccc	%o1,	%l5,	%o5
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x60] %asi,	%g5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x74] %asi,	%l2
	movle	%xcc,	%i0,	%o0
	fcmps	%fcc0,	%f17,	%f31
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x20] %asi,	%f22
	fmovdle	%xcc,	%f26,	%f14
	fcmpd	%fcc1,	%f26,	%f0
	tcs	%icc,	0x2
	movrlz	%i3,	%i5,	%g4
	fmul8x16al	%f6,	%f20,	%f12
	be,a,pt	%xcc,	loop_2006
	fpsub32	%f22,	%f28,	%f20
	ldsb	[%l7 + 0x3B],	%i6
	membar	0x03
loop_2006:
	edge32l	%g2,	%l0,	%o3
	bge,pt	%icc,	loop_2007
	tleu	%xcc,	0x4
	fbg	%fcc1,	loop_2008
	movcs	%xcc,	%i2,	%o4
loop_2007:
	fmovrse	%g3,	%f16,	%f21
	sllx	%g1,	%o7,	%l1
loop_2008:
	tne	%xcc,	0x4
	sllx	%o2,	0x16,	%g7
	fmovsleu	%icc,	%f22,	%f31
	addcc	%i1,	0x09E6,	%l6
	sra	%i7,	0x0C,	%i4
	tvc	%icc,	0x7
	movrlez	%l4,	0x325,	%g6
	sra	%o6,	%o1,	%l3
	brgez	%l5,	loop_2009
	fmovda	%xcc,	%f14,	%f29
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x1e
	membar	#Sync
loop_2009:
	for	%f24,	%f18,	%f28
	movvc	%icc,	%g5,	%o5
	movne	%xcc,	%l2,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x3
	bvc,pn	%icc,	loop_2010
	fmuld8sux16	%f2,	%f24,	%f26
	bl,a	loop_2011
	orn	%i0,	0x192A,	%i5
loop_2010:
	brnz,a	%g4,	loop_2012
	ldub	[%l7 + 0x58],	%i6
loop_2011:
	move	%icc,	%g2,	%l0
	fcmpd	%fcc1,	%f14,	%f18
loop_2012:
	ld	[%l7 + 0x0C],	%f25
	sth	%i3,	[%l7 + 0x7A]
	subc	%i2,	0x0DA0,	%o4
	movcc	%xcc,	%g3,	%g1
	tge	%xcc,	0x1
	movcs	%icc,	%o7,	%l1
	tne	%xcc,	0x6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%g7
	bgu	loop_2013
	fbul	%fcc0,	loop_2014
	brgz,a	%i1,	loop_2015
	edge16ln	%l6,	%o3,	%i7
loop_2013:
	movrne	%i4,	0x261,	%l4
loop_2014:
	mulscc	%o6,	0x1E27,	%o1
loop_2015:
	array32	%g6,	%l5,	%g5
	bge,a	%xcc,	loop_2016
	fbue,a	%fcc0,	loop_2017
	orcc	%l3,	%o5,	%l2
	fmovsle	%icc,	%f24,	%f7
loop_2016:
	nop
	setx loop_2018, %l0, %l1
	jmpl %l1, %i0
loop_2017:
	movre	%i5,	0x230,	%o0
	array16	%i6,	%g2,	%g4
	umul	%i3,	0x05E7,	%i2
loop_2018:
	fbuge	%fcc0,	loop_2019
	edge8l	%l0,	%o4,	%g3
	mova	%xcc,	%g1,	%l1
	sir	0x0F57
loop_2019:
	fpsub32	%f16,	%f12,	%f18
	fornot2	%f0,	%f0,	%f28
	edge16ln	%o2,	%g7,	%o7
	fmovdvc	%xcc,	%f23,	%f31
	fcmpeq16	%f24,	%f22,	%l6
	orcc	%i1,	%i7,	%i4
	mulscc	%o3,	%l4,	%o1
	mulscc	%g6,	%l5,	%o6
	movvs	%icc,	%l3,	%g5
	alignaddrl	%l2,	%o5,	%i5
	bgu	%icc,	loop_2020
	array32	%i0,	%o0,	%i6
	fmovsn	%xcc,	%f17,	%f16
	brlz	%g4,	loop_2021
loop_2020:
	ldsw	[%l7 + 0x64],	%g2
	sdivcc	%i2,	0x0737,	%l0
	tn	%xcc,	0x1
loop_2021:
	udiv	%i3,	0x1382,	%o4
	movn	%xcc,	%g3,	%g1
	edge8	%o2,	%g7,	%o7
	fmovsleu	%xcc,	%f27,	%f12
	movg	%xcc,	%l1,	%i1
	fmovdge	%xcc,	%f13,	%f14
	tneg	%icc,	0x2
	edge32ln	%l6,	%i7,	%o3
	xnor	%i4,	%l4,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l5,	0x0DCC,	%o6
	fcmpgt32	%f30,	%f6,	%l3
	smulcc	%g5,	0x0156,	%g6
	mulx	%l2,	%i5,	%i0
	wr	%g0,	0x10,	%asi
	stba	%o5,	[%l7 + 0x38] %asi
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x30] %asi,	%o0
	sll	%i6,	0x1A,	%g2
	sdiv	%g4,	0x12D0,	%i2
	tleu	%xcc,	0x6
	fabsd	%f14,	%f0
	fornot2	%f22,	%f16,	%f18
	bg,pt	%icc,	loop_2022
	fmul8x16au	%f30,	%f10,	%f14
	movcs	%xcc,	%i3,	%o4
	tsubcc	%l0,	0x00DE,	%g3
loop_2022:
	subc	%g1,	0x0CF7,	%o2
	fmovsge	%icc,	%f2,	%f5
	fbue	%fcc3,	loop_2023
	sdivcc	%o7,	0x08F0,	%l1
	brlez,a	%g7,	loop_2024
	xnor	%l6,	%i1,	%o3
loop_2023:
	fmovscc	%icc,	%f2,	%f1
	alignaddr	%i7,	%l4,	%o1
loop_2024:
	nop
	set	0x64, %l2
	ldsba	[%l7 + %l2] 0x11,	%l5
	ta	%xcc,	0x7
	sdivcc	%i4,	0x028C,	%l3
	mulx	%g5,	%g6,	%l2
	set	0x29, %l3
	ldstuba	[%l7 + %l3] 0x88,	%i5
	orn	%i0,	0x0439,	%o6
	orncc	%o5,	%i6,	%g2
	edge32l	%o0,	%i2,	%g4
	fbge	%fcc0,	loop_2025
	prefetch	[%l7 + 0x0C],	 0x1
	sll	%o4,	0x0B,	%i3
	taddcc	%l0,	0x01F8,	%g3
loop_2025:
	ld	[%l7 + 0x6C],	%f13
	ldstub	[%l7 + 0x79],	%g1
	fcmpgt16	%f18,	%f20,	%o7
	bgu,pt	%xcc,	loop_2026
	subc	%l1,	0x0AAC,	%g7
	fcmpgt32	%f0,	%f20,	%l6
	xnor	%i1,	%o3,	%i7
loop_2026:
	ta	%xcc,	0x2
	bshuffle	%f4,	%f8,	%f6
	smulcc	%l4,	%o2,	%o1
	addcc	%l5,	%l3,	%g5
	sth	%i4,	[%l7 + 0x3E]
	fmovdleu	%icc,	%f26,	%f5
	srax	%l2,	0x19,	%g6
	udivx	%i5,	0x06DE,	%o6
	tcs	%icc,	0x1
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x17
	membar	#Sync
	mulscc	%o5,	%i0,	%g2
	sir	0x0CC3
	fmul8sux16	%f12,	%f0,	%f30
	udivcc	%i6,	0x10B5,	%o0
	addc	%i2,	0x09F1,	%o4
	udivx	%g4,	0x046A,	%i3
	ldx	[%l7 + 0x10],	%g3
	udivcc	%g1,	0x102A,	%l0
	sll	%l1,	0x16,	%g7
	for	%f6,	%f4,	%f20
	addc	%o7,	%l6,	%o3
	ldsh	[%l7 + 0x3E],	%i1
	ldd	[%l7 + 0x20],	%i6
	sub	%l4,	0x0B39,	%o2
	sdivx	%o1,	0x16C7,	%l5
	tne	%xcc,	0x5
	ble,a	loop_2027
	fmovrslz	%l3,	%f1,	%f1
	ldd	[%l7 + 0x40],	%g4
	popc	%l2,	%i4
loop_2027:
	smulcc	%i5,	%g6,	%o6
	brgz	%i0,	loop_2028
	taddcc	%g2,	0x122B,	%i6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o0
loop_2028:
	srlx	%i2,	0x09,	%o4
	udiv	%g4,	0x0737,	%o5
	st	%f23,	[%l7 + 0x60]
	fmovs	%f24,	%f6
	fbo	%fcc1,	loop_2029
	sub	%i3,	0x04B2,	%g3
	popc	%l0,	%l1
	movl	%icc,	%g1,	%g7
loop_2029:
	swap	[%l7 + 0x5C],	%o7
	fbe	%fcc0,	loop_2030
	and	%l6,	%i1,	%o3
	fcmpne16	%f18,	%f0,	%l4
	umulcc	%i7,	0x02D3,	%o1
loop_2030:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%o2
	set	0x24, %i6
	stwa	%l3,	[%l7 + %i6] 0x2f
	membar	#Sync
	sdivcc	%g5,	0x08A1,	%l5
	fabss	%f23,	%f19
	and	%i4,	%i5,	%l2
	ble,a	%xcc,	loop_2031
	fbule,a	%fcc0,	loop_2032
	te	%icc,	0x6
	sdiv	%g6,	0x1380,	%o6
loop_2031:
	std	%f26,	[%l7 + 0x48]
loop_2032:
	edge32l	%i0,	%i6,	%o0
	tvc	%xcc,	0x1
	stbar
	tne	%icc,	0x6
	srlx	%g2,	0x1E,	%i2
	mulscc	%o4,	%g4,	%i3
	fcmpd	%fcc2,	%f28,	%f28
	edge8l	%g3,	%l0,	%l1
	andcc	%g1,	%g7,	%o5
	bcs,pt	%icc,	loop_2033
	edge16l	%l6,	%o7,	%i1
	fsrc1	%f18,	%f4
	movrlez	%l4,	%i7,	%o3
loop_2033:
	movrgz	%o1,	%o2,	%l3
	fmovsg	%icc,	%f27,	%f30
	wr	%g0,	0x22,	%asi
	stba	%g5,	[%l7 + 0x48] %asi
	membar	#Sync
	fpmerge	%f17,	%f23,	%f26
	fmovdvs	%xcc,	%f23,	%f11
	mulscc	%l5,	0x08ED,	%i4
	srl	%l2,	%g6,	%i5
	fmovdcs	%icc,	%f19,	%f13
	ld	[%l7 + 0x44],	%f23
	faligndata	%f8,	%f20,	%f0
	movcs	%icc,	%o6,	%i6
	move	%icc,	%o0,	%i0
	add	%i2,	0x0558,	%g2
	subccc	%g4,	%o4,	%g3
	fmovrslez	%l0,	%f26,	%f14
	edge8n	%i3,	%g1,	%g7
	brlz,a	%l1,	loop_2034
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o5,	%o7
	movrgez	%i1,	%l6,	%l4
loop_2034:
	tsubcctv	%i7,	%o1,	%o2
	sdivcc	%o3,	0x0A53,	%l3
	popc	0x01AF,	%g5
	stb	%l5,	[%l7 + 0x1B]
	set	0x08, %o4
	lduha	[%l7 + %o4] 0x80,	%l2
	edge32l	%i4,	%i5,	%g6
	fbu,a	%fcc1,	loop_2035
	tpos	%icc,	0x3
	fbg,a	%fcc2,	loop_2036
	membar	0x1E
loop_2035:
	udivcc	%i6,	0x13D3,	%o0
	umulcc	%o6,	%i0,	%g2
loop_2036:
	umul	%g4,	0x1EF1,	%i2
	tgu	%icc,	0x1
	bcs	%xcc,	loop_2037
	sethi	0x0039,	%o4
	sdivx	%g3,	0x0199,	%i3
	tvc	%icc,	0x0
loop_2037:
	fble	%fcc2,	loop_2038
	fbge,a	%fcc0,	loop_2039
	smulcc	%g1,	0x03FF,	%g7
	fble	%fcc2,	loop_2040
loop_2038:
	udiv	%l1,	0x074D,	%l0
loop_2039:
	fmovdgu	%xcc,	%f31,	%f18
	and	%o5,	%i1,	%l6
loop_2040:
	andcc	%l4,	0x0610,	%i7
	edge8	%o7,	%o2,	%o1
	udiv	%o3,	0x1EB4,	%l3
	movvc	%xcc,	%g5,	%l2
	fpack16	%f12,	%f2
	alignaddr	%l5,	%i4,	%i5
	bpos,a,pt	%icc,	loop_2041
	smulcc	%i6,	%o0,	%g6
	xorcc	%o6,	%i0,	%g2
	bvc	loop_2042
loop_2041:
	flush	%l7 + 0x68
	tleu	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2042:
	udivx	%g4,	0x1376,	%o4
	orn	%g3,	%i2,	%g1
	edge16	%i3,	%l1,	%l0
	fabss	%f20,	%f27
	movl	%xcc,	%g7,	%i1
	or	%o5,	%l6,	%l4
	movle	%xcc,	%o7,	%o2
	fbg,a	%fcc1,	loop_2043
	movcc	%icc,	%i7,	%o3
	edge16	%o1,	%l3,	%g5
	fnot1s	%f1,	%f10
loop_2043:
	nop
	set	0x6E, %g4
	ldstuba	[%l7 + %g4] 0x0c,	%l2
	tcc	%xcc,	0x3
	fcmpgt16	%f30,	%f0,	%i4
	fmovdne	%xcc,	%f15,	%f3
	brgz,a	%i5,	loop_2044
	srlx	%l5,	%i6,	%g6
	set	0x74, %o2
	stba	%o0,	[%l7 + %o2] 0x27
	membar	#Sync
loop_2044:
	fbl,a	%fcc2,	loop_2045
	srax	%i0,	%o6,	%g4
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f6
	bneg,a	%icc,	loop_2046
loop_2045:
	taddcc	%o4,	%g2,	%g3
	fbule	%fcc2,	loop_2047
	orn	%g1,	0x02F6,	%i2
loop_2046:
	alignaddrl	%i3,	%l1,	%l0
	std	%i0,	[%l7 + 0x68]
loop_2047:
	fxors	%f13,	%f4,	%f13
	set	0x210, %i1
	ldxa	[%g0 + %i1] 0x52,	%o5
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0x3
	tne	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l4,	0x0FBD,	%o7
	fblg	%fcc2,	loop_2048
	sdivx	%o2,	0x1675,	%i7
	sethi	0x1113,	%o3
	fmovrslez	%o1,	%f7,	%f31
loop_2048:
	udiv	%l6,	0x0071,	%l3
	fsrc2	%f30,	%f18
	andcc	%l2,	%i4,	%i5
	tneg	%icc,	0x6
	movcs	%xcc,	%l5,	%g5
	fbuge	%fcc1,	loop_2049
	movrlez	%i6,	%o0,	%i0
	movvc	%icc,	%o6,	%g6
	bcc,a,pt	%xcc,	loop_2050
loop_2049:
	bleu	%xcc,	loop_2051
	fmovdcc	%icc,	%f23,	%f27
	fpmerge	%f24,	%f12,	%f30
loop_2050:
	srl	%o4,	%g2,	%g4
loop_2051:
	fmovsle	%icc,	%f2,	%f14
	edge16n	%g1,	%g3,	%i3
	udivx	%l1,	0x19F6,	%l0
	sub	%i2,	0x13CB,	%o5
	movrlz	%i1,	0x31B,	%g7
	orncc	%l4,	0x0025,	%o2
	subccc	%o7,	%i7,	%o3
	set	0x34, %g3
	lduwa	[%l7 + %g3] 0x88,	%l6
	smulcc	%o1,	%l2,	%i4
	bg,pn	%xcc,	loop_2052
	swap	[%l7 + 0x50],	%l3
	array16	%i5,	%g5,	%i6
	subc	%l5,	0x167F,	%o0
loop_2052:
	addc	%o6,	%i0,	%o4
	lduw	[%l7 + 0x3C],	%g6
	movrlez	%g2,	%g1,	%g4
	tsubcc	%g3,	%l1,	%l0
	fbo	%fcc3,	loop_2053
	te	%icc,	0x7
	tneg	%xcc,	0x4
	fcmps	%fcc0,	%f18,	%f25
loop_2053:
	sllx	%i3,	%o5,	%i1
	set	0x28, %g5
	lduba	[%l7 + %g5] 0x88,	%i2
	fbne	%fcc0,	loop_2054
	sll	%g7,	%o2,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i7,	0x01D9,	%l4
loop_2054:
	fmovsl	%xcc,	%f18,	%f12
	fxor	%f0,	%f22,	%f24
	call	loop_2055
	edge16ln	%o3,	%l6,	%l2
	movne	%icc,	%i4,	%o1
	fnegd	%f16,	%f0
loop_2055:
	fsrc2	%f14,	%f14
	tvs	%xcc,	0x3
	movrgz	%l3,	%i5,	%i6
	fone	%f6
	umulcc	%l5,	0x0F89,	%g5
	fnand	%f18,	%f6,	%f8
	movleu	%icc,	%o0,	%o6
	xor	%o4,	0x1111,	%i0
	stw	%g2,	[%l7 + 0x40]
	brz	%g6,	loop_2056
	smulcc	%g4,	%g1,	%l1
	movcs	%xcc,	%l0,	%i3
	edge16	%g3,	%o5,	%i1
loop_2056:
	and	%i2,	0x1F92,	%o2
	fpsub16	%f4,	%f8,	%f2
	fcmpes	%fcc0,	%f11,	%f26
	xorcc	%g7,	0x16CB,	%o7
	edge8ln	%l4,	%i7,	%l6
	tvs	%xcc,	0x1
	ldx	[%l7 + 0x28],	%l2
	fbug,a	%fcc3,	loop_2057
	udivcc	%o3,	0x034C,	%o1
	edge32n	%l3,	%i4,	%i6
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2057:
	nop
	wr	%g0,	0x10,	%asi
	stha	%l5,	[%l7 + 0x42] %asi
	bleu,pn	%icc,	loop_2058
	fbg	%fcc0,	loop_2059
	edge8	%i5,	%o0,	%o6
	tvs	%icc,	0x1
loop_2058:
	fxor	%f24,	%f18,	%f8
loop_2059:
	edge16ln	%g5,	%o4,	%g2
	tcs	%icc,	0x1
	fbl	%fcc0,	loop_2060
	addcc	%g6,	%g4,	%g1
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x11,	%l1
loop_2060:
	bleu,a,pt	%xcc,	loop_2061
	edge32ln	%i0,	%i3,	%l0
	movgu	%xcc,	%o5,	%i1
	edge16n	%g3,	%o2,	%i2
loop_2061:
	fmovrdne	%o7,	%f2,	%f0
	fmovs	%f24,	%f9
	brgez	%l4,	loop_2062
	fpmerge	%f20,	%f23,	%f20
	tgu	%xcc,	0x1
	fpadd16s	%f23,	%f9,	%f26
loop_2062:
	fornot1s	%f18,	%f30,	%f30
	fmovrsne	%i7,	%f10,	%f18
	fcmpne32	%f4,	%f12,	%g7
	wr	%g0,	0x88,	%asi
	stha	%l2,	[%l7 + 0x56] %asi
	udivx	%o3,	0x0A26,	%o1
	edge8	%l6,	%l3,	%i4
	addc	%l5,	0x11CC,	%i6
	fbe	%fcc1,	loop_2063
	andcc	%o0,	%o6,	%i5
	tgu	%xcc,	0x3
	edge8ln	%g5,	%g2,	%o4
loop_2063:
	tvs	%icc,	0x3
	movrlz	%g4,	%g1,	%g6
	fornot2s	%f12,	%f1,	%f7
	bcs,a	loop_2064
	movle	%icc,	%i0,	%i3
	udiv	%l1,	0x1E69,	%l0
	fbg	%fcc2,	loop_2065
loop_2064:
	te	%icc,	0x6
	stw	%i1,	[%l7 + 0x38]
	fcmpes	%fcc2,	%f22,	%f2
loop_2065:
	tpos	%icc,	0x2
	udivx	%g3,	0x021B,	%o2
	edge16n	%i2,	%o7,	%o5
	edge32l	%i7,	%g7,	%l4
	xnorcc	%o3,	0x0A0D,	%l2
	bleu,a	%icc,	loop_2066
	fble	%fcc1,	loop_2067
	fbue	%fcc1,	loop_2068
	fmovrse	%o1,	%f17,	%f4
loop_2066:
	orn	%l3,	0x043D,	%i4
loop_2067:
	ta	%xcc,	0x3
loop_2068:
	stx	%l5,	[%l7 + 0x50]
	movle	%icc,	%l6,	%o0
	prefetch	[%l7 + 0x74],	 0x3
	ldub	[%l7 + 0x5F],	%o6
	movre	%i6,	0x040,	%g5
	tsubcc	%i5,	0x066E,	%o4
	bn,a	loop_2069
	fbge	%fcc2,	loop_2070
	subcc	%g4,	%g1,	%g2
	edge32ln	%g6,	%i0,	%l1
loop_2069:
	ta	%icc,	0x1
loop_2070:
	subcc	%l0,	0x1456,	%i1
	fcmpne16	%f24,	%f8,	%i3
	fmovrslez	%g3,	%f30,	%f24
	sllx	%i2,	0x14,	%o2
	edge8l	%o7,	%o5,	%i7
	fpsub16	%f10,	%f24,	%f6
	andcc	%g7,	%l4,	%l2
	fmovdvc	%icc,	%f20,	%f6
	tn	%icc,	0x7
	taddcc	%o1,	%o3,	%i4
	andncc	%l5,	%l3,	%o0
	bcc	%xcc,	loop_2071
	tvc	%xcc,	0x4
	brgez,a	%l6,	loop_2072
	taddcctv	%i6,	0x05A7,	%o6
loop_2071:
	for	%f12,	%f6,	%f14
	brlz,a	%i5,	loop_2073
loop_2072:
	fmovsle	%xcc,	%f24,	%f14
	edge8	%o4,	%g5,	%g1
	fmovsne	%icc,	%f7,	%f1
loop_2073:
	mulscc	%g4,	%g2,	%i0
	stx	%g6,	[%l7 + 0x40]
	movneg	%icc,	%l1,	%l0
	orncc	%i3,	%g3,	%i1
	xor	%o2,	0x1FE4,	%i2
	fba	%fcc1,	loop_2074
	fandnot1	%f0,	%f24,	%f18
	xnorcc	%o5,	0x01D3,	%o7
	fzero	%f28
loop_2074:
	sll	%g7,	0x1A,	%i7
	movrlz	%l4,	0x31F,	%l2
	fbo	%fcc2,	loop_2075
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,pt	%xcc,	loop_2076
	movrgez	%o1,	0x076,	%i4
loop_2075:
	fmovdn	%xcc,	%f15,	%f5
	or	%l5,	0x196B,	%l3
loop_2076:
	fbn	%fcc1,	loop_2077
	fzeros	%f4
	bg,a,pt	%icc,	loop_2078
	tcc	%xcc,	0x0
loop_2077:
	movrgz	%o3,	%l6,	%o0
	brlez	%i6,	loop_2079
loop_2078:
	sdivcc	%o6,	0x07FA,	%o4
	fmul8x16al	%f8,	%f16,	%f28
	bcc	%icc,	loop_2080
loop_2079:
	sub	%i5,	0x0382,	%g5
	sdivcc	%g4,	0x15D6,	%g1
	tl	%xcc,	0x5
loop_2080:
	edge32ln	%g2,	%g6,	%l1
	fmovrde	%i0,	%f24,	%f20
	fandnot2	%f12,	%f0,	%f8
	orn	%l0,	0x1BB7,	%i3
	stb	%i1,	[%l7 + 0x6C]
	sub	%g3,	%o2,	%o5
	bcc,pn	%xcc,	loop_2081
	movn	%icc,	%o7,	%g7
	movcc	%xcc,	%i2,	%l4
	fmul8ulx16	%f22,	%f30,	%f10
loop_2081:
	ldx	[%l7 + 0x60],	%i7
	movre	%l2,	%o1,	%l5
	fmovsne	%icc,	%f31,	%f3
	fmovsg	%xcc,	%f20,	%f19
	brgz	%i4,	loop_2082
	fnand	%f4,	%f16,	%f0
	andcc	%o3,	0x0D71,	%l3
	tpos	%icc,	0x1
loop_2082:
	smul	%o0,	0x015A,	%l6
	srax	%o6,	%i6,	%o4
	or	%g5,	0x122A,	%g4
	edge32l	%g1,	%g2,	%g6
	edge8l	%i5,	%i0,	%l1
	umulcc	%l0,	0x0259,	%i1
	fblg	%fcc1,	loop_2083
	andn	%g3,	%o2,	%o5
	fblg	%fcc3,	loop_2084
	tvc	%icc,	0x5
loop_2083:
	xor	%o7,	0x09CB,	%i3
	fnot1	%f30,	%f10
loop_2084:
	brnz,a	%g7,	loop_2085
	ta	%xcc,	0x7
	brz	%i2,	loop_2086
	movpos	%xcc,	%l4,	%l2
loop_2085:
	nop
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
loop_2086:
	tne	%xcc,	0x6
	movleu	%icc,	%o1,	%l5
	tl	%icc,	0x4
	set	0x48, %l5
	sta	%f27,	[%l7 + %l5] 0x88
	tl	%icc,	0x6
	tcs	%xcc,	0x0
	movneg	%xcc,	%i4,	%o3
	fand	%f2,	%f12,	%f24
	fmovdle	%icc,	%f16,	%f13
	tg	%xcc,	0x3
	tneg	%icc,	0x0
	fmovsgu	%xcc,	%f31,	%f7
	bneg,pt	%icc,	loop_2087
	fornot1	%f24,	%f16,	%f12
	fbg	%fcc2,	loop_2088
	st	%f31,	[%l7 + 0x28]
loop_2087:
	fpsub16s	%f0,	%f30,	%f7
	subcc	%o0,	0x1EA8,	%l6
loop_2088:
	sdivx	%l3,	0x0194,	%o6
	taddcc	%i6,	%o4,	%g5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%g1
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x80,	%g2
	bcs,a,pn	%xcc,	loop_2089
	te	%icc,	0x1
	movre	%g4,	%g6,	%i0
	edge32l	%i5,	%l0,	%l1
loop_2089:
	edge32ln	%g3,	%i1,	%o5
	andncc	%o7,	%i3,	%o2
	sub	%i2,	%g7,	%l2
	fbu	%fcc2,	loop_2090
	tge	%icc,	0x2
	fcmps	%fcc0,	%f26,	%f6
	bne,a	loop_2091
loop_2090:
	ldsb	[%l7 + 0x7C],	%l4
	fnegs	%f15,	%f30
	array8	%o1,	%i7,	%l5
loop_2091:
	move	%xcc,	%o3,	%i4
	tl	%icc,	0x7
	fmovdleu	%icc,	%f30,	%f24
	fmuld8ulx16	%f5,	%f13,	%f20
	std	%o0,	[%l7 + 0x78]
	brlez	%l6,	loop_2092
	fnors	%f28,	%f10,	%f3
	bneg	%xcc,	loop_2093
	tne	%xcc,	0x4
loop_2092:
	mova	%icc,	%o6,	%i6
	ta	%xcc,	0x2
loop_2093:
	sdivcc	%l3,	0x1527,	%o4
	andcc	%g1,	0x0372,	%g5
	alignaddr	%g2,	%g4,	%i0
	movrgz	%i5,	%l0,	%g6
	edge32l	%l1,	%i1,	%o5
	tgu	%xcc,	0x6
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x19,	 0x2
	fcmpeq32	%f20,	%f2,	%i3
	st	%f18,	[%l7 + 0x28]
	fbg,a	%fcc2,	loop_2094
	movpos	%xcc,	%g3,	%o2
	edge32n	%g7,	%i2,	%l2
	tle	%icc,	0x2
loop_2094:
	fxor	%f14,	%f6,	%f4
	xor	%l4,	%i7,	%o1
	fnegd	%f22,	%f20
	tn	%icc,	0x2
	brgz	%l5,	loop_2095
	addcc	%i4,	0x0754,	%o0
	fmovsne	%icc,	%f13,	%f15
	umulcc	%l6,	%o6,	%o3
loop_2095:
	ldsh	[%l7 + 0x6C],	%i6
	array32	%o4,	%g1,	%l3
	bge,pn	%icc,	loop_2096
	nop
	set	0x7C, %l6
	prefetch	[%l7 + %l6],	 0x0
	fmovdge	%icc,	%f0,	%f11
	addcc	%g2,	0x19D1,	%g4
loop_2096:
	umul	%i0,	%g5,	%i5
	subc	%l0,	0x0DC9,	%g6
	udiv	%l1,	0x1272,	%i1
	xnorcc	%o5,	0x02F4,	%o7
	fcmpd	%fcc3,	%f12,	%f26
	fcmple32	%f14,	%f2,	%g3
	fbo,a	%fcc3,	loop_2097
	edge16ln	%i3,	%g7,	%i2
	edge16n	%o2,	%l2,	%l4
	fmovd	%f30,	%f28
loop_2097:
	edge8n	%i7,	%l5,	%o1
	fmovsneg	%xcc,	%f1,	%f4
	te	%xcc,	0x6
	or	%i4,	0x17F1,	%o0
	fpsub16	%f20,	%f16,	%f26
	xnorcc	%o6,	%o3,	%i6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%o4
	fnegs	%f17,	%f8
	mulx	%l6,	0x12C3,	%l3
	fnegd	%f8,	%f20
	brlz	%g2,	loop_2098
	movrgez	%g1,	0x2D5,	%g4
	membar	0x47
	movcc	%icc,	%g5,	%i0
loop_2098:
	fbuge	%fcc0,	loop_2099
	fmul8sux16	%f30,	%f10,	%f12
	fmovrdlez	%l0,	%f24,	%f6
	edge32ln	%g6,	%l1,	%i1
loop_2099:
	and	%o5,	%i5,	%g3
	fbue	%fcc0,	loop_2100
	move	%xcc,	%o7,	%i3
	orcc	%g7,	%o2,	%l2
	membar	0x00
loop_2100:
	tne	%icc,	0x5
	movleu	%xcc,	%l4,	%i2
	xnorcc	%l5,	0x00C4,	%i7
	movrne	%i4,	0x0A5,	%o0
	subc	%o1,	0x1F0D,	%o6
	fmovsle	%xcc,	%f2,	%f25
	sth	%o3,	[%l7 + 0x20]
	membar	0x42
	fmuld8sux16	%f8,	%f16,	%f10
	movn	%icc,	%i6,	%o4
	sth	%l3,	[%l7 + 0x42]
	fbo	%fcc0,	loop_2101
	fba	%fcc3,	loop_2102
	fmovrslez	%l6,	%f21,	%f25
	fbo	%fcc1,	loop_2103
loop_2101:
	fxors	%f22,	%f9,	%f0
loop_2102:
	tle	%xcc,	0x6
	tle	%xcc,	0x6
loop_2103:
	taddcctv	%g1,	0x19BC,	%g2
	bne	%xcc,	loop_2104
	ldsw	[%l7 + 0x74],	%g4
	alignaddrl	%g5,	%l0,	%g6
	fxnor	%f30,	%f28,	%f8
loop_2104:
	tle	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i0,	%i1
	fmovdleu	%xcc,	%f27,	%f2
	movrne	%l1,	0x381,	%o5
	bn,a	%xcc,	loop_2105
	movcc	%icc,	%g3,	%i5
	movle	%icc,	%i3,	%g7
	subc	%o2,	%l2,	%o7
loop_2105:
	tvs	%xcc,	0x7
	mova	%xcc,	%l4,	%l5
	fands	%f22,	%f17,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc1,	loop_2106
	fnor	%f0,	%f22,	%f22
	fmovrsgz	%i2,	%f17,	%f18
	tle	%xcc,	0x7
loop_2106:
	fmul8x16	%f25,	%f12,	%f2
	addccc	%i4,	0x140A,	%i7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%o1
	fornot2s	%f18,	%f7,	%f21
	movrlz	%o0,	%o6,	%o3
	andn	%o4,	0x19EE,	%l3
	fbue	%fcc2,	loop_2107
	movle	%xcc,	%i6,	%g1
	smulcc	%g2,	0x0C72,	%l6
	brlez	%g5,	loop_2108
loop_2107:
	movrlez	%l0,	%g6,	%i0
	sll	%i1,	0x19,	%l1
	addc	%g4,	%o5,	%g3
loop_2108:
	andncc	%i3,	%i5,	%o2
	movne	%xcc,	%l2,	%g7
	srl	%o7,	%l5,	%i2
	smul	%l4,	%i4,	%o1
	udivcc	%o0,	0x0BC2,	%o6
	lduh	[%l7 + 0x1C],	%o3
	fandnot2s	%f10,	%f24,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o4,	%i7
	fnors	%f27,	%f8,	%f11
	sdivcc	%l3,	0x047B,	%g1
	sll	%g2,	%l6,	%g5
	fpsub32	%f10,	%f22,	%f22
	edge16	%i6,	%g6,	%l0
	bne	%icc,	loop_2109
	edge32	%i1,	%i0,	%g4
	te	%xcc,	0x0
	movvs	%icc,	%o5,	%l1
loop_2109:
	array32	%g3,	%i5,	%i3
	fmovrsne	%l2,	%f12,	%f11
	fandnot2	%f2,	%f10,	%f20
	movg	%xcc,	%o2,	%g7
	sdivx	%l5,	0x1906,	%o7
	membar	0x03
	movle	%xcc,	%i2,	%i4
	bl,pn	%xcc,	loop_2110
	orncc	%o1,	%l4,	%o6
	membar	0x40
	srax	%o3,	0x1A,	%o4
loop_2110:
	movgu	%xcc,	%o0,	%i7
	fmovsn	%xcc,	%f12,	%f17
	movrgez	%g1,	0x05E,	%l3
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x70] %asi,	%f21
	srlx	%l6,	%g2,	%i6
	movrlz	%g5,	0x310,	%g6
	fsrc1	%f22,	%f30
	orncc	%l0,	0x1079,	%i1
	xor	%i0,	0x1A62,	%o5
	subcc	%g4,	0x02E6,	%l1
	fmovspos	%icc,	%f31,	%f30
	taddcc	%g3,	0x06D3,	%i5
	fcmpne16	%f30,	%f0,	%i3
	tvs	%icc,	0x0
	fors	%f21,	%f22,	%f30
	sdivx	%l2,	0x1CC0,	%g7
	mova	%icc,	%o2,	%l5
	fmuld8sux16	%f26,	%f7,	%f24
	movvs	%icc,	%i2,	%o7
	fcmpne32	%f12,	%f26,	%o1
	prefetch	[%l7 + 0x68],	 0x1
	tle	%icc,	0x2
	be,pn	%icc,	loop_2111
	movg	%xcc,	%l4,	%o6
	membar	0x67
	prefetch	[%l7 + 0x64],	 0x0
loop_2111:
	fmovsvs	%icc,	%f18,	%f9
	movvs	%icc,	%i4,	%o4
	tleu	%xcc,	0x6
	movleu	%icc,	%o0,	%o3
	fmovd	%f18,	%f16
	subcc	%g1,	0x0DAE,	%l3
	sra	%l6,	%g2,	%i7
	edge8ln	%i6,	%g6,	%g5
	fmovdcc	%icc,	%f3,	%f9
	fcmpeq32	%f20,	%f18,	%i1
	fmovdgu	%icc,	%f12,	%f20
	movgu	%xcc,	%l0,	%i0
	movrne	%g4,	0x3E0,	%l1
	fnot1s	%f7,	%f17
	sllx	%o5,	0x18,	%i5
	alignaddr	%i3,	%l2,	%g3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o2
	sll	%g7,	0x1A,	%i2
	siam	0x7
	brz,a	%o7,	loop_2112
	subccc	%l5,	%l4,	%o1
	orcc	%o6,	%o4,	%o0
	fmovsl	%xcc,	%f9,	%f7
loop_2112:
	bgu,pn	%icc,	loop_2113
	fmovrdlez	%i4,	%f22,	%f4
	movg	%icc,	%g1,	%l3
	movn	%icc,	%l6,	%g2
loop_2113:
	orn	%i7,	%i6,	%o3
	edge32ln	%g5,	%i1,	%l0
	tge	%xcc,	0x3
	flush	%l7 + 0x5C
	fors	%f30,	%f12,	%f1
	fpack16	%f24,	%f2
	movleu	%icc,	%i0,	%g6
	fcmple32	%f20,	%f26,	%g4
	edge8l	%o5,	%i5,	%l1
	array8	%l2,	%g3,	%o2
	fbul	%fcc1,	loop_2114
	sra	%g7,	0x1E,	%i3
	movrlez	%o7,	0x226,	%i2
	edge16ln	%l4,	%o1,	%o6
loop_2114:
	subc	%o4,	%l5,	%o0
	call	loop_2115
	bn,pt	%icc,	loop_2116
	fmovse	%xcc,	%f1,	%f26
	tg	%xcc,	0x3
loop_2115:
	xor	%i4,	%l3,	%g1
loop_2116:
	nop
	setx	loop_2117,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1s	%f22,	%f17,	%f5
	siam	0x1
	nop
	setx	loop_2118,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2117:
	sll	%g2,	0x12,	%l6
	nop
	setx	loop_2119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_2120,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2118:
	fcmple32	%f16,	%f10,	%i7
	tvs	%xcc,	0x7
loop_2119:
	udivx	%i6,	0x0875,	%g5
loop_2120:
	fba,a	%fcc1,	loop_2121
	fnot2	%f16,	%f16
	fpack16	%f8,	%f14
	alignaddr	%o3,	%i1,	%l0
loop_2121:
	tge	%icc,	0x3
	fbuge,a	%fcc3,	loop_2122
	andcc	%g6,	0x1177,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o5,	0x1CCA,	%i5
loop_2122:
	fmovda	%icc,	%f0,	%f31
	taddcctv	%g4,	%l1,	%g3
	fpsub16	%f8,	%f20,	%f30
	swap	[%l7 + 0x44],	%o2
	tpos	%xcc,	0x7
	fandnot1	%f0,	%f10,	%f4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%l2
	edge32n	%g7,	%o7,	%i3
	movrne	%i2,	%l4,	%o6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o1
	fnors	%f31,	%f13,	%f16
	smulcc	%o4,	0x175E,	%l5
	fmovsgu	%icc,	%f24,	%f29
	fmovrslez	%i4,	%f27,	%f8
	movvc	%icc,	%l3,	%g1
	sethi	0x1712,	%g2
	smulcc	%l6,	0x0632,	%o0
	fmovrslz	%i6,	%f30,	%f6
	fbne	%fcc0,	loop_2123
	ba	loop_2124
	movrgez	%g5,	%o3,	%i7
	orncc	%l0,	0x060E,	%i1
loop_2123:
	fnot2	%f20,	%f8
loop_2124:
	move	%icc,	%i0,	%o5
	edge8ln	%g6,	%i5,	%g4
	fzero	%f28
	subcc	%l1,	%o2,	%l2
	fbne,a	%fcc3,	loop_2125
	fxnor	%f8,	%f22,	%f26
	movne	%xcc,	%g7,	%g3
	fmul8sux16	%f30,	%f10,	%f16
loop_2125:
	stw	%o7,	[%l7 + 0x08]
	ta	%xcc,	0x3
	nop
	set	0x48, %g2
	prefetch	[%l7 + %g2],	 0x2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x68] %asi,	%f27
	fbge,a	%fcc1,	loop_2126
	fmovrdgz	%i3,	%f28,	%f20
	tcs	%icc,	0x7
	fand	%f8,	%f4,	%f0
loop_2126:
	edge8n	%i2,	%l4,	%o1
	edge8n	%o4,	%o6,	%i4
	sra	%l5,	%l3,	%g2
	set	0x5F, %i7
	lduba	[%l7 + %i7] 0x18,	%g1
	xor	%l6,	0x0A32,	%i6
	set	0x10, %i4
	stda	%g4,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x58, %l4
	stxa	%o3,	[%l7 + %l4] 0x19
	mulscc	%o0,	%i7,	%l0
	fornot1s	%f20,	%f26,	%f16
	edge32n	%i0,	%o5,	%i1
	tle	%xcc,	0x7
	orcc	%i5,	%g6,	%l1
	movvc	%icc,	%g4,	%l2
	xor	%o2,	0x0512,	%g7
	addccc	%g3,	0x0B5B,	%i3
	fbul	%fcc1,	loop_2127
	ldd	[%l7 + 0x30],	%o6
	orncc	%l4,	0x1A36,	%i2
	fbge,a	%fcc1,	loop_2128
loop_2127:
	sdivx	%o1,	0x0E49,	%o4
	fxnor	%f2,	%f6,	%f12
	fmovdge	%icc,	%f1,	%f5
loop_2128:
	movne	%xcc,	%o6,	%i4
	fbug	%fcc1,	loop_2129
	brz,a	%l3,	loop_2130
	smulcc	%g2,	0x1ED1,	%g1
	orcc	%l6,	%l5,	%i6
loop_2129:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2130:
	stw	%g5,	[%l7 + 0x50]
	fmovdg	%icc,	%f21,	%f17
	array32	%o0,	%i7,	%l0
	bne,a,pn	%xcc,	loop_2131
	umulcc	%o3,	0x1C37,	%i0
	edge8	%i1,	%o5,	%i5
	ld	[%l7 + 0x0C],	%f22
loop_2131:
	sdivx	%g6,	0x0A71,	%g4
	tle	%xcc,	0x7
	sth	%l2,	[%l7 + 0x50]
	fmovdvc	%xcc,	%f1,	%f0
	tcc	%icc,	0x3
	tpos	%xcc,	0x5
	movgu	%xcc,	%l1,	%g7
	fmovrslz	%o2,	%f17,	%f4
	fmul8ulx16	%f28,	%f18,	%f24
	tpos	%icc,	0x7
	movvs	%xcc,	%i3,	%o7
	movle	%xcc,	%l4,	%g3
	movrne	%i2,	%o1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,pt	%xcc,	loop_2132
	std	%f10,	[%l7 + 0x60]
	fmovrse	%i4,	%f2,	%f8
	udiv	%o6,	0x132A,	%g2
loop_2132:
	prefetch	[%l7 + 0x08],	 0x2
	fmovsle	%icc,	%f5,	%f5
	movneg	%icc,	%l3,	%l6
	tsubcc	%l5,	0x09A3,	%g1
	edge8l	%i6,	%o0,	%i7
	movcc	%icc,	%g5,	%o3
	ldd	[%l7 + 0x50],	%f20
	edge16ln	%i0,	%l0,	%o5
	tneg	%xcc,	0x5
	movcs	%icc,	%i1,	%g6
	brgez	%g4,	loop_2133
	udivx	%i5,	0x0CA8,	%l2
	fmovdn	%icc,	%f15,	%f22
	movneg	%icc,	%l1,	%o2
loop_2133:
	brz	%i3,	loop_2134
	and	%o7,	0x053C,	%l4
	fors	%f20,	%f14,	%f0
	umul	%g7,	%g3,	%i2
loop_2134:
	fxor	%f22,	%f2,	%f20
	set	0x08, %i0
	sta	%f24,	[%l7 + %i0] 0x15
	fmovsneg	%icc,	%f20,	%f20
	array32	%o1,	%o4,	%o6
	edge8	%g2,	%i4,	%l3
	sir	0x07DE
	stbar
	tpos	%xcc,	0x4
	ba,a	%xcc,	loop_2135
	fmovsne	%xcc,	%f4,	%f11
	taddcctv	%l6,	%l5,	%i6
	fblg	%fcc3,	loop_2136
loop_2135:
	fmovd	%f20,	%f24
	sdivcc	%o0,	0x1E60,	%g1
	tpos	%icc,	0x6
loop_2136:
	stb	%g5,	[%l7 + 0x36]
	umul	%o3,	0x1A3A,	%i7
	edge32ln	%l0,	%o5,	%i0
	wr	%g0,	0x2f,	%asi
	stxa	%g6,	[%l7 + 0x38] %asi
	membar	#Sync
	orncc	%g4,	%i5,	%l2
	add	%l1,	0x0D96,	%i1
	fxors	%f5,	%f1,	%f3
	wr	%g0,	0x0c,	%asi
	sta	%f30,	[%l7 + 0x20] %asi
	andcc	%o2,	%o7,	%i3
	fmovrde	%l4,	%f4,	%f26
	movn	%xcc,	%g7,	%g3
	tgu	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i2,	0x15CE,	%o1
	taddcc	%o4,	0x08D9,	%o6
	fornot2s	%f12,	%f29,	%f30
	call	loop_2137
	subcc	%g2,	0x0DE5,	%i4
	sll	%l3,	0x07,	%l6
	fmovrde	%l5,	%f12,	%f24
loop_2137:
	ta	%xcc,	0x1
	fnands	%f29,	%f31,	%f11
	fcmped	%fcc0,	%f20,	%f18
	or	%o0,	%i6,	%g1
	mulscc	%o3,	%i7,	%l0
	lduw	[%l7 + 0x34],	%g5
	subccc	%o5,	0x1F4F,	%g6
	sdivx	%i0,	0x0618,	%i5
	fcmpgt16	%f18,	%f22,	%l2
	brlz,a	%g4,	loop_2138
	move	%icc,	%i1,	%o2
	bgu,a,pt	%xcc,	loop_2139
	udivx	%o7,	0x148B,	%l1
loop_2138:
	andn	%l4,	0x161B,	%i3
	fmovscc	%xcc,	%f30,	%f31
loop_2139:
	tge	%icc,	0x7
	nop
	setx loop_2140, %l0, %l1
	jmpl %l1, %g7
	edge16ln	%g3,	%o1,	%o4
	wr	%g0,	0x04,	%asi
	stba	%i2,	[%l7 + 0x3E] %asi
loop_2140:
	call	loop_2141
	tge	%icc,	0x6
	fsrc2s	%f22,	%f16
	movre	%g2,	0x3BC,	%o6
loop_2141:
	fmovrslz	%i4,	%f19,	%f31
	fcmpne16	%f10,	%f8,	%l6
	for	%f2,	%f24,	%f6
	movrne	%l3,	0x2F5,	%l5
	nop
	set	0x5C, %g7
	prefetch	[%l7 + %g7],	 0x0
	smulcc	%i6,	0x09E8,	%g1
	and	%o3,	%o0,	%l0
	udivx	%g5,	0x01DF,	%i7
	orn	%g6,	%o5,	%i0
	taddcctv	%l2,	0x10E5,	%g4
	fabsd	%f14,	%f6
	movne	%icc,	%i5,	%o2
	fmuld8sux16	%f4,	%f28,	%f6
	fpack32	%f28,	%f6,	%f4
	ba	%xcc,	loop_2142
	movne	%icc,	%i1,	%l1
	udivx	%l4,	0x1E01,	%i3
	tsubcc	%o7,	%g3,	%g7
loop_2142:
	fsrc1s	%f5,	%f22
	fmovse	%icc,	%f26,	%f10
	fmovrslez	%o4,	%f7,	%f2
	edge32l	%i2,	%o1,	%g2
	movcc	%xcc,	%o6,	%l6
	fcmpgt32	%f18,	%f12,	%l3
	edge8l	%i4,	%i6,	%g1
	fbe	%fcc3,	loop_2143
	fmovrdlz	%l5,	%f16,	%f28
	bl	loop_2144
	bpos,a	loop_2145
loop_2143:
	fcmped	%fcc3,	%f8,	%f2
	fandnot2s	%f31,	%f7,	%f4
loop_2144:
	movvs	%xcc,	%o0,	%l0
loop_2145:
	tcc	%xcc,	0x7
	tvc	%xcc,	0x0
	subcc	%g5,	%i7,	%g6
	taddcctv	%o3,	%i0,	%o5
	fnands	%f10,	%f12,	%f29
	movcc	%icc,	%g4,	%l2
	edge8n	%o2,	%i5,	%l1
	fmul8x16au	%f26,	%f11,	%f28
	edge32l	%l4,	%i1,	%o7
	addcc	%i3,	%g7,	%o4
	subcc	%i2,	0x0437,	%g3
	addccc	%g2,	%o6,	%o1
	tle	%xcc,	0x0
	srl	%l6,	0x14,	%l3
	bge,pn	%xcc,	loop_2146
	nop
	set	0x28, %o5
	stx	%i4,	[%l7 + %o5]
	fpack16	%f24,	%f23
	fpsub32	%f12,	%f0,	%f8
loop_2146:
	array16	%i6,	%g1,	%o0
	sdiv	%l0,	0x14D8,	%l5
	fmovse	%icc,	%f15,	%f31
	fmovsneg	%xcc,	%f12,	%f23
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x30] %asi,	%f24
	alignaddrl	%i7,	%g5,	%o3
	alignaddr	%g6,	%i0,	%g4
	fcmpgt16	%f2,	%f20,	%l2
	movrlz	%o5,	0x165,	%i5
	prefetch	[%l7 + 0x60],	 0x2
	fors	%f3,	%f13,	%f22
	movge	%icc,	%o2,	%l1
	fornot2s	%f8,	%f9,	%f18
	mulscc	%l4,	%i1,	%o7
	umul	%i3,	0x197A,	%g7
	flush	%l7 + 0x64
	sllx	%o4,	0x07,	%g3
	fmovsvc	%xcc,	%f5,	%f15
	move	%xcc,	%i2,	%g2
	movrgez	%o6,	%l6,	%l3
	smul	%i4,	%i6,	%o1
	bvs	%xcc,	loop_2147
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	loop_2148
	fzero	%f4
loop_2147:
	edge16n	%g1,	%o0,	%l5
	srl	%l0,	%g5,	%o3
loop_2148:
	xnorcc	%i7,	0x06C0,	%i0
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x27,	%g6
	edge32l	%l2,	%o5,	%i5
	movvs	%xcc,	%g4,	%o2
	fbn	%fcc0,	loop_2149
	or	%l1,	%i1,	%l4
	addcc	%i3,	%g7,	%o4
	bcs,pn	%xcc,	loop_2150
loop_2149:
	sdiv	%g3,	0x000F,	%i2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
loop_2150:
	edge8ln	%o6,	%l6,	%g2
	brgez	%l3,	loop_2151
	fmovrde	%i6,	%f6,	%f8
	fpsub32	%f28,	%f10,	%f22
	movvs	%icc,	%o1,	%g1
loop_2151:
	orcc	%i4,	%o0,	%l5
	movrlz	%l0,	0x115,	%g5
	sub	%o3,	0x1095,	%i7
	fbug,a	%fcc0,	loop_2152
	nop
	setx	loop_2153,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%i0,	%g6,	%l2
	ldd	[%l7 + 0x08],	%o4
loop_2152:
	addccc	%i5,	0x13B6,	%o2
loop_2153:
	edge8	%l1,	%g4,	%i1
	bge,a	%icc,	loop_2154
	tgu	%xcc,	0x2
	movrgz	%i3,	0x0AD,	%l4
	fnegd	%f18,	%f0
loop_2154:
	tvs	%icc,	0x4
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x120] %asi,	%g7
	fmovsl	%icc,	%f27,	%f26
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	bl,a	loop_2155
	fmovdcc	%xcc,	%f19,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o4,	%g3,	%i2
loop_2155:
	movrlez	%o6,	0x149,	%l6
	fmovrsgz	%o7,	%f27,	%f4
	movpos	%icc,	%g2,	%i6
	movrgez	%l3,	0x2E6,	%g1
	stb	%o1,	[%l7 + 0x1F]
	fbue	%fcc0,	loop_2156
	tn	%icc,	0x4
	movl	%xcc,	%i4,	%l5
	array32	%l0,	%g5,	%o0
loop_2156:
	tcc	%xcc,	0x0
	fnors	%f31,	%f9,	%f1
	taddcc	%o3,	%i0,	%i7
	move	%icc,	%g6,	%l2
	brgz,a	%o5,	loop_2157
	fpack16	%f26,	%f19
	movvc	%xcc,	%o2,	%i5
	bpos,a,pt	%icc,	loop_2158
loop_2157:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f22,	%f20,	%g4
	tsubcc	%i1,	0x084F,	%i3
loop_2158:
	nop
	set	0x34, %i2
	stwa	%l1,	[%l7 + %i2] 0x15
	movl	%icc,	%l4,	%o4
	fmovdcc	%icc,	%f23,	%f13
	bleu,a	loop_2159
	array8	%g3,	%i2,	%g7
	bvs	loop_2160
	fmovd	%f26,	%f30
loop_2159:
	fmovscc	%xcc,	%f27,	%f20
	nop
	setx	loop_2161,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2160:
	fmul8ulx16	%f6,	%f2,	%f4
	udivcc	%o6,	0x1820,	%l6
	fmovdge	%icc,	%f30,	%f22
loop_2161:
	stb	%o7,	[%l7 + 0x20]
	fmovdvs	%xcc,	%f22,	%f25
	fmovs	%f6,	%f18
	fornot2s	%f14,	%f3,	%f23
	pdist	%f20,	%f26,	%f16
	edge8	%i6,	%g2,	%l3
	fblg	%fcc2,	loop_2162
	fcmps	%fcc1,	%f17,	%f16
	sdivcc	%o1,	0x1558,	%i4
	andcc	%l5,	0x1E3B,	%l0
loop_2162:
	fmovrdlez	%g1,	%f4,	%f18
	fpack16	%f16,	%f17
	srl	%o0,	0x0C,	%g5
	fandnot2	%f12,	%f12,	%f30
	stx	%i0,	[%l7 + 0x20]
	popc	0x027E,	%i7
	umul	%g6,	%o3,	%l2
	fmovdne	%icc,	%f1,	%f5
	fmovse	%xcc,	%f25,	%f7
	fmovdl	%xcc,	%f12,	%f20
	movg	%xcc,	%o2,	%o5
	fmovdleu	%icc,	%f7,	%f31
	movre	%g4,	%i5,	%i1
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x14,	%f0
	popc	0x103A,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x7A],	%l1
	edge32ln	%o4,	%l4,	%i2
	movrgez	%g3,	%g7,	%l6
	fbuge	%fcc0,	loop_2163
	tl	%xcc,	0x4
	ba,a,pn	%xcc,	loop_2164
	tvs	%icc,	0x1
loop_2163:
	movcc	%xcc,	%o7,	%i6
	tsubcc	%o6,	0x1789,	%l3
loop_2164:
	fornot2s	%f14,	%f3,	%f6
	fbuge,a	%fcc3,	loop_2165
	tne	%icc,	0x5
	fcmped	%fcc2,	%f20,	%f22
	tg	%icc,	0x4
loop_2165:
	subcc	%o1,	%i4,	%l5
	tle	%xcc,	0x7
	tcs	%icc,	0x5
	bcs	%xcc,	loop_2166
	movre	%l0,	%g1,	%o0
	tg	%xcc,	0x4
	tg	%xcc,	0x2
loop_2166:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	popc	%g2,	%i0
	subccc	%g5,	0x1D75,	%g6
	brgez	%i7,	loop_2167
	edge32l	%l2,	%o3,	%o5
	edge32ln	%g4,	%i5,	%o2
	te	%xcc,	0x4
loop_2167:
	movgu	%icc,	%i1,	%i3
	fnot1	%f26,	%f0
	set	0x08, %o1
	ldsha	[%l7 + %o1] 0x10,	%o4
	fcmpd	%fcc2,	%f2,	%f10
	movleu	%xcc,	%l4,	%l1
	set	0x78, %l2
	ldxa	[%l7 + %l2] 0x15,	%i2
	tcc	%icc,	0x5
	fbne	%fcc1,	loop_2168
	orcc	%g3,	0x1F7B,	%l6
	udivcc	%g7,	0x15B1,	%i6
	movne	%icc,	%o7,	%o6
loop_2168:
	fmovrdgez	%l3,	%f24,	%f20
	fmovrslz	%o1,	%f1,	%f1
	ba,a,pt	%icc,	loop_2169
	edge16ln	%i4,	%l0,	%g1
	tcc	%xcc,	0x3
	edge8	%o0,	%g2,	%i0
loop_2169:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l5
	fmovrsgz	%g6,	%f8,	%f11
	edge16n	%g5,	%l2,	%o3
	movrne	%i7,	0x21B,	%g4
	xor	%i5,	%o2,	%i1
	sdivx	%o5,	0x08E4,	%i3
	fbue,a	%fcc0,	loop_2170
	subcc	%l4,	0x1740,	%l1
	fnors	%f6,	%f14,	%f9
	movg	%xcc,	%i2,	%g3
loop_2170:
	faligndata	%f26,	%f22,	%f16
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x60] %asi
	fmul8x16au	%f1,	%f12,	%f26
	subc	%o4,	%g7,	%o7
	sra	%i6,	%o6,	%o1
	ble,pt	%xcc,	loop_2171
	xor	%i4,	%l0,	%l3
	udivcc	%g1,	0x1168,	%o0
	sdivx	%i0,	0x0D58,	%l5
loop_2171:
	fmovsleu	%icc,	%f23,	%f5
	lduh	[%l7 + 0x76],	%g2
	smul	%g6,	%g5,	%o3
	fblg,a	%fcc2,	loop_2172
	movg	%xcc,	%i7,	%l2
	udiv	%g4,	0x06E6,	%i5
	andncc	%i1,	%o5,	%i3
loop_2172:
	tsubcctv	%l4,	%l1,	%i2
	edge8ln	%g3,	%l6,	%o2
	fnot1	%f8,	%f4
	srlx	%o4,	0x0B,	%o7
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x23,	%g6
	array32	%i6,	%o1,	%i4
	movvs	%xcc,	%l0,	%o6
	edge16	%g1,	%o0,	%i0
	ble,a,pt	%xcc,	loop_2173
	movrlez	%l3,	0x010,	%l5
	edge32	%g6,	%g2,	%o3
	fmovrsgz	%i7,	%f8,	%f15
loop_2173:
	tge	%icc,	0x1
	orncc	%g5,	%g4,	%l2
	tl	%icc,	0x6
	tneg	%icc,	0x4
	addccc	%i1,	%o5,	%i3
	bgu	%icc,	loop_2174
	call	loop_2175
	fbue,a	%fcc3,	loop_2176
	nop
	setx loop_2177, %l0, %l1
	jmpl %l1, %i5
loop_2174:
	membar	0x76
loop_2175:
	sdivx	%l1,	0x1F77,	%l4
loop_2176:
	nop
	setx	loop_2178,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2177:
	brgez	%g3,	loop_2179
	edge8ln	%l6,	%i2,	%o4
	edge8n	%o2,	%o7,	%i6
loop_2178:
	umul	%g7,	0x0B7E,	%i4
loop_2179:
	sub	%o1,	%o6,	%g1
	orn	%o0,	0x0FC4,	%l0
	bl,a,pt	%icc,	loop_2180
	sdivx	%i0,	0x0B9A,	%l3
	fblg	%fcc2,	loop_2181
	ld	[%l7 + 0x5C],	%f30
loop_2180:
	sth	%g6,	[%l7 + 0x5A]
	umul	%l5,	0x060F,	%o3
loop_2181:
	fmovdle	%icc,	%f3,	%f9
	xorcc	%g2,	%i7,	%g4
	tg	%xcc,	0x3
	tg	%icc,	0x3
	prefetch	[%l7 + 0x4C],	 0x2
	fmovde	%xcc,	%f23,	%f26
	fors	%f18,	%f20,	%f31
	movvc	%icc,	%l2,	%g5
	fbg,a	%fcc2,	loop_2182
	fmul8x16al	%f12,	%f20,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o5,	%i1,	%i5
loop_2182:
	edge32l	%l1,	%i3,	%g3
	edge16n	%l6,	%i2,	%o4
	sdivx	%l4,	0x16D6,	%o2
	mulx	%o7,	0x075E,	%i6
	tne	%xcc,	0x4
	addc	%i4,	0x0248,	%g7
	movl	%icc,	%o6,	%o1
	xorcc	%o0,	0x0B75,	%l0
	ta	%xcc,	0x5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%g1
	tsubcctv	%g6,	0x118D,	%l5
	nop
	setx	loop_2183,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgez	%o3,	%g2,	%i7
	movgu	%icc,	%l3,	%g4
	fmovsgu	%icc,	%f17,	%f5
loop_2183:
	bpos	%icc,	loop_2184
	and	%l2,	%g5,	%i1
	fbne	%fcc3,	loop_2185
	smul	%i5,	0x183F,	%o5
loop_2184:
	array16	%i3,	%l1,	%g3
	tn	%icc,	0x5
loop_2185:
	popc	%l6,	%i2
	orcc	%o4,	%l4,	%o2
	alignaddrl	%i6,	%i4,	%o7
	taddcc	%o6,	0x14E9,	%o1
	fmovsn	%xcc,	%f5,	%f11
	movge	%icc,	%o0,	%l0
	movl	%xcc,	%g7,	%i0
	orn	%g1,	%g6,	%o3
	movneg	%xcc,	%l5,	%i7
	udiv	%g2,	0x062F,	%l3
	fmovsvs	%icc,	%f15,	%f25
	tle	%xcc,	0x0
	fbg,a	%fcc1,	loop_2186
	mulx	%g4,	%l2,	%i1
	orn	%i5,	%o5,	%g5
	fmovrdne	%l1,	%f4,	%f8
loop_2186:
	edge32n	%i3,	%l6,	%i2
	set	0x68, %o7
	stha	%g3,	[%l7 + %o7] 0x2f
	membar	#Sync
	fble,a	%fcc1,	loop_2187
	movg	%xcc,	%o4,	%l4
	fnot1	%f26,	%f20
	tneg	%icc,	0x2
loop_2187:
	tcc	%icc,	0x1
	fmovsl	%icc,	%f20,	%f21
	edge8n	%i6,	%o2,	%i4
	edge16n	%o7,	%o6,	%o0
	subccc	%l0,	%o1,	%g7
	sllx	%i0,	0x17,	%g6
	edge8n	%o3,	%l5,	%i7
	srl	%g2,	0x03,	%l3
	ldd	[%l7 + 0x08],	%g0
	smulcc	%g4,	0x02D9,	%l2
	fmovdge	%icc,	%f23,	%f16
	taddcc	%i1,	%o5,	%i5
	and	%l1,	%g5,	%l6
	subc	%i2,	0x1A00,	%g3
	fmul8ulx16	%f4,	%f12,	%f18
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i3
	fpsub32	%f18,	%f12,	%f8
	subcc	%l4,	0x1B57,	%o4
	fbo,a	%fcc2,	loop_2188
	fxor	%f8,	%f18,	%f6
	fmovdneg	%xcc,	%f2,	%f27
	tvc	%xcc,	0x2
loop_2188:
	fbu	%fcc1,	loop_2189
	movg	%xcc,	%i6,	%o2
	udivcc	%i4,	0x1E30,	%o7
	tge	%xcc,	0x2
loop_2189:
	fones	%f31
	movrgz	%o6,	0x319,	%l0
	movvs	%xcc,	%o0,	%g7
	tgu	%icc,	0x5
	xorcc	%o1,	0x01DE,	%i0
	fbne	%fcc3,	loop_2190
	addc	%g6,	%l5,	%i7
	edge16	%o3,	%g2,	%l3
	fbe,a	%fcc0,	loop_2191
loop_2190:
	fmovsne	%icc,	%f13,	%f12
	fbule,a	%fcc1,	loop_2192
	tn	%xcc,	0x7
loop_2191:
	fpack16	%f14,	%f13
	fpsub16s	%f11,	%f23,	%f25
loop_2192:
	tcc	%icc,	0x6
	movge	%icc,	%g1,	%l2
	andcc	%i1,	%g4,	%i5
	movvc	%xcc,	%o5,	%l1
	ldsw	[%l7 + 0x18],	%l6
	bpos,a,pn	%icc,	loop_2193
	array16	%g5,	%g3,	%i2
	subccc	%i3,	0x0F09,	%o4
	udiv	%l4,	0x16A1,	%o2
loop_2193:
	ta	%xcc,	0x1
	mova	%xcc,	%i6,	%i4
	fandnot1s	%f16,	%f29,	%f6
	edge8	%o6,	%o7,	%o0
	fands	%f21,	%f16,	%f22
	faligndata	%f12,	%f12,	%f12
	tcs	%icc,	0x0
	movneg	%icc,	%g7,	%o1
	xnor	%l0,	0x0F1A,	%i0
	tcs	%icc,	0x3
	subccc	%l5,	0x02BC,	%i7
	sub	%g6,	0x0490,	%o3
	movrgez	%g2,	%l3,	%g1
	set	0x1f0, %i6
	nop 	! 	nop 	! 	ldxa	[%g0 + %i6] 0x40,	%l2 ripped by fixASI40.pl ripped by fixASI40.pl
	umulcc	%g4,	0x1A7C,	%i1
	fnot2	%f10,	%f18
	fbl	%fcc2,	loop_2194
	ldd	[%l7 + 0x30],	%o4
	fmovrslez	%i5,	%f30,	%f8
	stx	%l1,	[%l7 + 0x70]
loop_2194:
	fmovsg	%xcc,	%f12,	%f12
	subc	%g5,	%l6,	%g3
	movge	%xcc,	%i3,	%o4
	nop
	setx loop_2195, %l0, %l1
	jmpl %l1, %l4
	addc	%i2,	%i6,	%i4
	mova	%icc,	%o2,	%o7
	bge,a,pt	%xcc,	loop_2196
loop_2195:
	udiv	%o6,	0x11CC,	%o0
	xnorcc	%g7,	0x1D9B,	%l0
	movcc	%icc,	%i0,	%l5
loop_2196:
	fcmps	%fcc3,	%f23,	%f26
	popc	%o1,	%g6
	udivcc	%o3,	0x12E7,	%i7
	bcc	loop_2197
	flush	%l7 + 0x60
	bgu,a	loop_2198
	movrlez	%l3,	%g1,	%g2
loop_2197:
	fmovdcs	%xcc,	%f28,	%f5
	ldsw	[%l7 + 0x78],	%g4
loop_2198:
	fmovdge	%xcc,	%f23,	%f15
	fmovdn	%icc,	%f27,	%f26
	mulx	%i1,	%o5,	%i5
	fpsub16s	%f17,	%f14,	%f17
	tn	%icc,	0x1
	fmovdvs	%xcc,	%f29,	%f20
	sdivx	%l2,	0x01CA,	%g5
	edge8n	%l1,	%g3,	%l6
	fzero	%f20
	movrne	%o4,	0x09C,	%i3
	edge32l	%i2,	%l4,	%i4
	fbl	%fcc0,	loop_2199
	fnot1s	%f29,	%f20
	umulcc	%i6,	0x1E57,	%o7
	movle	%icc,	%o6,	%o0
loop_2199:
	bpos,pt	%icc,	loop_2200
	edge16ln	%g7,	%o2,	%l0
	bgu,a,pt	%xcc,	loop_2201
	sdivcc	%i0,	0x06A0,	%o1
loop_2200:
	siam	0x4
	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x18,	 0x3
loop_2201:
	orcc	%l5,	%o3,	%l3
	movvs	%xcc,	%i7,	%g2
	edge16	%g4,	%g1,	%o5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x74] %asi,	%i1
	std	%f18,	[%l7 + 0x58]
	stbar
	prefetch	[%l7 + 0x18],	 0x1
	fpadd16s	%f13,	%f1,	%f3
	membar	0x70
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x17,	%f16
	fmovdpos	%icc,	%f30,	%f10
	orcc	%l2,	%i5,	%g5
	tvs	%xcc,	0x4
	srl	%g3,	%l6,	%o4
	prefetch	[%l7 + 0x4C],	 0x1
	andn	%l1,	0x1E81,	%i2
	fpsub32s	%f25,	%f24,	%f29
	sllx	%i3,	0x0C,	%i4
	tg	%xcc,	0x4
	smul	%l4,	%o7,	%o6
	tsubcctv	%i6,	0x1487,	%o0
	siam	0x0
	sdivx	%g7,	0x1193,	%l0
	fmovdne	%xcc,	%f10,	%f27
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tl	%icc,	0x7
	fbl	%fcc1,	loop_2202
	fmovrslz	%i0,	%f28,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc0,	loop_2203
loop_2202:
	stx	%o1,	[%l7 + 0x28]
	ldsh	[%l7 + 0x22],	%g6
	movvs	%icc,	%o2,	%o3
loop_2203:
	tl	%icc,	0x0
	tne	%icc,	0x2
	umul	%l3,	0x0C01,	%i7
	movvs	%xcc,	%g2,	%g4
	sdivx	%l5,	0x1A64,	%g1
	movneg	%icc,	%i1,	%o5
	sra	%i5,	0x03,	%g5
	sllx	%l2,	%l6,	%g3
	fmovdne	%icc,	%f4,	%f16
	add	%l1,	0x1DA1,	%o4
	tn	%xcc,	0x5
	tle	%xcc,	0x3
	subc	%i3,	%i4,	%i2
	andncc	%l4,	%o7,	%o6
	edge16ln	%o0,	%g7,	%l0
	orn	%i6,	0x0DBF,	%o1
	brlez	%g6,	loop_2204
	xnorcc	%i0,	0x1290,	%o3
	fmovrdgez	%o2,	%f10,	%f16
	fmovsge	%icc,	%f20,	%f18
loop_2204:
	sra	%l3,	%g2,	%i7
	alignaddr	%g4,	%l5,	%i1
	flush	%l7 + 0x4C
	fors	%f22,	%f0,	%f12
	tcc	%icc,	0x0
	sdivx	%g1,	0x1647,	%o5
	brlez,a	%g5,	loop_2205
	brgz	%i5,	loop_2206
	fpadd32	%f2,	%f18,	%f20
	umulcc	%l6,	0x09CD,	%l2
loop_2205:
	xorcc	%l1,	%g3,	%i3
loop_2206:
	sub	%o4,	%i4,	%l4
	movvs	%icc,	%o7,	%i2
	bleu,a,pn	%xcc,	loop_2207
	ldx	[%l7 + 0x50],	%o0
	fcmpne16	%f22,	%f2,	%o6
	movrne	%g7,	0x25B,	%l0
loop_2207:
	alignaddr	%i6,	%o1,	%g6
	fpack16	%f2,	%f2
	tcs	%icc,	0x5
	mulscc	%o3,	%i0,	%o2
	tne	%icc,	0x5
	fnot1	%f30,	%f4
	srl	%g2,	0x07,	%i7
	std	%f0,	[%l7 + 0x10]
	tgu	%xcc,	0x4
	flush	%l7 + 0x24
	mova	%icc,	%l3,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	loop_2208
	tpos	%xcc,	0x0
	prefetch	[%l7 + 0x14],	 0x0
	xnorcc	%i1,	0x0D1F,	%l5
loop_2208:
	nop
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xe2,	%o4
	movle	%xcc,	%g1,	%i5
	movn	%xcc,	%g5,	%l2
	ldstub	[%l7 + 0x5C],	%l1
	sllx	%l6,	0x10,	%i3
	taddcctv	%o4,	0x1D54,	%g3
	fmovrdlez	%l4,	%f10,	%f10
	movg	%xcc,	%o7,	%i2
	movvs	%xcc,	%o0,	%i4
	movgu	%icc,	%o6,	%l0
	ld	[%l7 + 0x18],	%f21
	fmovdleu	%icc,	%f3,	%f2
	edge16	%i6,	%g7,	%g6
	edge16n	%o1,	%o3,	%i0
	fpadd16s	%f27,	%f6,	%f3
	edge16l	%o2,	%i7,	%g2
	fble,a	%fcc0,	loop_2209
	edge32l	%l3,	%i1,	%l5
	movl	%icc,	%o5,	%g1
	udiv	%i5,	0x14AB,	%g5
loop_2209:
	orcc	%g4,	%l2,	%l6
	movn	%icc,	%i3,	%o4
	movle	%icc,	%g3,	%l1
	bvs,pt	%xcc,	loop_2210
	std	%f20,	[%l7 + 0x28]
	movg	%icc,	%l4,	%o7
	sth	%o0,	[%l7 + 0x78]
loop_2210:
	movg	%xcc,	%i2,	%i4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o6,	[%g0 + 0x318] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	ldsb	[%l7 + 0x5D],	%l0
	mulscc	%g7,	%i6,	%g6
	stw	%o1,	[%l7 + 0x44]
	move	%icc,	%o3,	%o2
	fmovdvs	%icc,	%f17,	%f5
	fmul8x16	%f21,	%f22,	%f10
	te	%icc,	0x6
	sllx	%i0,	%g2,	%i7
	taddcctv	%i1,	%l3,	%o5
	nop
	setx	loop_2211,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu,a,pn	%xcc,	loop_2212
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f20,	%f20
loop_2211:
	movvc	%xcc,	%g1,	%l5
loop_2212:
	std	%f22,	[%l7 + 0x70]
	fbl,a	%fcc3,	loop_2213
	addc	%i5,	0x1A97,	%g4
	subcc	%l2,	%l6,	%i3
	edge32n	%g5,	%o4,	%g3
loop_2213:
	fmul8ulx16	%f2,	%f16,	%f28
	fbe,a	%fcc3,	loop_2214
	umulcc	%l1,	0x0FA0,	%o7
	bpos,a	%icc,	loop_2215
	nop
	setx loop_2216, %l0, %l1
	jmpl %l1, %l4
loop_2214:
	udivx	%o0,	0x184F,	%i4
	edge8n	%i2,	%l0,	%g7
loop_2215:
	tcs	%icc,	0x3
loop_2216:
	fbul	%fcc1,	loop_2217
	alignaddrl	%i6,	%o6,	%g6
	tcc	%xcc,	0x7
	andn	%o3,	%o2,	%o1
loop_2217:
	stbar
	std	%f12,	[%l7 + 0x10]
	ldub	[%l7 + 0x5B],	%g2
	fmovspos	%icc,	%f11,	%f16
	bgu,a	loop_2218
	bn	loop_2219
	bge,a,pn	%icc,	loop_2220
	alignaddrl	%i0,	%i1,	%i7
loop_2218:
	movleu	%icc,	%l3,	%g1
loop_2219:
	fmovsvs	%xcc,	%f5,	%f28
loop_2220:
	tg	%xcc,	0x2
	movg	%xcc,	%l5,	%i5
	tneg	%icc,	0x4
	movl	%xcc,	%g4,	%o5
	xnorcc	%l2,	%l6,	%i3
	movvs	%icc,	%g5,	%o4
	edge32n	%g3,	%o7,	%l1
	andn	%l4,	%o0,	%i4
	umulcc	%l0,	0x19E0,	%i2
	fand	%f8,	%f12,	%f24
	sdivx	%i6,	0x1ABB,	%o6
	wr	%g0,	0x2b,	%asi
	stha	%g7,	[%l7 + 0x78] %asi
	membar	#Sync
	move	%icc,	%g6,	%o3
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x24,	%o2
	ba	%icc,	loop_2221
	fbn	%fcc0,	loop_2222
	srax	%g2,	0x17,	%i0
	orcc	%i1,	0x1AE3,	%o1
loop_2221:
	fba,a	%fcc1,	loop_2223
loop_2222:
	fpadd32	%f12,	%f26,	%f12
	xor	%i7,	%g1,	%l3
	bne,a	loop_2224
loop_2223:
	std	%i4,	[%l7 + 0x68]
	taddcc	%g4,	0x0442,	%l5
	srax	%o5,	0x1A,	%l2
loop_2224:
	umul	%l6,	0x129E,	%i3
	mulscc	%o4,	0x1B21,	%g5
	addc	%g3,	0x1C6D,	%o7
	and	%l4,	%l1,	%o0
	edge32n	%i4,	%l0,	%i2
	tle	%icc,	0x4
	fpackfix	%f8,	%f14
	movcs	%icc,	%i6,	%g7
	movle	%icc,	%o6,	%o3
	movpos	%xcc,	%g6,	%o2
	movvc	%icc,	%i0,	%i1
	fandnot1s	%f20,	%f2,	%f31
	fpack16	%f30,	%f26
	fpack32	%f14,	%f22,	%f18
	array32	%o1,	%g2,	%i7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	add	%i5,	%g4,	%l5
	movrgz	%l3,	%o5,	%l6
	ld	[%l7 + 0x54],	%f22
	fblg	%fcc2,	loop_2225
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pt	%icc,	loop_2226
	fmovsvs	%xcc,	%f2,	%f28
loop_2225:
	alignaddr	%l2,	%i3,	%o4
	bvc	loop_2227
loop_2226:
	bg,pt	%icc,	loop_2228
	addccc	%g5,	%o7,	%g3
	mulx	%l4,	0x1E28,	%o0
loop_2227:
	fnot1	%f24,	%f0
loop_2228:
	mulx	%i4,	%l0,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i6,	%l1,	%g7
	movpos	%icc,	%o3,	%g6
	sll	%o2,	0x05,	%o6
	tvc	%xcc,	0x5
	sdiv	%i1,	0x09C1,	%i0
	edge8	%g2,	%i7,	%o1
	tgu	%icc,	0x0
	tsubcctv	%g1,	0x1B19,	%g4
	tneg	%xcc,	0x3
	fpadd32	%f12,	%f4,	%f0
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	set	0x70, %o3
	stda	%l2,	[%l7 + %o3] 0x81
	orcc	%o5,	%l5,	%l2
	movne	%xcc,	%l6,	%i3
	movrgez	%g5,	%o7,	%o4
	set	0x50, %i1
	lduha	[%l7 + %i1] 0x19,	%l4
	srl	%o0,	%i4,	%g3
	fba,a	%fcc3,	loop_2229
	taddcctv	%l0,	%i6,	%l1
	sub	%g7,	0x1A1D,	%i2
	and	%o3,	0x09C7,	%o2
loop_2229:
	ble,a	%icc,	loop_2230
	tpos	%xcc,	0x2
	mova	%icc,	%g6,	%o6
	udivcc	%i1,	0x0485,	%i0
loop_2230:
	addc	%i7,	0x17C4,	%o1
	ld	[%l7 + 0x20],	%f16
	tpos	%xcc,	0x2
	movrgz	%g2,	0x1F5,	%g4
	subccc	%i5,	0x06C2,	%l3
	xnorcc	%o5,	%g1,	%l2
	srlx	%l5,	0x06,	%l6
	nop
	setx loop_2231, %l0, %l1
	jmpl %l1, %g5
	flush	%l7 + 0x34
	fba,a	%fcc0,	loop_2232
	sllx	%i3,	0x14,	%o7
loop_2231:
	fmovscc	%icc,	%f9,	%f13
	sub	%o4,	%l4,	%o0
loop_2232:
	pdist	%f10,	%f30,	%f30
	movgu	%xcc,	%g3,	%i4
	fmovrslez	%i6,	%f31,	%f30
	fmovrslez	%l0,	%f26,	%f26
	tvc	%xcc,	0x1
	umul	%l1,	%g7,	%i2
	movn	%icc,	%o2,	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i1
	fmovde	%xcc,	%f28,	%f7
	tge	%icc,	0x0
	fnot2	%f22,	%f12
	movn	%xcc,	%i0,	%i7
	fbo,a	%fcc1,	loop_2233
	mulscc	%o6,	0x17DF,	%g2
	tvc	%xcc,	0x3
	siam	0x2
loop_2233:
	movg	%icc,	%g4,	%i5
	edge8l	%l3,	%o5,	%o1
	set	0x1C, %i5
	sta	%f21,	[%l7 + %i5] 0x18
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x67] %asi,	%g1
	set	0x3C, %g3
	stwa	%l2,	[%l7 + %g3] 0x2a
	membar	#Sync
	fmovrdlz	%l5,	%f6,	%f20
	sll	%g5,	0x15,	%i3
	tvs	%xcc,	0x1
	tgu	%icc,	0x5
	sir	0x17D3
	movrne	%l6,	0x3F0,	%o7
	bne	%icc,	loop_2234
	movrgz	%l4,	%o0,	%g3
	sdiv	%o4,	0x00F7,	%i6
	udivcc	%i4,	0x17F5,	%l1
loop_2234:
	tneg	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g7,	%l0,	%o2
	fornot1s	%f8,	%f20,	%f3
	orcc	%i2,	%g6,	%i1
	andcc	%i0,	0x17F6,	%o3
	movneg	%icc,	%i7,	%o6
	brz	%g2,	loop_2235
	movre	%i5,	0x1D1,	%g4
	st	%f11,	[%l7 + 0x58]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xe2,	%o4
loop_2235:
	ble	loop_2236
	udiv	%l3,	0x0927,	%g1
	lduh	[%l7 + 0x40],	%o1
	taddcctv	%l2,	0x0AC5,	%g5
loop_2236:
	fand	%f26,	%f22,	%f24
	faligndata	%f6,	%f14,	%f28
	umul	%i3,	%l5,	%l6
	sub	%o7,	0x1CF9,	%l4
	fxnor	%f6,	%f28,	%f0
	fble,a	%fcc2,	loop_2237
	fmovrsne	%o0,	%f25,	%f31
	orncc	%o4,	%g3,	%i4
	taddcctv	%i6,	0x1083,	%l1
loop_2237:
	fmovsge	%xcc,	%f15,	%f3
	fbne	%fcc2,	loop_2238
	fand	%f12,	%f6,	%f20
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l0
loop_2238:
	array32	%o2,	%i2,	%g6
	ld	[%l7 + 0x28],	%f8
	edge32n	%i1,	%g7,	%o3
	fnot1	%f26,	%f20
	be,a,pn	%xcc,	loop_2239
	edge8ln	%i7,	%o6,	%g2
	tl	%icc,	0x7
	sll	%i5,	%g4,	%o5
loop_2239:
	tge	%icc,	0x4
	fone	%f4
	movn	%xcc,	%l3,	%i0
	array8	%g1,	%l2,	%o1
	fmovdvs	%xcc,	%f1,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g5,	0x0A94,	%l5
	srl	%l6,	0x02,	%i3
	move	%xcc,	%o7,	%o0
	smul	%l4,	%o4,	%g3
	movrlz	%i4,	0x269,	%l1
	sir	0x00AA
	bneg,a	%xcc,	loop_2240
	edge32	%l0,	%i6,	%i2
	sir	0x1A6E
	mova	%icc,	%g6,	%o2
loop_2240:
	brlz	%i1,	loop_2241
	alignaddr	%o3,	%i7,	%o6
	nop
	setx	loop_2242,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%g2,	%i5,	%g4
loop_2241:
	taddcctv	%o5,	0x0ACB,	%l3
	movrgz	%g7,	%i0,	%g1
loop_2242:
	fexpand	%f28,	%f10
	bvc	%xcc,	loop_2243
	sdivcc	%l2,	0x0026,	%o1
	std	%f18,	[%l7 + 0x58]
	xnorcc	%l5,	%g5,	%l6
loop_2243:
	tn	%icc,	0x0
	move	%icc,	%o7,	%i3
	brnz	%o0,	loop_2244
	fmovrsne	%l4,	%f3,	%f4
	sll	%o4,	%g3,	%l1
	be,pt	%icc,	loop_2245
loop_2244:
	addccc	%l0,	0x0FE9,	%i6
	fnand	%f20,	%f26,	%f16
	ldx	[%l7 + 0x28],	%i4
loop_2245:
	fcmpeq16	%f2,	%f28,	%g6
	fmovdgu	%xcc,	%f17,	%f8
	fbo	%fcc1,	loop_2246
	sll	%o2,	0x07,	%i2
	fcmpgt32	%f30,	%f14,	%o3
	taddcctv	%i1,	0x1AA3,	%o6
loop_2246:
	fornot1	%f22,	%f20,	%f8
	edge16n	%i7,	%g2,	%g4
	fmovdpos	%icc,	%f13,	%f24
	bvc,pt	%xcc,	loop_2247
	fmovdpos	%xcc,	%f3,	%f6
	bcs,a	loop_2248
	movre	%i5,	%l3,	%g7
loop_2247:
	udivcc	%o5,	0x0B8B,	%g1
	fmuld8ulx16	%f14,	%f0,	%f26
loop_2248:
	tsubcctv	%i0,	%l2,	%o1
	fcmple32	%f12,	%f4,	%g5
	fmul8x16au	%f16,	%f4,	%f14
	taddcctv	%l5,	%l6,	%i3
	tg	%icc,	0x7
	fmovrdgez	%o0,	%f14,	%f4
	call	loop_2249
	tge	%icc,	0x6
	movvc	%xcc,	%l4,	%o4
	tleu	%icc,	0x6
loop_2249:
	movrlez	%g3,	%l1,	%o7
	fmovsle	%icc,	%f13,	%f29
	fmovdg	%icc,	%f23,	%f8
	fmovdl	%icc,	%f22,	%f22
	sdiv	%i6,	0x1032,	%i4
	movrlez	%l0,	%o2,	%i2
	fmovspos	%icc,	%f17,	%f14
	movcs	%xcc,	%g6,	%i1
	alignaddr	%o3,	%o6,	%i7
	nop
	setx loop_2250, %l0, %l1
	jmpl %l1, %g2
	subc	%g4,	%i5,	%l3
	movge	%icc,	%g7,	%o5
	fbg	%fcc0,	loop_2251
loop_2250:
	udivcc	%i0,	0x080B,	%g1
	tge	%xcc,	0x4
	movge	%icc,	%o1,	%g5
loop_2251:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f26,	[%l7 + 0x34] %asi
	tl	%icc,	0x0
	array32	%l2,	%l5,	%l6
	edge8l	%o0,	%i3,	%l4
	bcs,a,pn	%xcc,	loop_2252
	fcmpgt16	%f30,	%f26,	%o4
	udivcc	%g3,	0x0131,	%o7
	movl	%icc,	%l1,	%i6
loop_2252:
	brgez	%l0,	loop_2253
	tvs	%icc,	0x6
	mova	%xcc,	%o2,	%i4
	tn	%xcc,	0x1
loop_2253:
	std	%i2,	[%l7 + 0x30]
	sll	%g6,	0x0B,	%o3
	addcc	%o6,	%i7,	%g2
	alignaddr	%g4,	%i5,	%l3
	taddcc	%i1,	0x0C07,	%g7
	xor	%i0,	%o5,	%g1
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x1C] %asi,	%g5
	smulcc	%o1,	%l2,	%l6
	orn	%l5,	%o0,	%l4
	fpsub16s	%f6,	%f31,	%f3
	lduh	[%l7 + 0x78],	%i3
	fpsub32	%f12,	%f8,	%f24
	fble	%fcc1,	loop_2254
	sll	%o4,	0x0D,	%g3
	edge16n	%l1,	%o7,	%l0
	std	%f20,	[%l7 + 0x68]
loop_2254:
	fabsd	%f4,	%f0
	addccc	%o2,	%i6,	%i2
	fbu,a	%fcc0,	loop_2255
	movne	%xcc,	%i4,	%g6
	ldx	[%l7 + 0x70],	%o6
	bneg,a	%xcc,	loop_2256
loop_2255:
	movrne	%o3,	%g2,	%i7
	umulcc	%g4,	0x0E73,	%l3
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x11,	%f19
loop_2256:
	fnands	%f4,	%f15,	%f4
	xnor	%i1,	0x0C56,	%i5
	add	%i0,	0x1D16,	%o5
	taddcctv	%g1,	0x1EF7,	%g7
	call	loop_2257
	and	%o1,	0x18B0,	%l2
	fpackfix	%f28,	%f30
	sllx	%l6,	0x04,	%l5
loop_2257:
	fxors	%f13,	%f26,	%f16
	movg	%icc,	%o0,	%g5
	tgu	%xcc,	0x3
	xor	%i3,	0x1560,	%o4
	fpsub16s	%f21,	%f16,	%f20
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l4
	ldd	[%l7 + 0x40],	%g2
	edge32ln	%l1,	%l0,	%o2
	addccc	%o7,	%i6,	%i2
	mova	%xcc,	%i4,	%g6
	tle	%icc,	0x1
	andn	%o6,	%o3,	%g2
	srlx	%g4,	%l3,	%i7
	fpadd16s	%f24,	%f30,	%f13
	stbar
	ld	[%l7 + 0x50],	%f28
	fnot2s	%f6,	%f0
	fmovda	%xcc,	%f16,	%f28
	array8	%i5,	%i0,	%i1
	fornot1s	%f30,	%f16,	%f25
	bcs,a,pn	%xcc,	loop_2258
	taddcc	%g1,	0x1A71,	%o5
	addc	%g7,	0x0271,	%l2
	fmovrde	%l6,	%f0,	%f0
loop_2258:
	fbul,a	%fcc3,	loop_2259
	brlez,a	%l5,	loop_2260
	fmovsneg	%xcc,	%f4,	%f2
	stw	%o1,	[%l7 + 0x7C]
loop_2259:
	fnor	%f2,	%f12,	%f24
loop_2260:
	or	%g5,	0x1A1A,	%i3
	ldd	[%l7 + 0x70],	%f26
	ldx	[%l7 + 0x78],	%o4
	movn	%icc,	%o0,	%g3
	brlez	%l4,	loop_2261
	alignaddr	%l0,	%l1,	%o2
	fblg,a	%fcc2,	loop_2262
	orncc	%o7,	0x0987,	%i2
loop_2261:
	movneg	%icc,	%i4,	%i6
	xor	%g6,	0x0E16,	%o3
loop_2262:
	tn	%icc,	0x1
	membar	0x04
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2D] %asi,	%g2
	edge16n	%o6,	%g4,	%i7
	tn	%icc,	0x6
	movle	%icc,	%i5,	%l3
	fble	%fcc0,	loop_2263
	movcs	%xcc,	%i1,	%g1
	sethi	0x1C37,	%o5
	add	%i0,	0x1CF8,	%g7
loop_2263:
	movvs	%xcc,	%l2,	%l6
	mulscc	%o1,	0x0B66,	%l5
	flush	%l7 + 0x40
	bgu,a	loop_2264
	fmovrdgez	%i3,	%f0,	%f24
	fbue,a	%fcc3,	loop_2265
	edge16ln	%o4,	%o0,	%g5
loop_2264:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x20] %asi,	%g2
loop_2265:
	nop
	setx	loop_2266,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fzero	%f12
	addcc	%l0,	0x12FA,	%l1
	sdivcc	%o2,	0x15E1,	%l4
loop_2266:
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i2
	or	%i4,	0x0B06,	%i6
	bleu,a,pn	%xcc,	loop_2267
	fpsub32s	%f14,	%f23,	%f27
	movle	%xcc,	%o7,	%g6
	srl	%g2,	0x0B,	%o3
loop_2267:
	fnegs	%f31,	%f28
	edge16n	%o6,	%i7,	%i5
	move	%icc,	%g4,	%l3
	fmovrdlz	%g1,	%f10,	%f4
	te	%xcc,	0x3
	tgu	%icc,	0x4
	ldsw	[%l7 + 0x30],	%o5
	movrlez	%i0,	0x212,	%g7
	orncc	%l2,	0x0BF8,	%l6
	add	%o1,	%i1,	%i3
	fcmpes	%fcc0,	%f15,	%f16
	movrne	%o4,	0x31E,	%l5
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x24] %asi
	tvs	%icc,	0x2
	fmovscs	%xcc,	%f25,	%f23
	udiv	%g5,	0x1E9C,	%o0
	fbo,a	%fcc1,	loop_2268
	edge8	%l0,	%g3,	%l1
	fornot1	%f6,	%f6,	%f8
	tneg	%icc,	0x1
loop_2268:
	ba,a,pn	%xcc,	loop_2269
	tsubcc	%l4,	0x00FB,	%i2
	edge8	%i4,	%i6,	%o7
	movne	%xcc,	%o2,	%g2
loop_2269:
	fnands	%f21,	%f7,	%f17
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x04,	%o2
	xnor	%o6,	0x0D7E,	%g6
	edge16ln	%i7,	%g4,	%i5
	fbge	%fcc3,	loop_2270
	movgu	%icc,	%g1,	%l3
	ldd	[%l7 + 0x08],	%o4
	fbg,a	%fcc1,	loop_2271
loop_2270:
	tge	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4C, %g1
	lduwa	[%l7 + %g1] 0x80,	%g7
loop_2271:
	alignaddrl	%i0,	%l2,	%o1
	fbul,a	%fcc3,	loop_2272
	fandnot1	%f10,	%f0,	%f6
	fmovsneg	%xcc,	%f23,	%f21
	edge16	%l6,	%i1,	%o4
loop_2272:
	xnor	%i3,	%g5,	%l5
	ba,pt	%icc,	loop_2273
	sir	0x1D9B
	fmovsgu	%icc,	%f14,	%f10
	fcmpeq32	%f16,	%f0,	%l0
loop_2273:
	udivcc	%o0,	0x1B50,	%g3
	array8	%l4,	%l1,	%i4
	bge,a,pn	%icc,	loop_2274
	fbuge,a	%fcc0,	loop_2275
	bne,a,pt	%icc,	loop_2276
	fornot1s	%f30,	%f19,	%f15
loop_2274:
	subcc	%i6,	%o7,	%i2
loop_2275:
	subccc	%o2,	%o3,	%o6
loop_2276:
	orn	%g6,	0x1483,	%g2
	sir	0x129A
	fcmpeq16	%f0,	%f8,	%g4
	addccc	%i7,	%i5,	%g1
	fbule,a	%fcc3,	loop_2277
	mulscc	%o5,	%l3,	%g7
	set	0x40, %l5
	sta	%f20,	[%l7 + %l5] 0x18
loop_2277:
	srlx	%l2,	%i0,	%o1
	brz,a	%l6,	loop_2278
	sdiv	%i1,	0x0E92,	%i3
	orcc	%o4,	0x19C8,	%g5
	udivcc	%l0,	0x1F41,	%o0
loop_2278:
	bge,pn	%xcc,	loop_2279
	fmovdle	%icc,	%f5,	%f29
	fmovrde	%g3,	%f22,	%f2
	tsubcc	%l4,	0x0E15,	%l5
loop_2279:
	nop
	set	0x10, %l6
	sta	%f3,	[%l7 + %l6] 0x80
	stw	%l1,	[%l7 + 0x10]
	edge16l	%i6,	%i4,	%o7
	edge32ln	%o2,	%o3,	%i2
	movvc	%xcc,	%g6,	%o6
	tgu	%xcc,	0x7
	bl	loop_2280
	array16	%g2,	%g4,	%i7
	fnegs	%f28,	%f14
	fmovrse	%i5,	%f13,	%f16
loop_2280:
	nop
	setx loop_2281, %l0, %l1
	jmpl %l1, %g1
	tneg	%xcc,	0x4
	movre	%l3,	%g7,	%o5
	edge8l	%i0,	%o1,	%l6
loop_2281:
	edge16l	%l2,	%i3,	%o4
	array8	%g5,	%l0,	%o0
	tl	%icc,	0x3
	tl	%icc,	0x0
	movvc	%icc,	%i1,	%g3
	and	%l4,	%l5,	%l1
	srl	%i6,	%i4,	%o2
	bvc,a,pt	%icc,	loop_2282
	srlx	%o7,	0x14,	%o3
	sra	%g6,	%i2,	%o6
	sethi	0x1E15,	%g4
loop_2282:
	sdivx	%g2,	0x1EF6,	%i7
	tl	%xcc,	0x1
	nop
	set	0x48, %g2
	prefetch	[%l7 + %g2],	 0x1
	andn	%g1,	%i5,	%l3
	call	loop_2283
	smul	%o5,	0x0233,	%g7
	popc	%i0,	%o1
	udivcc	%l2,	0x0D2C,	%l6
loop_2283:
	srl	%o4,	0x06,	%i3
	movn	%icc,	%l0,	%g5
	and	%i1,	0x0B52,	%o0
	bg,pn	%xcc,	loop_2284
	nop
	setx	loop_2285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot2	%f10,	%f30,	%f24
	bl	loop_2286
loop_2284:
	edge16n	%g3,	%l4,	%l1
loop_2285:
	mulscc	%l5,	0x1C24,	%i4
	fones	%f18
loop_2286:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f11,	[%l7 + 0x08] %asi
	movneg	%icc,	%i6,	%o7
	fnor	%f10,	%f0,	%f26
	movne	%xcc,	%o3,	%g6
	edge32n	%i2,	%o2,	%g4
	addc	%g2,	0x0677,	%o6
	tcs	%icc,	0x7
	addcc	%i7,	0x03FC,	%g1
	ldd	[%l7 + 0x28],	%i4
	lduh	[%l7 + 0x54],	%o5
	movcs	%xcc,	%l3,	%g7
	prefetch	[%l7 + 0x74],	 0x2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i0
	tvs	%xcc,	0x6
	fornot2	%f0,	%f24,	%f16
	movge	%xcc,	%l2,	%o4
	taddcctv	%l6,	%i3,	%l0
	set	0x0E, %i7
	stba	%i1,	[%l7 + %i7] 0x89
	tneg	%icc,	0x0
	movleu	%icc,	%g5,	%o0
	or	%l4,	%l1,	%l5
	udivcc	%g3,	0x0691,	%i4
	addc	%o7,	0x03A4,	%o3
	edge32n	%i6,	%g6,	%i2
	xorcc	%g4,	0x038F,	%o2
	fnegs	%f25,	%f8
	fbn,a	%fcc2,	loop_2287
	fmovrdgz	%g2,	%f10,	%f18
	srlx	%o6,	0x16,	%g1
	fzero	%f0
loop_2287:
	sdivx	%i5,	0x1B39,	%o5
	udiv	%i7,	0x08F2,	%g7
	tleu	%icc,	0x5
	fmovdg	%xcc,	%f8,	%f6
	fmovdge	%xcc,	%f24,	%f0
	tge	%xcc,	0x2
	tle	%icc,	0x5
	ldsb	[%l7 + 0x69],	%o1
	orcc	%l3,	0x1F71,	%i0
	taddcctv	%o4,	%l2,	%i3
	movn	%xcc,	%l0,	%i1
	fnegs	%f23,	%f16
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l6
	udivx	%g5,	0x1844,	%o0
	stx	%l1,	[%l7 + 0x58]
	movgu	%xcc,	%l4,	%l5
	fornot1s	%f14,	%f31,	%f28
	movvs	%icc,	%i4,	%g3
	set	0x21, %i4
	stba	%o3,	[%l7 + %i4] 0x27
	membar	#Sync
	fexpand	%f18,	%f2
	tpos	%icc,	0x1
	smul	%i6,	0x0895,	%o7
	ta	%xcc,	0x7
	fbe	%fcc0,	loop_2288
	fnot2s	%f28,	%f1
	ldsh	[%l7 + 0x32],	%g6
	movcc	%icc,	%i2,	%o2
loop_2288:
	be,a,pn	%xcc,	loop_2289
	sll	%g2,	%g4,	%o6
	tsubcctv	%g1,	%i5,	%i7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%g7
loop_2289:
	edge8ln	%o1,	%o5,	%l3
	orn	%i0,	%l2,	%i3
	mova	%xcc,	%l0,	%o4
	fnot1s	%f28,	%f28
	array16	%l6,	%g5,	%i1
	set	0x3C, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l1
	fbue,a	%fcc1,	loop_2290
	tg	%xcc,	0x0
	fmovrslz	%l4,	%f26,	%f27
	fbn,a	%fcc2,	loop_2291
loop_2290:
	fbl	%fcc3,	loop_2292
	xnor	%l5,	%o0,	%i4
	bvs,a	%icc,	loop_2293
loop_2291:
	brlez	%g3,	loop_2294
loop_2292:
	fpadd16	%f8,	%f2,	%f18
	tl	%icc,	0x0
loop_2293:
	sdivcc	%o3,	0x1B88,	%o7
loop_2294:
	srl	%g6,	%i6,	%i2
	nop
	set	0x70, %l4
	std	%f30,	[%l7 + %l4]
	fmovsgu	%icc,	%f11,	%f0
	xorcc	%o2,	%g4,	%o6
	movl	%xcc,	%g1,	%g2
	nop
	set	0x78, %g7
	std	%f10,	[%l7 + %g7]
	move	%xcc,	%i7,	%i5
	membar	0x45
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f18,	%f26,	%g7
	fbg	%fcc3,	loop_2295
	fmovs	%f19,	%f23
	movrne	%o5,	0x017,	%l3
	bcs,pt	%icc,	loop_2296
loop_2295:
	tcs	%icc,	0x7
	fba,a	%fcc1,	loop_2297
	fsrc1s	%f11,	%f10
loop_2296:
	movgu	%icc,	%i0,	%l2
	mova	%xcc,	%i3,	%o1
loop_2297:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l0,	%l6,	%g5
	brgz,a	%o4,	loop_2298
	array32	%i1,	%l4,	%l5
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f8
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x28] %asi,	%l1
loop_2298:
	umulcc	%o0,	0x087C,	%g3
	fblg	%fcc1,	loop_2299
	fmovsneg	%xcc,	%f22,	%f7
	tvc	%xcc,	0x5
	xnor	%o3,	%o7,	%i4
loop_2299:
	bshuffle	%f2,	%f30,	%f28
	fble	%fcc2,	loop_2300
	edge32n	%g6,	%i6,	%i2
	tg	%icc,	0x1
	and	%g4,	%o6,	%g1
loop_2300:
	fbu,a	%fcc2,	loop_2301
	nop
	setx	loop_2302,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%o2,	0x1214,	%g2
	nop
	setx	loop_2303,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2301:
	tl	%icc,	0x3
loop_2302:
	fmovrslez	%i5,	%f17,	%f20
	fornot1s	%f6,	%f1,	%f23
loop_2303:
	fcmpgt32	%f22,	%f24,	%g7
	alignaddrl	%o5,	%i7,	%l3
	tn	%icc,	0x0
	tn	%xcc,	0x3
	edge16l	%l2,	%i3,	%o1
	movl	%icc,	%i0,	%l0
	fnors	%f13,	%f1,	%f17
	edge32n	%g5,	%l6,	%o4
	set	0x68, %i3
	lduwa	[%l7 + %i3] 0x10,	%l4
	te	%icc,	0x4
	stbar
	movneg	%xcc,	%l5,	%l1
	xnor	%i1,	%g3,	%o3
	fmul8x16	%f21,	%f2,	%f16
	nop
	setx loop_2304, %l0, %l1
	jmpl %l1, %o0
	fbl,a	%fcc1,	loop_2305
	fblg,a	%fcc3,	loop_2306
	bvs	%xcc,	loop_2307
loop_2304:
	fmovsge	%icc,	%f30,	%f29
loop_2305:
	udivcc	%o7,	0x0EF8,	%i4
loop_2306:
	taddcctv	%i6,	0x07C5,	%g6
loop_2307:
	add	%g4,	0x04E6,	%i2
	edge16ln	%o6,	%o2,	%g2
	swap	[%l7 + 0x64],	%i5
	brgz,a	%g1,	loop_2308
	movpos	%icc,	%g7,	%i7
	edge8ln	%o5,	%l3,	%l2
	stb	%i3,	[%l7 + 0x21]
loop_2308:
	nop
	set	0x108, %i2
	ldxa	[%g0 + %i2] 0x21,	%i0
	srax	%l0,	%o1,	%l6
	movne	%icc,	%g5,	%o4
	fmovdge	%icc,	%f13,	%f10
	bvc,a,pt	%xcc,	loop_2309
	addc	%l5,	0x0573,	%l4
	movvs	%icc,	%i1,	%g3
	orcc	%o3,	%o0,	%l1
loop_2309:
	ta	%icc,	0x1
	edge32	%o7,	%i6,	%g6
	movge	%xcc,	%i4,	%g4
	movg	%icc,	%o6,	%i2
	set	0x71, %o0
	stba	%g2,	[%l7 + %o0] 0x89
	subcc	%o2,	%i5,	%g1
	movpos	%xcc,	%i7,	%o5
	edge16	%l3,	%g7,	%l2
	fmovdcc	%xcc,	%f28,	%f30
	fsrc1	%f10,	%f20
	movre	%i3,	0x23A,	%i0
	edge32l	%l0,	%o1,	%l6
	tne	%xcc,	0x4
	edge16l	%g5,	%l5,	%l4
	movneg	%xcc,	%i1,	%g3
	movn	%icc,	%o3,	%o0
	movge	%icc,	%o4,	%l1
	fmovsl	%icc,	%f20,	%f3
	smulcc	%o7,	%g6,	%i4
	fzeros	%f30
	edge16l	%g4,	%o6,	%i2
	ldsw	[%l7 + 0x7C],	%g2
	ldd	[%l7 + 0x08],	%f28
	or	%i6,	0x18D5,	%o2
	movle	%xcc,	%g1,	%i7
	bvc,pn	%icc,	loop_2310
	tg	%icc,	0x0
	taddcc	%i5,	%l3,	%g7
	fmovrse	%l2,	%f17,	%f16
loop_2310:
	and	%o5,	0x0A75,	%i0
	fpadd16	%f16,	%f16,	%f14
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvs	%icc,	0x2
	srax	%l0,	%i3,	%o1
	te	%xcc,	0x3
	tg	%icc,	0x5
	movvc	%xcc,	%l6,	%l5
	fmovsa	%icc,	%f10,	%f19
	bneg	%xcc,	loop_2311
	fmovrslz	%l4,	%f14,	%f2
	fmovs	%f10,	%f7
	udivx	%i1,	0x0713,	%g5
loop_2311:
	taddcc	%o3,	0x143C,	%g3
	fpadd32	%f0,	%f4,	%f24
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x44] %asi,	%o0
	tge	%xcc,	0x4
	orcc	%o4,	0x1F5A,	%o7
	smul	%g6,	%i4,	%g4
	srax	%l1,	%i2,	%o6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x26] %asi,	%i6
	ldx	[%l7 + 0x48],	%o2
	sllx	%g2,	%g1,	%i7
	fbug	%fcc2,	loop_2312
	edge8ln	%l3,	%g7,	%i5
	tneg	%xcc,	0x2
	tleu	%xcc,	0x4
loop_2312:
	fbue	%fcc2,	loop_2313
	andncc	%l2,	%o5,	%l0
	fcmpeq16	%f2,	%f30,	%i3
	fbne,a	%fcc3,	loop_2314
loop_2313:
	and	%o1,	%i0,	%l5
	addccc	%l4,	0x0933,	%l6
	edge16l	%g5,	%o3,	%g3
loop_2314:
	fpmerge	%f23,	%f15,	%f18
	movrlz	%i1,	%o0,	%o4
	movge	%xcc,	%g6,	%o7
	subccc	%i4,	%g4,	%l1
	fones	%f1
	srax	%o6,	0x08,	%i2
	fbu	%fcc1,	loop_2315
	tcc	%icc,	0x3
	array8	%o2,	%g2,	%g1
	fsrc2	%f16,	%f12
loop_2315:
	ble,a,pn	%icc,	loop_2316
	udivcc	%i7,	0x1B9D,	%l3
	faligndata	%f8,	%f28,	%f20
	fmovsleu	%xcc,	%f4,	%f26
loop_2316:
	fzero	%f30
	fnegd	%f28,	%f22
	movcc	%icc,	%i6,	%g7
	array32	%l2,	%o5,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%i3
	edge32l	%i0,	%o1,	%l5
	nop
	set	0x20, %o1
	stx	%l4,	[%l7 + %o1]
	movrgez	%l6,	%o3,	%g3
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x7C] %asi,	%i1
	edge32l	%g5,	%o0,	%o4
	add	%o7,	0x1B4A,	%g6
	subcc	%i4,	%g4,	%l1
	be,a	%xcc,	loop_2317
	bvc,pn	%xcc,	loop_2318
	nop
	setx loop_2319, %l0, %l1
	jmpl %l1, %o6
	fabss	%f29,	%f14
loop_2317:
	fcmps	%fcc2,	%f6,	%f7
loop_2318:
	movcs	%icc,	%i2,	%o2
loop_2319:
	fbue,a	%fcc1,	loop_2320
	addccc	%g2,	%i7,	%g1
	and	%l3,	0x0A49,	%i6
	subcc	%l2,	%o5,	%g7
loop_2320:
	popc	%i5,	%i3
	edge16n	%i0,	%o1,	%l0
	set	0x60, %o6
	stda	%l4,	[%l7 + %o6] 0xeb
	membar	#Sync
	movleu	%xcc,	%l6,	%o3
	subcc	%g3,	0x0CFC,	%l4
	fbl,a	%fcc2,	loop_2321
	fpadd32	%f20,	%f6,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g5,	0x12ED,	%o0
loop_2321:
	tn	%xcc,	0x3
	orncc	%i1,	0x0AB7,	%o4
	fmovdne	%icc,	%f2,	%f26
	alignaddr	%g6,	%i4,	%o7
	movpos	%icc,	%l1,	%o6
	brlz	%i2,	loop_2322
	andncc	%g4,	%g2,	%i7
	fba,a	%fcc0,	loop_2323
	fbn,a	%fcc0,	loop_2324
loop_2322:
	movleu	%xcc,	%g1,	%o2
	taddcctv	%i6,	0x0BF5,	%l2
loop_2323:
	fpsub32	%f10,	%f30,	%f24
loop_2324:
	fpsub16s	%f3,	%f29,	%f21
	fmuld8ulx16	%f16,	%f4,	%f22
	ba	loop_2325
	tg	%xcc,	0x2
	set	0x48, %l3
	stda	%l2,	[%l7 + %l3] 0x23
	membar	#Sync
loop_2325:
	movrlez	%o5,	%i5,	%g7
	xnor	%i3,	%o1,	%i0
	nop
	setx loop_2326, %l0, %l1
	jmpl %l1, %l0
	fpadd16s	%f4,	%f11,	%f3
	umulcc	%l6,	%o3,	%g3
	fmovrdlz	%l5,	%f2,	%f26
loop_2326:
	smul	%g5,	%l4,	%i1
	tneg	%icc,	0x6
	set	0x4C, %l2
	sta	%f18,	[%l7 + %l2] 0x19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o4,	0x085,	%g6
	call	loop_2327
	addccc	%o0,	0x1FFE,	%o7
	udivx	%l1,	0x0D81,	%o6
	movleu	%icc,	%i2,	%i4
loop_2327:
	taddcc	%g2,	0x051F,	%g4
	tvs	%icc,	0x4
	add	%i7,	%o2,	%i6
	udivcc	%g1,	0x1096,	%l2
	fbg	%fcc3,	loop_2328
	fornot2	%f28,	%f28,	%f22
	xorcc	%o5,	0x0576,	%l3
	movre	%g7,	0x019,	%i3
loop_2328:
	or	%o1,	%i0,	%i5
	subccc	%l6,	%o3,	%l0
	alignaddrl	%l5,	%g5,	%g3
	fbuge	%fcc1,	loop_2329
	xnor	%l4,	0x1589,	%i1
	tl	%icc,	0x3
	movcs	%xcc,	%g6,	%o0
loop_2329:
	movcs	%icc,	%o7,	%o4
	addc	%l1,	0x1196,	%i2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o6
	sdivcc	%g2,	0x0F5B,	%i4
	ble,a,pt	%xcc,	loop_2330
	addccc	%i7,	0x1D68,	%o2
	lduw	[%l7 + 0x14],	%g4
	smulcc	%i6,	0x1C74,	%g1
loop_2330:
	tne	%icc,	0x2
	fpack32	%f16,	%f18,	%f20
	fxor	%f6,	%f6,	%f26
	movg	%xcc,	%o5,	%l3
	sra	%g7,	%l2,	%i3
	movl	%xcc,	%o1,	%i5
	tleu	%icc,	0x5
	edge8n	%l6,	%i0,	%l0
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	fmul8x16	%f17,	%f22,	%f18
	wr	%g0,	0x22,	%asi
	stda	%g4,	[%l7 + 0x10] %asi
	membar	#Sync
	set	0x75, %o7
	ldsba	[%l7 + %o7] 0x04,	%l5
	swap	[%l7 + 0x70],	%g3
	set	0x5E, %i6
	stha	%i1,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x5C, %l1
	stha	%l4,	[%l7 + %l1] 0x0c
	movneg	%xcc,	%g6,	%o7
	stb	%o0,	[%l7 + 0x72]
	fbn,a	%fcc2,	loop_2331
	edge32l	%o4,	%i2,	%l1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x48] %asi,	%g2
loop_2331:
	movgu	%xcc,	%o6,	%i7
	movrne	%i4,	0x0BA,	%o2
	fbuge	%fcc2,	loop_2332
	bleu,a	loop_2333
	movvc	%xcc,	%g4,	%g1
	fpsub16s	%f12,	%f9,	%f17
loop_2332:
	array32	%i6,	%o5,	%g7
loop_2333:
	fsrc1s	%f25,	%f9
	nop
	setx	loop_2334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbu,a	%fcc2,	loop_2335
	add	%l2,	0x1037,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2334:
	srax	%i3,	0x17,	%i5
loop_2335:
	nop
	setx loop_2336, %l0, %l1
	jmpl %l1, %l6
	fmovrsne	%i0,	%f9,	%f20
	movcs	%icc,	%l0,	%o1
	subc	%o3,	%l5,	%g5
loop_2336:
	fpadd16s	%f15,	%f26,	%f17
	tgu	%icc,	0x0
	fbge,a	%fcc1,	loop_2337
	brlez	%i1,	loop_2338
	fmovsneg	%icc,	%f12,	%f6
	udivx	%l4,	0x16D4,	%g3
loop_2337:
	taddcc	%g6,	0x0B3A,	%o7
loop_2338:
	edge32l	%o0,	%o4,	%i2
	bgu,a,pn	%xcc,	loop_2339
	move	%icc,	%g2,	%l1
	bn,pn	%xcc,	loop_2340
	movg	%xcc,	%o6,	%i4
loop_2339:
	fmul8x16	%f11,	%f20,	%f24
	sll	%i7,	%o2,	%g1
loop_2340:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a	%xcc,	loop_2341
	fmovsl	%icc,	%f3,	%f13
	udivx	%g4,	0x1D7D,	%i6
	movcc	%icc,	%g7,	%o5
loop_2341:
	udivx	%l3,	0x04B0,	%i3
	brnz	%l2,	loop_2342
	srax	%l6,	%i5,	%l0
	andn	%i0,	0x06C3,	%o1
	nop
	set	0x24, %o4
	ldsw	[%l7 + %o4],	%o3
loop_2342:
	bleu,a	loop_2343
	edge8n	%l5,	%g5,	%l4
	taddcc	%g3,	%i1,	%o7
	fpack16	%f18,	%f9
loop_2343:
	fmul8ulx16	%f26,	%f12,	%f12
	prefetch	[%l7 + 0x20],	 0x3
	fbo,a	%fcc0,	loop_2344
	taddcctv	%g6,	0x0C68,	%o0
	flush	%l7 + 0x44
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2344:
	tvc	%icc,	0x6
	brz,a	%o4,	loop_2345
	bg,pt	%icc,	loop_2346
	edge8l	%g2,	%i2,	%l1
	fmovrdne	%i4,	%f18,	%f14
loop_2345:
	taddcctv	%i7,	%o2,	%g1
loop_2346:
	movpos	%icc,	%o6,	%i6
	edge16n	%g4,	%o5,	%l3
	movg	%xcc,	%i3,	%l2
	edge8	%l6,	%g7,	%i5
	edge8n	%l0,	%i0,	%o1
	movrgez	%l5,	%g5,	%l4
	movrne	%o3,	0x12B,	%i1
	edge16l	%o7,	%g6,	%g3
	fmovrdlz	%o0,	%f18,	%f12
	bge,a	%icc,	loop_2347
	movpos	%icc,	%g2,	%o4
	stw	%l1,	[%l7 + 0x44]
	te	%icc,	0x7
loop_2347:
	movgu	%xcc,	%i4,	%i7
	fcmpne32	%f10,	%f22,	%i2
	subc	%o2,	%o6,	%i6
	edge16l	%g1,	%o5,	%l3
	tle	%icc,	0x7
	edge32ln	%g4,	%l2,	%l6
	movre	%g7,	%i3,	%i5
	udivcc	%i0,	0x1C85,	%o1
	brz	%l5,	loop_2348
	edge16ln	%g5,	%l4,	%o3
	bne,a,pn	%icc,	loop_2349
	movcs	%icc,	%i1,	%l0
loop_2348:
	fmovdgu	%icc,	%f22,	%f23
	sllx	%o7,	0x06,	%g3
loop_2349:
	fmovrslz	%o0,	%f10,	%f28
	movn	%icc,	%g6,	%o4
	fnegd	%f6,	%f0
	tne	%xcc,	0x4
	smul	%l1,	0x0937,	%g2
	movne	%icc,	%i7,	%i2
	prefetch	[%l7 + 0x70],	 0x2
	fxnors	%f9,	%f25,	%f17
	bcs	%xcc,	loop_2350
	fmovdneg	%xcc,	%f26,	%f18
	movg	%xcc,	%o2,	%o6
	fornot2s	%f0,	%f21,	%f16
loop_2350:
	fmovscc	%xcc,	%f18,	%f4
	bvs,a	loop_2351
	udivcc	%i4,	0x1CF1,	%i6
	fmovsge	%xcc,	%f23,	%f17
	srlx	%g1,	0x17,	%o5
loop_2351:
	movrgez	%l3,	0x3EC,	%l2
	umulcc	%g4,	0x1493,	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l6,	%i5
	tneg	%icc,	0x5
	fpsub16	%f16,	%f10,	%f16
	movge	%icc,	%i0,	%o1
	array8	%i3,	%g5,	%l5
	addccc	%o3,	%i1,	%l4
	fornot2s	%f25,	%f2,	%f3
	fcmpgt16	%f14,	%f16,	%l0
	or	%o7,	0x0B5A,	%o0
	smulcc	%g3,	%o4,	%l1
	movvs	%icc,	%g6,	%g2
	xnor	%i7,	%i2,	%o2
	fsrc1s	%f14,	%f11
	movrlz	%i4,	%o6,	%g1
	fmuld8sux16	%f11,	%f1,	%f20
	fble,a	%fcc2,	loop_2352
	edge16	%i6,	%o5,	%l2
	ldd	[%l7 + 0x78],	%f14
	fbue,a	%fcc2,	loop_2353
loop_2352:
	alignaddr	%g4,	%l3,	%g7
	movvc	%xcc,	%i5,	%i0
	ldsw	[%l7 + 0x44],	%o1
loop_2353:
	tsubcctv	%i3,	0x1DE0,	%g5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l6
	tge	%icc,	0x4
	ble,pn	%xcc,	loop_2354
	brlez,a	%o3,	loop_2355
	siam	0x2
	movrgz	%l5,	%l4,	%i1
loop_2354:
	movle	%xcc,	%o7,	%l0
loop_2355:
	ldd	[%l7 + 0x40],	%f6
	fmovsne	%xcc,	%f13,	%f27
	edge8l	%o0,	%o4,	%g3
	andn	%g6,	%g2,	%i7
	edge32	%l1,	%i2,	%i4
	xorcc	%o2,	%o6,	%i6
	movrgz	%g1,	0x3CC,	%l2
	fmovdle	%xcc,	%f14,	%f29
	ldsw	[%l7 + 0x28],	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f31,	%f13,	%f20
	popc	0x0407,	%l3
	xnor	%o5,	%g7,	%i5
	xnorcc	%i0,	0x1A22,	%i3
	mova	%icc,	%o1,	%l6
	tg	%icc,	0x7
	tneg	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g5,	0x009,	%l5
	set	0x16, %g4
	lduha	[%l7 + %g4] 0x81,	%l4
	edge8l	%o3,	%i1,	%l0
	andn	%o0,	0x1EE1,	%o4
	movrlez	%o7,	0x2CC,	%g6
	fble,a	%fcc3,	loop_2356
	add	%g2,	0x01D6,	%i7
	mova	%icc,	%g3,	%i2
	movrgz	%l1,	0x1FD,	%o2
loop_2356:
	edge32l	%o6,	%i4,	%i6
	ta	%icc,	0x2
	movrgz	%g1,	0x215,	%g4
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sra	%l2,	%l3,	%o5
	edge16l	%g7,	%i5,	%i3
	fornot1	%f28,	%f18,	%f8
	sllx	%o1,	%l6,	%g5
	bvs,a,pt	%icc,	loop_2357
	mulx	%i0,	0x15F3,	%l5
	and	%o3,	0x0A1B,	%i1
	bvs	loop_2358
loop_2357:
	movrgz	%l4,	%o0,	%o4
	fcmpd	%fcc0,	%f18,	%f0
	or	%l0,	%o7,	%g6
loop_2358:
	movgu	%icc,	%i7,	%g3
	edge16ln	%g2,	%i2,	%o2
	tcc	%xcc,	0x0
	movg	%xcc,	%o6,	%i4
	movrlez	%l1,	%i6,	%g1
	bshuffle	%f0,	%f22,	%f8
	fxor	%f20,	%f16,	%f12
	orcc	%l2,	%g4,	%o5
	ldsh	[%l7 + 0x40],	%g7
	fnot1	%f26,	%f2
	edge8ln	%i5,	%i3,	%l3
	movne	%icc,	%o1,	%l6
	mulx	%i0,	%g5,	%l5
	fnot2s	%f30,	%f10
	tne	%xcc,	0x5
	umulcc	%i1,	0x0EB5,	%o3
	tcc	%icc,	0x6
	tgu	%icc,	0x6
	mulscc	%l4,	0x1D1E,	%o4
	edge32n	%o0,	%o7,	%g6
	fpack16	%f28,	%f14
	tcs	%icc,	0x4
	movg	%xcc,	%l0,	%i7
	addcc	%g2,	%i2,	%g3
	srax	%o2,	%o6,	%l1
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
	tsubcctv	%i4,	0x07DD,	%i6
	mulx	%l2,	0x1EC5,	%g4
	movrgz	%g1,	0x17F,	%o5
loop_2359:
	srax	%i5,	%g7,	%i3
	ldd	[%l7 + 0x50],	%f12
	nop
	setx loop_2360, %l0, %l1
	jmpl %l1, %o1
	subccc	%l3,	0x0FED,	%i0
	fpsub16s	%f29,	%f22,	%f28
	movpos	%xcc,	%g5,	%l5
loop_2360:
	fmovdl	%icc,	%f18,	%f24
	fandnot2	%f28,	%f6,	%f2
	std	%f22,	[%l7 + 0x18]
	taddcc	%l6,	%o3,	%l4
	tpos	%xcc,	0x1
	fblg	%fcc3,	loop_2361
	tl	%icc,	0x7
	fmovscc	%xcc,	%f30,	%f24
	edge8	%i1,	%o4,	%o0
loop_2361:
	ba,a	loop_2362
	umul	%o7,	%l0,	%g6
	set	0x16, %o3
	lduha	[%l7 + %o3] 0x11,	%i7
loop_2362:
	brlz	%g2,	loop_2363
	fnor	%f0,	%f12,	%f26
	fnot1	%f26,	%f0
	stw	%g3,	[%l7 + 0x78]
loop_2363:
	fba,a	%fcc2,	loop_2364
	sra	%i2,	%o2,	%o6
	wr	%g0,	0xe3,	%asi
	stxa	%l1,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2364:
	fcmpgt32	%f18,	%f12,	%i4
	subccc	%i6,	0x13D2,	%l2
	movrne	%g4,	0x0E8,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%o5,	%i5
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x39] %asi,	%i3
	movre	%o1,	%l3,	%i0
	edge8n	%g7,	%g5,	%l5
	fmovsg	%xcc,	%f9,	%f27
	move	%icc,	%o3,	%l4
	te	%icc,	0x5
	stb	%i1,	[%l7 + 0x46]
	movrlez	%o4,	%l6,	%o7
	array8	%l0,	%o0,	%i7
	tne	%icc,	0x5
	srlx	%g2,	0x13,	%g6
	fmovsleu	%icc,	%f7,	%f23
	tg	%icc,	0x7
	tgu	%icc,	0x6
	set	0x3C, %i1
	ldsha	[%l7 + %i1] 0x80,	%g3
	ldsb	[%l7 + 0x1A],	%o2
	and	%o6,	%i2,	%i4
	sethi	0x01AB,	%l1
	addccc	%l2,	%g4,	%i6
	edge8	%o5,	%g1,	%i3
	addc	%i5,	%l3,	%o1
	udiv	%g7,	0x0126,	%i0
	tpos	%icc,	0x0
	fmovdgu	%xcc,	%f4,	%f0
	array8	%l5,	%o3,	%l4
	fmovdn	%xcc,	%f17,	%f2
	edge8ln	%i1,	%g5,	%l6
	fbuge	%fcc0,	loop_2365
	fcmpeq16	%f0,	%f8,	%o4
	addc	%l0,	%o7,	%i7
	fmuld8sux16	%f3,	%f30,	%f0
loop_2365:
	orn	%g2,	0x07F2,	%o0
	tsubcc	%g3,	0x0242,	%g6
	udiv	%o2,	0x0571,	%o6
	wr	%g0,	0x18,	%asi
	stda	%i2,	[%l7 + 0x48] %asi
	sdivx	%l1,	0x1327,	%l2
	movrlz	%i4,	%i6,	%o5
	srax	%g4,	0x04,	%g1
	srl	%i3,	0x18,	%l3
	fmovsneg	%xcc,	%f17,	%f27
	movrlez	%o1,	%i5,	%g7
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpack32	%f2,	%f22,	%f16
	move	%icc,	%l5,	%o3
	fpadd32s	%f3,	%f1,	%f20
	srax	%l4,	%i1,	%g5
	wr	%g0,	0x80,	%asi
	stha	%i0,	[%l7 + 0x54] %asi
	fbo	%fcc2,	loop_2366
	mulscc	%o4,	0x1313,	%l0
	movle	%icc,	%l6,	%o7
	tneg	%icc,	0x1
loop_2366:
	nop
	set	0x1C, %i5
	sta	%f19,	[%l7 + %i5] 0x14
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x81,	%i7
	tne	%icc,	0x3
	brz	%g2,	loop_2367
	edge8ln	%g3,	%g6,	%o2
	fcmpeq16	%f16,	%f12,	%o0
	movgu	%icc,	%o6,	%l1
loop_2367:
	fcmple32	%f10,	%f24,	%i2
	tvc	%icc,	0x0
	udivcc	%l2,	0x010B,	%i4
	ldsw	[%l7 + 0x44],	%o5
	edge8	%g4,	%i6,	%i3
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	xorcc	%g1,	0x1FF1,	%o1
	brlz,a	%i5,	loop_2368
	movcc	%icc,	%l5,	%g7
	sllx	%o3,	0x01,	%i1
	array32	%g5,	%i0,	%l4
loop_2368:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l0,	%l6
	movgu	%xcc,	%o4,	%o7
	bgu	%xcc,	loop_2369
	fnot2	%f24,	%f14
	fmovrde	%i7,	%f28,	%f12
	subc	%g3,	0x0DA0,	%g6
loop_2369:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc3,	loop_2370
	sir	0x046B
	edge8ln	%g2,	%o0,	%o6
	xorcc	%l1,	%o2,	%i2
loop_2370:
	fpack16	%f4,	%f27
	taddcctv	%l2,	0x18B3,	%o5
	nop
	setx	loop_2371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot2s	%f25,	%f16,	%f16
	brgz	%g4,	loop_2372
	sub	%i6,	0x1D7C,	%i4
loop_2371:
	fmovsne	%xcc,	%f11,	%f20
	edge8	%l3,	%g1,	%o1
loop_2372:
	movle	%icc,	%i3,	%l5
	brgz,a	%i5,	loop_2373
	fsrc1	%f24,	%f20
	fornot2	%f16,	%f10,	%f8
	fbg,a	%fcc2,	loop_2374
loop_2373:
	tne	%icc,	0x4
	nop
	setx	loop_2375,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%g7,	%o3,	%g5
loop_2374:
	tleu	%xcc,	0x3
	brnz	%i0,	loop_2376
loop_2375:
	stbar
	sllx	%i1,	%l4,	%l6
	movvc	%xcc,	%o4,	%l0
loop_2376:
	tcc	%icc,	0x1
	fmovrsgz	%i7,	%f18,	%f12
	ldstub	[%l7 + 0x4B],	%o7
	tcs	%xcc,	0x5
	fbge,a	%fcc3,	loop_2377
	fmuld8sux16	%f18,	%f28,	%f12
	membar	0x11
	andcc	%g3,	0x102D,	%g2
loop_2377:
	andcc	%g6,	0x0992,	%o0
	taddcc	%l1,	%o6,	%o2
	movvc	%xcc,	%l2,	%i2
	prefetch	[%l7 + 0x1C],	 0x2
	fmovsn	%xcc,	%f16,	%f30
	movcc	%xcc,	%g4,	%o5
	fbue,a	%fcc2,	loop_2378
	tne	%xcc,	0x3
	te	%icc,	0x5
	srlx	%i4,	0x15,	%i6
loop_2378:
	movn	%xcc,	%l3,	%o1
	movle	%icc,	%g1,	%l5
	movcs	%icc,	%i3,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o3,	0x00,	%g5
	fblg,a	%fcc3,	loop_2379
	fmovsge	%icc,	%f17,	%f22
	edge8n	%i0,	%g7,	%l4
	tcs	%icc,	0x2
loop_2379:
	fblg,a	%fcc0,	loop_2380
	edge32ln	%i1,	%l6,	%o4
	fpadd32s	%f9,	%f2,	%f31
	addc	%l0,	%o7,	%g3
loop_2380:
	edge32	%g2,	%g6,	%o0
	tvc	%icc,	0x0
	popc	0x1209,	%i7
	mulx	%l1,	%o6,	%l2
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x19,	%i2
	movg	%icc,	%o2,	%o5
	umulcc	%i4,	0x0559,	%i6
	srax	%g4,	0x0F,	%l3
	sdivcc	%o1,	0x04B1,	%g1
	tvs	%icc,	0x0
	addc	%i3,	0x12CC,	%l5
	taddcc	%i5,	0x057B,	%g5
	popc	%i0,	%g7
	edge16	%l4,	%i1,	%o3
	te	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o4,	%l6,	%o7
	movcc	%xcc,	%g3,	%g2
	tneg	%icc,	0x2
	andncc	%l0,	%g6,	%o0
	movpos	%icc,	%i7,	%l1
	popc	0x046D,	%o6
	bvs,a	%icc,	loop_2381
	movpos	%icc,	%i2,	%o2
	popc	0x0901,	%l2
	smulcc	%i4,	0x1847,	%i6
loop_2381:
	tpos	%xcc,	0x1
	bcc,a,pn	%icc,	loop_2382
	ldub	[%l7 + 0x31],	%g4
	membar	0x69
	fxnor	%f16,	%f14,	%f24
loop_2382:
	taddcctv	%l3,	%o1,	%g1
	edge32	%o5,	%l5,	%i3
	brgz,a	%i5,	loop_2383
	fsrc2	%f10,	%f8
	tneg	%xcc,	0x6
	bne	loop_2384
loop_2383:
	movpos	%xcc,	%i0,	%g5
	movvc	%icc,	%l4,	%g7
	mulscc	%i1,	%o3,	%o4
loop_2384:
	fbu,a	%fcc2,	loop_2385
	bleu,a	loop_2386
	smulcc	%o7,	0x18A8,	%g3
	fmovdg	%icc,	%f25,	%f11
loop_2385:
	fmovdcs	%icc,	%f20,	%f17
loop_2386:
	fmovde	%xcc,	%f9,	%f10
	movpos	%xcc,	%l6,	%g2
	mulx	%l0,	0x016F,	%g6
	bne,a	%xcc,	loop_2387
	popc	%i7,	%l1
	srl	%o6,	0x05,	%o0
	sub	%o2,	%i2,	%i4
loop_2387:
	membar	0x11
	fcmpne32	%f0,	%f20,	%i6
	tpos	%xcc,	0x5
	movn	%xcc,	%l2,	%g4
	edge32l	%o1,	%g1,	%l3
	fbug	%fcc1,	loop_2388
	edge32	%l5,	%i3,	%i5
	or	%o5,	%g5,	%i0
	fmuld8ulx16	%f5,	%f16,	%f16
loop_2388:
	tpos	%xcc,	0x7
	smulcc	%l4,	0x0F80,	%i1
	movpos	%icc,	%g7,	%o3
	srlx	%o4,	0x0A,	%g3
	tn	%xcc,	0x0
	pdist	%f0,	%f10,	%f12
	fones	%f6
	fmovrdne	%l6,	%f16,	%f10
	edge8	%o7,	%l0,	%g2
	or	%i7,	%l1,	%o6
	fmovdcs	%xcc,	%f27,	%f24
	ldsb	[%l7 + 0x71],	%g6
	fmovdge	%xcc,	%f29,	%f7
	fbule,a	%fcc0,	loop_2389
	orn	%o0,	0x0167,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i4,	%i2,	%l2
loop_2389:
	ldd	[%l7 + 0x08],	%i6
	fbne	%fcc0,	loop_2390
	edge32	%g4,	%g1,	%o1
	srlx	%l3,	%i3,	%l5
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%i4
loop_2390:
	srl	%o5,	%i0,	%g5
	tn	%icc,	0x2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brlz	%i1,	loop_2391
	movgu	%icc,	%l4,	%g7
	ldx	[%l7 + 0x58],	%o3
	fexpand	%f28,	%f30
loop_2391:
	tvc	%icc,	0x6
	edge32ln	%o4,	%l6,	%g3
	umul	%l0,	%g2,	%i7
	ldstub	[%l7 + 0x3C],	%l1
	fbule,a	%fcc2,	loop_2392
	sra	%o6,	%o7,	%g6
	fmovse	%icc,	%f31,	%f2
	fxors	%f3,	%f7,	%f9
loop_2392:
	fmovsg	%icc,	%f22,	%f31
	ldstub	[%l7 + 0x69],	%o2
	wr	%g0,	0x2a,	%asi
	stha	%i4,	[%l7 + 0x26] %asi
	membar	#Sync
	movg	%icc,	%o0,	%i2
	fbe,a	%fcc1,	loop_2393
	fcmpgt16	%f14,	%f4,	%l2
	call	loop_2394
	mova	%xcc,	%i6,	%g1
loop_2393:
	tcs	%icc,	0x1
	brnz,a	%o1,	loop_2395
loop_2394:
	fmovde	%icc,	%f30,	%f7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g4
loop_2395:
	orcc	%l3,	0x19EE,	%l5
	xor	%i5,	0x1FDB,	%i3
	movgu	%xcc,	%i0,	%o5
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0x0
	xnorcc	%l4,	0x118A,	%g5
	movrgz	%o3,	0x2A4,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x0
	tcc	%icc,	0x6
	smul	%l6,	%g7,	%g3
	fmovrse	%g2,	%f15,	%f0
	ldd	[%l7 + 0x08],	%f8
	add	%l0,	0x1E07,	%i7
	bvc,pn	%icc,	loop_2396
	bgu,a,pt	%xcc,	loop_2397
	movpos	%xcc,	%l1,	%o6
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x08] %asi,	%o7
loop_2396:
	fmovdle	%xcc,	%f26,	%f10
loop_2397:
	udivcc	%o2,	0x0EDA,	%g6
	nop
	setx	loop_2398,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	faligndata	%f30,	%f18,	%f8
	smul	%i4,	0x1AE1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2398:
	edge8l	%l2,	%i6,	%o0
	be,a	%xcc,	loop_2399
	fabsd	%f26,	%f2
	movne	%icc,	%g1,	%o1
	or	%l3,	%g4,	%i5
loop_2399:
	fmovsne	%icc,	%f9,	%f0
	sethi	0x03AB,	%i3
	tcs	%xcc,	0x0
	fmul8sux16	%f0,	%f28,	%f6
	fornot1	%f26,	%f24,	%f26
	fbo	%fcc3,	loop_2400
	fmovd	%f18,	%f18
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%l5
loop_2400:
	fbule	%fcc2,	loop_2401
	movre	%i0,	0x30E,	%o5
	movvs	%icc,	%l4,	%i1
	wr	%g0,	0x27,	%asi
	stha	%g5,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_2401:
	edge16ln	%o3,	%o4,	%l6
	srl	%g7,	%g3,	%g2
	fcmpd	%fcc1,	%f20,	%f2
	ta	%xcc,	0x4
	fnors	%f23,	%f6,	%f12
	fmovdge	%icc,	%f10,	%f31
	tgu	%xcc,	0x0
	movne	%icc,	%i7,	%l1
	tn	%xcc,	0x7
	fpsub32	%f0,	%f4,	%f6
	sllx	%o6,	%l0,	%o2
	std	%g6,	[%l7 + 0x38]
	fpmerge	%f22,	%f19,	%f24
	bne,a	%icc,	loop_2402
	tsubcc	%i4,	0x12D9,	%i2
	movcc	%xcc,	%l2,	%o7
	fandnot2	%f8,	%f2,	%f20
loop_2402:
	mova	%xcc,	%i6,	%o0
	tleu	%icc,	0x2
	tpos	%xcc,	0x3
	subcc	%g1,	%o1,	%l3
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x19
	orn	%g4,	0x0F60,	%i5
	sir	0x0C54
	andn	%i3,	%i0,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x6
	brgez,a	%l4,	loop_2403
	fmovsl	%icc,	%f5,	%f7
	movcs	%icc,	%i1,	%l5
	wr	%g0,	0x89,	%asi
	stwa	%g5,	[%l7 + 0x64] %asi
loop_2403:
	tsubcc	%o3,	%o4,	%l6
	stw	%g3,	[%l7 + 0x64]
	movrne	%g7,	%g2,	%l1
	array32	%i7,	%l0,	%o6
	sdivcc	%g6,	0x114B,	%i4
	fbe,a	%fcc1,	loop_2404
	addcc	%i2,	%l2,	%o7
	set	0x28, %l5
	swapa	[%l7 + %l5] 0x19,	%o2
loop_2404:
	te	%icc,	0x2
	orncc	%i6,	0x1BDF,	%o0
	bneg,a,pt	%xcc,	loop_2405
	fmovspos	%icc,	%f4,	%f1
	fmovdl	%icc,	%f5,	%f4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x18
loop_2405:
	fbuge	%fcc1,	loop_2406
	movneg	%icc,	%g1,	%o1
	umul	%g4,	0x0963,	%l3
	te	%icc,	0x3
loop_2406:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	fbn,a	%fcc0,	loop_2407
	movle	%xcc,	%i5,	%i0
	umul	%o5,	%l4,	%l5
	subc	%g5,	%o3,	%i1
loop_2407:
	tle	%xcc,	0x0
	andncc	%o4,	%l6,	%g7
	movcc	%xcc,	%g3,	%l1
	set	0x30, %g2
	lduwa	[%l7 + %g2] 0x80,	%i7
	edge16n	%l0,	%o6,	%g2
	sdiv	%g6,	0x06B1,	%i2
	set	0x3C, %l6
	stwa	%l2,	[%l7 + %l6] 0x0c
	fbg,a	%fcc2,	loop_2408
	mulx	%i4,	%o7,	%i6
	stb	%o0,	[%l7 + 0x22]
	movl	%icc,	%g1,	%o1
loop_2408:
	smulcc	%g4,	0x1B3B,	%l3
	fmovsneg	%xcc,	%f5,	%f21
	tleu	%icc,	0x5
	array32	%i3,	%o2,	%i0
	sub	%i5,	%o5,	%l5
	edge32	%g5,	%o3,	%i1
	fmovde	%icc,	%f26,	%f28
	srlx	%o4,	0x00,	%l6
	edge16n	%l4,	%g3,	%g7
	fpsub16s	%f17,	%f9,	%f12
	tn	%xcc,	0x3
	call	loop_2409
	edge16l	%l1,	%i7,	%l0
	fba	%fcc1,	loop_2410
	stx	%o6,	[%l7 + 0x28]
loop_2409:
	bleu,a,pn	%xcc,	loop_2411
	movvc	%xcc,	%g6,	%i2
loop_2410:
	orcc	%g2,	0x047B,	%l2
	fmovdg	%xcc,	%f27,	%f6
loop_2411:
	srlx	%i4,	0x12,	%o7
	sdivcc	%i6,	0x1840,	%g1
	fmovsge	%xcc,	%f23,	%f22
	fpsub16s	%f21,	%f4,	%f4
	movg	%xcc,	%o0,	%g4
	alignaddr	%l3,	%o1,	%i3
	fbn,a	%fcc1,	loop_2412
	edge32l	%o2,	%i0,	%o5
	tle	%xcc,	0x2
	fbg,a	%fcc1,	loop_2413
loop_2412:
	srlx	%l5,	%i5,	%g5
	edge32ln	%o3,	%i1,	%l6
	array32	%l4,	%o4,	%g7
loop_2413:
	sllx	%g3,	%l1,	%i7
	umul	%l0,	%g6,	%i2
	tgu	%xcc,	0x6
	alignaddr	%o6,	%l2,	%g2
	array8	%o7,	%i6,	%g1
	movrlez	%o0,	%i4,	%g4
	sir	0x090C
	fornot1s	%f18,	%f14,	%f23
	movvs	%xcc,	%l3,	%i3
	fone	%f2
	movne	%icc,	%o2,	%i0
	nop
	set	0x0C, %i7
	ldsw	[%l7 + %i7],	%o5
	edge8ln	%l5,	%i5,	%g5
	movcc	%icc,	%o1,	%o3
	taddcctv	%i1,	0x0DD1,	%l6
	or	%l4,	%o4,	%g3
	fbe	%fcc3,	loop_2414
	fbne,a	%fcc1,	loop_2415
	movrgz	%g7,	0x192,	%l1
	fmovscs	%icc,	%f1,	%f2
loop_2414:
	fnot1	%f4,	%f16
loop_2415:
	edge8l	%i7,	%g6,	%l0
	fpsub16s	%f13,	%f25,	%f26
	addc	%o6,	0x10A4,	%l2
	taddcctv	%i2,	%o7,	%g2
	set	0x24, %i4
	ldswa	[%l7 + %i4] 0x14,	%g1
	taddcctv	%i6,	0x1668,	%o0
	xorcc	%g4,	%i4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o2,	0x02AB,	%l3
	fmovdcs	%xcc,	%f17,	%f22
	orncc	%o5,	0x1491,	%l5
	alignaddr	%i0,	%g5,	%o1
	ble,pn	%icc,	loop_2416
	st	%f16,	[%l7 + 0x48]
	set	0x50, %i0
	lduwa	[%l7 + %i0] 0x10,	%i5
loop_2416:
	bcs,a	loop_2417
	sdivx	%o3,	0x0E6F,	%i1
	fblg,a	%fcc1,	loop_2418
	movne	%xcc,	%l6,	%o4
loop_2417:
	ldx	[%l7 + 0x30],	%g3
	addc	%l4,	0x08AA,	%l1
loop_2418:
	te	%icc,	0x0
	movrlez	%i7,	0x3E1,	%g7
	andn	%l0,	0x1129,	%g6
	fsrc1s	%f4,	%f4
	bcs,a	%xcc,	loop_2419
	fpack32	%f4,	%f30,	%f22
	orn	%o6,	0x05F9,	%i2
	andn	%o7,	0x152E,	%g2
loop_2419:
	movle	%xcc,	%g1,	%l2
	fexpand	%f10,	%f16
	fmovdle	%icc,	%f23,	%f17
	ldsb	[%l7 + 0x48],	%i6
	fmovdl	%icc,	%f24,	%f9
	tl	%icc,	0x7
	sdiv	%g4,	0x0C7F,	%i4
	fble,a	%fcc2,	loop_2420
	sdiv	%o0,	0x00BD,	%o2
	fpsub16s	%f31,	%f23,	%f1
	movrlz	%l3,	0x220,	%i3
loop_2420:
	fpadd16s	%f30,	%f10,	%f16
	srl	%o5,	0x03,	%i0
	membar	0x7E
	movge	%xcc,	%g5,	%l5
	subcc	%i5,	0x076E,	%o3
	bneg,pt	%icc,	loop_2421
	fmovscc	%icc,	%f30,	%f14
	smulcc	%i1,	0x1853,	%o1
	movg	%icc,	%o4,	%g3
loop_2421:
	tle	%icc,	0x3
	addc	%l4,	%l1,	%l6
	bne,a	%icc,	loop_2422
	orcc	%i7,	%g7,	%l0
	fmovdl	%icc,	%f18,	%f23
	bvc,a	loop_2423
loop_2422:
	array16	%o6,	%g6,	%o7
	srlx	%i2,	0x0A,	%g1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x24] %asi,	%f19
loop_2423:
	sir	0x14D8
	wr	%g0,	0x23,	%asi
	stba	%g2,	[%l7 + 0x5E] %asi
	membar	#Sync
	set	0x68, %g7
	sta	%f3,	[%l7 + %g7] 0x19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i6,	0x173A,	%g4
	edge8n	%i4,	%o0,	%l2
	array16	%l3,	%i3,	%o2
	fmovdcc	%xcc,	%f20,	%f18
	bshuffle	%f28,	%f4,	%f28
	move	%icc,	%o5,	%g5
	tg	%icc,	0x1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%l5
	sdiv	%i5,	0x1C43,	%i1
	movneg	%xcc,	%o1,	%o4
	edge8n	%g3,	%l4,	%o3
	andncc	%l1,	%i7,	%l6
	set	0x64, %l4
	stwa	%l0,	[%l7 + %l4] 0x2f
	membar	#Sync
	flush	%l7 + 0x48
	edge8	%o6,	%g7,	%o7
	edge8ln	%g6,	%g1,	%i2
	fpsub16s	%f6,	%f15,	%f3
	fcmpeq32	%f26,	%f20,	%i6
	sra	%g2,	%g4,	%o0
	xnorcc	%l2,	0x11D5,	%l3
	sir	0x1C2C
	fmovspos	%icc,	%f2,	%f17
	tcc	%xcc,	0x6
	fornot2	%f18,	%f8,	%f16
	ldstub	[%l7 + 0x62],	%i3
	fble,a	%fcc3,	loop_2424
	srlx	%i4,	%o2,	%g5
	fnand	%f22,	%f28,	%f20
	sethi	0x0D48,	%o5
loop_2424:
	fmovscs	%xcc,	%f17,	%f14
	movcc	%xcc,	%i0,	%i5
	fbne,a	%fcc2,	loop_2425
	tpos	%xcc,	0x0
	array16	%i1,	%o1,	%o4
	brgz	%g3,	loop_2426
loop_2425:
	edge8ln	%l4,	%o3,	%l5
	orn	%i7,	%l6,	%l1
	tpos	%xcc,	0x6
loop_2426:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f24,	[%l7 + 0x3C] %asi
	movrgz	%o6,	0x151,	%g7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%l0
	sir	0x0D82
	fmovdg	%icc,	%f26,	%f17
	tg	%icc,	0x4
	bcs,a	%icc,	loop_2427
	fnot2s	%f31,	%f8
	andn	%g1,	0x0235,	%g6
	orn	%i2,	0x0AD7,	%g2
loop_2427:
	brlez,a	%i6,	loop_2428
	movrlez	%g4,	%l2,	%l3
	fmuld8ulx16	%f11,	%f1,	%f12
	brlez,a	%o0,	loop_2429
loop_2428:
	fbl,a	%fcc0,	loop_2430
	orncc	%i4,	%i3,	%o2
	fornot2s	%f27,	%f2,	%f31
loop_2429:
	fpsub16s	%f2,	%f16,	%f1
loop_2430:
	fcmpes	%fcc1,	%f20,	%f4
	tge	%xcc,	0x3
	srlx	%g5,	0x0E,	%o5
	brlez	%i0,	loop_2431
	fpsub16s	%f12,	%f6,	%f26
	fmovsne	%xcc,	%f9,	%f25
	fbul,a	%fcc2,	loop_2432
loop_2431:
	movleu	%icc,	%i5,	%i1
	orn	%o4,	0x1D70,	%o1
	bvc,a,pn	%icc,	loop_2433
loop_2432:
	srax	%l4,	%o3,	%g3
	addccc	%l5,	0x0097,	%i7
	xnorcc	%l6,	0x065B,	%o6
loop_2433:
	xnor	%g7,	%l1,	%o7
	sdiv	%l0,	0x0184,	%g6
	faligndata	%f22,	%f18,	%f0
	popc	%i2,	%g1
	movpos	%icc,	%i6,	%g2
	movcc	%icc,	%l2,	%l3
	edge16l	%g4,	%o0,	%i3
	bg,a,pn	%icc,	loop_2434
	fmovdpos	%xcc,	%f24,	%f11
	tn	%icc,	0x3
	sllx	%i4,	%o2,	%o5
loop_2434:
	udiv	%g5,	0x1713,	%i5
	movre	%i0,	0x17A,	%o4
	fcmpeq16	%f16,	%f24,	%o1
	bshuffle	%f18,	%f0,	%f14
	tne	%xcc,	0x3
	fmuld8sux16	%f28,	%f20,	%f20
	fmovdne	%icc,	%f17,	%f28
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
	edge8n	%o3,	%i1,	%g3
	fpsub16s	%f31,	%f30,	%f11
	fmovdg	%icc,	%f7,	%f28
	mulx	%i7,	0x1094,	%l6
	nop
	setx	loop_2435,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%xcc,	0x6
	edge8	%o6,	%l5,	%g7
	or	%o7,	0x1E9F,	%l0
loop_2435:
	te	%xcc,	0x3
	edge8ln	%l1,	%g6,	%i2
	sdivcc	%i6,	0x1B1E,	%g2
	subccc	%g1,	0x1471,	%l2
	prefetch	[%l7 + 0x30],	 0x2
	sll	%g4,	%l3,	%o0
	xor	%i4,	%o2,	%o5
	wr	%g0,	0x81,	%asi
	stxa	%g5,	[%l7 + 0x38] %asi
	and	%i3,	%i5,	%o4
	fbge	%fcc1,	loop_2436
	fcmple32	%f24,	%f14,	%o1
	sdivcc	%l4,	0x06B3,	%o3
	alignaddrl	%i1,	%i0,	%i7
loop_2436:
	fsrc1s	%f21,	%f6
	tsubcctv	%l6,	0x11D5,	%o6
	movrlez	%g3,	%l5,	%g7
	edge16l	%o7,	%l1,	%g6
	taddcc	%i2,	0x1C2C,	%l0
	srlx	%i6,	0x0B,	%g2
	alignaddr	%l2,	%g4,	%g1
	ta	%icc,	0x6
	ldub	[%l7 + 0x79],	%o0
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fcmpgt16	%f14,	%f10,	%i4
	fpadd32	%f10,	%f18,	%f16
	movg	%xcc,	%o2,	%l3
	taddcctv	%g5,	%o5,	%i5
	udivx	%o4,	0x0E9D,	%o1
	fba,a	%fcc2,	loop_2437
	movrne	%l4,	%i3,	%i1
	add	%o3,	%i7,	%i0
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x10,	 0x2
loop_2437:
	taddcc	%l6,	0x0A86,	%l5
	fpsub16	%f14,	%f22,	%f30
	sub	%g7,	0x0ED5,	%o7
	tvs	%icc,	0x2
	movvs	%icc,	%g3,	%g6
	fornot1s	%f13,	%f17,	%f14
	edge16ln	%l1,	%l0,	%i2
	lduh	[%l7 + 0x32],	%g2
	addc	%l2,	%i6,	%g4
	sdivx	%o0,	0x0372,	%i4
	sra	%o2,	%l3,	%g5
	popc	0x107A,	%g1
	ta	%icc,	0x0
	umulcc	%o5,	%o4,	%i5
	subccc	%l4,	0x1692,	%o1
	bge,a	%icc,	loop_2438
	fmovsge	%icc,	%f15,	%f27
	fnot2s	%f6,	%f20
	add	%i3,	0x0553,	%i1
loop_2438:
	movrne	%i7,	0x1F4,	%i0
	fmovdn	%icc,	%f19,	%f15
	umulcc	%o6,	%o3,	%l6
	set	0x50, %i2
	lduha	[%l7 + %i2] 0x11,	%l5
	movpos	%xcc,	%g7,	%g3
	movle	%xcc,	%o7,	%l1
	movpos	%xcc,	%l0,	%g6
	array32	%i2,	%g2,	%i6
	andcc	%g4,	%l2,	%o0
	movrgez	%i4,	%l3,	%g5
	andncc	%g1,	%o2,	%o5
	fmovsge	%icc,	%f11,	%f3
	fnands	%f16,	%f8,	%f12
	fmovs	%f25,	%f9
	stw	%i5,	[%l7 + 0x68]
	fexpand	%f31,	%f12
	fbn	%fcc1,	loop_2439
	sra	%o4,	0x14,	%l4
	edge16	%o1,	%i3,	%i7
	fmul8ulx16	%f2,	%f20,	%f12
loop_2439:
	umul	%i0,	0x1CDB,	%o6
	fmovsge	%xcc,	%f6,	%f2
	ldsb	[%l7 + 0x54],	%i1
	ba	%xcc,	loop_2440
	fsrc2	%f0,	%f4
	addc	%o3,	%l5,	%g7
	xor	%g3,	0x14F6,	%l6
loop_2440:
	nop
	set	0x08, %o0
	lduha	[%l7 + %o0] 0x18,	%l1
	tle	%icc,	0x6
	subcc	%l0,	0x0716,	%g6
	umulcc	%o7,	%i2,	%i6
	ldsh	[%l7 + 0x0C],	%g2
	array8	%g4,	%l2,	%o0
	fmovs	%f21,	%f31
	bshuffle	%f12,	%f4,	%f22
	move	%xcc,	%i4,	%l3
	fbu	%fcc3,	loop_2441
	or	%g5,	0x1C9C,	%o2
	sub	%o5,	0x0E1A,	%g1
	brnz	%i5,	loop_2442
loop_2441:
	bg,a,pn	%xcc,	loop_2443
	edge32n	%o4,	%o1,	%l4
	nop
	setx	loop_2444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2442:
	bshuffle	%f16,	%f26,	%f22
loop_2443:
	fmovscs	%icc,	%f24,	%f25
	stw	%i7,	[%l7 + 0x08]
loop_2444:
	bleu,a	loop_2445
	movrgez	%i3,	%i0,	%o6
	subccc	%i1,	0x1451,	%l5
	umul	%o3,	%g7,	%l6
loop_2445:
	bpos,pn	%icc,	loop_2446
	orn	%g3,	%l1,	%l0
	fcmpeq32	%f4,	%f24,	%o7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x15,	%f0
loop_2446:
	taddcc	%g6,	0x15F2,	%i2
	fcmple16	%f18,	%f18,	%i6
	umul	%g4,	0x0239,	%g2
	ldsb	[%l7 + 0x0B],	%l2
	lduw	[%l7 + 0x38],	%i4
	fpackfix	%f22,	%f28
	alignaddr	%l3,	%o0,	%g5
	movre	%o2,	0x1D1,	%o5
	swap	[%l7 + 0x64],	%g1
	fmovsg	%xcc,	%f20,	%f24
	fmovsn	%icc,	%f1,	%f27
	st	%f24,	[%l7 + 0x78]
	bn,a,pt	%icc,	loop_2447
	andn	%o4,	%o1,	%i5
	bneg,a,pt	%icc,	loop_2448
	fmovrslez	%l4,	%f5,	%f27
loop_2447:
	fmul8sux16	%f26,	%f16,	%f12
	fmovscs	%icc,	%f21,	%f27
loop_2448:
	fmovscs	%xcc,	%f10,	%f23
	fmul8x16al	%f31,	%f15,	%f2
	andn	%i7,	0x135E,	%i3
	edge8l	%i0,	%o6,	%i1
	movre	%o3,	%g7,	%l5
	alignaddr	%l6,	%g3,	%l0
	movle	%xcc,	%l1,	%g6
	andncc	%i2,	%i6,	%g4
	tvs	%xcc,	0x7
	tpos	%xcc,	0x3
	fabsd	%f6,	%f16
	be	loop_2449
	fmovsvc	%xcc,	%f19,	%f28
	movl	%icc,	%o7,	%l2
	andn	%i4,	%l3,	%o0
loop_2449:
	sdivx	%g5,	0x1F56,	%o2
	sth	%o5,	[%l7 + 0x48]
	bge	loop_2450
	umul	%g1,	0x1EB4,	%g2
	fbn	%fcc2,	loop_2451
	edge8l	%o1,	%i5,	%o4
loop_2450:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i3
loop_2451:
	andncc	%i7,	%o6,	%i1
	fmovrsgez	%o3,	%f20,	%f9
	sub	%g7,	%l5,	%i0
	edge32n	%g3,	%l6,	%l0
	membar	0x2D
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pt	%xcc,	loop_2452
	tn	%xcc,	0x1
	tpos	%icc,	0x5
	fmuld8ulx16	%f5,	%f21,	%f8
loop_2452:
	nop
	setx	loop_2453,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%l1,	%i2,	%g6
	mulx	%g4,	%o7,	%l2
	fornot1	%f22,	%f26,	%f18
loop_2453:
	tsubcctv	%i6,	0x0B73,	%i4
	smul	%o0,	0x0EE0,	%l3
	bvc,a	loop_2454
	edge32	%g5,	%o5,	%o2
	movre	%g1,	0x08F,	%g2
	xorcc	%o1,	%i5,	%l4
loop_2454:
	movne	%xcc,	%o4,	%i7
	movrgz	%o6,	0x25F,	%i1
	sllx	%o3,	%g7,	%l5
	tl	%xcc,	0x5
	sub	%i3,	%g3,	%l6
	array16	%l0,	%i0,	%l1
	movg	%xcc,	%i2,	%g4
	fandnot2s	%f7,	%f16,	%f0
	bgu	%xcc,	loop_2455
	edge16n	%g6,	%l2,	%o7
	array8	%i4,	%i6,	%o0
	fbe,a	%fcc0,	loop_2456
loop_2455:
	fmovsl	%xcc,	%f14,	%f1
	ldx	[%l7 + 0x60],	%g5
	fcmpeq32	%f30,	%f22,	%o5
loop_2456:
	fmovde	%xcc,	%f14,	%f6
	movl	%icc,	%o2,	%l3
	fnegs	%f20,	%f2
	ldsh	[%l7 + 0x64],	%g2
	fmovsleu	%icc,	%f22,	%f13
	bleu,a	%xcc,	loop_2457
	mulx	%o1,	0x0963,	%i5
	movrgz	%l4,	0x16C,	%g1
	tvc	%xcc,	0x7
loop_2457:
	edge8ln	%i7,	%o4,	%i1
	faligndata	%f24,	%f22,	%f10
	ldub	[%l7 + 0x59],	%o3
	fbe	%fcc1,	loop_2458
	fmovse	%icc,	%f30,	%f7
	mulx	%o6,	%l5,	%g7
	tg	%xcc,	0x3
loop_2458:
	fmul8sux16	%f0,	%f30,	%f28
	fzeros	%f28
	fbu	%fcc2,	loop_2459
	tcs	%icc,	0x5
	ba,a	loop_2460
	tne	%xcc,	0x4
loop_2459:
	fornot1s	%f27,	%f27,	%f19
	ldd	[%l7 + 0x10],	%f8
loop_2460:
	orncc	%g3,	%i3,	%l0
	set	0x67, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l6
	set	0x64, %o6
	ldsha	[%l7 + %o6] 0x81,	%l1
	tneg	%icc,	0x2
	movge	%icc,	%i2,	%g4
	fzeros	%f20
	sir	0x150B
	udivcc	%i0,	0x07D3,	%g6
	andncc	%l2,	%i4,	%i6
	taddcc	%o7,	0x07D2,	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%o2
	tcc	%icc,	0x4
	array32	%l3,	%o0,	%g2
	udiv	%i5,	0x12BD,	%l4
	tne	%icc,	0x4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x0c,	%g1,	%o1
	edge8n	%o4,	%i7,	%o3
	movneg	%xcc,	%i1,	%l5
	fxnor	%f22,	%f16,	%f10
	tn	%xcc,	0x3
	set	0x70, %l3
	stda	%o6,	[%l7 + %l3] 0xeb
	membar	#Sync
	fmovd	%f4,	%f2
	te	%xcc,	0x2
	ta	%icc,	0x2
	sir	0x0605
	set	0x09, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g7
	andn	%g3,	%i3,	%l0
	fbuge	%fcc1,	loop_2461
	brz,a	%l1,	loop_2462
	andn	%l6,	%i2,	%i0
	movrgez	%g4,	0x3E6,	%l2
loop_2461:
	mulx	%g6,	0x1F2A,	%i6
loop_2462:
	fnor	%f6,	%f2,	%f18
	bgu,a	loop_2463
	fmovdpos	%xcc,	%f25,	%f3
	add	%i4,	%o7,	%g5
	wr	%g0,	0x81,	%asi
	stha	%o5,	[%l7 + 0x74] %asi
loop_2463:
	fmovsge	%xcc,	%f9,	%f9
	move	%xcc,	%l3,	%o0
	fornot1s	%f20,	%f30,	%f7
	membar	0x34
	udivx	%o2,	0x0015,	%g2
	sth	%l4,	[%l7 + 0x12]
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x14] %asi,	%f7
	orncc	%i5,	0x073A,	%o1
	movgu	%icc,	%o4,	%i7
	sub	%g1,	0x09CD,	%i1
	fmovdpos	%icc,	%f9,	%f20
	fcmped	%fcc2,	%f12,	%f22
	set	0x3C, %i6
	stwa	%l5,	[%l7 + %i6] 0x2f
	membar	#Sync
	be	%xcc,	loop_2464
	tvs	%xcc,	0x7
	addcc	%o3,	0x0281,	%o6
	sra	%g7,	%g3,	%l0
loop_2464:
	udiv	%l1,	0x1646,	%i3
	membar	0x0D
	subcc	%l6,	0x02F9,	%i0
	sdiv	%g4,	0x1422,	%i2
	edge8	%g6,	%i6,	%l2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x2C] %asi,	%f16
	sethi	0x0673,	%i4
	fbug	%fcc3,	loop_2465
	fornot1s	%f3,	%f24,	%f22
	sir	0x0C9C
	fxor	%f6,	%f10,	%f0
loop_2465:
	tneg	%icc,	0x1
	tcs	%icc,	0x0
	brz,a	%o7,	loop_2466
	srax	%g5,	0x11,	%o5
	nop
	setx	loop_2467,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x70],	%f10
loop_2466:
	fpack32	%f14,	%f16,	%f2
	edge32ln	%o0,	%o2,	%l3
loop_2467:
	sllx	%l4,	%g2,	%i5
	xnor	%o1,	%i7,	%g1
	fcmpeq32	%f20,	%f22,	%i1
	fbul,a	%fcc1,	loop_2468
	edge16	%l5,	%o4,	%o3
	fbug	%fcc2,	loop_2469
	fpsub16	%f10,	%f24,	%f0
loop_2468:
	brnz	%g7,	loop_2470
	edge16n	%g3,	%l0,	%o6
loop_2469:
	te	%icc,	0x6
	fmovdle	%xcc,	%f7,	%f9
loop_2470:
	edge8l	%i3,	%l1,	%l6
	brlez,a	%g4,	loop_2471
	add	%i2,	%i0,	%g6
	edge32l	%l2,	%i4,	%o7
	tcc	%icc,	0x5
loop_2471:
	fnands	%f27,	%f18,	%f11
	flush	%l7 + 0x60
	edge16n	%i6,	%o5,	%g5
	movl	%xcc,	%o2,	%o0
	tgu	%icc,	0x1
	fmovdcs	%icc,	%f31,	%f9
	edge8n	%l4,	%l3,	%i5
	tne	%xcc,	0x5
	bgu	loop_2472
	srl	%o1,	%g2,	%g1
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
loop_2472:
	fmuld8ulx16	%f22,	%f27,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%o4,	%i7
	tle	%icc,	0x5
	fors	%f30,	%f27,	%f21
	movn	%xcc,	%g7,	%o3
	xnor	%g3,	0x1C38,	%o6
	fmul8x16al	%f29,	%f24,	%f14
	tle	%icc,	0x7
	subccc	%i3,	%l0,	%l6
	sdivx	%l1,	0x053C,	%i2
	tvc	%xcc,	0x2
	xorcc	%i0,	%g6,	%l2
	tsubcctv	%g4,	0x079D,	%i4
	sethi	0x1A8A,	%o7
	fbl	%fcc1,	loop_2473
	or	%o5,	%i6,	%o2
	array32	%g5,	%o0,	%l3
	tvs	%icc,	0x4
loop_2473:
	add	%l4,	%o1,	%g2
	udiv	%i5,	0x1505,	%i1
	fbe	%fcc0,	loop_2474
	call	loop_2475
	nop
	setx loop_2476, %l0, %l1
	jmpl %l1, %g1
	fmovrslez	%l5,	%f26,	%f16
loop_2474:
	smulcc	%i7,	%g7,	%o3
loop_2475:
	fblg	%fcc2,	loop_2477
loop_2476:
	swap	[%l7 + 0x18],	%o4
	array32	%o6,	%g3,	%l0
	tne	%xcc,	0x1
loop_2477:
	brgez,a	%l6,	loop_2478
	fcmpgt16	%f24,	%f0,	%l1
	alignaddrl	%i3,	%i0,	%i2
	tgu	%icc,	0x1
loop_2478:
	srax	%l2,	%g4,	%g6
	orncc	%o7,	%i4,	%o5
	edge16ln	%o2,	%g5,	%o0
	movleu	%xcc,	%i6,	%l3
	andn	%l4,	0x1D0B,	%o1
	array16	%i5,	%g2,	%g1
	movrgz	%i1,	%i7,	%g7
	tneg	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2479
	alignaddr	%o3,	%o4,	%o6
	movl	%icc,	%g3,	%l0
	fand	%f8,	%f2,	%f30
loop_2479:
	movg	%icc,	%l5,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i3,	0x3A6,	%i0
	fmovdgu	%icc,	%f15,	%f0
	fornot2s	%f23,	%f12,	%f30
	fmovsgu	%xcc,	%f4,	%f12
	fmovdg	%xcc,	%f27,	%f17
	fnors	%f10,	%f4,	%f29
	udiv	%i2,	0x0C1C,	%l1
	fbuge	%fcc2,	loop_2480
	fnot2	%f24,	%f20
	andn	%g4,	0x1216,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x70] %asi,	%l2
loop_2480:
	fandnot2	%f14,	%f0,	%f0
	brgez	%i4,	loop_2481
	umulcc	%o5,	%o7,	%g5
	movn	%icc,	%o0,	%o2
	edge16	%l3,	%i6,	%l4
loop_2481:
	ba	loop_2482
	fmovrse	%o1,	%f0,	%f25
	array32	%i5,	%g1,	%i1
	movn	%icc,	%g2,	%i7
loop_2482:
	taddcctv	%o3,	%g7,	%o6
	movrgez	%o4,	%l0,	%l5
	movneg	%icc,	%g3,	%i3
	set	0x3C, %l1
	ldstuba	[%l7 + %l1] 0x80,	%i0
	sth	%i2,	[%l7 + 0x5A]
	fnands	%f10,	%f22,	%f5
	sra	%l6,	%g4,	%g6
	movrgz	%l2,	%l1,	%i4
	membar	0x04
	tcs	%icc,	0x6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tvs	%xcc,	0x1
	fmovrdgz	%o5,	%f30,	%f28
	ldsb	[%l7 + 0x79],	%o7
	mova	%icc,	%g5,	%o0
	andncc	%o2,	%i6,	%l4
	fmuld8sux16	%f1,	%f31,	%f28
	bvs,a,pn	%icc,	loop_2483
	nop
	setx	loop_2484,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%o1,	0x0D5E,	%l3
	or	%i5,	%i1,	%g2
loop_2483:
	tpos	%icc,	0x6
loop_2484:
	srax	%i7,	0x10,	%g1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x14,	%g6
	tl	%xcc,	0x4
	tn	%xcc,	0x3
	be,a	loop_2485
	orncc	%o6,	%o3,	%o4
	tsubcc	%l0,	0x1907,	%g3
	bleu,pn	%xcc,	loop_2486
loop_2485:
	sll	%i3,	0x16,	%i0
	stx	%l5,	[%l7 + 0x78]
	fba,a	%fcc3,	loop_2487
loop_2486:
	movge	%icc,	%l6,	%i2
	andcc	%g6,	%l2,	%g4
	move	%xcc,	%l1,	%o5
loop_2487:
	ble	%xcc,	loop_2488
	add	%i4,	%o7,	%g5
	fsrc1	%f2,	%f8
	prefetch	[%l7 + 0x54],	 0x1
loop_2488:
	tsubcctv	%o2,	%o0,	%l4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o1
	fexpand	%f20,	%f18
	fmul8ulx16	%f8,	%f20,	%f16
	srlx	%i5,	0x0F,	%l3
	movle	%xcc,	%i1,	%g2
	fnor	%f4,	%f18,	%f20
	te	%xcc,	0x1
	mulscc	%g1,	%g7,	%i7
	ldub	[%l7 + 0x77],	%o6
	sth	%o3,	[%l7 + 0x46]
	fmul8x16	%f24,	%f10,	%f26
	movrgez	%l0,	%g3,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x0c,	%o4,	%i0
	set	0x78, %o4
	sta	%f3,	[%l7 + %o4] 0x18
	tl	%xcc,	0x1
	alignaddrl	%l5,	%i2,	%l6
	and	%l2,	%g4,	%l1
	fmovsl	%icc,	%f5,	%f22
	udiv	%o5,	0x0EB5,	%g6
	fexpand	%f22,	%f26
	nop
	setx	loop_2489,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdgz	%o7,	%f14,	%f30
	and	%g5,	%i4,	%o0
	set	0x3C, %g4
	stha	%o2,	[%l7 + %g4] 0x88
loop_2489:
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%l4
	fmovsgu	%xcc,	%f6,	%f16
	fmovd	%f22,	%f16
	sdiv	%o1,	0x1FAB,	%i6
	subcc	%i5,	%i1,	%l3
	subc	%g1,	0x09AE,	%g2
	orcc	%g7,	0x0688,	%o6
	fnot2	%f0,	%f28
	brlez,a	%o3,	loop_2490
	taddcc	%i7,	%l0,	%g3
	tne	%xcc,	0x2
	tl	%xcc,	0x2
loop_2490:
	fnot1	%f14,	%f8
	array8	%i3,	%i0,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x18, %i5
	stda	%i2,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x5E, %o2
	stha	%l6,	[%l7 + %o2] 0x2f
	membar	#Sync
	bgu,a	loop_2491
	fbuge	%fcc1,	loop_2492
	fcmped	%fcc2,	%f14,	%f30
	edge32	%l2,	%g4,	%l5
loop_2491:
	add	%o5,	0x0FF5,	%g6
loop_2492:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdn	%icc,	%f31,	%f30
	bg,a,pn	%xcc,	loop_2493
	bleu	%icc,	loop_2494
	nop
	set	0x4A, %g6
	sth	%o7,	[%l7 + %g6]
	fone	%f30
loop_2493:
	srl	%l1,	0x12,	%i4
loop_2494:
	bvs	loop_2495
	movle	%xcc,	%o0,	%o2
	addcc	%l4,	0x1C75,	%g5
	brlez	%i6,	loop_2496
loop_2495:
	fexpand	%f24,	%f24
	edge8l	%o1,	%i1,	%i5
	fcmple16	%f20,	%f26,	%g1
loop_2496:
	umul	%l3,	%g7,	%o6
	sth	%o3,	[%l7 + 0x4A]
	fmovsne	%xcc,	%f18,	%f28
	edge8	%g2,	%i7,	%g3
	bneg,a,pn	%icc,	loop_2497
	edge16n	%l0,	%i0,	%o4
	fpmerge	%f7,	%f16,	%f18
	movle	%xcc,	%i3,	%l6
loop_2497:
	bcs	loop_2498
	edge16ln	%i2,	%l2,	%g4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
loop_2498:
	taddcctv	%o5,	%o7,	%g6
	fsrc1	%f8,	%f6
	stx	%i4,	[%l7 + 0x60]
	stb	%o0,	[%l7 + 0x76]
	fmovdleu	%icc,	%f6,	%f31
	fbe,a	%fcc0,	loop_2499
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%o2
	fcmpne16	%f4,	%f8,	%l1
	addcc	%l4,	%g5,	%i6
loop_2499:
	sdivx	%i1,	0x1DB6,	%i5
	bpos	loop_2500
	fmovdl	%icc,	%f29,	%f29
	and	%o1,	0x1B80,	%l3
	sdivcc	%g1,	0x1546,	%o6
loop_2500:
	edge32n	%g7,	%g2,	%i7
	fcmple16	%f8,	%f2,	%o3
	tvc	%icc,	0x4
	fcmpgt16	%f28,	%f10,	%g3
	fmovrde	%i0,	%f24,	%f20
	tpos	%xcc,	0x6
	smul	%l0,	%i3,	%l6
	srax	%o4,	0x02,	%i2
	swap	[%l7 + 0x1C],	%l2
	set	0x54, %o3
	lda	[%l7 + %o3] 0x80,	%f17
	fsrc2	%f18,	%f26
	edge8n	%g4,	%o5,	%o7
	fcmpeq16	%f12,	%f16,	%g6
	fnegd	%f20,	%f28
	xor	%i4,	0x094A,	%l5
	fmul8sux16	%f24,	%f4,	%f10
	tsubcc	%o2,	%o0,	%l1
	tsubcctv	%g5,	%i6,	%l4
	fbl	%fcc1,	loop_2501
	umul	%i1,	%i5,	%o1
	edge16n	%l3,	%g1,	%g7
	fmovdle	%icc,	%f8,	%f21
loop_2501:
	tcs	%icc,	0x6
	fba	%fcc1,	loop_2502
	fbule,a	%fcc1,	loop_2503
	fnors	%f4,	%f26,	%f17
	tcs	%icc,	0x2
loop_2502:
	srlx	%o6,	%i7,	%g2
loop_2503:
	udivx	%o3,	0x1610,	%i0
	tge	%xcc,	0x5
	fmovdcs	%xcc,	%f17,	%f28
	edge8n	%g3,	%i3,	%l0
	brgz	%o4,	loop_2504
	fmovsge	%icc,	%f4,	%f17
	call	loop_2505
	te	%xcc,	0x7
loop_2504:
	fmovrde	%l6,	%f16,	%f24
	edge8ln	%l2,	%g4,	%i2
loop_2505:
	mulscc	%o5,	0x16AF,	%g6
	addcc	%i4,	0x07B2,	%o7
	smulcc	%o2,	%o0,	%l1
	tg	%icc,	0x1
	tsubcctv	%g5,	0x0072,	%l5
	bpos,a	%icc,	loop_2506
	sdiv	%i6,	0x12D4,	%l4
	fbule,a	%fcc2,	loop_2507
	movrne	%i5,	%i1,	%l3
loop_2506:
	fmovsvc	%icc,	%f6,	%f15
	fmovsne	%xcc,	%f20,	%f2
loop_2507:
	movvs	%xcc,	%g1,	%o1
	fbe	%fcc0,	loop_2508
	fpsub16	%f8,	%f12,	%f12
	sra	%o6,	0x0F,	%i7
	movpos	%xcc,	%g7,	%g2
loop_2508:
	movg	%icc,	%o3,	%i0
	fsrc2	%f26,	%f2
	sdiv	%g3,	0x171E,	%l0
	fandnot2s	%f8,	%f5,	%f0
	sir	0x12E0
	movrgez	%i3,	%o4,	%l6
	and	%g4,	0x0B63,	%l2
	lduw	[%l7 + 0x58],	%o5
	sra	%i2,	0x0E,	%g6
	tneg	%xcc,	0x2
	set	0x78, %g1
	sta	%f4,	[%l7 + %g1] 0x88
	fmovdvs	%icc,	%f31,	%f8
	ble,a,pn	%icc,	loop_2509
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i4,	%o7
	set	0x68, %l5
	swapa	[%l7 + %l5] 0x89,	%o2
loop_2509:
	fpsub16s	%f13,	%f7,	%f7
	tpos	%icc,	0x2
	alignaddrl	%o0,	%l1,	%g5
	sir	0x1CA5
	stb	%l5,	[%l7 + 0x65]
	edge8ln	%i6,	%i5,	%i1
	movle	%icc,	%l3,	%g1
	fbg,a	%fcc3,	loop_2510
	umulcc	%l4,	%o1,	%i7
	movneg	%xcc,	%o6,	%g2
	fnegd	%f8,	%f10
loop_2510:
	movneg	%icc,	%o3,	%g7
	tle	%xcc,	0x0
	tneg	%xcc,	0x5
	fbue,a	%fcc0,	loop_2511
	movleu	%icc,	%i0,	%l0
	sub	%g3,	0x0AC2,	%o4
	orn	%l6,	0x1A60,	%i3
loop_2511:
	brz,a	%l2,	loop_2512
	sll	%o5,	%i2,	%g6
	fbug,a	%fcc3,	loop_2513
	movle	%xcc,	%i4,	%g4
loop_2512:
	movcc	%xcc,	%o2,	%o0
	movrlez	%o7,	%g5,	%l5
loop_2513:
	and	%l1,	%i5,	%i6
	fmovdvs	%xcc,	%f15,	%f2
	fsrc2	%f20,	%f6
	fmovdneg	%xcc,	%f5,	%f2
	movrgz	%i1,	0x112,	%l3
	fmovdg	%icc,	%f15,	%f28
	movvs	%icc,	%g1,	%o1
	addcc	%i7,	0x18F9,	%o6
	ba	loop_2514
	sub	%l4,	%o3,	%g7
	movcs	%xcc,	%i0,	%g2
	movne	%xcc,	%l0,	%g3
loop_2514:
	fmovsleu	%icc,	%f14,	%f17
	lduw	[%l7 + 0x5C],	%o4
	movne	%icc,	%i3,	%l6
	add	%l2,	%o5,	%g6
	tcs	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i2,	0x08C9,	%g4
	tcc	%icc,	0x0
	tge	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i4,	0x181B,	%o0
	tpos	%xcc,	0x6
	fpack16	%f8,	%f21
	movpos	%icc,	%o2,	%g5
	tn	%icc,	0x4
	bvs,pn	%icc,	loop_2515
	fbu,a	%fcc2,	loop_2516
	brgz,a	%l5,	loop_2517
	xorcc	%l1,	%o7,	%i6
loop_2515:
	sdivx	%i1,	0x1F9A,	%l3
loop_2516:
	stw	%g1,	[%l7 + 0x10]
loop_2517:
	movg	%xcc,	%i5,	%i7
	fmovrdne	%o6,	%f4,	%f2
	movrgz	%o1,	0x266,	%l4
	ldstub	[%l7 + 0x59],	%o3
	be,a	loop_2518
	fbul	%fcc3,	loop_2519
	fbg	%fcc0,	loop_2520
	bcc,a,pt	%xcc,	loop_2521
loop_2518:
	movrlz	%g7,	0x30A,	%i0
loop_2519:
	bneg,a	%xcc,	loop_2522
loop_2520:
	udivcc	%l0,	0x178F,	%g3
loop_2521:
	std	%f24,	[%l7 + 0x18]
	ldub	[%l7 + 0x6A],	%o4
loop_2522:
	array8	%g2,	%l6,	%l2
	subc	%o5,	%g6,	%i3
	sra	%i2,	%g4,	%o0
	call	loop_2523
	bn	loop_2524
	fmovsg	%xcc,	%f28,	%f7
	sllx	%o2,	%g5,	%i4
loop_2523:
	subccc	%l1,	0x0BEC,	%l5
loop_2524:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x28] %asi,	%o7
	tcc	%icc,	0x5
	or	%i1,	0x169B,	%l3
	te	%icc,	0x6
	tsubcctv	%i6,	0x177F,	%g1
	umul	%i5,	%o6,	%i7
	subcc	%l4,	0x0154,	%o3
	tg	%icc,	0x0
	sdivx	%g7,	0x19C3,	%i0
	fmovrse	%o1,	%f13,	%f3
	udivx	%l0,	0x0044,	%o4
	stb	%g2,	[%l7 + 0x75]
	fcmple16	%f0,	%f20,	%g3
	andcc	%l2,	%l6,	%g6
	edge32ln	%o5,	%i3,	%g4
	sdivx	%i2,	0x0DF1,	%o0
	fmovdne	%xcc,	%f2,	%f9
	tcc	%xcc,	0x7
	fmovrdne	%g5,	%f28,	%f6
	xnorcc	%i4,	0x0445,	%l1
	tl	%xcc,	0x6
	movrlez	%l5,	0x034,	%o7
	tcc	%icc,	0x7
	tn	%icc,	0x4
	movcs	%icc,	%o2,	%i1
	sir	0x195B
	te	%xcc,	0x5
	tpos	%icc,	0x1
	xnorcc	%i6,	%g1,	%l3
	st	%f2,	[%l7 + 0x74]
	addcc	%i5,	0x1C5E,	%o6
	fmovdpos	%icc,	%f28,	%f19
	array16	%l4,	%i7,	%o3
	ldsb	[%l7 + 0x1B],	%i0
	edge16n	%o1,	%l0,	%o4
	movre	%g7,	0x0B7,	%g3
	membar	0x7A
	movre	%l2,	%l6,	%g6
	fbuge,a	%fcc3,	loop_2525
	edge32ln	%o5,	%g2,	%g4
	fandnot2s	%f30,	%f19,	%f12
	udivx	%i3,	0x144E,	%i2
loop_2525:
	and	%g5,	0x1835,	%i4
	stx	%o0,	[%l7 + 0x60]
	addcc	%l5,	0x1EBC,	%o7
	sllx	%o2,	%l1,	%i1
	addc	%i6,	%g1,	%i5
	fbn,a	%fcc0,	loop_2526
	tleu	%xcc,	0x7
	ta	%icc,	0x5
	bn,a,pt	%icc,	loop_2527
loop_2526:
	fmovspos	%icc,	%f30,	%f16
	bvs	loop_2528
	fpsub32	%f0,	%f18,	%f20
loop_2527:
	popc	0x1857,	%l3
	ldsb	[%l7 + 0x44],	%l4
loop_2528:
	fba	%fcc2,	loop_2529
	mova	%xcc,	%o6,	%o3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x37] %asi,	%i0
loop_2529:
	bpos,a,pn	%icc,	loop_2530
	smulcc	%i7,	%o1,	%l0
	fbu,a	%fcc2,	loop_2531
	edge16	%g7,	%o4,	%g3
loop_2530:
	st	%f26,	[%l7 + 0x6C]
	sdiv	%l2,	0x0263,	%g6
loop_2531:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc1,	loop_2532
	mulx	%o5,	%g2,	%l6
	tcs	%xcc,	0x3
	movleu	%xcc,	%i3,	%i2
loop_2532:
	fmovsg	%xcc,	%f23,	%f4
	tne	%xcc,	0x3
	tpos	%icc,	0x2
	udivx	%g5,	0x192A,	%i4
	movpos	%icc,	%g4,	%o0
	bcs,a	%xcc,	loop_2533
	stb	%l5,	[%l7 + 0x4E]
	movre	%o7,	0x3BD,	%o2
	sll	%l1,	%i1,	%i6
loop_2533:
	sdivcc	%i5,	0x09CE,	%g1
	sll	%l4,	%l3,	%o6
	ldsh	[%l7 + 0x6C],	%o3
	movcc	%icc,	%i7,	%i0
	fmovrdgez	%o1,	%f28,	%f6
	tgu	%xcc,	0x4
	fzeros	%f27
	fbuge	%fcc0,	loop_2534
	sdiv	%l0,	0x0747,	%g7
	fmovs	%f28,	%f29
	set	0x38, %l0
	stxa	%o4,	[%l7 + %l0] 0x19
loop_2534:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x11,	%l2,	%g6
	prefetch	[%l7 + 0x10],	 0x0
	fzeros	%f18
	fmul8x16	%f21,	%f2,	%f2
	fmul8sux16	%f12,	%f8,	%f28
	xnorcc	%g3,	0x086C,	%g2
	ld	[%l7 + 0x38],	%f27
	set	0x6A, %g2
	ldsba	[%l7 + %g2] 0x04,	%o5
	xnorcc	%l6,	%i3,	%g5
	fpsub16s	%f6,	%f26,	%f28
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%i2
	movl	%icc,	%g4,	%l5
	wr	%g0,	0x81,	%asi
	stha	%o0,	[%l7 + 0x2E] %asi
	udivx	%o7,	0x0CA7,	%l1
	tgu	%icc,	0x5
	te	%icc,	0x4
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x3C] %asi,	%f18
	alignaddr	%i1,	%o2,	%i6
	fmovsg	%icc,	%f9,	%f19
	tne	%icc,	0x1
	subcc	%g1,	0x09BD,	%l4
	movn	%icc,	%l3,	%i5
	sll	%o6,	0x17,	%i7
	te	%icc,	0x0
	movrgez	%o3,	%o1,	%i0
	sir	0x10F4
	fmovrdlz	%g7,	%f6,	%f2
	fmovrsne	%o4,	%f4,	%f29
	fbo	%fcc1,	loop_2535
	xorcc	%l2,	%l0,	%g6
	set	0x8, %l6
	ldxa	[%g0 + %l6] 0x21,	%g3
loop_2535:
	swap	[%l7 + 0x60],	%o5
	edge8n	%g2,	%l6,	%g5
	sra	%i4,	0x1C,	%i3
	edge8n	%g4,	%l5,	%i2
	srl	%o0,	0x11,	%o7
	fmovrdlez	%l1,	%f22,	%f18
	tle	%xcc,	0x0
	movpos	%icc,	%o2,	%i1
	fmovrslz	%g1,	%f3,	%f15
	set	0x11, %g3
	lduba	[%l7 + %g3] 0x89,	%i6
	movrlz	%l3,	0x1CD,	%i5
	stw	%o6,	[%l7 + 0x48]
	movrgez	%i7,	0x084,	%l4
	bpos,a,pt	%xcc,	loop_2536
	brgz,a	%o3,	loop_2537
	and	%o1,	%g7,	%i0
	array8	%o4,	%l0,	%g6
loop_2536:
	fbug,a	%fcc0,	loop_2538
loop_2537:
	tne	%icc,	0x2
	edge8	%l2,	%o5,	%g3
	movne	%icc,	%g2,	%l6
loop_2538:
	fnot1	%f22,	%f24
	bne,a	%icc,	loop_2539
	alignaddrl	%g5,	%i3,	%i4
	mulscc	%l5,	%g4,	%i2
	fbo,a	%fcc3,	loop_2540
loop_2539:
	fmovrslez	%o7,	%f27,	%f8
	movl	%icc,	%o0,	%o2
	faligndata	%f30,	%f24,	%f24
loop_2540:
	bvc,a	%icc,	loop_2541
	fmovsa	%xcc,	%f4,	%f10
	fmovsne	%icc,	%f10,	%f15
	fmovsle	%icc,	%f9,	%f30
loop_2541:
	movcc	%icc,	%l1,	%i1
	subcc	%i6,	0x09AC,	%l3
	movge	%icc,	%i5,	%o6
	orn	%g1,	%l4,	%o3
	array8	%o1,	%g7,	%i7
	fmovdvc	%icc,	%f12,	%f20
	brlz,a	%i0,	loop_2542
	nop
	setx	loop_2543,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%o4,	%l0,	%g6
	tle	%icc,	0x7
loop_2542:
	smulcc	%o5,	0x0F9B,	%l2
loop_2543:
	fmovdneg	%icc,	%f27,	%f0
	bn,a	loop_2544
	fands	%f27,	%f23,	%f7
	fmovrdgz	%g3,	%f24,	%f30
	ldsh	[%l7 + 0x7E],	%g2
loop_2544:
	movn	%icc,	%l6,	%i3
	nop
	setx	loop_2545,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%g5,	0x1B7D,	%i4
	addcc	%g4,	%l5,	%o7
	bleu,a	%icc,	loop_2546
loop_2545:
	sdivx	%i2,	0x0A97,	%o0
	fands	%f1,	%f2,	%f18
	movneg	%icc,	%o2,	%l1
loop_2546:
	array8	%i1,	%i6,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x3
	edge8n	%i5,	%g1,	%l4
	fbul,a	%fcc0,	loop_2547
	fmovsleu	%xcc,	%f6,	%f8
	movl	%icc,	%o3,	%o1
	sra	%o6,	%g7,	%i7
loop_2547:
	tsubcc	%o4,	0x03BD,	%l0
	movrlez	%g6,	0x13E,	%i0
	edge8l	%l2,	%g3,	%o5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%l6
	edge32	%i3,	%g2,	%i4
	orncc	%g5,	%g4,	%l5
	or	%o7,	0x0D93,	%i2
	nop
	set	0x38, %i4
	std	%f0,	[%l7 + %i4]
	edge8ln	%o0,	%o2,	%i1
	array16	%l1,	%i6,	%i5
	sdiv	%g1,	0x0546,	%l4
	bl,a,pt	%xcc,	loop_2548
	tpos	%xcc,	0x4
	xnorcc	%o3,	%o1,	%o6
	fzero	%f4
loop_2548:
	lduh	[%l7 + 0x10],	%l3
	fpadd32s	%f19,	%f4,	%f12
	tge	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f4,	%f12,	%f5
	fmovsl	%icc,	%f7,	%f15
	movcc	%icc,	%i7,	%g7
	tgu	%xcc,	0x3
	edge8ln	%l0,	%g6,	%i0
	fcmpeq32	%f6,	%f30,	%l2
	xorcc	%o4,	%o5,	%l6
	orncc	%g3,	%i3,	%i4
	fpadd16s	%f22,	%f12,	%f17
	fmovd	%f4,	%f8
	nop
	setx	loop_2549,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%g5,	%g2,	%l5
	fmovspos	%icc,	%f21,	%f5
	movrlez	%g4,	0x23F,	%o7
loop_2549:
	tpos	%icc,	0x5
	movrgez	%o0,	%o2,	%i2
	edge32	%l1,	%i1,	%i5
	set	0x0E, %i7
	ldsba	[%l7 + %i7] 0x19,	%i6
	movrgez	%l4,	0x25B,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%g0
	addc	%o1,	0x1D6B,	%l3
	fbule	%fcc0,	loop_2550
	movpos	%xcc,	%o6,	%i7
	membar	0x6F
	te	%xcc,	0x1
loop_2550:
	ta	%icc,	0x3
	fmovse	%xcc,	%f22,	%f20
	membar	0x45
	taddcc	%g7,	%l0,	%i0
	edge16n	%g6,	%l2,	%o4
	edge32n	%l6,	%o5,	%i3
	fbuge	%fcc2,	loop_2551
	orcc	%i4,	0x150F,	%g5
	brgez,a	%g3,	loop_2552
	sdiv	%l5,	0x1C12,	%g2
loop_2551:
	nop
	set	0x74, %g7
	ldsba	[%l7 + %g7] 0x11,	%g4
loop_2552:
	fmovscs	%icc,	%f17,	%f22
	movn	%icc,	%o7,	%o0
	set	0x5D, %i0
	stba	%i2,	[%l7 + %i0] 0xe3
	membar	#Sync
	sll	%o2,	%i1,	%i5
	edge16n	%i6,	%l4,	%o3
	brgez	%l1,	loop_2553
	srlx	%o1,	0x07,	%l3
	sra	%g1,	0x17,	%o6
	fcmpgt16	%f22,	%f28,	%g7
loop_2553:
	tne	%icc,	0x4
	ldsh	[%l7 + 0x5E],	%l0
	fandnot1	%f6,	%f22,	%f24
	tleu	%icc,	0x7
	sllx	%i7,	%g6,	%l2
	wr	%g0,	0x88,	%asi
	sta	%f23,	[%l7 + 0x64] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	%i0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i3,	0x1D,	%l6
	movrlz	%i4,	0x1AF,	%g5
	nop
	set	0x20, %o5
	std	%l4,	[%l7 + %o5]
	bcs,a	%icc,	loop_2554
	fors	%f4,	%f10,	%f16
	mulscc	%g3,	0x1218,	%g2
	edge16l	%o7,	%o0,	%i2
loop_2554:
	tsubcc	%g4,	0x1FB8,	%i1
	fba	%fcc3,	loop_2555
	tg	%xcc,	0x7
	brlz,a	%o2,	loop_2556
	fmovsle	%xcc,	%f22,	%f5
loop_2555:
	edge32n	%i5,	%l4,	%o3
	tge	%xcc,	0x4
loop_2556:
	stbar
	tl	%xcc,	0x3
	fpsub32s	%f10,	%f28,	%f2
	fmovrse	%l1,	%f16,	%f13
	movrlz	%o1,	%i6,	%l3
	smul	%o6,	%g1,	%l0
	edge8	%i7,	%g6,	%l2
	fblg,a	%fcc3,	loop_2557
	xorcc	%o4,	0x07F4,	%g7
	subc	%o5,	%i3,	%l6
	fmovrslez	%i0,	%f21,	%f28
loop_2557:
	nop
	setx	loop_2558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%i4,	%g5,	%g3
	fabsd	%f6,	%f14
	tg	%xcc,	0x7
loop_2558:
	sllx	%g2,	%l5,	%o0
	fxor	%f4,	%f14,	%f10
	fmovrdgz	%i2,	%f8,	%f0
	xorcc	%o7,	%i1,	%o2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g4
	sdivcc	%l4,	0x1006,	%o3
	fnot1	%f10,	%f28
	sub	%l1,	%i5,	%o1
	udiv	%i6,	0x1FD6,	%o6
	sir	0x0D08
	mova	%icc,	%l3,	%l0
	movne	%icc,	%g1,	%g6
	edge8ln	%i7,	%o4,	%l2
	movn	%xcc,	%g7,	%i3
	movrlez	%l6,	0x24F,	%i0
	or	%i4,	0x03D0,	%o5
	xorcc	%g3,	0x1AD7,	%g2
	tleu	%icc,	0x4
	sir	0x1AD8
	fmovrsgz	%g5,	%f14,	%f19
	fmovrdne	%l5,	%f14,	%f24
	fmovde	%icc,	%f28,	%f30
	edge32	%o0,	%i2,	%i1
	orn	%o2,	%o7,	%g4
	nop
	set	0x24, %l4
	ldsh	[%l7 + %l4],	%l4
	movg	%xcc,	%l1,	%o3
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x80,	%o1
	siam	0x0
	edge16ln	%i5,	%o6,	%i6
	xorcc	%l3,	0x05B0,	%l0
	udivx	%g6,	0x1C1E,	%g1
	tn	%icc,	0x5
	fmovrde	%i7,	%f10,	%f6
	subcc	%o4,	%g7,	%l2
	fbe	%fcc0,	loop_2559
	fbn	%fcc2,	loop_2560
	fandnot1	%f2,	%f4,	%f4
	edge32n	%l6,	%i0,	%i4
loop_2559:
	movcc	%xcc,	%o5,	%i3
loop_2560:
	umulcc	%g2,	0x0FB7,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	stda	%l4,	[%l7 + 0x68] %asi
	fnegd	%f0,	%f10
	fcmpne16	%f24,	%f0,	%o0
	fcmple16	%f30,	%f24,	%g5
	movrgz	%i1,	0x310,	%i2
	bn,a,pn	%icc,	loop_2561
	nop
	setx	loop_2562,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack16	%f14,	%f0
	tge	%icc,	0x2
loop_2561:
	subc	%o2,	0x0963,	%g4
loop_2562:
	andn	%l4,	%l1,	%o3
	set	0x08, %i3
	sta	%f27,	[%l7 + %i3] 0x11
	subcc	%o1,	%i5,	%o6
	movl	%icc,	%i6,	%o7
	std	%l2,	[%l7 + 0x08]
	edge16n	%l0,	%g6,	%i7
	ldsh	[%l7 + 0x62],	%g1
	brnz	%o4,	loop_2563
	ldd	[%l7 + 0x60],	%f4
	xnorcc	%g7,	%l6,	%l2
	movg	%xcc,	%i0,	%i4
loop_2563:
	fcmps	%fcc3,	%f9,	%f8
	subcc	%i3,	%g2,	%g3
	fsrc1s	%f11,	%f25
	movre	%l5,	%o5,	%o0
	movle	%xcc,	%g5,	%i1
	fpsub16s	%f29,	%f3,	%f27
	tle	%icc,	0x7
	srax	%i2,	0x18,	%o2
	brlz	%l4,	loop_2564
	sth	%l1,	[%l7 + 0x68]
	fmul8x16au	%f19,	%f4,	%f10
	movvs	%icc,	%g4,	%o1
loop_2564:
	udiv	%o3,	0x0382,	%i5
	sth	%i6,	[%l7 + 0x4A]
	movcs	%icc,	%o6,	%o7
	addcc	%l3,	0x197F,	%l0
	sra	%i7,	0x08,	%g1
	udiv	%g6,	0x0152,	%g7
	addc	%o4,	0x1756,	%l6
	fandnot2	%f28,	%f12,	%f18
	mova	%xcc,	%l2,	%i0
	movrgz	%i3,	0x238,	%i4
	xor	%g2,	%g3,	%o5
	fnors	%f19,	%f22,	%f27
	fmovdne	%xcc,	%f23,	%f21
	bcc	loop_2565
	smulcc	%o0,	0x1AB3,	%l5
	movneg	%xcc,	%g5,	%i1
	edge8	%i2,	%o2,	%l4
loop_2565:
	edge16n	%g4,	%o1,	%o3
	srax	%l1,	0x02,	%i5
	fmovdg	%icc,	%f29,	%f2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x68] %asi,	%f0
	tl	%icc,	0x7
	ldsw	[%l7 + 0x74],	%i6
	ldsh	[%l7 + 0x24],	%o7
	be	loop_2566
	sll	%o6,	%l0,	%i7
	xnorcc	%g1,	0x0A3D,	%g6
	edge32n	%l3,	%o4,	%l6
loop_2566:
	movvs	%xcc,	%g7,	%l2
	fbule,a	%fcc1,	loop_2567
	ldsb	[%l7 + 0x1B],	%i0
	fbl,a	%fcc3,	loop_2568
	fmovsgu	%icc,	%f21,	%f4
loop_2567:
	fmovd	%f22,	%f6
	and	%i3,	%g2,	%g3
loop_2568:
	xnor	%o5,	0x1177,	%i4
	edge32n	%o0,	%g5,	%i1
	bcs,pn	%icc,	loop_2569
	array8	%i2,	%l5,	%l4
	tpos	%icc,	0x7
	fmovsg	%icc,	%f14,	%f31
loop_2569:
	std	%o2,	[%l7 + 0x48]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g4,	%o3
	alignaddr	%o1,	%l1,	%i6
	ta	%xcc,	0x7
	smulcc	%i5,	0x1028,	%o7
	sethi	0x1020,	%l0
	popc	%o6,	%i7
	fmovsle	%icc,	%f26,	%f15
	movleu	%icc,	%g1,	%l3
	movrlz	%g6,	%o4,	%g7
	tcs	%xcc,	0x5
	movne	%xcc,	%l2,	%i0
	fbn	%fcc2,	loop_2570
	fnot2	%f0,	%f14
	fmovde	%xcc,	%f3,	%f17
	fbue,a	%fcc1,	loop_2571
loop_2570:
	call	loop_2572
	add	%i3,	0x0C57,	%l6
	edge16l	%g2,	%o5,	%g3
loop_2571:
	taddcctv	%i4,	0x0AD3,	%g5
loop_2572:
	fzeros	%f11
	tg	%icc,	0x1
	movl	%xcc,	%i1,	%o0
	fnegd	%f2,	%f14
	tcc	%xcc,	0x7
	srlx	%i2,	0x09,	%l4
	xnor	%o2,	%l5,	%g4
	fmovse	%xcc,	%f9,	%f15
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o1,	%o3
	ldd	[%l7 + 0x10],	%l0
	movn	%xcc,	%i5,	%o7
	srax	%i6,	0x02,	%l0
	tne	%icc,	0x5
	umulcc	%i7,	0x15BE,	%g1
	movcs	%icc,	%o6,	%l3
	umulcc	%g6,	%o4,	%g7
	edge16l	%l2,	%i3,	%i0
	te	%icc,	0x2
	ldsh	[%l7 + 0x38],	%g2
	std	%o4,	[%l7 + 0x68]
	sdivcc	%l6,	0x1DFA,	%g3
	brnz,a	%g5,	loop_2573
	tn	%icc,	0x7
	and	%i4,	%o0,	%i1
	movrgez	%i2,	%o2,	%l4
loop_2573:
	nop
	set	0x18, %i2
	lduha	[%l7 + %i2] 0x15,	%l5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%o1
	ta	%icc,	0x7
	call	loop_2574
	fmovsneg	%xcc,	%f24,	%f27
	xnorcc	%g4,	%l1,	%o3
	fmovdle	%icc,	%f9,	%f24
loop_2574:
	orcc	%o7,	%i5,	%l0
	fmul8x16	%f17,	%f20,	%f14
	te	%icc,	0x7
	stb	%i7,	[%l7 + 0x59]
	tn	%icc,	0x7
	movleu	%xcc,	%g1,	%o6
	addc	%l3,	0x17BF,	%g6
	fbl	%fcc0,	loop_2575
	fmovsneg	%icc,	%f20,	%f2
	movle	%icc,	%o4,	%g7
	sdivcc	%l2,	0x0BED,	%i6
loop_2575:
	sll	%i3,	0x16,	%g2
	bcc,a,pn	%xcc,	loop_2576
	bvs,a	%xcc,	loop_2577
	bl	loop_2578
	addcc	%o5,	0x0A52,	%l6
loop_2576:
	edge32l	%g3,	%i0,	%i4
loop_2577:
	nop
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x24,	%g4
loop_2578:
	edge32ln	%i1,	%i2,	%o2
	fmovrslz	%l4,	%f26,	%f21
	movg	%xcc,	%l5,	%o1
	edge8n	%g4,	%l1,	%o3
	ta	%xcc,	0x0
	membar	0x7B
	ba,pt	%icc,	loop_2579
	mulscc	%o7,	0x1560,	%o0
	bne	%icc,	loop_2580
	move	%xcc,	%l0,	%i7
loop_2579:
	tsubcctv	%g1,	%i5,	%l3
	popc	0x1616,	%g6
loop_2580:
	srl	%o4,	0x06,	%o6
	bne,pt	%xcc,	loop_2581
	tge	%icc,	0x5
	tle	%icc,	0x7
	tvs	%xcc,	0x1
loop_2581:
	fxnors	%f22,	%f3,	%f16
	fmovrsgz	%g7,	%f1,	%f21
	fble	%fcc1,	loop_2582
	orn	%i6,	0x16C1,	%i3
	subcc	%l2,	0x0ED4,	%g2
	bne	%xcc,	loop_2583
loop_2582:
	srlx	%l6,	0x14,	%g3
	tge	%icc,	0x7
	faligndata	%f20,	%f12,	%f8
loop_2583:
	ldx	[%l7 + 0x68],	%i0
	taddcctv	%i4,	%g5,	%i1
	fmul8x16al	%f19,	%f10,	%f6
	move	%xcc,	%o5,	%o2
	edge8	%l4,	%i2,	%l5
	subc	%g4,	%l1,	%o3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%o1
	tg	%icc,	0x2
	fbue	%fcc1,	loop_2584
	subccc	%o7,	0x0CEF,	%l0
	fpack16	%f14,	%f30
	xorcc	%i7,	%o0,	%i5
loop_2584:
	brlez	%g1,	loop_2585
	edge8n	%l3,	%g6,	%o4
	srax	%g7,	0x0D,	%i6
	movgu	%icc,	%o6,	%i3
loop_2585:
	nop
	set	0x7C, %l3
	sth	%g2,	[%l7 + %l3]
	movn	%xcc,	%l2,	%l6
	movvc	%xcc,	%i0,	%i4
	sir	0x155D
	movcs	%icc,	%g3,	%g5
	nop
	set	0x50, %l2
	lduh	[%l7 + %l2],	%i1
	fandnot1s	%f23,	%f0,	%f9
	membar	0x5A
	movne	%xcc,	%o2,	%o5
	andcc	%i2,	%l5,	%l4
	subc	%g4,	0x09FE,	%l1
	udivx	%o3,	0x1B48,	%o7
	fpmerge	%f12,	%f8,	%f16
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x51] %asi,	%l0
	bne,a	%icc,	loop_2586
	fmovrslez	%o1,	%f20,	%f0
	fmovrse	%i7,	%f4,	%f17
	for	%f22,	%f14,	%f6
loop_2586:
	fmovdneg	%icc,	%f18,	%f23
	brlez	%o0,	loop_2587
	stbar
	taddcctv	%i5,	0x1209,	%g1
	tvs	%xcc,	0x5
loop_2587:
	smul	%l3,	%g6,	%g7
	fmovdne	%icc,	%f12,	%f15
	edge8l	%o4,	%o6,	%i3
	prefetch	[%l7 + 0x60],	 0x0
	or	%i6,	0x044C,	%g2
	fandnot1	%f20,	%f2,	%f14
	sll	%l2,	%l6,	%i0
	movrlz	%g3,	%g5,	%i1
	edge8l	%i4,	%o5,	%o2
	orn	%i2,	0x0DD1,	%l5
	tvc	%icc,	0x6
	sdivx	%g4,	0x0655,	%l1
	fcmple32	%f16,	%f26,	%l4
	orn	%o3,	%l0,	%o1
	fmovsn	%icc,	%f14,	%f1
	bgu,a	loop_2588
	bn	%icc,	loop_2589
	tl	%xcc,	0x1
	bg,a	%icc,	loop_2590
loop_2588:
	tg	%icc,	0x1
loop_2589:
	xnor	%i7,	%o0,	%i5
	or	%o7,	%l3,	%g1
loop_2590:
	fornot1s	%f16,	%f4,	%f4
	subc	%g7,	0x0ADC,	%o4
	subcc	%o6,	%i3,	%g6
	ldd	[%l7 + 0x10],	%i6
	fmovdg	%icc,	%f30,	%f14
	edge32ln	%l2,	%g2,	%i0
	fpackfix	%f14,	%f27
	te	%icc,	0x0
	subccc	%l6,	%g5,	%i1
	and	%g3,	0x0F05,	%i4
	movre	%o2,	0x2D5,	%i2
	stx	%l5,	[%l7 + 0x68]
	edge32n	%g4,	%l1,	%o5
	orncc	%o3,	%l0,	%l4
	ldstub	[%l7 + 0x78],	%i7
	tvs	%icc,	0x4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%o0
	mulx	%o1,	%o7,	%l3
	movgu	%xcc,	%i5,	%g7
	subccc	%o4,	0x1665,	%o6
	fmul8x16au	%f14,	%f18,	%f2
	set	0x38, %i6
	stha	%i3,	[%l7 + %i6] 0x89
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f1,	%f5
	ta	%xcc,	0x7
	fandnot1	%f28,	%f6,	%f28
	movrlez	%g6,	0x1F3,	%g1
	edge8n	%l2,	%g2,	%i6
	subccc	%i0,	0x095A,	%l6
	fpmerge	%f17,	%f30,	%f0
	movleu	%icc,	%g5,	%g3
	add	%i4,	0x05C7,	%o2
	mova	%xcc,	%i2,	%l5
	faligndata	%f30,	%f14,	%f14
	xnor	%i1,	0x134A,	%l1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g4,	%o5
	wr	%g0,	0x19,	%asi
	stba	%l0,	[%l7 + 0x71] %asi
	tcc	%icc,	0x5
	be,pt	%icc,	loop_2591
	fmovrse	%o3,	%f0,	%f20
	sdivcc	%l4,	0x0C0B,	%i7
	udiv	%o1,	0x1303,	%o0
loop_2591:
	fbge,a	%fcc0,	loop_2592
	srax	%o7,	%i5,	%l3
	fbo	%fcc2,	loop_2593
	movcs	%icc,	%g7,	%o4
loop_2592:
	movrlz	%o6,	0x238,	%g6
	tsubcc	%i3,	%g1,	%l2
loop_2593:
	membar	0x1C
	addccc	%i6,	0x1864,	%i0
	tcc	%icc,	0x1
	fmovdcc	%xcc,	%f6,	%f15
	sub	%l6,	%g2,	%g3
	nop
	set	0x39, %o6
	ldub	[%l7 + %o6],	%i4
	popc	0x1DA8,	%o2
	edge16l	%g5,	%l5,	%i2
	addccc	%l1,	0x02BA,	%i1
	lduw	[%l7 + 0x48],	%g4
	fbg,a	%fcc2,	loop_2594
	ldd	[%l7 + 0x78],	%o4
	fmovsleu	%icc,	%f22,	%f20
	movrgz	%l0,	%l4,	%o3
loop_2594:
	tl	%xcc,	0x3
	alignaddr	%i7,	%o1,	%o7
	move	%xcc,	%i5,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a	%xcc,	loop_2595
	fandnot1	%f12,	%f0,	%f28
	fpadd32s	%f25,	%f20,	%f9
	addccc	%g7,	%o0,	%o4
loop_2595:
	fmuld8sux16	%f10,	%f9,	%f14
	subc	%o6,	0x0F93,	%i3
	bshuffle	%f26,	%f16,	%f12
	flush	%l7 + 0x7C
	brz	%g1,	loop_2596
	taddcctv	%l2,	0x1986,	%g6
	edge32	%i0,	%i6,	%g2
	movrlz	%l6,	0x06C,	%i4
loop_2596:
	edge32	%o2,	%g5,	%g3
	movrne	%i2,	0x384,	%l1
	movcc	%xcc,	%i1,	%l5
	movpos	%xcc,	%g4,	%o5
	orncc	%l4,	0x07AE,	%o3
	movg	%icc,	%i7,	%o1
	tn	%icc,	0x0
	fbge	%fcc2,	loop_2597
	umul	%l0,	0x1038,	%i5
	udivx	%l3,	0x08A0,	%o7
	taddcc	%g7,	%o4,	%o6
loop_2597:
	fbn	%fcc3,	loop_2598
	subcc	%o0,	%i3,	%l2
	fcmpgt32	%f28,	%f8,	%g1
	bneg,a	%xcc,	loop_2599
loop_2598:
	te	%icc,	0x2
	sll	%g6,	0x0B,	%i0
	ldd	[%l7 + 0x60],	%f6
loop_2599:
	edge32ln	%g2,	%l6,	%i6
	tneg	%icc,	0x7
	tl	%icc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o2,	%i4
	fmovrdlez	%g3,	%f10,	%f16
	edge8ln	%g5,	%l1,	%i1
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x54] %asi,	%f6
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i2,	0x0482,	%l5
	tn	%xcc,	0x3
	fpackfix	%f0,	%f18
	bneg	%xcc,	loop_2600
	movl	%icc,	%o5,	%l4
	bvs,a	loop_2601
	edge16	%g4,	%i7,	%o1
loop_2600:
	udivx	%o3,	0x11B6,	%l0
	tge	%xcc,	0x0
loop_2601:
	smul	%i5,	0x102B,	%o7
	fcmps	%fcc2,	%f23,	%f5
	array16	%l3,	%g7,	%o4
	fmovde	%xcc,	%f31,	%f7
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x11
	mulscc	%o0,	0x195E,	%o6
	taddcctv	%l2,	%g1,	%i3
	tne	%xcc,	0x0
	movgu	%xcc,	%g6,	%i0
	brz	%g2,	loop_2602
	movn	%icc,	%i6,	%l6
	bcs,pt	%xcc,	loop_2603
	subccc	%i4,	%g3,	%o2
loop_2602:
	fcmple32	%f16,	%f22,	%l1
	sdivx	%g5,	0x019E,	%i1
loop_2603:
	fpackfix	%f14,	%f17
	umulcc	%l5,	0x0835,	%o5
	tne	%xcc,	0x6
	srax	%i2,	%g4,	%l4
	edge16n	%o1,	%i7,	%o3
	sdiv	%i5,	0x178A,	%o7
	std	%f16,	[%l7 + 0x30]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l0,	%l3
	fpackfix	%f14,	%f6
	fpsub16s	%f29,	%f27,	%f7
	fmovrsne	%o4,	%f6,	%f21
	tcc	%xcc,	0x5
	movcc	%xcc,	%g7,	%o6
	fmovdgu	%xcc,	%f11,	%f17
	addccc	%l2,	0x0167,	%g1
	mova	%xcc,	%o0,	%g6
	tne	%icc,	0x4
	swap	[%l7 + 0x24],	%i3
	tpos	%icc,	0x3
	fbe,a	%fcc3,	loop_2604
	udiv	%i0,	0x0983,	%i6
	andncc	%g2,	%i4,	%l6
	edge16n	%g3,	%l1,	%o2
loop_2604:
	srlx	%i1,	0x0C,	%l5
	fmovrdlz	%g5,	%f6,	%f16
	set	0x18, %o4
	stha	%i2,	[%l7 + %o4] 0xe3
	membar	#Sync
	call	loop_2605
	smulcc	%g4,	%o5,	%o1
	xorcc	%i7,	0x0050,	%l4
	ldub	[%l7 + 0x76],	%o3
loop_2605:
	add	%i5,	0x09DA,	%l0
	sir	0x0AEC
	srl	%o7,	%l3,	%g7
	orcc	%o4,	0x07E6,	%o6
	array8	%g1,	%l2,	%g6
	movrne	%i3,	0x06D,	%o0
	movge	%xcc,	%i6,	%g2
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x19,	%i4
	addccc	%l6,	%g3,	%l1
	array8	%o2,	%i0,	%l5
	fbl,a	%fcc1,	loop_2606
	smulcc	%i1,	0x1F33,	%i2
	ta	%icc,	0x3
	fmovrsne	%g4,	%f20,	%f17
loop_2606:
	addc	%o5,	0x1035,	%g5
	andn	%o1,	0x1BA5,	%l4
	movleu	%xcc,	%i7,	%i5
	orcc	%l0,	%o3,	%o7
	movle	%xcc,	%l3,	%g7
	array8	%o4,	%o6,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x29, %i1
	ldsba	[%l7 + %i1] 0x89,	%g6
	ldub	[%l7 + 0x51],	%l2
	mulscc	%i3,	%o0,	%i6
	move	%icc,	%g2,	%i4
	set	0x68, %l1
	stwa	%g3,	[%l7 + %l1] 0x2a
	membar	#Sync
	or	%l6,	%o2,	%i0
	movrne	%l1,	0x369,	%l5
	fmovdleu	%xcc,	%f1,	%f6
	movvs	%icc,	%i2,	%g4
	fnot1	%f14,	%f18
	fpackfix	%f26,	%f30
	mulscc	%i1,	%o5,	%g5
	udivcc	%o1,	0x1F78,	%l4
	sethi	0x1076,	%i5
	or	%i7,	%o3,	%o7
	movn	%icc,	%l3,	%l0
	tn	%xcc,	0x1
	fbl,a	%fcc2,	loop_2607
	xor	%g7,	%o6,	%o4
	movcc	%xcc,	%g6,	%l2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x50] %asi,	%i3
loop_2607:
	tge	%xcc,	0x4
	fpsub32s	%f7,	%f23,	%f1
	edge16ln	%o0,	%i6,	%g1
	sth	%g2,	[%l7 + 0x38]
	bne	%icc,	loop_2608
	fmul8ulx16	%f4,	%f12,	%f4
	fornot1s	%f7,	%f1,	%f16
	edge8l	%g3,	%i4,	%o2
loop_2608:
	movleu	%xcc,	%l6,	%i0
	movrgz	%l5,	%i2,	%l1
	smulcc	%g4,	%i1,	%g5
	subc	%o5,	0x11A2,	%o1
	srax	%i5,	%l4,	%o3
	fcmpne32	%f26,	%f6,	%i7
	movgu	%icc,	%o7,	%l0
	fmovdne	%xcc,	%f17,	%f20
	edge32l	%g7,	%o6,	%o4
	fbg,a	%fcc3,	loop_2609
	and	%l3,	0x1E8D,	%l2
	movgu	%icc,	%i3,	%o0
	array8	%g6,	%g1,	%i6
loop_2609:
	tl	%xcc,	0x2
	fba	%fcc3,	loop_2610
	fmuld8sux16	%f10,	%f21,	%f16
	or	%g3,	%i4,	%o2
	brz,a	%l6,	loop_2611
loop_2610:
	edge16ln	%g2,	%l5,	%i0
	and	%l1,	%i2,	%g4
	fba,a	%fcc3,	loop_2612
loop_2611:
	tcs	%xcc,	0x0
	fxors	%f11,	%f8,	%f25
	fmovs	%f30,	%f7
loop_2612:
	movrgez	%i1,	%g5,	%o5
	fxors	%f16,	%f28,	%f21
	fmovrde	%o1,	%f8,	%f16
	tgu	%icc,	0x3
	orn	%l4,	0x0F71,	%o3
	set	0x57, %o2
	stba	%i5,	[%l7 + %o2] 0x27
	membar	#Sync
	fmovdle	%icc,	%f16,	%f15
	nop
	setx loop_2613, %l0, %l1
	jmpl %l1, %o7
	sdiv	%i7,	0x1999,	%g7
	movrgez	%o6,	0x011,	%o4
	tle	%icc,	0x5
loop_2613:
	fcmple16	%f8,	%f8,	%l3
	fpack16	%f14,	%f19
	sdivcc	%l2,	0x05DD,	%i3
	movle	%icc,	%o0,	%l0
	fmovsne	%icc,	%f20,	%f28
	mova	%icc,	%g1,	%i6
	fpack32	%f24,	%f20,	%f8
	orncc	%g3,	0x0713,	%i4
	taddcctv	%g6,	%l6,	%o2
	popc	0x1028,	%g2
	set	0x7C, %i5
	sta	%f25,	[%l7 + %i5] 0x15
	movrgez	%l5,	0x38D,	%l1
	fornot1s	%f3,	%f1,	%f23
	edge8l	%i0,	%i2,	%i1
	subccc	%g4,	%o5,	%g5
	edge16ln	%o1,	%l4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o7,	0x0909,	%i7
	tne	%icc,	0x4
	movl	%xcc,	%g7,	%i5
	alignaddr	%o6,	%l3,	%l2
	lduw	[%l7 + 0x10],	%o4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	movgu	%icc,	%i3,	%g1
	fba,a	%fcc3,	loop_2614
	array32	%i6,	%g3,	%i4
	edge32	%g6,	%l6,	%l0
	fmovrdlz	%g2,	%f2,	%f22
loop_2614:
	fandnot2s	%f8,	%f3,	%f28
	addccc	%o2,	0x0143,	%l1
	tg	%icc,	0x4
	movpos	%icc,	%i0,	%l5
	tleu	%xcc,	0x0
	ta	%icc,	0x3
	umulcc	%i1,	%g4,	%o5
	tcs	%xcc,	0x5
	edge32ln	%i2,	%o1,	%g5
	movpos	%icc,	%o3,	%l4
	fmovsn	%xcc,	%f31,	%f30
	tgu	%xcc,	0x3
	addcc	%i7,	0x1A41,	%g7
	edge16ln	%i5,	%o6,	%o7
	stb	%l3,	[%l7 + 0x19]
	fbug	%fcc2,	loop_2615
	nop
	setx	loop_2616,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%l2,	0x0750,	%o0
	edge16l	%o4,	%g1,	%i3
loop_2615:
	fexpand	%f14,	%f24
loop_2616:
	movrne	%i6,	0x2DF,	%i4
	fors	%f29,	%f17,	%f23
	te	%icc,	0x2
	te	%icc,	0x7
	fmuld8ulx16	%f2,	%f1,	%f12
	andcc	%g3,	%g6,	%l0
	fmul8x16	%f22,	%f10,	%f6
	wr	%g0,	0xea,	%asi
	stxa	%g2,	[%l7 + 0x10] %asi
	membar	#Sync
	mulx	%l6,	0x0DDD,	%l1
	tvc	%xcc,	0x2
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x54] %asi,	%o2
	tleu	%icc,	0x1
	fnegd	%f18,	%f10
	ble,a,pn	%xcc,	loop_2617
	edge32l	%i0,	%i1,	%g4
	edge8n	%o5,	%l5,	%o1
	udivx	%i2,	0x0C87,	%g5
loop_2617:
	fpadd32	%f8,	%f12,	%f18
	fmovdn	%xcc,	%f8,	%f6
	lduh	[%l7 + 0x52],	%o3
	fbuge,a	%fcc1,	loop_2618
	movgu	%icc,	%l4,	%i7
	fmovscs	%icc,	%f18,	%f25
	bcc,pn	%icc,	loop_2619
loop_2618:
	fmovda	%icc,	%f21,	%f25
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x11,	%i4
loop_2619:
	add	%o6,	0x123D,	%g7
	fbe	%fcc1,	loop_2620
	orcc	%o7,	0x1FF5,	%l2
	wr	%g0,	0x18,	%asi
	stda	%o0,	[%l7 + 0x38] %asi
loop_2620:
	fandnot2s	%f17,	%f15,	%f20
	lduw	[%l7 + 0x60],	%l3
	fmovsa	%icc,	%f14,	%f17
	movrne	%o4,	0x12D,	%i3
	and	%g1,	0x1802,	%i4
	udivx	%i6,	0x1E73,	%g6
	nop
	set	0x08, %o3
	stx	%l0,	[%l7 + %o3]
	fmovdn	%xcc,	%f12,	%f2
	edge8n	%g2,	%g3,	%l1
	fcmple32	%f18,	%f20,	%l6
	tvc	%icc,	0x0
	edge16l	%o2,	%i0,	%i1
	srax	%o5,	0x0E,	%l5
	addccc	%o1,	0x0922,	%i2
	orn	%g5,	%g4,	%l4
	tgu	%icc,	0x7
	fmovrdgez	%o3,	%f18,	%f8
	set	0x2E, %g1
	stha	%i5,	[%l7 + %g1] 0x0c
	ba,pn	%icc,	loop_2621
	movneg	%xcc,	%i7,	%o6
	fandnot1	%f30,	%f14,	%f26
	xnorcc	%g7,	%l2,	%o7
loop_2621:
	sub	%l3,	0x1438,	%o4
	movre	%i3,	0x2E6,	%o0
	sdivcc	%g1,	0x1198,	%i4
	movre	%g6,	0x0B2,	%i6
	fsrc1	%f20,	%f26
	udiv	%g2,	0x1C3F,	%g3
	fpadd32	%f14,	%f16,	%f28
	fmovsne	%xcc,	%f23,	%f6
	fbuge	%fcc2,	loop_2622
	movrgz	%l0,	0x001,	%l6
	fbule,a	%fcc0,	loop_2623
	membar	0x38
loop_2622:
	faligndata	%f12,	%f12,	%f24
	edge32ln	%l1,	%i0,	%i1
loop_2623:
	tleu	%icc,	0x5
	bgu	loop_2624
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x4
	ldd	[%l7 + 0x28],	%o2
loop_2624:
	edge32n	%l5,	%o1,	%i2
	tsubcctv	%o5,	0x0BDD,	%g4
	nop
	set	0x50, %g6
	prefetch	[%l7 + %g6],	 0x3
	tge	%xcc,	0x6
	movpos	%icc,	%l4,	%g5
	fnot1	%f16,	%f2
	tneg	%xcc,	0x5
	bvs,pn	%xcc,	loop_2625
	smul	%i5,	0x18E1,	%i7
	udivcc	%o6,	0x0DC6,	%g7
	fmovrdne	%o3,	%f22,	%f22
loop_2625:
	popc	%l2,	%l3
	fbue,a	%fcc2,	loop_2626
	ldsw	[%l7 + 0x34],	%o7
	nop
	setx	loop_2627,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%xcc,	%o4,	%i3
loop_2626:
	srax	%o0,	0x19,	%g1
	udivcc	%g6,	0x11BB,	%i6
loop_2627:
	bn	%icc,	loop_2628
	andncc	%g2,	%g3,	%i4
	add	%l0,	0x0A8D,	%l6
	fbug	%fcc0,	loop_2629
loop_2628:
	fnot2s	%f31,	%f20
	fpadd32	%f10,	%f20,	%f2
	tg	%xcc,	0x1
loop_2629:
	edge16n	%i0,	%i1,	%o2
	fone	%f12
	smulcc	%l1,	%l5,	%i2
	lduh	[%l7 + 0x5A],	%o5
	andncc	%o1,	%g4,	%l4
	fmovsg	%xcc,	%f20,	%f2
	taddcc	%g5,	0x013F,	%i7
	tsubcctv	%i5,	%o6,	%o3
	call	loop_2630
	movneg	%icc,	%g7,	%l2
	smul	%o7,	%o4,	%l3
	movrgz	%o0,	0x236,	%i3
loop_2630:
	stb	%g1,	[%l7 + 0x4E]
	be,pn	%xcc,	loop_2631
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f2,	%f22,	%f10
	and	%g6,	0x10EF,	%i6
loop_2631:
	fxnors	%f8,	%f16,	%f15
	sdiv	%g3,	0x1870,	%g2
	xorcc	%i4,	%l6,	%l0
	fmovsg	%icc,	%f18,	%f8
	fbue	%fcc0,	loop_2632
	addccc	%i1,	%o2,	%l1
	fands	%f11,	%f21,	%f4
	tne	%icc,	0x1
loop_2632:
	te	%xcc,	0x7
	edge32	%l5,	%i0,	%i2
	movvs	%xcc,	%o1,	%o5
	add	%l4,	%g5,	%i7
	tne	%xcc,	0x6
	fpmerge	%f0,	%f23,	%f26
	xor	%i5,	0x0AF2,	%o6
	fnands	%f8,	%f31,	%f1
	tne	%xcc,	0x0
	tge	%icc,	0x4
	mulscc	%g4,	%g7,	%l2
	fbu,a	%fcc1,	loop_2633
	popc	0x0EAD,	%o7
	fcmps	%fcc2,	%f16,	%f5
	sdiv	%o3,	0x0FB2,	%l3
loop_2633:
	fmovs	%f0,	%f2
	array32	%o4,	%o0,	%g1
	andn	%g6,	0x1959,	%i3
	movn	%icc,	%i6,	%g3
	nop
	setx loop_2634, %l0, %l1
	jmpl %l1, %g2
	lduw	[%l7 + 0x2C],	%l6
	fmovsne	%icc,	%f28,	%f8
	edge32l	%l0,	%i1,	%i4
loop_2634:
	movrlez	%l1,	%o2,	%l5
	tneg	%xcc,	0x7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%o1
	taddcctv	%o5,	%i0,	%l4
	movge	%icc,	%i7,	%i5
	te	%icc,	0x1
	bg	%xcc,	loop_2635
	fnot1	%f2,	%f24
	alignaddrl	%o6,	%g4,	%g5
	fbuge	%fcc1,	loop_2636
loop_2635:
	fbuge	%fcc1,	loop_2637
	movcs	%xcc,	%l2,	%g7
	sth	%o3,	[%l7 + 0x52]
loop_2636:
	edge8ln	%l3,	%o7,	%o4
loop_2637:
	move	%icc,	%o0,	%g6
	tn	%icc,	0x6
	xnor	%i3,	%g1,	%i6
	movrgz	%g3,	%l6,	%l0
	fpsub32s	%f16,	%f1,	%f22
	brlez,a	%i1,	loop_2638
	movrgz	%i4,	%g2,	%l1
	mulx	%o2,	%i2,	%o1
	st	%f14,	[%l7 + 0x14]
loop_2638:
	addccc	%l5,	%o5,	%i0
	umulcc	%i7,	0x120F,	%i5
	tvs	%icc,	0x2
	fmovsgu	%icc,	%f10,	%f12
	fbue,a	%fcc0,	loop_2639
	stw	%l4,	[%l7 + 0x78]
	tle	%xcc,	0x3
	fbl	%fcc0,	loop_2640
loop_2639:
	addccc	%g4,	%o6,	%g5
	fpadd16s	%f1,	%f27,	%f2
	fnegd	%f22,	%f28
loop_2640:
	sdivx	%g7,	0x1A39,	%l2
	fmovs	%f7,	%f12
	srlx	%o3,	0x09,	%l3
	and	%o7,	0x1F5E,	%o0
	ldx	[%l7 + 0x60],	%o4
	udivcc	%i3,	0x181E,	%g6
	edge8l	%i6,	%g3,	%l6
	tsubcctv	%l0,	%g1,	%i1
	taddcctv	%g2,	0x0EE6,	%l1
	tleu	%xcc,	0x4
	std	%f2,	[%l7 + 0x50]
	bgu	%xcc,	loop_2641
	fcmpgt16	%f10,	%f12,	%o2
	udivx	%i4,	0x0105,	%i2
	stw	%l5,	[%l7 + 0x50]
loop_2641:
	addc	%o5,	0x10D5,	%i0
	and	%o1,	0x0F8B,	%i5
	umul	%i7,	0x1C5B,	%l4
	tneg	%icc,	0x7
	sethi	0x1C6C,	%o6
	brlz,a	%g4,	loop_2642
	tsubcctv	%g5,	%g7,	%o3
	srl	%l3,	%o7,	%o0
	movrgz	%l2,	0x326,	%i3
loop_2642:
	sra	%g6,	%o4,	%i6
	edge8ln	%g3,	%l6,	%l0
	fba,a	%fcc0,	loop_2643
	add	%i1,	%g1,	%g2
	edge8	%l1,	%o2,	%i4
	edge32l	%i2,	%l5,	%o5
loop_2643:
	nop
	set	0x42, %l0
	stha	%i0,	[%l7 + %l0] 0x04
	fcmple16	%f12,	%f18,	%o1
	umul	%i5,	0x09D4,	%l4
	udivcc	%o6,	0x109D,	%g4
	stw	%i7,	[%l7 + 0x1C]
	fmovspos	%icc,	%f6,	%f9
	fmovde	%xcc,	%f11,	%f5
	tleu	%icc,	0x6
	fmovd	%f6,	%f16
	subc	%g7,	0x0C8E,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l3,	%o7,	%o0
	bge,a	loop_2644
	xor	%o3,	%i3,	%l2
	set	0x6A, %l5
	ldsha	[%l7 + %l5] 0x10,	%g6
loop_2644:
	stx	%o4,	[%l7 + 0x48]
	movleu	%xcc,	%g3,	%i6
	udivcc	%l0,	0x0A33,	%l6
	bgu,pn	%xcc,	loop_2645
	fbuge,a	%fcc2,	loop_2646
	ldsw	[%l7 + 0x18],	%i1
	array8	%g2,	%g1,	%o2
loop_2645:
	edge16n	%l1,	%i2,	%l5
loop_2646:
	tle	%icc,	0x7
	sir	0x013E
	fbu,a	%fcc3,	loop_2647
	fandnot2	%f12,	%f20,	%f30
	sir	0x1445
	edge32ln	%i4,	%i0,	%o5
loop_2647:
	nop
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x11,	 0x3
	tvs	%xcc,	0x2
	sra	%o1,	0x18,	%o6
	edge32l	%l4,	%g4,	%g7
	bvc	loop_2648
	sra	%i7,	0x01,	%l3
	movcc	%icc,	%g5,	%o7
	array16	%o3,	%i3,	%l2
loop_2648:
	subccc	%o0,	%o4,	%g3
	wr	%g0,	0x19,	%asi
	sta	%f24,	[%l7 + 0x38] %asi
	bleu,pn	%xcc,	loop_2649
	fcmpeq32	%f22,	%f14,	%i6
	popc	0x100E,	%l0
	umulcc	%g6,	0x1A60,	%l6
loop_2649:
	edge16ln	%i1,	%g2,	%g1
	movn	%icc,	%o2,	%i2
	add	%l5,	0x0C68,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l1,	%o5
	fmovdgu	%icc,	%f21,	%f11
	movcs	%icc,	%i0,	%o1
	movg	%xcc,	%i5,	%l4
	nop
	setx	loop_2650,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fones	%f18
	udivx	%g4,	0x0152,	%g7
	fmul8sux16	%f4,	%f18,	%f24
loop_2650:
	tcs	%xcc,	0x6
	movle	%xcc,	%o6,	%l3
	edge8n	%i7,	%o7,	%g5
	tne	%xcc,	0x4
	fmovdcs	%icc,	%f3,	%f23
	fmuld8ulx16	%f24,	%f3,	%f0
	fpsub32	%f28,	%f2,	%f2
	fmovrsgz	%o3,	%f16,	%f21
	xorcc	%l2,	0x15C9,	%o0
	fmovrse	%i3,	%f18,	%f5
	edge16	%o4,	%g3,	%l0
	ldsw	[%l7 + 0x24],	%i6
	fpadd32s	%f3,	%f1,	%f22
	call	loop_2651
	sllx	%g6,	0x00,	%i1
	fpadd32s	%f8,	%f11,	%f31
	andn	%g2,	%l6,	%o2
loop_2651:
	xnorcc	%i2,	%l5,	%i4
	tcs	%xcc,	0x0
	smul	%g1,	%l1,	%i0
	and	%o1,	%o5,	%l4
	orn	%i5,	%g7,	%o6
	set	0x7C, %l6
	stwa	%g4,	[%l7 + %l6] 0x2f
	membar	#Sync
	fpsub16	%f26,	%f8,	%f8
	ldd	[%l7 + 0x70],	%i6
	smul	%o7,	0x1BF8,	%g5
	bpos,a,pt	%icc,	loop_2652
	movcc	%icc,	%l3,	%o3
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x15,	%l2
loop_2652:
	popc	%i3,	%o0
	fbul,a	%fcc3,	loop_2653
	movneg	%icc,	%o4,	%l0
	udivcc	%i6,	0x067C,	%g3
	edge8	%g6,	%g2,	%i1
loop_2653:
	nop
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x11
	array32	%l6,	%i2,	%o2
	sir	0x04A0
	movg	%icc,	%l5,	%i4
	xnorcc	%g1,	%i0,	%l1
	tcs	%icc,	0x0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16ln	%o1,	%o5,	%l4
	udiv	%g7,	0x1065,	%i5
	edge8l	%g4,	%i7,	%o6
	ba,a	loop_2654
	orn	%o7,	%g5,	%l3
	bvs,a,pt	%icc,	loop_2655
	fmovrslz	%o3,	%f6,	%f16
loop_2654:
	orncc	%i3,	0x17D1,	%l2
	fbn,a	%fcc1,	loop_2656
loop_2655:
	xor	%o4,	%o0,	%i6
	fexpand	%f17,	%f2
	faligndata	%f14,	%f8,	%f14
loop_2656:
	fnegs	%f19,	%f20
	movcc	%xcc,	%l0,	%g3
	fsrc1	%f12,	%f28
	bge	loop_2657
	fzeros	%f26
	tn	%xcc,	0x5
	fornot1	%f8,	%f4,	%f24
loop_2657:
	movge	%icc,	%g2,	%g6
	edge16n	%i1,	%i2,	%l6
	wr	%g0,	0x57,	%asi
	stxa	%l5,	[%g0 + 0x0] %asi
	sllx	%i4,	0x06,	%o2
	movvs	%icc,	%g1,	%i0
	call	loop_2658
	tgu	%icc,	0x4
	movge	%icc,	%o1,	%o5
	fbue,a	%fcc2,	loop_2659
loop_2658:
	be,pn	%icc,	loop_2660
	edge16ln	%l4,	%l1,	%g7
	set	0x208, %g7
	ldxa	[%g0 + %g7] 0x52,	%i5
loop_2659:
	smul	%i7,	%g4,	%o7
loop_2660:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc2,	loop_2661
	fzeros	%f25
	edge16n	%g5,	%o6,	%o3
	andn	%i3,	%l2,	%l3
loop_2661:
	nop
	set	0x28, %i7
	stx	%o0,	[%l7 + %i7]
	fmovs	%f9,	%f27
	fmovrslez	%o4,	%f25,	%f5
	edge16n	%i6,	%l0,	%g2
	array32	%g6,	%i1,	%g3
	fbne,a	%fcc0,	loop_2662
	andncc	%l6,	%i2,	%i4
	alignaddr	%o2,	%l5,	%g1
	fmovsge	%icc,	%f16,	%f2
loop_2662:
	bcc,pn	%xcc,	loop_2663
	fsrc2s	%f7,	%f20
	set	0x0A, %i0
	ldsba	[%l7 + %i0] 0x11,	%i0
loop_2663:
	sub	%o1,	%l4,	%o5
	tcs	%xcc,	0x7
	edge32	%l1,	%i5,	%i7
	addccc	%g7,	0x07EA,	%o7
	addc	%g4,	%o6,	%o3
	movneg	%xcc,	%i3,	%g5
	fors	%f18,	%f13,	%f4
	wr	%g0,	0x80,	%asi
	sta	%f31,	[%l7 + 0x08] %asi
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f16
	fmuld8ulx16	%f28,	%f29,	%f14
	fcmpne32	%f16,	%f6,	%l3
	fsrc1	%f30,	%f2
	fmovdleu	%icc,	%f6,	%f7
	fmovrdgz	%l2,	%f12,	%f4
	tpos	%xcc,	0x0
	fmuld8sux16	%f18,	%f6,	%f12
	addccc	%o4,	%i6,	%l0
	mulx	%g2,	0x180E,	%o0
	edge32l	%g6,	%g3,	%l6
	wr	%g0,	0x88,	%asi
	sta	%f19,	[%l7 + 0x38] %asi
	fmul8ulx16	%f4,	%f6,	%f16
	membar	0x22
	nop
	setx loop_2664, %l0, %l1
	jmpl %l1, %i1
	xnorcc	%i2,	0x0CC0,	%i4
	fornot2	%f14,	%f2,	%f12
	fandnot2	%f12,	%f30,	%f2
loop_2664:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x1C] %asi,	%l5
	movrgz	%g1,	0x2E7,	%i0
	sdivcc	%o1,	0x1EB7,	%o2
	movcc	%xcc,	%l4,	%l1
	edge8n	%i5,	%i7,	%g7
	tsubcc	%o5,	%o7,	%o6
	fmul8sux16	%f6,	%f0,	%f8
	edge32l	%g4,	%i3,	%o3
	fmovrdgz	%g5,	%f18,	%f2
	movvs	%icc,	%l3,	%o4
	fnot1s	%f10,	%f15
	ldsw	[%l7 + 0x30],	%l2
	brz	%l0,	loop_2665
	movpos	%xcc,	%g2,	%o0
	fpsub16	%f18,	%f0,	%f14
	srl	%g6,	%i6,	%l6
loop_2665:
	fbuge,a	%fcc1,	loop_2666
	tsubcctv	%g3,	%i1,	%i2
	movge	%icc,	%l5,	%i4
	bge,a,pt	%icc,	loop_2667
loop_2666:
	bleu,a,pn	%xcc,	loop_2668
	membar	0x07
	movg	%icc,	%g1,	%o1
loop_2667:
	sdiv	%i0,	0x1A49,	%l4
loop_2668:
	subccc	%o2,	%i5,	%l1
	nop
	setx	loop_2669,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%xcc,	0x6
	ta	%icc,	0x3
	edge8n	%i7,	%o5,	%o7
loop_2669:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g7
	movcs	%xcc,	%g4,	%o6
	tcs	%xcc,	0x6
	tg	%xcc,	0x2
	orn	%o3,	0x06B4,	%g5
	movrlez	%l3,	%i3,	%o4
	andncc	%l2,	%l0,	%o0
	edge32ln	%g2,	%g6,	%l6
	addccc	%g3,	%i6,	%i2
	add	%i1,	0x1955,	%l5
	movrgz	%g1,	0x3B3,	%o1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i0
	smulcc	%i4,	%o2,	%i5
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%l1
	andcc	%l4,	0x03C9,	%i7
	edge16	%o5,	%g7,	%g4
	movle	%icc,	%o6,	%o7
	tneg	%xcc,	0x4
	tvs	%xcc,	0x4
	srax	%o3,	0x0F,	%g5
	sethi	0x1B6D,	%l3
	alignaddr	%o4,	%l2,	%l0
	fbge,a	%fcc1,	loop_2670
	tcc	%icc,	0x3
	edge8ln	%o0,	%i3,	%g2
	stw	%g6,	[%l7 + 0x2C]
loop_2670:
	movrlz	%l6,	0x07F,	%i6
	edge32ln	%i2,	%i1,	%g3
	fmovrdgez	%l5,	%f30,	%f20
	srlx	%o1,	0x1C,	%g1
	movge	%icc,	%i0,	%i4
	ld	[%l7 + 0x08],	%f26
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xe3,	%i4
	subccc	%o2,	%l4,	%i7
	flush	%l7 + 0x74
	fands	%f6,	%f7,	%f31
	srlx	%l1,	0x0A,	%o5
	tsubcctv	%g7,	%o6,	%g4
	set	0x38, %i3
	ldxa	[%g0 + %i3] 0x4f,	%o3
	edge32l	%g5,	%l3,	%o7
	brgez	%l2,	loop_2671
	tge	%xcc,	0x5
	taddcc	%o4,	%o0,	%i3
	fmovdne	%xcc,	%f9,	%f20
loop_2671:
	movge	%xcc,	%g2,	%g6
	ldsw	[%l7 + 0x78],	%l0
	move	%xcc,	%i6,	%i2
	edge8n	%l6,	%i1,	%l5
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g3
	xnor	%o1,	%g1,	%i4
	movleu	%xcc,	%i5,	%o2
	ldd	[%l7 + 0x40],	%i0
	bne,a,pn	%icc,	loop_2672
	xor	%i7,	%l1,	%o5
	fmovrslz	%g7,	%f21,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2672:
	fmovsl	%icc,	%f5,	%f19
	edge32	%o6,	%l4,	%g4
	edge8n	%g5,	%l3,	%o3
	movge	%xcc,	%o7,	%o4
	tne	%xcc,	0x1
	tpos	%xcc,	0x2
	edge32ln	%o0,	%i3,	%l2
	movrgez	%g6,	0x2BB,	%l0
	fpadd16	%f18,	%f28,	%f8
	set	0x24, %o0
	sta	%f11,	[%l7 + %o0] 0x19
	nop
	setx	loop_2673,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue	%fcc1,	loop_2674
	fmovrsgez	%g2,	%f11,	%f10
	movrlez	%i2,	%i6,	%l6
loop_2673:
	nop
	set	0x52, %o1
	ldstub	[%l7 + %o1],	%i1
loop_2674:
	addccc	%l5,	%g3,	%o1
	bg,pn	%xcc,	loop_2675
	nop
	setx	loop_2676,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%icc,	%g1,	%i5
	andn	%i4,	%i0,	%o2
loop_2675:
	nop
	setx	loop_2677,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2676:
	tvs	%icc,	0x5
	movcs	%icc,	%l1,	%o5
	xor	%i7,	%o6,	%g7
loop_2677:
	brgez,a	%g4,	loop_2678
	tvs	%xcc,	0x4
	fbge	%fcc0,	loop_2679
	fnot2	%f24,	%f10
loop_2678:
	for	%f0,	%f0,	%f12
	alignaddr	%g5,	%l3,	%o3
loop_2679:
	fcmpeq16	%f28,	%f18,	%o7
	sir	0x0ECB
	stbar
	fcmps	%fcc3,	%f17,	%f11
	tl	%icc,	0x0
	udivx	%o4,	0x1184,	%o0
	sdivcc	%i3,	0x0CDC,	%l4
	addcc	%l2,	0x05DF,	%g6
	fcmpd	%fcc0,	%f6,	%f28
	fpadd32s	%f13,	%f19,	%f9
	bne,a,pt	%icc,	loop_2680
	movge	%xcc,	%g2,	%l0
	movrgz	%i2,	%l6,	%i6
	tle	%icc,	0x6
loop_2680:
	movne	%xcc,	%i1,	%g3
	membar	0x07
	fmovrde	%o1,	%f0,	%f14
	fpsub16s	%f15,	%f6,	%f11
	fmovdne	%xcc,	%f4,	%f13
	fbge	%fcc2,	loop_2681
	movne	%icc,	%g1,	%l5
	sra	%i5,	%i0,	%o2
	fandnot2	%f20,	%f8,	%f16
loop_2681:
	tle	%icc,	0x5
	tleu	%icc,	0x2
	fmovdne	%xcc,	%f17,	%f25
	movrgz	%i4,	0x306,	%l1
	stx	%o5,	[%l7 + 0x20]
	movrlez	%o6,	%i7,	%g4
	srl	%g5,	0x0F,	%l3
	nop
	set	0x38, %i2
	std	%f10,	[%l7 + %i2]
	fmovrsgez	%g7,	%f30,	%f11
	addc	%o3,	0x09A4,	%o7
	sub	%o0,	%o4,	%l4
	udivx	%i3,	0x0233,	%g6
	orcc	%l2,	0x0AA7,	%g2
	wr	%g0,	0x2f,	%asi
	stda	%l0,	[%l7 + 0x60] %asi
	membar	#Sync
	movn	%icc,	%i2,	%i6
	tgu	%xcc,	0x6
	fcmpd	%fcc3,	%f2,	%f30
	addccc	%l6,	%i1,	%g3
	tsubcc	%o1,	%l5,	%g1
	fblg,a	%fcc3,	loop_2682
	xor	%i5,	0x1E2F,	%o2
	bcs	%xcc,	loop_2683
	move	%icc,	%i0,	%l1
loop_2682:
	edge8n	%i4,	%o5,	%o6
	bvs	loop_2684
loop_2683:
	ta	%icc,	0x3
	tle	%icc,	0x1
	ldsb	[%l7 + 0x75],	%i7
loop_2684:
	fornot2	%f18,	%f28,	%f30
	srlx	%g5,	0x1E,	%g4
	orn	%l3,	%g7,	%o3
	ta	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o0,	0x0A9F,	%o4
	bg,pn	%icc,	loop_2685
	movgu	%xcc,	%l4,	%o7
	bneg,pt	%xcc,	loop_2686
	mulscc	%i3,	0x0867,	%l2
loop_2685:
	brnz,a	%g2,	loop_2687
	smulcc	%l0,	%i2,	%i6
loop_2686:
	udiv	%l6,	0x1382,	%i1
	ta	%xcc,	0x6
loop_2687:
	fnegd	%f16,	%f12
	edge8	%g3,	%g6,	%o1
	movleu	%icc,	%g1,	%l5
	movcs	%icc,	%o2,	%i0
	movneg	%xcc,	%l1,	%i5
	movpos	%xcc,	%o5,	%o6
	movge	%xcc,	%i4,	%i7
	movle	%xcc,	%g5,	%l3
	sra	%g4,	0x1D,	%o3
	siam	0x0
	movle	%xcc,	%o0,	%g7
	udivx	%o4,	0x0B94,	%o7
	edge8	%l4,	%i3,	%g2
	fmovdn	%xcc,	%f10,	%f10
	movcs	%icc,	%l0,	%l2
	set	0x50, %l3
	ldda	[%l7 + %l3] 0xe2,	%i2
	fsrc1	%f12,	%f14
	movle	%xcc,	%l6,	%i6
	te	%icc,	0x0
	taddcc	%g3,	0x0CE6,	%g6
	sdiv	%o1,	0x16CF,	%i1
	fmovsvc	%icc,	%f25,	%f28
	movl	%xcc,	%g1,	%o2
	fmovsvs	%icc,	%f20,	%f10
	fmul8x16	%f31,	%f8,	%f4
	edge32n	%i0,	%l1,	%i5
	tne	%xcc,	0x1
	tne	%icc,	0x1
	tpos	%icc,	0x7
	movrne	%o5,	%o6,	%i4
	popc	0x0C6C,	%i7
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%g5
	movneg	%icc,	%l3,	%g4
	edge32	%l5,	%o3,	%o0
	fbg	%fcc2,	loop_2688
	bgu,pn	%xcc,	loop_2689
	nop
	setx	loop_2690,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlez	%g7,	0x380,	%o7
loop_2688:
	movrgz	%o4,	%i3,	%g2
loop_2689:
	movleu	%xcc,	%l0,	%l4
loop_2690:
	fbl	%fcc0,	loop_2691
	fbge,a	%fcc2,	loop_2692
	srl	%l2,	0x01,	%i2
	fmovrsgez	%l6,	%f24,	%f22
loop_2691:
	sdivcc	%g3,	0x0E88,	%i6
loop_2692:
	tpos	%xcc,	0x3
	stw	%o1,	[%l7 + 0x08]
	orcc	%g6,	%g1,	%o2
	movneg	%icc,	%i0,	%i1
	mova	%icc,	%i5,	%l1
	andncc	%o6,	%i4,	%i7
	subc	%g5,	%l3,	%g4
	movrlez	%o5,	0x3A9,	%l5
	taddcctv	%o0,	0x020D,	%g7
	mulx	%o7,	%o4,	%o3
	tl	%icc,	0x6
	std	%f8,	[%l7 + 0x68]
	edge16	%i3,	%l0,	%l4
	array8	%l2,	%i2,	%l6
	std	%g2,	[%l7 + 0x68]
	udivcc	%g3,	0x0DC3,	%i6
	fmul8ulx16	%f26,	%f20,	%f28
	wr	%g0,	0x4f,	%asi
	stxa	%g6,	[%g0 + 0x28] %asi
	tne	%icc,	0x2
	bgu	loop_2693
	movrgez	%o1,	0x2C8,	%o2
	movrgz	%i0,	%i1,	%g1
	fone	%f20
loop_2693:
	fnegs	%f17,	%f5
	xnorcc	%i5,	%o6,	%l1
	fmovda	%icc,	%f29,	%f18
	nop
	set	0x17, %i6
	ldsb	[%l7 + %i6],	%i7
	taddcctv	%g5,	0x099D,	%i4
	orncc	%g4,	%o5,	%l3
	brz	%o0,	loop_2694
	movn	%icc,	%g7,	%l5
	umul	%o7,	%o4,	%o3
	movle	%xcc,	%i3,	%l0
loop_2694:
	tgu	%xcc,	0x7
	fbne,a	%fcc1,	loop_2695
	ldub	[%l7 + 0x13],	%l4
	wr	%g0,	0x81,	%asi
	stwa	%i2,	[%l7 + 0x6C] %asi
loop_2695:
	udivx	%l6,	0x0372,	%l2
	mova	%icc,	%g3,	%g2
	bgu,pt	%xcc,	loop_2696
	fmovsn	%xcc,	%f23,	%f31
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%i6
loop_2696:
	movn	%xcc,	%g6,	%o1
	fandnot1s	%f14,	%f10,	%f19
	movle	%icc,	%i0,	%o2
	fmovrdgz	%i1,	%f14,	%f0
	smulcc	%g1,	%o6,	%l1
	array32	%i5,	%i7,	%i4
	subccc	%g4,	%o5,	%l3
	tsubcc	%o0,	%g5,	%l5
	addc	%g7,	0x18BB,	%o4
	sra	%o7,	0x17,	%i3
	or	%l0,	%l4,	%o3
	tvc	%icc,	0x4
	stb	%l6,	[%l7 + 0x0B]
	fmovdgu	%icc,	%f10,	%f5
	sub	%i2,	0x05D0,	%l2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	fmovdge	%icc,	%f17,	%f8
	movrlez	%g2,	0x1AD,	%g3
	fornot2s	%f20,	%f25,	%f2
	ble	%xcc,	loop_2697
	fone	%f6
	ble,pt	%icc,	loop_2698
	fmovdne	%icc,	%f15,	%f4
loop_2697:
	fnand	%f0,	%f16,	%f16
	brgez,a	%i6,	loop_2699
loop_2698:
	sir	0x0710
	movrgez	%o1,	0x09C,	%g6
	array32	%o2,	%i1,	%i0
loop_2699:
	tl	%xcc,	0x3
	fornot2	%f22,	%f24,	%f4
	bvc,a	loop_2700
	fones	%f3
	movcs	%icc,	%g1,	%o6
	movn	%xcc,	%i5,	%i7
loop_2700:
	nop
	set	0x64, %o4
	stwa	%i4,	[%l7 + %o4] 0x22
	membar	#Sync
	alignaddrl	%l1,	%o5,	%g4
	fblg,a	%fcc3,	loop_2701
	umul	%o0,	0x144E,	%l3
	fmovsa	%xcc,	%f22,	%f3
	tne	%xcc,	0x0
loop_2701:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x08] %asi,	%l5
	fmovsge	%icc,	%f26,	%f7
	fpadd16s	%f6,	%f25,	%f9
	st	%f11,	[%l7 + 0x44]
	fbuge	%fcc0,	loop_2702
	movgu	%icc,	%g5,	%g7
	nop
	set	0x08, %o7
	ldsb	[%l7 + %o7],	%o7
	movneg	%icc,	%i3,	%l0
loop_2702:
	movn	%xcc,	%o4,	%l4
	srax	%l6,	%o3,	%i2
	fones	%f9
	movpos	%icc,	%l2,	%g2
	movgu	%icc,	%i6,	%o1
	umul	%g6,	%o2,	%i1
	xnorcc	%i0,	%g3,	%o6
	subccc	%i5,	%i7,	%i4
	bpos,a,pn	%xcc,	loop_2703
	sra	%g1,	0x0E,	%l1
	edge8l	%g4,	%o0,	%o5
	fxor	%f0,	%f14,	%f16
loop_2703:
	and	%l5,	%g5,	%g7
	brlez	%o7,	loop_2704
	tne	%icc,	0x6
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x10,	 0x1
loop_2704:
	edge8	%i3,	%o4,	%l4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x45] %asi,	%l0
	edge8l	%l6,	%i2,	%o3
	smulcc	%l2,	0x0ABB,	%g2
	sll	%o1,	0x0B,	%g6
	edge16l	%i6,	%o2,	%i1
	tcs	%icc,	0x6
	brgz	%g3,	loop_2705
	fnot2s	%f6,	%f26
	edge16ln	%o6,	%i5,	%i7
	fmovdneg	%icc,	%f21,	%f8
loop_2705:
	bcs,a	loop_2706
	tcs	%xcc,	0x1
	fnand	%f10,	%f14,	%f26
	xor	%i4,	%g1,	%i0
loop_2706:
	movrne	%l1,	%o0,	%g4
	fmovdg	%xcc,	%f6,	%f27
	fmovs	%f9,	%f15
	array32	%o5,	%g5,	%l5
	fnor	%f18,	%f6,	%f22
	fpack32	%f20,	%f0,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o7,	%g7
	bvc,pn	%icc,	loop_2707
	sethi	0x0E59,	%i3
	fmovdl	%xcc,	%f31,	%f3
	set	0x5C, %l1
	sta	%f2,	[%l7 + %l1] 0x81
loop_2707:
	udiv	%l3,	0x07E3,	%l4
	brgez,a	%l0,	loop_2708
	umulcc	%o4,	0x0252,	%l6
	fbg	%fcc2,	loop_2709
	tle	%icc,	0x2
loop_2708:
	tsubcc	%o3,	%l2,	%g2
	andncc	%i2,	%o1,	%i6
loop_2709:
	call	loop_2710
	bshuffle	%f4,	%f8,	%f16
	te	%icc,	0x3
	fmovrdlez	%o2,	%f30,	%f0
loop_2710:
	movn	%xcc,	%g6,	%i1
	fandnot1s	%f21,	%f4,	%f23
	or	%g3,	0x1A7C,	%i5
	or	%i7,	%i4,	%o6
	edge32	%g1,	%i0,	%o0
	udivcc	%l1,	0x0330,	%g4
	edge8	%g5,	%o5,	%o7
	or	%l5,	%i3,	%g7
	array32	%l4,	%l0,	%l3
	bpos	loop_2711
	movl	%xcc,	%o4,	%o3
	wr	%g0,	0xe3,	%asi
	stwa	%l2,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_2711:
	fmovse	%xcc,	%f25,	%f17
	movge	%xcc,	%g2,	%l6
	membar	0x28
	sub	%i2,	0x055C,	%o1
	xor	%i6,	%o2,	%i1
	bcs,a,pn	%icc,	loop_2712
	sra	%g6,	%g3,	%i5
	addc	%i7,	0x0116,	%i4
	andcc	%o6,	%i0,	%g1
loop_2712:
	mulscc	%l1,	%o0,	%g4
	fbe	%fcc3,	loop_2713
	subccc	%g5,	%o5,	%o7
	bn,pn	%xcc,	loop_2714
	movgu	%icc,	%i3,	%g7
loop_2713:
	fpadd16	%f16,	%f30,	%f18
	bne,a,pn	%icc,	loop_2715
loop_2714:
	edge32l	%l4,	%l5,	%l3
	sub	%o4,	%l0,	%l2
	fmovspos	%icc,	%f31,	%f18
loop_2715:
	umulcc	%g2,	0x0081,	%l6
	smulcc	%i2,	%o3,	%o1
	fmovsge	%xcc,	%f0,	%f2
	umulcc	%o2,	%i1,	%i6
	add	%g3,	0x1E2D,	%i5
	fcmple16	%f28,	%f30,	%i7
	orn	%g6,	%i4,	%o6
	umulcc	%i0,	0x0444,	%l1
	fmovdpos	%xcc,	%f17,	%f3
	tl	%xcc,	0x6
	movvc	%xcc,	%g1,	%o0
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g5
	mulx	%g4,	0x1E3C,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x28, %i1
	ldsw	[%l7 + %i1],	%i3
	edge16ln	%o7,	%l4,	%g7
	fmovrdne	%l5,	%f14,	%f18
	movleu	%icc,	%l3,	%o4
	tpos	%xcc,	0x7
	orcc	%l2,	%g2,	%l6
	lduh	[%l7 + 0x38],	%i2
	smulcc	%l0,	%o3,	%o2
	fmul8sux16	%f16,	%f22,	%f18
	array32	%o1,	%i1,	%g3
	fbl,a	%fcc3,	loop_2716
	bge,a	%xcc,	loop_2717
	taddcctv	%i6,	0x1309,	%i5
	udiv	%i7,	0x023E,	%i4
loop_2716:
	fmovscs	%icc,	%f0,	%f0
loop_2717:
	movpos	%xcc,	%o6,	%i0
	mulscc	%g6,	0x0008,	%l1
	wr	%g0,	0x80,	%asi
	stwa	%o0,	[%l7 + 0x24] %asi
	subcc	%g1,	0x0F6E,	%g5
	sllx	%o5,	%g4,	%i3
	move	%icc,	%l4,	%g7
	alignaddrl	%o7,	%l3,	%o4
	set	0x22, %o2
	lduba	[%l7 + %o2] 0x04,	%l5
	movge	%icc,	%g2,	%l6
	taddcctv	%l2,	0x012F,	%i2
	edge16l	%o3,	%l0,	%o1
	orcc	%i1,	0x1E92,	%o2
	edge32ln	%i6,	%i5,	%g3
	movne	%icc,	%i7,	%o6
	edge16n	%i4,	%g6,	%l1
	srl	%i0,	%g1,	%o0
	udivcc	%g5,	0x1C28,	%g4
	fbl,a	%fcc0,	loop_2718
	fcmple32	%f12,	%f28,	%o5
	srax	%l4,	0x13,	%g7
	ba,a,pn	%icc,	loop_2719
loop_2718:
	sdivx	%o7,	0x09CE,	%l3
	fand	%f12,	%f22,	%f28
	udiv	%i3,	0x13AC,	%o4
loop_2719:
	xnor	%l5,	%l6,	%g2
	fands	%f11,	%f3,	%f6
	ldstub	[%l7 + 0x6A],	%i2
	xor	%o3,	0x013F,	%l2
	sir	0x0D0F
	tpos	%xcc,	0x5
	fexpand	%f10,	%f24
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l0,	%i1
	fandnot1s	%f7,	%f31,	%f21
	bge	loop_2720
	fxnor	%f16,	%f2,	%f2
	fmul8x16	%f0,	%f20,	%f8
	fpsub32	%f4,	%f18,	%f6
loop_2720:
	fandnot2	%f16,	%f18,	%f20
	tcs	%xcc,	0x1
	brgez	%o2,	loop_2721
	tneg	%icc,	0x7
	array16	%i6,	%o1,	%i5
	fmuld8sux16	%f28,	%f18,	%f10
loop_2721:
	te	%icc,	0x1
	fbue	%fcc0,	loop_2722
	fmovscs	%icc,	%f9,	%f30
	andcc	%g3,	0x13A7,	%o6
	stbar
loop_2722:
	array16	%i7,	%g6,	%i4
	edge8ln	%l1,	%g1,	%o0
	set	0x1F, %g5
	ldsba	[%l7 + %g5] 0x10,	%i0
	edge16	%g4,	%o5,	%l4
	fabsd	%f6,	%f18
	sethi	0x0658,	%g5
	or	%g7,	%o7,	%l3
	xnor	%o4,	%i3,	%l5
	lduw	[%l7 + 0x24],	%g2
	subccc	%i2,	0x1677,	%l6
	sllx	%l2,	%l0,	%o3
	set	0x18, %o3
	lduha	[%l7 + %o3] 0x80,	%o2
	orn	%i1,	0x08E3,	%o1
	orncc	%i5,	0x18E5,	%g3
	andcc	%i6,	%i7,	%g6
	fmovrslez	%o6,	%f15,	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g1
	tneg	%xcc,	0x1
	fcmpd	%fcc3,	%f22,	%f18
	movcc	%icc,	%i4,	%i0
	movvc	%icc,	%g4,	%o0
	taddcctv	%l4,	%g5,	%g7
	fornot1s	%f8,	%f19,	%f14
	sdiv	%o5,	0x1DE3,	%o7
	srl	%o4,	%l3,	%l5
	movrgez	%g2,	0x1BC,	%i3
	fmovsvc	%icc,	%f31,	%f31
	tle	%xcc,	0x7
	sir	0x0023
	ldub	[%l7 + 0x50],	%l6
	tcs	%icc,	0x4
	set	0x0, %i5
	ldxa	[%g0 + %i5] 0x4f,	%l2
	movleu	%icc,	%l0,	%o3
	udivx	%o2,	0x0396,	%i2
	fexpand	%f6,	%f12
	movg	%xcc,	%i1,	%i5
	fmovrdlez	%g3,	%f28,	%f28
	edge16ln	%i6,	%i7,	%o1
	smulcc	%g6,	%o6,	%g1
	umul	%l1,	0x12FD,	%i4
	edge32ln	%g4,	%i0,	%o0
	tneg	%icc,	0x7
	flush	%l7 + 0x58
	bne	loop_2723
	fnot1	%f30,	%f22
	tvs	%icc,	0x2
	fpsub16s	%f6,	%f0,	%f30
loop_2723:
	tvs	%icc,	0x5
	mova	%icc,	%l4,	%g5
	movge	%xcc,	%o5,	%g7
	fands	%f22,	%f28,	%f20
	movcs	%icc,	%o4,	%o7
	smulcc	%l3,	0x0DDF,	%l5
	fcmple16	%f4,	%f10,	%g2
	ldx	[%l7 + 0x08],	%i3
	nop
	setx	loop_2724,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brnz,a	%l6,	loop_2725
	andn	%l2,	%o3,	%l0
	stx	%o2,	[%l7 + 0x50]
loop_2724:
	fbne	%fcc2,	loop_2726
loop_2725:
	bcs,a,pn	%xcc,	loop_2727
	sth	%i2,	[%l7 + 0x60]
	movrgez	%i1,	%g3,	%i5
loop_2726:
	edge16l	%i6,	%o1,	%g6
loop_2727:
	fxnor	%f26,	%f18,	%f24
	orn	%i7,	%g1,	%l1
	fnors	%f14,	%f7,	%f28
	fcmpne16	%f26,	%f8,	%i4
	fmul8x16au	%f17,	%f6,	%f16
	mova	%icc,	%o6,	%g4
	movrne	%i0,	0x25F,	%o0
	edge16	%l4,	%o5,	%g7
	fcmpgt16	%f22,	%f26,	%o4
	brgez	%o7,	loop_2728
	srlx	%l3,	0x09,	%g5
	subcc	%l5,	0x0456,	%i3
	udivcc	%l6,	0x0B08,	%g2
loop_2728:
	fcmpd	%fcc1,	%f26,	%f6
	movn	%icc,	%o3,	%l2
	fcmple16	%f10,	%f18,	%o2
	edge8	%i2,	%i1,	%g3
	nop
	setx	loop_2729,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt16	%f14,	%f4,	%l0
	fmovsvs	%icc,	%f5,	%f24
	smul	%i6,	%i5,	%o1
loop_2729:
	fandnot2s	%f16,	%f10,	%f20
	bcc,pt	%xcc,	loop_2730
	mulscc	%i7,	%g6,	%l1
	for	%f14,	%f26,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2730:
	bne	%xcc,	loop_2731
	fble	%fcc3,	loop_2732
	fpmerge	%f5,	%f10,	%f2
	brz,a	%g1,	loop_2733
loop_2731:
	tn	%xcc,	0x2
loop_2732:
	fbug	%fcc3,	loop_2734
	movge	%icc,	%o6,	%i4
loop_2733:
	sth	%g4,	[%l7 + 0x36]
	udivcc	%i0,	0x0706,	%l4
loop_2734:
	edge8	%o0,	%g7,	%o5
	stbar
	tsubcctv	%o7,	0x08B9,	%o4
	edge16ln	%l3,	%l5,	%i3
	fmovdgu	%xcc,	%f3,	%f28
	fmovdcs	%icc,	%f18,	%f0
	fmovsa	%xcc,	%f17,	%f26
	fmovsl	%icc,	%f2,	%f17
	ba	%icc,	loop_2735
	fcmple32	%f16,	%f26,	%l6
	call	loop_2736
	movcc	%icc,	%g5,	%g2
loop_2735:
	tle	%xcc,	0x3
	sdivcc	%o3,	0x088E,	%o2
loop_2736:
	brz	%i2,	loop_2737
	movrne	%l2,	%i1,	%g3
	fmovdg	%icc,	%f24,	%f12
	movleu	%icc,	%l0,	%i5
loop_2737:
	edge8	%i6,	%o1,	%i7
	tge	%icc,	0x1
	sdivcc	%g6,	0x13DA,	%l1
	edge32l	%g1,	%i4,	%g4
	fpmerge	%f25,	%f14,	%f18
	array32	%i0,	%o6,	%o0
	andn	%g7,	0x1A25,	%l4
	edge8	%o5,	%o7,	%l3
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x22] %asi,	%l5
	movcs	%icc,	%i3,	%l6
	fmovsleu	%xcc,	%f2,	%f16
	wr	%g0,	0xeb,	%asi
	stba	%o4,	[%l7 + 0x4B] %asi
	membar	#Sync
	fnands	%f10,	%f19,	%f15
	flush	%l7 + 0x30
	ta	%icc,	0x5
	umul	%g5,	0x1F4B,	%g2
	sethi	0x1476,	%o3
	swap	[%l7 + 0x70],	%i2
	stbar
	ldub	[%l7 + 0x36],	%o2
	umul	%l2,	%g3,	%l0
	fmovdneg	%icc,	%f31,	%f12
	movl	%xcc,	%i5,	%i6
	srlx	%i1,	%i7,	%o1
	tl	%xcc,	0x3
	subcc	%g6,	0x07F2,	%l1
	orcc	%i4,	0x0267,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%o6,	%i0
	sdivcc	%o0,	0x1641,	%l4
	movle	%icc,	%g7,	%o7
	set	0x64, %g6
	sta	%f26,	[%l7 + %g6] 0x11
	sir	0x1EB5
	movvc	%icc,	%l3,	%l5
	edge8l	%i3,	%l6,	%o5
	ldsb	[%l7 + 0x0A],	%g5
	fbn,a	%fcc0,	loop_2738
	array32	%o4,	%g2,	%o3
	fmovsle	%xcc,	%f13,	%f1
	sub	%o2,	0x081F,	%l2
loop_2738:
	tsubcctv	%i2,	%g3,	%i5
	sethi	0x192D,	%i6
	sir	0x0092
	movleu	%xcc,	%i1,	%i7
	movrlez	%l0,	%o1,	%g6
	mulscc	%i4,	%l1,	%g1
	fpadd32s	%f20,	%f6,	%f20
	tneg	%xcc,	0x0
	addcc	%g4,	0x1C0B,	%o6
	movn	%xcc,	%i0,	%o0
	tcs	%xcc,	0x4
	fnor	%f14,	%f26,	%f26
	fcmpes	%fcc3,	%f24,	%f9
	bvc	loop_2739
	add	%l4,	%o7,	%l3
	edge32l	%l5,	%i3,	%l6
	fbe	%fcc2,	loop_2740
loop_2739:
	fcmped	%fcc3,	%f20,	%f28
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2740:
	fcmpgt32	%f8,	%f14,	%g7
	edge8n	%g5,	%o5,	%o4
	flush	%l7 + 0x60
	alignaddr	%o3,	%o2,	%l2
	call	loop_2741
	movg	%xcc,	%i2,	%g3
	orncc	%g2,	%i6,	%i5
	xor	%i1,	%l0,	%o1
loop_2741:
	edge32l	%i7,	%g6,	%i4
	nop
	setx	loop_2742,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2	%f2,	%f14
	orcc	%g1,	0x0F0C,	%l1
	bgu,pt	%icc,	loop_2743
loop_2742:
	orn	%o6,	0x0A11,	%i0
	edge16	%o0,	%g4,	%o7
	tl	%xcc,	0x6
loop_2743:
	st	%f23,	[%l7 + 0x4C]
	fbg	%fcc3,	loop_2744
	movrgz	%l3,	0x0A9,	%l5
	brlez	%i3,	loop_2745
	orcc	%l4,	0x188C,	%l6
loop_2744:
	mulx	%g7,	%g5,	%o4
	sdivcc	%o5,	0x13F0,	%o2
loop_2745:
	fbg,a	%fcc1,	loop_2746
	xnorcc	%l2,	0x0CA2,	%o3
	lduh	[%l7 + 0x10],	%i2
	sir	0x1679
loop_2746:
	movl	%xcc,	%g3,	%i6
	fbug	%fcc3,	loop_2747
	be,a,pn	%xcc,	loop_2748
	fmul8x16	%f9,	%f0,	%f18
	fmovsl	%xcc,	%f26,	%f20
loop_2747:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%g2,	[%l7 + 0x6A] %asi
	membar	#Sync
loop_2748:
	orncc	%i1,	%i5,	%o1
	ble,a	loop_2749
	pdist	%f14,	%f16,	%f4
	fpsub32	%f2,	%f28,	%f16
	bvs,a	%icc,	loop_2750
loop_2749:
	edge32n	%i7,	%g6,	%i4
	alignaddr	%g1,	%l1,	%l0
	tcc	%icc,	0x3
loop_2750:
	fmovscs	%icc,	%f31,	%f26
	fmul8x16al	%f18,	%f9,	%f20
	ld	[%l7 + 0x44],	%f2
	fandnot2s	%f27,	%f25,	%f2
	udiv	%i0,	0x0ED7,	%o0
	edge16n	%g4,	%o6,	%l3
	fpmerge	%f16,	%f5,	%f28
	srlx	%o7,	0x17,	%l5
	bgu,a	loop_2751
	taddcc	%l4,	%l6,	%i3
	std	%g6,	[%l7 + 0x48]
	movg	%icc,	%g5,	%o5
loop_2751:
	fmovse	%xcc,	%f29,	%f22
	udivcc	%o2,	0x080C,	%l2
	umulcc	%o3,	%o4,	%g3
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i6
	orn	%g2,	0x1676,	%i1
	sir	0x1728
	fmuld8ulx16	%f7,	%f26,	%f12
	brgz,a	%i2,	loop_2752
	sll	%i5,	0x07,	%i7
	addcc	%g6,	0x0382,	%i4
	stw	%g1,	[%l7 + 0x2C]
loop_2752:
	fmovsn	%xcc,	%f19,	%f7
	fcmpeq16	%f20,	%f22,	%o1
	fpadd32	%f16,	%f20,	%f14
	fmovdn	%xcc,	%f10,	%f18
	nop
	setx loop_2753, %l0, %l1
	jmpl %l1, %l0
	sdivx	%l1,	0x117F,	%o0
	swap	[%l7 + 0x30],	%g4
	tcs	%icc,	0x4
loop_2753:
	addcc	%i0,	%l3,	%o6
	fmovrslez	%o7,	%f21,	%f2
	bgu,pn	%icc,	loop_2754
	fble,a	%fcc1,	loop_2755
	tvs	%icc,	0x5
	call	loop_2756
loop_2754:
	fmovsvs	%xcc,	%f21,	%f31
loop_2755:
	tneg	%xcc,	0x7
	fbue,a	%fcc3,	loop_2757
loop_2756:
	orn	%l5,	0x0696,	%l6
	wr	%g0,	0xeb,	%asi
	stda	%i2,	[%l7 + 0x18] %asi
	membar	#Sync
loop_2757:
	andcc	%g7,	0x1603,	%g5
	wr	%g0,	0x81,	%asi
	stha	%o5,	[%l7 + 0x1C] %asi
	fmul8ulx16	%f12,	%f20,	%f6
	fcmpne32	%f6,	%f4,	%o2
	fmuld8sux16	%f15,	%f13,	%f28
	sra	%l2,	%o3,	%l4
	fba,a	%fcc0,	loop_2758
	st	%f25,	[%l7 + 0x4C]
	edge32	%g3,	%o4,	%g2
	movrlez	%i6,	0x134,	%i2
loop_2758:
	fnors	%f17,	%f13,	%f28
	subc	%i1,	0x0BC6,	%i5
	udiv	%i7,	0x1F28,	%i4
	be,a	loop_2759
	edge16	%g6,	%o1,	%l0
	movrlz	%l1,	0x360,	%g1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x49] %asi,	%g4
loop_2759:
	fmovrdlz	%i0,	%f2,	%f14
	ble,a,pt	%icc,	loop_2760
	fmovrdlez	%l3,	%f12,	%f30
	nop
	setx loop_2761, %l0, %l1
	jmpl %l1, %o0
	orcc	%o6,	0x0BEE,	%o7
loop_2760:
	fmovdvs	%xcc,	%f7,	%f4
	fxnor	%f2,	%f0,	%f28
loop_2761:
	fcmpes	%fcc0,	%f26,	%f30
	set	0x20, %g1
	lduba	[%l7 + %g1] 0x18,	%l5
	stx	%i3,	[%l7 + 0x30]
	fmovrslz	%l6,	%f31,	%f16
	sra	%g5,	0x08,	%g7
	udiv	%o2,	0x1EAB,	%o5
	fmuld8sux16	%f9,	%f2,	%f16
	andcc	%l2,	0x011C,	%o3
	array8	%g3,	%o4,	%g2
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x16,	%f16
	fors	%f14,	%f10,	%f0
	fbn,a	%fcc3,	loop_2762
	fbo,a	%fcc1,	loop_2763
	membar	0x04
	flush	%l7 + 0x3C
loop_2762:
	and	%i6,	0x06E6,	%l4
loop_2763:
	udivx	%i1,	0x1529,	%i5
	fmul8x16al	%f25,	%f12,	%f22
	st	%f11,	[%l7 + 0x70]
	brgez,a	%i2,	loop_2764
	fmovdneg	%xcc,	%f31,	%f0
	fbug	%fcc1,	loop_2765
	udivcc	%i4,	0x045E,	%i7
loop_2764:
	alignaddr	%o1,	%g6,	%l0
	movcs	%xcc,	%l1,	%g1
loop_2765:
	or	%i0,	0x12CD,	%l3
	addc	%o0,	%o6,	%o7
	fmovrse	%g4,	%f27,	%f19
	ld	[%l7 + 0x48],	%f30
	fmovdvs	%icc,	%f26,	%f19
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x08] %asi,	%l5
	taddcc	%i3,	%g5,	%l6
	brgz	%g7,	loop_2766
	movne	%xcc,	%o5,	%o2
	edge16ln	%l2,	%g3,	%o3
	fblg	%fcc2,	loop_2767
loop_2766:
	ld	[%l7 + 0x64],	%f30
	set	0x66, %g2
	lduba	[%l7 + %g2] 0x18,	%g2
loop_2767:
	fnegs	%f5,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o4,	0x18,	%i6
	set	0x44, %l6
	lduwa	[%l7 + %l6] 0x81,	%l4
	movrlz	%i5,	%i2,	%i4
	fzeros	%f0
	fmovrde	%i1,	%f26,	%f24
	fnands	%f21,	%f7,	%f14
	tneg	%xcc,	0x2
	smulcc	%o1,	%g6,	%l0
	xor	%i7,	0x1168,	%l1
	mulscc	%i0,	0x05E4,	%l3
	bg	%xcc,	loop_2768
	fmul8x16al	%f28,	%f28,	%f16
	sllx	%g1,	%o0,	%o7
	movg	%icc,	%o6,	%l5
loop_2768:
	nop
	set	0x4C, %i4
	ldstuba	[%l7 + %i4] 0x11,	%i3
	alignaddr	%g5,	%g4,	%g7
	ble,a	loop_2769
	fmovsvc	%icc,	%f25,	%f19
	fpack16	%f24,	%f7
	movrlz	%l6,	%o2,	%l2
loop_2769:
	addccc	%o5,	%g3,	%g2
	bn,pn	%icc,	loop_2770
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%o3
	fandnot2s	%f31,	%f28,	%f1
	udivx	%i6,	0x13C4,	%l4
loop_2770:
	call	loop_2771
	edge32	%o4,	%i5,	%i4
	andcc	%i2,	%o1,	%g6
	fxors	%f5,	%f12,	%f2
loop_2771:
	tcc	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f30,	%f6,	%f16
	movne	%xcc,	%l0,	%i1
	fbge,a	%fcc2,	loop_2772
	movge	%xcc,	%l1,	%i0
	edge32ln	%l3,	%g1,	%i7
	fnot2	%f14,	%f8
loop_2772:
	fmovdcc	%icc,	%f11,	%f2
	tcs	%xcc,	0x0
	ld	[%l7 + 0x68],	%f1
	bneg,pt	%xcc,	loop_2773
	nop
	set	0x78, %g3
	ldsh	[%l7 + %g3],	%o7
	sdivcc	%o0,	0x0AEF,	%o6
	fbule	%fcc0,	loop_2774
loop_2773:
	movgu	%icc,	%i3,	%l5
	fpackfix	%f16,	%f8
	ldsh	[%l7 + 0x4C],	%g4
loop_2774:
	addccc	%g7,	%g5,	%o2
	udivcc	%l6,	0x04BC,	%l2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
	edge16n	%g2,	%o3,	%o5
	edge8ln	%i6,	%l4,	%i5
	array16	%i4,	%o4,	%o1
	umulcc	%i2,	0x183D,	%l0
	fmovdvs	%icc,	%f3,	%f20
	sdivcc	%i1,	0x16D7,	%l1
	fandnot1	%f8,	%f18,	%f0
	udiv	%g6,	0x1E7E,	%i0
	fmovrslez	%l3,	%f17,	%f26
	fabss	%f19,	%f24
	fba,a	%fcc3,	loop_2775
	brnz	%i7,	loop_2776
	alignaddr	%o7,	%g1,	%o6
	bne	loop_2777
loop_2775:
	fandnot2s	%f30,	%f14,	%f19
loop_2776:
	brgz,a	%o0,	loop_2778
	array8	%l5,	%i3,	%g4
loop_2777:
	fbul	%fcc0,	loop_2779
	stx	%g7,	[%l7 + 0x20]
loop_2778:
	tl	%icc,	0x5
	stbar
loop_2779:
	fnot2s	%f29,	%f8
	edge8l	%o2,	%g5,	%l2
	fmovsa	%icc,	%f17,	%f20
	edge16l	%g3,	%l6,	%g2
	fbug,a	%fcc0,	loop_2780
	move	%xcc,	%o3,	%o5
	brgz	%l4,	loop_2781
	movrne	%i6,	0x345,	%i4
loop_2780:
	mova	%icc,	%o4,	%i5
	movrne	%o1,	%l0,	%i2
loop_2781:
	movneg	%icc,	%i1,	%l1
	andncc	%g6,	%l3,	%i7
	edge32n	%i0,	%g1,	%o7
	prefetch	[%l7 + 0x60],	 0x0
	wr	%g0,	0x89,	%asi
	sta	%f30,	[%l7 + 0x20] %asi
	udivx	%o0,	0x197A,	%l5
	set	0x2C, %i7
	lduha	[%l7 + %i7] 0x88,	%o6
	wr	%g0,	0x80,	%asi
	stwa	%i3,	[%l7 + 0x3C] %asi
	edge32l	%g7,	%o2,	%g4
	fbe	%fcc2,	loop_2782
	fbge	%fcc1,	loop_2783
	fmovsvs	%xcc,	%f16,	%f27
	sll	%g5,	%l2,	%l6
loop_2782:
	movcc	%xcc,	%g3,	%o3
loop_2783:
	siam	0x2
	movl	%icc,	%g2,	%l4
	smul	%o5,	0x064A,	%i4
	sll	%i6,	0x09,	%o4
	orn	%i5,	0x1DA0,	%l0
	movneg	%xcc,	%o1,	%i2
	bge,a,pt	%xcc,	loop_2784
	sra	%i1,	%g6,	%l1
	tneg	%xcc,	0x0
	addc	%l3,	%i0,	%g1
loop_2784:
	move	%icc,	%o7,	%i7
	fmovrdne	%l5,	%f20,	%f8
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o0
	smulcc	%i3,	0x11B3,	%o6
	brz,a	%o2,	loop_2785
	taddcc	%g7,	%g4,	%g5
	fnands	%f5,	%f23,	%f25
	edge8l	%l2,	%g3,	%o3
loop_2785:
	movvs	%xcc,	%l6,	%g2
	movcc	%xcc,	%l4,	%o5
	movcc	%xcc,	%i6,	%i4
	edge16	%i5,	%o4,	%l0
	bcc	%xcc,	loop_2786
	tvc	%xcc,	0x1
	fmovsl	%xcc,	%f31,	%f27
	fpadd32	%f0,	%f24,	%f4
loop_2786:
	fmovdcs	%icc,	%f25,	%f12
	set	0x20, %g7
	stxa	%i2,	[%l7 + %g7] 0xe2
	membar	#Sync
	bn,a	%icc,	loop_2787
	mulx	%i1,	%g6,	%l1
	movg	%icc,	%l3,	%o1
	std	%f10,	[%l7 + 0x68]
loop_2787:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g1,	0x0C37,	%i0
	movrgez	%i7,	%l5,	%o0
	smul	%o7,	0x0B24,	%o6
	fnand	%f10,	%f2,	%f16
	orcc	%i3,	0x0CB2,	%g7
	fmovrslez	%o2,	%f16,	%f27
	bvs,a	loop_2788
	std	%g4,	[%l7 + 0x18]
	array32	%g4,	%g3,	%o3
	tsubcctv	%l2,	0x1AD0,	%l6
loop_2788:
	sdivcc	%l4,	0x0188,	%o5
	fbl	%fcc0,	loop_2789
	movle	%xcc,	%i6,	%i4
	mulx	%g2,	%o4,	%l0
	ldsw	[%l7 + 0x50],	%i2
loop_2789:
	fpmerge	%f26,	%f6,	%f12
	ldsh	[%l7 + 0x60],	%i1
	ldub	[%l7 + 0x31],	%i5
	bcc	%xcc,	loop_2790
	bn,a	%xcc,	loop_2791
	sdiv	%g6,	0x1B86,	%l1
	tl	%xcc,	0x1
loop_2790:
	subccc	%o1,	%l3,	%g1
loop_2791:
	fmovdgu	%icc,	%f17,	%f30
	wr	%g0,	0x88,	%asi
	sta	%f12,	[%l7 + 0x68] %asi
	bneg	loop_2792
	fmovrdne	%i7,	%f6,	%f14
	set	0x30, %o5
	lda	[%l7 + %o5] 0x15,	%f23
loop_2792:
	tleu	%xcc,	0x4
	fmovscs	%xcc,	%f30,	%f4
	sra	%i0,	0x09,	%o0
	array8	%o7,	%o6,	%l5
	ldsh	[%l7 + 0x5A],	%i3
	fcmped	%fcc2,	%f20,	%f20
	tcc	%xcc,	0x0
	subccc	%g7,	%g5,	%g4
	edge16ln	%g3,	%o2,	%o3
	array32	%l2,	%l4,	%o5
	fmovsneg	%icc,	%f28,	%f21
	fornot1	%f8,	%f0,	%f8
	taddcctv	%i6,	%l6,	%i4
	ldsb	[%l7 + 0x57],	%o4
	sdivx	%g2,	0x1C7F,	%l0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x14,	%f0
	fmul8x16al	%f17,	%f18,	%f20
	movrgez	%i2,	0x102,	%i1
	movrgez	%i5,	%l1,	%o1
	set	0x78, %l4
	stda	%g6,	[%l7 + %l4] 0x04
	movrne	%g1,	%l3,	%i7
	addc	%o0,	%o7,	%i0
	movge	%icc,	%o6,	%i3
	fcmpgt32	%f8,	%f10,	%l5
	bleu,pn	%xcc,	loop_2793
	array8	%g5,	%g7,	%g4
	umulcc	%g3,	%o3,	%o2
	stbar
loop_2793:
	array8	%l2,	%l4,	%i6
	mova	%xcc,	%l6,	%o5
	move	%icc,	%o4,	%g2
	flush	%l7 + 0x34
	fandnot1s	%f1,	%f23,	%f7
	sdivcc	%l0,	0x055A,	%i2
	ldd	[%l7 + 0x30],	%i4
	fmovdl	%xcc,	%f13,	%f16
	fcmpes	%fcc2,	%f5,	%f29
	bvc,a,pn	%icc,	loop_2794
	tg	%xcc,	0x5
	movgu	%xcc,	%i5,	%i1
	fcmpne32	%f0,	%f2,	%o1
loop_2794:
	nop
	setx loop_2795, %l0, %l1
	jmpl %l1, %g6
	tle	%icc,	0x5
	smul	%g1,	%l3,	%i7
	ble,a,pn	%xcc,	loop_2796
loop_2795:
	sra	%o0,	%o7,	%l1
	edge16n	%i0,	%o6,	%i3
	fnegs	%f30,	%f16
loop_2796:
	movrgez	%l5,	%g5,	%g7
	fbug	%fcc2,	loop_2797
	fbule	%fcc3,	loop_2798
	bvs,pt	%icc,	loop_2799
	tpos	%xcc,	0x0
loop_2797:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x28] %asi,	%g4
loop_2798:
	fmovdn	%icc,	%f21,	%f13
loop_2799:
	bne,a	%xcc,	loop_2800
	edge16ln	%o3,	%g3,	%l2
	sth	%l4,	[%l7 + 0x22]
	flush	%l7 + 0x1C
loop_2800:
	bg	loop_2801
	movn	%icc,	%o2,	%l6
	tgu	%xcc,	0x4
	ldsb	[%l7 + 0x51],	%i6
loop_2801:
	ldsw	[%l7 + 0x08],	%o4
	movre	%g2,	%o5,	%i2
	taddcctv	%i4,	%i5,	%i1
	fbo,a	%fcc2,	loop_2802
	tne	%icc,	0x5
	fzeros	%f21
	edge32	%l0,	%g6,	%o1
loop_2802:
	andcc	%l3,	%i7,	%g1
	fmovspos	%icc,	%f5,	%f14
	movl	%xcc,	%o7,	%o0
	fpack16	%f30,	%f10
	addc	%i0,	%o6,	%l1
	movcs	%xcc,	%l5,	%i3
	mulscc	%g7,	%g5,	%g4
	tpos	%xcc,	0x2
	fandnot1	%f4,	%f22,	%f14
	taddcc	%g3,	%o3,	%l4
	smulcc	%o2,	%l6,	%l2
	movre	%o4,	%g2,	%o5
	umulcc	%i2,	0x1845,	%i4
	fcmpes	%fcc0,	%f6,	%f15
	and	%i5,	0x0094,	%i6
	sdivx	%l0,	0x0CD9,	%i1
	bvs,a,pt	%xcc,	loop_2803
	fmovsg	%icc,	%f22,	%f2
	taddcctv	%g6,	0x178D,	%o1
	movgu	%xcc,	%i7,	%l3
loop_2803:
	xnor	%o7,	%o0,	%g1
	std	%f4,	[%l7 + 0x20]
	fbne	%fcc2,	loop_2804
	edge16ln	%o6,	%i0,	%l1
	tge	%icc,	0x5
	tne	%xcc,	0x0
loop_2804:
	movgu	%icc,	%i3,	%g7
	sdiv	%g5,	0x0295,	%g4
	bshuffle	%f2,	%f12,	%f10
	srl	%l5,	%g3,	%l4
	nop
	setx loop_2805, %l0, %l1
	jmpl %l1, %o3
	srax	%l6,	%o2,	%l2
	fmovsl	%icc,	%f20,	%f30
	fmovdvc	%icc,	%f20,	%f29
loop_2805:
	sll	%g2,	0x0C,	%o5
	tsubcctv	%i2,	0x1793,	%i4
	nop
	set	0x70, %o0
	std	%f20,	[%l7 + %o0]
	movrgz	%i5,	%i6,	%l0
	fones	%f29
	fpsub32s	%f16,	%f15,	%f19
	tcc	%icc,	0x4
	addcc	%o4,	%i1,	%g6
	ldx	[%l7 + 0x58],	%o1
	ldd	[%l7 + 0x50],	%l2
	tge	%icc,	0x3
	fcmpd	%fcc3,	%f12,	%f14
	movvs	%xcc,	%o7,	%o0
	fbule,a	%fcc0,	loop_2806
	fbn	%fcc2,	loop_2807
	orncc	%g1,	%o6,	%i0
	subc	%l1,	%i3,	%g7
loop_2806:
	sdivx	%i7,	0x150F,	%g5
loop_2807:
	movpos	%icc,	%g4,	%g3
	edge16ln	%l5,	%o3,	%l4
	srax	%l6,	%l2,	%g2
	call	loop_2808
	edge8n	%o2,	%i2,	%o5
	alignaddrl	%i4,	%i5,	%i6
	edge16l	%o4,	%l0,	%i1
loop_2808:
	andncc	%g6,	%l3,	%o1
	ldx	[%l7 + 0x08],	%o0
	smul	%o7,	%o6,	%g1
	ldstub	[%l7 + 0x78],	%i0
	edge16ln	%i3,	%l1,	%i7
	andncc	%g5,	%g4,	%g3
	udiv	%g7,	0x1BC7,	%o3
	xnor	%l4,	0x1ACF,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l2,	%l6,	%o2
	fbuge	%fcc3,	loop_2809
	edge16	%i2,	%g2,	%i4
	movn	%icc,	%o5,	%i6
	xnorcc	%o4,	%i5,	%l0
loop_2809:
	tg	%icc,	0x1
	mova	%icc,	%g6,	%l3
	movrlez	%o1,	%i1,	%o0
	movrgz	%o6,	0x2C1,	%g1
	srax	%o7,	0x05,	%i0
	tsubcctv	%i3,	%i7,	%l1
	tgu	%xcc,	0x4
	mulx	%g5,	%g3,	%g7
	std	%g4,	[%l7 + 0x48]
	edge32	%o3,	%l5,	%l2
	edge32l	%l4,	%o2,	%i2
	srlx	%l6,	%g2,	%o5
	fbul	%fcc1,	loop_2810
	subc	%i6,	%o4,	%i5
	tcc	%icc,	0x0
	ldsh	[%l7 + 0x5E],	%i4
loop_2810:
	be,a	%xcc,	loop_2811
	popc	%l0,	%g6
	std	%o0,	[%l7 + 0x30]
	alignaddr	%l3,	%o0,	%i1
loop_2811:
	fmovdle	%icc,	%f24,	%f2
	fcmpgt32	%f12,	%f6,	%o6
	popc	%o7,	%g1
	srlx	%i0,	0x0A,	%i7
	addc	%l1,	0x1324,	%g5
	srax	%i3,	0x0D,	%g3
	edge16n	%g4,	%o3,	%l5
	fbge	%fcc1,	loop_2812
	movvs	%icc,	%l2,	%l4
	edge16n	%g7,	%o2,	%l6
	movrlez	%g2,	%o5,	%i6
loop_2812:
	movvc	%xcc,	%o4,	%i2
	fexpand	%f14,	%f26
	movrgez	%i4,	0x0BC,	%i5
	fornot2	%f14,	%f24,	%f24
	fbug,a	%fcc0,	loop_2813
	fmovrsgez	%g6,	%f10,	%f4
	edge16ln	%o1,	%l3,	%o0
	for	%f18,	%f10,	%f22
loop_2813:
	edge8	%i1,	%o6,	%l0
	membar	0x10
	fmovrdne	%o7,	%f22,	%f26
	tl	%xcc,	0x2
	set	0x50, %o1
	stda	%g0,	[%l7 + %o1] 0x22
	membar	#Sync
	umulcc	%i0,	%i7,	%l1
	movgu	%xcc,	%g5,	%g3
	smul	%g4,	0x18B2,	%i3
	fmovscs	%xcc,	%f4,	%f23
	fbo,a	%fcc0,	loop_2814
	umul	%o3,	0x0D0D,	%l5
	srax	%l2,	%g7,	%o2
	bcs,a	loop_2815
loop_2814:
	add	%l4,	0x1443,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f17,	[%l7 + 0x5C] %asi
loop_2815:
	nop
	setx	loop_2816,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%l6,	%o5,	%o4
	bvs,pn	%icc,	loop_2817
	movne	%icc,	%i2,	%i6
loop_2816:
	xnorcc	%i4,	%g6,	%o1
	orcc	%i5,	%l3,	%i1
loop_2817:
	fnegs	%f25,	%f29
	movrgz	%o0,	%l0,	%o6
	fcmpeq16	%f14,	%f4,	%g1
	ble,a,pn	%xcc,	loop_2818
	edge16l	%o7,	%i0,	%l1
	fmul8x16au	%f15,	%f20,	%f28
	fnegs	%f31,	%f0
loop_2818:
	andncc	%g5,	%g3,	%g4
	fsrc2	%f16,	%f12
	andn	%i3,	0x1B47,	%i7
	alignaddr	%l5,	%o3,	%l2
	subc	%o2,	0x0509,	%g7
	bgu	%xcc,	loop_2819
	edge16l	%l4,	%g2,	%o5
	edge32ln	%l6,	%o4,	%i2
	xorcc	%i6,	%i4,	%g6
loop_2819:
	movne	%icc,	%o1,	%l3
	movpos	%icc,	%i1,	%o0
	smul	%l0,	%i5,	%o6
	tgu	%icc,	0x5
	edge16	%g1,	%o7,	%l1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g5
	ldsw	[%l7 + 0x60],	%i0
	edge32l	%g4,	%i3,	%i7
	fxor	%f24,	%f6,	%f14
	fba,a	%fcc2,	loop_2820
	brnz	%g3,	loop_2821
	fbe,a	%fcc1,	loop_2822
	fpsub32s	%f9,	%f0,	%f12
loop_2820:
	bne,pt	%xcc,	loop_2823
loop_2821:
	fbo	%fcc0,	loop_2824
loop_2822:
	movle	%xcc,	%o3,	%l5
	fpadd16	%f6,	%f14,	%f20
loop_2823:
	popc	0x173E,	%o2
loop_2824:
	mulx	%l2,	0x1EA1,	%l4
	movcc	%xcc,	%g2,	%g7
	udivx	%l6,	0x1101,	%o4
	sdiv	%o5,	0x0208,	%i2
	bvc,a	%xcc,	loop_2825
	movg	%icc,	%i6,	%i4
	smulcc	%g6,	%l3,	%i1
	mulscc	%o1,	%o0,	%l0
loop_2825:
	orcc	%i5,	%o6,	%g1
	ld	[%l7 + 0x78],	%f19
	srax	%o7,	%l1,	%g5
	tle	%xcc,	0x0
	fpackfix	%f30,	%f15
	srl	%g4,	%i3,	%i7
	edge32n	%g3,	%i0,	%l5
	te	%icc,	0x5
	sub	%o2,	0x1715,	%o3
	fmovdcc	%xcc,	%f24,	%f6
	tn	%icc,	0x6
	movcs	%xcc,	%l2,	%g2
	edge32n	%l4,	%l6,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f10,	%f25
	tge	%icc,	0x5
	fmovse	%icc,	%f23,	%f9
	smul	%g7,	0x01EE,	%o5
	tg	%icc,	0x1
	edge8ln	%i6,	%i2,	%g6
	xnor	%l3,	0x088B,	%i4
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x80,	%o0
	ldx	[%l7 + 0x38],	%i1
	edge32l	%l0,	%i5,	%o6
	movrlz	%g1,	%o7,	%l1
	set	0x64, %l3
	stwa	%g5,	[%l7 + %l3] 0x2b
	membar	#Sync
	fmul8x16al	%f7,	%f9,	%f0
	brlez,a	%g4,	loop_2826
	be,pn	%xcc,	loop_2827
	array8	%o0,	%i7,	%g3
	fpackfix	%f2,	%f16
loop_2826:
	ldsb	[%l7 + 0x15],	%i3
loop_2827:
	edge8	%l5,	%i0,	%o3
	taddcctv	%l2,	0x1812,	%g2
	srax	%o2,	%l4,	%o4
	set	0x75, %i3
	stba	%g7,	[%l7 + %i3] 0x81
	subcc	%l6,	0x1073,	%o5
	edge16	%i2,	%g6,	%i6
	sdivx	%l3,	0x15F3,	%i4
	movrgz	%i1,	%l0,	%o1
	fmovse	%xcc,	%f20,	%f19
	udivx	%o6,	0x1A49,	%i5
	movgu	%xcc,	%g1,	%l1
	fblg,a	%fcc1,	loop_2828
	subcc	%g5,	%g4,	%o7
	fbne,a	%fcc0,	loop_2829
	sdivx	%o0,	0x0521,	%g3
loop_2828:
	fpack16	%f4,	%f6
	fands	%f22,	%f7,	%f10
loop_2829:
	subcc	%i7,	%l5,	%i3
	stw	%i0,	[%l7 + 0x54]
	ldsw	[%l7 + 0x40],	%l2
	alignaddrl	%g2,	%o3,	%o2
	sdivx	%o4,	0x13D4,	%g7
	tleu	%icc,	0x7
	fpmerge	%f4,	%f31,	%f16
	set	0x34, %i6
	sta	%f26,	[%l7 + %i6] 0x88
	movneg	%icc,	%l4,	%o5
	stw	%i2,	[%l7 + 0x30]
	tsubcc	%g6,	%i6,	%l3
	smulcc	%l6,	0x037C,	%i4
	movpos	%icc,	%l0,	%i1
	tge	%icc,	0x4
	taddcc	%o1,	0x0776,	%o6
	movge	%icc,	%i5,	%l1
	nop
	set	0x60, %l2
	std	%f24,	[%l7 + %l2]
	movle	%icc,	%g1,	%g5
	addccc	%g4,	0x048A,	%o7
	array16	%g3,	%i7,	%l5
	orn	%o0,	%i3,	%l2
	bshuffle	%f10,	%f26,	%f6
	edge32l	%g2,	%o3,	%o2
	ba,a,pn	%xcc,	loop_2830
	orcc	%o4,	%i0,	%l4
	ldub	[%l7 + 0x1C],	%o5
	fbo	%fcc0,	loop_2831
loop_2830:
	tg	%xcc,	0x7
	tne	%xcc,	0x5
	ldsh	[%l7 + 0x34],	%i2
loop_2831:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%g6
	tne	%xcc,	0x3
	call	loop_2832
	lduh	[%l7 + 0x16],	%i6
	udivx	%l6,	0x09B5,	%i4
	tle	%xcc,	0x7
loop_2832:
	bcs	%icc,	loop_2833
	brlez,a	%l0,	loop_2834
	ble	loop_2835
	fbl	%fcc2,	loop_2836
loop_2833:
	siam	0x2
loop_2834:
	sllx	%l3,	%i1,	%o6
loop_2835:
	array32	%i5,	%l1,	%o1
loop_2836:
	tgu	%xcc,	0x7
	movleu	%icc,	%g5,	%g4
	tgu	%icc,	0x6
	bn,a	%icc,	loop_2837
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f1,	%f19
	pdist	%f26,	%f0,	%f22
loop_2837:
	fmovsne	%icc,	%f8,	%f0
	alignaddr	%g1,	%g3,	%i7
	fmovrdne	%o7,	%f8,	%f0
	fnot2s	%f13,	%f23
	tsubcc	%o0,	%i3,	%l2
	xnorcc	%l5,	0x0ED0,	%g2
	subccc	%o3,	%o4,	%i0
	fbul,a	%fcc2,	loop_2838
	fbl,a	%fcc0,	loop_2839
	movgu	%icc,	%o2,	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l4,	%i2
loop_2838:
	fpack32	%f12,	%f12,	%f18
loop_2839:
	sir	0x1265
	stbar
	fandnot2	%f26,	%f18,	%f26
	tcc	%icc,	0x6
	bgu,a,pt	%xcc,	loop_2840
	udivx	%g6,	0x13C0,	%i6
	fcmps	%fcc2,	%f25,	%f17
	edge8l	%g7,	%l6,	%l0
loop_2840:
	tvs	%icc,	0x2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x10] %asi,	%l3
	fornot1s	%f17,	%f20,	%f14
	taddcc	%i1,	%i4,	%i5
	be,pt	%icc,	loop_2841
	fbn,a	%fcc1,	loop_2842
	movre	%o6,	%l1,	%g5
	movneg	%xcc,	%o1,	%g1
loop_2841:
	ta	%icc,	0x2
loop_2842:
	fmul8x16au	%f11,	%f18,	%f16
	fmovsl	%icc,	%f6,	%f11
	fabsd	%f0,	%f20
	fbne	%fcc1,	loop_2843
	umul	%g4,	%i7,	%g3
	tsubcctv	%o0,	0x19C0,	%o7
	tle	%icc,	0x3
loop_2843:
	umul	%i3,	%l5,	%g2
	fpadd16	%f28,	%f28,	%f0
	taddcctv	%l2,	0x18C6,	%o4
	srax	%i0,	0x17,	%o2
	ta	%icc,	0x2
	fzero	%f26
	move	%icc,	%o3,	%l4
	movrlz	%o5,	0x3F8,	%i2
	edge8	%i6,	%g7,	%l6
	srl	%l0,	%l3,	%i1
	bvc	loop_2844
	xorcc	%i4,	0x18E0,	%i5
	fbge	%fcc3,	loop_2845
	fmovdle	%xcc,	%f14,	%f31
loop_2844:
	fbul,a	%fcc0,	loop_2846
	ld	[%l7 + 0x24],	%f0
loop_2845:
	bpos	%xcc,	loop_2847
	movl	%xcc,	%o6,	%l1
loop_2846:
	popc	%g6,	%o1
	fmovdcs	%xcc,	%f28,	%f23
loop_2847:
	nop
	setx loop_2848, %l0, %l1
	jmpl %l1, %g1
	fcmple32	%f30,	%f28,	%g5
	bge	loop_2849
	movrne	%g4,	0x2D3,	%g3
loop_2848:
	xor	%i7,	0x00BA,	%o7
	nop
	set	0x13, %o6
	ldsb	[%l7 + %o6],	%o0
loop_2849:
	edge8n	%l5,	%i3,	%l2
	bn,a,pt	%icc,	loop_2850
	fcmpgt16	%f26,	%f14,	%o4
	movcs	%xcc,	%g2,	%o2
	fmul8sux16	%f0,	%f28,	%f22
loop_2850:
	pdist	%f26,	%f20,	%f20
	movrlez	%i0,	0x140,	%l4
	membar	0x7C
	edge8ln	%o3,	%o5,	%i2
	tl	%xcc,	0x6
	tpos	%icc,	0x2
	xnor	%i6,	0x0823,	%l6
	udiv	%l0,	0x0897,	%l3
	ldx	[%l7 + 0x58],	%i1
	tcc	%xcc,	0x3
	te	%icc,	0x3
	fnands	%f25,	%f28,	%f26
	orncc	%g7,	%i4,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1E] %asi,	%l1
	umul	%g6,	0x0AB7,	%o1
	ldd	[%l7 + 0x18],	%g0
	movleu	%xcc,	%g5,	%g4
	movle	%icc,	%o6,	%g3
	fmovdvc	%xcc,	%f16,	%f12
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x16
	membar	#Sync
	edge16l	%i7,	%o0,	%o7
	sethi	0x0F32,	%i3
	movleu	%icc,	%l5,	%o4
	brgz,a	%l2,	loop_2851
	xorcc	%g2,	%i0,	%l4
	mova	%icc,	%o3,	%o5
	mulx	%o2,	0x03F0,	%i6
loop_2851:
	and	%l6,	%i2,	%l0
	tg	%xcc,	0x0
	fmovdneg	%xcc,	%f15,	%f20
	edge16ln	%l3,	%i1,	%i4
	brlz	%i5,	loop_2852
	mulscc	%g7,	%g6,	%l1
	fnors	%f7,	%f0,	%f5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%g1
loop_2852:
	movrgz	%o1,	%g5,	%g4
	fbne	%fcc1,	loop_2853
	fnor	%f4,	%f12,	%f2
	tvs	%xcc,	0x5
	subc	%o6,	%g3,	%o0
loop_2853:
	movne	%xcc,	%o7,	%i7
	udiv	%l5,	0x1BB3,	%i3
	fpack16	%f24,	%f29
	fmovsge	%xcc,	%f26,	%f2
	movge	%xcc,	%l2,	%o4
	movrne	%g2,	%l4,	%o3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x24] %asi,	%i0
	movneg	%xcc,	%o2,	%o5
	fpadd32s	%f10,	%f0,	%f23
	movn	%icc,	%i6,	%i2
	xor	%l6,	%l0,	%i1
	fandnot1	%f2,	%f12,	%f10
	umul	%i4,	%l3,	%i5
	srl	%g7,	%g6,	%g1
	swap	[%l7 + 0x68],	%l1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g5,	%g4
	tleu	%xcc,	0x7
	lduh	[%l7 + 0x6E],	%o6
	ldsw	[%l7 + 0x70],	%g3
	fmovrslez	%o0,	%f31,	%f23
	fmovsge	%xcc,	%f13,	%f27
	edge16l	%o7,	%i7,	%o1
	movcc	%xcc,	%i3,	%l5
	andn	%l2,	%o4,	%l4
	ta	%icc,	0x0
	set	0x3C, %g4
	lduwa	[%l7 + %g4] 0x15,	%g2
	fornot1	%f8,	%f26,	%f28
	std	%f20,	[%l7 + 0x38]
	edge8	%i0,	%o3,	%o5
	fmovrslz	%o2,	%f18,	%f19
	mova	%xcc,	%i2,	%l6
	tvc	%icc,	0x0
	siam	0x2
	tl	%xcc,	0x0
	alignaddrl	%i6,	%l0,	%i4
	tgu	%xcc,	0x4
	bg,pn	%icc,	loop_2854
	movvs	%icc,	%i1,	%l3
	lduh	[%l7 + 0x5C],	%i5
	tg	%xcc,	0x7
loop_2854:
	sir	0x02A0
	movrgez	%g6,	0x053,	%g1
	tne	%icc,	0x5
	addcc	%g7,	%l1,	%g4
	orn	%g5,	0x13E4,	%o6
	nop
	setx loop_2855, %l0, %l1
	jmpl %l1, %g3
	tsubcctv	%o0,	%o7,	%i7
	fmovsne	%xcc,	%f9,	%f10
	edge32	%o1,	%i3,	%l2
loop_2855:
	ldsb	[%l7 + 0x33],	%l5
	fexpand	%f25,	%f2
	movrgz	%l4,	%g2,	%i0
	fandnot1s	%f29,	%f0,	%f18
	sdivx	%o3,	0x0A32,	%o4
	andn	%o2,	0x19A9,	%o5
	ldub	[%l7 + 0x10],	%i2
	fmovdg	%xcc,	%f17,	%f14
	alignaddr	%i6,	%l0,	%l6
	sra	%i1,	%i4,	%i5
	sllx	%l3,	0x11,	%g6
	fmovrsgz	%g7,	%f29,	%f1
	subc	%g1,	%l1,	%g5
	movrgz	%o6,	%g4,	%o0
	movcs	%xcc,	%g3,	%o7
	fbe,a	%fcc1,	loop_2856
	fmovscc	%xcc,	%f18,	%f27
	taddcc	%o1,	%i7,	%l2
	fbu,a	%fcc0,	loop_2857
loop_2856:
	fmovrdgz	%l5,	%f8,	%f6
	bpos,a	%icc,	loop_2858
	fmovdleu	%xcc,	%f18,	%f23
loop_2857:
	edge32l	%l4,	%i3,	%g2
	fbne	%fcc0,	loop_2859
loop_2858:
	std	%f24,	[%l7 + 0x18]
	movge	%icc,	%i0,	%o4
	set	0x53, %l1
	stba	%o3,	[%l7 + %l1] 0x18
loop_2859:
	std	%o4,	[%l7 + 0x08]
	sllx	%i2,	%o2,	%i6
	edge8	%l0,	%l6,	%i1
	stw	%i4,	[%l7 + 0x38]
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5E] %asi,	%i5
	mulscc	%g6,	%l3,	%g7
	movrlz	%l1,	0x334,	%g5
	movrlz	%o6,	%g1,	%o0
	movvs	%xcc,	%g4,	%o7
	tgu	%icc,	0x5
	orncc	%o1,	%g3,	%i7
	movvc	%xcc,	%l2,	%l4
	addccc	%l5,	0x0552,	%g2
	tvc	%xcc,	0x0
	fones	%f21
	membar	0x7C
	movpos	%icc,	%i0,	%i3
	edge16	%o4,	%o3,	%o5
	andn	%i2,	%o2,	%l0
	array16	%i6,	%l6,	%i1
	set	0x4C, %o7
	ldswa	[%l7 + %o7] 0x18,	%i5
	set	0x2C, %o2
	sta	%f30,	[%l7 + %o2] 0x15
	fsrc2s	%f13,	%f25
	movpos	%xcc,	%i4,	%l3
	umul	%g7,	0x0E26,	%g6
	movre	%g5,	%l1,	%g1
	srax	%o0,	0x1D,	%g4
	fmuld8sux16	%f8,	%f24,	%f30
	movre	%o6,	0x251,	%o1
	mulscc	%o7,	%g3,	%i7
	tvc	%icc,	0x7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%l4
	fcmpd	%fcc0,	%f30,	%f12
	fpsub32	%f14,	%f0,	%f2
	umul	%l5,	%g2,	%i3
	bl,a	%icc,	loop_2860
	mova	%xcc,	%o4,	%o3
	lduw	[%l7 + 0x5C],	%o5
	swap	[%l7 + 0x38],	%i2
loop_2860:
	te	%icc,	0x6
	subc	%o2,	%l0,	%i6
	brgez,a	%l6,	loop_2861
	movpos	%icc,	%i1,	%i5
	ldstub	[%l7 + 0x16],	%i0
	orncc	%l3,	0x1CB9,	%g7
loop_2861:
	movgu	%icc,	%i4,	%g5
	tcc	%xcc,	0x7
	nop
	set	0x4C, %g5
	ldsb	[%l7 + %g5],	%l1
	fand	%f16,	%f14,	%f22
	tn	%xcc,	0x2
	fbe,a	%fcc1,	loop_2862
	srax	%g6,	%o0,	%g1
	subcc	%g4,	%o6,	%o7
	movn	%xcc,	%g3,	%o1
loop_2862:
	fmovde	%icc,	%f11,	%f26
	addccc	%l2,	0x1AF7,	%l4
	array8	%l5,	%g2,	%i7
	edge16	%i3,	%o3,	%o5
	fmovsgu	%xcc,	%f6,	%f27
	alignaddrl	%i2,	%o4,	%o2
	movneg	%icc,	%l0,	%l6
	edge8ln	%i6,	%i1,	%i5
	bn,a,pn	%icc,	loop_2863
	call	loop_2864
	edge32ln	%l3,	%g7,	%i0
	set	0x0E, %o3
	lduha	[%l7 + %o3] 0x18,	%i4
loop_2863:
	nop
	setx	loop_2865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2864:
	sir	0x0EA1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%g5
loop_2865:
	fmovdl	%xcc,	%f27,	%f17
	fnot2s	%f6,	%f9
	movpos	%icc,	%g6,	%o0
	brlez	%l1,	loop_2866
	tcc	%xcc,	0x2
	fandnot1	%f10,	%f22,	%f16
	addccc	%g4,	0x076D,	%g1
loop_2866:
	tg	%icc,	0x5
	fpsub32s	%f8,	%f21,	%f17
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o6
	ta	%icc,	0x5
	sdivcc	%g3,	0x1EF7,	%o7
	mulx	%o1,	%l2,	%l4
	udivx	%l5,	0x1171,	%i7
	fmovscs	%xcc,	%f28,	%f20
	fmovsvs	%xcc,	%f15,	%f15
	array8	%i3,	%o3,	%o5
	sll	%g2,	%i2,	%o2
	set	0x74, %i1
	swapa	[%l7 + %i1] 0x80,	%o4
	ld	[%l7 + 0x7C],	%f6
	fmovrslez	%l0,	%f18,	%f2
	brz	%l6,	loop_2867
	edge16ln	%i1,	%i5,	%l3
	subcc	%i6,	0x157D,	%g7
	fpsub16s	%f2,	%f2,	%f27
loop_2867:
	lduw	[%l7 + 0x40],	%i4
	mulscc	%g5,	0x1790,	%i0
	udivx	%o0,	0x0BA9,	%l1
	movrgz	%g6,	0x179,	%g1
	sir	0x0B8A
	fnegd	%f18,	%f6
	bcs,a,pt	%icc,	loop_2868
	fpsub16	%f16,	%f4,	%f12
	movcc	%xcc,	%o6,	%g3
	alignaddrl	%g4,	%o7,	%l2
loop_2868:
	brgz,a	%l4,	loop_2869
	alignaddr	%l5,	%i7,	%i3
	orn	%o1,	%o3,	%o5
	ldub	[%l7 + 0x77],	%i2
loop_2869:
	ldsw	[%l7 + 0x34],	%g2
	srax	%o4,	%o2,	%l6
	udivcc	%l0,	0x1B56,	%i1
	or	%l3,	0x0698,	%i5
	mova	%xcc,	%g7,	%i6
	fmovsa	%xcc,	%f17,	%f5
	prefetch	[%l7 + 0x68],	 0x0
	fmuld8sux16	%f13,	%f27,	%f14
	set	0x7E, %g6
	stha	%i4,	[%l7 + %g6] 0x88
	fmovscs	%xcc,	%f20,	%f30
	or	%g5,	0x178B,	%i0
	and	%l1,	%o0,	%g1
	fbu,a	%fcc2,	loop_2870
	edge16ln	%o6,	%g3,	%g4
	sdivx	%g6,	0x17D4,	%l2
	fmovdleu	%xcc,	%f12,	%f5
loop_2870:
	movrne	%o7,	%l4,	%l5
	bg,a,pt	%icc,	loop_2871
	edge16n	%i3,	%o1,	%i7
	sub	%o3,	0x1D3F,	%o5
	wr	%g0,	0x81,	%asi
	stxa	%g2,	[%l7 + 0x48] %asi
loop_2871:
	taddcc	%o4,	0x15F1,	%i2
	fbue,a	%fcc0,	loop_2872
	or	%o2,	%l0,	%i1
	fmovdge	%icc,	%f0,	%f2
	ta	%xcc,	0x2
loop_2872:
	srlx	%l6,	0x0C,	%i5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x62] %asi,	%l3
	umulcc	%g7,	0x03AA,	%i4
	membar	0x5F
	edge8l	%g5,	%i6,	%l1
	fands	%f12,	%f26,	%f18
	umul	%o0,	%i0,	%g1
	sethi	0x00E5,	%g3
	xnor	%o6,	%g6,	%l2
	nop
	setx loop_2873, %l0, %l1
	jmpl %l1, %g4
	tcs	%xcc,	0x7
	bvs	%icc,	loop_2874
	edge32n	%o7,	%l5,	%i3
loop_2873:
	movleu	%icc,	%o1,	%i7
	nop
	setx loop_2875, %l0, %l1
	jmpl %l1, %o3
loop_2874:
	movcc	%icc,	%o5,	%l4
	tgu	%icc,	0x7
	movrne	%g2,	%o4,	%i2
loop_2875:
	movl	%xcc,	%o2,	%i1
	fornot2s	%f28,	%f24,	%f9
	set	0x0A, %g1
	lduha	[%l7 + %g1] 0x81,	%l0
	tl	%icc,	0x5
	te	%icc,	0x1
	edge8n	%l6,	%i5,	%l3
	lduh	[%l7 + 0x74],	%g7
	tvc	%icc,	0x1
	movre	%g5,	0x3DD,	%i6
	sllx	%l1,	0x03,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f25,	%f12,	%f14
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i4
	movrne	%g1,	0x3B9,	%g3
	edge8	%i0,	%g6,	%l2
	ldx	[%l7 + 0x58],	%o6
	tcc	%icc,	0x7
	movcc	%xcc,	%g4,	%l5
	movrlez	%o7,	%o1,	%i3
	fmovdvc	%xcc,	%f10,	%f2
	alignaddrl	%i7,	%o5,	%o3
	ba,a	loop_2876
	fmovrse	%l4,	%f5,	%f30
	movrne	%g2,	%i2,	%o2
	andn	%o4,	%l0,	%l6
loop_2876:
	movleu	%icc,	%i1,	%i5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l3
	umul	%g5,	0x1F4E,	%g7
	movrne	%i6,	0x086,	%o0
	movpos	%xcc,	%l1,	%g1
	movg	%icc,	%i4,	%g3
	tl	%xcc,	0x2
	edge16ln	%i0,	%g6,	%l2
	fbne,a	%fcc3,	loop_2877
	ldub	[%l7 + 0x23],	%o6
	movleu	%icc,	%l5,	%g4
	bvs	loop_2878
loop_2877:
	movn	%xcc,	%o7,	%i3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x10,	%i7,	%o5
loop_2878:
	move	%icc,	%o1,	%o3
	call	loop_2879
	movcs	%icc,	%g2,	%l4
	tge	%icc,	0x1
	xnor	%o2,	0x1A72,	%o4
loop_2879:
	ldsb	[%l7 + 0x52],	%i2
	taddcc	%l6,	0x19A2,	%l0
	st	%f13,	[%l7 + 0x6C]
	tpos	%xcc,	0x5
	fbge	%fcc2,	loop_2880
	fnands	%f28,	%f30,	%f2
	tg	%xcc,	0x1
	pdist	%f22,	%f28,	%f2
loop_2880:
	array16	%i1,	%i5,	%l3
	movrgz	%g5,	0x2B9,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g7,	[%l7 + 0x64]
	movpos	%xcc,	%o0,	%g1
	movge	%xcc,	%i4,	%l1
	xnorcc	%i0,	%g6,	%l2
	edge16l	%o6,	%g3,	%l5
	nop
	setx loop_2881, %l0, %l1
	jmpl %l1, %o7
	bcc,a	%xcc,	loop_2882
	movvc	%xcc,	%i3,	%i7
	fbul,a	%fcc0,	loop_2883
loop_2881:
	ld	[%l7 + 0x44],	%f30
loop_2882:
	xnor	%g4,	%o5,	%o3
	orn	%o1,	%l4,	%g2
loop_2883:
	movrgez	%o2,	0x28F,	%o4
	fble	%fcc0,	loop_2884
	movrgez	%l6,	%l0,	%i2
	set	0x66, %i5
	ldsba	[%l7 + %i5] 0x80,	%i1
loop_2884:
	tneg	%xcc,	0x6
	movrgez	%l3,	%g5,	%i6
	umulcc	%i5,	%g7,	%o0
	tcc	%xcc,	0x2
	sdivx	%i4,	0x1C60,	%g1
	tneg	%xcc,	0x4
	or	%l1,	%g6,	%l2
	stbar
	fbe	%fcc0,	loop_2885
	edge8l	%i0,	%o6,	%l5
	movrgz	%o7,	0x24F,	%g3
	edge8ln	%i3,	%i7,	%o5
loop_2885:
	taddcctv	%o3,	%g4,	%o1
	movrgz	%g2,	0x176,	%o2
	movpos	%icc,	%l4,	%o4
	addc	%l6,	%i2,	%i1
	fbn	%fcc1,	loop_2886
	bleu,a	loop_2887
	nop
	setx	loop_2888,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrse	%l0,	%f21,	%f10
loop_2886:
	fcmpeq32	%f4,	%f30,	%l3
loop_2887:
	tneg	%icc,	0x7
loop_2888:
	fmovsle	%icc,	%f20,	%f31
	fornot1s	%f26,	%f3,	%f24
	bneg,a,pn	%xcc,	loop_2889
	smul	%i6,	%i5,	%g7
	fbul,a	%fcc1,	loop_2890
	fandnot2	%f20,	%f30,	%f16
loop_2889:
	movleu	%icc,	%g5,	%o0
	sra	%i4,	0x18,	%g1
loop_2890:
	movrgz	%l1,	%l2,	%g6
	tpos	%icc,	0x5
	tvs	%icc,	0x6
	tne	%icc,	0x3
	fba	%fcc2,	loop_2891
	sethi	0x09B6,	%i0
	movleu	%xcc,	%o6,	%l5
	edge16ln	%g3,	%o7,	%i3
loop_2891:
	membar	0x21
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x46] %asi,	%o5
	tsubcc	%i7,	%g4,	%o3
	bl,a	%icc,	loop_2892
	array8	%g2,	%o1,	%l4
	tg	%xcc,	0x5
	fnors	%f23,	%f17,	%f9
loop_2892:
	edge32	%o4,	%l6,	%i2
	edge32l	%o2,	%i1,	%l0
	taddcc	%l3,	0x1269,	%i5
	pdist	%f14,	%f12,	%f30
	nop
	setx loop_2893, %l0, %l1
	jmpl %l1, %g7
	fmovrdgz	%g5,	%f4,	%f14
	brgz	%i6,	loop_2894
	mova	%xcc,	%o0,	%i4
loop_2893:
	fmovdpos	%icc,	%f28,	%f26
	tneg	%xcc,	0x0
loop_2894:
	edge8	%l1,	%g1,	%g6
	array16	%l2,	%o6,	%l5
	sra	%g3,	0x01,	%i0
	fbule,a	%fcc0,	loop_2895
	umulcc	%i3,	%o5,	%o7
	edge8n	%i7,	%o3,	%g2
	tgu	%icc,	0x4
loop_2895:
	bvc	%xcc,	loop_2896
	array8	%o1,	%l4,	%o4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x18] %asi,	%g4
loop_2896:
	brgz,a	%l6,	loop_2897
	sllx	%i2,	0x1A,	%o2
	movgu	%icc,	%l0,	%l3
	array32	%i1,	%i5,	%g5
loop_2897:
	xor	%g7,	%o0,	%i6
	prefetch	[%l7 + 0x18],	 0x0
	fmovrse	%l1,	%f17,	%f0
	tcs	%xcc,	0x2
	movg	%icc,	%i4,	%g6
	tl	%icc,	0x3
	fmovsne	%icc,	%f22,	%f13
	te	%icc,	0x5
	sdivx	%g1,	0x13FA,	%l2
	mulx	%o6,	0x15BD,	%l5
	tl	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%g3,	loop_2898
	srlx	%i0,	0x18,	%i3
	fbu,a	%fcc0,	loop_2899
	bvc,a	%icc,	loop_2900
loop_2898:
	fpadd16	%f2,	%f8,	%f22
	stw	%o7,	[%l7 + 0x14]
loop_2899:
	te	%icc,	0x7
loop_2900:
	movrgz	%o5,	%i7,	%g2
	fpack32	%f6,	%f4,	%f22
	set	0x77, %l5
	ldsba	[%l7 + %l5] 0x81,	%o1
	wr	%g0,	0x11,	%asi
	stda	%l4,	[%l7 + 0x10] %asi
	movvc	%xcc,	%o4,	%g4
	udiv	%o3,	0x0762,	%i2
	movrlz	%l6,	%l0,	%l3
	umulcc	%o2,	%i5,	%g5
	movn	%xcc,	%g7,	%o0
	taddcc	%i1,	0x1D3F,	%i6
	fsrc2s	%f16,	%f5
	lduw	[%l7 + 0x20],	%l1
	bne,a,pn	%icc,	loop_2901
	movn	%xcc,	%g6,	%i4
	fnand	%f6,	%f16,	%f8
	fbo	%fcc0,	loop_2902
loop_2901:
	ba,a	%icc,	loop_2903
	bcs,a	%icc,	loop_2904
	ldsw	[%l7 + 0x4C],	%l2
loop_2902:
	fandnot1	%f30,	%f12,	%f14
loop_2903:
	std	%g0,	[%l7 + 0x10]
loop_2904:
	or	%l5,	%g3,	%o6
	fmovse	%icc,	%f11,	%f30
	tl	%icc,	0x0
	stbar
	sdivx	%i3,	0x0319,	%o7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o5
	set	0x60, %g2
	stwa	%i7,	[%l7 + %g2] 0xe3
	membar	#Sync
	fmovdvs	%xcc,	%f17,	%f9
	fble	%fcc3,	loop_2905
	tsubcc	%i0,	%o1,	%l4
	edge32ln	%g2,	%g4,	%o3
	bvc,a,pn	%icc,	loop_2906
loop_2905:
	fpsub32	%f22,	%f10,	%f30
	fmovrdgz	%o4,	%f16,	%f22
	movcs	%icc,	%i2,	%l0
loop_2906:
	ldsh	[%l7 + 0x70],	%l3
	tneg	%xcc,	0x5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x38] %asi,	%l6
	movneg	%icc,	%i5,	%g5
	tpos	%xcc,	0x3
	sdivx	%o2,	0x1D1A,	%g7
	movl	%icc,	%o0,	%i6
	move	%xcc,	%i1,	%g6
	stx	%l1,	[%l7 + 0x50]
	tcs	%icc,	0x3
	fnot1	%f30,	%f28
	fpadd16	%f22,	%f12,	%f26
	fornot1	%f22,	%f6,	%f10
	tne	%icc,	0x6
	orcc	%l2,	0x186E,	%g1
	te	%icc,	0x2
	edge16l	%l5,	%g3,	%o6
	srax	%i4,	0x08,	%o7
	array8	%i3,	%i7,	%o5
	smul	%i0,	0x08B0,	%o1
	srlx	%l4,	%g4,	%o3
	taddcc	%g2,	0x0E34,	%o4
	wr	%g0,	0x27,	%asi
	stxa	%l0,	[%l7 + 0x28] %asi
	membar	#Sync
	fors	%f4,	%f27,	%f11
	tge	%icc,	0x7
	fmul8x16au	%f20,	%f7,	%f4
	tpos	%icc,	0x5
	fornot2s	%f24,	%f8,	%f3
	movgu	%xcc,	%l3,	%i2
	edge8	%l6,	%g5,	%i5
	wr	%g0,	0x11,	%asi
	stba	%g7,	[%l7 + 0x13] %asi
	ldstub	[%l7 + 0x12],	%o2
	prefetch	[%l7 + 0x54],	 0x3
	membar	0x2C
	fbge,a	%fcc1,	loop_2907
	edge8	%i6,	%o0,	%i1
	brlz,a	%l1,	loop_2908
	movcc	%xcc,	%g6,	%g1
loop_2907:
	tcc	%xcc,	0x1
	taddcc	%l5,	0x1C4A,	%g3
loop_2908:
	tleu	%xcc,	0x7
	fmovdleu	%xcc,	%f14,	%f10
	movge	%icc,	%l2,	%i4
	sub	%o6,	%o7,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o5,	%i0,	%i3
	fzero	%f30
	fmuld8sux16	%f1,	%f7,	%f12
	movleu	%icc,	%o1,	%l4
	tgu	%icc,	0x0
	edge8ln	%o3,	%g4,	%o4
	movcc	%xcc,	%l0,	%g2
	movre	%l3,	%l6,	%g5
	tne	%xcc,	0x4
	xorcc	%i2,	%i5,	%g7
	fcmpne16	%f30,	%f20,	%i6
	fpadd32	%f10,	%f30,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x0
	xnorcc	%o0,	0x1D17,	%o2
	sdivcc	%i1,	0x0476,	%l1
	srl	%g1,	0x0B,	%l5
	fpsub16	%f30,	%f14,	%f10
	edge32n	%g6,	%l2,	%g3
	fabsd	%f6,	%f10
	edge32l	%i4,	%o6,	%o7
	andcc	%i7,	0x05A7,	%i0
	tpos	%xcc,	0x1
	tgu	%icc,	0x7
	or	%o5,	0x1731,	%o1
	edge8	%l4,	%o3,	%g4
	sdivcc	%i3,	0x062A,	%l0
	fmovrslez	%g2,	%f2,	%f4
	edge16	%o4,	%l6,	%l3
	fbn,a	%fcc1,	loop_2909
	edge32n	%i2,	%g5,	%i5
	fpadd16	%f0,	%f6,	%f0
	tn	%xcc,	0x2
loop_2909:
	movcs	%icc,	%g7,	%o0
	andcc	%i6,	%o2,	%i1
	array16	%l1,	%g1,	%l5
	edge16	%g6,	%l2,	%i4
	bgu	%icc,	loop_2910
	fmovrdlz	%g3,	%f18,	%f24
	umul	%o6,	0x1D29,	%i7
	movrgz	%i0,	0x09C,	%o5
loop_2910:
	smulcc	%o1,	%o7,	%o3
	alignaddrl	%l4,	%g4,	%i3
	and	%g2,	%o4,	%l6
	fandnot2	%f24,	%f4,	%f24
	edge16l	%l3,	%l0,	%i2
	sll	%i5,	%g7,	%o0
	brnz,a	%i6,	loop_2911
	xorcc	%o2,	%g5,	%l1
	tvc	%xcc,	0x6
	fpackfix	%f20,	%f14
loop_2911:
	fbe	%fcc3,	loop_2912
	tvc	%icc,	0x4
	xnor	%g1,	%i1,	%l5
	xnor	%g6,	%i4,	%l2
loop_2912:
	movg	%icc,	%o6,	%g3
	andncc	%i7,	%o5,	%i0
	brgez,a	%o7,	loop_2913
	ble,a	loop_2914
	bn,a,pt	%xcc,	loop_2915
	edge32l	%o1,	%o3,	%l4
loop_2913:
	fbo	%fcc3,	loop_2916
loop_2914:
	fbl,a	%fcc1,	loop_2917
loop_2915:
	fcmpne32	%f16,	%f26,	%g4
	tge	%icc,	0x1
loop_2916:
	edge16ln	%i3,	%o4,	%g2
loop_2917:
	subccc	%l3,	0x1982,	%l0
	movg	%xcc,	%i2,	%l6
	orncc	%i5,	0x0994,	%o0
	ldsw	[%l7 + 0x50],	%i6
	fmovsl	%icc,	%f8,	%f7
	xorcc	%g7,	%g5,	%o2
	movrlez	%g1,	%l1,	%l5
	srax	%i1,	0x01,	%i4
	tleu	%icc,	0x5
	tvc	%icc,	0x1
	umul	%l2,	%o6,	%g3
	movneg	%icc,	%g6,	%o5
	fnot2s	%f13,	%f2
	movrgez	%i0,	%o7,	%o1
	fmovsge	%icc,	%f9,	%f0
	sll	%i7,	%l4,	%g4
	movle	%icc,	%i3,	%o3
	movg	%icc,	%g2,	%l3
	movrlez	%l0,	0x14F,	%o4
	sllx	%i2,	0x0B,	%l6
	taddcctv	%o0,	%i5,	%i6
	tsubcctv	%g5,	%o2,	%g7
	sll	%l1,	0x10,	%l5
	fnands	%f19,	%f15,	%f3
	tneg	%icc,	0x3
	bgu	loop_2918
	addcc	%i1,	0x0654,	%i4
	subcc	%g1,	0x0D3D,	%o6
	movpos	%xcc,	%l2,	%g3
loop_2918:
	movcc	%xcc,	%o5,	%i0
	edge16n	%o7,	%o1,	%i7
	nop
	setx loop_2919, %l0, %l1
	jmpl %l1, %g6
	sub	%l4,	%g4,	%o3
	prefetch	[%l7 + 0x48],	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2919:
	udivcc	%i3,	0x076B,	%l3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	membar	0x5A
	fnot1	%f0,	%f30
	sdivcc	%g2,	0x1427,	%i2
	fmovrse	%l6,	%f13,	%f0
	srl	%o0,	0x05,	%o4
	edge16	%i6,	%g5,	%o2
	fnors	%f12,	%f22,	%f12
	srax	%i5,	%g7,	%l1
	edge8ln	%i1,	%l5,	%g1
	fornot2	%f30,	%f28,	%f0
	edge8ln	%o6,	%l2,	%g3
	fpadd32	%f22,	%f24,	%f6
	movvs	%xcc,	%i4,	%i0
	taddcctv	%o7,	0x0DA7,	%o1
	ldd	[%l7 + 0x30],	%f30
	alignaddr	%i7,	%g6,	%o5
	fmovrsne	%g4,	%f30,	%f5
	tvc	%xcc,	0x1
	set	0x26, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l4
	subc	%i3,	%o3,	%l3
	umul	%l0,	%i2,	%l6
	tvs	%icc,	0x1
	fpsub32	%f20,	%f2,	%f14
	xnorcc	%g2,	%o0,	%i6
	ldsh	[%l7 + 0x4E],	%o4
	fmovrsne	%o2,	%f21,	%f26
	tg	%xcc,	0x7
	udiv	%g5,	0x0844,	%g7
	bne,pn	%xcc,	loop_2920
	mulx	%i5,	%l1,	%i1
	movcs	%icc,	%g1,	%l5
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%l2
loop_2920:
	smul	%o6,	0x18F4,	%i4
	mulx	%i0,	%g3,	%o1
	alignaddrl	%i7,	%o7,	%g6
	fmovrslez	%o5,	%f7,	%f11
	srlx	%l4,	0x1B,	%i3
	fblg,a	%fcc2,	loop_2921
	movrlez	%o3,	0x0A4,	%g4
	ldub	[%l7 + 0x29],	%l0
	umul	%l3,	0x13B8,	%i2
loop_2921:
	fxnor	%f0,	%f24,	%f22
	fmovsge	%icc,	%f26,	%f3
	movle	%xcc,	%g2,	%o0
	sir	0x0E55
	ldsh	[%l7 + 0x0A],	%l6
	bgu,a	loop_2922
	edge8	%o4,	%o2,	%g5
	movrgz	%g7,	%i5,	%l1
	movg	%xcc,	%i1,	%i6
loop_2922:
	sra	%g1,	0x0F,	%l2
	bl,pn	%xcc,	loop_2923
	fornot1s	%f27,	%f20,	%f29
	ldub	[%l7 + 0x58],	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i4,	%i0
loop_2923:
	addccc	%l5,	%o1,	%g3
	popc	0x0EA0,	%o7
	fmovrdgez	%i7,	%f0,	%f30
	tle	%xcc,	0x5
	fcmpes	%fcc2,	%f3,	%f24
	udivcc	%g6,	0x1A31,	%l4
	edge8	%o5,	%o3,	%g4
	ldsb	[%l7 + 0x46],	%i3
	movrgez	%l3,	0x0AF,	%l0
	taddcctv	%i2,	%o0,	%g2
	fand	%f20,	%f24,	%f18
	edge8	%l6,	%o4,	%o2
	ba,a	%icc,	loop_2924
	movvs	%xcc,	%g5,	%g7
	call	loop_2925
	fmovsge	%icc,	%f15,	%f5
loop_2924:
	ldub	[%l7 + 0x1C],	%l1
	movpos	%xcc,	%i1,	%i6
loop_2925:
	smulcc	%g1,	%l2,	%i5
	movge	%icc,	%o6,	%i0
	popc	%l5,	%o1
	tg	%icc,	0x1
	bvs	loop_2926
	ldx	[%l7 + 0x40],	%i4
	subccc	%g3,	%o7,	%g6
	te	%icc,	0x3
loop_2926:
	fandnot2s	%f0,	%f28,	%f8
	tge	%xcc,	0x1
	fmovrdgez	%i7,	%f22,	%f10
	movle	%xcc,	%o5,	%o3
	xor	%l4,	%g4,	%l3
	smul	%i3,	0x1453,	%i2
	tsubcctv	%l0,	0x1295,	%g2
	fandnot1	%f12,	%f16,	%f28
	addc	%o0,	%o4,	%l6
	tge	%icc,	0x5
	bl,a	loop_2927
	srlx	%o2,	%g7,	%g5
	movcc	%icc,	%l1,	%i6
	fba	%fcc2,	loop_2928
loop_2927:
	udiv	%g1,	0x081B,	%i1
	movgu	%icc,	%i5,	%o6
	alignaddr	%l2,	%i0,	%o1
loop_2928:
	edge8n	%i4,	%l5,	%o7
	sdiv	%g6,	0x16D6,	%g3
	sll	%o5,	0x0C,	%o3
	tgu	%xcc,	0x2
	fnegs	%f18,	%f7
	tpos	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l4
	tsubcctv	%i7,	0x1065,	%g4
	sdivx	%l3,	0x11D2,	%i3
	fornot2s	%f8,	%f6,	%f20
	set	0x78, %l6
	prefetcha	[%l7 + %l6] 0x0c,	 0x3
	fpadd32s	%f26,	%f13,	%f0
	set	0x30, %i7
	stxa	%g2,	[%l7 + %i7] 0x88
	set	0x7C, %g7
	stwa	%o0,	[%l7 + %g7] 0x2a
	membar	#Sync
	te	%xcc,	0x3
	fand	%f18,	%f4,	%f0
	tcc	%xcc,	0x7
	fornot2s	%f30,	%f10,	%f12
	flush	%l7 + 0x30
	edge32ln	%o4,	%l6,	%o2
	fmul8ulx16	%f24,	%f28,	%f18
	udivx	%i2,	0x0D58,	%g5
	addc	%g7,	0x0A47,	%l1
	udivcc	%g1,	0x12E7,	%i6
	srax	%i1,	0x1B,	%o6
	movgu	%xcc,	%i5,	%l2
	mulscc	%o1,	%i4,	%i0
	fors	%f24,	%f8,	%f12
	fmovrslez	%o7,	%f4,	%f25
	bleu,a,pn	%icc,	loop_2929
	udivcc	%l5,	0x1358,	%g6
	fpadd16s	%f21,	%f4,	%f5
	movne	%icc,	%g3,	%o5
loop_2929:
	or	%l4,	%i7,	%o3
	fmovrsne	%g4,	%f6,	%f19
	xnorcc	%i3,	%l0,	%g2
	or	%l3,	0x1F54,	%o4
	addc	%o0,	%o2,	%i2
	movrlz	%g5,	0x2CA,	%g7
	fxor	%f12,	%f30,	%f0
	fmovdne	%icc,	%f4,	%f19
	smulcc	%l6,	0x1378,	%l1
	fmovdvs	%xcc,	%f16,	%f7
	fcmpgt16	%f10,	%f22,	%g1
	orn	%i6,	%o6,	%i1
	tcs	%icc,	0x4
	sdivcc	%i5,	0x0210,	%o1
	or	%l2,	0x0235,	%i4
	fabsd	%f12,	%f6
	sllx	%i0,	%o7,	%g6
	fzeros	%f19
	sdiv	%l5,	0x1E25,	%o5
	movrne	%g3,	0x088,	%i7
	fmovrsgz	%o3,	%f20,	%f31
	fpadd32	%f26,	%f4,	%f30
	orncc	%l4,	0x0D5F,	%i3
	mulx	%l0,	%g4,	%g2
	fpmerge	%f23,	%f7,	%f26
	fmovsl	%xcc,	%f8,	%f13
	fbule,a	%fcc2,	loop_2930
	fandnot2	%f6,	%f4,	%f12
	add	%o4,	0x1AB3,	%o0
	bl	%icc,	loop_2931
loop_2930:
	ldstub	[%l7 + 0x73],	%o2
	sll	%i2,	0x12,	%l3
	set	0x10, %g3
	sta	%f10,	[%l7 + %g3] 0x14
loop_2931:
	edge16l	%g5,	%l6,	%g7
	stbar
	udiv	%g1,	0x0358,	%i6
	tcc	%icc,	0x7
	taddcctv	%o6,	0x05A4,	%i1
	lduw	[%l7 + 0x78],	%i5
	ble,a,pn	%xcc,	loop_2932
	udiv	%l1,	0x044B,	%o1
	wr	%g0,	0x81,	%asi
	sta	%f19,	[%l7 + 0x40] %asi
loop_2932:
	array32	%i4,	%i0,	%l2
	mova	%icc,	%g6,	%l5
	fmovse	%xcc,	%f18,	%f21
	array32	%o7,	%g3,	%i7
	movrgz	%o5,	%l4,	%o3
	fmuld8sux16	%f10,	%f25,	%f2
	subcc	%l0,	0x169C,	%g4
	ldd	[%l7 + 0x10],	%g2
	edge8n	%i3,	%o0,	%o4
	fbg,a	%fcc2,	loop_2933
	fbug,a	%fcc2,	loop_2934
	subccc	%o2,	%i2,	%l3
	fmovdcs	%icc,	%f16,	%f4
loop_2933:
	fble	%fcc1,	loop_2935
loop_2934:
	edge32ln	%l6,	%g5,	%g7
	fsrc2s	%f10,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2935:
	ta	%icc,	0x0
	movge	%icc,	%i6,	%g1
	nop
	setx	loop_2936,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%i1,	%i5,	%l1
	add	%o1,	0x0FB1,	%o6
	bcs,pn	%xcc,	loop_2937
loop_2936:
	tsubcctv	%i0,	0x0288,	%l2
	sdiv	%g6,	0x02B8,	%i4
	sll	%l5,	0x00,	%g3
loop_2937:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	fmovrdgez	%i7,	%f6,	%f10
	tcc	%icc,	0x2
	movrlz	%o5,	0x2B7,	%o3
	edge32ln	%l0,	%g4,	%l4
	fexpand	%f24,	%f16
	add	%i3,	0x0D72,	%o0
	sdiv	%g2,	0x15FA,	%o4
	subcc	%o2,	%l3,	%i2
	movn	%icc,	%l6,	%g5
	movle	%icc,	%g7,	%g1
	brnz	%i1,	loop_2938
	fxnor	%f28,	%f4,	%f30
	edge16l	%i6,	%l1,	%o1
	fpadd16s	%f14,	%f3,	%f21
loop_2938:
	movgu	%xcc,	%i5,	%i0
	array16	%o6,	%l2,	%g6
	ta	%icc,	0x4
	sdivcc	%i4,	0x1832,	%g3
	fcmple16	%f12,	%f8,	%l5
	sdiv	%o7,	0x00F8,	%i7
	andn	%o3,	0x02B3,	%o5
	fpadd16	%f4,	%f24,	%f4
	fmovsvs	%xcc,	%f22,	%f17
	edge8ln	%l0,	%l4,	%i3
	fmovspos	%xcc,	%f12,	%f20
	edge16	%g4,	%g2,	%o0
	xnorcc	%o4,	0x05C3,	%o2
	movg	%xcc,	%i2,	%l6
	stb	%g5,	[%l7 + 0x25]
	fnot1	%f2,	%f30
	movneg	%xcc,	%l3,	%g1
	fzero	%f8
	fors	%f11,	%f26,	%f29
	tleu	%xcc,	0x0
	bgu,a	loop_2939
	fzeros	%f4
	orn	%g7,	0x05BB,	%i6
	set	0x1C, %i0
	lduwa	[%l7 + %i0] 0x04,	%l1
loop_2939:
	lduw	[%l7 + 0x38],	%i1
	bge	loop_2940
	mova	%icc,	%o1,	%i5
	taddcc	%i0,	0x12FA,	%o6
	move	%icc,	%g6,	%l2
loop_2940:
	sdiv	%g3,	0x11C4,	%l5
	flush	%l7 + 0x7C
	movn	%xcc,	%o7,	%i7
	set	0x38, %l4
	ldsba	[%l7 + %l4] 0x11,	%i4
	lduw	[%l7 + 0x3C],	%o3
	movvs	%icc,	%l0,	%o5
	fmovdn	%xcc,	%f18,	%f21
	taddcc	%i3,	0x09B9,	%g4
	fmovse	%icc,	%f17,	%f23
	fmovdg	%icc,	%f31,	%f23
	srlx	%g2,	0x1A,	%o0
	smulcc	%l4,	0x07F2,	%o2
	tcc	%xcc,	0x2
	bvs,a	loop_2941
	fandnot1s	%f14,	%f29,	%f20
	ldsb	[%l7 + 0x1F],	%o4
	movrlz	%i2,	%g5,	%l6
loop_2941:
	nop
	set	0x40, %o5
	sta	%f16,	[%l7 + %o5] 0x14
	tle	%icc,	0x0
	tn	%icc,	0x6
	mulx	%g1,	%l3,	%i6
	brlz,a	%l1,	loop_2942
	srax	%i1,	0x1A,	%g7
	tcc	%icc,	0x3
	edge8l	%o1,	%i0,	%o6
loop_2942:
	movcc	%icc,	%g6,	%i5
	taddcctv	%l2,	%g3,	%o7
	sdiv	%l5,	0x18A7,	%i4
	movgu	%xcc,	%i7,	%l0
	movcs	%icc,	%o5,	%i3
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
	edge16n	%g4,	%o3,	%g2
	add	%l4,	0x056A,	%o0
	ldx	[%l7 + 0x30],	%o4
loop_2943:
	movre	%i2,	%g5,	%o2
	fmovdvs	%xcc,	%f18,	%f7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g1,	%l6
	movneg	%xcc,	%l3,	%l1
	popc	0x0894,	%i6
	tvs	%icc,	0x2
	edge16n	%g7,	%o1,	%i0
	fbn,a	%fcc1,	loop_2944
	fsrc2	%f26,	%f28
	movge	%xcc,	%i1,	%g6
	movne	%xcc,	%o6,	%i5
loop_2944:
	ble,a	%xcc,	loop_2945
	tg	%xcc,	0x0
	orcc	%l2,	0x1633,	%g3
	addc	%o7,	%i4,	%i7
loop_2945:
	lduw	[%l7 + 0x0C],	%l5
	ba	loop_2946
	andn	%o5,	0x0455,	%i3
	andn	%l0,	0x0DFC,	%g4
	ldd	[%l7 + 0x78],	%o2
loop_2946:
	orn	%l4,	%o0,	%g2
	faligndata	%f16,	%f30,	%f6
	fmovrdlez	%o4,	%f6,	%f26
	set	0x2E, %o0
	stha	%i2,	[%l7 + %o0] 0x14
	tge	%icc,	0x1
	xorcc	%g5,	%o2,	%l6
	membar	0x68
	movle	%icc,	%l3,	%l1
	fpadd32s	%f25,	%f29,	%f5
	fmovrslez	%g1,	%f30,	%f23
	tvs	%xcc,	0x5
	tgu	%xcc,	0x3
	orcc	%g7,	%o1,	%i0
	brlez	%i1,	loop_2947
	taddcc	%g6,	%o6,	%i6
	mulscc	%i5,	0x1CF8,	%g3
	smulcc	%l2,	%o7,	%i4
loop_2947:
	for	%f0,	%f24,	%f20
	fmovd	%f18,	%f6
	edge32n	%l5,	%i7,	%i3
	fcmpeq16	%f18,	%f28,	%l0
	sub	%g4,	%o3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l4,	0x1F,	%o0
	set	0x6A, %o1
	stha	%o4,	[%l7 + %o1] 0x04
	fmovdcs	%xcc,	%f1,	%f17
	fbl,a	%fcc2,	loop_2948
	fmovsgu	%xcc,	%f12,	%f23
	fnegd	%f28,	%f2
	fabss	%f2,	%f1
loop_2948:
	tvc	%xcc,	0x4
	fmovdne	%icc,	%f21,	%f17
	wr	%g0,	0x22,	%asi
	stba	%i2,	[%l7 + 0x70] %asi
	membar	#Sync
	movneg	%icc,	%g5,	%o2
	lduh	[%l7 + 0x4C],	%l6
	tsubcc	%g2,	%l3,	%g1
	fmovrdlz	%g7,	%f6,	%f8
	smulcc	%o1,	%l1,	%i1
	flush	%l7 + 0x74
	fmovde	%xcc,	%f27,	%f10
	addc	%i0,	0x1271,	%o6
	ldsh	[%l7 + 0x62],	%i6
	fmovrsgz	%g6,	%f8,	%f24
	fbuge,a	%fcc3,	loop_2949
	tleu	%xcc,	0x0
	edge16	%i5,	%l2,	%g3
	fcmped	%fcc0,	%f30,	%f14
loop_2949:
	tge	%xcc,	0x1
	fornot1	%f28,	%f10,	%f2
	edge8l	%o7,	%i4,	%l5
	edge16n	%i3,	%l0,	%i7
	bl,pn	%xcc,	loop_2950
	fmovsl	%icc,	%f11,	%f17
	bpos,a,pn	%xcc,	loop_2951
	tvs	%icc,	0x4
loop_2950:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x64] %asi
loop_2951:
	movleu	%xcc,	%o3,	%g4
	fcmpne32	%f2,	%f6,	%l4
	mova	%xcc,	%o5,	%o0
	fmovrse	%o4,	%f29,	%f12
	edge8	%g5,	%o2,	%l6
	movrgez	%i2,	%g2,	%l3
	fmovsleu	%icc,	%f7,	%f10
	xnorcc	%g7,	0x0AF7,	%g1
	edge8l	%o1,	%i1,	%l1
	brz	%o6,	loop_2952
	fxor	%f26,	%f8,	%f14
	fxnors	%f15,	%f11,	%f2
	ta	%xcc,	0x1
loop_2952:
	andn	%i6,	%i0,	%i5
	wr	%g0,	0x27,	%asi
	stxa	%l2,	[%l7 + 0x40] %asi
	membar	#Sync
	popc	%g6,	%o7
	addc	%g3,	%l5,	%i4
	ldsw	[%l7 + 0x0C],	%l0
	movvc	%icc,	%i3,	%o3
	fbo	%fcc0,	loop_2953
	xnorcc	%i7,	%l4,	%g4
	fmovrde	%o0,	%f18,	%f6
	nop
	set	0x20, %l3
	stx	%o4,	[%l7 + %l3]
loop_2953:
	fbge,a	%fcc1,	loop_2954
	fbg	%fcc0,	loop_2955
	fblg	%fcc3,	loop_2956
	ldstub	[%l7 + 0x71],	%g5
loop_2954:
	udivcc	%o2,	0x1CB6,	%l6
loop_2955:
	taddcctv	%o5,	0x10DD,	%i2
loop_2956:
	xor	%g2,	0x1F13,	%g7
	nop
	setx	loop_2957,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%xcc,	0x6
	fmovsne	%icc,	%f24,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2957:
	fmovdpos	%icc,	%f27,	%f25
	fpadd16	%f0,	%f16,	%f10
	taddcc	%g1,	%o1,	%i1
	movrgz	%l3,	0x09D,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f10
	xnorcc	%i6,	%l1,	%i0
	fsrc1s	%f26,	%f4
	ble,a	loop_2958
	sra	%l2,	%i5,	%o7
	set	0x60, %i3
	stda	%g6,	[%l7 + %i3] 0x19
loop_2958:
	nop
	setx loop_2959, %l0, %l1
	jmpl %l1, %l5
	tneg	%icc,	0x7
	movrlz	%i4,	0x271,	%l0
	xor	%g3,	0x182A,	%i3
loop_2959:
	umulcc	%o3,	0x0350,	%l4
	subccc	%g4,	%i7,	%o0
	movrgez	%o4,	%o2,	%l6
	fble	%fcc1,	loop_2960
	movleu	%xcc,	%g5,	%o5
	membar	0x0B
	bge,a,pt	%xcc,	loop_2961
loop_2960:
	alignaddr	%i2,	%g7,	%g1
	fnot1	%f12,	%f28
	tl	%icc,	0x2
loop_2961:
	fands	%f26,	%f2,	%f20
	movge	%icc,	%g2,	%i1
	fmovrdgez	%o1,	%f28,	%f26
	add	%l3,	%i6,	%l1
	fmovsne	%icc,	%f26,	%f22
	ldub	[%l7 + 0x6F],	%i0
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%o6
	movvs	%icc,	%l2,	%i5
	sra	%g6,	0x02,	%l5
	tge	%xcc,	0x3
	addccc	%i4,	0x0A80,	%l0
	fbn	%fcc3,	loop_2962
	tvs	%xcc,	0x4
	movrlez	%o7,	%g3,	%i3
	fbn	%fcc2,	loop_2963
loop_2962:
	add	%l4,	%o3,	%g4
	wr	%g0,	0x23,	%asi
	stwa	%o0,	[%l7 + 0x10] %asi
	membar	#Sync
loop_2963:
	brnz,a	%i7,	loop_2964
	edge16l	%o2,	%l6,	%o4
	xnor	%o5,	0x0724,	%g5
	te	%icc,	0x1
loop_2964:
	movgu	%icc,	%g7,	%i2
	movrne	%g1,	%g2,	%o1
	tcs	%icc,	0x1
	xnor	%l3,	0x1262,	%i6
	tsubcctv	%l1,	0x056C,	%i0
	fbuge,a	%fcc2,	loop_2965
	subccc	%o6,	0x0226,	%i1
	tne	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x6D] %asi,	%i5
loop_2965:
	fcmpd	%fcc1,	%f30,	%f14
	edge32ln	%g6,	%l5,	%l2
	fsrc1s	%f24,	%f20
	ldsw	[%l7 + 0x44],	%l0
	fcmpes	%fcc2,	%f11,	%f13
	fcmpgt16	%f22,	%f8,	%o7
	stx	%i4,	[%l7 + 0x40]
	tl	%icc,	0x7
	sra	%i3,	%g3,	%l4
	set	0x08, %l2
	stwa	%g4,	[%l7 + %l2] 0xeb
	membar	#Sync
	movn	%xcc,	%o3,	%o0
	edge8ln	%o2,	%l6,	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x19,	%o4,	%g5
	wr	%g0,	0x4f,	%asi
	stxa	%g7,	[%g0 + 0x30] %asi
	tsubcc	%i2,	%o5,	%g2
	movgu	%xcc,	%g1,	%o1
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movgu	%xcc,	%i6,	%l1
	wr	%g0,	0x2a,	%asi
	stha	%i0,	[%l7 + 0x56] %asi
	membar	#Sync
	tleu	%xcc,	0x3
	movcc	%xcc,	%l3,	%o6
	sdivx	%i1,	0x1AFA,	%g6
	wr	%g0,	0x10,	%asi
	stda	%i4,	[%l7 + 0x38] %asi
	alignaddrl	%l2,	%l5,	%o7
	movg	%xcc,	%i4,	%i3
	movleu	%xcc,	%l0,	%l4
	fones	%f1
	sllx	%g3,	%o3,	%g4
	addc	%o2,	%l6,	%o0
	subccc	%i7,	0x1FB6,	%o4
	fba	%fcc2,	loop_2966
	movl	%icc,	%g7,	%g5
	edge8l	%o5,	%i2,	%g1
	edge32ln	%g2,	%o1,	%i6
loop_2966:
	edge16l	%l1,	%i0,	%o6
	sra	%i1,	%g6,	%l3
	tne	%xcc,	0x0
	fpadd32	%f22,	%f28,	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%l2
	orncc	%o7,	%l5,	%i3
	tleu	%xcc,	0x6
	move	%icc,	%l0,	%i4
	bpos,a,pt	%xcc,	loop_2967
	tle	%icc,	0x2
	array8	%g3,	%o3,	%g4
	ble,pt	%xcc,	loop_2968
loop_2967:
	add	%o2,	%l4,	%o0
	fmovdvs	%xcc,	%f9,	%f10
	bcc,a,pn	%icc,	loop_2969
loop_2968:
	movrgz	%i7,	%l6,	%o4
	brlez,a	%g7,	loop_2970
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2969:
	tpos	%xcc,	0x5
	umulcc	%g5,	%o5,	%i2
loop_2970:
	edge16l	%g2,	%g1,	%i6
	addc	%l1,	0x1B97,	%o1
	edge32l	%i0,	%i1,	%o6
	orcc	%l3,	0x1252,	%i5
	movrlez	%g6,	0x0C1,	%l2
	tgu	%xcc,	0x5
	fbo	%fcc3,	loop_2971
	bgu	loop_2972
	ldsb	[%l7 + 0x75],	%o7
	te	%icc,	0x4
loop_2971:
	fbn,a	%fcc2,	loop_2973
loop_2972:
	fmovde	%icc,	%f30,	%f26
	fmovrslz	%i3,	%f26,	%f17
	swap	[%l7 + 0x48],	%l5
loop_2973:
	udivcc	%l0,	0x0802,	%g3
	ldstub	[%l7 + 0x19],	%o3
	fblg,a	%fcc0,	loop_2974
	sir	0x133B
	fornot1	%f8,	%f28,	%f2
	add	%g4,	0x0CD7,	%o2
loop_2974:
	fmovscs	%xcc,	%f22,	%f7
	fble,a	%fcc3,	loop_2975
	fble	%fcc0,	loop_2976
	fzero	%f4
	alignaddrl	%i4,	%l4,	%i7
loop_2975:
	tcc	%icc,	0x1
loop_2976:
	fornot2	%f26,	%f16,	%f4
	tg	%xcc,	0x1
	umul	%l6,	%o4,	%o0
	wr	%g0,	0xe3,	%asi
	stba	%g5,	[%l7 + 0x17] %asi
	membar	#Sync
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x04
	edge32l	%g7,	%i2,	%g2
	fmovsneg	%xcc,	%f12,	%f2
	fmovda	%icc,	%f6,	%f11
	edge16l	%o5,	%g1,	%i6
	addccc	%l1,	%o1,	%i1
	fcmpd	%fcc3,	%f4,	%f24
	srax	%i0,	0x19,	%o6
	and	%i5,	0x147B,	%l3
	tneg	%xcc,	0x0
	tn	%icc,	0x0
	movcs	%xcc,	%l2,	%g6
	tvs	%icc,	0x0
	sub	%o7,	%i3,	%l0
	fxors	%f12,	%f1,	%f12
	taddcc	%g3,	%l5,	%o3
	wr	%g0,	0x18,	%asi
	stda	%g4,	[%l7 + 0x60] %asi
	movrne	%i4,	0x3CF,	%o2
	fbne,a	%fcc1,	loop_2977
	fcmpne32	%f24,	%f0,	%l4
	sdivx	%i7,	0x1FF9,	%l6
	movl	%xcc,	%o0,	%g5
loop_2977:
	edge16	%o4,	%g7,	%g2
	movre	%i2,	0x282,	%g1
	fcmpeq16	%f26,	%f22,	%o5
	edge16ln	%i6,	%l1,	%o1
	fmovsne	%xcc,	%f1,	%f19
	tgu	%xcc,	0x6
	smulcc	%i0,	0x1997,	%i1
	tvc	%xcc,	0x2
	tgu	%icc,	0x0
	tgu	%xcc,	0x0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x19,	%f0
	edge16ln	%o6,	%i5,	%l3
	ble,pn	%icc,	loop_2978
	movcc	%icc,	%g6,	%l2
	movgu	%icc,	%i3,	%o7
	movrgz	%g3,	%l5,	%o3
loop_2978:
	ta	%xcc,	0x3
	movpos	%xcc,	%l0,	%g4
	taddcc	%o2,	%i4,	%l4
	orcc	%i7,	%o0,	%l6
	movg	%icc,	%g5,	%o4
	sethi	0x0981,	%g2
	stx	%g7,	[%l7 + 0x08]
	xor	%g1,	0x0A52,	%o5
	fmovdvs	%xcc,	%f3,	%f28
	fnand	%f30,	%f20,	%f2
	set	0x7A, %o4
	stba	%i6,	[%l7 + %o4] 0x14
	subcc	%i2,	0x04F9,	%o1
	array8	%i0,	%l1,	%i1
	set	0x44, %l1
	ldswa	[%l7 + %l1] 0x18,	%i5
	tneg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc2,	loop_2979
	tsubcctv	%l3,	0x00F4,	%o6
	bgu	loop_2980
	te	%icc,	0x0
loop_2979:
	edge16n	%g6,	%i3,	%o7
	taddcc	%l2,	0x172E,	%g3
loop_2980:
	and	%l5,	0x0BB0,	%o3
	mulx	%l0,	%g4,	%o2
	ldsb	[%l7 + 0x77],	%l4
	edge16n	%i7,	%o0,	%l6
	andcc	%i4,	0x180F,	%o4
	wr	%g0,	0x04,	%asi
	sta	%f9,	[%l7 + 0x7C] %asi
	fmovsl	%xcc,	%f19,	%f18
	edge16	%g2,	%g5,	%g7
	tvs	%xcc,	0x3
	srlx	%g1,	%o5,	%i2
	taddcctv	%i6,	0x0C2A,	%o1
	fsrc1s	%f0,	%f21
	movne	%xcc,	%i0,	%i1
	bcs	loop_2981
	edge32	%i5,	%l1,	%l3
	orn	%o6,	%g6,	%i3
	fmovsvc	%xcc,	%f22,	%f9
loop_2981:
	brnz	%o7,	loop_2982
	fmovdcs	%xcc,	%f4,	%f0
	edge32	%l2,	%g3,	%l5
	membar	0x38
loop_2982:
	orncc	%l0,	0x0933,	%g4
	smul	%o2,	0x0CA1,	%o3
	fblg,a	%fcc0,	loop_2983
	tn	%icc,	0x7
	brlz,a	%i7,	loop_2984
	edge8	%l4,	%o0,	%l6
loop_2983:
	xorcc	%o4,	%i4,	%g5
	fmovrdgez	%g7,	%f14,	%f12
loop_2984:
	sdivcc	%g1,	0x0981,	%o5
	srl	%g2,	0x0E,	%i2
	movgu	%xcc,	%o1,	%i0
	array16	%i6,	%i5,	%i1
	movcc	%icc,	%l3,	%o6
	tsubcc	%l1,	%i3,	%g6
	fmovscc	%xcc,	%f29,	%f3
	and	%l2,	%g3,	%o7
	tsubcc	%l5,	%l0,	%o2
	tl	%xcc,	0x2
	ba,a,pn	%icc,	loop_2985
	fone	%f26
	subc	%g4,	0x0021,	%i7
	set	0x7E, %o7
	ldstuba	[%l7 + %o7] 0x88,	%l4
loop_2985:
	sllx	%o3,	0x16,	%l6
	movge	%xcc,	%o4,	%i4
	subc	%o0,	%g5,	%g1
	edge8	%o5,	%g2,	%g7
	umulcc	%i2,	0x01AF,	%o1
	fcmps	%fcc2,	%f1,	%f7
	ta	%icc,	0x6
	array16	%i0,	%i6,	%i5
	te	%icc,	0x7
	fzero	%f26
	fsrc1	%f24,	%f4
	array32	%l3,	%i1,	%o6
	xorcc	%i3,	%l1,	%l2
	umulcc	%g3,	0x0B7E,	%o7
	edge16ln	%l5,	%g6,	%l0
	fnot2s	%f18,	%f7
	umul	%g4,	0x11E5,	%o2
	fmovrsne	%l4,	%f21,	%f26
	or	%o3,	0x0E89,	%l6
	andn	%o4,	0x0A3A,	%i7
	ldd	[%l7 + 0x30],	%f6
	addc	%i4,	0x1228,	%o0
	ldsb	[%l7 + 0x5F],	%g1
	tvs	%icc,	0x4
	andcc	%g5,	0x0EC2,	%g2
	movre	%o5,	%i2,	%g7
	movpos	%xcc,	%o1,	%i6
	be,pt	%icc,	loop_2986
	edge8l	%i0,	%i5,	%l3
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%o6
loop_2986:
	edge16n	%i1,	%i3,	%l2
	tg	%icc,	0x3
	xnorcc	%l1,	0x1B2F,	%g3
	fba	%fcc0,	loop_2987
	nop
	set	0x30, %g4
	stw	%l5,	[%l7 + %g4]
	fbug,a	%fcc0,	loop_2988
	tvs	%icc,	0x6
loop_2987:
	edge32n	%o7,	%l0,	%g4
	bcs	%icc,	loop_2989
loop_2988:
	nop
	setx loop_2990, %l0, %l1
	jmpl %l1, %o2
	bge	loop_2991
	fpack32	%f18,	%f26,	%f4
loop_2989:
	ldub	[%l7 + 0x50],	%g6
loop_2990:
	edge32	%l4,	%o3,	%o4
loop_2991:
	fmul8x16au	%f14,	%f0,	%f10
	subc	%i7,	0x162F,	%l6
	subc	%i4,	%g1,	%o0
	udivx	%g2,	0x1F8C,	%o5
	fmovdcs	%xcc,	%f4,	%f29
	membar	0x7F
	movvs	%xcc,	%g5,	%i2
	sll	%g7,	%i6,	%o1
	edge32ln	%i5,	%i0,	%o6
	bcs	loop_2992
	brgz,a	%l3,	loop_2993
	mova	%icc,	%i3,	%l2
	movre	%l1,	%g3,	%l5
loop_2992:
	brz,a	%o7,	loop_2994
loop_2993:
	nop

loop_2994:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2717
!	Type x   	: 1259
!	Type cti   	: 2994
!	Type f   	: 4613
!	Type i   	: 13417
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x30AB4A18
.word 0x800E2F57
.word 0xCF37871F
.word 0x6BB1DE8A
.word 0xD1121DEC
.word 0xADC0CDA9
.word 0x0214939E
.word 0x4B2BB672
.word 0x7F35DDDD
.word 0xE57B54EC
.word 0xEE3DD7D3
.word 0x106BAE34
.word 0x63C9B3AC
.word 0xCC764A7D
.word 0x2346A218
.word 0x6AD2E01C
.word 0xEFB8D96A
.word 0x99D3D3EC
.word 0xBA8F25B0
.word 0xF5531D53
.word 0x6F5A2EE8
.word 0x6CF636C3
.word 0x6694C564
.word 0x06A9F18A
.word 0x805BDB69
.word 0x81ECFEB1
.word 0xD16D95F8
.word 0x024E374B
.word 0x18F1B233
.word 0x74CAFDBA
.word 0xB022AE19
.word 0x46E5B675
.word 0x307728A2
.word 0x90C6ABE7
.word 0x35D84767
.word 0x634F27DF
.word 0x95D921FD
.word 0x9BF14C39
.word 0x7DC05203
.word 0x03F3C1A0
.word 0xCE75B416
.word 0x3F9D7E1E
.word 0x12AC9476
.word 0x1CD744C0
.word 0x0ADFB6B9
.word 0xB23D9677
.word 0x681102C7
.word 0xECE9FF0D
.word 0x064DA82E
.word 0x8AB40717
.word 0x179BFB70
.word 0x39B1E66E
.word 0x8C1ACA99
.word 0x1B483D9D
.word 0x39658077
.word 0x62E6E8B6
.word 0x0C6DC235
.word 0x9B127167
.word 0xA09C536A
.word 0xE914C4B0
.word 0x20353275
.word 0x0D14C345
.word 0x1481BB05
.word 0xA3AEBC33
.end
