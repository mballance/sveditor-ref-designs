/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f8.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f8.s,v 1.1 2007/05/11 17:22:24 drp Exp $"
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
	setx	0xE8EB29B9704F8931,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0xD,	%g2
	set	0xF,	%g3
	set	0x8,	%g4
	set	0xF,	%g5
	set	0xA,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x4,	%i1
	set	-0xB,	%i2
	set	-0x0,	%i3
	set	-0xC,	%i4
	set	-0x4,	%i5
	set	-0x5,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x72345859,	%l0
	set	0x3F8795B5,	%l1
	set	0x2DE529C2,	%l2
	set	0x5FB5F1FE,	%l3
	set	0x4EC4FB13,	%l4
	set	0x60B069B4,	%l5
	set	0x03B77A26,	%l6
	!# Output registers
	set	0x12AE,	%o0
	set	0x1422,	%o1
	set	0x163B,	%o2
	set	0x1E6E,	%o3
	set	-0x0A8B,	%o4
	set	0x052B,	%o5
	set	0x0B83,	%o6
	set	-0x04EB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1A11B643F866CBB8)
	INIT_TH_FP_REG(%l7,%f2,0xD8F974A28DF115B0)
	INIT_TH_FP_REG(%l7,%f4,0xD0B78CE5AF54D02E)
	INIT_TH_FP_REG(%l7,%f6,0xDB3EC96B2DD5854D)
	INIT_TH_FP_REG(%l7,%f8,0xBC0404D29A853C1A)
	INIT_TH_FP_REG(%l7,%f10,0xEBE8916469365D8F)
	INIT_TH_FP_REG(%l7,%f12,0x9A362E8B4536DCD8)
	INIT_TH_FP_REG(%l7,%f14,0x2DBB444B70683E93)
	INIT_TH_FP_REG(%l7,%f16,0x184047CB8D304EBC)
	INIT_TH_FP_REG(%l7,%f18,0x773D69FF7D40BDE9)
	INIT_TH_FP_REG(%l7,%f20,0xD4E2E3940B8BA66A)
	INIT_TH_FP_REG(%l7,%f22,0x66199CDCF3971945)
	INIT_TH_FP_REG(%l7,%f24,0x1B1841D544226C7A)
	INIT_TH_FP_REG(%l7,%f26,0x0C5038AB7221F1F6)
	INIT_TH_FP_REG(%l7,%f28,0x1EDD8F74AA2C2961)
	INIT_TH_FP_REG(%l7,%f30,0x75622DD8CA6AC934)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x585, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fbn,a	%fcc0,	loop_1
	edge8	%o5,	%o4,	%g3
	tge	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l4
loop_1:
	movrlez	%i6,	0x3D9,	%o3
	tgu	%icc,	0x3
	addc	%l6,	%o2,	%o1
	fmovscc	%icc,	%f22,	%f19
	fmovdn	%icc,	%f9,	%f27
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i7
	array8	%o0,	%i1,	%o7
	tle	%xcc,	0x0
	tleu	%icc,	0x6
	pdist	%f14,	%f26,	%f4
	movvc	%xcc,	%l5,	%i5
	brz	%i2,	loop_2
	fandnot2s	%f19,	%f10,	%f10
	mulx	%l0,	%g5,	%i3
	movrgez	%i4,	%l1,	%g1
loop_2:
	ta	%xcc,	0x0
	brgz	%g7,	loop_3
	fmuld8sux16	%f22,	%f29,	%f14
	lduh	[%l7 + 0x74],	%g6
	fmovrde	%g4,	%f28,	%f30
loop_3:
	move	%xcc,	%i0,	%l3
	fmovdl	%icc,	%f23,	%f15
	brnz	%o6,	loop_4
	fmul8ulx16	%f8,	%f16,	%f24
	ldub	[%l7 + 0x6C],	%g2
	bcc,pt	%icc,	loop_5
loop_4:
	edge8l	%l2,	%o5,	%g3
	for	%f16,	%f20,	%f28
	movrlez	%o4,	%i6,	%o3
loop_5:
	ldsh	[%l7 + 0x36],	%l4
	tvs	%icc,	0x4
	sllx	%l6,	0x03,	%o1
	tn	%xcc,	0x6
	wr	%g0,	0x22,	%asi
	stba	%i7,	[%l7 + 0x0F] %asi
	membar	#Sync
	xnorcc	%o2,	0x0724,	%i1
	fandnot2s	%f15,	%f25,	%f26
	udiv	%o7,	0x1FAA,	%o0
	stb	%l5,	[%l7 + 0x78]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f10,	%f10,	%f14
	ba,pt	%icc,	loop_6
	tleu	%icc,	0x4
	fandnot1	%f8,	%f28,	%f2
	udivcc	%i2,	0x1B2B,	%i5
loop_6:
	fcmpd	%fcc3,	%f10,	%f2
	fbe	%fcc1,	loop_7
	fors	%f12,	%f22,	%f26
	fors	%f2,	%f20,	%f11
	tn	%xcc,	0x2
loop_7:
	nop
	setx	loop_8,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stbar
	add	%g5,	%l0,	%i3
	fsrc1s	%f28,	%f11
loop_8:
	nop
	set	0x59, %g5
	stba	%i4,	[%l7 + %g5] 0x2a
	membar	#Sync
	subc	%g1,	%l1,	%g7
	membar	0x7A
	array32	%g6,	%i0,	%l3
	for	%f16,	%f8,	%f10
	fbl,a	%fcc3,	loop_9
	fmovrde	%o6,	%f26,	%f24
	xnor	%g2,	%l2,	%o5
	movge	%xcc,	%g3,	%o4
loop_9:
	bcs,a,pn	%icc,	loop_10
	movcc	%xcc,	%g4,	%i6
	udiv	%o3,	0x1C9F,	%l4
	tsubcc	%l6,	%i7,	%o2
loop_10:
	fmul8x16	%f13,	%f8,	%f18
	fxnor	%f14,	%f16,	%f10
	movle	%icc,	%o1,	%i1
	movcs	%icc,	%o7,	%l5
	fcmpeq16	%f0,	%f6,	%o0
	orn	%i5,	%g5,	%i2
	sll	%l0,	%i3,	%g1
	tsubcctv	%l1,	%g7,	%g6
	xnorcc	%i4,	0x19F4,	%i0
	tcc	%icc,	0x5
	movrgez	%o6,	0x15D,	%l3
	addc	%l2,	0x1EF3,	%g2
	fornot1	%f4,	%f10,	%f12
	subc	%o5,	0x0F72,	%g3
	fmovrdne	%g4,	%f8,	%f14
	tcs	%xcc,	0x1
	movneg	%icc,	%o4,	%o3
	udiv	%l4,	0x1E99,	%l6
	fbule	%fcc2,	loop_11
	fmovdl	%xcc,	%f14,	%f6
	udivx	%i6,	0x0AB3,	%o2
	ldsb	[%l7 + 0x71],	%i7
loop_11:
	movn	%xcc,	%o1,	%i1
	wr	%g0,	0x80,	%asi
	stxa	%o7,	[%l7 + 0x40] %asi
	taddcc	%l5,	0x03E8,	%o0
	fornot2s	%f12,	%f4,	%f3
	movn	%xcc,	%i5,	%i2
	fands	%f12,	%f2,	%f25
	andn	%g5,	0x06A7,	%l0
	siam	0x7
	move	%xcc,	%g1,	%l1
	fcmpgt32	%f22,	%f30,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%g7
	fsrc2	%f2,	%f0
	sllx	%i0,	%o6,	%l3
	tg	%xcc,	0x3
	fbug	%fcc0,	loop_12
	tpos	%xcc,	0x6
	tl	%xcc,	0x2
	tle	%icc,	0x5
loop_12:
	smul	%l2,	%g2,	%i4
	bn,a,pn	%icc,	loop_13
	sra	%g3,	%g4,	%o4
	bgu,pn	%xcc,	loop_14
	edge32n	%o5,	%o3,	%l4
loop_13:
	srax	%l6,	0x03,	%o2
	brnz,a	%i7,	loop_15
loop_14:
	edge8n	%o1,	%i6,	%i1
	movle	%xcc,	%o7,	%l5
	edge16	%o0,	%i2,	%i5
loop_15:
	smul	%l0,	0x09BA,	%g5
	ta	%icc,	0x2
	set	0x5C, %o5
	lduha	[%l7 + %o5] 0x18,	%l1
	edge8n	%g1,	%i3,	%g6
	brlz,a	%i0,	loop_16
	fmovrslez	%o6,	%f22,	%f31
	edge8	%g7,	%l2,	%g2
	fpadd32	%f20,	%f6,	%f4
loop_16:
	tvs	%icc,	0x1
	edge16l	%l3,	%g3,	%i4
	sub	%o4,	0x14AC,	%g4
	movgu	%icc,	%o5,	%o3
	nop
	setx	loop_17,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%xcc,	%l4,	%l6
	popc	%o2,	%i7
	fmovrsgz	%i6,	%f1,	%f31
loop_17:
	fornot2s	%f1,	%f23,	%f24
	edge32	%o1,	%i1,	%o7
	movvc	%xcc,	%l5,	%o0
	nop
	setx	loop_18,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcc	%xcc,	%f31,	%f8
	bleu,a	%icc,	loop_19
	xnorcc	%i2,	%l0,	%i5
loop_18:
	addccc	%l1,	%g1,	%g5
	array32	%i3,	%i0,	%g6
loop_19:
	stb	%o6,	[%l7 + 0x71]
	wr	%g0,	0x80,	%asi
	sta	%f13,	[%l7 + 0x28] %asi
	edge16l	%g7,	%l2,	%l3
	tl	%xcc,	0x3
	edge32	%g3,	%g2,	%o4
	ldd	[%l7 + 0x60],	%i4
	edge8l	%o5,	%o3,	%l4
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x81,	%i6
	udivx	%o2,	0x0FC4,	%i7
	array32	%g4,	%i6,	%i1
	andncc	%o1,	%l5,	%o7
	mulx	%i2,	0x1A60,	%l0
	sdivcc	%o0,	0x1E9C,	%l1
	fcmped	%fcc0,	%f10,	%f6
	wr	%g0,	0x10,	%asi
	sta	%f6,	[%l7 + 0x34] %asi
	nop
	setx	loop_20,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%icc,	0x4
	fmuld8ulx16	%f14,	%f25,	%f30
	fmovdne	%xcc,	%f8,	%f23
loop_20:
	tge	%icc,	0x6
	ta	%xcc,	0x2
	movgu	%xcc,	%i5,	%g1
	fmovdvs	%xcc,	%f14,	%f1
	movrgz	%i3,	0x399,	%g5
	edge16l	%i0,	%o6,	%g6
	edge8n	%g7,	%l2,	%g3
	tge	%xcc,	0x0
	fnands	%f31,	%f15,	%f14
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	taddcctv	%g2,	%i4,	%o4
	sdivx	%o5,	0x11D6,	%o3
	alignaddr	%l6,	%o2,	%i7
	addc	%g4,	%l4,	%i1
	tleu	%icc,	0x2
	ble,a,pn	%icc,	loop_21
	fandnot2	%f22,	%f22,	%f16
	stbar
	movrgz	%o1,	0x199,	%l5
loop_21:
	edge32ln	%o7,	%i6,	%l0
	edge16ln	%i2,	%o0,	%i5
	fands	%f22,	%f11,	%f17
	udivx	%l1,	0x125E,	%i3
	fexpand	%f22,	%f4
	set	0x08, %g3
	stwa	%g1,	[%l7 + %g3] 0x0c
	mulx	%g5,	%o6,	%g6
	wr	%g0,	0x2f,	%asi
	stha	%g7,	[%l7 + 0x52] %asi
	membar	#Sync
	subcc	%i0,	0x10EF,	%l2
	edge16l	%g3,	%l3,	%i4
	fmovsvc	%icc,	%f8,	%f4
	brlez	%g2,	loop_22
	andcc	%o4,	0x198E,	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l6,	%o5
loop_22:
	ldx	[%l7 + 0x18],	%o2
	ldsb	[%l7 + 0x53],	%i7
	udivx	%l4,	0x05AB,	%i1
	smul	%g4,	0x02E6,	%l5
	sdivx	%o1,	0x1B06,	%o7
	fbuge,a	%fcc1,	loop_23
	fnands	%f7,	%f6,	%f7
	orncc	%l0,	%i6,	%o0
	fnot1s	%f17,	%f20
loop_23:
	tl	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x12] %asi,	%i2
	tg	%xcc,	0x7
	movvs	%icc,	%l1,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc2,	loop_24
	nop
	setx	loop_25,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%i3,	%g1
	ta	%xcc,	0x2
loop_24:
	edge16ln	%g5,	%o6,	%g6
loop_25:
	edge16ln	%g7,	%i0,	%g3
	fmovsl	%xcc,	%f28,	%f3
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x2f,	%l2
	te	%icc,	0x1
	edge32	%l3,	%g2,	%i4
	fble	%fcc0,	loop_26
	tvc	%icc,	0x1
	andn	%o4,	0x1531,	%o3
	umulcc	%l6,	0x0AC6,	%o5
loop_26:
	fpadd16s	%f26,	%f25,	%f4
	bvs,a	%icc,	loop_27
	movle	%icc,	%i7,	%o2
	ba,a,pn	%icc,	loop_28
	andn	%i1,	0x048A,	%g4
loop_27:
	alignaddr	%l4,	%o1,	%l5
	stx	%o7,	[%l7 + 0x68]
loop_28:
	udivcc	%l0,	0x019B,	%o0
	fblg,a	%fcc0,	loop_29
	fmuld8sux16	%f17,	%f15,	%f8
	edge32ln	%i6,	%l1,	%i2
	fcmpeq32	%f14,	%f12,	%i5
loop_29:
	array16	%i3,	%g5,	%g1
	tgu	%xcc,	0x7
	add	%g6,	0x0C2D,	%o6
	set	0x79, %g2
	lduba	[%l7 + %g2] 0x15,	%i0
	swap	[%l7 + 0x2C],	%g7
	andncc	%l2,	%g3,	%l3
	tcc	%icc,	0x7
	movleu	%icc,	%g2,	%o4
	movg	%xcc,	%o3,	%l6
	prefetch	[%l7 + 0x50],	 0x2
	fmovsn	%icc,	%f22,	%f7
	fbug,a	%fcc3,	loop_30
	fcmple16	%f4,	%f12,	%i4
	te	%xcc,	0x4
	lduh	[%l7 + 0x12],	%i7
loop_30:
	st	%f31,	[%l7 + 0x3C]
	sll	%o5,	0x0F,	%i1
	tneg	%xcc,	0x7
	tsubcc	%o2,	0x1E06,	%g4
	ta	%xcc,	0x4
	andcc	%o1,	%l4,	%o7
	movrlez	%l0,	%o0,	%l5
	set	0x2B, %i2
	lduba	[%l7 + %i2] 0x89,	%i6
	fmovsle	%icc,	%f29,	%f25
	xorcc	%l1,	%i2,	%i3
	fmovdl	%xcc,	%f29,	%f24
	mulx	%i5,	%g1,	%g6
	fnors	%f0,	%f25,	%f31
	movvs	%xcc,	%g5,	%i0
	fblg,a	%fcc1,	loop_31
	edge32l	%o6,	%l2,	%g3
	and	%l3,	0x03F8,	%g2
	fmovrdgz	%g7,	%f8,	%f20
loop_31:
	smul	%o4,	0x1B87,	%o3
	edge32l	%i4,	%i7,	%l6
	tn	%xcc,	0x6
	xorcc	%i1,	0x19D3,	%o5
	umulcc	%o2,	%g4,	%o1
	edge32l	%l4,	%o7,	%l0
	taddcc	%o0,	0x1121,	%l5
	edge32l	%l1,	%i2,	%i6
	movvc	%xcc,	%i3,	%i5
	popc	%g1,	%g6
	fcmpeq16	%f22,	%f14,	%g5
	edge32ln	%i0,	%l2,	%o6
	movvc	%icc,	%g3,	%l3
	movle	%xcc,	%g2,	%o4
	andncc	%o3,	%g7,	%i7
	sethi	0x0855,	%i4
	set	0x18, %o7
	lduba	[%l7 + %o7] 0x80,	%l6
	fcmpes	%fcc2,	%f31,	%f15
	fbule	%fcc3,	loop_32
	alignaddrl	%i1,	%o5,	%g4
	bne,a,pt	%icc,	loop_33
	fbne,a	%fcc0,	loop_34
loop_32:
	movle	%icc,	%o2,	%l4
	mulscc	%o1,	0x051D,	%l0
loop_33:
	array32	%o7,	%l5,	%l1
loop_34:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x0A] %asi,	%o0
	movgu	%xcc,	%i6,	%i2
	movcs	%icc,	%i3,	%i5
	tgu	%icc,	0x6
	ldd	[%l7 + 0x08],	%g0
	fcmpeq32	%f20,	%f26,	%g5
	nop
	setx	loop_35,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmps	%fcc1,	%f31,	%f4
	smul	%g6,	0x14A6,	%i0
	bvc	%xcc,	loop_36
loop_35:
	st	%f1,	[%l7 + 0x7C]
	andcc	%o6,	0x082F,	%g3
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x76] %asi,	%l2
loop_36:
	udiv	%g2,	0x1288,	%o4
	fmuld8ulx16	%f22,	%f29,	%f14
	fzero	%f0
	movrgz	%l3,	0x36F,	%g7
	set	0x18, %o6
	stwa	%o3,	[%l7 + %o6] 0x89
	movn	%icc,	%i4,	%l6
	brnz,a	%i1,	loop_37
	movgu	%icc,	%o5,	%g4
	set	0x11, %l2
	lduba	[%l7 + %l2] 0x0c,	%o2
loop_37:
	sra	%i7,	%l4,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_38,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%o1,	%o7,	%l1
	movre	%l5,	0x379,	%i6
	sdivcc	%i2,	0x026B,	%o0
loop_38:
	edge16	%i3,	%i5,	%g5
	fones	%f18
	udivcc	%g1,	0x0F96,	%g6
	movrlez	%i0,	%o6,	%g3
	ldsh	[%l7 + 0x20],	%g2
	tl	%icc,	0x1
	st	%f11,	[%l7 + 0x64]
	movn	%icc,	%o4,	%l2
	taddcctv	%g7,	%o3,	%l3
	nop
	setx	loop_39,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcc,a,pn	%icc,	loop_40
	fmovdn	%icc,	%f4,	%f30
	movrne	%i4,	%i1,	%l6
loop_39:
	movrgez	%o5,	0x2BF,	%g4
loop_40:
	edge32ln	%i7,	%l4,	%l0
	sdivcc	%o2,	0x1228,	%o1
	brgez	%o7,	loop_41
	tcc	%icc,	0x4
	set	0x50, %o3
	stwa	%l1,	[%l7 + %o3] 0xe3
	membar	#Sync
loop_41:
	addc	%l5,	0x1E88,	%i2
	udivcc	%i6,	0x0975,	%i3
	bneg	loop_42
	fbge	%fcc2,	loop_43
	fxnor	%f20,	%f14,	%f6
	fmovdvc	%icc,	%f13,	%f13
loop_42:
	orcc	%o0,	%i5,	%g1
loop_43:
	nop
	setx	loop_44,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stw	%g5,	[%l7 + 0x20]
	fone	%f30
	fone	%f4
loop_44:
	movne	%xcc,	%g6,	%o6
	brnz,a	%i0,	loop_45
	edge16l	%g3,	%o4,	%l2
	fcmpeq16	%f6,	%f6,	%g2
	sllx	%g7,	%o3,	%l3
loop_45:
	fmovrdlez	%i1,	%f28,	%f22
	bge	%xcc,	loop_46
	ldsw	[%l7 + 0x48],	%l6
	ldsw	[%l7 + 0x6C],	%o5
	movvs	%icc,	%i4,	%i7
loop_46:
	tgu	%xcc,	0x4
	tcc	%xcc,	0x0
	sir	0x090F
	srlx	%l4,	0x0E,	%g4
	stb	%o2,	[%l7 + 0x0C]
	udiv	%l0,	0x021C,	%o7
	membar	0x3F
	edge8l	%l1,	%o1,	%i2
	ldsb	[%l7 + 0x59],	%l5
	srax	%i6,	%o0,	%i5
	fblg	%fcc2,	loop_47
	fxnor	%f18,	%f24,	%f24
	movrgz	%g1,	%g5,	%i3
	or	%g6,	%o6,	%g3
loop_47:
	sll	%i0,	%l2,	%o4
	fxnor	%f30,	%f16,	%f6
	xnorcc	%g7,	%o3,	%g2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x19] %asi,	%l3
	xnor	%i1,	%o5,	%l6
	fble	%fcc1,	loop_48
	fmovdvc	%icc,	%f21,	%f20
	fbue,a	%fcc3,	loop_49
	bg,pn	%xcc,	loop_50
loop_48:
	st	%f4,	[%l7 + 0x74]
	and	%i4,	%l4,	%g4
loop_49:
	array16	%o2,	%l0,	%o7
loop_50:
	fmovsg	%icc,	%f27,	%f30
	fornot2s	%f27,	%f8,	%f21
	movvc	%xcc,	%l1,	%o1
	sdiv	%i7,	0x1E11,	%i2
	udivcc	%l5,	0x1A9F,	%i6
	fnors	%f12,	%f30,	%f22
	tcc	%icc,	0x7
	movleu	%icc,	%i5,	%g1
	tcc	%icc,	0x4
	edge32ln	%g5,	%i3,	%g6
	edge16ln	%o6,	%g3,	%i0
	add	%o0,	0x125A,	%l2
	fnot2	%f30,	%f30
	fors	%f31,	%f10,	%f2
	fnot2s	%f10,	%f30
	movl	%xcc,	%g7,	%o4
	tcc	%icc,	0x1
	addccc	%o3,	0x18C1,	%l3
	bvc,a,pn	%icc,	loop_51
	ldstub	[%l7 + 0x4B],	%g2
	wr	%g0,	0x52,	%asi
	stxa	%i1,	[%g0 + 0x108] %asi
loop_51:
	movn	%xcc,	%o5,	%l6
	array32	%l4,	%i4,	%g4
	srlx	%l0,	0x0C,	%o7
	call	loop_52
	fbug,a	%fcc0,	loop_53
	ld	[%l7 + 0x78],	%f5
	andncc	%o2,	%l1,	%i7
loop_52:
	move	%xcc,	%i2,	%l5
loop_53:
	tl	%icc,	0x3
	ldd	[%l7 + 0x60],	%i6
	stw	%o1,	[%l7 + 0x74]
	te	%xcc,	0x5
	fpsub16s	%f16,	%f24,	%f21
	brlz	%g1,	loop_54
	movcs	%xcc,	%g5,	%i3
	addcc	%i5,	0x0676,	%o6
	edge8	%g6,	%i0,	%o0
loop_54:
	edge8n	%l2,	%g3,	%o4
	std	%f20,	[%l7 + 0x30]
	edge32n	%g7,	%o3,	%g2
	ld	[%l7 + 0x60],	%f13
	fmovsa	%xcc,	%f1,	%f2
	fxors	%f25,	%f12,	%f13
	fmul8x16	%f6,	%f18,	%f22
	fbg	%fcc3,	loop_55
	and	%i1,	%o5,	%l3
	smul	%l6,	%i4,	%g4
	movvs	%icc,	%l0,	%l4
loop_55:
	fmovrdne	%o2,	%f4,	%f8
	fmovde	%icc,	%f14,	%f16
	brlez,a	%l1,	loop_56
	orn	%i7,	0x1E32,	%i2
	array16	%l5,	%i6,	%o1
	brlez,a	%g1,	loop_57
loop_56:
	array32	%o7,	%g5,	%i5
	membar	0x31
	bl,a,pn	%icc,	loop_58
loop_57:
	sdivx	%i3,	0x1023,	%o6
	edge16l	%i0,	%g6,	%o0
	sll	%l2,	%o4,	%g3
loop_58:
	fcmple16	%f4,	%f16,	%g7
	set	0x61, %g6
	stba	%g2,	[%l7 + %g6] 0x18
	subcc	%o3,	0x1D64,	%i1
	fones	%f20
	fandnot2s	%f16,	%f13,	%f19
	fbu,a	%fcc1,	loop_59
	sethi	0x1FC0,	%o5
	tsubcctv	%l3,	0x0395,	%l6
	movrgez	%g4,	%l0,	%l4
loop_59:
	fpack16	%f4,	%f15
	fbl,a	%fcc3,	loop_60
	addc	%o2,	%l1,	%i7
	smul	%i2,	0x0FD6,	%i4
	add	%l5,	%i6,	%g1
loop_60:
	fba,a	%fcc2,	loop_61
	ldub	[%l7 + 0x7D],	%o1
	array32	%o7,	%g5,	%i5
	ldd	[%l7 + 0x50],	%o6
loop_61:
	tvc	%xcc,	0x7
	fandnot2s	%f9,	%f9,	%f21
	edge8	%i0,	%i3,	%g6
	wr	%g0,	0x18,	%asi
	stwa	%o0,	[%l7 + 0x4C] %asi
	set	0x18, %i3
	stda	%o4,	[%l7 + %i3] 0x10
	addcc	%l2,	0x0D42,	%g3
	prefetch	[%l7 + 0x38],	 0x1
	movrgez	%g7,	0x3D9,	%o3
	movgu	%xcc,	%g2,	%o5
	smulcc	%i1,	%l6,	%g4
	movcc	%xcc,	%l3,	%l0
	fbe,a	%fcc2,	loop_62
	fbg	%fcc3,	loop_63
	xor	%l4,	0x12BD,	%l1
	tge	%icc,	0x0
loop_62:
	xorcc	%o2,	0x1493,	%i7
loop_63:
	edge16n	%i2,	%i4,	%i6
	movl	%icc,	%l5,	%g1
	call	loop_64
	movg	%icc,	%o1,	%o7
	sdivcc	%i5,	0x05D4,	%g5
	edge8ln	%i0,	%o6,	%g6
loop_64:
	edge32ln	%o0,	%i3,	%o4
	fmovsg	%xcc,	%f0,	%f8
	srl	%g3,	0x1F,	%l2
	bge,a,pt	%xcc,	loop_65
	brz,a	%o3,	loop_66
	fbule	%fcc0,	loop_67
	edge32ln	%g2,	%g7,	%i1
loop_65:
	tl	%icc,	0x4
loop_66:
	fcmpeq16	%f6,	%f0,	%o5
loop_67:
	fbn	%fcc1,	loop_68
	andn	%g4,	%l3,	%l0
	addccc	%l4,	0x073D,	%l1
	xnor	%o2,	0x1B46,	%i7
loop_68:
	and	%i2,	0x0E31,	%i4
	edge32ln	%l6,	%i6,	%l5
	xor	%g1,	%o7,	%o1
	fnor	%f10,	%f28,	%f20
	and	%g5,	0x0502,	%i0
	umul	%i5,	%o6,	%g6
	fmovda	%xcc,	%f29,	%f10
	edge8l	%o0,	%o4,	%g3
	andn	%l2,	%i3,	%g2
	fnot1s	%f7,	%f28
	fpsub16	%f4,	%f18,	%f16
	xnor	%o3,	0x1B7A,	%g7
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x81,	%i0
	and	%o5,	%l3,	%g4
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x3C] %asi,	%f0
	pdist	%f18,	%f10,	%f24
	tleu	%xcc,	0x5
	fbo	%fcc0,	loop_69
	fble,a	%fcc1,	loop_70
	popc	%l0,	%l1
	bvs,pn	%icc,	loop_71
loop_69:
	umulcc	%o2,	0x16CF,	%i7
loop_70:
	fnand	%f6,	%f6,	%f2
	fbn,a	%fcc3,	loop_72
loop_71:
	xnorcc	%l4,	%i2,	%i4
	fba,a	%fcc3,	loop_73
	subcc	%l6,	%l5,	%g1
loop_72:
	movcc	%xcc,	%i6,	%o7
	tcc	%xcc,	0x4
loop_73:
	umul	%g5,	0x0F33,	%o1
	subcc	%i5,	0x09A6,	%i0
	umulcc	%o6,	%g6,	%o0
	call	loop_74
	fmovd	%f8,	%f14
	tcs	%icc,	0x4
	tge	%icc,	0x2
loop_74:
	srlx	%g3,	0x17,	%l2
	array16	%o4,	%i3,	%o3
	sllx	%g7,	%i1,	%g2
	ld	[%l7 + 0x68],	%f4
	sdivx	%l3,	0x01A1,	%o5
	fmovrde	%g4,	%f30,	%f20
	orncc	%l1,	0x1145,	%l0
	fcmple32	%f6,	%f6,	%i7
	udivx	%o2,	0x0579,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x5
	ldstub	[%l7 + 0x69],	%i2
	movrlz	%i4,	%l5,	%g1
	ldd	[%l7 + 0x58],	%f26
	or	%i6,	%l6,	%g5
	or	%o7,	%i5,	%o1
	addcc	%i0,	0x0B8B,	%o6
	swap	[%l7 + 0x10],	%o0
	bge,a,pn	%xcc,	loop_75
	mulscc	%g6,	%l2,	%g3
	edge32	%o4,	%o3,	%g7
	fmovrdlez	%i3,	%f26,	%f20
loop_75:
	sllx	%i1,	0x01,	%g2
	tl	%icc,	0x5
	brnz,a	%o5,	loop_76
	move	%xcc,	%g4,	%l1
	ldsw	[%l7 + 0x38],	%l0
	andcc	%i7,	0x114D,	%o2
loop_76:
	tgu	%icc,	0x1
	movleu	%xcc,	%l3,	%l4
	movl	%xcc,	%i2,	%i4
	ble,pt	%icc,	loop_77
	tvs	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x28],	%l4
loop_77:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pn	%xcc,	loop_78
	ldub	[%l7 + 0x62],	%i6
	fmovda	%xcc,	%f5,	%f26
	sra	%l6,	0x1D,	%g5
loop_78:
	stb	%g1,	[%l7 + 0x17]
	andcc	%i5,	%o1,	%o7
	fba	%fcc2,	loop_79
	tvc	%icc,	0x1
	tne	%xcc,	0x5
	wr	%g0,	0x19,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
loop_79:
	bleu,pn	%xcc,	loop_80
	stbar
	bcs,a,pt	%xcc,	loop_81
	umulcc	%i0,	0x065E,	%g6
loop_80:
	array8	%l2,	%o0,	%o4
	swap	[%l7 + 0x14],	%g3
loop_81:
	movre	%o3,	0x17D,	%i3
	edge8l	%g7,	%i1,	%o5
	taddcctv	%g4,	%l1,	%l0
	movne	%xcc,	%i7,	%g2
	srlx	%o2,	%l3,	%l4
	fmovdpos	%xcc,	%f12,	%f17
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%i4
	fnand	%f2,	%f10,	%f8
	bneg,pt	%xcc,	loop_82
	edge16	%l5,	%i6,	%i2
	membar	0x1A
	tcs	%xcc,	0x1
loop_82:
	fpmerge	%f15,	%f18,	%f18
	ldx	[%l7 + 0x48],	%g5
	tpos	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g1
	xor	%i5,	0x1E4E,	%o1
	srl	%o7,	0x14,	%o6
	orn	%i0,	0x07D4,	%l6
	nop
	setx	loop_83,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbne,a	%fcc0,	loop_84
	mova	%xcc,	%l2,	%o0
	add	%g6,	0x0B32,	%o4
loop_83:
	edge8n	%o3,	%i3,	%g3
loop_84:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f8,	[%l7 + 0x68] %asi
	subcc	%i1,	0x1847,	%o5
	tsubcctv	%g7,	0x06B2,	%l1
	movpos	%icc,	%l0,	%g4
	nop
	setx	loop_85,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%i7,	0x01,	%g2
	brnz	%l3,	loop_86
	movcc	%xcc,	%l4,	%o2
loop_85:
	movrlez	%i4,	0x1F1,	%i6
	ba,a,pn	%icc,	loop_87
loop_86:
	fmovspos	%icc,	%f29,	%f19
	fcmpgt16	%f12,	%f22,	%i2
	movrgez	%l5,	%g5,	%g1
loop_87:
	fbg	%fcc0,	loop_88
	bn,a,pn	%icc,	loop_89
	sdivx	%i5,	0x1A5F,	%o7
	stb	%o6,	[%l7 + 0x76]
loop_88:
	fmuld8ulx16	%f2,	%f15,	%f10
loop_89:
	fmovdg	%xcc,	%f30,	%f18
	st	%f10,	[%l7 + 0x3C]
	fmovsn	%icc,	%f27,	%f17
	ldd	[%l7 + 0x38],	%i0
	ldsh	[%l7 + 0x62],	%o1
	udiv	%l2,	0x0DAD,	%l6
	movpos	%xcc,	%o0,	%g6
	fone	%f0
	tvc	%icc,	0x3
	fmovdgu	%icc,	%f20,	%f16
	edge8	%o3,	%o4,	%i3
	bleu,pn	%icc,	loop_90
	array32	%g3,	%o5,	%i1
	movrgz	%g7,	0x2B2,	%l1
	st	%f20,	[%l7 + 0x74]
loop_90:
	tg	%icc,	0x5
	array8	%l0,	%i7,	%g4
	movleu	%icc,	%l3,	%l4
	tvc	%icc,	0x4
	ldd	[%l7 + 0x60],	%f6
	alignaddr	%o2,	%g2,	%i4
	fbu,a	%fcc2,	loop_91
	tne	%xcc,	0x0
	fmovdneg	%xcc,	%f26,	%f17
	edge16l	%i2,	%l5,	%g5
loop_91:
	bge	loop_92
	or	%g1,	0x1B26,	%i6
	tcc	%xcc,	0x4
	sdiv	%o7,	0x0DA9,	%i5
loop_92:
	nop
	set	0x40, %o2
	stwa	%o6,	[%l7 + %o2] 0x11
	bgu,a	%xcc,	loop_93
	movg	%icc,	%i0,	%l2
	set	0x30, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0x3
loop_93:
	fmovrdgez	%o0,	%f18,	%f22
	sethi	0x1339,	%g6
	udiv	%l6,	0x02D2,	%o3
	fmovdne	%xcc,	%f29,	%f17
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	taddcctv	%g3,	0x1FA9,	%o5
	movrgez	%i1,	%o4,	%l1
	lduw	[%l7 + 0x10],	%l0
	mova	%xcc,	%i7,	%g7
	movrlez	%g4,	0x294,	%l4
	for	%f6,	%f8,	%f16
	fmovrdgz	%l3,	%f2,	%f22
	fmul8x16	%f6,	%f4,	%f18
	fbne	%fcc2,	loop_94
	edge32ln	%o2,	%i4,	%g2
	fmovscc	%xcc,	%f10,	%f26
	fbul	%fcc0,	loop_95
loop_94:
	subccc	%l5,	%i2,	%g1
	subccc	%g5,	%o7,	%i5
	sir	0x1C56
loop_95:
	fble	%fcc2,	loop_96
	bcc	loop_97
	ld	[%l7 + 0x2C],	%f2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%i0
loop_96:
	sth	%l2,	[%l7 + 0x5C]
loop_97:
	tpos	%icc,	0x4
	srlx	%o6,	%o1,	%o0
	ldsw	[%l7 + 0x34],	%l6
	popc	0x1ADA,	%g6
	fmovsge	%icc,	%f21,	%f6
	xor	%o3,	0x028A,	%i3
	taddcc	%o5,	0x1E37,	%i1
	udiv	%g3,	0x08D5,	%o4
	fpmerge	%f20,	%f3,	%f16
	fcmpgt32	%f26,	%f14,	%l0
	alignaddr	%l1,	%g7,	%i7
	fmovrse	%l4,	%f19,	%f13
	fcmple32	%f8,	%f0,	%l3
	ldstub	[%l7 + 0x15],	%g4
	bge,pn	%xcc,	loop_98
	sll	%i4,	%o2,	%g2
	fsrc1	%f16,	%f22
	ldd	[%l7 + 0x18],	%i2
loop_98:
	andn	%g1,	%l5,	%o7
	fmul8sux16	%f24,	%f4,	%f18
	tge	%xcc,	0x3
	ldstub	[%l7 + 0x0F],	%g5
	st	%f21,	[%l7 + 0x08]
	smul	%i5,	%i0,	%i6
	movne	%xcc,	%l2,	%o1
	fabss	%f15,	%f0
	addcc	%o0,	%o6,	%l6
	smul	%g6,	%i3,	%o3
	fabss	%f16,	%f28
	subc	%i1,	0x13AE,	%o5
	flush	%l7 + 0x60
	edge32n	%o4,	%g3,	%l1
	brgez,a	%g7,	loop_99
	fmovrse	%l0,	%f12,	%f20
	xor	%i7,	%l3,	%l4
	edge8ln	%g4,	%i4,	%g2
loop_99:
	fsrc1s	%f15,	%f24
	fbe	%fcc1,	loop_100
	udivx	%o2,	0x068E,	%i2
	nop
	setx	loop_101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x30],	%f22
loop_100:
	movle	%xcc,	%g1,	%o7
	ldub	[%l7 + 0x56],	%g5
loop_101:
	udivx	%l5,	0x19A3,	%i5
	alignaddrl	%i0,	%l2,	%i6
	fmovrdlez	%o0,	%f22,	%f28
	fmovdvs	%icc,	%f13,	%f23
	andn	%o1,	%l6,	%o6
	fandnot2s	%f5,	%f26,	%f24
	fpadd32s	%f9,	%f16,	%f23
	addc	%g6,	0x173B,	%i3
	tl	%icc,	0x2
	subccc	%i1,	%o3,	%o5
	fmovda	%xcc,	%f13,	%f24
	brgz	%g3,	loop_102
	orcc	%o4,	0x1CD3,	%l1
	movgu	%icc,	%g7,	%i7
	array16	%l0,	%l4,	%l3
loop_102:
	st	%f21,	[%l7 + 0x5C]
	edge32l	%i4,	%g4,	%o2
	movrne	%i2,	%g1,	%g2
	array8	%o7,	%g5,	%l5
	fxors	%f6,	%f0,	%f28
	movcc	%xcc,	%i5,	%l2
	fmovdvs	%xcc,	%f11,	%f3
	fmovsa	%icc,	%f17,	%f25
	mulscc	%i0,	0x1F37,	%o0
	orcc	%i6,	0x14F3,	%l6
	set	0x43, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc3,	loop_103
	stbar
	movrlz	%o1,	0x02D,	%g6
	edge16n	%i3,	%i1,	%o5
loop_103:
	fmovrdlz	%g3,	%f22,	%f28
	movrlz	%o4,	%o3,	%g7
	fmovsgu	%xcc,	%f3,	%f10
	movg	%icc,	%i7,	%l1
	movrlz	%l0,	%l4,	%i4
	array8	%g4,	%l3,	%o2
	xor	%i2,	%g1,	%g2
	subc	%o7,	0x01C7,	%g5
	te	%icc,	0x1
	taddcc	%l5,	0x0DF0,	%i5
	te	%xcc,	0x2
	tg	%xcc,	0x3
	set	0x08, %o1
	swapa	[%l7 + %o1] 0x81,	%l2
	subcc	%o0,	%i0,	%l6
	fandnot1s	%f2,	%f7,	%f30
	udivcc	%i6,	0x1DAB,	%o1
	fmovs	%f25,	%f5
	orcc	%g6,	0x07B0,	%i3
	smulcc	%o6,	0x1709,	%i1
	ta	%xcc,	0x1
	wr	%g0,	0x19,	%asi
	stba	%g3,	[%l7 + 0x3D] %asi
	sub	%o4,	%o3,	%g7
	fcmple32	%f4,	%f8,	%o5
	mulx	%i7,	%l1,	%l4
	xnorcc	%l0,	0x1CFF,	%i4
	tvs	%xcc,	0x1
	movrlz	%g4,	%l3,	%o2
	xor	%g1,	%g2,	%i2
	edge8ln	%g5,	%o7,	%l5
	tvc	%xcc,	0x4
	ba,pt	%xcc,	loop_104
	sdivcc	%l2,	0x1AE3,	%i5
	movn	%xcc,	%i0,	%o0
	movvs	%icc,	%l6,	%o1
loop_104:
	lduh	[%l7 + 0x16],	%g6
	flush	%l7 + 0x58
	sub	%i3,	0x13E3,	%o6
	bcs,a	loop_105
	edge16n	%i6,	%g3,	%o4
	tvs	%xcc,	0x7
	st	%f10,	[%l7 + 0x68]
loop_105:
	srax	%i1,	0x0E,	%o3
	fbl,a	%fcc0,	loop_106
	sll	%g7,	0x03,	%o5
	fpsub32s	%f0,	%f16,	%f24
	subcc	%l1,	0x01B8,	%l4
loop_106:
	brlz	%i7,	loop_107
	for	%f16,	%f24,	%f14
	fmul8x16au	%f11,	%f13,	%f0
	sir	0x0A03
loop_107:
	fxnors	%f20,	%f0,	%f31
	udivx	%l0,	0x0A78,	%g4
	ldsb	[%l7 + 0x42],	%i4
	movre	%l3,	0x2DB,	%o2
	tge	%icc,	0x2
	tpos	%xcc,	0x7
	sir	0x0F7B
	movle	%icc,	%g1,	%g2
	tvc	%icc,	0x0
	tge	%xcc,	0x0
	fbe	%fcc2,	loop_108
	alignaddr	%g5,	%o7,	%i2
	and	%l5,	%l2,	%i5
	movgu	%xcc,	%o0,	%i0
loop_108:
	stw	%l6,	[%l7 + 0x7C]
	fsrc1s	%f29,	%f8
	edge8l	%g6,	%i3,	%o6
	edge8n	%o1,	%g3,	%i6
	smul	%o4,	0x1245,	%i1
	move	%icc,	%o3,	%g7
	edge8l	%o5,	%l1,	%l4
	subc	%l0,	%g4,	%i7
	tcs	%icc,	0x5
	edge8l	%l3,	%o2,	%g1
	umul	%i4,	%g5,	%g2
	fmovsle	%icc,	%f24,	%f19
	smul	%i2,	%o7,	%l2
	movvc	%xcc,	%l5,	%i5
	addccc	%o0,	0x19FC,	%l6
	fmovdn	%icc,	%f12,	%f13
	nop
	setx loop_109, %l0, %l1
	jmpl %l1, %g6
	fbue,a	%fcc3,	loop_110
	ldd	[%l7 + 0x48],	%i2
	tleu	%icc,	0x0
loop_109:
	fandnot1	%f22,	%f30,	%f28
loop_110:
	fmovrsne	%i0,	%f14,	%f19
	movcc	%xcc,	%o1,	%o6
	or	%i6,	%g3,	%i1
	array8	%o3,	%g7,	%o5
	edge8l	%o4,	%l1,	%l4
	fmovs	%f17,	%f6
	tl	%xcc,	0x7
	array16	%l0,	%i7,	%g4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	edge8l	%l3,	%i4,	%g1
	movre	%g5,	%g2,	%i2
	tleu	%icc,	0x2
	movne	%xcc,	%o7,	%l5
	movleu	%xcc,	%l2,	%o0
	tpos	%xcc,	0x2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i5,	%l6
	movrlz	%i3,	0x3A8,	%g6
	alignaddrl	%o1,	%o6,	%i0
	fbe,a	%fcc3,	loop_111
	orcc	%i6,	0x01D2,	%i1
	tg	%icc,	0x3
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x1e
	membar	#Sync
loop_111:
	andn	%o3,	%g3,	%g7
	tneg	%xcc,	0x7
	andncc	%o4,	%o5,	%l1
	set	0x76, %g7
	ldsha	[%l7 + %g7] 0x15,	%l0
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x10,	 0x0
	nop
	setx loop_112, %l0, %l1
	jmpl %l1, %g4
	ldsw	[%l7 + 0x64],	%l4
	edge32	%o2,	%l3,	%i4
	ble,a	loop_113
loop_112:
	bvs	%xcc,	loop_114
	membar	0x5D
	bge,pn	%icc,	loop_115
loop_113:
	tne	%xcc,	0x4
loop_114:
	fzeros	%f25
	fcmpeq16	%f16,	%f10,	%g5
loop_115:
	te	%xcc,	0x0
	fmovscs	%xcc,	%f28,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g2,	%g1,	%i2
	umul	%l5,	%l2,	%o0
	brgez	%o7,	loop_116
	fmovrde	%l6,	%f20,	%f14
	srlx	%i3,	0x01,	%i5
	umulcc	%g6,	0x0C6F,	%o1
loop_116:
	mulx	%o6,	0x02C9,	%i6
	xnorcc	%i0,	0x1EF8,	%i1
	tvc	%xcc,	0x3
	tcc	%xcc,	0x4
	stbar
	sra	%o3,	%g3,	%g7
	fpsub32s	%f11,	%f14,	%f8
	movgu	%xcc,	%o4,	%o5
	brgz	%l1,	loop_117
	movrgez	%l0,	0x309,	%i7
	fones	%f12
	subc	%g4,	0x0ED7,	%o2
loop_117:
	xorcc	%l3,	0x199E,	%l4
	andn	%g5,	0x16DB,	%g2
	sth	%g1,	[%l7 + 0x7E]
	fornot2s	%f4,	%f0,	%f18
	and	%i4,	0x07EB,	%l5
	bneg,pt	%xcc,	loop_118
	srax	%l2,	%o0,	%o7
	tneg	%icc,	0x3
	movrgez	%l6,	%i2,	%i3
loop_118:
	bcs,a	%xcc,	loop_119
	edge32ln	%i5,	%o1,	%g6
	fnegd	%f12,	%f16
	fnegs	%f16,	%f21
loop_119:
	tle	%xcc,	0x2
	movge	%icc,	%i6,	%o6
	fmovsl	%xcc,	%f13,	%f14
	tn	%xcc,	0x7
	sra	%i1,	%o3,	%i0
	mulscc	%g7,	0x187C,	%o4
	xnor	%o5,	0x0A58,	%l1
	tvs	%xcc,	0x4
	nop
	set	0x30, %l0
	std	%f22,	[%l7 + %l0]
	sub	%g3,	%l0,	%g4
	fbuge	%fcc1,	loop_120
	addc	%i7,	0x0588,	%o2
	tcs	%icc,	0x2
	edge8	%l4,	%l3,	%g2
loop_120:
	andn	%g1,	%g5,	%l5
	fmovdcc	%icc,	%f10,	%f18
	movre	%l2,	%i4,	%o0
	movl	%icc,	%o7,	%i2
	fcmpgt32	%f28,	%f8,	%l6
	tgu	%xcc,	0x4
	edge8	%i5,	%o1,	%i3
	fmul8x16	%f19,	%f10,	%f26
	lduw	[%l7 + 0x2C],	%i6
	tsubcctv	%o6,	0x0D1D,	%i1
	movl	%xcc,	%o3,	%g6
	addccc	%i0,	%o4,	%o5
	subccc	%l1,	0x1EEE,	%g3
	siam	0x5
	subcc	%l0,	0x1AC4,	%g4
	srl	%i7,	%g7,	%o2
	fxor	%f20,	%f26,	%f20
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f13
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%l3
	xorcc	%g2,	%g1,	%g5
	tne	%icc,	0x2
	alignaddr	%l4,	%l2,	%i4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%l5
	taddcc	%o0,	0x05F2,	%i2
	alignaddrl	%o7,	%l6,	%o1
	mulx	%i3,	0x155D,	%i5
	movleu	%xcc,	%i6,	%i1
	bvc	%icc,	loop_121
	andn	%o3,	0x174E,	%o6
	movre	%g6,	%o4,	%o5
	set	0x5C, %i0
	sta	%f18,	[%l7 + %i0] 0x04
loop_121:
	nop
	set	0x48, %l1
	std	%f30,	[%l7 + %l1]
	fmovdg	%xcc,	%f28,	%f6
	sll	%l1,	0x08,	%g3
	call	loop_122
	movneg	%xcc,	%l0,	%i0
	fbule,a	%fcc3,	loop_123
	xnor	%g4,	0x1D31,	%g7
loop_122:
	fmovsle	%icc,	%f31,	%f9
	fexpand	%f20,	%f10
loop_123:
	udiv	%o2,	0x0379,	%l3
	movne	%icc,	%g2,	%g1
	tcc	%xcc,	0x3
	ldx	[%l7 + 0x10],	%g5
	sdivcc	%l4,	0x0B64,	%l2
	mova	%icc,	%i7,	%i4
	array32	%o0,	%i2,	%o7
	fbu	%fcc2,	loop_124
	movge	%icc,	%l5,	%l6
	subc	%o1,	0x025F,	%i5
	tsubcctv	%i6,	0x1B12,	%i1
loop_124:
	movrlez	%o3,	0x2BB,	%o6
	edge32ln	%g6,	%i3,	%o5
	udivcc	%l1,	0x1787,	%o4
	mulscc	%g3,	%l0,	%g4
	sir	0x135D
	lduw	[%l7 + 0x44],	%g7
	brlz,a	%i0,	loop_125
	edge8n	%l3,	%o2,	%g2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f1
loop_125:
	udivx	%g1,	0x066F,	%l4
	fmovrdgz	%l2,	%f24,	%f18
	fmovsneg	%icc,	%f5,	%f8
	movne	%xcc,	%g5,	%i7
	ldub	[%l7 + 0x74],	%i4
	udivx	%o0,	0x067D,	%o7
	edge8n	%l5,	%l6,	%i2
	tgu	%xcc,	0x5
	srlx	%i5,	%i6,	%i1
	movneg	%xcc,	%o1,	%o3
	ld	[%l7 + 0x48],	%f26
	smul	%g6,	%i3,	%o5
	sethi	0x1B7B,	%l1
	set	0x28, %l6
	prefetcha	[%l7 + %l6] 0x11,	 0x3
	fmovdn	%icc,	%f24,	%f17
	edge16ln	%o6,	%g3,	%l0
	tg	%icc,	0x4
	brlz,a	%g4,	loop_126
	swap	[%l7 + 0x28],	%i0
	xor	%g7,	0x1576,	%l3
	fmovdvs	%icc,	%f10,	%f31
loop_126:
	fmovscs	%xcc,	%f14,	%f31
	membar	0x40
	srlx	%o2,	0x1A,	%g2
	brlz,a	%g1,	loop_127
	fmovsle	%icc,	%f25,	%f3
	movcs	%xcc,	%l4,	%l2
	tne	%icc,	0x0
loop_127:
	srlx	%g5,	%i7,	%o0
	ld	[%l7 + 0x60],	%f19
	fabss	%f16,	%f23
	movl	%xcc,	%i4,	%l5
	tsubcctv	%l6,	%o7,	%i5
	edge32ln	%i6,	%i1,	%o1
	fbne	%fcc2,	loop_128
	array8	%o3,	%i2,	%g6
	subc	%o5,	0x09B0,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_128:
	te	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	andn	%o6,	%g3,	%o4
	fbuge	%fcc3,	loop_129
	bpos,pt	%icc,	loop_130
	brlez	%l0,	loop_131
	fcmps	%fcc2,	%f17,	%f29
loop_129:
	fmovs	%f23,	%f2
loop_130:
	fsrc2	%f22,	%f12
loop_131:
	udiv	%g4,	0x14A7,	%i0
	array8	%g7,	%o2,	%l3
	bge,pt	%icc,	loop_132
	move	%xcc,	%g2,	%g1
	st	%f2,	[%l7 + 0x7C]
	orncc	%l4,	%g5,	%l2
loop_132:
	andncc	%i7,	%i4,	%o0
	tne	%xcc,	0x4
	tvs	%xcc,	0x5
	brlez	%l6,	loop_133
	fmovrsgz	%o7,	%f19,	%f14
	tsubcc	%i5,	%l5,	%i6
	fbn	%fcc2,	loop_134
loop_133:
	tge	%xcc,	0x7
	nop
	set	0x3C, %l5
	lduh	[%l7 + %l5],	%o1
	fmuld8sux16	%f27,	%f25,	%f8
loop_134:
	edge32l	%o3,	%i2,	%i1
	xnorcc	%g6,	0x07DE,	%i3
	fpsub16s	%f29,	%f2,	%f14
	umulcc	%l1,	0x1C41,	%o6
	array16	%g3,	%o5,	%o4
	fmovsn	%icc,	%f12,	%f21
	edge16	%l0,	%g4,	%i0
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x54] %asi
	udivx	%o2,	0x1B43,	%g7
	edge8ln	%l3,	%g2,	%g1
	fmovsl	%icc,	%f1,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l4,	%g5,	%l2
	fcmpne32	%f4,	%f30,	%i7
	fmuld8sux16	%f13,	%f27,	%f2
	lduw	[%l7 + 0x10],	%o0
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x17,	%f16
	movpos	%icc,	%l6,	%o7
	fexpand	%f28,	%f0
	or	%i4,	%i5,	%i6
	fsrc1s	%f11,	%f16
	or	%l5,	%o3,	%i2
	brlz	%o1,	loop_135
	movcs	%xcc,	%g6,	%i1
	fpadd32s	%f12,	%f0,	%f28
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x3E] %asi,	%l1
loop_135:
	edge8ln	%o6,	%g3,	%o5
	taddcctv	%i3,	%o4,	%l0
	bneg,a	loop_136
	fnot2s	%f11,	%f15
	call	loop_137
	xnorcc	%i0,	%o2,	%g7
loop_136:
	xnor	%l3,	0x1ADF,	%g4
	umul	%g2,	%l4,	%g1
loop_137:
	tsubcc	%g5,	0x033A,	%i7
	tne	%icc,	0x1
	fbe	%fcc0,	loop_138
	fcmpd	%fcc2,	%f0,	%f8
	orn	%o0,	%l6,	%o7
	mulx	%i4,	0x1026,	%l2
loop_138:
	fpadd16s	%f24,	%f16,	%f23
	movcs	%icc,	%i5,	%l5
	edge16	%i6,	%i2,	%o1
	movl	%icc,	%g6,	%i1
	ba,pt	%xcc,	loop_139
	fmovdg	%icc,	%f29,	%f7
	tne	%icc,	0x1
	fmovrse	%l1,	%f13,	%f15
loop_139:
	movleu	%icc,	%o3,	%o6
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x1e,	%f16
	fabss	%f29,	%f18
	fmovsle	%icc,	%f9,	%f4
	edge8ln	%o5,	%i3,	%g3
	swap	[%l7 + 0x74],	%l0
	brgez	%i0,	loop_140
	fbe	%fcc3,	loop_141
	movcc	%xcc,	%o2,	%o4
	edge16	%g7,	%l3,	%g2
loop_140:
	fbul,a	%fcc0,	loop_142
loop_141:
	tg	%icc,	0x4
	nop
	setx	loop_143,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc2	%f22,	%f24
loop_142:
	fzeros	%f3
	orncc	%l4,	0x14FB,	%g1
loop_143:
	movne	%xcc,	%g5,	%i7
	set	0x34, %o0
	lda	[%l7 + %o0] 0x10,	%f22
	fmul8x16	%f1,	%f30,	%f28
	tvc	%icc,	0x7
	fand	%f28,	%f20,	%f28
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o0,	%g4
	fnot2	%f28,	%f30
	movvs	%icc,	%l6,	%o7
	fmuld8ulx16	%f19,	%f9,	%f24
	fpsub16	%f24,	%f4,	%f28
	edge16l	%l2,	%i5,	%l5
	movvc	%xcc,	%i6,	%i2
	fmovdpos	%icc,	%f1,	%f4
	ldd	[%l7 + 0x70],	%f24
	srl	%i4,	%o1,	%g6
	fmovdn	%icc,	%f4,	%f13
	orncc	%l1,	0x145F,	%i1
	fble	%fcc0,	loop_144
	te	%icc,	0x4
	fxnors	%f0,	%f3,	%f17
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_144:
	fpadd32	%f26,	%f24,	%f18
	tpos	%icc,	0x0
	fmul8x16al	%f4,	%f3,	%f18
	smulcc	%o6,	%o3,	%o5
	array16	%i3,	%g3,	%l0
	fmovsg	%xcc,	%f5,	%f2
	addc	%o2,	0x09C7,	%i0
	mulscc	%o4,	%g7,	%g2
	xor	%l3,	%l4,	%g1
	taddcc	%g5,	%o0,	%i7
	srax	%g4,	0x0D,	%l6
	tne	%xcc,	0x3
	fble	%fcc1,	loop_145
	fmovdg	%icc,	%f5,	%f16
	tl	%xcc,	0x0
	fmovscs	%icc,	%f19,	%f24
loop_145:
	fcmpgt32	%f24,	%f26,	%l2
	edge32l	%o7,	%l5,	%i5
	tvs	%icc,	0x2
	movrgez	%i6,	%i4,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f8,	%f0,	%f14
	orn	%g6,	0x027B,	%l1
	movrlz	%i1,	0x38C,	%o6
	andn	%o1,	%o5,	%i3
	membar	0x6A
	bneg,a	%xcc,	loop_146
	fblg	%fcc1,	loop_147
	andn	%o3,	%g3,	%o2
	xnor	%i0,	0x0626,	%o4
loop_146:
	nop
	setx loop_148, %l0, %l1
	jmpl %l1, %l0
loop_147:
	fbg,a	%fcc3,	loop_149
	edge8ln	%g2,	%g7,	%l3
	tvc	%xcc,	0x7
loop_148:
	fcmpne16	%f12,	%f14,	%g1
loop_149:
	bvc	%icc,	loop_150
	brgz	%l4,	loop_151
	ldd	[%l7 + 0x18],	%f20
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x70] %asi,	%g5
loop_150:
	ldd	[%l7 + 0x70],	%o0
loop_151:
	xnorcc	%i7,	%g4,	%l2
	movleu	%xcc,	%o7,	%l6
	smul	%l5,	%i6,	%i5
	movre	%i2,	0x389,	%g6
	fpadd32	%f2,	%f2,	%f20
	fbge,a	%fcc1,	loop_152
	movvc	%xcc,	%i4,	%l1
	stw	%o6,	[%l7 + 0x6C]
	bne,pt	%xcc,	loop_153
loop_152:
	smul	%i1,	0x0576,	%o1
	srlx	%i3,	%o5,	%o3
	edge32n	%g3,	%i0,	%o2
loop_153:
	edge16n	%o4,	%g2,	%l0
	bvs,pt	%xcc,	loop_154
	fnot1	%f4,	%f6
	set	0x5C, %g5
	ldswa	[%l7 + %g5] 0x04,	%l3
loop_154:
	orncc	%g1,	%l4,	%g5
	udivcc	%o0,	0x05C1,	%i7
	edge8	%g4,	%g7,	%l2
	andn	%l6,	0x1802,	%l5
	fxors	%f31,	%f27,	%f23
	taddcc	%o7,	%i6,	%i5
	addc	%g6,	%i2,	%l1
	fpsub16	%f18,	%f8,	%f12
	udivx	%i4,	0x1871,	%o6
	bg,pn	%icc,	loop_155
	andncc	%o1,	%i1,	%i3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x65] %asi,	%o5
loop_155:
	brgz	%o3,	loop_156
	subc	%i0,	%g3,	%o4
	sllx	%o2,	0x05,	%g2
	edge8l	%l0,	%g1,	%l4
loop_156:
	mulscc	%l3,	%o0,	%i7
	movle	%icc,	%g4,	%g5
	movge	%icc,	%l2,	%g7
	orncc	%l6,	0x0116,	%o7
	fbuge	%fcc2,	loop_157
	subc	%l5,	%i5,	%i6
	sll	%g6,	%l1,	%i2
	xorcc	%o6,	%i4,	%o1
loop_157:
	membar	0x18
	ld	[%l7 + 0x44],	%f26
	fmovda	%xcc,	%f24,	%f7
	fmovscc	%icc,	%f0,	%f21
	move	%xcc,	%i1,	%o5
	andn	%o3,	0x12C1,	%i3
	umul	%g3,	%o4,	%o2
	andcc	%i0,	0x0FF0,	%l0
	brz	%g1,	loop_158
	fcmpeq16	%f24,	%f26,	%g2
	fnot2s	%f2,	%f2
	tsubcc	%l4,	%l3,	%o0
loop_158:
	nop
	set	0x58, %i5
	prefetch	[%l7 + %i5],	 0x2
	edge32	%i7,	%g5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc1,	loop_159
	and	%g7,	0x08B0,	%l6
	sth	%o7,	[%l7 + 0x0A]
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
loop_159:
	alignaddrl	%i5,	%i6,	%g4
	for	%f0,	%f14,	%f2
	add	%g6,	0x1888,	%i2
	fmovsne	%xcc,	%f12,	%f23
	tg	%icc,	0x4
	flush	%l7 + 0x78
	fmovsn	%icc,	%f12,	%f7
	add	%o6,	0x17F1,	%i4
	call	loop_160
	nop
	setx loop_161, %l0, %l1
	jmpl %l1, %o1
	edge32ln	%l1,	%o5,	%o3
	edge32	%i3,	%i1,	%g3
loop_160:
	fmovrdne	%o2,	%f12,	%f28
loop_161:
	tg	%xcc,	0x4
	alignaddr	%o4,	%i0,	%g1
	bvs,a,pn	%xcc,	loop_162
	bl	%xcc,	loop_163
	ble,a,pn	%icc,	loop_164
	edge16	%g2,	%l4,	%l3
loop_162:
	tge	%icc,	0x5
loop_163:
	edge16ln	%l0,	%i7,	%o0
loop_164:
	move	%xcc,	%l2,	%g7
	fbu	%fcc1,	loop_165
	edge16ln	%g5,	%l6,	%o7
	fmovdne	%icc,	%f23,	%f18
	movge	%xcc,	%l5,	%i6
loop_165:
	fmovscc	%xcc,	%f23,	%f14
	movle	%icc,	%i5,	%g4
	fba	%fcc3,	loop_166
	fnot1s	%f30,	%f18
	ldsw	[%l7 + 0x0C],	%i2
	srlx	%o6,	0x01,	%g6
loop_166:
	array16	%o1,	%i4,	%l1
	fmovdg	%icc,	%f31,	%f7
	move	%icc,	%o3,	%i3
	fcmpd	%fcc0,	%f0,	%f26
	sir	0x160E
	nop
	setx	loop_167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x28, %o5
	std	%o4,	[%l7 + %o5]
	sir	0x1BCC
	edge16l	%g3,	%o2,	%o4
loop_167:
	andcc	%i1,	%i0,	%g1
	fmovsn	%xcc,	%f29,	%f19
	swap	[%l7 + 0x08],	%l4
	bne,a,pt	%xcc,	loop_168
	edge8ln	%l3,	%g2,	%i7
	stw	%l0,	[%l7 + 0x28]
	xnor	%l2,	%o0,	%g5
loop_168:
	bleu	%icc,	loop_169
	mulx	%l6,	0x1F88,	%g7
	tcs	%xcc,	0x2
	movpos	%xcc,	%l5,	%o7
loop_169:
	fcmpeq16	%f16,	%f6,	%i6
	xorcc	%i5,	0x142A,	%i2
	tg	%icc,	0x4
	tleu	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g4,	0x1636,	%o6
	sdivx	%g6,	0x1150,	%i4
	alignaddrl	%o1,	%o3,	%i3
	fba	%fcc3,	loop_170
	tl	%xcc,	0x1
	set	0x20, %g4
	lda	[%l7 + %g4] 0x14,	%f0
loop_170:
	fmovdvs	%xcc,	%f11,	%f8
	tsubcc	%o5,	0x0CCC,	%l1
	set	0x56, %g2
	stba	%g3,	[%l7 + %g2] 0x2a
	membar	#Sync
	fornot1	%f30,	%f12,	%f6
	udiv	%o2,	0x154F,	%i1
	ldx	[%l7 + 0x08],	%o4
	ble,a,pn	%icc,	loop_171
	be,pt	%xcc,	loop_172
	movrgez	%g1,	0x32D,	%i0
	movrgz	%l3,	%g2,	%l4
loop_171:
	fmovdle	%icc,	%f11,	%f12
loop_172:
	fmovscs	%icc,	%f16,	%f1
	move	%icc,	%i7,	%l2
	edge8n	%l0,	%o0,	%l6
	sllx	%g7,	%l5,	%o7
	be,pn	%icc,	loop_173
	fmovdle	%xcc,	%f27,	%f6
	ldub	[%l7 + 0x56],	%i6
	set	0x68, %g3
	stxa	%i5,	[%l7 + %g3] 0x18
loop_173:
	fmovrdgez	%g5,	%f26,	%f8
	pdist	%f14,	%f22,	%f20
	fmovdcs	%xcc,	%f9,	%f5
	array32	%i2,	%o6,	%g6
	edge16ln	%g4,	%o1,	%o3
	fmovdne	%xcc,	%f17,	%f13
	movg	%icc,	%i4,	%o5
	fbue,a	%fcc0,	loop_174
	array16	%i3,	%l1,	%o2
	edge32ln	%g3,	%o4,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_174:
	fnor	%f30,	%f20,	%f28
	sllx	%i0,	0x17,	%l3
	smul	%g1,	%g2,	%l4
	fmovsg	%xcc,	%f31,	%f12
	fpsub16	%f2,	%f10,	%f30
	srl	%i7,	0x06,	%l2
	sdivx	%l0,	0x1C67,	%l6
	tvs	%xcc,	0x6
	movneg	%icc,	%g7,	%o0
	tvs	%xcc,	0x3
	addc	%l5,	0x17C3,	%o7
	faligndata	%f28,	%f8,	%f20
	xorcc	%i6,	0x0CEB,	%g5
	movrlz	%i5,	0x319,	%o6
	sethi	0x0641,	%i2
	fnors	%f23,	%f14,	%f2
	tle	%xcc,	0x5
	movn	%icc,	%g4,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%o2,	[%l7 + 0x68]
	movrgz	%i4,	%o5,	%o1
	movre	%i3,	0x178,	%l1
	fmul8ulx16	%f4,	%f26,	%f16
	edge8	%o2,	%o4,	%i1
	fmovsvs	%icc,	%f17,	%f7
	addc	%i0,	%l3,	%g1
	bcs	loop_175
	fblg,a	%fcc1,	loop_176
	nop
	set	0x1A, %o7
	ldsh	[%l7 + %o7],	%g3
	edge32l	%l4,	%i7,	%l2
loop_175:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_176:
	srl	%g2,	%l0,	%g7
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x04,	 0x3
	fandnot1	%f0,	%f20,	%f26
	fbu,a	%fcc2,	loop_177
	fpmerge	%f29,	%f28,	%f8
	alignaddr	%o0,	%l5,	%o7
	fandnot1	%f24,	%f12,	%f30
loop_177:
	bcc	%xcc,	loop_178
	taddcc	%i6,	0x16EA,	%i5
	movpos	%icc,	%o6,	%g5
	bvs,pn	%icc,	loop_179
loop_178:
	umulcc	%i2,	0x17AC,	%g4
	fbn,a	%fcc3,	loop_180
	movrne	%o3,	%g6,	%i4
loop_179:
	fble	%fcc3,	loop_181
	edge16	%o1,	%i3,	%o5
loop_180:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l1
loop_181:
	nop
	set	0x38, %l2
	stda	%o4,	[%l7 + %l2] 0xe3
	membar	#Sync
	subccc	%o2,	%i0,	%i1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	mova	%icc,	%g3,	%g1
	edge8n	%i7,	%l2,	%l4
	srlx	%l0,	%g7,	%l6
	movcs	%xcc,	%g2,	%l5
	sdivcc	%o0,	0x1C6D,	%i6
	tl	%xcc,	0x6
	movl	%icc,	%o7,	%o6
	fornot2	%f26,	%f12,	%f10
	fabsd	%f4,	%f8
	array8	%g5,	%i2,	%i5
	sth	%o3,	[%l7 + 0x6A]
	fnors	%f27,	%f3,	%f7
	udivx	%g4,	0x04A6,	%i4
	fornot2	%f18,	%f0,	%f2
	orncc	%g6,	%o1,	%i3
	fbu	%fcc3,	loop_182
	andn	%o5,	%o4,	%l1
	ldsw	[%l7 + 0x28],	%o2
	fsrc1s	%f20,	%f8
loop_182:
	bg,a,pn	%xcc,	loop_183
	movne	%xcc,	%i1,	%i0
	tleu	%icc,	0x0
	set	0x0A, %o3
	lduba	[%l7 + %o3] 0x81,	%l3
loop_183:
	ldsw	[%l7 + 0x28],	%g3
	ldsw	[%l7 + 0x0C],	%g1
	tvc	%xcc,	0x2
	edge32ln	%i7,	%l4,	%l0
	edge8	%g7,	%l2,	%g2
	tge	%xcc,	0x1
	xnor	%l6,	0x02FE,	%o0
	xorcc	%i6,	0x10E5,	%l5
	wr	%g0,	0x80,	%asi
	stha	%o7,	[%l7 + 0x1A] %asi
	edge32n	%g5,	%o6,	%i2
	and	%i5,	0x0EB4,	%o3
	popc	%g4,	%g6
	tsubcctv	%o1,	0x1FD0,	%i3
	fmovrdne	%o5,	%f26,	%f14
	bne,a,pt	%xcc,	loop_184
	tcc	%icc,	0x1
	sdivx	%o4,	0x12B7,	%l1
	edge16	%o2,	%i4,	%i1
loop_184:
	sdivcc	%i0,	0x08C1,	%g3
	xnorcc	%g1,	%l3,	%i7
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x81,	%l4
	fmovrde	%l0,	%f20,	%f22
	brz,a	%l2,	loop_185
	movpos	%xcc,	%g2,	%g7
	set	0x61, %g6
	ldsba	[%l7 + %g6] 0x88,	%o0
loop_185:
	mulscc	%i6,	%l6,	%l5
	edge16	%o7,	%o6,	%g5
	movge	%xcc,	%i2,	%o3
	fnegs	%f17,	%f17
	std	%f26,	[%l7 + 0x78]
	call	loop_186
	fba	%fcc2,	loop_187
	tge	%icc,	0x2
	ldd	[%l7 + 0x70],	%f10
loop_186:
	umulcc	%i5,	0x12B6,	%g6
loop_187:
	ba	loop_188
	fmovdleu	%icc,	%f8,	%f28
	fmovdgu	%icc,	%f8,	%f27
	add	%o1,	0x0C31,	%i3
loop_188:
	tvc	%xcc,	0x7
	tle	%xcc,	0x5
	tpos	%xcc,	0x0
	sllx	%o5,	%g4,	%o4
	tg	%icc,	0x6
	alignaddr	%o2,	%i4,	%l1
	fmovsa	%xcc,	%f11,	%f22
	tle	%xcc,	0x7
	bneg,pt	%icc,	loop_189
	fands	%f23,	%f26,	%f0
	tg	%xcc,	0x1
	set	0x28, %i3
	stda	%i0,	[%l7 + %i3] 0x81
loop_189:
	udivx	%g3,	0x16B5,	%i1
	swap	[%l7 + 0x7C],	%l3
	edge8	%i7,	%g1,	%l0
	movg	%icc,	%l4,	%g2
	tle	%icc,	0x3
	array32	%g7,	%o0,	%l2
	bpos	%icc,	loop_190
	movl	%xcc,	%l6,	%l5
	movleu	%xcc,	%o7,	%o6
	membar	0x45
loop_190:
	ble	loop_191
	udiv	%i6,	0x0024,	%i2
	fmovsl	%icc,	%f4,	%f26
	sdiv	%o3,	0x192D,	%i5
loop_191:
	srl	%g6,	%o1,	%g5
	nop
	setx	loop_192,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz,a	%i3,	loop_193
	orn	%o5,	0x1827,	%g4
	sub	%o2,	%i4,	%l1
loop_192:
	edge8	%o4,	%i0,	%g3
loop_193:
	fbl	%fcc3,	loop_194
	mulscc	%l3,	%i7,	%g1
	movrgez	%i1,	0x165,	%l0
	movn	%xcc,	%l4,	%g7
loop_194:
	edge16n	%g2,	%o0,	%l2
	orn	%l6,	%l5,	%o7
	stx	%i6,	[%l7 + 0x70]
	movcs	%xcc,	%i2,	%o6
	tneg	%icc,	0x2
	fbge,a	%fcc0,	loop_195
	movl	%xcc,	%o3,	%g6
	edge16ln	%o1,	%g5,	%i3
	fmovsvs	%icc,	%f18,	%f7
loop_195:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x79] %asi,	%o5
	andcc	%g4,	0x18EE,	%o2
	fmovdvs	%icc,	%f3,	%f8
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i4
	fbuge	%fcc0,	loop_196
	tsubcctv	%i5,	%o4,	%i0
	tle	%icc,	0x5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x10,	%g3,	%l1
loop_196:
	tl	%icc,	0x1
	and	%l3,	%i7,	%i1
	fbl	%fcc2,	loop_197
	addcc	%l0,	0x1FB9,	%l4
	movrlez	%g7,	%g1,	%g2
	tgu	%icc,	0x7
loop_197:
	subc	%l2,	%l6,	%o0
	movne	%icc,	%o7,	%i6
	movgu	%icc,	%l5,	%i2
	prefetch	[%l7 + 0x40],	 0x0
	movge	%icc,	%o3,	%o6
	set	0x2B, %o4
	lduba	[%l7 + %o4] 0x81,	%g6
	fbg	%fcc3,	loop_198
	xor	%g5,	%o1,	%i3
	smulcc	%g4,	%o2,	%i4
	tsubcctv	%o5,	%o4,	%i0
loop_198:
	edge8l	%i5,	%g3,	%l3
	mulx	%l1,	%i1,	%l0
	fmovsl	%icc,	%f17,	%f0
	fcmpes	%fcc2,	%f3,	%f3
	movrlez	%i7,	%l4,	%g1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x50] %asi,	%g2
	sdivx	%g7,	0x148F,	%l2
	mova	%xcc,	%o0,	%o7
	andcc	%i6,	%l5,	%i2
	sdivx	%l6,	0x093D,	%o3
	bn,pn	%xcc,	loop_199
	fnot1s	%f1,	%f16
	sllx	%o6,	%g6,	%o1
	fzero	%f16
loop_199:
	andncc	%i3,	%g4,	%g5
	ld	[%l7 + 0x64],	%f11
	subc	%o2,	%o5,	%o4
	movcs	%xcc,	%i0,	%i4
	fmovsge	%xcc,	%f31,	%f29
	fble,a	%fcc3,	loop_200
	movne	%xcc,	%i5,	%l3
	fmovdne	%icc,	%f23,	%f23
	fmovdle	%icc,	%f8,	%f23
loop_200:
	xnor	%g3,	0x02E8,	%l1
	bn,a	%icc,	loop_201
	tl	%icc,	0x5
	edge16n	%i1,	%l0,	%i7
	ta	%icc,	0x7
loop_201:
	fba	%fcc2,	loop_202
	smul	%g1,	%g2,	%l4
	membar	0x6C
	sra	%g7,	%l2,	%o7
loop_202:
	popc	0x1D7C,	%i6
	fmul8x16au	%f23,	%f2,	%f12
	fmovdcs	%icc,	%f20,	%f11
	fmovrdne	%o0,	%f30,	%f6
	addcc	%i2,	0x1537,	%l5
	sdiv	%l6,	0x08A4,	%o6
	sir	0x05F2
	fbule,a	%fcc2,	loop_203
	tpos	%icc,	0x3
	edge16n	%g6,	%o1,	%o3
	tn	%xcc,	0x7
loop_203:
	edge32ln	%i3,	%g5,	%g4
	edge32	%o5,	%o4,	%o2
	set	0x3E, %o2
	stha	%i0,	[%l7 + %o2] 0x10
	lduw	[%l7 + 0x44],	%i5
	array8	%l3,	%i4,	%g3
	movle	%icc,	%i1,	%l1
	bcs,pn	%xcc,	loop_204
	movle	%icc,	%l0,	%g1
	andncc	%g2,	%l4,	%g7
	brlez	%i7,	loop_205
loop_204:
	tl	%xcc,	0x1
	edge32ln	%l2,	%o7,	%i6
	ta	%xcc,	0x1
loop_205:
	edge8	%i2,	%o0,	%l6
	andncc	%l5,	%o6,	%g6
	tvs	%icc,	0x4
	fba	%fcc3,	loop_206
	srlx	%o1,	0x18,	%i3
	fmovrdgez	%o3,	%f28,	%f24
	fbule	%fcc0,	loop_207
loop_206:
	ldd	[%l7 + 0x40],	%g4
	stbar
	array32	%o5,	%o4,	%g4
loop_207:
	array8	%o2,	%i0,	%l3
	fbne	%fcc1,	loop_208
	brnz	%i5,	loop_209
	edge8	%i4,	%g3,	%l1
	umul	%i1,	0x071C,	%g1
loop_208:
	fandnot2	%f10,	%f0,	%f20
loop_209:
	tvs	%icc,	0x7
	ldd	[%l7 + 0x18],	%f6
	edge32l	%l0,	%l4,	%g7
	fmovrsgez	%g2,	%f7,	%f30
	set	0x70, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0x2
	wr	%g0,	0x88,	%asi
	sta	%f20,	[%l7 + 0x2C] %asi
	edge16l	%l2,	%i6,	%i2
	andncc	%o7,	%o0,	%l6
	fmovrse	%l5,	%f27,	%f2
	mulscc	%g6,	%o6,	%o1
	move	%icc,	%o3,	%i3
	fbo,a	%fcc2,	loop_210
	edge16n	%g5,	%o5,	%g4
	udivcc	%o4,	0x11B3,	%o2
	sll	%i0,	%l3,	%i4
loop_210:
	edge8n	%i5,	%l1,	%g3
	lduh	[%l7 + 0x4A],	%g1
	addcc	%i1,	%l4,	%g7
	srl	%g2,	%l0,	%i7
	fmovs	%f15,	%f22
	edge16	%l2,	%i6,	%i2
	srlx	%o0,	%o7,	%l5
	andcc	%g6,	%o6,	%o1
	xor	%l6,	0x18F8,	%o3
	edge16n	%i3,	%o5,	%g5
	udivcc	%g4,	0x138D,	%o2
	and	%i0,	%o4,	%l3
	smulcc	%i5,	%l1,	%i4
	brlz,a	%g3,	loop_211
	umulcc	%g1,	0x00A5,	%l4
	subc	%i1,	0x1ED4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_211:
	movrgz	%l0,	0x1B6,	%i7
	edge8ln	%l2,	%i6,	%i2
	fmovdne	%xcc,	%f3,	%f17
	brlz	%g2,	loop_212
	tpos	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	0x06BD,	%l5
loop_212:
	brgez,a	%g6,	loop_213
	tge	%icc,	0x7
	membar	0x16
	fcmpgt32	%f20,	%f0,	%o0
loop_213:
	srl	%o1,	%l6,	%o6
	fmovsvs	%icc,	%f29,	%f12
	fmovdvs	%icc,	%f7,	%f11
	call	loop_214
	fandnot1s	%f26,	%f27,	%f8
	alignaddr	%o3,	%o5,	%g5
	tsubcctv	%g4,	0x0460,	%i3
loop_214:
	tn	%xcc,	0x5
	popc	0x11B8,	%o2
	nop
	setx	loop_215,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%i0,	%l3,	%i5
	add	%l1,	0x07F7,	%o4
	nop
	setx	loop_216,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_215:
	fbo	%fcc1,	loop_217
	fnands	%f15,	%f23,	%f29
	fmul8x16	%f19,	%f28,	%f2
loop_216:
	movrlz	%g3,	0x3A6,	%g1
loop_217:
	edge16ln	%i4,	%l4,	%i1
	movcc	%icc,	%g7,	%l0
	wr	%g0,	0x80,	%asi
	stba	%l2,	[%l7 + 0x66] %asi
	siam	0x3
	te	%xcc,	0x3
	orcc	%i7,	0x134C,	%i2
	nop
	set	0x74, %o1
	prefetch	[%l7 + %o1],	 0x3
	ble,pt	%xcc,	loop_218
	edge16ln	%i6,	%g2,	%l5
	fpadd16s	%f20,	%f11,	%f27
	smul	%g6,	0x047A,	%o0
loop_218:
	fpsub16	%f26,	%f0,	%f4
	fmovrde	%o1,	%f14,	%f14
	sub	%o7,	%l6,	%o3
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x1e,	%f0
	fexpand	%f7,	%f28
	fands	%f2,	%f28,	%f13
	and	%o6,	0x026D,	%g5
	xor	%o5,	0x0EED,	%g4
	movcc	%icc,	%i3,	%i0
	fxor	%f18,	%f0,	%f10
	udivcc	%o2,	0x1A54,	%l3
	fmovrse	%l1,	%f11,	%f1
	movcc	%xcc,	%i5,	%o4
	tcs	%xcc,	0x6
	mulx	%g1,	%i4,	%l4
	alignaddr	%g3,	%g7,	%l0
	fcmpgt32	%f6,	%f6,	%l2
	set	0x60, %g7
	sta	%f6,	[%l7 + %g7] 0x0c
	fcmpne16	%f6,	%f18,	%i1
	brnz	%i7,	loop_219
	sth	%i2,	[%l7 + 0x0C]
	edge8ln	%i6,	%g2,	%l5
	tvc	%xcc,	0x2
loop_219:
	tcs	%xcc,	0x2
	movl	%icc,	%o0,	%o1
	tge	%xcc,	0x6
	fbul	%fcc1,	loop_220
	movge	%xcc,	%g6,	%o7
	smul	%l6,	0x1FF4,	%o3
	smulcc	%g5,	0x0659,	%o5
loop_220:
	nop
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0x0
	orncc	%i3,	0x01AA,	%i0
	fmovdg	%xcc,	%f23,	%f17
	bge,pn	%icc,	loop_221
	sll	%o2,	0x1D,	%g4
	edge32n	%l3,	%i5,	%o4
	andn	%l1,	0x00B0,	%i4
loop_221:
	tneg	%xcc,	0x5
	fmovdne	%icc,	%f26,	%f22
	popc	%l4,	%g3
	movleu	%icc,	%g1,	%g7
	tcs	%xcc,	0x6
	siam	0x3
	sra	%l0,	%l2,	%i1
	sll	%i7,	0x19,	%i2
	wr	%g0,	0x80,	%asi
	stba	%g2,	[%l7 + 0x4F] %asi
	fone	%f30
	fsrc1	%f26,	%f2
	addccc	%l5,	0x1AFE,	%o0
	orcc	%i6,	%g6,	%o1
	andncc	%l6,	%o7,	%o3
	fmul8ulx16	%f30,	%f20,	%f26
	sir	0x169E
	tge	%xcc,	0x3
	edge32ln	%g5,	%o6,	%o5
	fbe,a	%fcc1,	loop_222
	fnors	%f10,	%f4,	%f31
	movgu	%icc,	%i3,	%o2
	bcc,a,pn	%icc,	loop_223
loop_222:
	movn	%icc,	%g4,	%l3
	set	0x7A, %l0
	ldsha	[%l7 + %l0] 0x19,	%i0
loop_223:
	fands	%f25,	%f12,	%f4
	tneg	%icc,	0x7
	sub	%i5,	%l1,	%o4
	movpos	%xcc,	%l4,	%i4
	movcc	%icc,	%g3,	%g7
	udiv	%g1,	0x11DC,	%l0
	membar	0x3A
	alignaddr	%i1,	%l2,	%i7
	edge8ln	%i2,	%g2,	%l5
	fblg,a	%fcc3,	loop_224
	movpos	%xcc,	%o0,	%i6
	ld	[%l7 + 0x1C],	%f12
	sir	0x1743
loop_224:
	bpos,a,pn	%xcc,	loop_225
	fpackfix	%f12,	%f2
	subccc	%g6,	0x11E3,	%o1
	tl	%xcc,	0x3
loop_225:
	siam	0x5
	fbuge,a	%fcc0,	loop_226
	movrlez	%l6,	0x37A,	%o7
	alignaddrl	%g5,	%o3,	%o6
	fmovsle	%xcc,	%f27,	%f25
loop_226:
	movle	%icc,	%i3,	%o5
	ldstub	[%l7 + 0x11],	%o2
	fpsub16s	%f16,	%f17,	%f16
	fpack16	%f2,	%f10
	tcc	%xcc,	0x4
	edge16n	%l3,	%g4,	%i5
	subcc	%l1,	0x1D85,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x0
	be,pt	%icc,	loop_227
	edge16l	%l4,	%o4,	%g3
	edge16l	%g7,	%i4,	%l0
	set	0x60, %l4
	ldswa	[%l7 + %l4] 0x88,	%i1
loop_227:
	xor	%g1,	%i7,	%i2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x60] %asi,	%l2
	fmovrdlez	%g2,	%f0,	%f2
	edge32	%l5,	%o0,	%i6
	fblg,a	%fcc1,	loop_228
	fmovs	%f16,	%f28
	srlx	%g6,	%l6,	%o1
	ldsb	[%l7 + 0x3A],	%g5
loop_228:
	nop
	set	0x1C, %i7
	lduh	[%l7 + %i7],	%o7
	tle	%icc,	0x1
	bne,a,pn	%icc,	loop_229
	edge32	%o6,	%i3,	%o3
	movrgz	%o5,	%o2,	%g4
	ldsb	[%l7 + 0x5C],	%l3
loop_229:
	udiv	%l1,	0x1FE4,	%i0
	fornot2s	%f29,	%f10,	%f9
	fnot1s	%f22,	%f11
	addcc	%i5,	%l4,	%o4
	edge16l	%g7,	%g3,	%i4
	subccc	%l0,	0x1703,	%g1
	fble,a	%fcc3,	loop_230
	alignaddr	%i1,	%i2,	%i7
	mulscc	%l2,	0x142D,	%l5
	addcc	%o0,	0x1241,	%i6
loop_230:
	tl	%xcc,	0x1
	sir	0x05AA
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g6,	%g2,	%l6
	membar	0x12
	fmuld8sux16	%f23,	%f7,	%f4
	fpackfix	%f10,	%f25
	edge16n	%o1,	%o7,	%g5
	smul	%i3,	0x0BCF,	%o6
	movn	%icc,	%o3,	%o5
	mova	%xcc,	%o2,	%g4
	movne	%xcc,	%l3,	%l1
	bcc,pt	%xcc,	loop_231
	sll	%i5,	%i0,	%o4
	mova	%xcc,	%l4,	%g3
	alignaddrl	%g7,	%i4,	%g1
loop_231:
	tneg	%xcc,	0x7
	array8	%i1,	%i2,	%l0
	movrgez	%i7,	%l5,	%l2
	array32	%o0,	%i6,	%g6
	brz,a	%g2,	loop_232
	nop
	set	0x58, %l1
	std	%i6,	[%l7 + %l1]
	edge8ln	%o7,	%g5,	%i3
	fmovsl	%xcc,	%f11,	%f6
loop_232:
	subcc	%o6,	0x12C2,	%o1
	fsrc1	%f22,	%f22
	movn	%xcc,	%o5,	%o3
	movrgez	%g4,	0x260,	%l3
	fmovdle	%icc,	%f2,	%f5
	bpos,pn	%xcc,	loop_233
	fnegd	%f4,	%f14
	popc	%o2,	%i5
	edge8ln	%i0,	%o4,	%l4
loop_233:
	addccc	%l1,	%g3,	%i4
	move	%icc,	%g7,	%g1
	movgu	%xcc,	%i1,	%l0
	edge8	%i2,	%l5,	%i7
	fmovdvs	%icc,	%f10,	%f6
	sllx	%l2,	%i6,	%o0
	tgu	%xcc,	0x0
	bg,a,pn	%xcc,	loop_234
	move	%icc,	%g6,	%g2
	tsubcctv	%l6,	0x0A79,	%g5
	edge32ln	%i3,	%o6,	%o7
loop_234:
	srax	%o1,	0x05,	%o3
	fbne,a	%fcc3,	loop_235
	movneg	%xcc,	%g4,	%o5
	fmovsl	%icc,	%f2,	%f31
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
loop_235:
	edge8l	%i5,	%l3,	%i0
	ldub	[%l7 + 0x4F],	%l4
	fmovrdne	%o4,	%f16,	%f10
	movcc	%xcc,	%g3,	%i4
	faligndata	%f24,	%f14,	%f28
	sub	%l1,	0x00FD,	%g7
	tge	%icc,	0x2
	movpos	%icc,	%i1,	%l0
	fbul,a	%fcc1,	loop_236
	ba,pn	%icc,	loop_237
	edge16ln	%i2,	%l5,	%g1
	movleu	%xcc,	%i7,	%i6
loop_236:
	movrgez	%l2,	0x08C,	%o0
loop_237:
	nop
	set	0x44, %l6
	lduha	[%l7 + %l6] 0x14,	%g6
	array16	%l6,	%g5,	%g2
	movneg	%xcc,	%i3,	%o7
	lduh	[%l7 + 0x36],	%o1
	fpadd16	%f22,	%f28,	%f22
	tsubcc	%o6,	%o3,	%g4
	tneg	%icc,	0x7
	sll	%o2,	%o5,	%i5
	nop
	set	0x20, %i0
	stw	%l3,	[%l7 + %i0]
	smul	%i0,	%l4,	%o4
	bvs,pn	%xcc,	loop_238
	brlez	%i4,	loop_239
	tne	%icc,	0x2
	flush	%l7 + 0x68
loop_238:
	subcc	%l1,	%g3,	%g7
loop_239:
	mulscc	%l0,	%i2,	%i1
	movcs	%xcc,	%g1,	%l5
	fmovd	%f12,	%f4
	smul	%i6,	0x18C6,	%i7
	tpos	%icc,	0x6
	set	0x60, %l5
	stwa	%l2,	[%l7 + %l5] 0x27
	membar	#Sync
	taddcc	%g6,	%l6,	%g5
	udivx	%g2,	0x11EB,	%o0
	or	%o7,	0x0EE9,	%o1
	and	%o6,	%o3,	%i3
	andncc	%o2,	%o5,	%i5
	set	0x48, %g1
	lduwa	[%l7 + %g1] 0x10,	%g4
	movre	%i0,	%l4,	%l3
	tl	%icc,	0x5
	fors	%f3,	%f28,	%f4
	fmovspos	%icc,	%f24,	%f17
	brgz	%i4,	loop_240
	movvs	%xcc,	%o4,	%g3
	set	0x20, %o0
	stda	%l0,	[%l7 + %o0] 0xe3
	membar	#Sync
loop_240:
	tneg	%icc,	0x3
	edge16ln	%l0,	%i2,	%i1
	tge	%icc,	0x1
	fble,a	%fcc1,	loop_241
	xnor	%g7,	%l5,	%i6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_241:
	movvc	%icc,	%g1,	%i7
	sdivx	%l2,	0x0287,	%g6
	ldub	[%l7 + 0x65],	%g5
	fcmpeq32	%f18,	%f12,	%l6
	array32	%o0,	%g2,	%o1
	bpos,a	%xcc,	loop_242
	ldub	[%l7 + 0x2D],	%o6
	fbu,a	%fcc0,	loop_243
	array16	%o7,	%i3,	%o2
loop_242:
	addccc	%o5,	0x04C8,	%i5
	tvc	%icc,	0x6
loop_243:
	fmovscc	%icc,	%f1,	%f23
	brlz	%o3,	loop_244
	fmovrdlez	%i0,	%f20,	%f22
	fbo	%fcc1,	loop_245
	sethi	0x1CC2,	%l4
loop_244:
	edge16l	%g4,	%l3,	%i4
	membar	0x26
loop_245:
	fmovdleu	%icc,	%f9,	%f16
	bcs,pt	%xcc,	loop_246
	fmovdge	%xcc,	%f10,	%f4
	movrlz	%g3,	0x2A8,	%o4
	fmovsg	%icc,	%f27,	%f30
loop_246:
	bcc,a,pt	%icc,	loop_247
	fmovrde	%l0,	%f26,	%f12
	mulscc	%i2,	0x0196,	%l1
	edge8l	%g7,	%l5,	%i6
loop_247:
	brlz	%i1,	loop_248
	fzeros	%f23
	andn	%g1,	0x10B3,	%l2
	addcc	%i7,	%g5,	%l6
loop_248:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%g2,	%g6
	alignaddr	%o1,	%o6,	%o7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o2
	alignaddrl	%i3,	%o5,	%i5
	sllx	%o3,	0x1F,	%l4
	orcc	%g4,	%i0,	%l3
	movle	%xcc,	%i4,	%o4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l0
	fmovdcc	%icc,	%f15,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f29,	%f24
	tsubcctv	%i2,	0x0549,	%g7
	fabss	%f8,	%f27
	popc	%l5,	%i6
	set	0x6F, %g5
	ldstuba	[%l7 + %g5] 0x10,	%i1
	wr	%g0,	0xea,	%asi
	stwa	%g1,	[%l7 + 0x48] %asi
	membar	#Sync
	udivx	%l1,	0x03E2,	%i7
	fpsub32	%f6,	%f0,	%f10
	fpsub32	%f8,	%f26,	%f10
	tcc	%icc,	0x6
	bg,a,pt	%xcc,	loop_249
	movrgz	%l2,	%g5,	%o0
	fmovdl	%icc,	%f17,	%f26
	or	%l6,	0x0095,	%g6
loop_249:
	srl	%o1,	%o6,	%o7
	addc	%o2,	0x0E02,	%i3
	movgu	%icc,	%o5,	%i5
	movvc	%icc,	%g2,	%o3
	std	%f8,	[%l7 + 0x60]
	fmovrslz	%l4,	%f2,	%f15
	bvs,a,pn	%icc,	loop_250
	smulcc	%g4,	%l3,	%i4
	fmovsg	%xcc,	%f19,	%f29
	move	%icc,	%o4,	%g3
loop_250:
	fmovdvc	%icc,	%f13,	%f2
	edge8	%l0,	%i2,	%g7
	bcc	loop_251
	taddcctv	%i0,	0x0930,	%l5
	fmuld8sux16	%f2,	%f14,	%f4
	brgez	%i6,	loop_252
loop_251:
	movgu	%icc,	%g1,	%l1
	fxnor	%f14,	%f30,	%f4
	movle	%icc,	%i7,	%l2
loop_252:
	stw	%i1,	[%l7 + 0x18]
	fmovrslez	%g5,	%f22,	%f10
	fbug	%fcc1,	loop_253
	membar	0x33
	andncc	%l6,	%g6,	%o1
	sub	%o6,	%o7,	%o0
loop_253:
	fxors	%f6,	%f11,	%f10
	array16	%o2,	%o5,	%i3
	edge8l	%g2,	%i5,	%o3
	fmuld8sux16	%f13,	%f29,	%f22
	tn	%icc,	0x0
	tsubcctv	%l4,	0x1A2E,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f20,	%f18,	%f27
	addccc	%i4,	%o4,	%g4
	ta	%xcc,	0x7
	tsubcc	%g3,	0x09BD,	%i2
	taddcctv	%g7,	%i0,	%l5
	fbn,a	%fcc2,	loop_254
	orn	%l0,	%g1,	%i6
	array16	%i7,	%l1,	%i1
	movl	%xcc,	%l2,	%l6
loop_254:
	subcc	%g6,	0x19D2,	%g5
	sllx	%o1,	0x06,	%o7
	fbuge	%fcc1,	loop_255
	fmovsne	%icc,	%f4,	%f22
	fmovdg	%icc,	%f22,	%f20
	mulx	%o0,	%o6,	%o5
loop_255:
	nop
	wr	%g0,	0x2f,	%asi
	stxa	%i3,	[%l7 + 0x60] %asi
	membar	#Sync
	movl	%icc,	%g2,	%o2
	udiv	%i5,	0x0378,	%l4
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fcmpeq32	%f28,	%f18,	%o3
	edge16	%i4,	%o4,	%g4
	subc	%l3,	%i2,	%g7
	tle	%icc,	0x5
	fmovdpos	%xcc,	%f5,	%f9
	bvs,a,pt	%icc,	loop_256
	xor	%g3,	%i0,	%l0
	srax	%g1,	%i6,	%i7
	popc	%l5,	%i1
loop_256:
	nop
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x04,	%f16
	edge16l	%l1,	%l6,	%l2
	array32	%g5,	%g6,	%o1
	fbne,a	%fcc2,	loop_257
	fbo	%fcc1,	loop_258
	umulcc	%o0,	0x057C,	%o7
	fandnot2	%f0,	%f28,	%f28
loop_257:
	xor	%o6,	%o5,	%g2
loop_258:
	orn	%o2,	%i3,	%i5
	edge32n	%l4,	%i4,	%o3
	movpos	%icc,	%g4,	%o4
	ldd	[%l7 + 0x40],	%i2
	sll	%g7,	%l3,	%g3
	subc	%i0,	%g1,	%i6
	udiv	%i7,	0x13D7,	%l0
	brgez	%i1,	loop_259
	movcc	%icc,	%l5,	%l6
	fmovsvc	%xcc,	%f1,	%f29
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%l2
loop_259:
	membar	0x48
	alignaddr	%g5,	%l1,	%g6
	smulcc	%o0,	%o1,	%o7
	andcc	%o6,	0x0538,	%g2
	smul	%o5,	0x1406,	%o2
	bn,pt	%icc,	loop_260
	orcc	%i3,	0x1E36,	%i5
	swap	[%l7 + 0x30],	%l4
	addc	%o3,	0x1B9B,	%g4
loop_260:
	edge8n	%i4,	%o4,	%i2
	edge32n	%g7,	%l3,	%g3
	sll	%i0,	0x1B,	%g1
	sdivx	%i7,	0x0A16,	%l0
	add	%i1,	%l5,	%l6
	fnand	%f22,	%f26,	%f12
	for	%f14,	%f28,	%f20
	fmovsge	%xcc,	%f19,	%f25
	movvc	%icc,	%l2,	%i6
	movne	%xcc,	%l1,	%g6
	movrlz	%g5,	%o1,	%o7
	tgu	%xcc,	0x0
	fcmple32	%f4,	%f22,	%o0
	fxnor	%f18,	%f6,	%f20
	ldsw	[%l7 + 0x5C],	%g2
	movvc	%icc,	%o6,	%o5
	fble,a	%fcc0,	loop_261
	ble	%icc,	loop_262
	movvs	%icc,	%o2,	%i3
	xnor	%i5,	%o3,	%g4
loop_261:
	smul	%l4,	%o4,	%i4
loop_262:
	fmul8x16al	%f2,	%f26,	%f28
	ta	%icc,	0x4
	edge8	%i2,	%g7,	%g3
	fpadd32s	%f21,	%f27,	%f14
	movvc	%icc,	%l3,	%i0
	fornot2s	%f15,	%f2,	%f27
	tleu	%icc,	0x4
	fmuld8sux16	%f0,	%f24,	%f26
	set	0x60, %g4
	sta	%f9,	[%l7 + %g4] 0x14
	edge32	%g1,	%l0,	%i7
	bne,a	%icc,	loop_263
	fzeros	%f16
	fblg	%fcc0,	loop_264
	fpadd32s	%f23,	%f16,	%f31
loop_263:
	bg,a	%icc,	loop_265
	movrlez	%l5,	%i1,	%l6
loop_264:
	edge8ln	%i6,	%l1,	%g6
	tge	%xcc,	0x1
loop_265:
	fands	%f14,	%f23,	%f26
	bvs	%xcc,	loop_266
	fbule	%fcc3,	loop_267
	fbu,a	%fcc3,	loop_268
	edge32l	%g5,	%o1,	%l2
loop_266:
	andcc	%o0,	%o7,	%g2
loop_267:
	xnor	%o5,	0x0729,	%o2
loop_268:
	edge16	%i3,	%i5,	%o3
	fmovde	%icc,	%f11,	%f26
	fbule,a	%fcc3,	loop_269
	fmovrde	%g4,	%f6,	%f20
	alignaddrl	%o6,	%l4,	%i4
	umul	%o4,	0x0A78,	%i2
loop_269:
	bg,a	loop_270
	fabsd	%f14,	%f30
	sdivx	%g3,	0x028E,	%g7
	brlez,a	%l3,	loop_271
loop_270:
	fmovsne	%icc,	%f31,	%f7
	movrgz	%g1,	%i0,	%l0
	fmuld8sux16	%f17,	%f3,	%f2
loop_271:
	nop
	set	0x2C, %g2
	ldsha	[%l7 + %g2] 0x0c,	%i7
	fnot1	%f28,	%f30
	movrne	%i1,	%l5,	%i6
	te	%xcc,	0x6
	popc	%l1,	%g6
	bvc,a	%xcc,	loop_272
	andn	%l6,	0x09FC,	%o1
	sra	%g5,	0x15,	%l2
	movrne	%o7,	%g2,	%o5
loop_272:
	fpmerge	%f30,	%f28,	%f16
	movvc	%xcc,	%o0,	%o2
	xnor	%i5,	0x189A,	%o3
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x47] %asi,	%g4
	movne	%xcc,	%o6,	%l4
	orcc	%i4,	%i3,	%i2
	tsubcctv	%o4,	0x1590,	%g7
	set	0x38, %g3
	stwa	%l3,	[%l7 + %g3] 0x15
	movvc	%xcc,	%g1,	%g3
	movrlz	%i0,	0x1EA,	%i7
	fpack32	%f0,	%f20,	%f18
	brgz	%i1,	loop_273
	andncc	%l5,	%i6,	%l1
	taddcctv	%l0,	%l6,	%o1
	subc	%g5,	%l2,	%g6
loop_273:
	fpadd32s	%f15,	%f26,	%f30
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o7
	fbug,a	%fcc1,	loop_274
	fmovscs	%icc,	%f25,	%f30
	fsrc2	%f24,	%f6
	fmovdcc	%xcc,	%f23,	%f7
loop_274:
	fmovd	%f28,	%f8
	movre	%o5,	0x3B2,	%g2
	fbule	%fcc2,	loop_275
	array16	%o0,	%i5,	%o3
	fcmpgt16	%f30,	%f12,	%g4
	brlez,a	%o2,	loop_276
loop_275:
	movre	%l4,	%i4,	%o6
	nop
	setx loop_277, %l0, %l1
	jmpl %l1, %i3
	fornot2s	%f10,	%f20,	%f23
loop_276:
	tleu	%icc,	0x5
	smulcc	%i2,	0x05E6,	%g7
loop_277:
	edge16n	%o4,	%g1,	%l3
	umul	%i0,	%i7,	%i1
	edge8	%g3,	%l5,	%l1
	edge8ln	%l0,	%i6,	%o1
	flush	%l7 + 0x48
	orcc	%l6,	%g5,	%g6
	udivcc	%l2,	0x051C,	%o7
	fands	%f19,	%f21,	%f25
	sethi	0x1DBA,	%o5
	srax	%g2,	0x03,	%o0
	udivx	%o3,	0x09CC,	%g4
	and	%o2,	%l4,	%i4
	std	%f4,	[%l7 + 0x48]
	fmovdn	%xcc,	%f16,	%f17
	array32	%o6,	%i5,	%i3
	movre	%i2,	0x3EE,	%o4
	xor	%g7,	0x0D9C,	%l3
	fmovrdgz	%i0,	%f12,	%f10
	fsrc2	%f18,	%f30
	xorcc	%i7,	0x0D97,	%g1
	tvs	%icc,	0x5
	xnor	%i1,	0x0A5F,	%l5
	edge32	%g3,	%l0,	%i6
	subccc	%l1,	%l6,	%g5
	mulscc	%o1,	%g6,	%o7
	srax	%l2,	0x11,	%g2
	alignaddrl	%o5,	%o0,	%g4
	alignaddrl	%o2,	%l4,	%i4
	udivx	%o6,	0x07C2,	%o3
	orn	%i3,	0x1B66,	%i5
	edge16n	%o4,	%i2,	%g7
	fmovrslz	%l3,	%f31,	%f10
	udivcc	%i0,	0x0AFA,	%g1
	sllx	%i7,	0x04,	%i1
	fmovs	%f17,	%f10
	tvs	%icc,	0x5
	and	%g3,	%l5,	%l0
	fmovsn	%icc,	%f11,	%f19
	fmovrde	%l1,	%f10,	%f20
	fba,a	%fcc1,	loop_278
	srax	%i6,	%g5,	%l6
	fbe,a	%fcc2,	loop_279
	fabss	%f23,	%f16
loop_278:
	sra	%g6,	0x10,	%o1
	udivx	%o7,	0x1520,	%l2
loop_279:
	ldub	[%l7 + 0x3D],	%o5
	movl	%icc,	%o0,	%g2
	tle	%xcc,	0x5
	sethi	0x0A5B,	%g4
	sethi	0x108C,	%l4
	addccc	%o2,	0x12D7,	%i4
	movrne	%o6,	0x034,	%i3
	orn	%o3,	0x0D15,	%o4
	fcmpgt16	%f26,	%f24,	%i2
	edge32n	%i5,	%g7,	%i0
	movvs	%xcc,	%l3,	%g1
	ldd	[%l7 + 0x08],	%f0
	fmul8ulx16	%f16,	%f28,	%f14
	nop
	setx	loop_280,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x58],	%i1
	edge32	%i7,	%g3,	%l0
	ta	%xcc,	0x5
loop_280:
	popc	0x06C5,	%l5
	tgu	%icc,	0x7
	smulcc	%i6,	%l1,	%g5
	edge32n	%l6,	%g6,	%o7
	movle	%icc,	%o1,	%l2
	movl	%icc,	%o5,	%o0
	mulx	%g4,	%l4,	%g2
	swap	[%l7 + 0x58],	%o2
	addc	%o6,	%i4,	%o3
	fcmpd	%fcc3,	%f20,	%f6
	sir	0x1C12
	smulcc	%o4,	%i3,	%i2
	movvc	%icc,	%i5,	%i0
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x74] %asi,	%l3
	fmovsleu	%xcc,	%f5,	%f12
	bvc	loop_281
	edge8ln	%g1,	%i1,	%g7
	wr	%g0,	0x10,	%asi
	sta	%f13,	[%l7 + 0x68] %asi
loop_281:
	fmovdle	%xcc,	%f7,	%f9
	tcs	%icc,	0x5
	fandnot1s	%f27,	%f13,	%f28
	stbar
	array16	%g3,	%l0,	%l5
	andn	%i6,	0x1392,	%i7
	move	%xcc,	%g5,	%l1
	ldsh	[%l7 + 0x24],	%l6
	add	%o7,	%o1,	%g6
	lduh	[%l7 + 0x36],	%o5
	bg,pn	%xcc,	loop_282
	movrlez	%o0,	0x386,	%l2
	movne	%icc,	%l4,	%g2
	lduh	[%l7 + 0x2A],	%g4
loop_282:
	fmul8x16al	%f5,	%f16,	%f8
	nop
	setx	loop_283,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%icc,	0x4
	tle	%icc,	0x1
	addccc	%o2,	0x0578,	%o6
loop_283:
	movle	%xcc,	%i4,	%o3
	udivx	%o4,	0x00E8,	%i3
	srl	%i2,	0x00,	%i5
	fpsub16s	%f30,	%f27,	%f27
	nop
	setx	loop_284,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%i0,	0x1696,	%l3
	popc	0x09EC,	%g1
	movle	%icc,	%i1,	%g3
loop_284:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pt	%icc,	loop_285
	alignaddrl	%g7,	%l0,	%l5
	edge32n	%i7,	%g5,	%i6
	add	%l1,	0x11EF,	%o7
loop_285:
	fbule	%fcc1,	loop_286
	fmuld8ulx16	%f13,	%f15,	%f12
	array16	%l6,	%o1,	%o5
	fcmpeq16	%f24,	%f0,	%g6
loop_286:
	ba,a,pn	%icc,	loop_287
	taddcctv	%l2,	%o0,	%l4
	sir	0x0C0E
	faligndata	%f4,	%f16,	%f4
loop_287:
	xorcc	%g4,	0x14B3,	%o2
	taddcc	%g2,	%i4,	%o6
	sllx	%o4,	0x03,	%i3
	fmovsneg	%icc,	%f12,	%f13
	fbl,a	%fcc0,	loop_288
	membar	0x50
	bl	%xcc,	loop_289
	tne	%icc,	0x4
loop_288:
	std	%f10,	[%l7 + 0x20]
	fcmple32	%f12,	%f22,	%o3
loop_289:
	movle	%xcc,	%i5,	%i2
	sdivx	%l3,	0x0C2C,	%i0
	tpos	%icc,	0x3
	fzeros	%f16
	edge8ln	%g1,	%g3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l0,	%l5
	orn	%g7,	%i7,	%i6
	movcs	%xcc,	%g5,	%l1
	fmovrdne	%o7,	%f0,	%f18
	fxnor	%f6,	%f20,	%f26
	sethi	0x000B,	%l6
	movn	%xcc,	%o1,	%o5
	orn	%l2,	%g6,	%o0
	movne	%xcc,	%l4,	%g4
	brz	%g2,	loop_290
	andcc	%o2,	%o6,	%o4
	fmovrslez	%i4,	%f18,	%f14
	bn,pt	%icc,	loop_291
loop_290:
	movg	%icc,	%o3,	%i3
	edge16	%i5,	%i2,	%i0
	membar	0x1A
loop_291:
	udiv	%l3,	0x007F,	%g1
	tge	%xcc,	0x4
	orcc	%g3,	0x08B8,	%i1
	xor	%l5,	%l0,	%g7
	fbu,a	%fcc1,	loop_292
	ldsw	[%l7 + 0x24],	%i6
	fbu	%fcc1,	loop_293
	fcmped	%fcc2,	%f8,	%f28
loop_292:
	xnor	%g5,	%l1,	%i7
	movg	%xcc,	%l6,	%o1
loop_293:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2D] %asi,	%o5
	nop
	setx	loop_294,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack16	%f4,	%f20
	wr	%g0,	0x2b,	%asi
	stha	%o7,	[%l7 + 0x70] %asi
	membar	#Sync
loop_294:
	xorcc	%g6,	0x065B,	%o0
	te	%icc,	0x0
	srl	%l2,	%g4,	%g2
	set	0x2C, %l3
	stwa	%o2,	[%l7 + %l3] 0xea
	membar	#Sync
	movrne	%l4,	0x1EC,	%o6
	movrgez	%o4,	%i4,	%i3
	movre	%i5,	0x19D,	%o3
	movneg	%xcc,	%i2,	%l3
	set	0x3C, %o6
	stwa	%g1,	[%l7 + %o6] 0x2a
	membar	#Sync
	taddcctv	%i0,	0x0416,	%g3
	edge8ln	%i1,	%l0,	%l5
	fbge,a	%fcc1,	loop_295
	movl	%icc,	%i6,	%g5
	fmul8x16al	%f26,	%f7,	%f22
	tne	%icc,	0x4
loop_295:
	tge	%xcc,	0x3
	fbe	%fcc1,	loop_296
	subccc	%g7,	%l1,	%i7
	tle	%xcc,	0x2
	ldd	[%l7 + 0x50],	%f24
loop_296:
	ldub	[%l7 + 0x7A],	%l6
	fba	%fcc2,	loop_297
	fmovrdlez	%o1,	%f0,	%f28
	smulcc	%o7,	%g6,	%o5
	movvc	%xcc,	%o0,	%g4
loop_297:
	brz	%g2,	loop_298
	tl	%xcc,	0x5
	fbne,a	%fcc0,	loop_299
	tg	%icc,	0x7
loop_298:
	srax	%l2,	%o2,	%l4
	alignaddrl	%o4,	%o6,	%i3
loop_299:
	andncc	%i4,	%o3,	%i2
	tsubcc	%i5,	0x0ECE,	%l3
	movvs	%xcc,	%i0,	%g3
	movgu	%xcc,	%i1,	%l0
	srax	%l5,	0x1F,	%i6
	movcc	%xcc,	%g1,	%g7
	fmovdle	%icc,	%f12,	%f7
	edge32	%g5,	%i7,	%l1
	xnor	%l6,	%o1,	%g6
	movvc	%xcc,	%o7,	%o5
	alignaddrl	%o0,	%g4,	%g2
	sllx	%o2,	0x15,	%l4
	set	0x30, %o7
	stwa	%o4,	[%l7 + %o7] 0x2f
	membar	#Sync
	sdivcc	%o6,	0x0033,	%i3
	movcs	%xcc,	%l2,	%i4
	bvs,a	%icc,	loop_300
	edge8l	%o3,	%i2,	%l3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i5
loop_300:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i0
	edge32n	%g3,	%l0,	%l5
	tn	%icc,	0x5
	movge	%xcc,	%i1,	%i6
	fmovsg	%xcc,	%f10,	%f12
	sth	%g7,	[%l7 + 0x66]
	set	0x78, %o3
	swapa	[%l7 + %o3] 0x80,	%g5
	movle	%icc,	%i7,	%l1
	tle	%xcc,	0x0
	fnot2	%f4,	%f18
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x38] %asi,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x2
	movne	%icc,	%o1,	%g6
	fornot1s	%f15,	%f2,	%f17
	fmovrslz	%g1,	%f18,	%f27
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o5
	edge8l	%o7,	%o0,	%g4
	brlz,a	%g2,	loop_301
	umulcc	%l4,	%o2,	%o4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o6
loop_301:
	nop
	setx loop_302, %l0, %l1
	jmpl %l1, %l2
	addcc	%i3,	0x0F37,	%o3
	movcs	%icc,	%i2,	%i4
	prefetch	[%l7 + 0x54],	 0x2
loop_302:
	fpsub32s	%f29,	%f3,	%f0
	bcc	loop_303
	tcs	%xcc,	0x2
	xnor	%i5,	0x19F2,	%l3
	fandnot2s	%f2,	%f3,	%f25
loop_303:
	array8	%g3,	%l0,	%l5
	brz	%i0,	loop_304
	fmovrsne	%i1,	%f26,	%f10
	movgu	%xcc,	%g7,	%g5
	srax	%i7,	%i6,	%l1
loop_304:
	nop
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f0
	fxnors	%f9,	%f29,	%f30
	mulscc	%l6,	%g6,	%o1
	bleu,pt	%icc,	loop_305
	fbuge,a	%fcc1,	loop_306
	addc	%o5,	0x0F37,	%o7
	fbue	%fcc2,	loop_307
loop_305:
	mova	%xcc,	%g1,	%o0
loop_306:
	brz	%g2,	loop_308
	movn	%xcc,	%g4,	%o2
loop_307:
	edge32	%o4,	%l4,	%l2
	movpos	%xcc,	%i3,	%o6
loop_308:
	fmovsneg	%xcc,	%f15,	%f7
	fbuge	%fcc0,	loop_309
	addccc	%o3,	%i2,	%i4
	movrlz	%l3,	0x308,	%i5
	movre	%l0,	0x1A6,	%l5
loop_309:
	orncc	%i0,	0x0BA3,	%g3
	ldsh	[%l7 + 0x1A],	%g7
	movpos	%xcc,	%i1,	%i7
	addccc	%g5,	0x1C6B,	%i6
	fbge,a	%fcc2,	loop_310
	edge8n	%l1,	%l6,	%g6
	move	%xcc,	%o1,	%o7
	tcc	%xcc,	0x3
loop_310:
	fpack32	%f14,	%f6,	%f16
	xnorcc	%o5,	0x1114,	%g1
	tgu	%icc,	0x0
	fblg,a	%fcc0,	loop_311
	fones	%f9
	movn	%xcc,	%o0,	%g2
	fblg,a	%fcc3,	loop_312
loop_311:
	edge16ln	%o2,	%g4,	%l4
	subccc	%o4,	0x0F10,	%i3
	fmovdg	%xcc,	%f3,	%f23
loop_312:
	smul	%l2,	0x056D,	%o6
	fmul8x16au	%f1,	%f6,	%f20
	movl	%icc,	%i2,	%i4
	fmovrdlz	%l3,	%f10,	%f24
	fpadd32	%f10,	%f0,	%f0
	edge16l	%o3,	%l0,	%i5
	subccc	%i0,	0x070F,	%l5
	movrlz	%g3,	0x279,	%g7
	fmovdvc	%icc,	%f2,	%f7
	movvs	%icc,	%i1,	%g5
	st	%f17,	[%l7 + 0x30]
	bne,a,pn	%xcc,	loop_313
	fmovdg	%icc,	%f27,	%f23
	udiv	%i6,	0x109B,	%i7
	bg,a	%xcc,	loop_314
loop_313:
	ld	[%l7 + 0x44],	%f18
	tleu	%xcc,	0x6
	brgz,a	%l6,	loop_315
loop_314:
	bcc,pt	%xcc,	loop_316
	orncc	%l1,	0x1CD1,	%g6
	fxor	%f16,	%f28,	%f26
loop_315:
	fmovsne	%xcc,	%f19,	%f29
loop_316:
	movl	%icc,	%o1,	%o5
	orncc	%g1,	0x0428,	%o7
	andn	%g2,	%o0,	%g4
	bvs	%xcc,	loop_317
	mulx	%o2,	0x0E45,	%o4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x0c
loop_317:
	sir	0x1730
	array16	%i3,	%l4,	%l2
	movn	%xcc,	%o6,	%i2
	stbar
	bgu,pt	%icc,	loop_318
	xnor	%l3,	0x1B28,	%i4
	addc	%l0,	0x04BE,	%i5
	nop
	setx loop_319, %l0, %l1
	jmpl %l1, %o3
loop_318:
	edge16n	%i0,	%l5,	%g3
	smul	%i1,	0x12C4,	%g5
	tneg	%icc,	0x1
loop_319:
	tvc	%icc,	0x4
	fcmpd	%fcc2,	%f0,	%f10
	stb	%i6,	[%l7 + 0x3A]
	bneg,a,pn	%icc,	loop_320
	movrlz	%g7,	0x09C,	%i7
	bvc,pn	%icc,	loop_321
	ldsh	[%l7 + 0x2A],	%l6
loop_320:
	ldsh	[%l7 + 0x0A],	%g6
	fbn,a	%fcc1,	loop_322
loop_321:
	ldx	[%l7 + 0x28],	%l1
	fxor	%f2,	%f20,	%f28
	fnot2	%f20,	%f24
loop_322:
	andcc	%o5,	%o1,	%g1
	tneg	%xcc,	0x5
	fbne	%fcc2,	loop_323
	fbn,a	%fcc3,	loop_324
	movpos	%xcc,	%o7,	%o0
	tcc	%xcc,	0x5
loop_323:
	tn	%xcc,	0x6
loop_324:
	fmovscc	%icc,	%f13,	%f19
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%g2
	bn,a	loop_325
	array8	%g4,	%o2,	%i3
	movvs	%xcc,	%l4,	%l2
	bne,a,pn	%icc,	loop_326
loop_325:
	edge16	%o4,	%i2,	%o6
	set	0x55, %g6
	lduba	[%l7 + %g6] 0x89,	%l3
loop_326:
	tpos	%icc,	0x5
	movrgez	%l0,	0x379,	%i5
	bg,a,pn	%icc,	loop_327
	pdist	%f18,	%f16,	%f18
	fpackfix	%f30,	%f19
	fandnot1	%f0,	%f12,	%f22
loop_327:
	tneg	%icc,	0x6
	fbue,a	%fcc0,	loop_328
	ldub	[%l7 + 0x59],	%i4
	sra	%o3,	%l5,	%i0
	flush	%l7 + 0x3C
loop_328:
	fones	%f20
	membar	0x61
	movn	%xcc,	%i1,	%g5
	array32	%g3,	%g7,	%i7
	fmovscs	%xcc,	%f9,	%f30
	membar	0x2F
	edge32n	%i6,	%g6,	%l6
	tle	%xcc,	0x7
	movrgez	%o5,	%l1,	%g1
	bge	loop_329
	bleu,pn	%xcc,	loop_330
	taddcc	%o7,	0x0A88,	%o0
	fbue,a	%fcc1,	loop_331
loop_329:
	fbl,a	%fcc1,	loop_332
loop_330:
	fmovdne	%icc,	%f16,	%f24
	tn	%xcc,	0x4
loop_331:
	tvs	%icc,	0x1
loop_332:
	edge32n	%o1,	%g2,	%g4
	tne	%xcc,	0x0
	brz,a	%i3,	loop_333
	fcmple16	%f4,	%f28,	%l4
	xorcc	%o2,	%o4,	%l2
	tne	%xcc,	0x6
loop_333:
	taddcc	%i2,	0x1ACA,	%l3
	fmovdl	%xcc,	%f21,	%f15
	tvs	%icc,	0x5
	fmovdleu	%xcc,	%f28,	%f20
	sub	%o6,	0x0DAA,	%l0
	array16	%i5,	%i4,	%o3
	fcmped	%fcc0,	%f22,	%f26
	edge32n	%i0,	%l5,	%g5
	srl	%g3,	0x01,	%g7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x22] %asi,	%i7
	tne	%xcc,	0x0
	tge	%icc,	0x2
	fmovdleu	%icc,	%f8,	%f19
	tneg	%icc,	0x1
	fnot1	%f16,	%f10
	edge32l	%i6,	%g6,	%i1
	fmovrdgez	%o5,	%f24,	%f8
	fbo	%fcc3,	loop_334
	tle	%xcc,	0x5
	fmovdl	%xcc,	%f29,	%f1
	fone	%f4
loop_334:
	xnorcc	%l1,	%g1,	%o7
	fsrc2	%f14,	%f6
	fbule,a	%fcc3,	loop_335
	subcc	%l6,	%o1,	%g2
	xorcc	%o0,	%g4,	%l4
	fsrc2s	%f10,	%f1
loop_335:
	tgu	%xcc,	0x4
	edge16	%i3,	%o2,	%l2
	srax	%i2,	%l3,	%o4
	fpadd32s	%f26,	%f11,	%f5
	alignaddrl	%o6,	%l0,	%i5
	srax	%i4,	0x17,	%o3
	sdivcc	%l5,	0x122C,	%g5
	subccc	%g3,	%g7,	%i0
	movle	%icc,	%i6,	%g6
	lduh	[%l7 + 0x50],	%i1
	sth	%i7,	[%l7 + 0x4E]
	set	0x40, %o4
	lduwa	[%l7 + %o4] 0x11,	%o5
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%g0
	edge16n	%o7,	%l6,	%l1
	movrgez	%g2,	%o1,	%g4
	movrlz	%l4,	0x2F9,	%o0
	tvs	%icc,	0x4
	mova	%icc,	%o2,	%i3
	movg	%xcc,	%l2,	%l3
	nop
	set	0x47, %i6
	stb	%o4,	[%l7 + %i6]
	xor	%i2,	0x1334,	%l0
	sethi	0x1DD5,	%o6
	fmovsge	%xcc,	%f30,	%f11
	movpos	%icc,	%i5,	%i4
	sllx	%o3,	%g5,	%g3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	addcc	%i0,	0x1354,	%i6
	stw	%l5,	[%l7 + 0x38]
	fabss	%f17,	%f6
	movrne	%g6,	%i7,	%o5
	fbg	%fcc3,	loop_336
	alignaddrl	%i1,	%g1,	%l6
	edge8n	%o7,	%g2,	%o1
	swap	[%l7 + 0x50],	%g4
loop_336:
	udivcc	%l4,	0x09AA,	%o0
	fbne	%fcc3,	loop_337
	movrne	%l1,	0x30F,	%o2
	bcs	loop_338
	addc	%l2,	%l3,	%i3
loop_337:
	fmovrdlez	%o4,	%f4,	%f24
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
loop_338:
	nop
	wr	%g0,	0x2b,	%asi
	stwa	%i2,	[%l7 + 0x08] %asi
	membar	#Sync
	edge32n	%i5,	%i4,	%o6
	subc	%o3,	0x1BE6,	%g3
	movcs	%xcc,	%g5,	%i0
	fbule,a	%fcc2,	loop_339
	bvs	%icc,	loop_340
	addc	%i6,	%l5,	%g7
	set	0x08, %o1
	ldsha	[%l7 + %o1] 0x81,	%i7
loop_339:
	xorcc	%g6,	%i1,	%o5
loop_340:
	edge16	%g1,	%o7,	%l6
	alignaddr	%g2,	%o1,	%l4
	fmovse	%xcc,	%f14,	%f17
	fmovdgu	%icc,	%f14,	%f29
	edge8	%o0,	%g4,	%l1
	udiv	%o2,	0x1E8B,	%l3
	movrlez	%i3,	0x1F3,	%o4
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x23,	%l2
	sir	0x0B29
	taddcc	%l0,	0x077F,	%i5
	umulcc	%i2,	0x0DA5,	%o6
	edge8	%i4,	%o3,	%g5
	movvs	%icc,	%g3,	%i6
	orn	%l5,	%i0,	%g7
	nop
	setx	loop_341,	%l0,	%l1
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
	tsubcc	%g6,	%i1,	%o5
	fsrc2	%f8,	%f28
loop_341:
	bgu	%xcc,	loop_342
	edge16l	%i7,	%g1,	%l6
	bvs,a	loop_343
	edge32	%o7,	%o1,	%l4
loop_342:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g2,	%g4,	%o0
loop_343:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x33] %asi,	%l1
	movcc	%xcc,	%o2,	%i3
	fbn,a	%fcc0,	loop_344
	membar	0x35
	add	%o4,	%l2,	%l3
	popc	0x0BCC,	%i5
loop_344:
	fxor	%f30,	%f8,	%f28
	sth	%i2,	[%l7 + 0x16]
	bvs	%icc,	loop_345
	ta	%xcc,	0x4
	fmovdg	%icc,	%f8,	%f23
	pdist	%f8,	%f20,	%f16
loop_345:
	mulscc	%o6,	0x0270,	%l0
	brz	%o3,	loop_346
	movneg	%xcc,	%g5,	%g3
	tge	%icc,	0x5
	mova	%xcc,	%i6,	%l5
loop_346:
	fmovsl	%icc,	%f20,	%f7
	sllx	%i0,	0x09,	%i4
	taddcctv	%g6,	%i1,	%g7
	sdiv	%o5,	0x1A32,	%i7
	movrlz	%l6,	%o7,	%g1
	edge32n	%l4,	%o1,	%g2
	nop
	setx	loop_347,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x30],	%g4
	fmovrsne	%o0,	%f17,	%f6
	movrgez	%o2,	0x266,	%l1
loop_347:
	edge8ln	%o4,	%i3,	%l2
	stbar
	fsrc2s	%f23,	%f23
	fmul8sux16	%f2,	%f28,	%f16
	bpos,a,pn	%icc,	loop_348
	fmovspos	%icc,	%f0,	%f24
	sir	0x1C25
	mulscc	%i5,	0x116A,	%i2
loop_348:
	nop
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
	bne,a	%icc,	loop_349
	umulcc	%l0,	%o3,	%g5
	edge16n	%o6,	%i6,	%l5
	tg	%icc,	0x6
loop_349:
	fors	%f16,	%f19,	%f4
	fmovsle	%xcc,	%f6,	%f9
	taddcctv	%i0,	%g3,	%g6
	or	%i1,	0x1094,	%g7
	ldsb	[%l7 + 0x26],	%o5
	addc	%i7,	%i4,	%o7
	fmovdg	%icc,	%f23,	%f22
	fmovdpos	%icc,	%f6,	%f11
	subccc	%g1,	%l6,	%l4
	addcc	%o1,	%g4,	%g2
	ldsw	[%l7 + 0x08],	%o0
	set	0x30, %i1
	lduwa	[%l7 + %i1] 0x14,	%o2
	fbu,a	%fcc3,	loop_350
	bneg,a	loop_351
	movrgz	%l1,	0x0FE,	%o4
	lduw	[%l7 + 0x28],	%i3
loop_350:
	movrgz	%l2,	%i2,	%i5
loop_351:
	edge16n	%l0,	%l3,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o6,	%i6,	%l5
	and	%i0,	0x03A3,	%g5
	mulscc	%g3,	%i1,	%g6
	sethi	0x07D6,	%o5
	fmovdneg	%xcc,	%f25,	%f5
	array8	%g7,	%i7,	%o7
	orn	%i4,	%l6,	%l4
	edge8l	%o1,	%g1,	%g2
	movleu	%xcc,	%o0,	%o2
	wr	%g0,	0x2f,	%asi
	stda	%g4,	[%l7 + 0x50] %asi
	membar	#Sync
	sir	0x0E9F
	edge32	%l1,	%i3,	%o4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf8
	membar	#Sync
	sll	%i2,	0x1D,	%i5
	fmovs	%f13,	%f12
	subcc	%l0,	%l2,	%l3
	fsrc2	%f14,	%f4
	fba	%fcc1,	loop_352
	movrgez	%o3,	0x1E5,	%o6
	fmovscs	%icc,	%f6,	%f31
	ldx	[%l7 + 0x18],	%l5
loop_352:
	edge8l	%i6,	%i0,	%g3
	fbu,a	%fcc1,	loop_353
	movcs	%icc,	%g5,	%g6
	fmovrslz	%o5,	%f12,	%f3
	fpsub32	%f18,	%f4,	%f16
loop_353:
	edge8l	%i1,	%g7,	%i7
	movcc	%icc,	%i4,	%o7
	fbu	%fcc3,	loop_354
	edge16	%l4,	%o1,	%g1
	edge32n	%l6,	%o0,	%g2
	movpos	%xcc,	%g4,	%o2
loop_354:
	udivcc	%i3,	0x0F47,	%o4
	siam	0x7
	movneg	%xcc,	%l1,	%i2
	movrlez	%l0,	%l2,	%l3
	ba	%icc,	loop_355
	add	%i5,	0x1087,	%o6
	movleu	%icc,	%l5,	%i6
	fmovdle	%icc,	%f7,	%f16
loop_355:
	movcs	%icc,	%i0,	%o3
	sra	%g3,	0x17,	%g6
	bneg,a	%icc,	loop_356
	xorcc	%o5,	0x10D6,	%g5
	srl	%i1,	0x0B,	%g7
	ta	%xcc,	0x2
loop_356:
	mulscc	%i7,	%i4,	%l4
	fmovdvs	%icc,	%f16,	%f16
	alignaddr	%o1,	%o7,	%g1
	tn	%icc,	0x4
	bge,pn	%icc,	loop_357
	sll	%l6,	0x02,	%o0
	movge	%xcc,	%g4,	%o2
	subccc	%g2,	%i3,	%l1
loop_357:
	tgu	%icc,	0x0
	array16	%o4,	%l0,	%l2
	fmovs	%f9,	%f15
	tcc	%xcc,	0x5
	bl,pn	%icc,	loop_358
	bg,a	loop_359
	fbul	%fcc0,	loop_360
	fmovsne	%icc,	%f18,	%f16
loop_358:
	membar	0x76
loop_359:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x4C] %asi,	%i2
loop_360:
	orncc	%i5,	%l3,	%l5
	movpos	%xcc,	%o6,	%i0
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0x2
	smul	%g3,	%g6,	%o5
	tg	%xcc,	0x7
	ble,a	loop_361
	movleu	%icc,	%o3,	%g5
	tcs	%xcc,	0x5
	bg,a,pt	%icc,	loop_362
loop_361:
	edge8l	%g7,	%i1,	%i7
	tvc	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
loop_362:
	movrne	%l4,	0x33A,	%o1
	srl	%o7,	0x10,	%g1
	movl	%icc,	%l6,	%o0
	stw	%o2,	[%l7 + 0x28]
	fpack32	%f8,	%f28,	%f6
	fmovs	%f21,	%f15
	sra	%g4,	0x02,	%i3
	tsubcctv	%l1,	0x067D,	%o4
	ldsw	[%l7 + 0x58],	%g2
	fornot2	%f12,	%f24,	%f14
	array32	%l2,	%l0,	%i5
	fbe	%fcc3,	loop_363
	bpos,a,pt	%icc,	loop_364
	ta	%xcc,	0x3
	add	%l3,	%l5,	%i2
loop_363:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o6,	%i0
loop_364:
	tleu	%icc,	0x0
	smul	%g3,	%g6,	%i6
	movge	%xcc,	%o3,	%g5
	array32	%g7,	%i1,	%i7
	wr	%g0,	0xe2,	%asi
	stwa	%o5,	[%l7 + 0x0C] %asi
	membar	#Sync
	fbul,a	%fcc1,	loop_365
	edge8l	%l4,	%i4,	%o1
	tvs	%xcc,	0x6
	edge8l	%g1,	%l6,	%o7
loop_365:
	array8	%o0,	%g4,	%o2
	edge8n	%i3,	%l1,	%g2
	subc	%l2,	0x05D0,	%o4
	fmovde	%icc,	%f6,	%f23
	fmovdgu	%xcc,	%f26,	%f30
	flush	%l7 + 0x28
	edge16	%i5,	%l3,	%l0
	ldstub	[%l7 + 0x33],	%i2
	fandnot1	%f4,	%f16,	%f28
	alignaddr	%o6,	%i0,	%g3
	std	%l4,	[%l7 + 0x78]
	subcc	%g6,	%i6,	%g5
	fmovrsgez	%o3,	%f2,	%f0
	bge,a,pn	%xcc,	loop_366
	fmovdne	%xcc,	%f16,	%f16
	fbn,a	%fcc2,	loop_367
	array8	%g7,	%i1,	%o5
loop_366:
	tne	%icc,	0x6
	edge8	%i7,	%l4,	%i4
loop_367:
	tgu	%xcc,	0x2
	subccc	%g1,	0x1283,	%o1
	popc	%l6,	%o7
	fands	%f23,	%f16,	%f24
	fcmpeq32	%f8,	%f10,	%o0
	sra	%o2,	%g4,	%l1
	bcs,a	%icc,	loop_368
	movvc	%xcc,	%g2,	%l2
	sth	%o4,	[%l7 + 0x24]
	xnor	%i5,	0x0951,	%l3
loop_368:
	fba,a	%fcc2,	loop_369
	movrlz	%l0,	0x30A,	%i3
	movneg	%icc,	%o6,	%i0
	orn	%i2,	%l5,	%g6
loop_369:
	edge8ln	%i6,	%g3,	%o3
	bcc,a,pn	%icc,	loop_370
	tcs	%xcc,	0x6
	tle	%xcc,	0x2
	udiv	%g7,	0x0672,	%g5
loop_370:
	movvs	%icc,	%i1,	%o5
	and	%i7,	%i4,	%g1
	fbul	%fcc0,	loop_371
	brlz	%o1,	loop_372
	edge8n	%l6,	%l4,	%o7
	fmovdg	%icc,	%f4,	%f14
loop_371:
	st	%f31,	[%l7 + 0x34]
loop_372:
	fpsub16	%f2,	%f24,	%f12
	fcmpd	%fcc2,	%f22,	%f10
	fbe	%fcc0,	loop_373
	tvc	%icc,	0x2
	xorcc	%o0,	0x08C9,	%g4
	movrgz	%o2,	%l1,	%l2
loop_373:
	array32	%g2,	%i5,	%l3
	fble,a	%fcc2,	loop_374
	tge	%icc,	0x1
	fmovrdne	%l0,	%f24,	%f18
	umul	%i3,	0x0C63,	%o4
loop_374:
	sll	%i0,	%o6,	%i2
	fmovsgu	%xcc,	%f2,	%f8
	move	%xcc,	%l5,	%i6
	movl	%xcc,	%g3,	%g6
	bn,a	loop_375
	fmovsvc	%icc,	%f0,	%f12
	srlx	%g7,	%g5,	%o3
	tgu	%icc,	0x2
loop_375:
	nop
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%o4
	umul	%i7,	0x1774,	%i1
	stx	%g1,	[%l7 + 0x78]
	st	%f14,	[%l7 + 0x60]
	tge	%xcc,	0x7
	fmovrsne	%o1,	%f11,	%f13
	tcs	%icc,	0x7
	fmovdneg	%xcc,	%f26,	%f19
	tg	%icc,	0x7
	movl	%icc,	%l6,	%l4
	fcmpeq32	%f6,	%f2,	%o7
	fandnot1	%f28,	%f24,	%f28
	fmovdle	%xcc,	%f18,	%f17
	fcmpes	%fcc2,	%f5,	%f1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%o0
	membar	0x06
	add	%g4,	%o2,	%l2
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0x2
	movg	%xcc,	%i5,	%l1
	fcmped	%fcc3,	%f2,	%f30
	edge8ln	%l3,	%i3,	%l0
	set	0x78, %i7
	lda	[%l7 + %i7] 0x10,	%f23
	pdist	%f6,	%f14,	%f24
	mova	%xcc,	%i0,	%o4
	fxnors	%f9,	%f21,	%f13
	mulscc	%o6,	0x1638,	%i2
	xnorcc	%l5,	0x09CF,	%i6
	tne	%icc,	0x3
	fmovdn	%icc,	%f28,	%f8
	fandnot1s	%f14,	%f28,	%f13
	tcc	%icc,	0x6
	brgz,a	%g6,	loop_376
	taddcctv	%g3,	0x1EA1,	%g7
	fcmpgt32	%f22,	%f8,	%o3
	edge32ln	%g5,	%i7,	%i1
loop_376:
	fzeros	%f17
	sub	%g1,	0x1E8F,	%o5
	smulcc	%l6,	%l4,	%o7
	umul	%o1,	%o0,	%g4
	wr	%g0,	0x2b,	%asi
	stha	%o2,	[%l7 + 0x74] %asi
	membar	#Sync
	srax	%l2,	%g2,	%i5
	addccc	%l1,	%i4,	%l3
	fnors	%f28,	%f21,	%f2
	fbo,a	%fcc0,	loop_377
	movne	%icc,	%l0,	%i3
	lduh	[%l7 + 0x46],	%i0
	tcc	%xcc,	0x5
loop_377:
	brnz	%o6,	loop_378
	movge	%icc,	%i2,	%o4
	movneg	%icc,	%i6,	%g6
	ldx	[%l7 + 0x40],	%l5
loop_378:
	tge	%xcc,	0x1
	movrlz	%g7,	0x068,	%o3
	fmovsl	%xcc,	%f19,	%f3
	addcc	%g3,	0x0647,	%i7
	srax	%g5,	%i1,	%g1
	fornot2	%f22,	%f24,	%f20
	nop
	setx	loop_379,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x4B, %i4
	ldsb	[%l7 + %i4],	%l6
	std	%l4,	[%l7 + 0x40]
	udivx	%o5,	0x1ECF,	%o7
loop_379:
	fornot2	%f30,	%f30,	%f0
	orn	%o1,	%o0,	%o2
	fmovse	%icc,	%f28,	%f16
	taddcc	%l2,	0x1B5E,	%g2
	std	%f12,	[%l7 + 0x30]
	movl	%xcc,	%i5,	%g4
	tcc	%xcc,	0x4
	udivx	%i4,	0x0C11,	%l1
	edge16n	%l0,	%l3,	%i0
	fmovdvc	%xcc,	%f10,	%f24
	addc	%o6,	%i2,	%i3
	array8	%o4,	%g6,	%i6
	bn,a	loop_380
	fmovrdlez	%g7,	%f12,	%f16
	edge16ln	%o3,	%l5,	%i7
	and	%g5,	0x0FA7,	%g3
loop_380:
	tneg	%xcc,	0x4
	std	%f20,	[%l7 + 0x28]
	set	0x0B, %l1
	stba	%g1,	[%l7 + %l1] 0x2a
	membar	#Sync
	ldub	[%l7 + 0x20],	%i1
	edge16l	%l4,	%l6,	%o7
	tn	%xcc,	0x3
	edge16n	%o1,	%o5,	%o2
	array32	%o0,	%l2,	%i5
	bn	%icc,	loop_381
	movcs	%xcc,	%g4,	%g2
	edge16l	%i4,	%l0,	%l1
	tleu	%xcc,	0x4
loop_381:
	fmovdl	%icc,	%f18,	%f31
	andcc	%l3,	%i0,	%i2
	sir	0x0BCC
	fmovs	%f12,	%f15
	srax	%o6,	%i3,	%g6
	movcs	%xcc,	%i6,	%g7
	fands	%f22,	%f9,	%f16
	set	0x12, %l6
	stha	%o4,	[%l7 + %l6] 0x19
	alignaddrl	%l5,	%i7,	%o3
	fbul,a	%fcc1,	loop_382
	fbule	%fcc3,	loop_383
	orncc	%g3,	%g5,	%g1
	fandnot2s	%f25,	%f14,	%f31
loop_382:
	addc	%l4,	%l6,	%i1
loop_383:
	edge16l	%o1,	%o5,	%o7
	fandnot2	%f30,	%f2,	%f18
	fabss	%f4,	%f2
	fcmpes	%fcc2,	%f18,	%f14
	mulscc	%o2,	%o0,	%l2
	andcc	%g4,	0x0508,	%i5
	edge8n	%i4,	%l0,	%l1
	tle	%xcc,	0x5
	fmul8x16au	%f30,	%f23,	%f6
	taddcc	%g2,	%l3,	%i2
	fxors	%f8,	%f19,	%f25
	sir	0x074B
	edge16l	%i0,	%i3,	%o6
	edge32l	%i6,	%g6,	%o4
	sll	%l5,	%i7,	%g7
	set	0x78, %i0
	sta	%f9,	[%l7 + %i0] 0x0c
	edge16	%o3,	%g3,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f30,	%f22,	%g1
	lduw	[%l7 + 0x44],	%l4
	ba,a	loop_384
	tvs	%icc,	0x6
	move	%icc,	%i1,	%l6
	fmovdne	%icc,	%f2,	%f12
loop_384:
	tpos	%xcc,	0x0
	andncc	%o1,	%o5,	%o7
	subcc	%o0,	%l2,	%o2
	fmovsgu	%xcc,	%f12,	%f10
	swap	[%l7 + 0x58],	%i5
	movg	%xcc,	%g4,	%i4
	tsubcctv	%l0,	0x17DC,	%g2
	mulscc	%l1,	%l3,	%i0
	movre	%i2,	%o6,	%i6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x49] %asi,	%g6
	movge	%icc,	%i3,	%l5
	sra	%i7,	%g7,	%o4
	sdivx	%g3,	0x01B6,	%o3
	tvs	%xcc,	0x6
	fmovdn	%icc,	%f23,	%f2
	andn	%g5,	%g1,	%l4
	fmovsl	%xcc,	%f18,	%f30
	smulcc	%i1,	0x1983,	%l6
	movleu	%icc,	%o5,	%o1
	fnot2	%f12,	%f22
	movvs	%icc,	%o0,	%l2
	set	0x60, %g1
	lduwa	[%l7 + %g1] 0x19,	%o7
	tneg	%xcc,	0x3
	alignaddr	%o2,	%i5,	%g4
	lduh	[%l7 + 0x56],	%i4
	fabsd	%f24,	%f28
	nop
	setx	loop_385,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%l0,	%g2,	%l1
	srlx	%i0,	0x0A,	%i2
	subccc	%l3,	0x0917,	%o6
loop_385:
	tvs	%icc,	0x3
	fblg	%fcc2,	loop_386
	edge8	%i6,	%g6,	%l5
	edge32	%i7,	%g7,	%o4
	sllx	%i3,	0x11,	%g3
loop_386:
	fmovscc	%xcc,	%f20,	%f2
	fnot2	%f18,	%f2
	sdivcc	%o3,	0x07D6,	%g1
	xnor	%g5,	0x0E92,	%i1
	movneg	%xcc,	%l4,	%l6
	fpsub32s	%f15,	%f14,	%f16
	movrlez	%o1,	0x32B,	%o0
	movge	%xcc,	%o5,	%l2
	fmovdg	%icc,	%f12,	%f29
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o2
	mulx	%i5,	0x07D5,	%o7
	movrlez	%i4,	%g4,	%l0
	movcs	%icc,	%g2,	%l1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i0
	udivx	%o6,	0x0C8B,	%l3
	movrne	%i6,	0x328,	%g6
	for	%f18,	%f30,	%f16
	set	0x48, %l5
	stwa	%l5,	[%l7 + %l5] 0x27
	membar	#Sync
	st	%f18,	[%l7 + 0x20]
	tge	%xcc,	0x7
	tle	%icc,	0x6
	std	%f16,	[%l7 + 0x28]
	stbar
	tvs	%xcc,	0x4
	movle	%icc,	%i7,	%o4
	fcmpd	%fcc2,	%f18,	%f10
	nop
	setx loop_387, %l0, %l1
	jmpl %l1, %i3
	array16	%g3,	%o3,	%g7
	edge16n	%g1,	%g5,	%l4
	brnz	%i1,	loop_388
loop_387:
	fpsub16	%f26,	%f10,	%f8
	fmovsn	%icc,	%f16,	%f28
	nop
	setx	loop_389,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_388:
	movg	%xcc,	%l6,	%o0
	fcmpne32	%f4,	%f26,	%o5
	orcc	%l2,	%o2,	%i5
loop_389:
	tn	%icc,	0x2
	sra	%o1,	0x11,	%o7
	nop
	set	0x58, %g5
	stx	%g4,	[%l7 + %g5]
	fbg,a	%fcc1,	loop_390
	fbul	%fcc1,	loop_391
	fbug,a	%fcc1,	loop_392
	flush	%l7 + 0x54
loop_390:
	ldd	[%l7 + 0x08],	%l0
loop_391:
	bl,pn	%xcc,	loop_393
loop_392:
	andcc	%i4,	%g2,	%i2
	call	loop_394
	movrgez	%l1,	%i0,	%l3
loop_393:
	sll	%i6,	%o6,	%l5
	fands	%f23,	%f1,	%f29
loop_394:
	edge8	%g6,	%o4,	%i3
	fpsub16s	%f18,	%f8,	%f23
	edge32n	%g3,	%o3,	%g7
	bcs,a	loop_395
	edge32	%i7,	%g1,	%g5
	fbug	%fcc2,	loop_396
	smulcc	%l4,	0x1123,	%i1
loop_395:
	bpos	loop_397
	movrgez	%o0,	%l6,	%o5
loop_396:
	taddcc	%o2,	0x1E0D,	%l2
	set	0x18, %o0
	stba	%o1,	[%l7 + %o0] 0x23
	membar	#Sync
loop_397:
	edge8n	%i5,	%g4,	%o7
	tneg	%icc,	0x6
	fnegd	%f10,	%f26
	sethi	0x16A8,	%l0
	movge	%icc,	%g2,	%i2
	movl	%xcc,	%i4,	%i0
	fmovdneg	%xcc,	%f6,	%f19
	movpos	%icc,	%l1,	%l3
	fnand	%f12,	%f2,	%f0
	fcmpgt32	%f4,	%f10,	%i6
	fmovdge	%icc,	%f27,	%f1
	sra	%l5,	%g6,	%o4
	bpos,a	loop_398
	and	%i3,	0x186A,	%g3
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x10,	%o3
loop_398:
	ta	%icc,	0x4
	bpos,a,pt	%xcc,	loop_399
	subc	%g7,	%o6,	%i7
	smulcc	%g5,	0x0C15,	%g1
	bl,pt	%icc,	loop_400
loop_399:
	fbn,a	%fcc0,	loop_401
	fornot2s	%f29,	%f9,	%f31
	brlez,a	%i1,	loop_402
loop_400:
	movgu	%icc,	%l4,	%o0
loop_401:
	edge8	%o5,	%o2,	%l2
	call	loop_403
loop_402:
	edge32l	%l6,	%i5,	%g4
	orn	%o1,	%l0,	%o7
	fmovsne	%xcc,	%f17,	%f23
loop_403:
	fmovrdne	%g2,	%f4,	%f14
	sir	0x0A60
	sdivx	%i2,	0x0201,	%i0
	fxnors	%f14,	%f25,	%f5
	fmovscc	%xcc,	%f1,	%f9
	umulcc	%l1,	0x0B33,	%l3
	fbn,a	%fcc2,	loop_404
	stw	%i4,	[%l7 + 0x64]
	subc	%l5,	%g6,	%o4
	fpack16	%f6,	%f27
loop_404:
	fors	%f0,	%f26,	%f29
	tge	%icc,	0x2
	tleu	%icc,	0x1
	fbul,a	%fcc3,	loop_405
	fmovdneg	%icc,	%f4,	%f20
	movleu	%icc,	%i6,	%g3
	sllx	%o3,	%i3,	%g7
loop_405:
	fmovrdgez	%i7,	%f4,	%f14
	fmovda	%icc,	%f3,	%f0
	movre	%o6,	%g5,	%g1
	mova	%xcc,	%l4,	%i1
	faligndata	%f6,	%f4,	%f16
	andn	%o5,	0x1050,	%o2
	sub	%o0,	0x0993,	%l2
	udivcc	%i5,	0x15D1,	%l6
	orn	%g4,	0x0218,	%l0
	tn	%icc,	0x1
	fone	%f18
	brz,a	%o7,	loop_406
	stx	%o1,	[%l7 + 0x20]
	movrne	%g2,	0x026,	%i2
	alignaddr	%l1,	%l3,	%i0
loop_406:
	tg	%icc,	0x1
	srlx	%l5,	%g6,	%i4
	sdiv	%o4,	0x1935,	%i6
	addccc	%g3,	0x01F9,	%o3
	nop
	setx	loop_407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%i3,	0x0392,	%g7
	stbar
	movvs	%xcc,	%o6,	%g5
loop_407:
	ldd	[%l7 + 0x10],	%f30
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f16
	sdivcc	%g1,	0x14E7,	%i7
	edge8l	%l4,	%i1,	%o5
	std	%f2,	[%l7 + 0x50]
	fmovrdne	%o0,	%f28,	%f0
	fbo,a	%fcc3,	loop_408
	edge8ln	%o2,	%i5,	%l6
	ba,pt	%xcc,	loop_409
	movn	%xcc,	%g4,	%l0
loop_408:
	tvs	%xcc,	0x5
	tleu	%icc,	0x6
loop_409:
	stb	%l2,	[%l7 + 0x53]
	fmovsl	%icc,	%f7,	%f23
	fand	%f24,	%f6,	%f20
	fmovrdlez	%o7,	%f20,	%f14
	tne	%icc,	0x3
	edge8	%o1,	%g2,	%l1
	tcs	%icc,	0x3
	smul	%l3,	%i0,	%i2
	tl	%icc,	0x4
	ldsh	[%l7 + 0x14],	%l5
	popc	%g6,	%o4
	mova	%xcc,	%i6,	%g3
	lduw	[%l7 + 0x7C],	%i4
	bl	loop_410
	fmovrsne	%o3,	%f31,	%f25
	movleu	%icc,	%g7,	%i3
	bn,a	loop_411
loop_410:
	movle	%icc,	%g5,	%o6
	array8	%g1,	%i7,	%i1
	bl	loop_412
loop_411:
	movre	%o5,	0x1D1,	%l4
	fmovdne	%xcc,	%f29,	%f24
	fmovsl	%xcc,	%f31,	%f26
loop_412:
	fcmps	%fcc3,	%f18,	%f10
	tgu	%xcc,	0x0
	edge8l	%o0,	%o2,	%l6
	fmovrdlez	%g4,	%f20,	%f18
	fxors	%f10,	%f14,	%f20
	fmovrdgez	%i5,	%f24,	%f8
	bneg	%icc,	loop_413
	bn,a,pn	%xcc,	loop_414
	movgu	%xcc,	%l0,	%o7
	fble	%fcc1,	loop_415
loop_413:
	fsrc2	%f8,	%f0
loop_414:
	fcmpne16	%f22,	%f24,	%l2
	move	%xcc,	%g2,	%o1
loop_415:
	or	%l3,	0x0310,	%l1
	smulcc	%i0,	0x0FF7,	%l5
	and	%g6,	%o4,	%i2
	tvs	%icc,	0x4
	edge16ln	%i6,	%i4,	%o3
	movrgz	%g7,	%i3,	%g3
	and	%o6,	0x0650,	%g1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	movne	%icc,	%i7,	%o5
	stb	%i1,	[%l7 + 0x68]
	mulscc	%o0,	%l4,	%o2
	edge16	%l6,	%g4,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l0,	%l2,	%o7
	tneg	%xcc,	0x2
	fmovsvc	%icc,	%f10,	%f2
	set	0x50, %i5
	stba	%o1,	[%l7 + %i5] 0x23
	membar	#Sync
	fbul,a	%fcc2,	loop_416
	fcmpeq16	%f14,	%f30,	%l3
	ldsb	[%l7 + 0x7F],	%g2
	nop
	setx	loop_417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_416:
	umul	%l1,	0x0E4F,	%l5
	or	%g6,	0x1AB1,	%i0
	fmovdl	%icc,	%f21,	%f31
loop_417:
	fmovrdne	%o4,	%f24,	%f28
	fzeros	%f19
	ldsw	[%l7 + 0x28],	%i2
	movge	%xcc,	%i6,	%o3
	fpsub32s	%f9,	%f14,	%f4
	ldd	[%l7 + 0x58],	%i4
	fba	%fcc0,	loop_418
	fzeros	%f16
	fmovdneg	%xcc,	%f2,	%f27
	sll	%i3,	%g3,	%g7
loop_418:
	sra	%o6,	%g1,	%i7
	fmovdcc	%xcc,	%f24,	%f5
	movrlez	%g5,	0x19A,	%o5
	addc	%i1,	0x0C60,	%l4
	fpack16	%f28,	%f12
	ldx	[%l7 + 0x60],	%o0
	fbuge	%fcc1,	loop_419
	membar	0x5F
	umul	%o2,	%l6,	%i5
	stx	%l0,	[%l7 + 0x08]
loop_419:
	stbar
	mulx	%l2,	%g4,	%o7
	fmovdleu	%icc,	%f28,	%f1
	xnor	%o1,	%g2,	%l3
	movrlez	%l1,	%g6,	%l5
	fmul8x16al	%f29,	%f13,	%f26
	fnegd	%f10,	%f0
	fbule,a	%fcc2,	loop_420
	fcmple16	%f6,	%f6,	%o4
	fmuld8ulx16	%f10,	%f4,	%f0
	ldd	[%l7 + 0x30],	%i0
loop_420:
	fbo	%fcc1,	loop_421
	sub	%i6,	0x1B80,	%o3
	subcc	%i2,	0x16E2,	%i3
	bneg,pn	%icc,	loop_422
loop_421:
	fmovrslz	%g3,	%f31,	%f31
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i4,	%g7,	%o6
loop_422:
	brgez	%i7,	loop_423
	tvs	%xcc,	0x7
	or	%g5,	%g1,	%o5
	tcc	%xcc,	0x4
loop_423:
	fsrc2s	%f18,	%f9
	srl	%l4,	0x09,	%i1
	umul	%o0,	%o2,	%l6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x66] %asi,	%i5
	std	%l0,	[%l7 + 0x70]
	brz	%l2,	loop_424
	sdivcc	%g4,	0x0FFA,	%o1
	sub	%g2,	0x1D4E,	%o7
	fpadd16	%f28,	%f10,	%f30
loop_424:
	fpadd32	%f30,	%f24,	%f4
	fsrc1	%f4,	%f0
	sra	%l3,	%g6,	%l5
	ba,pn	%xcc,	loop_425
	tl	%xcc,	0x1
	fbug,a	%fcc2,	loop_426
	prefetch	[%l7 + 0x3C],	 0x3
loop_425:
	brlz	%l1,	loop_427
	tpos	%icc,	0x3
loop_426:
	addcc	%o4,	0x0213,	%i0
	bgu	loop_428
loop_427:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	loop_429
	fmuld8sux16	%f23,	%f10,	%f16
loop_428:
	taddcc	%i6,	0x06A4,	%i2
	sdiv	%i3,	0x0FC2,	%o3
loop_429:
	fcmpes	%fcc0,	%f24,	%f31
	movpos	%xcc,	%i4,	%g7
	nop
	setx	loop_430,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%g3,	%i7,	%g5
	udivx	%o6,	0x1F6B,	%g1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
loop_430:
	nop
	wr	%g0,	0x80,	%asi
	stba	%o5,	[%l7 + 0x57] %asi
	fmovdneg	%xcc,	%f21,	%f7
	sub	%o0,	%i1,	%o2
	tpos	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x7C] %asi,	%f16
	edge8ln	%i5,	%l0,	%l2
	fmovsvc	%icc,	%f21,	%f10
	sir	0x1522
	fmovscs	%icc,	%f15,	%f7
	fble,a	%fcc1,	loop_431
	movcc	%xcc,	%l6,	%o1
	fxnors	%f3,	%f11,	%f9
	add	%g4,	%o7,	%l3
loop_431:
	array8	%g2,	%g6,	%l5
	srax	%o4,	0x15,	%i0
	sdivcc	%i6,	0x0B78,	%l1
	mulscc	%i3,	%i2,	%i4
	fmovsle	%icc,	%f4,	%f13
	udivcc	%o3,	0x1E8A,	%g3
	addccc	%i7,	0x1870,	%g7
	edge16ln	%g5,	%o6,	%l4
	fmovdgu	%icc,	%f24,	%f15
	bgu	%icc,	loop_432
	fmovrsgz	%g1,	%f22,	%f29
	brnz	%o0,	loop_433
	smul	%i1,	%o2,	%o5
loop_432:
	movcs	%xcc,	%i5,	%l2
	xnor	%l6,	%l0,	%g4
loop_433:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%l3
	fmul8x16al	%f0,	%f18,	%f30
	ld	[%l7 + 0x74],	%f23
	fmovsvs	%icc,	%f17,	%f1
	tneg	%icc,	0x2
	edge8	%o1,	%g6,	%g2
	srlx	%l5,	%o4,	%i6
	mulx	%l1,	%i0,	%i2
	fsrc2s	%f0,	%f0
	bn,a	%icc,	loop_434
	fbge	%fcc3,	loop_435
	fblg	%fcc3,	loop_436
	fmovsleu	%xcc,	%f6,	%f30
loop_434:
	movle	%icc,	%i3,	%o3
loop_435:
	umul	%g3,	%i7,	%g7
loop_436:
	call	loop_437
	fpmerge	%f4,	%f6,	%f24
	tgu	%icc,	0x4
	brnz	%i4,	loop_438
loop_437:
	popc	%o6,	%l4
	fxors	%f9,	%f15,	%f14
	fmovsneg	%icc,	%f14,	%f9
loop_438:
	tl	%xcc,	0x5
	sll	%g1,	%g5,	%o0
	fmovsvs	%xcc,	%f22,	%f25
	ldd	[%l7 + 0x08],	%f2
	fmul8x16	%f30,	%f20,	%f30
	movcs	%icc,	%o2,	%i1
	srlx	%o5,	0x0D,	%i5
	fbu,a	%fcc3,	loop_439
	andncc	%l2,	%l0,	%g4
	fmovdg	%xcc,	%f1,	%f5
	srlx	%o7,	%l6,	%l3
loop_439:
	fmuld8sux16	%f28,	%f10,	%f10
	fsrc2	%f18,	%f26
	std	%o0,	[%l7 + 0x70]
	udivcc	%g2,	0x00C5,	%g6
	stb	%l5,	[%l7 + 0x1D]
	bvc	%xcc,	loop_440
	tvc	%xcc,	0x4
	nop
	setx loop_441, %l0, %l1
	jmpl %l1, %i6
	std	%f30,	[%l7 + 0x70]
loop_440:
	fbo	%fcc2,	loop_442
	edge32ln	%o4,	%i0,	%i2
loop_441:
	srl	%i3,	0x0E,	%o3
	fbul,a	%fcc3,	loop_443
loop_442:
	fandnot2	%f28,	%f2,	%f8
	fandnot2s	%f13,	%f10,	%f30
	fmul8x16al	%f3,	%f26,	%f28
loop_443:
	bn	%icc,	loop_444
	ldub	[%l7 + 0x75],	%g3
	mova	%xcc,	%i7,	%l1
	set	0x36, %g3
	stba	%g7,	[%l7 + %g3] 0xe2
	membar	#Sync
loop_444:
	fornot1	%f18,	%f14,	%f30
	movrlez	%o6,	%l4,	%g1
	fmovrslez	%i4,	%f16,	%f1
	bleu,a,pn	%icc,	loop_445
	membar	0x2C
	fsrc2s	%f8,	%f29
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x2a,	%g4
loop_445:
	movcs	%xcc,	%o2,	%o0
	subccc	%i1,	0x0DF6,	%i5
	fmovspos	%icc,	%f5,	%f10
	addcc	%l2,	0x07BF,	%l0
	nop
	setx	loop_446,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%o5,	%o7,	%l6
	andcc	%g4,	0x07F6,	%o1
	fornot1s	%f19,	%f21,	%f31
loop_446:
	addcc	%g2,	0x1B3E,	%g6
	movrgz	%l3,	%i6,	%l5
	brz,a	%i0,	loop_447
	ldsb	[%l7 + 0x40],	%i2
	fpsub16s	%f19,	%f27,	%f14
	movcc	%xcc,	%i3,	%o3
loop_447:
	umul	%o4,	%i7,	%g3
	edge8ln	%l1,	%o6,	%l4
	andn	%g1,	%g7,	%i4
	fbug,a	%fcc2,	loop_448
	ldsw	[%l7 + 0x70],	%o2
	membar	0x47
	edge32l	%g5,	%i1,	%o0
loop_448:
	nop
	set	0x78, %o6
	lduh	[%l7 + %o6],	%l2
	fbn	%fcc0,	loop_449
	fmovda	%icc,	%f8,	%f23
	st	%f27,	[%l7 + 0x28]
	movg	%icc,	%i5,	%o5
loop_449:
	fcmpne16	%f20,	%f20,	%l0
	fpadd32s	%f5,	%f25,	%f1
	fble	%fcc1,	loop_450
	stb	%o7,	[%l7 + 0x29]
	smul	%l6,	0x0128,	%o1
	fbg,a	%fcc2,	loop_451
loop_450:
	fbule,a	%fcc2,	loop_452
	subcc	%g2,	0x1C52,	%g6
	bpos,a,pn	%xcc,	loop_453
loop_451:
	addccc	%g4,	%i6,	%l5
loop_452:
	fmul8sux16	%f6,	%f2,	%f16
	fmovdvc	%xcc,	%f14,	%f4
loop_453:
	addc	%i0,	0x0186,	%i2
	edge16	%i3,	%l3,	%o3
	bpos	loop_454
	fnor	%f14,	%f16,	%f24
	movn	%xcc,	%o4,	%g3
	taddcc	%i7,	%o6,	%l1
loop_454:
	fbul,a	%fcc2,	loop_455
	fornot1s	%f7,	%f14,	%f5
	brgez,a	%g1,	loop_456
	udiv	%l4,	0x0C60,	%i4
loop_455:
	ldsh	[%l7 + 0x7E],	%g7
	fsrc1	%f16,	%f6
loop_456:
	fbge	%fcc0,	loop_457
	sth	%o2,	[%l7 + 0x6C]
	fbg	%fcc0,	loop_458
	be,a	loop_459
loop_457:
	fmovrsgz	%g5,	%f25,	%f30
	movpos	%xcc,	%o0,	%l2
loop_458:
	fmovrdne	%i1,	%f6,	%f28
loop_459:
	movrlz	%i5,	%o5,	%o7
	edge8l	%l0,	%l6,	%g2
	tvc	%icc,	0x6
	sra	%g6,	0x11,	%g4
	tpos	%icc,	0x7
	taddcctv	%i6,	0x184E,	%l5
	mulx	%o1,	%i2,	%i3
	movn	%icc,	%i0,	%l3
	array8	%o4,	%o3,	%g3
	fbe	%fcc1,	loop_460
	addc	%o6,	0x017F,	%l1
	umulcc	%g1,	0x1A5F,	%i7
	flush	%l7 + 0x18
loop_460:
	tcs	%icc,	0x0
	fmovdpos	%icc,	%f10,	%f29
	tvs	%icc,	0x2
	fmovrdne	%l4,	%f30,	%f30
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x59] %asi,	%i4
	te	%xcc,	0x5
	mulscc	%o2,	0x1266,	%g7
	brgez	%g5,	loop_461
	movg	%icc,	%l2,	%o0
	brgez,a	%i1,	loop_462
	tpos	%icc,	0x1
loop_461:
	andn	%i5,	%o7,	%o5
	st	%f3,	[%l7 + 0x34]
loop_462:
	bl	loop_463
	nop
	set	0x59, %g2
	stb	%l6,	[%l7 + %g2]
	tsubcc	%l0,	0x0D58,	%g2
	sir	0x0E8A
loop_463:
	tle	%xcc,	0x4
	sth	%g6,	[%l7 + 0x2A]
	fmovrde	%i6,	%f28,	%f10
	tpos	%xcc,	0x1
	fxnors	%f13,	%f10,	%f23
	ldsh	[%l7 + 0x64],	%g4
	sra	%o1,	0x10,	%i2
	fpadd16s	%f29,	%f30,	%f25
	wr	%g0,	0x81,	%asi
	sta	%f10,	[%l7 + 0x64] %asi
	taddcc	%i3,	%l5,	%l3
	edge32	%o4,	%i0,	%o3
	taddcctv	%o6,	%g3,	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i7,	%g1
	edge16ln	%i4,	%o2,	%g7
	fpsub32	%f10,	%f28,	%f12
	array32	%g5,	%l2,	%o0
	fmovde	%icc,	%f9,	%f21
	sdiv	%i1,	0x1581,	%i5
	edge32ln	%o7,	%l4,	%l6
	movrlez	%l0,	0x3D2,	%o5
	movl	%xcc,	%g6,	%g2
	movn	%icc,	%g4,	%i6
	tvc	%icc,	0x0
	fzeros	%f16
	fandnot2s	%f25,	%f25,	%f10
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x18] %asi,	%o1
	fcmpgt32	%f26,	%f10,	%i3
	fzero	%f4
	movrlz	%i2,	%l3,	%l5
	tpos	%xcc,	0x5
	tvs	%xcc,	0x5
	tleu	%icc,	0x4
	subccc	%o4,	0x0FC7,	%i0
	ldx	[%l7 + 0x08],	%o3
	sethi	0x1E91,	%o6
	brgz,a	%g3,	loop_464
	tl	%xcc,	0x7
	fmovdcs	%xcc,	%f27,	%f19
	fpackfix	%f16,	%f0
loop_464:
	edge8ln	%l1,	%i7,	%g1
	tleu	%icc,	0x4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x19,	%f0
	set	0x1C, %o7
	sta	%f4,	[%l7 + %o7] 0x80
	edge8ln	%o2,	%i4,	%g5
	tvs	%icc,	0x1
	bneg,a,pn	%icc,	loop_465
	fors	%f13,	%f8,	%f17
	fcmpeq16	%f24,	%f6,	%g7
	fba,a	%fcc2,	loop_466
loop_465:
	fbul	%fcc1,	loop_467
	lduh	[%l7 + 0x3A],	%l2
	tgu	%xcc,	0x1
loop_466:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i1
loop_467:
	flush	%l7 + 0x14
	ba,a	loop_468
	edge8n	%i5,	%o7,	%o0
	fbn,a	%fcc0,	loop_469
	fmovrse	%l6,	%f2,	%f19
loop_468:
	fmovrde	%l4,	%f24,	%f0
	xor	%l0,	0x1277,	%o5
loop_469:
	edge32ln	%g6,	%g4,	%i6
	brgez	%o1,	loop_470
	edge32ln	%g2,	%i2,	%i3
	wr	%g0,	0x2b,	%asi
	stda	%l4,	[%l7 + 0x60] %asi
	membar	#Sync
loop_470:
	orncc	%l3,	%i0,	%o3
	te	%xcc,	0x3
	andncc	%o4,	%o6,	%g3
	fpack16	%f24,	%f12
	alignaddrl	%l1,	%i7,	%g1
	srl	%o2,	%i4,	%g5
	movrlez	%g7,	%l2,	%i5
	edge16	%o7,	%o0,	%i1
	edge32ln	%l4,	%l6,	%l0
	set	0x1D, %i2
	lduba	[%l7 + %i2] 0x0c,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f0,	%f5,	%f19
	xor	%o5,	0x08BC,	%i6
	array16	%g4,	%o1,	%g2
	movgu	%xcc,	%i2,	%i3
	array8	%l5,	%l3,	%o3
	udivx	%o4,	0x0D76,	%o6
	udivx	%i0,	0x1227,	%g3
	fornot1	%f16,	%f28,	%f18
	tn	%icc,	0x2
	fornot2	%f22,	%f4,	%f14
	ble,a	loop_471
	move	%icc,	%i7,	%l1
	edge8n	%g1,	%i4,	%o2
	lduh	[%l7 + 0x7C],	%g5
loop_471:
	andncc	%g7,	%l2,	%i5
	movvs	%icc,	%o0,	%o7
	edge8ln	%i1,	%l4,	%l0
	tl	%icc,	0x5
	mulx	%l6,	%o5,	%i6
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	andcc	%g4,	%g6,	%g2
	alignaddrl	%o1,	%i3,	%i2
	std	%l4,	[%l7 + 0x30]
	edge32	%l3,	%o3,	%o6
	movn	%xcc,	%o4,	%g3
	fmovdge	%icc,	%f19,	%f23
	move	%icc,	%i7,	%l1
	array16	%i0,	%i4,	%g1
	fornot2s	%f2,	%f8,	%f27
	wr	%g0,	0x81,	%asi
	stxa	%o2,	[%l7 + 0x30] %asi
	or	%g5,	0x0EDF,	%g7
	tl	%xcc,	0x4
	edge32n	%i5,	%o0,	%l2
	fxnor	%f12,	%f4,	%f12
	tle	%xcc,	0x7
	umul	%i1,	0x0B36,	%o7
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	bgu,pn	%xcc,	loop_472
	edge32ln	%l4,	%l6,	%o5
	movre	%i6,	%g4,	%l0
	tvc	%xcc,	0x3
loop_472:
	siam	0x5
	xnor	%g2,	%g6,	%o1
	fmovdle	%icc,	%f10,	%f18
	bcc	loop_473
	fmovsneg	%xcc,	%f7,	%f11
	xnor	%i2,	%l5,	%i3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_473:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l3,	%o3,	%o6
	bvc,pn	%xcc,	loop_474
	bpos,a	%xcc,	loop_475
	sllx	%g3,	0x0C,	%i7
	brnz,a	%o4,	loop_476
loop_474:
	xnorcc	%l1,	%i0,	%i4
loop_475:
	fmovrsne	%o2,	%f1,	%f23
	sub	%g5,	0x084C,	%g7
loop_476:
	fpadd32s	%f30,	%f5,	%f8
	movrgz	%g1,	0x270,	%o0
	fcmple32	%f0,	%f30,	%l2
	fmovsvs	%icc,	%f29,	%f4
	te	%xcc,	0x5
	andn	%i5,	0x1A56,	%o7
	flush	%l7 + 0x60
	movrlez	%l4,	%l6,	%i1
	edge8n	%i6,	%o5,	%g4
	sll	%g2,	0x0D,	%g6
	andn	%l0,	0x1D0D,	%i2
	udivx	%l5,	0x0AD1,	%i3
	andn	%l3,	%o3,	%o1
	set	0x73, %g6
	lduba	[%l7 + %g6] 0x10,	%o6
	set	0x17, %o2
	stba	%g3,	[%l7 + %o2] 0x22
	membar	#Sync
	edge16n	%i7,	%o4,	%i0
	movle	%xcc,	%l1,	%o2
	subc	%i4,	%g7,	%g5
	tvc	%xcc,	0x0
	udivx	%o0,	0x112F,	%g1
	andncc	%l2,	%i5,	%l4
	andcc	%l6,	%o7,	%i6
	sub	%i1,	0x1139,	%o5
	nop
	setx	loop_477,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x0
	set	0x48, %o4
	ldsba	[%l7 + %o4] 0x11,	%g2
loop_477:
	sub	%g6,	%l0,	%i2
	taddcctv	%l5,	0x1625,	%i3
	tge	%icc,	0x7
	fnot1	%f4,	%f18
	sdivcc	%g4,	0x0AD4,	%o3
	ldub	[%l7 + 0x19],	%o1
	edge8ln	%o6,	%g3,	%l3
	smul	%i7,	%i0,	%l1
	st	%f23,	[%l7 + 0x50]
	orcc	%o4,	0x1480,	%i4
	alignaddr	%g7,	%o2,	%o0
	movpos	%icc,	%g5,	%l2
	fnot1s	%f9,	%f14
	andncc	%i5,	%l4,	%l6
	edge32l	%g1,	%i6,	%i1
	srax	%o7,	0x0A,	%g2
	orcc	%g6,	%l0,	%i2
	edge16	%o5,	%i3,	%l5
	movvc	%xcc,	%o3,	%o1
	sdivx	%o6,	0x0BC7,	%g4
	sllx	%l3,	%g3,	%i0
	edge16l	%l1,	%o4,	%i4
	fcmps	%fcc3,	%f30,	%f4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%o2
	array16	%g7,	%g5,	%o0
	fabsd	%f2,	%f4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x60] %asi,	%f12
	movre	%i5,	%l2,	%l6
	sir	0x0392
	andncc	%g1,	%l4,	%i6
	tneg	%icc,	0x7
	stx	%i1,	[%l7 + 0x60]
	movge	%xcc,	%o7,	%g6
	tcc	%icc,	0x0
	tge	%xcc,	0x1
	fmovspos	%icc,	%f21,	%f27
	fbul	%fcc2,	loop_478
	bvc,a	loop_479
	umul	%l0,	%g2,	%o5
	add	%i3,	%i2,	%o3
loop_478:
	edge16l	%l5,	%o6,	%g4
loop_479:
	sethi	0x026E,	%o1
	orcc	%g3,	0x1ECB,	%l3
	srl	%i0,	%o4,	%l1
	fpadd16s	%f21,	%f17,	%f31
	taddcctv	%i7,	%i4,	%o2
	udivx	%g5,	0x0688,	%o0
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g7
	brlez,a	%l2,	loop_480
	array32	%i5,	%l6,	%l4
	fmovrsne	%g1,	%f26,	%f16
	udivcc	%i1,	0x128F,	%i6
loop_480:
	array8	%o7,	%g6,	%l0
	fabss	%f11,	%f26
	fmovdcc	%icc,	%f20,	%f27
	tleu	%icc,	0x4
	wr	%g0,	0x2a,	%asi
	stba	%o5,	[%l7 + 0x51] %asi
	membar	#Sync
	array8	%g2,	%i2,	%i3
	set	0x16, %o1
	ldsba	[%l7 + %o1] 0x81,	%o3
	fpadd32	%f14,	%f28,	%f16
	movcs	%icc,	%o6,	%g4
	fmuld8sux16	%f5,	%f19,	%f2
	tn	%icc,	0x7
	movle	%icc,	%l5,	%g3
	mova	%xcc,	%o1,	%l3
	fmovsle	%icc,	%f25,	%f25
	fmul8x16al	%f19,	%f18,	%f28
	srlx	%o4,	%l1,	%i0
	fmovrdgez	%i4,	%f4,	%f0
	tne	%icc,	0x0
	movrlez	%o2,	%g5,	%o0
	xnor	%i7,	0x0732,	%g7
	prefetch	[%l7 + 0x10],	 0x2
	fmul8x16au	%f21,	%f29,	%f30
	orncc	%l2,	0x079D,	%i5
	subccc	%l6,	0x186B,	%l4
	movrgez	%g1,	0x306,	%i6
	fbule,a	%fcc2,	loop_481
	fble,a	%fcc2,	loop_482
	brz	%o7,	loop_483
	fpmerge	%f31,	%f8,	%f22
loop_481:
	movne	%icc,	%i1,	%l0
loop_482:
	taddcc	%g6,	%g2,	%o5
loop_483:
	fbule	%fcc3,	loop_484
	fornot1	%f2,	%f22,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x33, %i6
	lduba	[%l7 + %i6] 0x11,	%i2
loop_484:
	taddcctv	%o3,	%i3,	%g4
	tneg	%xcc,	0x0
	fornot1	%f6,	%f20,	%f26
	sir	0x0BE5
	smulcc	%l5,	%g3,	%o6
	array16	%o1,	%l3,	%l1
	umul	%i0,	0x0DE3,	%o4
	fands	%f1,	%f8,	%f3
	edge32l	%i4,	%o2,	%g5
	fbuge,a	%fcc0,	loop_485
	movvc	%xcc,	%o0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g7
loop_485:
	movn	%icc,	%l2,	%l6
	fmovrdlz	%i5,	%f16,	%f12
	fands	%f25,	%f24,	%f30
	set	0x34, %i3
	lduha	[%l7 + %i3] 0x80,	%l4
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	subcc	%i6,	%o7,	%g1
	tcc	%xcc,	0x7
	lduw	[%l7 + 0x28],	%l0
	nop
	set	0x7A, %i1
	sth	%g6,	[%l7 + %i1]
	fmovdleu	%xcc,	%f28,	%f2
	edge32n	%i1,	%o5,	%g2
	fnands	%f13,	%f14,	%f12
	popc	%i2,	%o3
	tl	%icc,	0x5
	nop
	setx loop_486, %l0, %l1
	jmpl %l1, %g4
	tvc	%icc,	0x2
	stw	%i3,	[%l7 + 0x2C]
	movl	%xcc,	%g3,	%o6
loop_486:
	edge8n	%l5,	%o1,	%l1
	bneg,a,pt	%xcc,	loop_487
	fpack16	%f28,	%f1
	tvs	%xcc,	0x7
	fmovda	%icc,	%f4,	%f14
loop_487:
	alignaddrl	%i0,	%l3,	%o4
	call	loop_488
	alignaddrl	%i4,	%g5,	%o0
	fmuld8sux16	%f29,	%f27,	%f22
	orn	%i7,	0x0972,	%o2
loop_488:
	tle	%icc,	0x5
	edge16l	%g7,	%l2,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l6,	%l4,	%i6
	nop
	setx loop_489, %l0, %l1
	jmpl %l1, %g1
	fand	%f6,	%f0,	%f24
	array32	%o7,	%l0,	%i1
	edge8n	%g6,	%o5,	%i2
loop_489:
	fmovs	%f15,	%f9
	fmovdgu	%xcc,	%f4,	%f13
	edge16ln	%g2,	%g4,	%o3
	fcmple32	%f14,	%f12,	%i3
	fmovse	%xcc,	%f9,	%f22
	fmovsge	%xcc,	%f24,	%f20
	or	%o6,	%l5,	%g3
	movvc	%xcc,	%l1,	%o1
	ldd	[%l7 + 0x78],	%f24
	andn	%i0,	0x1F6C,	%l3
	xorcc	%o4,	%g5,	%i4
	fbul,a	%fcc2,	loop_490
	fmovrdlez	%o0,	%f2,	%f24
	edge32ln	%o2,	%i7,	%g7
	orncc	%i5,	%l2,	%l6
loop_490:
	mulscc	%l4,	%g1,	%o7
	fmovrdlz	%l0,	%f28,	%f12
	fbue	%fcc2,	loop_491
	tsubcc	%i6,	%i1,	%g6
	tle	%xcc,	0x1
	xnorcc	%i2,	0x1E19,	%o5
loop_491:
	udivx	%g4,	0x12A6,	%o3
	fpack32	%f4,	%f2,	%f16
	set	0x3C, %l0
	swapa	[%l7 + %l0] 0x10,	%g2
	tsubcc	%i3,	%o6,	%g3
	fblg	%fcc2,	loop_492
	sdivcc	%l5,	0x073C,	%o1
	set	0x3C, %g7
	stwa	%i0,	[%l7 + %g7] 0xe3
	membar	#Sync
loop_492:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,pt	%xcc,	loop_493
	bleu,pn	%icc,	loop_494
	edge8ln	%l1,	%o4,	%g5
	fmovrdgz	%l3,	%f26,	%f12
loop_493:
	fandnot1s	%f18,	%f19,	%f1
loop_494:
	sethi	0x12DC,	%i4
	tpos	%xcc,	0x5
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbne,a	%fcc3,	loop_495
	fmovsle	%xcc,	%f24,	%f15
	tle	%xcc,	0x6
	fmovscs	%xcc,	%f26,	%f17
loop_495:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o2
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	fblg	%fcc2,	loop_496
	fxor	%f6,	%f12,	%f16
	movre	%o0,	%g7,	%l2
	xorcc	%i5,	%l6,	%l4
loop_496:
	nop
	set	0x1B, %i7
	stba	%o7,	[%l7 + %i7] 0x89
	edge8ln	%g1,	%l0,	%i6
	fornot1	%f14,	%f26,	%f28
	addcc	%i1,	%g6,	%o5
	srax	%g4,	%o3,	%g2
	srl	%i2,	%i3,	%o6
	xnorcc	%l5,	0x169C,	%o1
	fnot1	%f20,	%f24
	membar	0x03
	fmovrsne	%g3,	%f21,	%f23
	ldsw	[%l7 + 0x0C],	%i0
	srlx	%l1,	0x1D,	%g5
	ldd	[%l7 + 0x40],	%o4
	nop
	set	0x30, %l4
	std	%f18,	[%l7 + %l4]
	movle	%icc,	%i4,	%o2
	ldx	[%l7 + 0x40],	%l3
	sdivx	%i7,	0x1E88,	%g7
	nop
	setx	loop_497,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%o0,	%l2,	%i5
	tpos	%icc,	0x2
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f16
loop_497:
	orcc	%l6,	%l4,	%g1
	fmul8sux16	%f18,	%f12,	%f10
	tn	%icc,	0x3
	fmovscc	%xcc,	%f4,	%f18
	movre	%o7,	%l0,	%i1
	or	%i6,	%g6,	%o5
	for	%f28,	%f30,	%f16
	set	0x3C, %l1
	sta	%f14,	[%l7 + %l1] 0x81
	edge16l	%o3,	%g4,	%i2
	tle	%xcc,	0x1
	edge8ln	%i3,	%o6,	%l5
	tpos	%xcc,	0x3
	call	loop_498
	ble,a,pn	%xcc,	loop_499
	pdist	%f30,	%f26,	%f6
	fmovsleu	%xcc,	%f31,	%f28
loop_498:
	bcs	%icc,	loop_500
loop_499:
	xnor	%g2,	%g3,	%o1
	bvc,a,pt	%icc,	loop_501
	te	%icc,	0x4
loop_500:
	tle	%icc,	0x2
	call	loop_502
loop_501:
	fmovdgu	%xcc,	%f31,	%f6
	alignaddrl	%i0,	%l1,	%g5
	fmovdvs	%xcc,	%f24,	%f28
loop_502:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i4
	ldd	[%l7 + 0x48],	%f30
	ta	%xcc,	0x7
	fmuld8ulx16	%f29,	%f29,	%f22
	edge8n	%o2,	%l3,	%i7
	ldsh	[%l7 + 0x6E],	%o4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g7
	sethi	0x0EBA,	%o0
	xorcc	%i5,	0x05DA,	%l2
	movpos	%icc,	%l4,	%l6
	addc	%g1,	%o7,	%i1
	mulscc	%i6,	%l0,	%g6
	membar	0x72
	xorcc	%o5,	%g4,	%i2
	nop
	setx	loop_503,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%o3,	0x0FD3,	%o6
	fmovrse	%i3,	%f10,	%f2
	fmovsleu	%xcc,	%f2,	%f18
loop_503:
	swap	[%l7 + 0x60],	%l5
	movn	%xcc,	%g2,	%g3
	bg	%xcc,	loop_504
	fcmped	%fcc3,	%f24,	%f30
	movcs	%xcc,	%o1,	%l1
	subccc	%i0,	0x047D,	%g5
loop_504:
	popc	0x16FF,	%i4
	fornot1s	%f20,	%f23,	%f0
	fsrc1	%f28,	%f10
	udivx	%l3,	0x0471,	%i7
	fcmpgt32	%f14,	%f8,	%o4
	fbl,a	%fcc3,	loop_505
	movl	%xcc,	%g7,	%o0
	edge16	%i5,	%l2,	%l4
	movrlz	%o2,	0x2CE,	%g1
loop_505:
	nop
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	popc	0x03FF,	%o7
	array8	%i1,	%l0,	%i6
	subcc	%g6,	0x0EAD,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%i2
	movneg	%icc,	%o3,	%o6
	set	0x78, %i0
	stwa	%i3,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x0C, %l6
	stwa	%l5,	[%l7 + %l6] 0xea
	membar	#Sync
	sdiv	%g3,	0x110F,	%o1
	sllx	%l1,	%g2,	%g5
	fmovde	%xcc,	%f15,	%f1
	fsrc1	%f26,	%f26
	fandnot2	%f10,	%f26,	%f18
	fmovsa	%xcc,	%f3,	%f1
	fabss	%f4,	%f1
	orcc	%i4,	0x0B4A,	%i0
	ldstub	[%l7 + 0x5B],	%i7
	st	%f16,	[%l7 + 0x20]
	fbule,a	%fcc1,	loop_506
	xor	%l3,	0x16AB,	%o4
	set	0x60, %l5
	ldstuba	[%l7 + %l5] 0x0c,	%g7
loop_506:
	nop
	set	0x7C, %g5
	swapa	[%l7 + %g5] 0x11,	%o0
	array16	%l2,	%l4,	%i5
	mulx	%g1,	0x098D,	%l6
	xnorcc	%o7,	%o2,	%l0
	fba,a	%fcc0,	loop_507
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc2,	loop_508
	movgu	%xcc,	%i1,	%i6
loop_507:
	fsrc1s	%f12,	%f26
	brnz	%g4,	loop_509
loop_508:
	tsubcctv	%o5,	0x1EB3,	%i2
	fmovrsne	%g6,	%f13,	%f3
	fnegs	%f8,	%f21
loop_509:
	movre	%o3,	%i3,	%l5
	fnors	%f24,	%f17,	%f28
	fbug	%fcc3,	loop_510
	fbo	%fcc1,	loop_511
	edge32ln	%o6,	%o1,	%l1
	fbul,a	%fcc1,	loop_512
loop_510:
	tl	%icc,	0x3
loop_511:
	sdiv	%g2,	0x19EC,	%g5
	movrlz	%i4,	%i0,	%i7
loop_512:
	edge16ln	%g3,	%l3,	%g7
	fmovs	%f1,	%f21
	nop
	setx	loop_513,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x6
	fmovrdne	%o4,	%f24,	%f22
	tvc	%icc,	0x4
loop_513:
	fmovsgu	%xcc,	%f23,	%f8
	edge16	%o0,	%l4,	%i5
	ldub	[%l7 + 0x2F],	%l2
	bpos,a	loop_514
	sdivcc	%g1,	0x0B36,	%o7
	fsrc2	%f12,	%f12
	tge	%xcc,	0x7
loop_514:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o2,	0x09FC,	%l6
	fnegs	%f5,	%f31
	fand	%f0,	%f24,	%f12
	tvc	%xcc,	0x1
	movgu	%xcc,	%i1,	%i6
	tvs	%xcc,	0x4
	te	%icc,	0x7
	ldsh	[%l7 + 0x38],	%g4
	fpack16	%f16,	%f18
	subccc	%o5,	0x0A35,	%i2
	subccc	%g6,	%l0,	%i3
	sir	0x16CC
	fxor	%f26,	%f14,	%f14
	fxor	%f2,	%f16,	%f4
	alignaddrl	%l5,	%o3,	%o6
	addc	%l1,	0x11DD,	%o1
	movn	%icc,	%g2,	%i4
	lduh	[%l7 + 0x10],	%i0
	fbl	%fcc2,	loop_515
	array16	%i7,	%g5,	%l3
	tge	%icc,	0x0
	stbar
loop_515:
	bleu,a,pn	%icc,	loop_516
	fmovdne	%xcc,	%f3,	%f14
	fmovsneg	%icc,	%f20,	%f1
	fbule	%fcc3,	loop_517
loop_516:
	fpsub32	%f18,	%f14,	%f8
	bvc	%icc,	loop_518
	fmovrslz	%g3,	%f4,	%f1
loop_517:
	movvc	%xcc,	%o4,	%o0
	edge8	%g7,	%l4,	%l2
loop_518:
	movrlez	%i5,	0x05E,	%g1
	edge16ln	%o7,	%o2,	%l6
	stbar
	fnegd	%f24,	%f24
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i6
	fmovsle	%icc,	%f22,	%f30
	bvc,a,pn	%icc,	loop_519
	bpos,a	%xcc,	loop_520
	ldd	[%l7 + 0x78],	%f12
	fbug	%fcc1,	loop_521
loop_519:
	fandnot1s	%f4,	%f10,	%f20
loop_520:
	movpos	%icc,	%i1,	%o5
	movvc	%xcc,	%i2,	%g4
loop_521:
	bcs,pn	%icc,	loop_522
	movleu	%xcc,	%l0,	%g6
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
loop_522:
	mulx	%o3,	0x04E6,	%o6
	array16	%i3,	%l1,	%g2
	edge32l	%i4,	%i0,	%o1
	movpos	%icc,	%i7,	%g5
	xnorcc	%g3,	%l3,	%o0
	edge8	%g7,	%o4,	%l2
	bn,a,pn	%xcc,	loop_523
	fors	%f16,	%f20,	%f28
	edge32n	%i5,	%l4,	%o7
	sub	%o2,	%l6,	%g1
loop_523:
	movrlz	%i6,	0x0C4,	%i1
	srlx	%i2,	0x0B,	%o5
	bneg,pt	%icc,	loop_524
	fandnot1	%f16,	%f24,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f13,	%f13
loop_524:
	bge,a,pt	%icc,	loop_525
	or	%g4,	%l0,	%l5
	array16	%g6,	%o3,	%o6
	mulx	%l1,	0x1D1A,	%i3
loop_525:
	tgu	%icc,	0x3
	pdist	%f16,	%f2,	%f28
	fands	%f1,	%f0,	%f30
	tvc	%icc,	0x6
	movge	%xcc,	%g2,	%i4
	taddcctv	%i0,	0x0E9D,	%o1
	array32	%i7,	%g3,	%l3
	fxors	%f10,	%f28,	%f1
	movcs	%icc,	%o0,	%g7
	bgu	loop_526
	bgu	loop_527
	addc	%o4,	%g5,	%i5
	swap	[%l7 + 0x3C],	%l2
loop_526:
	alignaddrl	%o7,	%o2,	%l4
loop_527:
	subccc	%l6,	0x1115,	%i6
	edge8n	%i1,	%i2,	%g1
	fble,a	%fcc0,	loop_528
	udivcc	%g4,	0x038C,	%o5
	xor	%l5,	0x1424,	%l0
	bneg,a	%xcc,	loop_529
loop_528:
	bcc,pn	%icc,	loop_530
	fmovsge	%xcc,	%f4,	%f4
	fsrc2s	%f26,	%f19
loop_529:
	fsrc1	%f18,	%f4
loop_530:
	tleu	%icc,	0x0
	wr	%g0,	0x89,	%asi
	sta	%f15,	[%l7 + 0x2C] %asi
	movle	%xcc,	%g6,	%o6
	fbl,a	%fcc2,	loop_531
	edge16ln	%o3,	%l1,	%g2
	popc	0x0B4B,	%i4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i0,	%o1
loop_531:
	fmovrde	%i3,	%f28,	%f24
	sra	%g3,	%l3,	%o0
	set	0x33, %o0
	lduba	[%l7 + %o0] 0x80,	%g7
	movrne	%i7,	%o4,	%i5
	movrlz	%l2,	0x3CB,	%o7
	subc	%g5,	0x0520,	%l4
	movre	%o2,	%i6,	%l6
	sll	%i1,	0x17,	%g1
	membar	0x26
	ldsh	[%l7 + 0x18],	%g4
	fnand	%f10,	%f14,	%f18
	fmovse	%xcc,	%f1,	%f21
	fpackfix	%f6,	%f6
	tvc	%xcc,	0x2
	srax	%i2,	0x00,	%o5
	tpos	%icc,	0x3
	bneg	%xcc,	loop_532
	ldstub	[%l7 + 0x3C],	%l0
	fmovsge	%xcc,	%f15,	%f18
	addcc	%g6,	0x1BAC,	%o6
loop_532:
	stw	%l5,	[%l7 + 0x70]
	bg,a	loop_533
	movgu	%icc,	%l1,	%g2
	fpadd32s	%f0,	%f7,	%f28
	bn,a,pn	%icc,	loop_534
loop_533:
	ldd	[%l7 + 0x58],	%f2
	movgu	%xcc,	%o3,	%i0
	fandnot1	%f28,	%f14,	%f16
loop_534:
	swap	[%l7 + 0x70],	%o1
	tcs	%xcc,	0x7
	fmovs	%f28,	%f24
	srl	%i4,	0x0C,	%i3
	tvc	%xcc,	0x2
	fmovdge	%xcc,	%f31,	%f30
	edge32l	%g3,	%o0,	%g7
	fbne	%fcc1,	loop_535
	brgez	%l3,	loop_536
	mulscc	%o4,	%i5,	%i7
	set	0x65, %g1
	lduba	[%l7 + %g1] 0x80,	%l2
loop_535:
	tneg	%xcc,	0x7
loop_536:
	movre	%o7,	0x107,	%l4
	ldx	[%l7 + 0x38],	%g5
	movcs	%xcc,	%i6,	%o2
	tvs	%xcc,	0x0
	smulcc	%l6,	%g1,	%i1
	set	0x18, %o5
	ldxa	[%g0 + %o5] 0x58,	%i2
	fpadd16s	%f13,	%f8,	%f24
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x11,	%o5,	%l0
	sdivx	%g4,	0x192F,	%o6
	alignaddrl	%l5,	%g6,	%l1
	edge32	%g2,	%o3,	%o1
	alignaddrl	%i0,	%i3,	%i4
	tge	%icc,	0x4
	alignaddr	%g3,	%o0,	%l3
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sth	%g7,	[%l7 + 0x72]
	subccc	%o4,	0x1CE0,	%i7
	fexpand	%f14,	%f22
	move	%xcc,	%i5,	%l2
	nop
	setx loop_537, %l0, %l1
	jmpl %l1, %o7
	smulcc	%g5,	0x003E,	%l4
	fmovdvc	%icc,	%f18,	%f7
	swap	[%l7 + 0x64],	%i6
loop_537:
	xnorcc	%l6,	%o2,	%i1
	movcc	%xcc,	%g1,	%i2
	andn	%o5,	%l0,	%o6
	mova	%icc,	%l5,	%g4
	bcs,pt	%icc,	loop_538
	movcc	%icc,	%g6,	%l1
	ldstub	[%l7 + 0x1C],	%o3
	fnors	%f15,	%f1,	%f15
loop_538:
	edge32n	%o1,	%g2,	%i3
	srax	%i4,	0x13,	%g3
	bleu,a,pt	%xcc,	loop_539
	fbge	%fcc0,	loop_540
	movgu	%xcc,	%i0,	%o0
	popc	%l3,	%g7
loop_539:
	sub	%o4,	0x0270,	%i5
loop_540:
	ldx	[%l7 + 0x58],	%l2
	edge32n	%i7,	%o7,	%g5
	fmovsleu	%xcc,	%f20,	%f23
	sllx	%i6,	%l4,	%l6
	tvs	%xcc,	0x5
	fpmerge	%f17,	%f2,	%f30
	or	%o2,	%i1,	%g1
	bcs,a,pn	%icc,	loop_541
	nop
	set	0x44, %g4
	ldsw	[%l7 + %g4],	%i2
	andn	%l0,	0x1DBD,	%o5
	movle	%icc,	%l5,	%o6
loop_541:
	nop
	set	0x30, %i5
	swapa	[%l7 + %i5] 0x10,	%g6
	andncc	%g4,	%o3,	%o1
	fmovsg	%icc,	%f9,	%f30
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x44] %asi,	%f22
	movrgz	%g2,	%l1,	%i3
	tleu	%icc,	0x5
	popc	0x0F27,	%g3
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x0c,	 0x2
	prefetch	[%l7 + 0x6C],	 0x3
	stx	%o0,	[%l7 + 0x48]
	fxnors	%f1,	%f19,	%f25
	fzeros	%f11
	stw	%i0,	[%l7 + 0x7C]
	fba	%fcc0,	loop_542
	fbge,a	%fcc3,	loop_543
	movrlez	%g7,	%o4,	%i5
	fmovsvs	%icc,	%f11,	%f6
loop_542:
	stw	%l3,	[%l7 + 0x28]
loop_543:
	fexpand	%f15,	%f0
	orcc	%i7,	0x1537,	%l2
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x5A] %asi,	%o7
	fmovsg	%xcc,	%f3,	%f14
	fnot2s	%f24,	%f6
	bshuffle	%f22,	%f10,	%f28
	fsrc1s	%f27,	%f28
	edge32ln	%g5,	%i6,	%l4
	fxor	%f20,	%f18,	%f2
	movcc	%xcc,	%l6,	%o2
	movvs	%icc,	%i1,	%i2
	brz,a	%l0,	loop_544
	movge	%xcc,	%g1,	%o5
	fandnot2	%f24,	%f4,	%f0
	orncc	%l5,	%g6,	%g4
loop_544:
	nop
	setx loop_545, %l0, %l1
	jmpl %l1, %o3
	fbug,a	%fcc1,	loop_546
	edge32	%o1,	%o6,	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%g3
loop_545:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%i4
loop_546:
	fpadd32s	%f8,	%f13,	%f11
	addc	%o0,	%i0,	%l1
	fpack32	%f20,	%f20,	%f4
	addc	%g7,	0x0507,	%i5
	edge8n	%l3,	%i7,	%l2
	movgu	%icc,	%o4,	%o7
	ba,pn	%xcc,	loop_547
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%g5,	%l4
	andn	%l6,	%i6,	%o2
loop_547:
	sllx	%i1,	0x1E,	%l0
	lduw	[%l7 + 0x74],	%g1
	array8	%i2,	%l5,	%g6
	tge	%icc,	0x2
	fornot2s	%f12,	%f24,	%f3
	fcmped	%fcc2,	%f12,	%f26
	bcs	%icc,	loop_548
	addc	%g4,	%o3,	%o5
	ldsw	[%l7 + 0x4C],	%o1
	xnorcc	%g2,	%o6,	%g3
loop_548:
	edge8ln	%i4,	%i3,	%o0
	wr	%g0,	0x57,	%asi
	stxa	%i0,	[%g0 + 0x0] %asi
	popc	0x10A2,	%l1
	tvs	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g7
	xorcc	%l3,	0x043F,	%i5
	tgu	%xcc,	0x7
	fblg,a	%fcc2,	loop_549
	fxor	%f30,	%f8,	%f26
	lduh	[%l7 + 0x78],	%l2
	edge32n	%i7,	%o4,	%g5
loop_549:
	movcs	%xcc,	%o7,	%l6
	tleu	%xcc,	0x0
	fornot1	%f2,	%f20,	%f24
	fbe	%fcc2,	loop_550
	fmovsvs	%icc,	%f28,	%f1
	movgu	%icc,	%l4,	%o2
	tne	%xcc,	0x7
loop_550:
	srl	%i1,	%l0,	%g1
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x0c,	%i6
	alignaddrl	%i2,	%g6,	%g4
	fblg,a	%fcc0,	loop_551
	fpack32	%f24,	%f12,	%f26
	fmovrdgz	%l5,	%f24,	%f10
	ldsb	[%l7 + 0x11],	%o5
loop_551:
	movge	%xcc,	%o3,	%g2
	tsubcctv	%o6,	0x1E2A,	%o1
	movrgez	%g3,	%i4,	%o0
	tpos	%xcc,	0x6
	fbue,a	%fcc1,	loop_552
	subccc	%i0,	0x1A82,	%l1
	or	%g7,	0x0434,	%i3
	movrlez	%l3,	0x1BF,	%l2
loop_552:
	fbn	%fcc2,	loop_553
	movrgez	%i7,	%o4,	%i5
	umul	%o7,	0x0CF6,	%g5
	edge16	%l6,	%o2,	%l4
loop_553:
	membar	0x12
	tne	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l0,	%f4,	%f16
	bneg,pt	%xcc,	loop_554
	edge16ln	%g1,	%i1,	%i2
	brgez	%g6,	loop_555
	fpmerge	%f19,	%f3,	%f8
loop_554:
	sllx	%i6,	%l5,	%o5
	umul	%o3,	%g4,	%g2
loop_555:
	edge8ln	%o1,	%g3,	%o6
	srl	%i4,	0x07,	%i0
	fmovrslz	%o0,	%f12,	%f22
	movne	%icc,	%l1,	%i3
	tleu	%icc,	0x4
	smulcc	%g7,	0x0495,	%l3
	lduw	[%l7 + 0x78],	%i7
	sir	0x1085
	ldsw	[%l7 + 0x1C],	%l2
	fmovs	%f25,	%f17
	movg	%xcc,	%i5,	%o4
	fblg,a	%fcc0,	loop_556
	mova	%xcc,	%o7,	%g5
	tvc	%icc,	0x3
	movvc	%icc,	%l6,	%o2
loop_556:
	andcc	%l4,	0x1CAD,	%l0
	addccc	%g1,	0x0D37,	%i2
	movne	%icc,	%g6,	%i1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x10
	set	0x10, %o3
	ldxa	[%g0 + %o3] 0x21,	%l5
	sethi	0x072E,	%i6
	smul	%o3,	%o5,	%g4
	movvs	%xcc,	%g2,	%o1
	fpackfix	%f10,	%f4
	array16	%o6,	%g3,	%i4
	fmul8x16al	%f3,	%f10,	%f18
	mulscc	%o0,	%i0,	%l1
	movn	%icc,	%g7,	%i3
	brz	%l3,	loop_557
	edge32ln	%i7,	%l2,	%o4
	fmovdvs	%icc,	%f24,	%f3
	movrne	%i5,	0x016,	%g5
loop_557:
	subc	%o7,	0x0705,	%o2
	fornot2s	%f18,	%f17,	%f10
	bpos,pt	%icc,	loop_558
	sll	%l4,	%l0,	%g1
	array8	%i2,	%l6,	%g6
	fbue	%fcc3,	loop_559
loop_558:
	movrne	%l5,	0x0DB,	%i6
	tl	%xcc,	0x6
	edge8n	%i1,	%o5,	%o3
loop_559:
	sllx	%g4,	%g2,	%o6
	fbn,a	%fcc0,	loop_560
	nop
	setx	loop_561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%g3,	%i4,	%o1
	addc	%o0,	0x0A1A,	%i0
loop_560:
	fble,a	%fcc1,	loop_562
loop_561:
	tneg	%xcc,	0x2
	movcs	%xcc,	%l1,	%g7
	fbge,a	%fcc1,	loop_563
loop_562:
	tsubcc	%l3,	0x1A77,	%i3
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x1B] %asi,	%l2
loop_563:
	mulx	%o4,	0x01B9,	%i5
	fmovdge	%icc,	%f24,	%f1
	fmovsne	%xcc,	%f30,	%f8
	fmovrslez	%g5,	%f17,	%f20
	fmovsgu	%xcc,	%f9,	%f18
	tg	%icc,	0x3
	fcmps	%fcc2,	%f28,	%f29
	tsubcc	%i7,	0x10CD,	%o7
	sdivx	%o2,	0x1047,	%l4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2C] %asi,	%l0
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f16
	edge16ln	%g1,	%i2,	%g6
	bvc,a	%icc,	loop_564
	fxnor	%f10,	%f16,	%f28
	fbg	%fcc0,	loop_565
	and	%l6,	0x068F,	%l5
loop_564:
	xnor	%i6,	%o5,	%o3
	smulcc	%i1,	%g2,	%g4
loop_565:
	subccc	%o6,	%g3,	%i4
	tcc	%xcc,	0x7
	subcc	%o1,	%o0,	%i0
	fxor	%f0,	%f0,	%f22
	call	loop_566
	popc	0x0A4F,	%l1
	srax	%l3,	0x1B,	%i3
	movrgz	%g7,	%l2,	%o4
loop_566:
	move	%icc,	%i5,	%g5
	subcc	%o7,	%o2,	%l4
	fone	%f6
	orcc	%i7,	%l0,	%g1
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	fones	%f24
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l6,	%l5
	xnor	%g6,	0x15D7,	%o5
	addccc	%i6,	0x1DEE,	%i1
	movvc	%icc,	%g2,	%o3
	umulcc	%g4,	0x031C,	%g3
	brgz	%i4,	loop_567
	movvc	%xcc,	%o6,	%o0
	movvs	%icc,	%i0,	%l1
	tneg	%xcc,	0x7
loop_567:
	ld	[%l7 + 0x4C],	%f11
	fmovdl	%icc,	%f3,	%f15
	smulcc	%o1,	0x0254,	%i3
	addc	%g7,	0x08F4,	%l2
	edge16l	%o4,	%i5,	%l3
	bpos,pn	%icc,	loop_568
	fands	%f29,	%f14,	%f11
	tgu	%icc,	0x1
	set	0x40, %o6
	lduwa	[%l7 + %o6] 0x14,	%g5
loop_568:
	ldsw	[%l7 + 0x24],	%o7
	tl	%xcc,	0x1
	tg	%xcc,	0x7
	addcc	%o2,	0x0611,	%i7
	tvs	%icc,	0x1
	xorcc	%l0,	%g1,	%i2
	siam	0x2
	fnors	%f31,	%f8,	%f22
	ldd	[%l7 + 0x78],	%l4
	edge8ln	%l5,	%l6,	%o5
	fbu	%fcc2,	loop_569
	xnor	%g6,	%i1,	%g2
	tcc	%xcc,	0x0
	movle	%xcc,	%o3,	%g4
loop_569:
	udivx	%i6,	0x0B46,	%i4
	fsrc2	%f2,	%f20
	fpackfix	%f20,	%f27
	subc	%o6,	%o0,	%i0
	edge16ln	%l1,	%g3,	%i3
	bne	%xcc,	loop_570
	alignaddr	%o1,	%g7,	%l2
	fabss	%f4,	%f26
	membar	0x76
loop_570:
	movpos	%icc,	%i5,	%l3
	subc	%o4,	%o7,	%g5
	tcc	%icc,	0x5
	fnot1s	%f28,	%f28
	lduw	[%l7 + 0x1C],	%i7
	edge8ln	%l0,	%g1,	%o2
	tvc	%xcc,	0x2
	edge16	%l4,	%l5,	%i2
	taddcc	%o5,	%l6,	%g6
	brgz,a	%i1,	loop_571
	nop
	set	0x44, %l2
	lduh	[%l7 + %l2],	%o3
	lduw	[%l7 + 0x08],	%g4
	xnor	%i6,	%i4,	%g2
loop_571:
	alignaddr	%o6,	%o0,	%i0
	movcc	%xcc,	%l1,	%i3
	subc	%g3,	0x0806,	%g7
	sir	0x03DC
	tcs	%icc,	0x6
	set	0x34, %g6
	lda	[%l7 + %g6] 0x10,	%f21
	fmovscc	%xcc,	%f15,	%f13
	fors	%f25,	%f0,	%f12
	edge32ln	%o1,	%l2,	%l3
	fmovrdlz	%o4,	%f18,	%f18
	bg	loop_572
	fnegs	%f28,	%f25
	xorcc	%i5,	%o7,	%g5
	lduh	[%l7 + 0x2A],	%i7
loop_572:
	fbu,a	%fcc0,	loop_573
	subcc	%l0,	%g1,	%o2
	array8	%l4,	%l5,	%o5
	movre	%i2,	0x0D4,	%l6
loop_573:
	fmovrsne	%i1,	%f10,	%f14
	tvc	%icc,	0x7
	tl	%xcc,	0x6
	fbn	%fcc3,	loop_574
	udiv	%o3,	0x1BB7,	%g6
	fcmpgt16	%f4,	%f4,	%i6
	fbug	%fcc1,	loop_575
loop_574:
	lduw	[%l7 + 0x28],	%g4
	fmovdn	%xcc,	%f29,	%f28
	bvs,pn	%icc,	loop_576
loop_575:
	tsubcc	%g2,	%i4,	%o0
	bl	loop_577
	ldsb	[%l7 + 0x30],	%i0
loop_576:
	tpos	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%l1
loop_577:
	brlez,a	%o6,	loop_578
	movne	%xcc,	%g3,	%i3
	movcc	%xcc,	%g7,	%o1
	fandnot2	%f20,	%f0,	%f16
loop_578:
	fblg	%fcc2,	loop_579
	edge8ln	%l3,	%o4,	%l2
	sllx	%o7,	%i5,	%g5
	bgu,pn	%icc,	loop_580
loop_579:
	edge32ln	%l0,	%i7,	%g1
	tleu	%icc,	0x1
	tgu	%xcc,	0x0
loop_580:
	fbu	%fcc0,	loop_581
	bl	loop_582
	bg,pt	%icc,	loop_583
	tvs	%icc,	0x3
loop_581:
	bvc,a,pt	%xcc,	loop_584
loop_582:
	edge8ln	%l4,	%o2,	%o5
loop_583:
	fmovdleu	%icc,	%f10,	%f16
	ldub	[%l7 + 0x18],	%l5
loop_584:
	movgu	%icc,	%i2,	%l6
	bcs	%xcc,	loop_585
	fmovrdgz	%i1,	%f6,	%f30
	set	0x68, %i2
	stxa	%o3,	[%l7 + %i2] 0x22
	membar	#Sync
loop_585:
	edge16ln	%g6,	%g4,	%i6
	fmovdvs	%xcc,	%f28,	%f18
	sllx	%i4,	0x18,	%g2
	brgez,a	%i0,	loop_586
	movgu	%icc,	%o0,	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%o6
loop_586:
	nop
	wr	%g0,	0x23,	%asi
	stba	%i3,	[%l7 + 0x5E] %asi
	membar	#Sync
	tleu	%xcc,	0x1
	fpackfix	%f30,	%f4
	movg	%icc,	%g7,	%o1
	membar	0x3D
	fnot2	%f12,	%f30
	fbge	%fcc1,	loop_587
	movrlez	%o4,	%l3,	%o7
	taddcc	%l2,	%i5,	%l0
	udiv	%g5,	0x0AC8,	%g1
loop_587:
	movrne	%i7,	%l4,	%o2
	srax	%o5,	0x02,	%l5
	fpsub16	%f30,	%f28,	%f28
	edge8	%l6,	%i2,	%o3
	set	0x110, %o4
	ldxa	[%g0 + %o4] 0x21,	%i1
	movleu	%icc,	%g4,	%i6
	srlx	%i4,	%g2,	%i0
	sll	%o0,	%g6,	%l1
	addccc	%g3,	0x120C,	%o6
	fmovdgu	%xcc,	%f0,	%f8
	tne	%icc,	0x4
	udivcc	%i3,	0x1205,	%o1
	fcmps	%fcc3,	%f15,	%f29
	movrgez	%o4,	0x345,	%g7
	sra	%l3,	0x06,	%l2
	fcmpeq32	%f22,	%f0,	%i5
	fmovdg	%xcc,	%f6,	%f3
	prefetch	[%l7 + 0x44],	 0x0
	srax	%l0,	%o7,	%g1
	tl	%icc,	0x1
	fcmpeq32	%f8,	%f10,	%i7
	fmul8sux16	%f10,	%f22,	%f6
	sll	%g5,	%l4,	%o5
	edge32	%o2,	%l6,	%l5
	orn	%o3,	0x0929,	%i1
	tsubcctv	%i2,	%i6,	%g4
	array8	%g2,	%i0,	%o0
	andn	%g6,	0x1C75,	%i4
	ldsb	[%l7 + 0x36],	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o6,	%f20,	%f26
	fmovda	%xcc,	%f31,	%f10
	fba	%fcc1,	loop_588
	fbue	%fcc1,	loop_589
	fzero	%f2
	fzeros	%f14
loop_588:
	fxnors	%f16,	%f22,	%f19
loop_589:
	edge32	%g3,	%o1,	%o4
	movne	%icc,	%g7,	%i3
	membar	0x5B
	tg	%xcc,	0x2
	mova	%xcc,	%l2,	%l3
	fpsub32	%f24,	%f2,	%f0
	movgu	%icc,	%l0,	%i5
	taddcc	%g1,	0x1E22,	%o7
	movneg	%icc,	%g5,	%l4
	tsubcc	%o5,	0x107C,	%i7
	edge16l	%l6,	%l5,	%o2
	addccc	%i1,	0x0A82,	%i2
	bpos,a,pn	%icc,	loop_590
	tsubcctv	%o3,	0x1684,	%g4
	edge32n	%g2,	%i0,	%o0
	sdivcc	%g6,	0x120D,	%i4
loop_590:
	stx	%i6,	[%l7 + 0x60]
	ldd	[%l7 + 0x30],	%f6
	fba,a	%fcc2,	loop_591
	bleu,pn	%icc,	loop_592
	bvc,a,pt	%xcc,	loop_593
	fmovrdne	%o6,	%f14,	%f2
loop_591:
	mulx	%l1,	%o1,	%o4
loop_592:
	fone	%f14
loop_593:
	ldd	[%l7 + 0x58],	%f4
	tcs	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x48] %asi,	%g7
	fcmpeq16	%f2,	%f18,	%i3
	tvs	%xcc,	0x6
	movl	%icc,	%l2,	%g3
	andn	%l3,	0x1B9F,	%l0
	mulscc	%g1,	%o7,	%i5
	tcs	%icc,	0x0
	edge32n	%l4,	%g5,	%o5
	movne	%icc,	%i7,	%l5
	fbn,a	%fcc3,	loop_594
	edge32l	%l6,	%i1,	%i2
	fbo,a	%fcc3,	loop_595
	edge16n	%o2,	%g4,	%g2
loop_594:
	edge8	%i0,	%o0,	%g6
	sethi	0x0AE0,	%i4
loop_595:
	andcc	%o3,	%i6,	%o6
	umul	%o1,	0x18CC,	%o4
	fbuge,a	%fcc3,	loop_596
	edge16l	%g7,	%i3,	%l2
	fmovsneg	%icc,	%f10,	%f13
	fnegd	%f6,	%f6
loop_596:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x30] %asi,	%l1
	bvs,a	loop_597
	umulcc	%l3,	%g3,	%g1
	movvs	%icc,	%o7,	%l0
	bg	%xcc,	loop_598
loop_597:
	movrgz	%i5,	%g5,	%l4
	movcc	%icc,	%o5,	%l5
	fnot1s	%f17,	%f30
loop_598:
	udivcc	%l6,	0x168F,	%i1
	bshuffle	%f20,	%f2,	%f26
	sll	%i7,	0x10,	%i2
	movl	%icc,	%g4,	%o2
	orncc	%i0,	0x13D6,	%g2
	fmovsle	%xcc,	%f12,	%f10
	taddcctv	%g6,	0x10C1,	%o0
	edge16n	%o3,	%i6,	%o6
	bcc	loop_599
	movrlz	%i4,	0x3CC,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x2
loop_599:
	fblg	%fcc3,	loop_600
	alignaddrl	%g7,	%i3,	%l2
	fmovdcs	%icc,	%f26,	%f11
	xor	%o4,	0x15F6,	%l3
loop_600:
	and	%g3,	%l1,	%g1
	fpackfix	%f4,	%f29
	movrgez	%o7,	0x156,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%g5
	prefetch	[%l7 + 0x28],	 0x0
	edge8ln	%o5,	%l4,	%l5
	sdiv	%l6,	0x1A3F,	%i1
	membar	0x17
	fmovdge	%xcc,	%f12,	%f6
	stx	%i2,	[%l7 + 0x78]
	movl	%icc,	%g4,	%i7
	alignaddr	%o2,	%i0,	%g6
	udiv	%g2,	0x00CA,	%o0
	bvc,pn	%icc,	loop_601
	edge32n	%i6,	%o6,	%o3
	fmovsgu	%xcc,	%f29,	%f19
	brgez,a	%i4,	loop_602
loop_601:
	addcc	%o1,	%g7,	%i3
	xnor	%l2,	0x043F,	%l3
	taddcc	%o4,	%g3,	%l1
loop_602:
	movn	%xcc,	%g1,	%o7
	fnot2s	%f14,	%f9
	tge	%icc,	0x5
	st	%f24,	[%l7 + 0x34]
	movgu	%xcc,	%l0,	%g5
	nop
	setx loop_603, %l0, %l1
	jmpl %l1, %o5
	sethi	0x1E43,	%i5
	fmovrdlez	%l5,	%f28,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_603:
	movvs	%xcc,	%l6,	%l4
	fmovsn	%icc,	%f17,	%f3
	brgz,a	%i1,	loop_604
	swap	[%l7 + 0x38],	%g4
	tvs	%icc,	0x5
	flush	%l7 + 0x44
loop_604:
	std	%i6,	[%l7 + 0x18]
	fnands	%f2,	%f1,	%f27
	fnot2	%f18,	%f24
	be,a	loop_605
	srl	%i2,	%o2,	%i0
	tpos	%xcc,	0x0
	fmovsneg	%icc,	%f31,	%f6
loop_605:
	addccc	%g6,	%g2,	%i6
	prefetch	[%l7 + 0x40],	 0x3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%o0,	0x0D75,	%o6
	addcc	%i4,	%o3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f10,	%f24,	%f28
	fbue	%fcc2,	loop_606
	movvc	%xcc,	%o1,	%l2
	xnorcc	%i3,	0x16FE,	%o4
	faligndata	%f24,	%f22,	%f28
loop_606:
	std	%l2,	[%l7 + 0x18]
	ldd	[%l7 + 0x08],	%f4
	fxors	%f20,	%f31,	%f1
	tneg	%icc,	0x2
	edge32l	%g3,	%l1,	%g1
	edge8ln	%o7,	%g5,	%l0
	subccc	%i5,	0x0AB0,	%l5
	addccc	%l6,	0x047C,	%o5
	tge	%xcc,	0x0
	movcc	%icc,	%i1,	%l4
	wr	%g0,	0x27,	%asi
	stha	%g4,	[%l7 + 0x08] %asi
	membar	#Sync
	fmovrse	%i7,	%f27,	%f26
	edge16n	%o2,	%i0,	%i2
	fmul8x16au	%f29,	%f18,	%f4
	sdiv	%g6,	0x13C0,	%g2
	tvs	%icc,	0x3
	tn	%xcc,	0x4
	nop
	set	0x78, %o1
	std	%o0,	[%l7 + %o1]
	addccc	%o6,	0x0AF3,	%i6
	fabsd	%f4,	%f6
	fnors	%f28,	%f17,	%f2
	bshuffle	%f6,	%f6,	%f20
	move	%xcc,	%i4,	%g7
	brlz	%o3,	loop_607
	tneg	%xcc,	0x4
	nop
	setx loop_608, %l0, %l1
	jmpl %l1, %l2
	stx	%i3,	[%l7 + 0x78]
loop_607:
	call	loop_609
	array32	%o1,	%o4,	%l3
loop_608:
	movleu	%icc,	%g3,	%l1
	tsubcc	%o7,	%g1,	%l0
loop_609:
	movrne	%g5,	%l5,	%i5
	bshuffle	%f22,	%f0,	%f8
	edge8l	%l6,	%o5,	%i1
	fmovdge	%icc,	%f24,	%f11
	fmovdgu	%icc,	%f28,	%f29
	tsubcc	%g4,	%i7,	%l4
	fbg,a	%fcc3,	loop_610
	fmovsge	%icc,	%f1,	%f24
	tcc	%icc,	0x7
	fba	%fcc1,	loop_611
loop_610:
	tcc	%xcc,	0x5
	brgez	%o2,	loop_612
	fbe	%fcc0,	loop_613
loop_611:
	tgu	%xcc,	0x6
	for	%f8,	%f10,	%f18
loop_612:
	smul	%i0,	%g6,	%i2
loop_613:
	sethi	0x1616,	%o0
	edge32l	%o6,	%g2,	%i4
	fmovdg	%icc,	%f26,	%f7
	fmovdge	%icc,	%f10,	%f2
	fnors	%f12,	%f4,	%f16
	umulcc	%g7,	0x1F01,	%i6
	fbule	%fcc3,	loop_614
	call	loop_615
	fbge,a	%fcc1,	loop_616
	sub	%l2,	0x19B9,	%i3
loop_614:
	fnot1	%f16,	%f8
loop_615:
	edge16n	%o3,	%o4,	%o1
loop_616:
	andcc	%l3,	%l1,	%o7
	tneg	%xcc,	0x4
	pdist	%f2,	%f18,	%f24
	bneg,a,pt	%icc,	loop_617
	fnors	%f16,	%f16,	%f7
	alignaddr	%g3,	%l0,	%g5
	edge16n	%g1,	%l5,	%i5
loop_617:
	sdivcc	%l6,	0x07D6,	%o5
	fmovsge	%xcc,	%f19,	%f30
	nop
	setx	loop_618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdleu	%xcc,	%f24,	%f3
	xor	%i1,	%i7,	%l4
	fnot2s	%f5,	%f1
loop_618:
	sll	%o2,	%g4,	%i0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i2
	ld	[%l7 + 0x38],	%f7
	tne	%icc,	0x5
	te	%icc,	0x2
	edge32ln	%o0,	%g6,	%g2
	array16	%i4,	%o6,	%g7
	fmovrsgz	%l2,	%f18,	%f29
	set	0x10, %i6
	ldxa	[%g0 + %i6] 0x21,	%i3
	fmovscs	%icc,	%f31,	%f25
	tpos	%icc,	0x1
	udiv	%i6,	0x120C,	%o3
	orn	%o4,	0x1C89,	%o1
	edge8l	%l1,	%l3,	%g3
	fpmerge	%f19,	%f11,	%f2
	tn	%icc,	0x1
	movle	%icc,	%l0,	%o7
	bne,a	%icc,	loop_619
	xnorcc	%g5,	%l5,	%g1
	and	%i5,	%l6,	%i1
	fornot1s	%f16,	%f12,	%f4
loop_619:
	fcmple32	%f22,	%f8,	%i7
	movrlez	%l4,	0x0DA,	%o5
	set	0x378, %i3
	nop 	! 	stxa	%o2,	[%g0 + %i3] 0x40 ripped by fixASI40.pl
	addcc	%g4,	%i2,	%o0
	wr	%g0,	0xe2,	%asi
	stda	%i0,	[%l7 + 0x08] %asi
	membar	#Sync
	tneg	%icc,	0x6
	bvs,a,pt	%xcc,	loop_620
	sethi	0x1411,	%g2
	umulcc	%g6,	0x1DE9,	%i4
	movre	%g7,	%l2,	%o6
loop_620:
	edge8	%i6,	%i3,	%o3
	be,a,pn	%xcc,	loop_621
	fmovrsgez	%o1,	%f28,	%f10
	fandnot2s	%f6,	%f20,	%f2
	bpos	loop_622
loop_621:
	mulx	%l1,	0x024E,	%l3
	ldsb	[%l7 + 0x28],	%o4
	flush	%l7 + 0x38
loop_622:
	nop
	set	0x12, %i1
	lduh	[%l7 + %i1],	%l0
	std	%o6,	[%l7 + 0x20]
	fmovrsgz	%g3,	%f11,	%f7
	sllx	%g5,	0x0C,	%g1
	sll	%l5,	0x1C,	%l6
	fcmpes	%fcc0,	%f29,	%f9
	movrgz	%i5,	0x075,	%i1
	smul	%l4,	0x190E,	%i7
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g4,	%i2,	%o0
	stx	%i0,	[%l7 + 0x48]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%g2
	tpos	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f16,	%f20
	sub	%g7,	0x02C0,	%l2
	edge16n	%o6,	%i4,	%i6
	ldd	[%l7 + 0x30],	%f22
	ldsw	[%l7 + 0x0C],	%i3
	subcc	%o1,	0x0CAC,	%l1
	srl	%o3,	%l3,	%l0
	srax	%o7,	0x0B,	%g3
	orn	%g5,	0x1D32,	%o4
	wr	%g0,	0x89,	%asi
	stwa	%g1,	[%l7 + 0x14] %asi
	sub	%l6,	0x0C01,	%l5
	mova	%icc,	%i5,	%l4
	addccc	%i1,	0x10D3,	%i7
	addccc	%o2,	%g4,	%o5
	movle	%xcc,	%i2,	%o0
	taddcctv	%g6,	0x00B5,	%i0
	fnot1s	%f23,	%f11
	wr	%g0,	0x0c,	%asi
	stha	%g7,	[%l7 + 0x0A] %asi
	fbge	%fcc2,	loop_623
	tpos	%xcc,	0x0
	fors	%f23,	%f5,	%f19
	edge8	%g2,	%l2,	%i4
loop_623:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	stbar
	orncc	%i6,	0x016D,	%i3
	movne	%icc,	%o1,	%l1
	orn	%o3,	%l3,	%o6
	subccc	%o7,	%g3,	%g5
	addc	%o4,	0x0BD4,	%g1
	movvc	%xcc,	%l0,	%l6
	fpackfix	%f30,	%f16
	ta	%xcc,	0x5
	xnorcc	%i5,	%l5,	%l4
	xor	%i7,	0x0B00,	%i1
	array8	%g4,	%o5,	%i2
	movvc	%icc,	%o0,	%o2
	fbl,a	%fcc0,	loop_624
	orncc	%g6,	%g7,	%g2
	brlez	%l2,	loop_625
	movl	%icc,	%i0,	%i4
loop_624:
	subccc	%i3,	%i6,	%o1
	fbn	%fcc0,	loop_626
loop_625:
	fand	%f10,	%f18,	%f12
	fbug	%fcc2,	loop_627
	movleu	%xcc,	%l1,	%o3
loop_626:
	fmovsvs	%xcc,	%f14,	%f22
	fmovrse	%l3,	%f27,	%f16
loop_627:
	movleu	%xcc,	%o6,	%g3
	tsubcctv	%g5,	0x1CA1,	%o4
	tneg	%xcc,	0x4
	ldsb	[%l7 + 0x4A],	%o7
	fnot1s	%f14,	%f1
	fornot2s	%f23,	%f9,	%f1
	array32	%g1,	%l0,	%i5
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x19
	tge	%icc,	0x7
	tge	%xcc,	0x2
	xnor	%l6,	%l5,	%l4
	srlx	%i7,	%g4,	%o5
	set	0x58, %o2
	stxa	%i2,	[%l7 + %o2] 0x2a
	membar	#Sync
	tg	%icc,	0x5
	and	%i1,	0x05AB,	%o2
	fbn,a	%fcc1,	loop_628
	movle	%xcc,	%g6,	%o0
	fnors	%f16,	%f25,	%f23
	fpmerge	%f29,	%f22,	%f30
loop_628:
	tsubcc	%g7,	0x132D,	%l2
	movrlez	%g2,	0x120,	%i0
	ld	[%l7 + 0x5C],	%f28
	array8	%i3,	%i6,	%o1
	movleu	%icc,	%i4,	%l1
	bg,a,pn	%xcc,	loop_629
	fmovrsne	%o3,	%f13,	%f25
	movrne	%l3,	%g3,	%g5
	fbue,a	%fcc3,	loop_630
loop_629:
	movcs	%xcc,	%o4,	%o6
	lduw	[%l7 + 0x60],	%o7
	tneg	%icc,	0x3
loop_630:
	xorcc	%l0,	0x1D6B,	%i5
	fmovdl	%xcc,	%f0,	%f28
	andncc	%g1,	%l5,	%l4
	smul	%l6,	0x1B2A,	%i7
	umulcc	%o5,	%g4,	%i1
	ba	loop_631
	andcc	%i2,	0x06F0,	%g6
	tleu	%icc,	0x0
	nop
	setx loop_632, %l0, %l1
	jmpl %l1, %o2
loop_631:
	bgu,a	%xcc,	loop_633
	fxor	%f14,	%f20,	%f26
	addccc	%o0,	%g7,	%l2
loop_632:
	andn	%i0,	%i3,	%g2
loop_633:
	nop
	set	0x30, %i7
	ldsba	[%l7 + %i7] 0x88,	%i6
	subccc	%o1,	0x1F3D,	%i4
	fbu,a	%fcc1,	loop_634
	addccc	%o3,	%l3,	%g3
	fbu	%fcc3,	loop_635
	addcc	%g5,	0x05EC,	%l1
loop_634:
	fornot1	%f28,	%f12,	%f0
	fmovsg	%icc,	%f0,	%f31
loop_635:
	fmovdne	%xcc,	%f8,	%f28
	tcc	%xcc,	0x4
	andncc	%o4,	%o6,	%l0
	tgu	%xcc,	0x5
	edge8ln	%i5,	%g1,	%o7
	fbn	%fcc1,	loop_636
	andncc	%l4,	%l5,	%l6
	taddcc	%i7,	0x0FCE,	%g4
	tge	%icc,	0x2
loop_636:
	fmovd	%f2,	%f14
	edge16l	%o5,	%i2,	%g6
	movre	%o2,	0x099,	%i1
	taddcc	%g7,	%o0,	%i0
	sethi	0x0D38,	%l2
	add	%g2,	%i6,	%i3
	set	0x70, %l4
	sta	%f17,	[%l7 + %l4] 0x88
	ldsw	[%l7 + 0x70],	%i4
	alignaddr	%o1,	%o3,	%g3
	fnands	%f19,	%f17,	%f29
	edge16n	%g5,	%l1,	%o4
	umulcc	%o6,	%l0,	%l3
	fmovda	%xcc,	%f28,	%f23
	fmovdcc	%xcc,	%f26,	%f0
	lduw	[%l7 + 0x08],	%g1
	edge32ln	%i5,	%l4,	%o7
	ldsh	[%l7 + 0x12],	%l6
	taddcctv	%i7,	%g4,	%l5
	fmovsa	%xcc,	%f30,	%f30
	movg	%icc,	%o5,	%g6
	mulscc	%o2,	%i1,	%i2
	tgu	%xcc,	0x3
	ta	%xcc,	0x5
	sdiv	%g7,	0x0F36,	%i0
	array16	%o0,	%l2,	%i6
	fbue,a	%fcc3,	loop_637
	bgu,pn	%icc,	loop_638
	fnand	%f24,	%f26,	%f16
	tg	%xcc,	0x0
loop_637:
	fpmerge	%f31,	%f5,	%f16
loop_638:
	nop
	wr	%g0,	0x27,	%asi
	stwa	%g2,	[%l7 + 0x28] %asi
	membar	#Sync
	movrgez	%i4,	%i3,	%o1
	subc	%o3,	%g3,	%g5
	ldstub	[%l7 + 0x6B],	%o4
	fsrc2	%f26,	%f28
	tneg	%icc,	0x4
	set	0x50, %g7
	sta	%f21,	[%l7 + %g7] 0x19
	xnor	%l1,	0x0E79,	%o6
	andn	%l3,	%g1,	%l0
	fandnot2	%f24,	%f10,	%f8
	fbue	%fcc3,	loop_639
	movg	%xcc,	%l4,	%o7
	movrgz	%i5,	%l6,	%i7
	fbo	%fcc3,	loop_640
loop_639:
	fbne	%fcc3,	loop_641
	ta	%icc,	0x3
	tl	%icc,	0x0
loop_640:
	sra	%g4,	0x08,	%l5
loop_641:
	sethi	0x1442,	%g6
	fsrc1	%f10,	%f8
	tne	%icc,	0x5
	or	%o2,	0x1F7F,	%i1
	brlez,a	%i2,	loop_642
	xor	%o5,	%g7,	%o0
	fmovscs	%icc,	%f2,	%f26
	sra	%l2,	%i0,	%g2
loop_642:
	sra	%i6,	0x07,	%i4
	subcc	%i3,	%o1,	%o3
	bgu,a	loop_643
	smulcc	%g5,	0x00C9,	%o4
	bvs	loop_644
	movn	%xcc,	%l1,	%o6
loop_643:
	andn	%g3,	%g1,	%l3
	and	%l0,	%l4,	%o7
loop_644:
	sdiv	%i5,	0x1C6D,	%l6
	movcs	%icc,	%g4,	%l5
	movge	%icc,	%g6,	%i7
	edge16l	%i1,	%o2,	%i2
	move	%icc,	%g7,	%o5
	sir	0x02C0
	tl	%icc,	0x5
	sir	0x09F5
	fbuge,a	%fcc3,	loop_645
	call	loop_646
	sra	%l2,	0x0D,	%i0
	and	%g2,	%o0,	%i4
loop_645:
	nop
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_646:
	nop
	setx	loop_647,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%i6,	%i3,	%o1
	move	%icc,	%o3,	%g5
	taddcctv	%o4,	0x0951,	%l1
loop_647:
	tge	%icc,	0x6
	fbn	%fcc1,	loop_648
	movvc	%xcc,	%g3,	%o6
	tg	%icc,	0x4
	fnegd	%f10,	%f2
loop_648:
	fornot1s	%f15,	%f4,	%f6
	movcc	%xcc,	%l3,	%g1
	udivcc	%l4,	0x15E0,	%l0
	movne	%icc,	%o7,	%i5
	st	%f30,	[%l7 + 0x28]
	taddcctv	%g4,	0x07B3,	%l5
	orcc	%g6,	0x109F,	%l6
	udivcc	%i7,	0x1F7E,	%i1
	bn,pn	%icc,	loop_649
	andn	%i2,	0x046C,	%g7
	sllx	%o5,	%o2,	%l2
	fmuld8sux16	%f18,	%f14,	%f0
loop_649:
	movle	%icc,	%i0,	%g2
	fbne,a	%fcc2,	loop_650
	edge16n	%o0,	%i4,	%i3
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
loop_650:
	bn	%xcc,	loop_651
	smul	%i6,	%o3,	%o4
	tgu	%xcc,	0x6
	srlx	%g5,	0x0C,	%g3
loop_651:
	movcs	%xcc,	%o6,	%l1
	add	%g1,	%l3,	%l0
	tge	%icc,	0x7
	subcc	%l4,	%i5,	%g4
	bcs,a,pn	%xcc,	loop_652
	edge16l	%o7,	%g6,	%l6
	tneg	%xcc,	0x3
	tne	%xcc,	0x7
loop_652:
	fmovsge	%xcc,	%f0,	%f31
	fmovse	%xcc,	%f30,	%f1
	fmovrdgez	%l5,	%f0,	%f28
	fnot2s	%f7,	%f19
	ldstub	[%l7 + 0x6C],	%i1
	mulx	%i2,	%i7,	%g7
	stb	%o2,	[%l7 + 0x3D]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l2,	%i0
	taddcc	%o5,	0x19EC,	%o0
	bcc,pt	%xcc,	loop_653
	xnorcc	%g2,	0x1C49,	%i4
	tleu	%icc,	0x6
	fnegd	%f30,	%f22
loop_653:
	fmovdcc	%xcc,	%f0,	%f6
	set	0x48, %i4
	stxa	%o1,	[%l7 + %i4] 0x14
	movcs	%icc,	%i3,	%i6
	fnot2	%f22,	%f8
	fmovse	%icc,	%f1,	%f0
	fmovdle	%icc,	%f19,	%f12
	tn	%icc,	0x6
	std	%f30,	[%l7 + 0x48]
	fnegd	%f4,	%f22
	fmovdneg	%icc,	%f22,	%f27
	fsrc2	%f24,	%f12
	fornot2	%f12,	%f4,	%f22
	set	0x61, %i0
	ldstuba	[%l7 + %i0] 0x18,	%o3
	movge	%xcc,	%g5,	%g3
	fsrc1	%f2,	%f16
	fsrc1	%f8,	%f2
	ldstub	[%l7 + 0x65],	%o4
	fnors	%f21,	%f5,	%f8
	orncc	%o6,	%g1,	%l1
	fbge	%fcc1,	loop_654
	movneg	%xcc,	%l0,	%l4
	fnot2	%f26,	%f18
	ldsh	[%l7 + 0x2E],	%l3
loop_654:
	bleu,a,pn	%xcc,	loop_655
	xorcc	%g4,	%o7,	%g6
	edge32n	%i5,	%l6,	%l5
	fmuld8ulx16	%f19,	%f18,	%f26
loop_655:
	edge16	%i2,	%i1,	%i7
	edge32ln	%o2,	%g7,	%l2
	tgu	%icc,	0x1
	tsubcctv	%o5,	0x0A3B,	%o0
	movvc	%xcc,	%i0,	%g2
	fxors	%f10,	%f27,	%f17
	udivcc	%o1,	0x07CA,	%i3
	movne	%icc,	%i4,	%i6
	call	loop_656
	tgu	%icc,	0x4
	array16	%g5,	%o3,	%g3
	stx	%o6,	[%l7 + 0x58]
loop_656:
	fcmpne32	%f10,	%f2,	%g1
	stbar
	membar	0x44
	lduh	[%l7 + 0x6E],	%o4
	fbule,a	%fcc3,	loop_657
	move	%icc,	%l1,	%l0
	movrlz	%l3,	%l4,	%o7
	fnegs	%f27,	%f12
loop_657:
	movleu	%icc,	%g6,	%g4
	fbue,a	%fcc3,	loop_658
	brnz,a	%i5,	loop_659
	srax	%l5,	%i2,	%l6
	bge,a,pn	%icc,	loop_660
loop_658:
	bge,a	loop_661
loop_659:
	fbo,a	%fcc2,	loop_662
	ld	[%l7 + 0x5C],	%f29
loop_660:
	movleu	%icc,	%i1,	%i7
loop_661:
	fmovsge	%icc,	%f18,	%f29
loop_662:
	taddcc	%g7,	%o2,	%l2
	udivcc	%o5,	0x06A8,	%o0
	fpadd32	%f30,	%f4,	%f18
	move	%icc,	%g2,	%o1
	edge32l	%i3,	%i0,	%i6
	fbug	%fcc3,	loop_663
	addcc	%g5,	0x1B82,	%i4
	wr	%g0,	0x0c,	%asi
	stha	%g3,	[%l7 + 0x52] %asi
loop_663:
	movge	%xcc,	%o6,	%g1
	movne	%icc,	%o3,	%l1
	ble,a	%xcc,	loop_664
	edge32	%l0,	%l3,	%o4
	tgu	%icc,	0x1
	fpadd32s	%f16,	%f28,	%f10
loop_664:
	movrgez	%o7,	%l4,	%g4
	movleu	%icc,	%i5,	%l5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g6
	movrgz	%l6,	%i2,	%i1
	fmovde	%xcc,	%f23,	%f20
	fmul8x16	%f2,	%f16,	%f14
	fbg	%fcc0,	loop_665
	tg	%icc,	0x1
	movn	%xcc,	%i7,	%g7
	move	%xcc,	%o2,	%o5
loop_665:
	fmovsneg	%icc,	%f19,	%f14
	or	%l2,	0x0091,	%g2
	fpack16	%f22,	%f14
	tcc	%xcc,	0x0
	movrne	%o1,	%i3,	%o0
	andncc	%i6,	%g5,	%i4
	sra	%g3,	0x07,	%o6
	movge	%icc,	%g1,	%i0
	sllx	%o3,	0x18,	%l0
	edge8n	%l3,	%o4,	%l1
	sra	%o7,	0x10,	%l4
	bshuffle	%f16,	%f6,	%f12
	tsubcc	%i5,	%l5,	%g4
	ldd	[%l7 + 0x08],	%f14
	udivx	%l6,	0x060B,	%i2
	membar	0x7A
	fmovrdne	%g6,	%f14,	%f30
	tpos	%icc,	0x6
	fmul8x16al	%f25,	%f13,	%f10
	fmovsgu	%xcc,	%f15,	%f19
	nop
	setx	loop_666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%icc,	%i7,	%g7
	tg	%xcc,	0x0
	movvs	%xcc,	%o2,	%o5
loop_666:
	fmovspos	%xcc,	%f2,	%f0
	array16	%i1,	%g2,	%l2
	nop
	setx	loop_667,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ble,a,pn	%xcc,	loop_668
	edge16l	%i3,	%o0,	%o1
	orncc	%g5,	0x1C89,	%i6
loop_667:
	bgu,a	loop_669
loop_668:
	orncc	%g3,	0x0728,	%o6
	edge8l	%g1,	%i0,	%o3
	edge8l	%l0,	%l3,	%i4
loop_669:
	bvs,a	loop_670
	tcs	%xcc,	0x0
	bl,pt	%icc,	loop_671
	sra	%l1,	0x09,	%o7
loop_670:
	fcmpd	%fcc1,	%f24,	%f24
	array32	%o4,	%i5,	%l5
loop_671:
	fmovd	%f10,	%f28
	edge8l	%g4,	%l4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i2,	%i7,	%g6
	orcc	%o2,	0x13B4,	%o5
	alignaddr	%g7,	%i1,	%g2
	movneg	%xcc,	%i3,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l2,	0x0A76,	%o1
	bvs,pt	%icc,	loop_672
	movrlez	%g5,	%i6,	%g3
	tsubcctv	%o6,	0x1E81,	%g1
	movle	%icc,	%i0,	%l0
loop_672:
	fors	%f0,	%f23,	%f11
	edge8l	%l3,	%o3,	%i4
	fmovdge	%icc,	%f21,	%f11
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l1,	[%g0 + 0x1a8] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	udivcc	%o7,	0x04D0,	%i5
	sth	%l5,	[%l7 + 0x50]
	fbn,a	%fcc0,	loop_673
	xnor	%o4,	0x0943,	%l4
	ldx	[%l7 + 0x08],	%g4
	fbuge,a	%fcc1,	loop_674
loop_673:
	xorcc	%l6,	0x03B7,	%i2
	array8	%g6,	%o2,	%o5
	fmovda	%icc,	%f9,	%f9
loop_674:
	sub	%g7,	0x0040,	%i7
	fandnot1	%f26,	%f8,	%f30
	udivx	%i1,	0x0884,	%g2
	fcmpeq16	%f6,	%f2,	%i3
	fmovrsne	%o0,	%f28,	%f27
	fmovrde	%o1,	%f22,	%f18
	fmovsle	%icc,	%f24,	%f6
	edge16l	%g5,	%l2,	%g3
	addccc	%o6,	%g1,	%i6
	bleu	%xcc,	loop_675
	fmul8sux16	%f14,	%f10,	%f22
	te	%icc,	0x3
	fbg	%fcc2,	loop_676
loop_675:
	edge32n	%l0,	%i0,	%o3
	addccc	%i4,	%l3,	%o7
	mulx	%i5,	%l5,	%l1
loop_676:
	fbul	%fcc0,	loop_677
	orcc	%l4,	0x1D5A,	%g4
	movleu	%xcc,	%l6,	%i2
	membar	0x13
loop_677:
	edge32l	%g6,	%o2,	%o5
	subc	%o4,	%g7,	%i7
	fabsd	%f18,	%f10
	orcc	%g2,	%i3,	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%g5
	lduw	[%l7 + 0x30],	%i1
	mulx	%l2,	%g3,	%o6
	fcmple16	%f26,	%f24,	%g1
	movrlez	%l0,	0x372,	%i6
	edge32n	%o3,	%i4,	%l3
	fnot1s	%f9,	%f11
	set	0x70, %l1
	lduwa	[%l7 + %l1] 0x18,	%o7
	tne	%icc,	0x0
	movpos	%xcc,	%i0,	%l5
	fmovrde	%i5,	%f6,	%f0
	fsrc1s	%f14,	%f24
	subcc	%l4,	%g4,	%l1
	bg,pn	%icc,	loop_678
	tneg	%xcc,	0x2
	edge32n	%i2,	%g6,	%o2
	xnorcc	%l6,	0x1F62,	%o4
loop_678:
	subcc	%o5,	0x13E4,	%g7
	andn	%g2,	%i7,	%o0
	fmul8ulx16	%f16,	%f28,	%f4
	membar	0x52
	tpos	%icc,	0x0
	sethi	0x1028,	%o1
	tleu	%xcc,	0x6
	fpsub32	%f10,	%f30,	%f22
	edge16	%i3,	%g5,	%i1
	fmuld8ulx16	%f14,	%f14,	%f14
	fbl	%fcc0,	loop_679
	bpos,a	loop_680
	fmovse	%xcc,	%f0,	%f8
	move	%xcc,	%l2,	%o6
loop_679:
	fpmerge	%f25,	%f7,	%f22
loop_680:
	andn	%g3,	%g1,	%i6
	fxnor	%f16,	%f12,	%f28
	ld	[%l7 + 0x44],	%f15
	brz	%l0,	loop_681
	tpos	%icc,	0x0
	subcc	%i4,	%l3,	%o3
	edge16	%i0,	%o7,	%l5
loop_681:
	addccc	%l4,	0x0872,	%i5
	tcs	%xcc,	0x3
	faligndata	%f6,	%f12,	%f14
	ldstub	[%l7 + 0x2C],	%l1
	add	%i2,	%g4,	%g6
	movrgz	%o2,	0x3E1,	%l6
	nop
	setx	loop_682,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%o5,	%g7,	%g2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%o0
loop_682:
	tcs	%xcc,	0x5
	tl	%xcc,	0x0
	fble,a	%fcc2,	loop_683
	movrgez	%i7,	%i3,	%g5
	edge16n	%i1,	%l2,	%o6
	movge	%xcc,	%o1,	%g3
loop_683:
	fmovdle	%xcc,	%f8,	%f19
	subccc	%g1,	0x0123,	%i6
	sllx	%i4,	%l0,	%l3
	prefetch	[%l7 + 0x58],	 0x1
	sll	%o3,	0x16,	%i0
	edge32n	%o7,	%l5,	%i5
	umulcc	%l4,	0x1830,	%i2
	fbge	%fcc3,	loop_684
	andncc	%l1,	%g4,	%g6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%o2
loop_684:
	stb	%o5,	[%l7 + 0x39]
	xnor	%l6,	%g7,	%o4
	edge32	%g2,	%o0,	%i3
	movge	%icc,	%g5,	%i7
	movvs	%xcc,	%l2,	%i1
	taddcc	%o6,	0x1475,	%g3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%o1
	fmovdleu	%icc,	%f24,	%f31
	fone	%f28
	or	%g1,	%i4,	%i6
	brlz,a	%l0,	loop_685
	sth	%o3,	[%l7 + 0x76]
	bne,a,pn	%xcc,	loop_686
	edge32	%l3,	%i0,	%o7
loop_685:
	fmovdneg	%xcc,	%f17,	%f31
	udiv	%l5,	0x0358,	%i5
loop_686:
	fmovdle	%icc,	%f27,	%f27
	orn	%l4,	%l1,	%g4
	sll	%g6,	%o2,	%i2
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x54, %l5
	sta	%f7,	[%l7 + %l5] 0x88
	nop
	set	0x58, %l6
	prefetch	[%l7 + %l6],	 0x1
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x2b,	%o4
	srax	%l6,	0x1D,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o4,	%o0
	te	%xcc,	0x6
	srl	%i3,	0x01,	%g2
	orcc	%g5,	0x11E5,	%i7
	edge8n	%i1,	%l2,	%o6
	xor	%o1,	0x010F,	%g1
	fcmpd	%fcc0,	%f6,	%f28
	fbuge,a	%fcc1,	loop_687
	fpack16	%f16,	%f19
	subcc	%g3,	0x0ED7,	%i6
	brlez,a	%i4,	loop_688
loop_687:
	bg,a	%xcc,	loop_689
	fmovspos	%xcc,	%f0,	%f10
	brgez,a	%l0,	loop_690
loop_688:
	orcc	%o3,	%i0,	%l3
loop_689:
	edge16n	%o7,	%i5,	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l5,	%g4
loop_690:
	xor	%l1,	%g6,	%i2
	fcmple16	%f10,	%f24,	%o2
	array8	%l6,	%o5,	%o4
	subcc	%o0,	%g7,	%g2
	sth	%i3,	[%l7 + 0x50]
	edge8ln	%i7,	%i1,	%l2
	movrne	%g5,	0x15F,	%o1
	stbar
	fbul,a	%fcc0,	loop_691
	fpsub16	%f14,	%f28,	%f10
	tsubcctv	%o6,	%g3,	%i6
	movleu	%icc,	%g1,	%l0
loop_691:
	or	%o3,	0x0F46,	%i0
	fcmps	%fcc1,	%f0,	%f24
	movl	%icc,	%i4,	%o7
	srl	%l3,	%i5,	%l4
	tsubcctv	%l5,	%g4,	%g6
	udivcc	%i2,	0x0AFE,	%o2
	fabss	%f18,	%f19
	nop
	setx	loop_692,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%l6,	%l1,	%o5
	edge16ln	%o0,	%g7,	%o4
	fmovrde	%g2,	%f24,	%f2
loop_692:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%i3,	[%l7 + 0x2C] %asi
	brz	%i1,	loop_693
	fpadd32	%f22,	%f30,	%f8
	tcc	%xcc,	0x1
	subcc	%l2,	%i7,	%o1
loop_693:
	sethi	0x10D4,	%o6
	orncc	%g3,	%i6,	%g1
	fcmpgt16	%f18,	%f22,	%g5
	ldd	[%l7 + 0x08],	%o2
	stb	%l0,	[%l7 + 0x30]
	fabsd	%f2,	%f0
	nop
	setx loop_694, %l0, %l1
	jmpl %l1, %i0
	fandnot1	%f16,	%f0,	%f24
	brlez	%i4,	loop_695
	movrne	%l3,	%o7,	%l4
loop_694:
	bcc	%icc,	loop_696
	movvs	%icc,	%i5,	%l5
loop_695:
	fabss	%f14,	%f0
	xor	%g4,	%i2,	%o2
loop_696:
	bgu,pn	%icc,	loop_697
	srlx	%l6,	%l1,	%o5
	st	%f16,	[%l7 + 0x18]
	fandnot2	%f10,	%f16,	%f4
loop_697:
	fmovdle	%icc,	%f28,	%f16
	xnor	%g6,	0x09C4,	%o0
	addc	%g7,	0x117A,	%g2
	sra	%o4,	0x05,	%i3
	ldstub	[%l7 + 0x78],	%i1
	tle	%icc,	0x7
	bleu,pt	%icc,	loop_698
	edge8n	%i7,	%l2,	%o1
	alignaddr	%o6,	%g3,	%g1
	fones	%f11
loop_698:
	andn	%i6,	0x13C0,	%o3
	edge16ln	%g5,	%l0,	%i0
	movge	%xcc,	%i4,	%o7
	fblg,a	%fcc2,	loop_699
	taddcc	%l4,	%i5,	%l3
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g4
loop_699:
	orncc	%l5,	0x0CA4,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%l1
	fpadd32	%f22,	%f4,	%f24
	orcc	%l6,	%o5,	%g6
	fbg	%fcc0,	loop_700
	fmovrslez	%o0,	%f0,	%f13
	alignaddr	%g2,	%o4,	%i3
	fmovscs	%xcc,	%f18,	%f12
loop_700:
	sra	%i1,	%g7,	%i7
	bneg,pn	%icc,	loop_701
	move	%icc,	%o1,	%l2
	movcs	%icc,	%g3,	%o6
	movvc	%xcc,	%i6,	%g1
loop_701:
	edge32n	%o3,	%l0,	%i0
	or	%i4,	0x12D6,	%g5
	brgez,a	%l4,	loop_702
	subc	%i5,	%l3,	%g4
	set	0x0C, %o0
	ldswa	[%l7 + %o0] 0x80,	%o7
loop_702:
	fbug	%fcc2,	loop_703
	fpmerge	%f11,	%f8,	%f16
	fbl,a	%fcc1,	loop_704
	fbge	%fcc3,	loop_705
loop_703:
	fnegs	%f29,	%f29
	sdivcc	%i2,	0x0EEB,	%o2
loop_704:
	fmovde	%xcc,	%f9,	%f31
loop_705:
	brgez	%l1,	loop_706
	fmovsne	%icc,	%f8,	%f22
	movrlz	%l5,	%l6,	%g6
	andn	%o0,	%o5,	%o4
loop_706:
	udiv	%i3,	0x14F2,	%i1
	movre	%g7,	0x3DC,	%i7
	fnegd	%f0,	%f22
	movcc	%xcc,	%o1,	%g2
	edge32	%g3,	%o6,	%l2
	ld	[%l7 + 0x10],	%f29
	sdivcc	%g1,	0x043B,	%o3
	edge32n	%l0,	%i0,	%i6
	and	%i4,	0x1685,	%g5
	tgu	%icc,	0x5
	fmovse	%icc,	%f30,	%f22
	orn	%i5,	%l3,	%l4
	tcc	%xcc,	0x5
	tcc	%icc,	0x5
	movrgez	%g4,	0x21B,	%i2
	movleu	%xcc,	%o2,	%o7
	swap	[%l7 + 0x08],	%l5
	movgu	%xcc,	%l1,	%g6
	bleu,pn	%xcc,	loop_707
	fmovrslz	%l6,	%f31,	%f9
	alignaddr	%o0,	%o4,	%o5
	srl	%i3,	%g7,	%i1
loop_707:
	fcmpeq32	%f6,	%f18,	%i7
	tsubcctv	%g2,	%g3,	%o1
	edge16l	%o6,	%g1,	%o3
	wr	%g0,	0x2f,	%asi
	stda	%l0,	[%l7 + 0x08] %asi
	membar	#Sync
	mova	%icc,	%l2,	%i6
	fmovdvc	%xcc,	%f26,	%f5
	sub	%i0,	%g5,	%i5
	fmovsa	%xcc,	%f12,	%f12
	sll	%l3,	0x19,	%i4
	fzeros	%f11
	array16	%l4,	%g4,	%i2
	sub	%o7,	%o2,	%l1
	alignaddrl	%g6,	%l6,	%o0
	subcc	%o4,	%l5,	%o5
	sdivx	%i3,	0x1A02,	%i1
	fpackfix	%f28,	%f16
	fmovrdlez	%g7,	%f6,	%f10
	fnand	%f16,	%f12,	%f2
	umul	%i7,	0x1EC2,	%g3
	andn	%o1,	%g2,	%o6
	brgz	%g1,	loop_708
	subc	%o3,	%l0,	%i6
	fmovrdlz	%i0,	%f24,	%f10
	addccc	%l2,	0x06C9,	%g5
loop_708:
	bleu,pt	%xcc,	loop_709
	fand	%f30,	%f12,	%f26
	movrgz	%i5,	0x33C,	%l3
	edge8ln	%i4,	%l4,	%i2
loop_709:
	edge16	%o7,	%g4,	%l1
	move	%icc,	%g6,	%o2
	movge	%icc,	%o0,	%l6
	mulscc	%o4,	%l5,	%i3
	movrlez	%o5,	0x225,	%g7
	bn,a,pn	%icc,	loop_710
	edge16	%i7,	%i1,	%g3
	nop
	setx	loop_711,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%o1,	%g2
loop_710:
	brlez	%o6,	loop_712
	edge16l	%o3,	%l0,	%g1
loop_711:
	fmovsle	%icc,	%f0,	%f25
	fcmple16	%f8,	%f22,	%i6
loop_712:
	move	%xcc,	%l2,	%i0
	fcmpne32	%f6,	%f12,	%g5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x1D] %asi,	%i5
	fble	%fcc1,	loop_713
	brgez,a	%i4,	loop_714
	movleu	%icc,	%l3,	%l4
	tge	%xcc,	0x6
loop_713:
	movne	%xcc,	%o7,	%i2
loop_714:
	fcmps	%fcc0,	%f1,	%f3
	fexpand	%f29,	%f16
	smul	%l1,	%g4,	%o2
	tgu	%icc,	0x0
	brlez,a	%o0,	loop_715
	tsubcc	%g6,	0x0F5D,	%o4
	xnorcc	%l6,	%i3,	%l5
	array32	%g7,	%o5,	%i7
loop_715:
	fpackfix	%f28,	%f5
	srl	%g3,	0x09,	%o1
	orcc	%g2,	%o6,	%i1
	set	0x6F, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o3
	st	%f17,	[%l7 + 0x5C]
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x14,	%l0
	smulcc	%g1,	%l2,	%i0
	srl	%i6,	0x0D,	%i5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x62] %asi,	%i4
	movl	%icc,	%g5,	%l3
	fones	%f14
	fbn	%fcc0,	loop_716
	fmovdleu	%xcc,	%f18,	%f21
	taddcc	%l4,	%i2,	%o7
	subcc	%g4,	%l1,	%o2
loop_716:
	tvs	%icc,	0x7
	ldub	[%l7 + 0x55],	%g6
	fmovsn	%icc,	%f21,	%f12
	mova	%xcc,	%o4,	%o0
	ld	[%l7 + 0x14],	%f31
	lduw	[%l7 + 0x60],	%i3
	siam	0x0
	brgez	%l5,	loop_717
	movg	%xcc,	%l6,	%g7
	xor	%i7,	%o5,	%g3
	faligndata	%f12,	%f8,	%f8
loop_717:
	subcc	%o1,	0x1504,	%o6
	set	0x28, %o5
	stda	%i0,	[%l7 + %o5] 0x81
	add	%g2,	%o3,	%l0
	sdivx	%l2,	0x02DE,	%g1
	sub	%i0,	0x0892,	%i5
	tpos	%xcc,	0x5
	tge	%icc,	0x2
	bge,a	%xcc,	loop_718
	movrgz	%i4,	0x0A4,	%i6
	tvc	%xcc,	0x6
	smulcc	%l3,	%g5,	%l4
loop_718:
	fmovde	%icc,	%f11,	%f13
	edge8l	%o7,	%g4,	%i2
	tneg	%xcc,	0x0
	edge32	%o2,	%l1,	%g6
	taddcctv	%o4,	%i3,	%l5
	array16	%l6,	%g7,	%o0
	fmovdleu	%icc,	%f14,	%f21
	bneg,a	%icc,	loop_719
	movn	%xcc,	%o5,	%i7
	smulcc	%g3,	0x1B1E,	%o1
	mova	%icc,	%i1,	%o6
loop_719:
	fpsub16s	%f12,	%f3,	%f28
	tgu	%xcc,	0x2
	fbul	%fcc1,	loop_720
	sir	0x0381
	fnors	%f3,	%f6,	%f15
	set	0x7F, %i5
	ldstuba	[%l7 + %i5] 0x18,	%g2
loop_720:
	and	%o3,	0x1B84,	%l0
	movgu	%xcc,	%g1,	%l2
	stw	%i5,	[%l7 + 0x5C]
	flush	%l7 + 0x40
	brz,a	%i4,	loop_721
	fcmpes	%fcc1,	%f13,	%f18
	bn,a,pt	%icc,	loop_722
	faligndata	%f30,	%f24,	%f24
loop_721:
	fand	%f4,	%f4,	%f26
	stb	%i6,	[%l7 + 0x23]
loop_722:
	fbo,a	%fcc3,	loop_723
	subcc	%i0,	%g5,	%l3
	bcs,a	loop_724
	orn	%o7,	0x0B67,	%g4
loop_723:
	tcc	%icc,	0x0
	move	%xcc,	%l4,	%i2
loop_724:
	udiv	%l1,	0x1C31,	%o2
	fmovsn	%xcc,	%f31,	%f17
	mova	%icc,	%o4,	%g6
	fmovdcc	%xcc,	%f3,	%f5
	fmovrse	%l5,	%f28,	%f2
	alignaddrl	%i3,	%g7,	%o0
	movn	%icc,	%l6,	%i7
	movrgez	%o5,	%o1,	%i1
	andncc	%g3,	%o6,	%g2
	movleu	%xcc,	%o3,	%g1
	fnegs	%f19,	%f12
	movleu	%icc,	%l0,	%i5
	fnegs	%f17,	%f24
	subcc	%i4,	0x1FC0,	%l2
	addccc	%i0,	0x17A7,	%i6
	smul	%g5,	%l3,	%g4
	sdivcc	%o7,	0x1916,	%l4
	orn	%i2,	%l1,	%o4
	ldd	[%l7 + 0x10],	%f16
	fmovdge	%xcc,	%f28,	%f4
	brgz	%o2,	loop_725
	ldstub	[%l7 + 0x59],	%l5
	fxnors	%f20,	%f17,	%f22
	srax	%i3,	0x16,	%g6
loop_725:
	alignaddr	%g7,	%o0,	%i7
	umul	%o5,	0x1C3F,	%l6
	nop
	setx loop_726, %l0, %l1
	jmpl %l1, %i1
	xnor	%o1,	0x14E5,	%g3
	fbuge,a	%fcc3,	loop_727
	fmovrde	%o6,	%f28,	%f0
loop_726:
	movre	%o3,	%g2,	%l0
	lduw	[%l7 + 0x48],	%g1
loop_727:
	siam	0x6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x50] %asi,	%i4
	tleu	%xcc,	0x1
	be,pt	%icc,	loop_728
	addccc	%i5,	%l2,	%i0
	xnorcc	%g5,	0x190A,	%l3
	array32	%i6,	%o7,	%g4
loop_728:
	mova	%xcc,	%l4,	%i2
	tvc	%icc,	0x6
	edge32	%l1,	%o2,	%o4
	fornot1	%f8,	%f14,	%f8
	sdivcc	%i3,	0x117D,	%l5
	edge8n	%g7,	%o0,	%g6
	fmovspos	%icc,	%f27,	%f4
	andcc	%i7,	0x1643,	%l6
	edge16n	%i1,	%o1,	%g3
	tle	%icc,	0x4
	edge16	%o5,	%o6,	%g2
	fmovdvc	%xcc,	%f9,	%f16
	movrgez	%l0,	0x2A3,	%g1
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x44] %asi,	%i4
	ta	%icc,	0x4
	movcc	%xcc,	%i5,	%l2
	fsrc2s	%f12,	%f17
	ldstub	[%l7 + 0x6E],	%o3
	fmuld8sux16	%f2,	%f8,	%f16
	orcc	%g5,	%l3,	%i0
	taddcc	%o7,	%i6,	%l4
	stbar
	membar	0x7B
	fmovsn	%icc,	%f25,	%f8
	fmovdgu	%xcc,	%f0,	%f16
	fbge	%fcc1,	loop_729
	tneg	%xcc,	0x4
	tle	%xcc,	0x2
	mulx	%i2,	0x0937,	%g4
loop_729:
	bleu,pt	%xcc,	loop_730
	tsubcctv	%o2,	0x1951,	%o4
	fexpand	%f18,	%f30
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
loop_730:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l5
	te	%xcc,	0x3
	sethi	0x0155,	%g7
	fbue	%fcc3,	loop_731
	movrlez	%o0,	0x20A,	%g6
	smulcc	%i7,	0x17E4,	%l6
	call	loop_732
loop_731:
	fbe,a	%fcc1,	loop_733
	srax	%i1,	0x1F,	%i3
	brgz,a	%o1,	loop_734
loop_732:
	udiv	%o5,	0x1EB3,	%o6
loop_733:
	tne	%xcc,	0x7
	sll	%g3,	0x0F,	%l0
loop_734:
	fzeros	%f6
	tsubcctv	%g1,	%i4,	%i5
	addc	%l2,	%o3,	%g2
	fbu,a	%fcc1,	loop_735
	movrlez	%l3,	%i0,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i6,	%o7
loop_735:
	membar	0x32
	fmovdvs	%xcc,	%f9,	%f24
	array32	%l4,	%g4,	%o2
	fbu	%fcc3,	loop_736
	orcc	%o4,	%l1,	%i2
	bl,a,pt	%xcc,	loop_737
	be,a,pt	%icc,	loop_738
loop_736:
	ta	%xcc,	0x2
	fnegd	%f8,	%f30
loop_737:
	bvs	%xcc,	loop_739
loop_738:
	edge8ln	%l5,	%g7,	%g6
	taddcc	%i7,	%l6,	%i1
	fmul8sux16	%f14,	%f12,	%f24
loop_739:
	edge16n	%i3,	%o0,	%o1
	movcc	%icc,	%o5,	%g3
	fpadd16	%f14,	%f4,	%f18
	fbo	%fcc1,	loop_740
	ld	[%l7 + 0x3C],	%f14
	set	0x110, %g3
	stxa	%l0,	[%g0 + %g3] 0x52
loop_740:
	orn	%o6,	%g1,	%i4
	tvs	%xcc,	0x5
	nop
	setx	loop_741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bleu	loop_742
	fmovrslez	%i5,	%f12,	%f28
	sllx	%o3,	%g2,	%l2
loop_741:
	orcc	%l3,	%i0,	%i6
loop_742:
	fmovrslez	%o7,	%f27,	%f20
	addcc	%l4,	%g5,	%g4
	ta	%icc,	0x2
	orn	%o4,	%o2,	%l1
	std	%f6,	[%l7 + 0x50]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i2,	%l5
	fmovrsne	%g7,	%f1,	%f4
	tcs	%xcc,	0x0
	fbul,a	%fcc2,	loop_743
	fbo	%fcc3,	loop_744
	add	%g6,	%l6,	%i1
	edge8l	%i3,	%o0,	%i7
loop_743:
	tvs	%icc,	0x0
loop_744:
	orcc	%o5,	0x1D2F,	%o1
	fmovrsgez	%g3,	%f25,	%f30
	tne	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f10,	%f0,	%f12
	fnands	%f16,	%f6,	%f13
	orcc	%l0,	0x0DBA,	%g1
	mulx	%o6,	0x0F4C,	%i4
	mulx	%o3,	0x0804,	%g2
	nop
	setx loop_745, %l0, %l1
	jmpl %l1, %i5
	mulx	%l2,	0x0BEF,	%l3
	brgez	%i0,	loop_746
	be,a	%icc,	loop_747
loop_745:
	tl	%xcc,	0x5
	subccc	%o7,	%l4,	%g5
loop_746:
	and	%i6,	%g4,	%o4
loop_747:
	sethi	0x098C,	%l1
	addc	%i2,	0x07A7,	%o2
	fbg,a	%fcc1,	loop_748
	tsubcctv	%g7,	%g6,	%l5
	fmul8sux16	%f2,	%f0,	%f30
	orcc	%i1,	%i3,	%l6
loop_748:
	fble,a	%fcc0,	loop_749
	fmovsa	%icc,	%f13,	%f11
	te	%xcc,	0x5
	fmovdvc	%icc,	%f25,	%f1
loop_749:
	tleu	%xcc,	0x2
	andn	%o0,	0x03A5,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f8,	%f24
	bg	%icc,	loop_750
	array16	%o1,	%g3,	%l0
	fmul8sux16	%f30,	%f16,	%f20
	tne	%xcc,	0x0
loop_750:
	edge8ln	%i7,	%g1,	%i4
	fornot1	%f22,	%f12,	%f22
	bpos,a	%icc,	loop_751
	andcc	%o3,	%o6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l2,	%g2,	%l3
loop_751:
	tcs	%icc,	0x0
	pdist	%f2,	%f4,	%f6
	mulx	%o7,	0x01C8,	%l4
	ldub	[%l7 + 0x28],	%i0
	stx	%i6,	[%l7 + 0x10]
	fnegs	%f8,	%f21
	smulcc	%g4,	%g5,	%l1
	edge32l	%i2,	%o4,	%o2
	fmovsn	%icc,	%f3,	%f9
	fmovrslez	%g6,	%f19,	%f23
	membar	0x58
	tgu	%icc,	0x1
	fornot1	%f24,	%f14,	%f26
	udivx	%l5,	0x034B,	%i1
	movg	%xcc,	%g7,	%l6
	edge32n	%o0,	%i3,	%o1
	nop
	setx	loop_752,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%icc,	%g3,	%l0
	movgu	%xcc,	%i7,	%o5
	brlez	%g1,	loop_753
loop_752:
	subccc	%i4,	0x1C52,	%o3
	addccc	%i5,	0x1C85,	%o6
	fsrc2s	%f18,	%f27
loop_753:
	addcc	%l2,	%l3,	%o7
	brlez	%g2,	loop_754
	fpack16	%f24,	%f27
	mulscc	%i0,	0x1C91,	%i6
	flush	%l7 + 0x6C
loop_754:
	tpos	%xcc,	0x5
	movrgez	%g4,	0x0BA,	%l4
	edge16ln	%g5,	%i2,	%l1
	sra	%o2,	0x10,	%g6
	edge32n	%o4,	%l5,	%g7
	movrlez	%i1,	%o0,	%l6
	fmovdge	%xcc,	%f30,	%f13
	edge32n	%i3,	%g3,	%o1
	be,a	%icc,	loop_755
	movrne	%l0,	%i7,	%o5
	fbug,a	%fcc2,	loop_756
	fmovsne	%icc,	%f1,	%f28
loop_755:
	mulx	%g1,	0x08C2,	%i4
	tvc	%xcc,	0x6
loop_756:
	ldd	[%l7 + 0x10],	%f16
	sub	%i5,	0x0157,	%o3
	edge8ln	%o6,	%l3,	%l2
	edge32ln	%o7,	%i0,	%g2
	tle	%xcc,	0x0
	edge16l	%i6,	%g4,	%l4
	edge16l	%g5,	%i2,	%l1
	set	0x20, %g2
	stxa	%g6,	[%l7 + %g2] 0xeb
	membar	#Sync
	fsrc1s	%f14,	%f9
	udivcc	%o2,	0x0465,	%l5
	tneg	%icc,	0x4
	addc	%o4,	0x1DD1,	%i1
	andcc	%g7,	%l6,	%o0
	subccc	%i3,	%g3,	%o1
	srlx	%l0,	0x1F,	%i7
	sir	0x1E36
	xnor	%o5,	%g1,	%i5
	nop
	setx loop_757, %l0, %l1
	jmpl %l1, %o3
	fpadd32	%f8,	%f4,	%f22
	fmovspos	%xcc,	%f16,	%f1
	srlx	%i4,	%l3,	%l2
loop_757:
	fmovsa	%xcc,	%f5,	%f19
	ldd	[%l7 + 0x30],	%f16
	st	%f1,	[%l7 + 0x24]
	nop
	setx loop_758, %l0, %l1
	jmpl %l1, %o6
	sdiv	%i0,	0x1A9E,	%g2
	stw	%o7,	[%l7 + 0x74]
	edge16	%i6,	%g4,	%g5
loop_758:
	fcmpeq32	%f24,	%f30,	%i2
	sub	%l4,	%l1,	%o2
	movn	%icc,	%l5,	%g6
	xnor	%i1,	%g7,	%o4
	movrgez	%l6,	%i3,	%g3
	fbo,a	%fcc0,	loop_759
	fmovsne	%icc,	%f14,	%f29
	brgez,a	%o0,	loop_760
	bcs,a,pt	%icc,	loop_761
loop_759:
	fmuld8sux16	%f27,	%f12,	%f8
	movle	%icc,	%l0,	%o1
loop_760:
	subcc	%o5,	%g1,	%i5
loop_761:
	array8	%i7,	%i4,	%l3
	sth	%o3,	[%l7 + 0x6E]
	sdivcc	%l2,	0x092B,	%o6
	for	%f0,	%f16,	%f6
	fmovrdgz	%i0,	%f0,	%f26
	bn,pn	%icc,	loop_762
	fmovsneg	%xcc,	%f12,	%f18
	ldsh	[%l7 + 0x46],	%o7
	tleu	%icc,	0x0
loop_762:
	brlez	%g2,	loop_763
	fzeros	%f12
	sub	%g4,	%i6,	%g5
	bleu,a	%icc,	loop_764
loop_763:
	edge16n	%i2,	%l1,	%o2
	array32	%l5,	%g6,	%i1
	membar	0x56
loop_764:
	brlz	%l4,	loop_765
	fpsub16	%f28,	%f28,	%f4
	tneg	%icc,	0x6
	taddcc	%g7,	%o4,	%i3
loop_765:
	xnorcc	%l6,	0x12B1,	%g3
	edge32ln	%l0,	%o0,	%o5
	movl	%icc,	%g1,	%i5
	set	0x60, %o3
	sta	%f28,	[%l7 + %o3] 0x19
	edge16l	%o1,	%i7,	%i4
	edge8ln	%o3,	%l2,	%o6
	tge	%xcc,	0x5
	andn	%l3,	0x0400,	%i0
	fcmple32	%f10,	%f0,	%o7
	fmovdvs	%xcc,	%f1,	%f16
	bcc	%xcc,	loop_766
	movcs	%icc,	%g2,	%i6
	edge32l	%g4,	%g5,	%l1
	tl	%icc,	0x6
loop_766:
	edge16	%o2,	%i2,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i1,	%l5,	%l4
	taddcctv	%g7,	0x1196,	%i3
	fpsub32	%f14,	%f6,	%f16
	edge16l	%l6,	%o4,	%g3
	tcs	%icc,	0x3
	movneg	%icc,	%o0,	%o5
	tsubcc	%l0,	%g1,	%i5
	movrgz	%o1,	%i7,	%o3
	alignaddrl	%i4,	%l2,	%o6
	fbge	%fcc1,	loop_767
	ta	%xcc,	0x5
	fmovdvc	%icc,	%f26,	%f16
	membar	0x20
loop_767:
	sdivx	%l3,	0x1413,	%o7
	bn	%xcc,	loop_768
	fbge	%fcc2,	loop_769
	movpos	%icc,	%i0,	%g2
	edge8n	%i6,	%g5,	%g4
loop_768:
	fsrc2s	%f27,	%f29
loop_769:
	mova	%xcc,	%o2,	%l1
	movneg	%xcc,	%i2,	%i1
	sethi	0x0027,	%g6
	edge32ln	%l4,	%l5,	%g7
	te	%icc,	0x3
	alignaddr	%l6,	%i3,	%o4
	bcs,a,pn	%icc,	loop_770
	ldd	[%l7 + 0x30],	%o0
	te	%icc,	0x6
	movle	%xcc,	%g3,	%l0
loop_770:
	fors	%f22,	%f12,	%f27
	edge16n	%o5,	%i5,	%g1
	movrlz	%i7,	%o1,	%i4
	ba,a	loop_771
	fmovscs	%xcc,	%f27,	%f24
	subcc	%o3,	%l2,	%o6
	fmovdl	%xcc,	%f3,	%f11
loop_771:
	brz,a	%o7,	loop_772
	fcmpeq16	%f14,	%f26,	%l3
	movpos	%icc,	%g2,	%i0
	subccc	%g5,	%i6,	%g4
loop_772:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%o2
	edge8ln	%l1,	%i2,	%i1
	array8	%g6,	%l4,	%l5
	andn	%l6,	0x1D5B,	%g7
	xnorcc	%i3,	0x0B06,	%o4
	fmovrdlez	%g3,	%f24,	%f22
	addc	%o0,	0x1199,	%l0
	ba,a	%icc,	loop_773
	fmul8x16	%f5,	%f20,	%f10
	fmovrdne	%o5,	%f8,	%f18
	taddcc	%g1,	%i7,	%o1
loop_773:
	srl	%i4,	%o3,	%i5
	array16	%l2,	%o7,	%o6
	sdivcc	%g2,	0x1F5A,	%i0
	add	%g5,	0x1967,	%l3
	fbl,a	%fcc0,	loop_774
	fmovsle	%icc,	%f31,	%f9
	fmovd	%f16,	%f0
	taddcc	%g4,	%o2,	%i6
loop_774:
	or	%i2,	%i1,	%g6
	bvs,a	loop_775
	srax	%l1,	%l4,	%l6
	movge	%xcc,	%l5,	%i3
	fmovsleu	%icc,	%f14,	%f30
loop_775:
	movrgez	%o4,	%g3,	%o0
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fbge	%fcc0,	loop_776
	fmovrdlz	%o5,	%f8,	%f26
	sethi	0x0299,	%l0
	sll	%i7,	0x1E,	%o1
loop_776:
	xnor	%g1,	%i4,	%o3
	fands	%f25,	%f21,	%f8
	sdiv	%l2,	0x0813,	%i5
	ta	%icc,	0x3
	tne	%icc,	0x1
	movre	%o6,	0x1C1,	%g2
	alignaddrl	%o7,	%g5,	%l3
	stx	%g4,	[%l7 + 0x38]
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	taddcctv	%o2,	0x07E4,	%i6
	bleu,a,pn	%xcc,	loop_777
	movge	%xcc,	%i2,	%i1
	set	0x50, %o7
	lda	[%l7 + %o7] 0x0c,	%f3
loop_777:
	edge8ln	%i0,	%l1,	%l4
	ldd	[%l7 + 0x10],	%f16
	fabss	%f1,	%f12
	xor	%g6,	%l5,	%i3
	xnorcc	%l6,	0x1C7F,	%g3
	lduw	[%l7 + 0x60],	%o0
	tvs	%xcc,	0x4
	fblg,a	%fcc3,	loop_778
	sth	%o4,	[%l7 + 0x5E]
	bshuffle	%f12,	%f22,	%f18
	smul	%o5,	%l0,	%g7
loop_778:
	nop
	setx	loop_779,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%i7,	0x1636,	%g1
	fmul8x16	%f16,	%f2,	%f12
	edge32l	%i4,	%o1,	%o3
loop_779:
	sdiv	%l2,	0x1431,	%o6
	tpos	%xcc,	0x4
	fbn	%fcc1,	loop_780
	edge16l	%i5,	%g2,	%g5
	wr	%g0,	0x19,	%asi
	sta	%f24,	[%l7 + 0x7C] %asi
loop_780:
	tvc	%icc,	0x7
	movcs	%xcc,	%o7,	%g4
	std	%o2,	[%l7 + 0x28]
	fmovdcs	%xcc,	%f14,	%f20
	edge16	%l3,	%i6,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%i2,	loop_781
	sllx	%l1,	%i0,	%g6
	sllx	%l4,	0x13,	%i3
	ble	%xcc,	loop_782
loop_781:
	mova	%icc,	%l5,	%l6
	smulcc	%o0,	0x08DE,	%o4
	fornot2	%f12,	%f0,	%f14
loop_782:
	mulx	%o5,	0x15BD,	%g3
	fsrc2s	%f12,	%f21
	movleu	%icc,	%l0,	%g7
	brlez	%i7,	loop_783
	nop
	setx	loop_784,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%xcc,	%i4,	%o1
	movre	%o3,	0x3A1,	%g1
loop_783:
	fmovdvs	%icc,	%f5,	%f20
loop_784:
	alignaddr	%l2,	%i5,	%o6
	tn	%icc,	0x3
	fcmpne16	%f28,	%f14,	%g2
	edge8ln	%g5,	%g4,	%o7
	fzero	%f26
	pdist	%f6,	%f8,	%f18
	movre	%l3,	%o2,	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%i2
	taddcctv	%i0,	0x068D,	%l1
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x04,	%l4
	fmovs	%f22,	%f11
	tgu	%xcc,	0x7
	fmul8x16al	%f9,	%f5,	%f18
	sth	%g6,	[%l7 + 0x3A]
	fbg,a	%fcc0,	loop_785
	std	%f24,	[%l7 + 0x20]
	tvs	%icc,	0x5
	fbule,a	%fcc2,	loop_786
loop_785:
	tvs	%xcc,	0x7
	tneg	%xcc,	0x1
	addc	%i3,	%l5,	%o0
loop_786:
	bcs	loop_787
	movrlez	%l6,	%o4,	%g3
	fmovsge	%xcc,	%f21,	%f1
	edge32	%o5,	%l0,	%i7
loop_787:
	fbule,a	%fcc1,	loop_788
	tneg	%xcc,	0x7
	fnors	%f19,	%f26,	%f27
	alignaddr	%g7,	%i4,	%o3
loop_788:
	array16	%g1,	%o1,	%i5
	xnor	%o6,	%l2,	%g5
	fxor	%f20,	%f30,	%f22
	udivx	%g2,	0x1E2C,	%o7
	set	0x08, %l2
	stxa	%l3,	[%l7 + %l2] 0xe2
	membar	#Sync
	tsubcc	%o2,	0x0C22,	%g4
	fmul8x16al	%f18,	%f26,	%f14
	edge32l	%i6,	%i1,	%i0
	movleu	%icc,	%l1,	%i2
	movpos	%xcc,	%g6,	%l4
	movrlz	%i3,	0x2F3,	%l5
	umul	%l6,	0x07E6,	%o0
	xorcc	%g3,	%o4,	%o5
	fbn,a	%fcc2,	loop_789
	tgu	%xcc,	0x4
	tpos	%icc,	0x7
	movgu	%icc,	%l0,	%i7
loop_789:
	and	%i4,	%o3,	%g1
	tcs	%xcc,	0x7
	ldsw	[%l7 + 0x54],	%g7
	popc	0x1158,	%o1
	nop
	setx	loop_790,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%o6,	0x03,	%l2
	bvc,a,pn	%xcc,	loop_791
	std	%i4,	[%l7 + 0x20]
loop_790:
	tn	%xcc,	0x4
	movrlz	%g5,	%o7,	%l3
loop_791:
	umulcc	%o2,	0x158A,	%g4
	orn	%g2,	0x163C,	%i6
	fmovdl	%icc,	%f3,	%f28
	bl,a	loop_792
	for	%f6,	%f20,	%f22
	fmovsvc	%icc,	%f5,	%f28
	fmovrsne	%i1,	%f12,	%f17
loop_792:
	ta	%icc,	0x1
	edge16	%i0,	%l1,	%i2
	sdiv	%l4,	0x0C5B,	%g6
	tgu	%icc,	0x1
	ldx	[%l7 + 0x70],	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i3,	0x1B0E,	%l6
	fbg,a	%fcc2,	loop_793
	movn	%xcc,	%g3,	%o0
	ldsw	[%l7 + 0x10],	%o5
	fbge	%fcc3,	loop_794
loop_793:
	fnands	%f13,	%f1,	%f10
	ldx	[%l7 + 0x60],	%l0
	wr	%g0,	0x89,	%asi
	stha	%i7,	[%l7 + 0x1E] %asi
loop_794:
	fmuld8sux16	%f24,	%f7,	%f30
	fbu	%fcc1,	loop_795
	fbug	%fcc1,	loop_796
	fnegd	%f18,	%f0
	movle	%icc,	%i4,	%o3
loop_795:
	sethi	0x1F91,	%o4
loop_796:
	fzero	%f0
	or	%g1,	0x07F8,	%g7
	sllx	%o6,	0x12,	%l2
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i5
	fpadd16s	%f7,	%f31,	%f27
	sll	%o1,	%o7,	%l3
	bg,pn	%icc,	loop_797
	sethi	0x0895,	%o2
	movpos	%xcc,	%g4,	%g5
	tge	%xcc,	0x4
loop_797:
	tne	%xcc,	0x6
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf8
	membar	#Sync
	taddcc	%i6,	0x1B5B,	%i1
	bcc	loop_798
	ldub	[%l7 + 0x39],	%i0
	ldub	[%l7 + 0x7C],	%l1
	xor	%i2,	0x0CC0,	%l4
loop_798:
	fbn,a	%fcc1,	loop_799
	srax	%g6,	%l5,	%i3
	udiv	%g2,	0x065E,	%l6
	udivcc	%g3,	0x10B0,	%o5
loop_799:
	movvs	%xcc,	%o0,	%i7
	tneg	%icc,	0x0
	sir	0x1245
	edge16ln	%i4,	%o3,	%o4
	fmul8sux16	%f22,	%f20,	%f12
	stb	%g1,	[%l7 + 0x55]
	prefetch	[%l7 + 0x3C],	 0x1
	fnot1	%f18,	%f12
	bvc,pt	%xcc,	loop_800
	edge32ln	%l0,	%o6,	%g7
	udiv	%l2,	0x0E7C,	%i5
	sub	%o7,	%o1,	%l3
loop_800:
	movn	%icc,	%o2,	%g5
	smul	%i6,	0x0962,	%g4
	bcc	%xcc,	loop_801
	fxor	%f2,	%f8,	%f6
	faligndata	%f12,	%f26,	%f26
	fmovscs	%icc,	%f23,	%f10
loop_801:
	ba,pt	%xcc,	loop_802
	movrne	%i0,	%i1,	%i2
	stw	%l1,	[%l7 + 0x40]
	orcc	%g6,	%l5,	%l4
loop_802:
	udiv	%i3,	0x1717,	%g2
	brlz	%l6,	loop_803
	movrgz	%g3,	%o0,	%i7
	brgz,a	%i4,	loop_804
	taddcctv	%o3,	0x063A,	%o4
loop_803:
	xnor	%g1,	%l0,	%o6
	movpos	%xcc,	%g7,	%l2
loop_804:
	tn	%icc,	0x6
	fnot1	%f24,	%f2
	edge8n	%o5,	%i5,	%o1
	stbar
	umulcc	%o7,	%o2,	%g5
	udivcc	%l3,	0x122C,	%g4
	set	0x38, %l3
	stha	%i0,	[%l7 + %l3] 0xe3
	membar	#Sync
	membar	0x08
	srl	%i6,	%i2,	%l1
	edge8	%i1,	%l5,	%g6
	array16	%i3,	%l4,	%l6
	fba,a	%fcc1,	loop_805
	subcc	%g3,	0x1B2F,	%o0
	tl	%icc,	0x6
	edge16ln	%g2,	%i4,	%i7
loop_805:
	bgu	%icc,	loop_806
	tcc	%xcc,	0x6
	orcc	%o4,	%g1,	%l0
	fmovdne	%xcc,	%f4,	%f5
loop_806:
	fpack16	%f12,	%f31
	fnegs	%f26,	%f27
	fzero	%f30
	fmul8sux16	%f30,	%f8,	%f30
	bleu,a,pt	%xcc,	loop_807
	faligndata	%f6,	%f4,	%f0
	ld	[%l7 + 0x40],	%f7
	lduh	[%l7 + 0x2A],	%o3
loop_807:
	fbn	%fcc2,	loop_808
	fbu	%fcc3,	loop_809
	sllx	%o6,	%g7,	%o5
	xorcc	%l2,	0x1F67,	%i5
loop_808:
	tleu	%icc,	0x3
loop_809:
	edge8l	%o7,	%o2,	%o1
	fmovrsgez	%g5,	%f25,	%f9
	movvc	%icc,	%g4,	%l3
	tle	%icc,	0x6
	fpsub16s	%f14,	%f30,	%f5
	nop
	setx	loop_810,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%i0,	%i2,	%l1
	fmovdg	%icc,	%f30,	%f18
	tpos	%icc,	0x5
loop_810:
	fbne,a	%fcc1,	loop_811
	movleu	%xcc,	%i1,	%l5
	fpsub32	%f16,	%f12,	%f14
	movl	%icc,	%i6,	%g6
loop_811:
	fmovrsgez	%l4,	%f13,	%f12
	edge32	%l6,	%g3,	%i3
	sdivx	%g2,	0x03DF,	%o0
	tneg	%icc,	0x2
	fandnot2	%f10,	%f24,	%f0
	fxors	%f1,	%f8,	%f20
	movpos	%xcc,	%i4,	%i7
	mulx	%o4,	0x0EC3,	%g1
	array32	%o3,	%l0,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%g7,	%f8,	%f16
	orcc	%l2,	0x1261,	%o5
	bleu	%icc,	loop_812
	fbn,a	%fcc0,	loop_813
	fmovdle	%icc,	%f30,	%f12
	mulx	%o7,	0x1223,	%i5
loop_812:
	movcs	%xcc,	%o1,	%g5
loop_813:
	orn	%o2,	0x142F,	%l3
	fors	%f28,	%f14,	%f4
	tvc	%xcc,	0x4
	andcc	%i0,	0x1777,	%i2
	subccc	%l1,	0x10FD,	%g4
	edge16l	%l5,	%i1,	%g6
	movleu	%icc,	%i6,	%l4
	fbuge,a	%fcc1,	loop_814
	tgu	%icc,	0x3
	addccc	%l6,	%g3,	%i3
	subc	%g2,	0x095E,	%i4
loop_814:
	mulscc	%i7,	0x07C5,	%o4
	brz,a	%g1,	loop_815
	umul	%o0,	%o3,	%o6
	add	%l0,	%l2,	%o5
	move	%icc,	%o7,	%g7
loop_815:
	smulcc	%i5,	%o1,	%o2
	fblg,a	%fcc0,	loop_816
	tpos	%icc,	0x1
	ble,a,pn	%xcc,	loop_817
	edge16l	%l3,	%i0,	%i2
loop_816:
	xorcc	%g5,	%l1,	%g4
	te	%icc,	0x7
loop_817:
	ldd	[%l7 + 0x30],	%f12
	array32	%i1,	%l5,	%i6
	fpadd16s	%f11,	%f13,	%f28
	tpos	%icc,	0x1
	fcmpne16	%f30,	%f22,	%l4
	fmovrslz	%l6,	%f4,	%f30
	nop
	setx loop_818, %l0, %l1
	jmpl %l1, %g3
	tneg	%xcc,	0x6
	ldx	[%l7 + 0x58],	%i3
	fmovdle	%icc,	%f19,	%f11
loop_818:
	fxnor	%f20,	%f16,	%f6
	fornot1s	%f10,	%f27,	%f14
	movle	%icc,	%g6,	%i4
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	fmovrslz	%o4,	%f4,	%f22
	array16	%g1,	%o0,	%g2
	brnz,a	%o3,	loop_819
	fmovsn	%xcc,	%f0,	%f3
	fmovsg	%xcc,	%f24,	%f23
	fmovrsgez	%l0,	%f1,	%f27
loop_819:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o6,	%l2
	call	loop_820
	fbu,a	%fcc0,	loop_821
	tge	%xcc,	0x7
	xnor	%o7,	%g7,	%i5
loop_820:
	fmul8x16al	%f16,	%f11,	%f22
loop_821:
	and	%o1,	%o2,	%o5
	brlz	%i0,	loop_822
	sdivx	%i2,	0x05B6,	%g5
	fbl	%fcc1,	loop_823
	movle	%xcc,	%l1,	%l3
loop_822:
	smulcc	%g4,	0x0DDB,	%i1
	movn	%icc,	%i6,	%l4
loop_823:
	movrgez	%l6,	0x2FA,	%g3
	pdist	%f14,	%f24,	%f22
	fmovrse	%l5,	%f5,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g6,	%i3,	%i4
	movrgz	%o4,	%g1,	%i7
	andcc	%g2,	%o0,	%o3
	tgu	%xcc,	0x6
	edge16ln	%o6,	%l2,	%l0
	set	0x6C, %o4
	ldswa	[%l7 + %o4] 0x14,	%g7
	orncc	%o7,	0x1644,	%i5
	nop
	setx loop_824, %l0, %l1
	jmpl %l1, %o1
	array8	%o2,	%o5,	%i2
	subcc	%i0,	0x04B4,	%g5
	movrne	%l1,	%l3,	%i1
loop_824:
	smul	%i6,	0x087A,	%l4
	st	%f16,	[%l7 + 0x1C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x22,	%asi
	stba	%l6,	[%l7 + 0x10] %asi
	membar	#Sync
	movvc	%icc,	%g4,	%l5
	sll	%g6,	0x1D,	%g3
	xnorcc	%i4,	0x021F,	%i3
	ldd	[%l7 + 0x30],	%o4
	bleu,a	%icc,	loop_825
	edge32n	%g1,	%g2,	%o0
	fandnot1	%f6,	%f10,	%f24
	fbule,a	%fcc1,	loop_826
loop_825:
	movrlez	%i7,	%o3,	%o6
	udivx	%l2,	0x08A2,	%l0
	movneg	%xcc,	%o7,	%g7
loop_826:
	edge8l	%o1,	%o2,	%i5
	fsrc1	%f0,	%f22
	fbul	%fcc0,	loop_827
	edge16n	%i2,	%o5,	%i0
	fnot2s	%f31,	%f18
	nop
	setx	loop_828,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_827:
	subc	%g5,	%l1,	%l3
	fmovsl	%icc,	%f0,	%f1
	move	%icc,	%i1,	%l4
loop_828:
	fmovse	%xcc,	%f6,	%f8
	taddcctv	%i6,	%g4,	%l5
	xnor	%g6,	%l6,	%g3
	movg	%xcc,	%i3,	%i4
	sdivcc	%o4,	0x1888,	%g1
	fsrc1	%f2,	%f18
	movl	%icc,	%g2,	%o0
	alignaddrl	%i7,	%o6,	%o3
	set	0x69, %i2
	stba	%l2,	[%l7 + %i2] 0x2a
	membar	#Sync
	orncc	%o7,	0x12C6,	%g7
	fandnot2s	%f16,	%f19,	%f5
	array32	%o1,	%l0,	%o2
	stb	%i2,	[%l7 + 0x7E]
	edge32l	%i5,	%i0,	%g5
	movrlz	%o5,	0x003,	%l3
	udivcc	%l1,	0x179B,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x6
	addc	%i6,	%l4,	%g4
	addc	%l5,	0x0266,	%l6
	sllx	%g6,	0x0F,	%i3
	taddcctv	%i4,	%o4,	%g1
	movrgez	%g2,	0x0F5,	%o0
	fmovsleu	%icc,	%f25,	%f14
	movcs	%xcc,	%i7,	%g3
	tgu	%xcc,	0x5
	movre	%o3,	%o6,	%o7
	edge8n	%l2,	%g7,	%l0
	fmovdge	%icc,	%f20,	%f23
	sra	%o2,	%o1,	%i2
	set	0x58, %i6
	stda	%i4,	[%l7 + %i6] 0x81
	fbo,a	%fcc2,	loop_829
	bshuffle	%f28,	%f12,	%f26
	swap	[%l7 + 0x28],	%g5
	movrgz	%i0,	0x2F2,	%o5
loop_829:
	sdivcc	%l1,	0x1FEA,	%i1
	udiv	%i6,	0x01BF,	%l3
	mova	%icc,	%g4,	%l4
	fmovrsgez	%l6,	%f28,	%f5
	subccc	%g6,	%l5,	%i4
	fbge	%fcc0,	loop_830
	for	%f0,	%f18,	%f18
	udivx	%i3,	0x0FDE,	%g1
	subccc	%o4,	0x00E2,	%o0
loop_830:
	brlz	%g2,	loop_831
	subc	%g3,	0x0B45,	%o3
	or	%i7,	%o6,	%l2
	fmovsge	%icc,	%f14,	%f9
loop_831:
	nop
	set	0x2C, %o1
	swapa	[%l7 + %o1] 0x19,	%g7
	udiv	%o7,	0x0769,	%o2
	movn	%xcc,	%o1,	%l0
	xnorcc	%i5,	%g5,	%i0
	movg	%xcc,	%i2,	%o5
	sdivx	%l1,	0x0A50,	%i6
	taddcctv	%i1,	0x07B6,	%g4
	nop
	setx	loop_832,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%xcc,	%l3,	%l4
	movrlz	%g6,	%l6,	%l5
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x15,	 0x2
loop_832:
	udivcc	%i4,	0x0756,	%g1
	edge8l	%o0,	%g2,	%g3
	movrne	%o3,	0x184,	%o4
	fmovscc	%icc,	%f31,	%f0
	movrgz	%i7,	0x25D,	%o6
	orn	%l2,	0x1F11,	%g7
	smulcc	%o2,	0x084A,	%o1
	std	%f2,	[%l7 + 0x18]
	ldstub	[%l7 + 0x4C],	%l0
	edge32n	%i5,	%o7,	%i0
	movcc	%icc,	%g5,	%o5
	move	%xcc,	%l1,	%i2
	or	%i1,	%g4,	%l3
	taddcc	%i6,	%g6,	%l6
	sll	%l5,	%i3,	%i4
	bn,a	%icc,	loop_833
	udivcc	%l4,	0x1DD6,	%o0
	edge16	%g2,	%g1,	%g3
	fones	%f7
loop_833:
	tvs	%icc,	0x0
	brz	%o4,	loop_834
	or	%o3,	%o6,	%i7
	movcs	%xcc,	%l2,	%g7
	movrgez	%o1,	%l0,	%o2
loop_834:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%o7,	loop_835
	tcc	%xcc,	0x7
	for	%f8,	%f4,	%f28
	edge16	%i5,	%g5,	%i0
loop_835:
	movrlz	%l1,	%i2,	%o5
	fbuge,a	%fcc3,	loop_836
	fxnors	%f0,	%f27,	%f26
	fandnot1s	%f17,	%f1,	%f0
	bleu	loop_837
loop_836:
	movleu	%xcc,	%g4,	%l3
	fbg	%fcc3,	loop_838
	sra	%i1,	%g6,	%i6
loop_837:
	tpos	%icc,	0x5
	fornot1	%f6,	%f14,	%f10
loop_838:
	sllx	%l6,	0x08,	%l5
	addc	%i4,	0x0466,	%l4
	edge8ln	%o0,	%g2,	%g1
	movre	%g3,	%o4,	%i3
	fsrc1	%f4,	%f30
	movge	%icc,	%o3,	%o6
	fpadd16s	%f21,	%f4,	%f29
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x81
	movgu	%icc,	%l2,	%i7
	bvs	%icc,	loop_839
	tgu	%xcc,	0x1
	and	%g7,	0x13EF,	%l0
	fmul8x16	%f24,	%f16,	%f4
loop_839:
	fcmpeq16	%f24,	%f20,	%o1
	movrlz	%o2,	0x37A,	%o7
	edge16n	%g5,	%i0,	%i5
	nop
	setx	loop_840,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stx	%l1,	[%l7 + 0x38]
	fmovsvs	%icc,	%f30,	%f26
	tleu	%xcc,	0x0
loop_840:
	fnors	%f17,	%f16,	%f5
	edge32	%i2,	%g4,	%o5
	fmul8x16au	%f16,	%f30,	%f22
	orncc	%l3,	%g6,	%i1
	orcc	%l6,	%l5,	%i6
	tpos	%icc,	0x5
	xorcc	%l4,	0x076D,	%o0
	bvc,a	%icc,	loop_841
	ta	%xcc,	0x1
	mova	%icc,	%i4,	%g1
	xorcc	%g3,	%o4,	%i3
loop_841:
	movrlz	%g2,	%o6,	%o3
	movrlz	%i7,	0x211,	%l2
	fmovscs	%xcc,	%f1,	%f20
	movg	%icc,	%g7,	%o1
	andcc	%o2,	%o7,	%g5
	fbne	%fcc3,	loop_842
	movge	%xcc,	%i0,	%i5
	fmovrslz	%l1,	%f18,	%f15
	bneg,a	loop_843
loop_842:
	movrgz	%l0,	0x02A,	%i2
	mulx	%g4,	%o5,	%l3
	movn	%xcc,	%g6,	%l6
loop_843:
	movrlez	%i1,	%i6,	%l4
	movcc	%icc,	%o0,	%l5
	tne	%icc,	0x2
	brgez,a	%i4,	loop_844
	fbul	%fcc1,	loop_845
	brgez	%g3,	loop_846
	edge32	%o4,	%i3,	%g1
loop_844:
	subccc	%o6,	0x0024,	%g2
loop_845:
	stx	%i7,	[%l7 + 0x50]
loop_846:
	addccc	%l2,	0x0B46,	%g7
	xorcc	%o1,	%o3,	%o2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g5
	or	%i0,	%o7,	%i5
	fone	%f12
	movgu	%icc,	%l1,	%i2
	movcs	%icc,	%g4,	%l0
	ldsh	[%l7 + 0x42],	%o5
	mulscc	%l3,	0x1626,	%l6
	edge32l	%i1,	%i6,	%g6
	movrgez	%o0,	%l4,	%l5
	be,pn	%xcc,	loop_847
	bcc,a,pt	%xcc,	loop_848
	fmovrsgz	%i4,	%f28,	%f16
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x18] %asi,	%g3
loop_847:
	xor	%o4,	%g1,	%i3
loop_848:
	fmovrdgz	%o6,	%f10,	%f12
	stx	%i7,	[%l7 + 0x30]
	edge8l	%g2,	%g7,	%o1
	fmovsleu	%xcc,	%f5,	%f9
	fmovsneg	%icc,	%f18,	%f11
	subccc	%l2,	0x18BC,	%o2
	fbue	%fcc3,	loop_849
	tvs	%icc,	0x0
	mova	%icc,	%g5,	%i0
	wr	%g0,	0xea,	%asi
	stba	%o7,	[%l7 + 0x65] %asi
	membar	#Sync
loop_849:
	sra	%o3,	%l1,	%i5
	orncc	%i2,	%g4,	%o5
	movrne	%l3,	%l0,	%i1
	set	0x40, %l0
	stda	%i6,	[%l7 + %l0] 0x04
	tvs	%icc,	0x6
	tcs	%icc,	0x2
	taddcctv	%g6,	%o0,	%l4
	tcc	%icc,	0x2
	array16	%l6,	%i4,	%g3
	nop
	set	0x6C, %i7
	prefetch	[%l7 + %i7],	 0x2
	ble,a,pt	%xcc,	loop_850
	edge32ln	%l5,	%o4,	%g1
	tpos	%icc,	0x4
	edge8l	%i3,	%o6,	%g2
loop_850:
	movn	%xcc,	%i7,	%o1
	fmovrslz	%l2,	%f15,	%f0
	set	0x20, %l4
	stxa	%o2,	[%g0 + %l4] 0x20
	sdiv	%g7,	0x1205,	%g5
	andcc	%o7,	0x08ED,	%o3
	tgu	%xcc,	0x6
	orcc	%i0,	0x0866,	%l1
	fmul8x16	%f28,	%f20,	%f20
	mulscc	%i2,	0x1785,	%g4
	fones	%f29
	nop
	set	0x74, %o2
	ldub	[%l7 + %o2],	%o5
	tleu	%xcc,	0x2
	bn	loop_851
	fmovsgu	%icc,	%f4,	%f8
	lduw	[%l7 + 0x08],	%l3
	andn	%i5,	0x17E1,	%i1
loop_851:
	orncc	%i6,	%g6,	%o0
	mova	%xcc,	%l4,	%l0
	fmovsle	%icc,	%f8,	%f21
	fnands	%f5,	%f10,	%f30
	andncc	%i4,	%l6,	%l5
	fcmpd	%fcc1,	%f8,	%f30
	movne	%icc,	%o4,	%g3
	andn	%i3,	0x18ED,	%o6
	membar	0x69
	ta	%icc,	0x4
	movgu	%xcc,	%g1,	%i7
	edge32ln	%o1,	%g2,	%l2
	tneg	%xcc,	0x2
	movrne	%g7,	%g5,	%o2
	nop
	set	0x34, %i4
	stw	%o3,	[%l7 + %i4]
	set	0x2C, %g7
	sta	%f20,	[%l7 + %g7] 0x18
	mulx	%o7,	%i0,	%i2
	movneg	%icc,	%g4,	%l1
	bcc,pt	%icc,	loop_852
	movre	%l3,	0x37E,	%i5
	ldd	[%l7 + 0x20],	%f12
	nop
	setx	loop_853,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_852:
	movrlz	%i1,	%o5,	%i6
	tl	%xcc,	0x5
	fmovdcc	%xcc,	%f14,	%f26
loop_853:
	movrlz	%o0,	%l4,	%l0
	fbe,a	%fcc2,	loop_854
	mulx	%g6,	0x196F,	%l6
	tvs	%icc,	0x3
	movvs	%icc,	%l5,	%o4
loop_854:
	edge32l	%i4,	%i3,	%o6
	fcmpeq32	%f24,	%f0,	%g1
	srl	%g3,	0x08,	%o1
	xor	%g2,	0x185F,	%l2
	movne	%xcc,	%i7,	%g5
	bcc,pn	%xcc,	loop_855
	sir	0x110A
	fbue,a	%fcc1,	loop_856
	fmovsneg	%xcc,	%f5,	%f6
loop_855:
	subcc	%g7,	0x06B4,	%o2
	fmovdl	%icc,	%f11,	%f5
loop_856:
	edge16n	%o3,	%i0,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f28,	%f26
	fmovsvs	%icc,	%f29,	%f0
	fmovrsne	%g4,	%f21,	%f29
	edge16n	%o7,	%l3,	%i5
	movne	%icc,	%l1,	%o5
	tsubcctv	%i6,	%i1,	%l4
	orcc	%l0,	%o0,	%g6
	fblg	%fcc1,	loop_857
	addc	%l5,	0x05B1,	%o4
	nop
	setx	loop_858,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%l6,	%i3,	%i4
loop_857:
	ldsh	[%l7 + 0x5E],	%g1
	tvs	%xcc,	0x4
loop_858:
	sra	%g3,	%o6,	%g2
	movrlez	%l2,	%i7,	%g5
	fpmerge	%f17,	%f7,	%f2
	move	%xcc,	%o1,	%g7
	tleu	%xcc,	0x7
	bgu	%xcc,	loop_859
	tle	%icc,	0x5
	edge16	%o2,	%i0,	%i2
	fmovsge	%xcc,	%f2,	%f13
loop_859:
	fmovs	%f10,	%f4
	fmuld8ulx16	%f23,	%f31,	%f16
	tge	%xcc,	0x3
	smulcc	%g4,	%o7,	%l3
	sra	%i5,	0x07,	%l1
	ldstub	[%l7 + 0x36],	%o3
	fmul8sux16	%f28,	%f16,	%f8
	fbue,a	%fcc1,	loop_860
	fmul8x16al	%f9,	%f29,	%f8
	andncc	%i6,	%o5,	%l4
	fcmpeq16	%f24,	%f6,	%i1
loop_860:
	or	%l0,	0x04F8,	%g6
	wr	%g0,	0x23,	%asi
	stda	%l4,	[%l7 + 0x60] %asi
	membar	#Sync
	orncc	%o4,	%o0,	%i3
	set	0x70, %i0
	stxa	%i4,	[%l7 + %i0] 0x22
	membar	#Sync
	sub	%g1,	0x0825,	%l6
	udivcc	%g3,	0x0867,	%o6
	fnors	%f6,	%f27,	%f17
	fmovrsne	%g2,	%f19,	%f31
	smul	%l2,	%i7,	%g5
	edge8ln	%o1,	%g7,	%o2
	bl,a,pt	%icc,	loop_861
	call	loop_862
	edge16	%i2,	%i0,	%g4
	movle	%icc,	%o7,	%l3
loop_861:
	movrgez	%l1,	0x2D9,	%i5
loop_862:
	nop
	set	0x60, %l1
	ldxa	[%l7 + %l1] 0x10,	%o3
	tcs	%icc,	0x1
	wr	%g0,	0x57,	%asi
	stxa	%o5,	[%g0 + 0x0] %asi
	or	%l4,	0x13A8,	%i6
	fmovsne	%xcc,	%f8,	%f4
	fcmpes	%fcc0,	%f9,	%f21
	sub	%l0,	0x0211,	%g6
	movcs	%xcc,	%l5,	%o4
	lduw	[%l7 + 0x24],	%o0
	tne	%icc,	0x6
	edge8ln	%i1,	%i3,	%i4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l6
	sra	%g3,	%g1,	%g2
	and	%l2,	0x0A28,	%i7
	alignaddr	%o6,	%g5,	%g7
	ba	%xcc,	loop_863
	or	%o1,	%o2,	%i2
	sll	%i0,	%g4,	%o7
	movcc	%icc,	%l3,	%l1
loop_863:
	umul	%o3,	0x1D71,	%i5
	tvs	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x38] %asi,	%l4
	subcc	%o5,	0x10F6,	%l0
	xor	%i6,	%l5,	%o4
	fmovspos	%xcc,	%f20,	%f30
	set	0x2C, %l6
	sta	%f1,	[%l7 + %l6] 0x0c
	movvc	%icc,	%g6,	%o0
	movrlez	%i1,	0x24F,	%i4
	fmovdneg	%xcc,	%f19,	%f10
	fmovrdlez	%i3,	%f22,	%f20
	movvs	%icc,	%g3,	%l6
	fsrc2s	%f6,	%f3
	tpos	%xcc,	0x0
	addcc	%g2,	%l2,	%g1
	srl	%o6,	%g5,	%g7
	movge	%xcc,	%o1,	%i7
	brgz,a	%o2,	loop_864
	fsrc1s	%f7,	%f19
	fmovdle	%icc,	%f11,	%f15
	edge8n	%i0,	%g4,	%i2
loop_864:
	sethi	0x0C2F,	%o7
	fnand	%f20,	%f22,	%f8
	fcmple32	%f18,	%f6,	%l3
	umulcc	%l1,	%i5,	%l4
	call	loop_865
	tn	%icc,	0x6
	fcmpd	%fcc1,	%f30,	%f4
	fba	%fcc2,	loop_866
loop_865:
	srlx	%o5,	%l0,	%i6
	edge16l	%l5,	%o4,	%o3
	fbne	%fcc0,	loop_867
loop_866:
	add	%o0,	0x1EB8,	%g6
	sethi	0x0617,	%i4
	xorcc	%i3,	0x1D92,	%g3
loop_867:
	std	%i6,	[%l7 + 0x40]
	movcs	%xcc,	%g2,	%i1
	bvs	loop_868
	movl	%icc,	%l2,	%g1
	std	%f28,	[%l7 + 0x48]
	fblg,a	%fcc2,	loop_869
loop_868:
	edge16l	%g5,	%o6,	%o1
	ldstub	[%l7 + 0x78],	%i7
	ldd	[%l7 + 0x40],	%f4
loop_869:
	fmovsleu	%xcc,	%f30,	%f13
	fmovsle	%xcc,	%f3,	%f2
	sir	0x0F63
	tpos	%icc,	0x6
	array16	%g7,	%o2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i2,	0x0D,	%o7
	subc	%g4,	%l3,	%l1
	te	%icc,	0x5
	tgu	%icc,	0x6
	fzeros	%f28
	movg	%xcc,	%l4,	%i5
	fbo,a	%fcc1,	loop_870
	udiv	%l0,	0x073A,	%i6
	andcc	%l5,	0x1693,	%o5
	tle	%icc,	0x5
loop_870:
	xnor	%o4,	0x1E36,	%o0
	movn	%xcc,	%o3,	%g6
	movvs	%xcc,	%i3,	%i4
	andn	%l6,	%g3,	%i1
	array16	%l2,	%g1,	%g2
	movge	%xcc,	%o6,	%o1
	fnot2s	%f14,	%f27
	edge8n	%i7,	%g5,	%g7
	subcc	%i0,	%o2,	%o7
	mova	%xcc,	%i2,	%l3
	bne	%xcc,	loop_871
	movne	%xcc,	%g4,	%l4
	edge8n	%i5,	%l1,	%i6
	fmovrde	%l5,	%f2,	%f2
loop_871:
	std	%f12,	[%l7 + 0x08]
	edge16l	%l0,	%o5,	%o4
	nop
	set	0x7C, %g5
	prefetch	[%l7 + %g5],	 0x3
	umul	%o3,	0x03F6,	%g6
	edge8n	%i3,	%o0,	%l6
	alignaddr	%g3,	%i1,	%i4
	fnot1	%f26,	%f26
	xorcc	%l2,	%g1,	%o6
	be,a,pn	%xcc,	loop_872
	movrlez	%o1,	%i7,	%g5
	udivcc	%g7,	0x1A82,	%g2
	lduh	[%l7 + 0x12],	%o2
loop_872:
	xorcc	%o7,	%i0,	%i2
	tcc	%icc,	0x2
	movrlz	%g4,	0x30F,	%l3
	edge16l	%l4,	%l1,	%i5
	tleu	%icc,	0x6
	popc	0x170A,	%l5
	alignaddrl	%l0,	%i6,	%o4
	srax	%o3,	0x0D,	%o5
	move	%xcc,	%i3,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x08] %asi,	%l6
	movvc	%icc,	%g3,	%g6
	tvs	%icc,	0x4
	sir	0x09B4
	fabss	%f23,	%f18
	udivcc	%i1,	0x0569,	%i4
	srax	%g1,	%l2,	%o6
	edge8	%o1,	%i7,	%g7
	smul	%g2,	%g5,	%o7
	ldub	[%l7 + 0x24],	%o2
	addccc	%i0,	0x175E,	%g4
	fors	%f28,	%f22,	%f21
	stw	%i2,	[%l7 + 0x1C]
	fmovsvc	%icc,	%f24,	%f18
	orncc	%l3,	0x0890,	%l4
	ble,a,pn	%icc,	loop_873
	edge16	%l1,	%l5,	%i5
	tgu	%xcc,	0x5
	subccc	%i6,	0x0875,	%o4
loop_873:
	smulcc	%l0,	%o5,	%i3
	tsubcc	%o3,	0x1C82,	%o0
	movvc	%xcc,	%g3,	%l6
	fmul8x16au	%f20,	%f18,	%f24
	subccc	%i1,	0x1E76,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i4,	%l2,	%o6
	be,pn	%icc,	loop_874
	fone	%f8
	edge16l	%o1,	%g1,	%g7
	tge	%icc,	0x4
loop_874:
	move	%xcc,	%i7,	%g2
	edge8ln	%g5,	%o7,	%i0
	mulscc	%o2,	0x0B2B,	%g4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x78] %asi,	%i2
	lduh	[%l7 + 0x2A],	%l3
	edge32ln	%l1,	%l5,	%l4
	fnegd	%f2,	%f10
	fsrc1s	%f18,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i5,	0x0072,	%i6
	fnot1	%f6,	%f28
	fcmpd	%fcc2,	%f28,	%f20
	lduh	[%l7 + 0x30],	%o4
	fmovrde	%l0,	%f10,	%f18
	movvc	%icc,	%i3,	%o5
	array16	%o0,	%g3,	%l6
	move	%icc,	%i1,	%g6
	bvs,pt	%xcc,	loop_875
	xnorcc	%o3,	0x1C3B,	%l2
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x70] %asi,	%o6
loop_875:
	edge8	%i4,	%o1,	%g1
	set	0x40, %o0
	lduwa	[%l7 + %o0] 0x18,	%i7
	fmul8sux16	%f22,	%f30,	%f22
	fmovsn	%xcc,	%f11,	%f5
	andncc	%g7,	%g2,	%o7
	bgu,a	loop_876
	ldsb	[%l7 + 0x7D],	%g5
	addc	%o2,	%i0,	%g4
	ldsb	[%l7 + 0x52],	%i2
loop_876:
	xor	%l1,	%l3,	%l5
	be,pt	%xcc,	loop_877
	membar	0x6F
	set	0x50, %l5
	stxa	%i5,	[%l7 + %l5] 0xe2
	membar	#Sync
loop_877:
	edge16	%i6,	%o4,	%l0
	fmovsgu	%icc,	%f13,	%f2
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l4
	edge32n	%i3,	%o5,	%g3
	edge8l	%l6,	%o0,	%i1
	udivcc	%g6,	0x0620,	%l2
	edge8ln	%o3,	%o6,	%i4
	membar	0x07
	movrgz	%o1,	0x019,	%i7
	movle	%icc,	%g1,	%g2
	tsubcctv	%o7,	0x12A8,	%g7
	call	loop_878
	fcmpeq16	%f2,	%f14,	%o2
	fmovsn	%icc,	%f28,	%f16
	fxors	%f12,	%f3,	%f22
loop_878:
	fmovdcc	%xcc,	%f20,	%f7
	fbu	%fcc1,	loop_879
	srax	%g5,	%g4,	%i0
	edge32n	%l1,	%l3,	%i2
	edge32	%l5,	%i6,	%i5
loop_879:
	fmovrdgez	%l0,	%f22,	%f2
	fandnot2	%f14,	%f24,	%f14
	fones	%f10
	fmovdl	%xcc,	%f16,	%f6
	movrlz	%o4,	%i3,	%o5
	fmovs	%f2,	%f11
	tvs	%icc,	0x1
	fmul8ulx16	%f20,	%f16,	%f8
	movne	%icc,	%l4,	%l6
	fbn	%fcc1,	loop_880
	fornot1s	%f24,	%f27,	%f4
	xor	%o0,	%i1,	%g3
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x19,	 0x1
loop_880:
	srl	%o3,	0x0B,	%g6
	movvc	%icc,	%o6,	%i4
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	fcmple32	%f22,	%f10,	%o1
	ta	%icc,	0x1
	fmovrdlz	%i7,	%f26,	%f6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%o7
	bge,a,pt	%icc,	loop_881
	movre	%g2,	0x161,	%g7
	umulcc	%o2,	%g4,	%g5
	bshuffle	%f20,	%f10,	%f8
loop_881:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movneg	%icc,	%i0,	%l3
	edge16ln	%i2,	%l5,	%l1
	brz	%i6,	loop_882
	fmovrsgz	%i5,	%f6,	%f28
	tgu	%xcc,	0x0
	orncc	%l0,	%i3,	%o4
loop_882:
	movrgez	%l4,	%o5,	%l6
	fmovrdlz	%i1,	%f4,	%f24
	lduw	[%l7 + 0x38],	%g3
	bcc,a,pt	%icc,	loop_883
	sdivx	%o0,	0x1040,	%l2
	srlx	%g6,	%o6,	%o3
	movvc	%icc,	%i4,	%o1
loop_883:
	nop
	setx	loop_884,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvs	%xcc,	%f3,	%f8
	membar	0x73
	movrne	%g1,	0x0C4,	%i7
loop_884:
	fcmple16	%f6,	%f20,	%g2
	fmovrdgz	%o7,	%f24,	%f4
	alignaddr	%o2,	%g7,	%g4
	te	%icc,	0x3
	bgu,a	loop_885
	stbar
	tne	%icc,	0x1
	movg	%xcc,	%i0,	%l3
loop_885:
	edge32ln	%g5,	%l5,	%i2
	movl	%icc,	%l1,	%i5
	addc	%i6,	%i3,	%o4
	for	%f24,	%f24,	%f2
	array8	%l4,	%l0,	%o5
	siam	0x6
	andncc	%i1,	%l6,	%o0
	fabss	%f17,	%f21
	tleu	%xcc,	0x6
	srl	%g3,	0x00,	%l2
	udivx	%o6,	0x1559,	%o3
	fmovse	%xcc,	%f19,	%f25
	smul	%g6,	%o1,	%i4
	std	%g0,	[%l7 + 0x48]
	umul	%g2,	0x1B1B,	%i7
	sub	%o7,	0x0B20,	%o2
	tn	%icc,	0x4
	fbe,a	%fcc1,	loop_886
	taddcctv	%g7,	%i0,	%g4
	edge16n	%g5,	%l5,	%l3
	edge8l	%i2,	%l1,	%i6
loop_886:
	subcc	%i5,	%i3,	%o4
	fmovdleu	%icc,	%f2,	%f24
	fands	%f0,	%f22,	%f7
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x44] %asi,	%f19
	movcs	%xcc,	%l0,	%l4
	subcc	%o5,	%i1,	%o0
	tg	%icc,	0x6
	tge	%xcc,	0x4
	tleu	%xcc,	0x2
	ta	%icc,	0x1
	popc	0x083F,	%g3
	srl	%l2,	%l6,	%o6
	fsrc2	%f6,	%f10
	xor	%o3,	%o1,	%g6
	fandnot2s	%f25,	%f12,	%f27
	edge16l	%i4,	%g2,	%i7
	popc	%o7,	%g1
	sub	%g7,	%o2,	%g4
	ta	%icc,	0x3
	ldx	[%l7 + 0x20],	%g5
	ld	[%l7 + 0x3C],	%f18
	fxnors	%f19,	%f17,	%f6
	srl	%l5,	0x13,	%l3
	movneg	%icc,	%i0,	%i2
	movrgz	%i6,	0x2E6,	%l1
	fpack16	%f10,	%f4
	membar	0x38
	sll	%i3,	0x0F,	%i5
	set	0x28, %i5
	ldsha	[%l7 + %i5] 0x19,	%l0
	ba,a,pt	%xcc,	loop_887
	srlx	%l4,	%o5,	%i1
	brlez,a	%o4,	loop_888
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
loop_887:
	udiv	%g3,	0x12F6,	%o0
	mulscc	%l6,	%l2,	%o3
loop_888:
	movrgez	%o6,	%g6,	%i4
loop_889:
	movvs	%icc,	%g2,	%o1
	fnot1	%f20,	%f30
	edge16l	%i7,	%g1,	%o7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f23
	alignaddrl	%g7,	%o2,	%g4
	bne,a	loop_890
	xnor	%l5,	0x12AE,	%l3
	xor	%g5,	%i0,	%i6
	fmovs	%f21,	%f5
loop_890:
	addcc	%i2,	%i3,	%i5
	smul	%l0,	%l4,	%l1
	movrlez	%o5,	0x24A,	%o4
	ldd	[%l7 + 0x38],	%f18
	sra	%g3,	0x04,	%o0
	edge16l	%i1,	%l2,	%l6
	fbne,a	%fcc0,	loop_891
	subcc	%o6,	0x1335,	%g6
	srl	%i4,	%o3,	%o1
	wr	%g0,	0x19,	%asi
	sta	%f1,	[%l7 + 0x28] %asi
loop_891:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i7
	sub	%g2,	%o7,	%g7
	fsrc2s	%f17,	%f29
	fone	%f28
	flush	%l7 + 0x08
	prefetch	[%l7 + 0x68],	 0x0
	lduw	[%l7 + 0x74],	%g1
	tvc	%icc,	0x5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%o2
	lduh	[%l7 + 0x74],	%l5
	xnorcc	%l3,	%g5,	%i6
	tleu	%icc,	0x6
	movcs	%icc,	%i2,	%i0
	set	0x48, %g3
	stda	%i2,	[%l7 + %g3] 0x04
	bgu,a	loop_892
	sdivcc	%l0,	0x1514,	%i5
	stbar
	fble	%fcc2,	loop_893
loop_892:
	fabsd	%f0,	%f8
	set	0x14, %g2
	sta	%f15,	[%l7 + %g2] 0x0c
loop_893:
	srl	%l1,	%l4,	%o4
	tn	%xcc,	0x1
	edge16ln	%o5,	%g3,	%i1
	movrlez	%o0,	0x1DE,	%l6
	mulscc	%o6,	0x089A,	%g6
	fxnors	%f16,	%f5,	%f14
	mulx	%i4,	%l2,	%o3
	fbn,a	%fcc2,	loop_894
	edge8n	%i7,	%o1,	%o7
	edge8ln	%g7,	%g2,	%g1
	movre	%g4,	0x128,	%o2
loop_894:
	edge8	%l5,	%g5,	%i6
	sub	%l3,	%i2,	%i3
	srl	%i0,	0x17,	%l0
	subccc	%l1,	0x0311,	%i5
	orncc	%l4,	%o5,	%o4
	tne	%xcc,	0x4
	ldd	[%l7 + 0x50],	%f22
	movrlz	%i1,	%g3,	%l6
	addcc	%o0,	%g6,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o3
	fmovdl	%icc,	%f12,	%f27
	ldstub	[%l7 + 0x21],	%o6
	tsubcctv	%i7,	0x07CB,	%o7
	fbug	%fcc2,	loop_895
	fcmpgt32	%f24,	%f20,	%o1
	bshuffle	%f2,	%f6,	%f8
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_895:
	movgu	%xcc,	%g2,	%g1
	sethi	0x175F,	%g7
	fmovdcs	%xcc,	%f3,	%f22
	movrlez	%o2,	%l5,	%g4
	set	0x70, %g4
	sta	%f25,	[%l7 + %g4] 0x04
	sub	%i6,	%l3,	%i2
	addccc	%i3,	0x1692,	%i0
	edge16n	%g5,	%l1,	%i5
	taddcctv	%l0,	0x1AB1,	%o5
	movrgez	%o4,	0x02F,	%i1
	fmovdneg	%icc,	%f5,	%f20
	fabsd	%f20,	%f30
	ta	%xcc,	0x2
	movrlz	%g3,	%l6,	%o0
	popc	0x159E,	%g6
	fbe	%fcc1,	loop_896
	movl	%icc,	%l4,	%i4
	fnot1s	%f9,	%f16
	andncc	%o3,	%l2,	%o6
loop_896:
	edge16	%o7,	%i7,	%o1
	sllx	%g2,	%g7,	%g1
	alignaddrl	%o2,	%g4,	%l5
	fpsub16s	%f24,	%f25,	%f21
	fandnot1	%f26,	%f8,	%f28
	addcc	%l3,	%i2,	%i6
	stb	%i3,	[%l7 + 0x13]
	array16	%g5,	%l1,	%i0
	tvs	%xcc,	0x3
	srl	%l0,	%o5,	%i5
	tleu	%icc,	0x1
	array8	%i1,	%g3,	%l6
	subccc	%o0,	0x1B52,	%o4
	add	%l4,	%i4,	%g6
	tl	%xcc,	0x1
	tgu	%xcc,	0x0
	bvs,pn	%xcc,	loop_897
	fsrc1	%f6,	%f8
	movre	%o3,	%l2,	%o6
	tle	%icc,	0x5
loop_897:
	movn	%xcc,	%i7,	%o7
	subc	%o1,	%g2,	%g7
	array32	%g1,	%o2,	%l5
	orn	%g4,	0x1273,	%i2
	alignaddr	%l3,	%i6,	%i3
	srlx	%l1,	%g5,	%i0
	fornot1s	%f21,	%f20,	%f22
	movrlez	%o5,	0x17B,	%l0
	fsrc2	%f24,	%f18
	move	%icc,	%i5,	%i1
	nop
	setx	loop_898,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%g3,	%o0,	%l6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l4,	%o4
loop_898:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%g6
	flush	%l7 + 0x68
	ble	loop_899
	fbule,a	%fcc0,	loop_900
	movl	%icc,	%l2,	%o3
	movrne	%o6,	0x0AC,	%i7
loop_899:
	fmovscs	%xcc,	%f1,	%f22
loop_900:
	tcc	%icc,	0x1
	mova	%xcc,	%o1,	%g2
	mova	%icc,	%g7,	%g1
	mova	%icc,	%o2,	%o7
	bcc,pn	%icc,	loop_901
	edge8l	%g4,	%l5,	%i2
	fmul8x16au	%f13,	%f19,	%f28
	alignaddr	%i6,	%i3,	%l3
loop_901:
	mulx	%g5,	%l1,	%o5
	tgu	%icc,	0x4
	tvc	%xcc,	0x3
	fornot1	%f6,	%f26,	%f2
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movrlez	%l0,	%i5,	%i1
	tgu	%xcc,	0x3
	brnz,a	%i0,	loop_902
	tsubcc	%o0,	0x055C,	%g3
	tge	%xcc,	0x0
	fmovsne	%xcc,	%f5,	%f24
loop_902:
	edge32l	%l6,	%l4,	%i4
	movrgz	%g6,	0x038,	%o4
	fble,a	%fcc2,	loop_903
	ldd	[%l7 + 0x68],	%f16
	edge32ln	%l2,	%o3,	%o6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%i7
loop_903:
	tl	%xcc,	0x6
	bge,a,pn	%icc,	loop_904
	fnegd	%f2,	%f26
	fpadd16s	%f16,	%f1,	%f31
	fcmpes	%fcc2,	%f14,	%f26
loop_904:
	tvs	%xcc,	0x7
	xnor	%g2,	0x1D4F,	%o1
	tsubcctv	%g7,	0x0FD5,	%o2
	movre	%o7,	%g4,	%g1
	movpos	%icc,	%l5,	%i6
	tneg	%xcc,	0x5
	edge32	%i3,	%i2,	%l3
	movvc	%xcc,	%l1,	%g5
	movl	%xcc,	%o5,	%l0
	fbe,a	%fcc3,	loop_905
	fmovrde	%i1,	%f10,	%f0
	fpsub16	%f28,	%f4,	%f10
	sllx	%i0,	%i5,	%o0
loop_905:
	tl	%icc,	0x2
	fabss	%f9,	%f29
	fbe,a	%fcc3,	loop_906
	bcs,a	%xcc,	loop_907
	bvs,a,pn	%xcc,	loop_908
	add	%l6,	0x13D1,	%l4
loop_906:
	fnot1	%f2,	%f24
loop_907:
	sethi	0x1FC1,	%g3
loop_908:
	ble,a,pt	%icc,	loop_909
	addc	%g6,	0x0989,	%o4
	fmovsg	%icc,	%f21,	%f6
	fone	%f4
loop_909:
	nop
	set	0x08, %o7
	ldstub	[%l7 + %o7],	%i4
	sethi	0x04D2,	%o3
	edge32ln	%l2,	%i7,	%g2
	movge	%xcc,	%o1,	%g7
	fmovscs	%icc,	%f18,	%f11
	edge8l	%o6,	%o7,	%g4
	movcc	%xcc,	%o2,	%l5
	sllx	%g1,	%i6,	%i2
	tne	%icc,	0x3
	bne,a	%icc,	loop_910
	st	%f9,	[%l7 + 0x78]
	fbu,a	%fcc1,	loop_911
	subcc	%i3,	%l1,	%g5
loop_910:
	fbue,a	%fcc2,	loop_912
	fmovdvc	%xcc,	%f2,	%f14
loop_911:
	movrgez	%o5,	%l3,	%l0
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%i0
loop_912:
	movn	%xcc,	%i5,	%i1
	alignaddrl	%o0,	%l6,	%g3
	udivcc	%l4,	0x1502,	%g6
	fbo	%fcc3,	loop_913
	st	%f18,	[%l7 + 0x24]
	mova	%xcc,	%i4,	%o3
	mulx	%o4,	%l2,	%g2
loop_913:
	movcs	%icc,	%o1,	%i7
	brgez,a	%o6,	loop_914
	sra	%g7,	%o7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%o2,	loop_915
loop_914:
	lduw	[%l7 + 0x50],	%g1
	alignaddr	%l5,	%i2,	%i6
	mulscc	%l1,	0x07CE,	%i3
loop_915:
	movge	%icc,	%o5,	%g5
	fmovsvs	%icc,	%f0,	%f18
	fbu	%fcc1,	loop_916
	fabss	%f17,	%f23
	fbule	%fcc0,	loop_917
	fble	%fcc2,	loop_918
loop_916:
	xorcc	%l0,	0x1132,	%l3
	movl	%icc,	%i0,	%i5
loop_917:
	tn	%xcc,	0x4
loop_918:
	fnot1s	%f2,	%f6
	fmovrdne	%i1,	%f18,	%f6
	fsrc1	%f28,	%f26
	ldd	[%l7 + 0x10],	%f26
	xorcc	%l6,	0x1B70,	%g3
	nop
	setx	loop_919,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	siam	0x1
	movpos	%xcc,	%o0,	%l4
	movrlez	%g6,	%i4,	%o3
loop_919:
	array16	%l2,	%g2,	%o4
	movpos	%xcc,	%o1,	%o6
	fnot2	%f30,	%f12
	bl,pn	%icc,	loop_920
	fmovsleu	%icc,	%f23,	%f0
	siam	0x6
	sethi	0x06DC,	%i7
loop_920:
	alignaddr	%g7,	%g4,	%o2
	smul	%g1,	%l5,	%o7
	sllx	%i2,	0x19,	%i6
	mulscc	%i3,	%o5,	%l1
	bpos,a	%xcc,	loop_921
	umulcc	%l0,	%l3,	%i0
	tsubcc	%i5,	%g5,	%i1
	movn	%xcc,	%g3,	%l6
loop_921:
	xnorcc	%o0,	0x0F0B,	%g6
	fsrc2s	%f17,	%f14
	fbn	%fcc0,	loop_922
	membar	0x25
	fandnot2	%f24,	%f2,	%f8
	fors	%f23,	%f11,	%f17
loop_922:
	udivx	%l4,	0x1A5B,	%i4
	movcc	%icc,	%o3,	%l2
	wr	%g0,	0x0c,	%asi
	stha	%g2,	[%l7 + 0x48] %asi
	fcmpes	%fcc2,	%f28,	%f8
	ld	[%l7 + 0x40],	%f18
	fsrc2	%f6,	%f24
	sth	%o4,	[%l7 + 0x26]
	subccc	%o1,	%i7,	%g7
	edge8ln	%g4,	%o2,	%g1
	array16	%o6,	%l5,	%o7
	movneg	%xcc,	%i2,	%i6
	andn	%o5,	0x1F4A,	%l1
	fmovsgu	%xcc,	%f21,	%f21
	fbuge	%fcc2,	loop_923
	fble,a	%fcc0,	loop_924
	popc	%l0,	%i3
	movvs	%xcc,	%i0,	%l3
loop_923:
	array16	%i5,	%i1,	%g5
loop_924:
	sir	0x173E
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f9,	%f18,	%f26
	udivx	%g3,	0x15FA,	%o0
	umulcc	%g6,	0x16FB,	%l4
	sdiv	%l6,	0x0328,	%o3
	fmovsa	%xcc,	%f31,	%f13
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l2,	%o4
	xnor	%o1,	%i7,	%g4
	tcs	%icc,	0x2
	taddcc	%g7,	0x057A,	%o2
	fmul8sux16	%f14,	%f12,	%f28
	mova	%xcc,	%g1,	%l5
	movrne	%o6,	0x267,	%o7
	bg,a,pt	%xcc,	loop_925
	fcmpgt16	%f6,	%f10,	%i2
	ta	%icc,	0x4
	ld	[%l7 + 0x20],	%f29
loop_925:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	fbuge	%fcc1,	loop_926
	add	%l1,	0x07A6,	%o5
	taddcc	%l0,	%i3,	%l3
	fbn	%fcc2,	loop_927
loop_926:
	tleu	%xcc,	0x2
	movle	%icc,	%i5,	%i0
	tn	%xcc,	0x0
loop_927:
	xnor	%i1,	%g3,	%o0
	bcc	loop_928
	fnor	%f26,	%f0,	%f4
	tg	%icc,	0x4
	subcc	%g5,	0x14CD,	%l4
loop_928:
	edge8ln	%l6,	%g6,	%i4
	subccc	%g2,	0x0854,	%o3
	fmovsleu	%xcc,	%f14,	%f31
	fmovsa	%icc,	%f27,	%f24
	ldx	[%l7 + 0x28],	%o4
	edge16l	%o1,	%l2,	%i7
	brz	%g4,	loop_929
	umulcc	%g7,	%g1,	%l5
	fmovsge	%xcc,	%f1,	%f19
	fmovrslez	%o2,	%f15,	%f25
loop_929:
	edge8	%o7,	%i2,	%o6
	fandnot2	%f24,	%f12,	%f30
	edge32ln	%l1,	%i6,	%l0
	tg	%xcc,	0x2
	alignaddr	%i3,	%l3,	%i5
	tn	%icc,	0x6
	fpadd32	%f28,	%f26,	%f30
	array32	%i0,	%o5,	%g3
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x57] %asi,	%o0
	sth	%i1,	[%l7 + 0x5A]
	membar	0x3D
	fxor	%f2,	%f0,	%f12
	prefetch	[%l7 + 0x6C],	 0x1
	orncc	%l4,	0x1743,	%g5
	orcc	%g6,	0x19A9,	%i4
	fmovd	%f10,	%f6
	tne	%icc,	0x5
	fpsub16	%f10,	%f28,	%f28
	movvs	%xcc,	%g2,	%o3
	edge16n	%o4,	%o1,	%l6
	sll	%l2,	0x1D,	%i7
	fmovsvs	%xcc,	%f15,	%f24
	nop
	set	0x45, %l2
	stb	%g4,	[%l7 + %l2]
	mulscc	%g1,	0x1BC5,	%g7
	edge32ln	%o2,	%l5,	%i2
	movle	%xcc,	%o6,	%l1
	edge32ln	%o7,	%l0,	%i6
	movre	%l3,	%i3,	%i5
	bleu,a,pn	%xcc,	loop_930
	bge,a	%icc,	loop_931
	fmovdne	%icc,	%f31,	%f10
	orncc	%i0,	0x0708,	%g3
loop_930:
	xnorcc	%o0,	0x0CDE,	%o5
loop_931:
	movne	%xcc,	%l4,	%g5
	subccc	%i1,	%i4,	%g2
	addcc	%o3,	%o4,	%g6
	edge16l	%o1,	%l2,	%i7
	edge16n	%g4,	%g1,	%g7
	mova	%xcc,	%l6,	%l5
	tle	%xcc,	0x4
	fbug,a	%fcc0,	loop_932
	smulcc	%o2,	0x0865,	%o6
	tle	%icc,	0x3
	sub	%i2,	%l1,	%o7
loop_932:
	fmovsvc	%icc,	%f15,	%f23
	bneg,pn	%xcc,	loop_933
	ta	%xcc,	0x0
	fmovsl	%xcc,	%f20,	%f22
	tg	%icc,	0x2
loop_933:
	movvs	%xcc,	%l0,	%i6
	fbug	%fcc3,	loop_934
	tpos	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x52] %asi,	%l3
loop_934:
	nop
	wr	%g0,	0x2b,	%asi
	stha	%i3,	[%l7 + 0x4A] %asi
	membar	#Sync
	popc	%i5,	%g3
	fmul8sux16	%f8,	%f6,	%f26
	nop
	setx loop_935, %l0, %l1
	jmpl %l1, %o0
	bleu,pn	%icc,	loop_936
	taddcc	%i0,	0x1C8B,	%o5
	st	%f27,	[%l7 + 0x34]
loop_935:
	taddcctv	%g5,	%i1,	%l4
loop_936:
	movn	%xcc,	%i4,	%g2
	sdivx	%o3,	0x05DD,	%g6
	bge,a,pn	%xcc,	loop_937
	movrgez	%o4,	0x3CA,	%o1
	bcc,a,pt	%xcc,	loop_938
	addcc	%l2,	%g4,	%i7
loop_937:
	ta	%xcc,	0x7
	fbue	%fcc3,	loop_939
loop_938:
	tvs	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g7,	%l6,	%g1
loop_939:
	ldx	[%l7 + 0x50],	%l5
	tvc	%icc,	0x0
	smulcc	%o2,	0x0099,	%i2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x7A] %asi,	%l1
	fmul8sux16	%f0,	%f20,	%f18
	stb	%o7,	[%l7 + 0x60]
	fornot1	%f10,	%f16,	%f8
	tl	%icc,	0x3
	tge	%icc,	0x4
	udivcc	%o6,	0x1BB1,	%i6
	te	%icc,	0x6
	addccc	%l3,	0x1973,	%i3
	movl	%xcc,	%l0,	%g3
	bne,a	loop_940
	edge16l	%i5,	%i0,	%o0
	bleu,pt	%xcc,	loop_941
	std	%o4,	[%l7 + 0x58]
loop_940:
	fpadd16s	%f4,	%f12,	%f27
	fxor	%f26,	%f26,	%f16
loop_941:
	movn	%icc,	%i1,	%l4
	fmovd	%f30,	%f24
	fba	%fcc3,	loop_942
	fblg,a	%fcc0,	loop_943
	edge32l	%i4,	%g5,	%o3
	fmovsneg	%xcc,	%f27,	%f9
loop_942:
	udiv	%g2,	0x10C6,	%o4
loop_943:
	array16	%o1,	%g6,	%l2
	sdivx	%g4,	0x14DD,	%i7
	mulx	%l6,	%g1,	%g7
	set	0x74, %g6
	lda	[%l7 + %g6] 0x0c,	%f22
	srl	%l5,	%i2,	%l1
	edge8ln	%o7,	%o2,	%i6
	tneg	%icc,	0x5
	movrlez	%o6,	%i3,	%l3
	tgu	%xcc,	0x5
	tn	%icc,	0x3
	movcc	%icc,	%g3,	%i5
	srl	%i0,	0x04,	%o0
	movrne	%o5,	%i1,	%l4
	edge32n	%i4,	%g5,	%o3
	addcc	%g2,	%l0,	%o4
	movleu	%xcc,	%g6,	%o1
	fbl	%fcc2,	loop_944
	sir	0x16DD
	orncc	%g4,	0x18C6,	%i7
	edge16l	%l6,	%l2,	%g1
loop_944:
	subc	%g7,	%l5,	%i2
	umul	%o7,	%l1,	%i6
	udivx	%o6,	0x0C3A,	%o2
	movle	%icc,	%l3,	%g3
	fnor	%f22,	%f2,	%f4
	set	0x50, %l3
	swapa	[%l7 + %l3] 0x11,	%i5
	tn	%xcc,	0x1
	fnot1	%f16,	%f10
	movleu	%icc,	%i3,	%i0
	fpackfix	%f10,	%f10
	tcs	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x71] %asi,	%o5
	movrne	%i1,	0x2DD,	%o0
	bvs,a,pt	%xcc,	loop_945
	orncc	%i4,	0x1276,	%g5
	andncc	%l4,	%o3,	%g2
	membar	0x45
loop_945:
	movvc	%icc,	%o4,	%g6
	set	0x58, %o4
	ldsba	[%l7 + %o4] 0x10,	%o1
	bvs,a	loop_946
	fbuge	%fcc2,	loop_947
	fmovscc	%xcc,	%f11,	%f14
	fbne,a	%fcc1,	loop_948
loop_946:
	edge16	%g4,	%l0,	%i7
loop_947:
	bge,a	%xcc,	loop_949
	fpack32	%f28,	%f4,	%f30
loop_948:
	fnors	%f24,	%f19,	%f7
	fbug	%fcc3,	loop_950
loop_949:
	movrlz	%l6,	0x097,	%g1
	sll	%l2,	0x1F,	%l5
	addc	%i2,	0x1C64,	%g7
loop_950:
	alignaddrl	%o7,	%i6,	%o6
	fmovsne	%xcc,	%f18,	%f11
	movgu	%xcc,	%l1,	%l3
	movneg	%xcc,	%g3,	%i5
	ta	%xcc,	0x3
	fnors	%f6,	%f1,	%f24
	umul	%o2,	0x022E,	%i3
	fcmpgt32	%f22,	%f18,	%o5
	fbul,a	%fcc2,	loop_951
	brnz	%i1,	loop_952
	movrne	%o0,	0x119,	%i4
	andn	%i0,	%g5,	%l4
loop_951:
	fmovdcs	%xcc,	%f20,	%f24
loop_952:
	tsubcc	%o3,	0x1950,	%g2
	alignaddrl	%o4,	%o1,	%g4
	fmuld8ulx16	%f7,	%f19,	%f24
	tle	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f8,	%f2
	tsubcc	%l0,	%g6,	%i7
	and	%l6,	0x0749,	%g1
	for	%f12,	%f16,	%f4
	tvs	%xcc,	0x3
	movle	%xcc,	%l2,	%l5
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g7
	fzero	%f10
	orncc	%o7,	%i6,	%i2
	tleu	%xcc,	0x5
	orn	%l1,	%o6,	%g3
	smulcc	%l3,	%o2,	%i5
	movcc	%icc,	%i3,	%i1
	tg	%xcc,	0x1
	std	%f30,	[%l7 + 0x28]
	lduh	[%l7 + 0x3A],	%o5
	umul	%i4,	0x0009,	%o0
	brlz,a	%g5,	loop_953
	sdivx	%l4,	0x117E,	%o3
	fornot1s	%f10,	%f28,	%f30
	edge16n	%g2,	%i0,	%o1
loop_953:
	subc	%g4,	0x1DF5,	%l0
	taddcc	%o4,	%i7,	%g6
	bge,a	%icc,	loop_954
	fornot2s	%f8,	%f18,	%f31
	fba,a	%fcc2,	loop_955
	bne,a	loop_956
loop_954:
	or	%g1,	%l2,	%l6
	brlez	%l5,	loop_957
loop_955:
	tsubcctv	%g7,	%o7,	%i6
loop_956:
	fmovdneg	%xcc,	%f0,	%f18
	array8	%i2,	%o6,	%g3
loop_957:
	mulx	%l3,	0x077E,	%l1
	fzero	%f28
	movrlez	%o2,	%i3,	%i1
	edge16l	%o5,	%i5,	%i4
	fmovsle	%icc,	%f26,	%f17
	edge16	%g5,	%l4,	%o3
	subccc	%o0,	0x17CC,	%i0
	srax	%g2,	0x1D,	%g4
	smul	%l0,	%o4,	%i7
	srax	%o1,	%g1,	%l2
	tvs	%xcc,	0x7
	mova	%xcc,	%l6,	%g6
	tsubcctv	%g7,	%o7,	%l5
	or	%i2,	%o6,	%i6
	std	%l2,	[%l7 + 0x78]
	movl	%icc,	%g3,	%o2
	fmovdn	%xcc,	%f3,	%f4
	fabss	%f23,	%f25
	sir	0x1CA6
	fmovsa	%icc,	%f16,	%f12
	movleu	%xcc,	%i3,	%i1
	fcmple16	%f10,	%f2,	%o5
	fabsd	%f0,	%f8
	fpadd16s	%f11,	%f26,	%f21
	mova	%xcc,	%l1,	%i4
	bg,a	loop_958
	tn	%icc,	0x6
	orncc	%i5,	%l4,	%g5
	fmovrdlz	%o0,	%f24,	%f24
loop_958:
	fbule	%fcc1,	loop_959
	fzeros	%f4
	membar	0x12
	set	0x50, %i2
	ldstuba	[%l7 + %i2] 0x18,	%i0
loop_959:
	and	%g2,	0x179C,	%g4
	fbug	%fcc1,	loop_960
	andcc	%l0,	0x1022,	%o3
	fandnot1	%f12,	%f26,	%f2
	tge	%icc,	0x1
loop_960:
	tge	%xcc,	0x2
	fmovsg	%xcc,	%f7,	%f18
	fblg	%fcc2,	loop_961
	fba	%fcc0,	loop_962
	subc	%o4,	%i7,	%o1
	movn	%icc,	%g1,	%l2
loop_961:
	nop
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x18,	%l6
loop_962:
	xorcc	%g6,	0x1EF3,	%g7
	fandnot2s	%f22,	%f13,	%f1
	set	0x6C, %o3
	swapa	[%l7 + %o3] 0x88,	%l5
	movrne	%o7,	%o6,	%i2
	mulscc	%i6,	%l3,	%o2
	fble,a	%fcc0,	loop_963
	ldx	[%l7 + 0x28],	%g3
	tvs	%icc,	0x2
	edge32	%i1,	%o5,	%l1
loop_963:
	orcc	%i4,	0x192B,	%i5
	fmovrsgz	%l4,	%f27,	%f9
	edge16l	%g5,	%o0,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i3,	%g4
	brnz,a	%g2,	loop_964
	movcc	%xcc,	%o3,	%l0
	movleu	%xcc,	%o4,	%i7
	movvs	%xcc,	%g1,	%l2
loop_964:
	siam	0x0
	tvs	%icc,	0x5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%l6
	tsubcc	%g7,	%l5,	%g6
	taddcc	%o7,	%o6,	%i6
	fcmpd	%fcc0,	%f14,	%f12
	orcc	%i2,	0x08BC,	%o2
	tneg	%xcc,	0x0
	sdivcc	%g3,	0x0CAD,	%l3
	edge32l	%i1,	%l1,	%o5
	edge8n	%i5,	%l4,	%i4
	tsubcc	%g5,	0x0B2B,	%i0
	edge32n	%i3,	%g4,	%g2
	udiv	%o0,	0x0717,	%l0
	fone	%f20
	fbue	%fcc3,	loop_965
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f13,	%f15
	st	%f19,	[%l7 + 0x34]
loop_965:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0A] %asi,	%o4
	fmovrse	%o3,	%f7,	%f7
	bvs,a	loop_966
	tn	%icc,	0x7
	fcmps	%fcc2,	%f20,	%f10
	set	0x1C, %o1
	lda	[%l7 + %o1] 0x14,	%f24
loop_966:
	udivx	%i7,	0x019B,	%l2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x21] %asi,	%o1
	fcmpd	%fcc1,	%f10,	%f26
	prefetch	[%l7 + 0x4C],	 0x1
	fnors	%f26,	%f17,	%f10
	nop
	setx	loop_967,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl,pt	%xcc,	loop_968
	andncc	%g1,	%l6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_967:
	orncc	%g6,	0x00F2,	%l5
loop_968:
	fpsub16s	%f25,	%f22,	%f9
	mulscc	%o6,	%i6,	%i2
	edge16	%o2,	%o7,	%g3
	tpos	%icc,	0x5
	fbug	%fcc1,	loop_969
	movpos	%icc,	%l3,	%i1
	tl	%xcc,	0x1
	fba	%fcc2,	loop_970
loop_969:
	tvc	%icc,	0x4
	ta	%icc,	0x6
	fcmped	%fcc0,	%f18,	%f18
loop_970:
	nop
	set	0x4A, %i3
	lduba	[%l7 + %i3] 0x89,	%o5
	tleu	%xcc,	0x1
	andncc	%i5,	%l1,	%i4
	fmul8x16	%f3,	%f0,	%f12
	edge16l	%l4,	%g5,	%i0
	ldstub	[%l7 + 0x4F],	%i3
	fmovrsgz	%g4,	%f7,	%f29
	tle	%xcc,	0x5
	set	0x24, %l0
	stba	%g2,	[%l7 + %l0] 0x27
	membar	#Sync
	fcmpeq32	%f26,	%f30,	%o0
	tcs	%icc,	0x6
	movvc	%xcc,	%l0,	%o3
	set	0x58, %i7
	stha	%i7,	[%l7 + %i7] 0x19
	subcc	%l2,	%o4,	%o1
	bn,pn	%icc,	loop_971
	sllx	%g1,	%g7,	%g6
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_971:
	fbe,a	%fcc1,	loop_972
	lduh	[%l7 + 0x3C],	%l5
	bge,a	loop_973
	ldstub	[%l7 + 0x25],	%o6
loop_972:
	movle	%icc,	%i6,	%l6
	fmovdvs	%icc,	%f1,	%f6
loop_973:
	and	%o2,	%i2,	%o7
	alignaddrl	%l3,	%i1,	%o5
	fbne	%fcc2,	loop_974
	movvs	%icc,	%i5,	%g3
	set	0x19, %l4
	ldstuba	[%l7 + %l4] 0x88,	%l1
loop_974:
	edge16	%l4,	%g5,	%i4
	fbe,a	%fcc1,	loop_975
	andn	%i0,	%g4,	%i3
	taddcc	%g2,	%o0,	%l0
	sdivcc	%o3,	0x04BA,	%i7
loop_975:
	tsubcc	%o4,	%o1,	%l2
	fmovrsne	%g7,	%f12,	%f14
	fmovsa	%xcc,	%f15,	%f22
	tpos	%xcc,	0x7
	movneg	%icc,	%g6,	%l5
	set	0x10, %o2
	stxa	%g1,	[%l7 + %o2] 0x2b
	membar	#Sync
	fcmped	%fcc0,	%f22,	%f30
	orn	%i6,	%l6,	%o2
	te	%xcc,	0x5
	movgu	%icc,	%o6,	%o7
	add	%i2,	%l3,	%i1
	xorcc	%o5,	%g3,	%l1
	orcc	%l4,	%g5,	%i4
	edge16ln	%i5,	%g4,	%i3
	sdiv	%g2,	0x0F72,	%i0
	fnegs	%f3,	%f5
	fpadd16	%f16,	%f10,	%f28
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l0,	%o0
	addccc	%i7,	0x1801,	%o4
	orncc	%o3,	0x1498,	%o1
	tg	%xcc,	0x3
	tsubcctv	%g7,	0x164A,	%g6
	srlx	%l2,	%l5,	%g1
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x14,	 0x3
	call	loop_976
	fmovrse	%o2,	%f26,	%f31
	fornot2s	%f14,	%f27,	%f18
	srlx	%o6,	0x1C,	%l6
loop_976:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x6
	edge32	%o7,	%i2,	%i1
	sdiv	%l3,	0x0EB3,	%g3
	fbue,a	%fcc3,	loop_977
	movvc	%icc,	%l1,	%o5
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x10,	%l4
loop_977:
	sir	0x0839
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g5
	array32	%i5,	%i4,	%g4
	fmovrslez	%i3,	%f0,	%f13
	array32	%i0,	%g2,	%l0
	bcc,a	loop_978
	orncc	%i7,	%o0,	%o3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o1
loop_978:
	alignaddr	%o4,	%g7,	%g6
	ldsh	[%l7 + 0x28],	%l2
	fmul8x16al	%f20,	%f13,	%f28
	tsubcc	%g1,	%i6,	%o2
	fmovrde	%o6,	%f26,	%f4
	fmovrde	%l5,	%f18,	%f8
	tneg	%icc,	0x6
	tge	%icc,	0x0
	edge32n	%l6,	%i2,	%o7
	fnor	%f4,	%f16,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i1,	%g3,	%l1
	movneg	%icc,	%l3,	%o5
	movre	%g5,	%l4,	%i5
	ldsh	[%l7 + 0x2C],	%i4
	bne,pt	%icc,	loop_979
	fmovdl	%xcc,	%f13,	%f5
	fmovsgu	%xcc,	%f26,	%f29
	fxnor	%f30,	%f6,	%f18
loop_979:
	movg	%icc,	%g4,	%i0
	set	0x50, %i1
	sta	%f29,	[%l7 + %i1] 0x11
	fnot2s	%f11,	%f6
	fba	%fcc2,	loop_980
	fxor	%f0,	%f6,	%f18
	bvs,a	%icc,	loop_981
	fnot2s	%f1,	%f28
loop_980:
	std	%i2,	[%l7 + 0x70]
	te	%xcc,	0x2
loop_981:
	movge	%xcc,	%l0,	%g2
	fcmpes	%fcc1,	%f5,	%f19
	edge32	%i7,	%o3,	%o1
	array32	%o4,	%o0,	%g6
	movpos	%xcc,	%g7,	%l2
	array32	%i6,	%o2,	%g1
	alignaddr	%l5,	%l6,	%i2
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bge,pt	%icc,	loop_982
	movrgez	%o6,	0x2FE,	%i1
	stx	%o7,	[%l7 + 0x38]
	andncc	%g3,	%l1,	%o5
loop_982:
	fands	%f5,	%f13,	%f27
	tne	%xcc,	0x3
	tle	%icc,	0x0
	fbu	%fcc2,	loop_983
	tvs	%xcc,	0x1
	set	0x48, %i0
	ldswa	[%l7 + %i0] 0x11,	%g5
loop_983:
	andcc	%l3,	%i5,	%i4
	popc	%g4,	%l4
	tcc	%icc,	0x5
	udivx	%i3,	0x061F,	%i0
	smulcc	%g2,	0x0EC2,	%i7
	udiv	%l0,	0x1E55,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%o1,	loop_984
	sir	0x19EA
	sth	%o4,	[%l7 + 0x66]
	fandnot2s	%f11,	%f31,	%f18
loop_984:
	tl	%icc,	0x4
	sethi	0x197B,	%g6
	set	0x28, %l1
	sta	%f21,	[%l7 + %l1] 0x89
	umul	%o0,	0x0777,	%g7
	fand	%f30,	%f26,	%f26
	umul	%l2,	%o2,	%i6
	membar	0x6B
	movrlz	%g1,	0x29E,	%l5
	tcs	%icc,	0x6
	orn	%i2,	0x0485,	%l6
	bge,pt	%xcc,	loop_985
	or	%o6,	%o7,	%i1
	bgu,a,pn	%icc,	loop_986
	movre	%g3,	0x38C,	%o5
loop_985:
	movge	%icc,	%g5,	%l3
	stx	%l1,	[%l7 + 0x08]
loop_986:
	brnz	%i4,	loop_987
	ldstub	[%l7 + 0x3A],	%i5
	fpadd16s	%f29,	%f9,	%f17
	wr	%g0,	0xea,	%asi
	stba	%l4,	[%l7 + 0x6F] %asi
	membar	#Sync
loop_987:
	fnands	%f29,	%f30,	%f31
	movl	%icc,	%g4,	%i3
	movrlez	%i0,	0x19E,	%i7
	edge8l	%l0,	%o3,	%g2
	nop
	setx	loop_988,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%o1,	%g6,	%o4
	movre	%g7,	%o0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_988:
	mulscc	%o2,	0x116C,	%g1
	fbue,a	%fcc2,	loop_989
	array32	%i6,	%l5,	%l6
	tsubcc	%o6,	%i2,	%o7
	lduh	[%l7 + 0x64],	%i1
loop_989:
	nop
	set	0x17, %l6
	ldsba	[%l7 + %l6] 0x89,	%g3
	call	loop_990
	tle	%icc,	0x6
	set	0x72, %o0
	stba	%g5,	[%l7 + %o0] 0x15
loop_990:
	movcs	%icc,	%l3,	%o5
	ta	%icc,	0x6
	fcmpne16	%f18,	%f18,	%l1
	tvs	%icc,	0x4
	fmovrdgz	%i5,	%f14,	%f16
	fmovd	%f14,	%f14
	tcs	%xcc,	0x2
	wr	%g0,	0x27,	%asi
	stda	%l4,	[%l7 + 0x50] %asi
	membar	#Sync
	smulcc	%g4,	%i3,	%i0
	udiv	%i4,	0x005F,	%i7
	fpsub32	%f18,	%f18,	%f18
	andncc	%l0,	%o3,	%g2
	smulcc	%o1,	0x1CBC,	%g6
	fbuge,a	%fcc2,	loop_991
	fandnot1	%f22,	%f4,	%f12
	std	%f30,	[%l7 + 0x58]
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%o4
loop_991:
	edge8n	%o0,	%g7,	%l2
	tne	%icc,	0x7
	brlz	%g1,	loop_992
	sir	0x14CE
	movg	%icc,	%o2,	%l5
	fmovdleu	%icc,	%f13,	%f20
loop_992:
	taddcc	%i6,	0x1689,	%o6
	movrlez	%i2,	%o7,	%i1
	movleu	%xcc,	%g3,	%l6
	array32	%l3,	%g5,	%o5
	movpos	%xcc,	%l1,	%i5
	sth	%g4,	[%l7 + 0x36]
	move	%xcc,	%l4,	%i3
	popc	%i0,	%i7
	fsrc1s	%f1,	%f30
	fandnot2s	%f18,	%f13,	%f7
	fone	%f26
	movleu	%xcc,	%i4,	%l0
	sllx	%o3,	%g2,	%o1
	popc	%g6,	%o0
	taddcc	%o4,	%g7,	%g1
	orcc	%l2,	%o2,	%i6
	nop
	setx	loop_993,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%o6,	%l5,	%i2
	set	0x50, %g5
	ldswa	[%l7 + %g5] 0x15,	%i1
loop_993:
	movcc	%icc,	%g3,	%l6
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrgz	%l3,	0x385,	%o7
	stbar
	movcs	%xcc,	%g5,	%l1
	set	0x14, %o5
	stba	%o5,	[%l7 + %o5] 0x15
	bneg,a	%icc,	loop_994
	bl	loop_995
	fbg	%fcc2,	loop_996
	udivx	%i5,	0x09DA,	%g4
loop_994:
	srax	%i3,	0x1F,	%i0
loop_995:
	brlz	%i7,	loop_997
loop_996:
	ta	%icc,	0x6
	movn	%xcc,	%l4,	%l0
	nop
	setx	loop_998,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_997:
	fnors	%f17,	%f2,	%f22
	sdiv	%o3,	0x1551,	%g2
	bvc,pt	%xcc,	loop_999
loop_998:
	fmovrslz	%i4,	%f5,	%f28
	stb	%o1,	[%l7 + 0x49]
	tge	%xcc,	0x4
loop_999:
	movrgez	%g6,	%o4,	%g7
	edge8ln	%g1,	%l2,	%o2
	udivcc	%o0,	0x0B01,	%o6
	tg	%xcc,	0x5
	edge32n	%l5,	%i2,	%i1
	movvc	%icc,	%g3,	%l6
	set	0x5C, %i5
	ldsha	[%l7 + %i5] 0x81,	%l3
	mova	%icc,	%o7,	%i6
	sub	%g5,	%o5,	%i5
	smulcc	%l1,	%i3,	%g4
	set	0x5A, %g3
	ldsha	[%l7 + %g3] 0x80,	%i0
	sdivx	%l4,	0x0846,	%i7
	fbe,a	%fcc1,	loop_1000
	taddcc	%l0,	0x06D4,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%o3
loop_1000:
	fsrc2	%f30,	%f22
	wr	%g0,	0x10,	%asi
	stwa	%g6,	[%l7 + 0x60] %asi
	sll	%o4,	0x1B,	%g7
	edge8ln	%o1,	%l2,	%o2
	edge8ln	%g1,	%o0,	%l5
	addccc	%i2,	%o6,	%g3
	tl	%icc,	0x4
	fnot1s	%f0,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc1,	loop_1001
	smul	%l6,	0x0E98,	%l3
	tneg	%xcc,	0x0
	sir	0x0C49
loop_1001:
	flush	%l7 + 0x54
	edge32ln	%o7,	%i6,	%g5
	fmovd	%f14,	%f20
	fmovdl	%icc,	%f31,	%f26
	popc	%o5,	%i5
	prefetch	[%l7 + 0x44],	 0x0
	xnor	%l1,	0x10C9,	%i1
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g4
	subc	%i3,	0x0101,	%l4
	fnors	%f28,	%f2,	%f6
	set	0x0B, %g1
	lduba	[%l7 + %g1] 0x80,	%i0
	fors	%f13,	%f29,	%f23
	addcc	%i7,	%g2,	%l0
	movn	%icc,	%i4,	%g6
	sub	%o4,	0x0B67,	%o3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x10] %asi,	%o1
	fmovsgu	%icc,	%f23,	%f4
	fmovdcs	%icc,	%f30,	%f5
	fnegs	%f17,	%f4
	fpsub32s	%f2,	%f9,	%f8
	udivcc	%l2,	0x0742,	%o2
	tn	%icc,	0x6
	fmovsvc	%icc,	%f10,	%f18
	fbge	%fcc1,	loop_1002
	sir	0x0C81
	tvc	%icc,	0x4
	bvc,a,pn	%xcc,	loop_1003
loop_1002:
	fmovdcs	%xcc,	%f7,	%f16
	ba,a	%icc,	loop_1004
	te	%xcc,	0x6
loop_1003:
	ld	[%l7 + 0x14],	%f31
	wr	%g0,	0x21,	%asi
	stxa	%g1,	[%g0 + 0x110] %asi
loop_1004:
	fors	%f15,	%f21,	%f0
	tleu	%icc,	0x6
	edge32n	%g7,	%l5,	%i2
	mova	%xcc,	%o0,	%g3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x27,	%i6
	fmovsn	%icc,	%f9,	%f16
	edge32ln	%l3,	%o7,	%i6
	addcc	%o6,	0x0F79,	%o5
	tgu	%icc,	0x0
	bge	loop_1005
	be	%icc,	loop_1006
	subccc	%i5,	%g5,	%i1
	xor	%g4,	0x0729,	%l1
loop_1005:
	movg	%xcc,	%i3,	%i0
loop_1006:
	nop
	set	0x13, %g4
	ldstuba	[%l7 + %g4] 0x18,	%i7
	bvc,pn	%icc,	loop_1007
	fsrc2s	%f31,	%f29
	udivcc	%l4,	0x09AE,	%l0
	movgu	%icc,	%i4,	%g6
loop_1007:
	sllx	%o4,	%o3,	%o1
	brnz	%g2,	loop_1008
	fba,a	%fcc3,	loop_1009
	xnor	%o2,	%l2,	%g7
	bvc,pn	%icc,	loop_1010
loop_1008:
	smulcc	%g1,	0x04BF,	%i2
loop_1009:
	fbule,a	%fcc0,	loop_1011
	membar	0x18
loop_1010:
	fmovscs	%xcc,	%f21,	%f18
	movvc	%xcc,	%o0,	%l5
loop_1011:
	sth	%g3,	[%l7 + 0x56]
	andncc	%l6,	%l3,	%o7
	lduw	[%l7 + 0x54],	%o6
	movrgez	%o5,	%i6,	%g5
	ldd	[%l7 + 0x68],	%f6
	fble	%fcc2,	loop_1012
	bgu,a	%icc,	loop_1013
	movgu	%xcc,	%i1,	%i5
	sir	0x0DB7
loop_1012:
	fbul,a	%fcc2,	loop_1014
loop_1013:
	bneg,a	%icc,	loop_1015
	ldd	[%l7 + 0x20],	%f30
	ldsb	[%l7 + 0x67],	%g4
loop_1014:
	stb	%l1,	[%l7 + 0x5E]
loop_1015:
	ldsh	[%l7 + 0x50],	%i0
	tvc	%xcc,	0x4
	fbuge	%fcc3,	loop_1016
	fornot1	%f28,	%f6,	%f14
	ldsw	[%l7 + 0x38],	%i3
	swap	[%l7 + 0x6C],	%i7
loop_1016:
	edge8n	%l0,	%i4,	%g6
	wr	%g0,	0x81,	%asi
	stda	%l4,	[%l7 + 0x28] %asi
	addccc	%o3,	%o1,	%g2
	sra	%o4,	%l2,	%o2
	ta	%xcc,	0x0
	edge16	%g1,	%i2,	%g7
	movrgz	%l5,	%g3,	%l6
	udivx	%l3,	0x05AE,	%o0
	edge32ln	%o6,	%o5,	%i6
	stb	%o7,	[%l7 + 0x7A]
	srax	%i1,	0x10,	%i5
	movl	%icc,	%g4,	%l1
	srl	%g5,	0x03,	%i0
	movrgz	%i3,	%l0,	%i4
	movne	%icc,	%i7,	%l4
	movneg	%xcc,	%o3,	%g6
	tge	%icc,	0x1
	movrlz	%o1,	0x2CF,	%g2
	fbo,a	%fcc2,	loop_1017
	addcc	%o4,	0x1D01,	%o2
	fsrc2	%f20,	%f20
	edge16ln	%g1,	%l2,	%g7
loop_1017:
	ld	[%l7 + 0x30],	%f9
	fandnot1s	%f12,	%f11,	%f8
	fbg	%fcc1,	loop_1018
	movcs	%icc,	%l5,	%g3
	addccc	%l6,	%l3,	%i2
	fabsd	%f18,	%f4
loop_1018:
	and	%o0,	0x1506,	%o5
	bvs,a	loop_1019
	fsrc2	%f10,	%f22
	nop
	setx loop_1020, %l0, %l1
	jmpl %l1, %o6
	edge16l	%i6,	%o7,	%i5
loop_1019:
	movrne	%g4,	0x191,	%i1
	xnorcc	%l1,	%g5,	%i3
loop_1020:
	edge16n	%i0,	%i4,	%i7
	lduw	[%l7 + 0x78],	%l0
	tsubcctv	%l4,	%o3,	%o1
	srax	%g2,	0x11,	%o4
	fmovdcc	%icc,	%f22,	%f9
	taddcctv	%g6,	%o2,	%l2
	xor	%g1,	%l5,	%g3
	nop
	setx loop_1021, %l0, %l1
	jmpl %l1, %l6
	tcc	%icc,	0x6
	fnot1s	%f8,	%f16
	movrlz	%l3,	%i2,	%o0
loop_1021:
	fcmple16	%f0,	%f30,	%o5
	fabss	%f19,	%f9
	tneg	%icc,	0x3
	tsubcc	%g7,	0x1B49,	%i6
	bge,pn	%icc,	loop_1022
	movle	%xcc,	%o6,	%o7
	ta	%xcc,	0x6
	fcmpgt16	%f0,	%f28,	%i5
loop_1022:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f23,	[%l7 + 0x50] %asi
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i1
	orcc	%l1,	0x0BE1,	%g5
	brgez	%i3,	loop_1023
	popc	0x0275,	%i0
	sll	%i4,	0x15,	%i7
	umulcc	%g4,	%l0,	%l4
loop_1023:
	fbg,a	%fcc3,	loop_1024
	addccc	%o1,	0x13D8,	%o3
	fmovsg	%icc,	%f25,	%f11
	movgu	%xcc,	%g2,	%g6
loop_1024:
	movpos	%xcc,	%o4,	%l2
	addccc	%o2,	%l5,	%g1
	movrgz	%l6,	%g3,	%i2
	tcc	%xcc,	0x1
	tg	%xcc,	0x6
	brgz	%l3,	loop_1025
	fandnot1s	%f14,	%f1,	%f30
	movgu	%xcc,	%o0,	%g7
	fmovrde	%o5,	%f24,	%f2
loop_1025:
	smul	%i6,	0x1FD7,	%o7
	popc	0x081B,	%o6
	fsrc1s	%f17,	%f23
	flush	%l7 + 0x38
	edge16	%i1,	%l1,	%i5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	tsubcc	%g5,	0x0B53,	%i4
	sir	0x0743
	ldd	[%l7 + 0x68],	%i0
	movrlez	%i7,	%l0,	%g4
	tl	%icc,	0x0
	alignaddrl	%o1,	%l4,	%o3
	fmovsg	%xcc,	%f8,	%f4
	bl,pn	%icc,	loop_1026
	movrgz	%g6,	%g2,	%o4
	std	%f24,	[%l7 + 0x68]
	umul	%l2,	0x02F5,	%l5
loop_1026:
	sir	0x1D31
	or	%g1,	%l6,	%o2
	stbar
	andcc	%i2,	0x0E2B,	%l3
	tcc	%xcc,	0x5
	fmovdcs	%icc,	%f11,	%f9
	movn	%xcc,	%g3,	%g7
	fzero	%f18
	tcc	%xcc,	0x6
	fmovdpos	%xcc,	%f10,	%f30
	fand	%f6,	%f10,	%f30
	movl	%xcc,	%o5,	%o0
	movrne	%i6,	0x027,	%o7
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovde	%icc,	%f29,	%f6
	tgu	%xcc,	0x7
	and	%o6,	%l1,	%i5
	fmovsne	%icc,	%f12,	%f17
	sllx	%i3,	%g5,	%i1
	movrlez	%i0,	%i7,	%l0
	movgu	%xcc,	%g4,	%o1
	addccc	%i4,	%l4,	%g6
	flush	%l7 + 0x60
	fble,a	%fcc1,	loop_1027
	movne	%icc,	%o3,	%g2
	udivx	%l2,	0x0163,	%o4
	tcc	%icc,	0x1
loop_1027:
	bl,a,pt	%xcc,	loop_1028
	udivcc	%l5,	0x0643,	%l6
	addccc	%g1,	0x1466,	%o2
	fxor	%f18,	%f8,	%f0
loop_1028:
	udivcc	%i2,	0x0332,	%g3
	fbge	%fcc0,	loop_1029
	fxor	%f30,	%f0,	%f8
	tpos	%icc,	0x4
	srlx	%g7,	0x16,	%o5
loop_1029:
	xorcc	%o0,	%i6,	%l3
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%o7,	%l1,	%o6
	tsubcctv	%i5,	%g5,	%i1
	set	0x69, %o6
	lduba	[%l7 + %o6] 0x80,	%i3
	movg	%xcc,	%i7,	%l0
	brgez	%i0,	loop_1030
	edge32l	%g4,	%o1,	%i4
	brgz,a	%l4,	loop_1031
	fxnor	%f10,	%f20,	%f14
loop_1030:
	and	%g6,	%o3,	%g2
	bne,a,pt	%icc,	loop_1032
loop_1031:
	tvs	%xcc,	0x5
	stbar
	umulcc	%o4,	0x19D3,	%l5
loop_1032:
	movrgez	%l6,	0x3EC,	%l2
	tneg	%xcc,	0x5
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x1f
	membar	#Sync
	fandnot2s	%f23,	%f0,	%f22
	andncc	%g1,	%o2,	%g3
	edge32l	%i2,	%g7,	%o5
	fmul8x16au	%f25,	%f21,	%f14
	edge32n	%o0,	%i6,	%o7
	nop
	setx	loop_1033,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%xcc,	0x0
	umul	%l3,	%l1,	%i5
	ldd	[%l7 + 0x78],	%o6
loop_1033:
	te	%icc,	0x5
	fmovdvs	%icc,	%f31,	%f27
	andcc	%g5,	%i3,	%i7
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0x2
	fmul8x16au	%f26,	%f9,	%f10
	fnand	%f0,	%f14,	%f24
	subcc	%i1,	0x186A,	%g4
	ble,pn	%xcc,	loop_1034
	fmovdcs	%icc,	%f20,	%f12
	tcc	%icc,	0x6
	sdivcc	%i0,	0x1C3A,	%o1
loop_1034:
	udiv	%l4,	0x03BD,	%i4
	xor	%o3,	0x0F12,	%g6
	tvc	%icc,	0x3
	srax	%o4,	%l5,	%g2
	mova	%icc,	%l6,	%l2
	bneg	loop_1035
	fbl,a	%fcc1,	loop_1036
	ble	%xcc,	loop_1037
	call	loop_1038
loop_1035:
	sethi	0x1F2C,	%g1
loop_1036:
	pdist	%f10,	%f22,	%f10
loop_1037:
	tleu	%icc,	0x5
loop_1038:
	sir	0x1B8E
	addc	%g3,	0x0EC2,	%i2
	movl	%icc,	%o2,	%g7
	fbge,a	%fcc2,	loop_1039
	fmovrdgez	%o0,	%f4,	%f10
	st	%f2,	[%l7 + 0x64]
	array16	%o5,	%o7,	%i6
loop_1039:
	movvc	%xcc,	%l1,	%l3
	sra	%i5,	%o6,	%i3
	movne	%icc,	%g5,	%l0
	fcmped	%fcc3,	%f8,	%f20
	fcmpeq32	%f8,	%f4,	%i7
	array32	%g4,	%i1,	%o1
	and	%i0,	%i4,	%l4
	fbn,a	%fcc1,	loop_1040
	bpos,a,pn	%icc,	loop_1041
	movvc	%icc,	%g6,	%o4
	movne	%xcc,	%l5,	%g2
loop_1040:
	sub	%l6,	%o3,	%g1
loop_1041:
	te	%icc,	0x4
	set	0x21, %o7
	stba	%l2,	[%l7 + %o7] 0x19
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%i2
	ldub	[%l7 + 0x49],	%g3
	edge8	%g7,	%o0,	%o5
	orncc	%o7,	%i6,	%o2
	fmovsge	%icc,	%f9,	%f27
	andncc	%l3,	%i5,	%l1
	taddcctv	%o6,	0x1467,	%g5
	mulscc	%i3,	0x167A,	%l0
	edge8	%g4,	%i1,	%o1
	array16	%i7,	%i0,	%i4
	smul	%g6,	%o4,	%l5
	xnorcc	%l4,	0x1A98,	%l6
	edge32l	%g2,	%o3,	%l2
	orncc	%i2,	%g1,	%g7
	fcmped	%fcc0,	%f0,	%f10
	fpack16	%f6,	%f28
	fnot2s	%f5,	%f23
	orcc	%g3,	%o0,	%o5
	fbug	%fcc1,	loop_1042
	sir	0x0622
	orcc	%i6,	%o2,	%o7
	fmovrdlez	%i5,	%f28,	%f26
loop_1042:
	movne	%icc,	%l1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc0,	loop_1043
	or	%g5,	%l3,	%i3
	fxors	%f9,	%f7,	%f31
	movgu	%xcc,	%l0,	%i1
loop_1043:
	srl	%o1,	%i7,	%g4
	fandnot2s	%f28,	%f27,	%f19
	subcc	%i0,	%g6,	%o4
	fpadd16	%f10,	%f22,	%f22
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x4C] %asi
	te	%xcc,	0x3
	edge32	%l5,	%l4,	%l6
	sdivcc	%g2,	0x089D,	%o3
	brz,a	%l2,	loop_1044
	bneg,a	loop_1045
	xor	%i4,	%i2,	%g1
	movg	%icc,	%g3,	%o0
loop_1044:
	edge8ln	%g7,	%o5,	%o2
loop_1045:
	movn	%icc,	%o7,	%i6
	bcs,a,pt	%xcc,	loop_1046
	fbuge	%fcc0,	loop_1047
	ba	%xcc,	loop_1048
	fba,a	%fcc3,	loop_1049
loop_1046:
	movpos	%xcc,	%i5,	%l1
loop_1047:
	nop
	setx	loop_1050,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1048:
	bpos,pt	%icc,	loop_1051
loop_1049:
	andncc	%g5,	%o6,	%i3
	tge	%icc,	0x7
loop_1050:
	xorcc	%l3,	%i1,	%o1
loop_1051:
	edge8	%l0,	%i7,	%i0
	fbuge	%fcc0,	loop_1052
	and	%g4,	%o4,	%g6
	fmovscs	%icc,	%f21,	%f6
	fmovsl	%xcc,	%f18,	%f8
loop_1052:
	tle	%icc,	0x5
	xnorcc	%l5,	%l6,	%l4
	st	%f7,	[%l7 + 0x78]
	bcc,pt	%icc,	loop_1053
	te	%xcc,	0x2
	or	%o3,	%g2,	%i4
	addc	%l2,	0x1B21,	%g1
loop_1053:
	lduw	[%l7 + 0x20],	%i2
	fxors	%f22,	%f29,	%f19
	movneg	%icc,	%g3,	%g7
	fmovsge	%icc,	%f26,	%f25
	sth	%o5,	[%l7 + 0x60]
	movcc	%xcc,	%o0,	%o2
	edge8ln	%o7,	%i5,	%i6
	xorcc	%g5,	0x1BEC,	%o6
	brz	%l1,	loop_1054
	orn	%i3,	0x0B4A,	%l3
	edge32ln	%o1,	%i1,	%l0
	array16	%i7,	%i0,	%g4
loop_1054:
	movleu	%icc,	%o4,	%l5
	add	%l6,	%g6,	%o3
	srlx	%g2,	0x01,	%l4
	fmovdcc	%xcc,	%f9,	%f30
	tsubcc	%l2,	%i4,	%i2
	andn	%g3,	0x148D,	%g1
	ldsb	[%l7 + 0x16],	%o5
	taddcctv	%o0,	0x1ABE,	%o2
	movrlez	%g7,	0x3D3,	%o7
	siam	0x1
	subccc	%i5,	%i6,	%g5
	alignaddrl	%l1,	%i3,	%o6
	alignaddr	%o1,	%l3,	%l0
	taddcc	%i1,	%i0,	%g4
	fmovdcc	%icc,	%f8,	%f16
	fmovrslez	%i7,	%f25,	%f5
	stw	%o4,	[%l7 + 0x5C]
	sub	%l6,	%g6,	%l5
	taddcctv	%o3,	%g2,	%l4
	fbg,a	%fcc3,	loop_1055
	movge	%xcc,	%l2,	%i4
	fpsub16s	%f21,	%f9,	%f5
	umul	%i2,	%g3,	%o5
loop_1055:
	andncc	%o0,	%o2,	%g7
	edge16	%o7,	%i5,	%i6
	set	0x18, %i2
	ldxa	[%g0 + %i2] 0x4f,	%g1
	edge8	%g5,	%i3,	%o6
	srlx	%l1,	0x13,	%l3
	set	0x38, %o4
	ldstuba	[%l7 + %o4] 0x04,	%l0
	fones	%f13
	fba	%fcc0,	loop_1056
	fpsub16s	%f16,	%f19,	%f1
	udivcc	%i1,	0x1F1C,	%o1
	andcc	%i0,	%i7,	%g4
loop_1056:
	fbne	%fcc1,	loop_1057
	tn	%xcc,	0x5
	brgez	%o4,	loop_1058
	fmovsg	%xcc,	%f28,	%f0
loop_1057:
	tpos	%icc,	0x1
	ldsw	[%l7 + 0x18],	%l6
loop_1058:
	fmovdge	%xcc,	%f21,	%f18
	movge	%icc,	%l5,	%o3
	fmovsleu	%icc,	%f28,	%f25
	fmovdvc	%xcc,	%f16,	%f28
	fbg,a	%fcc0,	loop_1059
	edge16l	%g2,	%g6,	%l4
	fpadd16s	%f2,	%f28,	%f28
	wr	%g0,	0x11,	%asi
	stwa	%l2,	[%l7 + 0x50] %asi
loop_1059:
	sir	0x1F3D
	ta	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f4,	%f22
	andcc	%i4,	%i2,	%g3
	bg	%xcc,	loop_1060
	tleu	%xcc,	0x3
	fabsd	%f8,	%f22
	sethi	0x0862,	%o5
loop_1060:
	tge	%icc,	0x5
	movgu	%icc,	%o2,	%o0
	bn,a,pn	%xcc,	loop_1061
	fnegs	%f3,	%f1
	ta	%xcc,	0x0
	movleu	%icc,	%o7,	%i5
loop_1061:
	nop
	set	0x30, %o3
	lduwa	[%l7 + %o3] 0x14,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc3,	loop_1062
	orcc	%g1,	0x1F9C,	%i6
	fblg,a	%fcc3,	loop_1063
	addcc	%i3,	%g5,	%l1
loop_1062:
	swap	[%l7 + 0x30],	%o6
	fbe	%fcc1,	loop_1064
loop_1063:
	fmovdvs	%xcc,	%f31,	%f7
	umulcc	%l3,	%i1,	%l0
	bn	%icc,	loop_1065
loop_1064:
	movpos	%xcc,	%o1,	%i0
	popc	0x1BBA,	%g4
	sub	%o4,	%l6,	%i7
loop_1065:
	or	%l5,	0x05E7,	%g2
	edge16l	%o3,	%g6,	%l4
	fmovdgu	%icc,	%f8,	%f18
	xorcc	%i4,	%l2,	%i2
	fmuld8ulx16	%f28,	%f19,	%f16
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%g3
	fmovscs	%xcc,	%f14,	%f6
	edge32	%o5,	%o2,	%o0
	tcc	%icc,	0x5
	sth	%o7,	[%l7 + 0x66]
	orncc	%i5,	%g7,	%g1
	andcc	%i3,	0x19FC,	%g5
	edge32	%l1,	%o6,	%l3
	sll	%i1,	0x17,	%l0
	sllx	%o1,	%i6,	%i0
	movrgez	%o4,	0x1BD,	%g4
	andncc	%i7,	%l6,	%g2
	fzero	%f8
	swap	[%l7 + 0x78],	%l5
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xea,	%o2
	xor	%g6,	0x1310,	%i4
	tge	%icc,	0x5
	fpadd16	%f30,	%f6,	%f20
	bl,pt	%xcc,	loop_1066
	fxnors	%f27,	%f14,	%f25
	fmovsgu	%icc,	%f12,	%f8
	fmovsa	%icc,	%f11,	%f6
loop_1066:
	fsrc1s	%f27,	%f5
	fmovsleu	%xcc,	%f29,	%f6
	fmovdvs	%xcc,	%f9,	%f5
	movrgz	%l4,	%i2,	%g3
	or	%l2,	0x1C31,	%o2
	add	%o0,	0x01A0,	%o7
	udivx	%i5,	0x103D,	%o5
	fba,a	%fcc1,	loop_1067
	bge	loop_1068
	movrgz	%g7,	0x3A3,	%g1
	tn	%xcc,	0x7
loop_1067:
	sdivcc	%g5,	0x16B1,	%l1
loop_1068:
	tg	%icc,	0x4
	andn	%i3,	0x1939,	%o6
	bpos,pt	%icc,	loop_1069
	sth	%i1,	[%l7 + 0x7A]
	sethi	0x15EC,	%l3
	tcs	%icc,	0x5
loop_1069:
	nop
	set	0x14, %i6
	lduwa	[%l7 + %i6] 0x10,	%o1
	sll	%i6,	%l0,	%i0
	edge32	%o4,	%i7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l6,	%l5,	%g2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x28] %asi,	%g6
	be,pn	%xcc,	loop_1070
	sethi	0x1F35,	%i4
	fcmped	%fcc3,	%f26,	%f4
	fmovrdgez	%o3,	%f30,	%f2
loop_1070:
	nop
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i2
	and	%l4,	%g3,	%l2
	edge16n	%o2,	%o0,	%o7
	fcmpeq16	%f10,	%f8,	%i5
	movrgez	%o5,	0x3AA,	%g7
	sir	0x118C
	subcc	%g1,	%l1,	%g5
	array32	%o6,	%i1,	%i3
	stx	%l3,	[%l7 + 0x08]
	fble	%fcc1,	loop_1071
	xnorcc	%i6,	0x0A74,	%l0
	siam	0x6
	sub	%i0,	0x04F2,	%o4
loop_1071:
	subcc	%i7,	%g4,	%o1
	mulscc	%l5,	%l6,	%g6
	edge8n	%g2,	%o3,	%i4
	fcmpeq16	%f2,	%f2,	%l4
	nop
	setx loop_1072, %l0, %l1
	jmpl %l1, %g3
	ta	%xcc,	0x5
	movpos	%icc,	%i2,	%l2
	fbuge,a	%fcc1,	loop_1073
loop_1072:
	addcc	%o2,	%o0,	%o7
	fcmpgt32	%f10,	%f30,	%o5
	movne	%icc,	%i5,	%g1
loop_1073:
	tn	%icc,	0x7
	taddcctv	%l1,	%g7,	%o6
	edge32n	%i1,	%g5,	%i3
	fbug,a	%fcc2,	loop_1074
	fands	%f1,	%f16,	%f9
	movne	%icc,	%l3,	%i6
	sub	%l0,	0x0F86,	%i0
loop_1074:
	movl	%icc,	%o4,	%i7
	tsubcctv	%g4,	0x1DD6,	%o1
	fmovdvs	%icc,	%f9,	%f1
	movpos	%xcc,	%l5,	%g6
	fmovdvc	%xcc,	%f6,	%f20
	tsubcctv	%g2,	0x1715,	%o3
	and	%l6,	%l4,	%i4
	movrgez	%g3,	0x380,	%i2
	movvc	%xcc,	%l2,	%o0
	array8	%o2,	%o7,	%i5
	srax	%o5,	%g1,	%g7
	nop
	setx	loop_1075,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu,a,pn	%xcc,	loop_1076
	sra	%l1,	%i1,	%o6
	fone	%f2
loop_1075:
	fbne,a	%fcc1,	loop_1077
loop_1076:
	or	%i3,	%g5,	%i6
	srax	%l3,	0x1F,	%i0
	set	0x2F, %l0
	lduba	[%l7 + %l0] 0x80,	%l0
loop_1077:
	movl	%xcc,	%i7,	%o4
	array16	%g4,	%l5,	%o1
	fornot2	%f22,	%f30,	%f10
	tvs	%xcc,	0x4
	addcc	%g2,	0x1935,	%o3
	set	0x66, %i7
	ldsha	[%l7 + %i7] 0x04,	%g6
	andncc	%l4,	%i4,	%g3
	fmovrde	%l6,	%f18,	%f6
	tl	%icc,	0x5
	movgu	%icc,	%i2,	%o0
	addccc	%l2,	0x166E,	%o7
	addc	%i5,	0x1323,	%o5
	movneg	%icc,	%o2,	%g7
	brlz	%g1,	loop_1078
	sdiv	%l1,	0x18E2,	%o6
	fnand	%f18,	%f12,	%f22
	stx	%i1,	[%l7 + 0x20]
loop_1078:
	movrgez	%g5,	%i6,	%l3
	fxor	%f8,	%f0,	%f24
	movrgez	%i3,	0x386,	%l0
	movleu	%xcc,	%i0,	%i7
	set	0x08, %i3
	stxa	%g4,	[%l7 + %i3] 0x2b
	membar	#Sync
	movl	%icc,	%o4,	%l5
	ldd	[%l7 + 0x30],	%f16
	or	%g2,	0x05D5,	%o3
	stx	%g6,	[%l7 + 0x58]
	edge16	%l4,	%i4,	%o1
	andcc	%g3,	%l6,	%o0
	udiv	%l2,	0x15D7,	%i2
	sllx	%o7,	%i5,	%o5
	fmovrdne	%g7,	%f20,	%f0
	orn	%o2,	%l1,	%o6
	smul	%g1,	%g5,	%i1
	xnor	%i6,	%i3,	%l3
	sub	%i0,	0x1ED2,	%i7
	fble	%fcc1,	loop_1079
	mulscc	%g4,	0x118F,	%l0
	and	%l5,	%g2,	%o4
	set	0x1A, %o2
	ldsha	[%l7 + %o2] 0x19,	%g6
loop_1079:
	fmovsge	%xcc,	%f21,	%f19
	edge32n	%o3,	%i4,	%o1
	tge	%xcc,	0x4
	subccc	%l4,	0x0CE8,	%g3
	sdivx	%l6,	0x0A94,	%o0
	movcc	%icc,	%i2,	%l2
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f6
	fzero	%f20
	tl	%icc,	0x3
	tgu	%xcc,	0x6
	fmuld8sux16	%f1,	%f18,	%f16
	andcc	%o7,	%i5,	%g7
	edge32ln	%o5,	%l1,	%o2
	be,pn	%icc,	loop_1080
	subc	%g1,	0x02BD,	%g5
	movvc	%xcc,	%o6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1080:
	ldsb	[%l7 + 0x24],	%i3
	udivcc	%i6,	0x1209,	%i0
	addcc	%i7,	0x0275,	%l3
	prefetch	[%l7 + 0x18],	 0x0
	wr	%g0,	0x19,	%asi
	stwa	%l0,	[%l7 + 0x74] %asi
	fnot2	%f28,	%f2
	fcmps	%fcc3,	%f5,	%f4
	movn	%xcc,	%g4,	%g2
	fcmpne16	%f28,	%f6,	%l5
	ldsh	[%l7 + 0x62],	%o4
	sir	0x0B80
	tneg	%icc,	0x3
	or	%o3,	%i4,	%o1
	fmovdg	%xcc,	%f7,	%f1
	movcs	%xcc,	%l4,	%g6
	set	0x4B, %i4
	ldsba	[%l7 + %i4] 0x15,	%g3
	call	loop_1081
	bn,pn	%xcc,	loop_1082
	udivcc	%l6,	0x0E99,	%i2
	sra	%l2,	%o0,	%o7
loop_1081:
	bcs,a	%xcc,	loop_1083
loop_1082:
	movcs	%xcc,	%g7,	%o5
	bn	%icc,	loop_1084
	edge32ln	%i5,	%o2,	%g1
loop_1083:
	fpack32	%f22,	%f16,	%f12
	andncc	%g5,	%l1,	%i1
loop_1084:
	fpadd16	%f30,	%f26,	%f16
	fpadd16s	%f14,	%f14,	%f18
	lduh	[%l7 + 0x70],	%o6
	set	0x50, %i1
	stxa	%i6,	[%l7 + %i1] 0x89
	xorcc	%i0,	0x146D,	%i3
	fbl,a	%fcc1,	loop_1085
	tg	%xcc,	0x2
	subc	%l3,	%i7,	%l0
	fexpand	%f19,	%f0
loop_1085:
	fnegs	%f16,	%f9
	orcc	%g4,	0x1130,	%l5
	fpsub32	%f26,	%f12,	%f26
	sub	%g2,	0x02C9,	%o3
	movne	%icc,	%i4,	%o1
	sdiv	%o4,	0x1E7F,	%l4
	prefetch	[%l7 + 0x3C],	 0x1
	movrgz	%g6,	0x10D,	%l6
	move	%icc,	%g3,	%l2
	orncc	%i2,	%o7,	%o0
	move	%xcc,	%o5,	%g7
	set	0x7C, %g7
	ldsba	[%l7 + %g7] 0x15,	%i5
	edge32n	%g1,	%o2,	%l1
	subccc	%i1,	%o6,	%g5
	udivcc	%i6,	0x0554,	%i3
	popc	0x0CBB,	%i0
	tvc	%xcc,	0x1
	or	%l3,	0x1E9D,	%l0
	movgu	%xcc,	%g4,	%i7
	edge32n	%g2,	%o3,	%l5
	fbue,a	%fcc0,	loop_1086
	fsrc2	%f30,	%f0
	fabss	%f25,	%f8
	movpos	%xcc,	%o1,	%o4
loop_1086:
	srax	%i4,	%l4,	%l6
	movrgez	%g6,	%g3,	%i2
	fmovscc	%xcc,	%f6,	%f15
	addccc	%l2,	%o0,	%o5
	set	0x1C, %i0
	ldswa	[%l7 + %i0] 0x88,	%o7
	xnor	%g7,	%g1,	%o2
	bcc,a,pt	%icc,	loop_1087
	fcmpeq16	%f12,	%f22,	%l1
	edge32	%i1,	%i5,	%o6
	movg	%xcc,	%i6,	%g5
loop_1087:
	orncc	%i3,	%i0,	%l0
	fbg,a	%fcc2,	loop_1088
	subcc	%g4,	0x04F3,	%i7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6C] %asi,	%l3
loop_1088:
	umulcc	%o3,	%g2,	%l5
	sllx	%o4,	%o1,	%i4
	udivx	%l6,	0x0560,	%g6
	alignaddr	%g3,	%l4,	%l2
	tne	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f22,	%f6,	%f30
	orncc	%o0,	0x1437,	%o5
	movl	%xcc,	%o7,	%g7
	fbug	%fcc0,	loop_1089
	fmuld8ulx16	%f26,	%f16,	%f18
	fmuld8ulx16	%f2,	%f12,	%f22
	tgu	%xcc,	0x4
loop_1089:
	nop
	wr	%g0,	0x23,	%asi
	stda	%g0,	[%l7 + 0x78] %asi
	membar	#Sync
	fone	%f6
	fmul8x16au	%f1,	%f10,	%f0
	fmovspos	%icc,	%f3,	%f14
	taddcctv	%i2,	%o2,	%i1
	tneg	%xcc,	0x1
	popc	%l1,	%i5
	set	0x14, %l6
	stha	%o6,	[%l7 + %l6] 0x0c
	and	%i6,	0x0A12,	%i3
	srax	%g5,	0x11,	%l0
	tcc	%icc,	0x6
	umulcc	%i0,	%i7,	%l3
	movgu	%icc,	%o3,	%g2
	tsubcc	%l5,	0x0611,	%g4
	fmovrde	%o4,	%f6,	%f2
	tsubcctv	%o1,	%l6,	%i4
	orn	%g3,	%g6,	%l2
	sethi	0x1F1F,	%l4
	movleu	%icc,	%o5,	%o0
	sdivx	%o7,	0x0DFA,	%g7
	fones	%f24
	fmovdcc	%xcc,	%f8,	%f7
	tgu	%icc,	0x2
	tgu	%icc,	0x4
	fmovrdgez	%i2,	%f12,	%f30
	fnand	%f12,	%f14,	%f30
	movg	%icc,	%o2,	%i1
	edge16n	%l1,	%i5,	%g1
	udivx	%i6,	0x07D7,	%i3
	tg	%xcc,	0x5
	fbule	%fcc3,	loop_1090
	alignaddrl	%o6,	%l0,	%g5
	fmovdn	%xcc,	%f23,	%f14
	tvs	%xcc,	0x3
loop_1090:
	umulcc	%i0,	0x044C,	%l3
	subcc	%i7,	0x0AEC,	%o3
	movl	%icc,	%g2,	%l5
	tne	%xcc,	0x6
	edge16ln	%o4,	%o1,	%g4
	subcc	%l6,	0x164C,	%i4
	addc	%g6,	0x1FF9,	%l2
	fands	%f5,	%f1,	%f9
	wr	%g0,	0x88,	%asi
	stba	%l4,	[%l7 + 0x61] %asi
	fsrc1s	%f13,	%f30
	fnegs	%f24,	%f31
	fbe,a	%fcc0,	loop_1091
	call	loop_1092
	fmul8x16au	%f14,	%f15,	%f0
	sdiv	%o5,	0x0AEE,	%g3
loop_1091:
	tgu	%xcc,	0x0
loop_1092:
	fpadd16	%f18,	%f28,	%f6
	movne	%xcc,	%o7,	%g7
	fsrc1s	%f14,	%f12
	nop
	setx	loop_1093,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlez	%o0,	loop_1094
	edge32	%o2,	%i2,	%i1
	ldx	[%l7 + 0x20],	%i5
loop_1093:
	fmovdleu	%xcc,	%f10,	%f6
loop_1094:
	fmovsneg	%icc,	%f18,	%f14
	pdist	%f6,	%f16,	%f2
	movn	%xcc,	%l1,	%i6
	nop
	setx	loop_1095,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne,pt	%xcc,	loop_1096
	sir	0x1184
	fmovsvs	%xcc,	%f23,	%f3
loop_1095:
	brgz	%g1,	loop_1097
loop_1096:
	fmovda	%xcc,	%f31,	%f7
	tl	%xcc,	0x5
	fmovdg	%xcc,	%f25,	%f0
loop_1097:
	xnorcc	%o6,	%l0,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i0,	0x1359,	%l3
	ldx	[%l7 + 0x28],	%i3
	fcmpgt16	%f16,	%f22,	%i7
	sdiv	%g2,	0x09F1,	%o3
	orn	%l5,	0x1BDD,	%o1
	movrne	%g4,	%o4,	%i4
	fandnot1s	%f7,	%f7,	%f21
	fpadd32s	%f6,	%f1,	%f31
	fsrc2	%f24,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l6,	0x15B2,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%l4
	tvs	%icc,	0x6
	and	%g6,	0x06EE,	%g3
	movg	%xcc,	%o5,	%g7
	tvs	%xcc,	0x2
	sdivcc	%o0,	0x0FFE,	%o2
	sethi	0x1B07,	%o7
	orncc	%i1,	%i2,	%i5
	fmovse	%icc,	%f10,	%f22
	array16	%l1,	%i6,	%o6
	tsubcc	%g1,	0x1741,	%l0
	bge,pn	%icc,	loop_1098
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x5
	siam	0x3
loop_1098:
	edge32	%g5,	%i0,	%l3
	subc	%i7,	0x13CB,	%g2
	sir	0x0AE0
	array32	%o3,	%l5,	%o1
	movrne	%g4,	%o4,	%i4
	fandnot2	%f12,	%f24,	%f24
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x19,	%i2
	taddcc	%l2,	0x1045,	%l4
	tsubcc	%l6,	%g3,	%g6
	tleu	%xcc,	0x0
	movrgez	%o5,	0x28F,	%o0
	movn	%icc,	%o2,	%g7
	ldub	[%l7 + 0x72],	%o7
	tvc	%xcc,	0x4
	sdiv	%i2,	0x0BB2,	%i5
	fbug,a	%fcc1,	loop_1099
	alignaddr	%i1,	%i6,	%o6
	stw	%l1,	[%l7 + 0x24]
	brnz,a	%g1,	loop_1100
loop_1099:
	orcc	%l0,	%i0,	%l3
	tl	%xcc,	0x6
	stb	%i7,	[%l7 + 0x1F]
loop_1100:
	udivx	%g5,	0x0FF5,	%o3
	fcmps	%fcc3,	%f31,	%f2
	bneg,a	%icc,	loop_1101
	flush	%l7 + 0x70
	fbn	%fcc2,	loop_1102
	fbne	%fcc1,	loop_1103
loop_1101:
	mulx	%l5,	%o1,	%g4
	sdivx	%o4,	0x0791,	%i4
loop_1102:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i3
loop_1103:
	te	%xcc,	0x0
	fmul8ulx16	%f0,	%f28,	%f2
	taddcctv	%l2,	0x12F1,	%l4
	fornot2s	%f15,	%f10,	%f5
	tvc	%xcc,	0x2
	addccc	%l6,	0x00BC,	%g3
	alignaddr	%g2,	%o5,	%g6
	fbu	%fcc2,	loop_1104
	fmovdpos	%xcc,	%f4,	%f7
	fmovdgu	%icc,	%f4,	%f19
	move	%xcc,	%o0,	%o2
loop_1104:
	sdiv	%o7,	0x0C1E,	%i2
	bl,a	%xcc,	loop_1105
	edge16ln	%i5,	%i1,	%g7
	fornot2	%f2,	%f22,	%f20
	movvc	%icc,	%i6,	%o6
loop_1105:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%l1
	fxor	%f0,	%f26,	%f4
	tl	%xcc,	0x3
	edge16ln	%g1,	%i0,	%l0
	fmovrse	%l3,	%f13,	%f3
	fornot2s	%f8,	%f16,	%f18
	brgez	%i7,	loop_1106
	be	loop_1107
	brlez	%o3,	loop_1108
	te	%icc,	0x3
loop_1106:
	tl	%icc,	0x2
loop_1107:
	ld	[%l7 + 0x3C],	%f2
loop_1108:
	faligndata	%f12,	%f2,	%f8
	tsubcctv	%l5,	%o1,	%g5
	fmovrdgez	%o4,	%f4,	%f10
	fmovdleu	%icc,	%f13,	%f4
	ba,pn	%icc,	loop_1109
	edge8n	%g4,	%i3,	%i4
	fbo,a	%fcc2,	loop_1110
	ta	%icc,	0x4
loop_1109:
	fxor	%f6,	%f16,	%f2
	set	0x7E, %l5
	ldsha	[%l7 + %l5] 0x89,	%l4
loop_1110:
	bpos,a,pn	%icc,	loop_1111
	fbuge	%fcc0,	loop_1112
	andncc	%l2,	%l6,	%g2
	movrne	%o5,	0x3D5,	%g6
loop_1111:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
loop_1112:
	movrne	%o2,	0x27D,	%o7
	stw	%i2,	[%l7 + 0x48]
	alignaddrl	%g3,	%i5,	%g7
	tneg	%xcc,	0x5
	fnot2s	%f12,	%f20
	udiv	%i1,	0x0C2A,	%o6
	tcc	%icc,	0x6
	tneg	%xcc,	0x6
	tleu	%icc,	0x2
	movvc	%icc,	%i6,	%g1
	tne	%icc,	0x2
	fone	%f18
	fmuld8ulx16	%f27,	%f15,	%f2
	bcc	loop_1113
	brlez	%l1,	loop_1114
	sethi	0x1BBE,	%i0
	fmovrdgez	%l0,	%f30,	%f26
loop_1113:
	srax	%i7,	%l3,	%o3
loop_1114:
	edge8n	%o1,	%g5,	%l5
	bpos	%icc,	loop_1115
	andcc	%o4,	%g4,	%i4
	te	%icc,	0x6
	movneg	%xcc,	%l4,	%l2
loop_1115:
	fbo,a	%fcc0,	loop_1116
	edge32n	%i3,	%l6,	%o5
	fmovrsgz	%g2,	%f18,	%f2
	edge8	%o0,	%o2,	%g6
loop_1116:
	fbul,a	%fcc2,	loop_1117
	movle	%xcc,	%i2,	%o7
	udiv	%g3,	0x07F9,	%g7
	fandnot1s	%f22,	%f25,	%f7
loop_1117:
	edge32n	%i1,	%i5,	%i6
	edge16n	%o6,	%l1,	%i0
	std	%l0,	[%l7 + 0x40]
	fnot1s	%f15,	%f17
	fmul8x16	%f2,	%f2,	%f18
	movrlez	%i7,	%l3,	%g1
	sll	%o3,	0x1A,	%g5
	sll	%o1,	%o4,	%l5
	fbn	%fcc3,	loop_1118
	edge16l	%g4,	%i4,	%l2
	sethi	0x0263,	%l4
	movrgez	%i3,	0x13D,	%o5
loop_1118:
	tcs	%xcc,	0x3
	brlz	%g2,	loop_1119
	fsrc1s	%f12,	%f26
	edge16	%l6,	%o0,	%o2
	popc	%g6,	%o7
loop_1119:
	std	%f6,	[%l7 + 0x50]
	fornot1	%f18,	%f22,	%f2
	fmovrde	%g3,	%f18,	%f26
	movleu	%icc,	%g7,	%i1
	srax	%i2,	%i5,	%i6
	tgu	%xcc,	0x5
	fmul8sux16	%f4,	%f8,	%f0
	tl	%xcc,	0x0
	movg	%icc,	%l1,	%o6
	umul	%l0,	0x1F9D,	%i7
	sir	0x195F
	set	0x42, %o0
	lduha	[%l7 + %o0] 0x0c,	%i0
	andcc	%g1,	%l3,	%o3
	array16	%o1,	%g5,	%o4
	edge8ln	%l5,	%g4,	%l2
	bcc,pt	%xcc,	loop_1120
	fbl	%fcc3,	loop_1121
	bgu,a	%xcc,	loop_1122
	bge,a,pn	%icc,	loop_1123
loop_1120:
	edge8ln	%i4,	%i3,	%l4
loop_1121:
	tgu	%xcc,	0x6
loop_1122:
	fnot2s	%f20,	%f2
loop_1123:
	fnand	%f18,	%f10,	%f28
	movrgez	%g2,	%l6,	%o5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x48] %asi,	%o0
	fnot1s	%f1,	%f25
	movrgez	%o2,	0x1FC,	%o7
	xor	%g6,	%g3,	%g7
	xor	%i1,	0x1970,	%i2
	addccc	%i5,	0x09B8,	%l1
	xorcc	%o6,	%l0,	%i7
	brgez,a	%i6,	loop_1124
	xnor	%i0,	%l3,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x1
loop_1124:
	subccc	%o3,	%o1,	%g5
	sra	%l5,	0x16,	%g4
	set	0x78, %o5
	sta	%f1,	[%l7 + %o5] 0x10
	membar	0x54
	orcc	%l2,	0x19B6,	%i4
	set	0x08, %g5
	ldsba	[%l7 + %g5] 0x14,	%o4
	wr	%g0,	0x10,	%asi
	sta	%f9,	[%l7 + 0x50] %asi
	edge8	%i3,	%l4,	%l6
	smulcc	%g2,	0x0C4C,	%o0
	tpos	%xcc,	0x6
	fbne	%fcc1,	loop_1125
	xnor	%o5,	%o7,	%o2
	edge32l	%g6,	%g7,	%i1
	fbug,a	%fcc3,	loop_1126
loop_1125:
	tcc	%xcc,	0x2
	tsubcctv	%i2,	%g3,	%i5
	movle	%icc,	%o6,	%l0
loop_1126:
	movneg	%xcc,	%i7,	%l1
	bvc	loop_1127
	andcc	%i6,	0x079F,	%i0
	tvs	%xcc,	0x7
	edge32l	%l3,	%g1,	%o1
loop_1127:
	tleu	%icc,	0x3
	tgu	%icc,	0x3
	fbn,a	%fcc1,	loop_1128
	edge8l	%g5,	%l5,	%g4
	udiv	%l2,	0x0092,	%i4
	xnorcc	%o3,	%o4,	%i3
loop_1128:
	fandnot2s	%f2,	%f21,	%f0
	prefetch	[%l7 + 0x20],	 0x1
	fnot1	%f14,	%f2
	sdiv	%l6,	0x097F,	%l4
	fcmpes	%fcc2,	%f2,	%f23
	fmovsgu	%xcc,	%f18,	%f1
	fbe	%fcc0,	loop_1129
	edge8l	%o0,	%g2,	%o7
	xnor	%o2,	%o5,	%g7
	fabsd	%f2,	%f2
loop_1129:
	bge,a	loop_1130
	sllx	%i1,	%i2,	%g3
	fxor	%f28,	%f24,	%f8
	ldsb	[%l7 + 0x63],	%i5
loop_1130:
	brnz	%g6,	loop_1131
	edge8ln	%l0,	%i7,	%o6
	movgu	%icc,	%l1,	%i6
	sllx	%l3,	0x12,	%g1
loop_1131:
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i0
	stw	%o1,	[%l7 + 0x2C]
	tgu	%xcc,	0x3
	subc	%g5,	0x14D6,	%l5
	fmovsgu	%icc,	%f2,	%f25
	nop
	set	0x40, %i5
	stx	%l2,	[%l7 + %i5]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g4,	%o3
	brgz,a	%i4,	loop_1132
	sub	%o4,	%i3,	%l6
	fandnot1	%f4,	%f30,	%f16
	nop
	setx	loop_1133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1132:
	movrlez	%o0,	%l4,	%g2
	smul	%o2,	%o5,	%g7
	fnegs	%f12,	%f4
loop_1133:
	movge	%xcc,	%o7,	%i1
	bl,a	%icc,	loop_1134
	lduw	[%l7 + 0x54],	%i2
	fmul8x16	%f4,	%f6,	%f2
	ldsw	[%l7 + 0x2C],	%i5
loop_1134:
	nop
	set	0x68, %g1
	stxa	%g3,	[%l7 + %g1] 0xe3
	membar	#Sync
	sir	0x07F6
	udivcc	%g6,	0x16A8,	%l0
	xor	%o6,	0x011C,	%i7
	edge8l	%l1,	%l3,	%i6
	tsubcctv	%g1,	0x197B,	%o1
	subc	%i0,	%g5,	%l5
	orn	%l2,	%o3,	%g4
	mova	%xcc,	%i4,	%o4
	tl	%icc,	0x3
	smul	%i3,	0x1CF0,	%o0
	movrlez	%l4,	0x399,	%l6
	movge	%xcc,	%g2,	%o5
	movge	%xcc,	%g7,	%o7
	movrgz	%o2,	%i1,	%i2
	smul	%g3,	0x17A4,	%g6
	fornot2	%f18,	%f26,	%f28
	subccc	%l0,	0x03A8,	%o6
	bg,a,pt	%xcc,	loop_1135
	ta	%xcc,	0x1
	flush	%l7 + 0x14
	mulx	%i7,	0x10F1,	%l1
loop_1135:
	tneg	%icc,	0x1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%i5
	fcmpgt32	%f18,	%f20,	%i6
	fmovscc	%icc,	%f31,	%f8
	sub	%o1,	0x04FB,	%g1
	set	0x40, %g3
	lda	[%l7 + %g3] 0x88,	%f13
	popc	0x18E5,	%i0
	subcc	%l5,	%g5,	%l2
	tpos	%xcc,	0x6
	fmovdleu	%icc,	%f5,	%f0
	edge16	%o3,	%i4,	%o4
	fand	%f0,	%f20,	%f26
	fmovrdne	%i3,	%f20,	%f18
	xnorcc	%g4,	0x1031,	%o0
	tneg	%icc,	0x0
	fandnot2s	%f27,	%f1,	%f19
	sdivcc	%l4,	0x0795,	%g2
	fbu	%fcc3,	loop_1136
	ldd	[%l7 + 0x38],	%o4
	fpadd16s	%f31,	%f29,	%f7
	and	%l6,	0x06E2,	%o7
loop_1136:
	fpack32	%f10,	%f24,	%f28
	fcmpgt32	%f2,	%f14,	%g7
	tleu	%xcc,	0x7
	st	%f0,	[%l7 + 0x6C]
	movrne	%o2,	0x141,	%i1
	mova	%icc,	%i2,	%g6
	fabss	%f31,	%f3
	brgez	%l0,	loop_1137
	tleu	%xcc,	0x3
	tcc	%xcc,	0x6
	udivcc	%o6,	0x1BE6,	%i7
loop_1137:
	xorcc	%l1,	%l3,	%i5
	fornot1s	%f26,	%f27,	%f0
	fmovspos	%icc,	%f8,	%f2
	brz,a	%g3,	loop_1138
	tsubcc	%i6,	0x0565,	%o1
	movvs	%xcc,	%i0,	%g1
	fand	%f8,	%f14,	%f10
loop_1138:
	andncc	%g5,	%l2,	%o3
	edge32l	%i4,	%o4,	%l5
	fmovda	%xcc,	%f26,	%f22
	bl,pt	%xcc,	loop_1139
	array32	%i3,	%o0,	%g4
	tsubcc	%l4,	%o5,	%l6
	edge32n	%g2,	%o7,	%g7
loop_1139:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	subccc	%i2,	%g6,	%l0
	tsubcc	%o6,	0x193B,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x2
	alignaddr	%l1,	%l3,	%i1
	wr	%g0,	0x2a,	%asi
	stha	%g3,	[%l7 + 0x7C] %asi
	membar	#Sync
	fmovrdgz	%i5,	%f4,	%f22
	ble,a,pn	%xcc,	loop_1140
	movre	%o1,	%i6,	%i0
	movrlez	%g5,	%g1,	%l2
	ldd	[%l7 + 0x70],	%i4
loop_1140:
	tne	%xcc,	0x6
	orncc	%o4,	0x0DA6,	%o3
	movcs	%xcc,	%i3,	%o0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%l5
	fmuld8ulx16	%f4,	%f14,	%f2
	bneg	loop_1141
	andn	%g4,	%o5,	%l4
	umulcc	%l6,	%o7,	%g2
	tcc	%icc,	0x1
loop_1141:
	fcmpne32	%f8,	%f6,	%o2
	membar	0x04
	edge16l	%g7,	%g6,	%i2
	fpsub32	%f28,	%f30,	%f12
	bshuffle	%f24,	%f24,	%f4
	xor	%o6,	%i7,	%l1
	movre	%l3,	0x137,	%i1
	udivx	%l0,	0x1CB9,	%i5
	or	%g3,	%o1,	%i0
	edge16	%i6,	%g1,	%g5
	movre	%i4,	0x306,	%o4
	tcs	%icc,	0x5
	ble,pn	%xcc,	loop_1142
	edge32	%o3,	%l2,	%o0
	edge32	%l5,	%g4,	%o5
	sra	%i3,	%l6,	%o7
loop_1142:
	bn,a,pt	%xcc,	loop_1143
	fmovsleu	%icc,	%f4,	%f19
	wr	%g0,	0x80,	%asi
	stda	%g2,	[%l7 + 0x60] %asi
loop_1143:
	tg	%icc,	0x1
	fand	%f26,	%f0,	%f2
	sllx	%o2,	0x0F,	%g7
	addcc	%g6,	0x18BA,	%l4
	set	0x7E, %g2
	ldsba	[%l7 + %g2] 0x19,	%i2
	movrlez	%i7,	%o6,	%l3
	fornot2s	%f5,	%f1,	%f16
	udiv	%l1,	0x0E5E,	%i1
	srl	%l0,	%g3,	%i5
	edge8l	%o1,	%i6,	%g1
	movrgz	%i0,	%g5,	%o4
	nop
	setx	loop_1144,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%o3,	%i4
	xnorcc	%o0,	%l5,	%l2
	fpadd16	%f4,	%f18,	%f18
loop_1144:
	tpos	%icc,	0x4
	tsubcctv	%g4,	%o5,	%i3
	xnorcc	%o7,	%g2,	%l6
	edge32n	%g7,	%g6,	%l4
	udiv	%i2,	0x05F5,	%i7
	array32	%o6,	%o2,	%l1
	fbul	%fcc3,	loop_1145
	fmovrdgez	%i1,	%f16,	%f28
	fmovsge	%icc,	%f1,	%f7
	edge8l	%l0,	%l3,	%i5
loop_1145:
	array32	%o1,	%i6,	%g1
	bpos	%xcc,	loop_1146
	fmovsneg	%xcc,	%f20,	%f17
	std	%g2,	[%l7 + 0x08]
	fba,a	%fcc1,	loop_1147
loop_1146:
	movcs	%icc,	%g5,	%i0
	fcmps	%fcc2,	%f2,	%f12
	st	%f18,	[%l7 + 0x6C]
loop_1147:
	ble,pt	%xcc,	loop_1148
	edge16ln	%o3,	%i4,	%o4
	orn	%o0,	0x1CFA,	%l2
	set	0x18, %g4
	lduwa	[%l7 + %g4] 0x04,	%g4
loop_1148:
	pdist	%f2,	%f12,	%f26
	fbu	%fcc0,	loop_1149
	fpadd16	%f2,	%f28,	%f24
	prefetch	[%l7 + 0x0C],	 0x2
	brz,a	%l5,	loop_1150
loop_1149:
	bge,pn	%xcc,	loop_1151
	te	%xcc,	0x2
	movle	%xcc,	%o5,	%i3
loop_1150:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g2
loop_1151:
	bcs,pn	%xcc,	loop_1152
	sub	%l6,	0x1A96,	%g7
	orn	%g6,	0x183A,	%o7
	fble	%fcc2,	loop_1153
loop_1152:
	and	%i2,	%i7,	%l4
	fbg	%fcc2,	loop_1154
	tne	%icc,	0x5
loop_1153:
	xorcc	%o2,	0x1D49,	%l1
	fornot1	%f24,	%f22,	%f18
loop_1154:
	fnegs	%f12,	%f25
	brgz,a	%o6,	loop_1155
	tge	%icc,	0x4
	tleu	%xcc,	0x4
	tne	%icc,	0x4
loop_1155:
	nop
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x10,	%i1
	fmovsa	%icc,	%f16,	%f27
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x17
	membar	#Sync
	movleu	%xcc,	%l3,	%i5
	tsubcc	%o1,	%i6,	%l0
	alignaddrl	%g3,	%g5,	%i0
	edge32n	%o3,	%i4,	%g1
	bleu	%icc,	loop_1156
	fmovdne	%icc,	%f30,	%f18
	fmovsle	%icc,	%f8,	%f29
	edge16ln	%o4,	%o0,	%l2
loop_1156:
	tgu	%icc,	0x2
	fxnor	%f18,	%f30,	%f14
	edge16l	%l5,	%g4,	%i3
	fmovdne	%xcc,	%f14,	%f26
	fpadd16	%f26,	%f0,	%f4
	fmovrde	%g2,	%f14,	%f2
	fone	%f0
	brlez	%o5,	loop_1157
	bshuffle	%f20,	%f22,	%f14
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%g6
loop_1157:
	fmovsg	%xcc,	%f0,	%f12
	movrgz	%g6,	%l6,	%o7
	fpsub32s	%f24,	%f18,	%f6
	edge16ln	%i7,	%l4,	%i2
	tvc	%xcc,	0x5
	fmuld8ulx16	%f2,	%f23,	%f16
	fabss	%f24,	%f14
	mulscc	%l1,	0x1EAD,	%o6
	ldstub	[%l7 + 0x2D],	%o2
	xorcc	%l3,	%i1,	%o1
	sll	%i5,	%i6,	%l0
	mulscc	%g3,	%i0,	%g5
	tsubcctv	%i4,	0x132C,	%g1
	nop
	setx loop_1158, %l0, %l1
	jmpl %l1, %o4
	fandnot2s	%f5,	%f17,	%f15
	tn	%xcc,	0x7
	orcc	%o3,	%o0,	%l5
loop_1158:
	fxors	%f27,	%f15,	%f25
	bpos,a,pn	%icc,	loop_1159
	fmovrdlz	%l2,	%f14,	%f26
	tsubcc	%g4,	0x0107,	%g2
	addcc	%i3,	0x1721,	%g7
loop_1159:
	movrlz	%o5,	%g6,	%l6
	fornot1	%f0,	%f8,	%f14
	fmovspos	%xcc,	%f19,	%f16
	fblg,a	%fcc1,	loop_1160
	tvs	%xcc,	0x6
	set	0x6A, %o7
	stba	%o7,	[%l7 + %o7] 0x27
	membar	#Sync
loop_1160:
	fcmpne32	%f10,	%f2,	%i7
	tge	%icc,	0x7
	fmovsne	%xcc,	%f20,	%f30
	bvs,a	loop_1161
	fxor	%f24,	%f14,	%f6
	movrgz	%i2,	0x020,	%l1
	array32	%o6,	%l4,	%l3
loop_1161:
	fmul8sux16	%f0,	%f2,	%f14
	udivcc	%o2,	0x019E,	%o1
	smulcc	%i5,	%i1,	%i6
	movl	%xcc,	%g3,	%i0
	fnor	%f24,	%f24,	%f30
	tsubcc	%l0,	0x03AE,	%i4
	srlx	%g1,	0x06,	%o4
	tle	%icc,	0x2
	fornot2	%f14,	%f14,	%f6
	fbug	%fcc1,	loop_1162
	tle	%xcc,	0x6
	tpos	%icc,	0x0
	fmovsle	%icc,	%f7,	%f9
loop_1162:
	fcmpgt32	%f16,	%f0,	%o3
	sra	%g5,	%o0,	%l2
	fmovdcs	%icc,	%f13,	%f19
	fmovscc	%icc,	%f25,	%f2
	bge,a,pt	%icc,	loop_1163
	ldx	[%l7 + 0x18],	%g4
	tleu	%icc,	0x2
	tneg	%xcc,	0x0
loop_1163:
	fors	%f17,	%f14,	%f3
	prefetch	[%l7 + 0x0C],	 0x2
	lduw	[%l7 + 0x3C],	%g2
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x11,	 0x3
	srax	%l5,	0x0B,	%o5
	set	0x34, %i2
	lduwa	[%l7 + %i2] 0x81,	%g6
	sdiv	%g7,	0x1FCA,	%l6
	andncc	%o7,	%i2,	%i7
	fmul8ulx16	%f18,	%f20,	%f28
	tl	%xcc,	0x3
	alignaddrl	%o6,	%l1,	%l3
	fpadd32	%f30,	%f18,	%f2
	and	%l4,	%o1,	%o2
	edge8	%i1,	%i5,	%i6
	membar	0x49
	fbu	%fcc1,	loop_1164
	tn	%xcc,	0x3
	movge	%xcc,	%g3,	%i0
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x14] %asi,	%i4
loop_1164:
	orn	%l0,	0x0FD1,	%o4
	ld	[%l7 + 0x4C],	%f31
	fbl,a	%fcc2,	loop_1165
	fcmpne32	%f22,	%f18,	%o3
	ldx	[%l7 + 0x60],	%g1
	movrgez	%o0,	0x069,	%l2
loop_1165:
	tgu	%xcc,	0x0
	fba,a	%fcc2,	loop_1166
	fmovsneg	%icc,	%f27,	%f0
	bvs	loop_1167
	subccc	%g4,	0x0C9E,	%g5
loop_1166:
	movrgz	%i3,	%g2,	%l5
	alignaddrl	%g6,	%g7,	%o5
loop_1167:
	mova	%icc,	%l6,	%o7
	movneg	%icc,	%i7,	%o6
	bgu,a	%xcc,	loop_1168
	andncc	%i2,	%l1,	%l4
	udivx	%o1,	0x11A8,	%o2
	array16	%i1,	%l3,	%i5
loop_1168:
	fpadd32	%f16,	%f30,	%f26
	tleu	%xcc,	0x0
	sir	0x09C6
	sir	0x092D
	st	%f3,	[%l7 + 0x5C]
	xnorcc	%g3,	0x092A,	%i6
	movneg	%xcc,	%i0,	%l0
	movrlez	%o4,	0x3F8,	%o3
	brz,a	%i4,	loop_1169
	fcmpd	%fcc3,	%f12,	%f16
	tcc	%xcc,	0x0
	andn	%g1,	%o0,	%l2
loop_1169:
	subcc	%g5,	0x172B,	%i3
	alignaddrl	%g2,	%l5,	%g4
	brgz,a	%g6,	loop_1170
	edge32ln	%g7,	%o5,	%l6
	edge16l	%i7,	%o7,	%i2
	sll	%l1,	%o6,	%o1
loop_1170:
	fornot2s	%f30,	%f6,	%f23
	movcc	%icc,	%o2,	%i1
	fmovrdlez	%l3,	%f26,	%f6
	fornot2s	%f10,	%f3,	%f30
	subc	%i5,	%g3,	%i6
	bvc,a	loop_1171
	sra	%l4,	%i0,	%o4
	array32	%l0,	%o3,	%i4
	movneg	%icc,	%o0,	%l2
loop_1171:
	movrlez	%g1,	0x1D7,	%i3
	fornot2s	%f17,	%f10,	%f24
	te	%icc,	0x4
	fmovrdgz	%g5,	%f10,	%f20
	edge8	%l5,	%g2,	%g6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x60] %asi,	%f17
	movne	%icc,	%g4,	%g7
	subcc	%l6,	0x03F4,	%o5
	mova	%xcc,	%i7,	%i2
	edge32	%o7,	%o6,	%l1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x10,	%o1,	%o2
	array16	%i1,	%i5,	%l3
	sdivcc	%i6,	0x1029,	%l4
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x80,	 0x3
	movn	%icc,	%i0,	%l0
	sll	%o4,	0x01,	%i4
	movleu	%xcc,	%o0,	%l2
	fnands	%f6,	%f7,	%f9
	edge16	%g1,	%i3,	%o3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%l5
	movrgz	%g5,	%g2,	%g4
	call	loop_1172
	udivx	%g7,	0x1104,	%g6
	fcmps	%fcc3,	%f15,	%f16
	bne,pn	%xcc,	loop_1173
loop_1172:
	tvc	%xcc,	0x3
	orcc	%o5,	%i7,	%i2
	and	%l6,	0x0168,	%o7
loop_1173:
	fexpand	%f27,	%f0
	fornot1	%f0,	%f24,	%f6
	tge	%icc,	0x4
	brlz,a	%o6,	loop_1174
	membar	0x06
	tne	%icc,	0x0
	fpadd32	%f18,	%f22,	%f0
loop_1174:
	edge16n	%o1,	%l1,	%o2
	bneg,pt	%xcc,	loop_1175
	srl	%i5,	0x05,	%i1
	movne	%xcc,	%l3,	%i6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x72] %asi,	%l4
loop_1175:
	add	%i0,	0x0ECE,	%l0
	tneg	%xcc,	0x6
	fba	%fcc2,	loop_1176
	ba	%icc,	loop_1177
	brgz	%o4,	loop_1178
	edge32	%i4,	%o0,	%g3
loop_1176:
	fmovde	%xcc,	%f25,	%f20
loop_1177:
	fmovsa	%xcc,	%f18,	%f6
loop_1178:
	mulx	%l2,	%i3,	%o3
	and	%l5,	0x0482,	%g1
	edge8n	%g2,	%g5,	%g7
	fbue	%fcc3,	loop_1179
	fmovsne	%icc,	%f22,	%f26
	stw	%g4,	[%l7 + 0x68]
	andn	%g6,	0x0B11,	%i7
loop_1179:
	fmovsvc	%icc,	%f28,	%f26
	fnot2	%f28,	%f30
	movle	%icc,	%i2,	%l6
	taddcctv	%o5,	0x19A5,	%o7
	popc	0x0905,	%o6
	std	%o0,	[%l7 + 0x18]
	movge	%xcc,	%o2,	%i5
	movre	%i1,	%l1,	%l3
	taddcc	%i6,	0x09E3,	%i0
	xor	%l0,	%o4,	%l4
	udivcc	%i4,	0x0CE6,	%g3
	fbge,a	%fcc0,	loop_1180
	fbuge	%fcc1,	loop_1181
	ba	%xcc,	loop_1182
	taddcc	%l2,	%o0,	%o3
loop_1180:
	edge32l	%i3,	%g1,	%l5
loop_1181:
	swap	[%l7 + 0x5C],	%g5
loop_1182:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%g7,	[%l7 + 0x2C] %asi
	membar	#Sync
	fcmps	%fcc1,	%f26,	%f19
	edge8l	%g4,	%g6,	%i7
	fbul	%fcc3,	loop_1183
	udiv	%g2,	0x0459,	%l6
	fmovscs	%icc,	%f10,	%f13
	andcc	%i2,	0x0343,	%o7
loop_1183:
	mulx	%o6,	0x0317,	%o1
	orncc	%o2,	0x0951,	%o5
	srl	%i1,	%i5,	%l1
	or	%l3,	%i6,	%i0
	movle	%icc,	%o4,	%l4
	tpos	%icc,	0x5
	ldd	[%l7 + 0x18],	%i4
	srax	%g3,	%l2,	%o0
	fcmpgt16	%f0,	%f12,	%l0
	fandnot1	%f20,	%f0,	%f2
	set	0x10, %o3
	sta	%f12,	[%l7 + %o3] 0x80
	sra	%i3,	%g1,	%l5
	mulx	%g5,	0x15E3,	%o3
	movrgez	%g4,	%g7,	%g6
	sra	%g2,	0x02,	%l6
	fmovse	%xcc,	%f16,	%f31
	fxnor	%f2,	%f30,	%f30
	fmovrdlz	%i2,	%f10,	%f30
	fmovrde	%i7,	%f28,	%f28
	fands	%f3,	%f1,	%f21
	sethi	0x111C,	%o7
	orncc	%o6,	%o1,	%o2
	xorcc	%i1,	%i5,	%o5
	tle	%icc,	0x1
	movre	%l3,	%l1,	%i0
	and	%o4,	0x0C69,	%i6
	movrne	%l4,	0x13B,	%g3
	movgu	%icc,	%i4,	%l2
	orn	%o0,	%i3,	%l0
	fmovscc	%xcc,	%f11,	%f0
	mulscc	%g1,	%l5,	%g5
	sll	%g4,	%g7,	%g6
	orn	%g2,	0x139F,	%l6
	movneg	%icc,	%o3,	%i2
	edge32n	%o7,	%i7,	%o6
	movl	%icc,	%o2,	%i1
	nop
	setx	loop_1184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%i5,	%o1
	fbge,a	%fcc1,	loop_1185
	ble,a,pn	%icc,	loop_1186
loop_1184:
	flush	%l7 + 0x54
	edge16ln	%l3,	%o5,	%i0
loop_1185:
	ldstub	[%l7 + 0x67],	%l1
loop_1186:
	fmovrdne	%o4,	%f22,	%f20
	edge8l	%i6,	%g3,	%i4
	tvc	%xcc,	0x6
	tsubcc	%l2,	%o0,	%i3
	bpos,pn	%xcc,	loop_1187
	sdivcc	%l0,	0x05A8,	%l4
	lduw	[%l7 + 0x70],	%g1
	bvs,a	loop_1188
loop_1187:
	sdivcc	%l5,	0x025B,	%g5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g7
loop_1188:
	movpos	%xcc,	%g6,	%g4
	tsubcc	%l6,	0x1326,	%o3
	fmovd	%f10,	%f10
	orn	%g2,	%o7,	%i7
	edge8	%i2,	%o2,	%o6
	prefetch	[%l7 + 0x40],	 0x1
	tvs	%icc,	0x3
	set	0x50, %o4
	stda	%i4,	[%l7 + %o4] 0x0c
	prefetch	[%l7 + 0x1C],	 0x1
	andncc	%o1,	%l3,	%i1
	add	%i0,	%o5,	%l1
	fba	%fcc3,	loop_1189
	call	loop_1190
	fpsub16	%f22,	%f14,	%f28
	fmovsa	%icc,	%f11,	%f25
loop_1189:
	andcc	%i6,	%g3,	%o4
loop_1190:
	movcs	%xcc,	%i4,	%l2
	sra	%i3,	0x0C,	%o0
	ldd	[%l7 + 0x68],	%l4
	smul	%g1,	%l5,	%g5
	fmovrsgez	%g7,	%f25,	%f18
	ldub	[%l7 + 0x0E],	%l0
	udiv	%g6,	0x1749,	%g4
	edge8ln	%o3,	%g2,	%l6
	movvs	%xcc,	%o7,	%i2
	srl	%i7,	0x1D,	%o2
	alignaddr	%o6,	%i5,	%l3
	tcc	%xcc,	0x2
	tpos	%xcc,	0x6
	movg	%xcc,	%o1,	%i0
	array8	%o5,	%i1,	%i6
	subc	%l1,	%o4,	%g3
	srlx	%i4,	0x04,	%l2
	udivcc	%o0,	0x0C08,	%l4
	sub	%i3,	0x1E27,	%g1
	fmovrdgz	%g5,	%f12,	%f12
	movpos	%xcc,	%l5,	%g7
	movcc	%icc,	%g6,	%l0
	alignaddr	%g4,	%g2,	%l6
	srlx	%o3,	%i2,	%o7
	bne,pn	%icc,	loop_1191
	tleu	%icc,	0x2
	movrne	%i7,	%o2,	%o6
	fba	%fcc1,	loop_1192
loop_1191:
	movge	%xcc,	%l3,	%i5
	sllx	%o1,	%i0,	%o5
	tg	%xcc,	0x3
loop_1192:
	srlx	%i1,	%l1,	%o4
	sdivcc	%g3,	0x16CB,	%i6
	tgu	%xcc,	0x3
	fmovdleu	%xcc,	%f23,	%f17
	xor	%i4,	0x047E,	%l2
	sdivcc	%o0,	0x05A7,	%l4
	sub	%g1,	%g5,	%l5
	movn	%xcc,	%g7,	%i3
	lduw	[%l7 + 0x60],	%g6
	movvc	%icc,	%g4,	%l0
	andn	%g2,	%o3,	%i2
	tn	%icc,	0x0
	siam	0x5
	sllx	%o7,	0x1E,	%l6
	fornot1	%f6,	%f0,	%f14
	fors	%f4,	%f5,	%f10
	fblg	%fcc2,	loop_1193
	xnor	%i7,	%o6,	%o2
	movl	%xcc,	%i5,	%o1
	subcc	%i0,	%l3,	%i1
loop_1193:
	nop
	set	0x5C, %i6
	ldub	[%l7 + %i6],	%o5
	tl	%icc,	0x6
	fexpand	%f31,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l1,	%o4
	sir	0x1901
	movne	%xcc,	%i6,	%i4
	subccc	%g3,	%l2,	%l4
	fmovsa	%icc,	%f2,	%f5
	movgu	%icc,	%g1,	%o0
	tl	%xcc,	0x0
	fxnor	%f24,	%f20,	%f26
	fcmpne32	%f2,	%f20,	%l5
	movge	%xcc,	%g5,	%i3
	stb	%g6,	[%l7 + 0x27]
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x80,	%asi
	stha	%g7,	[%l7 + 0x22] %asi
	stw	%g4,	[%l7 + 0x40]
	fmovdvs	%xcc,	%f11,	%f0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g2
	fmovrdgz	%o3,	%f16,	%f24
	xnor	%i2,	%l0,	%l6
	bn	loop_1194
	tvc	%xcc,	0x3
	movpos	%icc,	%o7,	%o6
	mova	%icc,	%o2,	%i5
loop_1194:
	nop
	set	0x3C, %o1
	prefetch	[%l7 + %o1],	 0x0
	movg	%icc,	%o1,	%i7
	addc	%i0,	0x0226,	%i1
	set	0x34, %i7
	ldswa	[%l7 + %i7] 0x15,	%o5
	edge16ln	%l1,	%o4,	%l3
	smul	%i4,	0x100E,	%g3
	bgu,pn	%xcc,	loop_1195
	fmovrdlz	%i6,	%f22,	%f12
	umulcc	%l4,	%l2,	%g1
	tl	%xcc,	0x1
loop_1195:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l5
	xnor	%g5,	0x1D5C,	%i3
	movneg	%icc,	%g6,	%o0
	fxor	%f18,	%f24,	%f12
	ldsh	[%l7 + 0x20],	%g7
	bpos	%icc,	loop_1196
	sllx	%g4,	0x0D,	%o3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x10,	%i2,	%g2
loop_1196:
	brgez,a	%l0,	loop_1197
	and	%o7,	%o6,	%o2
	fandnot2s	%f0,	%f5,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1197:
	fmovse	%icc,	%f2,	%f16
	fmul8sux16	%f20,	%f24,	%f2
	andncc	%l6,	%i5,	%o1
	orcc	%i0,	0x050A,	%i1
	bn	loop_1198
	movne	%xcc,	%o5,	%i7
	udivx	%o4,	0x1CFB,	%l3
	tvc	%xcc,	0x2
loop_1198:
	nop
	set	0x57, %l0
	stba	%l1,	[%l7 + %l0] 0x19
	movre	%i4,	0x3EC,	%g3
	nop
	setx	loop_1199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq32	%f28,	%f30,	%l4
	fnot1	%f10,	%f2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l2
loop_1199:
	tneg	%xcc,	0x7
	tge	%icc,	0x0
	tneg	%xcc,	0x7
	edge8	%g1,	%l5,	%i6
	fpadd32s	%f24,	%f26,	%f15
	tge	%icc,	0x1
	addccc	%g5,	%g6,	%o0
	smulcc	%i3,	0x016B,	%g4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x10,	%f16
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%o3
	flush	%l7 + 0x30
	movrgz	%i2,	0x06A,	%g2
	fbo	%fcc1,	loop_1200
	ldub	[%l7 + 0x46],	%l0
	fmovrdne	%g7,	%f4,	%f16
	tvc	%icc,	0x5
loop_1200:
	smul	%o7,	%o6,	%l6
	tcc	%icc,	0x4
	movle	%icc,	%i5,	%o2
	fxnors	%f9,	%f24,	%f28
	mulscc	%o1,	0x1F07,	%i0
	brz,a	%i1,	loop_1201
	movrlz	%i7,	%o4,	%l3
	edge16ln	%o5,	%i4,	%g3
	and	%l1,	0x0568,	%l4
loop_1201:
	taddcctv	%g1,	0x0112,	%l2
	array16	%l5,	%i6,	%g5
	tsubcctv	%g6,	%i3,	%o0
	fcmpne16	%f14,	%f4,	%o3
	andn	%i2,	%g2,	%l0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%g7
	set	0x78, %o2
	stba	%g4,	[%l7 + %o2] 0x2a
	membar	#Sync
	orcc	%o7,	0x0C41,	%o6
	fmovs	%f10,	%f28
	popc	%i5,	%o2
	std	%f2,	[%l7 + 0x60]
	array8	%l6,	%o1,	%i1
	xor	%i7,	0x1BDA,	%o4
	subcc	%i0,	0x0EEE,	%l3
	srax	%i4,	%g3,	%o5
	fmovda	%xcc,	%f31,	%f1
	fnors	%f10,	%f12,	%f3
	srlx	%l4,	0x18,	%g1
	andn	%l2,	%l1,	%i6
	fmovda	%icc,	%f26,	%f8
	fmovsa	%icc,	%f7,	%f27
	movgu	%xcc,	%g5,	%l5
	sll	%i3,	0x09,	%g6
	swap	[%l7 + 0x54],	%o3
	tne	%xcc,	0x7
	orn	%i2,	%g2,	%o0
	wr	%g0,	0x0c,	%asi
	stxa	%l0,	[%l7 + 0x28] %asi
	te	%xcc,	0x2
	udivx	%g7,	0x0B80,	%o7
	lduh	[%l7 + 0x0C],	%g4
	taddcc	%o6,	0x14CC,	%i5
	popc	0x0BB5,	%l6
	stb	%o1,	[%l7 + 0x08]
	fnor	%f28,	%f16,	%f28
	srax	%i1,	%o2,	%o4
	movgu	%xcc,	%i7,	%l3
	addcc	%i4,	0x0EDC,	%i0
	xnor	%g3,	%l4,	%g1
	tvs	%icc,	0x7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%l2
	array8	%l1,	%i6,	%g5
	subcc	%o5,	%l5,	%g6
	movneg	%xcc,	%i3,	%i2
	smul	%g2,	0x1F39,	%o3
	addcc	%o0,	0x0FD8,	%l0
	or	%o7,	0x0536,	%g4
	tsubcc	%o6,	0x1B5B,	%i5
	fnands	%f20,	%f1,	%f0
	fbn	%fcc3,	loop_1202
	mulscc	%l6,	0x1D0F,	%o1
	bshuffle	%f26,	%f24,	%f0
	fmul8sux16	%f16,	%f12,	%f12
loop_1202:
	xorcc	%g7,	0x0840,	%o2
	nop
	set	0x38, %i4
	lduh	[%l7 + %i4],	%o4
	edge32	%i1,	%i7,	%l3
	array16	%i0,	%i4,	%l4
	fmul8x16al	%f21,	%f2,	%f8
	edge8l	%g3,	%l2,	%g1
	addccc	%i6,	0x0C06,	%l1
	alignaddr	%o5,	%g5,	%l5
	srl	%g6,	%i2,	%g2
	fandnot1s	%f2,	%f31,	%f9
	fbo	%fcc0,	loop_1203
	bcc,a	loop_1204
	orncc	%o3,	0x14B5,	%i3
	sra	%l0,	%o7,	%g4
loop_1203:
	edge8n	%o0,	%i5,	%o6
loop_1204:
	fcmpes	%fcc2,	%f12,	%f31
	fbl,a	%fcc3,	loop_1205
	movrne	%o1,	%g7,	%l6
	siam	0x3
	fmovscc	%icc,	%f20,	%f15
loop_1205:
	andn	%o2,	%i1,	%i7
	fmovsgu	%xcc,	%f4,	%f26
	set	0x28, %i1
	lda	[%l7 + %i1] 0x14,	%f17
	edge16n	%l3,	%i0,	%o4
	set	0x2E, %l4
	ldstuba	[%l7 + %l4] 0x10,	%i4
	andn	%g3,	%l2,	%g1
	fmovrslez	%i6,	%f28,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l1,	[%l7 + 0x63]
	xnor	%l4,	%g5,	%l5
	fba	%fcc3,	loop_1206
	fmovsg	%icc,	%f13,	%f10
	fmovsn	%xcc,	%f13,	%f9
	movre	%o5,	%g6,	%g2
loop_1206:
	fnegd	%f4,	%f10
	fornot1	%f8,	%f20,	%f26
	movvc	%xcc,	%o3,	%i3
	movl	%icc,	%l0,	%i2
	sra	%g4,	0x0C,	%o7
	addccc	%o0,	%o6,	%i5
	udiv	%g7,	0x1EEA,	%l6
	movcc	%xcc,	%o2,	%i1
	fbg	%fcc0,	loop_1207
	fsrc2s	%f9,	%f16
	tsubcctv	%i7,	%o1,	%i0
	fbul,a	%fcc1,	loop_1208
loop_1207:
	fmovsle	%icc,	%f16,	%f27
	alignaddrl	%o4,	%i4,	%l3
	swap	[%l7 + 0x58],	%l2
loop_1208:
	bn,pn	%xcc,	loop_1209
	fmovdle	%xcc,	%f25,	%f23
	fmul8x16al	%f16,	%f11,	%f24
	addc	%g1,	%g3,	%i6
loop_1209:
	srlx	%l4,	%l1,	%g5
	xor	%l5,	%g6,	%o5
	fsrc2s	%f11,	%f6
	srax	%g2,	0x0D,	%i3
	st	%f1,	[%l7 + 0x54]
	tpos	%xcc,	0x0
	fmul8x16au	%f20,	%f4,	%f10
	xnor	%o3,	0x04C1,	%i2
	edge32	%l0,	%o7,	%g4
	orcc	%o0,	0x0181,	%i5
	fornot2	%f18,	%f0,	%f20
	andcc	%g7,	%o6,	%l6
	array32	%o2,	%i7,	%o1
	taddcctv	%i0,	%i1,	%o4
	tpos	%icc,	0x3
	xorcc	%i4,	%l3,	%l2
	movrlz	%g3,	%g1,	%l4
	fba	%fcc0,	loop_1210
	tleu	%xcc,	0x6
	fcmpeq16	%f8,	%f22,	%l1
	tcc	%icc,	0x1
loop_1210:
	bn,a,pt	%icc,	loop_1211
	xorcc	%g5,	0x0465,	%l5
	movpos	%xcc,	%g6,	%i6
	addcc	%g2,	0x129C,	%o5
loop_1211:
	fcmped	%fcc0,	%f28,	%f2
	srlx	%i3,	%o3,	%l0
	tne	%xcc,	0x2
	tsubcc	%o7,	0x0423,	%i2
	andcc	%o0,	0x041F,	%g4
	sir	0x1D16
	edge32	%g7,	%o6,	%l6
	xorcc	%i5,	0x021B,	%i7
	fmovrsgz	%o1,	%f25,	%f16
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0x3
	ldsw	[%l7 + 0x30],	%i1
	nop
	set	0x78, %l6
	stx	%o4,	[%l7 + %l6]
	subccc	%o2,	0x0163,	%l3
	fmovdvc	%icc,	%f0,	%f13
	movge	%icc,	%l2,	%g3
	movrgz	%i4,	%g1,	%l1
	fbn,a	%fcc2,	loop_1212
	fcmpes	%fcc3,	%f2,	%f22
	edge8ln	%g5,	%l5,	%g6
	sub	%l4,	%i6,	%o5
loop_1212:
	edge8	%g2,	%i3,	%o3
	fbu,a	%fcc1,	loop_1213
	bn,a	%xcc,	loop_1214
	movgu	%icc,	%o7,	%i2
	sllx	%o0,	0x00,	%l0
loop_1213:
	array16	%g4,	%g7,	%o6
loop_1214:
	nop
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x81,	%f8
	taddcctv	%l6,	0x0D16,	%i5
	andn	%o1,	0x1AED,	%i7
	movvc	%xcc,	%i0,	%i1
	movpos	%xcc,	%o4,	%l3
	bcc,a	%icc,	loop_1215
	addc	%l2,	%g3,	%o2
	or	%g1,	0x122D,	%l1
	xnorcc	%g5,	0x0BA5,	%l5
loop_1215:
	nop
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x10,	%i4
	fmovrsgez	%l4,	%f12,	%f20
	edge16ln	%g6,	%o5,	%i6
	mulscc	%g2,	%o3,	%i3
	tge	%icc,	0x1
	fbl,a	%fcc2,	loop_1216
	sir	0x15C5
	tvs	%icc,	0x7
	lduh	[%l7 + 0x64],	%o7
loop_1216:
	fzero	%f6
	udivx	%o0,	0x0B9F,	%l0
	edge32n	%i2,	%g4,	%o6
	fsrc2	%f8,	%f10
	andncc	%l6,	%g7,	%o1
	fpsub32	%f16,	%f16,	%f10
	edge32ln	%i7,	%i0,	%i1
	bg,a	%xcc,	loop_1217
	fmovrslez	%i5,	%f20,	%f6
	sra	%l3,	0x1D,	%l2
	tvs	%icc,	0x2
loop_1217:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x0C] %asi,	%o4
	movrgz	%o2,	0x114,	%g1
	xorcc	%g3,	0x06E7,	%l1
	tsubcctv	%l5,	0x0B51,	%g5
	movrgz	%i4,	%l4,	%g6
	ldsb	[%l7 + 0x57],	%i6
	move	%xcc,	%g2,	%o3
	edge32n	%i3,	%o7,	%o0
	movleu	%xcc,	%o5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x7
	fmul8x16au	%f26,	%f10,	%f10
	sll	%l0,	0x04,	%g4
	array32	%l6,	%o6,	%g7
	udivcc	%o1,	0x19CD,	%i7
	addccc	%i1,	0x117A,	%i5
	bn,pn	%xcc,	loop_1218
	bge,pn	%xcc,	loop_1219
	stx	%l3,	[%l7 + 0x10]
	popc	0x1430,	%l2
loop_1218:
	movrgez	%i0,	%o2,	%o4
loop_1219:
	tvc	%icc,	0x5
	edge8	%g1,	%g3,	%l5
	be,a,pt	%icc,	loop_1220
	array16	%g5,	%i4,	%l1
	fbu	%fcc3,	loop_1221
	movleu	%xcc,	%g6,	%l4
loop_1220:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_1221:
	sdivx	%i6,	0x1063,	%i3
	bn	loop_1222
	bpos,a	%icc,	loop_1223
	edge8ln	%o3,	%o7,	%o5
	fones	%f19
loop_1222:
	tvc	%xcc,	0x0
loop_1223:
	bvc	%xcc,	loop_1224
	andn	%o0,	0x15B1,	%l0
	subc	%i2,	0x17E3,	%l6
	andncc	%g4,	%g7,	%o1
loop_1224:
	taddcc	%i7,	%o6,	%i1
	sll	%l3,	0x0D,	%l2
	movrgez	%i0,	0x171,	%i5
	ldsw	[%l7 + 0x54],	%o4
	mulscc	%g1,	%g3,	%o2
	or	%l5,	0x0BBD,	%i4
	edge32l	%l1,	%g6,	%l4
	umul	%g2,	0x0216,	%g5
	array16	%i6,	%i3,	%o3
	smul	%o5,	0x051C,	%o0
	fmul8ulx16	%f4,	%f8,	%f12
	tg	%icc,	0x6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x11,	%l0,	%i2
	tle	%xcc,	0x3
	subcc	%o7,	0x015E,	%g4
	popc	%l6,	%g7
	sra	%o1,	%i7,	%i1
	stw	%l3,	[%l7 + 0x40]
	smulcc	%l2,	%i0,	%i5
	fble,a	%fcc2,	loop_1225
	sethi	0x1BD7,	%o4
	membar	0x33
	array16	%g1,	%o6,	%g3
loop_1225:
	array32	%o2,	%i4,	%l1
	addcc	%l5,	0x17DB,	%l4
	edge32n	%g6,	%g2,	%g5
	tpos	%icc,	0x0
	fmovrse	%i3,	%f9,	%f6
	fbu,a	%fcc1,	loop_1226
	swap	[%l7 + 0x28],	%i6
	membar	0x27
	alignaddr	%o3,	%o5,	%o0
loop_1226:
	nop
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x0c
	fcmple32	%f4,	%f30,	%i2
	fpackfix	%f6,	%f19
	sdivx	%o7,	0x0277,	%l0
	fbe	%fcc0,	loop_1227
	alignaddr	%l6,	%g4,	%g7
	fcmpgt16	%f30,	%f20,	%i7
	fmul8ulx16	%f22,	%f8,	%f12
loop_1227:
	movl	%icc,	%i1,	%l3
	ldub	[%l7 + 0x0C],	%l2
	tge	%xcc,	0x5
	tvs	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x1
	sethi	0x1C84,	%o1
	edge32ln	%i0,	%i5,	%g1
	std	%f30,	[%l7 + 0x58]
	alignaddr	%o4,	%o6,	%g3
	fcmpeq16	%f20,	%f2,	%o2
	edge8n	%i4,	%l5,	%l4
	bl,a,pt	%xcc,	loop_1228
	fpmerge	%f18,	%f0,	%f26
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%l1
loop_1228:
	movrlz	%g5,	%g2,	%i6
	sir	0x1D63
	smulcc	%o3,	0x1145,	%o5
	edge8n	%i3,	%i2,	%o0
	lduw	[%l7 + 0x10],	%o7
	movneg	%xcc,	%l6,	%g4
	flush	%l7 + 0x4C
	movg	%xcc,	%g7,	%l0
	nop
	setx	loop_1229,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%i1,	%i7,	%l3
	bvc	loop_1230
	prefetch	[%l7 + 0x60],	 0x1
loop_1229:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x24] %asi,	%l2
loop_1230:
	addccc	%i0,	%i5,	%g1
	addcc	%o4,	%o1,	%g3
	movg	%icc,	%o6,	%o2
	be,a,pn	%icc,	loop_1231
	add	%l5,	%l4,	%g6
	fmovrdgz	%i4,	%f28,	%f14
	udiv	%g5,	0x0F90,	%g2
loop_1231:
	movrlz	%i6,	%o3,	%o5
	be,a,pt	%icc,	loop_1232
	taddcctv	%l1,	0x1B51,	%i2
	tsubcc	%o0,	0x03AA,	%o7
	fxor	%f6,	%f2,	%f18
loop_1232:
	tn	%xcc,	0x5
	srax	%i3,	%l6,	%g4
	fpack16	%f6,	%f7
	fcmpne32	%f12,	%f28,	%l0
	edge32n	%g7,	%i1,	%l3
	ta	%xcc,	0x6
	brgez	%i7,	loop_1233
	ble	loop_1234
	brgez	%i0,	loop_1235
	pdist	%f20,	%f20,	%f20
loop_1233:
	bvc,a	%icc,	loop_1236
loop_1234:
	fnors	%f31,	%f19,	%f17
loop_1235:
	movneg	%icc,	%l2,	%g1
	tne	%icc,	0x1
loop_1236:
	tsubcc	%i5,	%o1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g3,	%o2,	%l5
	mulscc	%o6,	%g6,	%l4
	st	%f9,	[%l7 + 0x2C]
	fmovdleu	%xcc,	%f11,	%f27
	fors	%f10,	%f28,	%f10
	move	%xcc,	%g5,	%i4
	movne	%xcc,	%i6,	%o3
	fbule,a	%fcc2,	loop_1237
	udivcc	%o5,	0x0E30,	%g2
	edge8l	%l1,	%i2,	%o7
	and	%o0,	0x1782,	%l6
loop_1237:
	edge32n	%i3,	%g4,	%g7
	orn	%i1,	0x163C,	%l3
	fornot1	%f8,	%f14,	%f22
	fmovdne	%icc,	%f13,	%f29
	addcc	%l0,	%i0,	%i7
	call	loop_1238
	tpos	%xcc,	0x1
	add	%g1,	%l2,	%o1
	movre	%i5,	0x270,	%o4
loop_1238:
	nop
	setx loop_1239, %l0, %l1
	jmpl %l1, %o2
	edge8ln	%g3,	%l5,	%g6
	stx	%o6,	[%l7 + 0x50]
	tg	%icc,	0x0
loop_1239:
	edge8	%l4,	%i4,	%i6
	fone	%f8
	srl	%o3,	%g5,	%g2
	sllx	%l1,	0x18,	%i2
	tn	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o5
	ldsh	[%l7 + 0x0E],	%o0
	edge16	%o7,	%l6,	%i3
	fmovrsgez	%g4,	%f25,	%f5
	movn	%icc,	%g7,	%i1
	mulx	%l0,	0x0957,	%l3
	fpsub16s	%f20,	%f19,	%f27
	fbul	%fcc3,	loop_1240
	bl,a,pt	%icc,	loop_1241
	tcc	%icc,	0x6
	wr	%g0,	0x88,	%asi
	stda	%i6,	[%l7 + 0x18] %asi
loop_1240:
	fbul	%fcc1,	loop_1242
loop_1241:
	array8	%g1,	%i0,	%l2
	set	0x68, %l5
	ldswa	[%l7 + %l5] 0x18,	%i5
loop_1242:
	smulcc	%o1,	%o4,	%g3
	sllx	%o2,	0x00,	%l5
	edge16n	%g6,	%l4,	%o6
	membar	0x4C
	udiv	%i4,	0x0849,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o3,	%g2,	%l1
	tl	%xcc,	0x6
	stbar
	ldsw	[%l7 + 0x08],	%g5
	edge8n	%i2,	%o0,	%o7
	smul	%o5,	%l6,	%i3
	sdiv	%g4,	0x0084,	%g7
	fnors	%f30,	%f14,	%f23
	udiv	%i1,	0x04E9,	%l3
	fbu	%fcc2,	loop_1243
	fbo,a	%fcc0,	loop_1244
	movrgz	%l0,	0x1CB,	%i7
	alignaddr	%g1,	%i0,	%l2
loop_1243:
	move	%xcc,	%i5,	%o1
loop_1244:
	fcmped	%fcc1,	%f24,	%f28
	fnands	%f0,	%f20,	%f30
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x10] %asi,	%f15
	srax	%g3,	%o2,	%l5
	fmovdgu	%xcc,	%f17,	%f5
	sra	%g6,	0x03,	%o4
	sethi	0x13DF,	%o6
	movvc	%xcc,	%i4,	%i6
	subccc	%o3,	%l4,	%g2
	fmovdcs	%icc,	%f28,	%f31
	sethi	0x1AB5,	%g5
	fcmpeq16	%f26,	%f28,	%l1
	tneg	%xcc,	0x7
	set	0x70, %o5
	lduwa	[%l7 + %o5] 0x10,	%i2
	tgu	%icc,	0x6
	fbne	%fcc3,	loop_1245
	brz,a	%o7,	loop_1246
	tsubcc	%o5,	%o0,	%i3
	fmuld8sux16	%f27,	%f13,	%f14
loop_1245:
	movgu	%icc,	%g4,	%g7
loop_1246:
	nop
	set	0x70, %i5
	stxa	%i1,	[%l7 + %i5] 0xe2
	membar	#Sync
	bvs,a,pt	%xcc,	loop_1247
	edge8l	%l6,	%l0,	%l3
	udivcc	%i7,	0x0160,	%i0
	ldsh	[%l7 + 0x08],	%g1
loop_1247:
	nop
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ldd	[%l7 + 0x40],	%l2
	udivcc	%o1,	0x0CFD,	%g3
	fbule	%fcc1,	loop_1248
	or	%i5,	%o2,	%l5
	fbug,a	%fcc0,	loop_1249
	andncc	%g6,	%o4,	%o6
loop_1248:
	udivx	%i6,	0x0BCB,	%o3
	nop
	setx	loop_1250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1249:
	bleu,pn	%xcc,	loop_1251
	ld	[%l7 + 0x58],	%f2
	bne	%icc,	loop_1252
loop_1250:
	edge16ln	%i4,	%l4,	%g2
loop_1251:
	fmovdneg	%icc,	%f16,	%f7
	brnz	%l1,	loop_1253
loop_1252:
	fmovsne	%xcc,	%f16,	%f16
	sdivcc	%i2,	0x1802,	%o7
	fmovdge	%icc,	%f18,	%f27
loop_1253:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g5
	tneg	%xcc,	0x6
	umul	%o5,	0x008B,	%i3
	movrgz	%o0,	%g7,	%g4
	te	%xcc,	0x6
	set	0x0A, %g5
	ldsha	[%l7 + %g5] 0x10,	%i1
	bvs,a,pt	%xcc,	loop_1254
	movre	%l0,	0x0DD,	%l6
	or	%i7,	0x1219,	%l3
	and	%g1,	%l2,	%o1
loop_1254:
	tleu	%xcc,	0x4
	movvc	%icc,	%i0,	%g3
	array16	%i5,	%o2,	%l5
	srlx	%o4,	0x13,	%o6
	edge8	%i6,	%o3,	%g6
	orncc	%i4,	0x12B9,	%g2
	addc	%l1,	0x164D,	%l4
	tcs	%xcc,	0x6
	array8	%o7,	%g5,	%i2
	array16	%o5,	%i3,	%g7
	srlx	%o0,	0x06,	%i1
	fmul8sux16	%f18,	%f8,	%f22
	fbule,a	%fcc0,	loop_1255
	fpack16	%f26,	%f26
	umulcc	%g4,	0x1176,	%l0
	tleu	%xcc,	0x5
loop_1255:
	fsrc1	%f10,	%f12
	mulscc	%l6,	%i7,	%l3
	brlez	%l2,	loop_1256
	smulcc	%g1,	0x0A8F,	%i0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x04,	%o1,	%i5
loop_1256:
	andn	%o2,	0x0172,	%g3
	movleu	%xcc,	%o4,	%o6
	fmovdcc	%xcc,	%f1,	%f7
	movvs	%icc,	%l5,	%o3
	fbne,a	%fcc3,	loop_1257
	subc	%i6,	%g6,	%i4
	sth	%g2,	[%l7 + 0x12]
	sdiv	%l4,	0x1C2A,	%o7
loop_1257:
	addcc	%l1,	%i2,	%g5
	umul	%i3,	0x1B7A,	%o5
	faligndata	%f4,	%f12,	%f30
	fxor	%f22,	%f18,	%f2
	fmuld8ulx16	%f11,	%f22,	%f4
	tn	%icc,	0x4
	movg	%xcc,	%g7,	%i1
	edge32l	%o0,	%l0,	%l6
	bvc,pt	%icc,	loop_1258
	tneg	%xcc,	0x6
	te	%xcc,	0x5
	array8	%g4,	%l3,	%i7
loop_1258:
	edge8ln	%l2,	%g1,	%i0
	fsrc1s	%f15,	%f7
	tneg	%icc,	0x5
	addc	%i5,	%o1,	%o2
	sdivx	%o4,	0x01F1,	%g3
	fmul8ulx16	%f14,	%f0,	%f18
	mova	%icc,	%l5,	%o6
	fpsub32	%f12,	%f12,	%f12
	edge16n	%o3,	%i6,	%g6
	bneg,pn	%xcc,	loop_1259
	brgez,a	%g2,	loop_1260
	or	%l4,	%o7,	%l1
	set	0x7B, %g3
	ldsba	[%l7 + %g3] 0x10,	%i2
loop_1259:
	fbule,a	%fcc3,	loop_1261
loop_1260:
	fornot2s	%f22,	%f13,	%f15
	movrlez	%g5,	0x2AE,	%i4
	srlx	%i3,	0x16,	%o5
loop_1261:
	brlz,a	%g7,	loop_1262
	ldsb	[%l7 + 0x6C],	%o0
	alignaddr	%l0,	%i1,	%l6
	set	0x54, %g1
	stwa	%g4,	[%l7 + %g1] 0x18
loop_1262:
	fmovdle	%icc,	%f2,	%f2
	mova	%xcc,	%i7,	%l2
	tcs	%xcc,	0x2
	brgez,a	%l3,	loop_1263
	udivcc	%i0,	0x024B,	%g1
	add	%o1,	%o2,	%i5
	fmul8x16al	%f22,	%f7,	%f24
loop_1263:
	edge32l	%g3,	%l5,	%o6
	subcc	%o4,	%i6,	%g6
	bleu,a	%xcc,	loop_1264
	flush	%l7 + 0x30
	nop
	setx	loop_1265,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba	loop_1266
loop_1264:
	srlx	%g2,	%o3,	%o7
	ble,a,pt	%icc,	loop_1267
loop_1265:
	movvs	%icc,	%l4,	%i2
loop_1266:
	lduw	[%l7 + 0x7C],	%l1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x28] %asi,	%g5
loop_1267:
	fone	%f10
	orncc	%i4,	%i3,	%g7
	movn	%xcc,	%o0,	%l0
	movvs	%icc,	%i1,	%l6
	edge8	%o5,	%g4,	%i7
	smulcc	%l3,	0x026D,	%l2
	bpos,pn	%icc,	loop_1268
	movpos	%icc,	%g1,	%o1
	set	0x48, %g2
	swapa	[%l7 + %g2] 0x80,	%o2
loop_1268:
	sdiv	%i0,	0x144B,	%g3
	fpsub32	%f10,	%f16,	%f20
	umul	%l5,	0x18A4,	%i5
	fnot1s	%f25,	%f8
	fcmpgt32	%f6,	%f26,	%o4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x44] %asi,	%o6
	edge32l	%i6,	%g2,	%g6
	nop
	setx	loop_1269,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%o3,	0x1EE0,	%o7
	popc	0x0491,	%i2
	add	%l1,	%g5,	%l4
loop_1269:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x60] %asi,	%i3
	movcc	%xcc,	%i4,	%o0
	te	%icc,	0x4
	sdivx	%g7,	0x03AA,	%l0
	edge8n	%l6,	%i1,	%o5
	subccc	%i7,	0x1A94,	%l3
	fmovrdgez	%g4,	%f8,	%f12
	sra	%g1,	%o1,	%o2
	edge16n	%i0,	%l2,	%g3
	bl,pn	%icc,	loop_1270
	movn	%icc,	%i5,	%l5
	st	%f8,	[%l7 + 0x2C]
	ba,a,pt	%xcc,	loop_1271
loop_1270:
	sethi	0x108E,	%o6
	sdivcc	%o4,	0x05D9,	%i6
	fmovsneg	%icc,	%f5,	%f25
loop_1271:
	bvc,a	%xcc,	loop_1272
	alignaddr	%g6,	%o3,	%o7
	movge	%xcc,	%i2,	%g2
	fmovdne	%icc,	%f9,	%f10
loop_1272:
	fpsub16	%f20,	%f14,	%f30
	tsubcctv	%l1,	%l4,	%g5
	ldd	[%l7 + 0x20],	%f18
	tsubcctv	%i3,	%o0,	%g7
	brz,a	%l0,	loop_1273
	subccc	%i4,	%i1,	%l6
	tl	%icc,	0x4
	fmovde	%xcc,	%f2,	%f3
loop_1273:
	edge16	%o5,	%l3,	%i7
	bpos,a	%icc,	loop_1274
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%g4
loop_1274:
	subccc	%o1,	%o2,	%i0
	fmovsgu	%xcc,	%f14,	%f27
	array8	%l2,	%g3,	%g1
	movrlz	%i5,	%l5,	%o4
	fzeros	%f15
	movneg	%icc,	%i6,	%g6
	mulscc	%o3,	%o7,	%o6
	fnot1	%f20,	%f6
	array16	%i2,	%g2,	%l4
	movvs	%xcc,	%l1,	%i3
	movvs	%xcc,	%g5,	%o0
	array16	%l0,	%i4,	%g7
	tsubcc	%i1,	0x0D8D,	%l6
	fba,a	%fcc1,	loop_1275
	fmovdcs	%icc,	%f20,	%f26
	subccc	%l3,	0x0742,	%o5
	tne	%icc,	0x2
loop_1275:
	fsrc2	%f28,	%f8
	taddcctv	%g4,	0x0204,	%i7
	ba,a,pt	%icc,	loop_1276
	for	%f30,	%f24,	%f2
	movvs	%icc,	%o1,	%i0
	movge	%xcc,	%o2,	%l2
loop_1276:
	brz,a	%g1,	loop_1277
	movgu	%icc,	%i5,	%g3
	brz,a	%o4,	loop_1278
	movpos	%icc,	%l5,	%g6
loop_1277:
	srl	%o3,	0x1D,	%i6
	umulcc	%o6,	%i2,	%o7
loop_1278:
	tg	%xcc,	0x2
	fxor	%f28,	%f18,	%f28
	bleu,a	loop_1279
	bvs	loop_1280
	sra	%g2,	0x1B,	%l1
	orcc	%i3,	0x0048,	%l4
loop_1279:
	bn,a	%xcc,	loop_1281
loop_1280:
	taddcc	%g5,	%o0,	%l0
	tg	%icc,	0x6
	udivcc	%g7,	0x145E,	%i4
loop_1281:
	fmovsle	%icc,	%f16,	%f12
	edge8l	%i1,	%l3,	%o5
	xnorcc	%g4,	0x1BCB,	%l6
	sub	%i7,	%i0,	%o1
	tl	%xcc,	0x5
	fone	%f8
	brnz,a	%l2,	loop_1282
	fbule,a	%fcc2,	loop_1283
	tn	%icc,	0x2
	tsubcctv	%g1,	%o2,	%i5
loop_1282:
	sra	%g3,	0x17,	%l5
loop_1283:
	tg	%xcc,	0x6
	xor	%g6,	%o4,	%i6
	tne	%xcc,	0x2
	movneg	%icc,	%o3,	%o6
	tn	%xcc,	0x7
	bpos,a,pt	%xcc,	loop_1284
	array8	%i2,	%g2,	%o7
	alignaddr	%i3,	%l1,	%g5
	movgu	%icc,	%l4,	%l0
loop_1284:
	nop
	set	0x20, %g4
	ldxa	[%l7 + %g4] 0x80,	%o0
	movn	%xcc,	%g7,	%i1
	movleu	%xcc,	%l3,	%i4
	umul	%g4,	%o5,	%i7
	fnand	%f2,	%f4,	%f16
	movre	%l6,	%o1,	%i0
	tge	%xcc,	0x5
	smul	%l2,	%o2,	%g1
	or	%g3,	0x1DE7,	%i5
	fornot1	%f16,	%f28,	%f18
	movpos	%xcc,	%l5,	%o4
	fcmpes	%fcc2,	%f13,	%f9
	movcc	%xcc,	%i6,	%o3
	bvc	loop_1285
	fandnot1s	%f18,	%f25,	%f18
	lduh	[%l7 + 0x40],	%g6
	movne	%xcc,	%o6,	%g2
loop_1285:
	nop
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x80,	 0x1
	tge	%xcc,	0x5
	tsubcc	%i3,	0x0BF7,	%l1
	tcs	%xcc,	0x7
	fmovdg	%icc,	%f23,	%f14
	sdiv	%i2,	0x1959,	%g5
	edge16	%l0,	%l4,	%o0
	smulcc	%g7,	0x1B1C,	%l3
	smulcc	%i1,	%i4,	%o5
	swap	[%l7 + 0x38],	%i7
	stb	%l6,	[%l7 + 0x5D]
	stx	%g4,	[%l7 + 0x58]
	smulcc	%o1,	%l2,	%i0
	sth	%g1,	[%l7 + 0x08]
	movrgz	%o2,	%i5,	%g3
	orcc	%l5,	0x14FF,	%i6
	movcc	%xcc,	%o3,	%g6
	tcs	%icc,	0x1
	fand	%f18,	%f12,	%f12
	popc	0x11CE,	%o4
	andcc	%o6,	%g2,	%o7
	movpos	%icc,	%i3,	%i2
	ld	[%l7 + 0x70],	%f12
	movvs	%xcc,	%g5,	%l1
	fmovsvc	%icc,	%f16,	%f10
	fornot1	%f2,	%f26,	%f28
	fmovsvc	%icc,	%f19,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l4,	%o0,	%l0
	tpos	%icc,	0x3
	addccc	%l3,	0x0D80,	%g7
	nop
	setx	loop_1286,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegd	%f16,	%f20
	array16	%i4,	%o5,	%i1
	for	%f6,	%f28,	%f10
loop_1286:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i7,	0x09A,	%l6
	array8	%g4,	%l2,	%i0
	tn	%xcc,	0x4
	taddcctv	%o1,	%g1,	%i5
	tge	%icc,	0x1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g3,	%o2
	fmovscs	%icc,	%f9,	%f5
	swap	[%l7 + 0x10],	%l5
	lduw	[%l7 + 0x70],	%i6
	udiv	%g6,	0x1D86,	%o3
	tg	%icc,	0x2
	movpos	%icc,	%o6,	%o4
	movle	%xcc,	%o7,	%i3
	ldsb	[%l7 + 0x64],	%i2
	edge8l	%g2,	%l1,	%l4
	te	%xcc,	0x0
	addcc	%o0,	%g5,	%l3
	sethi	0x0303,	%g7
	fpack16	%f8,	%f31
	set	0x0F, %l2
	ldstuba	[%l7 + %l2] 0x10,	%l0
	udivx	%o5,	0x0730,	%i4
	sth	%i7,	[%l7 + 0x16]
	brz,a	%l6,	loop_1287
	fcmpne32	%f18,	%f14,	%g4
	tgu	%icc,	0x1
	subc	%l2,	0x16C0,	%i0
loop_1287:
	andcc	%i1,	0x147E,	%g1
	bneg,pn	%icc,	loop_1288
	movl	%icc,	%o1,	%g3
	bne,pn	%icc,	loop_1289
	nop
	setx	loop_1290,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1288:
	subcc	%o2,	%i5,	%l5
	xnor	%g6,	%i6,	%o3
loop_1289:
	call	loop_1291
loop_1290:
	fnands	%f11,	%f22,	%f4
	edge8l	%o4,	%o6,	%i3
	movg	%icc,	%o7,	%g2
loop_1291:
	edge8n	%l1,	%l4,	%i2
	fnand	%f22,	%f4,	%f10
	andcc	%o0,	0x1923,	%l3
	fmovdne	%xcc,	%f0,	%f29
	srax	%g7,	%g5,	%o5
	fbe	%fcc2,	loop_1292
	mulscc	%i4,	0x1438,	%i7
	move	%icc,	%l0,	%g4
	movrgez	%l6,	%l2,	%i0
loop_1292:
	edge8n	%g1,	%o1,	%i1
	movn	%xcc,	%o2,	%g3
	fcmple16	%f10,	%f30,	%l5
	srl	%i5,	%i6,	%g6
	subc	%o3,	%o4,	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o7
	sdiv	%g2,	0x1D60,	%l1
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x14] %asi,	%i2
	fornot1	%f14,	%f14,	%f2
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	movrgz	%l4,	0x358,	%l3
	edge8n	%g5,	%o5,	%i4
	set	0x20, %o7
	ldstuba	[%l7 + %o7] 0x10,	%i7
	add	%g7,	%g4,	%l6
	edge32l	%l2,	%i0,	%g1
	mova	%icc,	%l0,	%o1
	andcc	%i1,	%g3,	%o2
	bleu,a	loop_1293
	edge8l	%l5,	%i5,	%g6
	bn,a	%icc,	loop_1294
	xorcc	%i6,	0x1CEC,	%o4
loop_1293:
	tg	%icc,	0x5
	te	%icc,	0x7
loop_1294:
	tgu	%xcc,	0x2
	movrgez	%o3,	0x118,	%i3
	movle	%icc,	%o6,	%o7
	fcmpne32	%f12,	%f16,	%g2
	ta	%icc,	0x2
	edge8ln	%l1,	%o0,	%l4
	bcs,pt	%xcc,	loop_1295
	tleu	%icc,	0x2
	srl	%l3,	0x1B,	%i2
	fmovdvc	%xcc,	%f21,	%f20
loop_1295:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f13,	%f4
	fabss	%f23,	%f30
	fbuge,a	%fcc2,	loop_1296
	movrlz	%g5,	%i4,	%i7
	movl	%xcc,	%o5,	%g7
	movvc	%xcc,	%l6,	%l2
loop_1296:
	bvs,pt	%icc,	loop_1297
	fmovsleu	%xcc,	%f15,	%f9
	addccc	%i0,	0x0030,	%g4
	stb	%l0,	[%l7 + 0x34]
loop_1297:
	movneg	%xcc,	%g1,	%o1
	tsubcc	%g3,	%i1,	%o2
	tne	%xcc,	0x2
	nop
	setx	loop_1298,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%l5,	%g6
	move	%icc,	%i5,	%i6
	movn	%xcc,	%o3,	%o4
loop_1298:
	fmovdg	%xcc,	%f28,	%f28
	sllx	%o6,	0x06,	%i3
	brgez,a	%o7,	loop_1299
	sth	%g2,	[%l7 + 0x66]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f20,	%f24
loop_1299:
	edge16l	%o0,	%l1,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f0,	%f26,	%f2
	tvs	%xcc,	0x2
	xnor	%i2,	%g5,	%l3
	mova	%xcc,	%i7,	%o5
	umul	%g7,	%i4,	%l2
	fmovrslez	%i0,	%f13,	%f0
	movcc	%icc,	%g4,	%l6
	mulx	%l0,	%g1,	%g3
	stx	%i1,	[%l7 + 0x10]
	movre	%o2,	%o1,	%l5
	fbge	%fcc1,	loop_1300
	tl	%xcc,	0x2
	sll	%g6,	0x08,	%i6
	edge8l	%o3,	%i5,	%o6
loop_1300:
	fmul8x16	%f9,	%f20,	%f6
	movleu	%xcc,	%i3,	%o4
	movg	%xcc,	%g2,	%o7
	movrgez	%l1,	%o0,	%i2
	std	%g4,	[%l7 + 0x38]
	ld	[%l7 + 0x34],	%f27
	set	0x56, %l3
	ldsba	[%l7 + %l3] 0x80,	%l4
	subc	%l3,	0x0DE3,	%i7
	xor	%g7,	%i4,	%o5
	mulx	%l2,	0x1580,	%g4
	tne	%xcc,	0x4
	tleu	%icc,	0x6
	fmovrsgez	%i0,	%f19,	%f15
	brnz	%l0,	loop_1301
	edge8n	%g1,	%l6,	%g3
	fmovda	%xcc,	%f1,	%f11
	orn	%i1,	%o1,	%o2
loop_1301:
	fmovs	%f10,	%f29
	fmovrsgez	%l5,	%f28,	%f5
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bge	loop_1302
	nop
	setx	loop_1303,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%g6,	%i6,	%i5
	fnors	%f3,	%f22,	%f14
loop_1302:
	nop
	set	0x4A, %i2
	lduha	[%l7 + %i2] 0x88,	%o6
loop_1303:
	array16	%i3,	%o4,	%o3
	orcc	%g2,	%o7,	%l1
	te	%icc,	0x4
	nop
	setx	loop_1304,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%o0,	%i2,	%g5
	tcs	%icc,	0x1
	sub	%l3,	0x1175,	%i7
loop_1304:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%l4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	fmovdne	%icc,	%f26,	%f11
	mova	%xcc,	%o5,	%g4
	fmovsa	%xcc,	%f5,	%f3
	fbule,a	%fcc3,	loop_1305
	fmovda	%xcc,	%f4,	%f11
	umulcc	%i0,	%l2,	%l0
	be,a,pn	%icc,	loop_1306
loop_1305:
	srax	%g1,	%l6,	%g3
	fbu	%fcc3,	loop_1307
	bvs,pn	%icc,	loop_1308
loop_1306:
	bleu,pt	%xcc,	loop_1309
	fbue	%fcc3,	loop_1310
loop_1307:
	andcc	%o1,	%o2,	%l5
loop_1308:
	bge	loop_1311
loop_1309:
	bvs	%icc,	loop_1312
loop_1310:
	sir	0x03E2
	nop
	setx loop_1313, %l0, %l1
	jmpl %l1, %g6
loop_1311:
	udivcc	%i1,	0x0E1D,	%i5
loop_1312:
	movcs	%xcc,	%i6,	%o6
	andncc	%i3,	%o4,	%o3
loop_1313:
	edge32n	%o7,	%g2,	%l1
	bge,a	loop_1314
	be,a	%xcc,	loop_1315
	ldx	[%l7 + 0x50],	%o0
	fcmpeq32	%f6,	%f20,	%i2
loop_1314:
	umul	%l3,	%g5,	%g7
loop_1315:
	fba	%fcc3,	loop_1316
	movrlz	%l4,	%i4,	%o5
	fmovrde	%g4,	%f8,	%f28
	fmovdne	%icc,	%f0,	%f1
loop_1316:
	call	loop_1317
	fmovsl	%xcc,	%f12,	%f22
	wr	%g0,	0x2a,	%asi
	stha	%i0,	[%l7 + 0x16] %asi
	membar	#Sync
loop_1317:
	nop
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	fbne	%fcc0,	loop_1318
	smul	%i7,	%l0,	%g1
	fmovsl	%xcc,	%f22,	%f7
	tsubcctv	%l6,	0x16E8,	%o1
loop_1318:
	srlx	%g3,	0x0D,	%l5
	tcc	%xcc,	0x6
	fmovdgu	%xcc,	%f4,	%f27
	std	%f14,	[%l7 + 0x30]
	fmovsle	%xcc,	%f1,	%f11
	set	0x48, %g6
	swapa	[%l7 + %g6] 0x80,	%g6
	fmuld8ulx16	%f1,	%f3,	%f14
	tn	%icc,	0x7
	movre	%o2,	0x17E,	%i1
	fmovrdgez	%i6,	%f16,	%f10
	fcmpgt32	%f30,	%f6,	%o6
	bvc,a,pt	%icc,	loop_1319
	fxnors	%f23,	%f5,	%f15
	orncc	%i3,	0x1D8C,	%o4
	fmovsa	%icc,	%f11,	%f31
loop_1319:
	sir	0x0B0C
	array16	%i5,	%o3,	%g2
	edge32n	%l1,	%o0,	%o7
	mulx	%i2,	%l3,	%g5
	brnz,a	%g7,	loop_1320
	bn	loop_1321
	fandnot1s	%f28,	%f15,	%f13
	ldsw	[%l7 + 0x4C],	%l4
loop_1320:
	fmovsle	%xcc,	%f14,	%f29
loop_1321:
	tsubcc	%i4,	%o5,	%g4
	fmovdpos	%icc,	%f9,	%f25
	movne	%icc,	%l2,	%i7
	set	0x71, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i0
	sdiv	%l0,	0x1FB5,	%g1
	membar	0x6A
	mulscc	%l6,	0x0830,	%o1
	nop
	setx loop_1322, %l0, %l1
	jmpl %l1, %l5
	be,a	loop_1323
	brlz,a	%g3,	loop_1324
	edge8ln	%g6,	%i1,	%o2
loop_1322:
	bgu,a	%icc,	loop_1325
loop_1323:
	edge16l	%i6,	%i3,	%o6
loop_1324:
	movpos	%xcc,	%i5,	%o4
	fcmpeq16	%f14,	%f0,	%g2
loop_1325:
	subc	%l1,	0x1C1A,	%o0
	tneg	%icc,	0x1
	xnor	%o7,	%o3,	%i2
	andcc	%g5,	0x0F87,	%l3
	bgu,pt	%icc,	loop_1326
	bcc	%icc,	loop_1327
	fmovdgu	%xcc,	%f17,	%f18
	edge16n	%l4,	%i4,	%o5
loop_1326:
	fmovrde	%g7,	%f28,	%f18
loop_1327:
	te	%xcc,	0x3
	fmuld8sux16	%f29,	%f30,	%f16
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x81,	%g4
	xorcc	%l2,	%i0,	%l0
	tl	%icc,	0x7
	movvs	%xcc,	%g1,	%i7
	for	%f4,	%f22,	%f20
	membar	0x12
	fmovscc	%xcc,	%f29,	%f22
	tgu	%icc,	0x5
	call	loop_1328
	add	%l6,	%l5,	%o1
	fcmpes	%fcc0,	%f20,	%f14
	fsrc2s	%f19,	%f11
loop_1328:
	fmovrdgz	%g3,	%f24,	%f10
	alignaddr	%i1,	%o2,	%i6
	xor	%g6,	%o6,	%i5
	stw	%o4,	[%l7 + 0x74]
	tge	%icc,	0x3
	sll	%i3,	0x0B,	%g2
	fmovspos	%xcc,	%f4,	%f26
	bvs,a	%icc,	loop_1329
	stb	%l1,	[%l7 + 0x28]
	ldub	[%l7 + 0x5B],	%o7
	udivx	%o3,	0x03BA,	%o0
loop_1329:
	and	%i2,	0x1AAC,	%g5
	movvs	%icc,	%l3,	%l4
	alignaddrl	%o5,	%i4,	%g4
	xnorcc	%g7,	0x1168,	%i0
	fbe,a	%fcc3,	loop_1330
	andn	%l0,	%l2,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f13,	%f6
loop_1330:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x18] %asi,	%l6
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f0
	movg	%xcc,	%l5,	%o1
	sdiv	%i7,	0x0B9D,	%g3
	set	0x44, %i6
	sta	%f0,	[%l7 + %i6] 0x14
	movrne	%o2,	0x178,	%i1
	flush	%l7 + 0x14
	tgu	%icc,	0x0
	movrlez	%g6,	0x0CA,	%i6
	set	0x39, %l0
	ldstuba	[%l7 + %l0] 0x11,	%o6
	movn	%xcc,	%o4,	%i5
	tn	%xcc,	0x5
	ldub	[%l7 + 0x19],	%g2
	umul	%i3,	%o7,	%o3
	nop
	set	0x50, %i3
	std	%f26,	[%l7 + %i3]
	umulcc	%o0,	%i2,	%g5
	bge,pn	%xcc,	loop_1331
	fbul,a	%fcc2,	loop_1332
	movneg	%icc,	%l1,	%l4
	fpackfix	%f2,	%f4
loop_1331:
	umul	%l3,	%i4,	%o5
loop_1332:
	tcs	%icc,	0x4
	fmul8x16al	%f9,	%f0,	%f8
	ble,a	%icc,	loop_1333
	sll	%g4,	%i0,	%l0
	mova	%xcc,	%g7,	%g1
	prefetch	[%l7 + 0x08],	 0x0
loop_1333:
	array8	%l2,	%l6,	%l5
	brlz	%o1,	loop_1334
	movvs	%icc,	%i7,	%g3
	movre	%o2,	0x18E,	%i1
	edge16ln	%g6,	%o6,	%o4
loop_1334:
	bshuffle	%f4,	%f26,	%f6
	fmovrsgez	%i5,	%f23,	%f11
	array32	%g2,	%i3,	%o7
	edge32	%o3,	%i6,	%i2
	brlez,a	%g5,	loop_1335
	ldstub	[%l7 + 0x67],	%l1
	edge32l	%o0,	%l4,	%i4
	fsrc1s	%f17,	%f19
loop_1335:
	fmovscc	%xcc,	%f6,	%f31
	sll	%o5,	%g4,	%l3
	bleu,pn	%icc,	loop_1336
	fcmpgt32	%f26,	%f16,	%l0
	lduw	[%l7 + 0x54],	%g7
	umul	%g1,	%l2,	%l6
loop_1336:
	tcc	%xcc,	0x3
	tgu	%icc,	0x0
	andn	%i0,	%l5,	%o1
	alignaddrl	%i7,	%g3,	%i1
	fmovdpos	%xcc,	%f12,	%f30
	xor	%o2,	%g6,	%o6
	smul	%i5,	%o4,	%g2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x40] %asi,	%o7
	set	0x78, %i7
	swapa	[%l7 + %i7] 0x88,	%i3
	xnorcc	%o3,	%i6,	%g5
	subcc	%i2,	%l1,	%o0
	std	%f4,	[%l7 + 0x50]
	fpmerge	%f18,	%f25,	%f24
	set	0x43, %i4
	lduba	[%l7 + %i4] 0x18,	%l4
	and	%o5,	%i4,	%l3
	set	0x60, %o2
	stda	%g4,	[%l7 + %o2] 0x18
	fmovdcs	%icc,	%f17,	%f6
	fba,a	%fcc1,	loop_1337
	fand	%f0,	%f0,	%f18
	stbar
	edge32	%l0,	%g7,	%l2
loop_1337:
	tsubcc	%g1,	0x0045,	%l6
	tle	%xcc,	0x7
	fmovsne	%xcc,	%f29,	%f30
	add	%i0,	0x05CC,	%o1
	tn	%icc,	0x5
	sdiv	%i7,	0x1277,	%g3
	movrne	%i1,	%o2,	%l5
	movrlez	%o6,	0x102,	%g6
	fpadd16s	%f22,	%f23,	%f14
	fpsub16s	%f14,	%f27,	%f4
	tvc	%xcc,	0x7
	fbuge	%fcc1,	loop_1338
	sdivcc	%i5,	0x11E5,	%o4
	bleu,a,pn	%xcc,	loop_1339
	stbar
loop_1338:
	addcc	%g2,	0x0641,	%i3
	movge	%icc,	%o3,	%i6
loop_1339:
	nop
	setx	loop_1340,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x5
	umulcc	%g5,	0x1A39,	%i2
	set	0x5E, %i1
	ldsha	[%l7 + %i1] 0x88,	%l1
loop_1340:
	movle	%xcc,	%o7,	%l4
	udiv	%o5,	0x0514,	%i4
	fmovrdlz	%o0,	%f26,	%f6
	fcmpne32	%f28,	%f24,	%g4
	xorcc	%l3,	0x0217,	%l0
	bvc,a	%icc,	loop_1341
	addcc	%l2,	%g7,	%g1
	tpos	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1341:
	and	%i0,	%l6,	%o1
	smul	%i7,	%g3,	%o2
	edge32ln	%i1,	%l5,	%g6
	edge16l	%o6,	%i5,	%o4
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i3
	udiv	%g2,	0x1743,	%o3
	tgu	%xcc,	0x5
	bpos,a	loop_1342
	fnors	%f9,	%f1,	%f30
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x34] %asi,	%i6
loop_1342:
	nop
	set	0x19, %l4
	lduba	[%l7 + %l4] 0x0c,	%g5
	std	%i2,	[%l7 + 0x30]
	array16	%o7,	%l4,	%l1
	movrne	%i4,	%o0,	%o5
	set	0x1A, %l6
	stba	%g4,	[%l7 + %l6] 0xe2
	membar	#Sync
	bcs	%xcc,	loop_1343
	ldd	[%l7 + 0x08],	%l2
	orcc	%l2,	%g7,	%l0
	stx	%g1,	[%l7 + 0x48]
loop_1343:
	movl	%xcc,	%i0,	%o1
	membar	0x15
	ba,a,pn	%xcc,	loop_1344
	edge8ln	%i7,	%l6,	%g3
	movrgez	%o2,	%i1,	%l5
	fornot1	%f6,	%f16,	%f20
loop_1344:
	addcc	%o6,	%g6,	%o4
	move	%xcc,	%i3,	%i5
	movrgz	%o3,	%g2,	%i6
	ldsh	[%l7 + 0x5E],	%i2
	xorcc	%o7,	0x17A6,	%g5
	orcc	%l4,	0x0076,	%i4
	edge32l	%l1,	%o5,	%g4
	fmovdcc	%icc,	%f28,	%f23
	tle	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x22] %asi,	%o0
	fbge,a	%fcc1,	loop_1345
	movrgz	%l2,	0x311,	%g7
	xnorcc	%l0,	%g1,	%l3
	fornot2	%f28,	%f26,	%f20
loop_1345:
	fnegs	%f20,	%f23
	set	0x5C, %l1
	ldswa	[%l7 + %l1] 0x0c,	%o1
	udivcc	%i7,	0x1CD0,	%i0
	movvs	%icc,	%g3,	%l6
	lduw	[%l7 + 0x58],	%i1
	edge8l	%o2,	%l5,	%o6
	orcc	%g6,	%i3,	%i5
	tl	%icc,	0x0
	sra	%o4,	0x16,	%o3
	tg	%icc,	0x7
	subccc	%i6,	0x1831,	%i2
	fmovsl	%xcc,	%f4,	%f2
	fbo	%fcc1,	loop_1346
	std	%f28,	[%l7 + 0x20]
	subc	%o7,	%g2,	%g5
	fba	%fcc2,	loop_1347
loop_1346:
	fones	%f20
	srlx	%l4,	%l1,	%i4
	smul	%g4,	0x0C3E,	%o5
loop_1347:
	nop
	setx loop_1348, %l0, %l1
	jmpl %l1, %o0
	fmovrslz	%g7,	%f3,	%f30
	fcmpeq32	%f8,	%f16,	%l0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%g1
loop_1348:
	sir	0x1DCC
	fcmpes	%fcc3,	%f3,	%f9
	movrgez	%l3,	0x03E,	%o1
	tn	%icc,	0x3
	bvc,pt	%xcc,	loop_1349
	fmovrde	%l2,	%f20,	%f20
	movg	%icc,	%i7,	%g3
	xnor	%l6,	0x1B15,	%i1
loop_1349:
	bvc,pn	%icc,	loop_1350
	edge32l	%i0,	%o2,	%o6
	brnz	%l5,	loop_1351
	fmovsg	%icc,	%f12,	%f7
loop_1350:
	tcs	%icc,	0x1
	edge32n	%g6,	%i5,	%i3
loop_1351:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o3,	%i6
	fpackfix	%f6,	%f14
	taddcctv	%i2,	%o4,	%g2
	edge8n	%g5,	%o7,	%l4
	movpos	%xcc,	%i4,	%g4
	sdivx	%l1,	0x02F4,	%o0
	swap	[%l7 + 0x44],	%o5
	tneg	%xcc,	0x4
	brlz	%g7,	loop_1352
	tl	%xcc,	0x5
	add	%g1,	%l3,	%l0
	sll	%o1,	%l2,	%i7
loop_1352:
	bne,a	loop_1353
	tpos	%icc,	0x0
	edge8n	%l6,	%g3,	%i0
	edge16n	%i1,	%o6,	%l5
loop_1353:
	fcmpgt16	%f20,	%f0,	%o2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	call	loop_1354
	fblg	%fcc1,	loop_1355
	bge	loop_1356
	popc	0x17D7,	%g6
loop_1354:
	fbg	%fcc2,	loop_1357
loop_1355:
	tl	%xcc,	0x6
loop_1356:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i5,	%i3
loop_1357:
	movn	%icc,	%i6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pn	%icc,	loop_1358
	sub	%i2,	0x0204,	%o4
	fbuge	%fcc1,	loop_1359
	bgu,a,pn	%xcc,	loop_1360
loop_1358:
	fmul8ulx16	%f18,	%f6,	%f10
	srlx	%g5,	%g2,	%l4
loop_1359:
	ldd	[%l7 + 0x60],	%f20
loop_1360:
	fmovse	%icc,	%f1,	%f14
	movre	%i4,	0x24B,	%o7
	be	loop_1361
	stx	%l1,	[%l7 + 0x48]
	movrgez	%o0,	%o5,	%g4
	subccc	%g1,	0x191E,	%g7
loop_1361:
	movcc	%xcc,	%l3,	%o1
	bg,a,pn	%xcc,	loop_1362
	tleu	%xcc,	0x1
	fmovsvs	%xcc,	%f1,	%f25
	array32	%l2,	%i7,	%l0
loop_1362:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l6
	bne,a,pn	%xcc,	loop_1363
	fmovdcc	%icc,	%f30,	%f27
	edge16l	%i0,	%i1,	%g3
	wr	%g0,	0x80,	%asi
	stha	%o6,	[%l7 + 0x72] %asi
loop_1363:
	mulscc	%l5,	%g6,	%o2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x26] %asi,	%i3
	fpack16	%f20,	%f29
	bcc,a,pn	%icc,	loop_1364
	te	%xcc,	0x3
	srl	%i6,	%o3,	%i2
	array32	%o4,	%g5,	%g2
loop_1364:
	umulcc	%l4,	%i5,	%o7
	tne	%xcc,	0x3
	movrlz	%i4,	%o0,	%l1
	addcc	%o5,	%g1,	%g7
	fpadd16	%f12,	%f14,	%f30
	edge8ln	%g4,	%o1,	%l2
	udivcc	%i7,	0x12F0,	%l3
	fmovrslez	%l6,	%f17,	%f17
	fand	%f10,	%f14,	%f4
	fmovscs	%xcc,	%f19,	%f3
	edge32	%l0,	%i1,	%i0
	edge16	%g3,	%l5,	%g6
	alignaddr	%o6,	%o2,	%i3
	fmovrsne	%o3,	%f4,	%f3
	tvs	%icc,	0x6
	orn	%i6,	0x155B,	%o4
	movleu	%icc,	%i2,	%g2
	edge16	%l4,	%i5,	%g5
	movpos	%xcc,	%o7,	%o0
	fpsub32s	%f16,	%f24,	%f25
	srax	%i4,	0x03,	%l1
	tge	%xcc,	0x7
	tne	%icc,	0x1
	addcc	%g1,	0x02E3,	%g7
	wr	%g0,	0x10,	%asi
	stwa	%g4,	[%l7 + 0x6C] %asi
	array32	%o5,	%l2,	%o1
	fbuge,a	%fcc0,	loop_1365
	membar	0x02
	edge32n	%i7,	%l6,	%l3
	move	%icc,	%i1,	%i0
loop_1365:
	fmovdvc	%icc,	%f22,	%f5
	addcc	%l0,	0x1168,	%g3
	srl	%l5,	%o6,	%g6
	srlx	%i3,	%o3,	%i6
	fbo,a	%fcc0,	loop_1366
	st	%f18,	[%l7 + 0x30]
	xorcc	%o4,	%o2,	%i2
	tpos	%icc,	0x7
loop_1366:
	smul	%g2,	%l4,	%g5
	movle	%xcc,	%o7,	%i5
	smulcc	%o0,	%i4,	%l1
	be,a	%xcc,	loop_1367
	edge16	%g1,	%g4,	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%g7
loop_1367:
	udivcc	%i7,	0x0111,	%o1
	movcc	%icc,	%l6,	%i1
	stx	%i0,	[%l7 + 0x50]
	movne	%xcc,	%l0,	%g3
	stb	%l5,	[%l7 + 0x5A]
	stx	%l3,	[%l7 + 0x60]
	bpos,a	%icc,	loop_1368
	edge16	%o6,	%g6,	%i3
	fcmped	%fcc2,	%f2,	%f2
	fmovs	%f23,	%f28
loop_1368:
	fabsd	%f6,	%f4
	subcc	%i6,	%o3,	%o2
	xnorcc	%i2,	%g2,	%o4
	fexpand	%f18,	%f20
	fmovde	%xcc,	%f31,	%f31
	sdivcc	%g5,	0x0AEC,	%l4
	tle	%icc,	0x2
	bge	%icc,	loop_1369
	fbul,a	%fcc0,	loop_1370
	fbue	%fcc2,	loop_1371
	movre	%o7,	%o0,	%i4
loop_1369:
	sdivx	%l1,	0x00ED,	%i5
loop_1370:
	taddcc	%g1,	%o5,	%l2
loop_1371:
	sdiv	%g4,	0x1E2C,	%i7
	movgu	%icc,	%g7,	%o1
	fmovscc	%xcc,	%f1,	%f22
	ldsw	[%l7 + 0x70],	%l6
	fcmpeq32	%f10,	%f26,	%i1
	te	%xcc,	0x6
	nop
	set	0x34, %i0
	lduh	[%l7 + %i0],	%i0
	srlx	%l0,	0x0C,	%l5
	for	%f24,	%f12,	%f6
	bgu	%icc,	loop_1372
	tle	%xcc,	0x3
	fmovrdlz	%g3,	%f16,	%f30
	sra	%l3,	0x10,	%g6
loop_1372:
	ldsb	[%l7 + 0x72],	%i3
	mulx	%i6,	%o6,	%o3
	tge	%xcc,	0x6
	fandnot1s	%f22,	%f12,	%f3
	edge32ln	%o2,	%g2,	%o4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x58] %asi,	%i2
	edge8n	%g5,	%o7,	%o0
	move	%xcc,	%l4,	%l1
	movcc	%icc,	%i4,	%g1
	fmovsn	%xcc,	%f24,	%f9
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	taddcc	%l2,	0x1F7B,	%o5
	fxnor	%f22,	%f2,	%f14
	movle	%icc,	%g4,	%g7
	set	0x1B, %g7
	stba	%i7,	[%l7 + %g7] 0x2f
	membar	#Sync
	movge	%xcc,	%l6,	%i1
	fcmpes	%fcc2,	%f31,	%f6
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf0
	membar	#Sync
	movpos	%icc,	%o1,	%i0
	stx	%l0,	[%l7 + 0x70]
	flush	%l7 + 0x78
	bvs,a,pt	%icc,	loop_1373
	and	%g3,	0x069B,	%l5
	fmovrsgez	%l3,	%f22,	%f9
	subc	%i3,	%i6,	%g6
loop_1373:
	fcmpgt16	%f18,	%f26,	%o3
	edge16ln	%o2,	%o6,	%o4
	edge16n	%g2,	%g5,	%o7
	move	%xcc,	%i2,	%l4
	nop
	setx	loop_1374,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%o0,	0x0CAC,	%l1
	fbe	%fcc3,	loop_1375
	addccc	%i4,	0x19A8,	%g1
loop_1374:
	fcmple16	%f2,	%f4,	%i5
	movl	%xcc,	%l2,	%g4
loop_1375:
	fpack16	%f30,	%f30
	mulx	%g7,	0x011B,	%o5
	edge32ln	%l6,	%i1,	%i7
	fandnot2	%f8,	%f28,	%f10
	fmovsne	%icc,	%f6,	%f9
	addccc	%i0,	%l0,	%g3
	nop
	set	0x74, %l5
	lduh	[%l7 + %l5],	%o1
	and	%l5,	0x0803,	%i3
	array16	%l3,	%g6,	%o3
	edge16l	%i6,	%o6,	%o4
	addc	%o2,	0x0AE5,	%g2
	fmovdgu	%xcc,	%f13,	%f30
	movvs	%icc,	%o7,	%g5
	sdivx	%i2,	0x090A,	%l4
	stb	%l1,	[%l7 + 0x52]
	tle	%icc,	0x2
	fzeros	%f17
	tpos	%icc,	0x0
	movvc	%xcc,	%i4,	%g1
	fornot2s	%f13,	%f5,	%f31
	siam	0x1
	xor	%o0,	%l2,	%i5
	edge8	%g4,	%g7,	%l6
	fbl,a	%fcc0,	loop_1376
	tpos	%xcc,	0x7
	movrne	%i1,	0x262,	%i7
	stx	%i0,	[%l7 + 0x38]
loop_1376:
	ldsb	[%l7 + 0x2E],	%l0
	fmovsn	%xcc,	%f21,	%f23
	movgu	%icc,	%o5,	%g3
	tg	%icc,	0x6
	edge16	%o1,	%i3,	%l5
	xorcc	%g6,	0x07D8,	%l3
	xor	%i6,	%o3,	%o6
	brnz,a	%o4,	loop_1377
	fbue	%fcc3,	loop_1378
	movpos	%icc,	%o2,	%g2
	fcmpgt16	%f28,	%f24,	%o7
loop_1377:
	edge32	%i2,	%g5,	%l4
loop_1378:
	alignaddrl	%l1,	%i4,	%g1
	fandnot2	%f22,	%f4,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l2,	%i5
	array8	%g4,	%o0,	%g7
	movpos	%icc,	%l6,	%i7
	nop
	setx loop_1379, %l0, %l1
	jmpl %l1, %i0
	tcs	%xcc,	0x6
	fmovrdlez	%i1,	%f2,	%f8
	ble	loop_1380
loop_1379:
	bvc,a	%icc,	loop_1381
	fmul8ulx16	%f14,	%f10,	%f26
	nop
	setx loop_1382, %l0, %l1
	jmpl %l1, %l0
loop_1380:
	alignaddr	%g3,	%o1,	%i3
loop_1381:
	sdiv	%l5,	0x0B87,	%o5
	nop
	setx	loop_1383,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1382:
	nop
	set	0x7F, %i5
	ldub	[%l7 + %i5],	%l3
	fbuge	%fcc2,	loop_1384
	smul	%g6,	%i6,	%o6
loop_1383:
	fabss	%f12,	%f7
	fmovdn	%xcc,	%f4,	%f29
loop_1384:
	fmovsge	%icc,	%f29,	%f7
	tpos	%icc,	0x4
	movrlez	%o4,	%o2,	%o3
	subccc	%o7,	0x088B,	%g2
	ldd	[%l7 + 0x38],	%g4
	movle	%xcc,	%l4,	%l1
	prefetch	[%l7 + 0x74],	 0x1
	fones	%f12
	stb	%i2,	[%l7 + 0x18]
	edge16	%i4,	%l2,	%i5
	tneg	%icc,	0x2
	fmovsneg	%icc,	%f2,	%f4
	set	0x6F, %o5
	ldsba	[%l7 + %o5] 0x80,	%g4
	set	0x6E, %g3
	stha	%g1,	[%l7 + %g3] 0x15
	andcc	%o0,	0x0052,	%l6
	lduh	[%l7 + 0x74],	%i7
	movcs	%icc,	%g7,	%i0
	wr	%g0,	0x27,	%asi
	stxa	%i1,	[%l7 + 0x18] %asi
	membar	#Sync
	edge8n	%l0,	%g3,	%i3
	ble,pn	%icc,	loop_1385
	movcc	%xcc,	%l5,	%o5
	fbuge	%fcc0,	loop_1386
	fmovscs	%xcc,	%f1,	%f11
loop_1385:
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f4
	fbe,a	%fcc2,	loop_1387
loop_1386:
	subc	%o1,	%g6,	%l3
	orncc	%i6,	0x0FB8,	%o6
	sra	%o4,	%o2,	%o7
loop_1387:
	fpack32	%f4,	%f10,	%f20
	tvc	%icc,	0x1
	movgu	%icc,	%o3,	%g2
	ld	[%l7 + 0x3C],	%f4
	xor	%g5,	0x019E,	%l1
	orncc	%l4,	%i4,	%l2
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tg	%xcc,	0x5
	fpadd32	%f16,	%f22,	%f2
	fbug	%fcc2,	loop_1388
	fbuge	%fcc3,	loop_1389
	tge	%xcc,	0x4
	movrlz	%i5,	0x1F9,	%i2
loop_1388:
	add	%g1,	%o0,	%l6
loop_1389:
	bge	loop_1390
	ldstub	[%l7 + 0x60],	%g4
	fabsd	%f0,	%f4
	fxors	%f31,	%f0,	%f2
loop_1390:
	brgz	%g7,	loop_1391
	tneg	%xcc,	0x0
	movn	%icc,	%i0,	%i1
	ble,pn	%icc,	loop_1392
loop_1391:
	subcc	%l0,	0x1987,	%i7
	tgu	%icc,	0x0
	movre	%g3,	%i3,	%o5
loop_1392:
	sth	%o1,	[%l7 + 0x54]
	fmul8sux16	%f8,	%f30,	%f0
	ldd	[%l7 + 0x38],	%f12
	edge8n	%g6,	%l5,	%i6
	set	0x15, %g5
	stba	%l3,	[%l7 + %g5] 0x19
	movneg	%xcc,	%o6,	%o4
	edge32	%o7,	%o3,	%g2
	xnor	%g5,	0x17FB,	%l1
	addcc	%o2,	%i4,	%l2
	movrgez	%l4,	0x330,	%i5
	movrne	%i2,	0x0BE,	%o0
	brlez	%g1,	loop_1393
	fmovscs	%xcc,	%f17,	%f7
	tn	%xcc,	0x7
	sth	%l6,	[%l7 + 0x7C]
loop_1393:
	movrlz	%g4,	%i0,	%g7
	tge	%icc,	0x3
	fmovrdgz	%l0,	%f26,	%f18
	set	0x6A, %g2
	ldsha	[%l7 + %g2] 0x88,	%i1
	stb	%i7,	[%l7 + 0x1F]
	xor	%g3,	%i3,	%o1
	edge16	%g6,	%o5,	%l5
	stx	%l3,	[%l7 + 0x78]
	alignaddr	%i6,	%o4,	%o7
	fmovrdlz	%o3,	%f28,	%f14
	nop
	set	0x68, %g4
	ldsw	[%l7 + %g4],	%g2
	fmovsvc	%xcc,	%f24,	%f13
	mulscc	%o6,	0x13BE,	%g5
	brlez,a	%l1,	loop_1394
	fxnor	%f14,	%f10,	%f16
	fbl	%fcc2,	loop_1395
	addc	%o2,	0x0D55,	%l2
loop_1394:
	orncc	%i4,	0x1F70,	%i5
	fones	%f23
loop_1395:
	stbar
	andncc	%i2,	%o0,	%l4
	taddcc	%g1,	0x190A,	%g4
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x08] %asi,	%f17
	movpos	%icc,	%l6,	%i0
	xorcc	%l0,	%i1,	%i7
	umulcc	%g3,	%g7,	%i3
	movcc	%icc,	%o1,	%o5
	edge16n	%l5,	%l3,	%g6
	fmovdg	%icc,	%f3,	%f19
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%o4
	fba,a	%fcc0,	loop_1396
	sub	%o7,	0x08E6,	%i6
	tg	%icc,	0x4
	sra	%o3,	0x0B,	%g2
loop_1396:
	sdiv	%o6,	0x0B94,	%g5
	taddcctv	%o2,	%l2,	%i4
	movpos	%xcc,	%i5,	%i2
	sll	%o0,	0x15,	%l4
	be,a	loop_1397
	bshuffle	%f30,	%f10,	%f10
	set	0x0E, %o6
	ldsha	[%l7 + %o6] 0x11,	%g1
loop_1397:
	movvs	%xcc,	%l1,	%l6
	movrlz	%g4,	0x0AD,	%i0
	fmovdgu	%xcc,	%f21,	%f0
	edge32ln	%i1,	%i7,	%l0
	fblg	%fcc3,	loop_1398
	bvc,a	loop_1399
	bl,a,pt	%icc,	loop_1400
	subccc	%g3,	0x1F6C,	%i3
loop_1398:
	subcc	%g7,	0x0E01,	%o5
loop_1399:
	srlx	%l5,	0x12,	%o1
loop_1400:
	edge32ln	%g6,	%l3,	%o4
	set	0x50, %l2
	stha	%o7,	[%l7 + %l2] 0x11
	bl,a,pn	%icc,	loop_1401
	fbug,a	%fcc2,	loop_1402
	movvs	%xcc,	%o3,	%g2
	fbne	%fcc3,	loop_1403
loop_1401:
	srax	%o6,	%i6,	%g5
loop_1402:
	fzero	%f16
	fpsub16	%f8,	%f2,	%f24
loop_1403:
	mulx	%l2,	%i4,	%i5
	fmovsvs	%icc,	%f25,	%f27
	flush	%l7 + 0x38
	fmovdgu	%icc,	%f6,	%f17
	andn	%o2,	0x0847,	%i2
	nop
	set	0x70, %l3
	ldx	[%l7 + %l3],	%o0
	alignaddr	%l4,	%g1,	%l6
	edge16	%g4,	%l1,	%i0
	stx	%i1,	[%l7 + 0x60]
	edge8	%l0,	%i7,	%i3
	mova	%icc,	%g3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g7,	%l5
	fcmpne16	%f4,	%f8,	%g6
	tg	%xcc,	0x6
	edge16ln	%o1,	%o4,	%l3
	edge32l	%o7,	%g2,	%o6
	andn	%i6,	0x011C,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o3,	%i4,	%i5
	brz,a	%o2,	loop_1404
	movle	%icc,	%l2,	%o0
	bl,pt	%icc,	loop_1405
	tge	%xcc,	0x5
loop_1404:
	bshuffle	%f22,	%f16,	%f12
	movrne	%i2,	0x2F8,	%l4
loop_1405:
	movrgez	%g1,	%g4,	%l1
	sdivcc	%i0,	0x0972,	%i1
	tcc	%icc,	0x6
	edge8l	%l0,	%l6,	%i7
	bvs,a	loop_1406
	srax	%i3,	%g3,	%g7
	fabss	%f12,	%f18
	ldstub	[%l7 + 0x26],	%l5
loop_1406:
	orn	%o5,	0x0437,	%g6
	fmul8x16au	%f19,	%f15,	%f12
	fcmped	%fcc2,	%f16,	%f24
	tge	%xcc,	0x2
	andn	%o1,	%o4,	%o7
	mulx	%g2,	%o6,	%i6
	movvc	%xcc,	%g5,	%l3
	fone	%f26
	stbar
	lduh	[%l7 + 0x64],	%o3
	bge	%xcc,	loop_1407
	tsubcctv	%i4,	%i5,	%o2
	brlz	%l2,	loop_1408
	fmovdneg	%icc,	%f12,	%f4
loop_1407:
	bne,pn	%icc,	loop_1409
	tcs	%icc,	0x7
loop_1408:
	fones	%f14
	udivx	%i2,	0x12EF,	%l4
loop_1409:
	movn	%xcc,	%g1,	%g4
	sdiv	%l1,	0x0C2B,	%i0
	fbu,a	%fcc0,	loop_1410
	tvc	%icc,	0x3
	edge32	%i1,	%o0,	%l0
	fmovrde	%i7,	%f14,	%f18
loop_1410:
	umul	%i3,	0x10F1,	%l6
	fpadd32	%f18,	%f14,	%f30
	tsubcctv	%g7,	0x1A94,	%g3
	set	0x69, %o7
	lduba	[%l7 + %o7] 0x19,	%l5
	lduh	[%l7 + 0x6E],	%o5
	edge32n	%o1,	%g6,	%o7
	srl	%g2,	0x13,	%o6
	or	%o4,	%i6,	%l3
	edge8ln	%o3,	%i4,	%g5
	bshuffle	%f24,	%f26,	%f20
	bge	loop_1411
	fpsub32	%f8,	%f18,	%f18
	taddcctv	%i5,	%l2,	%o2
	fones	%f28
loop_1411:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i2,	0x15CC,	%g1
	movgu	%icc,	%g4,	%l1
	fmovrslz	%l4,	%f13,	%f10
	fcmple32	%f28,	%f22,	%i0
	tneg	%xcc,	0x1
	bpos,a	%icc,	loop_1412
	move	%icc,	%i1,	%o0
	fors	%f11,	%f26,	%f14
	lduw	[%l7 + 0x78],	%l0
loop_1412:
	fbn,a	%fcc0,	loop_1413
	fbe,a	%fcc1,	loop_1414
	fmovdvs	%icc,	%f3,	%f17
	be	loop_1415
loop_1413:
	umulcc	%i7,	0x1EF9,	%l6
loop_1414:
	add	%i3,	%g7,	%g3
	sra	%o5,	0x00,	%o1
loop_1415:
	nop
	set	0x08, %g6
	ldsw	[%l7 + %g6],	%g6
	movrne	%l5,	%g2,	%o7
	ba,a	%xcc,	loop_1416
	edge8	%o6,	%o4,	%i6
	nop
	setx	loop_1417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot1	%f30,	%f14
loop_1416:
	addcc	%o3,	%i4,	%g5
	fmovrsgz	%i5,	%f4,	%f9
loop_1417:
	edge8ln	%l3,	%o2,	%l2
	movrgez	%g1,	%g4,	%i2
	umulcc	%l1,	%i0,	%l4
	fbue,a	%fcc0,	loop_1418
	ldsw	[%l7 + 0x08],	%o0
	subc	%i1,	0x1965,	%l0
	nop
	setx	loop_1419,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1418:
	movvs	%icc,	%i7,	%i3
	fbo	%fcc3,	loop_1420
	movl	%xcc,	%g7,	%g3
loop_1419:
	fmovrdne	%o5,	%f18,	%f6
	smulcc	%l6,	%o1,	%g6
loop_1420:
	bg,pt	%xcc,	loop_1421
	tgu	%xcc,	0x5
	be,pt	%icc,	loop_1422
	sdivcc	%g2,	0x0B07,	%o7
loop_1421:
	sra	%o6,	0x1D,	%o4
	andcc	%i6,	0x1F03,	%l5
loop_1422:
	fmovscc	%icc,	%f12,	%f20
	andcc	%o3,	%i4,	%g5
	srlx	%i5,	0x01,	%l3
	umulcc	%l2,	0x153D,	%g1
	edge32ln	%g4,	%o2,	%l1
	sllx	%i0,	0x06,	%l4
	fmovsa	%xcc,	%f17,	%f18
	call	loop_1423
	sub	%o0,	%i1,	%l0
	movgu	%icc,	%i2,	%i3
	fones	%f27
loop_1423:
	edge32n	%i7,	%g3,	%o5
	tcs	%icc,	0x2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%l6
	mulx	%o1,	%g7,	%g2
	movleu	%xcc,	%o7,	%o6
	fbg,a	%fcc2,	loop_1424
	bpos	%icc,	loop_1425
	umul	%g6,	0x12A0,	%i6
	taddcc	%o4,	%l5,	%o3
loop_1424:
	nop
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0x0
loop_1425:
	addcc	%g5,	%l3,	%l2
	edge32l	%g1,	%i5,	%o2
	addcc	%l1,	%g4,	%i0
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o0,	[%g0 + 0x140] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	brlz,a	%i1,	loop_1426
	movne	%icc,	%l4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x4
loop_1426:
	fpsub16	%f8,	%f2,	%f18
	fornot2s	%f11,	%f27,	%f28
	movrgz	%i2,	0x0C7,	%i3
	sir	0x1AAB
	sdivx	%g3,	0x0CC9,	%i7
	tvc	%xcc,	0x7
	fabss	%f10,	%f31
	tn	%xcc,	0x5
	tl	%xcc,	0x1
	udivcc	%o5,	0x1F2F,	%o1
	mulscc	%l6,	0x1CA7,	%g7
	movl	%xcc,	%g2,	%o7
	tg	%icc,	0x3
	fsrc1	%f20,	%f18
	stw	%o6,	[%l7 + 0x50]
	tleu	%xcc,	0x2
	sra	%g6,	%i6,	%o4
	smul	%o3,	0x10C0,	%l5
	brnz	%i4,	loop_1427
	tneg	%icc,	0x4
	tleu	%icc,	0x2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g5,	%l3
loop_1427:
	fornot1s	%f12,	%f8,	%f30
	brgz	%l2,	loop_1428
	fbu	%fcc0,	loop_1429
	tcs	%icc,	0x7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i5,	%o2
loop_1428:
	sir	0x167D
loop_1429:
	udivcc	%l1,	0x09FF,	%g1
	sub	%g4,	%i0,	%o0
	brnz,a	%l4,	loop_1430
	fand	%f10,	%f26,	%f18
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x70] %asi
loop_1430:
	tpos	%icc,	0x5
	fmovrdgz	%i2,	%f12,	%f2
	fba	%fcc2,	loop_1431
	movge	%xcc,	%i3,	%l0
	stbar
	array16	%i7,	%o5,	%o1
loop_1431:
	faligndata	%f4,	%f2,	%f8
	ldd	[%l7 + 0x38],	%g2
	array8	%g7,	%l6,	%o7
	fcmpgt16	%f4,	%f16,	%g2
	addccc	%o6,	0x060F,	%g6
	movleu	%xcc,	%o4,	%i6
	edge16	%o3,	%l5,	%i4
	edge32n	%g5,	%l3,	%l2
	movrlz	%i5,	%o2,	%g1
	fmovrse	%l1,	%f25,	%f11
	ld	[%l7 + 0x70],	%f5
	sdiv	%g4,	0x0364,	%i0
	set	0x60, %o4
	sta	%f1,	[%l7 + %o4] 0x15
	sra	%l4,	0x19,	%i1
	set	0x54, %o3
	lduha	[%l7 + %o3] 0x88,	%o0
	fnor	%f26,	%f2,	%f20
	udiv	%i3,	0x083C,	%i2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	move	%icc,	%i7,	%o5
	subc	%l0,	%o1,	%g7
	add	%l6,	0x060D,	%g3
	tne	%icc,	0x1
	be,a,pn	%xcc,	loop_1432
	fbuge,a	%fcc2,	loop_1433
	st	%f9,	[%l7 + 0x2C]
	fbug	%fcc3,	loop_1434
loop_1432:
	edge16ln	%g2,	%o6,	%o7
loop_1433:
	fble,a	%fcc2,	loop_1435
	tle	%xcc,	0x0
loop_1434:
	srl	%g6,	0x16,	%i6
	ldub	[%l7 + 0x37],	%o3
loop_1435:
	fnot2	%f16,	%f6
	fmovsvc	%icc,	%f5,	%f11
	be,pn	%xcc,	loop_1436
	udiv	%l5,	0x113E,	%o4
	tneg	%xcc,	0x7
	orn	%g5,	%i4,	%l3
loop_1436:
	addc	%l2,	%o2,	%g1
	fnot2	%f24,	%f30
	mova	%xcc,	%l1,	%i5
	edge32	%i0,	%g4,	%i1
	set	0x78, %o1
	stxa	%l4,	[%l7 + %o1] 0x0c
	movn	%xcc,	%i3,	%o0
	xnorcc	%i2,	%i7,	%o5
	movneg	%xcc,	%l0,	%o1
	fbo	%fcc0,	loop_1437
	tcc	%xcc,	0x1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x23] %asi,	%l6
loop_1437:
	movg	%xcc,	%g7,	%g2
	taddcc	%g3,	0x03C4,	%o6
	fmovscs	%icc,	%f1,	%f23
	movrne	%g6,	0x3F1,	%i6
	fbl,a	%fcc1,	loop_1438
	mulscc	%o3,	%o7,	%l5
	fbug,a	%fcc3,	loop_1439
	sir	0x15B1
loop_1438:
	edge16n	%g5,	%o4,	%l3
	fbge,a	%fcc1,	loop_1440
loop_1439:
	taddcctv	%l2,	%i4,	%o2
	umul	%l1,	0x1076,	%i5
	bcs,a	%xcc,	loop_1441
loop_1440:
	subcc	%i0,	%g4,	%g1
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x26] %asi,	%l4
loop_1441:
	fmovdgu	%xcc,	%f5,	%f4
	movpos	%icc,	%i3,	%o0
	movgu	%xcc,	%i1,	%i7
	fpadd32s	%f24,	%f21,	%f27
	fmovrdgz	%i2,	%f18,	%f28
	fbuge	%fcc3,	loop_1442
	fmovde	%icc,	%f23,	%f24
	fmovd	%f28,	%f2
	fpsub16	%f6,	%f18,	%f12
loop_1442:
	movrgez	%o5,	%o1,	%l0
	tl	%xcc,	0x6
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%l6
	edge32ln	%g2,	%g3,	%o6
	movleu	%icc,	%g6,	%g7
	fpadd32	%f4,	%f2,	%f10
	movne	%icc,	%o3,	%o7
	tcc	%xcc,	0x2
	bneg	%icc,	loop_1443
	orn	%i6,	0x1950,	%l5
	move	%xcc,	%o4,	%l3
	xnor	%l2,	%g5,	%o2
loop_1443:
	movcs	%xcc,	%l1,	%i4
	bleu,a	loop_1444
	ldsb	[%l7 + 0x12],	%i5
	xor	%i0,	0x135A,	%g1
	fornot2s	%f29,	%f25,	%f16
loop_1444:
	alignaddr	%g4,	%l4,	%i3
	xnor	%i1,	0x02CE,	%i7
	set	0x30, %l0
	lda	[%l7 + %l0] 0x88,	%f1
	movneg	%xcc,	%o0,	%o5
	nop
	set	0x62, %i3
	ldstub	[%l7 + %i3],	%o1
	sdiv	%l0,	0x05B2,	%i2
	movn	%icc,	%g2,	%g3
	fors	%f26,	%f20,	%f31
	alignaddr	%o6,	%l6,	%g6
	te	%xcc,	0x2
	tvc	%xcc,	0x3
	fmovdcs	%icc,	%f29,	%f22
	sllx	%g7,	%o7,	%i6
	edge32ln	%o3,	%l5,	%o4
	brlz	%l2,	loop_1445
	sdivx	%l3,	0x1060,	%g5
	array8	%o2,	%i4,	%l1
	orncc	%i0,	%i5,	%g4
loop_1445:
	orcc	%l4,	0x0B4A,	%i3
	movleu	%icc,	%g1,	%i1
	edge8	%i7,	%o5,	%o0
	andcc	%l0,	%o1,	%g2
	fandnot2s	%f11,	%f8,	%f11
	orn	%g3,	0x15CB,	%o6
	fmul8x16	%f27,	%f22,	%f18
	fbuge	%fcc2,	loop_1446
	sth	%i2,	[%l7 + 0x70]
	or	%l6,	%g6,	%o7
	xor	%i6,	0x1924,	%o3
loop_1446:
	fmovsl	%xcc,	%f14,	%f22
	edge8ln	%g7,	%o4,	%l5
	tcs	%icc,	0x7
	umul	%l3,	0x096E,	%l2
	alignaddrl	%o2,	%i4,	%l1
	edge32l	%g5,	%i0,	%g4
	stb	%l4,	[%l7 + 0x43]
	addc	%i3,	%g1,	%i1
	movg	%icc,	%i5,	%i7
	movrne	%o5,	0x149,	%l0
	fbo,a	%fcc1,	loop_1447
	sdivcc	%o1,	0x1A3F,	%o0
	fmovrde	%g2,	%f6,	%f12
	nop
	set	0x78, %i6
	std	%f24,	[%l7 + %i6]
loop_1447:
	fnors	%f21,	%f22,	%f23
	srl	%o6,	%g3,	%l6
	sdivx	%i2,	0x1145,	%o7
	movg	%icc,	%i6,	%g6
	tn	%icc,	0x6
	fmovde	%icc,	%f13,	%f1
	fmovsne	%xcc,	%f28,	%f21
	sdivcc	%g7,	0x194B,	%o3
	siam	0x4
	udiv	%l5,	0x1962,	%o4
	fxors	%f30,	%f9,	%f16
	set	0x08, %i7
	stda	%l2,	[%l7 + %i7] 0x89
	edge16	%o2,	%l2,	%l1
	sdiv	%g5,	0x1EF0,	%i0
	subcc	%i4,	0x02D6,	%g4
	membar	0x59
	orncc	%l4,	0x0FD0,	%g1
	siam	0x1
	tg	%icc,	0x1
	fnand	%f8,	%f28,	%f26
	tpos	%xcc,	0x7
	andncc	%i3,	%i5,	%i7
	std	%f2,	[%l7 + 0x20]
	array32	%i1,	%o5,	%o1
	udivcc	%o0,	0x1574,	%g2
	sir	0x0B18
	movcs	%icc,	%o6,	%l0
	sllx	%g3,	0x0D,	%i2
	sub	%o7,	%i6,	%l6
	fnor	%f16,	%f18,	%f10
	orncc	%g6,	0x1EC9,	%g7
	addccc	%l5,	%o3,	%l3
	movcc	%icc,	%o2,	%o4
	st	%f11,	[%l7 + 0x78]
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l1
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%l2
	andncc	%i0,	%i4,	%g4
	faligndata	%f28,	%f22,	%f12
	movrgz	%l4,	0x3B7,	%g5
	fmovsneg	%icc,	%f6,	%f11
	andn	%i3,	0x164E,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc1,	loop_1448
	brlez,a	%i7,	loop_1449
	tg	%icc,	0x1
	fble,a	%fcc2,	loop_1450
loop_1448:
	prefetch	[%l7 + 0x30],	 0x1
loop_1449:
	xnorcc	%i1,	0x16D4,	%g1
	movgu	%icc,	%o1,	%o0
loop_1450:
	edge16n	%o5,	%o6,	%l0
	sub	%g2,	0x1E12,	%i2
	fpsub16s	%f0,	%f14,	%f18
	tge	%xcc,	0x6
	orn	%o7,	%g3,	%i6
	sir	0x1E45
	nop
	set	0x1C, %o2
	lduw	[%l7 + %o2],	%l6
	fmovrslez	%g6,	%f18,	%f31
	std	%f30,	[%l7 + 0x28]
	lduw	[%l7 + 0x3C],	%l5
	wr	%g0,	0x27,	%asi
	stba	%g7,	[%l7 + 0x41] %asi
	membar	#Sync
	fxors	%f17,	%f13,	%f23
	addccc	%l3,	0x13A8,	%o2
	fcmped	%fcc0,	%f20,	%f16
	st	%f5,	[%l7 + 0x48]
	fbn	%fcc2,	loop_1451
	udivcc	%o3,	0x1A22,	%l1
	addcc	%l2,	%o4,	%i4
	ldstub	[%l7 + 0x16],	%i0
loop_1451:
	for	%f28,	%f4,	%f2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%l4
	orcc	%g5,	0x1EC2,	%g4
	movvc	%xcc,	%i3,	%i5
	alignaddrl	%i1,	%g1,	%i7
	bge,a,pt	%icc,	loop_1452
	ldd	[%l7 + 0x48],	%o0
	fmovdpos	%xcc,	%f16,	%f1
	set	0x0C, %i1
	stha	%o1,	[%l7 + %i1] 0xea
	membar	#Sync
loop_1452:
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
	fmovda	%icc,	%f25,	%f10
	tgu	%icc,	0x6
	sir	0x043A
loop_1453:
	add	%o5,	%l0,	%o6
	swap	[%l7 + 0x54],	%i2
	tvc	%xcc,	0x0
	movneg	%icc,	%g2,	%g3
	sub	%i6,	0x1693,	%o7
	set	0x58, %i4
	lduwa	[%l7 + %i4] 0x88,	%g6
	edge32ln	%l5,	%l6,	%l3
	array16	%g7,	%o2,	%l1
	fbuge,a	%fcc1,	loop_1454
	srl	%o3,	0x05,	%l2
	tsubcc	%i4,	%o4,	%l4
	ble,pn	%icc,	loop_1455
loop_1454:
	fmul8x16al	%f31,	%f28,	%f6
	ba,pn	%xcc,	loop_1456
	addcc	%g5,	0x1F77,	%g4
loop_1455:
	be,a	%xcc,	loop_1457
	edge8ln	%i3,	%i5,	%i1
loop_1456:
	sdiv	%g1,	0x12CB,	%i7
	xnor	%i0,	0x08DA,	%o0
loop_1457:
	fmovdpos	%xcc,	%f2,	%f13
	movrlz	%o5,	0x015,	%o1
	xorcc	%l0,	0x1EB7,	%o6
	sth	%i2,	[%l7 + 0x14]
	fcmple32	%f4,	%f26,	%g2
	tcs	%xcc,	0x5
	xor	%g3,	%o7,	%i6
	fmovrdne	%g6,	%f20,	%f14
	nop
	setx	loop_1458,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%l5,	0x1E8,	%l3
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1458:
	fpadd16	%f10,	%f0,	%f16
	movge	%xcc,	%g7,	%l6
	sethi	0x0EA7,	%l1
	movle	%xcc,	%o2,	%o3
	fbug	%fcc2,	loop_1459
	fnand	%f4,	%f18,	%f20
	fbuge	%fcc0,	loop_1460
	fmul8ulx16	%f6,	%f8,	%f12
loop_1459:
	nop
	setx loop_1461, %l0, %l1
	jmpl %l1, %i4
	tne	%xcc,	0x4
loop_1460:
	array16	%o4,	%l4,	%l2
	nop
	set	0x10, %l4
	stw	%g5,	[%l7 + %l4]
loop_1461:
	nop
	set	0x50, %l6
	swapa	[%l7 + %l6] 0x10,	%i3
	edge8l	%g4,	%i1,	%i5
	movgu	%icc,	%g1,	%i7
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x18,	%o0
	andcc	%i0,	%o1,	%l0
	fnot2s	%f24,	%f18
	std	%f16,	[%l7 + 0x60]
	fmovsg	%xcc,	%f12,	%f8
	mulx	%o6,	0x1E13,	%i2
	flush	%l7 + 0x24
	edge32n	%g2,	%o5,	%g3
	movne	%xcc,	%o7,	%i6
	srl	%g6,	0x05,	%l5
	movrgz	%l3,	0x33A,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l1
	fmovsle	%icc,	%f29,	%f27
	bgu,a	%icc,	loop_1462
	fxnors	%f10,	%f15,	%f20
	or	%g7,	0x098B,	%o2
	fnands	%f17,	%f20,	%f2
loop_1462:
	fmul8sux16	%f22,	%f14,	%f22
	array8	%o3,	%i4,	%l4
	pdist	%f10,	%f6,	%f0
	ldd	[%l7 + 0x10],	%f18
	movleu	%icc,	%o4,	%g5
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldsh	[%l7 + 0x30],	%l2
	tcs	%icc,	0x7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x69] %asi,	%i3
	edge32n	%i1,	%g4,	%g1
	pdist	%f8,	%f22,	%f18
	edge16l	%i5,	%o0,	%i7
	fornot2s	%f30,	%f4,	%f21
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i0
	fmovdpos	%icc,	%f19,	%f20
	fmovdcs	%xcc,	%f16,	%f24
	udivx	%l0,	0x15B8,	%o6
	srlx	%o1,	0x09,	%g2
	sra	%o5,	0x09,	%g3
	umulcc	%i2,	%o7,	%i6
	bvc,a,pn	%icc,	loop_1463
	edge8n	%g6,	%l5,	%l3
	fpadd16	%f6,	%f20,	%f4
	tn	%icc,	0x7
loop_1463:
	smul	%l6,	0x0919,	%g7
	movpos	%icc,	%l1,	%o3
	ldsb	[%l7 + 0x3A],	%o2
	smul	%l4,	0x1D54,	%i4
	udiv	%o4,	0x1391,	%l2
	edge32n	%i3,	%g5,	%i1
	addc	%g1,	0x026F,	%g4
	umul	%o0,	0x1024,	%i7
	alignaddr	%i0,	%l0,	%o6
	fmuld8sux16	%f13,	%f2,	%f12
	addccc	%i5,	%o1,	%g2
	smulcc	%o5,	0x1DC9,	%g3
	tg	%xcc,	0x2
	and	%i2,	0x014E,	%i6
	membar	0x4C
	stb	%g6,	[%l7 + 0x40]
	movrlez	%o7,	0x3E7,	%l5
	orn	%l6,	%l3,	%l1
	nop
	setx	loop_1464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%g7,	0x0C00,	%o3
	fbuge	%fcc0,	loop_1465
	edge32ln	%o2,	%l4,	%i4
loop_1464:
	andncc	%o4,	%l2,	%g5
	ba,a,pt	%xcc,	loop_1466
loop_1465:
	sll	%i3,	0x1F,	%i1
	fbge	%fcc2,	loop_1467
	movpos	%xcc,	%g1,	%o0
loop_1466:
	fmovdn	%xcc,	%f12,	%f23
	taddcctv	%g4,	%i7,	%l0
loop_1467:
	sub	%o6,	0x0F96,	%i0
	bvs,a,pt	%icc,	loop_1468
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x00A6,	%o1
	umulcc	%i5,	%g2,	%g3
loop_1468:
	sllx	%i2,	0x17,	%i6
	tgu	%icc,	0x7
	edge16n	%o5,	%g6,	%o7
	andn	%l6,	%l3,	%l5
	fpadd32s	%f6,	%f30,	%f8
	sra	%g7,	0x07,	%o3
	edge8	%o2,	%l4,	%l1
	orncc	%o4,	0x1E1F,	%i4
	fand	%f14,	%f26,	%f8
	xnor	%g5,	0x1D20,	%i3
	fands	%f11,	%f20,	%f28
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l2
	lduw	[%l7 + 0x10],	%i1
	edge32n	%g1,	%g4,	%o0
	movl	%icc,	%i7,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i0,	0x0A43,	%o1
	xnor	%o6,	%g2,	%i5
	movpos	%xcc,	%i2,	%g3
	sra	%i6,	0x1E,	%o5
	fnot1s	%f12,	%f12
	movrgez	%g6,	0x18E,	%l6
	subcc	%l3,	0x032D,	%l5
	te	%icc,	0x5
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
	subc	%g7,	%o3,	%o2
	tgu	%icc,	0x4
	popc	0x0891,	%o7
loop_1469:
	sdivx	%l1,	0x1507,	%o4
	bgu,a	%xcc,	loop_1470
	bcs,pn	%icc,	loop_1471
	movneg	%xcc,	%i4,	%g5
	and	%i3,	%l4,	%i1
loop_1470:
	ldd	[%l7 + 0x48],	%f20
loop_1471:
	bvs,a,pn	%xcc,	loop_1472
	fmovdvs	%icc,	%f3,	%f24
	orncc	%g1,	0x1A70,	%g4
	brnz	%l2,	loop_1473
loop_1472:
	fmovrsgz	%o0,	%f6,	%f3
	taddcctv	%l0,	%i7,	%i0
	fpadd16	%f16,	%f30,	%f24
loop_1473:
	std	%o6,	[%l7 + 0x20]
	tg	%xcc,	0x5
	orncc	%g2,	%o1,	%i2
	fmovdg	%icc,	%f15,	%f1
	sll	%g3,	%i6,	%o5
	tl	%icc,	0x2
	xnorcc	%i5,	%l6,	%g6
	tne	%icc,	0x3
	fandnot1s	%f26,	%f3,	%f9
	tvc	%icc,	0x7
	subccc	%l3,	0x0163,	%g7
	bl,a	loop_1474
	fmovdpos	%xcc,	%f12,	%f8
	tvc	%icc,	0x4
	fmul8x16	%f20,	%f0,	%f4
loop_1474:
	edge8	%l5,	%o3,	%o7
	sth	%l1,	[%l7 + 0x46]
	array16	%o4,	%i4,	%g5
	nop
	setx	loop_1475,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x2
	fandnot2s	%f7,	%f17,	%f22
	fcmple32	%f18,	%f30,	%o2
loop_1475:
	fbug,a	%fcc0,	loop_1476
	ta	%xcc,	0x2
	sllx	%l4,	0x15,	%i1
	sir	0x1209
loop_1476:
	fpsub32s	%f24,	%f27,	%f21
	umul	%g1,	%g4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc0,	loop_1477
	array32	%l2,	%o0,	%l0
	movneg	%xcc,	%i0,	%o6
	srl	%i7,	0x03,	%g2
loop_1477:
	movge	%xcc,	%o1,	%i2
	xor	%g3,	0x13F0,	%i6
	bvc	%xcc,	loop_1478
	subccc	%i5,	%l6,	%g6
	bvc,a,pt	%xcc,	loop_1479
	sir	0x098A
loop_1478:
	fbue,a	%fcc2,	loop_1480
	tle	%xcc,	0x2
loop_1479:
	movrlez	%l3,	0x231,	%o5
	fxnors	%f6,	%f19,	%f23
loop_1480:
	mova	%icc,	%l5,	%g7
	std	%f8,	[%l7 + 0x78]
	bleu,pt	%xcc,	loop_1481
	edge32	%o3,	%o7,	%o4
	bne	loop_1482
	prefetch	[%l7 + 0x58],	 0x0
loop_1481:
	sra	%l1,	%g5,	%i4
	tl	%xcc,	0x6
loop_1482:
	lduh	[%l7 + 0x24],	%o2
	taddcc	%l4,	%i1,	%g4
	addccc	%i3,	%g1,	%l2
	fbe,a	%fcc0,	loop_1483
	edge16ln	%o0,	%i0,	%l0
	sllx	%i7,	0x11,	%g2
	te	%icc,	0x4
loop_1483:
	fcmpes	%fcc2,	%f10,	%f22
	fbug,a	%fcc1,	loop_1484
	fmovsle	%xcc,	%f15,	%f8
	fbe	%fcc1,	loop_1485
	umul	%o1,	0x0C0D,	%i2
loop_1484:
	fbg,a	%fcc2,	loop_1486
	alignaddr	%g3,	%o6,	%i5
loop_1485:
	sethi	0x1C5B,	%l6
	tvc	%xcc,	0x2
loop_1486:
	bgu,pn	%xcc,	loop_1487
	fbge,a	%fcc0,	loop_1488
	tvs	%icc,	0x1
	te	%icc,	0x5
loop_1487:
	sll	%i6,	%l3,	%o5
loop_1488:
	fxnors	%f23,	%f23,	%f24
	fmovsgu	%xcc,	%f0,	%f25
	edge16ln	%l5,	%g7,	%g6
	fcmpne16	%f20,	%f6,	%o3
	bne,a,pt	%xcc,	loop_1489
	movvs	%icc,	%o7,	%o4
	tsubcc	%l1,	%i4,	%o2
	ldx	[%l7 + 0x70],	%l4
loop_1489:
	smulcc	%g5,	%g4,	%i1
	movn	%xcc,	%i3,	%g1
	xnor	%l2,	0x19C3,	%i0
	ld	[%l7 + 0x10],	%f29
	add	%l0,	0x0738,	%i7
	orncc	%o0,	%g2,	%i2
	wr	%g0,	0x89,	%asi
	stxa	%o1,	[%l7 + 0x58] %asi
	fmovdn	%xcc,	%f8,	%f12
	tg	%icc,	0x5
	fble,a	%fcc0,	loop_1490
	edge16ln	%o6,	%g3,	%l6
	fxnor	%f10,	%f20,	%f14
	udivcc	%i6,	0x1EAF,	%i5
loop_1490:
	fmuld8sux16	%f26,	%f14,	%f14
	fbge,a	%fcc1,	loop_1491
	fbg,a	%fcc2,	loop_1492
	movvc	%icc,	%l3,	%l5
	fpack16	%f26,	%f28
loop_1491:
	tvs	%xcc,	0x2
loop_1492:
	tsubcctv	%o5,	%g6,	%g7
	fnor	%f8,	%f12,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,pt	%xcc,	loop_1493
	tvs	%xcc,	0x0
	call	loop_1494
	movrne	%o7,	%o4,	%l1
loop_1493:
	srl	%o3,	%o2,	%i4
	fmovd	%f4,	%f8
loop_1494:
	tsubcctv	%l4,	%g5,	%g4
	fmovdg	%xcc,	%f27,	%f19
	fmovs	%f17,	%f24
	stbar
	xnorcc	%i1,	0x1DB1,	%i3
	subcc	%g1,	0x1185,	%i0
	srax	%l2,	0x13,	%l0
	stw	%i7,	[%l7 + 0x24]
	subc	%o0,	%i2,	%o1
	te	%xcc,	0x2
	subc	%o6,	%g2,	%l6
	membar	0x28
	movgu	%icc,	%g3,	%i6
	movge	%icc,	%l3,	%l5
	edge32l	%o5,	%g6,	%g7
	bgu	loop_1495
	edge32	%i5,	%o7,	%o4
	umul	%o3,	0x1536,	%o2
	edge16ln	%l1,	%l4,	%i4
loop_1495:
	ldsh	[%l7 + 0x66],	%g4
	array32	%g5,	%i3,	%g1
	stb	%i1,	[%l7 + 0x1F]
	nop
	set	0x53, %g7
	ldub	[%l7 + %g7],	%l2
	sdivx	%l0,	0x0013,	%i7
	movg	%icc,	%o0,	%i2
	fnands	%f0,	%f16,	%f22
	add	%i0,	%o1,	%g2
	fxnors	%f10,	%f2,	%f18
	sllx	%l6,	%g3,	%o6
	xorcc	%i6,	0x06C5,	%l5
	set	0x7A, %i0
	lduba	[%l7 + %i0] 0x0c,	%o5
	edge8l	%g6,	%g7,	%i5
	fsrc2s	%f7,	%f12
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	lduw	[%l7 + 0x48],	%l3
	umul	%o4,	%o3,	%o2
	tgu	%xcc,	0x3
	xor	%l1,	%o7,	%i4
	srlx	%l4,	0x11,	%g4
	fmovdge	%xcc,	%f19,	%f18
	sth	%g5,	[%l7 + 0x44]
	brnz,a	%g1,	loop_1496
	movg	%icc,	%i1,	%i3
	xnorcc	%l2,	0x066B,	%i7
	fcmpne16	%f24,	%f10,	%l0
loop_1496:
	fcmple16	%f8,	%f0,	%i2
	std	%f14,	[%l7 + 0x30]
	lduw	[%l7 + 0x24],	%o0
	movneg	%icc,	%o1,	%i0
	fmovdl	%xcc,	%f13,	%f21
	mulx	%l6,	%g2,	%o6
	ba	%xcc,	loop_1497
	fmovscc	%icc,	%f12,	%f19
	edge32n	%i6,	%g3,	%l5
	tgu	%icc,	0x4
loop_1497:
	movpos	%icc,	%o5,	%g7
	bpos	loop_1498
	orncc	%i5,	0x1565,	%g6
	mova	%icc,	%o4,	%o3
	umul	%o2,	0x1EDA,	%l3
loop_1498:
	brlez	%l1,	loop_1499
	std	%f16,	[%l7 + 0x70]
	st	%f4,	[%l7 + 0x18]
	fornot1	%f2,	%f6,	%f20
loop_1499:
	edge32	%o7,	%i4,	%g4
	edge16n	%l4,	%g1,	%i1
	ldub	[%l7 + 0x15],	%i3
	sll	%g5,	%i7,	%l2
	tl	%xcc,	0x3
	bn,a,pt	%icc,	loop_1500
	movvc	%icc,	%l0,	%i2
	movn	%icc,	%o0,	%i0
	movn	%xcc,	%l6,	%g2
loop_1500:
	tsubcctv	%o1,	%o6,	%g3
	fbne	%fcc0,	loop_1501
	fnors	%f25,	%f12,	%f1
	lduh	[%l7 + 0x70],	%i6
	fandnot1	%f30,	%f26,	%f28
loop_1501:
	fcmps	%fcc2,	%f10,	%f22
	fmovsa	%icc,	%f24,	%f18
	stw	%o5,	[%l7 + 0x68]
	stbar
	stx	%l5,	[%l7 + 0x20]
	bvc,pn	%xcc,	loop_1502
	edge32n	%g7,	%i5,	%g6
	taddcc	%o3,	%o4,	%o2
	fmovse	%xcc,	%f19,	%f6
loop_1502:
	sdivx	%l1,	0x1498,	%l3
	brz,a	%i4,	loop_1503
	tle	%xcc,	0x5
	movge	%icc,	%g4,	%l4
	xor	%g1,	%i1,	%i3
loop_1503:
	fbo,a	%fcc2,	loop_1504
	alignaddrl	%g5,	%i7,	%o7
	andcc	%l2,	%i2,	%o0
	or	%i0,	0x0732,	%l6
loop_1504:
	fcmpeq32	%f6,	%f12,	%l0
	edge16l	%g2,	%o1,	%o6
	fbl,a	%fcc2,	loop_1505
	tsubcc	%g3,	0x049A,	%o5
	srl	%i6,	0x19,	%g7
	fmovrslz	%i5,	%f23,	%f19
loop_1505:
	edge32l	%l5,	%g6,	%o4
	or	%o2,	%l1,	%l3
	fmovrdgez	%i4,	%f20,	%f8
	xor	%g4,	0x1035,	%l4
	stbar
	alignaddrl	%g1,	%o3,	%i3
	udiv	%g5,	0x1D56,	%i1
	array16	%o7,	%l2,	%i7
	be,a,pn	%icc,	loop_1506
	srlx	%i2,	%i0,	%o0
	tne	%xcc,	0x3
	fcmple16	%f8,	%f28,	%l0
loop_1506:
	ble	loop_1507
	sir	0x1E04
	fmul8x16	%f14,	%f30,	%f16
	movrne	%g2,	0x3D9,	%o1
loop_1507:
	tvc	%icc,	0x6
	fpadd32	%f20,	%f30,	%f18
	bvc,pt	%icc,	loop_1508
	ldstub	[%l7 + 0x27],	%o6
	fmovrse	%g3,	%f16,	%f26
	edge32ln	%o5,	%i6,	%g7
loop_1508:
	edge8ln	%l6,	%i5,	%l5
	addc	%g6,	0x17D7,	%o2
	subc	%o4,	0x1397,	%l1
	bvc,pt	%icc,	loop_1509
	fbuge	%fcc3,	loop_1510
	popc	%i4,	%g4
	tsubcctv	%l3,	%l4,	%o3
loop_1509:
	sdiv	%i3,	0x1356,	%g5
loop_1510:
	and	%g1,	%o7,	%i1
	fpsub32	%f10,	%f4,	%f18
	edge32n	%l2,	%i7,	%i2
	ba	loop_1511
	fmovdge	%icc,	%f0,	%f27
	fmovdg	%icc,	%f27,	%f14
	fcmple16	%f16,	%f20,	%o0
loop_1511:
	edge32ln	%i0,	%l0,	%g2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x12] %asi,	%o1
	fornot1	%f10,	%f16,	%f30
	set	0x3C, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o6
	umul	%g3,	%i6,	%o5
	udivx	%l6,	0x155D,	%g7
	movn	%icc,	%l5,	%i5
	andcc	%o2,	%o4,	%l1
	fnegs	%f18,	%f16
	pdist	%f28,	%f22,	%f0
	fmovrde	%g6,	%f16,	%f4
	movn	%xcc,	%i4,	%g4
	fmovdn	%xcc,	%f12,	%f25
	add	%l4,	%l3,	%i3
	tge	%icc,	0x1
	fxor	%f24,	%f0,	%f16
	sll	%g5,	%g1,	%o3
	fandnot1	%f8,	%f24,	%f22
	fbug	%fcc1,	loop_1512
	mulx	%o7,	%l2,	%i1
	movleu	%xcc,	%i2,	%i7
	alignaddr	%o0,	%l0,	%g2
loop_1512:
	sir	0x0B20
	fmuld8sux16	%f12,	%f17,	%f0
	sdivx	%i0,	0x0A91,	%o6
	bshuffle	%f28,	%f24,	%f0
	sdivcc	%o1,	0x1EC1,	%i6
	sdivcc	%o5,	0x028E,	%g3
	movrlez	%l6,	0x297,	%l5
	fmuld8sux16	%f14,	%f17,	%f6
	stx	%i5,	[%l7 + 0x28]
	sdivx	%o2,	0x10D6,	%g7
	set	0x58, %l5
	lda	[%l7 + %l5] 0x04,	%f20
	sra	%o4,	0x13,	%l1
	addc	%g6,	0x145C,	%i4
	fpack16	%f16,	%f6
	mulscc	%l4,	0x1515,	%l3
	fmovsvs	%icc,	%f5,	%f0
	edge8n	%g4,	%i3,	%g1
	sethi	0x04A1,	%o3
	movg	%xcc,	%o7,	%g5
	fmuld8ulx16	%f18,	%f22,	%f14
	move	%xcc,	%l2,	%i2
	edge32l	%i7,	%o0,	%l0
	smul	%i1,	0x0206,	%i0
	sir	0x1277
	srax	%g2,	0x18,	%o1
	subccc	%i6,	0x1C9D,	%o6
	movneg	%icc,	%g3,	%o5
	fmovse	%xcc,	%f5,	%f3
	te	%xcc,	0x5
	fbge	%fcc2,	loop_1513
	movrgez	%l6,	0x0FF,	%i5
	tneg	%icc,	0x6
	orcc	%l5,	%o2,	%o4
loop_1513:
	ldx	[%l7 + 0x78],	%g7
	tne	%icc,	0x4
	umulcc	%g6,	0x05D3,	%l1
	mulx	%i4,	0x16E2,	%l3
	movle	%xcc,	%l4,	%i3
	swap	[%l7 + 0x20],	%g1
	nop
	setx	loop_1514,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x4
	movrgez	%g4,	%o7,	%o3
	tge	%icc,	0x3
loop_1514:
	tl	%icc,	0x2
	or	%l2,	%i2,	%g5
	fpack16	%f20,	%f3
	ta	%xcc,	0x2
	movcs	%icc,	%o0,	%i7
	brz,a	%l0,	loop_1515
	swap	[%l7 + 0x28],	%i0
	tn	%icc,	0x4
	movl	%icc,	%i1,	%g2
loop_1515:
	movrne	%o1,	%i6,	%o6
	fpsub32	%f20,	%f30,	%f6
	and	%g3,	0x1475,	%l6
	andn	%i5,	%o5,	%l5
	umul	%o4,	%g7,	%o2
	ld	[%l7 + 0x70],	%f22
	orn	%g6,	0x08E9,	%l1
	fmovsn	%icc,	%f8,	%f23
	taddcctv	%i4,	0x115C,	%l3
	fblg	%fcc1,	loop_1516
	fmovrsgez	%i3,	%f7,	%f2
	sir	0x1C67
	stx	%l4,	[%l7 + 0x10]
loop_1516:
	fzero	%f8
	subcc	%g4,	%g1,	%o7
	xnorcc	%o3,	%l2,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f27,	%f23
	fmovrslz	%i2,	%f17,	%f3
	movrlz	%o0,	0x0E6,	%l0
	umul	%i0,	0x0B21,	%i7
	membar	0x10
	bgu,a,pt	%icc,	loop_1517
	ble,a	loop_1518
	bn	loop_1519
	xnorcc	%i1,	0x0E04,	%o1
loop_1517:
	edge8	%i6,	%g2,	%g3
loop_1518:
	bvc,a	loop_1520
loop_1519:
	fbo	%fcc1,	loop_1521
	umulcc	%o6,	%i5,	%o5
	fnot1s	%f7,	%f13
loop_1520:
	fbge,a	%fcc3,	loop_1522
loop_1521:
	brgez,a	%l6,	loop_1523
	tgu	%xcc,	0x4
	tle	%icc,	0x1
loop_1522:
	bneg	%xcc,	loop_1524
loop_1523:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x0
	array16	%l5,	%g7,	%o2
loop_1524:
	movvs	%icc,	%o4,	%g6
	fpadd32	%f24,	%f22,	%f26
	fmovrdlz	%l1,	%f14,	%f28
	subcc	%l3,	0x1C27,	%i4
	fmovdcc	%xcc,	%f10,	%f20
	array32	%i3,	%g4,	%g1
	fmovdpos	%xcc,	%f19,	%f7
	tgu	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f10,	%f31
	membar	0x5F
	tpos	%icc,	0x4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5A] %asi,	%o7
	movrgez	%l4,	0x04F,	%o3
	wr	%g0,	0xe3,	%asi
	stba	%l2,	[%l7 + 0x69] %asi
	membar	#Sync
	tge	%xcc,	0x3
	fxnors	%f14,	%f11,	%f25
	set	0x50, %o5
	stda	%g4,	[%l7 + %o5] 0x81
	tl	%icc,	0x0
	movvs	%icc,	%i2,	%o0
	bshuffle	%f24,	%f4,	%f30
	bl	loop_1525
	fornot1	%f16,	%f6,	%f10
	fandnot1s	%f31,	%f28,	%f6
	xnor	%l0,	%i0,	%i7
loop_1525:
	andcc	%i1,	0x1A26,	%o1
	ldub	[%l7 + 0x68],	%g2
	movcc	%icc,	%g3,	%o6
	membar	0x05
	xnorcc	%i6,	0x128E,	%i5
	movrlez	%l6,	%l5,	%o5
	sethi	0x0F91,	%o2
	movl	%icc,	%g7,	%o4
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l1
	stbar
	movcc	%xcc,	%g6,	%i4
	nop
	set	0x58, %g3
	prefetch	[%l7 + %g3],	 0x3
	wr	%g0,	0x81,	%asi
	sta	%f11,	[%l7 + 0x3C] %asi
	fxnor	%f24,	%f18,	%f22
	subc	%i3,	%l3,	%g1
	bge	%xcc,	loop_1526
	fmovsa	%icc,	%f28,	%f19
	edge32ln	%o7,	%l4,	%o3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
loop_1526:
	tgu	%icc,	0x2
	fmovsg	%xcc,	%f6,	%f25
	sdivx	%g4,	0x16EA,	%i2
	edge8l	%g5,	%o0,	%l0
	tneg	%xcc,	0x6
	tsubcctv	%i7,	%i1,	%i0
	set	0x58, %g1
	lda	[%l7 + %g1] 0x10,	%f1
	smulcc	%g2,	0x02C4,	%g3
	nop
	set	0x7F, %i5
	ldstub	[%l7 + %i5],	%o1
	fandnot2	%f12,	%f24,	%f14
	and	%o6,	0x1A0D,	%i5
	tne	%icc,	0x4
	nop
	setx	loop_1527,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack32	%f6,	%f30,	%f2
	movleu	%xcc,	%l6,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1527:
	fbl,a	%fcc1,	loop_1528
	edge16l	%o5,	%i6,	%o2
	tpos	%icc,	0x4
	taddcc	%g7,	%l1,	%g6
loop_1528:
	bpos,pt	%icc,	loop_1529
	fbe	%fcc2,	loop_1530
	fbug	%fcc1,	loop_1531
	edge8l	%o4,	%i4,	%l3
loop_1529:
	tneg	%icc,	0x0
loop_1530:
	fbul,a	%fcc0,	loop_1532
loop_1531:
	fbuge	%fcc2,	loop_1533
	and	%i3,	%g1,	%l4
	fblg,a	%fcc0,	loop_1534
loop_1532:
	ldd	[%l7 + 0x50],	%o6
loop_1533:
	movle	%icc,	%o3,	%g4
	tvc	%xcc,	0x5
loop_1534:
	edge32l	%l2,	%i2,	%o0
	bvs,pt	%xcc,	loop_1535
	movre	%g5,	0x275,	%l0
	addccc	%i7,	0x01DE,	%i0
	orn	%g2,	0x1828,	%g3
loop_1535:
	fnot2	%f24,	%f6
	fbug	%fcc1,	loop_1536
	orcc	%o1,	0x1706,	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o6,	%l6
loop_1536:
	xnorcc	%i5,	0x118D,	%l5
	fmovdg	%xcc,	%f4,	%f17
	fnot2s	%f8,	%f26
	movn	%xcc,	%o5,	%o2
	fmovdneg	%xcc,	%f24,	%f21
	and	%i6,	%l1,	%g6
	tcc	%icc,	0x6
	fbo	%fcc3,	loop_1537
	tsubcctv	%o4,	%g7,	%i4
	fpsub16	%f12,	%f8,	%f2
	brnz,a	%i3,	loop_1538
loop_1537:
	movge	%icc,	%g1,	%l4
	fmovsge	%xcc,	%f23,	%f24
	fmovdvs	%xcc,	%f19,	%f17
loop_1538:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l3,	%o3,	%o7
	brgez	%l2,	loop_1539
	bcc,a	loop_1540
	orn	%g4,	%i2,	%g5
	xnorcc	%o0,	0x06A9,	%i7
loop_1539:
	movcc	%xcc,	%l0,	%i0
loop_1540:
	movrlez	%g3,	0x1DE,	%g2
	movrgz	%o1,	%i1,	%l6
	sdivx	%i5,	0x005F,	%l5
	fmovsgu	%xcc,	%f4,	%f8
	te	%icc,	0x6
	fexpand	%f25,	%f10
	fmovdvc	%icc,	%f6,	%f25
	andcc	%o5,	0x1A28,	%o6
	tleu	%xcc,	0x4
	bg,pn	%icc,	loop_1541
	smul	%o2,	0x0E37,	%l1
	movg	%xcc,	%i6,	%o4
	tpos	%icc,	0x2
loop_1541:
	nop
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tgu	%xcc,	0x7
	ld	[%l7 + 0x7C],	%f6
	edge8l	%g6,	%i4,	%g7
	tl	%xcc,	0x4
	fcmpeq32	%f4,	%f22,	%i3
	fbe	%fcc1,	loop_1542
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1543,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrsne	%g1,	%f0,	%f4
loop_1542:
	fmovs	%f4,	%f30
	fmul8x16al	%f15,	%f16,	%f20
loop_1543:
	taddcctv	%l4,	%o3,	%o7
	fornot2	%f28,	%f20,	%f18
	movn	%xcc,	%l2,	%l3
	move	%xcc,	%i2,	%g5
	brlz	%o0,	loop_1544
	te	%icc,	0x5
	andn	%i7,	0x1878,	%g4
	bpos	%icc,	loop_1545
loop_1544:
	fmovsl	%icc,	%f14,	%f10
	movrgez	%i0,	%l0,	%g2
	tge	%icc,	0x1
loop_1545:
	addccc	%o1,	%i1,	%l6
	taddcctv	%i5,	%l5,	%g3
	tg	%icc,	0x1
	mova	%icc,	%o5,	%o6
	tleu	%xcc,	0x7
	movrlz	%o2,	0x090,	%l1
	movcs	%icc,	%o4,	%g6
	subc	%i4,	0x1EA6,	%g7
	edge16l	%i3,	%i6,	%l4
	brlez	%g1,	loop_1546
	fand	%f12,	%f10,	%f2
	ld	[%l7 + 0x40],	%f16
	fmovsgu	%icc,	%f7,	%f0
loop_1546:
	mova	%xcc,	%o3,	%o7
	bne,a	loop_1547
	orncc	%l2,	0x0D3D,	%i2
	be	loop_1548
	srax	%g5,	0x0F,	%l3
loop_1547:
	movpos	%xcc,	%i7,	%o0
	fmovdne	%icc,	%f30,	%f27
loop_1548:
	fors	%f0,	%f14,	%f21
	edge8n	%i0,	%g4,	%g2
	mulx	%l0,	%o1,	%i1
	mova	%icc,	%l6,	%l5
	edge16ln	%i5,	%g3,	%o5
	fpsub32	%f4,	%f18,	%f2
	set	0x28, %g5
	lduwa	[%l7 + %g5] 0x04,	%o2
	fmovdgu	%xcc,	%f15,	%f14
	fnand	%f14,	%f22,	%f8
	movl	%icc,	%l1,	%o6
	tneg	%icc,	0x4
	std	%f2,	[%l7 + 0x78]
	fmovse	%icc,	%f10,	%f25
	srl	%o4,	0x14,	%i4
	srax	%g6,	%g7,	%i3
	fabss	%f6,	%f9
	edge32	%i6,	%l4,	%g1
	movn	%icc,	%o3,	%l2
	sir	0x1692
	std	%i2,	[%l7 + 0x50]
	fmovdleu	%xcc,	%f12,	%f4
	tpos	%icc,	0x1
	fcmpgt32	%f24,	%f22,	%g5
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x64] %asi,	%l3
	movleu	%icc,	%o7,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i7,	%g4
	bpos,pn	%xcc,	loop_1549
	addccc	%i0,	0x1779,	%g2
	fxors	%f7,	%f8,	%f8
	ta	%xcc,	0x2
loop_1549:
	fmovdge	%xcc,	%f31,	%f22
	umulcc	%l0,	%o1,	%l6
	fcmpd	%fcc0,	%f10,	%f2
	sir	0x1BBD
	alignaddrl	%l5,	%i5,	%g3
	add	%o5,	0x1929,	%i1
	umulcc	%l1,	0x0D89,	%o6
	fmuld8ulx16	%f13,	%f15,	%f16
	bgu	%icc,	loop_1550
	tvs	%xcc,	0x0
	set	0x40, %g2
	ldswa	[%l7 + %g2] 0x18,	%o4
loop_1550:
	tvc	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o2,	0x03,	%i4
	sub	%g6,	%i3,	%i6
	sdiv	%g7,	0x0A45,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g1,	%l2,	%o3
	smulcc	%g5,	%i2,	%o7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%o0
	bge,a	loop_1551
	addccc	%l3,	0x1F39,	%i7
	tsubcctv	%g4,	%i0,	%g2
	lduh	[%l7 + 0x76],	%l0
loop_1551:
	fmovsleu	%icc,	%f0,	%f15
	fxnor	%f16,	%f22,	%f4
	subccc	%o1,	%l6,	%l5
	fone	%f18
	edge8ln	%g3,	%i5,	%o5
	movre	%i1,	0x057,	%o6
	movneg	%xcc,	%l1,	%o2
	edge8l	%o4,	%i4,	%g6
	fors	%f14,	%f31,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i6,	%i3,	%l4
	movrne	%g7,	0x3AE,	%g1
	alignaddrl	%l2,	%g5,	%i2
	sethi	0x06FE,	%o3
	fmovsvc	%icc,	%f24,	%f6
	movgu	%icc,	%o7,	%o0
	umul	%i7,	%g4,	%l3
	mulx	%g2,	%i0,	%o1
	ldsb	[%l7 + 0x28],	%l6
	udivx	%l5,	0x1F7D,	%l0
	tcs	%icc,	0x6
	set	0x0A, %o6
	lduha	[%l7 + %o6] 0x0c,	%i5
	fbuge	%fcc3,	loop_1552
	tg	%icc,	0x1
	movneg	%icc,	%g3,	%i1
	fnor	%f18,	%f6,	%f16
loop_1552:
	sdiv	%o5,	0x19D8,	%l1
	fmovrdlz	%o2,	%f2,	%f8
	tleu	%xcc,	0x4
	movge	%icc,	%o6,	%i4
	fmovrsgz	%g6,	%f21,	%f13
	stw	%i6,	[%l7 + 0x40]
	fbu	%fcc3,	loop_1553
	tpos	%xcc,	0x5
	bne,pt	%xcc,	loop_1554
	sdivcc	%i3,	0x195F,	%l4
loop_1553:
	tne	%xcc,	0x5
	tleu	%icc,	0x3
loop_1554:
	orncc	%o4,	%g1,	%l2
	edge32ln	%g5,	%i2,	%g7
	edge8ln	%o7,	%o3,	%i7
	subc	%g4,	0x117F,	%l3
	te	%xcc,	0x5
	fmovrse	%o0,	%f16,	%f18
	movl	%xcc,	%g2,	%i0
	bshuffle	%f8,	%f26,	%f28
	bcc,a,pt	%xcc,	loop_1555
	sll	%o1,	%l5,	%l6
	movcs	%icc,	%l0,	%g3
	bn	%xcc,	loop_1556
loop_1555:
	tg	%icc,	0x3
	edge8n	%i1,	%i5,	%o5
	fmovdle	%xcc,	%f15,	%f7
loop_1556:
	fba,a	%fcc3,	loop_1557
	tne	%icc,	0x0
	fmovsneg	%xcc,	%f23,	%f14
	fxor	%f28,	%f14,	%f14
loop_1557:
	edge8ln	%l1,	%o2,	%o6
	fmovrdlez	%g6,	%f8,	%f22
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%i6
	movcs	%icc,	%i3,	%l4
	nop
	setx	loop_1558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2s	%f10,	%f7,	%f15
	or	%i4,	%g1,	%l2
	fcmpeq32	%f28,	%f18,	%o4
loop_1558:
	sir	0x03E5
	tcs	%icc,	0x1
	bvs	%icc,	loop_1559
	fmul8x16au	%f15,	%f11,	%f4
	udiv	%i2,	0x0F15,	%g5
	bpos,a	loop_1560
loop_1559:
	tvc	%icc,	0x0
	fmovdcs	%xcc,	%f20,	%f23
	subcc	%o7,	%g7,	%i7
loop_1560:
	smul	%o3,	%l3,	%o0
	tge	%icc,	0x3
	alignaddr	%g2,	%g4,	%i0
	mova	%xcc,	%o1,	%l6
	array8	%l0,	%g3,	%i1
	siam	0x0
	sra	%l5,	%i5,	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o2,	%o6
	subcc	%g6,	%i6,	%l1
	ld	[%l7 + 0x08],	%f1
	fcmped	%fcc2,	%f0,	%f6
	fcmps	%fcc2,	%f5,	%f16
	xnor	%i3,	%l4,	%g1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i4
	add	%l2,	%i2,	%o4
	lduh	[%l7 + 0x7A],	%g5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x04
	set	0x0, %l3
	stxa	%g7,	[%g0 + %l3] 0x57
	movrgz	%i7,	0x356,	%o3
	movvs	%xcc,	%o7,	%l3
	udiv	%g2,	0x0B31,	%o0
	brlez	%g4,	loop_1561
	fpack32	%f18,	%f8,	%f6
	edge8	%i0,	%l6,	%l0
	alignaddrl	%o1,	%i1,	%g3
loop_1561:
	xorcc	%i5,	%o5,	%o2
	orncc	%l5,	%g6,	%o6
	movrgz	%l1,	0x050,	%i6
	tneg	%xcc,	0x4
	movrgz	%i3,	%l4,	%g1
	xnor	%l2,	0x0FF0,	%i2
	andcc	%i4,	0x1A98,	%o4
	movvs	%xcc,	%g5,	%i7
	set	0x6C, %l2
	stwa	%g7,	[%l7 + %l2] 0x22
	membar	#Sync
	movne	%icc,	%o3,	%l3
	movge	%icc,	%g2,	%o0
	addcc	%o7,	%g4,	%l6
	array16	%l0,	%i0,	%i1
	mulscc	%g3,	0x1266,	%i5
	ble,a	loop_1562
	fmovrsne	%o5,	%f0,	%f19
	tn	%xcc,	0x5
	fnegs	%f17,	%f22
loop_1562:
	alignaddrl	%o1,	%l5,	%o2
	set	0x58, %o7
	ldxa	[%l7 + %o7] 0x10,	%g6
	sdivx	%o6,	0x0C37,	%i6
	srax	%i3,	%l1,	%g1
	umulcc	%l2,	0x1973,	%i2
	fxnors	%f23,	%f24,	%f6
	mulscc	%i4,	%l4,	%g5
	bvc,pt	%icc,	loop_1563
	umul	%o4,	%g7,	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l3
loop_1563:
	fnor	%f12,	%f2,	%f20
	movg	%icc,	%o0,	%g2
	ldd	[%l7 + 0x68],	%f30
	movgu	%xcc,	%o7,	%g4
	movvc	%xcc,	%l6,	%l0
	orcc	%i1,	%i0,	%i5
	xnorcc	%o5,	0x0F0F,	%g3
	sll	%o1,	0x12,	%l5
	subc	%o2,	%o6,	%g6
	movrne	%i3,	%l1,	%g1
	orcc	%i6,	0x1E1D,	%l2
	umul	%i4,	0x159E,	%i2
	set	0x14, %i2
	lduba	[%l7 + %i2] 0x14,	%g5
	brgz	%o4,	loop_1564
	sub	%l4,	%o3,	%g7
	tg	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x46] %asi,	%i7
loop_1564:
	fbg	%fcc3,	loop_1565
	ldub	[%l7 + 0x28],	%o0
	addc	%l3,	%o7,	%g4
	wr	%g0,	0x89,	%asi
	stba	%l6,	[%l7 + 0x1E] %asi
loop_1565:
	movcs	%xcc,	%g2,	%i1
	fnors	%f10,	%f15,	%f12
	xor	%i0,	0x10BB,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l0,	%o5
	subccc	%g3,	%o1,	%l5
	movn	%icc,	%o6,	%o2
	nop
	set	0x14, %o4
	sth	%g6,	[%l7 + %o4]
	sdivx	%i3,	0x178C,	%g1
	fandnot1s	%f20,	%f24,	%f8
	subc	%l1,	%i6,	%i4
	membar	0x37
	movrgz	%l2,	%i2,	%g5
	fbge	%fcc2,	loop_1566
	edge8ln	%o4,	%o3,	%g7
	tle	%icc,	0x2
	orn	%i7,	%o0,	%l3
loop_1566:
	fmovsge	%icc,	%f3,	%f1
	add	%l4,	0x0E46,	%g4
	fmovrse	%l6,	%f8,	%f21
	fsrc2	%f16,	%f14
	or	%o7,	0x099D,	%i1
	udiv	%g2,	0x148C,	%i0
	edge16	%i5,	%l0,	%o5
	tg	%icc,	0x2
	movn	%xcc,	%o1,	%l5
	tvc	%xcc,	0x3
	alignaddrl	%g3,	%o6,	%g6
	sdivcc	%i3,	0x0801,	%o2
	movn	%xcc,	%l1,	%i6
	movcc	%xcc,	%g1,	%i4
	fbn	%fcc3,	loop_1567
	umul	%l2,	%i2,	%g5
	popc	%o3,	%o4
	udiv	%g7,	0x1DE5,	%o0
loop_1567:
	stx	%i7,	[%l7 + 0x38]
	movl	%icc,	%l4,	%g4
	sdivcc	%l6,	0x19A9,	%o7
	fabsd	%f10,	%f28
	tpos	%xcc,	0x6
	sdiv	%l3,	0x0E61,	%g2
	bvs	loop_1568
	bne	%xcc,	loop_1569
	array16	%i0,	%i1,	%i5
	fblg	%fcc1,	loop_1570
loop_1568:
	fba	%fcc2,	loop_1571
loop_1569:
	tcs	%icc,	0x6
	membar	0x36
loop_1570:
	fsrc2	%f20,	%f24
loop_1571:
	std	%f0,	[%l7 + 0x68]
	movrlez	%o5,	0x3DB,	%l0
	fmovda	%icc,	%f18,	%f7
	taddcctv	%l5,	0x0B86,	%o1
	sir	0x1824
	edge8n	%g3,	%o6,	%g6
	fnand	%f26,	%f24,	%f8
	bge,a,pn	%icc,	loop_1572
	movl	%xcc,	%i3,	%l1
	tl	%xcc,	0x2
	popc	0x07CA,	%i6
loop_1572:
	tn	%icc,	0x7
	movrne	%g1,	0x1C2,	%i4
	udivcc	%l2,	0x1803,	%o2
	bvc,a,pt	%xcc,	loop_1573
	bcc,pt	%xcc,	loop_1574
	edge8	%i2,	%o3,	%g5
	bvc	%icc,	loop_1575
loop_1573:
	fcmpgt16	%f18,	%f12,	%o4
loop_1574:
	bcc,a,pt	%icc,	loop_1576
	smul	%o0,	0x0011,	%i7
loop_1575:
	fmovsg	%icc,	%f8,	%f9
	fsrc1s	%f31,	%f22
loop_1576:
	xnorcc	%g7,	0x0423,	%l4
	ldsh	[%l7 + 0x6E],	%g4
	fmovdneg	%xcc,	%f21,	%f3
	movge	%icc,	%o7,	%l3
	movn	%xcc,	%l6,	%i0
	movg	%xcc,	%g2,	%i5
	fba,a	%fcc1,	loop_1577
	tle	%icc,	0x7
	fmovrsne	%o5,	%f18,	%f0
	tsubcc	%i1,	0x0B0D,	%l5
loop_1577:
	sdivcc	%o1,	0x168A,	%g3
	tsubcc	%o6,	0x0B3B,	%l0
	tne	%icc,	0x1
	fmovdneg	%icc,	%f14,	%f14
	tcs	%xcc,	0x7
	bvc,a	loop_1578
	movcc	%xcc,	%g6,	%i3
	ldsw	[%l7 + 0x28],	%i6
	addcc	%g1,	%l1,	%l2
loop_1578:
	umul	%i4,	%o2,	%o3
	movvs	%xcc,	%g5,	%i2
	tl	%xcc,	0x4
	tle	%xcc,	0x0
	fcmpes	%fcc1,	%f26,	%f28
	xnor	%o0,	%o4,	%g7
	and	%l4,	0x191C,	%i7
	fabsd	%f0,	%f2
	ba,a	loop_1579
	ble	%icc,	loop_1580
	sdiv	%o7,	0x0E19,	%g4
	alignaddr	%l6,	%i0,	%g2
loop_1579:
	movrgz	%i5,	%l3,	%o5
loop_1580:
	faligndata	%f20,	%f8,	%f6
	sub	%i1,	%o1,	%g3
	movn	%icc,	%l5,	%l0
	andcc	%o6,	%g6,	%i3
	orncc	%i6,	%g1,	%l2
	edge32n	%l1,	%i4,	%o2
	addcc	%o3,	%g5,	%i2
	stx	%o4,	[%l7 + 0x30]
	tvc	%xcc,	0x6
	nop
	set	0x54, %g6
	ldsh	[%l7 + %g6],	%o0
	fcmped	%fcc0,	%f20,	%f22
	fornot1	%f10,	%f14,	%f16
	edge16n	%l4,	%g7,	%i7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%g4
	tn	%icc,	0x2
	movgu	%xcc,	%l6,	%i0
	fsrc2	%f24,	%f26
	andcc	%o7,	%i5,	%g2
	wr	%g0,	0x10,	%asi
	sta	%f13,	[%l7 + 0x3C] %asi
	orncc	%o5,	0x067B,	%l3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x15] %asi,	%i1
	set	0x46, %o3
	ldsha	[%l7 + %o3] 0x14,	%g3
	tsubcctv	%o1,	%l5,	%o6
	fbge	%fcc0,	loop_1581
	movrlz	%g6,	%l0,	%i3
	tge	%xcc,	0x7
	bneg,pn	%icc,	loop_1582
loop_1581:
	movne	%xcc,	%i6,	%l2
	udivx	%g1,	0x0B14,	%i4
	ldd	[%l7 + 0x68],	%f30
loop_1582:
	or	%o2,	%l1,	%g5
	sir	0x142E
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	fnot2s	%f27,	%f3
	tn	%xcc,	0x0
	movn	%icc,	%o3,	%o4
	tn	%icc,	0x2
	sethi	0x0F8B,	%l4
	fcmpne32	%f14,	%f20,	%o0
	ld	[%l7 + 0x34],	%f26
	movcs	%xcc,	%i7,	%g4
	tneg	%icc,	0x4
	sra	%g7,	%l6,	%o7
	mulscc	%i5,	%g2,	%o5
	bleu	%xcc,	loop_1583
	array16	%i0,	%l3,	%i1
	tneg	%icc,	0x0
	ldub	[%l7 + 0x6A],	%o1
loop_1583:
	add	%g3,	0x16A8,	%l5
	tcs	%icc,	0x2
	andn	%o6,	0x0BFC,	%g6
	movrne	%i3,	0x24D,	%l0
	movneg	%xcc,	%l2,	%i6
	fornot2s	%f13,	%f5,	%f14
	fba,a	%fcc0,	loop_1584
	tle	%xcc,	0x4
	alignaddrl	%i4,	%o2,	%l1
	brgz,a	%g5,	loop_1585
loop_1584:
	andcc	%g1,	%i2,	%o4
	umulcc	%l4,	0x1977,	%o0
	tleu	%xcc,	0x2
loop_1585:
	sra	%o3,	%g4,	%i7
	movle	%icc,	%l6,	%o7
	fmovrslez	%g7,	%f9,	%f0
	tne	%icc,	0x0
	bg,a,pt	%icc,	loop_1586
	orncc	%i5,	0x08BB,	%o5
	tvs	%xcc,	0x7
	movvs	%xcc,	%g2,	%i0
loop_1586:
	fnot1	%f12,	%f10
	orcc	%i1,	0x1402,	%o1
	bleu,pn	%icc,	loop_1587
	tle	%xcc,	0x2
	sdiv	%l3,	0x1869,	%l5
	fbl	%fcc3,	loop_1588
loop_1587:
	movcs	%icc,	%g3,	%g6
	edge8ln	%o6,	%l0,	%l2
	movle	%icc,	%i6,	%i3
loop_1588:
	array16	%o2,	%i4,	%g5
	movn	%icc,	%l1,	%i2
	sll	%o4,	0x0B,	%g1
	fsrc1s	%f4,	%f7
	fcmpd	%fcc0,	%f10,	%f2
	brlez,a	%o0,	loop_1589
	move	%xcc,	%l4,	%g4
	fmovsvc	%icc,	%f11,	%f19
	xorcc	%o3,	%l6,	%o7
loop_1589:
	swap	[%l7 + 0x44],	%i7
	nop
	setx	loop_1590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%i5,	%g7,	%g2
	movleu	%xcc,	%i0,	%o5
	taddcc	%i1,	0x03B3,	%l3
loop_1590:
	sra	%l5,	0x1D,	%o1
	fcmple32	%f12,	%f0,	%g3
	tsubcctv	%g6,	0x11C1,	%l0
	tg	%xcc,	0x1
	call	loop_1591
	tg	%icc,	0x3
	movvc	%icc,	%o6,	%i6
	movcs	%icc,	%l2,	%i3
loop_1591:
	fmovda	%xcc,	%f17,	%f4
	fbge	%fcc1,	loop_1592
	fmovdcs	%icc,	%f8,	%f16
	mulscc	%i4,	0x13D6,	%o2
	tvc	%icc,	0x3
loop_1592:
	movrlz	%g5,	%l1,	%i2
	fnands	%f24,	%f17,	%f9
	fpsub32s	%f16,	%f23,	%f4
	fcmpne32	%f26,	%f18,	%o4
	fmovdl	%xcc,	%f0,	%f16
	wr	%g0,	0x89,	%asi
	stba	%g1,	[%l7 + 0x6F] %asi
	movrgz	%o0,	0x0E6,	%g4
	stbar
	add	%l4,	0x0139,	%l6
	xnor	%o3,	%i7,	%o7
	xnorcc	%g7,	%i5,	%i0
	st	%f3,	[%l7 + 0x2C]
	sdiv	%g2,	0x0320,	%i1
	fnand	%f24,	%f0,	%f20
	smulcc	%l3,	0x0823,	%l5
	or	%o5,	0x1F3C,	%o1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x54] %asi,	%f3
	srl	%g6,	%l0,	%g3
	add	%o6,	0x1DB5,	%i6
	tvs	%icc,	0x1
	fcmpeq32	%f22,	%f16,	%i3
	fones	%f8
	fcmpes	%fcc1,	%f31,	%f9
	fmovscs	%xcc,	%f29,	%f27
	addc	%l2,	0x0094,	%o2
	tle	%icc,	0x4
	fmovdge	%icc,	%f25,	%f21
	movrlz	%i4,	0x216,	%g5
	fones	%f26
	bneg,a,pt	%icc,	loop_1593
	tsubcc	%l1,	0x0E9D,	%o4
	tsubcc	%i2,	%o0,	%g4
	movvs	%icc,	%l4,	%l6
loop_1593:
	nop
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x27,	%o2
	mulx	%g1,	0x10DF,	%i7
	fbge	%fcc0,	loop_1594
	fpsub16s	%f31,	%f8,	%f6
	subcc	%g7,	%o7,	%i0
	bneg,a	%icc,	loop_1595
loop_1594:
	tg	%xcc,	0x0
	subccc	%g2,	%i1,	%l3
	movg	%xcc,	%l5,	%o5
loop_1595:
	orcc	%i5,	0x10B9,	%g6
	fmovda	%icc,	%f27,	%f14
	bn,a	loop_1596
	movn	%xcc,	%o1,	%l0
	for	%f24,	%f24,	%f18
	fpsub16	%f30,	%f16,	%f24
loop_1596:
	te	%xcc,	0x4
	fmovdge	%xcc,	%f22,	%f22
	fmuld8ulx16	%f16,	%f23,	%f16
	edge32ln	%o6,	%g3,	%i6
	xorcc	%i3,	0x1F18,	%o2
	umulcc	%i4,	0x08EB,	%l2
	fpsub32	%f30,	%f28,	%f30
	set	0x4C, %i3
	stha	%g5,	[%l7 + %i3] 0x11
	sdiv	%l1,	0x1D20,	%i2
	brz	%o0,	loop_1597
	edge16ln	%o4,	%l4,	%l6
	tpos	%icc,	0x1
	edge8n	%o3,	%g4,	%g1
loop_1597:
	tpos	%icc,	0x1
	set	0x2A, %i6
	stha	%i7,	[%l7 + %i6] 0x0c
	orcc	%o7,	%i0,	%g2
	fpmerge	%f14,	%f18,	%f26
	fpsub16s	%f31,	%f0,	%f1
	movcs	%icc,	%i1,	%g7
	taddcctv	%l3,	0x15AD,	%o5
	sra	%i5,	%g6,	%l5
	subcc	%o1,	%l0,	%o6
	ldstub	[%l7 + 0x11],	%i6
	and	%i3,	%g3,	%o2
	smulcc	%i4,	0x00F9,	%l2
	te	%xcc,	0x6
	edge8l	%g5,	%l1,	%o0
	edge16ln	%o4,	%l4,	%i2
	nop
	set	0x0C, %i7
	ldsb	[%l7 + %i7],	%o3
	fbul,a	%fcc1,	loop_1598
	movg	%xcc,	%l6,	%g4
	sdiv	%i7,	0x1ACE,	%g1
	fcmpes	%fcc0,	%f8,	%f31
loop_1598:
	fmovdvc	%icc,	%f27,	%f1
	tcs	%xcc,	0x5
	add	%o7,	%i0,	%i1
	popc	0x0D72,	%g7
	tge	%xcc,	0x7
	te	%xcc,	0x7
	fmuld8ulx16	%f5,	%f0,	%f10
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x30] %asi,	%f16
	movg	%icc,	%g2,	%o5
	fmovrde	%i5,	%f26,	%f18
	stw	%g6,	[%l7 + 0x7C]
	tvc	%xcc,	0x6
	xorcc	%l3,	%o1,	%l0
	fornot1	%f0,	%f10,	%f2
	fnors	%f20,	%f14,	%f18
	tcs	%icc,	0x0
	tneg	%xcc,	0x7
	tcs	%xcc,	0x3
	fmovrdlz	%o6,	%f12,	%f16
	movn	%xcc,	%i6,	%l5
	sllx	%g3,	%o2,	%i4
	fsrc1s	%f13,	%f10
	movvs	%icc,	%i3,	%l2
	udivcc	%g5,	0x1661,	%l1
	tg	%icc,	0x3
	sdivcc	%o4,	0x1B47,	%l4
	srax	%o0,	%o3,	%i2
	fand	%f18,	%f10,	%f16
	edge32ln	%g4,	%i7,	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o7,	%i0
	brnz,a	%i1,	loop_1599
	subcc	%g7,	0x103A,	%g1
	udivx	%g2,	0x0630,	%o5
	edge32n	%i5,	%g6,	%o1
loop_1599:
	fmovde	%icc,	%f5,	%f28
	fcmpes	%fcc0,	%f23,	%f14
	bcs,a	%icc,	loop_1600
	tleu	%icc,	0x7
	andn	%l0,	%l3,	%o6
	fpadd32	%f6,	%f14,	%f16
loop_1600:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movge	%icc,	%l5,	%i6
	tl	%xcc,	0x7
	movvs	%xcc,	%o2,	%i4
	ble	loop_1601
	fble	%fcc0,	loop_1602
	bne	loop_1603
	bl,pn	%icc,	loop_1604
loop_1601:
	movg	%xcc,	%i3,	%l2
loop_1602:
	movl	%icc,	%g5,	%g3
loop_1603:
	tcs	%xcc,	0x6
loop_1604:
	fzeros	%f9
	fmovdvc	%icc,	%f30,	%f6
	fandnot1s	%f16,	%f5,	%f22
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	brgez	%l4,	loop_1605
	orn	%o4,	0x04A2,	%o3
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x88,	%o0
loop_1605:
	tsubcc	%i2,	0x112B,	%g4
	st	%f19,	[%l7 + 0x10]
	tpos	%xcc,	0x2
	andncc	%l6,	%i7,	%i0
	addccc	%o7,	0x1F94,	%g7
	ldsb	[%l7 + 0x74],	%g1
	sir	0x1B9E
	subccc	%g2,	0x0EB7,	%i1
	edge8n	%o5,	%i5,	%o1
	flush	%l7 + 0x20
	stw	%l0,	[%l7 + 0x5C]
	movleu	%icc,	%l3,	%g6
	fmovdleu	%icc,	%f23,	%f13
	prefetch	[%l7 + 0x30],	 0x3
	tleu	%icc,	0x6
	fsrc1	%f30,	%f26
	nop
	set	0x3A, %i1
	sth	%l5,	[%l7 + %i1]
	ldd	[%l7 + 0x28],	%f16
	fornot1s	%f18,	%f29,	%f1
	sra	%i6,	0x17,	%o6
	bl,a,pt	%xcc,	loop_1606
	fandnot2s	%f8,	%f13,	%f19
	bgu,a	%icc,	loop_1607
	sth	%i4,	[%l7 + 0x50]
loop_1606:
	fpmerge	%f16,	%f1,	%f16
	tsubcctv	%i3,	0x0568,	%o2
loop_1607:
	fcmpne16	%f30,	%f6,	%l2
	bshuffle	%f22,	%f0,	%f4
	movvs	%xcc,	%g5,	%l1
	mulscc	%l4,	0x0364,	%g3
	xorcc	%o4,	%o3,	%o0
	nop
	setx loop_1608, %l0, %l1
	jmpl %l1, %i2
	edge16l	%g4,	%l6,	%i7
	fmovdl	%xcc,	%f8,	%f11
	smulcc	%o7,	0x06E4,	%i0
loop_1608:
	fpadd16s	%f1,	%f5,	%f19
	fpsub16	%f8,	%f4,	%f8
	udivcc	%g1,	0x15C2,	%g2
	fmovsne	%xcc,	%f26,	%f2
	fmovse	%xcc,	%f17,	%f23
	sethi	0x0CCD,	%g7
	array16	%i1,	%o5,	%i5
	fbo	%fcc1,	loop_1609
	fcmpd	%fcc0,	%f18,	%f2
	fmovscc	%icc,	%f28,	%f28
	fbuge,a	%fcc2,	loop_1610
loop_1609:
	edge32n	%l0,	%l3,	%g6
	bneg,a	loop_1611
	fzero	%f2
loop_1610:
	edge16ln	%l5,	%o1,	%o6
	fmovsa	%xcc,	%f18,	%f5
loop_1611:
	nop
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x10,	%i6
	nop
	setx	loop_1612,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x34],	%i3
	nop
	setx	loop_1613,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%i4,	%l2,	%g5
loop_1612:
	subcc	%o2,	0x06E1,	%l1
	movrgz	%g3,	%o4,	%o3
loop_1613:
	movneg	%icc,	%o0,	%i2
	fbule	%fcc1,	loop_1614
	andn	%l4,	0x039B,	%g4
	sdivcc	%i7,	0x04A2,	%l6
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0x0
loop_1614:
	edge32n	%i0,	%g1,	%g7
	array32	%i1,	%g2,	%o5
	udivcc	%i5,	0x039C,	%l3
	swap	[%l7 + 0x6C],	%l0
	fornot2	%f26,	%f12,	%f0
	movpos	%xcc,	%l5,	%o1
	ldsb	[%l7 + 0x1D],	%o6
	addccc	%i6,	0x0FC0,	%i3
	wr	%g0,	0x2b,	%asi
	stha	%i4,	[%l7 + 0x26] %asi
	membar	#Sync
	mova	%icc,	%l2,	%g6
	array16	%g5,	%l1,	%g3
	orncc	%o2,	%o3,	%o0
	andcc	%i2,	0x03C6,	%l4
	subc	%o4,	%i7,	%g4
	sdivcc	%o7,	0x0FE1,	%l6
	tsubcc	%i0,	%g1,	%g7
	tgu	%icc,	0x2
	tneg	%xcc,	0x6
	xnor	%g2,	0x0729,	%i1
	edge8l	%o5,	%l3,	%l0
	smulcc	%i5,	%l5,	%o6
	te	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x58] %asi,	%i6
	edge32ln	%o1,	%i3,	%l2
	sub	%i4,	0x0A17,	%g6
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
	be,a,pt	%icc,	loop_1615
	fxor	%f28,	%f6,	%f22
	stx	%l1,	[%l7 + 0x08]
	tge	%xcc,	0x3
loop_1615:
	smulcc	%g3,	%g5,	%o2
	be	%icc,	loop_1616
	sll	%o3,	0x0E,	%i2
	edge16	%l4,	%o4,	%i7
	movleu	%icc,	%g4,	%o0
loop_1616:
	smulcc	%l6,	%o7,	%i0
	tcs	%icc,	0x4
	set	0x38, %o1
	stxa	%g7,	[%l7 + %o1] 0xe3
	membar	#Sync
	stx	%g2,	[%l7 + 0x38]
	fmovse	%xcc,	%f22,	%f21
	movg	%xcc,	%g1,	%i1
	alignaddrl	%o5,	%l0,	%i5
	movne	%icc,	%l5,	%l3
	edge8ln	%o6,	%o1,	%i3
	andncc	%i6,	%l2,	%i4
	fbo,a	%fcc0,	loop_1617
	brlez,a	%g6,	loop_1618
	nop
	setx	loop_1619,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x5
loop_1617:
	fmovdvc	%xcc,	%f11,	%f3
loop_1618:
	fba,a	%fcc0,	loop_1620
loop_1619:
	xorcc	%l1,	0x0B74,	%g3
	edge8	%g5,	%o3,	%i2
	movneg	%xcc,	%o2,	%o4
loop_1620:
	fand	%f16,	%f26,	%f24
	fbn,a	%fcc1,	loop_1621
	umulcc	%l4,	0x1645,	%i7
	tvs	%xcc,	0x5
	fpmerge	%f23,	%f13,	%f22
loop_1621:
	addc	%g4,	0x0674,	%l6
	umul	%o7,	0x05C5,	%i0
	tcc	%icc,	0x1
	movgu	%xcc,	%g7,	%o0
	movleu	%icc,	%g1,	%g2
	alignaddr	%i1,	%l0,	%o5
	popc	0x0D06,	%i5
	movpos	%icc,	%l5,	%l3
	lduh	[%l7 + 0x3E],	%o6
	edge32n	%o1,	%i3,	%l2
	array8	%i6,	%g6,	%i4
	fcmpgt32	%f22,	%f6,	%g3
	fpsub32	%f16,	%f12,	%f14
	edge16	%g5,	%l1,	%i2
	edge32l	%o3,	%o2,	%l4
	subcc	%i7,	0x0D9D,	%g4
	movleu	%xcc,	%l6,	%o7
	edge8l	%o4,	%g7,	%o0
	popc	0x126C,	%g1
	fpadd32	%f18,	%f0,	%f18
	fands	%f21,	%f23,	%f30
	srlx	%g2,	%i0,	%l0
	sdivx	%i1,	0x0C27,	%i5
	sdivx	%o5,	0x1E77,	%l3
	fmovdg	%icc,	%f7,	%f29
	andn	%o6,	%l5,	%o1
	fnegs	%f26,	%f13
	fnot2	%f18,	%f24
	umulcc	%l2,	0x1C38,	%i6
	alignaddrl	%i3,	%i4,	%g3
	tn	%icc,	0x3
	sir	0x1092
	tvs	%xcc,	0x4
	orn	%g5,	0x1CAA,	%g6
	udiv	%l1,	0x17A9,	%o3
	movcc	%icc,	%i2,	%l4
	wr	%g0,	0x11,	%asi
	sta	%f17,	[%l7 + 0x18] %asi
	movcs	%xcc,	%o2,	%g4
	fpsub32	%f28,	%f16,	%f20
	tle	%icc,	0x3
	alignaddr	%l6,	%i7,	%o7
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o4
	movg	%icc,	%g7,	%o0
	xor	%g1,	%g2,	%i0
	fmovdvc	%xcc,	%f2,	%f31
	array16	%l0,	%i5,	%o5
	stbar
	fnot2s	%f4,	%f6
	ldsw	[%l7 + 0x7C],	%l3
	smul	%i1,	%l5,	%o6
	movn	%icc,	%o1,	%l2
	fbuge	%fcc1,	loop_1622
	edge16ln	%i3,	%i4,	%i6
	taddcctv	%g5,	%g6,	%l1
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x19,	%g2
loop_1622:
	ldd	[%l7 + 0x50],	%f24
	movg	%xcc,	%o3,	%l4
	srax	%i2,	%o2,	%l6
	sir	0x177E
	edge8	%i7,	%o7,	%o4
	fands	%f25,	%f13,	%f16
	std	%g4,	[%l7 + 0x10]
	mulscc	%g7,	%o0,	%g2
	srlx	%i0,	%g1,	%l0
	movn	%icc,	%o5,	%i5
	fpadd32	%f10,	%f16,	%f4
	set	0x3D, %l6
	ldstuba	[%l7 + %l6] 0x04,	%i1
	xnor	%l5,	%l3,	%o6
	bg,a,pn	%xcc,	loop_1623
	fmovse	%icc,	%f11,	%f27
	andncc	%l2,	%o1,	%i4
	fpmerge	%f5,	%f17,	%f26
loop_1623:
	brnz,a	%i6,	loop_1624
	movrgz	%i3,	%g5,	%l1
	edge16ln	%g6,	%o3,	%g3
	fmovsneg	%icc,	%f0,	%f10
loop_1624:
	fmovsgu	%icc,	%f24,	%f26
	fbuge	%fcc2,	loop_1625
	nop
	setx loop_1626, %l0, %l1
	jmpl %l1, %i2
	brnz	%l4,	loop_1627
	movn	%xcc,	%l6,	%o2
loop_1625:
	movl	%icc,	%i7,	%o7
loop_1626:
	udiv	%g4,	0x1E58,	%g7
loop_1627:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o0,	0x0B24,	%o4
	fmovda	%xcc,	%f30,	%f10
	bg,pn	%xcc,	loop_1628
	tl	%icc,	0x1
	addcc	%g2,	%i0,	%l0
	edge32	%o5,	%i5,	%i1
loop_1628:
	xnor	%g1,	0x0E26,	%l3
	umul	%l5,	%o6,	%l2
	tsubcc	%o1,	%i6,	%i4
	fmovdpos	%icc,	%f24,	%f28
	st	%f7,	[%l7 + 0x28]
	fmovsleu	%xcc,	%f14,	%f26
	tneg	%xcc,	0x5
	sdivcc	%i3,	0x18CE,	%g5
	fmovrdlez	%l1,	%f18,	%f2
	movvs	%icc,	%g6,	%o3
	movge	%xcc,	%i2,	%l4
	stb	%g3,	[%l7 + 0x70]
	tvs	%icc,	0x1
	fmovrdne	%o2,	%f14,	%f12
	xnorcc	%l6,	%i7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g7,	%o7,	%o4
	sra	%o0,	0x09,	%g2
	movleu	%icc,	%l0,	%o5
	tge	%xcc,	0x2
	fxors	%f10,	%f14,	%f24
	tsubcc	%i0,	%i1,	%g1
	fpackfix	%f0,	%f13
	movrgz	%l3,	0x224,	%i5
	sub	%l5,	0x0360,	%o6
	tsubcc	%l2,	0x00E0,	%i6
	ldsw	[%l7 + 0x68],	%i4
	movneg	%icc,	%i3,	%o1
	edge32l	%g5,	%l1,	%g6
	fmovdcs	%xcc,	%f0,	%f4
	brlez	%o3,	loop_1629
	ldd	[%l7 + 0x38],	%l4
	fcmpgt32	%f20,	%f28,	%i2
	fsrc2	%f30,	%f20
loop_1629:
	movrgz	%g3,	%o2,	%l6
	movre	%g4,	%i7,	%g7
	fmovrslz	%o7,	%f27,	%f25
	udivcc	%o4,	0x0C3E,	%o0
	umulcc	%g2,	0x0446,	%o5
	addc	%i0,	0x1A79,	%l0
	fzeros	%f27
	array32	%g1,	%l3,	%i1
	fmovdle	%icc,	%f17,	%f27
	movrgez	%i5,	0x386,	%o6
	andncc	%l5,	%l2,	%i6
	edge32ln	%i3,	%i4,	%o1
	nop
	setx loop_1630, %l0, %l1
	jmpl %l1, %l1
	movcc	%icc,	%g5,	%o3
	sdivcc	%l4,	0x1C43,	%i2
	tg	%icc,	0x7
loop_1630:
	bcc,a	loop_1631
	tle	%icc,	0x0
	brgez,a	%g6,	loop_1632
	tgu	%icc,	0x5
loop_1631:
	orncc	%o2,	0x0634,	%g3
	edge8n	%g4,	%i7,	%l6
loop_1632:
	fmovsgu	%xcc,	%f29,	%f10
	tcc	%xcc,	0x7
	andcc	%g7,	%o4,	%o7
	tgu	%icc,	0x6
	fmul8x16al	%f17,	%f19,	%f24
	fbule,a	%fcc3,	loop_1633
	fmovscc	%xcc,	%f4,	%f2
	flush	%l7 + 0x5C
	tg	%icc,	0x2
loop_1633:
	edge16ln	%g2,	%o0,	%o5
	fcmps	%fcc0,	%f10,	%f16
	edge16n	%l0,	%g1,	%l3
	fzero	%f16
	brnz,a	%i1,	loop_1634
	tcc	%icc,	0x3
	ta	%xcc,	0x5
	mulx	%i5,	%i0,	%o6
loop_1634:
	xorcc	%l5,	%i6,	%i3
	tne	%xcc,	0x4
	xor	%l2,	%i4,	%l1
	addccc	%o1,	0x0119,	%g5
	movrgez	%o3,	0x27B,	%l4
	array32	%g6,	%o2,	%i2
	smul	%g4,	%i7,	%g3
	movrne	%g7,	%l6,	%o7
	set	0x64, %g7
	ldstuba	[%l7 + %g7] 0x0c,	%o4
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%o0
	andncc	%g2,	%o5,	%g1
	taddcc	%l3,	0x09BA,	%l0
	addc	%i1,	0x0CB1,	%i0
	tneg	%xcc,	0x0
	ldx	[%l7 + 0x60],	%i5
	edge16l	%o6,	%i6,	%l5
	taddcc	%i3,	%l2,	%l1
	smulcc	%o1,	%i4,	%o3
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x10,	%f0
	for	%f26,	%f2,	%f2
	movre	%g5,	0x2B6,	%l4
	movl	%xcc,	%o2,	%g6
	fcmple32	%f22,	%f30,	%i2
	orncc	%i7,	%g3,	%g7
	move	%icc,	%l6,	%g4
	wr	%g0,	0x80,	%asi
	stba	%o7,	[%l7 + 0x2E] %asi
	edge32ln	%o4,	%g2,	%o0
	addcc	%g1,	%l3,	%o5
	tg	%xcc,	0x6
	tneg	%icc,	0x0
	bshuffle	%f30,	%f4,	%f8
	edge8ln	%i1,	%l0,	%i5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tn	%icc,	0x3
	orncc	%o6,	0x1975,	%i0
	fmovrsne	%l5,	%f6,	%f9
	be,a	%xcc,	loop_1635
	sdiv	%i3,	0x0DC4,	%i6
	set	0x38, %i0
	lduwa	[%l7 + %i0] 0x81,	%l1
loop_1635:
	movn	%xcc,	%o1,	%i4
	subccc	%o3,	0x0DB8,	%g5
	set	0x72, %g3
	lduha	[%l7 + %g3] 0x10,	%l4
	popc	%o2,	%g6
	brlez,a	%i2,	loop_1636
	tge	%xcc,	0x2
	bcc,a	loop_1637
	sub	%l2,	%i7,	%g3
loop_1636:
	tg	%icc,	0x2
	edge8	%l6,	%g7,	%o7
loop_1637:
	taddcctv	%g4,	0x079A,	%g2
	tvs	%xcc,	0x1
	andncc	%o4,	%g1,	%o0
	fcmped	%fcc2,	%f4,	%f28
	membar	0x05
	membar	0x58
	bl,pt	%xcc,	loop_1638
	popc	%l3,	%i1
	movgu	%icc,	%o5,	%i5
	andncc	%l0,	%i0,	%l5
loop_1638:
	add	%i3,	%o6,	%i6
	fnot2s	%f0,	%f25
	stw	%l1,	[%l7 + 0x1C]
	ble	loop_1639
	srlx	%i4,	0x03,	%o3
	pdist	%f10,	%f30,	%f4
	fxor	%f30,	%f16,	%f6
loop_1639:
	brz	%o1,	loop_1640
	orcc	%g5,	%o2,	%l4
	sdivcc	%i2,	0x01FE,	%g6
	nop
	setx	loop_1641,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1640:
	edge16ln	%l2,	%i7,	%g3
	movvs	%icc,	%l6,	%o7
	fpsub16	%f0,	%f2,	%f30
loop_1641:
	edge16l	%g7,	%g4,	%o4
	fbge,a	%fcc0,	loop_1642
	andcc	%g1,	0x0292,	%o0
	ldd	[%l7 + 0x60],	%f4
	nop
	setx loop_1643, %l0, %l1
	jmpl %l1, %l3
loop_1642:
	tn	%icc,	0x6
	stb	%i1,	[%l7 + 0x6F]
	ldsw	[%l7 + 0x4C],	%o5
loop_1643:
	fmovsvc	%icc,	%f30,	%f2
	fmovsneg	%xcc,	%f5,	%f26
	edge32l	%i5,	%l0,	%i0
	bvs,pt	%xcc,	loop_1644
	edge16l	%l5,	%i3,	%o6
	fandnot2	%f4,	%f12,	%f12
	fmovsg	%xcc,	%f15,	%f29
loop_1644:
	nop
	setx	loop_1645,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbne,a	%fcc1,	loop_1646
	fmuld8sux16	%f5,	%f27,	%f14
	alignaddr	%g2,	%l1,	%i4
loop_1645:
	fandnot2	%f20,	%f30,	%f20
loop_1646:
	fbu,a	%fcc0,	loop_1647
	smulcc	%i6,	%o1,	%g5
	sir	0x0CA4
	addc	%o2,	%o3,	%l4
loop_1647:
	xnor	%i2,	%g6,	%l2
	stw	%i7,	[%l7 + 0x7C]
	udiv	%l6,	0x1AE6,	%g3
	movl	%xcc,	%o7,	%g7
	bleu,a,pn	%xcc,	loop_1648
	orcc	%g4,	%o4,	%o0
	mova	%xcc,	%g1,	%l3
	fnot1	%f8,	%f28
loop_1648:
	movcc	%xcc,	%i1,	%o5
	bg,a,pn	%xcc,	loop_1649
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o5
	stda	%l0,	[%l7 + %o5] 0x19
loop_1649:
	tne	%icc,	0x7
	subccc	%i5,	0x0A63,	%l5
	edge8l	%i3,	%i0,	%o6
	fmovrdlz	%l1,	%f28,	%f0
	edge32ln	%i4,	%g2,	%o1
	tl	%icc,	0x4
	andn	%g5,	%o2,	%o3
	bneg,a	loop_1650
	be,pt	%xcc,	loop_1651
	fpack16	%f16,	%f12
	fbul,a	%fcc2,	loop_1652
loop_1650:
	fnand	%f6,	%f6,	%f10
loop_1651:
	bne,pn	%icc,	loop_1653
	lduh	[%l7 + 0x50],	%i6
loop_1652:
	movrlz	%i2,	%g6,	%l2
	fbn	%fcc2,	loop_1654
loop_1653:
	subcc	%i7,	%l6,	%g3
	edge32l	%o7,	%l4,	%g4
	flush	%l7 + 0x24
loop_1654:
	array16	%g7,	%o0,	%o4
	array16	%g1,	%i1,	%l3
	bleu,pn	%xcc,	loop_1655
	fmovda	%icc,	%f6,	%f8
	alignaddrl	%o5,	%i5,	%l5
	movrlz	%i3,	0x326,	%l0
loop_1655:
	addccc	%o6,	0x1389,	%l1
	movrgez	%i4,	%i0,	%o1
	fzero	%f22
	bshuffle	%f28,	%f6,	%f0
	bpos,a,pn	%icc,	loop_1656
	mulscc	%g5,	%g2,	%o3
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x5E] %asi,	%i6
loop_1656:
	tleu	%icc,	0x1
	tneg	%xcc,	0x1
	movge	%xcc,	%i2,	%g6
	fxnors	%f24,	%f14,	%f5
	fbug,a	%fcc1,	loop_1657
	movcc	%xcc,	%l2,	%o2
	ldx	[%l7 + 0x70],	%i7
	xor	%g3,	0x155A,	%o7
loop_1657:
	tvs	%xcc,	0x5
	edge16l	%l4,	%g4,	%g7
	edge8	%o0,	%l6,	%g1
	umulcc	%i1,	0x1959,	%l3
	movne	%xcc,	%o4,	%i5
	flush	%l7 + 0x2C
	fmovdleu	%icc,	%f9,	%f15
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o5
	fmovsvs	%xcc,	%f8,	%f10
	tneg	%xcc,	0x7
	fmovdg	%icc,	%f9,	%f24
	movgu	%xcc,	%i3,	%l0
	fmovsa	%icc,	%f23,	%f16
	sth	%l5,	[%l7 + 0x14]
	ldsh	[%l7 + 0x2A],	%o6
	movg	%icc,	%i4,	%l1
	movge	%icc,	%o1,	%g5
	edge32	%g2,	%o3,	%i6
	fbul	%fcc1,	loop_1658
	bneg,pt	%icc,	loop_1659
	bn,a,pt	%icc,	loop_1660
	fbo,a	%fcc3,	loop_1661
loop_1658:
	andn	%i0,	0x0FFD,	%i2
loop_1659:
	nop
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x04,	 0x3
loop_1660:
	sll	%l2,	%o2,	%i7
loop_1661:
	add	%o7,	%g3,	%g4
	nop
	setx	loop_1662,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%l4,	%g7,	%l6
	fblg	%fcc3,	loop_1663
	movrlez	%g1,	0x10F,	%o0
loop_1662:
	addccc	%l3,	0x1DBB,	%i1
	andncc	%o4,	%o5,	%i3
loop_1663:
	bneg,pn	%xcc,	loop_1664
	fsrc2	%f6,	%f14
	movrlez	%l0,	%l5,	%i5
	stb	%i4,	[%l7 + 0x5D]
loop_1664:
	fmovdleu	%icc,	%f18,	%f0
	brz,a	%o6,	loop_1665
	movpos	%xcc,	%l1,	%g5
	tsubcctv	%g2,	%o3,	%o1
	fors	%f14,	%f23,	%f15
loop_1665:
	stx	%i6,	[%l7 + 0x38]
	sub	%i2,	0x1D39,	%i0
	std	%g6,	[%l7 + 0x08]
	andncc	%l2,	%i7,	%o2
	fmovrsgez	%g3,	%f2,	%f10
	fzero	%f22
	movrne	%g4,	%o7,	%l4
	tge	%xcc,	0x2
	subccc	%l6,	%g1,	%g7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x50] %asi,	%l3
	sra	%o0,	%i1,	%o5
	fcmple16	%f0,	%f6,	%o4
	lduw	[%l7 + 0x5C],	%l0
	movvs	%icc,	%i3,	%l5
	movleu	%icc,	%i5,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o6,	%g5,	%l1
	orn	%g2,	%o1,	%i6
	tpos	%icc,	0x0
	tpos	%icc,	0x0
	edge32ln	%i2,	%i0,	%o3
	umulcc	%g6,	%l2,	%o2
	fbge	%fcc2,	loop_1666
	movrlez	%g3,	0x098,	%g4
	fmovdneg	%icc,	%f7,	%f20
	fmovrdlz	%o7,	%f30,	%f6
loop_1666:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%l6
	array16	%g1,	%g7,	%l3
	fnot2s	%f26,	%f29
	movleu	%icc,	%o0,	%i1
	bvc,pt	%icc,	loop_1667
	udivcc	%o5,	0x0577,	%o4
	fmovse	%icc,	%f5,	%f21
	movrlez	%i7,	0x02C,	%i3
loop_1667:
	tsubcctv	%l5,	%i5,	%l0
	edge8ln	%i4,	%o6,	%l1
	stb	%g2,	[%l7 + 0x45]
	xor	%g5,	%i6,	%i2
	tleu	%icc,	0x0
	udiv	%o1,	0x152B,	%i0
	subcc	%o3,	%l2,	%g6
	xnorcc	%o2,	0x1F64,	%g4
	fmovrdlz	%o7,	%f2,	%f10
	subc	%l4,	0x1629,	%l6
	tsubcctv	%g1,	0x0EF3,	%g3
	set	0x69, %i5
	lduba	[%l7 + %i5] 0x81,	%l3
	sethi	0x0762,	%o0
	edge16n	%g7,	%o5,	%o4
	movrne	%i1,	%i3,	%i7
	be	%icc,	loop_1668
	tsubcc	%l5,	%l0,	%i5
	fmovsneg	%icc,	%f18,	%f21
	fpsub32s	%f1,	%f29,	%f23
loop_1668:
	sethi	0x1E82,	%i4
	set	0x50, %g2
	ldsba	[%l7 + %g2] 0x81,	%l1
	tge	%icc,	0x6
	orcc	%g2,	%g5,	%o6
	movle	%icc,	%i6,	%i2
	std	%i0,	[%l7 + 0x28]
	edge8	%o3,	%l2,	%o1
	pdist	%f2,	%f10,	%f30
	mulscc	%g6,	0x1BCF,	%g4
	tn	%icc,	0x6
	edge8ln	%o2,	%l4,	%o7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%l6
	stbar
	movvc	%xcc,	%g1,	%l3
	subc	%g3,	0x1FD8,	%g7
	edge32ln	%o0,	%o4,	%o5
	xorcc	%i1,	0x14AE,	%i3
	sllx	%l5,	0x0B,	%i7
	alignaddr	%l0,	%i5,	%l1
	sdiv	%g2,	0x07DA,	%i4
	fbule,a	%fcc0,	loop_1669
	addccc	%o6,	0x01FA,	%i6
	fcmpne16	%f18,	%f28,	%g5
	call	loop_1670
loop_1669:
	ldsh	[%l7 + 0x4C],	%i0
	array16	%i2,	%o3,	%l2
	tvc	%icc,	0x1
loop_1670:
	tge	%xcc,	0x0
	tne	%xcc,	0x5
	array16	%o1,	%g4,	%o2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%l4,	%o7
	edge8ln	%g6,	%g1,	%l3
	tsubcctv	%l6,	%g7,	%o0
	call	loop_1671
	sdiv	%g3,	0x1C50,	%o5
	set	0x22, %g5
	ldsha	[%l7 + %g5] 0x04,	%o4
loop_1671:
	tsubcc	%i1,	%l5,	%i7
	fbne	%fcc1,	loop_1672
	fxnors	%f5,	%f24,	%f26
	tvc	%icc,	0x6
	srl	%i3,	%l0,	%i5
loop_1672:
	fmovrsne	%l1,	%f6,	%f3
	fmovsvc	%xcc,	%f19,	%f29
	xor	%g2,	0x0ACF,	%i4
	stbar
	fbe	%fcc1,	loop_1673
	movgu	%icc,	%o6,	%i6
	subcc	%i0,	%i2,	%g5
	membar	0x2E
loop_1673:
	fmovsne	%icc,	%f13,	%f21
	fba	%fcc3,	loop_1674
	subcc	%l2,	%o1,	%o3
	array32	%g4,	%o2,	%o7
	sdivx	%l4,	0x1C99,	%g6
loop_1674:
	ldsw	[%l7 + 0x4C],	%g1
	fsrc1s	%f12,	%f27
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l6
	bvc,a,pt	%xcc,	loop_1675
	movvs	%icc,	%g7,	%o0
	tneg	%xcc,	0x3
	fmovsvs	%icc,	%f2,	%f11
loop_1675:
	fbue,a	%fcc2,	loop_1676
	fmovsle	%xcc,	%f18,	%f21
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x30] %asi,	%l3
loop_1676:
	ldx	[%l7 + 0x60],	%o5
	movg	%xcc,	%o4,	%i1
	movpos	%icc,	%l5,	%g3
	fmovsge	%xcc,	%f17,	%f7
	taddcctv	%i3,	%i7,	%l0
	xnor	%i5,	%l1,	%g2
	movgu	%icc,	%i4,	%o6
	tcs	%icc,	0x7
	sll	%i6,	%i2,	%i0
	fbg,a	%fcc1,	loop_1677
	move	%icc,	%l2,	%g5
	addcc	%o3,	0x0A36,	%o1
	orncc	%g4,	%o7,	%o2
loop_1677:
	fmuld8ulx16	%f1,	%f7,	%f24
	fnors	%f4,	%f10,	%f29
	sub	%l4,	%g1,	%l6
	srax	%g6,	%o0,	%g7
	nop
	setx loop_1678, %l0, %l1
	jmpl %l1, %o5
	andn	%l3,	%i1,	%o4
	movle	%icc,	%g3,	%i3
	tgu	%xcc,	0x4
loop_1678:
	tleu	%icc,	0x1
	stbar
	addcc	%i7,	%l0,	%l5
	fand	%f28,	%f2,	%f20
	movvs	%icc,	%l1,	%i5
	set	0x18, %g4
	stda	%i4,	[%l7 + %g4] 0x81
	movrne	%o6,	0x1D0,	%i6
	mova	%xcc,	%g2,	%i0
	array8	%l2,	%g5,	%i2
	movrlez	%o1,	%g4,	%o3
	fmul8sux16	%f4,	%f12,	%f20
	movgu	%icc,	%o2,	%o7
	set	0x10, %o6
	lda	[%l7 + %o6] 0x81,	%f17
	taddcc	%l4,	%g1,	%l6
	sir	0x0EAB
	fmovscc	%xcc,	%f30,	%f28
	tle	%icc,	0x1
	fbne	%fcc0,	loop_1679
	ba	loop_1680
	fbue	%fcc0,	loop_1681
	fcmpeq32	%f28,	%f14,	%g6
loop_1679:
	brgz,a	%g7,	loop_1682
loop_1680:
	movleu	%icc,	%o5,	%o0
loop_1681:
	nop
	set	0x60, %l3
	ldswa	[%l7 + %l3] 0x04,	%l3
loop_1682:
	andn	%i1,	0x0FD1,	%g3
	movl	%icc,	%i3,	%i7
	bcs,a,pt	%xcc,	loop_1683
	tg	%icc,	0x7
	swap	[%l7 + 0x08],	%o4
	fbne	%fcc1,	loop_1684
loop_1683:
	orn	%l5,	0x01FA,	%l0
	srax	%i5,	%l1,	%i4
	mova	%icc,	%i6,	%g2
loop_1684:
	movvs	%icc,	%i0,	%l2
	taddcctv	%o6,	0x1613,	%i2
	edge8ln	%g5,	%g4,	%o1
	tvs	%xcc,	0x4
	edge32	%o3,	%o7,	%l4
	nop
	set	0x6E, %l2
	ldsb	[%l7 + %l2],	%o2
	fexpand	%f15,	%f0
	subc	%l6,	%g6,	%g1
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x10,	 0x2
	fpack16	%f20,	%f6
	fbo	%fcc1,	loop_1685
	andncc	%g7,	%o0,	%i1
	tl	%icc,	0x0
	smul	%g3,	%i3,	%l3
loop_1685:
	movn	%icc,	%i7,	%o4
	movre	%l5,	0x203,	%i5
	movvs	%icc,	%l1,	%l0
	set	0x20, %i2
	sta	%f13,	[%l7 + %i2] 0x81
	subc	%i4,	0x044A,	%g2
	tsubcctv	%i0,	%i6,	%l2
	membar	0x4F
	brz,a	%i2,	loop_1686
	tvc	%xcc,	0x7
	fba	%fcc0,	loop_1687
	flush	%l7 + 0x58
loop_1686:
	movre	%g5,	%g4,	%o1
	bl,a	%icc,	loop_1688
loop_1687:
	addc	%o6,	%o7,	%l4
	fmovsl	%xcc,	%f21,	%f17
	fbe	%fcc2,	loop_1689
loop_1688:
	edge16n	%o3,	%o2,	%g6
	udivcc	%g1,	0x018F,	%l6
	addc	%g7,	0x1AD2,	%o5
loop_1689:
	lduw	[%l7 + 0x38],	%o0
	fblg	%fcc3,	loop_1690
	movl	%xcc,	%i1,	%i3
	membar	0x48
	udivx	%l3,	0x1071,	%g3
loop_1690:
	fbge,a	%fcc1,	loop_1691
	bge,a,pn	%icc,	loop_1692
	fmovsn	%icc,	%f14,	%f28
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i7,	%l5
loop_1691:
	tl	%xcc,	0x3
loop_1692:
	st	%f26,	[%l7 + 0x58]
	fands	%f8,	%f6,	%f9
	fmovd	%f22,	%f2
	fbe	%fcc2,	loop_1693
	stb	%o4,	[%l7 + 0x58]
	fba,a	%fcc3,	loop_1694
	tg	%icc,	0x0
loop_1693:
	srl	%i5,	0x09,	%l1
	tsubcctv	%i4,	%g2,	%l0
loop_1694:
	fbe	%fcc1,	loop_1695
	alignaddr	%i0,	%l2,	%i6
	ble,a	loop_1696
	tsubcctv	%i2,	%g5,	%o1
loop_1695:
	edge32n	%o6,	%o7,	%l4
	fornot1	%f12,	%f18,	%f26
loop_1696:
	nop
	set	0x48, %g6
	std	%f10,	[%l7 + %g6]
	mulx	%o3,	0x1D4D,	%g4
	alignaddr	%o2,	%g6,	%g1
	edge8ln	%l6,	%o5,	%o0
	alignaddr	%i1,	%i3,	%g7
	fandnot1s	%f28,	%f14,	%f7
	bleu,pn	%xcc,	loop_1697
	movgu	%icc,	%l3,	%i7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x32] %asi,	%g3
loop_1697:
	fnors	%f29,	%f8,	%f29
	movrgz	%l5,	%i5,	%o4
	edge8l	%l1,	%g2,	%i4
	tcs	%xcc,	0x6
	alignaddr	%i0,	%l2,	%i6
	fnor	%f26,	%f12,	%f20
	edge32n	%i2,	%g5,	%l0
	fcmpeq32	%f16,	%f24,	%o6
	sdivx	%o7,	0x0362,	%l4
	fxnors	%f4,	%f18,	%f22
	set	0x40, %o3
	stxa	%o3,	[%l7 + %o3] 0x81
	fcmple16	%f12,	%f20,	%o1
	mova	%icc,	%o2,	%g4
	fpsub16s	%f21,	%f2,	%f8
	membar	0x45
	array32	%g6,	%l6,	%g1
	tleu	%xcc,	0x5
	tle	%icc,	0x6
	sdivx	%o5,	0x1368,	%i1
	alignaddrl	%i3,	%g7,	%o0
	movneg	%xcc,	%l3,	%i7
	tsubcctv	%g3,	0x1E37,	%l5
	tvs	%icc,	0x1
	fnegs	%f19,	%f3
	tpos	%xcc,	0x6
	movrlz	%o4,	%i5,	%g2
	ldsh	[%l7 + 0x0E],	%l1
	fble	%fcc1,	loop_1698
	edge16l	%i4,	%i0,	%l2
	bshuffle	%f2,	%f16,	%f18
	fmovsa	%xcc,	%f12,	%f11
loop_1698:
	stb	%i2,	[%l7 + 0x5E]
	array8	%g5,	%i6,	%o6
	fmovdg	%xcc,	%f10,	%f24
	brz,a	%o7,	loop_1699
	swap	[%l7 + 0x08],	%l0
	sdivx	%l4,	0x1771,	%o1
	array8	%o2,	%o3,	%g6
loop_1699:
	fcmpne32	%f4,	%f20,	%l6
	fmovdcs	%icc,	%f20,	%f9
	movrlez	%g1,	0x297,	%o5
	tle	%icc,	0x5
	bcc,a,pn	%xcc,	loop_1700
	xorcc	%g4,	0x0171,	%i3
	brlez	%i1,	loop_1701
	brgz	%g7,	loop_1702
loop_1700:
	tleu	%icc,	0x0
	sll	%o0,	0x1D,	%i7
loop_1701:
	tg	%icc,	0x0
loop_1702:
	tsubcc	%g3,	%l5,	%l3
	fbl,a	%fcc0,	loop_1703
	movge	%icc,	%i5,	%g2
	smulcc	%o4,	0x0ADE,	%l1
	tg	%xcc,	0x2
loop_1703:
	sethi	0x0E72,	%i4
	bge,pn	%icc,	loop_1704
	stbar
	edge16ln	%l2,	%i0,	%i2
	edge8l	%i6,	%o6,	%g5
loop_1704:
	fmovrsne	%o7,	%f13,	%f31
	array8	%l4,	%l0,	%o2
	addccc	%o3,	%o1,	%g6
	xnor	%g1,	%l6,	%o5
	tcs	%icc,	0x7
	tg	%icc,	0x3
	udivx	%g4,	0x132A,	%i3
	fmovrsgez	%g7,	%f16,	%f10
	movne	%xcc,	%i1,	%o0
	bgu,pn	%icc,	loop_1705
	mulx	%i7,	%l5,	%l3
	fbne,a	%fcc3,	loop_1706
	fble,a	%fcc1,	loop_1707
loop_1705:
	tge	%icc,	0x7
	srlx	%i5,	0x13,	%g2
loop_1706:
	fbu,a	%fcc3,	loop_1708
loop_1707:
	movl	%xcc,	%g3,	%o4
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
loop_1708:
	srlx	%l2,	0x1B,	%i4
	ldub	[%l7 + 0x0F],	%i0
	brlz	%i6,	loop_1709
	edge8	%i2,	%o6,	%o7
	edge8	%l4,	%l0,	%o2
	ldsw	[%l7 + 0x1C],	%o3
loop_1709:
	fxor	%f8,	%f14,	%f18
	fcmps	%fcc1,	%f9,	%f27
	fmul8sux16	%f18,	%f26,	%f22
	movrne	%g5,	%o1,	%g6
	taddcctv	%l6,	%o5,	%g1
	bvc,a,pt	%xcc,	loop_1710
	movle	%icc,	%i3,	%g4
	umul	%i1,	0x1C8B,	%o0
	fmovdg	%xcc,	%f1,	%f28
loop_1710:
	tneg	%xcc,	0x2
	addcc	%g7,	%i7,	%l5
	subc	%i5,	%l3,	%g3
	movpos	%xcc,	%o4,	%l1
	tne	%xcc,	0x0
	smulcc	%l2,	%i4,	%i0
	movrlez	%i6,	%g2,	%i2
	call	loop_1711
	smul	%o7,	0x06A6,	%l4
	tcs	%xcc,	0x0
	ba	loop_1712
loop_1711:
	ldd	[%l7 + 0x18],	%f22
	fands	%f6,	%f9,	%f1
	udivx	%o6,	0x1438,	%o2
loop_1712:
	bvc,a,pn	%xcc,	loop_1713
	fmovrde	%l0,	%f2,	%f6
	movne	%icc,	%g5,	%o3
	bge	loop_1714
loop_1713:
	fmovsne	%xcc,	%f19,	%f0
	andcc	%o1,	0x1DDC,	%g6
	xnor	%o5,	0x18EB,	%g1
loop_1714:
	brnz,a	%i3,	loop_1715
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
	edge8ln	%l6,	%g4,	%i1
	bleu,a,pn	%xcc,	loop_1717
loop_1715:
	edge8	%g7,	%o0,	%l5
loop_1716:
	fbo,a	%fcc0,	loop_1718
	ld	[%l7 + 0x78],	%f14
loop_1717:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x43] %asi,	%i7
loop_1718:
	addcc	%i5,	0x0E7F,	%g3
	edge32n	%l3,	%o4,	%l1
	movge	%icc,	%l2,	%i0
	xorcc	%i6,	0x1240,	%g2
	flush	%l7 + 0x5C
	set	0x69, %o4
	ldsba	[%l7 + %o4] 0x81,	%i4
	bl,pt	%icc,	loop_1719
	srl	%i2,	0x17,	%l4
	fpsub16s	%f12,	%f16,	%f13
	alignaddr	%o6,	%o2,	%o7
loop_1719:
	udivcc	%g5,	0x02C0,	%l0
	fnot1	%f24,	%f24
	fbule,a	%fcc0,	loop_1720
	edge32ln	%o3,	%g6,	%o5
	set	0x64, %i3
	lduwa	[%l7 + %i3] 0x88,	%o1
loop_1720:
	sir	0x11D3
	movleu	%xcc,	%i3,	%l6
	fabsd	%f2,	%f4
	srlx	%g4,	%i1,	%g7
	ta	%xcc,	0x3
	fcmpeq16	%f24,	%f4,	%g1
	for	%f0,	%f10,	%f28
	fmovscc	%icc,	%f23,	%f9
	or	%o0,	%i7,	%i5
	xnorcc	%g3,	0x0F06,	%l5
	fbge	%fcc1,	loop_1721
	movle	%icc,	%l3,	%o4
	array32	%l2,	%i0,	%i6
	mova	%icc,	%l1,	%i4
loop_1721:
	udiv	%g2,	0x0F7E,	%l4
	mulx	%o6,	%o2,	%o7
	bl,pt	%xcc,	loop_1722
	movleu	%xcc,	%g5,	%l0
	movge	%icc,	%i2,	%o3
	nop
	setx loop_1723, %l0, %l1
	jmpl %l1, %g6
loop_1722:
	std	%o4,	[%l7 + 0x78]
	sir	0x151B
	ldsh	[%l7 + 0x4C],	%i3
loop_1723:
	nop
	set	0x47, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l6
	andcc	%g4,	0x1B62,	%i1
	brlez,a	%o1,	loop_1724
	array16	%g7,	%o0,	%g1
	faligndata	%f28,	%f26,	%f16
	fmuld8sux16	%f13,	%f27,	%f30
loop_1724:
	nop
	set	0x26, %l0
	lduba	[%l7 + %l0] 0x11,	%i7
	brgz,a	%g3,	loop_1725
	fmovdg	%icc,	%f20,	%f4
	movneg	%xcc,	%l5,	%l3
	fpack16	%f2,	%f22
loop_1725:
	nop
	setx	loop_1726,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%i5,	%l2,	%o4
	ldd	[%l7 + 0x60],	%f10
	fbge,a	%fcc0,	loop_1727
loop_1726:
	andncc	%i0,	%l1,	%i6
	call	loop_1728
	tsubcctv	%g2,	0x125E,	%l4
loop_1727:
	sir	0x1BD3
	flush	%l7 + 0x64
loop_1728:
	movvc	%icc,	%i4,	%o6
	brz,a	%o7,	loop_1729
	movcs	%icc,	%g5,	%l0
	fmovrse	%o2,	%f15,	%f8
	call	loop_1730
loop_1729:
	brlez	%o3,	loop_1731
	subcc	%g6,	%o5,	%i2
	fmovdge	%xcc,	%f18,	%f9
loop_1730:
	andn	%l6,	0x1489,	%g4
loop_1731:
	movrne	%i1,	0x062,	%i3
	movrne	%o1,	%o0,	%g7
	fbne	%fcc0,	loop_1732
	fmul8x16al	%f17,	%f30,	%f28
	fmul8sux16	%f30,	%f6,	%f14
	array8	%g1,	%g3,	%i7
loop_1732:
	edge32ln	%l3,	%i5,	%l2
	umul	%o4,	0x049F,	%i0
	edge16l	%l5,	%l1,	%i6
	nop
	setx	loop_1733,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpackfix	%f6,	%f25
	brlz	%g2,	loop_1734
	edge16n	%i4,	%o6,	%o7
loop_1733:
	fbe,a	%fcc3,	loop_1735
	addccc	%l4,	0x0B0B,	%g5
loop_1734:
	subcc	%l0,	0x0C8D,	%o2
	orn	%o3,	%g6,	%o5
loop_1735:
	array8	%l6,	%i2,	%g4
	fones	%f26
	taddcctv	%i1,	0x1DFC,	%o1
	or	%i3,	%g7,	%o0
	fbe	%fcc1,	loop_1736
	sth	%g3,	[%l7 + 0x08]
	movgu	%xcc,	%g1,	%l3
	fbge,a	%fcc1,	loop_1737
loop_1736:
	brnz,a	%i5,	loop_1738
	taddcctv	%i7,	0x03D3,	%o4
	sdivx	%l2,	0x1FAA,	%l5
loop_1737:
	fmovdle	%xcc,	%f16,	%f18
loop_1738:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	ldsb	[%l7 + 0x35],	%i0
	fmovrdne	%i6,	%f20,	%f30
	tsubcctv	%g2,	0x007C,	%i4
	edge16	%o6,	%l1,	%l4
	array8	%g5,	%o7,	%o2
	brlez,a	%l0,	loop_1739
	movvs	%icc,	%g6,	%o3
	edge8	%o5,	%l6,	%g4
	lduw	[%l7 + 0x18],	%i1
loop_1739:
	fba,a	%fcc3,	loop_1740
	movrne	%o1,	%i2,	%g7
	stw	%o0,	[%l7 + 0x18]
	tl	%icc,	0x4
loop_1740:
	alignaddrl	%g3,	%g1,	%l3
	set	0x68, %i7
	lda	[%l7 + %i7] 0x04,	%f20
	movcc	%xcc,	%i5,	%i3
	movcc	%xcc,	%o4,	%l2
	fandnot1s	%f7,	%f30,	%f0
	fmovsvs	%xcc,	%f24,	%f7
	udiv	%i7,	0x1732,	%l5
	prefetch	[%l7 + 0x5C],	 0x1
	edge8	%i0,	%i6,	%i4
	addc	%g2,	0x0219,	%o6
	set	0x70, %o2
	ldsha	[%l7 + %o2] 0x10,	%l1
	taddcctv	%l4,	%o7,	%g5
	sth	%l0,	[%l7 + 0x7E]
	movleu	%xcc,	%g6,	%o3
	fbul	%fcc3,	loop_1741
	bneg,a,pt	%icc,	loop_1742
	umul	%o2,	0x0353,	%o5
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x24] %asi
loop_1741:
	fbn	%fcc1,	loop_1743
loop_1742:
	alignaddrl	%l6,	%g4,	%o1
	fxors	%f0,	%f15,	%f27
	lduh	[%l7 + 0x42],	%i2
loop_1743:
	tcc	%icc,	0x6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x30] %asi,	%g7
	fmuld8sux16	%f10,	%f14,	%f20
	orcc	%i1,	0x03A2,	%o0
	fpsub16s	%f18,	%f23,	%f12
	sethi	0x1263,	%g1
	andncc	%l3,	%g3,	%i5
	orn	%o4,	0x0DF0,	%l2
	movvc	%xcc,	%i3,	%i7
	edge32ln	%l5,	%i0,	%i4
	movcs	%icc,	%i6,	%o6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%g2
	bne	loop_1744
	bvs,pn	%icc,	loop_1745
	nop
	setx	loop_1746,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%l4
loop_1744:
	tleu	%icc,	0x4
loop_1745:
	tle	%xcc,	0x6
loop_1746:
	nop
	set	0x00, %i1
	ldxa	[%g0 + %i1] 0x50,	%l1
	wr	%g0,	0x18,	%asi
	sta	%f22,	[%l7 + 0x44] %asi
	edge8ln	%o7,	%g5,	%g6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o3
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bn,a	%icc,	loop_1747
	and	%o2,	%l0,	%o5
	orncc	%g4,	0x13D6,	%o1
	brlez	%i2,	loop_1748
loop_1747:
	alignaddr	%l6,	%g7,	%o0
	sub	%g1,	0x10E7,	%l3
	array32	%g3,	%i5,	%o4
loop_1748:
	ldd	[%l7 + 0x40],	%f4
	movrgez	%l2,	0x224,	%i3
	umul	%i1,	%l5,	%i0
	edge32n	%i7,	%i6,	%o6
	udivx	%g2,	0x1D6B,	%i4
	fnegs	%f18,	%f0
	fcmpne32	%f24,	%f2,	%l4
	fbl	%fcc2,	loop_1749
	brz,a	%l1,	loop_1750
	alignaddr	%g5,	%o7,	%o3
	bge	loop_1751
loop_1749:
	fbge,a	%fcc3,	loop_1752
loop_1750:
	tpos	%icc,	0x6
	movg	%icc,	%g6,	%o2
loop_1751:
	ble,pt	%xcc,	loop_1753
loop_1752:
	fones	%f27
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x08] %asi,	%l0
loop_1753:
	fmovscc	%icc,	%f14,	%f27
	bn	%xcc,	loop_1754
	fsrc1	%f28,	%f10
	movle	%icc,	%g4,	%o5
	subccc	%i2,	0x1F9B,	%l6
loop_1754:
	sethi	0x0FC8,	%o1
	std	%g6,	[%l7 + 0x18]
	movg	%icc,	%g1,	%l3
	fmovscs	%icc,	%f23,	%f15
	or	%o0,	0x1B75,	%g3
	fmovrdgez	%o4,	%f18,	%f20
	movcc	%icc,	%i5,	%i3
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x18,	%i0
	set	0x6A, %l4
	stha	%l2,	[%l7 + %l4] 0x22
	membar	#Sync
	add	%l5,	%i0,	%i6
	nop
	setx	loop_1755,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%i6,	[%l7 + 0x78]
	andncc	%g2,	%o6,	%l4
	brlz,a	%i4,	loop_1756
loop_1755:
	subccc	%l1,	%g5,	%o7
	brgez,a	%g6,	loop_1757
	fmuld8ulx16	%f6,	%f11,	%f30
loop_1756:
	nop
	setx	loop_1758,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1s	%f4,	%f10,	%f15
loop_1757:
	alignaddrl	%o2,	%o3,	%g4
	te	%icc,	0x4
loop_1758:
	popc	%l0,	%o5
	tcs	%xcc,	0x4
	sdivx	%i2,	0x0F0C,	%l6
	fornot2s	%f7,	%f2,	%f31
	movpos	%icc,	%o1,	%g1
	flush	%l7 + 0x1C
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x50] %asi,	%l3
	orn	%g7,	%o0,	%o4
	fba	%fcc1,	loop_1759
	movg	%xcc,	%g3,	%i5
	pdist	%f12,	%f8,	%f16
	nop
	set	0x1E, %l1
	ldsb	[%l7 + %l1],	%i3
loop_1759:
	movleu	%icc,	%l2,	%i1
	tvc	%xcc,	0x0
	popc	0x168E,	%l5
	fandnot1s	%f16,	%f22,	%f16
	edge8n	%i6,	%i7,	%g2
	wr	%g0,	0xea,	%asi
	stba	%i0,	[%l7 + 0x29] %asi
	membar	#Sync
	fbu,a	%fcc3,	loop_1760
	ldstub	[%l7 + 0x7B],	%o6
	alignaddrl	%l4,	%i4,	%l1
	call	loop_1761
loop_1760:
	orn	%o7,	%g5,	%g6
	movg	%xcc,	%o3,	%g4
	fpackfix	%f0,	%f25
loop_1761:
	movl	%icc,	%l0,	%o5
	fmovsl	%icc,	%f26,	%f0
	fba	%fcc3,	loop_1762
	fmovrsgz	%i2,	%f4,	%f1
	fnand	%f26,	%f24,	%f2
	ldsh	[%l7 + 0x7E],	%o2
loop_1762:
	sll	%o1,	0x04,	%l6
	wr	%g0,	0x0c,	%asi
	sta	%f14,	[%l7 + 0x3C] %asi
	fxor	%f24,	%f0,	%f6
	popc	%l3,	%g7
	edge8n	%o0,	%g1,	%o4
	fmovdleu	%icc,	%f30,	%f16
	movpos	%icc,	%i5,	%i3
	stw	%g3,	[%l7 + 0x6C]
	movle	%xcc,	%l2,	%i1
	std	%i6,	[%l7 + 0x78]
	movpos	%xcc,	%l5,	%g2
	movcs	%xcc,	%i7,	%o6
	ble,pn	%xcc,	loop_1763
	fbul,a	%fcc3,	loop_1764
	sll	%l4,	%i4,	%l1
	movrgez	%o7,	0x305,	%i0
loop_1763:
	umul	%g5,	0x109C,	%g6
loop_1764:
	subccc	%g4,	0x037E,	%o3
	membar	0x0B
	fmovsle	%xcc,	%f27,	%f23
	movne	%icc,	%l0,	%o5
	lduh	[%l7 + 0x3A],	%i2
	taddcc	%o2,	%l6,	%o1
	call	loop_1765
	sethi	0x1403,	%g7
	sir	0x0859
	fmovsl	%xcc,	%f18,	%f16
loop_1765:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%l3,	[%l7 + 0x68] %asi
	mulscc	%o0,	%g1,	%o4
	fmul8ulx16	%f6,	%f22,	%f2
	tne	%icc,	0x2
	fmovrdne	%i3,	%f6,	%f0
	sth	%g3,	[%l7 + 0x0C]
	tgu	%xcc,	0x5
	fpsub16s	%f11,	%f29,	%f8
	set	0x54, %l6
	ldswa	[%l7 + %l6] 0x04,	%l2
	tleu	%xcc,	0x3
	sdivcc	%i1,	0x1807,	%i6
	brnz,a	%i5,	loop_1766
	fornot1s	%f31,	%f0,	%f14
	tg	%xcc,	0x1
	smul	%l5,	%g2,	%o6
loop_1766:
	fbn	%fcc2,	loop_1767
	fmovdleu	%icc,	%f26,	%f24
	fbul	%fcc0,	loop_1768
	edge8l	%l4,	%i7,	%l1
loop_1767:
	tcs	%xcc,	0x1
	array16	%o7,	%i0,	%i4
loop_1768:
	fpackfix	%f30,	%f21
	taddcc	%g5,	%g4,	%o3
	orn	%l0,	%o5,	%i2
	fmul8x16	%f18,	%f28,	%f30
	edge8l	%g6,	%l6,	%o2
	movne	%xcc,	%g7,	%o1
	movcc	%icc,	%o0,	%l3
	fbn	%fcc3,	loop_1769
	edge32n	%g1,	%o4,	%i3
	prefetch	[%l7 + 0x14],	 0x0
	edge32ln	%g3,	%l2,	%i1
loop_1769:
	mulx	%i6,	0x115C,	%i5
	ldsh	[%l7 + 0x4E],	%l5
	fbe,a	%fcc1,	loop_1770
	tsubcc	%g2,	0x04AA,	%o6
	tvs	%icc,	0x6
	brnz,a	%l4,	loop_1771
loop_1770:
	tvc	%xcc,	0x6
	subc	%l1,	0x1CDC,	%o7
	tcc	%xcc,	0x2
loop_1771:
	nop
	set	0x35, %g7
	stb	%i0,	[%l7 + %g7]
	movneg	%icc,	%i7,	%i4
	nop
	setx loop_1772, %l0, %l1
	jmpl %l1, %g5
	fpadd32	%f6,	%f14,	%f2
	nop
	setx	loop_1773,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%o3,	0x07E3,	%g4
loop_1772:
	tg	%icc,	0x2
	ldsb	[%l7 + 0x7C],	%o5
loop_1773:
	fmovdvc	%xcc,	%f31,	%f6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3F] %asi,	%i2
	movn	%xcc,	%g6,	%l6
	ldsb	[%l7 + 0x3B],	%o2
	mova	%xcc,	%g7,	%l0
	bg,a	loop_1774
	movl	%icc,	%o1,	%o0
	fbul	%fcc3,	loop_1775
	fandnot2	%f8,	%f6,	%f12
loop_1774:
	taddcc	%l3,	%o4,	%i3
	fors	%f10,	%f4,	%f2
loop_1775:
	sllx	%g3,	%l2,	%i1
	subc	%g1,	%i5,	%l5
	fble,a	%fcc3,	loop_1776
	bvc,pn	%icc,	loop_1777
	edge8l	%i6,	%o6,	%g2
	fmovdneg	%xcc,	%f7,	%f3
loop_1776:
	tne	%icc,	0x0
loop_1777:
	fnors	%f9,	%f14,	%f17
	set	0x58, %l5
	stda	%l4,	[%l7 + %l5] 0xe3
	membar	#Sync
	fbe,a	%fcc1,	loop_1778
	sir	0x1781
	tne	%icc,	0x7
	fmul8x16	%f25,	%f28,	%f28
loop_1778:
	add	%l1,	%o7,	%i7
	srax	%i4,	%g5,	%i0
	fandnot1s	%f3,	%f23,	%f5
	wr	%g0,	0x2f,	%asi
	stha	%o3,	[%l7 + 0x74] %asi
	membar	#Sync
	fpadd32	%f4,	%f10,	%f8
	movg	%icc,	%g4,	%i2
	srl	%g6,	%l6,	%o5
	fnegs	%f1,	%f6
	fmovsleu	%icc,	%f7,	%f31
	bn,a,pn	%xcc,	loop_1779
	movvs	%xcc,	%o2,	%g7
	umulcc	%o1,	%l0,	%o0
	fnands	%f20,	%f29,	%f6
loop_1779:
	fmul8x16au	%f29,	%f19,	%f0
	edge8	%o4,	%l3,	%i3
	fbg	%fcc0,	loop_1780
	edge8l	%g3,	%l2,	%i1
	taddcc	%i5,	%l5,	%i6
	membar	0x01
loop_1780:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	popc	0x142F,	%g1
	fbule,a	%fcc1,	loop_1781
	fnand	%f16,	%f22,	%f2
	sra	%g2,	%o6,	%l1
	set	0x0B, %i0
	lduba	[%l7 + %i0] 0x19,	%l4
loop_1781:
	faligndata	%f0,	%f16,	%f14
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i7
	tcs	%xcc,	0x4
	fmovdge	%xcc,	%f23,	%f4
	tn	%icc,	0x7
	sdivcc	%i4,	0x1873,	%o7
	orcc	%g5,	0x0383,	%o3
	srlx	%g4,	%i2,	%g6
	movcc	%icc,	%l6,	%i0
	fmovsvc	%xcc,	%f25,	%f19
	movrne	%o2,	0x07E,	%o5
	tvs	%icc,	0x5
	fpadd32	%f20,	%f16,	%f18
	tne	%icc,	0x2
	xnorcc	%g7,	%l0,	%o1
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x80,	%o4
	movrgez	%l3,	0x0C9,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o0,	%l2
	and	%g3,	0x1B3F,	%i1
	taddcc	%i5,	0x05DC,	%i6
	fornot1s	%f21,	%f19,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f26,	%f28,	%f16
	edge32n	%l5,	%g2,	%g1
	array16	%o6,	%l4,	%i7
	fba,a	%fcc1,	loop_1782
	brgez	%l1,	loop_1783
	fmovsgu	%xcc,	%f21,	%f19
	fnot2s	%f7,	%f18
loop_1782:
	movcs	%icc,	%o7,	%g5
loop_1783:
	edge16ln	%o3,	%g4,	%i2
	tl	%icc,	0x0
	fblg	%fcc1,	loop_1784
	edge16	%i4,	%l6,	%i0
	fbge,a	%fcc3,	loop_1785
	stx	%o2,	[%l7 + 0x40]
loop_1784:
	tcc	%xcc,	0x3
	alignaddrl	%o5,	%g6,	%g7
loop_1785:
	ble,a	loop_1786
	fmuld8ulx16	%f24,	%f4,	%f22
	tvc	%icc,	0x1
	prefetch	[%l7 + 0x28],	 0x2
loop_1786:
	siam	0x0
	movcs	%icc,	%l0,	%o1
	movg	%icc,	%o4,	%l3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	or	%o0,	0x05C3,	%i3
	fnand	%f4,	%f2,	%f16
	and	%l2,	%i1,	%i5
	tg	%xcc,	0x3
	st	%f28,	[%l7 + 0x58]
	te	%icc,	0x4
	tl	%icc,	0x6
	movrne	%g3,	0x1AB,	%l5
	bvc,a	%xcc,	loop_1787
	fmovspos	%xcc,	%f1,	%f4
	mulx	%g2,	0x1583,	%i6
	edge16l	%o6,	%g1,	%i7
loop_1787:
	bpos,pn	%icc,	loop_1788
	tne	%icc,	0x2
	subccc	%l1,	%l4,	%o7
	movpos	%icc,	%o3,	%g4
loop_1788:
	fnegs	%f25,	%f8
	fabsd	%f18,	%f28
	tne	%icc,	0x2
	srax	%i2,	%i4,	%l6
	fmovdl	%xcc,	%f26,	%f31
	popc	%g5,	%o2
	movneg	%icc,	%o5,	%g6
	tg	%icc,	0x6
	xorcc	%g7,	0x1442,	%l0
	bn,pt	%icc,	loop_1789
	fxnors	%f1,	%f11,	%f10
	add	%o1,	0x10BD,	%o4
	srlx	%l3,	%i0,	%i3
loop_1789:
	fnors	%f2,	%f22,	%f18
	edge32ln	%o0,	%l2,	%i1
	set	0x34, %o5
	stha	%g3,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x40, %g3
	prefetcha	[%l7 + %g3] 0x11,	 0x3
	fcmpeq16	%f18,	%f4,	%g2
	movcs	%icc,	%l5,	%i6
	array8	%g1,	%i7,	%l1
	tvc	%xcc,	0x5
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8n	%l4,	%o6,	%o3
	edge32	%o7,	%g4,	%i2
	bl,a,pn	%xcc,	loop_1790
	fblg	%fcc0,	loop_1791
	fmovrsgz	%l6,	%f14,	%f4
	bshuffle	%f0,	%f12,	%f18
loop_1790:
	movl	%xcc,	%i4,	%g5
loop_1791:
	fbul,a	%fcc0,	loop_1792
	subccc	%o5,	0x1905,	%g6
	tpos	%xcc,	0x4
	fbue,a	%fcc3,	loop_1793
loop_1792:
	edge8n	%o2,	%l0,	%o1
	fcmpd	%fcc0,	%f8,	%f12
	xnorcc	%o4,	%l3,	%i0
loop_1793:
	lduw	[%l7 + 0x64],	%i3
	ldsb	[%l7 + 0x49],	%g7
	fmovsl	%xcc,	%f29,	%f11
	fmovse	%icc,	%f6,	%f9
	fpsub16s	%f18,	%f9,	%f23
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%o0
	edge8n	%l2,	%g3,	%i1
	xorcc	%g2,	%l5,	%i6
	membar	0x44
	tpos	%xcc,	0x5
	fcmple32	%f6,	%f28,	%g1
	fbuge	%fcc2,	loop_1794
	fmovsne	%xcc,	%f20,	%f1
	movvs	%icc,	%i7,	%l1
	set	0x0C, %i5
	swapa	[%l7 + %i5] 0x89,	%i5
loop_1794:
	movpos	%xcc,	%o6,	%o3
	call	loop_1795
	movl	%xcc,	%o7,	%l4
	xnor	%i2,	0x1555,	%g4
	add	%i4,	0x1F37,	%g5
loop_1795:
	tvc	%icc,	0x3
	movne	%xcc,	%o5,	%l6
	addccc	%o2,	0x1494,	%l0
	tn	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f17
	fcmple16	%f2,	%f2,	%o1
	subccc	%g6,	%o4,	%i0
	sdiv	%i3,	0x1178,	%l3
	fmul8x16	%f2,	%f12,	%f16
	fabss	%f5,	%f15
	movl	%xcc,	%o0,	%l2
	tl	%icc,	0x5
	mulx	%g3,	%i1,	%g7
	edge32	%l5,	%g2,	%g1
	movleu	%xcc,	%i6,	%i7
	fmovrdne	%l1,	%f16,	%f4
	tsubcc	%o6,	0x09D6,	%i5
	and	%o3,	0x116D,	%o7
	edge8l	%i2,	%l4,	%g4
	alignaddr	%i4,	%o5,	%g5
	bpos	loop_1796
	tcs	%xcc,	0x7
	tpos	%xcc,	0x1
	nop
	setx	loop_1797,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1796:
	membar	0x14
	ta	%icc,	0x4
	membar	0x15
loop_1797:
	fcmpne32	%f10,	%f16,	%l6
	fcmped	%fcc1,	%f24,	%f18
	swap	[%l7 + 0x40],	%l0
	movle	%xcc,	%o2,	%g6
	fabsd	%f14,	%f2
	array8	%o4,	%o1,	%i0
	tsubcc	%l3,	%i3,	%l2
	tgu	%xcc,	0x6
	umul	%o0,	0x1A67,	%i1
	fmovscc	%xcc,	%f22,	%f29
	wr	%g0,	0xea,	%asi
	stwa	%g7,	[%l7 + 0x38] %asi
	membar	#Sync
	movvc	%icc,	%g3,	%l5
	srlx	%g1,	%i6,	%g2
	std	%l0,	[%l7 + 0x38]
	taddcctv	%i7,	0x0117,	%o6
	fpsub16	%f2,	%f30,	%f10
	movneg	%xcc,	%o3,	%o7
	tgu	%xcc,	0x5
	sethi	0x03FF,	%i2
	fpmerge	%f2,	%f18,	%f22
	fmovdge	%icc,	%f1,	%f3
	movvs	%icc,	%i5,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l4,	%o5,	%g5
	fmovrse	%i4,	%f12,	%f14
	fba	%fcc2,	loop_1798
	srl	%l0,	%l6,	%g6
	edge32ln	%o2,	%o4,	%i0
	edge8l	%l3,	%o1,	%l2
loop_1798:
	addc	%o0,	0x1107,	%i1
	addccc	%g7,	%i3,	%g3
	st	%f18,	[%l7 + 0x64]
	subccc	%l5,	%i6,	%g1
	popc	%l1,	%i7
	tcs	%icc,	0x7
	fmovrsne	%g2,	%f10,	%f2
	fmovrsgez	%o3,	%f25,	%f14
	tne	%icc,	0x7
	xorcc	%o6,	%i2,	%o7
	andn	%i5,	%g4,	%o5
	udiv	%l4,	0x180F,	%g5
	fpadd32	%f8,	%f4,	%f6
	fxor	%f20,	%f4,	%f30
	movle	%xcc,	%l0,	%l6
	umulcc	%g6,	0x142B,	%o2
	udivcc	%i4,	0x0577,	%i0
	tl	%xcc,	0x4
	srl	%l3,	0x10,	%o1
	fmovdcc	%xcc,	%f16,	%f16
	fbug	%fcc3,	loop_1799
	tvs	%xcc,	0x6
	sethi	0x0BD9,	%o4
	fzeros	%f16
loop_1799:
	fpadd16	%f10,	%f6,	%f20
	bl,pn	%icc,	loop_1800
	tvs	%icc,	0x5
	array8	%l2,	%i1,	%g7
	ldsh	[%l7 + 0x42],	%o0
loop_1800:
	tn	%icc,	0x3
	fpadd32s	%f2,	%f8,	%f23
	fbug	%fcc2,	loop_1801
	fpack16	%f20,	%f19
	fmovdn	%xcc,	%f0,	%f26
	fornot1	%f26,	%f26,	%f30
loop_1801:
	fcmped	%fcc2,	%f24,	%f16
	fbo	%fcc3,	loop_1802
	tcc	%xcc,	0x2
	bneg,a	loop_1803
	movcc	%xcc,	%i3,	%l5
loop_1802:
	umul	%i6,	%g1,	%l1
	fcmpne32	%f12,	%f14,	%g3
loop_1803:
	edge32ln	%g2,	%o3,	%o6
	and	%i7,	%o7,	%i2
	set	0x59, %g2
	lduba	[%l7 + %g2] 0x0c,	%g4
	ld	[%l7 + 0x64],	%f23
	sdiv	%o5,	0x0D20,	%i5
	tge	%icc,	0x7
	tne	%xcc,	0x2
	edge32l	%l4,	%l0,	%l6
	movrlz	%g6,	%g5,	%i4
	fpsub16s	%f12,	%f28,	%f29
	stw	%i0,	[%l7 + 0x6C]
	sub	%l3,	0x1629,	%o2
	brlz,a	%o4,	loop_1804
	fsrc2	%f18,	%f2
	popc	0x0068,	%o1
	fzeros	%f8
loop_1804:
	mulscc	%i1,	0x0E49,	%l2
	fmovdgu	%xcc,	%f7,	%f22
	set	0x72, %g1
	ldsba	[%l7 + %g1] 0x81,	%o0
	movleu	%xcc,	%g7,	%i3
	tsubcctv	%i6,	%l5,	%g1
	smulcc	%g3,	%l1,	%o3
	tn	%xcc,	0x7
	andn	%o6,	%i7,	%o7
	fbug,a	%fcc2,	loop_1805
	movrne	%i2,	0x153,	%g4
	fmovdleu	%xcc,	%f10,	%f23
	fmuld8ulx16	%f8,	%f15,	%f10
loop_1805:
	brz	%g2,	loop_1806
	movcs	%xcc,	%o5,	%i5
	set	0x2E, %g4
	lduha	[%l7 + %g4] 0x88,	%l0
loop_1806:
	movvc	%xcc,	%l4,	%g6
	fmovsvc	%icc,	%f14,	%f16
	ba,pt	%icc,	loop_1807
	mulx	%l6,	0x1811,	%g5
	movneg	%xcc,	%i0,	%i4
	tl	%icc,	0x7
loop_1807:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f5,	%f13
	movl	%xcc,	%o2,	%l3
	brgez,a	%o4,	loop_1808
	fnot2	%f8,	%f12
	fbn,a	%fcc1,	loop_1809
	bcc	%icc,	loop_1810
loop_1808:
	addccc	%i1,	%o1,	%o0
	sllx	%g7,	%i3,	%i6
loop_1809:
	edge32ln	%l5,	%g1,	%l2
loop_1810:
	fmovrdlez	%g3,	%f20,	%f8
	edge16ln	%o3,	%o6,	%i7
	fmovdcs	%xcc,	%f14,	%f29
	stbar
	movneg	%icc,	%l1,	%i2
	fbul	%fcc1,	loop_1811
	sethi	0x1EC3,	%g4
	brgez	%o7,	loop_1812
	fnegs	%f13,	%f13
loop_1811:
	sdivx	%o5,	0x0007,	%i5
	andn	%l0,	%g2,	%l4
loop_1812:
	edge16l	%l6,	%g6,	%i0
	addc	%g5,	0x16EB,	%i4
	te	%icc,	0x5
	move	%xcc,	%o2,	%o4
	edge8n	%i1,	%o1,	%o0
	flush	%l7 + 0x54
	orcc	%g7,	%i3,	%i6
	fcmped	%fcc2,	%f4,	%f10
	fbg,a	%fcc1,	loop_1813
	bl,a,pt	%icc,	loop_1814
	fmovdl	%xcc,	%f22,	%f28
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l3,	%g1
loop_1813:
	smul	%l5,	0x0270,	%l2
loop_1814:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g3,	%o6
	mulx	%o3,	0x0524,	%i7
	orn	%l1,	0x126F,	%g4
	xnor	%o7,	%i2,	%i5
	addccc	%o5,	%g2,	%l4
	fbg	%fcc0,	loop_1815
	brgez,a	%l6,	loop_1816
	tvs	%icc,	0x5
	edge16ln	%l0,	%g6,	%i0
loop_1815:
	tsubcc	%g5,	0x0B43,	%o2
loop_1816:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%o4,	[%l7 + 0x38] %asi
	taddcc	%i4,	0x13F1,	%i1
	fmovsneg	%xcc,	%f1,	%f0
	srlx	%o0,	%o1,	%i3
	edge16n	%g7,	%i6,	%g1
	taddcctv	%l5,	%l3,	%g3
	mulx	%o6,	%o3,	%l2
	bshuffle	%f10,	%f22,	%f24
	bcc	%icc,	loop_1817
	edge16	%i7,	%g4,	%o7
	movrne	%l1,	%i2,	%o5
	ble,a,pt	%icc,	loop_1818
loop_1817:
	array32	%i5,	%g2,	%l4
	sth	%l0,	[%l7 + 0x2C]
	fcmple32	%f10,	%f30,	%l6
loop_1818:
	movrlz	%i0,	%g5,	%g6
	subccc	%o2,	0x1FA6,	%i4
	sdivx	%o4,	0x1240,	%i1
	fnegs	%f20,	%f20
	sub	%o0,	%i3,	%o1
	fmovsvc	%icc,	%f30,	%f7
	bg,a	loop_1819
	lduw	[%l7 + 0x48],	%i6
	fsrc1	%f2,	%f24
	brlz,a	%g1,	loop_1820
loop_1819:
	stb	%g7,	[%l7 + 0x0F]
	udivx	%l3,	0x0C91,	%l5
	edge32n	%g3,	%o3,	%l2
loop_1820:
	fblg,a	%fcc0,	loop_1821
	udiv	%o6,	0x1028,	%i7
	te	%xcc,	0x5
	fbg	%fcc0,	loop_1822
loop_1821:
	movgu	%xcc,	%o7,	%g4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%l1
loop_1822:
	movrlz	%o5,	0x16F,	%i2
	fcmpne16	%f12,	%f16,	%g2
	bcc,pn	%icc,	loop_1823
	edge32n	%l4,	%i5,	%l6
	fornot2s	%f6,	%f20,	%f30
	movrgez	%i0,	0x257,	%l0
loop_1823:
	nop
	setx loop_1824, %l0, %l1
	jmpl %l1, %g6
	movrgez	%o2,	%i4,	%g5
	edge32	%o4,	%i1,	%o0
	edge16	%o1,	%i6,	%i3
loop_1824:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f28,	%f8,	%g7
	fcmpd	%fcc2,	%f10,	%f12
	fandnot1	%f4,	%f8,	%f16
	smul	%g1,	%l3,	%g3
	fcmpne32	%f2,	%f20,	%o3
	sethi	0x180C,	%l2
	movne	%xcc,	%l5,	%o6
	movpos	%icc,	%i7,	%g4
	fmuld8sux16	%f17,	%f9,	%f20
	fbo	%fcc3,	loop_1825
	movn	%xcc,	%o7,	%o5
	or	%l1,	%i2,	%g2
	membar	0x6D
loop_1825:
	bl,pt	%icc,	loop_1826
	mulscc	%i5,	%l6,	%l4
	subc	%i0,	0x1F01,	%l0
	sll	%g6,	0x0D,	%i4
loop_1826:
	array8	%o2,	%o4,	%g5
	andncc	%o0,	%o1,	%i6
	sdivx	%i1,	0x0D94,	%g7
	fors	%f12,	%f0,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g1,	0x0195,	%i3
	fmovse	%icc,	%f11,	%f29
	sth	%l3,	[%l7 + 0x78]
	fmovsle	%icc,	%f18,	%f26
	set	0x20, %g5
	stxa	%o3,	[%l7 + %g5] 0x23
	membar	#Sync
	fmovdn	%icc,	%f19,	%f20
	fornot1s	%f17,	%f16,	%f2
	subccc	%g3,	0x0623,	%l2
	set	0x48, %l3
	lduha	[%l7 + %l3] 0x0c,	%o6
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%l4
	and	%g4,	%o7,	%o5
	add	%i7,	0x0814,	%l1
	tgu	%xcc,	0x0
	sra	%g2,	0x1C,	%i5
	fmovdne	%icc,	%f6,	%f17
	fmovdle	%icc,	%f30,	%f21
	tge	%icc,	0x0
	xorcc	%i2,	%l6,	%l4
	andn	%l0,	%i0,	%i4
	array32	%o2,	%g6,	%o4
	fbul	%fcc2,	loop_1827
	ldx	[%l7 + 0x20],	%o0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1827:
	subc	%o1,	%i6,	%g5
	stb	%g7,	[%l7 + 0x65]
	edge32n	%g1,	%i3,	%i1
	tpos	%xcc,	0x2
	xnor	%l3,	0x0540,	%o3
	bvs,a,pn	%xcc,	loop_1828
	subccc	%l2,	%g3,	%l5
	nop
	setx	loop_1829,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x1
loop_1828:
	edge32n	%g4,	%o6,	%o7
	stb	%o5,	[%l7 + 0x09]
loop_1829:
	nop
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x19
	fornot2	%f26,	%f30,	%f28
	fcmpne32	%f8,	%f24,	%l1
	fmovsle	%icc,	%f1,	%f2
	sdivcc	%i7,	0x1E7A,	%g2
	movrgz	%i2,	%i5,	%l4
	orncc	%l0,	0x1420,	%l6
	tneg	%icc,	0x5
	fbe,a	%fcc0,	loop_1830
	smulcc	%i4,	%o2,	%i0
	mulx	%o4,	%o0,	%o1
	sra	%i6,	0x17,	%g6
loop_1830:
	fmovdl	%xcc,	%f31,	%f21
	movneg	%icc,	%g5,	%g7
	movl	%xcc,	%i3,	%g1
	brnz,a	%i1,	loop_1831
	addccc	%o3,	0x01FF,	%l2
	movrlz	%g3,	0x389,	%l3
	sll	%l5,	%o6,	%g4
loop_1831:
	subccc	%o7,	%l1,	%o5
	movgu	%xcc,	%i7,	%i2
	fbug	%fcc0,	loop_1832
	taddcc	%i5,	0x0F2E,	%l4
	pdist	%f30,	%f6,	%f4
	membar	0x01
loop_1832:
	fcmpeq16	%f8,	%f30,	%g2
	sth	%l6,	[%l7 + 0x7C]
	fors	%f23,	%f26,	%f3
	taddcctv	%l0,	%o2,	%i4
	srlx	%i0,	%o0,	%o4
	ldsb	[%l7 + 0x0F],	%i6
	brlez	%o1,	loop_1833
	mova	%xcc,	%g6,	%g7
	nop
	setx	loop_1834,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbge,a	%fcc0,	loop_1835
loop_1833:
	movvc	%icc,	%i3,	%g5
	swap	[%l7 + 0x5C],	%i1
loop_1834:
	tleu	%icc,	0x5
loop_1835:
	fmovrslz	%o3,	%f4,	%f3
	ld	[%l7 + 0x3C],	%f26
	fbul,a	%fcc1,	loop_1836
	edge32l	%l2,	%g1,	%l3
	array16	%g3,	%l5,	%o6
	brlez	%g4,	loop_1837
loop_1836:
	sub	%l1,	0x1784,	%o5
	fcmpd	%fcc0,	%f12,	%f8
	ldx	[%l7 + 0x18],	%i7
loop_1837:
	xnor	%i2,	0x088C,	%o7
	swap	[%l7 + 0x78],	%i5
	swap	[%l7 + 0x48],	%l4
	tvs	%icc,	0x6
	stw	%l6,	[%l7 + 0x38]
	sllx	%l0,	%g2,	%o2
	nop
	setx	loop_1838,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x48],	%i4
	fnand	%f10,	%f10,	%f6
	tg	%icc,	0x5
loop_1838:
	xor	%o0,	%o4,	%i0
	and	%o1,	0x06C3,	%i6
	mulscc	%g6,	%g7,	%g5
	addc	%i3,	0x1741,	%i1
	fmovdleu	%xcc,	%f27,	%f6
	stb	%o3,	[%l7 + 0x35]
	subc	%l2,	0x113E,	%g1
	fmovrdlez	%g3,	%f18,	%f22
	edge16	%l3,	%o6,	%g4
	movle	%icc,	%l1,	%o5
	sdivcc	%i7,	0x17A3,	%i2
	fmovsne	%icc,	%f18,	%f1
	siam	0x2
	nop
	setx	loop_1839,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrde	%l5,	%f28,	%f2
	and	%o7,	0x1A2C,	%l4
	subccc	%i5,	0x1FFD,	%l6
loop_1839:
	be	%xcc,	loop_1840
	edge32n	%g2,	%o2,	%l0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x2C] %asi,	%o0
loop_1840:
	fmovdgu	%xcc,	%f11,	%f28
	bgu,a	%xcc,	loop_1841
	tge	%icc,	0x7
	movrne	%i4,	%o4,	%o1
	set	0x52, %o7
	ldstuba	[%l7 + %o7] 0x18,	%i6
loop_1841:
	fmovrdgz	%i0,	%f14,	%f6
	sdivx	%g7,	0x0208,	%g5
	fcmpgt32	%f6,	%f26,	%i3
	movgu	%icc,	%i1,	%g6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f8
	fbne	%fcc3,	loop_1842
	movgu	%xcc,	%l2,	%g1
	std	%f12,	[%l7 + 0x08]
	set	0x24, %g6
	stwa	%o3,	[%l7 + %g6] 0x23
	membar	#Sync
loop_1842:
	fmovsleu	%icc,	%f20,	%f17
	andcc	%g3,	%l3,	%o6
	movcs	%icc,	%l1,	%g4
	prefetch	[%l7 + 0x28],	 0x0
	tgu	%xcc,	0x5
	xnorcc	%o5,	%i2,	%i7
	bvc,a,pn	%icc,	loop_1843
	orn	%l5,	0x163B,	%o7
	tleu	%icc,	0x0
	alignaddrl	%i5,	%l6,	%g2
loop_1843:
	edge16l	%o2,	%l4,	%o0
	stbar
	edge8l	%l0,	%i4,	%o4
	orcc	%i6,	%o1,	%i0
	fmul8ulx16	%f4,	%f24,	%f12
	fbue	%fcc1,	loop_1844
	edge32l	%g5,	%g7,	%i1
	movge	%xcc,	%g6,	%i3
	fmovrdlz	%l2,	%f26,	%f20
loop_1844:
	ldd	[%l7 + 0x18],	%f12
	andncc	%g1,	%o3,	%g3
	sth	%l3,	[%l7 + 0x4C]
	sll	%o6,	%g4,	%l1
	fnot1s	%f7,	%f11
	mova	%icc,	%i2,	%o5
	set	0x1E, %i2
	lduba	[%l7 + %i2] 0x88,	%l5
	edge16n	%i7,	%i5,	%l6
	taddcc	%o7,	0x1B97,	%o2
	srl	%g2,	%l4,	%l0
	fbe,a	%fcc2,	loop_1845
	sir	0x05D9
	fsrc1	%f0,	%f10
	movrlez	%o0,	%o4,	%i4
loop_1845:
	lduw	[%l7 + 0x50],	%i6
	ldsb	[%l7 + 0x53],	%i0
	fabss	%f21,	%f7
	tgu	%xcc,	0x2
	sub	%g5,	0x016C,	%o1
	fblg,a	%fcc3,	loop_1846
	sra	%i1,	%g6,	%g7
	fbuge	%fcc1,	loop_1847
	srlx	%i3,	%l2,	%o3
loop_1846:
	orcc	%g3,	%g1,	%l3
	stx	%g4,	[%l7 + 0x40]
loop_1847:
	movrgz	%l1,	%i2,	%o6
	fpack32	%f14,	%f30,	%f4
	fmovsl	%icc,	%f11,	%f19
	edge8l	%o5,	%l5,	%i7
	std	%f8,	[%l7 + 0x48]
	udivcc	%l6,	0x0F4B,	%i5
	sub	%o2,	0x19FF,	%o7
	alignaddr	%l4,	%g2,	%l0
	set	0x0E, %o3
	stha	%o0,	[%l7 + %o3] 0x04
	edge16	%o4,	%i4,	%i0
	tneg	%xcc,	0x5
	prefetch	[%l7 + 0x6C],	 0x3
	movre	%g5,	0x1C9,	%o1
	andcc	%i6,	0x086C,	%i1
	edge8l	%g7,	%i3,	%l2
	fbul,a	%fcc2,	loop_1848
	fand	%f10,	%f2,	%f20
	fble,a	%fcc2,	loop_1849
	fnands	%f23,	%f3,	%f7
loop_1848:
	edge8n	%o3,	%g6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1849:
	tge	%icc,	0x7
	tle	%icc,	0x7
	mova	%xcc,	%l3,	%g4
	fbe,a	%fcc0,	loop_1850
	tl	%xcc,	0x0
	fcmpgt32	%f0,	%f6,	%l1
	stbar
loop_1850:
	tge	%icc,	0x0
	bvs,pt	%icc,	loop_1851
	movge	%xcc,	%i2,	%o6
	movneg	%icc,	%o5,	%g1
	brz	%i7,	loop_1852
loop_1851:
	movvc	%xcc,	%l5,	%i5
	fornot1s	%f23,	%f23,	%f18
	fpsub16	%f22,	%f24,	%f30
loop_1852:
	fnot1	%f30,	%f28
	brlez,a	%l6,	loop_1853
	bl,a,pn	%xcc,	loop_1854
	edge16ln	%o2,	%l4,	%o7
	umul	%g2,	0x0C5A,	%o0
loop_1853:
	siam	0x2
loop_1854:
	stx	%l0,	[%l7 + 0x78]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i4,	%i0
	movrlz	%o4,	%g5,	%i6
	fmovscs	%icc,	%f2,	%f24
	fmovdcc	%xcc,	%f18,	%f23
	fabsd	%f22,	%f6
	movcs	%icc,	%o1,	%i1
	sll	%i3,	0x07,	%l2
	bpos,a	loop_1855
	sir	0x174A
	fbuge	%fcc0,	loop_1856
	smul	%o3,	%g6,	%g7
loop_1855:
	fmovdcs	%xcc,	%f14,	%f2
	tleu	%xcc,	0x2
loop_1856:
	or	%g3,	0x01EF,	%l3
	smul	%g4,	%l1,	%i2
	pdist	%f2,	%f10,	%f6
	fbul,a	%fcc0,	loop_1857
	fmovsn	%icc,	%f7,	%f23
	popc	%o6,	%g1
	tpos	%icc,	0x0
loop_1857:
	fmovsvc	%icc,	%f2,	%f23
	sllx	%o5,	0x1B,	%i7
	fpadd32	%f28,	%f8,	%f6
	movrlz	%i5,	%l6,	%l5
	edge16l	%l4,	%o7,	%g2
	edge32ln	%o0,	%l0,	%o2
	alignaddrl	%i4,	%o4,	%g5
	and	%i0,	0x14E5,	%i6
	udivcc	%o1,	0x08C8,	%i1
	mulx	%l2,	%o3,	%g6
	subccc	%i3,	0x1B6E,	%g7
	orcc	%g3,	%l3,	%g4
	fcmped	%fcc0,	%f26,	%f26
	movl	%icc,	%l1,	%o6
	stx	%i2,	[%l7 + 0x78]
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udivcc	%g1,	0x13D6,	%i7
	taddcctv	%o5,	%l6,	%l5
	brlez,a	%i5,	loop_1858
	fmovsleu	%icc,	%f19,	%f22
	fbule	%fcc3,	loop_1859
	tcc	%icc,	0x6
loop_1858:
	ldsh	[%l7 + 0x0C],	%o7
	bne,a,pt	%xcc,	loop_1860
loop_1859:
	fmovdle	%xcc,	%f29,	%f0
	sdiv	%l4,	0x196A,	%o0
	udiv	%l0,	0x10DD,	%g2
loop_1860:
	alignaddr	%i4,	%o2,	%o4
	tvs	%icc,	0x2
	te	%xcc,	0x4
	tleu	%icc,	0x0
	fmuld8sux16	%f4,	%f22,	%f12
	subcc	%g5,	%i0,	%i6
	tpos	%xcc,	0x1
	addccc	%o1,	%i1,	%l2
	fmovrdlz	%g6,	%f26,	%f24
	fbo,a	%fcc3,	loop_1861
	fandnot1s	%f4,	%f18,	%f6
	fmovrdne	%i3,	%f18,	%f24
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%o3
loop_1861:
	nop
	wr	%g0,	0xeb,	%asi
	stwa	%g7,	[%l7 + 0x74] %asi
	membar	#Sync
	fnor	%f2,	%f8,	%f28
	array16	%g3,	%l3,	%g4
	orcc	%l1,	0x1E4E,	%o6
	sethi	0x05F5,	%g1
	fbul,a	%fcc1,	loop_1862
	sir	0x119A
	tvs	%icc,	0x4
	movre	%i2,	0x397,	%i7
loop_1862:
	tn	%icc,	0x2
	movrne	%l6,	0x06B,	%o5
	tcc	%xcc,	0x2
	edge32n	%i5,	%o7,	%l5
	movleu	%icc,	%l4,	%o0
	prefetch	[%l7 + 0x38],	 0x2
	sdivcc	%l0,	0x007B,	%g2
	edge16ln	%i4,	%o2,	%g5
	fblg,a	%fcc3,	loop_1863
	xor	%o4,	%i6,	%o1
	sll	%i1,	%i0,	%g6
	fnegs	%f25,	%f5
loop_1863:
	movg	%xcc,	%l2,	%o3
	sir	0x07AE
	popc	0x1F09,	%i3
	membar	0x2C
	movrlz	%g3,	0x161,	%l3
	fors	%f7,	%f12,	%f26
	be,a	loop_1864
	movneg	%xcc,	%g4,	%g7
	brz,a	%o6,	loop_1865
	xorcc	%g1,	%l1,	%i2
loop_1864:
	nop
	set	0x20, %o4
	stwa	%i7,	[%l7 + %o4] 0x2f
	membar	#Sync
loop_1865:
	sdiv	%o5,	0x028B,	%l6
	movcs	%icc,	%i5,	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o0
	udivcc	%l4,	0x131E,	%g2
	movcs	%xcc,	%i4,	%o2
	movleu	%icc,	%g5,	%l0
	xnorcc	%i6,	%o4,	%o1
	taddcctv	%i0,	0x0EA3,	%i1
	sethi	0x05E9,	%g6
	orcc	%o3,	0x123F,	%l2
	mulscc	%i3,	0x12EC,	%l3
	array16	%g3,	%g7,	%g4
	fnegs	%f30,	%f18
	ta	%xcc,	0x5
	smul	%g1,	%o6,	%i2
	movcc	%xcc,	%l1,	%i7
	sethi	0x08EB,	%l6
	std	%f4,	[%l7 + 0x70]
	nop
	setx loop_1866, %l0, %l1
	jmpl %l1, %o5
	pdist	%f0,	%f18,	%f18
	addc	%i5,	%l5,	%o7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x18] %asi,	%o0
loop_1866:
	nop
	set	0x2A, %i6
	lduba	[%l7 + %i6] 0x18,	%g2
	andncc	%l4,	%i4,	%g5
	movrgez	%o2,	%l0,	%i6
	ta	%xcc,	0x4
	st	%f7,	[%l7 + 0x24]
	movcc	%xcc,	%o4,	%o1
	andcc	%i1,	%g6,	%o3
	fandnot1	%f22,	%f28,	%f18
	edge16ln	%i0,	%i3,	%l2
	membar	0x3E
	membar	0x09
	edge8	%l3,	%g7,	%g3
	fbul	%fcc2,	loop_1867
	subcc	%g1,	0x0598,	%o6
	movn	%icc,	%g4,	%l1
	fexpand	%f6,	%f20
loop_1867:
	fpadd32	%f22,	%f2,	%f26
	array8	%i7,	%i2,	%l6
	smul	%i5,	%l5,	%o5
	lduw	[%l7 + 0x7C],	%o7
	ta	%xcc,	0x3
	fbl	%fcc0,	loop_1868
	movleu	%icc,	%o0,	%g2
	tneg	%xcc,	0x4
	sub	%i4,	%g5,	%l4
loop_1868:
	fmovrse	%o2,	%f19,	%f8
	std	%i6,	[%l7 + 0x50]
	sdivx	%o4,	0x1FA5,	%o1
	nop
	setx loop_1869, %l0, %l1
	jmpl %l1, %i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f24,	%f26,	%f26
	movpos	%xcc,	%g6,	%l0
loop_1869:
	xnor	%o3,	0x0C4E,	%i0
	brgz,a	%i3,	loop_1870
	tcs	%icc,	0x2
	brlez,a	%l2,	loop_1871
	edge32n	%l3,	%g7,	%g3
loop_1870:
	edge8n	%o6,	%g1,	%l1
	movpos	%icc,	%i7,	%i2
loop_1871:
	fsrc2s	%f10,	%f11
	fmovrdne	%g4,	%f6,	%f20
	std	%f8,	[%l7 + 0x28]
	smulcc	%l6,	0x07E9,	%l5
	fandnot1	%f14,	%f30,	%f22
	fmovrdgz	%o5,	%f18,	%f14
	srax	%i5,	%o0,	%o7
	fmovrdne	%i4,	%f10,	%f0
	fbul	%fcc3,	loop_1872
	fmovsvs	%icc,	%f0,	%f1
	orncc	%g2,	%l4,	%o2
	movleu	%icc,	%g5,	%o4
loop_1872:
	fnand	%f10,	%f12,	%f8
	srax	%o1,	%i6,	%i1
	tsubcctv	%g6,	0x0547,	%l0
	fmovdneg	%xcc,	%f31,	%f27
	movneg	%xcc,	%i0,	%i3
	umulcc	%o3,	0x1EE2,	%l3
	brlz	%l2,	loop_1873
	edge16l	%g7,	%g3,	%o6
	movleu	%icc,	%l1,	%g1
	array16	%i7,	%g4,	%i2
loop_1873:
	movle	%icc,	%l6,	%l5
	movg	%icc,	%o5,	%o0
	fmovsg	%xcc,	%f2,	%f25
	fba,a	%fcc2,	loop_1874
	brlez	%i5,	loop_1875
	srl	%o7,	0x08,	%g2
	smul	%i4,	0x0006,	%o2
loop_1874:
	nop
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x88
loop_1875:
	sll	%l4,	%g5,	%o1
	edge32ln	%i6,	%o4,	%i1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x0c,	%f0
	fcmpeq32	%f0,	%f22,	%l0
	fcmpeq32	%f12,	%f4,	%g6
	fpadd32	%f14,	%f20,	%f24
	bcc	%icc,	loop_1876
	fmovsge	%xcc,	%f25,	%f24
	orcc	%i0,	0x1B77,	%i3
	ldx	[%l7 + 0x58],	%l3
loop_1876:
	fmovrsgez	%l2,	%f22,	%f10
	orncc	%g7,	%g3,	%o6
	set	0x70, %i3
	stwa	%o3,	[%l7 + %i3] 0x0c
	edge16n	%g1,	%i7,	%l1
	subcc	%i2,	%g4,	%l6
	set	0x120, %o2
	ldxa	[%g0 + %o2] 0x52,	%l5
	faligndata	%f28,	%f16,	%f20
	fors	%f0,	%f13,	%f0
	fcmple32	%f24,	%f16,	%o0
	movcs	%icc,	%i5,	%o5
	tneg	%xcc,	0x3
	tleu	%xcc,	0x5
	tpos	%icc,	0x5
	sethi	0x0802,	%o7
	fsrc2s	%f9,	%f11
	tl	%xcc,	0x3
	wr	%g0,	0x2b,	%asi
	stha	%i4,	[%l7 + 0x34] %asi
	membar	#Sync
	fbg,a	%fcc3,	loop_1877
	movge	%icc,	%g2,	%o2
	smul	%l4,	0x0967,	%o1
	taddcc	%i6,	%g5,	%i1
loop_1877:
	xnor	%o4,	%l0,	%i0
	set	0x74, %i1
	sta	%f22,	[%l7 + %i1] 0x14
	fmovse	%xcc,	%f28,	%f10
	fands	%f30,	%f24,	%f22
	fbge	%fcc1,	loop_1878
	addccc	%g6,	0x07CC,	%l3
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x80,	 0x3
loop_1878:
	movgu	%xcc,	%g7,	%l2
	tleu	%xcc,	0x1
	tne	%xcc,	0x3
	stb	%o6,	[%l7 + 0x46]
	flush	%l7 + 0x40
	tne	%xcc,	0x4
	fbule,a	%fcc2,	loop_1879
	tg	%xcc,	0x4
	tleu	%xcc,	0x3
	mulscc	%g3,	%o3,	%i7
loop_1879:
	fcmpd	%fcc0,	%f14,	%f10
	set	0x10, %l4
	stba	%l1,	[%l7 + %l4] 0x0c
	movneg	%icc,	%i2,	%g4
	fmovsne	%xcc,	%f0,	%f23
	edge16ln	%l6,	%l5,	%o0
	nop
	setx loop_1880, %l0, %l1
	jmpl %l1, %g1
	fmovdpos	%xcc,	%f27,	%f21
	udivx	%o5,	0x0810,	%o7
	fands	%f15,	%f25,	%f11
loop_1880:
	membar	0x52
	orcc	%i4,	0x069D,	%i5
	andcc	%g2,	%l4,	%o2
	sdiv	%o1,	0x0BD6,	%g5
	fexpand	%f4,	%f2
	fcmps	%fcc0,	%f5,	%f9
	edge32ln	%i6,	%o4,	%l0
	andcc	%i0,	0x03AA,	%i1
	fcmpeq16	%f30,	%f12,	%g6
	fornot2s	%f21,	%f23,	%f3
	bneg,a,pt	%icc,	loop_1881
	brz,a	%i3,	loop_1882
	tleu	%icc,	0x1
	fmovdgu	%xcc,	%f20,	%f24
loop_1881:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l2
loop_1882:
	array8	%o6,	%g3,	%g7
	ldsh	[%l7 + 0x12],	%o3
	edge16l	%i7,	%i2,	%g4
	subcc	%l1,	%l6,	%l5
	fabsd	%f12,	%f0
	movvc	%xcc,	%g1,	%o5
	movre	%o7,	%i4,	%i5
	tvs	%icc,	0x3
	fbl	%fcc2,	loop_1883
	ta	%icc,	0x5
	fmovrdlez	%g2,	%f4,	%f16
	andn	%o0,	0x0DDF,	%o2
loop_1883:
	sethi	0x00BF,	%l4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%o1
	movneg	%icc,	%g5,	%i6
	edge32	%o4,	%l0,	%i0
	fzeros	%f23
	fpsub16	%f20,	%f10,	%f18
	fpsub32	%f14,	%f16,	%f18
	ld	[%l7 + 0x44],	%f16
	edge8n	%g6,	%i3,	%l3
	fsrc1	%f16,	%f10
	fmovdge	%icc,	%f10,	%f29
	fbuge,a	%fcc1,	loop_1884
	fmovdge	%icc,	%f1,	%f10
	edge32l	%l2,	%o6,	%g3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
loop_1884:
	tg	%icc,	0x3
	andcc	%i1,	0x086F,	%i7
	add	%o3,	%i2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l6,	%l1,	%g1
	ldstub	[%l7 + 0x39],	%l5
	tcs	%icc,	0x3
	movrne	%o5,	0x26A,	%o7
	movrlz	%i5,	%i4,	%o0
	xor	%g2,	%o2,	%l4
	fzero	%f6
	move	%icc,	%o1,	%g5
	fzeros	%f21
	orn	%o4,	0x1690,	%i6
	addc	%i0,	0x0B94,	%g6
	fmovrslz	%i3,	%f15,	%f4
	movvs	%icc,	%l3,	%l0
	bl,pt	%icc,	loop_1885
	std	%l2,	[%l7 + 0x78]
	array16	%g3,	%o6,	%i1
	orncc	%g7,	%o3,	%i7
loop_1885:
	movn	%xcc,	%i2,	%l6
	taddcctv	%l1,	%g1,	%g4
	and	%l5,	0x03ED,	%o7
	udivx	%i5,	0x17E7,	%o5
	fmovda	%xcc,	%f1,	%f21
	tne	%xcc,	0x0
	sdivcc	%o0,	0x0F57,	%g2
	andn	%i4,	%l4,	%o1
	fbuge,a	%fcc1,	loop_1886
	fbo	%fcc0,	loop_1887
	brgez,a	%o2,	loop_1888
	stbar
loop_1886:
	movne	%icc,	%o4,	%i6
loop_1887:
	movl	%xcc,	%i0,	%g6
loop_1888:
	fandnot1s	%f23,	%f3,	%f30
	ta	%xcc,	0x5
	bcc,a,pt	%xcc,	loop_1889
	nop
	setx	loop_1890,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x0
	orncc	%i3,	0x00C4,	%l3
loop_1889:
	nop
	set	0x30, %l1
	sta	%f5,	[%l7 + %l1] 0x04
loop_1890:
	tne	%xcc,	0x5
	lduh	[%l7 + 0x7C],	%l0
	ldsb	[%l7 + 0x5B],	%l2
	movrlez	%g3,	0x390,	%o6
	array8	%g5,	%i1,	%o3
	set	0x70, %i4
	stxa	%i7,	[%l7 + %i4] 0x80
	sllx	%g7,	0x0B,	%i2
	fmovsgu	%icc,	%f30,	%f18
	fmovrslez	%l6,	%f23,	%f7
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l1
	sdivx	%g4,	0x0CC9,	%l5
	be	%xcc,	loop_1891
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%g1,	%f6,	%f18
	fmul8x16au	%f15,	%f20,	%f18
loop_1891:
	mova	%icc,	%o7,	%o5
	movvs	%icc,	%o0,	%g2
	ldsb	[%l7 + 0x26],	%i5
	subc	%l4,	%i4,	%o1
	umulcc	%o4,	%o2,	%i0
	sir	0x178B
	fbug	%fcc3,	loop_1892
	andcc	%i6,	0x1DA3,	%i3
	std	%l2,	[%l7 + 0x78]
	edge8ln	%l0,	%l2,	%g3
loop_1892:
	tpos	%icc,	0x6
	ta	%icc,	0x7
	fbo	%fcc3,	loop_1893
	fmovrdgz	%g6,	%f2,	%f0
	xnor	%g5,	%o6,	%i1
	bvc,a	loop_1894
loop_1893:
	umulcc	%o3,	0x0A9A,	%i7
	fmovrde	%i2,	%f22,	%f30
	fxnor	%f16,	%f2,	%f8
loop_1894:
	brgez,a	%g7,	loop_1895
	sub	%l1,	%l6,	%g4
	move	%xcc,	%g1,	%l5
	array8	%o7,	%o0,	%g2
loop_1895:
	smul	%i5,	%o5,	%i4
	fsrc1	%f0,	%f24
	xorcc	%o1,	%o4,	%l4
	taddcctv	%i0,	0x10DF,	%i6
	alignaddr	%o2,	%i3,	%l0
	orcc	%l2,	%g3,	%l3
	movrlez	%g5,	0x10E,	%g6
	sllx	%o6,	0x1F,	%i1
	brgz,a	%i7,	loop_1896
	movgu	%xcc,	%i2,	%g7
	membar	0x59
	sllx	%l1,	0x0A,	%o3
loop_1896:
	tn	%icc,	0x3
	movcc	%icc,	%g4,	%g1
	call	loop_1897
	nop
	setx loop_1898, %l0, %l1
	jmpl %l1, %l6
	srlx	%l5,	0x00,	%o7
	edge16n	%o0,	%i5,	%o5
loop_1897:
	bvc,a,pn	%xcc,	loop_1899
loop_1898:
	ba,pt	%icc,	loop_1900
	tleu	%xcc,	0x2
	smulcc	%g2,	0x0682,	%i4
loop_1899:
	fsrc1	%f20,	%f12
loop_1900:
	tle	%xcc,	0x2
	bvc	loop_1901
	movge	%xcc,	%o1,	%o4
	movge	%icc,	%i0,	%l4
	edge8ln	%o2,	%i3,	%i6
loop_1901:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x5E] %asi,	%l0
	udivcc	%g3,	0x1FC4,	%l2
	movne	%xcc,	%g5,	%g6
	smulcc	%l3,	0x1316,	%o6
	brz,a	%i1,	loop_1902
	tsubcc	%i2,	%g7,	%l1
	movrlez	%i7,	0x2C9,	%g4
	tgu	%icc,	0x1
loop_1902:
	mulx	%o3,	%l6,	%l5
	ta	%xcc,	0x6
	std	%g0,	[%l7 + 0x50]
	brgez,a	%o0,	loop_1903
	xorcc	%i5,	%o5,	%g2
	tg	%icc,	0x2
	sra	%i4,	%o7,	%o4
loop_1903:
	mova	%icc,	%i0,	%l4
	subccc	%o2,	0x129E,	%i3
	and	%o1,	0x0590,	%i6
	sra	%l0,	%g3,	%g5
	add	%l2,	0x0912,	%l3
	movgu	%xcc,	%g6,	%o6
	fmovrdlez	%i2,	%f30,	%f24
	movn	%xcc,	%g7,	%l1
	addcc	%i1,	%i7,	%o3
	movge	%icc,	%l6,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g1,	%o0,	%i5
	fmovdl	%xcc,	%f18,	%f15
	taddcctv	%o5,	0x1AB4,	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%g2
	array8	%o4,	%o7,	%i0
	fmovsvs	%xcc,	%f17,	%f18
	edge8	%o2,	%l4,	%i3
	fnor	%f28,	%f10,	%f18
	edge32l	%o1,	%l0,	%g3
	tge	%icc,	0x4
	ldd	[%l7 + 0x70],	%f18
	fmovse	%xcc,	%f7,	%f24
	fnands	%f5,	%f7,	%f24
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x50] %asi,	%g5
	set	0x1E, %l6
	stha	%i6,	[%l7 + %l6] 0x80
	taddcctv	%l2,	%l3,	%g6
	stx	%i2,	[%l7 + 0x78]
	fcmpgt32	%f16,	%f26,	%o6
	st	%f27,	[%l7 + 0x20]
	sllx	%g7,	%l1,	%i1
	set	0x70, %g7
	lda	[%l7 + %g7] 0x18,	%f11
	umul	%i7,	0x07F4,	%l6
	movvc	%xcc,	%l5,	%g1
	mulscc	%o3,	0x1654,	%i5
	tpos	%icc,	0x2
	fmovdvc	%icc,	%f1,	%f5
	fbu,a	%fcc1,	loop_1904
	fbug	%fcc1,	loop_1905
	brz,a	%o5,	loop_1906
	flush	%l7 + 0x64
loop_1904:
	fbug,a	%fcc0,	loop_1907
loop_1905:
	movvs	%xcc,	%o0,	%i4
loop_1906:
	movl	%icc,	%g4,	%o4
	movgu	%icc,	%o7,	%i0
loop_1907:
	fcmple16	%f24,	%f14,	%o2
	move	%xcc,	%l4,	%i3
	fxor	%f10,	%f20,	%f24
	fxors	%f16,	%f29,	%f20
	edge16	%o1,	%l0,	%g2
	fmovsn	%icc,	%f30,	%f19
	fmovdcs	%icc,	%f15,	%f6
	edge16l	%g3,	%i6,	%l2
	srl	%l3,	0x11,	%g5
	xor	%g6,	0x1A46,	%o6
	tneg	%xcc,	0x0
	movl	%icc,	%g7,	%i2
	fornot1	%f22,	%f2,	%f10
	mova	%xcc,	%i1,	%i7
	fmovde	%xcc,	%f24,	%f22
	bge,a,pt	%xcc,	loop_1908
	fmovsvs	%xcc,	%f7,	%f14
	fnors	%f17,	%f3,	%f23
	edge32ln	%l6,	%l5,	%l1
loop_1908:
	te	%xcc,	0x4
	tne	%xcc,	0x7
	tvs	%icc,	0x7
	fmovsneg	%icc,	%f3,	%f10
	faligndata	%f30,	%f8,	%f8
	fzero	%f20
	movpos	%icc,	%g1,	%o3
	fcmpgt16	%f14,	%f20,	%o5
	taddcctv	%i5,	%i4,	%g4
	move	%icc,	%o4,	%o0
	tg	%icc,	0x3
	smulcc	%o7,	0x0980,	%i0
	ldsh	[%l7 + 0x6E],	%l4
	fbne,a	%fcc2,	loop_1909
	fandnot1s	%f2,	%f31,	%f20
	edge32l	%o2,	%i3,	%o1
	taddcc	%l0,	0x0CEB,	%g2
loop_1909:
	te	%icc,	0x1
	movvs	%icc,	%i6,	%l2
	orncc	%l3,	%g3,	%g6
	movrgz	%o6,	0x1EB,	%g5
	taddcc	%g7,	%i2,	%i7
	taddcctv	%i1,	%l6,	%l5
	ta	%xcc,	0x7
	fbule	%fcc3,	loop_1910
	fbuge	%fcc0,	loop_1911
	edge8n	%g1,	%o3,	%l1
	umul	%i5,	0x0C3F,	%i4
loop_1910:
	movn	%icc,	%o5,	%g4
loop_1911:
	andcc	%o4,	0x0A42,	%o7
	udivcc	%i0,	0x0922,	%l4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x68] %asi,	%o2
	fnegs	%f25,	%f6
	alignaddr	%i3,	%o1,	%o0
	set	0x6C, %i0
	lduha	[%l7 + %i0] 0x80,	%g2
	movcs	%xcc,	%i6,	%l2
	alignaddr	%l3,	%l0,	%g6
	st	%f8,	[%l7 + 0x1C]
	sub	%g3,	%o6,	%g7
	edge8ln	%g5,	%i2,	%i7
	set	0x74, %l5
	lda	[%l7 + %l5] 0x18,	%f8
	fmovrsgez	%i1,	%f18,	%f26
	ta	%icc,	0x4
	edge32l	%l5,	%g1,	%l6
	tle	%icc,	0x0
	andncc	%l1,	%i5,	%i4
	swap	[%l7 + 0x44],	%o3
	subcc	%g4,	0x041E,	%o5
	fmovsge	%xcc,	%f22,	%f19
	fmovdcc	%xcc,	%f16,	%f14
	subccc	%o4,	0x085D,	%i0
	movpos	%xcc,	%o7,	%o2
	udivx	%i3,	0x033E,	%l4
	fcmpeq16	%f30,	%f10,	%o0
	fmovrsgez	%g2,	%f15,	%f13
	sdiv	%o1,	0x18F0,	%i6
	fpsub32s	%f9,	%f28,	%f18
	fmovrslz	%l2,	%f8,	%f10
	stbar
	fcmpd	%fcc3,	%f18,	%f18
	tcc	%xcc,	0x6
	umul	%l3,	%l0,	%g6
	udivcc	%o6,	0x03B9,	%g7
	fpsub16	%f10,	%f28,	%f8
	array16	%g3,	%i2,	%i7
	tg	%xcc,	0x1
	prefetch	[%l7 + 0x38],	 0x3
	ba,a	%icc,	loop_1912
	te	%xcc,	0x6
	tvs	%icc,	0x6
	tpos	%icc,	0x4
loop_1912:
	smul	%g5,	%l5,	%i1
	movl	%icc,	%g1,	%l1
	and	%l6,	%i5,	%i4
	fmovsvc	%icc,	%f1,	%f14
	array16	%o3,	%o5,	%g4
	fcmpgt16	%f0,	%f24,	%i0
	sllx	%o4,	%o7,	%i3
	ba,a	%icc,	loop_1913
	edge16	%l4,	%o0,	%o2
	fmovrdne	%o1,	%f10,	%f4
	edge8ln	%g2,	%l2,	%l3
loop_1913:
	tpos	%icc,	0x1
	sir	0x108C
	fble,a	%fcc0,	loop_1914
	fcmple32	%f6,	%f26,	%i6
	movleu	%xcc,	%g6,	%l0
	set	0x6C, %o5
	sta	%f23,	[%l7 + %o5] 0x15
loop_1914:
	xnor	%o6,	0x086F,	%g3
	brgz	%g7,	loop_1915
	tge	%icc,	0x3
	or	%i7,	%g5,	%l5
	movcc	%xcc,	%i1,	%i2
loop_1915:
	fsrc2	%f0,	%f6
	array16	%g1,	%l1,	%l6
	subc	%i5,	%i4,	%o5
	edge8l	%o3,	%g4,	%i0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x64] %asi,	%f20
	movvc	%xcc,	%o7,	%i3
	tne	%xcc,	0x0
	umul	%o4,	%l4,	%o0
	faligndata	%f16,	%f12,	%f16
	movne	%icc,	%o2,	%g2
	movle	%xcc,	%o1,	%l2
	tge	%icc,	0x7
	fornot1	%f16,	%f10,	%f26
	udivcc	%l3,	0x1BD3,	%i6
	tl	%xcc,	0x1
	movn	%icc,	%g6,	%l0
	fpack16	%f20,	%f3
	fbug,a	%fcc2,	loop_1916
	bneg,pn	%icc,	loop_1917
	tne	%icc,	0x7
	stb	%g3,	[%l7 + 0x28]
loop_1916:
	edge16l	%g7,	%o6,	%i7
loop_1917:
	ldd	[%l7 + 0x78],	%f6
	fcmpne32	%f10,	%f4,	%l5
	fnegd	%f24,	%f0
	bgu,pt	%xcc,	loop_1918
	movne	%icc,	%g5,	%i2
	tgu	%icc,	0x2
	xor	%g1,	%i1,	%l6
loop_1918:
	subccc	%i5,	%i4,	%o5
	flush	%l7 + 0x18
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%l1
	fornot1	%f4,	%f16,	%f20
	srl	%i0,	%g4,	%i3
	mova	%icc,	%o7,	%o4
	fbule	%fcc1,	loop_1919
	tvs	%icc,	0x2
	smul	%o0,	0x00BE,	%l4
	nop
	setx loop_1920, %l0, %l1
	jmpl %l1, %g2
loop_1919:
	srax	%o2,	%o1,	%l2
	set	0x64, %g3
	ldswa	[%l7 + %g3] 0x10,	%l3
loop_1920:
	sdivx	%g6,	0x0400,	%l0
	fblg	%fcc3,	loop_1921
	fmovsleu	%icc,	%f22,	%f29
	fandnot1s	%f6,	%f17,	%f0
	array32	%g3,	%i6,	%g7
loop_1921:
	movcc	%xcc,	%i7,	%l5
	mulx	%o6,	0x1F8A,	%i2
	fmovsa	%icc,	%f0,	%f11
	tn	%icc,	0x5
	fpadd16	%f2,	%f0,	%f6
	srax	%g5,	%g1,	%i1
	alignaddrl	%i5,	%l6,	%i4
	movcc	%icc,	%o3,	%o5
	fornot2	%f4,	%f8,	%f26
	tg	%icc,	0x4
	ldsh	[%l7 + 0x2C],	%l1
	sub	%i0,	0x1478,	%g4
	fsrc1	%f6,	%f24
	fblg,a	%fcc1,	loop_1922
	umul	%o7,	%i3,	%o0
	set	0x28, %o0
	swapa	[%l7 + %o0] 0x80,	%l4
loop_1922:
	xnorcc	%o4,	%o2,	%g2
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x18,	 0x2
	xnor	%o1,	0x1B9D,	%l3
	fmovspos	%xcc,	%f23,	%f13
	umulcc	%l0,	0x0943,	%g3
	movge	%xcc,	%g6,	%i6
	xnor	%i7,	%g7,	%o6
	fmovdne	%xcc,	%f28,	%f21
	udiv	%l5,	0x1D6D,	%g5
	fmovrdlz	%i2,	%f28,	%f28
	movrlz	%g1,	%i1,	%l6
	stx	%i4,	[%l7 + 0x50]
	srlx	%o3,	0x17,	%o5
	call	loop_1923
	be,pt	%icc,	loop_1924
	orcc	%i5,	0x06DF,	%l1
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
loop_1923:
	tsubcc	%i0,	0x12C8,	%i3
loop_1924:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%o0,	[%l7 + 0x58] %asi
	membar	#Sync
	fmovdcc	%xcc,	%f8,	%f17
	tvc	%xcc,	0x3
	xnorcc	%l4,	0x1445,	%o7
	nop
	setx	loop_1925,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduw	[%l7 + 0x14],	%o2
	tcs	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g2
loop_1925:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%l2,	[%l7 + 0x58] %asi
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf1
	membar	#Sync
	fmovspos	%xcc,	%f2,	%f28
	bne,a,pt	%icc,	loop_1926
	xnor	%o1,	%l3,	%l0
	bvc,pn	%xcc,	loop_1927
	te	%xcc,	0x6
loop_1926:
	umulcc	%g3,	%o4,	%i6
	ldstub	[%l7 + 0x62],	%g6
loop_1927:
	movpos	%icc,	%g7,	%i7
	tne	%xcc,	0x4
	stb	%l5,	[%l7 + 0x49]
	fbuge	%fcc3,	loop_1928
	xorcc	%g5,	0x0CEF,	%o6
	andn	%g1,	%i2,	%l6
	edge32ln	%i1,	%i4,	%o3
loop_1928:
	fmovdleu	%xcc,	%f7,	%f21
	movcc	%xcc,	%i5,	%l1
	mulx	%g4,	0x199C,	%i0
	fmovse	%xcc,	%f10,	%f21
	move	%xcc,	%i3,	%o0
	tcs	%icc,	0x4
	fandnot1s	%f14,	%f13,	%f13
	movrlz	%l4,	%o5,	%o2
	sub	%o7,	%g2,	%o1
	fornot1	%f16,	%f6,	%f14
	flush	%l7 + 0x40
	movleu	%icc,	%l2,	%l3
	wr	%g0,	0xea,	%asi
	stxa	%l0,	[%l7 + 0x58] %asi
	membar	#Sync
	srlx	%g3,	0x1D,	%i6
	fba,a	%fcc2,	loop_1929
	sdivx	%o4,	0x01D5,	%g6
	fors	%f19,	%f25,	%f5
	fnands	%f19,	%f22,	%f16
loop_1929:
	nop
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
	ld	[%l7 + 0x3C],	%f24
	popc	%i7,	%l5
	srlx	%g5,	%o6,	%i2
	and	%g1,	0x0F24,	%l6
	and	%i1,	%o3,	%i5
	xorcc	%i4,	%g4,	%i0
	andn	%l1,	0x0235,	%o0
	fsrc1s	%f31,	%f28
	sethi	0x1B91,	%i3
	brlz,a	%l4,	loop_1930
	sdivcc	%o2,	0x1FFD,	%o7
	movg	%xcc,	%o5,	%o1
	addcc	%l2,	0x0684,	%g2
loop_1930:
	movvs	%icc,	%l3,	%g3
	tl	%xcc,	0x7
	array16	%i6,	%o4,	%g6
	tpos	%icc,	0x5
	srax	%l0,	%g7,	%i7
	movge	%xcc,	%g5,	%l5
	sth	%i2,	[%l7 + 0x62]
	sllx	%g1,	0x02,	%o6
	fornot2	%f10,	%f18,	%f14
	fmovs	%f12,	%f18
	tg	%xcc,	0x6
	edge32n	%l6,	%o3,	%i5
	bcs	%icc,	loop_1931
	tvs	%xcc,	0x1
	fmuld8ulx16	%f22,	%f25,	%f8
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1931:
	fsrc1s	%f25,	%f23
	orncc	%i1,	%i4,	%g4
	fexpand	%f31,	%f18
	tn	%icc,	0x4
	tn	%xcc,	0x0
	alignaddrl	%i0,	%l1,	%i3
	fandnot2	%f18,	%f8,	%f4
	fcmpne16	%f6,	%f4,	%l4
	nop
	setx loop_1932, %l0, %l1
	jmpl %l1, %o0
	fmuld8ulx16	%f5,	%f26,	%f8
	fandnot2	%f4,	%f16,	%f24
	fcmpeq16	%f6,	%f2,	%o7
loop_1932:
	alignaddr	%o2,	%o1,	%o5
	tge	%icc,	0x4
	lduh	[%l7 + 0x14],	%l2
	movne	%xcc,	%l3,	%g2
	siam	0x6
	fmovrdlez	%i6,	%f18,	%f26
	udiv	%o4,	0x128B,	%g3
	brlez	%l0,	loop_1933
	be,a,pt	%xcc,	loop_1934
	udivcc	%g7,	0x0844,	%i7
	fmovdne	%icc,	%f23,	%f7
loop_1933:
	sdivx	%g6,	0x1DEF,	%g5
loop_1934:
	smulcc	%l5,	%i2,	%o6
	udiv	%l6,	0x07A4,	%g1
	ldsh	[%l7 + 0x38],	%i5
	fbug,a	%fcc2,	loop_1935
	bcc,a,pn	%xcc,	loop_1936
	alignaddr	%i1,	%i4,	%g4
	udivx	%o3,	0x0BC3,	%l1
loop_1935:
	smul	%i3,	%i0,	%o0
loop_1936:
	bgu,pn	%icc,	loop_1937
	brnz,a	%o7,	loop_1938
	brgez,a	%o2,	loop_1939
	array8	%o1,	%l4,	%l2
loop_1937:
	ble	loop_1940
loop_1938:
	tl	%icc,	0x6
loop_1939:
	smul	%o5,	0x0A5C,	%g2
	movpos	%xcc,	%l3,	%i6
loop_1940:
	fmul8sux16	%f16,	%f6,	%f16
	tsubcctv	%g3,	0x15BD,	%o4
	fbue	%fcc3,	loop_1941
	fnot1	%f10,	%f8
	movle	%xcc,	%l0,	%i7
	sra	%g6,	0x0D,	%g7
loop_1941:
	bne	loop_1942
	fxors	%f30,	%f19,	%f25
	nop
	set	0x5E, %g2
	ldub	[%l7 + %g2],	%g5
	fmul8x16al	%f15,	%f15,	%f24
loop_1942:
	taddcctv	%i2,	0x018B,	%l5
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	tneg	%icc,	0x3
	fbul,a	%fcc3,	loop_1943
	movn	%icc,	%o6,	%i5
	bcc,a	%xcc,	loop_1944
	sdiv	%i1,	0x1A77,	%g1
loop_1943:
	movg	%icc,	%i4,	%o3
	movneg	%xcc,	%g4,	%l1
loop_1944:
	fbule,a	%fcc0,	loop_1945
	call	loop_1946
	fbuge,a	%fcc1,	loop_1947
	fbn	%fcc0,	loop_1948
loop_1945:
	movle	%icc,	%i0,	%i3
loop_1946:
	orcc	%o7,	0x1289,	%o2
loop_1947:
	ta	%icc,	0x4
loop_1948:
	movvs	%icc,	%o1,	%o0
	tpos	%xcc,	0x7
	fmovrdlz	%l2,	%f26,	%f24
	tcc	%icc,	0x1
	movcs	%icc,	%l4,	%o5
	fabss	%f8,	%f26
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x81,	%g2
	stw	%l3,	[%l7 + 0x1C]
	fornot2	%f0,	%f16,	%f18
	xnor	%g3,	%i6,	%l0
	movcs	%xcc,	%o4,	%g6
	array16	%i7,	%g7,	%g5
	tle	%xcc,	0x7
	bvc,pt	%icc,	loop_1949
	movle	%icc,	%l5,	%i2
	fmovdleu	%icc,	%f14,	%f21
	nop
	set	0x64, %g5
	lduw	[%l7 + %g5],	%l6
loop_1949:
	fpsub32s	%f2,	%f0,	%f1
	edge8n	%o6,	%i5,	%i1
	udivx	%g1,	0x1F29,	%i4
	wr	%g0,	0x2a,	%asi
	stba	%o3,	[%l7 + 0x20] %asi
	membar	#Sync
	fxnor	%f10,	%f30,	%f10
	sdiv	%g4,	0x13C6,	%l1
	membar	0x1F
	bvs,a	%icc,	loop_1950
	te	%xcc,	0x1
	andn	%i0,	0x1153,	%o7
	fcmpne32	%f0,	%f24,	%o2
loop_1950:
	nop
	set	0x18, %l3
	ldsha	[%l7 + %l3] 0x10,	%o1
	pdist	%f2,	%f0,	%f6
	std	%f14,	[%l7 + 0x20]
	or	%o0,	0x1F0B,	%i3
	wr	%g0,	0x81,	%asi
	stwa	%l2,	[%l7 + 0x6C] %asi
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8ln	%l4,	%g2,	%o5
	nop
	set	0x40, %l2
	std	%l2,	[%l7 + %l2]
	movrgez	%g3,	0x3B8,	%l0
	array8	%i6,	%g6,	%o4
	sdiv	%i7,	0x1062,	%g7
	umul	%g5,	%i2,	%l6
	srax	%l5,	%i5,	%i1
	andncc	%g1,	%o6,	%i4
	fbg,a	%fcc0,	loop_1951
	movg	%xcc,	%o3,	%g4
	fcmpgt16	%f8,	%f20,	%i0
	xnorcc	%o7,	%l1,	%o1
loop_1951:
	brlez	%o0,	loop_1952
	srlx	%o2,	%l2,	%i3
	tgu	%xcc,	0x4
	addc	%l4,	%g2,	%l3
loop_1952:
	mulx	%g3,	0x0961,	%l0
	sth	%o5,	[%l7 + 0x4E]
	movre	%i6,	0x043,	%g6
	mova	%icc,	%o4,	%g7
	mulx	%g5,	%i7,	%i2
	tge	%xcc,	0x1
	stw	%l6,	[%l7 + 0x6C]
	be,a	loop_1953
	ldstub	[%l7 + 0x7D],	%l5
	brlz	%i1,	loop_1954
	fbe,a	%fcc1,	loop_1955
loop_1953:
	alignaddrl	%g1,	%o6,	%i5
	fbu	%fcc3,	loop_1956
loop_1954:
	array8	%i4,	%o3,	%g4
loop_1955:
	ta	%xcc,	0x1
	movrgez	%i0,	%o7,	%l1
loop_1956:
	tvs	%xcc,	0x1
	andncc	%o1,	%o2,	%o0
	movle	%xcc,	%i3,	%l2
	move	%xcc,	%l4,	%l3
	movre	%g2,	%g3,	%l0
	edge8	%i6,	%o5,	%o4
	umul	%g6,	%g5,	%g7
	fmovrdne	%i2,	%f16,	%f4
	faligndata	%f16,	%f0,	%f0
	fxor	%f14,	%f10,	%f12
	sdivcc	%i7,	0x023C,	%l6
	array16	%i1,	%g1,	%o6
	smul	%i5,	%i4,	%o3
	set	0x70, %o7
	stxa	%l5,	[%l7 + %o7] 0x11
	tvs	%xcc,	0x1
	edge8l	%i0,	%g4,	%o7
	fandnot1	%f6,	%f8,	%f0
	sra	%o1,	%l1,	%o2
	udivcc	%i3,	0x0ED9,	%o0
	srl	%l4,	%l3,	%l2
	tneg	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g2,	%l0,	%i6
	stbar
	fpack32	%f8,	%f0,	%f8
	tn	%icc,	0x7
	fxors	%f7,	%f1,	%f15
	movneg	%xcc,	%o5,	%o4
	fmul8x16au	%f19,	%f31,	%f12
	udivx	%g3,	0x141C,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x58] %asi,	%g7
	srl	%g5,	%i2,	%i7
	move	%icc,	%i1,	%g1
	tpos	%xcc,	0x4
	fbule,a	%fcc0,	loop_1957
	std	%o6,	[%l7 + 0x60]
	brnz	%l6,	loop_1958
	sir	0x1637
loop_1957:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x3C] %asi,	%f3
loop_1958:
	sra	%i5,	%i4,	%o3
	fmovsa	%xcc,	%f29,	%f23
	ldub	[%l7 + 0x2D],	%l5
	sethi	0x098D,	%i0
	nop
	setx	loop_1959,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%icc,	0x2
	fpsub16s	%f13,	%f8,	%f2
	movrne	%g4,	0x0BC,	%o7
loop_1959:
	sdivx	%l1,	0x1270,	%o2
	fmovspos	%icc,	%f29,	%f4
	movle	%xcc,	%i3,	%o0
	fmovrdgz	%o1,	%f22,	%f12
	fpack16	%f22,	%f21
	movvc	%icc,	%l4,	%l3
	sdivcc	%l2,	0x0B39,	%g2
	edge16ln	%i6,	%l0,	%o5
	bvs,pt	%icc,	loop_1960
	movgu	%xcc,	%o4,	%g3
	tne	%icc,	0x0
	fxors	%f22,	%f27,	%f20
loop_1960:
	fmovda	%xcc,	%f30,	%f17
	movn	%icc,	%g6,	%g5
	fmul8x16al	%f5,	%f23,	%f6
	sethi	0x1FB9,	%g7
	tsubcc	%i7,	0x0556,	%i2
	addccc	%i1,	%o6,	%g1
	fornot1	%f20,	%f24,	%f26
	set	0x5C, %g6
	sta	%f26,	[%l7 + %g6] 0x0c
	umul	%l6,	%i5,	%i4
	fnot2	%f6,	%f16
	array8	%o3,	%l5,	%i0
	bgu,a,pt	%xcc,	loop_1961
	nop
	setx	loop_1962,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%o7,	%g4
	tge	%icc,	0x4
loop_1961:
	fabss	%f11,	%f20
loop_1962:
	tle	%icc,	0x5
	subc	%o2,	%i3,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o1,	%l4
	tsubcctv	%l3,	%l1,	%l2
	fpadd32	%f2,	%f26,	%f28
	fba	%fcc2,	loop_1963
	tle	%icc,	0x4
	edge16n	%g2,	%l0,	%i6
	bvs,pt	%xcc,	loop_1964
loop_1963:
	xnor	%o5,	0x1384,	%g3
	edge8n	%o4,	%g5,	%g6
	fbug,a	%fcc1,	loop_1965
loop_1964:
	fmovdcs	%xcc,	%f13,	%f21
	movvc	%xcc,	%g7,	%i7
	movvc	%xcc,	%i2,	%o6
loop_1965:
	sra	%i1,	%l6,	%i5
	fbug	%fcc0,	loop_1966
	array8	%g1,	%i4,	%l5
	srlx	%o3,	0x05,	%i0
	fmul8sux16	%f6,	%f30,	%f12
loop_1966:
	udivcc	%o7,	0x1F0E,	%g4
	stw	%i3,	[%l7 + 0x18]
	ble,a,pt	%xcc,	loop_1967
	fbne,a	%fcc2,	loop_1968
	fbue,a	%fcc2,	loop_1969
	tgu	%xcc,	0x2
loop_1967:
	movrne	%o0,	%o1,	%l4
loop_1968:
	sub	%o2,	0x06AD,	%l3
loop_1969:
	bleu,a,pn	%icc,	loop_1970
	edge16n	%l1,	%g2,	%l2
	tpos	%icc,	0x6
	fmovdgu	%icc,	%f22,	%f29
loop_1970:
	fpsub16s	%f7,	%f11,	%f12
	sdivx	%i6,	0x1CEC,	%l0
	edge32ln	%o5,	%g3,	%g5
	fmovda	%icc,	%f31,	%f15
	ldsh	[%l7 + 0x32],	%o4
	tneg	%icc,	0x2
	bl,a	%icc,	loop_1971
	tvc	%xcc,	0x1
	bleu,a,pn	%icc,	loop_1972
	fbule	%fcc1,	loop_1973
loop_1971:
	fnot2s	%f10,	%f5
	umul	%g6,	%g7,	%i7
loop_1972:
	edge32	%i2,	%o6,	%i1
loop_1973:
	tcs	%icc,	0x7
	fcmped	%fcc2,	%f26,	%f0
	tcc	%icc,	0x1
	udivcc	%l6,	0x0E51,	%i5
	sth	%g1,	[%l7 + 0x48]
	edge8	%l5,	%i4,	%o3
	fand	%f8,	%f14,	%f4
	fmovdvc	%xcc,	%f12,	%f9
	std	%f10,	[%l7 + 0x48]
	edge32ln	%o7,	%g4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o0,	0x00EF,	%i0
	tg	%icc,	0x4
	movpos	%xcc,	%l4,	%o1
	tne	%xcc,	0x3
	movre	%l3,	%o2,	%g2
	sethi	0x08AF,	%l1
	fmovrsgez	%i6,	%f7,	%f20
	tne	%xcc,	0x0
	stw	%l0,	[%l7 + 0x10]
	brgez,a	%o5,	loop_1974
	addcc	%l2,	0x18BD,	%g3
	addcc	%g5,	%o4,	%g7
	for	%f12,	%f20,	%f8
loop_1974:
	tneg	%icc,	0x0
	edge32n	%g6,	%i2,	%o6
	movrgez	%i1,	0x39A,	%l6
	brz	%i7,	loop_1975
	sethi	0x0E57,	%g1
	bpos,pt	%xcc,	loop_1976
	stbar
loop_1975:
	movrlez	%l5,	0x0EF,	%i5
	fmovrse	%o3,	%f5,	%f30
loop_1976:
	fcmpgt32	%f16,	%f26,	%i4
	subc	%g4,	%i3,	%o7
	movleu	%icc,	%i0,	%l4
	move	%icc,	%o1,	%o0
	call	loop_1977
	fmovrse	%o2,	%f24,	%f17
	popc	%l3,	%g2
	edge32l	%l1,	%l0,	%o5
loop_1977:
	edge8ln	%i6,	%g3,	%l2
	nop
	setx loop_1978, %l0, %l1
	jmpl %l1, %g5
	fmovdle	%icc,	%f3,	%f31
	tcs	%icc,	0x3
	fpmerge	%f16,	%f2,	%f2
loop_1978:
	array8	%o4,	%g7,	%i2
	sdivx	%g6,	0x02BB,	%i1
	move	%xcc,	%l6,	%o6
	tcc	%xcc,	0x3
	nop
	setx	loop_1979,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%i7,	0x0A,	%g1
	nop
	set	0x6E, %o6
	sth	%i5,	[%l7 + %o6]
	fsrc1	%f14,	%f30
loop_1979:
	tneg	%xcc,	0x7
	tg	%icc,	0x5
	taddcctv	%o3,	%i4,	%l5
	fbge	%fcc2,	loop_1980
	fsrc1s	%f6,	%f3
	tsubcc	%i3,	%g4,	%o7
	fmovscs	%xcc,	%f23,	%f19
loop_1980:
	bneg,a	%xcc,	loop_1981
	edge16ln	%l4,	%o1,	%i0
	xnor	%o0,	0x1DE4,	%l3
	tgu	%icc,	0x2
loop_1981:
	sub	%g2,	%o2,	%l0
	fbug,a	%fcc1,	loop_1982
	stw	%o5,	[%l7 + 0x08]
	fmovsvc	%icc,	%f6,	%f27
	fbul,a	%fcc3,	loop_1983
loop_1982:
	mova	%icc,	%i6,	%g3
	edge8l	%l2,	%g5,	%o4
	tgu	%xcc,	0x3
loop_1983:
	smulcc	%l1,	0x1F31,	%g7
	movpos	%icc,	%i2,	%g6
	sll	%l6,	0x04,	%o6
	te	%icc,	0x0
	movge	%icc,	%i1,	%i7
	ble,pt	%icc,	loop_1984
	fmovdvc	%xcc,	%f17,	%f12
	movn	%xcc,	%g1,	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l5
loop_1984:
	fmovrsgz	%i4,	%f15,	%f23
	sir	0x0F52
	tsubcctv	%g4,	%i3,	%l4
	mova	%icc,	%o1,	%o7
	fmovscs	%xcc,	%f0,	%f11
	move	%xcc,	%i0,	%l3
	set	0x10, %o3
	stda	%g2,	[%l7 + %o3] 0xea
	membar	#Sync
	udiv	%o0,	0x1705,	%o2
	fsrc2	%f8,	%f20
	fbuge	%fcc1,	loop_1985
	andncc	%o5,	%i6,	%g3
	sll	%l2,	0x1C,	%g5
	movne	%icc,	%o4,	%l1
loop_1985:
	tsubcc	%g7,	0x18E4,	%i2
	addcc	%l0,	0x1FD4,	%l6
	st	%f20,	[%l7 + 0x0C]
	xorcc	%g6,	0x1860,	%i1
	ta	%icc,	0x6
	bgu	loop_1986
	fnot1s	%f0,	%f7
	fsrc1s	%f28,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1986:
	fbul,a	%fcc0,	loop_1987
	tne	%xcc,	0x3
	fcmps	%fcc3,	%f26,	%f19
	mulscc	%i7,	0x087F,	%g1
loop_1987:
	tne	%xcc,	0x5
	fmovdvc	%xcc,	%f10,	%f10
	tcc	%icc,	0x3
	tle	%icc,	0x7
	sir	0x00B8
	fcmple32	%f10,	%f30,	%o6
	umulcc	%o3,	0x0081,	%l5
	subccc	%i4,	0x0DBA,	%i5
	brgez,a	%g4,	loop_1988
	fmovsge	%xcc,	%f25,	%f14
	andncc	%l4,	%i3,	%o7
	tcc	%xcc,	0x1
loop_1988:
	tg	%xcc,	0x7
	movneg	%xcc,	%i0,	%o1
	or	%g2,	%l3,	%o0
	addccc	%o2,	0x1754,	%o5
	fmovdl	%xcc,	%f11,	%f16
	fpsub32	%f10,	%f0,	%f12
	edge16l	%i6,	%g3,	%l2
	edge16n	%g5,	%l1,	%g7
	fmovdg	%icc,	%f13,	%f24
	fbug,a	%fcc1,	loop_1989
	fpack32	%f26,	%f18,	%f20
	fmovdneg	%xcc,	%f11,	%f14
	sethi	0x176F,	%i2
loop_1989:
	fsrc1s	%f22,	%f19
	sdivx	%l0,	0x1630,	%o4
	edge8n	%l6,	%g6,	%i7
	ldstub	[%l7 + 0x52],	%g1
	array8	%o6,	%i1,	%l5
	brz,a	%o3,	loop_1990
	popc	0x1E63,	%i5
	tle	%xcc,	0x4
	orncc	%g4,	0x16BF,	%i4
loop_1990:
	movpos	%xcc,	%l4,	%o7
	fpack16	%f20,	%f21
	fmovdge	%icc,	%f28,	%f5
	fxors	%f24,	%f30,	%f5
	ld	[%l7 + 0x78],	%f15
	edge16l	%i0,	%i3,	%o1
	te	%icc,	0x4
	fbe	%fcc0,	loop_1991
	alignaddr	%g2,	%l3,	%o0
	movl	%icc,	%o5,	%i6
	fbge,a	%fcc0,	loop_1992
loop_1991:
	tle	%xcc,	0x5
	edge32n	%g3,	%o2,	%g5
	movgu	%icc,	%l1,	%g7
loop_1992:
	udivx	%i2,	0x1120,	%l2
	umul	%l0,	0x1B13,	%l6
	popc	0x15F0,	%o4
	te	%icc,	0x4
	wr	%g0,	0x23,	%asi
	stha	%i7,	[%l7 + 0x70] %asi
	membar	#Sync
	set	0x4A, %o4
	ldsha	[%l7 + %o4] 0x19,	%g6
	ldub	[%l7 + 0x6C],	%o6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x54] %asi,	%f18
	edge16ln	%i1,	%g1,	%o3
	movrlz	%l5,	0x14C,	%g4
	tgu	%xcc,	0x2
	movn	%icc,	%i4,	%l4
	fnot1	%f14,	%f18
	swap	[%l7 + 0x34],	%i5
	fcmple32	%f6,	%f20,	%o7
	add	%i0,	%i3,	%o1
	stw	%l3,	[%l7 + 0x70]
	set	0x50, %i2
	lda	[%l7 + %i2] 0x81,	%f0
	fnot1	%f2,	%f28
	srlx	%g2,	%o5,	%i6
	subc	%g3,	%o0,	%g5
	fmovdg	%xcc,	%f29,	%f29
	set	0x70, %l0
	stda	%l0,	[%l7 + %l0] 0x88
	movrne	%g7,	%i2,	%l2
	wr	%g0,	0x2f,	%asi
	stha	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc3,	loop_1993
	fcmpeq32	%f18,	%f20,	%l0
	fbule	%fcc1,	loop_1994
	xor	%o4,	0x1AE5,	%i7
loop_1993:
	addcc	%g6,	0x00FA,	%l6
	fmovsgu	%icc,	%f7,	%f24
loop_1994:
	bpos,a	loop_1995
	fxnor	%f2,	%f20,	%f22
	sllx	%i1,	0x01,	%o6
	movrne	%g1,	0x250,	%l5
loop_1995:
	te	%xcc,	0x7
	smulcc	%g4,	0x16E0,	%o3
	movvs	%icc,	%i4,	%l4
	movge	%xcc,	%o7,	%i5
	fmovdcs	%icc,	%f30,	%f30
	fmovscs	%icc,	%f3,	%f0
	fsrc1s	%f22,	%f29
	fbuge,a	%fcc2,	loop_1996
	edge32n	%i3,	%o1,	%l3
	edge8n	%g2,	%o5,	%i0
	bne,a	%xcc,	loop_1997
loop_1996:
	udivcc	%i6,	0x0CD8,	%g3
	fmovrde	%g5,	%f14,	%f20
	ld	[%l7 + 0x70],	%f23
loop_1997:
	fmovrde	%o0,	%f2,	%f14
	lduh	[%l7 + 0x6E],	%l1
	fmovdne	%icc,	%f22,	%f3
	srl	%g7,	0x00,	%l2
	movvs	%icc,	%o2,	%l0
	movneg	%xcc,	%i2,	%o4
	udiv	%g6,	0x17DE,	%i7
	st	%f7,	[%l7 + 0x6C]
	fnands	%f17,	%f23,	%f28
	bneg	loop_1998
	fmovs	%f26,	%f9
	fbg,a	%fcc0,	loop_1999
	tg	%xcc,	0x2
loop_1998:
	movcc	%icc,	%i1,	%o6
	fba,a	%fcc1,	loop_2000
loop_1999:
	and	%g1,	0x14EB,	%l6
	srl	%l5,	0x1C,	%o3
	xnor	%g4,	%i4,	%l4
loop_2000:
	fmovda	%icc,	%f9,	%f31
	movcc	%xcc,	%i5,	%o7
	bgu,a	loop_2001
	movneg	%icc,	%o1,	%l3
	array32	%g2,	%o5,	%i3
	te	%xcc,	0x3
loop_2001:
	fandnot2s	%f30,	%f13,	%f19
	tge	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x44] %asi,	%i0
	fmovsne	%icc,	%f24,	%f26
	fxnor	%f26,	%f6,	%f6
	srlx	%i6,	%g5,	%g3
	fble	%fcc0,	loop_2002
	xnor	%l1,	0x0604,	%o0
	fmovrdlez	%l2,	%f8,	%f4
	umulcc	%o2,	%l0,	%g7
loop_2002:
	fba,a	%fcc3,	loop_2003
	fmovsne	%xcc,	%f18,	%f24
	fmovdvs	%xcc,	%f18,	%f14
	fmovse	%icc,	%f27,	%f2
loop_2003:
	movleu	%icc,	%i2,	%g6
	array8	%i7,	%o4,	%i1
	smul	%g1,	0x1A5D,	%l6
	subc	%o6,	%o3,	%g4
	edge16l	%l5,	%i4,	%l4
	ldsh	[%l7 + 0x1E],	%o7
	fpsub32s	%f10,	%f9,	%f16
	andncc	%o1,	%i5,	%g2
	xnorcc	%l3,	%o5,	%i0
	tn	%icc,	0x4
	te	%xcc,	0x7
	sllx	%i6,	0x03,	%i3
	movne	%icc,	%g3,	%l1
	mova	%xcc,	%o0,	%l2
	be	loop_2004
	tl	%xcc,	0x7
	fmul8x16	%f6,	%f18,	%f30
	sethi	0x1119,	%g5
loop_2004:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o2
	ba,pt	%icc,	loop_2005
	fpack16	%f24,	%f18
	movl	%icc,	%l0,	%g7
	mova	%xcc,	%g6,	%i2
loop_2005:
	fmovdn	%xcc,	%f15,	%f4
	smul	%i7,	0x1879,	%o4
	sth	%i1,	[%l7 + 0x32]
	wr	%g0,	0x81,	%asi
	stba	%l6,	[%l7 + 0x30] %asi
	bg,pt	%xcc,	loop_2006
	xnor	%o6,	%g1,	%o3
	fmovsle	%icc,	%f6,	%f25
	faligndata	%f18,	%f30,	%f8
loop_2006:
	bl,a	%icc,	loop_2007
	movvc	%icc,	%l5,	%g4
	fmuld8ulx16	%f16,	%f9,	%f22
	movpos	%icc,	%i4,	%o7
loop_2007:
	fcmped	%fcc2,	%f6,	%f28
	movpos	%icc,	%l4,	%i5
	movg	%xcc,	%o1,	%l3
	tl	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x14] %asi,	%f19
	fbo,a	%fcc1,	loop_2008
	bcs	loop_2009
	movne	%icc,	%g2,	%i0
	ldd	[%l7 + 0x38],	%o4
loop_2008:
	array32	%i3,	%i6,	%g3
loop_2009:
	taddcc	%o0,	%l1,	%l2
	array16	%g5,	%l0,	%o2
	fba,a	%fcc2,	loop_2010
	udivcc	%g6,	0x11FF,	%g7
	te	%icc,	0x6
	fbule,a	%fcc3,	loop_2011
loop_2010:
	xor	%i2,	0x054F,	%o4
	array8	%i7,	%i1,	%o6
	fbg,a	%fcc0,	loop_2012
loop_2011:
	fbe,a	%fcc3,	loop_2013
	movrlez	%l6,	%o3,	%g1
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
loop_2012:
	fmovsn	%xcc,	%f25,	%f24
loop_2013:
	xnor	%g4,	%i4,	%l5
	udiv	%o7,	0x0AB9,	%i5
loop_2014:
	nop
	set	0x0C, %i7
	sta	%f11,	[%l7 + %i7] 0x04
	movle	%icc,	%o1,	%l4
	fble,a	%fcc2,	loop_2015
	fmovsvc	%icc,	%f19,	%f2
	sdiv	%l3,	0x1557,	%i0
	fbl	%fcc0,	loop_2016
loop_2015:
	movle	%xcc,	%o5,	%g2
	movcc	%icc,	%i6,	%g3
	fba	%fcc3,	loop_2017
loop_2016:
	srl	%o0,	0x18,	%i3
	alignaddrl	%l2,	%l1,	%g5
	tl	%xcc,	0x7
loop_2017:
	edge16ln	%l0,	%o2,	%g6
	fmovdgu	%icc,	%f2,	%f21
	movgu	%icc,	%i2,	%g7
	mova	%icc,	%o4,	%i1
	taddcctv	%i7,	0x1D43,	%l6
	fblg	%fcc1,	loop_2018
	edge16	%o6,	%g1,	%g4
	pdist	%f24,	%f0,	%f14
	fnegs	%f8,	%f6
loop_2018:
	brlez	%o3,	loop_2019
	bshuffle	%f0,	%f6,	%f0
	fbl	%fcc2,	loop_2020
	bleu,pn	%xcc,	loop_2021
loop_2019:
	udivx	%l5,	0x1125,	%o7
	nop
	setx	loop_2022,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2020:
	udivx	%i4,	0x06E7,	%o1
loop_2021:
	mulx	%i5,	0x1427,	%l3
	stx	%l4,	[%l7 + 0x20]
loop_2022:
	movrgez	%o5,	0x0E9,	%i0
	fblg	%fcc3,	loop_2023
	fbu	%fcc3,	loop_2024
	movne	%icc,	%g2,	%i6
	wr	%g0,	0x80,	%asi
	stwa	%g3,	[%l7 + 0x68] %asi
loop_2023:
	movcc	%icc,	%o0,	%i3
loop_2024:
	addcc	%l1,	%l2,	%g5
	movleu	%icc,	%o2,	%g6
	fmovsle	%xcc,	%f16,	%f2
	smul	%l0,	%g7,	%i2
	subc	%o4,	0x0AEA,	%i7
	fba,a	%fcc2,	loop_2025
	array16	%i1,	%l6,	%g1
	udivx	%o6,	0x161A,	%g4
	set	0x54, %i6
	stha	%o3,	[%l7 + %i6] 0x0c
loop_2025:
	tsubcctv	%l5,	%o7,	%i4
	fornot2	%f16,	%f26,	%f8
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f16
	sub	%o1,	%l3,	%l4
	nop
	setx loop_2026, %l0, %l1
	jmpl %l1, %o5
	sth	%i5,	[%l7 + 0x48]
	sethi	0x03B8,	%g2
	fcmpeq32	%f4,	%f22,	%i0
loop_2026:
	edge8l	%g3,	%i6,	%i3
	and	%o0,	0x13D4,	%l2
	prefetch	[%l7 + 0x0C],	 0x0
	nop
	set	0x10, %i1
	ldsh	[%l7 + %i1],	%g5
	fbug	%fcc3,	loop_2027
	std	%l0,	[%l7 + 0x68]
	srlx	%g6,	0x14,	%l0
	array8	%o2,	%g7,	%o4
loop_2027:
	fpsub16s	%f17,	%f8,	%f16
	xnor	%i2,	0x02FC,	%i7
	movrlz	%i1,	0x0E5,	%l6
	sdivx	%o6,	0x0F7F,	%g1
	fpsub32	%f6,	%f30,	%f24
	fmovdneg	%icc,	%f25,	%f0
	tleu	%xcc,	0x3
	tn	%xcc,	0x4
	popc	%g4,	%l5
	movrlz	%o3,	0x252,	%i4
	sdivcc	%o7,	0x02B9,	%o1
	edge8n	%l4,	%l3,	%o5
	fmovsleu	%xcc,	%f31,	%f27
	fabsd	%f16,	%f8
	tn	%icc,	0x4
	fbo,a	%fcc2,	loop_2028
	andn	%g2,	%i5,	%g3
	orncc	%i0,	0x002D,	%i3
	fba,a	%fcc0,	loop_2029
loop_2028:
	fmovrslz	%o0,	%f2,	%f17
	std	%l2,	[%l7 + 0x28]
	tneg	%icc,	0x5
loop_2029:
	smul	%g5,	%l1,	%g6
	ldstub	[%l7 + 0x7E],	%i6
	std	%l0,	[%l7 + 0x08]
	and	%o2,	0x183F,	%o4
	tg	%xcc,	0x2
	mulscc	%g7,	0x0885,	%i7
	ble,a	loop_2030
	edge8n	%i1,	%l6,	%i2
	lduw	[%l7 + 0x50],	%o6
	movpos	%xcc,	%g1,	%l5
loop_2030:
	mulscc	%o3,	%g4,	%o7
	umulcc	%i4,	0x1C2A,	%o1
	tneg	%xcc,	0x4
	srlx	%l3,	0x10,	%o5
	fmovrsgez	%l4,	%f30,	%f2
	mulx	%g2,	%i5,	%g3
	fbu,a	%fcc2,	loop_2031
	fmovse	%icc,	%f26,	%f29
	edge16ln	%i3,	%o0,	%l2
	ldsw	[%l7 + 0x08],	%g5
loop_2031:
	fands	%f7,	%f30,	%f23
	fmovs	%f19,	%f25
	prefetch	[%l7 + 0x78],	 0x2
	array16	%i0,	%l1,	%g6
	mulx	%i6,	%l0,	%o2
	fzeros	%f9
	edge8n	%o4,	%i7,	%g7
	fba	%fcc0,	loop_2032
	sll	%l6,	0x1E,	%i2
	ldstub	[%l7 + 0x54],	%o6
	fmovsvs	%xcc,	%f25,	%f11
loop_2032:
	edge16l	%g1,	%i1,	%l5
	bl,a,pt	%icc,	loop_2033
	orn	%o3,	%o7,	%g4
	ble,a,pt	%icc,	loop_2034
	edge32l	%i4,	%o1,	%l3
loop_2033:
	bcs	%icc,	loop_2035
	xorcc	%o5,	%g2,	%i5
loop_2034:
	tne	%xcc,	0x5
	edge16n	%l4,	%g3,	%i3
loop_2035:
	fbe,a	%fcc0,	loop_2036
	tcc	%xcc,	0x5
	stb	%o0,	[%l7 + 0x1C]
	stx	%l2,	[%l7 + 0x70]
loop_2036:
	stbar
	fornot2	%f6,	%f2,	%f26
	bcc,a	%icc,	loop_2037
	movcs	%icc,	%g5,	%l1
	movl	%icc,	%i0,	%i6
	fmul8x16al	%f30,	%f28,	%f6
loop_2037:
	movvs	%icc,	%l0,	%o2
	membar	0x32
	fbg,a	%fcc0,	loop_2038
	udivcc	%g6,	0x0A4B,	%o4
	array32	%i7,	%g7,	%l6
	tne	%xcc,	0x2
loop_2038:
	fbne,a	%fcc0,	loop_2039
	xnorcc	%o6,	%i2,	%i1
	tle	%icc,	0x2
	array32	%g1,	%l5,	%o7
loop_2039:
	tgu	%icc,	0x3
	andn	%o3,	%g4,	%o1
	smulcc	%l3,	0x1AB7,	%o5
	bvs,pn	%icc,	loop_2040
	bne	%icc,	loop_2041
	fcmpgt16	%f12,	%f0,	%i4
	flush	%l7 + 0x4C
loop_2040:
	fbn,a	%fcc2,	loop_2042
loop_2041:
	st	%f19,	[%l7 + 0x10]
	sethi	0x1F19,	%i5
	sdiv	%l4,	0x02C7,	%g3
loop_2042:
	orn	%i3,	%o0,	%g2
	fcmps	%fcc1,	%f19,	%f29
	call	loop_2043
	edge16n	%g5,	%l2,	%l1
	brgez,a	%i0,	loop_2044
	tg	%xcc,	0x2
loop_2043:
	taddcctv	%l0,	0x0DC3,	%o2
	alignaddrl	%i6,	%o4,	%g6
loop_2044:
	fbug	%fcc0,	loop_2045
	for	%f24,	%f26,	%f18
	tsubcc	%i7,	0x1166,	%g7
	movn	%icc,	%o6,	%i2
loop_2045:
	movle	%xcc,	%l6,	%g1
	edge8	%l5,	%o7,	%o3
	tvc	%icc,	0x7
	movgu	%icc,	%i1,	%o1
	set	0x28, %i3
	sta	%f21,	[%l7 + %i3] 0x14
	edge32ln	%l3,	%g4,	%i4
	srlx	%i5,	0x16,	%o5
	sll	%l4,	%i3,	%o0
	movleu	%icc,	%g3,	%g5
	ldub	[%l7 + 0x6F],	%l2
	fnors	%f5,	%f6,	%f2
	movpos	%xcc,	%l1,	%g2
	addcc	%l0,	0x1712,	%i0
	call	loop_2046
	mova	%xcc,	%i6,	%o2
	set	0x2C, %o1
	ldsha	[%l7 + %o1] 0x80,	%g6
loop_2046:
	ldx	[%l7 + 0x08],	%o4
	fmuld8ulx16	%f3,	%f13,	%f16
	sdivcc	%g7,	0x05BE,	%o6
	movrlz	%i7,	%l6,	%g1
	udivcc	%l5,	0x10F0,	%o7
	alignaddrl	%i2,	%i1,	%o1
	fbu	%fcc2,	loop_2047
	movrlez	%o3,	%l3,	%i4
	orcc	%g4,	0x0F1E,	%i5
	udiv	%o5,	0x16FD,	%i3
loop_2047:
	fmovdcc	%icc,	%f18,	%f17
	bneg	%icc,	loop_2048
	tgu	%xcc,	0x1
	st	%f25,	[%l7 + 0x30]
	ldsh	[%l7 + 0x2A],	%l4
loop_2048:
	nop
	set	0x3C, %l1
	ldswa	[%l7 + %l1] 0x14,	%o0
	and	%g5,	0x1720,	%g3
	movrne	%l2,	0x1D0,	%g2
	bgu,a	%xcc,	loop_2049
	fcmpes	%fcc0,	%f29,	%f30
	fandnot1s	%f20,	%f21,	%f28
	movpos	%xcc,	%l1,	%i0
loop_2049:
	sth	%l0,	[%l7 + 0x36]
	bvs,pt	%icc,	loop_2050
	xorcc	%o2,	0x0A47,	%i6
	movn	%xcc,	%g6,	%g7
	edge8n	%o4,	%o6,	%l6
loop_2050:
	movrlez	%i7,	%l5,	%o7
	taddcctv	%g1,	0x0274,	%i1
	subc	%i2,	0x0338,	%o3
	mulscc	%l3,	%o1,	%i4
	set	0x78, %i4
	stda	%i4,	[%l7 + %i4] 0x89
	fbge	%fcc1,	loop_2051
	fmovrde	%g4,	%f22,	%f26
	sll	%o5,	%i3,	%o0
	sllx	%g5,	0x13,	%l4
loop_2051:
	sdivcc	%l2,	0x162B,	%g2
	fmovrdlz	%g3,	%f4,	%f12
	xorcc	%l1,	0x1E41,	%i0
	wr	%g0,	0x19,	%asi
	sta	%f28,	[%l7 + 0x0C] %asi
	taddcctv	%o2,	0x1678,	%i6
	tle	%xcc,	0x2
	bpos,a	%xcc,	loop_2052
	fmovdcc	%xcc,	%f9,	%f9
	udivx	%g6,	0x0283,	%g7
	ldd	[%l7 + 0x08],	%l0
loop_2052:
	fmovscc	%icc,	%f24,	%f3
	sra	%o4,	0x01,	%l6
	fpsub32	%f8,	%f18,	%f24
	subc	%o6,	0x1AA5,	%l5
	fnot2	%f0,	%f24
	std	%o6,	[%l7 + 0x68]
	tpos	%xcc,	0x5
	edge8n	%g1,	%i7,	%i2
	set	0x78, %l4
	stda	%i0,	[%l7 + %l4] 0xeb
	membar	#Sync
	srl	%o3,	%l3,	%i4
	umulcc	%i5,	%g4,	%o5
	fmovdcc	%xcc,	%f16,	%f21
	bn,a,pn	%icc,	loop_2053
	movcc	%xcc,	%o1,	%i3
	fornot2s	%f24,	%f20,	%f7
	ldd	[%l7 + 0x70],	%g4
loop_2053:
	sll	%o0,	%l2,	%g2
	fcmple16	%f14,	%f10,	%l4
	mulscc	%g3,	%l1,	%i0
	std	%f28,	[%l7 + 0x48]
	fmovrsgz	%i6,	%f1,	%f2
	taddcc	%g6,	%g7,	%o2
	edge8	%o4,	%l6,	%l0
	brlz	%l5,	loop_2054
	fbne,a	%fcc0,	loop_2055
	umulcc	%o6,	%o7,	%g1
	andncc	%i7,	%i1,	%o3
loop_2054:
	sll	%i2,	0x1E,	%l3
loop_2055:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i4
	edge32n	%i5,	%o5,	%g4
	fblg	%fcc0,	loop_2056
	move	%xcc,	%i3,	%g5
	fmovse	%xcc,	%f19,	%f29
	movrlz	%o1,	0x24A,	%o0
loop_2056:
	fpadd32s	%f14,	%f25,	%f30
	fpackfix	%f2,	%f24
	fmovrdlz	%g2,	%f0,	%f18
	array8	%l4,	%g3,	%l1
	fmovspos	%icc,	%f14,	%f13
	xnorcc	%i0,	0x1CEF,	%l2
	sth	%i6,	[%l7 + 0x56]
	edge8ln	%g7,	%o2,	%g6
	fmovsn	%xcc,	%f12,	%f9
	xnor	%o4,	0x13E8,	%l6
	srl	%l0,	0x04,	%o6
	set	0x5C, %l6
	ldsba	[%l7 + %l6] 0x19,	%o7
	mova	%xcc,	%g1,	%i7
	movleu	%icc,	%i1,	%l5
	edge8	%i2,	%o3,	%i4
	tvs	%xcc,	0x5
	brz,a	%l3,	loop_2057
	andcc	%o5,	0x04CF,	%i5
	orcc	%g4,	%i3,	%o1
	array8	%o0,	%g5,	%g2
loop_2057:
	lduw	[%l7 + 0x70],	%g3
	edge32l	%l1,	%i0,	%l2
	edge16	%l4,	%g7,	%o2
	movle	%icc,	%g6,	%i6
	sra	%l6,	%l0,	%o6
	and	%o4,	%g1,	%i7
	bpos	loop_2058
	stbar
	ldx	[%l7 + 0x38],	%o7
	andncc	%i1,	%i2,	%l5
loop_2058:
	add	%i4,	%l3,	%o3
	alignaddrl	%o5,	%i5,	%g4
	xorcc	%o1,	%o0,	%g5
	tg	%icc,	0x1
	call	loop_2059
	addcc	%g2,	0x0B4B,	%g3
	xnor	%l1,	0x1405,	%i0
	sdivx	%i3,	0x1F4F,	%l2
loop_2059:
	movre	%g7,	0x3CF,	%l4
	umulcc	%o2,	0x0296,	%i6
	lduw	[%l7 + 0x54],	%g6
	fmovrdlz	%l6,	%f16,	%f20
	brlez,a	%l0,	loop_2060
	fsrc2	%f22,	%f22
	fmovdgu	%xcc,	%f4,	%f26
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
loop_2060:
	andcc	%g1,	%i7,	%o4
	brnz	%i1,	loop_2061
	edge8l	%i2,	%l5,	%i4
	tvc	%xcc,	0x3
	popc	%l3,	%o7
loop_2061:
	xnor	%o5,	0x1EA9,	%o3
	movne	%icc,	%i5,	%g4
	move	%icc,	%o0,	%g5
	fmuld8sux16	%f23,	%f3,	%f18
	srax	%g2,	%g3,	%o1
	fpsub32	%f26,	%f0,	%f12
	brnz,a	%l1,	loop_2062
	bleu,a	%xcc,	loop_2063
	fbule,a	%fcc0,	loop_2064
	srlx	%i3,	0x05,	%l2
loop_2062:
	alignaddr	%g7,	%l4,	%o2
loop_2063:
	fcmpes	%fcc0,	%f13,	%f0
loop_2064:
	faligndata	%f22,	%f10,	%f24
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	stw	%i6,	[%l7 + 0x44]
	movgu	%icc,	%g6,	%l0
	sir	0x144B
	udivcc	%o6,	0x1078,	%g1
	sdivx	%i7,	0x12E4,	%o4
	tcs	%icc,	0x1
	movn	%icc,	%i1,	%l6
	fnot2	%f30,	%f18
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sethi	0x1318,	%l5
	fone	%f10
	movn	%icc,	%i4,	%i2
	bn,pn	%xcc,	loop_2065
	fmovrse	%l3,	%f12,	%f23
	ta	%icc,	0x7
	set	0x48, %i0
	stwa	%o7,	[%l7 + %i0] 0x89
loop_2065:
	edge16n	%o5,	%i5,	%g4
	fcmpgt16	%f6,	%f30,	%o0
	ta	%icc,	0x2
	subccc	%g5,	%g2,	%o3
	tneg	%xcc,	0x1
	tcs	%icc,	0x3
	set	0x4C, %g7
	stwa	%o1,	[%l7 + %g7] 0x04
	array16	%l1,	%i3,	%g3
	addccc	%l2,	0x07D7,	%l4
	fcmpd	%fcc0,	%f16,	%f20
	ba	%icc,	loop_2066
	addccc	%g7,	0x0100,	%i0
	orn	%i6,	%g6,	%o2
	fpsub32s	%f9,	%f6,	%f2
loop_2066:
	movvs	%icc,	%o6,	%l0
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x1e
	membar	#Sync
	array16	%i7,	%o4,	%g1
	movcs	%xcc,	%i1,	%l6
	stw	%l5,	[%l7 + 0x7C]
	sdivcc	%i4,	0x13F4,	%l3
	mulx	%i2,	%o5,	%o7
	sub	%g4,	%o0,	%g5
	fcmple32	%f0,	%f0,	%g2
	std	%f6,	[%l7 + 0x50]
	edge8l	%i5,	%o1,	%l1
	ble,a,pt	%icc,	loop_2067
	mulx	%o3,	%g3,	%l2
	tn	%xcc,	0x5
	movg	%xcc,	%i3,	%l4
loop_2067:
	tleu	%xcc,	0x3
	fcmpne16	%f24,	%f8,	%i0
	mova	%xcc,	%g7,	%g6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%o2
	array32	%o6,	%i6,	%l0
	sir	0x1656
	fzeros	%f11
	orcc	%o4,	0x1951,	%i7
	movgu	%icc,	%i1,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%g1
	fmovrse	%i4,	%f8,	%f24
	lduw	[%l7 + 0x40],	%l3
	xor	%i2,	%o7,	%o5
	fcmpne32	%f0,	%f22,	%g4
	fsrc2	%f26,	%f24
	bpos	loop_2068
	membar	0x29
	and	%g5,	0x0ECB,	%o0
	fble,a	%fcc2,	loop_2069
loop_2068:
	tleu	%xcc,	0x2
	edge16	%i5,	%g2,	%l1
	fmovrde	%o1,	%f30,	%f12
loop_2069:
	fmovdcs	%icc,	%f5,	%f28
	sdiv	%g3,	0x08C9,	%l2
	tne	%icc,	0x3
	orn	%o3,	0x1490,	%l4
	sdiv	%i0,	0x0D78,	%i3
	srax	%g6,	%g7,	%o6
	sllx	%o2,	%l0,	%i6
	set	0x70, %l5
	sta	%f14,	[%l7 + %l5] 0x18
	fcmpeq16	%f22,	%f6,	%o4
	wr	%g0,	0x0c,	%asi
	stxa	%i7,	[%l7 + 0x08] %asi
	fbue,a	%fcc2,	loop_2070
	movn	%xcc,	%l6,	%l5
	xnor	%g1,	0x02FB,	%i4
	sdivcc	%i1,	0x1293,	%l3
loop_2070:
	fblg,a	%fcc0,	loop_2071
	tsubcctv	%o7,	0x1B53,	%o5
	fmovdvs	%icc,	%f22,	%f8
	set	0x38, %g3
	stda	%i2,	[%l7 + %g3] 0x10
loop_2071:
	fbuge,a	%fcc3,	loop_2072
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%g4,	%f4,	%f2
	xorcc	%o0,	%i5,	%g5
loop_2072:
	fmovrsne	%g2,	%f29,	%f14
	edge16n	%o1,	%g3,	%l1
	popc	0x0E6C,	%o3
	sub	%l4,	%i0,	%l2
	tvs	%xcc,	0x5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x66] %asi,	%g6
	edge16	%i3,	%g7,	%o2
	movrgez	%l0,	%i6,	%o6
	fornot2s	%f13,	%f15,	%f3
	tge	%icc,	0x0
	tcc	%icc,	0x1
	movre	%i7,	%o4,	%l5
	movneg	%icc,	%l6,	%i4
	smulcc	%i1,	%l3,	%o7
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf8
	membar	#Sync
	tge	%icc,	0x2
	andncc	%o5,	%i2,	%g4
	udiv	%g1,	0x09D3,	%i5
	nop
	setx	loop_2073,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x1B],	%g5
	xnorcc	%g2,	0x1082,	%o1
	movgu	%icc,	%g3,	%l1
loop_2073:
	fmovsl	%xcc,	%f1,	%f6
	bn,pn	%icc,	loop_2074
	array32	%o3,	%l4,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l2,	%g6,	%i0
loop_2074:
	tvc	%xcc,	0x3
	fxnors	%f31,	%f0,	%f29
	tvc	%icc,	0x5
	tsubcctv	%i3,	0x0961,	%g7
	umul	%o2,	%i6,	%o6
	fpsub16	%f28,	%f2,	%f22
	sub	%i7,	%l0,	%l5
	movre	%o4,	%i4,	%i1
	tcc	%icc,	0x2
	te	%icc,	0x3
	bn,a,pt	%icc,	loop_2075
	movneg	%icc,	%l6,	%l3
	move	%icc,	%o7,	%o5
	tn	%xcc,	0x1
loop_2075:
	fnot2	%f30,	%f26
	fpadd32s	%f1,	%f5,	%f4
	be,pt	%xcc,	loop_2076
	movn	%xcc,	%i2,	%g4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i5
loop_2076:
	edge8ln	%g5,	%g1,	%o1
	fbug,a	%fcc2,	loop_2077
	tg	%xcc,	0x0
	tl	%xcc,	0x7
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x26,	%g2
loop_2077:
	add	%g3,	%o3,	%l4
	alignaddrl	%l1,	%l2,	%o0
	mulx	%i0,	%i3,	%g7
	bneg,a,pt	%icc,	loop_2078
	sir	0x1009
	set	0x30, %g1
	ldswa	[%l7 + %g1] 0x10,	%o2
loop_2078:
	fmovsne	%icc,	%f28,	%f4
	tl	%icc,	0x1
	fcmped	%fcc2,	%f12,	%f4
	bn,a	loop_2079
	movrgez	%i6,	%o6,	%g6
	fpadd32s	%f24,	%f30,	%f12
	movle	%xcc,	%i7,	%l5
loop_2079:
	fmovrdgez	%o4,	%f24,	%f10
	movne	%xcc,	%l0,	%i4
	fandnot2s	%f30,	%f3,	%f4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l6,	%l3
	movrlez	%o7,	0x2ED,	%o5
	tge	%icc,	0x0
	brlz,a	%i1,	loop_2080
	ldd	[%l7 + 0x48],	%f12
	tvs	%icc,	0x6
	fpsub16	%f30,	%f18,	%f4
loop_2080:
	fmovrsgez	%i2,	%f23,	%f17
	taddcctv	%i5,	0x0C15,	%g5
	andcc	%g4,	%g1,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g3,	%o1,	%l4
	edge32l	%o3,	%l2,	%o0
	fmovdcc	%icc,	%f0,	%f27
	movcc	%icc,	%l1,	%i3
	edge32n	%i0,	%o2,	%i6
	srl	%o6,	%g7,	%i7
	movl	%icc,	%l5,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g6,	0x11D,	%i4
	tcs	%xcc,	0x3
	flush	%l7 + 0x34
	bcs,a	%xcc,	loop_2081
	bgu,a	%icc,	loop_2082
	fmovsle	%xcc,	%f8,	%f2
	udiv	%l0,	0x07EB,	%l6
loop_2081:
	subc	%o7,	0x19F2,	%o5
loop_2082:
	edge32ln	%i1,	%l3,	%i2
	and	%g5,	%g4,	%i5
	xnor	%g1,	0x1E86,	%g3
	orn	%o1,	0x0583,	%g2
	movrne	%o3,	0x0F1,	%l4
	ta	%xcc,	0x0
	lduw	[%l7 + 0x28],	%l2
	movrgez	%l1,	0x019,	%i3
	fmuld8sux16	%f12,	%f21,	%f12
	edge32l	%i0,	%o2,	%o0
	bcs,pn	%xcc,	loop_2083
	ldsb	[%l7 + 0x11],	%i6
	bge	%icc,	loop_2084
	ldsh	[%l7 + 0x50],	%o6
loop_2083:
	fnand	%f22,	%f6,	%f26
	set	0x60, %g2
	ldswa	[%l7 + %g2] 0x81,	%i7
loop_2084:
	xor	%l5,	%o4,	%g7
	tg	%icc,	0x0
	be,pn	%xcc,	loop_2085
	sir	0x1074
	fnot1s	%f6,	%f12
	movcs	%xcc,	%i4,	%l0
loop_2085:
	flush	%l7 + 0x24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g6,	%o7,	%l6
	tn	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrdlz	%i1,	%f4,	%f6
	set	0x40, %g5
	stxa	%l3,	[%l7 + %g5] 0xe3
	membar	#Sync
	wr	%g0,	0x11,	%asi
	stda	%i2,	[%l7 + 0x58] %asi
	taddcctv	%o5,	%g4,	%i5
	addccc	%g1,	0x155A,	%g5
	bneg,a	%xcc,	loop_2086
	movvs	%icc,	%g3,	%g2
	fand	%f0,	%f16,	%f16
	fmovdge	%xcc,	%f25,	%f10
loop_2086:
	movne	%icc,	%o3,	%l4
	movn	%icc,	%o1,	%l2
	udiv	%i3,	0x064D,	%l1
	fnors	%f19,	%f21,	%f26
	tge	%xcc,	0x3
	fmovsvc	%icc,	%f24,	%f1
	sdivcc	%i0,	0x09D5,	%o0
	sub	%o2,	%o6,	%i6
	fmovrde	%l5,	%f12,	%f0
	movcs	%xcc,	%o4,	%g7
	fblg,a	%fcc1,	loop_2087
	mulx	%i4,	%l0,	%g6
	movrgz	%o7,	0x242,	%l6
	movcc	%xcc,	%i7,	%i1
loop_2087:
	sub	%i2,	%l3,	%g4
	sethi	0x17F1,	%i5
	fbo,a	%fcc1,	loop_2088
	bgu	%xcc,	loop_2089
	fmul8x16	%f10,	%f8,	%f20
	tne	%xcc,	0x0
loop_2088:
	prefetch	[%l7 + 0x28],	 0x3
loop_2089:
	sdivcc	%o5,	0x1BE4,	%g1
	bg	%xcc,	loop_2090
	movcc	%xcc,	%g3,	%g5
	movl	%xcc,	%g2,	%o3
	fmovdvc	%icc,	%f31,	%f14
loop_2090:
	xorcc	%o1,	%l4,	%i3
	taddcctv	%l1,	0x1C35,	%i0
	ldub	[%l7 + 0x71],	%l2
	brgez,a	%o2,	loop_2091
	tge	%xcc,	0x5
	movne	%icc,	%o0,	%i6
	array8	%l5,	%o4,	%o6
loop_2091:
	tle	%xcc,	0x3
	edge32n	%g7,	%l0,	%g6
	sll	%o7,	0x1C,	%i4
	sir	0x126D
	array8	%i7,	%i1,	%l6
	st	%f28,	[%l7 + 0x6C]
	movrgez	%l3,	%i2,	%g4
	umul	%o5,	%i5,	%g1
	fmovrsgz	%g3,	%f13,	%f3
	bne	%xcc,	loop_2092
	fcmple32	%f4,	%f10,	%g2
	tn	%icc,	0x2
	fbe	%fcc1,	loop_2093
loop_2092:
	edge32l	%g5,	%o3,	%l4
	mulscc	%i3,	%o1,	%l1
	udivx	%i0,	0x0CD4,	%l2
loop_2093:
	bl	%icc,	loop_2094
	fpsub16	%f8,	%f16,	%f28
	fpack16	%f26,	%f28
	edge32ln	%o2,	%i6,	%l5
loop_2094:
	umulcc	%o0,	0x0070,	%o6
	edge8	%g7,	%o4,	%g6
	movpos	%xcc,	%l0,	%o7
	brlz,a	%i7,	loop_2095
	fsrc2s	%f29,	%f4
	fandnot1s	%f21,	%f12,	%f8
	xnor	%i1,	0x0E84,	%l6
loop_2095:
	andcc	%i4,	0x11C0,	%l3
	fbg,a	%fcc0,	loop_2096
	sllx	%i2,	%g4,	%o5
	stbar
	set	0x46, %g4
	lduha	[%l7 + %g4] 0x04,	%g1
loop_2096:
	nop
	wr	%g0,	0x23,	%asi
	stwa	%g3,	[%l7 + 0x50] %asi
	membar	#Sync
	umul	%i5,	%g5,	%g2
	lduh	[%l7 + 0x2A],	%l4
	edge8n	%o3,	%o1,	%i3
	nop
	setx loop_2097, %l0, %l1
	jmpl %l1, %l1
	swap	[%l7 + 0x10],	%l2
	movrgz	%o2,	0x33B,	%i6
	wr	%g0,	0x20,	%asi
	stxa	%l5,	[%g0 + 0x8] %asi
loop_2097:
	udiv	%o0,	0x0A08,	%i0
	fmovdg	%xcc,	%f15,	%f20
	movn	%icc,	%o6,	%o4
	andcc	%g7,	0x1430,	%g6
	tcc	%icc,	0x4
	tleu	%icc,	0x3
	fmovdcs	%xcc,	%f22,	%f12
	fmovsgu	%icc,	%f19,	%f11
	fands	%f24,	%f7,	%f20
	mova	%xcc,	%l0,	%o7
	taddcc	%i7,	0x03D8,	%i1
	alignaddr	%l6,	%l3,	%i2
	fmovsl	%xcc,	%f0,	%f19
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x62] %asi,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%o5,	loop_2098
	alignaddr	%g4,	%g1,	%g3
	ldsh	[%l7 + 0x38],	%i5
	edge8n	%g5,	%l4,	%g2
loop_2098:
	fbl	%fcc0,	loop_2099
	fpmerge	%f8,	%f7,	%f16
	tsubcctv	%o1,	%i3,	%l1
	fpadd32	%f18,	%f22,	%f4
loop_2099:
	fxor	%f26,	%f12,	%f10
	movrlz	%l2,	%o3,	%i6
	edge32l	%o2,	%o0,	%i0
	lduh	[%l7 + 0x24],	%l5
	edge16n	%o6,	%g7,	%g6
	alignaddrl	%l0,	%o4,	%o7
	alignaddrl	%i7,	%i1,	%l6
	taddcc	%i2,	0x1BAE,	%i4
	udivcc	%l3,	0x12FF,	%g4
	edge16l	%g1,	%g3,	%o5
	movcc	%icc,	%g5,	%i5
	edge8	%g2,	%o1,	%i3
	movn	%xcc,	%l4,	%l2
	fcmps	%fcc3,	%f23,	%f1
	brz,a	%l1,	loop_2100
	add	%i6,	0x1568,	%o3
	umul	%o0,	0x04DA,	%i0
	sdivcc	%l5,	0x072B,	%o2
loop_2100:
	nop
	set	0x36, %l2
	stha	%g7,	[%l7 + %l2] 0x2f
	membar	#Sync
	fbug	%fcc3,	loop_2101
	brgz	%g6,	loop_2102
	fcmpeq16	%f10,	%f28,	%l0
	stw	%o4,	[%l7 + 0x4C]
loop_2101:
	brgz	%o6,	loop_2103
loop_2102:
	fbu,a	%fcc1,	loop_2104
	movle	%icc,	%o7,	%i7
	fors	%f22,	%f29,	%f13
loop_2103:
	tsubcc	%i1,	0x0392,	%i2
loop_2104:
	movcs	%icc,	%l6,	%l3
	fexpand	%f0,	%f10
	bne,a	%icc,	loop_2105
	or	%i4,	0x0D65,	%g4
	edge32ln	%g3,	%o5,	%g5
	bcc,a,pt	%icc,	loop_2106
loop_2105:
	andn	%i5,	0x147B,	%g2
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2106:
	fmovdvc	%xcc,	%f2,	%f13
	xor	%o1,	%i3,	%l4
	fmovse	%icc,	%f0,	%f12
	alignaddrl	%l2,	%g1,	%l1
	nop
	set	0x5B, %o7
	ldstub	[%l7 + %o7],	%o3
	nop
	setx	loop_2107,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%o0,	%i0,	%l5
	stbar
	ldsb	[%l7 + 0x3A],	%o2
loop_2107:
	tcc	%icc,	0x5
	tl	%xcc,	0x5
	set	0x6E, %g6
	ldstuba	[%l7 + %g6] 0x18,	%i6
	fcmps	%fcc3,	%f20,	%f12
	taddcctv	%g6,	%l0,	%o4
	tsubcctv	%g7,	%o7,	%o6
	udiv	%i1,	0x0F58,	%i2
	movcc	%icc,	%l6,	%i7
	sir	0x0BF7
	fnot1s	%f19,	%f15
	bgu,a	%xcc,	loop_2108
	fmovsl	%icc,	%f23,	%f23
	sdiv	%l3,	0x1FDB,	%g4
	add	%g3,	0x0EA5,	%i4
loop_2108:
	brz,a	%g5,	loop_2109
	edge8l	%i5,	%o5,	%o1
	smul	%g2,	%l4,	%i3
	ld	[%l7 + 0x20],	%f27
loop_2109:
	fbe,a	%fcc1,	loop_2110
	fcmpne16	%f22,	%f18,	%l2
	mulx	%g1,	0x016F,	%o3
	tg	%xcc,	0x1
loop_2110:
	fbne	%fcc2,	loop_2111
	fmovrdlz	%o0,	%f16,	%f18
	sra	%i0,	0x1F,	%l1
	fmovsn	%icc,	%f7,	%f9
loop_2111:
	movvc	%xcc,	%l5,	%o2
	edge8l	%i6,	%l0,	%o4
	edge16l	%g6,	%g7,	%o6
	fand	%f22,	%f10,	%f4
	xnorcc	%o7,	0x1C1F,	%i1
	movcc	%xcc,	%l6,	%i2
	fandnot1	%f22,	%f12,	%f6
	addc	%l3,	%i7,	%g4
	sll	%g3,	%i4,	%g5
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
	ldd	[%l7 + 0x68],	%f24
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
	fmovdle	%xcc,	%f25,	%f0
	fsrc2	%f10,	%f4
	tneg	%xcc,	0x0
loop_2112:
	fmovrdgz	%o1,	%f12,	%f28
	lduh	[%l7 + 0x2E],	%g2
	fmul8x16	%f31,	%f4,	%f16
	bcs,pt	%xcc,	loop_2113
	alignaddrl	%l4,	%o5,	%l2
	umul	%g1,	0x1F2F,	%i3
	bvc	%xcc,	loop_2114
loop_2113:
	sdiv	%o0,	0x0323,	%i0
	addccc	%o3,	0x11B9,	%l5
	stbar
loop_2114:
	orncc	%l1,	%i6,	%l0
	fpackfix	%f14,	%f13
	fxor	%f2,	%f14,	%f16
	sir	0x1E4A
	xnor	%o2,	%o4,	%g6
	tsubcctv	%o6,	0x027A,	%g7
	smul	%i1,	0x1E57,	%o7
	movle	%icc,	%l6,	%i2
	addccc	%l3,	0x1210,	%g4
	tvs	%icc,	0x1
	fpadd32	%f16,	%f4,	%f2
	fmovspos	%xcc,	%f31,	%f27
	movvs	%xcc,	%g3,	%i7
	fmovrsne	%i4,	%f19,	%f25
	bn,a,pn	%xcc,	loop_2115
	subccc	%g5,	0x163A,	%i5
	andncc	%o1,	%l4,	%g2
	fmovspos	%icc,	%f22,	%f22
loop_2115:
	smul	%l2,	0x1E5C,	%g1
	fble,a	%fcc3,	loop_2116
	smul	%i3,	%o0,	%o5
	fnot2	%f18,	%f24
	flush	%l7 + 0x0C
loop_2116:
	ld	[%l7 + 0x4C],	%f30
	tleu	%xcc,	0x6
	movrlz	%i0,	%l5,	%o3
	wr	%g0,	0x2a,	%asi
	stda	%i6,	[%l7 + 0x60] %asi
	membar	#Sync
	fmovrdlez	%l0,	%f4,	%f6
	tl	%icc,	0x3
	orn	%l1,	%o4,	%g6
	udivx	%o2,	0x1344,	%g7
	movrgez	%i1,	%o7,	%o6
	edge32	%l6,	%l3,	%g4
	srl	%g3,	0x06,	%i2
	fxnor	%f22,	%f8,	%f8
	smulcc	%i4,	0x1D5B,	%g5
	andncc	%i7,	%o1,	%l4
	edge8n	%i5,	%l2,	%g2
	bcs,a	%icc,	loop_2117
	sdiv	%i3,	0x0876,	%o0
	tn	%icc,	0x1
	prefetch	[%l7 + 0x14],	 0x2
loop_2117:
	fmovrdgz	%g1,	%f6,	%f22
	fmovdne	%xcc,	%f21,	%f20
	sll	%o5,	%l5,	%o3
	sethi	0x093C,	%i0
	addccc	%i6,	0x0A3F,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a,pt	%icc,	loop_2118
	fmovsa	%icc,	%f21,	%f14
	srl	%o4,	0x0D,	%l1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%g6
loop_2118:
	mulx	%g7,	0x1489,	%o2
	ldsb	[%l7 + 0x52],	%o7
	srlx	%o6,	%i1,	%l3
	subcc	%g4,	%g3,	%l6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	sethi	0x1ADB,	%i2
	move	%icc,	%g5,	%i7
	movrne	%i4,	0x0E9,	%o1
	udivx	%i5,	0x023E,	%l2
	tge	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrlez	%g2,	0x1A1,	%i3
	fxnors	%f24,	%f31,	%f9
	lduh	[%l7 + 0x5C],	%l4
	fandnot2s	%f29,	%f6,	%f6
	umul	%g1,	0x08DF,	%o5
	edge16n	%o0,	%o3,	%l5
	fmovsvc	%icc,	%f1,	%f31
	st	%f29,	[%l7 + 0x48]
	srl	%i0,	%l0,	%o4
	alignaddr	%l1,	%g6,	%g7
	stbar
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x80,	%o2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	movrlz	%o6,	0x359,	%i6
	tne	%icc,	0x0
	brgez	%i1,	loop_2119
	bne	%xcc,	loop_2120
	ldsh	[%l7 + 0x44],	%l3
	sethi	0x02DF,	%g4
loop_2119:
	movleu	%xcc,	%l6,	%g3
loop_2120:
	tl	%xcc,	0x4
	edge8n	%i2,	%g5,	%i4
	xorcc	%o1,	0x03FF,	%i7
	orn	%l2,	0x01DC,	%i5
	pdist	%f14,	%f4,	%f14
	movre	%i3,	0x28C,	%g2
	nop
	setx loop_2121, %l0, %l1
	jmpl %l1, %g1
	alignaddr	%o5,	%l4,	%o0
	tg	%xcc,	0x6
	movpos	%xcc,	%l5,	%o3
loop_2121:
	nop
	wr	%g0,	0x27,	%asi
	stha	%i0,	[%l7 + 0x54] %asi
	membar	#Sync
	smulcc	%l0,	%o4,	%g6
	fmovsleu	%xcc,	%f29,	%f15
	bn,a,pn	%xcc,	loop_2122
	ld	[%l7 + 0x70],	%f8
	fcmpne32	%f8,	%f0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2122:
	ldsw	[%l7 + 0x5C],	%g7
	orcc	%o2,	0x19C8,	%o6
	edge32n	%o7,	%i6,	%i1
	fpackfix	%f18,	%f6
	fmovrslz	%g4,	%f29,	%f14
	tvc	%xcc,	0x5
	subccc	%l3,	%g3,	%i2
	movgu	%xcc,	%g5,	%i4
	edge32	%o1,	%l6,	%l2
	set	0x50, %o3
	stda	%i6,	[%l7 + %o3] 0x22
	membar	#Sync
	movrgz	%i5,	0x370,	%g2
	tn	%xcc,	0x3
	brlez	%i3,	loop_2123
	tge	%icc,	0x6
	udiv	%g1,	0x12C9,	%o5
	tpos	%xcc,	0x7
loop_2123:
	edge32n	%o0,	%l5,	%o3
	sll	%l4,	%l0,	%o4
	fzeros	%f6
	array32	%i0,	%l1,	%g7
	bleu	%icc,	loop_2124
	fornot2	%f8,	%f10,	%f12
	movrlez	%g6,	%o2,	%o6
	or	%o7,	%i1,	%i6
loop_2124:
	fcmpne16	%f14,	%f10,	%g4
	tvc	%icc,	0x3
	fmovrdne	%g3,	%f14,	%f6
	xorcc	%l3,	%g5,	%i2
	fpsub16s	%f25,	%f17,	%f12
	faligndata	%f14,	%f4,	%f8
	fmovsleu	%icc,	%f15,	%f27
	movn	%icc,	%o1,	%i4
	fmovdvs	%icc,	%f16,	%f18
	andncc	%l2,	%l6,	%i7
	xnor	%g2,	%i5,	%g1
	call	loop_2125
	bshuffle	%f12,	%f14,	%f12
	array16	%i3,	%o0,	%l5
	tsubcc	%o5,	0x0B8B,	%o3
loop_2125:
	alignaddrl	%l4,	%l0,	%o4
	sllx	%l1,	0x0E,	%g7
	tle	%icc,	0x2
	fmovdne	%icc,	%f27,	%f25
	addcc	%i0,	0x1A04,	%o2
	movl	%xcc,	%g6,	%o7
	fcmpd	%fcc1,	%f0,	%f6
	edge16	%i1,	%i6,	%g4
	subccc	%o6,	%g3,	%g5
	fmovsvc	%xcc,	%f28,	%f4
	movg	%xcc,	%i2,	%o1
	sub	%i4,	%l3,	%l6
	fmul8sux16	%f20,	%f28,	%f12
	call	loop_2126
	fnegs	%f31,	%f20
	fcmpd	%fcc0,	%f8,	%f22
	movre	%i7,	0x2C6,	%g2
loop_2126:
	fblg	%fcc0,	loop_2127
	ldd	[%l7 + 0x48],	%l2
	edge32n	%g1,	%i3,	%o0
	fmovdneg	%icc,	%f30,	%f9
loop_2127:
	tsubcc	%l5,	0x0B28,	%o5
	movneg	%icc,	%i5,	%l4
	sll	%l0,	%o4,	%o3
	nop
	setx	loop_2128,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%l1,	%g7,	%o2
	fcmpgt16	%f30,	%f30,	%i0
	sdivcc	%g6,	0x1442,	%i1
loop_2128:
	fzeros	%f1
	set	0x53, %o4
	ldstuba	[%l7 + %o4] 0x18,	%o7
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	array16	%o6,	%i6,	%g5
	edge32n	%g3,	%o1,	%i2
	fbo	%fcc3,	loop_2129
	movpos	%xcc,	%l3,	%i4
	bvc,pn	%icc,	loop_2130
	taddcctv	%i7,	0x0569,	%g2
loop_2129:
	fxor	%f28,	%f30,	%f16
	fbuge,a	%fcc2,	loop_2131
loop_2130:
	tle	%xcc,	0x7
	fsrc2s	%f14,	%f7
	udivcc	%l2,	0x14DE,	%l6
loop_2131:
	bl,a	loop_2132
	sll	%g1,	0x1F,	%o0
	stb	%i3,	[%l7 + 0x47]
	sub	%l5,	%o5,	%l4
loop_2132:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i5,	%l0
	sth	%o4,	[%l7 + 0x48]
	move	%xcc,	%l1,	%o3
	orcc	%g7,	%i0,	%g6
	movrlez	%i1,	0x3F4,	%o2
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x18,	 0x3
	tcc	%icc,	0x1
	sethi	0x03F1,	%o6
	bg,a	%icc,	loop_2133
	edge16	%i6,	%g5,	%o7
	bg,a,pt	%icc,	loop_2134
	movre	%g3,	%i2,	%o1
loop_2133:
	fsrc1s	%f26,	%f31
	fble	%fcc3,	loop_2135
loop_2134:
	fcmpeq16	%f22,	%f30,	%i4
	tsubcctv	%l3,	%g2,	%l2
	membar	0x38
loop_2135:
	edge8ln	%l6,	%i7,	%g1
	edge8n	%o0,	%i3,	%o5
	edge32n	%l4,	%i5,	%l5
	ldsw	[%l7 + 0x28],	%l0
	fpmerge	%f20,	%f25,	%f10
	edge32n	%o4,	%l1,	%o3
	sll	%g7,	0x11,	%g6
	sdivcc	%i0,	0x1DE8,	%o2
	udivx	%i1,	0x111C,	%g4
	subc	%o6,	%g5,	%o7
	set	0x10, %l0
	ldswa	[%l7 + %l0] 0x19,	%i6
	subcc	%i2,	0x1670,	%o1
	movge	%xcc,	%i4,	%l3
	sethi	0x189E,	%g3
	fmovrdne	%l2,	%f8,	%f2
	tleu	%icc,	0x3
	addc	%l6,	%i7,	%g2
	tg	%xcc,	0x7
	nop
	setx	loop_2136,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16n	%o0,	%i3,	%g1
	and	%l4,	%o5,	%i5
	movpos	%icc,	%l0,	%l5
loop_2136:
	bneg,pn	%icc,	loop_2137
	fzeros	%f10
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%o4
loop_2137:
	fmovrde	%o3,	%f2,	%f30
	smulcc	%g7,	%i0,	%g6
	taddcctv	%i1,	0x1A84,	%o2
	alignaddrl	%g4,	%o6,	%g5
	fandnot2s	%f5,	%f5,	%f27
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x10] %asi,	%o6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0C] %asi,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i2,	0x111B,	%o1
	sir	0x16EC
	bge,a	%icc,	loop_2138
	andn	%l3,	0x1913,	%g3
	ldd	[%l7 + 0x50],	%i4
	tn	%xcc,	0x1
loop_2138:
	fandnot2	%f28,	%f24,	%f6
	fmovse	%xcc,	%f20,	%f4
	tcc	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	stxa	%l2,	[%l7 + 0x60] %asi
	smul	%i7,	%l6,	%o0
	fsrc1s	%f14,	%f0
	fcmpgt16	%f28,	%f14,	%i3
	set	0x43, %i6
	ldstuba	[%l7 + %i6] 0x0c,	%g2
	bge,a	loop_2139
	alignaddr	%l4,	%g1,	%i5
	movne	%icc,	%l0,	%l5
	ld	[%l7 + 0x24],	%f14
loop_2139:
	taddcctv	%o5,	%l1,	%o3
	bgu,a,pt	%xcc,	loop_2140
	stbar
	fpack32	%f4,	%f4,	%f0
	xnorcc	%o4,	%g7,	%g6
loop_2140:
	fbe	%fcc1,	loop_2141
	fzeros	%f20
	alignaddr	%i0,	%o2,	%g4
	swap	[%l7 + 0x4C],	%i1
loop_2141:
	movpos	%icc,	%o6,	%g5
	tvc	%icc,	0x0
	fmovde	%xcc,	%f22,	%f26
	orcc	%o7,	0x14FF,	%i2
	smulcc	%i6,	0x0A27,	%o1
	taddcctv	%g3,	%l3,	%i4
	tne	%icc,	0x2
	fornot1s	%f31,	%f19,	%f6
	smulcc	%i7,	0x0A15,	%l2
	sethi	0x055A,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a,pn	%icc,	loop_2142
	fpsub16s	%f23,	%f3,	%f1
	fbul	%fcc3,	loop_2143
	add	%i3,	%g2,	%l6
loop_2142:
	nop
	set	0x18, %o2
	stha	%g1,	[%l7 + %o2] 0x2b
	membar	#Sync
loop_2143:
	nop
	set	0x38, %i7
	lduba	[%l7 + %i7] 0x04,	%l4
	edge16	%i5,	%l5,	%l0
	stw	%o5,	[%l7 + 0x44]
	set	0x55, %i1
	ldsba	[%l7 + %i1] 0x89,	%o3
	ta	%xcc,	0x4
	movne	%xcc,	%o4,	%g7
	fpadd32	%f8,	%f20,	%f20
	tsubcctv	%l1,	%g6,	%i0
	sdiv	%g4,	0x1FC8,	%i1
	fmovdpos	%icc,	%f10,	%f29
	movl	%icc,	%o2,	%o6
	tsubcctv	%g5,	0x1CF6,	%i2
	tne	%icc,	0x5
	nop
	set	0x6C, %o1
	ldsw	[%l7 + %o1],	%i6
	tg	%xcc,	0x6
	mulscc	%o7,	0x083B,	%g3
	edge8	%o1,	%l3,	%i7
	set	0x14, %l1
	ldsha	[%l7 + %l1] 0x15,	%l2
	movle	%icc,	%o0,	%i3
	movl	%xcc,	%g2,	%l6
	orncc	%g1,	0x1FEA,	%i4
	movge	%icc,	%l4,	%i5
	udivx	%l5,	0x1A61,	%l0
	bne,pt	%icc,	loop_2144
	fcmple16	%f20,	%f18,	%o5
	movneg	%icc,	%o4,	%o3
	brgz,a	%l1,	loop_2145
loop_2144:
	sra	%g6,	0x00,	%g7
	fmovsle	%icc,	%f30,	%f7
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g4
loop_2145:
	fpadd16	%f2,	%f18,	%f22
	ldstub	[%l7 + 0x44],	%i1
	fpsub32	%f28,	%f4,	%f28
	tne	%xcc,	0x3
	fmovsneg	%icc,	%f30,	%f20
	smul	%i0,	%o6,	%g5
	ble,a,pn	%xcc,	loop_2146
	umulcc	%o2,	0x195E,	%i6
	sllx	%i2,	%g3,	%o7
	bg	loop_2147
loop_2146:
	tleu	%xcc,	0x1
	fornot1	%f26,	%f26,	%f2
	edge8	%l3,	%o1,	%i7
loop_2147:
	ld	[%l7 + 0x24],	%f14
	addcc	%l2,	%o0,	%g2
	stw	%l6,	[%l7 + 0x3C]
	edge32ln	%i3,	%i4,	%g1
	fmovdleu	%icc,	%f16,	%f8
	movre	%l4,	0x306,	%l5
	movne	%icc,	%i5,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o5,	0x0D09,	%o3
	fandnot1	%f6,	%f2,	%f16
	std	%o4,	[%l7 + 0x10]
	fmovsa	%icc,	%f1,	%f12
	fmul8ulx16	%f30,	%f12,	%f28
	add	%l1,	%g6,	%g4
	bl,pt	%icc,	loop_2148
	edge16	%g7,	%i0,	%i1
	bpos	loop_2149
	smulcc	%g5,	%o6,	%i6
loop_2148:
	bg,pn	%xcc,	loop_2150
	brnz,a	%o2,	loop_2151
loop_2149:
	movvc	%xcc,	%g3,	%o7
	movrgz	%i2,	%l3,	%i7
loop_2150:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
loop_2151:
	mulscc	%l2,	0x12F9,	%o0
	mova	%xcc,	%l6,	%g2
	alignaddr	%i4,	%i3,	%g1
	tvc	%xcc,	0x1
	flush	%l7 + 0x60
	fcmpne16	%f20,	%f14,	%l5
	sra	%l4,	0x03,	%i5
	fmovdl	%xcc,	%f31,	%f0
	movre	%o5,	0x207,	%o3
	edge8	%l0,	%l1,	%g6
	movpos	%xcc,	%g4,	%o4
	edge8ln	%g7,	%i0,	%i1
	fmovdne	%xcc,	%f20,	%f13
	movgu	%icc,	%o6,	%i6
	movrgz	%g5,	0x29F,	%g3
	edge8l	%o2,	%i2,	%o7
	fxnor	%f8,	%f28,	%f4
	movg	%icc,	%l3,	%o1
	brgez,a	%l2,	loop_2152
	movrgz	%o0,	%l6,	%g2
	bg,a,pt	%xcc,	loop_2153
	edge16ln	%i4,	%i3,	%g1
loop_2152:
	stbar
	edge8l	%l5,	%i7,	%i5
loop_2153:
	nop
	set	0x38, %i4
	stda	%o4,	[%l7 + %i4] 0x10
	fpadd32	%f28,	%f0,	%f18
	fpadd32	%f12,	%f0,	%f24
	fmovsvc	%xcc,	%f26,	%f0
	edge8n	%o3,	%l0,	%l4
	tsubcctv	%l1,	%g4,	%o4
	fcmpes	%fcc2,	%f15,	%f23
	bge,a	loop_2154
	addccc	%g7,	0x0073,	%g6
	smul	%i0,	%o6,	%i6
	movpos	%icc,	%g5,	%i1
loop_2154:
	tcs	%xcc,	0x7
	tn	%xcc,	0x3
	std	%o2,	[%l7 + 0x20]
	tn	%xcc,	0x4
	fpsub32	%f6,	%f2,	%f28
	bshuffle	%f28,	%f20,	%f6
	edge16	%g3,	%o7,	%l3
	umul	%i2,	0x1E5F,	%o1
	tg	%icc,	0x6
	bn,pt	%icc,	loop_2155
	edge32l	%l2,	%o0,	%g2
	array8	%l6,	%i3,	%g1
	fba,a	%fcc1,	loop_2156
loop_2155:
	fxnors	%f12,	%f24,	%f20
	tl	%icc,	0x1
	set	0x10, %i3
	stha	%i4,	[%l7 + %i3] 0x80
loop_2156:
	nop
	set	0x58, %l4
	stda	%i6,	[%l7 + %l4] 0x04
	umulcc	%l5,	0x16D9,	%o5
	fmovde	%icc,	%f19,	%f18
	fornot1	%f6,	%f30,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i5,	0x0E,	%o3
	tleu	%xcc,	0x4
	fmovrdlz	%l4,	%f26,	%f28
	movg	%xcc,	%l1,	%l0
	fmovspos	%icc,	%f24,	%f0
	tne	%xcc,	0x0
	movneg	%xcc,	%g4,	%o4
	set	0x3C, %i0
	sta	%f1,	[%l7 + %i0] 0x15
	nop
	setx	loop_2157,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%g6,	%g7
	fmovdcs	%xcc,	%f16,	%f31
	wr	%g0,	0x2b,	%asi
	stda	%o6,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2157:
	tne	%icc,	0x4
	fblg	%fcc2,	loop_2158
	ta	%icc,	0x6
	fble	%fcc1,	loop_2159
	movre	%i0,	%i6,	%i1
loop_2158:
	or	%g5,	0x04CA,	%o2
	tge	%icc,	0x4
loop_2159:
	fmovrdgez	%o7,	%f30,	%f20
	fmul8x16au	%f20,	%f18,	%f28
	edge32	%g3,	%i2,	%l3
	udiv	%l2,	0x02C2,	%o0
	xor	%o1,	0x15AD,	%l6
	sll	%i3,	%g2,	%g1
	movl	%xcc,	%i7,	%i4
	sllx	%l5,	0x11,	%i5
	taddcctv	%o3,	%l4,	%o5
	fcmped	%fcc0,	%f30,	%f22
	fmovdleu	%xcc,	%f12,	%f4
	sdivcc	%l1,	0x0772,	%g4
	add	%l0,	%g6,	%g7
	brlez,a	%o4,	loop_2160
	fbul,a	%fcc3,	loop_2161
	movrgez	%o6,	0x299,	%i6
	andcc	%i0,	0x0FEF,	%g5
loop_2160:
	fcmpgt32	%f20,	%f4,	%i1
loop_2161:
	edge8n	%o7,	%g3,	%o2
	movl	%icc,	%l3,	%i2
	movcc	%icc,	%o0,	%l2
	fornot1	%f6,	%f30,	%f8
	fmovsg	%xcc,	%f19,	%f28
	std	%f20,	[%l7 + 0x20]
	tsubcc	%o1,	0x15D4,	%l6
	taddcc	%g2,	0x0E2C,	%g1
	edge32ln	%i7,	%i4,	%l5
	set	0x4C, %g7
	stwa	%i5,	[%l7 + %g7] 0x04
	srax	%o3,	0x19,	%l4
	ta	%xcc,	0x6
	umul	%o5,	0x1693,	%l1
	xor	%g4,	0x0284,	%l0
	popc	%g6,	%i3
	edge8ln	%g7,	%o4,	%o6
	bcs,pt	%xcc,	loop_2162
	sdivcc	%i6,	0x174A,	%g5
	andcc	%i1,	0x01DE,	%i0
	xorcc	%g3,	%o2,	%l3
loop_2162:
	edge16n	%i2,	%o0,	%o7
	sdivcc	%l2,	0x17BF,	%l6
	bgu,a,pn	%icc,	loop_2163
	swap	[%l7 + 0x60],	%o1
	nop
	setx	loop_2164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%g1,	0x1FCC,	%i7
loop_2163:
	tcs	%icc,	0x5
	tvc	%icc,	0x3
loop_2164:
	edge8ln	%g2,	%l5,	%i4
	movgu	%xcc,	%i5,	%o3
	tvc	%xcc,	0x1
	tleu	%icc,	0x3
	orcc	%l4,	%o5,	%l1
	bcs,pn	%icc,	loop_2165
	bne,a	loop_2166
	edge8l	%g4,	%l0,	%i3
	alignaddrl	%g7,	%g6,	%o6
loop_2165:
	fmovrsgez	%i6,	%f31,	%f18
loop_2166:
	tpos	%icc,	0x4
	fmovrdlz	%o4,	%f24,	%f8
	fnands	%f15,	%f3,	%f0
	nop
	set	0x78, %o5
	std	%f0,	[%l7 + %o5]
	array8	%g5,	%i0,	%i1
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	subc	%g3,	%o2,	%i2
	faligndata	%f28,	%f6,	%f14
	subc	%o0,	0x0D9D,	%l3
	nop
	setx	loop_2167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%l2,	%l6,	%o1
	fmovse	%xcc,	%f25,	%f5
	andcc	%g1,	0x1E9D,	%o7
loop_2167:
	tvs	%icc,	0x6
	bg,a	loop_2168
	ble,a,pn	%icc,	loop_2169
	tleu	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x7C] %asi,	%f17
loop_2168:
	fbge,a	%fcc1,	loop_2170
loop_2169:
	prefetch	[%l7 + 0x08],	 0x2
	fbue,a	%fcc3,	loop_2171
	addcc	%i7,	0x1644,	%l5
loop_2170:
	edge16n	%i4,	%i5,	%o3
	movrlez	%l4,	%o5,	%l1
loop_2171:
	movgu	%icc,	%g4,	%g2
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x16] %asi,	%i3
	wr	%g0,	0x23,	%asi
	stwa	%g7,	[%l7 + 0x3C] %asi
	membar	#Sync
	sdivcc	%l0,	0x16C1,	%g6
	edge8	%o6,	%o4,	%g5
	sth	%i6,	[%l7 + 0x3A]
	sub	%i1,	%g3,	%o2
	srl	%i2,	%i0,	%o0
	sra	%l2,	0x1D,	%l3
	bleu,a	%icc,	loop_2172
	umulcc	%o1,	%l6,	%o7
	subccc	%i7,	0x1B07,	%l5
	brgez,a	%i4,	loop_2173
loop_2172:
	swap	[%l7 + 0x0C],	%i5
	array8	%g1,	%o3,	%l4
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0x2
loop_2173:
	sra	%l1,	0x11,	%g4
	fmovs	%f7,	%f9
	brlez,a	%g2,	loop_2174
	fcmpne16	%f2,	%f2,	%g7
	movgu	%icc,	%i3,	%g6
	fcmpeq32	%f26,	%f18,	%o6
loop_2174:
	array8	%l0,	%o4,	%g5
	ld	[%l7 + 0x7C],	%f1
	andncc	%i1,	%g3,	%o2
	fpadd16s	%f2,	%f10,	%f5
	tgu	%icc,	0x4
	wr	%g0,	0x88,	%asi
	sta	%f28,	[%l7 + 0x1C] %asi
	fbo,a	%fcc3,	loop_2175
	fmovdvc	%icc,	%f27,	%f7
	orn	%i6,	0x1D15,	%i2
	edge8	%o0,	%l2,	%i0
loop_2175:
	fpsub32s	%f13,	%f2,	%f20
	bgu	%icc,	loop_2176
	edge16n	%l3,	%o1,	%o7
	tne	%xcc,	0x2
	tneg	%xcc,	0x1
loop_2176:
	tle	%icc,	0x6
	fornot1	%f28,	%f0,	%f26
	bg,a	%icc,	loop_2177
	bg	%icc,	loop_2178
	fmovsvc	%xcc,	%f6,	%f21
	fabsd	%f10,	%f8
loop_2177:
	tg	%icc,	0x4
loop_2178:
	fbg	%fcc2,	loop_2179
	array16	%l6,	%i7,	%i4
	movn	%icc,	%l5,	%g1
	array16	%o3,	%l4,	%o5
loop_2179:
	movgu	%icc,	%i5,	%l1
	tsubcctv	%g2,	0x1787,	%g7
	set	0x68, %g3
	stda	%i2,	[%l7 + %g3] 0xe2
	membar	#Sync
	tvs	%xcc,	0x3
	bn	loop_2180
	mova	%icc,	%g4,	%o6
	sth	%g6,	[%l7 + 0x40]
	andcc	%o4,	0x0A5F,	%g5
loop_2180:
	fbo,a	%fcc3,	loop_2181
	bcc	%icc,	loop_2182
	bshuffle	%f26,	%f8,	%f28
	set	0x4D, %l5
	ldstuba	[%l7 + %l5] 0x18,	%i1
loop_2181:
	subcc	%l0,	%g3,	%o2
loop_2182:
	nop
	set	0x68, %i5
	stxa	%i2,	[%l7 + %i5] 0x2a
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x57,	%asi
	stxa	%o0,	[%g0 + 0x0] %asi
	add	%i6,	0x1A6D,	%i0
	xnor	%l2,	0x07D0,	%o1
	fcmpne16	%f30,	%f12,	%l3
	orcc	%l6,	%o7,	%i7
	fsrc1	%f8,	%f0
	xnor	%l5,	%g1,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f24,	%f2,	%o3
	wr	%g0,	0xe2,	%asi
	stha	%o5,	[%l7 + 0x20] %asi
	membar	#Sync
	movle	%icc,	%l4,	%i5
	andncc	%g2,	%l1,	%i3
	nop
	setx	loop_2183,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x47
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%g4
loop_2183:
	brlez,a	%g6,	loop_2184
	tg	%xcc,	0x0
	stw	%o6,	[%l7 + 0x48]
	fmovd	%f6,	%f26
loop_2184:
	brlez	%g5,	loop_2185
	sth	%i1,	[%l7 + 0x60]
	tgu	%icc,	0x4
	tge	%icc,	0x4
loop_2185:
	orcc	%l0,	0x0A43,	%o4
	fcmpne16	%f6,	%f22,	%o2
	lduh	[%l7 + 0x74],	%g3
	fmovrdlez	%o0,	%f0,	%f4
	addccc	%i2,	%i6,	%l2
	or	%o1,	0x19AA,	%i0
	fmovsleu	%xcc,	%f3,	%f17
	mova	%xcc,	%l6,	%o7
	movge	%icc,	%l3,	%l5
	mova	%icc,	%i7,	%i4
	or	%o3,	%g1,	%l4
	fbge,a	%fcc1,	loop_2186
	edge16ln	%o5,	%g2,	%l1
	fblg,a	%fcc2,	loop_2187
	tsubcctv	%i3,	0x13B0,	%i5
loop_2186:
	sdivx	%g4,	0x033A,	%g6
	fmovsn	%icc,	%f19,	%f26
loop_2187:
	edge16l	%o6,	%g7,	%g5
	wr	%g0,	0x2b,	%asi
	stba	%l0,	[%l7 + 0x42] %asi
	membar	#Sync
	stbar
	movpos	%xcc,	%o4,	%o2
	tgu	%xcc,	0x4
	andn	%g3,	%o0,	%i2
	movge	%icc,	%i6,	%i1
	stbar
	edge8	%o1,	%l2,	%i0
	bvs	loop_2188
	fpadd16	%f12,	%f6,	%f28
	srlx	%l6,	%o7,	%l5
	movge	%icc,	%i7,	%i4
loop_2188:
	and	%l3,	%o3,	%l4
	edge32n	%o5,	%g2,	%g1
	addcc	%l1,	%i5,	%g4
	movrgez	%i3,	%g6,	%g7
	ldsw	[%l7 + 0x3C],	%g5
	smul	%o6,	%l0,	%o2
	fmovsneg	%xcc,	%f12,	%f0
	srax	%g3,	0x11,	%o0
	fbule	%fcc0,	loop_2189
	fsrc1	%f16,	%f10
	tcc	%icc,	0x4
	edge16n	%o4,	%i2,	%i1
loop_2189:
	fba	%fcc0,	loop_2190
	xorcc	%i6,	%o1,	%i0
	movcs	%xcc,	%l6,	%o7
	movne	%icc,	%l5,	%i7
loop_2190:
	taddcctv	%l2,	0x0359,	%i4
	edge8	%l3,	%l4,	%o3
	add	%o5,	%g1,	%l1
	sth	%g2,	[%l7 + 0x1E]
	fornot2s	%f7,	%f26,	%f21
	fmovdn	%xcc,	%f25,	%f25
	fbg,a	%fcc2,	loop_2191
	srl	%g4,	0x03,	%i5
	fmovrdgez	%i3,	%f12,	%f20
	edge16n	%g6,	%g5,	%o6
loop_2191:
	tsubcc	%l0,	0x09D4,	%o2
	add	%g3,	0x0342,	%o0
	fcmple32	%f22,	%f14,	%o4
	fcmpeq16	%f8,	%f24,	%i2
	edge32n	%i1,	%i6,	%o1
	andn	%g7,	0x1B56,	%l6
	ldsb	[%l7 + 0x7A],	%o7
	umulcc	%i0,	0x1098,	%i7
	or	%l2,	0x1015,	%i4
	te	%xcc,	0x3
	mova	%icc,	%l3,	%l5
	set	0x64, %o0
	stba	%o3,	[%l7 + %o0] 0xe2
	membar	#Sync
	fpsub16	%f0,	%f26,	%f30
	set	0x3C, %g1
	lduwa	[%l7 + %g1] 0x88,	%l4
	ldx	[%l7 + 0x50],	%g1
	fbule,a	%fcc3,	loop_2192
	bne,a	loop_2193
	bge,a	loop_2194
	fxors	%f2,	%f31,	%f28
loop_2192:
	mulx	%o5,	%g2,	%l1
loop_2193:
	addc	%i5,	0x0045,	%i3
loop_2194:
	edge8ln	%g4,	%g6,	%o6
	alignaddr	%l0,	%o2,	%g5
	sra	%g3,	%o0,	%o4
	movne	%xcc,	%i2,	%i1
	tgu	%xcc,	0x5
	udivcc	%i6,	0x0882,	%g7
	sdivcc	%l6,	0x03F7,	%o7
	fmovsle	%icc,	%f1,	%f3
	fpadd32s	%f10,	%f30,	%f19
	movle	%xcc,	%i0,	%i7
	srl	%l2,	%i4,	%o1
	wr	%g0,	0x11,	%asi
	stba	%l5,	[%l7 + 0x23] %asi
	movvs	%icc,	%o3,	%l3
	fnor	%f20,	%f26,	%f14
	nop
	setx loop_2195, %l0, %l1
	jmpl %l1, %g1
	fmovsvs	%icc,	%f12,	%f5
	taddcctv	%l4,	0x08B0,	%o5
	membar	0x38
loop_2195:
	umul	%g2,	%l1,	%i3
	fcmple16	%f26,	%f6,	%i5
	fands	%f13,	%f5,	%f24
	andcc	%g4,	%o6,	%l0
	wr	%g0,	0x89,	%asi
	stda	%g6,	[%l7 + 0x08] %asi
	fmul8x16au	%f31,	%f27,	%f16
	movcc	%xcc,	%g5,	%g3
	fbn	%fcc0,	loop_2196
	fone	%f12
	fbul	%fcc0,	loop_2197
	movrgez	%o0,	%o4,	%i2
loop_2196:
	nop
	wr	%g0,	0x2a,	%asi
	stda	%o2,	[%l7 + 0x70] %asi
	membar	#Sync
loop_2197:
	edge32l	%i6,	%g7,	%l6
	edge8l	%i1,	%o7,	%i7
	movl	%xcc,	%l2,	%i0
	tn	%icc,	0x3
	tvs	%xcc,	0x0
	andn	%i4,	%o1,	%o3
	edge16ln	%l3,	%g1,	%l5
	smul	%l4,	0x0D1B,	%o5
	sll	%g2,	0x15,	%l1
	wr	%g0,	0x0c,	%asi
	stha	%i5,	[%l7 + 0x24] %asi
	array32	%g4,	%o6,	%i3
	array16	%g6,	%l0,	%g3
	umulcc	%g5,	%o4,	%o0
	brnz,a	%o2,	loop_2198
	movn	%xcc,	%i6,	%g7
	tge	%icc,	0x3
	xor	%i2,	%l6,	%i1
loop_2198:
	xnor	%o7,	0x0283,	%l2
	sdivx	%i7,	0x1B6A,	%i0
	udivx	%o1,	0x0D31,	%i4
	taddcctv	%l3,	0x13A0,	%o3
	srax	%l5,	0x1B,	%l4
	fpmerge	%f17,	%f16,	%f24
	wr	%g0,	0x89,	%asi
	stha	%g1,	[%l7 + 0x5E] %asi
	movcs	%xcc,	%g2,	%o5
	add	%l1,	%g4,	%i5
	sllx	%i3,	0x14,	%o6
	movne	%icc,	%l0,	%g3
	subcc	%g5,	%g6,	%o0
	fmovspos	%icc,	%f18,	%f4
	tleu	%icc,	0x7
	fmovsg	%icc,	%f24,	%f9
	add	%o2,	0x16C7,	%i6
	tsubcc	%o4,	%i2,	%g7
	movcc	%icc,	%l6,	%o7
	tvs	%icc,	0x7
	sir	0x12E1
	bpos,pt	%xcc,	loop_2199
	fbo	%fcc0,	loop_2200
	ldstub	[%l7 + 0x6F],	%l2
	ba,a,pn	%icc,	loop_2201
loop_2199:
	brnz,a	%i1,	loop_2202
loop_2200:
	stw	%i7,	[%l7 + 0x34]
	nop
	setx loop_2203, %l0, %l1
	jmpl %l1, %i0
loop_2201:
	subcc	%i4,	0x036B,	%l3
loop_2202:
	movvc	%icc,	%o1,	%l5
	sllx	%l4,	%o3,	%g1
loop_2203:
	fcmps	%fcc2,	%f13,	%f2
	bshuffle	%f30,	%f6,	%f30
	fsrc1	%f24,	%f8
	addc	%o5,	0x1F1C,	%l1
	array8	%g2,	%i5,	%i3
	tn	%xcc,	0x3
	fnot1	%f16,	%f8
	stx	%g4,	[%l7 + 0x10]
	srlx	%l0,	0x1E,	%g3
	bge,pt	%icc,	loop_2204
	ldstub	[%l7 + 0x3D],	%o6
	orn	%g5,	0x1A4B,	%g6
	ldsh	[%l7 + 0x1E],	%o2
loop_2204:
	edge8n	%o0,	%o4,	%i6
	brnz,a	%i2,	loop_2205
	nop
	setx	loop_2206,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fble	%fcc3,	loop_2207
	tcs	%xcc,	0x6
loop_2205:
	be,a,pt	%icc,	loop_2208
loop_2206:
	fabsd	%f6,	%f14
loop_2207:
	xnorcc	%l6,	%o7,	%g7
	addcc	%l2,	%i7,	%i0
loop_2208:
	xorcc	%i1,	0x036E,	%i4
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
	ld	[%l7 + 0x44],	%f12
	fxnor	%f14,	%f16,	%f30
	sir	0x128C
loop_2209:
	fmovse	%xcc,	%f19,	%f2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%l5
	tg	%xcc,	0x6
	sir	0x0696
	edge16ln	%l4,	%o1,	%g1
	fmovsneg	%xcc,	%f1,	%f27
	xorcc	%o5,	0x043E,	%l1
	fcmpgt32	%f0,	%f26,	%g2
	tg	%xcc,	0x0
	sdivcc	%o3,	0x0CA8,	%i5
	orncc	%g4,	%l0,	%g3
	fabss	%f21,	%f26
	bne,pt	%icc,	loop_2210
	sub	%i3,	%g5,	%o6
	tcc	%xcc,	0x2
	sth	%g6,	[%l7 + 0x26]
loop_2210:
	fnot2	%f8,	%f20
	fmul8x16al	%f14,	%f18,	%f18
	array32	%o2,	%o0,	%o4
	movrne	%i2,	0x252,	%i6
	movle	%icc,	%o7,	%g7
	tsubcctv	%l6,	0x0706,	%l2
	tsubcc	%i0,	%i7,	%i1
	fmovde	%icc,	%f3,	%f21
	addccc	%l3,	0x0C0F,	%l5
	fones	%f5
	edge8l	%i4,	%l4,	%o1
	fmul8x16au	%f28,	%f5,	%f8
	sub	%o5,	0x0CD7,	%g1
	edge8l	%l1,	%o3,	%g2
	fcmpne16	%f30,	%f12,	%i5
	tcs	%icc,	0x0
	move	%icc,	%l0,	%g3
	alignaddrl	%g4,	%g5,	%o6
	fcmpes	%fcc1,	%f24,	%f26
	tleu	%icc,	0x1
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf9
	membar	#Sync
	tg	%xcc,	0x3
	srax	%i3,	0x0B,	%o2
	set	0x50, %g2
	stxa	%o0,	[%l7 + %g2] 0x2a
	membar	#Sync
	srl	%o4,	0x01,	%g6
	movcs	%xcc,	%i6,	%o7
	bshuffle	%f22,	%f4,	%f24
	sll	%g7,	%i2,	%l2
	andncc	%l6,	%i7,	%i0
	nop
	set	0x28, %l2
	std	%i0,	[%l7 + %l2]
	lduw	[%l7 + 0x08],	%l5
	alignaddrl	%l3,	%i4,	%l4
	bvs,a	loop_2211
	tsubcc	%o5,	0x158D,	%o1
	sllx	%g1,	%o3,	%l1
	tpos	%icc,	0x0
loop_2211:
	tvs	%xcc,	0x0
	edge16l	%g2,	%i5,	%g3
	fmul8sux16	%f10,	%f18,	%f12
	movpos	%xcc,	%g4,	%g5
	tn	%icc,	0x3
	fors	%f16,	%f6,	%f0
	array16	%l0,	%i3,	%o2
	tgu	%icc,	0x1
	fmovsg	%xcc,	%f6,	%f4
	fornot1	%f0,	%f8,	%f24
	siam	0x0
	sdiv	%o6,	0x05EB,	%o4
	subcc	%o0,	%g6,	%i6
	andcc	%o7,	0x1226,	%g7
	udivx	%i2,	0x0D66,	%l2
	edge8	%l6,	%i0,	%i1
	set	0x74, %o7
	stba	%i7,	[%l7 + %o7] 0x18
	fcmpd	%fcc3,	%f2,	%f8
	sllx	%l5,	0x0F,	%l3
	fbu	%fcc0,	loop_2212
	fands	%f19,	%f13,	%f13
	movre	%i4,	0x088,	%l4
	udiv	%o5,	0x1783,	%g1
loop_2212:
	fxnors	%f2,	%f21,	%f1
	andcc	%o1,	0x0D1F,	%o3
	sll	%l1,	0x08,	%g2
	ldstub	[%l7 + 0x5C],	%i5
	fornot1	%f30,	%f18,	%f2
	std	%f8,	[%l7 + 0x58]
	movcc	%xcc,	%g3,	%g4
	add	%l0,	%g5,	%i3
	orcc	%o6,	%o4,	%o0
	ld	[%l7 + 0x4C],	%f0
	membar	0x51
	fba,a	%fcc1,	loop_2213
	tge	%xcc,	0x7
	alignaddr	%g6,	%i6,	%o7
	sdivx	%o2,	0x01DD,	%g7
loop_2213:
	movn	%xcc,	%i2,	%l6
	tl	%xcc,	0x6
	fbne,a	%fcc1,	loop_2214
	movgu	%xcc,	%i0,	%i1
	edge32ln	%i7,	%l2,	%l5
	tleu	%xcc,	0x6
loop_2214:
	ldstub	[%l7 + 0x46],	%l3
	tvs	%xcc,	0x5
	tpos	%xcc,	0x7
	fxors	%f18,	%f13,	%f13
	sllx	%l4,	0x0C,	%o5
	andncc	%i4,	%g1,	%o1
	movcs	%icc,	%o3,	%l1
	edge32n	%g2,	%i5,	%g4
	fands	%f20,	%f2,	%f16
	movcc	%icc,	%g3,	%g5
	fbe,a	%fcc1,	loop_2215
	fmovrslz	%l0,	%f3,	%f30
	fmovdgu	%icc,	%f1,	%f24
	fmovsne	%xcc,	%f2,	%f29
loop_2215:
	fmovse	%icc,	%f26,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f26,	%f12
	sll	%i3,	0x1D,	%o6
	edge8n	%o4,	%g6,	%o0
	fandnot2s	%f30,	%f19,	%f3
	fmovdpos	%icc,	%f23,	%f14
	edge16n	%o7,	%o2,	%g7
	fbul	%fcc3,	loop_2216
	movleu	%icc,	%i6,	%i2
	fmovdgu	%icc,	%f8,	%f24
	tne	%icc,	0x6
loop_2216:
	fnot2	%f30,	%f16
	tl	%xcc,	0x5
	sdivx	%i0,	0x1A25,	%l6
	brlez	%i7,	loop_2217
	fcmpeq32	%f8,	%f20,	%i1
	fcmple16	%f0,	%f6,	%l5
	flush	%l7 + 0x64
loop_2217:
	movgu	%icc,	%l2,	%l4
	set	0x76, %g4
	ldsha	[%l7 + %g4] 0x19,	%o5
	movn	%icc,	%i4,	%g1
	stw	%l3,	[%l7 + 0x18]
	xorcc	%o3,	0x1ED3,	%l1
	fmovrslez	%g2,	%f9,	%f21
	edge16	%o1,	%g4,	%i5
	fpadd32	%f6,	%f4,	%f16
	tge	%xcc,	0x5
	add	%g3,	%g5,	%i3
	udivcc	%o6,	0x0685,	%l0
	srax	%o4,	%g6,	%o0
	srl	%o2,	0x1C,	%o7
	xorcc	%i6,	0x1B23,	%g7
	std	%f8,	[%l7 + 0x30]
	fnor	%f22,	%f28,	%f6
	alignaddrl	%i0,	%l6,	%i7
	siam	0x3
	sra	%i1,	0x16,	%i2
	fmovsvc	%icc,	%f1,	%f30
	movpos	%xcc,	%l2,	%l4
	ta	%icc,	0x1
	tvs	%xcc,	0x1
	sdivx	%l5,	0x1C0B,	%o5
	sllx	%i4,	0x02,	%l3
	tne	%icc,	0x6
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f16
	fbu,a	%fcc3,	loop_2218
	fmovdn	%icc,	%f13,	%f27
	bvs	loop_2219
	ble,pt	%icc,	loop_2220
loop_2218:
	fpsub32	%f30,	%f2,	%f28
	set	0x24, %g6
	stha	%o3,	[%l7 + %g6] 0x2f
	membar	#Sync
loop_2219:
	subccc	%g1,	0x0825,	%l1
loop_2220:
	edge8l	%o1,	%g2,	%i5
	move	%xcc,	%g4,	%g3
	srlx	%i3,	%o6,	%l0
	orn	%g5,	%o4,	%g6
	fxor	%f18,	%f0,	%f28
	bleu	%icc,	loop_2221
	stbar
	array32	%o0,	%o7,	%o2
	taddcctv	%g7,	%i0,	%l6
loop_2221:
	bl,a,pn	%icc,	loop_2222
	fmovdvs	%icc,	%f22,	%f16
	edge8	%i6,	%i1,	%i2
	fnot2s	%f0,	%f0
loop_2222:
	sir	0x1388
	fpadd16s	%f4,	%f9,	%f9
	sdivcc	%l2,	0x036D,	%i7
	fcmpd	%fcc3,	%f6,	%f12
	srax	%l4,	%o5,	%l5
	brgez,a	%l3,	loop_2223
	tleu	%icc,	0x2
	mova	%icc,	%i4,	%g1
	movle	%icc,	%o3,	%o1
loop_2223:
	fmovsl	%icc,	%f27,	%f25
	movpos	%xcc,	%l1,	%i5
	fmovdvc	%icc,	%f17,	%f4
	fpsub16s	%f9,	%f11,	%f10
	tsubcc	%g4,	0x0B68,	%g2
	tcc	%icc,	0x3
	fsrc2	%f20,	%f30
	fcmple16	%f8,	%f16,	%i3
	fmovrsne	%o6,	%f28,	%f30
	fmovdn	%icc,	%f25,	%f27
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%l0
	edge16ln	%g3,	%g5,	%o4
	sethi	0x108E,	%o0
	prefetch	[%l7 + 0x6C],	 0x2
	membar	0x6E
	edge16l	%o7,	%o2,	%g6
	addccc	%i0,	0x15B6,	%l6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g7
	edge16l	%i6,	%i2,	%l2
	sir	0x0C5A
	fbu,a	%fcc2,	loop_2224
	andcc	%i1,	%i7,	%o5
	sllx	%l4,	0x17,	%l5
	fmovrdlz	%i4,	%f30,	%f0
loop_2224:
	edge32ln	%g1,	%o3,	%l3
	xorcc	%o1,	0x1FA5,	%i5
	ta	%xcc,	0x5
	movge	%xcc,	%g4,	%g2
	bcc,pt	%xcc,	loop_2225
	tcs	%icc,	0x0
	tsubcctv	%i3,	0x0190,	%o6
	edge32	%l0,	%g3,	%g5
loop_2225:
	taddcc	%o4,	%o0,	%l1
	xorcc	%o2,	0x1A38,	%o7
	subccc	%g6,	0x0DBB,	%l6
	fbl,a	%fcc1,	loop_2226
	xor	%g7,	%i6,	%i2
	fmovdne	%xcc,	%f28,	%f12
	edge16	%l2,	%i0,	%i1
loop_2226:
	move	%xcc,	%o5,	%i7
	tn	%icc,	0x2
	fpadd16s	%f3,	%f21,	%f29
	fmovrslez	%l5,	%f22,	%f0
	alignaddr	%i4,	%l4,	%o3
	udiv	%g1,	0x0931,	%o1
	fmul8ulx16	%f0,	%f28,	%f6
	sll	%i5,	0x0E,	%l3
	edge16n	%g4,	%i3,	%o6
	fpmerge	%f31,	%f30,	%f4
	st	%f11,	[%l7 + 0x4C]
	movg	%xcc,	%l0,	%g3
	addc	%g5,	%g2,	%o0
	fcmple32	%f6,	%f18,	%o4
	set	0x68, %o4
	ldswa	[%l7 + %o4] 0x80,	%l1
	or	%o2,	0x103D,	%o7
	sll	%l6,	0x15,	%g7
	movneg	%icc,	%g6,	%i6
	sdiv	%i2,	0x113F,	%l2
	fpmerge	%f6,	%f27,	%f0
	mova	%xcc,	%i0,	%o5
	alignaddrl	%i1,	%l5,	%i7
	taddcc	%i4,	%o3,	%l4
	tneg	%icc,	0x6
	movrlez	%g1,	0x0B4,	%i5
	tn	%icc,	0x7
	fpack32	%f4,	%f6,	%f2
	tcs	%icc,	0x3
	sub	%o1,	0x1AA6,	%l3
	fbn	%fcc1,	loop_2227
	udivcc	%i3,	0x1B9B,	%o6
	brnz	%g4,	loop_2228
	tle	%xcc,	0x5
loop_2227:
	sra	%l0,	0x0F,	%g5
	fmovdneg	%xcc,	%f6,	%f8
loop_2228:
	bg,pn	%icc,	loop_2229
	movrlez	%g2,	%o0,	%o4
	nop
	setx loop_2230, %l0, %l1
	jmpl %l1, %g3
	edge8l	%o2,	%l1,	%l6
loop_2229:
	std	%g6,	[%l7 + 0x50]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2230:
	ldstub	[%l7 + 0x54],	%g6
	fnors	%f11,	%f22,	%f30
	fmovrdne	%o7,	%f22,	%f24
	movrne	%i6,	%l2,	%i2
	brgez	%i0,	loop_2231
	fbo	%fcc1,	loop_2232
	fmovdge	%xcc,	%f10,	%f7
	fmul8x16al	%f7,	%f25,	%f16
loop_2231:
	nop
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x2a,	%i0
loop_2232:
	swap	[%l7 + 0x48],	%o5
	andncc	%i7,	%i4,	%l5
	sir	0x00C4
	mulx	%o3,	0x035D,	%l4
	nop
	setx	loop_2233,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%i5,	%o1,	%g1
	fsrc2s	%f13,	%f3
	edge8l	%i3,	%l3,	%o6
loop_2233:
	tcc	%xcc,	0x5
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x19,	%l0
	fmuld8sux16	%f14,	%f0,	%f0
	fandnot1	%f0,	%f0,	%f14
	srlx	%g5,	%g4,	%g2
	addc	%o0,	0x1AC0,	%o4
	stx	%o2,	[%l7 + 0x20]
	fmovsn	%icc,	%f24,	%f22
	bl	loop_2234
	te	%icc,	0x1
	sdivx	%g3,	0x1F1D,	%l1
	fbge	%fcc2,	loop_2235
loop_2234:
	st	%f1,	[%l7 + 0x74]
	fxnor	%f4,	%f28,	%f18
	fmovsne	%icc,	%f12,	%f10
loop_2235:
	tg	%icc,	0x6
	udiv	%l6,	0x1BFF,	%g7
	and	%o7,	%i6,	%l2
	movvc	%xcc,	%i2,	%i0
	bpos,pn	%xcc,	loop_2236
	udivx	%i1,	0x187E,	%g6
	fpadd16	%f22,	%f12,	%f26
	edge32	%i7,	%i4,	%o5
loop_2236:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%l5,	[%l7 + 0x50] %asi
	fmovrdgez	%l4,	%f20,	%f10
	edge16	%o3,	%o1,	%i5
	ldsw	[%l7 + 0x78],	%g1
	nop
	set	0x35, %i6
	stb	%l3,	[%l7 + %i6]
	srl	%i3,	%o6,	%l0
	bgu,a	loop_2237
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x71, %o3
	lduba	[%l7 + %o3] 0x10,	%g5
loop_2237:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g4,	%g2
	fcmpeq16	%f6,	%f24,	%o0
	subc	%o4,	0x1FFE,	%o2
	tg	%icc,	0x0
	wr	%g0,	0x2a,	%asi
	stba	%g3,	[%l7 + 0x35] %asi
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l6,	%l1
	fbuge	%fcc2,	loop_2238
	fbul,a	%fcc3,	loop_2239
	brlez	%g7,	loop_2240
	movneg	%xcc,	%i6,	%o7
loop_2238:
	brgz,a	%i2,	loop_2241
loop_2239:
	edge32ln	%i0,	%l2,	%g6
loop_2240:
	bge,a	loop_2242
	movrgez	%i7,	0x108,	%i4
loop_2241:
	fxor	%f12,	%f8,	%f18
	brgez,a	%o5,	loop_2243
loop_2242:
	movcc	%icc,	%l5,	%i1
	fmovrdlez	%l4,	%f14,	%f22
	movgu	%icc,	%o1,	%o3
loop_2243:
	tge	%icc,	0x5
	edge8l	%i5,	%g1,	%l3
	fmovrse	%o6,	%f1,	%f2
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f20
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x1F, %o2
	ldsba	[%l7 + %o2] 0x19,	%i3
	fmovsvs	%xcc,	%f15,	%f17
	edge32n	%g5,	%l0,	%g2
	udiv	%g4,	0x16A0,	%o0
	sethi	0x0546,	%o2
	movrgz	%g3,	%o4,	%l1
	nop
	set	0x20, %o1
	lduh	[%l7 + %o1],	%l6
	array8	%i6,	%o7,	%i2
	movgu	%icc,	%i0,	%g7
	sdiv	%g6,	0x0C01,	%l2
	and	%i4,	%i7,	%o5
	fmovsne	%icc,	%f22,	%f6
	fzero	%f18
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
	movrne	%l5,	0x07C,	%o1
	tsubcctv	%l4,	%o3,	%g1
	taddcctv	%l3,	0x0103,	%o6
	lduw	[%l7 + 0x54],	%i5
	swap	[%l7 + 0x68],	%g5
	popc	%l0,	%i3
	prefetch	[%l7 + 0x7C],	 0x1
	edge8	%g4,	%o0,	%g2
	movrne	%o2,	0x2A6,	%o4
	edge8	%l1,	%g3,	%l6
	sir	0x112A
	fmul8x16au	%f13,	%f6,	%f24
	ld	[%l7 + 0x20],	%f30
	tg	%xcc,	0x1
	orncc	%o7,	%i2,	%i0
	tgu	%icc,	0x0
	fmovdneg	%icc,	%f21,	%f28
	xorcc	%i6,	0x0DA2,	%g6
	move	%xcc,	%g7,	%l2
	tvc	%icc,	0x7
	edge8l	%i4,	%o5,	%i1
	fmovdne	%xcc,	%f14,	%f23
	edge32l	%i7,	%l5,	%o1
	movre	%o3,	%g1,	%l4
	fsrc1	%f2,	%f28
	fsrc2	%f30,	%f2
	wr	%g0,	0x2b,	%asi
	stxa	%o6,	[%l7 + 0x60] %asi
	membar	#Sync
	bshuffle	%f18,	%f10,	%f8
	xnorcc	%l3,	0x0AB9,	%i5
	addcc	%l0,	%g5,	%g4
	bneg,pt	%xcc,	loop_2244
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%o0
	tcs	%xcc,	0x7
	bg,pt	%xcc,	loop_2245
loop_2244:
	array32	%i3,	%g2,	%o2
	nop
	setx	loop_2246,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%o4,	%g3,	%l6
loop_2245:
	taddcctv	%l1,	%o7,	%i2
	fmovsne	%xcc,	%f23,	%f5
loop_2246:
	andn	%i6,	0x1BDC,	%i0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x15] %asi,	%g7
	tn	%icc,	0x7
	addc	%l2,	0x1550,	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x0c,	%o5,	%i1
	srlx	%g6,	%i7,	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%o3
	edge8l	%l4,	%o6,	%l3
	fmovrslez	%i5,	%f12,	%f30
	fsrc2s	%f19,	%f17
	fsrc2	%f2,	%f20
	sdivx	%l0,	0x0AC5,	%g5
	add	%g4,	0x0765,	%g1
	fcmple16	%f14,	%f16,	%o0
	movvs	%xcc,	%g2,	%i3
	ba,a,pn	%icc,	loop_2247
	movle	%xcc,	%o4,	%o2
	membar	0x43
	fbne	%fcc3,	loop_2248
loop_2247:
	bcc,pt	%icc,	loop_2249
	fand	%f28,	%f20,	%f0
	subc	%l6,	%g3,	%l1
loop_2248:
	mulx	%o7,	0x0CFF,	%i2
loop_2249:
	tleu	%xcc,	0x6
	fsrc2s	%f8,	%f24
	sir	0x1DD2
	edge8ln	%i6,	%g7,	%l2
	fbuge	%fcc1,	loop_2250
	edge32	%i4,	%o5,	%i0
	edge32l	%g6,	%i1,	%l5
	movl	%xcc,	%i7,	%o3
loop_2250:
	movcs	%icc,	%l4,	%o1
	fpackfix	%f8,	%f21
	add	%o6,	0x1086,	%l3
	fpsub32s	%f11,	%f7,	%f17
	fsrc1	%f30,	%f26
	movvc	%xcc,	%l0,	%i5
	smulcc	%g5,	%g4,	%o0
	xnorcc	%g1,	%g2,	%o4
	orncc	%i3,	0x05E4,	%l6
	smul	%g3,	0x0E76,	%o2
	bge,pt	%xcc,	loop_2251
	movrne	%l1,	0x346,	%o7
	fmovrse	%i2,	%f22,	%f27
	pdist	%f4,	%f18,	%f24
loop_2251:
	sll	%g7,	0x09,	%l2
	udivcc	%i4,	0x1C4D,	%o5
	fpack16	%f28,	%f1
	fxnor	%f10,	%f28,	%f12
	fors	%f18,	%f15,	%f5
	fcmpne16	%f26,	%f2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc3,	loop_2252
	fbuge	%fcc2,	loop_2253
	taddcctv	%i6,	0x1A0C,	%i1
	tle	%icc,	0x2
loop_2252:
	edge16n	%l5,	%i7,	%o3
loop_2253:
	stx	%g6,	[%l7 + 0x50]
	subccc	%o1,	0x1E50,	%l4
	tpos	%icc,	0x7
	tn	%icc,	0x6
	wr	%g0,	0x88,	%asi
	sta	%f27,	[%l7 + 0x08] %asi
	movrne	%o6,	%l3,	%i5
	fbu	%fcc0,	loop_2254
	tvc	%xcc,	0x5
	movn	%icc,	%l0,	%g5
	addccc	%g4,	0x0773,	%o0
loop_2254:
	orn	%g1,	%g2,	%i3
	edge8n	%l6,	%o4,	%g3
	tl	%xcc,	0x2
	edge32	%o2,	%l1,	%o7
	addccc	%i2,	%g7,	%l2
	set	0x0C, %i1
	ldsha	[%l7 + %i1] 0x15,	%i4
	tpos	%xcc,	0x4
	fba	%fcc3,	loop_2255
	umul	%i0,	%o5,	%i6
	xorcc	%l5,	%i7,	%i1
	or	%o3,	0x0885,	%g6
loop_2255:
	tneg	%icc,	0x3
	fmovdne	%xcc,	%f19,	%f24
	subccc	%l4,	0x01D2,	%o6
	fnegd	%f12,	%f8
	lduw	[%l7 + 0x7C],	%o1
	orn	%i5,	%l0,	%g5
	edge16l	%g4,	%l3,	%g1
	brnz,a	%o0,	loop_2256
	movvs	%xcc,	%g2,	%l6
	movrne	%i3,	%o4,	%o2
	sethi	0x1C19,	%g3
loop_2256:
	umul	%l1,	%o7,	%g7
	tl	%xcc,	0x4
	popc	%i2,	%l2
	movgu	%xcc,	%i4,	%o5
	fmovrde	%i0,	%f6,	%f2
	tg	%icc,	0x1
	sllx	%l5,	%i6,	%i1
	movneg	%icc,	%o3,	%i7
	tge	%icc,	0x0
	bvs,a,pt	%xcc,	loop_2257
	movne	%xcc,	%g6,	%o6
	fba,a	%fcc2,	loop_2258
	srl	%o1,	0x08,	%i5
loop_2257:
	membar	0x66
	fmovde	%xcc,	%f27,	%f3
loop_2258:
	array8	%l0,	%g5,	%g4
	tne	%xcc,	0x6
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x11,	 0x3
	addccc	%l3,	0x1252,	%o0
	srlx	%g1,	%g2,	%l6
	subccc	%o4,	%o2,	%g3
	set	0x14, %l4
	lduba	[%l7 + %l4] 0x14,	%l1
	movrlz	%o7,	0x165,	%i3
	bge,pt	%xcc,	loop_2259
	std	%f26,	[%l7 + 0x60]
	movgu	%xcc,	%i2,	%g7
	stbar
loop_2259:
	fbl	%fcc3,	loop_2260
	tsubcc	%i4,	%l2,	%o5
	movl	%xcc,	%l5,	%i6
	edge8	%i1,	%o3,	%i7
loop_2260:
	swap	[%l7 + 0x68],	%g6
	fbule	%fcc2,	loop_2261
	fsrc1	%f4,	%f18
	sub	%i0,	0x090E,	%o1
	edge32ln	%o6,	%i5,	%l0
loop_2261:
	alignaddr	%g5,	%g4,	%l3
	edge8n	%l4,	%g1,	%o0
	set	0x39, %i0
	ldsba	[%l7 + %i0] 0x0c,	%l6
	tpos	%icc,	0x4
	stx	%g2,	[%l7 + 0x10]
	movcs	%icc,	%o2,	%o4
	fmovrdgez	%l1,	%f0,	%f20
	bneg,a	loop_2262
	orcc	%o7,	0x1107,	%g3
	orn	%i3,	0x121B,	%i2
	movcs	%xcc,	%g7,	%i4
loop_2262:
	umulcc	%o5,	%l5,	%l2
	fornot2s	%f25,	%f4,	%f25
	tvs	%xcc,	0x1
	edge8	%i1,	%i6,	%o3
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	fbug,a	%fcc1,	loop_2263
	xnorcc	%g6,	0x1C22,	%o1
	fcmpeq16	%f30,	%f4,	%o6
	udivcc	%i0,	0x123C,	%l0
loop_2263:
	te	%icc,	0x4
	fba	%fcc2,	loop_2264
	smul	%i5,	%g5,	%l3
	tle	%xcc,	0x2
	mova	%icc,	%g4,	%l4
loop_2264:
	tleu	%xcc,	0x3
	fmovdge	%xcc,	%f31,	%f3
	for	%f0,	%f4,	%f6
	movrlz	%o0,	0x318,	%l6
	smulcc	%g2,	%o2,	%o4
	set	0x64, %i4
	ldswa	[%l7 + %i4] 0x19,	%g1
	edge16l	%o7,	%g3,	%l1
	movpos	%icc,	%i3,	%g7
	fnegd	%f2,	%f22
	fpsub16	%f12,	%f22,	%f2
	fcmpgt32	%f4,	%f12,	%i4
	fxors	%f5,	%f22,	%f26
	movcc	%xcc,	%i2,	%l5
	and	%o5,	%i1,	%l2
	ta	%icc,	0x1
	te	%icc,	0x0
	movvc	%icc,	%o3,	%i6
	tn	%icc,	0x0
	fba,a	%fcc0,	loop_2265
	tvs	%icc,	0x7
	wr	%g0,	0x27,	%asi
	stwa	%g6,	[%l7 + 0x38] %asi
	membar	#Sync
loop_2265:
	array16	%o1,	%o6,	%i0
	lduh	[%l7 + 0x22],	%l0
	xnor	%i5,	%g5,	%i7
	flush	%l7 + 0x5C
	prefetch	[%l7 + 0x08],	 0x2
	faligndata	%f26,	%f22,	%f26
	bvc,a	%icc,	loop_2266
	fmovdg	%xcc,	%f10,	%f30
	sll	%g4,	0x01,	%l4
	tvc	%xcc,	0x4
loop_2266:
	fnands	%f18,	%f8,	%f13
	bgu	%xcc,	loop_2267
	fones	%f1
	prefetch	[%l7 + 0x7C],	 0x3
	tleu	%icc,	0x2
loop_2267:
	fbge	%fcc1,	loop_2268
	brlez,a	%l3,	loop_2269
	fone	%f12
	wr	%g0,	0x27,	%asi
	stba	%o0,	[%l7 + 0x3A] %asi
	membar	#Sync
loop_2268:
	taddcc	%g2,	0x13F1,	%l6
loop_2269:
	fble	%fcc1,	loop_2270
	fbge	%fcc3,	loop_2271
	array16	%o2,	%o4,	%g1
	srlx	%o7,	%g3,	%i3
loop_2270:
	movvc	%icc,	%g7,	%l1
loop_2271:
	taddcc	%i2,	0x1A80,	%l5
	fzero	%f18
	taddcctv	%i4,	0x08F5,	%o5
	orncc	%l2,	%i1,	%i6
	fmovsle	%xcc,	%f6,	%f24
	edge8l	%o3,	%g6,	%o1
	alignaddrl	%i0,	%o6,	%l0
	ldsh	[%l7 + 0x6A],	%i5
	move	%xcc,	%g5,	%i7
	ta	%xcc,	0x2
	ldd	[%l7 + 0x10],	%g4
	subc	%l3,	%l4,	%g2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%l6
	nop
	setx loop_2272, %l0, %l1
	jmpl %l1, %o2
	udivcc	%o4,	0x03C8,	%g1
	ldd	[%l7 + 0x70],	%f6
	brgez,a	%o7,	loop_2273
loop_2272:
	fnands	%f13,	%f10,	%f16
	movl	%icc,	%g3,	%o0
	stb	%i3,	[%l7 + 0x56]
loop_2273:
	fmovrdgez	%l1,	%f12,	%f2
	sllx	%i2,	%l5,	%g7
	movpos	%icc,	%o5,	%l2
	tcs	%xcc,	0x1
	xnor	%i4,	0x0B0A,	%i6
	fbue	%fcc1,	loop_2274
	fmovsa	%xcc,	%f11,	%f3
	subccc	%o3,	0x1913,	%g6
	movcs	%xcc,	%o1,	%i1
loop_2274:
	edge32ln	%o6,	%i0,	%l0
	orcc	%i5,	0x0541,	%g5
	tcc	%icc,	0x5
	fmovs	%f8,	%f6
	movrlez	%i7,	0x3A7,	%l3
	nop
	setx	loop_2275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	siam	0x4
	tcc	%xcc,	0x3
	fmovsg	%xcc,	%f26,	%f8
loop_2275:
	umul	%l4,	%g2,	%l6
	membar	0x11
	fmovrdgez	%o2,	%f22,	%f0
	lduh	[%l7 + 0x1E],	%o4
	movgu	%xcc,	%g1,	%g4
	movvc	%icc,	%g3,	%o0
	fcmps	%fcc3,	%f26,	%f7
	udivx	%i3,	0x0284,	%o7
	stw	%l1,	[%l7 + 0x20]
	andncc	%i2,	%l5,	%o5
	ldsw	[%l7 + 0x78],	%l2
	set	0x70, %o5
	lda	[%l7 + %o5] 0x88,	%f24
	swap	[%l7 + 0x68],	%i4
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x11
	fmovdcs	%icc,	%f25,	%f18
	bleu,a,pt	%xcc,	loop_2276
	sth	%g7,	[%l7 + 0x64]
	and	%i6,	%g6,	%o3
	and	%o1,	0x0A87,	%i1
loop_2276:
	edge8l	%i0,	%o6,	%i5
	umul	%g5,	0x0E7F,	%i7
	bg,a,pt	%icc,	loop_2277
	movrne	%l0,	0x152,	%l3
	set	0x54, %g3
	stba	%l4,	[%l7 + %g3] 0x11
loop_2277:
	umulcc	%l6,	0x1A1F,	%o2
	movrgz	%g2,	0x2FA,	%o4
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f2
	orn	%g1,	%g4,	%g3
	movge	%xcc,	%o0,	%o7
	taddcctv	%l1,	%i3,	%i2
	array8	%o5,	%l2,	%l5
	ldx	[%l7 + 0x10],	%i4
	sub	%g7,	%g6,	%i6
	fmovdne	%xcc,	%f0,	%f25
	alignaddrl	%o3,	%o1,	%i1
	brlz	%i0,	loop_2278
	tcc	%icc,	0x7
	edge8n	%i5,	%o6,	%g5
	fmovrslz	%i7,	%f6,	%f14
loop_2278:
	movrgez	%l0,	0x1EB,	%l4
	edge8n	%l3,	%l6,	%g2
	sub	%o2,	%o4,	%g1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%g4
	movg	%icc,	%o0,	%o7
	movcc	%icc,	%l1,	%g3
	fsrc1s	%f5,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i3,	%o5
	xorcc	%l2,	0x0CBB,	%l5
	orcc	%i4,	%g7,	%i2
	bn,pt	%xcc,	loop_2279
	tl	%icc,	0x5
	movg	%xcc,	%g6,	%i6
	movn	%xcc,	%o1,	%i1
loop_2279:
	fmovdneg	%icc,	%f24,	%f10
	tg	%icc,	0x2
	xnorcc	%o3,	%i5,	%i0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%g5
	std	%f4,	[%l7 + 0x60]
	fpsub32	%f14,	%f8,	%f10
	xnorcc	%i7,	%l0,	%o6
	umulcc	%l3,	0x1571,	%l6
	subc	%l4,	%o2,	%o4
	edge8l	%g1,	%g4,	%o0
	ta	%xcc,	0x6
	sethi	0x0568,	%g2
	fmovsgu	%xcc,	%f30,	%f23
	fmovdpos	%xcc,	%f0,	%f18
	membar	0x0B
	smulcc	%l1,	%g3,	%o7
	fmovdcc	%icc,	%f28,	%f4
	st	%f30,	[%l7 + 0x74]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x6
	movne	%icc,	%i3,	%o5
	fpack32	%f18,	%f14,	%f30
	movl	%icc,	%l5,	%l2
	movrlz	%i4,	0x38C,	%i2
	ldstub	[%l7 + 0x30],	%g7
	bge	loop_2280
	edge16	%g6,	%o1,	%i1
	fmovdn	%xcc,	%f0,	%f27
	set	0x65, %l5
	stba	%i6,	[%l7 + %l5] 0xea
	membar	#Sync
loop_2280:
	sdivcc	%i5,	0x0A05,	%o3
	fbug,a	%fcc2,	loop_2281
	fcmped	%fcc0,	%f20,	%f14
	tl	%xcc,	0x7
	orncc	%i0,	%g5,	%l0
loop_2281:
	fmuld8ulx16	%f18,	%f26,	%f12
	edge32n	%i7,	%o6,	%l6
	edge8l	%l3,	%o2,	%o4
	brgez	%l4,	loop_2282
	orncc	%g4,	0x0CC1,	%o0
	fbug	%fcc2,	loop_2283
	tvs	%xcc,	0x1
loop_2282:
	swap	[%l7 + 0x30],	%g1
	fbo	%fcc1,	loop_2284
loop_2283:
	fmovsle	%xcc,	%f28,	%f20
	tg	%icc,	0x2
	edge8	%g2,	%g3,	%l1
loop_2284:
	move	%icc,	%o7,	%i3
	fmovsa	%icc,	%f3,	%f16
	fmovdcc	%icc,	%f17,	%f25
	fbg	%fcc1,	loop_2285
	subc	%l5,	0x1F3E,	%o5
	fmul8ulx16	%f10,	%f12,	%f16
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l2
loop_2285:
	brlez,a	%i4,	loop_2286
	tl	%xcc,	0x5
	fmul8x16	%f20,	%f26,	%f22
	edge8ln	%i2,	%g7,	%g6
loop_2286:
	tge	%icc,	0x3
	ld	[%l7 + 0x08],	%f4
	stx	%o1,	[%l7 + 0x60]
	edge32ln	%i1,	%i5,	%o3
	popc	0x15FB,	%i0
	mulscc	%g5,	0x180F,	%i6
	fpsub32	%f22,	%f14,	%f12
	sth	%l0,	[%l7 + 0x16]
	movvs	%icc,	%o6,	%i7
	bge,a,pn	%xcc,	loop_2287
	sub	%l6,	0x0A1F,	%o2
	tgu	%xcc,	0x3
	xor	%o4,	%l4,	%l3
loop_2287:
	tsubcc	%o0,	%g4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x3C, %i5
	lduba	[%l7 + %i5] 0x80,	%g2
	tvc	%xcc,	0x1
	array32	%g3,	%o7,	%i3
	alignaddr	%l5,	%l1,	%o5
	alignaddr	%i4,	%i2,	%g7
	fbge,a	%fcc0,	loop_2288
	movcc	%icc,	%l2,	%o1
	edge32l	%i1,	%i5,	%o3
	sll	%g6,	%i0,	%g5
loop_2288:
	smul	%l0,	%o6,	%i6
	fmovrdlez	%l6,	%f6,	%f18
	fmovse	%icc,	%f11,	%f27
	fandnot2	%f12,	%f16,	%f8
	tvc	%icc,	0x6
	fmovsge	%icc,	%f24,	%f6
	fmovrdgez	%o2,	%f6,	%f28
	popc	0x13F9,	%i7
	fbule	%fcc1,	loop_2289
	movg	%xcc,	%l4,	%o4
	swap	[%l7 + 0x60],	%o0
	alignaddrl	%g4,	%l3,	%g1
loop_2289:
	fmovrdlz	%g2,	%f4,	%f20
	sub	%o7,	%g3,	%i3
	taddcc	%l1,	%l5,	%i4
	array16	%i2,	%g7,	%l2
	wr	%g0,	0x2a,	%asi
	stha	%o5,	[%l7 + 0x26] %asi
	membar	#Sync
	udivcc	%o1,	0x16D3,	%i1
	mova	%xcc,	%o3,	%g6
	fpadd16s	%f11,	%f2,	%f8
	bn,pt	%xcc,	loop_2290
	smulcc	%i0,	0x158E,	%g5
	movrlz	%l0,	0x359,	%i5
	movvs	%icc,	%o6,	%i6
loop_2290:
	movleu	%icc,	%l6,	%i7
	addcc	%o2,	%l4,	%o0
	tn	%icc,	0x1
	fnors	%f27,	%f3,	%f1
	sdiv	%g4,	0x180E,	%l3
	edge32n	%o4,	%g1,	%o7
	brlez	%g3,	loop_2291
	fpsub16s	%f6,	%f30,	%f14
	movrlz	%i3,	0x2C1,	%g2
	fmovrse	%l1,	%f28,	%f13
loop_2291:
	andncc	%l5,	%i2,	%g7
	taddcc	%i4,	0x17AD,	%l2
	movvc	%xcc,	%o1,	%o5
	fmovs	%f27,	%f5
	xnor	%o3,	%g6,	%i0
	fmovdg	%icc,	%f16,	%f24
	ldx	[%l7 + 0x50],	%g5
	xor	%l0,	0x126B,	%i1
	brnz,a	%i5,	loop_2292
	taddcc	%i6,	%l6,	%i7
	xnorcc	%o2,	0x1A24,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2292:
	fcmpeq16	%f8,	%f26,	%o0
	movg	%xcc,	%l4,	%g4
	edge32	%o4,	%g1,	%l3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o7,	%i3
	movgu	%xcc,	%g2,	%g3
	tn	%xcc,	0x2
	xnorcc	%l5,	%i2,	%l1
	fbge,a	%fcc2,	loop_2293
	fpadd16	%f24,	%f18,	%f26
	umulcc	%g7,	%i4,	%l2
	fmovscc	%xcc,	%f30,	%f25
loop_2293:
	move	%xcc,	%o5,	%o3
	edge32n	%o1,	%i0,	%g6
	fmovrsne	%g5,	%f0,	%f24
	membar	0x1A
	udivcc	%l0,	0x1A86,	%i5
	ldsh	[%l7 + 0x14],	%i1
	fmovsge	%xcc,	%f31,	%f30
	move	%xcc,	%i6,	%i7
	fmovsneg	%icc,	%f14,	%f23
	fbl	%fcc2,	loop_2294
	popc	0x11B8,	%l6
	subc	%o2,	%o0,	%l4
	tle	%xcc,	0x2
loop_2294:
	fmovsvs	%xcc,	%f0,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x3A],	%o6
	fornot1s	%f14,	%f21,	%f8
	set	0x0A, %o0
	stha	%g4,	[%l7 + %o0] 0x2a
	membar	#Sync
	edge32ln	%o4,	%l3,	%o7
	smul	%i3,	0x0ED9,	%g2
	srax	%g1,	0x0C,	%g3
	bn,pn	%xcc,	loop_2295
	fmovdleu	%icc,	%f10,	%f25
	movrlz	%i2,	%l5,	%g7
	fbl	%fcc3,	loop_2296
loop_2295:
	ldstub	[%l7 + 0x3B],	%l1
	fxor	%f24,	%f4,	%f28
	wr	%g0,	0x11,	%asi
	stha	%i4,	[%l7 + 0x14] %asi
loop_2296:
	bneg,a,pt	%icc,	loop_2297
	tneg	%xcc,	0x5
	ba	%icc,	loop_2298
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2297:
	subcc	%l2,	%o5,	%o1
	lduw	[%l7 + 0x60],	%i0
loop_2298:
	or	%g6,	0x1268,	%o3
	movg	%xcc,	%g5,	%i5
	add	%l0,	%i6,	%i1
	fornot1	%f6,	%f30,	%f14
	tsubcc	%i7,	0x157B,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x7
	ldd	[%l7 + 0x50],	%o0
	fmovda	%icc,	%f1,	%f13
	taddcc	%l4,	%o6,	%l6
	ta	%icc,	0x1
	set	0x4B, %g1
	ldsba	[%l7 + %g1] 0x04,	%o4
	fbn	%fcc2,	loop_2299
	fmovrse	%g4,	%f17,	%f30
	umulcc	%o7,	0x04E7,	%i3
	edge8	%l3,	%g1,	%g3
loop_2299:
	move	%xcc,	%g2,	%l5
	srax	%g7,	0x04,	%l1
	fcmps	%fcc2,	%f28,	%f7
	wr	%g0,	0x89,	%asi
	stda	%i4,	[%l7 + 0x38] %asi
	fnand	%f22,	%f26,	%f20
	brlz	%i2,	loop_2300
	tneg	%xcc,	0x2
	fmovdneg	%xcc,	%f9,	%f15
	stb	%o5,	[%l7 + 0x1A]
loop_2300:
	subcc	%l2,	%o1,	%g6
	movg	%xcc,	%i0,	%g5
	brnz	%o3,	loop_2301
	fxors	%f17,	%f3,	%f15
	brgez,a	%l0,	loop_2302
	tcs	%xcc,	0x0
loop_2301:
	mova	%xcc,	%i6,	%i5
	tcc	%icc,	0x4
loop_2302:
	movleu	%xcc,	%i7,	%i1
	fmovrdgz	%o0,	%f28,	%f6
	andncc	%o2,	%o6,	%l4
	fone	%f24
	fbl,a	%fcc1,	loop_2303
	ldub	[%l7 + 0x42],	%l6
	fand	%f26,	%f0,	%f16
	set	0x4D, %g5
	ldstuba	[%l7 + %g5] 0x18,	%g4
loop_2303:
	siam	0x1
	tgu	%icc,	0x5
	fnands	%f1,	%f20,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x220, %l2
	ldxa	[%g0 + %l2] 0x52,	%o7
	fnegd	%f2,	%f14
	array16	%o4,	%l3,	%i3
	udivcc	%g3,	0x0E13,	%g1
	call	loop_2304
	smul	%g2,	0x08FE,	%g7
	fmovdcc	%xcc,	%f20,	%f17
	fpsub32s	%f22,	%f14,	%f0
loop_2304:
	tge	%xcc,	0x5
	bvc,a,pn	%icc,	loop_2305
	bge,a	%xcc,	loop_2306
	movrne	%l5,	0x330,	%l1
	tg	%xcc,	0x0
loop_2305:
	xorcc	%i4,	0x10F5,	%i2
loop_2306:
	bpos,a	loop_2307
	fblg	%fcc1,	loop_2308
	taddcc	%o5,	0x071A,	%l2
	bgu,a,pn	%xcc,	loop_2309
loop_2307:
	sra	%g6,	%o1,	%g5
loop_2308:
	andcc	%o3,	0x0F33,	%l0
	sllx	%i0,	0x1C,	%i5
loop_2309:
	ldstub	[%l7 + 0x61],	%i6
	tg	%icc,	0x0
	sll	%i1,	%i7,	%o0
	fcmpgt32	%f4,	%f22,	%o6
	edge16n	%o2,	%l6,	%l4
	sra	%o7,	0x00,	%g4
	fbl,a	%fcc1,	loop_2310
	xnorcc	%l3,	0x0CA0,	%i3
	tcc	%xcc,	0x4
	brgez	%o4,	loop_2311
loop_2310:
	fzero	%f0
	movcc	%icc,	%g3,	%g2
	membar	0x20
loop_2311:
	sethi	0x154C,	%g7
	umul	%l5,	%l1,	%i4
	edge16n	%g1,	%o5,	%i2
	fandnot2s	%f11,	%f30,	%f24
	alignaddrl	%g6,	%l2,	%o1
	fcmpne32	%f16,	%f20,	%o3
	orncc	%g5,	0x0D36,	%i0
	sdiv	%i5,	0x161F,	%l0
	edge32n	%i6,	%i1,	%o0
	tgu	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f8,	%f15
	fbne,a	%fcc2,	loop_2312
	srl	%o6,	%o2,	%i7
	array8	%l4,	%l6,	%o7
	set	0x0C, %o7
	lduha	[%l7 + %o7] 0x11,	%l3
loop_2312:
	nop
	set	0x70, %g2
	sta	%f27,	[%l7 + %g2] 0x14
	array8	%g4,	%o4,	%g3
	sll	%g2,	%g7,	%l5
	sdivcc	%i3,	0x157F,	%l1
	fbue,a	%fcc1,	loop_2313
	fcmpgt32	%f2,	%f6,	%g1
	xnorcc	%o5,	%i2,	%g6
	srlx	%i4,	%o1,	%o3
loop_2313:
	edge32n	%l2,	%g5,	%i5
	orn	%l0,	0x1587,	%i6
	fcmple16	%f16,	%f16,	%i0
	orcc	%o0,	%o6,	%i1
	movl	%xcc,	%i7,	%o2
	fors	%f13,	%f7,	%f28
	fnot1s	%f31,	%f9
	fmul8x16al	%f16,	%f11,	%f22
	or	%l4,	%l6,	%o7
	sth	%g4,	[%l7 + 0x4C]
	edge8	%o4,	%l3,	%g2
	mulx	%g7,	0x17DA,	%l5
	fmovdvc	%icc,	%f10,	%f29
	movvs	%xcc,	%g3,	%i3
	addcc	%g1,	0x1F7C,	%l1
	xnorcc	%i2,	%g6,	%i4
	fbuge	%fcc2,	loop_2314
	edge16n	%o5,	%o1,	%o3
	xnorcc	%g5,	0x0860,	%l2
	set	0x54, %l3
	lduwa	[%l7 + %l3] 0x81,	%l0
loop_2314:
	addc	%i5,	%i0,	%o0
	sllx	%o6,	%i6,	%i1
	tn	%xcc,	0x5
	tle	%icc,	0x6
	tl	%xcc,	0x3
	fmovs	%f21,	%f21
	brgz,a	%o2,	loop_2315
	fpsub32s	%f23,	%f4,	%f1
	set	0x3C, %g4
	sta	%f20,	[%l7 + %g4] 0x81
loop_2315:
	fpadd16s	%f7,	%f14,	%f27
	te	%icc,	0x3
	addcc	%l4,	%i7,	%o7
	fnor	%f20,	%f16,	%f28
	fxnor	%f22,	%f18,	%f24
	movg	%icc,	%l6,	%o4
	andcc	%l3,	%g2,	%g7
	fmovrdlz	%g4,	%f14,	%f2
	fsrc2	%f10,	%f8
	movgu	%icc,	%l5,	%i3
	array8	%g1,	%l1,	%i2
	fbge	%fcc3,	loop_2316
	membar	0x35
	mova	%icc,	%g3,	%g6
	movleu	%xcc,	%i4,	%o5
loop_2316:
	edge16ln	%o3,	%o1,	%l2
	sdiv	%l0,	0x080A,	%g5
	movl	%icc,	%i0,	%i5
	movne	%icc,	%o0,	%i6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x15
	bge,pt	%icc,	loop_2317
	array8	%i1,	%o2,	%l4
	movrne	%i7,	%o7,	%o6
	mulscc	%l6,	%o4,	%g2
loop_2317:
	sdivcc	%l3,	0x1C40,	%g4
	sll	%l5,	0x12,	%i3
	fabss	%f2,	%f3
	bvs,pn	%xcc,	loop_2318
	sir	0x1F45
	umulcc	%g7,	%g1,	%l1
	alignaddrl	%i2,	%g3,	%i4
loop_2318:
	popc	0x0E76,	%g6
	andn	%o3,	0x118B,	%o1
	umul	%o5,	%l0,	%g5
	tgu	%icc,	0x4
	fbl,a	%fcc0,	loop_2319
	fnand	%f16,	%f16,	%f6
	ld	[%l7 + 0x58],	%f14
	stb	%i0,	[%l7 + 0x62]
loop_2319:
	alignaddr	%i5,	%o0,	%l2
	subcc	%i1,	%o2,	%l4
	subc	%i7,	%i6,	%o6
	sethi	0x0565,	%o7
	bpos,pt	%xcc,	loop_2320
	tcc	%xcc,	0x3
	edge32ln	%o4,	%l6,	%l3
	fnot2	%f28,	%f10
loop_2320:
	stx	%g2,	[%l7 + 0x30]
	stw	%g4,	[%l7 + 0x4C]
	fcmple16	%f14,	%f16,	%l5
	edge16l	%i3,	%g1,	%g7
	fmovsle	%xcc,	%f10,	%f10
	smulcc	%i2,	0x1136,	%g3
	ld	[%l7 + 0x08],	%f22
	smul	%l1,	0x1B1F,	%g6
	fbug,a	%fcc1,	loop_2321
	ld	[%l7 + 0x40],	%f6
	bcc	%xcc,	loop_2322
	array16	%o3,	%i4,	%o5
loop_2321:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7C, %g6
	ldswa	[%l7 + %g6] 0x0c,	%l0
loop_2322:
	brgez	%g5,	loop_2323
	fmovsle	%icc,	%f31,	%f30
	umulcc	%o1,	0x01BE,	%i0
	xnorcc	%i5,	%o0,	%i1
loop_2323:
	nop
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x0c
	movrne	%o2,	%l4,	%l2
	ldsh	[%l7 + 0x5E],	%i7
	bcs,a,pt	%icc,	loop_2324
	umul	%o6,	%i6,	%o4
	addccc	%o7,	0x062E,	%l3
	array8	%l6,	%g4,	%l5
loop_2324:
	movcs	%icc,	%i3,	%g2
	sth	%g7,	[%l7 + 0x5A]
	srlx	%i2,	%g1,	%g3
	tsubcctv	%l1,	0x0B54,	%g6
	orn	%o3,	%i4,	%o5
	movneg	%xcc,	%g5,	%l0
	tvs	%xcc,	0x1
	sllx	%i0,	0x1C,	%o1
	ldsw	[%l7 + 0x44],	%o0
	bneg	%xcc,	loop_2325
	tneg	%icc,	0x4
	fmul8ulx16	%f18,	%f20,	%f24
	fmovsne	%icc,	%f22,	%f4
loop_2325:
	array32	%i1,	%i5,	%o2
	smul	%l4,	0x125F,	%i7
	sllx	%o6,	0x15,	%l2
	swap	[%l7 + 0x14],	%i6
	sethi	0x002B,	%o7
	ldub	[%l7 + 0x10],	%l3
	stw	%l6,	[%l7 + 0x60]
	brnz	%g4,	loop_2326
	srlx	%o4,	0x08,	%l5
	movl	%icc,	%i3,	%g7
	movleu	%xcc,	%g2,	%i2
loop_2326:
	fmovsvc	%icc,	%f8,	%f13
	xorcc	%g1,	0x0D04,	%g3
	fmovrdlez	%g6,	%f24,	%f0
	ba	%icc,	loop_2327
	edge16	%o3,	%i4,	%o5
	movrlez	%l1,	0x0C7,	%l0
	bg,a	%icc,	loop_2328
loop_2327:
	edge32ln	%g5,	%i0,	%o1
	tl	%xcc,	0x7
	bpos	loop_2329
loop_2328:
	andn	%i1,	0x095F,	%o0
	flush	%l7 + 0x28
	fmovsl	%xcc,	%f18,	%f23
loop_2329:
	tneg	%xcc,	0x4
	movvc	%xcc,	%o2,	%l4
	umul	%i7,	0x1B88,	%i5
	mulx	%l2,	%i6,	%o6
	stw	%l3,	[%l7 + 0x28]
	fexpand	%f25,	%f18
	array32	%o7,	%g4,	%o4
	array8	%l6,	%i3,	%g7
	srl	%l5,	%i2,	%g2
	nop
	setx	loop_2330,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%g3,	%g1
	set	0x50, %l0
	swapa	[%l7 + %l0] 0x80,	%o3
loop_2330:
	bge	loop_2331
	movl	%icc,	%g6,	%o5
	fmovscs	%xcc,	%f20,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2331:
	movcs	%xcc,	%i4,	%l0
	taddcc	%g5,	0x07E5,	%l1
	sethi	0x1E7F,	%i0
	mova	%icc,	%o1,	%i1
	addcc	%o0,	0x1BF2,	%o2
	movvc	%icc,	%i7,	%l4
	ldstub	[%l7 + 0x12],	%l2
	movge	%xcc,	%i5,	%i6
	smul	%o6,	0x0A11,	%l3
	fcmpeq16	%f18,	%f30,	%g4
	edge32n	%o4,	%o7,	%l6
	fzero	%f12
	addc	%i3,	%l5,	%g7
	tpos	%icc,	0x0
	srl	%i2,	%g3,	%g2
	edge32n	%o3,	%g1,	%o5
	tle	%icc,	0x0
	mova	%xcc,	%g6,	%l0
	tne	%icc,	0x2
	nop
	set	0x56, %i6
	ldub	[%l7 + %i6],	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f18,	%f0,	%f28
	sllx	%l1,	%i4,	%o1
	edge32	%i0,	%i1,	%o2
	xnor	%i7,	%o0,	%l2
	tsubcctv	%l4,	%i6,	%i5
	set	0x0C, %o3
	lduba	[%l7 + %o3] 0x10,	%o6
	tpos	%icc,	0x2
	subc	%g4,	%o4,	%l3
	srlx	%l6,	%o7,	%l5
	ld	[%l7 + 0x4C],	%f5
	set	0x58, %i7
	lduba	[%l7 + %i7] 0x14,	%i3
	fmul8x16al	%f27,	%f26,	%f30
	stx	%i2,	[%l7 + 0x50]
	movleu	%xcc,	%g7,	%g3
	movrlz	%g2,	%o3,	%o5
	tl	%icc,	0x4
	fcmpgt16	%f14,	%f24,	%g6
	movl	%icc,	%l0,	%g5
	fmovsg	%xcc,	%f11,	%f22
	array16	%g1,	%i4,	%o1
	xor	%l1,	0x1490,	%i1
	orn	%o2,	%i7,	%i0
	tle	%xcc,	0x6
	movvc	%icc,	%l2,	%l4
	movcc	%icc,	%o0,	%i5
	movvs	%xcc,	%i6,	%o6
	fbug,a	%fcc3,	loop_2332
	taddcc	%g4,	0x0291,	%l3
	te	%xcc,	0x0
	fcmpgt16	%f12,	%f12,	%o4
loop_2332:
	movpos	%icc,	%l6,	%l5
	edge8n	%i3,	%i2,	%g7
	andncc	%g3,	%o7,	%o3
	sdiv	%g2,	0x1DCA,	%g6
	subcc	%o5,	0x0D12,	%g5
	sdivcc	%l0,	0x1A0C,	%i4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x04,	%g1,	%o1
	subccc	%i1,	0x1F71,	%o2
	edge32ln	%i7,	%l1,	%l2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l4
	orn	%i0,	%o0,	%i5
	edge16l	%i6,	%o6,	%l3
	ldd	[%l7 + 0x48],	%f26
	fmovdge	%xcc,	%f27,	%f15
	movn	%icc,	%o4,	%l6
	fmovdge	%icc,	%f13,	%f30
	wr	%g0,	0xeb,	%asi
	stba	%g4,	[%l7 + 0x6B] %asi
	membar	#Sync
	mova	%xcc,	%l5,	%i3
	set	0x35, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i2
	membar	0x62
	orcc	%g3,	%g7,	%o7
	array32	%g2,	%o3,	%g6
	wr	%g0,	0x2f,	%asi
	stxa	%g5,	[%l7 + 0x08] %asi
	membar	#Sync
	fba,a	%fcc3,	loop_2333
	fornot1	%f26,	%f18,	%f6
	bge	loop_2334
	andn	%o5,	0x15C1,	%l0
loop_2333:
	andcc	%i4,	0x108A,	%g1
	sdivcc	%i1,	0x0766,	%o1
loop_2334:
	fpadd32	%f30,	%f16,	%f0
	fmovdcs	%icc,	%f0,	%f20
	addc	%i7,	%o2,	%l1
	edge16	%l2,	%l4,	%o0
	xnor	%i5,	%i6,	%i0
	ldub	[%l7 + 0x0D],	%l3
	edge32n	%o6,	%l6,	%o4
	udiv	%g4,	0x19AB,	%l5
	fmovde	%icc,	%f0,	%f21
	umul	%i2,	%i3,	%g3
	bvs,a,pt	%icc,	loop_2335
	edge16	%o7,	%g2,	%g7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x28] %asi,	%g6
loop_2335:
	call	loop_2336
	sra	%o3,	%o5,	%g5
	fpadd16s	%f22,	%f3,	%f26
	tsubcc	%i4,	0x1072,	%l0
loop_2336:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g1,	%i1
	xnorcc	%i7,	0x0443,	%o2
	movpos	%icc,	%l1,	%l2
	fbl,a	%fcc1,	loop_2337
	fandnot1	%f18,	%f28,	%f16
	and	%l4,	%o1,	%o0
	mova	%icc,	%i5,	%i6
loop_2337:
	add	%l3,	%o6,	%l6
	sir	0x1684
	st	%f8,	[%l7 + 0x40]
	edge8	%o4,	%i0,	%g4
	fmovdvs	%icc,	%f19,	%f4
	movne	%icc,	%l5,	%i2
	tleu	%icc,	0x4
	xnor	%i3,	0x08EC,	%g3
	te	%xcc,	0x1
	movrne	%g2,	0x295,	%g7
	movvc	%xcc,	%g6,	%o3
	array16	%o7,	%g5,	%o5
	xorcc	%i4,	0x1237,	%g1
	orcc	%i1,	%i7,	%l0
	fcmpd	%fcc2,	%f14,	%f4
	nop
	set	0x2E, %o2
	ldsh	[%l7 + %o2],	%l1
	movneg	%xcc,	%o2,	%l2
	edge8	%l4,	%o0,	%o1
	fcmple16	%f22,	%f2,	%i6
	tge	%icc,	0x1
	mova	%icc,	%i5,	%l3
	fones	%f1
	subcc	%o6,	0x04D0,	%o4
	umul	%i0,	%l6,	%g4
	bleu,pt	%icc,	loop_2338
	lduh	[%l7 + 0x16],	%l5
	fandnot1	%f20,	%f4,	%f2
	nop
	set	0x47, %l1
	ldsb	[%l7 + %l1],	%i2
loop_2338:
	sra	%g3,	%g2,	%i3
	ldsw	[%l7 + 0x70],	%g7
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x81,	%g6
	smulcc	%o3,	%g5,	%o5
	sll	%o7,	%i4,	%i1
	sll	%g1,	%i7,	%l1
	fmovrdgz	%l0,	%f22,	%f12
	edge16n	%l2,	%o2,	%o0
	st	%f18,	[%l7 + 0x14]
	tsubcc	%l4,	%i6,	%i5
	fmovdneg	%xcc,	%f18,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o1,	0x10FF,	%o6
	tsubcctv	%l3,	%i0,	%l6
	fcmpne32	%f2,	%f28,	%g4
	fnor	%f26,	%f2,	%f2
	tn	%xcc,	0x4
	set	0x18, %i1
	sta	%f30,	[%l7 + %i1] 0x81
	movrlez	%l5,	%i2,	%o4
	subccc	%g2,	0x0028,	%g3
	movrlz	%g7,	0x0AB,	%g6
	ba	%xcc,	loop_2339
	fmovdneg	%xcc,	%f20,	%f1
	fnors	%f13,	%f15,	%f13
	sdiv	%i3,	0x1376,	%o3
loop_2339:
	ldsb	[%l7 + 0x5C],	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc2,	loop_2340
	stx	%o5,	[%l7 + 0x18]
	taddcc	%o7,	%i4,	%i1
	bpos,a	%xcc,	loop_2341
loop_2340:
	fcmpgt32	%f26,	%f30,	%i7
	sdivx	%l1,	0x172E,	%g1
	te	%icc,	0x3
loop_2341:
	fcmpeq16	%f28,	%f18,	%l2
	be,pn	%icc,	loop_2342
	sir	0x19E9
	movcc	%xcc,	%l0,	%o2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
loop_2342:
	movneg	%icc,	%o0,	%i5
	tn	%icc,	0x1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i6
	fmul8x16	%f8,	%f6,	%f30
	bge,pn	%icc,	loop_2343
	fmovsa	%xcc,	%f5,	%f28
	subc	%o6,	0x0D8E,	%l3
	wr	%g0,	0x52,	%asi
	stxa	%i0,	[%g0 + 0x218] %asi
loop_2343:
	edge8	%o1,	%l6,	%l5
	fmovscs	%icc,	%f13,	%f24
	addcc	%g4,	0x179F,	%o4
	tn	%icc,	0x6
	udivx	%i2,	0x1F3F,	%g2
	sllx	%g3,	0x10,	%g7
	smulcc	%g6,	0x17C9,	%i3
	edge32n	%o3,	%g5,	%o7
	set	0x18, %i3
	stda	%i4,	[%l7 + %i3] 0x2f
	membar	#Sync
	array16	%o5,	%i1,	%i7
	fbul,a	%fcc2,	loop_2344
	fones	%f25
	fone	%f18
	edge16	%g1,	%l1,	%l0
loop_2344:
	orn	%l2,	0x0484,	%o2
	sdivx	%l4,	0x0BDE,	%i5
	edge8l	%o0,	%i6,	%o6
	fzero	%f2
	swap	[%l7 + 0x64],	%i0
	fmovsn	%xcc,	%f8,	%f6
	tcs	%xcc,	0x7
	movgu	%icc,	%o1,	%l6
	tleu	%xcc,	0x0
	fcmpne16	%f26,	%f30,	%l5
	move	%xcc,	%l3,	%o4
	fpack32	%f16,	%f2,	%f30
	ble,a	%xcc,	loop_2345
	move	%icc,	%i2,	%g4
	movg	%icc,	%g3,	%g7
	fbu	%fcc3,	loop_2346
loop_2345:
	sethi	0x1D90,	%g2
	fbu,a	%fcc3,	loop_2347
	tg	%icc,	0x4
loop_2346:
	edge8l	%i3,	%o3,	%g5
	ldub	[%l7 + 0x60],	%g6
loop_2347:
	fpackfix	%f8,	%f20
	set	0x68, %l4
	stxa	%o7,	[%l7 + %l4] 0x80
	edge32ln	%o5,	%i1,	%i4
	edge8l	%g1,	%l1,	%i7
	srlx	%l0,	0x02,	%o2
	te	%icc,	0x0
	nop
	setx	loop_2348,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%l2,	%i5,	%l4
	membar	0x73
	xnorcc	%i6,	0x1C7B,	%o0
loop_2348:
	edge8	%o6,	%i0,	%o1
	bg	%xcc,	loop_2349
	edge16n	%l6,	%l5,	%l3
	edge32l	%o4,	%i2,	%g3
	fcmpgt32	%f16,	%f24,	%g4
loop_2349:
	tl	%icc,	0x1
	fbuge,a	%fcc0,	loop_2350
	movleu	%icc,	%g2,	%g7
	fbul,a	%fcc1,	loop_2351
	tneg	%xcc,	0x5
loop_2350:
	lduh	[%l7 + 0x28],	%o3
	bleu,a	%xcc,	loop_2352
loop_2351:
	xnorcc	%g5,	0x1CE1,	%g6
	mulscc	%i3,	0x131E,	%o5
	ldsw	[%l7 + 0x64],	%o7
loop_2352:
	fbe,a	%fcc3,	loop_2353
	tle	%xcc,	0x2
	movrlez	%i4,	0x10A,	%g1
	fnors	%f17,	%f2,	%f23
loop_2353:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x70],	%l0
	fbn	%fcc0,	loop_2354
	move	%xcc,	%i7,	%l0
	fsrc1s	%f5,	%f27
	tleu	%icc,	0x1
loop_2354:
	fzero	%f18
	bpos	%xcc,	loop_2355
	udiv	%i1,	0x1E87,	%o2
	fnot1	%f22,	%f2
	set	0x10, %i4
	ldxa	[%l7 + %i4] 0x10,	%i5
loop_2355:
	addcc	%l2,	0x0970,	%i6
	tpos	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l4,	%o0
	edge16ln	%o6,	%i0,	%l6
	sir	0x061A
	popc	%o1,	%l5
	fbge,a	%fcc2,	loop_2356
	alignaddr	%o4,	%i2,	%l3
	movcc	%icc,	%g3,	%g4
	movg	%icc,	%g2,	%o3
loop_2356:
	movre	%g7,	0x067,	%g5
	fmovsne	%xcc,	%f15,	%f31
	bgu,pt	%icc,	loop_2357
	fbu	%fcc1,	loop_2358
	tle	%xcc,	0x2
	edge16n	%g6,	%o5,	%o7
loop_2357:
	andcc	%i4,	0x1719,	%g1
loop_2358:
	array8	%i3,	%i7,	%l1
	flush	%l7 + 0x7C
	ldsw	[%l7 + 0x1C],	%l0
	tle	%icc,	0x1
	pdist	%f14,	%f4,	%f12
	movneg	%icc,	%i1,	%o2
	orn	%l2,	0x02E5,	%i6
	edge32	%i5,	%l4,	%o6
	edge8ln	%o0,	%i0,	%l6
	xor	%l5,	%o1,	%i2
	bpos,pn	%icc,	loop_2359
	fmul8x16au	%f6,	%f8,	%f20
	fnot2s	%f1,	%f1
	fcmped	%fcc1,	%f26,	%f0
loop_2359:
	addccc	%l3,	%o4,	%g3
	fpsub32	%f0,	%f8,	%f24
	tge	%icc,	0x0
	fble,a	%fcc2,	loop_2360
	fbul,a	%fcc0,	loop_2361
	orn	%g4,	%g2,	%g7
	swap	[%l7 + 0x4C],	%o3
loop_2360:
	movpos	%xcc,	%g6,	%o5
loop_2361:
	stbar
	edge16ln	%o7,	%i4,	%g1
	movne	%icc,	%i3,	%i7
	movre	%l1,	0x103,	%l0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i1
	edge16	%o2,	%g5,	%i6
	fmovsn	%xcc,	%f26,	%f22
	edge16ln	%l2,	%l4,	%i5
	fbul,a	%fcc3,	loop_2362
	edge32	%o0,	%o6,	%i0
	tsubcc	%l5,	0x04BB,	%o1
	fnegd	%f8,	%f24
loop_2362:
	bn	loop_2363
	fcmpeq16	%f6,	%f10,	%i2
	fmovscs	%xcc,	%f2,	%f3
	call	loop_2364
loop_2363:
	fmovsleu	%xcc,	%f4,	%f23
	fmuld8ulx16	%f3,	%f17,	%f24
	popc	%l6,	%o4
loop_2364:
	ldd	[%l7 + 0x30],	%l2
	tn	%xcc,	0x7
	tsubcc	%g4,	0x0BE4,	%g3
	movvc	%xcc,	%g7,	%o3
	set	0x18, %o5
	stxa	%g2,	[%l7 + %o5] 0x15
	udivx	%o5,	0x0746,	%o7
	array32	%g6,	%i4,	%g1
	set	0x30, %i0
	ldstuba	[%l7 + %i0] 0x0c,	%i3
	addc	%l1,	%l0,	%i7
	sllx	%i1,	%o2,	%i6
	alignaddrl	%l2,	%g5,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o0,	0x1CB4,	%o6
	bpos,a	loop_2365
	ba	%xcc,	loop_2366
	tgu	%icc,	0x5
	fcmple32	%f20,	%f26,	%l4
loop_2365:
	movrgez	%l5,	0x1B6,	%i0
loop_2366:
	bleu,a	%icc,	loop_2367
	orn	%i2,	%o1,	%l6
	set	0x4F, %g7
	ldsba	[%l7 + %g7] 0x88,	%o4
loop_2367:
	ldd	[%l7 + 0x50],	%f6
	movpos	%xcc,	%l3,	%g4
	tne	%icc,	0x3
	movrne	%g3,	%g7,	%o3
	fble	%fcc0,	loop_2368
	udivcc	%g2,	0x0D08,	%o5
	fbl,a	%fcc1,	loop_2369
	brnz,a	%g6,	loop_2370
loop_2368:
	movcc	%xcc,	%o7,	%i4
	tsubcc	%i3,	%l1,	%g1
loop_2369:
	tcc	%xcc,	0x7
loop_2370:
	movl	%icc,	%l0,	%i1
	andcc	%o2,	0x076E,	%i7
	swap	[%l7 + 0x74],	%i6
	movpos	%xcc,	%g5,	%l2
	movne	%icc,	%o0,	%o6
	movrlez	%l4,	%i5,	%l5
	tg	%xcc,	0x6
	nop
	setx loop_2371, %l0, %l1
	jmpl %l1, %i2
	popc	0x0C7E,	%o1
	edge8n	%l6,	%o4,	%i0
	tpos	%xcc,	0x3
loop_2371:
	swap	[%l7 + 0x14],	%l3
	smul	%g3,	%g7,	%g4
	ldsw	[%l7 + 0x28],	%g2
	movrne	%o5,	0x2BE,	%g6
	fand	%f6,	%f30,	%f6
	move	%xcc,	%o7,	%o3
	fnegd	%f6,	%f2
	edge32ln	%i4,	%l1,	%g1
	tsubcctv	%i3,	0x1D49,	%i1
	xnor	%l0,	%i7,	%i6
	tvc	%icc,	0x2
	tcs	%icc,	0x5
	fbo,a	%fcc2,	loop_2372
	fxnor	%f18,	%f30,	%f14
	fcmple16	%f10,	%f30,	%g5
	fone	%f28
loop_2372:
	tvs	%xcc,	0x5
	fmovsleu	%icc,	%f19,	%f15
	edge32l	%l2,	%o0,	%o6
	edge8ln	%o2,	%l4,	%i5
	tgu	%icc,	0x5
	bgu	%xcc,	loop_2373
	ble,pn	%icc,	loop_2374
	bgu,a,pn	%xcc,	loop_2375
	udivcc	%l5,	0x00D3,	%i2
loop_2373:
	fmovdvc	%xcc,	%f18,	%f19
loop_2374:
	fpadd16s	%f13,	%f6,	%f29
loop_2375:
	movcs	%xcc,	%l6,	%o4
	tne	%xcc,	0x3
	xorcc	%i0,	%o1,	%g3
	sra	%g7,	%l3,	%g2
	set	0x0F, %g3
	stba	%g4,	[%l7 + %g3] 0x88
	movvs	%icc,	%g6,	%o5
	tl	%xcc,	0x3
	fandnot2	%f22,	%f14,	%f10
	fmovspos	%icc,	%f24,	%f20
	xor	%o7,	%i4,	%l1
	fexpand	%f4,	%f28
	brgez,a	%g1,	loop_2376
	udiv	%o3,	0x1A2A,	%i3
	ldstub	[%l7 + 0x34],	%l0
	tsubcctv	%i1,	0x15AE,	%i7
loop_2376:
	fmul8x16	%f4,	%f4,	%f28
	movvs	%icc,	%i6,	%g5
	fpack32	%f18,	%f30,	%f0
	ba	loop_2377
	brz	%l2,	loop_2378
	bneg,pn	%xcc,	loop_2379
	fpsub32	%f4,	%f30,	%f12
loop_2377:
	movcs	%xcc,	%o6,	%o2
loop_2378:
	smul	%o0,	%i5,	%l4
loop_2379:
	sethi	0x1338,	%l5
	fors	%f25,	%f21,	%f1
	movpos	%icc,	%i2,	%o4
	edge8	%i0,	%o1,	%l6
	bpos,a	%icc,	loop_2380
	fbl	%fcc0,	loop_2381
	fornot1	%f24,	%f2,	%f6
	fbug	%fcc1,	loop_2382
loop_2380:
	tleu	%icc,	0x1
loop_2381:
	movpos	%icc,	%g3,	%l3
	brgz	%g2,	loop_2383
loop_2382:
	fbue	%fcc1,	loop_2384
	fnor	%f12,	%f10,	%f2
	sethi	0x0961,	%g4
loop_2383:
	movvc	%xcc,	%g7,	%o5
loop_2384:
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f20
	brgz,a	%o7,	loop_2385
	fandnot2	%f2,	%f6,	%f28
	set	0x12, %l6
	lduha	[%l7 + %l6] 0x19,	%g6
loop_2385:
	tsubcc	%l1,	0x0C1E,	%i4
	tneg	%icc,	0x5
	array8	%o3,	%g1,	%l0
	orn	%i1,	%i7,	%i6
	fbn	%fcc3,	loop_2386
	fandnot2s	%f17,	%f18,	%f3
	umul	%g5,	%l2,	%o6
	nop
	setx loop_2387, %l0, %l1
	jmpl %l1, %o2
loop_2386:
	movcc	%icc,	%o0,	%i3
	movcc	%icc,	%l4,	%l5
	fand	%f10,	%f14,	%f20
loop_2387:
	movleu	%icc,	%i2,	%i5
	movge	%icc,	%i0,	%o4
	fnand	%f4,	%f8,	%f28
	bleu,pt	%xcc,	loop_2388
	fsrc2s	%f7,	%f27
	addc	%o1,	0x0949,	%g3
	bvc,pt	%icc,	loop_2389
loop_2388:
	array16	%l3,	%g2,	%g4
	alignaddrl	%g7,	%o5,	%o7
	movrlez	%g6,	%l1,	%i4
loop_2389:
	ldsb	[%l7 + 0x47],	%o3
	fands	%f16,	%f11,	%f11
	movvc	%icc,	%g1,	%l6
	edge16	%l0,	%i1,	%i7
	membar	0x74
	movneg	%icc,	%g5,	%l2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x66] %asi,	%o6
	fmovscs	%icc,	%f15,	%f4
	fmovrsne	%i6,	%f31,	%f29
	mulscc	%o0,	0x0210,	%o2
	tg	%xcc,	0x3
	fbul	%fcc3,	loop_2390
	tgu	%xcc,	0x1
	brlez	%l4,	loop_2391
	edge16ln	%l5,	%i3,	%i2
loop_2390:
	fbn,a	%fcc2,	loop_2392
	movn	%xcc,	%i5,	%i0
loop_2391:
	popc	0x19CA,	%o1
	subcc	%g3,	0x1838,	%o4
loop_2392:
	membar	0x6D
	andn	%g2,	%l3,	%g7
	fmovsg	%xcc,	%f2,	%f30
	wr	%g0,	0x88,	%asi
	stha	%o5,	[%l7 + 0x38] %asi
	fandnot1	%f6,	%f16,	%f2
	orncc	%o7,	%g4,	%g6
	xorcc	%i4,	0x07E4,	%l1
	alignaddr	%o3,	%g1,	%l0
	tcc	%icc,	0x3
	add	%i1,	0x16CB,	%l6
	movl	%icc,	%i7,	%l2
	udiv	%o6,	0x1C53,	%g5
	sll	%i6,	%o2,	%o0
	movrgez	%l4,	0x093,	%l5
	siam	0x1
	srl	%i3,	%i5,	%i2
	fbuge	%fcc2,	loop_2393
	faligndata	%f22,	%f24,	%f4
	movle	%xcc,	%i0,	%g3
	ba	loop_2394
loop_2393:
	nop
	set	0x56, %o0
	stb	%o1,	[%l7 + %o0]
	movcs	%icc,	%o4,	%l3
	fandnot1s	%f12,	%f25,	%f28
loop_2394:
	tle	%xcc,	0x0
	stb	%g2,	[%l7 + 0x30]
	udivx	%o5,	0x08C7,	%o7
	ldsw	[%l7 + 0x78],	%g7
	sdivcc	%g4,	0x0A9C,	%i4
	ldsb	[%l7 + 0x56],	%l1
	movrgz	%o3,	0x1B5,	%g1
	wr	%g0,	0x80,	%asi
	sta	%f24,	[%l7 + 0x10] %asi
	taddcc	%g6,	0x1811,	%l0
	edge32n	%i1,	%i7,	%l2
	smulcc	%l6,	0x0E30,	%o6
	sdivcc	%g5,	0x1268,	%o2
	fmovrde	%i6,	%f10,	%f2
	tle	%xcc,	0x3
	edge8n	%o0,	%l5,	%i3
	subccc	%i5,	0x07E8,	%i2
	fmovdne	%xcc,	%f25,	%f30
	smul	%l4,	0x1A10,	%g3
	bgu,pn	%icc,	loop_2395
	movrlz	%i0,	%o1,	%l3
	sub	%g2,	%o5,	%o7
	add	%g7,	0x1019,	%o4
loop_2395:
	array16	%i4,	%g4,	%o3
	bne,a,pn	%xcc,	loop_2396
	mulx	%l1,	0x11AA,	%g6
	sllx	%l0,	%g1,	%i7
	brlz,a	%i1,	loop_2397
loop_2396:
	tgu	%icc,	0x2
	edge8	%l2,	%l6,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2397:
	fmovsg	%icc,	%f23,	%f12
	ba,pn	%xcc,	loop_2398
	umulcc	%g5,	%o2,	%i6
	fmovrdlez	%o0,	%f2,	%f6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x14,	%f16
loop_2398:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x52] %asi,	%i3
	fxnor	%f6,	%f14,	%f24
	set	0x14, %i5
	lda	[%l7 + %i5] 0x18,	%f26
	sth	%i5,	[%l7 + 0x5A]
	fmuld8sux16	%f6,	%f18,	%f6
	move	%xcc,	%i2,	%l5
	for	%f22,	%f4,	%f28
	xorcc	%g3,	%l4,	%o1
	tneg	%xcc,	0x4
	andncc	%i0,	%l3,	%o5
	movrlz	%o7,	0x034,	%g2
	fmovdleu	%icc,	%f28,	%f21
	movne	%xcc,	%o4,	%i4
	tl	%icc,	0x7
	fmovrsgz	%g7,	%f20,	%f10
	std	%o2,	[%l7 + 0x30]
	umulcc	%l1,	0x13A8,	%g6
	tg	%xcc,	0x6
	bpos,a,pt	%xcc,	loop_2399
	edge16	%g4,	%l0,	%g1
	udivcc	%i7,	0x0C9E,	%i1
	fpsub32s	%f15,	%f10,	%f26
loop_2399:
	tneg	%xcc,	0x5
	tle	%xcc,	0x0
	te	%xcc,	0x6
	bneg,a	loop_2400
	andn	%l2,	%o6,	%l6
	fbue	%fcc0,	loop_2401
	tvs	%icc,	0x4
loop_2400:
	edge8ln	%o2,	%i6,	%o0
	fmuld8sux16	%f29,	%f29,	%f18
loop_2401:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x58] %asi,	%g5
	te	%icc,	0x1
	tsubcc	%i5,	0x0D22,	%i3
	sra	%i2,	0x16,	%g3
	wr	%g0,	0x2f,	%asi
	stwa	%l4,	[%l7 + 0x40] %asi
	membar	#Sync
	xorcc	%l5,	%o1,	%l3
	set	0x60, %l2
	stda	%o4,	[%l7 + %l2] 0x10
	andcc	%i0,	%o7,	%g2
	sir	0x1C78
	andncc	%o4,	%g7,	%o3
	bshuffle	%f22,	%f26,	%f24
	smul	%l1,	%g6,	%g4
	edge8l	%i4,	%l0,	%g1
	ld	[%l7 + 0x1C],	%f18
	edge32	%i7,	%l2,	%i1
	set	0x55, %g5
	ldsba	[%l7 + %g5] 0x18,	%l6
	ble,a	%xcc,	loop_2402
	fcmpes	%fcc0,	%f18,	%f10
	tge	%xcc,	0x7
	tne	%xcc,	0x7
loop_2402:
	fmovrsne	%o2,	%f3,	%f21
	nop
	setx	loop_2403,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu	loop_2404
	nop
	setx	loop_2405,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsneg	%icc,	%f30,	%f30
loop_2403:
	xor	%i6,	0x02A9,	%o0
loop_2404:
	ldd	[%l7 + 0x78],	%f26
loop_2405:
	alignaddr	%o6,	%i5,	%i3
	set	0x68, %g2
	stda	%i2,	[%l7 + %g2] 0x88
	bpos,a,pt	%xcc,	loop_2406
	edge16n	%g5,	%l4,	%l5
	ba	loop_2407
	edge32l	%g3,	%o1,	%l3
loop_2406:
	fxor	%f26,	%f10,	%f14
	fbl,a	%fcc1,	loop_2408
loop_2407:
	ta	%xcc,	0x5
	movrlez	%o5,	%o7,	%i0
	mulx	%o4,	%g2,	%g7
loop_2408:
	umulcc	%l1,	0x191C,	%g6
	sir	0x1487
	tg	%icc,	0x1
	tleu	%xcc,	0x7
	fmovsleu	%icc,	%f9,	%f1
	lduw	[%l7 + 0x34],	%o3
	bleu,a,pt	%xcc,	loop_2409
	edge8ln	%g4,	%l0,	%g1
	membar	0x50
	bgu	%icc,	loop_2410
loop_2409:
	fands	%f4,	%f7,	%f4
	umulcc	%i7,	%i4,	%l2
	fmovrdlez	%i1,	%f18,	%f16
loop_2410:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x34] %asi,	%f19
	movre	%l6,	0x20A,	%i6
	nop
	set	0x50, %l3
	std	%o2,	[%l7 + %l3]
	sll	%o6,	0x00,	%o0
	udiv	%i3,	0x0D82,	%i5
	fbge	%fcc0,	loop_2411
	movneg	%icc,	%g5,	%l4
	tn	%xcc,	0x1
	swap	[%l7 + 0x28],	%l5
loop_2411:
	bl	%xcc,	loop_2412
	nop
	setx	loop_2413,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%i2,	%g3,	%l3
	movrgz	%o1,	%o7,	%i0
loop_2412:
	fmovsa	%icc,	%f30,	%f8
loop_2413:
	fmovdn	%icc,	%f24,	%f15
	fmovrdgz	%o5,	%f24,	%f22
	nop
	setx loop_2414, %l0, %l1
	jmpl %l1, %o4
	tneg	%icc,	0x0
	movrgz	%g2,	0x3D5,	%l1
	brlz,a	%g6,	loop_2415
loop_2414:
	udivx	%g7,	0x0C24,	%o3
	tn	%xcc,	0x7
	tvs	%xcc,	0x5
loop_2415:
	movrlz	%g4,	%g1,	%i7
	fmovs	%f26,	%f4
	movn	%icc,	%l0,	%l2
	sir	0x0FFF
	addccc	%i1,	0x1EED,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o2
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x19
	xnor	%l6,	%o6,	%o0
	andcc	%i3,	%i5,	%l4
	addccc	%l5,	%i2,	%g5
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l3
	orcc	%g3,	%o1,	%o7
	flush	%l7 + 0x38
	tge	%xcc,	0x3
	or	%o5,	0x03EC,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g2,	0x09A,	%o4
	fnor	%f18,	%f24,	%f6
	edge16n	%l1,	%g6,	%o3
	membar	0x20
	bpos,a,pn	%xcc,	loop_2416
	fcmpd	%fcc3,	%f2,	%f16
	edge8l	%g4,	%g1,	%g7
	set	0x08, %o6
	stda	%i6,	[%l7 + %o6] 0x80
loop_2416:
	edge16l	%l2,	%i1,	%l0
	fpsub32	%f24,	%f4,	%f16
	movcs	%xcc,	%i4,	%i6
	lduw	[%l7 + 0x5C],	%l6
	fbo,a	%fcc2,	loop_2417
	sllx	%o6,	0x18,	%o2
	movrlz	%i3,	0x177,	%o0
	movre	%l4,	%i5,	%l5
loop_2417:
	fandnot2s	%f28,	%f6,	%f2
	andncc	%g5,	%i2,	%l3
	set	0x0A, %g6
	ldstuba	[%l7 + %g6] 0x18,	%g3
	fnot1s	%f14,	%f13
	smulcc	%o7,	0x0763,	%o1
	fnors	%f1,	%f14,	%f30
	fbge	%fcc3,	loop_2418
	tvc	%icc,	0x1
	sub	%o5,	%i0,	%o4
	bge,pt	%icc,	loop_2419
loop_2418:
	sth	%l1,	[%l7 + 0x38]
	orncc	%g6,	0x0FAF,	%o3
	fmovsg	%icc,	%f5,	%f15
loop_2419:
	fbu	%fcc0,	loop_2420
	taddcc	%g4,	0x0980,	%g1
	tl	%xcc,	0x5
	fmovrse	%g2,	%f15,	%f19
loop_2420:
	move	%xcc,	%i7,	%g7
	edge8ln	%l2,	%l0,	%i4
	movgu	%xcc,	%i6,	%i1
	ldstub	[%l7 + 0x6A],	%l6
	sethi	0x18F6,	%o6
	ldd	[%l7 + 0x58],	%f22
	ble,a	%xcc,	loop_2421
	ldub	[%l7 + 0x7C],	%o2
	fnot1	%f0,	%f0
	sdivx	%o0,	0x0778,	%l4
loop_2421:
	fpack16	%f18,	%f14
	array16	%i5,	%i3,	%g5
	array8	%l5,	%i2,	%g3
	tneg	%xcc,	0x5
	fbo,a	%fcc1,	loop_2422
	fmovdg	%icc,	%f30,	%f28
	fand	%f12,	%f16,	%f14
	fbuge	%fcc2,	loop_2423
loop_2422:
	edge8ln	%o7,	%o1,	%l3
	bg,pn	%icc,	loop_2424
	nop
	setx	loop_2425,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2423:
	xorcc	%o5,	0x0517,	%o4
	sll	%i0,	%g6,	%l1
loop_2424:
	tg	%icc,	0x4
loop_2425:
	movrlz	%o3,	0x027,	%g1
	fandnot1	%f10,	%f6,	%f24
	sdiv	%g2,	0x16EE,	%g4
	tge	%icc,	0x7
	fcmpgt32	%f22,	%f18,	%i7
	fmovdvc	%icc,	%f14,	%f17
	fnot2s	%f25,	%f5
	subc	%g7,	%l2,	%l0
	fcmpne32	%f6,	%f20,	%i4
	bleu,a,pt	%xcc,	loop_2426
	add	%i1,	%i6,	%o6
	tg	%icc,	0x6
	tleu	%xcc,	0x2
loop_2426:
	te	%xcc,	0x1
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fands	%f23,	%f31,	%f7
	sll	%o2,	0x0E,	%l6
	fxor	%f14,	%f6,	%f6
	udivx	%o0,	0x02FE,	%i5
	fmovspos	%icc,	%f28,	%f5
	edge8ln	%i3,	%g5,	%l4
	ldd	[%l7 + 0x18],	%l4
	fxnors	%f20,	%f27,	%f30
	or	%i2,	%o7,	%o1
	stw	%l3,	[%l7 + 0x3C]
	tvs	%icc,	0x4
	tn	%icc,	0x6
	fmul8sux16	%f14,	%f28,	%f30
	edge16n	%g3,	%o5,	%i0
	movvs	%icc,	%o4,	%l1
	umulcc	%g6,	0x11F6,	%g1
	alignaddrl	%g2,	%o3,	%i7
	movle	%xcc,	%g7,	%g4
	tgu	%icc,	0x5
	add	%l0,	0x04D9,	%i4
	nop
	setx	loop_2427,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%l2,	%i6,	%i1
	sll	%o6,	0x1B,	%o2
	ld	[%l7 + 0x1C],	%f14
loop_2427:
	xor	%l6,	%i5,	%o0
	fcmple32	%f2,	%f30,	%i3
	srax	%l4,	0x1B,	%g5
	movn	%xcc,	%l5,	%o7
	fcmpgt32	%f12,	%f26,	%o1
	movn	%xcc,	%l3,	%i2
	sllx	%o5,	0x0D,	%g3
	ldd	[%l7 + 0x38],	%f8
	tcs	%xcc,	0x1
	edge8l	%i0,	%l1,	%o4
	ld	[%l7 + 0x0C],	%f3
	bn,pt	%xcc,	loop_2428
	udivcc	%g1,	0x120A,	%g6
	movge	%xcc,	%g2,	%o3
	edge16l	%i7,	%g7,	%g4
loop_2428:
	bleu,a	%xcc,	loop_2429
	edge32ln	%l0,	%i4,	%l2
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%i1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%i6
loop_2429:
	tle	%icc,	0x0
	mova	%xcc,	%o6,	%o2
	ba,a	%icc,	loop_2430
	edge8l	%l6,	%o0,	%i5
	brz,a	%i3,	loop_2431
	fcmped	%fcc3,	%f18,	%f8
loop_2430:
	udivx	%l4,	0x1967,	%g5
	nop
	setx loop_2432, %l0, %l1
	jmpl %l1, %o7
loop_2431:
	edge32l	%l5,	%l3,	%o1
	std	%o4,	[%l7 + 0x78]
	ld	[%l7 + 0x70],	%f27
loop_2432:
	movl	%icc,	%g3,	%i2
	movrne	%l1,	%o4,	%i0
	alignaddrl	%g6,	%g2,	%o3
	brgz,a	%g1,	loop_2433
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g7,	0x2AF,	%g4
	edge32l	%l0,	%i4,	%i7
loop_2433:
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%i0
	fbo	%fcc2,	loop_2434
	movre	%i6,	0x123,	%o6
	nop
	setx	loop_2435,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%o2,	0x1B1D,	%l6
loop_2434:
	fornot1s	%f0,	%f8,	%f10
	edge8l	%l2,	%o0,	%i3
loop_2435:
	move	%icc,	%l4,	%i5
	tg	%icc,	0x6
	fcmpd	%fcc0,	%f26,	%f4
	movcs	%icc,	%o7,	%g5
	umul	%l5,	0x0163,	%l3
	fmovdle	%icc,	%f28,	%f20
	set	0x28, %l0
	stda	%o4,	[%l7 + %l0] 0x04
	fexpand	%f21,	%f18
	addccc	%o1,	%g3,	%i2
	fbe,a	%fcc1,	loop_2436
	orcc	%l1,	%o4,	%g6
	tsubcc	%g2,	%o3,	%i0
	fnegs	%f23,	%f9
loop_2436:
	edge32	%g7,	%g4,	%l0
	fmovscc	%icc,	%f5,	%f7
	fnands	%f8,	%f1,	%f5
	fble	%fcc0,	loop_2437
	sir	0x0706
	movneg	%xcc,	%g1,	%i7
	srl	%i1,	%i6,	%o6
loop_2437:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%o2,	[%l7 + 0x5C] %asi
	edge16n	%i4,	%l2,	%o0
	movl	%icc,	%l6,	%l4
	movcc	%icc,	%i3,	%o7
	fandnot2	%f26,	%f0,	%f18
	fcmpeq16	%f20,	%f18,	%g5
	tsubcc	%i5,	0x0C0F,	%l3
	be,pt	%icc,	loop_2438
	bg	loop_2439
	movrlez	%o5,	%o1,	%l5
	brlz,a	%i2,	loop_2440
loop_2438:
	fsrc1s	%f29,	%f14
loop_2439:
	edge16l	%g3,	%l1,	%g6
	movne	%xcc,	%g2,	%o3
loop_2440:
	addccc	%i0,	0x1481,	%o4
	edge16n	%g4,	%g7,	%l0
	taddcc	%g1,	0x050D,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc0,	loop_2441
	sra	%i1,	0x0A,	%i6
	move	%icc,	%o2,	%i4
	fbu	%fcc3,	loop_2442
loop_2441:
	ta	%icc,	0x1
	orcc	%l2,	%o6,	%l6
	fble	%fcc0,	loop_2443
loop_2442:
	udivx	%l4,	0x10E7,	%i3
	fbue,a	%fcc1,	loop_2444
	sdiv	%o7,	0x0B17,	%o0
loop_2443:
	fble,a	%fcc2,	loop_2445
	sir	0x093D
loop_2444:
	fnors	%f19,	%f22,	%f7
	edge16ln	%i5,	%l3,	%g5
loop_2445:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o5,	%l5
	fmovdl	%xcc,	%f26,	%f2
	movle	%icc,	%o1,	%i2
	alignaddr	%g3,	%g6,	%l1
	nop
	setx	loop_2446,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsg	%icc,	%f8,	%f6
	fpackfix	%f26,	%f4
	ldstub	[%l7 + 0x0B],	%o3
loop_2446:
	smul	%i0,	0x1534,	%o4
	fmovrse	%g4,	%f28,	%f12
	sethi	0x14D0,	%g7
	fors	%f17,	%f18,	%f0
	fmovdgu	%icc,	%f15,	%f5
	sethi	0x1A34,	%l0
	fxnor	%f6,	%f10,	%f16
	array32	%g2,	%g1,	%i1
	ldub	[%l7 + 0x2D],	%i6
	ld	[%l7 + 0x30],	%f27
	set	0x58, %o3
	lduha	[%l7 + %o3] 0x80,	%i7
	fmovrde	%i4,	%f4,	%f22
	movne	%xcc,	%o2,	%o6
	tcs	%xcc,	0x7
	fmovsge	%icc,	%f7,	%f10
	taddcctv	%l6,	%l2,	%i3
	te	%icc,	0x1
	orcc	%o7,	%o0,	%l4
	tvs	%xcc,	0x4
	smulcc	%l3,	%i5,	%o5
	movrlz	%g5,	0x044,	%o1
	sra	%i2,	0x05,	%g3
	mulscc	%g6,	%l1,	%o3
	set	0x68, %i6
	ldswa	[%l7 + %i6] 0x15,	%i0
	smulcc	%o4,	0x036E,	%g4
	fpackfix	%f6,	%f22
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l5
	bvc,pt	%icc,	loop_2447
	taddcc	%l0,	%g2,	%g7
	fbug,a	%fcc3,	loop_2448
	andncc	%g1,	%i1,	%i7
loop_2447:
	pdist	%f24,	%f12,	%f16
	tsubcctv	%i6,	%o2,	%i4
loop_2448:
	fmovsle	%icc,	%f25,	%f25
	udivcc	%o6,	0x01D7,	%l2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i3
	movcc	%xcc,	%o7,	%o0
	popc	%l6,	%l3
	bge,a	loop_2449
	bne,a	%icc,	loop_2450
	tg	%icc,	0x0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x74] %asi,	%l4
loop_2449:
	tgu	%icc,	0x7
loop_2450:
	movvc	%xcc,	%o5,	%g5
	subcc	%o1,	0x00C8,	%i2
	udiv	%g3,	0x0DCE,	%i5
	edge32n	%g6,	%l1,	%o3
	fcmps	%fcc0,	%f12,	%f10
	fmovdcs	%icc,	%f9,	%f8
	tge	%xcc,	0x3
	movrlez	%o4,	0x29E,	%g4
	umulcc	%i0,	0x1AB1,	%l0
	array32	%l5,	%g7,	%g1
	membar	0x40
	ldsb	[%l7 + 0x69],	%g2
	fmovdl	%icc,	%f7,	%f18
	array8	%i1,	%i7,	%i6
	tcs	%xcc,	0x4
	tsubcctv	%i4,	%o6,	%o2
	popc	%l2,	%o7
	movcs	%xcc,	%i3,	%o0
	movpos	%xcc,	%l6,	%l4
	fzeros	%f15
	fbu	%fcc3,	loop_2451
	subccc	%o5,	%g5,	%l3
	fnot2	%f20,	%f28
	movrlz	%i2,	%g3,	%o1
loop_2451:
	tleu	%xcc,	0x1
	movrgez	%i5,	%g6,	%o3
	wr	%g0,	0xea,	%asi
	stda	%l0,	[%l7 + 0x18] %asi
	membar	#Sync
	movrgez	%g4,	0x075,	%o4
	addccc	%l0,	%l5,	%g7
	fbuge	%fcc0,	loop_2452
	mulscc	%i0,	0x0280,	%g1
	std	%f18,	[%l7 + 0x18]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%i7
loop_2452:
	move	%icc,	%i6,	%i4
	mova	%xcc,	%g2,	%o2
	fand	%f22,	%f16,	%f26
	fmovrslz	%l2,	%f23,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o6,	0x079E,	%i3
	tneg	%xcc,	0x4
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x0c,	%o6
	movpos	%xcc,	%l6,	%o0
	fbl	%fcc0,	loop_2453
	movrlz	%o5,	0x2C0,	%g5
	umul	%l3,	0x031C,	%i2
	std	%f14,	[%l7 + 0x50]
loop_2453:
	bn,pt	%icc,	loop_2454
	movrne	%l4,	%g3,	%o1
	ble,a	%xcc,	loop_2455
	nop
	setx	loop_2456,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2454:
	bneg,a,pn	%xcc,	loop_2457
	add	%i5,	%o3,	%g6
loop_2455:
	xorcc	%g4,	0x18FA,	%l1
loop_2456:
	ldsb	[%l7 + 0x1D],	%l0
loop_2457:
	movleu	%icc,	%l5,	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x18,	%i0,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%i1,	%i7
	fxor	%f2,	%f26,	%f14
	tl	%xcc,	0x7
	ldub	[%l7 + 0x69],	%i6
	xnorcc	%g2,	%o2,	%i4
	srax	%o6,	0x15,	%i3
	bne	%icc,	loop_2458
	lduh	[%l7 + 0x18],	%o7
	fcmpeq16	%f16,	%f8,	%l2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o0
loop_2458:
	array32	%l6,	%o5,	%g5
	popc	0x0441,	%i2
	movcc	%icc,	%l3,	%l4
	fmul8ulx16	%f12,	%f4,	%f28
	stx	%g3,	[%l7 + 0x20]
	array16	%o1,	%o3,	%i5
	udiv	%g4,	0x19B1,	%l1
	movcc	%xcc,	%g6,	%l5
	alignaddr	%l0,	%i0,	%g1
	fmul8ulx16	%f18,	%f24,	%f18
	movg	%icc,	%o4,	%g7
	movcs	%icc,	%i1,	%i7
	fmovsl	%xcc,	%f25,	%f26
	andcc	%i6,	0x1D71,	%o2
	fmovsle	%xcc,	%f0,	%f14
	andncc	%i4,	%o6,	%g2
	movgu	%icc,	%o7,	%l2
	fmovdleu	%icc,	%f30,	%f18
	fone	%f10
	addc	%o0,	0x0845,	%l6
	tne	%xcc,	0x0
	prefetch	[%l7 + 0x54],	 0x2
	movl	%icc,	%i3,	%g5
	fmovdcs	%xcc,	%f16,	%f28
	tne	%icc,	0x2
	fmul8x16al	%f20,	%f26,	%f2
	fmovrdgz	%o5,	%f2,	%f30
	fbul,a	%fcc0,	loop_2459
	movge	%xcc,	%i2,	%l4
	smulcc	%g3,	%o1,	%l3
	fcmple16	%f24,	%f30,	%o3
loop_2459:
	prefetch	[%l7 + 0x20],	 0x2
	tne	%icc,	0x0
	be,pt	%icc,	loop_2460
	fornot1	%f2,	%f10,	%f6
	fmovspos	%xcc,	%f30,	%f1
	mulx	%g4,	%l1,	%i5
loop_2460:
	srax	%g6,	%l5,	%i0
	taddcc	%g1,	%o4,	%g7
	stb	%l0,	[%l7 + 0x31]
	sdivcc	%i1,	0x0BAB,	%i6
	fmovrdlez	%o2,	%f20,	%f12
	tvs	%icc,	0x0
	ble,a	%xcc,	loop_2461
	lduw	[%l7 + 0x78],	%i4
	or	%o6,	%i7,	%o7
	fbge,a	%fcc3,	loop_2462
loop_2461:
	swap	[%l7 + 0x68],	%g2
	movleu	%xcc,	%l2,	%o0
	tleu	%icc,	0x0
loop_2462:
	fnand	%f14,	%f22,	%f8
	taddcc	%l6,	0x161C,	%i3
	fmovda	%xcc,	%f10,	%f22
	popc	0x0A93,	%g5
	subcc	%i2,	0x0D0A,	%o5
	edge32ln	%l4,	%o1,	%g3
	bge,a,pn	%xcc,	loop_2463
	fpadd32	%f12,	%f24,	%f30
	te	%xcc,	0x4
	movle	%xcc,	%l3,	%g4
loop_2463:
	fmovdle	%icc,	%f0,	%f31
	tsubcc	%o3,	0x04DB,	%i5
	edge8ln	%l1,	%l5,	%g6
	stbar
	move	%xcc,	%g1,	%o4
	movvc	%xcc,	%i0,	%g7
	srlx	%l0,	0x02,	%i1
	movne	%xcc,	%o2,	%i6
	fnands	%f14,	%f30,	%f11
	tcs	%xcc,	0x3
	srax	%i4,	%i7,	%o6
	tg	%xcc,	0x5
	movg	%xcc,	%g2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o0,	%l2,	%i3
	fands	%f27,	%f27,	%f7
	fmovrsgez	%l6,	%f2,	%f2
	array32	%i2,	%o5,	%l4
	smul	%o1,	0x0E21,	%g3
	fnand	%f20,	%f22,	%f0
	movg	%icc,	%l3,	%g5
	fbuge	%fcc1,	loop_2464
	fmovdl	%icc,	%f6,	%f11
	tleu	%icc,	0x7
	fcmpgt16	%f6,	%f2,	%o3
loop_2464:
	movrgez	%g4,	0x355,	%l1
	xnor	%i5,	%g6,	%l5
	bcs,a	%icc,	loop_2465
	brz	%g1,	loop_2466
	edge8ln	%o4,	%i0,	%g7
	movvs	%icc,	%l0,	%o2
loop_2465:
	sethi	0x192F,	%i6
loop_2466:
	mova	%icc,	%i1,	%i7
	alignaddrl	%o6,	%i4,	%o7
	fba,a	%fcc1,	loop_2467
	fsrc1s	%f16,	%f24
	edge8ln	%o0,	%g2,	%i3
	wr	%g0,	0x5f,	%asi
	stxa	%l2,	[%g0 + 0x0] %asi
loop_2467:
	fmovrslez	%i2,	%f24,	%f29
	fmovdneg	%xcc,	%f24,	%f28
	udivcc	%l6,	0x1297,	%l4
	xnorcc	%o1,	%g3,	%o5
	fnot2s	%f30,	%f6
	fmovrse	%g5,	%f27,	%f7
	orncc	%l3,	0x192C,	%o3
	srax	%l1,	0x0A,	%i5
	movn	%icc,	%g4,	%l5
	sllx	%g1,	0x15,	%g6
	st	%f22,	[%l7 + 0x1C]
	brlz	%i0,	loop_2468
	fmovdge	%xcc,	%f12,	%f19
	fba,a	%fcc2,	loop_2469
	bg,a,pn	%icc,	loop_2470
loop_2468:
	fmovsleu	%xcc,	%f8,	%f17
	movl	%xcc,	%o4,	%l0
loop_2469:
	fmovsg	%icc,	%f23,	%f2
loop_2470:
	udivx	%g7,	0x1AEE,	%o2
	movge	%icc,	%i1,	%i7
	orncc	%i6,	0x0408,	%i4
	movrgz	%o6,	%o0,	%o7
	fcmpne16	%f10,	%f22,	%i3
	ldsh	[%l7 + 0x22],	%l2
	movrgz	%i2,	0x27B,	%l6
	mulx	%l4,	0x0281,	%o1
	flush	%l7 + 0x70
	tleu	%xcc,	0x3
	bneg,pt	%xcc,	loop_2471
	movne	%icc,	%g3,	%o5
	andcc	%g2,	%g5,	%l3
	bvc,pt	%xcc,	loop_2472
loop_2471:
	tne	%xcc,	0x2
	fblg	%fcc0,	loop_2473
	prefetch	[%l7 + 0x34],	 0x2
loop_2472:
	fnors	%f30,	%f18,	%f6
	udiv	%o3,	0x017B,	%i5
loop_2473:
	edge16	%g4,	%l5,	%g1
	bcc,a,pt	%xcc,	loop_2474
	movn	%xcc,	%l1,	%g6
	orcc	%o4,	%l0,	%i0
	alignaddrl	%o2,	%g7,	%i7
loop_2474:
	movpos	%xcc,	%i6,	%i1
	subccc	%i4,	%o6,	%o0
	tsubcctv	%o7,	0x05AD,	%l2
	xnor	%i3,	%l6,	%i2
	tvc	%xcc,	0x4
	movleu	%xcc,	%o1,	%l4
	edge8	%o5,	%g3,	%g5
	subcc	%g2,	0x0503,	%o3
	fmovspos	%xcc,	%f11,	%f9
	orcc	%i5,	%g4,	%l3
	srl	%l5,	0x18,	%g1
	fcmpeq16	%f14,	%f26,	%g6
	tge	%xcc,	0x1
	xorcc	%o4,	%l1,	%l0
	movn	%xcc,	%o2,	%i0
	taddcctv	%i7,	0x0B67,	%i6
	movle	%icc,	%i1,	%i4
	fmul8ulx16	%f26,	%f6,	%f14
	fnot2s	%f28,	%f1
	movvs	%xcc,	%o6,	%o0
	ldx	[%l7 + 0x20],	%g7
	fmovrdgez	%l2,	%f22,	%f24
	ble,a	%xcc,	loop_2475
	brnz	%o7,	loop_2476
	ldsw	[%l7 + 0x1C],	%l6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%i2
loop_2475:
	tvs	%icc,	0x0
loop_2476:
	fbu,a	%fcc1,	loop_2477
	movrgz	%l4,	%o1,	%g3
	sra	%o5,	%g2,	%o3
	subc	%g5,	%i5,	%l3
loop_2477:
	st	%f26,	[%l7 + 0x3C]
	fbug,a	%fcc0,	loop_2478
	movle	%xcc,	%g4,	%l5
	subcc	%g1,	%o4,	%l1
	ldsh	[%l7 + 0x4E],	%l0
loop_2478:
	addc	%g6,	%i0,	%o2
	tleu	%icc,	0x0
	fbe	%fcc1,	loop_2479
	sll	%i7,	0x0F,	%i1
	movvs	%xcc,	%i6,	%o6
	mulscc	%i4,	%o0,	%g7
loop_2479:
	orn	%l2,	0x04D4,	%l6
	popc	0x0BA5,	%i3
	ble,a,pn	%xcc,	loop_2480
	orn	%o7,	%i2,	%o1
	movleu	%icc,	%l4,	%g3
	st	%f29,	[%l7 + 0x10]
loop_2480:
	andcc	%g2,	%o5,	%g5
	movrlez	%o3,	%i5,	%g4
	add	%l3,	%g1,	%l5
	tpos	%xcc,	0x1
	edge8ln	%o4,	%l0,	%l1
	fmovsleu	%xcc,	%f4,	%f15
	andn	%g6,	0x1A1C,	%i0
	sra	%i7,	0x1A,	%o2
	movrlez	%i6,	0x28E,	%o6
	brgz,a	%i1,	loop_2481
	udiv	%o0,	0x1197,	%g7
	tne	%xcc,	0x4
	fcmpes	%fcc2,	%f28,	%f30
loop_2481:
	fpack16	%f14,	%f30
	call	loop_2482
	pdist	%f18,	%f2,	%f10
	move	%xcc,	%l2,	%i4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%l6
loop_2482:
	fbe,a	%fcc0,	loop_2483
	movle	%icc,	%o7,	%i3
	or	%i2,	0x04C7,	%o1
	movpos	%xcc,	%g3,	%l4
loop_2483:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%g2
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x80,	%o4
	orn	%o3,	%g5,	%g4
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x15
	movrgz	%l3,	%i5,	%g1
	bleu,a	loop_2484
	bvc	%xcc,	loop_2485
	fble,a	%fcc2,	loop_2486
	sllx	%o4,	0x12,	%l5
loop_2484:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
loop_2485:
	subccc	%l1,	%i0,	%g6
loop_2486:
	smul	%i7,	%i6,	%o6
	movg	%xcc,	%i1,	%o2
	orncc	%o0,	0x1455,	%l2
	xor	%i4,	%l6,	%o7
	sllx	%i3,	0x1D,	%i2
	fxors	%f16,	%f0,	%f8
	sdivx	%o1,	0x09ED,	%g7
	fbule,a	%fcc2,	loop_2487
	sub	%g3,	0x173A,	%g2
	edge8l	%l4,	%o5,	%g5
	brlz	%g4,	loop_2488
loop_2487:
	movcs	%xcc,	%l3,	%i5
	fzeros	%f30
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
loop_2488:
	tsubcctv	%o4,	%l5,	%o3
	xnor	%l0,	%i0,	%g6
	movcs	%icc,	%i7,	%i6
	sdiv	%o6,	0x0408,	%l1
	ldd	[%l7 + 0x70],	%i0
	membar	0x58
	alignaddr	%o0,	%l2,	%i4
	xor	%l6,	0x0F14,	%o7
	fble,a	%fcc2,	loop_2489
	subc	%i3,	%i2,	%o2
	nop
	set	0x6B, %o1
	ldub	[%l7 + %o1],	%o1
	brgz	%g7,	loop_2490
loop_2489:
	popc	0x0C6C,	%g3
	movre	%l4,	0x276,	%o5
	bcs,a	loop_2491
loop_2490:
	movcc	%xcc,	%g5,	%g4
	fmovsneg	%xcc,	%f22,	%f8
	fands	%f31,	%f9,	%f21
loop_2491:
	fnegd	%f10,	%f8
	sub	%g2,	0x0E4F,	%i5
	set	0x4C, %i1
	stha	%g1,	[%l7 + %i1] 0x2b
	membar	#Sync
	fmul8x16	%f15,	%f2,	%f12
	fmovrdlz	%l3,	%f0,	%f4
	fmovda	%icc,	%f17,	%f10
	membar	0x18
	sra	%l5,	0x10,	%o3
	edge8n	%l0,	%o4,	%i0
	tgu	%icc,	0x6
	tsubcctv	%i7,	0x070B,	%i6
	tleu	%icc,	0x1
	add	%g6,	0x1EBB,	%l1
	nop
	setx loop_2492, %l0, %l1
	jmpl %l1, %o6
	tvs	%xcc,	0x3
	movne	%xcc,	%i1,	%o0
	movgu	%icc,	%i4,	%l6
loop_2492:
	tg	%icc,	0x3
	fmul8sux16	%f4,	%f8,	%f4
	tle	%xcc,	0x1
	be	%xcc,	loop_2493
	fsrc2s	%f17,	%f24
	mulscc	%l2,	0x05A3,	%o7
	fandnot2s	%f12,	%f14,	%f5
loop_2493:
	ldstub	[%l7 + 0x6F],	%i3
	array16	%i2,	%o1,	%g7
	fnot1	%f18,	%f10
	sllx	%g3,	%l4,	%o2
	movpos	%xcc,	%g5,	%g4
	wr	%g0,	0x10,	%asi
	sta	%f27,	[%l7 + 0x30] %asi
	edge16ln	%g2,	%i5,	%o5
	sethi	0x0C81,	%l3
	movvs	%xcc,	%g1,	%o3
	set	0x2C, %l1
	sta	%f9,	[%l7 + %l1] 0x15
	tleu	%xcc,	0x5
	bl,pt	%xcc,	loop_2494
	srax	%l0,	%o4,	%i0
	andn	%l5,	%i6,	%i7
	fmovrsne	%g6,	%f16,	%f13
loop_2494:
	andcc	%l1,	0x0514,	%o6
	bn,a,pt	%icc,	loop_2495
	fmovrsne	%i1,	%f16,	%f3
	tcs	%xcc,	0x4
	subc	%o0,	%l6,	%l2
loop_2495:
	fcmped	%fcc2,	%f26,	%f16
	sll	%o7,	0x12,	%i4
	xnorcc	%i3,	%i2,	%g7
	set	0x3C, %l4
	swapa	[%l7 + %l4] 0x80,	%g3
	fbule	%fcc3,	loop_2496
	addcc	%o1,	%l4,	%o2
	fand	%f4,	%f26,	%f8
	faligndata	%f2,	%f30,	%f24
loop_2496:
	tge	%icc,	0x6
	tge	%icc,	0x0
	xor	%g4,	%g5,	%i5
	edge32ln	%o5,	%l3,	%g1
	bshuffle	%f0,	%f2,	%f4
	bvs,pn	%xcc,	loop_2497
	fpsub32	%f16,	%f28,	%f22
	alignaddr	%g2,	%o3,	%l0
	fmul8x16al	%f7,	%f4,	%f26
loop_2497:
	stw	%o4,	[%l7 + 0x6C]
	smulcc	%i0,	%l5,	%i6
	fands	%f26,	%f28,	%f20
	sllx	%i7,	0x02,	%l1
	fpadd32	%f26,	%f26,	%f4
	orcc	%o6,	%g6,	%o0
	tsubcc	%i1,	0x1174,	%l6
	xor	%o7,	0x0A79,	%l2
	alignaddrl	%i3,	%i2,	%i4
	wr	%g0,	0x19,	%asi
	sta	%f11,	[%l7 + 0x54] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x7C, %i4
	lduw	[%l7 + %i4],	%g7
	addcc	%g3,	0x0052,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc0,	loop_2498
	te	%xcc,	0x0
	alignaddrl	%l4,	%g4,	%g5
	tvc	%icc,	0x4
loop_2498:
	nop
	set	0x3F, %o5
	ldub	[%l7 + %o5],	%i5
	udivcc	%o5,	0x002C,	%o2
	fbule	%fcc3,	loop_2499
	tl	%xcc,	0x7
	fba,a	%fcc0,	loop_2500
	stb	%l3,	[%l7 + 0x21]
loop_2499:
	array32	%g2,	%o3,	%g1
	movneg	%icc,	%l0,	%i0
loop_2500:
	ldsh	[%l7 + 0x3E],	%o4
	lduw	[%l7 + 0x28],	%i6
	edge32n	%l5,	%i7,	%o6
	ldsb	[%l7 + 0x78],	%l1
	wr	%g0,	0x89,	%asi
	stha	%o0,	[%l7 + 0x72] %asi
	tgu	%icc,	0x7
	fbue	%fcc3,	loop_2501
	addcc	%g6,	%i1,	%o7
	edge32n	%l6,	%i3,	%l2
	edge16ln	%i2,	%g7,	%g3
loop_2501:
	array32	%i4,	%l4,	%o1
	edge32	%g5,	%i5,	%g4
	tne	%icc,	0x0
	fpsub32s	%f11,	%f14,	%f22
	sll	%o5,	%o2,	%l3
	movge	%icc,	%g2,	%o3
	bl,pt	%xcc,	loop_2502
	tvc	%icc,	0x0
	xnor	%g1,	%i0,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2502:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x70] %asi,	%f4
	ld	[%l7 + 0x5C],	%f6
	edge16	%o4,	%l5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%o6,	loop_2503
	tle	%icc,	0x6
	bcs,pn	%icc,	loop_2504
	ld	[%l7 + 0x2C],	%f21
loop_2503:
	or	%l1,	%o0,	%g6
	udivcc	%i7,	0x16E2,	%i1
loop_2504:
	fbule,a	%fcc2,	loop_2505
	nop
	setx loop_2506, %l0, %l1
	jmpl %l1, %l6
	fnands	%f26,	%f17,	%f2
	tg	%xcc,	0x3
loop_2505:
	array16	%o7,	%i3,	%l2
loop_2506:
	movne	%icc,	%i2,	%g3
	std	%f8,	[%l7 + 0x50]
	move	%xcc,	%g7,	%i4
	andncc	%o1,	%l4,	%g5
	bleu,a,pt	%xcc,	loop_2507
	xorcc	%i5,	0x1719,	%g4
	udivx	%o5,	0x0454,	%l3
	fmovrdlez	%g2,	%f6,	%f4
loop_2507:
	srax	%o3,	%o2,	%g1
	udivcc	%i0,	0x10E9,	%o4
	wr	%g0,	0x0c,	%asi
	stba	%l0,	[%l7 + 0x67] %asi
	ba,a	loop_2508
	prefetch	[%l7 + 0x78],	 0x3
	stb	%i6,	[%l7 + 0x7C]
	ta	%xcc,	0x0
loop_2508:
	edge32n	%l5,	%o6,	%l1
	fmovsne	%icc,	%f10,	%f15
	edge16ln	%o0,	%g6,	%i1
	sth	%l6,	[%l7 + 0x2E]
	movrlz	%i7,	%i3,	%o7
	tl	%icc,	0x4
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x72] %asi,	%l2
	fand	%f6,	%f14,	%f22
	sdiv	%i2,	0x140E,	%g7
	movcs	%xcc,	%i4,	%o1
	xnorcc	%g3,	0x1195,	%g5
	fbo	%fcc2,	loop_2509
	ldstub	[%l7 + 0x76],	%l4
	fmovde	%xcc,	%f7,	%f12
	movle	%xcc,	%i5,	%o5
loop_2509:
	tcc	%xcc,	0x7
	fba	%fcc2,	loop_2510
	fbn,a	%fcc2,	loop_2511
	fornot2s	%f26,	%f12,	%f30
	tcs	%icc,	0x6
loop_2510:
	movgu	%xcc,	%g4,	%g2
loop_2511:
	sdiv	%o3,	0x1033,	%o2
	sdivcc	%g1,	0x0001,	%l3
	fbg,a	%fcc3,	loop_2512
	array32	%o4,	%l0,	%i0
	sir	0x1144
	edge32l	%l5,	%o6,	%i6
loop_2512:
	fxors	%f23,	%f8,	%f5
	brlez	%o0,	loop_2513
	fbe	%fcc0,	loop_2514
	fors	%f29,	%f26,	%f3
	bpos,pt	%xcc,	loop_2515
loop_2513:
	array8	%l1,	%g6,	%i1
loop_2514:
	fmuld8sux16	%f4,	%f20,	%f0
	xnorcc	%l6,	%i7,	%i3
loop_2515:
	ble	loop_2516
	move	%icc,	%o7,	%l2
	edge32	%i2,	%i4,	%o1
	set	0x7C, %i3
	ldswa	[%l7 + %i3] 0x88,	%g7
loop_2516:
	tgu	%icc,	0x0
	smulcc	%g5,	0x08EF,	%l4
	fexpand	%f13,	%f22
	sdivx	%g3,	0x0EDB,	%i5
	edge16	%g4,	%o5,	%o3
	sub	%g2,	0x1E22,	%o2
	edge16n	%l3,	%o4,	%l0
	movpos	%icc,	%g1,	%i0
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xeb,	%l4
	andcc	%i6,	0x0711,	%o0
	movrlez	%l1,	%g6,	%i1
	edge32l	%l6,	%o6,	%i7
	taddcctv	%i3,	%o7,	%i2
	fnot1s	%f19,	%f6
	fmovscs	%icc,	%f7,	%f12
	be	loop_2517
	sll	%i4,	0x12,	%l2
	umulcc	%o1,	0x01EF,	%g7
	fmovrde	%l4,	%f4,	%f24
loop_2517:
	mova	%icc,	%g3,	%i5
	xorcc	%g4,	%o5,	%o3
	tcc	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f30,	%f10,	%f18
	array16	%g2,	%o2,	%g5
	orn	%l3,	0x0A3E,	%l0
	alignaddrl	%g1,	%o4,	%l5
	fmovrdgz	%i6,	%f26,	%f6
	brlz,a	%i0,	loop_2518
	bvs,pt	%icc,	loop_2519
	brgz,a	%l1,	loop_2520
	udiv	%o0,	0x0E66,	%g6
loop_2518:
	tvs	%xcc,	0x6
loop_2519:
	and	%i1,	0x18DA,	%l6
loop_2520:
	edge16	%o6,	%i7,	%i3
	tle	%xcc,	0x2
	popc	%i2,	%o7
	set	0x47, %g7
	ldstuba	[%l7 + %g7] 0x19,	%l2
	tvc	%icc,	0x3
	edge32l	%i4,	%o1,	%l4
	udivcc	%g3,	0x1336,	%g7
	fsrc2s	%f4,	%f18
	fbl	%fcc2,	loop_2521
	tle	%icc,	0x0
	nop
	setx	loop_2522,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%xcc,	0x0
loop_2521:
	fmovsleu	%xcc,	%f25,	%f31
	movpos	%xcc,	%g4,	%o5
loop_2522:
	mulscc	%o3,	%g2,	%i5
	subcc	%g5,	0x08BC,	%l3
	ldsw	[%l7 + 0x54],	%l0
	siam	0x7
	movcs	%xcc,	%g1,	%o2
	bleu,a	%xcc,	loop_2523
	srax	%l5,	0x01,	%o4
	fone	%f0
	sll	%i6,	0x04,	%l1
loop_2523:
	fandnot2s	%f24,	%f26,	%f15
	tvs	%xcc,	0x7
	movvs	%xcc,	%o0,	%i0
	tn	%icc,	0x2
	taddcc	%i1,	0x1C1D,	%g6
	movleu	%icc,	%l6,	%o6
	ldd	[%l7 + 0x68],	%f12
	andncc	%i7,	%i2,	%o7
	fnands	%f24,	%f20,	%f25
	fmovsne	%xcc,	%f14,	%f27
	stbar
	edge8ln	%l2,	%i4,	%i3
	ldd	[%l7 + 0x50],	%l4
	edge8	%o1,	%g3,	%g7
	wr	%g0,	0x2b,	%asi
	stha	%g4,	[%l7 + 0x44] %asi
	membar	#Sync
	sethi	0x01F2,	%o5
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x10
	fxor	%f0,	%f2,	%f18
	array8	%g2,	%i5,	%o3
	nop
	setx	loop_2524,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%g5,	0x045D,	%l3
	edge16n	%l0,	%o2,	%g1
	taddcctv	%o4,	%l5,	%l1
loop_2524:
	fpsub16	%f22,	%f8,	%f6
	popc	%i6,	%o0
	smul	%i0,	%i1,	%g6
	alignaddrl	%o6,	%i7,	%i2
	orn	%o7,	0x19BE,	%l6
	brgez,a	%l2,	loop_2525
	bg,a	%xcc,	loop_2526
	fbug	%fcc3,	loop_2527
	bpos,a,pn	%icc,	loop_2528
loop_2525:
	subccc	%i4,	%i3,	%l4
loop_2526:
	brlez,a	%o1,	loop_2529
loop_2527:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2528:
	movrgez	%g7,	0x02B,	%g4
	fcmple16	%f12,	%f2,	%o5
loop_2529:
	orn	%g3,	%i5,	%g2
	edge8n	%g5,	%l3,	%l0
	tpos	%xcc,	0x0
	taddcc	%o3,	0x0F45,	%o2
	fmul8x16	%f13,	%f18,	%f12
	std	%f6,	[%l7 + 0x68]
	edge8	%o4,	%g1,	%l1
	movpos	%xcc,	%i6,	%l5
	sdivcc	%o0,	0x0759,	%i1
	smulcc	%g6,	0x0832,	%i0
	edge8n	%o6,	%i7,	%i2
	movleu	%icc,	%l6,	%o7
	addc	%i4,	%i3,	%l4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%o1
	sdivx	%g7,	0x0FCA,	%g4
	subccc	%o5,	0x158B,	%l2
	brlz	%i5,	loop_2530
	udivx	%g3,	0x11F3,	%g5
	bl,pn	%xcc,	loop_2531
	edge8n	%l3,	%l0,	%o3
loop_2530:
	fpsub32s	%f0,	%f15,	%f1
	edge32n	%g2,	%o4,	%o2
loop_2531:
	edge32ln	%g1,	%i6,	%l1
	movcs	%icc,	%l5,	%o0
	edge8n	%i1,	%g6,	%o6
	movpos	%xcc,	%i7,	%i2
	sdivcc	%i0,	0x0FAD,	%l6
	sllx	%o7,	0x11,	%i3
	tgu	%xcc,	0x3
	fmovrslez	%l4,	%f19,	%f14
	movrlez	%i4,	%o1,	%g4
	set	0x40, %l5
	stwa	%o5,	[%l7 + %l5] 0x18
	movre	%l2,	0x3AD,	%i5
	fmovrsne	%g7,	%f4,	%f2
	array16	%g3,	%l3,	%g5
	fmovrslz	%o3,	%f13,	%f13
	fmovsgu	%icc,	%f11,	%f11
	tg	%icc,	0x1
	fbe	%fcc3,	loop_2532
	fmovsn	%xcc,	%f29,	%f3
	sra	%l0,	%o4,	%o2
	sll	%g1,	0x1A,	%i6
loop_2532:
	brlz,a	%l1,	loop_2533
	tneg	%xcc,	0x5
	fpadd32	%f12,	%f20,	%f4
	udivx	%g2,	0x0CF8,	%l5
loop_2533:
	fmovdcc	%icc,	%f13,	%f10
	sra	%i1,	0x0F,	%o0
	fmovrdlz	%o6,	%f18,	%f2
	brgz	%i7,	loop_2534
	fcmpne16	%f8,	%f20,	%i2
	set	0x7A, %o0
	stba	%i0,	[%l7 + %o0] 0x11
loop_2534:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g6,	0x16C6,	%o7
	tleu	%icc,	0x0
	fmovsvc	%xcc,	%f8,	%f20
	sir	0x1C44
	array8	%l6,	%i3,	%l4
	and	%i4,	%g4,	%o5
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tleu	%icc,	0x0
	ba	%icc,	loop_2535
	fmovdg	%xcc,	%f21,	%f6
	bneg	%xcc,	loop_2536
	tgu	%xcc,	0x3
loop_2535:
	bneg,pt	%icc,	loop_2537
	umulcc	%o1,	0x056D,	%i5
loop_2536:
	sdivcc	%l2,	0x07E0,	%g7
	edge32l	%g3,	%g5,	%l3
loop_2537:
	fbg	%fcc0,	loop_2538
	srax	%o3,	0x11,	%l0
	ldd	[%l7 + 0x48],	%o2
	fnand	%f30,	%f20,	%f16
loop_2538:
	mova	%xcc,	%g1,	%o4
	udiv	%l1,	0x1215,	%g2
	array8	%l5,	%i1,	%o0
	orn	%i6,	%i7,	%i2
	array16	%i0,	%g6,	%o6
	edge8	%o7,	%i3,	%l4
	fbne	%fcc3,	loop_2539
	addc	%l6,	%i4,	%g4
	edge32n	%o5,	%i5,	%l2
	fxors	%f14,	%f17,	%f4
loop_2539:
	sra	%g7,	0x02,	%o1
	nop
	setx	loop_2540,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%g5,	0x00F6,	%g3
	fbn	%fcc2,	loop_2541
	movrlez	%l3,	%o3,	%l0
loop_2540:
	fpsub32s	%f13,	%f20,	%f29
	orn	%g1,	0x1C88,	%o4
loop_2541:
	stb	%l1,	[%l7 + 0x79]
	fandnot1s	%f17,	%f30,	%f4
	popc	0x00E4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l5,	%o2,	%o0
	edge8ln	%i6,	%i7,	%i1
	tgu	%xcc,	0x5
	orn	%i2,	0x1337,	%i0
	set	0x48, %l6
	stwa	%g6,	[%l7 + %l6] 0xea
	membar	#Sync
	fmovrslz	%o7,	%f28,	%f11
	movn	%icc,	%o6,	%i3
	fbu	%fcc0,	loop_2542
	movvs	%icc,	%l6,	%i4
	fpack16	%f10,	%f19
	edge32n	%g4,	%o5,	%i5
loop_2542:
	movrne	%l4,	%g7,	%o1
	fands	%f4,	%f27,	%f22
	fpadd32s	%f13,	%f27,	%f17
	sir	0x1A2F
	sir	0x11C6
	fmul8ulx16	%f16,	%f26,	%f0
	mulscc	%g5,	0x04B3,	%g3
	brgez,a	%l2,	loop_2543
	fpadd32	%f2,	%f14,	%f26
	tcs	%icc,	0x4
	fbuge,a	%fcc3,	loop_2544
loop_2543:
	fmovdg	%icc,	%f11,	%f14
	nop
	setx	loop_2545,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez	%o3,	loop_2546
loop_2544:
	tgu	%xcc,	0x3
	orcc	%l0,	%l3,	%o4
loop_2545:
	sll	%g1,	0x11,	%l1
loop_2546:
	st	%f27,	[%l7 + 0x40]
	subc	%l5,	%o2,	%g2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x54] %asi,	%i6
	alignaddrl	%o0,	%i7,	%i1
	orncc	%i2,	0x16A3,	%i0
	movg	%icc,	%g6,	%o7
	udivx	%i3,	0x05FB,	%l6
	faligndata	%f2,	%f6,	%f20
	fnot1	%f30,	%f30
	movl	%icc,	%o6,	%g4
	xor	%o5,	0x1D78,	%i4
	set	0x4E, %i5
	lduba	[%l7 + %i5] 0x14,	%l4
	fcmpne32	%f8,	%f20,	%i5
	bpos,a	%icc,	loop_2547
	tsubcctv	%g7,	%o1,	%g5
	or	%g3,	0x074C,	%l2
	fexpand	%f30,	%f0
loop_2547:
	fornot1	%f2,	%f28,	%f24
	set	0x54, %g1
	ldstuba	[%l7 + %g1] 0x11,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%l3,	loop_2548
	movvs	%xcc,	%o4,	%g1
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x15,	%f0
loop_2548:
	movne	%icc,	%o3,	%l1
	ldstub	[%l7 + 0x2E],	%o2
	fcmpgt32	%f4,	%f18,	%l5
	edge32n	%i6,	%o0,	%i7
	movg	%xcc,	%g2,	%i2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	addcc	%i0,	0x1B2A,	%o7
	edge8l	%g6,	%i3,	%l6
	edge8ln	%g4,	%o5,	%o6
	tvc	%icc,	0x5
	subc	%l4,	%i5,	%g7
	sethi	0x1C5B,	%o1
	taddcc	%g5,	0x11F2,	%i4
	bneg,a	%xcc,	loop_2549
	fone	%f30
	sdivx	%l2,	0x1377,	%g3
	xnor	%l0,	0x1F6F,	%o4
loop_2549:
	smul	%g1,	0x1658,	%l3
	stw	%o3,	[%l7 + 0x7C]
	ld	[%l7 + 0x50],	%f2
	movcc	%xcc,	%l1,	%l5
	movg	%xcc,	%i6,	%o0
	bg,a	loop_2550
	lduw	[%l7 + 0x58],	%o2
	fandnot2	%f24,	%f16,	%f14
	orncc	%i7,	%g2,	%i1
loop_2550:
	addcc	%i0,	%i2,	%o7
	andcc	%i3,	%g6,	%l6
	fnegs	%f15,	%f7
	fpsub16	%f4,	%f0,	%f6
	for	%f20,	%f28,	%f30
	tcc	%icc,	0x2
	subc	%g4,	0x04D5,	%o6
	bge,a,pt	%xcc,	loop_2551
	tsubcctv	%l4,	%o5,	%g7
	fmovdg	%icc,	%f23,	%f18
	fpsub16s	%f8,	%f26,	%f1
loop_2551:
	andcc	%i5,	0x15BA,	%g5
	edge8n	%i4,	%l2,	%g3
	fcmpgt16	%f18,	%f14,	%o1
	fpadd32s	%f25,	%f18,	%f25
	addcc	%l0,	%o4,	%l3
	fbo,a	%fcc0,	loop_2552
	sllx	%g1,	0x19,	%l1
	sdivcc	%o3,	0x0C98,	%l5
	movcs	%icc,	%i6,	%o2
loop_2552:
	tsubcc	%o0,	0x0AC9,	%i7
	set	0x52, %l2
	lduha	[%l7 + %l2] 0x18,	%g2
	set	0x64, %g2
	lduwa	[%l7 + %g2] 0x80,	%i0
	srax	%i1,	%i2,	%o7
	nop
	set	0x6F, %l3
	ldsb	[%l7 + %l3],	%i3
	taddcc	%g6,	%g4,	%l6
	smul	%o6,	%l4,	%g7
	movvs	%xcc,	%o5,	%g5
	movge	%icc,	%i4,	%i5
	fbn,a	%fcc3,	loop_2553
	orcc	%l2,	0x01CB,	%o1
	sethi	0x1FD4,	%g3
	sll	%l0,	0x12,	%o4
loop_2553:
	fexpand	%f27,	%f14
	xorcc	%g1,	%l3,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x2f,	%l0
	movvc	%icc,	%l5,	%i6
	fmovdle	%xcc,	%f15,	%f28
	edge8	%o2,	%o0,	%g2
	nop
	setx loop_2554, %l0, %l1
	jmpl %l1, %i7
	edge8ln	%i1,	%i2,	%o7
	fand	%f14,	%f18,	%f10
	mulx	%i3,	0x18B8,	%g6
loop_2554:
	movvs	%icc,	%i0,	%g4
	movrgz	%l6,	%l4,	%o6
	te	%xcc,	0x1
	tg	%xcc,	0x0
	movvc	%xcc,	%o5,	%g7
	edge32n	%g5,	%i4,	%i5
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
	ta	%xcc,	0x7
	movvs	%icc,	%o1,	%g3
	array32	%l2,	%l0,	%o4
loop_2555:
	subc	%g1,	0x1E35,	%l3
	udivx	%o3,	0x00CA,	%l1
	fpmerge	%f23,	%f12,	%f28
	movn	%xcc,	%i6,	%l5
	smulcc	%o0,	%o2,	%i7
	fbl,a	%fcc3,	loop_2556
	fexpand	%f20,	%f24
	bge	%xcc,	loop_2557
	fcmpgt16	%f6,	%f20,	%i1
loop_2556:
	move	%icc,	%g2,	%o7
	orn	%i3,	%g6,	%i2
loop_2557:
	tvc	%icc,	0x4
	be	loop_2558
	tleu	%xcc,	0x3
	move	%icc,	%g4,	%i0
	fble	%fcc2,	loop_2559
loop_2558:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f2,	%f24,	%l6
	orcc	%l4,	%o6,	%g7
loop_2559:
	edge16n	%g5,	%i4,	%o5
	te	%icc,	0x4
	fmovdge	%xcc,	%f16,	%f29
	fpsub32	%f6,	%f10,	%f22
	fmovsgu	%xcc,	%f29,	%f26
	movvs	%icc,	%i5,	%g3
	fmul8ulx16	%f6,	%f2,	%f24
	bleu	loop_2560
	andncc	%o1,	%l2,	%l0
	nop
	setx	loop_2561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%g1,	%l3
loop_2560:
	sir	0x0690
	tl	%icc,	0x7
loop_2561:
	brlez	%o4,	loop_2562
	umulcc	%l1,	0x177F,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i6,	%l5,	%o2
loop_2562:
	tne	%xcc,	0x4
	fbu,a	%fcc2,	loop_2563
	fmovdcs	%xcc,	%f22,	%f21
	tn	%icc,	0x5
	udiv	%o0,	0x09AE,	%i7
loop_2563:
	or	%g2,	0x0621,	%o7
	tg	%xcc,	0x5
	fmovrde	%i3,	%f6,	%f26
	fexpand	%f24,	%f6
	udiv	%g6,	0x0487,	%i2
	srlx	%g4,	0x18,	%i1
	taddcctv	%l6,	%i0,	%l4
	fnors	%f19,	%f23,	%f3
	fnot1s	%f25,	%f13
	tvs	%icc,	0x0
	fpack32	%f0,	%f8,	%f22
	pdist	%f4,	%f0,	%f18
	brz,a	%o6,	loop_2564
	edge32	%g7,	%i4,	%g5
	fbn,a	%fcc3,	loop_2565
	fmovrsgez	%o5,	%f8,	%f16
loop_2564:
	movrgez	%g3,	%i5,	%o1
	sra	%l0,	%l2,	%g1
loop_2565:
	fblg	%fcc3,	loop_2566
	ldsh	[%l7 + 0x14],	%l3
	lduw	[%l7 + 0x74],	%o4
	movvc	%icc,	%l1,	%i6
loop_2566:
	fmovdne	%xcc,	%f8,	%f31
	fmovdvs	%xcc,	%f2,	%f5
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x18,	 0x0
	te	%xcc,	0x5
	fpmerge	%f14,	%f29,	%f2
	tg	%icc,	0x4
	udivcc	%o2,	0x0039,	%o0
	orcc	%o3,	0x0ED5,	%g2
	fbule	%fcc0,	loop_2567
	sra	%i7,	%o7,	%g6
	stx	%i2,	[%l7 + 0x30]
	orn	%i3,	0x1197,	%g4
loop_2567:
	tsubcc	%i1,	0x07F9,	%l6
	stb	%l4,	[%l7 + 0x70]
	move	%icc,	%o6,	%g7
	fmovsleu	%icc,	%f16,	%f3
	sir	0x117D
	edge16	%i4,	%g5,	%o5
	fmovdvc	%xcc,	%f24,	%f2
	fsrc1	%f26,	%f18
	bgu	loop_2568
	subc	%g3,	%i0,	%i5
	prefetch	[%l7 + 0x5C],	 0x3
	edge16l	%o1,	%l2,	%g1
loop_2568:
	sll	%l0,	%o4,	%l3
	edge8	%i6,	%l5,	%l1
	fbg,a	%fcc3,	loop_2569
	fmovdvs	%icc,	%f10,	%f28
	tg	%xcc,	0x2
	ldstub	[%l7 + 0x2A],	%o2
loop_2569:
	fbne,a	%fcc0,	loop_2570
	fbo	%fcc3,	loop_2571
	movg	%xcc,	%o3,	%o0
	fcmpeq16	%f22,	%f12,	%i7
loop_2570:
	sdiv	%o7,	0x1D17,	%g6
loop_2571:
	fmovrsne	%g2,	%f0,	%f31
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	taddcc	%i2,	%g4,	%i3
	or	%i1,	%l6,	%l4
	tleu	%xcc,	0x2
	fnot1s	%f2,	%f28
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%g7
	bneg,a	loop_2572
	movcc	%xcc,	%i4,	%o6
	movvc	%xcc,	%o5,	%g5
	movl	%xcc,	%g3,	%i0
loop_2572:
	membar	0x10
	tneg	%xcc,	0x2
	fmovspos	%icc,	%f1,	%f6
	srax	%i5,	0x12,	%l2
	edge8l	%g1,	%o1,	%o4
	andncc	%l0,	%i6,	%l3
	tl	%icc,	0x5
	tvs	%icc,	0x4
	andncc	%l5,	%l1,	%o2
	sdiv	%o3,	0x0450,	%i7
	movcs	%icc,	%o7,	%g6
	fcmple32	%f4,	%f2,	%o0
	movrlz	%g2,	0x38E,	%g4
	fnot1s	%f9,	%f0
	tpos	%xcc,	0x6
	movleu	%xcc,	%i2,	%i1
	srax	%i3,	%l4,	%g7
	xorcc	%l6,	%i4,	%o6
	bgu	loop_2573
	stw	%g5,	[%l7 + 0x78]
	bg,pn	%xcc,	loop_2574
	tleu	%icc,	0x0
loop_2573:
	sth	%o5,	[%l7 + 0x44]
	subcc	%i0,	%i5,	%l2
loop_2574:
	tsubcctv	%g1,	0x0939,	%o1
	edge16ln	%o4,	%l0,	%i6
	std	%l2,	[%l7 + 0x50]
	mulscc	%g3,	%l5,	%o2
	sub	%l1,	0x0701,	%i7
	smul	%o7,	0x085B,	%o3
	tsubcc	%g6,	0x1897,	%g2
	edge32ln	%o0,	%g4,	%i2
	fxors	%f10,	%f14,	%f13
	ldsw	[%l7 + 0x38],	%i1
	tcc	%icc,	0x7
	andncc	%i3,	%g7,	%l6
	tgu	%xcc,	0x2
	fmovdleu	%icc,	%f20,	%f29
	movne	%xcc,	%i4,	%o6
	movrlz	%l4,	0x0B5,	%g5
	set	0x120, %g4
	ldxa	[%g0 + %g4] 0x52,	%o5
	edge8ln	%i5,	%l2,	%i0
	te	%xcc,	0x7
	edge8l	%o1,	%g1,	%o4
	ldstub	[%l7 + 0x6B],	%l0
	set	0x20, %o7
	stda	%l2,	[%l7 + %o7] 0x10
	flush	%l7 + 0x38
	movge	%xcc,	%g3,	%i6
	array16	%l5,	%o2,	%l1
	fmovdcc	%icc,	%f29,	%f17
	addcc	%o7,	0x06BE,	%i7
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0x0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x55] %asi,	%g2
	taddcc	%o3,	%g4,	%i2
	fbu,a	%fcc2,	loop_2575
	xnor	%o0,	0x1FDF,	%i3
	mulscc	%g7,	0x1747,	%i1
	popc	%i4,	%l6
loop_2575:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o6,	%g5,	%l4
	fmuld8ulx16	%f29,	%f9,	%f18
	fone	%f8
	movg	%xcc,	%i5,	%l2
	lduh	[%l7 + 0x0C],	%o5
	fmovse	%icc,	%f4,	%f2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x10] %asi,	%o1
	alignaddr	%i0,	%o4,	%g1
	tn	%icc,	0x3
	fmovrslz	%l0,	%f29,	%f8
	sdiv	%l3,	0x1310,	%i6
	fmovrslz	%g3,	%f29,	%f2
	bcc	loop_2576
	fmovd	%f6,	%f0
	fornot1s	%f31,	%f16,	%f0
	add	%l5,	%o2,	%o7
loop_2576:
	mova	%icc,	%l1,	%i7
	fnands	%f11,	%f27,	%f12
	tneg	%icc,	0x6
	movpos	%xcc,	%g2,	%o3
	fmovdg	%xcc,	%f25,	%f19
	movvs	%xcc,	%g4,	%g6
	mova	%xcc,	%i2,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f9,	%f17
	movvc	%xcc,	%i3,	%g7
	prefetch	[%l7 + 0x4C],	 0x1
	array16	%i1,	%l6,	%i4
	subc	%o6,	0x1341,	%g5
	fnors	%f14,	%f0,	%f11
	bpos,pt	%icc,	loop_2577
	fmovdcs	%icc,	%f16,	%f15
	fsrc2	%f30,	%f18
	orcc	%i5,	0x08CB,	%l2
loop_2577:
	array32	%l4,	%o1,	%o5
	movne	%icc,	%i0,	%g1
	tvc	%xcc,	0x4
	edge8l	%l0,	%l3,	%o4
	smulcc	%i6,	0x1E3E,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f19,	%f17
	brz	%o2,	loop_2578
	call	loop_2579
	fmovrslz	%o7,	%f19,	%f1
	edge32l	%g3,	%i7,	%g2
loop_2578:
	add	%o3,	0x12DB,	%g4
loop_2579:
	fmovsle	%xcc,	%f21,	%f18
	movcs	%icc,	%g6,	%l1
	tl	%xcc,	0x1
	fsrc1s	%f17,	%f8
	edge32n	%i2,	%i3,	%o0
	sllx	%i1,	%l6,	%g7
	fpadd16	%f20,	%f22,	%f12
	udiv	%o6,	0x16A7,	%g5
	bl,pt	%xcc,	loop_2580
	subccc	%i5,	%i4,	%l2
	flush	%l7 + 0x28
	bl,a,pn	%icc,	loop_2581
loop_2580:
	movl	%icc,	%l4,	%o1
	srl	%o5,	0x16,	%i0
	movrgz	%l0,	0x196,	%g1
loop_2581:
	movn	%xcc,	%l3,	%i6
	mulscc	%o4,	%o2,	%o7
	srax	%l5,	0x1E,	%g3
	edge32ln	%g2,	%o3,	%g4
	subccc	%g6,	%l1,	%i7
	fmovrdlz	%i3,	%f30,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i2,	0x07F0,	%o0
	umulcc	%l6,	%g7,	%i1
	movle	%xcc,	%g5,	%i5
	ldd	[%l7 + 0x10],	%f16
	fmovdgu	%icc,	%f10,	%f4
	movgu	%xcc,	%i4,	%l2
	movvs	%icc,	%o6,	%l4
	xor	%o5,	%o1,	%l0
	andcc	%g1,	0x08F1,	%l3
	fbule	%fcc3,	loop_2582
	edge32l	%i6,	%i0,	%o2
	move	%xcc,	%o4,	%o7
	movrne	%g3,	%l5,	%g2
loop_2582:
	movrlz	%o3,	0x019,	%g6
	fandnot2s	%f8,	%f27,	%f18
	sll	%g4,	0x16,	%i7
	fblg,a	%fcc3,	loop_2583
	xnorcc	%i3,	0x162D,	%i2
	tg	%icc,	0x6
	fmovs	%f23,	%f5
loop_2583:
	sra	%l1,	0x1D,	%o0
	mulx	%l6,	%g7,	%g5
	movrlez	%i1,	0x02A,	%i4
	fmul8sux16	%f6,	%f30,	%f0
	fbug	%fcc1,	loop_2584
	subcc	%i5,	%o6,	%l4
	edge16ln	%o5,	%o1,	%l0
	tvs	%xcc,	0x0
loop_2584:
	fnot2s	%f22,	%f6
	fmovrslz	%g1,	%f26,	%f4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x70] %asi,	%l2
	ldd	[%l7 + 0x68],	%f28
	umul	%l3,	0x1906,	%i0
	membar	0x1E
	tcs	%xcc,	0x2
	tpos	%icc,	0x2
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x15
	sub	%o2,	0x137F,	%o4
	xnorcc	%o7,	%g3,	%l5
	movrgz	%i6,	0x035,	%g2
	mulscc	%o3,	%g6,	%i7
	bgu,a	loop_2585
	add	%i3,	%g4,	%i2
	fblg,a	%fcc3,	loop_2586
	andncc	%l1,	%l6,	%o0
loop_2585:
	tpos	%xcc,	0x3
	movneg	%icc,	%g7,	%g5
loop_2586:
	xnorcc	%i4,	%i5,	%o6
	movvs	%icc,	%l4,	%o5
	tcc	%icc,	0x4
	array8	%o1,	%l0,	%i1
	srlx	%g1,	%l2,	%i0
	array32	%l3,	%o2,	%o4
	movge	%icc,	%o7,	%g3
	taddcc	%i6,	%l5,	%o3
	fcmps	%fcc3,	%f14,	%f28
	sub	%g2,	%i7,	%i3
	fzeros	%f3
	bl,a,pt	%xcc,	loop_2587
	andn	%g6,	0x18AC,	%g4
	fmul8x16au	%f23,	%f26,	%f30
	movrlez	%i2,	%l1,	%l6
loop_2587:
	array8	%g7,	%o0,	%g5
	movvc	%icc,	%i4,	%i5
	edge8ln	%o6,	%o5,	%l4
	sub	%l0,	%i1,	%o1
	ldsw	[%l7 + 0x38],	%g1
	orn	%l2,	0x0911,	%l3
	fnot2	%f10,	%f12
	fbl	%fcc3,	loop_2588
	fxors	%f25,	%f5,	%f28
	edge8n	%i0,	%o2,	%o4
	andcc	%g3,	%o7,	%l5
loop_2588:
	fnot1s	%f20,	%f17
	brnz,a	%o3,	loop_2589
	taddcctv	%i6,	0x0971,	%g2
	movvs	%xcc,	%i7,	%i3
	ldd	[%l7 + 0x48],	%f2
loop_2589:
	and	%g4,	0x0FC9,	%i2
	set	0x2B, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g6
	bleu	%icc,	loop_2590
	fpmerge	%f7,	%f3,	%f26
	edge8ln	%l6,	%g7,	%l1
	orcc	%g5,	0x094C,	%i4
loop_2590:
	edge8	%i5,	%o6,	%o5
	fcmpes	%fcc2,	%f19,	%f17
	movrgez	%l4,	0x29B,	%l0
	fmovsvc	%xcc,	%f13,	%f7
	fpack16	%f28,	%f24
	tne	%icc,	0x7
	fpsub16s	%f21,	%f27,	%f31
	movleu	%icc,	%i1,	%o0
	tleu	%xcc,	0x0
	sdiv	%g1,	0x1580,	%o1
	movneg	%icc,	%l3,	%i0
	addcc	%l2,	%o2,	%o4
	sir	0x15ED
	wr	%g0,	0x10,	%asi
	stwa	%g3,	[%l7 + 0x4C] %asi
	fmul8sux16	%f16,	%f2,	%f6
	andn	%l5,	%o3,	%i6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	tneg	%icc,	0x2
	sllx	%o7,	0x01,	%i7
	fmovde	%xcc,	%f29,	%f30
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i3
	andncc	%g4,	%i2,	%l6
	fmovsvs	%icc,	%f31,	%f10
	ble,pn	%xcc,	loop_2591
	fcmpeq16	%f30,	%f4,	%g7
	movpos	%icc,	%g6,	%l1
	nop
	setx loop_2592, %l0, %l1
	jmpl %l1, %g5
loop_2591:
	stx	%i4,	[%l7 + 0x18]
	fmovsle	%xcc,	%f27,	%f11
	brz,a	%o6,	loop_2593
loop_2592:
	fbuge,a	%fcc2,	loop_2594
	fmovsa	%icc,	%f16,	%f8
	sdivcc	%o5,	0x18AB,	%l4
loop_2593:
	movrgz	%l0,	%i5,	%i1
loop_2594:
	edge16n	%g1,	%o1,	%o0
	tvc	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	stha	%i0,	[%l7 + 0x7C] %asi
	xnorcc	%l3,	0x0A8D,	%l2
	addc	%o4,	0x12E9,	%g3
	fcmpeq32	%f30,	%f28,	%l5
	xor	%o2,	0x1D52,	%o3
	wr	%g0,	0xe2,	%asi
	stha	%g2,	[%l7 + 0x74] %asi
	membar	#Sync
	movgu	%xcc,	%i6,	%i7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f30
	umul	%i3,	%o7,	%g4
	mulscc	%l6,	%g7,	%i2
	taddcc	%l1,	%g5,	%i4
	tcs	%icc,	0x5
	fandnot1	%f20,	%f2,	%f4
	fnands	%f31,	%f15,	%f5
	alignaddrl	%g6,	%o6,	%o5
	movn	%xcc,	%l4,	%l0
	sdivx	%i1,	0x08BB,	%i5
	tvc	%xcc,	0x1
	std	%o0,	[%l7 + 0x28]
	fmovdne	%xcc,	%f19,	%f4
	umul	%o0,	0x18B4,	%g1
	edge32ln	%l3,	%l2,	%o4
	fmovrdgz	%g3,	%f10,	%f14
	movvc	%xcc,	%i0,	%l5
	popc	%o2,	%g2
	edge16n	%o3,	%i6,	%i3
	taddcc	%i7,	0x1AC5,	%g4
	movcs	%xcc,	%l6,	%g7
	movn	%xcc,	%o7,	%i2
	sdiv	%l1,	0x1C35,	%i4
	sdivcc	%g5,	0x1709,	%o6
	fbn	%fcc1,	loop_2595
	fmul8x16	%f28,	%f0,	%f16
	tleu	%icc,	0x4
	movcc	%xcc,	%o5,	%l4
loop_2595:
	movge	%xcc,	%g6,	%l0
	sth	%i1,	[%l7 + 0x78]
	for	%f26,	%f16,	%f16
	edge32	%i5,	%o0,	%o1
	stx	%g1,	[%l7 + 0x30]
	ldd	[%l7 + 0x60],	%f24
	fmovse	%xcc,	%f6,	%f28
	tpos	%icc,	0x4
	xor	%l2,	0x1A23,	%l3
	array8	%o4,	%g3,	%i0
	fmovda	%icc,	%f12,	%f30
	ld	[%l7 + 0x58],	%f14
	orn	%l5,	0x1CB9,	%o2
	fnot2s	%f22,	%f8
	fmovdneg	%xcc,	%f16,	%f29
	sdivx	%g2,	0x001B,	%i6
	ble	%xcc,	loop_2596
	stbar
	tn	%icc,	0x4
	fornot1s	%f26,	%f21,	%f10
loop_2596:
	std	%i2,	[%l7 + 0x38]
	fcmpeq32	%f10,	%f2,	%o3
	addc	%i7,	%l6,	%g7
	brgez	%o7,	loop_2597
	movrgez	%g4,	%l1,	%i2
	tl	%icc,	0x3
	movvc	%icc,	%g5,	%i4
loop_2597:
	fnor	%f28,	%f14,	%f8
	brlz	%o5,	loop_2598
	fmovdcs	%icc,	%f6,	%f11
	umulcc	%l4,	0x195B,	%g6
	edge32n	%o6,	%i1,	%i5
loop_2598:
	tge	%icc,	0x6
	fbo,a	%fcc3,	loop_2599
	sllx	%l0,	%o0,	%g1
	movrlez	%o1,	0x373,	%l2
	fmovdcs	%icc,	%f22,	%f6
loop_2599:
	movpos	%xcc,	%l3,	%g3
	addcc	%o4,	0x1788,	%l5
	nop
	setx	loop_2600,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%o2,	0x129B,	%i0
	sra	%i6,	%g2,	%i3
	edge8l	%i7,	%l6,	%g7
loop_2600:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x0C] %asi,	%o3
	popc	%g4,	%l1
	popc	0x0D99,	%o7
	bn	%xcc,	loop_2601
	movrlz	%i2,	0x18E,	%i4
	umulcc	%g5,	0x0295,	%o5
	membar	0x49
loop_2601:
	tneg	%icc,	0x7
	fmovsneg	%icc,	%f2,	%f11
	movgu	%xcc,	%l4,	%g6
	sra	%o6,	%i5,	%i1
	fxnors	%f26,	%f21,	%f2
	fornot1s	%f6,	%f23,	%f15
	fmuld8sux16	%f0,	%f26,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l0,	%g1,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f7,	%f22,	%f13
	and	%o0,	%l2,	%g3
	fcmpes	%fcc2,	%f18,	%f13
	sllx	%l3,	0x19,	%o4
	movrlez	%l5,	0x233,	%o2
	fmovrsne	%i0,	%f20,	%f29
	xor	%i6,	0x199B,	%g2
	tcs	%icc,	0x3
	smul	%i3,	0x0379,	%l6
	addccc	%i7,	0x1E61,	%o3
	xor	%g7,	%l1,	%o7
	movgu	%icc,	%g4,	%i4
	tvc	%xcc,	0x2
	fcmpeq32	%f26,	%f14,	%i2
	array16	%o5,	%g5,	%g6
	movrgez	%o6,	0x310,	%i5
	udivcc	%i1,	0x0D6D,	%l0
	lduw	[%l7 + 0x30],	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o1,	%g1,	%l2
	tge	%icc,	0x7
	bleu,a,pn	%icc,	loop_2602
	taddcctv	%o0,	0x0D8F,	%l3
	edge32ln	%g3,	%l5,	%o2
	tneg	%icc,	0x1
loop_2602:
	fsrc1s	%f3,	%f13
	srax	%o4,	0x11,	%i0
	bvs,pt	%xcc,	loop_2603
	alignaddr	%i6,	%g2,	%l6
	fmovsvs	%icc,	%f18,	%f19
	sdivx	%i7,	0x068F,	%i3
loop_2603:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o3,	%l1,	%g4
	movvc	%icc,	%i4,	%i2
	edge32n	%o5,	%g5,	%o7
	lduh	[%l7 + 0x52],	%g6
	brz,a	%o6,	loop_2604
	bcc,pn	%icc,	loop_2605
	tcs	%icc,	0x3
	udiv	%i1,	0x1064,	%i5
loop_2604:
	fmovdvc	%xcc,	%f11,	%f0
loop_2605:
	fandnot1s	%f3,	%f2,	%f12
	xnor	%l0,	%l4,	%o1
	brgz,a	%g1,	loop_2606
	tvs	%xcc,	0x4
	xnorcc	%o0,	0x0D2E,	%l2
	stw	%g3,	[%l7 + 0x7C]
loop_2606:
	subc	%l3,	%o2,	%o4
	add	%i0,	%l5,	%g2
	tsubcc	%i6,	0x0041,	%i7
	wr	%g0,	0x80,	%asi
	stwa	%l6,	[%l7 + 0x40] %asi
	fmovse	%icc,	%f21,	%f17
	addc	%i3,	%g7,	%o3
	sdivx	%g4,	0x0FD0,	%l1
	subccc	%i4,	%o5,	%i2
	fnot1	%f12,	%f2
	movne	%icc,	%g5,	%g6
	ta	%xcc,	0x1
	fcmpd	%fcc1,	%f30,	%f20
	fble	%fcc0,	loop_2607
	bg	%icc,	loop_2608
	tgu	%icc,	0x0
	movneg	%xcc,	%o6,	%i1
loop_2607:
	mulscc	%o7,	%i5,	%l0
loop_2608:
	fpsub32	%f14,	%f18,	%f2
	alignaddrl	%o1,	%l4,	%o0
	alignaddrl	%l2,	%g1,	%g3
	fmovdcs	%icc,	%f15,	%f23
	fmovsle	%icc,	%f15,	%f15
	andcc	%o2,	%o4,	%i0
	sethi	0x0F1C,	%l3
	sth	%l5,	[%l7 + 0x70]
	subccc	%g2,	%i7,	%l6
	tl	%xcc,	0x2
	fmovse	%icc,	%f9,	%f27
	fxnor	%f30,	%f0,	%f2
	subc	%i6,	0x16D2,	%g7
	edge16l	%i3,	%o3,	%l1
	stw	%i4,	[%l7 + 0x0C]
	array8	%g4,	%i2,	%g5
	brgez,a	%o5,	loop_2609
	movvs	%icc,	%o6,	%i1
	te	%xcc,	0x2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x31] %asi,	%g6
loop_2609:
	fcmpne32	%f12,	%f2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i5,	%o1,	%l0
	movre	%o0,	0x08F,	%l2
	sdiv	%g1,	0x1CC4,	%l4
	sllx	%g3,	0x12,	%o2
	fmovdne	%xcc,	%f0,	%f18
	tn	%xcc,	0x4
	andncc	%o4,	%l3,	%l5
	prefetch	[%l7 + 0x48],	 0x3
	fornot1s	%f11,	%f19,	%f2
	ldub	[%l7 + 0x3B],	%g2
	fmovsle	%xcc,	%f26,	%f31
	fbge,a	%fcc1,	loop_2610
	fabsd	%f0,	%f18
	fmul8x16	%f1,	%f8,	%f22
	fmovrdlz	%i0,	%f16,	%f14
loop_2610:
	andcc	%l6,	0x1208,	%i7
	umul	%i6,	%g7,	%i3
	movneg	%icc,	%o3,	%i4
	set	0x28, %i6
	swapa	[%l7 + %i6] 0x19,	%l1
	sllx	%i2,	0x12,	%g4
	subccc	%g5,	%o6,	%i1
	orcc	%o5,	%o7,	%i5
	set	0x3A, %o4
	lduba	[%l7 + %o4] 0x18,	%o1
	movg	%xcc,	%l0,	%o0
	ldstub	[%l7 + 0x13],	%g6
	fbg,a	%fcc0,	loop_2611
	fnors	%f1,	%f24,	%f21
	sub	%l2,	%g1,	%g3
	tsubcctv	%o2,	%o4,	%l3
loop_2611:
	bn,a,pt	%xcc,	loop_2612
	addcc	%l5,	%l4,	%g2
	array8	%l6,	%i7,	%i0
	st	%f2,	[%l7 + 0x60]
loop_2612:
	orcc	%g7,	%i6,	%i3
	xor	%o3,	%i4,	%l1
	nop
	set	0x1E, %i7
	sth	%g4,	[%l7 + %i7]
	fbl	%fcc0,	loop_2613
	tle	%xcc,	0x5
	tne	%xcc,	0x4
	fxnor	%f4,	%f20,	%f6
loop_2613:
	movleu	%xcc,	%g5,	%i2
	movpos	%xcc,	%i1,	%o5
	sll	%o6,	%i5,	%o1
	fmovrslz	%o7,	%f2,	%f0
	xnorcc	%l0,	0x08B8,	%o0
	fpadd32	%f18,	%f18,	%f18
	st	%f13,	[%l7 + 0x74]
	xnor	%l2,	%g6,	%g1
	array32	%o2,	%g3,	%l3
	fnor	%f24,	%f26,	%f28
	edge16ln	%l5,	%o4,	%g2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x61] %asi,	%l4
	addccc	%i7,	%l6,	%g7
	taddcc	%i6,	%i0,	%o3
	fblg,a	%fcc0,	loop_2614
	fzeros	%f30
	bn	%xcc,	loop_2615
	fcmpne32	%f30,	%f14,	%i4
loop_2614:
	ldub	[%l7 + 0x74],	%l1
	fsrc2s	%f7,	%f23
loop_2615:
	fbg	%fcc2,	loop_2616
	array16	%g4,	%g5,	%i2
	for	%f18,	%f8,	%f26
	xorcc	%i3,	%o5,	%o6
loop_2616:
	fmovdvc	%icc,	%f19,	%f28
	fmovscs	%icc,	%f19,	%f28
	ba,a	%xcc,	loop_2617
	sdivcc	%i1,	0x13B0,	%o1
	tg	%xcc,	0x0
	bl	loop_2618
loop_2617:
	subcc	%o7,	0x17ED,	%l0
	xor	%i5,	%l2,	%g6
	edge16l	%g1,	%o2,	%o0
loop_2618:
	tl	%xcc,	0x5
	st	%f27,	[%l7 + 0x48]
	movpos	%xcc,	%g3,	%l3
	stw	%l5,	[%l7 + 0x1C]
	bpos,a,pt	%xcc,	loop_2619
	xnor	%g2,	%l4,	%o4
	bcs,a,pn	%xcc,	loop_2620
	tneg	%icc,	0x3
loop_2619:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,pt	%icc,	loop_2621
loop_2620:
	tleu	%xcc,	0x0
	set	0x40, %o2
	lduwa	[%l7 + %o2] 0x89,	%l6
loop_2621:
	tne	%xcc,	0x5
	stb	%g7,	[%l7 + 0x4C]
	movle	%xcc,	%i7,	%i0
	xnorcc	%o3,	%i4,	%l1
	umul	%i6,	0x1BA8,	%g5
	fones	%f18
	fblg	%fcc3,	loop_2622
	ble,a	%icc,	loop_2623
	bge,a,pt	%xcc,	loop_2624
	fbn,a	%fcc0,	loop_2625
loop_2622:
	udivx	%g4,	0x02C8,	%i3
loop_2623:
	movcs	%icc,	%o5,	%i2
loop_2624:
	fcmpes	%fcc0,	%f1,	%f0
loop_2625:
	fsrc1s	%f26,	%f19
	bn,a	loop_2626
	edge8	%o6,	%i1,	%o1
	fmovrdlez	%l0,	%f18,	%f2
	wr	%g0,	0xe2,	%asi
	stda	%o6,	[%l7 + 0x60] %asi
	membar	#Sync
loop_2626:
	fnot2	%f2,	%f4
	smul	%i5,	%g6,	%g1
	fnor	%f2,	%f12,	%f4
	set	0x78, %o1
	ldxa	[%l7 + %o1] 0x11,	%o2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x36] %asi,	%l2
	array16	%o0,	%g3,	%l5
	alignaddrl	%g2,	%l3,	%l4
	lduh	[%l7 + 0x10],	%l6
	orn	%o4,	%g7,	%i0
	orcc	%i7,	%o3,	%l1
	edge8n	%i4,	%g5,	%g4
	xnorcc	%i3,	0x023F,	%i6
	movrlz	%o5,	0x106,	%o6
	umul	%i1,	%i2,	%o1
	fmovsle	%icc,	%f20,	%f5
	fmovde	%xcc,	%f11,	%f9
	sir	0x1EB7
	orn	%l0,	%o7,	%i5
	addccc	%g6,	%o2,	%g1
	edge32	%o0,	%l2,	%l5
	fmovsvs	%icc,	%f28,	%f5
	fornot2	%f2,	%f16,	%f0
	fandnot2s	%f15,	%f10,	%f2
	movl	%xcc,	%g2,	%l3
	array16	%g3,	%l6,	%l4
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x60, %i1
	lduw	[%l7 + %i1],	%g7
	udivcc	%o4,	0x0AF1,	%i0
	srlx	%o3,	0x0D,	%l1
	edge32l	%i4,	%i7,	%g5
	faligndata	%f18,	%f8,	%f14
	xor	%i3,	0x09D5,	%g4
	tsubcctv	%i6,	%o6,	%o5
	edge32ln	%i2,	%i1,	%l0
	fsrc2	%f20,	%f22
	set	0x28, %l4
	lda	[%l7 + %l4] 0x04,	%f31
	umul	%o7,	%o1,	%i5
	array16	%o2,	%g6,	%g1
	set	0x40, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o0
	movrlz	%l5,	0x0D6,	%g2
	tvc	%icc,	0x5
	ldsb	[%l7 + 0x43],	%l3
	fbuge,a	%fcc2,	loop_2627
	fmovdg	%icc,	%f12,	%f17
	movn	%xcc,	%l2,	%l6
	fble,a	%fcc1,	loop_2628
loop_2627:
	edge16n	%g3,	%l4,	%g7
	set	0x2C, %i4
	sta	%f2,	[%l7 + %i4] 0x19
loop_2628:
	sethi	0x00BE,	%i0
	movrlz	%o3,	%l1,	%o4
	addcc	%i7,	0x0519,	%g5
	edge32l	%i4,	%i3,	%i6
	alignaddrl	%o6,	%o5,	%i2
	movcc	%xcc,	%i1,	%g4
	array32	%l0,	%o7,	%i5
	edge16l	%o1,	%o2,	%g1
	fbug	%fcc1,	loop_2629
	brnz	%g6,	loop_2630
	tvs	%icc,	0x3
	fbne,a	%fcc3,	loop_2631
loop_2629:
	std	%l4,	[%l7 + 0x38]
loop_2630:
	nop
	set	0x68, %o5
	lda	[%l7 + %o5] 0x19,	%f3
loop_2631:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bpos,pt	%icc,	loop_2632
	fpmerge	%f29,	%f2,	%f6
	movrlz	%g2,	%l3,	%l2
	tn	%xcc,	0x0
loop_2632:
	taddcctv	%o0,	%g3,	%l4
	addc	%l6,	%g7,	%o3
	tg	%icc,	0x4
	stbar
	ldsb	[%l7 + 0x60],	%l1
	fpsub32	%f16,	%f4,	%f0
	flush	%l7 + 0x58
	brnz	%o4,	loop_2633
	nop
	setx loop_2634, %l0, %l1
	jmpl %l1, %i7
	fpsub32s	%f20,	%f31,	%f9
	fcmpeq32	%f28,	%f6,	%i0
loop_2633:
	fnor	%f2,	%f2,	%f0
loop_2634:
	tl	%icc,	0x5
	sdivcc	%g5,	0x1072,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i6,	%o6
	tcs	%xcc,	0x6
	tne	%icc,	0x2
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0x0
	mulscc	%i4,	%i1,	%g4
	move	%xcc,	%l0,	%o7
	sra	%i5,	%o1,	%i2
	fabsd	%f26,	%f6
	addc	%g1,	0x1F04,	%g6
	fones	%f2
	movg	%xcc,	%o2,	%g2
	wr	%g0,	0x81,	%asi
	stxa	%l3,	[%l7 + 0x28] %asi
	array16	%l5,	%o0,	%g3
	fpsub16s	%f6,	%f5,	%f5
	brgz	%l4,	loop_2635
	orn	%l2,	0x1FF0,	%l6
	movne	%xcc,	%o3,	%g7
	set	0x74, %g7
	ldsha	[%l7 + %g7] 0x19,	%l1
loop_2635:
	popc	0x1CBF,	%o4
	fmovsvc	%icc,	%f16,	%f11
	wr	%g0,	0x2b,	%asi
	stda	%i6,	[%l7 + 0x78] %asi
	membar	#Sync
	fmovd	%f20,	%f16
	stbar
	bpos,a	loop_2636
	movcc	%xcc,	%g5,	%i0
	tg	%xcc,	0x3
	sub	%i6,	0x05F8,	%o6
loop_2636:
	lduh	[%l7 + 0x38],	%o5
	bcs,a	loop_2637
	taddcc	%i3,	0x037D,	%i4
	fcmpeq16	%f28,	%f2,	%g4
	taddcctv	%i1,	0x1CBA,	%o7
loop_2637:
	subcc	%l0,	0x0EB0,	%i5
	fpadd16s	%f18,	%f12,	%f15
	fmovd	%f30,	%f28
	fzeros	%f22
	fcmps	%fcc1,	%f20,	%f21
	fpadd32s	%f7,	%f29,	%f8
	orn	%i2,	0x0D1D,	%g1
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x22,	%g6
	ldx	[%l7 + 0x70],	%o2
	movvs	%icc,	%g2,	%o1
	fmovsgu	%xcc,	%f8,	%f11
	fmovdl	%xcc,	%f15,	%f15
	set	0x38, %i3
	sta	%f23,	[%l7 + %i3] 0x04
	andn	%l5,	%o0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	fnands	%f8,	%f15,	%f15
	fcmple16	%f20,	%f30,	%l4
	fmovs	%f17,	%f22
	tne	%xcc,	0x6
	brgz,a	%l3,	loop_2638
	sllx	%l2,	%l6,	%o3
	tne	%icc,	0x1
	movcc	%xcc,	%g7,	%o4
loop_2638:
	movrgz	%l1,	%g5,	%i7
	edge32l	%i0,	%o6,	%i6
	edge8n	%i3,	%i4,	%g4
	movvc	%xcc,	%i1,	%o7
	fmovda	%icc,	%f24,	%f15
	tsubcctv	%o5,	0x1F0F,	%l0
	fmovrsgz	%i2,	%f21,	%f24
	xorcc	%g1,	%i5,	%o2
	umul	%g2,	0x0B0B,	%o1
	array16	%l5,	%g6,	%o0
	edge8l	%l4,	%l3,	%l2
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 0x3
	fbg,a	%fcc0,	loop_2639
	andn	%g3,	0x1E93,	%l6
	edge32	%g7,	%o3,	%l1
	subcc	%g5,	0x1B16,	%i7
loop_2639:
	movpos	%icc,	%o4,	%o6
	mulscc	%i0,	%i3,	%i4
	bne	loop_2640
	srl	%g4,	%i1,	%o7
	movrgz	%i6,	0x138,	%o5
	edge16	%i2,	%l0,	%i5
loop_2640:
	fxors	%f17,	%f8,	%f20
	fbe	%fcc1,	loop_2641
	fmovse	%icc,	%f26,	%f2
	popc	0x1337,	%o2
	fmovsneg	%icc,	%f4,	%f7
loop_2641:
	edge8ln	%g1,	%o1,	%g2
	set	0x62, %l6
	lduba	[%l7 + %l6] 0x89,	%g6
	prefetch	[%l7 + 0x34],	 0x2
	ldd	[%l7 + 0x18],	%o0
	tne	%xcc,	0x6
	movneg	%xcc,	%l4,	%l5
	fone	%f30
	fornot2s	%f25,	%f14,	%f12
	fmovdleu	%icc,	%f17,	%f4
	fmovsvs	%icc,	%f24,	%f2
	umul	%l2,	0x13C2,	%l3
	edge8ln	%l6,	%g3,	%g7
	fabsd	%f24,	%f10
	fbe	%fcc3,	loop_2642
	fornot2	%f16,	%f30,	%f12
	nop
	setx loop_2643, %l0, %l1
	jmpl %l1, %o3
	fors	%f21,	%f8,	%f8
loop_2642:
	bne,pn	%xcc,	loop_2644
	movpos	%icc,	%l1,	%g5
loop_2643:
	nop
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x14,	 0x2
loop_2644:
	sll	%o6,	0x0D,	%i7
	edge8ln	%i0,	%i3,	%i4
	fmovsl	%icc,	%f3,	%f11
	orcc	%i1,	0x0B27,	%o7
	orn	%g4,	%i6,	%i2
	movrgz	%o5,	0x070,	%l0
	fbn,a	%fcc0,	loop_2645
	fmovdg	%icc,	%f0,	%f20
	edge32ln	%i5,	%o2,	%g1
	movre	%o1,	0x03D,	%g6
loop_2645:
	fmovdneg	%xcc,	%f2,	%f16
	sll	%o0,	%g2,	%l5
	xnorcc	%l2,	%l4,	%l3
	movrgz	%l6,	0x124,	%g3
	fmovrdgez	%o3,	%f24,	%f8
	fmul8x16	%f14,	%f24,	%f2
	orncc	%l1,	%g7,	%g5
	alignaddrl	%o4,	%i7,	%o6
	array16	%i3,	%i4,	%i0
	fmul8ulx16	%f22,	%f30,	%f0
	subcc	%i1,	%o7,	%g4
	udivx	%i6,	0x0E43,	%o5
	flush	%l7 + 0x34
	or	%l0,	0x004D,	%i5
	fmovdvs	%xcc,	%f17,	%f5
	edge8l	%i2,	%o2,	%o1
	fcmpes	%fcc3,	%f7,	%f10
	fbu	%fcc3,	loop_2646
	mulx	%g6,	%g1,	%o0
	fmovrsne	%g2,	%f14,	%f1
	tne	%icc,	0x7
loop_2646:
	movg	%xcc,	%l5,	%l2
	fpadd32	%f28,	%f6,	%f8
	fmovdvc	%icc,	%f17,	%f19
	movcc	%icc,	%l3,	%l4
	movrne	%g3,	0x2B0,	%o3
	udiv	%l6,	0x06F4,	%g7
	fornot1s	%f29,	%f0,	%f30
	fpmerge	%f23,	%f25,	%f12
	mulscc	%g5,	%l1,	%o4
	fmovrde	%o6,	%f4,	%f22
	wr	%g0,	0x2a,	%asi
	stha	%i7,	[%l7 + 0x1C] %asi
	membar	#Sync
	tne	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc2,	loop_2647
	edge32ln	%i3,	%i0,	%i4
	tgu	%xcc,	0x6
	fmovs	%f9,	%f14
loop_2647:
	subc	%o7,	0x02A9,	%i1
	fnor	%f14,	%f20,	%f8
	tleu	%icc,	0x0
	nop
	setx loop_2648, %l0, %l1
	jmpl %l1, %i6
	ldx	[%l7 + 0x30],	%o5
	fblg,a	%fcc0,	loop_2649
	edge32n	%g4,	%i5,	%i2
loop_2648:
	fmovdl	%xcc,	%f16,	%f24
	sdiv	%l0,	0x183E,	%o2
loop_2649:
	movrne	%g6,	%g1,	%o0
	set	0x25, %l5
	ldsba	[%l7 + %l5] 0x0c,	%o1
	popc	0x1093,	%g2
	tn	%xcc,	0x2
	ldd	[%l7 + 0x28],	%l4
	fmovrdgz	%l2,	%f30,	%f0
	tn	%xcc,	0x0
	movre	%l4,	%l3,	%o3
	srlx	%l6,	%g7,	%g5
	fpadd32s	%f20,	%f3,	%f1
	edge16	%g3,	%o4,	%l1
	tge	%icc,	0x3
	umul	%o6,	%i7,	%i0
	alignaddrl	%i4,	%o7,	%i3
	stw	%i1,	[%l7 + 0x54]
	ldsb	[%l7 + 0x72],	%i6
	xor	%o5,	0x0583,	%i5
	bvs,a	loop_2650
	fmovsneg	%icc,	%f30,	%f0
	brlez,a	%i2,	loop_2651
	ba,a,pn	%xcc,	loop_2652
loop_2650:
	sdivcc	%l0,	0x0C44,	%g4
	tl	%xcc,	0x4
loop_2651:
	fmovscc	%icc,	%f9,	%f1
loop_2652:
	srl	%g6,	%o2,	%g1
	movl	%icc,	%o1,	%g2
	bleu,pn	%icc,	loop_2653
	membar	0x66
	and	%l5,	%o0,	%l4
	movvc	%icc,	%l2,	%o3
loop_2653:
	addcc	%l6,	0x1E8F,	%g7
	nop
	setx loop_2654, %l0, %l1
	jmpl %l1, %g5
	tgu	%xcc,	0x6
	fmovrdlez	%l3,	%f16,	%f20
	call	loop_2655
loop_2654:
	tcc	%xcc,	0x6
	fmovspos	%icc,	%f4,	%f12
	orncc	%g3,	%l1,	%o6
loop_2655:
	movge	%xcc,	%o4,	%i0
	addc	%i4,	%i7,	%i3
	tgu	%xcc,	0x3
	edge32	%o7,	%i6,	%o5
	fmovsg	%xcc,	%f26,	%f9
	fmovrslz	%i1,	%f5,	%f17
	edge16l	%i5,	%i2,	%g4
	movrlz	%g6,	0x121,	%o2
	addcc	%l0,	%g1,	%o1
	movn	%icc,	%l5,	%o0
	and	%l4,	0x1CD9,	%l2
	movrgz	%o3,	%g2,	%l6
	tvs	%icc,	0x6
	edge32ln	%g7,	%g5,	%g3
	movcc	%xcc,	%l3,	%o6
	tcs	%icc,	0x5
	tn	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o4,	%l1
	srax	%i4,	0x14,	%i7
	pdist	%f2,	%f28,	%f10
	and	%i0,	0x119E,	%o7
	fmul8x16	%f1,	%f26,	%f2
	movleu	%xcc,	%i3,	%i6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i5,	%i2
	prefetch	[%l7 + 0x24],	 0x0
	tg	%icc,	0x4
	sdivcc	%g4,	0x1266,	%g6
	tcs	%xcc,	0x6
	mulscc	%o2,	0x176D,	%l0
	set	0x40, %g1
	lduha	[%l7 + %g1] 0x18,	%o1
	srl	%g1,	%o0,	%l5
	fmovsneg	%xcc,	%f6,	%f5
	sub	%l2,	0x1628,	%o3
	fcmple32	%f8,	%f26,	%l4
	ba,pn	%xcc,	loop_2656
	fbu,a	%fcc1,	loop_2657
	umul	%l6,	%g7,	%g5
	movvc	%xcc,	%g2,	%g3
loop_2656:
	nop
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x89,	%o6
loop_2657:
	call	loop_2658
	sethi	0x019C,	%l3
	subcc	%o4,	%l1,	%i4
	movcc	%icc,	%i0,	%i7
loop_2658:
	bge	loop_2659
	movcs	%icc,	%o7,	%i6
	movvc	%icc,	%o5,	%i3
	xor	%i1,	%i5,	%g4
loop_2659:
	fcmple16	%f14,	%f6,	%i2
	fcmple32	%f20,	%f8,	%g6
	xnor	%o2,	%o1,	%g1
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	nop
	set	0x58, %g2
	std	%f24,	[%l7 + %g2]
	edge32l	%l5,	%o0,	%o3
	movrgz	%l2,	0x2DE,	%l4
	fba,a	%fcc0,	loop_2660
	fornot1s	%f15,	%f20,	%f16
	movvs	%icc,	%g7,	%g5
	pdist	%f2,	%f8,	%f20
loop_2660:
	ble	%icc,	loop_2661
	alignaddrl	%g2,	%g3,	%l6
	ldsw	[%l7 + 0x5C],	%l3
	movrlz	%o6,	%o4,	%l1
loop_2661:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%i0
	array8	%i4,	%o7,	%i6
	ldsh	[%l7 + 0x2A],	%o5
	set	0x28, %l2
	ldsba	[%l7 + %l2] 0x0c,	%i7
	ldsb	[%l7 + 0x48],	%i3
	tge	%icc,	0x4
	udivcc	%i1,	0x0B62,	%i5
	edge8	%g4,	%g6,	%o2
	movrgz	%o1,	0x068,	%g1
	sll	%i2,	%l5,	%l0
	movne	%icc,	%o0,	%o3
	wr	%g0,	0xe2,	%asi
	stha	%l4,	[%l7 + 0x5E] %asi
	membar	#Sync
	membar	0x0F
	tsubcctv	%l2,	%g7,	%g5
	sir	0x0E82
	srl	%g3,	%l6,	%g2
	edge16l	%o6,	%o4,	%l1
	andn	%l3,	%i4,	%o7
	addc	%i0,	%o5,	%i6
	addcc	%i7,	0x1A3B,	%i3
	xor	%i5,	%g4,	%g6
	udivcc	%o2,	0x15B1,	%o1
	subc	%g1,	%i2,	%l5
	ldd	[%l7 + 0x08],	%f26
	orcc	%l0,	0x0FBB,	%o0
	edge16l	%o3,	%i1,	%l2
	bg,a	%icc,	loop_2662
	fblg	%fcc3,	loop_2663
	fpsub16	%f28,	%f16,	%f16
	fmovd	%f14,	%f28
loop_2662:
	tn	%xcc,	0x5
loop_2663:
	movpos	%xcc,	%g7,	%g5
	fnot1s	%f19,	%f22
	fpsub32s	%f0,	%f5,	%f30
	movvs	%xcc,	%g3,	%l6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g2
	addcc	%o6,	%o4,	%l1
	movvs	%icc,	%i4,	%l3
	alignaddrl	%i0,	%o7,	%i6
	fcmped	%fcc0,	%f8,	%f18
	tvc	%icc,	0x2
	fcmple16	%f16,	%f16,	%o5
	fbe	%fcc1,	loop_2664
	xor	%i3,	%i7,	%g4
	ta	%xcc,	0x4
	std	%i4,	[%l7 + 0x78]
loop_2664:
	fbuge	%fcc1,	loop_2665
	call	loop_2666
	movg	%xcc,	%g6,	%o1
	siam	0x2
loop_2665:
	edge8	%o2,	%g1,	%l5
loop_2666:
	andn	%i2,	0x01F1,	%o0
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	umul	%l0,	0x0113,	%o3
	movre	%i1,	%g7,	%l2
	tn	%xcc,	0x5
	movpos	%xcc,	%g3,	%g5
	membar	0x0D
	st	%f23,	[%l7 + 0x78]
	call	loop_2667
	pdist	%f30,	%f24,	%f28
	taddcc	%l6,	%l4,	%o6
	array32	%o4,	%l1,	%i4
loop_2667:
	fxors	%f27,	%f17,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x52, %o6
	ldsba	[%l7 + %o6] 0x88,	%g2
	tne	%icc,	0x1
	te	%icc,	0x0
	movgu	%icc,	%l3,	%i0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i6,	%o5
	ldsb	[%l7 + 0x44],	%o7
	set	0x78, %g6
	stda	%i2,	[%l7 + %g6] 0x14
	tsubcc	%i7,	0x0B05,	%g4
	tneg	%icc,	0x3
	subccc	%g6,	0x0762,	%o1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%g1
	tleu	%icc,	0x3
	fmovsn	%icc,	%f3,	%f10
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x16
	membar	#Sync
	fmovdge	%xcc,	%f8,	%f30
	fmovrdlz	%l5,	%f20,	%f12
	brgez	%i2,	loop_2668
	bne	loop_2669
	and	%o2,	%l0,	%o3
	fmul8x16al	%f14,	%f7,	%f18
loop_2668:
	sll	%o0,	%i1,	%l2
loop_2669:
	smulcc	%g3,	%g5,	%g7
	movvc	%xcc,	%l4,	%o6
	st	%f26,	[%l7 + 0x6C]
	bcc,a,pn	%xcc,	loop_2670
	tl	%icc,	0x4
	movneg	%xcc,	%o4,	%l6
	nop
	set	0x24, %l3
	lduw	[%l7 + %l3],	%l1
loop_2670:
	movneg	%icc,	%i4,	%l3
	sub	%i0,	0x11D7,	%g2
	fbg,a	%fcc0,	loop_2671
	mulscc	%o5,	0x0131,	%o7
	orn	%i3,	0x0BEA,	%i6
	fmovdgu	%icc,	%f30,	%f18
loop_2671:
	edge8ln	%g4,	%g6,	%i7
	fmovsa	%icc,	%f25,	%f0
	xnorcc	%o1,	%i5,	%g1
	sir	0x017B
	te	%xcc,	0x3
	fpack16	%f6,	%f30
	tg	%icc,	0x0
	fpackfix	%f22,	%f29
	movle	%xcc,	%l5,	%i2
	fabss	%f13,	%f23
	movn	%icc,	%o2,	%l0
	movn	%icc,	%o3,	%i1
	xnor	%l2,	0x190F,	%o0
	tsubcc	%g5,	%g3,	%g7
	movcc	%xcc,	%l4,	%o4
	edge16n	%l6,	%l1,	%i4
	movcc	%icc,	%o6,	%i0
	membar	0x2F
	fnot2	%f2,	%f24
	sdiv	%g2,	0x0483,	%o5
	movgu	%xcc,	%o7,	%i3
	bneg	loop_2672
	nop
	setx	loop_2673,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%l3,	0x0353,	%g4
	tcc	%xcc,	0x0
loop_2672:
	ba,a	loop_2674
loop_2673:
	andn	%g6,	0x1EEA,	%i6
	tpos	%icc,	0x6
	swap	[%l7 + 0x78],	%i7
loop_2674:
	bgu	%xcc,	loop_2675
	orncc	%i5,	%g1,	%l5
	movleu	%xcc,	%i2,	%o1
	sub	%o2,	%o3,	%l0
loop_2675:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%l2,	[%g0 + 0x38] %asi
	sra	%i1,	%o0,	%g5
	fnegd	%f6,	%f22
	brgez	%g7,	loop_2676
	fbn,a	%fcc2,	loop_2677
	tgu	%xcc,	0x0
	popc	0x10CD,	%l4
loop_2676:
	add	%o4,	0x128A,	%g3
loop_2677:
	edge32	%l1,	%i4,	%l6
	movrgez	%o6,	0x10F,	%i0
	bne	loop_2678
	tcc	%xcc,	0x3
	nop
	set	0x60, %o7
	stx	%g2,	[%l7 + %o7]
	xor	%o5,	0x11C5,	%i3
loop_2678:
	stbar
	mulx	%o7,	0x1EE3,	%l3
	edge16	%g6,	%g4,	%i7
	fbu	%fcc3,	loop_2679
	or	%i6,	0x1D17,	%g1
	sll	%l5,	%i5,	%o1
	fbue,a	%fcc2,	loop_2680
loop_2679:
	movcs	%icc,	%i2,	%o3
	bg	loop_2681
	tl	%xcc,	0x5
loop_2680:
	smul	%l0,	0x16DE,	%l2
	movrlez	%i1,	0x2A9,	%o2
loop_2681:
	sir	0x0D68
	sll	%g5,	%o0,	%g7
	tn	%icc,	0x2
	fnot1s	%f1,	%f6
	fcmpgt16	%f0,	%f18,	%o4
	tl	%xcc,	0x4
	movg	%xcc,	%l4,	%g3
	orncc	%i4,	%l1,	%o6
	edge8n	%i0,	%l6,	%o5
	fmovdge	%icc,	%f17,	%f19
	fmovsgu	%xcc,	%f14,	%f11
	brgez	%i3,	loop_2682
	fmovdcc	%icc,	%f24,	%f3
	tsubcctv	%o7,	%g2,	%g6
	sth	%l3,	[%l7 + 0x6E]
loop_2682:
	array32	%i7,	%g4,	%i6
	movl	%icc,	%l5,	%g1
	bcs	%icc,	loop_2683
	array8	%o1,	%i5,	%i2
	sdiv	%l0,	0x08C7,	%o3
	fmovsn	%xcc,	%f6,	%f1
loop_2683:
	movpos	%xcc,	%l2,	%o2
	fpadd16s	%f3,	%f25,	%f19
	movrlez	%g5,	%i1,	%g7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6B] %asi,	%o4
	ldd	[%l7 + 0x60],	%f18
	tneg	%icc,	0x1
	srl	%l4,	0x0F,	%o0
	taddcctv	%g3,	%i4,	%l1
	tpos	%icc,	0x3
	xor	%o6,	0x1E6A,	%i0
	fmovsn	%icc,	%f28,	%f1
	fexpand	%f1,	%f12
	sra	%l6,	0x08,	%o5
	srl	%o7,	%i3,	%g6
	set	0x51, %i2
	ldsba	[%l7 + %i2] 0x89,	%g2
	ld	[%l7 + 0x48],	%f16
	tvs	%xcc,	0x3
	or	%i7,	%l3,	%i6
	tn	%icc,	0x0
	tsubcctv	%g4,	%g1,	%o1
	edge32ln	%i5,	%i2,	%l5
	brz	%o3,	loop_2684
	addc	%l0,	%o2,	%l2
	fmovscs	%xcc,	%f26,	%f11
	sra	%i1,	%g7,	%g5
loop_2684:
	edge8ln	%o4,	%o0,	%l4
	orcc	%g3,	%i4,	%o6
	fmul8x16	%f7,	%f10,	%f28
	edge8l	%i0,	%l6,	%o5
	fnor	%f0,	%f28,	%f2
	udivx	%o7,	0x0151,	%i3
	andncc	%l1,	%g2,	%i7
	brz,a	%l3,	loop_2685
	udivcc	%i6,	0x0AF3,	%g4
	sra	%g6,	%o1,	%i5
	brlez,a	%g1,	loop_2686
loop_2685:
	fba,a	%fcc3,	loop_2687
	fpack16	%f10,	%f0
	orcc	%i2,	%o3,	%l0
loop_2686:
	sethi	0x12E9,	%o2
loop_2687:
	bge,a	%xcc,	loop_2688
	te	%icc,	0x6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l2,	%i1
loop_2688:
	edge16n	%g7,	%l5,	%g5
	movrgz	%o0,	%o4,	%l4
	fmovrsgez	%g3,	%f12,	%f12
	movne	%icc,	%i4,	%o6
	be,pt	%xcc,	loop_2689
	addc	%l6,	%o5,	%i0
	stb	%o7,	[%l7 + 0x24]
	membar	0x21
loop_2689:
	smulcc	%l1,	%i3,	%g2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x70] %asi,	%l3
	set	0x68, %l0
	ldxa	[%l7 + %l0] 0x04,	%i6
	edge8n	%i7,	%g4,	%g6
	st	%f29,	[%l7 + 0x34]
	movrgez	%o1,	0x1F6,	%i5
	ldx	[%l7 + 0x10],	%g1
	edge8l	%i2,	%l0,	%o3
	fmovsgu	%xcc,	%f3,	%f16
	movrlz	%l2,	%o2,	%g7
	mulx	%l5,	0x0FAD,	%g5
	udiv	%i1,	0x1610,	%o0
	fmovrsne	%l4,	%f11,	%f31
	array8	%o4,	%g3,	%o6
	and	%i4,	0x04D3,	%o5
	ldub	[%l7 + 0x16],	%l6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%o7
	or	%l1,	%g2,	%l3
	movcc	%icc,	%i6,	%i7
	fnor	%f12,	%f12,	%f6
	fnot2	%f14,	%f18
	tsubcctv	%g4,	%g6,	%i3
	bvs,a,pt	%icc,	loop_2690
	sdivcc	%o1,	0x178A,	%g1
	fornot2	%f26,	%f26,	%f0
	brnz	%i2,	loop_2691
loop_2690:
	ldub	[%l7 + 0x4F],	%i5
	subccc	%o3,	0x0293,	%l2
	bleu,a,pn	%xcc,	loop_2692
loop_2691:
	fnot2	%f18,	%f4
	movpos	%xcc,	%l0,	%o2
	fmovsa	%xcc,	%f7,	%f4
loop_2692:
	xorcc	%g7,	%l5,	%g5
	fpackfix	%f26,	%f18
	sir	0x0EC4
	subccc	%o0,	%l4,	%o4
	set	0x2E, %i6
	stba	%i1,	[%l7 + %i6] 0x23
	membar	#Sync
	movcc	%xcc,	%o6,	%i4
	fpsub16s	%f25,	%f25,	%f18
	fbue	%fcc1,	loop_2693
	movleu	%icc,	%g3,	%o5
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x80
loop_2693:
	fmovrsgz	%i0,	%f0,	%f18
	alignaddrl	%l6,	%o7,	%g2
	flush	%l7 + 0x7C
	bvc	%icc,	loop_2694
	fmovdpos	%icc,	%f2,	%f17
	set	0x38, %o3
	stxa	%l1,	[%l7 + %o3] 0xea
	membar	#Sync
loop_2694:
	fandnot2s	%f20,	%f15,	%f4
	orn	%i6,	%l3,	%i7
	movcs	%icc,	%g6,	%g4
	movle	%xcc,	%o1,	%i3
	tpos	%icc,	0x3
	subccc	%i2,	%g1,	%i5
	fpsub16s	%f21,	%f24,	%f20
	movg	%xcc,	%l2,	%o3
	fbul	%fcc0,	loop_2695
	subccc	%l0,	%o2,	%l5
	fblg	%fcc2,	loop_2696
	tle	%icc,	0x2
loop_2695:
	brgz	%g7,	loop_2697
	add	%o0,	%g5,	%o4
loop_2696:
	tgu	%icc,	0x5
	tl	%icc,	0x6
loop_2697:
	edge16	%l4,	%o6,	%i1
	sra	%g3,	0x0A,	%o5
	tsubcctv	%i0,	0x14D7,	%l6
	fmovd	%f8,	%f4
	edge16	%i4,	%o7,	%l1
	movg	%icc,	%g2,	%i6
	ble	%icc,	loop_2698
	fpsub16	%f28,	%f0,	%f4
	tne	%xcc,	0x2
	edge32ln	%l3,	%i7,	%g6
loop_2698:
	fandnot1	%f24,	%f30,	%f30
	be	%xcc,	loop_2699
	brgz	%g4,	loop_2700
	bn,a	%icc,	loop_2701
	smul	%i3,	0x0834,	%i2
loop_2699:
	xorcc	%o1,	0x1927,	%i5
loop_2700:
	movl	%xcc,	%l2,	%o3
loop_2701:
	nop
	set	0x4C, %o2
	ldswa	[%l7 + %o2] 0x88,	%l0
	fmovsge	%xcc,	%f0,	%f12
	alignaddr	%g1,	%o2,	%g7
	fbu	%fcc2,	loop_2702
	array32	%o0,	%g5,	%l5
	fpackfix	%f0,	%f8
	tn	%xcc,	0x6
loop_2702:
	ta	%xcc,	0x6
	sll	%l4,	%o4,	%i1
	membar	0x59
	fmovrdgez	%g3,	%f2,	%f20
	fbu	%fcc3,	loop_2703
	edge32	%o5,	%i0,	%o6
	fnors	%f1,	%f20,	%f18
	or	%i4,	0x00D3,	%o7
loop_2703:
	tne	%icc,	0x6
	movge	%xcc,	%l6,	%l1
	fbn	%fcc1,	loop_2704
	subc	%g2,	0x0DEC,	%i6
	movrgz	%l3,	%g6,	%g4
	add	%i3,	%i2,	%o1
loop_2704:
	prefetch	[%l7 + 0x64],	 0x2
	bcs,a	%icc,	loop_2705
	mulscc	%i7,	0x0C61,	%i5
	fblg	%fcc3,	loop_2706
	xnor	%o3,	%l2,	%g1
loop_2705:
	fmul8x16au	%f28,	%f27,	%f8
	andncc	%l0,	%o2,	%o0
loop_2706:
	fmovdcc	%xcc,	%f13,	%f3
	flush	%l7 + 0x68
	nop
	setx loop_2707, %l0, %l1
	jmpl %l1, %g7
	fmovdl	%xcc,	%f25,	%f13
	fpadd32	%f30,	%f20,	%f18
	fandnot2s	%f31,	%f26,	%f5
loop_2707:
	stbar
	edge16	%l5,	%l4,	%g5
	taddcc	%i1,	0x1F1A,	%o4
	taddcc	%o5,	0x0CFA,	%i0
	fbg	%fcc0,	loop_2708
	fzeros	%f14
	fbe,a	%fcc3,	loop_2709
	lduw	[%l7 + 0x74],	%o6
loop_2708:
	tcs	%xcc,	0x6
	sdivx	%i4,	0x178D,	%g3
loop_2709:
	movge	%icc,	%l6,	%l1
	alignaddrl	%g2,	%o7,	%i6
	fmovrsgz	%l3,	%f13,	%f27
	tpos	%xcc,	0x0
	nop
	setx	loop_2710,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x0
	fpsub32	%f22,	%f30,	%f0
	and	%g4,	0x0EDC,	%g6
loop_2710:
	movvs	%xcc,	%i2,	%i3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x20] %asi,	%i7
	ble,pn	%xcc,	loop_2711
	edge8ln	%o1,	%i5,	%o3
	tvs	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l2
loop_2711:
	movrlz	%l0,	0x2DB,	%o2
	fbuge,a	%fcc0,	loop_2712
	fmovrsne	%o0,	%f25,	%f28
	bleu	%icc,	loop_2713
	edge8ln	%g7,	%l5,	%g1
loop_2712:
	bvs,a,pn	%xcc,	loop_2714
	movcc	%xcc,	%g5,	%i1
loop_2713:
	edge8n	%o4,	%o5,	%i0
	movg	%xcc,	%l4,	%o6
loop_2714:
	alignaddrl	%i4,	%l6,	%l1
	fmovsleu	%xcc,	%f8,	%f16
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o7
	movleu	%icc,	%g3,	%i6
	wr	%g0,	0x22,	%asi
	stha	%l3,	[%l7 + 0x20] %asi
	membar	#Sync
	nop
	setx	loop_2715,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%g6,	%i2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f6,	[%l7 + 0x10]
loop_2715:
	fmuld8ulx16	%f10,	%f13,	%f28
	alignaddrl	%i7,	%g4,	%i5
	udivx	%o3,	0x0EF5,	%l2
	fcmpeq16	%f6,	%f4,	%o1
	tle	%xcc,	0x1
	movcs	%xcc,	%o2,	%l0
	movvs	%icc,	%g7,	%o0
	tle	%icc,	0x2
	orcc	%g1,	0x0DDC,	%g5
	movn	%icc,	%i1,	%o4
	fexpand	%f29,	%f28
	movcc	%xcc,	%l5,	%o5
	edge8	%i0,	%l4,	%o6
	stb	%l6,	[%l7 + 0x54]
	bg	loop_2716
	prefetch	[%l7 + 0x0C],	 0x2
	fmovrdne	%l1,	%f16,	%f4
	bpos,a,pn	%icc,	loop_2717
loop_2716:
	move	%xcc,	%g2,	%i4
	brz	%g3,	loop_2718
	tn	%icc,	0x4
loop_2717:
	alignaddrl	%i6,	%l3,	%o7
	fmovdcc	%xcc,	%f23,	%f22
loop_2718:
	edge32ln	%i2,	%g6,	%i3
	srlx	%g4,	%i7,	%i5
	umulcc	%o3,	0x18BD,	%l2
	fbule	%fcc1,	loop_2719
	fmovrsgez	%o2,	%f27,	%f24
	nop
	setx	loop_2720,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%o1,	0x12DF,	%l0
loop_2719:
	fmovd	%f28,	%f16
	taddcc	%o0,	0x1277,	%g7
loop_2720:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fpsub16s	%f3,	%f31,	%f15
	add	%g1,	0x0A1E,	%i1
	fors	%f26,	%f7,	%f1
	wr	%g0,	0x89,	%asi
	stha	%o4,	[%l7 + 0x62] %asi
	movvc	%icc,	%o5,	%l5
	movpos	%xcc,	%i0,	%o6
	fbul,a	%fcc2,	loop_2721
	movn	%xcc,	%l4,	%l1
	fands	%f26,	%f5,	%f30
	sth	%g2,	[%l7 + 0x7E]
loop_2721:
	and	%l6,	0x040F,	%i4
	fsrc2s	%f27,	%f16
	sub	%i6,	%g3,	%l3
	sdivcc	%o7,	0x0065,	%i2
	umul	%g6,	%g4,	%i7
	fblg	%fcc2,	loop_2722
	bleu,a,pn	%icc,	loop_2723
	addcc	%i3,	%o3,	%l2
	tl	%icc,	0x7
loop_2722:
	membar	0x38
loop_2723:
	nop
	set	0x4F, %i7
	ldsba	[%l7 + %i7] 0x18,	%o2
	set	0x7A, %o1
	ldstuba	[%l7 + %o1] 0x89,	%i5
	movg	%icc,	%l0,	%o1
	te	%icc,	0x3
	edge8l	%g7,	%g5,	%g1
	fbule	%fcc1,	loop_2724
	srl	%o0,	%i1,	%o4
	mulx	%o5,	%i0,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2724:
	nop
	set	0x64, %l4
	sta	%f1,	[%l7 + %l4] 0x14
	bge,a	loop_2725
	mulx	%l4,	0x0586,	%l1
	brz	%g2,	loop_2726
	ldd	[%l7 + 0x68],	%o6
loop_2725:
	move	%icc,	%i4,	%i6
	fmovsge	%xcc,	%f9,	%f5
loop_2726:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l6,	%l3,	%g3
	sth	%i2,	[%l7 + 0x24]
	nop
	setx	loop_2727,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%g6,	0x1771,	%o7
	movrlez	%g4,	%i3,	%i7
	stbar
loop_2727:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o3,	0x162,	%l2
	addc	%o2,	0x0F63,	%i5
	udivcc	%l0,	0x0F58,	%o1
	tneg	%icc,	0x5
	smulcc	%g7,	%g1,	%o0
	subcc	%g5,	%o4,	%o5
	fxnor	%f22,	%f30,	%f4
	alignaddrl	%i0,	%l5,	%l4
	fandnot1s	%f5,	%f30,	%f8
	sth	%i1,	[%l7 + 0x20]
	bpos	%icc,	loop_2728
	movvs	%xcc,	%g2,	%l1
	sir	0x0C81
	move	%icc,	%i4,	%o6
loop_2728:
	bg,pt	%icc,	loop_2729
	fbul,a	%fcc1,	loop_2730
	movn	%xcc,	%l6,	%i6
	brlez	%l3,	loop_2731
loop_2729:
	movvc	%icc,	%i2,	%g3
loop_2730:
	fmovdvc	%xcc,	%f23,	%f15
	fpack16	%f20,	%f3
loop_2731:
	or	%o7,	%g4,	%g6
	fbo	%fcc1,	loop_2732
	fsrc2	%f16,	%f22
	fble,a	%fcc1,	loop_2733
	fpack32	%f2,	%f16,	%f26
loop_2732:
	addccc	%i7,	%o3,	%l2
	sth	%i3,	[%l7 + 0x20]
loop_2733:
	edge8n	%o2,	%i5,	%o1
	movvc	%xcc,	%g7,	%l0
	ta	%xcc,	0x2
	tneg	%icc,	0x1
	set	0x56, %l1
	lduha	[%l7 + %l1] 0x04,	%g1
	add	%g5,	%o4,	%o5
	fmovrdlez	%i0,	%f14,	%f26
	tcc	%xcc,	0x2
	fnegd	%f24,	%f24
	movvc	%icc,	%o0,	%l5
	sll	%i1,	%g2,	%l4
	edge32	%i4,	%o6,	%l1
	fbne,a	%fcc1,	loop_2734
	fmovrdlez	%l6,	%f4,	%f20
	ldub	[%l7 + 0x77],	%i6
	tg	%icc,	0x7
loop_2734:
	fmul8sux16	%f20,	%f8,	%f2
	movrne	%i2,	%l3,	%o7
	andn	%g3,	%g4,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%i7
	ba	%icc,	loop_2735
	sra	%o3,	0x1A,	%i3
	fmovsge	%icc,	%f23,	%f16
	tsubcctv	%o2,	0x0B7A,	%i5
loop_2735:
	xnorcc	%l2,	0x12F5,	%g7
	stw	%o1,	[%l7 + 0x18]
	addc	%g1,	0x02AF,	%g5
	nop
	set	0x2C, %i1
	sth	%o4,	[%l7 + %i1]
	sir	0x03CC
	edge16l	%o5,	%i0,	%l0
	edge16l	%o0,	%i1,	%g2
	array8	%l5,	%l4,	%o6
	tsubcc	%i4,	%l1,	%i6
	lduh	[%l7 + 0x44],	%l6
	fmovrdgz	%i2,	%f24,	%f0
	taddcc	%o7,	%l3,	%g4
	fmul8ulx16	%f22,	%f24,	%f24
	tvs	%xcc,	0x5
	edge8ln	%g6,	%g3,	%o3
	sllx	%i7,	0x05,	%o2
	be,pn	%xcc,	loop_2736
	movle	%icc,	%i3,	%l2
	movre	%i5,	%o1,	%g7
	tsubcctv	%g5,	0x0784,	%o4
loop_2736:
	tcs	%xcc,	0x2
	stbar
	movg	%xcc,	%o5,	%g1
	orn	%i0,	%l0,	%o0
	fcmpes	%fcc0,	%f14,	%f15
	for	%f6,	%f22,	%f26
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x10,	 0x2
	fblg,a	%fcc0,	loop_2737
	tsubcc	%l5,	0x014A,	%l4
	tle	%xcc,	0x6
	fbule,a	%fcc1,	loop_2738
loop_2737:
	edge32n	%i1,	%o6,	%i4
	wr	%g0,	0x80,	%asi
	stha	%l1,	[%l7 + 0x3A] %asi
loop_2738:
	nop
	wr	%g0,	0x88,	%asi
	stha	%l6,	[%l7 + 0x3A] %asi
	move	%icc,	%i6,	%i2
	wr	%g0,	0xeb,	%asi
	stha	%l3,	[%l7 + 0x68] %asi
	membar	#Sync
	udivcc	%g4,	0x18ED,	%g6
	tn	%icc,	0x3
	fandnot2	%f2,	%f6,	%f20
	addcc	%o7,	0x108A,	%o3
	fmovrdlez	%i7,	%f12,	%f16
	tvc	%xcc,	0x7
	fba	%fcc2,	loop_2739
	movgu	%xcc,	%g3,	%i3
	set	0x48, %o5
	stwa	%l2,	[%l7 + %o5] 0x15
loop_2739:
	fabsd	%f22,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i5,	%o1,	%g7
	fmuld8ulx16	%f23,	%f27,	%f24
	bneg,a,pt	%xcc,	loop_2740
	smulcc	%o2,	0x0BC9,	%o4
	fand	%f2,	%f6,	%f20
	fnegs	%f6,	%f19
loop_2740:
	smul	%g5,	0x0C54,	%o5
	edge16	%g1,	%i0,	%o0
	tg	%icc,	0x4
	mova	%icc,	%l0,	%l5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x76] %asi,	%l4
	movg	%icc,	%i1,	%o6
	tneg	%xcc,	0x4
	fabss	%f19,	%f24
	te	%icc,	0x1
	tcs	%icc,	0x4
	tvs	%xcc,	0x7
	tcs	%icc,	0x1
	tgu	%icc,	0x3
	movle	%xcc,	%g2,	%i4
	bleu	loop_2741
	fmovdvs	%icc,	%f12,	%f19
	fcmped	%fcc3,	%f4,	%f18
	movleu	%xcc,	%l1,	%i6
loop_2741:
	edge16l	%l6,	%i2,	%l3
	fmul8x16au	%f27,	%f20,	%f12
	movrgez	%g4,	0x177,	%o7
	fmovdvs	%xcc,	%f3,	%f13
	fmul8x16	%f16,	%f16,	%f20
	bgu,a	loop_2742
	movge	%icc,	%g6,	%i7
	std	%f12,	[%l7 + 0x18]
	set	0x18, %g7
	ldxa	[%l7 + %g7] 0x14,	%g3
loop_2742:
	tsubcc	%i3,	%o3,	%l2
	tpos	%icc,	0x2
	fmovde	%icc,	%f3,	%f17
	set	0x43, %g3
	ldsba	[%l7 + %g3] 0x0c,	%o1
	fmovdvc	%xcc,	%f14,	%f8
	fmovrslz	%i5,	%f0,	%f26
	udivx	%g7,	0x062A,	%o2
	movrlz	%g5,	0x1FC,	%o4
	sllx	%o5,	0x0C,	%g1
	movleu	%xcc,	%i0,	%o0
	fbne	%fcc1,	loop_2743
	fmovrdne	%l5,	%f14,	%f4
	subc	%l0,	0x032D,	%i1
	array8	%l4,	%g2,	%o6
loop_2743:
	fmovdleu	%icc,	%f29,	%f23
	fpack32	%f10,	%f28,	%f0
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%l1
	stw	%i6,	[%l7 + 0x0C]
	sdivcc	%l6,	0x0957,	%i4
	fmul8x16al	%f9,	%f19,	%f18
	umul	%l3,	0x1560,	%i2
	stx	%g4,	[%l7 + 0x18]
	ba	loop_2744
	te	%xcc,	0x5
	edge16l	%g6,	%o7,	%g3
	sllx	%i7,	0x15,	%o3
loop_2744:
	andcc	%i3,	%o1,	%i5
	std	%f28,	[%l7 + 0x10]
	fmovdl	%icc,	%f29,	%f12
	fmovrsgz	%g7,	%f25,	%f9
	fandnot1s	%f19,	%f4,	%f13
	tl	%icc,	0x4
	fpadd32s	%f8,	%f30,	%f15
	fmovse	%xcc,	%f9,	%f7
	fbue	%fcc0,	loop_2745
	tsubcctv	%l2,	%g5,	%o2
	bne,a	loop_2746
	mulscc	%o4,	%o5,	%i0
loop_2745:
	fmovsle	%xcc,	%f9,	%f6
	call	loop_2747
loop_2746:
	addc	%o0,	%l5,	%g1
	fbug,a	%fcc2,	loop_2748
	mova	%icc,	%l0,	%i1
loop_2747:
	fxnor	%f2,	%f2,	%f30
	movrlez	%l4,	%o6,	%l1
loop_2748:
	tcc	%icc,	0x5
	xor	%g2,	0x1372,	%l6
	alignaddrl	%i6,	%l3,	%i2
	fornot1s	%f12,	%f17,	%f7
	srax	%i4,	%g4,	%o7
	fmovsl	%icc,	%f22,	%f4
	fmul8x16al	%f4,	%f27,	%f16
	sir	0x0335
	taddcc	%g3,	0x00F9,	%i7
	fands	%f2,	%f24,	%f8
	bge,a,pn	%xcc,	loop_2749
	fmovsn	%xcc,	%f26,	%f9
	fmovsa	%icc,	%f21,	%f18
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2749:
	fbu,a	%fcc0,	loop_2750
	fones	%f14
	ldx	[%l7 + 0x30],	%g6
	tsubcc	%i3,	%o1,	%o3
loop_2750:
	nop
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x11,	%g7
	sra	%i5,	0x0F,	%l2
	fmovsl	%icc,	%f16,	%f15
	movcs	%xcc,	%g5,	%o2
	fnot1	%f20,	%f30
	fmovdle	%xcc,	%f14,	%f0
	movneg	%icc,	%o4,	%i0
	fbul,a	%fcc3,	loop_2751
	smulcc	%o0,	0x0C7A,	%l5
	array8	%o5,	%g1,	%l0
	umulcc	%i1,	0x113F,	%l4
loop_2751:
	edge16l	%o6,	%g2,	%l1
	membar	0x2D
	fzeros	%f15
	srax	%i6,	%l6,	%i2
	and	%i4,	%l3,	%g4
	array8	%g3,	%o7,	%g6
	flush	%l7 + 0x60
	tle	%icc,	0x7
	fbge	%fcc2,	loop_2752
	mova	%xcc,	%i7,	%i3
	movgu	%icc,	%o1,	%g7
	fmovrse	%o3,	%f10,	%f1
loop_2752:
	ldd	[%l7 + 0x18],	%l2
	movle	%icc,	%g5,	%i5
	tsubcctv	%o2,	0x0A39,	%o4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i0
	fmovsleu	%xcc,	%f15,	%f2
	sub	%o0,	%l5,	%g1
	tg	%xcc,	0x2
	tvs	%icc,	0x4
	bneg,a,pn	%xcc,	loop_2753
	bvs,pn	%icc,	loop_2754
	umul	%l0,	0x1EC4,	%i1
	movvs	%xcc,	%l4,	%o6
loop_2753:
	sra	%o5,	0x05,	%l1
loop_2754:
	tgu	%xcc,	0x3
	mulscc	%i6,	0x1E3B,	%g2
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	bcs,pt	%xcc,	loop_2755
	alignaddr	%i4,	%l6,	%g4
	sllx	%l3,	0x0C,	%g3
	smulcc	%o7,	%g6,	%i3
loop_2755:
	bcs,a	loop_2756
	tleu	%xcc,	0x6
	te	%icc,	0x1
	sra	%o1,	0x02,	%g7
loop_2756:
	nop
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x88,	%i6
	mulx	%l2,	0x159C,	%g5
	edge32n	%i5,	%o2,	%o4
	sdivx	%i0,	0x111D,	%o3
	sdivcc	%l5,	0x1B09,	%g1
	subcc	%l0,	%o0,	%l4
	fmovdpos	%icc,	%f23,	%f18
	tcs	%icc,	0x5
	ldd	[%l7 + 0x50],	%o6
	sllx	%i1,	%o5,	%l1
	andcc	%g2,	0x0A64,	%i2
	fmovdle	%icc,	%f22,	%f1
	orcc	%i4,	0x1E8D,	%i6
	xorcc	%l6,	%l3,	%g4
	xnorcc	%o7,	%g6,	%i3
	movcc	%xcc,	%g3,	%g7
	edge8n	%o1,	%i7,	%g5
	movrgz	%l2,	0x373,	%i5
	wr	%g0,	0xe3,	%asi
	stxa	%o4,	[%l7 + 0x38] %asi
	membar	#Sync
	faligndata	%f28,	%f16,	%f18
	subccc	%o2,	0x03A1,	%o3
	srlx	%l5,	0x10,	%i0
	addccc	%l0,	%o0,	%g1
	fbug,a	%fcc1,	loop_2757
	tg	%xcc,	0x7
	mulscc	%o6,	%i1,	%l4
	udivcc	%o5,	0x0B1D,	%g2
loop_2757:
	edge32ln	%i2,	%l1,	%i6
	movrne	%i4,	0x050,	%l3
	tsubcc	%g4,	0x107C,	%o7
	fnot1	%f26,	%f26
	xorcc	%g6,	%l6,	%i3
	orn	%g7,	%g3,	%o1
	srlx	%g5,	0x0F,	%l2
	fmovrse	%i7,	%f20,	%f22
	fble,a	%fcc0,	loop_2758
	bge,a	loop_2759
	andn	%i5,	%o4,	%o2
	movrlez	%l5,	%o3,	%i0
loop_2758:
	nop
	setx	loop_2760,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2759:
	movrlez	%o0,	0x1D8,	%l0
	sub	%o6,	%i1,	%l4
	edge8n	%o5,	%g1,	%g2
loop_2760:
	andncc	%i2,	%l1,	%i4
	flush	%l7 + 0x0C
	orcc	%i6,	%g4,	%l3
	fpackfix	%f26,	%f18
	tgu	%xcc,	0x3
	movrgez	%g6,	%o7,	%l6
	orn	%g7,	%g3,	%o1
	edge16l	%i3,	%l2,	%i7
	fcmps	%fcc0,	%f30,	%f30
	edge8n	%i5,	%g5,	%o2
	srl	%l5,	0x15,	%o3
	fcmpd	%fcc3,	%f24,	%f2
	set	0x40, %l6
	swapa	[%l7 + %l6] 0x04,	%o4
	addccc	%i0,	0x0339,	%o0
	edge16n	%o6,	%l0,	%i1
	movrne	%o5,	%l4,	%g2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x5F] %asi,	%g1
	bpos	loop_2761
	andncc	%l1,	%i2,	%i6
	fxnors	%f28,	%f9,	%f25
	smul	%i4,	%g4,	%l3
loop_2761:
	fmovsne	%xcc,	%f16,	%f12
	srax	%o7,	%g6,	%l6
	alignaddr	%g3,	%o1,	%i3
	movg	%xcc,	%g7,	%l2
	popc	0x00DD,	%i5
	movl	%icc,	%g5,	%o2
	edge8l	%l5,	%o3,	%i7
	mova	%icc,	%i0,	%o0
	brgz	%o6,	loop_2762
	brnz	%l0,	loop_2763
	edge32l	%o4,	%i1,	%o5
	tg	%xcc,	0x6
loop_2762:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2763:
	bne,pn	%xcc,	loop_2764
	tcs	%icc,	0x5
	array32	%l4,	%g2,	%g1
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x2f,	%i2
loop_2764:
	fornot1	%f0,	%f16,	%f12
	sdivx	%l1,	0x15FD,	%i6
	mulscc	%i4,	0x1A2D,	%g4
	smulcc	%o7,	%l3,	%l6
	fnands	%f12,	%f5,	%f7
	subccc	%g6,	%o1,	%g3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%l2
	stb	%i5,	[%l7 + 0x76]
	taddcctv	%g7,	%o2,	%g5
	std	%o2,	[%l7 + 0x68]
	fmovdcc	%icc,	%f9,	%f20
	sub	%l5,	0x06BC,	%i7
	std	%i0,	[%l7 + 0x30]
	fmovsleu	%icc,	%f14,	%f21
	bcc,pn	%icc,	loop_2765
	ldsh	[%l7 + 0x20],	%o6
	set	0x42, %l5
	stha	%o0,	[%l7 + %l5] 0x27
	membar	#Sync
loop_2765:
	ldd	[%l7 + 0x58],	%f26
	movne	%xcc,	%o4,	%i1
	subc	%l0,	%o5,	%l4
	array32	%g1,	%i2,	%l1
	fpsub32s	%f2,	%f21,	%f12
	alignaddrl	%i6,	%i4,	%g4
	fxnor	%f14,	%f18,	%f8
	bl	loop_2766
	fba,a	%fcc3,	loop_2767
	fnegs	%f25,	%f24
	smulcc	%g2,	%l3,	%o7
loop_2766:
	stb	%g6,	[%l7 + 0x61]
loop_2767:
	ldd	[%l7 + 0x38],	%f4
	movre	%o1,	%l6,	%g3
	membar	0x4F
	movle	%xcc,	%i3,	%l2
	fmuld8ulx16	%f14,	%f17,	%f12
	fmovd	%f2,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x14],	%g7
	sethi	0x0112,	%o2
	nop
	setx	loop_2768,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%g5,	%o3,	%i5
	fbn,a	%fcc2,	loop_2769
	movn	%icc,	%i7,	%i0
loop_2768:
	fmovrsgz	%l5,	%f13,	%f19
	edge32	%o0,	%o6,	%i1
loop_2769:
	std	%f26,	[%l7 + 0x70]
	fxnor	%f12,	%f10,	%f16
	movpos	%icc,	%l0,	%o5
	alignaddr	%o4,	%l4,	%i2
	fbug,a	%fcc3,	loop_2770
	fands	%f21,	%f2,	%f12
	fnands	%f22,	%f28,	%f16
	fmovdneg	%xcc,	%f19,	%f4
loop_2770:
	array8	%l1,	%i6,	%i4
	fsrc1	%f26,	%f0
	bpos,pn	%xcc,	loop_2771
	xnorcc	%g4,	%g2,	%g1
	ldsh	[%l7 + 0x56],	%l3
	bcs	%xcc,	loop_2772
loop_2771:
	fmovscc	%icc,	%f4,	%f27
	edge32ln	%o7,	%o1,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2772:
	lduh	[%l7 + 0x20],	%g3
	edge8l	%i3,	%l2,	%l6
	fandnot1	%f20,	%f28,	%f0
	andncc	%g7,	%g5,	%o3
	tl	%xcc,	0x4
	fbn	%fcc3,	loop_2773
	udiv	%i5,	0x034C,	%o2
	movl	%xcc,	%i7,	%l5
	fpack32	%f22,	%f20,	%f10
loop_2773:
	or	%i0,	0x140E,	%o6
	fbu,a	%fcc0,	loop_2774
	movle	%xcc,	%o0,	%l0
	mova	%xcc,	%o5,	%o4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i1
loop_2774:
	subccc	%l4,	0x0E70,	%i2
	movg	%icc,	%l1,	%i6
	movrgz	%i4,	0x356,	%g2
	fand	%f20,	%f26,	%f18
	tsubcctv	%g4,	0x0542,	%l3
	set	0x77, %g1
	stba	%o7,	[%l7 + %g1] 0x81
	sub	%o1,	%g6,	%g3
	stbar
	ld	[%l7 + 0x7C],	%f5
	brlz	%i3,	loop_2775
	fmovdvc	%icc,	%f7,	%f14
	brgez,a	%l2,	loop_2776
	movre	%l6,	0x13B,	%g1
loop_2775:
	edge32l	%g7,	%o3,	%g5
	fbg	%fcc2,	loop_2777
loop_2776:
	fcmpne32	%f16,	%f12,	%i5
	edge32ln	%o2,	%i7,	%l5
	edge32	%i0,	%o0,	%l0
loop_2777:
	nop
	set	0x2A, %g5
	stha	%o5,	[%l7 + %g5] 0x2b
	membar	#Sync
	fmovdn	%icc,	%f19,	%f4
	ble	%xcc,	loop_2778
	xorcc	%o6,	%i1,	%l4
	edge32ln	%i2,	%l1,	%i6
	brlez,a	%i4,	loop_2779
loop_2778:
	fcmpeq16	%f4,	%f10,	%o4
	fornot2s	%f21,	%f1,	%f15
	brgez,a	%g2,	loop_2780
loop_2779:
	tn	%xcc,	0x2
	andncc	%l3,	%o7,	%g4
	udivcc	%g6,	0x11C9,	%o1
loop_2780:
	bpos,a,pt	%xcc,	loop_2781
	tcc	%xcc,	0x2
	movn	%xcc,	%i3,	%l2
	bgu,a,pn	%icc,	loop_2782
loop_2781:
	fbo	%fcc2,	loop_2783
	fmovsge	%xcc,	%f1,	%f6
	fxors	%f2,	%f19,	%f25
loop_2782:
	alignaddr	%l6,	%g1,	%g7
loop_2783:
	fnot1	%f28,	%f28
	fmovsle	%icc,	%f20,	%f29
	fornot1	%f30,	%f18,	%f18
	movrgez	%g3,	%o3,	%g5
	edge16n	%o2,	%i7,	%l5
	fpadd16	%f28,	%f16,	%f14
	bg,pn	%xcc,	loop_2784
	fabss	%f1,	%f21
	fmovrdlez	%i5,	%f20,	%f16
	movcs	%xcc,	%o0,	%i0
loop_2784:
	brlez	%o5,	loop_2785
	taddcc	%l0,	0x029F,	%i1
	movl	%icc,	%o6,	%l4
	movre	%i2,	%l1,	%i6
loop_2785:
	bcs,a	%icc,	loop_2786
	xorcc	%i4,	0x17B0,	%o4
	bge	%icc,	loop_2787
	alignaddrl	%l3,	%o7,	%g4
loop_2786:
	fmovrsne	%g6,	%f20,	%f24
	set	0x08, %g2
	stda	%o0,	[%l7 + %g2] 0x11
loop_2787:
	orcc	%g2,	0x13C4,	%i3
	movge	%icc,	%l6,	%g1
	fmul8x16	%f5,	%f26,	%f18
	movpos	%xcc,	%g7,	%l2
	movpos	%icc,	%o3,	%g5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x6C] %asi,	%f16
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%o2
	fbg,a	%fcc0,	loop_2788
	fpadd16s	%f18,	%f4,	%f0
	te	%xcc,	0x6
	tneg	%icc,	0x7
loop_2788:
	mova	%xcc,	%i7,	%l5
	bgu,pn	%xcc,	loop_2789
	udivcc	%i5,	0x03F8,	%g3
	alignaddrl	%o0,	%i0,	%l0
	sdivx	%o5,	0x0B03,	%i1
loop_2789:
	fmul8sux16	%f10,	%f4,	%f16
	array32	%l4,	%o6,	%i2
	movg	%xcc,	%l1,	%i4
	or	%i6,	0x17AE,	%o4
	st	%f23,	[%l7 + 0x0C]
	fabsd	%f14,	%f26
	fmovsneg	%icc,	%f28,	%f3
	fabss	%f23,	%f31
	mova	%icc,	%o7,	%g4
	sub	%g6,	%o1,	%g2
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l3
	xnor	%i3,	%g1,	%l6
	tvc	%xcc,	0x0
	tn	%icc,	0x1
	movvs	%icc,	%l2,	%g7
	fnors	%f10,	%f13,	%f22
	bcc,a	loop_2790
	fmul8x16au	%f8,	%f8,	%f14
	fpack32	%f12,	%f14,	%f4
	movge	%icc,	%o3,	%o2
loop_2790:
	fnot1s	%f4,	%f21
	fcmpeq16	%f10,	%f18,	%g5
	fmovrsgz	%l5,	%f12,	%f21
	fcmpeq32	%f20,	%f0,	%i7
	udiv	%i5,	0x122E,	%o0
	tsubcctv	%i0,	0x01E9,	%l0
	alignaddr	%g3,	%i1,	%o5
	tneg	%xcc,	0x0
	sllx	%l4,	0x0B,	%o6
	movg	%icc,	%l1,	%i2
	andncc	%i4,	%i6,	%o7
	ba,pn	%icc,	loop_2791
	fxors	%f11,	%f26,	%f5
	srlx	%g4,	%o4,	%g6
	xnorcc	%g2,	%l3,	%o1
loop_2791:
	sdiv	%g1,	0x1D2F,	%l6
	fmovdcs	%icc,	%f10,	%f28
	orcc	%i3,	0x1830,	%g7
	or	%l2,	%o3,	%g5
	subc	%l5,	%o2,	%i7
	subc	%o0,	%i5,	%i0
	movn	%xcc,	%l0,	%i1
	brnz,a	%o5,	loop_2792
	tle	%xcc,	0x7
	fmovsleu	%xcc,	%f7,	%f28
	bl	loop_2793
loop_2792:
	movrne	%g3,	0x3E2,	%o6
	sdivcc	%l1,	0x1DF3,	%i2
	tcs	%icc,	0x0
loop_2793:
	nop
	set	0x5C, %l2
	lduha	[%l7 + %l2] 0x14,	%l4
	fabss	%f15,	%f7
	sub	%i4,	0x0861,	%o7
	movrlez	%i6,	0x1D2,	%o4
	movleu	%xcc,	%g6,	%g4
	fpack32	%f4,	%f12,	%f20
	membar	0x1F
	sub	%g2,	%l3,	%g1
	fornot2	%f30,	%f2,	%f18
	tn	%icc,	0x1
	ldub	[%l7 + 0x17],	%l6
	lduh	[%l7 + 0x3C],	%o1
	set	0x0E, %i5
	stha	%i3,	[%l7 + %i5] 0x15
	st	%f24,	[%l7 + 0x6C]
	brlz	%l2,	loop_2794
	ta	%xcc,	0x7
	membar	0x0D
	siam	0x6
loop_2794:
	array32	%o3,	%g7,	%g5
	bpos,a,pt	%xcc,	loop_2795
	move	%icc,	%o2,	%i7
	membar	0x01
	movrlez	%o0,	%l5,	%i0
loop_2795:
	and	%l0,	%i1,	%i5
	fpsub16s	%f28,	%f20,	%f9
	edge32ln	%g3,	%o6,	%o5
	fmovrdlz	%i2,	%f30,	%f16
	fmovsneg	%icc,	%f28,	%f26
	edge32	%l1,	%i4,	%o7
	std	%l4,	[%l7 + 0x58]
	edge8n	%o4,	%i6,	%g6
	tne	%icc,	0x4
	movvs	%xcc,	%g2,	%l3
	smul	%g1,	%l6,	%g4
	addc	%o1,	%l2,	%o3
	fmovrsne	%i3,	%f6,	%f12
	movrlz	%g5,	0x20E,	%o2
	movrlz	%g7,	%i7,	%o0
	fmovrdgez	%l5,	%f24,	%f0
	tle	%icc,	0x5
	fpsub16s	%f24,	%f11,	%f26
	mulx	%i0,	0x0FCC,	%l0
	tl	%icc,	0x0
	fmul8x16al	%f18,	%f10,	%f4
	fbu,a	%fcc2,	loop_2796
	bvc	%icc,	loop_2797
	edge8n	%i1,	%i5,	%g3
	tl	%icc,	0x7
loop_2796:
	orncc	%o6,	%i2,	%o5
loop_2797:
	bn	%icc,	loop_2798
	fmovscc	%icc,	%f21,	%f18
	edge32ln	%i4,	%o7,	%l1
	andncc	%o4,	%l4,	%g6
loop_2798:
	movneg	%icc,	%i6,	%g2
	edge32l	%g1,	%l6,	%g4
	addc	%o1,	%l2,	%o3
	movrlez	%l3,	%g5,	%o2
	orn	%g7,	%i7,	%i3
	orn	%l5,	%i0,	%o0
	set	0x55, %g6
	lduba	[%l7 + %g6] 0x15,	%l0
	edge16	%i5,	%i1,	%g3
	fnand	%f28,	%f22,	%f24
	smul	%i2,	%o5,	%o6
	mova	%xcc,	%o7,	%l1
	movl	%xcc,	%o4,	%i4
	subcc	%g6,	0x1CEA,	%i6
	fbo	%fcc1,	loop_2799
	popc	0x1720,	%l4
	addccc	%g2,	0x1E96,	%l6
	nop
	set	0x34, %o6
	stw	%g4,	[%l7 + %o6]
loop_2799:
	fcmple32	%f6,	%f8,	%o1
	tcs	%icc,	0x3
	movgu	%xcc,	%g1,	%o3
	stw	%l3,	[%l7 + 0x30]
	fmul8x16au	%f30,	%f12,	%f12
	bvc,a,pn	%xcc,	loop_2800
	ta	%xcc,	0x7
	xnorcc	%l2,	%g5,	%g7
	sth	%o2,	[%l7 + 0x54]
loop_2800:
	edge32ln	%i3,	%l5,	%i0
	udiv	%o0,	0x006D,	%l0
	ld	[%l7 + 0x70],	%f18
	sll	%i7,	0x15,	%i5
	or	%g3,	0x1B92,	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o5,	%i2
	xnorcc	%o6,	%l1,	%o7
	prefetch	[%l7 + 0x50],	 0x1
	bcs,a	%xcc,	loop_2801
	ldd	[%l7 + 0x68],	%i4
	umul	%o4,	%g6,	%l4
	fba	%fcc3,	loop_2802
loop_2801:
	tcc	%xcc,	0x7
	tge	%icc,	0x2
	addccc	%i6,	0x1D71,	%l6
loop_2802:
	fblg	%fcc3,	loop_2803
	srl	%g4,	0x19,	%g2
	fba	%fcc3,	loop_2804
	smulcc	%o1,	0x16F2,	%g1
loop_2803:
	fmovdl	%xcc,	%f21,	%f7
	movge	%xcc,	%o3,	%l2
loop_2804:
	fbg,a	%fcc2,	loop_2805
	edge32n	%g5,	%g7,	%l3
	xorcc	%i3,	%l5,	%i0
	fmovrslez	%o0,	%f24,	%f13
loop_2805:
	fbug,a	%fcc3,	loop_2806
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7C, %l3
	stwa	%l0,	[%l7 + %l3] 0x80
loop_2806:
	bcc,a	loop_2807
	ta	%xcc,	0x7
	edge16l	%o2,	%i5,	%g3
	edge16l	%i1,	%i7,	%o5
loop_2807:
	fnands	%f13,	%f31,	%f2
	tsubcc	%i2,	%o6,	%l1
	fbuge,a	%fcc3,	loop_2808
	srlx	%o7,	0x0A,	%i4
	addc	%g6,	%l4,	%o4
	wr	%g0,	0x11,	%asi
	sta	%f16,	[%l7 + 0x6C] %asi
loop_2808:
	tle	%icc,	0x2
	movrlez	%l6,	%i6,	%g2
	bcs,a	%icc,	loop_2809
	edge32	%o1,	%g1,	%g4
	fcmpeq32	%f6,	%f26,	%l2
	edge8n	%o3,	%g5,	%l3
loop_2809:
	bpos,a,pn	%icc,	loop_2810
	fpadd32s	%f8,	%f1,	%f20
	edge8l	%i3,	%g7,	%l5
	fmovdneg	%icc,	%f5,	%f25
loop_2810:
	sub	%i0,	%o0,	%l0
	fmovda	%xcc,	%f6,	%f9
	fcmpes	%fcc1,	%f22,	%f5
	fmovdleu	%xcc,	%f13,	%f6
	andncc	%o2,	%i5,	%g3
	subcc	%i1,	%o5,	%i7
	ta	%icc,	0x1
	tpos	%icc,	0x4
	subcc	%o6,	0x09A5,	%i2
	fors	%f26,	%f17,	%f17
	movl	%icc,	%o7,	%l1
	fnands	%f19,	%f3,	%f19
	movleu	%icc,	%g6,	%i4
	xnor	%o4,	0x1551,	%l4
	set	0x4C, %g4
	sta	%f25,	[%l7 + %g4] 0x15
	addc	%l6,	0x1E87,	%g2
	sir	0x1919
	sdivx	%i6,	0x00F7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x6C, %o7
	stw	%g4,	[%l7 + %o7]
	subc	%l2,	%o3,	%o1
	set	0x19, %i2
	lduba	[%l7 + %i2] 0x88,	%g5
	movle	%xcc,	%i3,	%g7
	andncc	%l3,	%l5,	%i0
	set	0x1C, %i6
	stha	%o0,	[%l7 + %i6] 0x15
	movre	%o2,	%l0,	%g3
	tsubcc	%i1,	%i5,	%o5
	ble,a	loop_2811
	smul	%i7,	%o6,	%o7
	wr	%g0,	0x80,	%asi
	stda	%i2,	[%l7 + 0x28] %asi
loop_2811:
	edge32l	%g6,	%l1,	%i4
	ba,pt	%xcc,	loop_2812
	sdivcc	%o4,	0x1F3F,	%l6
	nop
	setx	loop_2813,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%l4,	%g2,	%i6
loop_2812:
	umul	%g4,	0x0885,	%g1
	tleu	%icc,	0x7
loop_2813:
	tne	%icc,	0x6
	movle	%xcc,	%l2,	%o1
	tne	%icc,	0x3
	smul	%g5,	%i3,	%g7
	edge8ln	%o3,	%l3,	%l5
	tneg	%icc,	0x6
	bneg,pt	%icc,	loop_2814
	edge8n	%o0,	%i0,	%o2
	edge16n	%l0,	%i1,	%i5
	fabsd	%f12,	%f8
loop_2814:
	and	%o5,	%i7,	%g3
	sir	0x19AD
	sethi	0x0494,	%o7
	sdiv	%o6,	0x1A12,	%i2
	movne	%xcc,	%l1,	%g6
	fbg,a	%fcc1,	loop_2815
	fmuld8ulx16	%f26,	%f18,	%f18
	movrgez	%i4,	%l6,	%l4
	movgu	%xcc,	%o4,	%i6
loop_2815:
	udiv	%g4,	0x1DE4,	%g1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g2,	%o1
	fmovrsne	%g5,	%f20,	%f25
	fxnors	%f2,	%f2,	%f26
	fmovsle	%icc,	%f3,	%f8
	tpos	%icc,	0x2
	pdist	%f10,	%f14,	%f18
	fmovrsgz	%l2,	%f5,	%f17
	fmovrse	%g7,	%f22,	%f29
	fsrc1s	%f8,	%f13
	movl	%icc,	%o3,	%i3
	srlx	%l5,	%l3,	%i0
	movcc	%icc,	%o0,	%o2
	movvc	%icc,	%l0,	%i5
	set	0x58, %l0
	stda	%o4,	[%l7 + %l0] 0x10
	movl	%xcc,	%i7,	%g3
	fble,a	%fcc2,	loop_2816
	add	%i1,	%o7,	%i2
	xor	%o6,	%g6,	%l1
	fmuld8ulx16	%f26,	%f6,	%f0
loop_2816:
	udiv	%i4,	0x0075,	%l4
	set	0x30, %o4
	stxa	%o4,	[%l7 + %o4] 0x15
	sllx	%l6,	0x07,	%g4
	xnor	%i6,	%g1,	%o1
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x04
	andn	%g5,	%g2,	%g7
	sth	%o3,	[%l7 + 0x1E]
	nop
	setx loop_2817, %l0, %l1
	jmpl %l1, %l2
	fmul8x16au	%f22,	%f6,	%f24
	tg	%xcc,	0x5
	movn	%xcc,	%i3,	%l3
loop_2817:
	fmovdcs	%icc,	%f6,	%f13
	addccc	%i0,	0x0EF3,	%l5
	ta	%icc,	0x3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%o0
	alignaddrl	%o2,	%i5,	%o5
	ble,a,pt	%xcc,	loop_2818
	edge32ln	%l0,	%g3,	%i1
	fsrc2s	%f19,	%f11
	addc	%i7,	%i2,	%o6
loop_2818:
	sdivcc	%g6,	0x0B3A,	%o7
	array16	%i4,	%l1,	%o4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xe3,	%l4
	smulcc	%g4,	0x198A,	%i6
	edge8ln	%l6,	%o1,	%g5
	bcs,a,pn	%xcc,	loop_2819
	movcs	%xcc,	%g1,	%g7
	brz,a	%o3,	loop_2820
	lduw	[%l7 + 0x1C],	%g2
loop_2819:
	ta	%icc,	0x2
	fmovdl	%xcc,	%f8,	%f3
loop_2820:
	orcc	%i3,	%l2,	%l3
	edge16n	%l5,	%i0,	%o0
	bleu	%icc,	loop_2821
	movrgez	%o2,	%o5,	%i5
	fmul8x16al	%f9,	%f13,	%f24
	tl	%xcc,	0x5
loop_2821:
	udivcc	%l0,	0x1E67,	%g3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	tne	%xcc,	0x1
	fmovscc	%xcc,	%f29,	%f8
	fba	%fcc3,	loop_2822
	fmul8x16au	%f25,	%f24,	%f26
	membar	0x7C
	std	%i2,	[%l7 + 0x30]
loop_2822:
	fpsub16	%f30,	%f18,	%f24
	brgz	%i7,	loop_2823
	mulx	%o6,	%o7,	%g6
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2823:
	fmovsn	%icc,	%f12,	%f18
	movrlez	%i4,	%o4,	%l1
	ldsh	[%l7 + 0x7A],	%l4
	siam	0x2
	movre	%g4,	%i6,	%l6
	xnor	%o1,	%g1,	%g7
	fmovrse	%g5,	%f23,	%f31
	fmovrslez	%g2,	%f22,	%f0
	be,a	%icc,	loop_2824
	orn	%i3,	%o3,	%l2
	fbul,a	%fcc3,	loop_2825
	fmuld8ulx16	%f11,	%f14,	%f0
loop_2824:
	fmovs	%f27,	%f5
	fone	%f26
loop_2825:
	movgu	%xcc,	%l3,	%l5
	tleu	%xcc,	0x6
	membar	0x09
	movleu	%xcc,	%o0,	%i0
	tn	%icc,	0x7
	movpos	%xcc,	%o5,	%i5
	wr	%g0,	0x23,	%asi
	stxa	%o2,	[%l7 + 0x08] %asi
	membar	#Sync
	movl	%xcc,	%l0,	%g3
	fxnor	%f10,	%f22,	%f8
	stx	%i1,	[%l7 + 0x68]
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x11,	%i2
	ta	%icc,	0x4
	fornot2s	%f8,	%f23,	%f12
	and	%o6,	%i7,	%o7
	tvc	%icc,	0x2
	brz	%g6,	loop_2826
	movvc	%icc,	%o4,	%i4
	or	%l1,	0x06D9,	%l4
	movre	%i6,	0x140,	%g4
loop_2826:
	sir	0x1793
	fmovdgu	%icc,	%f15,	%f16
	std	%f20,	[%l7 + 0x18]
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x11,	 0x1
	taddcctv	%g1,	%l6,	%g7
	fmovsge	%icc,	%f14,	%f15
	umul	%g5,	%i3,	%o3
	smulcc	%g2,	%l3,	%l5
	orncc	%o0,	0x1976,	%i0
	fbo	%fcc2,	loop_2827
	fmovdvs	%xcc,	%f26,	%f3
	fsrc1s	%f2,	%f25
	edge16n	%o5,	%l2,	%i5
loop_2827:
	ldd	[%l7 + 0x40],	%o2
	fbu,a	%fcc2,	loop_2828
	subccc	%l0,	%g3,	%i1
	fpack16	%f10,	%f22
	fbue	%fcc0,	loop_2829
loop_2828:
	bvc,pn	%xcc,	loop_2830
	movleu	%xcc,	%i2,	%i7
	nop
	set	0x12, %o1
	ldstub	[%l7 + %o1],	%o7
loop_2829:
	movre	%g6,	%o6,	%i4
loop_2830:
	fmovrsne	%o4,	%f20,	%f15
	sra	%l1,	0x14,	%l4
	fmovdneg	%icc,	%f30,	%f26
	movrgz	%g4,	%i6,	%o1
	xor	%l6,	%g7,	%g1
	fbe	%fcc1,	loop_2831
	fmovrse	%g5,	%f13,	%f8
	movrlez	%i3,	0x2F8,	%g2
	siam	0x5
loop_2831:
	mulscc	%o3,	%l5,	%l3
	edge32n	%i0,	%o0,	%o5
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	array8	%l2,	%i5,	%l0
	edge8ln	%o2,	%i1,	%i2
	fbg,a	%fcc1,	loop_2832
	xorcc	%g3,	%o7,	%i7
	fmovrsgz	%g6,	%f14,	%f31
	tcc	%icc,	0x3
loop_2832:
	tvc	%icc,	0x7
	fcmpne32	%f20,	%f24,	%o6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%l1
	movn	%xcc,	%l4,	%o4
	tl	%xcc,	0x1
	xnorcc	%i6,	%o1,	%g4
	edge32ln	%l6,	%g7,	%g1
	sir	0x0F4A
	alignaddr	%i3,	%g5,	%g2
	fcmps	%fcc0,	%f12,	%f25
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x3A] %asi,	%l5
	ldsb	[%l7 + 0x75],	%l3
	ld	[%l7 + 0x68],	%f22
	fmovsn	%xcc,	%f7,	%f12
	fmovdne	%icc,	%f29,	%f30
	fbuge	%fcc0,	loop_2833
	tne	%icc,	0x3
	fsrc1	%f30,	%f20
	fmovse	%icc,	%f23,	%f12
loop_2833:
	fmovdn	%icc,	%f7,	%f9
	fpadd32s	%f1,	%f31,	%f23
	fcmple16	%f22,	%f28,	%i0
	andcc	%o0,	0x173C,	%o5
	edge8l	%l2,	%o3,	%l0
	stw	%i5,	[%l7 + 0x18]
	edge16n	%o2,	%i2,	%g3
	ldsw	[%l7 + 0x58],	%o7
	andncc	%i1,	%g6,	%o6
	smul	%i4,	%i7,	%l1
	tvc	%icc,	0x3
	fmovrdlz	%l4,	%f10,	%f26
	movrlez	%i6,	%o4,	%o1
	fblg,a	%fcc3,	loop_2834
	fmovdle	%icc,	%f6,	%f23
	mova	%xcc,	%l6,	%g7
	xor	%g4,	%i3,	%g1
loop_2834:
	fblg	%fcc3,	loop_2835
	tcc	%xcc,	0x2
	smulcc	%g5,	0x1B40,	%g2
	addc	%l5,	0x1336,	%l3
loop_2835:
	sllx	%o0,	0x0E,	%i0
	stw	%l2,	[%l7 + 0x24]
	sll	%o5,	%l0,	%i5
	xnor	%o2,	%i2,	%g3
	fpsub16s	%f26,	%f15,	%f31
	tcs	%xcc,	0x6
	fmovsn	%xcc,	%f12,	%f1
	xnor	%o7,	0x0302,	%i1
	array8	%g6,	%o3,	%i4
	te	%icc,	0x2
	st	%f1,	[%l7 + 0x08]
	tne	%icc,	0x5
	st	%f0,	[%l7 + 0x18]
	bvc,pn	%icc,	loop_2836
	srax	%o6,	0x11,	%l1
	add	%l4,	%i7,	%i6
	sdivcc	%o4,	0x0628,	%l6
loop_2836:
	movge	%xcc,	%g7,	%g4
	fcmpne32	%f20,	%f30,	%o1
	taddcctv	%g1,	0x15CE,	%i3
	fsrc2s	%f23,	%f5
	nop
	set	0x28, %l1
	stw	%g5,	[%l7 + %l1]
	wr	%g0,	0x89,	%asi
	stxa	%g2,	[%l7 + 0x58] %asi
	tvs	%icc,	0x6
	addccc	%l3,	%l5,	%i0
	set	0x2F, %i1
	ldsba	[%l7 + %i1] 0x04,	%l2
	umul	%o0,	0x064B,	%l0
	tgu	%xcc,	0x6
	movrlz	%i5,	%o5,	%o2
	edge32ln	%i2,	%g3,	%o7
	sth	%i1,	[%l7 + 0x7C]
	fsrc2	%f2,	%f8
	sethi	0x1C12,	%g6
	movrlz	%o3,	0x301,	%o6
	fnors	%f8,	%f27,	%f14
	movvc	%xcc,	%l1,	%i4
	fcmpne32	%f16,	%f16,	%l4
	move	%xcc,	%i7,	%o4
	fcmped	%fcc3,	%f16,	%f14
	smulcc	%l6,	0x0E17,	%g7
	movrlz	%i6,	%g4,	%g1
	and	%i3,	0x0F07,	%g5
	fmovscs	%xcc,	%f15,	%f5
	subcc	%g2,	0x0CEC,	%l3
	udivx	%l5,	0x0D43,	%i0
	orn	%o1,	%o0,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l2,	[%l7 + 0x14]
	fmovscc	%icc,	%f3,	%f11
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tcc	%icc,	0x6
	udivx	%i5,	0x184E,	%o5
	tneg	%icc,	0x2
	edge32	%i2,	%g3,	%o2
	fmovdne	%icc,	%f11,	%f13
	brz	%i1,	loop_2837
	fmovrdgz	%o7,	%f12,	%f2
	andncc	%o3,	%g6,	%l1
	edge32	%i4,	%l4,	%i7
loop_2837:
	fmovdpos	%icc,	%f7,	%f8
	fbuge,a	%fcc1,	loop_2838
	fnot1s	%f26,	%f12
	fmul8ulx16	%f4,	%f12,	%f14
	umulcc	%o4,	0x0D2D,	%o6
loop_2838:
	nop
	setx	loop_2839,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%g7,	0x02AA,	%l6
	fmovrdlz	%g4,	%f20,	%f0
	fornot1	%f22,	%f6,	%f20
loop_2839:
	fmuld8ulx16	%f22,	%f5,	%f24
	edge16l	%g1,	%i6,	%g5
	xnor	%i3,	0x0E96,	%l3
	mulx	%g2,	%l5,	%o1
	edge32l	%i0,	%o0,	%l2
	std	%l0,	[%l7 + 0x38]
	xnorcc	%o5,	0x0823,	%i2
	ldd	[%l7 + 0x30],	%i4
	tcs	%icc,	0x1
	tcc	%xcc,	0x2
	movre	%g3,	%o2,	%i1
	sra	%o7,	0x1C,	%o3
	orncc	%g6,	%i4,	%l1
	bg	loop_2840
	srl	%l4,	%o4,	%i7
	movcc	%xcc,	%o6,	%g7
	fmovrslz	%l6,	%f27,	%f1
loop_2840:
	array16	%g1,	%i6,	%g5
	sethi	0x0F86,	%g4
	stbar
	tsubcc	%i3,	%l3,	%g2
	std	%f30,	[%l7 + 0x08]
	edge32l	%o1,	%i0,	%o0
	movre	%l2,	%l5,	%o5
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fcmpne32	%f20,	%f14,	%i2
	brgez	%i5,	loop_2841
	popc	0x194A,	%l0
	nop
	setx	loop_2842,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f26,	%f30
loop_2841:
	subcc	%o2,	%g3,	%i1
	movre	%o7,	0x18A,	%g6
loop_2842:
	sdivx	%i4,	0x0BDB,	%l1
	alignaddrl	%o3,	%l4,	%i7
	fmovde	%icc,	%f26,	%f13
	umul	%o6,	%o4,	%g7
	movg	%icc,	%g1,	%l6
	tcc	%xcc,	0x0
	xnor	%i6,	0x0C81,	%g4
	movrlz	%g5,	0x120,	%i3
	subccc	%g2,	0x02CC,	%l3
	ba	loop_2843
	edge8l	%i0,	%o0,	%l2
	tsubcc	%l5,	%o5,	%i2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o1,	%l0
loop_2843:
	tpos	%xcc,	0x3
	bvc	loop_2844
	fmovrsgez	%i5,	%f4,	%f0
	addc	%g3,	%i1,	%o7
	fbn,a	%fcc2,	loop_2845
loop_2844:
	bcs,a,pt	%xcc,	loop_2846
	movrgz	%o2,	0x114,	%g6
	addccc	%i4,	0x04D7,	%o3
loop_2845:
	bg,pt	%icc,	loop_2847
loop_2846:
	tl	%xcc,	0x7
	bn,a	%icc,	loop_2848
	tneg	%xcc,	0x1
loop_2847:
	fmovdvc	%xcc,	%f0,	%f14
	smulcc	%l4,	%l1,	%i7
loop_2848:
	fnegd	%f22,	%f26
	swap	[%l7 + 0x70],	%o6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x16] %asi,	%o4
	edge32n	%g7,	%l6,	%g1
	fmovdpos	%xcc,	%f27,	%f17
	brgez,a	%i6,	loop_2849
	tneg	%icc,	0x1
	fbule	%fcc1,	loop_2850
	subcc	%g5,	%i3,	%g4
loop_2849:
	addcc	%l3,	0x176A,	%i0
	fmovd	%f2,	%f20
loop_2850:
	fones	%f23
	set	0x16, %o5
	ldsha	[%l7 + %o5] 0x81,	%o0
	fmul8x16au	%f10,	%f2,	%f4
	fpsub16s	%f14,	%f31,	%f7
	edge8	%l2,	%l5,	%g2
	fmovdcs	%xcc,	%f6,	%f28
	addc	%o5,	%o1,	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i5
	smulcc	%i1,	0x1288,	%g3
	edge16n	%o7,	%g6,	%i4
	movrlez	%o2,	0x0B6,	%o3
	movneg	%xcc,	%l1,	%l4
	movrlz	%o6,	%i7,	%o4
	bshuffle	%f22,	%f4,	%f16
	move	%icc,	%g7,	%l6
	edge32n	%i6,	%g1,	%i3
	std	%f2,	[%l7 + 0x38]
	movcc	%icc,	%g4,	%g5
	tge	%xcc,	0x1
	fbu	%fcc1,	loop_2851
	fmul8sux16	%f8,	%f24,	%f14
	udivx	%l3,	0x1195,	%i0
	srlx	%l2,	0x06,	%o0
loop_2851:
	fmovdpos	%icc,	%f13,	%f8
	ldub	[%l7 + 0x72],	%g2
	udivcc	%o5,	0x06DD,	%l5
	fpack16	%f22,	%f20
	edge16l	%o1,	%l0,	%i5
	movrgez	%i1,	0x2E7,	%g3
	te	%xcc,	0x2
	smul	%o7,	%i2,	%g6
	edge16ln	%o2,	%o3,	%l1
	fmovrslz	%l4,	%f25,	%f22
	fbn	%fcc2,	loop_2852
	sir	0x0F62
	tsubcc	%i4,	%i7,	%o4
	brgz,a	%o6,	loop_2853
loop_2852:
	sllx	%l6,	0x0E,	%i6
	taddcctv	%g1,	%i3,	%g7
	fpadd16	%f4,	%f26,	%f24
loop_2853:
	tpos	%icc,	0x6
	tvs	%icc,	0x0
	ldstub	[%l7 + 0x29],	%g5
	fble	%fcc2,	loop_2854
	fbug	%fcc0,	loop_2855
	fnand	%f22,	%f30,	%f28
	fmovsa	%icc,	%f9,	%f2
loop_2854:
	stb	%l3,	[%l7 + 0x26]
loop_2855:
	movge	%icc,	%i0,	%l2
	fpsub16	%f10,	%f6,	%f12
	ble,a,pn	%xcc,	loop_2856
	fmovdl	%icc,	%f24,	%f20
	fblg,a	%fcc0,	loop_2857
	tcc	%xcc,	0x3
loop_2856:
	orcc	%g4,	0x0297,	%g2
	tgu	%xcc,	0x0
loop_2857:
	subc	%o0,	%l5,	%o5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	ldd	[%l7 + 0x40],	%l0
	umul	%i1,	0x0F5E,	%g3
	subccc	%o7,	0x0B3D,	%i2
	tne	%icc,	0x2
	tneg	%xcc,	0x6
	nop
	setx	loop_2858,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i5,	0x13F,	%g6
	tpos	%icc,	0x7
	fmovrdgz	%o2,	%f12,	%f10
loop_2858:
	smulcc	%o3,	0x19B8,	%l4
	tsubcc	%l1,	%i7,	%i4
	faligndata	%f10,	%f10,	%f24
	move	%icc,	%o4,	%o6
	flush	%l7 + 0x64
	fmovsgu	%xcc,	%f31,	%f9
	fmovdvc	%icc,	%f12,	%f31
	umul	%l6,	0x0782,	%g1
	xnor	%i6,	0x0196,	%i3
	bgu,a,pn	%xcc,	loop_2859
	movg	%xcc,	%g7,	%l3
	fbo	%fcc0,	loop_2860
	movn	%icc,	%i0,	%g5
loop_2859:
	ldd	[%l7 + 0x28],	%l2
	xnorcc	%g4,	0x0AE8,	%g2
loop_2860:
	movvc	%xcc,	%l5,	%o5
	edge32	%o0,	%o1,	%i1
	movrgez	%l0,	0x03A,	%o7
	edge32n	%i2,	%g3,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g6,	%o2,	%o3
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	movgu	%icc,	%l1,	%i7
	membar	0x25
	orcc	%i4,	0x17C4,	%o4
	edge32	%l6,	%o6,	%g1
	udiv	%i6,	0x17AA,	%i3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x2C] %asi,	%f19
	sdiv	%l3,	0x14CE,	%g7
	fmovrsgz	%g5,	%f31,	%f2
	movge	%xcc,	%i0,	%g4
	ta	%xcc,	0x6
	edge16n	%l2,	%g2,	%o5
	smul	%o0,	%l5,	%i1
	tvc	%icc,	0x7
	fbge,a	%fcc1,	loop_2861
	ba	loop_2862
	addcc	%o1,	0x176B,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%l0
loop_2861:
	fcmpgt16	%f16,	%f20,	%i5
loop_2862:
	fbne	%fcc3,	loop_2863
	fnor	%f14,	%f0,	%f12
	edge16	%g3,	%o2,	%o3
	movcs	%xcc,	%l4,	%g6
loop_2863:
	fbo,a	%fcc0,	loop_2864
	alignaddrl	%l1,	%i4,	%i7
	orn	%o4,	%o6,	%l6
	move	%xcc,	%i6,	%g1
loop_2864:
	nop
	setx	loop_2865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ld	[%l7 + 0x5C],	%f9
	fnot2s	%f11,	%f18
	tle	%icc,	0x7
loop_2865:
	fbug	%fcc3,	loop_2866
	add	%i3,	0x0EFB,	%l3
	srlx	%g7,	%g5,	%i0
	fzero	%f28
loop_2866:
	tcs	%icc,	0x5
	brnz	%l2,	loop_2867
	array32	%g4,	%g2,	%o5
	lduh	[%l7 + 0x14],	%l5
	sdiv	%o0,	0x1C8A,	%o1
loop_2867:
	sll	%i1,	%o7,	%l0
	fpadd32s	%f30,	%f7,	%f6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x24] %asi,	%i5
	tvc	%icc,	0x1
	taddcc	%i2,	%g3,	%o2
	movrgez	%l4,	%o3,	%g6
	movrgez	%l1,	%i4,	%i7
	fmovrdne	%o6,	%f10,	%f24
	movl	%xcc,	%o4,	%l6
	umul	%i6,	0x1CE1,	%g1
	andncc	%i3,	%g7,	%g5
	andn	%i0,	%l2,	%g4
	xnor	%l3,	%o5,	%l5
	nop
	setx loop_2868, %l0, %l1
	jmpl %l1, %o0
	xorcc	%o1,	%g2,	%i1
	sub	%o7,	%i5,	%l0
	movrlez	%i2,	%g3,	%o2
loop_2868:
	array8	%o3,	%l4,	%g6
	edge8	%l1,	%i4,	%o6
	fbe	%fcc0,	loop_2869
	edge16n	%o4,	%l6,	%i7
	or	%g1,	0x046C,	%i6
	udiv	%g7,	0x0800,	%g5
loop_2869:
	popc	0x014A,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	array8	%i0,	%l3,	%g4
	membar	0x6F
	orcc	%o5,	%o0,	%l5
	for	%f24,	%f8,	%f28
	taddcc	%o1,	%i1,	%g2
	tcc	%xcc,	0x2
	addcc	%i5,	0x0882,	%l0
	sir	0x0FB0
	fmovrsne	%i2,	%f25,	%f9
	edge16n	%g3,	%o2,	%o3
	srlx	%l4,	%o7,	%g6
	tn	%xcc,	0x7
	move	%icc,	%i4,	%l1
	set	0x28, %i4
	ldsba	[%l7 + %i4] 0x88,	%o6
	array32	%l6,	%o4,	%i7
	movne	%xcc,	%g1,	%i6
	orcc	%g5,	%i3,	%l2
	popc	0x0CAF,	%i0
	udivcc	%l3,	0x12DB,	%g7
	movn	%xcc,	%g4,	%o5
	alignaddrl	%l5,	%o0,	%o1
	tge	%icc,	0x0
	movrlz	%g2,	0x15C,	%i1
	ld	[%l7 + 0x18],	%f9
	be,a,pt	%xcc,	loop_2870
	srlx	%l0,	0x18,	%i5
	set	0x70, %g7
	sta	%f16,	[%l7 + %g7] 0x88
loop_2870:
	fblg,a	%fcc3,	loop_2871
	fmovrse	%g3,	%f10,	%f29
	ta	%icc,	0x6
	wr	%g0,	0x89,	%asi
	stwa	%o2,	[%l7 + 0x30] %asi
loop_2871:
	tcs	%xcc,	0x4
	fmovdn	%xcc,	%f16,	%f3
	fmovrdlz	%i2,	%f14,	%f2
	mulscc	%o3,	0x0AAA,	%l4
	fcmped	%fcc3,	%f10,	%f20
	nop
	setx loop_2872, %l0, %l1
	jmpl %l1, %g6
	popc	0x085C,	%i4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o6
loop_2872:
	fbu	%fcc2,	loop_2873
	stbar
	for	%f14,	%f12,	%f24
	tsubcc	%l1,	0x1668,	%o4
loop_2873:
	ldsb	[%l7 + 0x30],	%i7
	taddcc	%l6,	%g1,	%i6
	fxor	%f8,	%f30,	%f10
	movrne	%g5,	0x37A,	%l2
	tle	%icc,	0x2
	tvc	%icc,	0x0
	addccc	%i3,	%i0,	%l3
	ldsb	[%l7 + 0x51],	%g4
	tg	%icc,	0x7
	fzero	%f28
	umulcc	%o5,	%l5,	%g7
	ta	%icc,	0x2
	sethi	0x12A9,	%o0
	fnors	%f9,	%f30,	%f9
	xnorcc	%g2,	%o1,	%l0
	edge32ln	%i5,	%g3,	%i1
	orcc	%i2,	%o2,	%o3
	addc	%g6,	0x141E,	%i4
	tcs	%xcc,	0x6
	orn	%l4,	%o7,	%l1
	fbo,a	%fcc2,	loop_2874
	or	%o4,	%o6,	%i7
	ba,a,pn	%icc,	loop_2875
	std	%f20,	[%l7 + 0x18]
loop_2874:
	edge8l	%g1,	%l6,	%g5
	fmovdvc	%icc,	%f19,	%f7
loop_2875:
	fmovsneg	%icc,	%f30,	%f28
	fcmpeq16	%f2,	%f12,	%l2
	edge16	%i6,	%i3,	%l3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x17
	membar	#Sync
	srl	%g4,	%o5,	%i0
	bpos,a,pt	%xcc,	loop_2876
	xnor	%g7,	%o0,	%l5
	tvc	%icc,	0x2
	brlz,a	%o1,	loop_2877
loop_2876:
	tl	%icc,	0x3
	stx	%g2,	[%l7 + 0x78]
	tn	%icc,	0x2
loop_2877:
	or	%l0,	0x1832,	%g3
	sir	0x0B99
	umulcc	%i5,	0x040A,	%i2
	mova	%icc,	%i1,	%o3
	sethi	0x1412,	%g6
	orn	%i4,	0x0EBE,	%l4
	lduh	[%l7 + 0x5C],	%o7
	set	0x30, %g3
	stda	%l0,	[%l7 + %g3] 0x88
	fsrc2s	%f7,	%f0
	add	%o2,	0x0053,	%o6
	fbe,a	%fcc1,	loop_2878
	popc	%i7,	%o4
	bshuffle	%f22,	%f6,	%f12
	andcc	%g1,	0x04C8,	%g5
loop_2878:
	tne	%xcc,	0x5
	tge	%xcc,	0x2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l2,	%i6
	xor	%l6,	0x1873,	%i3
	tneg	%icc,	0x1
	srlx	%g4,	0x0B,	%l3
	fmovde	%icc,	%f22,	%f24
	srlx	%o5,	%i0,	%g7
	alignaddr	%l5,	%o1,	%g2
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udivcc	%o0,	0x0741,	%l0
	brgez	%i5,	loop_2879
	movpos	%xcc,	%i2,	%i1
	set	0x58, %o0
	lduwa	[%l7 + %o0] 0x04,	%o3
loop_2879:
	sdiv	%g6,	0x0E9D,	%i4
	movrgz	%l4,	%o7,	%g3
	nop
	setx	loop_2880,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%icc,	%o2,	%o6
	srax	%l1,	0x02,	%o4
	subcc	%g1,	0x1839,	%g5
loop_2880:
	bg,a	%icc,	loop_2881
	taddcc	%i7,	%i6,	%l6
	movcc	%icc,	%l2,	%g4
	pdist	%f16,	%f24,	%f10
loop_2881:
	udiv	%i3,	0x1601,	%l3
	ldub	[%l7 + 0x5D],	%i0
	movle	%xcc,	%o5,	%g7
	tsubcctv	%l5,	0x08F1,	%o1
	movrgz	%o0,	%l0,	%g2
	brlz,a	%i5,	loop_2882
	fmovdn	%icc,	%f9,	%f2
	nop
	setx loop_2883, %l0, %l1
	jmpl %l1, %i1
	orn	%o3,	%g6,	%i4
loop_2882:
	fpsub16	%f26,	%f28,	%f6
	sir	0x172F
loop_2883:
	fmovdleu	%xcc,	%f24,	%f2
	movre	%i2,	%l4,	%g3
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x4E] %asi,	%o7
	alignaddr	%o6,	%o2,	%l1
	array8	%g1,	%g5,	%o4
	fnor	%f28,	%f16,	%f28
	fand	%f10,	%f0,	%f10
	movge	%icc,	%i6,	%i7
	xnorcc	%l6,	%l2,	%g4
	wr	%g0,	0x81,	%asi
	stwa	%l3,	[%l7 + 0x7C] %asi
	fands	%f11,	%f26,	%f10
	fnands	%f2,	%f13,	%f20
	srax	%i0,	%o5,	%g7
	std	%i2,	[%l7 + 0x18]
	tsubcctv	%o1,	0x08CD,	%o0
	xor	%l0,	0x05BE,	%l5
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x7D] %asi,	%i5
	fbne,a	%fcc0,	loop_2884
	add	%g2,	0x06A7,	%o3
	sir	0x0F38
	xnorcc	%g6,	%i4,	%i1
loop_2884:
	fbne,a	%fcc1,	loop_2885
	fmovdg	%icc,	%f15,	%f6
	fpsub16	%f16,	%f2,	%f22
	fpsub32	%f4,	%f4,	%f16
loop_2885:
	fbue,a	%fcc2,	loop_2886
	movrgz	%i2,	0x002,	%l4
	stw	%o7,	[%l7 + 0x7C]
	array8	%o6,	%g3,	%o2
loop_2886:
	subcc	%l1,	0x1C3E,	%g5
	move	%icc,	%g1,	%o4
	bneg,pn	%icc,	loop_2887
	udiv	%i6,	0x0E32,	%i7
	ta	%icc,	0x1
	set	0x48, %l6
	swapa	[%l7 + %l6] 0x18,	%l6
loop_2887:
	ta	%xcc,	0x1
	alignaddr	%l2,	%g4,	%i0
	fmovdleu	%xcc,	%f30,	%f13
	bleu,a,pn	%icc,	loop_2888
	movrlz	%l3,	%g7,	%o5
	sethi	0x00F3,	%o1
	movneg	%xcc,	%o0,	%i3
loop_2888:
	sdiv	%l0,	0x1DD6,	%i5
	taddcctv	%l5,	0x0608,	%g2
	tgu	%xcc,	0x4
	fexpand	%f17,	%f2
	smul	%g6,	0x1764,	%o3
	sllx	%i1,	%i2,	%i4
	alignaddr	%o7,	%l4,	%g3
	fands	%f19,	%f6,	%f21
	movle	%icc,	%o6,	%o2
	movne	%xcc,	%g5,	%g1
	movleu	%icc,	%l1,	%i6
	brlez,a	%o4,	loop_2889
	membar	0x66
	ldub	[%l7 + 0x5C],	%i7
	srax	%l2,	%l6,	%i0
loop_2889:
	fxors	%f14,	%f25,	%f26
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l3,	%g7
	tcs	%xcc,	0x1
	alignaddr	%g4,	%o1,	%o5
	tge	%xcc,	0x2
	subc	%i3,	0x0064,	%o0
	srl	%i5,	%l5,	%g2
	mulx	%g6,	0x13D1,	%o3
	nop
	set	0x54, %i3
	prefetch	[%l7 + %i3],	 0x2
	set	0x20, %l5
	lda	[%l7 + %l5] 0x04,	%f5
	udivcc	%l0,	0x15EE,	%i2
	fmovsleu	%icc,	%f23,	%f7
	fcmpgt32	%f12,	%f2,	%i1
	sll	%i4,	0x15,	%o7
	te	%icc,	0x4
	movrgz	%g3,	%o6,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l4,	%g1
	array8	%l1,	%i6,	%g5
	edge8n	%i7,	%o4,	%l6
	umul	%l2,	%i0,	%l3
	be,a,pt	%xcc,	loop_2890
	mulscc	%g4,	%g7,	%o1
	fbn	%fcc2,	loop_2891
	fpsub16s	%f13,	%f5,	%f26
loop_2890:
	tsubcctv	%o5,	0x0F00,	%i3
	fabss	%f5,	%f26
loop_2891:
	fpsub32s	%f26,	%f13,	%f14
	movcc	%xcc,	%o0,	%l5
	movre	%i5,	%g2,	%g6
	fmovdcs	%icc,	%f20,	%f23
	bcc,a,pn	%icc,	loop_2892
	nop
	setx	loop_2893,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	be,a,pn	%xcc,	loop_2894
	mulscc	%l0,	0x095E,	%o3
loop_2892:
	fmul8x16	%f9,	%f18,	%f24
loop_2893:
	bge,a,pn	%icc,	loop_2895
loop_2894:
	nop
	setx loop_2896, %l0, %l1
	jmpl %l1, %i2
	tvs	%icc,	0x7
	movrgez	%i1,	0x227,	%i4
loop_2895:
	fcmps	%fcc2,	%f22,	%f27
loop_2896:
	ta	%xcc,	0x1
	ta	%xcc,	0x1
	fmovse	%icc,	%f14,	%f26
	subc	%o7,	%o6,	%g3
	sdivcc	%o2,	0x0278,	%l4
	nop
	setx loop_2897, %l0, %l1
	jmpl %l1, %g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i6,	%l1
	andncc	%i7,	%g5,	%o4
loop_2897:
	call	loop_2898
	edge16n	%l6,	%i0,	%l3
	fmovrsgez	%g4,	%f10,	%f16
	movvs	%icc,	%g7,	%l2
loop_2898:
	orcc	%o5,	0x11BC,	%i3
	addc	%o1,	0x1386,	%l5
	edge8l	%o0,	%g2,	%g6
	tn	%xcc,	0x3
	movpos	%xcc,	%l0,	%o3
	fxnor	%f26,	%f4,	%f4
	fmovde	%icc,	%f17,	%f19
	sdiv	%i5,	0x0A32,	%i1
	tvs	%xcc,	0x1
	fpadd32s	%f4,	%f12,	%f3
	fpackfix	%f24,	%f30
	nop
	set	0x08, %g1
	ldsh	[%l7 + %g1],	%i2
	alignaddr	%o7,	%o6,	%i4
	for	%f8,	%f10,	%f22
	or	%o2,	0x17B9,	%g3
	udiv	%l4,	0x1EF8,	%g1
	udivcc	%l1,	0x0403,	%i6
	fbue,a	%fcc1,	loop_2899
	bvc	loop_2900
	movgu	%icc,	%g5,	%o4
	tpos	%xcc,	0x4
loop_2899:
	tcs	%xcc,	0x7
loop_2900:
	movrlz	%l6,	0x303,	%i0
	ldsw	[%l7 + 0x68],	%i7
	subccc	%l3,	%g4,	%g7
	fmovrdgz	%l2,	%f22,	%f30
	nop
	setx	loop_2901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%xcc,	%o5,	%i3
	mulscc	%o1,	%o0,	%l5
	move	%icc,	%g6,	%l0
loop_2901:
	fcmped	%fcc0,	%f18,	%f4
	fmovdcs	%icc,	%f26,	%f8
	fcmpgt32	%f16,	%f12,	%o3
	fors	%f8,	%f2,	%f28
	subcc	%i5,	%g2,	%i2
	movg	%xcc,	%i1,	%o6
	fornot2	%f16,	%f4,	%f30
	sdivcc	%o7,	0x0E4E,	%i4
	fmovdcs	%icc,	%f27,	%f22
	sdivcc	%o2,	0x11E9,	%g3
	popc	0x088E,	%l4
	membar	0x29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g1,	0x0DB,	%l1
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x14
	fcmple16	%f20,	%f24,	%i6
	alignaddr	%g5,	%o4,	%i0
	movrlez	%l6,	0x2C9,	%l3
	mulscc	%i7,	%g4,	%g7
	std	%o4,	[%l7 + 0x50]
	edge8l	%i3,	%l2,	%o1
	fmovsne	%xcc,	%f28,	%f16
	fbe,a	%fcc3,	loop_2902
	array8	%l5,	%g6,	%l0
	prefetch	[%l7 + 0x2C],	 0x3
	srl	%o3,	0x02,	%o0
loop_2902:
	fba	%fcc3,	loop_2903
	fandnot2	%f12,	%f28,	%f20
	andcc	%g2,	%i2,	%i1
	sdivx	%o6,	0x15BB,	%o7
loop_2903:
	fmovrse	%i5,	%f25,	%f27
	nop
	set	0x48, %g2
	ldub	[%l7 + %g2],	%i4
	fmovrdlez	%g3,	%f30,	%f6
	fmovdle	%icc,	%f15,	%f16
	fmovsn	%xcc,	%f26,	%f14
	brgz	%l4,	loop_2904
	or	%g1,	0x0FD6,	%o2
	movre	%l1,	0x07B,	%g5
	movcc	%xcc,	%i6,	%i0
loop_2904:
	brgez	%o4,	loop_2905
	brlez,a	%l6,	loop_2906
	fnot1	%f4,	%f2
	edge32n	%i7,	%g4,	%g7
loop_2905:
	nop
	set	0x30, %i5
	ldsha	[%l7 + %i5] 0x81,	%o5
loop_2906:
	tn	%icc,	0x3
	fpsub16	%f18,	%f20,	%f20
	and	%i3,	%l2,	%o1
	set	0x3A, %g6
	lduba	[%l7 + %g6] 0x81,	%l3
	tneg	%icc,	0x0
	fsrc2	%f4,	%f6
	fba,a	%fcc3,	loop_2907
	array16	%l5,	%l0,	%o3
	fbo,a	%fcc2,	loop_2908
	fmovsneg	%icc,	%f31,	%f21
loop_2907:
	movle	%icc,	%o0,	%g6
	movpos	%xcc,	%g2,	%i2
loop_2908:
	subcc	%o6,	%i1,	%o7
	edge8ln	%i5,	%g3,	%l4
	edge8l	%i4,	%o2,	%l1
	add	%g1,	0x0740,	%i6
	addcc	%i0,	%g5,	%l6
	edge8n	%i7,	%g4,	%g7
	fmovrdlz	%o4,	%f4,	%f12
	taddcctv	%o5,	%l2,	%o1
	fmovdge	%xcc,	%f27,	%f1
	subccc	%l3,	0x033E,	%l5
	movcs	%xcc,	%i3,	%l0
	tle	%xcc,	0x3
	faligndata	%f6,	%f14,	%f16
	movvc	%icc,	%o3,	%g6
	andn	%o0,	%g2,	%i2
	movrgz	%o6,	%i1,	%i5
	fornot2	%f28,	%f22,	%f2
	ldsw	[%l7 + 0x58],	%g3
	fbe,a	%fcc1,	loop_2909
	fornot2	%f28,	%f16,	%f28
	and	%l4,	%o7,	%o2
	fmovdpos	%xcc,	%f2,	%f6
loop_2909:
	edge32ln	%i4,	%g1,	%i6
	fnegd	%f30,	%f12
	bvc,a	loop_2910
	fmovdne	%xcc,	%f0,	%f18
	bn,pn	%icc,	loop_2911
	tsubcctv	%l1,	%i0,	%l6
loop_2910:
	movleu	%icc,	%g5,	%g4
	tvs	%xcc,	0x6
loop_2911:
	movrlez	%g7,	0x1DE,	%o4
	fnot1	%f26,	%f16
	andncc	%o5,	%l2,	%i7
	set	0x4E, %o6
	stha	%l3,	[%l7 + %o6] 0x15
	fabsd	%f0,	%f2
	taddcc	%l5,	0x0703,	%i3
	fornot1s	%f16,	%f27,	%f12
	orn	%l0,	%o1,	%g6
	bvc	loop_2912
	subccc	%o0,	%g2,	%i2
	tgu	%xcc,	0x2
	tn	%xcc,	0x6
loop_2912:
	smulcc	%o6,	%i1,	%i5
	fornot1	%f30,	%f0,	%f20
	xnor	%g3,	0x1BB5,	%o3
	tvc	%xcc,	0x5
	bn,a	%icc,	loop_2913
	fandnot1	%f2,	%f28,	%f12
	ta	%xcc,	0x7
	tsubcctv	%l4,	0x112E,	%o2
loop_2913:
	movn	%xcc,	%o7,	%i4
	xnorcc	%g1,	%l1,	%i0
	tne	%icc,	0x2
	bcs,a	%xcc,	loop_2914
	flush	%l7 + 0x30
	xorcc	%i6,	%l6,	%g4
	tgu	%xcc,	0x4
loop_2914:
	ldsb	[%l7 + 0x7C],	%g5
	fmovrsne	%o4,	%f30,	%f31
	edge16n	%g7,	%o5,	%i7
	taddcctv	%l3,	%l5,	%i3
	tsubcc	%l0,	0x1E63,	%l2
	prefetch	[%l7 + 0x7C],	 0x0
	fnands	%f9,	%f19,	%f0
	stbar
	fbge,a	%fcc2,	loop_2915
	addcc	%g6,	0x01F3,	%o0
	subcc	%g2,	0x1FBC,	%i2
	fcmpeq16	%f26,	%f28,	%o1
loop_2915:
	fmovs	%f6,	%f17
	smulcc	%i1,	%i5,	%o6
	bcc,a,pt	%xcc,	loop_2916
	orncc	%o3,	0x1497,	%l4
	tge	%icc,	0x1
	edge8n	%g3,	%o7,	%i4
loop_2916:
	edge32	%o2,	%l1,	%i0
	nop
	setx	loop_2917,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%i6,	0x054A,	%g1
	movle	%icc,	%l6,	%g4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2A] %asi,	%g5
loop_2917:
	fcmpne16	%f26,	%f6,	%o4
	fmovsvs	%icc,	%f22,	%f26
	subccc	%o5,	%i7,	%g7
	sllx	%l5,	%l3,	%l0
	movvs	%xcc,	%i3,	%l2
	xnorcc	%o0,	0x1BD8,	%g6
	fmovdleu	%xcc,	%f23,	%f17
	subc	%i2,	0x0BAE,	%o1
	fpadd16	%f8,	%f12,	%f30
	movneg	%icc,	%i1,	%g2
	set	0x1C, %l3
	ldsha	[%l7 + %l3] 0x04,	%o6
	movgu	%icc,	%o3,	%i5
	wr	%g0,	0x2a,	%asi
	stxa	%l4,	[%l7 + 0x10] %asi
	membar	#Sync
	movn	%xcc,	%o7,	%g3
	fmovde	%xcc,	%f19,	%f22
	fmovdvc	%icc,	%f21,	%f14
	orncc	%o2,	%l1,	%i4
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f0
	andncc	%i0,	%g1,	%i6
	std	%g4,	[%l7 + 0x28]
	addcc	%l6,	%g5,	%o5
	tleu	%xcc,	0x1
	sethi	0x1B80,	%i7
	edge8	%g7,	%o4,	%l3
	array32	%l5,	%l0,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f1,	%f21
	subccc	%i3,	%g6,	%o0
	fpadd16s	%f1,	%f17,	%f13
	ble,pn	%icc,	loop_2918
	movgu	%xcc,	%i2,	%i1
	fmovrslez	%o1,	%f25,	%f21
	tn	%icc,	0x2
loop_2918:
	tvc	%icc,	0x2
	fbl	%fcc1,	loop_2919
	fcmpeq16	%f24,	%f6,	%g2
	tleu	%icc,	0x4
	subccc	%o6,	0x1A69,	%o3
loop_2919:
	ldd	[%l7 + 0x20],	%f30
	movrlz	%i5,	0x25D,	%l4
	array32	%o7,	%g3,	%l1
	brlez	%i4,	loop_2920
	fornot1s	%f15,	%f21,	%f15
	movg	%icc,	%o2,	%i0
	xnorcc	%i6,	%g1,	%g4
loop_2920:
	ldsb	[%l7 + 0x31],	%l6
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x17,	%f16
	movgu	%xcc,	%o5,	%i7
	fbn,a	%fcc0,	loop_2921
	brnz	%g5,	loop_2922
	mova	%xcc,	%g7,	%o4
	edge8n	%l3,	%l0,	%l5
loop_2921:
	fblg,a	%fcc0,	loop_2923
loop_2922:
	movrlz	%i3,	0x2F6,	%g6
	movl	%xcc,	%l2,	%o0
	ldsb	[%l7 + 0x0A],	%i2
loop_2923:
	bge	loop_2924
	ld	[%l7 + 0x70],	%f3
	set	0x70, %l2
	ldsba	[%l7 + %l2] 0x10,	%o1
loop_2924:
	tsubcctv	%i1,	0x1DEB,	%g2
	stbar
	nop
	setx	loop_2925,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%o6,	%o3,	%i5
	fmuld8sux16	%f25,	%f19,	%f4
	movrlz	%o7,	%l4,	%l1
loop_2925:
	edge16l	%g3,	%o2,	%i4
	mulx	%i6,	%g1,	%i0
	bg,pt	%icc,	loop_2926
	fbn,a	%fcc1,	loop_2927
	sllx	%g4,	%l6,	%o5
	movl	%icc,	%g5,	%g7
loop_2926:
	edge16n	%o4,	%i7,	%l0
loop_2927:
	movrlez	%l5,	%l3,	%i3
	edge8ln	%g6,	%o0,	%l2
	fbn,a	%fcc0,	loop_2928
	sllx	%o1,	0x1C,	%i1
	orn	%i2,	0x0966,	%o6
	stbar
loop_2928:
	andn	%o3,	%g2,	%i5
	be,pt	%xcc,	loop_2929
	fsrc1s	%f16,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,pn	%icc,	loop_2930
loop_2929:
	movneg	%icc,	%o7,	%l1
	movrne	%g3,	0x0A3,	%l4
	fxor	%f12,	%f18,	%f4
loop_2930:
	fone	%f14
	ta	%xcc,	0x5
	tgu	%icc,	0x0
	tgu	%icc,	0x1
	ldd	[%l7 + 0x38],	%o2
	fsrc2s	%f7,	%f29
	edge32l	%i4,	%i6,	%g1
	edge8	%i0,	%l6,	%o5
	std	%f20,	[%l7 + 0x10]
	array16	%g5,	%g7,	%o4
	nop
	setx	loop_2931,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%xcc,	0x7
	ldsb	[%l7 + 0x69],	%i7
	bl,a,pn	%icc,	loop_2932
loop_2931:
	ldsw	[%l7 + 0x58],	%l0
	fabsd	%f14,	%f0
	tle	%icc,	0x6
loop_2932:
	bneg,a	loop_2933
	fcmpgt16	%f10,	%f20,	%l5
	fmovsvc	%xcc,	%f13,	%f16
	movrne	%g4,	%l3,	%g6
loop_2933:
	subc	%o0,	0x0249,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%l2,	%f8,	%f4
	movre	%o1,	0x116,	%i2
	brnz,a	%o6,	loop_2934
	taddcctv	%o3,	0x0AC4,	%g2
	fnors	%f17,	%f5,	%f9
	tcs	%xcc,	0x3
loop_2934:
	movg	%xcc,	%i5,	%o7
	set	0x38, %i6
	swapa	[%l7 + %i6] 0x10,	%i1
	edge16l	%g3,	%l1,	%o2
	faligndata	%f18,	%f6,	%f16
	udiv	%l4,	0x0E0F,	%i6
	movvs	%xcc,	%g1,	%i0
	edge16n	%l6,	%o5,	%g5
	sdivx	%g7,	0x038F,	%i4
	orncc	%i7,	%o4,	%l5
	movg	%icc,	%l0,	%l3
	fxnors	%f24,	%f24,	%f14
	fmovdn	%xcc,	%f0,	%f10
	edge32n	%g6,	%g4,	%o0
	tsubcc	%l2,	0x1C45,	%i3
	fnand	%f18,	%f22,	%f10
	sethi	0x0BF2,	%o1
	bg	loop_2935
	srax	%i2,	0x1D,	%o3
	movge	%icc,	%g2,	%i5
	sir	0x183C
loop_2935:
	bcc,pn	%icc,	loop_2936
	movneg	%xcc,	%o7,	%o6
	udivx	%g3,	0x12D2,	%l1
	brgez	%i1,	loop_2937
loop_2936:
	brlez,a	%l4,	loop_2938
	tgu	%icc,	0x7
	fcmple16	%f4,	%f16,	%o2
loop_2937:
	edge16n	%i6,	%i0,	%g1
loop_2938:
	tge	%xcc,	0x1
	subccc	%l6,	%o5,	%g7
	movgu	%icc,	%g5,	%i7
	fnot1s	%f3,	%f17
	edge8	%i4,	%o4,	%l0
	popc	0x1200,	%l3
	andn	%g6,	%g4,	%o0
	set	0x40, %l0
	swapa	[%l7 + %l0] 0x11,	%l2
	set	0x75, %o4
	stba	%l5,	[%l7 + %o4] 0x2a
	membar	#Sync
	fmovdcc	%icc,	%f6,	%f17
	edge16n	%i3,	%o1,	%o3
	udivx	%g2,	0x05AF,	%i5
	fmovse	%icc,	%f12,	%f14
	taddcc	%i2,	%o6,	%o7
	tgu	%icc,	0x4
	movrlz	%g3,	0x224,	%i1
	movn	%xcc,	%l1,	%l4
	fsrc2	%f0,	%f30
	fmovsge	%xcc,	%f17,	%f8
	array16	%o2,	%i6,	%g1
	edge32n	%l6,	%i0,	%g7
	umulcc	%o5,	0x1C98,	%i7
	lduw	[%l7 + 0x74],	%i4
	smulcc	%g5,	%l0,	%o4
	edge8	%g4,	%o0,	%g6
	addccc	%l5,	%i3,	%o1
	be,a	%xcc,	loop_2939
	fmovrdlz	%o3,	%f22,	%f2
	fmul8x16	%f6,	%f12,	%f28
	prefetch	[%l7 + 0x0C],	 0x2
loop_2939:
	tle	%icc,	0x2
	tleu	%icc,	0x2
	movrlez	%g2,	0x04D,	%i5
	fbul	%fcc1,	loop_2940
	fmovdl	%icc,	%f14,	%f1
	umulcc	%i2,	0x073B,	%o6
	fpadd32	%f22,	%f2,	%f4
loop_2940:
	swap	[%l7 + 0x74],	%o7
	fbo,a	%fcc3,	loop_2941
	udivx	%l2,	0x0FDF,	%g3
	mulscc	%i1,	%l1,	%o2
	ldstub	[%l7 + 0x35],	%i6
loop_2941:
	fzero	%f6
	addcc	%l4,	%g1,	%l6
	ta	%xcc,	0x2
	orcc	%g7,	%o5,	%i7
	edge16n	%i4,	%i0,	%g5
	fbe,a	%fcc3,	loop_2942
	udiv	%l0,	0x08C0,	%l3
	edge32	%o4,	%g4,	%g6
	edge16ln	%o0,	%l5,	%i3
loop_2942:
	fpadd32	%f0,	%f2,	%f8
	tl	%icc,	0x1
	brnz	%o3,	loop_2943
	tsubcc	%g2,	%i5,	%o1
	bne	loop_2944
	tsubcc	%o6,	%i2,	%l2
loop_2943:
	fandnot1	%f12,	%f26,	%f2
	fmovdl	%xcc,	%f23,	%f6
loop_2944:
	xor	%g3,	0x1322,	%i1
	xorcc	%l1,	0x10B8,	%o7
	edge16	%o2,	%l4,	%i6
	fabss	%f30,	%f13
	tle	%xcc,	0x2
	mulscc	%g1,	0x0283,	%l6
	sdiv	%g7,	0x1C17,	%o5
	tne	%xcc,	0x2
	subcc	%i7,	0x0E76,	%i0
	fnot2s	%f22,	%f26
	tsubcctv	%i4,	%l0,	%g5
	tneg	%xcc,	0x4
	andcc	%o4,	%g4,	%g6
	fmovdneg	%icc,	%f12,	%f22
	xorcc	%l3,	0x0232,	%l5
	stw	%o0,	[%l7 + 0x30]
	edge16	%o3,	%g2,	%i5
	tle	%xcc,	0x6
	mova	%icc,	%i3,	%o6
	sdiv	%o1,	0x1127,	%i2
	fmovse	%icc,	%f8,	%f15
	tl	%icc,	0x4
	sra	%l2,	%i1,	%g3
	fmovdn	%icc,	%f24,	%f31
	fbo	%fcc1,	loop_2945
	smul	%l1,	0x1525,	%o2
	fandnot1	%f14,	%f0,	%f6
	std	%f22,	[%l7 + 0x08]
loop_2945:
	mova	%xcc,	%o7,	%i6
	fnor	%f10,	%f28,	%f30
	edge16n	%l4,	%g1,	%l6
	nop
	set	0x60, %o2
	prefetch	[%l7 + %o2],	 0x2
	te	%xcc,	0x7
	fsrc1	%f20,	%f18
	edge8ln	%g7,	%i7,	%i0
	ldx	[%l7 + 0x78],	%i4
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x19,	%o5
	movleu	%xcc,	%g5,	%o4
	orcc	%g4,	%l0,	%g6
	mova	%xcc,	%l3,	%l5
	edge8l	%o3,	%o0,	%g2
	movn	%icc,	%i5,	%o6
	fble	%fcc1,	loop_2946
	fmovrsne	%o1,	%f22,	%f0
	alignaddr	%i3,	%l2,	%i1
	udivx	%i2,	0x046A,	%l1
loop_2946:
	fsrc1s	%f30,	%f31
	fmovscc	%icc,	%f21,	%f21
	fpsub32s	%f23,	%f7,	%f12
	set	0x4C, %i7
	stba	%g3,	[%l7 + %i7] 0x88
	array8	%o7,	%o2,	%i6
	ldx	[%l7 + 0x60],	%g1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x62] %asi,	%l4
	tvs	%xcc,	0x4
	fbug,a	%fcc1,	loop_2947
	fxnors	%f10,	%f12,	%f25
	taddcctv	%l6,	%i7,	%i0
	fbule	%fcc1,	loop_2948
loop_2947:
	movneg	%xcc,	%i4,	%g7
	wr	%g0,	0x81,	%asi
	sta	%f10,	[%l7 + 0x20] %asi
loop_2948:
	sra	%g5,	%o4,	%g4
	movg	%xcc,	%o5,	%l0
	ldstub	[%l7 + 0x0B],	%l3
	movrlz	%g6,	0x2DA,	%l5
	fsrc1s	%f27,	%f15
	edge8l	%o0,	%g2,	%i5
	tleu	%xcc,	0x0
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	andncc	%o3,	%o6,	%i3
	call	loop_2949
	fcmpne32	%f0,	%f12,	%o1
	movpos	%xcc,	%l2,	%i1
	popc	%i2,	%l1
loop_2949:
	movre	%o7,	0x28C,	%g3
	smul	%i6,	%g1,	%l4
	ba,a,pt	%icc,	loop_2950
	mova	%xcc,	%l6,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i7,	0x1928,	%i4
loop_2950:
	movrgez	%g7,	%g5,	%o4
	movcs	%xcc,	%g4,	%o5
	fmovscc	%icc,	%f8,	%f29
	fbue,a	%fcc2,	loop_2951
	mulx	%i0,	0x1D0A,	%l3
	movpos	%xcc,	%g6,	%l0
	and	%o0,	0x09EE,	%g2
loop_2951:
	nop
	set	0x70, %l4
	lduwa	[%l7 + %l4] 0x89,	%l5
	fmul8x16	%f25,	%f30,	%f28
	tcc	%icc,	0x0
	fnors	%f31,	%f25,	%f8
	movn	%xcc,	%i5,	%o6
	fblg	%fcc2,	loop_2952
	array16	%o3,	%i3,	%o1
	tsubcc	%i1,	%i2,	%l2
	bcs,pn	%xcc,	loop_2953
loop_2952:
	fmovsne	%xcc,	%f1,	%f19
	fbn	%fcc3,	loop_2954
	orncc	%o7,	0x18F4,	%g3
loop_2953:
	tsubcc	%l1,	%i6,	%l4
	andncc	%g1,	%o2,	%l6
loop_2954:
	sdivcc	%i4,	0x0140,	%g7
	udiv	%g5,	0x0559,	%i7
	movpos	%xcc,	%o4,	%o5
	andncc	%g4,	%i0,	%l3
	orn	%g6,	0x102D,	%o0
	edge32l	%g2,	%l5,	%l0
	fnors	%f26,	%f18,	%f17
	bgu	%icc,	loop_2955
	mulscc	%o6,	0x1722,	%i5
	fzeros	%f27
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x04,	 0x3
loop_2955:
	sdiv	%o3,	0x1108,	%i1
	bpos	%xcc,	loop_2956
	subc	%o1,	%i2,	%o7
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x10] %asi,	%l2
loop_2956:
	movn	%icc,	%l1,	%i6
	ldsw	[%l7 + 0x20],	%g3
	popc	%l4,	%g1
	sub	%o2,	0x1A0F,	%l6
	alignaddr	%i4,	%g5,	%g7
	tle	%xcc,	0x4
	taddcc	%o4,	%o5,	%i7
	sethi	0x00A0,	%g4
	movcs	%icc,	%l3,	%g6
	orn	%o0,	%g2,	%l5
	movcs	%icc,	%l0,	%o6
	sethi	0x1698,	%i0
	movpos	%xcc,	%i5,	%o3
	bpos,pn	%xcc,	loop_2957
	xorcc	%i1,	0x1D35,	%i3
	fandnot1s	%f20,	%f0,	%f24
	fandnot1	%f0,	%f22,	%f0
loop_2957:
	fmovdge	%icc,	%f2,	%f17
	fsrc2	%f0,	%f14
	stw	%o1,	[%l7 + 0x5C]
	fmuld8sux16	%f12,	%f17,	%f26
	orcc	%i2,	0x0455,	%l2
	tge	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o7,	%i6
	array16	%l1,	%l4,	%g3
	fmovsneg	%xcc,	%f28,	%f16
	brlez,a	%o2,	loop_2958
	fsrc1	%f6,	%f2
	edge16n	%l6,	%i4,	%g5
	movgu	%icc,	%g7,	%o4
loop_2958:
	fsrc2s	%f24,	%f27
	bvs,a	%icc,	loop_2959
	array16	%g1,	%o5,	%i7
	movl	%xcc,	%l3,	%g4
	tpos	%xcc,	0x4
loop_2959:
	movg	%xcc,	%g6,	%g2
	ldub	[%l7 + 0x2C],	%l5
	movrgez	%l0,	0x0B3,	%o0
	fornot2s	%f14,	%f7,	%f0
	mulscc	%i0,	%o6,	%i5
	tge	%xcc,	0x3
	prefetch	[%l7 + 0x28],	 0x2
	array8	%o3,	%i1,	%o1
	set	0x18, %i1
	lda	[%l7 + %i1] 0x80,	%f2
	sir	0x1054
	fcmpne32	%f12,	%f16,	%i2
	fbne,a	%fcc2,	loop_2960
	ldub	[%l7 + 0x41],	%i3
	andcc	%l2,	0x02E1,	%i6
	stb	%l1,	[%l7 + 0x0A]
loop_2960:
	std	%l4,	[%l7 + 0x38]
	fbo	%fcc0,	loop_2961
	addc	%o7,	%o2,	%g3
	udiv	%i4,	0x0EC1,	%l6
	movre	%g7,	0x382,	%g5
loop_2961:
	xnor	%o4,	%g1,	%o5
	alignaddrl	%i7,	%g4,	%l3
	mulscc	%g6,	0x1D86,	%l5
	sra	%l0,	%g2,	%o0
	set	0x68, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o6
	fsrc2	%f28,	%f6
	fpackfix	%f2,	%f17
	movle	%xcc,	%i5,	%i0
	movne	%xcc,	%i1,	%o3
	subcc	%o1,	0x0BD1,	%i3
	sllx	%l2,	%i2,	%i6
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x89,	%l1
	sra	%o7,	0x0A,	%o2
	fmovsne	%xcc,	%f6,	%f5
	xorcc	%l4,	0x0A54,	%i4
	edge8n	%l6,	%g7,	%g3
	bpos,a	loop_2962
	movcs	%xcc,	%g5,	%o4
	brgz	%g1,	loop_2963
	edge32l	%o5,	%g4,	%l3
loop_2962:
	bleu,a	loop_2964
	xor	%i7,	%g6,	%l5
loop_2963:
	array16	%g2,	%o0,	%o6
	wr	%g0,	0x11,	%asi
	sta	%f30,	[%l7 + 0x58] %asi
loop_2964:
	prefetch	[%l7 + 0x70],	 0x3
	orn	%l0,	%i5,	%i1
	subcc	%o3,	0x1E7C,	%o1
	fmovrse	%i0,	%f23,	%f21
	fblg,a	%fcc0,	loop_2965
	fnegd	%f30,	%f12
	fmuld8sux16	%f31,	%f7,	%f16
	taddcctv	%i3,	0x09D0,	%l2
loop_2965:
	sdiv	%i2,	0x04FB,	%l1
	udiv	%o7,	0x16E1,	%o2
	xnorcc	%i6,	0x04AE,	%i4
	fmul8x16	%f23,	%f14,	%f16
	fbu,a	%fcc3,	loop_2966
	subcc	%l4,	0x1B83,	%l6
	alignaddrl	%g7,	%g5,	%o4
	orncc	%g1,	0x10AE,	%g3
loop_2966:
	fexpand	%f5,	%f6
	tvc	%xcc,	0x5
	ldsb	[%l7 + 0x36],	%g4
	fmul8x16au	%f20,	%f23,	%f16
	tvc	%xcc,	0x1
	movrne	%l3,	%i7,	%g6
	sll	%o5,	%g2,	%o0
	sth	%l5,	[%l7 + 0x3C]
	addccc	%o6,	%i5,	%l0
	addc	%i1,	0x18AB,	%o3
	set	0x170, %i4
	nop 	! 	nop 	! 	ldxa	[%g0 + %i4] 0x40,	%o1 ripped by fixASI40.pl ripped by fixASI40.pl
	stbar
	be	loop_2967
	fmovdn	%icc,	%f31,	%f0
	tn	%icc,	0x2
	orncc	%i0,	0x0834,	%i3
loop_2967:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f22,	%f16
	edge32ln	%i2,	%l2,	%o7
	edge32	%l1,	%i6,	%o2
	fmovsvs	%icc,	%f27,	%f16
	fornot2	%f6,	%f26,	%f16
	fbne,a	%fcc3,	loop_2968
	fmovsle	%xcc,	%f17,	%f11
	array32	%l4,	%l6,	%i4
	movrgz	%g7,	%o4,	%g5
loop_2968:
	taddcc	%g3,	%g4,	%l3
	membar	0x56
	move	%xcc,	%i7,	%g6
	fxnors	%f9,	%f19,	%f19
	fcmpgt32	%f6,	%f28,	%g1
	ldx	[%l7 + 0x70],	%o5
	mova	%xcc,	%o0,	%g2
	movrgez	%o6,	0x1F4,	%l5
	movg	%icc,	%i5,	%l0
	fmovspos	%icc,	%f14,	%f4
	tsubcctv	%i1,	0x1155,	%o3
	sdivcc	%o1,	0x1D0F,	%i3
	subccc	%i0,	%i2,	%o7
	edge32ln	%l1,	%l2,	%i6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0B] %asi,	%o2
	prefetch	[%l7 + 0x40],	 0x2
	te	%icc,	0x6
	bvs,a	%xcc,	loop_2969
	tleu	%icc,	0x2
	siam	0x3
	swap	[%l7 + 0x0C],	%l6
loop_2969:
	ldsb	[%l7 + 0x1E],	%i4
	addc	%g7,	%l4,	%g5
	fbn	%fcc1,	loop_2970
	edge16	%g3,	%o4,	%g4
	movrgz	%l3,	0x3C3,	%g6
	fmovda	%xcc,	%f2,	%f18
loop_2970:
	edge32l	%g1,	%i7,	%o5
	fmovscs	%icc,	%f4,	%f7
	movvc	%icc,	%o0,	%o6
	brlez	%g2,	loop_2971
	smulcc	%i5,	%l5,	%l0
	alignaddrl	%i1,	%o3,	%o1
	movle	%xcc,	%i0,	%i3
loop_2971:
	movle	%xcc,	%o7,	%l1
	subcc	%i2,	%i6,	%o2
	fbul,a	%fcc1,	loop_2972
	edge16l	%l2,	%i4,	%l6
	orn	%l4,	%g7,	%g3
	subc	%o4,	0x141B,	%g4
loop_2972:
	edge8n	%g5,	%l3,	%g1
	udivcc	%i7,	0x18E8,	%g6
	xor	%o0,	%o6,	%g2
	edge8l	%i5,	%o5,	%l5
	tpos	%icc,	0x2
	brlz,a	%i1,	loop_2973
	fba	%fcc3,	loop_2974
	movcs	%icc,	%o3,	%l0
	fbue	%fcc2,	loop_2975
loop_2973:
	movn	%icc,	%o1,	%i3
loop_2974:
	orncc	%i0,	%o7,	%l1
	movrlz	%i6,	%i2,	%o2
loop_2975:
	ld	[%l7 + 0x68],	%f25
	tcc	%xcc,	0x2
	std	%l2,	[%l7 + 0x58]
	fbe	%fcc0,	loop_2976
	array8	%i4,	%l6,	%g7
	edge16l	%g3,	%l4,	%o4
	brlez	%g4,	loop_2977
loop_2976:
	udivx	%g5,	0x174E,	%l3
	ta	%icc,	0x7
	tcs	%icc,	0x2
loop_2977:
	tvc	%xcc,	0x4
	and	%g1,	%g6,	%i7
	be	loop_2978
	ldub	[%l7 + 0x70],	%o0
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x89
loop_2978:
	alignaddrl	%g2,	%i5,	%o6
	swap	[%l7 + 0x38],	%o5
	orncc	%l5,	%o3,	%l0
	fba	%fcc0,	loop_2979
	lduh	[%l7 + 0x70],	%i1
	ble,pn	%icc,	loop_2980
	tpos	%xcc,	0x3
loop_2979:
	bn,a,pn	%xcc,	loop_2981
	xnor	%i3,	0x07ED,	%i0
loop_2980:
	fmovdge	%xcc,	%f7,	%f28
	fbl,a	%fcc3,	loop_2982
loop_2981:
	fmul8ulx16	%f20,	%f12,	%f28
	fmovrdgez	%o1,	%f20,	%f20
	ldsh	[%l7 + 0x1C],	%o7
loop_2982:
	orcc	%i6,	%i2,	%l1
	fcmpne32	%f28,	%f10,	%l2
	stw	%o2,	[%l7 + 0x1C]
	udivcc	%l6,	0x05EE,	%i4
	te	%xcc,	0x6
	udivx	%g3,	0x06F5,	%l4
	wr	%g0,	0x2f,	%asi
	stda	%o4,	[%l7 + 0x40] %asi
	membar	#Sync
	xor	%g4,	0x08DF,	%g7
	brlz,a	%l3,	loop_2983
	fcmpeq32	%f18,	%f26,	%g5
	fnors	%f20,	%f8,	%f10
	subc	%g1,	0x0307,	%g6
loop_2983:
	tvc	%icc,	0x6
	sdivcc	%o0,	0x0DD2,	%g2
	orn	%i7,	0x0960,	%o6
	subccc	%i5,	%l5,	%o5
	andn	%o3,	0x1D70,	%i1
	edge16ln	%l0,	%i3,	%o1
	mulscc	%o7,	0x039C,	%i0
	sra	%i6,	0x0A,	%l1
	movcc	%xcc,	%l2,	%i2
	fnands	%f16,	%f22,	%f6
	fmovde	%icc,	%f17,	%f15
	movre	%l6,	%i4,	%o2
	sra	%l4,	%o4,	%g4
	edge32	%g7,	%l3,	%g3
	movre	%g5,	%g1,	%g6
	fcmpgt16	%f20,	%f18,	%o0
	sth	%i7,	[%l7 + 0x3E]
	or	%g2,	%o6,	%l5
	taddcc	%i5,	%o3,	%i1
	st	%f20,	[%l7 + 0x08]
	fzeros	%f14
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x0c,	%o5,	%i3
	ldsw	[%l7 + 0x7C],	%l0
	and	%o1,	%o7,	%i0
	ldub	[%l7 + 0x09],	%i6
	movg	%icc,	%l2,	%i2
	stx	%l1,	[%l7 + 0x70]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i4,	%o2,	%l4
	tg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2984, %l0, %l1
	jmpl %l1, %o4
	xnor	%l6,	0x0F4A,	%g7
	movcc	%xcc,	%l3,	%g3
	swap	[%l7 + 0x5C],	%g5
loop_2984:
	fsrc1	%f0,	%f20
	tg	%icc,	0x0
	membar	0x2C
	sir	0x0D94
	srl	%g4,	0x13,	%g1
	edge32	%g6,	%i7,	%o0
	fmovsle	%xcc,	%f26,	%f30
	taddcctv	%g2,	%l5,	%o6
	orncc	%i5,	0x1E2F,	%i1
	popc	0x0512,	%o3
	andncc	%o5,	%i3,	%o1
	bpos,pn	%icc,	loop_2985
	fba,a	%fcc0,	loop_2986
	bne,pt	%icc,	loop_2987
	udivx	%o7,	0x1587,	%l0
loop_2985:
	mulscc	%i6,	0x0482,	%i0
loop_2986:
	edge8	%l2,	%i2,	%i4
loop_2987:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16	%o2,	%l1,	%o4
	be,pn	%icc,	loop_2988
	fmovrdlz	%l4,	%f4,	%f16
	fabsd	%f8,	%f0
	stx	%g7,	[%l7 + 0x58]
loop_2988:
	movne	%xcc,	%l3,	%l6
	std	%f10,	[%l7 + 0x70]
	fmovd	%f16,	%f14
	fmovrslez	%g3,	%f27,	%f3
	fbo,a	%fcc3,	loop_2989
	movl	%icc,	%g4,	%g1
	movneg	%xcc,	%g6,	%i7
	be,a,pn	%icc,	loop_2990
loop_2989:
	std	%f6,	[%l7 + 0x58]
	stw	%g5,	[%l7 + 0x08]
	popc	0x10F3,	%o0
loop_2990:
	movre	%l5,	0x131,	%g2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%i5
	std	%f16,	[%l7 + 0x18]
	array32	%o6,	%o3,	%o5
	stbar
	sllx	%i3,	%i1,	%o7
	andn	%o1,	%l0,	%i0
	addcc	%i6,	%l2,	%i2
	sethi	0x1045,	%o2
	srax	%l1,	0x03,	%i4
	smul	%o4,	%g7,	%l3
	edge8l	%l6,	%l4,	%g3
	prefetch	[%l7 + 0x7C],	 0x1
	sir	0x1518
	movg	%xcc,	%g1,	%g4
	fble,a	%fcc3,	loop_2991
	fba	%fcc3,	loop_2992
	add	%i7,	0x1BD7,	%g5
	movvc	%icc,	%o0,	%l5
loop_2991:
	movne	%icc,	%g2,	%i5
loop_2992:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o6
	popc	0x1C69,	%o3
	movcs	%icc,	%o5,	%i3
	edge16ln	%i1,	%g6,	%o1
	mova	%xcc,	%o7,	%l0
	st	%f24,	[%l7 + 0x4C]
	mulx	%i0,	0x18FC,	%i6
	movn	%icc,	%l2,	%o2
	fblg	%fcc2,	loop_2993
	stb	%l1,	[%l7 + 0x7C]
	tsubcc	%i4,	0x08D0,	%o4
	array8	%g7,	%i2,	%l6
loop_2993:
	fnor	%f4,	%f26,	%f26
	edge16n	%l4,	%g3,	%l3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g4,	%g1
	stx	%g5,	[%l7 + 0x60]
	movrne	%i7,	0x24E,	%o0
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrslez	%l5,	%f15,	%f18
	sir	0x1C68
	bgu,a	loop_2994
	ba	%xcc,	loop_2995
	fbule,a	%fcc1,	loop_2996
	movcs	%icc,	%g2,	%o6
loop_2994:
	fmovdneg	%xcc,	%f8,	%f0
loop_2995:
	add	%o3,	%i5,	%o5
loop_2996:
	brlz,a	%i3,	loop_2997
	subc	%g6,	%i1,	%o1
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o7
loop_2997:
	fornot1s	%f4,	%f18,	%f30
	edge16	%i0,	%i6,	%l0
	tne	%xcc,	0x6
	ldx	[%l7 + 0x28],	%l2
	edge8	%o2,	%i4,	%o4
	and	%g7,	%i2,	%l1
	taddcc	%l6,	0x1BF2,	%l4
	udivx	%l3,	0x089D,	%g4
	sub	%g1,	0x0074,	%g5
	bcc	loop_2998
	membar	0x60
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g3,	0x061C,	%i7
loop_2998:
	xnorcc	%l5,	%o0,	%o6
	edge32n	%o3,	%i5,	%g2
	movcs	%icc,	%o5,	%g6
	sir	0x1160
	movrlz	%i3,	%i1,	%o1
	umul	%o7,	0x0E3B,	%i0
	xor	%l0,	%i6,	%o2
	sra	%l2,	%i4,	%o4
	alignaddrl	%i2,	%g7,	%l6
	fmovrde	%l1,	%f10,	%f14
	tvc	%icc,	0x6
	movn	%icc,	%l4,	%g4
	srl	%l3,	%g5,	%g1
	array32	%i7,	%l5,	%o0
	movcc	%xcc,	%g3,	%o6
	sethi	0x00DF,	%i5
	siam	0x1
	addccc	%o3,	0x0F5F,	%g2
	andn	%o5,	0x004F,	%g6
	mulx	%i3,	%o1,	%i1
	brlez	%o7,	loop_2999
	tcs	%icc,	0x7
	fnot1s	%f5,	%f11
	alignaddrl	%l0,	%i6,	%o2
loop_2999:
	edge16	%l2,	%i4,	%i0
	tcc	%icc,	0x4
	xnorcc	%o4,	%g7,	%l6
	tg	%xcc,	0x0
	tge	%icc,	0x0
	fornot1	%f22,	%f16,	%f4
	set	0x3D, %g3
	ldstuba	[%l7 + %g3] 0x04,	%l1
	fpack16	%f6,	%f29
	st	%f26,	[%l7 + 0x10]
	fmovdne	%xcc,	%f6,	%f25
	fsrc2s	%f13,	%f25
	fmovse	%xcc,	%f9,	%f21
	mulscc	%l4,	0x16D0,	%g4
	fbg	%fcc0,	loop_3000
	or	%l3,	0x1B4B,	%i2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
loop_3000:
	tgu	%icc,	0x5
	edge16	%g1,	%g5,	%i7
	brnz	%o0,	loop_3001
	tne	%xcc,	0x5
	orcc	%l5,	0x19E1,	%g3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x27] %asi,	%i5
loop_3001:
	fnegs	%f9,	%f23
	sllx	%o6,	%g2,	%o3
	fpadd32s	%f3,	%f26,	%f9
	movn	%icc,	%g6,	%i3
	mulscc	%o5,	%i1,	%o7
	srlx	%o1,	0x1E,	%i6
	bpos,a	loop_3002
	movrne	%o2,	%l2,	%i4
	umul	%i0,	0x0A4D,	%l0
	fcmpeq16	%f24,	%f4,	%g7
loop_3002:
	tge	%icc,	0x1
	fpadd32	%f8,	%f2,	%f16
	bge,a,pt	%icc,	loop_3003
	alignaddrl	%o4,	%l1,	%l4
	fcmpne16	%f2,	%f26,	%l6
	brlez	%g4,	loop_3004
loop_3003:
	tcs	%icc,	0x4
	fmovd	%f0,	%f0
	wr	%g0,	0x89,	%asi
	stwa	%l3,	[%l7 + 0x30] %asi
loop_3004:
	edge16n	%i2,	%g5,	%i7
	fmovscs	%icc,	%f30,	%f8
	andncc	%g1,	%o0,	%l5
	ldub	[%l7 + 0x0F],	%i5
	edge32n	%g3,	%g2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g6,	%i3,	%o5
	sdiv	%i1,	0x0FD7,	%o7
	fcmpeq16	%f24,	%f18,	%o6
	fornot1	%f2,	%f14,	%f8
	set	0x24, %o0
	ldswa	[%l7 + %o0] 0x89,	%o1
	movg	%xcc,	%o2,	%l2
	umul	%i4,	%i6,	%l0
	taddcc	%g7,	0x1684,	%o4
	tcc	%xcc,	0x7
	movn	%xcc,	%i0,	%l4
	fmovrdgz	%l6,	%f0,	%f2
	fmovde	%xcc,	%f18,	%f12
	tpos	%icc,	0x5
	tleu	%icc,	0x7
	fsrc2	%f30,	%f4
	bvc,a,pn	%xcc,	loop_3005
	array32	%l1,	%l3,	%i2
	fcmple16	%f14,	%f2,	%g5
	addcc	%i7,	0x1660,	%g4
loop_3005:
	tne	%icc,	0x2
	add	%g1,	0x0DC8,	%l5
	bl,a,pn	%icc,	loop_3006
	fmul8sux16	%f22,	%f6,	%f8
	ldd	[%l7 + 0x58],	%f26
	fpsub32	%f4,	%f22,	%f28
loop_3006:
	movrgz	%o0,	0x0C3,	%g3
	fbul,a	%fcc0,	loop_3007
	edge8n	%g2,	%i5,	%g6
	movrgz	%i3,	%o3,	%i1
	fbug,a	%fcc0,	loop_3008
loop_3007:
	fbe	%fcc1,	loop_3009
	movpos	%xcc,	%o7,	%o5
	brnz,a	%o1,	loop_3010
loop_3008:
	umulcc	%o6,	%l2,	%i4
loop_3009:
	andcc	%i6,	%o2,	%l0
	stw	%o4,	[%l7 + 0x44]
loop_3010:
	bg,a	%xcc,	loop_3011
	orn	%i0,	%g7,	%l4
	fcmpgt32	%f16,	%f12,	%l6
	mova	%xcc,	%l3,	%l1
loop_3011:
	movrgz	%i2,	0x1DB,	%i7
	tn	%xcc,	0x6
	movvc	%xcc,	%g5,	%g1
	fbul,a	%fcc1,	loop_3012
	fmovspos	%icc,	%f8,	%f12
	ldd	[%l7 + 0x60],	%f24
	srlx	%l5,	0x02,	%o0
loop_3012:
	stbar
	tleu	%xcc,	0x0
	udivcc	%g3,	0x1091,	%g4
	movpos	%xcc,	%i5,	%g2
	bg	%icc,	loop_3013
	orncc	%g6,	0x17C5,	%i3
	fbge,a	%fcc1,	loop_3014
	edge8n	%o3,	%o7,	%o5
loop_3013:
	movne	%icc,	%o1,	%o6
	sll	%i1,	%l2,	%i4
loop_3014:
	fandnot1s	%f19,	%f13,	%f12
	brnz,a	%o2,	loop_3015
	edge8ln	%i6,	%o4,	%i0
	bneg	%xcc,	loop_3016
	sllx	%g7,	0x1C,	%l4
loop_3015:
	movrlez	%l0,	%l3,	%l1
	orn	%l6,	0x0057,	%i7
loop_3016:
	sdiv	%g5,	0x005F,	%g1
	movg	%xcc,	%l5,	%o0
	orn	%g3,	0x1817,	%i2
	brgez,a	%g4,	loop_3017
	fbuge	%fcc3,	loop_3018
	brnz	%i5,	loop_3019
	movrgez	%g6,	0x37C,	%g2
loop_3017:
	srlx	%o3,	%o7,	%i3
loop_3018:
	movrlez	%o1,	0x205,	%o6
loop_3019:
	mulx	%i1,	%l2,	%o5
	tcc	%xcc,	0x4
	fmovdg	%xcc,	%f12,	%f25
	bneg	%xcc,	loop_3020
	tcc	%xcc,	0x2
	fmovsvc	%icc,	%f29,	%f21
	fornot2	%f2,	%f24,	%f6
loop_3020:
	tvs	%icc,	0x4
	bne,a,pn	%xcc,	loop_3021
	sir	0x1A47
	edge8	%o2,	%i4,	%i6
	move	%icc,	%o4,	%i0
loop_3021:
	taddcctv	%g7,	0x146F,	%l4
	fbu	%fcc2,	loop_3022
	xnor	%l0,	0x019D,	%l1
	fmovsg	%xcc,	%f14,	%f24
	fmovsvc	%xcc,	%f24,	%f23
loop_3022:
	orn	%l3,	%l6,	%i7
	edge16l	%g1,	%g5,	%l5
	fmovsl	%xcc,	%f11,	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o0,	%i2
	tne	%icc,	0x5
	edge16n	%g4,	%g3,	%i5
	tne	%xcc,	0x0
	set	0x7F, %l6
	ldsba	[%l7 + %l6] 0x80,	%g2
	add	%o3,	0x17C5,	%o7
	movvs	%xcc,	%i3,	%o1
	fpackfix	%f20,	%f21
	srlx	%o6,	0x0E,	%g6
	sdivcc	%l2,	0x1959,	%i1
	fbo,a	%fcc0,	loop_3023
	fxors	%f0,	%f22,	%f19
	bge,a	loop_3024
	fcmpgt16	%f6,	%f4,	%o2
loop_3023:
	fmovde	%icc,	%f16,	%f28
	tg	%icc,	0x2
loop_3024:
	sdivcc	%i4,	0x0C5A,	%i6
	stbar
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	fexpand	%f8,	%f22
	fnegs	%f24,	%f11
	andcc	%o5,	0x1C04,	%i0
	srl	%l4,	0x00,	%g7
	ldub	[%l7 + 0x32],	%l0
	ld	[%l7 + 0x28],	%f29
	tcc	%icc,	0x0
	and	%l1,	0x0635,	%l6
	movre	%i7,	0x3EF,	%l3
	movcs	%icc,	%g1,	%l5
	srlx	%o0,	0x10,	%g5
	xnorcc	%g4,	0x119D,	%g3
	fsrc1	%f28,	%f2
	array8	%i5,	%g2,	%o3
	tsubcctv	%i2,	%i3,	%o7
	tsubcc	%o6,	0x1306,	%g6
	ld	[%l7 + 0x30],	%f0
	fpadd32s	%f25,	%f19,	%f2
	array32	%l2,	%o1,	%o2
	srl	%i1,	0x0C,	%i6
	fmovsgu	%xcc,	%f29,	%f27
	movrlez	%o4,	%i4,	%i0
	fmuld8sux16	%f14,	%f8,	%f6
	fpmerge	%f14,	%f8,	%f0
	tl	%xcc,	0x0
	bne,a	%xcc,	loop_3025
	fmovd	%f28,	%f22
	orncc	%l4,	%g7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3025:
	movcs	%xcc,	%l1,	%l6
	fpadd16s	%f29,	%f24,	%f3
	udiv	%i7,	0x1581,	%o5
	tvc	%icc,	0x3
	membar	0x12
	fmovrslez	%l3,	%f25,	%f22
	or	%l5,	0x1D5F,	%o0
	wr	%g0,	0xeb,	%asi
	stda	%g0,	[%l7 + 0x58] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g5,	%g4
	bvs	%icc,	loop_3026
	tneg	%xcc,	0x6
	movcc	%icc,	%i5,	%g3
	fmovdne	%xcc,	%f13,	%f17
loop_3026:
	andncc	%o3,	%g2,	%i2
	movl	%xcc,	%o7,	%i3
	subcc	%o6,	0x0546,	%g6
	tcc	%icc,	0x0
	tcc	%xcc,	0x1
	fcmpeq32	%f30,	%f12,	%l2
	bcs,a,pt	%xcc,	loop_3027
	movvs	%icc,	%o2,	%i1
	fandnot2s	%f2,	%f23,	%f29
	tcs	%icc,	0x6
loop_3027:
	tn	%xcc,	0x6
	fmovrdgz	%i6,	%f18,	%f6
	bcs,a	%icc,	loop_3028
	tcs	%xcc,	0x4
	fbe,a	%fcc0,	loop_3029
	tn	%xcc,	0x6
loop_3028:
	st	%f16,	[%l7 + 0x60]
	movg	%xcc,	%o4,	%o1
loop_3029:
	alignaddrl	%i4,	%i0,	%l4
	bpos	%xcc,	loop_3030
	movvc	%xcc,	%g7,	%l0
	bge,pn	%xcc,	loop_3031
	membar	0x64
loop_3030:
	stw	%l6,	[%l7 + 0x6C]
	fcmpne16	%f14,	%f6,	%i7
loop_3031:
	fxnors	%f13,	%f12,	%f22
	and	%l1,	%o5,	%l5
	pdist	%f30,	%f30,	%f0
	array16	%o0,	%g1,	%l3
	popc	%g5,	%i5
	sub	%g3,	%g4,	%g2
	sir	0x071C
	tn	%icc,	0x7
	call	loop_3032
	alignaddrl	%o3,	%o7,	%i2
	set	0x62, %l5
	lduha	[%l7 + %l5] 0x14,	%i3
loop_3032:
	tsubcctv	%o6,	%l2,	%g6
	addc	%o2,	0x1F96,	%i6
	bpos,a,pt	%icc,	loop_3033
	edge8ln	%o4,	%o1,	%i1
	movl	%icc,	%i4,	%l4
	set	0x58, %g1
	stha	%i0,	[%l7 + %g1] 0x14
loop_3033:
	fblg	%fcc0,	loop_3034
	fpadd16	%f18,	%f8,	%f28
	st	%f21,	[%l7 + 0x20]
	fble,a	%fcc0,	loop_3035
loop_3034:
	fsrc1	%f28,	%f10
	fbl,a	%fcc3,	loop_3036
	subccc	%g7,	0x072C,	%l0
loop_3035:
	fandnot1	%f18,	%f22,	%f6
	smul	%i7,	0x04E6,	%l6
loop_3036:
	brlez,a	%l1,	loop_3037
	membar	0x11
	fsrc2s	%f7,	%f10
	pdist	%f10,	%f22,	%f20
loop_3037:
	tvc	%icc,	0x4
	edge8l	%l5,	%o0,	%g1
	fmovsge	%xcc,	%f8,	%f17
	flush	%l7 + 0x10
	fcmpne16	%f8,	%f0,	%o5
	stb	%l3,	[%l7 + 0x38]
	array8	%g5,	%i5,	%g3
	tge	%icc,	0x4
	movrne	%g2,	0x0B6,	%g4
	movrgz	%o7,	0x146,	%i2
	fpadd32s	%f14,	%f1,	%f9
	fmovrslez	%o3,	%f28,	%f7
	orn	%o6,	%l2,	%g6
	fmovrsgez	%i3,	%f23,	%f14
	array8	%i6,	%o4,	%o2
	srl	%i1,	0x1A,	%i4
	fxnor	%f10,	%f10,	%f18
	orn	%o1,	%l4,	%g7
	fandnot2s	%f19,	%f15,	%f29
	brgz,a	%l0,	loop_3038
	nop
	setx	loop_3039,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdne	%icc,	%f5,	%f14
	sir	0x1EB0
loop_3038:
	fnot1s	%f20,	%f13
loop_3039:
	umul	%i7,	%i0,	%l1
	fmovsg	%xcc,	%f28,	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l5,	%l6
	fxor	%f20,	%f2,	%f8
	add	%o0,	%g1,	%l3
	fmul8x16	%f2,	%f30,	%f12
	membar	0x34
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2834
!	Type x   	: 1265
!	Type cti   	: 3039
!	Type f   	: 4462
!	Type i   	: 13400
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x58467B33
.word 0xFD1E1583
.word 0x3E2C9D2A
.word 0xAC5983A5
.word 0x59054705
.word 0xB221C590
.word 0xE4697BB7
.word 0x0E0E776F
.word 0xF8DC4FC7
.word 0xEA021387
.word 0x7C366A22
.word 0x34B93B44
.word 0xBC175614
.word 0xECC3D6AD
.word 0xCDF95617
.word 0x5D9C356E
.word 0x9372EFFC
.word 0xB39108F3
.word 0x08BF09D8
.word 0x0B442E0D
.word 0x626D21D3
.word 0x3287B0F0
.word 0xA14EB6D9
.word 0x7A363531
.word 0xDEA891E3
.word 0xBA0C6BA3
.word 0x150D3A98
.word 0xDD33D0F6
.word 0x74568CAA
.word 0xB4728F29
.word 0xD923EEBB
.word 0xAD9111DD
.word 0x5FE02897
.word 0x7876884A
.word 0xF671C601
.word 0x4EAC878E
.word 0xAE80BFB1
.word 0x595FE15A
.word 0x058A8D04
.word 0xB8A222EB
.word 0x5C9BAFFF
.word 0x5CF9EE71
.word 0x32652B78
.word 0x0075B2BE
.word 0xE6E22100
.word 0xE18B94BC
.word 0x961E0B2D
.word 0xAB257DDB
.word 0xBA6A631F
.word 0x0E2455DD
.word 0xEEB19031
.word 0x68459297
.word 0x6BBC8B1D
.word 0xB0249221
.word 0x906F91ED
.word 0x56B38F1A
.word 0x36F51865
.word 0x6EE8CEAD
.word 0x544EB64E
.word 0x6F272182
.word 0x4601DBE9
.word 0x42F0489D
.word 0x60AD9A97
.word 0x52A75249
.end
