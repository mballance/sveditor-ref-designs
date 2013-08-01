/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f3.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f3.s,v 1.1 2007/05/11 17:22:28 drp Exp $"
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
	setx	0x42186A97E0423BE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0xF,	%g2
	set	0x5,	%g3
	set	0x5,	%g4
	set	0xE,	%g5
	set	0x6,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xF,	%i1
	set	-0xA,	%i2
	set	-0x1,	%i3
	set	-0x9,	%i4
	set	-0x3,	%i5
	set	-0x8,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x7A2930FE,	%l0
	set	0x2D00170B,	%l1
	set	0x034389E1,	%l2
	set	0x49221514,	%l3
	set	0x72A4A3C4,	%l4
	set	0x419D072B,	%l5
	set	0x63702C86,	%l6
	!# Output registers
	set	-0x083E,	%o0
	set	-0x0AFE,	%o1
	set	0x0D10,	%o2
	set	0x1F7C,	%o3
	set	-0x0252,	%o4
	set	0x173E,	%o5
	set	-0x1C7C,	%o6
	set	0x122C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x57C2E5D5486510F7)
	INIT_TH_FP_REG(%l7,%f2,0x82EA7E617E80DABD)
	INIT_TH_FP_REG(%l7,%f4,0x8386C6C6E96FE4B6)
	INIT_TH_FP_REG(%l7,%f6,0x72D6961024EA4305)
	INIT_TH_FP_REG(%l7,%f8,0x7A0A5D25197E3641)
	INIT_TH_FP_REG(%l7,%f10,0x7CE9D12B56F6D78A)
	INIT_TH_FP_REG(%l7,%f12,0x3935B812D7A80B4F)
	INIT_TH_FP_REG(%l7,%f14,0xEA8FE93F4AC6F784)
	INIT_TH_FP_REG(%l7,%f16,0xB1F80098112C734A)
	INIT_TH_FP_REG(%l7,%f18,0xA30CD30FDD101317)
	INIT_TH_FP_REG(%l7,%f20,0xEB9CB091657F7D0F)
	INIT_TH_FP_REG(%l7,%f22,0xE7683EBF64C16353)
	INIT_TH_FP_REG(%l7,%f24,0xE963F1FCF1336AC1)
	INIT_TH_FP_REG(%l7,%f26,0x4ECC2926D4F82343)
	INIT_TH_FP_REG(%l7,%f28,0xC6BBCA6172AB4BB4)
	INIT_TH_FP_REG(%l7,%f30,0x868CB79258D24BA9)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAF6, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	xnorcc	%o7,	%i5,	%i3
	udivx	%g5,	0x1139,	%o5
	set	0x2C, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g1
	membar	0x06
	movg	%icc,	%l4,	%i2
	tleu	%icc,	0x2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x19,	%i0
	orncc	%g7,	%o6,	%o2
	alignaddr	%o1,	%g3,	%i0
	set	0x46, %i5
	stha	%l6,	[%l7 + %i5] 0x22
	membar	#Sync
	set	0x5E, %g7
	ldstuba	[%l7 + %g7] 0x19,	%o3
	addcc	%l2,	0x0896,	%l3
	sllx	%g2,	0x1A,	%l0
	fbg,a	%fcc3,	loop_1
	movgu	%icc,	%i4,	%l5
	array8	%o0,	%i7,	%g4
	movleu	%xcc,	%i6,	%g6
loop_1:
	fcmpne16	%f20,	%f24,	%o4
	movle	%icc,	%l1,	%i5
	fmovscs	%icc,	%f17,	%f2
	fmovdvs	%icc,	%f26,	%f5
	orcc	%o7,	0x1BE7,	%g5
	brlz,a	%o5,	loop_2
	stb	%i3,	[%l7 + 0x15]
	tn	%icc,	0x4
	fbg	%fcc3,	loop_3
loop_2:
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f12
	fbo,a	%fcc3,	loop_4
	movvs	%icc,	%l4,	%i2
loop_3:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_4:
	tgu	%xcc,	0x2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%g1
	fcmple32	%f20,	%f20,	%g7
	nop
	fitod	%f2,	%f30
	fdtos	%f30,	%f20
	fsrc1s	%f12,	%f30
	set	0x62, %g6
	ldsha	[%l7 + %g6] 0x88,	%o6
	fmovrdne	%o2,	%f4,	%f26
	move	%icc,	%g3,	%o1
	andncc	%l6,	%o3,	%l2
	fbue,a	%fcc3,	loop_5
	fpsub16s	%f21,	%f7,	%f1
	edge16n	%l3,	%g2,	%i0
	ldstub	[%l7 + 0x5E],	%l0
loop_5:
	movl	%xcc,	%l5,	%i4
	movvc	%xcc,	%o0,	%g4
	xnor	%i6,	%i7,	%o4
	fpadd32	%f22,	%f22,	%f26
	fornot2	%f8,	%f24,	%f26
	fpadd32	%f24,	%f18,	%f0
	movcc	%xcc,	%l1,	%i5
	tn	%xcc,	0x7
	edge32	%o7,	%g6,	%o5
	movrne	%i3,	%l4,	%g5
	fornot2	%f10,	%f20,	%f24
	sll	%i2,	0x15,	%g1
	move	%icc,	%i1,	%o6
	xnor	%o2,	0x0BFD,	%g7
	movg	%xcc,	%o1,	%g3
	movrgz	%o3,	0x16A,	%l6
	smulcc	%l2,	%g2,	%i0
	edge8	%l3,	%l5,	%l0
	edge16ln	%o0,	%i4,	%i6
	movvs	%xcc,	%g4,	%i7
	edge16ln	%l1,	%o4,	%i5
	sllx	%g6,	%o7,	%i3
	movn	%xcc,	%o5,	%l4
	ldd	[%l7 + 0x20],	%g4
	lduw	[%l7 + 0x34],	%g1
	tge	%icc,	0x7
	srlx	%i2,	%o6,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f19
	brlz	%i1,	loop_6
	tvs	%xcc,	0x4
	ldstub	[%l7 + 0x57],	%o1
	fmul8sux16	%f16,	%f28,	%f18
loop_6:
	ta	%icc,	0x3
	edge16l	%g3,	%o3,	%l6
	tvc	%icc,	0x5
	fpsub32s	%f2,	%f0,	%f28
	edge16l	%g7,	%l2,	%i0
	fcmpeq16	%f4,	%f4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l3,	%l5,	%l0
	fmovscs	%icc,	%f26,	%f7
	nop
	setx	0x304FBDDA111FEE0D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f12
	andcc	%i4,	%o0,	%g4
	fzero	%f24
	sll	%i7,	%i6,	%l1
	std	%f16,	[%l7 + 0x30]
	edge16n	%i5,	%g6,	%o7
	set	0x0D, %l5
	stba	%i3,	[%l7 + %l5] 0x18
	movle	%icc,	%o5,	%o4
	taddcctv	%l4,	0x0302,	%g1
	xorcc	%g5,	0x0E04,	%i2
	fmovdg	%xcc,	%f8,	%f10
	ldsb	[%l7 + 0x68],	%o6
	sllx	%i1,	0x06,	%o1
	fand	%f14,	%f16,	%f6
	edge32n	%g3,	%o2,	%l6
	for	%f16,	%f12,	%f26
	srl	%o3,	%l2,	%i0
	movle	%xcc,	%g7,	%g2
	fmovse	%icc,	%f26,	%f5
	edge8n	%l3,	%l5,	%l0
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f12
	nop
	fitod	%f10,	%f16
	fdtos	%f16,	%f30
	fbe,a	%fcc1,	loop_7
	sub	%o0,	0x1011,	%g4
	movpos	%icc,	%i7,	%i6
	edge32ln	%l1,	%i5,	%i4
loop_7:
	srl	%o7,	%i3,	%o5
	xnorcc	%o4,	0x1ABB,	%g6
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x44] %asi
	fxor	%f12,	%f28,	%f10
	bvc,a,pt	%icc,	loop_8
	bvs,a,pn	%xcc,	loop_9
	sdiv	%g5,	0x1C8E,	%i2
	edge16l	%o6,	%i1,	%g1
loop_8:
	edge16ln	%g3,	%o2,	%l6
loop_9:
	nop
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	xor	%l2,	%i0,	%g7
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x37] %asi,	%o3
	edge8ln	%g2,	%l5,	%l0
	nop
	set	0x4A, %g2
	lduh	[%l7 + %g2],	%l3
	or	%g4,	0x1DF7,	%i7
	fmovrsgz	%i6,	%f21,	%f31
	edge16	%o0,	%l1,	%i4
	andn	%o7,	0x0B32,	%i5
	srl	%i3,	%o5,	%o4
	array16	%g6,	%l4,	%i2
	alignaddrl	%g5,	%i1,	%g1
	andn	%o6,	0x0EBB,	%g3
	tgu	%icc,	0x7
	fblg,a	%fcc0,	loop_10
	or	%l6,	%o1,	%l2
	taddcc	%i0,	0x1EB3,	%o2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x60] %asi,	%g7
loop_10:
	movvs	%xcc,	%o3,	%l5
	smul	%l0,	0x0A8B,	%l3
	nop
	setx	0xE054D890,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	xnorcc	%g2,	0x1FCF,	%g4
	edge16n	%i7,	%o0,	%l1
	movvc	%xcc,	%i4,	%o7
	fpsub16s	%f1,	%f30,	%f22
	fbo	%fcc0,	loop_11
	or	%i6,	0x1C8F,	%i3
	xnorcc	%i5,	%o4,	%o5
	sllx	%g6,	0x0D,	%i2
loop_11:
	taddcctv	%g5,	%i1,	%g1
	nop
	setx loop_12, %l0, %l1
	jmpl %l1, %l4
	fand	%f26,	%f26,	%f18
	fxnor	%f16,	%f24,	%f12
	addc	%o6,	%l6,	%o1
loop_12:
	udivx	%g3,	0x155B,	%i0
	movneg	%icc,	%o2,	%g7
	movrlz	%o3,	0x0D9,	%l2
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmpeq16	%f30,	%f12,	%l5
	array8	%l0,	%l3,	%g4
	bleu,pn	%icc,	loop_13
	fmovdl	%xcc,	%f25,	%f29
	wr	%g0,	0x23,	%asi
	stwa	%i7,	[%l7 + 0x0C] %asi
	membar	#Sync
loop_13:
	fblg	%fcc1,	loop_14
	sra	%g2,	%l1,	%o0
	lduh	[%l7 + 0x3C],	%o7
	fmovsneg	%icc,	%f24,	%f29
loop_14:
	edge8	%i6,	%i3,	%i4
	stbar
	addccc	%i5,	%o5,	%g6
	set	0x34, %i3
	stba	%o4,	[%l7 + %i3] 0xeb
	membar	#Sync
	fmovrdlez	%i2,	%f12,	%f22
	and	%i1,	%g5,	%l4
	fbu,a	%fcc0,	loop_15
	sdiv	%o6,	0x1FFD,	%l6
	fmovrdgez	%o1,	%f18,	%f14
	edge8ln	%g1,	%i0,	%o2
loop_15:
	ble,a	loop_16
	sra	%g7,	%o3,	%g3
	fmul8x16	%f6,	%f16,	%f4
	edge32	%l2,	%l0,	%l5
loop_16:
	tneg	%xcc,	0x0
	sllx	%g4,	0x17,	%i7
	array8	%g2,	%l3,	%o0
	orn	%l1,	%o7,	%i6
	tl	%icc,	0x3
	sdivcc	%i4,	0x1783,	%i3
	call	loop_17
	movrlez	%o5,	%g6,	%o4
	xnor	%i5,	0x01BD,	%i1
	smulcc	%g5,	%l4,	%o6
loop_17:
	tpos	%xcc,	0x2
	edge32ln	%l6,	%i2,	%g1
	nop
	set	0x41, %o6
	ldub	[%l7 + %o6],	%i0
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f21
	set	0x39, %o0
	lduba	[%l7 + %o0] 0x81,	%o2
	bgu,a,pn	%icc,	loop_18
	sdiv	%g7,	0x09C2,	%o3
	tg	%icc,	0x4
	and	%o1,	%l2,	%g3
loop_18:
	movn	%icc,	%l5,	%l0
	orcc	%g4,	%g2,	%i7
	fpackfix	%f0,	%f18
	brz,a	%o0,	loop_19
	fmovdn	%icc,	%f20,	%f20
	for	%f28,	%f12,	%f18
	fbule	%fcc2,	loop_20
loop_19:
	xnorcc	%l3,	%o7,	%l1
	fxor	%f20,	%f16,	%f16
	smulcc	%i4,	%i6,	%i3
loop_20:
	fmovdneg	%xcc,	%f4,	%f23
	umul	%g6,	%o5,	%i5
	fpsub32	%f4,	%f6,	%f30
	nop
	setx	0xD8A51429,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xB9E046F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f14,	%f21
	movrgez	%o4,	%i1,	%l4
	smulcc	%g5,	%o6,	%l6
	call	loop_21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i2,	%g1
	sub	%i0,	0x07E2,	%o2
loop_21:
	fble,a	%fcc0,	loop_22
	andcc	%g7,	%o3,	%l2
	nop
	setx	0xC3A58C05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f17
	ld	[%l7 + 0x30],	%f14
loop_22:
	fbe,a	%fcc0,	loop_23
	edge16ln	%o1,	%l5,	%g3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
loop_23:
	nop
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x15,	 0x2
	fmovdle	%xcc,	%f21,	%f24
	fmovdcs	%xcc,	%f24,	%f4
	te	%icc,	0x6
	array32	%i7,	%o0,	%l3
	fmul8x16al	%f25,	%f13,	%f26
	fble,a	%fcc3,	loop_24
	array32	%o7,	%l1,	%i4
	ldd	[%l7 + 0x28],	%f28
	sll	%i6,	%g4,	%i3
loop_24:
	or	%o5,	0x14A0,	%i5
	movvc	%icc,	%o4,	%g6
	sll	%l4,	0x08,	%i1
	taddcctv	%g5,	%l6,	%i2
	fbn	%fcc0,	loop_25
	umulcc	%o6,	0x1CF4,	%i0
	subcc	%g1,	0x02DF,	%g7
	ta	%icc,	0x6
loop_25:
	movcc	%icc,	%o2,	%o3
	tvs	%xcc,	0x4
	bleu,a,pn	%xcc,	loop_26
	fmovsl	%xcc,	%f8,	%f0
	stx	%l2,	[%l7 + 0x48]
	bne,pt	%icc,	loop_27
loop_26:
	edge16l	%l5,	%g3,	%o1
	ldsh	[%l7 + 0x14],	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g2,	%i7
loop_27:
	fmovrsne	%l3,	%f10,	%f11
	membar	0x1E
	movneg	%xcc,	%o7,	%l1
	subccc	%o0,	0x0737,	%i6
	movneg	%icc,	%i4,	%g4
	movre	%o5,	0x207,	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i3,	%g6
	movcc	%xcc,	%l4,	%i1
	fpsub16s	%f25,	%f22,	%f9
	umulcc	%o4,	%l6,	%g5
	srl	%i2,	%o6,	%i0
	movcs	%icc,	%g7,	%o2
	fcmpne32	%f30,	%f6,	%o3
	fcmpeq32	%f0,	%f8,	%g1
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x7C] %asi
	brlez	%l5,	loop_28
	movge	%xcc,	%g3,	%l2
	sdiv	%l0,	0x0C22,	%g2
	fba	%fcc2,	loop_29
loop_28:
	addc	%o1,	%i7,	%o7
	bge,a	loop_30
	udiv	%l1,	0x0F2D,	%l3
loop_29:
	fmovscc	%xcc,	%f21,	%f15
	wr	%g0,	0x27,	%asi
	stxa	%i6,	[%l7 + 0x08] %asi
	membar	#Sync
loop_30:
	st	%f7,	[%l7 + 0x50]
	movle	%icc,	%i4,	%o0
	fmovsg	%xcc,	%f4,	%f30
	stbar
	fsrc2s	%f29,	%f13
	tneg	%icc,	0x4
	sdivcc	%o5,	0x1758,	%g4
	ld	[%l7 + 0x70],	%f1
	sdiv	%i3,	0x1C31,	%g6
	brz	%l4,	loop_31
	tpos	%icc,	0x3
	brlz,a	%i5,	loop_32
	taddcctv	%i1,	0x0660,	%l6
loop_31:
	sir	0x0492
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32:
	ldx	[%l7 + 0x28],	%o4
	fmovsgu	%xcc,	%f28,	%f0
	tvs	%icc,	0x0
	fmovdn	%xcc,	%f18,	%f29
	fmovdpos	%icc,	%f14,	%f11
	udivcc	%i2,	0x00B9,	%o6
	taddcctv	%g5,	0x1129,	%i0
	fmovde	%xcc,	%f13,	%f17
	tsubcctv	%o2,	0x1511,	%g7
	sllx	%o3,	%l5,	%g3
	set	0x1D, %o1
	stba	%l2,	[%l7 + %o1] 0x0c
	movge	%icc,	%l0,	%g2
	sdiv	%g1,	0x12F1,	%i7
	fpadd16	%f18,	%f12,	%f24
	tcs	%xcc,	0x2
	ba,a,pn	%xcc,	loop_33
	move	%xcc,	%o7,	%o1
	edge16l	%l1,	%l3,	%i6
	movre	%i4,	%o0,	%g4
loop_33:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i3,	%g6
	movvc	%xcc,	%l4,	%o5
	nop
	fitos	%f12,	%f2
	fstoi	%f2,	%f10
	nop
	set	0x7A, %l6
	ldsh	[%l7 + %l6],	%i5
	bg	loop_34
	nop
	setx	0xB620D9B3575E2A8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x862FD164A282D014,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f20,	%f10
	sllx	%i1,	%l6,	%o4
	tne	%icc,	0x1
loop_34:
	smul	%o6,	0x121B,	%g5
	fmovdgu	%xcc,	%f0,	%f0
	movge	%icc,	%i0,	%i2
	bleu	%xcc,	loop_35
	addccc	%g7,	%o2,	%l5
	nop
	setx	loop_36,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	pdist	%f6,	%f0,	%f18
loop_35:
	brgz	%o3,	loop_37
	bn,pn	%xcc,	loop_38
loop_36:
	movrlez	%l2,	%g3,	%g2
	mulx	%l0,	%i7,	%o7
loop_37:
	fandnot1	%f28,	%f16,	%f18
loop_38:
	bpos,a,pn	%xcc,	loop_39
	fornot2	%f4,	%f22,	%f20
	tsubcc	%o1,	0x01BF,	%g1
	fmovsvs	%icc,	%f4,	%f12
loop_39:
	nop
	set	0x0F, %i2
	lduba	[%l7 + %i2] 0x19,	%l3
	tsubcctv	%l1,	%i6,	%i4
	fandnot2s	%f24,	%f30,	%f31
	edge8ln	%g4,	%i3,	%g6
	movvc	%xcc,	%l4,	%o5
	movge	%xcc,	%i5,	%o0
	nop
	fitod	%f20,	%f28
	nop
	fitos	%f10,	%f18
	fstod	%f18,	%f16
	subcc	%l6,	%o4,	%i1
	movrne	%g5,	%i0,	%o6
	tg	%xcc,	0x7
	tneg	%xcc,	0x2
	membar	0x36
	movne	%xcc,	%g7,	%o2
	xnor	%l5,	%o3,	%i2
	ldsw	[%l7 + 0x24],	%l2
	and	%g3,	0x01B4,	%g2
	nop
	setx loop_40, %l0, %l1
	jmpl %l1, %i7
	bvs,a	loop_41
	fmovscs	%icc,	%f27,	%f10
	fmul8ulx16	%f2,	%f10,	%f0
loop_40:
	nop
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x88,	%l0
loop_41:
	nop
	fitos	%f14,	%f3
	fstod	%f3,	%f8
	fsrc2s	%f11,	%f10
	or	%o7,	%o1,	%g1
	flush	%l7 + 0x0C
	edge32	%l3,	%l1,	%i6
	tvc	%xcc,	0x5
	bvs,a,pt	%xcc,	loop_42
	movleu	%icc,	%g4,	%i3
	subc	%i4,	%g6,	%l4
	fxor	%f20,	%f18,	%f26
loop_42:
	fpsub32	%f2,	%f24,	%f16
	tpos	%xcc,	0x3
	nop
	setx	0xBA06DB7F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xE2C373A6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f26,	%f7
	sub	%i5,	%o0,	%l6
	sethi	0x194E,	%o4
	tvc	%icc,	0x6
	ta	%icc,	0x2
	ldd	[%l7 + 0x30],	%f16
	fbul	%fcc1,	loop_43
	fmovrdlez	%i1,	%f4,	%f22
	fmovrdne	%o5,	%f20,	%f30
	ld	[%l7 + 0x60],	%f7
loop_43:
	brnz	%i0,	loop_44
	fbug	%fcc0,	loop_45
	addccc	%g5,	%o6,	%g7
	edge8	%o2,	%o3,	%i2
loop_44:
	fpadd32	%f0,	%f14,	%f28
loop_45:
	movneg	%icc,	%l2,	%g3
	sethi	0x1B39,	%l5
	set	0x1C, %i7
	swapa	[%l7 + %i7] 0x80,	%i7
	movneg	%xcc,	%l0,	%o7
	sth	%g2,	[%l7 + 0x5C]
	taddcc	%g1,	%l3,	%l1
	movcs	%icc,	%i6,	%o1
	fmovdvs	%xcc,	%f16,	%f7
	xorcc	%g4,	0x0764,	%i3
	fabsd	%f14,	%f2
	ldd	[%l7 + 0x70],	%i4
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f28
	tcs	%icc,	0x7
	bneg,pn	%icc,	loop_46
	sethi	0x1C22,	%g6
	tg	%icc,	0x3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i5
loop_46:
	fbo	%fcc2,	loop_47
	movg	%icc,	%l4,	%l6
	andcc	%o4,	0x129E,	%i1
	array32	%o0,	%o5,	%i0
loop_47:
	array16	%g5,	%o6,	%g7
	udivcc	%o2,	0x0C2C,	%o3
	edge32n	%i2,	%l2,	%l5
	alignaddr	%i7,	%l0,	%g3
	te	%icc,	0x1
	ldx	[%l7 + 0x30],	%g2
	fzero	%f10
	brgez	%g1,	loop_48
	tgu	%xcc,	0x2
	movgu	%icc,	%l3,	%o7
	tg	%icc,	0x5
loop_48:
	mova	%icc,	%i6,	%l1
	bg,a	%icc,	loop_49
	alignaddrl	%o1,	%g4,	%i3
	udivx	%i4,	0x1187,	%i5
	tneg	%icc,	0x7
loop_49:
	movn	%icc,	%l4,	%l6
	move	%xcc,	%o4,	%g6
	ldd	[%l7 + 0x58],	%i0
	movcc	%xcc,	%o5,	%i0
	edge32n	%o0,	%o6,	%g5
	srl	%g7,	0x0B,	%o2
	sth	%o3,	[%l7 + 0x1E]
	array8	%i2,	%l5,	%l2
	bleu,pt	%xcc,	loop_50
	fmuld8sux16	%f17,	%f15,	%f4
	brgz	%i7,	loop_51
	tge	%icc,	0x1
loop_50:
	fpsub16	%f30,	%f6,	%f14
	sir	0x1F84
loop_51:
	be,pt	%icc,	loop_52
	ba,pt	%icc,	loop_53
	fcmpgt16	%f14,	%f12,	%l0
	edge32n	%g3,	%g1,	%l3
loop_52:
	or	%o7,	%g2,	%l1
loop_53:
	movrgez	%o1,	%g4,	%i6
	smul	%i3,	%i5,	%i4
	sdivx	%l4,	0x1132,	%o4
	udivcc	%l6,	0x1140,	%g6
	fcmple32	%f26,	%f30,	%o5
	fble	%fcc3,	loop_54
	edge16l	%i0,	%o0,	%i1
	fmovdge	%xcc,	%f17,	%f14
	fmovdcs	%icc,	%f26,	%f17
loop_54:
	andcc	%g5,	0x1DFE,	%g7
	udiv	%o6,	0x17D5,	%o3
	std	%f24,	[%l7 + 0x38]
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	mova	%xcc,	%i2,	%o2
	tne	%icc,	0x5
	fbl,a	%fcc1,	loop_55
	ld	[%l7 + 0x30],	%f16
	udivx	%l2,	0x0D4E,	%i7
	movcs	%icc,	%l5,	%g3
loop_55:
	bpos,a	loop_56
	movre	%g1,	0x091,	%l3
	sra	%l0,	0x16,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56:
	fmovrdlz	%o7,	%f26,	%f2
	movle	%xcc,	%l1,	%g4
	orn	%i6,	%o1,	%i3
	bg,a,pt	%xcc,	loop_57
	move	%icc,	%i5,	%l4
	alignaddrl	%i4,	%o4,	%l6
	tge	%icc,	0x1
loop_57:
	mulscc	%g6,	%o5,	%o0
	taddcctv	%i1,	%g5,	%i0
	orn	%g7,	%o3,	%i2
	fnor	%f22,	%f16,	%f8
	te	%icc,	0x4
	fbg	%fcc2,	loop_58
	sethi	0x0F4C,	%o6
	taddcctv	%l2,	0x11A0,	%o2
	array16	%i7,	%l5,	%g1
loop_58:
	movle	%icc,	%g3,	%l3
	wr	%g0,	0x19,	%asi
	stxa	%l0,	[%l7 + 0x38] %asi
	tcs	%icc,	0x0
	fbu,a	%fcc3,	loop_59
	bpos,a,pt	%xcc,	loop_60
	for	%f12,	%f22,	%f20
	orcc	%g2,	%o7,	%g4
loop_59:
	tvs	%icc,	0x1
loop_60:
	tg	%icc,	0x1
	taddcctv	%l1,	0x011E,	%i6
	umulcc	%o1,	%i3,	%l4
	nop
	setx	0xC04D3E44,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	brnz	%i4,	loop_61
	movl	%icc,	%o4,	%l6
	std	%f8,	[%l7 + 0x50]
	fpadd16	%f6,	%f26,	%f8
loop_61:
	nop
	fitos	%f25,	%f15
	fsrc1	%f6,	%f20
	sra	%i5,	0x05,	%g6
	udivx	%o5,	0x1405,	%i1
	nop
	setx	loop_62,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%o0,	0x016B,	%i0
	movrgez	%g5,	0x0B5,	%o3
	tle	%xcc,	0x2
loop_62:
	fmovsl	%icc,	%f24,	%f6
	brlez,a	%i2,	loop_63
	fmovspos	%xcc,	%f0,	%f8
	srl	%o6,	%l2,	%o2
	prefetch	[%l7 + 0x74],	 0x3
loop_63:
	bleu,a,pn	%xcc,	loop_64
	fzero	%f14
	fzeros	%f0
	tg	%xcc,	0x3
loop_64:
	umulcc	%i7,	0x09B0,	%g7
	movrgez	%l5,	%g1,	%l3
	fpack32	%f14,	%f0,	%f22
	movleu	%xcc,	%g3,	%l0
	alignaddrl	%o7,	%g2,	%l1
	tsubcc	%g4,	%o1,	%i6
	alignaddr	%l4,	%i3,	%i4
	stb	%o4,	[%l7 + 0x20]
	fpmerge	%f7,	%f17,	%f22
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f0
	fmul8sux16	%f8,	%f14,	%f14
	fmovsgu	%icc,	%f2,	%f28
	fmovsvc	%icc,	%f20,	%f2
	nop
	setx	0xA143D676B066DCD1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	tle	%icc,	0x3
	fbu	%fcc3,	loop_65
	bvs,a,pn	%xcc,	loop_66
	srl	%l6,	%i5,	%o5
	movgu	%xcc,	%g6,	%i1
loop_65:
	tcs	%xcc,	0x5
loop_66:
	nop
	setx	0xB8E2553F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f26
	fmovrdgz	%o0,	%f12,	%f6
	te	%icc,	0x2
	lduw	[%l7 + 0x24],	%i0
	nop
	fitos	%f15,	%f18
	fmovscc	%icc,	%f12,	%f10
	fcmpne32	%f22,	%f28,	%o3
	movrgez	%g5,	0x3D1,	%o6
	move	%xcc,	%i2,	%l2
	fmovsl	%xcc,	%f9,	%f30
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%o2
	nop
	setx	0x23753552D07EDD1A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fxor	%f6,	%f20,	%f4
	st	%f16,	[%l7 + 0x1C]
	edge16	%g7,	%i7,	%g1
	fexpand	%f10,	%f22
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x22,	%l2
	ldub	[%l7 + 0x29],	%l5
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x81
	fmovsne	%xcc,	%f3,	%f23
	movrgez	%l0,	0x17E,	%g3
	movcc	%icc,	%g2,	%l1
	movleu	%icc,	%o7,	%o1
	tg	%icc,	0x4
	sdiv	%g4,	0x19E2,	%l4
	set	0x2A, %o2
	stha	%i6,	[%l7 + %o2] 0x19
	wr	%g0,	0x19,	%asi
	stwa	%i3,	[%l7 + 0x20] %asi
	movrgz	%i4,	%l6,	%i5
	fmovrsne	%o5,	%f5,	%f18
	membar	0x7F
	udivcc	%o4,	0x16CF,	%i1
	umulcc	%g6,	0x1C5D,	%i0
	addccc	%o0,	%g5,	%o6
	brgez	%i2,	loop_67
	ldd	[%l7 + 0x30],	%o2
	tneg	%icc,	0x5
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l2
loop_67:
	movrgz	%o2,	0x0EC,	%i7
	bcc,a	loop_68
	movvc	%icc,	%g1,	%g7
	stbar
	fcmple32	%f8,	%f10,	%l5
loop_68:
	fmovsvc	%icc,	%f28,	%f1
	fcmpgt16	%f18,	%f12,	%l0
	alignaddr	%l3,	%g2,	%l1
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g3
	stx	%o7,	[%l7 + 0x20]
	tle	%xcc,	0x0
	andcc	%g4,	%l4,	%i6
	movn	%xcc,	%o1,	%i3
	fand	%f16,	%f26,	%f24
	sir	0x17CB
	addcc	%i4,	%i5,	%l6
	fxors	%f24,	%f15,	%f5
	array8	%o5,	%o4,	%i1
	tsubcc	%g6,	%o0,	%g5
	be	loop_69
	fmuld8ulx16	%f28,	%f20,	%f6
	movge	%icc,	%i0,	%o6
	tcs	%icc,	0x4
loop_69:
	fnegs	%f17,	%f29
	edge8n	%o3,	%i2,	%o2
	movvc	%xcc,	%i7,	%g1
	edge16	%g7,	%l2,	%l5
	fmovdcc	%icc,	%f3,	%f31
	movge	%xcc,	%l3,	%l0
	nop
	setx	0xBF33EEEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x4398CFC5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f7,	%f2
	subc	%l1,	0x0359,	%g3
	sub	%g2,	0x182B,	%g4
	lduh	[%l7 + 0x70],	%l4
	movpos	%icc,	%i6,	%o1
	brgz,a	%o7,	loop_70
	fmovde	%xcc,	%f30,	%f2
	tvc	%icc,	0x0
	bcs,pn	%xcc,	loop_71
loop_70:
	fbg	%fcc1,	loop_72
	fbug	%fcc2,	loop_73
	alignaddr	%i3,	%i4,	%i5
loop_71:
	movne	%xcc,	%l6,	%o5
loop_72:
	nop
	fitos	%f8,	%f30
	fstod	%f30,	%f28
loop_73:
	alignaddrl	%i1,	%g6,	%o0
	popc	%g5,	%o4
	array32	%o6,	%i0,	%o3
	movneg	%icc,	%i2,	%o2
	move	%xcc,	%i7,	%g1
	taddcc	%g7,	0x0763,	%l2
	movrlez	%l5,	%l0,	%l3
	te	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f4,	%f25,	%f25
	ldsh	[%l7 + 0x2E],	%g3
	fmovdneg	%xcc,	%f11,	%f21
	movleu	%icc,	%l1,	%g4
	bneg,a	loop_74
	fpadd16	%f26,	%f24,	%f24
	mulx	%l4,	%g2,	%o1
	fnand	%f14,	%f12,	%f24
loop_74:
	smulcc	%i6,	0x0C88,	%o7
	udivx	%i4,	0x1302,	%i3
	popc	0x1BF5,	%i5
	andcc	%o5,	0x1AD6,	%i1
	tcc	%icc,	0x2
	or	%g6,	%o0,	%l6
	fmovdneg	%xcc,	%f12,	%f16
	fmovsle	%icc,	%f10,	%f23
	tl	%icc,	0x4
	subccc	%o4,	0x1A1D,	%o6
	sll	%g5,	%o3,	%i2
	ld	[%l7 + 0x50],	%f16
	mulscc	%o2,	%i7,	%i0
	udivcc	%g7,	0x1408,	%g1
	fmovs	%f0,	%f9
	smulcc	%l5,	%l2,	%l0
	alignaddr	%l3,	%g3,	%g4
	alignaddr	%l4,	%g2,	%l1
	fbule,a	%fcc0,	loop_75
	mova	%icc,	%o1,	%i6
	edge32	%i4,	%o7,	%i3
	set	0x3C, %g3
	lduha	[%l7 + %g3] 0x89,	%i5
loop_75:
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f22
	fabss	%f27,	%f21
	taddcc	%o5,	%i1,	%o0
	nop
	setx loop_76, %l0, %l1
	jmpl %l1, %l6
	xor	%g6,	0x0850,	%o6
	bne,a,pt	%icc,	loop_77
	orcc	%g5,	%o3,	%i2
loop_76:
	stb	%o2,	[%l7 + 0x16]
	fmul8ulx16	%f30,	%f10,	%f4
loop_77:
	sth	%o4,	[%l7 + 0x34]
	fbul,a	%fcc1,	loop_78
	popc	%i0,	%i7
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x16
	membar	#Sync
loop_78:
	movneg	%icc,	%g1,	%g7
	brgez,a	%l5,	loop_79
	array8	%l2,	%l0,	%l3
	array8	%g3,	%g4,	%g2
	udivx	%l4,	0x041B,	%l1
loop_79:
	nop
	wr	%g0,	0x18,	%asi
	stba	%o1,	[%l7 + 0x64] %asi
	ldd	[%l7 + 0x50],	%f10
	andcc	%i6,	0x0AFA,	%i4
	fpack32	%f30,	%f18,	%f22
	xnorcc	%i3,	%o7,	%i5
	membar	0x47
	udivcc	%i1,	0x12CF,	%o0
	ldub	[%l7 + 0x14],	%o5
	fexpand	%f8,	%f26
	fandnot1	%f24,	%f22,	%f24
	edge8	%g6,	%l6,	%o6
	udivcc	%g5,	0x10D0,	%i2
	movrlz	%o2,	%o3,	%o4
	brz,a	%i0,	loop_80
	edge16	%i7,	%g7,	%l5
	sethi	0x107C,	%l2
	fbo	%fcc3,	loop_81
loop_80:
	fmovdle	%icc,	%f16,	%f15
	fbo,a	%fcc1,	loop_82
	movl	%xcc,	%l0,	%l3
loop_81:
	edge16n	%g1,	%g3,	%g2
	fmovdle	%xcc,	%f12,	%f8
loop_82:
	movrlez	%l4,	%g4,	%o1
	fbo,a	%fcc3,	loop_83
	movrgez	%l1,	%i4,	%i6
	fmovsge	%icc,	%f18,	%f28
	tgu	%xcc,	0x2
loop_83:
	sll	%i3,	%i5,	%i1
	mulscc	%o0,	0x0AD9,	%o7
	fmovdpos	%icc,	%f27,	%f12
	bvs,a	%icc,	loop_84
	tl	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
loop_84:
	movrgz	%l6,	%o5,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i2,	%o2
	edge8	%o3,	%g5,	%i0
	fmovd	%f14,	%f0
	tg	%xcc,	0x3
	ta	%xcc,	0x6
	fnot2	%f18,	%f14
	fmovsvs	%xcc,	%f27,	%f1
	pdist	%f2,	%f2,	%f20
	udiv	%o4,	0x0CD1,	%i7
	fbg,a	%fcc3,	loop_85
	umul	%l5,	0x13A4,	%g7
	fmovdneg	%icc,	%f26,	%f8
	tneg	%xcc,	0x0
loop_85:
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f8
	fxtod	%f8,	%f10
	lduh	[%l7 + 0x42],	%l0
	nop
	setx	loop_86,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%l2,	0x1501,	%l3
	tleu	%xcc,	0x1
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g1
loop_86:
	tpos	%xcc,	0x3
	edge16l	%g2,	%g3,	%l4
	addccc	%o1,	0x0EFB,	%l1
	bpos,a,pn	%xcc,	loop_87
	nop
	setx	0x15755033415F04DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f8
	fmovdcc	%icc,	%f21,	%f27
	srax	%g4,	%i6,	%i3
loop_87:
	edge32	%i4,	%i1,	%i5
	movvs	%icc,	%o0,	%g6
	fbo,a	%fcc3,	loop_88
	membar	0x41
	srl	%o7,	%o5,	%l6
	subcc	%i2,	%o6,	%o2
loop_88:
	fblg,a	%fcc3,	loop_89
	ba	%icc,	loop_90
	orncc	%g5,	0x0FDC,	%i0
	fmovrslez	%o3,	%f0,	%f4
loop_89:
	sdivcc	%i7,	0x0417,	%o4
loop_90:
	sethi	0x01AF,	%l5
	fcmpgt16	%f26,	%f14,	%l0
	fmovrsgz	%g7,	%f13,	%f17
	sethi	0x0D34,	%l2
	movre	%g1,	0x221,	%l3
	or	%g2,	0x04DE,	%g3
	set	0x28, %g4
	lduwa	[%l7 + %g4] 0x14,	%l4
	set	0x28, %i1
	ldswa	[%l7 + %i1] 0x19,	%o1
	nop
	setx	0x977B620A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xB934704E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f8,	%f0
	be,a	%xcc,	loop_91
	edge8ln	%l1,	%g4,	%i6
	movcc	%xcc,	%i3,	%i4
	wr	%g0,	0x2b,	%asi
	stba	%i1,	[%l7 + 0x3B] %asi
	membar	#Sync
loop_91:
	ta	%xcc,	0x7
	movvc	%icc,	%i5,	%o0
	fnot1s	%f11,	%f18
	movrlz	%o7,	%o5,	%g6
	nop
	setx	0x9705E52D2286028D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x4E85F104CBB98B23,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f2
	tn	%icc,	0x2
	movrlez	%i2,	0x0E2,	%l6
	or	%o2,	0x0B64,	%g5
	ta	%icc,	0x5
	fbg,a	%fcc3,	loop_92
	fpack32	%f4,	%f20,	%f0
	fxor	%f28,	%f4,	%f18
	brgz,a	%i0,	loop_93
loop_92:
	ldd	[%l7 + 0x38],	%o6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x11] %asi,	%o3
loop_93:
	srl	%i7,	0x17,	%l5
	fandnot1	%f22,	%f12,	%f26
	andncc	%o4,	%l0,	%l2
	fmovsn	%xcc,	%f24,	%f31
	fbue	%fcc1,	loop_94
	sdivx	%g1,	0x16F4,	%g7
	fornot1	%f6,	%f20,	%f28
	bvs,pt	%icc,	loop_95
loop_94:
	subc	%l3,	%g3,	%l4
	mova	%icc,	%o1,	%l1
	edge16ln	%g2,	%i6,	%i3
loop_95:
	membar	0x6F
	edge32	%g4,	%i4,	%i1
	xnorcc	%i5,	0x0F60,	%o7
	fabss	%f9,	%f28
	taddcc	%o5,	%o0,	%g6
	tsubcc	%i2,	%l6,	%g5
	nop
	fitos	%f14,	%f19
	fstox	%f19,	%f22
	fxtos	%f22,	%f3
	edge32ln	%o2,	%i0,	%o3
	brgz,a	%i7,	loop_96
	tvc	%icc,	0x2
	movneg	%xcc,	%o6,	%o4
	membar	0x7B
loop_96:
	tvs	%icc,	0x6
	bleu,pn	%icc,	loop_97
	fabsd	%f30,	%f6
	array8	%l0,	%l2,	%g1
	ldx	[%l7 + 0x38],	%g7
loop_97:
	ble	loop_98
	tcc	%icc,	0x1
	fmovd	%f16,	%f18
	fmovrsne	%l5,	%f0,	%f11
loop_98:
	ldsh	[%l7 + 0x5C],	%l3
	orn	%l4,	%g3,	%o1
	sub	%l1,	0x0510,	%i6
	fmovrsne	%i3,	%f3,	%f2
	umul	%g4,	0x15AE,	%g2
	taddcc	%i4,	%i1,	%o7
	sdiv	%i5,	0x1382,	%o5
	tle	%icc,	0x1
	movn	%icc,	%g6,	%i2
	nop
	setx	0x83D420EDD6E66200,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x76C514C81694E4AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f16,	%f30
	sdivcc	%l6,	0x1CF4,	%g5
	fmovsgu	%icc,	%f7,	%f1
	fmovrdne	%o0,	%f20,	%f12
	popc	%o2,	%o3
	array16	%i7,	%o6,	%i0
	fmovdne	%xcc,	%f8,	%f0
	edge32n	%l0,	%l2,	%o4
	movleu	%xcc,	%g7,	%l5
	te	%icc,	0x3
	fmuld8sux16	%f16,	%f26,	%f0
	fbn	%fcc1,	loop_99
	fbge	%fcc2,	loop_100
	fbne	%fcc3,	loop_101
	taddcctv	%g1,	0x0C24,	%l4
loop_99:
	fmovdg	%icc,	%f24,	%f5
loop_100:
	alignaddr	%l3,	%g3,	%o1
loop_101:
	orncc	%i6,	%i3,	%g4
	movvc	%icc,	%l1,	%i4
	bg	%xcc,	loop_102
	movrlz	%g2,	0x117,	%o7
	fmovd	%f14,	%f28
	ld	[%l7 + 0x14],	%f22
loop_102:
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f6
	fnot2	%f22,	%f28
	tgu	%icc,	0x6
	fandnot2s	%f18,	%f6,	%f17
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x6C] %asi,	%f31
	nop
	setx	0xD1CE9BB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f14
	movl	%icc,	%i5,	%i1
	or	%o5,	0x0E6F,	%i2
	tl	%icc,	0x2
	fmovdleu	%xcc,	%f22,	%f25
	fones	%f8
	tsubcc	%g6,	0x1A93,	%l6
	movleu	%xcc,	%g5,	%o2
	ta	%icc,	0x1
	tg	%icc,	0x7
	edge16l	%o3,	%i7,	%o0
	nop
	setx	0x5ADE1371FC33DF24,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f12
	add	%i0,	%o6,	%l0
	edge32l	%o4,	%l2,	%l5
	sdiv	%g7,	0x1632,	%g1
	fmul8ulx16	%f28,	%f8,	%f6
	stw	%l4,	[%l7 + 0x70]
	popc	%g3,	%l3
	srax	%i6,	%o1,	%i3
	xorcc	%l1,	0x033A,	%g4
	array32	%g2,	%o7,	%i4
	fbg	%fcc2,	loop_103
	tneg	%icc,	0x3
	tcc	%icc,	0x5
	orcc	%i5,	0x0F2E,	%i1
loop_103:
	nop
	wr	%g0,	0x11,	%asi
	stba	%o5,	[%l7 + 0x6C] %asi
	ldsw	[%l7 + 0x78],	%i2
	fornot2	%f20,	%f22,	%f24
	umulcc	%g6,	0x02EF,	%l6
	edge8ln	%g5,	%o3,	%o2
	andcc	%o0,	0x0D72,	%i0
	array16	%i7,	%l0,	%o6
	fbge	%fcc0,	loop_104
	and	%l2,	0x1EC3,	%o4
	fmuld8sux16	%f15,	%f20,	%f26
	xorcc	%l5,	0x14CF,	%g7
loop_104:
	movrlz	%g1,	%g3,	%l3
	be,a	loop_105
	fbe	%fcc2,	loop_106
	brgez	%i6,	loop_107
	popc	%l4,	%o1
loop_105:
	movg	%icc,	%l1,	%g4
loop_106:
	fnot1	%f30,	%f0
loop_107:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%g2
	fmul8x16au	%f15,	%f22,	%f2
	sdivx	%i3,	0x05F1,	%o7
	edge32	%i4,	%i1,	%i5
	nop
	setx	0x0602922980639665,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	alignaddr	%i2,	%o5,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f11,	%f21
	orncc	%g5,	0x0CA1,	%o3
	alignaddr	%o2,	%l6,	%o0
	edge16	%i7,	%i0,	%o6
	add	%l2,	0x0BBE,	%o4
	fbe,a	%fcc0,	loop_108
	fmovsvs	%icc,	%f18,	%f18
	nop
	setx	0x8EFA6927,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xEB7C6441,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f26,	%f0
	fmovsleu	%xcc,	%f16,	%f13
loop_108:
	tgu	%icc,	0x1
	tvs	%xcc,	0x2
	nop
	setx	loop_109,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1	%f10,	%f10
	fbug	%fcc1,	loop_110
	fmovsneg	%xcc,	%f10,	%f29
loop_109:
	movre	%l0,	%l5,	%g7
	fand	%f16,	%f6,	%f10
loop_110:
	fnot1	%f6,	%f16
	movleu	%icc,	%g1,	%l3
	fbuge	%fcc1,	loop_111
	xor	%g3,	0x040C,	%i6
	orncc	%o1,	0x1E95,	%l1
	fmul8x16al	%f7,	%f2,	%f6
loop_111:
	edge8l	%g4,	%g2,	%l4
	nop
	setx	0x2A5C8B41,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xEB608A61,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f1,	%f22
	fcmpgt32	%f30,	%f26,	%o7
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%i3
	lduh	[%l7 + 0x2C],	%i4
	fpadd16s	%f3,	%f25,	%f5
	sll	%i1,	0x1C,	%i2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x48] %asi,	%i5
	or	%o5,	%g5,	%o3
	nop
	fitos	%f4,	%f16
	fstoi	%f16,	%f17
	popc	0x0544,	%g6
	nop
	setx loop_112, %l0, %l1
	jmpl %l1, %l6
	tcs	%xcc,	0x0
	addccc	%o0,	0x1E85,	%i7
	edge32ln	%i0,	%o6,	%o2
loop_112:
	ldsw	[%l7 + 0x4C],	%l2
	nop
	setx	0x10638EBE,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	fbge,a	%fcc1,	loop_113
	orncc	%l0,	0x07FC,	%l5
	xor	%g7,	0x119F,	%o4
	movcs	%icc,	%l3,	%g3
loop_113:
	edge8n	%i6,	%o1,	%l1
	fxnor	%f24,	%f2,	%f14
	array16	%g1,	%g4,	%l4
	fpsub32	%f24,	%f22,	%f28
	fnot1	%f6,	%f18
	tleu	%xcc,	0x7
	umulcc	%g2,	0x04CC,	%o7
	brlez	%i3,	loop_114
	taddcc	%i4,	%i1,	%i5
	set	0x6A, %l4
	stha	%i2,	[%l7 + %l4] 0x04
loop_114:
	and	%o5,	%g5,	%g6
	nop
	fitos	%f29,	%f2
	sub	%o3,	0x11F8,	%l6
	tl	%icc,	0x7
	orcc	%o0,	%i0,	%i7
	fcmpgt16	%f12,	%f22,	%o2
	tsubcctv	%o6,	0x0746,	%l0
	sdivcc	%l5,	0x01F6,	%l2
	andncc	%o4,	%g7,	%l3
	andcc	%i6,	%o1,	%l1
	fbu,a	%fcc1,	loop_115
	movn	%icc,	%g3,	%g4
	fandnot2	%f14,	%f24,	%f10
	array8	%g1,	%g2,	%o7
loop_115:
	alignaddrl	%i3,	%i4,	%l4
	nop
	fitos	%f0,	%f0
	fstod	%f0,	%f28
	sdivx	%i1,	0x153E,	%i5
	movcs	%icc,	%i2,	%o5
	edge16l	%g5,	%o3,	%g6
	tcc	%icc,	0x3
	srlx	%o0,	%i0,	%l6
	movrlz	%i7,	0x0B3,	%o6
	fmovsleu	%icc,	%f4,	%f10
	tpos	%icc,	0x4
	udivcc	%o2,	0x1A76,	%l0
	taddcc	%l2,	0x0544,	%o4
	fcmpne16	%f2,	%f2,	%g7
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f16
	fxtod	%f16,	%f4
	fors	%f31,	%f14,	%f14
	fbo,a	%fcc2,	loop_116
	fbn	%fcc1,	loop_117
	movle	%icc,	%l3,	%l5
	smul	%i6,	%l1,	%o1
loop_116:
	call	loop_118
loop_117:
	ldub	[%l7 + 0x6C],	%g3
	movre	%g1,	0x120,	%g4
	tsubcctv	%g2,	%i3,	%i4
loop_118:
	fba	%fcc2,	loop_119
	umul	%l4,	%o7,	%i5
	edge16l	%i2,	%i1,	%g5
	bcc,pn	%icc,	loop_120
loop_119:
	fbg,a	%fcc0,	loop_121
	fbn	%fcc2,	loop_122
	fmovdleu	%xcc,	%f8,	%f26
loop_120:
	udiv	%o3,	0x0093,	%g6
loop_121:
	movleu	%icc,	%o5,	%i0
loop_122:
	brlez	%o0,	loop_123
	fandnot2	%f24,	%f20,	%f16
	fbo	%fcc2,	loop_124
	sdivcc	%l6,	0x1AC8,	%i7
loop_123:
	movre	%o2,	0x3B3,	%l0
	fbuge	%fcc1,	loop_125
loop_124:
	fands	%f17,	%f18,	%f26
	udivx	%l2,	0x1F42,	%o6
	fbne	%fcc2,	loop_126
loop_125:
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f26
	fmovrdlz	%g7,	%f6,	%f18
	fmovdne	%xcc,	%f12,	%f15
loop_126:
	ldsb	[%l7 + 0x1A],	%l3
	udivx	%o4,	0x0AE5,	%l5
	fcmpne32	%f8,	%f22,	%l1
	addc	%i6,	%g3,	%g1
	sir	0x0B0E
	nop
	setx	loop_127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%g4,	%o1,	%g2
	movrlez	%i4,	%i3,	%l4
	mulx	%o7,	%i5,	%i1
loop_127:
	srax	%g5,	%o3,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o5,	%i2
	edge32ln	%i0,	%l6,	%o0
	bgu,a	loop_128
	edge32l	%o2,	%i7,	%l2
	fmovsge	%icc,	%f19,	%f19
	ldstub	[%l7 + 0x6A],	%l0
loop_128:
	fnands	%f31,	%f27,	%f25
	or	%g7,	%l3,	%o6
	fbg,a	%fcc0,	loop_129
	movl	%icc,	%o4,	%l1
	movre	%l5,	%g3,	%i6
	tge	%xcc,	0x7
loop_129:
	movre	%g4,	%g1,	%o1
	fexpand	%f3,	%f16
	stb	%g2,	[%l7 + 0x09]
	tsubcc	%i3,	%l4,	%i4
	call	loop_130
	te	%xcc,	0x7
	nop
	setx	0xDC8FAD69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f20
	edge8l	%o7,	%i1,	%g5
loop_130:
	fpadd16	%f12,	%f6,	%f12
	bneg,pt	%icc,	loop_131
	nop
	setx	0xA9948C861A18A700,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f2
	fbuge	%fcc2,	loop_132
	mulx	%i5,	%g6,	%o5
loop_131:
	fxors	%f11,	%f20,	%f30
	fmovdge	%xcc,	%f7,	%f18
loop_132:
	udivcc	%o3,	0x1CCB,	%i2
	addccc	%i0,	0x1300,	%l6
	addccc	%o0,	%i7,	%l2
	sdiv	%l0,	0x1973,	%o2
	fmovda	%xcc,	%f7,	%f26
	array32	%l3,	%g7,	%o6
	fbl,a	%fcc1,	loop_133
	fnands	%f29,	%f12,	%f29
	set	0x44, %o3
	lda	[%l7 + %o3] 0x80,	%f30
loop_133:
	array32	%l1,	%o4,	%g3
	st	%f23,	[%l7 + 0x30]
	fmovdcc	%xcc,	%f16,	%f17
	sdiv	%i6,	0x0D02,	%g4
	fpsub32s	%f7,	%f26,	%f10
	or	%l5,	0x04AB,	%o1
	fmovdn	%icc,	%f3,	%f5
	edge32n	%g2,	%i3,	%l4
	nop
	fitod	%f4,	%f12
	fdtos	%f12,	%f18
	orncc	%i4,	0x1A10,	%g1
	xorcc	%o7,	0x1C52,	%i1
	array32	%i5,	%g6,	%o5
	fmuld8ulx16	%f0,	%f5,	%f10
	movrne	%o3,	%g5,	%i2
	xnor	%l6,	0x0C58,	%o0
	brlz	%i7,	loop_134
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f16,	%f0,	%f0
	tvc	%xcc,	0x6
loop_134:
	fmovdneg	%xcc,	%f19,	%f6
	movvs	%xcc,	%l2,	%l0
	andcc	%i0,	%l3,	%o2
	nop
	fitos	%f2,	%f17
	fstox	%f17,	%f18
	fxtos	%f18,	%f26
	movpos	%icc,	%o6,	%g7
	xnorcc	%l1,	0x048E,	%g3
	movrgez	%i6,	%o4,	%g4
	movge	%xcc,	%o1,	%g2
	fmovsneg	%xcc,	%f10,	%f25
	movleu	%xcc,	%l5,	%l4
	fbge,a	%fcc2,	loop_135
	nop
	setx	loop_136,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos,pt	%icc,	loop_137
	brgez,a	%i3,	loop_138
loop_135:
	fmovsvc	%xcc,	%f10,	%f17
loop_136:
	xorcc	%i4,	0x0228,	%g1
loop_137:
	edge32ln	%i1,	%i5,	%g6
loop_138:
	nop
	fitos	%f9,	%f13
	fstox	%f13,	%f18
	fpmerge	%f9,	%f6,	%f26
	fbge	%fcc2,	loop_139
	fpmerge	%f19,	%f24,	%f12
	udivx	%o7,	0x0139,	%o5
	nop
	setx	0x6B03C7083260E1C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f24
loop_139:
	nop
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x14
	fmul8x16	%f23,	%f0,	%f14
	sethi	0x142D,	%g5
	edge32	%i2,	%l6,	%o0
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f22
	fmovrslz	%i7,	%f0,	%f23
	popc	0x0192,	%o3
	movcs	%icc,	%l2,	%i0
	alignaddr	%l3,	%l0,	%o2
	movre	%g7,	0x14E,	%o6
	set	0x58, %i6
	sta	%f7,	[%l7 + %i6] 0x80
	movrlez	%l1,	0x345,	%g3
	edge16ln	%o4,	%g4,	%i6
	fnot1s	%f9,	%f3
	sllx	%g2,	0x0A,	%l5
	array8	%l4,	%o1,	%i4
	fsrc1s	%f4,	%f15
	ba	loop_140
	sub	%g1,	0x0656,	%i1
	fblg	%fcc0,	loop_141
	nop
	setx	0x2378DB7D82259BFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xB941B6D1FCD32CE3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f24,	%f26
loop_140:
	fnot1	%f0,	%f28
	ble	loop_142
loop_141:
	sethi	0x0D2B,	%i5
	movgu	%xcc,	%i3,	%g6
	and	%o5,	0x19C5,	%g5
loop_142:
	fpadd32	%f18,	%f24,	%f4
	wr	%g0,	0x89,	%asi
	sta	%f1,	[%l7 + 0x78] %asi
	fsrc2	%f14,	%f28
	movleu	%xcc,	%i2,	%l6
	edge16ln	%o0,	%o7,	%i7
	edge32	%o3,	%l2,	%l3
	edge32	%l0,	%o2,	%g7
	bl,pn	%xcc,	loop_143
	orncc	%i0,	%o6,	%l1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x2b,	%o4
loop_143:
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f20
	movle	%xcc,	%g3,	%g4
	fble,a	%fcc2,	loop_144
	mulscc	%g2,	%l5,	%i6
	tgu	%icc,	0x5
	movcc	%icc,	%l4,	%o1
loop_144:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i4,	%i1
	movl	%icc,	%g1,	%i5
	movrlz	%i3,	%g6,	%g5
	udivx	%i2,	0x0E78,	%o5
	orn	%o0,	%l6,	%i7
	fnand	%f20,	%f30,	%f30
	nop
	setx	0x280043D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x94F272A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f1,	%f24
	tge	%icc,	0x6
	bvs	%xcc,	loop_145
	andn	%o7,	%l2,	%l3
	sethi	0x0E77,	%l0
	mulx	%o2,	%g7,	%o3
loop_145:
	nop
	fitos	%f12,	%f25
	fstox	%f25,	%f18
	edge16	%i0,	%o6,	%o4
	fmovrdlez	%g3,	%f16,	%f6
	tge	%xcc,	0x3
	sllx	%l1,	%g2,	%l5
	edge32n	%g4,	%l4,	%i6
	addc	%o1,	0x050B,	%i1
	udivx	%g1,	0x019C,	%i4
	fbge	%fcc2,	loop_146
	xor	%i3,	%g6,	%i5
	andncc	%i2,	%o5,	%o0
	orn	%l6,	0x0DB9,	%i7
loop_146:
	alignaddrl	%o7,	%l2,	%g5
	movre	%l3,	%l0,	%g7
	and	%o2,	0x00A4,	%o3
	andncc	%o6,	%o4,	%g3
	umul	%l1,	0x0B74,	%i0
	array16	%g2,	%l5,	%l4
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f31
	andn	%g4,	0x1207,	%o1
	smulcc	%i6,	%g1,	%i4
	xor	%i1,	0x103D,	%i3
	movrgez	%g6,	0x10F,	%i5
	bg	%xcc,	loop_147
	prefetch	[%l7 + 0x64],	 0x2
	orn	%o5,	0x1828,	%i2
	std	%f4,	[%l7 + 0x58]
loop_147:
	edge16ln	%l6,	%i7,	%o0
	fmovdl	%icc,	%f30,	%f12
	xor	%o7,	%l2,	%g5
	fandnot2	%f12,	%f18,	%f20
	addccc	%l3,	0x04C6,	%g7
	sllx	%o2,	%l0,	%o3
	nop
	setx	0x75365B86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f30
	edge8l	%o6,	%o4,	%l1
	movcc	%xcc,	%g3,	%i0
	fbl,a	%fcc3,	loop_148
	fbug,a	%fcc2,	loop_149
	tvc	%xcc,	0x1
	smulcc	%l5,	%l4,	%g4
loop_148:
	orcc	%o1,	%i6,	%g1
loop_149:
	andn	%i4,	0x1D76,	%g2
	movrlz	%i1,	0x14C,	%i3
	ta	%icc,	0x7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	edge8	%i5,	%o5,	%i2
	nop
	setx	0x38E50A18,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xACC29CD1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f25,	%f17
	ta	%xcc,	0x3
	xorcc	%i7,	0x1984,	%o0
	taddcctv	%l6,	0x1D73,	%o7
	subccc	%l2,	%l3,	%g5
	sdiv	%o2,	0x0530,	%l0
	movge	%icc,	%g7,	%o6
	movleu	%icc,	%o3,	%l1
	movre	%o4,	0x023,	%g3
	faligndata	%f26,	%f26,	%f16
	bge,pt	%icc,	loop_150
	fxor	%f26,	%f10,	%f18
	xnor	%i0,	%l5,	%g4
	fmovse	%xcc,	%f21,	%f6
loop_150:
	xorcc	%o1,	%l4,	%i6
	fbe,a	%fcc1,	loop_151
	movneg	%xcc,	%i4,	%g1
	mova	%icc,	%i1,	%i3
	ldsh	[%l7 + 0x1C],	%g2
loop_151:
	fmovsvc	%xcc,	%f18,	%f18
	addccc	%i5,	%o5,	%g6
	sra	%i2,	%o0,	%i7
	movrgz	%o7,	0x330,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f4,	%f30
	movcs	%icc,	%l3,	%l2
	stb	%g5,	[%l7 + 0x30]
	move	%icc,	%o2,	%g7
	sub	%o6,	%o3,	%l0
	fmovdgu	%icc,	%f18,	%f5
	edge8ln	%o4,	%g3,	%l1
	tpos	%xcc,	0x3
	nop
	set	0x0A, %o5
	ldsh	[%l7 + %o5],	%l5
	addccc	%g4,	0x05EE,	%i0
	orcc	%l4,	0x08E8,	%i6
	fpsub16s	%f16,	%f1,	%f1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	alignaddrl	%o1,	%g1,	%i3
	srl	%i1,	0x18,	%i5
	tl	%icc,	0x5
	fbe	%fcc2,	loop_152
	movvc	%xcc,	%g2,	%o5
	movre	%i2,	%o0,	%i7
	movrne	%g6,	0x2FC,	%o7
loop_152:
	fmovrdne	%l3,	%f28,	%f28
	sdivx	%l2,	0x1605,	%g5
	srlx	%o2,	0x17,	%l6
	mova	%xcc,	%o6,	%g7
	mova	%icc,	%l0,	%o4
	stb	%o3,	[%l7 + 0x3D]
	edge16	%g3,	%l1,	%l5
	bn,a	%icc,	loop_153
	fornot1	%f28,	%f10,	%f18
	add	%g4,	%l4,	%i0
	ldstub	[%l7 + 0x67],	%i6
loop_153:
	movcs	%icc,	%i4,	%g1
	movrlez	%o1,	0x1D7,	%i1
	fnot1s	%f9,	%f29
	subc	%i3,	0x0C67,	%i5
	edge16n	%g2,	%i2,	%o0
	st	%f28,	[%l7 + 0x4C]
	fors	%f22,	%f8,	%f27
	fmovrdlez	%i7,	%f8,	%f18
	fmovdgu	%icc,	%f15,	%f26
	set	0x50, %g7
	stba	%o5,	[%l7 + %g7] 0x89
	fpadd32s	%f23,	%f18,	%f7
	fmovrsne	%o7,	%f12,	%f16
	sllx	%l3,	0x07,	%l2
	movvs	%icc,	%g5,	%o2
	movge	%icc,	%l6,	%o6
	bneg	loop_154
	mova	%icc,	%g6,	%l0
	orncc	%o4,	0x0D94,	%o3
	tg	%xcc,	0x6
loop_154:
	nop
	set	0x3D, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g3
	movgu	%icc,	%g7,	%l1
	subc	%g4,	0x0890,	%l4
	movrgz	%i0,	0x296,	%i6
	umulcc	%l5,	%i4,	%o1
	mulx	%i1,	%g1,	%i5
	fmovdgu	%xcc,	%f1,	%f1
	sra	%i3,	%g2,	%o0
	movcs	%xcc,	%i7,	%o5
	smul	%i2,	%o7,	%l2
	andncc	%g5,	%l3,	%l6
	brz	%o2,	loop_155
	movpos	%icc,	%o6,	%l0
	orncc	%g6,	%o3,	%o4
	movvc	%xcc,	%g3,	%l1
loop_155:
	nop
	setx	0xD18BC428,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x5E936022,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f10,	%f5
	te	%xcc,	0x7
	bneg,pn	%xcc,	loop_156
	brlz,a	%g7,	loop_157
	subccc	%g4,	0x015C,	%l4
	mova	%xcc,	%i6,	%l5
loop_156:
	movge	%xcc,	%i4,	%o1
loop_157:
	tleu	%icc,	0x3
	fmovrslz	%i0,	%f21,	%f22
	movn	%xcc,	%g1,	%i5
	mulscc	%i1,	%g2,	%o0
	fmovdn	%icc,	%f11,	%f19
	fpadd16s	%f24,	%f17,	%f26
	array32	%i7,	%i3,	%o5
	srlx	%o7,	%i2,	%l2
	movg	%icc,	%g5,	%l3
	tcc	%xcc,	0x2
	nop
	setx	0x2C36DE87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f20
	tle	%icc,	0x5
	fbne	%fcc0,	loop_158
	movpos	%xcc,	%l6,	%o6
	nop
	setx	0x8F2F358920ED6E6F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f20
	edge16n	%o2,	%g6,	%o3
loop_158:
	edge32	%l0,	%g3,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x0
	set	0x30, %g6
	lda	[%l7 + %g6] 0x88,	%f25
	xorcc	%o4,	%g4,	%l4
	fandnot1s	%f13,	%f28,	%f21
	mulscc	%g7,	0x043A,	%i6
	fors	%f22,	%f27,	%f20
	movpos	%xcc,	%l5,	%i4
	fmovrdlez	%o1,	%f4,	%f10
	movpos	%xcc,	%i0,	%g1
	edge16	%i5,	%g2,	%i1
	array16	%i7,	%i3,	%o0
	fmovscs	%xcc,	%f10,	%f11
	umulcc	%o7,	%o5,	%i2
	edge16	%g5,	%l2,	%l3
	srl	%l6,	%o2,	%o6
	set	0x24, %g2
	ldsba	[%l7 + %g2] 0x14,	%g6
	be,a	loop_159
	nop
	setx	0x90463529,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	tge	%xcc,	0x6
	fmovsvc	%xcc,	%f26,	%f14
loop_159:
	brgz,a	%l0,	loop_160
	nop
	setx	0xB08284F5007332F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	edge8n	%o3,	%g3,	%o4
	popc	%g4,	%l4
loop_160:
	fbug	%fcc2,	loop_161
	fmovdn	%xcc,	%f27,	%f12
	fpsub32	%f18,	%f28,	%f4
	nop
	set	0x74, %i3
	sth	%g7,	[%l7 + %i3]
loop_161:
	fmovdne	%icc,	%f28,	%f7
	srlx	%i6,	%l1,	%l5
	movge	%xcc,	%i4,	%i0
	fxnor	%f0,	%f18,	%f22
	set	0x20, %o6
	ldxa	[%l7 + %o6] 0x10,	%o1
	bshuffle	%f16,	%f2,	%f14
	array32	%i5,	%g2,	%g1
	edge32ln	%i7,	%i3,	%i1
	edge32l	%o7,	%o0,	%o5
	movn	%icc,	%g5,	%l2
	te	%icc,	0x6
	movneg	%icc,	%i2,	%l6
	ld	[%l7 + 0x34],	%f23
	fbue	%fcc1,	loop_162
	sll	%l3,	%o6,	%g6
	sdivcc	%l0,	0x0DCB,	%o2
	ldub	[%l7 + 0x47],	%o3
loop_162:
	movg	%icc,	%o4,	%g3
	fmovsa	%xcc,	%f29,	%f21
	fornot1	%f30,	%f14,	%f10
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	array32	%l4,	%i6,	%g7
	tgu	%icc,	0x1
	ld	[%l7 + 0x24],	%f26
	or	%l5,	%i4,	%l1
	movg	%xcc,	%i0,	%o1
	movcc	%icc,	%i5,	%g2
	movneg	%xcc,	%g1,	%i7
	fnand	%f0,	%f4,	%f12
	taddcctv	%i3,	0x0E69,	%o7
	tpos	%xcc,	0x7
	umulcc	%i1,	0x1CEA,	%o0
	taddcctv	%g5,	0x17D1,	%o5
	fnot2s	%f28,	%f0
	movvs	%xcc,	%l2,	%l6
	fnot1s	%f15,	%f5
	mulx	%i2,	%l3,	%g6
	and	%o6,	%o2,	%o3
	tvc	%xcc,	0x4
	tcc	%icc,	0x5
	andncc	%l0,	%g3,	%o4
	brgez	%g4,	loop_163
	fnot2	%f10,	%f30
	edge32n	%i6,	%g7,	%l4
	srax	%i4,	%l1,	%l5
loop_163:
	tgu	%xcc,	0x7
	brlez	%i0,	loop_164
	taddcctv	%i5,	0x171B,	%o1
	fand	%f22,	%f22,	%f4
	udiv	%g2,	0x1B81,	%i7
loop_164:
	fmovrdlez	%g1,	%f26,	%f8
	fzeros	%f0
	movge	%icc,	%o7,	%i1
	sdivx	%o0,	0x06B7,	%i3
	umulcc	%g5,	%l2,	%o5
	andncc	%i2,	%l3,	%l6
	fpackfix	%f0,	%f17
	movvs	%icc,	%g6,	%o2
	brz,a	%o6,	loop_165
	taddcctv	%o3,	0x1BE2,	%g3
	xorcc	%o4,	%l0,	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%l4
loop_165:
	nop
	set	0x78, %o0
	lduba	[%l7 + %o0] 0x80,	%i4
	fmovdcc	%icc,	%f16,	%f17
	srl	%l1,	0x1E,	%l5
	swap	[%l7 + 0x58],	%i0
	edge16ln	%g4,	%o1,	%i5
	nop
	setx	0x7865FB80,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f17
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x76] %asi,	%i7
	movcc	%icc,	%g2,	%g1
	fpackfix	%f26,	%f21
	fmovsneg	%xcc,	%f21,	%f3
	movcs	%xcc,	%i1,	%o7
	srax	%o0,	%g5,	%i3
	bvs,a	loop_166
	tn	%icc,	0x0
	nop
	setx	loop_167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmple16	%f12,	%f24,	%l2
loop_166:
	mulx	%o5,	%i2,	%l6
	nop
	setx	0xDBE88800,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f9
loop_167:
	for	%f28,	%f16,	%f14
	tvs	%xcc,	0x0
	nop
	setx	0x0BB80286,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f20
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l3,	%o2
	fbn	%fcc0,	loop_168
	lduw	[%l7 + 0x48],	%o6
	ta	%icc,	0x0
	fmovsn	%icc,	%f3,	%f1
loop_168:
	fmovrse	%g6,	%f15,	%f11
	tsubcc	%o3,	%o4,	%l0
	fmuld8ulx16	%f7,	%f14,	%f4
	mulx	%i6,	%g3,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x3
	tvs	%icc,	0x4
	movl	%xcc,	%g7,	%l1
	fcmpeq16	%f4,	%f12,	%i4
	edge32l	%l5,	%i0,	%o1
	subccc	%g4,	%i5,	%g2
	movge	%icc,	%i7,	%i1
	fnot2s	%f0,	%f7
	tge	%xcc,	0x0
	fnegs	%f22,	%f14
	fba,a	%fcc3,	loop_169
	movpos	%icc,	%o7,	%o0
	flush	%l7 + 0x78
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g5
loop_169:
	tleu	%xcc,	0x0
	fzeros	%f21
	ldx	[%l7 + 0x50],	%g1
	movrgez	%i3,	%l2,	%o5
	nop
	setx loop_170, %l0, %l1
	jmpl %l1, %l6
	array8	%i2,	%o2,	%l3
	fandnot2s	%f9,	%f2,	%f8
	movvc	%icc,	%g6,	%o6
loop_170:
	addccc	%o3,	%o4,	%l0
	movrne	%i6,	%l4,	%g3
	std	%f18,	[%l7 + 0x20]
	edge8	%l1,	%i4,	%g7
	udivx	%i0,	0x0969,	%o1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%g4
	movne	%icc,	%i5,	%l5
	xorcc	%g2,	%i7,	%i1
	bpos,pn	%xcc,	loop_171
	xnor	%o7,	0x109F,	%g5
	edge8l	%g1,	%i3,	%o0
	fcmpeq16	%f8,	%f16,	%o5
loop_171:
	smul	%l6,	%i2,	%o2
	te	%icc,	0x7
	addccc	%l2,	0x0007,	%l3
	xnorcc	%o6,	0x1EDC,	%g6
	andn	%o3,	%l0,	%i6
	edge32l	%o4,	%g3,	%l4
	alignaddrl	%i4,	%l1,	%i0
	movn	%icc,	%g7,	%g4
	movn	%xcc,	%i5,	%o1
	umul	%g2,	%l5,	%i1
	edge16ln	%i7,	%o7,	%g1
	nop
	setx loop_172, %l0, %l1
	jmpl %l1, %i3
	fmuld8ulx16	%f28,	%f0,	%f26
	movcs	%icc,	%g5,	%o5
	bcc,a,pn	%icc,	loop_173
loop_172:
	fbue,a	%fcc2,	loop_174
	fbue,a	%fcc3,	loop_175
	tsubcc	%l6,	%i2,	%o2
loop_173:
	fsrc2	%f12,	%f6
loop_174:
	bvc,a	loop_176
loop_175:
	sll	%l2,	%o0,	%o6
	movle	%icc,	%l3,	%o3
	fbul	%fcc1,	loop_177
loop_176:
	brz	%g6,	loop_178
	mova	%xcc,	%i6,	%l0
	alignaddrl	%o4,	%g3,	%l4
loop_177:
	nop
	fitos	%f4,	%f10
	fstoi	%f10,	%f13
loop_178:
	fors	%f20,	%f17,	%f19
	andn	%i4,	%l1,	%g7
	xnorcc	%g4,	0x11DC,	%i5
	fmovsg	%icc,	%f9,	%f20
	sdivx	%i0,	0x0F01,	%g2
	orcc	%o1,	%i1,	%i7
	edge32l	%o7,	%l5,	%i3
	fsrc1	%f12,	%f10
	tleu	%icc,	0x0
	subccc	%g1,	%o5,	%l6
	wr	%g0,	0x89,	%asi
	sta	%f0,	[%l7 + 0x30] %asi
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x88
	xnor	%g5,	%i2,	%o2
	stb	%o0,	[%l7 + 0x42]
	and	%l2,	%o6,	%l3
	ta	%icc,	0x7
	lduw	[%l7 + 0x34],	%o3
	taddcctv	%i6,	%l0,	%g6
	andcc	%g3,	%o4,	%l4
	bleu,a,pn	%icc,	loop_179
	fble	%fcc0,	loop_180
	fmovdvs	%icc,	%f23,	%f6
	nop
	setx	0x5076C570,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
loop_179:
	stbar
loop_180:
	stbar
	movvc	%icc,	%l1,	%g7
	edge8n	%i4,	%g4,	%i0
	movl	%icc,	%g2,	%o1
	bl,a,pn	%icc,	loop_181
	edge16ln	%i5,	%i7,	%i1
	movg	%icc,	%o7,	%i3
	movge	%xcc,	%g1,	%o5
loop_181:
	sll	%l5,	0x1C,	%g5
	alignaddrl	%i2,	%l6,	%o2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x81
	movcs	%xcc,	%o0,	%l2
	ldstub	[%l7 + 0x7C],	%o6
	bpos,pt	%icc,	loop_182
	fba,a	%fcc2,	loop_183
	nop
	setx	0x57E48A4B804D63C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	tvc	%xcc,	0x2
loop_182:
	fcmple32	%f10,	%f12,	%l3
loop_183:
	nop
	set	0x0D, %l6
	ldsb	[%l7 + %l6],	%o3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%l0
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f4
	fnegd	%f4,	%f8
	fmovdl	%icc,	%f10,	%f14
	bne,a,pn	%xcc,	loop_184
	movrgz	%i6,	0x01F,	%g3
	udivx	%g6,	0x1618,	%l4
	fbl	%fcc2,	loop_185
loop_184:
	fand	%f4,	%f16,	%f6
	fmovrdlz	%l1,	%f26,	%f8
	fmovdn	%icc,	%f20,	%f10
loop_185:
	edge16	%g7,	%o4,	%i4
	flush	%l7 + 0x4C
	brz,a	%g4,	loop_186
	ldsw	[%l7 + 0x44],	%i0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o1
loop_186:
	edge32l	%i7,	%i5,	%i1
	set	0x3C, %l5
	lda	[%l7 + %l5] 0x80,	%f2
	movvc	%icc,	%o7,	%g1
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f20
	fblg,a	%fcc3,	loop_187
	nop
	setx	0x367CEB02705896E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	edge8l	%o5,	%i3,	%g5
	fbu	%fcc0,	loop_188
loop_187:
	fpadd16	%f16,	%f28,	%f22
	andcc	%l5,	0x191D,	%l6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x04
loop_188:
	bgu,pn	%icc,	loop_189
	nop
	setx	loop_190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc,a	loop_191
	fmovrde	%i2,	%f8,	%f12
loop_189:
	fbule	%fcc3,	loop_192
loop_190:
	ldub	[%l7 + 0x67],	%o2
loop_191:
	edge32	%l2,	%o6,	%o0
	std	%f0,	[%l7 + 0x50]
loop_192:
	brnz	%l3,	loop_193
	umulcc	%o3,	%i6,	%g3
	sdiv	%g6,	0x1605,	%l4
	tleu	%icc,	0x1
loop_193:
	smul	%l0,	%l1,	%o4
	ldstub	[%l7 + 0x55],	%i4
	move	%xcc,	%g7,	%g4
	prefetch	[%l7 + 0x78],	 0x0
	tcs	%xcc,	0x1
	edge8l	%g2,	%o1,	%i7
	edge32l	%i0,	%i1,	%i5
	bshuffle	%f8,	%f16,	%f2
	movrgez	%g1,	%o7,	%i3
	bpos,a,pt	%xcc,	loop_194
	edge8l	%o5,	%l5,	%g5
	ta	%xcc,	0x0
	call	loop_195
loop_194:
	xnor	%l6,	0x17AF,	%i2
	sdiv	%o2,	0x072B,	%o6
	sdivcc	%o0,	0x1A42,	%l2
loop_195:
	and	%o3,	%i6,	%g3
	smul	%l3,	0x04B3,	%l4
	movge	%xcc,	%g6,	%l1
	taddcctv	%l0,	0x1E94,	%o4
	fmovdg	%xcc,	%f25,	%f1
	movvc	%xcc,	%g7,	%g4
	movvc	%xcc,	%i4,	%o1
	movcc	%xcc,	%i7,	%g2
	fabss	%f3,	%f7
	subccc	%i0,	0x0DDA,	%i5
	sth	%i1,	[%l7 + 0x26]
	edge16	%o7,	%g1,	%i3
	movl	%xcc,	%l5,	%o5
	bl,a,pt	%icc,	loop_196
	membar	0x2D
	srax	%l6,	0x1F,	%i2
	set	0x6A, %i7
	ldstuba	[%l7 + %i7] 0x11,	%o2
loop_196:
	edge16n	%o6,	%o0,	%l2
	subccc	%g5,	%i6,	%o3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l3,	%l4
	brgez	%g3,	loop_197
	stw	%l1,	[%l7 + 0x6C]
	fmovsne	%xcc,	%f25,	%f11
	stw	%l0,	[%l7 + 0x30]
loop_197:
	fmovdvc	%icc,	%f24,	%f25
	mova	%icc,	%g6,	%o4
	movg	%icc,	%g4,	%g7
	fmovsle	%icc,	%f13,	%f16
	smulcc	%o1,	%i4,	%g2
	srax	%i7,	%i0,	%i1
	fmovrdne	%i5,	%f16,	%f28
	fbuge	%fcc3,	loop_198
	movg	%icc,	%g1,	%o7
	fands	%f3,	%f0,	%f16
	bge,a,pt	%xcc,	loop_199
loop_198:
	fba	%fcc1,	loop_200
	fbne,a	%fcc1,	loop_201
	umul	%l5,	%o5,	%l6
loop_199:
	fones	%f11
loop_200:
	popc	%i3,	%i2
loop_201:
	mulx	%o6,	%o0,	%l2
	stx	%o2,	[%l7 + 0x30]
	fand	%f20,	%f18,	%f0
	orncc	%g5,	%o3,	%l3
	bcs,a	%icc,	loop_202
	subc	%i6,	0x1B14,	%g3
	sra	%l1,	%l0,	%g6
	fcmple32	%f2,	%f18,	%o4
loop_202:
	udivx	%g4,	0x066B,	%l4
	std	%f10,	[%l7 + 0x58]
	andcc	%g7,	0x0A1B,	%i4
	move	%icc,	%o1,	%i7
	alignaddr	%g2,	%i0,	%i5
	ldstub	[%l7 + 0x59],	%i1
	movvs	%icc,	%g1,	%o7
	tge	%icc,	0x3
	edge8l	%l5,	%o5,	%l6
	fbo,a	%fcc1,	loop_203
	fnot1s	%f9,	%f12
	fnot1	%f24,	%f6
	edge8n	%i2,	%o6,	%o0
loop_203:
	call	loop_204
	mulx	%l2,	%i3,	%g5
	udivx	%o2,	0x1BF0,	%o3
	fnot1s	%f11,	%f4
loop_204:
	fbne	%fcc3,	loop_205
	umulcc	%i6,	0x12F8,	%l3
	tcs	%icc,	0x5
	sir	0x1856
loop_205:
	movrlez	%l1,	%g3,	%g6
	movcs	%xcc,	%l0,	%o4
	orncc	%g4,	0x1C25,	%l4
	tcs	%icc,	0x6
	fbul	%fcc1,	loop_206
	fmul8x16al	%f12,	%f3,	%f0
	umulcc	%i4,	0x0B9F,	%o1
	popc	%g7,	%i7
loop_206:
	movn	%xcc,	%i0,	%i5
	movre	%i1,	%g2,	%g1
	fnot1s	%f15,	%f26
	fmovrsne	%o7,	%f23,	%f9
	ldd	[%l7 + 0x10],	%l4
	bshuffle	%f14,	%f12,	%f8
	tsubcc	%l6,	%o5,	%i2
	nop
	setx	0x21C29C4754FF54D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x692280598D6FA0A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f22,	%f6
	fblg,a	%fcc1,	loop_207
	movl	%icc,	%o0,	%o6
	movrne	%i3,	0x0A5,	%g5
	movrgz	%o2,	%o3,	%i6
loop_207:
	tvs	%icc,	0x4
	edge16ln	%l2,	%l3,	%l1
	fcmpeq16	%f14,	%f24,	%g3
	flush	%l7 + 0x14
	brlez,a	%g6,	loop_208
	call	loop_209
	ta	%icc,	0x1
	sir	0x073C
loop_208:
	bg,pn	%icc,	loop_210
loop_209:
	fmovda	%xcc,	%f14,	%f28
	membar	0x59
	movge	%icc,	%l0,	%g4
loop_210:
	movrlz	%o4,	%l4,	%i4
	fmovdvs	%icc,	%f17,	%f26
	fbuge	%fcc0,	loop_211
	fand	%f22,	%f20,	%f4
	tcs	%icc,	0x0
	srax	%o1,	0x01,	%i7
loop_211:
	alignaddr	%g7,	%i5,	%i0
	taddcc	%g2,	%g1,	%o7
	movg	%xcc,	%i1,	%l5
	fmovscs	%icc,	%f11,	%f7
	andncc	%l6,	%o5,	%i2
	ldstub	[%l7 + 0x1F],	%o0
	fxnors	%f19,	%f6,	%f9
	nop
	fitos	%f2,	%f14
	fstod	%f14,	%f4
	fmovdvs	%icc,	%f21,	%f29
	bg,pt	%xcc,	loop_212
	subc	%o6,	%i3,	%g5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x16] %asi,	%o3
loop_212:
	tvs	%xcc,	0x3
	array16	%i6,	%o2,	%l3
	set	0x31, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l2
	fsrc1s	%f28,	%f5
	movgu	%xcc,	%g3,	%l1
	sir	0x025D
	fsrc2s	%f3,	%f2
	fmovsge	%icc,	%f12,	%f2
	fbge,a	%fcc1,	loop_213
	fble	%fcc3,	loop_214
	alignaddr	%g6,	%g4,	%l0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o4
loop_213:
	alignaddrl	%i4,	%l4,	%o1
loop_214:
	andcc	%i7,	%i5,	%g7
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrlez	%g2,	%g1,	%i0
	movcs	%xcc,	%i1,	%o7
	movcc	%xcc,	%l5,	%l6
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x15
	sdivcc	%i2,	0x0628,	%o0
	edge32ln	%o5,	%o6,	%g5
	set	0x48, %l3
	lduwa	[%l7 + %l3] 0x15,	%i3
	tsubcc	%o3,	0x0FB0,	%o2
	xor	%i6,	%l2,	%l3
	edge8ln	%g3,	%g6,	%g4
	bg,a	loop_215
	edge32ln	%l1,	%l0,	%o4
	set	0x21, %g5
	ldsba	[%l7 + %g5] 0x81,	%l4
loop_215:
	popc	%o1,	%i7
	sdiv	%i4,	0x1521,	%g7
	edge16n	%g2,	%g1,	%i0
	fnot1s	%f14,	%f24
	udivx	%i5,	0x1E60,	%o7
	movne	%icc,	%i1,	%l6
	movpos	%xcc,	%l5,	%i2
	fcmpne16	%f0,	%f22,	%o5
	tvc	%icc,	0x4
	movneg	%icc,	%o6,	%g5
	set	0x20, %l1
	stxa	%o0,	[%g0 + %l1] 0x4f
	movpos	%xcc,	%o3,	%i3
	fmul8ulx16	%f10,	%f10,	%f8
	nop
	setx	0x0FBCD0BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xA937B04B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f31,	%f5
	brlz	%i6,	loop_216
	srlx	%o2,	0x13,	%l3
	brlez,a	%g3,	loop_217
	smul	%l2,	0x1EA2,	%g6
loop_216:
	fmovdg	%icc,	%f26,	%f14
	movneg	%xcc,	%g4,	%l1
loop_217:
	fbule	%fcc1,	loop_218
	tle	%icc,	0x3
	nop
	fitos	%f1,	%f8
	fstox	%f8,	%f0
	mulscc	%l0,	%o4,	%o1
loop_218:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc3,	loop_219
	for	%f10,	%f10,	%f18
	fmul8x16au	%f19,	%f7,	%f20
	fbg	%fcc3,	loop_220
loop_219:
	movg	%xcc,	%l4,	%i7
	tcs	%xcc,	0x0
	fmovdne	%icc,	%f1,	%f22
loop_220:
	addccc	%i4,	0x1599,	%g2
	nop
	setx	loop_221,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%g1,	%i0,	%g7
	bneg,a,pn	%icc,	loop_222
	sethi	0x1348,	%i5
loop_221:
	alignaddrl	%o7,	%l6,	%i1
	edge32	%l5,	%i2,	%o5
loop_222:
	fbn,a	%fcc1,	loop_223
	tcc	%xcc,	0x5
	alignaddr	%g5,	%o0,	%o6
	fmovdne	%xcc,	%f20,	%f21
loop_223:
	udivx	%o3,	0x0A02,	%i3
	tsubcc	%i6,	0x1AB9,	%o2
	smulcc	%l3,	%g3,	%l2
	tcc	%icc,	0x5
	bge,pt	%xcc,	loop_224
	udivx	%g4,	0x1D18,	%g6
	udivcc	%l1,	0x1880,	%l0
	movvc	%icc,	%o4,	%l4
loop_224:
	bneg,a	%xcc,	loop_225
	bneg,a	loop_226
	fba	%fcc1,	loop_227
	fmovdl	%icc,	%f17,	%f21
loop_225:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_226:
	subcc	%o1,	%i4,	%g2
loop_227:
	fmovsvs	%icc,	%f23,	%f6
	fmovde	%icc,	%f17,	%f21
	membar	0x3D
	fmovsgu	%xcc,	%f17,	%f27
	movcc	%xcc,	%g1,	%i0
	fbn,a	%fcc0,	loop_228
	srax	%i7,	0x1B,	%i5
	andcc	%g7,	%l6,	%o7
	mulx	%i1,	%i2,	%l5
loop_228:
	fbe	%fcc2,	loop_229
	fmovrdne	%g5,	%f26,	%f12
	tvs	%xcc,	0x5
	movre	%o0,	0x0E3,	%o6
loop_229:
	array16	%o3,	%o5,	%i3
	movvc	%icc,	%i6,	%o2
	edge8	%g3,	%l2,	%g4
	addccc	%g6,	%l1,	%l0
	tvs	%icc,	0x2
	fmovdcc	%xcc,	%f25,	%f19
	movvs	%icc,	%l3,	%l4
	fmovrdgez	%o4,	%f24,	%f20
	fnands	%f21,	%f23,	%f17
	stbar
	fnot1	%f4,	%f12
	fmovrde	%o1,	%f18,	%f24
	sdivcc	%g2,	0x199B,	%i4
	addccc	%i0,	0x0444,	%i7
	fpadd32	%f0,	%f20,	%f20
	swap	[%l7 + 0x54],	%i5
	tgu	%xcc,	0x3
	fors	%f28,	%f21,	%f31
	nop
	setx	0x6640F42E807E3C33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	tcs	%xcc,	0x2
	tcs	%icc,	0x3
	set	0x68, %o2
	stxa	%g7,	[%l7 + %o2] 0x18
	edge32n	%g1,	%o7,	%i1
	tne	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l6,	%i2,	%g5
	tcs	%icc,	0x2
	fbg	%fcc2,	loop_230
	fsrc2s	%f29,	%f23
	set	0x4C, %l0
	stwa	%o0,	[%l7 + %l0] 0x2f
	membar	#Sync
loop_230:
	brnz	%l5,	loop_231
	fnand	%f24,	%f2,	%f28
	fnor	%f6,	%f20,	%f8
	fbe,a	%fcc1,	loop_232
loop_231:
	addccc	%o3,	0x1A24,	%o6
	fandnot2	%f16,	%f2,	%f6
	edge32	%i3,	%o5,	%o2
loop_232:
	fmovrslez	%g3,	%f24,	%f5
	orcc	%l2,	0x0772,	%i6
	nop
	set	0x0C, %g3
	ldsh	[%l7 + %g3],	%g4
	movn	%xcc,	%l1,	%g6
	be	loop_233
	fmovsa	%icc,	%f27,	%f19
	movl	%icc,	%l0,	%l4
	prefetch	[%l7 + 0x18],	 0x3
loop_233:
	movrlz	%o4,	0x31A,	%o1
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x0c,	%g2
	mulx	%l3,	0x0760,	%i0
	fbg	%fcc0,	loop_234
	movrgez	%i4,	0x18A,	%i7
	umulcc	%g7,	0x1D28,	%g1
	mulscc	%o7,	%i5,	%l6
loop_234:
	udivx	%i2,	0x0709,	%g5
	alignaddr	%o0,	%i1,	%o3
	bvs	%xcc,	loop_235
	umulcc	%l5,	0x113F,	%i3
	udiv	%o5,	0x06DA,	%o6
	fbo	%fcc1,	loop_236
loop_235:
	alignaddr	%g3,	%o2,	%i6
	set	0x38, %g4
	ldsha	[%l7 + %g4] 0x11,	%g4
loop_236:
	brlz,a	%l1,	loop_237
	xnorcc	%g6,	0x00EC,	%l0
	srax	%l2,	0x1C,	%o4
	brgez	%o1,	loop_238
loop_237:
	movvs	%icc,	%l4,	%g2
	fones	%f7
	sdivcc	%l3,	0x0E3B,	%i4
loop_238:
	bg	%xcc,	loop_239
	nop
	setx	0x19010F1B24107857,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f16
	tcc	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_239:
	popc	0x0B58,	%i0
	fbul,a	%fcc2,	loop_240
	tsubcc	%i7,	0x1C4F,	%g1
	addcc	%g7,	%o7,	%i5
	movre	%i2,	%l6,	%o0
loop_240:
	movne	%xcc,	%g5,	%o3
	orcc	%i1,	0x04AE,	%l5
	movcs	%xcc,	%o5,	%i3
	umul	%g3,	%o2,	%i6
	bpos,a,pt	%icc,	loop_241
	move	%icc,	%o6,	%l1
	bl,a	%xcc,	loop_242
	movrlz	%g6,	%l0,	%l2
loop_241:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x2
loop_242:
	movne	%xcc,	%g4,	%o1
	fbn,a	%fcc2,	loop_243
	tvs	%xcc,	0x0
	fmovrdgez	%o4,	%f30,	%f20
	fbge,a	%fcc2,	loop_244
loop_243:
	fmovdle	%xcc,	%f10,	%f20
	sub	%g2,	0x0231,	%l4
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f8
	fxtod	%f8,	%f24
loop_244:
	subcc	%l3,	0x0549,	%i4
	edge8n	%i0,	%g1,	%i7
	fnegs	%f4,	%f28
	fpack32	%f24,	%f2,	%f18
	edge32	%o7,	%i5,	%i2
	xnorcc	%l6,	0x02F9,	%o0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x3D] %asi,	%g5
	fornot2	%f8,	%f4,	%f0
	movneg	%icc,	%o3,	%i1
	membar	0x4D
	add	%g7,	0x175D,	%l5
	fbl,a	%fcc2,	loop_245
	fmovde	%xcc,	%f2,	%f22
	andcc	%i3,	%o5,	%g3
	bvc,pn	%xcc,	loop_246
loop_245:
	sir	0x0560
	fmovsn	%icc,	%f22,	%f20
	smulcc	%i6,	%o2,	%o6
loop_246:
	edge8	%l1,	%g6,	%l0
	set	0x2E, %o7
	stba	%g4,	[%l7 + %o7] 0x04
	xor	%o1,	%l2,	%o4
	nop
	set	0x09, %l4
	ldsb	[%l7 + %l4],	%g2
	andn	%l3,	0x0A3C,	%i4
	taddcc	%i0,	0x01F3,	%g1
	tle	%xcc,	0x1
	taddcctv	%l4,	%i7,	%i5
	set	0x30, %i4
	swapa	[%l7 + %i4] 0x10,	%i2
	movvs	%icc,	%o7,	%o0
	membar	0x0A
	edge8ln	%g5,	%o3,	%l6
	ldub	[%l7 + 0x18],	%i1
	set	0x4C, %o3
	swapa	[%l7 + %o3] 0x88,	%g7
	fpack16	%f22,	%f8
	nop
	fitod	%f12,	%f8
	fdtoi	%f8,	%f5
	xor	%l5,	%o5,	%g3
	taddcc	%i6,	0x04CD,	%o2
	alignaddrl	%o6,	%i3,	%g6
	fcmple32	%f8,	%f28,	%l1
	fmovdgu	%xcc,	%f1,	%f16
	mova	%icc,	%l0,	%g4
	andncc	%l2,	%o4,	%o1
	fornot1s	%f27,	%f13,	%f0
	bge,a	%icc,	loop_247
	subc	%g2,	%l3,	%i0
	move	%icc,	%i4,	%l4
	mulscc	%g1,	0x0D57,	%i7
loop_247:
	tvc	%xcc,	0x1
	edge8n	%i2,	%o7,	%o0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sethi	0x0515,	%g5
	movne	%icc,	%i5,	%l6
	fbug	%fcc1,	loop_248
	tn	%icc,	0x0
	umul	%i1,	%g7,	%l5
	movne	%icc,	%o5,	%o3
loop_248:
	taddcc	%i6,	0x0C33,	%g3
	or	%o2,	0x1924,	%i3
	orncc	%g6,	0x1035,	%o6
	edge16ln	%l1,	%l0,	%g4
	ta	%xcc,	0x6
	fsrc2s	%f14,	%f23
	fornot1s	%f15,	%f21,	%f28
	tcs	%icc,	0x4
	movne	%xcc,	%l2,	%o4
	sll	%o1,	%g2,	%l3
	movcc	%icc,	%i4,	%l4
	ldub	[%l7 + 0x49],	%g1
	subcc	%i0,	%i7,	%i2
	set	0x66, %i0
	lduba	[%l7 + %i0] 0x10,	%o7
	movne	%icc,	%o0,	%i5
	movcs	%xcc,	%l6,	%i1
	tle	%xcc,	0x6
	movcc	%icc,	%g7,	%g5
	mulscc	%o5,	%o3,	%i6
	sethi	0x159E,	%l5
	fornot1	%f10,	%f22,	%f20
	xnor	%g3,	%o2,	%i3
	movvs	%xcc,	%o6,	%g6
	fmovsn	%icc,	%f8,	%f10
	sdivcc	%l0,	0x1387,	%l1
	tl	%icc,	0x3
	edge32l	%l2,	%g4,	%o4
	fmovrdgz	%o1,	%f24,	%f24
	movvs	%icc,	%l3,	%i4
	membar	0x54
	edge32ln	%g2,	%g1,	%l4
	edge8l	%i0,	%i7,	%i2
	nop
	setx	0x2F23F32E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x7087A3DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f16,	%f3
	nop
	setx	loop_249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbule	%fcc3,	loop_250
	tleu	%icc,	0x7
	alignaddrl	%o7,	%o0,	%l6
loop_249:
	tleu	%icc,	0x6
loop_250:
	fpsub16s	%f13,	%f24,	%f9
	ta	%icc,	0x1
	fmovrslez	%i5,	%f23,	%f17
	set	0x0C, %i6
	ldswa	[%l7 + %i6] 0x0c,	%i1
	sra	%g5,	%g7,	%o3
	nop
	fitod	%f2,	%f6
	fdtoi	%f6,	%f27
	movvs	%icc,	%i6,	%o5
	movl	%xcc,	%g3,	%o2
	andncc	%i3,	%o6,	%l5
	udivx	%l0,	0x0012,	%g6
	tg	%icc,	0x3
	srl	%l2,	0x09,	%g4
	ta	%icc,	0x4
	movl	%icc,	%l1,	%o4
	tsubcctv	%l3,	%o1,	%i4
	fabsd	%f0,	%f4
	fbn	%fcc1,	loop_251
	subc	%g1,	0x161E,	%l4
	fmovspos	%icc,	%f14,	%f30
	orcc	%i0,	%i7,	%i2
loop_251:
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
	movge	%icc,	%o7,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x7
loop_252:
	andncc	%l6,	%o0,	%i1
	nop
	setx	0x97164A4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x66DBCA15,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f17,	%f0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bvc	loop_253
	fmovrslez	%i5,	%f2,	%f29
	movneg	%icc,	%g7,	%o3
	fmovdneg	%icc,	%f17,	%f1
loop_253:
	tneg	%icc,	0x1
	nop
	set	0x78, %g7
	stx	%i6,	[%l7 + %g7]
	mova	%icc,	%g5,	%g3
	movle	%xcc,	%o2,	%i3
	fnors	%f9,	%f26,	%f2
	tg	%xcc,	0x4
	edge16ln	%o6,	%o5,	%l0
	fmovdvc	%xcc,	%f30,	%f8
	fpmerge	%f3,	%f0,	%f2
	fmovdvc	%icc,	%f19,	%f7
	umul	%l5,	0x030E,	%g6
	bvc,a	%icc,	loop_254
	srl	%l2,	0x1C,	%g4
	srlx	%l1,	%o4,	%o1
	udivx	%l3,	0x04C0,	%g1
loop_254:
	edge32l	%i4,	%l4,	%i0
	edge16l	%i7,	%o7,	%g2
	bshuffle	%f10,	%f16,	%f16
	subcc	%l6,	%o0,	%i2
	movge	%xcc,	%i5,	%g7
	or	%i1,	%i6,	%o3
	tneg	%icc,	0x0
	tleu	%xcc,	0x0
	bpos	loop_255
	array8	%g5,	%o2,	%g3
	bgu	loop_256
	edge8l	%i3,	%o5,	%l0
loop_255:
	xor	%l5,	%o6,	%g6
	edge32ln	%g4,	%l1,	%l2
loop_256:
	fbe	%fcc3,	loop_257
	stbar
	subc	%o4,	0x00B9,	%o1
	fblg	%fcc3,	loop_258
loop_257:
	edge16l	%g1,	%l3,	%l4
	fmovdne	%icc,	%f24,	%f13
	alignaddr	%i0,	%i7,	%o7
loop_258:
	movl	%xcc,	%i4,	%l6
	tvs	%icc,	0x0
	brz	%g2,	loop_259
	edge8ln	%i2,	%i5,	%g7
	edge32n	%i1,	%i6,	%o3
	smul	%o0,	%g5,	%g3
loop_259:
	movg	%icc,	%i3,	%o2
	movrgez	%l0,	0x2A8,	%o5
	alignaddrl	%o6,	%l5,	%g4
	orcc	%g6,	%l2,	%o4
	fmovrsgz	%o1,	%f29,	%f20
	subcc	%g1,	%l1,	%l4
	ldsh	[%l7 + 0x48],	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f14,	%f3
	srl	%i7,	0x07,	%i0
	fands	%f17,	%f10,	%f16
	tneg	%icc,	0x0
	sdiv	%i4,	0x01C0,	%l6
	move	%icc,	%g2,	%o7
	bvs,pt	%icc,	loop_260
	call	loop_261
	addcc	%i5,	0x19ED,	%i2
	ble	%xcc,	loop_262
loop_260:
	te	%icc,	0x3
loop_261:
	nop
	setx loop_263, %l0, %l1
	jmpl %l1, %i1
	te	%icc,	0x5
loop_262:
	fmovdge	%xcc,	%f4,	%f16
	fzero	%f18
loop_263:
	sub	%g7,	0x0DDB,	%i6
	fmovrsne	%o0,	%f3,	%f7
	addc	%o3,	%g3,	%g5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i3
	umulcc	%l0,	0x064E,	%o2
	array32	%o6,	%o5,	%g4
	fmovdneg	%icc,	%f2,	%f21
	edge16	%l5,	%l2,	%g6
	movvs	%xcc,	%o1,	%g1
	fbuge,a	%fcc0,	loop_264
	subccc	%o4,	0x1296,	%l1
	bgu,a	loop_265
	bn,pt	%xcc,	loop_266
loop_264:
	fsrc2	%f14,	%f22
	sdivx	%l4,	0x17F9,	%l3
loop_265:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_266:
	fmul8ulx16	%f12,	%f28,	%f10
	fand	%f22,	%f0,	%f8
	tne	%icc,	0x2
	fandnot1s	%f31,	%f31,	%f10
	edge32ln	%i7,	%i4,	%l6
	umul	%i0,	0x09C1,	%o7
	fpmerge	%f24,	%f15,	%f22
	tsubcctv	%g2,	0x0C85,	%i2
	fmovdvs	%xcc,	%f20,	%f26
	movneg	%icc,	%i5,	%g7
	set	0x58, %i5
	ldswa	[%l7 + %i5] 0x80,	%i6
	add	%o0,	%i1,	%o3
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
	fbuge,a	%fcc2,	loop_268
	tl	%xcc,	0x6
	add	%g5,	%g3,	%i3
loop_267:
	edge16ln	%o2,	%o6,	%o5
loop_268:
	nop
	setx	0xF9A77FF2B44E8B1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC1E25D4AAF139373,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f14
	movcc	%xcc,	%g4,	%l5
	bne,a,pn	%xcc,	loop_269
	subccc	%l0,	%g6,	%l2
	subccc	%g1,	%o4,	%o1
	fnor	%f22,	%f24,	%f8
loop_269:
	tn	%icc,	0x1
	tleu	%xcc,	0x6
	mova	%icc,	%l1,	%l4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x40] %asi,	%f13
	bne,a	loop_270
	edge32l	%l3,	%i7,	%l6
	tsubcctv	%i4,	%i0,	%o7
	udivcc	%i2,	0x182E,	%i5
loop_270:
	movcs	%icc,	%g7,	%i6
	fpsub32	%f30,	%f0,	%f22
	movrne	%g2,	0x357,	%i1
	sdivcc	%o3,	0x07C5,	%g5
	set	0x52, %g6
	stha	%o0,	[%l7 + %g6] 0x22
	membar	#Sync
	fmovspos	%xcc,	%f11,	%f23
	nop
	setx	loop_271,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovscs	%icc,	%f11,	%f15
	ldstub	[%l7 + 0x1C],	%g3
	membar	0x7F
loop_271:
	nop
	set	0x3C, %g2
	lduwa	[%l7 + %g2] 0x19,	%o2
	fmovsgu	%xcc,	%f5,	%f13
	tvs	%xcc,	0x7
	ldsh	[%l7 + 0x74],	%o6
	sll	%i3,	0x16,	%g4
	bcs,pt	%icc,	loop_272
	array16	%o5,	%l0,	%g6
	smul	%l2,	0x0615,	%l5
	array8	%o4,	%o1,	%l1
loop_272:
	fpadd16	%f28,	%f28,	%f22
	edge8l	%l4,	%g1,	%i7
	orncc	%l3,	0x114F,	%i4
	nop
	setx	0x674DBC58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x5BBE8D93,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f24,	%f14
	andncc	%i0,	%o7,	%i2
	sra	%i5,	0x1B,	%g7
	tcs	%icc,	0x4
	subcc	%l6,	0x11FA,	%g2
	movvc	%icc,	%i6,	%i1
	fnor	%f4,	%f6,	%f30
	fmovsl	%xcc,	%f23,	%f27
	sra	%o3,	0x10,	%g5
	array32	%o0,	%o2,	%g3
	fone	%f14
	fbug	%fcc1,	loop_273
	fnand	%f0,	%f22,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x7D
loop_273:
	tgu	%xcc,	0x5
	addc	%o6,	0x0471,	%g4
	bvs,pt	%icc,	loop_274
	movge	%icc,	%i3,	%o5
	brnz	%g6,	loop_275
	nop
	setx	0x855E28853A408180,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF825B72B0AC21F1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f30,	%f22
loop_274:
	tn	%icc,	0x6
	set	0x0C, %i3
	ldswa	[%l7 + %i3] 0x18,	%l0
loop_275:
	movge	%xcc,	%l5,	%l2
	srax	%o4,	%o1,	%l4
	fpack32	%f22,	%f28,	%f12
	tvc	%xcc,	0x5
	add	%g1,	0x05DC,	%l1
	sllx	%l3,	%i4,	%i7
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x80,	%i0
	mulscc	%o7,	%i2,	%i5
	te	%xcc,	0x4
	edge8	%l6,	%g7,	%g2
	fmul8sux16	%f22,	%f30,	%f14
	edge8l	%i6,	%i1,	%g5
	bg,a	loop_276
	alignaddr	%o0,	%o2,	%o3
	fnot2	%f30,	%f28
	taddcctv	%o6,	0x000D,	%g3
loop_276:
	addccc	%g4,	0x1A81,	%i3
	bvs,a	loop_277
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x10F8,	%g6
	st	%f17,	[%l7 + 0x54]
loop_277:
	ldub	[%l7 + 0x26],	%o5
	swap	[%l7 + 0x40],	%l0
	edge8	%l2,	%o4,	%l5
	tcc	%icc,	0x5
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	umul	%l4,	%o1,	%g1
	sth	%l1,	[%l7 + 0x16]
	stbar
	movvs	%icc,	%i4,	%l3
	set	0x62, %o5
	ldsba	[%l7 + %o5] 0x19,	%i0
	array32	%o7,	%i7,	%i2
	nop
	setx	0x9D6AB6F499419B70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD42AD110240C7FCB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f26,	%f20
	fnand	%f20,	%f30,	%f10
	tvs	%xcc,	0x5
	movvc	%xcc,	%i5,	%g7
	lduh	[%l7 + 0x3A],	%g2
	nop
	setx	0x405E7326,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	ble,a,pt	%icc,	loop_278
	te	%xcc,	0x5
	fbu,a	%fcc3,	loop_279
	nop
	setx	loop_280,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_278:
	fpmerge	%f19,	%f24,	%f4
	brlz	%i6,	loop_281
loop_279:
	fnegs	%f9,	%f25
loop_280:
	fbge	%fcc2,	loop_282
	fmovsneg	%icc,	%f9,	%f8
loop_281:
	fmovsn	%xcc,	%f18,	%f31
	movrne	%i1,	%g5,	%o0
loop_282:
	udivx	%o2,	0x11BA,	%l6
	tl	%icc,	0x4
	edge16	%o6,	%g3,	%o3
	edge16ln	%g4,	%i3,	%g6
	nop
	setx	0x504A76C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	move	%xcc,	%l0,	%l2
	fmovsl	%xcc,	%f27,	%f19
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o5
	lduh	[%l7 + 0x7A],	%l5
	nop
	setx	0xB2F7B90F4751E124,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f8
	te	%xcc,	0x0
	fnot1	%f0,	%f18
	bshuffle	%f10,	%f10,	%f26
	and	%o4,	0x11D0,	%o1
	fxnor	%f4,	%f10,	%f4
	edge8l	%g1,	%l1,	%i4
	ldsw	[%l7 + 0x3C],	%l3
	srl	%l4,	0x09,	%i0
	edge32ln	%o7,	%i7,	%i5
	udivx	%i2,	0x0BBE,	%g2
	nop
	set	0x50, %l2
	ldsb	[%l7 + %l2],	%g7
	tcc	%icc,	0x1
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf1
	membar	#Sync
	array8	%i1,	%g5,	%o0
	udiv	%o2,	0x1602,	%l6
	flush	%l7 + 0x30
	mulscc	%o6,	0x0C75,	%i6
	sub	%g3,	0x0812,	%o3
	nop
	setx	0xE756C5FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x5E9E5466,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f21,	%f24
	udivcc	%g4,	0x102C,	%i3
	brgz,a	%l0,	loop_283
	sdivcc	%g6,	0x157A,	%l2
	udivcc	%o5,	0x17DF,	%l5
	fpadd32	%f14,	%f18,	%f20
loop_283:
	fandnot2	%f18,	%f8,	%f6
	or	%o1,	0x05F6,	%g1
	taddcc	%l1,	0x0712,	%o4
	bge,a,pt	%xcc,	loop_284
	movle	%xcc,	%l3,	%i4
	st	%f20,	[%l7 + 0x38]
	te	%xcc,	0x2
loop_284:
	fpackfix	%f18,	%f0
	fmovsleu	%xcc,	%f1,	%f12
	fbg	%fcc0,	loop_285
	fnegs	%f1,	%f21
	fbug	%fcc3,	loop_286
	andn	%i0,	%l4,	%i7
loop_285:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i5,	0x046B,	%o7
loop_286:
	fmul8x16au	%f23,	%f21,	%f14
	movn	%xcc,	%g2,	%g7
	movrne	%i2,	0x0EB,	%g5
	tsubcctv	%o0,	0x0ADC,	%o2
	sethi	0x1B33,	%l6
	fandnot1	%f24,	%f30,	%f22
	movrlz	%o6,	0x159,	%i6
	std	%f4,	[%l7 + 0x40]
	movle	%xcc,	%g3,	%i1
	movre	%o3,	0x3F8,	%i3
	fmovsne	%xcc,	%f14,	%f12
	fble	%fcc2,	loop_287
	move	%icc,	%g4,	%l0
	tpos	%xcc,	0x3
	sll	%g6,	%l2,	%l5
loop_287:
	edge8n	%o5,	%o1,	%g1
	fnot2	%f16,	%f8
	nop
	setx loop_288, %l0, %l1
	jmpl %l1, %l1
	udiv	%l3,	0x034C,	%i4
	tl	%icc,	0x7
	movge	%icc,	%i0,	%o4
loop_288:
	fblg	%fcc3,	loop_289
	fbul	%fcc2,	loop_290
	faligndata	%f10,	%f10,	%f0
	movpos	%icc,	%i7,	%l4
loop_289:
	sdiv	%o7,	0x1FC6,	%i5
loop_290:
	or	%g2,	0x0B89,	%i2
	wr	%g0,	0x23,	%asi
	stba	%g5,	[%l7 + 0x43] %asi
	membar	#Sync
	sethi	0x0DB5,	%o0
	fpack32	%f2,	%f30,	%f30
	and	%o2,	%l6,	%o6
	fbl,a	%fcc2,	loop_291
	tg	%xcc,	0x3
	edge32n	%g7,	%i6,	%i1
	movl	%xcc,	%g3,	%i3
loop_291:
	and	%o3,	0x1401,	%l0
	fmovrde	%g6,	%f6,	%f2
	fmovsvs	%icc,	%f5,	%f17
	movvs	%icc,	%g4,	%l5
	edge32l	%o5,	%l2,	%o1
	edge8n	%g1,	%l1,	%l3
	fmovrslz	%i0,	%f3,	%f25
	fnot1	%f30,	%f28
	fbo,a	%fcc0,	loop_292
	edge8n	%i4,	%i7,	%l4
	movrgz	%o4,	%i5,	%g2
	tsubcctv	%o7,	0x1CD0,	%i2
loop_292:
	ldub	[%l7 + 0x50],	%g5
	taddcctv	%o2,	0x10D6,	%o0
	fpadd32s	%f0,	%f19,	%f13
	for	%f28,	%f10,	%f22
	sdiv	%l6,	0x0536,	%g7
	movrlz	%i6,	%i1,	%o6
	movrgez	%g3,	%o3,	%i3
	tn	%xcc,	0x5
	ldstub	[%l7 + 0x7D],	%l0
	fcmpeq32	%f6,	%f18,	%g4
	movrne	%g6,	%l5,	%l2
	membar	0x3C
	mulx	%o5,	0x0689,	%g1
	addccc	%o1,	0x0484,	%l3
	umulcc	%l1,	0x0E5B,	%i4
	nop
	setx	0xC3CA6C7DC042E525,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movrlz	%i0,	0x337,	%i7
	subcc	%l4,	0x067D,	%o4
	smul	%i5,	%g2,	%o7
	or	%g5,	0x1B9E,	%o2
	fsrc1	%f26,	%f0
	fpadd32	%f2,	%f20,	%f12
	fbge	%fcc1,	loop_293
	tg	%icc,	0x4
	sdivcc	%o0,	0x0C3E,	%i2
	movrlez	%g7,	0x298,	%l6
loop_293:
	fmovsle	%icc,	%f11,	%f27
	tneg	%xcc,	0x5
	sll	%i1,	0x1F,	%i6
	srlx	%o6,	0x17,	%g3
	mulscc	%i3,	%o3,	%g4
	nop
	setx	0xF37464032DF22580,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC463A3B2A7EB3CE1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f28,	%f10
	stx	%l0,	[%l7 + 0x60]
	fabss	%f4,	%f30
	bleu,pt	%icc,	loop_294
	fbu	%fcc1,	loop_295
	be	%xcc,	loop_296
	edge32	%g6,	%l5,	%o5
loop_294:
	sth	%l2,	[%l7 + 0x50]
loop_295:
	xorcc	%o1,	%l3,	%g1
loop_296:
	movleu	%icc,	%i4,	%l1
	fmovrdlz	%i7,	%f24,	%f6
	set	0x0C, %l6
	stwa	%l4,	[%l7 + %l6] 0x04
	subc	%o4,	0x05B5,	%i5
	movcs	%xcc,	%i0,	%g2
	and	%o7,	0x1CF8,	%g5
	fmovrdgz	%o2,	%f6,	%f4
	srax	%i2,	%g7,	%o0
	andcc	%i1,	0x0BA8,	%i6
	fbuge,a	%fcc0,	loop_297
	edge32l	%o6,	%l6,	%g3
	tg	%xcc,	0x3
	srlx	%i3,	%o3,	%g4
loop_297:
	movg	%icc,	%g6,	%l0
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f14
	stx	%l5,	[%l7 + 0x50]
	edge8ln	%o5,	%o1,	%l3
	brlz	%g1,	loop_298
	fmovrsne	%l2,	%f30,	%f29
	addccc	%i4,	%i7,	%l1
	movcc	%xcc,	%o4,	%l4
loop_298:
	array16	%i5,	%g2,	%o7
	nop
	setx	0xFC6D067B54268F59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f28
	fnot1	%f6,	%f30
	fbuge	%fcc0,	loop_299
	fmovrdgez	%g5,	%f14,	%f14
	sth	%o2,	[%l7 + 0x70]
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x70] %asi,	%i0
loop_299:
	srl	%i2,	0x18,	%o0
	fpadd16s	%f2,	%f14,	%f22
	sethi	0x145F,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i6,	%g7
	alignaddrl	%l6,	%g3,	%i3
	ble,a,pt	%xcc,	loop_300
	movg	%xcc,	%o6,	%o3
	and	%g4,	0x13F6,	%g6
	bl	%icc,	loop_301
loop_300:
	movrgez	%l0,	0x02F,	%l5
	nop
	setx	0x189E426B42ADF21E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6E70483CB97932AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f18,	%f4
	fand	%f28,	%f10,	%f16
loop_301:
	movn	%icc,	%o5,	%l3
	fones	%f9
	fmovdne	%icc,	%f15,	%f25
	bcs,a	%xcc,	loop_302
	fsrc1s	%f26,	%f23
	smul	%o1,	%g1,	%l2
	fmovdvc	%xcc,	%f27,	%f28
loop_302:
	fornot1	%f16,	%f18,	%f28
	brz,a	%i4,	loop_303
	brz,a	%i7,	loop_304
	nop
	set	0x70, %g1
	lduh	[%l7 + %g1],	%l1
	fmul8x16al	%f5,	%f9,	%f14
loop_303:
	movne	%icc,	%l4,	%o4
loop_304:
	fbo,a	%fcc2,	loop_305
	fcmpgt16	%f26,	%f6,	%i5
	fba,a	%fcc3,	loop_306
	bn,pn	%xcc,	loop_307
loop_305:
	fornot1	%f18,	%f8,	%f0
	tle	%xcc,	0x3
loop_306:
	edge16n	%o7,	%g2,	%g5
loop_307:
	srlx	%i0,	0x12,	%i2
	sra	%o2,	0x10,	%i1
	ble,a	loop_308
	array32	%i6,	%o0,	%g7
	edge8n	%l6,	%g3,	%i3
	add	%o6,	%g4,	%o3
loop_308:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g6,	0x1B00,	%l5
	edge32	%l0,	%l3,	%o1
	movge	%xcc,	%g1,	%l2
	bneg,a	loop_309
	movrlz	%o5,	0x056,	%i7
	andn	%l1,	%l4,	%i4
	edge16n	%i5,	%o4,	%o7
loop_309:
	movl	%xcc,	%g2,	%g5
	movrne	%i2,	0x0DC,	%o2
	bn	loop_310
	fcmpeq16	%f30,	%f28,	%i0
	sdiv	%i6,	0x027F,	%o0
	fcmpne32	%f24,	%f0,	%i1
loop_310:
	addc	%l6,	0x0352,	%g7
	taddcctv	%g3,	0x1C33,	%i3
	wr	%g0,	0x10,	%asi
	stba	%g4,	[%l7 + 0x56] %asi
	movleu	%icc,	%o6,	%g6
	edge16ln	%l5,	%o3,	%l3
	edge8	%o1,	%g1,	%l0
	bpos,a,pn	%xcc,	loop_311
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l2,	0x1CF7,	%i7
	fba	%fcc1,	loop_312
loop_311:
	edge8n	%l1,	%l4,	%i4
	mulscc	%i5,	%o5,	%o7
	lduh	[%l7 + 0x1C],	%g2
loop_312:
	addccc	%o4,	%g5,	%i2
	edge16l	%o2,	%i0,	%o0
	sdivx	%i6,	0x03E8,	%i1
	edge32n	%l6,	%g3,	%i3
	set	0x2C, %l5
	ldswa	[%l7 + %l5] 0x10,	%g7
	movrgz	%g4,	0x1C6,	%o6
	array16	%g6,	%o3,	%l3
	sir	0x14F7
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x88,	%o1
	edge8	%l5,	%l0,	%g1
	edge16l	%i7,	%l2,	%l1
	ta	%icc,	0x4
	orn	%l4,	%i5,	%i4
	nop
	setx	0x989610C0C647BF3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4727D15C3CA73E32,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f28,	%f4
	sethi	0x117F,	%o5
	smulcc	%o7,	%o4,	%g2
	movvs	%icc,	%g5,	%o2
	tsubcctv	%i0,	%i2,	%o0
	fmovrslz	%i1,	%f26,	%f30
	ld	[%l7 + 0x24],	%f23
	tneg	%xcc,	0x0
	xorcc	%l6,	0x1E3F,	%g3
	subc	%i6,	%i3,	%g7
	tle	%icc,	0x3
	edge8	%o6,	%g4,	%o3
	edge16ln	%g6,	%l3,	%l5
	movre	%o1,	0x2C5,	%l0
	tl	%icc,	0x0
	nop
	fitos	%f1,	%f28
	alignaddrl	%i7,	%l2,	%l1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x56] %asi,	%g1
	srlx	%i5,	0x01,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%o7
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%o5
	fmovdge	%icc,	%f25,	%f31
	mova	%icc,	%o4,	%g2
	orn	%g5,	%o2,	%i2
	fcmpne32	%f0,	%f20,	%o0
	umulcc	%i0,	%l6,	%i1
	movvs	%xcc,	%g3,	%i3
	edge8n	%g7,	%o6,	%g4
	bcc	loop_313
	add	%o3,	%g6,	%i6
	subccc	%l5,	%o1,	%l3
	bne,pn	%icc,	loop_314
loop_313:
	bcc,a,pt	%xcc,	loop_315
	movn	%xcc,	%i7,	%l0
	tgu	%xcc,	0x0
loop_314:
	addc	%l2,	%g1,	%i5
loop_315:
	mova	%xcc,	%l1,	%l4
	bcc	loop_316
	tsubcc	%o7,	%o5,	%o4
	edge32n	%g2,	%g5,	%i4
	fsrc2s	%f21,	%f4
loop_316:
	ta	%xcc,	0x3
	tsubcctv	%i2,	0x18C9,	%o0
	and	%o2,	%l6,	%i1
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f28
	movl	%xcc,	%g3,	%i0
	te	%icc,	0x3
	movcs	%icc,	%i3,	%o6
	sub	%g7,	0x1E5A,	%o3
	andcc	%g4,	%i6,	%g6
	xnorcc	%o1,	%l5,	%i7
	fmovsge	%xcc,	%f17,	%f18
	andncc	%l3,	%l2,	%l0
	call	loop_317
	ba,a,pn	%xcc,	loop_318
	movrgez	%i5,	%l1,	%g1
	tcc	%icc,	0x7
loop_317:
	sdivcc	%l4,	0x15D6,	%o7
loop_318:
	tleu	%icc,	0x7
	array16	%o4,	%g2,	%g5
	sethi	0x10CF,	%o5
	edge32	%i4,	%i2,	%o2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge32	%o0,	%l6,	%i1
	be	%icc,	loop_319
	fmovrdlez	%i0,	%f22,	%f6
	bvc	%xcc,	loop_320
	subcc	%g3,	0x1B03,	%o6
loop_319:
	add	%g7,	0x178C,	%i3
	movrgz	%o3,	%g4,	%i6
loop_320:
	tsubcc	%o1,	%g6,	%l5
	movrlz	%i7,	%l3,	%l0
	subcc	%i5,	%l1,	%g1
	movvc	%icc,	%l4,	%o7
	fbne,a	%fcc1,	loop_321
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o4,	%g2
	movneg	%xcc,	%g5,	%l2
loop_321:
	fmovdgu	%xcc,	%f25,	%f17
	ldstub	[%l7 + 0x73],	%o5
	sir	0x0BA3
	orn	%i2,	0x15FC,	%o2
	fble	%fcc2,	loop_322
	ldx	[%l7 + 0x58],	%i4
	andcc	%o0,	0x0DDF,	%i1
	nop
	fitos	%f5,	%f5
	fstod	%f5,	%f30
loop_322:
	brgz	%l6,	loop_323
	sir	0x0DC2
	fnegs	%f10,	%f17
	bcs,pt	%xcc,	loop_324
loop_323:
	fmovscs	%icc,	%f24,	%f11
	fcmple32	%f28,	%f16,	%i0
	alignaddr	%o6,	%g7,	%g3
loop_324:
	fsrc1	%f10,	%f2
	smul	%o3,	%i3,	%g4
	sub	%o1,	0x05CA,	%i6
	fmovdpos	%icc,	%f6,	%f28
	fpadd32s	%f7,	%f29,	%f3
	xnorcc	%l5,	0x17CC,	%g6
	fbu	%fcc2,	loop_325
	movrgez	%i7,	0x2A5,	%l0
	fpadd16s	%f16,	%f17,	%f30
	fnands	%f8,	%f20,	%f4
loop_325:
	nop
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x88,	%i4
	sdivcc	%l1,	0x07F1,	%g1
	nop
	setx	0x0E688A7A938E5042,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x307A7E3F541F532B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f30,	%f28
	fbug	%fcc2,	loop_326
	tcs	%xcc,	0x1
	umulcc	%l3,	0x1249,	%o7
	tle	%xcc,	0x4
loop_326:
	sir	0x1B92
	edge32ln	%o4,	%l4,	%g2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x04,	%f16
	nop
	setx loop_327, %l0, %l1
	jmpl %l1, %l2
	edge32ln	%o5,	%i2,	%o2
	fbo,a	%fcc3,	loop_328
	tsubcc	%i4,	0x0D5B,	%g5
loop_327:
	sllx	%o0,	0x04,	%l6
	sdivcc	%i0,	0x1416,	%i1
loop_328:
	movvc	%icc,	%g7,	%o6
	stb	%o3,	[%l7 + 0x5B]
	movpos	%icc,	%g3,	%g4
	lduw	[%l7 + 0x0C],	%i3
	udiv	%o1,	0x14BD,	%l5
	orn	%i6,	%g6,	%i7
	mova	%xcc,	%l0,	%l1
	mulx	%g1,	0x1EC9,	%l3
	movrlez	%o7,	0x244,	%i5
	membar	0x74
	andncc	%l4,	%o4,	%l2
	ldd	[%l7 + 0x68],	%f18
	sdiv	%g2,	0x1ABE,	%i2
	fpsub32	%f2,	%f22,	%f28
	fpack32	%f20,	%f4,	%f2
	movne	%xcc,	%o5,	%i4
	movrlz	%o2,	%o0,	%l6
	edge16n	%i0,	%i1,	%g7
	movrgz	%o6,	0x2E4,	%g5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x56] %asi,	%g3
	movge	%xcc,	%o3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o1,	%l5
	xnorcc	%g4,	0x1978,	%g6
	move	%icc,	%i6,	%l0
	fmovsleu	%xcc,	%f10,	%f15
	fpack32	%f30,	%f8,	%f16
	edge16n	%l1,	%i7,	%g1
	ldsb	[%l7 + 0x64],	%o7
	bgu,a	loop_329
	edge32l	%i5,	%l3,	%l4
	fpadd16	%f4,	%f14,	%f6
	set	0x28, %g5
	lda	[%l7 + %g5] 0x0c,	%f6
loop_329:
	nop
	set	0x28, %l3
	stx	%o4,	[%l7 + %l3]
	brnz	%g2,	loop_330
	fbug,a	%fcc1,	loop_331
	fmovda	%icc,	%f7,	%f6
	fmul8x16al	%f26,	%f18,	%f30
loop_330:
	fmovdne	%icc,	%f23,	%f21
loop_331:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x18] %asi,	%i2
	movrgez	%o5,	0x0CF,	%i4
	movg	%icc,	%o2,	%l2
	movleu	%icc,	%o0,	%i0
	edge8	%l6,	%g7,	%i1
	movrlz	%g5,	0x19C,	%g3
	orcc	%o3,	%i3,	%o1
	mulscc	%l5,	%g4,	%g6
	te	%icc,	0x6
	mova	%xcc,	%o6,	%i6
	lduh	[%l7 + 0x76],	%l1
	fone	%f2
	srl	%i7,	0x16,	%l0
	addcc	%g1,	0x1AFF,	%i5
	tleu	%icc,	0x4
	fba,a	%fcc1,	loop_332
	bn,pt	%icc,	loop_333
	andncc	%l3,	%l4,	%o4
	xorcc	%g2,	0x1FA3,	%i2
loop_332:
	smulcc	%o7,	0x1045,	%o5
loop_333:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%o2
	edge8	%i4,	%l2,	%o0
	nop
	setx	0x1B1E40E2A04F4598,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	andn	%l6,	0x15CA,	%g7
	bne	%icc,	loop_334
	tneg	%icc,	0x3
	add	%i1,	%g5,	%g3
	andcc	%o3,	0x06D4,	%i3
loop_334:
	srlx	%o1,	0x01,	%i0
	tsubcctv	%g4,	0x086A,	%l5
	sir	0x0797
	alignaddrl	%g6,	%i6,	%o6
	fmovde	%icc,	%f7,	%f3
	andcc	%i7,	0x19D2,	%l1
	andncc	%g1,	%l0,	%i5
	edge8n	%l4,	%o4,	%g2
	tleu	%xcc,	0x3
	movcs	%xcc,	%l3,	%o7
	bn,a,pt	%xcc,	loop_335
	tcc	%xcc,	0x6
	tcs	%icc,	0x0
	srlx	%i2,	%o2,	%i4
loop_335:
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f3
	tleu	%icc,	0x4
	fbuge,a	%fcc1,	loop_336
	fmovscc	%xcc,	%f23,	%f23
	fmovsvs	%icc,	%f26,	%f18
	fpadd32	%f20,	%f6,	%f10
loop_336:
	edge16	%l2,	%o5,	%o0
	ldsb	[%l7 + 0x4E],	%l6
	movrne	%g7,	0x0BE,	%g5
	movneg	%xcc,	%i1,	%g3
	andn	%i3,	%o1,	%i0
	fmovdle	%icc,	%f25,	%f12
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x68] %asi,	%f25
	bcs	%icc,	loop_337
	fbug	%fcc2,	loop_338
	orncc	%g4,	%o3,	%g6
	fmovsvs	%xcc,	%f8,	%f14
loop_337:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_338:
	te	%xcc,	0x5
	fmovdleu	%xcc,	%f12,	%f15
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%i6
	sll	%o6,	%i7,	%l5
	nop
	setx	loop_339,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%xcc,	0x6
	fbu	%fcc0,	loop_340
	movgu	%xcc,	%l1,	%g1
loop_339:
	add	%i5,	%l4,	%l0
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x80,	%g2
loop_340:
	ldsw	[%l7 + 0x18],	%o4
	array16	%l3,	%i2,	%o2
	srlx	%i4,	%o7,	%l2
	edge32n	%o5,	%l6,	%g7
	fbge,a	%fcc3,	loop_341
	alignaddr	%o0,	%i1,	%g5
	fcmpne32	%f16,	%f10,	%g3
	movcs	%xcc,	%o1,	%i0
loop_341:
	subcc	%i3,	0x02CB,	%g4
	bleu	loop_342
	stbar
	srax	%g6,	0x16,	%i6
	mulscc	%o6,	0x04C7,	%i7
loop_342:
	fsrc1	%f22,	%f30
	sllx	%o3,	%l5,	%l1
	ldsh	[%l7 + 0x50],	%g1
	fmovrse	%i5,	%f22,	%f24
	bshuffle	%f2,	%f8,	%f0
	set	0x0E, %l0
	stba	%l4,	[%l7 + %l0] 0xe3
	membar	#Sync
	fmovdle	%xcc,	%f9,	%f27
	smulcc	%l0,	%g2,	%o4
	tcs	%xcc,	0x5
	call	loop_343
	sllx	%i2,	0x1A,	%l3
	edge16l	%i4,	%o2,	%o7
	tg	%icc,	0x1
loop_343:
	fbl	%fcc3,	loop_344
	fmovrsgez	%l2,	%f31,	%f18
	orcc	%o5,	0x1AA6,	%g7
	movrgez	%o0,	%i1,	%l6
loop_344:
	orcc	%g5,	%g3,	%o1
	and	%i3,	0x0E74,	%g4
	nop
	setx	loop_345,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x2300FC4B5BBCF40D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x50F4A79CEEE2600D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f6,	%f14
	bne,pt	%icc,	loop_346
	tg	%icc,	0x0
loop_345:
	nop
	fitos	%f16,	%f23
	mulx	%g6,	0x0F31,	%i0
loop_346:
	tsubcc	%i6,	%o6,	%o3
	fmovsneg	%icc,	%f11,	%f29
	fnegd	%f26,	%f16
	fandnot1	%f4,	%f4,	%f10
	tpos	%icc,	0x3
	orncc	%l5,	0x1F94,	%i7
	brz	%g1,	loop_347
	or	%i5,	0x0DE3,	%l4
	fzeros	%f1
	movcc	%icc,	%l0,	%g2
loop_347:
	tn	%icc,	0x6
	wr	%g0,	0x89,	%asi
	stba	%o4,	[%l7 + 0x19] %asi
	mulx	%l1,	0x1004,	%i2
	umulcc	%l3,	%o2,	%i4
	sir	0x09E2
	andncc	%o7,	%o5,	%l2
	movneg	%xcc,	%o0,	%i1
	movn	%icc,	%l6,	%g5
	srlx	%g3,	%g7,	%i3
	movrlez	%g4,	%o1,	%g6
	stx	%i6,	[%l7 + 0x78]
	sll	%i0,	%o6,	%l5
	swap	[%l7 + 0x58],	%i7
	smulcc	%o3,	%i5,	%g1
	mulx	%l4,	%g2,	%l0
	tge	%xcc,	0x5
	orcc	%l1,	0x1E56,	%o4
	fmovdcs	%icc,	%f10,	%f10
	udivx	%l3,	0x0D6E,	%i2
	set	0x6C, %l1
	lduha	[%l7 + %l1] 0x14,	%i4
	fones	%f5
	movvs	%xcc,	%o7,	%o2
	fbug,a	%fcc3,	loop_348
	fbu	%fcc3,	loop_349
	fcmpne32	%f16,	%f2,	%l2
	set	0x48, %g3
	ldxa	[%l7 + %g3] 0x15,	%o5
loop_348:
	tne	%icc,	0x2
loop_349:
	fmovsge	%xcc,	%f7,	%f15
	umulcc	%o0,	0x1BE7,	%i1
	fmovrsgez	%g5,	%f1,	%f22
	set	0x2A, %i1
	ldstuba	[%l7 + %i1] 0x0c,	%g3
	bge,pt	%xcc,	loop_350
	movrlez	%l6,	%g7,	%i3
	fandnot1	%f24,	%f22,	%f18
	fpadd16s	%f5,	%f9,	%f16
loop_350:
	nop
	set	0x64, %g4
	stwa	%g4,	[%l7 + %g4] 0x89
	tle	%xcc,	0x3
	taddcc	%o1,	0x0189,	%g6
	fmovrdgez	%i6,	%f0,	%f16
	edge8n	%o6,	%i0,	%l5
	bpos	%icc,	loop_351
	smulcc	%i7,	0x0E74,	%o3
	ldsh	[%l7 + 0x5E],	%i5
	tvs	%xcc,	0x4
loop_351:
	movpos	%icc,	%g1,	%l4
	subcc	%g2,	0x0DA6,	%l1
	membar	0x28
	and	%l0,	%o4,	%l3
	nop
	set	0x3C, %o7
	stw	%i2,	[%l7 + %o7]
	umulcc	%i4,	0x0D56,	%o7
	movrlz	%l2,	%o2,	%o0
	and	%i1,	%o5,	%g5
	movle	%xcc,	%g3,	%g7
	tge	%icc,	0x1
	wr	%g0,	0x80,	%asi
	sta	%f23,	[%l7 + 0x5C] %asi
	tn	%icc,	0x1
	brgz	%l6,	loop_352
	fmovdcc	%icc,	%f23,	%f13
	fmovda	%icc,	%f27,	%f23
	andcc	%i3,	%g4,	%g6
loop_352:
	addccc	%i6,	0x134C,	%o1
	tsubcc	%o6,	0x1F6A,	%i0
	fmovscs	%icc,	%f12,	%f7
	movrlz	%i7,	%l5,	%o3
	fmovdl	%icc,	%f30,	%f8
	sethi	0x0E0D,	%i5
	nop
	setx	0x888404A4E77068EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xEE64B8B8BFA18ECD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f24,	%f8
	tl	%xcc,	0x4
	membar	0x77
	bne,a,pn	%xcc,	loop_353
	fmovsa	%icc,	%f14,	%f21
	fbge	%fcc2,	loop_354
	edge8ln	%l4,	%g1,	%g2
loop_353:
	prefetch	[%l7 + 0x6C],	 0x3
	srax	%l1,	0x0A,	%o4
loop_354:
	fbue	%fcc2,	loop_355
	lduw	[%l7 + 0x78],	%l0
	and	%l3,	0x1D1F,	%i2
	movge	%icc,	%i4,	%l2
loop_355:
	add	%o2,	0x1B99,	%o7
	tvs	%icc,	0x0
	edge8l	%o0,	%o5,	%i1
	fornot2	%f14,	%f20,	%f8
	tge	%icc,	0x3
	movrne	%g5,	%g3,	%l6
	prefetch	[%l7 + 0x54],	 0x0
	nop
	setx	0xC9BE44BE16FCAAA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC061BD0C2180D823,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f16,	%f22
	fcmpgt32	%f4,	%f12,	%g7
	edge16n	%g4,	%g6,	%i6
	ldub	[%l7 + 0x3C],	%i3
	edge8l	%o1,	%o6,	%i7
	edge32l	%i0,	%l5,	%i5
	movpos	%icc,	%o3,	%l4
	fmovsvc	%icc,	%f0,	%f0
	brnz,a	%g2,	loop_356
	edge32l	%g1,	%o4,	%l1
	srlx	%l0,	0x0F,	%l3
	movpos	%xcc,	%i4,	%l2
loop_356:
	andn	%o2,	0x1AAA,	%i2
	tg	%xcc,	0x4
	fbo,a	%fcc2,	loop_357
	fbug,a	%fcc2,	loop_358
	nop
	fitos	%f25,	%f22
	bvs	loop_359
loop_357:
	ta	%xcc,	0x1
loop_358:
	edge8l	%o0,	%o7,	%i1
	fpadd32s	%f24,	%f7,	%f7
loop_359:
	fbuge,a	%fcc3,	loop_360
	tgu	%icc,	0x4
	array16	%g5,	%o5,	%l6
	be,a,pt	%icc,	loop_361
loop_360:
	movvs	%xcc,	%g7,	%g3
	tg	%icc,	0x7
	set	0x44, %l4
	ldswa	[%l7 + %l4] 0x81,	%g4
loop_361:
	fnot1	%f22,	%f8
	brlez,a	%i6,	loop_362
	umulcc	%i3,	%o1,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i7,	0x1C6A,	%g6
loop_362:
	std	%f0,	[%l7 + 0x30]
	set	0x20, %i4
	sta	%f5,	[%l7 + %i4] 0x89
	fmovsleu	%xcc,	%f11,	%f22
	addcc	%l5,	%i5,	%i0
	smul	%l4,	0x010E,	%o3
	ba,a	loop_363
	edge32ln	%g1,	%o4,	%l1
	move	%xcc,	%l0,	%l3
	orn	%g2,	%i4,	%o2
loop_363:
	nop
	setx	loop_364,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbne	%fcc2,	loop_365
	mova	%icc,	%l2,	%i2
	te	%icc,	0x5
loop_364:
	fone	%f8
loop_365:
	sll	%o0,	%o7,	%i1
	xor	%o5,	0x08F7,	%g5
	movrgez	%l6,	0x13A,	%g7
	alignaddrl	%g3,	%i6,	%g4
	tle	%icc,	0x3
	st	%f20,	[%l7 + 0x08]
	xor	%i3,	%o6,	%o1
	movcs	%xcc,	%g6,	%i7
	subc	%l5,	%i5,	%l4
	edge16n	%i0,	%o3,	%o4
	srlx	%l1,	0x1B,	%l0
	movrlz	%g1,	0x3F0,	%l3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%i4
	fmovd	%f18,	%f2
	fbuge,a	%fcc2,	loop_366
	tsubcc	%g2,	0x05A7,	%o2
	fandnot1	%f10,	%f22,	%f2
	udiv	%i2,	0x177F,	%o0
loop_366:
	fmovrdne	%o7,	%f26,	%f2
	edge8ln	%l2,	%o5,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%g7
	udiv	%l6,	0x135A,	%g3
	tsubcctv	%i6,	%i3,	%o6
	add	%g4,	%g6,	%o1
	edge32n	%i7,	%i5,	%l5
	nop
	setx	0xBB09FD40,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x287E9FCD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f18,	%f1
	smulcc	%i0,	0x05DC,	%o3
	fnor	%f12,	%f2,	%f8
	srl	%l4,	0x11,	%l1
	fble	%fcc1,	loop_367
	movvs	%icc,	%l0,	%g1
	prefetch	[%l7 + 0x34],	 0x0
	fcmpne16	%f26,	%f20,	%o4
loop_367:
	nop
	setx	loop_368,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%icc,	%i4,	%l3
	tg	%xcc,	0x0
	fbn,a	%fcc2,	loop_369
loop_368:
	taddcctv	%o2,	0x0CA4,	%g2
	udivcc	%o0,	0x15D1,	%i2
	andn	%l2,	0x1726,	%o5
loop_369:
	nop
	set	0x74, %i0
	stwa	%o7,	[%l7 + %i0] 0x14
	fmovd	%f24,	%f24
	fornot2s	%f9,	%f22,	%f27
	edge16l	%i1,	%g5,	%g7
	set	0x54, %i6
	lda	[%l7 + %i6] 0x81,	%f29
	sdiv	%l6,	0x1E49,	%i6
	subccc	%i3,	0x09C7,	%g3
	nop
	fitos	%f12,	%f4
	fstoi	%f4,	%f16
	set	0x68, %o3
	lduba	[%l7 + %o3] 0x11,	%g4
	ldd	[%l7 + 0x78],	%f4
	tcs	%xcc,	0x3
	fbl,a	%fcc2,	loop_370
	fpadd32s	%f26,	%f29,	%f0
	orn	%o6,	0x1971,	%o1
	edge16l	%g6,	%i5,	%l5
loop_370:
	mulscc	%i0,	0x1692,	%i7
	edge32	%o3,	%l1,	%l0
	alignaddr	%g1,	%l4,	%i4
	ldstub	[%l7 + 0x6E],	%l3
	movn	%icc,	%o4,	%g2
	membar	0x3C
	fpadd32s	%f22,	%f1,	%f5
	ldsb	[%l7 + 0x0D],	%o0
	mova	%icc,	%i2,	%o2
	orncc	%o5,	0x075D,	%o7
	nop
	fitos	%f0,	%f23
	fstod	%f23,	%f8
	stx	%i1,	[%l7 + 0x60]
	mova	%xcc,	%l2,	%g7
	movne	%xcc,	%l6,	%g5
	fornot1s	%f28,	%f11,	%f0
	fmovsne	%xcc,	%f16,	%f21
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%i3
	fmovdcs	%icc,	%f9,	%f10
	movle	%icc,	%g3,	%g4
	alignaddrl	%o6,	%i6,	%o1
	sdivcc	%i5,	0x1A2E,	%g6
	tle	%icc,	0x7
	fmovsleu	%xcc,	%f7,	%f8
	fmovdvc	%icc,	%f27,	%f17
	umulcc	%l5,	0x19BE,	%i0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i7
	fmovdcc	%icc,	%f20,	%f26
	movle	%icc,	%l1,	%l0
	movneg	%xcc,	%o3,	%g1
	tpos	%icc,	0x3
	fnot2	%f6,	%f8
	tl	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x1e
	membar	#Sync
	mulx	%l4,	0x0938,	%o4
	fornot2	%f12,	%f14,	%f22
	fbne,a	%fcc3,	loop_371
	ta	%icc,	0x6
	andn	%l3,	%g2,	%o0
	fmovrse	%i2,	%f21,	%f3
loop_371:
	or	%o2,	%o7,	%i1
	nop
	fitos	%f14,	%f28
	fstod	%f28,	%f26
	nop
	fitod	%f10,	%f16
	fdtoi	%f16,	%f30
	fmovsleu	%icc,	%f22,	%f28
	bcc,a	loop_372
	fandnot2s	%f21,	%f23,	%f23
	movge	%xcc,	%l2,	%g7
	sethi	0x1053,	%o5
loop_372:
	fnot1s	%f23,	%f10
	fabss	%f25,	%f8
	orn	%l6,	%i3,	%g5
	set	0x6C, %g6
	lduha	[%l7 + %g6] 0x11,	%g3
	movge	%xcc,	%o6,	%g4
	movn	%icc,	%o1,	%i6
	udiv	%i5,	0x1C2A,	%g6
	fsrc1s	%f3,	%f1
	movpos	%xcc,	%l5,	%i0
	fmovs	%f17,	%f3
	fmovdle	%icc,	%f27,	%f10
	ldsh	[%l7 + 0x7A],	%i7
	bge,a,pt	%icc,	loop_373
	ldsb	[%l7 + 0x5E],	%l1
	smul	%l0,	%o3,	%i4
	fmovsleu	%xcc,	%f9,	%f14
loop_373:
	movrgz	%l4,	0x30C,	%o4
	set	0x70, %g2
	ldsha	[%l7 + %g2] 0x88,	%g1
	prefetch	[%l7 + 0x64],	 0x3
	addc	%l3,	0x17D1,	%o0
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	fblg	%fcc0,	loop_374
	fbue,a	%fcc3,	loop_375
	fxors	%f28,	%f20,	%f0
	nop
	setx	0x60756BD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
loop_374:
	array8	%g2,	%o7,	%i1
loop_375:
	sub	%l2,	0x1783,	%g7
	ldx	[%l7 + 0x28],	%o5
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f20
	fbule	%fcc0,	loop_376
	movvc	%icc,	%o2,	%l6
	tpos	%icc,	0x7
	tvc	%icc,	0x1
loop_376:
	lduw	[%l7 + 0x3C],	%g5
	movrlez	%i3,	0x002,	%o6
	nop
	setx	0x36E7B1020DC198B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xEEACFA53BE529257,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f12,	%f10
	sdiv	%g3,	0x1D2C,	%g4
	movvs	%xcc,	%i6,	%o1
	addc	%i5,	%l5,	%i0
	sethi	0x1151,	%i7
	bneg,a,pn	%xcc,	loop_377
	ld	[%l7 + 0x44],	%f11
	tg	%xcc,	0x2
	prefetch	[%l7 + 0x18],	 0x3
loop_377:
	udivcc	%l1,	0x1899,	%l0
	movrgez	%o3,	0x17D,	%g6
	fandnot1	%f30,	%f16,	%f8
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l4,	%i4
	movpos	%xcc,	%g1,	%o4
	stbar
	edge16ln	%o0,	%l3,	%i2
	subccc	%o7,	%g2,	%l2
	bl,pn	%xcc,	loop_378
	xnorcc	%i1,	%g7,	%o2
	te	%xcc,	0x7
	movl	%xcc,	%l6,	%g5
loop_378:
	swap	[%l7 + 0x24],	%i3
	sra	%o5,	0x19,	%g3
	movrgz	%g4,	0x279,	%o6
	sll	%o1,	0x06,	%i6
	edge8l	%i5,	%i0,	%l5
	orncc	%l1,	%i7,	%o3
	edge16ln	%g6,	%l0,	%l4
	smul	%i4,	0x0EEA,	%g1
	movle	%xcc,	%o4,	%l3
	fpsub16s	%f29,	%f18,	%f14
	srax	%o0,	%i2,	%o7
	tsubcctv	%g2,	%l2,	%g7
	sra	%i1,	0x12,	%o2
	fornot2s	%f27,	%f12,	%f19
	orn	%l6,	0x0BA5,	%i3
	fcmpne16	%f6,	%f12,	%o5
	fands	%f10,	%f5,	%f9
	srl	%g5,	%g4,	%o6
	fsrc1s	%f9,	%f21
	movn	%icc,	%g3,	%o1
	alignaddr	%i5,	%i6,	%i0
	fbge	%fcc1,	loop_379
	fandnot2	%f18,	%f16,	%f20
	movvs	%xcc,	%l1,	%l5
	movrlez	%i7,	0x324,	%g6
loop_379:
	fbg,a	%fcc2,	loop_380
	xor	%o3,	0x11B6,	%l0
	andcc	%l4,	0x0F60,	%g1
	fmovrsgz	%i4,	%f5,	%f1
loop_380:
	sra	%l3,	0x03,	%o0
	brnz,a	%i2,	loop_381
	ta	%icc,	0x5
	edge8l	%o4,	%o7,	%l2
	fmovrde	%g2,	%f16,	%f10
loop_381:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%i1,	[%l7 + 0x60] %asi
	tvs	%xcc,	0x4
	fmovrsne	%o2,	%f30,	%f10
	bcs,a,pn	%xcc,	loop_382
	andncc	%g7,	%l6,	%i3
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x04
loop_382:
	nop
	set	0x4C, %o6
	lduwa	[%l7 + %o6] 0x14,	%g5
	tn	%icc,	0x1
	edge32n	%g4,	%o6,	%g3
	array8	%o1,	%o5,	%i5
	xor	%i0,	0x19A1,	%l1
	movrlz	%l5,	%i7,	%g6
	orncc	%i6,	0x0EEB,	%o3
	sub	%l0,	%g1,	%i4
	fzeros	%f29
	edge16ln	%l4,	%o0,	%i2
	movrne	%o4,	%l3,	%l2
	membar	0x59
	nop
	setx	0x5C0B1E03,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f13
	edge32	%o7,	%i1,	%g2
	stw	%g7,	[%l7 + 0x10]
	sir	0x14AD
	tgu	%xcc,	0x4
	movleu	%xcc,	%o2,	%i3
	fand	%f20,	%f16,	%f22
	fmul8x16	%f26,	%f2,	%f24
	alignaddr	%g5,	%l6,	%o6
	bn	loop_383
	array32	%g4,	%g3,	%o5
	sllx	%i5,	%i0,	%l1
	fexpand	%f19,	%f18
loop_383:
	srax	%l5,	0x0B,	%i7
	ldsh	[%l7 + 0x64],	%o1
	fmovdneg	%xcc,	%f22,	%f30
	brgz,a	%g6,	loop_384
	st	%f22,	[%l7 + 0x3C]
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x14,	%o2
loop_384:
	fmovsl	%xcc,	%f13,	%f7
	addccc	%i6,	%l0,	%i4
	edge32l	%l4,	%g1,	%i2
	membar	0x5C
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x14] %asi,	%o0
	brz,a	%o4,	loop_385
	movrlez	%l2,	%l3,	%o7
	tg	%xcc,	0x0
	movcc	%icc,	%g2,	%g7
loop_385:
	subc	%o2,	0x02E4,	%i3
	fmovdpos	%icc,	%f10,	%f16
	edge32ln	%i1,	%l6,	%g5
	be,pt	%xcc,	loop_386
	tn	%icc,	0x5
	bcc	loop_387
	fmovdgu	%xcc,	%f27,	%f14
loop_386:
	tge	%icc,	0x6
	tne	%xcc,	0x6
loop_387:
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%g4
	bneg,a	loop_388
	fmovspos	%icc,	%f17,	%f25
	sir	0x15F2
	andncc	%o6,	%o5,	%i5
loop_388:
	fble,a	%fcc1,	loop_389
	tge	%xcc,	0x1
	bcc,a,pt	%icc,	loop_390
	sll	%i0,	0x02,	%g3
loop_389:
	udivcc	%l1,	0x0D33,	%i7
	bl,pt	%icc,	loop_391
loop_390:
	nop
	setx	0x0A1D8A91A442D69D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f24
	array32	%o1,	%l5,	%o3
	nop
	setx	0x348ED1BDF9C8DBA6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x686049A6CF4591ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f14,	%f8
loop_391:
	srax	%g6,	%i6,	%l0
	movvs	%icc,	%i4,	%g1
	fmovrse	%l4,	%f30,	%f19
	st	%f25,	[%l7 + 0x18]
	bvc	loop_392
	call	loop_393
	sir	0x0121
	nop
	setx	0x1FCC66316D3BB0BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f22
loop_392:
	bge,a,pt	%xcc,	loop_394
loop_393:
	brlez	%i2,	loop_395
	edge32ln	%o4,	%o0,	%l2
	srax	%o7,	%l3,	%g2
loop_394:
	tsubcctv	%g7,	%o2,	%i1
loop_395:
	sub	%i3,	0x0EE8,	%l6
	stw	%g4,	[%l7 + 0x30]
	tgu	%icc,	0x4
	srl	%g5,	%o6,	%o5
	addcc	%i5,	0x0422,	%i0
	sub	%g3,	0x15C9,	%l1
	fand	%f22,	%f10,	%f6
	movleu	%icc,	%o1,	%l5
	movpos	%icc,	%o3,	%i7
	orn	%i6,	%l0,	%i4
	brgez	%g1,	loop_396
	smul	%l4,	0x03A5,	%i2
	tg	%xcc,	0x6
	fmovdvs	%icc,	%f29,	%f22
loop_396:
	addc	%o4,	0x1787,	%o0
	tsubcc	%l2,	%g6,	%l3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o7
	pdist	%f26,	%f28,	%f24
	tleu	%icc,	0x4
	bgu,a,pt	%xcc,	loop_397
	taddcctv	%o2,	0x03D3,	%g7
	umul	%i1,	0x15AE,	%i3
	srlx	%l6,	0x03,	%g5
loop_397:
	fandnot2	%f26,	%f26,	%f2
	movpos	%icc,	%g4,	%o5
	xor	%o6,	0x1E5B,	%i5
	smulcc	%g3,	0x1B1F,	%i0
	smul	%o1,	%l5,	%o3
	movne	%icc,	%l1,	%i6
	subc	%l0,	%i7,	%g1
	sth	%i4,	[%l7 + 0x7A]
	udiv	%l4,	0x0F41,	%o4
	fnot1	%f0,	%f2
	nop
	fitos	%f11,	%f19
	fstox	%f19,	%f28
	fxtos	%f28,	%f23
	alignaddrl	%o0,	%l2,	%g6
	andncc	%i2,	%l3,	%o7
	movrlez	%o2,	%g7,	%g2
	andcc	%i1,	%i3,	%l6
	movleu	%xcc,	%g4,	%g5
	tvc	%xcc,	0x6
	tleu	%icc,	0x4
	fpadd16	%f4,	%f8,	%f2
	movrlez	%o5,	%i5,	%g3
	fpmerge	%f30,	%f12,	%f14
	fmovspos	%icc,	%f18,	%f12
	fors	%f27,	%f24,	%f31
	tle	%icc,	0x6
	fmovrdlez	%i0,	%f4,	%f8
	fba	%fcc1,	loop_398
	fmovd	%f22,	%f24
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f16
	fxtos	%f16,	%f22
	flush	%l7 + 0x3C
loop_398:
	fnot2	%f20,	%f2
	sdiv	%o6,	0x1B46,	%o1
	movvs	%icc,	%o3,	%l5
	movpos	%icc,	%i6,	%l0
	tle	%icc,	0x7
	edge8n	%i7,	%l1,	%g1
	edge8ln	%i4,	%o4,	%l4
	fors	%f9,	%f17,	%f4
	tpos	%xcc,	0x1
	fors	%f24,	%f26,	%f0
	array8	%l2,	%o0,	%i2
	stx	%l3,	[%l7 + 0x50]
	fmovrdne	%g6,	%f6,	%f0
	membar	0x07
	and	%o2,	0x0136,	%g7
	movle	%xcc,	%g2,	%i1
	fsrc2	%f14,	%f2
	fmovd	%f28,	%f28
	udivx	%i3,	0x1FE2,	%o7
	fblg,a	%fcc3,	loop_399
	edge16l	%l6,	%g4,	%g5
	xnor	%i5,	%g3,	%i0
	taddcc	%o6,	0x168A,	%o1
loop_399:
	te	%xcc,	0x7
	tle	%icc,	0x6
	fbge	%fcc2,	loop_400
	fmovdl	%xcc,	%f9,	%f10
	edge32ln	%o3,	%o5,	%l5
	nop
	setx	0xCE258F61C0423108,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_400:
	sth	%i6,	[%l7 + 0x44]
	tsubcc	%l0,	0x0DB6,	%l1
	stb	%i7,	[%l7 + 0x77]
	membar	0x7D
	nop
	setx	loop_401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%i4,	%g1,	%l4
	addccc	%l2,	0x1C36,	%o4
	ta	%icc,	0x6
loop_401:
	fmovsl	%icc,	%f26,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f10
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%o0
	andncc	%i2,	%g6,	%o2
	fmovrdlez	%g7,	%f0,	%f30
	edge32ln	%g2,	%l3,	%i1
	bshuffle	%f0,	%f24,	%f28
	addccc	%i3,	0x147D,	%l6
	nop
	fitos	%f19,	%f8
	fornot1	%f2,	%f4,	%f28
	fzeros	%f3
	edge16ln	%o7,	%g4,	%i5
	ta	%icc,	0x5
	nop
	setx	0x12DB2371481B373C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC5D0E075DB316543,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x26] %asi,	%g5
	bpos	%icc,	loop_402
	tne	%icc,	0x6
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x10,	%i0
loop_402:
	add	%g3,	%o1,	%o6
	fbl	%fcc2,	loop_403
	movvs	%icc,	%o5,	%l5
	tle	%icc,	0x0
	tsubcctv	%i6,	%l0,	%l1
loop_403:
	nop
	set	0x32, %l6
	ldub	[%l7 + %l6],	%i7
	mulscc	%i4,	%g1,	%l4
	ldsw	[%l7 + 0x58],	%o3
	sir	0x144A
	fabsd	%f8,	%f0
	movvs	%icc,	%o4,	%o0
	tcs	%xcc,	0x2
	mulx	%l2,	0x1E72,	%g6
	fmovdvc	%xcc,	%f18,	%f4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x21] %asi,	%o2
	fpadd16	%f10,	%f0,	%f18
	brlz,a	%i2,	loop_404
	edge32ln	%g2,	%l3,	%i1
	nop
	fitos	%f13,	%f18
	fstod	%f18,	%f18
	fbl,a	%fcc3,	loop_405
loop_404:
	fsrc1s	%f7,	%f22
	pdist	%f26,	%f26,	%f4
	subcc	%i3,	%l6,	%o7
loop_405:
	tgu	%xcc,	0x4
	movl	%icc,	%g7,	%i5
	bge	loop_406
	tcs	%icc,	0x5
	orncc	%g4,	%i0,	%g5
	fornot2s	%f10,	%f6,	%f22
loop_406:
	popc	%g3,	%o1
	fmovsle	%xcc,	%f14,	%f28
	sdivcc	%o6,	0x139C,	%o5
	umul	%i6,	%l5,	%l0
	fbn	%fcc3,	loop_407
	movl	%xcc,	%i7,	%i4
	ldstub	[%l7 + 0x4F],	%g1
	alignaddrl	%l1,	%o3,	%l4
loop_407:
	array8	%o0,	%l2,	%g6
	fbne,a	%fcc1,	loop_408
	movcc	%icc,	%o2,	%o4
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_408:
	fnands	%f23,	%f12,	%f11
	bge	%xcc,	loop_409
	bne,a	%icc,	loop_410
	fmovscs	%xcc,	%f23,	%f8
	nop
	setx	0x67B8AAE724C6F832,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x51B55128EF841662,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f28,	%f12
loop_409:
	fmovsvc	%xcc,	%f29,	%f13
loop_410:
	fnors	%f30,	%f14,	%f22
	fmovrdgez	%g2,	%f12,	%f6
	orcc	%i2,	0x0303,	%i1
	movvc	%icc,	%l3,	%i3
	ld	[%l7 + 0x5C],	%f29
	tle	%icc,	0x4
	array16	%l6,	%g7,	%o7
	edge8n	%i5,	%i0,	%g5
	st	%f9,	[%l7 + 0x6C]
	sdivcc	%g4,	0x06C3,	%g3
	ldstub	[%l7 + 0x74],	%o6
	edge32	%o5,	%i6,	%l5
	tleu	%xcc,	0x2
	movrlez	%l0,	%o1,	%i7
	nop
	setx	loop_411,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g1,	%i4,	%o3
	nop
	setx	0xED5F4C70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xB79A2B93,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f28,	%f7
	fbule,a	%fcc0,	loop_412
loop_411:
	tl	%xcc,	0x2
	movpos	%icc,	%l4,	%o0
	tsubcctv	%l2,	%l1,	%o2
loop_412:
	tl	%icc,	0x0
	fxnor	%f30,	%f30,	%f18
	movrlz	%o4,	%g2,	%i2
	edge8n	%i1,	%l3,	%i3
	sllx	%g6,	0x10,	%g7
	fbu,a	%fcc1,	loop_413
	mulscc	%o7,	%i5,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f30,	%f16,	%i0
loop_413:
	fmovrsgez	%g4,	%f13,	%f0
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fand	%f10,	%f24,	%f22
	edge8	%g5,	%o6,	%g3
	edge8n	%i6,	%l5,	%l0
	brgez	%o5,	loop_414
	tvc	%xcc,	0x0
	nop
	fitos	%f5,	%f16
	fstox	%f16,	%f14
	orcc	%i7,	0x1A04,	%g1
loop_414:
	sth	%i4,	[%l7 + 0x2A]
	movn	%xcc,	%o3,	%l4
	bg,pt	%icc,	loop_415
	tneg	%xcc,	0x3
	fmovsgu	%icc,	%f29,	%f4
	movl	%xcc,	%o0,	%l2
loop_415:
	tl	%icc,	0x3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
	tle	%icc,	0x7
	tneg	%icc,	0x1
	ldd	[%l7 + 0x48],	%f12
	movrgz	%l1,	%o4,	%o2
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
	edge32ln	%i1,	%i2,	%i3
	movg	%icc,	%l3,	%g7
	mulscc	%g6,	%o7,	%i5
	tn	%xcc,	0x1
	tge	%xcc,	0x3
	fnands	%f21,	%f7,	%f1
	edge32n	%i0,	%l6,	%g5
	fbn	%fcc1,	loop_416
	addccc	%o6,	%g3,	%g4
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i6
loop_416:
	fpmerge	%f20,	%f25,	%f2
	sir	0x0C4E
	set	0x28, %o1
	stha	%l5,	[%l7 + %o1] 0x23
	membar	#Sync
	fmovsn	%icc,	%f11,	%f4
	fbu,a	%fcc0,	loop_417
	movvs	%xcc,	%o5,	%l0
	brlz,a	%i7,	loop_418
	sra	%g1,	0x03,	%i4
loop_417:
	bne	loop_419
	movcc	%icc,	%l4,	%o3
loop_418:
	or	%o0,	0x1BDE,	%o1
	fnot1s	%f21,	%f29
loop_419:
	srax	%l2,	0x17,	%l1
	fmovrde	%o4,	%f28,	%f22
	tleu	%xcc,	0x4
	tvc	%xcc,	0x4
	fxors	%f25,	%f3,	%f5
	edge16n	%o2,	%i1,	%i2
	udivx	%g2,	0x1989,	%i3
	move	%xcc,	%l3,	%g6
	tn	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
	fabsd	%f0,	%f22
	movvc	%xcc,	%i5,	%o7
	tvs	%icc,	0x1
	udivcc	%i0,	0x0060,	%g5
	fmovsa	%icc,	%f9,	%f0
	umul	%l6,	0x1B78,	%o6
	xor	%g3,	%i6,	%g4
	tn	%xcc,	0x5
	movvs	%xcc,	%o5,	%l5
	fornot1s	%f20,	%f0,	%f16
	sub	%l0,	%g1,	%i7
	tsubcctv	%i4,	%o3,	%l4
	fmovsle	%icc,	%f9,	%f29
	udivcc	%o0,	0x1CC9,	%l2
	movvc	%icc,	%o1,	%o4
	movrlz	%l1,	0x0D2,	%i1
	movre	%o2,	0x1FF,	%i2
	movcs	%icc,	%g2,	%l3
	edge16n	%i3,	%g7,	%g6
	brlz,a	%i5,	loop_420
	fsrc1	%f20,	%f2
	fmovsn	%xcc,	%f21,	%f10
	tsubcctv	%i0,	%o7,	%g5
loop_420:
	sra	%l6,	%o6,	%i6
	sdiv	%g3,	0x0C93,	%o5
	addccc	%l5,	%l0,	%g4
	edge16ln	%g1,	%i4,	%o3
	andcc	%i7,	0x1158,	%l4
	edge8n	%o0,	%l2,	%o4
	fxor	%f14,	%f20,	%f24
	movle	%xcc,	%o1,	%i1
	fmovrse	%l1,	%f30,	%f22
	sth	%i2,	[%l7 + 0x56]
	tsubcc	%o2,	%g2,	%l3
	udiv	%g7,	0x1466,	%i3
	edge16	%i5,	%i0,	%o7
	and	%g5,	0x177A,	%l6
	fcmpne16	%f26,	%f2,	%g6
	edge16	%i6,	%g3,	%o6
	movrlz	%l5,	0x273,	%o5
	movvc	%xcc,	%l0,	%g1
	fmovdpos	%xcc,	%f17,	%f12
	movvs	%icc,	%i4,	%g4
	add	%i7,	%l4,	%o3
	fnegd	%f14,	%f30
	edge32n	%l2,	%o4,	%o0
	movcs	%xcc,	%i1,	%o1
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f12
	fmovdneg	%icc,	%f28,	%f27
	nop
	setx loop_421, %l0, %l1
	jmpl %l1, %i2
	addccc	%l1,	%g2,	%l3
	sub	%g7,	%o2,	%i3
	srl	%i0,	%o7,	%i5
loop_421:
	prefetch	[%l7 + 0x50],	 0x3
	sdiv	%g5,	0x1D89,	%g6
	fmuld8ulx16	%f11,	%f26,	%f2
	be,a	%icc,	loop_422
	bgu,a,pt	%xcc,	loop_423
	bn,a	loop_424
	sra	%l6,	0x06,	%i6
loop_422:
	sra	%o6,	%g3,	%o5
loop_423:
	fblg,a	%fcc2,	loop_425
loop_424:
	movcc	%icc,	%l5,	%l0
	movrne	%i4,	%g1,	%i7
	movpos	%icc,	%l4,	%o3
loop_425:
	movrlz	%g4,	0x230,	%l2
	xorcc	%o4,	%i1,	%o0
	srlx	%i2,	%l1,	%o1
	tpos	%xcc,	0x5
	smul	%g2,	0x1222,	%g7
	taddcc	%l3,	0x0B76,	%i3
	tne	%xcc,	0x1
	movle	%icc,	%o2,	%o7
	array32	%i5,	%i0,	%g5
	xnorcc	%g6,	0x0739,	%l6
	movneg	%icc,	%o6,	%g3
	movvs	%icc,	%o5,	%i6
	brlz,a	%l0,	loop_426
	addcc	%l5,	%i4,	%i7
	movn	%xcc,	%l4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_426:
	udivx	%g4,	0x120A,	%l2
	fzeros	%f24
	stb	%o3,	[%l7 + 0x72]
	fones	%f26
	fpadd32s	%f11,	%f8,	%f17
	bgu	%xcc,	loop_427
	tl	%icc,	0x5
	movrne	%i1,	%o0,	%o4
	movrlez	%i2,	%l1,	%o1
loop_427:
	movrgz	%g7,	0x277,	%g2
	st	%f27,	[%l7 + 0x14]
	fcmple32	%f6,	%f24,	%l3
	taddcctv	%o2,	0x0065,	%o7
	set	0x1E, %g1
	lduha	[%l7 + %g1] 0x11,	%i5
	tvs	%icc,	0x3
	movrgez	%i3,	0x2DD,	%g5
	edge16ln	%g6,	%l6,	%o6
	movg	%icc,	%g3,	%i0
	xorcc	%i6,	0x09CA,	%l0
	ldd	[%l7 + 0x50],	%f24
	tgu	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l5,	%i4,	%i7
	fmovrdne	%o5,	%f24,	%f24
	nop
	fitos	%f8,	%f16
	fstox	%f16,	%f20
	or	%l4,	%g1,	%g4
	flush	%l7 + 0x54
	swap	[%l7 + 0x50],	%o3
	xnor	%i1,	0x18BE,	%l2
	nop
	set	0x58, %i2
	std	%f20,	[%l7 + %i2]
	edge8n	%o0,	%o4,	%l1
	fmovdle	%xcc,	%f26,	%f29
	xnor	%i2,	%o1,	%g7
	subc	%g2,	%l3,	%o7
	wr	%g0,	0x18,	%asi
	sta	%f2,	[%l7 + 0x58] %asi
	orn	%i5,	0x0AD9,	%i3
	edge8ln	%o2,	%g5,	%g6
	wr	%g0,	0x2b,	%asi
	stwa	%l6,	[%l7 + 0x68] %asi
	membar	#Sync
	movcc	%xcc,	%g3,	%o6
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
	movleu	%xcc,	%i0,	%i6
	fabss	%f1,	%f31
	nop
	setx	0xFDD948D83052A933,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_428:
	movge	%xcc,	%l5,	%l0
	fmovsa	%icc,	%f28,	%f27
	taddcc	%i4,	0x0A59,	%i7
	edge8	%l4,	%g1,	%g4
	subccc	%o3,	%i1,	%l2
	sub	%o0,	%o4,	%l1
	fbu	%fcc1,	loop_429
	fmovrse	%i2,	%f26,	%f25
	movrgz	%o1,	0x2D8,	%g7
	tvc	%xcc,	0x7
loop_429:
	fba,a	%fcc3,	loop_430
	ld	[%l7 + 0x24],	%f9
	orncc	%o5,	0x04DC,	%g2
	fsrc2	%f24,	%f22
loop_430:
	smul	%l3,	%o7,	%i3
	tge	%icc,	0x3
	fmuld8ulx16	%f6,	%f26,	%f12
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x72] %asi,	%i5
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x1
	sdiv	%o2,	0x07E7,	%g6
	sdivx	%g3,	0x0053,	%l6
	edge16ln	%o6,	%i0,	%i6
	sth	%l5,	[%l7 + 0x36]
	add	%i4,	%i7,	%l0
	tleu	%icc,	0x6
	fble	%fcc2,	loop_431
	fexpand	%f17,	%f18
	edge32	%l4,	%g4,	%g1
	tvc	%icc,	0x4
loop_431:
	fbge	%fcc3,	loop_432
	brnz	%o3,	loop_433
	edge32	%i1,	%o0,	%o4
	smulcc	%l2,	%l1,	%o1
loop_432:
	fmovd	%f12,	%f8
loop_433:
	tge	%icc,	0x1
	nop
	setx	0xB50016070B604A65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xDAB2F1560F5EDF73,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f6,	%f18
	brgz	%g7,	loop_434
	and	%o5,	%g2,	%i2
	fmovs	%f1,	%f11
	sdivcc	%l3,	0x05AD,	%i3
loop_434:
	lduw	[%l7 + 0x64],	%i5
	ldstub	[%l7 + 0x7F],	%o7
	smul	%g5,	0x0D80,	%g6
	edge16ln	%o2,	%g3,	%o6
	movn	%xcc,	%i0,	%i6
	movvs	%icc,	%l5,	%i4
	set	0x28, %o4
	lda	[%l7 + %o4] 0x04,	%f18
	fornot2s	%f0,	%f7,	%f2
	movneg	%xcc,	%i7,	%l0
	mulscc	%l4,	0x0C6B,	%l6
	tleu	%icc,	0x6
	tgu	%icc,	0x4
	edge8l	%g1,	%o3,	%i1
	orncc	%o0,	%o4,	%g4
	fnand	%f20,	%f14,	%f4
	movl	%icc,	%l1,	%l2
	nop
	setx	0xE4735338,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f28
	fones	%f26
	fbuge,a	%fcc2,	loop_435
	fmovdleu	%icc,	%f29,	%f16
	ta	%icc,	0x3
	bl,a,pt	%xcc,	loop_436
loop_435:
	bge,a	%icc,	loop_437
	and	%g7,	0x065B,	%o1
	stbar
loop_436:
	bgu	loop_438
loop_437:
	fbge,a	%fcc3,	loop_439
	nop
	setx	0x37B56861,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x5BAF7EBF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f22,	%f23
	bvc	%xcc,	loop_440
loop_438:
	movrgz	%g2,	%o5,	%i2
loop_439:
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f8
	fxtod	%f8,	%f12
	wr	%g0,	0x11,	%asi
	stwa	%i3,	[%l7 + 0x08] %asi
loop_440:
	fmovdl	%icc,	%f20,	%f25
	movrlez	%l3,	0x33F,	%o7
	sdiv	%i5,	0x144D,	%g5
	fmovrdlz	%g6,	%f14,	%f8
	ba,pn	%xcc,	loop_441
	sdiv	%o2,	0x1829,	%o6
	movrgez	%g3,	0x373,	%i6
	brz,a	%i0,	loop_442
loop_441:
	fornot2	%f4,	%f8,	%f24
	alignaddrl	%l5,	%i7,	%l0
	udivcc	%l4,	0x1E14,	%l6
loop_442:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x6C] %asi,	%f2
	brgz,a	%i4,	loop_443
	fmovrslz	%g1,	%f26,	%f27
	taddcctv	%i1,	0x0FFF,	%o3
	sdivx	%o4,	0x1A93,	%g4
loop_443:
	fexpand	%f25,	%f18
	taddcc	%l1,	0x010A,	%o0
	nop
	fitos	%f9,	%f5
	alignaddrl	%g7,	%o1,	%g2
	andncc	%o5,	%i2,	%l2
	mova	%icc,	%l3,	%o7
	sdiv	%i5,	0x0E57,	%g5
	edge32n	%g6,	%o2,	%o6
	fmovrdlez	%g3,	%f0,	%f26
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	udivx	%i6,	0x0EC3,	%i0
	array16	%l5,	%i7,	%l0
	ldd	[%l7 + 0x30],	%i6
	fmul8sux16	%f12,	%f2,	%f10
	addccc	%l4,	0x05D0,	%g1
	mulscc	%i1,	%o3,	%i4
	tcs	%icc,	0x0
	movre	%o4,	0x0D5,	%l1
	orncc	%o0,	0x1F34,	%g7
	tle	%xcc,	0x6
	xnorcc	%g4,	%g2,	%o5
	sdivx	%o1,	0x102A,	%i2
	bgu	loop_444
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
	ldub	[%l7 + 0x39],	%l3
	fpsub32	%f20,	%f4,	%f10
loop_444:
	ld	[%l7 + 0x38],	%f18
loop_445:
	bl,a	%icc,	loop_446
	fbue	%fcc0,	loop_447
	nop
	setx	0xC076ACFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	addccc	%l2,	0x0A17,	%i5
loop_446:
	fmovde	%icc,	%f7,	%f3
loop_447:
	nop
	wr	%g0,	0x23,	%asi
	stha	%o7,	[%l7 + 0x34] %asi
	membar	#Sync
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%g5
	edge16l	%o2,	%o6,	%g3
	edge16	%i3,	%i6,	%l5
	swap	[%l7 + 0x48],	%i0
	orcc	%i7,	0x04FC,	%l6
	ba,a,pn	%xcc,	loop_448
	movneg	%xcc,	%l4,	%g1
	prefetch	[%l7 + 0x34],	 0x3
	tvs	%icc,	0x3
loop_448:
	fbul,a	%fcc1,	loop_449
	edge16l	%i1,	%l0,	%o3
	orncc	%o4,	%l1,	%i4
	tsubcctv	%o0,	0x15B9,	%g4
loop_449:
	edge8	%g2,	%o5,	%g7
	smulcc	%i2,	0x119D,	%o1
	addcc	%l2,	0x0757,	%l3
	tg	%xcc,	0x5
	edge16l	%i5,	%g6,	%o7
	sllx	%o2,	%g5,	%g3
	fbu	%fcc3,	loop_450
	fbul,a	%fcc3,	loop_451
	bneg	%icc,	loop_452
	nop
	fitos	%f12,	%f2
	fstox	%f2,	%f6
loop_450:
	nop
	set	0x08, %g5
	swapa	[%l7 + %g5] 0x0c,	%i3
loop_451:
	movne	%icc,	%o6,	%l5
loop_452:
	nop
	setx	0xF0610014,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	srlx	%i6,	%i7,	%i0
	alignaddrl	%l4,	%g1,	%l6
	ba,a	loop_453
	ble	loop_454
	nop
	setx	0x22F7B597E0C01DA8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4275BEA28F6B97D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f22,	%f16
	tsubcctv	%i1,	0x0F11,	%l0
loop_453:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_454:
	nop
	fitos	%f2,	%f12
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f26
	and	%o3,	0x1C7A,	%o4
	tn	%icc,	0x4
	addccc	%l1,	%o0,	%i4
	fmovscs	%xcc,	%f1,	%f10
	ba	%icc,	loop_455
	array8	%g2,	%o5,	%g7
	movvs	%icc,	%g4,	%i2
	tle	%xcc,	0x4
loop_455:
	bleu,pt	%icc,	loop_456
	movrgz	%l2,	0x2B4,	%o1
	tneg	%xcc,	0x6
	sethi	0x084D,	%l3
loop_456:
	tneg	%icc,	0x2
	tgu	%icc,	0x0
	andn	%i5,	0x1623,	%o7
	fmovrsgz	%g6,	%f10,	%f2
	fmovrdgez	%o2,	%f0,	%f20
	tgu	%xcc,	0x6
	set	0x13, %l3
	ldsba	[%l7 + %l3] 0x11,	%g3
	bcs,a	%icc,	loop_457
	edge8ln	%i3,	%g5,	%l5
	fmovd	%f4,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_457:
	tn	%xcc,	0x4
	movgu	%xcc,	%i6,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i7,	0x01,	%l4
	movneg	%xcc,	%g1,	%i0
	movg	%xcc,	%i1,	%l6
	subccc	%l0,	%o4,	%l1
	fornot2	%f18,	%f8,	%f16
	tn	%icc,	0x3
	ldd	[%l7 + 0x48],	%o2
	bge,a,pt	%xcc,	loop_458
	udivx	%o0,	0x0408,	%i4
	bleu,a	loop_459
	fmovda	%icc,	%f28,	%f19
loop_458:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f0,	%f26
loop_459:
	edge32	%o5,	%g2,	%g4
	array16	%g7,	%i2,	%o1
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x58] %asi,	%l3
	xorcc	%i5,	%l2,	%o7
	sub	%g6,	%o2,	%i3
	mulscc	%g5,	0x0637,	%l5
	edge32ln	%g3,	%o6,	%i7
	ldx	[%l7 + 0x28],	%i6
	fcmple16	%f20,	%f30,	%l4
	nop
	setx	0x03B77122,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x0498D2B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f1,	%f16
	fpsub16s	%f12,	%f2,	%f19
	xnorcc	%g1,	%i1,	%l6
	andcc	%l0,	0x0331,	%o4
	movvs	%xcc,	%l1,	%o3
	movleu	%icc,	%i0,	%i4
	edge16l	%o0,	%o5,	%g4
	and	%g2,	0x1A12,	%g7
	movpos	%xcc,	%i2,	%o1
	fmovdge	%xcc,	%f24,	%f30
	fmovsgu	%xcc,	%f7,	%f26
	srax	%l3,	0x13,	%i5
	st	%f11,	[%l7 + 0x30]
	tcc	%icc,	0x4
	edge16n	%o7,	%l2,	%g6
	stbar
	fmovsl	%icc,	%f6,	%f16
	fmovdle	%xcc,	%f11,	%f19
	and	%i3,	%o2,	%g5
	mova	%icc,	%g3,	%l5
	movvc	%icc,	%i7,	%o6
	tvs	%xcc,	0x2
	andcc	%l4,	0x0587,	%g1
	bneg,a,pt	%xcc,	loop_460
	sir	0x0539
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i6
loop_460:
	fbe	%fcc2,	loop_461
	ldd	[%l7 + 0x18],	%i6
	movg	%icc,	%l0,	%o4
	tg	%xcc,	0x2
loop_461:
	sdivcc	%i1,	0x193D,	%o3
	lduw	[%l7 + 0x74],	%l1
	ta	%icc,	0x4
	umulcc	%i4,	0x11A3,	%o0
	addccc	%i0,	0x0D1B,	%g4
	xnorcc	%g2,	%o5,	%i2
	nop
	setx	loop_462,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%icc,	%o1,	%g7
	taddcc	%i5,	0x10C5,	%o7
	srl	%l3,	0x16,	%l2
loop_462:
	edge32ln	%i3,	%g6,	%g5
	movg	%icc,	%o2,	%l5
	edge8l	%i7,	%g3,	%o6
	addccc	%l4,	0x1BAB,	%g1
	edge32ln	%i6,	%l0,	%l6
	ldx	[%l7 + 0x20],	%i1
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x18
	fbu	%fcc1,	loop_463
	tcs	%icc,	0x5
	brnz	%o4,	loop_464
	fmovsl	%icc,	%f10,	%f16
loop_463:
	fzero	%f8
	set	0x6C, %o2
	ldsba	[%l7 + %o2] 0x14,	%l1
loop_464:
	nop
	setx loop_465, %l0, %l1
	jmpl %l1, %i4
	movrlz	%o0,	0x11F,	%o3
	ta	%xcc,	0x6
	ldub	[%l7 + 0x2A],	%i0
loop_465:
	fmovrdgez	%g4,	%f12,	%f0
	bl,a,pn	%icc,	loop_466
	fandnot2s	%f22,	%f5,	%f14
	fbne,a	%fcc0,	loop_467
	movneg	%xcc,	%o5,	%i2
loop_466:
	movge	%xcc,	%o1,	%g7
	sll	%i5,	0x13,	%o7
loop_467:
	stw	%g2,	[%l7 + 0x70]
	movvs	%xcc,	%l2,	%l3
	movleu	%icc,	%g6,	%g5
	andn	%i3,	%l5,	%o2
	movre	%i7,	0x19E,	%g3
	and	%o6,	0x09B9,	%l4
	xorcc	%g1,	0x0CE2,	%l0
	alignaddr	%i6,	%l6,	%o4
	fxors	%f14,	%f29,	%f4
	std	%f12,	[%l7 + 0x58]
	nop
	set	0x3E, %l0
	sth	%l1,	[%l7 + %l0]
	fpack32	%f2,	%f0,	%f10
	sethi	0x10FE,	%i4
	ldd	[%l7 + 0x28],	%f16
	fbne,a	%fcc1,	loop_468
	fnegs	%f25,	%f9
	orcc	%o0,	0x0ACC,	%o3
	fxnor	%f22,	%f0,	%f6
loop_468:
	addccc	%i1,	0x14E9,	%i0
	nop
	setx	loop_469,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%o5,	%g4
	tcc	%icc,	0x0
	tvs	%icc,	0x5
loop_469:
	nop
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fcmpgt16	%f28,	%f2,	%i2
	sllx	%o1,	%i5,	%g7
	movrgz	%o7,	%l2,	%g2
	fnor	%f4,	%f18,	%f10
	fbug,a	%fcc2,	loop_470
	move	%xcc,	%g6,	%g5
	edge16l	%i3,	%l5,	%o2
	fmovsge	%xcc,	%f31,	%f17
loop_470:
	tl	%xcc,	0x5
	nop
	setx	0x37BFBF68,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x3E2C062D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f22,	%f22
	set	0x50, %g3
	ldsba	[%l7 + %g3] 0x04,	%i7
	fpmerge	%f28,	%f9,	%f30
	movleu	%icc,	%g3,	%l3
	movvs	%xcc,	%l4,	%o6
	brgez,a	%l0,	loop_471
	array32	%i6,	%g1,	%o4
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x0E] %asi,	%l1
loop_471:
	bleu,a,pn	%icc,	loop_472
	edge8ln	%i4,	%l6,	%o0
	fmovrdgez	%i1,	%f4,	%f28
	taddcc	%o3,	0x019C,	%o5
loop_472:
	fcmpne16	%f18,	%f12,	%i0
	edge32	%i2,	%o1,	%i5
	movleu	%icc,	%g7,	%o7
	bge,a,pt	%xcc,	loop_473
	subc	%g4,	0x137E,	%g2
	movn	%xcc,	%g6,	%l2
	nop
	setx	loop_474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_473:
	ldstub	[%l7 + 0x3C],	%g5
	subc	%i3,	0x17F4,	%l5
	sethi	0x043F,	%o2
loop_474:
	sra	%i7,	%l3,	%g3
	smulcc	%l4,	0x0C05,	%l0
	edge16ln	%i6,	%o6,	%g1
	or	%o4,	%i4,	%l1
	movpos	%icc,	%o0,	%i1
	tsubcc	%l6,	%o3,	%i0
	and	%o5,	%o1,	%i5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i2
	edge8l	%g7,	%o7,	%g4
	tne	%xcc,	0x0
	for	%f18,	%f8,	%f0
	edge16	%g6,	%l2,	%g2
	fxors	%f23,	%f17,	%f22
	bgu,pt	%xcc,	loop_475
	fmovdgu	%icc,	%f5,	%f28
	nop
	setx	0x621A980C2E4AEAFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f14
	tn	%xcc,	0x0
loop_475:
	edge32	%g5,	%l5,	%o2
	nop
	setx	loop_476,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%i7,	%i3
	tvc	%xcc,	0x5
	sth	%g3,	[%l7 + 0x3E]
loop_476:
	edge8	%l4,	%l3,	%i6
	alignaddr	%o6,	%g1,	%l0
	edge8ln	%o4,	%i4,	%o0
	fands	%f9,	%f30,	%f5
	fpackfix	%f14,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l1,	%i1,	%o3
	movrgz	%l6,	0x040,	%i0
	movrgez	%o5,	%i5,	%i2
	bne,pt	%xcc,	loop_477
	fpmerge	%f20,	%f5,	%f4
	movg	%icc,	%o1,	%o7
	bge	loop_478
loop_477:
	bvs,a,pt	%xcc,	loop_479
	fmovrdgz	%g7,	%f4,	%f28
	tgu	%icc,	0x4
loop_478:
	edge32	%g6,	%l2,	%g2
loop_479:
	brnz	%g4,	loop_480
	tn	%xcc,	0x6
	alignaddrl	%g5,	%o2,	%i7
	fmovda	%icc,	%f24,	%f11
loop_480:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f16
	set	0x0C, %l1
	ldswa	[%l7 + %l1] 0x10,	%i3
	andncc	%l5,	%l4,	%g3
	fmovrdgz	%l3,	%f26,	%f24
	xnorcc	%o6,	0x0333,	%i6
	fnot1s	%f28,	%f7
	fnegd	%f6,	%f22
	sdiv	%l0,	0x1653,	%o4
	sethi	0x0422,	%i4
	addcc	%o0,	0x18D3,	%l1
	move	%xcc,	%g1,	%i1
	edge32n	%l6,	%i0,	%o5
	xorcc	%i5,	0x0395,	%i2
	nop
	setx	0x3EC4A202B3403B98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x86361353DE20DED2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f16,	%f26
	fpadd32s	%f27,	%f8,	%f9
	brlz	%o3,	loop_481
	alignaddrl	%o7,	%g7,	%g6
	fors	%f14,	%f14,	%f27
	fmovdneg	%xcc,	%f9,	%f13
loop_481:
	addc	%o1,	0x1BA5,	%l2
	fmovrslez	%g4,	%f29,	%f1
	fsrc2	%f14,	%f2
	movgu	%xcc,	%g2,	%g5
	set	0x44, %i1
	stwa	%o2,	[%l7 + %i1] 0x0c
	nop
	fitos	%f9,	%f19
	fstox	%f19,	%f24
	be,a,pn	%icc,	loop_482
	andcc	%i3,	%i7,	%l4
	movcs	%icc,	%l5,	%l3
	ta	%icc,	0x1
loop_482:
	srlx	%g3,	0x04,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	tle	%icc,	0x0
	set	0x74, %g4
	lduha	[%l7 + %g4] 0x80,	%o6
	movpos	%icc,	%i4,	%o0
	andcc	%o4,	%g1,	%i1
	sethi	0x1845,	%l1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%i0
	subc	%o5,	%l6,	%i5
	lduh	[%l7 + 0x50],	%o3
	fxnor	%f28,	%f14,	%f0
	movl	%icc,	%i2,	%g7
	srl	%g6,	%o7,	%o1
	sub	%l2,	0x0A42,	%g2
	edge8n	%g5,	%o2,	%i3
	udivcc	%i7,	0x10CE,	%l4
	movrlez	%g4,	%l5,	%g3
	fpadd32s	%f11,	%f9,	%f12
	fmovdcs	%icc,	%f25,	%f28
	tpos	%icc,	0x0
	flush	%l7 + 0x4C
	fmovdneg	%xcc,	%f5,	%f18
	xnorcc	%i6,	%l3,	%o6
	xor	%i4,	%o0,	%l0
	movvs	%xcc,	%o4,	%i1
	ta	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f26,	%f27
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%g1
	alignaddrl	%l1,	%o5,	%l6
	mova	%icc,	%i0,	%o3
	sdivcc	%i5,	0x0B0D,	%g7
	bneg,a	%xcc,	loop_483
	fcmpeq16	%f24,	%f16,	%i2
	fmovdl	%icc,	%f6,	%f24
	fmovdcc	%icc,	%f3,	%f9
loop_483:
	srl	%g6,	0x1D,	%o1
	subcc	%l2,	%o7,	%g2
	fmovdcs	%icc,	%f20,	%f28
	edge32n	%g5,	%i3,	%i7
	movrgez	%o2,	%l4,	%g4
	set	0x08, %o7
	ldxa	[%l7 + %o7] 0x14,	%l5
	fornot1	%f28,	%f28,	%f24
	set	0x28, %l4
	ldxa	[%g0 + %l4] 0x20,	%g3
	fmovsle	%icc,	%f9,	%f2
	udiv	%i6,	0x0B84,	%l3
	brgez	%i4,	loop_484
	fexpand	%f10,	%f16
	popc	%o0,	%o6
	nop
	fitod	%f5,	%f12
loop_484:
	fandnot1	%f22,	%f6,	%f26
	fandnot1	%f24,	%f14,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc1,	loop_485
	or	%o4,	%i1,	%l0
	fmovrsgz	%g1,	%f18,	%f31
	bcc	%icc,	loop_486
loop_485:
	sll	%l1,	%o5,	%i0
	tn	%icc,	0x2
	nop
	setx	0xB732993A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x62954122,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f8,	%f12
loop_486:
	fmovdl	%icc,	%f3,	%f4
	nop
	setx	loop_487,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%l6,	%i5
	mulx	%g7,	0x0BA6,	%i2
	smulcc	%g6,	%o3,	%o1
loop_487:
	stb	%o7,	[%l7 + 0x5E]
	xorcc	%l2,	%g5,	%i3
	fmovrslz	%g2,	%f13,	%f7
	sdivcc	%o2,	0x11F8,	%l4
	umul	%i7,	0x1009,	%g4
	movn	%xcc,	%g3,	%l5
	bl,pt	%xcc,	loop_488
	fabss	%f12,	%f21
	fones	%f16
	taddcc	%i6,	0x168B,	%i4
loop_488:
	sth	%l3,	[%l7 + 0x12]
	tne	%icc,	0x3
	movre	%o0,	%o6,	%o4
	fmovrdlz	%i1,	%f28,	%f28
	taddcc	%l0,	0x0132,	%g1
	bn	loop_489
	edge32n	%o5,	%i0,	%l6
	fmovde	%xcc,	%f15,	%f15
	andcc	%i5,	%l1,	%g7
loop_489:
	movcs	%xcc,	%i2,	%o3
	fpsub16	%f2,	%f24,	%f26
	subccc	%o1,	%g6,	%o7
	edge32l	%g5,	%l2,	%i3
	edge32	%o2,	%l4,	%i7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x11,	%g2,	%g4
	taddcc	%g3,	%i6,	%i4
	nop
	fitod	%f2,	%f30
	fdtox	%f30,	%f18
	swap	[%l7 + 0x70],	%l5
	bshuffle	%f4,	%f14,	%f2
	bg,pt	%icc,	loop_490
	fpackfix	%f24,	%f30
	fbo	%fcc3,	loop_491
	nop
	setx loop_492, %l0, %l1
	jmpl %l1, %o0
loop_490:
	popc	%o6,	%l3
	fpmerge	%f27,	%f10,	%f6
loop_491:
	stbar
loop_492:
	swap	[%l7 + 0x78],	%o4
	movcs	%xcc,	%l0,	%g1
	xnor	%i1,	%i0,	%o5
	fornot1	%f6,	%f20,	%f24
	sdiv	%l6,	0x1CCC,	%l1
	fabss	%f8,	%f23
	and	%i5,	0x12ED,	%i2
	tle	%xcc,	0x2
	addc	%g7,	%o3,	%g6
	movleu	%xcc,	%o7,	%g5
	alignaddr	%l2,	%o1,	%o2
	fmovsleu	%icc,	%f2,	%f2
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
	fcmpeq32	%f30,	%f8,	%i3
	nop
	setx loop_494, %l0, %l1
	jmpl %l1, %l4
	movle	%xcc,	%i7,	%g4
loop_493:
	flush	%l7 + 0x68
	fmovdge	%xcc,	%f10,	%f11
loop_494:
	alignaddr	%g3,	%g2,	%i4
	set	0x28, %i4
	swapa	[%l7 + %i4] 0x11,	%l5
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x11,	%i6
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0x2
	subccc	%o6,	0x0F5B,	%o4
	ld	[%l7 + 0x0C],	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%l0
	brlz,a	%g1,	loop_495
	orncc	%i1,	%l3,	%o5
	orncc	%i0,	0x18DE,	%l6
	fandnot2	%f16,	%f10,	%f12
loop_495:
	tn	%icc,	0x5
	edge8l	%i5,	%i2,	%g7
	nop
	setx	loop_496,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l1,	0x17A3,	%o3
	fbg	%fcc2,	loop_497
	edge32ln	%g6,	%o7,	%l2
loop_496:
	movl	%icc,	%o1,	%g5
	addccc	%o2,	0x0659,	%l4
loop_497:
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f2
	fxtod	%f2,	%f18
	edge8ln	%i7,	%g4,	%i3
	movrlez	%g2,	%g3,	%l5
	te	%xcc,	0x3
	st	%f19,	[%l7 + 0x54]
	nop
	setx	0x28647F28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x4A527265,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f3,	%f9
	ba,pt	%xcc,	loop_498
	array8	%i6,	%o0,	%i4
	srlx	%o6,	0x0C,	%o4
	movle	%icc,	%g1,	%i1
loop_498:
	fexpand	%f19,	%f10
	sethi	0x1260,	%l0
	nop
	fitod	%f2,	%f28
	fdtox	%f28,	%f24
	fblg,a	%fcc1,	loop_499
	call	loop_500
	subcc	%o5,	0x0FF2,	%i0
	movl	%xcc,	%l3,	%i5
loop_499:
	smulcc	%l6,	%g7,	%l1
loop_500:
	tvc	%icc,	0x5
	tcc	%xcc,	0x7
	edge32l	%o3,	%g6,	%i2
	set	0x68, %o3
	lduwa	[%l7 + %o3] 0x15,	%l2
	and	%o1,	%g5,	%o7
	movl	%xcc,	%l4,	%o2
	edge8l	%i7,	%g4,	%i3
	tne	%icc,	0x2
	sdivx	%g3,	0x14A1,	%g2
	mova	%icc,	%i6,	%l5
	udiv	%o0,	0x0C7B,	%i4
	movrlz	%o6,	%g1,	%o4
	move	%xcc,	%i1,	%l0
	fmovrdgz	%i0,	%f2,	%f2
	nop
	setx	0xDFE44190496ACA45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD71C292005B298AD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f6,	%f24
	xnor	%l3,	%o5,	%l6
	bne,a	%icc,	loop_501
	stx	%g7,	[%l7 + 0x08]
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f30
	add	%i5,	%l1,	%o3
loop_501:
	movle	%xcc,	%i2,	%g6
	fbo,a	%fcc0,	loop_502
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f26
	udivx	%l2,	0x0F44,	%g5
	edge16n	%o7,	%l4,	%o2
loop_502:
	edge32n	%i7,	%o1,	%g4
	movpos	%xcc,	%g3,	%g2
	fmovrdgez	%i6,	%f20,	%f12
	bshuffle	%f8,	%f12,	%f10
	call	loop_503
	fornot1	%f20,	%f14,	%f10
	set	0x08, %g6
	ldxa	[%l7 + %g6] 0x80,	%i3
loop_503:
	edge32l	%l5,	%i4,	%o6
	tvs	%icc,	0x4
	ldsw	[%l7 + 0x10],	%o0
	tcs	%icc,	0x1
	edge16n	%g1,	%o4,	%l0
	tn	%icc,	0x4
	movrgez	%i1,	%i0,	%o5
	fornot1	%f20,	%f16,	%f4
	tge	%xcc,	0x6
	movpos	%icc,	%l6,	%g7
	nop
	setx	0x1125A3852B44C4DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x08D8A8F09D891EA4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f28,	%f20
	alignaddrl	%i5,	%l1,	%o3
	fandnot1	%f6,	%f26,	%f20
	tpos	%xcc,	0x4
	set	0x50, %g7
	prefetcha	[%l7 + %g7] 0x04,	 0x1
	addccc	%l3,	0x014C,	%l2
	array32	%g6,	%g5,	%l4
	sdivcc	%o2,	0x1891,	%i7
	lduw	[%l7 + 0x54],	%o1
	fmovs	%f28,	%f22
	fpackfix	%f16,	%f15
	wr	%g0,	0xeb,	%asi
	stxa	%o7,	[%l7 + 0x40] %asi
	membar	#Sync
	fornot1	%f6,	%f4,	%f0
	edge32	%g4,	%g2,	%g3
	set	0x46, %i5
	stha	%i6,	[%l7 + %i5] 0x2f
	membar	#Sync
	andcc	%i3,	0x0F8F,	%l5
	alignaddr	%i4,	%o6,	%o0
	fmovse	%xcc,	%f28,	%f3
	movn	%icc,	%o4,	%l0
	movrne	%i1,	%g1,	%i0
	udiv	%l6,	0x0CE5,	%g7
	fabss	%f2,	%f25
	fornot1	%f6,	%f12,	%f8
	array32	%i5,	%l1,	%o5
	tvs	%icc,	0x6
	smulcc	%i2,	0x0615,	%l3
	bvs,a	%xcc,	loop_504
	umul	%o3,	0x03C1,	%g6
	bl,a,pn	%xcc,	loop_505
	bpos,a,pt	%icc,	loop_506
loop_504:
	movrgz	%l2,	%g5,	%l4
	fpadd16s	%f30,	%f3,	%f24
loop_505:
	bgu	loop_507
loop_506:
	fnot1	%f24,	%f2
	fmovsgu	%icc,	%f17,	%f7
	bcc	loop_508
loop_507:
	edge16l	%o2,	%o1,	%i7
	edge16n	%o7,	%g4,	%g2
	tgu	%xcc,	0x0
loop_508:
	tle	%icc,	0x7
	xnor	%g3,	%i6,	%l5
	fabss	%f22,	%f11
	movrgez	%i3,	%i4,	%o6
	movrgez	%o4,	0x1AB,	%o0
	udiv	%i1,	0x1D83,	%g1
	sth	%i0,	[%l7 + 0x24]
	bn,a	%xcc,	loop_509
	movg	%xcc,	%l0,	%g7
	tgu	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_509:
	movrne	%i5,	%l6,	%l1
	fmuld8ulx16	%f7,	%f3,	%f20
	fandnot2	%f30,	%f22,	%f26
	nop
	fitos	%f10,	%f6
	movrne	%i2,	%l3,	%o5
	lduw	[%l7 + 0x54],	%o3
	fsrc2s	%f24,	%f15
	bgu,pn	%icc,	loop_510
	fpack32	%f26,	%f8,	%f0
	array32	%g6,	%g5,	%l2
	tgu	%icc,	0x0
loop_510:
	array8	%l4,	%o2,	%i7
	edge8ln	%o7,	%o1,	%g4
	fmovrdne	%g2,	%f20,	%f24
	te	%xcc,	0x0
	nop
	setx	0x7AAF19DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x9EFEAD9B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f19,	%f6
	andn	%i6,	0x0455,	%g3
	sdiv	%l5,	0x0A96,	%i3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x6C] %asi,	%f29
	movcs	%xcc,	%o6,	%i4
	nop
	set	0x28, %g2
	std	%f16,	[%l7 + %g2]
	swap	[%l7 + 0x64],	%o0
	edge32l	%o4,	%i1,	%i0
	tpos	%icc,	0x6
	umul	%l0,	%g1,	%g7
	edge16ln	%l6,	%i5,	%i2
	membar	0x38
	fblg,a	%fcc3,	loop_511
	nop
	setx	0x8F8D35E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x11BB594B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f6,	%f21
	fbg	%fcc3,	loop_512
	array8	%l1,	%o5,	%o3
loop_511:
	tvs	%icc,	0x3
	tl	%icc,	0x6
loop_512:
	andn	%l3,	0x01F3,	%g6
	tne	%xcc,	0x7
	bneg	loop_513
	or	%l2,	%l4,	%g5
	andcc	%o2,	%i7,	%o1
	xor	%g4,	0x13D1,	%g2
loop_513:
	fbule,a	%fcc2,	loop_514
	edge32	%i6,	%g3,	%o7
	ldd	[%l7 + 0x70],	%i2
	fmovsle	%xcc,	%f31,	%f21
loop_514:
	fpmerge	%f17,	%f21,	%f0
	membar	0x48
	smul	%l5,	%i4,	%o6
	movre	%o4,	0x0BF,	%o0
	sub	%i1,	0x17A8,	%l0
	brlz	%i0,	loop_515
	array16	%g1,	%l6,	%g7
	move	%xcc,	%i5,	%i2
	fmovrdgz	%o5,	%f14,	%f24
loop_515:
	tleu	%icc,	0x4
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x28] %asi,	%o3
	lduh	[%l7 + 0x72],	%l1
	bge,pt	%xcc,	loop_516
	fpack32	%f26,	%f14,	%f6
	movrgez	%l3,	0x116,	%g6
	ldx	[%l7 + 0x78],	%l2
loop_516:
	bgu,a	%xcc,	loop_517
	tge	%icc,	0x3
	edge8ln	%l4,	%o2,	%g5
	sub	%i7,	%o1,	%g2
loop_517:
	nop
	setx	0xABE5DA37E3423ED6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x24A0A8D53389FBC3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f20,	%f12
	sll	%g4,	%i6,	%g3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x18] %asi,	%i3
	edge16l	%l5,	%i4,	%o7
	array16	%o6,	%o4,	%o0
	subcc	%i1,	0x15BF,	%i0
	fnegd	%f22,	%f20
	nop
	setx	0x9D9BF10B9059303D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge8ln	%l0,	%l6,	%g7
	sir	0x0C18
	udivx	%g1,	0x1120,	%i2
	brz	%i5,	loop_518
	ld	[%l7 + 0x30],	%f31
	popc	0x1B07,	%o3
	andncc	%o5,	%l3,	%g6
loop_518:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l2
	andcc	%l1,	%o2,	%l4
	fmovdpos	%xcc,	%f5,	%f18
	or	%g5,	0x1FFD,	%o1
	subcc	%i7,	%g2,	%i6
	movl	%xcc,	%g3,	%i3
	nop
	setx	0x99559655E6AC3FCC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3D96F9F6D3386126,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f22,	%f16
	nop
	setx	0x9A708FB91072048C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	sra	%l5,	%i4,	%o7
	call	loop_519
	sethi	0x0CC5,	%g4
	mova	%icc,	%o4,	%o6
	te	%xcc,	0x3
loop_519:
	movleu	%icc,	%i1,	%i0
	edge32n	%l0,	%l6,	%g7
	ldd	[%l7 + 0x68],	%f4
	xnor	%g1,	%i2,	%i5
	srax	%o3,	%o5,	%l3
	udivcc	%g6,	0x02BF,	%l2
	movle	%icc,	%l1,	%o0
	addcc	%l4,	0x08D4,	%g5
	movn	%xcc,	%o2,	%o1
	fornot2	%f22,	%f0,	%f28
	movpos	%icc,	%i7,	%g2
	fmuld8ulx16	%f10,	%f12,	%f2
	movrgez	%i6,	0x256,	%i3
	movne	%icc,	%l5,	%i4
	bcc,a,pn	%xcc,	loop_520
	move	%icc,	%o7,	%g4
	ldd	[%l7 + 0x20],	%f12
	array32	%g3,	%o6,	%o4
loop_520:
	fandnot1	%f2,	%f28,	%f22
	fbu	%fcc0,	loop_521
	edge8n	%i0,	%i1,	%l6
	lduw	[%l7 + 0x20],	%g7
	taddcctv	%l0,	%g1,	%i2
loop_521:
	array8	%i5,	%o3,	%l3
	lduh	[%l7 + 0x48],	%g6
	sub	%l2,	0x006A,	%o5
	tcc	%xcc,	0x4
	or	%l1,	0x1E46,	%o0
	set	0x28, %o6
	lda	[%l7 + %o6] 0x19,	%f21
	movcc	%xcc,	%g5,	%o2
	tpos	%xcc,	0x7
	ba,a	%xcc,	loop_522
	orn	%o1,	0x086B,	%i7
	fnot1s	%f3,	%f20
	addccc	%g2,	0x1B0D,	%l4
loop_522:
	nop
	fitos	%f5,	%f20
	fstod	%f20,	%f6
	bl,a	loop_523
	andncc	%i6,	%i3,	%l5
	sra	%o7,	0x0B,	%i4
	brgez	%g4,	loop_524
loop_523:
	umulcc	%o6,	%g3,	%o4
	addccc	%i0,	0x1E23,	%l6
	fbul,a	%fcc2,	loop_525
loop_524:
	fandnot1s	%f3,	%f13,	%f8
	addccc	%g7,	%l0,	%i1
	sub	%g1,	0x1B08,	%i2
loop_525:
	fbo	%fcc0,	loop_526
	xnor	%o3,	%i5,	%g6
	sra	%l3,	%o5,	%l1
	edge32l	%l2,	%o0,	%o2
loop_526:
	edge8ln	%g5,	%i7,	%g2
	tle	%xcc,	0x6
	sdivx	%o1,	0x19B7,	%l4
	array32	%i3,	%l5,	%o7
	umulcc	%i6,	0x0F14,	%g4
	sra	%i4,	0x09,	%o6
	movne	%xcc,	%g3,	%o4
	fmovdg	%icc,	%f30,	%f18
	fandnot1	%f24,	%f6,	%f6
	fbule,a	%fcc0,	loop_527
	fmovrslz	%l6,	%f14,	%f23
	edge16l	%i0,	%l0,	%i1
	nop
	fitos	%f9,	%f3
	fstoi	%f3,	%f18
loop_527:
	smul	%g1,	0x0524,	%i2
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x1f
	membar	#Sync
	membar	0x45
	xnorcc	%g7,	0x0D9A,	%i5
	fpack16	%f22,	%f5
	fxnor	%f6,	%f20,	%f10
	or	%g6,	0x13CE,	%l3
	ldx	[%l7 + 0x30],	%o3
	fors	%f7,	%f24,	%f24
	movle	%icc,	%o5,	%l1
	tneg	%xcc,	0x4
	nop
	setx	loop_528,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%icc,	%l2,	%o0
	fmovdleu	%icc,	%f7,	%f5
	nop
	fitos	%f7,	%f9
	fstod	%f9,	%f24
loop_528:
	fmovsleu	%icc,	%f22,	%f16
	fmovsvc	%xcc,	%f12,	%f8
	edge32n	%g5,	%i7,	%o2
	ldd	[%l7 + 0x48],	%g2
	smulcc	%l4,	%o1,	%i3
	membar	0x6C
	lduh	[%l7 + 0x60],	%l5
	srl	%i6,	%g4,	%i4
	set	0x390, %i3
	nop 	! 	stxa	%o7,	[%g0 + %i3] 0x40 ripped by fixASI40.pl
	sub	%g3,	0x0716,	%o6
	prefetch	[%l7 + 0x18],	 0x0
	fmovdle	%icc,	%f7,	%f9
	addc	%l6,	0x064C,	%i0
	nop
	setx	0x4069B531342DEF71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
	movgu	%xcc,	%l0,	%o4
	movle	%icc,	%g1,	%i2
	edge32ln	%g7,	%i5,	%i1
	movcc	%xcc,	%g6,	%o3
	mulx	%o5,	0x1298,	%l1
	st	%f3,	[%l7 + 0x20]
	subcc	%l3,	0x0752,	%o0
	popc	%g5,	%i7
	array8	%o2,	%l2,	%l4
	ldsh	[%l7 + 0x3A],	%o1
	nop
	set	0x3E, %o5
	stb	%g2,	[%l7 + %o5]
	movvc	%icc,	%l5,	%i3
	nop
	setx	0xB07682B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x30] %asi,	%f9
	movpos	%icc,	%i6,	%g4
	xnorcc	%o7,	0x1C8C,	%g3
	alignaddrl	%i4,	%o6,	%i0
	fmovsl	%xcc,	%f11,	%f10
	fbo,a	%fcc2,	loop_529
	nop
	setx	loop_530,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fble,a	%fcc3,	loop_531
	edge32	%l6,	%l0,	%g1
loop_529:
	addc	%o4,	0x0E2C,	%i2
loop_530:
	subcc	%g7,	%i5,	%i1
loop_531:
	fmovdvc	%xcc,	%f2,	%f15
	nop
	setx	loop_532,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%o3,	0x0058,	%g6
	fmovsge	%icc,	%f21,	%f8
	alignaddrl	%o5,	%l1,	%o0
loop_532:
	popc	%l3,	%i7
	bneg,a,pt	%xcc,	loop_533
	umul	%g5,	%o2,	%l4
	fbo	%fcc1,	loop_534
	ldstub	[%l7 + 0x23],	%l2
loop_533:
	be,pt	%icc,	loop_535
	tne	%xcc,	0x6
loop_534:
	fpsub32	%f30,	%f4,	%f24
	fbue	%fcc1,	loop_536
loop_535:
	faligndata	%f18,	%f26,	%f4
	fmovdgu	%xcc,	%f22,	%f21
	movrgz	%g2,	%l5,	%i3
loop_536:
	subc	%i6,	0x0F2E,	%o1
	srl	%o7,	%g3,	%g4
	tgu	%xcc,	0x7
	andn	%o6,	0x0043,	%i4
	movvc	%icc,	%i0,	%l6
	fcmpeq16	%f30,	%f30,	%g1
	mova	%icc,	%l0,	%o4
	nop
	set	0x16, %l6
	ldub	[%l7 + %l6],	%g7
	ldd	[%l7 + 0x40],	%f4
	popc	%i5,	%i1
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	ldd	[%l7 + 0x10],	%g6
	alignaddrl	%o5,	%o3,	%l1
	movn	%icc,	%o0,	%i7
	fmovsvs	%xcc,	%f18,	%f23
	sra	%l3,	0x08,	%g5
	nop
	fitos	%f24,	%f18
	sir	0x1708
	subccc	%l4,	%o2,	%l2
	fsrc1	%f10,	%f10
	fbule	%fcc3,	loop_537
	movgu	%xcc,	%g2,	%l5
	brnz,a	%i3,	loop_538
	bne	loop_539
loop_537:
	movg	%xcc,	%i6,	%o7
	movvs	%icc,	%g3,	%o1
loop_538:
	movrne	%g4,	0x3C4,	%o6
loop_539:
	edge16ln	%i0,	%l6,	%g1
	sdivx	%l0,	0x03C9,	%i4
	andncc	%o4,	%i5,	%g7
	stb	%i1,	[%l7 + 0x32]
	sllx	%i2,	%g6,	%o3
	edge16l	%l1,	%o5,	%o0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l3
	fands	%f28,	%f1,	%f25
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%g5
	ble,a,pt	%xcc,	loop_540
	taddcc	%o2,	%l4,	%g2
	array8	%l5,	%i3,	%i6
	movg	%icc,	%o7,	%g3
loop_540:
	bcc,a	%icc,	loop_541
	fmovrsgz	%o1,	%f23,	%f14
	xor	%l2,	0x0BE8,	%g4
	movcs	%icc,	%o6,	%l6
loop_541:
	movge	%icc,	%g1,	%l0
	alignaddr	%i4,	%o4,	%i5
	brnz,a	%i0,	loop_542
	tle	%icc,	0x1
	movneg	%icc,	%i1,	%g7
	edge16n	%i2,	%o3,	%g6
loop_542:
	edge16ln	%l1,	%o0,	%l3
	fexpand	%f31,	%f8
	movg	%icc,	%o5,	%g5
	nop
	setx	0xA04454F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fmovrslez	%i7,	%f16,	%f7
	movcs	%icc,	%l4,	%g2
	movge	%icc,	%o2,	%l5
	tsubcc	%i6,	%o7,	%i3
	xor	%g3,	%o1,	%l2
	te	%icc,	0x1
	orncc	%g4,	0x07A4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l6,	[%l7 + 0x20]
	umul	%g1,	0x14FF,	%i4
	edge16	%l0,	%o4,	%i5
	fnegs	%f21,	%f4
	edge8	%i0,	%g7,	%i2
	nop
	fitos	%f9,	%f16
	fstoi	%f16,	%f16
	fmovsleu	%xcc,	%f2,	%f0
	movrgz	%o3,	0x1A1,	%g6
	tneg	%icc,	0x7
	fpsub32s	%f20,	%f17,	%f20
	taddcc	%l1,	0x09D7,	%i1
	movge	%xcc,	%o0,	%l3
	subcc	%g5,	%o5,	%l4
	flush	%l7 + 0x7C
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x81
	taddcc	%g2,	0x00BA,	%i7
	addc	%l5,	0x1A95,	%o2
	andn	%o7,	0x0B18,	%i6
	fpack16	%f14,	%f20
	mulscc	%g3,	%i3,	%o1
	bcc,a	loop_543
	bshuffle	%f0,	%f10,	%f18
	edge8	%l2,	%o6,	%l6
	bne,pn	%icc,	loop_544
loop_543:
	sdivx	%g4,	0x01C3,	%g1
	edge32l	%l0,	%o4,	%i4
	fbe,a	%fcc2,	loop_545
loop_544:
	nop
	setx	0x6669BBFBE9E4AAFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f0
	xorcc	%i5,	%g7,	%i0
	nop
	setx	0x54F3DB3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x4D38BDBA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f12,	%f15
loop_545:
	nop
	setx	0x1057324C,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	edge32ln	%i2,	%o3,	%l1
	fmovdcs	%icc,	%f6,	%f23
	edge8n	%g6,	%o0,	%i1
	movcs	%icc,	%l3,	%o5
	tn	%xcc,	0x6
	movg	%xcc,	%l4,	%g2
	membar	0x43
	sllx	%i7,	%g5,	%o2
	be,pn	%xcc,	loop_546
	movrne	%l5,	0x23F,	%o7
	udiv	%i6,	0x005D,	%i3
	sdiv	%o1,	0x19E4,	%l2
loop_546:
	edge8l	%g3,	%l6,	%o6
	array8	%g4,	%g1,	%l0
	movneg	%icc,	%o4,	%i5
	fmul8x16au	%f0,	%f19,	%f6
	ta	%icc,	0x3
	sir	0x0DDD
	mulscc	%g7,	%i0,	%i4
	array8	%o3,	%i2,	%g6
	xnor	%l1,	0x1105,	%i1
	srax	%o0,	0x1A,	%l3
	sllx	%l4,	0x0E,	%g2
	mulscc	%o5,	0x1127,	%g5
	fmovscc	%icc,	%f16,	%f15
	array8	%o2,	%i7,	%o7
	bgu,a,pt	%xcc,	loop_547
	tn	%xcc,	0x4
	fnot1	%f28,	%f28
	sth	%l5,	[%l7 + 0x1C]
loop_547:
	bg	%icc,	loop_548
	edge8	%i3,	%o1,	%i6
	movrgez	%g3,	0x1FB,	%l2
	bn,a,pn	%icc,	loop_549
loop_548:
	ldx	[%l7 + 0x68],	%o6
	srl	%l6,	0x18,	%g1
	nop
	setx	0x55AD51B2272690CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1E4292C0845A63F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f10,	%f12
loop_549:
	fmuld8sux16	%f7,	%f20,	%f6
	fblg,a	%fcc3,	loop_550
	fxnor	%f2,	%f28,	%f2
	or	%g4,	0x1153,	%o4
	swap	[%l7 + 0x20],	%i5
loop_550:
	alignaddrl	%l0,	%g7,	%i0
	wr	%g0,	0x22,	%asi
	stxa	%i4,	[%l7 + 0x70] %asi
	membar	#Sync
	addc	%i2,	0x12DB,	%g6
	fmovsleu	%xcc,	%f13,	%f12
	bcs,pt	%icc,	loop_551
	tl	%icc,	0x2
	tg	%xcc,	0x7
	tl	%icc,	0x0
loop_551:
	fnor	%f30,	%f8,	%f16
	fornot1	%f30,	%f10,	%f28
	movcs	%xcc,	%o3,	%l1
	array32	%i1,	%o0,	%l4
	wr	%g0,	0xea,	%asi
	stha	%g2,	[%l7 + 0x10] %asi
	membar	#Sync
	sdiv	%o5,	0x173E,	%g5
	fpackfix	%f10,	%f10
	lduw	[%l7 + 0x7C],	%l3
	tcs	%icc,	0x4
	movgu	%xcc,	%i7,	%o7
	udivx	%l5,	0x0442,	%i3
	brgz,a	%o1,	loop_552
	fbg,a	%fcc0,	loop_553
	and	%o2,	0x00BD,	%i6
	movle	%icc,	%l2,	%o6
loop_552:
	sdivx	%g3,	0x095C,	%g1
loop_553:
	edge8	%l6,	%o4,	%i5
	orn	%l0,	%g7,	%i0
	movne	%icc,	%g4,	%i2
	movcc	%icc,	%g6,	%i4
	fmovsge	%xcc,	%f12,	%f31
	set	0x60, %g1
	sta	%f27,	[%l7 + %g1] 0x04
	and	%o3,	0x0D95,	%i1
	fpmerge	%f21,	%f31,	%f22
	array32	%l1,	%o0,	%l4
	fba	%fcc2,	loop_554
	fsrc2	%f18,	%f2
	movn	%icc,	%o5,	%g5
	fcmpne16	%f20,	%f22,	%g2
loop_554:
	movleu	%xcc,	%l3,	%i7
	movn	%xcc,	%l5,	%o7
	fbul	%fcc3,	loop_555
	umulcc	%i3,	%o1,	%o2
	srl	%l2,	%o6,	%i6
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_555:
	tcs	%xcc,	0x3
	tleu	%icc,	0x3
	fmovsa	%icc,	%f31,	%f1
	sllx	%g3,	0x0D,	%l6
	fmovrse	%o4,	%f6,	%f5
	movneg	%icc,	%i5,	%g1
	fpackfix	%f14,	%f7
	fexpand	%f21,	%f26
	bge,a,pn	%xcc,	loop_556
	movne	%icc,	%l0,	%i0
	add	%g7,	0x0CDD,	%g4
	srlx	%g6,	0x14,	%i4
loop_556:
	nop
	set	0x20, %o0
	ldstuba	[%l7 + %o0] 0x10,	%o3
	movvs	%icc,	%i1,	%l1
	membar	0x73
	nop
	setx loop_557, %l0, %l1
	jmpl %l1, %o0
	fmovdl	%xcc,	%f28,	%f5
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x2c,	%l4
loop_557:
	andn	%o5,	0x0D45,	%g5
	andncc	%g2,	%i2,	%i7
	bgu	%icc,	loop_558
	edge16l	%l5,	%l3,	%i3
	ldd	[%l7 + 0x70],	%f2
	fmovdvc	%xcc,	%f4,	%f10
loop_558:
	fmovdgu	%xcc,	%f12,	%f23
	orn	%o1,	%o2,	%l2
	sdivx	%o7,	0x15C4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%g3,	%f22,	%f2
	edge16ln	%l6,	%o4,	%o6
	fmovdneg	%icc,	%f14,	%f19
	nop
	setx	0xCCC407D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xEC3A76D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f5,	%f5
	alignaddr	%i5,	%g1,	%l0
	fbl	%fcc3,	loop_559
	tcs	%xcc,	0x5
	fcmpgt16	%f12,	%f12,	%g7
	fmovrdlez	%i0,	%f22,	%f8
loop_559:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%g6,	[%l7 + 0x0D] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g4,	%i4,	%i1
	addc	%l1,	0x18A9,	%o0
	fba	%fcc2,	loop_560
	tge	%icc,	0x1
	srl	%o3,	0x01,	%o5
	faligndata	%f0,	%f8,	%f18
loop_560:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l4,	%g5,	%g2
	lduw	[%l7 + 0x18],	%i7
	fble,a	%fcc0,	loop_561
	udivcc	%i2,	0x1C52,	%l5
	addccc	%l3,	%o1,	%i3
	edge16	%o2,	%l2,	%i6
loop_561:
	popc	%g3,	%o7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%o6
	movrlez	%i5,	0x0A4,	%l6
	movl	%icc,	%g1,	%l0
	fzeros	%f31
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc0,	loop_562
	ld	[%l7 + 0x30],	%f27
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f0
	fbu	%fcc3,	loop_563
loop_562:
	array16	%g7,	%g6,	%g4
	xor	%i4,	0x0F42,	%i0
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f27
loop_563:
	orncc	%i1,	0x089A,	%l1
	edge32n	%o3,	%o5,	%o0
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	movrlez	%g5,	%i7,	%g2
	set	0x7C, %o4
	stwa	%i2,	[%l7 + %o4] 0x2b
	membar	#Sync
	set	0x3C, %l5
	stba	%l5,	[%l7 + %l5] 0x88
	smulcc	%o1,	0x1036,	%i3
	subc	%o2,	0x0B87,	%l3
	srax	%l2,	%i6,	%g3
	sll	%o7,	0x09,	%o6
	ta	%icc,	0x5
	subc	%o4,	0x0F07,	%l6
	tvc	%xcc,	0x7
	tl	%icc,	0x5
	movrlz	%i5,	0x0FE,	%g1
	edge32n	%g7,	%g6,	%l0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%g4
	orncc	%i4,	%i0,	%i1
	edge16ln	%o3,	%l1,	%o0
	nop
	setx	loop_564,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%l4,	%g5,	%o5
	tle	%xcc,	0x5
	for	%f20,	%f24,	%f16
loop_564:
	tgu	%icc,	0x3
	xorcc	%i7,	0x0D3A,	%g2
	movn	%icc,	%l5,	%i2
	edge16ln	%o1,	%i3,	%l3
	set	0x22, %g5
	stha	%l2,	[%l7 + %g5] 0x19
	alignaddr	%o2,	%g3,	%i6
	udivcc	%o6,	0x099E,	%o4
	xorcc	%l6,	0x00AD,	%i5
	andn	%o7,	%g1,	%g7
	movre	%l0,	0x088,	%g6
	or	%i4,	%g4,	%i1
	tl	%xcc,	0x6
	set	0x30, %i7
	ldsha	[%l7 + %i7] 0x11,	%o3
	xnorcc	%l1,	%i0,	%l4
	movrgez	%g5,	0x0FC,	%o5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x50] %asi,	%i7
	array32	%o0,	%g2,	%i2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x48] %asi,	%l5
	srl	%o1,	%l3,	%l2
	bcc,pn	%icc,	loop_565
	bneg,a	%icc,	loop_566
	fbg,a	%fcc1,	loop_567
	edge32	%i3,	%o2,	%i6
loop_565:
	tn	%xcc,	0x7
loop_566:
	move	%xcc,	%g3,	%o4
loop_567:
	nop
	set	0x18, %l0
	stxa	%o6,	[%l7 + %l0] 0xea
	membar	#Sync
	edge16n	%l6,	%i5,	%o7
	mova	%xcc,	%g1,	%l0
	taddcctv	%g7,	%i4,	%g4
	udivx	%g6,	0x18F0,	%o3
	edge8l	%i1,	%l1,	%i0
	smulcc	%l4,	%g5,	%i7
	sethi	0x0079,	%o5
	ldd	[%l7 + 0x20],	%f8
	tsubcc	%o0,	%g2,	%l5
	mulscc	%o1,	0x1824,	%l3
	mulx	%l2,	%i3,	%i2
	fmovda	%xcc,	%f6,	%f20
	array16	%i6,	%g3,	%o2
	bn,a	%icc,	loop_568
	addccc	%o6,	0x130A,	%o4
	fxors	%f13,	%f12,	%f7
	fpsub32	%f2,	%f16,	%f28
loop_568:
	array8	%i5,	%l6,	%g1
	fbg	%fcc2,	loop_569
	fbl	%fcc2,	loop_570
	nop
	fitos	%f7,	%f16
	fstoi	%f16,	%f31
	bneg,a,pt	%xcc,	loop_571
loop_569:
	edge32ln	%l0,	%o7,	%g7
loop_570:
	subcc	%g4,	%g6,	%o3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x28] %asi,	%i1
loop_571:
	tn	%xcc,	0x4
	fsrc2s	%f0,	%f28
	fba	%fcc0,	loop_572
	tcc	%xcc,	0x5
	tsubcctv	%l1,	0x02C2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_572:
	edge16	%i0,	%g5,	%l4
	nop
	setx	0xBE939089,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xC30C2249,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f12,	%f26
	alignaddr	%o5,	%i7,	%g2
	nop
	setx loop_573, %l0, %l1
	jmpl %l1, %l5
	taddcctv	%o1,	0x10D5,	%o0
	fpadd16s	%f23,	%f18,	%f19
	edge16n	%l2,	%l3,	%i3
loop_573:
	fcmpgt16	%f18,	%f10,	%i6
	movn	%icc,	%i2,	%g3
	movle	%icc,	%o2,	%o6
	srax	%o4,	%i5,	%l6
	lduw	[%l7 + 0x5C],	%g1
	fmovrdgz	%o7,	%f28,	%f14
	te	%icc,	0x7
	tcc	%xcc,	0x3
	or	%l0,	0x0CF4,	%g4
	ldsb	[%l7 + 0x3E],	%g7
	tleu	%icc,	0x5
	sll	%o3,	%i1,	%g6
	xnor	%i4,	%l1,	%i0
	fxnor	%f6,	%f10,	%f30
	te	%icc,	0x7
	ba,a,pn	%xcc,	loop_574
	edge32l	%l4,	%o5,	%g5
	movleu	%xcc,	%g2,	%l5
	sra	%o1,	%i7,	%o0
loop_574:
	movvs	%xcc,	%l3,	%i3
	edge32n	%i6,	%l2,	%i2
	fabss	%f30,	%f25
	fornot1s	%f28,	%f31,	%f5
	bleu,pt	%icc,	loop_575
	movl	%xcc,	%o2,	%o6
	fmovdleu	%icc,	%f19,	%f14
	fbne	%fcc1,	loop_576
loop_575:
	te	%icc,	0x3
	movvc	%xcc,	%g3,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_576:
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f12
	set	0x30, %o2
	ldxa	[%g0 + %o2] 0x50,	%o4
	array32	%g1,	%o7,	%l0
	subccc	%l6,	%g7,	%g4
	or	%i1,	%g6,	%i4
	nop
	setx	0x25AF144B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x454F6F76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f13,	%f15
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	orcc	%o3,	0x0345,	%i0
	fabsd	%f22,	%f20
	movle	%icc,	%o5,	%l4
	fble,a	%fcc1,	loop_577
	sdivcc	%g2,	0x13A4,	%l5
	fmovsn	%xcc,	%f25,	%f11
	tgu	%icc,	0x7
loop_577:
	orcc	%g5,	0x0EFA,	%i7
	movleu	%xcc,	%o1,	%o0
	edge16	%i3,	%i6,	%l2
	fsrc1	%f26,	%f20
	fmovrdlz	%i2,	%f6,	%f14
	fornot1s	%f23,	%f10,	%f8
	fmovrdlez	%l3,	%f22,	%f12
	array8	%o2,	%o6,	%g3
	srax	%o4,	%g1,	%o7
	orncc	%l0,	%i5,	%l6
	tg	%xcc,	0x4
	xorcc	%g7,	0x10C1,	%i1
	lduh	[%l7 + 0x62],	%g4
	flush	%l7 + 0x10
	fmovrdgz	%i4,	%f20,	%f4
	fcmpgt16	%f6,	%f22,	%g6
	fblg,a	%fcc2,	loop_578
	tsubcctv	%l1,	0x026F,	%i0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x12] %asi,	%o3
loop_578:
	fbl	%fcc3,	loop_579
	fpadd16	%f26,	%f8,	%f12
	fblg	%fcc2,	loop_580
	andcc	%o5,	%g2,	%l4
loop_579:
	orn	%g5,	%i7,	%l5
	srax	%o1,	%i3,	%i6
loop_580:
	fpadd16	%f24,	%f0,	%f0
	edge8n	%o0,	%l2,	%i2
	edge16ln	%o2,	%o6,	%l3
	ld	[%l7 + 0x14],	%f3
	flush	%l7 + 0x14
	nop
	fitod	%f15,	%f14
	mulscc	%o4,	0x11B6,	%g3
	alignaddr	%o7,	%g1,	%l0
	movg	%xcc,	%l6,	%i5
	fnot1	%f10,	%f4
	swap	[%l7 + 0x38],	%g7
	nop
	setx	0xDDDB12F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x778DC87B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f13,	%f27
	tl	%icc,	0x7
	fmovs	%f2,	%f4
	taddcc	%g4,	0x1505,	%i1
	nop
	setx	0xCDB6C026CE80B578,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f20
	tl	%icc,	0x6
	array16	%g6,	%i4,	%i0
	fandnot1	%f26,	%f24,	%f0
	subccc	%l1,	%o5,	%o3
	tleu	%icc,	0x2
	sir	0x0219
	edge32l	%g2,	%g5,	%i7
	fcmpeq32	%f18,	%f14,	%l4
	movne	%xcc,	%o1,	%i3
	nop
	setx	0x3792BEB16BA2D100,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xC53DB3E42CEB6133,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f10,	%f4
	orn	%l5,	0x1625,	%i6
	set	0x60, %g3
	stxa	%o0,	[%l7 + %g3] 0x0c
	edge32n	%i2,	%o2,	%l2
	movrne	%o6,	%o4,	%l3
	bneg,a,pt	%icc,	loop_581
	fbuge	%fcc2,	loop_582
	xnor	%o7,	0x09EF,	%g3
	tle	%xcc,	0x0
loop_581:
	edge16n	%l0,	%l6,	%g1
loop_582:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x48] %asi,	%f26
	fmovsne	%xcc,	%f25,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g7,	0x179B,	%g4
	movvc	%xcc,	%i5,	%g6
	bneg,pn	%xcc,	loop_583
	tge	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f3,	%f7
loop_583:
	fmovscs	%xcc,	%f25,	%f10
	brgez	%i4,	loop_584
	edge8ln	%i1,	%i0,	%o5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x04,	%o3,	%l1
loop_584:
	bneg,pn	%xcc,	loop_585
	bcs,pt	%icc,	loop_586
	sth	%g5,	[%l7 + 0x24]
	movre	%g2,	0x066,	%l4
loop_585:
	movrne	%o1,	0x17B,	%i7
loop_586:
	tvc	%xcc,	0x2
	orcc	%l5,	%i3,	%i6
	movleu	%xcc,	%i2,	%o0
	fbn,a	%fcc3,	loop_587
	stw	%o2,	[%l7 + 0x40]
	smul	%o6,	%o4,	%l3
	ta	%xcc,	0x0
loop_587:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x30] %asi,	%l2
	edge16n	%g3,	%o7,	%l6
	andncc	%l0,	%g1,	%g7
	addc	%g4,	0x08AD,	%g6
	ldx	[%l7 + 0x28],	%i4
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	array8	%i1,	%i0,	%o5
	udiv	%i5,	0x15F3,	%o3
	movg	%icc,	%g5,	%l1
	fmovrslez	%l4,	%f24,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x40792171,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	subc	%o1,	0x1FD5,	%g2
	movrne	%l5,	%i3,	%i7
	movpos	%icc,	%i2,	%o0
	bcc,pn	%icc,	loop_588
	fbu	%fcc1,	loop_589
	edge16n	%o2,	%i6,	%o4
	fmovrdgez	%o6,	%f0,	%f0
loop_588:
	sllx	%l2,	%l3,	%o7
loop_589:
	fmovspos	%icc,	%f15,	%f10
	mulscc	%l6,	0x0639,	%l0
	fmul8x16au	%f16,	%f6,	%f2
	movgu	%icc,	%g3,	%g1
	mulx	%g4,	%g6,	%i4
	movn	%icc,	%i1,	%i0
	movn	%icc,	%g7,	%i5
	umul	%o3,	%g5,	%l1
	movpos	%xcc,	%l4,	%o1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f24
	fbue	%fcc0,	loop_590
	fblg,a	%fcc2,	loop_591
	fbg	%fcc1,	loop_592
	movrgez	%g2,	0x35A,	%o5
loop_590:
	tle	%xcc,	0x6
loop_591:
	umulcc	%i3,	0x1B86,	%i7
loop_592:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fnegs	%f4,	%f3
	sra	%l5,	%o0,	%o2
	xorcc	%i2,	%i6,	%o6
	fmovsn	%xcc,	%f29,	%f19
	movrgez	%o4,	%l2,	%o7
	bne,pt	%xcc,	loop_593
	bvs,pt	%icc,	loop_594
	edge16l	%l3,	%l0,	%l6
	bcc,a	loop_595
loop_593:
	ta	%icc,	0x7
loop_594:
	edge32	%g3,	%g1,	%g4
	xor	%g6,	%i1,	%i4
loop_595:
	fbo	%fcc0,	loop_596
	tsubcc	%i0,	0x02FD,	%i5
	tvs	%icc,	0x5
	fornot2s	%f5,	%f21,	%f25
loop_596:
	sir	0x1C36
	andncc	%o3,	%g5,	%l1
	tle	%icc,	0x0
	srl	%g7,	0x0E,	%o1
	ldub	[%l7 + 0x42],	%l4
	addccc	%g2,	0x0783,	%o5
	fpadd16	%f14,	%f0,	%f8
	movrgez	%i3,	%l5,	%o0
	ldsh	[%l7 + 0x26],	%i7
	fnands	%f31,	%f10,	%f25
	for	%f26,	%f4,	%f14
	tg	%icc,	0x0
	movgu	%icc,	%i2,	%i6
	addc	%o2,	%o6,	%l2
	ba,a,pt	%xcc,	loop_597
	bge	loop_598
	andn	%o4,	0x0ADB,	%l3
	movrne	%o7,	0x0CA,	%l0
loop_597:
	edge8n	%l6,	%g1,	%g4
loop_598:
	fmovdn	%icc,	%f4,	%f4
	wr	%g0,	0x0c,	%asi
	sta	%f23,	[%l7 + 0x7C] %asi
	edge32n	%g6,	%g3,	%i4
	sdivcc	%i0,	0x18B1,	%i5
	movg	%icc,	%o3,	%g5
	xnor	%i1,	%g7,	%l1
	fbne,a	%fcc3,	loop_599
	tsubcctv	%l4,	%o1,	%g2
	andn	%i3,	%o5,	%l5
	edge32n	%o0,	%i2,	%i6
loop_599:
	movpos	%icc,	%i7,	%o6
	tge	%icc,	0x6
	udiv	%o2,	0x0A1F,	%l2
	tg	%xcc,	0x4
	flush	%l7 + 0x0C
	fbo	%fcc1,	loop_600
	popc	0x0083,	%o4
	call	loop_601
	nop
	setx	loop_602,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_600:
	fcmple32	%f4,	%f12,	%o7
	movre	%l0,	0x12F,	%l3
loop_601:
	sth	%g1,	[%l7 + 0x74]
loop_602:
	st	%f27,	[%l7 + 0x48]
	tneg	%icc,	0x6
	std	%f14,	[%l7 + 0x08]
	fbug	%fcc1,	loop_603
	add	%l6,	%g6,	%g4
	fmovrslez	%i4,	%f29,	%f23
	stx	%i0,	[%l7 + 0x30]
loop_603:
	bl,a,pn	%xcc,	loop_604
	ldx	[%l7 + 0x30],	%g3
	fmovsvc	%icc,	%f10,	%f23
	taddcctv	%o3,	0x1954,	%g5
loop_604:
	movre	%i5,	0x106,	%i1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%g7
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x43] %asi,	%l4
	stb	%l1,	[%l7 + 0x1C]
	brgz,a	%g2,	loop_605
	tvs	%xcc,	0x5
	fpmerge	%f4,	%f10,	%f30
	fmovdpos	%xcc,	%f21,	%f11
loop_605:
	edge8n	%o1,	%i3,	%o5
	bn,a,pn	%xcc,	loop_606
	orncc	%l5,	0x0663,	%i2
	tpos	%icc,	0x2
	addccc	%i6,	0x0FB5,	%o0
loop_606:
	edge8ln	%o6,	%o2,	%i7
	fbul	%fcc3,	loop_607
	movn	%icc,	%o4,	%l2
	tneg	%icc,	0x0
	sdivx	%l0,	0x17D4,	%l3
loop_607:
	mulscc	%o7,	0x0025,	%g1
	sdivx	%g6,	0x1183,	%g4
	fbge,a	%fcc3,	loop_608
	ldx	[%l7 + 0x38],	%l6
	tgu	%xcc,	0x0
	nop
	setx	0x78FA210C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x173F4479,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f0,	%f5
loop_608:
	edge32ln	%i0,	%i4,	%g3
	movcs	%xcc,	%o3,	%i5
	array16	%g5,	%i1,	%l4
	brlez	%l1,	loop_609
	be,pn	%icc,	loop_610
	fba	%fcc2,	loop_611
	nop
	set	0x1A, %l1
	sth	%g2,	[%l7 + %l1]
loop_609:
	edge32n	%g7,	%i3,	%o1
loop_610:
	edge8ln	%o5,	%l5,	%i2
loop_611:
	fzero	%f10
	tgu	%xcc,	0x0
	fzero	%f10
	bcs,a,pt	%icc,	loop_612
	movvs	%icc,	%o0,	%i6
	edge32	%o2,	%i7,	%o6
	ldstub	[%l7 + 0x7D],	%l2
loop_612:
	tn	%icc,	0x1
	edge32l	%o4,	%l0,	%l3
	nop
	setx	loop_613,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%o7,	%g1,	%g4
	xnor	%l6,	%g6,	%i4
	and	%g3,	0x15BB,	%o3
loop_613:
	movcs	%icc,	%i0,	%i5
	edge32n	%i1,	%l4,	%l1
	nop
	setx	0x69C33926,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f22
	fbug,a	%fcc0,	loop_614
	bvs,pt	%icc,	loop_615
	orcc	%g5,	%g7,	%g2
	set	0x18, %i1
	ldswa	[%l7 + %i1] 0x15,	%o1
loop_614:
	sethi	0x184D,	%o5
loop_615:
	movg	%icc,	%l5,	%i2
	fmovdcs	%icc,	%f20,	%f21
	or	%o0,	0x05D7,	%i6
	fpadd16s	%f27,	%f27,	%f22
	movcs	%xcc,	%i3,	%o2
	srax	%i7,	%l2,	%o6
	bne,pn	%xcc,	loop_616
	addccc	%o4,	%l3,	%o7
	nop
	setx	0xFA72786B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x6616722F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f3,	%f12
	andcc	%l0,	0x1EB3,	%g1
loop_616:
	fbge,a	%fcc2,	loop_617
	movne	%xcc,	%l6,	%g4
	alignaddrl	%i4,	%g3,	%g6
	edge8	%i0,	%o3,	%i5
loop_617:
	movvc	%icc,	%i1,	%l4
	movrne	%l1,	%g7,	%g5
	fmovsvc	%xcc,	%f24,	%f18
	nop
	setx	0xE8601547,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x71D6E212,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f20,	%f22
	xorcc	%o1,	%o5,	%l5
	movrlez	%g2,	0x04D,	%i2
	fnands	%f0,	%f27,	%f15
	sub	%i6,	0x1BC3,	%i3
	std	%f30,	[%l7 + 0x28]
	alignaddrl	%o2,	%o0,	%l2
	umulcc	%o6,	0x1500,	%i7
	nop
	setx	0x2EE8D03BE500DDD4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x9BDBB8190A44DE8D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f28,	%f0
	fsrc2s	%f8,	%f9
	tge	%icc,	0x7
	movpos	%icc,	%o4,	%o7
	edge8ln	%l0,	%l3,	%l6
	ba,a,pn	%xcc,	loop_618
	nop
	setx	loop_619,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x1288,	%g1
	edge32	%g4,	%i4,	%g3
loop_618:
	nop
	setx	0x71A9F370D0298CA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f28
loop_619:
	fandnot1s	%f1,	%f31,	%f26
	alignaddrl	%g6,	%o3,	%i5
	and	%i1,	%l4,	%l1
	subccc	%g7,	%i0,	%o1
	movrgz	%g5,	%o5,	%l5
	edge8	%i2,	%i6,	%g2
	sdiv	%o2,	0x0041,	%i3
	fcmpeq32	%f24,	%f14,	%o0
	movl	%icc,	%o6,	%i7
	tcs	%icc,	0x4
	movcs	%icc,	%o4,	%l2
	movg	%xcc,	%l0,	%l3
	nop
	setx	loop_620,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2	%f26,	%f14
	array32	%l6,	%g1,	%o7
	movrgez	%i4,	%g4,	%g6
loop_620:
	nop
	wr	%g0,	0x27,	%asi
	stba	%o3,	[%l7 + 0x6A] %asi
	membar	#Sync
	movle	%icc,	%g3,	%i5
	srax	%i1,	%l4,	%l1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x32] %asi,	%g7
	fmovdge	%xcc,	%f21,	%f30
	addccc	%i0,	%g5,	%o1
	nop
	fitod	%f31,	%f8
	lduh	[%l7 + 0x22],	%l5
	andcc	%i2,	0x0433,	%o5
	fmovrdlez	%i6,	%f16,	%f24
	orncc	%o2,	%i3,	%o0
	sethi	0x1DE2,	%g2
	ble	%icc,	loop_621
	fba	%fcc0,	loop_622
	nop
	fitod	%f0,	%f22
	fdtoi	%f22,	%f13
	fmuld8ulx16	%f25,	%f5,	%f18
loop_621:
	te	%xcc,	0x2
loop_622:
	addccc	%o6,	%o4,	%l2
	array32	%i7,	%l3,	%l6
	xnorcc	%g1,	0x00E2,	%l0
	nop
	setx	loop_623,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%i4,	%o7,	%g6
	wr	%g0,	0x0c,	%asi
	stwa	%o3,	[%l7 + 0x1C] %asi
loop_623:
	edge16l	%g3,	%g4,	%i5
	orncc	%l4,	0x05B6,	%l1
	nop
	setx	0x86FED5D6206C5FCC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fnegd	%f8,	%f26
	umul	%g7,	0x1C3E,	%i0
	fbge	%fcc1,	loop_624
	tvs	%icc,	0x0
	udiv	%i1,	0x0E97,	%o1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g5
loop_624:
	te	%icc,	0x1
	array8	%l5,	%i2,	%o5
	fmovrdlez	%o2,	%f20,	%f26
	fmovdcs	%icc,	%f12,	%f25
	wr	%g0,	0x18,	%asi
	stxa	%i3,	[%l7 + 0x38] %asi
	fble,a	%fcc0,	loop_625
	orcc	%i6,	0x1EF0,	%o0
	fbule,a	%fcc2,	loop_626
	bgu,a	loop_627
loop_625:
	brlez	%o6,	loop_628
	fpadd32s	%f17,	%f3,	%f11
loop_626:
	nop
	set	0x16, %g4
	sth	%g2,	[%l7 + %g4]
loop_627:
	tleu	%icc,	0x1
loop_628:
	bneg,pt	%xcc,	loop_629
	movrne	%o4,	0x0BE,	%i7
	fcmpne32	%f0,	%f20,	%l3
	tgu	%icc,	0x5
loop_629:
	movn	%xcc,	%l2,	%g1
	sdivx	%l0,	0x1AFF,	%l6
	fnand	%f26,	%f10,	%f12
	fnor	%f4,	%f4,	%f6
	fmovsleu	%icc,	%f25,	%f28
	movcc	%icc,	%o7,	%g6
	mulscc	%o3,	%g3,	%i4
	fpackfix	%f0,	%f1
	fors	%f12,	%f9,	%f30
	and	%i5,	0x0B20,	%g4
	fblg,a	%fcc3,	loop_630
	fba,a	%fcc1,	loop_631
	movneg	%icc,	%l1,	%g7
	fble,a	%fcc0,	loop_632
loop_630:
	taddcc	%l4,	%i0,	%i1
loop_631:
	umul	%g5,	0x0F04,	%o1
	tsubcctv	%i2,	0x1203,	%o5
loop_632:
	sth	%o2,	[%l7 + 0x5C]
	fpsub32	%f6,	%f30,	%f18
	umul	%i3,	0x07F4,	%i6
	subcc	%l5,	0x0AA8,	%o6
	orcc	%o0,	%g2,	%i7
	sth	%o4,	[%l7 + 0x7E]
	tpos	%icc,	0x0
	tneg	%icc,	0x3
	tcs	%xcc,	0x6
	edge32	%l2,	%g1,	%l3
	movrlez	%l6,	%o7,	%g6
	sdiv	%l0,	0x0CD5,	%g3
	set	0x19, %o7
	ldsba	[%l7 + %o7] 0x14,	%i4
	fmovscs	%xcc,	%f10,	%f0
	pdist	%f8,	%f14,	%f24
	pdist	%f2,	%f16,	%f18
	edge16	%i5,	%o3,	%g4
	edge32l	%l1,	%l4,	%g7
	array32	%i0,	%g5,	%o1
	fnors	%f22,	%f14,	%f7
	bg,a	loop_633
	fnegs	%f24,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc1,	loop_634
loop_633:
	tsubcctv	%i1,	0x142A,	%o5
	edge16n	%i2,	%o2,	%i6
	xor	%i3,	0x1684,	%l5
loop_634:
	stbar
	orncc	%o0,	%g2,	%o6
	tcc	%icc,	0x2
	edge8	%i7,	%o4,	%l2
	fnot2s	%f7,	%f8
	ld	[%l7 + 0x6C],	%f27
	tn	%icc,	0x5
	sra	%l3,	0x04,	%g1
	movcc	%icc,	%l6,	%o7
	array16	%g6,	%g3,	%l0
	array16	%i5,	%i4,	%g4
	mulscc	%o3,	%l4,	%g7
	udiv	%l1,	0x0388,	%g5
	nop
	setx	loop_635,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%i0,	%o1,	%i1
	call	loop_636
	prefetch	[%l7 + 0x68],	 0x2
loop_635:
	fmovsleu	%icc,	%f10,	%f19
	taddcc	%o5,	0x0213,	%i2
loop_636:
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f20
	edge8ln	%i6,	%o2,	%l5
	ldd	[%l7 + 0x30],	%f10
	bleu,a,pt	%icc,	loop_637
	udivcc	%o0,	0x1B7F,	%g2
	brgez	%i3,	loop_638
	bneg	loop_639
loop_637:
	nop
	setx loop_640, %l0, %l1
	jmpl %l1, %o6
	tn	%xcc,	0x6
loop_638:
	movrlez	%o4,	%l2,	%i7
loop_639:
	fmovs	%f18,	%f19
loop_640:
	fnot1s	%f0,	%f15
	tvs	%xcc,	0x2
	tge	%xcc,	0x6
	movgu	%xcc,	%l3,	%g1
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
	tvs	%xcc,	0x4
	sra	%o7,	0x02,	%g6
	smulcc	%l6,	%g3,	%l0
loop_641:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	tvs	%icc,	0x5
	movcs	%xcc,	%i5,	%g4
	fmovsg	%xcc,	%f1,	%f2
	movle	%icc,	%o3,	%g7
	tsubcctv	%l4,	%g5,	%i0
	umulcc	%o1,	%i1,	%o5
	stx	%l1,	[%l7 + 0x50]
	fcmpeq16	%f18,	%f0,	%i2
	fbuge	%fcc3,	loop_642
	tne	%xcc,	0x7
	umul	%i6,	0x16D7,	%l5
	umulcc	%o0,	%o2,	%i3
loop_642:
	popc	%g2,	%o4
	ble,a,pn	%xcc,	loop_643
	bgu	%xcc,	loop_644
	edge8l	%l2,	%o6,	%l3
	ta	%xcc,	0x2
loop_643:
	tl	%xcc,	0x2
loop_644:
	andcc	%g1,	0x092E,	%o7
	movcs	%xcc,	%g6,	%i7
	andncc	%g3,	%l0,	%i4
	bge,pn	%xcc,	loop_645
	fmovdge	%icc,	%f6,	%f26
	pdist	%f18,	%f24,	%f2
	set	0x10, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i5
loop_645:
	nop
	setx	0x60588403,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	tg	%xcc,	0x5
	faligndata	%f10,	%f28,	%f20
	popc	%g4,	%o3
	move	%xcc,	%l6,	%l4
	fbl,a	%fcc2,	loop_646
	movg	%xcc,	%g7,	%g5
	tcs	%xcc,	0x6
	sllx	%o1,	%i0,	%i1
loop_646:
	nop
	setx	0xBF26B856,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x3AAE9A64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f8,	%f12
	movpos	%xcc,	%o5,	%l1
	bcc	%icc,	loop_647
	fpadd32s	%f27,	%f12,	%f31
	alignaddrl	%i2,	%l5,	%o0
	fmovdl	%icc,	%f19,	%f28
loop_647:
	move	%xcc,	%i6,	%o2
	te	%xcc,	0x7
	fble	%fcc2,	loop_648
	srl	%i3,	0x0B,	%o4
	nop
	fitos	%f2,	%f21
	fstox	%f21,	%f24
	fxtos	%f24,	%f0
	subc	%l2,	%g2,	%l3
loop_648:
	nop
	set	0x1A, %i0
	lduha	[%l7 + %i0] 0x80,	%g1
	tgu	%icc,	0x7
	fbe	%fcc1,	loop_649
	sethi	0x0CEB,	%o6
	ldsw	[%l7 + 0x48],	%o7
	fbuge	%fcc2,	loop_650
loop_649:
	subcc	%g6,	0x1A7F,	%i7
	tgu	%xcc,	0x3
	fnands	%f29,	%f11,	%f17
loop_650:
	movg	%xcc,	%g3,	%i4
	addcc	%i5,	%l0,	%g4
	stx	%l6,	[%l7 + 0x38]
	xorcc	%l4,	0x1A72,	%o3
	fxnor	%f14,	%f14,	%f26
	orn	%g5,	%g7,	%o1
	tle	%xcc,	0x4
	brgez	%i0,	loop_651
	brgez,a	%i1,	loop_652
	bvs,pn	%xcc,	loop_653
	fpadd32s	%f23,	%f22,	%f6
loop_651:
	fmovsvc	%xcc,	%f22,	%f29
loop_652:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%i2
loop_653:
	bpos	loop_654
	sllx	%o5,	%l5,	%o0
	fbue,a	%fcc1,	loop_655
	movrne	%o2,	0x122,	%i3
loop_654:
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f14
	popc	%i6,	%l2
loop_655:
	brlz,a	%g2,	loop_656
	fnor	%f22,	%f6,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc2,	loop_657
loop_656:
	swap	[%l7 + 0x24],	%l3
	tle	%icc,	0x6
	tgu	%icc,	0x5
loop_657:
	nop
	set	0x3D, %i6
	stba	%g1,	[%l7 + %i6] 0xe3
	membar	#Sync
	taddcc	%o6,	%o4,	%g6
	fxnor	%f26,	%f0,	%f0
	alignaddr	%o7,	%i7,	%g3
	mulx	%i4,	0x19BB,	%i5
	ta	%xcc,	0x6
	fbue,a	%fcc2,	loop_658
	xnor	%g4,	%l6,	%l4
	movrne	%o3,	0x256,	%g5
	array16	%l0,	%o1,	%g7
loop_658:
	mulx	%i0,	0x03B1,	%l1
	sll	%i1,	0x1E,	%o5
	smulcc	%l5,	0x09D3,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i2,	%i3
	fmul8ulx16	%f30,	%f28,	%f28
	fmovdvc	%xcc,	%f11,	%f0
	move	%icc,	%o2,	%i6
	movge	%xcc,	%g2,	%l2
	srax	%g1,	%l3,	%o6
	set	0x7C, %l4
	lduwa	[%l7 + %l4] 0x18,	%o4
	movl	%icc,	%o7,	%i7
	bl	loop_659
	nop
	setx	0x126BE19F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x51B4996A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f24,	%f3
	fxnor	%f28,	%f10,	%f16
	orn	%g6,	%i4,	%g3
loop_659:
	fmovrde	%g4,	%f2,	%f30
	fbe,a	%fcc2,	loop_660
	udiv	%l6,	0x1EBA,	%i5
	call	loop_661
	movvc	%icc,	%l4,	%g5
loop_660:
	xorcc	%l0,	%o1,	%o3
	bge	loop_662
loop_661:
	movrgez	%g7,	%i0,	%l1
	nop
	fitos	%f5,	%f12
	fstod	%f12,	%f16
	fnot1s	%f21,	%f13
loop_662:
	xnor	%i1,	0x179A,	%o5
	movge	%xcc,	%o0,	%i2
	movcs	%xcc,	%i3,	%l5
	tn	%xcc,	0x0
	set	0x62, %o3
	ldstuba	[%l7 + %o3] 0x18,	%i6
	tn	%xcc,	0x6
	fnand	%f0,	%f28,	%f30
	fxor	%f6,	%f6,	%f26
	ldstub	[%l7 + 0x12],	%o2
	fornot2	%f12,	%f10,	%f24
	sethi	0x05D7,	%l2
	fcmpgt16	%f10,	%f22,	%g2
	fcmpgt16	%f20,	%f4,	%l3
	movl	%xcc,	%g1,	%o6
	movcs	%xcc,	%o7,	%o4
	ldx	[%l7 + 0x18],	%g6
	call	loop_663
	fbuge	%fcc1,	loop_664
	movn	%icc,	%i4,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%l6
loop_663:
	tg	%xcc,	0x1
loop_664:
	nop
	set	0x46, %g6
	ldstuba	[%l7 + %g6] 0x11,	%g4
	tvc	%icc,	0x5
	tg	%icc,	0x5
	array16	%i5,	%l4,	%g5
	andncc	%o1,	%o3,	%g7
	sub	%i0,	%l0,	%i1
	andn	%l1,	%o5,	%o0
	xorcc	%i3,	%l5,	%i2
	bn,a	%xcc,	loop_665
	edge32ln	%i6,	%l2,	%g2
	edge8n	%l3,	%o2,	%g1
	ld	[%l7 + 0x74],	%f16
loop_665:
	call	loop_666
	movrgez	%o7,	0x166,	%o6
	andn	%g6,	%o4,	%g3
	movvc	%xcc,	%i4,	%i7
loop_666:
	bpos,pt	%icc,	loop_667
	or	%l6,	%g4,	%i5
	fmovdleu	%xcc,	%f21,	%f17
	nop
	fitos	%f2,	%f30
	fstox	%f30,	%f22
loop_667:
	fpsub16	%f10,	%f20,	%f20
	fbule,a	%fcc2,	loop_668
	fmovdvc	%icc,	%f23,	%f14
	xnorcc	%g5,	%o1,	%l4
	fpadd32	%f2,	%f4,	%f18
loop_668:
	fmovsgu	%xcc,	%f26,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f30,	%f16
	ba,pn	%icc,	loop_669
	udivcc	%g7,	0x06AF,	%i0
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%o3
loop_669:
	srax	%l0,	0x07,	%l1
	srl	%i1,	%o0,	%i3
	subccc	%l5,	0x1E93,	%o5
	array32	%i6,	%i2,	%g2
	smul	%l2,	%l3,	%g1
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x19
	srl	%o7,	%o6,	%g6
	sub	%o2,	0x1680,	%g3
	fbg	%fcc1,	loop_670
	udiv	%o4,	0x0A3B,	%i7
	ta	%icc,	0x2
	fornot1	%f26,	%f28,	%f20
loop_670:
	edge32l	%l6,	%i4,	%i5
	tsubcc	%g4,	%o1,	%g5
	mulscc	%l4,	%i0,	%o3
	srax	%l0,	%g7,	%i1
	movrgez	%o0,	0x1B3,	%l1
	orcc	%i3,	%l5,	%i6
	nop
	setx	0x55E454E792F2EA43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x5D57A6834B53A739,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f8,	%f0
	fbuge	%fcc0,	loop_671
	edge16ln	%i2,	%g2,	%o5
	set	0x40, %g2
	stxa	%l2,	[%l7 + %g2] 0x14
loop_671:
	tsubcctv	%l3,	%g1,	%o7
	edge32n	%o6,	%g6,	%g3
	fmovrsgz	%o4,	%f9,	%f21
	movgu	%icc,	%o2,	%l6
	fmovrse	%i7,	%f7,	%f16
	tsubcc	%i4,	%i5,	%o1
	alignaddrl	%g5,	%g4,	%l4
	sub	%i0,	0x0CCF,	%l0
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f10
	brlez	%o3,	loop_672
	fmovse	%icc,	%f22,	%f6
	add	%i1,	%g7,	%l1
	bvs,a,pn	%xcc,	loop_673
loop_672:
	andn	%o0,	0x01D6,	%l5
	fba	%fcc2,	loop_674
	srax	%i6,	%i3,	%i2
loop_673:
	tg	%icc,	0x1
	edge32l	%o5,	%g2,	%l3
loop_674:
	tneg	%icc,	0x2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x15,	%f0
	movne	%xcc,	%g1,	%l2
	nop
	setx	0x421DE92C68299C53,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFDC77C61C0E93AF0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f22,	%f12
	sllx	%o6,	0x1F,	%o7
	movrlez	%g6,	%g3,	%o2
	movcc	%icc,	%o4,	%i7
	movvs	%xcc,	%i4,	%l6
	membar	0x28
	andn	%i5,	0x0079,	%o1
	bg,a,pt	%xcc,	loop_675
	tcc	%icc,	0x7
	srax	%g4,	%g5,	%l4
	umulcc	%i0,	0x083E,	%o3
loop_675:
	edge16n	%l0,	%g7,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc2,	loop_676
	fmovdgu	%icc,	%f10,	%f11
	edge32n	%o0,	%i1,	%i6
	addccc	%i3,	%l5,	%o5
loop_676:
	tge	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x20] %asi,	%f16
	subccc	%i2,	0x0AFD,	%l3
	brlz	%g2,	loop_677
	edge8n	%g1,	%o6,	%l2
	fbn,a	%fcc1,	loop_678
	movrlez	%g6,	%o7,	%o2
loop_677:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f15,	[%l7 + 0x30] %asi
loop_678:
	udiv	%g3,	0x0F2B,	%i7
	andncc	%i4,	%o4,	%i5
	edge32ln	%o1,	%g4,	%g5
	edge8ln	%l4,	%l6,	%i0
	movrgez	%o3,	0x108,	%g7
	taddcctv	%l0,	0x0703,	%l1
	udivx	%i1,	0x1A29,	%i6
	fmovd	%f4,	%f4
	mulx	%o0,	0x0346,	%l5
	fmovdleu	%icc,	%f25,	%f13
	sdiv	%o5,	0x18A9,	%i3
	movrlz	%i2,	0x0A1,	%l3
	fcmpeq32	%f10,	%f16,	%g1
	andn	%g2,	%l2,	%g6
	orncc	%o7,	0x1DC0,	%o6
	umul	%o2,	0x0FC3,	%i7
	xor	%g3,	0x0DE2,	%i4
	movn	%xcc,	%i5,	%o1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16ln	%g4,	%o4,	%g5
	bn,a,pt	%icc,	loop_679
	xor	%l6,	0x1C4B,	%l4
	orcc	%i0,	%g7,	%l0
	fnors	%f17,	%f18,	%f26
loop_679:
	array32	%o3,	%l1,	%i1
	sir	0x0ED3
	fand	%f26,	%f16,	%f0
	movrgz	%o0,	%i6,	%o5
	brlez,a	%l5,	loop_680
	for	%f12,	%f16,	%f18
	taddcc	%i3,	%i2,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_680:
	fmovda	%icc,	%f31,	%f28
	bleu,pt	%icc,	loop_681
	udivcc	%g1,	0x02E7,	%g2
	tpos	%xcc,	0x3
	or	%g6,	%l2,	%o7
loop_681:
	bpos,a,pn	%icc,	loop_682
	fmovdgu	%icc,	%f2,	%f17
	stb	%o2,	[%l7 + 0x58]
	membar	0x0D
loop_682:
	orcc	%i7,	0x0FDC,	%g3
	edge16l	%i4,	%i5,	%o1
	stbar
	umul	%g4,	0x1AD9,	%o6
	udivx	%o4,	0x110B,	%g5
	smulcc	%l4,	0x1BF6,	%i0
	addc	%l6,	0x0E68,	%g7
	xor	%l0,	0x0C3D,	%o3
	taddcctv	%i1,	0x16AD,	%l1
	addcc	%i6,	0x0138,	%o0
	array32	%o5,	%l5,	%i2
	brgez,a	%l3,	loop_683
	edge8l	%g1,	%i3,	%g6
	lduw	[%l7 + 0x30],	%g2
	move	%icc,	%o7,	%l2
loop_683:
	nop
	set	0x7C, %l2
	lduwa	[%l7 + %l2] 0x04,	%o2
	subccc	%i7,	0x11FA,	%i4
	move	%icc,	%i5,	%o1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	bcc	loop_684
	mova	%icc,	%g3,	%o4
	nop
	fitos	%f4,	%f13
	fstox	%f13,	%f16
	fxtos	%f16,	%f12
	orncc	%o6,	0x018C,	%l4
loop_684:
	fmovrse	%i0,	%f18,	%f7
	tn	%icc,	0x2
	orncc	%l6,	0x1DD1,	%g7
	fnor	%f24,	%f8,	%f14
	sub	%l0,	0x05C1,	%o3
	orncc	%g5,	0x0791,	%i1
	fbe	%fcc3,	loop_685
	andncc	%i6,	%o0,	%l1
	tvs	%xcc,	0x3
	brgez	%o5,	loop_686
loop_685:
	srax	%i2,	%l5,	%g1
	fbu	%fcc0,	loop_687
	subc	%l3,	0x093D,	%g6
loop_686:
	sub	%i3,	%o7,	%l2
	mulscc	%o2,	%g2,	%i4
loop_687:
	fmovdg	%icc,	%f6,	%f18
	udiv	%i7,	0x1E1A,	%i5
	sub	%g4,	0x1BFB,	%o1
	sllx	%g3,	%o4,	%o6
	movg	%xcc,	%l4,	%l6
	tl	%xcc,	0x0
	prefetch	[%l7 + 0x34],	 0x1
	movpos	%icc,	%i0,	%l0
	movleu	%xcc,	%o3,	%g7
	nop
	setx	0xBC5A42D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x84EECE80,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f22,	%f10
	movgu	%xcc,	%g5,	%i6
	nop
	setx	0x407C3369,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fbne,a	%fcc0,	loop_688
	movrlz	%o0,	%i1,	%o5
	ldub	[%l7 + 0x57],	%l1
	and	%l5,	%i2,	%g1
loop_688:
	addcc	%g6,	0x1A08,	%i3
	smul	%l3,	0x11E1,	%l2
	fandnot2	%f14,	%f24,	%f20
	tgu	%icc,	0x0
	tge	%xcc,	0x4
	sra	%o2,	%o7,	%g2
	alignaddr	%i7,	%i4,	%i5
	add	%g4,	%g3,	%o1
	movrlz	%o6,	0x277,	%o4
	alignaddrl	%l6,	%i0,	%l0
	orcc	%o3,	%g7,	%g5
	andncc	%l4,	%i6,	%o0
	bne,pn	%xcc,	loop_689
	te	%xcc,	0x3
	fmuld8sux16	%f5,	%f15,	%f12
	movrgz	%o5,	%l1,	%i1
loop_689:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x11,	%i2,	%g1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udivcc	%l5,	0x036D,	%g6
	fmovrdlz	%l3,	%f8,	%f14
	fmovrsne	%i3,	%f1,	%f3
	tcc	%xcc,	0x7
	membar	0x05
	move	%xcc,	%l2,	%o2
	movrgz	%g2,	0x2D2,	%i7
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	popc	0x0348,	%i5
	fmovsne	%xcc,	%f7,	%f23
	fornot1s	%f3,	%f14,	%f16
	fpsub16s	%f17,	%f0,	%f15
	edge8	%g4,	%g3,	%o1
	be,pn	%icc,	loop_690
	sra	%o6,	%i4,	%o4
	fmovrde	%l6,	%f26,	%f30
	orn	%i0,	%l0,	%o3
loop_690:
	nop
	wr	%g0,	0x88,	%asi
	stxa	%g7,	[%l7 + 0x18] %asi
	smul	%g5,	0x024F,	%l4
	tsubcc	%o0,	0x1C34,	%o5
	tne	%xcc,	0x7
	nop
	set	0x38, %o6
	prefetch	[%l7 + %o6],	 0x1
	array16	%i6,	%l1,	%i2
	edge8n	%i1,	%l5,	%g1
	movrlz	%l3,	0x307,	%i3
	sir	0x1359
	tn	%icc,	0x1
	nop
	setx	0xFD22A392,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x3024C450,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f28,	%f28
	be,pn	%xcc,	loop_691
	fmovsvc	%icc,	%f13,	%f8
	membar	0x51
	xorcc	%l2,	%o2,	%g2
loop_691:
	edge8n	%i7,	%o7,	%g6
	tl	%xcc,	0x3
	nop
	fitod	%f13,	%f6
	andncc	%g4,	%i5,	%g3
	movpos	%icc,	%o1,	%o6
	sll	%i4,	0x0F,	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l6,	%l0
	fbn	%fcc2,	loop_692
	addcc	%o3,	0x1863,	%i0
	fabss	%f2,	%f27
	fcmpgt32	%f24,	%f12,	%g5
loop_692:
	orncc	%g7,	0x1E11,	%l4
	array16	%o0,	%o5,	%l1
	fornot1	%f30,	%f18,	%f24
	nop
	fitos	%f0,	%f31
	fstox	%f31,	%f2
	fbule	%fcc1,	loop_693
	tne	%icc,	0x4
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x18
loop_693:
	std	%f6,	[%l7 + 0x48]
	brlz,a	%i6,	loop_694
	nop
	setx	0xD062985A,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	movle	%icc,	%i1,	%l5
	fmovdle	%icc,	%f0,	%f20
loop_694:
	sdiv	%i2,	0x04F8,	%l3
	fbue,a	%fcc0,	loop_695
	ld	[%l7 + 0x4C],	%f20
	bcc,a,pt	%xcc,	loop_696
	array32	%g1,	%i3,	%l2
loop_695:
	alignaddr	%g2,	%o2,	%o7
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x18,	 0x2
loop_696:
	fpadd16s	%f19,	%f27,	%f13
	fba,a	%fcc3,	loop_697
	brgez	%g4,	loop_698
	bpos,a,pn	%icc,	loop_699
	sethi	0x1076,	%i5
loop_697:
	array8	%g3,	%o1,	%o6
loop_698:
	nop
	fitos	%f9,	%f30
	fstod	%f30,	%f26
loop_699:
	fmovrse	%g6,	%f27,	%f29
	fbuge	%fcc1,	loop_700
	fmovsleu	%icc,	%f5,	%f31
	umul	%i4,	0x1024,	%o4
	set	0x76, %i3
	lduha	[%l7 + %i3] 0x19,	%l6
loop_700:
	fmovs	%f18,	%f0
	tcc	%xcc,	0x4
	movne	%icc,	%l0,	%i0
	edge32l	%g5,	%o3,	%g7
	fmuld8sux16	%f7,	%f15,	%f10
	fxnor	%f10,	%f30,	%f24
	fmovrse	%o0,	%f21,	%f27
	tsubcc	%l4,	%l1,	%i6
	movn	%xcc,	%o5,	%i1
	nop
	setx	loop_701,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l5,	%l3,	%i2
	fbne,a	%fcc0,	loop_702
	tgu	%icc,	0x4
loop_701:
	movcc	%icc,	%i3,	%g1
	nop
	setx	0x2FD8CB34,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xC3794DB6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f0,	%f27
loop_702:
	movpos	%icc,	%l2,	%g2
	orn	%o7,	0x04B8,	%i7
	movne	%xcc,	%g4,	%o2
	membar	0x3F
	alignaddr	%i5,	%o1,	%o6
	alignaddrl	%g6,	%i4,	%g3
	taddcctv	%l6,	0x1B62,	%o4
	edge16ln	%i0,	%g5,	%o3
	fbn,a	%fcc0,	loop_703
	ld	[%l7 + 0x1C],	%f27
	alignaddrl	%l0,	%o0,	%l4
	tg	%xcc,	0x2
loop_703:
	tleu	%icc,	0x7
	movge	%icc,	%l1,	%i6
	fcmple32	%f4,	%f14,	%o5
	te	%xcc,	0x0
	nop
	setx	0xDE7736D7F646CC3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6163B6AF9D818F34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f20,	%f8
	wr	%g0,	0x2b,	%asi
	stha	%g7,	[%l7 + 0x6E] %asi
	membar	#Sync
	fmovdleu	%xcc,	%f31,	%f17
	srax	%l5,	%l3,	%i1
	edge32ln	%i3,	%g1,	%i2
	movleu	%icc,	%g2,	%l2
	mulx	%i7,	%o7,	%o2
	tsubcc	%g4,	0x12B2,	%o1
	prefetch	[%l7 + 0x6C],	 0x1
	sir	0x0CCE
	umul	%i5,	%g6,	%o6
	orn	%g3,	%i4,	%o4
	fmovrslz	%l6,	%f15,	%f3
	addcc	%i0,	0x1E72,	%o3
	tgu	%xcc,	0x2
	movre	%l0,	0x043,	%g5
	and	%o0,	%l1,	%i6
	bneg	%icc,	loop_704
	edge32n	%o5,	%l4,	%g7
	movrlz	%l3,	0x3C4,	%i1
	udiv	%i3,	0x1CCC,	%g1
loop_704:
	tpos	%xcc,	0x6
	tsubcctv	%l5,	%i2,	%g2
	ldstub	[%l7 + 0x79],	%i7
	edge32l	%o7,	%o2,	%g4
	sdiv	%o1,	0x0A2D,	%l2
	fbn	%fcc1,	loop_705
	edge8	%g6,	%i5,	%o6
	andcc	%i4,	0x0D2B,	%g3
	fbne,a	%fcc0,	loop_706
loop_705:
	tneg	%xcc,	0x2
	fnot1	%f14,	%f26
	movrgez	%l6,	0x39B,	%i0
loop_706:
	nop
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x89
	fmovdne	%xcc,	%f31,	%f26
	movl	%xcc,	%o3,	%l0
	movrgez	%o4,	%g5,	%l1
	movrgz	%i6,	%o5,	%o0
	sir	0x1F2D
	nop
	setx	0x563BC82C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xE1D0C62A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f26,	%f21
	ta	%icc,	0x6
	tpos	%xcc,	0x2
	array32	%l4,	%l3,	%i1
	mova	%xcc,	%g7,	%g1
	tpos	%icc,	0x7
	fsrc1s	%f23,	%f7
	fcmpeq16	%f30,	%f8,	%i3
	movvc	%icc,	%i2,	%l5
	tvc	%icc,	0x1
	movrne	%g2,	%i7,	%o7
	subc	%g4,	%o2,	%o1
	fbne	%fcc2,	loop_707
	fbug,a	%fcc1,	loop_708
	tneg	%xcc,	0x2
	edge32l	%g6,	%l2,	%i5
loop_707:
	bgu,a	%xcc,	loop_709
loop_708:
	fmovdneg	%icc,	%f16,	%f21
	nop
	setx	loop_710,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%i4,	%o6,	%g3
loop_709:
	tcc	%xcc,	0x0
	fnors	%f1,	%f21,	%f2
loop_710:
	alignaddrl	%l6,	%i0,	%l0
	bne,a,pn	%xcc,	loop_711
	fmul8x16al	%f17,	%f9,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_711:
	brgz,a	%o4,	loop_713
	sethi	0x0FE5,	%o3
	fbg,a	%fcc3,	loop_714
loop_712:
	movvc	%xcc,	%l1,	%i6
loop_713:
	nop
	fitos	%f3,	%f7
	tleu	%xcc,	0x6
loop_714:
	faligndata	%f0,	%f26,	%f0
	fandnot2	%f10,	%f16,	%f2
	ble,a	loop_715
	sethi	0x0112,	%o5
	fmovda	%xcc,	%f0,	%f4
	fmovdcc	%icc,	%f13,	%f26
loop_715:
	nop
	fitod	%f5,	%f20
	sub	%o0,	0x19C9,	%g5
	edge32	%l3,	%i1,	%g7
	fbn,a	%fcc3,	loop_716
	xorcc	%g1,	%l4,	%i3
	orn	%l5,	0x10C1,	%i2
	move	%icc,	%g2,	%i7
loop_716:
	srl	%g4,	%o2,	%o1
	movcs	%icc,	%g6,	%o7
	ldd	[%l7 + 0x78],	%f30
	nop
	set	0x6C, %o0
	stw	%i5,	[%l7 + %o0]
	nop
	setx	0x40871F242D55DBEA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f20
	movg	%icc,	%l2,	%o6
	udivx	%g3,	0x1E5F,	%l6
	umulcc	%i0,	%l0,	%o4
	taddcctv	%i4,	0x0314,	%l1
	nop
	set	0x38, %g1
	stx	%o3,	[%l7 + %g1]
	bg,a	%xcc,	loop_717
	stbar
	add	%i6,	%o0,	%o5
	movge	%xcc,	%g5,	%i1
loop_717:
	add	%l3,	%g7,	%g1
	srl	%i3,	%l4,	%l5
	edge32n	%g2,	%i7,	%i2
	srlx	%g4,	0x01,	%o2
	ta	%icc,	0x6
	addccc	%o1,	0x06E9,	%g6
	bge	loop_718
	fmovda	%xcc,	%f29,	%f29
	ldd	[%l7 + 0x18],	%o6
	addc	%l2,	%i5,	%o6
loop_718:
	xorcc	%g3,	0x05AB,	%i0
	sdiv	%l0,	0x095F,	%l6
	brnz	%o4,	loop_719
	brgz	%i4,	loop_720
	movgu	%icc,	%o3,	%l1
	xor	%o0,	%o5,	%g5
loop_719:
	add	%i1,	0x074D,	%i6
loop_720:
	orcc	%l3,	%g1,	%i3
	fmovdleu	%xcc,	%f29,	%f17
	fbe,a	%fcc1,	loop_721
	xor	%g7,	%l5,	%l4
	nop
	set	0x1A, %o4
	ldstub	[%l7 + %o4],	%i7
	subccc	%g2,	%g4,	%o2
loop_721:
	fbue	%fcc0,	loop_722
	tcs	%xcc,	0x7
	movl	%xcc,	%i2,	%o1
	taddcc	%o7,	0x1A0C,	%g6
loop_722:
	tl	%icc,	0x0
	ldstub	[%l7 + 0x4B],	%l2
	stx	%i5,	[%l7 + 0x30]
	nop
	fitos	%f8,	%f21
	fstox	%f21,	%f28
	fxtos	%f28,	%f2
	fmovscc	%icc,	%f12,	%f31
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x89,	%o6
	movge	%xcc,	%i0,	%g3
	edge16	%l6,	%l0,	%i4
	movge	%icc,	%o3,	%l1
	faligndata	%f6,	%f14,	%f30
	movvs	%icc,	%o0,	%o4
	ldub	[%l7 + 0x43],	%o5
	tcc	%xcc,	0x4
	bn	%xcc,	loop_723
	fornot2	%f0,	%f8,	%f20
	movrgez	%i1,	%i6,	%l3
	te	%xcc,	0x3
loop_723:
	nop
	set	0x38, %i2
	lduha	[%l7 + %i2] 0x81,	%g1
	fpmerge	%f9,	%f21,	%f18
	fmul8ulx16	%f8,	%f14,	%f4
	fbug,a	%fcc1,	loop_724
	bgu,a	%icc,	loop_725
	fmovdl	%icc,	%f21,	%f25
	sdivcc	%g5,	0x0A34,	%g7
loop_724:
	movneg	%xcc,	%i3,	%l4
loop_725:
	fmovda	%icc,	%f4,	%f9
	movvs	%xcc,	%i7,	%l5
	addc	%g4,	0x133C,	%o2
	stb	%i2,	[%l7 + 0x57]
	membar	0x71
	taddcc	%o1,	%o7,	%g6
	edge8n	%l2,	%g2,	%o6
	set	0x70, %l3
	ldsha	[%l7 + %l3] 0x04,	%i5
	movl	%icc,	%i0,	%g3
	movle	%icc,	%l6,	%i4
	movneg	%xcc,	%o3,	%l1
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f28
	fxtod	%f28,	%f4
	xnor	%l0,	0x16C6,	%o4
	sethi	0x1734,	%o5
	tsubcc	%i1,	%o0,	%l3
	ldd	[%l7 + 0x78],	%g0
	mova	%xcc,	%i6,	%g7
	fble,a	%fcc1,	loop_726
	subcc	%g5,	%i3,	%l4
	movvs	%xcc,	%l5,	%i7
	fmul8ulx16	%f0,	%f30,	%f8
loop_726:
	ldsw	[%l7 + 0x20],	%o2
	ldsh	[%l7 + 0x68],	%i2
	fmovs	%f28,	%f3
	alignaddrl	%o1,	%g4,	%g6
	edge16n	%l2,	%o7,	%g2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x6C] %asi,	%f7
	popc	%o6,	%i0
	array32	%g3,	%i5,	%i4
	tleu	%xcc,	0x6
	srlx	%o3,	%l6,	%l1
	orn	%o4,	0x0C75,	%o5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	addccc	%o0,	%l0,	%g1
	stb	%l3,	[%l7 + 0x3F]
	fmovse	%xcc,	%f0,	%f8
	movrlez	%g7,	%g5,	%i3
	subcc	%l4,	%i6,	%l5
	sethi	0x1B84,	%i7
	tneg	%icc,	0x4
	popc	0x03A2,	%i2
	movne	%icc,	%o2,	%g4
	taddcctv	%g6,	%l2,	%o1
	add	%g2,	%o7,	%i0
	alignaddrl	%o6,	%g3,	%i4
	edge32	%o3,	%i5,	%l6
	fcmpeq16	%f24,	%f16,	%o4
	fcmple16	%f26,	%f4,	%o5
	edge32n	%l1,	%o0,	%l0
	smulcc	%g1,	%l3,	%i1
	subccc	%g7,	0x0B6B,	%g5
	ldub	[%l7 + 0x4E],	%l4
	fbuge	%fcc2,	loop_727
	sdivx	%i6,	0x0994,	%l5
	movg	%icc,	%i7,	%i2
	fnot1	%f4,	%f0
loop_727:
	stb	%i3,	[%l7 + 0x26]
	subcc	%o2,	0x13CD,	%g4
	be,pn	%xcc,	loop_728
	nop
	setx loop_729, %l0, %l1
	jmpl %l1, %g6
	taddcc	%l2,	%o1,	%o7
	taddcctv	%g2,	%o6,	%g3
loop_728:
	fbuge,a	%fcc2,	loop_730
loop_729:
	srlx	%i4,	%i0,	%o3
	orcc	%l6,	%i5,	%o4
	fmuld8sux16	%f7,	%f22,	%f0
loop_730:
	nop
	fitod	%f12,	%f22
	fdtoi	%f22,	%f23
	fnot2s	%f2,	%f16
	stbar
	sdivcc	%l1,	0x1806,	%o5
	bcs	loop_731
	movg	%icc,	%o0,	%g1
	bneg,pn	%xcc,	loop_732
	sth	%l0,	[%l7 + 0x24]
loop_731:
	flush	%l7 + 0x64
	srlx	%i1,	0x04,	%g7
loop_732:
	movneg	%icc,	%l3,	%g5
	srl	%l4,	0x1F,	%l5
	movrlz	%i7,	0x27C,	%i6
	srlx	%i3,	0x0A,	%o2
	sdivx	%g4,	0x0DFC,	%g6
	edge32ln	%l2,	%i2,	%o7
	bl,a,pn	%xcc,	loop_733
	tcs	%xcc,	0x3
	ldx	[%l7 + 0x20],	%o1
	fmovsne	%icc,	%f27,	%f0
loop_733:
	fbu	%fcc2,	loop_734
	smulcc	%o6,	0x1EF3,	%g3
	fmovdvs	%icc,	%f24,	%f5
	tpos	%icc,	0x6
loop_734:
	brlez	%i4,	loop_735
	fmovs	%f31,	%f13
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i0
loop_735:
	bg	loop_736
	ldsb	[%l7 + 0x0C],	%g2
	flush	%l7 + 0x5C
	brz	%o3,	loop_737
loop_736:
	udiv	%i5,	0x11A0,	%l6
	fba	%fcc3,	loop_738
	tl	%icc,	0x2
loop_737:
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f22
	movrlz	%l1,	%o5,	%o0
loop_738:
	edge8l	%g1,	%o4,	%i1
	bl,a,pt	%xcc,	loop_739
	move	%xcc,	%g7,	%l3
	sdivx	%g5,	0x1E48,	%l4
	andncc	%l0,	%i7,	%l5
loop_739:
	fmovsvc	%xcc,	%f14,	%f31
	fbuge	%fcc0,	loop_740
	tcs	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
loop_740:
	orncc	%o2,	%i6,	%g4
	edge16n	%g6,	%l2,	%o7
	edge8	%i2,	%o6,	%o1
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x81,	 0x3
	fmovsa	%xcc,	%f17,	%f12
	tcs	%xcc,	0x7
	mulx	%i0,	0x06C3,	%g2
	fmovde	%xcc,	%f11,	%f29
	be,a	%icc,	loop_741
	tleu	%xcc,	0x4
	edge32ln	%i4,	%i5,	%l6
	fones	%f1
loop_741:
	fmovdcc	%xcc,	%f9,	%f18
	fbn,a	%fcc2,	loop_742
	stw	%o3,	[%l7 + 0x70]
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_742:
	movvc	%xcc,	%o5,	%l1
	fnot2s	%f25,	%f24
	fmovrdne	%g1,	%f10,	%f4
	fsrc1	%f16,	%f6
	fnand	%f12,	%f6,	%f0
	fbul,a	%fcc3,	loop_743
	fbule,a	%fcc2,	loop_744
	nop
	setx	0x2C0CD084C07C79B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x0c,	%o0
loop_743:
	fmovspos	%icc,	%f22,	%f22
loop_744:
	fbu,a	%fcc1,	loop_745
	bne,a	%xcc,	loop_746
	fandnot1s	%f22,	%f6,	%f24
	ldx	[%l7 + 0x68],	%i1
loop_745:
	edge8l	%g7,	%l3,	%g5
loop_746:
	fmul8ulx16	%f30,	%f24,	%f28
	sra	%l4,	0x0B,	%o4
	fpmerge	%f8,	%f7,	%f4
	fmovsl	%xcc,	%f19,	%f29
	tvc	%icc,	0x1
	tneg	%icc,	0x5
	fornot1	%f14,	%f14,	%f22
	orncc	%i7,	0x1F74,	%l5
	tg	%icc,	0x2
	fmovrslz	%i3,	%f2,	%f21
	edge32l	%l0,	%o2,	%g4
	array32	%i6,	%l2,	%g6
	add	%o7,	0x0F55,	%o6
	movne	%xcc,	%o1,	%i2
	set	0x18, %o2
	ldstuba	[%l7 + %o2] 0x0c,	%g3
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0x1
	edge8l	%i0,	%i4,	%i5
	ldx	[%l7 + 0x58],	%l6
	ldub	[%l7 + 0x6E],	%o5
	edge8n	%l1,	%o3,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%g7
	fandnot1	%f0,	%f2,	%f4
	subc	%l3,	0x1318,	%g5
	movneg	%xcc,	%l4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x2
	bg,a,pn	%xcc,	loop_747
	tcc	%xcc,	0x1
	te	%icc,	0x4
	movge	%xcc,	%i7,	%o4
loop_747:
	umul	%l5,	0x1368,	%l0
	stw	%o2,	[%l7 + 0x70]
	andncc	%i3,	%i6,	%g4
	for	%f4,	%f30,	%f6
	edge8l	%l2,	%g6,	%o7
	swap	[%l7 + 0x3C],	%o6
	nop
	setx	loop_748,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	%i2,	%g3
	bleu,pt	%xcc,	loop_749
	sub	%g2,	0x1E4A,	%i0
loop_748:
	tle	%icc,	0x2
	orn	%o1,	0x028E,	%i4
loop_749:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i5,	%l6,	%l1
	nop
	setx	0x1E6B1D19415244FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x1F9AD60A604D5C73,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f0,	%f26
	srax	%o5,	%o0,	%o3
	umul	%g7,	0x1E01,	%i1
	movl	%icc,	%g5,	%l4
	fpadd32s	%f5,	%f20,	%f6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l3
	movleu	%xcc,	%i7,	%g1
	brlz	%o4,	loop_750
	fmovdge	%xcc,	%f9,	%f31
	edge32n	%l0,	%o2,	%i3
	tvc	%icc,	0x5
loop_750:
	brgez,a	%i6,	loop_751
	nop
	setx	0x26392FB0B04C29BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	tcc	%icc,	0x3
	movge	%xcc,	%l5,	%g4
loop_751:
	edge16ln	%g6,	%o7,	%o6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	andn	%l2,	0x10A0,	%i2
	tn	%xcc,	0x5
	swap	[%l7 + 0x3C],	%g2
	ld	[%l7 + 0x08],	%f31
	tcs	%xcc,	0x4
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%o1
	movrlz	%i4,	%g3,	%l6
	fmovsg	%xcc,	%f28,	%f22
	fmuld8ulx16	%f25,	%f4,	%f10
	movne	%icc,	%l1,	%o5
	edge32n	%i5,	%o3,	%o0
	fnot1	%f24,	%f24
	sub	%g7,	0x17FC,	%g5
	and	%l4,	0x13F4,	%l3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x04,	%f16
	lduh	[%l7 + 0x66],	%i1
	fbo,a	%fcc2,	loop_752
	fbuge,a	%fcc3,	loop_753
	tle	%icc,	0x3
	nop
	fitos	%f11,	%f29
	fstoi	%f29,	%f5
loop_752:
	bshuffle	%f16,	%f22,	%f10
loop_753:
	tsubcc	%i7,	0x1B0E,	%g1
	stw	%l0,	[%l7 + 0x24]
	or	%o4,	0x08CA,	%i3
	edge16n	%o2,	%l5,	%i6
	bn,a	loop_754
	srax	%g4,	0x03,	%o7
	fmovsl	%icc,	%f0,	%f9
	stb	%g6,	[%l7 + 0x31]
loop_754:
	bgu,a	loop_755
	fandnot1s	%f12,	%f28,	%f18
	bshuffle	%f4,	%f0,	%f8
	fmovdvs	%xcc,	%f14,	%f14
loop_755:
	bcc	%xcc,	loop_756
	tl	%xcc,	0x1
	fnors	%f22,	%f21,	%f30
	xorcc	%l2,	%i2,	%g2
loop_756:
	fmovdn	%xcc,	%f31,	%f3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%i0
	edge16	%o1,	%g3,	%i4
	ble,pn	%xcc,	loop_757
	xorcc	%l1,	0x0734,	%l6
	tvc	%icc,	0x0
	udiv	%i5,	0x1295,	%o5
loop_757:
	bn	%icc,	loop_758
	fmovdvc	%xcc,	%f4,	%f16
	membar	0x48
	taddcctv	%o0,	%g7,	%o3
loop_758:
	ldd	[%l7 + 0x28],	%f16
	sdiv	%g5,	0x0E8F,	%l3
	srlx	%l4,	%i7,	%g1
	edge16ln	%i1,	%l0,	%o4
	nop
	fitod	%f13,	%f10
	move	%xcc,	%i3,	%o2
	fpack16	%f16,	%f28
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l5,	%i6
	movcc	%xcc,	%g4,	%g6
	fmovdneg	%xcc,	%f0,	%f3
	movge	%xcc,	%o7,	%i2
	stw	%l2,	[%l7 + 0x54]
	bshuffle	%f14,	%f0,	%f28
	fmovsvc	%icc,	%f29,	%f13
	movle	%xcc,	%g2,	%i0
	ldstub	[%l7 + 0x1A],	%o1
	fornot2s	%f10,	%f8,	%f27
	movre	%o6,	0x1B0,	%g3
	tg	%xcc,	0x4
	udivx	%l1,	0x0B17,	%i4
	fmul8ulx16	%f22,	%f30,	%f14
	orcc	%i5,	%o5,	%l6
	movge	%xcc,	%o0,	%g7
	tcs	%xcc,	0x7
	srax	%g5,	0x05,	%l3
	tcc	%xcc,	0x5
	edge16l	%o3,	%i7,	%l4
	fone	%f24
	edge32l	%g1,	%i1,	%l0
	brlez	%o4,	loop_759
	add	%i3,	%o2,	%i6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l5
loop_759:
	tne	%xcc,	0x1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g6,	%o7
	ldsw	[%l7 + 0x50],	%i2
	edge16	%l2,	%g4,	%i0
	faligndata	%f18,	%f30,	%f18
	bvs,pn	%icc,	loop_760
	edge8l	%o1,	%o6,	%g3
	tvc	%xcc,	0x5
	subcc	%l1,	0x0CAC,	%g2
loop_760:
	srl	%i4,	%i5,	%l6
	movne	%icc,	%o0,	%o5
	move	%xcc,	%g5,	%g7
	alignaddr	%l3,	%i7,	%o3
	flush	%l7 + 0x7C
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f28
	edge8l	%g1,	%l4,	%i1
	udiv	%o4,	0x08FE,	%i3
	edge32	%o2,	%i6,	%l0
	sdiv	%g6,	0x10B1,	%l5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x56] %asi,	%o7
	ldsh	[%l7 + 0x36],	%l2
	tvs	%icc,	0x6
	xorcc	%i2,	%i0,	%o1
	brgez	%o6,	loop_761
	fmovrdlez	%g4,	%f26,	%f24
	addc	%l1,	%g3,	%g2
	tpos	%xcc,	0x6
loop_761:
	fmovdneg	%icc,	%f23,	%f3
	fmul8ulx16	%f20,	%f2,	%f10
	for	%f6,	%f20,	%f8
	srl	%i5,	%i4,	%o0
	bpos	%icc,	loop_762
	movgu	%xcc,	%o5,	%l6
	popc	%g7,	%l3
	fbug,a	%fcc1,	loop_763
loop_762:
	brlez	%i7,	loop_764
	movrne	%g5,	0x1ED,	%g1
	sir	0x1B67
loop_763:
	movneg	%xcc,	%l4,	%o3
loop_764:
	tneg	%icc,	0x4
	fnegs	%f31,	%f19
	tl	%xcc,	0x6
	mulx	%o4,	%i3,	%o2
	alignaddr	%i6,	%l0,	%g6
	movg	%xcc,	%i1,	%o7
	taddcc	%l2,	0x1F0C,	%i2
	movne	%xcc,	%l5,	%i0
	edge8ln	%o1,	%o6,	%g4
	wr	%g0,	0x88,	%asi
	sta	%f31,	[%l7 + 0x60] %asi
	move	%icc,	%g3,	%g2
	fnot1s	%f20,	%f27
	srax	%i5,	0x08,	%i4
	fblg,a	%fcc3,	loop_765
	edge16l	%l1,	%o5,	%l6
	fbne,a	%fcc3,	loop_766
	brgz	%g7,	loop_767
loop_765:
	smul	%o0,	0x1060,	%l3
	taddcctv	%g5,	%i7,	%g1
loop_766:
	sdivx	%l4,	0x1311,	%o4
loop_767:
	nop
	setx	loop_768,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%xcc,	%i3,	%o3
	fba	%fcc1,	loop_769
	tgu	%xcc,	0x4
loop_768:
	srlx	%i6,	0x19,	%l0
	sethi	0x15CB,	%g6
loop_769:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i1
	ldub	[%l7 + 0x0A],	%o7
	umul	%o2,	0x048D,	%i2
	nop
	fitod	%f2,	%f28
	fdtos	%f28,	%f17
	fbe	%fcc2,	loop_770
	edge32ln	%l5,	%i0,	%l2
	fornot1	%f24,	%f2,	%f2
	taddcctv	%o1,	%o6,	%g4
loop_770:
	nop
	set	0x70, %i1
	lduha	[%l7 + %i1] 0x10,	%g3
	orncc	%g2,	0x0A93,	%i5
	edge32n	%l1,	%i4,	%o5
	lduw	[%l7 + 0x5C],	%g7
	movrgez	%o0,	%l3,	%l6
	membar	0x48
	sll	%i7,	%g5,	%l4
	membar	0x63
	movrne	%o4,	0x289,	%g1
	movrlez	%i3,	%o3,	%l0
	edge16ln	%i6,	%i1,	%o7
	fbuge,a	%fcc2,	loop_771
	tsubcctv	%g6,	0x1451,	%o2
	bvs	%xcc,	loop_772
	tn	%xcc,	0x2
loop_771:
	xor	%i2,	0x1DF0,	%i0
	movpos	%icc,	%l2,	%l5
loop_772:
	ta	%icc,	0x1
	call	loop_773
	nop
	fitos	%f9,	%f10
	fstod	%f10,	%f8
	brlez	%o6,	loop_774
	sub	%o1,	%g3,	%g4
loop_773:
	edge8l	%i5,	%g2,	%l1
	mulx	%i4,	0x1DF5,	%o5
loop_774:
	movre	%o0,	%g7,	%l3
	alignaddrl	%l6,	%i7,	%g5
	movcs	%icc,	%l4,	%g1
	fnegd	%f14,	%f4
	movl	%xcc,	%i3,	%o4
	ldsb	[%l7 + 0x45],	%o3
	call	loop_775
	edge32l	%l0,	%i1,	%i6
	edge32ln	%g6,	%o2,	%o7
	orncc	%i2,	%i0,	%l2
loop_775:
	bvs,a	loop_776
	subccc	%o6,	0x0DCB,	%l5
	fandnot1s	%f22,	%f6,	%f5
	fmovs	%f16,	%f18
loop_776:
	tpos	%icc,	0x6
	fbu,a	%fcc0,	loop_777
	movrgez	%o1,	%g4,	%g3
	bgu,pn	%icc,	loop_778
	xor	%g2,	0x143E,	%i5
loop_777:
	stb	%i4,	[%l7 + 0x77]
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_778:
	movre	%l1,	0x1CE,	%o5
	set	0x6C, %g4
	sta	%f16,	[%l7 + %g4] 0x14
	sra	%o0,	%g7,	%l3
	movcc	%icc,	%l6,	%g5
	fblg	%fcc1,	loop_779
	edge8n	%l4,	%g1,	%i7
	fnot2	%f8,	%f26
	tgu	%xcc,	0x6
loop_779:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i3,	0x15,	%o3
	flush	%l7 + 0x74
	set	0x2C, %o7
	sta	%f26,	[%l7 + %o7] 0x88
	edge32l	%o4,	%i1,	%i6
	tleu	%icc,	0x3
	brlez	%l0,	loop_780
	or	%g6,	%o7,	%o2
	movre	%i0,	%i2,	%o6
	subcc	%l2,	0x16D9,	%l5
loop_780:
	fpadd16s	%f15,	%f2,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g4,	0x056,	%o1
	edge32ln	%g2,	%g3,	%i5
	tleu	%xcc,	0x2
	srax	%i4,	%o5,	%o0
	add	%l1,	%g7,	%l3
	addccc	%g5,	%l4,	%g1
	nop
	setx	0x66094F36900D7A4B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x40B7CE4739E7DBE6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f4,	%f2
	movleu	%icc,	%i7,	%i3
	movrlez	%l6,	0x3B6,	%o4
	sub	%i1,	%o3,	%l0
	nop
	setx loop_781, %l0, %l1
	jmpl %l1, %i6
	edge32ln	%o7,	%g6,	%i0
	movcs	%icc,	%o2,	%i2
	addccc	%l2,	0x120C,	%o6
loop_781:
	nop
	set	0x64, %i0
	ldswa	[%l7 + %i0] 0x19,	%l5
	movge	%icc,	%g4,	%g2
	tsubcctv	%g3,	%o1,	%i4
	edge16	%i5,	%o5,	%o0
	edge32l	%l1,	%l3,	%g7
	fcmpne32	%f14,	%f10,	%l4
	tn	%xcc,	0x0
	movrlz	%g5,	0x32A,	%g1
	nop
	setx loop_782, %l0, %l1
	jmpl %l1, %i3
	nop
	setx	loop_783,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvc	%icc,	%f5,	%f14
	fmovdg	%xcc,	%f23,	%f8
loop_782:
	orcc	%i7,	%o4,	%i1
loop_783:
	fmovsne	%icc,	%f30,	%f8
	tne	%xcc,	0x4
	taddcctv	%l6,	0x1ED2,	%l0
	sll	%i6,	%o3,	%g6
	fbne	%fcc0,	loop_784
	fbl	%fcc3,	loop_785
	tl	%icc,	0x1
	bgu,a,pn	%xcc,	loop_786
loop_784:
	array8	%i0,	%o2,	%i2
loop_785:
	tsubcc	%l2,	0x0328,	%o6
	srax	%l5,	0x09,	%o7
loop_786:
	fpadd16	%f18,	%f8,	%f2
	sdiv	%g4,	0x061C,	%g2
	movgu	%xcc,	%g3,	%i4
	fmovsleu	%icc,	%f5,	%f18
	movcc	%icc,	%i5,	%o1
	ldsh	[%l7 + 0x14],	%o5
	bcc,pt	%icc,	loop_787
	bgu,a,pn	%xcc,	loop_788
	bpos	loop_789
	movneg	%icc,	%o0,	%l1
loop_787:
	fmovrsgz	%g7,	%f16,	%f13
loop_788:
	fmovrsgez	%l4,	%f2,	%f6
loop_789:
	fmovrslez	%l3,	%f15,	%f19
	movg	%icc,	%g1,	%i3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i7
	brlez,a	%g5,	loop_790
	udivcc	%i1,	0x1587,	%o4
	add	%l6,	0x1330,	%i6
	fmovsn	%icc,	%f19,	%f29
loop_790:
	smul	%o3,	%g6,	%i0
	fmovdpos	%icc,	%f17,	%f19
	mova	%xcc,	%o2,	%i2
	edge8ln	%l2,	%l0,	%o6
	fcmple16	%f24,	%f26,	%o7
	tvc	%icc,	0x2
	fbl,a	%fcc2,	loop_791
	tl	%xcc,	0x1
	movvs	%xcc,	%l5,	%g4
	te	%xcc,	0x1
loop_791:
	sir	0x0419
	ta	%icc,	0x5
	addc	%g3,	%i4,	%i5
	taddcctv	%g2,	%o5,	%o0
	edge32n	%o1,	%g7,	%l1
	st	%f24,	[%l7 + 0x78]
	sdivcc	%l4,	0x02E2,	%l3
	sethi	0x15C4,	%i3
	tvs	%xcc,	0x0
	brgez	%i7,	loop_792
	and	%g5,	%i1,	%g1
	xorcc	%l6,	0x17CA,	%o4
	movrlz	%i6,	%g6,	%o3
loop_792:
	array8	%i0,	%i2,	%o2
	movleu	%icc,	%l2,	%l0
	tpos	%xcc,	0x6
	sth	%o6,	[%l7 + 0x16]
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x34] %asi,	%o7
	movrne	%g4,	0x1FB,	%l5
	tsubcctv	%g3,	0x1A86,	%i5
	movrlez	%g2,	0x06B,	%i4
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f22,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o0,	[%l7 + 0x7C]
	addccc	%o1,	0x0615,	%g7
	udiv	%l1,	0x0DF6,	%o5
	srlx	%l4,	0x06,	%l3
	fmovdneg	%icc,	%f29,	%f13
	tsubcc	%i3,	0x1512,	%g5
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f14
	fmul8ulx16	%f18,	%f6,	%f14
	movl	%icc,	%i7,	%i1
	movpos	%icc,	%g1,	%l6
	sdiv	%i6,	0x019C,	%g6
	movrlez	%o4,	0x148,	%o3
	tcc	%icc,	0x2
	orcc	%i2,	%o2,	%i0
	sllx	%l2,	0x0B,	%l0
	fornot1	%f6,	%f14,	%f12
	udivcc	%o7,	0x02F5,	%o6
	tpos	%icc,	0x2
	lduh	[%l7 + 0x64],	%l5
	alignaddr	%g4,	%i5,	%g3
	fbu	%fcc1,	loop_793
	fmovrsne	%i4,	%f22,	%f3
	edge32	%g2,	%o1,	%o0
	movrgz	%l1,	%o5,	%l4
loop_793:
	edge32l	%l3,	%g7,	%g5
	fmovsa	%icc,	%f24,	%f22
	umulcc	%i3,	%i1,	%g1
	stb	%l6,	[%l7 + 0x4D]
	nop
	fitos	%f0,	%f29
	fstox	%f29,	%f22
	fxtos	%f22,	%f17
	tl	%xcc,	0x4
	movgu	%icc,	%i7,	%i6
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%o4
	fble,a	%fcc3,	loop_794
	stx	%g6,	[%l7 + 0x48]
	edge32ln	%i2,	%o2,	%o3
	movne	%xcc,	%l2,	%i0
loop_794:
	xnor	%l0,	%o6,	%l5
	nop
	setx	0x20686A9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	brnz	%g4,	loop_795
	edge32n	%o7,	%g3,	%i5
	tvs	%xcc,	0x7
	xnorcc	%g2,	%o1,	%o0
loop_795:
	nop
	set	0x3A, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i4
	fbule	%fcc1,	loop_796
	fpsub32s	%f7,	%f7,	%f19
	fandnot1	%f10,	%f30,	%f28
	fba	%fcc3,	loop_797
loop_796:
	nop
	setx	0xFFF4BD31,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x4E90AAD7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f7,	%f22
	xnor	%l1,	%o5,	%l4
	std	%f14,	[%l7 + 0x38]
loop_797:
	nop
	set	0x68, %l4
	lduwa	[%l7 + %l4] 0x15,	%l3
	movpos	%icc,	%g5,	%i3
	sdiv	%g7,	0x0BE4,	%g1
	fpsub32	%f20,	%f12,	%f28
	fba,a	%fcc3,	loop_798
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f26
	be,a	loop_799
	sra	%i1,	0x18,	%l6
loop_798:
	array16	%i6,	%o4,	%i7
	edge8ln	%g6,	%o2,	%i2
loop_799:
	subc	%l2,	%i0,	%o3
	bvc,a,pn	%icc,	loop_800
	fmovsle	%xcc,	%f20,	%f28
	fpack32	%f2,	%f4,	%f14
	xnorcc	%o6,	%l5,	%l0
loop_800:
	sdivx	%o7,	0x155E,	%g4
	taddcc	%i5,	%g2,	%o1
	sir	0x012D
	edge32l	%o0,	%g3,	%l1
	movneg	%icc,	%o5,	%l4
	movre	%l3,	%g5,	%i4
	sdivx	%g7,	0x1C34,	%g1
	nop
	setx	0xD3957BB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xCC35146F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f31,	%f15
	te	%icc,	0x4
	ta	%xcc,	0x2
	movleu	%icc,	%i1,	%i3
	edge32ln	%l6,	%i6,	%o4
	fpmerge	%f15,	%f28,	%f30
	fnor	%f16,	%f24,	%f10
	fsrc2s	%f9,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x3
	edge32n	%g6,	%i7,	%o2
	tl	%xcc,	0x7
	move	%xcc,	%i2,	%l2
	tcc	%xcc,	0x1
	tgu	%xcc,	0x5
	fmuld8sux16	%f7,	%f16,	%f22
	edge32l	%o3,	%i0,	%o6
	fandnot2s	%f2,	%f24,	%f8
	bvc	%xcc,	loop_801
	tvs	%icc,	0x4
	ta	%xcc,	0x3
	subccc	%l5,	%l0,	%g4
loop_801:
	fba,a	%fcc2,	loop_802
	sdiv	%i5,	0x0388,	%g2
	tneg	%xcc,	0x4
	set	0x2C, %g6
	lduwa	[%l7 + %g6] 0x0c,	%o7
loop_802:
	array8	%o1,	%g3,	%o0
	orn	%o5,	%l1,	%l4
	movle	%icc,	%l3,	%g5
	bneg	loop_803
	srlx	%g7,	%g1,	%i1
	movg	%icc,	%i3,	%l6
	subc	%i4,	%o4,	%i6
loop_803:
	move	%xcc,	%g6,	%i7
	tvc	%icc,	0x2
	orn	%o2,	0x135E,	%l2
	alignaddrl	%i2,	%o3,	%i0
	fmovdvc	%xcc,	%f23,	%f14
	fmovrsne	%l5,	%f18,	%f2
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x68] %asi,	%o6
	move	%icc,	%g4,	%i5
	tl	%icc,	0x5
	ldd	[%l7 + 0x40],	%f18
	fmovdle	%icc,	%f6,	%f23
	taddcctv	%l0,	0x16A0,	%g2
	movre	%o1,	0x285,	%g3
	nop
	setx	0xA40BE7C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xF1FD37C8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f19,	%f27
	edge32	%o7,	%o5,	%l1
	move	%xcc,	%o0,	%l4
	fpadd32s	%f16,	%f29,	%f20
	sra	%g5,	0x1B,	%g7
	edge16	%g1,	%i1,	%l3
	brz	%l6,	loop_804
	xorcc	%i3,	0x1E8F,	%o4
	array16	%i4,	%i6,	%i7
	fmovdleu	%xcc,	%f18,	%f7
loop_804:
	brnz,a	%g6,	loop_805
	taddcctv	%l2,	0x1EA6,	%o2
	smul	%o3,	0x0EC0,	%i0
	fands	%f16,	%f13,	%f7
loop_805:
	edge32l	%l5,	%o6,	%g4
	srl	%i2,	%i5,	%l0
	tcs	%xcc,	0x5
	bneg,pn	%xcc,	loop_806
	bshuffle	%f6,	%f14,	%f28
	ldd	[%l7 + 0x50],	%g2
	tvs	%xcc,	0x5
loop_806:
	srax	%o1,	%g3,	%o7
	sdivx	%l1,	0x0BCB,	%o5
	smul	%o0,	%l4,	%g5
	subc	%g7,	%g1,	%i1
	tgu	%xcc,	0x3
	sdivx	%l6,	0x0685,	%i3
	fmovrslez	%l3,	%f11,	%f9
	movvc	%xcc,	%o4,	%i6
	movrne	%i7,	0x118,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne	loop_807
	movge	%icc,	%l2,	%i4
	tleu	%icc,	0x0
	fmovrde	%o2,	%f2,	%f4
loop_807:
	fblg,a	%fcc0,	loop_808
	andncc	%i0,	%l5,	%o6
	edge32	%o3,	%g4,	%i5
	fone	%f12
loop_808:
	array16	%i2,	%g2,	%l0
	ldub	[%l7 + 0x72],	%g3
	array8	%o1,	%l1,	%o5
	ldx	[%l7 + 0x68],	%o0
	tvc	%xcc,	0x4
	sir	0x03A9
	movrgz	%l4,	%g5,	%g7
	fbl	%fcc3,	loop_809
	sdivcc	%g1,	0x1FB8,	%o7
	udivx	%l6,	0x0F71,	%i3
	tle	%icc,	0x1
loop_809:
	mulscc	%l3,	0x02A4,	%i1
	edge32	%o4,	%i6,	%i7
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	fbne	%fcc3,	loop_810
	move	%xcc,	%o2,	%i4
	srax	%l5,	%o6,	%i0
	orcc	%g4,	0x1B9C,	%o3
loop_810:
	nop
	setx loop_811, %l0, %l1
	jmpl %l1, %i2
	xnor	%i5,	%l0,	%g3
	udiv	%g2,	0x0895,	%l1
	movrne	%o1,	%o5,	%l4
loop_811:
	movrlez	%o0,	0x3DB,	%g7
	bge	loop_812
	andn	%g1,	0x083A,	%o7
	bgu,a	%icc,	loop_813
	movrne	%g5,	0x27B,	%l6
loop_812:
	brlz,a	%i3,	loop_814
	movvs	%xcc,	%i1,	%l3
loop_813:
	fmovdl	%icc,	%f24,	%f6
	array32	%i6,	%i7,	%g6
loop_814:
	nop
	setx	0x71DDD2D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xBDC2C44B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f13,	%f4
	sdiv	%l2,	0x04E5,	%o4
	sir	0x1726
	andn	%i4,	%o2,	%l5
	bvs,pn	%icc,	loop_815
	sll	%o6,	0x15,	%i0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%o3
loop_815:
	xor	%g4,	0x1678,	%i5
	mova	%xcc,	%i2,	%g3
	movvc	%icc,	%l0,	%g2
	tge	%xcc,	0x5
	movrgz	%o1,	%l1,	%o5
	movge	%icc,	%l4,	%o0
	bpos,a	%icc,	loop_816
	fbu,a	%fcc2,	loop_817
	ldsh	[%l7 + 0x1E],	%g7
	srax	%g1,	%g5,	%o7
loop_816:
	ldd	[%l7 + 0x38],	%i6
loop_817:
	fmovdle	%xcc,	%f18,	%f21
	swap	[%l7 + 0x4C],	%i1
	array8	%i3,	%l3,	%i6
	movpos	%xcc,	%i7,	%g6
	fnegs	%f22,	%f7
	movge	%icc,	%l2,	%i4
	ldsw	[%l7 + 0x28],	%o4
	movgu	%xcc,	%l5,	%o6
	wr	%g0,	0x80,	%asi
	stba	%o2,	[%l7 + 0x3E] %asi
	fmovrdlez	%o3,	%f0,	%f0
	sra	%g4,	0x13,	%i0
	stbar
	sllx	%i5,	0x05,	%i2
	sdivx	%l0,	0x06EA,	%g2
	addc	%g3,	0x09E2,	%o1
	movg	%xcc,	%o5,	%l4
	be,a,pn	%xcc,	loop_818
	fornot1s	%f27,	%f11,	%f26
	ld	[%l7 + 0x54],	%f19
	sllx	%o0,	0x1A,	%g7
loop_818:
	ldsh	[%l7 + 0x40],	%g1
	fmovrdlz	%l1,	%f14,	%f12
	sir	0x06BA
	sra	%g5,	%l6,	%o7
	taddcc	%i1,	0x142C,	%l3
	brz	%i6,	loop_819
	fmovdl	%xcc,	%f13,	%f15
	srax	%i3,	%i7,	%g6
	movrgez	%i4,	%l2,	%l5
loop_819:
	fzeros	%f19
	udiv	%o6,	0x1781,	%o4
	fmovsn	%xcc,	%f15,	%f1
	udivx	%o2,	0x05A6,	%o3
	std	%f20,	[%l7 + 0x30]
	fmovsa	%xcc,	%f15,	%f24
	edge8l	%g4,	%i5,	%i2
	tvc	%xcc,	0x4
	edge32n	%i0,	%g2,	%g3
	nop
	setx	loop_820,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%o1,	%o5
	ldsb	[%l7 + 0x14],	%l4
	fbge,a	%fcc2,	loop_821
loop_820:
	tvs	%xcc,	0x1
	xnor	%o0,	%g7,	%l0
	bvc,pt	%xcc,	loop_822
loop_821:
	nop
	fitos	%f7,	%f19
	fstox	%f19,	%f14
	fxtos	%f14,	%f30
	udiv	%g1,	0x050D,	%g5
	brgz,a	%l6,	loop_823
loop_822:
	edge8	%o7,	%i1,	%l1
	addccc	%i6,	%i3,	%i7
	addc	%g6,	%i4,	%l3
loop_823:
	addcc	%l5,	%o6,	%l2
	orncc	%o4,	0x0D21,	%o2
	fmovs	%f4,	%f7
	edge8ln	%o3,	%i5,	%g4
	set	0x0A, %i5
	lduha	[%l7 + %i5] 0x19,	%i0
	fabsd	%f30,	%f8
	edge32ln	%g2,	%g3,	%o1
	fornot2s	%f11,	%f26,	%f31
	movvc	%xcc,	%o5,	%i2
	stbar
	prefetch	[%l7 + 0x68],	 0x0
	xorcc	%o0,	%l4,	%g7
	tge	%icc,	0x6
	fpackfix	%f0,	%f17
	umulcc	%g1,	0x0A40,	%g5
	udivx	%l6,	0x06E5,	%o7
	umul	%l0,	%i1,	%i6
	fxnor	%f14,	%f2,	%f10
	ta	%xcc,	0x5
	sdivcc	%l1,	0x1FF0,	%i7
	fbu	%fcc3,	loop_824
	andn	%g6,	0x02EF,	%i3
	movre	%l3,	0x386,	%l5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i4
loop_824:
	fbule,a	%fcc0,	loop_825
	tcs	%xcc,	0x2
	or	%l2,	0x1EDE,	%o6
	movpos	%xcc,	%o4,	%o2
loop_825:
	tgu	%xcc,	0x5
	sdivcc	%i5,	0x1BED,	%o3
	movrlz	%g4,	%g2,	%g3
	udiv	%o1,	0x000B,	%o5
	movge	%xcc,	%i0,	%o0
	fnegs	%f29,	%f15
	set	0x10, %g2
	stha	%l4,	[%l7 + %g2] 0x2f
	membar	#Sync
	edge16l	%i2,	%g7,	%g1
	fmul8x16al	%f3,	%f1,	%f12
	mova	%icc,	%g5,	%o7
	fand	%f8,	%f20,	%f8
	sub	%l0,	0x0149,	%l6
	edge16l	%i6,	%i1,	%l1
	wr	%g0,	0x2a,	%asi
	stxa	%g6,	[%l7 + 0x40] %asi
	membar	#Sync
	orncc	%i7,	%i3,	%l3
	mulx	%i4,	0x10B1,	%l2
	bneg,a	loop_826
	addccc	%o6,	%l5,	%o2
	fbo,a	%fcc1,	loop_827
	popc	0x01AB,	%o4
loop_826:
	sth	%i5,	[%l7 + 0x1E]
	membar	0x2D
loop_827:
	nop
	set	0x36, %l2
	lduha	[%l7 + %l2] 0x80,	%o3
	swap	[%l7 + 0x4C],	%g2
	bpos	loop_828
	andcc	%g4,	%g3,	%o5
	movpos	%icc,	%i0,	%o0
	tneg	%xcc,	0x6
loop_828:
	movrgez	%l4,	%i2,	%g7
	subcc	%g1,	0x0608,	%g5
	tg	%icc,	0x7
	membar	0x28
	sth	%o1,	[%l7 + 0x76]
	edge16l	%l0,	%o7,	%l6
	fbne,a	%fcc0,	loop_829
	tvc	%xcc,	0x3
	fnor	%f26,	%f22,	%f18
	movrlz	%i6,	%i1,	%l1
loop_829:
	movn	%xcc,	%i7,	%i3
	ldd	[%l7 + 0x10],	%f4
	fxnor	%f30,	%f24,	%f24
	sethi	0x1E55,	%g6
	addc	%l3,	%l2,	%i4
	movne	%xcc,	%o6,	%l5
	sethi	0x0275,	%o4
	edge16n	%o2,	%i5,	%g2
	alignaddr	%o3,	%g3,	%o5
	edge8	%g4,	%i0,	%l4
	bgu	loop_830
	flush	%l7 + 0x74
	tn	%icc,	0x2
	lduh	[%l7 + 0x2E],	%i2
loop_830:
	fandnot2s	%f30,	%f28,	%f27
	fmovrse	%o0,	%f17,	%f12
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%g1
	movge	%xcc,	%g7,	%g5
	fcmpgt32	%f8,	%f20,	%l0
	tg	%xcc,	0x1
	sub	%o7,	%l6,	%o1
	xnorcc	%i6,	%i1,	%i7
	tsubcctv	%i3,	0x1527,	%g6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%l3
	prefetch	[%l7 + 0x18],	 0x3
	wr	%g0,	0x0c,	%asi
	stxa	%l1,	[%l7 + 0x18] %asi
	srax	%l2,	0x09,	%i4
	tsubcctv	%o6,	%o4,	%l5
	fcmpgt16	%f6,	%f16,	%i5
	movl	%icc,	%g2,	%o3
	xor	%g3,	%o5,	%o2
	movvc	%icc,	%g4,	%i0
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x14] %asi,	%i2
	tl	%xcc,	0x6
	udivcc	%o0,	0x1A72,	%g1
	and	%l4,	%g5,	%g7
	sra	%o7,	%l6,	%l0
	ld	[%l7 + 0x7C],	%f27
	brz	%i6,	loop_831
	tneg	%xcc,	0x3
	sllx	%o1,	0x1A,	%i1
	fbne	%fcc1,	loop_832
loop_831:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f13,	%f8
	xor	%i7,	0x0F6C,	%i3
loop_832:
	fmovdvs	%xcc,	%f26,	%f2
	tne	%xcc,	0x1
	movpos	%icc,	%l3,	%g6
	array32	%l1,	%i4,	%o6
	edge8l	%o4,	%l5,	%i5
	lduw	[%l7 + 0x70],	%l2
	movne	%icc,	%g2,	%g3
	tcs	%icc,	0x4
	andcc	%o5,	%o2,	%o3
	edge32ln	%g4,	%i0,	%i2
	edge32	%o0,	%g1,	%g5
	srl	%g7,	0x1C,	%l4
	fbo,a	%fcc0,	loop_833
	ldd	[%l7 + 0x58],	%o6
	fandnot2	%f12,	%f26,	%f14
	tpos	%icc,	0x6
loop_833:
	edge16ln	%l0,	%i6,	%l6
	tne	%icc,	0x5
	alignaddrl	%o1,	%i7,	%i1
	brlz	%i3,	loop_834
	fandnot1s	%f0,	%f20,	%f4
	fmovdne	%icc,	%f13,	%f29
	smul	%l3,	0x0E30,	%l1
loop_834:
	fmovspos	%icc,	%f31,	%f28
	sll	%i4,	%g6,	%o6
	ldsh	[%l7 + 0x60],	%o4
	nop
	setx	loop_835,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x19FF
	fxnor	%f22,	%f10,	%f16
	fmul8ulx16	%f0,	%f8,	%f8
loop_835:
	fxnor	%f26,	%f16,	%f20
	movcc	%icc,	%i5,	%l5
	std	%f26,	[%l7 + 0x50]
	fmovsne	%icc,	%f9,	%f28
	or	%l2,	0x1A3C,	%g3
	subc	%o5,	%o2,	%g2
	brz,a	%o3,	loop_836
	movrgz	%i0,	0x18B,	%i2
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
	bleu,a	loop_838
loop_836:
	fandnot2	%f30,	%f14,	%f8
	movrne	%o0,	%g1,	%g5
loop_837:
	ldd	[%l7 + 0x18],	%g4
loop_838:
	nop
	setx	0x00C7F6EE605D0AE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	array8	%l4,	%o7,	%l0
	tg	%xcc,	0x2
	ldd	[%l7 + 0x70],	%f24
	subccc	%g7,	%i6,	%o1
	movne	%icc,	%i7,	%l6
	movvc	%icc,	%i3,	%l3
	fbl	%fcc2,	loop_839
	fmovsa	%icc,	%f22,	%f21
	nop
	setx	0xE6036805C0509F98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	be,a,pn	%icc,	loop_840
loop_839:
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f8
	edge16	%i1,	%i4,	%l1
	bcc,pn	%icc,	loop_841
loop_840:
	ldsh	[%l7 + 0x58],	%o6
	edge16ln	%g6,	%i5,	%l5
	edge32n	%l2,	%g3,	%o4
loop_841:
	fmovrdgez	%o5,	%f20,	%f22
	movg	%xcc,	%o2,	%g2
	st	%f13,	[%l7 + 0x34]
	udivx	%i0,	0x0439,	%o3
	add	%o0,	0x0209,	%i2
	sll	%g5,	0x14,	%g1
	xnor	%l4,	%o7,	%g4
	movcc	%icc,	%l0,	%g7
	array16	%o1,	%i6,	%i7
	tcs	%icc,	0x5
	fpadd32	%f10,	%f28,	%f8
	fbo	%fcc0,	loop_842
	or	%l6,	%i3,	%l3
	sra	%i4,	0x19,	%i1
	sdivcc	%l1,	0x0DDC,	%g6
loop_842:
	movrgez	%i5,	0x024,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x4
	srax	%o4,	%o5,	%o2
	alignaddrl	%g2,	%i0,	%o3
	movrlez	%g3,	%o0,	%g5
	ba,a,pn	%icc,	loop_843
	andncc	%i2,	%l4,	%o7
	popc	%g4,	%g1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x65] %asi,	%l0
loop_843:
	mulscc	%o1,	%g7,	%i7
	xorcc	%l6,	0x0E0A,	%i6
	smulcc	%i3,	0x11ED,	%i4
	movrlz	%l3,	%i1,	%l1
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x58] %asi,	%i5
	fexpand	%f3,	%f30
	bleu,a,pn	%icc,	loop_844
	movrgez	%g6,	0x38E,	%o6
	edge8	%l5,	%l2,	%o4
	mulx	%o5,	%o2,	%i0
loop_844:
	taddcctv	%g2,	%o3,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pt	%icc,	loop_845
	tcs	%icc,	0x5
	sra	%g3,	0x06,	%g5
	fblg	%fcc3,	loop_846
loop_845:
	be,a,pn	%xcc,	loop_847
	fpack16	%f10,	%f30
	edge16l	%i2,	%o7,	%g4
loop_846:
	nop
	set	0x30, %g7
	lda	[%l7 + %g7] 0x81,	%f21
loop_847:
	ldub	[%l7 + 0x77],	%g1
	add	%l0,	%l4,	%o1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%g7
	brlez,a	%l6,	loop_848
	fexpand	%f24,	%f30
	fcmpeq32	%f4,	%f4,	%i7
	xnor	%i3,	%i6,	%l3
loop_848:
	edge32	%i4,	%i1,	%i5
	movg	%xcc,	%g6,	%o6
	fsrc2	%f28,	%f2
	fnot1	%f4,	%f8
	edge32n	%l1,	%l2,	%l5
	movvs	%xcc,	%o4,	%o5
	tge	%icc,	0x0
	mova	%xcc,	%i0,	%g2
	tne	%icc,	0x0
	ble,a,pn	%icc,	loop_849
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%o2
	mova	%xcc,	%o0,	%o3
	movne	%icc,	%g5,	%i2
loop_849:
	fxors	%f19,	%f26,	%f5
	mova	%icc,	%g3,	%o7
	fbuge	%fcc1,	loop_850
	movcs	%icc,	%g1,	%g4
	orn	%l0,	0x0267,	%o1
	srl	%g7,	%l6,	%l4
loop_850:
	andncc	%i3,	%i7,	%i6
	fble,a	%fcc0,	loop_851
	fba,a	%fcc3,	loop_852
	ldsb	[%l7 + 0x71],	%l3
	membar	0x5C
loop_851:
	tsubcctv	%i1,	%i4,	%i5
loop_852:
	array16	%o6,	%l1,	%l2
	srlx	%g6,	%o4,	%l5
	brgz,a	%i0,	loop_853
	alignaddrl	%g2,	%o5,	%o2
	bvs,a	loop_854
	mulscc	%o0,	0x060F,	%g5
loop_853:
	udiv	%o3,	0x1CA3,	%g3
	array16	%i2,	%o7,	%g1
loop_854:
	tsubcc	%g4,	0x0AB9,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l0,	0x0A66,	%g7
	set	0x68, %l6
	ldsha	[%l7 + %l6] 0x11,	%l6
	add	%l4,	%i3,	%i7
	movpos	%icc,	%i6,	%i1
	mulx	%i4,	0x1806,	%l3
	move	%icc,	%o6,	%l1
	sll	%i5,	%g6,	%l2
	movne	%icc,	%o4,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l5,	%o5,	%o2
	edge16ln	%o0,	%g2,	%o3
	alignaddr	%g3,	%i2,	%o7
	movl	%xcc,	%g5,	%g4
	orcc	%g1,	0x12C7,	%o1
	fmovscs	%icc,	%f24,	%f31
	flush	%l7 + 0x20
	tpos	%xcc,	0x6
	and	%l0,	%l6,	%g7
	fnands	%f13,	%f31,	%f1
	popc	0x14E5,	%l4
	movg	%xcc,	%i7,	%i6
	tne	%icc,	0x0
	sdivx	%i1,	0x1D70,	%i3
	wr	%g0,	0x19,	%asi
	stha	%l3,	[%l7 + 0x0C] %asi
	movrlez	%o6,	%l1,	%i5
	edge8ln	%g6,	%l2,	%o4
	nop
	setx	0x3D81507B355A10DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5DC52BF6CD54638B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f6,	%f2
	movgu	%xcc,	%i4,	%l5
	fbul	%fcc1,	loop_855
	edge16ln	%i0,	%o5,	%o2
	fmovrdne	%o0,	%f28,	%f20
	movgu	%xcc,	%g2,	%g3
loop_855:
	movrne	%o3,	0x2BD,	%o7
	tsubcctv	%i2,	%g5,	%g4
	nop
	fitos	%f5,	%f18
	fstoi	%f18,	%f15
	sdivx	%o1,	0x0480,	%l0
	mulscc	%g1,	0x15E6,	%g7
	fmovrdlz	%l6,	%f14,	%f10
	movgu	%icc,	%i7,	%i6
	fmovrslez	%l4,	%f10,	%f6
	edge16n	%i3,	%i1,	%l3
	ldsh	[%l7 + 0x26],	%l1
	movge	%icc,	%i5,	%g6
	movcc	%icc,	%o6,	%o4
	movgu	%icc,	%i4,	%l2
	fmovsne	%icc,	%f22,	%f12
	taddcctv	%i0,	%l5,	%o5
	fcmpgt16	%f4,	%f12,	%o0
	fmul8x16au	%f18,	%f1,	%f24
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x20] %asi,	%o2
	fornot1	%f24,	%f22,	%f30
	fcmpgt16	%f18,	%f18,	%g3
	sir	0x06C4
	orcc	%o3,	%g2,	%i2
	bpos,a	loop_856
	edge16ln	%o7,	%g5,	%g4
	sdivcc	%l0,	0x0412,	%o1
	movg	%xcc,	%g1,	%l6
loop_856:
	tsubcctv	%i7,	%i6,	%g7
	orn	%i3,	%l4,	%l3
	sra	%i1,	0x12,	%i5
	ldx	[%l7 + 0x10],	%l1
	swap	[%l7 + 0x38],	%g6
	tvc	%icc,	0x5
	ldsb	[%l7 + 0x5E],	%o6
	edge16n	%o4,	%l2,	%i0
	or	%l5,	%i4,	%o0
	nop
	setx	0x9CE72A6FA0599094,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	nop
	setx	0x49041666D04B3C05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	sth	%o2,	[%l7 + 0x68]
	fbne,a	%fcc1,	loop_857
	tne	%xcc,	0x7
	fbue,a	%fcc3,	loop_858
	umulcc	%g3,	%o3,	%g2
loop_857:
	fmovdl	%icc,	%f31,	%f29
	movrgez	%o5,	%i2,	%o7
loop_858:
	edge16n	%g4,	%l0,	%g5
	bge,a	loop_859
	movn	%xcc,	%o1,	%l6
	andncc	%g1,	%i7,	%g7
	movre	%i3,	0x229,	%i6
loop_859:
	movre	%l4,	0x08F,	%i1
	movvc	%xcc,	%i5,	%l1
	addccc	%g6,	0x143F,	%o6
	ba,a	%icc,	loop_860
	fcmpeq16	%f22,	%f28,	%l3
	andncc	%o4,	%l2,	%l5
	nop
	setx	loop_861,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_860:
	fmovsg	%xcc,	%f4,	%f23
	nop
	setx loop_862, %l0, %l1
	jmpl %l1, %i0
	lduh	[%l7 + 0x6A],	%o0
loop_861:
	movvc	%xcc,	%i4,	%g3
	edge16ln	%o3,	%o2,	%g2
loop_862:
	edge32n	%i2,	%o5,	%o7
	sllx	%l0,	0x18,	%g4
	fpadd16s	%f19,	%f19,	%f16
	tvs	%xcc,	0x5
	srax	%o1,	0x06,	%l6
	addcc	%g5,	0x026D,	%i7
	fble,a	%fcc2,	loop_863
	sub	%g7,	0x0F73,	%g1
	xorcc	%i6,	%l4,	%i3
	fbuge	%fcc1,	loop_864
loop_863:
	fpadd32s	%f3,	%f27,	%f30
	nop
	fitos	%f3,	%f24
	fstox	%f24,	%f18
	edge8	%i1,	%i5,	%g6
loop_864:
	edge8	%l1,	%l3,	%o4
	fxnors	%f22,	%f29,	%f23
	tle	%xcc,	0x7
	orcc	%o6,	%l5,	%l2
	brlez,a	%o0,	loop_865
	mulx	%i0,	%g3,	%o3
	nop
	setx	0x34A1458A70506F25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmul8x16al	%f19,	%f23,	%f20
loop_865:
	ldsb	[%l7 + 0x15],	%o2
	edge16	%g2,	%i2,	%o5
	fmovdleu	%xcc,	%f15,	%f21
	tcs	%icc,	0x5
	bne,a,pn	%xcc,	loop_866
	movne	%xcc,	%i4,	%o7
	brgez	%l0,	loop_867
	movrlz	%g4,	0x081,	%o1
loop_866:
	fmovrdgz	%l6,	%f6,	%f24
	edge32n	%i7,	%g5,	%g7
loop_867:
	ldd	[%l7 + 0x10],	%f10
	movl	%xcc,	%i6,	%l4
	movle	%xcc,	%g1,	%i3
	fmovdpos	%icc,	%f10,	%f20
	sethi	0x073D,	%i5
	popc	%i1,	%l1
	tvs	%icc,	0x1
	fbne	%fcc0,	loop_868
	fands	%f14,	%f30,	%f14
	fnor	%f12,	%f4,	%f4
	andn	%l3,	0x0498,	%g6
loop_868:
	nop
	setx	0xC14A54E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f26
	and	%o4,	%l5,	%l2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%o0
	tgu	%xcc,	0x5
	sdivx	%g3,	0x0ED8,	%i0
	xorcc	%o3,	0x0D87,	%g2
	srlx	%i2,	%o5,	%o2
	ba,a	loop_869
	movvs	%xcc,	%o7,	%l0
	tn	%icc,	0x3
	fblg	%fcc3,	loop_870
loop_869:
	bl,a,pn	%icc,	loop_871
	fmovda	%xcc,	%f26,	%f5
	fmul8x16	%f16,	%f2,	%f26
loop_870:
	fcmpeq16	%f12,	%f24,	%g4
loop_871:
	pdist	%f6,	%f8,	%f6
	movrlez	%o1,	%l6,	%i4
	sdivx	%g5,	0x11F4,	%g7
	bgu	%icc,	loop_872
	sethi	0x066A,	%i7
	nop
	setx	0x8FAFB496,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x3B56ADB1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f9,	%f2
	edge8l	%l4,	%i6,	%g1
loop_872:
	movn	%icc,	%i3,	%i5
	nop
	setx	0xF6FD41DC304D8686,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	andn	%l1,	0x05EE,	%i1
	fbl	%fcc0,	loop_873
	movgu	%icc,	%l3,	%g6
	movpos	%icc,	%o4,	%l5
	tge	%icc,	0x7
loop_873:
	umul	%l2,	0x0D24,	%o6
	tg	%icc,	0x6
	movrlez	%o0,	%i0,	%o3
	movrne	%g3,	0x3FD,	%g2
	andncc	%o5,	%o2,	%o7
	tge	%xcc,	0x7
	fcmpgt32	%f6,	%f16,	%i2
	fcmple32	%f4,	%f10,	%g4
	fmovsge	%xcc,	%f24,	%f14
	edge16l	%o1,	%l0,	%l6
	umul	%i4,	%g5,	%i7
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	andcc	%i6,	0x0BC4,	%g7
	fmovrslez	%g1,	%f5,	%f16
	movvc	%xcc,	%i3,	%l1
	movrgz	%i5,	%l3,	%g6
	orncc	%i1,	0x0830,	%o4
	sethi	0x1950,	%l2
	nop
	setx	0xB8418274,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xEA5D10CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f7,	%f26
	edge8ln	%o6,	%l5,	%i0
	ldsb	[%l7 + 0x51],	%o0
	bg	loop_874
	fzero	%f26
	sub	%g3,	%g2,	%o3
	movle	%xcc,	%o5,	%o7
loop_874:
	umulcc	%i2,	%g4,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f10,	%f16,	%f4
	te	%icc,	0x7
	movrne	%o2,	0x134,	%l6
	fors	%f14,	%f24,	%f20
	orcc	%l0,	0x0EA5,	%i4
	fbne,a	%fcc0,	loop_875
	tpos	%icc,	0x4
	movpos	%xcc,	%g5,	%l4
	movl	%xcc,	%i7,	%i6
loop_875:
	tl	%xcc,	0x5
	fbule	%fcc2,	loop_876
	fandnot2s	%f9,	%f16,	%f26
	nop
	setx	0x3F1B6E0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f7
	swap	[%l7 + 0x20],	%g1
loop_876:
	fones	%f7
	taddcc	%g7,	%l1,	%i5
	set	0x58, %o5
	ldsha	[%l7 + %o5] 0x11,	%i3
	fpadd16	%f12,	%f10,	%f26
	fmovdneg	%xcc,	%f29,	%f23
	ta	%xcc,	0x6
	udivx	%g6,	0x0EDC,	%l3
	edge8n	%i1,	%o4,	%o6
	tvs	%icc,	0x5
	andn	%l5,	%i0,	%o0
	tsubcctv	%l2,	0x04A4,	%g3
	ta	%icc,	0x2
	or	%g2,	0x157D,	%o5
	nop
	setx loop_877, %l0, %l1
	jmpl %l1, %o7
	fmovrdne	%o3,	%f0,	%f6
	edge32n	%g4,	%i2,	%o1
	fandnot1s	%f14,	%f17,	%f30
loop_877:
	bleu	%icc,	loop_878
	fandnot1s	%f4,	%f5,	%f29
	bgu,pn	%icc,	loop_879
	ldsw	[%l7 + 0x30],	%l6
loop_878:
	movgu	%icc,	%o2,	%l0
	bpos	%xcc,	loop_880
loop_879:
	stbar
	movrgz	%g5,	0x29B,	%l4
	movvc	%icc,	%i4,	%i7
loop_880:
	edge8l	%g1,	%i6,	%g7
	fcmpgt32	%f28,	%f16,	%l1
	alignaddr	%i5,	%i3,	%g6
	tleu	%icc,	0x6
	fsrc1	%f20,	%f0
	movrne	%i1,	%o4,	%l3
	fmovsge	%icc,	%f22,	%f0
	fornot2s	%f2,	%f19,	%f3
	addc	%l5,	%o6,	%i0
	fmovscs	%icc,	%f29,	%f8
	fcmpgt32	%f0,	%f4,	%l2
	xorcc	%o0,	0x0037,	%g3
	xor	%g2,	%o5,	%o7
	smulcc	%o3,	0x1B6C,	%i2
	taddcctv	%g4,	0x166F,	%o1
	taddcc	%o2,	%l0,	%g5
	fxor	%f12,	%f26,	%f24
	bcc	loop_881
	sethi	0x003B,	%l6
	smul	%i4,	0x107C,	%l4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g1
loop_881:
	ba	loop_882
	fmovsne	%xcc,	%f6,	%f18
	ble	%xcc,	loop_883
	orn	%i6,	%i7,	%l1
loop_882:
	movrgez	%i5,	%i3,	%g7
	movre	%g6,	%o4,	%i1
loop_883:
	bcc,a	%xcc,	loop_884
	prefetch	[%l7 + 0x08],	 0x1
	nop
	fitos	%f5,	%f0
	fstox	%f0,	%f30
	edge16	%l5,	%o6,	%i0
loop_884:
	movge	%icc,	%l2,	%o0
	edge32	%l3,	%g3,	%o5
	movrgz	%g2,	%o7,	%i2
	sra	%g4,	%o1,	%o2
	bn,a	loop_885
	edge16ln	%l0,	%o3,	%g5
	lduw	[%l7 + 0x40],	%i4
	fpadd32s	%f12,	%f3,	%f30
loop_885:
	fmovdleu	%icc,	%f18,	%f0
	smul	%l6,	%g1,	%i6
	movrgez	%l4,	0x20F,	%i7
	movneg	%icc,	%i5,	%l1
	swap	[%l7 + 0x18],	%i3
	fbe,a	%fcc2,	loop_886
	fone	%f2
	subcc	%g7,	%o4,	%g6
	xnor	%i1,	0x1061,	%o6
loop_886:
	movle	%xcc,	%l5,	%i0
	movle	%xcc,	%o0,	%l3
	xorcc	%g3,	%o5,	%l2
	fmovdle	%xcc,	%f20,	%f29
	fpsub32	%f18,	%f18,	%f24
	fand	%f6,	%f14,	%f4
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f24
	fxtod	%f24,	%f2
	edge8l	%g2,	%o7,	%g4
	brgz	%i2,	loop_887
	fbge	%fcc2,	loop_888
	stw	%o2,	[%l7 + 0x38]
	fmovrse	%o1,	%f11,	%f12
loop_887:
	and	%l0,	0x0CE2,	%g5
loop_888:
	movg	%xcc,	%o3,	%l6
	sir	0x07DF
	fble	%fcc0,	loop_889
	sdivcc	%g1,	0x163F,	%i4
	movrlez	%i6,	0x049,	%l4
	nop
	setx	0x2982E264CAF070C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f12
loop_889:
	movl	%icc,	%i5,	%l1
	fpadd32	%f0,	%f12,	%f26
	nop
	setx	0xEF772140,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x34C02FD4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f4,	%f4
	bcs,a	loop_890
	move	%icc,	%i3,	%i7
	movre	%o4,	%g6,	%g7
	tcs	%xcc,	0x0
loop_890:
	brnz	%o6,	loop_891
	sdivx	%i1,	0x025B,	%l5
	fpadd32s	%f31,	%f22,	%f7
	stb	%i0,	[%l7 + 0x39]
loop_891:
	array32	%l3,	%o0,	%g3
	movn	%xcc,	%l2,	%g2
	tgu	%icc,	0x2
	movcc	%icc,	%o5,	%o7
	movrlez	%g4,	%o2,	%o1
	sdiv	%l0,	0x0390,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l6
	fmovrde	%g1,	%f6,	%f12
	wr	%g0,	0x04,	%asi
	stha	%i4,	[%l7 + 0x46] %asi
	orncc	%i6,	0x05D5,	%i2
	edge16ln	%i5,	%l1,	%i3
	fbue	%fcc1,	loop_892
	fexpand	%f23,	%f26
	srax	%i7,	%l4,	%o4
	nop
	setx	0x056C3D73,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xD96313A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f14,	%f24
loop_892:
	edge32	%g7,	%o6,	%i1
	brgz	%g6,	loop_893
	movle	%xcc,	%i0,	%l5
	orncc	%o0,	%l3,	%l2
	ta	%xcc,	0x5
loop_893:
	nop
	setx loop_894, %l0, %l1
	jmpl %l1, %g3
	orcc	%o5,	0x1E5F,	%o7
	ldd	[%l7 + 0x40],	%f12
	brlz,a	%g4,	loop_895
loop_894:
	mulx	%g2,	0x164B,	%o1
	mulscc	%o2,	%l0,	%o3
	tleu	%xcc,	0x4
loop_895:
	movrgz	%g5,	0x2F4,	%g1
	sll	%l6,	0x12,	%i6
	movpos	%icc,	%i2,	%i4
	array8	%l1,	%i3,	%i7
	udivx	%i5,	0x167E,	%o4
	fnot1	%f14,	%f14
	fbu,a	%fcc0,	loop_896
	add	%l4,	0x128B,	%o6
	nop
	setx	0x01AC0DC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x79043980,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f22,	%f22
	fpsub16	%f10,	%f20,	%f2
loop_896:
	fpsub32	%f30,	%f16,	%f18
	tgu	%xcc,	0x1
	fsrc2s	%f2,	%f2
	sub	%g7,	%i1,	%i0
	movl	%xcc,	%l5,	%g6
	edge32ln	%l3,	%l2,	%g3
	edge8n	%o5,	%o0,	%g4
	fpadd32	%f12,	%f18,	%f18
	fsrc1	%f18,	%f30
	udivcc	%o7,	0x1B14,	%o1
	movpos	%xcc,	%g2,	%o2
	alignaddr	%l0,	%o3,	%g5
	udivx	%l6,	0x19D8,	%g1
	umulcc	%i6,	%i4,	%i2
	set	0x2E, %i3
	stha	%l1,	[%l7 + %i3] 0x0c
	subcc	%i3,	0x16C1,	%i5
	sub	%i7,	%o4,	%l4
	sth	%g7,	[%l7 + 0x0A]
	array8	%i1,	%o6,	%i0
	fmovsne	%icc,	%f6,	%f12
	movneg	%xcc,	%g6,	%l5
	alignaddr	%l3,	%g3,	%l2
	alignaddr	%o0,	%o5,	%o7
	andcc	%o1,	0x08C5,	%g4
	add	%g2,	%l0,	%o3
	set	0x68, %o1
	sta	%f6,	[%l7 + %o1] 0x19
	nop
	setx	0x706D6158,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fble,a	%fcc3,	loop_897
	edge32ln	%o2,	%l6,	%g5
	edge32	%g1,	%i4,	%i6
	udiv	%i2,	0x158C,	%i3
loop_897:
	array8	%l1,	%i5,	%i7
	fpack32	%f30,	%f0,	%f8
	fmovda	%xcc,	%f28,	%f6
	addc	%l4,	0x0677,	%o4
	fbule	%fcc0,	loop_898
	nop
	setx	loop_899,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%i1,	0x172B,	%g7
	sethi	0x161A,	%i0
loop_898:
	nop
	setx	loop_900,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_899:
	nop
	fitos	%f5,	%f22
	fstod	%f22,	%f18
	addccc	%g6,	0x0A59,	%l5
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l3
loop_900:
	bneg,pt	%xcc,	loop_901
	taddcctv	%g3,	0x0BDE,	%o6
	tg	%icc,	0x7
	fsrc1s	%f25,	%f28
loop_901:
	addccc	%o0,	%l2,	%o7
	movrlz	%o5,	%o1,	%g2
	tge	%icc,	0x5
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x26,	%g4
	edge8n	%o3,	%o2,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x18,	%f16
	movrgez	%l0,	%g5,	%i4
	faligndata	%f10,	%f30,	%f12
	fmovrdgez	%i6,	%f20,	%f10
	subcc	%i2,	%i3,	%g1
	tsubcctv	%l1,	%i7,	%l4
	addc	%o4,	%i1,	%g7
	addccc	%i5,	%i0,	%l5
	edge32l	%l3,	%g6,	%g3
	movne	%xcc,	%o0,	%o6
	sethi	0x0447,	%l2
	fnors	%f5,	%f31,	%f27
	orncc	%o5,	%o1,	%g2
	movne	%icc,	%o7,	%g4
	sllx	%o3,	0x09,	%l6
	array32	%l0,	%o2,	%i4
	subc	%g5,	%i2,	%i6
	fbuge,a	%fcc1,	loop_902
	sllx	%g1,	%l1,	%i3
	fmuld8ulx16	%f28,	%f21,	%f18
	nop
	setx	0x674B0D05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xFCBDA456,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f19,	%f29
loop_902:
	orncc	%i7,	%l4,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f2,	%f12
	fmovdgu	%icc,	%f30,	%f20
	subccc	%g7,	%i5,	%o4
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	st	%f18,	[%l7 + 0x48]
	movre	%l5,	%i0,	%l3
	fornot2	%f0,	%f8,	%f22
	fabss	%f23,	%f24
	sir	0x0EB4
	wr	%g0,	0x2a,	%asi
	stxa	%g6,	[%l7 + 0x40] %asi
	membar	#Sync
	movpos	%icc,	%o0,	%o6
	xnor	%g3,	0x1C58,	%o5
	tsubcctv	%l2,	%o1,	%o7
	fmovsvc	%xcc,	%f23,	%f22
	fbug	%fcc1,	loop_903
	alignaddrl	%g2,	%o3,	%l6
	sdivcc	%g4,	0x0D25,	%l0
	movrlz	%o2,	%i4,	%g5
loop_903:
	movrlez	%i2,	%i6,	%l1
	edge32ln	%g1,	%i7,	%l4
	xnorcc	%i3,	0x0A77,	%g7
	fmovsleu	%icc,	%f4,	%f20
	xor	%i1,	0x1E70,	%i5
	tleu	%xcc,	0x1
	fmovrdgez	%l5,	%f30,	%f16
	array16	%o4,	%l3,	%i0
	udivx	%o0,	0x1698,	%g6
	andncc	%g3,	%o6,	%l2
	xorcc	%o1,	%o7,	%g2
	fmovde	%icc,	%f6,	%f15
	movne	%icc,	%o5,	%l6
	fbo	%fcc3,	loop_904
	fandnot1s	%f23,	%f10,	%f9
	edge8n	%g4,	%l0,	%o2
	fbge	%fcc1,	loop_905
loop_904:
	tl	%xcc,	0x3
	bcs,a	%xcc,	loop_906
	movrlz	%i4,	%g5,	%i2
loop_905:
	fmovsneg	%icc,	%f23,	%f13
	sll	%i6,	0x06,	%o3
loop_906:
	fmuld8sux16	%f31,	%f0,	%f14
	edge32n	%l1,	%g1,	%l4
	movle	%xcc,	%i3,	%i7
	fbule,a	%fcc3,	loop_907
	movne	%xcc,	%i1,	%i5
	stbar
	tvs	%icc,	0x5
loop_907:
	subcc	%l5,	0x1987,	%o4
	fmovd	%f18,	%f8
	fmovscs	%xcc,	%f19,	%f11
	edge32n	%g7,	%l3,	%i0
	fmovscc	%xcc,	%f7,	%f6
	smul	%g6,	0x087E,	%o0
	or	%o6,	0x10E6,	%g3
	nop
	setx	0x63C8ADBE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x78498B4C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f31,	%f4
	fbug	%fcc2,	loop_908
	tn	%icc,	0x6
	bn	%xcc,	loop_909
	umulcc	%l2,	%o1,	%o7
loop_908:
	movrlz	%g2,	%l6,	%g4
	fmovdn	%icc,	%f18,	%f27
loop_909:
	movrlez	%l0,	0x326,	%o2
	tl	%xcc,	0x5
	movrlez	%i4,	%g5,	%i2
	or	%i6,	0x0ECD,	%o5
	udivx	%l1,	0x16F2,	%g1
	fsrc1	%f18,	%f28
	movg	%icc,	%l4,	%i3
	mova	%xcc,	%o3,	%i1
	movn	%icc,	%i7,	%i5
	srl	%l5,	0x1E,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l3,	%g7
	fpack16	%f0,	%f4
	umul	%i0,	0x0091,	%o0
	movcs	%xcc,	%o6,	%g3
	set	0x68, %o4
	stwa	%l2,	[%l7 + %o4] 0x22
	membar	#Sync
	smulcc	%g6,	0x09DA,	%o7
	sir	0x0396
	addc	%o1,	%g2,	%g4
	mulscc	%l0,	%l6,	%i4
	edge16l	%g5,	%o2,	%i6
	edge16n	%o5,	%l1,	%g1
	fcmple16	%f14,	%f26,	%i2
	orn	%l4,	0x1A3C,	%i3
	movrgz	%o3,	%i7,	%i5
	fmovdne	%icc,	%f29,	%f15
	set	0x38, %i2
	stwa	%l5,	[%l7 + %i2] 0x10
	lduw	[%l7 + 0x60],	%i1
	sra	%l3,	%o4,	%i0
	andcc	%g7,	%o0,	%o6
	xnor	%g3,	0x18F4,	%g6
	edge16ln	%l2,	%o1,	%g2
	movgu	%icc,	%g4,	%l0
	sdiv	%l6,	0x1FAC,	%i4
	srax	%g5,	%o7,	%i6
	fornot1	%f6,	%f24,	%f16
	edge16ln	%o5,	%o2,	%g1
	move	%xcc,	%l1,	%l4
	alignaddr	%i3,	%o3,	%i7
	movg	%xcc,	%i5,	%l5
	edge32ln	%i2,	%i1,	%l3
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f24
	fmovrslez	%o4,	%f14,	%f22
	movrne	%i0,	0x31B,	%o0
	srlx	%o6,	0x12,	%g7
	fsrc2s	%f22,	%f21
	swap	[%l7 + 0x6C],	%g6
	nop
	setx	loop_910,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%g3,	%l2,	%g2
	brlz,a	%o1,	loop_911
	for	%f8,	%f6,	%f18
loop_910:
	nop
	set	0x40, %l5
	std	%f26,	[%l7 + %l5]
	ldsb	[%l7 + 0x6B],	%l0
loop_911:
	edge8ln	%l6,	%g4,	%g5
	edge16l	%o7,	%i6,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o2,	%g1,	%i4
	umul	%l4,	%i3,	%o3
	st	%f23,	[%l7 + 0x20]
	fpack16	%f4,	%f17
	xorcc	%l1,	%i7,	%l5
	edge32n	%i5,	%i1,	%i2
	bl,pt	%xcc,	loop_912
	tvc	%icc,	0x7
	tpos	%xcc,	0x2
	stw	%o4,	[%l7 + 0x7C]
loop_912:
	movrlz	%l3,	%i0,	%o6
	taddcc	%o0,	%g6,	%g3
	fandnot1s	%f9,	%f4,	%f8
	movl	%icc,	%g7,	%g2
	movgu	%xcc,	%o1,	%l2
	nop
	fitos	%f1,	%f23
	fstox	%f23,	%f30
	fxtos	%f30,	%f27
	fcmpgt32	%f4,	%f6,	%l0
	xnor	%l6,	%g4,	%o7
	fnegd	%f26,	%f12
	ble,a,pn	%xcc,	loop_913
	edge8n	%i6,	%o5,	%o2
	fnot2	%f10,	%f24
	bcs,pt	%xcc,	loop_914
loop_913:
	movrne	%g1,	%g5,	%i4
	fpsub32s	%f2,	%f2,	%f22
	smulcc	%i3,	%o3,	%l4
loop_914:
	umulcc	%l1,	%i7,	%i5
	edge8ln	%i1,	%l5,	%o4
	nop
	setx	loop_915,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8sux16	%f24,	%f30,	%f2
	fones	%f16
	xnor	%l3,	0x0615,	%i0
loop_915:
	movrgz	%i2,	0x187,	%o6
	fmovrslez	%o0,	%f11,	%f5
	umul	%g6,	0x1A31,	%g7
	movne	%icc,	%g2,	%o1
	fcmpgt32	%f28,	%f0,	%l2
	fnegs	%f3,	%f17
	fble,a	%fcc2,	loop_916
	orn	%l0,	0x05FC,	%l6
	xorcc	%g3,	0x0B18,	%g4
	movrlz	%i6,	0x3C4,	%o7
loop_916:
	smulcc	%o5,	%o2,	%g1
	array32	%i4,	%i3,	%g5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f16
	nop
	setx	0xA04C413B,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fabss	%f9,	%f23
	fbul,a	%fcc0,	loop_917
	tneg	%xcc,	0x1
	nop
	setx	loop_918,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%l4,	0x391,	%l1
loop_917:
	mova	%icc,	%o3,	%i5
	umul	%i1,	0x002A,	%l5
loop_918:
	tg	%icc,	0x2
	tge	%xcc,	0x4
	bpos	%xcc,	loop_919
	fble	%fcc2,	loop_920
	fmovscs	%icc,	%f22,	%f25
	movle	%icc,	%o4,	%i7
loop_919:
	fmovdneg	%xcc,	%f28,	%f16
loop_920:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l3
	lduh	[%l7 + 0x62],	%i0
	brlz,a	%o6,	loop_921
	movvc	%xcc,	%i2,	%g6
	fble,a	%fcc0,	loop_922
	bpos,a	%icc,	loop_923
loop_921:
	fbg,a	%fcc3,	loop_924
	edge32l	%g7,	%o0,	%o1
loop_922:
	alignaddrl	%g2,	%l0,	%l2
loop_923:
	alignaddr	%g3,	%g4,	%i6
loop_924:
	andcc	%o7,	0x0C03,	%l6
	fmovrsgez	%o5,	%f27,	%f20
	edge16n	%o2,	%g1,	%i3
	andn	%i4,	0x077B,	%l4
	alignaddr	%g5,	%o3,	%i5
	fxnor	%f20,	%f12,	%f4
	brlz	%l1,	loop_925
	fxnor	%f16,	%f22,	%f24
	fnot1	%f2,	%f12
	bcs,a	%icc,	loop_926
loop_925:
	sdivx	%i1,	0x1B53,	%l5
	movcs	%icc,	%i7,	%l3
	fmovdg	%icc,	%f13,	%f20
loop_926:
	movleu	%xcc,	%o4,	%o6
	sub	%i2,	0x147A,	%g6
	fmovsl	%xcc,	%f13,	%f12
	stx	%i0,	[%l7 + 0x38]
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x36] %asi,	%g7
	umul	%o0,	0x1417,	%g2
	xorcc	%o1,	0x0F8A,	%l2
	nop
	setx	0x695E2890,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f3
	tge	%xcc,	0x0
	ba	loop_927
	umul	%g3,	0x0A7E,	%l0
	bcs,pt	%xcc,	loop_928
	edge8l	%g4,	%i6,	%l6
loop_927:
	fabss	%f4,	%f24
	nop
	setx	0x51F3CF0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x879FC613,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f7,	%f3
loop_928:
	fmovsn	%xcc,	%f31,	%f12
	wr	%g0,	0x88,	%asi
	stwa	%o7,	[%l7 + 0x0C] %asi
	tne	%icc,	0x5
	te	%xcc,	0x5
	movneg	%icc,	%o5,	%o2
	lduh	[%l7 + 0x40],	%i3
	fmovdl	%xcc,	%f20,	%f0
	mulx	%i4,	%l4,	%g1
	edge16n	%g5,	%i5,	%l1
	edge32ln	%i1,	%o3,	%l5
	xnorcc	%l3,	0x0E54,	%i7
	fblg	%fcc2,	loop_929
	array8	%o4,	%i2,	%o6
	movge	%icc,	%g6,	%g7
	nop
	fitos	%f4,	%f23
	fstod	%f23,	%f22
loop_929:
	ldd	[%l7 + 0x58],	%o0
	movn	%icc,	%i0,	%o1
	addccc	%g2,	%g3,	%l2
	movcc	%xcc,	%g4,	%l0
	bvs,a,pn	%icc,	loop_930
	andcc	%i6,	%o7,	%l6
	edge16	%o5,	%i3,	%o2
	movcc	%xcc,	%l4,	%g1
loop_930:
	tle	%icc,	0x0
	fmovsvc	%xcc,	%f8,	%f2
	edge8ln	%g5,	%i5,	%i4
	taddcctv	%l1,	%o3,	%l5
	fors	%f20,	%f7,	%f4
	fxor	%f8,	%f12,	%f0
	tgu	%xcc,	0x0
	sra	%i1,	0x03,	%i7
	movre	%o4,	0x0AF,	%l3
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x18,	%i2
	fmovdvs	%icc,	%f8,	%f6
	orncc	%g6,	%o6,	%o0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2C] %asi,	%g7
	mova	%icc,	%i0,	%o1
	bne,a	loop_931
	pdist	%f8,	%f18,	%f28
	edge16	%g2,	%l2,	%g3
	nop
	setx	0xE07004BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
loop_931:
	add	%l0,	%g4,	%i6
	fmovsneg	%xcc,	%f22,	%f21
	fornot1	%f10,	%f10,	%f16
	edge32n	%l6,	%o7,	%i3
	fba,a	%fcc1,	loop_932
	bneg,a,pn	%xcc,	loop_933
	sra	%o5,	0x06,	%l4
	sub	%g1,	%o2,	%g5
loop_932:
	nop
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f16
loop_933:
	add	%i5,	%l1,	%i4
	fmovrsgez	%l5,	%f5,	%f13
	xnorcc	%o3,	0x0A39,	%i7
	fmovrdgz	%o4,	%f20,	%f28
	fnot1s	%f15,	%f14
	tsubcc	%l3,	%i1,	%g6
	movvc	%icc,	%o6,	%i2
	edge16n	%g7,	%i0,	%o0
	std	%f22,	[%l7 + 0x70]
	orn	%g2,	%l2,	%g3
	movne	%xcc,	%l0,	%o1
	fmovsvc	%icc,	%f9,	%f30
	edge8n	%g4,	%i6,	%o7
	bl,a	%xcc,	loop_934
	mova	%icc,	%i3,	%o5
	taddcctv	%l6,	%l4,	%o2
	fsrc1s	%f21,	%f25
loop_934:
	array8	%g5,	%i5,	%l1
	ta	%icc,	0x6
	movl	%icc,	%i4,	%l5
	orncc	%g1,	0x0438,	%o3
	alignaddrl	%o4,	%l3,	%i7
	lduw	[%l7 + 0x5C],	%i1
	movrlz	%g6,	%o6,	%g7
	srlx	%i2,	0x0B,	%i0
	sllx	%o0,	0x1F,	%l2
	for	%f30,	%f22,	%f24
	addc	%g2,	%g3,	%o1
	tge	%xcc,	0x4
	alignaddrl	%l0,	%g4,	%o7
	sdivcc	%i6,	0x1ACC,	%o5
	movrne	%i3,	0x105,	%l6
	set	0x6C, %o2
	sta	%f29,	[%l7 + %o2] 0x80
	bgu,a,pn	%icc,	loop_935
	addccc	%o2,	%l4,	%g5
	edge16	%i5,	%l1,	%i4
	te	%icc,	0x5
loop_935:
	fpack16	%f14,	%f12
	add	%l5,	0x07B6,	%g1
	tleu	%xcc,	0x0
	addccc	%o3,	0x05B8,	%o4
	taddcc	%l3,	0x0206,	%i7
	fmovsa	%icc,	%f19,	%f27
	addcc	%i1,	0x1499,	%o6
	fmul8x16al	%f26,	%f19,	%f20
	ldsb	[%l7 + 0x1C],	%g7
	te	%icc,	0x5
	lduw	[%l7 + 0x1C],	%g6
	subccc	%i2,	%i0,	%o0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x14] %asi,	%g2
	flush	%l7 + 0x60
	movrgz	%g3,	0x2FD,	%o1
	tpos	%xcc,	0x3
	movcs	%xcc,	%l0,	%l2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%g4
	fmovsvs	%icc,	%f13,	%f5
	ldx	[%l7 + 0x18],	%o7
	ta	%xcc,	0x3
	tsubcctv	%i6,	0x1683,	%i3
	sllx	%o5,	%o2,	%l4
	fbn	%fcc3,	loop_936
	alignaddrl	%l6,	%g5,	%i5
	stx	%l1,	[%l7 + 0x10]
	subc	%i4,	0x0D53,	%l5
loop_936:
	brlez	%o3,	loop_937
	edge32ln	%o4,	%l3,	%g1
	sllx	%i7,	0x04,	%o6
	array32	%g7,	%i1,	%i2
loop_937:
	tsubcctv	%i0,	%o0,	%g2
	fba	%fcc2,	loop_938
	fmuld8sux16	%f7,	%f13,	%f14
	fbul	%fcc0,	loop_939
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_938:
	fmovdgu	%xcc,	%f15,	%f23
	st	%f19,	[%l7 + 0x4C]
loop_939:
	mova	%xcc,	%g6,	%g3
	wr	%g0,	0x27,	%asi
	stxa	%o1,	[%l7 + 0x60] %asi
	membar	#Sync
	flush	%l7 + 0x38
	movgu	%xcc,	%l2,	%l0
	tsubcc	%g4,	%o7,	%i6
	tvc	%icc,	0x1
	bl,pt	%xcc,	loop_940
	umul	%i3,	%o2,	%l4
	fsrc2	%f20,	%f16
	xnorcc	%l6,	0x1B40,	%g5
loop_940:
	edge16n	%o5,	%i5,	%i4
	ldsw	[%l7 + 0x44],	%l1
	fpsub32s	%f14,	%f7,	%f25
	movle	%icc,	%o3,	%l5
	subccc	%l3,	0x1591,	%o4
	nop
	setx	0x5B36C8041052E1F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	nop
	setx	0x494AAA46A0585C40,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fornot2	%f6,	%f14,	%f14
	tle	%icc,	0x5
	fbug	%fcc0,	loop_941
	fcmpne32	%f24,	%f6,	%g1
	srlx	%o6,	0x16,	%g7
	subccc	%i7,	0x05F5,	%i2
loop_941:
	fbg,a	%fcc2,	loop_942
	fmovrsne	%i0,	%f14,	%f20
	movn	%xcc,	%i1,	%g2
	sdiv	%o0,	0x0778,	%g6
loop_942:
	fmovse	%xcc,	%f21,	%f18
	subccc	%g3,	0x078E,	%o1
	edge8	%l0,	%l2,	%g4
	movleu	%icc,	%o7,	%i3
	movge	%icc,	%o2,	%l4
	bgu,pn	%xcc,	loop_943
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,pn	%xcc,	loop_944
	movcs	%xcc,	%i6,	%l6
loop_943:
	tneg	%xcc,	0x6
	edge16n	%o5,	%g5,	%i5
loop_944:
	fand	%f26,	%f0,	%f26
	tgu	%icc,	0x0
	movg	%icc,	%l1,	%o3
	fnot1	%f20,	%f10
	movcs	%icc,	%l5,	%l3
	movl	%icc,	%i4,	%g1
	tcs	%xcc,	0x4
	te	%xcc,	0x7
	tsubcc	%o4,	0x1D18,	%g7
	fandnot2	%f26,	%f28,	%f6
	fpsub32	%f6,	%f18,	%f6
	movrgez	%i7,	0x2C7,	%i2
	bneg,a	loop_945
	edge8	%o6,	%i1,	%i0
	fmovdcs	%icc,	%f6,	%f2
	xor	%g2,	0x0087,	%o0
loop_945:
	xnor	%g6,	%o1,	%g3
	orcc	%l0,	0x13B3,	%g4
	fbl,a	%fcc0,	loop_946
	array32	%l2,	%i3,	%o7
	movl	%icc,	%o2,	%l4
	lduw	[%l7 + 0x1C],	%l6
loop_946:
	subccc	%o5,	%g5,	%i6
	subc	%l1,	%i5,	%o3
	tleu	%xcc,	0x2
	subcc	%l3,	0x00EC,	%i4
	tvs	%icc,	0x7
	flush	%l7 + 0x68
	ldd	[%l7 + 0x48],	%f12
	addc	%l5,	0x000F,	%g1
	fmovdge	%xcc,	%f26,	%f11
	smulcc	%o4,	0x078F,	%g7
	tge	%xcc,	0x2
	tcc	%icc,	0x0
	fpsub32s	%f17,	%f17,	%f24
	stw	%i2,	[%l7 + 0x7C]
	fmovse	%xcc,	%f28,	%f29
	movrlez	%i7,	0x3DB,	%o6
	fmovsne	%icc,	%f12,	%f18
	xor	%i1,	%g2,	%i0
	fxor	%f4,	%f8,	%f8
	movcc	%icc,	%g6,	%o0
	ldsb	[%l7 + 0x51],	%o1
	nop
	fitod	%f23,	%f4
	fbn	%fcc0,	loop_947
	movrgez	%l0,	0x3FC,	%g3
	tn	%xcc,	0x5
	membar	0x3F
loop_947:
	fmovscs	%icc,	%f28,	%f14
	fornot1	%f30,	%f6,	%f4
	fble,a	%fcc1,	loop_948
	fblg	%fcc1,	loop_949
	udivx	%g4,	0x1BF0,	%i3
	sllx	%o7,	0x00,	%l2
loop_948:
	sub	%o2,	0x1814,	%l6
loop_949:
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
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o5
	stb	%g5,	[%l7 + 0x19]
	ldsb	[%l7 + 0x7F],	%i6
	edge16ln	%l1,	%l4,	%o3
	edge32	%i5,	%l3,	%i4
	movneg	%xcc,	%g1,	%l5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x18] %asi,	%f28
	edge16ln	%g7,	%i2,	%o4
	srl	%i7,	0x1D,	%i1
	nop
	setx	loop_950,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stx	%g2,	[%l7 + 0x58]
	fnegd	%f22,	%f8
	orcc	%o6,	%i0,	%g6
loop_950:
	fmovrslz	%o1,	%f25,	%f10
	movge	%icc,	%l0,	%g3
	fnot1s	%f4,	%f2
	nop
	setx	loop_951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsneg	%icc,	%f8,	%f31
	addcc	%o0,	0x0787,	%i3
	move	%xcc,	%o7,	%l2
loop_951:
	andn	%o2,	0x149A,	%g4
	udiv	%l6,	0x008B,	%o5
	addc	%g5,	0x0793,	%i6
	sllx	%l1,	0x14,	%l4
	smulcc	%i5,	0x0F98,	%o3
	bl,a	loop_952
	fmul8sux16	%f20,	%f6,	%f0
	tleu	%icc,	0x7
	movre	%l3,	0x03E,	%g1
loop_952:
	xor	%i4,	%l5,	%i2
	sdivcc	%g7,	0x1408,	%o4
	sdivcc	%i1,	0x07C0,	%i7
	srlx	%g2,	%i0,	%g6
	fbg	%fcc2,	loop_953
	move	%icc,	%o1,	%o6
	movneg	%icc,	%g3,	%o0
	tn	%xcc,	0x4
loop_953:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x0
	sdivcc	%i3,	0x1D54,	%o7
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l2
	array8	%l0,	%o2,	%g4
	movneg	%icc,	%o5,	%l6
	for	%f10,	%f4,	%f14
	prefetch	[%l7 + 0x44],	 0x2
	mulscc	%i6,	%l1,	%l4
	edge32ln	%i5,	%g5,	%o3
	taddcctv	%l3,	%i4,	%g1
	fbu	%fcc3,	loop_954
	fpadd32	%f30,	%f6,	%f4
	addccc	%l5,	%g7,	%i2
	movge	%xcc,	%i1,	%i7
loop_954:
	edge32n	%o4,	%i0,	%g2
	fblg,a	%fcc0,	loop_955
	tg	%icc,	0x0
	edge8ln	%g6,	%o1,	%g3
	tsubcctv	%o0,	0x12A0,	%o6
loop_955:
	movrlz	%o7,	%l2,	%i3
	movrgez	%o2,	%l0,	%o5
	array8	%l6,	%g4,	%l1
	fbe	%fcc0,	loop_956
	sir	0x1A4D
	edge16	%l4,	%i5,	%g5
	mulx	%o3,	%i6,	%l3
loop_956:
	bneg,pn	%xcc,	loop_957
	edge16n	%i4,	%l5,	%g1
	alignaddr	%i2,	%g7,	%i1
	membar	0x0C
loop_957:
	sethi	0x011D,	%o4
	movvs	%xcc,	%i0,	%i7
	tsubcc	%g2,	0x0FBE,	%o1
	udiv	%g3,	0x0D03,	%g6
	taddcctv	%o0,	%o7,	%l2
	fbul,a	%fcc0,	loop_958
	te	%xcc,	0x1
	movrne	%i3,	0x0AB,	%o2
	srl	%o6,	%l0,	%l6
loop_958:
	fbo,a	%fcc3,	loop_959
	movg	%xcc,	%o5,	%l1
	movneg	%xcc,	%g4,	%l4
	fcmpeq32	%f4,	%f8,	%g5
loop_959:
	movrgz	%o3,	0x2C3,	%i6
	bgu,pt	%xcc,	loop_960
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i5,	%i4,	%l5
	tleu	%xcc,	0x1
loop_960:
	fpadd32	%f28,	%f20,	%f26
	ldub	[%l7 + 0x41],	%g1
	ldstub	[%l7 + 0x27],	%l3
	bge,a	%xcc,	loop_961
	movn	%icc,	%i2,	%g7
	fmovsvs	%xcc,	%f31,	%f26
	fnands	%f23,	%f19,	%f1
loop_961:
	xnorcc	%i1,	0x0538,	%i0
	fmovdvc	%xcc,	%f14,	%f16
	umul	%o4,	%g2,	%o1
	fands	%f0,	%f1,	%f30
	popc	%g3,	%i7
	movrgz	%o0,	0x25F,	%o7
	movcc	%xcc,	%g6,	%i3
	edge16ln	%l2,	%o6,	%o2
	fmovsne	%xcc,	%f28,	%f5
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx loop_962, %l0, %l1
	jmpl %l1, %l0
	brlz,a	%l6,	loop_963
	ldd	[%l7 + 0x28],	%f22
	nop
	fitos	%f0,	%f29
	fstox	%f29,	%f2
loop_962:
	for	%f18,	%f8,	%f28
loop_963:
	tvc	%xcc,	0x1
	fmovrsgez	%l1,	%f20,	%f25
	fbne	%fcc0,	loop_964
	nop
	fitod	%f29,	%f30
	prefetch	[%l7 + 0x18],	 0x1
	mulscc	%g4,	0x0CC8,	%o5
loop_964:
	tl	%xcc,	0x5
	movcc	%xcc,	%g5,	%l4
	fxors	%f27,	%f0,	%f15
	sub	%i6,	%o3,	%i5
	smul	%i4,	%g1,	%l3
	fpsub32	%f10,	%f16,	%f16
	xnorcc	%i2,	0x1DED,	%l5
	set	0x5C, %g3
	lduwa	[%l7 + %g3] 0x14,	%g7
	nop
	setx	loop_965,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8ulx16	%f4,	%f8,	%f4
	edge16l	%i0,	%i1,	%g2
	array32	%o4,	%g3,	%i7
loop_965:
	movrgz	%o1,	0x1A6,	%o7
	call	loop_966
	fmovsneg	%xcc,	%f31,	%f1
	tcc	%xcc,	0x1
	movre	%o0,	%g6,	%i3
loop_966:
	tle	%icc,	0x0
	fmovdcs	%xcc,	%f4,	%f11
	alignaddrl	%o6,	%l2,	%l0
	sethi	0x0960,	%l6
	udiv	%o2,	0x1907,	%g4
	subc	%o5,	0x00E6,	%l1
	ba,a,pt	%xcc,	loop_967
	tl	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%l4
loop_967:
	udivcc	%g5,	0x1359,	%i6
	edge32ln	%i5,	%o3,	%i4
	tle	%xcc,	0x4
	ta	%icc,	0x0
	lduw	[%l7 + 0x4C],	%l3
	and	%g1,	%i2,	%g7
	tne	%icc,	0x5
	orncc	%l5,	0x062E,	%i0
	movrgez	%g2,	0x3F6,	%i1
	xorcc	%o4,	%i7,	%o1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x1C] %asi,	%f16
	edge32ln	%o7,	%g3,	%g6
	tcc	%icc,	0x7
	fcmpne32	%f24,	%f8,	%o0
	edge32l	%i3,	%o6,	%l2
	movle	%xcc,	%l6,	%o2
	movrgz	%g4,	%l0,	%o5
	brlz,a	%l1,	loop_968
	fpsub32	%f2,	%f4,	%f16
	set	0x19, %l0
	ldsba	[%l7 + %l0] 0x81,	%g5
loop_968:
	stx	%i6,	[%l7 + 0x08]
	fxor	%f22,	%f26,	%f18
	edge16l	%i5,	%l4,	%i4
	ldx	[%l7 + 0x10],	%l3
	edge32	%g1,	%o3,	%i2
	edge16ln	%l5,	%i0,	%g2
	fmovdg	%xcc,	%f5,	%f21
	flush	%l7 + 0x6C
	brz	%i1,	loop_969
	subc	%g7,	0x12A9,	%o4
	subcc	%o1,	%i7,	%g3
	movcc	%icc,	%g6,	%o0
loop_969:
	nop
	fitos	%f11,	%f21
	fstox	%f21,	%f26
	fxtos	%f26,	%f8
	srl	%o7,	%i3,	%o6
	movle	%icc,	%l2,	%o2
	nop
	setx loop_970, %l0, %l1
	jmpl %l1, %l6
	srl	%g4,	0x09,	%l0
	edge32n	%o5,	%l1,	%g5
	movrgz	%i5,	%i6,	%i4
loop_970:
	fmovsvc	%xcc,	%f9,	%f12
	fandnot2s	%f28,	%f24,	%f31
	fmovsle	%icc,	%f3,	%f31
	srax	%l3,	%g1,	%l4
	fbe	%fcc1,	loop_971
	addcc	%i2,	0x14D2,	%o3
	popc	%l5,	%g2
	fornot2s	%f30,	%f31,	%f13
loop_971:
	tge	%icc,	0x1
	udivcc	%i0,	0x0443,	%i1
	sir	0x00C8
	set	0x50, %i1
	swapa	[%l7 + %i1] 0x81,	%g7
	subc	%o4,	0x1293,	%i7
	set	0x1C, %g4
	lduwa	[%l7 + %g4] 0x15,	%o1
	bshuffle	%f26,	%f12,	%f16
	sethi	0x04DE,	%g6
	bneg,pt	%xcc,	loop_972
	tcc	%xcc,	0x6
	sub	%o0,	%o7,	%g3
	taddcc	%o6,	0x0E0D,	%i3
loop_972:
	fmovrdgz	%o2,	%f2,	%f12
	fpsub32s	%f27,	%f31,	%f30
	fbu,a	%fcc1,	loop_973
	udivx	%l6,	0x1295,	%l2
	and	%l0,	0x1746,	%g4
	fands	%f11,	%f0,	%f5
loop_973:
	nop
	setx	0x7C8B2A01,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA2D04E40,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f3,	%f0
	movg	%xcc,	%l1,	%o5
	bl,a	loop_974
	nop
	setx loop_975, %l0, %l1
	jmpl %l1, %g5
	fzero	%f4
	edge16	%i5,	%i4,	%i6
loop_974:
	edge16ln	%g1,	%l4,	%i2
loop_975:
	fmovspos	%xcc,	%f9,	%f18
	ldstub	[%l7 + 0x23],	%l3
	fabss	%f9,	%f30
	wr	%g0,	0x89,	%asi
	stxa	%o3,	[%l7 + 0x28] %asi
	fzeros	%f9
	brz,a	%g2,	loop_976
	bcs,a	%xcc,	loop_977
	array32	%l5,	%i0,	%i1
	sethi	0x05DB,	%g7
loop_976:
	movrlez	%o4,	%i7,	%o1
loop_977:
	edge32l	%o0,	%g6,	%o7
	std	%f20,	[%l7 + 0x28]
	edge16	%g3,	%i3,	%o6
	fmovdcs	%icc,	%f13,	%f10
	edge32n	%o2,	%l2,	%l6
	tcc	%xcc,	0x0
	smul	%g4,	%l1,	%l0
	fmovsle	%icc,	%f29,	%f0
	sll	%g5,	0x00,	%o5
	fmuld8ulx16	%f3,	%f20,	%f10
	fpack32	%f22,	%f30,	%f22
	bcc,a	%icc,	loop_978
	udiv	%i5,	0x1338,	%i6
	mova	%icc,	%g1,	%i4
	fmovsgu	%xcc,	%f16,	%f18
loop_978:
	umul	%l4,	0x0F06,	%i2
	edge16	%l3,	%o3,	%l5
	fones	%f10
	sdivx	%i0,	0x04A3,	%i1
	brgez	%g7,	loop_979
	fpadd16	%f20,	%f28,	%f18
	subc	%g2,	0x0FA7,	%o4
	ld	[%l7 + 0x4C],	%f5
loop_979:
	movcs	%xcc,	%o1,	%i7
	array16	%o0,	%o7,	%g6
	smul	%i3,	%o6,	%o2
	fmovsg	%xcc,	%f20,	%f9
	edge8l	%g3,	%l6,	%g4
	movrlz	%l1,	%l0,	%g5
	be,a,pn	%xcc,	loop_980
	udivcc	%l2,	0x1491,	%o5
	tle	%icc,	0x0
	sir	0x012F
loop_980:
	movrlz	%i6,	0x21D,	%g1
	membar	0x16
	tcc	%icc,	0x1
	array32	%i4,	%i5,	%i2
	fmovdg	%icc,	%f26,	%f3
	orcc	%l4,	%o3,	%l5
	edge8	%l3,	%i1,	%i0
	fones	%f2
	sra	%g2,	0x02,	%g7
	edge8l	%o1,	%i7,	%o4
	bneg,a,pn	%icc,	loop_981
	sdiv	%o7,	0x1FF0,	%g6
	ldsh	[%l7 + 0x42],	%i3
	fcmpeq16	%f0,	%f14,	%o6
loop_981:
	movne	%xcc,	%o2,	%o0
	xnorcc	%l6,	%g4,	%g3
	stbar
	fmovrdgez	%l1,	%f0,	%f4
	lduh	[%l7 + 0x5A],	%g5
	fpack32	%f6,	%f14,	%f30
	fsrc2s	%f12,	%f24
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	addc	%l0,	%i6,	%o5
	fabss	%f6,	%f9
	wr	%g0,	0x2b,	%asi
	stba	%g1,	[%l7 + 0x65] %asi
	membar	#Sync
	srax	%i4,	%i5,	%i2
	fmovrdgz	%l4,	%f8,	%f2
	fbue,a	%fcc2,	loop_982
	andcc	%o3,	%l3,	%i1
	addc	%i0,	%l5,	%g7
	nop
	fitos	%f0,	%f5
	fstoi	%f5,	%f4
loop_982:
	movcc	%icc,	%o1,	%i7
	umulcc	%o4,	0x0774,	%o7
	edge16n	%g6,	%i3,	%o6
	set	0x7C, %o7
	ldswa	[%l7 + %o7] 0x89,	%g2
	nop
	setx	loop_983,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%o2,	0x014F,	%l6
	popc	0x0D03,	%o0
	edge32n	%g4,	%l1,	%g5
loop_983:
	movpos	%icc,	%l2,	%g3
	nop
	set	0x58, %i0
	lduh	[%l7 + %i0],	%l0
	sdiv	%o5,	0x079F,	%i6
	te	%icc,	0x6
	flush	%l7 + 0x3C
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x11,	 0x1
	fbg,a	%fcc0,	loop_984
	tg	%icc,	0x7
	fpmerge	%f7,	%f20,	%f24
	tvs	%icc,	0x0
loop_984:
	ta	%icc,	0x3
	movrlez	%i4,	%i5,	%i2
	umul	%o3,	0x0BC4,	%l3
	sethi	0x114E,	%l4
	udivcc	%i1,	0x0909,	%i0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x17] %asi,	%g7
	move	%xcc,	%l5,	%i7
	sdiv	%o4,	0x18F4,	%o7
	ldsb	[%l7 + 0x55],	%g6
	nop
	fitos	%f17,	%f1
	fornot2	%f28,	%f20,	%f30
	movcs	%xcc,	%o1,	%i3
	fsrc2s	%f25,	%f1
	movpos	%icc,	%g2,	%o6
	bcc	loop_985
	bne	loop_986
	brz,a	%l6,	loop_987
	tle	%xcc,	0x2
loop_985:
	smulcc	%o0,	%g4,	%o2
loop_986:
	alignaddr	%l1,	%l2,	%g5
loop_987:
	udivcc	%l0,	0x0465,	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x19,	%i6,	%g3
	movpos	%icc,	%g1,	%i4
	nop
	setx	loop_988,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%i2,	%o3,	%i5
	std	%f20,	[%l7 + 0x68]
	xor	%l3,	%l4,	%i1
loop_988:
	nop
	set	0x2C, %l1
	lduwa	[%l7 + %l1] 0x88,	%g7
	nop
	setx	loop_989,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%i0,	%i7,	%o4
	mova	%xcc,	%l5,	%o7
	movcc	%xcc,	%g6,	%o1
loop_989:
	movneg	%xcc,	%i3,	%o6
	tcs	%icc,	0x5
	lduw	[%l7 + 0x14],	%l6
	lduh	[%l7 + 0x54],	%o0
	fnegs	%f23,	%f19
	set	0x78, %l4
	stxa	%g2,	[%l7 + %l4] 0x04
	addccc	%o2,	0x05D6,	%g4
	bg,pn	%xcc,	loop_990
	andncc	%l2,	%g5,	%l1
	bne,a,pt	%icc,	loop_991
	movne	%icc,	%l0,	%o5
loop_990:
	fbg,a	%fcc2,	loop_992
	movg	%xcc,	%g3,	%i6
loop_991:
	nop
	setx	loop_993,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba	%xcc,	loop_994
loop_992:
	fmovsgu	%xcc,	%f23,	%f6
	addcc	%i4,	0x0676,	%g1
loop_993:
	edge16ln	%i2,	%i5,	%l3
loop_994:
	fmovdcc	%xcc,	%f3,	%f4
	movrgz	%l4,	0x0C0,	%i1
	tleu	%xcc,	0x7
	tn	%xcc,	0x5
	movne	%xcc,	%o3,	%i0
	udiv	%i7,	0x0B83,	%g7
	tne	%xcc,	0x5
	set	0x50, %i4
	swapa	[%l7 + %i4] 0x11,	%o4
	fpackfix	%f28,	%f25
	bneg	%icc,	loop_995
	fzero	%f20
	fandnot2s	%f31,	%f15,	%f22
	or	%l5,	0x0803,	%g6
loop_995:
	subcc	%o7,	0x1ED1,	%i3
	nop
	setx	0x9D4026E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x0E39D4DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f29,	%f16
	brgez	%o6,	loop_996
	ldsh	[%l7 + 0x6C],	%l6
	fnot2s	%f21,	%f14
	fba,a	%fcc2,	loop_997
loop_996:
	for	%f6,	%f6,	%f26
	sir	0x0C1E
	edge8l	%o1,	%g2,	%o0
loop_997:
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f10
	fxtod	%f10,	%f16
	fnot2s	%f8,	%f21
	move	%icc,	%g4,	%o2
	movne	%xcc,	%g5,	%l2
	addc	%l1,	%o5,	%g3
	fmovsn	%icc,	%f14,	%f0
	smul	%i6,	%l0,	%g1
	fands	%f8,	%f6,	%f29
	fmovdvc	%xcc,	%f27,	%f13
	addcc	%i4,	%i5,	%i2
	fbn,a	%fcc0,	loop_998
	add	%l4,	%i1,	%l3
	fmovsvc	%xcc,	%f6,	%f19
	ldd	[%l7 + 0x08],	%i0
loop_998:
	orcc	%i7,	0x18B8,	%g7
	sdiv	%o3,	0x1DD7,	%o4
	xor	%l5,	%o7,	%g6
	fmovscs	%icc,	%f17,	%f14
	fpmerge	%f19,	%f6,	%f14
	ba,pt	%icc,	loop_999
	tl	%icc,	0x3
	bg,pt	%icc,	loop_1000
	nop
	fitod	%f10,	%f6
	fdtoi	%f6,	%f8
loop_999:
	fba	%fcc1,	loop_1001
	movn	%xcc,	%o6,	%i3
loop_1000:
	orcc	%l6,	0x1FC1,	%g2
	edge16l	%o0,	%o1,	%o2
loop_1001:
	movpos	%xcc,	%g4,	%l2
	be,a	%icc,	loop_1002
	xnorcc	%l1,	0x162B,	%o5
	array16	%g3,	%i6,	%g5
	edge8ln	%l0,	%i4,	%g1
loop_1002:
	move	%icc,	%i5,	%i2
	movgu	%xcc,	%i1,	%l4
	movrgz	%i0,	%l3,	%g7
	movvs	%xcc,	%o3,	%o4
	tg	%xcc,	0x6
	subc	%l5,	%i7,	%g6
	movle	%xcc,	%o6,	%i3
	bge,pt	%icc,	loop_1003
	addcc	%l6,	%o7,	%o0
	edge32ln	%o1,	%o2,	%g4
	fpmerge	%f21,	%f7,	%f20
loop_1003:
	fexpand	%f24,	%f18
	ld	[%l7 + 0x7C],	%f6
	fmul8x16au	%f24,	%f29,	%f18
	orn	%g2,	0x08EB,	%l1
	srax	%o5,	0x18,	%g3
	movle	%xcc,	%i6,	%g5
	tvc	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l0,	0x05,	%l2
	umul	%i4,	%i5,	%i2
	taddcc	%g1,	%l4,	%i0
	movcc	%xcc,	%i1,	%l3
	fbne,a	%fcc1,	loop_1004
	sdivcc	%o3,	0x0F7C,	%o4
	movgu	%xcc,	%l5,	%g7
	movn	%icc,	%g6,	%o6
loop_1004:
	pdist	%f10,	%f20,	%f6
	fbge	%fcc2,	loop_1005
	xnorcc	%i3,	%i7,	%l6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o7
loop_1005:
	umul	%o1,	%o0,	%g4
	fnegd	%f22,	%f16
	movrlez	%o2,	%g2,	%l1
	movrlz	%o5,	%i6,	%g5
	xnor	%l0,	0x1584,	%l2
	ldstub	[%l7 + 0x13],	%g3
	set	0x61, %g6
	ldstuba	[%l7 + %g6] 0x80,	%i4
	fnot1	%f26,	%f26
	fsrc1s	%f11,	%f30
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	srlx	%i5,	0x10,	%g1
	array32	%l4,	%i0,	%i1
	fsrc2s	%f0,	%f22
	ba,a	%xcc,	loop_1006
	lduh	[%l7 + 0x38],	%i2
	fmovsvc	%xcc,	%f9,	%f9
	ldsh	[%l7 + 0x1A],	%l3
loop_1006:
	tle	%icc,	0x6
	movl	%icc,	%o4,	%o3
	brlz	%l5,	loop_1007
	nop
	setx	0x28D64621605EFA39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	movge	%icc,	%g7,	%g6
	movre	%i3,	0x25C,	%o6
loop_1007:
	fnot1s	%f19,	%f23
	edge32n	%l6,	%o7,	%o1
	nop
	setx	0xC046452B,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	stb	%i7,	[%l7 + 0x5C]
	tneg	%xcc,	0x0
	movrlez	%g4,	%o0,	%g2
	movg	%icc,	%o2,	%o5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x20] %asi,	%i6
	wr	%g0,	0x27,	%asi
	stxa	%g5,	[%l7 + 0x48] %asi
	membar	#Sync
	fbne	%fcc2,	loop_1008
	sra	%l0,	%l2,	%g3
	edge8n	%l1,	%i5,	%i4
	nop
	fitod	%f2,	%f26
	fdtos	%f26,	%f15
loop_1008:
	sir	0x0094
	tgu	%xcc,	0x4
	fnot1	%f16,	%f8
	edge8n	%l4,	%g1,	%i1
	set	0x2A, %i5
	lduha	[%l7 + %i5] 0x19,	%i0
	fzeros	%f18
	fmovsa	%xcc,	%f25,	%f10
	movcs	%xcc,	%l3,	%i2
	lduw	[%l7 + 0x5C],	%o3
	srax	%o4,	%g7,	%l5
	tneg	%xcc,	0x2
	fnand	%f16,	%f6,	%f24
	prefetch	[%l7 + 0x50],	 0x1
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f24
	fxtos	%f24,	%f7
	ldd	[%l7 + 0x30],	%f26
	move	%xcc,	%i3,	%o6
	fmuld8ulx16	%f0,	%f4,	%f0
	fbue,a	%fcc3,	loop_1009
	nop
	setx	loop_1010,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x7C],	%g6
	taddcctv	%l6,	%o1,	%i7
loop_1009:
	array32	%g4,	%o7,	%o0
loop_1010:
	sub	%o2,	%g2,	%o5
	fmovrdlez	%g5,	%f22,	%f20
	fnot2s	%f24,	%f15
	sdivx	%i6,	0x0756,	%l0
	bcs,a	%xcc,	loop_1011
	edge32n	%g3,	%l1,	%i5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%l2
loop_1011:
	smul	%l4,	0x1ADE,	%g1
	fabss	%f18,	%f7
	fbg,a	%fcc1,	loop_1012
	sll	%i1,	0x1B,	%i0
	subcc	%i4,	0x01CA,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1012:
	edge8l	%o3,	%l3,	%g7
	nop
	setx	0x82E899B528898C08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x8EF63F688A173E59,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f24,	%f20
	nop
	fitos	%f14,	%f6
	bpos,pn	%xcc,	loop_1013
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o4,	0x344,	%i3
	fnands	%f23,	%f30,	%f1
loop_1013:
	addc	%l5,	%o6,	%g6
	movrgez	%l6,	0x0B6,	%i7
	fmovsvs	%xcc,	%f12,	%f2
	fnor	%f28,	%f30,	%f26
	tgu	%icc,	0x6
	alignaddr	%o1,	%o7,	%g4
	array16	%o0,	%o2,	%g2
	movle	%xcc,	%o5,	%i6
	tne	%icc,	0x7
	subc	%g5,	%l0,	%l1
	sdivx	%g3,	0x00A5,	%l2
	addc	%l4,	0x1BDA,	%g1
	smulcc	%i1,	0x066B,	%i5
	edge32l	%i0,	%i2,	%i4
	alignaddrl	%o3,	%g7,	%l3
	andncc	%o4,	%l5,	%o6
	movn	%icc,	%g6,	%i3
	xor	%l6,	0x06AF,	%i7
	edge16l	%o7,	%g4,	%o0
	nop
	setx	0x5BC08C72FCAD0BCA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xB12C4108D6F0FAB4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f0,	%f26
	tn	%icc,	0x3
	edge8n	%o2,	%g2,	%o5
	fmovdcs	%xcc,	%f6,	%f15
	tg	%icc,	0x2
	or	%o1,	0x014C,	%i6
	addccc	%g5,	%l1,	%l0
	movl	%xcc,	%g3,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g1,	[%l7 + 0x1E]
	fbe	%fcc3,	loop_1014
	sra	%l4,	0x05,	%i5
	orcc	%i1,	0x0DEA,	%i2
	ldstub	[%l7 + 0x67],	%i4
loop_1014:
	bneg,a	loop_1015
	ba,a	%xcc,	loop_1016
	fbu,a	%fcc3,	loop_1017
	nop
	setx	0x323EDD4E53708C56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB90AA638625C3661,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f28,	%f8
loop_1015:
	movn	%icc,	%i0,	%g7
loop_1016:
	tge	%xcc,	0x0
loop_1017:
	bpos,pn	%xcc,	loop_1018
	bneg	%icc,	loop_1019
	edge16l	%l3,	%o4,	%o3
	tle	%icc,	0x3
loop_1018:
	ld	[%l7 + 0x6C],	%f6
loop_1019:
	tgu	%icc,	0x1
	movcc	%icc,	%o6,	%g6
	alignaddrl	%l5,	%i3,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l6,	%o7,	%o0
	fbule,a	%fcc0,	loop_1020
	fmul8ulx16	%f8,	%f10,	%f8
	edge32l	%g4,	%o2,	%o5
	tvs	%icc,	0x6
loop_1020:
	addc	%o1,	%i6,	%g5
	tg	%icc,	0x1
	tg	%xcc,	0x7
	nop
	setx	loop_1021,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%g2,	0x084C,	%l1
	movpos	%icc,	%l0,	%l2
	fpadd16s	%f20,	%f8,	%f10
loop_1021:
	nop
	fitos	%f7,	%f21
	fstox	%f21,	%f24
	fones	%f14
	fmul8x16au	%f9,	%f20,	%f18
	andcc	%g1,	%l4,	%i5
	edge8ln	%i1,	%g3,	%i2
	sdiv	%i0,	0x17D9,	%i4
	bne,a,pn	%icc,	loop_1022
	tgu	%xcc,	0x3
	movn	%icc,	%g7,	%o4
	nop
	setx	0x0CBFCA50,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x02D3FCC2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f29,	%f24
loop_1022:
	edge32l	%l3,	%o6,	%g6
	edge8ln	%o3,	%l5,	%i7
	tleu	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l6,	%i3
	edge32ln	%o0,	%o7,	%g4
	tn	%xcc,	0x3
	edge16l	%o2,	%o1,	%i6
	srax	%g5,	%g2,	%l1
	fbule,a	%fcc1,	loop_1023
	fmovdgu	%xcc,	%f0,	%f21
	smul	%o5,	%l2,	%g1
	movrlez	%l4,	0x3B9,	%i5
loop_1023:
	srax	%l0,	0x0B,	%i1
	sdiv	%i2,	0x058B,	%i0
	nop
	fitos	%f14,	%f16
	fstox	%f16,	%f16
	srax	%g3,	0x0D,	%i4
	ble,a	%xcc,	loop_1024
	edge32n	%o4,	%g7,	%o6
	movgu	%icc,	%l3,	%g6
	ldx	[%l7 + 0x78],	%l5
loop_1024:
	edge16	%o3,	%l6,	%i3
	subc	%o0,	%o7,	%g4
	ldd	[%l7 + 0x78],	%i6
	edge32	%o1,	%o2,	%g5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i6
	edge16n	%g2,	%o5,	%l1
	mova	%icc,	%l2,	%l4
	movcc	%icc,	%g1,	%i5
	xnor	%i1,	0x09ED,	%l0
	wr	%g0,	0x88,	%asi
	stba	%i0,	[%l7 + 0x50] %asi
	te	%xcc,	0x3
	fexpand	%f30,	%f2
	movg	%xcc,	%g3,	%i2
	nop
	set	0x30, %g2
	stx	%i4,	[%l7 + %g2]
	lduw	[%l7 + 0x18],	%o4
	sdivx	%o6,	0x075A,	%g7
	xor	%g6,	%l3,	%l5
	bcs,a,pt	%icc,	loop_1025
	sdivx	%o3,	0x0E51,	%i3
	fands	%f15,	%f19,	%f29
	fabss	%f5,	%f9
loop_1025:
	bleu,a	loop_1026
	xorcc	%o0,	%o7,	%g4
	array8	%i7,	%o1,	%l6
	sub	%g5,	0x1A90,	%i6
loop_1026:
	fornot1s	%f17,	%f9,	%f4
	movl	%xcc,	%g2,	%o2
	movle	%icc,	%o5,	%l1
	movvs	%xcc,	%l2,	%g1
	be,pt	%xcc,	loop_1027
	edge32	%l4,	%i1,	%l0
	lduw	[%l7 + 0x3C],	%i5
	prefetch	[%l7 + 0x7C],	 0x1
loop_1027:
	nop
	fitod	%f8,	%f22
	fdtos	%f22,	%f7
	tle	%icc,	0x4
	fbul,a	%fcc1,	loop_1028
	sub	%g3,	%i0,	%i2
	fnegs	%f3,	%f20
	move	%xcc,	%o4,	%o6
loop_1028:
	swap	[%l7 + 0x3C],	%i4
	tleu	%xcc,	0x7
	tl	%xcc,	0x6
	movre	%g6,	%l3,	%l5
	fcmpgt16	%f12,	%f18,	%o3
	tg	%icc,	0x6
	fmovrdne	%g7,	%f0,	%f8
	andncc	%o0,	%o7,	%g4
	tn	%xcc,	0x5
	fmovsg	%xcc,	%f14,	%f27
	fcmpeq16	%f8,	%f2,	%i3
	movl	%xcc,	%o1,	%l6
	alignaddr	%g5,	%i7,	%i6
	set	0x26, %l2
	stha	%g2,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	fitos	%f5,	%f19
	fstox	%f19,	%f28
	movg	%icc,	%o2,	%l1
	tge	%icc,	0x4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x04,	%f16
	edge8l	%l2,	%g1,	%l4
	sllx	%i1,	%o5,	%i5
	movre	%l0,	0x168,	%g3
	movcs	%icc,	%i2,	%i0
	popc	%o6,	%o4
	add	%i4,	0x11C6,	%l3
	be,pn	%xcc,	loop_1029
	xnor	%g6,	0x1ED7,	%l5
	nop
	set	0x3C, %o6
	ldsw	[%l7 + %o6],	%o3
	orcc	%o0,	0x1995,	%o7
loop_1029:
	fmul8sux16	%f28,	%f16,	%f14
	fbn	%fcc2,	loop_1030
	bn,pt	%icc,	loop_1031
	nop
	setx	loop_1032,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc	%xcc,	loop_1033
loop_1030:
	subcc	%g7,	0x0947,	%g4
loop_1031:
	tcs	%xcc,	0x0
loop_1032:
	edge8ln	%i3,	%l6,	%o1
loop_1033:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f12,	%f20
	udivx	%i7,	0x0F33,	%g5
	addcc	%g2,	%i6,	%o2
	movgu	%icc,	%l1,	%l2
	fornot1s	%f4,	%f22,	%f20
	mulx	%g1,	0x1FC3,	%i1
	edge16ln	%l4,	%o5,	%i5
	movrgz	%g3,	%i2,	%i0
	smulcc	%o6,	%o4,	%i4
	stx	%l0,	[%l7 + 0x50]
	nop
	fitos	%f11,	%f19
	fstoi	%f19,	%f22
	sll	%l3,	0x11,	%l5
	tsubcc	%g6,	0x05EE,	%o0
	fbu,a	%fcc2,	loop_1034
	movne	%xcc,	%o7,	%o3
	sllx	%g4,	0x10,	%i3
	tneg	%xcc,	0x7
loop_1034:
	sdivx	%l6,	0x1364,	%o1
	std	%f20,	[%l7 + 0x40]
	edge32	%i7,	%g5,	%g7
	brlz	%g2,	loop_1035
	stbar
	fmovsgu	%icc,	%f14,	%f26
	edge32ln	%o2,	%i6,	%l1
loop_1035:
	edge16l	%l2,	%i1,	%l4
	edge8	%o5,	%i5,	%g1
	xor	%g3,	0x113D,	%i2
	tsubcc	%o6,	0x1470,	%o4
	nop
	setx	0x406E8E0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f6
	orn	%i4,	0x12A2,	%i0
	tl	%icc,	0x3
	and	%l0,	%l3,	%l5
	fmovsge	%xcc,	%f29,	%f25
	movne	%xcc,	%o0,	%g6
	set	0x0C, %l6
	stba	%o7,	[%l7 + %l6] 0x88
	bpos,a,pn	%xcc,	loop_1036
	edge16l	%o3,	%i3,	%l6
	fabsd	%f2,	%f20
	fmul8x16al	%f3,	%f15,	%f24
loop_1036:
	movrne	%g4,	%o1,	%i7
	fsrc2	%f0,	%f2
	set	0x38, %o3
	ldsha	[%l7 + %o3] 0x04,	%g7
	bgu,a,pn	%xcc,	loop_1037
	fpadd16s	%f30,	%f14,	%f26
	tge	%icc,	0x2
	movcs	%icc,	%g2,	%o2
loop_1037:
	nop
	set	0x46, %i3
	lduha	[%l7 + %i3] 0x10,	%g5
	fbug	%fcc0,	loop_1038
	fmovrdne	%l1,	%f22,	%f30
	alignaddr	%l2,	%i1,	%l4
	stw	%i6,	[%l7 + 0x1C]
loop_1038:
	orn	%i5,	%g1,	%g3
	ldub	[%l7 + 0x48],	%o5
	array32	%i2,	%o6,	%i4
	edge16n	%i0,	%o4,	%l0
	smul	%l5,	0x17AB,	%o0
	xnorcc	%g6,	%o7,	%o3
	movvc	%xcc,	%l3,	%l6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	addccc	%g4,	0x0E7C,	%i7
	edge8n	%o1,	%g2,	%o2
	movpos	%xcc,	%g7,	%g5
	fmovdvs	%icc,	%f5,	%f12
	movn	%icc,	%l2,	%l1
	ld	[%l7 + 0x3C],	%f26
	edge32ln	%i1,	%i6,	%i5
	array8	%g1,	%l4,	%g3
	fmovs	%f29,	%f18
	pdist	%f24,	%f16,	%f2
	nop
	setx	0x7CA3139A70D22DC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x027EE8E28D3ECE6A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f0
	bcc,pt	%icc,	loop_1039
	std	%f26,	[%l7 + 0x40]
	edge8l	%i2,	%o5,	%i4
	fmul8x16	%f13,	%f0,	%f14
loop_1039:
	fmul8x16au	%f9,	%f25,	%f30
	movg	%icc,	%o6,	%o4
	fbule	%fcc0,	loop_1040
	tsubcc	%i0,	%l0,	%o0
	tneg	%icc,	0x6
	bne,a,pt	%icc,	loop_1041
loop_1040:
	movg	%xcc,	%g6,	%l5
	mova	%xcc,	%o7,	%l3
	orcc	%l6,	%o3,	%g4
loop_1041:
	tne	%icc,	0x0
	ta	%icc,	0x4
	smul	%i3,	0x01FC,	%o1
	and	%g2,	0x0699,	%i7
	nop
	setx	0xA3CC9735EEA7E938,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF35CEB2B3E3A3D32,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f30,	%f30
	movrne	%g7,	%g5,	%l2
	move	%xcc,	%l1,	%i1
	andcc	%o2,	%i6,	%g1
	nop
	fitos	%f17,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l4,	%g3
	flush	%l7 + 0x48
	set	0x0C, %o1
	lduwa	[%l7 + %o1] 0x10,	%i5
	movpos	%xcc,	%i2,	%i4
	tcs	%icc,	0x7
	stb	%o6,	[%l7 + 0x2E]
	xorcc	%o4,	0x0B20,	%o5
	nop
	setx	0x6A54BE82,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f0
	fbo,a	%fcc1,	loop_1042
	fors	%f27,	%f21,	%f4
	smulcc	%l0,	0x1D35,	%o0
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f16
loop_1042:
	movrne	%i0,	0x087,	%g6
	mova	%icc,	%l5,	%o7
	fbge	%fcc0,	loop_1043
	st	%f4,	[%l7 + 0x10]
	addc	%l6,	0x1F02,	%o3
	ta	%xcc,	0x7
loop_1043:
	brlz	%l3,	loop_1044
	bge	loop_1045
	tvc	%icc,	0x0
	nop
	setx	0x751E84878148AE2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9D1EA9289D84E271,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f8,	%f24
loop_1044:
	movvs	%xcc,	%g4,	%o1
loop_1045:
	fba,a	%fcc3,	loop_1046
	smul	%g2,	%i7,	%g7
	fxors	%f6,	%f17,	%f18
	ld	[%l7 + 0x5C],	%f15
loop_1046:
	fzeros	%f15
	edge16l	%i3,	%l2,	%l1
	orncc	%g5,	%i1,	%i6
	alignaddrl	%g1,	%o2,	%l4
	edge16ln	%i5,	%i2,	%g3
	subc	%i4,	0x10E5,	%o6
	movrlez	%o4,	0x294,	%l0
	edge16n	%o5,	%i0,	%o0
	fmovsgu	%xcc,	%f28,	%f8
	tcc	%icc,	0x7
	tgu	%icc,	0x7
	movre	%l5,	%g6,	%o7
	edge16	%l6,	%o3,	%l3
	tl	%icc,	0x3
	brlz,a	%g4,	loop_1047
	edge8	%g2,	%i7,	%o1
	fmovrdgz	%i3,	%f6,	%f30
	edge16n	%l2,	%l1,	%g5
loop_1047:
	movge	%xcc,	%i1,	%g7
	mulx	%g1,	0x091D,	%i6
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8	%o2,	%l4,	%i2
	nop
	setx	0xCC421489,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x6AE5154A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f12,	%f8
	te	%xcc,	0x1
	faligndata	%f16,	%f12,	%f16
	tpos	%xcc,	0x0
	orncc	%i5,	0x0831,	%g3
	bgu,a,pn	%xcc,	loop_1048
	ba,a	%xcc,	loop_1049
	ldsb	[%l7 + 0x6C],	%o6
	array16	%o4,	%i4,	%o5
loop_1048:
	edge8l	%i0,	%l0,	%l5
loop_1049:
	fble	%fcc1,	loop_1050
	ldub	[%l7 + 0x71],	%g6
	alignaddr	%o7,	%l6,	%o0
	fandnot2s	%f22,	%f2,	%f24
loop_1050:
	sdiv	%l3,	0x0C0B,	%g4
	ldsw	[%l7 + 0x6C],	%o3
	brlz,a	%i7,	loop_1051
	tge	%xcc,	0x1
	xor	%o1,	%i3,	%g2
	movne	%xcc,	%l2,	%l1
loop_1051:
	edge32n	%g5,	%i1,	%g7
	addccc	%i6,	%o2,	%l4
	fandnot2	%f26,	%f4,	%f10
	movrlez	%g1,	0x043,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i5,	%g3,	%o4
	nop
	setx	0x1071CEBA,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	andn	%o6,	0x17B1,	%i4
	tvc	%icc,	0x3
	fmovdn	%xcc,	%f0,	%f26
	bpos,a,pt	%xcc,	loop_1052
	fmovrde	%o5,	%f26,	%f4
	popc	0x0005,	%i0
	fors	%f5,	%f6,	%f4
loop_1052:
	tl	%icc,	0x7
	fblg,a	%fcc0,	loop_1053
	andcc	%l5,	0x143A,	%g6
	tpos	%xcc,	0x2
	srlx	%l0,	%o7,	%l6
loop_1053:
	ldub	[%l7 + 0x35],	%o0
	sra	%g4,	0x16,	%o3
	mova	%icc,	%i7,	%l3
	xnorcc	%o1,	0x0523,	%i3
	fandnot2s	%f23,	%f14,	%f11
	brnz	%g2,	loop_1054
	fbo,a	%fcc1,	loop_1055
	tn	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1054:
	sdiv	%l1,	0x1239,	%l2
loop_1055:
	bg	loop_1056
	bneg	loop_1057
	std	%f8,	[%l7 + 0x58]
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f16
loop_1056:
	alignaddr	%i1,	%g7,	%i6
loop_1057:
	membar	0x20
	sethi	0x00F0,	%g5
	sdivcc	%o2,	0x04C9,	%l4
	fmovda	%xcc,	%f11,	%f20
	array8	%g1,	%i2,	%i5
	movle	%icc,	%o4,	%o6
	movpos	%xcc,	%i4,	%o5
	nop
	fitod	%f10,	%f6
	fdtoi	%f6,	%f2
	subc	%i0,	0x1875,	%g3
	addccc	%l5,	0x0DF8,	%l0
	fmovde	%icc,	%f10,	%f26
	smul	%o7,	0x02D8,	%g6
	addc	%o0,	%l6,	%g4
	ta	%icc,	0x0
	set	0x0A, %o0
	lduba	[%l7 + %o0] 0x14,	%i7
	and	%o3,	0x0475,	%l3
	fbl,a	%fcc0,	loop_1058
	for	%f12,	%f2,	%f0
	sdivx	%o1,	0x06A4,	%i3
	fcmpne16	%f2,	%f4,	%l1
loop_1058:
	edge8l	%l2,	%i1,	%g2
	sra	%i6,	%g7,	%o2
	addcc	%g5,	0x029E,	%l4
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	srax	%g1,	%i2,	%i5
	fpackfix	%f26,	%f28
	sethi	0x0230,	%o4
	movrgz	%i4,	0x3EF,	%o6
	fmovs	%f0,	%f16
	or	%i0,	0x0C20,	%o5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x78] %asi,	%l5
	udivx	%l0,	0x05AC,	%o7
	movvs	%xcc,	%g6,	%g3
	fone	%f16
	srl	%l6,	%o0,	%g4
	taddcctv	%i7,	0x1D84,	%l3
	movrgz	%o1,	%o3,	%i3
	xnor	%l1,	%l2,	%i1
	smulcc	%i6,	0x1C6C,	%g7
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	movleu	%xcc,	%g5,	%l4
	set	0x6C, %o5
	lduha	[%l7 + %o5] 0x0c,	%g2
	sdivx	%i2,	0x164F,	%g1
	fmuld8ulx16	%f4,	%f22,	%f24
	stx	%o4,	[%l7 + 0x68]
	andncc	%i5,	%o6,	%i4
	tl	%xcc,	0x1
	fsrc1	%f0,	%f10
	bne,pn	%icc,	loop_1059
	orncc	%o5,	0x162A,	%i0
	bshuffle	%f2,	%f12,	%f18
	bvs,pt	%icc,	loop_1060
loop_1059:
	movneg	%xcc,	%l0,	%l5
	bge,a,pt	%xcc,	loop_1061
	mova	%icc,	%o7,	%g3
loop_1060:
	fba,a	%fcc2,	loop_1062
	fbne	%fcc1,	loop_1063
loop_1061:
	movne	%icc,	%l6,	%o0
	brz	%g4,	loop_1064
loop_1062:
	sdiv	%g6,	0x0ABE,	%i7
loop_1063:
	te	%xcc,	0x4
	fnands	%f29,	%f8,	%f7
loop_1064:
	tge	%xcc,	0x4
	tgu	%icc,	0x4
	fsrc2	%f8,	%f30
	srlx	%o1,	0x05,	%l3
	tg	%xcc,	0x2
	move	%icc,	%o3,	%i3
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f30
	fxtod	%f30,	%f18
	move	%icc,	%l1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	stba	%i1,	[%l7 + 0x15] %asi
	fble	%fcc2,	loop_1065
	movrgez	%i6,	%o2,	%g5
	popc	%l4,	%g2
	alignaddrl	%g7,	%g1,	%i2
loop_1065:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%o4
	or	%o6,	%i5,	%o5
	movrlez	%i4,	%l0,	%i0
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x2c,	%l4
	edge16n	%g3,	%l6,	%o0
	fxor	%f8,	%f14,	%f26
	edge32ln	%o7,	%g4,	%i7
	fpsub16s	%f12,	%f31,	%f2
	movneg	%icc,	%o1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o3,	%g6,	%l1
	subcc	%l2,	0x1BCA,	%i1
	sra	%i6,	0x1C,	%o2
	fmovde	%icc,	%f2,	%f20
	fand	%f28,	%f6,	%f10
	tpos	%xcc,	0x5
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f20
	smulcc	%g5,	%l4,	%i3
	nop
	setx loop_1066, %l0, %l1
	jmpl %l1, %g2
	array8	%g7,	%g1,	%o4
	ldsw	[%l7 + 0x50],	%o6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x64] %asi,	%i2
loop_1066:
	edge32l	%o5,	%i4,	%i5
	stw	%i0,	[%l7 + 0x64]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f0
	edge16l	%l5,	%g3,	%l6
	swap	[%l7 + 0x24],	%o0
	fandnot1s	%f13,	%f31,	%f11
	mulx	%l0,	%o7,	%i7
	taddcc	%o1,	0x06F7,	%l3
	array32	%o3,	%g4,	%l1
	movvc	%icc,	%l2,	%i1
	movvc	%icc,	%i6,	%o2
	xnorcc	%g6,	%l4,	%g5
	fors	%f12,	%f22,	%f22
	fmovdleu	%icc,	%f9,	%f5
	fand	%f26,	%f6,	%f24
	ldstub	[%l7 + 0x39],	%i3
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g7
	nop
	setx	loop_1067,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%g1,	%o4,	%o6
	movrlz	%g2,	%o5,	%i2
	call	loop_1068
loop_1067:
	fmovsn	%xcc,	%f3,	%f28
	fpsub32	%f4,	%f18,	%f2
	tpos	%icc,	0x3
loop_1068:
	tl	%xcc,	0x5
	st	%f22,	[%l7 + 0x34]
	fmovrsgz	%i5,	%f23,	%f5
	nop
	setx	0x6249D201E071B6A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	udivcc	%i4,	0x0763,	%i0
	tsubcc	%g3,	0x1CF1,	%l5
	fmovrsgz	%o0,	%f2,	%f31
	and	%l6,	%l0,	%i7
	xor	%o1,	0x0313,	%l3
	fxor	%f30,	%f26,	%f24
	sub	%o7,	%g4,	%l1
	fmuld8sux16	%f2,	%f14,	%f8
	lduh	[%l7 + 0x1A],	%l2
	ldx	[%l7 + 0x28],	%o3
	mova	%icc,	%i6,	%i1
	andcc	%g6,	%l4,	%g5
	array32	%o2,	%g7,	%i3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o4
	set	0x1C, %o4
	lduwa	[%l7 + %o4] 0x04,	%g1
	addccc	%o6,	0x0179,	%o5
	fmovdge	%icc,	%f13,	%f21
	sra	%g2,	0x04,	%i2
	fble,a	%fcc3,	loop_1069
	movle	%xcc,	%i5,	%i0
	fmovsge	%icc,	%f14,	%f4
	orncc	%i4,	0x190E,	%l5
loop_1069:
	udivcc	%g3,	0x19EA,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc0,	loop_1070
	fcmpne16	%f26,	%f30,	%l6
	tvc	%icc,	0x0
	movgu	%icc,	%l0,	%i7
loop_1070:
	fnands	%f15,	%f14,	%f12
	fmovsle	%icc,	%f2,	%f24
	fnegs	%f0,	%f19
	srlx	%l3,	0x02,	%o7
	fbule,a	%fcc1,	loop_1071
	alignaddrl	%o1,	%g4,	%l2
	fcmpgt32	%f18,	%f28,	%o3
	fandnot1	%f28,	%f0,	%f18
loop_1071:
	movne	%xcc,	%i6,	%l1
	fmovrsgz	%g6,	%f0,	%f18
	mulx	%l4,	%i1,	%g5
	taddcc	%g7,	%o2,	%o4
	array8	%g1,	%i3,	%o5
	movge	%xcc,	%o6,	%i2
	movne	%xcc,	%g2,	%i5
	fmovsne	%icc,	%f18,	%f26
	tn	%icc,	0x2
	fmovda	%icc,	%f18,	%f10
	tvc	%xcc,	0x6
	edge16l	%i4,	%l5,	%g3
	add	%i0,	%l6,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l0,	%i7,	%o7
	stbar
	movvs	%icc,	%o1,	%g4
	fpmerge	%f12,	%f16,	%f10
	brlz,a	%l2,	loop_1072
	fnegs	%f6,	%f25
	nop
	setx	0x7AC67CBB60626672,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fexpand	%f17,	%f8
loop_1072:
	fmovdcc	%xcc,	%f30,	%f15
	move	%icc,	%l3,	%o3
	lduw	[%l7 + 0x5C],	%l1
	edge32	%i6,	%g6,	%l4
	bvs,pn	%icc,	loop_1073
	ldstub	[%l7 + 0x65],	%g5
	ba	%xcc,	loop_1074
	sllx	%i1,	0x1E,	%g7
loop_1073:
	tg	%icc,	0x5
	fbug,a	%fcc0,	loop_1075
loop_1074:
	fmovrslz	%o4,	%f5,	%f0
	set	0x0A, %i2
	stha	%g1,	[%l7 + %i2] 0x88
loop_1075:
	tsubcc	%i3,	%o5,	%o6
	fcmpgt16	%f14,	%f10,	%o2
	movvs	%xcc,	%g2,	%i5
	orcc	%i4,	0x1070,	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g3,	%i0
	tg	%icc,	0x3
	sethi	0x19E2,	%i2
	fnegs	%f4,	%f18
	fors	%f30,	%f26,	%f22
	edge8l	%l6,	%l0,	%o0
	edge8ln	%o7,	%o1,	%g4
	edge8ln	%l2,	%i7,	%l3
	fpack32	%f28,	%f16,	%f6
	fbge,a	%fcc1,	loop_1076
	fmovsvc	%xcc,	%f10,	%f0
	bpos	loop_1077
	tgu	%xcc,	0x1
loop_1076:
	mulx	%o3,	%i6,	%g6
	umulcc	%l4,	%g5,	%i1
loop_1077:
	tneg	%xcc,	0x5
	srax	%g7,	0x12,	%l1
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x15,	 0x1
	move	%xcc,	%i3,	%o5
	bl,a,pt	%icc,	loop_1078
	nop
	set	0x6C, %g5
	ldub	[%l7 + %g5],	%o6
	ldsh	[%l7 + 0x10],	%o2
	set	0x08, %l5
	stha	%o4,	[%l7 + %l5] 0x04
loop_1078:
	mulx	%g2,	0x1E76,	%i5
	fbg	%fcc1,	loop_1079
	sdivcc	%i4,	0x0320,	%l5
	fnor	%f30,	%f0,	%f8
	fba,a	%fcc3,	loop_1080
loop_1079:
	movle	%xcc,	%g3,	%i0
	edge16	%l6,	%i2,	%l0
	movl	%icc,	%o0,	%o1
loop_1080:
	prefetch	[%l7 + 0x34],	 0x3
	fmovsgu	%icc,	%f15,	%f4
	srlx	%g4,	%l2,	%o7
	taddcc	%i7,	0x0B35,	%l3
	movrne	%i6,	%o3,	%g6
	bn	loop_1081
	ldsw	[%l7 + 0x4C],	%g5
	stx	%i1,	[%l7 + 0x78]
	fmovrdlez	%g7,	%f10,	%f16
loop_1081:
	edge8l	%l4,	%l1,	%g1
	fbl	%fcc1,	loop_1082
	tleu	%xcc,	0x0
	fnegs	%f29,	%f17
	addcc	%i3,	0x1E95,	%o5
loop_1082:
	xnorcc	%o2,	%o4,	%o6
	ldsb	[%l7 + 0x57],	%g2
	fpadd16s	%f31,	%f11,	%f6
	tcs	%icc,	0x3
	stbar
	fbne	%fcc3,	loop_1083
	stw	%i4,	[%l7 + 0x30]
	te	%icc,	0x2
	tl	%icc,	0x3
loop_1083:
	udivcc	%i5,	0x1C20,	%g3
	membar	0x16
	movg	%xcc,	%l5,	%i0
	nop
	setx	0xDA063683,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x0FD4C04E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f30,	%f8
	fpadd16	%f0,	%f30,	%f16
	sir	0x1114
	orn	%l6,	0x161D,	%i2
	fmovsgu	%icc,	%f18,	%f25
	movpos	%icc,	%l0,	%o1
	fbn,a	%fcc1,	loop_1084
	fmovscc	%icc,	%f6,	%f16
	udiv	%g4,	0x1E42,	%l2
	fpsub32s	%f21,	%f23,	%f12
loop_1084:
	fbuge,a	%fcc3,	loop_1085
	movleu	%xcc,	%o7,	%o0
	movgu	%icc,	%l3,	%i7
	tvc	%xcc,	0x5
loop_1085:
	sra	%o3,	%g6,	%g5
	ldsh	[%l7 + 0x34],	%i1
	nop
	setx	loop_1086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrse	%g7,	%f9,	%f1
	set	0x6C, %i7
	sta	%f21,	[%l7 + %i7] 0x18
loop_1086:
	move	%xcc,	%l4,	%l1
	bg,a,pn	%xcc,	loop_1087
	movle	%xcc,	%i6,	%i3
	movn	%icc,	%g1,	%o5
	mulscc	%o2,	%o4,	%o6
loop_1087:
	movcs	%icc,	%g2,	%i4
	andn	%g3,	%i5,	%i0
	taddcc	%l5,	%l6,	%i2
	ldd	[%l7 + 0x18],	%o0
	array8	%g4,	%l0,	%o7
	edge32n	%l2,	%l3,	%i7
	movl	%icc,	%o3,	%o0
	tsubcctv	%g6,	0x00D9,	%g5
	fsrc2s	%f11,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i1,	%l4
	fmovdneg	%xcc,	%f12,	%f23
	umul	%g7,	%i6,	%i3
	orcc	%g1,	%o5,	%o2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x19] %asi,	%l1
	te	%icc,	0x1
	tcc	%xcc,	0x6
	fandnot1	%f22,	%f22,	%f8
	lduh	[%l7 + 0x78],	%o6
	set	0x64, %g3
	stwa	%o4,	[%l7 + %g3] 0x11
	movpos	%icc,	%g2,	%g3
	fmovdvs	%xcc,	%f31,	%f31
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xea,	%i4
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x18,	%f19
	tl	%icc,	0x5
	tcc	%xcc,	0x2
	ble,a	%icc,	loop_1088
	be	%icc,	loop_1089
	movne	%xcc,	%i0,	%i5
	edge16l	%l6,	%l5,	%i2
loop_1088:
	sllx	%o1,	0x03,	%l0
loop_1089:
	srax	%g4,	0x03,	%l2
	swap	[%l7 + 0x48],	%o7
	edge16l	%l3,	%o3,	%o0
	fxnor	%f28,	%f0,	%f26
	bcc,a,pn	%icc,	loop_1090
	movne	%icc,	%i7,	%g6
	bne	%icc,	loop_1091
	movvc	%xcc,	%i1,	%g5
loop_1090:
	movn	%icc,	%l4,	%i6
	tvs	%xcc,	0x0
loop_1091:
	xnor	%i3,	%g1,	%g7
	udivx	%o5,	0x0E37,	%l1
	movre	%o2,	0x373,	%o6
	nop
	fitos	%f2,	%f31
	fstoi	%f31,	%f25
	tn	%icc,	0x6
	stx	%o4,	[%l7 + 0x18]
	popc	0x078A,	%g2
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x48] %asi,	%i4
	movrlez	%g3,	%i5,	%l6
	nop
	setx	0xC6F0C50A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x5A72593C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f11,	%f3
	movneg	%icc,	%i0,	%i2
	fors	%f30,	%f21,	%f0
	xnor	%o1,	0x14C6,	%l5
	fmovrslz	%l0,	%f30,	%f12
	subcc	%l2,	0x1D92,	%o7
	fmovsg	%xcc,	%f14,	%f26
	tcc	%xcc,	0x7
	fnors	%f13,	%f0,	%f3
	fmovrsne	%g4,	%f13,	%f14
	fmovsneg	%icc,	%f15,	%f10
	fpadd16	%f28,	%f26,	%f18
	stx	%l3,	[%l7 + 0x10]
	fmovdcc	%xcc,	%f21,	%f3
	tneg	%xcc,	0x7
	te	%icc,	0x1
	sth	%o0,	[%l7 + 0x60]
	fnot1s	%f0,	%f12
	fnot2s	%f15,	%f7
	and	%o3,	0x1FE2,	%g6
	sub	%i1,	0x18DF,	%i7
	movrgz	%l4,	%i6,	%i3
	nop
	fitod	%f13,	%f8
	flush	%l7 + 0x70
	movrlez	%g5,	%g1,	%g7
	subccc	%l1,	%o5,	%o6
	set	0x30, %l0
	ldswa	[%l7 + %l0] 0x10,	%o2
	taddcc	%o4,	%i4,	%g3
	set	0x28, %o7
	lduwa	[%l7 + %o7] 0x15,	%i5
	wr	%g0,	0x0c,	%asi
	stha	%l6,	[%l7 + 0x7E] %asi
	fpackfix	%f16,	%f1
	ld	[%l7 + 0x60],	%f29
	membar	0x52
	tvc	%icc,	0x3
	ldstub	[%l7 + 0x2F],	%g2
	smulcc	%i0,	0x150E,	%i2
	alignaddrl	%o1,	%l5,	%l2
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x19,	%l0
	addcc	%o7,	0x0B93,	%l3
	srlx	%o0,	%g4,	%o3
	movvc	%xcc,	%i1,	%g6
	fnand	%f8,	%f4,	%f30
	fmovsa	%icc,	%f11,	%f20
	mulscc	%l4,	0x100D,	%i7
	tcs	%xcc,	0x5
	fmovsl	%xcc,	%f8,	%f17
	orcc	%i3,	0x18C9,	%g5
	array32	%g1,	%i6,	%l1
	tn	%xcc,	0x4
	te	%icc,	0x1
	flush	%l7 + 0x4C
	movle	%icc,	%g7,	%o6
	sub	%o2,	%o5,	%o4
	edge32	%g3,	%i4,	%i5
	andncc	%l6,	%g2,	%i2
	xnor	%o1,	%i0,	%l5
	srax	%l2,	%l0,	%o7
	bge,a,pt	%icc,	loop_1092
	fandnot1	%f26,	%f30,	%f30
	tle	%xcc,	0x2
	tcs	%icc,	0x2
loop_1092:
	movgu	%xcc,	%o0,	%g4
	movg	%xcc,	%o3,	%i1
	brnz	%g6,	loop_1093
	ta	%xcc,	0x1
	movvs	%xcc,	%l3,	%l4
	umulcc	%i3,	%g5,	%i7
loop_1093:
	move	%icc,	%g1,	%i6
	srax	%l1,	%g7,	%o6
	sllx	%o5,	%o4,	%g3
	fmovrslz	%i4,	%f24,	%f22
	edge16ln	%o2,	%l6,	%g2
	fpadd16s	%f19,	%f18,	%f30
	tcs	%icc,	0x7
	tvc	%icc,	0x2
	tn	%icc,	0x0
	orcc	%i5,	0x135B,	%i2
	fbg,a	%fcc3,	loop_1094
	add	%i0,	0x0BB6,	%l5
	sethi	0x06BC,	%o1
	set	0x40, %g4
	stwa	%l0,	[%l7 + %g4] 0x23
	membar	#Sync
loop_1094:
	movcc	%xcc,	%o7,	%l2
	brlz,a	%g4,	loop_1095
	orn	%o0,	0x13BF,	%i1
	xor	%o3,	%l3,	%l4
	addc	%i3,	0x1E2D,	%g5
loop_1095:
	edge16n	%i7,	%g1,	%i6
	movpos	%xcc,	%l1,	%g6
	or	%o6,	0x1EC9,	%g7
	movrgz	%o4,	%o5,	%i4
	sth	%o2,	[%l7 + 0x64]
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16l	%g3,	%l6,	%i5
	tgu	%icc,	0x4
	fandnot1s	%f16,	%f21,	%f1
	srax	%i2,	%i0,	%g2
	tsubcctv	%l5,	0x1CB2,	%l0
	movle	%icc,	%o7,	%l2
	movvc	%xcc,	%o1,	%o0
	addc	%g4,	%i1,	%l3
	add	%o3,	0x14A0,	%l4
	fbl	%fcc2,	loop_1096
	tvc	%icc,	0x5
	fblg	%fcc2,	loop_1097
	andncc	%g5,	%i7,	%i3
loop_1096:
	subccc	%i6,	0x0DF5,	%g1
	fpack32	%f8,	%f20,	%f24
loop_1097:
	edge16ln	%l1,	%o6,	%g6
	set	0x42, %l1
	stba	%o4,	[%l7 + %l1] 0x88
	fxnors	%f16,	%f7,	%f28
	orcc	%g7,	0x16B4,	%i4
	srax	%o2,	%g3,	%o5
	edge32l	%l6,	%i5,	%i0
	srlx	%g2,	0x00,	%l5
	smul	%l0,	%i2,	%l2
	nop
	setx	0x2047E8C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	move	%icc,	%o1,	%o7
	taddcc	%g4,	%i1,	%l3
	wr	%g0,	0x80,	%asi
	stha	%o0,	[%l7 + 0x76] %asi
	sll	%o3,	0x14,	%g5
	fbug,a	%fcc1,	loop_1098
	udiv	%l4,	0x19AB,	%i7
	addccc	%i3,	%i6,	%l1
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f26
loop_1098:
	movre	%o6,	%g6,	%g1
	ld	[%l7 + 0x30],	%f23
	fbne,a	%fcc0,	loop_1099
	fbule	%fcc3,	loop_1100
	tgu	%xcc,	0x2
	bne,pn	%xcc,	loop_1101
loop_1099:
	taddcctv	%o4,	0x05AC,	%g7
loop_1100:
	fpsub32	%f0,	%f6,	%f6
	xorcc	%i4,	%g3,	%o2
loop_1101:
	nop
	setx	0x2831FC5EE51830F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f24
	fble,a	%fcc0,	loop_1102
	movrlez	%o5,	%i5,	%i0
	orcc	%l6,	%l5,	%l0
	nop
	setx	0x0877C803133A2883,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x327ADAB070813A0A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f18,	%f14
loop_1102:
	movle	%icc,	%g2,	%l2
	lduw	[%l7 + 0x08],	%i2
	subcc	%o7,	%o1,	%g4
	fba	%fcc1,	loop_1103
	tge	%icc,	0x2
	fandnot1s	%f29,	%f19,	%f22
	udivx	%i1,	0x0457,	%l3
loop_1103:
	xnorcc	%o3,	%o0,	%l4
	edge16	%i7,	%i3,	%g5
	umul	%l1,	%o6,	%g6
	movrlz	%g1,	%i6,	%o4
	andn	%i4,	0x1E8F,	%g7
	srlx	%g3,	%o2,	%i5
	stbar
	movvs	%icc,	%i0,	%l6
	smulcc	%o5,	0x1DFB,	%l5
	umul	%g2,	%l2,	%l0
	swap	[%l7 + 0x48],	%o7
	movne	%xcc,	%o1,	%g4
	movneg	%icc,	%i1,	%l3
	set	0x58, %l4
	stxa	%o3,	[%l7 + %l4] 0x2b
	membar	#Sync
	fmovspos	%icc,	%f26,	%f7
	addcc	%i2,	%l4,	%o0
	fmul8ulx16	%f16,	%f20,	%f12
	addcc	%i3,	0x0584,	%g5
	ble	loop_1104
	bvc,a,pt	%icc,	loop_1105
	tgu	%xcc,	0x0
	edge32	%l1,	%i7,	%o6
loop_1104:
	membar	0x1E
loop_1105:
	fmovs	%f18,	%f8
	edge8	%g6,	%i6,	%o4
	sra	%g1,	0x17,	%g7
	xor	%g3,	%o2,	%i5
	taddcc	%i4,	%i0,	%l6
	sdivcc	%l5,	0x0D4C,	%g2
	fmovrde	%l2,	%f28,	%f14
	nop
	setx loop_1106, %l0, %l1
	jmpl %l1, %o5
	movge	%xcc,	%o7,	%l0
	bcc,pn	%xcc,	loop_1107
	xnor	%g4,	%o1,	%l3
loop_1106:
	nop
	setx	0xF2D91807,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x0270F582,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f11,	%f7
	orcc	%o3,	%i1,	%l4
loop_1107:
	fblg	%fcc2,	loop_1108
	alignaddrl	%i2,	%o0,	%i3
	edge8ln	%g5,	%l1,	%o6
	set	0x4D, %i4
	ldsba	[%l7 + %i4] 0x18,	%i7
loop_1108:
	tcs	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xeb,	%asi
	stba	%i6,	[%l7 + 0x27] %asi
	membar	#Sync
	fabsd	%f10,	%f22
	popc	0x1B36,	%o4
	edge16n	%g6,	%g1,	%g3
	tpos	%icc,	0x2
	edge8	%g7,	%o2,	%i4
	movrgez	%i5,	%l6,	%l5
	tle	%xcc,	0x5
	movrlez	%g2,	%i0,	%l2
	wr	%g0,	0x22,	%asi
	stha	%o7,	[%l7 + 0x46] %asi
	membar	#Sync
	tpos	%xcc,	0x3
	fmul8x16al	%f13,	%f28,	%f12
	movrlz	%o5,	%g4,	%o1
	srax	%l3,	0x13,	%l0
	swap	[%l7 + 0x58],	%o3
	movvc	%xcc,	%l4,	%i2
	edge16l	%i1,	%o0,	%g5
	fblg	%fcc2,	loop_1109
	movn	%icc,	%l1,	%i3
	fandnot2s	%f1,	%f3,	%f15
	fornot2s	%f2,	%f22,	%f21
loop_1109:
	addcc	%i7,	%i6,	%o4
	array16	%o6,	%g6,	%g3
	taddcctv	%g1,	0x14BA,	%g7
	fbl	%fcc2,	loop_1110
	udiv	%o2,	0x122A,	%i5
	set	0x4C, %g6
	ldswa	[%l7 + %g6] 0x10,	%l6
loop_1110:
	edge8ln	%i4,	%g2,	%l5
	nop
	setx	0x88909382,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xC88A2331,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f29,	%f28
	udivcc	%l2,	0x040D,	%i0
	alignaddr	%o7,	%o5,	%o1
	xor	%g4,	0x1B10,	%l0
	array32	%o3,	%l4,	%i2
	ldd	[%l7 + 0x68],	%f20
	stx	%i1,	[%l7 + 0x68]
	nop
	setx	0x3476BEFE18A2A4AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCDBFC01A6B6F210D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f12,	%f4
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f31
	alignaddr	%l3,	%o0,	%g5
	movne	%xcc,	%i3,	%i7
	sra	%i6,	%o4,	%l1
	udivx	%g6,	0x027B,	%o6
	fbl	%fcc2,	loop_1111
	fmovsle	%icc,	%f22,	%f11
	tle	%icc,	0x6
	srl	%g3,	%g1,	%g7
loop_1111:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%o2
	fcmpgt32	%f28,	%f2,	%l6
	fmovsge	%xcc,	%f30,	%f16
	movpos	%xcc,	%i5,	%g2
	subc	%l5,	0x0B65,	%i4
	edge8n	%i0,	%o7,	%o5
	fble	%fcc2,	loop_1112
	movcc	%icc,	%o1,	%l2
	tleu	%icc,	0x0
	movn	%icc,	%l0,	%g4
loop_1112:
	and	%l4,	%i2,	%o3
	nop
	setx	loop_1113,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq16	%f24,	%f4,	%i1
	tsubcctv	%o0,	0x0FD4,	%g5
	set	0x2A, %i5
	lduha	[%l7 + %i5] 0x15,	%l3
loop_1113:
	sra	%i7,	%i3,	%o4
	xnor	%i6,	%l1,	%o6
	edge8	%g6,	%g1,	%g3
	movl	%xcc,	%o2,	%g7
	te	%xcc,	0x1
	umulcc	%i5,	0x0003,	%g2
	fxors	%f5,	%f16,	%f4
	umulcc	%l5,	%i4,	%i0
	tleu	%xcc,	0x7
	fmovsl	%xcc,	%f21,	%f2
	movcs	%icc,	%o7,	%l6
	stx	%o1,	[%l7 + 0x40]
	and	%l2,	%l0,	%o5
	tle	%xcc,	0x4
	tvc	%icc,	0x7
	bn,pn	%icc,	loop_1114
	fmovdpos	%icc,	%f26,	%f17
	ldstub	[%l7 + 0x21],	%g4
	subccc	%l4,	0x11B0,	%o3
loop_1114:
	fbo,a	%fcc3,	loop_1115
	nop
	fitod	%f12,	%f16
	alignaddr	%i2,	%o0,	%g5
	movge	%xcc,	%i1,	%i7
loop_1115:
	movvc	%xcc,	%i3,	%o4
	fandnot2s	%f1,	%f13,	%f29
	movleu	%xcc,	%i6,	%l3
	fnot2	%f24,	%f12
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f16
	edge8l	%o6,	%g6,	%l1
	movne	%xcc,	%g3,	%g1
	nop
	fitos	%f5,	%f10
	fstox	%f10,	%f30
	set	0x28, %l2
	lduha	[%l7 + %l2] 0x04,	%o2
	ldd	[%l7 + 0x18],	%f26
	udiv	%i5,	0x17B3,	%g2
	orncc	%g7,	0x1C13,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l5
	bneg	%icc,	loop_1116
	srax	%o7,	%l6,	%i0
	nop
	setx	0x421E2A39,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xC7360FFE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f23,	%f21
	fxor	%f12,	%f22,	%f0
loop_1116:
	ldd	[%l7 + 0x38],	%f6
	taddcctv	%l2,	%o1,	%l0
	edge32	%g4,	%o5,	%l4
	ldx	[%l7 + 0x30],	%i2
	fmuld8ulx16	%f31,	%f27,	%f16
	fbe	%fcc2,	loop_1117
	orn	%o3,	%o0,	%i1
	movrlz	%i7,	%i3,	%o4
	tvc	%icc,	0x0
loop_1117:
	edge16l	%i6,	%l3,	%g5
	movrgez	%g6,	0x3B7,	%o6
	orcc	%l1,	%g3,	%o2
	fmovdneg	%icc,	%f27,	%f14
	bneg,a	loop_1118
	brlz	%i5,	loop_1119
	orn	%g2,	%g7,	%g1
	array8	%l5,	%i4,	%l6
loop_1118:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1119:
	udivx	%o7,	0x06BD,	%i0
	sll	%l2,	%o1,	%l0
	movg	%xcc,	%g4,	%o5
	edge32	%i2,	%o3,	%o0
	nop
	setx	0xA0A665EE105EE5A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	sdiv	%i1,	0x15EE,	%i7
	nop
	setx	0x369E7DC7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xD64B9737,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f17,	%f10
	fbne	%fcc2,	loop_1120
	fmovrdgez	%i3,	%f30,	%f30
	andn	%l4,	%o4,	%i6
	movgu	%icc,	%g5,	%g6
loop_1120:
	nop
	wr	%g0,	0x89,	%asi
	stha	%l3,	[%l7 + 0x46] %asi
	tvs	%icc,	0x5
	edge32ln	%l1,	%o6,	%g3
	movne	%xcc,	%i5,	%o2
	fbe,a	%fcc3,	loop_1121
	srl	%g7,	0x19,	%g2
	movl	%xcc,	%g1,	%l5
	movge	%xcc,	%i4,	%o7
loop_1121:
	fcmple16	%f12,	%f20,	%l6
	ldx	[%l7 + 0x10],	%i0
	fbge	%fcc1,	loop_1122
	umulcc	%l2,	%l0,	%o1
	udivx	%o5,	0x0A38,	%i2
	fmovrslez	%o3,	%f21,	%f8
loop_1122:
	sdivcc	%g4,	0x1F64,	%o0
	xorcc	%i1,	%i3,	%i7
	edge16ln	%l4,	%i6,	%o4
	movne	%xcc,	%g5,	%l3
	edge32ln	%l1,	%o6,	%g6
	popc	%i5,	%g3
	movrlz	%g7,	%o2,	%g1
	or	%l5,	0x19E2,	%g2
	fbne	%fcc2,	loop_1123
	bvc	%icc,	loop_1124
	nop
	fitos	%f0,	%f10
	fstod	%f10,	%f16
	fmuld8ulx16	%f1,	%f4,	%f14
loop_1123:
	fbl,a	%fcc1,	loop_1125
loop_1124:
	for	%f22,	%f16,	%f26
	edge16l	%o7,	%i4,	%i0
	alignaddrl	%l2,	%l0,	%o1
loop_1125:
	fpsub32s	%f30,	%f5,	%f15
	fbul,a	%fcc2,	loop_1126
	tgu	%icc,	0x6
	edge8n	%o5,	%i2,	%o3
	tn	%xcc,	0x1
loop_1126:
	swap	[%l7 + 0x10],	%l6
	fpadd16	%f26,	%f18,	%f4
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%g4
	move	%xcc,	%o0,	%i1
	fblg	%fcc1,	loop_1127
	tne	%xcc,	0x3
	tl	%icc,	0x0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%l4
loop_1127:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x40] %asi,	%i7
	movg	%xcc,	%i6,	%g5
	fmovde	%icc,	%f15,	%f22
	xorcc	%l3,	%o4,	%o6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l1
	fzero	%f10
	andncc	%g6,	%g3,	%g7
	orn	%o2,	%g1,	%i5
	fones	%f14
	nop
	setx	0xF635EA9F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xF11AEDA3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f11,	%f28
	taddcc	%l5,	%g2,	%o7
	tgu	%icc,	0x1
	fexpand	%f18,	%f26
	movne	%icc,	%i4,	%i0
	orcc	%l2,	%l0,	%o1
	fzero	%f28
	movrne	%o5,	0x006,	%o3
	tge	%icc,	0x7
	udivx	%l6,	0x0BE2,	%i2
	bvc,pn	%xcc,	loop_1128
	fbule	%fcc2,	loop_1129
	fexpand	%f26,	%f10
	stbar
loop_1128:
	movl	%icc,	%o0,	%g4
loop_1129:
	umul	%i1,	0x0EF3,	%l4
	movn	%xcc,	%i3,	%i6
	lduw	[%l7 + 0x14],	%i7
	edge16n	%l3,	%g5,	%o4
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f23
	movleu	%xcc,	%l1,	%g6
	tcs	%xcc,	0x3
	edge8	%o6,	%g7,	%o2
	andcc	%g3,	%g1,	%i5
	mova	%icc,	%l5,	%o7
	movrgz	%i4,	%i0,	%l2
	fnegs	%f7,	%f28
	edge32n	%g2,	%l0,	%o1
	movl	%xcc,	%o3,	%l6
	sll	%o5,	0x15,	%o0
	xnor	%g4,	0x06D0,	%i1
	for	%f0,	%f6,	%f6
	nop
	setx	loop_1130,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovd	%f4,	%f8
	bpos,a	loop_1131
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1130:
	ble	loop_1132
	fmovsle	%icc,	%f8,	%f30
loop_1131:
	ta	%icc,	0x6
	popc	0x0565,	%l4
loop_1132:
	orn	%i2,	%i6,	%i3
	fpadd32	%f24,	%f12,	%f6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x61] %asi,	%l3
	taddcc	%i7,	%o4,	%l1
	call	loop_1133
	fandnot1	%f10,	%f26,	%f22
	set	0x64, %g2
	sta	%f24,	[%l7 + %g2] 0x15
loop_1133:
	addcc	%g6,	0x138A,	%g5
	umul	%g7,	%o6,	%o2
	stw	%g3,	[%l7 + 0x40]
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0x2
	nop
	fitos	%f12,	%f25
	fstox	%f25,	%f14
	fxtos	%f14,	%f25
	fmovsn	%xcc,	%f28,	%f19
	alignaddrl	%l5,	%g1,	%i4
	ldstub	[%l7 + 0x41],	%o7
	bvs,pn	%icc,	loop_1134
	mulx	%l2,	%g2,	%i0
	umulcc	%l0,	0x1BD1,	%o1
	bg,pn	%xcc,	loop_1135
loop_1134:
	bg,a	%icc,	loop_1136
	fmovdge	%xcc,	%f28,	%f0
	fnegd	%f2,	%f6
loop_1135:
	smulcc	%l6,	0x0DC8,	%o3
loop_1136:
	fmuld8ulx16	%f9,	%f25,	%f24
	edge32	%o0,	%g4,	%o5
	nop
	setx	0x2B626FB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x6AE2069D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f14,	%f15
	fandnot1s	%f29,	%f10,	%f6
	movl	%icc,	%l4,	%i1
	tvs	%icc,	0x0
	sth	%i6,	[%l7 + 0x12]
	ldub	[%l7 + 0x46],	%i3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l3
	edge8	%i2,	%i7,	%o4
	sll	%l1,	%g6,	%g7
	tge	%xcc,	0x7
	mulscc	%g5,	%o2,	%g3
	ldsh	[%l7 + 0x2C],	%o6
	fornot2s	%f29,	%f14,	%f6
	edge16	%l5,	%i5,	%g1
	ldsw	[%l7 + 0x30],	%i4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x08] %asi,	%o7
	sra	%g2,	0x13,	%l2
	edge32n	%i0,	%l0,	%o1
	edge8l	%o3,	%o0,	%l6
	tleu	%icc,	0x3
	lduw	[%l7 + 0x7C],	%o5
	add	%g4,	%i1,	%l4
	addc	%i6,	0x12D5,	%l3
	edge8l	%i3,	%i2,	%o4
	array32	%i7,	%l1,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g5,	%o2,	%g3
	brgz	%g6,	loop_1137
	fone	%f4
	bshuffle	%f22,	%f0,	%f6
	srlx	%o6,	0x1B,	%i5
loop_1137:
	addcc	%g1,	0x0613,	%i4
	fsrc1s	%f7,	%f5
	brgez	%o7,	loop_1138
	fmovscc	%icc,	%f11,	%f22
	fmuld8sux16	%f1,	%f5,	%f24
	fpsub16s	%f31,	%f4,	%f8
loop_1138:
	fbge,a	%fcc0,	loop_1139
	movg	%xcc,	%l5,	%l2
	tn	%icc,	0x7
	fmovdneg	%xcc,	%f1,	%f25
loop_1139:
	xnorcc	%g2,	%i0,	%l0
	fmovse	%icc,	%f28,	%f5
	udivx	%o1,	0x0C09,	%o0
	udiv	%o3,	0x1C66,	%o5
	fmovrse	%g4,	%f11,	%f4
	nop
	fitod	%f6,	%f12
	fdtos	%f12,	%f25
	subcc	%i1,	%l4,	%l6
	nop
	fitos	%f0,	%f2
	fstox	%f2,	%f10
	sll	%l3,	%i6,	%i2
	movne	%icc,	%i3,	%o4
	fbge	%fcc2,	loop_1140
	ldsh	[%l7 + 0x4A],	%l1
	sllx	%i7,	0x15,	%g7
	ble,pn	%icc,	loop_1141
loop_1140:
	movcc	%xcc,	%g5,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o2,	0x048,	%o6
loop_1141:
	fnand	%f16,	%f26,	%f10
	bn,pn	%xcc,	loop_1142
	edge8n	%g6,	%i5,	%g1
	movne	%icc,	%i4,	%l5
	addccc	%o7,	0x174F,	%g2
loop_1142:
	movpos	%icc,	%l2,	%i0
	tcs	%xcc,	0x0
	edge32l	%l0,	%o1,	%o3
	sdivx	%o5,	0x1FF8,	%g4
	tne	%xcc,	0x1
	xor	%i1,	%o0,	%l4
	fcmple32	%f16,	%f6,	%l3
	array8	%l6,	%i2,	%i3
	srl	%i6,	0x0A,	%o4
	fbge	%fcc1,	loop_1143
	fornot1s	%f28,	%f3,	%f27
	stbar
	edge16l	%l1,	%g7,	%i7
loop_1143:
	umulcc	%g5,	0x05DA,	%o2
	sll	%g3,	0x05,	%g6
	tcc	%xcc,	0x5
	andncc	%o6,	%g1,	%i5
	addcc	%i4,	%o7,	%l5
	tcs	%xcc,	0x4
	stx	%l2,	[%l7 + 0x38]
	orncc	%i0,	%g2,	%l0
	stb	%o3,	[%l7 + 0x47]
	edge8n	%o1,	%o5,	%i1
	fbu	%fcc0,	loop_1144
	nop
	fitod	%f8,	%f18
	fdtoi	%f18,	%f30
	st	%f6,	[%l7 + 0x38]
	sra	%o0,	%l4,	%g4
loop_1144:
	brgez	%l6,	loop_1145
	nop
	setx	0xDEA1409324440E99,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f18
	nop
	setx loop_1146, %l0, %l1
	jmpl %l1, %l3
	nop
	setx	0x907CB146,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
loop_1145:
	ld	[%l7 + 0x38],	%f16
	tcc	%icc,	0x4
loop_1146:
	sub	%i2,	%i6,	%o4
	set	0x10, %g7
	swapa	[%l7 + %g7] 0x0c,	%i3
	tvc	%xcc,	0x5
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x88,	%l0
	array32	%i7,	%g7,	%g5
	smul	%o2,	0x058F,	%g3
	tn	%xcc,	0x1
	fornot2s	%f4,	%f15,	%f21
	fmuld8ulx16	%f13,	%f27,	%f14
	nop
	setx	0x8D22AF3B694F3A8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB60DD2C1F9F05C66,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f8,	%f12
	taddcc	%g6,	0x1A87,	%o6
	taddcctv	%i5,	0x02B4,	%g1
	bcc,a	%xcc,	loop_1147
	fmovdne	%icc,	%f22,	%f24
	fmul8ulx16	%f20,	%f12,	%f12
	movle	%xcc,	%i4,	%o7
loop_1147:
	srlx	%l5,	%l2,	%g2
	edge32n	%i0,	%o3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc0,	loop_1148
	ldd	[%l7 + 0x20],	%o0
	fnot2s	%f7,	%f12
	srax	%o5,	0x12,	%o0
loop_1148:
	nop
	set	0x10, %o3
	stw	%l4,	[%l7 + %o3]
	andncc	%i1,	%g4,	%l3
	tgu	%icc,	0x3
	addc	%l6,	%i2,	%o4
	call	loop_1149
	fpmerge	%f19,	%f0,	%f14
	xor	%i3,	0x1A4E,	%l1
	fmovsvc	%xcc,	%f30,	%f31
loop_1149:
	tge	%icc,	0x0
	nop
	setx	0xE60073762B59633D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f16
	fnot1	%f30,	%f20
	movrgez	%i7,	0x18F,	%g7
	xor	%g5,	%i6,	%g3
	movge	%icc,	%g6,	%o2
	fpsub32	%f4,	%f20,	%f28
	orn	%o6,	%i5,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x4
	tg	%icc,	0x5
	fbu,a	%fcc2,	loop_1150
	fcmpeq16	%f20,	%f10,	%o7
	fbo	%fcc2,	loop_1151
	fmovsvc	%icc,	%f6,	%f24
loop_1150:
	nop
	setx	loop_1152,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%icc,	0x1
loop_1151:
	movvc	%xcc,	%l5,	%i4
	sra	%l2,	0x1E,	%i0
loop_1152:
	bge,a	%icc,	loop_1153
	taddcc	%o3,	%l0,	%o1
	addc	%g2,	0x08BB,	%o5
	bn,a	loop_1154
loop_1153:
	sllx	%l4,	%i1,	%g4
	bn,a	loop_1155
	fbul,a	%fcc2,	loop_1156
loop_1154:
	mulscc	%l3,	0x1FE3,	%o0
	fxnors	%f12,	%f16,	%f18
loop_1155:
	orcc	%l6,	%o4,	%i3
loop_1156:
	edge32n	%l1,	%i7,	%g7
	fmovdpos	%icc,	%f8,	%f7
	fandnot1s	%f1,	%f11,	%f18
	ble,a,pt	%icc,	loop_1157
	tsubcctv	%g5,	%i6,	%g3
	mulx	%i2,	%o2,	%o6
	movle	%icc,	%g6,	%i5
loop_1157:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o7,	0x1369,	%l5
	tne	%xcc,	0x7
	fmovsg	%icc,	%f28,	%f5
	fbuge	%fcc2,	loop_1158
	fbl	%fcc1,	loop_1159
	fbne	%fcc2,	loop_1160
	srax	%i4,	%g1,	%i0
loop_1158:
	movrne	%l2,	%l0,	%o3
loop_1159:
	nop
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x26,	%o0
loop_1160:
	movge	%xcc,	%o5,	%g2
	movgu	%icc,	%l4,	%g4
	nop
	fitos	%f10,	%f3
	sra	%i1,	0x07,	%l3
	xorcc	%l6,	%o0,	%o4
	fmovsvc	%icc,	%f15,	%f29
	fble,a	%fcc0,	loop_1161
	array16	%l1,	%i7,	%g7
	wr	%g0,	0x0c,	%asi
	sta	%f12,	[%l7 + 0x6C] %asi
loop_1161:
	ta	%xcc,	0x5
	movrgz	%i3,	0x3BC,	%i6
	set	0x1D, %i3
	ldstuba	[%l7 + %i3] 0x04,	%g5
	stb	%g3,	[%l7 + 0x7B]
	movvc	%icc,	%i2,	%o6
	fmovscc	%icc,	%f18,	%f9
	ble,a,pt	%icc,	loop_1162
	mulscc	%o2,	0x0400,	%i5
	movleu	%xcc,	%o7,	%l5
	tsubcctv	%i4,	%g6,	%i0
loop_1162:
	nop
	fitos	%f24,	%f12
	tn	%xcc,	0x2
	edge32l	%l2,	%g1,	%l0
	sethi	0x13A8,	%o1
	taddcc	%o3,	0x17A9,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%g2
	subc	%i1,	0x0B5B,	%g4
	tsubcctv	%l3,	0x0588,	%l6
	fcmpgt32	%f6,	%f6,	%o4
	xor	%o0,	%l1,	%i7
	fexpand	%f1,	%f28
	xor	%g7,	%i6,	%i3
	mova	%icc,	%g5,	%g3
	bne,pt	%icc,	loop_1163
	tn	%xcc,	0x5
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f28
	tge	%xcc,	0x2
loop_1163:
	tsubcc	%o6,	%i2,	%i5
	nop
	setx	0x3A77C412,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xFC5852B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f19,	%f10
	fbule,a	%fcc0,	loop_1164
	array8	%o2,	%o7,	%i4
	orncc	%g6,	0x1652,	%l5
	nop
	fitos	%f1,	%f23
	fstox	%f23,	%f4
loop_1164:
	subccc	%l2,	%i0,	%l0
	bcc,a	%icc,	loop_1165
	tcc	%xcc,	0x7
	sra	%o1,	%o3,	%o5
	xor	%g1,	%g2,	%l4
loop_1165:
	movrgz	%i1,	0x190,	%l3
	tl	%icc,	0x7
	fmovse	%xcc,	%f26,	%f2
	array16	%l6,	%g4,	%o0
	tpos	%xcc,	0x3
	smulcc	%l1,	0x0EA7,	%o4
	ldx	[%l7 + 0x28],	%g7
	bne	loop_1166
	fmovrsgz	%i7,	%f9,	%f22
	edge32n	%i3,	%i6,	%g3
	fmovsg	%icc,	%f22,	%f15
loop_1166:
	brgez,a	%o6,	loop_1167
	fpadd32	%f4,	%f4,	%f6
	fnors	%f20,	%f30,	%f14
	alignaddrl	%i2,	%g5,	%i5
loop_1167:
	stb	%o2,	[%l7 + 0x1A]
	movvs	%icc,	%o7,	%g6
	srl	%i4,	0x03,	%l2
	tneg	%icc,	0x0
	srl	%i0,	0x0F,	%l5
	brnz	%o1,	loop_1168
	popc	%l0,	%o3
	bvc	%icc,	loop_1169
	umulcc	%o5,	0x0299,	%g1
loop_1168:
	bpos,pt	%xcc,	loop_1170
	fmovscc	%icc,	%f10,	%f13
loop_1169:
	fmovs	%f11,	%f14
	set	0x58, %o0
	stwa	%l4,	[%l7 + %o0] 0x15
loop_1170:
	edge32ln	%g2,	%i1,	%l3
	edge8	%g4,	%o0,	%l1
	movvs	%xcc,	%o4,	%g7
	sllx	%l6,	0x17,	%i7
	bn,a,pt	%xcc,	loop_1171
	ldsh	[%l7 + 0x5A],	%i3
	stb	%g3,	[%l7 + 0x24]
	tne	%icc,	0x7
loop_1171:
	alignaddr	%i6,	%i2,	%o6
	sir	0x1030
	srlx	%g5,	0x1E,	%o2
	movneg	%xcc,	%o7,	%g6
	fzeros	%f27
	tleu	%xcc,	0x5
	fors	%f6,	%f29,	%f4
	fnot2	%f0,	%f28
	subc	%i4,	0x1F09,	%i5
	fcmple32	%f6,	%f2,	%l2
	subcc	%l5,	0x147D,	%o1
	mulx	%i0,	0x1D66,	%o3
	movle	%icc,	%o5,	%l0
	or	%l4,	%g1,	%i1
	movrlez	%l3,	%g2,	%o0
	move	%icc,	%g4,	%o4
	nop
	fitos	%f8,	%f28
	fstox	%f28,	%f8
	tneg	%xcc,	0x6
	andncc	%l1,	%g7,	%i7
	movrlz	%i3,	%g3,	%i6
	edge8n	%i2,	%l6,	%g5
	brlz	%o6,	loop_1172
	fbn,a	%fcc0,	loop_1173
	fcmpgt32	%f26,	%f26,	%o2
	fmovrsgez	%g6,	%f17,	%f23
loop_1172:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i4
loop_1173:
	edge32l	%i5,	%l2,	%o7
	fandnot1	%f30,	%f18,	%f16
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l5
	sdivcc	%o1,	0x11D5,	%i0
	fpmerge	%f27,	%f20,	%f30
	sllx	%o3,	0x0D,	%o5
	tsubcc	%l4,	%g1,	%l0
	tn	%icc,	0x0
	fbug	%fcc1,	loop_1174
	umulcc	%i1,	0x1818,	%l3
	orncc	%g2,	0x09A5,	%o0
	taddcc	%g4,	0x0342,	%o4
loop_1174:
	nop
	set	0x60, %o5
	sta	%f29,	[%l7 + %o5] 0x0c
	move	%icc,	%g7,	%i7
	bvc	%xcc,	loop_1175
	orn	%i3,	0x1383,	%l1
	array8	%g3,	%i2,	%i6
	te	%xcc,	0x5
loop_1175:
	movne	%icc,	%l6,	%g5
	swap	[%l7 + 0x68],	%o2
	fmovrsgez	%g6,	%f7,	%f26
	stw	%o6,	[%l7 + 0x48]
	tgu	%xcc,	0x3
	edge16l	%i5,	%l2,	%o7
	movne	%icc,	%l5,	%o1
	tl	%xcc,	0x2
	fpack16	%f4,	%f27
	movrgz	%i0,	%i4,	%o3
	edge8	%o5,	%l4,	%l0
	andcc	%g1,	%l3,	%i1
	swap	[%l7 + 0x10],	%g2
	udiv	%g4,	0x0595,	%o0
	sdiv	%o4,	0x1329,	%g7
	tvc	%xcc,	0x6
	fcmple16	%f16,	%f12,	%i3
	nop
	setx	loop_1176,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%i7,	%g3,	%l1
	fmovsneg	%icc,	%f20,	%f2
	nop
	setx	0x3CE9AB00CEFFC14E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x19DBEF55A339ACDF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f4,	%f0
loop_1176:
	edge8n	%i2,	%l6,	%g5
	set	0x3C, %o4
	stwa	%i6,	[%l7 + %o4] 0x18
	nop
	set	0x0E, %g1
	ldsb	[%l7 + %g1],	%g6
	nop
	fitos	%f12,	%f29
	fstox	%f29,	%f16
	edge16ln	%o6,	%o2,	%l2
	movg	%icc,	%o7,	%l5
	for	%f18,	%f14,	%f24
	tn	%xcc,	0x2
	swap	[%l7 + 0x14],	%i5
	set	0x6C, %i2
	ldsba	[%l7 + %i2] 0x88,	%i0
	fmovsleu	%icc,	%f30,	%f20
	fbue,a	%fcc2,	loop_1177
	movneg	%xcc,	%o1,	%i4
	alignaddrl	%o5,	%l4,	%o3
	sdivcc	%l0,	0x0E76,	%l3
loop_1177:
	fba	%fcc2,	loop_1178
	and	%i1,	%g2,	%g1
	ldsh	[%l7 + 0x40],	%o0
	nop
	setx loop_1179, %l0, %l1
	jmpl %l1, %g4
loop_1178:
	tleu	%xcc,	0x4
	tne	%icc,	0x1
	array16	%g7,	%o4,	%i7
loop_1179:
	bl	loop_1180
	movcc	%xcc,	%g3,	%l1
	movvc	%xcc,	%i2,	%i3
	tsubcc	%l6,	%g5,	%g6
loop_1180:
	addccc	%i6,	0x05A2,	%o2
	or	%o6,	0x0E34,	%l2
	sdivcc	%o7,	0x1BB4,	%l5
	fmovdcc	%icc,	%f28,	%f0
	taddcc	%i0,	%o1,	%i4
	fnegd	%f20,	%f10
	fbu,a	%fcc2,	loop_1181
	tvc	%icc,	0x5
	udiv	%i5,	0x0861,	%l4
	tneg	%icc,	0x7
loop_1181:
	fmovsle	%xcc,	%f2,	%f2
	bg,a	loop_1182
	tg	%xcc,	0x4
	nop
	setx	loop_1183,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x26
loop_1182:
	subcc	%o5,	%o3,	%l0
	edge8n	%i1,	%l3,	%g2
loop_1183:
	fpack32	%f0,	%f18,	%f18
	movre	%o0,	0x399,	%g4
	swap	[%l7 + 0x40],	%g1
	array8	%g7,	%i7,	%g3
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f11
	andcc	%o4,	%i2,	%l1
	te	%xcc,	0x0
	membar	0x30
	tneg	%icc,	0x0
	tneg	%xcc,	0x0
	fmul8x16	%f25,	%f16,	%f28
	nop
	fitod	%f11,	%f16
	fxor	%f26,	%f14,	%f4
	sllx	%i3,	%g5,	%l6
	array8	%i6,	%g6,	%o2
	sll	%l2,	%o7,	%l5
	udivx	%o6,	0x1CC3,	%o1
	te	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i4,	0x072A,	%i5
	te	%xcc,	0x3
	membar	0x72
	nop
	setx	0xF5FEBB940E63F975,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x38F2E404543E58D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f14,	%f12
	movrlez	%l4,	0x112,	%o5
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o3
	fcmpeq16	%f2,	%f6,	%l0
	umul	%i0,	%l3,	%g2
	fcmple16	%f0,	%f22,	%i1
	orncc	%o0,	0x1466,	%g1
	fba,a	%fcc3,	loop_1184
	orn	%g4,	0x0DF7,	%i7
	fmovda	%xcc,	%f25,	%f7
	subccc	%g7,	%o4,	%g3
loop_1184:
	umulcc	%l1,	0x1DFF,	%i2
	ble,pn	%xcc,	loop_1185
	tvc	%xcc,	0x4
	andn	%i3,	%g5,	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x19,	%g6,	%o2
loop_1185:
	subccc	%l2,	%o7,	%l6
	tn	%icc,	0x7
	fmovsn	%icc,	%f4,	%f15
	brlz	%l5,	loop_1186
	fmuld8sux16	%f0,	%f11,	%f18
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f16
	and	%o6,	%o1,	%i4
loop_1186:
	movpos	%xcc,	%l4,	%o5
	tsubcctv	%i5,	%o3,	%i0
	fmovdl	%xcc,	%f1,	%f12
	subc	%l0,	0x0767,	%g2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	array16	%l3,	%g1,	%o0
	fmovse	%icc,	%f28,	%f11
	edge32ln	%i7,	%g4,	%g7
	ldsb	[%l7 + 0x36],	%g3
	fpadd16s	%f23,	%f5,	%f12
	tn	%xcc,	0x1
	edge16ln	%l1,	%i2,	%o4
	xorcc	%i3,	0x07ED,	%g5
	alignaddrl	%g6,	%o2,	%i6
	movvc	%icc,	%l2,	%o7
	bne,a,pt	%icc,	loop_1187
	edge16ln	%l6,	%l5,	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%i4
loop_1187:
	movl	%xcc,	%o5,	%i5
	set	0x36, %l3
	stha	%l4,	[%l7 + %l3] 0x15
	ldsw	[%l7 + 0x40],	%o3
	movrgz	%l0,	0x185,	%g2
	set	0x08, %l5
	swapa	[%l7 + %l5] 0x89,	%i0
	andncc	%l3,	%i1,	%g1
	nop
	fitos	%f5,	%f25
	fstod	%f25,	%f12
	std	%f22,	[%l7 + 0x70]
	nop
	setx	0x5F39E1A2D18AD176,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE4FACD245AEA8D9C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f16,	%f14
	edge32	%i7,	%o0,	%g4
	te	%xcc,	0x2
	fcmpgt32	%f22,	%f0,	%g7
	movneg	%xcc,	%g3,	%l1
	tgu	%icc,	0x3
	edge8n	%i2,	%i3,	%o4
	alignaddrl	%g5,	%o2,	%i6
	fmovrsne	%g6,	%f2,	%f17
	set	0x4E, %g5
	ldsha	[%l7 + %g5] 0x89,	%o7
	movleu	%xcc,	%l6,	%l2
	te	%xcc,	0x2
	edge32n	%l5,	%o1,	%o6
	nop
	setx	loop_1188,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%i4,	0x1B,	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%o3
loop_1188:
	tneg	%xcc,	0x5
	edge8l	%l0,	%g2,	%i0
	addcc	%l3,	%i1,	%g1
	tne	%xcc,	0x7
	xorcc	%o5,	0x0493,	%i7
	orn	%o0,	%g4,	%g7
	nop
	setx	0x9F963CEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f6
	smul	%g3,	%i2,	%l1
	smulcc	%o4,	0x0D2E,	%i3
	alignaddr	%o2,	%i6,	%g5
	andncc	%o7,	%l6,	%g6
	ld	[%l7 + 0x48],	%f23
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x28] %asi,	%l5
	nop
	setx loop_1189, %l0, %l1
	jmpl %l1, %l2
	flush	%l7 + 0x38
	set	0x66, %g3
	lduha	[%l7 + %g3] 0x80,	%o1
loop_1189:
	tvc	%icc,	0x7
	bne	loop_1190
	movgu	%xcc,	%i4,	%i5
	ldsw	[%l7 + 0x4C],	%l4
	brlz,a	%o6,	loop_1191
loop_1190:
	fnegd	%f26,	%f10
	membar	0x70
	brgz,a	%l0,	loop_1192
loop_1191:
	fblg	%fcc2,	loop_1193
	udiv	%g2,	0x1616,	%i0
	fbuge,a	%fcc1,	loop_1194
loop_1192:
	movneg	%icc,	%l3,	%o3
loop_1193:
	orn	%i1,	0x1968,	%o5
	movpos	%xcc,	%i7,	%o0
loop_1194:
	subc	%g4,	0x0762,	%g7
	udivcc	%g3,	0x1949,	%g1
	ba,a	%xcc,	loop_1195
	add	%i2,	0x012A,	%o4
	fsrc1	%f8,	%f30
	set	0x31, %o2
	ldstuba	[%l7 + %o2] 0x18,	%l1
loop_1195:
	subc	%o2,	%i6,	%i3
	fmovsle	%xcc,	%f8,	%f7
	edge32l	%o7,	%l6,	%g6
	popc	0x0E10,	%l5
	movpos	%icc,	%l2,	%o1
	addcc	%i4,	0x05CB,	%i5
	mulscc	%g5,	%l4,	%l0
	movrgz	%g2,	0x38A,	%o6
	membar	0x51
	tne	%icc,	0x6
	edge16ln	%l3,	%o3,	%i1
	taddcctv	%o5,	%i0,	%o0
	fmovdne	%icc,	%f10,	%f30
	movrlez	%i7,	0x226,	%g4
	fbn	%fcc3,	loop_1196
	movrgz	%g7,	%g1,	%i2
	movrne	%o4,	0x218,	%l1
	fand	%f10,	%f18,	%f30
loop_1196:
	ble,pt	%xcc,	loop_1197
	brlz	%g3,	loop_1198
	ba,a,pn	%xcc,	loop_1199
	edge16l	%i6,	%i3,	%o7
loop_1197:
	std	%f26,	[%l7 + 0x08]
loop_1198:
	orn	%o2,	0x13A0,	%g6
loop_1199:
	fble	%fcc3,	loop_1200
	alignaddrl	%l5,	%l2,	%l6
	fbge	%fcc0,	loop_1201
	fmovsvs	%icc,	%f25,	%f30
loop_1200:
	fmovsge	%xcc,	%f15,	%f8
	tvc	%icc,	0x5
loop_1201:
	xnor	%o1,	%i4,	%g5
	set	0x73, %i7
	stba	%i5,	[%l7 + %i7] 0x11
	brgz,a	%l4,	loop_1202
	xnor	%g2,	%o6,	%l3
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f0
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x10,	 0x1
loop_1202:
	movl	%xcc,	%o3,	%i1
	bvc,pn	%xcc,	loop_1203
	movrgz	%i0,	0x2A6,	%o0
	andn	%o5,	0x1C33,	%g4
	srl	%i7,	0x0D,	%g1
loop_1203:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i2,	%g7,	%o4
	srlx	%g3,	0x0F,	%l1
	wr	%g0,	0x0c,	%asi
	sta	%f19,	[%l7 + 0x74] %asi
	movrlez	%i3,	0x2D0,	%i6
	fbg,a	%fcc1,	loop_1204
	srl	%o7,	0x0E,	%g6
	bneg,pt	%xcc,	loop_1205
	prefetch	[%l7 + 0x58],	 0x2
loop_1204:
	andn	%l5,	%l2,	%o2
	orncc	%l6,	%i4,	%g5
loop_1205:
	srlx	%i5,	0x0C,	%o1
	movrlez	%l4,	0x2B5,	%g2
	tvs	%xcc,	0x1
	sll	%o6,	0x06,	%l3
	array8	%l0,	%i1,	%o3
	edge32l	%o0,	%o5,	%g4
	movvc	%icc,	%i0,	%i7
	fmovdvs	%icc,	%f12,	%f19
	fmovs	%f27,	%f22
	movge	%xcc,	%i2,	%g1
	fblg,a	%fcc1,	loop_1206
	edge16n	%o4,	%g3,	%l1
	edge16	%g7,	%i6,	%o7
	sethi	0x0F92,	%g6
loop_1206:
	subc	%i3,	%l5,	%o2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x40] %asi,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l6,	0x1500,	%l2
	fble,a	%fcc3,	loop_1207
	xnorcc	%i4,	0x03D9,	%g5
	tn	%xcc,	0x6
	tcs	%xcc,	0x6
loop_1207:
	fone	%f2
	movrlz	%i5,	%l4,	%o1
	brz,a	%o6,	loop_1208
	xnor	%g2,	0x05C7,	%l0
	set	0x1E, %o7
	ldsha	[%l7 + %o7] 0x15,	%l3
loop_1208:
	move	%icc,	%o3,	%o0
	tcs	%icc,	0x1
	tcc	%xcc,	0x7
	fcmpeq16	%f16,	%f6,	%i1
	sllx	%o5,	0x02,	%i0
	fors	%f6,	%f23,	%f2
	movrgez	%i7,	%g4,	%i2
	mova	%xcc,	%g1,	%g3
	tcc	%xcc,	0x1
	movcc	%icc,	%l1,	%o4
	edge16n	%i6,	%o7,	%g7
	edge8ln	%g6,	%l5,	%o2
	tsubcc	%l6,	0x0583,	%i3
	mulscc	%i4,	%g5,	%l2
	movne	%xcc,	%i5,	%o1
	stbar
	umulcc	%l4,	0x0516,	%g2
	umulcc	%o6,	%l3,	%o3
	mulx	%l0,	0x1A29,	%i1
	movne	%icc,	%o5,	%i0
	nop
	setx	loop_1209,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdn	%xcc,	%f22,	%f26
	taddcctv	%o0,	0x0B43,	%i7
	brlez,a	%i2,	loop_1210
loop_1209:
	fnands	%f10,	%f4,	%f3
	edge8ln	%g4,	%g3,	%l1
	mulscc	%g1,	%o4,	%i6
loop_1210:
	fmovsvs	%icc,	%f17,	%f17
	nop
	set	0x6C, %i1
	lduw	[%l7 + %i1],	%o7
	move	%icc,	%g7,	%l5
	brlez,a	%g6,	loop_1211
	popc	0x1FEC,	%l6
	nop
	setx	0x239D1344205E3680,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	mulx	%i3,	0x05C8,	%o2
loop_1211:
	nop
	setx	loop_1212,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%g5,	0x1F,	%l2
	array16	%i5,	%o1,	%l4
	movle	%icc,	%i4,	%g2
loop_1212:
	fcmpeq16	%f22,	%f0,	%l3
	bne,a	%icc,	loop_1213
	movn	%icc,	%o3,	%l0
	array16	%o6,	%o5,	%i1
	fmovdvs	%icc,	%f31,	%f13
loop_1213:
	sub	%o0,	%i0,	%i7
	fxors	%f20,	%f26,	%f26
	nop
	fitos	%f12,	%f13
	fstod	%f13,	%f2
	srax	%g4,	0x16,	%g3
	bvc,a	loop_1214
	fbge,a	%fcc0,	loop_1215
	fmovs	%f5,	%f1
	nop
	setx	0x74D0F7DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xCD558637,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f25,	%f13
loop_1214:
	fxnors	%f2,	%f29,	%f25
loop_1215:
	ldd	[%l7 + 0x40],	%f0
	sdivx	%l1,	0x01B0,	%g1
	movrlez	%o4,	%i2,	%o7
	mulscc	%g7,	%l5,	%g6
	udiv	%l6,	0x1AB8,	%i3
	fbe	%fcc0,	loop_1216
	movvs	%xcc,	%i6,	%g5
	wr	%g0,	0x20,	%asi
	stxa	%o2,	[%g0 + 0x10] %asi
loop_1216:
	nop
	set	0x40, %g4
	swapa	[%l7 + %g4] 0x19,	%i5
	and	%l2,	0x157C,	%o1
	fands	%f25,	%f19,	%f8
	sir	0x10E2
	sdivcc	%i4,	0x0BD6,	%l4
	tne	%icc,	0x7
	orn	%l3,	%g2,	%l0
	xnor	%o3,	0x0688,	%o5
	nop
	fitos	%f8,	%f12
	fstoi	%f12,	%f8
	fnand	%f24,	%f2,	%f16
	array8	%i1,	%o6,	%o0
	fmuld8sux16	%f7,	%f4,	%f20
	subccc	%i0,	%i7,	%g4
	sdivx	%g3,	0x0A05,	%g1
	movrgz	%o4,	%i2,	%l1
	fmul8ulx16	%f2,	%f26,	%f16
	tsubcctv	%g7,	%l5,	%g6
	movrne	%l6,	0x11F,	%o7
	fbul	%fcc2,	loop_1217
	orcc	%i6,	%g5,	%o2
	fmovsg	%icc,	%f20,	%f22
	udivcc	%i3,	0x19BC,	%l2
loop_1217:
	fbug,a	%fcc1,	loop_1218
	addc	%o1,	0x15C4,	%i4
	set	0x5E, %i0
	lduba	[%l7 + %i0] 0x10,	%i5
loop_1218:
	taddcc	%l4,	%g2,	%l0
	udivx	%l3,	0x1EB4,	%o5
	movneg	%icc,	%i1,	%o6
	fand	%f8,	%f14,	%f18
	fxnor	%f22,	%f22,	%f16
	fcmpne16	%f2,	%f30,	%o0
	orncc	%i0,	0x116D,	%i7
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x15,	%g4
	wr	%g0,	0x0c,	%asi
	stba	%g3,	[%l7 + 0x28] %asi
	tneg	%xcc,	0x3
	edge8ln	%g1,	%o3,	%o4
	edge16ln	%i2,	%g7,	%l5
	fsrc2	%f2,	%f8
	tcs	%icc,	0x5
	tne	%xcc,	0x0
	tg	%icc,	0x6
	tpos	%icc,	0x7
	sdiv	%g6,	0x1AD2,	%l1
	addccc	%l6,	%i6,	%g5
	nop
	fitod	%f6,	%f14
	umulcc	%o2,	0x09FC,	%i3
	movne	%xcc,	%l2,	%o1
	movl	%icc,	%o7,	%i4
	xnorcc	%i5,	0x003C,	%g2
	tleu	%xcc,	0x3
	set	0x34, %l4
	ldsha	[%l7 + %l4] 0x89,	%l4
	st	%f0,	[%l7 + 0x1C]
	tg	%xcc,	0x1
	movrgz	%l3,	%l0,	%o5
	fmovrsgz	%o6,	%f24,	%f0
	edge16n	%i1,	%i0,	%o0
	wr	%g0,	0x21,	%asi
	stxa	%i7,	[%g0 + 0x110] %asi
	brz,a	%g4,	loop_1219
	ldsb	[%l7 + 0x60],	%g1
	ldsb	[%l7 + 0x76],	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1219:
	tne	%xcc,	0x7
	call	loop_1220
	movn	%icc,	%o3,	%i2
	subc	%g7,	%l5,	%o4
	nop
	setx	0x70DCBF40,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x5CE85F79,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f12,	%f21
loop_1220:
	movrgez	%l1,	0x3E5,	%g6
	taddcctv	%l6,	%i6,	%g5
	movcs	%xcc,	%i3,	%o2
	fones	%f16
	edge8n	%o1,	%l2,	%i4
	sth	%o7,	[%l7 + 0x20]
	fmovspos	%icc,	%f16,	%f8
	and	%g2,	0x1269,	%i5
	fbge,a	%fcc2,	loop_1221
	movrne	%l4,	%l3,	%o5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%o6
loop_1221:
	srax	%l0,	%i1,	%i0
	sdiv	%o0,	0x0F94,	%g4
	nop
	setx	loop_1222,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stbar
	xorcc	%i7,	%g1,	%g3
	movle	%xcc,	%o3,	%g7
loop_1222:
	fpadd16s	%f15,	%f30,	%f27
	edge8n	%l5,	%o4,	%i2
	set	0x64, %i4
	lduwa	[%l7 + %i4] 0x81,	%l1
	fpmerge	%f16,	%f24,	%f2
	fandnot2	%f20,	%f4,	%f14
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i6
	fmovdpos	%icc,	%f7,	%f11
	nop
	setx	0xEE850637E06781D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	set	0x70, %g6
	ldswa	[%l7 + %g6] 0x81,	%g5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i3,	%o2
	fsrc1s	%f26,	%f17
	andncc	%l6,	%l2,	%o1
	movn	%icc,	%i4,	%o7
	movre	%i5,	0x0EB,	%g2
	andncc	%l3,	%o5,	%l4
	tsubcctv	%l0,	0x0841,	%o6
	nop
	fitos	%f11,	%f1
	fstox	%f1,	%f16
	tleu	%xcc,	0x3
	xnor	%i1,	%i0,	%g4
	edge8	%i7,	%g1,	%g3
	udiv	%o3,	0x0939,	%g7
	fmovdvs	%icc,	%f15,	%f11
	subc	%l5,	%o0,	%o4
	bvs,a,pn	%icc,	loop_1223
	edge8n	%l1,	%i2,	%i6
	smul	%g5,	%g6,	%o2
	movrgez	%l6,	%l2,	%i3
loop_1223:
	orcc	%i4,	0x1BD9,	%o7
	xorcc	%i5,	0x17EE,	%o1
	edge8n	%l3,	%g2,	%l4
	fmovdn	%xcc,	%f15,	%f9
	udivx	%o5,	0x18F2,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l0,	%i1,	%g4
	wr	%g0,	0xe2,	%asi
	stwa	%i0,	[%l7 + 0x44] %asi
	membar	#Sync
	andcc	%g1,	0x15A1,	%i7
	movg	%xcc,	%o3,	%g7
	fmovdvs	%icc,	%f25,	%f8
	edge8ln	%l5,	%g3,	%o0
	nop
	setx	0xA495B99E6D0CE787,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x51416341E5ED49F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f30,	%f2
	tle	%icc,	0x3
	sub	%o4,	0x0C0D,	%l1
	ldub	[%l7 + 0x1F],	%i6
	fsrc2s	%f7,	%f10
	mova	%xcc,	%i2,	%g6
	mova	%icc,	%o2,	%g5
	tne	%icc,	0x5
	nop
	fitos	%f2,	%f5
	fstod	%f5,	%f24
	sllx	%l2,	0x1C,	%l6
	sdivcc	%i4,	0x1F3A,	%o7
	st	%f29,	[%l7 + 0x50]
	umulcc	%i3,	%o1,	%l3
	fmovdneg	%icc,	%f26,	%f18
	tg	%xcc,	0x7
	movge	%icc,	%i5,	%g2
	movneg	%icc,	%l4,	%o5
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fzero	%f18
	xorcc	%o6,	0x1134,	%l0
	fpsub32	%f4,	%f2,	%f12
	nop
	fitos	%f8,	%f11
	fstod	%f11,	%f24
	subcc	%g4,	0x1E01,	%i1
	set	0x50, %i5
	stxa	%g1,	[%l7 + %i5] 0x81
	tge	%icc,	0x1
	fmovdleu	%xcc,	%f24,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i0,	%o3,	%g7
	orn	%i7,	%l5,	%o0
	fmovrde	%g3,	%f26,	%f24
	fandnot1	%f16,	%f22,	%f20
	smul	%l1,	0x0820,	%o4
	tl	%icc,	0x1
	fmovscc	%icc,	%f4,	%f13
	fbug,a	%fcc1,	loop_1224
	edge16	%i6,	%g6,	%i2
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f24
	call	loop_1225
loop_1224:
	edge16	%o2,	%g5,	%l2
	edge8n	%l6,	%i4,	%i3
	popc	%o1,	%o7
loop_1225:
	bg,pn	%xcc,	loop_1226
	fbul	%fcc0,	loop_1227
	array8	%l3,	%g2,	%l4
	and	%i5,	0x0F79,	%o6
loop_1226:
	nop
	fitod	%f4,	%f2
	fdtox	%f2,	%f30
loop_1227:
	fandnot1	%f12,	%f10,	%f16
	tsubcc	%l0,	0x1D11,	%o5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i1
	tl	%xcc,	0x2
	nop
	set	0x32, %l2
	ldub	[%l7 + %l2],	%g1
	sth	%g4,	[%l7 + 0x70]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i0,	0x04FB,	%o3
	srax	%g7,	0x1D,	%l5
	nop
	fitod	%f4,	%f0
	fdtoi	%f0,	%f5
	or	%o0,	%i7,	%l1
	set	0x50, %i6
	stxa	%g3,	[%l7 + %i6] 0x0c
	ldsb	[%l7 + 0x28],	%i6
	bvc	loop_1228
	addccc	%g6,	%i2,	%o2
	fands	%f31,	%f2,	%f5
	tpos	%xcc,	0x4
loop_1228:
	taddcc	%o4,	0x169A,	%l2
	tsubcc	%g5,	%l6,	%i3
	fmovdne	%icc,	%f27,	%f18
	sdivx	%o1,	0x0ACC,	%i4
	sllx	%l3,	0x17,	%o7
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x58] %asi,	%f15
	movgu	%xcc,	%l4,	%g2
	taddcc	%o6,	0x095B,	%l0
	edge16	%o5,	%i1,	%i5
	smulcc	%g1,	%i0,	%o3
	subc	%g7,	%g4,	%l5
	orcc	%i7,	%l1,	%o0
	edge16n	%i6,	%g3,	%g6
	bvc	loop_1229
	bg	loop_1230
	fxor	%f20,	%f24,	%f2
	smul	%i2,	%o4,	%o2
loop_1229:
	udiv	%g5,	0x14AD,	%l2
loop_1230:
	tgu	%xcc,	0x4
	edge8n	%i3,	%l6,	%i4
	fmovsle	%icc,	%f9,	%f9
	fornot1	%f6,	%f22,	%f0
	subccc	%o1,	0x01B5,	%o7
	xnor	%l4,	%g2,	%l3
	brnz,a	%o6,	loop_1231
	edge16l	%o5,	%i1,	%i5
	sub	%g1,	%l0,	%o3
	movvs	%xcc,	%i0,	%g4
loop_1231:
	fmovspos	%xcc,	%f16,	%f18
	fmovdne	%icc,	%f12,	%f5
	ldsb	[%l7 + 0x10],	%l5
	membar	0x4F
	bl,a,pn	%icc,	loop_1232
	array32	%i7,	%g7,	%o0
	fmovdpos	%icc,	%f4,	%f0
	sdivx	%i6,	0x0F4F,	%l1
loop_1232:
	ta	%icc,	0x7
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x78] %asi,	%g3
	fandnot2	%f4,	%f18,	%f24
	set	0x34, %g2
	stha	%i2,	[%l7 + %g2] 0x04
	tg	%xcc,	0x2
	bvc,a	loop_1233
	bne,a	loop_1234
	tneg	%xcc,	0x0
	tcc	%xcc,	0x6
loop_1233:
	movle	%xcc,	%o4,	%g6
loop_1234:
	edge16l	%o2,	%l2,	%i3
	tge	%icc,	0x3
	prefetch	[%l7 + 0x58],	 0x3
	xorcc	%l6,	%g5,	%o1
	or	%i4,	0x1393,	%l4
	movrgez	%g2,	0x314,	%o7
	edge8ln	%o6,	%o5,	%l3
	tg	%icc,	0x4
	tsubcc	%i1,	%i5,	%l0
	array8	%o3,	%i0,	%g4
	nop
	set	0x10, %g7
	stx	%g1,	[%l7 + %g7]
	movrlez	%l5,	0x260,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f7,	%f0
	sra	%o0,	%g7,	%l1
	sir	0x09DA
	sdiv	%i6,	0x0FAF,	%i2
	nop
	set	0x2D, %l6
	ldstub	[%l7 + %l6],	%o4
	bg	loop_1235
	fmovrsne	%g3,	%f5,	%f14
	mova	%xcc,	%o2,	%l2
	or	%i3,	%l6,	%g6
loop_1235:
	st	%f1,	[%l7 + 0x68]
	addcc	%o1,	0x1C81,	%g5
	movvs	%icc,	%l4,	%g2
	fbuge	%fcc1,	loop_1236
	pdist	%f0,	%f18,	%f2
	alignaddrl	%i4,	%o6,	%o7
	mulx	%o5,	%i1,	%l3
loop_1236:
	sllx	%l0,	%i5,	%o3
	fbue,a	%fcc2,	loop_1237
	movrlz	%g4,	%g1,	%l5
	nop
	setx	0x88D18F7E438B0315,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x0414AD91615E0C71,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f20,	%f10
	taddcctv	%i7,	%i0,	%o0
loop_1237:
	fpadd32s	%f24,	%f31,	%f13
	fxnors	%f28,	%f30,	%f29
	fbuge	%fcc0,	loop_1238
	bvc,a	%icc,	loop_1239
	srlx	%g7,	0x19,	%l1
	movge	%icc,	%i6,	%o4
loop_1238:
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f0
loop_1239:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a	loop_1240
	edge32n	%i2,	%o2,	%g3
	call	loop_1241
	ldsh	[%l7 + 0x32],	%l2
loop_1240:
	movcs	%icc,	%l6,	%g6
	fornot1	%f26,	%f14,	%f24
loop_1241:
	srl	%i3,	0x11,	%o1
	fands	%f17,	%f5,	%f2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x54] %asi,	%g5
	edge8ln	%l4,	%g2,	%i4
	fbu	%fcc2,	loop_1242
	fpadd32s	%f3,	%f31,	%f8
	udiv	%o7,	0x1D9B,	%o6
	taddcctv	%i1,	%o5,	%l0
loop_1242:
	membar	0x78
	add	%l3,	0x0D91,	%i5
	brgez	%g4,	loop_1243
	edge8	%o3,	%l5,	%g1
	fnands	%f24,	%f11,	%f9
	subccc	%i0,	%o0,	%g7
loop_1243:
	addcc	%l1,	0x1873,	%i7
	movne	%xcc,	%o4,	%i2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	bcc,a	loop_1244
	sdivx	%o2,	0x0E9B,	%g3
	sll	%l2,	%g6,	%i3
	fmovdg	%xcc,	%f25,	%f19
loop_1244:
	tneg	%xcc,	0x7
	fzero	%f30
	edge16l	%l6,	%g5,	%o1
	tn	%xcc,	0x5
	nop
	fitos	%f4,	%f16
	fstod	%f16,	%f6
	set	0x30, %o3
	stba	%l4,	[%l7 + %o3] 0x80
	tpos	%icc,	0x6
	nop
	setx loop_1245, %l0, %l1
	jmpl %l1, %i4
	nop
	setx	0xA414121459B60FA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x1510CC3F3B14321C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f2,	%f16
	movne	%icc,	%o7,	%o6
	fba,a	%fcc0,	loop_1246
loop_1245:
	nop
	fitos	%f27,	%f16
	fble,a	%fcc3,	loop_1247
	tvs	%xcc,	0x6
loop_1246:
	nop
	fitos	%f2,	%f10
	fstoi	%f10,	%f30
	bgu	loop_1248
loop_1247:
	ld	[%l7 + 0x44],	%f16
	nop
	setx	0xEAF345E1AE3F83BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f2
	bge,a	loop_1249
loop_1248:
	std	%f20,	[%l7 + 0x40]
	nop
	setx	0xB3133D7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x3BDF83DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f28,	%f9
	udivcc	%i1,	0x1EED,	%g2
loop_1249:
	edge16ln	%l0,	%o5,	%i5
	edge8l	%g4,	%l3,	%o3
	fornot2	%f0,	%f12,	%f20
	mova	%icc,	%g1,	%l5
	fornot1s	%f0,	%f27,	%f19
	fbuge	%fcc3,	loop_1250
	subccc	%i0,	0x0A9D,	%g7
	movn	%icc,	%l1,	%o0
	faligndata	%f30,	%f14,	%f28
loop_1250:
	fmovdge	%icc,	%f7,	%f25
	addccc	%o4,	0x0D73,	%i2
	srax	%i6,	%o2,	%g3
	andcc	%i7,	%g6,	%l2
	fmovrdgz	%l6,	%f2,	%f10
	umulcc	%g5,	0x085A,	%o1
	tle	%icc,	0x0
	stx	%i3,	[%l7 + 0x18]
	tcc	%xcc,	0x5
	movle	%xcc,	%i4,	%o7
	srlx	%o6,	%l4,	%g2
	addcc	%l0,	%i1,	%o5
	edge8l	%i5,	%l3,	%g4
	udivcc	%g1,	0x0F49,	%l5
	fmovrslz	%i0,	%f18,	%f4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x11,	%f0
	movrne	%g7,	0x20D,	%o3
	orncc	%o0,	0x02FA,	%o4
	andn	%i2,	0x03FB,	%l1
	ldd	[%l7 + 0x30],	%f22
	umulcc	%o2,	0x0EDA,	%g3
	bne,pt	%xcc,	loop_1251
	fmovde	%xcc,	%f7,	%f6
	udiv	%i7,	0x0D5F,	%i6
	or	%l2,	%g6,	%g5
loop_1251:
	movle	%xcc,	%l6,	%o1
	movge	%xcc,	%i4,	%o7
	fmovd	%f10,	%f10
	sub	%i3,	%o6,	%l4
	tneg	%icc,	0x0
	movrgz	%g2,	%l0,	%o5
	tg	%xcc,	0x4
	brz,a	%i5,	loop_1252
	movne	%icc,	%i1,	%g4
	udivx	%g1,	0x001D,	%l3
	fbo	%fcc3,	loop_1253
loop_1252:
	nop
	set	0x28, %o1
	ldsw	[%l7 + %o1],	%l5
	movle	%icc,	%g7,	%o3
	xnorcc	%o0,	%o4,	%i0
loop_1253:
	movl	%icc,	%l1,	%i2
	edge16l	%o2,	%i7,	%i6
	brgez	%l2,	loop_1254
	fnands	%f20,	%f11,	%f20
	fmovrsgz	%g6,	%f5,	%f30
	prefetch	[%l7 + 0x74],	 0x0
loop_1254:
	fmovsg	%icc,	%f9,	%f5
	bneg,a	loop_1255
	subccc	%g5,	0x10C7,	%l6
	tcc	%xcc,	0x7
	fmovsvc	%xcc,	%f31,	%f11
loop_1255:
	fandnot2	%f20,	%f30,	%f10
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x12] %asi,	%o1
	movrgez	%g3,	%i4,	%i3
	bl,a,pt	%xcc,	loop_1256
	brlz	%o6,	loop_1257
	nop
	fitos	%f12,	%f12
	fstoi	%f12,	%f3
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%l4
loop_1256:
	sllx	%g2,	%o7,	%l0
loop_1257:
	ldx	[%l7 + 0x70],	%o5
	addccc	%i5,	0x0CE5,	%g4
	sub	%i1,	0x1037,	%g1
	nop
	setx	0xE04BC19F,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x44] %asi,	%l5
	movn	%xcc,	%l3,	%g7
	addcc	%o0,	0x12E2,	%o3
	tgu	%icc,	0x5
	xor	%i0,	%o4,	%i2
	sdivx	%l1,	0x0952,	%o2
	movgu	%xcc,	%i6,	%l2
	ble,a,pt	%icc,	loop_1258
	tgu	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i7
loop_1258:
	xor	%g5,	%l6,	%g6
	edge32ln	%g3,	%o1,	%i3
	edge8l	%i4,	%o6,	%g2
	edge8n	%l4,	%l0,	%o7
	stbar
	movrgez	%o5,	%g4,	%i5
	sub	%i1,	%g1,	%l5
	fpsub16	%f20,	%f12,	%f6
	subcc	%g7,	%l3,	%o0
	fmul8sux16	%f10,	%f0,	%f0
	orcc	%o3,	0x0617,	%o4
	bcs,pt	%xcc,	loop_1259
	movcs	%xcc,	%i0,	%l1
	fbuge,a	%fcc1,	loop_1260
	andcc	%o2,	0x1F72,	%i6
loop_1259:
	ldd	[%l7 + 0x58],	%l2
	subcc	%i7,	0x06C4,	%g5
loop_1260:
	nop
	setx	0xEACDF185E67E38D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x3F91507277795084,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f2,	%f8
	or	%i2,	%g6,	%g3
	nop
	fitos	%f4,	%f16
	fstox	%f16,	%f4
	bcs,a	loop_1261
	te	%icc,	0x5
	movgu	%xcc,	%o1,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1261:
	orncc	%i4,	0x1298,	%i3
	xor	%g2,	0x1886,	%o6
	edge8	%l4,	%o7,	%o5
	fmovsge	%xcc,	%f19,	%f17
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g4
	edge32	%l0,	%i5,	%i1
	edge32	%g1,	%g7,	%l5
	alignaddrl	%o0,	%o3,	%o4
	faligndata	%f12,	%f26,	%f8
	fmovrsgez	%i0,	%f14,	%f5
	flush	%l7 + 0x50
	mova	%xcc,	%l1,	%l3
	xor	%i6,	%l2,	%i7
	fcmpeq32	%f0,	%f30,	%o2
	udivx	%g5,	0x1458,	%i2
	array32	%g3,	%g6,	%o1
	andcc	%l6,	%i3,	%g2
	fnand	%f2,	%f14,	%f26
	pdist	%f28,	%f0,	%f0
	tvc	%xcc,	0x0
	tsubcctv	%o6,	0x01C6,	%l4
	movrgz	%o7,	%o5,	%i4
	fpadd32s	%f8,	%f18,	%f25
	taddcctv	%l0,	%g4,	%i5
	stw	%i1,	[%l7 + 0x78]
	mulx	%g1,	%l5,	%g7
	sra	%o0,	0x19,	%o4
	fbl,a	%fcc0,	loop_1262
	fmovrsgz	%i0,	%f9,	%f9
	fbl	%fcc3,	loop_1263
	fmovrde	%o3,	%f6,	%f18
loop_1262:
	nop
	setx	loop_1264,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,a,pn	%icc,	loop_1265
loop_1263:
	movrlz	%l3,	%l1,	%l2
	set	0x4E, %o0
	stha	%i6,	[%l7 + %o0] 0x27
	membar	#Sync
loop_1264:
	fabsd	%f14,	%f4
loop_1265:
	tcs	%xcc,	0x6
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x2b,	%i6
	tcs	%xcc,	0x4
	tsubcctv	%g5,	%o2,	%g3
	orncc	%i2,	0x0CED,	%o1
	umul	%l6,	%i3,	%g6
	udivcc	%o6,	0x00E7,	%l4
	addccc	%g2,	%o7,	%o5
	fblg,a	%fcc3,	loop_1266
	fsrc1s	%f2,	%f3
	fpsub32s	%f6,	%f24,	%f25
	fpadd16s	%f9,	%f26,	%f15
loop_1266:
	prefetch	[%l7 + 0x70],	 0x2
	add	%l0,	0x104D,	%g4
	subccc	%i5,	0x1938,	%i4
	edge16ln	%g1,	%i1,	%g7
	ldsb	[%l7 + 0x73],	%o0
	movle	%icc,	%o4,	%i0
	fbne	%fcc0,	loop_1267
	tl	%xcc,	0x7
	sllx	%l5,	0x05,	%l3
	bleu,a,pt	%xcc,	loop_1268
loop_1267:
	fbo	%fcc0,	loop_1269
	movvc	%xcc,	%l1,	%o3
	fbul	%fcc2,	loop_1270
loop_1268:
	fmovrdlz	%l2,	%f24,	%f8
loop_1269:
	edge16ln	%i6,	%i7,	%g5
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1270:
	sll	%o2,	%i2,	%o1
	st	%f8,	[%l7 + 0x20]
	bcs	loop_1271
	ldx	[%l7 + 0x50],	%l6
	lduh	[%l7 + 0x3A],	%g3
	move	%xcc,	%i3,	%g6
loop_1271:
	fpadd16s	%f11,	%f3,	%f14
	edge8l	%o6,	%g2,	%o7
	fmovdge	%icc,	%f19,	%f9
	movl	%icc,	%l4,	%o5
	andn	%g4,	0x1C25,	%i5
	nop
	fitod	%f0,	%f16
	fdtoi	%f16,	%f21
	tn	%icc,	0x1
	sethi	0x19C7,	%i4
	fone	%f28
	edge8l	%g1,	%l0,	%g7
	sir	0x0804
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tcc	%icc,	0x6
	tl	%xcc,	0x2
	smul	%o0,	0x0DCD,	%o4
	fxnors	%f25,	%f24,	%f30
	membar	0x46
	set	0x0C, %o4
	lda	[%l7 + %o4] 0x04,	%f6
	bne,a,pt	%xcc,	loop_1272
	tpos	%icc,	0x1
	bgu	%xcc,	loop_1273
	fnand	%f26,	%f22,	%f6
loop_1272:
	movrne	%i0,	%l5,	%l3
	sir	0x1129
loop_1273:
	movrgez	%i1,	%l1,	%l2
	or	%i6,	%o3,	%i7
	fpackfix	%f20,	%f30
	fzero	%f10
	xorcc	%g5,	%o2,	%o1
	fsrc2s	%f31,	%f15
	tvs	%xcc,	0x0
	addc	%l6,	%i2,	%g3
	udiv	%g6,	0x0767,	%o6
	movg	%xcc,	%g2,	%i3
	andncc	%o7,	%o5,	%l4
	tvs	%icc,	0x7
	edge16	%g4,	%i4,	%i5
	array16	%g1,	%g7,	%o0
	tvc	%xcc,	0x2
	edge32	%l0,	%o4,	%i0
	subc	%l5,	0x0B2A,	%i1
	fmovrsgez	%l3,	%f31,	%f26
	movn	%xcc,	%l1,	%l2
	fbul	%fcc2,	loop_1274
	fzero	%f0
	array8	%o3,	%i6,	%g5
	movn	%icc,	%o2,	%i7
loop_1274:
	sethi	0x0FE9,	%o1
	edge16n	%l6,	%i2,	%g3
	fmovdne	%xcc,	%f10,	%f4
	movneg	%icc,	%g6,	%g2
	movcs	%xcc,	%i3,	%o7
	movg	%xcc,	%o6,	%l4
	fmovrslz	%o5,	%f13,	%f7
	nop
	setx	loop_1275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%g4,	%i4,	%g1
	movrne	%i5,	%g7,	%o0
	sllx	%o4,	%i0,	%l0
loop_1275:
	movl	%xcc,	%i1,	%l5
	addccc	%l1,	%l3,	%l2
	bvc,a	loop_1276
	addc	%o3,	0x0C8D,	%g5
	edge8n	%i6,	%o2,	%i7
	sllx	%o1,	%i2,	%g3
loop_1276:
	nop
	setx loop_1277, %l0, %l1
	jmpl %l1, %l6
	movg	%icc,	%g6,	%g2
	lduw	[%l7 + 0x28],	%i3
	xorcc	%o7,	0x06BF,	%o6
loop_1277:
	ta	%xcc,	0x1
	edge16n	%o5,	%l4,	%g4
	andn	%g1,	0x1AE5,	%i4
	ta	%icc,	0x1
	xnorcc	%g7,	%o0,	%i5
	movcs	%xcc,	%i0,	%o4
	addc	%i1,	%l0,	%l1
	nop
	setx	loop_1278,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%l5,	%l2,	%o3
	fcmpgt16	%f22,	%f30,	%g5
	fbge,a	%fcc3,	loop_1279
loop_1278:
	andncc	%l3,	%i6,	%i7
	udivcc	%o2,	0x0D31,	%o1
	fcmpgt16	%f24,	%f8,	%g3
loop_1279:
	taddcc	%i2,	0x1E8C,	%l6
	tneg	%xcc,	0x6
	tl	%icc,	0x3
	tcc	%xcc,	0x3
	nop
	setx	loop_1280,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%g6,	0x0F6D,	%g2
	fzero	%f14
	array8	%i3,	%o7,	%o6
loop_1280:
	nop
	set	0x34, %g1
	sta	%f4,	[%l7 + %g1] 0x81
	set	0x58, %l3
	ldsha	[%l7 + %l3] 0x14,	%o5
	ldsb	[%l7 + 0x13],	%l4
	be,pt	%xcc,	loop_1281
	movne	%xcc,	%g4,	%g1
	srax	%g7,	%i4,	%o0
	tgu	%icc,	0x2
loop_1281:
	andcc	%i5,	0x05F4,	%i0
	movpos	%xcc,	%o4,	%i1
	movrlez	%l1,	%l0,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o3,	%g5
	brgez	%l3,	loop_1282
	te	%xcc,	0x1
	tvs	%icc,	0x7
	movvs	%icc,	%l2,	%i7
loop_1282:
	fbne	%fcc3,	loop_1283
	add	%i6,	%o1,	%o2
	st	%f1,	[%l7 + 0x28]
	tl	%icc,	0x4
loop_1283:
	fand	%f30,	%f2,	%f4
	movvs	%xcc,	%g3,	%l6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i2
	sllx	%i3,	0x0D,	%o7
	nop
	setx	0x22EE5AD8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f18
	tg	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movgu	%xcc,	%o6,	%g2
	fmovdleu	%icc,	%f27,	%f14
	tvs	%icc,	0x5
	andn	%o5,	%l4,	%g1
	movpos	%xcc,	%g4,	%i4
	movrgez	%g7,	0x014,	%i5
	lduw	[%l7 + 0x18],	%o0
	fornot1s	%f9,	%f6,	%f23
	bge	%xcc,	loop_1284
	fmovde	%xcc,	%f24,	%f8
	andcc	%o4,	0x1523,	%i1
	set	0x58, %l5
	sta	%f20,	[%l7 + %l5] 0x10
loop_1284:
	sdivcc	%i0,	0x01A9,	%l1
	mulx	%l0,	0x02D4,	%l5
	mova	%icc,	%g5,	%l3
	fpack16	%f4,	%f29
	tvc	%xcc,	0x0
	movpos	%icc,	%o3,	%i7
	fmovdne	%icc,	%f19,	%f12
	fsrc1s	%f31,	%f25
	fnot1s	%f0,	%f28
	movg	%xcc,	%l2,	%i6
	taddcctv	%o1,	%o2,	%g3
	set	0x1C, %i2
	lduwa	[%l7 + %i2] 0x04,	%l6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g6
	sll	%i3,	%i2,	%o7
	tcs	%xcc,	0x0
	movge	%icc,	%g2,	%o5
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	fsrc2s	%f26,	%f28
	brlz	%g1,	loop_1285
	brz	%o6,	loop_1286
	xor	%i4,	%g4,	%g7
	umul	%o0,	0x0435,	%o4
loop_1285:
	fmovsvs	%icc,	%f17,	%f16
loop_1286:
	nop
	setx	loop_1287,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fzeros	%f15
	fbu,a	%fcc3,	loop_1288
	popc	%i1,	%i0
loop_1287:
	fbul,a	%fcc2,	loop_1289
	subc	%l1,	%l0,	%i5
loop_1288:
	nop
	setx	0xA31CFD9367FE37C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f0
	fmovdle	%xcc,	%f29,	%f19
loop_1289:
	movle	%icc,	%g5,	%l3
	xorcc	%l5,	0x07C8,	%o3
	edge16ln	%l2,	%i6,	%i7
	umul	%o2,	0x1E83,	%o1
	bneg,a,pt	%icc,	loop_1290
	andncc	%l6,	%g6,	%i3
	fbl,a	%fcc1,	loop_1291
	fpadd16s	%f4,	%f31,	%f27
loop_1290:
	nop
	setx	0x91D78267,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xAD9ACB2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f20,	%f9
	movne	%icc,	%i2,	%g3
loop_1291:
	bvc	loop_1292
	fsrc2	%f4,	%f0
	brgez	%o7,	loop_1293
	sra	%o5,	0x08,	%g2
loop_1292:
	movvs	%xcc,	%l4,	%o6
	nop
	fitos	%f12,	%f24
loop_1293:
	mulscc	%g1,	%i4,	%g4
	movrne	%o0,	%o4,	%g7
	move	%icc,	%i0,	%i1
	udiv	%l0,	0x19F6,	%l1
	movvs	%icc,	%i5,	%l3
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x16,	%f16
	tsubcc	%g5,	0x07CA,	%o3
	tleu	%xcc,	0x5
	umulcc	%l2,	%l5,	%i7
	stx	%i6,	[%l7 + 0x40]
	addcc	%o1,	%o2,	%l6
	srax	%g6,	%i3,	%g3
	andn	%o7,	%i2,	%o5
	smul	%g2,	0x0783,	%l4
	brnz,a	%g1,	loop_1294
	movn	%icc,	%o6,	%g4
	set	0x6C, %g3
	lduha	[%l7 + %g3] 0x19,	%i4
loop_1294:
	orn	%o0,	0x11AE,	%o4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x19,	%f0
	udivx	%g7,	0x14D1,	%i1
	movrgez	%l0,	%l1,	%i5
	alignaddr	%l3,	%i0,	%o3
	fnot1	%f8,	%f16
	edge32	%g5,	%l5,	%l2
	fbue	%fcc1,	loop_1295
	addccc	%i6,	%o1,	%i7
	tsubcc	%l6,	0x0E17,	%o2
	fmovdpos	%xcc,	%f12,	%f13
loop_1295:
	edge32n	%i3,	%g3,	%g6
	edge8l	%i2,	%o7,	%o5
	edge8n	%g2,	%g1,	%o6
	fone	%f4
	fbne	%fcc1,	loop_1296
	fble	%fcc2,	loop_1297
	andn	%g4,	%i4,	%o0
	tcs	%icc,	0x0
loop_1296:
	movle	%icc,	%o4,	%l4
loop_1297:
	fcmpeq32	%f20,	%f4,	%i1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	nop
	setx	0xEA7FCF75,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x65FBF2F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f14,	%f7
	st	%f12,	[%l7 + 0x2C]
	nop
	fitos	%f13,	%f9
	fstox	%f9,	%f10
	fxtos	%f10,	%f17
	subc	%l1,	0x0C75,	%g7
	edge16l	%i5,	%i0,	%l3
	tvc	%xcc,	0x5
	fbul,a	%fcc0,	loop_1298
	flush	%l7 + 0x3C
	xor	%o3,	%g5,	%l2
	movrne	%l5,	%i6,	%o1
loop_1298:
	fbu	%fcc3,	loop_1299
	nop
	setx	0xB067E9DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	tge	%xcc,	0x6
	move	%xcc,	%l6,	%i7
loop_1299:
	fmovdn	%xcc,	%f16,	%f15
	array8	%i3,	%g3,	%o2
	fnot1	%f26,	%f8
	fcmpne16	%f22,	%f6,	%i2
	nop
	setx	0x97B0C86A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xCD3B3888,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f4,	%f27
	movle	%xcc,	%g6,	%o5
	edge8	%g2,	%o7,	%g1
	xnorcc	%g4,	0x0783,	%o6
	bgu,pn	%icc,	loop_1300
	nop
	fitod	%f12,	%f26
	fdtos	%f26,	%f30
	edge16n	%i4,	%o4,	%o0
	xnorcc	%l4,	0x1694,	%l0
loop_1300:
	tleu	%xcc,	0x3
	udivcc	%l1,	0x0353,	%g7
	edge16l	%i5,	%i0,	%l3
	tleu	%xcc,	0x3
	fbne	%fcc3,	loop_1301
	movrgz	%i1,	%g5,	%l2
	tcs	%icc,	0x1
	fmovsneg	%icc,	%f19,	%f27
loop_1301:
	fmovdcc	%xcc,	%f8,	%f25
	subccc	%o3,	0x17DF,	%i6
	edge32	%l5,	%l6,	%o1
	bn	%xcc,	loop_1302
	fbu,a	%fcc3,	loop_1303
	xorcc	%i3,	0x1B4C,	%i7
	subc	%o2,	0x14E7,	%g3
loop_1302:
	fxnor	%f26,	%f0,	%f26
loop_1303:
	edge32ln	%g6,	%i2,	%g2
	tleu	%xcc,	0x4
	nop
	setx	0x1137AFFF8BA53622,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x9F04D0B0C2EDC199,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f22,	%f12
	mulx	%o7,	0x18B1,	%g1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x04,	%f16
	stw	%g4,	[%l7 + 0x5C]
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x69] %asi,	%o6
	movneg	%icc,	%i4,	%o5
	nop
	setx	0x0C33DA96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f5
	edge16ln	%o4,	%l4,	%l0
	sllx	%o0,	%l1,	%g7
	sth	%i0,	[%l7 + 0x5C]
	movleu	%icc,	%l3,	%i1
	fbug	%fcc0,	loop_1304
	movcc	%xcc,	%g5,	%l2
	tneg	%icc,	0x3
	addc	%o3,	0x1C1C,	%i5
loop_1304:
	fpackfix	%f14,	%f10
	brz	%l5,	loop_1305
	orncc	%l6,	0x06F6,	%o1
	udiv	%i6,	0x0370,	%i7
	ldx	[%l7 + 0x20],	%i3
loop_1305:
	lduw	[%l7 + 0x28],	%g3
	xorcc	%o2,	0x1B4D,	%i2
	addc	%g2,	%o7,	%g6
	nop
	setx	0xC663ADF5B0798EFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	and	%g4,	%g1,	%i4
	movl	%xcc,	%o5,	%o4
	fpsub32	%f16,	%f10,	%f26
	fmovsleu	%xcc,	%f7,	%f31
	mulx	%l4,	%o6,	%l0
	andn	%o0,	%l1,	%i0
	call	loop_1306
	edge16n	%g7,	%l3,	%i1
	move	%xcc,	%g5,	%o3
	nop
	fitos	%f15,	%f26
loop_1306:
	brz,a	%l2,	loop_1307
	sir	0x1C48
	andcc	%i5,	%l6,	%l5
	xor	%o1,	%i7,	%i3
loop_1307:
	nop
	setx	0x3EBDA2FA9D7DD04F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xB0CF769AC72D6E57,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f0,	%f14
	edge16ln	%g3,	%i6,	%o2
	set	0x30, %o2
	sta	%f21,	[%l7 + %o2] 0x89
	fpsub32	%f8,	%f28,	%f24
	fbe	%fcc2,	loop_1308
	tneg	%xcc,	0x6
	tsubcc	%g2,	%i2,	%g6
	movrgez	%o7,	0x0E7,	%g1
loop_1308:
	bvc,a	%xcc,	loop_1309
	nop
	set	0x34, %i1
	lduh	[%l7 + %i1],	%i4
	fpsub16	%f22,	%f6,	%f10
	wr	%g0,	0x89,	%asi
	stba	%g4,	[%l7 + 0x7B] %asi
loop_1309:
	nop
	setx	0x7B413BA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xA5A4A023,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f11,	%f20
	or	%o4,	0x0949,	%o5
	add	%o6,	%l4,	%o0
	movpos	%icc,	%l0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f1,	%f14,	%f18
	move	%icc,	%l1,	%g7
	udivcc	%i1,	0x1EC1,	%l3
	sir	0x08CB
	tge	%icc,	0x2
	edge16	%o3,	%g5,	%i5
	membar	0x48
	nop
	setx	loop_1310,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%l6,	%l2,	%o1
	edge8	%i7,	%i3,	%l5
	sethi	0x12AC,	%i6
loop_1310:
	fxor	%f0,	%f6,	%f28
	lduw	[%l7 + 0x08],	%g3
	sir	0x119E
	prefetch	[%l7 + 0x08],	 0x1
	std	%f20,	[%l7 + 0x78]
	taddcc	%o2,	0x0C61,	%g2
	edge16n	%g6,	%o7,	%g1
	nop
	setx loop_1311, %l0, %l1
	jmpl %l1, %i2
	edge16ln	%g4,	%o4,	%i4
	nop
	fitod	%f10,	%f18
	fdtoi	%f18,	%f16
	udivx	%o6,	0x08A8,	%o5
loop_1311:
	xorcc	%o0,	0x14C1,	%l0
	fone	%f10
	fandnot1	%f24,	%f8,	%f24
	sir	0x10AF
	alignaddr	%i0,	%l1,	%g7
	mulx	%l4,	%l3,	%o3
	movrlz	%g5,	0x007,	%i5
	movle	%icc,	%l6,	%i1
	fabsd	%f18,	%f12
	andncc	%l2,	%o1,	%i7
	andncc	%i3,	%i6,	%g3
	mulscc	%l5,	%g2,	%g6
	array32	%o2,	%g1,	%o7
	subccc	%i2,	%o4,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o6,	0x0A40,	%i4
	movl	%xcc,	%o0,	%l0
	udiv	%o5,	0x07E5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc3,	loop_1312
	orncc	%g7,	0x1643,	%i0
	nop
	setx	0x1D826522E044D68F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	setx	0xA6298ED0E06961AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x2A4A9605A18E4E5F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f0,	%f14
loop_1312:
	edge32l	%l3,	%o3,	%l4
	bn,a,pn	%icc,	loop_1313
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%i5
	edge16l	%g5,	%i1,	%l2
	edge16ln	%o1,	%i7,	%l6
loop_1313:
	fmovscc	%icc,	%f31,	%f18
	movcc	%icc,	%i6,	%g3
	edge32n	%i3,	%g2,	%l5
	tgu	%icc,	0x6
	edge8ln	%o2,	%g1,	%g6
	edge32l	%o7,	%o4,	%g4
	tle	%xcc,	0x3
	fabss	%f30,	%f27
	subc	%i2,	%o6,	%i4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l0
	tl	%xcc,	0x5
	fmovrdgez	%o5,	%f2,	%f22
	te	%icc,	0x4
	sdivx	%l1,	0x153A,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f20,	%f21
	mulscc	%g7,	%l3,	%o3
	tne	%icc,	0x4
	array8	%i0,	%i5,	%g5
	xorcc	%l4,	%i1,	%l2
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f2
	fmovrdne	%o1,	%f10,	%f14
	nop
	fitos	%f3,	%f23
	fstox	%f23,	%f22
	fxtos	%f22,	%f7
	sdivcc	%i7,	0x13E7,	%l6
	or	%i6,	0x193B,	%i3
	brlz	%g3,	loop_1314
	edge16n	%l5,	%o2,	%g1
	movrlez	%g2,	%g6,	%o7
	array32	%o4,	%g4,	%i2
loop_1314:
	edge16n	%i4,	%l0,	%o5
	nop
	setx	0x38EDDED8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE3C8786F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f12,	%f1
	popc	%o6,	%o0
	fones	%f7
	fba,a	%fcc2,	loop_1315
	movrgez	%l1,	%l3,	%o3
	brnz	%g7,	loop_1316
	movcs	%xcc,	%i0,	%g5
loop_1315:
	tcs	%icc,	0x4
	fmovscc	%icc,	%f12,	%f30
loop_1316:
	edge32n	%i5,	%i1,	%l4
	tsubcc	%o1,	0x021F,	%i7
	tg	%icc,	0x5
	flush	%l7 + 0x24
	bshuffle	%f20,	%f8,	%f28
	fmovscs	%xcc,	%f11,	%f8
	set	0x20, %i0
	ldstuba	[%l7 + %i0] 0x88,	%l6
	nop
	setx	0xE06A47D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	tsubcc	%i6,	0x090B,	%l2
	fornot2s	%f27,	%f8,	%f20
	sdivcc	%g3,	0x0C0F,	%i3
	movvs	%icc,	%o2,	%g1
	fmovrsgz	%l5,	%f14,	%f29
	flush	%l7 + 0x58
	nop
	setx	0xE6D5067D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f3
	movge	%icc,	%g2,	%g6
	edge8n	%o7,	%g4,	%o4
	fsrc1s	%f8,	%f14
	or	%i4,	0x114B,	%l0
	nop
	setx	0xC07D05174A261651,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB214368D7EBF00AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f30,	%f18
	edge32l	%o5,	%o6,	%i2
	tsubcctv	%l1,	0x0411,	%l3
	fba,a	%fcc3,	loop_1317
	movre	%o0,	0x097,	%g7
	fcmpgt16	%f22,	%f22,	%o3
	tcc	%xcc,	0x4
loop_1317:
	movvc	%xcc,	%g5,	%i5
	set	0x0C, %l4
	lduwa	[%l7 + %l4] 0x88,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge	%xcc,	loop_1318
	tneg	%xcc,	0x3
	add	%i1,	0x041F,	%l4
	fones	%f6
loop_1318:
	fbu	%fcc2,	loop_1319
	tvs	%icc,	0x6
	fcmpne16	%f18,	%f16,	%o1
	nop
	fitos	%f14,	%f0
	fstox	%f0,	%f6
loop_1319:
	edge32l	%l6,	%i7,	%i6
	sdivcc	%g3,	0x0393,	%i3
	set	0x70, %l1
	stba	%l2,	[%l7 + %l1] 0x04
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x70] %asi,	%f4
	prefetch	[%l7 + 0x44],	 0x3
	fmovrse	%o2,	%f29,	%f26
	tg	%xcc,	0x6
	movvs	%icc,	%l5,	%g1
	be,a	loop_1320
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f26,	%f28,	%f14
	edge16n	%g6,	%o7,	%g4
loop_1320:
	orncc	%g2,	%i4,	%l0
	and	%o5,	%o4,	%i2
	smulcc	%l1,	%l3,	%o0
	tne	%icc,	0x4
	fmul8x16al	%f10,	%f3,	%f0
	edge8	%o6,	%o3,	%g7
	fbug	%fcc2,	loop_1321
	fmovrdgez	%g5,	%f6,	%f12
	tpos	%xcc,	0x0
	tpos	%icc,	0x7
loop_1321:
	edge32l	%i0,	%i1,	%l4
	stx	%i5,	[%l7 + 0x58]
	fble,a	%fcc0,	loop_1322
	te	%icc,	0x4
	fblg	%fcc0,	loop_1323
	nop
	setx	loop_1324,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1322:
	edge8	%o1,	%i7,	%i6
	edge16l	%l6,	%g3,	%l2
loop_1323:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x26] %asi,	%i3
loop_1324:
	edge16ln	%l5,	%o2,	%g1
	xorcc	%o7,	0x00B0,	%g4
	fbl	%fcc0,	loop_1325
	fcmple16	%f26,	%f26,	%g2
	edge32	%g6,	%l0,	%i4
	tsubcc	%o5,	0x1AC3,	%i2
loop_1325:
	umul	%o4,	0x19DF,	%l3
	nop
	setx loop_1326, %l0, %l1
	jmpl %l1, %o0
	fbn	%fcc2,	loop_1327
	tn	%icc,	0x7
	and	%o6,	%o3,	%l1
loop_1326:
	edge32ln	%g7,	%g5,	%i1
loop_1327:
	tle	%icc,	0x5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i0,	%i5
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%l4
	tneg	%icc,	0x4
	tleu	%xcc,	0x6
	set	0x30, %i5
	stxa	%o1,	[%l7 + %i5] 0x22
	membar	#Sync
	call	loop_1328
	fnot2	%f10,	%f6
	movge	%xcc,	%i6,	%i7
	tcs	%xcc,	0x5
loop_1328:
	brgez	%g3,	loop_1329
	fble,a	%fcc2,	loop_1330
	fand	%f0,	%f20,	%f26
	sub	%l6,	%i3,	%l5
loop_1329:
	mulx	%l2,	0x0B55,	%o2
loop_1330:
	addc	%o7,	%g1,	%g4
	fbg	%fcc0,	loop_1331
	udivx	%g6,	0x0197,	%g2
	ba	loop_1332
	edge32n	%i4,	%o5,	%i2
loop_1331:
	bn,a	%xcc,	loop_1333
	mulscc	%l0,	%o4,	%o0
loop_1332:
	fbug,a	%fcc2,	loop_1334
	movcs	%icc,	%o6,	%l3
loop_1333:
	or	%o3,	%l1,	%g7
	and	%g5,	%i0,	%i5
loop_1334:
	add	%i1,	0x0E1B,	%o1
	st	%f24,	[%l7 + 0x50]
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x88,	%i6
	fmovdvs	%icc,	%f25,	%f22
	array32	%l4,	%g3,	%i7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
	ldx	[%l7 + 0x20],	%l5
	fnot1s	%f24,	%f31
	fnot1s	%f4,	%f14
	std	%f26,	[%l7 + 0x50]
	orcc	%l2,	0x1A7D,	%l6
	tvc	%xcc,	0x6
	edge16	%o2,	%o7,	%g4
	sdivx	%g1,	0x1065,	%g2
	tsubcctv	%g6,	%i4,	%i2
	brlez	%o5,	loop_1335
	xnorcc	%l0,	%o0,	%o6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o4
loop_1335:
	nop
	set	0x0E, %i6
	ldsba	[%l7 + %i6] 0x18,	%l3
	movl	%xcc,	%l1,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g5,	%o3,	%i5
	fxors	%f25,	%f5,	%f15
	bvc,a,pt	%xcc,	loop_1336
	fbo	%fcc2,	loop_1337
	movrlez	%i0,	0x1D7,	%o1
	tneg	%icc,	0x3
loop_1336:
	edge8n	%i6,	%i1,	%l4
loop_1337:
	movcs	%xcc,	%g3,	%i3
	bl,pt	%xcc,	loop_1338
	movrlz	%i7,	0x28E,	%l5
	sra	%l6,	%o2,	%l2
	edge32l	%o7,	%g1,	%g2
loop_1338:
	tvs	%icc,	0x2
	nop
	setx loop_1339, %l0, %l1
	jmpl %l1, %g4
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
	subcc	%i4,	%i2,	%g6
	srax	%l0,	%o0,	%o5
loop_1339:
	smul	%o4,	%o6,	%l1
loop_1340:
	udivcc	%g7,	0x085E,	%l3
	addcc	%g5,	%i5,	%i0
	fornot2	%f10,	%f28,	%f22
	brz,a	%o1,	loop_1341
	edge32l	%i6,	%o3,	%l4
	taddcc	%g3,	0x1276,	%i3
	movne	%icc,	%i7,	%i1
loop_1341:
	nop
	setx	0x6047DD0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	tneg	%xcc,	0x4
	movg	%icc,	%l6,	%o2
	fmovrslz	%l2,	%f4,	%f6
	srlx	%o7,	0x00,	%g1
	fand	%f12,	%f14,	%f12
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x30] %asi,	%l5
	movrgz	%g2,	0x06B,	%g4
	fands	%f5,	%f12,	%f18
	fble,a	%fcc0,	loop_1342
	nop
	setx	loop_1343,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba	%fcc0,	loop_1344
	subccc	%i4,	0x02EC,	%g6
loop_1342:
	tcs	%icc,	0x6
loop_1343:
	sethi	0x073C,	%l0
loop_1344:
	edge32ln	%o0,	%i2,	%o4
	tcc	%xcc,	0x7
	nop
	setx	0xB45BEB2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f21
	fand	%f30,	%f2,	%f16
	movvc	%xcc,	%o5,	%l1
	nop
	setx loop_1345, %l0, %l1
	jmpl %l1, %o6
	orncc	%l3,	0x0D82,	%g7
	addccc	%i5,	0x1EA7,	%i0
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g5
loop_1345:
	subc	%o1,	%o3,	%i6
	movrne	%g3,	0x14B,	%i3
	tcc	%xcc,	0x5
	fmul8sux16	%f22,	%f0,	%f10
	fba,a	%fcc3,	loop_1346
	stbar
	movle	%icc,	%i7,	%i1
	ble,pn	%icc,	loop_1347
loop_1346:
	bg,a,pt	%icc,	loop_1348
	alignaddrl	%l4,	%l6,	%l2
	edge32n	%o7,	%o2,	%l5
loop_1347:
	tcc	%icc,	0x3
loop_1348:
	ldub	[%l7 + 0x76],	%g1
	wr	%g0,	0x4f,	%asi
	stxa	%g2,	[%g0 + 0x10] %asi
	movpos	%xcc,	%i4,	%g4
	mulx	%g6,	0x0797,	%l0
	andncc	%i2,	%o0,	%o4
	umulcc	%o5,	%l1,	%l3
	faligndata	%f12,	%f30,	%f28
	fbu	%fcc2,	loop_1349
	fandnot1s	%f14,	%f26,	%f23
	movl	%xcc,	%o6,	%i5
	mova	%xcc,	%i0,	%g7
loop_1349:
	orcc	%g5,	%o3,	%i6
	brnz,a	%o1,	loop_1350
	flush	%l7 + 0x6C
	fmovdcs	%icc,	%f25,	%f10
	bvc	%xcc,	loop_1351
loop_1350:
	movgu	%xcc,	%i3,	%i7
	sdivcc	%i1,	0x102A,	%g3
	nop
	set	0x48, %l2
	stx	%l6,	[%l7 + %l2]
loop_1351:
	movrgz	%l2,	%l4,	%o2
	fxnor	%f22,	%f10,	%f30
	andcc	%l5,	0x1AD4,	%o7
	sdivx	%g1,	0x1C7D,	%i4
	edge8	%g2,	%g6,	%l0
	movneg	%icc,	%i2,	%g4
	ta	%xcc,	0x1
	xorcc	%o0,	%o4,	%o5
	fpadd16s	%f7,	%f5,	%f30
	membar	0x44
	tsubcc	%l1,	%o6,	%l3
	addcc	%i0,	%g7,	%i5
	movge	%xcc,	%g5,	%o3
	array8	%i6,	%o1,	%i7
	brgez,a	%i3,	loop_1352
	tpos	%xcc,	0x3
	umulcc	%g3,	%i1,	%l6
	fmovdge	%xcc,	%f27,	%f0
loop_1352:
	subcc	%l4,	%l2,	%o2
	fmovrdgez	%l5,	%f16,	%f20
	sllx	%o7,	0x10,	%i4
	mova	%xcc,	%g1,	%g2
	movle	%xcc,	%l0,	%i2
	orcc	%g6,	%o0,	%g4
	subc	%o4,	%o5,	%o6
	te	%xcc,	0x1
	add	%l3,	0x0821,	%i0
	movge	%icc,	%g7,	%i5
	bg,pn	%icc,	loop_1353
	tle	%icc,	0x2
	nop
	fitos	%f4,	%f0
	fstoi	%f0,	%f29
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1353:
	bn,a,pt	%xcc,	loop_1354
	edge32ln	%l1,	%g5,	%i6
	xnor	%o1,	%i7,	%i3
	set	0x34, %g2
	stha	%o3,	[%l7 + %g2] 0x10
loop_1354:
	array32	%g3,	%i1,	%l6
	popc	0x130E,	%l2
	andncc	%o2,	%l4,	%o7
	movrgz	%l5,	0x188,	%i4
	orcc	%g2,	0x1F66,	%l0
	edge8	%i2,	%g1,	%o0
	fmovde	%xcc,	%f19,	%f5
	tvc	%xcc,	0x4
	fbge,a	%fcc3,	loop_1355
	ta	%icc,	0x0
	movn	%xcc,	%g4,	%g6
	movne	%xcc,	%o4,	%o5
loop_1355:
	tle	%icc,	0x1
	wr	%g0,	0x10,	%asi
	stwa	%o6,	[%l7 + 0x74] %asi
	movpos	%icc,	%i0,	%g7
	add	%i5,	0x06A2,	%l1
	set	0x30, %l6
	ldswa	[%l7 + %l6] 0x81,	%g5
	ba,pt	%xcc,	loop_1356
	mulscc	%i6,	0x01DD,	%l3
	umul	%i7,	0x1351,	%o1
	ld	[%l7 + 0x68],	%f11
loop_1356:
	fcmpeq16	%f4,	%f26,	%o3
	movrlez	%g3,	%i1,	%l6
	bn,a,pn	%icc,	loop_1357
	tcc	%icc,	0x4
	fornot2	%f28,	%f30,	%f16
	movrlz	%i3,	%l2,	%o2
loop_1357:
	fors	%f21,	%f3,	%f31
	st	%f7,	[%l7 + 0x34]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x39
	fmovde	%icc,	%f26,	%f20
	bneg,a	loop_1358
	array32	%o7,	%l4,	%l5
	wr	%g0,	0x80,	%asi
	sta	%f20,	[%l7 + 0x28] %asi
loop_1358:
	for	%f2,	%f12,	%f8
	fxnor	%f16,	%f8,	%f2
	array32	%g2,	%l0,	%i2
	orn	%g1,	0x1D0C,	%i4
	movrgz	%o0,	0x282,	%g6
	ldd	[%l7 + 0x48],	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o5,	%o6
	fnot1	%f2,	%f10
	mulx	%g4,	0x0949,	%i0
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x22] %asi,	%g7
	edge32ln	%i5,	%l1,	%g5
	andn	%i6,	0x0C23,	%i7
	mulscc	%o1,	%o3,	%l3
	bleu,a	%xcc,	loop_1359
	ld	[%l7 + 0x6C],	%f28
	nop
	fitos	%f19,	%f0
	popc	0x1CC1,	%i1
loop_1359:
	addc	%g3,	0x0CCD,	%l6
	fmovsg	%xcc,	%f19,	%f12
	movre	%l2,	0x1B0,	%o2
	brz	%o7,	loop_1360
	sub	%i3,	%l4,	%l5
	bvs	%icc,	loop_1361
	edge32ln	%l0,	%g2,	%g1
loop_1360:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%i2,	[%l7 + 0x30] %asi
loop_1361:
	nop
	setx	0x59BA9E8CC39BD075,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f24
	xor	%o0,	0x19C1,	%g6
	tle	%icc,	0x4
	set	0x55, %g7
	stba	%i4,	[%l7 + %g7] 0x27
	membar	#Sync
	tg	%xcc,	0x1
	addc	%o4,	0x0E7C,	%o6
	nop
	setx loop_1362, %l0, %l1
	jmpl %l1, %g4
	tsubcctv	%o5,	0x0B4A,	%g7
	fpmerge	%f3,	%f14,	%f26
	lduw	[%l7 + 0x0C],	%i0
loop_1362:
	nop
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x2a,	%l0
	te	%xcc,	0x6
	bleu	loop_1363
	movcs	%icc,	%i5,	%i6
	fmovrde	%g5,	%f18,	%f28
	nop
	setx	loop_1364,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1363:
	fabss	%f17,	%f16
	taddcc	%o1,	0x0089,	%i7
	popc	0x0D80,	%o3
loop_1364:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	bvc,a,pt	%xcc,	loop_1365
	tvc	%xcc,	0x5
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f12
	fxtos	%f12,	%f2
	set	0x3C, %o3
	ldsha	[%l7 + %o3] 0x10,	%l3
loop_1365:
	tcc	%xcc,	0x3
	orcc	%g3,	%l6,	%o2
	edge32	%l2,	%o7,	%l4
	fpsub32	%f4,	%f26,	%f14
	te	%xcc,	0x0
	nop
	setx	loop_1366,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%l5,	0x0CE7,	%i3
	movcc	%xcc,	%l0,	%g2
	movle	%xcc,	%i2,	%g1
loop_1366:
	mulscc	%g6,	0x14EA,	%o0
	fandnot2s	%f8,	%f12,	%f18
	movcc	%icc,	%i4,	%o6
	fbge,a	%fcc2,	loop_1367
	nop
	setx	loop_1368,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%o4,	%o5,	%g4
	movle	%icc,	%i0,	%l1
loop_1367:
	tn	%xcc,	0x4
loop_1368:
	edge8n	%i5,	%g7,	%i6
	umul	%o1,	%g5,	%o3
	sdivx	%i7,	0x040D,	%l3
	edge8n	%g3,	%l6,	%o2
	fbg,a	%fcc1,	loop_1369
	fcmpne32	%f30,	%f14,	%i1
	addccc	%l2,	%l4,	%o7
	and	%l5,	0x05E4,	%i3
loop_1369:
	nop
	fitos	%f4,	%f3
	fstox	%f3,	%f28
	tle	%xcc,	0x7
	movcc	%icc,	%l0,	%g2
	udiv	%g1,	0x1ADA,	%g6
	move	%icc,	%i2,	%o0
	fbn,a	%fcc2,	loop_1370
	ldsw	[%l7 + 0x64],	%i4
	nop
	setx	0x32C19B53F40905DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x94142F506BDA7ACE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f14,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1370:
	fmovsne	%xcc,	%f28,	%f15
	sllx	%o4,	%o5,	%g4
	andcc	%o6,	0x06AD,	%i0
	fcmpne16	%f22,	%f28,	%l1
	ldsw	[%l7 + 0x3C],	%g7
	fsrc1	%f22,	%f24
	nop
	fitod	%f8,	%f4
	fdtox	%f4,	%f28
	addcc	%i6,	0x07B4,	%i5
	edge16l	%o1,	%o3,	%g5
	ldub	[%l7 + 0x25],	%l3
	fmuld8sux16	%f14,	%f8,	%f12
	ldstub	[%l7 + 0x6C],	%g3
	fbne,a	%fcc0,	loop_1371
	sra	%i7,	%o2,	%l6
	edge32n	%i1,	%l2,	%o7
	edge16l	%l4,	%i3,	%l5
loop_1371:
	movcc	%icc,	%g2,	%l0
	set	0x42, %o1
	ldsha	[%l7 + %o1] 0x89,	%g6
	nop
	setx loop_1372, %l0, %l1
	jmpl %l1, %i2
	taddcc	%g1,	%i4,	%o4
	fmovrsgz	%o0,	%f23,	%f7
	movne	%xcc,	%o5,	%o6
loop_1372:
	array8	%i0,	%g4,	%l1
	xnorcc	%i6,	0x12E3,	%i5
	tne	%icc,	0x5
	mulscc	%o1,	0x1614,	%g7
	sllx	%o3,	%g5,	%l3
	movcs	%xcc,	%i7,	%g3
	movgu	%xcc,	%o2,	%i1
	movvc	%icc,	%l6,	%o7
	bl,pt	%xcc,	loop_1373
	fmovrdgz	%l4,	%f28,	%f30
	be,pn	%xcc,	loop_1374
	te	%xcc,	0x1
loop_1373:
	tl	%icc,	0x0
	subc	%l2,	0x0745,	%l5
loop_1374:
	ldx	[%l7 + 0x78],	%i3
	umulcc	%l0,	0x117F,	%g6
	movre	%i2,	%g1,	%i4
	tneg	%icc,	0x4
	sra	%o4,	0x0F,	%g2
	udiv	%o5,	0x19DF,	%o0
	movrne	%i0,	0x063,	%o6
	ldub	[%l7 + 0x3D],	%g4
	bvc,a	loop_1375
	mova	%xcc,	%l1,	%i6
	bleu,a	%xcc,	loop_1376
	array8	%o1,	%g7,	%i5
loop_1375:
	fsrc1s	%f11,	%f28
	subccc	%g5,	%o3,	%i7
loop_1376:
	movcc	%xcc,	%l3,	%g3
	nop
	setx	loop_1377,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%i1,	%l6,	%o7
	xnor	%o2,	0x1D9A,	%l2
	add	%l5,	%i3,	%l0
loop_1377:
	tcc	%icc,	0x4
	tge	%xcc,	0x1
	bn	loop_1378
	movne	%icc,	%l4,	%g6
	movg	%xcc,	%g1,	%i2
	brlz,a	%o4,	loop_1379
loop_1378:
	tg	%xcc,	0x6
	lduw	[%l7 + 0x7C],	%i4
	tn	%xcc,	0x2
loop_1379:
	bl	loop_1380
	edge8ln	%o5,	%g2,	%o0
	for	%f10,	%f0,	%f22
	array16	%o6,	%g4,	%l1
loop_1380:
	ldsb	[%l7 + 0x14],	%i6
	smul	%i0,	%g7,	%i5
	nop
	setx	0x96CB82BC10406C6E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fbg	%fcc0,	loop_1381
	faligndata	%f24,	%f16,	%f22
	sllx	%g5,	0x05,	%o3
	tcs	%xcc,	0x0
loop_1381:
	addcc	%i7,	%l3,	%o1
	orcc	%i1,	0x0332,	%l6
	subc	%g3,	0x199D,	%o7
	movpos	%icc,	%l2,	%o2
	sra	%i3,	%l0,	%l4
	tsubcc	%l5,	0x1091,	%g1
	brlez	%i2,	loop_1382
	movre	%o4,	%i4,	%g6
	addcc	%g2,	0x03FF,	%o0
	fblg	%fcc3,	loop_1383
loop_1382:
	faligndata	%f4,	%f20,	%f6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x14] %asi,	%o5
loop_1383:
	bpos,a	loop_1384
	movl	%icc,	%o6,	%l1
	tge	%xcc,	0x3
	array16	%g4,	%i0,	%g7
loop_1384:
	fcmpgt32	%f24,	%f28,	%i5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i6,	%o3
	move	%xcc,	%i7,	%g5
	movne	%xcc,	%o1,	%i1
	bn,pt	%xcc,	loop_1385
	movgu	%icc,	%l3,	%l6
	mulscc	%g3,	%l2,	%o2
	movle	%xcc,	%o7,	%l0
loop_1385:
	bvc,a	%xcc,	loop_1386
	orcc	%i3,	0x1E1A,	%l4
	ldd	[%l7 + 0x78],	%f26
	membar	0x73
loop_1386:
	movrne	%l5,	%i2,	%o4
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x1f
	membar	#Sync
	lduw	[%l7 + 0x70],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g6,	%g2,	%o0
	fnands	%f17,	%f27,	%f11
	addccc	%g1,	0x05E2,	%o5
	tcc	%icc,	0x2
	orcc	%o6,	0x08E0,	%g4
	fcmple16	%f24,	%f2,	%i0
	wr	%g0,	0x23,	%asi
	stha	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	call	loop_1387
	tvc	%icc,	0x2
	bcc	%icc,	loop_1388
	edge8n	%i5,	%g7,	%o3
loop_1387:
	edge32ln	%i6,	%i7,	%g5
	orn	%i1,	%l3,	%o1
loop_1388:
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f14
	ld	[%l7 + 0x14],	%f24
	move	%xcc,	%g3,	%l6
	fbuge	%fcc3,	loop_1389
	addcc	%o2,	0x1FB6,	%l2
	movne	%icc,	%l0,	%i3
	bcs,pn	%xcc,	loop_1390
loop_1389:
	fxor	%f26,	%f30,	%f6
	fmul8sux16	%f30,	%f2,	%f8
	sub	%l4,	0x092F,	%o7
loop_1390:
	fornot1s	%f8,	%f25,	%f13
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x56] %asi,	%i2
	mova	%xcc,	%o4,	%l5
	array8	%i4,	%g2,	%o0
	bcs	loop_1391
	bn,a	%icc,	loop_1392
	tcs	%xcc,	0x1
	fbuge	%fcc1,	loop_1393
loop_1391:
	edge8n	%g1,	%g6,	%o6
loop_1392:
	fmovsl	%xcc,	%f16,	%f26
	fnot1	%f18,	%f6
loop_1393:
	tvs	%icc,	0x7
	srlx	%o5,	%g4,	%i0
	movn	%icc,	%i5,	%l1
	sll	%o3,	%g7,	%i6
	tge	%icc,	0x2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i7
	tpos	%icc,	0x2
	mulx	%i1,	%g5,	%l3
	movvc	%xcc,	%o1,	%g3
	tvs	%icc,	0x6
	addccc	%o2,	%l6,	%l2
	fandnot1s	%f6,	%f13,	%f3
	ble,a,pt	%icc,	loop_1394
	and	%i3,	0x0701,	%l0
	bleu	loop_1395
	te	%xcc,	0x5
loop_1394:
	nop
	setx loop_1396, %l0, %l1
	jmpl %l1, %l4
	nop
	setx	0x0E5B27FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f18
loop_1395:
	nop
	setx	0x6B006DE2105090A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	set	0x70, %o0
	sta	%f15,	[%l7 + %o0] 0x88
loop_1396:
	edge16ln	%i2,	%o4,	%o7
	srl	%l5,	0x00,	%g2
	fmovda	%xcc,	%f4,	%f16
	fmovrsgez	%o0,	%f10,	%f28
	orn	%g1,	0x0ACF,	%g6
	movge	%icc,	%i4,	%o6
	fpack32	%f10,	%f22,	%f10
	fba,a	%fcc1,	loop_1397
	movrlz	%g4,	%i0,	%o5
	fpadd16s	%f20,	%f23,	%f18
	movrgz	%l1,	%o3,	%i5
loop_1397:
	call	loop_1398
	movgu	%icc,	%i6,	%i7
	nop
	fitos	%f16,	%f13
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0x0
loop_1398:
	sth	%g5,	[%l7 + 0x4C]
	udivcc	%l3,	0x1EBA,	%i1
	fsrc1	%f6,	%f22
	udiv	%g3,	0x1752,	%o2
	movre	%l6,	0x1EF,	%l2
	xnorcc	%i3,	%l0,	%o1
	movne	%xcc,	%i2,	%l4
	ldsw	[%l7 + 0x48],	%o7
	move	%xcc,	%o4,	%l5
	edge32	%g2,	%o0,	%g6
	mulscc	%g1,	%o6,	%g4
	edge32l	%i0,	%i4,	%o5
	membar	0x29
	sethi	0x0EDF,	%o3
	stbar
	tneg	%icc,	0x3
	fbn	%fcc2,	loop_1399
	lduh	[%l7 + 0x16],	%l1
	sllx	%i6,	%i5,	%i7
	movrne	%g7,	0x1A6,	%g5
loop_1399:
	tsubcc	%i1,	%l3,	%o2
	fmovdvs	%icc,	%f19,	%f4
	set	0x4C, %o4
	stwa	%g3,	[%l7 + %o4] 0x2a
	membar	#Sync
	nop
	setx	0xC256F9C79043EE71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovrsgez	%l6,	%f31,	%f8
	lduh	[%l7 + 0x3A],	%l2
	tn	%xcc,	0x1
	tvc	%icc,	0x0
	be,a,pn	%icc,	loop_1400
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f15,	%f6,	%f12
	movrne	%i3,	0x356,	%l0
loop_1400:
	movle	%icc,	%o1,	%l4
	add	%o7,	0x18CE,	%o4
	tcc	%xcc,	0x7
	tgu	%xcc,	0x3
	udiv	%i2,	0x11FD,	%l5
	tsubcctv	%g2,	%g6,	%o0
	nop
	set	0x70, %g1
	ldsw	[%l7 + %g1],	%o6
	fmovrsgez	%g1,	%f7,	%f20
	fbg	%fcc1,	loop_1401
	edge8	%g4,	%i0,	%o5
	umul	%i4,	0x1D1F,	%o3
	movre	%l1,	0x08A,	%i5
loop_1401:
	fbn,a	%fcc1,	loop_1402
	taddcc	%i7,	%g7,	%i6
	movrlz	%g5,	%l3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1402:
	nop
	set	0x50, %l3
	stba	%g3,	[%l7 + %l3] 0xea
	membar	#Sync
	edge16l	%l6,	%l2,	%o2
	alignaddr	%i3,	%o1,	%l0
	udiv	%o7,	0x1683,	%l4
	tcs	%icc,	0x5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o4
	sdivx	%i2,	0x1070,	%l5
	movneg	%xcc,	%g2,	%o0
	udivx	%g6,	0x19A3,	%o6
	fmovscc	%xcc,	%f12,	%f9
	fmovd	%f14,	%f12
	subccc	%g4,	0x02F3,	%g1
	umul	%i0,	0x1099,	%o5
	fxnor	%f6,	%f30,	%f14
	tleu	%xcc,	0x5
	fmovscc	%xcc,	%f26,	%f26
	sra	%o3,	0x12,	%l1
	umulcc	%i4,	0x039C,	%i7
	xor	%g7,	%i5,	%i6
	fnegd	%f0,	%f6
	fbe	%fcc2,	loop_1403
	for	%f10,	%f0,	%f8
	array16	%l3,	%i1,	%g3
	sdiv	%g5,	0x0EBE,	%l2
loop_1403:
	fxnor	%f0,	%f8,	%f6
	addc	%l6,	%o2,	%i3
	nop
	setx	loop_1404,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%l0,	%o7,	%l4
	orn	%o4,	%o1,	%l5
	tne	%xcc,	0x0
loop_1404:
	fmovdg	%icc,	%f30,	%f3
	udivcc	%g2,	0x01B4,	%i2
	edge32n	%o0,	%o6,	%g4
	edge16ln	%g6,	%i0,	%o5
	fmovdleu	%xcc,	%f19,	%f26
	movrlz	%o3,	0x1BD,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i4,	%i7
	set	0x30, %l5
	lduha	[%l7 + %l5] 0x81,	%g7
	fmovdg	%xcc,	%f20,	%f28
	flush	%l7 + 0x74
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%i5
	fba,a	%fcc3,	loop_1405
	edge8ln	%l1,	%i6,	%l3
	bn,pn	%icc,	loop_1406
	array8	%g3,	%g5,	%l2
loop_1405:
	nop
	setx	loop_1407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1s	%f9,	%f20
loop_1406:
	mulscc	%l6,	0x1D60,	%i1
	fornot2s	%f6,	%f12,	%f18
loop_1407:
	array32	%i3,	%o2,	%o7
	edge16	%l4,	%l0,	%o1
	array16	%o4,	%l5,	%i2
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f16
	edge32	%o0,	%g2,	%o6
	fnot2	%f20,	%f2
	fbuge	%fcc0,	loop_1408
	movre	%g6,	%g4,	%o5
	nop
	setx	0xE2F8CCF1C1152460,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x2C87C366DAE740D5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f12,	%f22
	nop
	setx	0x78B893F187E3F026,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x84819FD7FBE99844,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f22,	%f24
loop_1408:
	tsubcc	%o3,	0x006F,	%g1
	fmovse	%icc,	%f26,	%f22
	array16	%i4,	%i0,	%i7
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x14,	%f16
	umulcc	%i5,	%g7,	%l1
	edge32	%i6,	%l3,	%g3
	set	0x24, %l0
	sta	%f29,	[%l7 + %l0] 0x89
	bneg,pt	%xcc,	loop_1409
	fsrc2s	%f19,	%f7
	array16	%g5,	%l2,	%i1
	movrgz	%l6,	0x198,	%i3
loop_1409:
	movleu	%xcc,	%o2,	%l4
	tn	%xcc,	0x3
	fbo,a	%fcc2,	loop_1410
	umulcc	%l0,	0x1FB6,	%o7
	tgu	%icc,	0x2
	movrgz	%o1,	%o4,	%i2
loop_1410:
	tg	%icc,	0x5
	fmovdl	%xcc,	%f8,	%f4
	ldstub	[%l7 + 0x14],	%l5
	taddcc	%o0,	%o6,	%g6
	movg	%xcc,	%g4,	%o5
	andcc	%g2,	0x0FB2,	%g1
	edge8n	%o3,	%i0,	%i4
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x11,	%i7
	nop
	setx loop_1411, %l0, %l1
	jmpl %l1, %i5
	fblg,a	%fcc2,	loop_1412
	tneg	%icc,	0x4
	tl	%icc,	0x3
loop_1411:
	sll	%l1,	%i6,	%l3
loop_1412:
	subccc	%g7,	0x01C8,	%g3
	fmovda	%icc,	%f6,	%f19
	ba,pn	%icc,	loop_1413
	movge	%icc,	%l2,	%i1
	fmuld8sux16	%f13,	%f0,	%f10
	array8	%g5,	%i3,	%l6
loop_1413:
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f10
	sir	0x09FE
	edge32n	%l4,	%o2,	%o7
	fmovdcc	%icc,	%f3,	%f29
	ldd	[%l7 + 0x28],	%f28
	movcc	%icc,	%l0,	%o1
	sdivcc	%i2,	0x13F7,	%o4
	movgu	%xcc,	%l5,	%o0
	fmovspos	%xcc,	%f15,	%f24
	fcmpeq32	%f20,	%f8,	%g6
	fmovdcc	%xcc,	%f30,	%f13
	fmuld8sux16	%f4,	%f24,	%f10
	fandnot1s	%f27,	%f26,	%f28
	fmovrdgez	%g4,	%f14,	%f8
	fpackfix	%f4,	%f16
	alignaddrl	%o5,	%g2,	%o6
	pdist	%f30,	%f30,	%f22
	movvs	%icc,	%o3,	%g1
	andn	%i0,	0x0E70,	%i7
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f10
	movrgez	%i4,	%l1,	%i5
	subcc	%l3,	0x11FF,	%i6
	tsubcctv	%g7,	0x13B4,	%l2
	ldsh	[%l7 + 0x2E],	%i1
	subccc	%g3,	0x03D4,	%g5
	sll	%l6,	0x08,	%i3
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f14
	andncc	%l4,	%o7,	%l0
	edge8n	%o1,	%i2,	%o2
	bvc,pt	%icc,	loop_1414
	bpos	%xcc,	loop_1415
	lduw	[%l7 + 0x54],	%o4
	edge16l	%o0,	%g6,	%g4
loop_1414:
	edge32n	%o5,	%l5,	%o6
loop_1415:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fnand	%f30,	%f16,	%f6
	xnorcc	%o3,	0x12C3,	%g2
	fmuld8sux16	%f25,	%f12,	%f16
	movvc	%icc,	%i0,	%g1
	for	%f20,	%f6,	%f2
	fand	%f30,	%f20,	%f10
	bvs,a,pn	%xcc,	loop_1416
	nop
	setx	0x7FD5BC54,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x004DA50A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f6,	%f24
	tleu	%icc,	0x7
	orcc	%i4,	%i7,	%i5
loop_1416:
	fornot2s	%f9,	%f1,	%f31
	fmovscc	%icc,	%f13,	%f20
	set	0x1A, %i1
	stha	%l1,	[%l7 + %i1] 0xea
	membar	#Sync
	fpmerge	%f15,	%f15,	%f28
	set	0x70, %o2
	sta	%f9,	[%l7 + %o2] 0x88
	tpos	%xcc,	0x6
	ba,pt	%xcc,	loop_1417
	ta	%icc,	0x2
	srax	%i6,	0x0B,	%l3
	sllx	%g7,	0x07,	%i1
loop_1417:
	nop
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sdivx	%g3,	0x10A3,	%l2
	fmovrdlez	%l6,	%f18,	%f4
	fmuld8ulx16	%f16,	%f17,	%f4
	edge8	%g5,	%l4,	%o7
	andn	%i3,	0x0C5B,	%o1
	sdivcc	%l0,	0x0A98,	%o2
	xorcc	%i2,	%o4,	%o0
	fmovdvc	%xcc,	%f10,	%f4
	set	0x52, %o7
	ldsha	[%l7 + %o7] 0x15,	%g6
	fmovda	%xcc,	%f8,	%f5
	alignaddr	%o5,	%g4,	%o6
	stx	%o3,	[%l7 + 0x60]
	stx	%g2,	[%l7 + 0x30]
	mulscc	%l5,	0x1C6D,	%g1
	tvc	%icc,	0x7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i0
	udivcc	%i4,	0x0AE5,	%i5
	bneg,a,pn	%xcc,	loop_1418
	fmovdgu	%icc,	%f21,	%f22
	set	0x61, %g4
	ldsba	[%l7 + %g4] 0x88,	%i7
loop_1418:
	movcc	%xcc,	%i6,	%l1
	nop
	set	0x76, %l4
	lduh	[%l7 + %l4],	%g7
	brz	%i1,	loop_1419
	ldstub	[%l7 + 0x27],	%l3
	fcmpne32	%f16,	%f28,	%g3
	ldub	[%l7 + 0x7F],	%l6
loop_1419:
	fbo,a	%fcc3,	loop_1420
	sub	%g5,	%l4,	%l2
	fmul8x16	%f26,	%f10,	%f12
	alignaddr	%i3,	%o1,	%o7
loop_1420:
	movvc	%icc,	%o2,	%i2
	bcc	%xcc,	loop_1421
	tle	%icc,	0x5
	movcs	%icc,	%o4,	%l0
	set	0x7C, %i0
	lduwa	[%l7 + %i0] 0x18,	%g6
loop_1421:
	fmovsgu	%xcc,	%f4,	%f18
	movle	%xcc,	%o0,	%o5
	bvs,a	%xcc,	loop_1422
	fmovdneg	%icc,	%f0,	%f13
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g4
loop_1422:
	nop
	fitod	%f0,	%f12
	bcs,a,pn	%icc,	loop_1423
	edge8	%o6,	%o3,	%g2
	mulx	%g1,	0x06C1,	%i0
	ldx	[%l7 + 0x10],	%l5
loop_1423:
	edge16n	%i4,	%i7,	%i6
	movpos	%icc,	%i5,	%l1
	move	%xcc,	%g7,	%i1
	tn	%icc,	0x6
	smul	%g3,	%l3,	%l6
	fornot2	%f16,	%f6,	%f20
	movvs	%xcc,	%l4,	%l2
	alignaddrl	%g5,	%o1,	%o7
	andcc	%i3,	0x154C,	%i2
	fpsub32	%f26,	%f18,	%f20
	bcs	%icc,	loop_1424
	movne	%xcc,	%o2,	%o4
	fbul	%fcc3,	loop_1425
	orncc	%g6,	%o0,	%l0
loop_1424:
	udiv	%o5,	0x1E23,	%g4
	for	%f26,	%f22,	%f18
loop_1425:
	tge	%xcc,	0x6
	srax	%o3,	0x05,	%o6
	bgu	loop_1426
	brgez	%g1,	loop_1427
	fmovsleu	%xcc,	%f13,	%f28
	fmovdleu	%icc,	%f11,	%f29
loop_1426:
	add	%i0,	0x1AD9,	%l5
loop_1427:
	fmovdn	%xcc,	%f1,	%f4
	sllx	%g2,	%i7,	%i6
	ta	%xcc,	0x0
	movn	%xcc,	%i4,	%i5
	bn,pn	%xcc,	loop_1428
	edge32	%g7,	%l1,	%g3
	subccc	%l3,	%i1,	%l4
	sub	%l6,	%g5,	%o1
loop_1428:
	edge16ln	%o7,	%i3,	%i2
	andn	%o2,	%l2,	%o4
	tne	%xcc,	0x6
	fmovsne	%icc,	%f29,	%f2
	edge32ln	%o0,	%g6,	%l0
	fsrc2	%f4,	%f4
	smul	%g4,	%o3,	%o6
	alignaddrl	%g1,	%i0,	%l5
	udivcc	%o5,	0x12D6,	%i7
	movl	%icc,	%i6,	%g2
	mova	%xcc,	%i5,	%i4
	fblg,a	%fcc3,	loop_1429
	smulcc	%g7,	%l1,	%g3
	taddcc	%l3,	%i1,	%l4
	subcc	%g5,	%l6,	%o1
loop_1429:
	andncc	%i3,	%i2,	%o7
	set	0x50, %i4
	sta	%f12,	[%l7 + %i4] 0x19
	fmovs	%f24,	%f11
	fpsub16s	%f18,	%f24,	%f3
	add	%l2,	%o2,	%o0
	xorcc	%g6,	0x1C39,	%o4
	movcc	%xcc,	%g4,	%l0
	tvc	%xcc,	0x1
	fnot1	%f4,	%f8
	brgz,a	%o6,	loop_1430
	movleu	%icc,	%o3,	%g1
	edge8n	%i0,	%l5,	%i7
	mulscc	%i6,	%g2,	%i5
loop_1430:
	brlez	%o5,	loop_1431
	and	%i4,	%g7,	%l1
	sllx	%g3,	%l3,	%i1
	wr	%g0,	0x89,	%asi
	stwa	%g5,	[%l7 + 0x60] %asi
loop_1431:
	tvc	%xcc,	0x2
	andcc	%l6,	0x12D2,	%o1
	mova	%icc,	%i3,	%i2
	srl	%o7,	%l4,	%l2
	movre	%o0,	%o2,	%o4
	edge8	%g6,	%g4,	%l0
	brgz,a	%o6,	loop_1432
	tg	%icc,	0x4
	st	%f27,	[%l7 + 0x4C]
	movle	%icc,	%g1,	%i0
loop_1432:
	nop
	set	0x60, %i5
	swapa	[%l7 + %i5] 0x19,	%o3
	fnands	%f20,	%f22,	%f5
	swap	[%l7 + 0x78],	%l5
	edge16	%i7,	%i6,	%g2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%i5
	movvc	%icc,	%i4,	%g7
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f10
	sll	%l1,	0x0D,	%o5
	udivx	%l3,	0x1F28,	%i1
	smul	%g5,	%l6,	%g3
	movge	%icc,	%i3,	%i2
	bvc,a	loop_1433
	edge16l	%o7,	%o1,	%l2
	nop
	setx	0x175B154FA052F488,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	tl	%xcc,	0x1
loop_1433:
	fmovse	%icc,	%f4,	%f28
	bne	%icc,	loop_1434
	tpos	%xcc,	0x6
	membar	0x46
	fnands	%f7,	%f14,	%f6
loop_1434:
	edge16	%o0,	%o2,	%o4
	set	0x40, %l1
	sta	%f29,	[%l7 + %l1] 0x89
	fmul8x16	%f9,	%f26,	%f2
	sdiv	%g6,	0x0721,	%l4
	fmovdn	%icc,	%f25,	%f13
	flush	%l7 + 0x48
	movn	%icc,	%l0,	%g4
	brnz	%g1,	loop_1435
	brgez,a	%i0,	loop_1436
	fzero	%f22
	smulcc	%o6,	%o3,	%i7
loop_1435:
	ldsb	[%l7 + 0x0C],	%i6
loop_1436:
	sdivcc	%l5,	0x06BA,	%i5
	fmovrslez	%g2,	%f9,	%f7
	fmovsge	%xcc,	%f4,	%f4
	umul	%i4,	%g7,	%o5
	array16	%l3,	%l1,	%i1
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movg	%icc,	%l6,	%g3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f28
	movneg	%icc,	%g5,	%i3
	edge16l	%i2,	%o1,	%o7
	tcc	%xcc,	0x1
	fpadd16	%f16,	%f10,	%f6
	fcmpgt16	%f2,	%f20,	%o0
	tg	%icc,	0x3
	popc	0x0C7B,	%l2
	brlez,a	%o2,	loop_1437
	tge	%icc,	0x5
	bneg,a	loop_1438
	tsubcctv	%g6,	0x05D7,	%o4
loop_1437:
	mova	%icc,	%l4,	%g4
	array16	%g1,	%l0,	%i0
loop_1438:
	sub	%o3,	%o6,	%i7
	fbn	%fcc0,	loop_1439
	movrlz	%i6,	0x1B3,	%i5
	call	loop_1440
	std	%f10,	[%l7 + 0x38]
loop_1439:
	xnorcc	%g2,	%i4,	%g7
	add	%l5,	%l3,	%o5
loop_1440:
	array8	%l1,	%l6,	%i1
	fbule	%fcc1,	loop_1441
	movleu	%xcc,	%g5,	%i3
	brlez	%g3,	loop_1442
	tsubcctv	%i2,	%o7,	%o1
loop_1441:
	sth	%l2,	[%l7 + 0x7A]
	edge32ln	%o0,	%g6,	%o4
loop_1442:
	addc	%o2,	%g4,	%g1
	fmovrdlz	%l4,	%f16,	%f14
	std	%f14,	[%l7 + 0x50]
	set	0x4E, %g6
	ldsha	[%l7 + %g6] 0x19,	%i0
	subccc	%o3,	0x1E13,	%o6
	mulscc	%i7,	%l0,	%i6
	fcmple32	%f16,	%f26,	%i5
	brz,a	%g2,	loop_1443
	tvs	%icc,	0x6
	fmovrdgez	%g7,	%f30,	%f2
	sir	0x0C94
loop_1443:
	fmovdleu	%icc,	%f22,	%f10
	xnorcc	%l5,	%i4,	%o5
	udiv	%l3,	0x11EE,	%l6
	ldx	[%l7 + 0x40],	%i1
	udivcc	%g5,	0x0E9F,	%l1
	alignaddrl	%g3,	%i3,	%i2
	subc	%o1,	0x0D6A,	%l2
	edge16l	%o0,	%o7,	%g6
	movpos	%xcc,	%o2,	%g4
	array8	%o4,	%l4,	%g1
	fmovrslez	%o3,	%f14,	%f31
	movleu	%xcc,	%i0,	%o6
	movrlz	%l0,	0x376,	%i7
	sub	%i5,	%i6,	%g2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x58] %asi,	%g7
	smul	%i4,	%o5,	%l5
	fsrc1	%f4,	%f26
	sdivcc	%l3,	0x0539,	%l6
	brlez,a	%g5,	loop_1444
	fcmpne32	%f8,	%f14,	%i1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x14,	%f16
loop_1444:
	fmovdcs	%xcc,	%f30,	%f20
	fnand	%f6,	%f6,	%f6
	edge8n	%g3,	%i3,	%l1
	edge16l	%o1,	%l2,	%o0
	be,pn	%icc,	loop_1445
	edge32ln	%o7,	%i2,	%g6
	edge32l	%g4,	%o2,	%o4
	sllx	%g1,	%l4,	%i0
loop_1445:
	tleu	%icc,	0x1
	tleu	%icc,	0x3
	fbg,a	%fcc3,	loop_1446
	tne	%xcc,	0x5
	fpadd32	%f10,	%f0,	%f10
	st	%f6,	[%l7 + 0x38]
loop_1446:
	bne	loop_1447
	bl,a	%xcc,	loop_1448
	bshuffle	%f18,	%f20,	%f16
	sub	%o6,	0x0434,	%l0
loop_1447:
	andcc	%o3,	0x141A,	%i7
loop_1448:
	movcs	%xcc,	%i6,	%i5
	fmovrdgz	%g2,	%f28,	%f0
	tn	%xcc,	0x7
	fmovrde	%i4,	%f22,	%f30
	movrne	%g7,	0x0F7,	%l5
	tpos	%icc,	0x6
	movvs	%xcc,	%l3,	%l6
	array8	%o5,	%i1,	%g3
	sub	%g5,	0x0CFC,	%i3
	alignaddr	%o1,	%l1,	%l2
	edge32ln	%o7,	%i2,	%g6
	fmovd	%f18,	%f18
	nop
	setx	loop_1449,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulscc	%g4,	0x068C,	%o0
	fmovrse	%o4,	%f20,	%f31
	set	0x68, %i6
	lda	[%l7 + %i6] 0x04,	%f13
loop_1449:
	nop
	set	0x48, %l6
	stwa	%o2,	[%l7 + %l6] 0x80
	srax	%g1,	0x11,	%l4
	tg	%xcc,	0x7
	subcc	%o6,	0x0B89,	%l0
	fblg	%fcc2,	loop_1450
	tvs	%xcc,	0x0
	bneg	loop_1451
	movle	%icc,	%i0,	%i7
loop_1450:
	sra	%o3,	%i6,	%g2
	membar	0x24
loop_1451:
	movge	%xcc,	%i5,	%g7
	nop
	fitos	%f1,	%f26
	fstod	%f26,	%f16
	subcc	%l5,	0x0A51,	%i4
	bneg,a,pn	%icc,	loop_1452
	fandnot2s	%f10,	%f26,	%f26
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
	xor	%l3,	%o5,	%i1
loop_1452:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l6,	%g5
loop_1453:
	movge	%icc,	%i3,	%o1
	movrne	%l1,	0x07E,	%g3
	movle	%icc,	%l2,	%o7
	fmovde	%icc,	%f29,	%f21
	set	0x36, %g7
	stha	%g6,	[%l7 + %g7] 0xe3
	membar	#Sync
	edge16n	%i2,	%g4,	%o0
	movl	%xcc,	%o2,	%o4
	andcc	%l4,	0x0B0A,	%o6
	fmovsle	%icc,	%f6,	%f19
	smul	%g1,	0x1EE0,	%i0
	tneg	%icc,	0x7
	membar	0x23
	tle	%xcc,	0x3
	and	%l0,	%i7,	%i6
	bne,a	%icc,	loop_1454
	array32	%o3,	%g2,	%g7
	edge32n	%l5,	%i4,	%i5
	fnegd	%f20,	%f26
loop_1454:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x72] %asi,	%o5
	popc	0x0958,	%i1
	addc	%l6,	0x1157,	%g5
	fpsub16	%f20,	%f8,	%f16
	fcmpne16	%f8,	%f0,	%l3
	sdivx	%o1,	0x1DAA,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x10,	%g3,	%l2
	brgz	%l1,	loop_1455
	fmovd	%f24,	%f30
	movneg	%icc,	%o7,	%g6
	bg	loop_1456
loop_1455:
	movl	%xcc,	%g4,	%o0
	xor	%o2,	%o4,	%l4
	movge	%icc,	%o6,	%g1
loop_1456:
	fbg,a	%fcc1,	loop_1457
	edge32n	%i0,	%i2,	%l0
	movne	%xcc,	%i6,	%o3
	nop
	setx	0x207A6459,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
loop_1457:
	flush	%l7 + 0x0C
	tcs	%icc,	0x4
	fnands	%f9,	%f12,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f30,	%f11
	set	0x30, %o6
	stxa	%g2,	[%l7 + %o6] 0x14
	fmovde	%xcc,	%f25,	%f0
	movrlez	%g7,	0x200,	%l5
	be,pt	%xcc,	loop_1458
	udivx	%i7,	0x0856,	%i4
	popc	0x111A,	%o5
	tg	%icc,	0x1
loop_1458:
	umul	%i5,	0x0821,	%l6
	edge32	%i1,	%l3,	%o1
	fnors	%f14,	%f2,	%f21
	alignaddrl	%g5,	%g3,	%l2
	mulx	%i3,	%o7,	%l1
	srl	%g6,	%o0,	%o2
	smul	%o4,	0x1036,	%l4
	std	%f26,	[%l7 + 0x78]
	taddcctv	%g4,	%o6,	%i0
	ldstub	[%l7 + 0x42],	%i2
	movge	%icc,	%l0,	%g1
	sra	%o3,	%i6,	%g7
	nop
	setx	0x3CD561FB905DD82B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fbuge	%fcc1,	loop_1459
	movle	%xcc,	%l5,	%i7
	sub	%i4,	0x1EB2,	%g2
	sra	%o5,	%l6,	%i1
loop_1459:
	nop
	fitos	%f7,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f21
	taddcctv	%i5,	0x184A,	%l3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x50] %asi,	%g5
	orncc	%g3,	0x170D,	%o1
	brgez,a	%i3,	loop_1460
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f24
	tcs	%icc,	0x4
	nop
	set	0x78, %o3
	stx	%l2,	[%l7 + %o3]
loop_1460:
	tsubcctv	%o7,	0x0874,	%l1
	mulx	%g6,	%o2,	%o4
	fmovrdlz	%l4,	%f12,	%f24
	ldsh	[%l7 + 0x2C],	%o0
	fble	%fcc0,	loop_1461
	udivx	%o6,	0x057B,	%i0
	te	%icc,	0x5
	fsrc2s	%f17,	%f31
loop_1461:
	array8	%g4,	%l0,	%i2
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movpos	%icc,	%o3,	%i6
	xnorcc	%g7,	0x1226,	%g1
	lduh	[%l7 + 0x6C],	%i7
	edge32n	%i4,	%l5,	%o5
	or	%l6,	0x16DE,	%i1
	tsubcctv	%g2,	0x08F8,	%i5
	nop
	setx	0x577FE056,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x8B741C11,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f29,	%f20
	movneg	%icc,	%g5,	%g3
	set	0x28, %g2
	stha	%o1,	[%l7 + %g2] 0x0c
	bneg	%xcc,	loop_1462
	fbo,a	%fcc1,	loop_1463
	movvc	%xcc,	%l3,	%l2
	bcs,pt	%icc,	loop_1464
loop_1462:
	fbu,a	%fcc1,	loop_1465
loop_1463:
	nop
	setx	0xC71CB014,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xF4716C39,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f20,	%f5
	ldsw	[%l7 + 0x2C],	%o7
loop_1464:
	brgez	%i3,	loop_1466
loop_1465:
	movgu	%xcc,	%g6,	%l1
	set	0x18, %o1
	stxa	%o2,	[%l7 + %o1] 0x23
	membar	#Sync
loop_1466:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bneg,a,pt	%xcc,	loop_1467
	tne	%xcc,	0x6
	tpos	%icc,	0x2
	fcmpne16	%f24,	%f30,	%o4
loop_1467:
	orn	%o0,	%l4,	%o6
	bneg,pt	%xcc,	loop_1468
	subcc	%i0,	0x1719,	%l0
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f6
	fxtos	%f6,	%f17
	fornot2	%f30,	%f16,	%f6
loop_1468:
	tpos	%xcc,	0x2
	fmovdg	%icc,	%f2,	%f30
	fmovsneg	%icc,	%f7,	%f3
	andcc	%g4,	0x0BC0,	%o3
	xor	%i2,	%i6,	%g1
	fmovdvc	%icc,	%f10,	%f12
	fmovrde	%i7,	%f24,	%f8
	subcc	%g7,	%i4,	%l5
	movneg	%xcc,	%o5,	%l6
	mulx	%i1,	0x07BD,	%i5
	srax	%g5,	0x11,	%g2
	smul	%g3,	0x0F49,	%o1
	fpadd32s	%f1,	%f14,	%f10
	fbg,a	%fcc2,	loop_1469
	subccc	%l2,	0x0D99,	%o7
	movrlez	%l3,	%i3,	%g6
	move	%icc,	%o2,	%o4
loop_1469:
	sdiv	%l1,	0x02D8,	%o0
	set	0x28, %i3
	stwa	%o6,	[%l7 + %i3] 0x2a
	membar	#Sync
	for	%f10,	%f6,	%f20
	fmovrdgez	%l4,	%f16,	%f26
	set	0x60, %o0
	stha	%l0,	[%l7 + %o0] 0x2b
	membar	#Sync
	std	%f0,	[%l7 + 0x78]
	nop
	setx	0x97F0187D86D76934,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x87F8BDC4684739A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f22,	%f10
	ble,a,pn	%icc,	loop_1470
	fornot1	%f2,	%f22,	%f20
	fsrc1	%f10,	%f8
	sdivcc	%i0,	0x1737,	%o3
loop_1470:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f26,	%f13
	fpsub16	%f18,	%f20,	%f22
	udivx	%i2,	0x1FB0,	%i6
	movre	%g4,	0x3CF,	%g1
	xorcc	%i7,	0x02E7,	%g7
	addcc	%l5,	0x176D,	%i4
	std	%f16,	[%l7 + 0x28]
	edge8	%o5,	%i1,	%l6
	swap	[%l7 + 0x24],	%i5
	fmul8sux16	%f22,	%f2,	%f0
	fpadd16	%f14,	%f10,	%f14
	tne	%icc,	0x0
	sdivcc	%g5,	0x0E4C,	%g3
	alignaddr	%g2,	%o1,	%l2
	fmovrse	%o7,	%f6,	%f24
	fmuld8ulx16	%f2,	%f6,	%f8
	st	%f12,	[%l7 + 0x20]
	ldub	[%l7 + 0x79],	%i3
	membar	0x58
	and	%g6,	%l3,	%o2
	mulx	%o4,	%l1,	%o0
	fba	%fcc3,	loop_1471
	bg	%icc,	loop_1472
	subc	%o6,	0x173E,	%l4
	fbule,a	%fcc3,	loop_1473
loop_1471:
	ldsw	[%l7 + 0x58],	%i0
loop_1472:
	fbule	%fcc2,	loop_1474
	sdivx	%o3,	0x1BBE,	%i2
loop_1473:
	edge32ln	%i6,	%g4,	%l0
	tsubcctv	%g1,	%g7,	%i7
loop_1474:
	fmovrdgez	%l5,	%f16,	%f16
	flush	%l7 + 0x74
	fmovscs	%icc,	%f22,	%f27
	movg	%icc,	%i4,	%o5
	or	%i1,	%i5,	%g5
	mova	%xcc,	%l6,	%g2
	tn	%xcc,	0x3
	nop
	setx	0x48211FA9224A078B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f20
	fmul8ulx16	%f26,	%f2,	%f6
	tpos	%icc,	0x5
	nop
	setx	0x59BBDB339F876726,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF151E9480BC5516D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f2,	%f14
	stbar
	array32	%o1,	%g3,	%l2
	fmovdge	%icc,	%f31,	%f30
	umul	%i3,	%o7,	%g6
	membar	0x74
	fexpand	%f5,	%f30
	fcmpne32	%f4,	%f0,	%l3
	andn	%o4,	%l1,	%o2
	sethi	0x1467,	%o6
	ldub	[%l7 + 0x54],	%l4
	fmovsneg	%icc,	%f5,	%f19
	taddcc	%i0,	%o0,	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%i6
	fandnot1	%f4,	%f16,	%f20
	edge8l	%l0,	%g1,	%g4
	movre	%g7,	0x23E,	%l5
	movvs	%xcc,	%i7,	%o5
	sir	0x0886
	fmovsgu	%xcc,	%f28,	%f24
	movre	%i4,	0x304,	%i5
	fpsub16s	%f15,	%f8,	%f3
	tcc	%xcc,	0x3
	tneg	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i1,	%l6,	%g2
	movre	%g5,	0x35E,	%o1
	fmovdl	%icc,	%f14,	%f30
	taddcctv	%g3,	0x0247,	%i3
	srlx	%l2,	%g6,	%l3
	ldsb	[%l7 + 0x71],	%o4
	tsubcc	%l1,	0x1419,	%o7
	movneg	%xcc,	%o6,	%o2
	andncc	%i0,	%o0,	%o3
	tg	%icc,	0x7
	ba,a	loop_1475
	lduw	[%l7 + 0x2C],	%i2
	fnot1	%f16,	%f8
	smul	%i6,	0x0E27,	%l4
loop_1475:
	fmovse	%icc,	%f30,	%f15
	set	0x71, %o5
	lduba	[%l7 + %o5] 0x11,	%l0
	fxors	%f1,	%f28,	%f28
	lduh	[%l7 + 0x58],	%g4
	sdivx	%g1,	0x013E,	%l5
	subc	%g7,	0x195B,	%i7
	addccc	%i4,	%i5,	%o5
	fmovsgu	%xcc,	%f14,	%f10
	edge32ln	%l6,	%g2,	%i1
	udivcc	%o1,	0x0306,	%g5
	fmovsl	%xcc,	%f3,	%f25
	fcmple32	%f8,	%f28,	%g3
	prefetch	[%l7 + 0x60],	 0x2
	xnor	%l2,	%i3,	%l3
	and	%o4,	0x05DA,	%l1
	fmovsvc	%xcc,	%f25,	%f24
	tge	%icc,	0x6
	umulcc	%g6,	0x0EB7,	%o7
	fbn	%fcc0,	loop_1476
	sir	0x0910
	fxnors	%f10,	%f13,	%f12
	bcc,a	loop_1477
loop_1476:
	fcmple32	%f22,	%f2,	%o2
	smulcc	%o6,	%i0,	%o3
	andn	%o0,	%i6,	%l4
loop_1477:
	movvc	%icc,	%l0,	%g4
	fmovsne	%icc,	%f12,	%f3
	fbug	%fcc3,	loop_1478
	mulscc	%i2,	%g1,	%g7
	xorcc	%i7,	0x163D,	%l5
	nop
	fitod	%f12,	%f8
	fdtos	%f8,	%f24
loop_1478:
	fmovdleu	%xcc,	%f19,	%f17
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i4
	alignaddrl	%i5,	%l6,	%g2
	fxnor	%f16,	%f4,	%f0
	tcs	%icc,	0x5
	smul	%i1,	0x0269,	%o5
	movrgz	%o1,	%g5,	%g3
	edge32	%i3,	%l3,	%l2
	movvs	%icc,	%o4,	%g6
	prefetch	[%l7 + 0x58],	 0x2
	taddcc	%o7,	0x069C,	%l1
	movgu	%icc,	%o6,	%i0
	sir	0x0D19
	fmovsvc	%icc,	%f24,	%f1
	array16	%o3,	%o0,	%o2
	bgu	%xcc,	loop_1479
	te	%xcc,	0x4
	edge32	%l4,	%i6,	%g4
	addccc	%l0,	0x1B1F,	%g1
loop_1479:
	tcc	%icc,	0x2
	nop
	setx	loop_1480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%i2,	0x0CF,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x76],	%i7
loop_1480:
	fcmple32	%f8,	%f10,	%l5
	te	%xcc,	0x6
	fmovsvs	%icc,	%f3,	%f11
	edge8	%i4,	%i5,	%l6
	fbul,a	%fcc2,	loop_1481
	fbuge,a	%fcc1,	loop_1482
	edge16l	%i1,	%o5,	%g2
	tgu	%icc,	0x3
loop_1481:
	tneg	%xcc,	0x5
loop_1482:
	popc	%g5,	%g3
	movrgez	%i3,	0x225,	%l3
	ta	%xcc,	0x6
	add	%l2,	0x19A1,	%o4
	nop
	fitod	%f19,	%f12
	movneg	%xcc,	%o1,	%o7
	array32	%g6,	%l1,	%i0
	edge32	%o6,	%o3,	%o2
	sdivcc	%l4,	0x11B9,	%i6
	fpadd16s	%f1,	%f4,	%f9
	tvc	%xcc,	0x0
	fbo,a	%fcc2,	loop_1483
	tcc	%icc,	0x0
	tpos	%xcc,	0x1
	movle	%icc,	%g4,	%o0
loop_1483:
	movpos	%icc,	%g1,	%i2
	tpos	%icc,	0x4
	movvc	%icc,	%l0,	%i7
	bcs,pt	%icc,	loop_1484
	movg	%icc,	%l5,	%i4
	tpos	%xcc,	0x2
	nop
	setx	0xD015463A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xDEC9029E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f27,	%f27
loop_1484:
	sdivcc	%i5,	0x0286,	%l6
	movleu	%icc,	%g7,	%o5
	movne	%icc,	%g2,	%g5
	alignaddrl	%g3,	%i3,	%l3
	edge32n	%i1,	%o4,	%l2
	tl	%xcc,	0x7
	edge32ln	%o7,	%g6,	%l1
	tne	%icc,	0x0
	std	%f10,	[%l7 + 0x58]
	xorcc	%o1,	%i0,	%o6
	set	0x2C, %g1
	swapa	[%l7 + %g1] 0x89,	%o2
	srl	%l4,	%o3,	%i6
	movle	%xcc,	%g4,	%o0
	fbg	%fcc1,	loop_1485
	tgu	%xcc,	0x5
	movleu	%icc,	%i2,	%g1
	pdist	%f24,	%f0,	%f22
loop_1485:
	fblg,a	%fcc1,	loop_1486
	edge16n	%i7,	%l0,	%l5
	edge32ln	%i4,	%l6,	%g7
	umul	%i5,	0x1854,	%o5
loop_1486:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g5
	brnz	%g3,	loop_1487
	sdivcc	%i3,	0x1376,	%l3
	popc	%i1,	%l2
	move	%xcc,	%o7,	%o4
loop_1487:
	fbue,a	%fcc2,	loop_1488
	fmovde	%icc,	%f1,	%f11
	fxor	%f10,	%f8,	%f26
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
loop_1488:
	edge8n	%o1,	%l1,	%i0
	fba	%fcc2,	loop_1489
	addcc	%o2,	%l4,	%o6
	fbuge	%fcc1,	loop_1490
	umul	%o3,	%g4,	%i6
loop_1489:
	nop
	set	0x38, %l3
	prefetcha	[%l7 + %l3] 0x88,	 0x2
loop_1490:
	ldstub	[%l7 + 0x61],	%o0
	brlez	%i7,	loop_1491
	fmovdn	%xcc,	%f5,	%f21
	edge8l	%l0,	%l5,	%i4
	addccc	%g1,	%l6,	%g7
loop_1491:
	bg,a	%icc,	loop_1492
	addcc	%o5,	%g2,	%i5
	sll	%g5,	%g3,	%i3
	nop
	setx loop_1493, %l0, %l1
	jmpl %l1, %i1
loop_1492:
	movvc	%icc,	%l2,	%l3
	tneg	%icc,	0x2
	sdivx	%o7,	0x1050,	%o4
loop_1493:
	add	%g6,	%o1,	%l1
	nop
	setx	0x32A58545504FC4EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	te	%icc,	0x1
	bleu	loop_1494
	movleu	%xcc,	%i0,	%l4
	xor	%o2,	0x02F0,	%o6
	fbul,a	%fcc3,	loop_1495
loop_1494:
	tvc	%xcc,	0x2
	set	0x20, %o4
	ldsha	[%l7 + %o4] 0x18,	%g4
loop_1495:
	movrne	%o3,	0x0F3,	%i2
	tvc	%icc,	0x1
	tgu	%icc,	0x1
	tcc	%icc,	0x5
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x27,	%o0
	addccc	%i6,	0x0CD8,	%i7
	movleu	%xcc,	%l5,	%l0
	tl	%xcc,	0x7
	edge32	%g1,	%l6,	%g7
	sdivcc	%o5,	0x00E3,	%i4
	ld	[%l7 + 0x54],	%f9
	ld	[%l7 + 0x64],	%f5
	fbe,a	%fcc3,	loop_1496
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g2,	%g5,	%i5
	fbg,a	%fcc2,	loop_1497
loop_1496:
	lduw	[%l7 + 0x20],	%i3
	movvs	%icc,	%g3,	%i1
	edge16l	%l2,	%l3,	%o4
loop_1497:
	fnot2s	%f0,	%f31
	fornot1	%f20,	%f6,	%f20
	ba	%icc,	loop_1498
	xnorcc	%o7,	0x01DE,	%o1
	fmul8x16al	%f27,	%f12,	%f6
	nop
	setx	0x8FA16F87692EE84D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x63A5CF337A1248A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f30,	%f14
loop_1498:
	edge32	%l1,	%g6,	%l4
	set	0x1C, %l5
	lduwa	[%l7 + %l5] 0x19,	%o2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i0
	ble	%xcc,	loop_1499
	pdist	%f16,	%f2,	%f10
	nop
	fitos	%f13,	%f31
	fstoi	%f31,	%f24
	tg	%xcc,	0x2
loop_1499:
	umulcc	%g4,	0x0537,	%o6
	nop
	set	0x4A, %g3
	ldsb	[%l7 + %g3],	%o3
	tpos	%xcc,	0x6
	sra	%o0,	0x1D,	%i2
	sdiv	%i7,	0x0CAC,	%i6
	fmovdle	%xcc,	%f21,	%f30
	lduh	[%l7 + 0x1C],	%l0
	movg	%icc,	%l5,	%l6
	bge,a,pt	%icc,	loop_1500
	tpos	%icc,	0x5
	ta	%icc,	0x0
	fmovsge	%icc,	%f11,	%f27
loop_1500:
	movvs	%icc,	%g1,	%o5
	swap	[%l7 + 0x4C],	%i4
	srlx	%g7,	%g5,	%g2
	edge8ln	%i5,	%g3,	%i1
	movvc	%xcc,	%l2,	%i3
	move	%xcc,	%l3,	%o7
	fxnors	%f10,	%f7,	%f20
	srax	%o4,	0x0C,	%o1
	nop
	setx	0x5BA99877,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x1C858033,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f26,	%f31
	taddcc	%g6,	0x01EA,	%l4
	sdivcc	%o2,	0x100C,	%i0
	fmovsneg	%icc,	%f20,	%f20
	fmul8sux16	%f0,	%f28,	%f24
	array32	%g4,	%o6,	%o3
	edge16l	%o0,	%l1,	%i2
	fmovdl	%icc,	%f5,	%f23
	alignaddrl	%i7,	%i6,	%l0
	array8	%l5,	%l6,	%g1
	fornot1	%f18,	%f0,	%f30
	andn	%o5,	%g7,	%i4
	nop
	setx	loop_1501,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x1
	brnz,a	%g5,	loop_1502
	fbug	%fcc3,	loop_1503
loop_1501:
	umul	%i5,	%g2,	%i1
	fmovsvs	%icc,	%f31,	%f8
loop_1502:
	nop
	set	0x58, %i2
	prefetch	[%l7 + %i2],	 0x0
loop_1503:
	fbule,a	%fcc3,	loop_1504
	array32	%l2,	%g3,	%l3
	fabsd	%f18,	%f0
	set	0x6E, %l0
	lduha	[%l7 + %l0] 0x10,	%i3
loop_1504:
	edge16ln	%o4,	%o7,	%g6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l4
	andcc	%o2,	0x005E,	%o1
	add	%i0,	0x00D6,	%g4
	sub	%o3,	0x1AC6,	%o0
	tsubcc	%o6,	0x0469,	%i2
	edge16l	%i7,	%i6,	%l0
	sllx	%l1,	%l5,	%l6
	fsrc1s	%f13,	%f22
	movne	%xcc,	%o5,	%g1
	brlz,a	%i4,	loop_1505
	move	%xcc,	%g5,	%g7
	flush	%l7 + 0x78
	wr	%g0,	0xe3,	%asi
	stwa	%g2,	[%l7 + 0x24] %asi
	membar	#Sync
loop_1505:
	tpos	%icc,	0x4
	fpsub16s	%f7,	%f14,	%f30
	or	%i1,	%l2,	%i5
	tge	%icc,	0x2
	fmovrsne	%l3,	%f13,	%f3
	brlez,a	%i3,	loop_1506
	smul	%g3,	0x1B8E,	%o4
	fbul	%fcc3,	loop_1507
	bcs,a	%icc,	loop_1508
loop_1506:
	stb	%g6,	[%l7 + 0x79]
	movrgez	%o7,	0x068,	%l4
loop_1507:
	add	%o1,	0x0BEE,	%i0
loop_1508:
	fmul8sux16	%f0,	%f8,	%f8
	ldx	[%l7 + 0x38],	%o2
	edge16n	%o3,	%o0,	%g4
	fmovsge	%xcc,	%f1,	%f10
	umul	%i2,	%i7,	%o6
	wr	%g0,	0x88,	%asi
	sta	%f31,	[%l7 + 0x40] %asi
	xor	%l0,	0x186F,	%l1
	or	%i6,	0x086B,	%l5
	taddcc	%o5,	0x08AF,	%g1
	fmovse	%xcc,	%f13,	%f31
	movge	%icc,	%l6,	%i4
	ldd	[%l7 + 0x28],	%g6
	umulcc	%g2,	%i1,	%g5
	nop
	setx	0xC8DD8A8EC9A5DE93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0B2E796228C415DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f2,	%f14
	ldd	[%l7 + 0x08],	%l2
	fnot1s	%f25,	%f1
	movgu	%xcc,	%l3,	%i5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x40] %asi,	%i3
	lduh	[%l7 + 0x1E],	%o4
	array16	%g6,	%o7,	%l4
	edge16l	%o1,	%i0,	%g3
	tl	%icc,	0x2
	smulcc	%o2,	0x15F9,	%o3
	movne	%xcc,	%g4,	%o0
	movleu	%xcc,	%i2,	%i7
	fmovdle	%icc,	%f10,	%f25
	fxnors	%f17,	%f4,	%f25
	popc	0x0D8F,	%o6
	movcs	%icc,	%l1,	%i6
	sub	%l5,	0x0FB7,	%o5
	fmovsl	%xcc,	%f2,	%f20
	sll	%l0,	0x01,	%l6
	tsubcc	%g1,	0x12E7,	%g7
	fmovrsgez	%g2,	%f22,	%f4
	fandnot1s	%f28,	%f30,	%f7
	stb	%i1,	[%l7 + 0x14]
	fbu	%fcc0,	loop_1509
	udivcc	%g5,	0x1E97,	%i4
	xnor	%l2,	0x08E9,	%i5
	fabss	%f25,	%f9
loop_1509:
	addccc	%l3,	%i3,	%g6
	andn	%o4,	%o7,	%o1
	bpos,a	loop_1510
	sll	%l4,	%i0,	%o2
	fcmpne16	%f4,	%f18,	%o3
	bge,a	loop_1511
loop_1510:
	mova	%xcc,	%g3,	%g4
	movrgez	%o0,	0x2DB,	%i7
	bge,a,pn	%xcc,	loop_1512
loop_1511:
	tge	%icc,	0x7
	taddcc	%i2,	%o6,	%i6
	edge8n	%l1,	%o5,	%l0
loop_1512:
	fmovdl	%icc,	%f6,	%f3
	be,a	loop_1513
	fpadd32	%f2,	%f16,	%f6
	fmuld8sux16	%f6,	%f6,	%f20
	bg	%icc,	loop_1514
loop_1513:
	sdivcc	%l5,	0x06F6,	%l6
	fmul8ulx16	%f8,	%f18,	%f20
	xor	%g7,	0x00D3,	%g2
loop_1514:
	movre	%i1,	%g1,	%g5
	bvc,a	%icc,	loop_1515
	smul	%l2,	0x040B,	%i4
	ldsb	[%l7 + 0x3A],	%i5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x5A] %asi,	%l3
loop_1515:
	addccc	%g6,	%i3,	%o7
	movg	%xcc,	%o1,	%o4
	ldd	[%l7 + 0x38],	%f0
	and	%l4,	%i0,	%o2
	set	0x68, %i1
	lda	[%l7 + %i1] 0x80,	%f23
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%g3
	edge16l	%g4,	%o3,	%i7
	bvc,pt	%icc,	loop_1516
	udivx	%i2,	0x1E6F,	%o0
	srl	%o6,	%l1,	%i6
	fmovsvs	%xcc,	%f21,	%f20
loop_1516:
	ldsh	[%l7 + 0x66],	%l0
	edge16n	%l5,	%l6,	%g7
	fnors	%f27,	%f23,	%f9
	nop
	set	0x70, %i7
	prefetch	[%l7 + %i7],	 0x3
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g2
	tg	%xcc,	0x5
	tvc	%icc,	0x2
	brgz	%i1,	loop_1517
	sra	%g1,	%g5,	%l2
	fcmpgt32	%f18,	%f4,	%i4
	tsubcc	%i5,	0x1FA0,	%o5
loop_1517:
	movleu	%icc,	%g6,	%l3
	brgez	%i3,	loop_1518
	movle	%xcc,	%o7,	%o4
	bgu,a	%icc,	loop_1519
	bvs	%xcc,	loop_1520
loop_1518:
	fbu,a	%fcc3,	loop_1521
	alignaddrl	%l4,	%i0,	%o2
loop_1519:
	fmovrdlez	%o1,	%f20,	%f22
loop_1520:
	tsubcctv	%g4,	0x1CD9,	%o3
loop_1521:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g3,	0x1360,	%i7
	movvs	%xcc,	%o0,	%o6
	mova	%xcc,	%l1,	%i6
	ld	[%l7 + 0x7C],	%f23
	movpos	%icc,	%l0,	%l5
	alignaddr	%l6,	%i2,	%g2
	tneg	%icc,	0x2
	fnand	%f8,	%f0,	%f26
	set	0x64, %o2
	lda	[%l7 + %o2] 0x88,	%f17
	subc	%g7,	%i1,	%g5
	movpos	%icc,	%g1,	%l2
	alignaddr	%i5,	%o5,	%g6
	sllx	%i4,	0x04,	%i3
	bshuffle	%f0,	%f2,	%f28
	edge32ln	%l3,	%o7,	%o4
	fmovdvc	%icc,	%f2,	%f2
	nop
	setx	0xF8AB2F3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x28A00A3C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f2,	%f30
	tpos	%icc,	0x3
	addc	%l4,	0x1A80,	%o2
	bge	loop_1522
	fmovsneg	%icc,	%f4,	%f27
	sllx	%i0,	%g4,	%o1
	nop
	fitos	%f4,	%f9
	fstoi	%f9,	%f17
loop_1522:
	movre	%g3,	0x114,	%o3
	fcmpne32	%f2,	%f28,	%i7
	movgu	%icc,	%o6,	%o0
	ldstub	[%l7 + 0x40],	%i6
	orcc	%l1,	0x0462,	%l0
	tcs	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%l6
	sll	%l5,	0x05,	%g2
	movcc	%xcc,	%g7,	%i1
	brgz	%i2,	loop_1523
	movg	%xcc,	%g5,	%g1
	edge8ln	%l2,	%i5,	%g6
	orcc	%o5,	%i3,	%i4
loop_1523:
	tcs	%icc,	0x2
	srax	%o7,	%o4,	%l3
	edge32ln	%l4,	%o2,	%g4
	smul	%i0,	%g3,	%o3
	subc	%i7,	%o6,	%o1
	taddcctv	%o0,	0x11B6,	%i6
	sir	0x06CD
	fnot2s	%f4,	%f24
	set	0x28, %o7
	lduwa	[%l7 + %o7] 0x80,	%l1
	umul	%l0,	%l5,	%l6
	ba,a	%xcc,	loop_1524
	membar	0x1F
	movvc	%icc,	%g2,	%g7
	sdiv	%i2,	0x19F3,	%i1
loop_1524:
	sth	%g1,	[%l7 + 0x3A]
	xnor	%l2,	0x038C,	%g5
	ld	[%l7 + 0x64],	%f1
	fbn,a	%fcc3,	loop_1525
	bcc,pt	%xcc,	loop_1526
	fmovsgu	%icc,	%f16,	%f19
	udivx	%g6,	0x13FC,	%i5
loop_1525:
	fcmpgt16	%f10,	%f2,	%i3
loop_1526:
	call	loop_1527
	sethi	0x1AA2,	%o5
	tgu	%icc,	0x0
	ble	%xcc,	loop_1528
loop_1527:
	bvc,pt	%icc,	loop_1529
	array16	%i4,	%o4,	%o7
	fnot2	%f2,	%f12
loop_1528:
	edge16ln	%l4,	%o2,	%g4
loop_1529:
	fexpand	%f19,	%f12
	add	%i0,	0x1F0A,	%l3
	fandnot1s	%f6,	%f19,	%f28
	membar	0x7D
	mova	%icc,	%o3,	%i7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g3
	popc	0x096B,	%o6
	umulcc	%o1,	0x1BCF,	%o0
	fand	%f26,	%f6,	%f6
	edge32n	%i6,	%l1,	%l0
	fpsub32s	%f30,	%f26,	%f27
	brz	%l5,	loop_1530
	tcc	%icc,	0x7
	movge	%xcc,	%l6,	%g2
	fmovrdgez	%g7,	%f10,	%f18
loop_1530:
	ta	%xcc,	0x5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%i2
	ldx	[%l7 + 0x50],	%g1
	fbg	%fcc2,	loop_1531
	st	%f26,	[%l7 + 0x20]
	addcc	%i1,	%l2,	%g6
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f0
loop_1531:
	nop
	set	0x0E, %g4
	ldsha	[%l7 + %g4] 0x15,	%g5
	movre	%i5,	0x0C5,	%o5
	be,pn	%xcc,	loop_1532
	ba,a	loop_1533
	sllx	%i3,	0x19,	%o4
	array32	%o7,	%i4,	%o2
loop_1532:
	tvc	%icc,	0x3
loop_1533:
	srl	%l4,	%i0,	%l3
	addccc	%g4,	%i7,	%g3
	fmovrde	%o6,	%f0,	%f22
	taddcc	%o3,	0x0EB2,	%o1
	movge	%xcc,	%i6,	%o0
	umul	%l1,	%l5,	%l6
	udivcc	%g2,	0x0B51,	%g7
	edge8	%i2,	%g1,	%i1
	subccc	%l0,	%g6,	%g5
	or	%l2,	%i5,	%o5
	tvs	%icc,	0x2
	movrlez	%i3,	0x26F,	%o4
	wr	%g0,	0x04,	%asi
	stxa	%i4,	[%l7 + 0x70] %asi
	array16	%o7,	%o2,	%l4
	bge,a	loop_1534
	movg	%xcc,	%i0,	%l3
	fone	%f24
	tneg	%xcc,	0x6
loop_1534:
	movvs	%icc,	%g4,	%g3
	ta	%xcc,	0x0
	subcc	%o6,	%o3,	%o1
	sllx	%i7,	%i6,	%l1
	bshuffle	%f0,	%f18,	%f4
	fmovdpos	%xcc,	%f29,	%f4
	edge16n	%l5,	%o0,	%g2
	te	%xcc,	0x4
	fbg	%fcc2,	loop_1535
	sra	%g7,	0x02,	%l6
	umul	%g1,	0x0182,	%i1
	andcc	%l0,	0x1D42,	%i2
loop_1535:
	fmovdleu	%icc,	%f13,	%f19
	orncc	%g5,	%g6,	%l2
	edge32n	%o5,	%i5,	%o4
	movleu	%icc,	%i4,	%o7
	tcc	%xcc,	0x7
	mova	%icc,	%i3,	%o2
	nop
	setx	0xDD62B9B2D1946044,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x645A2A593AA1658D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f20,	%f8
	fmovse	%icc,	%f27,	%f15
	fmovrslz	%l4,	%f6,	%f3
	xnorcc	%l3,	%g4,	%g3
	movrgz	%i0,	%o6,	%o1
	fpack16	%f10,	%f24
	movl	%icc,	%o3,	%i7
	set	0x46, %l4
	lduba	[%l7 + %l4] 0x88,	%l1
	fzero	%f22
	ldd	[%l7 + 0x28],	%i6
	movrne	%o0,	0x081,	%l5
	xnor	%g2,	0x1DEB,	%l6
	alignaddr	%g7,	%g1,	%l0
	fmovd	%f10,	%f24
	sll	%i1,	%i2,	%g5
	fmovsgu	%icc,	%f8,	%f15
	fpadd32	%f26,	%f22,	%f12
	xnorcc	%g6,	%o5,	%l2
	fcmple16	%f10,	%f10,	%i5
	sub	%o4,	0x073B,	%o7
	tg	%icc,	0x6
	alignaddrl	%i4,	%o2,	%i3
	tl	%xcc,	0x5
	tcs	%icc,	0x5
	nop
	setx	0x4D91E8C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xA73AD5A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f4,	%f1
	edge16n	%l4,	%g4,	%g3
	tge	%icc,	0x5
	xorcc	%l3,	%i0,	%o1
	movleu	%icc,	%o3,	%i7
	addcc	%l1,	%i6,	%o6
	wr	%g0,	0x10,	%asi
	stba	%l5,	[%l7 + 0x14] %asi
	fxors	%f30,	%f3,	%f31
	movrgez	%g2,	0x24A,	%o0
	movrgz	%g7,	0x116,	%g1
	movre	%l6,	0x21A,	%i1
	fbn	%fcc3,	loop_1536
	fzero	%f10
	array32	%l0,	%g5,	%i2
	xnorcc	%g6,	%o5,	%i5
loop_1536:
	nop
	setx	0x3078BD3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	tcc	%xcc,	0x3
	fbu,a	%fcc0,	loop_1537
	xor	%l2,	0x0D5C,	%o4
	brgez	%o7,	loop_1538
	sdivcc	%o2,	0x145B,	%i3
loop_1537:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x7B] %asi,	%i4
loop_1538:
	fmovsne	%icc,	%f11,	%f27
	sub	%l4,	%g3,	%l3
	sdiv	%i0,	0x0725,	%o1
	fors	%f24,	%f1,	%f23
	stw	%g4,	[%l7 + 0x4C]
	std	%f12,	[%l7 + 0x08]
	fnand	%f4,	%f10,	%f6
	edge32ln	%i7,	%l1,	%i6
	fexpand	%f4,	%f8
	movl	%icc,	%o6,	%l5
	movpos	%icc,	%g2,	%o3
	addc	%o0,	0x168C,	%g7
	movrlz	%g1,	0x256,	%l6
	std	%f8,	[%l7 + 0x08]
	movrne	%i1,	%l0,	%i2
	movcs	%xcc,	%g5,	%g6
	alignaddrl	%o5,	%i5,	%o4
	fmovsvc	%xcc,	%f0,	%f12
	fmovrsgz	%l2,	%f11,	%f25
	brgez	%o2,	loop_1539
	srax	%i3,	0x15,	%o7
	mova	%icc,	%i4,	%g3
	andn	%l3,	%l4,	%i0
loop_1539:
	udiv	%o1,	0x0BB7,	%i7
	wr	%g0,	0x11,	%asi
	stha	%l1,	[%l7 + 0x68] %asi
	xorcc	%g4,	0x0514,	%o6
	tne	%icc,	0x4
	bn	loop_1540
	movpos	%xcc,	%i6,	%l5
	bvc,a,pn	%icc,	loop_1541
	movleu	%icc,	%g2,	%o0
loop_1540:
	nop
	set	0x10, %i0
	swapa	[%l7 + %i0] 0x11,	%o3
loop_1541:
	movl	%xcc,	%g1,	%l6
	mulx	%g7,	0x1CE6,	%i1
	sir	0x100F
	movcs	%icc,	%l0,	%i2
	tne	%xcc,	0x4
	ba,a,pt	%xcc,	loop_1542
	movneg	%xcc,	%g6,	%g5
	array32	%i5,	%o4,	%o5
	bcs,a,pt	%xcc,	loop_1543
loop_1542:
	tg	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x38] %asi,	%l2
loop_1543:
	movvs	%xcc,	%o2,	%i3
	fmovrde	%o7,	%f4,	%f2
	edge32	%g3,	%l3,	%i4
	xnorcc	%l4,	%o1,	%i7
	fmovrdgez	%i0,	%f4,	%f14
	fmovsneg	%xcc,	%f19,	%f27
	fble	%fcc1,	loop_1544
	fmul8x16al	%f22,	%f27,	%f2
	taddcc	%g4,	%l1,	%o6
	tpos	%icc,	0x0
loop_1544:
	bcc,pt	%xcc,	loop_1545
	be,pn	%icc,	loop_1546
	movpos	%icc,	%i6,	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o0
loop_1545:
	sll	%o3,	0x18,	%l6
loop_1546:
	movleu	%icc,	%g1,	%i1
	movn	%xcc,	%l0,	%g7
	fnegs	%f0,	%f24
	edge16ln	%i2,	%g6,	%g5
	mulscc	%o4,	%o5,	%i5
	array16	%l2,	%o2,	%o7
	alignaddrl	%i3,	%l3,	%i4
	andncc	%l4,	%g3,	%o1
	fblg,a	%fcc0,	loop_1547
	ta	%xcc,	0x5
	sll	%i7,	%i0,	%l1
	tcc	%icc,	0x0
loop_1547:
	fandnot2	%f30,	%f22,	%f26
	bn,a,pn	%xcc,	loop_1548
	fbu	%fcc0,	loop_1549
	tgu	%xcc,	0x6
	bcc	loop_1550
loop_1548:
	fornot1s	%f9,	%f1,	%f5
loop_1549:
	fmovsne	%xcc,	%f20,	%f14
	nop
	setx	0xF210D48C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x68681B35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f11,	%f2
loop_1550:
	smulcc	%g4,	%i6,	%o6
	fornot1s	%f13,	%f24,	%f0
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	fmovsl	%xcc,	%f24,	%f29
	sdiv	%o0,	0x1E0D,	%g2
	andncc	%o3,	%g1,	%l6
	fbn,a	%fcc1,	loop_1551
	srax	%l0,	%i1,	%i2
	subc	%g6,	0x0109,	%g7
	fbe	%fcc3,	loop_1552
loop_1551:
	smulcc	%g5,	%o5,	%o4
	movg	%icc,	%i5,	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x08] %asi,	%l2
loop_1552:
	fxnors	%f3,	%f0,	%f4
	fmovrdne	%i3,	%f30,	%f4
	fcmpgt32	%f2,	%f22,	%l3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
	addccc	%i4,	%g3,	%o1
	taddcctv	%i7,	%l4,	%l1
	add	%i0,	0x0B2D,	%g4
	tpos	%icc,	0x3
	orncc	%i6,	%l5,	%o0
	wr	%g0,	0x88,	%asi
	stwa	%g2,	[%l7 + 0x58] %asi
	fmovd	%f28,	%f2
	edge32ln	%o6,	%o3,	%l6
	xorcc	%l0,	0x0384,	%i1
	tcc	%icc,	0x1
	andn	%g1,	0x080C,	%i2
	movpos	%xcc,	%g6,	%g5
	fcmpeq16	%f0,	%f26,	%g7
	tne	%xcc,	0x3
	ldx	[%l7 + 0x28],	%o5
	movrlz	%o4,	0x343,	%o2
	edge16ln	%l2,	%i5,	%i3
	movgu	%xcc,	%l3,	%o7
	sra	%g3,	%i4,	%i7
	fornot1s	%f27,	%f23,	%f27
	fnor	%f12,	%f16,	%f28
	udiv	%o1,	0x1657,	%l1
	fpadd16	%f12,	%f10,	%f22
	fmovdpos	%icc,	%f27,	%f31
	subccc	%i0,	0x0982,	%g4
	movrlz	%l4,	0x007,	%l5
	nop
	setx	0xC05F3C94,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	movgu	%xcc,	%i6,	%o0
	set	0x2A, %i4
	lduha	[%l7 + %i4] 0x15,	%o6
	fcmple32	%f22,	%f2,	%o3
	nop
	setx	0x026513FD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xC7FDD24B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f15,	%f17
	sethi	0x0AFB,	%g2
	taddcc	%l0,	0x1989,	%i1
	tne	%icc,	0x0
	sll	%g1,	0x19,	%i2
	nop
	set	0x66, %l1
	ldsb	[%l7 + %l1],	%l6
	bl,pt	%icc,	loop_1553
	movg	%icc,	%g5,	%g7
	movl	%icc,	%o5,	%g6
	wr	%g0,	0x18,	%asi
	stwa	%o2,	[%l7 + 0x1C] %asi
loop_1553:
	fmovrsne	%l2,	%f27,	%f27
	tvs	%xcc,	0x1
	stw	%i5,	[%l7 + 0x34]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%l3
	and	%i3,	0x0082,	%o7
	fmovdn	%icc,	%f27,	%f25
	fmovrse	%i4,	%f5,	%f8
	sllx	%i7,	0x17,	%g3
	ldx	[%l7 + 0x68],	%o1
	mulscc	%l1,	0x122E,	%g4
	add	%i0,	0x172D,	%l4
	movne	%xcc,	%l5,	%i6
	udivcc	%o6,	0x010F,	%o3
	movrgz	%g2,	%o0,	%i1
	tleu	%icc,	0x7
	nop
	setx	0x60544077,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	subccc	%g1,	%i2,	%l0
	set	0x18, %g6
	stxa	%l6,	[%l7 + %g6] 0x2a
	membar	#Sync
	edge32ln	%g7,	%o5,	%g6
	movn	%xcc,	%o2,	%l2
	movgu	%icc,	%g5,	%o4
	fmovdcs	%icc,	%f28,	%f27
	xor	%i5,	0x1619,	%l3
	addcc	%o7,	%i3,	%i4
	membar	0x77
	tvc	%icc,	0x5
	bne	loop_1554
	movrgz	%g3,	0x1A0,	%i7
	sethi	0x0F00,	%l1
	nop
	setx	0xCB466047705CAA5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_1554:
	nop
	set	0x78, %i5
	lda	[%l7 + %i5] 0x14,	%f23
	sllx	%g4,	%i0,	%o1
	fnors	%f21,	%f5,	%f27
	edge16ln	%l4,	%i6,	%l5
	srl	%o6,	0x03,	%o3
	srlx	%g2,	0x13,	%i1
	lduw	[%l7 + 0x38],	%g1
	fors	%f21,	%f14,	%f24
	xorcc	%o0,	0x11AD,	%i2
	set	0x58, %l2
	stxa	%l0,	[%l7 + %l2] 0xe2
	membar	#Sync
	fmovsle	%icc,	%f12,	%f23
	xnorcc	%g7,	0x1EFE,	%l6
	tn	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g6,	%o5,	%l2
	set	0x5C, %l6
	lda	[%l7 + %l6] 0x11,	%f27
	fcmpgt16	%f8,	%f0,	%o2
	tvc	%icc,	0x5
	fbne,a	%fcc2,	loop_1555
	edge8l	%g5,	%o4,	%l3
	fpsub16s	%f1,	%f25,	%f5
	bshuffle	%f2,	%f22,	%f12
loop_1555:
	movcc	%icc,	%o7,	%i3
	orncc	%i4,	%g3,	%i7
	andn	%i5,	0x1703,	%l1
	fands	%f18,	%f29,	%f8
	fmovsge	%icc,	%f28,	%f25
	stbar
	tn	%icc,	0x1
	tgu	%xcc,	0x2
	ble,a	loop_1556
	edge16	%i0,	%o1,	%l4
	tgu	%xcc,	0x4
	sub	%g4,	0x06FA,	%i6
loop_1556:
	stbar
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f24
	mova	%xcc,	%o6,	%o3
	udivcc	%g2,	0x1854,	%l5
	movneg	%icc,	%g1,	%o0
	bneg,a,pn	%icc,	loop_1557
	fmovrdgz	%i2,	%f26,	%f18
	fpadd32	%f18,	%f4,	%f0
	addc	%l0,	%g7,	%l6
loop_1557:
	edge8l	%i1,	%o5,	%g6
	fornot1	%f6,	%f2,	%f0
	bg,a	loop_1558
	brgz,a	%l2,	loop_1559
	movgu	%xcc,	%g5,	%o2
	fmovde	%xcc,	%f7,	%f6
loop_1558:
	bne,pt	%icc,	loop_1560
loop_1559:
	taddcctv	%l3,	%o4,	%o7
	srlx	%i4,	0x06,	%g3
	ldd	[%l7 + 0x78],	%i2
loop_1560:
	fpsub16	%f28,	%f10,	%f4
	tvs	%icc,	0x3
	taddcctv	%i5,	%i7,	%l1
	bvc,pt	%xcc,	loop_1561
	smul	%i0,	0x198B,	%o1
	edge16l	%l4,	%g4,	%o6
	edge8n	%i6,	%o3,	%l5
loop_1561:
	mova	%icc,	%g2,	%o0
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f19
	sth	%i2,	[%l7 + 0x28]
	edge32	%g1,	%l0,	%g7
	fbul,a	%fcc2,	loop_1562
	smul	%l6,	%o5,	%i1
	nop
	setx	0xB581C3DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x5738AD09,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f7,	%f22
	alignaddrl	%g6,	%l2,	%o2
loop_1562:
	addcc	%l3,	%o4,	%o7
	fbug	%fcc3,	loop_1563
	nop
	set	0x74, %i6
	ldsw	[%l7 + %i6],	%g5
	movcc	%icc,	%g3,	%i3
	or	%i4,	0x1A4B,	%i7
loop_1563:
	nop
	setx	0xF628D47E56BF9A3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xFCE94DE0692CD851,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f26,	%f26
	fornot2s	%f13,	%f11,	%f20
	orn	%l1,	0x1B2B,	%i5
	fmovrsne	%i0,	%f29,	%f1
	sllx	%l4,	0x0E,	%o1
	tge	%icc,	0x6
	fmovda	%xcc,	%f22,	%f28
	fmovdleu	%xcc,	%f26,	%f2
	edge32l	%g4,	%i6,	%o6
	sir	0x11EE
	fbug,a	%fcc2,	loop_1564
	bl,pn	%xcc,	loop_1565
	mulscc	%l5,	0x1063,	%g2
	edge32l	%o0,	%o3,	%g1
loop_1564:
	bcs	loop_1566
loop_1565:
	movle	%icc,	%l0,	%g7
	popc	0x0F83,	%l6
	taddcctv	%o5,	0x06D8,	%i2
loop_1566:
	ldub	[%l7 + 0x47],	%i1
	ldsh	[%l7 + 0x28],	%g6
	sll	%l2,	0x1F,	%l3
	fmovse	%xcc,	%f24,	%f6
	fsrc2	%f2,	%f2
	set	0x148, %g7
	nop 	! 	nop 	! 	ldxa	[%g0 + %g7] 0x40,	%o2 ripped by fixASI40.pl ripped by fixASI40.pl
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o4
	bge,a,pt	%icc,	loop_1567
	tl	%icc,	0x4
	edge32n	%g5,	%g3,	%i3
	fxnor	%f0,	%f6,	%f0
loop_1567:
	udivx	%o7,	0x0839,	%i4
	edge8	%i7,	%i5,	%i0
	taddcc	%l4,	%l1,	%g4
	edge8n	%o1,	%i6,	%o6
	move	%icc,	%l5,	%o0
	smulcc	%g2,	0x1233,	%o3
	taddcc	%g1,	%l0,	%l6
	tsubcctv	%o5,	0x1CF5,	%g7
	umulcc	%i1,	0x02A5,	%i2
	xor	%l2,	0x1DB1,	%l3
	tvc	%xcc,	0x3
	fmuld8ulx16	%f23,	%f21,	%f8
	fbg,a	%fcc2,	loop_1568
	xor	%o2,	%o4,	%g5
	udivx	%g6,	0x1D95,	%i3
	prefetch	[%l7 + 0x18],	 0x0
loop_1568:
	movne	%xcc,	%g3,	%o7
	fmovdneg	%icc,	%f4,	%f17
	orcc	%i4,	%i5,	%i7
	tsubcc	%i0,	%l1,	%g4
	fbug	%fcc0,	loop_1569
	srax	%l4,	%i6,	%o1
	fnands	%f25,	%f23,	%f2
	ba	%xcc,	loop_1570
loop_1569:
	tge	%xcc,	0x5
	mulx	%o6,	%l5,	%g2
	nop
	fitos	%f2,	%f0
	fstoi	%f0,	%f2
loop_1570:
	tneg	%xcc,	0x3
	lduw	[%l7 + 0x40],	%o3
	fnegd	%f26,	%f24
	srax	%g1,	0x15,	%l0
	be	%xcc,	loop_1571
	subcc	%l6,	0x16BF,	%o5
	subc	%o0,	0x19F5,	%i1
	udivcc	%g7,	0x10AD,	%l2
loop_1571:
	edge8ln	%l3,	%i2,	%o2
	membar	0x76
	fabsd	%f30,	%f16
	fpadd16	%f18,	%f28,	%f10
	fexpand	%f16,	%f28
	fmovde	%xcc,	%f4,	%f15
	andn	%g5,	0x16B1,	%o4
	fmovdne	%icc,	%f30,	%f16
	subcc	%i3,	%g3,	%g6
	tcs	%icc,	0x6
	orcc	%o7,	%i4,	%i7
	sllx	%i5,	%i0,	%l1
	bne	%xcc,	loop_1572
	tcs	%xcc,	0x4
	bgu,a	loop_1573
	tgu	%xcc,	0x6
loop_1572:
	fmovde	%xcc,	%f17,	%f30
	tne	%xcc,	0x7
loop_1573:
	fone	%f24
	movcc	%xcc,	%l4,	%i6
	movrlz	%o1,	%g4,	%l5
	fandnot1s	%f31,	%f10,	%f27
	edge8n	%o6,	%g2,	%o3
	movl	%xcc,	%g1,	%l6
	nop
	fitod	%f4,	%f20
	fdtoi	%f20,	%f19
	nop
	set	0x28, %o6
	lduw	[%l7 + %o6],	%o5
	bg,pt	%icc,	loop_1574
	andn	%l0,	%o0,	%g7
	and	%i1,	%l2,	%l3
	fmovsgu	%icc,	%f21,	%f25
loop_1574:
	movcs	%xcc,	%o2,	%i2
	mulscc	%o4,	%i3,	%g3
	udivx	%g6,	0x1C3A,	%o7
	fxnors	%f5,	%f28,	%f6
	popc	0x0747,	%g5
	sdiv	%i4,	0x0D10,	%i5
	edge8n	%i7,	%i0,	%l4
	sra	%l1,	%o1,	%g4
	movge	%icc,	%l5,	%o6
	mova	%icc,	%g2,	%o3
	movcc	%icc,	%i6,	%g1
	bgu	%icc,	loop_1575
	udivx	%o5,	0x08DF,	%l6
	edge8n	%o0,	%l0,	%g7
	sll	%l2,	%l3,	%o2
loop_1575:
	tgu	%icc,	0x3
	sub	%i2,	0x1D7B,	%o4
	movpos	%xcc,	%i1,	%g3
	umul	%i3,	%o7,	%g6
	orcc	%i4,	0x16C1,	%g5
	mulscc	%i5,	0x1ACC,	%i7
	movcs	%xcc,	%l4,	%l1
	bn,a,pn	%xcc,	loop_1576
	orncc	%o1,	%g4,	%l5
	fsrc1s	%f25,	%f20
	fbg,a	%fcc0,	loop_1577
loop_1576:
	tge	%icc,	0x4
	movne	%icc,	%i0,	%g2
	call	loop_1578
loop_1577:
	nop
	setx	0x014186E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x824BD504,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f3,	%f31
	fmul8sux16	%f12,	%f16,	%f24
	tvc	%xcc,	0x0
loop_1578:
	subc	%o6,	0x1C60,	%o3
	sir	0x1919
	udiv	%g1,	0x1F75,	%i6
	fba,a	%fcc2,	loop_1579
	taddcc	%o5,	%l6,	%l0
	edge16ln	%o0,	%l2,	%l3
	nop
	setx	0x90595A3C,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
loop_1579:
	fzeros	%f17
	fbo	%fcc1,	loop_1580
	bneg,a,pn	%icc,	loop_1581
	nop
	fitos	%f20,	%f21
	tg	%xcc,	0x4
loop_1580:
	fpsub16	%f28,	%f0,	%f26
loop_1581:
	movge	%icc,	%g7,	%o2
	ldx	[%l7 + 0x20],	%i2
	array32	%o4,	%i1,	%i3
	orncc	%o7,	0x029B,	%g6
	mova	%xcc,	%g3,	%i4
	move	%xcc,	%g5,	%i5
	lduh	[%l7 + 0x6C],	%i7
	edge32ln	%l1,	%l4,	%g4
	fcmpeq16	%f30,	%f2,	%o1
	fcmpgt32	%f18,	%f26,	%i0
	sethi	0x1601,	%l5
	fbne	%fcc0,	loop_1582
	movg	%xcc,	%o6,	%g2
	addccc	%o3,	0x1734,	%i6
	nop
	setx loop_1583, %l0, %l1
	jmpl %l1, %o5
loop_1582:
	fnand	%f4,	%f12,	%f8
	array16	%g1,	%l6,	%l0
	fblg	%fcc1,	loop_1584
loop_1583:
	fsrc2s	%f13,	%f7
	fmovscc	%xcc,	%f15,	%f17
	fbu	%fcc0,	loop_1585
loop_1584:
	tgu	%xcc,	0x7
	fmul8x16au	%f15,	%f26,	%f14
	movre	%o0,	%l2,	%g7
loop_1585:
	xnor	%l3,	%o2,	%o4
	fbule,a	%fcc3,	loop_1586
	movl	%icc,	%i1,	%i2
	andcc	%i3,	0x18A1,	%g6
	fmovsl	%icc,	%f3,	%f7
loop_1586:
	fmovda	%xcc,	%f5,	%f30
	movrne	%g3,	%o7,	%g5
	movrgz	%i4,	%i7,	%i5
	move	%icc,	%l1,	%l4
	tg	%icc,	0x4
	fmovse	%xcc,	%f11,	%f4
	edge32ln	%g4,	%i0,	%o1
	array8	%l5,	%g2,	%o3
	fmovrsgz	%i6,	%f28,	%f9
	tneg	%xcc,	0x6
	tsubcc	%o6,	0x0FB6,	%g1
	tpos	%icc,	0x1
	set	0x32, %g2
	ldsba	[%l7 + %g2] 0x14,	%l6
	movle	%icc,	%o5,	%o0
	fpmerge	%f22,	%f8,	%f20
	tvc	%xcc,	0x5
	edge16l	%l2,	%g7,	%l3
	tle	%icc,	0x4
	alignaddrl	%o2,	%o4,	%i1
	tg	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i2,	%l0,	%g6
	fandnot1s	%f26,	%f5,	%f15
	movcs	%xcc,	%i3,	%o7
	alignaddrl	%g3,	%i4,	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i5,	%g5
	tl	%xcc,	0x7
	srl	%l1,	0x1C,	%g4
	array8	%i0,	%l4,	%l5
	movrlez	%o1,	0x107,	%o3
	movpos	%icc,	%i6,	%g2
	movvs	%icc,	%o6,	%l6
	tneg	%xcc,	0x1
	fmovrdgez	%g1,	%f6,	%f24
	fba	%fcc0,	loop_1587
	ta	%icc,	0x6
	addc	%o5,	0x0BBC,	%o0
	udiv	%l2,	0x045B,	%l3
loop_1587:
	smul	%g7,	%o4,	%o2
	movvs	%icc,	%i1,	%i2
	movrgz	%g6,	0x0D4,	%l0
	set	0x38, %o1
	lduha	[%l7 + %o1] 0x15,	%i3
	edge32	%o7,	%i4,	%i7
	xor	%i5,	0x0C65,	%g5
	array32	%l1,	%g3,	%g4
	fabsd	%f26,	%f14
	udiv	%l4,	0x1AE3,	%i0
	sir	0x0AEE
	movge	%icc,	%l5,	%o3
	subccc	%o1,	0x108E,	%i6
	edge8ln	%g2,	%o6,	%l6
	bshuffle	%f4,	%f2,	%f18
	movpos	%icc,	%o5,	%g1
	fmovrsne	%o0,	%f7,	%f0
	movvs	%xcc,	%l3,	%g7
	andcc	%o4,	0x0A8E,	%l2
	ldd	[%l7 + 0x48],	%o2
	bvs,a,pt	%xcc,	loop_1588
	tleu	%xcc,	0x2
	subcc	%i1,	0x0319,	%g6
	fbul,a	%fcc0,	loop_1589
loop_1588:
	movleu	%icc,	%i2,	%i3
	fpsub32s	%f15,	%f28,	%f3
	nop
	fitos	%f3,	%f2
	fstoi	%f2,	%f29
loop_1589:
	call	loop_1590
	smulcc	%o7,	0x0AEC,	%i4
	fxor	%f26,	%f16,	%f24
	smulcc	%l0,	%i7,	%g5
loop_1590:
	fmovdne	%xcc,	%f3,	%f8
	edge8ln	%i5,	%g3,	%g4
	edge32l	%l1,	%l4,	%l5
	movneg	%xcc,	%i0,	%o1
	umul	%o3,	%g2,	%o6
	nop
	setx	0xED512A71304DD105,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	srlx	%l6,	0x13,	%i6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o5
	orn	%o0,	0x1285,	%g1
	movre	%g7,	0x1AF,	%o4
	tn	%xcc,	0x6
	tsubcc	%l2,	0x0A91,	%l3
	call	loop_1591
	fmovscs	%xcc,	%f13,	%f30
	movrgez	%o2,	%i1,	%g6
	sub	%i2,	%o7,	%i4
loop_1591:
	mova	%icc,	%i3,	%l0
	edge32ln	%g5,	%i5,	%g3
	std	%f20,	[%l7 + 0x10]
	fpadd32s	%f24,	%f2,	%f4
	movrgez	%i7,	0x178,	%l1
	movl	%xcc,	%l4,	%l5
	movl	%icc,	%i0,	%o1
	fmuld8ulx16	%f9,	%f31,	%f28
	fbul	%fcc3,	loop_1592
	move	%xcc,	%o3,	%g4
	mova	%icc,	%o6,	%l6
	membar	0x20
loop_1592:
	nop
	setx	0x150B1A78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f20
	fbule,a	%fcc2,	loop_1593
	fmovdl	%icc,	%f18,	%f17
	fba	%fcc1,	loop_1594
	flush	%l7 + 0x7C
loop_1593:
	andncc	%i6,	%o5,	%g2
	movrgz	%g1,	%g7,	%o0
loop_1594:
	edge16n	%o4,	%l3,	%o2
	fsrc1	%f12,	%f10
	fmuld8ulx16	%f8,	%f31,	%f4
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x4C] %asi,	%l2
	movge	%icc,	%i1,	%g6
	movgu	%xcc,	%o7,	%i4
	nop
	set	0x52, %i3
	ldsh	[%l7 + %i3],	%i2
	subcc	%i3,	0x07AF,	%g5
	fmovdgu	%icc,	%f24,	%f14
	movcc	%xcc,	%l0,	%g3
	bvs,a	loop_1595
	alignaddr	%i7,	%i5,	%l4
	brlz	%l1,	loop_1596
	array8	%i0,	%l5,	%o3
loop_1595:
	bleu	loop_1597
	fzero	%f28
loop_1596:
	fbl,a	%fcc1,	loop_1598
	tl	%xcc,	0x2
loop_1597:
	bpos	%icc,	loop_1599
	bneg,a,pt	%icc,	loop_1600
loop_1598:
	sra	%o1,	0x01,	%g4
	umulcc	%l6,	0x1596,	%i6
loop_1599:
	bcs,a	%xcc,	loop_1601
loop_1600:
	fmul8sux16	%f30,	%f20,	%f22
	tge	%xcc,	0x1
	movrne	%o6,	%o5,	%g1
loop_1601:
	ldx	[%l7 + 0x78],	%g2
	nop
	setx	0xA924574D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xAF04571A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f17,	%f28
	array16	%o0,	%g7,	%l3
	orncc	%o2,	0x0224,	%o4
	tgu	%icc,	0x2
	tsubcctv	%i1,	0x1D0D,	%l2
	movgu	%xcc,	%g6,	%i4
	movleu	%xcc,	%o7,	%i3
	tg	%xcc,	0x3
	movre	%g5,	%i2,	%g3
	movgu	%xcc,	%l0,	%i7
	subcc	%l4,	0x1259,	%i5
	set	0x7B, %o3
	ldsba	[%l7 + %o3] 0x81,	%l1
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%i0
	popc	%o3,	%l5
	movre	%g4,	0x2DA,	%l6
	fba,a	%fcc2,	loop_1602
	sdivx	%i6,	0x0C87,	%o1
	fmovs	%f30,	%f15
	udiv	%o6,	0x12E3,	%g1
loop_1602:
	bleu,a	loop_1603
	movrlz	%g2,	%o0,	%o5
	orcc	%g7,	%l3,	%o2
	fnands	%f31,	%f14,	%f13
loop_1603:
	xnor	%i1,	0x0455,	%o4
	tgu	%xcc,	0x2
	srax	%l2,	%i4,	%g6
	fmovdg	%xcc,	%f30,	%f0
	edge8l	%i3,	%o7,	%g5
	tge	%xcc,	0x5
	bne,a	%xcc,	loop_1604
	xnorcc	%i2,	%l0,	%g3
	set	0x55, %o5
	ldstuba	[%l7 + %o5] 0x88,	%l4
loop_1604:
	prefetch	[%l7 + 0x74],	 0x2
	movcc	%xcc,	%i5,	%l1
	edge16ln	%i0,	%i7,	%o3
	nop
	setx	0xC3D023EA506A5B2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	sdivx	%l5,	0x1E98,	%g4
	tn	%xcc,	0x1
	movn	%icc,	%i6,	%o1
	tn	%icc,	0x2
	bcs,a	loop_1605
	nop
	setx	0xAFB17B1C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x5DC3AFDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f10,	%f29
	udiv	%l6,	0x1F38,	%g1
	fmovdneg	%icc,	%f14,	%f11
loop_1605:
	pdist	%f16,	%f12,	%f4
	andn	%o6,	%o0,	%g2
	addc	%g7,	0x1B4E,	%l3
	set	0x71, %g1
	lduba	[%l7 + %g1] 0x19,	%o2
	tgu	%xcc,	0x2
	subc	%i1,	0x1ADD,	%o4
	fcmpgt16	%f26,	%f18,	%l2
	sub	%i4,	0x0466,	%g6
	xorcc	%i3,	%o7,	%g5
	addccc	%o5,	%l0,	%i2
	nop
	setx	loop_1606,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%f18,	[%l7 + 0x30]
	movre	%g3,	%l4,	%i5
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1606:
	movge	%icc,	%l1,	%i0
	edge16n	%i7,	%l5,	%o3
	fpack16	%f16,	%f27
	set	0x12, %o0
	ldsha	[%l7 + %o0] 0x19,	%g4
	fands	%f1,	%f29,	%f9
	orncc	%o1,	0x1661,	%l6
	ldx	[%l7 + 0x50],	%g1
	membar	0x39
	bgu,pt	%icc,	loop_1607
	fxnors	%f1,	%f0,	%f11
	andncc	%i6,	%o6,	%g2
	smulcc	%o0,	%g7,	%o2
loop_1607:
	fmovsleu	%icc,	%f1,	%f11
	fmovd	%f4,	%f28
	fbu	%fcc2,	loop_1608
	sdivcc	%i1,	0x12F2,	%l3
	xnor	%l2,	0x05CF,	%o4
	fmuld8ulx16	%f9,	%f3,	%f28
loop_1608:
	smul	%i4,	0x013F,	%g6
	nop
	setx	0x55A17C7C4ED982F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x1EF6D8E68BA957C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f28,	%f2
	smulcc	%o7,	%g5,	%i3
	edge8ln	%o5,	%l0,	%g3
	tvc	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x102F,	%l4
	xor	%i5,	0x1D48,	%i2
	fbge,a	%fcc1,	loop_1609
	fands	%f21,	%f29,	%f20
	umul	%l1,	%i0,	%i7
	fbue	%fcc3,	loop_1610
loop_1609:
	fmovdvc	%icc,	%f24,	%f25
	fmovsn	%icc,	%f1,	%f24
	popc	%o3,	%l5
loop_1610:
	mulx	%o1,	%g4,	%l6
	movn	%icc,	%i6,	%o6
	bcc,a	loop_1611
	tneg	%icc,	0x0
	fpadd32	%f2,	%f20,	%f8
	edge16n	%g2,	%g1,	%g7
loop_1611:
	fmovse	%xcc,	%f0,	%f29
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%o2
	smulcc	%i1,	%o0,	%l3
	edge8	%l2,	%i4,	%o4
	fmovde	%xcc,	%f2,	%f13
	swap	[%l7 + 0x54],	%g6
	udivcc	%o7,	0x0FBD,	%g5
	sir	0x0526
	taddcctv	%o5,	%i3,	%l0
	sll	%g3,	0x10,	%l4
	fmovrslz	%i5,	%f6,	%f9
	movcc	%xcc,	%i2,	%i0
	array8	%l1,	%i7,	%o3
	xorcc	%o1,	0x0172,	%g4
	fnands	%f7,	%f4,	%f28
	alignaddr	%l5,	%i6,	%l6
	fnor	%f24,	%f16,	%f24
	brnz,a	%g2,	loop_1612
	fbug	%fcc1,	loop_1613
	and	%g1,	%g7,	%o2
	stw	%i1,	[%l7 + 0x3C]
loop_1612:
	nop
	fitos	%f11,	%f5
	fstoi	%f5,	%f21
loop_1613:
	nop
	setx loop_1614, %l0, %l1
	jmpl %l1, %o6
	fmovrdgz	%l3,	%f16,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f8,	%f8,	%f0
loop_1614:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o0,	%i4,	%l2
	udiv	%o4,	0x1F0A,	%o7
	movrlz	%g5,	%o5,	%i3
	brgez	%l0,	loop_1615
	fexpand	%f27,	%f4
	movrlz	%g3,	0x0B5,	%g6
	sir	0x174A
loop_1615:
	tne	%icc,	0x7
	edge8	%i5,	%i2,	%l4
	tvs	%xcc,	0x6
	xnorcc	%l1,	0x1109,	%i7
	orncc	%o3,	%i0,	%o1
	edge16l	%l5,	%g4,	%i6
	movrlz	%l6,	0x1DC,	%g2
	xnor	%g1,	0x1675,	%g7
	bn,a,pt	%xcc,	loop_1616
	nop
	setx	0x95379A6C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x9BB864B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f20,	%f6
	fxnors	%f5,	%f24,	%f26
	movvc	%xcc,	%i1,	%o2
loop_1616:
	sethi	0x1EA5,	%o6
	ldd	[%l7 + 0x40],	%f16
	fnot2s	%f19,	%f9
	sll	%o0,	0x1E,	%i4
	fmovdgu	%xcc,	%f13,	%f29
	movpos	%icc,	%l3,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o7,	0x1CBA,	%g5
	edge32n	%o5,	%l2,	%l0
	set	0x28, %l3
	ldswa	[%l7 + %l3] 0x81,	%g3
	sethi	0x0119,	%g6
	bneg	%xcc,	loop_1617
	movneg	%icc,	%i5,	%i3
	andncc	%i2,	%l4,	%l1
	xor	%i7,	%i0,	%o3
loop_1617:
	xnor	%o1,	0x010F,	%l5
	movg	%icc,	%i6,	%l6
	sdivx	%g2,	0x06CC,	%g1
	edge16ln	%g7,	%i1,	%g4
	movvs	%xcc,	%o2,	%o6
	fnot1s	%f1,	%f9
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x10] %asi,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i4,	0x08C0,	%o4
	movcs	%icc,	%o7,	%g5
	edge32l	%l3,	%l2,	%l0
	tneg	%icc,	0x5
	call	loop_1618
	tne	%icc,	0x0
	fmovdg	%icc,	%f13,	%f3
	fzero	%f8
loop_1618:
	alignaddrl	%o5,	%g6,	%g3
	movcc	%xcc,	%i5,	%i3
	sllx	%i2,	0x0E,	%l4
	movrgez	%i7,	%l1,	%o3
	tle	%icc,	0x1
	stbar
	andcc	%o1,	%l5,	%i0
	movrne	%l6,	0x23F,	%g2
	nop
	fitos	%f0,	%f4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x0
	fmovsne	%icc,	%f18,	%f29
	nop
	setx	0x1EF69664BBD834C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0B47DDEB0D6B47A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f2,	%f26
	nop
	fitos	%f9,	%f30
	fstox	%f30,	%f6
	sra	%i1,	0x0D,	%g7
	mulx	%g4,	%o2,	%o6
	andcc	%o0,	%o4,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i4,	%g5
	movre	%l3,	0x323,	%l0
	tcs	%icc,	0x2
	addccc	%o5,	0x15AD,	%g6
	fcmpne16	%f2,	%f24,	%g3
	fands	%f4,	%f23,	%f6
	fmovdvs	%xcc,	%f13,	%f15
	sdivx	%l2,	0x1B96,	%i3
	ldstub	[%l7 + 0x18],	%i2
	mulx	%l4,	%i7,	%i5
	movrne	%o3,	0x04C,	%o1
	fmovsn	%icc,	%f19,	%f6
	movneg	%xcc,	%l1,	%l5
	movrlez	%l6,	0x107,	%g2
	nop
	fitod	%f2,	%f2
	fdtos	%f2,	%f28
	movge	%icc,	%g1,	%i6
	bcc,pn	%icc,	loop_1619
	fbge,a	%fcc0,	loop_1620
	xorcc	%i0,	0x05AE,	%i1
	fmovsneg	%xcc,	%f12,	%f26
loop_1619:
	movvc	%icc,	%g7,	%g4
loop_1620:
	fmul8ulx16	%f20,	%f8,	%f6
	or	%o6,	0x0976,	%o2
	movpos	%xcc,	%o4,	%o7
	sll	%i4,	%g5,	%l3
	sdivcc	%l0,	0x000E,	%o5
	subcc	%g6,	0x1C97,	%g3
	movrlz	%o0,	%i3,	%i2
	mulscc	%l2,	0x1A4C,	%i7
	fpadd32s	%f0,	%f30,	%f29
	fmovrsne	%l4,	%f5,	%f28
	tvs	%xcc,	0x3
	fornot2s	%f16,	%f28,	%f26
	nop
	set	0x10, %g5
	std	%f10,	[%l7 + %g5]
	movg	%icc,	%i5,	%o1
	tle	%xcc,	0x0
	tsubcc	%l1,	%l5,	%o3
	orn	%g2,	0x00BB,	%l6
	fmovdneg	%xcc,	%f29,	%f16
	movpos	%xcc,	%g1,	%i0
	array32	%i6,	%g7,	%g4
	bgu,a	loop_1621
	bg	%icc,	loop_1622
	xnor	%o6,	%o2,	%o4
	nop
	setx	0x9FFA9A0B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB20E4B84,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f1,	%f23
loop_1621:
	umulcc	%o7,	0x0892,	%i1
loop_1622:
	tne	%icc,	0x4
	sll	%i4,	0x1E,	%g5
	array32	%l0,	%l3,	%o5
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrlz	%g3,	0x2BD,	%o0
	bneg,a	loop_1623
	fmovsg	%icc,	%f26,	%f27
	nop
	setx	0x904E7B14,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	fbge,a	%fcc0,	loop_1624
loop_1623:
	smul	%g6,	0x1BF9,	%i2
	movvs	%xcc,	%i3,	%l2
	movvc	%icc,	%l4,	%i7
loop_1624:
	tcc	%xcc,	0x7
	fcmpeq32	%f30,	%f22,	%o1
	movg	%icc,	%l1,	%i5
	movneg	%xcc,	%o3,	%g2
	tl	%icc,	0x2
	srlx	%l5,	%g1,	%i0
	sub	%i6,	0x193D,	%l6
	nop
	setx	0x204E84E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	set	0x220, %g3
	ldxa	[%g0 + %g3] 0x52,	%g4
	edge16	%o6,	%o2,	%g7
	xor	%o4,	%o7,	%i4
	movne	%xcc,	%g5,	%l0
	movcs	%icc,	%i1,	%o5
	sth	%g3,	[%l7 + 0x40]
	movg	%icc,	%l3,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%i3
	stw	%i2,	[%l7 + 0x74]
	tsubcctv	%l4,	%l2,	%i7
	fnot1s	%f13,	%f25
	umul	%o1,	0x1FE0,	%l1
	tge	%icc,	0x0
	movrne	%o3,	0x373,	%g2
	brz	%i5,	loop_1625
	subcc	%l5,	%g1,	%i0
	alignaddr	%l6,	%g4,	%i6
	xor	%o6,	%g7,	%o2
loop_1625:
	subccc	%o7,	0x1797,	%i4
	sll	%o4,	0x07,	%g5
	tvc	%icc,	0x4
	and	%i1,	0x047C,	%l0
	subc	%g3,	%l3,	%g6
	array32	%o0,	%o5,	%i3
	bcs	%icc,	loop_1626
	mulx	%l4,	%i2,	%i7
	bl,a	%icc,	loop_1627
	mulx	%o1,	0x036D,	%l2
loop_1626:
	edge8ln	%l1,	%g2,	%i5
	movrlez	%o3,	0x130,	%g1
loop_1627:
	fnands	%f31,	%f18,	%f20
	mulx	%l5,	%i0,	%l6
	fbu	%fcc2,	loop_1628
	fcmpgt32	%f10,	%f18,	%i6
	fbu	%fcc3,	loop_1629
	nop
	setx	0x0172080D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xC85CC115,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f0,	%f26
loop_1628:
	ldx	[%l7 + 0x20],	%g4
	array32	%g7,	%o6,	%o7
loop_1629:
	movl	%icc,	%i4,	%o2
	movl	%xcc,	%o4,	%i1
	ta	%xcc,	0x2
	tn	%icc,	0x6
	nop
	setx	0x7733FEAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x63A60513,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f3,	%f2
	movrlez	%l0,	%g3,	%l3
	sllx	%g5,	%g6,	%o0
	ta	%icc,	0x7
	and	%o5,	%l4,	%i2
	stb	%i3,	[%l7 + 0x59]
	tpos	%xcc,	0x2
	bn	loop_1630
	taddcctv	%i7,	%l2,	%l1
	stbar
	set	0x7E, %i2
	stha	%g2,	[%l7 + %i2] 0xea
	membar	#Sync
loop_1630:
	edge16ln	%i5,	%o1,	%g1
	tcs	%xcc,	0x4
	movrne	%o3,	0x2E8,	%l5
	edge16ln	%i0,	%l6,	%g4
	fpsub16	%f14,	%f10,	%f26
	udiv	%i6,	0x1FDC,	%o6
	fpmerge	%f14,	%f26,	%f8
	xnor	%g7,	%o7,	%i4
	tgu	%icc,	0x4
	fnegs	%f29,	%f11
	fornot1s	%f27,	%f16,	%f0
	te	%xcc,	0x0
	movrgez	%o2,	0x080,	%i1
	fors	%f25,	%f24,	%f26
	movgu	%xcc,	%l0,	%g3
	set	0x1D, %l5
	stba	%l3,	[%l7 + %l5] 0xe2
	membar	#Sync
	orncc	%g5,	%o4,	%g6
	taddcctv	%o5,	0x032C,	%l4
	addc	%o0,	0x05E0,	%i3
	addc	%i7,	0x12F5,	%l2
	movvs	%xcc,	%l1,	%g2
	edge32	%i2,	%o1,	%i5
	subcc	%o3,	0x180F,	%l5
	subc	%g1,	0x1AA0,	%i0
	lduh	[%l7 + 0x14],	%g4
	movg	%icc,	%i6,	%l6
	fnegd	%f28,	%f20
	edge32n	%o6,	%g7,	%o7
	mova	%xcc,	%o2,	%i4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x3C] %asi,	%l0
	edge16	%i1,	%g3,	%g5
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbge	%fcc1,	loop_1631
	fmovdgu	%icc,	%f11,	%f25
	udiv	%l3,	0x11E5,	%g6
	mova	%icc,	%o5,	%l4
loop_1631:
	movrne	%o0,	%o4,	%i3
	movpos	%icc,	%l2,	%i7
	move	%icc,	%l1,	%i2
	tvc	%icc,	0x2
	taddcc	%o1,	%i5,	%o3
	ldstub	[%l7 + 0x68],	%l5
	taddcctv	%g2,	0x024D,	%i0
	fblg,a	%fcc0,	loop_1632
	nop
	setx	0xC764F70E2026F72F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1400781BDD64023F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f16,	%f26
	tsubcctv	%g4,	%i6,	%g1
	addccc	%l6,	0x0EB2,	%g7
loop_1632:
	array16	%o7,	%o2,	%i4
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f20
	fxtod	%f20,	%f26
	fbug	%fcc0,	loop_1633
	tpos	%xcc,	0x4
	array8	%o6,	%i1,	%g3
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f25
loop_1633:
	add	%g5,	%l3,	%g6
	tvs	%xcc,	0x1
	movrlez	%l0,	0x26E,	%o5
	edge16l	%l4,	%o4,	%i3
	movneg	%xcc,	%o0,	%l2
	addcc	%l1,	0x1E52,	%i2
	srax	%i7,	%i5,	%o3
	fbl,a	%fcc0,	loop_1634
	bvs,a,pn	%icc,	loop_1635
	fbl	%fcc0,	loop_1636
	nop
	setx	loop_1637,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1634:
	movrlez	%o1,	0x240,	%g2
loop_1635:
	tgu	%icc,	0x2
loop_1636:
	alignaddr	%i0,	%l5,	%g4
loop_1637:
	sllx	%g1,	0x01,	%i6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x10,	%g7,	%l6
	fbo	%fcc1,	loop_1638
	array8	%o2,	%o7,	%i4
	movcc	%icc,	%o6,	%i1
	tsubcc	%g5,	0x0701,	%l3
loop_1638:
	andcc	%g6,	%g3,	%o5
	fbne	%fcc3,	loop_1639
	bg,a	%icc,	loop_1640
	addccc	%l0,	%l4,	%i3
	tg	%icc,	0x1
loop_1639:
	fmovrslez	%o4,	%f14,	%f30
loop_1640:
	brlz,a	%l2,	loop_1641
	edge16ln	%l1,	%o0,	%i7
	fmovde	%icc,	%f21,	%f12
	subc	%i5,	0x0552,	%i2
loop_1641:
	edge16l	%o1,	%o3,	%i0
	edge8n	%g2,	%l5,	%g4
	and	%g1,	0x1771,	%g7
	brlz,a	%l6,	loop_1642
	std	%f22,	[%l7 + 0x50]
	lduh	[%l7 + 0x24],	%i6
	sir	0x0D17
loop_1642:
	movne	%icc,	%o7,	%o2
	movrgez	%i4,	%i1,	%o6
	xnor	%g5,	0x19F3,	%l3
	andn	%g6,	0x1B75,	%g3
	fbuge,a	%fcc0,	loop_1643
	movre	%l0,	0x1AC,	%l4
	bn	%icc,	loop_1644
	bneg,a	loop_1645
loop_1643:
	andcc	%o5,	%o4,	%i3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f0
loop_1644:
	move	%xcc,	%l2,	%o0
loop_1645:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f26,	%f3,	%f2
	fmovdcc	%icc,	%f15,	%f30
	movn	%xcc,	%l1,	%i7
	fpadd32s	%f29,	%f21,	%f5
	array16	%i5,	%i2,	%o3
	edge16	%i0,	%o1,	%l5
	tsubcc	%g4,	0x1D81,	%g2
	fpmerge	%f10,	%f10,	%f22
	ldstub	[%l7 + 0x24],	%g7
	orncc	%l6,	0x0D02,	%i6
	orncc	%g1,	%o7,	%o2
	srlx	%i1,	0x18,	%o6
	fbg	%fcc1,	loop_1646
	fmovrdlz	%i4,	%f10,	%f10
	fmovdl	%icc,	%f27,	%f0
	ldd	[%l7 + 0x18],	%f30
loop_1646:
	tl	%xcc,	0x0
	bleu,pt	%xcc,	loop_1647
	movvs	%icc,	%g5,	%g6
	fmuld8sux16	%f24,	%f14,	%f6
	udiv	%l3,	0x1A14,	%g3
loop_1647:
	fmovsvs	%icc,	%f9,	%f3
	movrgz	%l4,	%o5,	%o4
	tg	%icc,	0x7
	fbule,a	%fcc3,	loop_1648
	tge	%icc,	0x5
	fbe	%fcc0,	loop_1649
	ldstub	[%l7 + 0x5B],	%l0
loop_1648:
	fcmpne32	%f10,	%f8,	%l2
	movg	%xcc,	%i3,	%l1
loop_1649:
	orncc	%o0,	%i5,	%i7
	fsrc1	%f24,	%f20
	movleu	%icc,	%o3,	%i0
	membar	0x79
	xnorcc	%i2,	0x1732,	%l5
	edge32l	%o1,	%g2,	%g4
	tne	%icc,	0x0
	nop
	setx	0xD33CDBCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xBB0444D7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f1,	%f5
	movcc	%icc,	%g7,	%i6
	fmovdvs	%icc,	%f14,	%f18
	array8	%l6,	%o7,	%g1
	mova	%xcc,	%o2,	%i1
	movpos	%icc,	%i4,	%g5
	xor	%g6,	0x1872,	%l3
	fmovda	%icc,	%f17,	%f24
	tvc	%xcc,	0x7
	xnor	%o6,	0x10BC,	%l4
	brgez,a	%o5,	loop_1650
	tsubcctv	%g3,	%l0,	%l2
	edge8ln	%i3,	%o4,	%l1
	fmovdl	%icc,	%f8,	%f21
loop_1650:
	nop
	wr	%g0,	0xe3,	%asi
	stxa	%o0,	[%l7 + 0x10] %asi
	membar	#Sync
	mova	%xcc,	%i7,	%i5
	smulcc	%i0,	%i2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f0,	%f26,	%f9
	ldsw	[%l7 + 0x78],	%o1
	srl	%l5,	0x05,	%g2
	andcc	%g7,	0x0908,	%i6
	bcc,pt	%xcc,	loop_1651
	fandnot1	%f30,	%f2,	%f28
	ba,a,pn	%xcc,	loop_1652
	pdist	%f22,	%f14,	%f28
loop_1651:
	fbg	%fcc1,	loop_1653
	array32	%l6,	%g4,	%g1
loop_1652:
	nop
	fitod	%f19,	%f18
	fands	%f9,	%f8,	%f21
loop_1653:
	xor	%o7,	%o2,	%i4
	bpos,a,pt	%xcc,	loop_1654
	movgu	%icc,	%i1,	%g5
	srax	%g6,	%o6,	%l3
	set	0x44, %i7
	ldsha	[%l7 + %i7] 0x80,	%o5
loop_1654:
	fpadd16	%f20,	%f14,	%f8
	movcs	%icc,	%g3,	%l0
	fmovs	%f10,	%f19
	nop
	setx	loop_1655,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdg	%icc,	%f25,	%f22
	udiv	%l4,	0x071D,	%l2
	set	0x30, %o2
	ldxa	[%g0 + %o2] 0x20,	%o4
loop_1655:
	movgu	%xcc,	%l1,	%i3
	tvc	%icc,	0x5
	ldsb	[%l7 + 0x2A],	%o0
	tsubcctv	%i7,	0x19F1,	%i5
	mulx	%i2,	%i0,	%o3
	movrlz	%l5,	%o1,	%g7
	tne	%icc,	0x5
	sethi	0x1B3F,	%g2
	set	0x2C, %l0
	swapa	[%l7 + %l0] 0x10,	%l6
	brlz	%i6,	loop_1656
	tg	%icc,	0x0
	or	%g1,	0x10FB,	%g4
	fmovrse	%o2,	%f19,	%f29
loop_1656:
	bneg,a,pn	%icc,	loop_1657
	sll	%i4,	0x0E,	%o7
	srax	%g5,	0x07,	%i1
	nop
	setx	loop_1658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1657:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o6,	%g6,	%o5
	fbge	%fcc3,	loop_1659
loop_1658:
	smul	%g3,	%l3,	%l0
	udivcc	%l4,	0x1FCA,	%o4
	addccc	%l1,	0x05C8,	%l2
loop_1659:
	xnor	%i3,	0x0171,	%o0
	movrlez	%i5,	0x06E,	%i7
	movvc	%icc,	%i2,	%i0
	movrgz	%l5,	0x191,	%o3
	movrgz	%o1,	0x046,	%g7
	movre	%l6,	0x06E,	%g2
	bvs	%xcc,	loop_1660
	fpackfix	%f28,	%f28
	brlez	%g1,	loop_1661
	brlez,a	%g4,	loop_1662
loop_1660:
	tvc	%icc,	0x4
	subc	%i6,	0x02C0,	%i4
loop_1661:
	xnor	%o7,	%o2,	%i1
loop_1662:
	fnor	%f22,	%f2,	%f8
	udivcc	%g5,	0x1CDB,	%o6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x30] %asi,	%o5
	addcc	%g6,	0x1C09,	%l3
	srlx	%g3,	0x06,	%l0
	stbar
	addc	%l4,	%l1,	%o4
	edge8ln	%i3,	%o0,	%l2
	movl	%xcc,	%i5,	%i2
	edge8n	%i0,	%l5,	%i7
	subc	%o3,	0x03A8,	%o1
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x1f,	%f16
	add	%g7,	0x027C,	%g2
	taddcctv	%l6,	%g4,	%g1
	nop
	setx loop_1663, %l0, %l1
	jmpl %l1, %i6
	movle	%xcc,	%i4,	%o2
	tgu	%xcc,	0x6
	addccc	%i1,	0x0C33,	%o7
loop_1663:
	tvc	%xcc,	0x6
	be,a,pn	%icc,	loop_1664
	andn	%g5,	0x1284,	%o5
	tcs	%icc,	0x1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o6
loop_1664:
	ldstub	[%l7 + 0x47],	%l3
	tle	%icc,	0x1
	tl	%icc,	0x4
	subc	%g6,	%g3,	%l4
	edge8	%l1,	%o4,	%i3
	bl,a	%xcc,	loop_1665
	addcc	%o0,	%l0,	%i5
	bvs,a	%icc,	loop_1666
	taddcctv	%l2,	0x0281,	%i2
loop_1665:
	bvs,pn	%icc,	loop_1667
	sir	0x0553
loop_1666:
	fzero	%f28
	fbul	%fcc0,	loop_1668
loop_1667:
	udivx	%l5,	0x05A6,	%i7
	taddcc	%o3,	%i0,	%g7
	movrne	%o1,	0x275,	%l6
loop_1668:
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%g2
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f19
	te	%xcc,	0x5
	fmovrde	%g4,	%f26,	%f24
	fba	%fcc0,	loop_1669
	fmovrse	%g1,	%f8,	%f14
	fmovda	%icc,	%f6,	%f27
	flush	%l7 + 0x54
loop_1669:
	sethi	0x1856,	%i6
	mulx	%i4,	%o2,	%o7
	fcmpgt32	%f16,	%f26,	%i1
	xnor	%g5,	%o6,	%l3
	fmovrsne	%o5,	%f0,	%f2
	fmovs	%f21,	%f22
	fmovse	%xcc,	%f18,	%f29
	edge8ln	%g3,	%g6,	%l4
	set	0x57, %i0
	lduba	[%l7 + %i0] 0x19,	%o4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x3E] %asi,	%l1
	edge32	%i3,	%o0,	%l0
	ldsw	[%l7 + 0x64],	%i5
	tneg	%xcc,	0x1
	fandnot2	%f10,	%f28,	%f16
	sllx	%i2,	%l2,	%i7
	ldsw	[%l7 + 0x30],	%l5
	stw	%o3,	[%l7 + 0x10]
	nop
	setx loop_1670, %l0, %l1
	jmpl %l1, %i0
	fnands	%f23,	%f14,	%f3
	ldd	[%l7 + 0x70],	%o0
	ldd	[%l7 + 0x20],	%g6
loop_1670:
	fbo	%fcc2,	loop_1671
	fmovsl	%xcc,	%f15,	%f11
	nop
	setx	0xDCC3D7D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x6E8F49F0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f20,	%f7
	nop
	fitos	%f5,	%f24
	fstox	%f24,	%f26
loop_1671:
	sir	0x17B0
	fbuge	%fcc3,	loop_1672
	bge,a,pt	%xcc,	loop_1673
	prefetch	[%l7 + 0x14],	 0x0
	subcc	%g2,	0x1577,	%g4
loop_1672:
	array32	%l6,	%g1,	%i4
loop_1673:
	nop
	set	0x3C, %l4
	sta	%f19,	[%l7 + %l4] 0x89
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x10] %asi,	%f26
	bg,a	loop_1674
	fnot2	%f10,	%f10
	nop
	setx	0x4D784AB108D3E05C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA6A44CC65FF8C8A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f20,	%f20
	bl	%icc,	loop_1675
loop_1674:
	bcs,pt	%icc,	loop_1676
	movvs	%icc,	%o2,	%i6
	brgez	%o7,	loop_1677
loop_1675:
	brnz	%i1,	loop_1678
loop_1676:
	mulscc	%g5,	0x1ADC,	%o6
	tsubcctv	%l3,	%o5,	%g6
loop_1677:
	smulcc	%l4,	%g3,	%o4
loop_1678:
	fmovsl	%icc,	%f17,	%f7
	nop
	set	0x74, %i4
	lduw	[%l7 + %i4],	%l1
	fbuge,a	%fcc1,	loop_1679
	fbue,a	%fcc1,	loop_1680
	nop
	fitod	%f8,	%f20
	fdtox	%f20,	%f6
	te	%xcc,	0x0
loop_1679:
	prefetch	[%l7 + 0x64],	 0x0
loop_1680:
	sth	%i3,	[%l7 + 0x5E]
	brgez,a	%o0,	loop_1681
	fpsub32s	%f6,	%f12,	%f11
	smulcc	%l0,	%i2,	%l2
	bl,pt	%icc,	loop_1682
loop_1681:
	fmovrsne	%i5,	%f22,	%f3
	bvc,a	loop_1683
	edge32	%l5,	%i7,	%i0
loop_1682:
	sub	%o1,	0x0817,	%g7
	andn	%o3,	%g2,	%l6
loop_1683:
	subcc	%g1,	%g4,	%i4
	fmovrse	%o2,	%f30,	%f16
	edge16ln	%i6,	%i1,	%g5
	movcc	%icc,	%o7,	%l3
	ldsw	[%l7 + 0x38],	%o5
	edge8ln	%o6,	%g6,	%l4
	bcc,a	%icc,	loop_1684
	orncc	%g3,	%l1,	%o4
	edge8n	%i3,	%o0,	%l0
	movrlez	%i2,	%l2,	%i5
loop_1684:
	lduw	[%l7 + 0x74],	%i7
	for	%f6,	%f14,	%f26
	std	%f20,	[%l7 + 0x18]
	sll	%i0,	%l5,	%o1
	ta	%icc,	0x0
	edge8n	%g7,	%o3,	%g2
	tpos	%xcc,	0x3
	addccc	%g1,	%g4,	%i4
	fmul8x16au	%f8,	%f26,	%f10
	orncc	%l6,	%i6,	%o2
	nop
	setx	0x029483FFB13F0DF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x5702576B2AAE170F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f12,	%f0
	fbge,a	%fcc3,	loop_1685
	movl	%xcc,	%g5,	%o7
	movl	%icc,	%l3,	%o5
	andcc	%i1,	0x1896,	%o6
loop_1685:
	fpack16	%f0,	%f27
	sethi	0x0CEE,	%l4
	andcc	%g6,	%g3,	%o4
	tsubcc	%l1,	%i3,	%l0
	edge16	%i2,	%l2,	%o0
	fbg	%fcc3,	loop_1686
	nop
	setx	loop_1687,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%icc,	0x0
	ble	%xcc,	loop_1688
loop_1686:
	edge8l	%i5,	%i0,	%i7
loop_1687:
	movrlz	%l5,	%g7,	%o3
	alignaddrl	%g2,	%g1,	%g4
loop_1688:
	movgu	%xcc,	%i4,	%l6
	fsrc1s	%f10,	%f29
	umul	%o1,	%o2,	%i6
	wr	%g0,	0x80,	%asi
	stha	%o7,	[%l7 + 0x76] %asi
	nop
	setx	loop_1689,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%g5,	0x18DD,	%o5
	movpos	%icc,	%l3,	%o6
	addc	%l4,	%g6,	%i1
loop_1689:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g3,	%l1
	movcc	%icc,	%o4,	%l0
	brgez	%i2,	loop_1690
	addcc	%i3,	%o0,	%i5
	sir	0x11A0
	orn	%i0,	0x1649,	%l2
loop_1690:
	edge8	%l5,	%g7,	%o3
	subc	%i7,	0x163E,	%g1
	addcc	%g2,	%g4,	%l6
	fone	%f24
	fpsub16s	%f4,	%f23,	%f25
	xnorcc	%o1,	0x143E,	%o2
	fbu,a	%fcc2,	loop_1691
	fmovsn	%icc,	%f25,	%f21
	set	0x3F, %l1
	stba	%i6,	[%l7 + %l1] 0x04
loop_1691:
	tcs	%xcc,	0x4
	ld	[%l7 + 0x78],	%f24
	bneg,a	%xcc,	loop_1692
	edge8n	%i4,	%g5,	%o5
	fcmpgt32	%f30,	%f4,	%l3
	subc	%o7,	0x1E6D,	%o6
loop_1692:
	fexpand	%f11,	%f20
	udivx	%g6,	0x1C46,	%l4
	fmovdn	%xcc,	%f20,	%f4
	fmovsvs	%icc,	%f7,	%f3
	add	%i1,	%g3,	%o4
	subccc	%l0,	%l1,	%i2
	sub	%i3,	0x1DBB,	%o0
	fone	%f2
	fbue,a	%fcc1,	loop_1693
	movg	%icc,	%i0,	%i5
	subccc	%l5,	%l2,	%g7
	bge,a,pn	%icc,	loop_1694
loop_1693:
	faligndata	%f22,	%f16,	%f4
	brz,a	%i7,	loop_1695
	fxnors	%f15,	%f17,	%f18
loop_1694:
	fbo	%fcc2,	loop_1696
	brgez,a	%o3,	loop_1697
loop_1695:
	fmovd	%f24,	%f26
	edge16n	%g2,	%g4,	%g1
loop_1696:
	fcmpgt32	%f18,	%f28,	%l6
loop_1697:
	array16	%o2,	%i6,	%i4
	sllx	%o1,	%g5,	%o5
	tneg	%xcc,	0x5
	ta	%xcc,	0x5
	movrgez	%l3,	%o7,	%o6
	taddcctv	%l4,	0x0AFE,	%g6
	bn,a,pt	%xcc,	loop_1698
	bcc,a,pn	%icc,	loop_1699
	movre	%g3,	%i1,	%l0
	tge	%icc,	0x4
loop_1698:
	sir	0x1F8A
loop_1699:
	smul	%o4,	0x0614,	%i2
	fbuge,a	%fcc1,	loop_1700
	alignaddrl	%i3,	%l1,	%o0
	fba	%fcc3,	loop_1701
	nop
	setx	0x90434E1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_1700:
	nop
	setx	0x69026095,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9F19C462,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f11,	%f2
	bvs,a,pn	%icc,	loop_1702
loop_1701:
	fmovrsne	%i5,	%f29,	%f26
	movre	%l5,	%i0,	%g7
	fones	%f28
loop_1702:
	nop
	setx	0x423FA3822051B794,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fabss	%f18,	%f24
	addc	%l2,	%o3,	%g2
	fmovsgu	%icc,	%f6,	%f18
	tle	%icc,	0x3
	tvs	%icc,	0x6
	tne	%icc,	0x1
	fmovdle	%xcc,	%f27,	%f28
	edge16l	%i7,	%g1,	%g4
	movrgez	%o2,	%i6,	%l6
	nop
	fitos	%f7,	%f10
	fstox	%f10,	%f28
	edge8l	%o1,	%g5,	%o5
	bg,pn	%icc,	loop_1703
	ldub	[%l7 + 0x4F],	%i4
	alignaddrl	%l3,	%o6,	%l4
	lduw	[%l7 + 0x78],	%o7
loop_1703:
	sdivx	%g6,	0x0CEB,	%g3
	ld	[%l7 + 0x60],	%f13
	andcc	%l0,	0x1C63,	%i1
	addccc	%o4,	0x113E,	%i2
	bpos,a,pt	%icc,	loop_1704
	fmovrdgez	%l1,	%f28,	%f30
	fones	%f11
	fpadd32s	%f8,	%f11,	%f16
loop_1704:
	movpos	%xcc,	%i3,	%o0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x0c,	%f16
	movvs	%icc,	%l5,	%i0
	fbu,a	%fcc2,	loop_1705
	edge8n	%g7,	%l2,	%o3
	movvc	%xcc,	%g2,	%i7
	set	0x2C, %l2
	ldsha	[%l7 + %l2] 0x0c,	%i5
loop_1705:
	stbar
	fsrc2	%f30,	%f0
	mova	%icc,	%g1,	%g4
	array16	%i6,	%l6,	%o2
	movne	%icc,	%o1,	%o5
	tvc	%xcc,	0x5
	fpackfix	%f6,	%f28
	fbug	%fcc3,	loop_1706
	edge16ln	%i4,	%l3,	%o6
	nop
	fitos	%f3,	%f25
	fstox	%f25,	%f2
	movrgez	%l4,	0x039,	%g5
loop_1706:
	fbue	%fcc3,	loop_1707
	movgu	%icc,	%o7,	%g6
	tneg	%xcc,	0x4
	fmovrdlez	%l0,	%f28,	%f18
loop_1707:
	movre	%g3,	0x072,	%o4
	xnorcc	%i2,	0x07A4,	%i1
	mova	%icc,	%i3,	%l1
	bl	%icc,	loop_1708
	tle	%icc,	0x4
	edge16n	%l5,	%o0,	%i0
	fpmerge	%f21,	%f9,	%f6
loop_1708:
	array32	%l2,	%g7,	%o3
	edge32	%g2,	%i7,	%g1
	orn	%g4,	%i6,	%i5
	edge32	%l6,	%o1,	%o2
	brgz	%i4,	loop_1709
	tn	%xcc,	0x2
	mulscc	%o5,	0x0995,	%l3
	fmul8sux16	%f12,	%f6,	%f28
loop_1709:
	fmovsge	%icc,	%f10,	%f20
	edge16n	%o6,	%g5,	%l4
	bl,a	loop_1710
	ldsh	[%l7 + 0x78],	%o7
	andcc	%l0,	%g3,	%g6
	fornot1s	%f19,	%f16,	%f7
loop_1710:
	array8	%i2,	%i1,	%i3
	fmovsvc	%xcc,	%f28,	%f6
	orncc	%o4,	0x0A7D,	%l1
	andcc	%l5,	0x16C7,	%o0
	orn	%l2,	%i0,	%o3
	tge	%icc,	0x6
	bl	%icc,	loop_1711
	movgu	%icc,	%g2,	%i7
	movrne	%g1,	0x339,	%g4
	set	0x3A, %l6
	ldsba	[%l7 + %l6] 0x14,	%g7
loop_1711:
	lduw	[%l7 + 0x5C],	%i5
	fbu	%fcc1,	loop_1712
	edge8ln	%l6,	%i6,	%o1
	subcc	%o2,	%o5,	%i4
	subc	%o6,	%g5,	%l4
loop_1712:
	fmovrdne	%l3,	%f18,	%f8
	orn	%l0,	0x1D9F,	%g3
	movge	%icc,	%g6,	%i2
	subc	%i1,	0x12CC,	%i3
	tpos	%xcc,	0x6
	edge32l	%o4,	%o7,	%l1
	tgu	%icc,	0x3
	movre	%o0,	0x202,	%l5
	fmovdl	%xcc,	%f9,	%f10
	tsubcc	%l2,	%i0,	%o3
	edge16l	%i7,	%g1,	%g2
	mova	%icc,	%g4,	%i5
	addccc	%l6,	%i6,	%g7
	sllx	%o2,	%o5,	%o1
	fmovdle	%icc,	%f0,	%f13
	tl	%xcc,	0x6
	st	%f7,	[%l7 + 0x78]
	sdiv	%o6,	0x0503,	%i4
	fmovsne	%icc,	%f8,	%f18
	movle	%icc,	%l4,	%g5
	edge8ln	%l3,	%l0,	%g3
	wr	%g0,	0x0c,	%asi
	stba	%g6,	[%l7 + 0x16] %asi
	bn,a,pt	%icc,	loop_1713
	add	%i1,	0x0252,	%i2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x78] %asi,	%o4
loop_1713:
	addccc	%i3,	%o7,	%l1
	tneg	%xcc,	0x2
	fbule,a	%fcc3,	loop_1714
	addccc	%l5,	%l2,	%i0
	sethi	0x052F,	%o0
	andcc	%o3,	%g1,	%i7
loop_1714:
	ldd	[%l7 + 0x50],	%g2
	edge8l	%g4,	%i5,	%i6
	edge32ln	%g7,	%o2,	%o5
	movre	%o1,	0x3A6,	%l6
	fbne,a	%fcc3,	loop_1715
	nop
	set	0x10, %i6
	std	%f14,	[%l7 + %i6]
	sdiv	%i4,	0x1A95,	%o6
	ldx	[%l7 + 0x10],	%g5
loop_1715:
	ble	loop_1716
	addccc	%l3,	%l4,	%g3
	stb	%g6,	[%l7 + 0x3D]
	stx	%l0,	[%l7 + 0x10]
loop_1716:
	movn	%xcc,	%i2,	%i1
	nop
	fitos	%f12,	%f5
	fstox	%f5,	%f16
	fxtos	%f16,	%f18
	tvs	%xcc,	0x5
	flush	%l7 + 0x6C
	membar	0x4A
	array16	%o4,	%o7,	%l1
	bshuffle	%f4,	%f26,	%f10
	movg	%icc,	%i3,	%l5
	brlez	%l2,	loop_1717
	srax	%i0,	0x00,	%o0
	fornot1s	%f18,	%f4,	%f8
	udivcc	%g1,	0x0BE1,	%i7
loop_1717:
	umul	%g2,	0x081D,	%g4
	lduw	[%l7 + 0x10],	%i5
	nop
	setx loop_1718, %l0, %l1
	jmpl %l1, %i6
	smul	%g7,	0x177F,	%o3
	xorcc	%o5,	%o2,	%l6
	nop
	setx	0xCFBB5CA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f12
loop_1718:
	edge32ln	%i4,	%o6,	%o1
	brnz	%g5,	loop_1719
	array16	%l3,	%g3,	%l4
	bleu,a	%xcc,	loop_1720
	bn,pn	%icc,	loop_1721
loop_1719:
	ble,a	loop_1722
	fabsd	%f22,	%f24
loop_1720:
	sll	%g6,	0x08,	%l0
loop_1721:
	orncc	%i2,	%i1,	%o7
loop_1722:
	edge8n	%o4,	%i3,	%l1
	fors	%f1,	%f29,	%f4
	mulscc	%l2,	0x1807,	%l5
	tpos	%xcc,	0x6
	orcc	%o0,	%i0,	%g1
	addc	%i7,	0x0DF6,	%g2
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i5
	and	%g4,	%i6,	%o3
	edge16	%g7,	%o5,	%l6
	add	%o2,	%o6,	%o1
	andn	%g5,	0x060B,	%i4
	nop
	setx	loop_1723,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%xcc,	0x3
	fble	%fcc1,	loop_1724
	movn	%xcc,	%l3,	%l4
loop_1723:
	tleu	%xcc,	0x2
	tsubcc	%g6,	0x07EC,	%g3
loop_1724:
	edge32n	%i2,	%l0,	%o7
	fbu,a	%fcc2,	loop_1725
	tne	%icc,	0x6
	fands	%f6,	%f26,	%f16
	tn	%icc,	0x7
loop_1725:
	addcc	%o4,	%i1,	%l1
	tvs	%icc,	0x2
	fexpand	%f24,	%f8
	tcc	%xcc,	0x5
	ble,a,pn	%xcc,	loop_1726
	tge	%icc,	0x2
	move	%xcc,	%l2,	%l5
	sdivcc	%o0,	0x01D9,	%i0
loop_1726:
	movle	%icc,	%i3,	%i7
	movrlz	%g1,	%i5,	%g2
	smul	%g4,	%o3,	%i6
	sub	%g7,	%o5,	%l6
	ta	%icc,	0x6
	or	%o2,	0x032F,	%o6
	nop
	setx	0xA6177E929054E38A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	sdiv	%g5,	0x0524,	%i4
	tle	%icc,	0x6
	srlx	%o1,	0x0A,	%l3
	sdiv	%g6,	0x0B6B,	%g3
	te	%xcc,	0x7
	bcc,pn	%xcc,	loop_1727
	or	%i2,	%l0,	%l4
	umulcc	%o4,	0x0C1D,	%i1
	tcc	%xcc,	0x6
loop_1727:
	xnorcc	%l1,	0x108C,	%l2
	fmovsn	%xcc,	%f15,	%f9
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x10,	%o7,	%o0
	addccc	%i0,	0x1D55,	%l5
	taddcc	%i3,	0x1E6C,	%i7
	edge32l	%g1,	%i5,	%g4
	edge8ln	%o3,	%g2,	%i6
	tgu	%xcc,	0x7
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f0
	tneg	%xcc,	0x6
	taddcctv	%g7,	%l6,	%o2
	bcs,a	loop_1728
	movgu	%icc,	%o5,	%g5
	membar	0x70
	nop
	setx	0xAEC14A7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x2B7C5443,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f17,	%f1
loop_1728:
	st	%f16,	[%l7 + 0x5C]
	edge8l	%i4,	%o1,	%o6
	alignaddrl	%l3,	%g6,	%i2
	umul	%l0,	0x1694,	%l4
	nop
	setx	0x3EC015F6BE4B94E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA340543D7A91E2D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f2,	%f16
	tcc	%xcc,	0x7
	tle	%icc,	0x4
	movn	%icc,	%o4,	%g3
	fandnot2	%f18,	%f4,	%f22
	membar	0x4E
	edge32ln	%i1,	%l2,	%l1
	stbar
	andcc	%o0,	%i0,	%o7
	tvc	%xcc,	0x6
	popc	0x19C9,	%i3
	movcc	%icc,	%l5,	%i7
	alignaddr	%i5,	%g1,	%o3
	fnegs	%f10,	%f27
	edge8ln	%g2,	%g4,	%g7
	subc	%i6,	0x1E74,	%l6
	sub	%o2,	0x114D,	%o5
	fblg,a	%fcc1,	loop_1729
	add	%i4,	0x037A,	%g5
	movrne	%o6,	0x1D4,	%l3
	nop
	setx	0x5FA3942E670C73B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x305410A50B250F89,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f12,	%f6
loop_1729:
	ldx	[%l7 + 0x40],	%o1
	movne	%icc,	%g6,	%l0
	popc	%l4,	%o4
	movrlez	%g3,	0x3B3,	%i1
	fabss	%f22,	%f3
	movgu	%icc,	%l2,	%l1
	sra	%i2,	%i0,	%o0
	movle	%xcc,	%i3,	%o7
	alignaddr	%i7,	%l5,	%g1
	tcc	%icc,	0x7
	brgez	%i5,	loop_1730
	ld	[%l7 + 0x20],	%f19
	edge16ln	%o3,	%g4,	%g7
	fmovsn	%icc,	%f21,	%f16
loop_1730:
	sdiv	%i6,	0x1F65,	%l6
	or	%g2,	0x0A45,	%o5
	xnor	%o2,	%i4,	%g5
	fmovsne	%xcc,	%f31,	%f31
	tvc	%xcc,	0x0
	fbo	%fcc2,	loop_1731
	xnorcc	%l3,	0x1B78,	%o1
	sdivx	%g6,	0x173B,	%l0
	smul	%o6,	0x11D0,	%o4
loop_1731:
	xor	%g3,	0x0C06,	%i1
	fble,a	%fcc3,	loop_1732
	srl	%l4,	%l1,	%i2
	tl	%icc,	0x6
	edge32	%l2,	%o0,	%i0
loop_1732:
	edge8n	%o7,	%i7,	%i3
	fpack32	%f22,	%f4,	%f28
	sra	%g1,	%i5,	%l5
	sdivx	%g4,	0x0684,	%o3
	taddcctv	%i6,	%g7,	%g2
	movn	%xcc,	%o5,	%l6
	bshuffle	%f20,	%f16,	%f24
	array16	%o2,	%g5,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o1,	%g6,	%l0
	xorcc	%o6,	%o4,	%l3
	orncc	%i1,	%l4,	%l1
	ldub	[%l7 + 0x23],	%g3
	bn,a,pn	%xcc,	loop_1733
	fmovdn	%icc,	%f30,	%f31
	ldub	[%l7 + 0x45],	%i2
	nop
	setx	0xE4BB026A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f4
loop_1733:
	edge32l	%l2,	%o0,	%i0
	tvc	%icc,	0x5
	bge	loop_1734
	sra	%i7,	0x07,	%i3
	tle	%icc,	0x3
	movrlz	%o7,	0x216,	%i5
loop_1734:
	fpadd16	%f28,	%f10,	%f30
	ldd	[%l7 + 0x10],	%f12
	edge16ln	%g1,	%g4,	%o3
	fmovsge	%icc,	%f13,	%f4
	smulcc	%i6,	0x0837,	%l5
	fmuld8ulx16	%f23,	%f5,	%f26
	movvs	%xcc,	%g7,	%o5
	fnegs	%f15,	%f23
	bg,pt	%xcc,	loop_1735
	orn	%g2,	%l6,	%o2
	edge32	%i4,	%g5,	%o1
	fble,a	%fcc2,	loop_1736
loop_1735:
	array32	%g6,	%l0,	%o6
	bvc,a,pn	%xcc,	loop_1737
	edge16l	%l3,	%i1,	%o4
loop_1736:
	orn	%l1,	0x044A,	%g3
	ldd	[%l7 + 0x08],	%l4
loop_1737:
	nop
	set	0x38, %o6
	lduha	[%l7 + %o6] 0x0c,	%i2
	fcmpne16	%f6,	%f22,	%o0
	fmovsleu	%icc,	%f17,	%f0
	movg	%xcc,	%i0,	%l2
	udiv	%i7,	0x0520,	%o7
	add	%i3,	0x1672,	%g1
	movpos	%icc,	%i5,	%g4
	call	loop_1738
	movrlez	%i6,	0x234,	%l5
	orncc	%o3,	%g7,	%g2
	faligndata	%f8,	%f0,	%f20
loop_1738:
	fpadd16	%f24,	%f16,	%f18
	fbu	%fcc1,	loop_1739
	mulscc	%l6,	0x026D,	%o2
	sra	%i4,	0x1A,	%o5
	bneg	%icc,	loop_1740
loop_1739:
	tvs	%icc,	0x3
	edge16	%g5,	%g6,	%o1
	addccc	%l0,	0x06EA,	%l3
loop_1740:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x38] %asi,	%f30
	movrlez	%i1,	%o4,	%o6
	bneg,pt	%xcc,	loop_1741
	stx	%l1,	[%l7 + 0x68]
	brlz	%g3,	loop_1742
	bvs,a,pt	%xcc,	loop_1743
loop_1741:
	array16	%i2,	%o0,	%i0
	nop
	setx	loop_1744,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1742:
	bcs	%icc,	loop_1745
loop_1743:
	subcc	%l2,	0x0673,	%l4
	nop
	fitod	%f6,	%f22
	fdtox	%f22,	%f4
loop_1744:
	tgu	%icc,	0x7
loop_1745:
	udivcc	%o7,	0x1E01,	%i7
	fpsub32s	%f22,	%f14,	%f12
	prefetch	[%l7 + 0x2C],	 0x0
	st	%f7,	[%l7 + 0x7C]
	taddcctv	%g1,	0x1EC4,	%i5
	ta	%icc,	0x5
	tsubcc	%i3,	0x13FB,	%g4
	fbu,a	%fcc2,	loop_1746
	mulx	%l5,	%i6,	%o3
	fand	%f10,	%f28,	%f10
	array8	%g7,	%g2,	%o2
loop_1746:
	for	%f22,	%f26,	%f22
	fbne,a	%fcc3,	loop_1747
	move	%xcc,	%i4,	%l6
	ldd	[%l7 + 0x68],	%f30
	tvc	%icc,	0x5
loop_1747:
	umulcc	%o5,	%g5,	%g6
	lduw	[%l7 + 0x18],	%l0
	smulcc	%l3,	%o1,	%i1
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f12
	fxtod	%f12,	%f20
	movge	%icc,	%o4,	%l1
	tpos	%icc,	0x3
	movcc	%icc,	%o6,	%g3
	bpos,pt	%icc,	loop_1748
	smulcc	%i2,	%i0,	%l2
	fones	%f29
	fbne	%fcc1,	loop_1749
loop_1748:
	and	%l4,	%o0,	%o7
	umulcc	%i7,	0x0063,	%g1
	tge	%icc,	0x1
loop_1749:
	ldsh	[%l7 + 0x54],	%i5
	movrlez	%i3,	%l5,	%i6
	subc	%o3,	%g7,	%g2
	sethi	0x17F8,	%o2
	umulcc	%i4,	0x1FBE,	%g4
	wr	%g0,	0xea,	%asi
	stxa	%o5,	[%l7 + 0x20] %asi
	membar	#Sync
	wr	%g0,	0x18,	%asi
	stha	%l6,	[%l7 + 0x54] %asi
	subc	%g6,	%l0,	%g5
	tsubcctv	%o1,	0x1C19,	%i1
	tsubcctv	%o4,	%l1,	%o6
	or	%l3,	0x02C7,	%g3
	fmovsn	%icc,	%f25,	%f20
	brgez,a	%i2,	loop_1750
	brgz	%l2,	loop_1751
	lduh	[%l7 + 0x3E],	%l4
	movneg	%icc,	%o0,	%i0
loop_1750:
	fmovdneg	%icc,	%f17,	%f29
loop_1751:
	ldx	[%l7 + 0x40],	%o7
	fmovrde	%i7,	%f22,	%f10
	membar	0x43
	umul	%i5,	0x0BE6,	%g1
	brlez	%l5,	loop_1752
	movne	%icc,	%i3,	%o3
	tcc	%icc,	0x1
	set	0x34, %g6
	ldswa	[%l7 + %g6] 0x89,	%i6
loop_1752:
	fandnot2s	%f7,	%f13,	%f15
	subcc	%g7,	%g2,	%o2
	movrne	%g4,	0x1F5,	%i4
	ld	[%l7 + 0x40],	%f27
	tle	%icc,	0x3
	tgu	%icc,	0x3
	fors	%f30,	%f1,	%f11
	edge16ln	%l6,	%o5,	%g6
	udiv	%l0,	0x05CB,	%o1
	fble	%fcc2,	loop_1753
	movneg	%icc,	%g5,	%o4
	brlz,a	%i1,	loop_1754
	tvc	%xcc,	0x4
loop_1753:
	fand	%f2,	%f20,	%f16
	fmovrdlz	%o6,	%f14,	%f24
loop_1754:
	movrne	%l3,	%l1,	%i2
	taddcc	%g3,	%l4,	%o0
	movre	%l2,	%o7,	%i0
	move	%icc,	%i7,	%i5
	movle	%xcc,	%l5,	%g1
	fmovrsgz	%i3,	%f29,	%f28
	bn,a	%icc,	loop_1755
	edge16ln	%i6,	%o3,	%g2
	fba,a	%fcc2,	loop_1756
	stb	%o2,	[%l7 + 0x2E]
loop_1755:
	nop
	setx loop_1757, %l0, %l1
	jmpl %l1, %g4
	sllx	%g7,	%i4,	%o5
loop_1756:
	bge,a,pn	%xcc,	loop_1758
	movvc	%icc,	%g6,	%l0
loop_1757:
	move	%xcc,	%o1,	%l6
	wr	%g0,	0x11,	%asi
	stba	%o4,	[%l7 + 0x27] %asi
loop_1758:
	mova	%xcc,	%g5,	%o6
	movneg	%xcc,	%l3,	%i1
	fornot1s	%f27,	%f30,	%f25
	st	%f7,	[%l7 + 0x10]
	ldstub	[%l7 + 0x0D],	%l1
	nop
	set	0x48, %g2
	stx	%i2,	[%l7 + %g2]
	nop
	fitod	%f27,	%f2
	fornot1	%f18,	%f26,	%f12
	array8	%g3,	%l4,	%l2
	sethi	0x0E25,	%o0
	tsubcctv	%o7,	%i0,	%i5
	movneg	%xcc,	%l5,	%i7
	srlx	%i3,	%g1,	%i6
	ldsb	[%l7 + 0x6B],	%g2
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovsl	%xcc,	%f13,	%f17
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	edge16	%o3,	%o2,	%g4
	movvc	%xcc,	%g7,	%o5
	edge16ln	%i4,	%l0,	%g6
	movpos	%icc,	%o1,	%o4
	sth	%l6,	[%l7 + 0x0C]
	fnands	%f1,	%f24,	%f20
	fmovrdne	%g5,	%f10,	%f22
	movrgez	%l3,	0x31E,	%o6
	sra	%l1,	%i1,	%i2
	sllx	%l4,	0x17,	%g3
	or	%l2,	0x0253,	%o0
	fmovdgu	%icc,	%f9,	%f10
	movgu	%icc,	%o7,	%i5
	udivx	%i0,	0x0112,	%i7
	fnand	%f10,	%f18,	%f30
	alignaddr	%l5,	%i3,	%g1
	movne	%xcc,	%i6,	%o3
	fpsub32	%f22,	%f10,	%f12
	nop
	setx	0x858764E97A236063,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2F516C9B40A72552,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f24,	%f30
	fors	%f22,	%f12,	%f5
	fxnors	%f28,	%f19,	%f6
	movneg	%xcc,	%g2,	%g4
	srax	%o2,	0x0A,	%o5
	udivcc	%i4,	0x07E3,	%g7
	movpos	%icc,	%l0,	%g6
	bcc,pn	%xcc,	loop_1759
	ba,a,pn	%icc,	loop_1760
	nop
	setx loop_1761, %l0, %l1
	jmpl %l1, %o4
	fbul	%fcc2,	loop_1762
loop_1759:
	taddcctv	%o1,	0x1FB2,	%l6
loop_1760:
	tsubcc	%l3,	%g5,	%l1
loop_1761:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i1
loop_1762:
	array16	%i2,	%l4,	%g3
	subc	%l2,	0x1F60,	%o6
	edge32n	%o7,	%i5,	%i0
	andn	%i7,	%l5,	%i3
	edge8ln	%g1,	%i6,	%o0
	movleu	%icc,	%g2,	%g4
	andncc	%o2,	%o3,	%o5
	tleu	%xcc,	0x5
	fmovdn	%icc,	%f3,	%f13
	set	0x20, %i3
	sta	%f6,	[%l7 + %i3] 0x80
	movpos	%xcc,	%i4,	%l0
	movrlz	%g6,	0x3DE,	%o4
	std	%f28,	[%l7 + 0x30]
	sll	%o1,	0x0B,	%g7
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x10,	%i6
	nop
	setx	0xD0A09452,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x71143CCB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f6,	%f8
	fmul8x16	%f13,	%f6,	%f20
	fmovscs	%xcc,	%f0,	%f28
	movrlez	%l3,	0x21B,	%l1
	tne	%icc,	0x6
	fba	%fcc0,	loop_1763
	or	%g5,	%i1,	%i2
	prefetch	[%l7 + 0x70],	 0x0
	mulscc	%l4,	%l2,	%o6
loop_1763:
	fmovdneg	%icc,	%f2,	%f7
	andn	%g3,	%o7,	%i0
	nop
	setx	0x55ECF70DF058059D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	tl	%icc,	0x3
	tl	%icc,	0x5
	ld	[%l7 + 0x50],	%f20
	fands	%f12,	%f18,	%f22
	ldd	[%l7 + 0x30],	%f0
	fandnot1	%f22,	%f0,	%f20
	movpos	%icc,	%i5,	%i7
	move	%icc,	%i3,	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o0
	movg	%xcc,	%g2,	%i6
	array16	%o2,	%g4,	%o3
	mulx	%o5,	0x01C2,	%l0
	bleu,pn	%xcc,	loop_1764
	fbg	%fcc3,	loop_1765
	xnorcc	%g6,	%o4,	%o1
	sllx	%i4,	%g7,	%l3
loop_1764:
	array32	%l6,	%l1,	%g5
loop_1765:
	fmovrdgez	%i1,	%f20,	%f30
	bcs,a,pn	%icc,	loop_1766
	fmovdneg	%icc,	%f15,	%f21
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x88,	%l4
loop_1766:
	call	loop_1767
	movn	%icc,	%l2,	%i2
	nop
	set	0x20, %g1
	prefetch	[%l7 + %g1],	 0x1
	tl	%icc,	0x5
loop_1767:
	bn,pn	%icc,	loop_1768
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g3,	%o7,	%o6
	be	%icc,	loop_1769
loop_1768:
	edge16n	%i5,	%i7,	%i0
	fors	%f21,	%f9,	%f21
	sllx	%g1,	%i3,	%l5
loop_1769:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o0,	%i6,	%o2
	movl	%xcc,	%g4,	%o3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	mova	%xcc,	%g2,	%o5
	fmovsne	%xcc,	%f6,	%f21
	movpos	%xcc,	%g6,	%o4
	edge8l	%o1,	%l0,	%i4
	movge	%xcc,	%l3,	%g7
	movl	%xcc,	%l1,	%l6
	stb	%i1,	[%l7 + 0x6F]
	movneg	%xcc,	%l4,	%g5
	movvs	%xcc,	%l2,	%i2
	subcc	%o7,	%o6,	%i5
	alignaddr	%g3,	%i7,	%i0
	orcc	%i3,	0x1318,	%g1
	edge8ln	%o0,	%i6,	%o2
	fmovrsgez	%g4,	%f11,	%f1
	ldsh	[%l7 + 0x62],	%o3
	fpadd32	%f6,	%f18,	%f18
	fornot1s	%f11,	%f11,	%f5
	tgu	%icc,	0x2
	edge8l	%l5,	%g2,	%g6
	andcc	%o5,	0x009F,	%o1
	orncc	%l0,	%i4,	%l3
	set	0x5C, %o4
	ldstuba	[%l7 + %o4] 0x81,	%g7
	xorcc	%o4,	0x1469,	%l1
	fbue	%fcc2,	loop_1770
	movre	%i1,	%l6,	%g5
	sethi	0x03B2,	%l4
	fmovdg	%xcc,	%f18,	%f19
loop_1770:
	array8	%l2,	%o7,	%i2
	wr	%g0,	0x04,	%asi
	stha	%i5,	[%l7 + 0x3C] %asi
	nop
	fitod	%f7,	%f26
	nop
	setx	0x0E2E0763DFD27729,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x14C66DBE3B9B8D7B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f6,	%f18
	edge32ln	%o6,	%i7,	%i0
	sdivcc	%i3,	0x1445,	%g1
	fmul8x16au	%f4,	%f14,	%f12
	tne	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o0
	tge	%xcc,	0x3
	fbuge	%fcc1,	loop_1771
	fcmpeq16	%f20,	%f18,	%g3
	tl	%xcc,	0x7
	bn,a	loop_1772
loop_1771:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x4C],	%i6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x11] %asi,	%g4
loop_1772:
	orcc	%o2,	0x1C00,	%o3
	bcs,a	loop_1773
	nop
	setx	0x721E1546,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f26
	movrlz	%l5,	%g6,	%o5
	fbn	%fcc2,	loop_1774
loop_1773:
	udiv	%g2,	0x110B,	%o1
	alignaddrl	%i4,	%l0,	%g7
	edge16n	%l3,	%l1,	%o4
loop_1774:
	fbl,a	%fcc0,	loop_1775
	nop
	setx	loop_1776,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%icc,	%l6,	%i1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%g5
loop_1775:
	add	%l2,	0x1227,	%l4
loop_1776:
	popc	%o7,	%i5
	sdivx	%i2,	0x04FC,	%o6
	popc	0x0C2A,	%i0
	tn	%icc,	0x1
	ta	%xcc,	0x5
	nop
	setx	0x17B2B773,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x22AED822,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f11,	%f27
	andn	%i3,	0x1759,	%g1
	nop
	setx	0xFBA9407CC2E80A33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9D647AAC4040171B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f4,	%f22
	popc	0x0D09,	%i7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	fzeros	%f3
	for	%f14,	%f2,	%f20
	st	%f28,	[%l7 + 0x40]
	mulscc	%i6,	%g4,	%g3
	taddcctv	%o3,	%o2,	%g6
	move	%icc,	%l5,	%o5
	fmovsg	%icc,	%f7,	%f21
	brlez	%g2,	loop_1777
	mova	%xcc,	%o1,	%l0
	fmovsne	%xcc,	%f6,	%f20
	udiv	%i4,	0x071D,	%l3
loop_1777:
	fbul,a	%fcc1,	loop_1778
	nop
	setx	0xF0A4EBB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xADD61A07,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f31,	%f22
	sll	%l1,	%g7,	%l6
	fmovsvs	%xcc,	%f5,	%f1
loop_1778:
	alignaddrl	%o4,	%i1,	%g5
	xor	%l4,	0x0BF9,	%o7
	srax	%i5,	%i2,	%o6
	xnorcc	%i0,	%i3,	%g1
	fandnot1s	%f20,	%f4,	%f18
	xnor	%i7,	%l2,	%o0
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x0c,	 0x2
	edge32n	%g3,	%g4,	%o3
	andcc	%g6,	0x0FCA,	%o2
	bgu,a	loop_1779
	movg	%icc,	%l5,	%g2
	set	0x53, %o0
	ldsba	[%l7 + %o0] 0x19,	%o1
loop_1779:
	bleu	loop_1780
	sdiv	%l0,	0x1CC7,	%i4
	taddcctv	%l3,	%l1,	%g7
	membar	0x4E
loop_1780:
	fbn	%fcc3,	loop_1781
	alignaddr	%l6,	%o5,	%o4
	umul	%i1,	0x05F3,	%l4
	movre	%g5,	%o7,	%i5
loop_1781:
	sllx	%o6,	%i2,	%i3
	edge8ln	%i0,	%g1,	%i7
	udivcc	%l2,	0x1DFF,	%i6
	andncc	%g3,	%o0,	%g4
	tgu	%icc,	0x2
	fmovrde	%g6,	%f6,	%f2
	edge32n	%o3,	%o2,	%l5
	nop
	setx loop_1782, %l0, %l1
	jmpl %l1, %o1
	fmovsge	%icc,	%f23,	%f27
	sllx	%g2,	%i4,	%l0
	stbar
loop_1782:
	tle	%icc,	0x1
	movge	%xcc,	%l3,	%l1
	edge16ln	%l6,	%o5,	%g7
	st	%f0,	[%l7 + 0x20]
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x4C] %asi
	nop
	setx	loop_1783,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdle	%icc,	%f31,	%f31
	sdivx	%i1,	0x0DEE,	%l4
	alignaddr	%g5,	%o4,	%o7
loop_1783:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%i5
	tle	%icc,	0x5
	te	%icc,	0x1
	set	0x78, %g3
	lduwa	[%l7 + %g3] 0x89,	%o6
	sdivcc	%i3,	0x1063,	%i2
	movpos	%xcc,	%i0,	%g1
	prefetch	[%l7 + 0x64],	 0x2
	tsubcc	%i7,	%l2,	%g3
	udiv	%o0,	0x024C,	%i6
	movrne	%g6,	%o3,	%g4
	fcmpgt32	%f12,	%f20,	%o2
	nop
	fitos	%f9,	%f28
	fstox	%f28,	%f0
	fbule	%fcc3,	loop_1784
	fcmple16	%f18,	%f20,	%l5
	sllx	%g2,	%i4,	%o1
	ldx	[%l7 + 0x48],	%l3
loop_1784:
	movgu	%xcc,	%l1,	%l6
	tg	%xcc,	0x4
	subccc	%l0,	%g7,	%o5
	tgu	%xcc,	0x3
	fsrc1	%f22,	%f24
	fbg	%fcc2,	loop_1785
	tcc	%icc,	0x2
	umul	%i1,	%g5,	%o4
	fbug	%fcc1,	loop_1786
loop_1785:
	nop
	setx	0x2EC8A8982073515E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	orncc	%l4,	%i5,	%o7
	movgu	%xcc,	%o6,	%i2
loop_1786:
	edge8l	%i0,	%g1,	%i7
	fpadd16	%f22,	%f10,	%f12
	brlz,a	%l2,	loop_1787
	movle	%icc,	%i3,	%g3
	bg,a	loop_1788
	sir	0x0F24
loop_1787:
	sth	%i6,	[%l7 + 0x44]
	fmul8ulx16	%f6,	%f30,	%f10
loop_1788:
	tl	%xcc,	0x1
	fxors	%f2,	%f9,	%f13
	sll	%g6,	%o3,	%o0
	edge16	%g4,	%l5,	%o2
	brnz,a	%i4,	loop_1789
	movvc	%icc,	%g2,	%l3
	stbar
	movvs	%icc,	%l1,	%o1
loop_1789:
	ba,a,pn	%xcc,	loop_1790
	array32	%l0,	%l6,	%o5
	udiv	%i1,	0x1D87,	%g5
	movvc	%icc,	%g7,	%o4
loop_1790:
	fpack16	%f0,	%f24
	set	0x3C, %g5
	ldswa	[%l7 + %g5] 0x89,	%l4
	edge16ln	%i5,	%o7,	%o6
	smulcc	%i2,	%g1,	%i7
	fmovrdlez	%l2,	%f6,	%f10
	sdiv	%i3,	0x1C64,	%i0
	sethi	0x0A7D,	%g3
	array8	%i6,	%o3,	%g6
	fzeros	%f19
	srl	%o0,	0x08,	%l5
	fmovdvc	%icc,	%f14,	%f29
	fnot1	%f26,	%f12
	xor	%o2,	%i4,	%g2
	array16	%g4,	%l1,	%o1
	fand	%f0,	%f10,	%f10
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%l3
	sra	%l6,	%o5,	%i1
	bge,pn	%xcc,	loop_1791
	movcs	%icc,	%g5,	%g7
	mova	%xcc,	%l0,	%l4
	nop
	setx loop_1792, %l0, %l1
	jmpl %l1, %i5
loop_1791:
	movg	%xcc,	%o4,	%o7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i2,	%o6
loop_1792:
	andn	%i7,	%l2,	%i3
	tn	%icc,	0x6
	srax	%g1,	%g3,	%i0
	fbg	%fcc1,	loop_1793
	array16	%i6,	%g6,	%o0
	fmovsn	%icc,	%f24,	%f23
	movre	%l5,	%o3,	%o2
loop_1793:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5E] %asi,	%i4
	edge32	%g2,	%l1,	%o1
	srl	%g4,	%l3,	%l6
	edge8l	%i1,	%g5,	%o5
	tgu	%xcc,	0x7
	movrne	%g7,	%l4,	%l0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x6C] %asi,	%f19
	tvc	%xcc,	0x0
	udivx	%i5,	0x1617,	%o4
	alignaddr	%o7,	%o6,	%i7
	tn	%xcc,	0x2
	nop
	fitos	%f2,	%f15
	fstod	%f15,	%f16
	movrgz	%i2,	%i3,	%g1
	tle	%xcc,	0x0
	andn	%g3,	%i0,	%l2
	srl	%g6,	%o0,	%i6
	movleu	%xcc,	%o3,	%o2
	fbule,a	%fcc3,	loop_1794
	movn	%xcc,	%l5,	%i4
	tpos	%icc,	0x3
	fcmpeq32	%f22,	%f6,	%l1
loop_1794:
	mulscc	%o1,	0x175B,	%g2
	addcc	%l3,	0x1F05,	%l6
	move	%xcc,	%i1,	%g5
	tle	%xcc,	0x5
	sllx	%g4,	0x13,	%o5
	bcs,a,pt	%icc,	loop_1795
	mulscc	%l4,	0x1B0C,	%g7
	taddcctv	%i5,	%l0,	%o4
	stx	%o6,	[%l7 + 0x18]
loop_1795:
	add	%i7,	0x0FEF,	%o7
	fors	%f31,	%f9,	%f3
	move	%icc,	%i2,	%i3
	movcs	%xcc,	%g1,	%g3
	tsubcc	%i0,	0x039D,	%g6
	andncc	%l2,	%o0,	%o3
	edge8n	%o2,	%i6,	%i4
	smulcc	%l1,	0x1EF6,	%l5
	nop
	setx	0x5110AB21FB5E0342,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x130142BAD802421A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f16,	%f12
	fble	%fcc3,	loop_1796
	bneg,a,pt	%icc,	loop_1797
	fbne,a	%fcc2,	loop_1798
	nop
	set	0x64, %i2
	stw	%o1,	[%l7 + %i2]
loop_1796:
	subc	%l3,	0x18AA,	%g2
loop_1797:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x12] %asi,	%l6
loop_1798:
	tg	%icc,	0x3
	sll	%g5,	0x1F,	%i1
	tgu	%xcc,	0x6
	sllx	%o5,	%g4,	%l4
	tn	%icc,	0x3
	tneg	%icc,	0x1
	swap	[%l7 + 0x44],	%i5
	fmovrse	%g7,	%f7,	%f23
	udivcc	%l0,	0x0E74,	%o6
	array8	%i7,	%o7,	%o4
	edge16l	%i3,	%g1,	%i2
	nop
	fitos	%f9,	%f13
	fstox	%f13,	%f10
	nop
	setx	0xCB4702743860448D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x70C107C79FBB5FFB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f8,	%f18
	nop
	setx	0x58C4969E4A5B2C2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x14C2559AC67482F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f16
	fmovsgu	%xcc,	%f4,	%f5
	andcc	%i0,	0x1596,	%g6
	movl	%xcc,	%g3,	%o0
	movcc	%icc,	%o3,	%o2
	bn,a,pt	%icc,	loop_1799
	tvc	%icc,	0x4
	movg	%xcc,	%l2,	%i4
	tsubcctv	%l1,	%l5,	%i6
loop_1799:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l3,	%g2,	%l6
	brlz	%g5,	loop_1800
	smul	%i1,	%o5,	%g4
	bge,pn	%xcc,	loop_1801
	te	%xcc,	0x1
loop_1800:
	popc	%o1,	%l4
	srax	%i5,	0x18,	%g7
loop_1801:
	sir	0x07F9
	movne	%xcc,	%l0,	%i7
	fmovscc	%xcc,	%f4,	%f18
	popc	%o7,	%o4
	fmovrdne	%o6,	%f26,	%f8
	nop
	fitos	%f14,	%f5
	fstod	%f5,	%f18
	edge32l	%i3,	%g1,	%i2
	fpack32	%f22,	%f22,	%f18
	fmovrdgz	%g6,	%f20,	%f20
	std	%f20,	[%l7 + 0x10]
	xor	%g3,	0x0D2B,	%i0
	edge32l	%o0,	%o3,	%l2
	tge	%xcc,	0x0
	fbne,a	%fcc2,	loop_1802
	taddcctv	%i4,	%l1,	%l5
	fmovrdgz	%o2,	%f6,	%f22
	subcc	%i6,	0x11ED,	%l3
loop_1802:
	orncc	%l6,	0x0272,	%g5
	srlx	%i1,	%o5,	%g2
	popc	%o1,	%l4
	tsubcc	%g4,	0x04E5,	%g7
	nop
	fitos	%f12,	%f27
	fstox	%f27,	%f26
	fxtos	%f26,	%f2
	ldsh	[%l7 + 0x4E],	%i5
	movpos	%xcc,	%l0,	%i7
	set	0x68, %l5
	stxa	%o7,	[%l7 + %l5] 0x15
	array32	%o6,	%i3,	%o4
	tge	%xcc,	0x5
	fcmpgt16	%f18,	%f4,	%g1
	movge	%icc,	%g6,	%i2
	addcc	%i0,	0x0ABF,	%o0
	tge	%xcc,	0x4
	subc	%g3,	%l2,	%o3
	addc	%i4,	0x1BC5,	%l1
	sll	%l5,	0x1C,	%i6
	ldsw	[%l7 + 0x2C],	%l3
	or	%o2,	%l6,	%i1
	movg	%xcc,	%g5,	%g2
	fmovd	%f30,	%f18
	fmovrslz	%o1,	%f18,	%f29
	andncc	%o5,	%l4,	%g4
	andncc	%g7,	%i5,	%i7
	movre	%o7,	0x207,	%l0
	set	0x40, %i1
	lduha	[%l7 + %i1] 0x11,	%i3
	srl	%o4,	0x05,	%o6
	movg	%xcc,	%g6,	%i2
	sra	%g1,	0x04,	%o0
	taddcc	%i0,	0x0E31,	%l2
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x17
	membar	#Sync
	nop
	setx loop_1803, %l0, %l1
	jmpl %l1, %g3
	edge32	%i4,	%o3,	%l5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x30] %asi,	%i6
loop_1803:
	or	%l3,	%l1,	%l6
	sdivcc	%o2,	0x1C45,	%i1
	fmovrslez	%g2,	%f22,	%f9
	sllx	%g5,	0x0E,	%o5
	fmovdcc	%icc,	%f31,	%f21
	edge32n	%o1,	%l4,	%g7
	movrlez	%i5,	0x20D,	%g4
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x12] %asi,	%i7
	fmovdl	%icc,	%f14,	%f10
	mulx	%l0,	%i3,	%o4
	and	%o6,	0x0679,	%o7
	nop
	setx	0xDE478780A46153BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xCC52F585B748D580,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f8,	%f28
	set	0x5D, %i7
	lduba	[%l7 + %i7] 0x89,	%i2
	orn	%g1,	0x01CF,	%g6
	tleu	%icc,	0x4
	movleu	%xcc,	%i0,	%l2
	ldsw	[%l7 + 0x48],	%o0
	and	%i4,	%o3,	%g3
	mulx	%l5,	0x0660,	%i6
	nop
	set	0x3A, %l0
	lduh	[%l7 + %l0],	%l1
	fcmple32	%f2,	%f26,	%l3
	fpadd32	%f12,	%f18,	%f26
	orncc	%l6,	0x1189,	%o2
	udivx	%i1,	0x1F1E,	%g5
	tn	%xcc,	0x6
	movn	%icc,	%g2,	%o5
	sra	%l4,	0x0D,	%o1
	srax	%i5,	0x0D,	%g4
	fmovsne	%icc,	%f1,	%f20
	ldd	[%l7 + 0x68],	%g6
	fmovrse	%i7,	%f1,	%f20
	xor	%i3,	0x0D9A,	%o4
	sir	0x113D
	sllx	%o6,	0x04,	%l0
	tle	%xcc,	0x1
	xor	%i2,	%o7,	%g6
	smul	%g1,	%l2,	%i0
	fbne,a	%fcc0,	loop_1804
	sra	%o0,	0x01,	%o3
	umulcc	%i4,	0x071F,	%l5
	orncc	%g3,	0x1B8B,	%l1
loop_1804:
	ble,a,pn	%xcc,	loop_1805
	brgz,a	%i6,	loop_1806
	orn	%l6,	%l3,	%i1
	sub	%g5,	0x072F,	%g2
loop_1805:
	fmul8sux16	%f0,	%f30,	%f2
loop_1806:
	movrne	%o2,	%o5,	%l4
	pdist	%f8,	%f4,	%f16
	set	0x3A, %o7
	ldsha	[%l7 + %o7] 0x14,	%o1
	sdiv	%g4,	0x1FCA,	%i5
	tneg	%icc,	0x0
	xnor	%i7,	%i3,	%g7
	sdivx	%o6,	0x18AA,	%o4
	fmovrslez	%i2,	%f6,	%f14
	orcc	%l0,	0x077F,	%o7
	ldub	[%l7 + 0x5F],	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l2,	%g1
	fnand	%f16,	%f2,	%f28
	ta	%xcc,	0x0
	sdiv	%o0,	0x1A72,	%o3
	bvs,a,pn	%icc,	loop_1807
	fmovde	%xcc,	%f15,	%f4
	fblg	%fcc0,	loop_1808
	edge32ln	%i0,	%l5,	%g3
loop_1807:
	array16	%i4,	%l1,	%l6
	movrne	%i6,	%i1,	%g5
loop_1808:
	tne	%xcc,	0x4
	std	%f28,	[%l7 + 0x48]
	fmul8x16au	%f27,	%f12,	%f20
	bvc,a,pt	%icc,	loop_1809
	nop
	setx	0xC07406A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	call	loop_1810
	membar	0x26
loop_1809:
	addc	%l3,	0x0625,	%g2
	movvs	%icc,	%o5,	%l4
loop_1810:
	nop
	setx	0xEC394A40,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x010FE581,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f31,	%f18
	tg	%xcc,	0x6
	edge16l	%o2,	%g4,	%i5
	bleu,a	%xcc,	loop_1811
	membar	0x78
	ba,a,pn	%icc,	loop_1812
	tpos	%icc,	0x7
loop_1811:
	nop
	set	0x5A, %g4
	ldsha	[%l7 + %g4] 0x11,	%i7
loop_1812:
	edge16l	%i3,	%o1,	%o6
	fornot1	%f0,	%f14,	%f24
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x44] %asi,	%o4
	fandnot1s	%f5,	%f30,	%f15
	bvc,a,pt	%xcc,	loop_1813
	bleu,a,pn	%xcc,	loop_1814
	fcmple16	%f10,	%f10,	%g7
	or	%i2,	%o7,	%l0
loop_1813:
	bvs,pt	%icc,	loop_1815
loop_1814:
	brnz	%l2,	loop_1816
	edge32l	%g1,	%o0,	%g6
	bcs	loop_1817
loop_1815:
	nop
	fitos	%f5,	%f12
	fstod	%f12,	%f14
loop_1816:
	ldx	[%l7 + 0x70],	%i0
	sdivx	%l5,	0x1396,	%g3
loop_1817:
	ta	%icc,	0x4
	nop
	setx loop_1818, %l0, %l1
	jmpl %l1, %i4
	subc	%l1,	0x163E,	%o3
	fnegs	%f14,	%f0
	fzeros	%f1
loop_1818:
	edge16ln	%l6,	%i6,	%i1
	movrgz	%g5,	0x21A,	%l3
	edge16	%o5,	%g2,	%l4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdcc	%xcc,	%f23,	%f0
	and	%g4,	0x171F,	%o2
	tle	%icc,	0x2
	bn,a,pt	%icc,	loop_1819
	fmovdneg	%xcc,	%f30,	%f27
	xorcc	%i5,	0x0A02,	%i3
	tl	%xcc,	0x5
loop_1819:
	nop
	setx loop_1820, %l0, %l1
	jmpl %l1, %o1
	edge32	%i7,	%o4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i2,	%g7
loop_1820:
	movrlz	%l0,	%l2,	%g1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o7
	tn	%xcc,	0x6
	fmovs	%f31,	%f8
	fmovsa	%xcc,	%f4,	%f21
	sra	%g6,	0x1C,	%i0
	bcs	%xcc,	loop_1821
	addc	%o0,	%l5,	%g3
	or	%i4,	%o3,	%l6
	tsubcc	%l1,	%i1,	%g5
loop_1821:
	xnorcc	%l3,	0x114A,	%i6
	fmovde	%icc,	%f27,	%f1
	movrne	%g2,	0x096,	%l4
	add	%g4,	0x15BD,	%o5
	movpos	%xcc,	%i5,	%o2
	sethi	0x06C0,	%o1
	movneg	%xcc,	%i3,	%o4
	and	%i7,	0x0FE2,	%i2
	srl	%o6,	0x1B,	%g7
	srl	%l0,	0x09,	%l2
	tsubcc	%o7,	%g1,	%g6
	fnot2s	%f21,	%f8
	fnot1	%f10,	%f4
	fmovdvc	%xcc,	%f17,	%f23
	tcs	%xcc,	0x2
	fmovrsne	%i0,	%f25,	%f18
	ld	[%l7 + 0x2C],	%f11
	fandnot1	%f2,	%f10,	%f0
	stx	%o0,	[%l7 + 0x18]
	brnz	%g3,	loop_1822
	faligndata	%f8,	%f6,	%f10
	alignaddr	%i4,	%l5,	%l6
	movcs	%xcc,	%l1,	%i1
loop_1822:
	lduh	[%l7 + 0x5E],	%g5
	fbue	%fcc3,	loop_1823
	fsrc1	%f28,	%f10
	te	%xcc,	0x7
	flush	%l7 + 0x74
loop_1823:
	tge	%xcc,	0x6
	movne	%icc,	%l3,	%i6
	xorcc	%g2,	%o3,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f22,	%f8,	%g4
	movrgz	%i5,	%o5,	%o1
	xnor	%i3,	0x0300,	%o2
	movpos	%xcc,	%o4,	%i7
	tg	%icc,	0x7
	bg,a,pt	%icc,	loop_1824
	sir	0x0254
	set	0x1C, %i0
	swapa	[%l7 + %i0] 0x10,	%i2
loop_1824:
	edge16	%g7,	%l0,	%o6
	lduh	[%l7 + 0x3E],	%o7
	movle	%xcc,	%g1,	%l2
	array16	%g6,	%o0,	%g3
	fmovrslez	%i0,	%f9,	%f7
	edge32	%i4,	%l5,	%l6
	alignaddrl	%l1,	%g5,	%i1
	set	0x0A, %i4
	ldsba	[%l7 + %i4] 0x80,	%i6
	movvc	%xcc,	%g2,	%o3
	fmovscc	%icc,	%f25,	%f5
	fcmpgt32	%f30,	%f8,	%l3
	movn	%icc,	%l4,	%g4
	subcc	%o5,	%o1,	%i3
	fble,a	%fcc3,	loop_1825
	bg,a,pn	%xcc,	loop_1826
	andn	%o2,	%o4,	%i7
	fzero	%f0
loop_1825:
	taddcc	%i5,	0x1A86,	%g7
loop_1826:
	nop
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x26,	%i2
	call	loop_1827
	nop
	fitos	%f1,	%f22
	fmovsvc	%icc,	%f17,	%f19
	bn,pt	%xcc,	loop_1828
loop_1827:
	fcmpgt32	%f6,	%f2,	%o6
	tleu	%xcc,	0x1
	or	%l0,	0x1BDD,	%g1
loop_1828:
	brnz,a	%o7,	loop_1829
	tle	%icc,	0x5
	fzeros	%f28
	movre	%l2,	0x222,	%g6
loop_1829:
	alignaddr	%g3,	%o0,	%i0
	mulx	%l5,	0x138B,	%l6
	movgu	%xcc,	%l1,	%i4
	fmovdvs	%xcc,	%f7,	%f24
	sllx	%g5,	%i6,	%i1
	nop
	setx	0x0CC8AB02,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x083F1433,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f12,	%f31
	tpos	%icc,	0x1
	fbne,a	%fcc3,	loop_1830
	sethi	0x114B,	%o3
	tcc	%xcc,	0x5
	array16	%g2,	%l4,	%g4
loop_1830:
	tn	%icc,	0x3
	nop
	setx	0x6BDA73DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x2F42734C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f20,	%f12
	fbg,a	%fcc0,	loop_1831
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l3,	%o5,	%o1
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1831:
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f26
	fxtod	%f26,	%f16
	sdivcc	%i3,	0x1B69,	%o4
	fmovrdlez	%i7,	%f28,	%f10
	sub	%o2,	%g7,	%i5
	movvc	%icc,	%o6,	%l0
	brgz	%g1,	loop_1832
	srl	%i2,	%l2,	%g6
	movrgz	%g3,	0x312,	%o0
	movg	%xcc,	%o7,	%l5
loop_1832:
	fmul8x16	%f27,	%f2,	%f20
	fsrc1s	%f31,	%f28
	orncc	%i0,	0x1238,	%l6
	movle	%xcc,	%l1,	%i4
	tcs	%icc,	0x6
	fbg	%fcc2,	loop_1833
	xnorcc	%g5,	0x1B0A,	%i1
	edge16ln	%i6,	%g2,	%o3
	fmovda	%icc,	%f2,	%f1
loop_1833:
	add	%l4,	%l3,	%g4
	fbuge	%fcc1,	loop_1834
	ldsh	[%l7 + 0x18],	%o1
	orncc	%i3,	0x1BAA,	%o5
	fbn	%fcc1,	loop_1835
loop_1834:
	nop
	setx	0xD0461131,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	set	0x30, %i5
	lduwa	[%l7 + %i5] 0x19,	%i7
loop_1835:
	tg	%icc,	0x2
	popc	%o4,	%o2
	fmovrde	%i5,	%f4,	%f8
	movrgz	%o6,	0x09C,	%g7
	tpos	%xcc,	0x5
	fmovdge	%xcc,	%f31,	%f26
	set	0x34, %l2
	stwa	%l0,	[%l7 + %l2] 0x23
	membar	#Sync
	move	%xcc,	%i2,	%l2
	sdivx	%g6,	0x0A10,	%g3
	movrlz	%o0,	%g1,	%l5
	wr	%g0,	0x89,	%asi
	sta	%f19,	[%l7 + 0x6C] %asi
	fmovdge	%icc,	%f6,	%f9
	ldsw	[%l7 + 0x24],	%i0
	add	%o7,	0x0702,	%l6
	udivcc	%i4,	0x1879,	%l1
	fcmpgt32	%f16,	%f26,	%g5
	sdivcc	%i6,	0x1A32,	%i1
	fbne	%fcc0,	loop_1836
	tsubcc	%g2,	%o3,	%l3
	movneg	%xcc,	%g4,	%l4
	movneg	%xcc,	%o1,	%o5
loop_1836:
	alignaddr	%i3,	%i7,	%o4
	fmovda	%icc,	%f28,	%f30
	addccc	%i5,	0x1EE7,	%o6
	srl	%g7,	0x15,	%l0
	fxors	%f25,	%f12,	%f26
	edge8ln	%o2,	%l2,	%g6
	fnegd	%f2,	%f8
	array32	%g3,	%i2,	%o0
	fpadd16	%f18,	%f26,	%f4
	sllx	%l5,	%g1,	%i0
	mulx	%l6,	%i4,	%l1
	sethi	0x00C5,	%g5
	udivx	%o7,	0x1A96,	%i1
	xnor	%g2,	%i6,	%o3
	or	%g4,	%l4,	%o1
	and	%l3,	0x04B8,	%o5
	fbl	%fcc3,	loop_1837
	movne	%xcc,	%i7,	%i3
	tge	%icc,	0x2
	movn	%xcc,	%o4,	%o6
loop_1837:
	taddcc	%i5,	%g7,	%l0
	tsubcc	%l2,	%o2,	%g3
	edge8l	%g6,	%i2,	%l5
	taddcc	%o0,	%i0,	%g1
	nop
	setx	loop_1838,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduw	[%l7 + 0x30],	%i4
	alignaddrl	%l6,	%g5,	%l1
	nop
	setx	0x9687F5AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xAD211D84,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f18,	%f1
loop_1838:
	alignaddr	%i1,	%g2,	%o7
	tgu	%xcc,	0x2
	be,a,pt	%icc,	loop_1839
	tne	%icc,	0x3
	ldstub	[%l7 + 0x3F],	%o3
	fmul8sux16	%f10,	%f4,	%f24
loop_1839:
	sllx	%g4,	0x16,	%i6
	te	%icc,	0x0
	edge32l	%l4,	%l3,	%o5
	fandnot1s	%f8,	%f20,	%f24
	movleu	%icc,	%o1,	%i7
	tneg	%icc,	0x2
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x26,	%o4
	edge16l	%i3,	%i5,	%o6
	lduh	[%l7 + 0x20],	%l0
	edge32ln	%l2,	%g7,	%g3
	or	%g6,	%i2,	%l5
	fmovscs	%icc,	%f7,	%f18
	fmovdcs	%icc,	%f27,	%f2
	stw	%o0,	[%l7 + 0x50]
	and	%o2,	0x10C2,	%i0
	edge8n	%i4,	%l6,	%g5
	fzeros	%f8
	fbule,a	%fcc3,	loop_1840
	srlx	%g1,	%i1,	%l1
	nop
	setx	0xDB53F2C1398F97D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7E18924B03E80A94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f16,	%f10
	add	%o7,	%o3,	%g2
loop_1840:
	movpos	%xcc,	%i6,	%l4
	tvc	%xcc,	0x6
	alignaddrl	%l3,	%o5,	%g4
	bl,a,pn	%icc,	loop_1841
	stx	%i7,	[%l7 + 0x38]
	nop
	fitos	%f5,	%f13
	fstox	%f13,	%f28
	fxtos	%f28,	%f2
	tle	%icc,	0x6
loop_1841:
	nop
	setx	0x19AB28C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x5FD0DF2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f17,	%f1
	brlez,a	%o4,	loop_1842
	movl	%xcc,	%o1,	%i3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%l0
loop_1842:
	tsubcc	%o6,	0x1956,	%l2
	edge32n	%g7,	%g6,	%g3
	tg	%xcc,	0x6
	movrlez	%l5,	%o0,	%o2
	edge8n	%i0,	%i4,	%i2
	bvs	loop_1843
	edge8ln	%l6,	%g5,	%i1
	sra	%g1,	0x14,	%o7
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x04,	%o3
loop_1843:
	stb	%g2,	[%l7 + 0x74]
	tg	%icc,	0x1
	movgu	%xcc,	%i6,	%l4
	movne	%xcc,	%l1,	%l3
	fblg	%fcc1,	loop_1844
	sub	%g4,	0x0DEB,	%i7
	flush	%l7 + 0x54
	movvs	%xcc,	%o5,	%o1
loop_1844:
	edge8ln	%o4,	%i3,	%i5
	andncc	%l0,	%o6,	%g7
	fmovd	%f8,	%f8
	fornot2s	%f18,	%f10,	%f30
	fandnot1	%f12,	%f20,	%f18
	add	%g6,	0x1A3D,	%l2
	nop
	setx	0xEE3C5D74,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x62EEBA56,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f27,	%f27
	fmovscs	%icc,	%f0,	%f24
	nop
	fitos	%f6,	%f17
	fstox	%f17,	%f18
	fxtos	%f18,	%f11
	movn	%xcc,	%l5,	%o0
	movrlz	%g3,	%o2,	%i4
	fandnot2	%f8,	%f6,	%f30
	and	%i0,	%l6,	%i2
	edge32ln	%g5,	%i1,	%o7
	array8	%o3,	%g1,	%i6
	movrlez	%g2,	%l1,	%l4
	brnz	%l3,	loop_1845
	sir	0x0E97
	addccc	%g4,	%i7,	%o5
	sll	%o1,	%o4,	%i5
loop_1845:
	fnot1	%f16,	%f12
	popc	%i3,	%o6
	edge16	%g7,	%g6,	%l2
	fmul8x16al	%f11,	%f10,	%f2
	set	0x6D, %g7
	ldstuba	[%l7 + %g7] 0x11,	%l5
	edge8n	%o0,	%g3,	%l0
	wr	%g0,	0x04,	%asi
	stxa	%i4,	[%l7 + 0x20] %asi
	ldd	[%l7 + 0x28],	%f20
	sdivcc	%i0,	0x15A5,	%o2
	fsrc2s	%f29,	%f26
	sdiv	%i2,	0x0E3A,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x6E],	%i1
	andcc	%o7,	0x084F,	%o3
	wr	%g0,	0x11,	%asi
	sta	%f12,	[%l7 + 0x20] %asi
	sethi	0x0EC3,	%g1
	xnorcc	%i6,	0x10DF,	%l6
	movrgz	%l1,	%l4,	%g2
	set	0x6D, %i6
	lduba	[%l7 + %i6] 0x11,	%g4
	nop
	setx	0x17EC4ADCF816C55C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f16
	alignaddr	%i7,	%l3,	%o5
	edge8	%o1,	%o4,	%i5
	andn	%o6,	0x01AE,	%i3
	stbar
	sra	%g6,	%g7,	%l5
	array32	%o0,	%g3,	%l0
	andcc	%l2,	0x08F8,	%i4
	move	%icc,	%o2,	%i0
	fmovsneg	%xcc,	%f11,	%f28
	tvs	%xcc,	0x7
	movle	%icc,	%i2,	%i1
	fba	%fcc1,	loop_1846
	fblg,a	%fcc2,	loop_1847
	movvc	%icc,	%o7,	%o3
	fands	%f18,	%f4,	%f7
loop_1846:
	lduh	[%l7 + 0x7C],	%g5
loop_1847:
	srl	%i6,	%l6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_1848, %l0, %l1
	jmpl %l1, %l1
	membar	0x76
	nop
	setx loop_1849, %l0, %l1
	jmpl %l1, %l4
	umul	%g2,	%g4,	%i7
loop_1848:
	edge8l	%o5,	%l3,	%o1
	sir	0x0DC4
loop_1849:
	fbuge,a	%fcc1,	loop_1850
	and	%o4,	%i5,	%i3
	ldd	[%l7 + 0x30],	%f12
	tleu	%icc,	0x5
loop_1850:
	fpack16	%f2,	%f21
	mova	%xcc,	%g6,	%g7
	edge32ln	%l5,	%o0,	%o6
	fmul8sux16	%f24,	%f30,	%f10
	andcc	%l0,	0x11B7,	%l2
	fmovd	%f14,	%f18
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x0c,	 0x3
	alignaddrl	%o2,	%g3,	%i0
	subc	%i2,	0x0C34,	%i1
	prefetch	[%l7 + 0x74],	 0x2
	movg	%icc,	%o7,	%g5
	for	%f8,	%f12,	%f6
	move	%icc,	%o3,	%i6
	fmovsgu	%icc,	%f4,	%f0
	tcs	%icc,	0x1
	array32	%l6,	%g1,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l4,	0x197F,	%g2
	udivx	%i7,	0x0AC2,	%g4
	udiv	%o5,	0x12E3,	%l3
	nop
	setx	0x5724993C849939E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x1BDFD9DFFA653534,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f26,	%f0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	edge32	%i5,	%i3,	%g6
	bpos,a	loop_1851
	alignaddrl	%o1,	%g7,	%o0
	tcc	%icc,	0x3
	bl,a,pt	%icc,	loop_1852
loop_1851:
	sethi	0x0069,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%l2
loop_1852:
	fzero	%f14
	fbu,a	%fcc2,	loop_1853
	tcs	%xcc,	0x0
	fcmpne16	%f26,	%f8,	%o6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%o2
loop_1853:
	array8	%g3,	%i0,	%i2
	umulcc	%i1,	0x1180,	%o7
	edge32l	%g5,	%o3,	%l6
	movleu	%xcc,	%i6,	%l1
	srl	%g1,	%g2,	%l4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%g4
	sir	0x1D72
	fandnot1s	%f19,	%f20,	%f25
	fmovrsgz	%o5,	%f30,	%f22
	ldsb	[%l7 + 0x4D],	%i7
	orcc	%l3,	%o4,	%i3
	orcc	%g6,	0x1DAD,	%i5
	tneg	%icc,	0x6
	movcc	%xcc,	%o1,	%o0
	tvs	%xcc,	0x7
	fcmple32	%f10,	%f6,	%g7
	fbul	%fcc3,	loop_1854
	fzeros	%f7
	andcc	%l5,	%l0,	%o6
	fmovs	%f16,	%f13
loop_1854:
	tg	%icc,	0x7
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f26
	alignaddr	%i4,	%l2,	%o2
	ta	%xcc,	0x5
	edge8l	%g3,	%i0,	%i1
	fcmpne32	%f18,	%f12,	%i2
	or	%o7,	%o3,	%g5
	fnegd	%f20,	%f18
	fmovde	%icc,	%f25,	%f11
	sdivx	%l6,	0x025C,	%l1
	faligndata	%f28,	%f16,	%f30
	call	loop_1855
	orncc	%i6,	0x10E6,	%g2
	sdivcc	%l4,	0x0DFC,	%g1
	fzero	%f10
loop_1855:
	taddcctv	%o5,	%i7,	%g4
	fmovsvc	%xcc,	%f12,	%f8
	bg,pn	%xcc,	loop_1856
	lduw	[%l7 + 0x1C],	%o4
	addcc	%l3,	%i3,	%g6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x66] %asi,	%o1
loop_1856:
	addccc	%i5,	%g7,	%l5
	or	%l0,	0x03AF,	%o0
	fnegd	%f0,	%f12
	movpos	%xcc,	%i4,	%o6
	bge	loop_1857
	nop
	setx	0x7C741A16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f0
	edge8	%l2,	%g3,	%o2
	bpos,a,pn	%icc,	loop_1858
loop_1857:
	bge,a	%xcc,	loop_1859
	array32	%i1,	%i2,	%o7
	ldx	[%l7 + 0x48],	%i0
loop_1858:
	nop
	wr	%g0,	0x89,	%asi
	stha	%g5,	[%l7 + 0x12] %asi
loop_1859:
	movg	%xcc,	%o3,	%l6
	fmovsleu	%icc,	%f5,	%f25
	umul	%l1,	0x12DA,	%g2
	mova	%xcc,	%l4,	%g1
	brgz	%o5,	loop_1860
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%i6
	fmovrdgez	%i7,	%f6,	%f30
	st	%f23,	[%l7 + 0x24]
loop_1860:
	and	%g4,	%o4,	%l3
	udiv	%i3,	0x1350,	%o1
	subc	%i5,	%g6,	%l5
	sdiv	%g7,	0x09ED,	%l0
	fnor	%f14,	%f18,	%f20
	tne	%icc,	0x3
	fsrc1	%f6,	%f16
	stb	%i4,	[%l7 + 0x74]
	movge	%xcc,	%o0,	%o6
	tle	%icc,	0x7
	smulcc	%g3,	%l2,	%o2
	andn	%i2,	%i1,	%i0
	array16	%g5,	%o3,	%l6
	array8	%o7,	%l1,	%g2
	mulx	%g1,	0x0F7E,	%o5
	set	0x08, %i3
	ldstuba	[%l7 + %i3] 0x89,	%i6
	nop
	fitos	%f13,	%f27
	fstox	%f27,	%f28
	fxtos	%f28,	%f2
	fmovdle	%icc,	%f17,	%f11
	fblg	%fcc3,	loop_1861
	addccc	%l4,	0x0C7B,	%i7
	bn,a,pt	%xcc,	loop_1862
	xor	%g4,	%l3,	%i3
loop_1861:
	for	%f4,	%f26,	%f6
	edge8ln	%o4,	%o1,	%g6
loop_1862:
	movn	%xcc,	%i5,	%g7
	nop
	setx	0xDC8E3FD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xC19E9174,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f7,	%f9
	fpsub16	%f10,	%f28,	%f6
	xnorcc	%l5,	%l0,	%i4
	std	%f18,	[%l7 + 0x10]
	sll	%o6,	0x0F,	%g3
	prefetch	[%l7 + 0x70],	 0x0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%l2
	fxor	%f8,	%f12,	%f8
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i2
	umulcc	%i1,	0x07CA,	%i0
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x34] %asi,	%o0
	fpsub32s	%f8,	%f5,	%f17
	tn	%xcc,	0x5
	xorcc	%o3,	%l6,	%g5
	tsubcc	%l1,	%o7,	%g2
	orncc	%o5,	0x0029,	%g1
	fbu	%fcc2,	loop_1863
	ldd	[%l7 + 0x50],	%i6
	xorcc	%i7,	0x1DB2,	%g4
	brgez	%l3,	loop_1864
loop_1863:
	add	%l4,	0x0D75,	%i3
	fxnors	%f26,	%f12,	%f22
	ld	[%l7 + 0x20],	%f28
loop_1864:
	fnands	%f3,	%f18,	%f25
	orcc	%o4,	%o1,	%g6
	subc	%g7,	%l5,	%l0
	movvs	%icc,	%i5,	%i4
	fbg	%fcc0,	loop_1865
	movvs	%icc,	%o6,	%g3
	fandnot2	%f20,	%f14,	%f6
	fnors	%f24,	%f27,	%f31
loop_1865:
	addccc	%l2,	0x1E12,	%i2
	fornot2s	%f14,	%f3,	%f26
	fmovdneg	%icc,	%f3,	%f30
	bpos,pt	%xcc,	loop_1866
	edge8l	%i1,	%o2,	%o0
	edge32ln	%o3,	%i0,	%l6
	fcmpne16	%f2,	%f4,	%l1
loop_1866:
	tpos	%icc,	0x1
	edge16	%g5,	%o7,	%o5
	tvc	%icc,	0x6
	smulcc	%g1,	0x0BCD,	%i6
	bg,pt	%xcc,	loop_1867
	fbu,a	%fcc0,	loop_1868
	edge8n	%g2,	%g4,	%i7
	alignaddr	%l3,	%i3,	%o4
loop_1867:
	array8	%l4,	%g6,	%o1
loop_1868:
	edge8ln	%l5,	%l0,	%g7
	tcs	%icc,	0x3
	movvc	%xcc,	%i5,	%o6
	srl	%i4,	0x00,	%g3
	movrgz	%i2,	0x2EF,	%i1
	tg	%icc,	0x7
	xnorcc	%o2,	0x1913,	%o0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	ldd	[%l7 + 0x70],	%f8
	movge	%xcc,	%o3,	%l2
	fpack16	%f20,	%f24
	popc	%i0,	%l6
	be,a,pt	%icc,	loop_1869
	stbar
	tleu	%icc,	0x2
	tg	%icc,	0x4
loop_1869:
	bneg,a,pt	%xcc,	loop_1870
	fmul8x16	%f21,	%f20,	%f20
	fmovdpos	%icc,	%f17,	%f17
	bl,a	%xcc,	loop_1871
loop_1870:
	fxnors	%f19,	%f0,	%f28
	subc	%l1,	%g5,	%o5
	edge32ln	%g1,	%o7,	%i6
loop_1871:
	sub	%g4,	%i7,	%g2
	alignaddrl	%i3,	%l3,	%o4
	movle	%xcc,	%l4,	%g6
	fmovrslez	%l5,	%f23,	%f22
	set	0x4C, %o5
	stwa	%o1,	[%l7 + %o5] 0x88
	sllx	%g7,	%l0,	%i5
	movpos	%xcc,	%o6,	%g3
	orn	%i4,	%i1,	%i2
	fpadd16s	%f27,	%f29,	%f0
	movvs	%icc,	%o2,	%o3
	membar	0x26
	umul	%l2,	0x005A,	%o0
	fbn,a	%fcc0,	loop_1872
	fbge	%fcc2,	loop_1873
	array16	%l6,	%i0,	%l1
	sra	%g5,	%o5,	%o7
loop_1872:
	nop
	setx	0x005F45F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
loop_1873:
	movn	%xcc,	%i6,	%g1
	nop
	setx	0x73A3CCCCA83E4525,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x3E894F26436B1641,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f12
	alignaddr	%i7,	%g4,	%i3
	andncc	%g2,	%o4,	%l4
	movre	%l3,	%l5,	%o1
	ld	[%l7 + 0x38],	%f23
	bgu	%icc,	loop_1874
	array16	%g6,	%l0,	%i5
	edge32l	%g7,	%o6,	%i4
	fpsub16	%f30,	%f10,	%f20
loop_1874:
	sir	0x1C17
	call	loop_1875
	edge32l	%g3,	%i2,	%o2
	brnz	%i1,	loop_1876
	fandnot2s	%f8,	%f12,	%f7
loop_1875:
	fandnot2s	%f2,	%f14,	%f1
	wr	%g0,	0x80,	%asi
	sta	%f25,	[%l7 + 0x40] %asi
loop_1876:
	fcmpgt16	%f24,	%f6,	%l2
	te	%xcc,	0x3
	edge32n	%o3,	%o0,	%i0
	movrgz	%l6,	%l1,	%o5
	xor	%g5,	%i6,	%g1
	srax	%o7,	0x19,	%i7
	tvs	%icc,	0x3
	movl	%xcc,	%i3,	%g2
	call	loop_1877
	stbar
	tneg	%xcc,	0x4
	addccc	%o4,	%l4,	%l3
loop_1877:
	fpadd16s	%f4,	%f3,	%f9
	edge16l	%g4,	%o1,	%g6
	bvc	loop_1878
	taddcc	%l0,	%l5,	%g7
	ldx	[%l7 + 0x18],	%i5
	fbge,a	%fcc2,	loop_1879
loop_1878:
	sra	%i4,	0x1C,	%o6
	sdivx	%g3,	0x1667,	%o2
	movl	%icc,	%i1,	%i2
loop_1879:
	edge32l	%l2,	%o3,	%o0
	fmovdvc	%xcc,	%f11,	%f7
	ldstub	[%l7 + 0x11],	%l6
	array16	%i0,	%o5,	%g5
	udivcc	%l1,	0x1A74,	%g1
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	array32	%o7,	%i6,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i7,	%g2
	movg	%xcc,	%l4,	%o4
	xorcc	%l3,	%o1,	%g4
	fmovs	%f30,	%f4
	brgez,a	%g6,	loop_1880
	movl	%icc,	%l5,	%l0
	ldstub	[%l7 + 0x43],	%i5
	ble,a,pt	%icc,	loop_1881
loop_1880:
	movre	%i4,	0x09C,	%g7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%g3
loop_1881:
	edge8n	%o2,	%o6,	%i2
	movvs	%xcc,	%l2,	%o3
	fand	%f4,	%f16,	%f14
	membar	0x3E
	andn	%o0,	0x1204,	%l6
	udivcc	%i0,	0x1F79,	%i1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g5
	edge16ln	%l1,	%o5,	%g1
	andcc	%o7,	%i3,	%i6
	fpsub16s	%f17,	%f10,	%f13
	nop
	setx	0x227130F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xF57CE529,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f3,	%f24
	movn	%xcc,	%i7,	%l4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x51] %asi,	%o4
	fnegs	%f9,	%f15
	tle	%xcc,	0x0
	taddcctv	%l3,	0x0A67,	%o1
	edge16l	%g4,	%g6,	%l5
	fzero	%f22
	bgu,a	%xcc,	loop_1882
	fmovsvc	%icc,	%f1,	%f29
	fpsub16s	%f18,	%f22,	%f31
	nop
	setx	0x606DC525,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
loop_1882:
	smul	%l0,	%g2,	%i5
	nop
	setx	0x82B8A02710703F08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	xnorcc	%g7,	%i4,	%g3
	bvc,pn	%icc,	loop_1883
	bl,a	loop_1884
	fmovdg	%icc,	%f16,	%f14
	srl	%o2,	0x15,	%i2
loop_1883:
	movl	%xcc,	%o6,	%o3
loop_1884:
	fzero	%f10
	set	0x48, %o3
	ldswa	[%l7 + %o3] 0x89,	%l2
	xnorcc	%l6,	%i0,	%i1
	fblg,a	%fcc1,	loop_1885
	movvc	%xcc,	%o0,	%l1
	fzeros	%f22
	edge8	%o5,	%g5,	%g1
loop_1885:
	fmul8sux16	%f6,	%f12,	%f14
	fpadd16s	%f30,	%f22,	%f26
	edge16n	%o7,	%i3,	%i6
	movvc	%xcc,	%i7,	%o4
	tgu	%xcc,	0x5
	popc	%l3,	%l4
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x10] %asi,	%o0
	sra	%g6,	0x03,	%l5
	smulcc	%l0,	%g4,	%g2
	fmovde	%icc,	%f8,	%f23
	and	%i5,	0x1B29,	%i4
	tsubcc	%g3,	0x0C88,	%g7
	alignaddrl	%o2,	%i2,	%o6
	movpos	%icc,	%o3,	%l6
	edge16ln	%l2,	%i0,	%i1
	tgu	%xcc,	0x0
	edge16ln	%o0,	%o5,	%l1
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f13
	tn	%icc,	0x1
	subcc	%g5,	0x0659,	%g1
	umulcc	%i3,	0x1A93,	%o7
	nop
	setx	0xF966DB393C2192BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xFC75C131A92199D9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f0,	%f18
	array8	%i6,	%o4,	%i7
	edge8	%l3,	%l4,	%o1
	fbuge,a	%fcc1,	loop_1886
	alignaddr	%g6,	%l0,	%g4
	lduw	[%l7 + 0x34],	%g2
	taddcc	%l5,	0x17A6,	%i4
loop_1886:
	fmovsn	%icc,	%f26,	%f17
	sdiv	%i5,	0x1AB5,	%g7
	brz	%g3,	loop_1887
	prefetch	[%l7 + 0x54],	 0x1
	sir	0x0E0B
	movrne	%o2,	%o6,	%i2
loop_1887:
	nop
	set	0x78, %g1
	ldsw	[%l7 + %g1],	%o3
	fpsub32s	%f14,	%f23,	%f22
	sdiv	%l2,	0x008F,	%l6
	be,pt	%xcc,	loop_1888
	sll	%i1,	%o0,	%o5
	tn	%xcc,	0x7
	ldsb	[%l7 + 0x53],	%i0
loop_1888:
	bne,a	loop_1889
	stx	%g5,	[%l7 + 0x50]
	edge32l	%g1,	%i3,	%l1
	addcc	%i6,	%o7,	%o4
loop_1889:
	movrlz	%l3,	0x3BD,	%i7
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	andcc	%o1,	%g6,	%l4
	nop
	setx	0x33ABC24B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xF6B386DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f14,	%f17
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x66] %asi,	%l0
	array16	%g4,	%g2,	%l5
	bge	%icc,	loop_1890
	ldx	[%l7 + 0x38],	%i5
	movcc	%xcc,	%g7,	%i4
	nop
	setx	0xDDDE13E9904D4DAE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
loop_1890:
	movre	%g3,	%o2,	%i2
	taddcc	%o6,	%l2,	%o3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%i1
	taddcc	%o0,	0x07B7,	%l6
	tvc	%xcc,	0x1
	array8	%o5,	%g5,	%g1
	edge16n	%i3,	%i0,	%l1
	movcc	%xcc,	%o7,	%o4
	movne	%xcc,	%l3,	%i7
	fbe	%fcc3,	loop_1891
	srl	%i6,	0x13,	%g6
	fmovrsgz	%o1,	%f1,	%f0
	srax	%l0,	0x0E,	%g4
loop_1891:
	sllx	%l4,	%l5,	%i5
	movrlez	%g7,	0x1DA,	%i4
	fandnot2s	%f26,	%f19,	%f14
	sethi	0x1FBB,	%g2
	edge8n	%g3,	%i2,	%o2
	fmovscs	%icc,	%f4,	%f16
	fmovsgu	%icc,	%f10,	%f12
	sub	%l2,	0x15FE,	%o6
	wr	%g0,	0x88,	%asi
	sta	%f20,	[%l7 + 0x50] %asi
	movle	%xcc,	%o3,	%i1
	movrgez	%l6,	%o5,	%g5
	ldstub	[%l7 + 0x27],	%o0
	fpack16	%f12,	%f31
	sth	%i3,	[%l7 + 0x40]
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%g0
	alignaddrl	%l1,	%o7,	%o4
	bcc,a	%icc,	loop_1892
	bneg,a	loop_1893
	ldx	[%l7 + 0x50],	%i0
	movg	%icc,	%l3,	%i6
loop_1892:
	bge	%icc,	loop_1894
loop_1893:
	taddcctv	%g6,	%i7,	%l0
	edge8ln	%g4,	%l4,	%o1
	brgz,a	%i5,	loop_1895
loop_1894:
	tleu	%xcc,	0x4
	edge8n	%g7,	%i4,	%l5
	wr	%g0,	0x18,	%asi
	stxa	%g3,	[%l7 + 0x58] %asi
loop_1895:
	subcc	%i2,	%o2,	%l2
	faligndata	%f8,	%f10,	%f16
	xorcc	%o6,	%o3,	%i1
	movn	%icc,	%g2,	%l6
	movleu	%xcc,	%g5,	%o0
	edge8n	%o5,	%i3,	%l1
	fnegd	%f22,	%f22
	orncc	%g1,	0x16CA,	%o7
	udivcc	%o4,	0x0AFD,	%i0
	fbue	%fcc0,	loop_1896
	nop
	fitod	%f10,	%f2
	fdtoi	%f2,	%f24
	fornot1s	%f22,	%f28,	%f10
	movcc	%icc,	%l3,	%g6
loop_1896:
	brgz	%i7,	loop_1897
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f18,	[%l7 + 0x2C]
	fnor	%f28,	%f16,	%f2
loop_1897:
	edge8	%i6,	%g4,	%l4
	fmovdcc	%xcc,	%f13,	%f11
	pdist	%f20,	%f4,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o1,	0x0507,	%l0
	sra	%i5,	%i4,	%l5
	edge32ln	%g3,	%i2,	%o2
	movn	%xcc,	%l2,	%o6
	set	0x3C, %o4
	swapa	[%l7 + %o4] 0x0c,	%g7
	tge	%icc,	0x5
	nop
	setx	0x4A2E3EAC504251F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fbul,a	%fcc1,	loop_1898
	tcs	%xcc,	0x6
	add	%o3,	0x175D,	%g2
	movrgez	%l6,	%i1,	%o0
loop_1898:
	array16	%o5,	%i3,	%g5
	addc	%g1,	%l1,	%o7
	fnors	%f29,	%f23,	%f4
	andcc	%i0,	0x1723,	%l3
	fmul8x16	%f10,	%f28,	%f8
	move	%icc,	%g6,	%o4
	tcc	%xcc,	0x5
	brnz	%i7,	loop_1899
	xor	%g4,	0x1E12,	%l4
	movrlz	%o1,	0x2D0,	%l0
	nop
	setx	0xF0631E41,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
loop_1899:
	fmovrsgz	%i6,	%f25,	%f20
	brgz,a	%i4,	loop_1900
	ba,a,pn	%xcc,	loop_1901
	fblg	%fcc3,	loop_1902
	edge16l	%l5,	%i5,	%i2
loop_1900:
	xnor	%o2,	%g3,	%l2
loop_1901:
	fone	%f4
loop_1902:
	nop
	fitod	%f12,	%f20
	fdtox	%f20,	%f16
	faligndata	%f0,	%f30,	%f8
	edge8n	%o6,	%g7,	%g2
	fbul	%fcc1,	loop_1903
	fmul8sux16	%f14,	%f20,	%f12
	tne	%xcc,	0x3
	and	%o3,	%i1,	%l6
loop_1903:
	brz	%o0,	loop_1904
	movcc	%xcc,	%o5,	%g5
	mova	%icc,	%g1,	%l1
	addc	%o7,	%i3,	%i0
loop_1904:
	ldsw	[%l7 + 0x14],	%l3
	movvs	%icc,	%o4,	%g6
	movrlez	%i7,	%g4,	%o1
	subcc	%l0,	0x1A97,	%i6
	fbg,a	%fcc3,	loop_1905
	nop
	setx	loop_1906,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%l4,	0x149C,	%i4
	fsrc1	%f4,	%f14
loop_1905:
	fbug	%fcc0,	loop_1907
loop_1906:
	sir	0x1E4E
	fbu,a	%fcc3,	loop_1908
	fexpand	%f25,	%f2
loop_1907:
	movcs	%icc,	%i5,	%i2
	movg	%icc,	%l5,	%o2
loop_1908:
	sub	%l2,	%o6,	%g7
	movl	%icc,	%g3,	%o3
	brgz	%g2,	loop_1909
	xnor	%l6,	%i1,	%o0
	ldd	[%l7 + 0x68],	%f2
	movneg	%icc,	%g5,	%o5
loop_1909:
	fblg,a	%fcc0,	loop_1910
	mulx	%l1,	%o7,	%i3
	fcmpgt32	%f16,	%f26,	%i0
	movl	%xcc,	%g1,	%l3
loop_1910:
	movle	%icc,	%g6,	%o4
	fpmerge	%f22,	%f12,	%f30
	bvs,pn	%xcc,	loop_1911
	fmul8x16	%f12,	%f2,	%f2
	nop
	setx	loop_1912,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%icc,	0x1
loop_1911:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f24,	%f2,	%i7
loop_1912:
	array32	%g4,	%o1,	%l0
	fors	%f30,	%f2,	%f2
	fba	%fcc0,	loop_1913
	edge32l	%i6,	%i4,	%i5
	orcc	%l4,	%i2,	%l5
	array32	%o2,	%o6,	%l2
loop_1913:
	edge8n	%g7,	%g3,	%g2
	movpos	%icc,	%o3,	%i1
	edge32ln	%l6,	%g5,	%o0
	mova	%icc,	%l1,	%o5
	nop
	setx	0x107987E76722A70D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3F160670C34DF768,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f16
	xor	%o7,	0x19E9,	%i3
	tvs	%icc,	0x1
	te	%icc,	0x1
	nop
	setx	0x60DBAC4C3CEE91EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f0
	subc	%g1,	%i0,	%l3
	xorcc	%o4,	0x03F6,	%g6
	edge8n	%i7,	%g4,	%o1
	tsubcctv	%i6,	%i4,	%l0
	fcmpne16	%f4,	%f10,	%i5
	tgu	%icc,	0x5
	flush	%l7 + 0x3C
	movre	%i2,	0x383,	%l5
	call	loop_1914
	stw	%o2,	[%l7 + 0x5C]
	set	0x4E, %o0
	ldsba	[%l7 + %o0] 0x04,	%l4
loop_1914:
	nop
	set	0x58, %g3
	swapa	[%l7 + %g3] 0x18,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g7,	%g3,	%g2
	edge32	%o3,	%i1,	%l2
	xor	%l6,	0x090B,	%o0
	fsrc2	%f2,	%f28
	array32	%l1,	%o5,	%g5
	edge8	%i3,	%o7,	%i0
	fmovrdlz	%g1,	%f14,	%f24
	xnor	%l3,	%g6,	%o4
	subcc	%g4,	0x0B7E,	%i7
	ba,a	loop_1915
	movrlz	%i6,	%i4,	%o1
	edge32ln	%l0,	%i5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1915:
	edge16l	%o2,	%l5,	%l4
	movgu	%xcc,	%g7,	%g3
	bpos,a	%xcc,	loop_1916
	array32	%o6,	%g2,	%i1
	umulcc	%l2,	0x06C3,	%o3
	edge16	%l6,	%o0,	%l1
loop_1916:
	movg	%xcc,	%g5,	%i3
	nop
	setx	0x11F5A16A6CE8C18B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC76F60C08B4E0CC6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f28,	%f0
	tpos	%xcc,	0x1
	fmul8sux16	%f6,	%f8,	%f20
	fpsub32s	%f6,	%f12,	%f9
	edge16n	%o7,	%o5,	%i0
	te	%xcc,	0x7
	movcc	%xcc,	%g1,	%l3
	bcc,pt	%xcc,	loop_1917
	smul	%o4,	0x09B6,	%g6
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x28] %asi,	%i7
loop_1917:
	nop
	setx	0xF3343587,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f28
	fmovrdlez	%i6,	%f30,	%f26
	edge32n	%g4,	%o1,	%i4
	fandnot1	%f8,	%f12,	%f4
	ldsh	[%l7 + 0x3E],	%l0
	std	%f12,	[%l7 + 0x18]
	fnors	%f12,	%f0,	%f30
	tleu	%xcc,	0x6
	ta	%icc,	0x6
	smulcc	%i5,	0x197E,	%o2
	ble	%icc,	loop_1918
	stbar
	stbar
	sllx	%l5,	%l4,	%g7
loop_1918:
	sir	0x07DF
	fmovsg	%xcc,	%f7,	%f14
	tl	%icc,	0x0
	movrgez	%g3,	%o6,	%g2
	fbule,a	%fcc0,	loop_1919
	nop
	setx	loop_1920,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%icc,	%i2,	%i1
	fcmpne32	%f20,	%f8,	%l2
loop_1919:
	tgu	%xcc,	0x7
loop_1920:
	fpsub32s	%f14,	%f8,	%f9
	bn,a,pt	%xcc,	loop_1921
	sllx	%l6,	0x13,	%o3
	orn	%o0,	%g5,	%i3
	bg,a,pn	%xcc,	loop_1922
loop_1921:
	edge8l	%l1,	%o7,	%i0
	array32	%g1,	%l3,	%o4
	tcs	%icc,	0x4
loop_1922:
	umulcc	%g6,	%i7,	%o5
	movre	%g4,	0x007,	%i6
	srlx	%i4,	0x16,	%l0
	for	%f2,	%f14,	%f4
	tn	%xcc,	0x3
	ta	%xcc,	0x5
	fnot2s	%f16,	%f4
	fbn	%fcc2,	loop_1923
	st	%f10,	[%l7 + 0x10]
	movgu	%icc,	%i5,	%o1
	fnot2s	%f9,	%f6
loop_1923:
	fmovdge	%icc,	%f10,	%f5
	movrlz	%l5,	0x378,	%o2
	edge32ln	%g7,	%g3,	%o6
	fmovdl	%icc,	%f8,	%f31
	fpack16	%f22,	%f8
	fbuge	%fcc0,	loop_1924
	movge	%icc,	%l4,	%i2
	flush	%l7 + 0x28
	tvc	%xcc,	0x2
loop_1924:
	brlz	%g2,	loop_1925
	orcc	%l2,	0x069B,	%i1
	movgu	%icc,	%o3,	%o0
	ba,a,pt	%xcc,	loop_1926
loop_1925:
	mova	%xcc,	%g5,	%i3
	fbul	%fcc3,	loop_1927
	fbne	%fcc0,	loop_1928
loop_1926:
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f0
	fbug	%fcc1,	loop_1929
loop_1927:
	sethi	0x0665,	%l6
loop_1928:
	umul	%l1,	0x015E,	%o7
	tn	%icc,	0x4
loop_1929:
	edge32l	%i0,	%l3,	%o4
	edge32	%g6,	%g1,	%i7
	array32	%g4,	%o5,	%i6
	fmovdne	%icc,	%f25,	%f22
	bneg	loop_1930
	tsubcctv	%l0,	%i5,	%o1
	sth	%l5,	[%l7 + 0x5A]
	xor	%o2,	0x1172,	%i4
loop_1930:
	std	%f8,	[%l7 + 0x30]
	bvs,pt	%xcc,	loop_1931
	membar	0x01
	mulx	%g3,	%g7,	%o6
	edge32ln	%i2,	%g2,	%l2
loop_1931:
	fbue,a	%fcc0,	loop_1932
	tsubcc	%l4,	0x0770,	%i1
	fmovrse	%o3,	%f11,	%f3
	movpos	%xcc,	%g5,	%o0
loop_1932:
	bvc,a,pn	%xcc,	loop_1933
	alignaddr	%l6,	%i3,	%l1
	sdivcc	%o7,	0x16AE,	%i0
	bg,a	loop_1934
loop_1933:
	bge,a,pn	%icc,	loop_1935
	fmovdvc	%xcc,	%f9,	%f28
	movre	%o4,	%l3,	%g6
loop_1934:
	edge16	%i7,	%g4,	%g1
loop_1935:
	movgu	%icc,	%o5,	%i6
	movcs	%xcc,	%i5,	%o1
	nop
	setx	loop_1936,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%l5,	%l0,	%o2
	popc	0x1E9A,	%g3
	andncc	%g7,	%o6,	%i4
loop_1936:
	fmovrde	%i2,	%f8,	%f4
	nop
	fitod	%f8,	%f18
	fdtoi	%f18,	%f21
	subc	%g2,	0x0661,	%l4
	fbuge,a	%fcc1,	loop_1937
	sdiv	%i1,	0x1A07,	%l2
	movcc	%xcc,	%o3,	%g5
	umul	%o0,	%l6,	%i3
loop_1937:
	edge32n	%l1,	%i0,	%o4
	movrne	%l3,	0x2F0,	%o7
	edge32l	%g6,	%i7,	%g4
	fbu	%fcc2,	loop_1938
	edge16l	%g1,	%i6,	%i5
	andn	%o1,	%o5,	%l5
	edge8ln	%l0,	%o2,	%g7
loop_1938:
	movcs	%icc,	%o6,	%i4
	or	%g3,	0x175D,	%i2
	udiv	%l4,	0x172E,	%g2
	smulcc	%l2,	%i1,	%g5
	fmovspos	%icc,	%f21,	%f21
	movcs	%icc,	%o3,	%l6
	fbo,a	%fcc2,	loop_1939
	fbue,a	%fcc2,	loop_1940
	edge8ln	%o0,	%l1,	%i0
	tvc	%xcc,	0x5
loop_1939:
	fcmple32	%f4,	%f16,	%o4
loop_1940:
	bvc,pn	%xcc,	loop_1941
	brgz,a	%i3,	loop_1942
	sra	%l3,	%o7,	%i7
	stx	%g6,	[%l7 + 0x08]
loop_1941:
	fble	%fcc0,	loop_1943
loop_1942:
	movrgz	%g4,	%i6,	%i5
	movge	%xcc,	%g1,	%o1
	edge32ln	%l5,	%l0,	%o2
loop_1943:
	sdivcc	%o5,	0x0E5F,	%g7
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x16,	%f16
	movrgez	%o6,	%g3,	%i4
	wr	%g0,	0x23,	%asi
	stwa	%l4,	[%l7 + 0x6C] %asi
	membar	#Sync
	movrne	%i2,	%l2,	%i1
	fmovdge	%xcc,	%f8,	%f10
	xorcc	%g5,	0x01AA,	%o3
	edge32ln	%g2,	%l6,	%l1
	fmovsa	%icc,	%f28,	%f0
	fmuld8sux16	%f24,	%f24,	%f28
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x4C] %asi,	%i0
	subcc	%o0,	%i3,	%l3
	fmovrdlz	%o4,	%f2,	%f26
	tn	%icc,	0x6
	set	0x7C, %i1
	lduwa	[%l7 + %i1] 0x89,	%i7
	fbul,a	%fcc1,	loop_1944
	fmul8ulx16	%f26,	%f2,	%f30
	fnors	%f2,	%f7,	%f8
	fone	%f12
loop_1944:
	edge8	%g6,	%o7,	%g4
	movrgz	%i6,	%g1,	%o1
	lduw	[%l7 + 0x38],	%l5
	fblg,a	%fcc1,	loop_1945
	nop
	setx	loop_1946,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack16	%f6,	%f10
	subccc	%l0,	%i5,	%o5
loop_1945:
	tn	%icc,	0x7
loop_1946:
	tl	%xcc,	0x1
	bge	loop_1947
	fors	%f25,	%f1,	%f9
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x74] %asi
loop_1947:
	ta	%xcc,	0x5
	udiv	%o2,	0x1623,	%g7
	fnot1s	%f16,	%f9
	tvs	%icc,	0x6
	bne	loop_1948
	fnot1	%f2,	%f14
	fba,a	%fcc1,	loop_1949
	brlz,a	%g3,	loop_1950
loop_1948:
	movgu	%xcc,	%o6,	%i4
	set	0x3E, %l5
	ldsba	[%l7 + %l5] 0x15,	%i2
loop_1949:
	fmul8x16	%f22,	%f14,	%f26
loop_1950:
	movpos	%xcc,	%l4,	%i1
	fbn,a	%fcc0,	loop_1951
	subcc	%l2,	%g5,	%o3
	fcmple32	%f12,	%f2,	%l6
	nop
	setx	0x73EEBDFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f11
loop_1951:
	tpos	%icc,	0x5
	movleu	%icc,	%l1,	%i0
	movrlez	%o0,	%i3,	%l3
	tvc	%icc,	0x4
	taddcc	%o4,	%i7,	%g6
	bneg,a,pt	%xcc,	loop_1952
	taddcc	%g2,	0x157F,	%g4
	bgu,pn	%xcc,	loop_1953
	edge8	%i6,	%g1,	%o7
loop_1952:
	sth	%l5,	[%l7 + 0x40]
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1953:
	andn	%o1,	%i5,	%l0
	umul	%o5,	0x0923,	%o2
	set	0x30, %i7
	sta	%f17,	[%l7 + %i7] 0x0c
	or	%g3,	0x1B3C,	%g7
	movleu	%icc,	%o6,	%i4
	tvs	%icc,	0x5
	brgz,a	%l4,	loop_1954
	fmovde	%icc,	%f6,	%f22
	popc	0x0A94,	%i2
	tl	%icc,	0x3
loop_1954:
	edge16ln	%l2,	%g5,	%i1
	mulx	%l6,	0x14B2,	%o3
	std	%f2,	[%l7 + 0x50]
	popc	0x117A,	%i0
	stb	%l1,	[%l7 + 0x2E]
	tpos	%xcc,	0x4
	fands	%f16,	%f20,	%f3
	edge16n	%o0,	%i3,	%l3
	tl	%icc,	0x6
	smulcc	%o4,	%i7,	%g6
	udivcc	%g4,	0x07CF,	%i6
	nop
	setx	0x44AF98AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xED3B71DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f25,	%f1
	orcc	%g2,	0x03C5,	%g1
	nop
	setx	0xA9F97EDFEFED2529,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x1CA7D35208A2249B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f0,	%f30
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f30
	set	0x64, %o2
	stwa	%o7,	[%l7 + %o2] 0x2b
	membar	#Sync
	sra	%l5,	%i5,	%l0
	movle	%icc,	%o1,	%o2
	fmovdle	%icc,	%f20,	%f9
	movrlz	%g3,	0x3D1,	%o5
	umulcc	%o6,	%i4,	%l4
	call	loop_1955
	movneg	%xcc,	%i2,	%l2
	tne	%icc,	0x4
	udivx	%g7,	0x19EB,	%i1
loop_1955:
	movcc	%icc,	%l6,	%o3
	array8	%g5,	%l1,	%i0
	movl	%xcc,	%o0,	%i3
	movg	%icc,	%o4,	%i7
	swap	[%l7 + 0x5C],	%l3
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g6
	tsubcctv	%i6,	0x0497,	%g2
	xnorcc	%g1,	%o7,	%l5
	alignaddrl	%i5,	%l0,	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o2,	%g3
	tg	%xcc,	0x0
	membar	0x15
	lduw	[%l7 + 0x0C],	%o5
	bcc,pt	%xcc,	loop_1956
	edge8	%o6,	%o1,	%l4
	tsubcctv	%i4,	0x173E,	%i2
	addccc	%g7,	%l2,	%l6
loop_1956:
	brlz	%o3,	loop_1957
	nop
	fitod	%f8,	%f10
	fdtoi	%f10,	%f10
	fmovda	%icc,	%f3,	%f31
	srl	%i1,	0x09,	%l1
loop_1957:
	edge16ln	%i0,	%g5,	%i3
	movle	%xcc,	%o4,	%i7
	array32	%l3,	%g6,	%o0
	movge	%xcc,	%g2,	%i6
	array8	%o7,	%l5,	%i5
	andncc	%g1,	%g4,	%l0
	fcmpgt16	%f16,	%f6,	%o2
	nop
	setx	0x688138C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f9
	edge16l	%o5,	%g3,	%o6
	mova	%xcc,	%l4,	%o1
	stb	%i2,	[%l7 + 0x3E]
	fmovdl	%xcc,	%f17,	%f7
	and	%g7,	%l2,	%l6
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f6
	tle	%icc,	0x0
	andncc	%o3,	%i1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc1,	loop_1958
	array8	%i0,	%g5,	%i3
	nop
	setx loop_1959, %l0, %l1
	jmpl %l1, %l1
	tvs	%icc,	0x5
loop_1958:
	tle	%xcc,	0x3
	fcmple16	%f22,	%f8,	%o4
loop_1959:
	umul	%i7,	%l3,	%o0
	membar	0x02
	nop
	setx	0xA6B1CA2E1436D9EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x14C1470249DAB21D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f22,	%f20
	andn	%g2,	%g6,	%o7
	mulx	%l5,	%i5,	%g1
	edge16ln	%g4,	%l0,	%i6
	movpos	%xcc,	%o2,	%o5
	bvc,pn	%xcc,	loop_1960
	move	%xcc,	%o6,	%l4
	movcc	%icc,	%g3,	%i2
	movne	%icc,	%o1,	%g7
loop_1960:
	movvc	%icc,	%l6,	%o3
	edge32n	%l2,	%i1,	%i0
	add	%i4,	0x13EF,	%i3
	movleu	%xcc,	%l1,	%o4
	movrlez	%g5,	%l3,	%o0
	brgez	%i7,	loop_1961
	edge8n	%g6,	%o7,	%g2
	fnegd	%f18,	%f26
	brgez	%l5,	loop_1962
loop_1961:
	addc	%g1,	0x165B,	%g4
	movn	%xcc,	%i5,	%i6
	fornot1	%f22,	%f24,	%f12
loop_1962:
	movpos	%icc,	%o2,	%o5
	umul	%l0,	0x1BC9,	%o6
	fmovrdlz	%g3,	%f10,	%f30
	movrlz	%l4,	%i2,	%g7
	nop
	setx	0x805B365E,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	addc	%o1,	%l6,	%o3
	sub	%i1,	0x02A6,	%l2
	nop
	set	0x6C, %o7
	lduh	[%l7 + %o7],	%i0
	fxnor	%f18,	%f2,	%f12
	stb	%i3,	[%l7 + 0x5D]
	sdiv	%l1,	0x18AB,	%o4
	movpos	%xcc,	%g5,	%l3
	set	0x36, %i0
	ldstuba	[%l7 + %i0] 0x89,	%i4
	addccc	%i7,	0x1EC7,	%o0
	lduw	[%l7 + 0x74],	%o7
	tsubcc	%g6,	0x0DF3,	%l5
	fmovrslz	%g2,	%f4,	%f5
	fmovsl	%xcc,	%f6,	%f19
	fmovrslz	%g1,	%f27,	%f22
	tcc	%xcc,	0x2
	fmuld8sux16	%f21,	%f20,	%f30
	addc	%i5,	0x042D,	%g4
	udiv	%o2,	0x0814,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc1,	loop_1963
	popc	0x1A48,	%i6
	tpos	%icc,	0x1
	taddcctv	%o6,	%l0,	%g3
loop_1963:
	tge	%xcc,	0x3
	tneg	%xcc,	0x4
	sub	%i2,	0x11FA,	%l4
	fmovsvs	%icc,	%f4,	%f20
	tvc	%xcc,	0x7
	sdivx	%g7,	0x13EC,	%o1
	movleu	%xcc,	%l6,	%o3
	alignaddrl	%l2,	%i1,	%i0
	taddcctv	%l1,	%o4,	%i3
	and	%g5,	0x0897,	%i4
	movgu	%icc,	%l3,	%i7
	udivcc	%o0,	0x0948,	%g6
	smulcc	%l5,	0x037A,	%o7
	ldsh	[%l7 + 0x60],	%g1
	sdivx	%g2,	0x1B6F,	%g4
	add	%i5,	%o2,	%o5
	bleu,a	%xcc,	loop_1964
	movgu	%icc,	%i6,	%l0
	bvs	%icc,	loop_1965
	subcc	%g3,	%i2,	%l4
loop_1964:
	edge16	%g7,	%o6,	%o1
	xnorcc	%l6,	%o3,	%l2
loop_1965:
	sir	0x0E91
	xor	%i0,	0x0B77,	%l1
	mova	%icc,	%o4,	%i3
	orcc	%g5,	%i1,	%l3
	tcc	%xcc,	0x4
	taddcctv	%i4,	0x0BBC,	%i7
	bpos	loop_1966
	nop
	setx	0xEB84CA38,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f20
	set	0x2C, %i4
	lda	[%l7 + %i4] 0x15,	%f2
loop_1966:
	movge	%xcc,	%o0,	%g6
	membar	0x3D
	edge16n	%l5,	%g1,	%o7
	movneg	%xcc,	%g4,	%g2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o2
	movrgez	%i5,	0x2AD,	%o5
	nop
	setx	0xE04C9BD7,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	sll	%l0,	0x0C,	%i6
	set	0x2E, %l4
	stha	%i2,	[%l7 + %l4] 0x18
	movvs	%xcc,	%l4,	%g7
	fpack32	%f16,	%f4,	%f18
	fone	%f22
	tcc	%xcc,	0x4
	sir	0x0B48
	andn	%g3,	%o6,	%o1
	movrlez	%l6,	0x220,	%l2
	addccc	%o3,	%i0,	%l1
	umul	%i3,	0x0743,	%g5
	bne,a,pt	%xcc,	loop_1967
	fbge,a	%fcc0,	loop_1968
	movre	%o4,	0x018,	%i1
	ldub	[%l7 + 0x31],	%l3
loop_1967:
	nop
	setx	0x43FFF8D6C042ED13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_1968:
	bge	%xcc,	loop_1969
	edge8l	%i7,	%i4,	%g6
	orcc	%o0,	0x0C3A,	%l5
	mulx	%o7,	%g4,	%g1
loop_1969:
	movrlez	%o2,	0x1A0,	%g2
	tsubcctv	%i5,	%l0,	%o5
	tge	%xcc,	0x1
	tne	%icc,	0x6
	fpsub16	%f26,	%f4,	%f30
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movg	%xcc,	%i6,	%i2
	tvc	%icc,	0x7
	tle	%xcc,	0x7
	mulscc	%l4,	%g3,	%o6
	mulx	%o1,	%l6,	%l2
	edge8n	%g7,	%o3,	%l1
	tcs	%icc,	0x1
	tneg	%xcc,	0x1
	tle	%icc,	0x3
	movl	%xcc,	%i3,	%g5
	faligndata	%f20,	%f10,	%f2
	tge	%icc,	0x1
	lduh	[%l7 + 0x72],	%i0
	tl	%icc,	0x0
	fcmpeq32	%f0,	%f26,	%o4
	movn	%icc,	%l3,	%i1
	edge16	%i4,	%g6,	%o0
	fpack16	%f2,	%f12
	movrlez	%l5,	%i7,	%g4
	movvs	%icc,	%g1,	%o2
	edge32l	%g2,	%i5,	%o7
	tvc	%xcc,	0x7
	subccc	%o5,	%i6,	%i2
	xnor	%l0,	%l4,	%g3
	xor	%o1,	%o6,	%l2
	tvc	%icc,	0x3
	wr	%g0,	0xe3,	%asi
	stha	%g7,	[%l7 + 0x22] %asi
	membar	#Sync
	tle	%icc,	0x2
	tgu	%xcc,	0x7
	udivcc	%l6,	0x04C8,	%o3
	lduw	[%l7 + 0x2C],	%i3
	swap	[%l7 + 0x14],	%g5
	movvs	%xcc,	%i0,	%o4
	fbe,a	%fcc2,	loop_1970
	edge32ln	%l1,	%l3,	%i1
	set	0x19, %i5
	stba	%g6,	[%l7 + %i5] 0xea
	membar	#Sync
loop_1970:
	tl	%icc,	0x0
	and	%i4,	0x13B6,	%l5
	movvc	%icc,	%o0,	%i7
	fmovsl	%icc,	%f21,	%f19
	nop
	setx	0x3AB997477046BA2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fbuge,a	%fcc2,	loop_1971
	tsubcc	%g4,	0x090C,	%o2
	srlx	%g1,	%g2,	%i5
	tsubcc	%o7,	%o5,	%i2
loop_1971:
	addcc	%i6,	%l4,	%g3
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%l0
	tle	%xcc,	0x6
	ta	%icc,	0x6
	ldstub	[%l7 + 0x36],	%o6
	nop
	fitos	%f0,	%f4
	fstox	%f4,	%f14
	tge	%xcc,	0x5
	lduh	[%l7 + 0x5E],	%l2
	edge16ln	%o1,	%l6,	%o3
	udivx	%i3,	0x18D2,	%g5
	be,a	loop_1972
	subc	%i0,	0x0E33,	%o4
	tsubcctv	%g7,	0x0ACD,	%l1
	fsrc2	%f18,	%f10
loop_1972:
	fnegd	%f8,	%f0
	and	%i1,	%g6,	%l3
	movg	%xcc,	%l5,	%i4
	orcc	%i7,	0x1357,	%o0
	fcmple32	%f24,	%f6,	%g4
	fmuld8sux16	%f5,	%f22,	%f28
	sra	%g1,	0x11,	%g2
	stx	%o2,	[%l7 + 0x28]
	array8	%i5,	%o7,	%o5
	sdiv	%i6,	0x1BC4,	%i2
	subcc	%g3,	0x14AA,	%l0
	lduw	[%l7 + 0x08],	%l4
	edge8l	%o6,	%o1,	%l2
	tvc	%icc,	0x6
	fbe,a	%fcc0,	loop_1973
	bvs,pn	%icc,	loop_1974
	fbuge	%fcc1,	loop_1975
	sth	%l6,	[%l7 + 0x12]
loop_1973:
	be,a,pt	%icc,	loop_1976
loop_1974:
	fmovrse	%i3,	%f23,	%f15
loop_1975:
	andncc	%g5,	%o3,	%i0
	or	%g7,	%l1,	%i1
loop_1976:
	xnor	%o4,	0x07FB,	%l3
	nop
	setx	loop_1977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x854641461D8C8CC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x905CA8D771437281,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f6,	%f12
	fmovrdne	%g6,	%f24,	%f28
	smul	%l5,	0x0393,	%i4
loop_1977:
	ldsh	[%l7 + 0x3E],	%o0
	fbul	%fcc2,	loop_1978
	sdivcc	%i7,	0x009F,	%g1
	fpsub16	%f8,	%f4,	%f6
	movre	%g2,	0x200,	%g4
loop_1978:
	sdiv	%i5,	0x0FD8,	%o2
	movrlz	%o7,	%i6,	%o5
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%i2
	movne	%xcc,	%g3,	%l0
	movrgz	%l4,	%o1,	%l2
	movleu	%xcc,	%l6,	%o6
	call	loop_1979
	tleu	%xcc,	0x7
	edge16ln	%g5,	%i3,	%o3
	movgu	%xcc,	%g7,	%l1
loop_1979:
	srlx	%i0,	%o4,	%l3
	srlx	%i1,	0x15,	%g6
	mova	%icc,	%i4,	%o0
	fmovrslez	%i7,	%f23,	%f15
	xorcc	%l5,	%g2,	%g4
	movl	%icc,	%g1,	%i5
	orncc	%o7,	%i6,	%o2
	sdiv	%i2,	0x074B,	%g3
	fmovdleu	%xcc,	%f12,	%f27
	orn	%l0,	%o5,	%o1
	nop
	setx	loop_1980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%l2,	0x106,	%l6
	movg	%xcc,	%o6,	%g5
	fbn,a	%fcc2,	loop_1981
loop_1980:
	add	%i3,	%l4,	%o3
	taddcctv	%l1,	0x1876,	%i0
	set	0x28, %l2
	stxa	%g7,	[%l7 + %l2] 0x15
loop_1981:
	movvs	%xcc,	%o4,	%l3
	udivcc	%g6,	0x1AD5,	%i1
	sdivcc	%o0,	0x1B48,	%i4
	edge32ln	%i7,	%l5,	%g4
	edge8	%g2,	%g1,	%o7
	movcs	%icc,	%i5,	%o2
	bge	loop_1982
	fmovrdlz	%i6,	%f24,	%f10
	alignaddrl	%i2,	%l0,	%g3
	sra	%o5,	%l2,	%l6
loop_1982:
	fmovdn	%icc,	%f31,	%f0
	fmovdl	%icc,	%f14,	%f14
	fnot1	%f0,	%f4
	ldsb	[%l7 + 0x7C],	%o6
	fbug,a	%fcc3,	loop_1983
	movrne	%o1,	0x29C,	%g5
	stbar
	fmovsg	%icc,	%f18,	%f6
loop_1983:
	movvs	%icc,	%i3,	%o3
	wr	%g0,	0xeb,	%asi
	stha	%l1,	[%l7 + 0x52] %asi
	membar	#Sync
	fxnor	%f26,	%f4,	%f22
	tgu	%icc,	0x1
	orcc	%i0,	%l4,	%g7
	subccc	%o4,	0x145E,	%l3
	sdiv	%g6,	0x1670,	%o0
	fbl,a	%fcc1,	loop_1984
	tneg	%icc,	0x6
	movrlz	%i1,	%i7,	%i4
	fpmerge	%f6,	%f1,	%f8
loop_1984:
	ta	%icc,	0x2
	nop
	setx loop_1985, %l0, %l1
	jmpl %l1, %g4
	tl	%icc,	0x5
	tl	%icc,	0x5
	tsubcc	%g2,	0x04D1,	%g1
loop_1985:
	bg,a	%xcc,	loop_1986
	or	%o7,	0x1EBB,	%l5
	sub	%i5,	0x1645,	%o2
	brgz,a	%i6,	loop_1987
loop_1986:
	taddcctv	%l0,	0x0B08,	%i2
	tle	%icc,	0x0
	set	0x74, %l1
	sta	%f12,	[%l7 + %l1] 0x19
loop_1987:
	edge16l	%o5,	%g3,	%l6
	srlx	%o6,	%l2,	%g5
	srax	%i3,	0x17,	%o1
	edge16l	%o3,	%i0,	%l4
	xnorcc	%l1,	%g7,	%l3
	ba,a,pn	%xcc,	loop_1988
	sir	0x19D9
	tle	%xcc,	0x1
	movrlez	%o4,	0x0B6,	%g6
loop_1988:
	nop
	setx	0x9F0874C5A00EF8F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xFD0D6A4E28188D5B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f14,	%f18
	movcc	%icc,	%o0,	%i7
	andcc	%i1,	0x16CD,	%g4
	movle	%icc,	%g2,	%g1
	stbar
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrdgz	%i4,	%f0,	%f16
	movvc	%xcc,	%l5,	%i5
	edge32l	%o7,	%o2,	%i6
	tvs	%xcc,	0x5
	fbo	%fcc1,	loop_1989
	fnot2	%f8,	%f18
	srl	%l0,	%i2,	%o5
	bl,a,pn	%icc,	loop_1990
loop_1989:
	fbue,a	%fcc2,	loop_1991
	bne,a,pt	%icc,	loop_1992
	andn	%g3,	%o6,	%l2
loop_1990:
	bg,a,pt	%icc,	loop_1993
loop_1991:
	fsrc2	%f20,	%f18
loop_1992:
	nop
	set	0x48, %l6
	stha	%g5,	[%l7 + %l6] 0x14
loop_1993:
	movl	%xcc,	%i3,	%o1
	umul	%o3,	0x0768,	%i0
	brnz,a	%l6,	loop_1994
	edge32l	%l1,	%g7,	%l3
	movpos	%xcc,	%o4,	%g6
	orncc	%l4,	0x170B,	%i7
loop_1994:
	smul	%o0,	%i1,	%g4
	sub	%g1,	%i4,	%l5
	movre	%g2,	%i5,	%o2
	movrlz	%i6,	%o7,	%l0
	subc	%o5,	0x000C,	%i2
	array32	%o6,	%l2,	%g5
	taddcctv	%i3,	0x133C,	%g3
	movrne	%o1,	%o3,	%l6
	orn	%l1,	0x04AE,	%i0
	fmul8x16au	%f9,	%f25,	%f26
	brz	%l3,	loop_1995
	taddcc	%o4,	0x1307,	%g7
	movl	%icc,	%g6,	%l4
	fand	%f30,	%f24,	%f0
loop_1995:
	fmovd	%f4,	%f22
	move	%xcc,	%o0,	%i1
	fmovrdgez	%g4,	%f20,	%f8
	sll	%g1,	0x06,	%i4
	edge32ln	%i7,	%l5,	%g2
	fmovsg	%xcc,	%f0,	%f5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i5,	%o2
	smul	%o7,	%l0,	%o5
	fmovscc	%icc,	%f25,	%f2
	sll	%i6,	%i2,	%o6
	fandnot2s	%f5,	%f16,	%f13
	fexpand	%f12,	%f22
	sir	0x038E
	taddcctv	%l2,	0x092C,	%i3
	fpsub16s	%f2,	%f25,	%f30
	udivx	%g5,	0x0767,	%g3
	xnorcc	%o1,	%o3,	%l1
	movrgz	%i0,	%l3,	%l6
	tge	%icc,	0x5
	ta	%xcc,	0x1
	tvs	%icc,	0x6
	edge16n	%g7,	%g6,	%l4
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x27,	%o4
	nop
	fitod	%f28,	%f0
	set	0x188, %g4
	nop 	! 	stxa	%i1,	[%g0 + %g4] 0x40 ripped by fixASI40.pl
	tsubcctv	%o0,	%g1,	%g4
	fmovse	%xcc,	%f28,	%f17
	edge8ln	%i7,	%i4,	%l5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i5,	%o2
	subccc	%o7,	%l0,	%o5
	sllx	%i6,	%i2,	%g2
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x19,	 0x3
	smul	%l2,	%g5,	%i3
	orcc	%o1,	0x1247,	%g3
	fmovse	%xcc,	%f1,	%f20
	smulcc	%l1,	%i0,	%o3
	brz,a	%l6,	loop_1996
	udivcc	%l3,	0x1898,	%g7
	tne	%icc,	0x4
	nop
	setx	loop_1997,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1996:
	fnot1s	%f7,	%f17
	xnor	%g6,	0x1042,	%o4
	mulscc	%i1,	0x1C34,	%o0
loop_1997:
	movpos	%icc,	%l4,	%g4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x7C] %asi,	%g1
	ldd	[%l7 + 0x20],	%f10
	sdivx	%i7,	0x1768,	%i4
	edge16l	%i5,	%l5,	%o7
	sdivcc	%l0,	0x0E58,	%o5
	sub	%o2,	%i2,	%i6
	udivcc	%o6,	0x0D38,	%l2
	nop
	fitod	%f8,	%f30
	fdtos	%f30,	%f10
	array32	%g5,	%i3,	%g2
	nop
	setx	loop_1998,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smul	%g3,	%o1,	%l1
	fmovsl	%icc,	%f16,	%f12
	tleu	%icc,	0x2
loop_1998:
	andn	%i0,	0x1581,	%o3
	edge32ln	%l6,	%g7,	%l3
	fpadd16	%f8,	%f4,	%f18
	ldsw	[%l7 + 0x70],	%o4
	andn	%i1,	%o0,	%l4
	fmovrdne	%g4,	%f12,	%f28
	nop
	fitos	%f12,	%f14
	fstod	%f14,	%f2
	tg	%xcc,	0x6
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	andncc	%g6,	%i7,	%i4
	fnor	%f10,	%f30,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i5,	%l5,	%l0
	nop
	setx	0xB70D9DFC5DD8377F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xCF2449EB47365846,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f6,	%f26
	alignaddr	%o7,	%o5,	%o2
	bne,a	%icc,	loop_1999
	fbe	%fcc0,	loop_2000
	ldub	[%l7 + 0x54],	%i6
	andcc	%o6,	%l2,	%i2
loop_1999:
	movcs	%icc,	%i3,	%g5
loop_2000:
	nop
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x88,	%g2
	fcmpne32	%f6,	%f8,	%g2
	movvc	%xcc,	%l1,	%i0
	movgu	%icc,	%o1,	%l6
	bpos	loop_2001
	bvs	%xcc,	loop_2002
	sdivcc	%g7,	0x0A8A,	%o3
	st	%f0,	[%l7 + 0x68]
loop_2001:
	movn	%xcc,	%o4,	%l3
loop_2002:
	tcc	%xcc,	0x3
	fmovrdgz	%i1,	%f0,	%f26
	sll	%o0,	%l4,	%g4
	bvs,a,pt	%icc,	loop_2003
	fcmple32	%f20,	%f26,	%g6
	edge32l	%i7,	%i4,	%i5
	movn	%xcc,	%g1,	%l0
loop_2003:
	edge16	%l5,	%o5,	%o2
	fmovd	%f28,	%f30
	fmovdge	%xcc,	%f10,	%f4
	tne	%icc,	0x7
	movvc	%icc,	%o7,	%o6
	fmovscs	%icc,	%f25,	%f21
	subccc	%l2,	0x06DF,	%i6
	tsubcc	%i2,	%g5,	%g3
	edge32	%i3,	%g2,	%l1
	mova	%icc,	%o1,	%l6
	movcc	%icc,	%i0,	%g7
	be	%xcc,	loop_2004
	srlx	%o4,	0x09,	%o3
	udiv	%l3,	0x15B7,	%i1
	movrgez	%l4,	0x2D1,	%o0
loop_2004:
	andn	%g6,	0x09F5,	%i7
	set	0x58, %g2
	stwa	%i4,	[%l7 + %g2] 0xe2
	membar	#Sync
	popc	0x1927,	%i5
	or	%g1,	0x1B8D,	%g4
	edge8l	%l5,	%o5,	%o2
	orcc	%o7,	0x0CD5,	%o6
	addccc	%l2,	0x1D4A,	%i6
	fornot2	%f0,	%f20,	%f30
	movrgz	%i2,	%g5,	%l0
	movcc	%icc,	%g3,	%g2
	nop
	setx	0x5119F90D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x88423A64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f4,	%f7
	movg	%icc,	%l1,	%o1
	sethi	0x0293,	%i3
	xorcc	%i0,	%g7,	%l6
	fbue,a	%fcc3,	loop_2005
	srl	%o4,	0x06,	%l3
	tneg	%xcc,	0x0
	umul	%o3,	0x062A,	%l4
loop_2005:
	nop
	setx	0x179B82E4C0770F07,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge32n	%o0,	%g6,	%i1
	fmovdge	%icc,	%f1,	%f29
	xor	%i4,	0x10E2,	%i7
	fones	%f14
	ldsw	[%l7 + 0x48],	%i5
	tn	%xcc,	0x4
	nop
	setx	0xC97ECFC3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x685FD5CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f18,	%f4
	sllx	%g4,	%g1,	%l5
	ldsb	[%l7 + 0x7B],	%o2
	stw	%o7,	[%l7 + 0x18]
	addc	%o6,	0x0C78,	%l2
	tge	%icc,	0x5
	tg	%xcc,	0x0
	andcc	%i6,	%i2,	%o5
	edge8ln	%g5,	%g3,	%l0
	edge32ln	%l1,	%g2,	%i3
	brlez,a	%o1,	loop_2006
	mulx	%g7,	0x0F08,	%l6
	sllx	%o4,	0x13,	%l3
	xorcc	%o3,	%l4,	%i0
loop_2006:
	sll	%o0,	0x03,	%i1
	andcc	%g6,	0x02CC,	%i4
	edge8ln	%i7,	%i5,	%g4
	fblg	%fcc3,	loop_2007
	edge16ln	%g1,	%o2,	%l5
	set	0x3B, %i3
	ldsba	[%l7 + %i3] 0x80,	%o6
loop_2007:
	edge8ln	%l2,	%o7,	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x04,	%o5,	%i2
	fcmpeq16	%f28,	%f6,	%g3
	movgu	%icc,	%l0,	%g5
	fmovdpos	%icc,	%f12,	%f12
	sub	%g2,	0x1EEF,	%l1
	and	%o1,	0x0264,	%g7
	nop
	setx	0x2A5A6BCC3775B34F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB4718870B59E377B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f28,	%f22
	fmovrsgz	%l6,	%f23,	%f27
	edge8ln	%i3,	%o4,	%o3
	tvc	%icc,	0x0
	udivcc	%l4,	0x00B4,	%i0
	movn	%xcc,	%l3,	%o0
	subc	%g6,	0x1F4E,	%i4
	edge32	%i1,	%i7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x68] %asi,	%g1
	movn	%icc,	%o2,	%l5
	fornot2	%f12,	%f16,	%f0
	fcmple32	%f30,	%f10,	%g4
	movrgez	%l2,	0x173,	%o6
	fbug,a	%fcc0,	loop_2008
	fmovspos	%xcc,	%f9,	%f14
	array16	%i6,	%o5,	%o7
	movleu	%icc,	%g3,	%l0
loop_2008:
	fble,a	%fcc2,	loop_2009
	nop
	setx	loop_2010,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%i2,	0x1B83,	%g2
	movgu	%icc,	%l1,	%g5
loop_2009:
	addccc	%g7,	%l6,	%i3
loop_2010:
	fors	%f9,	%f17,	%f13
	tvs	%xcc,	0x1
	movne	%icc,	%o4,	%o1
	popc	%o3,	%l4
	bleu,a	loop_2011
	movre	%l3,	0x3FF,	%i0
	stbar
	movg	%xcc,	%o0,	%i4
loop_2011:
	tcc	%xcc,	0x2
	addccc	%i1,	%g6,	%i7
	fnot1s	%f12,	%f19
	fnors	%f12,	%f8,	%f22
	mova	%icc,	%g1,	%o2
	fcmpeq16	%f16,	%f18,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xCEC888EC80570C8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	sdivx	%g4,	0x1A2D,	%i5
	movle	%xcc,	%l2,	%i6
	edge32	%o6,	%o7,	%o5
	addc	%l0,	0x1861,	%i2
	ba,a	%xcc,	loop_2012
	popc	%g3,	%g2
	sllx	%l1,	0x16,	%g5
	te	%icc,	0x5
loop_2012:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x50] %asi,	%g7
	movrlz	%i3,	%o4,	%o1
	addcc	%l6,	0x0747,	%l4
	fzero	%f16
	srax	%o3,	%l3,	%o0
	nop
	setx	loop_2013,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%icc,	%i0,	%i1
	fpadd32s	%f17,	%f22,	%f29
	array32	%i4,	%g6,	%i7
loop_2013:
	sub	%o2,	%g1,	%l5
	taddcc	%g4,	0x0F6F,	%l2
	fble	%fcc2,	loop_2014
	tle	%xcc,	0x5
	tgu	%icc,	0x0
	or	%i5,	%i6,	%o7
loop_2014:
	tpos	%xcc,	0x5
	fmovrsne	%o5,	%f0,	%f7
	tvs	%xcc,	0x6
	fmovrdlz	%o6,	%f16,	%f8
	fmovdvc	%xcc,	%f17,	%f17
	fmovrdne	%l0,	%f14,	%f2
	subccc	%g3,	0x1F50,	%g2
	fornot1s	%f9,	%f1,	%f15
	sra	%l1,	%i2,	%g7
	tneg	%icc,	0x4
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f29
	stx	%i3,	[%l7 + 0x40]
	st	%f15,	[%l7 + 0x60]
	fpadd16	%f16,	%f22,	%f8
	fornot2	%f6,	%f0,	%f4
	array8	%g5,	%o1,	%o4
	edge16n	%l6,	%l4,	%l3
	andncc	%o3,	%o0,	%i0
	lduh	[%l7 + 0x18],	%i1
	sdivcc	%g6,	0x1A62,	%i7
	mulx	%o2,	0x1351,	%i4
	array8	%l5,	%g1,	%g4
	mulscc	%l2,	%i5,	%i6
	andncc	%o5,	%o7,	%l0
	fpack32	%f26,	%f18,	%f16
	movrgz	%g3,	0x0EC,	%g2
	ld	[%l7 + 0x24],	%f9
	stbar
	edge32n	%l1,	%o6,	%i2
	fpack16	%f26,	%f8
	fnot2	%f24,	%f8
	addccc	%g7,	0x0946,	%g5
	fble	%fcc0,	loop_2015
	tg	%icc,	0x5
	movvc	%xcc,	%i3,	%o4
	sub	%o1,	0x1D41,	%l4
loop_2015:
	andn	%l6,	0x1364,	%l3
	tge	%xcc,	0x0
	bg	loop_2016
	tleu	%icc,	0x4
	fmovrslez	%o3,	%f18,	%f16
	smul	%o0,	%i0,	%i1
loop_2016:
	sir	0x0608
	edge16	%g6,	%i7,	%i4
	set	0x1C, %o1
	lda	[%l7 + %o1] 0x19,	%f22
	edge32ln	%l5,	%g1,	%o2
	taddcc	%g4,	%l2,	%i5
	fpadd32	%f26,	%f4,	%f6
	tsubcc	%i6,	0x118C,	%o5
	bge	%xcc,	loop_2017
	tleu	%icc,	0x4
	ble,pt	%icc,	loop_2018
	bpos,a,pn	%xcc,	loop_2019
loop_2017:
	fornot2	%f0,	%f30,	%f22
	addccc	%o7,	%g3,	%l0
loop_2018:
	xnor	%g2,	0x0125,	%l1
loop_2019:
	movre	%o6,	0x1D5,	%i2
	subccc	%g5,	%i3,	%o4
	edge16ln	%o1,	%l4,	%l6
	srl	%g7,	0x18,	%l3
	movneg	%xcc,	%o0,	%i0
	udivcc	%i1,	0x1E66,	%o3
	udivx	%i7,	0x1087,	%i4
	umulcc	%l5,	0x181F,	%g1
	fbul	%fcc1,	loop_2020
	fmovdcs	%icc,	%f18,	%f19
	edge8ln	%o2,	%g4,	%g6
	ldsb	[%l7 + 0x34],	%i5
loop_2020:
	ldub	[%l7 + 0x24],	%i6
	fmul8x16	%f25,	%f4,	%f6
	tsubcctv	%o5,	0x1C7B,	%l2
	add	%o7,	0x1BB4,	%l0
	fbge,a	%fcc3,	loop_2021
	sir	0x0192
	ld	[%l7 + 0x1C],	%f10
	sdiv	%g3,	0x1215,	%l1
loop_2021:
	xorcc	%o6,	0x179F,	%i2
	addcc	%g2,	0x11A3,	%g5
	xnor	%o4,	%i3,	%o1
	tvs	%icc,	0x7
	addcc	%l6,	0x01E0,	%l4
	nop
	setx	0x806FD0EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	sra	%g7,	0x0E,	%l3
	edge32n	%i0,	%o0,	%i1
	edge8ln	%i7,	%o3,	%l5
	wr	%g0,	0x10,	%asi
	stba	%i4,	[%l7 + 0x12] %asi
	fbg,a	%fcc3,	loop_2022
	movvc	%icc,	%g1,	%g4
	fmovda	%icc,	%f20,	%f6
	umulcc	%g6,	0x0E2B,	%o2
loop_2022:
	nop
	wr	%g0,	0xe3,	%asi
	stba	%i6,	[%l7 + 0x15] %asi
	membar	#Sync
	edge32	%o5,	%i5,	%l2
	fsrc2	%f4,	%f4
	fmovrslz	%o7,	%f4,	%f18
	st	%f31,	[%l7 + 0x10]
	edge8	%l0,	%g3,	%l1
	smulcc	%o6,	%i2,	%g2
	add	%o4,	%g5,	%i3
	tsubcc	%o1,	%l4,	%l6
	fandnot2	%f8,	%f22,	%f14
	tvs	%xcc,	0x0
	edge8n	%g7,	%i0,	%l3
	ldd	[%l7 + 0x30],	%f26
	addcc	%i1,	0x03B1,	%i7
	ldd	[%l7 + 0x18],	%o0
	subcc	%o3,	0x0E10,	%l5
	nop
	setx	0x10486B2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	movvc	%icc,	%i4,	%g4
	call	loop_2023
	nop
	fitod	%f14,	%f6
	call	loop_2024
	fmovsge	%xcc,	%f5,	%f11
loop_2023:
	ldstub	[%l7 + 0x4F],	%g6
	fnegd	%f20,	%f0
loop_2024:
	fmovscc	%icc,	%f15,	%f9
	alignaddrl	%g1,	%o2,	%o5
	edge32ln	%i5,	%l2,	%o7
	sdivx	%l0,	0x15B4,	%g3
	fcmpeq16	%f0,	%f24,	%i6
	brlz,a	%o6,	loop_2025
	movle	%xcc,	%i2,	%l1
	tpos	%xcc,	0x7
	nop
	setx	0xBD44609E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xEF7FAEB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f28,	%f3
loop_2025:
	fpadd16s	%f27,	%f12,	%f29
	tvc	%icc,	0x6
	andncc	%g2,	%o4,	%g5
	addccc	%i3,	0x0D89,	%o1
	tn	%icc,	0x4
	taddcctv	%l4,	0x14AA,	%l6
	fmovde	%xcc,	%f11,	%f3
	tgu	%xcc,	0x2
	te	%icc,	0x6
	edge8ln	%i0,	%l3,	%g7
	edge8l	%i1,	%i7,	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x0c,	%l5,	%i4
	te	%icc,	0x3
	movle	%icc,	%o0,	%g6
	sethi	0x179D,	%g1
	sir	0x1089
	movgu	%xcc,	%g4,	%o2
	fmovrdlz	%i5,	%f12,	%f22
	fbug	%fcc1,	loop_2026
	fbue	%fcc1,	loop_2027
	movre	%o5,	0x352,	%o7
	movcs	%xcc,	%l0,	%g3
loop_2026:
	fmovdle	%icc,	%f21,	%f30
loop_2027:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l2
	fmul8sux16	%f22,	%f10,	%f18
	srl	%o6,	%i6,	%l1
	bpos,a,pt	%icc,	loop_2028
	sethi	0x023B,	%i2
	edge8ln	%o4,	%g5,	%g2
	fbne,a	%fcc0,	loop_2029
loop_2028:
	fbug	%fcc1,	loop_2030
	movne	%xcc,	%o1,	%i3
	edge16ln	%l6,	%l4,	%l3
loop_2029:
	ldx	[%l7 + 0x58],	%g7
loop_2030:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%i1,	[%l7 + 0x78] %asi
	udivcc	%i7,	0x05F0,	%o3
	orncc	%l5,	%i0,	%i4
	umul	%g6,	%o0,	%g1
	movpos	%xcc,	%o2,	%g4
	sir	0x0DCD
	taddcctv	%o5,	0x0EE8,	%i5
	movne	%xcc,	%l0,	%o7
	fbl	%fcc3,	loop_2031
	nop
	setx	0x239F874D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xD7F6DDF8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f28,	%f30
	edge32l	%l2,	%g3,	%o6
	ta	%icc,	0x1
loop_2031:
	fbne,a	%fcc1,	loop_2032
	ldd	[%l7 + 0x60],	%i6
	movvs	%icc,	%l1,	%i2
	fbn	%fcc3,	loop_2033
loop_2032:
	movl	%icc,	%g5,	%o4
	edge8l	%g2,	%o1,	%l6
	fornot2	%f6,	%f30,	%f26
loop_2033:
	te	%xcc,	0x1
	tneg	%xcc,	0x1
	fmovsa	%xcc,	%f11,	%f12
	fblg	%fcc3,	loop_2034
	fcmpne16	%f4,	%f8,	%l4
	bneg,a,pn	%xcc,	loop_2035
	nop
	set	0x38, %o6
	stx	%i3,	[%l7 + %o6]
loop_2034:
	fbue,a	%fcc2,	loop_2036
	smul	%l3,	0x1D7A,	%g7
loop_2035:
	movcc	%icc,	%i7,	%o3
	andncc	%i1,	%i0,	%l5
loop_2036:
	tsubcctv	%g6,	%o0,	%g1
	xnorcc	%i4,	0x16FA,	%g4
	mova	%xcc,	%o5,	%i5
	movle	%xcc,	%o2,	%o7
	fbug	%fcc0,	loop_2037
	nop
	fitod	%f4,	%f28
	fdtos	%f28,	%f18
	fmovrsgez	%l0,	%f3,	%f20
	movvc	%xcc,	%g3,	%l2
loop_2037:
	bneg	loop_2038
	mulx	%i6,	%l1,	%i2
	edge32ln	%g5,	%o4,	%o6
	bcc,pn	%icc,	loop_2039
loop_2038:
	nop
	setx	0x748C88F4AFEF945A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF9BE819F3699E122,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f20,	%f0
	andcc	%g2,	%l6,	%o1
	ld	[%l7 + 0x30],	%f18
loop_2039:
	edge16	%i3,	%l3,	%l4
	add	%g7,	0x05BF,	%o3
	mova	%xcc,	%i1,	%i0
	fmovsvc	%icc,	%f11,	%f24
	umul	%i7,	0x1244,	%g6
	fbl	%fcc3,	loop_2040
	brlez	%o0,	loop_2041
	ldx	[%l7 + 0x58],	%g1
	fbe	%fcc2,	loop_2042
loop_2040:
	fmovdleu	%icc,	%f7,	%f14
loop_2041:
	fsrc2	%f16,	%f18
	mulscc	%l5,	0x1E57,	%g4
loop_2042:
	fbue	%fcc3,	loop_2043
	movrlz	%o5,	%i4,	%o2
	taddcc	%i5,	0x1463,	%l0
	movne	%icc,	%g3,	%o7
loop_2043:
	tleu	%xcc,	0x6
	edge16ln	%i6,	%l2,	%l1
	subcc	%i2,	%g5,	%o6
	te	%xcc,	0x6
	fpadd16	%f2,	%f26,	%f8
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x26] %asi,	%g2
	ldsh	[%l7 + 0x62],	%o4
	movl	%icc,	%l6,	%i3
	tne	%xcc,	0x1
	tgu	%icc,	0x6
	sub	%l3,	0x0B35,	%o1
	sll	%l4,	0x18,	%o3
	srax	%i1,	0x17,	%g7
	fzeros	%f7
	movge	%xcc,	%i7,	%g6
	edge16	%i0,	%o0,	%g1
	movvs	%xcc,	%g4,	%l5
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	sub	%i4,	%o2,	%l0
	ba,pt	%xcc,	loop_2044
	movrgez	%i5,	0x396,	%o7
	wr	%g0,	0x0c,	%asi
	stxa	%i6,	[%l7 + 0x28] %asi
loop_2044:
	bgu,a	%xcc,	loop_2045
	fnot1	%f12,	%f20
	mulx	%g3,	%l1,	%l2
	fbul,a	%fcc0,	loop_2046
loop_2045:
	fmovrdne	%g5,	%f8,	%f10
	ldsh	[%l7 + 0x0A],	%o6
	tsubcc	%i2,	0x172B,	%o4
loop_2046:
	be,a,pn	%xcc,	loop_2047
	srlx	%l6,	%g2,	%l3
	taddcctv	%i3,	0x1E11,	%l4
	tvc	%icc,	0x1
loop_2047:
	brlez	%o3,	loop_2048
	subccc	%o1,	0x099E,	%g7
	bgu	loop_2049
	mulx	%i1,	%g6,	%i0
loop_2048:
	fmuld8sux16	%f15,	%f20,	%f28
	fmuld8ulx16	%f15,	%f5,	%f4
loop_2049:
	bneg,a,pn	%icc,	loop_2050
	fbe,a	%fcc0,	loop_2051
	udiv	%o0,	0x0705,	%i7
	popc	0x0935,	%g4
loop_2050:
	tgu	%icc,	0x4
loop_2051:
	edge16l	%g1,	%l5,	%i4
	xnorcc	%o2,	%l0,	%i5
	edge16l	%o5,	%o7,	%i6
	fmuld8sux16	%f3,	%f18,	%f10
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l1
	srax	%g5,	0x1C,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x5
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0x1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l6
	sethi	0x035E,	%g2
	fbue,a	%fcc1,	loop_2052
	udivcc	%l3,	0x0687,	%i3
	fexpand	%f31,	%f18
	tle	%icc,	0x3
loop_2052:
	movvc	%xcc,	%i2,	%l4
	array16	%o3,	%o1,	%i1
	fcmpgt32	%f24,	%f2,	%g6
	tg	%icc,	0x5
	edge32n	%g7,	%i0,	%o0
	movl	%xcc,	%g4,	%i7
	fnot2s	%f18,	%f16
	andn	%g1,	%i4,	%o2
	umul	%l0,	%i5,	%l5
	set	0x60, %g1
	ldstuba	[%l7 + %g1] 0x0c,	%o5
	edge32	%o7,	%i6,	%g3
	set	0x38, %o5
	ldsha	[%l7 + %o5] 0x89,	%l1
	move	%icc,	%g5,	%l2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%l6
	fbule	%fcc3,	loop_2053
	srax	%o4,	%g2,	%i3
	fbge	%fcc0,	loop_2054
	tn	%icc,	0x4
loop_2053:
	array8	%i2,	%l4,	%l3
	movl	%icc,	%o3,	%i1
loop_2054:
	fbul	%fcc2,	loop_2055
	popc	%g6,	%g7
	fbne,a	%fcc2,	loop_2056
	fbl,a	%fcc1,	loop_2057
loop_2055:
	fba,a	%fcc0,	loop_2058
	sdivx	%o1,	0x073B,	%o0
loop_2056:
	mova	%xcc,	%g4,	%i0
loop_2057:
	tge	%icc,	0x6
loop_2058:
	tn	%xcc,	0x7
	subc	%i7,	%g1,	%i4
	ba,a,pt	%xcc,	loop_2059
	fmovdleu	%xcc,	%f9,	%f13
	movcs	%icc,	%l0,	%o2
	fzero	%f20
loop_2059:
	tne	%icc,	0x0
	fxnor	%f20,	%f12,	%f4
	fsrc1	%f24,	%f4
	sethi	0x0611,	%l5
	fmovrdgz	%i5,	%f18,	%f12
	umulcc	%o5,	%i6,	%o7
	ba,pn	%icc,	loop_2060
	tpos	%xcc,	0x6
	alignaddrl	%l1,	%g3,	%l2
	mova	%xcc,	%o6,	%l6
loop_2060:
	move	%xcc,	%g5,	%g2
	move	%icc,	%i3,	%i2
	fmovde	%xcc,	%f24,	%f0
	ba,a,pt	%xcc,	loop_2061
	fmovrsne	%o4,	%f13,	%f17
	fmovsneg	%xcc,	%f18,	%f28
	fsrc1s	%f28,	%f19
loop_2061:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f0,	[%l7 + 0x50] %asi
	addcc	%l4,	0x0A32,	%l3
	popc	%i1,	%g6
	and	%g7,	%o1,	%o0
	fmovrdlez	%g4,	%f26,	%f26
	movcc	%icc,	%i0,	%i7
	nop
	setx	0xC9406B2CAC41B1BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x7A5A7FAD4A069B8C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f26,	%f24
	tpos	%icc,	0x0
	fnegd	%f30,	%f12
	udivx	%o3,	0x09CF,	%i4
	edge32n	%g1,	%o2,	%l0
	sll	%l5,	0x14,	%o5
	smulcc	%i6,	%i5,	%l1
	xnorcc	%g3,	%o7,	%l2
	fone	%f30
	fnors	%f31,	%f18,	%f27
	ta	%icc,	0x1
	fbn	%fcc2,	loop_2062
	fmovdpos	%icc,	%f29,	%f31
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4E] %asi,	%l6
loop_2062:
	tvs	%icc,	0x4
	nop
	fitos	%f7,	%f15
	fstoi	%f15,	%f0
	edge16l	%o6,	%g5,	%i3
	movpos	%xcc,	%g2,	%i2
	bleu,pn	%icc,	loop_2063
	xnor	%o4,	0x1F2A,	%l4
	xnorcc	%i1,	0x1A3E,	%g6
	fbg	%fcc2,	loop_2064
loop_2063:
	movneg	%xcc,	%l3,	%o1
	xnorcc	%o0,	%g7,	%g4
	fsrc1	%f24,	%f30
loop_2064:
	fexpand	%f6,	%f12
	nop
	setx	0x705C9E14,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	nop
	setx	0xFD4D5E57F0621600,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	movrgez	%i7,	%i0,	%i4
	array32	%o3,	%o2,	%l0
	edge16ln	%l5,	%o5,	%g1
	nop
	setx	0x16284EE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xB4118084,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f23,	%f7
	mova	%xcc,	%i6,	%i5
	bcs,a	%xcc,	loop_2065
	udivcc	%g3,	0x0515,	%l1
	tl	%xcc,	0x7
	fandnot2s	%f10,	%f26,	%f30
loop_2065:
	ldsh	[%l7 + 0x5A],	%o7
	fbne,a	%fcc2,	loop_2066
	bne,pn	%icc,	loop_2067
	tn	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x0C] %asi,	%l2
loop_2066:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%o6,	[%l7 + 0x6C] %asi
loop_2067:
	brgz	%g5,	loop_2068
	fsrc1s	%f25,	%f10
	addccc	%i3,	0x00C9,	%l6
	srlx	%g2,	0x12,	%i2
loop_2068:
	fbul	%fcc0,	loop_2069
	or	%l4,	%o4,	%g6
	brlez	%i1,	loop_2070
	sdivx	%o1,	0x10BC,	%l3
loop_2069:
	movrlez	%g7,	0x15C,	%g4
	fmovspos	%icc,	%f10,	%f3
loop_2070:
	srlx	%i7,	0x09,	%i0
	bg,a	%icc,	loop_2071
	fbl	%fcc0,	loop_2072
	mulscc	%i4,	0x1271,	%o3
	nop
	fitod	%f2,	%f6
	fdtos	%f6,	%f11
loop_2071:
	tcs	%icc,	0x7
loop_2072:
	edge8ln	%o0,	%o2,	%l0
	umulcc	%o5,	%l5,	%g1
	sllx	%i5,	%i6,	%l1
	movre	%o7,	0x146,	%l2
	fpack32	%f0,	%f24,	%f6
	edge32ln	%g3,	%o6,	%g5
	edge8n	%l6,	%i3,	%g2
	stbar
	fmovdcc	%icc,	%f17,	%f3
	fbn	%fcc0,	loop_2073
	ble,a,pn	%xcc,	loop_2074
	fblg,a	%fcc0,	loop_2075
	orn	%i2,	%o4,	%l4
loop_2073:
	fbo,a	%fcc3,	loop_2076
loop_2074:
	fmovsle	%icc,	%f10,	%f8
loop_2075:
	bvc	loop_2077
	stw	%g6,	[%l7 + 0x10]
loop_2076:
	movrgez	%o1,	%i1,	%l3
	tleu	%xcc,	0x3
loop_2077:
	edge16n	%g7,	%g4,	%i7
	movle	%icc,	%i0,	%i4
	tn	%xcc,	0x0
	sll	%o3,	%o0,	%o2
	edge8l	%o5,	%l0,	%g1
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x24,	%i4
	edge16	%i6,	%l1,	%o7
	tle	%icc,	0x5
	tvs	%icc,	0x3
	ldx	[%l7 + 0x38],	%l2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x38] %asi,	%f7
	addccc	%g3,	%l5,	%g5
	nop
	setx	0x7D6B7168,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xBFFC139F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f16,	%f27
	orn	%l6,	%o6,	%g2
	swap	[%l7 + 0x4C],	%i2
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0x1
	bcc,a	loop_2078
	movrgez	%l4,	0x19E,	%g6
	orncc	%i3,	0x0802,	%o1
	tpos	%icc,	0x5
loop_2078:
	edge16n	%l3,	%i1,	%g7
	srax	%i7,	0x06,	%g4
	nop
	set	0x43, %g3
	ldstub	[%l7 + %g3],	%i4
	be	loop_2079
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x60],	%i0
	tvs	%icc,	0x3
loop_2079:
	movvc	%xcc,	%o3,	%o2
	tvs	%icc,	0x0
	umulcc	%o0,	0x15DA,	%o5
	edge32	%g1,	%l0,	%i5
	fbg,a	%fcc2,	loop_2080
	prefetch	[%l7 + 0x5C],	 0x1
	array8	%i6,	%o7,	%l1
	movvc	%xcc,	%l2,	%l5
loop_2080:
	brz	%g3,	loop_2081
	movl	%xcc,	%l6,	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x19,	%g5,	%g2
loop_2081:
	bpos,a	loop_2082
	sir	0x023A
	fmovd	%f22,	%f24
	fmovrdgez	%i2,	%f22,	%f26
loop_2082:
	fmovsn	%icc,	%f27,	%f18
	movrne	%l4,	%g6,	%o4
	movcc	%xcc,	%i3,	%o1
	sll	%i1,	0x0B,	%g7
	stx	%l3,	[%l7 + 0x10]
	edge16l	%i7,	%i4,	%g4
	fmovsle	%xcc,	%f13,	%f26
	fmovsleu	%icc,	%f14,	%f4
	fmovscc	%xcc,	%f26,	%f22
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	movpos	%xcc,	%o2,	%o0
	tg	%xcc,	0x3
	movge	%icc,	%i0,	%o5
	udivx	%g1,	0x130F,	%i5
	bne	%icc,	loop_2083
	alignaddr	%i6,	%o7,	%l0
	fbn	%fcc0,	loop_2084
	fmovscs	%icc,	%f8,	%f7
loop_2083:
	lduw	[%l7 + 0x5C],	%l1
	fmovsvc	%xcc,	%f29,	%f30
loop_2084:
	nop
	set	0x0C, %o4
	lda	[%l7 + %o4] 0x19,	%f30
	addccc	%l5,	%g3,	%l2
	fmovdl	%xcc,	%f19,	%f17
	edge16	%o6,	%l6,	%g5
	smul	%i2,	0x194B,	%l4
	fmovsn	%xcc,	%f5,	%f3
	tvs	%icc,	0x1
	subcc	%g2,	%o4,	%g6
	fpadd32	%f22,	%f6,	%f16
	fbge,a	%fcc0,	loop_2085
	sll	%i3,	%o1,	%g7
	sdivcc	%i1,	0x1F5B,	%l3
	fcmpeq32	%f24,	%f2,	%i4
loop_2085:
	fmuld8ulx16	%f21,	%f17,	%f6
	movrgez	%g4,	0x39A,	%i7
	brgez	%o3,	loop_2086
	fpadd32	%f20,	%f6,	%f22
	bge,a,pn	%icc,	loop_2087
	movcc	%icc,	%o0,	%i0
loop_2086:
	fbu	%fcc1,	loop_2088
	addc	%o5,	0x1478,	%g1
loop_2087:
	tg	%icc,	0x7
	sra	%o2,	%i5,	%o7
loop_2088:
	nop
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0x2
	edge32ln	%l0,	%l5,	%l1
	movrlz	%l2,	%g3,	%l6
	popc	%g5,	%i2
	srl	%o6,	0x1C,	%g2
	orncc	%l4,	%g6,	%i3
	umulcc	%o4,	0x140D,	%o1
	orcc	%g7,	%l3,	%i1
	alignaddr	%i4,	%g4,	%i7
	fcmpgt16	%f16,	%f20,	%o0
	tsubcctv	%i0,	%o5,	%g1
	fandnot2	%f26,	%f8,	%f10
	tsubcc	%o3,	0x1CA8,	%i5
	fmovde	%xcc,	%f19,	%f0
	fmovrde	%o2,	%f2,	%f24
	xorcc	%o7,	0x099F,	%i6
	edge8	%l5,	%l1,	%l2
	orn	%g3,	%l6,	%g5
	fbne	%fcc3,	loop_2089
	udivcc	%l0,	0x0B99,	%o6
	edge8	%g2,	%i2,	%g6
	movgu	%xcc,	%i3,	%l4
loop_2089:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%o4
	addc	%g7,	%l3,	%i1
	edge8n	%i4,	%i7,	%g4
	movvc	%icc,	%o0,	%i0
	move	%icc,	%g1,	%o5
	fnegs	%f26,	%f25
	fmovrdne	%i5,	%f14,	%f22
	fpadd16	%f24,	%f22,	%f26
	fpsub32	%f6,	%f22,	%f18
	movl	%icc,	%o3,	%o7
	flush	%l7 + 0x24
	tle	%xcc,	0x0
	alignaddr	%i6,	%l5,	%o2
	tn	%xcc,	0x0
	ldstub	[%l7 + 0x50],	%l2
	fornot1	%f12,	%f22,	%f20
	or	%g3,	%l1,	%l6
	edge8l	%l0,	%g5,	%g2
	edge16ln	%o6,	%i2,	%g6
	tcc	%xcc,	0x2
	move	%icc,	%l4,	%o1
	lduh	[%l7 + 0x78],	%o4
	membar	0x66
	tleu	%xcc,	0x5
	fbue,a	%fcc1,	loop_2090
	taddcctv	%g7,	%i3,	%l3
	fmovsne	%xcc,	%f30,	%f5
	tvc	%xcc,	0x7
loop_2090:
	ta	%xcc,	0x2
	edge8n	%i4,	%i1,	%i7
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x16
	membar	#Sync
	and	%g4,	0x1994,	%o0
	mulscc	%i0,	%o5,	%g1
	edge32l	%i5,	%o3,	%i6
	movg	%icc,	%l5,	%o2
	edge8n	%l2,	%g3,	%o7
	movgu	%icc,	%l6,	%l0
	tleu	%xcc,	0x5
	fbg,a	%fcc1,	loop_2091
	tvs	%icc,	0x5
	fmovdn	%icc,	%f9,	%f29
	tvs	%icc,	0x4
loop_2091:
	tpos	%xcc,	0x5
	nop
	setx	0x25C59B94,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x742E18FF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f23,	%f5
	srax	%l1,	0x18,	%g2
	srl	%o6,	%i2,	%g5
	movrgez	%l4,	%g6,	%o1
	tpos	%xcc,	0x4
	fbul	%fcc1,	loop_2092
	edge8l	%o4,	%g7,	%l3
	movneg	%icc,	%i4,	%i1
	edge8l	%i7,	%i3,	%g4
loop_2092:
	edge32n	%i0,	%o0,	%o5
	fmovsge	%xcc,	%f15,	%f5
	ldub	[%l7 + 0x2B],	%g1
	andncc	%o3,	%i5,	%l5
	fmovde	%icc,	%f12,	%f16
	tg	%icc,	0x5
	sir	0x0B62
	tleu	%xcc,	0x7
	sub	%i6,	0x05FC,	%l2
	xnorcc	%g3,	0x073F,	%o7
	tvc	%icc,	0x2
	nop
	setx	0x43BBF95570433DA8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	ble,a	loop_2093
	movne	%xcc,	%l6,	%l0
	edge32ln	%o2,	%l1,	%g2
	fmul8x16	%f26,	%f6,	%f16
loop_2093:
	nop
	set	0x4A, %l5
	ldsha	[%l7 + %l5] 0x10,	%i2
	tle	%icc,	0x1
	nop
	setx	0x4C5C10AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xEF76E0FE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f4,	%f12
	fnand	%f24,	%f14,	%f16
	mova	%icc,	%o6,	%g5
	fmovdgu	%xcc,	%f20,	%f1
	udiv	%g6,	0x17F7,	%o1
	fone	%f18
	bl,a	%icc,	loop_2094
	bge,a	%icc,	loop_2095
	taddcc	%l4,	%g7,	%l3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
loop_2094:
	xor	%i1,	%i4,	%i3
loop_2095:
	sub	%g4,	%i0,	%i7
	fmovspos	%icc,	%f30,	%f28
	movleu	%icc,	%o0,	%g1
	sethi	0x135F,	%o3
	fmovsl	%xcc,	%f12,	%f22
	addccc	%o5,	%i5,	%i6
	bneg,a,pn	%xcc,	loop_2096
	umulcc	%l5,	0x014E,	%l2
	tvc	%icc,	0x3
	umulcc	%o7,	0x0B70,	%l6
loop_2096:
	fmovsleu	%icc,	%f28,	%f8
	sdiv	%g3,	0x01D3,	%o2
	array32	%l1,	%l0,	%g2
	edge32ln	%i2,	%g5,	%o6
	sir	0x028A
	mulx	%g6,	0x043E,	%o1
	edge8	%g7,	%l3,	%o4
	addcc	%i1,	%i4,	%l4
	move	%xcc,	%g4,	%i3
	ta	%icc,	0x3
	movn	%xcc,	%i7,	%i0
	mulscc	%g1,	0x04B1,	%o3
	movvs	%xcc,	%o5,	%i5
	fbuge	%fcc0,	loop_2097
	nop
	fitos	%f1,	%f7
	tpos	%icc,	0x2
	tn	%icc,	0x1
loop_2097:
	movre	%o0,	0x15B,	%l5
	array32	%i6,	%o7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x3
	wr	%g0,	0x4f,	%asi
	stxa	%l2,	[%g0 + 0x30] %asi
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o2
	sethi	0x09F3,	%l1
	ta	%xcc,	0x5
	ldd	[%l7 + 0x20],	%f30
	bcc,a	loop_2098
	fmovscs	%xcc,	%f2,	%f5
	fmovde	%icc,	%f9,	%f8
	array8	%l0,	%g2,	%i2
loop_2098:
	fmovdl	%icc,	%f31,	%f31
	sethi	0x04ED,	%g3
	xorcc	%g5,	%o6,	%g6
	taddcc	%g7,	%o1,	%o4
	fpackfix	%f0,	%f6
	subc	%l3,	%i1,	%l4
	tcs	%xcc,	0x1
	andncc	%g4,	%i3,	%i4
	fbug,a	%fcc1,	loop_2099
	movrgez	%i7,	0x2F6,	%i0
	subcc	%o3,	0x12FB,	%g1
	fmovrdgz	%o5,	%f12,	%f30
loop_2099:
	movne	%xcc,	%o0,	%l5
	movcc	%icc,	%i5,	%o7
	movne	%icc,	%i6,	%l2
	bvc	loop_2100
	edge8n	%o2,	%l1,	%l0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%g2
loop_2100:
	movvs	%icc,	%l6,	%i2
	sra	%g3,	0x19,	%o6
	lduw	[%l7 + 0x34],	%g6
	edge8l	%g5,	%g7,	%o1
	nop
	fitod	%f23,	%f4
	fmovdle	%icc,	%f20,	%f16
	sethi	0x03FA,	%o4
	movle	%icc,	%l3,	%i1
	nop
	setx	loop_2101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%g4,	%i3
	alignaddr	%i4,	%l4,	%i7
	orn	%i0,	%g1,	%o3
loop_2101:
	nop
	setx	loop_2102,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%o0,	0x05E,	%o5
	call	loop_2103
	sethi	0x0DB3,	%l5
loop_2102:
	fbl	%fcc2,	loop_2104
	orcc	%o7,	%i5,	%l2
loop_2103:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2104:
	edge32ln	%o2,	%i6,	%l0
	fpsub16s	%f22,	%f5,	%f9
	srlx	%l1,	%l6,	%g2
	fmovdle	%xcc,	%f8,	%f27
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x7C] %asi,	%f1
	set	0x48, %i1
	swapa	[%l7 + %i1] 0x10,	%i2
	andcc	%o6,	0x01A7,	%g6
	edge32n	%g5,	%g7,	%g3
	brnz,a	%o1,	loop_2105
	bcc,pt	%icc,	loop_2106
	sdivcc	%l3,	0x1C30,	%o4
	udivx	%g4,	0x0342,	%i1
loop_2105:
	nop
	setx	0x297148F5906C75AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_2106:
	udivx	%i4,	0x0501,	%l4
	nop
	setx	0xD17019DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB8BF4D74,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f11,	%f15
	movgu	%xcc,	%i7,	%i3
	fmul8x16al	%f19,	%f12,	%f14
	fzero	%f26
	tgu	%icc,	0x1
	sdivcc	%i0,	0x0B3C,	%g1
	orcc	%o3,	%o0,	%o5
	movrgez	%l5,	0x18C,	%o7
	addccc	%l2,	%i5,	%i6
	fnot1	%f30,	%f20
	movn	%icc,	%l0,	%l1
	nop
	setx loop_2107, %l0, %l1
	jmpl %l1, %l6
	srlx	%o2,	%i2,	%o6
	subcc	%g2,	%g6,	%g5
	nop
	fitod	%f28,	%f10
loop_2107:
	fpsub32	%f14,	%f6,	%f18
	nop
	setx	0x5A9E53D14982D837,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6A82A4CBE516E45C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f18,	%f14
	set	0x0D, %i7
	ldstuba	[%l7 + %i7] 0x04,	%g7
	prefetch	[%l7 + 0x14],	 0x1
	wr	%g0,	0x11,	%asi
	stba	%o1,	[%l7 + 0x6C] %asi
	movvc	%icc,	%l3,	%g3
	bcs,a,pt	%xcc,	loop_2108
	tne	%xcc,	0x1
	movrne	%o4,	0x350,	%i1
	movrgz	%i4,	0x167,	%l4
loop_2108:
	movpos	%icc,	%g4,	%i3
	std	%f8,	[%l7 + 0x70]
	edge8n	%i0,	%g1,	%i7
	srlx	%o3,	0x0D,	%o5
	xor	%o0,	%o7,	%l2
	sllx	%i5,	%l5,	%i6
	movrlz	%l0,	0x3AF,	%l1
	bne	loop_2109
	fandnot2s	%f0,	%f23,	%f11
	nop
	setx	0xAEF4525700220DE3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f24
	fbl,a	%fcc3,	loop_2110
loop_2109:
	fmovdleu	%xcc,	%f7,	%f13
	movle	%icc,	%l6,	%o2
	or	%o6,	0x0C93,	%g2
loop_2110:
	fmul8x16	%f14,	%f30,	%f16
	fmovrdlez	%i2,	%f30,	%f2
	alignaddrl	%g6,	%g7,	%g5
	tpos	%xcc,	0x2
	fmovrdlez	%l3,	%f4,	%f6
	tn	%xcc,	0x0
	movrgz	%o1,	0x21E,	%g3
	tg	%xcc,	0x5
	movn	%icc,	%i1,	%i4
	set	0x70, %o2
	sta	%f30,	[%l7 + %o2] 0x15
	array32	%o4,	%g4,	%i3
	taddcc	%l4,	0x0AA9,	%i0
	fand	%f24,	%f18,	%f22
	nop
	setx	0x7B291096C8A5D5D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xBA3100EDB14EC018,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f2,	%f12
	fsrc1s	%f8,	%f31
	movpos	%xcc,	%g1,	%i7
	fmul8ulx16	%f16,	%f10,	%f2
	set	0x14, %l0
	stwa	%o5,	[%l7 + %l0] 0x19
	movneg	%xcc,	%o3,	%o7
	subc	%l2,	%o0,	%i5
	fmul8x16al	%f1,	%f3,	%f8
	brlez,a	%l5,	loop_2111
	faligndata	%f4,	%f14,	%f26
	andcc	%i6,	%l1,	%l6
	fmovscc	%icc,	%f15,	%f25
loop_2111:
	udivcc	%o2,	0x1576,	%o6
	move	%icc,	%g2,	%i2
	brnz	%g6,	loop_2112
	orcc	%g7,	%g5,	%l0
	movrlz	%l3,	%g3,	%i1
	fsrc2s	%f0,	%f7
loop_2112:
	fmul8x16	%f5,	%f30,	%f20
	movgu	%xcc,	%o1,	%o4
	bvc	%icc,	loop_2113
	tne	%xcc,	0x7
	alignaddr	%g4,	%i3,	%l4
	fcmple32	%f2,	%f0,	%i0
loop_2113:
	tle	%icc,	0x2
	umulcc	%g1,	0x00ED,	%i4
	fnands	%f22,	%f21,	%f23
	mulx	%o5,	0x0E54,	%i7
	fmovdleu	%xcc,	%f0,	%f15
	srl	%o3,	0x17,	%l2
	fbn,a	%fcc3,	loop_2114
	fba	%fcc3,	loop_2115
	std	%f6,	[%l7 + 0x28]
	brlez	%o0,	loop_2116
loop_2114:
	fmovrslz	%o7,	%f25,	%f26
loop_2115:
	subcc	%i5,	%i6,	%l1
	sdivx	%l5,	0x01BF,	%o2
loop_2116:
	fble,a	%fcc2,	loop_2117
	bpos,a	%xcc,	loop_2118
	bleu,a,pt	%icc,	loop_2119
	andcc	%o6,	0x130A,	%l6
loop_2117:
	tcc	%icc,	0x2
loop_2118:
	sdiv	%i2,	0x195C,	%g6
loop_2119:
	fmovdpos	%xcc,	%f15,	%f20
	fbge,a	%fcc3,	loop_2120
	movrgez	%g2,	0x09C,	%g5
	fnegs	%f28,	%f6
	fornot2	%f0,	%f8,	%f24
loop_2120:
	array8	%g7,	%l0,	%g3
	mulscc	%l3,	0x04A6,	%o1
	fmovdvs	%xcc,	%f25,	%f8
	fornot2	%f6,	%f6,	%f2
	nop
	setx	loop_2121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrse	%o4,	%f17,	%f11
	fbn	%fcc0,	loop_2122
	fcmpeq16	%f12,	%f4,	%g4
loop_2121:
	movcs	%icc,	%i3,	%i1
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f8
loop_2122:
	bneg	loop_2123
	alignaddrl	%i0,	%l4,	%g1
	bleu,a,pt	%xcc,	loop_2124
	fxors	%f12,	%f17,	%f29
loop_2123:
	ldub	[%l7 + 0x1C],	%i4
	edge16	%i7,	%o5,	%o3
loop_2124:
	nop
	setx	0xC5710D22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x645BF145,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f14,	%f19
	fmovrdgz	%l2,	%f30,	%f28
	edge16ln	%o7,	%o0,	%i5
	movge	%xcc,	%l1,	%l5
	fcmpeq32	%f26,	%f4,	%i6
	subccc	%o2,	0x1CAA,	%l6
	udivcc	%i2,	0x04AA,	%g6
	movrgz	%g2,	%g5,	%o6
	fbuge,a	%fcc0,	loop_2125
	edge32n	%g7,	%l0,	%l3
	movrlez	%o1,	%o4,	%g4
	fblg	%fcc2,	loop_2126
loop_2125:
	tneg	%xcc,	0x7
	taddcc	%i3,	0x0661,	%g3
	addcc	%i0,	%l4,	%g1
loop_2126:
	tne	%xcc,	0x0
	smul	%i1,	0x0801,	%i7
	subccc	%i4,	%o3,	%o5
	movrgz	%o7,	0x227,	%o0
	xorcc	%i5,	0x116A,	%l2
	tge	%icc,	0x3
	udiv	%l5,	0x1CFD,	%l1
	popc	0x10CD,	%o2
	sir	0x08CE
	addc	%l6,	0x080D,	%i6
	movl	%xcc,	%g6,	%g2
	fnot2s	%f17,	%f24
	array8	%i2,	%o6,	%g5
	tl	%xcc,	0x7
	prefetch	[%l7 + 0x74],	 0x3
	fbne	%fcc0,	loop_2127
	tcs	%xcc,	0x0
	fmovsge	%icc,	%f0,	%f16
	orn	%g7,	%l0,	%o1
loop_2127:
	movge	%icc,	%l3,	%g4
	orn	%i3,	0x1E65,	%o4
	movrgz	%g3,	0x35F,	%i0
	stx	%g1,	[%l7 + 0x58]
	movvs	%xcc,	%i1,	%l4
	fand	%f26,	%f20,	%f18
	addc	%i4,	%o3,	%i7
	fmovsvs	%xcc,	%f9,	%f17
	edge16ln	%o7,	%o5,	%i5
	edge8	%l2,	%l5,	%l1
	lduw	[%l7 + 0x48],	%o2
	tneg	%icc,	0x1
	tpos	%icc,	0x0
	sdivx	%o0,	0x0804,	%l6
	edge8ln	%i6,	%g6,	%g2
	move	%xcc,	%i2,	%g5
	xnor	%o6,	%l0,	%o1
	subcc	%g7,	%l3,	%g4
	movpos	%icc,	%i3,	%g3
	set	0x46, %o7
	lduha	[%l7 + %o7] 0x19,	%i0
	move	%icc,	%g1,	%i1
	tn	%icc,	0x6
	te	%xcc,	0x6
	tvs	%xcc,	0x0
	fmovsneg	%icc,	%f17,	%f18
	edge32n	%l4,	%i4,	%o4
	alignaddrl	%o3,	%i7,	%o5
	movn	%icc,	%o7,	%l2
	tvc	%icc,	0x1
	edge16n	%i5,	%l5,	%o2
	or	%o0,	0x1D2D,	%l6
	ldsh	[%l7 + 0x18],	%l1
	fbl	%fcc3,	loop_2128
	movgu	%icc,	%i6,	%g2
	be,pt	%xcc,	loop_2129
	sub	%g6,	0x1B6C,	%i2
loop_2128:
	movrne	%g5,	%l0,	%o1
	ld	[%l7 + 0x70],	%f27
loop_2129:
	srlx	%g7,	0x02,	%l3
	movrgez	%o6,	%g4,	%i3
	wr	%g0,	0x19,	%asi
	stxa	%g3,	[%l7 + 0x70] %asi
	ldx	[%l7 + 0x08],	%i0
	movneg	%icc,	%i1,	%g1
	umulcc	%l4,	%o4,	%o3
	nop
	fitos	%f8,	%f1
	fstoi	%f1,	%f20
	fmovsn	%icc,	%f0,	%f26
	bcs,a	%icc,	loop_2130
	tle	%icc,	0x6
	and	%i4,	0x09F4,	%o5
	alignaddr	%o7,	%l2,	%i7
loop_2130:
	fexpand	%f3,	%f6
	bn,a,pn	%xcc,	loop_2131
	tvs	%icc,	0x6
	mulscc	%i5,	%o2,	%o0
	move	%xcc,	%l5,	%l6
loop_2131:
	edge16ln	%i6,	%g2,	%g6
	edge32n	%i2,	%l1,	%l0
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o1
	wr	%g0,	0x89,	%asi
	stxa	%g7,	[%l7 + 0x18] %asi
	fbn,a	%fcc3,	loop_2132
	alignaddrl	%g5,	%o6,	%l3
	fmovdcc	%xcc,	%f27,	%f30
	sdivx	%i3,	0x01F2,	%g3
loop_2132:
	bleu,a,pt	%icc,	loop_2133
	movrlez	%g4,	0x2AC,	%i0
	subcc	%i1,	%l4,	%o4
	bgu,a,pt	%icc,	loop_2134
loop_2133:
	alignaddr	%o3,	%i4,	%g1
	fmovrdgz	%o5,	%f6,	%f14
	udivcc	%l2,	0x0818,	%i7
loop_2134:
	movge	%xcc,	%o7,	%i5
	ld	[%l7 + 0x3C],	%f13
	movrgz	%o0,	0x334,	%o2
	fmovrdgz	%l5,	%f26,	%f26
	tvc	%icc,	0x6
	tl	%xcc,	0x6
	brgez	%i6,	loop_2135
	ta	%icc,	0x5
	fmovse	%icc,	%f31,	%f2
	membar	0x69
loop_2135:
	fmovdcs	%xcc,	%f11,	%f31
	bg,pt	%xcc,	loop_2136
	andn	%g2,	0x0CD0,	%g6
	sdivcc	%i2,	0x079E,	%l6
	tge	%icc,	0x1
loop_2136:
	udiv	%l1,	0x0446,	%o1
	fmovdleu	%xcc,	%f19,	%f11
	edge16	%g7,	%g5,	%o6
	edge16n	%l3,	%l0,	%i3
	sir	0x1481
	ldub	[%l7 + 0x29],	%g3
	edge8ln	%g4,	%i0,	%i1
	sllx	%l4,	%o4,	%o3
	fmovd	%f26,	%f30
	fmovs	%f0,	%f17
	array32	%g1,	%o5,	%l2
	sdivcc	%i4,	0x1237,	%o7
	andcc	%i7,	0x0B29,	%o0
	fsrc2s	%f28,	%f0
	orncc	%o2,	%l5,	%i6
	and	%i5,	%g6,	%i2
	nop
	fitos	%f8,	%f12
	fstoi	%f12,	%f8
	fmovsgu	%icc,	%f7,	%f26
	nop
	setx	0x30B170138048E431,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	wr	%g0,	0x88,	%asi
	stwa	%g2,	[%l7 + 0x24] %asi
	sll	%l6,	0x06,	%o1
	sdiv	%l1,	0x056B,	%g5
	fmovrse	%o6,	%f17,	%f11
	popc	%l3,	%l0
	nop
	setx	0x991D81E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x7EA49CEE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f6,	%f13
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g7
	movgu	%icc,	%g3,	%i3
	xor	%i0,	0x0C20,	%i1
	tleu	%xcc,	0x7
	movcc	%icc,	%g4,	%o4
	movg	%icc,	%o3,	%g1
	andcc	%l4,	0x0248,	%l2
	umulcc	%o5,	0x1CD9,	%i4
	fnot2	%f2,	%f10
	andn	%i7,	%o7,	%o0
	fbul	%fcc3,	loop_2137
	andncc	%l5,	%i6,	%i5
	or	%o2,	0x0248,	%i2
	or	%g2,	0x159A,	%g6
loop_2137:
	fmovs	%f8,	%f6
	fbe,a	%fcc2,	loop_2138
	nop
	set	0x43, %i4
	ldstub	[%l7 + %i4],	%o1
	tsubcc	%l6,	%g5,	%o6
	and	%l3,	%l1,	%g7
loop_2138:
	fbug,a	%fcc0,	loop_2139
	orncc	%l0,	%g3,	%i0
	movn	%xcc,	%i3,	%g4
	fmovdvs	%icc,	%f17,	%f27
loop_2139:
	fmovrdgez	%o4,	%f30,	%f28
	fbule	%fcc2,	loop_2140
	fmovscc	%icc,	%f3,	%f21
	nop
	fitod	%f8,	%f26
	ta	%xcc,	0x4
loop_2140:
	move	%icc,	%i1,	%o3
	stb	%g1,	[%l7 + 0x35]
	edge32	%l2,	%l4,	%o5
	stb	%i4,	[%l7 + 0x52]
	mulx	%o7,	%o0,	%l5
	nop
	setx loop_2141, %l0, %l1
	jmpl %l1, %i7
	sll	%i6,	%o2,	%i2
	subc	%i5,	%g2,	%o1
	sethi	0x09E2,	%l6
loop_2141:
	array32	%g5,	%g6,	%l3
	set	0x14, %l4
	stwa	%l1,	[%l7 + %l4] 0x19
	ble,a	loop_2142
	sethi	0x194C,	%o6
	movre	%g7,	%l0,	%g3
	xnor	%i0,	0x1AB6,	%i3
loop_2142:
	fmovrse	%g4,	%f4,	%f27
	tleu	%xcc,	0x3
	smulcc	%o4,	%i1,	%g1
	srax	%l2,	0x04,	%o3
	xnorcc	%o5,	%l4,	%i4
	smulcc	%o7,	%l5,	%o0
	orncc	%i7,	%o2,	%i2
	srlx	%i6,	0x0C,	%i5
	array32	%g2,	%o1,	%g5
	nop
	setx	0x0E407678677EA3F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f14
	add	%g6,	0x00C3,	%l3
	tcs	%xcc,	0x3
	brlz	%l1,	loop_2143
	tcs	%xcc,	0x3
	tcc	%icc,	0x2
	alignaddr	%o6,	%l6,	%l0
loop_2143:
	alignaddrl	%g7,	%i0,	%i3
	sdivcc	%g4,	0x1B88,	%g3
	te	%icc,	0x2
	swap	[%l7 + 0x54],	%i1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x6C] %asi,	%f23
	fpack16	%f2,	%f19
	sub	%o4,	%g1,	%l2
	nop
	set	0x58, %i0
	ldsw	[%l7 + %i0],	%o5
	tvc	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l4,	%o3
	nop
	fitod	%f2,	%f10
	fdtos	%f10,	%f18
	stw	%i4,	[%l7 + 0x64]
	alignaddr	%o7,	%l5,	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%o0
	movrlz	%i2,	%i5,	%g2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x21] %asi,	%i6
	movle	%icc,	%g5,	%g6
	te	%xcc,	0x5
	sdivcc	%l3,	0x039A,	%l1
	nop
	setx	0x90AC8C0C67D52AB1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0EFEE8DFA75AD482,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f26,	%f28
	fbue,a	%fcc0,	loop_2144
	stw	%o6,	[%l7 + 0x30]
	movne	%xcc,	%l6,	%o1
	tl	%icc,	0x0
loop_2144:
	fcmple16	%f16,	%f12,	%g7
	fxnors	%f21,	%f3,	%f17
	nop
	fitos	%f21,	%f8
	fmul8x16	%f25,	%f12,	%f22
	tvc	%xcc,	0x5
	edge32n	%i0,	%l0,	%i3
	movvs	%icc,	%g3,	%i1
	umulcc	%g4,	0x14B3,	%o4
	sdivcc	%l2,	0x00F8,	%o5
	sethi	0x16EE,	%l4
	addc	%g1,	%i4,	%o7
	movvc	%xcc,	%o3,	%l5
	fmovdg	%icc,	%f4,	%f10
	sdivcc	%o2,	0x1D6A,	%o0
	ba,pn	%icc,	loop_2145
	tvc	%xcc,	0x2
	tcc	%icc,	0x3
	fornot1	%f8,	%f16,	%f24
loop_2145:
	movrgez	%i7,	0x2EC,	%i5
	bg,a,pt	%xcc,	loop_2146
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f2
	set	0x39, %l2
	stba	%g2,	[%l7 + %l2] 0x89
loop_2146:
	xnor	%i2,	%g5,	%g6
	te	%icc,	0x1
	movcs	%icc,	%l3,	%l1
	tcc	%icc,	0x2
	xnor	%o6,	0x1D8A,	%l6
	umulcc	%i6,	0x01D0,	%o1
	prefetch	[%l7 + 0x74],	 0x2
	smul	%i0,	0x1A85,	%g7
	edge32	%i3,	%g3,	%i1
	fbuge,a	%fcc3,	loop_2147
	edge32n	%l0,	%g4,	%o4
	pdist	%f16,	%f30,	%f26
	orncc	%l2,	%o5,	%g1
loop_2147:
	move	%icc,	%i4,	%o7
	tgu	%xcc,	0x0
	and	%o3,	0x0613,	%l5
	movneg	%xcc,	%l4,	%o0
	fsrc1s	%f22,	%f30
	taddcc	%o2,	%i5,	%g2
	movvs	%xcc,	%i7,	%g5
	lduh	[%l7 + 0x58],	%i2
	stbar
	brlz,a	%l3,	loop_2148
	smul	%g6,	0x0319,	%o6
	umul	%l6,	%i6,	%l1
	smul	%o1,	%i0,	%i3
loop_2148:
	sdivx	%g3,	0x153A,	%i1
	udiv	%l0,	0x13A8,	%g4
	edge32ln	%o4,	%g7,	%l2
	nop
	setx	loop_2149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%g1,	%i4,	%o7
	fpmerge	%f6,	%f9,	%f8
	movrlz	%o3,	0x04C,	%o5
loop_2149:
	alignaddr	%l5,	%o0,	%o2
	edge8ln	%i5,	%l4,	%i7
	sdivx	%g2,	0x1D2F,	%g5
	edge16ln	%i2,	%g6,	%l3
	fzero	%f14
	movgu	%icc,	%o6,	%l6
	edge8n	%l1,	%i6,	%o1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5E] %asi,	%i3
	or	%i0,	%g3,	%l0
	tcc	%xcc,	0x3
	tvs	%icc,	0x6
	edge32l	%i1,	%g4,	%o4
	tle	%xcc,	0x1
	lduh	[%l7 + 0x1E],	%l2
	fbue	%fcc2,	loop_2150
	fmovdleu	%xcc,	%f21,	%f16
	or	%g7,	%g1,	%o7
	tpos	%icc,	0x4
loop_2150:
	mulscc	%i4,	0x0654,	%o5
	addcc	%o3,	0x0E66,	%o0
	edge8n	%o2,	%i5,	%l5
	edge8	%l4,	%i7,	%g5
	movcc	%xcc,	%i2,	%g6
	andncc	%l3,	%g2,	%l6
	xnorcc	%l1,	0x037F,	%o6
	fbuge	%fcc2,	loop_2151
	umulcc	%i6,	%o1,	%i3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
loop_2151:
	movne	%icc,	%l0,	%g3
	alignaddr	%g4,	%i1,	%o4
	fabss	%f22,	%f27
	bshuffle	%f4,	%f18,	%f10
	tne	%xcc,	0x3
	movcc	%xcc,	%g7,	%g1
	orn	%l2,	%i4,	%o7
	edge32	%o3,	%o5,	%o0
	smul	%o2,	0x0E90,	%l5
	taddcc	%i5,	%i7,	%g5
	fbue	%fcc1,	loop_2152
	movgu	%xcc,	%l4,	%i2
	alignaddr	%l3,	%g2,	%g6
	bpos,a	%xcc,	loop_2153
loop_2152:
	tneg	%xcc,	0x2
	popc	%l6,	%o6
	fmovrdgz	%i6,	%f14,	%f14
loop_2153:
	movle	%icc,	%l1,	%i3
	bgu	%xcc,	loop_2154
	array16	%o1,	%i0,	%l0
	fbne	%fcc3,	loop_2155
	movvs	%icc,	%g4,	%i1
loop_2154:
	faligndata	%f12,	%f12,	%f28
	set	0x54, %l1
	lda	[%l7 + %l1] 0x04,	%f19
loop_2155:
	fmovsl	%xcc,	%f24,	%f31
	and	%o4,	0x1A4E,	%g3
	movl	%icc,	%g1,	%l2
	tn	%icc,	0x2
	membar	0x59
	ldd	[%l7 + 0x08],	%f18
	sdiv	%g7,	0x17E3,	%i4
	ta	%icc,	0x2
	set	0x62, %i5
	lduha	[%l7 + %i5] 0x0c,	%o7
	and	%o5,	0x0A0E,	%o3
	xnor	%o0,	0x0E19,	%o2
	andn	%i5,	%l5,	%i7
	movvc	%xcc,	%g5,	%l4
	sdivx	%l3,	0x0C6A,	%g2
	fmovdneg	%icc,	%f23,	%f19
	sdivcc	%i2,	0x0190,	%l6
	xor	%o6,	0x084F,	%i6
	edge32l	%l1,	%i3,	%g6
	alignaddrl	%i0,	%o1,	%l0
	xnor	%g4,	%o4,	%g3
	fbuge,a	%fcc1,	loop_2156
	fmovdpos	%icc,	%f23,	%f3
	fxor	%f18,	%f24,	%f18
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%g0
loop_2156:
	andncc	%i1,	%g7,	%l2
	bleu,a	%icc,	loop_2157
	move	%xcc,	%o7,	%o5
	edge8l	%o3,	%o0,	%o2
	nop
	setx	0xD64049A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x88C789C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f22,	%f27
loop_2157:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc2,	loop_2158
	movcs	%icc,	%i4,	%l5
	fand	%f28,	%f6,	%f18
	bneg,pn	%icc,	loop_2159
loop_2158:
	movpos	%icc,	%i5,	%g5
	xnor	%l4,	%i7,	%g2
	sdivx	%l3,	0x0CD7,	%i2
loop_2159:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x34] %asi,	%l6
	edge8l	%o6,	%l1,	%i6
	fmovrdne	%g6,	%f10,	%f12
	udiv	%i3,	0x038E,	%o1
	array16	%l0,	%g4,	%o4
	mova	%icc,	%i0,	%g1
	fnot2	%f18,	%f2
	xnorcc	%i1,	%g3,	%l2
	movre	%g7,	%o5,	%o3
	popc	0x00B8,	%o7
	tvs	%xcc,	0x3
	bneg,pt	%xcc,	loop_2160
	and	%o2,	0x071A,	%i4
	sethi	0x0BA3,	%o0
	tvs	%icc,	0x3
loop_2160:
	taddcc	%i5,	%g5,	%l4
	tneg	%xcc,	0x3
	nop
	setx	loop_2161,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x34
	fnands	%f9,	%f5,	%f4
	bvs,a,pt	%icc,	loop_2162
loop_2161:
	subcc	%i7,	0x0E65,	%g2
	bvc,a	loop_2163
	fnot1	%f2,	%f14
loop_2162:
	ldsh	[%l7 + 0x2C],	%l3
	bge,pt	%icc,	loop_2164
loop_2163:
	movcc	%xcc,	%l5,	%l6
	movcc	%xcc,	%i2,	%o6
	tsubcc	%l1,	%i6,	%i3
loop_2164:
	bl	%xcc,	loop_2165
	andncc	%o1,	%l0,	%g4
	subcc	%o4,	%g6,	%g1
	movge	%icc,	%i1,	%g3
loop_2165:
	nop
	fitos	%f5,	%f7
	fstox	%f7,	%f6
	fxtos	%f6,	%f26
	movrlz	%l2,	0x35A,	%i0
	st	%f22,	[%l7 + 0x34]
	andn	%o5,	0x0AED,	%g7
	tsubcctv	%o7,	0x189E,	%o3
	nop
	setx	0x699D5252,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x3CD0C928,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f29,	%f22
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i4,	%o2
	set	0x24, %g7
	lduwa	[%l7 + %g7] 0x81,	%o0
	tsubcctv	%i5,	0x1B28,	%l4
	orncc	%i7,	0x02DB,	%g2
	fnot2	%f30,	%f10
	alignaddrl	%g5,	%l5,	%l6
	fba,a	%fcc2,	loop_2166
	fsrc2s	%f0,	%f23
	addc	%l3,	%o6,	%i2
	fbg,a	%fcc0,	loop_2167
loop_2166:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l1,	%i6
	movg	%xcc,	%i3,	%l0
loop_2167:
	movcs	%icc,	%o1,	%g4
	orncc	%o4,	%g1,	%g6
	std	%f28,	[%l7 + 0x38]
	tle	%icc,	0x2
	fbuge	%fcc3,	loop_2168
	smul	%i1,	%g3,	%l2
	sdivcc	%o5,	0x0A45,	%i0
	alignaddrl	%g7,	%o3,	%i4
loop_2168:
	andcc	%o7,	0x146A,	%o2
	tsubcctv	%i5,	0x1FC1,	%l4
	taddcc	%i7,	%g2,	%g5
	tsubcc	%o0,	%l5,	%l6
	fxnor	%f0,	%f16,	%f4
	array8	%o6,	%i2,	%l1
	tleu	%xcc,	0x6
	fmovse	%icc,	%f26,	%f27
	brnz,a	%l3,	loop_2169
	tneg	%icc,	0x0
	stbar
	edge8	%i6,	%l0,	%o1
loop_2169:
	fmovsne	%icc,	%f21,	%f29
	brnz,a	%i3,	loop_2170
	addc	%o4,	0x03B3,	%g1
	nop
	fitos	%f14,	%f20
	fstod	%f20,	%f20
	orn	%g4,	0x0C1D,	%g6
loop_2170:
	umul	%g3,	0x1F05,	%l2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	bneg,a	loop_2171
	membar	0x00
	nop
	setx	loop_2172,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%xcc,	0x0
loop_2171:
	mulx	%i1,	%g7,	%o3
	orn	%i4,	0x15E7,	%o7
loop_2172:
	fcmpne16	%f2,	%f6,	%o2
	stbar
	set	0x54, %g4
	stwa	%i5,	[%l7 + %g4] 0x19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l4,	%i0,	%g2
	tle	%xcc,	0x4
	fpmerge	%f10,	%f25,	%f28
	orncc	%i7,	%g5,	%l5
	ldx	[%l7 + 0x38],	%l6
	edge16	%o0,	%i2,	%o6
	bgu	loop_2173
	fbule	%fcc1,	loop_2174
	xor	%l1,	0x0361,	%i6
	fsrc1	%f30,	%f4
loop_2173:
	fnands	%f18,	%f13,	%f2
loop_2174:
	move	%icc,	%l3,	%o1
	edge16	%l0,	%o4,	%i3
	fnegs	%f30,	%f14
	andncc	%g1,	%g6,	%g4
	fpsub32s	%f7,	%f19,	%f20
	fmul8sux16	%f26,	%f12,	%f16
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%g3
	addccc	%o5,	0x1592,	%i1
	edge8ln	%g7,	%o3,	%l2
	nop
	setx loop_2175, %l0, %l1
	jmpl %l1, %o7
	tvc	%xcc,	0x4
	edge8l	%o2,	%i5,	%i4
	srax	%l4,	%g2,	%i7
loop_2175:
	udivcc	%g5,	0x008C,	%l5
	sdivx	%i0,	0x0096,	%o0
	taddcc	%l6,	0x0CE6,	%i2
	array16	%l1,	%o6,	%l3
	edge16n	%o1,	%i6,	%o4
	fmovdn	%icc,	%f7,	%f4
	fxnor	%f0,	%f0,	%f8
	bcc,a	loop_2176
	nop
	setx	loop_2177,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgz	%l0,	loop_2178
	fbl,a	%fcc1,	loop_2179
loop_2176:
	sll	%i3,	0x11,	%g6
loop_2177:
	fmovdleu	%xcc,	%f14,	%f30
loop_2178:
	brnz,a	%g1,	loop_2180
loop_2179:
	sethi	0x1C61,	%g3
	edge16l	%o5,	%g4,	%i1
	fmovdcs	%icc,	%f17,	%f23
loop_2180:
	fxor	%f18,	%f22,	%f14
	movpos	%xcc,	%o3,	%l2
	nop
	setx	0x1062FB81,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	ldd	[%l7 + 0x28],	%f6
	nop
	setx	0x60581D0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	fandnot2s	%f22,	%f8,	%f12
	tneg	%xcc,	0x1
	udiv	%g7,	0x015A,	%o2
	edge32	%o7,	%i4,	%l4
	bvs,a,pt	%xcc,	loop_2181
	tsubcc	%i5,	0x1FEF,	%i7
	umulcc	%g2,	%g5,	%i0
	movrlez	%l5,	%l6,	%o0
loop_2181:
	add	%i2,	0x1C60,	%o6
	sth	%l3,	[%l7 + 0x34]
	fble,a	%fcc1,	loop_2182
	bvc,a,pn	%xcc,	loop_2183
	fbu	%fcc3,	loop_2184
	movne	%icc,	%o1,	%l1
loop_2182:
	addccc	%o4,	%i6,	%i3
loop_2183:
	array8	%g6,	%g1,	%g3
loop_2184:
	fmovrde	%l0,	%f20,	%f8
	srlx	%g4,	%i1,	%o5
	ta	%xcc,	0x2
	move	%xcc,	%l2,	%g7
	set	0x2C, %i6
	stwa	%o3,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	setx	0xEB22928080614363,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovrdgez	%o2,	%f6,	%f4
	fba	%fcc0,	loop_2185
	sethi	0x15D6,	%i4
	movn	%xcc,	%o7,	%l4
	fbl	%fcc0,	loop_2186
loop_2185:
	addccc	%i5,	0x0F7B,	%i7
	fbuge,a	%fcc1,	loop_2187
	mova	%xcc,	%g2,	%i0
loop_2186:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2187:
	movre	%g5,	0x090,	%l6
	ldx	[%l7 + 0x18],	%l5
	smulcc	%i2,	0x05F5,	%o0
	fmovdge	%icc,	%f23,	%f2
	fandnot2s	%f7,	%f17,	%f30
	fnands	%f8,	%f4,	%f27
	fbe	%fcc0,	loop_2188
	orncc	%o6,	0x0E86,	%l3
	edge16n	%l1,	%o1,	%o4
	fmovd	%f2,	%f22
loop_2188:
	array16	%i6,	%i3,	%g6
	fmuld8ulx16	%f25,	%f21,	%f0
	fbe	%fcc1,	loop_2189
	tneg	%icc,	0x1
	mulscc	%g3,	%l0,	%g4
	fmovdgu	%xcc,	%f12,	%f31
loop_2189:
	nop
	wr	%g0,	0x88,	%asi
	stba	%i1,	[%l7 + 0x45] %asi
	sdivx	%g1,	0x1DEF,	%l2
	movcs	%icc,	%g7,	%o3
	movn	%icc,	%o2,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o5,	0x15D8,	%o7
	brlez	%l4,	loop_2190
	movgu	%icc,	%i7,	%g2
	mulscc	%i0,	0x10D5,	%i5
	fmovdpos	%icc,	%f22,	%f10
loop_2190:
	fabss	%f9,	%f24
	movleu	%xcc,	%g5,	%l5
	alignaddrl	%l6,	%i2,	%o0
	mova	%xcc,	%l3,	%l1
	edge16ln	%o6,	%o4,	%o1
	fmovrsgz	%i6,	%f12,	%f17
	lduh	[%l7 + 0x4A],	%i3
	srlx	%g3,	0x1F,	%g6
	tn	%xcc,	0x4
	fandnot2	%f22,	%f12,	%f4
	edge16ln	%l0,	%i1,	%g4
	fblg	%fcc1,	loop_2191
	fmovsle	%xcc,	%f19,	%f13
	addc	%g1,	0x1BB8,	%l2
	edge8	%o3,	%o2,	%g7
loop_2191:
	srl	%i4,	%o7,	%o5
	ta	%xcc,	0x3
	edge8ln	%i7,	%l4,	%i0
	set	0x1C, %g2
	ldswa	[%l7 + %g2] 0x19,	%g2
	sub	%i5,	0x1FB8,	%g5
	xorcc	%l5,	%i2,	%l6
	fcmpeq16	%f12,	%f26,	%l3
	flush	%l7 + 0x48
	fbuge	%fcc3,	loop_2192
	movcs	%xcc,	%l1,	%o6
	edge8ln	%o0,	%o4,	%i6
	lduw	[%l7 + 0x44],	%o1
loop_2192:
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f1
	tvs	%icc,	0x4
	addcc	%g3,	%g6,	%i3
	alignaddr	%i1,	%g4,	%g1
	sllx	%l2,	%o3,	%l0
	srlx	%g7,	0x1B,	%o2
	nop
	setx	0xFB4FCDC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f14
	movge	%xcc,	%i4,	%o5
	alignaddr	%o7,	%i7,	%i0
	sth	%l4,	[%l7 + 0x12]
	edge16n	%g2,	%g5,	%i5
	edge8	%l5,	%l6,	%l3
	udivcc	%l1,	0x020A,	%i2
	movle	%xcc,	%o6,	%o0
	tvc	%icc,	0x0
	nop
	set	0x10, %g6
	std	%f28,	[%l7 + %g6]
	subc	%i6,	0x124A,	%o4
	edge32n	%o1,	%g3,	%i3
	ldstub	[%l7 + 0x7C],	%g6
	array8	%g4,	%i1,	%l2
	nop
	setx	0x121796E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xDC4BC10B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f19,	%f8
	swap	[%l7 + 0x74],	%g1
	fmovspos	%xcc,	%f16,	%f24
	tn	%xcc,	0x4
	movne	%icc,	%l0,	%o3
	fnot1s	%f5,	%f22
	orncc	%o2,	%i4,	%g7
	tne	%icc,	0x7
	fbue	%fcc1,	loop_2193
	tvs	%icc,	0x3
	sir	0x07A8
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f12
	fxtod	%f12,	%f14
loop_2193:
	bleu	loop_2194
	array32	%o7,	%o5,	%i0
	fpsub32s	%f26,	%f14,	%f20
	xnor	%i7,	%l4,	%g5
loop_2194:
	udivx	%g2,	0x0988,	%l5
	bvs,a	%icc,	loop_2195
	fcmple16	%f4,	%f12,	%i5
	fba,a	%fcc1,	loop_2196
	taddcctv	%l6,	%l3,	%i2
loop_2195:
	fbuge,a	%fcc1,	loop_2197
	srax	%l1,	0x17,	%o0
loop_2196:
	udiv	%i6,	0x1BF3,	%o4
	edge16n	%o1,	%g3,	%i3
loop_2197:
	fmovrdlez	%g6,	%f4,	%f0
	tcs	%icc,	0x5
	popc	0x0A76,	%g4
	brlz,a	%i1,	loop_2198
	nop
	setx	0x2078EB0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	tne	%icc,	0x7
	fmovsl	%xcc,	%f4,	%f20
loop_2198:
	andncc	%l2,	%g1,	%o6
	stw	%o3,	[%l7 + 0x20]
	lduh	[%l7 + 0x3A],	%o2
	nop
	set	0x44, %o1
	ldstub	[%l7 + %o1],	%i4
	nop
	fitos	%f6,	%f9
	fstox	%f9,	%f0
	fxtos	%f0,	%f23
	nop
	setx	loop_2199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%g7,	0x3C4,	%l0
	fbu	%fcc1,	loop_2200
	fmuld8ulx16	%f3,	%f13,	%f8
loop_2199:
	fnor	%f14,	%f2,	%f8
	for	%f24,	%f14,	%f2
loop_2200:
	movpos	%icc,	%o5,	%o7
	bneg,a	%icc,	loop_2201
	fnot1	%f20,	%f16
	tg	%xcc,	0x0
	bcc,a,pt	%xcc,	loop_2202
loop_2201:
	subccc	%i0,	%i7,	%l4
	sub	%g2,	%l5,	%i5
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x53] %asi,	%l6
loop_2202:
	bgu,a,pn	%icc,	loop_2203
	sethi	0x1EBD,	%g5
	nop
	set	0x56, %o6
	ldstub	[%l7 + %o6],	%i2
	tpos	%xcc,	0x7
loop_2203:
	tle	%xcc,	0x4
	fmovrdlez	%l3,	%f30,	%f6
	movne	%icc,	%l1,	%o0
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%o4
	fmovda	%icc,	%f23,	%f13
	andncc	%i6,	%o1,	%g3
	fbule,a	%fcc0,	loop_2204
	popc	%g6,	%g4
	sra	%i1,	0x14,	%i3
	ba,pn	%icc,	loop_2205
loop_2204:
	movrlez	%l2,	0x11C,	%g1
	fpadd16	%f12,	%f2,	%f10
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2205:
	edge8ln	%o3,	%o2,	%i4
	nop
	setx	0xF76BCD21,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xF409034D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f27,	%f25
	fble,a	%fcc3,	loop_2206
	addcc	%o6,	0x08F2,	%l0
	srax	%o5,	%o7,	%g7
	sub	%i0,	0x1B01,	%i7
loop_2206:
	fxor	%f24,	%f26,	%f28
	fcmpne32	%f28,	%f20,	%l4
	fbue,a	%fcc1,	loop_2207
	nop
	setx	loop_2208,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x30],	%f18
	nop
	setx	0xC9AD1F54704B56AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_2207:
	swap	[%l7 + 0x54],	%l5
loop_2208:
	fnot2	%f18,	%f16
	movrgz	%i5,	%l6,	%g2
	array8	%g5,	%i2,	%l1
	brgz	%o0,	loop_2209
	nop
	set	0x5C, %i3
	prefetch	[%l7 + %i3],	 0x0
	movrgez	%o4,	0x2E4,	%i6
	tsubcc	%o1,	0x0E66,	%l3
loop_2209:
	fmovsle	%xcc,	%f5,	%f10
	edge32l	%g6,	%g3,	%i1
	subccc	%g4,	0x0381,	%l2
	orn	%g1,	%o3,	%i3
	tsubcctv	%o2,	0x173B,	%i4
	subc	%l0,	%o6,	%o5
	taddcctv	%g7,	%i0,	%i7
	and	%l4,	0x168D,	%l5
	tsubcc	%i5,	0x0325,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g2,	%g5,	%i2
	edge32ln	%o7,	%l1,	%o0
	move	%xcc,	%o4,	%i6
	fnand	%f6,	%f8,	%f22
	pdist	%f2,	%f30,	%f10
	fsrc1s	%f19,	%f17
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f30
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%l3
	ldsh	[%l7 + 0x26],	%o1
	movleu	%icc,	%g6,	%i1
	alignaddr	%g3,	%g4,	%g1
	edge16l	%l2,	%i3,	%o2
	fmovscc	%xcc,	%f31,	%f8
	ldd	[%l7 + 0x58],	%o2
	nop
	setx loop_2210, %l0, %l1
	jmpl %l1, %l0
	fpadd16	%f8,	%f2,	%f8
	orncc	%i4,	%o6,	%o5
	be	loop_2211
loop_2210:
	movrgez	%g7,	0x39E,	%i0
	fabsd	%f6,	%f24
	fmovrdgez	%l4,	%f6,	%f0
loop_2211:
	movne	%icc,	%i7,	%l5
	fmovdge	%icc,	%f8,	%f26
	fmovdleu	%xcc,	%f18,	%f6
	andncc	%l6,	%g2,	%g5
	fpackfix	%f18,	%f30
	tne	%xcc,	0x1
	smul	%i5,	%o7,	%i2
	bg,a,pt	%icc,	loop_2212
	sll	%o0,	%o4,	%i6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x18] %asi,	%l3
loop_2212:
	prefetch	[%l7 + 0x08],	 0x3
	andcc	%l1,	0x14F5,	%o1
	fmul8ulx16	%f30,	%f22,	%f6
	tl	%icc,	0x3
	movleu	%icc,	%i1,	%g3
	orcc	%g6,	%g4,	%g1
	ble,a,pn	%xcc,	loop_2213
	edge32n	%i3,	%o2,	%l2
	fbe,a	%fcc2,	loop_2214
	xor	%l0,	0x0CF1,	%o3
loop_2213:
	udivcc	%o6,	0x147F,	%i4
	ldub	[%l7 + 0x2A],	%g7
loop_2214:
	popc	%i0,	%o5
	movg	%xcc,	%i7,	%l4
	movcc	%icc,	%l6,	%g2
	udiv	%g5,	0x118E,	%l5
	te	%xcc,	0x0
	alignaddr	%i5,	%i2,	%o0
	sdivx	%o7,	0x1366,	%i6
	sir	0x07BA
	edge16ln	%l3,	%l1,	%o1
	fmovscc	%icc,	%f5,	%f29
	fmovrdgz	%o4,	%f12,	%f10
	lduh	[%l7 + 0x58],	%g3
	tcc	%xcc,	0x4
	edge16ln	%g6,	%i1,	%g4
	sll	%i3,	0x0B,	%o2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0E] %asi,	%g1
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l0
	set	0x54, %o3
	sta	%f1,	[%l7 + %o3] 0x0c
	fnor	%f30,	%f24,	%f6
	fbg	%fcc2,	loop_2215
	bcs	%xcc,	loop_2216
	movl	%xcc,	%o3,	%o6
	fbu	%fcc3,	loop_2217
loop_2215:
	nop
	fitos	%f7,	%f6
	fstox	%f6,	%f26
loop_2216:
	movn	%xcc,	%i4,	%l2
	xorcc	%i0,	%o5,	%g7
loop_2217:
	orcc	%l4,	0x12FF,	%l6
	fornot2	%f2,	%f16,	%f26
	orn	%g2,	%i7,	%g5
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x16,	%f0
	tge	%icc,	0x2
	membar	0x76
	wr	%g0,	0x88,	%asi
	stha	%i5,	[%l7 + 0x14] %asi
	brz,a	%l5,	loop_2218
	xor	%o0,	0x0AB4,	%o7
	fpack32	%f26,	%f20,	%f24
	subcc	%i6,	%l3,	%i2
loop_2218:
	move	%xcc,	%o1,	%l1
	orn	%o4,	%g3,	%g6
	bn,a,pn	%icc,	loop_2219
	sdiv	%i1,	0x0435,	%g4
	movcs	%xcc,	%i3,	%o2
	xorcc	%l0,	0x0BD0,	%o3
loop_2219:
	flush	%l7 + 0x4C
	fmul8x16al	%f1,	%f4,	%f10
	fble,a	%fcc2,	loop_2220
	srl	%o6,	%g1,	%l2
	bvc,a,pt	%xcc,	loop_2221
	movvs	%xcc,	%i4,	%i0
loop_2220:
	edge16l	%g7,	%o5,	%l4
	sdivx	%l6,	0x01D7,	%g2
loop_2221:
	andcc	%g5,	%i5,	%i7
	fmul8ulx16	%f16,	%f22,	%f8
	fmovdpos	%icc,	%f23,	%f3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x46] %asi,	%l5
	set	0x20, %l3
	stxa	%o7,	[%g0 + %l3] 0x4f
	ta	%icc,	0x3
	array8	%i6,	%o0,	%i2
	edge32	%l3,	%o1,	%l1
	fmuld8sux16	%f9,	%f18,	%f6
	nop
	setx	0x7B5EA627,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f25
	fpack32	%f6,	%f18,	%f6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2C] %asi,	%o4
	brgez,a	%g3,	loop_2222
	fsrc2s	%f16,	%f29
	andncc	%g6,	%i1,	%g4
	fzero	%f22
loop_2222:
	tpos	%xcc,	0x0
	movgu	%xcc,	%i3,	%o2
	fbu,a	%fcc3,	loop_2223
	xnor	%o3,	%o6,	%g1
	bl	%icc,	loop_2224
	edge32n	%l0,	%i4,	%i0
loop_2223:
	bn,a	%xcc,	loop_2225
	ld	[%l7 + 0x60],	%f21
loop_2224:
	te	%icc,	0x4
	fmovsneg	%icc,	%f22,	%f22
loop_2225:
	srax	%l2,	%g7,	%l4
	bl	loop_2226
	and	%o5,	0x1BBF,	%l6
	bleu,a	%xcc,	loop_2227
	movre	%g2,	%i5,	%g5
loop_2226:
	fmovrdgz	%l5,	%f18,	%f20
	edge32l	%o7,	%i7,	%i6
loop_2227:
	array16	%i2,	%o0,	%o1
	bne	%icc,	loop_2228
	edge16l	%l3,	%o4,	%l1
	bshuffle	%f0,	%f14,	%f24
	subccc	%g3,	0x0ECE,	%g6
loop_2228:
	or	%g4,	0x1C93,	%i1
	movle	%icc,	%i3,	%o2
	edge16n	%o3,	%g1,	%l0
	nop
	setx	0x0865E74C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x92EA6F41,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f2,	%f26
	fmul8x16	%f11,	%f22,	%f28
	nop
	setx	0x473B294DD04CEE20,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	srl	%i4,	0x13,	%i0
	fbne,a	%fcc3,	loop_2229
	nop
	fitos	%f8,	%f31
	fstod	%f31,	%f28
	fmovda	%xcc,	%f19,	%f17
	fbn,a	%fcc2,	loop_2230
loop_2229:
	addc	%l2,	%o6,	%l4
	fmovrdlez	%o5,	%f24,	%f22
	fmovrdlez	%g7,	%f8,	%f14
loop_2230:
	movleu	%icc,	%g2,	%i5
	movne	%xcc,	%l6,	%l5
	fmul8ulx16	%f6,	%f18,	%f14
	orncc	%o7,	%g5,	%i7
	fmovrslz	%i6,	%f1,	%f23
	edge32	%o0,	%o1,	%i2
	fexpand	%f9,	%f18
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l3,	%o4
	fmovdcc	%xcc,	%f28,	%f4
	bge,pn	%icc,	loop_2231
	sdivcc	%g3,	0x150B,	%l1
	edge32l	%g6,	%g4,	%i1
	tvc	%xcc,	0x1
loop_2231:
	fmovsa	%xcc,	%f14,	%f23
	fpsub16s	%f27,	%f2,	%f8
	xorcc	%o2,	0x1945,	%o3
	fmovscs	%icc,	%f21,	%f4
	sdivx	%g1,	0x06FC,	%l0
	movvc	%icc,	%i4,	%i0
	fabss	%f10,	%f13
	xnorcc	%i3,	%l2,	%o6
	mulx	%o5,	%g7,	%g2
	ldsb	[%l7 + 0x1C],	%i5
	tcc	%xcc,	0x4
	bg	loop_2232
	alignaddrl	%l4,	%l6,	%o7
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2232:
	ldd	[%l7 + 0x68],	%f12
	subccc	%l5,	0x134E,	%i7
	array32	%g5,	%i6,	%o1
	sir	0x0E91
	ble	%icc,	loop_2233
	fmovde	%icc,	%f31,	%f31
	xorcc	%i2,	%o0,	%l3
	set	0x55, %o0
	lduba	[%l7 + %o0] 0x14,	%o4
loop_2233:
	ldx	[%l7 + 0x60],	%l1
	fmovsvs	%xcc,	%f2,	%f28
	andcc	%g3,	%g4,	%i1
	fba,a	%fcc0,	loop_2234
	fnegd	%f16,	%f4
	taddcc	%g6,	%o3,	%o2
	andncc	%g1,	%i4,	%i0
loop_2234:
	movn	%icc,	%l0,	%i3
	bg,a,pt	%icc,	loop_2235
	movrne	%l2,	0x385,	%o5
	fexpand	%f25,	%f22
	fandnot2	%f28,	%f28,	%f28
loop_2235:
	mova	%xcc,	%o6,	%g7
	move	%icc,	%g2,	%l4
	movne	%icc,	%i5,	%o7
	fcmpeq16	%f0,	%f6,	%l5
	udiv	%l6,	0x1073,	%i7
	mulscc	%i6,	%o1,	%g5
	stw	%i2,	[%l7 + 0x5C]
	swap	[%l7 + 0x34],	%l3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o4
	addc	%o0,	%l1,	%g4
	fpackfix	%f18,	%f21
	edge8	%i1,	%g3,	%o3
	tpos	%xcc,	0x6
	bvc,a,pn	%icc,	loop_2236
	fbl,a	%fcc2,	loop_2237
	edge8ln	%g6,	%g1,	%o2
	tne	%xcc,	0x1
loop_2236:
	array32	%i0,	%l0,	%i4
loop_2237:
	udivcc	%i3,	0x0A1D,	%l2
	alignaddrl	%o5,	%o6,	%g2
	bgu,a	loop_2238
	bcc,a,pt	%icc,	loop_2239
	movcs	%xcc,	%l4,	%g7
	fbe,a	%fcc0,	loop_2240
loop_2238:
	tg	%icc,	0x1
loop_2239:
	fbo,a	%fcc1,	loop_2241
	lduh	[%l7 + 0x18],	%o7
loop_2240:
	orn	%i5,	0x12C2,	%l5
	fbl,a	%fcc1,	loop_2242
loop_2241:
	sir	0x0B11
	movle	%icc,	%l6,	%i7
	fors	%f7,	%f31,	%f26
loop_2242:
	fone	%f16
	fnand	%f26,	%f16,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i6,	%g5,	%i2
	movle	%xcc,	%o1,	%o4
	movrlez	%l3,	%o0,	%g4
	fbe,a	%fcc0,	loop_2243
	fmovrsgz	%l1,	%f31,	%f5
	tl	%xcc,	0x6
	fcmpne16	%f18,	%f24,	%i1
loop_2243:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g3
	orn	%o3,	%g1,	%o2
	bge	loop_2244
	movvs	%xcc,	%g6,	%l0
	edge16l	%i4,	%i0,	%l2
	fbe,a	%fcc1,	loop_2245
loop_2244:
	sllx	%o5,	0x14,	%o6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%g2
loop_2245:
	sllx	%l4,	%g7,	%i3
	fsrc1s	%f14,	%f5
	nop
	setx loop_2246, %l0, %l1
	jmpl %l1, %o7
	nop
	setx	loop_2247,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%i5,	%l5,	%l6
	tpos	%icc,	0x3
loop_2246:
	movg	%xcc,	%i7,	%i6
loop_2247:
	alignaddrl	%i2,	%o1,	%g5
	fmovdneg	%xcc,	%f3,	%f2
	edge16	%o4,	%l3,	%o0
	sdivcc	%g4,	0x09EA,	%i1
	ldub	[%l7 + 0x27],	%l1
	nop
	fitos	%f2,	%f7
	fstox	%f7,	%f12
	fxtos	%f12,	%f6
	mulscc	%o3,	%g1,	%g3
	udiv	%o2,	0x0342,	%l0
	fbuge	%fcc0,	loop_2248
	edge16l	%g6,	%i0,	%i4
	tvs	%xcc,	0x6
	fbne	%fcc0,	loop_2249
loop_2248:
	fnegs	%f13,	%f16
	fpadd16s	%f31,	%f24,	%f21
	fba	%fcc0,	loop_2250
loop_2249:
	xnor	%l2,	%o6,	%o5
	smul	%g2,	%l4,	%g7
	fpadd16s	%f24,	%f4,	%f3
loop_2250:
	xor	%o7,	%i3,	%l5
	ldub	[%l7 + 0x12],	%l6
	tpos	%xcc,	0x2
	set	0x2C, %g1
	lda	[%l7 + %g1] 0x15,	%f1
	pdist	%f24,	%f4,	%f6
	movl	%xcc,	%i5,	%i7
	movcc	%icc,	%i2,	%i6
	mulscc	%o1,	%g5,	%o4
	set	0x6C, %g3
	swapa	[%l7 + %g3] 0x89,	%l3
	brgez	%g4,	loop_2251
	array8	%i1,	%l1,	%o3
	bcc,a,pt	%icc,	loop_2252
	edge8	%g1,	%o0,	%g3
loop_2251:
	movre	%o2,	%g6,	%i0
	edge16l	%l0,	%i4,	%l2
loop_2252:
	nop
	set	0x1c8, %o4
	nop 	! 	stxa	%o6,	[%g0 + %o4] 0x40 ripped by fixASI40.pl
	fba,a	%fcc1,	loop_2253
	ldsb	[%l7 + 0x3E],	%o5
	fmovdpos	%xcc,	%f3,	%f3
	fzero	%f4
loop_2253:
	tge	%xcc,	0x4
	or	%l4,	%g7,	%o7
	fmovsvs	%icc,	%f10,	%f30
	bcc,a,pt	%icc,	loop_2254
	sdivx	%g2,	0x0718,	%l5
	movrgez	%l6,	%i5,	%i7
	tg	%xcc,	0x1
loop_2254:
	smul	%i3,	%i2,	%o1
	nop
	fitos	%f2,	%f26
	movcc	%icc,	%g5,	%o4
	fblg	%fcc3,	loop_2255
	alignaddrl	%l3,	%g4,	%i6
	movcc	%icc,	%l1,	%o3
	movcc	%xcc,	%g1,	%i1
loop_2255:
	movcs	%xcc,	%g3,	%o2
	sub	%g6,	%o0,	%i0
	taddcc	%l0,	%i4,	%l2
	edge8	%o6,	%o5,	%g7
	andn	%o7,	%l4,	%l5
	fmovsvc	%icc,	%f22,	%f5
	srl	%l6,	0x19,	%g2
	ble,pt	%xcc,	loop_2256
	tsubcctv	%i5,	%i3,	%i2
	sub	%i7,	%o1,	%o4
	mova	%icc,	%g5,	%l3
loop_2256:
	fba	%fcc2,	loop_2257
	umul	%g4,	%l1,	%i6
	fnands	%f8,	%f8,	%f31
	fandnot1	%f12,	%f6,	%f26
loop_2257:
	fnot2	%f12,	%f16
	fabss	%f29,	%f21
	fornot2s	%f7,	%f6,	%f9
	edge8	%o3,	%g1,	%i1
	movpos	%icc,	%o2,	%g6
	fpsub16	%f20,	%f10,	%f4
	sdivcc	%o0,	0x0B0E,	%g3
	add	%i0,	0x0582,	%l0
	tneg	%xcc,	0x2
	umul	%l2,	0x00DE,	%i4
	movcc	%icc,	%o5,	%o6
	smulcc	%o7,	0x1B32,	%g7
	mulx	%l5,	%l4,	%g2
	srl	%i5,	0x10,	%i3
	addcc	%l6,	%i7,	%i2
	tsubcc	%o1,	0x15D0,	%o4
	movpos	%icc,	%l3,	%g5
	fzeros	%f15
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g4,	%i6
	fands	%f20,	%f5,	%f15
	popc	0x152F,	%o3
	movpos	%icc,	%g1,	%i1
	sdivcc	%o2,	0x04FB,	%l1
	addccc	%o0,	%g3,	%g6
	sll	%l0,	0x0B,	%i0
	movcs	%xcc,	%l2,	%i4
	movleu	%icc,	%o5,	%o6
	andcc	%o7,	%g7,	%l5
	srl	%l4,	0x13,	%i5
	bne	%icc,	loop_2258
	edge32	%i3,	%l6,	%g2
	fpadd32s	%f22,	%f4,	%f25
	taddcctv	%i7,	%i2,	%o1
loop_2258:
	movl	%xcc,	%o4,	%g5
	fbl	%fcc1,	loop_2259
	brlz,a	%g4,	loop_2260
	andn	%l3,	%o3,	%g1
	stb	%i1,	[%l7 + 0x69]
loop_2259:
	brlez,a	%o2,	loop_2261
loop_2260:
	add	%l1,	%o0,	%g3
	andn	%i6,	%l0,	%i0
	fbo,a	%fcc1,	loop_2262
loop_2261:
	st	%f24,	[%l7 + 0x2C]
	tl	%icc,	0x6
	fbge	%fcc2,	loop_2263
loop_2262:
	movre	%g6,	%l2,	%i4
	fornot1s	%f3,	%f4,	%f11
	udiv	%o6,	0x0616,	%o7
loop_2263:
	brlz,a	%o5,	loop_2264
	addc	%g7,	%l4,	%l5
	fmovsle	%icc,	%f13,	%f16
	fmovrslz	%i3,	%f20,	%f15
loop_2264:
	fbuge	%fcc3,	loop_2265
	sllx	%l6,	%i5,	%g2
	taddcc	%i2,	0x037B,	%o1
	fmovdgu	%xcc,	%f22,	%f21
loop_2265:
	bn	%icc,	loop_2266
	array8	%o4,	%i7,	%g5
	edge16n	%g4,	%l3,	%g1
	movgu	%icc,	%i1,	%o2
loop_2266:
	andncc	%l1,	%o3,	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g3,	%l0
	fandnot1s	%f22,	%f7,	%f26
	tvs	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	stha	%i0,	[%l7 + 0x54] %asi
	alignaddr	%i6,	%g6,	%i4
	membar	0x0F
	udivcc	%l2,	0x0516,	%o7
	movrne	%o5,	%g7,	%o6
	edge8ln	%l5,	%l4,	%l6
	fbug,a	%fcc0,	loop_2267
	array16	%i3,	%g2,	%i2
	ba,a	loop_2268
	edge16	%o1,	%i5,	%i7
loop_2267:
	sdivx	%o4,	0x078E,	%g4
	sethi	0x1BED,	%l3
loop_2268:
	fbne	%fcc1,	loop_2269
	mulscc	%g1,	%i1,	%o2
	fbu,a	%fcc0,	loop_2270
	tneg	%icc,	0x1
loop_2269:
	fmovsa	%icc,	%f29,	%f30
	fmovde	%xcc,	%f25,	%f15
loop_2270:
	fmovdge	%icc,	%f18,	%f3
	sdivx	%g5,	0x1F9F,	%o3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%o0,	%l1
	udivcc	%g3,	0x0D15,	%l0
	bg,a	loop_2271
	andncc	%i6,	%g6,	%i4
	bvc,a,pt	%xcc,	loop_2272
	brnz	%i0,	loop_2273
loop_2271:
	smul	%l2,	0x0BED,	%o5
	call	loop_2274
loop_2272:
	swap	[%l7 + 0x40],	%o7
loop_2273:
	fbu,a	%fcc0,	loop_2275
	nop
	set	0x30, %l5
	stw	%g7,	[%l7 + %l5]
loop_2274:
	nop
	wr	%g0,	0x89,	%asi
	stha	%o6,	[%l7 + 0x4A] %asi
loop_2275:
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f10
	movneg	%icc,	%l5,	%l6
	fxor	%f8,	%f6,	%f6
	movne	%icc,	%l4,	%i3
	sir	0x0102
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x2a,	%i2
	nop
	set	0x79, %i7
	stb	%g2,	[%l7 + %i7]
	edge16ln	%o1,	%i5,	%i7
	ldstub	[%l7 + 0x6A],	%g4
	addccc	%o4,	%l3,	%g1
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sdivcc	%o2,	0x19FF,	%g5
	udivcc	%i1,	0x1BF7,	%o3
	tne	%xcc,	0x1
	edge8ln	%o0,	%g3,	%l0
	tsubcc	%l1,	0x074A,	%i6
	fbul,a	%fcc1,	loop_2276
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i4,	0x1A8E,	%g6
	fmovde	%xcc,	%f4,	%f31
loop_2276:
	call	loop_2277
	bcs	loop_2278
	fmovsl	%icc,	%f24,	%f10
	tn	%icc,	0x7
loop_2277:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i0
loop_2278:
	srax	%l2,	%o5,	%g7
	umulcc	%o7,	%o6,	%l5
	sdivcc	%l6,	0x0A3C,	%i3
	movpos	%xcc,	%i2,	%g2
	tpos	%xcc,	0x5
	edge8l	%o1,	%l4,	%i7
	xnorcc	%g4,	0x0FF6,	%i5
	fblg	%fcc0,	loop_2279
	fmovdne	%icc,	%f23,	%f9
	movneg	%icc,	%o4,	%g1
	movre	%o2,	0x085,	%g5
loop_2279:
	bgu	%xcc,	loop_2280
	nop
	fitos	%f2,	%f7
	fstox	%f7,	%f16
	fxtos	%f16,	%f22
	fandnot1s	%f4,	%f0,	%f23
	fble	%fcc0,	loop_2281
loop_2280:
	edge16	%i1,	%l3,	%o0
	fbu	%fcc2,	loop_2282
	edge8n	%g3,	%o3,	%l1
loop_2281:
	array16	%l0,	%i6,	%g6
	bneg,pt	%xcc,	loop_2283
loop_2282:
	tl	%icc,	0x5
	brgz,a	%i0,	loop_2284
	brz,a	%i4,	loop_2285
loop_2283:
	fnegs	%f22,	%f0
	bneg,a	loop_2286
loop_2284:
	movge	%icc,	%o5,	%l2
loop_2285:
	fbul	%fcc3,	loop_2287
	fcmpne16	%f14,	%f22,	%g7
loop_2286:
	nop
	fitos	%f0,	%f29
	fstoi	%f29,	%f18
	umul	%o6,	0x0795,	%o7
loop_2287:
	sir	0x04A4
	subccc	%l6,	%l5,	%i3
	tg	%icc,	0x4
	array32	%g2,	%i2,	%l4
	movge	%icc,	%i7,	%g4
	nop
	fitos	%f10,	%f17
	fstox	%f17,	%f6
	fxtos	%f6,	%f3
	nop
	fitos	%f3,	%f26
	fstod	%f26,	%f0
	te	%icc,	0x6
	nop
	fitod	%f4,	%f20
	fdtoi	%f20,	%f5
	sra	%o1,	%i5,	%o4
	mova	%xcc,	%o2,	%g5
	andncc	%g1,	%l3,	%o0
	sdivcc	%i1,	0x1694,	%g3
	ldsh	[%l7 + 0x2A],	%l1
	movg	%xcc,	%o3,	%l0
	movrlez	%g6,	%i0,	%i6
	fpsub16s	%f9,	%f23,	%f20
	bcc,a	%xcc,	loop_2288
	fbu,a	%fcc2,	loop_2289
	alignaddrl	%o5,	%i4,	%g7
	set	0x0E, %g5
	lduha	[%l7 + %g5] 0x89,	%o6
loop_2288:
	sllx	%l2,	0x14,	%o7
loop_2289:
	fbul,a	%fcc2,	loop_2290
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l5,	%l6,	%g2
	movg	%icc,	%i3,	%l4
loop_2290:
	sllx	%i7,	%i2,	%g4
	edge32ln	%o1,	%o4,	%o2
	sra	%g5,	%g1,	%l3
	fcmple16	%f26,	%f2,	%o0
	add	%i1,	%g3,	%l1
	movvs	%xcc,	%o3,	%l0
	set	0x58, %l0
	ldswa	[%l7 + %l0] 0x04,	%g6
	andncc	%i5,	%i6,	%i0
	fsrc1	%f0,	%f22
	fcmpne32	%f24,	%f14,	%i4
	movvs	%xcc,	%o5,	%o6
	movre	%l2,	%o7,	%l5
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x88,	%l6
	edge32n	%g2,	%i3,	%l4
	fornot1s	%f23,	%f30,	%f14
	ld	[%l7 + 0x58],	%f22
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f0
	move	%icc,	%i7,	%i2
	array32	%g4,	%o1,	%g7
	tpos	%icc,	0x7
	fbg	%fcc1,	loop_2291
	fpack16	%f4,	%f0
	nop
	fitos	%f4,	%f11
	fstod	%f11,	%f28
	edge16	%o2,	%o4,	%g1
loop_2291:
	nop
	fitod	%f21,	%f22
	fbne	%fcc3,	loop_2292
	sdivcc	%g5,	0x1F45,	%o0
	umulcc	%i1,	0x1043,	%l3
	tcs	%icc,	0x6
loop_2292:
	mulx	%g3,	%o3,	%l0
	ldub	[%l7 + 0x63],	%g6
	tg	%icc,	0x6
	fcmpeq16	%f26,	%f2,	%i5
	edge8	%l1,	%i6,	%i0
	srl	%o5,	0x0B,	%i4
	sllx	%o6,	%o7,	%l2
	movne	%xcc,	%l6,	%l5
	fandnot2s	%f30,	%f2,	%f1
	or	%g2,	0x02ED,	%l4
	tneg	%icc,	0x3
	wr	%g0,	0x89,	%asi
	stha	%i3,	[%l7 + 0x24] %asi
	edge16	%i2,	%g4,	%i7
	add	%o1,	%g7,	%o4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%g1
	ta	%icc,	0x0
	xnor	%o0,	0x17F8,	%g5
	movpos	%xcc,	%i1,	%g3
	edge16ln	%l3,	%o3,	%l0
	fmovrdlz	%i5,	%f24,	%f18
	tl	%icc,	0x5
	movvc	%icc,	%l1,	%g6
	addccc	%i6,	%i0,	%o5
	tne	%icc,	0x3
	movrlz	%i4,	0x18D,	%o7
	fbu,a	%fcc1,	loop_2293
	tl	%icc,	0x3
	tneg	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2293:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l2,	%l6,	%l5
	movle	%icc,	%o6,	%g2
	fbu	%fcc0,	loop_2294
	srax	%l4,	0x03,	%i2
	fmovdge	%icc,	%f2,	%f7
	tpos	%icc,	0x6
loop_2294:
	tneg	%icc,	0x1
	sir	0x0468
	movgu	%xcc,	%g4,	%i3
	fba,a	%fcc3,	loop_2295
	movrlz	%i7,	0x074,	%g7
	taddcctv	%o1,	%o4,	%g1
	addc	%o0,	%g5,	%o2
loop_2295:
	tpos	%icc,	0x6
	xnorcc	%i1,	%g3,	%o3
	xnor	%l0,	%i5,	%l1
	subcc	%l3,	0x12FF,	%g6
	alignaddr	%i0,	%o5,	%i4
	tpos	%icc,	0x5
	addcc	%o7,	0x0ECF,	%l2
	udivx	%i6,	0x1466,	%l5
	movne	%xcc,	%l6,	%o6
	smulcc	%l4,	0x0F2F,	%i2
	andncc	%g4,	%g2,	%i7
	fmovrslz	%i3,	%f18,	%f31
	tn	%xcc,	0x4
	tg	%icc,	0x1
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g7
	stb	%o4,	[%l7 + 0x6C]
	movn	%xcc,	%g1,	%o1
	udivcc	%g5,	0x0CA2,	%o0
	xnorcc	%i1,	0x05C0,	%g3
	ldstub	[%l7 + 0x7C],	%o2
	set	0x64, %l4
	stba	%o3,	[%l7 + %l4] 0x22
	membar	#Sync
	subc	%l0,	0x05CF,	%l1
	bneg,pt	%icc,	loop_2296
	fpadd32s	%f15,	%f27,	%f27
	fmovdgu	%xcc,	%f25,	%f30
	movgu	%icc,	%i5,	%l3
loop_2296:
	movrgz	%g6,	0x151,	%i0
	wr	%g0,	0xea,	%asi
	stxa	%i4,	[%l7 + 0x20] %asi
	membar	#Sync
	mulscc	%o7,	0x1A6D,	%o5
	movrgez	%l2,	0x028,	%l5
	bvs	loop_2297
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,pt	%xcc,	loop_2298
	addccc	%i6,	%l6,	%l4
loop_2297:
	sethi	0x0D23,	%o6
	lduw	[%l7 + 0x08],	%i2
loop_2298:
	fmovdl	%icc,	%f19,	%f30
	movrne	%g2,	%i7,	%g4
	ldsw	[%l7 + 0x40],	%i3
	xnor	%g7,	%o4,	%o1
	fpsub32s	%f9,	%f30,	%f24
	nop
	setx	0xB7D879C53E81EC08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x492B40E1B58117BE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f20,	%f28
	ld	[%l7 + 0x18],	%f17
	fmovsa	%xcc,	%f25,	%f26
	set	0x31, %i0
	stba	%g5,	[%l7 + %i0] 0x89
	subccc	%o0,	%i1,	%g3
	andn	%g1,	%o3,	%l0
	orncc	%o2,	0x0F43,	%l1
	movrgz	%l3,	0x272,	%i5
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f4
	fxtod	%f4,	%f26
	fbue	%fcc3,	loop_2299
	nop
	setx	0x653A3D9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x64113B4C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f2,	%f7
	edge8l	%g6,	%i0,	%i4
	fmovdgu	%xcc,	%f21,	%f27
loop_2299:
	brgez,a	%o5,	loop_2300
	bne	%icc,	loop_2301
	fmul8x16al	%f16,	%f0,	%f0
	tvc	%xcc,	0x1
loop_2300:
	subc	%o7,	0x0077,	%l5
loop_2301:
	umul	%l2,	0x1868,	%i6
	lduh	[%l7 + 0x4C],	%l6
	be,a,pn	%icc,	loop_2302
	tvc	%icc,	0x1
	tsubcc	%o6,	0x0CF4,	%l4
	fbo,a	%fcc3,	loop_2303
loop_2302:
	array8	%g2,	%i7,	%g4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x48] %asi,	%i2
loop_2303:
	tne	%xcc,	0x7
	mova	%icc,	%g7,	%o4
	movrlz	%i3,	0x26B,	%o1
	fnot1	%f16,	%f24
	tcc	%icc,	0x4
	alignaddr	%o0,	%i1,	%g5
	bcs,pt	%icc,	loop_2304
	bshuffle	%f6,	%f10,	%f28
	srl	%g1,	0x02,	%g3
	smul	%l0,	%o2,	%o3
loop_2304:
	addccc	%l3,	%i5,	%g6
	fbule,a	%fcc1,	loop_2305
	popc	%l1,	%i0
	movrlez	%o5,	0x3CC,	%o7
	fors	%f13,	%f26,	%f5
loop_2305:
	nop
	set	0x34, %i4
	stwa	%i4,	[%l7 + %i4] 0x11
	movre	%l5,	0x281,	%i6
	tleu	%xcc,	0x2
	fpadd32s	%f25,	%f16,	%f24
	te	%icc,	0x7
	xor	%l2,	%l6,	%o6
	srl	%g2,	0x02,	%i7
	brnz	%l4,	loop_2306
	bn	%icc,	loop_2307
	fpmerge	%f11,	%f13,	%f8
	add	%i2,	%g4,	%o4
loop_2306:
	ble	%xcc,	loop_2308
loop_2307:
	edge16l	%i3,	%o1,	%g7
	ldsh	[%l7 + 0x60],	%i1
	edge16l	%o0,	%g5,	%g3
loop_2308:
	popc	%l0,	%o2
	stx	%o3,	[%l7 + 0x50]
	fcmple32	%f12,	%f6,	%g1
	and	%l3,	%g6,	%l1
	movneg	%icc,	%i0,	%o5
	movg	%xcc,	%i5,	%i4
	brnz,a	%l5,	loop_2309
	sll	%o7,	%i6,	%l2
	sllx	%l6,	%o6,	%i7
	edge16	%l4,	%i2,	%g2
loop_2309:
	fbe	%fcc1,	loop_2310
	tsubcctv	%g4,	0x0F5B,	%o4
	mulx	%o1,	%g7,	%i1
	umul	%o0,	%i3,	%g3
loop_2310:
	movrgez	%g5,	0x0FE,	%l0
	bgu,a	%xcc,	loop_2311
	movrne	%o2,	%g1,	%l3
	movrlz	%g6,	0x1E1,	%o3
	fmovsn	%xcc,	%f0,	%f3
loop_2311:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x1
	andcc	%l1,	%i0,	%i5
	movl	%icc,	%i4,	%l5
	sub	%o7,	%o5,	%l2
	swap	[%l7 + 0x60],	%i6
	fbg	%fcc0,	loop_2312
	alignaddrl	%l6,	%i7,	%o6
	movcc	%xcc,	%l4,	%i2
	sra	%g2,	%g4,	%o1
loop_2312:
	fands	%f6,	%f18,	%f16
	stbar
	tvc	%xcc,	0x1
	tg	%xcc,	0x1
	sdiv	%g7,	0x01A1,	%i1
	movcs	%icc,	%o4,	%i3
	movgu	%xcc,	%g3,	%g5
	edge16ln	%l0,	%o0,	%o2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l3
	movge	%xcc,	%g1,	%o3
	edge32n	%l1,	%i0,	%i5
	smul	%i4,	%l5,	%g6
	srax	%o7,	0x0C,	%o5
	fandnot1s	%f9,	%f14,	%f20
	sethi	0x0964,	%i6
	fmuld8sux16	%f27,	%f9,	%f12
	srl	%l6,	%i7,	%o6
	movl	%xcc,	%l4,	%l2
	nop
	setx	0x2D2C5DAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x4E618D51,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f9,	%f22
	xorcc	%i2,	0x0FE0,	%g2
	movcc	%xcc,	%o1,	%g7
	fbue,a	%fcc1,	loop_2313
	addcc	%g4,	0x1EC5,	%o4
	movl	%xcc,	%i3,	%g3
	subc	%g5,	%l0,	%i1
loop_2313:
	sir	0x1149
	udiv	%o2,	0x0ECF,	%l3
	fnot1s	%f9,	%f31
	alignaddr	%g1,	%o0,	%l1
	flush	%l7 + 0x6C
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x47] %asi,	%o3
	smul	%i0,	%i4,	%i5
	fmovsle	%icc,	%f4,	%f19
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fcmpgt32	%f16,	%f4,	%g6
	movrgez	%l5,	%o7,	%i6
	movcs	%xcc,	%o5,	%l6
	tgu	%icc,	0x6
	ldsw	[%l7 + 0x24],	%o6
	orncc	%i7,	0x105B,	%l4
	nop
	setx	0xA040ED19,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	tsubcctv	%i2,	%l2,	%o1
	movcc	%xcc,	%g2,	%g7
	movge	%icc,	%o4,	%g4
	prefetch	[%l7 + 0x68],	 0x0
	fmovs	%f27,	%f1
	xnorcc	%i3,	0x0F37,	%g3
	movleu	%icc,	%g5,	%i1
	fnot1s	%f19,	%f29
	movcs	%icc,	%l0,	%l3
	ldsh	[%l7 + 0x76],	%o2
	taddcctv	%o0,	0x0C07,	%g1
	bcs,a	%xcc,	loop_2314
	movrlez	%l1,	0x222,	%i0
	alignaddrl	%i4,	%o3,	%g6
	movrgz	%l5,	%i5,	%i6
loop_2314:
	bn,a,pn	%icc,	loop_2315
	edge8ln	%o5,	%l6,	%o7
	fnor	%f2,	%f20,	%f6
	subc	%i7,	%o6,	%i2
loop_2315:
	taddcctv	%l4,	%l2,	%o1
	xorcc	%g2,	0x1AB7,	%o4
	sdiv	%g7,	0x08A1,	%g4
	tsubcc	%g3,	%g5,	%i3
	ldstub	[%l7 + 0x77],	%i1
	mulscc	%l0,	%o2,	%l3
	brz,a	%g1,	loop_2316
	movgu	%icc,	%o0,	%l1
	movgu	%icc,	%i0,	%o3
	tsubcc	%i4,	0x0A86,	%l5
loop_2316:
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f12
	fxtod	%f12,	%f18
	fnands	%f13,	%f27,	%f22
	sllx	%g6,	0x17,	%i5
	bgu,a,pn	%xcc,	loop_2317
	udivx	%i6,	0x1F5E,	%l6
	fmovrdgz	%o7,	%f2,	%f22
	edge16	%o5,	%o6,	%i7
loop_2317:
	lduw	[%l7 + 0x10],	%i2
	movl	%icc,	%l2,	%l4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x338] %asi,	%g2 ripped by fixASI40.pl ripped by fixASI40.pl
	tcc	%icc,	0x6
	std	%f4,	[%l7 + 0x30]
	tsubcc	%o4,	%g7,	%g4
	movpos	%icc,	%g3,	%g5
	xnorcc	%i3,	0x0CEA,	%o1
	movrgz	%i1,	%o2,	%l0
	tneg	%xcc,	0x7
	srl	%g1,	0x10,	%l3
	tvs	%icc,	0x6
	movgu	%icc,	%o0,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o3,	%i0
	orn	%i4,	%l5,	%i5
	nop
	setx	0x279956D7D8FD0FBD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC80AD7F1024EE6EC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f30,	%f10
	fbge	%fcc0,	loop_2318
	smulcc	%g6,	%l6,	%o7
	taddcctv	%i6,	%o6,	%i7
	andcc	%i2,	0x04DF,	%o5
loop_2318:
	move	%xcc,	%l4,	%g2
	addccc	%l2,	0x0BE9,	%o4
	bcs,pt	%xcc,	loop_2319
	tcs	%xcc,	0x0
	udiv	%g4,	0x0BEA,	%g7
	for	%f6,	%f28,	%f12
loop_2319:
	orn	%g3,	%i3,	%g5
	tne	%icc,	0x4
	xorcc	%i1,	0x01AC,	%o1
	move	%xcc,	%l0,	%o2
	fpadd16s	%f1,	%f15,	%f10
	fmul8x16au	%f15,	%f12,	%f28
	fnor	%f28,	%f20,	%f30
	sub	%l3,	0x1F1D,	%g1
	fxors	%f6,	%f14,	%f21
	tle	%icc,	0x3
	tleu	%xcc,	0x4
	addccc	%o0,	%o3,	%i0
	tvc	%icc,	0x3
	move	%icc,	%l1,	%i4
	tg	%icc,	0x4
	wr	%g0,	0x18,	%asi
	stba	%l5,	[%l7 + 0x0D] %asi
	fornot1	%f2,	%f20,	%f28
	fmovrsne	%i5,	%f19,	%f17
	movre	%l6,	0x125,	%o7
	fmovspos	%icc,	%f29,	%f29
	ldsb	[%l7 + 0x19],	%i6
	ta	%icc,	0x3
	fbe,a	%fcc3,	loop_2320
	bvc,pt	%xcc,	loop_2321
	movcc	%icc,	%o6,	%i7
	sra	%i2,	0x0E,	%g6
loop_2320:
	movre	%l4,	0x1C8,	%o5
loop_2321:
	andcc	%g2,	%l2,	%o4
	orncc	%g7,	0x1D11,	%g3
	movne	%icc,	%g4,	%g5
	nop
	fitos	%f12,	%f31
	fstoi	%f31,	%f27
	taddcctv	%i1,	0x081D,	%o1
	fbne,a	%fcc1,	loop_2322
	stb	%l0,	[%l7 + 0x3F]
	fbue,a	%fcc3,	loop_2323
	subccc	%o2,	%l3,	%g1
loop_2322:
	array32	%o0,	%o3,	%i3
	fmovde	%icc,	%f20,	%f22
loop_2323:
	brlz,a	%i0,	loop_2324
	smulcc	%i4,	%l1,	%l5
	andcc	%l6,	0x12F1,	%i5
	taddcc	%i6,	%o7,	%i7
loop_2324:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i2,	0x21E,	%o6
	fpmerge	%f26,	%f3,	%f24
	fmul8x16	%f0,	%f28,	%f20
	fbue	%fcc0,	loop_2325
	movl	%icc,	%l4,	%o5
	tcs	%icc,	0x1
	taddcc	%g2,	0x1DAE,	%l2
loop_2325:
	sll	%g6,	0x12,	%o4
	brlez	%g7,	loop_2326
	add	%g4,	0x1482,	%g3
	mova	%xcc,	%i1,	%g5
	fmovdleu	%xcc,	%f20,	%f3
loop_2326:
	fands	%f2,	%f31,	%f18
	sdivx	%l0,	0x13D6,	%o1
	tne	%icc,	0x3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%l3
	edge16l	%g1,	%o0,	%o3
	fmovscs	%xcc,	%f9,	%f11
	edge32n	%o2,	%i0,	%i3
	fmovdgu	%icc,	%f29,	%f0
	brz	%l1,	loop_2327
	andncc	%l5,	%l6,	%i5
	fmovs	%f16,	%f12
	fbul	%fcc2,	loop_2328
loop_2327:
	array8	%i4,	%i6,	%i7
	alignaddr	%i2,	%o6,	%l4
	fzeros	%f25
loop_2328:
	movneg	%icc,	%o5,	%g2
	movleu	%icc,	%l2,	%o7
	fxors	%f20,	%f1,	%f15
	fmovs	%f18,	%f30
	xorcc	%o4,	%g6,	%g4
	fmovrdlez	%g3,	%f20,	%f8
	tcs	%xcc,	0x1
	fnegs	%f22,	%f18
	xor	%i1,	0x121F,	%g5
	ble	%icc,	loop_2329
	movge	%xcc,	%g7,	%l0
	udivx	%o1,	0x1EFD,	%g1
	fmovsle	%icc,	%f25,	%f12
loop_2329:
	fmovrdlz	%o0,	%f6,	%f8
	fxors	%f12,	%f14,	%f20
	brlez	%o3,	loop_2330
	orncc	%l3,	0x1FE5,	%o2
	fnegs	%f7,	%f7
	movne	%xcc,	%i3,	%i0
loop_2330:
	fmovsgu	%icc,	%f18,	%f27
	fbe,a	%fcc0,	loop_2331
	movgu	%xcc,	%l1,	%l6
	stx	%l5,	[%l7 + 0x58]
	fmovrdne	%i4,	%f16,	%f8
loop_2331:
	movrne	%i5,	%i7,	%i6
	set	0x78, %l2
	ldsba	[%l7 + %l2] 0x80,	%o6
	movleu	%xcc,	%i2,	%l4
	udivx	%o5,	0x0F63,	%l2
	srax	%o7,	%o4,	%g6
	addc	%g4,	0x15F8,	%g3
	movcs	%xcc,	%g2,	%g5
	smulcc	%i1,	%l0,	%g7
	srax	%g1,	%o1,	%o0
	nop
	set	0x66, %l1
	lduh	[%l7 + %l1],	%o3
	tgu	%xcc,	0x3
	fandnot2	%f14,	%f18,	%f26
	edge8	%o2,	%i3,	%i0
	srax	%l3,	%l6,	%l1
	fbe,a	%fcc3,	loop_2332
	sub	%i4,	0x03B7,	%l5
	edge8	%i5,	%i7,	%o6
	fmul8x16al	%f11,	%f13,	%f30
loop_2332:
	alignaddrl	%i6,	%l4,	%o5
	andn	%l2,	0x065B,	%i2
	ldsh	[%l7 + 0x7A],	%o7
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x15,	%f16
	set	0x3E, %g7
	stha	%o4,	[%l7 + %g7] 0x04
	movne	%icc,	%g4,	%g3
	sdivcc	%g6,	0x1595,	%g2
	bcc,a,pt	%xcc,	loop_2333
	fsrc2	%f18,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i1,	0x0E71,	%g5
loop_2333:
	tpos	%xcc,	0x4
	flush	%l7 + 0x54
	orcc	%l0,	%g1,	%o1
	udivx	%o0,	0x16F2,	%g7
	movrlez	%o2,	0x16F,	%i3
	membar	0x41
	movrlez	%o3,	%l3,	%i0
	xorcc	%l6,	%l1,	%l5
	addcc	%i5,	%i7,	%o6
	be,a,pn	%icc,	loop_2334
	ld	[%l7 + 0x64],	%f2
	fxnors	%f24,	%f21,	%f26
	fmul8ulx16	%f10,	%f6,	%f26
loop_2334:
	brgez,a	%i4,	loop_2335
	srax	%l4,	0x1E,	%i6
	sll	%l2,	%i2,	%o7
	nop
	setx loop_2336, %l0, %l1
	jmpl %l1, %o4
loop_2335:
	ldd	[%l7 + 0x58],	%g4
	mulx	%g3,	0x183B,	%g6
	ble	%xcc,	loop_2337
loop_2336:
	ld	[%l7 + 0x34],	%f25
	movrne	%o5,	%g2,	%g5
	movne	%xcc,	%i1,	%l0
loop_2337:
	nop
	setx	0xEF15072E1F9C5E20,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x35495B4DE4F92D7D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f30,	%f30
	edge32	%g1,	%o1,	%g7
	popc	0x15ED,	%o2
	set	0x8, %g4
	ldxa	[%g0 + %g4] 0x21,	%o0
	fmuld8ulx16	%f4,	%f7,	%f24
	bpos,a,pn	%icc,	loop_2338
	xnor	%i3,	%l3,	%i0
	movle	%icc,	%o3,	%l6
	tn	%icc,	0x7
loop_2338:
	alignaddrl	%l5,	%i5,	%l1
	sethi	0x01CF,	%i7
	and	%o6,	0x0670,	%i4
	fone	%f10
	stb	%i6,	[%l7 + 0x1B]
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x81,	 0x0
	xnor	%i2,	%l2,	%o4
	edge16ln	%o7,	%g3,	%g4
	membar	0x29
	addcc	%o5,	%g2,	%g5
	bgu,a,pn	%xcc,	loop_2339
	movrgez	%g6,	0x3AF,	%l0
	movleu	%xcc,	%i1,	%g1
	ld	[%l7 + 0x34],	%f17
loop_2339:
	andncc	%g7,	%o1,	%o2
	ldx	[%l7 + 0x18],	%o0
	fmovdn	%icc,	%f17,	%f2
	tsubcctv	%i3,	%l3,	%o3
	movg	%xcc,	%l6,	%i0
	udiv	%i5,	0x102D,	%l5
	sdivcc	%i7,	0x1258,	%o6
	fcmpgt16	%f16,	%f6,	%i4
	set	0x30, %g2
	lda	[%l7 + %g2] 0x88,	%f28
	fbug	%fcc0,	loop_2340
	popc	0x0389,	%l1
	set	0x58, %i6
	stha	%i6,	[%l7 + %i6] 0x0c
loop_2340:
	nop
	set	0x08, %o1
	stba	%l4,	[%l7 + %o1] 0x23
	membar	#Sync
	tl	%icc,	0x1
	orcc	%i2,	0x09F0,	%o4
	udiv	%o7,	0x1551,	%l2
	fpackfix	%f30,	%f7
	movne	%icc,	%g3,	%g4
	subccc	%g2,	0x11F6,	%o5
	ldd	[%l7 + 0x08],	%g4
	fandnot2s	%f3,	%f14,	%f23
	fpack16	%f0,	%f0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g6
	edge32n	%l0,	%g1,	%g7
	and	%o1,	%i1,	%o0
	fmovdgu	%xcc,	%f2,	%f21
	movl	%xcc,	%o2,	%i3
	sllx	%l3,	0x0A,	%o3
	lduh	[%l7 + 0x3E],	%i0
	movleu	%xcc,	%i5,	%l6
	ba,pn	%icc,	loop_2341
	array8	%i7,	%l5,	%i4
	addcc	%l1,	%o6,	%l4
	ldub	[%l7 + 0x4D],	%i6
loop_2341:
	fcmple16	%f18,	%f6,	%o4
	movgu	%xcc,	%i2,	%l2
	nop
	fitod	%f6,	%f2
	fdtoi	%f2,	%f15
	tleu	%icc,	0x4
	edge32	%o7,	%g3,	%g4
	lduh	[%l7 + 0x0A],	%o5
	subccc	%g5,	0x1CA5,	%g6
	nop
	setx	0x7A1E0A09E71C62B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC07313E415C1267C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f26,	%f2
	mulscc	%l0,	%g2,	%g7
	fnor	%f26,	%f24,	%f20
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x60] %asi,	%g0
	tle	%xcc,	0x0
	fbuge	%fcc0,	loop_2342
	ldub	[%l7 + 0x6C],	%o1
	fcmpeq32	%f16,	%f28,	%o0
	movrlez	%o2,	%i1,	%l3
loop_2342:
	tsubcc	%i3,	0x02E7,	%o3
	bne	%icc,	loop_2343
	tleu	%xcc,	0x5
	fmovsne	%icc,	%f23,	%f1
	movg	%icc,	%i0,	%l6
loop_2343:
	sdivx	%i5,	0x0ECA,	%l5
	edge16	%i7,	%i4,	%l1
	movgu	%icc,	%o6,	%l4
	alignaddr	%i6,	%o4,	%i2
	smul	%o7,	%g3,	%l2
	movn	%xcc,	%o5,	%g5
	fnands	%f27,	%f14,	%f7
	andn	%g6,	0x0F28,	%l0
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f8
	fxtod	%f8,	%f28
	fpsub32s	%f28,	%f28,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g2,	%g7,	%g4
	edge16l	%o1,	%g1,	%o0
	sethi	0x0EA3,	%i1
	addcc	%o2,	%i3,	%l3
	movcs	%xcc,	%i0,	%l6
	ldd	[%l7 + 0x48],	%f26
	fpadd16	%f10,	%f10,	%f10
	fsrc1	%f16,	%f16
	movrne	%o3,	0x2D8,	%l5
	edge32ln	%i7,	%i4,	%i5
	taddcc	%o6,	0x144C,	%l4
	tvc	%xcc,	0x3
	fmovdleu	%xcc,	%f2,	%f1
	set	0x74, %g6
	sta	%f30,	[%l7 + %g6] 0x88
	flush	%l7 + 0x20
	movrne	%l1,	%i6,	%i2
	fmovsg	%xcc,	%f9,	%f9
	movn	%icc,	%o4,	%o7
	fcmpne16	%f30,	%f16,	%l2
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x11,	%g3
	bleu,pt	%xcc,	loop_2344
	array32	%o5,	%g6,	%l0
	tle	%xcc,	0x3
	fcmpgt16	%f10,	%f0,	%g5
loop_2344:
	fxor	%f8,	%f20,	%f2
	edge8	%g2,	%g4,	%o1
	umul	%g7,	%o0,	%i1
	edge32ln	%o2,	%i3,	%g1
	edge8ln	%l3,	%l6,	%o3
	tcc	%xcc,	0x1
	tvc	%xcc,	0x0
	subcc	%i0,	%l5,	%i4
	movneg	%xcc,	%i5,	%i7
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x15,	 0x0
	ldd	[%l7 + 0x20],	%f20
	bne,a,pt	%icc,	loop_2345
	xorcc	%l1,	%i6,	%i2
	tne	%xcc,	0x3
	subccc	%o4,	%o6,	%o7
loop_2345:
	fnands	%f22,	%f17,	%f23
	fbg,a	%fcc0,	loop_2346
	movpos	%icc,	%g3,	%o5
	movrgez	%g6,	0x3A3,	%l0
	sdiv	%g5,	0x0E52,	%g2
loop_2346:
	movrlz	%l2,	0x139,	%g4
	fcmpgt32	%f8,	%f6,	%o1
	ldstub	[%l7 + 0x50],	%o0
	edge16n	%i1,	%g7,	%i3
	st	%f11,	[%l7 + 0x34]
	udivx	%g1,	0x09DD,	%l3
	andn	%o2,	%l6,	%o3
	edge32l	%l5,	%i0,	%i4
	udiv	%i5,	0x0DE5,	%i7
	fpsub16	%f20,	%f30,	%f6
	movrlz	%l4,	0x133,	%l1
	fmul8sux16	%f26,	%f18,	%f24
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x64] %asi,	%i6
	fmovdcc	%xcc,	%f31,	%f5
	fpack32	%f20,	%f8,	%f8
	fpadd16s	%f31,	%f18,	%f1
	xnor	%o4,	0x1275,	%i2
	subc	%o7,	%o6,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f10,	%f20,	%f14
	movrgez	%g6,	%l0,	%o5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x7C] %asi,	%f1
	fpsub32s	%f18,	%f8,	%f11
	tle	%xcc,	0x2
	tcc	%xcc,	0x6
	sub	%g5,	%l2,	%g4
	brnz	%o1,	loop_2347
	fors	%f1,	%f10,	%f27
	srlx	%g2,	%i1,	%g7
	srax	%o0,	%i3,	%l3
loop_2347:
	fblg	%fcc0,	loop_2348
	sethi	0x1988,	%o2
	nop
	setx	0xF293294A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x1D7C3E96,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f22,	%f18
	tcc	%icc,	0x6
loop_2348:
	xorcc	%l6,	%o3,	%g1
	fpsub32s	%f18,	%f1,	%f12
	umulcc	%l5,	0x0015,	%i0
	nop
	setx loop_2349, %l0, %l1
	jmpl %l1, %i4
	bne	%xcc,	loop_2350
	array32	%i7,	%i5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2349:
	stbar
loop_2350:
	tneg	%xcc,	0x6
	tcc	%icc,	0x5
	fmovrsgez	%i6,	%f4,	%f21
	stb	%o4,	[%l7 + 0x4C]
	edge32l	%i2,	%l4,	%o6
	xnorcc	%g3,	0x051E,	%g6
	udivcc	%l0,	0x1B2A,	%o7
	tge	%xcc,	0x2
	tle	%icc,	0x5
	nop
	fitos	%f5,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f18
	bgu,pn	%xcc,	loop_2351
	alignaddrl	%o5,	%l2,	%g5
	brlz,a	%o1,	loop_2352
	bn,a	loop_2353
loop_2351:
	fand	%f6,	%f22,	%f10
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f0
loop_2352:
	fornot2	%f4,	%f0,	%f24
loop_2353:
	taddcc	%g2,	%g4,	%i1
	tn	%icc,	0x3
	add	%o0,	0x1656,	%i3
	fnegd	%f22,	%f12
	fmovrsgz	%g7,	%f13,	%f17
	subccc	%l3,	0x02A4,	%l6
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbe	%fcc3,	loop_2354
	fands	%f27,	%f13,	%f29
	popc	%o3,	%o2
	andcc	%g1,	%i0,	%i4
loop_2354:
	srax	%i7,	0x15,	%l5
	srlx	%i5,	0x1A,	%l1
	nop
	setx	0x63E61BB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xA0956CDC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f18,	%f20
	tne	%xcc,	0x5
	sdiv	%o4,	0x1011,	%i2
	flush	%l7 + 0x14
	alignaddrl	%i6,	%o6,	%l4
	andcc	%g6,	%l0,	%o7
	fmovdcc	%xcc,	%f8,	%f14
	edge32ln	%g3,	%o5,	%l2
	mova	%xcc,	%o1,	%g2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%g5
	fmul8ulx16	%f12,	%f0,	%f2
	bcs,a,pn	%xcc,	loop_2355
	srlx	%g4,	0x0E,	%i1
	movgu	%xcc,	%i3,	%o0
	ld	[%l7 + 0x6C],	%f0
loop_2355:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	tsubcc	%l3,	%l6,	%o2
	bcs,a,pn	%xcc,	loop_2356
	fmovdpos	%icc,	%f26,	%f0
	srax	%o3,	0x01,	%i0
	prefetch	[%l7 + 0x14],	 0x3
loop_2356:
	andcc	%i4,	0x0091,	%g1
	fmuld8ulx16	%f5,	%f3,	%f0
	and	%l5,	%i7,	%l1
	bne,a,pt	%xcc,	loop_2357
	addc	%o4,	0x0E64,	%i5
	movne	%xcc,	%i6,	%i2
	tsubcc	%o6,	0x172F,	%l4
loop_2357:
	pdist	%f24,	%f2,	%f12
	tge	%xcc,	0x5
	ble,a	%icc,	loop_2358
	movrgez	%g6,	%l0,	%o7
	andn	%o5,	%l2,	%g3
	edge16n	%g2,	%g5,	%g4
loop_2358:
	nop
	set	0x1A, %i3
	ldsba	[%l7 + %i3] 0x89,	%o1
	mova	%xcc,	%i1,	%i3
	call	loop_2359
	taddcc	%o0,	0x170C,	%g7
	fnor	%f14,	%f20,	%f2
	add	%l3,	0x1EB1,	%l6
loop_2359:
	tvs	%xcc,	0x0
	tleu	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x40] %asi,	%o3
	edge8l	%i0,	%o2,	%i4
	addccc	%g1,	%l5,	%i7
	popc	%l1,	%o4
	fbu,a	%fcc2,	loop_2360
	orcc	%i6,	%i5,	%i2
	fones	%f6
	udivx	%o6,	0x1DA5,	%g6
loop_2360:
	srax	%l4,	%l0,	%o5
	stw	%o7,	[%l7 + 0x64]
	tg	%xcc,	0x7
	fpmerge	%f0,	%f15,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x0
	fbug	%fcc0,	loop_2361
	movge	%icc,	%g3,	%g2
	nop
	setx	loop_2362,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8sux16	%f26,	%f14,	%f8
loop_2361:
	edge8	%g5,	%g4,	%o1
	addcc	%i1,	0x17B3,	%l2
loop_2362:
	bvc,a,pn	%icc,	loop_2363
	fbue	%fcc3,	loop_2364
	movne	%xcc,	%i3,	%g7
	ld	[%l7 + 0x54],	%f6
loop_2363:
	subc	%l3,	%l6,	%o3
loop_2364:
	sethi	0x0FCB,	%i0
	tl	%xcc,	0x0
	tg	%icc,	0x2
	ldsh	[%l7 + 0x42],	%o0
	swap	[%l7 + 0x50],	%o2
	subccc	%i4,	%g1,	%i7
	umul	%l5,	%l1,	%o4
	fmovrdgez	%i6,	%f30,	%f6
	nop
	fitos	%f3,	%f12
	fstox	%f12,	%f8
	movpos	%xcc,	%i2,	%o6
	sllx	%g6,	0x01,	%i5
	nop
	setx	0x2BF6D9E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x3239B202,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f15,	%f16
	tcs	%icc,	0x6
	stx	%l0,	[%l7 + 0x78]
	fcmpne32	%f4,	%f2,	%o5
	smulcc	%l4,	%o7,	%g3
	andn	%g5,	0x1D86,	%g2
	smul	%g4,	0x0608,	%o1
	andn	%i1,	%l2,	%g7
	fmovdcs	%icc,	%f14,	%f29
	brlez,a	%l3,	loop_2365
	movrne	%i3,	%o3,	%l6
	edge32	%o0,	%i0,	%o2
	set	0x1C, %o5
	ldsha	[%l7 + %o5] 0x15,	%g1
loop_2365:
	te	%xcc,	0x6
	wr	%g0,	0x10,	%asi
	sta	%f2,	[%l7 + 0x20] %asi
	fnot1s	%f6,	%f11
	mova	%xcc,	%i7,	%l5
	bshuffle	%f10,	%f30,	%f12
	nop
	setx	0x8EE993D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f7
	subcc	%i4,	%l1,	%i6
	fabsd	%f4,	%f12
	tpos	%icc,	0x0
	movge	%icc,	%o4,	%o6
	fnors	%f14,	%f4,	%f27
	flush	%l7 + 0x58
	fmul8ulx16	%f6,	%f22,	%f26
	fmovsvc	%icc,	%f19,	%f8
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f20
	orncc	%g6,	0x0633,	%i2
	ldsb	[%l7 + 0x1F],	%l0
	umul	%i5,	0x07AB,	%l4
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f8
	fxtos	%f8,	%f13
	stb	%o5,	[%l7 + 0x10]
	subcc	%g3,	%g5,	%g2
	nop
	fitos	%f24,	%f21
	movg	%icc,	%o7,	%o1
	fbule,a	%fcc2,	loop_2366
	fmovdleu	%xcc,	%f13,	%f10
	wr	%g0,	0x11,	%asi
	stxa	%i1,	[%l7 + 0x08] %asi
loop_2366:
	membar	0x48
	smul	%g4,	%l2,	%l3
	nop
	set	0x48, %o0
	std	%f30,	[%l7 + %o0]
	sth	%i3,	[%l7 + 0x2E]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%l6
	umul	%o0,	%i0,	%o3
	xor	%g1,	0x1B73,	%o2
	array16	%i7,	%l5,	%i4
	edge8ln	%l1,	%i6,	%o4
	movre	%g6,	0x2C1,	%i2
	movl	%icc,	%l0,	%o6
	fmovdg	%xcc,	%f1,	%f22
	movg	%xcc,	%l4,	%i5
	popc	%o5,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g2,	[%l7 + 0x26]
	umulcc	%o7,	0x1E2A,	%g5
	ldsb	[%l7 + 0x15],	%i1
	andcc	%o1,	0x0FBF,	%g4
	orn	%l2,	%l3,	%g7
	call	loop_2367
	movvs	%xcc,	%l6,	%i3
	udivx	%o0,	0x0258,	%o3
	sdiv	%i0,	0x0526,	%o2
loop_2367:
	movvs	%xcc,	%g1,	%l5
	nop
	setx	0x22663F1D27569926,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xED2DEEEE02E3DBD1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f10
	fmovspos	%icc,	%f1,	%f5
	andncc	%i7,	%i4,	%l1
	fnors	%f20,	%f27,	%f30
	st	%f31,	[%l7 + 0x64]
	brz,a	%i6,	loop_2368
	nop
	setx	0x2FE2FC08,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xC19B9BDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f1,	%f12
	edge16l	%g6,	%o4,	%i2
	orcc	%o6,	%l4,	%l0
loop_2368:
	nop
	set	0x18, %l3
	sta	%f20,	[%l7 + %l3] 0x80
	movgu	%icc,	%o5,	%i5
	call	loop_2369
	tpos	%xcc,	0x6
	edge16	%g2,	%o7,	%g5
	subcc	%g3,	0x0213,	%i1
loop_2369:
	movneg	%xcc,	%o1,	%g4
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x10,	%l2
	popc	0x1727,	%l2
	srax	%g7,	0x00,	%l6
	edge16ln	%o0,	%o3,	%i3
	movrlez	%i0,	0x111,	%g1
	tcs	%xcc,	0x2
	fbul,a	%fcc3,	loop_2370
	stw	%o2,	[%l7 + 0x2C]
	srl	%l5,	%i4,	%l1
	smul	%i6,	%g6,	%i7
loop_2370:
	nop
	setx	loop_2371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%i2,	%o6,	%l4
	sub	%o4,	0x144A,	%l0
	nop
	setx	loop_2372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2371:
	movrgz	%i5,	0x29A,	%g2
	umul	%o5,	0x011A,	%g5
	edge32n	%g3,	%i1,	%o7
loop_2372:
	brnz,a	%o1,	loop_2373
	fnand	%f14,	%f10,	%f28
	tpos	%xcc,	0x5
	movre	%g4,	%l2,	%g7
loop_2373:
	orncc	%l3,	%l6,	%o0
	fmul8sux16	%f2,	%f28,	%f20
	wr	%g0,	0x10,	%asi
	stwa	%o3,	[%l7 + 0x28] %asi
	sllx	%i0,	0x17,	%i3
	tle	%xcc,	0x0
	movvs	%icc,	%o2,	%g1
	ld	[%l7 + 0x50],	%f16
	xnorcc	%i4,	%l5,	%i6
	fcmpeq32	%f16,	%f6,	%g6
	fxnors	%f16,	%f5,	%f24
	fnot1	%f18,	%f12
	array16	%l1,	%i2,	%o6
	tgu	%icc,	0x6
	array16	%l4,	%o4,	%i7
	movvc	%icc,	%i5,	%g2
	mulx	%o5,	%l0,	%g3
	srl	%g5,	0x12,	%o7
	wr	%g0,	0x2b,	%asi
	stwa	%o1,	[%l7 + 0x08] %asi
	membar	#Sync
	andn	%i1,	0x0D6B,	%g4
	fbule,a	%fcc0,	loop_2374
	fmul8sux16	%f6,	%f30,	%f10
	st	%f23,	[%l7 + 0x40]
	xorcc	%g7,	%l2,	%l3
loop_2374:
	fmul8x16au	%f21,	%f20,	%f18
	tvs	%icc,	0x3
	andcc	%l6,	0x017A,	%o0
	nop
	fitod	%f0,	%f16
	fdtoi	%f16,	%f21
	fandnot2	%f4,	%f26,	%f30
	movrlz	%i0,	%o3,	%o2
	srax	%g1,	%i4,	%l5
	fands	%f8,	%f17,	%f11
	movrlz	%i3,	%i6,	%l1
	fbne	%fcc2,	loop_2375
	orncc	%g6,	0x00F7,	%i2
	subcc	%l4,	0x1621,	%o4
	taddcctv	%o6,	0x1B5B,	%i5
loop_2375:
	fmuld8ulx16	%f29,	%f27,	%f24
	ldx	[%l7 + 0x58],	%i7
	fbe	%fcc0,	loop_2376
	sth	%o5,	[%l7 + 0x64]
	tsubcctv	%g2,	%g3,	%l0
	ld	[%l7 + 0x24],	%f25
loop_2376:
	andn	%g5,	%o1,	%o7
	udivx	%g4,	0x08A1,	%g7
	ldd	[%l7 + 0x08],	%i0
	fnands	%f31,	%f31,	%f27
	nop
	setx	0xD14B2D0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x0D903306,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f21,	%f2
	brgz	%l2,	loop_2377
	fmovsvc	%xcc,	%f28,	%f17
	xorcc	%l6,	%o0,	%i0
	sdivx	%l3,	0x1DB2,	%o3
loop_2377:
	fands	%f26,	%f2,	%f31
	tgu	%icc,	0x6
	movpos	%icc,	%g1,	%i4
	movre	%o2,	%i3,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l5,	%l1
	edge16l	%i2,	%g6,	%o4
	fnegs	%f8,	%f2
	movrlz	%l4,	%o6,	%i7
	fbl	%fcc3,	loop_2378
	edge8n	%o5,	%i5,	%g3
	edge32	%l0,	%g2,	%o1
	fmovdcc	%xcc,	%f13,	%f26
loop_2378:
	fones	%f0
	tneg	%icc,	0x0
	smul	%o7,	%g4,	%g5
	and	%g7,	0x0BB7,	%l2
	addc	%i1,	%l6,	%o0
	ldsh	[%l7 + 0x78],	%i0
	wr	%g0,	0xeb,	%asi
	stha	%o3,	[%l7 + 0x60] %asi
	membar	#Sync
	xnor	%g1,	%i4,	%l3
	bneg	%xcc,	loop_2379
	move	%xcc,	%i3,	%i6
	subc	%o2,	0x0526,	%l1
	fornot1	%f22,	%f18,	%f2
loop_2379:
	movge	%xcc,	%i2,	%l5
	fmovrdlez	%g6,	%f8,	%f26
	tne	%xcc,	0x6
	andn	%o4,	0x1AAA,	%l4
	addcc	%i7,	%o6,	%o5
	bge,pt	%icc,	loop_2380
	fnand	%f12,	%f22,	%f16
	tcs	%icc,	0x6
	fmovrsgez	%i5,	%f29,	%f30
loop_2380:
	ta	%icc,	0x0
	movrlz	%g3,	%l0,	%g2
	ldd	[%l7 + 0x38],	%o0
	udivx	%o7,	0x1C44,	%g4
	subccc	%g5,	%g7,	%l2
	mulx	%l6,	0x144E,	%o0
	subcc	%i0,	%o3,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i1,	%l3
	xorcc	%i4,	0x0E97,	%i6
	fbug	%fcc3,	loop_2381
	movle	%icc,	%o2,	%l1
	ldd	[%l7 + 0x20],	%f28
	tcc	%icc,	0x4
loop_2381:
	fbl,a	%fcc0,	loop_2382
	sir	0x14D0
	call	loop_2383
	ldstub	[%l7 + 0x69],	%i2
loop_2382:
	array16	%i3,	%g6,	%o4
	movre	%l5,	%i7,	%l4
loop_2383:
	tl	%icc,	0x2
	set	0x7A, %g3
	ldsba	[%l7 + %g3] 0x80,	%o5
	sir	0x144E
	orcc	%o6,	0x0C6B,	%g3
	brz,a	%l0,	loop_2384
	fbul,a	%fcc0,	loop_2385
	or	%g2,	%o1,	%o7
	fmul8sux16	%f16,	%f22,	%f18
loop_2384:
	tg	%xcc,	0x2
loop_2385:
	nop
	setx	0x5059805F,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	fcmpeq16	%f4,	%f28,	%i5
	ta	%xcc,	0x0
	movre	%g5,	%g4,	%g7
	brz	%l2,	loop_2386
	fmovrsgez	%l6,	%f26,	%f0
	sll	%o0,	0x0A,	%o3
	edge32	%g1,	%i1,	%i0
loop_2386:
	fzeros	%f23
	flush	%l7 + 0x4C
	alignaddr	%i4,	%l3,	%o2
	call	loop_2387
	fbu	%fcc1,	loop_2388
	movrgez	%l1,	0x164,	%i2
	tg	%icc,	0x4
loop_2387:
	nop
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1f,	%f16
loop_2388:
	subc	%i3,	%g6,	%o4
	nop
	setx	0xCF2C6EE8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f28
	bcc,a,pn	%xcc,	loop_2389
	fabsd	%f6,	%f28
	nop
	setx	0x2726FE16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x6CDD7054,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f14,	%f30
	call	loop_2390
loop_2389:
	subccc	%i6,	%i7,	%l5
	fbn	%fcc1,	loop_2391
	andn	%l4,	%o5,	%g3
loop_2390:
	fands	%f15,	%f22,	%f19
	te	%xcc,	0x0
loop_2391:
	movvs	%xcc,	%o6,	%g2
	sdivcc	%l0,	0x0468,	%o1
	te	%icc,	0x7
	tg	%icc,	0x0
	movpos	%xcc,	%i5,	%o7
	bge,pt	%xcc,	loop_2392
	brlez,a	%g4,	loop_2393
	movpos	%xcc,	%g7,	%l2
	tsubcctv	%l6,	%o0,	%o3
loop_2392:
	fors	%f19,	%f27,	%f13
loop_2393:
	sra	%g1,	%i1,	%i0
	sethi	0x01EE,	%i4
	tl	%xcc,	0x1
	mulx	%g5,	%o2,	%l1
	brlz,a	%l3,	loop_2394
	subccc	%i3,	%i2,	%o4
	edge32ln	%i6,	%i7,	%g6
	edge32	%l5,	%l4,	%o5
loop_2394:
	movgu	%icc,	%o6,	%g2
	movge	%icc,	%l0,	%g3
	orn	%i5,	0x14DB,	%o1
	nop
	setx	loop_2395,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x1527
	sdiv	%o7,	0x1AC1,	%g7
	tsubcctv	%g4,	%l6,	%o0
loop_2395:
	umul	%l2,	%o3,	%g1
	wr	%g0,	0x21,	%asi
	stxa	%i1,	[%g0 + 0x10] %asi
	brlz	%i4,	loop_2396
	bcc,a,pt	%icc,	loop_2397
	sethi	0x1E71,	%g5
	bge,a,pt	%icc,	loop_2398
loop_2396:
	fmovrsne	%i0,	%f4,	%f30
loop_2397:
	edge16n	%l1,	%l3,	%o2
	tsubcctv	%i3,	%o4,	%i2
loop_2398:
	orcc	%i7,	0x19E8,	%g6
	nop
	setx	0xC449D501,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f2
	addccc	%i6,	0x0AA9,	%l5
	nop
	setx loop_2399, %l0, %l1
	jmpl %l1, %o5
	edge16n	%l4,	%o6,	%l0
	taddcctv	%g2,	0x1443,	%i5
	movrgz	%g3,	0x0DC,	%o1
loop_2399:
	movle	%xcc,	%g7,	%o7
	bgu,pn	%xcc,	loop_2400
	nop
	setx	0x89DE608B142172A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x78AF8DDFFC83AEED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f18,	%f16
	edge16	%l6,	%g4,	%l2
	nop
	fitos	%f13,	%f4
loop_2400:
	nop
	setx	loop_2401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f3
	andn	%o3,	%g1,	%o0
	udivcc	%i4,	0x19FD,	%i1
loop_2401:
	sethi	0x16DA,	%i0
	fbl	%fcc2,	loop_2402
	tn	%icc,	0x1
	fpadd16	%f0,	%f12,	%f26
	sdiv	%g5,	0x1318,	%l3
loop_2402:
	ta	%icc,	0x5
	udivx	%o2,	0x01F2,	%l1
	mova	%xcc,	%i3,	%i2
	te	%icc,	0x2
	fandnot1s	%f30,	%f18,	%f16
	ldsh	[%l7 + 0x14],	%o4
	movn	%xcc,	%g6,	%i6
	swap	[%l7 + 0x54],	%i7
	sethi	0x0834,	%l5
	ldsb	[%l7 + 0x67],	%o5
	umul	%o6,	%l4,	%g2
	umulcc	%i5,	%g3,	%l0
	tvc	%icc,	0x4
	fnot1s	%f13,	%f23
	fbue,a	%fcc3,	loop_2403
	popc	%o1,	%g7
	set	0x40, %o4
	lda	[%l7 + %o4] 0x18,	%f20
loop_2403:
	sdivcc	%o7,	0x189E,	%l6
	fmovdvc	%icc,	%f15,	%f5
	fnand	%f2,	%f2,	%f2
	movg	%icc,	%l2,	%g4
	umul	%o3,	%o0,	%g1
	tvs	%xcc,	0x5
	movvs	%icc,	%i4,	%i1
	stw	%i0,	[%l7 + 0x68]
	fmovdle	%icc,	%f23,	%f31
	sllx	%g5,	0x1D,	%l3
	tcs	%icc,	0x6
	tvs	%xcc,	0x6
	set	0x46, %l5
	ldsba	[%l7 + %l5] 0x14,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc0,	loop_2404
	nop
	setx	0x2DF773DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x00D8AA1E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f9,	%f27
	tneg	%xcc,	0x1
	sir	0x1637
loop_2404:
	tvc	%xcc,	0x2
	fbge	%fcc2,	loop_2405
	movpos	%icc,	%l1,	%i2
	tne	%icc,	0x6
	nop
	setx	loop_2406,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2405:
	edge16ln	%o4,	%g6,	%i3
	srlx	%i7,	%i6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2406:
	fbne	%fcc1,	loop_2407
	ta	%xcc,	0x4
	fmovde	%xcc,	%f14,	%f1
	movrlez	%l5,	0x2CC,	%o6
loop_2407:
	fornot1	%f16,	%f30,	%f28
	taddcctv	%l4,	%i5,	%g3
	orcc	%l0,	%o1,	%g7
	fsrc1s	%f7,	%f4
	taddcc	%g2,	%l6,	%l2
	tge	%xcc,	0x7
	tcs	%xcc,	0x7
	sir	0x1202
	tsubcctv	%o7,	0x1624,	%o3
	swap	[%l7 + 0x70],	%o0
	tleu	%xcc,	0x4
	movcs	%icc,	%g4,	%g1
	sdivx	%i4,	0x0AED,	%i0
	ldsh	[%l7 + 0x58],	%i1
	movn	%icc,	%g5,	%o2
	addc	%l1,	%i2,	%o4
	tle	%icc,	0x1
	sll	%l3,	0x0B,	%i3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	bg,a,pn	%xcc,	loop_2408
	fbo,a	%fcc3,	loop_2409
	fexpand	%f21,	%f8
	wr	%g0,	0x04,	%asi
	stwa	%i7,	[%l7 + 0x48] %asi
loop_2408:
	umul	%o5,	%l5,	%o6
loop_2409:
	umulcc	%i6,	%i5,	%l4
	prefetch	[%l7 + 0x34],	 0x3
	sdiv	%l0,	0x0576,	%o1
	nop
	setx	0xAC8649B5A3419938,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2F5F6202E2445985,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f30,	%f8
	bleu	loop_2410
	movneg	%icc,	%g3,	%g2
	mulx	%l6,	%g7,	%o7
	fmovsvs	%icc,	%f17,	%f7
loop_2410:
	te	%xcc,	0x0
	andn	%l2,	%o0,	%o3
	edge32	%g1,	%g4,	%i4
	array32	%i0,	%g5,	%i1
	nop
	fitod	%f25,	%f24
	tvs	%xcc,	0x7
	umulcc	%l1,	0x0597,	%i2
	edge32ln	%o4,	%o2,	%l3
	nop
	setx	0x43938EFB407AC768,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	andcc	%i3,	%i7,	%o5
	fble,a	%fcc3,	loop_2411
	mova	%xcc,	%l5,	%o6
	array8	%g6,	%i6,	%i5
	andcc	%l0,	%o1,	%l4
loop_2411:
	nop
	wr	%g0,	0x2a,	%asi
	stba	%g3,	[%l7 + 0x41] %asi
	membar	#Sync
	fbu	%fcc2,	loop_2412
	mulx	%l6,	0x0FB6,	%g2
	mova	%xcc,	%g7,	%o7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x48] %asi,	%f28
loop_2412:
	lduh	[%l7 + 0x5C],	%o0
	alignaddr	%o3,	%l2,	%g1
	edge16ln	%i4,	%g4,	%i0
	bgu,a,pn	%xcc,	loop_2413
	edge32ln	%g5,	%l1,	%i1
	fone	%f18
	sdivcc	%o4,	0x10DC,	%o2
loop_2413:
	tne	%icc,	0x4
	andn	%l3,	0x18ED,	%i3
	tvc	%xcc,	0x7
	subccc	%i7,	%i2,	%l5
	movrgz	%o5,	0x00E,	%o6
	umulcc	%g6,	0x186E,	%i5
	sll	%l0,	%i6,	%o1
	edge32l	%l4,	%l6,	%g2
	addccc	%g7,	%g3,	%o7
	tpos	%xcc,	0x4
	fpsub16	%f0,	%f30,	%f0
	nop
	setx	loop_2414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%o3,	0x09,	%o0
	fxor	%f30,	%f22,	%f6
	subccc	%g1,	%l2,	%g4
loop_2414:
	subccc	%i0,	0x0548,	%i4
	fbo	%fcc0,	loop_2415
	fmovdleu	%xcc,	%f31,	%f5
	mulscc	%g5,	%l1,	%i1
	movg	%xcc,	%o4,	%l3
loop_2415:
	movg	%xcc,	%o2,	%i7
	array32	%i2,	%i3,	%l5
	fsrc1s	%f27,	%f24
	addccc	%o6,	0x0B53,	%o5
	lduw	[%l7 + 0x14],	%g6
	tcc	%xcc,	0x2
	nop
	fitos	%f5,	%f12
	fstox	%f12,	%f20
	tleu	%icc,	0x3
	edge32	%i5,	%l0,	%o1
	stb	%i6,	[%l7 + 0x6D]
	fmovrdgz	%l4,	%f18,	%f0
	fmovrdlz	%l6,	%f26,	%f12
	movleu	%icc,	%g7,	%g2
	addcc	%g3,	0x1880,	%o3
	bleu,a	%icc,	loop_2416
	move	%xcc,	%o0,	%g1
	st	%f14,	[%l7 + 0x10]
	fble,a	%fcc3,	loop_2417
loop_2416:
	movvc	%xcc,	%l2,	%g4
	fnand	%f24,	%f10,	%f8
	udivx	%o7,	0x0584,	%i4
loop_2417:
	array16	%g5,	%l1,	%i1
	nop
	set	0x32, %i7
	ldsh	[%l7 + %i7],	%i0
	tgu	%icc,	0x4
	bg,a	%icc,	loop_2418
	edge8ln	%o4,	%l3,	%i7
	movrlz	%o2,	0x01E,	%i3
	bcc,pt	%icc,	loop_2419
loop_2418:
	srax	%l5,	%o6,	%i2
	fsrc2s	%f6,	%f11
	sdivx	%o5,	0x0DEC,	%g6
loop_2419:
	bvs,a	%xcc,	loop_2420
	array32	%i5,	%o1,	%l0
	sdivx	%i6,	0x07EE,	%l6
	fbne	%fcc1,	loop_2421
loop_2420:
	bl	%icc,	loop_2422
	movle	%icc,	%l4,	%g2
	srlx	%g7,	%g3,	%o0
loop_2421:
	tg	%icc,	0x3
loop_2422:
	fpackfix	%f14,	%f27
	stw	%g1,	[%l7 + 0x50]
	bcs	%icc,	loop_2423
	movne	%xcc,	%o3,	%g4
	edge8n	%l2,	%o7,	%i4
	sth	%l1,	[%l7 + 0x1E]
loop_2423:
	smul	%i1,	0x1781,	%g5
	wr	%g0,	0x88,	%asi
	stwa	%o4,	[%l7 + 0x60] %asi
	add	%l3,	0x1995,	%i0
	movrlz	%i7,	0x234,	%o2
	move	%icc,	%i3,	%l5
	nop
	setx	0x0F0A3A8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xCA7AC6D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f9,	%f28
	edge8	%i2,	%o6,	%g6
	bn	%icc,	loop_2424
	fpsub16s	%f10,	%f8,	%f0
	movre	%o5,	0x39E,	%o1
	nop
	setx	0xF09A4A9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f16
loop_2424:
	movpos	%xcc,	%i5,	%i6
	fmovdl	%xcc,	%f16,	%f19
	fmovdge	%icc,	%f22,	%f4
	fnand	%f8,	%f28,	%f12
	tn	%xcc,	0x0
	sdivx	%l6,	0x1B25,	%l4
	edge16n	%g2,	%l0,	%g3
	udiv	%g7,	0x1E41,	%g1
	for	%f0,	%f6,	%f18
	smulcc	%o0,	%o3,	%g4
	movn	%xcc,	%l2,	%o7
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	tg	%xcc,	0x7
	subccc	%i1,	0x112D,	%g5
	ldstub	[%l7 + 0x56],	%o4
	be,a,pt	%icc,	loop_2425
	fbl,a	%fcc1,	loop_2426
	ldub	[%l7 + 0x57],	%l3
	sdivx	%i0,	0x1632,	%i7
loop_2425:
	tge	%xcc,	0x1
loop_2426:
	stbar
	tvs	%xcc,	0x6
	fornot1	%f14,	%f24,	%f16
	fmovdne	%icc,	%f29,	%f3
	movne	%icc,	%o2,	%i3
	movne	%icc,	%l5,	%i4
	edge8n	%i2,	%o6,	%g6
	sth	%o1,	[%l7 + 0x7A]
	fbge,a	%fcc1,	loop_2427
	fmovda	%icc,	%f23,	%f13
	fnot1	%f6,	%f26
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x34] %asi,	%o5
loop_2427:
	sdivcc	%i6,	0x02DB,	%l6
	fnegd	%f14,	%f2
	nop
	setx	0x29AD587B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xC5DADEEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f19,	%f30
	srax	%i5,	%l4,	%l0
	edge32n	%g2,	%g7,	%g1
	srlx	%g3,	0x1B,	%o3
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ldd	[%l7 + 0x18],	%f2
	ldsw	[%l7 + 0x48],	%o0
	fmovdpos	%icc,	%f12,	%f5
	xnorcc	%g4,	0x09B2,	%o7
	andcc	%l1,	%l2,	%i1
	subcc	%g5,	0x106A,	%l3
	srax	%o4,	0x02,	%i0
	movn	%xcc,	%i7,	%i3
	fcmpgt32	%f6,	%f22,	%l5
	stx	%o2,	[%l7 + 0x48]
	fmuld8ulx16	%f2,	%f29,	%f26
	subcc	%i4,	%o6,	%g6
	nop
	setx	loop_2428,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x2
	bvs,a,pn	%icc,	loop_2429
	fmovsvs	%icc,	%f25,	%f25
loop_2428:
	edge32	%i2,	%o1,	%o5
	movcs	%xcc,	%l6,	%i6
loop_2429:
	nop
	setx loop_2430, %l0, %l1
	jmpl %l1, %l4
	movneg	%xcc,	%l0,	%g2
	nop
	setx	0x56C6B238718902F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2D47EC887AFAD56D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f10,	%f30
	udiv	%i5,	0x1771,	%g1
loop_2430:
	sll	%g3,	%o3,	%g7
	fbn,a	%fcc2,	loop_2431
	xorcc	%o0,	0x187E,	%o7
	sll	%g4,	0x0E,	%l2
	xorcc	%i1,	0x141F,	%g5
loop_2431:
	bcc,pt	%icc,	loop_2432
	bvc,a,pn	%icc,	loop_2433
	tneg	%xcc,	0x2
	tle	%icc,	0x3
loop_2432:
	xnor	%l1,	%l3,	%o4
loop_2433:
	srlx	%i7,	0x0C,	%i3
	umulcc	%i0,	0x1DAE,	%o2
	taddcctv	%i4,	0x14FD,	%l5
	fmovsneg	%xcc,	%f17,	%f6
	fbl	%fcc3,	loop_2434
	addccc	%g6,	0x1E27,	%o6
	bneg,a,pt	%icc,	loop_2435
	srlx	%o1,	0x17,	%o5
loop_2434:
	ld	[%l7 + 0x70],	%f13
	swap	[%l7 + 0x68],	%l6
loop_2435:
	bcc,pn	%xcc,	loop_2436
	brlz,a	%i2,	loop_2437
	call	loop_2438
	mulx	%i6,	0x1262,	%l0
loop_2436:
	nop
	set	0x6A, %g5
	ldsha	[%l7 + %g5] 0x89,	%g2
loop_2437:
	be,pn	%icc,	loop_2439
loop_2438:
	smulcc	%l4,	0x1149,	%i5
	fmul8x16	%f30,	%f14,	%f8
	fbge	%fcc0,	loop_2440
loop_2439:
	sra	%g3,	0x05,	%g1
	add	%g7,	0x10E2,	%o3
	edge16ln	%o7,	%o0,	%g4
loop_2440:
	edge8ln	%l2,	%i1,	%g5
	array32	%l3,	%o4,	%i7
	wr	%g0,	0x88,	%asi
	stxa	%l1,	[%l7 + 0x50] %asi
	umulcc	%i3,	%i0,	%o2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x32] %asi,	%l5
	smulcc	%i4,	0x0E4D,	%o6
	movle	%icc,	%o1,	%o5
	std	%f18,	[%l7 + 0x40]
	ta	%icc,	0x1
	fbue,a	%fcc2,	loop_2441
	fmovrsgz	%l6,	%f3,	%f0
	fbo	%fcc3,	loop_2442
	fbule	%fcc2,	loop_2443
loop_2441:
	fpadd32	%f20,	%f16,	%f16
	bge,pt	%xcc,	loop_2444
loop_2442:
	nop
	fitod	%f8,	%f8
	fdtoi	%f8,	%f7
loop_2443:
	sll	%i2,	%g6,	%l0
	udivx	%g2,	0x0947,	%l4
loop_2444:
	tn	%xcc,	0x2
	sub	%i6,	0x07A0,	%i5
	nop
	fitos	%f19,	%f28
	bgu,a	loop_2445
	edge8ln	%g3,	%g1,	%o3
	xorcc	%o7,	0x057A,	%o0
	alignaddr	%g4,	%g7,	%l2
loop_2445:
	movrlz	%g5,	%l3,	%i1
	bn,a,pt	%xcc,	loop_2446
	tle	%xcc,	0x4
	bl,a,pn	%icc,	loop_2447
	be,a	%icc,	loop_2448
loop_2446:
	fbl	%fcc0,	loop_2449
	movcc	%icc,	%i7,	%o4
loop_2447:
	movleu	%icc,	%i3,	%l1
loop_2448:
	addcc	%i0,	%o2,	%i4
loop_2449:
	xorcc	%o6,	0x0283,	%l5
	subccc	%o1,	0x1B4D,	%l6
	orcc	%i2,	%g6,	%o5
	tle	%xcc,	0x6
	fmovsvs	%icc,	%f21,	%f20
	fmovsle	%xcc,	%f31,	%f24
	fmovdvs	%xcc,	%f18,	%f6
	tvc	%icc,	0x2
	edge16	%g2,	%l4,	%l0
	movneg	%icc,	%i6,	%i5
	fandnot1s	%f10,	%f26,	%f23
	fandnot2s	%f19,	%f3,	%f12
	or	%g3,	0x14A2,	%g1
	udivx	%o3,	0x066E,	%o0
	fmul8sux16	%f20,	%f24,	%f26
	bneg,a	loop_2450
	nop
	fitos	%f10,	%f8
	fstod	%f8,	%f4
	udivx	%o7,	0x1964,	%g4
	movrgz	%g7,	%l2,	%l3
loop_2450:
	sth	%g5,	[%l7 + 0x7E]
	tsubcc	%i7,	0x06CB,	%o4
	movrlz	%i3,	0x0D0,	%l1
	tcc	%icc,	0x2
	fmovsvc	%xcc,	%f7,	%f26
	movn	%icc,	%i0,	%i1
	array16	%i4,	%o2,	%o6
	add	%l5,	0x195E,	%l6
	addccc	%i2,	0x03B2,	%g6
	xnorcc	%o1,	%o5,	%g2
	smulcc	%l0,	%i6,	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x11,	%g3,	%l4
	array32	%g1,	%o3,	%o7
	addc	%g4,	%o0,	%l2
	tle	%icc,	0x6
	xorcc	%l3,	0x1D52,	%g5
	tn	%icc,	0x6
	flush	%l7 + 0x08
	or	%g7,	0x152D,	%o4
	fnand	%f0,	%f28,	%f10
	set	0x40, %i1
	stxa	%i7,	[%l7 + %i1] 0x2b
	membar	#Sync
	tvs	%xcc,	0x0
	faligndata	%f6,	%f10,	%f24
	movrlez	%l1,	%i0,	%i3
	smulcc	%i4,	0x016F,	%i1
	sdiv	%o2,	0x1141,	%o6
	orncc	%l6,	%l5,	%i2
	fmovdleu	%icc,	%f8,	%f17
	edge32	%o1,	%o5,	%g2
	fbuge	%fcc1,	loop_2451
	movl	%icc,	%l0,	%g6
	sdivx	%i6,	0x0803,	%g3
	andncc	%l4,	%g1,	%i5
loop_2451:
	tneg	%icc,	0x4
	alignaddrl	%o7,	%o3,	%o0
	edge32	%l2,	%l3,	%g4
	bge	%icc,	loop_2452
	edge8n	%g5,	%g7,	%o4
	brgez,a	%l1,	loop_2453
	sub	%i7,	0x0322,	%i3
loop_2452:
	movre	%i4,	0x3D3,	%i0
	tg	%icc,	0x4
loop_2453:
	fornot1	%f6,	%f10,	%f30
	fzeros	%f2
	srax	%i1,	0x0A,	%o6
	fcmple16	%f4,	%f26,	%o2
	fmovrdlez	%l5,	%f6,	%f10
	edge16l	%l6,	%i2,	%o5
	tcs	%xcc,	0x7
	fmovsgu	%xcc,	%f24,	%f28
	tleu	%xcc,	0x2
	fbge	%fcc0,	loop_2454
	sth	%g2,	[%l7 + 0x72]
	fmovrdgz	%o1,	%f0,	%f18
	fmovde	%xcc,	%f0,	%f14
loop_2454:
	nop
	set	0x62, %o2
	stha	%l0,	[%l7 + %o2] 0x22
	membar	#Sync
	sethi	0x134B,	%i6
	alignaddr	%g3,	%g6,	%l4
	st	%f25,	[%l7 + 0x78]
	taddcctv	%i5,	%g1,	%o7
	tneg	%icc,	0x3
	tn	%xcc,	0x3
	fmovda	%icc,	%f29,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o0,	[%l7 + 0x7C]
	edge16	%l2,	%o3,	%g4
	nop
	fitos	%f14,	%f30
	fstoi	%f30,	%f10
	fbl	%fcc0,	loop_2455
	bl,a	%xcc,	loop_2456
	te	%xcc,	0x2
	ldub	[%l7 + 0x1E],	%g5
loop_2455:
	srax	%l3,	%g7,	%o4
loop_2456:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i7
	movrlz	%i3,	0x3E1,	%i4
	fabsd	%f18,	%f10
	tvc	%icc,	0x3
	edge8ln	%i0,	%l1,	%i1
	fpadd32s	%f18,	%f22,	%f31
	udivcc	%o2,	0x143E,	%l5
	movcc	%xcc,	%o6,	%l6
	movl	%xcc,	%o5,	%g2
	move	%xcc,	%o1,	%i2
	movvc	%xcc,	%i6,	%g3
	bpos,a,pn	%icc,	loop_2457
	nop
	setx	0xA06DF2D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fmovs	%f19,	%f1
	umul	%g6,	%l0,	%l4
loop_2457:
	tcs	%xcc,	0x6
	fmovrsgez	%i5,	%f15,	%f0
	nop
	setx	0xE70E442A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xF47871FC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f7,	%f18
	subcc	%o7,	%o0,	%g1
	movcs	%xcc,	%l2,	%g4
	brz,a	%o3,	loop_2458
	xorcc	%l3,	0x02D5,	%g5
	addcc	%o4,	0x050A,	%i7
	fmovsleu	%icc,	%f21,	%f22
loop_2458:
	movpos	%xcc,	%g7,	%i3
	edge16n	%i4,	%l1,	%i1
	movcc	%icc,	%i0,	%l5
	set	0x20, %o7
	ldswa	[%l7 + %o7] 0x14,	%o2
	movpos	%xcc,	%o6,	%l6
	addccc	%g2,	%o5,	%i2
	fmovscs	%icc,	%f13,	%f13
	bpos	loop_2459
	edge8	%i6,	%g3,	%o1
	sllx	%g6,	%l4,	%l0
	tge	%icc,	0x3
loop_2459:
	bleu,pn	%icc,	loop_2460
	st	%f20,	[%l7 + 0x6C]
	fnot2	%f14,	%f24
	fzero	%f18
loop_2460:
	sir	0x1B84
	edge8	%o7,	%i5,	%o0
	mova	%icc,	%l2,	%g4
	fbug	%fcc0,	loop_2461
	edge8l	%o3,	%l3,	%g1
	orncc	%g5,	0x1A09,	%o4
	set	0x60, %l0
	stha	%i7,	[%l7 + %l0] 0x89
loop_2461:
	bpos	loop_2462
	srax	%i3,	0x02,	%g7
	fmovscc	%xcc,	%f30,	%f1
	bleu,a	loop_2463
loop_2462:
	fnegd	%f24,	%f18
	bn,a,pn	%icc,	loop_2464
	sllx	%i4,	%l1,	%i0
loop_2463:
	nop
	setx	0x1D903FD4C41866B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x054D79981B8E1161,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f4,	%f24
	umulcc	%i1,	0x0ABD,	%l5
loop_2464:
	mulscc	%o6,	0x158D,	%l6
	movcs	%icc,	%o2,	%o5
	ldub	[%l7 + 0x5C],	%i2
	alignaddrl	%i6,	%g3,	%g2
	tge	%xcc,	0x7
	fmovsleu	%icc,	%f2,	%f5
	srax	%g6,	0x06,	%l4
	tvc	%xcc,	0x2
	fcmpeq16	%f18,	%f0,	%l0
	fbn	%fcc0,	loop_2465
	movpos	%xcc,	%o7,	%o1
	fmovdg	%icc,	%f1,	%f21
	sdivx	%i5,	0x1D18,	%l2
loop_2465:
	fnot1s	%f24,	%f27
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x44] %asi,	%o0
	tl	%icc,	0x2
	fmovsl	%xcc,	%f3,	%f22
	swap	[%l7 + 0x78],	%o3
	nop
	setx	loop_2466,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%l3,	0x0A96,	%g4
	taddcctv	%g5,	0x00A0,	%o4
	swap	[%l7 + 0x5C],	%i7
loop_2466:
	edge16ln	%i3,	%g1,	%g7
	brgez	%i4,	loop_2467
	orn	%i0,	%i1,	%l1
	addccc	%o6,	0x063A,	%l5
	edge16l	%o2,	%l6,	%i2
loop_2467:
	sllx	%i6,	%o5,	%g2
	fpsub32s	%f5,	%f4,	%f5
	subc	%g6,	0x009B,	%l4
	move	%xcc,	%l0,	%g3
	array16	%o7,	%i5,	%o1
	and	%l2,	%o3,	%o0
	edge32ln	%l3,	%g4,	%o4
	fbl,a	%fcc2,	loop_2468
	edge16n	%i7,	%g5,	%i3
	fmovdneg	%icc,	%f28,	%f10
	set	0x2D, %l4
	stba	%g7,	[%l7 + %l4] 0x14
loop_2468:
	sra	%g1,	%i0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f8,	%f24,	%l1
	brz,a	%i1,	loop_2469
	xnorcc	%l5,	%o6,	%o2
	movrgz	%i2,	%i6,	%l6
	alignaddrl	%o5,	%g6,	%g2
loop_2469:
	sethi	0x0B2C,	%l4
	edge8n	%g3,	%l0,	%i5
	subcc	%o1,	%l2,	%o3
	movrlez	%o0,	0x2E5,	%l3
	tcc	%icc,	0x6
	subcc	%g4,	0x02D2,	%o7
	edge32l	%i7,	%o4,	%i3
	fmovsg	%xcc,	%f5,	%f4
	fblg	%fcc0,	loop_2470
	sdiv	%g5,	0x0D6A,	%g7
	smulcc	%g1,	0x0538,	%i4
	srlx	%l1,	%i0,	%l5
loop_2470:
	addccc	%i1,	%o6,	%o2
	xnorcc	%i2,	%i6,	%l6
	movg	%xcc,	%o5,	%g2
	fsrc1s	%f0,	%f9
	array16	%l4,	%g6,	%g3
	sllx	%i5,	0x04,	%l0
	movge	%icc,	%l2,	%o3
	fbn	%fcc3,	loop_2471
	udiv	%o0,	0x1C54,	%o1
	fpack32	%f2,	%f24,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2471:
	popc	%l3,	%g4
	edge32n	%o7,	%i7,	%o4
	movvs	%icc,	%i3,	%g5
	tge	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x79] %asi,	%g1
	sir	0x07F6
	nop
	fitos	%f14,	%f18
	fstox	%f18,	%f20
	edge32n	%g7,	%i4,	%l1
	movvc	%icc,	%i0,	%l5
	set	0x0B, %i4
	stba	%o6,	[%l7 + %i4] 0x81
	bshuffle	%f16,	%f10,	%f28
	add	%i1,	%o2,	%i6
	lduw	[%l7 + 0x2C],	%l6
	fbe,a	%fcc0,	loop_2472
	edge32n	%o5,	%g2,	%i2
	edge32n	%l4,	%g3,	%g6
	srlx	%l0,	%i5,	%l2
loop_2472:
	membar	0x35
	nop
	setx	0x1AB95EF3E384897B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x671623999148B019,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f8,	%f0
	nop
	setx	0x260833E28C48A1C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC4328945C00C50A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f30,	%f4
	tvc	%xcc,	0x3
	tvs	%xcc,	0x2
	tn	%xcc,	0x1
	lduw	[%l7 + 0x58],	%o3
	nop
	fitos	%f4,	%f22
	fstox	%f22,	%f16
	xor	%o1,	%l3,	%g4
	fmovrdne	%o7,	%f18,	%f18
	tvs	%icc,	0x4
	fbu,a	%fcc1,	loop_2473
	ldd	[%l7 + 0x70],	%f20
	fcmpgt16	%f6,	%f6,	%i7
	sll	%o0,	%i3,	%g5
loop_2473:
	edge8	%o4,	%g1,	%i4
	add	%l1,	0x0EE3,	%g7
	movre	%l5,	%o6,	%i1
	bn,pn	%icc,	loop_2474
	movvc	%icc,	%i0,	%i6
	addcc	%l6,	%o2,	%o5
	bpos,pn	%icc,	loop_2475
loop_2474:
	edge16n	%g2,	%i2,	%l4
	taddcctv	%g3,	%g6,	%l0
	fbul	%fcc2,	loop_2476
loop_2475:
	fsrc2	%f2,	%f6
	fandnot1	%f20,	%f4,	%f16
	tl	%xcc,	0x7
loop_2476:
	movg	%icc,	%l2,	%o3
	alignaddr	%i5,	%o1,	%l3
	edge16l	%g4,	%i7,	%o7
	mova	%icc,	%o0,	%i3
	fxors	%f10,	%f30,	%f15
	movle	%icc,	%g5,	%g1
	umul	%o4,	0x0D19,	%l1
	sllx	%i4,	0x1A,	%g7
	sir	0x00DA
	smulcc	%l5,	0x1CCE,	%o6
	tg	%xcc,	0x6
	movl	%xcc,	%i1,	%i6
	sll	%l6,	%o2,	%o5
	tne	%xcc,	0x7
	tle	%xcc,	0x3
	tsubcctv	%g2,	0x0B12,	%i2
	movg	%icc,	%l4,	%i0
	fxor	%f20,	%f16,	%f28
	xorcc	%g6,	%g3,	%l0
	array16	%l2,	%o3,	%i5
	udivx	%o1,	0x1354,	%l3
	bge,pn	%xcc,	loop_2477
	alignaddrl	%g4,	%o7,	%o0
	tne	%xcc,	0x4
	taddcctv	%i7,	0x1A5B,	%i3
loop_2477:
	addcc	%g5,	%g1,	%o4
	fmovsa	%xcc,	%f4,	%f16
	edge16l	%i4,	%l1,	%l5
	taddcctv	%o6,	0x164D,	%g7
	fmovrdlez	%i6,	%f14,	%f2
	movvs	%xcc,	%i1,	%o2
	sll	%o5,	0x15,	%l6
	be,pt	%icc,	loop_2478
	sir	0x10EB
	edge32l	%i2,	%g2,	%l4
	fmovsne	%icc,	%f21,	%f19
loop_2478:
	movvc	%xcc,	%g6,	%i0
	movvs	%icc,	%g3,	%l0
	sdivcc	%o3,	0x1917,	%i5
	fble,a	%fcc0,	loop_2479
	fnegs	%f26,	%f12
	tsubcctv	%o1,	0x1AF2,	%l2
	sra	%l3,	%o7,	%g4
loop_2479:
	fbe,a	%fcc3,	loop_2480
	xor	%i7,	0x08B4,	%i3
	popc	0x011A,	%o0
	sethi	0x1949,	%g5
loop_2480:
	sethi	0x0114,	%o4
	tge	%xcc,	0x7
	sll	%g1,	0x1B,	%l1
	subcc	%i4,	0x1D24,	%o6
	movrlez	%g7,	0x1AA,	%l5
	movcs	%icc,	%i6,	%i1
	edge8n	%o2,	%o5,	%l6
	movge	%icc,	%g2,	%l4
	umul	%i2,	%i0,	%g3
	fnot1s	%f27,	%f28
	edge8ln	%g6,	%l0,	%i5
	popc	0x136C,	%o3
	sub	%l2,	%o1,	%o7
	movneg	%icc,	%g4,	%i7
	tle	%icc,	0x5
	edge16	%i3,	%o0,	%g5
	movneg	%xcc,	%o4,	%g1
	edge32	%l1,	%l3,	%o6
	movleu	%icc,	%i4,	%l5
	srl	%i6,	0x1E,	%i1
	bleu,a	loop_2481
	sdivx	%g7,	0x007E,	%o5
	nop
	setx	0x733AAE31,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f30
	sdivx	%l6,	0x1FEF,	%o2
loop_2481:
	srax	%l4,	0x1E,	%g2
	srl	%i0,	%i2,	%g3
	edge16ln	%g6,	%l0,	%o3
	edge32	%l2,	%i5,	%o7
	orn	%g4,	0x110B,	%o1
	tneg	%xcc,	0x4
	fcmple32	%f28,	%f4,	%i3
	mova	%icc,	%i7,	%g5
	add	%o4,	0x177E,	%g1
	bg,a,pt	%xcc,	loop_2482
	fmovdgu	%xcc,	%f29,	%f23
	alignaddrl	%o0,	%l3,	%l1
	movrlez	%i4,	0x23D,	%o6
loop_2482:
	ldd	[%l7 + 0x30],	%l4
	swap	[%l7 + 0x64],	%i1
	array16	%g7,	%i6,	%o5
	fbl	%fcc1,	loop_2483
	ta	%icc,	0x0
	fmuld8ulx16	%f25,	%f20,	%f6
	faligndata	%f28,	%f8,	%f10
loop_2483:
	bneg	loop_2484
	tleu	%icc,	0x4
	tge	%xcc,	0x5
	stb	%l6,	[%l7 + 0x41]
loop_2484:
	nop
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x19,	%f0
	movvc	%xcc,	%o2,	%l4
	sir	0x1598
	tg	%icc,	0x6
	swap	[%l7 + 0x6C],	%g2
	fmovsvs	%xcc,	%f0,	%f30
	sdivx	%i0,	0x1790,	%i2
	alignaddr	%g3,	%g6,	%o3
	nop
	setx	loop_2485,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%l0,	%i5,	%l2
	set	0x30, %l1
	stwa	%g4,	[%l7 + %l1] 0xeb
	membar	#Sync
loop_2485:
	nop
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x0c,	%o7
	movrgez	%i3,	0x307,	%o1
	tvc	%xcc,	0x1
	edge32n	%g5,	%i7,	%o4
	prefetch	[%l7 + 0x70],	 0x3
	umul	%o0,	0x1EED,	%l3
	and	%g1,	0x0006,	%l1
	tg	%xcc,	0x5
	nop
	fitod	%f25,	%f28
	wr	%g0,	0x04,	%asi
	stba	%i4,	[%l7 + 0x7B] %asi
	movrlz	%l5,	%o6,	%i1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	fabsd	%f20,	%f22
	movne	%xcc,	%g7,	%o5
	ta	%icc,	0x3
	fmovsvs	%icc,	%f15,	%f0
	sethi	0x1819,	%l6
	andn	%o2,	%l4,	%g2
	fnot2s	%f17,	%f10
	fmovdvs	%xcc,	%f19,	%f13
	movn	%icc,	%i0,	%g3
	sethi	0x016B,	%g6
	set	0x48, %g7
	lduha	[%l7 + %g7] 0x18,	%i2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%l0
	edge32ln	%i5,	%l2,	%o3
	tn	%xcc,	0x0
	nop
	setx	0xA01312B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xB412E47D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f8,	%f13
	array8	%o7,	%g4,	%i3
	brlz	%o1,	loop_2486
	edge32ln	%i7,	%o4,	%o0
	mova	%xcc,	%l3,	%g1
	fpack16	%f24,	%f19
loop_2486:
	tsubcc	%g5,	0x1CEA,	%l1
	tne	%xcc,	0x0
	edge8l	%i4,	%l5,	%o6
	andn	%i1,	0x08EC,	%i6
	fmovscs	%icc,	%f16,	%f15
	xnorcc	%g7,	0x118D,	%o5
	bn,a,pn	%icc,	loop_2487
	umulcc	%l6,	0x0EFF,	%l4
	set	0x5E, %g4
	ldsba	[%l7 + %g4] 0x88,	%g2
loop_2487:
	fornot2s	%f26,	%f28,	%f28
	tcs	%icc,	0x6
	tn	%icc,	0x7
	umulcc	%o2,	0x1F73,	%i0
	ldd	[%l7 + 0x38],	%g2
	fmovdne	%icc,	%f10,	%f30
	bg,pn	%icc,	loop_2488
	tg	%icc,	0x7
	movcc	%icc,	%g6,	%i2
	bpos,pn	%xcc,	loop_2489
loop_2488:
	alignaddrl	%i5,	%l0,	%o3
	te	%xcc,	0x0
	fornot1s	%f13,	%f21,	%f24
loop_2489:
	nop
	setx	0x56A417CCC7A77225,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x3BE1FE07D8513A41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f24,	%f14
	fmovspos	%xcc,	%f10,	%f5
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f18
	fmul8x16au	%f18,	%f17,	%f16
	fmovdpos	%icc,	%f31,	%f18
	bg,a	%icc,	loop_2490
	fmovscs	%xcc,	%f3,	%f15
	orn	%l2,	%g4,	%o7
	fbn	%fcc3,	loop_2491
loop_2490:
	fble	%fcc0,	loop_2492
	edge16	%i3,	%i7,	%o4
	fornot2s	%f12,	%f27,	%f29
loop_2491:
	andncc	%o1,	%l3,	%g1
loop_2492:
	fmovdn	%icc,	%f1,	%f0
	bvs,a,pt	%icc,	loop_2493
	taddcctv	%o0,	0x1FF0,	%l1
	fabss	%f9,	%f30
	movn	%xcc,	%i4,	%l5
loop_2493:
	srax	%g5,	0x14,	%i1
	fzero	%f26
	wr	%g0,	0x22,	%asi
	stxa	%o6,	[%l7 + 0x20] %asi
	membar	#Sync
	fmovspos	%xcc,	%f21,	%f9
	fmovsvc	%xcc,	%f28,	%f25
	tvs	%xcc,	0x3
	bcs,a	loop_2494
	fmovsneg	%icc,	%f15,	%f24
	fmovdgu	%xcc,	%f0,	%f27
	fpackfix	%f2,	%f14
loop_2494:
	fzeros	%f6
	ba,a	loop_2495
	udiv	%g7,	0x1A3C,	%o5
	movrlz	%l6,	%l4,	%g2
	tle	%icc,	0x0
loop_2495:
	edge16ln	%i6,	%i0,	%o2
	fmovspos	%xcc,	%f3,	%f19
	popc	%g6,	%g3
	movvs	%icc,	%i5,	%l0
	fmovdvc	%xcc,	%f19,	%f7
	edge16n	%i2,	%l2,	%o3
	edge8	%o7,	%i3,	%i7
	nop
	setx	0x7923B637,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x4B385F10,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f17,	%f14
	fors	%f19,	%f30,	%f20
	movvs	%icc,	%g4,	%o4
	pdist	%f24,	%f6,	%f2
	fmovdvc	%icc,	%f16,	%f2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbu	%fcc2,	loop_2496
	ldub	[%l7 + 0x57],	%o1
	tsubcc	%l3,	%o0,	%l1
	add	%i4,	0x1A52,	%g1
loop_2496:
	udivcc	%g5,	0x1CF5,	%i1
	tcs	%xcc,	0x6
	fmovdcc	%icc,	%f3,	%f26
	orn	%o6,	%g7,	%l5
	movvs	%icc,	%o5,	%l6
	tle	%xcc,	0x5
	sth	%l4,	[%l7 + 0x10]
	edge32ln	%i6,	%g2,	%o2
	udivcc	%i0,	0x026A,	%g6
	set	0x28, %l6
	stxa	%g3,	[%l7 + %l6] 0x18
	movn	%xcc,	%i5,	%i2
	or	%l0,	0x1D01,	%o3
	movg	%xcc,	%l2,	%o7
	fba,a	%fcc3,	loop_2497
	fmovdpos	%icc,	%f10,	%f18
	tcs	%xcc,	0x7
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
loop_2497:
	edge32n	%i3,	%o4,	%o1
	fbn	%fcc3,	loop_2498
	movcc	%icc,	%g4,	%l3
	udiv	%l1,	0x1635,	%o0
	xnor	%i4,	%g1,	%i1
loop_2498:
	tle	%icc,	0x5
	edge8	%g5,	%o6,	%l5
	umulcc	%g7,	%o5,	%l4
	tvs	%xcc,	0x3
	bpos	%icc,	loop_2499
	smul	%l6,	0x1E05,	%g2
	tsubcctv	%i6,	0x1F1D,	%i0
	fbue,a	%fcc3,	loop_2500
loop_2499:
	movvs	%icc,	%o2,	%g6
	std	%f14,	[%l7 + 0x48]
	tcs	%xcc,	0x0
loop_2500:
	fzero	%f20
	movge	%icc,	%g3,	%i2
	umul	%i5,	0x0878,	%l0
	movle	%xcc,	%l2,	%o3
	fxnor	%f0,	%f30,	%f30
	move	%xcc,	%o7,	%i3
	fmuld8ulx16	%f26,	%f7,	%f0
	addccc	%o4,	%i7,	%o1
	tleu	%icc,	0x7
	tle	%icc,	0x1
	andn	%g4,	0x1700,	%l1
	fbe,a	%fcc2,	loop_2501
	fmovsne	%icc,	%f2,	%f14
	fandnot2s	%f21,	%f13,	%f10
	bcc,a,pn	%icc,	loop_2502
loop_2501:
	fnegs	%f5,	%f3
	set	0x24, %l2
	lduwa	[%l7 + %l2] 0x15,	%o0
loop_2502:
	fpadd16s	%f10,	%f30,	%f25
	tgu	%icc,	0x3
	udivx	%i4,	0x1961,	%g1
	fmovrslz	%i1,	%f29,	%f24
	movre	%g5,	0x0A3,	%l3
	umulcc	%o6,	%g7,	%l5
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x11,	%o5
	edge8	%l6,	%l4,	%g2
	fmovrdne	%i6,	%f28,	%f24
	or	%i0,	%g6,	%g3
	fmovde	%xcc,	%f11,	%f18
	nop
	fitos	%f0,	%f5
	fstox	%f5,	%f8
	fxtos	%f8,	%f18
	sdivx	%o2,	0x0777,	%i2
	edge16	%l0,	%i5,	%o3
	movge	%icc,	%l2,	%o7
	sllx	%i3,	0x0E,	%i7
	movpos	%xcc,	%o1,	%o4
	edge8n	%g4,	%l1,	%i4
	ta	%xcc,	0x5
	nop
	fitos	%f4,	%f0
	fstox	%f0,	%f16
	edge8	%g1,	%o0,	%i1
	tpos	%icc,	0x1
	wr	%g0,	0xeb,	%asi
	stwa	%g5,	[%l7 + 0x08] %asi
	membar	#Sync
	smul	%l3,	%g7,	%l5
	stbar
	fbue,a	%fcc3,	loop_2503
	bcs	%icc,	loop_2504
	fmovda	%xcc,	%f30,	%f30
	orncc	%o6,	0x1845,	%l6
loop_2503:
	fpadd16s	%f13,	%f24,	%f2
loop_2504:
	array8	%o5,	%g2,	%l4
	tne	%xcc,	0x4
	xorcc	%i6,	%g6,	%g3
	fmovdvc	%xcc,	%f21,	%f2
	alignaddrl	%o2,	%i0,	%i2
	addc	%l0,	%i5,	%o3
	edge16ln	%o7,	%i3,	%i7
	taddcc	%l2,	%o4,	%o1
	fcmpeq16	%f12,	%f16,	%l1
	bvc,pt	%icc,	loop_2505
	fmovsneg	%xcc,	%f14,	%f7
	fone	%f24
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g1
loop_2505:
	movcc	%xcc,	%g4,	%o0
	bneg,a	%xcc,	loop_2506
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f28
	udiv	%i1,	0x133F,	%g5
	xor	%g7,	0x1858,	%l5
loop_2506:
	movvs	%xcc,	%l3,	%l6
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x17
	membar	#Sync
	tvs	%icc,	0x2
	or	%o6,	%o5,	%l4
	movneg	%xcc,	%g2,	%g6
	addccc	%i6,	%o2,	%g3
	nop
	set	0x4F, %g6
	stb	%i2,	[%l7 + %g6]
	movne	%xcc,	%l0,	%i5
	edge8ln	%i0,	%o7,	%o3
	stbar
	set	0x2E, %g2
	ldstuba	[%l7 + %g2] 0x81,	%i3
	edge8n	%l2,	%o4,	%o1
	movrgez	%i7,	%l1,	%g1
	fmovrdlez	%i4,	%f26,	%f22
	bg,a	loop_2507
	subc	%g4,	%o0,	%i1
	fxors	%f9,	%f7,	%f12
	tsubcc	%g7,	0x0BD3,	%l5
loop_2507:
	andncc	%l3,	%g5,	%l6
	umulcc	%o6,	0x00B6,	%l4
	edge32n	%g2,	%g6,	%i6
	fandnot1s	%f24,	%f7,	%f7
	fbge,a	%fcc3,	loop_2508
	srl	%o5,	%g3,	%o2
	movn	%xcc,	%i2,	%l0
	edge32	%i5,	%i0,	%o7
loop_2508:
	tsubcc	%o3,	%l2,	%o4
	sdiv	%i3,	0x0432,	%i7
	andcc	%o1,	%g1,	%l1
	movl	%xcc,	%i4,	%g4
	add	%o0,	0x05FE,	%g7
	tcs	%xcc,	0x2
	movl	%icc,	%i1,	%l5
	prefetch	[%l7 + 0x1C],	 0x0
	orncc	%l3,	0x079A,	%g5
	fmul8x16	%f17,	%f6,	%f22
	nop
	fitos	%f4,	%f7
	fstox	%f7,	%f2
	st	%f14,	[%l7 + 0x6C]
	fmovrslz	%l6,	%f29,	%f10
	tleu	%icc,	0x2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l4,	%o6
	fbu,a	%fcc3,	loop_2509
	movcc	%icc,	%g6,	%g2
	tpos	%xcc,	0x5
	fpsub32s	%f23,	%f27,	%f4
loop_2509:
	subccc	%o5,	%i6,	%g3
	tn	%xcc,	0x3
	fpadd16s	%f21,	%f7,	%f4
	srlx	%i2,	%o2,	%i5
	te	%icc,	0x4
	srax	%l0,	%i0,	%o3
	tge	%xcc,	0x5
	xnor	%o7,	%l2,	%i3
	tl	%xcc,	0x0
	andcc	%o4,	0x1C3E,	%o1
	fpadd32	%f0,	%f10,	%f8
	srax	%g1,	0x03,	%l1
	tsubcctv	%i4,	0x0472,	%g4
	edge8ln	%o0,	%i7,	%i1
	fbue	%fcc3,	loop_2510
	edge8n	%g7,	%l5,	%g5
	movvs	%xcc,	%l6,	%l3
	tsubcctv	%l4,	%g6,	%o6
loop_2510:
	nop
	fitos	%f0,	%f3
	fstox	%f3,	%f18
	orncc	%o5,	0x1617,	%i6
	movg	%xcc,	%g2,	%i2
	fcmpne16	%f20,	%f22,	%o2
	movrgez	%i5,	%l0,	%i0
	tcc	%icc,	0x1
	brnz,a	%g3,	loop_2511
	sll	%o7,	0x12,	%l2
	edge32n	%o3,	%i3,	%o1
	andncc	%o4,	%g1,	%l1
loop_2511:
	movl	%icc,	%g4,	%o0
	tneg	%xcc,	0x1
	array8	%i7,	%i4,	%g7
	xnor	%l5,	0x0B2A,	%g5
	ldx	[%l7 + 0x60],	%i1
	smul	%l3,	0x09D2,	%l6
	sir	0x181A
	brlz	%g6,	loop_2512
	fmovse	%xcc,	%f15,	%f2
	orcc	%o6,	%l4,	%o5
	movge	%icc,	%i6,	%g2
loop_2512:
	andn	%o2,	0x1526,	%i5
	fbule,a	%fcc1,	loop_2513
	nop
	setx	0xF6BA4266C06D9A03,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fand	%f30,	%f16,	%f14
	fornot1s	%f4,	%f1,	%f5
loop_2513:
	mova	%icc,	%l0,	%i0
	wr	%g0,	0x0c,	%asi
	stba	%g3,	[%l7 + 0x4A] %asi
	set	0x68, %o6
	stxa	%o7,	[%l7 + %o6] 0x23
	membar	#Sync
	movl	%icc,	%l2,	%i2
	subc	%o3,	0x0AB0,	%o1
	movrne	%i3,	%g1,	%l1
	movleu	%xcc,	%o4,	%o0
	orcc	%i7,	0x0704,	%i4
	movn	%icc,	%g4,	%g7
	movrgz	%g5,	%l5,	%l3
	fbuge	%fcc2,	loop_2514
	fmovrdgz	%i1,	%f24,	%f22
	sllx	%g6,	%l6,	%o6
	edge32n	%o5,	%i6,	%l4
loop_2514:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o2
	fmul8ulx16	%f24,	%f20,	%f30
	fblg	%fcc2,	loop_2515
	ba	%xcc,	loop_2516
	movcs	%icc,	%i5,	%g2
	fmovdg	%icc,	%f9,	%f26
loop_2515:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2516:
	movrne	%i0,	0x255,	%g3
	umul	%l0,	%o7,	%l2
	brlz,a	%o3,	loop_2517
	orcc	%o1,	%i2,	%i3
	edge32n	%g1,	%l1,	%o0
	movre	%i7,	0x0D9,	%i4
loop_2517:
	nop
	fitod	%f21,	%f14
	edge16l	%o4,	%g4,	%g5
	movneg	%xcc,	%l5,	%l3
	array32	%i1,	%g7,	%g6
	srlx	%o6,	%o5,	%i6
	movvc	%icc,	%l4,	%o2
	bvc	loop_2518
	mulscc	%l6,	%g2,	%i5
	flush	%l7 + 0x30
	ld	[%l7 + 0x3C],	%f4
loop_2518:
	orncc	%g3,	%i0,	%o7
	sethi	0x180D,	%l2
	nop
	setx loop_2519, %l0, %l1
	jmpl %l1, %l0
	ldsh	[%l7 + 0x76],	%o3
	sllx	%i2,	%i3,	%o1
	bpos,pt	%xcc,	loop_2520
loop_2519:
	edge32n	%g1,	%o0,	%l1
	and	%i4,	%i7,	%o4
	fmovdvs	%icc,	%f8,	%f24
loop_2520:
	udiv	%g5,	0x07F6,	%g4
	nop
	fitos	%f13,	%f18
	array16	%l3,	%l5,	%g7
	tsubcc	%i1,	%o6,	%o5
	orncc	%g6,	%l4,	%i6
	fcmpeq32	%f0,	%f10,	%l6
	sdiv	%g2,	0x12B0,	%o2
	movvc	%xcc,	%g3,	%i0
	fmovdl	%icc,	%f4,	%f29
	fmovsleu	%icc,	%f2,	%f10
	udiv	%i5,	0x1774,	%l2
	taddcctv	%l0,	%o7,	%o3
	ba,a,pt	%icc,	loop_2521
	tcs	%xcc,	0x1
	addc	%i3,	%i2,	%o1
	swap	[%l7 + 0x40],	%g1
loop_2521:
	tneg	%icc,	0x7
	fcmple32	%f20,	%f28,	%o0
	sra	%i4,	0x08,	%i7
	fmovsvc	%xcc,	%f20,	%f26
	nop
	fitod	%f6,	%f8
	edge32	%o4,	%l1,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f1,	%f2
	fstod	%f2,	%f28
	bvs,a	%icc,	loop_2522
	xnor	%l3,	0x17C3,	%l5
	udivx	%g4,	0x1324,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2522:
	fblg	%fcc2,	loop_2523
	udivcc	%g7,	0x12F3,	%o5
	sllx	%g6,	0x17,	%o6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%i6
loop_2523:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x18] %asi,	%l4
	fcmpeq32	%f6,	%f0,	%l6
	be,pt	%icc,	loop_2524
	bg,a	loop_2525
	ldsh	[%l7 + 0x60],	%o2
	tcc	%icc,	0x7
loop_2524:
	fble,a	%fcc0,	loop_2526
loop_2525:
	nop
	setx loop_2527, %l0, %l1
	jmpl %l1, %g3
	sdivcc	%g2,	0x0262,	%i0
	edge32	%l2,	%i5,	%o7
loop_2526:
	nop
	set	0x22, %o3
	ldstub	[%l7 + %o3],	%o3
loop_2527:
	fbu	%fcc0,	loop_2528
	fnand	%f6,	%f16,	%f12
	nop
	setx	0xF9688475A0712C69,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fmovsg	%icc,	%f20,	%f24
loop_2528:
	tpos	%icc,	0x1
	tcc	%xcc,	0x5
	fmovrslz	%i3,	%f22,	%f10
	movrgez	%l0,	%i2,	%o1
	fmovdg	%xcc,	%f0,	%f11
	ldsw	[%l7 + 0x24],	%g1
	fbue	%fcc0,	loop_2529
	xor	%i4,	%i7,	%o0
	lduh	[%l7 + 0x6C],	%o4
	tl	%icc,	0x6
loop_2529:
	ldsw	[%l7 + 0x54],	%l1
	orn	%l3,	%g5,	%g4
	edge32ln	%i1,	%l5,	%g7
	sth	%o5,	[%l7 + 0x30]
	fbge,a	%fcc1,	loop_2530
	tgu	%xcc,	0x0
	umulcc	%g6,	0x0815,	%o6
	ldub	[%l7 + 0x57],	%i6
loop_2530:
	tvc	%icc,	0x2
	tg	%xcc,	0x3
	wr	%g0,	0x4f,	%asi
	stxa	%l4,	[%g0 + 0x30] %asi
	move	%xcc,	%o2,	%l6
	brlez,a	%g2,	loop_2531
	bl,a,pt	%icc,	loop_2532
	fbul	%fcc1,	loop_2533
	sra	%i0,	0x06,	%l2
loop_2531:
	fcmpeq16	%f28,	%f18,	%i5
loop_2532:
	subc	%o7,	%o3,	%g3
loop_2533:
	udivx	%i3,	0x1CE1,	%i2
	lduw	[%l7 + 0x14],	%o1
	nop
	set	0x2C, %o5
	sth	%l0,	[%l7 + %o5]
	tl	%xcc,	0x0
	subc	%i4,	%i7,	%o0
	edge16ln	%o4,	%l1,	%l3
	movrlez	%g5,	0x1B0,	%g4
	tsubcc	%i1,	%l5,	%g7
	taddcc	%o5,	0x15C2,	%g1
	nop
	setx	loop_2534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%icc,	%o6,	%g6
	fmovsa	%xcc,	%f16,	%f5
	movge	%icc,	%l4,	%i6
loop_2534:
	movge	%xcc,	%l6,	%o2
	ldd	[%l7 + 0x30],	%g2
	addcc	%l2,	0x04B0,	%i0
	tg	%icc,	0x3
	ldd	[%l7 + 0x38],	%f30
	subc	%i5,	0x1223,	%o3
	fpmerge	%f24,	%f27,	%f20
	movvc	%icc,	%g3,	%i3
	array16	%o7,	%i2,	%o1
	fmovrsgz	%l0,	%f2,	%f26
	movg	%xcc,	%i7,	%i4
	fabsd	%f22,	%f26
	fbuge,a	%fcc2,	loop_2535
	movgu	%icc,	%o4,	%l1
	movneg	%icc,	%l3,	%g5
	edge32l	%g4,	%o0,	%l5
loop_2535:
	bpos,pt	%xcc,	loop_2536
	fxor	%f6,	%f22,	%f10
	udivcc	%i1,	0x01C1,	%o5
	fmovdne	%icc,	%f15,	%f14
loop_2536:
	movpos	%xcc,	%g1,	%g7
	alignaddr	%o6,	%l4,	%i6
	sdiv	%g6,	0x1592,	%l6
	fornot1s	%f2,	%f22,	%f6
	sdiv	%o2,	0x0DFC,	%l2
	edge16l	%g2,	%i5,	%i0
	tleu	%xcc,	0x1
	addccc	%g3,	%o3,	%i3
	array16	%i2,	%o7,	%o1
	movl	%icc,	%i7,	%l0
	sllx	%o4,	0x1D,	%l1
	xnorcc	%i4,	0x1075,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l3,	0x0E6C,	%o0
	sll	%g4,	%i1,	%l5
	sdivcc	%g1,	0x0B84,	%o5
	orncc	%o6,	%g7,	%l4
	fabss	%f6,	%f12
	movn	%xcc,	%i6,	%g6
	bcs	%xcc,	loop_2537
	movre	%o2,	0x008,	%l6
	xorcc	%g2,	%i5,	%l2
	array8	%g3,	%i0,	%o3
loop_2537:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i3,	%i2,	%o7
	tgu	%icc,	0x6
	fornot1s	%f0,	%f4,	%f29
	orncc	%o1,	0x0673,	%l0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o4
	fnot1	%f0,	%f8
	fnegd	%f16,	%f10
	mova	%xcc,	%l1,	%i7
	fbe,a	%fcc3,	loop_2538
	andncc	%g5,	%l3,	%i4
	umul	%o0,	0x0594,	%g4
	fsrc1	%f28,	%f2
loop_2538:
	bcc,pn	%icc,	loop_2539
	fnegd	%f16,	%f28
	fmovdvc	%icc,	%f26,	%f23
	sdivx	%i1,	0x147E,	%l5
loop_2539:
	nop
	setx	loop_2540,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x1
	fba,a	%fcc2,	loop_2541
	nop
	setx	0x4DBDDB0260772FA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_2540:
	movleu	%xcc,	%o5,	%g1
	edge8	%o6,	%g7,	%i6
loop_2541:
	fmovrdne	%l4,	%f22,	%f14
	movvc	%icc,	%o2,	%g6
	nop
	setx	0x40592394,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	bl,a,pn	%xcc,	loop_2542
	be	loop_2543
	tcc	%icc,	0x0
	umul	%g2,	%i5,	%l2
loop_2542:
	fnand	%f24,	%f26,	%f20
loop_2543:
	edge16l	%l6,	%i0,	%o3
	fbge,a	%fcc3,	loop_2544
	fxor	%f14,	%f24,	%f10
	bl,pt	%icc,	loop_2545
	bneg,pt	%xcc,	loop_2546
loop_2544:
	srax	%g3,	0x02,	%i3
	tvc	%icc,	0x2
loop_2545:
	nop
	setx	0x407A3886,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
loop_2546:
	smul	%o7,	%i2,	%l0
	movre	%o4,	0x257,	%o1
	bg,pn	%xcc,	loop_2547
	fcmpeq32	%f26,	%f12,	%i7
	fmovda	%xcc,	%f1,	%f31
	fxnor	%f0,	%f26,	%f28
loop_2547:
	prefetch	[%l7 + 0x68],	 0x1
	movcs	%icc,	%g5,	%l3
	tge	%icc,	0x7
	smulcc	%i4,	0x16F9,	%o0
	set	0x08, %i3
	ldswa	[%l7 + %i3] 0x19,	%l1
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g4
	xorcc	%l5,	0x1574,	%o5
	movpos	%icc,	%i1,	%o6
	udiv	%g7,	0x1B39,	%i6
	nop
	setx	0xD5B005BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x451FF79B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f1,	%f30
	alignaddr	%l4,	%o2,	%g6
	movne	%icc,	%g2,	%i5
	edge8ln	%g1,	%l2,	%l6
	or	%i0,	0x0FE8,	%o3
	sethi	0x0B92,	%g3
	flush	%l7 + 0x24
	udiv	%i3,	0x0C88,	%i2
	faligndata	%f4,	%f0,	%f28
	nop
	setx	loop_2548,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%l0,	%o7,	%o4
	movpos	%icc,	%i7,	%o1
	movrgz	%l3,	0x2BF,	%i4
loop_2548:
	movne	%icc,	%o0,	%l1
	fmovd	%f4,	%f28
	smul	%g4,	%l5,	%o5
	srax	%i1,	%o6,	%g7
	srax	%i6,	0x02,	%l4
	mulscc	%o2,	0x0021,	%g6
	edge32ln	%g2,	%g5,	%i5
	fzero	%f6
	sdivcc	%g1,	0x1336,	%l6
	fbu,a	%fcc2,	loop_2549
	movvs	%icc,	%l2,	%i0
	movvs	%icc,	%o3,	%g3
	srl	%i3,	%l0,	%i2
loop_2549:
	sdivcc	%o7,	0x15F7,	%o4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x68] %asi,	%f26
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x40] %asi,	%i7
	movrlz	%l3,	0x297,	%o1
	fmovsl	%xcc,	%f24,	%f12
	srax	%o0,	0x07,	%i4
	fba	%fcc1,	loop_2550
	tvs	%icc,	0x3
	udivcc	%g4,	0x1EC9,	%l5
	sra	%l1,	0x05,	%i1
loop_2550:
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f30
	fxtod	%f30,	%f0
	xnor	%o6,	%o5,	%i6
	fcmpeq32	%f24,	%f20,	%g7
	umul	%l4,	0x0D0A,	%g6
	fandnot1	%f24,	%f14,	%f16
	brnz,a	%g2,	loop_2551
	fandnot2	%f24,	%f30,	%f12
	set	0x48, %o0
	ldswa	[%l7 + %o0] 0x89,	%g5
loop_2551:
	srlx	%i5,	%o2,	%g1
	bgu,a,pt	%icc,	loop_2552
	edge8n	%l2,	%i0,	%o3
	movvc	%icc,	%g3,	%i3
	tle	%xcc,	0x4
loop_2552:
	movneg	%xcc,	%l0,	%l6
	fmovdn	%icc,	%f28,	%f0
	sdivcc	%o7,	0x13A0,	%i2
	orn	%i7,	0x0E5E,	%l3
	taddcctv	%o4,	0x0A43,	%o1
	stw	%o0,	[%l7 + 0x64]
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x5C] %asi,	%f2
	fbne,a	%fcc2,	loop_2553
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f24
	fabsd	%f16,	%f12
	fandnot2	%f30,	%f6,	%f6
loop_2553:
	srax	%g4,	0x0C,	%i4
	umulcc	%l5,	%l1,	%o6
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%i1
	fba,a	%fcc1,	loop_2554
	movre	%o5,	%i6,	%l4
	lduh	[%l7 + 0x4A],	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g5
loop_2554:
	call	loop_2555
	membar	0x4B
	add	%i5,	0x14A2,	%o2
	movpos	%icc,	%g7,	%g1
loop_2555:
	movne	%icc,	%l2,	%i0
	bcs,a,pn	%icc,	loop_2556
	movl	%icc,	%o3,	%g3
	prefetch	[%l7 + 0x28],	 0x2
	fandnot2	%f2,	%f30,	%f4
loop_2556:
	mulx	%l0,	%l6,	%i3
	fbuge	%fcc1,	loop_2557
	srax	%i2,	0x13,	%o7
	movvs	%icc,	%l3,	%o4
	movcc	%xcc,	%i7,	%o0
loop_2557:
	movcc	%icc,	%o1,	%i4
	brnz	%g4,	loop_2558
	nop
	setx	0xD2BA4541,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x6CE7F784,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f16,	%f4
	nop
	setx	0x2F77B6E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f10
	sir	0x043C
loop_2558:
	popc	%l5,	%o6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpsub32s	%f1,	%f31,	%f19
	sethi	0x0F08,	%i1
	array32	%o5,	%l1,	%i6
	membar	0x39
	te	%xcc,	0x4
	fones	%f10
	set	0x68, %l3
	ldswa	[%l7 + %l3] 0x81,	%l4
	mulscc	%g2,	0x0CBE,	%g5
	fmovdcc	%icc,	%f27,	%f28
	edge16ln	%g6,	%i5,	%g7
	sth	%o2,	[%l7 + 0x40]
	movrgz	%g1,	%i0,	%l2
	fcmpne16	%f8,	%f18,	%g3
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o3
	be,a,pn	%xcc,	loop_2559
	srl	%l6,	%i3,	%l0
	sethi	0x19C3,	%o7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
loop_2559:
	and	%i2,	0x0F20,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%i7,	%o1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i4
	tn	%xcc,	0x0
	edge16n	%g4,	%o6,	%i1
	sllx	%l5,	0x14,	%o5
	movrlz	%i6,	%l1,	%l4
	array32	%g2,	%g6,	%i5
	movg	%xcc,	%g5,	%o2
	nop
	setx	0x0AA00C0AD05A1B60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	mulscc	%g1,	0x0DBD,	%i0
	fmovdleu	%xcc,	%f8,	%f12
	edge32l	%g7,	%l2,	%g3
	subccc	%o3,	%i3,	%l6
	movrlez	%l0,	0x204,	%l3
	movpos	%icc,	%o7,	%i2
	fble	%fcc3,	loop_2560
	edge16	%o4,	%i7,	%o1
	or	%o0,	%g4,	%o6
	sir	0x14A5
loop_2560:
	nop
	set	0x28, %g3
	ldsha	[%l7 + %g3] 0x04,	%i4
	array8	%l5,	%o5,	%i6
	ba,a	loop_2561
	smulcc	%l1,	%l4,	%g2
	move	%icc,	%i1,	%i5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%g5
loop_2561:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x54] %asi,	%f23
	or	%g6,	%o2,	%g1
	nop
	setx	0xF7CCF99FAE5F76CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x31EA98C457E8D2F9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f0,	%f28
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%l2
	tn	%xcc,	0x2
	fmovscc	%icc,	%f19,	%f2
	bgu,a	%xcc,	loop_2562
	membar	0x54
	smul	%g7,	0x14CA,	%o3
	orncc	%g3,	%i3,	%l6
loop_2562:
	edge32n	%l3,	%o7,	%i2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x41] %asi,	%l0
	andcc	%o4,	0x0651,	%o1
	movcc	%xcc,	%o0,	%i7
	udivx	%o6,	0x1E2E,	%i4
	fbne	%fcc0,	loop_2563
	nop
	setx loop_2564, %l0, %l1
	jmpl %l1, %l5
	fmovrdlz	%g4,	%f20,	%f24
	fcmpgt16	%f8,	%f6,	%o5
loop_2563:
	movvs	%xcc,	%l1,	%i6
loop_2564:
	movre	%l4,	0x280,	%g2
	nop
	setx	0xDE7DF7AFD061051A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	bleu,a,pt	%icc,	loop_2565
	st	%f9,	[%l7 + 0x08]
	bvc,a	%icc,	loop_2566
	tsubcctv	%i5,	0x1288,	%g5
loop_2565:
	fmul8ulx16	%f12,	%f6,	%f14
	tle	%xcc,	0x1
loop_2566:
	sub	%g6,	0x0651,	%o2
	fmovdl	%xcc,	%f11,	%f9
	ldx	[%l7 + 0x60],	%i1
	fbuge	%fcc3,	loop_2567
	mulx	%i0,	%g1,	%g7
	set	0x5B, %g1
	lduba	[%l7 + %g1] 0x89,	%o3
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
	fornot1	%f26,	%f28,	%f2
	set	0x50, %o4
	ldsha	[%l7 + %o4] 0x10,	%g3
loop_2568:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l2,	0x10C,	%i3
	tvc	%icc,	0x3
	sdivcc	%l6,	0x1B0C,	%o7
	udivcc	%i2,	0x1FD5,	%l0
	sdivx	%o4,	0x0DE5,	%o1
	fnot1	%f20,	%f4
	movg	%xcc,	%l3,	%i7
	fpack16	%f0,	%f11
	srl	%o6,	%o0,	%i4
	be,pt	%icc,	loop_2569
	sdivx	%g4,	0x1FD5,	%o5
	smul	%l1,	%i6,	%l5
	fcmple32	%f2,	%f28,	%g2
loop_2569:
	orn	%l4,	0x1240,	%g5
	brgz,a	%g6,	loop_2570
	movrne	%o2,	%i5,	%i1
	st	%f31,	[%l7 + 0x18]
	edge16n	%g1,	%g7,	%i0
loop_2570:
	add	%g3,	0x1DDB,	%l2
	smulcc	%i3,	%o3,	%l6
	tleu	%xcc,	0x7
	and	%o7,	%i2,	%o4
	umulcc	%l0,	0x038A,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i7,	%o6,	%o0
	be	loop_2571
	tneg	%xcc,	0x6
	tvs	%icc,	0x3
	fbn	%fcc1,	loop_2572
loop_2571:
	ldd	[%l7 + 0x20],	%f12
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i4
loop_2572:
	tl	%icc,	0x4
	edge32ln	%o1,	%g4,	%o5
	xorcc	%i6,	%l1,	%l5
	udivcc	%l4,	0x03DA,	%g2
	fsrc1	%f18,	%f0
	edge16l	%g6,	%o2,	%g5
	movrgz	%i5,	%g1,	%g7
	popc	%i0,	%g3
	std	%f24,	[%l7 + 0x08]
	fbg	%fcc0,	loop_2573
	orn	%i1,	%i3,	%l2
	movgu	%xcc,	%l6,	%o7
	tvc	%xcc,	0x7
loop_2573:
	ble	loop_2574
	addcc	%i2,	%o4,	%o3
	brnz,a	%l3,	loop_2575
	ta	%icc,	0x7
loop_2574:
	movne	%icc,	%l0,	%i7
	smul	%o6,	0x1FD5,	%o0
loop_2575:
	add	%i4,	%o1,	%o5
	mulscc	%g4,	%i6,	%l5
	nop
	setx	0xBE837DCE6A2655CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x336DF5DCFE56B862,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f2,	%f20
	be,a	%icc,	loop_2576
	andn	%l4,	%g2,	%g6
	brgez	%o2,	loop_2577
	orn	%l1,	%i5,	%g5
loop_2576:
	mulx	%g1,	%g7,	%g3
	bneg,a	loop_2578
loop_2577:
	stw	%i0,	[%l7 + 0x48]
	subcc	%i1,	0x1EEB,	%l2
	movleu	%icc,	%i3,	%l6
loop_2578:
	ld	[%l7 + 0x44],	%f26
	nop
	setx	loop_2579,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%o7,	%i2,	%o4
	fmovrdne	%l3,	%f30,	%f0
	fcmple16	%f24,	%f12,	%l0
loop_2579:
	membar	0x19
	bleu,a,pt	%xcc,	loop_2580
	edge8ln	%o3,	%i7,	%o0
	movcs	%xcc,	%o6,	%o1
	fmovsvs	%xcc,	%f5,	%f2
loop_2580:
	mulscc	%i4,	%g4,	%o5
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x18,	%l5
	bcc,a,pn	%xcc,	loop_2581
	fabss	%f5,	%f29
	fble,a	%fcc1,	loop_2582
	nop
	setx	0xC56F1B0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xE36020DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f23,	%f30
loop_2581:
	brlz	%l4,	loop_2583
	sth	%i6,	[%l7 + 0x40]
loop_2582:
	umul	%g2,	0x1748,	%g6
	fmovsvs	%icc,	%f7,	%f4
loop_2583:
	udivcc	%o2,	0x1C62,	%l1
	fblg,a	%fcc0,	loop_2584
	edge32	%g5,	%i5,	%g7
	set	0x3C, %l5
	swapa	[%l7 + %l5] 0x04,	%g3
loop_2584:
	fxors	%f11,	%f26,	%f20
	ldd	[%l7 + 0x58],	%f12
	edge32	%i0,	%g1,	%i1
	array32	%l2,	%l6,	%o7
	bcs,a	loop_2585
	edge8	%i3,	%i2,	%l3
	sethi	0x0482,	%l0
	fmovrdgez	%o4,	%f28,	%f16
loop_2585:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f9,	[%l7 + 0x6C] %asi
	ldd	[%l7 + 0x78],	%i6
	fsrc1	%f20,	%f0
	edge16l	%o3,	%o6,	%o0
	taddcc	%i4,	%g4,	%o1
	prefetch	[%l7 + 0x70],	 0x3
	edge16n	%o5,	%l4,	%l5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x18] %asi,	%g2
	fbue	%fcc0,	loop_2586
	edge8n	%g6,	%o2,	%l1
	nop
	set	0x5A, %i7
	ldsb	[%l7 + %i7],	%i6
	fbl	%fcc3,	loop_2587
loop_2586:
	fmovrdlz	%i5,	%f16,	%f6
	nop
	fitos	%f10,	%f24
	fcmple16	%f0,	%f4,	%g7
loop_2587:
	srl	%g3,	%i0,	%g1
	tsubcc	%g5,	0x1C51,	%i1
	edge8n	%l6,	%o7,	%i3
	stbar
	andn	%i2,	0x0618,	%l3
	nop
	setx	loop_2588,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%l0,	%l2,	%i7
	sethi	0x12F7,	%o4
	edge32n	%o3,	%o0,	%o6
loop_2588:
	udivcc	%g4,	0x0D94,	%i4
	umul	%o5,	%l4,	%l5
	sllx	%o1,	%g6,	%g2
	taddcctv	%o2,	%l1,	%i5
	membar	0x53
	tl	%xcc,	0x6
	array32	%g7,	%i6,	%i0
	movcs	%icc,	%g3,	%g1
	fmovrdgez	%i1,	%f14,	%f24
	movne	%xcc,	%g5,	%l6
	edge8	%i3,	%o7,	%i2
	edge16n	%l3,	%l2,	%l0
	movrgez	%i7,	%o4,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f0,	%f6,	%o0
	movrlez	%g4,	0x00C,	%i4
	brz,a	%o6,	loop_2589
	edge16n	%l4,	%l5,	%o1
	edge32	%g6,	%o5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2589:
	array16	%l1,	%g2,	%g7
	xnorcc	%i6,	%i5,	%g3
	brlz	%g1,	loop_2590
	movl	%xcc,	%i1,	%i0
	bgu	%xcc,	loop_2591
	movcs	%xcc,	%g5,	%l6
loop_2590:
	fmovsl	%icc,	%f20,	%f2
	fmovrslez	%o7,	%f24,	%f30
loop_2591:
	fmovsg	%xcc,	%f29,	%f11
	fzero	%f8
	bl,a,pt	%xcc,	loop_2592
	taddcctv	%i2,	0x1B49,	%l3
	nop
	setx loop_2593, %l0, %l1
	jmpl %l1, %l2
	for	%f16,	%f8,	%f20
loop_2592:
	for	%f22,	%f30,	%f10
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i3,	%i7
loop_2593:
	orcc	%o4,	0x0F75,	%l0
	tg	%icc,	0x0
	tcs	%icc,	0x4
	move	%icc,	%o3,	%g4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	ldsh	[%l7 + 0x30],	%i4
	set	0x5A, %g5
	ldsha	[%l7 + %g5] 0x19,	%l4
	movcc	%icc,	%o6,	%l5
	movrgz	%g6,	%o5,	%o1
	sub	%o2,	0x06CE,	%l1
	mova	%xcc,	%g7,	%i6
	fbn	%fcc0,	loop_2594
	fbne	%fcc3,	loop_2595
	nop
	setx	0xFED1C58F1A8861B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xDBA5F59B38A578F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f22,	%f2
	edge16n	%i5,	%g2,	%g1
loop_2594:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x76] %asi,	%g3
loop_2595:
	mulx	%i0,	0x15FD,	%i1
	alignaddr	%l6,	%o7,	%g5
	fmovsge	%xcc,	%f2,	%f22
	orncc	%l3,	0x0A84,	%i2
	tle	%icc,	0x3
	tg	%xcc,	0x5
	andn	%l2,	0x0DDB,	%i7
	fpsub16	%f24,	%f26,	%f24
	movl	%xcc,	%o4,	%i3
	ldstub	[%l7 + 0x54],	%o3
	edge16l	%g4,	%o0,	%l0
	tle	%xcc,	0x2
	fmovrde	%l4,	%f0,	%f6
	fmovrdne	%o6,	%f6,	%f30
	andncc	%l5,	%i4,	%g6
	tcc	%xcc,	0x7
	srax	%o1,	0x00,	%o2
	fbul,a	%fcc1,	loop_2596
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f28
	edge32ln	%o5,	%l1,	%g7
	popc	0x1131,	%i6
loop_2596:
	fnegd	%f0,	%f6
	fors	%f14,	%f16,	%f25
	andcc	%i5,	%g1,	%g3
	fmovsge	%xcc,	%f6,	%f17
	tvc	%xcc,	0x6
	tcs	%xcc,	0x6
	sdiv	%i0,	0x1E1A,	%i1
	movl	%xcc,	%l6,	%o7
	tpos	%xcc,	0x7
	bl	loop_2597
	tleu	%icc,	0x0
	fmovdcc	%icc,	%f22,	%f2
	sdiv	%g2,	0x03C7,	%l3
loop_2597:
	tvs	%xcc,	0x6
	brnz,a	%g5,	loop_2598
	fpack32	%f8,	%f2,	%f8
	ld	[%l7 + 0x14],	%f24
	brlz	%l2,	loop_2599
loop_2598:
	edge32	%i2,	%o4,	%i3
	bgu,a	loop_2600
	srax	%i7,	%o3,	%o0
loop_2599:
	fandnot2	%f20,	%f8,	%f24
	edge16ln	%g4,	%l4,	%l0
loop_2600:
	andn	%o6,	%i4,	%g6
	tneg	%xcc,	0x4
	andcc	%o1,	0x06F8,	%l5
	subccc	%o5,	0x1688,	%o2
	addc	%l1,	%g7,	%i5
	stw	%g1,	[%l7 + 0x10]
	fabss	%f30,	%f12
	fbe	%fcc1,	loop_2601
	mova	%icc,	%g3,	%i6
	fmovrdlz	%i1,	%f6,	%f8
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x44] %asi,	%l6
loop_2601:
	addccc	%i0,	0x03C6,	%g2
	fornot1	%f8,	%f18,	%f18
	xorcc	%l3,	%g5,	%o7
	tvs	%icc,	0x6
	ld	[%l7 + 0x14],	%f1
	edge16n	%l2,	%i2,	%o4
	movcc	%xcc,	%i3,	%o3
	edge16ln	%i7,	%o0,	%l4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%o6
	edge32n	%i4,	%g6,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sth	%g4,	[%l7 + 0x1A]
	nop
	setx	loop_2602,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x10, %i1
	stb	%l5,	[%l7 + %i1]
	edge16l	%o2,	%l1,	%g7
	set	0x4F, %o7
	lduba	[%l7 + %o7] 0x80,	%o5
loop_2602:
	edge16ln	%g1,	%g3,	%i6
	edge8n	%i5,	%i1,	%i0
	fmovda	%xcc,	%f6,	%f22
	xnor	%g2,	%l3,	%l6
	movl	%xcc,	%g5,	%o7
	srlx	%l2,	%i2,	%i3
	stx	%o4,	[%l7 + 0x28]
	nop
	set	0x12, %l0
	ldsh	[%l7 + %l0],	%i7
	fmovsneg	%xcc,	%f29,	%f31
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x19,	 0x0
	orncc	%o3,	0x18DA,	%l0
	fexpand	%f26,	%f26
	tvs	%xcc,	0x1
	orcc	%o6,	%i4,	%g6
	sir	0x0717
	fzero	%f24
	fmovdleu	%icc,	%f26,	%f27
	ldsh	[%l7 + 0x12],	%o1
	movrlz	%g4,	%l4,	%l5
	tg	%icc,	0x2
	fmovsne	%xcc,	%f9,	%f18
	stx	%l1,	[%l7 + 0x30]
	fmovrsgz	%o2,	%f14,	%f8
	taddcc	%o5,	0x023F,	%g7
	fandnot2	%f8,	%f4,	%f22
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f22
	pdist	%f28,	%f24,	%f4
	edge8n	%g3,	%i6,	%g1
	xorcc	%i1,	0x0FAA,	%i0
	fbug,a	%fcc0,	loop_2603
	brgez,a	%i5,	loop_2604
	fmovdpos	%icc,	%f1,	%f28
	bl,a,pn	%icc,	loop_2605
loop_2603:
	fmovrdgz	%g2,	%f18,	%f16
loop_2604:
	ta	%icc,	0x2
	fbne,a	%fcc2,	loop_2606
loop_2605:
	bvc	loop_2607
	sdivx	%l3,	0x0294,	%l6
	for	%f24,	%f22,	%f16
loop_2606:
	sir	0x14FA
loop_2607:
	sub	%g5,	%o7,	%i2
	movre	%l2,	0x200,	%i3
	tsubcc	%o4,	%o0,	%o3
	sdivcc	%l0,	0x014C,	%o6
	umul	%i4,	0x0545,	%g6
	bvc,pn	%xcc,	loop_2608
	srl	%i7,	%o1,	%g4
	movgu	%icc,	%l5,	%l4
	fbule,a	%fcc2,	loop_2609
loop_2608:
	umulcc	%o2,	%o5,	%g7
	movrlez	%g3,	0x085,	%l1
	edge16	%i6,	%g1,	%i0
loop_2609:
	fmovdcc	%icc,	%f19,	%f2
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x16
	membar	#Sync
	array8	%i1,	%g2,	%i5
	ldsh	[%l7 + 0x20],	%l3
	movrlez	%l6,	%g5,	%i2
	fands	%f10,	%f11,	%f18
	tn	%icc,	0x2
	edge8n	%o7,	%l2,	%o4
	fpadd16s	%f17,	%f22,	%f25
	nop
	setx	loop_2610,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fand	%f24,	%f18,	%f4
	move	%xcc,	%o0,	%i3
	umul	%l0,	%o3,	%i4
loop_2610:
	mulx	%g6,	0x0C03,	%i7
	umulcc	%o6,	0x10F6,	%o1
	bcc,pn	%icc,	loop_2611
	movvc	%icc,	%g4,	%l5
	bn,pt	%xcc,	loop_2612
	fmul8x16au	%f11,	%f1,	%f14
loop_2611:
	fabsd	%f10,	%f10
	movrlez	%l4,	%o2,	%g7
loop_2612:
	fnegs	%f5,	%f8
	set	0x56, %l4
	ldsba	[%l7 + %l4] 0x0c,	%g3
	nop
	setx	0x3C92BB5F9011D71F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x8D13026F82B0E1E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f28,	%f14
	be,a	loop_2613
	brz	%o5,	loop_2614
	fxors	%f26,	%f31,	%f1
	umulcc	%l1,	0x02F4,	%i6
loop_2613:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2614:
	bpos,a	loop_2615
	fbu,a	%fcc0,	loop_2616
	fbn	%fcc3,	loop_2617
	fornot1s	%f4,	%f16,	%f19
loop_2615:
	fbuge	%fcc3,	loop_2618
loop_2616:
	orn	%g1,	%i1,	%i0
loop_2617:
	addc	%i5,	%l3,	%g2
	fandnot2	%f8,	%f2,	%f10
loop_2618:
	sub	%g5,	0x039F,	%l6
	tge	%icc,	0x2
	fmovsleu	%icc,	%f26,	%f19
	brgz	%i2,	loop_2619
	movpos	%icc,	%l2,	%o7
	alignaddrl	%o0,	%i3,	%l0
	movrlez	%o3,	0x0E1,	%o4
loop_2619:
	brnz,a	%g6,	loop_2620
	fmovrsne	%i7,	%f25,	%f31
	smulcc	%o6,	0x1846,	%i4
	fcmpgt16	%f2,	%f8,	%g4
loop_2620:
	bne,pt	%icc,	loop_2621
	fxor	%f0,	%f20,	%f8
	nop
	fitod	%f4,	%f4
	fdtoi	%f4,	%f7
	addc	%o1,	0x1615,	%l4
loop_2621:
	edge8	%l5,	%g7,	%o2
	tgu	%icc,	0x2
	set	0x2B, %i0
	stba	%o5,	[%l7 + %i0] 0x2b
	membar	#Sync
	edge16l	%l1,	%i6,	%g3
	sub	%i1,	0x0E87,	%i0
	movrne	%g1,	0x2CA,	%l3
	fmovsge	%xcc,	%f6,	%f5
	movle	%icc,	%i5,	%g5
	andn	%l6,	0x0736,	%g2
	addccc	%i2,	0x00A5,	%o7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	fba	%fcc1,	loop_2622
	sra	%l2,	0x06,	%l0
	edge16	%o3,	%i3,	%g6
	set	0x18, %l1
	stha	%i7,	[%l7 + %l1] 0xe3
	membar	#Sync
loop_2622:
	ta	%xcc,	0x3
	fandnot2s	%f16,	%f12,	%f21
	faligndata	%f8,	%f12,	%f26
	sdivx	%o4,	0x1BAB,	%i4
	fpsub16	%f28,	%f2,	%f4
	brgez	%o6,	loop_2623
	fmovrslez	%o1,	%f8,	%f20
	ldsh	[%l7 + 0x4A],	%g4
	srlx	%l4,	0x0F,	%g7
loop_2623:
	fpadd32s	%f16,	%f15,	%f4
	subccc	%o2,	0x08A5,	%o5
	call	loop_2624
	sllx	%l1,	0x1F,	%i6
	fbo	%fcc3,	loop_2625
	subcc	%g3,	%i1,	%i0
loop_2624:
	udivcc	%l5,	0x0FA8,	%g1
	brgez,a	%i5,	loop_2626
loop_2625:
	fmul8ulx16	%f20,	%f12,	%f2
	smulcc	%l3,	%l6,	%g5
	movge	%icc,	%g2,	%i2
loop_2626:
	fmovdn	%xcc,	%f19,	%f9
	movrne	%o0,	0x0C0,	%o7
	be,pn	%icc,	loop_2627
	udivcc	%l2,	0x1C5A,	%l0
	umul	%i3,	%o3,	%g6
	flush	%l7 + 0x18
loop_2627:
	tleu	%icc,	0x2
	bn,a,pt	%icc,	loop_2628
	sir	0x1089
	movle	%xcc,	%i7,	%i4
	tneg	%icc,	0x6
loop_2628:
	fnot1s	%f17,	%f29
	fmovsleu	%xcc,	%f25,	%f8
	brnz,a	%o6,	loop_2629
	edge32	%o4,	%o1,	%g4
	bcs,pt	%xcc,	loop_2630
	udiv	%l4,	0x11A9,	%g7
loop_2629:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x14] %asi,	%o5
loop_2630:
	fbug,a	%fcc3,	loop_2631
	movleu	%xcc,	%l1,	%o2
	movcs	%xcc,	%i6,	%g3
	bneg	loop_2632
loop_2631:
	andcc	%i1,	%i0,	%g1
	faligndata	%f28,	%f8,	%f26
	fmovsne	%icc,	%f7,	%f0
loop_2632:
	movn	%xcc,	%i5,	%l3
	bcc	%icc,	loop_2633
	fmovdgu	%icc,	%f25,	%f30
	tge	%xcc,	0x4
	call	loop_2634
loop_2633:
	fpsub16s	%f15,	%f17,	%f24
	edge16l	%l6,	%g5,	%l5
	movle	%xcc,	%i2,	%g2
loop_2634:
	add	%o0,	0x0262,	%o7
	stx	%l0,	[%l7 + 0x40]
	movgu	%icc,	%l2,	%i3
	movvs	%icc,	%o3,	%g6
	brnz,a	%i4,	loop_2635
	tvc	%xcc,	0x3
	sethi	0x07A6,	%i7
	srlx	%o6,	0x05,	%o4
loop_2635:
	edge32n	%o1,	%l4,	%g4
	fmovscc	%icc,	%f11,	%f27
	movneg	%xcc,	%o5,	%g7
	fxnor	%f0,	%f14,	%f8
	fmovdge	%icc,	%f30,	%f1
	array32	%o2,	%i6,	%l1
	bn	loop_2636
	mova	%xcc,	%i1,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f4,	%f14,	%f22
loop_2636:
	nop
	setx	0x056E2E0C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x012C43B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f23,	%f2
	set	0x380, %i5
	nop 	! 	nop 	! 	ldxa	[%g0 + %i5] 0x40,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
	taddcctv	%i5,	%l3,	%l6
	movl	%icc,	%g5,	%l5
	ld	[%l7 + 0x58],	%f13
	alignaddrl	%i2,	%i0,	%o0
	wr	%g0,	0x04,	%asi
	stwa	%g2,	[%l7 + 0x14] %asi
	andcc	%l0,	%o7,	%l2
	tvc	%icc,	0x0
	subccc	%i3,	%g6,	%o3
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x15
	movvc	%icc,	%i7,	%i4
	movne	%xcc,	%o6,	%o4
	array32	%l4,	%g4,	%o5
	mova	%xcc,	%o1,	%g7
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x5F] %asi,	%o2
	fmovdneg	%xcc,	%f28,	%f6
	ldx	[%l7 + 0x40],	%i6
	stb	%l1,	[%l7 + 0x72]
	sdiv	%i1,	0x0136,	%g3
	fmovdn	%icc,	%f5,	%f21
	brnz,a	%g1,	loop_2637
	movre	%l3,	0x37C,	%l6
	swap	[%l7 + 0x30],	%g5
	tle	%icc,	0x6
loop_2637:
	movne	%icc,	%l5,	%i5
	andcc	%i2,	0x10EA,	%o0
	alignaddr	%i0,	%g2,	%o7
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x88
	fcmpgt16	%f4,	%f6,	%l2
	movrgez	%l0,	%i3,	%o3
	sdiv	%i7,	0x0881,	%i4
	set	0x2E, %g7
	lduha	[%l7 + %g7] 0x14,	%o6
	sll	%g6,	0x14,	%o4
	fpackfix	%f14,	%f27
	fbge	%fcc1,	loop_2638
	tgu	%icc,	0x2
	fmovrslez	%l4,	%f30,	%f6
	smulcc	%g4,	%o5,	%o1
loop_2638:
	andn	%o2,	%g7,	%l1
	tgu	%icc,	0x7
	edge8	%i1,	%g3,	%g1
	fmovsl	%icc,	%f21,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f14,	%f14
	and	%i6,	0x1673,	%l6
	set	0x20, %l2
	sta	%f22,	[%l7 + %l2] 0x04
	nop
	setx	0xB3483E65D07A2DCE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	movre	%g5,	%l5,	%i5
	mulscc	%l3,	%i2,	%o0
	srax	%g2,	0x16,	%o7
	te	%icc,	0x0
	fmovrslez	%i0,	%f1,	%f31
	add	%l2,	%l0,	%i3
	movge	%xcc,	%i7,	%i4
	ld	[%l7 + 0x0C],	%f27
	movle	%icc,	%o3,	%o6
	bneg,a	loop_2639
	sra	%g6,	%o4,	%g4
	sdiv	%l4,	0x0367,	%o5
	sethi	0x1792,	%o2
loop_2639:
	movn	%xcc,	%o1,	%g7
	umulcc	%l1,	%g3,	%g1
	alignaddrl	%i1,	%l6,	%g5
	addccc	%i6,	0x0C71,	%l5
	taddcc	%l3,	0x0B0E,	%i2
	tne	%xcc,	0x2
	mulx	%i5,	0x0A1C,	%o0
	or	%o7,	0x1388,	%i0
	or	%g2,	%l2,	%l0
	movrgez	%i3,	0x395,	%i4
	subc	%i7,	%o3,	%g6
	edge16	%o6,	%g4,	%o4
	andncc	%l4,	%o5,	%o2
	taddcctv	%g7,	0x0A15,	%l1
	xnor	%o1,	0x06A2,	%g3
	fnegd	%f24,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i1,	0x1EAF,	%g1
	bcs,a,pt	%xcc,	loop_2640
	tvs	%icc,	0x5
	subccc	%g5,	0x034F,	%i6
	bvs,pt	%xcc,	loop_2641
loop_2640:
	brnz,a	%l5,	loop_2642
	ta	%xcc,	0x4
	orcc	%l6,	%i2,	%i5
loop_2641:
	tcc	%icc,	0x7
loop_2642:
	andncc	%l3,	%o0,	%i0
	sll	%o7,	0x11,	%l2
	ble,a	%xcc,	loop_2643
	sub	%l0,	0x1D11,	%g2
	movg	%xcc,	%i3,	%i7
	movcc	%xcc,	%o3,	%i4
loop_2643:
	smul	%o6,	0x1E67,	%g4
	stx	%o4,	[%l7 + 0x58]
	smul	%g6,	%l4,	%o5
	subcc	%g7,	%l1,	%o1
	sll	%o2,	0x0B,	%i1
	sdivcc	%g1,	0x1A93,	%g5
	tg	%xcc,	0x6
	brlez,a	%i6,	loop_2644
	sethi	0x08C5,	%g3
	edge16n	%l6,	%l5,	%i2
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f14
loop_2644:
	tne	%xcc,	0x0
	brnz	%i5,	loop_2645
	sir	0x113D
	tl	%xcc,	0x4
	add	%l3,	0x1EC0,	%o0
loop_2645:
	movn	%xcc,	%i0,	%l2
	edge8l	%l0,	%g2,	%i3
	fcmple32	%f8,	%f4,	%i7
	umulcc	%o7,	%o3,	%o6
	fornot2s	%f15,	%f15,	%f30
	prefetch	[%l7 + 0x34],	 0x3
	ld	[%l7 + 0x10],	%f6
	fmuld8ulx16	%f27,	%f27,	%f12
	umulcc	%i4,	%g4,	%o4
	fmovdpos	%xcc,	%f22,	%f25
	stbar
	brlz,a	%l4,	loop_2646
	tneg	%icc,	0x1
	udivcc	%g6,	0x1B59,	%o5
	ble,pt	%icc,	loop_2647
loop_2646:
	tgu	%xcc,	0x4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g7,	%l1
loop_2647:
	nop
	fitos	%f4,	%f3
	or	%o1,	%i1,	%g1
	set	0x48, %i6
	stxa	%o2,	[%l7 + %i6] 0x23
	membar	#Sync
	bpos,a	loop_2648
	edge16n	%i6,	%g5,	%l6
	xor	%l5,	0x0A62,	%g3
	nop
	setx	0x20038273,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x9D08875A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f4,	%f29
loop_2648:
	fbge,a	%fcc1,	loop_2649
	tcs	%icc,	0x1
	movle	%icc,	%i2,	%i5
	ldd	[%l7 + 0x18],	%l2
loop_2649:
	call	loop_2650
	array32	%o0,	%i0,	%l0
	fpsub16	%f6,	%f10,	%f4
	edge16	%l2,	%i3,	%g2
loop_2650:
	smul	%o7,	0x1104,	%o3
	fba,a	%fcc3,	loop_2651
	movn	%xcc,	%i7,	%i4
	fmul8x16	%f20,	%f6,	%f12
	fbue,a	%fcc2,	loop_2652
loop_2651:
	addccc	%g4,	0x1CDB,	%o4
	sra	%o6,	0x1D,	%g6
	taddcctv	%l4,	0x155A,	%g7
loop_2652:
	movrlez	%o5,	0x2FB,	%l1
	fmovsle	%xcc,	%f25,	%f26
	mulscc	%i1,	0x03D3,	%o1
	movpos	%xcc,	%g1,	%i6
	edge32ln	%o2,	%g5,	%l6
	ldsw	[%l7 + 0x58],	%l5
	tge	%icc,	0x5
	movrne	%g3,	%i5,	%l3
	movpos	%xcc,	%o0,	%i0
	tgu	%xcc,	0x0
	bne,pn	%icc,	loop_2653
	popc	%l0,	%l2
	addc	%i2,	0x0FDA,	%g2
	smulcc	%i3,	0x1128,	%o3
loop_2653:
	bcs,a,pn	%icc,	loop_2654
	nop
	fitos	%f13,	%f2
	fstox	%f2,	%f30
	subc	%o7,	%i7,	%g4
	tle	%xcc,	0x0
loop_2654:
	movl	%xcc,	%o4,	%i4
	fmovdcc	%icc,	%f25,	%f29
	movn	%icc,	%g6,	%o6
	subcc	%l4,	%g7,	%o5
	tleu	%icc,	0x5
	mulscc	%i1,	0x1184,	%o1
	sllx	%g1,	0x1E,	%l1
	tleu	%icc,	0x6
	tge	%icc,	0x3
	fbg,a	%fcc2,	loop_2655
	nop
	setx	0x126F4922,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xFF0CD92E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f26,	%f22
	edge32	%i6,	%o2,	%g5
	set	0x24, %o1
	swapa	[%l7 + %o1] 0x18,	%l5
loop_2655:
	tsubcc	%l6,	%i5,	%l3
	tleu	%icc,	0x4
	xnorcc	%g3,	0x08CE,	%o0
	movrgez	%i0,	0x093,	%l0
	smulcc	%i2,	0x0E3D,	%l2
	xor	%g2,	%i3,	%o7
	fbge,a	%fcc0,	loop_2656
	stx	%i7,	[%l7 + 0x20]
	fabss	%f2,	%f6
	sdivx	%o3,	0x0579,	%g4
loop_2656:
	tvs	%icc,	0x0
	subccc	%o4,	%i4,	%g6
	orncc	%l4,	0x10BD,	%o6
	orn	%o5,	%i1,	%o1
	ta	%icc,	0x5
	movcc	%xcc,	%g7,	%g1
	fcmpeq16	%f4,	%f18,	%l1
	fcmpeq16	%f14,	%f30,	%o2
	tvc	%icc,	0x0
	xnorcc	%i6,	0x0A74,	%g5
	tvs	%icc,	0x6
	fand	%f22,	%f14,	%f20
	fnot1	%f16,	%f24
	te	%icc,	0x7
	udiv	%l6,	0x111A,	%l5
	alignaddr	%i5,	%l3,	%g3
	and	%o0,	0x101D,	%i0
	movleu	%xcc,	%l0,	%i2
	brlz	%l2,	loop_2657
	tvc	%xcc,	0x4
	move	%icc,	%i3,	%o7
	xor	%g2,	%o3,	%i7
loop_2657:
	alignaddr	%g4,	%o4,	%g6
	fmovdne	%xcc,	%f21,	%f3
	edge8n	%l4,	%i4,	%o6
	bne,a	%xcc,	loop_2658
	fpack16	%f16,	%f26
	movn	%xcc,	%i1,	%o1
	movle	%xcc,	%g7,	%o5
loop_2658:
	umul	%l1,	0x110D,	%o2
	movleu	%xcc,	%g1,	%g5
	xor	%l6,	%i6,	%i5
	movl	%icc,	%l3,	%g3
	tneg	%xcc,	0x1
	umulcc	%o0,	%l5,	%l0
	addccc	%i2,	0x0E46,	%i0
	xorcc	%i3,	%l2,	%o7
	subcc	%g2,	%i7,	%g4
	addc	%o3,	0x061B,	%g6
	edge32n	%o4,	%i4,	%o6
	sra	%i1,	%l4,	%g7
	ldsh	[%l7 + 0x5E],	%o5
	udivx	%o1,	0x1D33,	%o2
	fbn,a	%fcc3,	loop_2659
	tn	%icc,	0x5
	movcs	%icc,	%l1,	%g5
	fbg	%fcc3,	loop_2660
loop_2659:
	fbge	%fcc0,	loop_2661
	movgu	%xcc,	%l6,	%g1
	tle	%icc,	0x6
loop_2660:
	bvc	%icc,	loop_2662
loop_2661:
	addcc	%i6,	0x127D,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2662:
	ldsw	[%l7 + 0x14],	%g3
	stbar
	taddcc	%i5,	%o0,	%l0
	xnor	%l5,	%i0,	%i3
	array16	%l2,	%i2,	%g2
	fmovrse	%o7,	%f29,	%f5
	mulscc	%i7,	0x16E3,	%o3
	movge	%icc,	%g4,	%g6
	movrlz	%i4,	0x073,	%o4
	ldstub	[%l7 + 0x3C],	%i1
	andn	%l4,	0x0B31,	%g7
	tle	%icc,	0x0
	fbo,a	%fcc1,	loop_2663
	tleu	%xcc,	0x0
	fcmpgt32	%f0,	%f10,	%o6
	fxnor	%f14,	%f14,	%f26
loop_2663:
	fbo	%fcc1,	loop_2664
	movrne	%o1,	%o2,	%o5
	bgu,a	loop_2665
	bshuffle	%f28,	%f4,	%f2
loop_2664:
	bge,a	loop_2666
	movcs	%xcc,	%g5,	%l6
loop_2665:
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%g0
	tcc	%xcc,	0x2
loop_2666:
	fsrc1s	%f10,	%f16
	brz,a	%l1,	loop_2667
	bleu,a	loop_2668
	xnorcc	%i6,	0x0C31,	%g3
	movge	%xcc,	%i5,	%l3
loop_2667:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%o0
loop_2668:
	tle	%icc,	0x0
	umulcc	%l0,	0x0B00,	%i0
	fmovrse	%l5,	%f22,	%f26
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%l2
	stb	%i3,	[%l7 + 0x4C]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x16
	membar	#Sync
	fmovdg	%xcc,	%f10,	%f22
	movle	%xcc,	%g2,	%i2
	smul	%i7,	0x0FDC,	%o3
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x2f,	%g4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o7,	%i4
	smulcc	%g6,	0x1669,	%i1
	fbule	%fcc0,	loop_2669
	mulscc	%o4,	%g7,	%l4
	fcmple16	%f24,	%f14,	%o6
	fcmpgt32	%f20,	%f22,	%o1
loop_2669:
	edge32	%o5,	%g5,	%o2
	xor	%g1,	%l6,	%i6
	tge	%icc,	0x1
	smul	%g3,	%i5,	%l1
	fmovdvs	%xcc,	%f6,	%f11
	ldsh	[%l7 + 0x48],	%o0
	alignaddrl	%l3,	%i0,	%l0
	array16	%l2,	%i3,	%l5
	andcc	%g2,	%i7,	%i2
	movgu	%xcc,	%o3,	%g4
	tvc	%xcc,	0x5
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f22
	udiv	%i4,	0x1E68,	%g6
	movn	%icc,	%i1,	%o4
	nop
	setx	loop_2670,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrsne	%o7,	%f3,	%f17
	ldd	[%l7 + 0x50],	%l4
	movrlez	%g7,	%o1,	%o5
loop_2670:
	fmul8x16al	%f8,	%f3,	%f0
	fmovrsne	%o6,	%f29,	%f5
	bcs,a,pt	%xcc,	loop_2671
	movge	%icc,	%g5,	%o2
	bge,a,pn	%icc,	loop_2672
	bg,a,pt	%xcc,	loop_2673
loop_2671:
	edge8n	%l6,	%g1,	%i6
	fmovdcc	%icc,	%f17,	%f2
loop_2672:
	tl	%icc,	0x2
loop_2673:
	umulcc	%i5,	%g3,	%o0
	sdiv	%l3,	0x0E94,	%l1
	movl	%xcc,	%l0,	%i0
	nop
	fitod	%f12,	%f26
	fdtos	%f26,	%f7
	fbo	%fcc3,	loop_2674
	and	%i3,	%l2,	%g2
	fmovscs	%xcc,	%f13,	%f21
	sethi	0x1D8A,	%i7
loop_2674:
	movcs	%icc,	%i2,	%o3
	fexpand	%f1,	%f4
	bvs	%icc,	loop_2675
	fbge,a	%fcc0,	loop_2676
	movrlez	%l5,	%i4,	%g4
	ta	%icc,	0x4
loop_2675:
	sllx	%i1,	%o4,	%g6
loop_2676:
	bl	%xcc,	loop_2677
	movre	%l4,	0x2D8,	%o7
	brz	%o1,	loop_2678
	movg	%icc,	%o5,	%o6
loop_2677:
	fbn,a	%fcc0,	loop_2679
	xnorcc	%g7,	%o2,	%l6
loop_2678:
	orn	%g5,	%g1,	%i5
	movvs	%icc,	%i6,	%o0
loop_2679:
	nop
	set	0x3C, %g6
	ldsha	[%l7 + %g6] 0x18,	%g3
	set	0x4C, %o5
	sta	%f25,	[%l7 + %o5] 0x89
	smul	%l1,	%l0,	%i0
	smul	%i3,	0x1C18,	%l3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x22] %asi,	%g2
	movleu	%xcc,	%i7,	%i2
	tpos	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f31,	%f7,	%f9
	bvc	loop_2680
	nop
	set	0x68, %i3
	std	%f16,	[%l7 + %i3]
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
	movrlz	%l2,	0x0CB,	%o3
loop_2680:
	or	%i4,	%l5,	%g4
	fmul8x16al	%f17,	%f25,	%f0
loop_2681:
	tgu	%icc,	0x1
	fmovsg	%icc,	%f6,	%f29
	movre	%i1,	%g6,	%o4
	fmovdcs	%icc,	%f2,	%f18
	movg	%icc,	%l4,	%o1
	fxors	%f4,	%f15,	%f2
	fmuld8ulx16	%f17,	%f14,	%f8
	andcc	%o7,	%o5,	%o6
	smulcc	%g7,	%o2,	%l6
	movcs	%icc,	%g5,	%i5
	wr	%g0,	0x89,	%asi
	sta	%f24,	[%l7 + 0x14] %asi
	movge	%xcc,	%g1,	%o0
	mova	%icc,	%i6,	%l1
	fmovdpos	%xcc,	%f7,	%f24
	ldsb	[%l7 + 0x49],	%g3
	fmovscc	%icc,	%f21,	%f12
	popc	0x10BB,	%i0
	fxnors	%f23,	%f17,	%f24
	fmovrdgez	%l0,	%f10,	%f16
	fcmpgt16	%f22,	%f4,	%i3
	nop
	setx	0x57117E3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x48EBBE2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f15,	%f10
	bgu,pt	%xcc,	loop_2682
	movrgz	%l3,	%g2,	%i7
	addccc	%l2,	%i2,	%i4
	brgez	%o3,	loop_2683
loop_2682:
	sdivx	%l5,	0x19B8,	%i1
	bcs	%xcc,	loop_2684
	st	%f21,	[%l7 + 0x64]
loop_2683:
	fmovdcc	%icc,	%f8,	%f0
	movgu	%icc,	%g4,	%o4
loop_2684:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x6
	ble	loop_2685
	fmovdg	%xcc,	%f29,	%f13
	stx	%l4,	[%l7 + 0x10]
	movvc	%icc,	%g6,	%o7
loop_2685:
	movre	%o5,	%o6,	%g7
	andn	%o1,	0x1DB8,	%o2
	membar	0x6B
	edge32	%l6,	%i5,	%g5
	tvs	%icc,	0x7
	fbue,a	%fcc1,	loop_2686
	movcs	%icc,	%o0,	%i6
	xorcc	%l1,	%g1,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2686:
	fcmple32	%f8,	%f22,	%l0
	edge16ln	%i0,	%l3,	%i3
	set	0x16, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g2
	fbule	%fcc1,	loop_2687
	tg	%icc,	0x6
	brlez	%i7,	loop_2688
	tg	%xcc,	0x7
loop_2687:
	fmovsn	%xcc,	%f22,	%f11
	mulscc	%l2,	0x0F7D,	%i4
loop_2688:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%o3
	tge	%xcc,	0x3
	fandnot1	%f2,	%f28,	%f12
	movcs	%icc,	%l5,	%i2
	fbn,a	%fcc1,	loop_2689
	fexpand	%f29,	%f20
	fpmerge	%f1,	%f1,	%f26
	edge16n	%g4,	%i1,	%l4
loop_2689:
	movgu	%icc,	%g6,	%o4
	nop
	fitos	%f17,	%f1
	wr	%g0,	0x27,	%asi
	stwa	%o5,	[%l7 + 0x1C] %asi
	membar	#Sync
	fmovsne	%xcc,	%f22,	%f29
	tsubcc	%o6,	%g7,	%o7
	set	0x38, %g3
	stxa	%o2,	[%l7 + %g3] 0x22
	membar	#Sync
	smulcc	%o1,	0x1E8B,	%l6
	fbo,a	%fcc2,	loop_2690
	ldsb	[%l7 + 0x4A],	%g5
	sir	0x16A4
	movgu	%icc,	%i5,	%i6
loop_2690:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%o0
	fxors	%f31,	%f29,	%f19
	sub	%g3,	%g1,	%l0
	edge32n	%l3,	%i3,	%i0
	movrlz	%g2,	0x0B4,	%i7
	set	0x0C, %g1
	lda	[%l7 + %g1] 0x81,	%f5
	movge	%xcc,	%l2,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x38] %asi,	%f7
	fand	%f0,	%f18,	%f22
	edge16n	%i4,	%i2,	%g4
	fbule	%fcc3,	loop_2691
	nop
	setx	0xB06DDBFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	addccc	%l5,	0x0A41,	%l4
	bne,a	loop_2692
loop_2691:
	movrne	%i1,	%o4,	%g6
	brgez,a	%o5,	loop_2693
	fmovdvs	%xcc,	%f25,	%f7
loop_2692:
	sdivcc	%o6,	0x1E02,	%o7
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f3
loop_2693:
	or	%o2,	0x02C7,	%g7
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x80,	%i6
	movge	%icc,	%g5,	%o1
	nop
	setx	loop_2694,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%i5,	%i6,	%l1
	orncc	%g3,	%g1,	%o0
	tsubcc	%l3,	0x104F,	%i3
loop_2694:
	andcc	%i0,	%g2,	%l0
	bvs	loop_2695
	array8	%l2,	%o3,	%i7
	fbo	%fcc1,	loop_2696
	fbn,a	%fcc3,	loop_2697
loop_2695:
	edge8l	%i4,	%g4,	%l5
	swap	[%l7 + 0x54],	%l4
loop_2696:
	ldsb	[%l7 + 0x1F],	%i1
loop_2697:
	sra	%o4,	%i2,	%o5
	call	loop_2698
	lduh	[%l7 + 0x66],	%o6
	set	0x5C, %l3
	ldsba	[%l7 + %l3] 0x18,	%o7
loop_2698:
	fandnot2s	%f12,	%f17,	%f30
	andcc	%g6,	%g7,	%o2
	fmovrdgz	%l6,	%f10,	%f2
	movpos	%xcc,	%o1,	%g5
	brlz	%i5,	loop_2699
	tcs	%xcc,	0x6
	sethi	0x12E3,	%l1
	addcc	%g3,	0x1A51,	%i6
loop_2699:
	xorcc	%g1,	%o0,	%l3
	fmovsn	%xcc,	%f15,	%f1
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f0
	popc	%i0,	%i3
	add	%l0,	0x0639,	%l2
	tsubcctv	%g2,	0x147B,	%i7
	ldsh	[%l7 + 0x32],	%i4
	edge32ln	%g4,	%l5,	%o3
	fbn,a	%fcc1,	loop_2700
	sdivx	%l4,	0x075A,	%i1
	bl,pt	%icc,	loop_2701
	fmovrse	%i2,	%f28,	%f13
loop_2700:
	tleu	%xcc,	0x0
	edge8n	%o4,	%o5,	%o7
loop_2701:
	nop
	setx	0x81FB6AF6FD0C7874,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1CB43F5934F9F5A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f16,	%f10
	fblg,a	%fcc1,	loop_2702
	fpadd16s	%f10,	%f16,	%f23
	xorcc	%o6,	0x0A62,	%g7
	addccc	%o2,	%g6,	%l6
loop_2702:
	te	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g5
	movle	%icc,	%i5,	%l1
	sdivcc	%g3,	0x1186,	%o1
	tge	%xcc,	0x0
	bneg,a	loop_2703
	srl	%g1,	0x10,	%i6
	tn	%xcc,	0x7
	sethi	0x1487,	%o0
loop_2703:
	alignaddrl	%l3,	%i0,	%i3
	fpsub32	%f8,	%f16,	%f16
	orn	%l0,	0x1C5C,	%g2
	bcc	loop_2704
	fbg,a	%fcc3,	loop_2705
	edge32l	%i7,	%l2,	%i4
	xorcc	%l5,	0x1AFC,	%g4
loop_2704:
	nop
	set	0x76, %l5
	ldsba	[%l7 + %l5] 0x10,	%o3
loop_2705:
	umulcc	%i1,	0x00AB,	%l4
	sdivcc	%i2,	0x1A75,	%o4
	ble	%icc,	loop_2706
	nop
	fitos	%f10,	%f12
	sir	0x1A91
	movleu	%xcc,	%o5,	%o6
loop_2706:
	taddcc	%o7,	0x1116,	%o2
	prefetch	[%l7 + 0x7C],	 0x0
	fabss	%f6,	%f3
	fmovs	%f29,	%f31
	fmovsneg	%xcc,	%f16,	%f17
	umul	%g7,	0x07FC,	%g6
	add	%l6,	%g5,	%i5
	srax	%g3,	0x1E,	%l1
	edge8l	%o1,	%g1,	%o0
	edge32ln	%i6,	%l3,	%i0
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbu	%fcc1,	loop_2707
	brz	%i3,	loop_2708
	tpos	%icc,	0x2
	brlez,a	%g2,	loop_2709
loop_2707:
	sdiv	%i7,	0x0D1F,	%l2
loop_2708:
	nop
	set	0x18, %i2
	ldsha	[%l7 + %i2] 0x10,	%l0
loop_2709:
	edge32n	%i4,	%l5,	%g4
	orncc	%o3,	0x0176,	%i1
	fpsub32s	%f9,	%f20,	%f7
	edge8ln	%i2,	%o4,	%o5
	call	loop_2710
	fmovsneg	%icc,	%f28,	%f23
	tvs	%xcc,	0x6
	addcc	%l4,	%o7,	%o6
loop_2710:
	fxnors	%f29,	%f20,	%f17
	tcs	%xcc,	0x7
	nop
	setx loop_2711, %l0, %l1
	jmpl %l1, %o2
	udivcc	%g7,	0x0EFF,	%g6
	edge16	%l6,	%i5,	%g5
	edge8ln	%g3,	%o1,	%l1
loop_2711:
	sra	%g1,	%o0,	%i6
	movrlz	%i0,	%i3,	%l3
	edge16l	%g2,	%i7,	%l0
	edge16	%l2,	%i4,	%l5
	udivx	%o3,	0x1814,	%g4
	nop
	fitod	%f27,	%f26
	array8	%i1,	%o4,	%i2
	movn	%icc,	%l4,	%o7
	tn	%xcc,	0x5
	ta	%xcc,	0x4
	orn	%o6,	0x193E,	%o5
	ldd	[%l7 + 0x58],	%f26
	fbge,a	%fcc0,	loop_2712
	fpackfix	%f10,	%f24
	ldsh	[%l7 + 0x48],	%o2
	nop
	setx	loop_2713,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2712:
	for	%f16,	%f0,	%f12
	set	0x78, %g5
	stha	%g6,	[%l7 + %g5] 0x11
loop_2713:
	mulscc	%l6,	0x0583,	%g7
	movneg	%xcc,	%g5,	%g3
	sra	%i5,	%l1,	%g1
	taddcctv	%o0,	0x1ECE,	%o1
	srl	%i0,	0x12,	%i6
	edge8	%l3,	%i3,	%i7
	and	%g2,	%l0,	%i4
	nop
	setx	0xD3391B4330773982,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	array8	%l2,	%o3,	%l5
	orncc	%g4,	0x0732,	%o4
	wr	%g0,	0x2a,	%asi
	stha	%i2,	[%l7 + 0x68] %asi
	membar	#Sync
	bg,pn	%icc,	loop_2714
	fnors	%f16,	%f29,	%f31
	edge32n	%l4,	%o7,	%i1
	movne	%icc,	%o5,	%o6
loop_2714:
	addcc	%o2,	%g6,	%g7
	xnorcc	%l6,	0x0635,	%g5
	fxnors	%f0,	%f4,	%f21
	set	0x3C, %i1
	stwa	%i5,	[%l7 + %i1] 0x81
	brlez,a	%g3,	loop_2715
	movcs	%xcc,	%l1,	%o0
	tle	%xcc,	0x6
	fmovrsne	%g1,	%f30,	%f28
loop_2715:
	tvs	%icc,	0x6
	udiv	%i0,	0x182A,	%o1
	te	%icc,	0x6
	tcc	%xcc,	0x4
	sethi	0x1DC4,	%l3
	membar	0x16
	fmovrdlz	%i3,	%f22,	%f30
	fpadd16s	%f16,	%f18,	%f6
	sdiv	%i7,	0x0B78,	%g2
	sll	%l0,	0x1A,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pn	%xcc,	loop_2716
	fmovsgu	%icc,	%f31,	%f8
	movn	%xcc,	%l2,	%i6
	te	%xcc,	0x0
loop_2716:
	tsubcc	%l5,	%o3,	%g4
	stbar
	ble	%xcc,	loop_2717
	sdivcc	%i2,	0x06FC,	%o4
	tgu	%xcc,	0x4
	subc	%o7,	%i1,	%l4
loop_2717:
	tne	%icc,	0x0
	set	0x3E, %o7
	stha	%o5,	[%l7 + %o7] 0x81
	or	%o2,	0x1D81,	%o6
	fpsub16s	%f7,	%f1,	%f18
	fmovscc	%xcc,	%f28,	%f1
	fmul8x16al	%f8,	%f5,	%f26
	udivcc	%g6,	0x0B9C,	%l6
	brnz,a	%g7,	loop_2718
	srl	%g5,	%g3,	%l1
	ba,a	loop_2719
	ble,pn	%icc,	loop_2720
loop_2718:
	sdivx	%o0,	0x02B3,	%g1
	set	0x24, %l0
	sta	%f7,	[%l7 + %l0] 0x81
loop_2719:
	tneg	%xcc,	0x2
loop_2720:
	edge32	%i5,	%i0,	%l3
	tleu	%xcc,	0x5
	umul	%i3,	%i7,	%g2
	tgu	%icc,	0x3
	fxnor	%f8,	%f16,	%f10
	alignaddr	%l0,	%i4,	%l2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%i6
	move	%xcc,	%o1,	%o3
	taddcc	%g4,	%i2,	%l5
	fsrc2s	%f27,	%f12
	lduw	[%l7 + 0x10],	%o7
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	popc	0x1C90,	%l4
	lduw	[%l7 + 0x60],	%o4
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f16
	fxtos	%f16,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a	loop_2721
	ldstub	[%l7 + 0x2F],	%o2
	nop
	setx loop_2722, %l0, %l1
	jmpl %l1, %o5
	fsrc1	%f4,	%f0
loop_2721:
	srl	%g6,	%o6,	%g7
	fmovdleu	%icc,	%f10,	%f31
loop_2722:
	fnands	%f14,	%f10,	%f28
	move	%icc,	%g5,	%g3
	movvc	%icc,	%l6,	%o0
	srlx	%g1,	%i5,	%i0
	fmovsvc	%icc,	%f5,	%f25
	brlez	%l3,	loop_2723
	udivcc	%i3,	0x15EE,	%i7
	movrlez	%g2,	%l0,	%l1
	st	%f21,	[%l7 + 0x0C]
loop_2723:
	or	%l2,	0x1B4B,	%i6
	umul	%o1,	%i4,	%g4
	mova	%xcc,	%o3,	%l5
	nop
	set	0x37, %o2
	ldub	[%l7 + %o2],	%o7
	fornot2	%f6,	%f10,	%f4
	set	0x38, %i7
	stxa	%i1,	[%l7 + %i7] 0x23
	membar	#Sync
	ba	loop_2724
	ldsb	[%l7 + 0x4B],	%l4
	tpos	%icc,	0x5
	fone	%f10
loop_2724:
	udivcc	%i2,	0x0AD5,	%o2
	bn,pt	%xcc,	loop_2725
	udivcc	%o4,	0x144C,	%g6
	stb	%o5,	[%l7 + 0x58]
	movrne	%g7,	%g5,	%o6
loop_2725:
	edge32	%l6,	%o0,	%g3
	sir	0x0074
	edge8	%g1,	%i5,	%l3
	addcc	%i0,	%i3,	%g2
	fmovdgu	%xcc,	%f18,	%f30
	nop
	setx	0x62A950BB707CBE5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	edge8l	%l0,	%i7,	%l2
	ldx	[%l7 + 0x20],	%i6
	tne	%icc,	0x0
	movpos	%icc,	%o1,	%i4
	fcmpeq32	%f16,	%f22,	%l1
	bleu	%icc,	loop_2726
	te	%xcc,	0x5
	ldsh	[%l7 + 0x76],	%g4
	movrlz	%l5,	%o7,	%o3
loop_2726:
	bge,a,pt	%xcc,	loop_2727
	movgu	%xcc,	%l4,	%i2
	sethi	0x0075,	%o2
	for	%f8,	%f8,	%f16
loop_2727:
	nop
	setx	0x386F871D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x25258496,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f26,	%f14
	nop
	setx	0x356741B9D0541BD8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	bneg,pn	%icc,	loop_2728
	edge8n	%o4,	%i1,	%o5
	tpos	%xcc,	0x7
	movg	%xcc,	%g6,	%g7
loop_2728:
	brgz,a	%o6,	loop_2729
	sir	0x02D8
	fmovsneg	%icc,	%f31,	%f3
	nop
	setx	loop_2730,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2729:
	bneg,a	loop_2731
	sllx	%g5,	%o0,	%l6
	array32	%g3,	%i5,	%g1
loop_2730:
	andncc	%i0,	%l3,	%g2
loop_2731:
	nop
	fitos	%f7,	%f14
	fstod	%f14,	%f0
	fmul8x16al	%f1,	%f30,	%f8
	movneg	%icc,	%l0,	%i7
	fabss	%f14,	%f23
	tleu	%icc,	0x6
	fmovrsgez	%i3,	%f7,	%f21
	movvc	%xcc,	%l2,	%o1
	membar	0x72
	fbge	%fcc2,	loop_2732
	fmovsge	%xcc,	%f23,	%f5
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2732:
	nop
	setx	0xB0534B92,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f31
	wr	%g0,	0x80,	%asi
	stxa	%i4,	[%l7 + 0x30] %asi
	fbl	%fcc3,	loop_2733
	movle	%icc,	%l1,	%g4
	mova	%icc,	%l5,	%o7
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f10
	fxtos	%f10,	%f29
loop_2733:
	nop
	fitos	%f3,	%f1
	fstox	%f1,	%f18
	fxtos	%f18,	%f18
	fpack32	%f16,	%f16,	%f16
	sdivcc	%i6,	0x0959,	%l4
	sub	%i2,	0x1E7C,	%o3
	movne	%icc,	%o4,	%o2
	andncc	%o5,	%g6,	%i1
	srl	%o6,	%g7,	%g5
	set	0x20, %i4
	swapa	[%l7 + %i4] 0x19,	%o0
	movvc	%xcc,	%l6,	%g3
	fsrc2	%f6,	%f18
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%g0
	fmovdl	%xcc,	%f0,	%f6
	movl	%xcc,	%i0,	%l3
	array16	%g2,	%i5,	%l0
	edge8ln	%i3,	%i7,	%l2
	movrlz	%o1,	%i4,	%l1
	nop
	fitod	%f10,	%f28
	fdtox	%f28,	%f20
	ta	%xcc,	0x6
	bneg,a,pn	%xcc,	loop_2734
	fornot2	%f10,	%f14,	%f8
	tsubcctv	%l5,	%g4,	%i6
	movle	%xcc,	%o7,	%i2
loop_2734:
	umul	%l4,	0x05A0,	%o4
	movle	%xcc,	%o3,	%o2
	movrlez	%o5,	0x20E,	%i1
	movg	%xcc,	%g6,	%o6
	alignaddrl	%g7,	%o0,	%g5
	tcc	%icc,	0x3
	fornot2	%f28,	%f4,	%f14
	bvc,a,pt	%xcc,	loop_2735
	sdiv	%g3,	0x098B,	%g1
	movcc	%xcc,	%i0,	%l3
	lduh	[%l7 + 0x64],	%g2
loop_2735:
	movg	%xcc,	%i5,	%l6
	fnor	%f30,	%f14,	%f28
	fandnot1s	%f15,	%f7,	%f5
	mulx	%l0,	0x1E98,	%i7
	fmovrdgez	%l2,	%f8,	%f14
	edge32ln	%i3,	%i4,	%l1
	movrlz	%o1,	%g4,	%l5
	fmovde	%xcc,	%f19,	%f3
	stx	%i6,	[%l7 + 0x78]
	tg	%xcc,	0x3
	mova	%icc,	%o7,	%i2
	wr	%g0,	0x22,	%asi
	stba	%o4,	[%l7 + 0x51] %asi
	membar	#Sync
	orn	%l4,	%o2,	%o5
	fmovscs	%icc,	%f5,	%f1
	set	0x64, %l4
	ldsha	[%l7 + %l4] 0x89,	%i1
	tsubcc	%o3,	%o6,	%g7
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x28] %asi,	%g6
	fble,a	%fcc2,	loop_2736
	tl	%icc,	0x2
	addccc	%g5,	%g3,	%g1
	orn	%o0,	%l3,	%i0
loop_2736:
	membar	0x1D
	edge32	%g2,	%l6,	%l0
	fbne	%fcc2,	loop_2737
	fpsub16s	%f3,	%f10,	%f28
	movgu	%xcc,	%i5,	%i7
	movleu	%icc,	%l2,	%i4
loop_2737:
	fmul8x16au	%f11,	%f21,	%f20
	popc	0x04A2,	%l1
	movn	%xcc,	%i3,	%o1
	tgu	%icc,	0x2
	taddcc	%l5,	0x04F0,	%g4
	bleu,pn	%xcc,	loop_2738
	andn	%o7,	0x11B9,	%i6
	stw	%o4,	[%l7 + 0x20]
	popc	0x1DAF,	%l4
loop_2738:
	swap	[%l7 + 0x54],	%o2
	bleu,a	loop_2739
	taddcc	%o5,	%i1,	%o3
	edge32l	%i2,	%o6,	%g6
	fors	%f30,	%f14,	%f28
loop_2739:
	ld	[%l7 + 0x78],	%f23
	fands	%f15,	%f16,	%f0
	brlz,a	%g7,	loop_2740
	brgez,a	%g5,	loop_2741
	membar	0x7E
	fmovrdgz	%g1,	%f10,	%f6
loop_2740:
	andncc	%o0,	%l3,	%g3
loop_2741:
	stx	%i0,	[%l7 + 0x28]
	subcc	%g2,	%l6,	%i5
	te	%xcc,	0x5
	fornot2s	%f9,	%f2,	%f2
	tgu	%icc,	0x7
	edge32	%i7,	%l0,	%l2
	edge32	%l1,	%i4,	%o1
	fpack32	%f4,	%f6,	%f14
	movrne	%i3,	0x244,	%g4
	sir	0x1F3E
	addcc	%l5,	0x1332,	%i6
	fpadd16s	%f18,	%f0,	%f23
	sra	%o7,	%o4,	%l4
	movle	%xcc,	%o2,	%i1
	bl	%xcc,	loop_2742
	tn	%xcc,	0x0
	srlx	%o5,	%i2,	%o3
	edge32n	%g6,	%g7,	%o6
loop_2742:
	movpos	%xcc,	%g5,	%o0
	edge8	%l3,	%g3,	%g1
	fabss	%f8,	%f9
	fmovrsne	%g2,	%f26,	%f3
	edge32	%l6,	%i0,	%i5
	andncc	%l0,	%l2,	%l1
	andn	%i4,	0x0C6E,	%o1
	tsubcc	%i7,	%g4,	%i3
	fnegs	%f2,	%f9
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x08] %asi,	%l5
	brgez	%o7,	loop_2743
	brlz	%i6,	loop_2744
	orcc	%o4,	%l4,	%o2
	nop
	fitos	%f11,	%f27
	fstod	%f27,	%f4
loop_2743:
	fmovdgu	%icc,	%f16,	%f7
loop_2744:
	taddcc	%i1,	%i2,	%o3
	movn	%xcc,	%o5,	%g7
	movge	%icc,	%o6,	%g5
	andcc	%o0,	0x0FB2,	%l3
	fmuld8sux16	%f7,	%f21,	%f10
	fbule,a	%fcc1,	loop_2745
	fmul8x16au	%f12,	%f30,	%f18
	fnor	%f12,	%f24,	%f30
	ld	[%l7 + 0x38],	%f23
loop_2745:
	popc	0x07EF,	%g6
	stb	%g1,	[%l7 + 0x23]
	tn	%xcc,	0x0
	movgu	%xcc,	%g3,	%l6
	subc	%g2,	%i5,	%l0
	movgu	%xcc,	%i0,	%l1
	bgu	loop_2746
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x4
	tpos	%xcc,	0x4
loop_2746:
	tn	%icc,	0x1
	movpos	%xcc,	%i4,	%o1
	alignaddrl	%i7,	%l2,	%g4
	movrlz	%i3,	0x1D1,	%l5
	edge32n	%i6,	%o4,	%l4
	sra	%o2,	0x07,	%o7
	fornot2s	%f5,	%f7,	%f2
	movneg	%icc,	%i2,	%i1
	edge8l	%o3,	%g7,	%o6
	sdivx	%o5,	0x1CAA,	%o0
	edge16	%g5,	%l3,	%g1
	orncc	%g6,	%g3,	%g2
	orcc	%i5,	0x0256,	%l6
	movpos	%icc,	%l0,	%i0
	tvc	%icc,	0x1
	xorcc	%l1,	%i4,	%i7
	fbn	%fcc0,	loop_2747
	edge8n	%o1,	%g4,	%i3
	alignaddr	%l2,	%l5,	%o4
	orncc	%l4,	%o2,	%o7
loop_2747:
	tg	%icc,	0x1
	membar	0x34
	call	loop_2748
	movn	%icc,	%i2,	%i6
	fba,a	%fcc3,	loop_2749
	movne	%icc,	%i1,	%o3
loop_2748:
	movrgez	%o6,	%o5,	%g7
	fmovrsgz	%g5,	%f27,	%f28
loop_2749:
	srlx	%l3,	0x00,	%g1
	xnorcc	%g6,	%o0,	%g2
	fbl,a	%fcc1,	loop_2750
	edge16ln	%i5,	%l6,	%g3
	movvs	%xcc,	%l0,	%i0
	sll	%i4,	0x0B,	%i7
loop_2750:
	movle	%icc,	%o1,	%l1
	ldsw	[%l7 + 0x78],	%i3
	fandnot1	%f26,	%f10,	%f26
	umul	%g4,	0x020E,	%l2
	tsubcctv	%o4,	0x0663,	%l4
	xnorcc	%l5,	%o2,	%o7
	srax	%i6,	0x0E,	%i1
	tg	%xcc,	0x7
	movl	%icc,	%i2,	%o6
	tneg	%icc,	0x3
	set	0x70, %i0
	ldda	[%l7 + %i0] 0xeb,	%o4
	or	%g7,	%g5,	%l3
	fone	%f0
	tleu	%icc,	0x6
	fmovdvc	%xcc,	%f25,	%f9
	wr	%g0,	0xeb,	%asi
	stha	%g1,	[%l7 + 0x26] %asi
	membar	#Sync
	tn	%xcc,	0x0
	movrlz	%g6,	0x080,	%o3
	tcc	%icc,	0x7
	udiv	%o0,	0x0325,	%i5
	fmovdvc	%xcc,	%f21,	%f14
	movcs	%icc,	%l6,	%g3
	tsubcctv	%l0,	%g2,	%i4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x10] %asi,	%i7
	movle	%xcc,	%i0,	%l1
	ldsh	[%l7 + 0x6C],	%o1
	set	0x08, %l1
	lda	[%l7 + %l1] 0x80,	%f22
	tcs	%xcc,	0x7
	ld	[%l7 + 0x44],	%f24
	ldx	[%l7 + 0x58],	%g4
	udiv	%l2,	0x078E,	%o4
	bcc,pn	%icc,	loop_2751
	movg	%icc,	%i3,	%l5
	tvs	%icc,	0x7
	movgu	%xcc,	%l4,	%o7
loop_2751:
	alignaddr	%o2,	%i1,	%i2
	mulscc	%i6,	%o5,	%o6
	andncc	%g7,	%l3,	%g5
	movrlez	%g6,	%o3,	%g1
	set	0x64, %g4
	lduha	[%l7 + %g4] 0x80,	%o0
	fbul,a	%fcc1,	loop_2752
	srl	%l6,	0x06,	%i5
	or	%g3,	%l0,	%i4
	movrlez	%i7,	%i0,	%g2
loop_2752:
	addccc	%o1,	0x0C8A,	%g4
	bl	loop_2753
	addc	%l1,	0x0141,	%o4
	fmovrdgez	%l2,	%f6,	%f22
	fones	%f13
loop_2753:
	and	%i3,	0x18B8,	%l4
	tneg	%icc,	0x1
	bcs	loop_2754
	edge32	%o7,	%o2,	%i1
	alignaddr	%i2,	%i6,	%l5
	ta	%icc,	0x3
loop_2754:
	alignaddrl	%o5,	%g7,	%o6
	bn	loop_2755
	sdivx	%l3,	0x10B1,	%g6
	xnor	%o3,	%g5,	%g1
	fones	%f20
loop_2755:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x26] %asi,	%l6
	edge32	%o0,	%g3,	%l0
	tge	%xcc,	0x5
	fmovdg	%xcc,	%f29,	%f23
	edge16l	%i5,	%i7,	%i0
	fbge	%fcc1,	loop_2756
	fbu	%fcc3,	loop_2757
	movle	%icc,	%i4,	%o1
	tpos	%xcc,	0x1
loop_2756:
	call	loop_2758
loop_2757:
	edge32l	%g4,	%g2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%l1,	loop_2759
loop_2758:
	tge	%xcc,	0x3
	ldstub	[%l7 + 0x79],	%i3
	movre	%l2,	%o7,	%o2
loop_2759:
	ldx	[%l7 + 0x08],	%l4
	fandnot2	%f30,	%f28,	%f26
	addccc	%i1,	0x17A5,	%i2
	set	0x7C, %l6
	swapa	[%l7 + %l6] 0x18,	%l5
	sll	%i6,	%g7,	%o5
	orncc	%l3,	%o6,	%g6
	lduh	[%l7 + 0x40],	%g5
	fmovdg	%icc,	%f23,	%f3
	fpadd32	%f8,	%f4,	%f2
	xnorcc	%g1,	%l6,	%o0
	membar	0x4A
	ldsw	[%l7 + 0x64],	%g3
	smul	%o3,	0x1C60,	%l0
	srax	%i7,	%i5,	%i4
	fmovsl	%icc,	%f28,	%f6
	membar	0x22
	addc	%i0,	0x1AC2,	%o1
	bshuffle	%f4,	%f16,	%f6
	mulx	%g2,	0x1A4C,	%o4
	edge16ln	%l1,	%i3,	%l2
	taddcc	%o7,	%g4,	%l4
	move	%xcc,	%o2,	%i2
	fones	%f11
	sub	%l5,	%i6,	%i1
	tn	%xcc,	0x3
	xor	%o5,	%l3,	%g7
	call	loop_2760
	nop
	setx	loop_2761,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x0F8A,	%g6
	fmovdleu	%xcc,	%f2,	%f6
loop_2760:
	sra	%o6,	%g1,	%l6
loop_2761:
	taddcctv	%o0,	%g3,	%o3
	movrlez	%g5,	0x1D1,	%l0
	add	%i5,	0x13DC,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i0,	%o1
	movrlz	%i7,	%g2,	%l1
	bgu,pt	%icc,	loop_2762
	orn	%o4,	%i3,	%o7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%l2
loop_2762:
	smulcc	%l4,	%o2,	%i2
	set	0x39, %i5
	lduba	[%l7 + %i5] 0x04,	%l5
	tsubcc	%g4,	%i1,	%i6
	fornot1s	%f11,	%f25,	%f24
	fcmple16	%f6,	%f12,	%o5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	movvs	%xcc,	%g7,	%g6
	subccc	%g1,	%o6,	%l6
	fzeros	%f22
	orn	%g3,	0x1468,	%o3
	ble	%xcc,	loop_2763
	tgu	%icc,	0x5
	fzeros	%f20
	edge32	%o0,	%l0,	%i5
loop_2763:
	fpack32	%f18,	%f10,	%f10
	ldd	[%l7 + 0x08],	%g4
	umul	%i4,	0x06D8,	%i0
	fmovdcs	%icc,	%f12,	%f9
	udivcc	%i7,	0x0B99,	%g2
	edge16n	%o1,	%o4,	%i3
	movvc	%icc,	%o7,	%l2
	nop
	fitos	%f12,	%f30
	fstod	%f30,	%f16
	set	0x0E, %l2
	ldstuba	[%l7 + %l2] 0x88,	%l4
	movrne	%l1,	%i2,	%o2
	fmovscs	%icc,	%f17,	%f8
	xnorcc	%l5,	%g4,	%i1
	tle	%xcc,	0x7
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x15
	addcc	%o5,	%i6,	%l3
	fmovspos	%icc,	%f18,	%f1
	faligndata	%f16,	%f28,	%f22
	move	%xcc,	%g6,	%g7
	tle	%icc,	0x1
	tn	%xcc,	0x7
	edge16ln	%o6,	%g1,	%g3
	movvs	%xcc,	%o3,	%l6
	ldsh	[%l7 + 0x7A],	%o0
	tvc	%xcc,	0x3
	movrne	%i5,	%g5,	%l0
	fmovsa	%xcc,	%f29,	%f2
	mova	%icc,	%i0,	%i4
	movleu	%icc,	%g2,	%o1
	nop
	setx loop_2764, %l0, %l1
	jmpl %l1, %i7
	ldsh	[%l7 + 0x1A],	%i3
	tneg	%xcc,	0x6
	fbug	%fcc1,	loop_2765
loop_2764:
	nop
	setx	0xC643CD335D8D26ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f28
	tvs	%xcc,	0x2
	mulx	%o4,	0x1CA4,	%l2
loop_2765:
	sir	0x1B87
	subccc	%o7,	0x0C3A,	%l1
	fbug,a	%fcc3,	loop_2766
	xnor	%l4,	%o2,	%i2
	sllx	%g4,	%l5,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i1,	%i6
loop_2766:
	bcc,a	%xcc,	loop_2767
	movre	%g6,	%l3,	%o6
	andn	%g1,	0x07F5,	%g7
	fmovspos	%xcc,	%f31,	%f11
loop_2767:
	fbg	%fcc1,	loop_2768
	fzeros	%f31
	and	%o3,	%g3,	%o0
	smulcc	%l6,	%i5,	%g5
loop_2768:
	tcs	%icc,	0x3
	tne	%icc,	0x7
	nop
	setx	0x58A4F9A51684B52A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD97A1CBBD2E00DD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f0,	%f16
	fornot1s	%f18,	%f12,	%f24
	brz	%l0,	loop_2769
	tgu	%icc,	0x6
	alignaddr	%i0,	%i4,	%o1
	umul	%g2,	%i3,	%o4
loop_2769:
	call	loop_2770
	fmovspos	%icc,	%f22,	%f22
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2770:
	fmovrde	%i7,	%f14,	%f26
	fmovrse	%l2,	%f12,	%f8
	fmovda	%xcc,	%f15,	%f1
	set	0x7C, %i6
	lduha	[%l7 + %i6] 0x18,	%l1
	sth	%o7,	[%l7 + 0x24]
	orn	%o2,	%i2,	%g4
	mulx	%l5,	%o5,	%i1
	set	0x7C, %g2
	sta	%f7,	[%l7 + %g2] 0x04
	fbe,a	%fcc3,	loop_2771
	movvc	%icc,	%l4,	%g6
	wr	%g0,	0x80,	%asi
	stba	%i6,	[%l7 + 0x52] %asi
loop_2771:
	edge8	%l3,	%o6,	%g7
	fornot1s	%f5,	%f14,	%f9
	call	loop_2772
	bleu	%icc,	loop_2773
	movg	%xcc,	%g1,	%o3
	fmovrde	%o0,	%f26,	%f4
loop_2772:
	taddcc	%l6,	0x1197,	%g3
loop_2773:
	popc	%i5,	%l0
	movgu	%xcc,	%g5,	%i0
	fnot2	%f24,	%f18
	or	%o1,	0x13D0,	%i4
	orn	%i3,	0x1AE5,	%g2
	sllx	%i7,	%l2,	%l1
	move	%xcc,	%o4,	%o2
	alignaddrl	%i2,	%g4,	%o7
	bvs,a,pn	%icc,	loop_2774
	brgez,a	%l5,	loop_2775
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i1,	0x1E74,	%l4
loop_2774:
	alignaddrl	%g6,	%i6,	%o5
loop_2775:
	xnorcc	%o6,	0x13E6,	%g7
	nop
	set	0x66, %o1
	lduh	[%l7 + %o1],	%l3
	edge8	%g1,	%o3,	%o0
	edge8l	%l6,	%i5,	%l0
	tne	%xcc,	0x4
	tsubcc	%g5,	0x184C,	%g3
	xorcc	%i0,	%i4,	%o1
	sth	%g2,	[%l7 + 0x6A]
	xnorcc	%i7,	%i3,	%l2
	nop
	setx	0x8745AFEE2DD3BF79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC2F402CD9412154D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f16,	%f16
	tsubcctv	%l1,	0x156F,	%o4
	bpos,a,pt	%xcc,	loop_2776
	fnegd	%f26,	%f14
	nop
	setx	loop_2777,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%i2,	%g4,	%o7
loop_2776:
	fcmpne16	%f24,	%f14,	%o2
	edge32n	%l5,	%i1,	%g6
loop_2777:
	edge8n	%i6,	%o5,	%o6
	fand	%f14,	%f0,	%f8
	tcc	%xcc,	0x3
	add	%l4,	0x16DB,	%l3
	popc	%g7,	%o3
	sll	%o0,	0x00,	%g1
	array32	%i5,	%l0,	%g5
	udiv	%g3,	0x00A8,	%i0
	tneg	%xcc,	0x3
	mulscc	%l6,	%i4,	%o1
	bvc,a	%xcc,	loop_2778
	tneg	%icc,	0x6
	fpsub16s	%f12,	%f23,	%f5
	fbul,a	%fcc2,	loop_2779
loop_2778:
	addccc	%g2,	0x156C,	%i3
	umulcc	%l2,	%i7,	%l1
	fblg,a	%fcc2,	loop_2780
loop_2779:
	ldstub	[%l7 + 0x1E],	%i2
	stw	%o4,	[%l7 + 0x5C]
	fcmpgt32	%f28,	%f24,	%g4
loop_2780:
	nop
	set	0x49, %o3
	ldub	[%l7 + %o3],	%o2
	brz	%o7,	loop_2781
	edge32	%i1,	%l5,	%g6
	umul	%i6,	0x1DDA,	%o5
	alignaddrl	%o6,	%l4,	%l3
loop_2781:
	fmovrdgz	%g7,	%f12,	%f6
	fmovdl	%xcc,	%f20,	%f23
	fands	%f7,	%f17,	%f15
	movgu	%xcc,	%o0,	%g1
	tsubcc	%i5,	%o3,	%l0
	fbue	%fcc3,	loop_2782
	xnorcc	%g5,	0x01B0,	%g3
	fbul	%fcc0,	loop_2783
	tg	%icc,	0x4
loop_2782:
	tsubcctv	%i0,	%i4,	%l6
	edge16l	%g2,	%i3,	%l2
loop_2783:
	movgu	%icc,	%i7,	%o1
	or	%l1,	0x1D29,	%o4
	array32	%g4,	%i2,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f22,	%f21,	%f7
	brlz,a	%i1,	loop_2784
	sth	%o7,	[%l7 + 0x2A]
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2784:
	nop
	set	0x71, %o6
	ldstub	[%l7 + %o6],	%l5
	srax	%g6,	0x02,	%o5
	popc	%o6,	%i6
	tge	%icc,	0x1
	brz	%l4,	loop_2785
	fbe,a	%fcc3,	loop_2786
	sdiv	%g7,	0x0CAE,	%l3
	sllx	%g1,	0x04,	%o0
loop_2785:
	fnot2	%f10,	%f20
loop_2786:
	nop
	fitos	%f6,	%f0
	fstox	%f0,	%f6
	movpos	%icc,	%o3,	%i5
	umulcc	%l0,	%g3,	%i0
	xor	%i4,	0x09BC,	%l6
	nop
	set	0x10, %o5
	std	%f2,	[%l7 + %o5]
	ta	%icc,	0x7
	bgu,a	%icc,	loop_2787
	array16	%g5,	%i3,	%l2
	edge8l	%g2,	%o1,	%l1
	movvs	%icc,	%i7,	%o4
loop_2787:
	movrgz	%g4,	%i2,	%o2
	set	0x58, %i3
	lda	[%l7 + %i3] 0x89,	%f17
	srlx	%i1,	%o7,	%g6
	be,a,pn	%xcc,	loop_2788
	tge	%icc,	0x4
	fbule	%fcc3,	loop_2789
	addc	%l5,	%o6,	%o5
loop_2788:
	brgez	%l4,	loop_2790
	be,a,pn	%xcc,	loop_2791
loop_2789:
	std	%f30,	[%l7 + 0x38]
	edge8l	%g7,	%i6,	%g1
loop_2790:
	tle	%icc,	0x4
loop_2791:
	edge16n	%o0,	%o3,	%l3
	alignaddrl	%l0,	%i5,	%i0
	edge8n	%i4,	%l6,	%g3
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%i3
	add	%g5,	0x146E,	%g2
	fba,a	%fcc1,	loop_2792
	tl	%xcc,	0x1
	array16	%l2,	%o1,	%i7
	mulscc	%l1,	%g4,	%i2
loop_2792:
	fnot2	%f8,	%f8
	movrlez	%o2,	%i1,	%o7
	fbe,a	%fcc1,	loop_2793
	or	%o4,	0x0FDD,	%l5
	and	%g6,	%o6,	%o5
	edge8	%l4,	%g7,	%g1
loop_2793:
	be	%icc,	loop_2794
	fmovsa	%icc,	%f0,	%f10
	ldub	[%l7 + 0x46],	%i6
	fexpand	%f17,	%f12
loop_2794:
	orncc	%o0,	0x003B,	%l3
	array8	%o3,	%l0,	%i5
	brz	%i0,	loop_2795
	tcc	%icc,	0x2
	fnands	%f29,	%f30,	%f6
	fmovsvc	%xcc,	%f26,	%f7
loop_2795:
	nop
	set	0x2E, %o0
	ldsh	[%l7 + %o0],	%l6
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f0
	fxtod	%f0,	%f4
	movn	%icc,	%g3,	%i4
	nop
	setx	0x1D479B8ACF9E69AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF6134EB2AD32D413,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f0,	%f4
	nop
	setx	0x504E6C2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	mulx	%i3,	%g5,	%g2
	fbuge	%fcc0,	loop_2796
	tleu	%xcc,	0x7
	fzero	%f4
	fbule,a	%fcc3,	loop_2797
loop_2796:
	stw	%o1,	[%l7 + 0x6C]
	sdivcc	%i7,	0x16E4,	%l1
	nop
	setx	loop_2798,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2797:
	tvs	%xcc,	0x6
	alignaddr	%l2,	%g4,	%o2
	movl	%xcc,	%i2,	%i1
loop_2798:
	prefetch	[%l7 + 0x28],	 0x2
	movge	%icc,	%o7,	%o4
	tcs	%xcc,	0x0
	movrlz	%l5,	0x134,	%g6
	sir	0x0D3E
	ba,pn	%xcc,	loop_2799
	orcc	%o6,	%l4,	%o5
	brgez	%g1,	loop_2800
	mulscc	%i6,	%o0,	%g7
loop_2799:
	fmovdleu	%xcc,	%f19,	%f12
	fbul	%fcc1,	loop_2801
loop_2800:
	xnor	%l3,	%l0,	%i5
	bvs,pn	%icc,	loop_2802
	movrlz	%i0,	0x065,	%o3
loop_2801:
	sdivcc	%l6,	0x1F74,	%g3
	umul	%i3,	0x01A4,	%i4
loop_2802:
	nop
	set	0x0A, %g3
	ldstuba	[%l7 + %g3] 0x0c,	%g2
	tgu	%icc,	0x5
	fble	%fcc2,	loop_2803
	fsrc2	%f28,	%f26
	nop
	fitos	%f9,	%f14
	fstod	%f14,	%f8
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f5
loop_2803:
	tgu	%xcc,	0x6
	nop
	setx	0xE710EBB8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xEB10B66B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f31,	%f23
	fpadd16s	%f14,	%f17,	%f2
	movcs	%icc,	%o1,	%g5
	movvs	%xcc,	%i7,	%l2
	fsrc2s	%f31,	%f13
	addccc	%l1,	%o2,	%i2
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x10,	%i1
	tgu	%icc,	0x1
	edge16ln	%g4,	%o7,	%l5
	movrlz	%g6,	%o4,	%o6
	srlx	%l4,	0x0B,	%o5
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f6
	xnorcc	%g1,	0x0314,	%i6
	fbue,a	%fcc1,	loop_2804
	fbne,a	%fcc2,	loop_2805
	fbge,a	%fcc0,	loop_2806
	tneg	%icc,	0x2
loop_2804:
	edge32l	%o0,	%g7,	%l0
loop_2805:
	fmovdl	%icc,	%f17,	%f10
loop_2806:
	subccc	%i5,	%i0,	%l3
	edge16n	%l6,	%g3,	%i3
	subc	%o3,	%g2,	%o1
	fcmpne32	%f24,	%f20,	%i4
	fxors	%f17,	%f1,	%f13
	membar	0x38
	bleu,pn	%xcc,	loop_2807
	tl	%icc,	0x2
	edge32n	%g5,	%i7,	%l2
	fba,a	%fcc3,	loop_2808
loop_2807:
	fcmpeq32	%f30,	%f8,	%l1
	srl	%o2,	0x01,	%i2
	lduw	[%l7 + 0x68],	%i1
loop_2808:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g4
	andn	%l5,	0x06A6,	%g6
	ldsw	[%l7 + 0x58],	%o4
	srlx	%o7,	%l4,	%o5
	fbug	%fcc3,	loop_2809
	orcc	%o6,	0x08B8,	%g1
	edge32	%i6,	%o0,	%l0
	movcs	%icc,	%g7,	%i5
loop_2809:
	fcmpne16	%f2,	%f18,	%l3
	nop
	setx	0x771C9428A76B86F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x01B5E41C7F73806A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f26,	%f26
	fpackfix	%f0,	%f29
	fbue,a	%fcc3,	loop_2810
	movcs	%icc,	%i0,	%g3
	tge	%icc,	0x6
	tl	%icc,	0x1
loop_2810:
	call	loop_2811
	fmovs	%f30,	%f20
	popc	0x1590,	%l6
	fbn	%fcc0,	loop_2812
loop_2811:
	smulcc	%i3,	0x0231,	%g2
	edge8ln	%o3,	%i4,	%o1
	smul	%i7,	0x0A74,	%g5
loop_2812:
	membar	0x17
	set	0x08, %g1
	stha	%l1,	[%l7 + %g1] 0x89
	movne	%xcc,	%o2,	%l2
	fandnot1	%f26,	%f16,	%f20
	orncc	%i2,	0x1AD5,	%g4
	fbn,a	%fcc3,	loop_2813
	fnand	%f14,	%f8,	%f20
	call	loop_2814
	membar	0x74
loop_2813:
	array8	%l5,	%g6,	%o4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%i1
loop_2814:
	movrlez	%o7,	0x001,	%o5
	sub	%o6,	%l4,	%i6
	bge	loop_2815
	fbue	%fcc3,	loop_2816
	fcmpne16	%f12,	%f18,	%g1
	fbn,a	%fcc3,	loop_2817
loop_2815:
	movrne	%o0,	%g7,	%l0
loop_2816:
	fmovsleu	%xcc,	%f5,	%f5
	bne,pn	%icc,	loop_2818
loop_2817:
	movre	%i5,	%l3,	%i0
	swap	[%l7 + 0x28],	%l6
	std	%f4,	[%l7 + 0x60]
loop_2818:
	xnor	%g3,	%g2,	%o3
	fnot1	%f22,	%f28
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%o1
	add	%i7,	%g5,	%l1
	fbg,a	%fcc0,	loop_2819
	fxnors	%f13,	%f23,	%f29
	fmovsn	%xcc,	%f10,	%f10
	sir	0x0C1F
loop_2819:
	tle	%icc,	0x5
	fmul8ulx16	%f20,	%f20,	%f30
	nop
	fitos	%f2,	%f9
	fstox	%f9,	%f10
	fxtos	%f10,	%f21
	andcc	%o2,	0x05E2,	%l2
	fornot1s	%f26,	%f12,	%f30
	alignaddr	%i4,	%i2,	%l5
	udivx	%g4,	0x1809,	%g6
	fbule,a	%fcc1,	loop_2820
	mulscc	%i1,	%o4,	%o5
	fcmpeq16	%f20,	%f30,	%o7
	fmul8x16al	%f4,	%f23,	%f0
loop_2820:
	orncc	%l4,	%i6,	%g1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	tvs	%icc,	0x2
	alignaddr	%o0,	%l0,	%i5
	fbue	%fcc2,	loop_2821
	fsrc1	%f6,	%f24
	sllx	%g7,	0x08,	%i0
	fmovsgu	%xcc,	%f17,	%f17
loop_2821:
	fmovsne	%icc,	%f22,	%f0
	ldstub	[%l7 + 0x44],	%l6
	tvs	%icc,	0x2
	set	0x51, %l3
	ldstuba	[%l7 + %l3] 0x80,	%l3
	nop
	setx	0xDCC95A06,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x10C2E0F0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f0,	%f2
	or	%g2,	%g3,	%o3
	fbo	%fcc2,	loop_2822
	nop
	setx loop_2823, %l0, %l1
	jmpl %l1, %o1
	stbar
	fandnot2	%f16,	%f26,	%f10
loop_2822:
	sir	0x02F0
loop_2823:
	edge8	%i7,	%g5,	%i3
	edge8	%o2,	%l1,	%l2
	subccc	%i2,	0x1A66,	%i4
	fpmerge	%f23,	%f27,	%f18
	alignaddrl	%l5,	%g4,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o4,	%f21,	%f6
	edge8l	%i1,	%o5,	%l4
	fnors	%f27,	%f23,	%f19
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x2D] %asi,	%g1
	fandnot1s	%f28,	%f15,	%f21
	subc	%i6,	%o0,	%o6
	xor	%i5,	%l0,	%g7
	fpsub16s	%f26,	%f2,	%f29
	mulx	%l6,	0x19E1,	%i0
	andncc	%l3,	%g2,	%g3
	srax	%o3,	0x10,	%i7
	fbue,a	%fcc0,	loop_2824
	xorcc	%g5,	%o1,	%i3
	addcc	%l1,	%l2,	%i2
	movvc	%xcc,	%i4,	%o2
loop_2824:
	taddcc	%l5,	0x075F,	%g4
	set	0x5C, %o4
	ldswa	[%l7 + %o4] 0x11,	%g6
	swap	[%l7 + 0x74],	%o4
	tsubcc	%o5,	0x1551,	%i1
	subcc	%o7,	%l4,	%i6
	wr	%g0,	0x11,	%asi
	sta	%f0,	[%l7 + 0x14] %asi
	movg	%xcc,	%o0,	%g1
	wr	%g0,	0x2b,	%asi
	stba	%i5,	[%l7 + 0x1F] %asi
	membar	#Sync
	fmul8ulx16	%f2,	%f8,	%f10
	movrlz	%o6,	0x1D5,	%g7
	alignaddr	%l0,	%i0,	%l6
	umulcc	%g2,	0x1960,	%g3
	fcmple32	%f0,	%f30,	%o3
	subccc	%i7,	%l3,	%o1
	fbl,a	%fcc2,	loop_2825
	movrgez	%g5,	%i3,	%l1
	fornot2s	%f19,	%f7,	%f2
	ta	%icc,	0x6
loop_2825:
	fmovdcs	%icc,	%f7,	%f28
	andncc	%i2,	%i4,	%o2
	tsubcctv	%l2,	%g4,	%g6
	taddcc	%o4,	%l5,	%o5
	sdiv	%i1,	0x0725,	%l4
	lduh	[%l7 + 0x1E],	%o7
	subccc	%i6,	0x0A24,	%o0
	edge32l	%i5,	%o6,	%g1
	tsubcctv	%l0,	0x100E,	%i0
	xnorcc	%g7,	%g2,	%g3
	xnor	%o3,	%i7,	%l6
	sdivx	%o1,	0x078A,	%l3
	fcmpeq32	%f10,	%f26,	%g5
	fba,a	%fcc2,	loop_2826
	tvc	%xcc,	0x1
	umulcc	%l1,	0x0B0B,	%i2
	wr	%g0,	0x88,	%asi
	stha	%i4,	[%l7 + 0x32] %asi
loop_2826:
	udiv	%i3,	0x0B1A,	%l2
	udivx	%o2,	0x0347,	%g6
	movl	%icc,	%o4,	%g4
	xor	%o5,	0x0476,	%l5
	fpadd32s	%f4,	%f17,	%f29
	bneg,pn	%xcc,	loop_2827
	fmul8x16al	%f12,	%f23,	%f12
	set	0x34, %i2
	ldsha	[%l7 + %i2] 0x18,	%l4
loop_2827:
	movvc	%icc,	%i1,	%o7
	xor	%o0,	%i6,	%o6
	tvs	%icc,	0x3
	umulcc	%i5,	0x1720,	%g1
	edge8n	%i0,	%g7,	%g2
	tge	%xcc,	0x4
	ldsw	[%l7 + 0x4C],	%g3
	xorcc	%l0,	0x018C,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l6,	%o1,	%i7
	bne,pt	%xcc,	loop_2828
	move	%icc,	%g5,	%l1
	nop
	setx	0xEBDB487E504856AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tne	%xcc,	0x0
loop_2828:
	fandnot1s	%f14,	%f7,	%f11
	fmovscs	%xcc,	%f2,	%f1
	fsrc2	%f4,	%f30
	sll	%l3,	0x03,	%i2
	movrlez	%i3,	0x32F,	%l2
	bg,pn	%icc,	loop_2829
	umul	%i4,	%g6,	%o2
	or	%o4,	%o5,	%g4
	std	%f20,	[%l7 + 0x18]
loop_2829:
	add	%l4,	%i1,	%o7
	subcc	%l5,	0x0598,	%o0
	fandnot2s	%f17,	%f13,	%f12
	srax	%o6,	0x0D,	%i5
	addc	%i6,	%i0,	%g7
	ba	%icc,	loop_2830
	movn	%icc,	%g1,	%g3
	fbo	%fcc3,	loop_2831
	fmovrse	%g2,	%f30,	%f3
loop_2830:
	nop
	set	0x7A, %l5
	ldsha	[%l7 + %l5] 0x18,	%l0
loop_2831:
	tl	%xcc,	0x2
	fblg,a	%fcc1,	loop_2832
	fsrc1	%f26,	%f22
	edge8n	%l6,	%o3,	%i7
	movre	%o1,	0x278,	%g5
loop_2832:
	addccc	%l3,	%l1,	%i2
	sllx	%l2,	%i3,	%i4
	movl	%xcc,	%o2,	%g6
	udivcc	%o5,	0x1BD1,	%o4
	sethi	0x1865,	%g4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%l4
	movrgez	%i1,	%l5,	%o7
	tge	%icc,	0x7
	brnz,a	%o6,	loop_2833
	sethi	0x147C,	%o0
	fmovdne	%icc,	%f5,	%f10
	set	0x10, %i1
	sta	%f6,	[%l7 + %i1] 0x10
loop_2833:
	fbe	%fcc1,	loop_2834
	movcc	%icc,	%i5,	%i6
	fbo,a	%fcc2,	loop_2835
	fmovsvc	%xcc,	%f18,	%f15
loop_2834:
	ldub	[%l7 + 0x41],	%i0
	bge,a	loop_2836
loop_2835:
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f30
	tcc	%icc,	0x3
	fcmpgt32	%f8,	%f0,	%g1
loop_2836:
	fmovsge	%xcc,	%f31,	%f22
	fpack32	%f16,	%f6,	%f12
	fmovsg	%xcc,	%f13,	%f11
	movne	%icc,	%g3,	%g2
	nop
	fitos	%f7,	%f9
	fstox	%f9,	%f6
	fxtos	%f6,	%f23
	taddcctv	%l0,	0x1273,	%g7
	movvc	%icc,	%l6,	%i7
	movrne	%o3,	%o1,	%l3
	fones	%f8
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x70] %asi,	%f11
	edge16ln	%g5,	%i2,	%l1
	bneg	loop_2837
	and	%i3,	0x0914,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o2,	%g6,	%o5
loop_2837:
	bcc,a,pt	%icc,	loop_2838
	fbule	%fcc0,	loop_2839
	subcc	%o4,	%i4,	%g4
	fbl	%fcc2,	loop_2840
loop_2838:
	sir	0x0376
loop_2839:
	xnor	%i1,	%l5,	%l4
	edge32	%o6,	%o7,	%o0
loop_2840:
	stw	%i6,	[%l7 + 0x08]
	te	%icc,	0x2
	set	0x68, %o7
	lduha	[%l7 + %o7] 0x88,	%i5
	smul	%g1,	0x0348,	%i0
	movleu	%icc,	%g3,	%l0
	sll	%g7,	%l6,	%g2
	sllx	%o3,	%o1,	%i7
	array16	%l3,	%g5,	%l1
	edge32	%i2,	%l2,	%i3
	fbo,a	%fcc2,	loop_2841
	edge8l	%o2,	%g6,	%o4
	movleu	%xcc,	%i4,	%g4
	subc	%i1,	%l5,	%o5
loop_2841:
	mova	%xcc,	%o6,	%l4
	fmovrdlz	%o7,	%f2,	%f20
	add	%o0,	0x068F,	%i6
	fmovdg	%icc,	%f29,	%f14
	movge	%xcc,	%g1,	%i5
	nop
	setx	loop_2842,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%g3,	0x1045,	%i0
	movg	%xcc,	%g7,	%l0
	movvc	%xcc,	%g2,	%l6
loop_2842:
	tn	%xcc,	0x3
	tpos	%icc,	0x0
	subc	%o1,	0x086B,	%o3
	fbuge	%fcc3,	loop_2843
	fmovdvc	%icc,	%f12,	%f23
	taddcc	%l3,	%i7,	%g5
	edge8l	%i2,	%l2,	%i3
loop_2843:
	tn	%icc,	0x5
	popc	0x1495,	%l1
	ldx	[%l7 + 0x10],	%g6
	mulscc	%o2,	%o4,	%i4
	tsubcctv	%i1,	0x1D31,	%g4
	brnz	%o5,	loop_2844
	edge32	%o6,	%l4,	%o7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x1E] %asi,	%o0
loop_2844:
	sra	%i6,	0x01,	%g1
	stb	%i5,	[%l7 + 0x78]
	fornot1	%f8,	%f24,	%f8
	nop
	setx	loop_2845,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x05F8
	movgu	%xcc,	%l5,	%g3
	mulscc	%g7,	%l0,	%g2
loop_2845:
	fandnot1s	%f29,	%f31,	%f17
	tle	%xcc,	0x1
	fnot2s	%f18,	%f23
	movrlez	%i0,	0x0C8,	%l6
	xorcc	%o1,	%o3,	%i7
	fcmpeq32	%f26,	%f26,	%l3
	nop
	setx	0x106332C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fmovdvs	%icc,	%f25,	%f20
	movrgz	%i2,	0x2FD,	%g5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i3
	tl	%icc,	0x3
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x27,	%l0
	set	0x0C, %g5
	stha	%l2,	[%l7 + %g5] 0x0c
	edge8	%g6,	%o4,	%o2
	nop
	setx	0xB7D3C0CD6138003C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xDD2A9150263D6629,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f28,	%f10
	and	%i4,	%i1,	%o5
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f28
	movrlez	%o6,	0x01F,	%l4
	movrne	%o7,	0x2C0,	%o0
	fmovrsgz	%i6,	%f22,	%f9
	edge16l	%g4,	%i5,	%l5
	fmovse	%icc,	%f0,	%f0
	ldstub	[%l7 + 0x40],	%g3
	subc	%g1,	%g7,	%l0
	tneg	%xcc,	0x7
	fmovsvc	%icc,	%f29,	%f4
	fmovsvs	%icc,	%f0,	%f31
	fnands	%f1,	%f23,	%f24
	fbul	%fcc3,	loop_2846
	movrlz	%g2,	0x2F2,	%l6
	fmovdcc	%xcc,	%f29,	%f10
	fabss	%f15,	%f6
loop_2846:
	sra	%i0,	%o1,	%o3
	movrgz	%l3,	%i2,	%i7
	tne	%xcc,	0x4
	set	0x74, %o2
	stwa	%i3,	[%l7 + %o2] 0x10
	movvc	%xcc,	%g5,	%l1
	alignaddr	%l2,	%o4,	%g6
	ldsb	[%l7 + 0x4E],	%i4
	edge32	%o2,	%o5,	%i1
	fornot2	%f12,	%f20,	%f2
	fpsub16s	%f13,	%f12,	%f6
	nop
	setx	loop_2847,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x20, %i4
	stx	%o6,	[%l7 + %i4]
	umulcc	%o7,	0x139E,	%l4
	fmovdneg	%xcc,	%f15,	%f20
loop_2847:
	udivcc	%i6,	0x1248,	%g4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o0
	srax	%i5,	0x0A,	%g3
	ldsh	[%l7 + 0x24],	%l5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x25] %asi,	%g7
	nop
	fitos	%f0,	%f3
	fstox	%f3,	%f0
	fxtos	%f0,	%f20
	fbge,a	%fcc3,	loop_2848
	xnorcc	%l0,	%g1,	%l6
	mova	%xcc,	%i0,	%o1
	movre	%g2,	0x051,	%o3
loop_2848:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x48] %asi,	%l3
	sth	%i7,	[%l7 + 0x66]
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i2
	movre	%i3,	0x296,	%g5
	fpadd32s	%f5,	%f13,	%f25
	popc	0x0A63,	%l2
	nop
	setx	loop_2849,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xCBFA8613,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f14
	fnot1s	%f18,	%f1
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
loop_2849:
	orn	%g6,	%o4,	%o2
	tcc	%icc,	0x2
	fmovrdgez	%o5,	%f28,	%f28
	fmovdge	%icc,	%f25,	%f3
	move	%xcc,	%i4,	%o6
	fbe,a	%fcc3,	loop_2850
	alignaddr	%o7,	%l4,	%i6
	bge,pt	%icc,	loop_2851
	tne	%icc,	0x0
loop_2850:
	smulcc	%g4,	%o0,	%i5
	movrgz	%i1,	%l5,	%g3
loop_2851:
	bg	%icc,	loop_2852
	tne	%icc,	0x4
	set	0x42, %i7
	stba	%g7,	[%l7 + %i7] 0x04
loop_2852:
	fmovsvs	%icc,	%f17,	%f22
	mulx	%l0,	%l6,	%i0
	flush	%l7 + 0x68
	bpos,a	%xcc,	loop_2853
	edge8	%o1,	%g1,	%g2
	move	%icc,	%o3,	%i7
	xorcc	%l3,	0x0210,	%i3
loop_2853:
	andcc	%g5,	0x1403,	%l2
	fsrc1s	%f27,	%f2
	fandnot2s	%f17,	%f8,	%f28
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x34] %asi,	%i2
	edge8n	%g6,	%o4,	%o2
	umulcc	%l1,	%o5,	%i4
	fnands	%f28,	%f0,	%f25
	fpadd16	%f16,	%f14,	%f20
	mova	%icc,	%o7,	%o6
	mova	%icc,	%l4,	%g4
	set	0x62, %l4
	stba	%o0,	[%l7 + %l4] 0x27
	membar	#Sync
	te	%xcc,	0x3
	tvc	%xcc,	0x7
	movge	%xcc,	%i6,	%i5
	set	0x7C, %l1
	ldswa	[%l7 + %l1] 0x15,	%l5
	fblg,a	%fcc2,	loop_2854
	movrlz	%g3,	0x3FA,	%g7
	tl	%icc,	0x0
	fnegd	%f6,	%f18
loop_2854:
	edge16	%l0,	%l6,	%i0
	bgu,pn	%xcc,	loop_2855
	edge32ln	%i1,	%g1,	%g2
	add	%o3,	0x188C,	%i7
	tsubcc	%o1,	0x0A08,	%i3
loop_2855:
	edge8ln	%l3,	%l2,	%g5
	edge32ln	%i2,	%o4,	%g6
	subccc	%o2,	0x0151,	%l1
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f10
	andncc	%o5,	%i4,	%o7
	fmovdn	%xcc,	%f30,	%f15
	fnands	%f18,	%f0,	%f4
	nop
	fitos	%f24,	%f18
	fxnor	%f6,	%f30,	%f26
	subc	%l4,	%o6,	%o0
	movvc	%xcc,	%g4,	%i5
	fxnor	%f0,	%f24,	%f24
	fones	%f27
	and	%l5,	0x12CD,	%i6
	movcc	%xcc,	%g7,	%l0
	tn	%xcc,	0x0
	movl	%icc,	%g3,	%l6
	andn	%i1,	%g1,	%g2
	tn	%xcc,	0x2
	fbn,a	%fcc3,	loop_2856
	array32	%i0,	%i7,	%o3
	brz,a	%o1,	loop_2857
	nop
	setx	0x6549D9F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f12
loop_2856:
	smul	%l3,	%i3,	%g5
	tsubcctv	%l2,	%i2,	%g6
loop_2857:
	brlez	%o2,	loop_2858
	tgu	%icc,	0x6
	orn	%o4,	%l1,	%i4
	addc	%o7,	%o5,	%o6
loop_2858:
	bshuffle	%f22,	%f24,	%f28
	fnegd	%f22,	%f26
	sdiv	%l4,	0x0A46,	%g4
	addccc	%i5,	0x0F35,	%o0
	fbe,a	%fcc0,	loop_2859
	brgez,a	%i6,	loop_2860
	fmovdcs	%icc,	%f4,	%f14
	fxnors	%f10,	%f7,	%f9
loop_2859:
	fmovdneg	%xcc,	%f26,	%f9
loop_2860:
	movn	%icc,	%l5,	%g7
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udivcc	%g3,	0x1F6F,	%l6
	movrlez	%i1,	0x1DE,	%g1
	tleu	%icc,	0x5
	mulx	%g2,	0x0F56,	%l0
	membar	0x53
	movleu	%xcc,	%i7,	%o3
	bvc,a	%xcc,	loop_2861
	movvc	%icc,	%o1,	%i0
	edge8	%i3,	%l3,	%g5
	edge16n	%l2,	%g6,	%o2
loop_2861:
	alignaddr	%o4,	%i2,	%l1
	alignaddr	%o7,	%o5,	%i4
	movvs	%icc,	%o6,	%l4
	smulcc	%g4,	%o0,	%i6
	tgu	%xcc,	0x1
	edge8	%i5,	%l5,	%g7
	fand	%f30,	%f30,	%f16
	sdivcc	%g3,	0x1041,	%i1
	fmovsa	%icc,	%f26,	%f22
	movne	%icc,	%l6,	%g1
	te	%xcc,	0x2
	srl	%l0,	%g2,	%o3
	call	loop_2862
	xor	%o1,	0x134E,	%i7
	movrne	%i0,	%i3,	%g5
	fandnot2s	%f27,	%f4,	%f21
loop_2862:
	bcs,a,pt	%icc,	loop_2863
	fbuge,a	%fcc1,	loop_2864
	flush	%l7 + 0x68
	nop
	setx	loop_2865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2863:
	array16	%l3,	%g6,	%l2
loop_2864:
	fbu,a	%fcc3,	loop_2866
	prefetch	[%l7 + 0x0C],	 0x0
loop_2865:
	fbul,a	%fcc0,	loop_2867
	udivx	%o2,	0x0D98,	%i2
loop_2866:
	tvc	%icc,	0x4
	mulx	%o4,	%l1,	%o7
loop_2867:
	tn	%icc,	0x6
	fbuge,a	%fcc0,	loop_2868
	alignaddrl	%o5,	%o6,	%i4
	fxor	%f12,	%f30,	%f28
	movvs	%icc,	%g4,	%l4
loop_2868:
	bneg,a,pt	%xcc,	loop_2869
	edge32n	%o0,	%i6,	%l5
	movle	%icc,	%i5,	%g3
	std	%f18,	[%l7 + 0x40]
loop_2869:
	orcc	%i1,	0x1313,	%g7
	popc	0x0A0C,	%g1
	tvs	%icc,	0x3
	movcc	%xcc,	%l6,	%g2
	andncc	%o3,	%l0,	%o1
	move	%xcc,	%i0,	%i3
	orcc	%i7,	0x0826,	%g5
	brlz,a	%l3,	loop_2870
	fnand	%f16,	%f8,	%f12
	alignaddrl	%g6,	%o2,	%l2
	alignaddrl	%o4,	%l1,	%i2
loop_2870:
	sllx	%o7,	%o6,	%i4
	sra	%o5,	0x11,	%l4
	or	%g4,	0x1E3E,	%o0
	brgez,a	%i6,	loop_2871
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f2
	movne	%icc,	%l5,	%g3
	udivx	%i1,	0x0706,	%g7
loop_2871:
	add	%i5,	%l6,	%g2
	srax	%g1,	%o3,	%l0
	movl	%icc,	%i0,	%o1
	brlz,a	%i7,	loop_2872
	fbne,a	%fcc2,	loop_2873
	tleu	%icc,	0x1
	ldx	[%l7 + 0x28],	%i3
loop_2872:
	tsubcctv	%l3,	%g6,	%g5
loop_2873:
	fpmerge	%f2,	%f8,	%f8
	movn	%xcc,	%l2,	%o2
	subc	%l1,	%o4,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x6C],	%o6
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbul,a	%fcc2,	loop_2874
	addccc	%i2,	0x1441,	%i4
	movl	%icc,	%l4,	%g4
	tleu	%xcc,	0x1
loop_2874:
	fpackfix	%f2,	%f24
	tn	%xcc,	0x7
	sdivx	%o5,	0x1CA8,	%i6
	array8	%l5,	%g3,	%i1
	srlx	%g7,	%i5,	%o0
	fandnot1s	%f21,	%f21,	%f29
	sir	0x00A8
	nop
	setx	0x2572ABE8A0523648,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	xnorcc	%g2,	0x0B85,	%g1
	taddcctv	%o3,	0x1D5A,	%l0
	brgez,a	%i0,	loop_2875
	brgez,a	%o1,	loop_2876
	mulx	%l6,	0x0B17,	%i3
	swap	[%l7 + 0x24],	%i7
loop_2875:
	fmovrslez	%g6,	%f18,	%f13
loop_2876:
	sdiv	%g5,	0x0A0D,	%l3
	udivcc	%o2,	0x0B7D,	%l2
	flush	%l7 + 0x0C
	sub	%l1,	%o4,	%o6
	sll	%i2,	%o7,	%i4
	orcc	%g4,	0x0DE2,	%l4
	edge32ln	%i6,	%o5,	%l5
	nop
	fitos	%f1,	%f19
	fstoi	%f19,	%f6
	fmovdne	%icc,	%f30,	%f18
	fxnors	%f10,	%f14,	%f20
	tsubcctv	%i1,	0x1658,	%g7
	edge8n	%g3,	%i5,	%o0
	addccc	%g1,	0x08CB,	%o3
	tcc	%xcc,	0x7
	fxnor	%f18,	%f20,	%f10
	tle	%xcc,	0x5
	orncc	%g2,	%i0,	%l0
	fmovdneg	%xcc,	%f26,	%f12
	addccc	%l6,	%o1,	%i7
	tle	%xcc,	0x7
	tsubcc	%g6,	0x076B,	%g5
	nop
	setx	0x1370AE26905569F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	edge8	%i3,	%l3,	%o2
	nop
	setx	0xEFC0B9F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x95EE04A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f6,	%f22
	fmul8ulx16	%f8,	%f0,	%f22
	tsubcctv	%l2,	0x0034,	%o4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x62] %asi,	%o6
	umulcc	%l1,	%i2,	%i4
	lduh	[%l7 + 0x50],	%g4
	tleu	%xcc,	0x3
	edge16	%o7,	%l4,	%i6
	movrlez	%l5,	0x08F,	%o5
	fmovrsne	%g7,	%f16,	%f16
	subc	%i1,	%g3,	%o0
	movpos	%xcc,	%g1,	%i5
	lduw	[%l7 + 0x60],	%g2
	set	0x14, %g4
	sta	%f3,	[%l7 + %g4] 0x88
	tpos	%icc,	0x2
	fmovsl	%icc,	%f21,	%f20
	xor	%o3,	0x1938,	%i0
	call	loop_2877
	movvs	%xcc,	%l6,	%o1
	fbg	%fcc1,	loop_2878
	and	%i7,	0x1A5E,	%l0
loop_2877:
	brnz,a	%g6,	loop_2879
	movvc	%xcc,	%i3,	%l3
loop_2878:
	movgu	%xcc,	%g5,	%l2
	brnz,a	%o2,	loop_2880
loop_2879:
	fornot1	%f6,	%f10,	%f14
	edge32ln	%o6,	%o4,	%l1
	stb	%i4,	[%l7 + 0x3C]
loop_2880:
	sdiv	%g4,	0x120A,	%o7
	ta	%icc,	0x4
	ble,pt	%icc,	loop_2881
	movg	%xcc,	%i2,	%i6
	add	%l4,	0x1DDC,	%o5
	ldsh	[%l7 + 0x66],	%g7
loop_2881:
	movge	%icc,	%l5,	%i1
	bleu,a	%icc,	loop_2882
	nop
	setx	0x398E0CDE85D89167,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x034B75F108DCA83A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f18,	%f10
	fmovsgu	%xcc,	%f2,	%f13
	fmovdneg	%icc,	%f28,	%f10
loop_2882:
	tg	%xcc,	0x5
	movge	%icc,	%o0,	%g3
	tleu	%icc,	0x7
	taddcc	%i5,	0x1D71,	%g1
	fbul,a	%fcc1,	loop_2883
	array8	%o3,	%i0,	%g2
	edge32n	%l6,	%i7,	%o1
	nop
	setx	0xCC1FD120,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x0EEAE72D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f6,	%f2
loop_2883:
	orncc	%g6,	%i3,	%l3
	fmovspos	%xcc,	%f21,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f2,	%f12,	%f12
	edge16l	%g5,	%l2,	%l0
	fxnors	%f19,	%f2,	%f26
	smul	%o6,	0x1E19,	%o2
	stb	%o4,	[%l7 + 0x0C]
	fornot2	%f14,	%f10,	%f18
	set	0x40, %l6
	ldsha	[%l7 + %l6] 0x0c,	%i4
	fbu,a	%fcc1,	loop_2884
	andn	%g4,	%l1,	%i2
	fones	%f23
	subccc	%o7,	0x0540,	%i6
loop_2884:
	movgu	%xcc,	%o5,	%g7
	fmovdcs	%xcc,	%f15,	%f6
	orncc	%l4,	0x0160,	%i1
	array32	%o0,	%l5,	%g3
	fnot2	%f26,	%f18
	edge16n	%g1,	%o3,	%i5
	movg	%icc,	%i0,	%l6
	fbuge	%fcc3,	loop_2885
	fpmerge	%f5,	%f6,	%f28
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f19
	movne	%icc,	%g2,	%o1
loop_2885:
	fmovdcs	%xcc,	%f12,	%f19
	movl	%icc,	%i7,	%g6
	movcc	%xcc,	%l3,	%i3
	stb	%l2,	[%l7 + 0x42]
	tge	%icc,	0x6
	movcs	%icc,	%g5,	%l0
	smulcc	%o2,	0x1588,	%o4
	fmovdg	%xcc,	%f20,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i4,	0x1E09,	%g4
	or	%l1,	0x0532,	%i2
	subc	%o7,	0x0CBA,	%o6
	fbg	%fcc1,	loop_2886
	fmovrdlz	%i6,	%f20,	%f18
	fornot1	%f12,	%f30,	%f0
	fands	%f15,	%f4,	%f23
loop_2886:
	smulcc	%g7,	0x13FD,	%l4
	sth	%i1,	[%l7 + 0x34]
	fbne,a	%fcc3,	loop_2887
	udivx	%o0,	0x1388,	%l5
	membar	0x2A
	fmovsa	%icc,	%f26,	%f13
loop_2887:
	tn	%xcc,	0x1
	fbne,a	%fcc2,	loop_2888
	movrgz	%o5,	%g3,	%g1
	bneg,a	loop_2889
	fornot2	%f6,	%f24,	%f12
loop_2888:
	tpos	%xcc,	0x1
	ba,pn	%xcc,	loop_2890
loop_2889:
	tge	%xcc,	0x3
	edge32	%o3,	%i0,	%i5
	fmovrsne	%l6,	%f5,	%f12
loop_2890:
	fmovdn	%xcc,	%f17,	%f29
	fmovdcs	%icc,	%f13,	%f11
	andcc	%o1,	%g2,	%g6
	bleu	loop_2891
	fpadd32	%f2,	%f10,	%f4
	fmovdvc	%xcc,	%f16,	%f30
	fmovdn	%icc,	%f11,	%f24
loop_2891:
	ld	[%l7 + 0x14],	%f7
	fornot2	%f4,	%f10,	%f2
	fpadd16s	%f1,	%f17,	%f1
	xorcc	%i7,	%i3,	%l3
	nop
	setx	0xFB4CBEF3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x3B996971,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f13,	%f5
	fmul8sux16	%f14,	%f6,	%f28
	prefetch	[%l7 + 0x6C],	 0x0
	tcc	%xcc,	0x7
	edge16	%l2,	%l0,	%o2
	movrlez	%g5,	%i4,	%g4
	sdivx	%l1,	0x00CF,	%o4
	srl	%i2,	0x0A,	%o7
	set	0x7D, %i0
	lduba	[%l7 + %i0] 0x15,	%o6
	nop
	setx loop_2892, %l0, %l1
	jmpl %l1, %g7
	fmovdcs	%icc,	%f30,	%f0
	nop
	set	0x14, %i5
	prefetch	[%l7 + %i5],	 0x3
	alignaddrl	%l4,	%i6,	%i1
loop_2892:
	movcs	%xcc,	%o0,	%o5
	te	%icc,	0x0
	xnorcc	%g3,	%g1,	%o3
	brlz	%i0,	loop_2893
	brnz,a	%l5,	loop_2894
	tle	%xcc,	0x7
	tl	%icc,	0x6
loop_2893:
	mulx	%i5,	%l6,	%o1
loop_2894:
	nop
	setx	loop_2895,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%g6,	%g2
	fcmple32	%f16,	%f2,	%i3
	tcc	%xcc,	0x2
loop_2895:
	mulx	%l3,	0x1857,	%l2
	bg,pn	%xcc,	loop_2896
	andn	%i7,	%l0,	%g5
	wr	%g0,	0x23,	%asi
	stba	%i4,	[%l7 + 0x61] %asi
	membar	#Sync
loop_2896:
	taddcctv	%g4,	%o2,	%o4
	movrgez	%i2,	0x11A,	%l1
	edge32	%o7,	%g7,	%l4
	edge32n	%i6,	%o6,	%i1
	fbug	%fcc2,	loop_2897
	ldstub	[%l7 + 0x79],	%o5
	fpadd32s	%f24,	%f23,	%f25
	fmovsl	%icc,	%f26,	%f24
loop_2897:
	or	%g3,	0x0A24,	%g1
	tcc	%xcc,	0x1
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
	andn	%o3,	%i0,	%l5
	tne	%icc,	0x7
	ldsh	[%l7 + 0x4A],	%i5
loop_2898:
	alignaddrl	%o0,	%o1,	%l6
	tge	%xcc,	0x7
	fmovsneg	%icc,	%f4,	%f8
	fmovdl	%xcc,	%f28,	%f19
	nop
	setx	loop_2899,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%icc,	0x0
	fpackfix	%f22,	%f22
	fmuld8ulx16	%f18,	%f14,	%f18
loop_2899:
	bcc,a	%icc,	loop_2900
	fmovdvs	%icc,	%f26,	%f19
	andn	%g2,	%i3,	%g6
	fmul8ulx16	%f14,	%f18,	%f16
loop_2900:
	fmul8ulx16	%f20,	%f20,	%f14
	tsubcctv	%l2,	0x0769,	%i7
	subcc	%l3,	%g5,	%i4
	srax	%g4,	%l0,	%o2
	ldub	[%l7 + 0x64],	%i2
	tpos	%icc,	0x5
	movrlez	%o4,	%o7,	%l1
	umulcc	%g7,	%l4,	%o6
	wr	%g0,	0x2a,	%asi
	stxa	%i6,	[%l7 + 0x28] %asi
	membar	#Sync
	te	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o5,	0x062D,	%i1
	sra	%g1,	0x0E,	%g3
	fpack16	%f4,	%f30
	edge32ln	%o3,	%l5,	%i5
	orcc	%i0,	%o1,	%l6
	fbul,a	%fcc0,	loop_2901
	sethi	0x1AA8,	%g2
	set	0x7C, %l2
	sta	%f1,	[%l7 + %l2] 0x80
loop_2901:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o0,	%g6,	%i3
	edge16l	%i7,	%l3,	%g5
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movg	%icc,	%l2,	%i4
	edge8ln	%g4,	%o2,	%l0
	brgz	%o4,	loop_2902
	be,pt	%xcc,	loop_2903
	brz	%i2,	loop_2904
	umul	%l1,	0x1177,	%o7
loop_2902:
	movvs	%icc,	%l4,	%o6
loop_2903:
	brz,a	%g7,	loop_2905
loop_2904:
	movneg	%xcc,	%i6,	%i1
	movcs	%icc,	%o5,	%g1
	prefetch	[%l7 + 0x4C],	 0x1
loop_2905:
	movcs	%xcc,	%o3,	%g3
	ldx	[%l7 + 0x38],	%i5
	movleu	%icc,	%i0,	%o1
	fandnot1	%f16,	%f4,	%f18
	edge16n	%l6,	%l5,	%g2
	movpos	%xcc,	%o0,	%g6
	xor	%i3,	%l3,	%i7
	fpsub16s	%f14,	%f21,	%f26
	tleu	%xcc,	0x7
	andncc	%l2,	%i4,	%g5
	bpos,a	loop_2906
	bneg	%xcc,	loop_2907
	array32	%g4,	%l0,	%o2
	fbo,a	%fcc2,	loop_2908
loop_2906:
	tgu	%xcc,	0x1
loop_2907:
	fmovdleu	%xcc,	%f21,	%f0
	edge16l	%i2,	%o4,	%l1
loop_2908:
	nop
	set	0x64, %g7
	swapa	[%l7 + %g7] 0x19,	%o7
	orn	%o6,	0x1CA4,	%g7
	srax	%l4,	0x19,	%i6
	bpos	%icc,	loop_2909
	fnor	%f22,	%f8,	%f18
	fxors	%f21,	%f2,	%f27
	udivx	%o5,	0x19C2,	%g1
loop_2909:
	bneg,a	loop_2910
	array16	%o3,	%g3,	%i5
	ble,a,pn	%xcc,	loop_2911
	fpmerge	%f1,	%f20,	%f28
loop_2910:
	lduw	[%l7 + 0x24],	%i1
	fnand	%f4,	%f20,	%f18
loop_2911:
	movvc	%xcc,	%o1,	%l6
	subccc	%l5,	0x1EF6,	%i0
	be,a,pn	%icc,	loop_2912
	fbg,a	%fcc1,	loop_2913
	ldd	[%l7 + 0x10],	%o0
	tvc	%xcc,	0x0
loop_2912:
	fmul8x16	%f2,	%f2,	%f16
loop_2913:
	edge32ln	%g6,	%i3,	%l3
	fbug,a	%fcc2,	loop_2914
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_2915
	movpos	%icc,	%g2,	%l2
loop_2914:
	sra	%i4,	0x02,	%i7
	sra	%g4,	%g5,	%l0
loop_2915:
	fnand	%f2,	%f6,	%f10
	edge8	%i2,	%o4,	%l1
	array8	%o7,	%o2,	%g7
	bpos,a,pt	%xcc,	loop_2916
	movvc	%icc,	%l4,	%i6
	movrgez	%o6,	%g1,	%o3
	set	0x38, %g2
	lduha	[%l7 + %g2] 0x19,	%o5
loop_2916:
	fsrc1s	%f20,	%f31
	set	0x7F, %i6
	ldsba	[%l7 + %i6] 0x81,	%g3
	edge32ln	%i5,	%i1,	%o1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l6,	%l5
	fxnors	%f14,	%f1,	%f22
	nop
	setx	0xFBCFA83CF05FAE58,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o0,	%i0,	%g6
	ldd	[%l7 + 0x48],	%i2
	movcc	%xcc,	%g2,	%l3
	ldx	[%l7 + 0x10],	%i4
	movvs	%icc,	%l2,	%g4
	tgu	%icc,	0x4
	movvc	%icc,	%g5,	%i7
	fbug,a	%fcc0,	loop_2917
	movvc	%xcc,	%i2,	%o4
	sra	%l1,	%o7,	%l0
	tcc	%xcc,	0x2
loop_2917:
	taddcctv	%g7,	%o2,	%i6
	fpsub16s	%f23,	%f0,	%f8
	fbg	%fcc1,	loop_2918
	nop
	fitos	%f4,	%f3
	fstox	%f3,	%f6
	fxtos	%f6,	%f17
	fmuld8sux16	%f2,	%f9,	%f16
	nop
	setx	0xBCF9CCC1A8CD8B3C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE81EC96CCE271F41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f10,	%f30
loop_2918:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x76] %asi,	%l4
	fpadd32	%f18,	%f22,	%f8
	ldx	[%l7 + 0x20],	%o6
	movrne	%g1,	0x3AD,	%o3
	movle	%xcc,	%g3,	%o5
	ldsw	[%l7 + 0x24],	%i5
	move	%icc,	%i1,	%o1
	sub	%l5,	%l6,	%i0
	fmovsg	%icc,	%f13,	%f27
	tge	%icc,	0x7
	fpack32	%f10,	%f26,	%f26
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%g6
	andncc	%i3,	%o0,	%g2
	ldd	[%l7 + 0x08],	%f20
	srlx	%i4,	%l2,	%l3
	udivcc	%g5,	0x142A,	%i7
	brgz	%i2,	loop_2919
	umulcc	%o4,	%g4,	%o7
	set	0x52, %o3
	ldsba	[%l7 + %o3] 0x88,	%l1
loop_2919:
	movcc	%icc,	%g7,	%o2
	movrne	%i6,	%l0,	%o6
	bge,pt	%icc,	loop_2920
	fmovse	%xcc,	%f3,	%f17
	bneg,a,pt	%icc,	loop_2921
	movcs	%icc,	%l4,	%g1
loop_2920:
	smul	%o3,	%g3,	%i5
	andncc	%i1,	%o5,	%o1
loop_2921:
	swap	[%l7 + 0x3C],	%l5
	movrlz	%i0,	0x085,	%g6
	fmovse	%xcc,	%f19,	%f29
	fbu,a	%fcc0,	loop_2922
	xnor	%l6,	%o0,	%i3
	fbe,a	%fcc1,	loop_2923
	fandnot2s	%f2,	%f17,	%f14
loop_2922:
	lduw	[%l7 + 0x1C],	%g2
	movrne	%l2,	%l3,	%g5
loop_2923:
	fpsub32s	%f6,	%f16,	%f13
	alignaddr	%i7,	%i2,	%o4
	fmovsn	%xcc,	%f9,	%f2
	tcc	%icc,	0x1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x29] %asi,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i4,	%o7,	%l1
	subcc	%g7,	0x0C42,	%i6
	andn	%o2,	0x1C36,	%l0
	srax	%l4,	%o6,	%o3
	tneg	%icc,	0x3
	andn	%g3,	0x0D46,	%i5
	movrne	%i1,	0x29F,	%o5
	fcmpne32	%f2,	%f24,	%g1
	tleu	%xcc,	0x5
	array8	%o1,	%i0,	%l5
	orn	%l6,	0x0596,	%g6
	and	%i3,	%o0,	%g2
	bcc,a,pt	%xcc,	loop_2924
	bl	loop_2925
	movrgz	%l2,	%l3,	%i7
	addcc	%i2,	0x1C78,	%o4
loop_2924:
	fmul8x16al	%f3,	%f8,	%f8
loop_2925:
	add	%g5,	0x1835,	%i4
	fmovscc	%xcc,	%f21,	%f15
	tn	%icc,	0x5
	fbg	%fcc0,	loop_2926
	subcc	%o7,	%l1,	%g4
	move	%icc,	%g7,	%o2
	nop
	fitos	%f8,	%f0
	fstoi	%f0,	%f30
loop_2926:
	fxnors	%f7,	%f23,	%f20
	fble,a	%fcc1,	loop_2927
	mova	%icc,	%l0,	%i6
	udiv	%o6,	0x0B03,	%l4
	mulscc	%g3,	%o3,	%i1
loop_2927:
	tleu	%icc,	0x4
	array32	%o5,	%g1,	%i5
	popc	0x1102,	%i0
	bpos,a	%icc,	loop_2928
	alignaddrl	%l5,	%l6,	%o1
	fmul8x16al	%f11,	%f23,	%f26
	nop
	setx	loop_2929,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2928:
	nop
	setx	0x86354DF1807ED47A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	udivcc	%i3,	0x0C70,	%g6
	edge16n	%o0,	%l2,	%l3
loop_2929:
	sdivx	%g2,	0x1210,	%i7
	nop
	fitod	%f25,	%f4
	brgez,a	%i2,	loop_2930
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%o4
	smulcc	%g5,	0x10BE,	%o7
	edge32l	%i4,	%g4,	%g7
loop_2930:
	brlez	%o2,	loop_2931
	tleu	%icc,	0x6
	movcs	%xcc,	%l1,	%i6
	fmuld8sux16	%f29,	%f18,	%f10
loop_2931:
	orcc	%o6,	%l4,	%g3
	sethi	0x1B99,	%l0
	orncc	%i1,	0x020A,	%o5
	array8	%o3,	%g1,	%i0
	brgez	%i5,	loop_2932
	sdiv	%l6,	0x01C4,	%o1
	brlez,a	%l5,	loop_2933
	fmovsg	%xcc,	%f11,	%f0
loop_2932:
	edge32	%g6,	%o0,	%i3
	edge16ln	%l3,	%g2,	%l2
loop_2933:
	fpsub32	%f10,	%f24,	%f2
	fpadd32s	%f29,	%f8,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc0,	loop_2934
	tle	%icc,	0x3
	xorcc	%i2,	%i7,	%g5
	nop
	setx	0x04908E76F1466B02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA3E25883B96C2577,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f14
loop_2934:
	ldx	[%l7 + 0x48],	%o4
	movrlez	%i4,	%g4,	%o7
	brgz,a	%o2,	loop_2935
	fcmpgt16	%f30,	%f20,	%l1
	array32	%i6,	%g7,	%l4
	srax	%o6,	0x14,	%g3
loop_2935:
	fmovs	%f14,	%f26
	fmovsvc	%xcc,	%f28,	%f29
	call	loop_2936
	fpadd32	%f8,	%f30,	%f0
	addc	%i1,	0x0787,	%l0
	edge8ln	%o5,	%o3,	%i0
loop_2936:
	ldsh	[%l7 + 0x12],	%i5
	nop
	setx	0x17805DAB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x72A3600D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f4,	%f11
	bn,a	loop_2937
	edge8	%l6,	%o1,	%g1
	movleu	%xcc,	%l5,	%o0
	sdivcc	%g6,	0x0614,	%i3
loop_2937:
	movgu	%icc,	%l3,	%l2
	addccc	%i2,	%g2,	%i7
	movneg	%xcc,	%g5,	%o4
	movcs	%icc,	%i4,	%o7
	edge8ln	%g4,	%l1,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o2
	tsubcctv	%l4,	%o6,	%g7
	umul	%g3,	%i1,	%l0
	orn	%o5,	0x0D4E,	%o3
	ldd	[%l7 + 0x70],	%i0
	tg	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x37] %asi,	%i5
	tne	%xcc,	0x7
	tleu	%xcc,	0x7
	movge	%xcc,	%o1,	%g1
	ldstub	[%l7 + 0x10],	%l5
	taddcctv	%o0,	%l6,	%g6
	edge16	%i3,	%l3,	%i2
	ldx	[%l7 + 0x28],	%g2
	andcc	%l2,	%g5,	%o4
	set	0x54, %o5
	stwa	%i4,	[%l7 + %o5] 0xe3
	membar	#Sync
	fsrc2s	%f18,	%f15
	fcmple16	%f14,	%f0,	%i7
	nop
	setx	0x42D6EDD4DA28EE32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xD4EE43A32CC52E69,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f2,	%f12
	brnz,a	%g4,	loop_2938
	bn	%xcc,	loop_2939
	fmul8sux16	%f12,	%f28,	%f24
	tcc	%icc,	0x1
loop_2938:
	nop
	setx	0xDF579163BDCF318F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f0
loop_2939:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l1,	0x082B,	%o7
	sra	%i6,	%o2,	%l4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x2a,	%g6
	edge8	%g3,	%o6,	%l0
	tvc	%icc,	0x0
	alignaddr	%o5,	%i1,	%i0
	move	%icc,	%o3,	%i5
	membar	0x1E
	fornot1	%f6,	%f6,	%f26
	tsubcc	%g1,	0x1D28,	%l5
	umulcc	%o1,	0x05A8,	%o0
	for	%f6,	%f24,	%f6
	membar	0x36
	brnz	%g6,	loop_2940
	movneg	%icc,	%i3,	%l6
	fba,a	%fcc1,	loop_2941
	movge	%icc,	%l3,	%g2
loop_2940:
	tge	%icc,	0x7
	addc	%l2,	0x1986,	%g5
loop_2941:
	move	%xcc,	%o4,	%i2
	ldub	[%l7 + 0x34],	%i4
	edge16	%g4,	%i7,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o7,	0x0D5C,	%o2
	tleu	%icc,	0x0
	andcc	%l4,	0x028E,	%i6
	fmovdle	%xcc,	%f18,	%f9
	movcs	%xcc,	%g3,	%g7
	subc	%o6,	%l0,	%i1
	xnorcc	%i0,	0x057B,	%o5
	fmovdneg	%xcc,	%f14,	%f29
	srax	%i5,	0x01,	%o3
	tsubcc	%l5,	%g1,	%o1
	fmovdne	%xcc,	%f16,	%f25
	tcc	%xcc,	0x0
	fmovdcs	%xcc,	%f3,	%f25
	tvc	%xcc,	0x5
	subcc	%g6,	%i3,	%o0
	brgz,a	%l6,	loop_2942
	membar	0x59
	fxors	%f20,	%f0,	%f4
	movvs	%icc,	%l3,	%g2
loop_2942:
	movleu	%icc,	%l2,	%o4
	brgez	%g5,	loop_2943
	srl	%i2,	%g4,	%i4
	umul	%i7,	0x15AB,	%o7
	edge8ln	%l1,	%o2,	%l4
loop_2943:
	brgz	%g3,	loop_2944
	fmul8x16au	%f22,	%f18,	%f10
	bcc	%xcc,	loop_2945
	movrgez	%i6,	%o6,	%g7
loop_2944:
	array8	%l0,	%i1,	%o5
	te	%icc,	0x0
loop_2945:
	edge8	%i0,	%i5,	%o3
	fnands	%f7,	%f0,	%f25
	movrgz	%l5,	%g1,	%g6
	fblg	%fcc3,	loop_2946
	brnz,a	%o1,	loop_2947
	fornot1s	%f31,	%f12,	%f6
	tgu	%xcc,	0x7
loop_2946:
	movg	%icc,	%i3,	%o0
loop_2947:
	sllx	%l6,	0x10,	%g2
	ta	%xcc,	0x4
	or	%l2,	0x1C0B,	%l3
	fxnor	%f2,	%f30,	%f4
	fmul8x16	%f25,	%f2,	%f24
	bge,a,pt	%xcc,	loop_2948
	fmovrdlez	%o4,	%f30,	%f6
	tpos	%icc,	0x4
	sdivcc	%i2,	0x0458,	%g5
loop_2948:
	edge16n	%i4,	%g4,	%i7
	set	0x4E, %o0
	stha	%l1,	[%l7 + %o0] 0x2f
	membar	#Sync
	tgu	%icc,	0x7
	array32	%o2,	%o7,	%g3
	brlez,a	%i6,	loop_2949
	subc	%l4,	%g7,	%l0
	subcc	%i1,	0x0825,	%o5
	addccc	%i0,	%o6,	%o3
loop_2949:
	sethi	0x0AF1,	%i5
	edge32l	%l5,	%g6,	%g1
	fmovdcc	%xcc,	%f4,	%f22
	movcc	%icc,	%o1,	%i3
	orn	%o0,	%g2,	%l2
	ldx	[%l7 + 0x10],	%l6
	xnor	%l3,	0x1021,	%i2
	tneg	%xcc,	0x6
	smul	%g5,	%o4,	%g4
	fmuld8sux16	%f2,	%f19,	%f22
	movne	%xcc,	%i7,	%l1
	fmovdl	%icc,	%f22,	%f10
	fmovsne	%icc,	%f15,	%f2
	xor	%o2,	0x06D2,	%o7
	xorcc	%g3,	%i4,	%i6
	movleu	%xcc,	%l4,	%l0
	tcs	%icc,	0x7
	udiv	%i1,	0x1E4A,	%g7
	fmovdleu	%xcc,	%f15,	%f29
	or	%i0,	%o6,	%o3
	tsubcc	%o5,	%i5,	%g6
	prefetch	[%l7 + 0x68],	 0x0
	smulcc	%g1,	%o1,	%l5
	umul	%o0,	%g2,	%i3
	movneg	%xcc,	%l2,	%l3
	movre	%i2,	0x17E,	%l6
	orcc	%o4,	0x1BB3,	%g5
	bshuffle	%f0,	%f6,	%f0
	tpos	%xcc,	0x0
	sllx	%i7,	0x1F,	%l1
	fbn	%fcc0,	loop_2950
	tvs	%xcc,	0x1
	lduh	[%l7 + 0x56],	%o2
	ldx	[%l7 + 0x58],	%g4
loop_2950:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f22,	%f4,	%o7
	nop
	setx	0x05DB0F04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f15
	tcc	%xcc,	0x3
	xor	%g3,	0x1376,	%i4
	sdivx	%l4,	0x1843,	%l0
	sra	%i1,	0x14,	%i6
	fba,a	%fcc2,	loop_2951
	edge16n	%g7,	%o6,	%o3
	tsubcctv	%o5,	%i0,	%i5
	std	%f22,	[%l7 + 0x78]
loop_2951:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f7,	[%l7 + 0x64] %asi
	andcc	%g1,	%g6,	%l5
	or	%o0,	%g2,	%i3
	tgu	%icc,	0x1
	tge	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o1,	0x2A0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%i2,	%f20,	%f10
	fpadd16s	%f25,	%f10,	%f16
	tsubcctv	%l6,	0x1D6F,	%l3
	fpadd32	%f14,	%f30,	%f2
	udivcc	%g5,	0x1339,	%o4
	fmul8x16	%f0,	%f4,	%f6
	mulscc	%i7,	%l1,	%g4
	edge16l	%o7,	%o2,	%g3
	lduw	[%l7 + 0x0C],	%l4
	sdiv	%l0,	0x1C7E,	%i4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i1
	sdivcc	%i6,	0x1D5B,	%g7
	tle	%icc,	0x4
	tneg	%icc,	0x1
	srl	%o3,	0x08,	%o5
	umulcc	%i0,	%i5,	%o6
	edge8	%g6,	%l5,	%g1
	fnot2s	%f2,	%f8
	edge32l	%g2,	%i3,	%o0
	tne	%xcc,	0x4
	prefetch	[%l7 + 0x7C],	 0x2
	fxor	%f4,	%f14,	%f30
	movrlez	%o1,	0x1F2,	%l2
	popc	0x0F1B,	%l6
	srl	%i2,	0x13,	%l3
	subccc	%o4,	0x1687,	%i7
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f9
	bneg	%xcc,	loop_2952
	bn,a,pt	%icc,	loop_2953
	fnands	%f16,	%f7,	%f17
	fmovsvc	%icc,	%f13,	%f31
loop_2952:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x50] %asi,	%g5
loop_2953:
	andncc	%l1,	%o7,	%g4
	subcc	%o2,	%g3,	%l0
	add	%i4,	0x11DE,	%i1
	tneg	%icc,	0x2
	andcc	%l4,	%i6,	%o3
	sdivcc	%o5,	0x0BF6,	%i0
	fmuld8ulx16	%f30,	%f24,	%f10
	tleu	%xcc,	0x6
	mulx	%i5,	0x0AC8,	%g7
	array16	%g6,	%l5,	%o6
	orn	%g2,	%i3,	%o0
	mova	%icc,	%o1,	%l2
	fcmple32	%f12,	%f20,	%l6
	popc	0x10DD,	%i2
	edge16ln	%g1,	%l3,	%i7
	array16	%g5,	%o4,	%l1
	edge32ln	%o7,	%o2,	%g3
	bn,a	loop_2954
	ldub	[%l7 + 0x26],	%l0
	nop
	setx	0x756FACE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f8
	tsubcc	%g4,	0x15AB,	%i1
loop_2954:
	movl	%icc,	%l4,	%i6
	move	%icc,	%o3,	%i4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2732
!	Type cti   	: 2954
!	Type x   	: 1198
!	Type f   	: 4466
!	Type i   	: 13650
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xB2F72D7D
.word 0xF7BE9531
.word 0x9D5EF6AD
.word 0xED6474A9
.word 0xCAB40364
.word 0x2E6AE054
.word 0x29BB136F
.word 0x6C68E038
.word 0x02B3B796
.word 0x4F387034
.word 0x152D13EA
.word 0xC9A199BE
.word 0xD3D3E85D
.word 0xB8C33230
.word 0x1CD74B1E
.word 0xEA4CE71A
.word 0x9583CE18
.word 0x6C6CDEE3
.word 0xDB104659
.word 0x85AD2109
.word 0x9BFEB640
.word 0xEAE1B7E4
.word 0x7EEAE9D2
.word 0xADAE4F5C
.word 0xF9357EC0
.word 0x4A69B5CF
.word 0xFEAE246B
.word 0x18E65D8A
.word 0xB854D7BF
.word 0x36328876
.word 0xD9CEEEB0
.word 0xBEBC41EF
.word 0x107191F5
.word 0x6B90B55D
.word 0xB56E5B04
.word 0xE5E4AFFC
.word 0xAD13B2C9
.word 0x688EF009
.word 0xBC8EAD3D
.word 0xABB3A61F
.word 0x5D0968E8
.word 0x9DE902C0
.word 0xC71ED6F0
.word 0x4DDBABD4
.word 0xA21EA20A
.word 0x69C704B1
.word 0xF2F902EC
.word 0x52B7B060
.word 0x47DF17C9
.word 0x08DBA0CF
.word 0xDC71D715
.word 0xAC78EDD5
.word 0x36CBB3ED
.word 0x350C8756
.word 0xCB1920DA
.word 0x6B5B3C9D
.word 0xABFA8794
.word 0x4BAD2FF1
.word 0x7722353D
.word 0xB8BB1205
.word 0x2E2CF1B2
.word 0x1599735D
.word 0x07017B50
.word 0x0BABA2BC
.end
