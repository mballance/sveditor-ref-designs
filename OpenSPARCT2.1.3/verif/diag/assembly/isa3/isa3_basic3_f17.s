/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f17.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f17.s,v 1.1 2007/05/11 17:22:22 drp Exp $"
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
	setx	0x82DDF29A10724BE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x3,	%g2
	set	0x6,	%g3
	set	0xF,	%g4
	set	0x2,	%g5
	set	0xF,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x9,	%i1
	set	-0xA,	%i2
	set	-0x9,	%i3
	set	-0x0,	%i4
	set	-0x8,	%i5
	set	-0x9,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x50B38774,	%l0
	set	0x32A8CFE2,	%l1
	set	0x133EF9FA,	%l2
	set	0x64D5EAC3,	%l3
	set	0x5364B940,	%l4
	set	0x40512F83,	%l5
	set	0x54CF3256,	%l6
	!# Output registers
	set	0x0FDE,	%o0
	set	0x1F7D,	%o1
	set	0x0CBB,	%o2
	set	-0x0780,	%o3
	set	0x0CE5,	%o4
	set	0x1A3B,	%o5
	set	-0x01F8,	%o6
	set	-0x02CB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x623A9521981F945F)
	INIT_TH_FP_REG(%l7,%f2,0x269745EB3A804728)
	INIT_TH_FP_REG(%l7,%f4,0x37BFB35B20A50B28)
	INIT_TH_FP_REG(%l7,%f6,0xA6E8E5D64A26B192)
	INIT_TH_FP_REG(%l7,%f8,0xA65460CBE3424E6D)
	INIT_TH_FP_REG(%l7,%f10,0x2233FDFA19A6D179)
	INIT_TH_FP_REG(%l7,%f12,0x12AB052075ADA471)
	INIT_TH_FP_REG(%l7,%f14,0x68210FD685F15CBB)
	INIT_TH_FP_REG(%l7,%f16,0x8F11EDF037DC04BE)
	INIT_TH_FP_REG(%l7,%f18,0x2465B9C0A8F2278B)
	INIT_TH_FP_REG(%l7,%f20,0xBDB490D3B066E4A9)
	INIT_TH_FP_REG(%l7,%f22,0x59937620EBCD4B40)
	INIT_TH_FP_REG(%l7,%f24,0x762869AC4619BEA0)
	INIT_TH_FP_REG(%l7,%f26,0x5794DE031ADD0D9C)
	INIT_TH_FP_REG(%l7,%f28,0xB63CE95D11DD2ED5)
	INIT_TH_FP_REG(%l7,%f30,0x658E942E3205E816)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	edge32ln	%g5,	%o7,	%o5
	add	%l5,	%l1,	%g7
	fnor	%f28,	%f22,	%f2
	tleu	%icc,	0x0
	fbe	%fcc1,	loop_1
	fbne,a	%fcc0,	loop_2
	fmovdpos	%icc,	%f31,	%f21
	popc	0x053E,	%o3
loop_1:
	st	%f14,	[%l7 + 0x78]
loop_2:
	membar	0x5D
	tn	%xcc,	0x4
	fbn	%fcc0,	loop_3
	brlz	%l6,	loop_4
	andncc	%o6,	%o0,	%l2
	fmovrdlez	%o2,	%f22,	%f10
loop_3:
	mulx	%o1,	0x1910,	%o4
loop_4:
	array8	%i3,	%i6,	%i5
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x68] %asi,	%g3
	fbul	%fcc3,	loop_5
	srax	%g4,	%l0,	%i2
	fbu,a	%fcc3,	loop_6
	andn	%g2,	0x0CC3,	%i4
loop_5:
	fmovrdgz	%l3,	%f28,	%f8
	xnorcc	%i7,	0x0DBD,	%l4
loop_6:
	addccc	%i0,	%g6,	%i1
	ldsb	[%l7 + 0x3D],	%g1
	tvs	%icc,	0x1
	fpack32	%f2,	%f0,	%f8
	movne	%icc,	%o7,	%g5
	xorcc	%o5,	%l5,	%g7
	movge	%xcc,	%l1,	%l6
	bcc,a	loop_7
	array16	%o3,	%o0,	%o6
	ldd	[%l7 + 0x58],	%f16
	sdiv	%o2,	0x084B,	%o1
loop_7:
	lduw	[%l7 + 0x78],	%o4
	set	0x18, %i6
	stxa	%i3,	[%l7 + %i6] 0xe2
	membar	#Sync
	subccc	%l2,	0x1C0D,	%i6
	movcc	%xcc,	%i5,	%g4
	sra	%l0,	%i2,	%g2
	fnot1s	%f20,	%f2
	umul	%i4,	%l3,	%i7
	ldd	[%l7 + 0x20],	%f26
	set	0x44, %l4
	lduwa	[%l7 + %l4] 0x81,	%l4
	tg	%icc,	0x1
	brgz,a	%g3,	loop_8
	lduh	[%l7 + 0x62],	%i0
	andcc	%i1,	0x0D23,	%g6
	fbu	%fcc1,	loop_9
loop_8:
	fxnors	%f15,	%f27,	%f15
	edge16l	%g1,	%g5,	%o5
	bvc	loop_10
loop_9:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o7,	%g7,	%l1
	fsrc2s	%f24,	%f7
loop_10:
	edge16n	%l6,	%o3,	%l5
	fcmple16	%f2,	%f18,	%o6
	taddcc	%o0,	%o2,	%o4
	fble	%fcc1,	loop_11
	smulcc	%i3,	0x1628,	%l2
	tgu	%xcc,	0x4
	fmovdn	%xcc,	%f27,	%f27
loop_11:
	orcc	%i6,	%o1,	%g4
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l0
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	xnorcc	%i5,	%g2,	%i4
	movrgz	%i7,	%l4,	%g3
	fcmpne32	%f28,	%f2,	%l3
	ta	%xcc,	0x1
	fands	%f26,	%f9,	%f31
	set	0x08, %l1
	ldswa	[%l7 + %l1] 0x80,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g6,	%i1
	fxnors	%f25,	%f8,	%f7
	movrlez	%g1,	%g5,	%o7
	smul	%g7,	0x1BFB,	%o5
	tleu	%icc,	0x5
	edge32	%l6,	%l1,	%o3
	fnegd	%f26,	%f18
	bcc,pn	%xcc,	loop_12
	movle	%xcc,	%l5,	%o0
	movvs	%xcc,	%o6,	%o4
	fcmpne32	%f16,	%f24,	%i3
loop_12:
	alignaddr	%o2,	%i6,	%o1
	ta	%xcc,	0x2
	fzeros	%f3
	add	%l2,	%l0,	%g4
	movcs	%icc,	%i2,	%g2
	fornot1s	%f0,	%f7,	%f20
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	brz,a	%i7,	loop_13
	add	%i4,	0x087D,	%l4
	movleu	%xcc,	%g3,	%i0
	bleu,a,pt	%xcc,	loop_14
loop_13:
	array32	%l3,	%g6,	%g1
	edge8l	%g5,	%o7,	%g7
	subcc	%i1,	%l6,	%l1
loop_14:
	fmovsa	%icc,	%f13,	%f25
	tvc	%icc,	0x5
	ble,a,pt	%xcc,	loop_15
	sdivcc	%o5,	0x170D,	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%o6
loop_15:
	andncc	%o3,	%i3,	%o2
	subccc	%i6,	%o4,	%o1
	nop
	set	0x13, %g1
	ldsb	[%l7 + %g1],	%l2
	mulscc	%g4,	%i2,	%l0
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g2
	movg	%xcc,	%i5,	%i7
	tle	%xcc,	0x2
	sdiv	%i4,	0x0003,	%l4
	tneg	%xcc,	0x0
	fmovrsne	%i0,	%f28,	%f8
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x50] %asi,	%l3
	umul	%g6,	%g3,	%g5
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sdivcc	%o7,	0x107B,	%g7
	movle	%xcc,	%i1,	%l6
	fbg	%fcc3,	loop_16
	fbne,a	%fcc1,	loop_17
	tneg	%icc,	0x5
	movle	%icc,	%g1,	%o5
loop_16:
	tleu	%xcc,	0x2
loop_17:
	bvc,pt	%xcc,	loop_18
	movre	%l1,	0x34D,	%o0
	subc	%l5,	0x096C,	%o3
	move	%xcc,	%o6,	%i3
loop_18:
	bn,pn	%icc,	loop_19
	edge8	%o2,	%i6,	%o4
	fbl,a	%fcc1,	loop_20
	lduh	[%l7 + 0x56],	%o1
loop_19:
	nop
	setx	loop_21,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabsd	%f10,	%f16
loop_20:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x10],	 0x3
loop_21:
	nop
	set	0x40, %g5
	stxa	%g4,	[%l7 + %g5] 0x10
	fandnot2s	%f27,	%f5,	%f12
	fmovdge	%xcc,	%f18,	%f23
	fmovsleu	%xcc,	%f29,	%f0
	lduh	[%l7 + 0x24],	%l2
	fsrc2	%f14,	%f18
	movcs	%xcc,	%i2,	%l0
	fmovrse	%i5,	%f31,	%f12
	set	0x09, %o0
	stba	%i7,	[%l7 + %o0] 0x0c
	edge32ln	%g2,	%i4,	%i0
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%l3
	movleu	%xcc,	%l4,	%g6
	sethi	0x0817,	%g3
	fmovdle	%icc,	%f13,	%f2
	membar	0x43
	tn	%icc,	0x6
	tcc	%xcc,	0x7
	addcc	%g5,	%o7,	%g7
	orncc	%i1,	0x1779,	%l6
	stx	%g1,	[%l7 + 0x78]
	fbo	%fcc2,	loop_22
	smulcc	%l1,	%o0,	%l5
	srlx	%o5,	%o6,	%i3
	array32	%o2,	%i6,	%o4
loop_22:
	smulcc	%o1,	%o3,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x3
	bleu	%xcc,	loop_23
	movge	%icc,	%i2,	%l0
	tvc	%icc,	0x4
	fbne,a	%fcc2,	loop_24
loop_23:
	fpadd32s	%f30,	%f4,	%f23
	movl	%xcc,	%l2,	%i7
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_24:
	fmovdleu	%xcc,	%f14,	%f17
	movle	%icc,	%g2,	%i4
	movre	%i5,	0x0C0,	%l3
	andcc	%l4,	%i0,	%g3
	fmovsn	%icc,	%f13,	%f7
	movcc	%xcc,	%g6,	%g5
	set	0x28, %g2
	ldsba	[%l7 + %g2] 0x04,	%g7
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%o6
	movpos	%xcc,	%l6,	%g1
	movvs	%icc,	%l1,	%i1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
	andn	%o5,	%o6,	%o0
	brlz,a	%o2,	loop_25
	ta	%icc,	0x3
	bleu,pt	%xcc,	loop_26
	fmovdvc	%xcc,	%f30,	%f26
loop_25:
	fmovrslz	%i3,	%f2,	%f4
	movge	%icc,	%i6,	%o1
loop_26:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x34] %asi,	%o3
	sub	%o4,	%i2,	%g4
	movrlez	%l2,	0x3CB,	%l0
	tge	%xcc,	0x6
	xnorcc	%i7,	0x1FB6,	%i4
	fbule,a	%fcc2,	loop_27
	fmovdn	%icc,	%f5,	%f4
	pdist	%f14,	%f18,	%f8
	fba,a	%fcc0,	loop_28
loop_27:
	brnz	%i5,	loop_29
	orn	%g2,	%l3,	%i0
	movn	%icc,	%l4,	%g6
loop_28:
	edge16l	%g3,	%g7,	%g5
loop_29:
	fexpand	%f21,	%f26
	movg	%xcc,	%o7,	%g1
	bpos,pt	%icc,	loop_30
	movcs	%icc,	%l1,	%l6
	umulcc	%i1,	0x1009,	%l5
	movle	%icc,	%o5,	%o6
loop_30:
	sra	%o0,	%o2,	%i3
	movl	%icc,	%o1,	%o3
	fmovdpos	%xcc,	%f13,	%f16
	ldd	[%l7 + 0x28],	%f16
	mulx	%o4,	%i2,	%i6
	subcc	%l2,	0x148D,	%g4
	brnz,a	%i7,	loop_31
	udivx	%i4,	0x09D6,	%i5
	te	%icc,	0x5
	ldd	[%l7 + 0x60],	%g2
loop_31:
	mulscc	%l3,	%l0,	%i0
	movle	%xcc,	%g6,	%l4
	bpos,a,pt	%icc,	loop_32
	fblg,a	%fcc0,	loop_33
	addcc	%g3,	%g7,	%g5
	andn	%o7,	0x05CA,	%l1
loop_32:
	fpsub32	%f26,	%f12,	%f0
loop_33:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g1,	%l6,	%i1
	fbg,a	%fcc0,	loop_34
	mulscc	%o5,	%l5,	%o6
	membar	0x73
	taddcc	%o2,	%o0,	%o1
loop_34:
	fpack32	%f28,	%f10,	%f24
	smul	%i3,	%o3,	%i2
	fmovdleu	%icc,	%f6,	%f17
	sll	%i6,	%o4,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g4,	%i4
	array32	%i7,	%i5,	%g2
	fxnors	%f16,	%f5,	%f12
	fblg	%fcc1,	loop_35
	nop
	setx	loop_36,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%l3,	0x1866,	%i0
	fbe,a	%fcc0,	loop_37
loop_35:
	orcc	%l0,	%l4,	%g6
loop_36:
	brlz,a	%g7,	loop_38
	array16	%g3,	%o7,	%l1
loop_37:
	xor	%g5,	0x134B,	%g1
	edge16l	%l6,	%i1,	%l5
loop_38:
	nop
	set	0x32, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o5
	sllx	%o6,	%o0,	%o1
	nop
	set	0x70, %i1
	std	%i2,	[%l7 + %i1]
	fbne,a	%fcc0,	loop_39
	alignaddr	%o2,	%o3,	%i6
	srlx	%i2,	0x05,	%l2
	fmovrdgez	%o4,	%f16,	%f10
loop_39:
	fbule,a	%fcc3,	loop_40
	tcs	%xcc,	0x4
	fbg,a	%fcc3,	loop_41
	nop
	setx	loop_42,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_40:
	movn	%xcc,	%i4,	%i7
	fones	%f22
loop_41:
	tvc	%xcc,	0x3
loop_42:
	movrgez	%i5,	0x245,	%g4
	tne	%xcc,	0x6
	array16	%g2,	%i0,	%l0
	xorcc	%l3,	0x19E0,	%g6
	fmul8sux16	%f20,	%f22,	%f26
	fnands	%f29,	%f4,	%f21
	tgu	%xcc,	0x4
	movvs	%icc,	%g7,	%g3
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	mulx	%l4,	%g5,	%g1
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
	set	0x44, %i5
	ldsha	[%l7 + %i5] 0x81,	%l1
	brlez	%l6,	loop_43
	fpadd16s	%f29,	%f5,	%f24
	stw	%i1,	[%l7 + 0x50]
	ba,pn	%xcc,	loop_44
loop_43:
	edge32ln	%l5,	%o5,	%o6
	subcc	%o1,	%o0,	%i3
	tvs	%icc,	0x6
loop_44:
	std	%f8,	[%l7 + 0x20]
	tg	%xcc,	0x4
	ta	%xcc,	0x6
	mulscc	%o3,	0x16F8,	%o2
	udivx	%i6,	0x0C1E,	%l2
	ldsb	[%l7 + 0x20],	%o4
	fpack32	%f10,	%f2,	%f30
	tvc	%icc,	0x7
	andncc	%i2,	%i7,	%i5
	movcc	%icc,	%g4,	%g2
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x89,	%i0
	movvs	%icc,	%i4,	%l3
	taddcc	%g6,	%l0,	%g7
	tle	%xcc,	0x0
	tsubcctv	%o7,	0x17AE,	%g3
	tl	%icc,	0x6
	ldub	[%l7 + 0x3F],	%g5
	fcmple16	%f10,	%f30,	%l4
	tsubcctv	%l1,	0x11CA,	%g1
	movrlz	%l6,	0x06E,	%l5
	orncc	%i1,	%o6,	%o1
	stbar
	fmovsneg	%icc,	%f0,	%f30
	subcc	%o0,	%i3,	%o5
	srl	%o3,	%i6,	%l2
	edge16ln	%o2,	%o4,	%i2
	edge16ln	%i5,	%g4,	%i7
	bg,pn	%icc,	loop_45
	fmovdcc	%icc,	%f1,	%f11
	tsubcc	%i0,	0x143B,	%i4
	for	%f6,	%f18,	%f22
loop_45:
	edge32ln	%g2,	%g6,	%l3
	subccc	%g7,	%l0,	%g3
	tleu	%icc,	0x6
	fexpand	%f20,	%f18
	movle	%xcc,	%o7,	%g5
	movrgz	%l1,	0x216,	%g1
	subc	%l6,	0x0519,	%l4
	tsubcc	%l5,	%o6,	%i1
	tgu	%icc,	0x2
	fpack32	%f10,	%f18,	%f18
	fcmpne16	%f12,	%f26,	%o0
	udivx	%i3,	0x0B36,	%o1
	stbar
	edge32n	%o3,	%i6,	%l2
	tleu	%xcc,	0x1
	edge16n	%o2,	%o4,	%i2
	movpos	%icc,	%i5,	%o5
	sub	%g4,	%i7,	%i0
	bpos,pn	%xcc,	loop_46
	movle	%icc,	%g2,	%i4
	movrgz	%g6,	%g7,	%l0
	alignaddrl	%g3,	%l3,	%g5
loop_46:
	ldx	[%l7 + 0x50],	%o7
	movle	%xcc,	%g1,	%l6
	addcc	%l4,	%l5,	%o6
	ld	[%l7 + 0x3C],	%f6
	movneg	%xcc,	%l1,	%i1
	fbge	%fcc2,	loop_47
	brlz	%o0,	loop_48
	fmovrdlz	%i3,	%f0,	%f6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i6
loop_47:
	movl	%icc,	%l2,	%o1
loop_48:
	ldsh	[%l7 + 0x30],	%o4
	nop
	set	0x48, %o4
	std	%o2,	[%l7 + %o4]
	edge8n	%i2,	%i5,	%g4
	popc	0x1D2D,	%i7
	fmovscc	%icc,	%f19,	%f24
	fmovsvc	%icc,	%f9,	%f6
	fmovsne	%icc,	%f21,	%f17
	fmul8ulx16	%f26,	%f14,	%f22
	smulcc	%i0,	%o5,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f29,	%f2
	nop
	setx loop_49, %l0, %l1
	jmpl %l1, %g2
	ldsw	[%l7 + 0x3C],	%g7
	set	0x70, %l0
	stxa	%l0,	[%l7 + %l0] 0xe2
	membar	#Sync
loop_49:
	fmovdvc	%icc,	%f4,	%f8
	edge16ln	%g3,	%g6,	%l3
	movrlez	%g5,	%g1,	%l6
	movpos	%xcc,	%o7,	%l5
	membar	0x35
	addcc	%o6,	0x12F4,	%l1
	subc	%l4,	0x1A60,	%i1
	tvs	%icc,	0x5
	array8	%o0,	%o3,	%i3
	movvc	%icc,	%l2,	%i6
	fpsub32s	%f28,	%f6,	%f24
	edge32ln	%o4,	%o2,	%o1
	fmovdg	%xcc,	%f6,	%f18
	array32	%i2,	%i5,	%i7
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%g4
	movne	%icc,	%o5,	%i4
	fnot1s	%f22,	%f23
	fba,a	%fcc1,	loop_50
	membar	0x3D
	fcmped	%fcc3,	%f24,	%f28
	tge	%xcc,	0x3
loop_50:
	udivx	%i0,	0x0BED,	%g7
	umul	%l0,	0x1D07,	%g3
	umul	%g6,	0x095E,	%l3
	udiv	%g5,	0x180A,	%g2
	tne	%xcc,	0x0
	edge16ln	%g1,	%o7,	%l6
	fmovsg	%xcc,	%f14,	%f22
	fpsub16	%f2,	%f18,	%f12
	xor	%o6,	0x0220,	%l1
	alignaddr	%l5,	%l4,	%o0
	fmovrdne	%i1,	%f0,	%f0
	xnor	%i3,	%o3,	%l2
	fpsub32	%f8,	%f26,	%f24
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o2
	fmovrse	%o1,	%f9,	%f30
	edge8ln	%i6,	%i2,	%i5
	brgez,a	%i7,	loop_51
	fmovdgu	%xcc,	%f6,	%f5
	smulcc	%g4,	%o5,	%i0
	fbo,a	%fcc2,	loop_52
loop_51:
	subc	%g7,	%l0,	%i4
	fmovsgu	%xcc,	%f7,	%f22
	movvc	%xcc,	%g3,	%g6
loop_52:
	fbo,a	%fcc0,	loop_53
	addcc	%l3,	0x122C,	%g5
	bge	%xcc,	loop_54
	st	%f30,	[%l7 + 0x30]
loop_53:
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
	tcc	%xcc,	0x6
loop_54:
	ble,a,pn	%xcc,	loop_56
	fcmpes	%fcc0,	%f4,	%f26
loop_55:
	ba,a	%xcc,	loop_57
	fbe	%fcc3,	loop_58
loop_56:
	array32	%g1,	%g2,	%o7
	fsrc1	%f24,	%f20
loop_57:
	mulx	%l6,	%l1,	%o6
loop_58:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l4,	%l5,	%i1
	fmovse	%icc,	%f15,	%f5
	brgez	%o0,	loop_59
	udivcc	%o3,	0x0236,	%i3
	fmovd	%f8,	%f20
	nop
	setx	loop_60,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_59:
	fmovscs	%xcc,	%f21,	%f0
	sir	0x000D
	sdiv	%l2,	0x07AB,	%o4
loop_60:
	mulx	%o2,	0x1308,	%i6
	fpadd16s	%f31,	%f16,	%f18
	orn	%o1,	%i2,	%i7
	subc	%i5,	%o5,	%i0
	movvs	%xcc,	%g4,	%l0
	movrgz	%g7,	%g3,	%g6
	fbne	%fcc2,	loop_61
	fbul	%fcc0,	loop_62
	fcmple32	%f28,	%f18,	%l3
	tge	%xcc,	0x5
loop_61:
	bge,a	%xcc,	loop_63
loop_62:
	fmovdpos	%icc,	%f30,	%f27
	orn	%i4,	%g1,	%g2
	fbo	%fcc0,	loop_64
loop_63:
	st	%f21,	[%l7 + 0x34]
	fornot1s	%f1,	%f2,	%f15
	edge16ln	%o7,	%g5,	%l6
loop_64:
	movl	%xcc,	%l1,	%o6
	tsubcctv	%l4,	0x0E2E,	%i1
	set	0x10, %o3
	sta	%f22,	[%l7 + %o3] 0x18
	movre	%l5,	%o3,	%i3
	fmuld8ulx16	%f19,	%f14,	%f28
	edge32ln	%o0,	%o4,	%o2
	edge32n	%l2,	%o1,	%i2
	wr	%g0,	0x23,	%asi
	stxa	%i6,	[%l7 + 0x58] %asi
	membar	#Sync
	st	%f24,	[%l7 + 0x74]
	tcs	%icc,	0x2
	fmovda	%xcc,	%f13,	%f28
	movneg	%xcc,	%i7,	%i5
	movneg	%xcc,	%i0,	%o5
	fmovsge	%icc,	%f4,	%f12
	fandnot1	%f26,	%f4,	%f8
	st	%f30,	[%l7 + 0x2C]
	fmovsne	%icc,	%f12,	%f4
	sethi	0x1E28,	%g4
	fandnot1	%f28,	%f18,	%f2
	tpos	%xcc,	0x5
	mulx	%l0,	%g3,	%g6
	sub	%g7,	0x1E42,	%l3
	movre	%g1,	0x3F9,	%i4
	tsubcctv	%o7,	0x0222,	%g5
	movrgez	%l6,	%g2,	%o6
	ldd	[%l7 + 0x50],	%f2
	sdivx	%l1,	0x1310,	%i1
	subccc	%l4,	%l5,	%o3
	faligndata	%f26,	%f12,	%f26
	wr	%g0,	0x10,	%asi
	sta	%f11,	[%l7 + 0x10] %asi
	tcc	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x16] %asi,	%i3
	edge32l	%o4,	%o0,	%l2
	sdiv	%o2,	0x0B60,	%i2
	movre	%o1,	%i6,	%i5
	lduh	[%l7 + 0x76],	%i0
	fors	%f17,	%f12,	%f29
	call	loop_65
	movrgz	%i7,	0x2B4,	%o5
	std	%f4,	[%l7 + 0x08]
	edge8ln	%g4,	%g3,	%l0
loop_65:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g7,	%g6,	%g1
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x64] %asi,	%i4
	movleu	%icc,	%o7,	%l3
	movgu	%xcc,	%l6,	%g5
	addccc	%o6,	%g2,	%i1
	fones	%f29
	orcc	%l4,	0x186A,	%l1
	fmovsle	%icc,	%f9,	%f26
	fpsub32s	%f7,	%f11,	%f24
	alignaddr	%l5,	%o3,	%i3
	edge32	%o0,	%l2,	%o4
	sra	%o2,	%i2,	%i6
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
	srlx	%o1,	%i5,	%i0
	tsubcctv	%o5,	0x1110,	%i7
	tne	%icc,	0x0
loop_66:
	movgu	%xcc,	%g3,	%l0
	fandnot2s	%f6,	%f3,	%f26
	xorcc	%g7,	0x0148,	%g4
	brlz,a	%g6,	loop_67
	ble,pt	%icc,	loop_68
	tn	%xcc,	0x6
	sll	%i4,	0x00,	%g1
loop_67:
	tcc	%xcc,	0x4
loop_68:
	fmovdvc	%xcc,	%f3,	%f17
	udiv	%l3,	0x0DEC,	%l6
	fnegs	%f4,	%f13
	fandnot2s	%f7,	%f22,	%f21
	andn	%o7,	0x0C4A,	%g5
	fnot2s	%f14,	%f6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	stx	%g2,	[%l7 + 0x48]
	movre	%i1,	0x072,	%o6
	movcc	%icc,	%l4,	%l1
	mulx	%l5,	0x0FB7,	%o3
	umul	%o0,	%l2,	%o4
	fpmerge	%f4,	%f9,	%f10
	tle	%xcc,	0x4
	fbul,a	%fcc0,	loop_69
	tcs	%icc,	0x1
	tcc	%xcc,	0x5
	bcs	loop_70
loop_69:
	and	%i3,	0x1864,	%i2
	edge32	%o2,	%o1,	%i6
	brlz	%i5,	loop_71
loop_70:
	tleu	%xcc,	0x0
	movrgz	%i0,	%i7,	%g3
	set	0x0C, %i4
	ldswa	[%l7 + %i4] 0x19,	%o5
loop_71:
	taddcctv	%g7,	0x1EFE,	%l0
	tle	%icc,	0x1
	edge8ln	%g6,	%i4,	%g4
	fmovrsne	%g1,	%f9,	%f31
	fcmpne32	%f0,	%f14,	%l3
	fsrc2	%f20,	%f20
	xnorcc	%o7,	0x05DA,	%l6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
	fmovdl	%icc,	%f23,	%f29
	movrne	%g2,	0x07B,	%o6
	tle	%xcc,	0x1
	fcmpgt32	%f14,	%f14,	%i1
	set	0x1C, %i2
	lduwa	[%l7 + %i2] 0x19,	%l4
	umulcc	%l1,	0x005A,	%o3
	xor	%l5,	%l2,	%o0
	sth	%o4,	[%l7 + 0x26]
	movrgz	%i2,	0x0DF,	%o2
	fcmpes	%fcc1,	%f2,	%f23
	bl,a	%icc,	loop_72
	or	%o1,	0x06C4,	%i3
	fmovrdgez	%i6,	%f8,	%f18
	array16	%i5,	%i0,	%g3
loop_72:
	nop
	set	0x71, %i3
	stba	%o5,	[%l7 + %i3] 0x23
	membar	#Sync
	ldsh	[%l7 + 0x7A],	%i7
	movcs	%icc,	%g7,	%g6
	andcc	%l0,	0x089A,	%i4
	edge8ln	%g4,	%l3,	%o7
	fnor	%f24,	%f10,	%f2
	bg,pn	%xcc,	loop_73
	bl,a,pn	%xcc,	loop_74
	movrne	%l6,	%g5,	%g1
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o6
loop_73:
	fsrc1	%f16,	%f14
loop_74:
	movvc	%icc,	%g2,	%l4
	umul	%l1,	%i1,	%o3
	bcs,a,pt	%xcc,	loop_75
	sllx	%l5,	0x1E,	%l2
	fcmped	%fcc3,	%f24,	%f14
	ld	[%l7 + 0x4C],	%f12
loop_75:
	fpsub32	%f28,	%f30,	%f6
	ldd	[%l7 + 0x30],	%f12
	movcc	%icc,	%o4,	%o0
	tleu	%xcc,	0x3
	orncc	%o2,	0x0C7E,	%o1
	taddcc	%i3,	0x0048,	%i6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x04,	%asi
	stda	%i4,	[%l7 + 0x10] %asi
	umulcc	%i0,	0x0B48,	%g3
	fmovscs	%icc,	%f29,	%f4
	or	%o5,	0x193D,	%i7
	subccc	%i2,	%g6,	%g7
	sll	%l0,	0x0D,	%g4
	or	%l3,	%o7,	%l6
	fbue,a	%fcc0,	loop_76
	movrgez	%g5,	0x38C,	%i4
	movl	%icc,	%o6,	%g1
	xnorcc	%g2,	0x0C8E,	%l4
loop_76:
	xor	%i1,	%l1,	%l5
	tpos	%icc,	0x0
	fxor	%f10,	%f2,	%f30
	edge8l	%o3,	%l2,	%o0
	bpos,a,pt	%icc,	loop_77
	ta	%xcc,	0x6
	tvs	%xcc,	0x0
	fmovdneg	%xcc,	%f0,	%f21
loop_77:
	sub	%o2,	0x0333,	%o1
	tn	%icc,	0x5
	movvs	%xcc,	%i3,	%o4
	tcc	%xcc,	0x6
	mulscc	%i5,	0x0EF6,	%i0
	movcs	%xcc,	%g3,	%i6
	fpsub32s	%f31,	%f14,	%f30
	orn	%i7,	0x12DE,	%o5
	bneg,pn	%icc,	loop_78
	edge16	%g6,	%g7,	%i2
	fcmpd	%fcc3,	%f28,	%f26
	tvs	%xcc,	0x3
loop_78:
	membar	0x1E
	movle	%xcc,	%g4,	%l0
	bpos,a,pt	%icc,	loop_79
	movn	%xcc,	%o7,	%l3
	mulx	%l6,	0x0961,	%i4
	xnorcc	%o6,	0x1995,	%g1
loop_79:
	edge32ln	%g5,	%l4,	%i1
	xor	%l1,	%l5,	%o3
	bcs	%icc,	loop_80
	fmul8sux16	%f12,	%f2,	%f0
	edge32l	%g2,	%o0,	%o2
	bleu,a	loop_81
loop_80:
	fxors	%f5,	%f31,	%f31
	sdiv	%l2,	0x1542,	%i3
	nop
	set	0x0A, %o6
	ldstub	[%l7 + %o6],	%o4
loop_81:
	orncc	%i5,	%o1,	%g3
	bge,a,pt	%xcc,	loop_82
	array32	%i0,	%i6,	%o5
	subcc	%i7,	%g7,	%i2
	alignaddr	%g4,	%l0,	%g6
loop_82:
	subcc	%l3,	%o7,	%l6
	xnor	%o6,	%g1,	%g5
	fpadd32	%f24,	%f26,	%f2
	sra	%l4,	0x19,	%i1
	ta	%xcc,	0x1
	set	0x1A, %i0
	lduha	[%l7 + %i0] 0x19,	%i4
	movvc	%xcc,	%l1,	%l5
	movne	%xcc,	%o3,	%g2
	movvs	%xcc,	%o2,	%o0
	orn	%i3,	%l2,	%o4
	fbul	%fcc0,	loop_83
	sra	%o1,	0x02,	%g3
	bvs,a	loop_84
	fmovrsgz	%i0,	%f21,	%f17
loop_83:
	taddcctv	%i6,	%o5,	%i7
	movcc	%xcc,	%i5,	%g7
loop_84:
	addcc	%g4,	0x1AB9,	%i2
	orcc	%l0,	0x0256,	%g6
	set	0x4E, %l6
	lduha	[%l7 + %l6] 0x04,	%l3
	membar	0x7B
	srlx	%o7,	0x08,	%l6
	set	0x20, %g4
	stxa	%o6,	[%l7 + %g4] 0x23
	membar	#Sync
	sethi	0x08BA,	%g1
	nop
	setx loop_85, %l0, %l1
	jmpl %l1, %l4
	subccc	%i1,	%g5,	%i4
	be,a	%xcc,	loop_86
	andn	%l1,	%o3,	%l5
loop_85:
	nop
	setx	loop_87,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsge	%icc,	%f17,	%f22
loop_86:
	be	%icc,	loop_88
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87:
	bleu,pt	%xcc,	loop_89
	ta	%icc,	0x1
loop_88:
	tge	%icc,	0x2
	taddcc	%g2,	0x0D63,	%o2
loop_89:
	nop
	wr	%g0,	0x89,	%asi
	stha	%o0,	[%l7 + 0x46] %asi
	movge	%icc,	%l2,	%o4
	xnor	%i3,	%o1,	%g3
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x15
	alignaddrl	%i6,	%o5,	%i0
	andncc	%i5,	%g7,	%i7
	fbul,a	%fcc3,	loop_90
	membar	0x2F
	tcc	%icc,	0x7
	tne	%xcc,	0x1
loop_90:
	fmovscs	%icc,	%f30,	%f20
	sllx	%g4,	%i2,	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%l3
	sllx	%o7,	%o6,	%g1
	add	%l6,	%i1,	%l4
	fbul	%fcc1,	loop_91
	xorcc	%g5,	0x1C77,	%i4
	fmovrdlz	%l1,	%f16,	%f4
	nop
	setx loop_92, %l0, %l1
	jmpl %l1, %o3
loop_91:
	sll	%g2,	%o2,	%o0
	edge32	%l2,	%l5,	%o4
	ldstub	[%l7 + 0x2C],	%i3
loop_92:
	edge32n	%o1,	%i6,	%g3
	tle	%xcc,	0x2
	tge	%xcc,	0x4
	tvc	%icc,	0x3
	ldsb	[%l7 + 0x26],	%i0
	sth	%i5,	[%l7 + 0x4A]
	fzeros	%f31
	ldstub	[%l7 + 0x73],	%g7
	fmovsneg	%xcc,	%f18,	%f8
	movvc	%xcc,	%o5,	%g4
	xorcc	%i7,	0x0377,	%i2
	sdivcc	%l0,	0x075F,	%l3
	subcc	%g6,	%o7,	%g1
	tn	%icc,	0x1
	subccc	%l6,	0x1C05,	%i1
	smul	%o6,	%l4,	%g5
	tcc	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x5C] %asi,	%f29
	xorcc	%i4,	0x1025,	%o3
	umulcc	%g2,	%o2,	%o0
	array8	%l1,	%l5,	%o4
	wr	%g0,	0x80,	%asi
	sta	%f14,	[%l7 + 0x6C] %asi
	tneg	%xcc,	0x4
	fmovdneg	%xcc,	%f30,	%f9
	brnz,a	%l2,	loop_93
	and	%o1,	0x0EE7,	%i3
	stx	%g3,	[%l7 + 0x18]
	fmovdpos	%icc,	%f30,	%f3
loop_93:
	bcs	loop_94
	movne	%icc,	%i6,	%i5
	set	0x57, %g3
	ldsba	[%l7 + %g3] 0x18,	%i0
loop_94:
	bn,a	loop_95
	fmovsvc	%icc,	%f26,	%f3
	ta	%xcc,	0x6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g7
loop_95:
	orn	%g4,	%i2,	%l0
	movcc	%xcc,	%i7,	%g6
	fnegd	%f24,	%f10
	andcc	%o7,	%l3,	%g1
	tcs	%xcc,	0x4
	movvs	%icc,	%i1,	%o6
	bneg,pn	%icc,	loop_96
	be	%icc,	loop_97
	movcc	%icc,	%l4,	%g5
	swap	[%l7 + 0x24],	%i4
loop_96:
	sllx	%o3,	0x0B,	%l6
loop_97:
	movrne	%o2,	0x313,	%g2
	movvc	%icc,	%o0,	%l5
	fmovscc	%icc,	%f7,	%f15
	brnz	%l1,	loop_98
	fxnor	%f18,	%f18,	%f4
	bn,a	loop_99
	move	%icc,	%o4,	%o1
loop_98:
	fors	%f6,	%f7,	%f6
	brgez,a	%i3,	loop_100
loop_99:
	array32	%g3,	%i6,	%l2
	fcmple32	%f30,	%f22,	%i5
	fzero	%f22
loop_100:
	tleu	%icc,	0x1
	bge,a,pn	%icc,	loop_101
	bgu,a	loop_102
	bcs,pt	%icc,	loop_103
	addcc	%o5,	0x0B3F,	%g7
loop_101:
	fpack32	%f18,	%f0,	%f24
loop_102:
	and	%g4,	%i0,	%i2
loop_103:
	movl	%icc,	%i7,	%g6
	movneg	%xcc,	%o7,	%l0
	movre	%l3,	%g1,	%o6
	movle	%icc,	%i1,	%l4
	edge16ln	%g5,	%o3,	%i4
	bne,a	loop_104
	tneg	%icc,	0x4
	lduw	[%l7 + 0x50],	%o2
	tle	%xcc,	0x2
loop_104:
	for	%f30,	%f8,	%f28
	fpsub32s	%f6,	%f18,	%f20
	fbu,a	%fcc1,	loop_105
	edge16ln	%l6,	%g2,	%l5
	st	%f10,	[%l7 + 0x74]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%o0
loop_105:
	movrlez	%o1,	%i3,	%o4
	tneg	%icc,	0x1
	tne	%icc,	0x7
	fmovdcc	%xcc,	%f15,	%f22
	sethi	0x0FCD,	%i6
	alignaddr	%l2,	%g3,	%i5
	bleu	loop_106
	tle	%icc,	0x6
	fble,a	%fcc0,	loop_107
	bvc	loop_108
loop_106:
	movn	%icc,	%g7,	%o5
	fbe,a	%fcc1,	loop_109
loop_107:
	fmovscs	%xcc,	%f17,	%f0
loop_108:
	fmovdne	%xcc,	%f23,	%f7
	xorcc	%g4,	%i2,	%i7
loop_109:
	addccc	%i0,	0x038F,	%g6
	bvc,pn	%xcc,	loop_110
	fornot2	%f0,	%f0,	%f16
	smulcc	%l0,	%o7,	%l3
	bvc,a	loop_111
loop_110:
	srlx	%g1,	%i1,	%o6
	brz,a	%l4,	loop_112
	fmovdge	%xcc,	%f17,	%f22
loop_111:
	bn	%icc,	loop_113
	call	loop_114
loop_112:
	bleu,a	loop_115
	edge16l	%o3,	%g5,	%o2
loop_113:
	tg	%icc,	0x3
loop_114:
	fsrc2s	%f14,	%f21
loop_115:
	fpadd16s	%f30,	%f10,	%f12
	tg	%icc,	0x7
	sra	%l6,	%g2,	%i4
	mulx	%l5,	%l1,	%o1
	movre	%i3,	%o4,	%o0
	fba	%fcc0,	loop_116
	ldsw	[%l7 + 0x4C],	%l2
	fmovdl	%xcc,	%f15,	%f26
	te	%icc,	0x2
loop_116:
	pdist	%f24,	%f24,	%f16
	movrgez	%g3,	%i5,	%g7
	bg,pn	%icc,	loop_117
	bvs,a	loop_118
	fbug	%fcc3,	loop_119
	move	%icc,	%i6,	%o5
loop_117:
	tn	%xcc,	0x0
loop_118:
	movge	%icc,	%i2,	%i7
loop_119:
	edge16l	%i0,	%g4,	%g6
	fmovrsne	%o7,	%f24,	%f1
	sll	%l3,	%l0,	%i1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g1
	fpsub32s	%f29,	%f21,	%f27
	edge8ln	%o6,	%l4,	%o3
	fmovrsgez	%o2,	%f18,	%f5
	ldstub	[%l7 + 0x57],	%g5
	sethi	0x0779,	%g2
	fnot1	%f20,	%f12
	fand	%f4,	%f30,	%f28
	fbug	%fcc0,	loop_120
	mulx	%i4,	0x1502,	%l5
	fbe,a	%fcc0,	loop_121
	movrne	%l6,	0x22E,	%l1
loop_120:
	fmovrdlez	%o1,	%f6,	%f0
	fbge	%fcc1,	loop_122
loop_121:
	sir	0x1B6E
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%i2
	array8	%o0,	%l2,	%o4
loop_122:
	ldx	[%l7 + 0x48],	%i5
	lduh	[%l7 + 0x7C],	%g7
	tpos	%icc,	0x6
	array8	%g3,	%o5,	%i6
	edge8ln	%i2,	%i7,	%i0
	sub	%g4,	0x04DE,	%g6
	fcmpd	%fcc3,	%f14,	%f8
	tleu	%icc,	0x4
	fmul8ulx16	%f6,	%f10,	%f22
	tgu	%icc,	0x4
	tpos	%icc,	0x7
	ldsb	[%l7 + 0x78],	%o7
	fone	%f0
	tge	%icc,	0x4
	ldd	[%l7 + 0x68],	%l0
	edge32ln	%l3,	%i1,	%o6
	movneg	%icc,	%g1,	%o3
	fmovdgu	%xcc,	%f31,	%f9
	alignaddr	%l4,	%o2,	%g2
	fxnors	%f10,	%f24,	%f19
	bleu	loop_123
	fmovsleu	%icc,	%f17,	%f29
	fnot1s	%f2,	%f26
	stw	%i4,	[%l7 + 0x08]
loop_123:
	mulscc	%g5,	0x1B64,	%l5
	fbge,a	%fcc0,	loop_124
	alignaddrl	%l1,	%l6,	%i3
	fabss	%f0,	%f24
	tvc	%icc,	0x6
loop_124:
	bne,pn	%xcc,	loop_125
	ld	[%l7 + 0x58],	%f6
	fmovdge	%xcc,	%f7,	%f27
	alignaddrl	%o0,	%o1,	%l2
loop_125:
	popc	0x0188,	%i5
	movrlez	%g7,	%o4,	%o5
	fnors	%f2,	%f2,	%f4
	brnz,a	%g3,	loop_126
	array16	%i2,	%i7,	%i6
	fors	%f24,	%f15,	%f7
	mulscc	%g4,	0x1152,	%g6
loop_126:
	movcs	%xcc,	%i0,	%l0
	subc	%l3,	0x08D2,	%i1
	fmovsg	%icc,	%f2,	%f8
	nop
	setx	loop_127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg,a	%fcc0,	loop_128
	fpackfix	%f14,	%f24
	set	0x08, %o7
	ldswa	[%l7 + %o7] 0x10,	%o7
loop_127:
	tpos	%icc,	0x3
loop_128:
	call	loop_129
	fandnot2s	%f8,	%f20,	%f5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x0c
loop_129:
	nop
	set	0x0A, %i6
	ldsha	[%l7 + %i6] 0x88,	%g1
	sll	%o6,	%l4,	%o3
	xnor	%o2,	%i4,	%g2
	subccc	%g5,	0x0054,	%l1
	set	0x1C, %l4
	lduha	[%l7 + %l4] 0x10,	%l6
	fmovsneg	%xcc,	%f12,	%f6
	call	loop_130
	edge16	%l5,	%o0,	%o1
	subcc	%i3,	0x1432,	%i5
	fcmple16	%f20,	%f20,	%g7
loop_130:
	addc	%l2,	%o4,	%o5
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i2,	[%g0 + 0x350] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	movgu	%xcc,	%g3,	%i6
	tcs	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x3F, %o2
	stba	%i7,	[%l7 + %o2] 0x81
	srl	%g4,	0x1E,	%i0
	fbue,a	%fcc1,	loop_131
	sdiv	%g6,	0x0094,	%l0
	fmul8x16al	%f8,	%f30,	%f16
	and	%i1,	%l3,	%g1
loop_131:
	fandnot2s	%f17,	%f1,	%f5
	srlx	%o6,	%o7,	%l4
	edge16	%o2,	%o3,	%i4
	fmovdcs	%xcc,	%f0,	%f25
	st	%f30,	[%l7 + 0x5C]
	umul	%g2,	0x198C,	%g5
	edge8l	%l6,	%l1,	%l5
	fpadd32s	%f15,	%f6,	%f19
	movle	%icc,	%o1,	%o0
	siam	0x4
	fbl	%fcc3,	loop_132
	array16	%i3,	%g7,	%i5
	brnz,a	%l2,	loop_133
	fnot2	%f14,	%f8
loop_132:
	be,a	loop_134
	addcc	%o4,	0x0D9F,	%o5
loop_133:
	fmovrsne	%i2,	%f29,	%f2
	fblg,a	%fcc3,	loop_135
loop_134:
	xnor	%i6,	0x031E,	%i7
	edge8l	%g3,	%g4,	%g6
	fcmple16	%f2,	%f14,	%l0
loop_135:
	addcc	%i1,	%i0,	%l3
	movrgez	%g1,	0x258,	%o7
	swap	[%l7 + 0x2C],	%l4
	bgu,pt	%icc,	loop_136
	faligndata	%f2,	%f18,	%f26
	fmovsl	%xcc,	%f21,	%f13
	addccc	%o6,	%o3,	%o2
loop_136:
	bcs,pt	%icc,	loop_137
	andncc	%g2,	%i4,	%l6
	popc	0x0129,	%g5
	tcs	%icc,	0x5
loop_137:
	bpos,a	%xcc,	loop_138
	tn	%icc,	0x1
	movre	%l1,	%o1,	%l5
	andncc	%o0,	%g7,	%i3
loop_138:
	fmovdn	%xcc,	%f20,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f30,	%f12
	std	%f6,	[%l7 + 0x60]
	tg	%icc,	0x7
	movgu	%xcc,	%i5,	%l2
	movneg	%icc,	%o5,	%o4
	fcmpeq16	%f4,	%f10,	%i6
	set	0x48, %g1
	stha	%i2,	[%l7 + %g1] 0x0c
	popc	%i7,	%g3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g4
	sra	%g6,	%i1,	%i0
	bpos	loop_139
	bg,pn	%icc,	loop_140
	fmovsge	%xcc,	%f5,	%f24
	edge8ln	%l3,	%g1,	%l0
loop_139:
	movg	%xcc,	%o7,	%o6
loop_140:
	te	%xcc,	0x7
	array16	%o3,	%l4,	%g2
	movne	%xcc,	%i4,	%o2
	sdiv	%l6,	0x012E,	%g5
	fmovsl	%icc,	%f25,	%f22
	fmovscs	%xcc,	%f7,	%f25
	bl,a,pt	%xcc,	loop_141
	edge32n	%o1,	%l5,	%o0
	set	0x44, %g5
	stwa	%l1,	[%l7 + %g5] 0x22
	membar	#Sync
loop_141:
	andn	%g7,	0x1581,	%i3
	movne	%icc,	%l2,	%i5
	srax	%o4,	0x1D,	%i6
	array16	%o5,	%i7,	%g3
	movrlz	%g4,	0x0A4,	%g6
	fmovscc	%icc,	%f24,	%f1
	movre	%i2,	%i1,	%l3
	ta	%xcc,	0x7
	std	%g0,	[%l7 + 0x68]
	prefetch	[%l7 + 0x58],	 0x1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16l	%i0,	%o7,	%o6
	and	%o3,	0x1A12,	%l4
	ldx	[%l7 + 0x18],	%g2
	xor	%l0,	%i4,	%o2
	tsubcc	%g5,	0x00A0,	%l6
	array16	%l5,	%o1,	%l1
	andncc	%g7,	%i3,	%o0
	umulcc	%i5,	%o4,	%l2
	sir	0x10B5
	smulcc	%i6,	0x1EE7,	%o5
	ldx	[%l7 + 0x18],	%i7
	fmovsleu	%icc,	%f3,	%f27
	bshuffle	%f30,	%f18,	%f22
	fpadd32s	%f26,	%f4,	%f4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g3,	%g6
	brnz	%g4,	loop_142
	st	%f19,	[%l7 + 0x40]
	alignaddrl	%i1,	%i2,	%g1
	fpsub16s	%f1,	%f16,	%f0
loop_142:
	movneg	%xcc,	%i0,	%o7
	fone	%f12
	fmovda	%icc,	%f22,	%f4
	edge16ln	%o6,	%o3,	%l3
	movre	%l4,	0x281,	%l0
	stx	%i4,	[%l7 + 0x50]
	srl	%o2,	%g2,	%g5
	srlx	%l6,	0x01,	%o1
	call	loop_143
	ldd	[%l7 + 0x48],	%f22
	fexpand	%f23,	%f16
	set	0x4A, %o0
	ldsha	[%l7 + %o0] 0x0c,	%l5
loop_143:
	nop
	set	0x6C, %g2
	stwa	%g7,	[%l7 + %g2] 0x80
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tcc	%icc,	0x6
	stb	%l1,	[%l7 + 0x7A]
	srax	%o0,	0x13,	%i5
	edge8l	%i3,	%l2,	%o4
	subc	%i6,	%i7,	%g3
	movgu	%xcc,	%g6,	%g4
	fnegd	%f16,	%f24
	addc	%i1,	%o5,	%i2
	movre	%g1,	%o7,	%i0
	fble	%fcc1,	loop_144
	stw	%o6,	[%l7 + 0x64]
	edge32ln	%l3,	%o3,	%l0
	movge	%xcc,	%l4,	%o2
loop_144:
	srl	%g2,	0x08,	%g5
	sdivcc	%l6,	0x0B9E,	%i4
	fblg,a	%fcc1,	loop_145
	popc	0x0700,	%l5
	fmuld8ulx16	%f2,	%f17,	%f4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x31] %asi,	%o1
loop_145:
	fnegs	%f5,	%f7
	movvc	%icc,	%g7,	%o0
	set	0x0, %l1
	ldxa	[%g0 + %l1] 0x4f,	%i5
	fcmpgt32	%f0,	%f4,	%i3
	fmovrse	%l2,	%f31,	%f3
	brlez,a	%l1,	loop_146
	fmovdge	%xcc,	%f29,	%f12
	swap	[%l7 + 0x78],	%i6
	movgu	%xcc,	%i7,	%o4
loop_146:
	fxor	%f6,	%f0,	%f10
	edge16ln	%g6,	%g3,	%g4
	st	%f30,	[%l7 + 0x78]
	fcmpgt32	%f12,	%f14,	%i1
	brlez,a	%o5,	loop_147
	tle	%xcc,	0x0
	tvs	%xcc,	0x2
	fxnors	%f5,	%f15,	%f20
loop_147:
	ta	%icc,	0x4
	sdivx	%i2,	0x04D3,	%o7
	lduh	[%l7 + 0x5A],	%g1
	movleu	%icc,	%i0,	%l3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0A] %asi,	%o6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	ld	[%l7 + 0x58],	%f0
	fble	%fcc1,	loop_148
	movl	%icc,	%l4,	%o2
	movvc	%icc,	%g2,	%l0
	fmovrsne	%g5,	%f9,	%f3
loop_148:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x1
	tvc	%icc,	0x2
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x14,	%l6
	fandnot1s	%f30,	%f28,	%f23
	sllx	%i4,	0x13,	%l5
	tneg	%icc,	0x3
	bleu,pt	%icc,	loop_149
	fmovscs	%xcc,	%f31,	%f26
	flush	%l7 + 0x58
	andncc	%o1,	%o0,	%i5
loop_149:
	edge32l	%i3,	%l2,	%g7
	movn	%xcc,	%l1,	%i6
	edge16n	%o4,	%g6,	%g3
	add	%i7,	%g4,	%i1
	smulcc	%o5,	%o7,	%g1
	movle	%xcc,	%i0,	%l3
	sll	%o6,	%i2,	%o3
	brgez,a	%o2,	loop_150
	movn	%xcc,	%l4,	%g2
	fba,a	%fcc1,	loop_151
	tgu	%icc,	0x7
loop_150:
	movle	%icc,	%l0,	%l6
	stw	%i4,	[%l7 + 0x14]
loop_151:
	edge32n	%l5,	%o1,	%g5
	sir	0x1025
	be,pn	%xcc,	loop_152
	fexpand	%f15,	%f10
	udivx	%o0,	0x06EF,	%i3
	sra	%l2,	%g7,	%i5
loop_152:
	nop
	set	0x7C, %i1
	lduha	[%l7 + %i1] 0x0c,	%i6
	tl	%icc,	0x3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%l1
	tge	%icc,	0x5
	st	%f1,	[%l7 + 0x3C]
	fcmpd	%fcc3,	%f16,	%f2
	array32	%g6,	%o4,	%i7
	tle	%icc,	0x2
	movcs	%icc,	%g3,	%i1
	bpos,a,pt	%icc,	loop_153
	fpadd32	%f28,	%f12,	%f12
	sdivcc	%o5,	0x1D87,	%o7
	array32	%g1,	%g4,	%i0
loop_153:
	nop
	setx	loop_154,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x3
	fnand	%f10,	%f14,	%f0
	stw	%l3,	[%l7 + 0x58]
loop_154:
	sir	0x0B41
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%o3
	tl	%xcc,	0x4
	movrlez	%o2,	0x34C,	%l4
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf0
	membar	#Sync
	xorcc	%i2,	%l0,	%g2
	fmovrse	%i4,	%f31,	%f16
	for	%f4,	%f8,	%f26
	movre	%l6,	%l5,	%o1
	tl	%xcc,	0x5
	addccc	%g5,	0x170F,	%o0
	fcmpeq16	%f10,	%f30,	%i3
	sdivcc	%g7,	0x103E,	%i5
	fnand	%f10,	%f14,	%f10
	set	0x55, %g7
	lduba	[%l7 + %g7] 0x80,	%l2
	movge	%xcc,	%i6,	%g6
	orn	%o4,	0x1DED,	%i7
	edge8	%l1,	%g3,	%i1
	ldd	[%l7 + 0x20],	%o4
	or	%g1,	%o7,	%g4
	bgu,pn	%icc,	loop_155
	fnot1	%f16,	%f30
	te	%icc,	0x2
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x66] %asi,	%i0
loop_155:
	nop
	setx	loop_156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%o6,	%l3,	%o3
	movrne	%l4,	%o2,	%l0
	movrgez	%i2,	%g2,	%i4
loop_156:
	array16	%l6,	%o1,	%g5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x36] %asi,	%l5
	stw	%o0,	[%l7 + 0x6C]
	bvc,pt	%icc,	loop_157
	bn,pt	%icc,	loop_158
	mova	%icc,	%g7,	%i3
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
loop_157:
	fmovrdgez	%i5,	%f22,	%f26
loop_158:
	movgu	%xcc,	%l2,	%g6
	bvc,pn	%xcc,	loop_160
loop_159:
	lduh	[%l7 + 0x5C],	%o4
	alignaddrl	%i7,	%l1,	%g3
	movg	%icc,	%i1,	%i6
loop_160:
	movcc	%xcc,	%o5,	%o7
	sll	%g1,	0x1C,	%i0
	fble,a	%fcc3,	loop_161
	call	loop_162
	fbl,a	%fcc3,	loop_163
	orncc	%g4,	0x0DA1,	%l3
loop_161:
	edge8n	%o6,	%o3,	%o2
loop_162:
	ta	%xcc,	0x1
loop_163:
	subcc	%l4,	0x16CB,	%i2
	movne	%icc,	%l0,	%g2
	stb	%i4,	[%l7 + 0x42]
	fpsub16s	%f11,	%f0,	%f5
	prefetch	[%l7 + 0x0C],	 0x3
	udiv	%l6,	0x106A,	%g5
	wr	%g0,	0xeb,	%asi
	stba	%l5,	[%l7 + 0x36] %asi
	membar	#Sync
	fbe	%fcc1,	loop_164
	tsubcctv	%o0,	0x1042,	%o1
	mulscc	%i3,	0x028D,	%g7
	sdivx	%i5,	0x1C28,	%g6
loop_164:
	lduw	[%l7 + 0x74],	%o4
	fnegd	%f24,	%f20
	movcc	%xcc,	%i7,	%l2
	wr	%g0,	0x2b,	%asi
	stwa	%g3,	[%l7 + 0x24] %asi
	membar	#Sync
	xorcc	%l1,	0x0E9E,	%i6
	fmul8x16au	%f10,	%f30,	%f4
	movgu	%icc,	%i1,	%o7
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	sllx	%i0,	0x00,	%g1
	fmovdneg	%xcc,	%f15,	%f28
	orncc	%l3,	%o6,	%o3
	addccc	%g4,	0x0638,	%o2
	fsrc2s	%f23,	%f15
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	popc	0x075F,	%i2
	sra	%l4,	0x01,	%g2
	fors	%f23,	%f20,	%f15
	or	%l0,	%i4,	%g5
	fmovdgu	%xcc,	%f3,	%f10
	movneg	%xcc,	%l6,	%o0
	move	%xcc,	%o1,	%i3
	edge8l	%g7,	%l5,	%g6
	tl	%icc,	0x7
	wr	%g0,	0x80,	%asi
	stda	%o4,	[%l7 + 0x58] %asi
	andncc	%i7,	%l2,	%g3
	movrgz	%i5,	0x068,	%l1
	movcs	%icc,	%i1,	%i6
	tne	%xcc,	0x7
	fornot1s	%f2,	%f18,	%f10
	fcmps	%fcc3,	%f17,	%f0
	or	%o5,	0x089D,	%o7
	tpos	%icc,	0x0
	fbo	%fcc2,	loop_165
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f10,	%f24,	%g1
	bgu	loop_166
loop_165:
	orn	%i0,	%l3,	%o6
	movvs	%xcc,	%g4,	%o3
	bpos,pn	%xcc,	loop_167
loop_166:
	or	%i2,	0x071C,	%o2
	movrgz	%g2,	%l4,	%i4
	tl	%xcc,	0x4
loop_167:
	subccc	%g5,	0x0407,	%l0
	sdivcc	%o0,	0x0A4F,	%o1
	movg	%icc,	%i3,	%l6
	andcc	%g7,	%g6,	%o4
	sub	%i7,	%l2,	%g3
	array32	%i5,	%l5,	%i1
	movrlz	%i6,	0x2E5,	%o5
	fnot2s	%f0,	%f12
	edge32	%l1,	%o7,	%g1
	xorcc	%l3,	%o6,	%i0
	fmovrslz	%o3,	%f25,	%f17
	bcs,a,pn	%icc,	loop_168
	flush	%l7 + 0x3C
	fblg,a	%fcc2,	loop_169
	sra	%g4,	%i2,	%g2
loop_168:
	addc	%o2,	0x1AE9,	%l4
	std	%g4,	[%l7 + 0x60]
loop_169:
	edge32ln	%l0,	%i4,	%o1
	fmovs	%f18,	%f31
	subccc	%i3,	0x0CF9,	%o0
	fcmple16	%f12,	%f18,	%l6
	sdivx	%g6,	0x05A2,	%g7
	fbu	%fcc1,	loop_170
	movneg	%icc,	%o4,	%l2
	fpsub16s	%f18,	%f12,	%f28
	smul	%i7,	%i5,	%g3
loop_170:
	fmovdcs	%xcc,	%f27,	%f8
	nop
	setx	loop_171,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%icc,	%i1,	%l5
	movvc	%xcc,	%o5,	%i6
	movn	%icc,	%o7,	%l1
loop_171:
	tsubcctv	%l3,	%o6,	%g1
	tcs	%icc,	0x1
	xnor	%o3,	%g4,	%i2
	tpos	%xcc,	0x4
	xorcc	%g2,	0x1654,	%o2
	fcmple32	%f26,	%f26,	%l4
	xor	%i0,	%l0,	%g5
	smulcc	%o1,	%i4,	%i3
	set	0x54, %i7
	lduba	[%l7 + %i7] 0x14,	%l6
	movrgez	%o0,	0x2DE,	%g7
	fpadd32	%f6,	%f10,	%f8
	movgu	%xcc,	%o4,	%g6
	movrlz	%i7,	%l2,	%g3
	umul	%i1,	0x10ED,	%i5
	fornot1s	%f1,	%f30,	%f23
	bneg,pn	%icc,	loop_172
	movl	%icc,	%l5,	%o5
	fbg,a	%fcc2,	loop_173
	edge8ln	%i6,	%l1,	%o7
loop_172:
	movcs	%icc,	%l3,	%g1
	fexpand	%f31,	%f2
loop_173:
	movgu	%xcc,	%o3,	%g4
	fmul8x16al	%f14,	%f19,	%f6
	edge32	%o6,	%g2,	%i2
	or	%l4,	0x0FE7,	%o2
	tn	%xcc,	0x7
	fcmpne16	%f20,	%f20,	%l0
	fmovrdlez	%i0,	%f4,	%f16
	xor	%o1,	%i4,	%i3
	movpos	%icc,	%g5,	%o0
	fpack32	%f10,	%f14,	%f14
	or	%g7,	0x1327,	%l6
	tleu	%xcc,	0x4
	fnegd	%f22,	%f16
	umul	%o4,	0x060F,	%i7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g6
	fmuld8ulx16	%f27,	%f26,	%f12
	xnor	%l2,	%g3,	%i1
	edge16	%i5,	%l5,	%i6
	movne	%xcc,	%l1,	%o5
	fnands	%f12,	%f27,	%f27
	fbo,a	%fcc0,	loop_174
	movrne	%l3,	0x32A,	%o7
	tg	%icc,	0x3
	fmovspos	%icc,	%f7,	%f0
loop_174:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o3
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x1f,	%f16
	fmovscs	%xcc,	%f1,	%f17
	tvs	%xcc,	0x3
	tgu	%icc,	0x7
	fba,a	%fcc2,	loop_175
	udiv	%g1,	0x196E,	%o6
	tpos	%icc,	0x3
	fbne,a	%fcc3,	loop_176
loop_175:
	bvs,a	%icc,	loop_177
	popc	0x0DEC,	%g4
	stx	%i2,	[%l7 + 0x38]
loop_176:
	edge8n	%g2,	%o2,	%l4
loop_177:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x1C] %asi,	%f0
	xorcc	%l0,	0x090A,	%o1
	brlz	%i4,	loop_178
	movg	%xcc,	%i3,	%i0
	fpsub32s	%f25,	%f19,	%f5
	sll	%o0,	%g7,	%g5
loop_178:
	fmovsa	%icc,	%f30,	%f17
	nop
	setx	loop_179,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%o4,	%l6,	%g6
	movg	%icc,	%l2,	%g3
	tvc	%icc,	0x3
loop_179:
	st	%f20,	[%l7 + 0x6C]
	flush	%l7 + 0x6C
	wr	%g0,	0x57,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
	ldub	[%l7 + 0x18],	%i7
	array16	%i5,	%i6,	%l5
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tcs	%xcc,	0x2
	fblg	%fcc2,	loop_180
	popc	0x1206,	%l1
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x81,	%l3
loop_180:
	sir	0x1D96
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movgu	%xcc,	%o5,	%o7
	edge8l	%o3,	%o6,	%g1
	array16	%g4,	%g2,	%o2
	fmul8x16	%f4,	%f20,	%f20
	umul	%l4,	0x08B5,	%i2
	set	0x2A, %i5
	ldsha	[%l7 + %i5] 0x14,	%l0
	mulscc	%o1,	0x1BA5,	%i4
	fmovdcs	%icc,	%f29,	%f28
	fmovsvs	%xcc,	%f1,	%f25
	movrlez	%i3,	0x2B0,	%i0
	or	%o0,	%g7,	%g5
	movrgez	%l6,	%g6,	%o4
	movle	%icc,	%g3,	%l2
	and	%i1,	0x1D63,	%i7
	ld	[%l7 + 0x64],	%f31
	fmovdge	%xcc,	%f27,	%f8
	ldx	[%l7 + 0x58],	%i5
	smul	%i6,	0x1DC9,	%l5
	fzero	%f20
	lduw	[%l7 + 0x44],	%l3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%l1
	srax	%o5,	%o3,	%o6
	fpmerge	%f30,	%f14,	%f2
	edge32l	%o7,	%g4,	%g2
	movleu	%icc,	%g1,	%o2
	fba	%fcc1,	loop_181
	brgez,a	%l4,	loop_182
	tle	%icc,	0x6
	membar	0x2F
loop_181:
	fbue,a	%fcc2,	loop_183
loop_182:
	movrgez	%l0,	%i2,	%i4
	membar	0x45
	sethi	0x04B5,	%i3
loop_183:
	tn	%icc,	0x1
	edge8n	%o1,	%i0,	%g7
	fmovscc	%xcc,	%f13,	%f20
	edge32l	%g5,	%l6,	%o0
	fcmpeq16	%f30,	%f30,	%o4
	tvs	%xcc,	0x4
	tleu	%icc,	0x1
	sub	%g3,	%g6,	%l2
	fzero	%f20
	movrlz	%i7,	0x11B,	%i5
	fbl,a	%fcc0,	loop_184
	fmovrdlez	%i6,	%f16,	%f22
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%l3
loop_184:
	nop
	setx loop_185, %l0, %l1
	jmpl %l1, %i1
	fmovdcc	%xcc,	%f18,	%f31
	tl	%icc,	0x3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
loop_185:
	edge16n	%o3,	%o5,	%o7
	array16	%g4,	%g2,	%o6
	movleu	%icc,	%g1,	%l4
	sethi	0x1110,	%o2
	edge8ln	%i2,	%i4,	%l0
	movcc	%icc,	%o1,	%i0
	move	%xcc,	%i3,	%g5
	mova	%icc,	%l6,	%o0
	xor	%o4,	%g3,	%g6
	fbn,a	%fcc0,	loop_186
	addc	%l2,	%g7,	%i5
	edge8ln	%i6,	%l5,	%i7
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_186:
	fpmerge	%f29,	%f1,	%f6
	fmovsvs	%xcc,	%f15,	%f23
	stbar
	fmovrsne	%i1,	%f20,	%f18
	fpsub16	%f8,	%f20,	%f28
	alignaddr	%l3,	%l1,	%o3
	fors	%f4,	%f6,	%f27
	array8	%o5,	%o7,	%g4
	std	%g2,	[%l7 + 0x70]
	or	%o6,	%l4,	%o2
	addcc	%g1,	0x1F8B,	%i4
	array8	%i2,	%l0,	%i0
	tge	%xcc,	0x3
	movge	%xcc,	%i3,	%g5
	wr	%g0,	0x18,	%asi
	stda	%o0,	[%l7 + 0x10] %asi
	fxnors	%f19,	%f6,	%f18
	udiv	%o0,	0x0A57,	%l6
	fcmped	%fcc2,	%f16,	%f4
	movrlz	%o4,	%g6,	%g3
	tge	%xcc,	0x3
	tleu	%icc,	0x5
	fmovdleu	%icc,	%f0,	%f23
	fmovsgu	%icc,	%f17,	%f13
	umulcc	%g7,	%l2,	%i6
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x11,	 0x1
	movvc	%icc,	%i7,	%i1
	array32	%l5,	%l3,	%o3
	addcc	%l1,	%o7,	%g4
	subc	%o5,	0x176A,	%g2
	ldd	[%l7 + 0x68],	%f8
	mulx	%l4,	0x0CE7,	%o6
	umul	%g1,	%i4,	%i2
	movle	%icc,	%o2,	%i0
	xnor	%l0,	%i3,	%o1
	fba	%fcc3,	loop_187
	fmovrdlez	%g5,	%f2,	%f30
	bne,a	%xcc,	loop_188
	movrlez	%l6,	%o4,	%g6
loop_187:
	movcc	%xcc,	%o0,	%g3
	tsubcc	%g7,	%i6,	%l2
loop_188:
	fcmps	%fcc0,	%f0,	%f30
	movneg	%icc,	%i7,	%i5
	fmovdg	%icc,	%f0,	%f25
	nop
	setx	loop_189,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%l5,	%l3,	%i1
	fornot1s	%f19,	%f20,	%f10
	fmovsle	%xcc,	%f31,	%f22
loop_189:
	and	%l1,	%o7,	%g4
	fmovdneg	%icc,	%f24,	%f29
	ld	[%l7 + 0x2C],	%f8
	sll	%o5,	%o3,	%g2
	edge8ln	%o6,	%g1,	%i4
	tl	%xcc,	0x5
	ldstub	[%l7 + 0x38],	%i2
	fpadd32	%f20,	%f16,	%f24
	edge16	%o2,	%l4,	%l0
	fxnor	%f18,	%f18,	%f4
	ldub	[%l7 + 0x52],	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o1,	%i3,	%l6
	fornot1s	%f1,	%f11,	%f19
	bl,a	loop_190
	fmovdne	%icc,	%f16,	%f12
	brgz	%o4,	loop_191
	fbe,a	%fcc0,	loop_192
loop_190:
	mulscc	%g5,	%o0,	%g3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x63] %asi,	%g7
loop_191:
	fmovdleu	%xcc,	%f20,	%f0
loop_192:
	lduh	[%l7 + 0x10],	%g6
	fpadd32s	%f1,	%f15,	%f9
	edge16l	%i6,	%l2,	%i7
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x19,	 0x1
	ldub	[%l7 + 0x5C],	%l5
	tcs	%icc,	0x1
	edge32ln	%l3,	%l1,	%o7
	ba,pn	%icc,	loop_193
	taddcctv	%i1,	%o5,	%g4
	tn	%icc,	0x5
	fnands	%f25,	%f25,	%f9
loop_193:
	taddcctv	%g2,	%o3,	%g1
	andn	%o6,	%i2,	%i4
	move	%icc,	%l4,	%l0
	movleu	%icc,	%o2,	%i0
	xor	%o1,	%i3,	%l6
	stw	%o4,	[%l7 + 0x10]
	orn	%o0,	0x0FB5,	%g3
	edge16ln	%g7,	%g6,	%i6
	stb	%g5,	[%l7 + 0x2D]
	siam	0x5
	fbe,a	%fcc1,	loop_194
	te	%icc,	0x0
	movgu	%icc,	%l2,	%i7
	fmovs	%f26,	%f7
loop_194:
	andcc	%l5,	0x14AC,	%l3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
	movne	%xcc,	%i5,	%o7
	subc	%l1,	%o5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g4,	0x0FEC,	%g2
	addc	%o3,	%o6,	%g1
	subc	%i2,	%i4,	%l4
	fmovscs	%xcc,	%f0,	%f12
	tcc	%icc,	0x7
	tg	%icc,	0x3
	fmovsvs	%xcc,	%f29,	%f24
	movrlz	%l0,	0x311,	%i0
	movrgez	%o2,	%o1,	%i3
	subccc	%l6,	0x1B85,	%o4
	set	0x0C, %i2
	lduwa	[%l7 + %i2] 0x14,	%o0
	movl	%xcc,	%g7,	%g6
	fpack16	%f8,	%f25
	bcs	%xcc,	loop_195
	edge8l	%i6,	%g3,	%g5
	ta	%icc,	0x5
	siam	0x2
loop_195:
	brlz,a	%l2,	loop_196
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
loop_196:
	addcc	%i7,	0x0CD3,	%l3
	movrlz	%o7,	0x288,	%l1
	add	%i5,	0x07F2,	%o5
	fcmple16	%f4,	%f18,	%i1
	fand	%f22,	%f24,	%f22
	subc	%g4,	%o3,	%g2
	fzero	%f26
	ble,a	%xcc,	loop_197
	fabss	%f29,	%f31
	nop
	set	0x08, %i3
	ldsw	[%l7 + %i3],	%g1
	movcs	%xcc,	%i2,	%i4
loop_197:
	pdist	%f28,	%f26,	%f24
	mova	%icc,	%o6,	%l0
	andn	%l4,	0x1F6E,	%o2
	ldsh	[%l7 + 0x62],	%i0
	fbn,a	%fcc3,	loop_198
	xor	%i3,	0x1397,	%o1
	tcs	%xcc,	0x7
	movvc	%xcc,	%o4,	%o0
loop_198:
	sllx	%l6,	0x04,	%g7
	bvs,a	loop_199
	srax	%i6,	0x11,	%g3
	sir	0x02F9
	fmovsgu	%xcc,	%f17,	%f21
loop_199:
	tleu	%icc,	0x1
	movcc	%xcc,	%g6,	%l2
	movcc	%xcc,	%l5,	%i7
	xor	%g5,	%l3,	%o7
	fmovdl	%xcc,	%f18,	%f13
	edge16n	%l1,	%o5,	%i1
	fones	%f26
	brgez,a	%i5,	loop_200
	fbe,a	%fcc0,	loop_201
	mulx	%o3,	0x1073,	%g2
	array32	%g1,	%i2,	%i4
loop_200:
	subccc	%o6,	0x053C,	%l0
loop_201:
	movgu	%icc,	%l4,	%g4
	xnorcc	%o2,	0x04D8,	%i3
	fbl,a	%fcc2,	loop_202
	fabsd	%f16,	%f20
	fmovdne	%icc,	%f13,	%f20
	fbue	%fcc0,	loop_203
loop_202:
	bg	%xcc,	loop_204
	alignaddr	%i0,	%o1,	%o4
	srlx	%o0,	0x0C,	%g7
loop_203:
	movpos	%icc,	%l6,	%i6
loop_204:
	nop
	set	0x70, %i0
	stba	%g3,	[%l7 + %i0] 0xeb
	membar	#Sync
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	loop_205,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%l2,	0x0726,	%l5
	tvc	%xcc,	0x1
	subc	%g6,	%i7,	%g5
loop_205:
	movcs	%xcc,	%l3,	%o7
	edge16n	%l1,	%i1,	%o5
	stx	%i5,	[%l7 + 0x48]
	movrgez	%o3,	0x1D1,	%g1
	fmovdvs	%icc,	%f13,	%f17
	sll	%i2,	0x09,	%g2
	smul	%i4,	%l0,	%l4
	fmovspos	%xcc,	%f24,	%f25
	fmovdn	%xcc,	%f19,	%f12
	umul	%g4,	0x1FA4,	%o6
	fmul8x16	%f29,	%f14,	%f30
	edge16	%o2,	%i0,	%o1
	srax	%i3,	%o0,	%o4
	nop
	setx loop_206, %l0, %l1
	jmpl %l1, %g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l6,	0x1727,	%g3
	fmovrsgez	%l2,	%f27,	%f26
loop_206:
	edge8l	%l5,	%g6,	%i7
	fmovs	%f25,	%f15
	orncc	%g5,	%i6,	%o7
	tpos	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	stba	%l1,	[%l7 + 0x5F] %asi
	movg	%xcc,	%l3,	%i1
	movvs	%xcc,	%i5,	%o5
	fpsub32s	%f18,	%f1,	%f9
	add	%o3,	0x0CA9,	%g1
	fmovsn	%icc,	%f16,	%f31
	orcc	%g2,	%i4,	%i2
	fbue,a	%fcc2,	loop_207
	mova	%icc,	%l4,	%g4
	tg	%icc,	0x7
	bvc,a,pn	%icc,	loop_208
loop_207:
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
	fble	%fcc3,	loop_210
	fbuge	%fcc1,	loop_211
loop_208:
	edge32	%l0,	%o6,	%o2
loop_209:
	movne	%icc,	%i0,	%i3
loop_210:
	tge	%xcc,	0x7
loop_211:
	be	%xcc,	loop_212
	bcc,a	%icc,	loop_213
	alignaddrl	%o0,	%o4,	%o1
	alignaddr	%l6,	%g3,	%l2
loop_212:
	srl	%g7,	0x13,	%g6
loop_213:
	subcc	%i7,	0x0946,	%l5
	tle	%xcc,	0x0
	fbl	%fcc1,	loop_214
	tge	%xcc,	0x3
	tvc	%xcc,	0x6
	nop
	setx	loop_215,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_214:
	movgu	%xcc,	%g5,	%i6
	fmovrdne	%o7,	%f24,	%f8
	edge32l	%l3,	%l1,	%i5
loop_215:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f6,	%f8,	%f4
	movgu	%icc,	%i1,	%o3
	andcc	%o5,	0x1D6C,	%g1
	edge32l	%g2,	%i2,	%l4
	fnot2s	%f21,	%f18
	bvc,a	loop_216
	subccc	%i4,	%l0,	%g4
	tvs	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x40] %asi
loop_216:
	subccc	%o2,	%i0,	%i3
	movre	%o0,	0x0E1,	%o4
	fblg	%fcc0,	loop_217
	fbg	%fcc2,	loop_218
	fmovsl	%xcc,	%f9,	%f14
	ldstub	[%l7 + 0x2B],	%o6
loop_217:
	fpadd16	%f22,	%f28,	%f10
loop_218:
	fcmpeq16	%f20,	%f6,	%o1
	movcs	%xcc,	%l6,	%g3
	xorcc	%l2,	%g6,	%g7
	fcmpne32	%f14,	%f14,	%i7
	udivcc	%l5,	0x08D5,	%i6
	ld	[%l7 + 0x44],	%f16
	tsubcctv	%o7,	0x1C77,	%g5
	fbe	%fcc0,	loop_219
	fmovrdlez	%l3,	%f20,	%f24
	orcc	%l1,	0x0F0A,	%i1
	movcs	%icc,	%i5,	%o5
loop_219:
	bleu,a,pn	%xcc,	loop_220
	sll	%g1,	0x08,	%g2
	tleu	%icc,	0x5
	brnz	%o3,	loop_221
loop_220:
	edge16	%i2,	%i4,	%l4
	fmovspos	%xcc,	%f23,	%f13
	fbo,a	%fcc1,	loop_222
loop_221:
	srax	%g4,	0x14,	%l0
	edge16n	%o2,	%i0,	%i3
	bneg,a,pn	%xcc,	loop_223
loop_222:
	edge32l	%o0,	%o6,	%o1
	edge32ln	%o4,	%l6,	%g3
	nop
	setx loop_224, %l0, %l1
	jmpl %l1, %g6
loop_223:
	fmovdvc	%icc,	%f0,	%f7
	call	loop_225
	edge32ln	%l2,	%g7,	%i7
loop_224:
	nop
	wr	%g0,	0x18,	%asi
	stda	%l4,	[%l7 + 0x78] %asi
loop_225:
	taddcctv	%o7,	%i6,	%g5
	fandnot1s	%f17,	%f4,	%f5
	siam	0x0
	fandnot1	%f18,	%f18,	%f28
	wr	%g0,	0xea,	%asi
	stxa	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	mova	%icc,	%l3,	%i5
	movrgz	%o5,	%g1,	%g2
	fmovsg	%xcc,	%f26,	%f30
	array8	%i1,	%i2,	%o3
	tleu	%icc,	0x7
	movrlz	%l4,	0x057,	%i4
	tcs	%xcc,	0x3
	tn	%icc,	0x6
	movrne	%g4,	0x201,	%o2
	array32	%i0,	%l0,	%o0
	fmovse	%xcc,	%f30,	%f25
	fmul8x16al	%f24,	%f30,	%f14
	sllx	%i3,	%o6,	%o1
	fornot1s	%f22,	%f9,	%f5
	srlx	%l6,	%o4,	%g6
	sir	0x0A40
	sra	%g3,	%g7,	%i7
	xor	%l5,	0x0B92,	%o7
	ldd	[%l7 + 0x68],	%l2
	mova	%xcc,	%i6,	%g5
	fcmple32	%f28,	%f26,	%l3
	fmovrslz	%l1,	%f21,	%f16
	fcmpes	%fcc0,	%f21,	%f18
	fxors	%f19,	%f2,	%f1
	fpsub32s	%f22,	%f20,	%f12
	sethi	0x0507,	%o5
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%i5
	addcc	%g1,	0x1B26,	%g2
	tl	%xcc,	0x7
	stb	%i1,	[%l7 + 0x6E]
	andn	%o3,	0x07FF,	%l4
	movleu	%xcc,	%i2,	%g4
	edge16l	%i4,	%o2,	%i0
	tpos	%icc,	0x3
	lduh	[%l7 + 0x6A],	%l0
	movpos	%icc,	%o0,	%i3
	or	%o1,	0x1C5A,	%l6
	sethi	0x1968,	%o4
	fornot2	%f12,	%f16,	%f24
	tneg	%xcc,	0x4
	fblg	%fcc3,	loop_226
	tg	%icc,	0x6
	set	0x4F, %l6
	ldsba	[%l7 + %l6] 0x10,	%o6
loop_226:
	xnor	%g3,	0x16D8,	%g7
	subc	%g6,	0x0382,	%l5
	add	%i7,	%l2,	%o7
	fmovda	%xcc,	%f4,	%f7
	fbn	%fcc2,	loop_227
	movneg	%xcc,	%i6,	%g5
	movl	%icc,	%l3,	%o5
	edge16n	%i5,	%g1,	%l1
loop_227:
	orncc	%g2,	%i1,	%o3
	tg	%icc,	0x5
	edge8ln	%l4,	%g4,	%i2
	nop
	set	0x68, %l2
	lduw	[%l7 + %l2],	%i4
	brlz	%o2,	loop_228
	edge32ln	%l0,	%o0,	%i0
	move	%xcc,	%o1,	%i3
	edge32ln	%l6,	%o6,	%o4
loop_228:
	flush	%l7 + 0x1C
	bgu	loop_229
	tge	%icc,	0x6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x35] %asi,	%g3
loop_229:
	nop
	setx loop_230, %l0, %l1
	jmpl %l1, %g6
	fmovrsgez	%l5,	%f11,	%f9
	fbo	%fcc1,	loop_231
	nop
	setx	loop_232,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_230:
	movle	%xcc,	%i7,	%l2
	sub	%o7,	0x18D6,	%g7
loop_231:
	nop
	set	0x30, %g4
	std	%i6,	[%l7 + %g4]
loop_232:
	orncc	%l3,	0x0219,	%g5
	wr	%g0,	0xeb,	%asi
	stwa	%i5,	[%l7 + 0x78] %asi
	membar	#Sync
	edge32n	%o5,	%g1,	%g2
	subcc	%l1,	%i1,	%l4
	ldd	[%l7 + 0x78],	%o2
	srlx	%g4,	%i2,	%o2
	fbl	%fcc3,	loop_233
	popc	0x1B7D,	%i4
	fmovsne	%icc,	%f14,	%f20
	mulx	%l0,	%o0,	%i0
loop_233:
	fcmpne32	%f28,	%f20,	%o1
	movrne	%i3,	%o6,	%o4
	ldd	[%l7 + 0x30],	%f8
	ldstub	[%l7 + 0x79],	%l6
	sllx	%g6,	%l5,	%i7
	andcc	%l2,	%g3,	%g7
	fbn,a	%fcc2,	loop_234
	fmovdg	%xcc,	%f15,	%f1
	bpos,a	loop_235
	bcc,a	%icc,	loop_236
loop_234:
	tcs	%xcc,	0x7
	sir	0x1755
loop_235:
	fmovdgu	%icc,	%f15,	%f20
loop_236:
	fcmped	%fcc3,	%f16,	%f6
	taddcctv	%o7,	%l3,	%i6
	movle	%xcc,	%g5,	%o5
	movrgez	%i5,	0x362,	%g2
	move	%icc,	%g1,	%i1
	edge32n	%l1,	%l4,	%g4
	array16	%o3,	%i2,	%i4
	fmovrslz	%l0,	%f13,	%f1
	edge32	%o0,	%i0,	%o1
	fandnot1s	%f10,	%f21,	%f21
	popc	0x1D1E,	%i3
	fmuld8sux16	%f15,	%f0,	%f24
	fnot2s	%f12,	%f30
	bleu,pn	%icc,	loop_237
	sethi	0x1E2B,	%o6
	tvc	%icc,	0x0
	edge32n	%o4,	%o2,	%l6
loop_237:
	std	%g6,	[%l7 + 0x20]
	tleu	%xcc,	0x1
	movle	%xcc,	%l5,	%i7
	xor	%g3,	%l2,	%g7
	bne	loop_238
	fmovrsgez	%o7,	%f13,	%f7
	sth	%i6,	[%l7 + 0x28]
	membar	0x0C
loop_238:
	fbu,a	%fcc3,	loop_239
	fxnors	%f31,	%f15,	%f12
	tle	%xcc,	0x3
	fmovsl	%icc,	%f29,	%f16
loop_239:
	sub	%l3,	0x1FEA,	%o5
	bcc,a,pt	%xcc,	loop_240
	add	%g5,	%g2,	%i5
	move	%xcc,	%g1,	%i1
	bg	%icc,	loop_241
loop_240:
	fmovsvc	%xcc,	%f22,	%f12
	fmul8x16	%f19,	%f0,	%f26
	fmovsge	%xcc,	%f15,	%f14
loop_241:
	sdivx	%l1,	0x1D0F,	%g4
	movre	%o3,	0x2E0,	%i2
	edge16ln	%i4,	%l0,	%o0
	tl	%icc,	0x6
	fand	%f26,	%f2,	%f26
	umulcc	%l4,	%o1,	%i3
	edge8n	%i0,	%o6,	%o4
	set	0x79, %g3
	stba	%o2,	[%l7 + %g3] 0xeb
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l6,	%l5
	sdivx	%g6,	0x1DB4,	%i7
	set	0x7B, %g6
	ldstuba	[%l7 + %g6] 0x81,	%l2
	fpsub16	%f2,	%f12,	%f8
	fmul8x16al	%f8,	%f26,	%f24
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bneg	loop_242
	fxors	%f12,	%f16,	%f18
	bgu,a	%icc,	loop_243
	orcc	%g3,	0x1D04,	%g7
loop_242:
	fcmpne32	%f28,	%f28,	%o7
	orncc	%l3,	0x0363,	%o5
loop_243:
	bne,a	loop_244
	xor	%g5,	0x13C0,	%i6
	movcc	%xcc,	%g2,	%g1
	andcc	%i1,	0x0CC8,	%i5
loop_244:
	edge16n	%g4,	%o3,	%l1
	membar	0x69
	umulcc	%i2,	0x1DD2,	%l0
	sub	%i4,	0x1DE2,	%o0
	andncc	%l4,	%o1,	%i3
	movle	%xcc,	%o6,	%i0
	fxors	%f23,	%f26,	%f13
	smul	%o2,	0x0C10,	%o4
	te	%xcc,	0x0
	tl	%icc,	0x5
	set	0x64, %l3
	sta	%f12,	[%l7 + %l3] 0x81
	tn	%icc,	0x4
	fornot2	%f0,	%f8,	%f0
	fmovrslz	%l6,	%f0,	%f8
	fblg,a	%fcc1,	loop_245
	bvs,a,pn	%xcc,	loop_246
	edge8l	%g6,	%l5,	%i7
	fmovsvs	%xcc,	%f29,	%f26
loop_245:
	sll	%g3,	0x0B,	%g7
loop_246:
	array8	%o7,	%l3,	%l2
	edge16ln	%o5,	%i6,	%g2
	edge32	%g1,	%i1,	%i5
	sir	0x1CA9
	edge16n	%g5,	%g4,	%o3
	srl	%l1,	%i2,	%i4
	sdiv	%l0,	0x1790,	%o0
	smulcc	%l4,	0x09E1,	%i3
	fcmpes	%fcc3,	%f29,	%f19
	sll	%o1,	%i0,	%o6
	ldub	[%l7 + 0x12],	%o4
	fmul8x16al	%f19,	%f17,	%f24
	movpos	%xcc,	%l6,	%g6
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f16
	edge16ln	%l5,	%o2,	%i7
	movgu	%icc,	%g3,	%o7
	fmovdleu	%xcc,	%f1,	%f8
	set	0x3A, %i6
	ldsha	[%l7 + %i6] 0x11,	%l3
	smulcc	%l2,	%g7,	%o5
	swap	[%l7 + 0x50],	%g2
	fmovsn	%xcc,	%f18,	%f6
	tcc	%xcc,	0x0
	addcc	%i6,	%i1,	%g1
	edge16ln	%g5,	%g4,	%i5
	umulcc	%o3,	0x1B58,	%l1
	movn	%xcc,	%i4,	%l0
	sir	0x09C1
	edge16n	%i2,	%l4,	%o0
	fsrc2	%f20,	%f0
	fmovsge	%icc,	%f10,	%f17
	subccc	%i3,	%o1,	%i0
	movre	%o4,	0x27E,	%o6
	wr	%g0,	0x81,	%asi
	stwa	%l6,	[%l7 + 0x38] %asi
	membar	0x52
	srax	%l5,	0x1F,	%g6
	andncc	%i7,	%o2,	%g3
	fbne,a	%fcc2,	loop_247
	fmul8ulx16	%f6,	%f4,	%f18
	tpos	%icc,	0x2
	fmovrse	%o7,	%f24,	%f18
loop_247:
	fmovrdlez	%l2,	%f12,	%f12
	fandnot1	%f0,	%f2,	%f10
	edge8	%l3,	%o5,	%g7
	brlez	%g2,	loop_248
	sra	%i6,	%i1,	%g1
	movvc	%xcc,	%g5,	%g4
	fmovsge	%icc,	%f14,	%f5
loop_248:
	tvc	%icc,	0x7
	ld	[%l7 + 0x24],	%f20
	tne	%icc,	0x0
	fmovdle	%icc,	%f5,	%f24
	fmovsle	%xcc,	%f25,	%f8
	tvc	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x16] %asi,	%o3
	subccc	%l1,	0x1B96,	%i4
	andn	%l0,	0x105A,	%i5
	fandnot1s	%f31,	%f0,	%f23
	brgz,a	%i2,	loop_249
	umul	%l4,	%i3,	%o1
	tl	%icc,	0x6
	edge32n	%o0,	%o4,	%o6
loop_249:
	edge16	%i0,	%l6,	%g6
	bshuffle	%f0,	%f24,	%f22
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x30] %asi,	%l5
	fmovsleu	%icc,	%f30,	%f14
	and	%i7,	0x0F03,	%o2
	fbule	%fcc1,	loop_250
	movleu	%xcc,	%o7,	%l2
	movpos	%icc,	%l3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_250:
	alignaddr	%g7,	%g2,	%g3
	tvs	%xcc,	0x4
	fmovdg	%icc,	%f23,	%f17
	fblg,a	%fcc3,	loop_251
	fpadd16s	%f21,	%f27,	%f31
	brgz	%i6,	loop_252
	mulscc	%g1,	%i1,	%g5
loop_251:
	addccc	%g4,	0x1742,	%l1
	popc	0x11E6,	%o3
loop_252:
	orcc	%l0,	%i5,	%i2
	te	%icc,	0x2
	fmovrsne	%l4,	%f5,	%f11
	fpadd32s	%f19,	%f29,	%f9
	movneg	%xcc,	%i4,	%i3
	set	0x72, %l4
	ldsha	[%l7 + %l4] 0x15,	%o0
	brnz	%o1,	loop_253
	fmuld8sux16	%f18,	%f12,	%f14
	stw	%o4,	[%l7 + 0x64]
	xnorcc	%o6,	0x1B50,	%l6
loop_253:
	movvs	%xcc,	%i0,	%g6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%l5
	edge16l	%o2,	%i7,	%o7
	tneg	%xcc,	0x5
	fmovsvs	%xcc,	%f24,	%f19
	edge8n	%l2,	%l3,	%o5
	fnor	%f8,	%f20,	%f4
	fxnors	%f8,	%f22,	%f23
	brgez	%g7,	loop_254
	edge16ln	%g2,	%g3,	%g1
	tcs	%icc,	0x6
	fbg,a	%fcc0,	loop_255
loop_254:
	stw	%i6,	[%l7 + 0x54]
	udivx	%i1,	0x133C,	%g5
	fpsub32s	%f17,	%f1,	%f28
loop_255:
	membar	0x37
	movvc	%icc,	%g4,	%l1
	bgu	%icc,	loop_256
	addcc	%o3,	%i5,	%i2
	fble	%fcc2,	loop_257
	fmul8x16au	%f14,	%f29,	%f22
loop_256:
	xor	%l4,	%l0,	%i3
	bgu,pn	%xcc,	loop_258
loop_257:
	xorcc	%o0,	%i4,	%o1
	addc	%o6,	%o4,	%l6
	tvc	%icc,	0x6
loop_258:
	tcc	%icc,	0x1
	set	0x7C, %g1
	sta	%f23,	[%l7 + %g1] 0x88
	ta	%icc,	0x2
	fmovrde	%g6,	%f20,	%f28
	swap	[%l7 + 0x34],	%i0
	bgu,a	loop_259
	edge8	%l5,	%i7,	%o2
	movgu	%xcc,	%o7,	%l2
	sir	0x17F2
loop_259:
	edge32n	%o5,	%l3,	%g2
	alignaddr	%g7,	%g3,	%i6
	sir	0x1F00
	movrlez	%g1,	%g5,	%i1
	stx	%g4,	[%l7 + 0x50]
	flush	%l7 + 0x0C
	movrlez	%o3,	%l1,	%i5
	fmovrdgz	%i2,	%f26,	%f28
	fmovde	%xcc,	%f21,	%f31
	movn	%icc,	%l0,	%i3
	fbu	%fcc3,	loop_260
	srlx	%l4,	%i4,	%o1
	smul	%o6,	%o0,	%l6
	fmovs	%f11,	%f29
loop_260:
	fmovsvc	%xcc,	%f14,	%f1
	fmovdcs	%xcc,	%f7,	%f20
	movcc	%xcc,	%o4,	%i0
	bneg,a,pn	%xcc,	loop_261
	taddcc	%l5,	0x08C5,	%i7
	stw	%g6,	[%l7 + 0x30]
	fble	%fcc0,	loop_262
loop_261:
	andncc	%o2,	%l2,	%o7
	ld	[%l7 + 0x6C],	%f28
	taddcc	%o5,	0x0A93,	%l3
loop_262:
	nop
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x18,	%g6
	fmovrdlz	%g2,	%f14,	%f2
	fones	%f6
	andn	%g3,	%g1,	%g5
	array8	%i1,	%i6,	%o3
	fmovd	%f12,	%f28
	movgu	%icc,	%l1,	%i5
	fbn	%fcc0,	loop_263
	ta	%icc,	0x2
	tvc	%icc,	0x3
	movge	%xcc,	%g4,	%l0
loop_263:
	sll	%i2,	%i3,	%l4
	andn	%i4,	%o6,	%o0
	edge32	%l6,	%o1,	%o4
	subcc	%l5,	%i7,	%i0
	fxnors	%f21,	%f14,	%f19
	tpos	%xcc,	0x3
	mulscc	%g6,	0x1B4E,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x3
	movrne	%o2,	%o5,	%o7
	call	loop_264
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g7,	0x0C35,	%l3
	edge8ln	%g2,	%g3,	%g1
loop_264:
	tn	%xcc,	0x3
	fabss	%f12,	%f7
	ldsh	[%l7 + 0x36],	%g5
	fpackfix	%f24,	%f30
	tgu	%xcc,	0x3
	movvc	%icc,	%i6,	%o3
	smulcc	%i1,	0x1656,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x19,	%g4,	%l0
	taddcctv	%i2,	%l1,	%l4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x6D] %asi,	%i4
	fcmped	%fcc0,	%f4,	%f26
	fmovdn	%icc,	%f10,	%f1
	movvs	%xcc,	%o6,	%i3
	fbn,a	%fcc2,	loop_265
	membar	0x34
	bpos,pt	%xcc,	loop_266
	orcc	%l6,	%o1,	%o0
loop_265:
	sth	%o4,	[%l7 + 0x46]
	tn	%icc,	0x5
loop_266:
	tg	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x28] %asi
	call	loop_267
	taddcctv	%l5,	0x1E48,	%i0
	xnorcc	%g6,	%l2,	%o2
	sdivcc	%o5,	0x0353,	%i7
loop_267:
	lduw	[%l7 + 0x48],	%o7
	st	%f29,	[%l7 + 0x7C]
	brlz	%l3,	loop_268
	movleu	%icc,	%g2,	%g3
	fble,a	%fcc1,	loop_269
	bneg,a,pt	%xcc,	loop_270
loop_268:
	movpos	%xcc,	%g7,	%g1
	mulscc	%i6,	0x0565,	%o3
loop_269:
	xnorcc	%i1,	%i5,	%g4
loop_270:
	bvc	%icc,	loop_271
	lduh	[%l7 + 0x66],	%l0
	bgu	loop_272
	stbar
loop_271:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x37] %asi,	%g5
loop_272:
	sth	%i2,	[%l7 + 0x42]
	xnor	%l1,	%i4,	%o6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%i3
	fbug,a	%fcc0,	loop_273
	andn	%l6,	0x0CDD,	%o1
	ldd	[%l7 + 0x10],	%l4
	lduw	[%l7 + 0x74],	%o0
loop_273:
	xor	%o4,	0x0290,	%i0
	std	%l4,	[%l7 + 0x70]
	srlx	%g6,	0x13,	%l2
	xnorcc	%o5,	0x139E,	%i7
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x81,	%o7
	addcc	%o2,	%l3,	%g2
	fandnot2	%f10,	%f14,	%f12
	addc	%g3,	0x1202,	%g1
	tgu	%xcc,	0x4
	tcc	%xcc,	0x6
	andn	%g7,	%i6,	%o3
	swap	[%l7 + 0x0C],	%i5
	addcc	%i1,	%g4,	%g5
	bvc,a	%icc,	loop_274
	taddcc	%l0,	0x120C,	%i2
	addccc	%l1,	0x01BA,	%o6
	movrlez	%i4,	0x3E2,	%i3
loop_274:
	movge	%icc,	%o1,	%l4
	bpos	%xcc,	loop_275
	fmuld8ulx16	%f23,	%f6,	%f16
	movn	%xcc,	%l6,	%o4
	andncc	%o0,	%l5,	%g6
loop_275:
	movge	%xcc,	%l2,	%i0
	orn	%i7,	%o5,	%o2
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x18] %asi,	%o7
	movleu	%icc,	%g2,	%l3
	fzeros	%f11
	stbar
	fpadd16s	%f31,	%f5,	%f29
	fnor	%f26,	%f8,	%f0
	bge	loop_276
	fandnot2	%f18,	%f28,	%f22
	fmovrdlz	%g1,	%f22,	%f0
	bcc,a,pt	%icc,	loop_277
loop_276:
	subcc	%g7,	0x102B,	%i6
	fcmple16	%f20,	%f6,	%g3
	movl	%icc,	%o3,	%i5
loop_277:
	subcc	%g4,	0x18DF,	%i1
	smulcc	%g5,	%l0,	%i2
	udivx	%o6,	0x0965,	%l1
	fmovsge	%icc,	%f21,	%f17
	srax	%i3,	0x06,	%i4
	subccc	%o1,	0x1184,	%l6
	bcc,a	loop_278
	fbn,a	%fcc3,	loop_279
	movrgz	%l4,	%o4,	%o0
	ld	[%l7 + 0x2C],	%f18
loop_278:
	sethi	0x1626,	%g6
loop_279:
	fand	%f30,	%f22,	%f2
	st	%f31,	[%l7 + 0x68]
	fbu	%fcc2,	loop_280
	ldsb	[%l7 + 0x57],	%l5
	andncc	%l2,	%i7,	%o5
	edge32ln	%o2,	%i0,	%g2
loop_280:
	fmovdne	%icc,	%f13,	%f22
	fsrc2s	%f24,	%f26
	fbul,a	%fcc1,	loop_281
	tcc	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
loop_281:
	fmovsg	%icc,	%f19,	%f22
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x15,	 0x3
	movrgez	%g1,	0x1BB,	%i6
	movvs	%xcc,	%g7,	%g3
	brlz	%o3,	loop_282
	orncc	%i5,	0x03AD,	%g4
	call	loop_283
	edge32ln	%i1,	%l0,	%g5
loop_282:
	fbne	%fcc0,	loop_284
	umulcc	%i2,	0x058E,	%l1
loop_283:
	nop
	setx loop_285, %l0, %l1
	jmpl %l1, %i3
	addccc	%o6,	%i4,	%l6
loop_284:
	movn	%icc,	%o1,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_285:
	fmul8x16al	%f31,	%f2,	%f4
	taddcctv	%o0,	%o4,	%g6
	std	%f2,	[%l7 + 0x58]
	tvc	%xcc,	0x6
	te	%icc,	0x1
	bleu,a	%icc,	loop_286
	edge8	%l5,	%i7,	%l2
	or	%o2,	%o5,	%i0
	bleu,pt	%xcc,	loop_287
loop_286:
	fxors	%f3,	%f24,	%f30
	ldx	[%l7 + 0x78],	%l3
	andncc	%o7,	%g1,	%i6
loop_287:
	fmovsn	%xcc,	%f13,	%f11
	fmovscc	%xcc,	%f15,	%f31
	nop
	setx	loop_288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%g2,	%g7,	%g3
	xnor	%i5,	%o3,	%i1
	mulx	%g4,	0x0DBA,	%g5
loop_288:
	xnorcc	%l0,	0x1BEB,	%i2
	fornot1s	%f3,	%f25,	%f2
	sub	%i3,	%o6,	%l1
	edge8n	%i4,	%l6,	%o1
	sll	%o0,	0x12,	%o4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x58] %asi,	%l4
	udiv	%g6,	0x0B65,	%i7
	brgz	%l2,	loop_289
	movrlez	%l5,	0x019,	%o2
	nop
	setx	loop_290,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32s	%f13,	%f20,	%f10
loop_289:
	tcs	%xcc,	0x0
	mulx	%i0,	%o5,	%o7
loop_290:
	tcs	%icc,	0x2
	mulscc	%l3,	0x0E13,	%i6
	call	loop_291
	movle	%xcc,	%g2,	%g1
	sub	%g7,	%g3,	%o3
	sll	%i1,	0x15,	%i5
loop_291:
	xor	%g4,	0x0E1B,	%l0
	movvc	%xcc,	%g5,	%i2
	udivcc	%o6,	0x1002,	%i3
	andn	%l1,	0x08AB,	%i4
	fbule	%fcc1,	loop_292
	fmovdg	%xcc,	%f21,	%f25
	lduw	[%l7 + 0x54],	%l6
	xnor	%o1,	%o0,	%o4
loop_292:
	fbu	%fcc0,	loop_293
	membar	0x1A
	edge16n	%g6,	%i7,	%l4
	srax	%l5,	0x1E,	%o2
loop_293:
	sdiv	%l2,	0x0C7B,	%o5
	subccc	%i0,	%o7,	%i6
	bne	loop_294
	movrgz	%l3,	%g2,	%g1
	srl	%g7,	0x17,	%g3
	ta	%xcc,	0x7
loop_294:
	fornot1	%f2,	%f18,	%f12
	set	0x61, %g2
	ldsba	[%l7 + %g2] 0x04,	%o3
	ldd	[%l7 + 0x38],	%f6
	fzero	%f6
	movleu	%icc,	%i5,	%g4
	std	%i0,	[%l7 + 0x70]
	tneg	%xcc,	0x6
	edge32	%l0,	%g5,	%o6
	tsubcctv	%i2,	%l1,	%i3
	fpadd16	%f0,	%f12,	%f30
	taddcctv	%i4,	0x1027,	%l6
	srl	%o1,	%o0,	%o4
	udiv	%g6,	0x07CB,	%l4
	edge32ln	%l5,	%i7,	%l2
	brgez	%o5,	loop_295
	fbuge	%fcc3,	loop_296
	edge8l	%o2,	%i0,	%o7
	ld	[%l7 + 0x6C],	%f4
loop_295:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3E] %asi,	%i6
loop_296:
	nop
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x89,	%g2
	bne	loop_297
	edge16l	%l3,	%g7,	%g1
	umulcc	%g3,	0x10C8,	%i5
	set	0x3A, %i1
	ldsha	[%l7 + %i1] 0x80,	%o3
loop_297:
	movrne	%g4,	0x1E0,	%l0
	edge32l	%i1,	%o6,	%g5
	bneg	%xcc,	loop_298
	fcmpd	%fcc1,	%f18,	%f8
	nop
	setx loop_299, %l0, %l1
	jmpl %l1, %l1
	alignaddr	%i3,	%i4,	%i2
loop_298:
	bcc,a,pn	%icc,	loop_300
	bpos,a,pt	%xcc,	loop_301
loop_299:
	andcc	%o1,	%l6,	%o0
	tvs	%xcc,	0x2
loop_300:
	edge16l	%o4,	%g6,	%l4
loop_301:
	sethi	0x00DB,	%i7
	tl	%xcc,	0x6
	srax	%l2,	0x1F,	%o5
	bg,a,pt	%icc,	loop_302
	sll	%o2,	%i0,	%o7
	nop
	setx	loop_303,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%xcc,	%i6,	%l5
loop_302:
	tsubcc	%g2,	%g7,	%g1
	te	%xcc,	0x6
loop_303:
	andn	%l3,	%i5,	%g3
	set	0x46, %l1
	stba	%o3,	[%l7 + %l1] 0x15
	fnands	%f14,	%f29,	%f4
	set	0x60, %g7
	stxa	%l0,	[%l7 + %g7] 0x14
	fnot2	%f0,	%f0
	subc	%g4,	%o6,	%i1
	tge	%xcc,	0x2
	smul	%l1,	%i3,	%g5
	fmovrsne	%i4,	%f29,	%f18
	edge8l	%o1,	%i2,	%o0
	fmovd	%f20,	%f2
	fsrc2s	%f2,	%f4
	edge32n	%l6,	%g6,	%l4
	fnand	%f30,	%f24,	%f4
	fpack32	%f26,	%f2,	%f14
	fors	%f30,	%f3,	%f30
	set	0x68, %i7
	sta	%f14,	[%l7 + %i7] 0x10
	edge32n	%o4,	%l2,	%o5
	bl,pn	%icc,	loop_304
	srax	%i7,	0x1A,	%o2
	udivcc	%o7,	0x18E2,	%i0
	edge8n	%l5,	%i6,	%g7
loop_304:
	umul	%g2,	%l3,	%g1
	tn	%icc,	0x2
	add	%g3,	%i5,	%o3
	std	%f22,	[%l7 + 0x28]
	addc	%l0,	%o6,	%i1
	fbg,a	%fcc2,	loop_305
	fnors	%f11,	%f20,	%f5
	fbu,a	%fcc0,	loop_306
	movrlez	%l1,	%i3,	%g5
loop_305:
	tleu	%xcc,	0x2
	movrlz	%g4,	%i4,	%o1
loop_306:
	movg	%icc,	%i2,	%l6
	movrgz	%g6,	0x338,	%l4
	xorcc	%o4,	%l2,	%o0
	movn	%xcc,	%o5,	%o2
	add	%i7,	0x086E,	%o7
	smul	%l5,	%i6,	%i0
	te	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g2
	set	0x12, %o4
	lduha	[%l7 + %o4] 0x15,	%g7
	fmovsvc	%xcc,	%f21,	%f28
	sub	%l3,	0x118A,	%g3
	smulcc	%g1,	0x03DC,	%o3
	orn	%l0,	0x0079,	%o6
	edge16	%i5,	%l1,	%i1
	fnot1s	%f24,	%f16
	smul	%g5,	0x0B21,	%i3
	fandnot2s	%f8,	%f22,	%f20
	bleu,a,pn	%xcc,	loop_307
	udiv	%g4,	0x07AF,	%o1
	movneg	%xcc,	%i4,	%l6
	edge8ln	%i2,	%g6,	%l4
loop_307:
	edge32ln	%o4,	%o0,	%o5
	fbg,a	%fcc3,	loop_308
	fbue	%fcc1,	loop_309
	stbar
	sdivx	%o2,	0x0435,	%i7
loop_308:
	fnegs	%f6,	%f9
loop_309:
	fble	%fcc2,	loop_310
	subcc	%l2,	%o7,	%l5
	udivx	%i0,	0x1E60,	%g2
	ldstub	[%l7 + 0x7A],	%g7
loop_310:
	addcc	%l3,	%i6,	%g1
	movcs	%xcc,	%o3,	%g3
	fornot2	%f24,	%f2,	%f0
	bcc	%icc,	loop_311
	bneg,pt	%icc,	loop_312
	fbe	%fcc2,	loop_313
	fornot2s	%f9,	%f30,	%f31
loop_311:
	smul	%o6,	%i5,	%l0
loop_312:
	fnot1	%f20,	%f4
loop_313:
	fmovsvc	%icc,	%f4,	%f27
	fbug	%fcc3,	loop_314
	popc	%l1,	%i1
	array16	%i3,	%g4,	%g5
	umul	%i4,	%o1,	%i2
loop_314:
	fbule	%fcc3,	loop_315
	andcc	%l6,	%g6,	%l4
	tsubcctv	%o0,	%o5,	%o2
	ldstub	[%l7 + 0x1F],	%i7
loop_315:
	tvc	%icc,	0x0
	bcc,pt	%icc,	loop_316
	faligndata	%f24,	%f10,	%f22
	tsubcctv	%l2,	0x1225,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_316:
	fcmpeq32	%f30,	%f28,	%o7
	tsubcc	%i0,	%l5,	%g2
	ldsh	[%l7 + 0x74],	%g7
	movn	%icc,	%i6,	%l3
	sub	%o3,	%g3,	%g1
	sub	%i5,	0x1810,	%l0
	addcc	%o6,	%l1,	%i3
	sub	%g4,	0x03E5,	%i1
	addccc	%g5,	0x0204,	%i4
	fmul8ulx16	%f8,	%f12,	%f6
	sll	%o1,	0x06,	%i2
	or	%g6,	0x176A,	%l4
	bleu	loop_317
	fcmpes	%fcc3,	%f18,	%f7
	addcc	%o0,	%o5,	%o2
	tge	%icc,	0x3
loop_317:
	fbn	%fcc3,	loop_318
	orcc	%l6,	%i7,	%l2
	fsrc1s	%f9,	%f23
	fpack16	%f22,	%f6
loop_318:
	fsrc1s	%f6,	%f3
	fbul	%fcc0,	loop_319
	bne	%xcc,	loop_320
	brnz	%o7,	loop_321
	fcmps	%fcc2,	%f29,	%f3
loop_319:
	fmovsa	%icc,	%f7,	%f29
loop_320:
	sdivx	%i0,	0x0679,	%l5
loop_321:
	mulscc	%g2,	0x1A93,	%g7
	ldd	[%l7 + 0x30],	%f14
	fnor	%f26,	%f22,	%f6
	brnz	%o4,	loop_322
	nop
	setx	loop_323,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdl	%xcc,	%f28,	%f14
	fors	%f12,	%f19,	%f27
loop_322:
	sub	%i6,	%o3,	%l3
loop_323:
	fblg,a	%fcc2,	loop_324
	fmovdn	%xcc,	%f25,	%f30
	movge	%icc,	%g1,	%i5
	sll	%l0,	%g3,	%l1
loop_324:
	movvs	%icc,	%i3,	%o6
	smulcc	%i1,	0x1DF8,	%g5
	tneg	%icc,	0x3
	addccc	%g4,	%i4,	%o1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g6
	movrlez	%i2,	%o0,	%l4
	move	%icc,	%o5,	%l6
	sethi	0x0149,	%o2
	movn	%xcc,	%i7,	%l2
	tvs	%xcc,	0x7
	edge8	%i0,	%l5,	%o7
	udivcc	%g2,	0x0C2B,	%g7
	edge16	%i6,	%o4,	%o3
	fmovsvs	%xcc,	%f15,	%f23
	set	0x24, %l0
	stwa	%g1,	[%l7 + %l0] 0x88
	fmovdg	%xcc,	%f0,	%f11
	smul	%l3,	0x0AD2,	%i5
	fbu,a	%fcc3,	loop_325
	movvs	%xcc,	%l0,	%l1
	movleu	%xcc,	%i3,	%g3
	bn,pn	%xcc,	loop_326
loop_325:
	edge32l	%o6,	%i1,	%g4
	nop
	setx	loop_327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8sux16	%f22,	%f20,	%f10
loop_326:
	edge8	%g5,	%o1,	%i4
	sll	%i2,	0x05,	%g6
loop_327:
	edge8n	%o0,	%l4,	%l6
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fcmpeq16	%f20,	%f20,	%o5
	brlz	%i7,	loop_328
	alignaddrl	%l2,	%o2,	%i0
	bl,pn	%xcc,	loop_329
	tsubcc	%o7,	%g2,	%g7
loop_328:
	bn,a,pt	%icc,	loop_330
	bge,pn	%icc,	loop_331
loop_329:
	andn	%i6,	0x1BAF,	%l5
	ble,a	%icc,	loop_332
loop_330:
	smul	%o4,	0x0879,	%g1
loop_331:
	tl	%icc,	0x5
	fmovsvc	%xcc,	%f0,	%f16
loop_332:
	fmovdle	%xcc,	%f24,	%f27
	tneg	%icc,	0x7
	edge32n	%o3,	%i5,	%l0
	movneg	%xcc,	%l1,	%i3
	ble,pn	%xcc,	loop_333
	nop
	setx	loop_334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%g3,	0x08FC,	%l3
	edge32	%i1,	%o6,	%g4
loop_333:
	orn	%o1,	0x0D3A,	%i4
loop_334:
	movle	%xcc,	%i2,	%g6
	movge	%icc,	%g5,	%o0
	edge16	%l6,	%l4,	%i7
	ldub	[%l7 + 0x59],	%o5
	fbg	%fcc0,	loop_335
	orcc	%l2,	0x181D,	%o2
	fbg	%fcc3,	loop_336
	fpmerge	%f26,	%f3,	%f14
loop_335:
	addcc	%o7,	0x0111,	%g2
	bcs,a,pn	%xcc,	loop_337
loop_336:
	udivcc	%g7,	0x16DC,	%i0
	edge16l	%i6,	%o4,	%g1
	tgu	%xcc,	0x0
loop_337:
	addc	%o3,	0x130D,	%l5
	bcs,a,pn	%xcc,	loop_338
	fnot2	%f30,	%f6
	movn	%xcc,	%l0,	%i5
	subc	%i3,	%l1,	%l3
loop_338:
	nop
	wr	%g0,	0x81,	%asi
	stba	%g3,	[%l7 + 0x53] %asi
	fbg,a	%fcc2,	loop_339
	movn	%icc,	%i1,	%o6
	lduw	[%l7 + 0x3C],	%g4
	tge	%xcc,	0x0
loop_339:
	srlx	%o1,	0x03,	%i2
	edge8l	%g6,	%i4,	%g5
	xorcc	%o0,	0x0E32,	%l6
	umulcc	%i7,	0x1049,	%l4
	fmovdpos	%icc,	%f17,	%f2
	subc	%o5,	%l2,	%o7
	brnz,a	%g2,	loop_340
	edge16n	%o2,	%i0,	%i6
	fmovrdgez	%o4,	%f24,	%f22
	tgu	%icc,	0x1
loop_340:
	brgez	%g1,	loop_341
	fmovrde	%o3,	%f24,	%f12
	tvc	%icc,	0x0
	movpos	%icc,	%g7,	%l5
loop_341:
	ta	%icc,	0x5
	tcs	%icc,	0x2
	fmovscc	%icc,	%f28,	%f10
	fones	%f21
	bcc,a,pn	%icc,	loop_342
	stbar
	sub	%i5,	0x1220,	%l0
	movneg	%xcc,	%l1,	%l3
loop_342:
	movcs	%icc,	%g3,	%i1
	bne,pn	%icc,	loop_343
	srax	%o6,	0x0A,	%i3
	fsrc2s	%f16,	%f11
	fbe,a	%fcc2,	loop_344
loop_343:
	fmovrsne	%o1,	%f18,	%f21
	fcmped	%fcc1,	%f16,	%f16
	sub	%g4,	%g6,	%i2
loop_344:
	orncc	%i4,	%o0,	%l6
	add	%g5,	0x0AEF,	%l4
	fmovs	%f25,	%f3
	tgu	%xcc,	0x1
	fabss	%f14,	%f12
	movleu	%icc,	%i7,	%o5
	smulcc	%o7,	%g2,	%l2
	fmovsg	%icc,	%f18,	%f12
	bge,a,pn	%icc,	loop_345
	tvc	%xcc,	0x1
	andncc	%i0,	%i6,	%o4
	fcmple16	%f8,	%f20,	%g1
loop_345:
	stbar
	edge16	%o2,	%g7,	%l5
	array16	%o3,	%i5,	%l1
	andcc	%l3,	0x0DBC,	%g3
	tvs	%xcc,	0x1
	orncc	%l0,	%o6,	%i3
	tneg	%icc,	0x3
	ldd	[%l7 + 0x30],	%f14
	movrlz	%o1,	%g4,	%i1
	fbge	%fcc2,	loop_346
	edge8n	%i2,	%i4,	%g6
	tleu	%icc,	0x6
	srlx	%l6,	0x10,	%g5
loop_346:
	bcs,pt	%xcc,	loop_347
	fnand	%f14,	%f20,	%f6
	fble,a	%fcc0,	loop_348
	srax	%o0,	%l4,	%o5
loop_347:
	tvs	%icc,	0x5
	tn	%xcc,	0x0
loop_348:
	mulscc	%i7,	%o7,	%g2
	ldsh	[%l7 + 0x36],	%i0
	fxnor	%f8,	%f14,	%f22
	movle	%icc,	%i6,	%l2
	tg	%xcc,	0x2
	umul	%g1,	0x0B8F,	%o4
	fzeros	%f18
	movrgez	%g7,	%o2,	%l5
	fmovdcc	%icc,	%f11,	%f30
	movcc	%xcc,	%i5,	%o3
	brnz,a	%l1,	loop_349
	srax	%l3,	%g3,	%o6
	udivcc	%l0,	0x1C93,	%i3
	tsubcc	%g4,	0x140D,	%i1
loop_349:
	stb	%i2,	[%l7 + 0x30]
	taddcctv	%i4,	%o1,	%l6
	tl	%xcc,	0x3
	fxor	%f18,	%f20,	%f12
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x36] %asi,	%g5
	sllx	%o0,	0x16,	%l4
	fmovdgu	%icc,	%f9,	%f5
	std	%o4,	[%l7 + 0x08]
	tsubcc	%i7,	0x1FBC,	%o7
	xorcc	%g6,	0x049F,	%i0
	array16	%i6,	%l2,	%g1
	fbue,a	%fcc3,	loop_350
	stx	%o4,	[%l7 + 0x10]
	tge	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_350:
	fcmpeq32	%f8,	%f0,	%g2
	movleu	%xcc,	%o2,	%l5
	movrgez	%i5,	0x349,	%g7
	fmovdge	%icc,	%f4,	%f8
	andn	%l1,	%o3,	%g3
	wr	%g0,	0x88,	%asi
	stha	%o6,	[%l7 + 0x7E] %asi
	fmovdgu	%icc,	%f14,	%f25
	ldsh	[%l7 + 0x76],	%l3
	fandnot2s	%f12,	%f8,	%f19
	tgu	%xcc,	0x3
	fbul	%fcc0,	loop_351
	smul	%l0,	0x1F90,	%i3
	tsubcc	%g4,	0x1DB2,	%i1
	popc	%i2,	%i4
loop_351:
	umul	%o1,	0x0BAE,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o0,	%l4,	%o5
	edge32n	%l6,	%o7,	%i7
	alignaddr	%g6,	%i6,	%i0
	movcs	%xcc,	%l2,	%g1
	nop
	setx	loop_352,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x4
	sdivx	%g2,	0x0AD7,	%o4
	bl,a	%icc,	loop_353
loop_352:
	tsubcctv	%l5,	%o2,	%g7
	movpos	%xcc,	%i5,	%l1
	andncc	%o3,	%o6,	%g3
loop_353:
	movrlez	%l3,	0x13F,	%i3
	pdist	%f18,	%f30,	%f8
	edge8ln	%l0,	%i1,	%g4
	ta	%xcc,	0x6
	bvs,a,pt	%icc,	loop_354
	fbule,a	%fcc3,	loop_355
	fmovsge	%xcc,	%f24,	%f29
	brgz	%i2,	loop_356
loop_354:
	udivcc	%o1,	0x1CD1,	%i4
loop_355:
	fbuge	%fcc1,	loop_357
	move	%icc,	%o0,	%g5
loop_356:
	tgu	%xcc,	0x3
	swap	[%l7 + 0x10],	%l4
loop_357:
	movvc	%icc,	%l6,	%o7
	fsrc2	%f10,	%f16
	tge	%icc,	0x6
	fmul8x16au	%f7,	%f1,	%f20
	movg	%icc,	%i7,	%o5
	movrlez	%g6,	%i6,	%l2
	subcc	%i0,	0x1D0D,	%g2
	tneg	%xcc,	0x2
	tgu	%xcc,	0x2
	movcc	%xcc,	%g1,	%o4
	bcs,pt	%xcc,	loop_358
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l5,	%o2,	%i5
	movle	%icc,	%g7,	%l1
loop_358:
	movleu	%icc,	%o3,	%g3
	tleu	%icc,	0x6
	fpmerge	%f3,	%f6,	%f16
	edge16ln	%o6,	%l3,	%l0
	movre	%i3,	0x27B,	%i1
	movl	%icc,	%g4,	%i2
	sdiv	%o1,	0x1C99,	%i4
	fmovrdlez	%o0,	%f14,	%f24
	tvs	%icc,	0x5
	tcc	%icc,	0x3
	edge8l	%g5,	%l4,	%o7
	fnegs	%f2,	%f17
	tsubcc	%l6,	0x0941,	%i7
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f18
	bcs	loop_359
	ldd	[%l7 + 0x20],	%f2
	fmovsvs	%xcc,	%f10,	%f7
	set	0x38, %o1
	sta	%f30,	[%l7 + %o1] 0x0c
loop_359:
	ldsb	[%l7 + 0x3E],	%g6
	tg	%xcc,	0x4
	fbne,a	%fcc1,	loop_360
	fble	%fcc0,	loop_361
	fmovrde	%i6,	%f10,	%f6
	fbul,a	%fcc0,	loop_362
loop_360:
	umul	%l2,	%i0,	%g2
loop_361:
	edge32	%o5,	%g1,	%l5
	swap	[%l7 + 0x7C],	%o4
loop_362:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x64] %asi,	%o2
	fexpand	%f6,	%f6
	ldd	[%l7 + 0x48],	%g6
	srlx	%l1,	%o3,	%i5
	tge	%xcc,	0x3
	fpadd32s	%f15,	%f3,	%f12
	movrgz	%o6,	%g3,	%l0
	array16	%l3,	%i3,	%g4
	tge	%icc,	0x7
	edge32n	%i1,	%i2,	%i4
	srax	%o0,	0x11,	%g5
	brlez	%l4,	loop_363
	fblg	%fcc0,	loop_364
	movrne	%o1,	%o7,	%l6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x2D] %asi,	%g6
loop_363:
	movcs	%icc,	%i7,	%i6
loop_364:
	fandnot1	%f18,	%f0,	%f20
	brlez,a	%i0,	loop_365
	fmovdpos	%icc,	%f28,	%f5
	ble,pt	%xcc,	loop_366
	fmovd	%f22,	%f0
loop_365:
	fpadd16	%f2,	%f16,	%f0
	tne	%xcc,	0x6
loop_366:
	mulx	%g2,	0x188A,	%l2
	sdiv	%g1,	0x147B,	%o5
	stbar
	fmovs	%f21,	%f22
	te	%icc,	0x1
	swap	[%l7 + 0x74],	%o4
	fpackfix	%f16,	%f18
	movpos	%icc,	%o2,	%g7
	fmovdvc	%icc,	%f6,	%f5
	srax	%l5,	0x0D,	%o3
	movrlz	%i5,	0x00E,	%o6
	tle	%xcc,	0x7
	fmovda	%xcc,	%f12,	%f25
	add	%l1,	0x0C92,	%l0
	fmovdgu	%xcc,	%f3,	%f8
	andcc	%l3,	%i3,	%g3
	fornot2s	%f1,	%f31,	%f28
	ldstub	[%l7 + 0x6B],	%g4
	tleu	%icc,	0x0
	nop
	setx loop_367, %l0, %l1
	jmpl %l1, %i1
	edge32l	%i2,	%o0,	%g5
	addc	%l4,	%i4,	%o7
	tge	%xcc,	0x0
loop_367:
	movl	%icc,	%o1,	%g6
	fblg,a	%fcc1,	loop_368
	sdivcc	%l6,	0x1335,	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%i0
loop_368:
	ldsw	[%l7 + 0x3C],	%g2
	andcc	%g1,	%l2,	%o4
	edge8n	%o2,	%o5,	%l5
	fabss	%f21,	%f1
	movrgz	%g7,	0x3CE,	%o3
	popc	0x14C5,	%o6
	edge32	%i5,	%l0,	%l3
	edge16n	%l1,	%g3,	%i3
	addc	%i1,	0x05FB,	%g4
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%o0
	stbar
	tl	%xcc,	0x2
	tneg	%icc,	0x2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	nop
	set	0x0C, %i4
	stw	%i2,	[%l7 + %i4]
	nop
	set	0x30, %o5
	ldub	[%l7 + %o5],	%i4
	fmovdn	%icc,	%f17,	%f18
	fmovdleu	%xcc,	%f21,	%f28
	tvc	%xcc,	0x3
	fmovdvc	%xcc,	%f21,	%f29
	be	%xcc,	loop_369
	addc	%o7,	0x02B9,	%l4
	movre	%g6,	0x1BE,	%l6
	xor	%o1,	0x112B,	%i7
loop_369:
	subccc	%i6,	0x0302,	%i0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x68] %asi,	%g1
	fmovsa	%icc,	%f21,	%f26
	srl	%l2,	%g2,	%o2
	tne	%xcc,	0x6
	tcs	%icc,	0x0
	fcmple32	%f30,	%f10,	%o5
	brgz	%o4,	loop_370
	prefetch	[%l7 + 0x08],	 0x2
	sll	%g7,	%l5,	%o6
	wr	%g0,	0x80,	%asi
	stba	%o3,	[%l7 + 0x57] %asi
loop_370:
	ldub	[%l7 + 0x4C],	%l0
	smul	%l3,	0x0DDE,	%l1
	andncc	%i5,	%g3,	%i3
	set	0x62, %i2
	ldsha	[%l7 + %i2] 0x19,	%g4
	movcs	%icc,	%i1,	%o0
	movne	%icc,	%i2,	%g5
	subccc	%i4,	0x16D7,	%o7
	edge8	%l4,	%g6,	%o1
	fmuld8ulx16	%f27,	%f14,	%f12
	movle	%xcc,	%l6,	%i6
	xorcc	%i7,	0x18D8,	%g1
	fpack32	%f6,	%f14,	%f8
	fexpand	%f19,	%f28
	movre	%l2,	%i0,	%g2
	taddcctv	%o2,	0x0265,	%o4
	movn	%xcc,	%g7,	%o5
	mova	%xcc,	%o6,	%l5
	movrgz	%l0,	0x39F,	%o3
	fmul8x16au	%f31,	%f4,	%f2
	fsrc2	%f12,	%f16
	alignaddr	%l3,	%l1,	%g3
	and	%i5,	%i3,	%g4
	srax	%i1,	0x0B,	%o0
	xorcc	%i2,	%i4,	%o7
	andcc	%l4,	%g6,	%o1
	edge16l	%g5,	%l6,	%i6
	movneg	%icc,	%i7,	%l2
	bcc	loop_371
	stw	%i0,	[%l7 + 0x10]
	movrgez	%g2,	%o2,	%o4
	siam	0x0
loop_371:
	fors	%f13,	%f4,	%f22
	movvs	%xcc,	%g7,	%o5
	fmul8x16au	%f17,	%f19,	%f6
	ldx	[%l7 + 0x38],	%o6
	srax	%l5,	0x09,	%g1
	fmovsge	%xcc,	%f11,	%f0
	fbn	%fcc0,	loop_372
	tcc	%icc,	0x6
	alignaddrl	%l0,	%l3,	%l1
	fbule,a	%fcc0,	loop_373
loop_372:
	fbuge	%fcc0,	loop_374
	edge16l	%o3,	%g3,	%i3
	tge	%xcc,	0x0
loop_373:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g4
loop_374:
	andncc	%i1,	%i5,	%o0
	tneg	%icc,	0x0
	umul	%i4,	0x1469,	%o7
	edge16ln	%i2,	%g6,	%o1
	fones	%f5
	smulcc	%l4,	%g5,	%l6
	ldsh	[%l7 + 0x78],	%i6
	movg	%icc,	%i7,	%i0
	subccc	%g2,	%l2,	%o4
	fmovrdlz	%g7,	%f28,	%f30
	andn	%o2,	%o5,	%o6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x30] %asi,	%l5
	edge8n	%g1,	%l0,	%l1
	ta	%xcc,	0x5
	flush	%l7 + 0x78
	wr	%g0,	0x89,	%asi
	stda	%o2,	[%l7 + 0x70] %asi
	mulx	%g3,	0x0899,	%i3
	fmovda	%xcc,	%f13,	%f2
	movrgz	%l3,	%i1,	%i5
	fmovrsgez	%g4,	%f11,	%f17
	subc	%o0,	%i4,	%o7
	fmovsne	%icc,	%f29,	%f31
	addccc	%i2,	%o1,	%l4
	fmuld8sux16	%f7,	%f17,	%f8
	or	%g5,	0x0A4C,	%l6
	be,a	loop_375
	andncc	%i6,	%g6,	%i7
	fzero	%f24
	fpsub16	%f4,	%f10,	%f22
loop_375:
	movrlez	%g2,	0x0C1,	%i0
	fba,a	%fcc1,	loop_376
	orcc	%o4,	%g7,	%l2
	fmovdcc	%xcc,	%f27,	%f16
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%o2
loop_376:
	edge16ln	%o5,	%l5,	%g1
	tge	%xcc,	0x6
	fbug,a	%fcc3,	loop_377
	movcs	%xcc,	%o6,	%l1
	xnor	%l0,	0x1F30,	%g3
	sra	%o3,	%l3,	%i3
loop_377:
	fmovrse	%i1,	%f4,	%f6
	tleu	%icc,	0x4
	movgu	%xcc,	%i5,	%o0
	movvc	%xcc,	%i4,	%g4
	st	%f5,	[%l7 + 0x64]
	tsubcctv	%o7,	%i2,	%l4
	movvc	%icc,	%o1,	%g5
	and	%l6,	%g6,	%i7
	stbar
	tle	%xcc,	0x1
	nop
	setx loop_378, %l0, %l1
	jmpl %l1, %i6
	movg	%icc,	%i0,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%l2
loop_378:
	membar	0x59
	smul	%g2,	0x0936,	%o2
	fzeros	%f17
	addccc	%o5,	0x1D7E,	%l5
	and	%g1,	0x0555,	%l1
	srlx	%l0,	%g3,	%o6
	nop
	setx	loop_379,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fble	%fcc0,	loop_380
	nop
	setx	loop_381,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%l3,	0x0C8F,	%i3
loop_379:
	bpos,a,pn	%xcc,	loop_382
loop_380:
	edge8n	%i1,	%o3,	%i5
loop_381:
	fbg,a	%fcc1,	loop_383
	fabsd	%f24,	%f2
loop_382:
	fcmpes	%fcc0,	%f21,	%f19
	movge	%xcc,	%o0,	%g4
loop_383:
	fble	%fcc2,	loop_384
	fandnot1s	%f25,	%f4,	%f6
	and	%i4,	0x0482,	%i2
	edge32	%o7,	%l4,	%g5
loop_384:
	umulcc	%l6,	0x1A29,	%g6
	fbue	%fcc2,	loop_385
	ldd	[%l7 + 0x20],	%f4
	movge	%icc,	%o1,	%i7
	fbue	%fcc2,	loop_386
loop_385:
	subcc	%i0,	%o4,	%i6
	tvc	%xcc,	0x1
	fpack32	%f24,	%f4,	%f26
loop_386:
	subcc	%g7,	0x04BA,	%g2
	fsrc1	%f18,	%f22
	fpmerge	%f9,	%f8,	%f22
	edge32ln	%o2,	%o5,	%l5
	fmovsge	%xcc,	%f21,	%f8
	tneg	%icc,	0x4
	fmovs	%f9,	%f26
	movne	%icc,	%l2,	%l1
	tle	%icc,	0x0
	fbne	%fcc3,	loop_387
	edge16n	%l0,	%g1,	%o6
	tpos	%icc,	0x4
	sdiv	%l3,	0x1521,	%g3
loop_387:
	ldstub	[%l7 + 0x57],	%i1
	fbne	%fcc3,	loop_388
	tvs	%icc,	0x4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o3,	%i3
loop_388:
	tleu	%icc,	0x2
	std	%f4,	[%l7 + 0x68]
	taddcc	%o0,	%g4,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i4,	%o7
	fnegd	%f20,	%f16
	orncc	%l4,	%i2,	%l6
	array32	%g5,	%g6,	%o1
	sdivcc	%i7,	0x10E7,	%o4
	edge8n	%i6,	%i0,	%g2
	edge16n	%o2,	%o5,	%l5
	andncc	%l2,	%l1,	%g7
	fmovsneg	%xcc,	%f5,	%f0
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f26,	%f28,	%f14
	fbo	%fcc3,	loop_389
	taddcctv	%g1,	0x0365,	%o6
	tcs	%icc,	0x2
	taddcctv	%l3,	0x16E0,	%g3
loop_389:
	nop
	set	0x5D, %i0
	lduba	[%l7 + %i0] 0x89,	%l0
	array16	%o3,	%i3,	%i1
	edge16l	%o0,	%i5,	%g4
	tsubcctv	%i4,	0x0027,	%l4
	bl,a,pt	%xcc,	loop_390
	bg,pt	%xcc,	loop_391
	orncc	%i2,	0x1E88,	%l6
	tne	%xcc,	0x7
loop_390:
	or	%o7,	0x0C7B,	%g6
loop_391:
	fmovrdne	%o1,	%f12,	%f4
	fmovrdgez	%g5,	%f22,	%f24
	tneg	%xcc,	0x0
	movvs	%xcc,	%o4,	%i7
	taddcc	%i0,	%g2,	%i6
	std	%o4,	[%l7 + 0x30]
	umulcc	%o2,	0x00F2,	%l2
	andncc	%l1,	%g7,	%g1
	smul	%o6,	%l5,	%g3
	movcc	%icc,	%l3,	%o3
	fone	%f26
	mulx	%l0,	%i1,	%o0
	subcc	%i5,	0x155B,	%g4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%i4
	std	%l4,	[%l7 + 0x70]
	movrgz	%i3,	0x05E,	%l6
	sllx	%i2,	%o7,	%g6
	set	0x5C, %o6
	stha	%o1,	[%l7 + %o6] 0x2a
	membar	#Sync
	tne	%xcc,	0x7
	movrlez	%o4,	0x1BC,	%i7
	fmovsne	%icc,	%f19,	%f26
	faligndata	%f28,	%f16,	%f24
	set	0x50, %i3
	lduwa	[%l7 + %i3] 0x80,	%i0
	set	0x1C, %l6
	lduha	[%l7 + %l6] 0x18,	%g5
	fbue	%fcc0,	loop_392
	fmovdneg	%xcc,	%f26,	%f24
	movre	%g2,	0x229,	%o5
	srl	%o2,	0x08,	%i6
loop_392:
	xor	%l2,	0x0E20,	%g7
	movvc	%xcc,	%l1,	%o6
	stbar
	fornot1	%f10,	%f26,	%f28
	fmovsvs	%xcc,	%f10,	%f6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tl	%icc,	0x1
	bn,a,pt	%icc,	loop_393
	bvc,a	%icc,	loop_394
	fexpand	%f6,	%f20
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
loop_393:
	tle	%xcc,	0x2
loop_394:
	tcc	%icc,	0x6
	move	%icc,	%l5,	%g1
loop_395:
	movrgez	%l3,	%o3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i1,	%g3,	%i5
	set	0x6C, %l2
	ldsha	[%l7 + %l2] 0x11,	%g4
	brnz,a	%i4,	loop_396
	movrgz	%l4,	0x202,	%i3
	fmuld8sux16	%f25,	%f0,	%f2
	taddcctv	%o0,	0x092C,	%l6
loop_396:
	array16	%i2,	%o7,	%g6
	mulx	%o1,	0x0615,	%i7
	fmovdl	%icc,	%f7,	%f2
	srl	%i0,	%o4,	%g2
	movrgez	%o5,	0x039,	%o2
	movrlez	%g5,	0x2C7,	%l2
	bpos,a	%icc,	loop_397
	andncc	%g7,	%l1,	%i6
	movvc	%icc,	%o6,	%l5
	movcc	%icc,	%l3,	%o3
loop_397:
	fmovspos	%xcc,	%f26,	%f8
	fpadd16s	%f0,	%f21,	%f15
	mova	%icc,	%l0,	%i1
	siam	0x1
	edge16n	%g1,	%g3,	%i5
	set	0x50, %g4
	swapa	[%l7 + %g4] 0x19,	%g4
	edge16n	%i4,	%l4,	%o0
	sllx	%i3,	0x07,	%i2
	fmul8sux16	%f18,	%f26,	%f24
	sll	%l6,	%o7,	%g6
	set	0x38, %g3
	stwa	%i7,	[%l7 + %g3] 0x22
	membar	#Sync
	edge16l	%i0,	%o1,	%g2
	movgu	%xcc,	%o5,	%o2
	sub	%o4,	0x0DBC,	%g5
	sdiv	%g7,	0x1A52,	%l1
	ba,a,pn	%xcc,	loop_398
	fmovsn	%xcc,	%f23,	%f31
	fpsub32	%f20,	%f28,	%f22
	tge	%xcc,	0x3
loop_398:
	fmovda	%icc,	%f4,	%f30
	udivx	%i6,	0x1A30,	%l2
	fornot2s	%f25,	%f27,	%f14
	ldub	[%l7 + 0x50],	%o6
	sub	%l5,	0x1FDE,	%o3
	movcc	%icc,	%l3,	%i1
	movvc	%icc,	%l0,	%g3
	tsubcc	%i5,	0x0AE7,	%g1
	tge	%xcc,	0x0
	brlz,a	%i4,	loop_399
	fbne,a	%fcc3,	loop_400
	sra	%g4,	0x13,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o0,	%i2
loop_399:
	nop
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x18
loop_400:
	fbl	%fcc2,	loop_401
	xor	%l6,	0x0853,	%i3
	array16	%g6,	%o7,	%i0
	array32	%i7,	%o1,	%g2
loop_401:
	fcmpne32	%f14,	%f22,	%o5
	udivx	%o4,	0x1EE1,	%o2
	nop
	setx loop_402, %l0, %l1
	jmpl %l1, %g7
	fbl,a	%fcc2,	loop_403
	fnors	%f13,	%f13,	%f25
	fmuld8sux16	%f19,	%f6,	%f26
loop_402:
	andn	%l1,	0x1FF1,	%i6
loop_403:
	brlez	%g5,	loop_404
	tl	%icc,	0x4
	brgz	%o6,	loop_405
	edge16ln	%l2,	%o3,	%l5
loop_404:
	brnz	%i1,	loop_406
	edge8ln	%l3,	%g3,	%i5
loop_405:
	nop
	setx loop_407, %l0, %l1
	jmpl %l1, %g1
	subc	%l0,	%g4,	%l4
loop_406:
	edge16	%i4,	%o0,	%i2
	edge32l	%i3,	%l6,	%o7
loop_407:
	srl	%i0,	%g6,	%o1
	subcc	%i7,	0x0847,	%o5
	addccc	%g2,	0x0860,	%o4
	umul	%o2,	0x092B,	%g7
	tvc	%icc,	0x0
	mova	%icc,	%i6,	%g5
	udiv	%l1,	0x0236,	%l2
	srlx	%o3,	%l5,	%i1
	fnegd	%f28,	%f28
	ldsh	[%l7 + 0x74],	%o6
	fpsub32	%f18,	%f24,	%f2
	fmovsle	%xcc,	%f8,	%f11
	bne,a,pt	%xcc,	loop_408
	tcc	%icc,	0x0
	movcs	%xcc,	%g3,	%i5
	xor	%g1,	0x00A4,	%l0
loop_408:
	edge8	%g4,	%l3,	%l4
	edge32ln	%o0,	%i2,	%i3
	tsubcctv	%i4,	0x02B4,	%l6
	tvs	%icc,	0x6
	tl	%xcc,	0x4
	movg	%xcc,	%i0,	%o7
	stx	%o1,	[%l7 + 0x70]
	swap	[%l7 + 0x50],	%i7
	tle	%xcc,	0x3
	tne	%icc,	0x3
	fpack32	%f30,	%f18,	%f8
	sub	%g6,	0x1586,	%o5
	fornot2	%f8,	%f0,	%f16
	edge32	%g2,	%o4,	%o2
	tsubcc	%i6,	%g7,	%g5
	andcc	%l1,	0x1133,	%l2
	fba	%fcc0,	loop_409
	sdivcc	%o3,	0x1B7E,	%l5
	fmuld8ulx16	%f30,	%f23,	%f6
	edge32ln	%i1,	%o6,	%i5
loop_409:
	brz,a	%g3,	loop_410
	umul	%g1,	%g4,	%l3
	andn	%l0,	0x14DF,	%l4
	popc	%o0,	%i2
loop_410:
	tgu	%icc,	0x1
	fmovsgu	%xcc,	%f28,	%f10
	ldsh	[%l7 + 0x34],	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l6,	%i4,	%o7
	set	0x108, %g6
	stxa	%o1,	[%g0 + %g6] 0x21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_411
	sll	%i0,	0x0E,	%i7
	nop
	setx loop_412, %l0, %l1
	jmpl %l1, %g6
	movvs	%icc,	%g2,	%o5
loop_411:
	fmovsvc	%xcc,	%f0,	%f2
	movvc	%xcc,	%o4,	%o2
loop_412:
	fbge	%fcc1,	loop_413
	movrgez	%i6,	%g5,	%l1
	sir	0x090B
	fbn,a	%fcc1,	loop_414
loop_413:
	udiv	%g7,	0x14A4,	%o3
	sir	0x146A
	sll	%l2,	%l5,	%o6
loop_414:
	ldsw	[%l7 + 0x08],	%i1
	udiv	%g3,	0x1C51,	%i5
	orn	%g1,	%g4,	%l0
	fmovda	%xcc,	%f30,	%f7
	fors	%f1,	%f29,	%f0
	tgu	%icc,	0x5
	fmovsne	%icc,	%f21,	%f10
	udiv	%l4,	0x1F71,	%l3
	movgu	%xcc,	%o0,	%i2
	xorcc	%i3,	%i4,	%o7
	orncc	%l6,	%i0,	%o1
	edge32l	%i7,	%g2,	%g6
	tgu	%xcc,	0x5
	movrlz	%o5,	0x22E,	%o4
	set	0x6C, %o7
	sta	%f10,	[%l7 + %o7] 0x88
	bpos	%xcc,	loop_415
	fmovdg	%xcc,	%f23,	%f14
	fmuld8ulx16	%f7,	%f22,	%f28
	movrlz	%i6,	%g5,	%o2
loop_415:
	fandnot2s	%f0,	%f7,	%f29
	orn	%l1,	0x14CC,	%o3
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x17,	%f16
	movle	%icc,	%g7,	%l2
	tpos	%icc,	0x3
	movne	%xcc,	%l5,	%o6
	edge32l	%i1,	%i5,	%g3
	std	%g0,	[%l7 + 0x68]
	tle	%xcc,	0x5
	fpack32	%f0,	%f10,	%f0
	umul	%g4,	%l4,	%l0
	movrgez	%l3,	%o0,	%i3
	bleu,a,pn	%icc,	loop_416
	fsrc1	%f12,	%f2
	tsubcc	%i4,	0x09CE,	%o7
	move	%icc,	%l6,	%i0
loop_416:
	fcmpgt32	%f26,	%f14,	%i2
	fnot1	%f28,	%f18
	tsubcctv	%o1,	%g2,	%i7
	movg	%icc,	%o5,	%g6
	umulcc	%o4,	0x0EA0,	%g5
	tleu	%icc,	0x6
	fmovdvs	%icc,	%f1,	%f21
	alignaddrl	%o2,	%i6,	%o3
	srl	%g7,	0x00,	%l1
	sdivx	%l5,	0x0023,	%l2
	movge	%icc,	%i1,	%i5
	movpos	%icc,	%o6,	%g1
	andn	%g4,	%g3,	%l0
	fmovdne	%xcc,	%f24,	%f15
	edge16n	%l4,	%l3,	%o0
	edge32n	%i4,	%o7,	%i3
	fbo	%fcc1,	loop_417
	movvs	%icc,	%i0,	%l6
	srl	%o1,	0x1D,	%g2
	fcmpes	%fcc1,	%f24,	%f25
loop_417:
	tpos	%xcc,	0x7
	fcmped	%fcc1,	%f6,	%f0
	set	0x34, %l4
	ldswa	[%l7 + %l4] 0x81,	%i7
	subccc	%o5,	0x0611,	%g6
	fmovdcc	%xcc,	%f3,	%f31
	fnot1	%f8,	%f4
	umul	%i2,	0x1E50,	%o4
	tvc	%xcc,	0x6
	orcc	%o2,	%g5,	%o3
	fmovsne	%xcc,	%f16,	%f16
	bvc	loop_418
	fbue	%fcc2,	loop_419
	ldub	[%l7 + 0x0B],	%g7
	sdiv	%i6,	0x1513,	%l5
loop_418:
	movcc	%xcc,	%l2,	%l1
loop_419:
	fmul8x16au	%f3,	%f26,	%f6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x04
	bleu,pt	%icc,	loop_420
	fnand	%f12,	%f10,	%f14
	andcc	%i1,	0x15B4,	%i5
	fbu,a	%fcc2,	loop_421
loop_420:
	fexpand	%f12,	%f4
	movrgez	%g1,	%g4,	%o6
	edge32ln	%g3,	%l0,	%l3
loop_421:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x59] %asi,	%o0
	udivx	%i4,	0x15FA,	%l4
	tleu	%xcc,	0x2
	alignaddr	%i3,	%i0,	%l6
	fbug,a	%fcc0,	loop_422
	movge	%icc,	%o7,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i7,	%o5
loop_422:
	movvs	%icc,	%g6,	%i2
	fmovdne	%xcc,	%f31,	%f4
	bg,a,pt	%xcc,	loop_423
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o4,	%o1,	%o2
	call	loop_424
loop_423:
	edge16ln	%g5,	%o3,	%i6
	movrlz	%l5,	%l2,	%g7
	fnors	%f15,	%f22,	%f2
loop_424:
	sdivcc	%l1,	0x01CF,	%i1
	tcc	%icc,	0x4
	movg	%xcc,	%i5,	%g4
	bgu,a,pt	%xcc,	loop_425
	fmovsg	%xcc,	%f23,	%f0
	fexpand	%f7,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_425:
	tcc	%xcc,	0x3
	orcc	%g1,	0x1536,	%g3
	movcs	%icc,	%l0,	%o6
	fbuge,a	%fcc3,	loop_426
	fnot1	%f22,	%f26
	fornot1s	%f16,	%f12,	%f11
	fcmple32	%f24,	%f20,	%o0
loop_426:
	fand	%f18,	%f22,	%f24
	fcmple32	%f10,	%f4,	%i4
	bvc,a,pt	%icc,	loop_427
	tpos	%xcc,	0x2
	udivcc	%l4,	0x001D,	%i3
	prefetch	[%l7 + 0x44],	 0x0
loop_427:
	fone	%f24
	fmovdleu	%xcc,	%f26,	%f26
	bcs,a,pn	%icc,	loop_428
	udivx	%l3,	0x15CE,	%l6
	movrgz	%o7,	0x0F0,	%i0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o5
loop_428:
	fmovrdlz	%g6,	%f24,	%f8
	xnorcc	%i2,	%o4,	%o1
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x10,	%o2
	brgz,a	%g5,	loop_429
	fmovs	%f29,	%f28
	move	%icc,	%o3,	%g2
	fmovsg	%xcc,	%f21,	%f13
loop_429:
	sir	0x1D5E
	orcc	%l5,	%l2,	%i6
	ble,a,pn	%icc,	loop_430
	subcc	%l1,	0x0E72,	%i1
	xnor	%g7,	%g4,	%g1
	edge32ln	%g3,	%l0,	%i5
loop_430:
	xnorcc	%o6,	%i4,	%l4
	set	0x38, %o0
	ldsba	[%l7 + %o0] 0x19,	%i3
	tn	%xcc,	0x4
	mulscc	%l3,	%o0,	%o7
	andncc	%i0,	%i7,	%l6
	movgu	%icc,	%o5,	%i2
	subc	%g6,	%o4,	%o2
	xor	%o1,	0x1DBC,	%g5
	sethi	0x078A,	%o3
	fcmpeq32	%f20,	%f18,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g2,	%i6
	tcc	%xcc,	0x6
	fpackfix	%f26,	%f4
	orncc	%l1,	0x0713,	%i1
	movcs	%icc,	%g7,	%l2
	movn	%icc,	%g4,	%g3
	tleu	%xcc,	0x7
	fmovscs	%xcc,	%f13,	%f1
	udiv	%l0,	0x1E3E,	%g1
	smul	%i5,	0x079D,	%i4
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x0c,	%f16
	fornot1s	%f16,	%f30,	%f6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	lduh	[%l7 + 0x5A],	%l4
	move	%icc,	%o6,	%l3
	fmovscs	%xcc,	%f29,	%f14
	movrlz	%o0,	%o7,	%i3
	fnegd	%f26,	%f14
	smul	%i7,	%i0,	%l6
	stw	%o5,	[%l7 + 0x54]
	movrgez	%g6,	%i2,	%o2
	sdivcc	%o4,	0x0709,	%o1
	andn	%g5,	%o3,	%l5
	movl	%xcc,	%i6,	%g2
	sdivcc	%l1,	0x15FC,	%g7
	orn	%l2,	%i1,	%g4
	srl	%l0,	0x1A,	%g1
	fbn,a	%fcc3,	loop_431
	tcs	%xcc,	0x2
	smulcc	%g3,	%i5,	%l4
	swap	[%l7 + 0x40],	%o6
loop_431:
	ble	loop_432
	call	loop_433
	tvs	%xcc,	0x1
	tl	%icc,	0x5
loop_432:
	xor	%l3,	0x1084,	%i4
loop_433:
	fba,a	%fcc1,	loop_434
	fmovse	%icc,	%f13,	%f12
	subcc	%o7,	0x1CB4,	%i3
	array8	%o0,	%i0,	%i7
loop_434:
	nop
	set	0x18, %l5
	stw	%l6,	[%l7 + %l5]
	fmovsvs	%icc,	%f25,	%f24
	smul	%g6,	0x055A,	%o5
	array16	%i2,	%o4,	%o2
	smul	%o1,	%o3,	%l5
	sdiv	%i6,	0x02C1,	%g2
	fpsub16s	%f7,	%f1,	%f24
	nop
	set	0x20, %i1
	ldsw	[%l7 + %i1],	%l1
	edge8ln	%g5,	%l2,	%i1
	fornot2	%f16,	%f12,	%f12
	ld	[%l7 + 0x50],	%f7
	movneg	%xcc,	%g7,	%g4
	bpos,a	%xcc,	loop_435
	add	%l0,	0x1305,	%g1
	fpackfix	%f10,	%f28
	ldstub	[%l7 + 0x3D],	%i5
loop_435:
	ld	[%l7 + 0x50],	%f6
	movl	%xcc,	%g3,	%o6
	movvc	%icc,	%l3,	%l4
	fpsub16	%f8,	%f28,	%f26
	fmovsneg	%xcc,	%f29,	%f2
	movpos	%icc,	%o7,	%i3
	lduh	[%l7 + 0x20],	%o0
	fba	%fcc0,	loop_436
	array16	%i4,	%i7,	%l6
	fone	%f26
	edge8n	%g6,	%o5,	%i0
loop_436:
	movcc	%icc,	%o4,	%o2
	fmovscc	%xcc,	%f18,	%f14
	mulx	%o1,	%o3,	%i2
	movvc	%xcc,	%i6,	%l5
	mulscc	%g2,	0x0A19,	%g5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	stx	%l1,	[%l7 + 0x40]
	movcc	%icc,	%g7,	%i1
	fpmerge	%f9,	%f27,	%f20
	fmovrsgez	%g4,	%f19,	%f21
	nop
	setx loop_437, %l0, %l1
	jmpl %l1, %l0
	fbue,a	%fcc2,	loop_438
	taddcc	%g1,	%i5,	%g3
	fpackfix	%f6,	%f22
loop_437:
	movrne	%o6,	0x0FF,	%l3
loop_438:
	fbo,a	%fcc1,	loop_439
	umulcc	%o7,	%i3,	%l4
	set	0x5D, %l1
	ldstuba	[%l7 + %l1] 0x18,	%i4
loop_439:
	fbule	%fcc0,	loop_440
	pdist	%f14,	%f8,	%f4
	tn	%icc,	0x1
	movne	%icc,	%i7,	%l6
loop_440:
	move	%xcc,	%o0,	%g6
	smulcc	%o5,	%i0,	%o4
	edge32l	%o1,	%o3,	%i2
	set	0x170, %g2
	nop 	! 	nop 	! 	ldxa	[%g0 + %g2] 0x40,	%i6 ripped by fixASI40.pl ripped by fixASI40.pl
	sra	%o2,	%l5,	%g2
	fnot1	%f14,	%f6
	movneg	%xcc,	%g5,	%l1
	add	%l2,	%i1,	%g4
	sdivx	%l0,	0x146A,	%g1
	sra	%i5,	%g3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x78, %g7
	stda	%l2,	[%l7 + %g7] 0x04
	sllx	%o6,	0x1D,	%i3
	tpos	%xcc,	0x1
	fmovsleu	%icc,	%f7,	%f6
	movrgez	%l4,	%i4,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i7,	%o0
	movle	%icc,	%g6,	%l6
	bge,a	%xcc,	loop_441
	xnor	%i0,	0x0629,	%o5
	tvs	%icc,	0x5
	tn	%icc,	0x5
loop_441:
	brnz	%o1,	loop_442
	fcmps	%fcc2,	%f13,	%f17
	ba,a,pn	%icc,	loop_443
	mulx	%o3,	%i2,	%o4
loop_442:
	nop
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
loop_443:
	taddcctv	%i6,	0x0C18,	%g2
	subccc	%l5,	0x1E3E,	%g5
	fornot2	%f16,	%f20,	%f24
	andncc	%l2,	%l1,	%i1
	smul	%g4,	%g1,	%l0
	addccc	%g3,	0x11D6,	%g7
	subcc	%i5,	0x1E1A,	%l3
	movgu	%xcc,	%o6,	%i3
	movne	%xcc,	%l4,	%i4
	fbuge	%fcc3,	loop_444
	fcmpeq32	%f28,	%f30,	%o7
	movcc	%xcc,	%o0,	%g6
	fnot1	%f0,	%f18
loop_444:
	fmovdn	%icc,	%f27,	%f12
	srlx	%l6,	%i0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x18, %i7
	swapa	[%l7 + %i7] 0x19,	%i7
	xnorcc	%o1,	0x1400,	%o3
	edge32n	%o4,	%o2,	%i6
	edge8ln	%i2,	%l5,	%g2
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x2e,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g5,	0x11C,	%l1
	xor	%g4,	%i1,	%g1
	fnand	%f2,	%f12,	%f20
	ldsb	[%l7 + 0x26],	%g3
	fpsub32s	%f27,	%f1,	%f21
	andn	%g7,	%i5,	%l0
	tneg	%xcc,	0x1
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
	srl	%o6,	0x12,	%i3
	movg	%icc,	%l3,	%i4
	std	%f12,	[%l7 + 0x70]
loop_445:
	fble	%fcc0,	loop_446
	bpos,pn	%icc,	loop_447
	tn	%xcc,	0x5
	fbuge	%fcc0,	loop_448
loop_446:
	andcc	%l4,	0x1851,	%o7
loop_447:
	tl	%xcc,	0x6
	addcc	%o0,	0x1591,	%g6
loop_448:
	movrgez	%i0,	%l6,	%i7
	fmuld8ulx16	%f16,	%f26,	%f10
	brgz,a	%o5,	loop_449
	fexpand	%f4,	%f2
	tleu	%xcc,	0x3
	fblg	%fcc2,	loop_450
loop_449:
	fmovsl	%icc,	%f3,	%f23
	sdivx	%o3,	0x0A5C,	%o1
	tne	%xcc,	0x1
loop_450:
	mulscc	%o2,	0x10B5,	%o4
	movvc	%icc,	%i6,	%i2
	fornot2s	%f14,	%f6,	%f24
	addcc	%l5,	0x12EC,	%g2
	bvs,pt	%xcc,	loop_451
	mova	%xcc,	%l2,	%g5
	movrlz	%g4,	0x226,	%l1
	tge	%xcc,	0x3
loop_451:
	orn	%g1,	%g3,	%g7
	add	%i1,	%l0,	%i5
	tcs	%xcc,	0x4
	orn	%o6,	0x1885,	%i3
	smul	%i4,	%l4,	%l3
	nop
	set	0x67, %i5
	stb	%o0,	[%l7 + %i5]
	alignaddrl	%o7,	%g6,	%l6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x15
	sll	%i0,	%i7,	%o5
	fxor	%f4,	%f16,	%f20
	fbug,a	%fcc1,	loop_452
	lduw	[%l7 + 0x3C],	%o1
	move	%icc,	%o2,	%o3
	fmovrdgz	%i6,	%f0,	%f4
loop_452:
	tn	%icc,	0x2
	fbn	%fcc0,	loop_453
	movgu	%xcc,	%o4,	%l5
	sub	%g2,	0x03C7,	%i2
	smul	%l2,	%g5,	%g4
loop_453:
	brgez	%l1,	loop_454
	sth	%g3,	[%l7 + 0x1C]
	fble,a	%fcc0,	loop_455
	edge8ln	%g7,	%g1,	%i1
loop_454:
	smulcc	%l0,	0x1100,	%i5
	fbug	%fcc0,	loop_456
loop_455:
	fbe	%fcc1,	loop_457
	movleu	%icc,	%o6,	%i4
	std	%i2,	[%l7 + 0x78]
loop_456:
	fmovdge	%xcc,	%f19,	%f25
loop_457:
	tl	%icc,	0x5
	movpos	%xcc,	%l3,	%o0
	movrgz	%l4,	%g6,	%o7
	set	0x60, %o4
	ldswa	[%l7 + %o4] 0x88,	%i0
	set	0x0, %i4
	stxa	%l6,	[%g0 + %i4] 0x57
	taddcctv	%o5,	0x14B1,	%o1
	movl	%icc,	%i7,	%o3
	alignaddr	%o2,	%o4,	%l5
	fones	%f25
	edge16ln	%i6,	%i2,	%l2
	bne,pn	%xcc,	loop_458
	bvs,a	loop_459
	alignaddr	%g5,	%g4,	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%g7
loop_458:
	add	%g1,	0x0139,	%g3
loop_459:
	addccc	%l0,	0x08FB,	%i5
	fcmple32	%f18,	%f10,	%i1
	tgu	%xcc,	0x6
	ldsh	[%l7 + 0x2E],	%i4
	movvs	%xcc,	%i3,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o6,	0x09,	%o0
	tvs	%xcc,	0x7
	fmovsgu	%icc,	%f18,	%f16
	smul	%g6,	0x1489,	%l4
	andcc	%i0,	%l6,	%o7
	taddcc	%o5,	0x1972,	%i7
	nop
	set	0x28, %o5
	stw	%o1,	[%l7 + %o5]
	movn	%xcc,	%o3,	%o2
	movleu	%icc,	%l5,	%o4
	sub	%i6,	%i2,	%l2
	tn	%xcc,	0x1
	udiv	%g5,	0x157B,	%g4
	subc	%g2,	%g7,	%g1
	and	%g3,	%l1,	%i5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x16] %asi,	%l0
	fblg	%fcc2,	loop_460
	fsrc2	%f2,	%f4
	movrlz	%i4,	0x3F7,	%i3
	or	%l3,	%o6,	%i1
loop_460:
	smulcc	%o0,	0x137E,	%l4
	mulscc	%g6,	%l6,	%i0
	tvs	%icc,	0x5
	movle	%icc,	%o7,	%o5
	smulcc	%i7,	%o1,	%o3
	array32	%l5,	%o2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a,pn	%icc,	loop_461
	movre	%i6,	%l2,	%i2
	movl	%icc,	%g5,	%g4
	tgu	%icc,	0x1
loop_461:
	brnz,a	%g7,	loop_462
	add	%g1,	0x0507,	%g3
	mulscc	%l1,	%g2,	%i5
	array16	%i4,	%i3,	%l3
loop_462:
	nop
	setx	loop_463,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsa	%xcc,	%f19,	%f31
	set	0x44, %o3
	lduwa	[%l7 + %o3] 0x14,	%o6
loop_463:
	fmovsn	%icc,	%f11,	%f1
	xnorcc	%l0,	%i1,	%l4
	movleu	%icc,	%g6,	%o0
	movne	%xcc,	%l6,	%o7
	set	0x36, %i2
	lduha	[%l7 + %i2] 0x80,	%o5
	movpos	%xcc,	%i0,	%i7
	fbne,a	%fcc3,	loop_464
	tcc	%xcc,	0x4
	ldd	[%l7 + 0x50],	%o2
	subc	%o1,	%o2,	%o4
loop_464:
	fcmpgt16	%f12,	%f6,	%l5
	set	0x18, %i0
	stha	%i6,	[%l7 + %i0] 0x23
	membar	#Sync
	edge8ln	%l2,	%g5,	%i2
	edge8n	%g7,	%g4,	%g3
	pdist	%f0,	%f0,	%f0
	or	%l1,	0x07BB,	%g1
	fandnot2	%f14,	%f30,	%f6
	set	0x14, %i3
	stwa	%i5,	[%l7 + %i3] 0x10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%g2,	%i4
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x19,	%l2
	fpsub16s	%f30,	%f23,	%f6
	fmovsge	%xcc,	%f23,	%f1
	movl	%xcc,	%i3,	%l0
	edge32n	%i1,	%o6,	%g6
	mulx	%l4,	0x19F6,	%l6
	fmuld8sux16	%f29,	%f15,	%f16
	or	%o7,	%o5,	%o0
	fcmple32	%f28,	%f2,	%i0
	brgz	%o3,	loop_465
	fpsub16s	%f3,	%f12,	%f28
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x24,	%i6
loop_465:
	alignaddr	%o1,	%o2,	%l5
	taddcc	%i6,	0x0455,	%l2
	udivcc	%g5,	0x1B3B,	%o4
	sdivx	%g7,	0x138D,	%i2
	fmovs	%f15,	%f28
	fand	%f20,	%f10,	%f24
	subccc	%g3,	%l1,	%g1
	fcmpgt32	%f30,	%f24,	%i5
	tsubcctv	%g4,	0x1E42,	%g2
	tg	%icc,	0x7
	sub	%l3,	0x1035,	%i4
	fmovsle	%icc,	%f22,	%f27
	edge16	%i3,	%i1,	%l0
	movvc	%xcc,	%o6,	%l4
	movvc	%xcc,	%l6,	%g6
	or	%o5,	0x1DC0,	%o0
	fzeros	%f22
	edge8	%i0,	%o3,	%o7
	fbo,a	%fcc0,	loop_466
	fbug	%fcc2,	loop_467
	fmovse	%icc,	%f2,	%f21
	sdivx	%o1,	0x137E,	%o2
loop_466:
	edge32l	%l5,	%i6,	%i7
loop_467:
	fbg	%fcc1,	loop_468
	stb	%g5,	[%l7 + 0x18]
	array16	%o4,	%l2,	%g7
	move	%xcc,	%g3,	%i2
loop_468:
	edge16ln	%g1,	%l1,	%i5
	edge8n	%g4,	%l3,	%i4
	fmovsvc	%icc,	%f22,	%f1
	brgez	%i3,	loop_469
	fmovdvs	%xcc,	%f22,	%f14
	fmovrdgez	%g2,	%f8,	%f10
	sdivcc	%l0,	0x1F29,	%o6
loop_469:
	tle	%icc,	0x3
	edge16ln	%l4,	%i1,	%l6
	movl	%xcc,	%o5,	%o0
	movpos	%xcc,	%g6,	%i0
	fbue	%fcc0,	loop_470
	stx	%o7,	[%l7 + 0x68]
	movleu	%xcc,	%o3,	%o2
	fcmpne16	%f20,	%f24,	%l5
loop_470:
	nop
	set	0x18, %l2
	lda	[%l7 + %l2] 0x19,	%f17
	subccc	%o1,	%i6,	%i7
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g5
	andncc	%l2,	%g7,	%o4
	fsrc1	%f4,	%f24
	prefetch	[%l7 + 0x58],	 0x0
	fbu	%fcc2,	loop_471
	movcc	%icc,	%g3,	%g1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
loop_471:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x36] %asi,	%i5
	or	%g4,	%l3,	%l1
	movn	%icc,	%i3,	%i4
	movl	%xcc,	%g2,	%l0
	tne	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x30, %g3
	stda	%o6,	[%l7 + %g3] 0x80
	taddcctv	%l4,	0x03C3,	%l6
	wr	%g0,	0x04,	%asi
	stha	%i1,	[%l7 + 0x68] %asi
	alignaddrl	%o0,	%o5,	%i0
	fmovdvc	%xcc,	%f0,	%f22
	fnot2s	%f4,	%f19
	sll	%g6,	%o3,	%o2
	sir	0x12B9
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ldub	[%l7 + 0x08],	%o7
	popc	0x1203,	%l5
	movrgez	%i6,	0x018,	%i7
	fmovdneg	%icc,	%f11,	%f26
	sra	%g5,	0x1F,	%o1
	sub	%g7,	%o4,	%g3
	movne	%icc,	%l2,	%g1
	tcs	%icc,	0x7
	tgu	%icc,	0x4
	flush	%l7 + 0x68
	udivcc	%i2,	0x1602,	%i5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%l3
	fmovdl	%xcc,	%f22,	%f31
	be,pt	%xcc,	loop_472
	udiv	%g4,	0x1810,	%i3
	sdivx	%i4,	0x169F,	%l1
	edge32ln	%g2,	%o6,	%l0
loop_472:
	fxnor	%f22,	%f10,	%f30
	sdivx	%l6,	0x084B,	%l4
	xnorcc	%i1,	0x0678,	%o0
	tl	%icc,	0x5
	xnor	%o5,	%i0,	%o3
	movleu	%xcc,	%o2,	%o7
	edge16l	%l5,	%g6,	%i7
	brgz,a	%g5,	loop_473
	tpos	%icc,	0x1
	fmovscs	%xcc,	%f25,	%f24
	te	%xcc,	0x2
loop_473:
	fmovda	%xcc,	%f20,	%f29
	fbe,a	%fcc0,	loop_474
	fmuld8sux16	%f11,	%f9,	%f28
	te	%icc,	0x0
	array16	%o1,	%g7,	%o4
loop_474:
	edge32	%i6,	%g3,	%g1
	array32	%l2,	%i5,	%i2
	movpos	%icc,	%l3,	%i3
	alignaddr	%i4,	%l1,	%g4
	set	0x20, %l3
	stda	%g2,	[%l7 + %l3] 0xe3
	membar	#Sync
	fmovrdlez	%l0,	%f12,	%f20
	sra	%o6,	%l6,	%i1
	edge16ln	%o0,	%l4,	%o5
	umul	%i0,	0x0FEB,	%o3
	subccc	%o7,	0x14E2,	%l5
	mulscc	%g6,	%i7,	%o2
	tle	%icc,	0x4
	movre	%g5,	0x024,	%o1
	movcc	%icc,	%o4,	%i6
	edge8l	%g7,	%g3,	%g1
	orn	%i5,	%i2,	%l2
	swap	[%l7 + 0x70],	%l3
	std	%f18,	[%l7 + 0x30]
	fornot2s	%f31,	%f28,	%f23
	xnorcc	%i3,	0x16FA,	%l1
	fcmpeq32	%f10,	%f14,	%g4
	fmovda	%xcc,	%f10,	%f18
	nop
	setx loop_475, %l0, %l1
	jmpl %l1, %i4
	movrgez	%l0,	%o6,	%g2
	fmovdgu	%xcc,	%f28,	%f16
	movrne	%i1,	%l6,	%l4
loop_475:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbuge	%fcc2,	loop_476
	nop
	setx	loop_477,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%o5,	%o0,	%o3
	edge16l	%i0,	%l5,	%g6
loop_476:
	fba,a	%fcc3,	loop_478
loop_477:
	fmovdg	%xcc,	%f19,	%f4
	sdivx	%o7,	0x157F,	%i7
	bleu,a,pt	%xcc,	loop_479
loop_478:
	sll	%g5,	0x0B,	%o1
	sdivx	%o2,	0x03F2,	%o4
	umulcc	%i6,	%g3,	%g1
loop_479:
	fandnot1	%f26,	%f4,	%f28
	fnegd	%f16,	%f2
	subccc	%i5,	0x075F,	%i2
	fba	%fcc1,	loop_480
	fmovdvc	%icc,	%f28,	%f25
	edge8ln	%g7,	%l2,	%l3
	tsubcc	%i3,	0x0832,	%g4
loop_480:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x32] %asi,	%i4
	bleu	loop_481
	fcmpes	%fcc2,	%f26,	%f16
	tleu	%xcc,	0x7
	tle	%icc,	0x6
loop_481:
	sdivcc	%l0,	0x1D3B,	%o6
	and	%l1,	0x155F,	%i1
	bn,pn	%xcc,	loop_482
	edge16l	%l6,	%g2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f6,	%f4,	%f16
loop_482:
	bn,pn	%xcc,	loop_483
	fbge,a	%fcc3,	loop_484
	edge16l	%l4,	%o0,	%i0
	fpmerge	%f16,	%f7,	%f0
loop_483:
	movgu	%xcc,	%l5,	%o3
loop_484:
	movcc	%icc,	%o7,	%g6
	srax	%g5,	0x13,	%o1
	edge32n	%i7,	%o2,	%o4
	andncc	%g3,	%i6,	%i5
	edge32ln	%g1,	%i2,	%g7
	sllx	%l3,	%l2,	%i3
	bvc	loop_485
	brz,a	%i4,	loop_486
	movrlz	%g4,	0x2A0,	%l0
	bcs,a,pt	%icc,	loop_487
loop_485:
	orn	%l1,	0x17A2,	%i1
loop_486:
	fbge	%fcc3,	loop_488
	movrgez	%o6,	0x3E7,	%l6
loop_487:
	fmovdne	%xcc,	%f18,	%f2
	sub	%o5,	0x038F,	%g2
loop_488:
	tcc	%icc,	0x6
	fsrc2s	%f25,	%f5
	tge	%icc,	0x5
	fpsub32	%f26,	%f14,	%f12
	nop
	setx	loop_489,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l4,	0x03F5,	%i0
	udivx	%o0,	0x1F40,	%l5
	te	%xcc,	0x2
loop_489:
	taddcc	%o3,	%g6,	%o7
	sra	%o1,	0x19,	%i7
	fble,a	%fcc1,	loop_490
	flush	%l7 + 0x48
	orn	%o2,	0x0DF1,	%o4
	wr	%g0,	0xeb,	%asi
	stha	%g5,	[%l7 + 0x3A] %asi
	membar	#Sync
loop_490:
	ba,a,pt	%xcc,	loop_491
	faligndata	%f12,	%f24,	%f12
	stw	%i6,	[%l7 + 0x0C]
	edge16ln	%g3,	%i5,	%i2
loop_491:
	bneg,a	loop_492
	fcmple32	%f8,	%f12,	%g7
	fbe	%fcc0,	loop_493
	srl	%g1,	%l3,	%i3
loop_492:
	orcc	%i4,	0x1205,	%l2
	andcc	%l0,	%g4,	%i1
loop_493:
	andncc	%o6,	%l1,	%l6
	orcc	%o5,	0x175A,	%g2
	set	0x70, %g6
	stwa	%i0,	[%l7 + %g6] 0xe2
	membar	#Sync
	srax	%l4,	0x18,	%o0
	tleu	%xcc,	0x6
	bg	loop_494
	fbuge	%fcc2,	loop_495
	array16	%l5,	%o3,	%g6
	udivx	%o1,	0x1AC8,	%o7
loop_494:
	tcc	%xcc,	0x6
loop_495:
	edge16	%i7,	%o2,	%g5
	edge32l	%i6,	%g3,	%o4
	udiv	%i2,	0x043C,	%g7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x2A] %asi,	%g1
	fbo	%fcc3,	loop_496
	bne,a,pn	%icc,	loop_497
	sdivx	%i5,	0x0234,	%l3
	add	%i3,	%i4,	%l0
loop_496:
	edge32ln	%l2,	%i1,	%o6
loop_497:
	taddcctv	%g4,	%l6,	%o5
	be	loop_498
	ble	loop_499
	alignaddr	%g2,	%l1,	%i0
	ldd	[%l7 + 0x10],	%f30
loop_498:
	fsrc2s	%f24,	%f20
loop_499:
	movrlez	%l4,	%o0,	%o3
	sub	%g6,	%o1,	%l5
	sra	%o7,	0x12,	%o2
	mova	%icc,	%i7,	%i6
	fpadd16s	%f27,	%f31,	%f30
	set	0x30, %g4
	lda	[%l7 + %g4] 0x80,	%f29
	fcmpgt16	%f6,	%f10,	%g3
	tleu	%xcc,	0x3
	move	%icc,	%o4,	%i2
	movpos	%icc,	%g5,	%g1
	tpos	%icc,	0x2
	tleu	%icc,	0x7
	brgz	%g7,	loop_500
	brgz	%i5,	loop_501
	siam	0x2
	fmovrsne	%l3,	%f27,	%f6
loop_500:
	nop
	set	0x19, %i6
	ldstuba	[%l7 + %i6] 0x80,	%i3
loop_501:
	fbu,a	%fcc0,	loop_502
	sdivx	%l0,	0x1C20,	%i4
	subccc	%l2,	%o6,	%i1
	orn	%g4,	%o5,	%g2
loop_502:
	tpos	%xcc,	0x7
	tneg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l6,	%i0,	%l1
	fbo	%fcc2,	loop_503
	sdivx	%o0,	0x19A8,	%l4
	subccc	%g6,	0x0100,	%o1
	tn	%xcc,	0x3
loop_503:
	be,a	%icc,	loop_504
	udivx	%o3,	0x1C21,	%l5
	xor	%o2,	0x1672,	%i7
	fmovd	%f28,	%f16
loop_504:
	subcc	%o7,	0x1A1C,	%i6
	fones	%f21
	call	loop_505
	bge,pt	%icc,	loop_506
	array32	%g3,	%i2,	%o4
	bn,pn	%xcc,	loop_507
loop_505:
	sra	%g1,	%g7,	%i5
loop_506:
	bleu,pn	%icc,	loop_508
	te	%icc,	0x2
loop_507:
	fpsub32s	%f16,	%f27,	%f22
	tn	%icc,	0x2
loop_508:
	fnot2	%f6,	%f22
	edge16l	%l3,	%g5,	%l0
	xnorcc	%i3,	0x1367,	%l2
	set	0x0F, %l4
	ldstuba	[%l7 + %l4] 0x04,	%i4
	taddcctv	%o6,	%i1,	%o5
	tge	%xcc,	0x6
	addcc	%g2,	0x1B72,	%g4
	sdivx	%i0,	0x0B83,	%l6
	brnz,a	%l1,	loop_509
	fones	%f13
	andncc	%o0,	%l4,	%g6
	taddcc	%o1,	%l5,	%o2
loop_509:
	umul	%o3,	0x032B,	%i7
	fzero	%f26
	fxor	%f6,	%f18,	%f0
	fmul8x16	%f4,	%f8,	%f14
	tcs	%xcc,	0x3
	andncc	%i6,	%g3,	%i2
	movrlz	%o7,	0x3E4,	%g1
	edge16l	%g7,	%i5,	%o4
	membar	0x30
	movre	%l3,	%l0,	%g5
	fnot1s	%f13,	%f12
	set	0x60, %o7
	lda	[%l7 + %o7] 0x18,	%f4
	fmovdne	%icc,	%f16,	%f4
	fmovsvc	%xcc,	%f13,	%f25
	fbn,a	%fcc3,	loop_510
	tg	%xcc,	0x4
	sdivx	%l2,	0x0A26,	%i3
	bne,a,pt	%icc,	loop_511
loop_510:
	movle	%icc,	%i4,	%i1
	edge16l	%o6,	%g2,	%o5
	movvc	%xcc,	%i0,	%g4
loop_511:
	ta	%xcc,	0x7
	fpmerge	%f14,	%f26,	%f24
	movneg	%xcc,	%l6,	%l1
	ldd	[%l7 + 0x60],	%o0
	tn	%icc,	0x5
	fnand	%f28,	%f24,	%f14
	fexpand	%f28,	%f10
	tneg	%icc,	0x5
	bgu	%xcc,	loop_512
	sra	%g6,	%o1,	%l4
	nop
	setx loop_513, %l0, %l1
	jmpl %l1, %l5
	subc	%o2,	0x1223,	%o3
loop_512:
	stbar
	tpos	%icc,	0x5
loop_513:
	movneg	%icc,	%i6,	%g3
	fmovsa	%xcc,	%f25,	%f12
	set	0x22, %g1
	lduha	[%l7 + %g1] 0x10,	%i2
	fmovse	%xcc,	%f17,	%f28
	tvc	%xcc,	0x7
	srl	%o7,	%i7,	%g7
	tvs	%xcc,	0x5
	edge8l	%g1,	%o4,	%i5
	bvs,a	loop_514
	fxor	%f20,	%f2,	%f26
	movn	%icc,	%l0,	%g5
	movl	%icc,	%l2,	%i3
loop_514:
	fands	%f16,	%f26,	%f27
	movne	%xcc,	%l3,	%i1
	fpadd16s	%f16,	%f11,	%f30
	andcc	%i4,	%g2,	%o5
	sub	%i0,	0x06CD,	%g4
	fcmps	%fcc2,	%f13,	%f12
	fcmpeq16	%f20,	%f10,	%l6
	sethi	0x1D02,	%l1
	fbul,a	%fcc1,	loop_515
	fnot1	%f26,	%f16
	tge	%xcc,	0x7
	sllx	%o0,	%g6,	%o1
loop_515:
	fxors	%f15,	%f0,	%f9
	bge,a,pt	%icc,	loop_516
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%o6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x48] %asi,	%l4
loop_516:
	ble,pt	%xcc,	loop_517
	orcc	%l5,	0x03EB,	%o2
	set	0x29, %o0
	lduba	[%l7 + %o0] 0x18,	%i6
loop_517:
	ldstub	[%l7 + 0x5B],	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g3,	%o7
	sllx	%i2,	0x0D,	%g7
	edge16l	%g1,	%o4,	%i7
	tneg	%icc,	0x1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x4A] %asi,	%l0
	fmovdcs	%icc,	%f22,	%f12
	edge32ln	%i5,	%g5,	%l2
	te	%xcc,	0x3
	or	%i3,	0x02F5,	%i1
	fornot2	%f16,	%f24,	%f8
	sir	0x1C96
	xnor	%l3,	0x0028,	%g2
	umulcc	%o5,	0x1901,	%i0
	ldstub	[%l7 + 0x58],	%g4
	fzero	%f0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%l1
	movl	%icc,	%l6,	%g6
	edge16ln	%o1,	%o6,	%l4
	movgu	%icc,	%l5,	%o2
	edge16ln	%i6,	%o0,	%g3
	edge16n	%o3,	%o7,	%i2
	andcc	%g1,	%g7,	%i7
	edge8	%l0,	%o4,	%i5
	orn	%g5,	%l2,	%i3
	movrgz	%i1,	%g2,	%l3
	alignaddr	%o5,	%i0,	%i4
	array16	%l1,	%l6,	%g6
	fbn	%fcc3,	loop_518
	fnot1s	%f1,	%f10
	fmovdvs	%icc,	%f11,	%f11
	umul	%g4,	%o1,	%o6
loop_518:
	subccc	%l4,	%l5,	%i6
	tn	%xcc,	0x7
	fbu,a	%fcc2,	loop_519
	tcc	%icc,	0x7
	tne	%xcc,	0x7
	or	%o2,	%g3,	%o3
loop_519:
	fcmped	%fcc1,	%f8,	%f12
	movleu	%icc,	%o7,	%o0
	fbu	%fcc0,	loop_520
	movrgz	%i2,	%g1,	%i7
	and	%l0,	%g7,	%o4
	fmovrde	%i5,	%f0,	%f14
loop_520:
	fors	%f24,	%f21,	%f9
	fcmpgt16	%f12,	%f22,	%g5
	fpack32	%f6,	%f20,	%f4
	stw	%l2,	[%l7 + 0x0C]
	fpadd16s	%f17,	%f5,	%f17
	stx	%i1,	[%l7 + 0x60]
	tleu	%icc,	0x5
	edge16	%i3,	%l3,	%o5
	fmovdpos	%icc,	%f13,	%f20
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%i0
	ldd	[%l7 + 0x10],	%i4
	tneg	%xcc,	0x1
	andn	%l6,	0x1E07,	%l1
	movre	%g4,	%g6,	%o1
	brgez	%l4,	loop_521
	fmovrslez	%o6,	%f20,	%f30
	tle	%icc,	0x1
	stbar
loop_521:
	movgu	%xcc,	%l5,	%i6
	udivcc	%g3,	0x0A04,	%o2
	movne	%xcc,	%o3,	%o7
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x37] %asi,	%i2
	brz,a	%g1,	loop_522
	nop
	setx	loop_523,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%o0,	0x0BB5,	%i7
	brnz,a	%g7,	loop_524
loop_522:
	fbuge	%fcc3,	loop_525
loop_523:
	fmovsl	%icc,	%f7,	%f23
	edge16n	%o4,	%i5,	%l0
loop_524:
	edge32	%g5,	%l2,	%i1
loop_525:
	srax	%l3,	0x0C,	%i3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o5,	%i0
	sub	%i4,	%g2,	%l1
	fmovrsgez	%l6,	%f12,	%f12
	fmovsvc	%icc,	%f3,	%f21
	fbue	%fcc1,	loop_526
	ta	%xcc,	0x1
	fnegd	%f4,	%f0
	fbg	%fcc0,	loop_527
loop_526:
	edge16l	%g4,	%g6,	%o1
	edge32ln	%o6,	%l4,	%l5
	fandnot2s	%f23,	%f10,	%f22
loop_527:
	edge32ln	%g3,	%o2,	%o3
	movrgez	%i6,	0x0F4,	%o7
	fxnor	%f20,	%f26,	%f28
	set	0x44, %l5
	lduha	[%l7 + %l5] 0x80,	%g1
	tvs	%icc,	0x2
	ldd	[%l7 + 0x40],	%o0
	taddcc	%i2,	0x129F,	%i7
	fxor	%f4,	%f26,	%f26
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6A] %asi,	%o4
	addccc	%g7,	%i5,	%g5
	array8	%l0,	%i1,	%l2
	flush	%l7 + 0x24
	movvc	%xcc,	%l3,	%o5
	brgz,a	%i3,	loop_528
	edge8n	%i4,	%i0,	%g2
	movg	%icc,	%l1,	%l6
	tg	%icc,	0x1
loop_528:
	andn	%g6,	0x194B,	%g4
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x108] %asi,	%o1
	wr	%g0,	0x04,	%asi
	stda	%o6,	[%l7 + 0x60] %asi
	srl	%l5,	0x0F,	%g3
	fsrc1s	%f8,	%f20
	std	%f28,	[%l7 + 0x08]
	fbue,a	%fcc1,	loop_529
	umulcc	%l4,	%o3,	%o2
	fornot2s	%f15,	%f1,	%f19
	popc	%o7,	%i6
loop_529:
	sdiv	%o0,	0x1051,	%i2
	move	%xcc,	%i7,	%o4
	movrgez	%g1,	0x059,	%i5
	wr	%g0,	0x88,	%asi
	stwa	%g5,	[%l7 + 0x58] %asi
	edge16l	%g7,	%l0,	%i1
	mova	%xcc,	%l2,	%l3
	movle	%icc,	%o5,	%i3
	fbug,a	%fcc0,	loop_530
	fmovdge	%xcc,	%f31,	%f9
	fornot2	%f2,	%f24,	%f26
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_530:
	srlx	%i0,	0x14,	%i4
	sllx	%g2,	0x14,	%l6
	nop
	setx	loop_531,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%g6,	%l1
	array16	%g4,	%o1,	%o6
	edge16l	%l5,	%g3,	%l4
loop_531:
	tge	%xcc,	0x5
	set	0x2C, %i1
	lda	[%l7 + %i1] 0x18,	%f2
	mova	%xcc,	%o3,	%o2
	movrne	%i6,	0x3D9,	%o7
	ble,a	loop_532
	movrgez	%i2,	0x10C,	%o0
	sir	0x08D9
	or	%o4,	0x1F59,	%i7
loop_532:
	fmul8x16al	%f23,	%f2,	%f20
	xor	%g1,	%i5,	%g5
	andncc	%g7,	%i1,	%l2
	array8	%l0,	%l3,	%i3
	alignaddrl	%o5,	%i4,	%g2
	edge8	%i0,	%g6,	%l1
	tl	%xcc,	0x6
	edge8	%l6,	%g4,	%o1
	edge32l	%o6,	%l5,	%g3
	fmul8x16	%f26,	%f18,	%f8
	movn	%xcc,	%o3,	%l4
	edge8	%o2,	%i6,	%o7
	fones	%f15
	fmovrdgez	%o0,	%f24,	%f16
	xorcc	%o4,	%i7,	%g1
	fbuge,a	%fcc0,	loop_533
	andn	%i5,	%g5,	%i2
	fmovsleu	%xcc,	%f15,	%f26
	array8	%i1,	%g7,	%l0
loop_533:
	fmovdn	%xcc,	%f26,	%f11
	tleu	%xcc,	0x5
	bvs,a	loop_534
	bg	loop_535
	swap	[%l7 + 0x3C],	%l3
	mulx	%l2,	%i3,	%i4
loop_534:
	edge16ln	%g2,	%i0,	%g6
loop_535:
	tcc	%xcc,	0x5
	or	%o5,	%l1,	%g4
	fmovdvs	%xcc,	%f13,	%f6
	orn	%o1,	%o6,	%l5
	fmovsle	%xcc,	%f24,	%f22
	fbul,a	%fcc0,	loop_536
	srl	%l6,	%o3,	%g3
	movvs	%icc,	%l4,	%o2
	movrlz	%o7,	0x16F,	%i6
loop_536:
	swap	[%l7 + 0x48],	%o0
	tgu	%xcc,	0x2
	movvs	%xcc,	%o4,	%i7
	srlx	%g1,	%g5,	%i2
	brgez,a	%i1,	loop_537
	andcc	%i5,	0x028E,	%l0
	edge16n	%g7,	%l2,	%l3
	tle	%xcc,	0x2
loop_537:
	fornot2s	%f8,	%f10,	%f6
	udiv	%i4,	0x1760,	%i3
	tvs	%xcc,	0x7
	fmovrsgez	%g2,	%f11,	%f17
	popc	0x06F5,	%i0
	movn	%icc,	%g6,	%l1
	set	0x40, %g5
	stwa	%o5,	[%l7 + %g5] 0x22
	membar	#Sync
	xnorcc	%o1,	%o6,	%g4
	ldx	[%l7 + 0x48],	%l5
	set	0x50, %l1
	lduha	[%l7 + %l1] 0x10,	%o3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x10] %asi,	%l6
	and	%g3,	%l4,	%o7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x11] %asi,	%i6
	wr	%g0,	0x10,	%asi
	stxa	%o0,	[%l7 + 0x38] %asi
	smul	%o2,	0x0441,	%i7
	sllx	%g1,	%o4,	%i2
	and	%i1,	0x18E0,	%g5
	tn	%xcc,	0x2
	tsubcc	%l0,	%g7,	%i5
	membar	0x64
	movrlez	%l3,	0x20C,	%l2
	stw	%i4,	[%l7 + 0x6C]
	tsubcc	%i3,	0x0199,	%i0
	fnand	%f8,	%f12,	%f30
	fexpand	%f20,	%f12
	ldsh	[%l7 + 0x3A],	%g6
	fmovdpos	%icc,	%f16,	%f15
	brgz,a	%g2,	loop_538
	edge32n	%l1,	%o5,	%o1
	movn	%xcc,	%o6,	%g4
	fabss	%f28,	%f5
loop_538:
	movcs	%xcc,	%l5,	%l6
	fcmple16	%f22,	%f30,	%o3
	fmovdgu	%xcc,	%f2,	%f26
	fble	%fcc0,	loop_539
	edge8l	%g3,	%l4,	%o7
	fmovrdne	%o0,	%f26,	%f10
	set	0x2C, %g7
	stwa	%i6,	[%l7 + %g7] 0x11
loop_539:
	fbue	%fcc1,	loop_540
	stw	%i7,	[%l7 + 0x6C]
	fxnors	%f27,	%f21,	%f14
	fmovda	%icc,	%f3,	%f22
loop_540:
	xnorcc	%g1,	%o2,	%o4
	fmovrsgz	%i2,	%f2,	%f3
	movle	%xcc,	%g5,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2b,	%asi
	stba	%i1,	[%l7 + 0x4A] %asi
	membar	#Sync
	sethi	0x1678,	%i5
	fnegd	%f12,	%f12
	edge8	%g7,	%l3,	%l2
	fnor	%f4,	%f24,	%f10
	movrlz	%i3,	%i0,	%i4
	edge16ln	%g2,	%l1,	%o5
	fabsd	%f16,	%f24
	fornot2s	%f17,	%f23,	%f6
	mulx	%o1,	%g6,	%g4
	set	0x7C, %g2
	stwa	%l5,	[%l7 + %g2] 0x0c
	fmovsneg	%icc,	%f25,	%f31
	stbar
	tle	%xcc,	0x4
	fcmped	%fcc2,	%f26,	%f20
	movle	%icc,	%l6,	%o3
	fbule,a	%fcc2,	loop_541
	mova	%icc,	%g3,	%o6
	orncc	%o7,	0x1BC5,	%o0
	xor	%i6,	0x12D7,	%i7
loop_541:
	movcs	%icc,	%g1,	%l4
	fmovdge	%xcc,	%f5,	%f29
	std	%f22,	[%l7 + 0x68]
	movcc	%icc,	%o4,	%o2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdiv	%g5,	0x121C,	%l0
	movre	%i2,	0x2A6,	%i5
	fnor	%f8,	%f12,	%f2
	fmovdg	%xcc,	%f23,	%f20
	sethi	0x0BF2,	%g7
	bn,pt	%xcc,	loop_542
	addc	%l3,	0x0351,	%i1
	umulcc	%i3,	%i0,	%l2
	movre	%i4,	%g2,	%l1
loop_542:
	tn	%icc,	0x7
	fones	%f24
	fmovsa	%icc,	%f16,	%f18
	sra	%o1,	0x08,	%o5
	fornot1	%f20,	%f30,	%f2
	ta	%icc,	0x5
	brnz	%g4,	loop_543
	brnz,a	%l5,	loop_544
	brlz	%g6,	loop_545
	nop
	set	0x30, %i7
	std	%o2,	[%l7 + %i7]
loop_543:
	tcc	%icc,	0x5
loop_544:
	fbn	%fcc3,	loop_546
loop_545:
	orn	%l6,	%g3,	%o6
	fbne	%fcc0,	loop_547
	call	loop_548
loop_546:
	fbuge	%fcc1,	loop_549
	fcmpgt16	%f12,	%f8,	%o7
loop_547:
	movge	%xcc,	%i6,	%o0
loop_548:
	bne,pn	%icc,	loop_550
loop_549:
	or	%g1,	0x1F9A,	%l4
	fmovrdne	%o4,	%f4,	%f14
	sra	%i7,	0x0C,	%o2
loop_550:
	edge32ln	%l0,	%g5,	%i2
	fmovse	%icc,	%f13,	%f1
	subcc	%i5,	%g7,	%i1
	fbue	%fcc1,	loop_551
	movre	%l3,	0x150,	%i0
	subc	%i3,	%i4,	%l2
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%g2
loop_551:
	lduh	[%l7 + 0x18],	%l1
	smul	%o5,	%o1,	%l5
	sll	%g4,	%g6,	%o3
	andncc	%l6,	%o6,	%g3
	tsubcc	%o7,	0x1A83,	%o0
	movn	%xcc,	%i6,	%g1
	tvs	%xcc,	0x0
	nop
	setx	loop_552,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%l4,	%o4,	%i7
	movrne	%l0,	0x049,	%o2
	fbue	%fcc1,	loop_553
loop_552:
	movne	%xcc,	%g5,	%i2
	bge	%xcc,	loop_554
	srax	%g7,	%i5,	%l3
loop_553:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x40] %asi,	%i0
loop_554:
	fmovsleu	%icc,	%f22,	%f27
	alignaddr	%i1,	%i4,	%l2
	fandnot2s	%f18,	%f5,	%f6
	edge32l	%g2,	%l1,	%i3
	movge	%xcc,	%o1,	%o5
	tne	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x3
	ldd	[%l7 + 0x50],	%f14
	fornot2	%f16,	%f6,	%f28
	sdivcc	%g4,	0x00D5,	%l5
	sub	%g6,	%o3,	%o6
	fandnot1s	%f6,	%f29,	%f29
	fmovdn	%icc,	%f22,	%f24
	sdivx	%g3,	0x09A6,	%o7
	brz	%l6,	loop_555
	fmovdcc	%xcc,	%f7,	%f27
	move	%xcc,	%o0,	%g1
	orncc	%l4,	%i6,	%o4
loop_555:
	edge32ln	%l0,	%i7,	%o2
	movleu	%xcc,	%i2,	%g7
	fpackfix	%f2,	%f16
	sethi	0x07B9,	%i5
	fnors	%f23,	%f24,	%f18
	movrgez	%g5,	%i0,	%l3
	fpadd32s	%f8,	%f30,	%f22
	tn	%xcc,	0x3
	movge	%icc,	%i4,	%i1
	tn	%xcc,	0x2
	orncc	%g2,	%l1,	%l2
	fpadd16	%f18,	%f28,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7C] %asi,	%i3
	tvs	%icc,	0x2
	fcmple16	%f4,	%f22,	%o5
	edge16	%g4,	%o1,	%l5
	xorcc	%o3,	0x05BC,	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%g3
	fmovde	%xcc,	%f31,	%f13
	movneg	%xcc,	%o7,	%o0
	edge8n	%l6,	%g1,	%l4
	sllx	%i6,	0x10,	%l0
	tpos	%xcc,	0x4
	sllx	%o4,	0x1F,	%i7
	fmovrdlz	%i2,	%f10,	%f22
	fmul8x16au	%f11,	%f13,	%f2
	movle	%xcc,	%o2,	%i5
	bvc,a	%xcc,	loop_556
	andn	%g5,	0x0325,	%g7
	edge8ln	%i0,	%l3,	%i4
	set	0x0E, %l0
	ldsha	[%l7 + %l0] 0x88,	%i1
loop_556:
	bvc	%xcc,	loop_557
	xnor	%l1,	0x1E89,	%l2
	array16	%i3,	%o5,	%g2
	xorcc	%o1,	%g4,	%o3
loop_557:
	fbu,a	%fcc0,	loop_558
	fmul8x16au	%f16,	%f12,	%f26
	nop
	setx	loop_559,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%icc,	%g6,	%o6
loop_558:
	fmovrdgz	%g3,	%f2,	%f8
	fsrc1	%f18,	%f10
loop_559:
	tcs	%icc,	0x7
	edge8l	%l5,	%o7,	%l6
	udivx	%o0,	0x045B,	%l4
	mulscc	%i6,	%g1,	%o4
	set	0x50, %i5
	stxa	%i7,	[%l7 + %i5] 0x80
	taddcctv	%i2,	0x1DDA,	%o2
	taddcc	%i5,	0x142C,	%l0
	set	0x3B, %o1
	lduba	[%l7 + %o1] 0x10,	%g5
	andn	%g7,	0x1AF2,	%l3
	set	0x1B, %i4
	ldsba	[%l7 + %i4] 0x80,	%i0
	fnors	%f26,	%f3,	%f5
	alignaddrl	%i4,	%i1,	%l2
	sra	%i3,	%l1,	%g2
	fmovdpos	%icc,	%f0,	%f8
	movrne	%o1,	0x2E6,	%o5
	ble,pt	%xcc,	loop_560
	mulx	%g4,	%g6,	%o6
	sdiv	%g3,	0x1ED8,	%o3
	fzero	%f4
loop_560:
	fornot1s	%f20,	%f22,	%f6
	movre	%o7,	0x224,	%l5
	fmovsleu	%icc,	%f0,	%f12
	xor	%o0,	0x10A0,	%l4
	sra	%i6,	%g1,	%l6
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x11,	%o4
	ldd	[%l7 + 0x78],	%f2
	ldx	[%l7 + 0x10],	%i7
	fbug,a	%fcc2,	loop_561
	membar	0x3F
	set	0x4C, %o3
	ldswa	[%l7 + %o3] 0x14,	%o2
loop_561:
	fcmpne32	%f14,	%f30,	%i2
	fpadd16	%f18,	%f12,	%f18
	edge16l	%i5,	%g5,	%l0
	fsrc2s	%f18,	%f17
	nop
	setx	loop_562,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%g7,	%l3
	fcmpgt32	%f8,	%f18,	%i0
	fmovsvc	%xcc,	%f12,	%f24
loop_562:
	fzero	%f22
	umul	%i4,	0x0961,	%i1
	fornot2	%f24,	%f16,	%f24
	fmovspos	%xcc,	%f0,	%f12
	orncc	%i3,	%l1,	%l2
	sdivx	%g2,	0x1379,	%o5
	sdiv	%o1,	0x1281,	%g6
	fmovrdne	%g4,	%f18,	%f12
	xorcc	%o6,	0x141F,	%o3
	popc	%g3,	%l5
	ta	%icc,	0x6
	tcc	%xcc,	0x2
	sir	0x1BAA
	wr	%g0,	0x18,	%asi
	stwa	%o7,	[%l7 + 0x10] %asi
	fbo	%fcc2,	loop_563
	be	loop_564
	movne	%icc,	%o0,	%i6
	fzero	%f12
loop_563:
	movcs	%icc,	%l4,	%g1
loop_564:
	movpos	%xcc,	%l6,	%o4
	fpsub32s	%f29,	%f25,	%f16
	edge32l	%i7,	%o2,	%i2
	edge32n	%g5,	%i5,	%g7
	tl	%xcc,	0x2
	edge32n	%l3,	%l0,	%i4
	fbug	%fcc2,	loop_565
	fcmple32	%f18,	%f20,	%i0
	subc	%i3,	0x05CD,	%i1
	edge32l	%l2,	%l1,	%g2
loop_565:
	sdivcc	%o5,	0x1889,	%g6
	alignaddr	%g4,	%o1,	%o3
	brgez	%o6,	loop_566
	sethi	0x1289,	%l5
	edge32	%o7,	%o0,	%i6
	addccc	%l4,	%g3,	%l6
loop_566:
	brgez	%g1,	loop_567
	tn	%xcc,	0x2
	fmovda	%xcc,	%f28,	%f4
	fcmpgt32	%f28,	%f22,	%i7
loop_567:
	fmovsn	%xcc,	%f8,	%f12
	and	%o2,	0x02AE,	%o4
	movrgez	%g5,	0x0CE,	%i2
	tcc	%icc,	0x5
	brlez,a	%g7,	loop_568
	sllx	%i5,	%l3,	%l0
	bl	%icc,	loop_569
	tg	%icc,	0x1
loop_568:
	sra	%i0,	%i3,	%i1
	sethi	0x0F05,	%l2
loop_569:
	mulscc	%l1,	0x000B,	%g2
	alignaddr	%i4,	%g6,	%o5
	fmovsn	%icc,	%f29,	%f18
	addccc	%g4,	0x007C,	%o1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x09] %asi,	%o3
	tl	%xcc,	0x5
	movge	%xcc,	%o6,	%o7
	fpack16	%f24,	%f24
	ba,a	%xcc,	loop_570
	sll	%o0,	0x07,	%l5
	set	0x3C, %i2
	sta	%f11,	[%l7 + %i2] 0x14
loop_570:
	fmovdl	%icc,	%f31,	%f4
	movge	%xcc,	%l4,	%i6
	fbe	%fcc3,	loop_571
	popc	0x0F8F,	%g3
	xnorcc	%l6,	0x1307,	%i7
	sra	%o2,	%g1,	%g5
loop_571:
	subccc	%i2,	0x1DA2,	%o4
	brz	%i5,	loop_572
	sub	%g7,	%l3,	%i0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x66] %asi,	%l0
loop_572:
	alignaddr	%i1,	%i3,	%l2
	tcs	%xcc,	0x0
	or	%l1,	0x1E1C,	%g2
	taddcc	%i4,	0x1120,	%g6
	fmovrsgz	%g4,	%f18,	%f1
	movn	%xcc,	%o1,	%o3
	set	0x0E, %i0
	stba	%o5,	[%l7 + %i0] 0xe2
	membar	#Sync
	edge32n	%o6,	%o0,	%l5
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x10,	%o6
	for	%f10,	%f14,	%f26
	addcc	%i6,	%g3,	%l6
	bvc,a	loop_573
	call	loop_574
	movrgez	%l4,	0x2F4,	%i7
	fmul8x16	%f25,	%f24,	%f24
loop_573:
	umul	%g1,	0x0697,	%o2
loop_574:
	subccc	%i2,	0x1F15,	%o4
	fandnot2s	%f28,	%f24,	%f4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%g7
	lduh	[%l7 + 0x68],	%i5
	fmovrdlz	%i0,	%f10,	%f0
	fmul8x16al	%f10,	%f1,	%f6
	fbul,a	%fcc3,	loop_575
	or	%l3,	%i1,	%l0
	fbo,a	%fcc2,	loop_576
	ld	[%l7 + 0x3C],	%f19
loop_575:
	srl	%i3,	%l2,	%l1
	lduh	[%l7 + 0x7A],	%g2
loop_576:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g6,	[%l7 + 0x24]
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x30] %asi,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g4,	%o1,	%o3
	tn	%xcc,	0x1
	fmovrdgez	%i4,	%f28,	%f6
	flush	%l7 + 0x5C
	sdivcc	%o6,	0x109D,	%o5
	bl,a,pn	%xcc,	loop_577
	swap	[%l7 + 0x20],	%l5
	addccc	%o0,	%o7,	%g3
	tn	%icc,	0x6
loop_577:
	edge8	%l6,	%i6,	%l4
	umul	%i7,	%o2,	%g1
	orn	%o4,	%i2,	%g5
	fmovdl	%xcc,	%f13,	%f4
	movleu	%icc,	%i5,	%i0
	xorcc	%g7,	0x138D,	%l3
	fornot2s	%f26,	%f26,	%f31
	fbn,a	%fcc1,	loop_578
	tn	%xcc,	0x3
	edge8	%l0,	%i1,	%l2
	prefetch	[%l7 + 0x4C],	 0x2
loop_578:
	subc	%l1,	0x16F3,	%g2
	orncc	%g6,	%g4,	%o1
	edge16	%o3,	%i3,	%o6
	movge	%icc,	%o5,	%l5
	wr	%g0,	0x19,	%asi
	stwa	%o0,	[%l7 + 0x64] %asi
	add	%i4,	%g3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o7,	%i6
	edge16n	%l4,	%o2,	%i7
	addccc	%g1,	0x138E,	%o4
	ta	%xcc,	0x2
	taddcctv	%g5,	0x1B90,	%i5
	edge16	%i0,	%g7,	%l3
	movcs	%xcc,	%l0,	%i2
	move	%icc,	%l2,	%l1
	movneg	%icc,	%g2,	%i1
	taddcc	%g4,	0x003B,	%o1
	or	%g6,	0x11AD,	%i3
	fmul8ulx16	%f26,	%f14,	%f26
	orncc	%o6,	%o3,	%l5
	fbl	%fcc1,	loop_579
	nop
	setx	loop_580,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2	%f0,	%f12,	%f20
	orn	%o0,	0x10B0,	%i4
loop_579:
	fbug	%fcc2,	loop_581
loop_580:
	bpos	loop_582
	movgu	%icc,	%g3,	%o5
	move	%icc,	%l6,	%i6
loop_581:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x43] %asi,	%o7
loop_582:
	srl	%o2,	%l4,	%g1
	mova	%xcc,	%i7,	%g5
	movneg	%xcc,	%o4,	%i5
	movrlz	%g7,	0x182,	%l3
	fcmped	%fcc2,	%f12,	%f10
	wr	%g0,	0x21,	%asi
	stxa	%i0,	[%g0 + 0x110] %asi
	fmovdvc	%icc,	%f4,	%f26
	fmovdleu	%icc,	%f11,	%f4
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	movle	%icc,	%i2,	%l2
	membar	0x19
	fpadd32s	%f5,	%f24,	%f14
	movle	%xcc,	%l0,	%g2
	movvc	%xcc,	%i1,	%l1
	tn	%xcc,	0x0
	fpsub16	%f30,	%f26,	%f14
	ta	%icc,	0x7
	fsrc2	%f2,	%f22
	edge32ln	%g4,	%g6,	%o1
	mulx	%i3,	0x1A4D,	%o6
	subc	%l5,	%o3,	%i4
	mulscc	%g3,	%o5,	%l6
	sdiv	%o0,	0x07ED,	%o7
	fbuge	%fcc2,	loop_583
	movgu	%xcc,	%i6,	%l4
	fmovrslz	%g1,	%f30,	%f4
	pdist	%f24,	%f0,	%f8
loop_583:
	movneg	%xcc,	%o2,	%g5
	set	0x27, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i7
	alignaddrl	%o4,	%i5,	%g7
	fbo,a	%fcc2,	loop_584
	movre	%i0,	%i2,	%l2
	umul	%l0,	0x057A,	%l3
	andncc	%i1,	%l1,	%g2
loop_584:
	stx	%g6,	[%l7 + 0x28]
	subccc	%g4,	0x14B3,	%i3
	fmovdcs	%icc,	%f31,	%f4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	fxnor	%f12,	%f12,	%f30
	bg	loop_585
	andncc	%l5,	%o3,	%i4
	set	0x2C, %l2
	lduwa	[%l7 + %l2] 0x81,	%o1
loop_585:
	edge32n	%g3,	%o5,	%o0
	edge8	%o7,	%l6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pt	%icc,	loop_586
	fnot1s	%f16,	%f27
	set	0x14, %g3
	stba	%i6,	[%l7 + %g3] 0x10
loop_586:
	smulcc	%g1,	0x0FF1,	%g5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x34] %asi,	%f31
	srl	%i7,	0x05,	%o4
	wr	%g0,	0x81,	%asi
	stxa	%o2,	[%l7 + 0x28] %asi
	ldub	[%l7 + 0x71],	%i5
	fbule,a	%fcc1,	loop_587
	fmovsgu	%xcc,	%f22,	%f7
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x18,	%g7,	%i2
loop_587:
	fmovda	%icc,	%f21,	%f3
	popc	0x0178,	%i0
	fmovrslz	%l0,	%f30,	%f22
	fmovdleu	%icc,	%f14,	%f19
	udivx	%l2,	0x0C5D,	%l3
	mulscc	%l1,	0x074B,	%g2
	fble	%fcc2,	loop_588
	brlez,a	%g6,	loop_589
	movrgz	%g4,	0x0B8,	%i3
	sir	0x0786
loop_588:
	movleu	%icc,	%i1,	%l5
loop_589:
	nop
	wr	%g0,	0x19,	%asi
	stda	%o2,	[%l7 + 0x78] %asi
	stb	%o6,	[%l7 + 0x0F]
	fmovse	%xcc,	%f30,	%f31
	movrlez	%o1,	0x19C,	%g3
	ldstub	[%l7 + 0x1D],	%o5
	for	%f24,	%f8,	%f14
	move	%icc,	%o0,	%i4
	subc	%l6,	0x1110,	%l4
	sdivx	%o7,	0x1013,	%i6
	movcs	%icc,	%g1,	%g5
	srl	%o4,	%i7,	%i5
	bg,a,pn	%icc,	loop_590
	movpos	%xcc,	%o2,	%i2
	sdiv	%i0,	0x13C5,	%l0
	te	%xcc,	0x1
loop_590:
	fzeros	%f3
	ta	%icc,	0x3
	bshuffle	%f20,	%f26,	%f24
	fnegs	%f17,	%f0
	fbl,a	%fcc2,	loop_591
	fbn,a	%fcc1,	loop_592
	fnot1	%f0,	%f14
	movrne	%l2,	0x088,	%l3
loop_591:
	bshuffle	%f6,	%f28,	%f22
loop_592:
	nop
	set	0x6A, %l3
	ldsha	[%l7 + %l3] 0x10,	%l1
	fbne	%fcc3,	loop_593
	movleu	%xcc,	%g2,	%g6
	move	%icc,	%g7,	%g4
	smul	%i3,	%i1,	%o3
loop_593:
	movge	%xcc,	%o6,	%o1
	fmovsg	%xcc,	%f12,	%f4
	movrlez	%l5,	%g3,	%o5
	tle	%icc,	0x2
	ba,pt	%icc,	loop_594
	fmovsneg	%xcc,	%f5,	%f25
	srax	%i4,	%l6,	%l4
	addcc	%o7,	0x1E31,	%o0
loop_594:
	fmovsa	%xcc,	%f16,	%f12
	fmovrslez	%g1,	%f28,	%f27
	fmovrdgez	%g5,	%f20,	%f28
	mulscc	%i6,	0x0DE3,	%o4
	tvc	%xcc,	0x7
	bgu,a,pt	%icc,	loop_595
	stx	%i7,	[%l7 + 0x58]
	fmovrslz	%o2,	%f13,	%f21
	taddcc	%i2,	0x1CE1,	%i5
loop_595:
	nop
	setx	loop_596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%xcc,	%f31,	%f9
	edge8ln	%l0,	%l2,	%i0
	sethi	0x1143,	%l3
loop_596:
	tge	%icc,	0x7
	orn	%g2,	%l1,	%g6
	lduw	[%l7 + 0x5C],	%g7
	movrgez	%g4,	%i3,	%i1
	stx	%o6,	[%l7 + 0x68]
	srax	%o1,	%o3,	%g3
	bge,a	loop_597
	fcmpgt32	%f16,	%f20,	%l5
	taddcctv	%o5,	0x1BA9,	%l6
	stx	%i4,	[%l7 + 0x70]
loop_597:
	alignaddr	%o7,	%l4,	%o0
	array32	%g1,	%g5,	%o4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i7
	tsubcc	%i6,	%o2,	%i2
	set	0x62, %g6
	lduha	[%l7 + %g6] 0x80,	%l0
	tl	%icc,	0x5
	brnz,a	%l2,	loop_598
	brz,a	%i5,	loop_599
	sdivx	%i0,	0x16A1,	%g2
	udivx	%l1,	0x12EE,	%g6
loop_598:
	popc	%l3,	%g4
loop_599:
	movgu	%icc,	%g7,	%i1
	fbug,a	%fcc0,	loop_600
	array32	%o6,	%o1,	%o3
	fmovsle	%icc,	%f23,	%f25
	fmovsg	%xcc,	%f21,	%f12
loop_600:
	xorcc	%i3,	%l5,	%g3
	fpack16	%f4,	%f19
	fcmpgt32	%f6,	%f6,	%l6
	fbug,a	%fcc1,	loop_601
	edge8ln	%i4,	%o7,	%o5
	fmovdvc	%xcc,	%f28,	%f30
	bn,a,pt	%icc,	loop_602
loop_601:
	subccc	%o0,	0x0D58,	%g1
	movn	%icc,	%l4,	%g5
	edge32l	%i7,	%o4,	%i6
loop_602:
	bge,a	%xcc,	loop_603
	fmovdg	%xcc,	%f8,	%f6
	popc	%o2,	%l0
	swap	[%l7 + 0x7C],	%i2
loop_603:
	edge32n	%i5,	%i0,	%l2
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%l1
	bcc,a	%xcc,	loop_604
	xor	%g2,	0x005E,	%g6
	ba,pn	%icc,	loop_605
	fsrc1s	%f21,	%f23
loop_604:
	subc	%l3,	0x15D6,	%g4
	addccc	%g7,	0x151D,	%o6
loop_605:
	nop
	set	0x14, %g4
	swapa	[%l7 + %g4] 0x80,	%i1
	ble,pn	%xcc,	loop_606
	tl	%xcc,	0x2
	orncc	%o3,	0x124F,	%o1
	stx	%l5,	[%l7 + 0x08]
loop_606:
	bcs,pt	%icc,	loop_607
	orcc	%i3,	%l6,	%g3
	andcc	%o7,	%i4,	%o0
	tcs	%icc,	0x4
loop_607:
	fcmpeq32	%f26,	%f12,	%g1
	fmovse	%icc,	%f1,	%f11
	srl	%o5,	%g5,	%l4
	umul	%o4,	0x0D43,	%i7
	fcmpne32	%f28,	%f2,	%o2
	fmovdvs	%icc,	%f10,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l0,	%i6,	%i2
	addccc	%i5,	0x1840,	%l2
	tcc	%icc,	0x0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i0
	ble,pn	%icc,	loop_608
	siam	0x3
	fbul	%fcc2,	loop_609
	tleu	%xcc,	0x6
loop_608:
	ldsh	[%l7 + 0x58],	%g2
	sra	%l1,	%g6,	%l3
loop_609:
	andncc	%g7,	%g4,	%o6
	movn	%icc,	%o3,	%i1
	tsubcctv	%l5,	0x08CB,	%i3
	sdivx	%o1,	0x0861,	%l6
	movcc	%icc,	%o7,	%i4
	subcc	%g3,	%o0,	%o5
	orncc	%g5,	%l4,	%o4
	fblg	%fcc3,	loop_610
	bvc,a	loop_611
	tl	%icc,	0x5
	fornot2s	%f4,	%f31,	%f18
loop_610:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
loop_611:
	edge32n	%o2,	%l0,	%i6
	movrgz	%i2,	0x3BE,	%i7
	fmovsgu	%icc,	%f1,	%f1
	umul	%i5,	%l2,	%g2
	fmovdneg	%icc,	%f14,	%f29
	bcs,a	%icc,	loop_612
	call	loop_613
	movn	%xcc,	%i0,	%l1
	brnz,a	%g6,	loop_614
loop_612:
	fpsub32	%f26,	%f12,	%f4
loop_613:
	movgu	%xcc,	%g7,	%l3
	fnot1	%f30,	%f0
loop_614:
	tge	%icc,	0x1
	sra	%g4,	0x04,	%o6
	fbo	%fcc1,	loop_615
	tn	%icc,	0x0
	tvs	%icc,	0x5
	addccc	%i1,	0x156D,	%o3
loop_615:
	fmovdn	%icc,	%f11,	%f1
	fnor	%f6,	%f28,	%f2
	fbge,a	%fcc0,	loop_616
	mulx	%l5,	0x03E1,	%o1
	set	0x30, %i6
	stha	%l6,	[%l7 + %i6] 0x14
loop_616:
	bcs	loop_617
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc2,	loop_618
	fxor	%f24,	%f22,	%f6
loop_617:
	fmovdleu	%xcc,	%f5,	%f1
	bl,a,pt	%icc,	loop_619
loop_618:
	sll	%i3,	%o7,	%i4
	array8	%g3,	%o5,	%g5
	tsubcc	%o0,	0x152A,	%o4
loop_619:
	xorcc	%l4,	0x050D,	%o2
	mova	%icc,	%g1,	%i6
	tvc	%icc,	0x2
	movcc	%xcc,	%i2,	%i7
	alignaddr	%l0,	%l2,	%g2
	fba	%fcc1,	loop_620
	fpsub32s	%f21,	%f11,	%f22
	alignaddrl	%i0,	%l1,	%i5
	xor	%g7,	%g6,	%l3
loop_620:
	movpos	%xcc,	%g4,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f22,	%f6,	%f7
	te	%xcc,	0x7
	edge8ln	%o3,	%i1,	%l5
	ta	%icc,	0x3
	array8	%l6,	%o1,	%o7
	edge16l	%i3,	%i4,	%g3
	movvs	%xcc,	%o5,	%g5
	edge8l	%o0,	%l4,	%o2
	tne	%xcc,	0x0
	mova	%xcc,	%o4,	%g1
	edge16n	%i6,	%i2,	%i7
	movvs	%icc,	%l2,	%l0
	tpos	%xcc,	0x2
	tne	%icc,	0x5
	smulcc	%i0,	%g2,	%l1
	mova	%xcc,	%i5,	%g7
	set	0x20, %l4
	stwa	%g6,	[%l7 + %l4] 0x15
	array32	%g4,	%l3,	%o3
	fmovsg	%xcc,	%f12,	%f25
	edge32l	%o6,	%l5,	%l6
	fbue	%fcc2,	loop_621
	taddcctv	%o1,	%o7,	%i1
	sllx	%i4,	0x16,	%g3
	srlx	%i3,	0x1D,	%o5
loop_621:
	bne,a,pn	%icc,	loop_622
	edge32	%g5,	%l4,	%o0
	ta	%icc,	0x6
	edge32n	%o4,	%o2,	%i6
loop_622:
	udivx	%g1,	0x1442,	%i2
	movcc	%icc,	%l2,	%l0
	movvc	%xcc,	%i0,	%i7
	wr	%g0,	0x52,	%asi
	stxa	%l1,	[%g0 + 0x218] %asi
	lduw	[%l7 + 0x58],	%g2
	fornot2s	%f20,	%f12,	%f21
	fmuld8ulx16	%f25,	%f31,	%f14
	srax	%g7,	0x1C,	%i5
	tpos	%xcc,	0x5
	movg	%icc,	%g6,	%g4
	fands	%f29,	%f19,	%f5
	movle	%xcc,	%l3,	%o6
	tcs	%icc,	0x0
	bn,a	loop_623
	array32	%l5,	%l6,	%o3
	fmovrdne	%o7,	%f8,	%f10
	fnot2s	%f8,	%f16
loop_623:
	fmovrslz	%o1,	%f10,	%f24
	edge16l	%i1,	%g3,	%i3
	popc	%o5,	%g5
	ta	%icc,	0x5
	fpsub32s	%f19,	%f20,	%f12
	andn	%l4,	%i4,	%o0
	stx	%o2,	[%l7 + 0x28]
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x22,	%i6
	sub	%g1,	0x1727,	%i2
	fcmpne32	%f6,	%f4,	%l2
	fmovdne	%icc,	%f16,	%f12
	sub	%o4,	0x0D3A,	%i0
	or	%l0,	0x065C,	%i7
	fmul8ulx16	%f14,	%f0,	%f2
	xorcc	%l1,	%g2,	%i5
	fbl	%fcc3,	loop_624
	fmovsvs	%icc,	%f21,	%f14
	mulscc	%g6,	%g4,	%g7
	andcc	%o6,	%l5,	%l3
loop_624:
	movrne	%l6,	%o3,	%o1
	udivcc	%i1,	0x16F9,	%g3
	edge32ln	%o7,	%o5,	%g5
	tneg	%xcc,	0x1
	sir	0x1A34
	lduh	[%l7 + 0x72],	%i3
	brgez,a	%i4,	loop_625
	movge	%icc,	%l4,	%o2
	fcmped	%fcc1,	%f0,	%f4
	tvs	%icc,	0x3
loop_625:
	fnot2s	%f11,	%f0
	movle	%icc,	%i6,	%o0
	fnegs	%f23,	%f17
	stb	%g1,	[%l7 + 0x35]
	ldd	[%l7 + 0x38],	%i2
	edge16ln	%o4,	%i0,	%l0
	fcmpne32	%f28,	%f2,	%l2
	xor	%i7,	0x039E,	%g2
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x88,	%i5
	or	%l1,	%g6,	%g7
	andncc	%o6,	%g4,	%l5
	edge32n	%l6,	%o3,	%o1
	brz	%l3,	loop_626
	tg	%xcc,	0x3
	ld	[%l7 + 0x70],	%f25
	alignaddr	%g3,	%i1,	%o5
loop_626:
	tg	%icc,	0x5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x15,	%f0
	bl,a	loop_627
	tcs	%xcc,	0x5
	ldd	[%l7 + 0x60],	%o6
	fmovsn	%icc,	%f12,	%f20
loop_627:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc2,	loop_628
	fmovsleu	%icc,	%f11,	%f28
	be,a	loop_629
	edge32n	%i3,	%g5,	%i4
loop_628:
	addcc	%l4,	0x1152,	%o2
	fmovsne	%icc,	%f29,	%f24
loop_629:
	sdiv	%i6,	0x177F,	%g1
	udiv	%o0,	0x0466,	%i2
	movne	%xcc,	%o4,	%l0
	sethi	0x084A,	%l2
	movge	%xcc,	%i0,	%g2
	edge8n	%i5,	%i7,	%l1
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x54] %asi,	%g7
	fpmerge	%f8,	%f0,	%f14
	set	0x72, %o7
	stba	%o6,	[%l7 + %o7] 0xe2
	membar	#Sync
	subcc	%g6,	0x0369,	%g4
	subc	%l5,	%o3,	%l6
	edge8ln	%l3,	%o1,	%i1
	bgu,pn	%xcc,	loop_630
	movvc	%icc,	%o5,	%o7
	bvc,a,pn	%xcc,	loop_631
	orn	%i3,	0x0F57,	%g3
loop_630:
	lduw	[%l7 + 0x18],	%g5
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f16
loop_631:
	te	%icc,	0x1
	call	loop_632
	fpadd16s	%f12,	%f8,	%f29
	movpos	%icc,	%l4,	%o2
	umul	%i6,	0x161F,	%i4
loop_632:
	fsrc1s	%f0,	%f14
	fnot1	%f22,	%f18
	edge32	%o0,	%g1,	%i2
	ldd	[%l7 + 0x48],	%o4
	fblg	%fcc1,	loop_633
	fabss	%f14,	%f27
	fpadd16s	%f17,	%f11,	%f25
	xnorcc	%l0,	%l2,	%i0
loop_633:
	fmovspos	%xcc,	%f25,	%f3
	xnor	%i5,	0x0D51,	%i7
	fmuld8sux16	%f25,	%f20,	%f6
	ld	[%l7 + 0x48],	%f26
	fbne,a	%fcc1,	loop_634
	ldx	[%l7 + 0x70],	%l1
	fornot2s	%f23,	%f2,	%f13
	tcs	%xcc,	0x3
loop_634:
	fmovscc	%xcc,	%f4,	%f20
	srax	%g7,	%o6,	%g2
	fmul8x16al	%f20,	%f21,	%f24
	tneg	%icc,	0x6
	movre	%g6,	0x29F,	%g4
	orncc	%o3,	0x05FA,	%l5
	edge32n	%l3,	%l6,	%o1
	addc	%o5,	0x0DE6,	%o7
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x2C] %asi,	%f18
	bcs,a,pt	%icc,	loop_635
	xnorcc	%i3,	0x05B3,	%i1
	array8	%g5,	%l4,	%g3
	edge16n	%o2,	%i4,	%i6
loop_635:
	fmovsge	%xcc,	%f27,	%f12
	andn	%o0,	%g1,	%o4
	fsrc2	%f4,	%f20
	subc	%l0,	%i2,	%l2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x2C] %asi,	%f22
	siam	0x1
	fpsub32	%f8,	%f0,	%f30
	ldd	[%l7 + 0x70],	%f26
	sdivx	%i5,	0x014F,	%i7
	bl,pt	%icc,	loop_636
	andncc	%l1,	%g7,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g2,	%g6,	%i0
loop_636:
	array16	%o3,	%g4,	%l3
	ble,a,pt	%xcc,	loop_637
	fones	%f1
	srlx	%l5,	%l6,	%o1
	ldsh	[%l7 + 0x74],	%o7
loop_637:
	fbue	%fcc1,	loop_638
	xnorcc	%o5,	0x1EC1,	%i1
	fble	%fcc3,	loop_639
	call	loop_640
loop_638:
	fmul8x16	%f31,	%f16,	%f18
	mova	%icc,	%g5,	%i3
loop_639:
	movn	%icc,	%l4,	%o2
loop_640:
	ba	loop_641
	xor	%g3,	%i4,	%o0
	set	0x56, %g5
	ldsba	[%l7 + %g5] 0x04,	%g1
loop_641:
	tgu	%icc,	0x4
	fblg	%fcc0,	loop_642
	fmovrdgez	%i6,	%f6,	%f12
	wr	%g0,	0x19,	%asi
	stba	%l0,	[%l7 + 0x53] %asi
loop_642:
	fpadd16	%f0,	%f18,	%f30
	movrne	%i2,	0x1AE,	%l2
	sub	%i5,	0x10F9,	%i7
	andcc	%o4,	%g7,	%l1
	fnegd	%f24,	%f2
	addcc	%o6,	0x1B7D,	%g2
	udiv	%i0,	0x01FC,	%g6
	ta	%xcc,	0x0
	or	%g4,	0x00CD,	%l3
	tcc	%icc,	0x6
	bvs	%icc,	loop_643
	fpadd16s	%f16,	%f21,	%f23
	umul	%l5,	0x127C,	%o3
	fpadd16	%f6,	%f18,	%f0
loop_643:
	fone	%f2
	fmovdleu	%icc,	%f10,	%f6
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	or	%l6,	0x14CA,	%o7
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
	fmovrse	%o1,	%f28,	%f29
	sra	%i1,	0x06,	%g5
	edge16l	%i3,	%o5,	%l4
loop_644:
	mulx	%g3,	0x0895,	%o2
	tn	%icc,	0x6
	swap	[%l7 + 0x4C],	%i4
	fornot2	%f14,	%f6,	%f24
	st	%f0,	[%l7 + 0x20]
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o0
	edge8	%i6,	%g1,	%l0
	srlx	%i2,	%l2,	%i5
	smulcc	%i7,	0x0A73,	%o4
	addccc	%g7,	0x19E5,	%l1
	fandnot2	%f10,	%f26,	%f18
	fxnors	%f11,	%f5,	%f1
	flush	%l7 + 0x14
	subccc	%g2,	0x13E1,	%o6
	addc	%g6,	0x03A6,	%i0
	fxnor	%f20,	%f2,	%f20
	fxor	%f6,	%f4,	%f10
	movge	%xcc,	%l3,	%l5
	movleu	%icc,	%g4,	%o3
	edge16	%l6,	%o1,	%o7
	taddcc	%g5,	%i1,	%i3
	subcc	%l4,	%g3,	%o5
	movrne	%i4,	%o2,	%i6
	movleu	%icc,	%g1,	%o0
	movgu	%icc,	%i2,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l0,	%i5
	taddcc	%o4,	0x1D1A,	%i7
	tleu	%icc,	0x5
	sllx	%g7,	%g2,	%o6
	bvs,a	loop_645
	stx	%l1,	[%l7 + 0x60]
	edge32ln	%g6,	%i0,	%l5
	fmovse	%xcc,	%f31,	%f5
loop_645:
	ldsh	[%l7 + 0x5C],	%l3
	umulcc	%g4,	0x1542,	%l6
	edge16l	%o1,	%o7,	%g5
	popc	%i1,	%i3
	array8	%o3,	%g3,	%o5
	fmovsg	%xcc,	%f26,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i4,	%o2,	%i6
	xnorcc	%g1,	%l4,	%o0
	edge32l	%i2,	%l0,	%i5
	fmovrse	%o4,	%f16,	%f23
	fmovsvc	%icc,	%f14,	%f17
	or	%i7,	0x17CE,	%g7
	stx	%l2,	[%l7 + 0x78]
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
	movrlz	%g2,	%g6,	%i0
	tsubcctv	%l1,	0x087E,	%l3
	fnot1s	%f20,	%f21
	prefetch	[%l7 + 0x78],	 0x2
	taddcc	%g4,	%l6,	%l5
	fblg,a	%fcc3,	loop_646
	ldsh	[%l7 + 0x62],	%o7
	set	0x7D, %l5
	ldsba	[%l7 + %l5] 0x14,	%g5
loop_646:
	brgez,a	%i1,	loop_647
	and	%i3,	%o3,	%o1
	move	%xcc,	%o5,	%i4
	mulx	%o2,	%i6,	%g3
loop_647:
	xnorcc	%g1,	0x1432,	%o0
	membar	0x14
	srax	%l4,	%l0,	%i2
	sub	%i5,	0x0973,	%o4
	tcc	%xcc,	0x3
	movne	%xcc,	%i7,	%l2
	orcc	%o6,	%g2,	%g7
	fmovdne	%xcc,	%f17,	%f16
	xnor	%i0,	0x18BB,	%g6
	tgu	%xcc,	0x6
	fornot1	%f2,	%f24,	%f30
	fmovrsne	%l3,	%f19,	%f8
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x70] %asi,	%l1
	edge8l	%l6,	%g4,	%l5
	alignaddr	%g5,	%i1,	%i3
	fcmpeq16	%f20,	%f0,	%o7
	move	%icc,	%o3,	%o1
	fmovdpos	%xcc,	%f20,	%f23
	ldstub	[%l7 + 0x38],	%i4
	be,a,pn	%icc,	loop_648
	te	%icc,	0x0
	srlx	%o2,	%o5,	%g3
	movrgz	%g1,	%i6,	%o0
loop_648:
	fmovsleu	%icc,	%f5,	%f7
	subcc	%l4,	0x0792,	%l0
	tge	%xcc,	0x5
	tge	%xcc,	0x7
	fmovrse	%i2,	%f7,	%f1
	fbl	%fcc2,	loop_649
	tleu	%icc,	0x3
	set	0x4C, %g7
	ldsba	[%l7 + %g7] 0x15,	%o4
loop_649:
	movpos	%xcc,	%i5,	%l2
	brnz,a	%i7,	loop_650
	fmovde	%icc,	%f18,	%f1
	tsubcctv	%o6,	0x0583,	%g2
	edge8n	%i0,	%g6,	%g7
loop_650:
	xorcc	%l3,	%l6,	%g4
	taddcc	%l1,	%g5,	%l5
	popc	%i1,	%i3
	fbu	%fcc2,	loop_651
	orncc	%o3,	0x0A42,	%o1
	brlz	%i4,	loop_652
	fone	%f18
loop_651:
	fmovrslz	%o7,	%f12,	%f19
	te	%icc,	0x7
loop_652:
	fones	%f19
	andncc	%o2,	%o5,	%g1
	fbuge	%fcc0,	loop_653
	tn	%icc,	0x0
	fmovdpos	%icc,	%f0,	%f0
	subc	%g3,	%o0,	%i6
loop_653:
	brnz,a	%l0,	loop_654
	pdist	%f12,	%f16,	%f2
	fbge,a	%fcc3,	loop_655
	fmovdcs	%icc,	%f14,	%f31
loop_654:
	tleu	%xcc,	0x7
	fone	%f18
loop_655:
	edge16ln	%l4,	%o4,	%i2
	tne	%icc,	0x1
	edge8ln	%i5,	%l2,	%o6
	move	%xcc,	%g2,	%i7
	be,pt	%xcc,	loop_656
	movl	%icc,	%i0,	%g6
	sra	%g7,	%l6,	%g4
	fbug,a	%fcc3,	loop_657
loop_656:
	array32	%l1,	%g5,	%l3
	movg	%xcc,	%l5,	%i1
	fbe,a	%fcc2,	loop_658
loop_657:
	edge8n	%i3,	%o1,	%i4
	set	0x1D, %g2
	ldstuba	[%l7 + %g2] 0x10,	%o7
loop_658:
	movrlz	%o2,	%o5,	%g1
	movrlez	%o3,	%o0,	%g3
	fblg,a	%fcc3,	loop_659
	udivcc	%i6,	0x0ED8,	%l0
	fnands	%f20,	%f18,	%f5
	edge8l	%o4,	%l4,	%i2
loop_659:
	sdivx	%i5,	0x08AA,	%l2
	fmovrslz	%g2,	%f6,	%f25
	siam	0x4
	andcc	%o6,	0x106C,	%i7
	fcmpne16	%f20,	%f12,	%i0
	movl	%xcc,	%g6,	%g7
	movle	%xcc,	%l6,	%g4
	brgz,a	%l1,	loop_660
	fmovscs	%xcc,	%f9,	%f11
	fnand	%f6,	%f12,	%f0
	brlez,a	%g5,	loop_661
loop_660:
	movcc	%xcc,	%l3,	%l5
	sdiv	%i1,	0x1272,	%o1
	edge32ln	%i3,	%o7,	%i4
loop_661:
	edge16l	%o2,	%o5,	%o3
	ld	[%l7 + 0x50],	%f29
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x79] %asi,	%g1
	add	%o0,	0x16D1,	%i6
	movrne	%g3,	%o4,	%l0
	fbo,a	%fcc1,	loop_662
	bpos,a,pt	%icc,	loop_663
	sethi	0x1000,	%i2
	fabsd	%f22,	%f4
loop_662:
	fbe,a	%fcc1,	loop_664
loop_663:
	fbne	%fcc1,	loop_665
	fmovdl	%xcc,	%f28,	%f8
	sth	%l4,	[%l7 + 0x62]
loop_664:
	addc	%i5,	%l2,	%g2
loop_665:
	xnor	%o6,	%i7,	%g6
	orncc	%i0,	%g7,	%g4
	ta	%xcc,	0x7
	subccc	%l6,	0x144A,	%l1
	tvs	%icc,	0x4
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x76] %asi,	%l3
	fmovrdlez	%g5,	%f0,	%f8
	movrlez	%l5,	%i1,	%o1
	fandnot2	%f8,	%f16,	%f4
	udivx	%o7,	0x01A2,	%i4
	sir	0x1920
	fbul	%fcc3,	loop_666
	fbuge	%fcc2,	loop_667
	umul	%o2,	0x1ECC,	%o5
	xnor	%i3,	0x04EF,	%g1
loop_666:
	st	%f17,	[%l7 + 0x1C]
loop_667:
	orn	%o3,	%i6,	%o0
	movrne	%g3,	%o4,	%i2
	fbg,a	%fcc0,	loop_668
	bn	%xcc,	loop_669
	fbue,a	%fcc2,	loop_670
	movle	%icc,	%l4,	%l0
loop_668:
	udivcc	%i5,	0x025B,	%g2
loop_669:
	tpos	%xcc,	0x3
loop_670:
	orncc	%l2,	0x073B,	%o6
	xor	%i7,	0x1653,	%i0
	xor	%g6,	%g4,	%g7
	fmovsl	%xcc,	%f1,	%f23
	fcmpgt32	%f20,	%f12,	%l6
	array8	%l1,	%g5,	%l5
	udivcc	%i1,	0x02C9,	%o1
	fbule,a	%fcc0,	loop_671
	fmovs	%f6,	%f11
	edge8	%l3,	%o7,	%i4
	movge	%icc,	%o2,	%i3
loop_671:
	movvs	%xcc,	%o5,	%o3
	tcc	%xcc,	0x2
	subccc	%g1,	%o0,	%i6
	tpos	%xcc,	0x2
	tsubcctv	%o4,	0x18B9,	%g3
	orcc	%l4,	%i2,	%l0
	tne	%xcc,	0x6
	movrne	%g2,	0x144,	%i5
	fmovrslez	%l2,	%f3,	%f27
	subccc	%i7,	%i0,	%g6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x64] %asi,	%o6
	st	%f25,	[%l7 + 0x0C]
	addccc	%g4,	0x1639,	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g5
	umulcc	%l5,	0x119D,	%l6
	sra	%i1,	%l3,	%o7
	sllx	%o1,	0x1E,	%o2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x12] %asi,	%i3
	edge32	%o5,	%o3,	%g1
	ble,a	loop_672
	call	loop_673
	movvs	%xcc,	%o0,	%i6
	tvc	%xcc,	0x4
loop_672:
	fmovdg	%xcc,	%f24,	%f31
loop_673:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x69] %asi,	%i4
	ta	%xcc,	0x3
	wr	%g0,	0x88,	%asi
	stda	%g2,	[%l7 + 0x78] %asi
	tne	%icc,	0x2
	wr	%g0,	0x27,	%asi
	stwa	%o4,	[%l7 + 0x20] %asi
	membar	#Sync
	udivx	%l4,	0x15CC,	%l0
	movne	%xcc,	%g2,	%i5
	addcc	%l2,	0x1C66,	%i7
	prefetch	[%l7 + 0x50],	 0x1
	movre	%i2,	0x0BD,	%i0
	tg	%xcc,	0x1
	subcc	%g6,	0x04C3,	%g4
	set	0x5E, %i7
	lduha	[%l7 + %i7] 0x19,	%g7
	edge16l	%o6,	%l1,	%g5
	edge32n	%l5,	%i1,	%l6
	fblg,a	%fcc0,	loop_674
	brnz	%l3,	loop_675
	bvc,a,pt	%icc,	loop_676
	fcmpd	%fcc1,	%f10,	%f26
loop_674:
	movrgz	%o1,	%o2,	%i3
loop_675:
	fandnot2s	%f7,	%f6,	%f0
loop_676:
	fmovsne	%xcc,	%f26,	%f2
	xnorcc	%o5,	0x19EE,	%o3
	ba,a	%icc,	loop_677
	fmuld8ulx16	%f29,	%f21,	%f12
	addcc	%o7,	%o0,	%g1
	udivx	%i6,	0x1B17,	%g3
loop_677:
	tleu	%xcc,	0x6
	fands	%f24,	%f21,	%f10
	fmul8sux16	%f26,	%f8,	%f22
	bneg,pt	%xcc,	loop_678
	umul	%i4,	%o4,	%l0
	array16	%l4,	%g2,	%l2
	fpadd32	%f14,	%f30,	%f6
loop_678:
	bgu,pt	%xcc,	loop_679
	udivx	%i5,	0x023D,	%i2
	edge8n	%i7,	%i0,	%g6
	and	%g7,	%o6,	%g4
loop_679:
	fbule	%fcc0,	loop_680
	mova	%icc,	%l1,	%l5
	sir	0x0D94
	popc	%i1,	%g5
loop_680:
	movne	%xcc,	%l3,	%l6
	tn	%xcc,	0x3
	andcc	%o2,	0x11CB,	%i3
	tneg	%xcc,	0x6
	tgu	%xcc,	0x5
	addccc	%o5,	0x071B,	%o1
	fornot2	%f0,	%f8,	%f18
	fbe,a	%fcc3,	loop_681
	subccc	%o3,	0x149B,	%o0
	fmuld8ulx16	%f11,	%f27,	%f6
	fsrc2s	%f15,	%f10
loop_681:
	tneg	%xcc,	0x3
	set	0x1E, %l1
	ldsba	[%l7 + %l1] 0x04,	%o7
	set	0x46, %i5
	ldsha	[%l7 + %i5] 0x11,	%i6
	xnorcc	%g1,	%g3,	%i4
	popc	%o4,	%l0
	fmovrsgez	%l4,	%f16,	%f30
	sdiv	%l2,	0x1B07,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f16,	%f21
	fxnors	%f9,	%f11,	%f13
	mova	%icc,	%i2,	%i5
	srl	%i7,	0x1F,	%g6
	fbule,a	%fcc3,	loop_682
	ldsw	[%l7 + 0x24],	%g7
	fbl,a	%fcc1,	loop_683
	tge	%xcc,	0x6
loop_682:
	fmovdpos	%xcc,	%f17,	%f19
	udivcc	%i0,	0x1324,	%o6
loop_683:
	sethi	0x11A0,	%l1
	andncc	%l5,	%g4,	%i1
	edge16l	%l3,	%l6,	%g5
	andcc	%o2,	0x0BFB,	%o5
	fba	%fcc3,	loop_684
	edge8ln	%o1,	%o3,	%i3
	set	0x7F, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o0
loop_684:
	fmovrse	%o7,	%f8,	%f22
	tvs	%icc,	0x7
	edge16l	%i6,	%g1,	%g3
	fmovda	%xcc,	%f14,	%f22
	sll	%o4,	0x04,	%l0
	nop
	set	0x40, %i4
	ldsh	[%l7 + %i4],	%l4
	edge32	%i4,	%l2,	%g2
	wr	%g0,	0xea,	%asi
	stha	%i2,	[%l7 + 0x38] %asi
	membar	#Sync
	fmovsa	%icc,	%f18,	%f27
	fornot2	%f10,	%f4,	%f30
	fmovdcc	%icc,	%f31,	%f7
	fcmpes	%fcc2,	%f25,	%f0
	ldsb	[%l7 + 0x6B],	%i7
	tcs	%icc,	0x2
	orncc	%i5,	0x006C,	%g7
	fmovsge	%icc,	%f0,	%f23
	movrlez	%g6,	0x3C7,	%i0
	fcmpne32	%f18,	%f4,	%l1
	fcmpd	%fcc2,	%f10,	%f0
	ble,pt	%icc,	loop_685
	fmovsle	%xcc,	%f20,	%f10
	udiv	%o6,	0x1226,	%g4
	te	%xcc,	0x1
loop_685:
	nop
	set	0x28, %o4
	sta	%f26,	[%l7 + %o4] 0x11
	bl	loop_686
	smul	%l5,	%i1,	%l3
	edge8l	%l6,	%g5,	%o5
	ldsh	[%l7 + 0x6E],	%o1
loop_686:
	te	%xcc,	0x4
	movneg	%icc,	%o2,	%o3
	ldd	[%l7 + 0x70],	%f24
	fmovrdlz	%i3,	%f14,	%f18
	mulscc	%o0,	0x0430,	%i6
	movpos	%xcc,	%o7,	%g1
	udivx	%o4,	0x0C6E,	%l0
	tleu	%xcc,	0x3
	xnor	%g3,	0x130D,	%l4
	membar	0x03
	xnorcc	%i4,	0x1DAF,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc2,	%f7,	%f30
	fcmps	%fcc2,	%f31,	%f23
	bge,pn	%icc,	loop_687
	addccc	%i2,	0x137B,	%i7
	fmovrsgz	%i5,	%f14,	%f29
	edge16n	%l2,	%g6,	%g7
loop_687:
	bn,a	loop_688
	tneg	%xcc,	0x6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%l1
loop_688:
	movgu	%icc,	%g4,	%l5
	std	%i0,	[%l7 + 0x40]
	mova	%icc,	%l3,	%l6
	movleu	%icc,	%o6,	%o5
	fmul8x16al	%f22,	%f26,	%f16
	fbul	%fcc2,	loop_689
	fmovrsgz	%g5,	%f21,	%f30
	popc	%o1,	%o2
	lduw	[%l7 + 0x08],	%o3
loop_689:
	bneg,a	loop_690
	xorcc	%o0,	%i6,	%o7
	xor	%g1,	0x0A75,	%i3
	ble,a,pn	%icc,	loop_691
loop_690:
	tne	%icc,	0x6
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
	smulcc	%o4,	0x1C9B,	%l0
loop_691:
	nop
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x80,	%l4
loop_692:
	fmovdcs	%icc,	%f7,	%f24
	movge	%xcc,	%i4,	%g2
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x17,	%f16
	bpos	%icc,	loop_693
	xnorcc	%g3,	0x0655,	%i2
	alignaddr	%i5,	%i7,	%l2
	ta	%xcc,	0x1
loop_693:
	orcc	%g6,	0x07CC,	%g7
	bshuffle	%f16,	%f0,	%f10
	movre	%l1,	%g4,	%l5
	movrlez	%i1,	%l3,	%i0
	stb	%l6,	[%l7 + 0x1D]
	or	%o6,	0x1D49,	%g5
	fmovrsgez	%o1,	%f24,	%f28
	prefetch	[%l7 + 0x20],	 0x2
	bvc,a,pn	%icc,	loop_694
	fcmpgt32	%f4,	%f0,	%o5
	fpack16	%f12,	%f18
	fnot2s	%f11,	%f15
loop_694:
	edge32l	%o3,	%o2,	%o0
	movl	%xcc,	%i6,	%o7
	edge16	%g1,	%o4,	%l0
	mulscc	%i3,	0x008F,	%i4
	set	0x6F, %i0
	ldstuba	[%l7 + %i0] 0x0c,	%g2
	udiv	%g3,	0x1FCA,	%i2
	xor	%l4,	%i5,	%l2
	ldsh	[%l7 + 0x72],	%i7
	udivx	%g7,	0x1D4D,	%g6
	movre	%l1,	0x1B6,	%l5
	tvs	%xcc,	0x5
	xorcc	%i1,	%l3,	%i0
	tg	%icc,	0x0
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x24] %asi,	%g4
	movneg	%icc,	%l6,	%o6
	popc	%o1,	%g5
	tsubcc	%o5,	%o2,	%o3
	subc	%o0,	%o7,	%g1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o4
	fcmpgt32	%f6,	%f4,	%l0
	udivx	%i3,	0x1EFB,	%i4
	fone	%f14
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x38] %asi,	%i6
	movpos	%xcc,	%g2,	%g3
	flush	%l7 + 0x74
	fxor	%f2,	%f16,	%f14
	srax	%l4,	0x05,	%i5
	movrne	%i2,	0x13D,	%i7
	fmovde	%icc,	%f7,	%f18
	fexpand	%f20,	%f12
	fors	%f24,	%f5,	%f26
	fbue,a	%fcc2,	loop_695
	fpmerge	%f13,	%f31,	%f10
	membar	0x38
	movvs	%xcc,	%l2,	%g6
loop_695:
	fmovde	%xcc,	%f23,	%f9
	or	%g7,	%l5,	%l1
	andcc	%l3,	0x0840,	%i0
	tvc	%xcc,	0x1
	tn	%icc,	0x5
	fpmerge	%f25,	%f10,	%f14
	for	%f2,	%f22,	%f2
	array32	%i1,	%g4,	%o6
	movrne	%o1,	%g5,	%o5
	fbo	%fcc0,	loop_696
	fpsub32	%f4,	%f18,	%f6
	movcc	%xcc,	%o2,	%l6
	fbl,a	%fcc2,	loop_697
loop_696:
	fmul8sux16	%f16,	%f20,	%f16
	movrlz	%o0,	0x26A,	%o3
	movle	%icc,	%o7,	%g1
loop_697:
	nop
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x81,	 0x1
	flush	%l7 + 0x14
	udiv	%l0,	0x0318,	%i4
	fmul8sux16	%f28,	%f22,	%f20
	tleu	%icc,	0x0
	fmovscc	%icc,	%f5,	%f27
	std	%i6,	[%l7 + 0x48]
	call	loop_698
	addcc	%g2,	%i3,	%g3
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f16
loop_698:
	movl	%icc,	%i5,	%l4
	ldd	[%l7 + 0x40],	%i6
	fbu,a	%fcc2,	loop_699
	bne,a	%xcc,	loop_700
	move	%icc,	%l2,	%i2
	fsrc1	%f20,	%f12
loop_699:
	swap	[%l7 + 0x5C],	%g6
loop_700:
	membar	0x3F
	ldsw	[%l7 + 0x08],	%g7
	nop
	set	0x47, %l6
	stb	%l5,	[%l7 + %l6]
	fbu,a	%fcc1,	loop_701
	sethi	0x1296,	%l3
	alignaddr	%l1,	%i1,	%i0
	sllx	%g4,	0x13,	%o1
loop_701:
	edge8n	%g5,	%o5,	%o6
	ble	%xcc,	loop_702
	edge16ln	%o2,	%o0,	%l6
	fmovrdgz	%o3,	%f14,	%f30
	orncc	%o7,	%o4,	%g1
loop_702:
	fbl	%fcc0,	loop_703
	array8	%i4,	%i6,	%g2
	alignaddrl	%l0,	%g3,	%i3
	sir	0x1C07
loop_703:
	nop
	set	0x7C, %l2
	stwa	%i5,	[%l7 + %l2] 0x11
	fand	%f22,	%f30,	%f0
	popc	%l4,	%l2
	fpadd16s	%f7,	%f3,	%f11
	movrgz	%i7,	0x14B,	%i2
	brz	%g6,	loop_704
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l5,	0x19C0,	%g7
	bgu	loop_705
loop_704:
	sll	%l1,	%i1,	%i0
	mulscc	%g4,	%o1,	%l3
	fbue	%fcc0,	loop_706
loop_705:
	fbuge,a	%fcc2,	loop_707
	fmovrslz	%g5,	%f27,	%f18
	fbule	%fcc1,	loop_708
loop_706:
	udivcc	%o5,	0x11A3,	%o2
loop_707:
	tvs	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_708:
	add	%o0,	%l6,	%o3
	sdivx	%o6,	0x0263,	%o7
	fmovdl	%icc,	%f30,	%f27
	subc	%o4,	%i4,	%i6
	fblg	%fcc2,	loop_709
	movneg	%icc,	%g1,	%g2
	fmovse	%xcc,	%f14,	%f24
	fornot2	%f2,	%f6,	%f28
loop_709:
	fmul8x16au	%f4,	%f20,	%f18
	movl	%icc,	%g3,	%i3
	edge32l	%i5,	%l0,	%l4
	fmovrsgz	%i7,	%f0,	%f13
	movrlez	%l2,	0x28F,	%i2
	set	0x34, %g3
	stwa	%g6,	[%l7 + %g3] 0x81
	xor	%l5,	0x0E5D,	%g7
	tg	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f24,	%f22,	%f14
	stx	%l1,	[%l7 + 0x20]
	stbar
	bne	loop_710
	fzeros	%f11
	umul	%i1,	0x107B,	%g4
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
loop_710:
	or	%o1,	%i0,	%l3
	wr	%g0,	0x19,	%asi
	sta	%f21,	[%l7 + 0x40] %asi
loop_711:
	tle	%xcc,	0x4
	bl,a,pn	%xcc,	loop_712
	umulcc	%g5,	%o5,	%o2
	bge,pt	%icc,	loop_713
	brlez	%l6,	loop_714
loop_712:
	mulx	%o3,	%o6,	%o7
	movge	%xcc,	%o4,	%i4
loop_713:
	fxor	%f14,	%f28,	%f22
loop_714:
	sll	%i6,	%g1,	%g2
	tcc	%icc,	0x1
	edge16n	%o0,	%i3,	%i5
	move	%icc,	%g3,	%l0
	fba,a	%fcc3,	loop_715
	fmuld8sux16	%f26,	%f27,	%f22
	umul	%l4,	0x10F1,	%l2
	bshuffle	%f14,	%f10,	%f24
loop_715:
	bshuffle	%f28,	%f6,	%f4
	movge	%xcc,	%i7,	%g6
	prefetch	[%l7 + 0x64],	 0x0
	set	0x50, %l3
	ldda	[%l7 + %l3] 0xe3,	%i2
	udivx	%g7,	0x1397,	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l1
	tcc	%icc,	0x7
	bge,a,pn	%icc,	loop_716
	fbge	%fcc0,	loop_717
	fpackfix	%f10,	%f10
	fpadd32s	%f20,	%f27,	%f7
loop_716:
	fmuld8sux16	%f6,	%f17,	%f4
loop_717:
	fmovda	%xcc,	%f2,	%f25
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%o1
	tvc	%xcc,	0x4
	wr	%g0,	0xe2,	%asi
	stha	%l3,	[%l7 + 0x46] %asi
	membar	#Sync
	edge32	%g5,	%i0,	%o2
	alignaddr	%o5,	%l6,	%o3
	movge	%xcc,	%o7,	%o4
	fmovdneg	%xcc,	%f4,	%f13
	fpadd32	%f2,	%f10,	%f16
	std	%o6,	[%l7 + 0x28]
	fbuge	%fcc0,	loop_718
	tne	%icc,	0x4
	membar	0x5F
	fpsub32s	%f20,	%f13,	%f31
loop_718:
	smulcc	%i6,	%g1,	%i4
	faligndata	%f10,	%f28,	%f10
	sra	%o0,	0x18,	%g2
	fpadd16	%f14,	%f30,	%f28
	call	loop_719
	call	loop_720
	fmovdn	%icc,	%f20,	%f30
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
loop_719:
	movvs	%icc,	%i5,	%g3
loop_720:
	movrne	%l4,	%l2,	%i7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x41] %asi,	%g6
	set	0x68, %g6
	stxa	%l0,	[%l7 + %g6] 0xea
	membar	#Sync
	fmul8ulx16	%f22,	%f30,	%f16
	orn	%g7,	%l5,	%i1
	edge8ln	%l1,	%i2,	%g4
	array8	%o1,	%l3,	%g5
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x2a,	%o2
	alignaddr	%i0,	%l6,	%o3
	fbuge,a	%fcc2,	loop_721
	te	%xcc,	0x0
	edge16	%o5,	%o7,	%o4
	fzero	%f10
loop_721:
	bneg	loop_722
	fnand	%f4,	%f8,	%f16
	smul	%i6,	%g1,	%o6
	movrgz	%i4,	0x22D,	%g2
loop_722:
	tpos	%icc,	0x5
	mova	%xcc,	%o0,	%i5
	fmul8sux16	%f0,	%f6,	%f4
	udivcc	%i3,	0x1D30,	%l4
	movrlez	%l2,	%i7,	%g3
	tcc	%xcc,	0x4
	sra	%l0,	%g7,	%l5
	mova	%icc,	%i1,	%g6
	ldstub	[%l7 + 0x10],	%l1
	subccc	%g4,	0x0DDC,	%o1
	set	0x46, %o1
	ldsba	[%l7 + %o1] 0x04,	%i2
	edge32ln	%l3,	%g5,	%i0
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x60] %asi,	%f14
	fnands	%f21,	%f27,	%f9
	movpos	%xcc,	%l6,	%o3
	tvs	%xcc,	0x5
	alignaddrl	%o2,	%o7,	%o4
	xorcc	%i6,	0x1CB9,	%g1
	fmul8sux16	%f18,	%f4,	%f24
	tle	%icc,	0x4
	sdivx	%o5,	0x1D0A,	%o6
	fbg	%fcc2,	loop_723
	mova	%icc,	%i4,	%g2
	fnot2s	%f4,	%f9
	xorcc	%i5,	%i3,	%l4
loop_723:
	edge8n	%l2,	%o0,	%i7
	fba	%fcc2,	loop_724
	bn,a	%icc,	loop_725
	fbul,a	%fcc0,	loop_726
	movrlez	%l0,	0x196,	%g3
loop_724:
	fcmpgt16	%f18,	%f4,	%l5
loop_725:
	edge32ln	%g7,	%i1,	%l1
loop_726:
	tsubcctv	%g6,	%o1,	%g4
	orncc	%i2,	0x073F,	%g5
	ta	%icc,	0x2
	brgez	%l3,	loop_727
	smul	%i0,	%l6,	%o3
	ldd	[%l7 + 0x78],	%o6
	sdivx	%o2,	0x01C5,	%o4
loop_727:
	movn	%xcc,	%i6,	%g1
	fpadd16	%f12,	%f10,	%f10
	orn	%o5,	0x0E1D,	%o6
	fsrc2s	%f15,	%f15
	smulcc	%g2,	0x0329,	%i5
	movgu	%icc,	%i4,	%i3
	mova	%xcc,	%l4,	%o0
	xnor	%l2,	0x1A9F,	%l0
	fmovdpos	%icc,	%f8,	%f20
	fmovsne	%xcc,	%f9,	%f14
	xnorcc	%g3,	%i7,	%g7
	addccc	%l5,	%i1,	%g6
	fxnor	%f22,	%f8,	%f6
	set	0x78, %g4
	ldsha	[%l7 + %g4] 0x18,	%l1
	fbn	%fcc2,	loop_728
	std	%g4,	[%l7 + 0x40]
	set	0x40, %i6
	stda	%i2,	[%l7 + %i6] 0x2b
	membar	#Sync
loop_728:
	fcmpgt16	%f20,	%f30,	%o1
	addcc	%l3,	%g5,	%i0
	te	%xcc,	0x0
	fmovsvs	%icc,	%f11,	%f17
	fmovda	%xcc,	%f29,	%f10
	ba,pt	%xcc,	loop_729
	add	%l6,	0x0630,	%o7
	xor	%o2,	0x1718,	%o4
	fbuge,a	%fcc1,	loop_730
loop_729:
	fbl,a	%fcc3,	loop_731
	movn	%xcc,	%i6,	%o3
	fpadd32	%f6,	%f22,	%f30
loop_730:
	edge16	%g1,	%o5,	%o6
loop_731:
	tl	%xcc,	0x3
	fandnot1	%f18,	%f10,	%f26
	udivx	%g2,	0x139D,	%i4
	fpadd32s	%f29,	%f27,	%f17
	fbul,a	%fcc2,	loop_732
	movleu	%icc,	%i5,	%i3
	tcc	%icc,	0x0
	fpsub16	%f28,	%f4,	%f4
loop_732:
	fbug	%fcc3,	loop_733
	ta	%xcc,	0x5
	fmovdn	%xcc,	%f25,	%f9
	fnors	%f7,	%f17,	%f15
loop_733:
	tcs	%xcc,	0x0
	tne	%xcc,	0x2
	udiv	%o0,	0x0294,	%l4
	alignaddrl	%l2,	%l0,	%g3
	sir	0x1305
	smul	%i7,	0x0719,	%g7
	fmovdneg	%xcc,	%f2,	%f26
	xnorcc	%l5,	0x17FA,	%g6
	umul	%i1,	%g4,	%l1
	movrlz	%i2,	0x0A5,	%l3
	mova	%xcc,	%o1,	%g5
	array32	%l6,	%i0,	%o2
	set	0x4E, %g1
	ldstuba	[%l7 + %g1] 0x0c,	%o4
	fmovdcs	%icc,	%f6,	%f3
	bg,a	%icc,	loop_734
	bvc	%icc,	loop_735
	andn	%o7,	%i6,	%o3
	brlez,a	%o5,	loop_736
loop_734:
	fmovde	%xcc,	%f9,	%f30
loop_735:
	fnegd	%f0,	%f8
	edge32l	%o6,	%g2,	%i4
loop_736:
	fcmpeq16	%f10,	%f4,	%i5
	bpos,pn	%icc,	loop_737
	fcmpeq16	%f30,	%f4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_738,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_737:
	fabss	%f0,	%f1
	fmovda	%xcc,	%f26,	%f9
	sethi	0x1774,	%i3
loop_738:
	tle	%icc,	0x4
	movrne	%l4,	%o0,	%l0
	tle	%icc,	0x4
	edge32l	%l2,	%g3,	%g7
	fpack16	%f14,	%f25
	or	%i7,	0x1EDC,	%l5
	subc	%i1,	%g6,	%l1
	orncc	%i2,	0x1B6F,	%l3
	fba	%fcc1,	loop_739
	xnorcc	%g4,	%g5,	%o1
	sethi	0x13BC,	%i0
	popc	%l6,	%o4
loop_739:
	sdivcc	%o2,	0x0EA1,	%o7
	xorcc	%o3,	%i6,	%o6
	movcc	%xcc,	%g2,	%o5
	tcs	%icc,	0x4
	ble,pt	%xcc,	loop_740
	alignaddr	%i5,	%i4,	%i3
	movcc	%xcc,	%g1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_740:
	tcc	%icc,	0x6
	fmovd	%f14,	%f2
	tpos	%icc,	0x0
	srax	%l4,	0x08,	%l2
	ldsw	[%l7 + 0x60],	%g3
	bvc	%icc,	loop_741
	or	%g7,	0x0390,	%l0
	tcc	%xcc,	0x2
	popc	0x1BFB,	%i7
loop_741:
	movleu	%xcc,	%l5,	%i1
	sth	%l1,	[%l7 + 0x1A]
	fands	%f21,	%f18,	%f12
	add	%g6,	%l3,	%g4
	fnegs	%f15,	%f25
	fmovsvs	%xcc,	%f0,	%f23
	addcc	%g5,	%i2,	%i0
	addcc	%o1,	%o4,	%l6
	and	%o2,	0x1B76,	%o3
	fcmps	%fcc3,	%f15,	%f5
	movrlz	%i6,	%o6,	%g2
	xor	%o5,	%o7,	%i4
	edge8	%i5,	%i3,	%g1
	bvc,pn	%xcc,	loop_742
	array8	%o0,	%l4,	%g3
	umul	%g7,	%l0,	%l2
	move	%icc,	%l5,	%i1
loop_742:
	fsrc2s	%f3,	%f27
	std	%l0,	[%l7 + 0x58]
	andcc	%g6,	%i7,	%g4
	tg	%icc,	0x7
	tge	%xcc,	0x0
	set	0x18, %l4
	ldsba	[%l7 + %l4] 0x04,	%g5
	movvs	%icc,	%l3,	%i0
	movrlz	%o1,	%o4,	%i2
	move	%xcc,	%o2,	%l6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4B] %asi,	%o3
	fmovsle	%icc,	%f19,	%f11
	udivx	%o6,	0x0BD1,	%i6
	flush	%l7 + 0x74
	umulcc	%o5,	0x09DF,	%o7
	set	0x38, %o2
	stxa	%g2,	[%g0 + %o2] 0x4f
	umul	%i4,	%i3,	%i5
	sdivx	%g1,	0x1103,	%o0
	movcs	%xcc,	%l4,	%g7
	andn	%l0,	%g3,	%l2
	fmovsl	%icc,	%f16,	%f9
	edge8	%l5,	%l1,	%g6
	ldstub	[%l7 + 0x1D],	%i7
	fmovdleu	%icc,	%f31,	%f20
	smul	%g4,	%g5,	%l3
	subc	%i1,	%o1,	%o4
	sub	%i0,	0x1DF7,	%i2
	edge8	%o2,	%l6,	%o6
	edge8l	%o3,	%o5,	%o7
	mulx	%i6,	%g2,	%i3
	movrgz	%i5,	%i4,	%o0
	sra	%g1,	0x00,	%l4
	brlz	%g7,	loop_743
	xor	%l0,	%g3,	%l5
	taddcctv	%l1,	0x1379,	%l2
	srlx	%g6,	%g4,	%g5
loop_743:
	orn	%i7,	0x165E,	%l3
	mova	%xcc,	%o1,	%i1
	smul	%i0,	%i2,	%o4
	st	%f19,	[%l7 + 0x14]
	ldd	[%l7 + 0x70],	%i6
	ldsh	[%l7 + 0x74],	%o6
	sethi	0x0A41,	%o2
	edge16ln	%o5,	%o7,	%i6
	add	%o3,	%g2,	%i3
	movrgz	%i5,	0x132,	%i4
	brgez	%o0,	loop_744
	xor	%l4,	%g1,	%l0
	sdivcc	%g7,	0x1C1D,	%g3
	stbar
loop_744:
	nop
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x89,	 0x1
	srlx	%l5,	0x1A,	%g6
	sth	%l2,	[%l7 + 0x18]
	bge	loop_745
	fmul8ulx16	%f16,	%f8,	%f4
	tsubcc	%g5,	%g4,	%l3
	std	%f10,	[%l7 + 0x30]
loop_745:
	sra	%i7,	0x19,	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%i2
	fba,a	%fcc0,	loop_746
	fmovrslz	%i1,	%f23,	%f22
	ldd	[%l7 + 0x30],	%f14
	tsubcctv	%l6,	0x07C5,	%o4
loop_746:
	fcmpgt32	%f30,	%f30,	%o2
	movrlez	%o6,	0x049,	%o7
	subccc	%i6,	0x1D95,	%o5
	smulcc	%o3,	0x022D,	%g2
	tcs	%icc,	0x4
	fbu	%fcc2,	loop_747
	movre	%i3,	0x017,	%i5
	movg	%icc,	%i4,	%o0
	movcc	%xcc,	%g1,	%l0
loop_747:
	fmovda	%icc,	%f20,	%f11
	udivcc	%g7,	0x06F7,	%g3
	smul	%l1,	0x00E4,	%l5
	fmovrslez	%g6,	%f5,	%f15
	addccc	%l2,	0x0B9E,	%l4
	edge16	%g4,	%g5,	%l3
	fmuld8ulx16	%f24,	%f2,	%f20
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i7
	umul	%i0,	0x110F,	%o1
	smul	%i2,	0x03B4,	%i1
	fmovsleu	%xcc,	%f22,	%f20
	fnot1	%f18,	%f12
	fnegs	%f3,	%f2
	tcc	%icc,	0x0
	fbug	%fcc1,	loop_748
	fmuld8sux16	%f3,	%f4,	%f30
	fmovdle	%xcc,	%f29,	%f29
	movrlz	%l6,	%o4,	%o6
loop_748:
	movge	%xcc,	%o7,	%i6
	orn	%o5,	%o3,	%o2
	edge32n	%g2,	%i5,	%i4
	set	0x6C, %o0
	swapa	[%l7 + %o0] 0x10,	%o0
	fcmps	%fcc2,	%f28,	%f11
	subc	%g1,	0x154B,	%i3
	movleu	%icc,	%g7,	%l0
	fmovrde	%g3,	%f30,	%f4
	movrlz	%l1,	0x219,	%l5
	tsubcctv	%l2,	%l4,	%g6
	tge	%xcc,	0x1
	ldsh	[%l7 + 0x38],	%g4
	movpos	%xcc,	%g5,	%l3
	tvs	%xcc,	0x5
	fbul,a	%fcc0,	loop_749
	xorcc	%i7,	0x1BB3,	%o1
	movgu	%icc,	%i0,	%i1
	add	%l6,	%i2,	%o6
loop_749:
	tl	%icc,	0x6
	fmovrdne	%o4,	%f30,	%f18
	tgu	%xcc,	0x3
	edge32n	%o7,	%i6,	%o5
	tpos	%xcc,	0x0
	orcc	%o3,	%o2,	%g2
	fmul8x16al	%f7,	%f17,	%f4
	ld	[%l7 + 0x7C],	%f1
	fpsub32s	%f7,	%f13,	%f22
	xor	%i4,	%o0,	%g1
	xor	%i5,	%g7,	%l0
	fmuld8ulx16	%f22,	%f3,	%f22
	xorcc	%i3,	%g3,	%l1
	fmul8x16au	%f11,	%f28,	%f16
	tn	%icc,	0x4
	fxor	%f18,	%f24,	%f8
	addccc	%l5,	0x1B2B,	%l4
	tn	%icc,	0x1
	edge16n	%g6,	%l2,	%g4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	movge	%icc,	%l3,	%o1
	bpos,a	%icc,	loop_750
	fbo,a	%fcc3,	loop_751
	alignaddr	%i0,	%i1,	%i7
	std	%f28,	[%l7 + 0x40]
loop_750:
	fxnors	%f12,	%f29,	%f26
loop_751:
	mulx	%l6,	%i2,	%o4
	brz	%o6,	loop_752
	fcmpne32	%f0,	%f16,	%i6
	fnegs	%f30,	%f9
	edge16n	%o5,	%o7,	%o3
loop_752:
	andcc	%g2,	0x0FB2,	%i4
	set	0x74, %g5
	lda	[%l7 + %g5] 0x81,	%f29
	set	0x80, %l5
	ldxa	[%g0 + %l5] 0x58,	%o2
	movrgez	%g1,	%o0,	%g7
	fble,a	%fcc0,	loop_753
	xor	%l0,	0x1450,	%i3
	fmovdne	%icc,	%f30,	%f27
	edge32	%i5,	%g3,	%l1
loop_753:
	orcc	%l5,	0x0BAA,	%l4
	orn	%g6,	%l2,	%g4
	xnor	%l3,	%o1,	%i0
	sethi	0x1B5C,	%g5
	fmul8x16al	%f9,	%f11,	%f20
	movvc	%icc,	%i1,	%l6
	umulcc	%i2,	%i7,	%o4
	fbule,a	%fcc1,	loop_754
	sdivcc	%o6,	0x0895,	%i6
	edge8n	%o7,	%o5,	%o3
	fmovdneg	%xcc,	%f14,	%f12
loop_754:
	brz	%g2,	loop_755
	move	%icc,	%i4,	%o2
	movrgez	%g1,	%g7,	%o0
	fbn,a	%fcc1,	loop_756
loop_755:
	subc	%l0,	0x0E03,	%i3
	bpos,pn	%xcc,	loop_757
	mulx	%i5,	0x06C9,	%g3
loop_756:
	nop
	setx	loop_758,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_759
loop_757:
	lduh	[%l7 + 0x74],	%l1
	set	0x2C, %i1
	stwa	%l5,	[%l7 + %i1] 0x15
loop_758:
	nop
	set	0x58, %g2
	stda	%g6,	[%l7 + %g2] 0x80
loop_759:
	ldsw	[%l7 + 0x0C],	%l4
	fmovdleu	%xcc,	%f18,	%f28
	fmovdvc	%xcc,	%f3,	%f4
	or	%l2,	0x1257,	%g4
	fnor	%f4,	%f30,	%f14
	fmovsa	%icc,	%f31,	%f0
	tle	%icc,	0x7
	fxors	%f31,	%f19,	%f6
	fsrc1	%f16,	%f10
	swap	[%l7 + 0x08],	%l3
	fmovspos	%icc,	%f18,	%f7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x1C] %asi,	%i0
	tn	%icc,	0x5
	subcc	%g5,	%i1,	%o1
	movrgz	%i2,	0x296,	%i7
	fmul8ulx16	%f12,	%f20,	%f10
	movrgez	%l6,	0x101,	%o6
	fbule,a	%fcc0,	loop_760
	fbue	%fcc1,	loop_761
	fmovrsgez	%i6,	%f11,	%f18
	fmovdvs	%icc,	%f29,	%f16
loop_760:
	smulcc	%o4,	%o7,	%o3
loop_761:
	udivx	%g2,	0x0D4F,	%i4
	movle	%xcc,	%o2,	%o5
	fzeros	%f28
	fpack16	%f24,	%f10
	fpsub32	%f22,	%f24,	%f6
	fsrc1s	%f25,	%f31
	set	0x20, %i7
	stda	%g6,	[%l7 + %i7] 0x15
	udivcc	%o0,	0x184E,	%g1
	stw	%l0,	[%l7 + 0x40]
	sllx	%i3,	%i5,	%l1
	fcmpne32	%f0,	%f18,	%l5
	ldsb	[%l7 + 0x3B],	%g6
	fmovrdne	%g3,	%f16,	%f28
	movvc	%icc,	%l2,	%g4
	fcmpgt32	%f26,	%f24,	%l3
	taddcctv	%i0,	%l4,	%i1
	andcc	%o1,	%i2,	%i7
	edge8n	%l6,	%g5,	%i6
	fandnot1s	%f9,	%f17,	%f27
	ta	%xcc,	0x7
	call	loop_762
	fmovrdgez	%o6,	%f26,	%f4
	bneg	loop_763
	fbuge,a	%fcc1,	loop_764
loop_762:
	fands	%f13,	%f15,	%f20
	call	loop_765
loop_763:
	fpadd32s	%f29,	%f7,	%f12
loop_764:
	ldsh	[%l7 + 0x2E],	%o4
	tvs	%icc,	0x4
loop_765:
	fmovsge	%xcc,	%f21,	%f25
	ldd	[%l7 + 0x68],	%f20
	fcmple32	%f30,	%f10,	%o3
	movne	%icc,	%o7,	%g2
	addcc	%i4,	%o2,	%o5
	fbl	%fcc0,	loop_766
	edge16n	%g7,	%o0,	%g1
	add	%l0,	0x0CC4,	%i3
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0x1
loop_766:
	fmovdle	%xcc,	%f16,	%f16
	set	0x28, %g7
	stxa	%i5,	[%l7 + %g7] 0x80
	tg	%icc,	0x4
	fmovsvc	%icc,	%f18,	%f23
	fcmpgt32	%f28,	%f8,	%g6
	bpos,pn	%icc,	loop_767
	movrgez	%g3,	0x3EF,	%l5
	fpadd32	%f20,	%f0,	%f4
	stx	%l2,	[%l7 + 0x48]
loop_767:
	sir	0x1B61
	fcmpd	%fcc3,	%f14,	%f0
	brgez,a	%l3,	loop_768
	tgu	%xcc,	0x5
	nop
	setx	loop_769,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsne	%icc,	%f8,	%f15
loop_768:
	popc	%g4,	%i0
	brlz	%l4,	loop_770
loop_769:
	fandnot2	%f0,	%f2,	%f10
	tsubcctv	%o1,	%i1,	%i7
	alignaddr	%l6,	%g5,	%i2
loop_770:
	bge,pt	%icc,	loop_771
	fblg	%fcc1,	loop_772
	edge16ln	%i6,	%o4,	%o3
	te	%xcc,	0x6
loop_771:
	fmovsvs	%icc,	%f27,	%f1
loop_772:
	xnorcc	%o7,	0x0733,	%g2
	srl	%o6,	0x06,	%o2
	set	0x2C, %i5
	ldswa	[%l7 + %i5] 0x18,	%i4
	stb	%o5,	[%l7 + 0x13]
	tne	%icc,	0x3
	udiv	%g7,	0x0C39,	%o0
	fandnot1	%f0,	%f24,	%f18
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x38] %asi,	%f26
	fmovs	%f29,	%f4
	tl	%xcc,	0x1
	fmul8x16au	%f2,	%f17,	%f2
	movneg	%icc,	%l0,	%g1
	ldsw	[%l7 + 0x24],	%l1
	fornot1s	%f26,	%f9,	%f14
	brlez,a	%i5,	loop_773
	alignaddrl	%i3,	%g3,	%l5
	fbo,a	%fcc3,	loop_774
	edge8ln	%g6,	%l3,	%g4
loop_773:
	be,pt	%icc,	loop_775
	edge8n	%i0,	%l2,	%l4
loop_774:
	tg	%icc,	0x2
	fpackfix	%f28,	%f2
loop_775:
	array16	%i1,	%i7,	%o1
	lduw	[%l7 + 0x44],	%g5
	orncc	%l6,	%i2,	%i6
	movgu	%icc,	%o4,	%o3
	bne,a,pn	%xcc,	loop_776
	subc	%o7,	%g2,	%o6
	fbul	%fcc2,	loop_777
	tg	%xcc,	0x6
loop_776:
	fandnot2s	%f3,	%f10,	%f0
	fpsub16s	%f25,	%f19,	%f19
loop_777:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x4
	fmovrse	%i4,	%f24,	%f1
	st	%f6,	[%l7 + 0x14]
	tle	%icc,	0x0
	movvs	%icc,	%o5,	%g7
	alignaddrl	%o2,	%o0,	%l0
	andcc	%l1,	%i5,	%i3
	fpadd32	%f20,	%f6,	%f18
	fpsub32	%f8,	%f10,	%f28
	tcs	%icc,	0x5
	smulcc	%g3,	%g1,	%l5
	fmovdge	%xcc,	%f21,	%f8
	st	%f1,	[%l7 + 0x78]
	addccc	%l3,	0x130A,	%g6
	sth	%g4,	[%l7 + 0x3E]
	tn	%icc,	0x0
	udiv	%i0,	0x1824,	%l4
	movrlez	%i1,	0x071,	%i7
	addccc	%l2,	0x0E14,	%g5
	umulcc	%o1,	0x1A55,	%i2
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	ldsb	[%l7 + 0x29],	%i6
	ldsb	[%l7 + 0x5D],	%o4
	sdivcc	%l6,	0x1818,	%o3
	wr	%g0,	0xe2,	%asi
	stwa	%g2,	[%l7 + 0x68] %asi
	membar	#Sync
	edge8ln	%o6,	%i4,	%o5
	xnorcc	%g7,	%o7,	%o2
	fmovdvc	%xcc,	%f6,	%f8
	tle	%icc,	0x6
	edge8	%o0,	%l0,	%l1
	std	%f2,	[%l7 + 0x58]
	tpos	%icc,	0x3
	fnot2s	%f23,	%f28
	tcc	%icc,	0x4
	fmovde	%icc,	%f24,	%f9
	sdivcc	%i3,	0x1497,	%i5
	tgu	%icc,	0x1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x10,	%g3,	%l5
	siam	0x3
	edge8l	%l3,	%g6,	%g4
	movleu	%xcc,	%g1,	%i0
	sdiv	%i1,	0x0417,	%i7
	nop
	setx loop_778, %l0, %l1
	jmpl %l1, %l2
	movg	%xcc,	%l4,	%g5
	tvc	%xcc,	0x0
	bne,a,pt	%icc,	loop_779
loop_778:
	xnor	%o1,	0x0852,	%i2
	brz	%i6,	loop_780
	tg	%xcc,	0x1
loop_779:
	andncc	%l6,	%o3,	%o4
	umulcc	%o6,	%i4,	%g2
loop_780:
	fbug,a	%fcc2,	loop_781
	for	%f30,	%f2,	%f8
	fmovrsgz	%g7,	%f12,	%f18
	subcc	%o5,	%o2,	%o0
loop_781:
	sir	0x0299
	faligndata	%f16,	%f14,	%f18
	movrlez	%o7,	%l0,	%l1
	tneg	%icc,	0x6
	movrne	%i5,	0x163,	%i3
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x04
	sir	0x1113
	andncc	%g3,	%l5,	%g6
	movne	%xcc,	%l3,	%g1
	fbo,a	%fcc3,	loop_782
	tsubcc	%i0,	%g4,	%i7
	fmovdg	%icc,	%f31,	%f25
	andn	%i1,	%l4,	%g5
loop_782:
	ble,a	%icc,	loop_783
	array32	%o1,	%i2,	%i6
	fcmpes	%fcc0,	%f8,	%f9
	fmovrdlz	%l2,	%f8,	%f30
loop_783:
	fornot1	%f12,	%f28,	%f28
	movl	%icc,	%l6,	%o3
	tpos	%icc,	0x5
	call	loop_784
	tvc	%xcc,	0x0
	bpos,a,pn	%xcc,	loop_785
	fbule,a	%fcc0,	loop_786
loop_784:
	fbne,a	%fcc3,	loop_787
	fandnot1	%f14,	%f2,	%f18
loop_785:
	bshuffle	%f8,	%f14,	%f22
loop_786:
	mulx	%o4,	%o6,	%g2
loop_787:
	sdiv	%g7,	0x1ECA,	%i4
	orcc	%o2,	0x01A9,	%o0
	subcc	%o5,	%o7,	%l0
	edge32ln	%i5,	%i3,	%g3
	fcmpgt32	%f6,	%f6,	%l5
	movgu	%xcc,	%g6,	%l3
	set	0x61, %o4
	lduba	[%l7 + %o4] 0x0c,	%l1
	tgu	%xcc,	0x6
	add	%g1,	0x0A45,	%i0
	smulcc	%g4,	0x1BF3,	%i1
	fcmps	%fcc1,	%f8,	%f26
	stb	%i7,	[%l7 + 0x59]
	fandnot2	%f26,	%f12,	%f8
	tl	%icc,	0x6
	st	%f6,	[%l7 + 0x4C]
	fmuld8sux16	%f9,	%f4,	%f10
	movpos	%xcc,	%g5,	%o1
	udivcc	%l4,	0x1E45,	%i6
	tgu	%xcc,	0x4
	addcc	%l2,	0x052B,	%l6
	xnorcc	%i2,	0x0CA5,	%o3
	bvs,pt	%icc,	loop_788
	prefetch	[%l7 + 0x34],	 0x1
	orncc	%o4,	%o6,	%g7
	or	%i4,	0x1BBB,	%o2
loop_788:
	fbn	%fcc3,	loop_789
	bshuffle	%f26,	%f14,	%f28
	subcc	%g2,	0x049A,	%o0
	srl	%o5,	%o7,	%i5
loop_789:
	fbul	%fcc3,	loop_790
	tge	%icc,	0x0
	movrne	%i3,	%g3,	%l5
	tl	%icc,	0x3
loop_790:
	fornot1	%f22,	%f0,	%f26
	ldd	[%l7 + 0x18],	%g6
	fbo	%fcc2,	loop_791
	sth	%l0,	[%l7 + 0x6E]
	brlz,a	%l3,	loop_792
	srlx	%g1,	%i0,	%l1
loop_791:
	xnor	%i1,	0x1DF2,	%i7
	nop
	setx	loop_793,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_792:
	tne	%xcc,	0x6
	fbne,a	%fcc3,	loop_794
	movvc	%xcc,	%g5,	%o1
loop_793:
	alignaddrl	%l4,	%i6,	%l2
	fmul8x16au	%f2,	%f25,	%f0
loop_794:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l6,	%g4
	movleu	%xcc,	%i2,	%o3
	fbl	%fcc2,	loop_795
	xorcc	%o4,	0x0D05,	%o6
	fnor	%f12,	%f14,	%f2
	fcmple32	%f18,	%f24,	%i4
loop_795:
	movrne	%o2,	0x194,	%g2
	pdist	%f6,	%f24,	%f14
	prefetch	[%l7 + 0x6C],	 0x0
	xnorcc	%o0,	%o5,	%o7
	andcc	%i5,	0x1620,	%g7
	tvc	%icc,	0x4
	movge	%icc,	%g3,	%i3
	faligndata	%f0,	%f16,	%f28
	movg	%xcc,	%l5,	%l0
	fmovdpos	%xcc,	%f6,	%f25
	brgez	%g6,	loop_796
	fpack16	%f26,	%f29
	te	%icc,	0x5
	fbuge	%fcc2,	loop_797
loop_796:
	edge32n	%g1,	%i0,	%l3
	membar	0x22
	fpadd32s	%f27,	%f20,	%f12
loop_797:
	tneg	%icc,	0x7
	set	0x4C, %i4
	ldswa	[%l7 + %i4] 0x18,	%i1
	tneg	%icc,	0x2
	fbge,a	%fcc2,	loop_798
	movrlez	%l1,	0x193,	%g5
	add	%i7,	%o1,	%i6
	subc	%l2,	%l4,	%g4
loop_798:
	fbul	%fcc1,	loop_799
	tcc	%icc,	0x7
	fsrc2	%f18,	%f4
	bcs	%icc,	loop_800
loop_799:
	and	%l6,	%o3,	%o4
	sethi	0x1A47,	%i2
	fmovrslz	%o6,	%f7,	%f22
loop_800:
	srlx	%i4,	0x06,	%o2
	fcmple16	%f24,	%f24,	%g2
	xorcc	%o0,	%o5,	%i5
	fmovdle	%icc,	%f18,	%f5
	fpsub16	%f16,	%f18,	%f20
	lduh	[%l7 + 0x18],	%g7
	fmovd	%f14,	%f14
	movcc	%xcc,	%o7,	%i3
	mova	%icc,	%g3,	%l0
	nop
	setx loop_801, %l0, %l1
	jmpl %l1, %l5
	fcmpeq16	%f8,	%f10,	%g1
	andn	%i0,	%g6,	%i1
	tneg	%xcc,	0x0
loop_801:
	fnand	%f2,	%f22,	%f24
	movrne	%l1,	%g5,	%l3
	ldstub	[%l7 + 0x7A],	%i7
	smulcc	%i6,	%l2,	%l4
	sdivcc	%g4,	0x0CE7,	%o1
	fmovsg	%icc,	%f17,	%f1
	movvs	%xcc,	%o3,	%o4
	fmovspos	%xcc,	%f17,	%f7
	fmovrdne	%l6,	%f20,	%f16
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x14] %asi,	%i2
	set	0x1A, %o3
	stha	%o6,	[%l7 + %o3] 0x04
	movrne	%o2,	0x1CF,	%i4
	tcc	%xcc,	0x0
	fnot2	%f4,	%f14
	fbuge	%fcc3,	loop_802
	fbne	%fcc0,	loop_803
	fbug,a	%fcc1,	loop_804
	mulx	%g2,	%o0,	%i5
loop_802:
	sllx	%g7,	%o5,	%i3
loop_803:
	fmovdge	%xcc,	%f5,	%f15
loop_804:
	orn	%o7,	%l0,	%g3
	fornot2	%f24,	%f16,	%f28
	edge16l	%l5,	%g1,	%g6
	set	0x40, %i2
	lduwa	[%l7 + %i2] 0x19,	%i1
	ld	[%l7 + 0x4C],	%f13
	mova	%icc,	%l1,	%g5
	edge32	%l3,	%i7,	%i6
	fbul	%fcc0,	loop_805
	fbul	%fcc1,	loop_806
	edge32ln	%l2,	%i0,	%g4
	sethi	0x0AF4,	%o1
loop_805:
	orn	%l4,	%o4,	%l6
loop_806:
	sll	%o3,	%i2,	%o6
	fmovdneg	%icc,	%f29,	%f19
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x04,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x54, %i0
	ldsw	[%l7 + %i0],	%g2
	set	0x1A, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o0
	movvc	%xcc,	%o2,	%g7
	fpsub16s	%f11,	%f7,	%f4
	stw	%i5,	[%l7 + 0x3C]
	edge8	%i3,	%o7,	%o5
	or	%g3,	0x1DC8,	%l0
	fmovdcs	%icc,	%f3,	%f15
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f14
	bne,a	%icc,	loop_807
	bl	loop_808
	fsrc2s	%f7,	%f19
	tpos	%xcc,	0x7
loop_807:
	udivcc	%l5,	0x1AFE,	%g6
loop_808:
	tn	%xcc,	0x2
	fnor	%f20,	%f8,	%f0
	sethi	0x0AC9,	%i1
	movl	%xcc,	%g1,	%g5
	fpsub16	%f2,	%f2,	%f4
	movre	%l1,	%l3,	%i6
	bshuffle	%f24,	%f22,	%f18
	bgu,a,pt	%xcc,	loop_809
	tcc	%icc,	0x7
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l2
loop_809:
	fmovrdgez	%i7,	%f18,	%f4
	andcc	%g4,	0x0ED9,	%o1
	movneg	%xcc,	%l4,	%o4
	tleu	%icc,	0x6
	fbg,a	%fcc3,	loop_810
	stb	%i0,	[%l7 + 0x20]
	fpmerge	%f12,	%f10,	%f20
	srl	%l6,	0x00,	%o3
loop_810:
	edge8n	%i2,	%i4,	%o6
	smulcc	%g2,	0x105E,	%o0
	fnot1	%f20,	%f22
	fbe,a	%fcc0,	loop_811
	movrgz	%o2,	0x2F9,	%i5
	tcs	%icc,	0x5
	xor	%g7,	%o7,	%o5
loop_811:
	movrgez	%i3,	0x198,	%l0
	set	0x18, %l6
	stba	%g3,	[%l7 + %l6] 0x19
	fblg,a	%fcc3,	loop_812
	movn	%xcc,	%g6,	%i1
	tl	%icc,	0x4
	tneg	%xcc,	0x7
loop_812:
	andn	%l5,	0x0C0F,	%g5
	srl	%l1,	0x1D,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l3,	%i6
	tn	%icc,	0x3
	movrgz	%l2,	0x11C,	%i7
	mulx	%g4,	0x1526,	%l4
	or	%o4,	%i0,	%l6
	edge8ln	%o3,	%o1,	%i2
	movpos	%icc,	%i4,	%g2
	fba	%fcc1,	loop_813
	edge32n	%o0,	%o6,	%o2
	smulcc	%g7,	0x0BEF,	%o7
	nop
	set	0x52, %l3
	lduh	[%l7 + %l3],	%o5
loop_813:
	tl	%xcc,	0x3
	subc	%i5,	%i3,	%g3
	prefetch	[%l7 + 0x54],	 0x1
	fcmple32	%f20,	%f2,	%l0
	srlx	%g6,	%l5,	%g5
	addc	%l1,	%i1,	%l3
	movleu	%xcc,	%g1,	%l2
	sdiv	%i6,	0x18A4,	%g4
	fbge	%fcc0,	loop_814
	edge16n	%i7,	%o4,	%l4
	movrlez	%l6,	%i0,	%o1
	fmovsg	%icc,	%f9,	%f15
loop_814:
	tleu	%icc,	0x7
	movrlez	%o3,	%i2,	%g2
	fmovdneg	%icc,	%f4,	%f11
	bvc,pn	%icc,	loop_815
	st	%f18,	[%l7 + 0x10]
	movre	%o0,	0x190,	%i4
	popc	0x0024,	%o6
loop_815:
	xnorcc	%g7,	%o7,	%o5
	move	%xcc,	%o2,	%i3
	xorcc	%i5,	0x1F8E,	%g3
	sdivx	%l0,	0x05A9,	%g6
	smulcc	%l5,	0x1FA5,	%l1
	bge,a,pn	%icc,	loop_816
	fcmpd	%fcc0,	%f30,	%f10
	srax	%g5,	%i1,	%g1
	ldx	[%l7 + 0x40],	%l3
loop_816:
	sra	%l2,	0x06,	%i6
	popc	0x0753,	%i7
	ldsh	[%l7 + 0x58],	%g4
	nop
	setx	loop_817,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%icc,	%l4,	%o4
	tcc	%xcc,	0x6
	fnot2	%f6,	%f10
loop_817:
	fpadd16	%f28,	%f8,	%f0
	movn	%icc,	%i0,	%l6
	sir	0x1A75
	subccc	%o1,	0x1844,	%i2
	ble,a	loop_818
	andn	%o3,	%o0,	%g2
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4C] %asi,	%i4
loop_818:
	umul	%o6,	0x1097,	%o7
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o5
	fmovdn	%icc,	%f28,	%f14
	movne	%xcc,	%g7,	%o2
	movpos	%icc,	%i3,	%i5
	fcmple16	%f8,	%f0,	%l0
	swap	[%l7 + 0x08],	%g3
	brlz,a	%g6,	loop_819
	srl	%l1,	0x18,	%l5
	srax	%g5,	%g1,	%l3
	ldub	[%l7 + 0x5F],	%l2
loop_819:
	ble,a,pn	%icc,	loop_820
	fmovda	%icc,	%f8,	%f23
	sdiv	%i1,	0x0B23,	%i7
	fbul	%fcc3,	loop_821
loop_820:
	movvs	%xcc,	%g4,	%l4
	bgu,a	loop_822
	sllx	%o4,	%i0,	%l6
loop_821:
	bvc	loop_823
	bg,pn	%xcc,	loop_824
loop_822:
	ta	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i6
loop_823:
	orn	%o1,	0x1D7B,	%i2
loop_824:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x38] %asi,	%o0
	taddcc	%g2,	%o3,	%i4
	fsrc1	%f22,	%f30
	tge	%icc,	0x3
	movneg	%icc,	%o7,	%o5
	umulcc	%o6,	0x1585,	%g7
	edge32l	%i3,	%o2,	%i5
	umul	%l0,	0x1002,	%g3
	call	loop_825
	andncc	%g6,	%l1,	%g5
	fbule	%fcc1,	loop_826
	sllx	%g1,	%l3,	%l2
loop_825:
	array8	%l5,	%i1,	%i7
	sdivcc	%g4,	0x0942,	%o4
loop_826:
	edge8l	%i0,	%l4,	%l6
	srl	%i6,	0x18,	%o1
	fpack16	%f30,	%f26
	nop
	setx loop_827, %l0, %l1
	jmpl %l1, %i2
	fpmerge	%f7,	%f12,	%f26
	fbg,a	%fcc2,	loop_828
	mova	%icc,	%o0,	%g2
loop_827:
	fmovdcs	%xcc,	%f17,	%f8
	fabss	%f16,	%f31
loop_828:
	ldsw	[%l7 + 0x08],	%o3
	movre	%i4,	%o5,	%o6
	smulcc	%g7,	%i3,	%o2
	tvs	%xcc,	0x0
	fpsub32	%f22,	%f22,	%f26
	st	%f0,	[%l7 + 0x74]
	edge32ln	%i5,	%o7,	%g3
	fcmpne16	%f28,	%f4,	%g6
	fmovrde	%l1,	%f0,	%f6
	subcc	%l0,	0x0547,	%g1
	fmovdvc	%icc,	%f4,	%f19
	membar	0x12
	fpadd32s	%f14,	%f3,	%f10
	fmovdge	%icc,	%f25,	%f8
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	flush	%l7 + 0x54
	movvc	%icc,	%l3,	%l5
	nop
	set	0x2C, %g6
	lduw	[%l7 + %g6],	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc3,	loop_829
	edge32ln	%i7,	%g4,	%i1
	sethi	0x1109,	%o4
	addcc	%l4,	%i0,	%l6
loop_829:
	brgz,a	%i6,	loop_830
	ldub	[%l7 + 0x5C],	%i2
	fnot1s	%f24,	%f21
	sra	%o0,	0x00,	%o1
loop_830:
	fandnot1s	%f23,	%f5,	%f6
	fbuge	%fcc1,	loop_831
	nop
	setx	loop_832,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x74],	%o3
	edge32n	%g2,	%i4,	%o5
loop_831:
	bcc,a	loop_833
loop_832:
	edge32l	%g7,	%i3,	%o6
	fpadd16s	%f13,	%f14,	%f4
	bg	loop_834
loop_833:
	fmovdg	%xcc,	%f12,	%f9
	movleu	%icc,	%o2,	%o7
	tpos	%xcc,	0x5
loop_834:
	fsrc2	%f2,	%f26
	movn	%icc,	%g3,	%i5
	edge16	%l1,	%l0,	%g6
	xnorcc	%g1,	%g5,	%l3
	movle	%xcc,	%l2,	%i7
	fmovrdlz	%g4,	%f28,	%f8
	addcc	%i1,	0x1504,	%o4
	subc	%l5,	%i0,	%l6
	fmovsle	%icc,	%f18,	%f25
	sra	%i6,	0x1E,	%i2
	tcc	%xcc,	0x2
	edge16n	%o0,	%o1,	%o3
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x89,	%g2
	nop
	setx	loop_835,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16n	%l4,	%o5,	%g7
	popc	0x167E,	%i4
	alignaddr	%o6,	%i3,	%o7
loop_835:
	brz,a	%g3,	loop_836
	fbg	%fcc1,	loop_837
	sir	0x0479
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_836:
	movcc	%xcc,	%i5,	%o2
loop_837:
	addc	%l0,	0x1AF7,	%g6
	move	%xcc,	%l1,	%g5
	fmovsle	%icc,	%f30,	%f12
	tle	%icc,	0x5
	bge	%icc,	loop_838
	tge	%xcc,	0x5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l2
loop_838:
	ldsh	[%l7 + 0x1A],	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g4,	%l3
	fbn	%fcc0,	loop_839
	edge16n	%o4,	%l5,	%i0
	move	%icc,	%l6,	%i6
	nop
	setx	loop_840,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_839:
	bgu,a	loop_841
	fmovdn	%xcc,	%f31,	%f8
	subc	%i2,	0x099E,	%i1
loop_840:
	tpos	%icc,	0x7
loop_841:
	fbule,a	%fcc2,	loop_842
	ta	%xcc,	0x2
	ta	%icc,	0x6
	bne	%icc,	loop_843
loop_842:
	movrlz	%o1,	0x0E7,	%o3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x34] %asi,	%g2
loop_843:
	srl	%l4,	0x0E,	%o5
	fbu,a	%fcc0,	loop_844
	ldsb	[%l7 + 0x4E],	%g7
	tcc	%icc,	0x1
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x16
	membar	#Sync
loop_844:
	sdivx	%o0,	0x0A81,	%o6
	sra	%i3,	%o7,	%i4
	fba	%fcc1,	loop_845
	addccc	%i5,	0x1FD9,	%o2
	fmovs	%f25,	%f2
	edge16n	%l0,	%g6,	%g3
loop_845:
	fnot1s	%f22,	%f6
	udiv	%g5,	0x1076,	%g1
	movgu	%icc,	%l1,	%l2
	sethi	0x0357,	%g4
	bcs,a,pt	%xcc,	loop_846
	movrlz	%i7,	%l3,	%o4
	movrlz	%i0,	%l6,	%l5
	movl	%icc,	%i2,	%i6
loop_846:
	array8	%i1,	%o1,	%o3
	movneg	%icc,	%g2,	%o5
	tge	%icc,	0x3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%g7
	fmuld8ulx16	%f5,	%f14,	%f0
	movcc	%icc,	%l4,	%o6
	fmovrslz	%i3,	%f15,	%f8
	edge32ln	%o0,	%i4,	%o7
	movleu	%icc,	%o2,	%l0
	fmovrdgez	%i5,	%f18,	%f18
	siam	0x7
	taddcc	%g6,	%g3,	%g5
	tleu	%xcc,	0x1
	lduh	[%l7 + 0x1E],	%l1
	tsubcctv	%g1,	0x0629,	%g4
	fblg,a	%fcc0,	loop_847
	bcs,pn	%xcc,	loop_848
	edge8	%i7,	%l3,	%l2
	bvs,a,pn	%xcc,	loop_849
loop_847:
	udiv	%i0,	0x14F5,	%o4
loop_848:
	movvc	%xcc,	%l6,	%i2
	subcc	%l5,	0x0EBB,	%i6
loop_849:
	movl	%icc,	%o1,	%o3
	fcmple16	%f22,	%f18,	%i1
	movrne	%g2,	%o5,	%g7
	fbn,a	%fcc0,	loop_850
	movge	%icc,	%l4,	%o6
	sir	0x18F8
	edge32l	%o0,	%i4,	%o7
loop_850:
	ta	%icc,	0x6
	te	%icc,	0x4
	stb	%i3,	[%l7 + 0x2F]
	fcmpgt32	%f30,	%f30,	%o2
	edge32	%l0,	%g6,	%i5
	udivcc	%g5,	0x0D73,	%g3
	bgu,a	%xcc,	loop_851
	movrlez	%l1,	%g1,	%i7
	brgez,a	%l3,	loop_852
	movvs	%icc,	%l2,	%g4
loop_851:
	array32	%o4,	%l6,	%i0
	orn	%i2,	%i6,	%l5
loop_852:
	nop
	set	0x40, %o1
	stwa	%o3,	[%l7 + %o1] 0x2a
	membar	#Sync
	xnorcc	%i1,	%o1,	%o5
	ta	%xcc,	0x4
	fxnors	%f17,	%f4,	%f11
	udivcc	%g2,	0x17E9,	%g7
	mova	%xcc,	%l4,	%o0
	fpadd16	%f10,	%f10,	%f8
	movrne	%i4,	%o7,	%i3
	sub	%o6,	%l0,	%o2
	stw	%g6,	[%l7 + 0x18]
	tge	%xcc,	0x6
	te	%xcc,	0x7
	udivcc	%g5,	0x03CF,	%g3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	array8	%g1,	%i7,	%i5
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x04,	%f16
	set	0x50, %g1
	swapa	[%l7 + %g1] 0x89,	%l2
	edge16n	%l3,	%o4,	%g4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%l6
	fone	%f28
	set	0x18, %l4
	sta	%f7,	[%l7 + %l4] 0x89
	addc	%i0,	0x1036,	%i6
	fbne	%fcc3,	loop_853
	sdiv	%l5,	0x1969,	%o3
	popc	%i1,	%o1
	tn	%xcc,	0x4
loop_853:
	movrgez	%o5,	%g2,	%g7
	fmovde	%xcc,	%f14,	%f11
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x48] %asi,	%l4
	movcs	%xcc,	%o0,	%i4
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x19,	%o6
	te	%xcc,	0x6
	fbg	%fcc0,	loop_854
	andn	%i2,	%o6,	%l0
	for	%f16,	%f2,	%f8
	subccc	%o2,	0x1544,	%g6
loop_854:
	movvc	%xcc,	%g5,	%i3
	mulx	%l1,	0x13A9,	%g3
	movrlz	%g1,	0x1C3,	%i5
	fmovsle	%icc,	%f3,	%f3
	tvc	%xcc,	0x7
	movneg	%icc,	%i7,	%l3
	tle	%xcc,	0x6
	tleu	%xcc,	0x5
	popc	0x007E,	%o4
	and	%l2,	0x0007,	%l6
	smulcc	%i0,	%i6,	%l5
	movre	%g4,	%i1,	%o3
	wr	%g0,	0x80,	%asi
	stda	%o0,	[%l7 + 0x48] %asi
	ldsw	[%l7 + 0x2C],	%g2
	fxnor	%f20,	%f18,	%f14
	orn	%o5,	0x1C43,	%l4
	ba,a,pt	%icc,	loop_855
	move	%xcc,	%g7,	%i4
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
loop_855:
	movpos	%icc,	%o0,	%i2
	fpadd16s	%f25,	%f28,	%f7
	popc	%l0,	%o2
	brz,a	%o6,	loop_856
	sethi	0x0675,	%g5
	edge8n	%i3,	%g6,	%g3
	xnorcc	%g1,	0x09C4,	%l1
loop_856:
	edge16n	%i5,	%i7,	%l3
	tgu	%icc,	0x5
	movge	%xcc,	%o4,	%l6
	udivcc	%l2,	0x0C55,	%i0
	movvc	%icc,	%i6,	%g4
	edge8ln	%i1,	%l5,	%o1
	movrlez	%o3,	0x346,	%o5
	edge32ln	%g2,	%g7,	%i4
	movne	%icc,	%l4,	%o0
	movge	%xcc,	%o7,	%i2
	fbug,a	%fcc3,	loop_857
	udivx	%o2,	0x0759,	%l0
	udivx	%o6,	0x0281,	%i3
	fnegs	%f17,	%f8
loop_857:
	edge32ln	%g6,	%g3,	%g1
	fandnot1s	%f28,	%f5,	%f9
	movn	%xcc,	%g5,	%l1
	sth	%i5,	[%l7 + 0x64]
	edge32n	%l3,	%o4,	%i7
	tle	%icc,	0x7
	fpadd32s	%f24,	%f6,	%f12
	bleu,a,pt	%xcc,	loop_858
	bpos,pn	%icc,	loop_859
	movcc	%xcc,	%l6,	%i0
	fmul8ulx16	%f12,	%f0,	%f20
loop_858:
	srlx	%i6,	%g4,	%i1
loop_859:
	fmul8ulx16	%f6,	%f20,	%f16
	movre	%l2,	0x33B,	%o1
	umulcc	%o3,	%l5,	%o5
	std	%g2,	[%l7 + 0x40]
	edge32	%g7,	%l4,	%i4
	movl	%icc,	%o0,	%o7
	taddcctv	%o2,	%l0,	%o6
	movvc	%icc,	%i2,	%i3
	fmovscs	%xcc,	%f9,	%f0
	fmovdl	%xcc,	%f24,	%f2
	edge8	%g6,	%g3,	%g1
	edge16l	%l1,	%i5,	%g5
	fnor	%f26,	%f22,	%f12
	udivx	%o4,	0x15EA,	%l3
	bleu,a	%icc,	loop_860
	movrlz	%l6,	%i0,	%i6
	sir	0x0EE6
	set	0x25, %o7
	ldsba	[%l7 + %o7] 0x19,	%i7
loop_860:
	fmovdcs	%icc,	%f28,	%f22
	fmovrsgez	%i1,	%f6,	%f16
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%l2
	fpadd16	%f4,	%f14,	%f22
	sllx	%o3,	%l5,	%o1
	ldsb	[%l7 + 0x75],	%o5
	fmovdn	%icc,	%f6,	%f21
	sll	%g2,	0x1A,	%g7
	orncc	%i4,	0x1358,	%o0
	fmul8x16	%f10,	%f10,	%f24
	movne	%icc,	%o7,	%o2
	set	0x78, %o0
	ldswa	[%l7 + %o0] 0x88,	%l0
	edge16n	%o6,	%i2,	%i3
	edge32	%g6,	%l4,	%g3
	umulcc	%l1,	0x0642,	%i5
	alignaddrl	%g5,	%o4,	%g1
	ldsw	[%l7 + 0x20],	%l3
	wr	%g0,	0xe2,	%asi
	stda	%i0,	[%l7 + 0x68] %asi
	membar	#Sync
	umulcc	%i6,	%i7,	%l6
	udiv	%i1,	0x0B0F,	%l2
	xnorcc	%g4,	%o3,	%l5
	tneg	%xcc,	0x5
	andcc	%o1,	0x1A52,	%o5
	fmovsn	%icc,	%f11,	%f30
	fbul	%fcc2,	loop_861
	movneg	%xcc,	%g7,	%i4
	nop
	set	0x64, %i6
	ldsh	[%l7 + %i6],	%o0
	movneg	%icc,	%g2,	%o2
loop_861:
	tne	%icc,	0x2
	sethi	0x020F,	%l0
	bcs,a,pn	%icc,	loop_862
	fbg	%fcc0,	loop_863
	tn	%xcc,	0x4
	fands	%f28,	%f11,	%f9
loop_862:
	alignaddrl	%o6,	%i2,	%o7
loop_863:
	call	loop_864
	nop
	setx	loop_865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%g6,	%i3,	%l4
	edge8	%g3,	%i5,	%g5
loop_864:
	fbge,a	%fcc0,	loop_866
loop_865:
	xnorcc	%o4,	0x10B1,	%g1
	stb	%l1,	[%l7 + 0x1F]
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l3
loop_866:
	tle	%xcc,	0x3
	brnz	%i0,	loop_867
	fbul,a	%fcc1,	loop_868
	alignaddr	%i7,	%i6,	%l6
	ta	%icc,	0x2
loop_867:
	movgu	%xcc,	%i1,	%l2
loop_868:
	fnegs	%f28,	%f28
	fbu	%fcc1,	loop_869
	tgu	%xcc,	0x5
	fmul8sux16	%f6,	%f24,	%f2
	or	%g4,	%l5,	%o1
loop_869:
	fbuge	%fcc0,	loop_870
	fandnot2	%f28,	%f2,	%f2
	andncc	%o3,	%o5,	%i4
	udiv	%o0,	0x0B8E,	%g2
loop_870:
	xor	%o2,	0x0F55,	%l0
	brnz	%o6,	loop_871
	bpos,a	%icc,	loop_872
	tsubcctv	%g7,	%i2,	%g6
	fpadd32	%f28,	%f6,	%f10
loop_871:
	fcmpes	%fcc3,	%f13,	%f10
loop_872:
	brlez,a	%o7,	loop_873
	orncc	%i3,	0x1298,	%g3
	alignaddrl	%l4,	%g5,	%i5
	bleu,a	%icc,	loop_874
loop_873:
	tcc	%icc,	0x4
	movne	%xcc,	%g1,	%o4
	srlx	%l1,	%i0,	%l3
loop_874:
	tsubcc	%i6,	%l6,	%i7
	addcc	%i1,	%l2,	%g4
	wr	%g0,	0x2f,	%asi
	stxa	%l5,	[%l7 + 0x20] %asi
	membar	#Sync
	edge32n	%o3,	%o1,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o0,	0x1A1E,	%g2
	fexpand	%f31,	%f16
	fmovrdlez	%o2,	%f0,	%f22
	tsubcc	%l0,	%o5,	%g7
	array32	%o6,	%g6,	%o7
	movrgz	%i3,	0x137,	%g3
	te	%icc,	0x0
	fbule,a	%fcc0,	loop_875
	array8	%l4,	%i2,	%g5
	popc	0x1BB2,	%g1
	xor	%i5,	0x003A,	%o4
loop_875:
	sdivcc	%l1,	0x008E,	%l3
	tgu	%xcc,	0x0
	edge32ln	%i0,	%l6,	%i7
	ba,pn	%xcc,	loop_876
	orcc	%i6,	0x066C,	%l2
	fxnor	%f12,	%f12,	%f8
	smulcc	%g4,	0x1FCA,	%i1
loop_876:
	bcc,a	%icc,	loop_877
	edge8l	%l5,	%o1,	%o3
	bpos,a	%icc,	loop_878
	umul	%o0,	0x1CA6,	%g2
loop_877:
	andcc	%o2,	0x1FD8,	%i4
	fors	%f31,	%f9,	%f12
loop_878:
	movleu	%icc,	%o5,	%l0
	ld	[%l7 + 0x34],	%f15
	array8	%g7,	%o6,	%o7
	edge8ln	%i3,	%g3,	%l4
	movrlz	%g6,	0x3B1,	%i2
	xor	%g1,	0x04F9,	%i5
	tsubcctv	%g5,	0x1D74,	%o4
	fbue,a	%fcc1,	loop_879
	fpadd32s	%f0,	%f9,	%f21
	ldsh	[%l7 + 0x1E],	%l3
	addccc	%l1,	%l6,	%i0
loop_879:
	fnor	%f6,	%f0,	%f26
	smulcc	%i7,	0x1438,	%l2
	pdist	%f20,	%f4,	%f26
	fbne,a	%fcc2,	loop_880
	edge8	%g4,	%i6,	%i1
	movcc	%icc,	%o1,	%o3
	ldsb	[%l7 + 0x6D],	%l5
loop_880:
	andcc	%g2,	0x0E8E,	%o2
	fmovsneg	%xcc,	%f25,	%f28
	fxnor	%f28,	%f30,	%f12
	set	0x13, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i4
	fornot2	%f16,	%f16,	%f8
	add	%o5,	0x12EF,	%l0
	edge16l	%o0,	%g7,	%o6
	addc	%i3,	0x0093,	%g3
	fpack16	%f6,	%f13
	edge32	%o7,	%l4,	%g6
	fpsub16s	%f6,	%f11,	%f13
	sir	0x0C3E
	andncc	%i2,	%g1,	%i5
	movne	%xcc,	%g5,	%o4
	for	%f0,	%f14,	%f8
	addc	%l3,	0x1994,	%l1
	movrgez	%l6,	%i0,	%l2
	fba,a	%fcc2,	loop_881
	movrgz	%i7,	%i6,	%g4
	siam	0x2
	bge,a,pt	%xcc,	loop_882
loop_881:
	add	%i1,	0x10B0,	%o3
	std	%o0,	[%l7 + 0x48]
	and	%l5,	%g2,	%i4
loop_882:
	ldsw	[%l7 + 0x30],	%o5
	fpadd16	%f28,	%f24,	%f28
	smulcc	%l0,	%o0,	%g7
	brnz	%o2,	loop_883
	mulx	%i3,	%g3,	%o6
	fmovrse	%l4,	%f11,	%f29
	mulx	%g6,	0x0F2E,	%o7
loop_883:
	fmovrdne	%i2,	%f30,	%f22
	set	0x20, %g5
	stha	%g1,	[%l7 + %g5] 0x22
	membar	#Sync
	smulcc	%i5,	0x073D,	%g5
	movge	%icc,	%o4,	%l3
	xnor	%l6,	0x0A3C,	%i0
	set	0x28, %g2
	stxa	%l2,	[%l7 + %g2] 0x22
	membar	#Sync
	fxnor	%f28,	%f2,	%f22
	movrlz	%i7,	%l1,	%g4
	te	%xcc,	0x6
	ldsb	[%l7 + 0x3C],	%i1
	movcs	%xcc,	%o3,	%i6
	orn	%o1,	0x0028,	%g2
	or	%l5,	%o5,	%i4
	tsubcc	%l0,	0x1B61,	%o0
	movrne	%g7,	0x294,	%i3
	fbue,a	%fcc1,	loop_884
	fpadd32s	%f23,	%f5,	%f6
	fmovda	%xcc,	%f7,	%f15
	movrgz	%g3,	0x397,	%o2
loop_884:
	fbg	%fcc0,	loop_885
	movleu	%xcc,	%o6,	%l4
	fmovse	%icc,	%f3,	%f21
	or	%g6,	%o7,	%g1
loop_885:
	sra	%i5,	0x0A,	%i2
	set	0x38, %i7
	stda	%g4,	[%l7 + %i7] 0x18
	bg	%icc,	loop_886
	fmul8sux16	%f22,	%f4,	%f14
	udivx	%o4,	0x0EF9,	%l3
	fabss	%f9,	%f7
loop_886:
	mulx	%l6,	0x0DBF,	%l2
	ldub	[%l7 + 0x25],	%i7
	call	loop_887
	fcmple32	%f6,	%f24,	%i0
	movrlez	%g4,	%i1,	%l1
	bpos,a	%xcc,	loop_888
loop_887:
	edge16ln	%o3,	%o1,	%g2
	fbo	%fcc0,	loop_889
	brlz	%l5,	loop_890
loop_888:
	fmovrdgez	%o5,	%f24,	%f6
	subcc	%i4,	%l0,	%i6
loop_889:
	fmovrse	%g7,	%f21,	%f13
loop_890:
	edge16	%i3,	%o0,	%g3
	te	%icc,	0x7
	movleu	%icc,	%o6,	%l4
	andcc	%g6,	%o7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i5,	0x17FA,	%i2
	fands	%f23,	%f22,	%f29
	orncc	%g5,	%o4,	%o2
	movge	%icc,	%l3,	%l2
	andn	%l6,	%i7,	%i0
	movne	%xcc,	%g4,	%l1
	movge	%icc,	%o3,	%o1
	bgu	%icc,	loop_891
	movgu	%icc,	%g2,	%l5
	edge16n	%o5,	%i1,	%l0
	array8	%i4,	%i6,	%g7
loop_891:
	srlx	%i3,	0x16,	%o0
	tpos	%xcc,	0x1
	fba	%fcc3,	loop_892
	tleu	%xcc,	0x5
	movleu	%xcc,	%g3,	%o6
	tneg	%icc,	0x2
loop_892:
	taddcctv	%g6,	0x1745,	%l4
	bcs,pt	%icc,	loop_893
	fcmpne16	%f8,	%f26,	%g1
	fabsd	%f22,	%f26
	wr	%g0,	0x81,	%asi
	stxa	%i5,	[%l7 + 0x50] %asi
loop_893:
	tpos	%xcc,	0x3
	xnorcc	%o7,	%g5,	%o4
	fabss	%f18,	%f14
	prefetch	[%l7 + 0x7C],	 0x3
	fmovdneg	%icc,	%f8,	%f5
	tneg	%xcc,	0x4
	swap	[%l7 + 0x64],	%i2
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 0x2
	movcs	%xcc,	%l3,	%o2
	xor	%l6,	0x132A,	%l2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x7D] %asi,	%i0
	subccc	%i7,	0x1C27,	%g4
	move	%xcc,	%l1,	%o3
	fcmpgt32	%f26,	%f12,	%o1
	mulx	%g2,	0x09CA,	%l5
	bvs,pt	%xcc,	loop_894
	movneg	%xcc,	%i1,	%l0
	ldub	[%l7 + 0x53],	%o5
	xnorcc	%i4,	%i6,	%g7
loop_894:
	tpos	%icc,	0x1
	tge	%xcc,	0x2
	sra	%o0,	0x00,	%g3
	fmovda	%icc,	%f17,	%f19
	tle	%icc,	0x6
	fbg,a	%fcc3,	loop_895
	subc	%o6,	0x0F9E,	%i3
	nop
	setx	loop_896,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpes	%fcc3,	%f28,	%f5
loop_895:
	sll	%l4,	0x0E,	%g6
	fbu	%fcc3,	loop_897
loop_896:
	smulcc	%g1,	0x0C2E,	%o7
	fornot1	%f14,	%f16,	%f14
	andcc	%i5,	0x18F0,	%g5
loop_897:
	fmovd	%f10,	%f26
	movrne	%i2,	0x0A3,	%l3
	or	%o2,	%o4,	%l2
	srax	%i0,	0x1B,	%l6
	fbu,a	%fcc1,	loop_898
	fornot2	%f24,	%f6,	%f22
	fmovdleu	%icc,	%f23,	%f16
	alignaddrl	%i7,	%l1,	%o3
loop_898:
	mulscc	%g4,	0x0887,	%o1
	edge8	%l5,	%i1,	%l0
	udivcc	%g2,	0x0F03,	%i4
	array16	%i6,	%o5,	%o0
	fcmpgt16	%f10,	%f22,	%g3
	movvs	%xcc,	%o6,	%i3
	be,pn	%icc,	loop_899
	udivx	%l4,	0x0575,	%g7
	movleu	%icc,	%g6,	%o7
	tvc	%icc,	0x4
loop_899:
	movvc	%xcc,	%i5,	%g5
	umulcc	%i2,	0x0AC5,	%l3
	st	%f30,	[%l7 + 0x78]
	movg	%xcc,	%o2,	%o4
	tsubcc	%l2,	%i0,	%l6
	udiv	%i7,	0x115D,	%g1
	brgez,a	%l1,	loop_900
	taddcc	%g4,	%o3,	%o1
	siam	0x2
	edge16n	%i1,	%l5,	%g2
loop_900:
	nop
	setx	loop_901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2	%f18,	%f8,	%f30
	mulx	%l0,	0x0282,	%i4
	movre	%i6,	%o0,	%o5
loop_901:
	udivx	%o6,	0x1607,	%g3
	edge32l	%i3,	%g7,	%l4
	tneg	%icc,	0x1
	bl,pn	%xcc,	loop_902
	fmuld8sux16	%f15,	%f28,	%f12
	udivx	%o7,	0x0950,	%g6
	mulscc	%g5,	0x061F,	%i5
loop_902:
	bn,pn	%xcc,	loop_903
	tl	%xcc,	0x6
	edge32n	%i2,	%o2,	%o4
	mulx	%l3,	%l2,	%l6
loop_903:
	fornot1	%f24,	%f16,	%f16
	fbne,a	%fcc3,	loop_904
	array8	%i7,	%g1,	%l1
	movle	%icc,	%g4,	%o3
	edge16	%i0,	%o1,	%l5
loop_904:
	nop
	setx loop_905, %l0, %l1
	jmpl %l1, %i1
	tsubcc	%g2,	0x131A,	%i4
	udiv	%l0,	0x0D41,	%i6
	edge16ln	%o5,	%o0,	%g3
loop_905:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a,pt	%icc,	loop_906
	addc	%o6,	0x0A9C,	%i3
	te	%xcc,	0x6
	taddcc	%g7,	0x10B7,	%l4
loop_906:
	alignaddr	%o7,	%g6,	%g5
	xorcc	%i5,	0x132C,	%o2
	xnorcc	%o4,	%i2,	%l3
	ldsb	[%l7 + 0x6D],	%l6
	fpadd32	%f14,	%f20,	%f12
	array32	%l2,	%i7,	%l1
	fmovdvs	%icc,	%f7,	%f3
	fxor	%f14,	%f20,	%f8
	fba,a	%fcc0,	loop_907
	udiv	%g1,	0x07FB,	%o3
	addcc	%i0,	%g4,	%o1
	sth	%i1,	[%l7 + 0x34]
loop_907:
	for	%f22,	%f14,	%f0
	tg	%xcc,	0x4
	srlx	%l5,	0x0B,	%g2
	array16	%i4,	%l0,	%i6
	fmuld8sux16	%f13,	%f27,	%f4
	fcmple32	%f12,	%f24,	%o0
	wr	%g0,	0x19,	%asi
	stwa	%g3,	[%l7 + 0x14] %asi
	set	0x0A, %l1
	lduha	[%l7 + %l1] 0x81,	%o6
	sdivcc	%i3,	0x1ACF,	%g7
	or	%l4,	0x1D7C,	%o5
	addc	%o7,	0x19E2,	%g5
	popc	%g6,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x0
	srax	%o2,	0x1B,	%i2
	fornot2	%f20,	%f0,	%f24
	movneg	%xcc,	%l3,	%o4
	edge16	%l6,	%l2,	%l1
	edge8l	%g1,	%o3,	%i0
	array32	%g4,	%o1,	%i1
	movrgz	%i7,	0x1B9,	%g2
	tcs	%xcc,	0x7
	set	0x3C, %i5
	lduwa	[%l7 + %i5] 0x89,	%i4
	and	%l5,	0x0D56,	%i6
	bn	%icc,	loop_908
	fnands	%f4,	%f21,	%f15
	fmovrdgez	%l0,	%f28,	%f8
	movge	%icc,	%o0,	%o6
loop_908:
	fblg,a	%fcc1,	loop_909
	fbe,a	%fcc1,	loop_910
	ta	%icc,	0x5
	edge32l	%g3,	%i3,	%g7
loop_909:
	tl	%icc,	0x1
loop_910:
	fcmpne32	%f2,	%f30,	%l4
	fblg,a	%fcc1,	loop_911
	fmovrdgez	%o5,	%f22,	%f0
	wr	%g0,	0x2b,	%asi
	stba	%o7,	[%l7 + 0x20] %asi
	membar	#Sync
loop_911:
	fbule,a	%fcc3,	loop_912
	fmovs	%f28,	%f25
	fmovd	%f4,	%f8
	tcs	%xcc,	0x3
loop_912:
	orn	%g6,	%i5,	%o2
	fcmpne16	%f12,	%f30,	%g5
	ldsh	[%l7 + 0x10],	%l3
	bneg,a,pt	%xcc,	loop_913
	tsubcc	%o4,	%l6,	%l2
	fbule,a	%fcc1,	loop_914
	smul	%l1,	0x1933,	%i2
loop_913:
	ldd	[%l7 + 0x58],	%g0
	fmovrsgz	%i0,	%f25,	%f25
loop_914:
	edge8n	%o3,	%g4,	%i1
	fble	%fcc2,	loop_915
	addcc	%o1,	%g2,	%i4
	tneg	%icc,	0x4
	ldd	[%l7 + 0x60],	%f22
loop_915:
	taddcc	%l5,	0x0324,	%i7
	edge16	%i6,	%l0,	%o6
	fmovdgu	%xcc,	%f28,	%f10
	tle	%icc,	0x2
	edge8ln	%o0,	%i3,	%g7
	wr	%g0,	0x2f,	%asi
	stha	%g3,	[%l7 + 0x08] %asi
	membar	#Sync
	fmul8x16	%f28,	%f16,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l4,	%o7
	bg,a,pt	%icc,	loop_916
	edge32l	%o5,	%i5,	%o2
	tcs	%icc,	0x2
	fnot1s	%f17,	%f18
loop_916:
	edge32ln	%g5,	%g6,	%l3
	movpos	%xcc,	%l6,	%o4
	fabss	%f17,	%f6
	udivcc	%l2,	0x0D17,	%l1
	movn	%xcc,	%i2,	%i0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x34] %asi,	%f25
	nop
	set	0x68, %g7
	stw	%g1,	[%l7 + %g7]
	fmovdcc	%xcc,	%f19,	%f30
	fexpand	%f3,	%f30
	fzero	%f14
	set	0x1A, %l0
	ldsha	[%l7 + %l0] 0x18,	%o3
	add	%i1,	0x1DE4,	%o1
	wr	%g0,	0x11,	%asi
	stba	%g2,	[%l7 + 0x0A] %asi
	orcc	%i4,	%g4,	%l5
	fnegs	%f25,	%f2
	fmovdcs	%icc,	%f17,	%f30
	fmovsge	%icc,	%f9,	%f2
	fbne,a	%fcc2,	loop_917
	movn	%xcc,	%i6,	%l0
	sir	0x13C4
	siam	0x1
loop_917:
	movl	%xcc,	%o6,	%o0
	fpackfix	%f18,	%f0
	fornot1	%f4,	%f10,	%f10
	membar	0x5C
	sir	0x05D1
	sub	%i7,	0x13CA,	%g7
	fba,a	%fcc0,	loop_918
	movne	%icc,	%g3,	%i3
	movge	%xcc,	%o7,	%l4
	edge16ln	%o5,	%i5,	%o2
loop_918:
	tge	%icc,	0x3
	bvc,a,pt	%xcc,	loop_919
	tcs	%icc,	0x3
	fnegs	%f24,	%f12
	edge32n	%g5,	%g6,	%l3
loop_919:
	fxnor	%f2,	%f10,	%f12
	fmovscs	%icc,	%f19,	%f15
	edge32ln	%o4,	%l2,	%l1
	set	0x14, %i4
	lda	[%l7 + %i4] 0x10,	%f3
	umulcc	%i2,	%i0,	%g1
	edge16ln	%o3,	%l6,	%i1
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fcmpd	%fcc1,	%f0,	%f8
	edge8ln	%g2,	%i4,	%g4
	srax	%o1,	0x07,	%l5
	tvc	%xcc,	0x5
	movg	%xcc,	%i6,	%l0
	fmovrsgez	%o6,	%f23,	%f31
	set	0x48, %o3
	sta	%f26,	[%l7 + %o3] 0x15
	fnors	%f1,	%f15,	%f8
	ldx	[%l7 + 0x70],	%i7
	edge8	%o0,	%g7,	%i3
	edge32n	%o7,	%g3,	%o5
	edge8n	%l4,	%i5,	%g5
	nop
	setx loop_920, %l0, %l1
	jmpl %l1, %g6
	edge32n	%l3,	%o4,	%o2
	array32	%l1,	%i2,	%i0
	orcc	%g1,	0x15FB,	%l2
loop_920:
	tn	%icc,	0x3
	bn,pn	%xcc,	loop_921
	brlz	%o3,	loop_922
	fcmpeq32	%f6,	%f30,	%l6
	te	%xcc,	0x5
loop_921:
	fcmpeq32	%f26,	%f20,	%i1
loop_922:
	movre	%g2,	0x005,	%g4
	mova	%icc,	%i4,	%o1
	fpsub16s	%f16,	%f8,	%f28
	movleu	%icc,	%i6,	%l5
	ldd	[%l7 + 0x48],	%o6
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	add	%l0,	%o0,	%i7
	edge32l	%i3,	%o7,	%g7
	fpadd32	%f10,	%f18,	%f0
	fbn,a	%fcc3,	loop_923
	fmovse	%xcc,	%f19,	%f13
	set	0x7E, %o4
	ldsba	[%l7 + %o4] 0x10,	%g3
loop_923:
	movrne	%l4,	0x1AA,	%o5
	set	0x58, %i2
	lduwa	[%l7 + %i2] 0x11,	%i5
	fbg	%fcc3,	loop_924
	movn	%icc,	%g5,	%g6
	addc	%l3,	0x1BC3,	%o2
	ldsw	[%l7 + 0x38],	%o4
loop_924:
	nop
	set	0x52, %i0
	stba	%i2,	[%l7 + %i0] 0x11
	brlz	%l1,	loop_925
	st	%f1,	[%l7 + 0x64]
	edge16n	%i0,	%g1,	%o3
	tcc	%icc,	0x2
loop_925:
	fbge,a	%fcc0,	loop_926
	bvs	%xcc,	loop_927
	pdist	%f14,	%f24,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_926:
	movneg	%xcc,	%l2,	%i1
loop_927:
	te	%xcc,	0x7
	fnegs	%f31,	%f13
	fcmps	%fcc1,	%f12,	%f12
	fsrc1	%f18,	%f12
	fpsub32s	%f17,	%f7,	%f22
	fmul8x16au	%f15,	%f20,	%f0
	fbue,a	%fcc1,	loop_928
	fbug,a	%fcc1,	loop_929
	fmovs	%f20,	%f4
	sra	%l6,	%g4,	%i4
loop_928:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_929:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%g2,	[%l7 + 0x38] %asi
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	fbue,a	%fcc1,	loop_930
	movvc	%xcc,	%i6,	%o1
	fmovrsgz	%o6,	%f0,	%f28
	fexpand	%f31,	%f10
loop_930:
	tcc	%icc,	0x0
	orncc	%l5,	%o0,	%l0
	ta	%xcc,	0x4
	edge16l	%i7,	%o7,	%i3
	fmovrslz	%g3,	%f21,	%f27
	fmovdle	%xcc,	%f15,	%f10
	udivcc	%l4,	0x0507,	%g7
	tvs	%xcc,	0x1
	tsubcc	%o5,	0x152E,	%g5
	edge8	%i5,	%g6,	%l3
	subccc	%o2,	0x0F87,	%o4
	movrne	%i2,	0x0E1,	%l1
	bne	%icc,	loop_931
	udivx	%i0,	0x08BC,	%o3
	sllx	%l2,	0x0B,	%i1
	sra	%g1,	%l6,	%i4
loop_931:
	movle	%xcc,	%g2,	%i6
	bge,a	loop_932
	bneg,a	loop_933
	fmovdg	%icc,	%f28,	%f17
	add	%o1,	0x1732,	%o6
loop_932:
	nop
	set	0x52, %o6
	stba	%l5,	[%l7 + %o6] 0xea
	membar	#Sync
loop_933:
	nop
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x14
	srlx	%g4,	0x1E,	%l0
	fnot1s	%f20,	%f27
	fba	%fcc2,	loop_934
	ta	%icc,	0x5
	fbu	%fcc2,	loop_935
	movpos	%icc,	%o0,	%i7
loop_934:
	ta	%icc,	0x0
	stb	%i3,	[%l7 + 0x29]
loop_935:
	fblg	%fcc2,	loop_936
	mulx	%o7,	0x0B6C,	%g3
	ldsb	[%l7 + 0x6F],	%g7
	add	%o5,	0x1433,	%g5
loop_936:
	xorcc	%l4,	%g6,	%i5
	te	%icc,	0x7
	sll	%o2,	%o4,	%l3
	movre	%i2,	%i0,	%l1
	movrgz	%l2,	0x111,	%o3
	andcc	%i1,	0x1325,	%l6
	set	0x20, %l6
	lda	[%l7 + %l6] 0x14,	%f14
	fmovrsgez	%g1,	%f1,	%f13
	sdiv	%i4,	0x0287,	%i6
	edge8ln	%o1,	%g2,	%l5
	addcc	%g4,	%o6,	%o0
	bvc	loop_937
	movvc	%icc,	%i7,	%i3
	orncc	%l0,	%g3,	%o7
	edge32n	%o5,	%g7,	%g5
loop_937:
	sllx	%g6,	0x19,	%l4
	mulx	%i5,	0x1D31,	%o4
	fbg,a	%fcc0,	loop_938
	fbne	%fcc2,	loop_939
	addccc	%l3,	%i2,	%i0
	swap	[%l7 + 0x20],	%l1
loop_938:
	ldx	[%l7 + 0x28],	%l2
loop_939:
	umulcc	%o2,	%i1,	%o3
	umul	%l6,	%i4,	%g1
	fbe	%fcc1,	loop_940
	fbne,a	%fcc0,	loop_941
	orcc	%o1,	0x16D2,	%i6
	brz	%l5,	loop_942
loop_940:
	mulx	%g4,	%o6,	%o0
loop_941:
	alignaddr	%i7,	%g2,	%l0
	call	loop_943
loop_942:
	movn	%icc,	%g3,	%o7
	movrne	%o5,	0x08B,	%g7
	udivcc	%i3,	0x0515,	%g5
loop_943:
	tle	%icc,	0x4
	swap	[%l7 + 0x50],	%g6
	xor	%i5,	%o4,	%l4
	call	loop_944
	fmovs	%f7,	%f30
	movg	%xcc,	%i2,	%l3
	subccc	%l1,	0x1CBD,	%l2
loop_944:
	movpos	%xcc,	%i0,	%i1
	edge16ln	%o2,	%l6,	%o3
	xnorcc	%g1,	0x0F5A,	%i4
	wr	%g0,	0x19,	%asi
	stha	%i6,	[%l7 + 0x78] %asi
	fpadd32	%f6,	%f14,	%f20
	movneg	%xcc,	%o1,	%g4
	fcmpne16	%f12,	%f4,	%l5
	subc	%o6,	0x11DB,	%o0
	movl	%xcc,	%g2,	%l0
	bcc,a	%icc,	loop_945
	edge16n	%i7,	%o7,	%g3
	fpadd32	%f16,	%f10,	%f10
	xor	%o5,	0x1A4C,	%i3
loop_945:
	fmovdgu	%icc,	%f3,	%f8
	array16	%g5,	%g7,	%g6
	brgez,a	%i5,	loop_946
	addcc	%o4,	0x12EA,	%l4
	movne	%xcc,	%i2,	%l1
	fxor	%f2,	%f6,	%f10
loop_946:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%i0
	and	%i1,	0x16D4,	%l2
	set	0x18, %g6
	lduwa	[%l7 + %g6] 0x81,	%l6
	lduh	[%l7 + 0x68],	%o2
	fabss	%f10,	%f27
	ldsb	[%l7 + 0x1E],	%g1
	tl	%xcc,	0x1
	set	0x74, %l3
	lduha	[%l7 + %l3] 0x18,	%i4
	edge32l	%i6,	%o1,	%g4
	sdivcc	%o3,	0x091D,	%o6
	fabsd	%f12,	%f12
	nop
	set	0x1A, %o5
	sth	%l5,	[%l7 + %o5]
	andcc	%g2,	%l0,	%i7
	fxor	%f26,	%f26,	%f26
	wr	%g0,	0x22,	%asi
	stha	%o7,	[%l7 + 0x5E] %asi
	membar	#Sync
	edge16	%o0,	%g3,	%o5
	stb	%i3,	[%l7 + 0x28]
	sll	%g7,	0x16,	%g5
	array32	%g6,	%i5,	%o4
	andncc	%l4,	%i2,	%l1
	array32	%i0,	%l3,	%i1
	movpos	%xcc,	%l2,	%l6
	fsrc2	%f16,	%f28
	wr	%g0,	0x0c,	%asi
	stba	%g1,	[%l7 + 0x33] %asi
	xnorcc	%i4,	%o2,	%i6
	tle	%xcc,	0x5
	srlx	%o1,	0x06,	%g4
	xorcc	%o6,	%o3,	%l5
	fmovdvc	%xcc,	%f28,	%f16
	fmovde	%xcc,	%f11,	%f1
	set	0x58, %o1
	sta	%f1,	[%l7 + %o1] 0x15
	bgu,a	%icc,	loop_947
	subc	%l0,	%g2,	%i7
	sth	%o0,	[%l7 + 0x5E]
	be,a	%icc,	loop_948
loop_947:
	movrgz	%o7,	%g3,	%i3
	movcc	%icc,	%o5,	%g5
	popc	0x18BB,	%g7
loop_948:
	fmovsneg	%xcc,	%f12,	%f13
	tl	%icc,	0x4
	tvc	%icc,	0x3
	tn	%xcc,	0x4
	andcc	%i5,	%o4,	%l4
	std	%i2,	[%l7 + 0x38]
	fsrc1s	%f21,	%f29
	orcc	%l1,	%g6,	%l3
	nop
	setx	loop_949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%i1,	0x0C19,	%i0
	tg	%icc,	0x5
	tvs	%xcc,	0x7
loop_949:
	mova	%icc,	%l6,	%g1
	movne	%xcc,	%l2,	%o2
	fbge	%fcc3,	loop_950
	fpsub32s	%f12,	%f8,	%f1
	edge16n	%i6,	%i4,	%o1
	movrgz	%o6,	%o3,	%g4
loop_950:
	fmul8ulx16	%f12,	%f6,	%f14
	movneg	%xcc,	%l5,	%g2
	tsubcc	%i7,	0x1C87,	%l0
	fpsub32s	%f31,	%f18,	%f30
	fbu	%fcc0,	loop_951
	orncc	%o0,	%o7,	%g3
	movvc	%icc,	%o5,	%i3
	tsubcc	%g7,	%g5,	%o4
loop_951:
	fmovrdlz	%i5,	%f10,	%f0
	umul	%i2,	0x1CCE,	%l1
	ble,a,pn	%icc,	loop_952
	movrgz	%l4,	0x3D4,	%g6
	movre	%i1,	%i0,	%l3
	movcs	%icc,	%l6,	%g1
loop_952:
	array8	%o2,	%l2,	%i6
	xorcc	%o1,	%i4,	%o3
	bleu,a,pn	%xcc,	loop_953
	orncc	%o6,	%g4,	%l5
	fbo	%fcc1,	loop_954
	edge32	%i7,	%l0,	%o0
loop_953:
	andcc	%g2,	0x1006,	%g3
	tg	%xcc,	0x0
loop_954:
	stw	%o7,	[%l7 + 0x70]
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x2C] %asi,	%i3
	edge32l	%g7,	%g5,	%o4
	srl	%o5,	%i5,	%i2
	xnor	%l1,	0x056F,	%l4
	subc	%g6,	0x0F05,	%i0
	sdivx	%l3,	0x19C5,	%l6
	tsubcc	%i1,	0x109F,	%g1
	te	%xcc,	0x2
	ba	%icc,	loop_955
	bvc	%icc,	loop_956
	movl	%icc,	%l2,	%i6
	fmovsg	%icc,	%f11,	%f1
loop_955:
	sllx	%o2,	%o1,	%i4
loop_956:
	move	%xcc,	%o3,	%g4
	movrlez	%o6,	0x1E2,	%i7
	alignaddr	%l0,	%l5,	%o0
	edge8ln	%g3,	%o7,	%i3
	fbg	%fcc2,	loop_957
	fnot1s	%f21,	%f15
	bcs,pn	%icc,	loop_958
	sdiv	%g7,	0x0B8D,	%g2
loop_957:
	fpack16	%f8,	%f17
	addcc	%g5,	%o5,	%i5
loop_958:
	bvs,a,pt	%xcc,	loop_959
	popc	%o4,	%i2
	nop
	set	0x60, %g3
	stx	%l4,	[%l7 + %g3]
	membar	0x3B
loop_959:
	fnegd	%f20,	%f6
	edge16n	%g6,	%i0,	%l3
	edge16ln	%l6,	%l1,	%i1
	ldub	[%l7 + 0x42],	%l2
	sdivcc	%g1,	0x1176,	%o2
	brlz	%o1,	loop_960
	tsubcc	%i4,	%o3,	%g4
	wr	%g0,	0xe2,	%asi
	stxa	%i6,	[%l7 + 0x08] %asi
	membar	#Sync
loop_960:
	bleu,a	loop_961
	fxnor	%f10,	%f6,	%f22
	fmovsge	%xcc,	%f9,	%f28
	tn	%icc,	0x6
loop_961:
	bgu,pt	%icc,	loop_962
	andncc	%i7,	%l0,	%o6
	edge32l	%l5,	%g3,	%o7
	lduh	[%l7 + 0x6E],	%o0
loop_962:
	nop
	set	0x40, %g1
	stxa	%g7,	[%l7 + %g1] 0x27
	membar	#Sync
	membar	0x6E
	brz	%i3,	loop_963
	tne	%xcc,	0x4
	edge32	%g2,	%o5,	%g5
	fble,a	%fcc3,	loop_964
loop_963:
	umulcc	%i5,	%o4,	%l4
	fnot2s	%f15,	%f27
	fbo	%fcc2,	loop_965
loop_964:
	xnor	%i2,	0x0FBA,	%g6
	fmovrsne	%i0,	%f0,	%f27
	fbu	%fcc0,	loop_966
loop_965:
	movrgz	%l3,	%l6,	%l1
	fones	%f3
	fmovdvs	%icc,	%f29,	%f31
loop_966:
	edge8	%i1,	%g1,	%o2
	edge32l	%o1,	%l2,	%i4
	edge32l	%g4,	%i6,	%i7
	movre	%o3,	0x105,	%o6
	fcmpeq32	%f6,	%f30,	%l5
	bcc,pt	%xcc,	loop_967
	tpos	%xcc,	0x0
	movcc	%xcc,	%l0,	%o7
	movrne	%o0,	%g7,	%g3
loop_967:
	bcs,a	loop_968
	movrlez	%i3,	%g2,	%g5
	srax	%o5,	%o4,	%l4
	movcc	%xcc,	%i2,	%g6
loop_968:
	movl	%xcc,	%i5,	%l3
	ldub	[%l7 + 0x69],	%l6
	bgu,a,pt	%xcc,	loop_969
	movvc	%xcc,	%l1,	%i0
	stb	%g1,	[%l7 + 0x6F]
	sdivcc	%o2,	0x1F86,	%i1
loop_969:
	nop
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovdge	%icc,	%f3,	%f25
	mova	%icc,	%o1,	%i4
	fmovdvs	%icc,	%f15,	%f3
	fmovsneg	%icc,	%f11,	%f16
	sethi	0x14F8,	%g4
	and	%l2,	0x1706,	%i6
	movrlz	%i7,	0x282,	%o6
	addccc	%l5,	0x0764,	%l0
	movcs	%xcc,	%o3,	%o7
	mulscc	%o0,	%g3,	%i3
	bgu,a,pn	%icc,	loop_970
	fpadd32	%f0,	%f20,	%f2
	udiv	%g2,	0x0470,	%g7
	movrlez	%o5,	0x10B,	%o4
loop_970:
	andn	%l4,	0x1A64,	%g5
	fpmerge	%f9,	%f23,	%f28
	ldstub	[%l7 + 0x5F],	%i2
	smulcc	%g6,	%l3,	%i5
	movleu	%xcc,	%l6,	%i0
	movvs	%xcc,	%g1,	%o2
	alignaddrl	%i1,	%o1,	%l1
	stbar
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	fcmpgt32	%f24,	%f4,	%l2
	fcmpeq32	%f6,	%f6,	%i6
	addccc	%i4,	%i7,	%l5
	fble,a	%fcc1,	loop_971
	std	%f0,	[%l7 + 0x18]
	sllx	%o6,	%l0,	%o3
	fexpand	%f22,	%f16
loop_971:
	ba,pt	%xcc,	loop_972
	edge16l	%o0,	%g3,	%i3
	movvs	%icc,	%g2,	%o7
	movge	%icc,	%g7,	%o4
loop_972:
	fpsub32s	%f10,	%f15,	%f29
	movcc	%icc,	%o5,	%g5
	tleu	%xcc,	0x5
	and	%i2,	0x0009,	%l4
	srlx	%l3,	%g6,	%i5
	xor	%i0,	%l6,	%o2
	fmovsn	%xcc,	%f13,	%f11
	movne	%icc,	%g1,	%o1
	popc	%l1,	%i1
	udivcc	%g4,	0x0583,	%l2
	tge	%icc,	0x7
	orn	%i6,	%i4,	%l5
	tge	%icc,	0x0
	sdivcc	%o6,	0x1CBA,	%l0
	edge32l	%i7,	%o3,	%o0
	bpos,pt	%xcc,	loop_973
	tsubcc	%g3,	%i3,	%o7
	mulx	%g2,	0x1554,	%o4
	taddcctv	%o5,	%g7,	%g5
loop_973:
	sllx	%l4,	%l3,	%i2
	subc	%g6,	%i0,	%i5
	fmovsg	%xcc,	%f16,	%f0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x24] %asi,	%l6
	mova	%icc,	%g1,	%o1
	st	%f27,	[%l7 + 0x1C]
	smulcc	%o2,	0x00C0,	%l1
	brgez,a	%i1,	loop_974
	movne	%icc,	%g4,	%l2
	orncc	%i4,	%i6,	%l5
	membar	0x38
loop_974:
	andcc	%l0,	0x1960,	%i7
	mulscc	%o3,	0x1F28,	%o0
	movge	%xcc,	%g3,	%o6
	movpos	%icc,	%o7,	%i3
	nop
	setx	loop_975,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,a,pn	%icc,	loop_976
	udivcc	%g2,	0x17B2,	%o5
	subcc	%g7,	0x0A8A,	%o4
loop_975:
	srax	%g5,	%l3,	%i2
loop_976:
	movvc	%icc,	%l4,	%i0
	sdiv	%g6,	0x1060,	%l6
	tvc	%xcc,	0x2
	fbge,a	%fcc2,	loop_977
	ld	[%l7 + 0x30],	%f26
	bcs	loop_978
	movcs	%icc,	%i5,	%g1
loop_977:
	nop
	set	0x54, %l4
	ldsba	[%l7 + %l4] 0x80,	%o2
loop_978:
	edge16ln	%l1,	%i1,	%g4
	fcmpgt16	%f14,	%f6,	%o1
	udiv	%l2,	0x0E7B,	%i6
	tg	%icc,	0x4
	addcc	%i4,	%l0,	%l5
	subcc	%i7,	0x1927,	%o0
	andncc	%o3,	%o6,	%g3
	taddcc	%o7,	0x1BCA,	%g2
	mulx	%o5,	%i3,	%g7
	edge16l	%o4,	%l3,	%g5
	xor	%i2,	0x0C56,	%l4
	fbg,a	%fcc0,	loop_979
	fandnot1s	%f24,	%f19,	%f8
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_979:
	edge16ln	%i0,	%l6,	%g6
	fbge,a	%fcc3,	loop_980
	srax	%i5,	0x0E,	%g1
	bg,a	loop_981
	movrgz	%o2,	0x03B,	%l1
loop_980:
	alignaddrl	%i1,	%g4,	%l2
	fands	%f26,	%f27,	%f9
loop_981:
	stx	%o1,	[%l7 + 0x58]
	flush	%l7 + 0x58
	movvc	%xcc,	%i6,	%i4
	smul	%l5,	0x16FF,	%i7
	brlz	%o0,	loop_982
	fpsub16	%f24,	%f30,	%f24
	sdiv	%o3,	0x0F69,	%l0
	movvs	%icc,	%o6,	%o7
loop_982:
	mulscc	%g2,	0x0EE0,	%g3
	edge16n	%i3,	%g7,	%o5
	tleu	%xcc,	0x6
	tne	%xcc,	0x2
	fbge,a	%fcc1,	loop_983
	bneg,pn	%icc,	loop_984
	movre	%o4,	%l3,	%g5
	srlx	%i2,	%l4,	%i0
loop_983:
	edge16n	%g6,	%l6,	%i5
loop_984:
	orcc	%o2,	%l1,	%g1
	ldx	[%l7 + 0x78],	%g4
	andncc	%i1,	%l2,	%o1
	movpos	%icc,	%i6,	%l5
	taddcctv	%i4,	0x0CB7,	%i7
	edge32n	%o3,	%l0,	%o0
	edge32ln	%o6,	%o7,	%g3
	subcc	%g2,	%i3,	%g7
	tvs	%xcc,	0x4
	bne,a	loop_985
	fornot2s	%f1,	%f21,	%f23
	fmovdge	%icc,	%f28,	%f30
	tcs	%icc,	0x2
loop_985:
	bpos,pt	%xcc,	loop_986
	membar	0x41
	edge32n	%o4,	%l3,	%g5
	udiv	%i2,	0x0DEC,	%l4
loop_986:
	movrlez	%o5,	0x30D,	%i0
	movvs	%icc,	%g6,	%l6
	bpos,a,pt	%icc,	loop_987
	mulx	%o2,	%i5,	%g1
	fnand	%f20,	%f4,	%f10
	movrne	%l1,	%i1,	%g4
loop_987:
	umul	%l2,	%o1,	%l5
	tg	%icc,	0x1
	tsubcctv	%i4,	0x07A4,	%i7
	fxnor	%f12,	%f28,	%f10
	movpos	%xcc,	%o3,	%i6
	tle	%icc,	0x1
	edge32	%o0,	%l0,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%g3
	fbule	%fcc3,	loop_988
	sllx	%i3,	%g2,	%o4
	movne	%icc,	%g7,	%l3
	nop
	setx loop_989, %l0, %l1
	jmpl %l1, %g5
loop_988:
	fnor	%f26,	%f26,	%f18
	srl	%l4,	%i2,	%i0
	alignaddrl	%g6,	%o5,	%l6
loop_989:
	movrne	%i5,	0x10E,	%g1
	fnot1	%f30,	%f10
	fcmpeq32	%f2,	%f26,	%l1
	set	0x08, %o2
	stwa	%o2,	[%l7 + %o2] 0x11
	movrlez	%g4,	%i1,	%l2
	bvs,pt	%xcc,	loop_990
	tne	%xcc,	0x4
	sdivcc	%l5,	0x0A2E,	%i4
	tge	%xcc,	0x4
loop_990:
	edge32	%i7,	%o1,	%i6
	bge	%icc,	loop_991
	edge16l	%o3,	%o0,	%l0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o7
loop_991:
	edge32	%o6,	%i3,	%g2
	umul	%g3,	0x0541,	%o4
	alignaddr	%g7,	%g5,	%l4
	fpsub16s	%f13,	%f27,	%f12
	edge8ln	%i2,	%i0,	%g6
	sir	0x0821
	orcc	%l3,	%o5,	%i5
	smul	%g1,	0x0AA9,	%l1
	sir	0x1297
	orncc	%o2,	0x15A6,	%g4
	array8	%l6,	%i1,	%l5
	andn	%i4,	%i7,	%l2
	fmovsleu	%xcc,	%f16,	%f19
	mova	%xcc,	%i6,	%o1
	fbu,a	%fcc1,	loop_992
	sra	%o3,	%l0,	%o7
	fxor	%f22,	%f8,	%f14
	brnz,a	%o0,	loop_993
loop_992:
	sdivx	%o6,	0x043A,	%g2
	movrne	%g3,	0x2AA,	%i3
	bcs,a,pt	%icc,	loop_994
loop_993:
	movvc	%icc,	%o4,	%g5
	array32	%g7,	%i2,	%i0
	ble	loop_995
loop_994:
	fmovsge	%xcc,	%f2,	%f28
	ble,pn	%icc,	loop_996
	fmovsle	%xcc,	%f19,	%f9
loop_995:
	movleu	%xcc,	%l4,	%l3
	te	%xcc,	0x7
loop_996:
	fbo,a	%fcc2,	loop_997
	edge32ln	%g6,	%i5,	%o5
	brlz	%g1,	loop_998
	subc	%l1,	0x0C12,	%o2
loop_997:
	movrlez	%l6,	%i1,	%g4
	taddcctv	%i4,	%i7,	%l5
loop_998:
	edge16l	%l2,	%i6,	%o3
	fba,a	%fcc2,	loop_999
	array8	%l0,	%o1,	%o0
	addcc	%o7,	%g2,	%o6
	set	0x14, %g4
	sta	%f18,	[%l7 + %g4] 0x88
loop_999:
	movl	%icc,	%i3,	%g3
	srl	%o4,	%g7,	%g5
	fbue,a	%fcc2,	loop_1000
	srax	%i2,	%l4,	%i0
	pdist	%f4,	%f24,	%f8
	array16	%g6,	%i5,	%l3
loop_1000:
	sub	%g1,	0x07FF,	%o5
	udivx	%o2,	0x1728,	%l1
	movn	%icc,	%l6,	%i1
	sdivx	%i4,	0x10AA,	%g4
	fmovrsne	%l5,	%f11,	%f17
	smul	%l2,	%i7,	%o3
	sra	%i6,	%l0,	%o0
	sra	%o1,	%o7,	%o6
	movvc	%icc,	%g2,	%i3
	fcmpeq32	%f2,	%f6,	%o4
	membar	0x1D
	andcc	%g3,	0x0F01,	%g5
	tvc	%xcc,	0x3
	movge	%icc,	%i2,	%l4
	fpack32	%f8,	%f14,	%f30
	udivcc	%g7,	0x17E7,	%g6
	edge8l	%i5,	%l3,	%i0
	xor	%o5,	0x0BC6,	%g1
	movrgez	%l1,	%o2,	%i1
	ldsh	[%l7 + 0x7E],	%l6
	fbo,a	%fcc3,	loop_1001
	movleu	%xcc,	%g4,	%i4
	te	%icc,	0x6
	popc	0x0442,	%l5
loop_1001:
	te	%xcc,	0x7
	fbne,a	%fcc3,	loop_1002
	tne	%xcc,	0x2
	fone	%f12
	std	%i6,	[%l7 + 0x38]
loop_1002:
	nop
	setx loop_1003, %l0, %l1
	jmpl %l1, %l2
	ldx	[%l7 + 0x08],	%o3
	tge	%icc,	0x2
	orcc	%l0,	%o0,	%o1
loop_1003:
	xor	%o7,	0x1D97,	%o6
	srl	%i6,	0x19,	%g2
	sdivcc	%i3,	0x0665,	%o4
	tge	%xcc,	0x0
	bl,a,pn	%xcc,	loop_1004
	fmovdpos	%icc,	%f15,	%f11
	fmovdvc	%xcc,	%f23,	%f9
	fmovrdgz	%g3,	%f24,	%f24
loop_1004:
	nop
	set	0x0B, %o7
	ldstuba	[%l7 + %o7] 0x89,	%g5
	set	0x10, %o0
	ldxa	[%g0 + %o0] 0x4f,	%l4
	and	%i2,	%g7,	%i5
	sdiv	%l3,	0x1ACD,	%g6
	movrlz	%o5,	0x3DD,	%g1
	fcmpeq32	%f6,	%f6,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc0,	loop_1005
	std	%o2,	[%l7 + 0x50]
	tvs	%icc,	0x1
	andcc	%i0,	0x00D9,	%l6
loop_1005:
	taddcctv	%g4,	0x0A51,	%i4
	brnz	%l5,	loop_1006
	movcs	%xcc,	%i7,	%i1
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0x0
loop_1006:
	tgu	%xcc,	0x1
	fbe,a	%fcc1,	loop_1007
	movrne	%l0,	%l2,	%o0
	fcmpne32	%f26,	%f12,	%o1
	udiv	%o6,	0x0A74,	%o7
loop_1007:
	subc	%g2,	%i6,	%i3
	mova	%icc,	%o4,	%g3
	tn	%icc,	0x7
	fnot2s	%f12,	%f12
	fand	%f26,	%f28,	%f14
	movle	%icc,	%l4,	%g5
	tvc	%icc,	0x1
	edge16	%i2,	%g7,	%l3
	smul	%i5,	%o5,	%g6
	bgu	%icc,	loop_1008
	fmovrse	%l1,	%f16,	%f3
	ldd	[%l7 + 0x70],	%f30
	or	%g1,	%i0,	%l6
loop_1008:
	te	%xcc,	0x0
	std	%f16,	[%l7 + 0x58]
	edge32ln	%g4,	%i4,	%o2
	fblg,a	%fcc0,	loop_1009
	fmovdg	%icc,	%f20,	%f2
	movcc	%icc,	%i7,	%i1
	fmul8sux16	%f22,	%f2,	%f24
loop_1009:
	fmovsvs	%xcc,	%f24,	%f18
	set	0x110, %g5
	stxa	%o3,	[%g0 + %g5] 0x21
	ldsw	[%l7 + 0x38],	%l0
	fmovscc	%icc,	%f11,	%f2
	fbg,a	%fcc1,	loop_1010
	bpos	%xcc,	loop_1011
	add	%l2,	0x0FE5,	%o0
	tcc	%icc,	0x2
loop_1010:
	fmovrde	%l5,	%f30,	%f20
loop_1011:
	tl	%xcc,	0x7
	fmovsne	%xcc,	%f16,	%f13
	tleu	%icc,	0x0
	edge8	%o6,	%o1,	%g2
	and	%i6,	%i3,	%o4
	udivx	%g3,	0x1CCC,	%l4
	tvc	%icc,	0x0
	fandnot1s	%f5,	%f14,	%f8
	edge16ln	%g5,	%i2,	%g7
	movcc	%xcc,	%l3,	%i5
	movn	%xcc,	%o7,	%g6
	set	0x7D, %g2
	stba	%l1,	[%l7 + %g2] 0x81
	movpos	%icc,	%o5,	%g1
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%l6
	lduw	[%l7 + 0x60],	%i0
	fpack16	%f2,	%f12
	fmovrdlez	%i4,	%f22,	%f20
	membar	0x6B
	fzeros	%f23
	edge16l	%o2,	%g4,	%i1
	movn	%icc,	%o3,	%l0
	array8	%i7,	%o0,	%l2
	alignaddr	%o6,	%o1,	%l5
	fand	%f14,	%f26,	%f8
	fble	%fcc3,	loop_1012
	pdist	%f2,	%f26,	%f24
	subc	%g2,	%i3,	%i6
	bcs,a,pn	%icc,	loop_1013
loop_1012:
	movcs	%xcc,	%g3,	%l4
	tpos	%xcc,	0x7
	edge32ln	%g5,	%i2,	%o4
loop_1013:
	smulcc	%g7,	%i5,	%l3
	movle	%icc,	%g6,	%l1
	sdiv	%o5,	0x1895,	%g1
	mova	%icc,	%o7,	%l6
	edge16n	%i4,	%o2,	%i0
	fxors	%f21,	%f7,	%f1
	or	%i1,	%g4,	%l0
	nop
	setx loop_1014, %l0, %l1
	jmpl %l1, %o3
	edge16	%i7,	%l2,	%o6
	fmovrslez	%o0,	%f10,	%f12
	nop
	setx loop_1015, %l0, %l1
	jmpl %l1, %l5
loop_1014:
	subccc	%o1,	%g2,	%i3
	fnot2s	%f1,	%f17
	sdivx	%g3,	0x0CB2,	%i6
loop_1015:
	fandnot1	%f6,	%f14,	%f30
	edge8l	%l4,	%i2,	%g5
	movrgez	%o4,	%i5,	%l3
	udivx	%g6,	0x102D,	%l1
	or	%o5,	0x03C1,	%g1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%g7
	fcmped	%fcc0,	%f2,	%f18
	edge32ln	%o7,	%i4,	%o2
	lduh	[%l7 + 0x0C],	%i0
	tvc	%xcc,	0x2
	or	%i1,	%l6,	%l0
	ta	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	sta	%f20,	[%l7 + 0x3C] %asi
	fba	%fcc0,	loop_1016
	fsrc1s	%f18,	%f24
	fsrc1s	%f28,	%f24
	be	%icc,	loop_1017
loop_1016:
	mulx	%o3,	0x181E,	%i7
	udivcc	%g4,	0x146E,	%l2
	fsrc2	%f18,	%f20
loop_1017:
	tgu	%icc,	0x7
	bne,a	%xcc,	loop_1018
	movrlez	%o0,	0x3BE,	%o6
	fmovscc	%icc,	%f14,	%f0
	wr	%g0,	0x4f,	%asi
	stxa	%l5,	[%g0 + 0x8] %asi
loop_1018:
	brnz	%g2,	loop_1019
	bl,pt	%xcc,	loop_1020
	st	%f23,	[%l7 + 0x14]
	movl	%icc,	%o1,	%i3
loop_1019:
	subc	%g3,	%l4,	%i6
loop_1020:
	taddcctv	%g5,	%o4,	%i2
	move	%icc,	%i5,	%l3
	sllx	%l1,	0x05,	%g6
	taddcctv	%g1,	0x0C28,	%g7
	movvs	%icc,	%o7,	%i4
	subccc	%o5,	0x1A0B,	%o2
	sll	%i0,	%i1,	%l6
	sllx	%l0,	0x00,	%i7
	movrgez	%o3,	%g4,	%o0
	fmovsge	%xcc,	%f29,	%f14
	tcs	%xcc,	0x4
	mova	%xcc,	%o6,	%l2
	movn	%xcc,	%l5,	%o1
	movge	%xcc,	%g2,	%i3
	sdivcc	%l4,	0x0F1D,	%g3
	and	%i6,	%g5,	%i2
	bn,a	%icc,	loop_1021
	umul	%o4,	%l3,	%i5
	edge32n	%l1,	%g1,	%g6
	udiv	%g7,	0x17CC,	%o7
loop_1021:
	fmovsneg	%xcc,	%f17,	%f18
	tn	%icc,	0x6
	and	%o5,	%i4,	%i0
	fpadd16	%f12,	%f16,	%f24
	edge16ln	%o2,	%l6,	%l0
	tl	%xcc,	0x7
	alignaddrl	%i1,	%i7,	%o3
	edge16l	%o0,	%o6,	%l2
	edge32l	%g4,	%l5,	%o1
	brgez	%g2,	loop_1022
	bvs,a	loop_1023
	st	%f2,	[%l7 + 0x14]
	tg	%xcc,	0x7
loop_1022:
	edge8	%i3,	%l4,	%g3
loop_1023:
	tn	%icc,	0x7
	tl	%icc,	0x7
	nop
	setx loop_1024, %l0, %l1
	jmpl %l1, %g5
	membar	0x28
	subc	%i6,	%o4,	%l3
	movgu	%xcc,	%i2,	%i5
loop_1024:
	mova	%xcc,	%l1,	%g6
	nop
	set	0x6C, %l5
	stw	%g1,	[%l7 + %l5]
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6F] %asi,	%o7
	fmovscc	%icc,	%f27,	%f19
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	ldsh	[%l7 + 0x5E],	%o5
	movle	%icc,	%i0,	%o2
	edge32ln	%l6,	%i4,	%l0
	sra	%i7,	0x08,	%i1
	fpsub32s	%f13,	%f3,	%f12
	fnegd	%f6,	%f30
	array8	%o3,	%o0,	%l2
	fmovrdgz	%o6,	%f12,	%f26
	fbg,a	%fcc1,	loop_1025
	nop
	set	0x70, %i7
	ldsw	[%l7 + %i7],	%g4
	edge16n	%o1,	%l5,	%g2
	movrgez	%i3,	%l4,	%g5
loop_1025:
	fpadd16s	%f10,	%f27,	%f25
	fnand	%f4,	%f24,	%f6
	movge	%xcc,	%i6,	%g3
	bleu,a	%icc,	loop_1026
	sub	%o4,	%i2,	%l3
	edge32l	%i5,	%g6,	%g1
	set	0x20, %i1
	stda	%l0,	[%l7 + %i1] 0x11
loop_1026:
	fcmpeq32	%f0,	%f30,	%o7
	movrne	%o5,	%g7,	%i0
	movcc	%icc,	%l6,	%i4
	movge	%icc,	%l0,	%o2
	fcmple16	%f16,	%f4,	%i1
	alignaddrl	%o3,	%o0,	%i7
	movrne	%o6,	0x3F1,	%g4
	movrlez	%o1,	%l2,	%g2
	sll	%l5,	%l4,	%i3
	fmovrdlez	%i6,	%f2,	%f28
	edge32l	%g5,	%g3,	%i2
	udivcc	%o4,	0x1DDF,	%l3
	fmovse	%icc,	%f15,	%f5
	smulcc	%g6,	0x1183,	%i5
	move	%xcc,	%l1,	%o7
	sllx	%o5,	%g7,	%i0
	be,pt	%icc,	loop_1027
	ta	%xcc,	0x4
	tcc	%icc,	0x1
	fpsub32	%f30,	%f12,	%f20
loop_1027:
	srl	%l6,	0x09,	%g1
	tl	%xcc,	0x0
	smulcc	%l0,	0x1BC0,	%o2
	set	0x52, %l1
	stba	%i4,	[%l7 + %l1] 0x14
	stbar
	movneg	%icc,	%i1,	%o0
	set	0x32, %i5
	ldsba	[%l7 + %i5] 0x0c,	%o3
	nop
	setx	loop_1028,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbl	%fcc3,	loop_1029
	siam	0x0
	movle	%icc,	%i7,	%g4
loop_1028:
	edge16n	%o1,	%l2,	%g2
loop_1029:
	andn	%o6,	0x01E4,	%l4
	bg,a	loop_1030
	movre	%i3,	0x240,	%i6
	array8	%l5,	%g3,	%g5
	srax	%i2,	%o4,	%g6
loop_1030:
	tne	%icc,	0x4
	nop
	set	0x48, %l0
	std	%f8,	[%l7 + %l0]
	movre	%l3,	%i5,	%o7
	addcc	%o5,	%l1,	%g7
	set	0x75, %i4
	ldstuba	[%l7 + %i4] 0x10,	%i0
	fmovrse	%l6,	%f9,	%f6
	orcc	%g1,	%l0,	%i4
	taddcc	%o2,	%i1,	%o3
	xorcc	%i7,	0x0FC8,	%g4
	fnot2s	%f28,	%f31
	wr	%g0,	0x81,	%asi
	stwa	%o0,	[%l7 + 0x1C] %asi
	movvc	%xcc,	%l2,	%g2
	tneg	%xcc,	0x2
	movneg	%icc,	%o1,	%o6
	bvs	loop_1031
	bleu,pn	%icc,	loop_1032
	fbuge	%fcc2,	loop_1033
	movrne	%i3,	0x2FA,	%l4
loop_1031:
	movvs	%icc,	%i6,	%g3
loop_1032:
	edge32	%l5,	%g5,	%i2
loop_1033:
	fbul,a	%fcc0,	loop_1034
	tn	%xcc,	0x6
	set	0x30, %o3
	ldxa	[%l7 + %o3] 0x19,	%g6
loop_1034:
	array16	%l3,	%i5,	%o7
	smulcc	%o5,	0x15B6,	%l1
	movrgez	%o4,	0x0FA,	%g7
	subccc	%i0,	%g1,	%l6
	tn	%icc,	0x4
	edge8	%l0,	%i4,	%i1
	sethi	0x1B26,	%o3
	taddcctv	%i7,	%g4,	%o2
	fmovrdgz	%l2,	%f22,	%f6
	edge8l	%o0,	%g2,	%o1
	tn	%icc,	0x7
	edge8ln	%i3,	%l4,	%i6
	edge16l	%g3,	%o6,	%g5
	bl,pn	%icc,	loop_1035
	fmovdpos	%icc,	%f28,	%f7
	mulscc	%l5,	%i2,	%g6
	udivcc	%l3,	0x068F,	%i5
loop_1035:
	fmovrdlez	%o7,	%f16,	%f30
	fmovrsgez	%l1,	%f19,	%f7
	sdivcc	%o5,	0x04D7,	%g7
	sdiv	%i0,	0x07AA,	%g1
	tsubcctv	%o4,	0x0101,	%l6
	sub	%l0,	%i4,	%i1
	flush	%l7 + 0x5C
	srax	%o3,	%g4,	%o2
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i7
	tvc	%xcc,	0x0
	set	0x28, %o4
	stda	%l2,	[%l7 + %o4] 0xe3
	membar	#Sync
	edge32	%o0,	%o1,	%i3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l4
	tvc	%icc,	0x3
	subcc	%i6,	%g3,	%g2
	edge32l	%o6,	%g5,	%l5
	tvs	%icc,	0x2
	tvs	%xcc,	0x5
	bcs,a	loop_1036
	or	%i2,	%l3,	%g6
	fcmped	%fcc1,	%f2,	%f4
	udiv	%i5,	0x0960,	%o7
loop_1036:
	movcc	%icc,	%l1,	%g7
	fbuge	%fcc1,	loop_1037
	fmovdn	%xcc,	%f8,	%f6
	or	%i0,	%o5,	%g1
	movge	%xcc,	%l6,	%o4
loop_1037:
	nop
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x81,	%i4
	be	loop_1038
	ba,pn	%icc,	loop_1039
	taddcc	%l0,	%i1,	%o3
	fble	%fcc3,	loop_1040
loop_1038:
	bshuffle	%f0,	%f8,	%f6
loop_1039:
	fbn	%fcc2,	loop_1041
	array32	%g4,	%o2,	%l2
loop_1040:
	fcmpeq32	%f16,	%f10,	%i7
	srl	%o0,	0x1E,	%o1
loop_1041:
	sir	0x0D8F
	bleu	%icc,	loop_1042
	move	%icc,	%l4,	%i3
	movpos	%icc,	%i6,	%g3
	tne	%icc,	0x7
loop_1042:
	movl	%icc,	%o6,	%g5
	membar	0x7D
	movl	%xcc,	%l5,	%g2
	bn,a,pn	%icc,	loop_1043
	tcc	%icc,	0x7
	array32	%l3,	%g6,	%i5
	fmovsneg	%xcc,	%f9,	%f17
loop_1043:
	tl	%icc,	0x1
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%o7
	set	0x60, %g7
	ldxa	[%l7 + %g7] 0x15,	%l1
	sub	%g7,	0x0B84,	%i0
	smulcc	%i2,	0x0FA3,	%g1
	bne,a,pn	%icc,	loop_1044
	or	%o5,	%l6,	%o4
	alignaddr	%i4,	%i1,	%l0
	fmovsleu	%xcc,	%f24,	%f17
loop_1044:
	bl,pn	%icc,	loop_1045
	orncc	%o3,	0x0BC4,	%g4
	movcc	%icc,	%l2,	%i7
	subcc	%o2,	0x109E,	%o0
loop_1045:
	fcmps	%fcc3,	%f1,	%f3
	movg	%xcc,	%l4,	%i3
	fmovrde	%i6,	%f20,	%f10
	movn	%icc,	%o1,	%g3
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
	fmuld8sux16	%f19,	%f10,	%f30
	tcs	%xcc,	0x5
	xor	%g5,	0x0F15,	%l5
	andcc	%g2,	%l3,	%o6
	array16	%i5,	%o7,	%g6
	movrlz	%l1,	%i0,	%i2
	xorcc	%g7,	%g1,	%l6
	movg	%icc,	%o5,	%o4
	xnorcc	%i1,	0x09DA,	%l0
	sdiv	%i4,	0x111B,	%g4
	fzeros	%f11
	fmovsleu	%icc,	%f0,	%f7
	alignaddrl	%l2,	%i7,	%o3
	std	%o0,	[%l7 + 0x28]
	edge8	%o2,	%i3,	%l4
	brgz,a	%i6,	loop_1046
	subcc	%o1,	%g3,	%g5
	andn	%g2,	0x0DF3,	%l3
	array8	%l5,	%o6,	%o7
loop_1046:
	fmovrdne	%g6,	%f12,	%f8
	fbge,a	%fcc1,	loop_1047
	orcc	%i5,	0x1D64,	%i0
	addc	%l1,	0x1065,	%g7
	andn	%i2,	%l6,	%o5
loop_1047:
	orn	%g1,	0x0466,	%i1
	fmovrse	%l0,	%f30,	%f23
	fmovsleu	%xcc,	%f24,	%f8
	taddcc	%o4,	0x0F91,	%i4
	tne	%icc,	0x6
	movge	%xcc,	%l2,	%i7
	tge	%xcc,	0x7
	fnegd	%f26,	%f12
	sllx	%o3,	%o0,	%o2
	add	%g4,	0x0B3A,	%l4
	bn,a	loop_1048
	fmovsvs	%icc,	%f30,	%f29
	fabsd	%f8,	%f0
	taddcctv	%i6,	%i3,	%o1
loop_1048:
	nop
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	orcc	%g5,	0x193A,	%g2
	addccc	%l3,	%l5,	%o6
	fornot1s	%f11,	%f6,	%f31
	fexpand	%f27,	%f10
	tle	%xcc,	0x1
	fornot1s	%f26,	%f26,	%f14
	edge8ln	%g6,	%i5,	%o7
	tle	%icc,	0x7
	tcc	%xcc,	0x5
	set	0x41, %i3
	lduba	[%l7 + %i3] 0x10,	%l1
	fbg	%fcc3,	loop_1049
	te	%icc,	0x2
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
	tsubcc	%i0,	0x0025,	%g7
loop_1049:
	movrgez	%i2,	0x196,	%l6
	fbge,a	%fcc2,	loop_1051
loop_1050:
	tgu	%icc,	0x0
	udivcc	%o5,	0x008E,	%i1
	fsrc2	%f22,	%f18
loop_1051:
	sub	%l0,	%g1,	%i4
	mulscc	%o4,	0x004B,	%i7
	bl,a	%icc,	loop_1052
	brgez	%l2,	loop_1053
	movle	%xcc,	%o0,	%o2
	udiv	%o3,	0x15B8,	%g4
loop_1052:
	tneg	%icc,	0x5
loop_1053:
	umul	%i6,	0x019B,	%i3
	bl,a,pn	%icc,	loop_1054
	stw	%o1,	[%l7 + 0x08]
	tvc	%icc,	0x4
	movpos	%icc,	%l4,	%g5
loop_1054:
	ta	%icc,	0x3
	smul	%g2,	0x13C5,	%g3
	mulscc	%l5,	%o6,	%l3
	fbge,a	%fcc2,	loop_1055
	fmovdcc	%icc,	%f13,	%f31
	sir	0x1ADC
	lduh	[%l7 + 0x6E],	%g6
loop_1055:
	fmovdpos	%xcc,	%f4,	%f8
	movpos	%xcc,	%i5,	%l1
	sdivx	%i0,	0x1B7C,	%o7
	srl	%i2,	0x00,	%g7
	fnot1s	%f31,	%f30
	bvc	loop_1056
	andncc	%o5,	%l6,	%i1
	array16	%l0,	%g1,	%o4
	fmul8x16	%f18,	%f4,	%f10
loop_1056:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x11,	%i7,	%l2
	nop
	setx loop_1057, %l0, %l1
	jmpl %l1, %o0
	fpadd16s	%f17,	%f6,	%f22
	movl	%icc,	%i4,	%o2
	fbule	%fcc0,	loop_1058
loop_1057:
	for	%f8,	%f24,	%f2
	tgu	%xcc,	0x1
	addccc	%g4,	0x1724,	%i6
loop_1058:
	taddcc	%o3,	0x1AAE,	%o1
	subccc	%l4,	%g5,	%g2
	fmovrslz	%i3,	%f8,	%f4
	tgu	%xcc,	0x5
	nop
	set	0x18, %i0
	std	%f4,	[%l7 + %i0]
	sdivcc	%g3,	0x1A1F,	%l5
	srl	%l3,	%o6,	%i5
	fmuld8sux16	%f29,	%f10,	%f16
	sdiv	%l1,	0x0E2C,	%i0
	movrlez	%g6,	0x176,	%i2
	ldub	[%l7 + 0x79],	%o7
	fmovrdne	%o5,	%f10,	%f4
	sllx	%l6,	0x04,	%g7
	or	%i1,	0x16A5,	%l0
	movrlez	%g1,	%i7,	%o4
	tleu	%xcc,	0x6
	fbu	%fcc0,	loop_1059
	srax	%l2,	%o0,	%o2
	brnz	%i4,	loop_1060
	edge32l	%g4,	%o3,	%i6
loop_1059:
	edge16	%o1,	%l4,	%g5
	udivcc	%g2,	0x0676,	%g3
loop_1060:
	bcc,pt	%icc,	loop_1061
	fmovsl	%xcc,	%f8,	%f15
	fmovrslez	%i3,	%f25,	%f18
	st	%f8,	[%l7 + 0x40]
loop_1061:
	ldd	[%l7 + 0x58],	%l2
	siam	0x6
	brlz,a	%l5,	loop_1062
	fmovrsne	%i5,	%f14,	%f24
	bleu	%icc,	loop_1063
	alignaddr	%l1,	%o6,	%i0
loop_1062:
	addc	%i2,	%g6,	%o7
	fornot2	%f22,	%f18,	%f6
loop_1063:
	fbg	%fcc2,	loop_1064
	fbne,a	%fcc0,	loop_1065
	call	loop_1066
	fpadd16	%f4,	%f14,	%f6
loop_1064:
	ba,pn	%icc,	loop_1067
loop_1065:
	ta	%xcc,	0x1
loop_1066:
	orncc	%l6,	0x0457,	%g7
	fmovrdlez	%o5,	%f16,	%f4
loop_1067:
	nop
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	tle	%xcc,	0x0
	tvc	%icc,	0x5
	set	0x34, %l6
	swapa	[%l7 + %l6] 0x04,	%l0
	subcc	%i1,	0x1ECE,	%g1
	nop
	set	0x4C, %l2
	prefetch	[%l7 + %l2],	 0x0
	sir	0x0260
	tvs	%xcc,	0x5
	tsubcctv	%i7,	%o4,	%l2
	or	%o2,	%i4,	%g4
	edge32ln	%o0,	%i6,	%o3
	alignaddr	%l4,	%g5,	%g2
	brnz,a	%o1,	loop_1068
	sllx	%g3,	%l3,	%l5
	xor	%i3,	%l1,	%o6
	fcmps	%fcc0,	%f31,	%f31
loop_1068:
	bne,pn	%icc,	loop_1069
	popc	%i0,	%i2
	fandnot2s	%f26,	%f9,	%f3
	xor	%g6,	0x0577,	%i5
loop_1069:
	ldstub	[%l7 + 0x30],	%l6
	bleu,a,pn	%xcc,	loop_1070
	umulcc	%o7,	0x1305,	%g7
	srlx	%o5,	0x05,	%l0
	fsrc1	%f0,	%f18
loop_1070:
	umulcc	%i1,	0x0D6E,	%g1
	fnor	%f30,	%f6,	%f12
	taddcctv	%i7,	0x1516,	%o4
	xor	%o2,	%i4,	%g4
	movle	%xcc,	%o0,	%i6
	ba,a,pt	%xcc,	loop_1071
	brz	%o3,	loop_1072
	movvs	%icc,	%l2,	%l4
	tcc	%xcc,	0x0
loop_1071:
	sra	%g5,	%g2,	%g3
loop_1072:
	movvs	%xcc,	%l3,	%l5
	st	%f4,	[%l7 + 0x20]
	fmovsl	%xcc,	%f22,	%f10
	fnor	%f12,	%f4,	%f30
	tneg	%xcc,	0x0
	fmovs	%f26,	%f17
	nop
	set	0x14, %g6
	ldub	[%l7 + %g6],	%i3
	membar	0x40
	fandnot1s	%f31,	%f11,	%f1
	fmovrdlz	%l1,	%f24,	%f10
	tg	%icc,	0x0
	umulcc	%o6,	%i0,	%o1
	fmovsleu	%xcc,	%f28,	%f31
	orncc	%i2,	%g6,	%l6
	sethi	0x054E,	%i5
	bgu,a	%icc,	loop_1073
	andncc	%o7,	%g7,	%l0
	movrgez	%i1,	%o5,	%g1
	tleu	%xcc,	0x0
loop_1073:
	nop
	set	0x7C, %o5
	lduba	[%l7 + %o5] 0x88,	%o4
	nop
	set	0x34, %l3
	ldsw	[%l7 + %l3],	%i7
	fands	%f19,	%f3,	%f3
	movg	%icc,	%i4,	%g4
	fandnot2s	%f2,	%f23,	%f9
	swap	[%l7 + 0x18],	%o2
	movre	%i6,	0x0B8,	%o0
	lduw	[%l7 + 0x44],	%l2
	tsubcc	%o3,	0x10CD,	%g5
	fbule	%fcc2,	loop_1074
	tn	%icc,	0x1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
loop_1074:
	tvc	%xcc,	0x4
	fbu	%fcc3,	loop_1075
	fxors	%f11,	%f25,	%f6
	movge	%icc,	%g3,	%l3
	movg	%xcc,	%l5,	%g2
loop_1075:
	fbne	%fcc1,	loop_1076
	bg,a,pn	%icc,	loop_1077
	tvc	%icc,	0x5
	mova	%xcc,	%l1,	%o6
loop_1076:
	nop
	set	0x28, %g3
	stwa	%i0,	[%l7 + %g3] 0x2b
	membar	#Sync
loop_1077:
	smul	%o1,	0x0DC2,	%i3
	tvs	%icc,	0x3
	addcc	%i2,	0x0823,	%l6
	movneg	%xcc,	%i5,	%g6
	set	0x76, %o1
	lduba	[%l7 + %o1] 0x10,	%g7
	udivx	%o7,	0x10C3,	%l0
	orncc	%i1,	%g1,	%o5
	fexpand	%f11,	%f6
	tsubcc	%i7,	0x1FD7,	%i4
	sethi	0x162A,	%g4
	edge8ln	%o2,	%i6,	%o0
	fbn	%fcc0,	loop_1078
	bvc,pn	%xcc,	loop_1079
	bpos,a	loop_1080
	sir	0x1147
loop_1078:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o4
loop_1079:
	fands	%f8,	%f30,	%f25
loop_1080:
	tvc	%icc,	0x1
	umul	%o3,	%l2,	%g5
	fmovsn	%icc,	%f10,	%f4
	movl	%icc,	%g3,	%l4
	andcc	%l3,	0x1627,	%l5
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x75] %asi,	%g2
	fmovdn	%xcc,	%f1,	%f21
	fones	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l1,	%o6,	%i0
	fpack16	%f20,	%f30
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x46] %asi,	%i3
	edge8n	%o1,	%l6,	%i2
	tcc	%xcc,	0x0
	fandnot2s	%f5,	%f11,	%f3
	movvc	%xcc,	%i5,	%g7
	tcc	%icc,	0x0
	tne	%icc,	0x3
	edge32l	%o7,	%g6,	%i1
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x11,	%g1
	tleu	%icc,	0x6
	ldd	[%l7 + 0x60],	%o4
	andncc	%i7,	%l0,	%g4
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	sdiv	%i6,	0x12B1,	%o0
	edge32	%o4,	%i4,	%o3
	fmovsa	%xcc,	%f10,	%f8
	andcc	%g5,	%g3,	%l2
	movgu	%icc,	%l3,	%l4
	movre	%g2,	%l1,	%l5
	edge16n	%o6,	%i3,	%o1
	edge32ln	%i0,	%l6,	%i2
	nop
	setx	loop_1081,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%g7,	%o7,	%g6
	tcc	%xcc,	0x0
	edge16	%i1,	%g1,	%i5
loop_1081:
	tgu	%xcc,	0x0
	fcmpne16	%f22,	%f26,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x43],	%o5
	mulx	%g4,	%o2,	%i6
	fnot2	%f18,	%f0
	sdivx	%o0,	0x00DF,	%l0
	call	loop_1082
	ldsb	[%l7 + 0x70],	%i4
	bg,a,pt	%xcc,	loop_1083
	fmovsneg	%icc,	%f27,	%f23
loop_1082:
	call	loop_1084
	fone	%f8
loop_1083:
	array8	%o4,	%o3,	%g3
	fmovrse	%g5,	%f25,	%f18
loop_1084:
	tcc	%icc,	0x0
	nop
	set	0x0C, %g1
	ldsh	[%l7 + %g1],	%l2
	set	0x60, %g4
	ldsha	[%l7 + %g4] 0x11,	%l3
	tpos	%xcc,	0x7
	movleu	%icc,	%g2,	%l1
	lduh	[%l7 + 0x20],	%l5
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o6
	te	%icc,	0x4
	movn	%xcc,	%l4,	%o1
	fmovdge	%xcc,	%f11,	%f19
	fpadd32	%f6,	%f14,	%f6
	tsubcc	%i0,	0x0C6B,	%i3
	edge8l	%i2,	%g7,	%l6
	subc	%o7,	0x1B88,	%g6
	ble,a	loop_1085
	st	%f25,	[%l7 + 0x34]
	bleu,a	%xcc,	loop_1086
	tl	%xcc,	0x7
loop_1085:
	movcs	%xcc,	%i1,	%g1
	xor	%i7,	0x0BE7,	%i5
loop_1086:
	nop
	set	0x46, %o2
	stha	%g4,	[%l7 + %o2] 0x81
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o2,	%o5
	movg	%xcc,	%o0,	%l0
	tle	%xcc,	0x3
	swap	[%l7 + 0x20],	%i6
	stx	%i4,	[%l7 + 0x68]
	tle	%xcc,	0x5
	fbul	%fcc2,	loop_1087
	tcs	%icc,	0x7
	bpos,a	loop_1088
	fcmpne32	%f0,	%f10,	%o3
loop_1087:
	fpackfix	%f20,	%f15
	movle	%icc,	%g3,	%g5
loop_1088:
	fmovrde	%o4,	%f2,	%f26
	tsubcc	%l3,	%l2,	%g2
	srlx	%l1,	0x17,	%o6
	movleu	%icc,	%l4,	%o1
	movg	%icc,	%i0,	%i3
	movpos	%xcc,	%i2,	%g7
	movrne	%l6,	0x361,	%l5
	fors	%f11,	%f25,	%f9
	bleu,a	%icc,	loop_1089
	movpos	%icc,	%g6,	%o7
	tcs	%icc,	0x1
	edge32n	%g1,	%i1,	%i5
loop_1089:
	tge	%xcc,	0x2
	set	0x1B, %o7
	lduba	[%l7 + %o7] 0x15,	%i7
	tsubcc	%g4,	0x0B58,	%o5
	andncc	%o2,	%o0,	%i6
	fmovrdlz	%l0,	%f8,	%f8
	stw	%o3,	[%l7 + 0x10]
	move	%icc,	%i4,	%g5
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movn	%xcc,	%o4,	%l3
	subc	%l2,	0x0EB0,	%g3
	pdist	%f8,	%f8,	%f18
	sdiv	%l1,	0x161D,	%g2
	movge	%xcc,	%o6,	%o1
	siam	0x5
	movcs	%icc,	%i0,	%l4
	tl	%icc,	0x3
	srax	%i3,	%i2,	%l6
	tl	%xcc,	0x5
	sdivx	%l5,	0x1D67,	%g7
	fmovrdgez	%g6,	%f2,	%f28
	stb	%g1,	[%l7 + 0x5D]
	fbge	%fcc0,	loop_1090
	pdist	%f20,	%f20,	%f24
	and	%i1,	0x06F6,	%o7
	ta	%icc,	0x1
loop_1090:
	udivcc	%i5,	0x0B5B,	%g4
	movleu	%icc,	%i7,	%o2
	xor	%o0,	0x0669,	%o5
	tn	%icc,	0x3
	xor	%i6,	%o3,	%i4
	te	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f8,	%f20,	%f8
	tl	%xcc,	0x3
	fmovrse	%l0,	%f14,	%f5
	taddcctv	%g5,	0x05EC,	%l3
	sir	0x0AA8
	fmovdcc	%xcc,	%f12,	%f5
	umul	%l2,	%g3,	%l1
	bcc,pt	%xcc,	loop_1091
	fones	%f21
	set	0x58, %o0
	lda	[%l7 + %o0] 0x18,	%f9
loop_1091:
	nop
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x14
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x89
	fbg	%fcc3,	loop_1092
	movcc	%xcc,	%g2,	%o4
	srlx	%o6,	%i0,	%l4
	call	loop_1093
loop_1092:
	fpsub16s	%f18,	%f27,	%f12
	edge32l	%o1,	%i2,	%i3
	movre	%l6,	0x2F6,	%l5
loop_1093:
	tcc	%icc,	0x3
	sdivcc	%g6,	0x1B67,	%g7
	umul	%i1,	0x1062,	%g1
	edge16n	%i5,	%o7,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i7,	%o2,	%o0
	brlez	%o5,	loop_1094
	taddcc	%i6,	%i4,	%l0
	fmovsle	%xcc,	%f3,	%f4
	fmovscc	%xcc,	%f7,	%f10
loop_1094:
	std	%g4,	[%l7 + 0x58]
	fmovsleu	%xcc,	%f13,	%f10
	fbl	%fcc2,	loop_1095
	edge8n	%o3,	%l3,	%g3
	fmovsge	%icc,	%f29,	%f1
	udivx	%l1,	0x1585,	%g2
loop_1095:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l2
	tvc	%icc,	0x7
	bge,a	%icc,	loop_1096
	movrlz	%o6,	%o4,	%i0
	addc	%l4,	0x1023,	%i2
	fcmpne32	%f4,	%f4,	%o1
loop_1096:
	ldsb	[%l7 + 0x3B],	%l6
	ble,a,pn	%xcc,	loop_1097
	addc	%i3,	0x0F9D,	%g6
	movge	%icc,	%g7,	%i1
	fba,a	%fcc2,	loop_1098
loop_1097:
	or	%g1,	%l5,	%i5
	tneg	%xcc,	0x5
	tsubcctv	%o7,	0x10F5,	%g4
loop_1098:
	fsrc1	%f28,	%f22
	nop
	setx loop_1099, %l0, %l1
	jmpl %l1, %o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i7,	%o5,	%i6
	edge32l	%o0,	%i4,	%l0
loop_1099:
	fornot1	%f12,	%f2,	%f24
	edge32	%o3,	%l3,	%g3
	xor	%l1,	%g5,	%l2
	tsubcc	%o6,	0x0003,	%o4
	orcc	%i0,	%g2,	%l4
	umul	%i2,	%l6,	%o1
	fcmps	%fcc2,	%f0,	%f8
	set	0x32, %i6
	stha	%i3,	[%l7 + %i6] 0x2a
	membar	#Sync
	movpos	%icc,	%g6,	%g7
	orn	%g1,	0x1577,	%l5
	brnz,a	%i1,	loop_1100
	movvs	%icc,	%o7,	%g4
	orcc	%o2,	%i5,	%i7
	addccc	%o5,	%i6,	%o0
loop_1100:
	fand	%f4,	%f30,	%f16
	fmovsneg	%icc,	%f29,	%f12
	sdiv	%l0,	0x00FB,	%i4
	fmovrdne	%o3,	%f20,	%f14
	fbl	%fcc0,	loop_1101
	edge16n	%l3,	%g3,	%l1
	fmovdvs	%icc,	%f3,	%f10
	set	0x17, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l2
loop_1101:
	tsubcctv	%o6,	0x0768,	%o4
	taddcctv	%i0,	0x1839,	%g5
	fblg	%fcc0,	loop_1102
	fmovdpos	%xcc,	%f30,	%f24
	edge16n	%l4,	%i2,	%l6
	mova	%xcc,	%g2,	%o1
loop_1102:
	tl	%icc,	0x7
	bcs	%xcc,	loop_1103
	andncc	%i3,	%g7,	%g6
	ldstub	[%l7 + 0x7B],	%g1
	orn	%l5,	0x0067,	%i1
loop_1103:
	sdivcc	%g4,	0x12CB,	%o2
	fbl	%fcc0,	loop_1104
	te	%xcc,	0x2
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x18,	 0x3
loop_1104:
	sdivcc	%i5,	0x10E2,	%i7
	edge32n	%i6,	%o0,	%l0
	wr	%g0,	0x10,	%asi
	stwa	%i4,	[%l7 + 0x24] %asi
	brlz,a	%o3,	loop_1105
	tne	%xcc,	0x4
	sdivx	%o5,	0x0903,	%l3
	movne	%xcc,	%l1,	%g3
loop_1105:
	te	%icc,	0x1
	tle	%icc,	0x0
	tleu	%xcc,	0x0
	tleu	%icc,	0x2
	brnz	%o6,	loop_1106
	tcs	%icc,	0x4
	sdivx	%o4,	0x1C19,	%l2
	bpos,a,pn	%xcc,	loop_1107
loop_1106:
	addc	%i0,	0x1DE3,	%g5
	fnands	%f14,	%f2,	%f2
	bvc,a	loop_1108
loop_1107:
	tvs	%icc,	0x7
	srl	%i2,	0x1C,	%l6
	movpos	%icc,	%l4,	%o1
loop_1108:
	tgu	%icc,	0x6
	andncc	%i3,	%g7,	%g2
	be,a	loop_1109
	movpos	%icc,	%g6,	%g1
	fmovsgu	%icc,	%f17,	%f2
	tsubcc	%l5,	%i1,	%g4
loop_1109:
	umulcc	%o7,	%i5,	%i7
	fmul8x16al	%f7,	%f0,	%f12
	set	0x64, %l1
	stwa	%i6,	[%l7 + %l1] 0xe3
	membar	#Sync
	subccc	%o0,	%o2,	%i4
	andn	%o3,	0x068B,	%l0
	brnz,a	%o5,	loop_1110
	movneg	%icc,	%l1,	%l3
	set	0x65, %i1
	stba	%g3,	[%l7 + %i1] 0x22
	membar	#Sync
loop_1110:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%o4,	%f28,	%f18
	prefetch	[%l7 + 0x48],	 0x0
	subc	%o6,	0x1CEC,	%i0
	stb	%l2,	[%l7 + 0x25]
	sra	%i2,	%l6,	%l4
	fpadd16s	%f26,	%f18,	%f23
	fba	%fcc2,	loop_1111
	tleu	%icc,	0x0
	fmovrdgz	%o1,	%f18,	%f26
	movvc	%icc,	%g5,	%i3
loop_1111:
	tsubcc	%g7,	%g2,	%g1
	fandnot2s	%f27,	%f26,	%f25
	movcc	%xcc,	%l5,	%g6
	subcc	%i1,	0x173C,	%o7
	andncc	%g4,	%i5,	%i6
	bleu,pt	%xcc,	loop_1112
	fbe,a	%fcc2,	loop_1113
	xnorcc	%i7,	%o0,	%o2
	taddcc	%o3,	%l0,	%i4
loop_1112:
	add	%l1,	0x034D,	%o5
loop_1113:
	fmovsgu	%icc,	%f5,	%f22
	array32	%g3,	%l3,	%o6
	fzero	%f30
	fcmpne32	%f2,	%f2,	%i0
	edge16ln	%l2,	%i2,	%o4
	movle	%icc,	%l6,	%l4
	add	%g5,	0x0A4A,	%o1
	addc	%g7,	%i3,	%g2
	edge8ln	%g1,	%g6,	%l5
	fmovdne	%icc,	%f13,	%f5
	movpos	%icc,	%o7,	%g4
	fpadd16	%f26,	%f18,	%f8
	udiv	%i1,	0x07F1,	%i5
	edge16	%i6,	%i7,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o0,	%l0,	%o3
	fpmerge	%f3,	%f19,	%f22
	movrlez	%i4,	0x016,	%l1
	fmovrsgez	%g3,	%f31,	%f7
	srax	%o5,	%o6,	%l3
	sdiv	%i0,	0x1D2E,	%i2
	edge32l	%o4,	%l2,	%l4
	fmovsvc	%xcc,	%f24,	%f5
	movle	%icc,	%l6,	%g5
	taddcc	%o1,	%i3,	%g7
	bcc,pt	%icc,	loop_1114
	fnot2s	%f22,	%f26
	tleu	%icc,	0x3
	tpos	%icc,	0x2
loop_1114:
	move	%xcc,	%g2,	%g1
	membar	0x78
	nop
	setx	loop_1115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%g6,	0x029A,	%l5
	fbu,a	%fcc0,	loop_1116
	edge16l	%g4,	%o7,	%i1
loop_1115:
	nop
	wr	%g0,	0x23,	%asi
	stwa	%i6,	[%l7 + 0x70] %asi
	membar	#Sync
loop_1116:
	tvc	%icc,	0x1
	fbne	%fcc3,	loop_1117
	fmovdvs	%icc,	%f27,	%f2
	set	0x46, %i5
	ldsba	[%l7 + %i5] 0x10,	%i7
loop_1117:
	umul	%i5,	0x09A7,	%o0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x3C] %asi,	%o2
	fpackfix	%f26,	%f23
	fbl	%fcc0,	loop_1118
	fnot1	%f8,	%f18
	or	%o3,	%i4,	%l1
	fmovdg	%icc,	%f29,	%f5
loop_1118:
	fblg,a	%fcc1,	loop_1119
	xorcc	%g3,	%l0,	%o6
	fcmped	%fcc3,	%f0,	%f26
	movre	%o5,	0x083,	%l3
loop_1119:
	fornot2	%f18,	%f4,	%f14
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x19,	%f0
	set	0x38, %o3
	lda	[%l7 + %o3] 0x81,	%f12
	edge16	%i2,	%o4,	%l2
	edge32ln	%l4,	%i0,	%l6
	movrgez	%g5,	%o1,	%g7
	subc	%i3,	0x088B,	%g1
	fnot1s	%f7,	%f21
	sdivcc	%g2,	0x1721,	%g6
	te	%xcc,	0x1
	fpsub16s	%f23,	%f13,	%f11
	udiv	%l5,	0x16E5,	%g4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x24] %asi,	%o7
	wr	%g0,	0xea,	%asi
	stha	%i1,	[%l7 + 0x16] %asi
	membar	#Sync
	bvc,pn	%xcc,	loop_1120
	andcc	%i7,	0x1CA2,	%i6
	brlz,a	%i5,	loop_1121
	fba	%fcc2,	loop_1122
loop_1120:
	tle	%icc,	0x6
	edge8ln	%o2,	%o0,	%i4
loop_1121:
	edge16	%l1,	%o3,	%l0
loop_1122:
	sub	%o6,	%g3,	%o5
	array8	%i2,	%o4,	%l3
	bpos	loop_1123
	tg	%icc,	0x7
	fble,a	%fcc0,	loop_1124
	movrgez	%l2,	0x3AE,	%l4
loop_1123:
	fmovda	%xcc,	%f31,	%f14
	set	0x08, %i4
	stxa	%l6,	[%l7 + %i4] 0xe2
	membar	#Sync
loop_1124:
	st	%f11,	[%l7 + 0x5C]
	tleu	%icc,	0x7
	edge32n	%g5,	%i0,	%o1
	tne	%icc,	0x3
	edge16n	%g7,	%i3,	%g2
	fcmpeq16	%f0,	%f18,	%g1
	brz	%g6,	loop_1125
	tsubcctv	%l5,	0x16F9,	%o7
	udivcc	%i1,	0x0363,	%g4
	edge32n	%i7,	%i5,	%o2
loop_1125:
	sub	%o0,	%i4,	%i6
	mulscc	%l1,	%o3,	%o6
	movn	%icc,	%l0,	%o5
	swap	[%l7 + 0x30],	%i2
	fmovdl	%icc,	%f19,	%f18
	fbul	%fcc1,	loop_1126
	array32	%o4,	%g3,	%l2
	tcs	%icc,	0x1
	fbug	%fcc3,	loop_1127
loop_1126:
	ldsw	[%l7 + 0x34],	%l4
	fxnors	%f13,	%f21,	%f3
	fpackfix	%f26,	%f4
loop_1127:
	sth	%l3,	[%l7 + 0x1E]
	movrlz	%g5,	0x2C2,	%l6
	smul	%o1,	%i0,	%i3
	movn	%xcc,	%g2,	%g1
	ldx	[%l7 + 0x48],	%g6
	move	%icc,	%g7,	%l5
	edge16n	%o7,	%g4,	%i1
	bcs,a	%icc,	loop_1128
	movpos	%icc,	%i5,	%i7
	movvc	%xcc,	%o0,	%i4
	move	%xcc,	%i6,	%l1
loop_1128:
	fcmple32	%f4,	%f0,	%o2
	movleu	%icc,	%o6,	%o3
	swap	[%l7 + 0x2C],	%l0
	smul	%o5,	0x0C32,	%o4
	tpos	%icc,	0x5
	brgez,a	%g3,	loop_1129
	edge16l	%i2,	%l2,	%l4
	add	%l3,	0x0A0A,	%g5
	edge16n	%o1,	%l6,	%i3
loop_1129:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i0
	nop
	setx loop_1130, %l0, %l1
	jmpl %l1, %g2
	sdiv	%g1,	0x0637,	%g6
	tne	%xcc,	0x7
	fcmpes	%fcc3,	%f31,	%f3
loop_1130:
	fbue	%fcc2,	loop_1131
	ldub	[%l7 + 0x2E],	%g7
	fpadd32s	%f1,	%f13,	%f30
	fmovrdlz	%l5,	%f28,	%f4
loop_1131:
	andncc	%o7,	%g4,	%i5
	orn	%i1,	%o0,	%i4
	mulx	%i7,	%l1,	%o2
	prefetch	[%l7 + 0x34],	 0x3
	taddcc	%i6,	%o3,	%o6
	movn	%xcc,	%l0,	%o5
	movrgez	%o4,	%i2,	%l2
	fornot2	%f24,	%f18,	%f0
	nop
	setx	loop_1132,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%xcc,	%g3,	%l3
	smulcc	%g5,	%l4,	%o1
	lduh	[%l7 + 0x32],	%l6
loop_1132:
	sub	%i3,	%g2,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i0,	%g6,	%g7
	fexpand	%f15,	%f10
	fmul8ulx16	%f16,	%f10,	%f30
	fornot2s	%f21,	%f0,	%f31
	ldx	[%l7 + 0x38],	%l5
	sdiv	%g4,	0x0F88,	%i5
	tge	%icc,	0x2
	srl	%i1,	0x1D,	%o7
	fands	%f2,	%f30,	%f6
	sdiv	%i4,	0x0138,	%o0
	smulcc	%l1,	0x1825,	%o2
	udivcc	%i7,	0x013E,	%i6
	nop
	setx	loop_1133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%o3,	%o6,	%o5
	movrlez	%o4,	0x087,	%i2
	sdivcc	%l2,	0x1F00,	%l0
loop_1133:
	fcmpne32	%f18,	%f22,	%l3
	edge32ln	%g5,	%g3,	%o1
	taddcc	%l6,	0x0D7F,	%i3
	or	%l4,	0x1154,	%g2
	edge8l	%g1,	%g6,	%g7
	membar	0x2E
	sllx	%i0,	%g4,	%i5
	edge16	%i1,	%o7,	%i4
	fmovrsgz	%l5,	%f8,	%f19
	movneg	%icc,	%l1,	%o2
	call	loop_1134
	tg	%icc,	0x2
	bge,a,pt	%icc,	loop_1135
	mulscc	%i7,	0x060C,	%i6
loop_1134:
	bge,a	%xcc,	loop_1136
	and	%o0,	0x1A79,	%o6
loop_1135:
	and	%o3,	%o4,	%i2
	movcs	%xcc,	%l2,	%l0
loop_1136:
	movrlz	%l3,	0x0FB,	%g5
	move	%xcc,	%o5,	%g3
	andcc	%o1,	%l6,	%l4
	taddcctv	%i3,	%g1,	%g2
	fmovsvc	%icc,	%f12,	%f0
	add	%g7,	%i0,	%g6
	xnor	%g4,	%i1,	%i5
	movvc	%icc,	%i4,	%o7
	mulx	%l5,	0x144D,	%l1
	andcc	%o2,	0x1E77,	%i6
	fpsub16s	%f9,	%f13,	%f2
	edge32l	%i7,	%o6,	%o0
	fmovdn	%icc,	%f19,	%f0
	stb	%o3,	[%l7 + 0x27]
	edge32ln	%i2,	%o4,	%l0
	fsrc2s	%f22,	%f20
	bge,a,pt	%icc,	loop_1137
	bge	loop_1138
	tge	%icc,	0x6
	smul	%l2,	0x154B,	%g5
loop_1137:
	nop
	set	0x38, %o4
	lduh	[%l7 + %o4],	%l3
loop_1138:
	tvs	%icc,	0x7
	fmovdg	%icc,	%f4,	%f5
	fnor	%f26,	%f12,	%f6
	fbul,a	%fcc1,	loop_1139
	fbl	%fcc0,	loop_1140
	mulx	%o5,	%o1,	%g3
	mulx	%l6,	%l4,	%i3
loop_1139:
	te	%icc,	0x6
loop_1140:
	fmovde	%icc,	%f26,	%f9
	brlez	%g2,	loop_1141
	edge16ln	%g1,	%i0,	%g6
	array16	%g7,	%g4,	%i1
	mulx	%i4,	0x16E6,	%o7
loop_1141:
	fcmpgt32	%f14,	%f2,	%l5
	addcc	%i5,	0x16FB,	%l1
	tcs	%icc,	0x7
	edge16l	%i6,	%o2,	%i7
	std	%o0,	[%l7 + 0x68]
	nop
	setx	loop_1142,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%o3,	0x047B,	%i2
	swap	[%l7 + 0x34],	%o6
	tg	%icc,	0x4
loop_1142:
	taddcctv	%o4,	%l0,	%g5
	fmovsvs	%xcc,	%f26,	%f17
	fand	%f0,	%f30,	%f18
	sdivcc	%l3,	0x0DAE,	%l2
	set	0x6C, %i2
	lduwa	[%l7 + %i2] 0x10,	%o1
	ta	%icc,	0x6
	wr	%g0,	0x11,	%asi
	stda	%g2,	[%l7 + 0x08] %asi
	tvs	%xcc,	0x1
	array16	%l6,	%o5,	%i3
	flush	%l7 + 0x50
	fbug,a	%fcc3,	loop_1143
	movcs	%xcc,	%l4,	%g2
	movrlez	%i0,	%g1,	%g7
	fbl	%fcc1,	loop_1144
loop_1143:
	sdiv	%g6,	0x13C9,	%g4
	fcmps	%fcc3,	%f26,	%f9
	movvs	%icc,	%i4,	%i1
loop_1144:
	xor	%l5,	%o7,	%i5
	wr	%g0,	0x27,	%asi
	stwa	%i6,	[%l7 + 0x08] %asi
	membar	#Sync
	sllx	%o2,	%i7,	%l1
	tcc	%icc,	0x3
	ble,a	loop_1145
	brgz	%o0,	loop_1146
	ldsw	[%l7 + 0x38],	%o3
	tvs	%xcc,	0x1
loop_1145:
	tvs	%xcc,	0x7
loop_1146:
	fxor	%f28,	%f12,	%f0
	fmovdcs	%xcc,	%f21,	%f21
	fcmple16	%f28,	%f16,	%i2
	edge16	%o4,	%o6,	%l0
	wr	%g0,	0x18,	%asi
	stxa	%l3,	[%l7 + 0x08] %asi
	tsubcc	%l2,	%g5,	%g3
	movvs	%xcc,	%l6,	%o5
	edge16ln	%i3,	%o1,	%l4
	and	%g2,	0x14E1,	%i0
	fbe	%fcc1,	loop_1147
	edge32ln	%g1,	%g6,	%g7
	movne	%icc,	%i4,	%i1
	andcc	%g4,	0x0631,	%l5
loop_1147:
	fnands	%f1,	%f0,	%f15
	ldd	[%l7 + 0x30],	%i4
	edge16ln	%i6,	%o7,	%o2
	edge32l	%l1,	%o0,	%i7
	mulscc	%i2,	0x1236,	%o4
	stx	%o6,	[%l7 + 0x50]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l0
	fmul8sux16	%f22,	%f14,	%f26
	fbul,a	%fcc0,	loop_1148
	movn	%xcc,	%o3,	%l3
	movle	%xcc,	%g5,	%l2
	brz,a	%l6,	loop_1149
loop_1148:
	xnorcc	%o5,	%g3,	%i3
	srlx	%o1,	%g2,	%l4
	addc	%g1,	0x08FB,	%g6
loop_1149:
	edge8	%g7,	%i0,	%i1
	call	loop_1150
	srax	%i4,	0x07,	%g4
	fones	%f13
	edge32n	%l5,	%i5,	%i6
loop_1150:
	fbg	%fcc0,	loop_1151
	sdivcc	%o2,	0x07FC,	%l1
	fand	%f26,	%f16,	%f18
	fnor	%f22,	%f28,	%f0
loop_1151:
	nop
	wr	%g0,	0x10,	%asi
	stba	%o7,	[%l7 + 0x42] %asi
	ta	%xcc,	0x6
	tcc	%xcc,	0x7
	fmovsge	%xcc,	%f20,	%f2
	wr	%g0,	0xe3,	%asi
	stda	%i6,	[%l7 + 0x30] %asi
	membar	#Sync
	alignaddr	%o0,	%o4,	%o6
	srax	%l0,	0x1A,	%i2
	array8	%l3,	%g5,	%l2
	tsubcc	%o3,	%l6,	%o5
	set	0x10, %g7
	lduwa	[%l7 + %g7] 0x0c,	%i3
	set	0x68, %i0
	stwa	%o1,	[%l7 + %i0] 0x89
	stw	%g3,	[%l7 + 0x5C]
	movpos	%icc,	%l4,	%g1
	srl	%g6,	0x0D,	%g7
	membar	0x25
	movne	%icc,	%g2,	%i1
	movgu	%xcc,	%i0,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	%xcc,	loop_1152
	fbu	%fcc1,	loop_1153
	movpos	%icc,	%l5,	%i5
	movrne	%i4,	0x29C,	%i6
loop_1152:
	alignaddrl	%o2,	%o7,	%l1
loop_1153:
	movge	%icc,	%o0,	%i7
	udivcc	%o4,	0x0303,	%o6
	movrgez	%i2,	%l3,	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g5,	%l2
	movrne	%o3,	%o5,	%i3
	stb	%l6,	[%l7 + 0x0F]
	fcmple16	%f20,	%f18,	%g3
	subcc	%l4,	0x0AB7,	%g1
	tg	%xcc,	0x6
	array16	%g6,	%g7,	%o1
	tge	%icc,	0x6
	alignaddr	%g2,	%i0,	%g4
	movleu	%xcc,	%i1,	%l5
	fsrc1s	%f13,	%f26
	bneg,a,pt	%icc,	loop_1154
	fnand	%f16,	%f14,	%f28
	sdiv	%i5,	0x0D36,	%i4
	addc	%o2,	%i6,	%l1
loop_1154:
	mulscc	%o7,	%o0,	%i7
	mulscc	%o4,	0x033B,	%i2
	fmul8ulx16	%f18,	%f30,	%f22
	fsrc2	%f16,	%f10
	sllx	%o6,	0x05,	%l3
	nop
	setx	loop_1155,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs,a,pn	%icc,	loop_1156
	fmovsle	%xcc,	%f21,	%f4
	std	%l0,	[%l7 + 0x58]
loop_1155:
	xor	%l2,	%g5,	%o5
loop_1156:
	tn	%xcc,	0x6
	ldstub	[%l7 + 0x78],	%o3
	nop
	setx loop_1157, %l0, %l1
	jmpl %l1, %i3
	addccc	%g3,	%l6,	%g1
	array32	%g6,	%g7,	%o1
	tl	%icc,	0x7
loop_1157:
	fpadd16s	%f26,	%f25,	%f2
	fmovrslz	%g2,	%f30,	%f15
	movvc	%xcc,	%l4,	%i0
	pdist	%f12,	%f4,	%f18
	fmuld8sux16	%f23,	%f27,	%f2
	sllx	%g4,	%i1,	%i5
	edge32n	%l5,	%o2,	%i4
	wr	%g0,	0xe3,	%asi
	stha	%l1,	[%l7 + 0x2C] %asi
	membar	#Sync
	set	0x18, %i3
	lduha	[%l7 + %i3] 0x89,	%i6
	fbul	%fcc1,	loop_1158
	umulcc	%o7,	0x1152,	%i7
	orcc	%o4,	0x11F2,	%o0
	ta	%icc,	0x6
loop_1158:
	fbue	%fcc1,	loop_1159
	fmovrslz	%o6,	%f27,	%f15
	sdivx	%l3,	0x0F77,	%i2
	bcs,pt	%xcc,	loop_1160
loop_1159:
	tsubcctv	%l0,	0x00B3,	%l2
	ble,pt	%icc,	loop_1161
	fandnot1s	%f28,	%f17,	%f7
loop_1160:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o5,	%g5,	%i3
loop_1161:
	fbue	%fcc1,	loop_1162
	fcmps	%fcc1,	%f21,	%f15
	fand	%f26,	%f2,	%f8
	orncc	%g3,	0x1A87,	%o3
loop_1162:
	umulcc	%l6,	0x0652,	%g6
	tne	%icc,	0x3
	subcc	%g7,	%o1,	%g1
	stb	%l4,	[%l7 + 0x30]
	addc	%g2,	0x081E,	%i0
	edge8	%i1,	%g4,	%l5
	set	0x18, %o6
	ldxa	[%g0 + %o6] 0x50,	%o2
	srlx	%i4,	%l1,	%i5
	set	0x3C, %l6
	lduha	[%l7 + %l6] 0x10,	%i6
	andn	%o7,	0x0DCA,	%i7
	xnorcc	%o4,	%o0,	%l3
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x18] %asi,	%f6
	srax	%i2,	0x1D,	%l0
	edge16l	%l2,	%o5,	%o6
	sra	%i3,	0x12,	%g3
	set	0x14, %g6
	lduwa	[%l7 + %g6] 0x10,	%g5
	fpack16	%f26,	%f21
	movge	%xcc,	%o3,	%g6
	fmovdn	%icc,	%f3,	%f6
	be,a,pn	%xcc,	loop_1163
	edge16l	%g7,	%o1,	%g1
	sll	%l4,	0x03,	%g2
	brgez	%l6,	loop_1164
loop_1163:
	tvc	%icc,	0x3
	bge,a	loop_1165
	sdivcc	%i0,	0x105F,	%i1
loop_1164:
	alignaddr	%g4,	%l5,	%i4
	fzero	%f24
loop_1165:
	movl	%xcc,	%o2,	%i5
	tleu	%xcc,	0x4
	stx	%l1,	[%l7 + 0x38]
	ldx	[%l7 + 0x40],	%o7
	ble	loop_1166
	ldsh	[%l7 + 0x66],	%i7
	and	%i6,	0x0F8C,	%o4
	fmovsneg	%icc,	%f12,	%f22
loop_1166:
	fpmerge	%f15,	%f5,	%f2
	edge8ln	%l3,	%i2,	%l0
	fcmple16	%f26,	%f0,	%l2
	edge8ln	%o0,	%o6,	%o5
	nop
	setx	loop_1167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1s	%f14,	%f25,	%f18
	sra	%g3,	%g5,	%i3
	set	0x46, %o5
	lduha	[%l7 + %o5] 0x14,	%g6
loop_1167:
	fpackfix	%f16,	%f23
	movl	%xcc,	%o3,	%g7
	edge32n	%o1,	%g1,	%l4
	mulx	%l6,	0x117F,	%g2
	movrgz	%i1,	0x29C,	%i0
	sllx	%l5,	%g4,	%i4
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x80,	%o2
	fbl,a	%fcc1,	loop_1168
	be	%icc,	loop_1169
	fcmple32	%f24,	%f28,	%i5
	edge16ln	%o7,	%l1,	%i7
loop_1168:
	fble	%fcc1,	loop_1170
loop_1169:
	fbue	%fcc2,	loop_1171
	movcs	%xcc,	%o4,	%l3
	sllx	%i2,	0x11,	%l0
loop_1170:
	nop
	setx loop_1172, %l0, %l1
	jmpl %l1, %i6
loop_1171:
	fpsub16	%f4,	%f0,	%f0
	edge16n	%o0,	%o6,	%o5
	brlez	%l2,	loop_1173
loop_1172:
	fcmpgt32	%f14,	%f2,	%g5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%i3
loop_1173:
	fmul8x16al	%f17,	%f24,	%f26
	tn	%icc,	0x7
	fmovdleu	%xcc,	%f0,	%f19
	edge8l	%g6,	%g7,	%o1
	movg	%icc,	%g1,	%l4
	fmul8sux16	%f16,	%f20,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l6,	%o3,	%g2
	fmul8ulx16	%f10,	%f10,	%f24
	fmovrse	%i1,	%f13,	%f5
	popc	0x1740,	%l5
	pdist	%f26,	%f24,	%f30
	andn	%i0,	%i4,	%g4
	mova	%xcc,	%o2,	%o7
	fbo,a	%fcc2,	loop_1174
	tl	%icc,	0x7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x0c,	%i5,	%l1
loop_1174:
	tg	%icc,	0x4
	edge8n	%o4,	%i7,	%i2
	udiv	%l0,	0x0146,	%l3
	subccc	%i6,	%o0,	%o6
	wr	%g0,	0x89,	%asi
	sta	%f11,	[%l7 + 0x70] %asi
	edge16n	%l2,	%o5,	%g5
	movre	%i3,	%g6,	%g7
	movne	%icc,	%g3,	%o1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	umul	%l4,	%l6,	%o3
	edge16ln	%g2,	%i1,	%l5
	tvc	%icc,	0x4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x6C] %asi,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g1,	0x11B9,	%i4
	edge16l	%g4,	%o2,	%i0
	tge	%xcc,	0x2
	fpadd16s	%f26,	%f18,	%f28
	fbn	%fcc0,	loop_1175
	xnorcc	%i5,	%o7,	%l1
	fpsub32s	%f17,	%f6,	%f14
	fbne,a	%fcc3,	loop_1176
loop_1175:
	movgu	%xcc,	%i7,	%o4
	fpadd32	%f0,	%f6,	%f2
	tle	%icc,	0x3
loop_1176:
	fpack32	%f4,	%f8,	%f2
	fmovrsgez	%l0,	%f0,	%f17
	fnot1s	%f13,	%f18
	fmovrdgz	%l3,	%f4,	%f26
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x47] %asi,	%i6
	movcc	%icc,	%i2,	%o0
	fmovrdlz	%l2,	%f26,	%f20
	std	%o6,	[%l7 + 0x40]
	movle	%xcc,	%g5,	%o5
	movge	%icc,	%i3,	%g6
	tgu	%icc,	0x0
	stx	%g3,	[%l7 + 0x20]
	xnorcc	%g7,	%o1,	%l4
	xor	%l6,	%o3,	%i1
	fands	%f2,	%f26,	%f3
	wr	%g0,	0x2f,	%asi
	stda	%l4,	[%l7 + 0x68] %asi
	membar	#Sync
	fornot2s	%f12,	%f25,	%f19
	smulcc	%g1,	0x1A6F,	%g2
	faligndata	%f12,	%f26,	%f12
	fsrc1s	%f28,	%f14
	fbug,a	%fcc0,	loop_1177
	taddcctv	%g4,	%i4,	%i0
	fbuge,a	%fcc1,	loop_1178
	bcc,a	loop_1179
loop_1177:
	andcc	%o2,	0x04B9,	%i5
	addccc	%o7,	%l1,	%o4
loop_1178:
	nop
	set	0x5C, %l3
	sta	%f27,	[%l7 + %l3] 0x14
loop_1179:
	taddcc	%i7,	%l3,	%l0
	pdist	%f14,	%f26,	%f10
	movge	%icc,	%i2,	%i6
	movrlz	%o0,	0x15A,	%l2
	fble,a	%fcc1,	loop_1180
	movcc	%icc,	%o6,	%g5
	ta	%xcc,	0x5
	taddcctv	%i3,	0x1131,	%o5
loop_1180:
	sdivcc	%g3,	0x1DE0,	%g7
	brgz	%g6,	loop_1181
	bcc,a	loop_1182
	fandnot2	%f10,	%f10,	%f10
	sdiv	%o1,	0x15BC,	%l6
loop_1181:
	movrgez	%l4,	%o3,	%l5
loop_1182:
	bcc	loop_1183
	movvs	%icc,	%g1,	%i1
	fmovrdne	%g4,	%f16,	%f14
	tle	%icc,	0x0
loop_1183:
	edge8	%i4,	%i0,	%g2
	fpsub16	%f0,	%f24,	%f22
	bge,a	%icc,	loop_1184
	tg	%icc,	0x5
	mulx	%i5,	0x0473,	%o2
	xnor	%o7,	%o4,	%i7
loop_1184:
	tne	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	edge32l	%l0,	%l3,	%i6
	fmovscc	%icc,	%f28,	%f23
	addcc	%o0,	%i2,	%o6
	faligndata	%f20,	%f14,	%f18
	fpsub32	%f0,	%f4,	%f0
	fmovrsne	%l2,	%f4,	%f5
	array8	%g5,	%o5,	%i3
	faligndata	%f10,	%f24,	%f26
	tleu	%icc,	0x4
	and	%g3,	%g6,	%g7
	lduh	[%l7 + 0x16],	%l6
	fbuge	%fcc2,	loop_1185
	edge8	%l4,	%o1,	%l5
	array16	%g1,	%o3,	%g4
	sub	%i4,	%i1,	%g2
loop_1185:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%i4,	[%l7 + 0x10] %asi
	sra	%o2,	0x05,	%o7
	sra	%i0,	0x17,	%o4
	movneg	%xcc,	%i7,	%l1
	fmovsl	%xcc,	%f15,	%f19
	call	loop_1186
	tneg	%xcc,	0x0
	or	%l0,	%l3,	%i6
	fmovsgu	%icc,	%f1,	%f12
loop_1186:
	fpack16	%f26,	%f31
	fbuge,a	%fcc1,	loop_1187
	fcmpeq16	%f8,	%f10,	%o0
	brlz,a	%i2,	loop_1188
	srlx	%l2,	0x07,	%o6
loop_1187:
	fcmple16	%f14,	%f10,	%o5
	taddcctv	%i3,	0x04A1,	%g3
loop_1188:
	fxnor	%f16,	%f20,	%f18
	edge16	%g6,	%g7,	%g5
	array32	%l4,	%o1,	%l5
	tvc	%xcc,	0x5
	brz	%g1,	loop_1189
	ba,pn	%icc,	loop_1190
	movrlz	%l6,	0x102,	%o3
	fbe	%fcc1,	loop_1191
loop_1189:
	pdist	%f2,	%f6,	%f12
loop_1190:
	tcc	%icc,	0x5
	andcc	%i4,	0x190E,	%g4
loop_1191:
	srlx	%g2,	0x1F,	%i1
	addc	%o2,	%i5,	%i0
	sra	%o4,	0x04,	%o7
	stx	%i7,	[%l7 + 0x30]
	movrne	%l1,	%l3,	%l0
	fpadd16s	%f16,	%f9,	%f18
	fbne,a	%fcc2,	loop_1192
	xnorcc	%o0,	%i6,	%i2
	edge8n	%o6,	%l2,	%i3
	umul	%o5,	%g3,	%g6
loop_1192:
	edge8n	%g5,	%g7,	%l4
	array8	%l5,	%o1,	%l6
	sethi	0x02A8,	%g1
	fmovsneg	%icc,	%f4,	%f24
	faligndata	%f24,	%f28,	%f8
	move	%icc,	%o3,	%g4
	udivx	%i4,	0x1A5A,	%i1
	edge16l	%o2,	%i5,	%i0
	fmovdle	%icc,	%f2,	%f23
	bleu,a	%icc,	loop_1193
	tl	%icc,	0x4
	tcs	%xcc,	0x3
	fnands	%f2,	%f29,	%f15
loop_1193:
	subccc	%g2,	0x07F9,	%o4
	ldsh	[%l7 + 0x3C],	%o7
	tvs	%xcc,	0x1
	fxnors	%f18,	%f7,	%f7
	fmovsvs	%icc,	%f24,	%f24
	fcmple16	%f24,	%f28,	%l1
	edge8	%i7,	%l0,	%o0
	andncc	%l3,	%i6,	%i2
	fpadd16s	%f22,	%f5,	%f21
	std	%f8,	[%l7 + 0x30]
	fbue,a	%fcc2,	loop_1194
	ldstub	[%l7 + 0x40],	%o6
	popc	0x0F51,	%i3
	brnz	%o5,	loop_1195
loop_1194:
	fandnot2	%f24,	%f10,	%f12
	tcc	%icc,	0x1
	fnors	%f22,	%f19,	%f6
loop_1195:
	taddcc	%g3,	0x10CE,	%l2
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x24,	%g6
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sethi	0x01F3,	%g7
	sll	%g5,	%l5,	%o1
	fcmpgt16	%f24,	%f18,	%l4
	array32	%l6,	%g1,	%o3
	move	%xcc,	%i4,	%g4
	sethi	0x0A09,	%i1
	array16	%i5,	%i0,	%g2
	smulcc	%o4,	0x07E7,	%o7
	tgu	%icc,	0x4
	edge32n	%l1,	%i7,	%l0
	subccc	%o2,	0x13DA,	%l3
	fsrc1s	%f3,	%f28
	fblg	%fcc0,	loop_1196
	movne	%xcc,	%o0,	%i2
	fmovsle	%icc,	%f0,	%f18
	tn	%xcc,	0x0
loop_1196:
	bcs	%icc,	loop_1197
	stw	%i6,	[%l7 + 0x4C]
	fble	%fcc0,	loop_1198
	ld	[%l7 + 0x44],	%f22
loop_1197:
	and	%i3,	0x19BA,	%o6
	fmovscc	%xcc,	%f2,	%f10
loop_1198:
	movcc	%icc,	%o5,	%l2
	fbu,a	%fcc2,	loop_1199
	srax	%g6,	%g7,	%g5
	fbule,a	%fcc2,	loop_1200
	addcc	%g3,	0x0933,	%l5
loop_1199:
	edge32n	%o1,	%l4,	%g1
	fbo,a	%fcc1,	loop_1201
loop_1200:
	move	%xcc,	%l6,	%i4
	xnorcc	%o3,	0x06E6,	%g4
	movg	%xcc,	%i1,	%i0
loop_1201:
	nop
	set	0x38, %l4
	std	%i4,	[%l7 + %l4]
	sub	%o4,	%o7,	%l1
	ta	%icc,	0x6
	tn	%icc,	0x0
	te	%xcc,	0x3
	movn	%icc,	%g2,	%i7
	movgu	%icc,	%o2,	%l3
	xnor	%l0,	0x0181,	%i2
	movleu	%icc,	%o0,	%i3
	fzeros	%f21
	and	%i6,	%o6,	%l2
	sir	0x13BA
	faligndata	%f10,	%f8,	%f16
	fbg,a	%fcc2,	loop_1202
	membar	0x0B
	movrne	%o5,	0x15B,	%g7
	fmuld8ulx16	%f12,	%f22,	%f18
loop_1202:
	movrne	%g5,	%g6,	%l5
	movl	%icc,	%g3,	%l4
	xnorcc	%g1,	0x1281,	%o1
	addccc	%i4,	%l6,	%g4
	ble,a,pn	%icc,	loop_1203
	brgz,a	%i1,	loop_1204
	edge32l	%o3,	%i0,	%i5
	movne	%xcc,	%o7,	%o4
loop_1203:
	fmovsg	%icc,	%f22,	%f8
loop_1204:
	fmovdcc	%icc,	%f31,	%f25
	set	0x18, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0x3
	sdiv	%g2,	0x07D4,	%i7
	edge16l	%l3,	%o2,	%l0
	ldub	[%l7 + 0x2F],	%i2
	fmovrsne	%i3,	%f28,	%f6
	tleu	%icc,	0x6
	tvs	%xcc,	0x0
	brz,a	%i6,	loop_1205
	fcmple16	%f6,	%f8,	%o0
	fandnot1	%f20,	%f20,	%f18
	xorcc	%o6,	0x0E4C,	%l2
loop_1205:
	movrne	%g7,	0x0D9,	%o5
	movleu	%icc,	%g5,	%l5
	array32	%g3,	%g6,	%l4
	siam	0x7
	orn	%o1,	0x0662,	%g1
	fpadd16	%f10,	%f28,	%f22
	edge32n	%l6,	%g4,	%i1
	edge8	%i4,	%o3,	%i0
	tneg	%xcc,	0x0
	tn	%xcc,	0x3
	fcmpeq32	%f26,	%f6,	%o7
	nop
	set	0x55, %g4
	ldub	[%l7 + %g4],	%i5
	wr	%g0,	0x04,	%asi
	stda	%l0,	[%l7 + 0x50] %asi
	subc	%g2,	0x055D,	%o4
	fmovsne	%xcc,	%f29,	%f20
	taddcctv	%l3,	%o2,	%i7
	edge8l	%l0,	%i2,	%i3
	edge32	%o0,	%o6,	%l2
	smul	%g7,	0x027A,	%o5
	fpsub32s	%f27,	%f13,	%f26
	move	%xcc,	%i6,	%g5
	edge16n	%l5,	%g6,	%g3
	bcc,a,pt	%xcc,	loop_1206
	bne,a	%icc,	loop_1207
	mulx	%o1,	%g1,	%l4
	edge32n	%l6,	%g4,	%i4
loop_1206:
	tg	%icc,	0x7
loop_1207:
	nop
	wr	%g0,	0xeb,	%asi
	stda	%o2,	[%l7 + 0x20] %asi
	membar	#Sync
	tcs	%icc,	0x3
	srax	%i0,	0x12,	%o7
	edge32ln	%i5,	%i1,	%g2
	sra	%l1,	0x01,	%o4
	umulcc	%o2,	0x17F1,	%l3
	xnor	%l0,	%i7,	%i3
	fbge	%fcc1,	loop_1208
	fble,a	%fcc1,	loop_1209
	brz,a	%o0,	loop_1210
	movre	%i2,	%l2,	%g7
loop_1208:
	fxnor	%f10,	%f8,	%f24
loop_1209:
	xnor	%o5,	%i6,	%o6
loop_1210:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc1,	loop_1211
	tneg	%xcc,	0x7
	fbge,a	%fcc1,	loop_1212
	swap	[%l7 + 0x34],	%g5
loop_1211:
	umul	%l5,	0x16B8,	%g6
	sdivcc	%o1,	0x120E,	%g1
loop_1212:
	fmovrslez	%l4,	%f25,	%f16
	movneg	%icc,	%l6,	%g4
	fmovrslez	%g3,	%f19,	%f8
	movrlz	%i4,	%i0,	%o3
	tcs	%xcc,	0x1
	taddcctv	%i5,	0x1FF2,	%o7
	fxors	%f21,	%f15,	%f7
	movcs	%icc,	%i1,	%g2
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x16,	%f0
	taddcc	%o4,	%o2,	%l1
	edge32ln	%l3,	%l0,	%i7
	addc	%i3,	0x1852,	%i2
	lduw	[%l7 + 0x34],	%o0
	fba,a	%fcc2,	loop_1213
	tpos	%icc,	0x4
	orn	%g7,	0x094D,	%o5
	srl	%l2,	%i6,	%g5
loop_1213:
	edge8ln	%l5,	%g6,	%o1
	fbge	%fcc1,	loop_1214
	fabss	%f19,	%f17
	udivx	%g1,	0x01B5,	%o6
	brgez,a	%l6,	loop_1215
loop_1214:
	fpsub32	%f26,	%f20,	%f18
	movrne	%l4,	%g4,	%i4
	tvc	%icc,	0x7
loop_1215:
	movrgz	%i0,	0x3E4,	%o3
	udivx	%g3,	0x1C0C,	%i5
	tl	%icc,	0x5
	tl	%icc,	0x0
	add	%o7,	%g2,	%o4
	move	%icc,	%o2,	%l1
	nop
	set	0x6C, %o7
	ldsw	[%l7 + %o7],	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pt	%xcc,	loop_1216
	fsrc2s	%f2,	%f17
	umulcc	%l3,	%i7,	%i3
	fnot1s	%f18,	%f28
loop_1216:
	fpadd32s	%f13,	%f6,	%f18
	ldsw	[%l7 + 0x44],	%i2
	sethi	0x04A0,	%l0
	umul	%g7,	%o5,	%o0
	sllx	%l2,	0x13,	%g5
	andn	%i6,	0x0F0A,	%g6
	fmovscs	%icc,	%f6,	%f7
	xor	%o1,	0x0210,	%l5
	movvc	%icc,	%g1,	%l6
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o6
	addccc	%l4,	%i4,	%i0
	fzeros	%f19
	movcc	%icc,	%o3,	%g4
	bge,a,pn	%icc,	loop_1217
	lduw	[%l7 + 0x18],	%g3
	movrne	%i5,	0x277,	%o7
	fmovsvc	%icc,	%f13,	%f6
loop_1217:
	fmovrdlez	%g2,	%f14,	%f22
	mulscc	%o2,	0x1430,	%o4
	fmovsge	%icc,	%f19,	%f7
	tsubcc	%i1,	0x16E4,	%l1
	tge	%xcc,	0x7
	tvc	%icc,	0x1
	movn	%icc,	%l3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i7,	%i2,	%g7
	fbul	%fcc0,	loop_1218
	pdist	%f10,	%f2,	%f16
	fandnot1s	%f26,	%f11,	%f11
	sub	%o5,	%o0,	%l2
loop_1218:
	edge16ln	%l0,	%i6,	%g5
	fbue	%fcc2,	loop_1219
	fba	%fcc2,	loop_1220
	fsrc1s	%f8,	%f27
	tne	%icc,	0x1
loop_1219:
	movgu	%xcc,	%o1,	%g6
loop_1220:
	sll	%g1,	0x10,	%l6
	subc	%o6,	%l5,	%l4
	edge8n	%i0,	%i4,	%g4
	fmovrdlz	%o3,	%f20,	%f24
	movg	%icc,	%i5,	%o7
	fandnot2s	%f19,	%f8,	%f15
	ldd	[%l7 + 0x50],	%f24
	taddcctv	%g2,	%g3,	%o4
	flush	%l7 + 0x54
	fmovdn	%icc,	%f15,	%f9
	set	0x24, %g1
	stwa	%o2,	[%l7 + %g1] 0x81
	andncc	%l1,	%i1,	%l3
	nop
	setx	loop_1221,	%l0,	%l1
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
	fmovs	%f11,	%f14
	fmovsg	%icc,	%f22,	%f28
loop_1221:
	fmovdcs	%icc,	%f31,	%f16
	tle	%xcc,	0x4
	ba,pt	%xcc,	loop_1222
	tpos	%icc,	0x6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i7
loop_1222:
	movrgz	%i2,	%g7,	%o5
	fandnot1	%f6,	%f26,	%f4
	alignaddr	%o0,	%l2,	%i3
	srl	%l0,	%i6,	%g5
	fmovsvs	%icc,	%f21,	%f2
	popc	0x152F,	%g6
	fxor	%f22,	%f8,	%f16
	fandnot2s	%f18,	%f16,	%f11
	fcmpd	%fcc0,	%f0,	%f10
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o1
	sir	0x16C0
	array32	%g1,	%l6,	%o6
	movne	%xcc,	%l4,	%i0
	tg	%icc,	0x4
	array32	%l5,	%g4,	%o3
	edge32l	%i5,	%o7,	%g2
	movgu	%xcc,	%g3,	%i4
	fmovrdgz	%o4,	%f26,	%f26
	xnorcc	%o2,	0x1EC3,	%l1
	array16	%l3,	%i7,	%i1
	movre	%i2,	0x059,	%g7
	stw	%o0,	[%l7 + 0x18]
	fnot2s	%f16,	%f25
	edge32l	%l2,	%i3,	%o5
	tsubcctv	%i6,	%l0,	%g5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x22] %asi,	%o1
	srlx	%g1,	0x1C,	%g6
	nop
	setx	loop_1223,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%l6,	%o6,	%l4
	movrgz	%i0,	%g4,	%o3
	movcs	%icc,	%l5,	%i5
loop_1223:
	edge32l	%g2,	%o7,	%i4
	popc	%g3,	%o4
	mulscc	%l1,	0x1F9E,	%o2
	alignaddrl	%l3,	%i1,	%i2
	fmovrslez	%g7,	%f5,	%f20
	fcmps	%fcc2,	%f27,	%f8
	movle	%icc,	%o0,	%l2
	edge32ln	%i3,	%i7,	%i6
	fmuld8ulx16	%f23,	%f25,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%o5,	%l0
	set	0x20, %g5
	stxa	%g5,	[%g0 + %g5] 0x4f
	tneg	%icc,	0x7
	bvc,a,pt	%icc,	loop_1224
	fpsub16s	%f16,	%f30,	%f3
	fpsub16s	%f28,	%f26,	%f4
	bshuffle	%f20,	%f2,	%f26
loop_1224:
	tvc	%xcc,	0x5
	set	0x08, %g2
	stda	%g0,	[%l7 + %g2] 0x2f
	membar	#Sync
	fnegs	%f31,	%f9
	bvs,a	%icc,	loop_1225
	nop
	setx	loop_1226,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbe	%fcc2,	loop_1227
	fmovscs	%xcc,	%f25,	%f4
loop_1225:
	alignaddr	%g6,	%l6,	%o1
loop_1226:
	movrlz	%o6,	0x396,	%l4
loop_1227:
	movrlz	%i0,	0x14A,	%g4
	orncc	%o3,	0x004A,	%l5
	tl	%icc,	0x5
	movcs	%icc,	%g2,	%o7
	edge8n	%i4,	%g3,	%o4
	fnegd	%f12,	%f30
	edge8	%l1,	%i5,	%o2
	mulx	%i1,	0x13BF,	%l3
	tle	%icc,	0x7
	faligndata	%f24,	%f28,	%f16
	tge	%icc,	0x1
	fornot2s	%f31,	%f16,	%f28
	bvs	%xcc,	loop_1228
	fbg,a	%fcc3,	loop_1229
	edge8ln	%i2,	%o0,	%l2
	fbu	%fcc0,	loop_1230
loop_1228:
	edge16ln	%g7,	%i7,	%i3
loop_1229:
	umulcc	%o5,	0x0125,	%l0
	set	0x3E, %o0
	stha	%g5,	[%l7 + %o0] 0x80
loop_1230:
	array8	%i6,	%g1,	%g6
	movvs	%xcc,	%o1,	%o6
	sllx	%l4,	0x1A,	%l6
	fmovdgu	%xcc,	%f10,	%f2
	move	%icc,	%g4,	%o3
	xor	%l5,	%i0,	%o7
	ldsw	[%l7 + 0x34],	%i4
	movrlez	%g2,	%g3,	%o4
	tsubcctv	%l1,	%i5,	%i1
	edge32	%l3,	%o2,	%o0
	fmovdcc	%icc,	%f9,	%f8
	tge	%xcc,	0x7
	udivcc	%i2,	0x032A,	%g7
	andncc	%i7,	%i3,	%o5
	movcs	%icc,	%l2,	%l0
	tl	%icc,	0x0
	fblg	%fcc0,	loop_1231
	umulcc	%i6,	0x14E0,	%g1
	sdivx	%g5,	0x1DC0,	%o1
	ble,a	%icc,	loop_1232
loop_1231:
	sir	0x078B
	sethi	0x0183,	%o6
	bg	%icc,	loop_1233
loop_1232:
	edge8	%l4,	%g6,	%g4
	sll	%o3,	0x18,	%l5
	srlx	%l6,	%i0,	%i4
loop_1233:
	movn	%icc,	%o7,	%g3
	fmul8x16	%f2,	%f0,	%f10
	bl,a,pt	%xcc,	loop_1234
	addccc	%o4,	%l1,	%i5
	movre	%i1,	0x130,	%g2
	fmuld8sux16	%f19,	%f28,	%f2
loop_1234:
	orcc	%o2,	%o0,	%i2
	fbule	%fcc0,	loop_1235
	edge8l	%g7,	%i7,	%l3
	movre	%i3,	%l2,	%l0
	st	%f8,	[%l7 + 0x4C]
loop_1235:
	fmovsge	%icc,	%f24,	%f25
	movneg	%icc,	%i6,	%o5
	ldsh	[%l7 + 0x6E],	%g1
	fmovspos	%icc,	%f12,	%f30
	fmovsl	%xcc,	%f23,	%f26
	taddcctv	%o1,	%o6,	%l4
	xor	%g6,	%g5,	%g4
	fmovdl	%xcc,	%f22,	%f5
	fmovrdlez	%l5,	%f12,	%f12
	movrlz	%o3,	%l6,	%i0
	ldx	[%l7 + 0x40],	%o7
	ldstub	[%l7 + 0x73],	%g3
	brz	%i4,	loop_1236
	sub	%l1,	0x035B,	%o4
	bleu	loop_1237
	movrgez	%i1,	%g2,	%o2
loop_1236:
	lduh	[%l7 + 0x6E],	%i5
	faligndata	%f18,	%f4,	%f10
loop_1237:
	fzeros	%f15
	tgu	%icc,	0x7
	subccc	%o0,	%g7,	%i7
	set	0x68, %l5
	ldswa	[%l7 + %l5] 0x11,	%i2
	andcc	%i3,	%l3,	%l2
	edge8ln	%l0,	%o5,	%i6
	orn	%g1,	0x180E,	%o6
	movne	%xcc,	%l4,	%o1
	movrne	%g5,	0x24C,	%g6
	array16	%g4,	%o3,	%l5
	xnorcc	%i0,	%o7,	%g3
	brlez	%l6,	loop_1238
	fxor	%f30,	%f18,	%f20
	andncc	%i4,	%l1,	%i1
	fmovdleu	%xcc,	%f16,	%f17
loop_1238:
	bl	%xcc,	loop_1239
	be	loop_1240
	sllx	%o4,	0x0E,	%g2
	bn,pn	%xcc,	loop_1241
loop_1239:
	movvs	%xcc,	%o2,	%o0
loop_1240:
	fbe,a	%fcc0,	loop_1242
	movre	%i5,	0x2ED,	%g7
loop_1241:
	tleu	%icc,	0x3
	movn	%xcc,	%i7,	%i3
loop_1242:
	fmovsgu	%icc,	%f9,	%f16
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%l3
	addcc	%l2,	0x1F5E,	%l0
	sdivx	%i2,	0x03A2,	%o5
	sllx	%g1,	0x15,	%i6
	xorcc	%o6,	0x0917,	%o1
	tneg	%xcc,	0x6
	array16	%l4,	%g5,	%g6
	orncc	%o3,	0x1717,	%g4
	alignaddrl	%l5,	%o7,	%i0
	brlz	%l6,	loop_1243
	mulx	%g3,	%i4,	%i1
	brlz	%l1,	loop_1244
	membar	0x14
loop_1243:
	array8	%g2,	%o4,	%o2
	tvc	%icc,	0x3
loop_1244:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x38] %asi,	%f7
	alignaddrl	%o0,	%i5,	%i7
	andncc	%g7,	%i3,	%l3
	bl,pn	%icc,	loop_1245
	andn	%l2,	0x1527,	%l0
	sdivx	%i2,	0x07B8,	%o5
	edge32	%i6,	%g1,	%o1
loop_1245:
	ta	%icc,	0x3
	orncc	%l4,	0x1CE2,	%g5
	fpadd16	%f20,	%f20,	%f6
	tpos	%icc,	0x2
	smulcc	%g6,	0x1624,	%o6
	fandnot2	%f4,	%f8,	%f26
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%l5
	sub	%o7,	0x1ED7,	%o3
	udiv	%l6,	0x0007,	%g3
	fnand	%f16,	%f4,	%f12
	sll	%i0,	%i1,	%i4
	srax	%l1,	0x1D,	%g2
	andn	%o2,	%o0,	%o4
	add	%i7,	0x0BE2,	%g7
	fpsub16s	%f29,	%f30,	%f16
	fmovsvs	%xcc,	%f8,	%f6
	movle	%xcc,	%i5,	%l3
	fxnor	%f14,	%f6,	%f0
	wr	%g0,	0x89,	%asi
	stxa	%i3,	[%l7 + 0x28] %asi
	sethi	0x0F01,	%l2
	movl	%xcc,	%i2,	%o5
	sllx	%l0,	%g1,	%i6
	fbl,a	%fcc3,	loop_1246
	fpadd16	%f24,	%f18,	%f0
	movpos	%icc,	%l4,	%o1
	addc	%g6,	0x0008,	%o6
loop_1246:
	fbg	%fcc2,	loop_1247
	xnor	%g5,	0x0765,	%l5
	fnor	%f2,	%f20,	%f18
	ldd	[%l7 + 0x70],	%o6
loop_1247:
	ldstub	[%l7 + 0x55],	%g4
	fmovrdne	%o3,	%f2,	%f30
	fblg,a	%fcc2,	loop_1248
	fcmple16	%f26,	%f6,	%g3
	fmovsn	%xcc,	%f19,	%f11
	fpsub32s	%f3,	%f23,	%f19
loop_1248:
	sub	%l6,	0x1026,	%i1
	movvs	%icc,	%i4,	%i0
	fxor	%f20,	%f0,	%f0
	fnot1	%f28,	%f12
	array32	%g2,	%o2,	%l1
	array16	%o4,	%o0,	%i7
	bcc,a,pt	%xcc,	loop_1249
	movgu	%icc,	%i5,	%g7
	fmovrdgz	%l3,	%f12,	%f14
	tne	%icc,	0x2
loop_1249:
	movgu	%icc,	%i3,	%i2
	ba,a	loop_1250
	fmovrdgez	%o5,	%f4,	%f28
	bvs,pn	%icc,	loop_1251
	sra	%l2,	0x03,	%l0
loop_1250:
	array32	%g1,	%i6,	%o1
	tgu	%icc,	0x7
loop_1251:
	tvs	%icc,	0x5
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x30] %asi
	tsubcc	%l4,	0x1E8F,	%o6
	movvc	%xcc,	%g5,	%o7
	alignaddr	%l5,	%o3,	%g3
	tle	%icc,	0x4
	tsubcctv	%l6,	%g4,	%i1
	xor	%i0,	0x0C8D,	%g2
	stx	%o2,	[%l7 + 0x68]
	fmovdvs	%xcc,	%f8,	%f8
	array16	%l1,	%i4,	%o4
	tge	%icc,	0x2
	movrgez	%o0,	0x312,	%i5
	fmovdge	%xcc,	%f4,	%f14
	edge32ln	%i7,	%l3,	%g7
	ldd	[%l7 + 0x38],	%f12
	brz	%i2,	loop_1252
	fmovrsgz	%i3,	%f6,	%f12
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f16
loop_1252:
	movg	%icc,	%o5,	%l2
	fmovsge	%xcc,	%f22,	%f20
	sdivx	%l0,	0x0218,	%g1
	ta	%icc,	0x1
	fmovsne	%icc,	%f10,	%f2
	sdivcc	%o1,	0x1F6A,	%i6
	edge8ln	%l4,	%g6,	%o6
	edge8ln	%o7,	%g5,	%o3
	smulcc	%l5,	%l6,	%g3
	ldx	[%l7 + 0x10],	%g4
	addc	%i1,	%g2,	%o2
	fmovsne	%xcc,	%f10,	%f13
	brgez,a	%i0,	loop_1253
	fmovsvc	%icc,	%f1,	%f23
	and	%l1,	%i4,	%o0
	fornot1s	%f13,	%f9,	%f23
loop_1253:
	movge	%xcc,	%i5,	%i7
	movvs	%icc,	%l3,	%o4
	fsrc2s	%f29,	%f31
	fbule,a	%fcc3,	loop_1254
	movleu	%icc,	%g7,	%i2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i3
loop_1254:
	tcc	%xcc,	0x1
	taddcctv	%o5,	0x15A9,	%l0
	movgu	%xcc,	%l2,	%o1
	fnand	%f4,	%f30,	%f2
	movrgz	%i6,	%g1,	%g6
	fabss	%f25,	%f31
	xorcc	%o6,	%l4,	%o7
	fmovrdgz	%g5,	%f14,	%f10
	add	%l5,	%l6,	%o3
	sethi	0x17B3,	%g4
	tg	%xcc,	0x1
	movgu	%xcc,	%g3,	%i1
	or	%o2,	%i0,	%l1
	alignaddr	%i4,	%g2,	%o0
	movge	%xcc,	%i5,	%i7
	fxor	%f4,	%f2,	%f22
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g7
	subc	%o4,	0x0772,	%i2
	tge	%icc,	0x6
	fsrc2	%f26,	%f10
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o5
	fnot1	%f14,	%f24
	array16	%l2,	%l0,	%i6
	fmovdleu	%icc,	%f3,	%f27
	fors	%f7,	%f11,	%f30
	set	0x14, %i1
	sta	%f9,	[%l7 + %i1] 0x10
	movne	%xcc,	%o1,	%g1
	bpos,a	loop_1255
	mulx	%o6,	0x057C,	%l4
	movvc	%icc,	%o7,	%g6
	movleu	%icc,	%g5,	%l5
loop_1255:
	edge8ln	%l6,	%g4,	%g3
	stw	%o3,	[%l7 + 0x1C]
	movvs	%icc,	%o2,	%i0
	subc	%l1,	%i1,	%g2
	fandnot1	%f8,	%f10,	%f10
	movrlz	%o0,	0x3F8,	%i5
	fzeros	%f5
	sdiv	%i7,	0x1B5C,	%l3
	fbne	%fcc2,	loop_1256
	movrlez	%g7,	0x16A,	%o4
	fmovse	%xcc,	%f20,	%f4
	sllx	%i2,	%i3,	%i4
loop_1256:
	array16	%o5,	%l2,	%l0
	movgu	%xcc,	%i6,	%o1
	edge32n	%o6,	%g1,	%l4
	fmovsvc	%xcc,	%f21,	%f27
	fmovsleu	%icc,	%f30,	%f22
	for	%f28,	%f0,	%f8
	siam	0x2
	nop
	setx	loop_1257,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	std	%g6,	[%l7 + 0x18]
	sub	%o7,	0x0932,	%g5
	ldsb	[%l7 + 0x1C],	%l6
loop_1257:
	fcmps	%fcc1,	%f25,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l5,	%g3
	andcc	%o3,	0x0EA0,	%o2
	fnor	%f24,	%f6,	%f30
	ldd	[%l7 + 0x38],	%g4
	fbne,a	%fcc2,	loop_1258
	bvs,a	loop_1259
	nop
	set	0x34, %l1
	stw	%i0,	[%l7 + %l1]
	movvs	%xcc,	%l1,	%g2
loop_1258:
	fmovde	%icc,	%f13,	%f16
loop_1259:
	tneg	%icc,	0x7
	edge8	%o0,	%i1,	%i5
	fbue	%fcc3,	loop_1260
	fmovsvs	%icc,	%f15,	%f20
	srax	%l3,	0x14,	%i7
	tsubcc	%o4,	%g7,	%i2
loop_1260:
	andn	%i3,	0x1DEF,	%i4
	or	%o5,	0x13EE,	%l0
	bcs,pt	%xcc,	loop_1261
	tpos	%xcc,	0x4
	movpos	%xcc,	%l2,	%i6
	addcc	%o1,	0x0EB9,	%g1
loop_1261:
	fpackfix	%f14,	%f13
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tgu	%icc,	0x1
	tvs	%icc,	0x5
	movl	%xcc,	%o6,	%l4
	edge16n	%o7,	%g5,	%g6
	movpos	%icc,	%l6,	%l5
	edge16	%o3,	%o2,	%g4
	fmovscs	%xcc,	%f27,	%f6
	swap	[%l7 + 0x68],	%g3
	fxnors	%f5,	%f17,	%f7
	tl	%xcc,	0x1
	udiv	%l1,	0x06ED,	%i0
	tge	%icc,	0x6
	edge8l	%g2,	%o0,	%i5
	brnz,a	%i1,	loop_1262
	sir	0x0A9D
	array8	%l3,	%o4,	%i7
	sir	0x19C7
loop_1262:
	udiv	%i2,	0x1F5F,	%i3
	tvs	%icc,	0x6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x53] %asi,	%g7
	tle	%xcc,	0x1
	edge32n	%i4,	%l0,	%l2
	sllx	%o5,	%o1,	%i6
	fmovscc	%xcc,	%f8,	%f8
	alignaddr	%o6,	%g1,	%o7
	flush	%l7 + 0x6C
	fbu,a	%fcc0,	loop_1263
	move	%icc,	%l4,	%g5
	edge32n	%l6,	%l5,	%o3
	umulcc	%o2,	0x1572,	%g4
loop_1263:
	fcmped	%fcc2,	%f20,	%f18
	move	%xcc,	%g6,	%g3
	tcs	%xcc,	0x2
	or	%i0,	%g2,	%o0
	sub	%i5,	0x04CF,	%l1
	array32	%i1,	%l3,	%i7
	movle	%xcc,	%i2,	%i3
	fpack16	%f2,	%f25
	umul	%g7,	0x1444,	%i4
	movvc	%xcc,	%o4,	%l0
	taddcctv	%o5,	0x009A,	%l2
	xorcc	%o1,	%i6,	%g1
	wr	%g0,	0xe3,	%asi
	stda	%o6,	[%l7 + 0x58] %asi
	membar	#Sync
	andncc	%o7,	%g5,	%l4
	fsrc1	%f22,	%f14
	udivx	%l5,	0x1F6C,	%o3
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x0c,	%o2
	fmovsa	%icc,	%f0,	%f9
	move	%icc,	%l6,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xe3,	%g2
	fnot1s	%f15,	%f7
	andn	%g6,	%i0,	%o0
	ld	[%l7 + 0x14],	%f19
	sub	%g2,	%i5,	%i1
	fornot2	%f16,	%f24,	%f24
	movvs	%xcc,	%l1,	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%i3
	edge8l	%g7,	%i2,	%i4
	fmul8sux16	%f0,	%f16,	%f2
	fmovspos	%icc,	%f22,	%f30
	edge8l	%o4,	%o5,	%l2
	edge32l	%o1,	%l0,	%g1
	movle	%icc,	%i6,	%o6
	srl	%g5,	%o7,	%l4
	fmovda	%icc,	%f2,	%f7
	bgu,pt	%xcc,	loop_1264
	nop
	setx	loop_1265,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgez	%o3,	0x2CE,	%o2
	fmovsa	%icc,	%f11,	%f2
loop_1264:
	fcmpeq16	%f20,	%f26,	%l5
loop_1265:
	array32	%g4,	%g3,	%g6
	fcmple32	%f6,	%f28,	%l6
	movrlz	%i0,	%g2,	%i5
	te	%icc,	0x7
	sir	0x19DF
	tcs	%icc,	0x6
	fmovsge	%icc,	%f14,	%f24
	ldd	[%l7 + 0x20],	%o0
	movrne	%l1,	%i1,	%i7
	sra	%l3,	%g7,	%i2
	udiv	%i3,	0x0025,	%o4
	std	%i4,	[%l7 + 0x48]
	set	0x5C, %i4
	ldsba	[%l7 + %i4] 0x04,	%o5
	orcc	%o1,	0x1F50,	%l0
	edge8ln	%g1,	%l2,	%i6
	andncc	%g5,	%o7,	%l4
	fmovsne	%icc,	%f13,	%f31
	andn	%o3,	0x069F,	%o2
	brlz,a	%l5,	loop_1266
	addc	%g4,	%g3,	%g6
	bvc	loop_1267
	edge16	%l6,	%i0,	%o6
loop_1266:
	stw	%i5,	[%l7 + 0x20]
	tn	%icc,	0x0
loop_1267:
	fcmpgt32	%f24,	%f2,	%o0
	andn	%g2,	0x1B88,	%i1
	fbule	%fcc1,	loop_1268
	movrgz	%i7,	0x174,	%l3
	alignaddrl	%g7,	%i2,	%i3
	array32	%o4,	%i4,	%l1
loop_1268:
	tcs	%xcc,	0x5
	tpos	%xcc,	0x6
	subcc	%o1,	0x05D4,	%l0
	be,a,pn	%icc,	loop_1269
	fbug,a	%fcc0,	loop_1270
	edge8	%g1,	%l2,	%o5
	edge16	%g5,	%o7,	%l4
loop_1269:
	fbo	%fcc0,	loop_1271
loop_1270:
	movcs	%icc,	%o3,	%i6
	alignaddr	%o2,	%l5,	%g3
	array16	%g4,	%l6,	%i0
loop_1271:
	movrne	%g6,	%i5,	%o0
	add	%o6,	0x0AD8,	%i1
	fmovda	%icc,	%f8,	%f18
	sub	%g2,	0x19B0,	%i7
	fpsub32s	%f11,	%f13,	%f23
	udivcc	%l3,	0x1F08,	%g7
	andcc	%i3,	%i2,	%i4
	tleu	%icc,	0x4
	bvc,pt	%xcc,	loop_1272
	xnor	%l1,	%o1,	%l0
	sdivcc	%g1,	0x0813,	%o4
	te	%xcc,	0x7
loop_1272:
	alignaddr	%l2,	%o5,	%o7
	tsubcc	%g5,	0x07B2,	%l4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x28] %asi,	%i6
	ld	[%l7 + 0x58],	%f1
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	subccc	%o2,	0x1DDA,	%l5
	umul	%o3,	%g3,	%g4
	set	0x78, %o4
	stba	%l6,	[%l7 + %o4] 0x2f
	membar	#Sync
	fbul,a	%fcc2,	loop_1273
	fbu,a	%fcc1,	loop_1274
	sra	%i0,	0x1E,	%g6
	movpos	%icc,	%i5,	%o6
loop_1273:
	ldsw	[%l7 + 0x0C],	%o0
loop_1274:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	array32	%i1,	%i7,	%g2
	tge	%icc,	0x4
	nop
	setx	loop_1275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%l3,	0x1E65,	%i3
	flush	%l7 + 0x58
	brlz,a	%g7,	loop_1276
loop_1275:
	movne	%icc,	%i2,	%l1
	ldd	[%l7 + 0x50],	%f20
	srl	%i4,	%l0,	%o1
loop_1276:
	fnegs	%f10,	%f30
	sdivcc	%g1,	0x19B3,	%o4
	popc	%o5,	%o7
	fbg,a	%fcc1,	loop_1277
	tleu	%xcc,	0x6
	addc	%l2,	%g5,	%l4
	orcc	%o2,	0x0375,	%l5
loop_1277:
	fmovs	%f16,	%f19
	fmovrdgz	%i6,	%f28,	%f26
	bl,pn	%xcc,	loop_1278
	fors	%f10,	%f29,	%f3
	movl	%xcc,	%o3,	%g3
	fbe,a	%fcc2,	loop_1279
loop_1278:
	movge	%icc,	%l6,	%g4
	fcmpeq32	%f26,	%f10,	%g6
	bpos,a,pn	%icc,	loop_1280
loop_1279:
	srl	%i5,	%o6,	%i0
	stx	%i1,	[%l7 + 0x60]
	nop
	set	0x35, %i2
	ldub	[%l7 + %i2],	%i7
loop_1280:
	sir	0x1508
	movrgez	%g2,	%l3,	%i3
	array8	%o0,	%i2,	%l1
	orn	%g7,	0x0811,	%i4
	tgu	%xcc,	0x5
	fcmpgt16	%f0,	%f16,	%l0
	edge8ln	%o1,	%o4,	%o5
	bneg	%icc,	loop_1281
	fones	%f21
	mova	%icc,	%o7,	%l2
	xnor	%g1,	0x0FB3,	%g5
loop_1281:
	udivcc	%l4,	0x15B9,	%o2
	movgu	%xcc,	%i6,	%l5
	srax	%g3,	%l6,	%g4
	alignaddrl	%o3,	%g6,	%i5
	fcmple32	%f2,	%f8,	%o6
	addc	%i1,	%i0,	%i7
	edge8ln	%l3,	%g2,	%i3
	ldd	[%l7 + 0x48],	%f28
	fba,a	%fcc1,	loop_1282
	nop
	set	0x0C, %o3
	ldsh	[%l7 + %o3],	%i2
	ldd	[%l7 + 0x50],	%f24
	fzeros	%f22
loop_1282:
	stb	%o0,	[%l7 + 0x33]
	mulscc	%l1,	%i4,	%g7
	sllx	%o1,	0x08,	%l0
	add	%o5,	0x1DD7,	%o4
	fpadd16s	%f22,	%f17,	%f14
	orcc	%l2,	0x1708,	%g1
	ldd	[%l7 + 0x08],	%f30
	fbug,a	%fcc0,	loop_1283
	fcmped	%fcc2,	%f10,	%f12
	or	%o7,	0x1BA0,	%l4
	movg	%xcc,	%g5,	%i6
loop_1283:
	fcmple32	%f4,	%f12,	%o2
	stbar
	nop
	setx	loop_1284,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsh	[%l7 + 0x42],	%l5
	sllx	%g3,	0x03,	%g4
	tg	%icc,	0x7
loop_1284:
	tvs	%xcc,	0x0
	sdiv	%l6,	0x18B1,	%g6
	movre	%i5,	0x2D9,	%o6
	stb	%i1,	[%l7 + 0x5B]
	andn	%i0,	%i7,	%l3
	tleu	%xcc,	0x5
	movleu	%icc,	%o3,	%i3
	edge16ln	%g2,	%i2,	%o0
	addcc	%i4,	0x1A74,	%g7
	tgu	%icc,	0x7
	orn	%l1,	%l0,	%o1
	fcmpne16	%f20,	%f6,	%o4
	brlz	%l2,	loop_1285
	fbe	%fcc1,	loop_1286
	ldd	[%l7 + 0x28],	%f6
	edge16n	%o5,	%g1,	%o7
loop_1285:
	andcc	%g5,	%i6,	%o2
loop_1286:
	udiv	%l5,	0x09DA,	%g3
	array16	%g4,	%l6,	%l4
	ta	%xcc,	0x5
	subc	%g6,	%i5,	%i1
	popc	0x05AE,	%i0
	movg	%icc,	%i7,	%l3
	fmovs	%f31,	%f30
	movrgez	%o3,	%i3,	%g2
	edge32l	%i2,	%o6,	%o0
	fandnot2s	%f25,	%f7,	%f3
	or	%g7,	0x013C,	%l1
	edge16	%l0,	%i4,	%o1
	xnorcc	%l2,	%o5,	%o4
	tneg	%xcc,	0x0
	orncc	%g1,	0x100C,	%g5
	movle	%xcc,	%o7,	%i6
	tne	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	stxa	%l5,	[%l7 + 0x30] %asi
	tgu	%xcc,	0x0
	nop
	set	0x68, %i0
	std	%g2,	[%l7 + %i0]
	movrlz	%g4,	%o2,	%l4
	sll	%g6,	%i5,	%l6
	fmovdgu	%xcc,	%f22,	%f26
	fornot1s	%f7,	%f8,	%f15
	tsubcc	%i0,	%i1,	%i7
	edge8n	%l3,	%i3,	%o3
	tle	%xcc,	0x0
	fmovde	%xcc,	%f3,	%f12
	edge16	%g2,	%o6,	%o0
	tgu	%xcc,	0x0
	movleu	%xcc,	%g7,	%i2
	edge8n	%l1,	%i4,	%l0
	tne	%icc,	0x4
	edge32	%o1,	%l2,	%o5
	fcmps	%fcc1,	%f25,	%f18
	tg	%xcc,	0x0
	st	%f29,	[%l7 + 0x48]
	fbo,a	%fcc3,	loop_1287
	movrgz	%g1,	%g5,	%o7
	add	%i6,	0x073C,	%o4
	edge8ln	%l5,	%g4,	%g3
loop_1287:
	tpos	%xcc,	0x5
	movvc	%icc,	%o2,	%g6
	mova	%icc,	%i5,	%l6
	fmovdpos	%icc,	%f31,	%f27
	taddcc	%i0,	0x02BF,	%i1
	subcc	%l4,	0x0CF8,	%i7
	sdiv	%i3,	0x0D83,	%l3
	flush	%l7 + 0x6C
	fcmps	%fcc3,	%f7,	%f7
	sllx	%o3,	%g2,	%o6
	tcc	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g7
	sra	%i2,	0x12,	%l1
	movge	%xcc,	%i4,	%o0
	edge8	%l0,	%l2,	%o5
	tg	%xcc,	0x1
	nop
	setx	loop_1288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8ulx16	%f20,	%f26,	%f18
	edge32n	%o1,	%g1,	%o7
	sethi	0x1A84,	%g5
loop_1288:
	nop
	wr	%g0,	0x18,	%asi
	stha	%o4,	[%l7 + 0x26] %asi
	siam	0x2
	movrgez	%l5,	%g4,	%i6
	orn	%g3,	%o2,	%i5
	addcc	%g6,	%l6,	%i1
	taddcctv	%l4,	%i7,	%i3
	fones	%f13
	movleu	%xcc,	%i0,	%o3
	fmuld8sux16	%f30,	%f4,	%f24
	fmovda	%xcc,	%f31,	%f28
	brnz	%l3,	loop_1289
	brlez	%g2,	loop_1290
	tvc	%icc,	0x7
	fmovdl	%xcc,	%f15,	%f12
loop_1289:
	stx	%g7,	[%l7 + 0x38]
loop_1290:
	movle	%xcc,	%i2,	%o6
	mulscc	%l1,	0x1EC5,	%i4
	fbul	%fcc0,	loop_1291
	ldub	[%l7 + 0x3A],	%o0
	fabss	%f20,	%f12
	andn	%l0,	0x0E88,	%o5
loop_1291:
	sdiv	%o1,	0x044E,	%g1
	fmovdpos	%icc,	%f25,	%f11
	stw	%l2,	[%l7 + 0x64]
	movn	%icc,	%g5,	%o7
	bne,a,pn	%xcc,	loop_1292
	movpos	%xcc,	%l5,	%o4
	flush	%l7 + 0x3C
	sir	0x152A
loop_1292:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
	fmovrsgez	%i6,	%f29,	%f8
	edge32l	%g3,	%o2,	%g4
	sdivcc	%i5,	0x18D5,	%g6
	fbne,a	%fcc3,	loop_1293
	fmovdl	%xcc,	%f21,	%f21
	orncc	%l6,	%i1,	%l4
	sdivcc	%i3,	0x0A7C,	%i7
loop_1293:
	bleu,pt	%icc,	loop_1294
	edge16n	%o3,	%l3,	%i0
	xnor	%g2,	0x1649,	%g7
	bl,pn	%icc,	loop_1295
loop_1294:
	tleu	%xcc,	0x7
	tle	%xcc,	0x5
	stb	%i2,	[%l7 + 0x43]
loop_1295:
	movrgez	%l1,	%i4,	%o6
	fble	%fcc1,	loop_1296
	bpos	loop_1297
	udivcc	%l0,	0x0D25,	%o0
	fbug,a	%fcc0,	loop_1298
loop_1296:
	fbue	%fcc1,	loop_1299
loop_1297:
	movcs	%icc,	%o1,	%o5
	srlx	%g1,	%g5,	%o7
loop_1298:
	bvc,a,pt	%xcc,	loop_1300
loop_1299:
	fmovrdgez	%l5,	%f4,	%f20
	bcc	%xcc,	loop_1301
	fmovdleu	%xcc,	%f14,	%f21
loop_1300:
	movleu	%xcc,	%l2,	%i6
	bgu	loop_1302
loop_1301:
	tvc	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x58] %asi,	%f30
loop_1302:
	fsrc1	%f2,	%f30
	set	0x48, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0x3
	brnz	%o4,	loop_1303
	array16	%o2,	%g4,	%i5
	fmovsa	%icc,	%f23,	%f5
	siam	0x0
loop_1303:
	fxnors	%f3,	%f21,	%f12
	and	%l6,	%g6,	%l4
	movcs	%xcc,	%i3,	%i1
	array32	%o3,	%l3,	%i0
	andn	%i7,	%g7,	%g2
	fornot2s	%f29,	%f20,	%f5
	movpos	%icc,	%i2,	%i4
	bn,pn	%icc,	loop_1304
	tge	%icc,	0x5
	membar	0x3F
	fnand	%f12,	%f0,	%f6
loop_1304:
	tneg	%icc,	0x5
	fmovsle	%icc,	%f20,	%f0
	movrlez	%o6,	0x356,	%l1
	brlez	%o0,	loop_1305
	movre	%o1,	%l0,	%o5
	brgz	%g1,	loop_1306
	membar	0x70
loop_1305:
	nop
	set	0x2C, %o6
	ldsb	[%l7 + %o6],	%o7
	fbl,a	%fcc3,	loop_1307
loop_1306:
	srlx	%g5,	%l5,	%i6
	tcs	%icc,	0x7
	bgu,a	loop_1308
loop_1307:
	edge8n	%g3,	%l2,	%o4
	fpmerge	%f26,	%f4,	%f8
	fornot2s	%f4,	%f3,	%f28
loop_1308:
	edge32ln	%o2,	%g4,	%l6
	fmovsge	%xcc,	%f7,	%f25
	tsubcc	%g6,	0x1866,	%l4
	udivcc	%i5,	0x0DC3,	%i1
	movre	%o3,	%i3,	%i0
	fbge	%fcc1,	loop_1309
	tsubcctv	%l3,	0x1B47,	%g7
	array32	%g2,	%i7,	%i4
	tsubcc	%i2,	0x1679,	%o6
loop_1309:
	brgz,a	%l1,	loop_1310
	movl	%xcc,	%o0,	%l0
	addc	%o1,	0x1813,	%o5
	array16	%g1,	%g5,	%o7
loop_1310:
	andcc	%i6,	%l5,	%g3
	andcc	%l2,	0x139F,	%o4
	set	0x10, %g7
	stxa	%o2,	[%l7 + %g7] 0x14
	andncc	%l6,	%g4,	%l4
	alignaddrl	%i5,	%i1,	%o3
	movn	%xcc,	%i3,	%g6
	fnors	%f25,	%f30,	%f24
	fmovsg	%icc,	%f1,	%f19
	stbar
	fbg,a	%fcc0,	loop_1311
	fbul,a	%fcc0,	loop_1312
	tvc	%icc,	0x4
	be,pt	%icc,	loop_1313
loop_1311:
	orcc	%i0,	0x137D,	%l3
loop_1312:
	tcs	%icc,	0x0
	umulcc	%g2,	%g7,	%i4
loop_1313:
	fmovsneg	%icc,	%f15,	%f31
	and	%i7,	0x1FC0,	%i2
	andncc	%o6,	%o0,	%l0
	fxor	%f24,	%f20,	%f6
	bl	%icc,	loop_1314
	tgu	%xcc,	0x7
	be	%xcc,	loop_1315
	fbl,a	%fcc2,	loop_1316
loop_1314:
	nop
	setx	loop_1317,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%l1,	%o5
loop_1315:
	ta	%xcc,	0x1
loop_1316:
	movpos	%icc,	%o1,	%g1
loop_1317:
	and	%g5,	%o7,	%i6
	smulcc	%g3,	%l5,	%o4
	nop
	setx	loop_1318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%o2,	%l6,	%l2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf0
	membar	#Sync
loop_1318:
	edge8n	%g4,	%i5,	%i1
	flush	%l7 + 0x30
	fmovse	%xcc,	%f22,	%f20
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x18,	%o3,	%l4
	sll	%g6,	%i0,	%i3
	movneg	%xcc,	%g2,	%g7
	edge16ln	%i4,	%l3,	%i2
	fbe	%fcc0,	loop_1319
	udiv	%o6,	0x1B35,	%i7
	fbug	%fcc0,	loop_1320
	alignaddrl	%l0,	%o0,	%l1
loop_1319:
	fpadd32s	%f31,	%f29,	%f7
	movgu	%xcc,	%o5,	%g1
loop_1320:
	fabss	%f14,	%f2
	udiv	%o1,	0x0CF8,	%o7
	fmovrdgz	%i6,	%f20,	%f12
	movg	%xcc,	%g3,	%g5
	mulx	%o4,	0x0DC7,	%o2
	udivx	%l5,	0x1045,	%l6
	subccc	%g4,	0x0E7B,	%l2
	fba,a	%fcc2,	loop_1321
	xnor	%i5,	0x1D39,	%i1
	taddcctv	%o3,	%l4,	%i0
	add	%g6,	%i3,	%g7
loop_1321:
	fblg,a	%fcc3,	loop_1322
	membar	0x50
	set	0x60, %o5
	stwa	%i4,	[%l7 + %o5] 0x2b
	membar	#Sync
loop_1322:
	edge32	%g2,	%l3,	%i2
	fbuge,a	%fcc1,	loop_1323
	tl	%icc,	0x2
	edge32n	%o6,	%l0,	%o0
	orn	%i7,	0x0C18,	%l1
loop_1323:
	nop
	set	0x12, %l2
	ldsba	[%l7 + %l2] 0x80,	%g1
	movrgez	%o1,	0x0B4,	%o7
	fbge	%fcc1,	loop_1324
	bvs,a	%icc,	loop_1325
	taddcc	%i6,	0x1E2C,	%g3
	fornot1s	%f5,	%f26,	%f9
loop_1324:
	fbue,a	%fcc0,	loop_1326
loop_1325:
	tle	%xcc,	0x5
	brgez	%g5,	loop_1327
	edge16n	%o5,	%o2,	%l5
loop_1326:
	tpos	%icc,	0x5
	subccc	%l6,	0x00BF,	%g4
loop_1327:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l2,	%o4,	%i5
	fcmple16	%f12,	%f18,	%i1
	fnot2s	%f19,	%f13
	std	%l4,	[%l7 + 0x50]
	brgez,a	%o3,	loop_1328
	mulscc	%g6,	0x0DAE,	%i3
	edge16	%g7,	%i4,	%g2
	faligndata	%f14,	%f4,	%f14
loop_1328:
	fand	%f30,	%f22,	%f26
	edge16	%i0,	%l3,	%o6
	ldsh	[%l7 + 0x4E],	%l0
	taddcctv	%o0,	0x196B,	%i7
	movrne	%l1,	%i2,	%g1
	brlez	%o1,	loop_1329
	movge	%icc,	%i6,	%o7
	brgez,a	%g3,	loop_1330
	smulcc	%g5,	0x07C4,	%o2
loop_1329:
	tge	%icc,	0x5
	edge8ln	%l5,	%l6,	%o5
loop_1330:
	flush	%l7 + 0x60
	fmuld8ulx16	%f12,	%f24,	%f28
	fmovdvc	%icc,	%f15,	%f23
	movre	%l2,	%g4,	%o4
	fxnor	%f26,	%f22,	%f28
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x48] %asi,	%i1
	alignaddrl	%l4,	%o3,	%g6
	alignaddrl	%i5,	%g7,	%i3
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tcc	%icc,	0x2
	sdivx	%i4,	0x1EC6,	%g2
	add	%i0,	%o6,	%l3
	sdivcc	%l0,	0x1093,	%o0
	membar	0x44
	movle	%icc,	%i7,	%i2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%o1
	edge32ln	%g1,	%i6,	%o7
	udivcc	%g3,	0x0C38,	%g5
	ba,a	%icc,	loop_1331
	xnor	%o2,	0x1BFD,	%l5
	bne	%xcc,	loop_1332
	tleu	%xcc,	0x5
loop_1331:
	move	%xcc,	%l6,	%l2
	swap	[%l7 + 0x48],	%o5
loop_1332:
	addc	%o4,	%i1,	%g4
	fmul8sux16	%f8,	%f8,	%f24
	te	%icc,	0x6
	ta	%xcc,	0x3
	edge16l	%o3,	%g6,	%l4
	movleu	%xcc,	%g7,	%i5
	edge16	%i4,	%i3,	%i0
	xnor	%o6,	%l3,	%g2
	fnor	%f26,	%f0,	%f4
	ldd	[%l7 + 0x38],	%o0
	add	%i7,	0x00CF,	%i2
	movgu	%xcc,	%l1,	%l0
	array8	%g1,	%o1,	%i6
	fbe,a	%fcc2,	loop_1333
	movre	%g3,	%o7,	%o2
	tle	%icc,	0x6
	edge32	%g5,	%l5,	%l6
loop_1333:
	andcc	%l2,	%o5,	%o4
	ldd	[%l7 + 0x38],	%g4
	ldx	[%l7 + 0x68],	%o3
	bcs,pt	%xcc,	loop_1334
	ta	%icc,	0x7
	wr	%g0,	0x88,	%asi
	stxa	%g6,	[%l7 + 0x38] %asi
loop_1334:
	tneg	%icc,	0x3
	tsubcc	%l4,	0x0682,	%g7
	nop
	setx loop_1335, %l0, %l1
	jmpl %l1, %i5
	edge32n	%i4,	%i3,	%i1
	fbn	%fcc2,	loop_1336
	movleu	%xcc,	%o6,	%l3
loop_1335:
	fmovscc	%icc,	%f22,	%f17
	fmovdneg	%xcc,	%f21,	%f8
loop_1336:
	fbge,a	%fcc3,	loop_1337
	tvs	%xcc,	0x2
	fpsub16s	%f6,	%f17,	%f0
	xnorcc	%g2,	0x1F2B,	%o0
loop_1337:
	sethi	0x0D75,	%i7
	udiv	%i0,	0x1C5B,	%i2
	srax	%l1,	0x12,	%l0
	set	0x18, %g6
	lduwa	[%l7 + %g6] 0x0c,	%g1
	fcmple16	%f6,	%f8,	%o1
	movl	%xcc,	%g3,	%i6
	array8	%o2,	%g5,	%o7
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	umulcc	%l5,	0x0050,	%l6
	edge32l	%l2,	%o4,	%o5
	movre	%g4,	%g6,	%l4
	movleu	%icc,	%g7,	%i5
	tleu	%icc,	0x6
	brz,a	%o3,	loop_1338
	fcmpeq16	%f0,	%f14,	%i4
	edge16l	%i1,	%o6,	%i3
	alignaddr	%l3,	%o0,	%i7
loop_1338:
	fsrc1	%f14,	%f20
	edge32ln	%i0,	%i2,	%g2
	edge16n	%l0,	%g1,	%o1
	srax	%g3,	%i6,	%l1
	sdivx	%o2,	0x0FEE,	%o7
	wr	%g0,	0x4f,	%asi
	stxa	%l5,	[%g0 + 0x28] %asi
	andncc	%l6,	%l2,	%g5
	alignaddr	%o5,	%o4,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f2,	%f0,	%g6
	lduh	[%l7 + 0x3A],	%l4
	fbl	%fcc3,	loop_1339
	add	%i5,	0x0810,	%o3
	tcc	%icc,	0x4
	edge32l	%g7,	%i4,	%o6
loop_1339:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%i1
	popc	%l3,	%i7
	bleu,pn	%xcc,	loop_1340
	movne	%icc,	%i0,	%o0
	ble	loop_1341
	umul	%i2,	%l0,	%g1
loop_1340:
	fmovrdlez	%o1,	%f14,	%f20
	andncc	%g3,	%g2,	%l1
loop_1341:
	ldstub	[%l7 + 0x74],	%o2
	andn	%i6,	%l5,	%l6
	alignaddrl	%l2,	%g5,	%o5
	ldstub	[%l7 + 0x37],	%o4
	swap	[%l7 + 0x7C],	%g4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x0C] %asi,	%o7
	taddcc	%g6,	%l4,	%i5
	mova	%xcc,	%o3,	%g7
	umul	%o6,	%i4,	%i1
	te	%icc,	0x7
	tn	%icc,	0x4
	orn	%l3,	0x0D68,	%i7
	udiv	%i0,	0x0D30,	%o0
	fmovscc	%xcc,	%f14,	%f13
	edge32l	%i2,	%l0,	%i3
	movle	%xcc,	%g1,	%g3
	fmovrsgez	%g2,	%f4,	%f23
	movgu	%icc,	%l1,	%o2
	set	0x58, %o1
	ldsha	[%l7 + %o1] 0x81,	%i6
	fpack16	%f22,	%f4
	subccc	%o1,	0x15EB,	%l5
	call	loop_1342
	fnor	%f30,	%f10,	%f4
	bn,a	loop_1343
	fnegs	%f29,	%f28
loop_1342:
	flush	%l7 + 0x28
	sra	%l6,	0x18,	%l2
loop_1343:
	taddcctv	%o5,	0x138B,	%o4
	fornot1	%f24,	%f22,	%f20
	tleu	%icc,	0x3
	tle	%xcc,	0x6
	movcs	%xcc,	%g5,	%g4
	fornot2	%f20,	%f16,	%f12
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x12] %asi,	%o7
	fbug,a	%fcc2,	loop_1344
	edge32ln	%g6,	%i5,	%l4
	sdivcc	%g7,	0x02A8,	%o3
	fmul8x16au	%f20,	%f9,	%f30
loop_1344:
	edge16n	%o6,	%i4,	%i1
	orncc	%i7,	%i0,	%l3
	ldstub	[%l7 + 0x39],	%i2
	smulcc	%o0,	%l0,	%i3
	addcc	%g1,	%g3,	%g2
	fcmps	%fcc3,	%f5,	%f31
	fmovrdlz	%o2,	%f0,	%f14
	array8	%l1,	%i6,	%l5
	fbne	%fcc0,	loop_1345
	tge	%icc,	0x6
	tneg	%icc,	0x4
	movrlz	%l6,	%l2,	%o5
loop_1345:
	nop
	set	0x18, %l3
	stxa	%o4,	[%l7 + %l3] 0x15
	mova	%xcc,	%o1,	%g4
	tg	%icc,	0x1
	nop
	set	0x6F, %l4
	ldstub	[%l7 + %l4],	%o7
	bl	loop_1346
	xnor	%g6,	0x0C9E,	%i5
	fsrc2s	%f10,	%f1
	prefetch	[%l7 + 0x1C],	 0x1
loop_1346:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	tsubcctv	%g7,	0x0991,	%l4
	subcc	%o3,	0x1CF3,	%i4
	popc	%i1,	%i7
	taddcctv	%o6,	%i0,	%i2
	srl	%l3,	0x15,	%l0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	movrlz	%i3,	0x1ED,	%g1
	fmul8x16al	%f12,	%f10,	%f2
	subc	%g2,	0x14FC,	%o2
	and	%g3,	%l1,	%l5
	movg	%icc,	%i6,	%l2
	tsubcc	%o5,	%o4,	%o1
	membar	0x4B
	umulcc	%g4,	0x01B6,	%l6
	lduh	[%l7 + 0x40],	%g6
	array32	%o7,	%i5,	%g7
	fnand	%f28,	%f14,	%f18
	te	%xcc,	0x5
	tg	%xcc,	0x0
	ble	loop_1347
	move	%icc,	%l4,	%o3
	taddcctv	%i4,	%g5,	%i7
	bne,a,pt	%xcc,	loop_1348
loop_1347:
	ldsw	[%l7 + 0x50],	%o6
	taddcctv	%i0,	%i1,	%l3
	udivx	%i2,	0x0111,	%l0
loop_1348:
	orcc	%i3,	%g1,	%g2
	orn	%o0,	0x0B27,	%g3
	edge8ln	%l1,	%o2,	%i6
	movg	%icc,	%l5,	%l2
	movn	%xcc,	%o5,	%o4
	lduh	[%l7 + 0x7E],	%o1
	fnot2s	%f21,	%f3
	set	0x50, %g4
	ldxa	[%l7 + %g4] 0x15,	%l6
	ldd	[%l7 + 0x30],	%f8
	set	0x44, %o2
	stwa	%g6,	[%l7 + %o2] 0x80
	srl	%g4,	0x0F,	%o7
	fmovsle	%icc,	%f26,	%f8
	array16	%g7,	%l4,	%o3
	tneg	%icc,	0x6
	fmovdvs	%icc,	%f24,	%f11
	movrlez	%i5,	%i4,	%i7
	tgu	%icc,	0x0
	tge	%xcc,	0x7
	mova	%icc,	%o6,	%i0
	fbo,a	%fcc3,	loop_1349
	fmovsl	%icc,	%f28,	%f25
	movg	%xcc,	%g5,	%i1
	movleu	%icc,	%l3,	%l0
loop_1349:
	array32	%i2,	%i3,	%g2
	movge	%xcc,	%g1,	%g3
	movneg	%xcc,	%o0,	%l1
	bneg,a	loop_1350
	xorcc	%i6,	%o2,	%l5
	fcmpgt32	%f6,	%f24,	%l2
	movneg	%icc,	%o4,	%o1
loop_1350:
	bleu,a,pn	%xcc,	loop_1351
	movl	%xcc,	%l6,	%g6
	fmovdleu	%xcc,	%f17,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1351:
	fcmpes	%fcc1,	%f5,	%f20
	umulcc	%g4,	%o7,	%o5
	brz,a	%l4,	loop_1352
	tge	%xcc,	0x3
	udivx	%o3,	0x1A37,	%i5
	edge8n	%g7,	%i4,	%o6
loop_1352:
	subc	%i7,	0x012C,	%i0
	andncc	%i1,	%g5,	%l3
	set	0x28, %g3
	prefetcha	[%l7 + %g3] 0x14,	 0x2
	fcmpne32	%f18,	%f12,	%i3
	sdivcc	%g2,	0x0243,	%g1
	fbne	%fcc0,	loop_1353
	and	%g3,	%i2,	%l1
	fmovrdgez	%o0,	%f26,	%f22
	addccc	%i6,	0x0CBB,	%o2
loop_1353:
	fmul8ulx16	%f8,	%f16,	%f24
	edge16n	%l5,	%l2,	%o4
	orncc	%o1,	0x14C4,	%g6
	udivcc	%l6,	0x0CAF,	%o7
	taddcctv	%o5,	%l4,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f4,	%f22,	%i5
	movge	%icc,	%o3,	%i4
	andncc	%g7,	%i7,	%o6
	orncc	%i1,	%i0,	%l3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f0
	flush	%l7 + 0x58
	edge16l	%g5,	%i3,	%g2
	fbule,a	%fcc1,	loop_1354
	edge16l	%l0,	%g1,	%i2
	fmovsle	%icc,	%f0,	%f14
	fbo	%fcc2,	loop_1355
loop_1354:
	std	%l0,	[%l7 + 0x20]
	bge,pt	%xcc,	loop_1356
	movre	%g3,	0x037,	%o0
loop_1355:
	fmovsleu	%icc,	%f4,	%f20
	subcc	%i6,	%l5,	%l2
loop_1356:
	movg	%icc,	%o4,	%o2
	movrlz	%g6,	0x152,	%o1
	fcmpgt16	%f2,	%f6,	%l6
	srax	%o7,	0x14,	%l4
	orcc	%g4,	%o5,	%i5
	siam	0x7
	tn	%xcc,	0x2
	edge32	%o3,	%i4,	%g7
	ldd	[%l7 + 0x38],	%i6
	array32	%i1,	%i0,	%o6
	fmul8ulx16	%f18,	%f2,	%f24
	fmul8x16	%f10,	%f26,	%f24
	tsubcctv	%l3,	%g5,	%i3
	prefetch	[%l7 + 0x7C],	 0x2
	movcs	%xcc,	%g2,	%l0
	call	loop_1357
	edge16ln	%g1,	%i2,	%g3
	movg	%xcc,	%o0,	%i6
	fornot2s	%f26,	%f25,	%f4
loop_1357:
	movleu	%icc,	%l5,	%l1
	udivcc	%l2,	0x10B4,	%o4
	xnorcc	%o2,	%o1,	%g6
	fnand	%f14,	%f14,	%f18
	smul	%o7,	%l4,	%g4
	subc	%o5,	%l6,	%o3
	movneg	%xcc,	%i5,	%g7
	edge32ln	%i4,	%i7,	%i0
	sllx	%i1,	%o6,	%g5
	fmovsl	%icc,	%f30,	%f4
	fnand	%f28,	%f18,	%f28
	movne	%icc,	%i3,	%l3
	array32	%l0,	%g2,	%i2
	tpos	%icc,	0x2
	edge8n	%g1,	%o0,	%g3
	fnegd	%f2,	%f4
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x88,	%l5
	movrgz	%l1,	0x335,	%i6
	srax	%l2,	%o4,	%o1
	tvs	%icc,	0x1
	fmovrsgez	%g6,	%f17,	%f13
	fbe,a	%fcc2,	loop_1358
	edge16l	%o7,	%l4,	%g4
	swap	[%l7 + 0x34],	%o2
	fpack16	%f6,	%f23
loop_1358:
	fand	%f24,	%f0,	%f30
	addcc	%o5,	0x0A2E,	%l6
	movrlz	%i5,	%o3,	%i4
	tvs	%icc,	0x2
	ldsw	[%l7 + 0x10],	%i7
	orcc	%g7,	%i0,	%o6
	xorcc	%i1,	0x124B,	%g5
	subcc	%i3,	%l0,	%l3
	stx	%i2,	[%l7 + 0x38]
	xorcc	%g2,	%g1,	%g3
	fmul8x16	%f5,	%f16,	%f18
	be	%icc,	loop_1359
	xnorcc	%o0,	%l5,	%l1
	tn	%xcc,	0x1
	fandnot1s	%f30,	%f6,	%f13
loop_1359:
	array8	%i6,	%o4,	%l2
	swap	[%l7 + 0x24],	%g6
	fabss	%f12,	%f25
	bleu,a	loop_1360
	tvs	%icc,	0x2
	bvs,a	loop_1361
	movrlez	%o1,	%l4,	%o7
loop_1360:
	nop
	set	0x40, %o7
	prefetch	[%l7 + %o7],	 0x1
	fnot2s	%f16,	%f24
loop_1361:
	ble,a	loop_1362
	srlx	%o2,	0x0C,	%g4
	umulcc	%l6,	%i5,	%o3
	fmuld8sux16	%f2,	%f15,	%f0
loop_1362:
	swap	[%l7 + 0x74],	%i4
	edge32ln	%o5,	%i7,	%g7
	edge8l	%i0,	%i1,	%g5
	subc	%o6,	0x087A,	%i3
	sllx	%l0,	%l3,	%i2
	sll	%g2,	0x0C,	%g3
	sra	%g1,	0x04,	%o0
	xor	%l5,	%i6,	%o4
	movneg	%icc,	%l2,	%l1
	fmovrsgz	%g6,	%f12,	%f5
	sra	%l4,	%o7,	%o2
	sethi	0x1401,	%g4
	movvc	%xcc,	%o1,	%l6
	fornot1	%f0,	%f22,	%f10
	fbe	%fcc1,	loop_1363
	srax	%i5,	%o3,	%i4
	edge16n	%i7,	%o5,	%i0
	fmovdgu	%xcc,	%f0,	%f18
loop_1363:
	stw	%i1,	[%l7 + 0x48]
	movrlez	%g5,	0x279,	%g7
	sth	%i3,	[%l7 + 0x12]
	fnand	%f6,	%f4,	%f18
	fbu,a	%fcc2,	loop_1364
	smulcc	%o6,	%l3,	%l0
	fnands	%f23,	%f29,	%f16
	sdivcc	%i2,	0x0071,	%g2
loop_1364:
	fbule,a	%fcc1,	loop_1365
	edge32l	%g1,	%g3,	%l5
	fzero	%f8
	udiv	%i6,	0x0760,	%o4
loop_1365:
	smulcc	%l2,	%l1,	%o0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6F] %asi,	%l4
	fbue,a	%fcc0,	loop_1366
	sllx	%o7,	0x1F,	%o2
	tsubcc	%g6,	%o1,	%g4
	fmovdl	%icc,	%f14,	%f17
loop_1366:
	move	%xcc,	%l6,	%o3
	andncc	%i5,	%i7,	%o5
	array16	%i4,	%i0,	%g5
	orn	%g7,	%i3,	%o6
	orcc	%i1,	%l3,	%l0
	tsubcctv	%i2,	0x1EAC,	%g1
	fbo	%fcc3,	loop_1367
	movge	%icc,	%g2,	%g3
	fmul8x16al	%f25,	%f24,	%f28
	srax	%l5,	0x0C,	%i6
loop_1367:
	sethi	0x112F,	%o4
	move	%icc,	%l2,	%o0
	tsubcc	%l4,	0x185F,	%o7
	tneg	%xcc,	0x5
	fpack32	%f28,	%f2,	%f26
	prefetch	[%l7 + 0x44],	 0x2
	andcc	%l1,	%o2,	%g6
	fsrc1s	%f11,	%f8
	te	%xcc,	0x2
	swap	[%l7 + 0x64],	%g4
	tcc	%xcc,	0x4
	xnor	%o1,	%o3,	%i5
	edge32	%i7,	%l6,	%o5
	fbue	%fcc0,	loop_1368
	edge16ln	%i4,	%i0,	%g5
	fbule	%fcc2,	loop_1369
	array32	%i3,	%g7,	%i1
loop_1368:
	bcc,a,pn	%xcc,	loop_1370
	fmovdleu	%xcc,	%f28,	%f23
loop_1369:
	fzeros	%f2
	tneg	%icc,	0x6
loop_1370:
	array8	%o6,	%l3,	%i2
	fbge,a	%fcc3,	loop_1371
	fsrc1s	%f28,	%f0
	fmovscc	%xcc,	%f24,	%f2
	ldd	[%l7 + 0x48],	%g0
loop_1371:
	fbn,a	%fcc2,	loop_1372
	edge16ln	%l0,	%g2,	%g3
	alignaddrl	%i6,	%o4,	%l2
	ldd	[%l7 + 0x58],	%f24
loop_1372:
	bgu	loop_1373
	movrlz	%l5,	%o0,	%l4
	fnot2s	%f27,	%f11
	tge	%icc,	0x1
loop_1373:
	movvc	%icc,	%l1,	%o7
	bpos,pt	%xcc,	loop_1374
	te	%xcc,	0x7
	array16	%o2,	%g4,	%o1
	fcmped	%fcc3,	%f26,	%f28
loop_1374:
	movpos	%icc,	%o3,	%g6
	brgz	%i7,	loop_1375
	andn	%l6,	%o5,	%i4
	fmul8ulx16	%f4,	%f22,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1375:
	array16	%i0,	%i5,	%g5
	fmovrsgez	%i3,	%f28,	%f1
	tn	%xcc,	0x5
	fbue	%fcc3,	loop_1376
	udivx	%g7,	0x0995,	%i1
	andn	%o6,	%l3,	%i2
	movgu	%xcc,	%g1,	%g2
loop_1376:
	fmovsne	%icc,	%f4,	%f20
	tvs	%icc,	0x6
	sir	0x119F
	swap	[%l7 + 0x48],	%l0
	srlx	%i6,	%g3,	%l2
	fzero	%f26
	nop
	setx	loop_1377,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%l5,	0x1F1A,	%o0
	addccc	%o4,	0x0199,	%l4
	and	%l1,	0x0F24,	%o7
loop_1377:
	tn	%xcc,	0x3
	or	%o2,	%g4,	%o3
	add	%g6,	%o1,	%l6
	nop
	set	0x27, %g5
	ldstub	[%l7 + %g5],	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x0
	smulcc	%i4,	0x138C,	%i7
	subccc	%i5,	0x0188,	%i0
	fabss	%f11,	%f15
	fmovd	%f24,	%f30
	ldsw	[%l7 + 0x38],	%g5
	movrne	%i3,	%g7,	%i1
	smul	%l3,	0x07D0,	%i2
	srax	%o6,	%g2,	%l0
	fpsub32s	%f30,	%f31,	%f29
	nop
	setx loop_1378, %l0, %l1
	jmpl %l1, %g1
	stbar
	fmovdge	%xcc,	%f19,	%f4
	umul	%i6,	0x0FCF,	%l2
loop_1378:
	subccc	%l5,	0x1DDA,	%o0
	brnz	%o4,	loop_1379
	membar	0x48
	fzeros	%f1
	bcc	loop_1380
loop_1379:
	tle	%icc,	0x5
	edge8	%l4,	%l1,	%o7
	fors	%f25,	%f22,	%f2
loop_1380:
	fcmpne32	%f4,	%f22,	%o2
	fnot2	%f14,	%f2
	edge16	%g3,	%o3,	%g6
	umulcc	%g4,	%l6,	%o1
	popc	0x1A8F,	%o5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x15,	%f0
	edge8l	%i4,	%i7,	%i0
	lduw	[%l7 + 0x1C],	%g5
	brgz,a	%i5,	loop_1381
	fpsub32	%f2,	%f2,	%f12
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x3C] %asi,	%f15
loop_1381:
	subcc	%i3,	0x1AD8,	%i1
	brz	%g7,	loop_1382
	fbul,a	%fcc1,	loop_1383
	add	%l3,	%o6,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1382:
	pdist	%f18,	%f20,	%f2
loop_1383:
	alignaddr	%l0,	%g2,	%i6
	addcc	%l2,	0x1D55,	%l5
	umulcc	%o0,	%g1,	%l4
	tl	%xcc,	0x1
	move	%icc,	%o4,	%o7
	xor	%o2,	%g3,	%o3
	xnorcc	%g6,	0x0814,	%l1
	array32	%g4,	%l6,	%o5
	sir	0x1A07
	fmovsa	%icc,	%f27,	%f19
	membar	0x16
	alignaddr	%i4,	%o1,	%i0
	edge8	%i7,	%g5,	%i5
	fone	%f30
	fmovscs	%icc,	%f20,	%f24
	tvc	%xcc,	0x3
	wr	%g0,	0x20,	%asi
	stxa	%i3,	[%g0 + 0x38] %asi
	xorcc	%i1,	%l3,	%o6
	movgu	%icc,	%g7,	%i2
	fabss	%f5,	%f4
	movrlez	%l0,	%g2,	%l2
	stbar
	xorcc	%l5,	0x145F,	%o0
	fpack16	%f12,	%f28
	edge8l	%g1,	%l4,	%o4
	tvs	%icc,	0x3
	movcs	%xcc,	%i6,	%o2
	movleu	%icc,	%g3,	%o7
	xnorcc	%g6,	0x0763,	%o3
	nop
	set	0x6D, %g2
	ldub	[%l7 + %g2],	%g4
	bcs,a,pt	%icc,	loop_1384
	fmovrsgez	%l6,	%f11,	%f19
	fcmple16	%f30,	%f26,	%l1
	tl	%xcc,	0x0
loop_1384:
	tn	%xcc,	0x6
	tvs	%icc,	0x4
	addc	%o5,	0x0ED3,	%i4
	movrlz	%o1,	0x3B8,	%i0
	edge8	%g5,	%i5,	%i3
	ldsw	[%l7 + 0x38],	%i1
	fnegd	%f10,	%f16
	tcs	%xcc,	0x1
	ldsb	[%l7 + 0x2B],	%i7
	udiv	%l3,	0x1462,	%g7
	array32	%i2,	%o6,	%g2
	ba,pn	%xcc,	loop_1385
	membar	0x75
	fone	%f22
	fmovdneg	%xcc,	%f16,	%f1
loop_1385:
	fmovspos	%icc,	%f15,	%f27
	sdivcc	%l2,	0x1B10,	%l5
	flush	%l7 + 0x48
	tl	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%o0,	loop_1386
	orn	%g1,	0x1EBD,	%l0
	ldd	[%l7 + 0x18],	%f14
	tsubcc	%l4,	%i6,	%o2
loop_1386:
	tvs	%xcc,	0x6
	ta	%xcc,	0x7
	bge	loop_1387
	fbg	%fcc3,	loop_1388
	addccc	%o4,	0x07E2,	%g3
	subcc	%g6,	%o3,	%o7
loop_1387:
	movn	%xcc,	%l6,	%g4
loop_1388:
	ba,a,pn	%xcc,	loop_1389
	tpos	%icc,	0x0
	ldub	[%l7 + 0x5B],	%l1
	brlez,a	%i4,	loop_1390
loop_1389:
	bvc,a,pt	%xcc,	loop_1391
	fmovsleu	%xcc,	%f13,	%f2
	fcmpgt16	%f10,	%f8,	%o5
loop_1390:
	andncc	%i0,	%g5,	%i5
loop_1391:
	mova	%xcc,	%i3,	%o1
	edge8n	%i7,	%l3,	%g7
	array16	%i1,	%i2,	%o6
	te	%icc,	0x3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%l2
	fmovs	%f29,	%f2
	tle	%icc,	0x4
	sethi	0x0996,	%g2
	subc	%l5,	0x12B6,	%g1
	srl	%l0,	%l4,	%o0
	movrlez	%o2,	0x2A7,	%i6
	fmuld8ulx16	%f30,	%f0,	%f4
	movvs	%icc,	%g3,	%g6
	fbue	%fcc2,	loop_1392
	addcc	%o3,	0x0743,	%o4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
loop_1392:
	ldstub	[%l7 + 0x5F],	%g4
	addccc	%o7,	0x0D1A,	%l1
	subc	%i4,	0x06F6,	%i0
	alignaddr	%o5,	%i5,	%i3
	nop
	setx	loop_1393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn,a	loop_1394
	tcc	%icc,	0x2
	array16	%o1,	%i7,	%l3
loop_1393:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g5
loop_1394:
	bl,a,pn	%xcc,	loop_1395
	movpos	%xcc,	%g7,	%i2
	subcc	%i1,	0x12A6,	%l2
	fzeros	%f8
loop_1395:
	addc	%g2,	0x1B24,	%o6
	movleu	%xcc,	%g1,	%l5
	fsrc1	%f4,	%f20
	array16	%l4,	%l0,	%o0
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x04,	%i6
	tneg	%icc,	0x6
	ba,a,pt	%xcc,	loop_1396
	fmovdge	%xcc,	%f6,	%f8
	tsubcc	%o2,	%g3,	%g6
	ldsh	[%l7 + 0x46],	%o3
loop_1396:
	fmovdg	%icc,	%f29,	%f26
	movcs	%icc,	%o4,	%l6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%o7
	srl	%g4,	%i4,	%l1
	tleu	%xcc,	0x3
	fnot1	%f0,	%f12
	movvs	%icc,	%o5,	%i0
	fmovdg	%icc,	%f27,	%f7
	edge8	%i5,	%i3,	%i7
	fxors	%f16,	%f7,	%f5
	fmovdcc	%icc,	%f15,	%f0
	edge8n	%l3,	%g5,	%o1
	bvs	%xcc,	loop_1397
	tne	%xcc,	0x4
	fmovsneg	%xcc,	%f10,	%f19
	ldub	[%l7 + 0x15],	%g7
loop_1397:
	movvs	%icc,	%i1,	%l2
	tvs	%xcc,	0x1
	movrgz	%g2,	0x190,	%i2
	edge32l	%g1,	%l5,	%l4
	movne	%xcc,	%l0,	%o6
	brlez,a	%i6,	loop_1398
	fmovdcs	%xcc,	%f7,	%f6
	movrgez	%o2,	%o0,	%g6
	movneg	%icc,	%g3,	%o4
loop_1398:
	ble,pt	%icc,	loop_1399
	fcmped	%fcc2,	%f22,	%f2
	movre	%o3,	%o7,	%g4
	movn	%icc,	%i4,	%l1
loop_1399:
	fnot1s	%f17,	%f25
	ldstub	[%l7 + 0x40],	%o5
	orn	%l6,	0x061E,	%i5
	fcmpeq32	%f30,	%f10,	%i0
	ldd	[%l7 + 0x30],	%i6
	fcmped	%fcc0,	%f6,	%f24
	movcs	%icc,	%l3,	%i3
	movvs	%icc,	%o1,	%g7
	set	0x4F, %i7
	stba	%g5,	[%l7 + %i7] 0x18
	sethi	0x1087,	%i1
	movrlez	%l2,	%i2,	%g1
	edge8l	%l5,	%l4,	%g2
	fsrc1	%f22,	%f8
	ld	[%l7 + 0x7C],	%f23
	subccc	%o6,	0x0827,	%i6
	taddcc	%l0,	%o2,	%g6
	mulscc	%o0,	0x1265,	%g3
	fmovdgu	%xcc,	%f6,	%f25
	sethi	0x0BD8,	%o3
	bneg	%icc,	loop_1400
	xorcc	%o4,	%o7,	%g4
	fornot1s	%f18,	%f30,	%f14
	mulx	%l1,	0x19C9,	%i4
loop_1400:
	move	%icc,	%l6,	%o5
	fpadd32	%f16,	%f10,	%f14
	edge32l	%i0,	%i5,	%i7
	movrlz	%i3,	0x230,	%l3
	tne	%icc,	0x7
	bvs	%icc,	loop_1401
	tleu	%icc,	0x3
	ble,a,pt	%xcc,	loop_1402
	fbge	%fcc0,	loop_1403
loop_1401:
	tpos	%xcc,	0x7
	orcc	%o1,	%g5,	%g7
loop_1402:
	nop
	set	0x60, %i6
	sta	%f2,	[%l7 + %i6] 0x89
loop_1403:
	fmovdpos	%icc,	%f10,	%f14
	tle	%xcc,	0x3
	edge8ln	%l2,	%i2,	%g1
	popc	%l5,	%l4
	sdivcc	%g2,	0x0FB9,	%i1
	edge32l	%o6,	%i6,	%o2
	orcc	%g6,	%o0,	%l0
	movgu	%icc,	%o3,	%g3
	srl	%o7,	0x15,	%g4
	tsubcctv	%o4,	%i4,	%l6
	movrlez	%l1,	0x33A,	%i0
	umul	%i5,	0x0B21,	%o5
	smul	%i7,	0x1A24,	%i3
	ldstub	[%l7 + 0x3D],	%o1
	fandnot1	%f22,	%f0,	%f2
	bvc,a	loop_1404
	fnands	%f17,	%f6,	%f13
	movrlez	%l3,	0x359,	%g7
	edge16n	%l2,	%g5,	%i2
loop_1404:
	nop
	set	0x48, %i1
	swapa	[%l7 + %i1] 0x10,	%l5
	ba,pt	%icc,	loop_1405
	movcc	%xcc,	%l4,	%g2
	wr	%g0,	0x80,	%asi
	stwa	%i1,	[%l7 + 0x68] %asi
loop_1405:
	taddcc	%g1,	0x0CE9,	%o6
	stx	%o2,	[%l7 + 0x18]
	movrlz	%i6,	%g6,	%o0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l0
	movrlz	%g3,	%o3,	%o7
	tpos	%icc,	0x0
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%o4
	xnorcc	%i4,	0x015F,	%l6
	fmuld8ulx16	%f30,	%f28,	%f24
	subcc	%g4,	%i0,	%l1
	mulscc	%o5,	%i7,	%i3
	bvc	%icc,	loop_1406
	fandnot2s	%f24,	%f6,	%f25
	ba,pt	%xcc,	loop_1407
	fmul8ulx16	%f6,	%f22,	%f14
loop_1406:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o1,	%l3,	%g7
loop_1407:
	xnorcc	%i5,	0x093E,	%g5
	array8	%i2,	%l5,	%l4
	fpack16	%f28,	%f27
	orcc	%g2,	0x1F6B,	%l2
	fba,a	%fcc3,	loop_1408
	tcc	%xcc,	0x1
	bshuffle	%f30,	%f8,	%f4
	fbul,a	%fcc0,	loop_1409
loop_1408:
	fmul8sux16	%f20,	%f24,	%f26
	edge8ln	%i1,	%g1,	%o6
	or	%i6,	%g6,	%o2
loop_1409:
	nop
	set	0x0, %l0
	ldxa	[%g0 + %l0] 0x20,	%o0
	tneg	%icc,	0x7
	movpos	%xcc,	%l0,	%o3
	edge16ln	%o7,	%g3,	%i4
	brgz,a	%o4,	loop_1410
	fmovdneg	%xcc,	%f20,	%f17
	fmovda	%xcc,	%f23,	%f2
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0x0
loop_1410:
	tg	%xcc,	0x7
	fmovsne	%xcc,	%f22,	%f11
	fmovscs	%xcc,	%f23,	%f1
	movrgz	%i0,	%l6,	%o5
	set	0x4C, %o4
	sta	%f17,	[%l7 + %o4] 0x88
	sdivx	%l1,	0x0D97,	%i7
	fcmpgt16	%f28,	%f14,	%i3
	movrlez	%o1,	0x098,	%g7
	stx	%l3,	[%l7 + 0x28]
	bshuffle	%f30,	%f22,	%f28
	fnand	%f16,	%f4,	%f26
	tgu	%xcc,	0x1
	edge32	%g5,	%i5,	%l5
	srl	%l4,	0x09,	%i2
	tvs	%xcc,	0x7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%i1
	fbule,a	%fcc0,	loop_1411
	membar	0x5D
	ldsb	[%l7 + 0x61],	%l2
	srl	%g1,	%o6,	%i6
loop_1411:
	move	%xcc,	%g6,	%o2
	fmovscc	%xcc,	%f22,	%f16
	fmovdcc	%xcc,	%f5,	%f24
	sra	%o0,	0x13,	%l0
	fnors	%f5,	%f28,	%f14
	flush	%l7 + 0x60
	nop
	setx	loop_1412,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldstub	[%l7 + 0x3D],	%o3
	add	%o7,	0x027D,	%g3
	umulcc	%i4,	0x0FE7,	%g4
loop_1412:
	fmovdne	%icc,	%f26,	%f23
	bgu,a	loop_1413
	umulcc	%o4,	0x0D1E,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i0,	%o5,	%i7
loop_1413:
	subcc	%i3,	%l1,	%g7
	fbu,a	%fcc2,	loop_1414
	fmul8sux16	%f0,	%f28,	%f8
	fpsub32s	%f4,	%f3,	%f13
	popc	%l3,	%g5
loop_1414:
	sra	%i5,	0x16,	%o1
	fands	%f29,	%f27,	%f0
	fmovdvc	%xcc,	%f2,	%f8
	movpos	%icc,	%l5,	%l4
	stx	%i2,	[%l7 + 0x40]
	set	0x58, %i2
	ldxa	[%l7 + %i2] 0x11,	%g2
	movg	%xcc,	%i1,	%l2
	stbar
	edge32ln	%o6,	%g1,	%g6
	fandnot1	%f22,	%f4,	%f28
	fmovsle	%icc,	%f17,	%f11
	fmovrdne	%o2,	%f6,	%f14
	stbar
	taddcc	%i6,	0x0D9D,	%l0
	brlz,a	%o3,	loop_1415
	bleu,a	loop_1416
	fbe	%fcc0,	loop_1417
	movneg	%xcc,	%o0,	%o7
loop_1415:
	fmovspos	%icc,	%f1,	%f16
loop_1416:
	tcc	%xcc,	0x1
loop_1417:
	fmul8x16	%f1,	%f18,	%f30
	membar	0x54
	edge32	%i4,	%g4,	%o4
	tge	%icc,	0x6
	fble,a	%fcc1,	loop_1418
	tge	%xcc,	0x1
	brgz,a	%g3,	loop_1419
	fbl,a	%fcc2,	loop_1420
loop_1418:
	tcs	%icc,	0x1
	udivcc	%l6,	0x08BF,	%o5
loop_1419:
	fmovdgu	%xcc,	%f17,	%f9
loop_1420:
	array16	%i7,	%i3,	%i0
	alignaddr	%g7,	%l1,	%l3
	brnz,a	%i5,	loop_1421
	movre	%o1,	%g5,	%l4
	xnorcc	%i2,	0x18F7,	%l5
	smulcc	%g2,	%i1,	%l2
loop_1421:
	lduh	[%l7 + 0x40],	%o6
	movvs	%icc,	%g1,	%g6
	add	%i6,	%l0,	%o3
	stbar
	wr	%g0,	0xe2,	%asi
	stba	%o0,	[%l7 + 0x0E] %asi
	membar	#Sync
	fbu	%fcc2,	loop_1422
	andn	%o2,	%o7,	%i4
	fpackfix	%f28,	%f13
	fbl,a	%fcc1,	loop_1423
loop_1422:
	fbe,a	%fcc1,	loop_1424
	bne	loop_1425
	fmovde	%xcc,	%f3,	%f0
loop_1423:
	movl	%icc,	%o4,	%g4
loop_1424:
	fsrc2s	%f31,	%f12
loop_1425:
	tl	%xcc,	0x6
	movcc	%icc,	%l6,	%g3
	fmovda	%xcc,	%f10,	%f30
	mulx	%i7,	%i3,	%i0
	taddcctv	%g7,	%o5,	%l3
	fmovd	%f16,	%f18
	fba,a	%fcc2,	loop_1426
	fzeros	%f14
	fmul8x16au	%f3,	%f5,	%f14
	umulcc	%l1,	0x1E4B,	%i5
loop_1426:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x70] %asi,	%g5
	sllx	%l4,	0x1E,	%i2
	mulx	%o1,	0x013A,	%g2
	be,a,pn	%icc,	loop_1427
	sdivx	%l5,	0x1E9A,	%i1
	call	loop_1428
	fmovdleu	%xcc,	%f0,	%f21
loop_1427:
	for	%f2,	%f22,	%f14
	fmuld8ulx16	%f0,	%f12,	%f8
loop_1428:
	bleu	%icc,	loop_1429
	bgu	%xcc,	loop_1430
	mova	%xcc,	%o6,	%g1
	edge8l	%l2,	%i6,	%g6
loop_1429:
	fandnot1s	%f18,	%f21,	%f8
loop_1430:
	subccc	%l0,	0x0013,	%o3
	movcc	%xcc,	%o2,	%o7
	sdivcc	%i4,	0x0A2C,	%o0
	ldsh	[%l7 + 0x6A],	%g4
	pdist	%f16,	%f24,	%f6
	brlez,a	%l6,	loop_1431
	fbe	%fcc2,	loop_1432
	sra	%o4,	%g3,	%i3
	fornot1s	%f7,	%f20,	%f8
loop_1431:
	siam	0x7
loop_1432:
	movn	%xcc,	%i7,	%g7
	andncc	%i0,	%o5,	%l1
	edge8n	%l3,	%i5,	%l4
	tneg	%xcc,	0x1
	bge	loop_1433
	ta	%xcc,	0x2
	membar	0x1D
	edge16	%i2,	%o1,	%g5
loop_1433:
	xnorcc	%g2,	0x1AAC,	%i1
	xnor	%o6,	%g1,	%l2
	edge16n	%l5,	%g6,	%i6
	array16	%l0,	%o3,	%o2
	fmovdneg	%icc,	%f23,	%f10
	mova	%xcc,	%i4,	%o7
	fabss	%f31,	%f12
	fmovdge	%icc,	%f1,	%f1
	edge8n	%o0,	%g4,	%o4
	fands	%f12,	%f18,	%f25
	movg	%icc,	%g3,	%i3
	lduw	[%l7 + 0x6C],	%i7
	xnor	%g7,	%l6,	%i0
	edge32l	%o5,	%l3,	%i5
	tvc	%xcc,	0x6
	set	0x2E, %i4
	ldsha	[%l7 + %i4] 0x80,	%l4
	subc	%l1,	%o1,	%i2
	taddcctv	%g5,	%g2,	%o6
	stx	%i1,	[%l7 + 0x30]
	edge16ln	%g1,	%l5,	%l2
	pdist	%f8,	%f26,	%f18
	brgz,a	%i6,	loop_1434
	movre	%l0,	%o3,	%o2
	movne	%xcc,	%i4,	%o7
	bleu,a,pt	%xcc,	loop_1435
loop_1434:
	addcc	%g6,	%g4,	%o4
	movvs	%xcc,	%o0,	%i3
	fmovdg	%xcc,	%f12,	%f13
loop_1435:
	movrgz	%i7,	%g7,	%l6
	std	%g2,	[%l7 + 0x08]
	srl	%o5,	0x1F,	%l3
	membar	0x7A
	movcc	%icc,	%i5,	%i0
	orcc	%l1,	0x1EA3,	%l4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x70] %asi,	%f1
	sra	%o1,	%g5,	%g2
	set	0x30, %i0
	ldxa	[%g0 + %i0] 0x50,	%o6
	tcc	%icc,	0x3
	edge8ln	%i1,	%i2,	%g1
	movgu	%xcc,	%l2,	%l5
	fandnot1	%f28,	%f30,	%f6
	addc	%l0,	%o3,	%i6
	fmuld8ulx16	%f7,	%f28,	%f8
	fbne	%fcc1,	loop_1436
	fbg	%fcc1,	loop_1437
	movrgz	%i4,	0x333,	%o7
	ldx	[%l7 + 0x18],	%o2
loop_1436:
	fones	%f31
loop_1437:
	movrgez	%g6,	%o4,	%o0
	tsubcc	%i3,	%i7,	%g7
	srax	%g4,	%g3,	%o5
	movl	%icc,	%l6,	%l3
	fpack16	%f16,	%f29
	andn	%i5,	%l1,	%l4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrgez	%i0,	0x215,	%o1
	movrlz	%g5,	0x048,	%g2
	umulcc	%i1,	%o6,	%g1
	fmovrsgez	%i2,	%f11,	%f20
	edge16n	%l2,	%l0,	%l5
	smul	%i6,	%i4,	%o3
	sethi	0x0B3E,	%o7
	fbg,a	%fcc2,	loop_1438
	alignaddr	%g6,	%o4,	%o2
	sllx	%o0,	0x07,	%i3
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1438:
	fmovrdlez	%i7,	%f16,	%f10
	array32	%g4,	%g3,	%g7
	fmovrsne	%o5,	%f12,	%f27
	movneg	%icc,	%l6,	%l3
	fmovrslez	%i5,	%f30,	%f8
	tl	%icc,	0x5
	movrne	%l4,	%i0,	%l1
	st	%f7,	[%l7 + 0x60]
	ldd	[%l7 + 0x18],	%f2
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	tvs	%icc,	0x2
	xorcc	%g2,	%g5,	%i1
	fmovsge	%xcc,	%f17,	%f31
	fmovsle	%xcc,	%f11,	%f22
	alignaddrl	%g1,	%i2,	%l2
	fpadd32	%f2,	%f12,	%f14
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x3C] %asi,	%f30
	srax	%o6,	0x04,	%l0
	edge8l	%l5,	%i6,	%o3
	mova	%xcc,	%o7,	%g6
	fcmpne16	%f6,	%f2,	%o4
	xnor	%o2,	0x006A,	%i4
	edge32ln	%i3,	%i7,	%o0
	movrne	%g4,	0x226,	%g7
	addcc	%o5,	0x0B87,	%g3
	membar	0x5B
	fbn,a	%fcc1,	loop_1439
	fbg	%fcc3,	loop_1440
	sdivx	%l6,	0x1365,	%i5
	fmuld8sux16	%f4,	%f3,	%f30
loop_1439:
	fandnot1s	%f2,	%f23,	%f1
loop_1440:
	popc	0x0071,	%l4
	movpos	%icc,	%l3,	%i0
	movneg	%xcc,	%o1,	%g2
	faligndata	%f16,	%f6,	%f22
	umul	%g5,	%i1,	%g1
	fmovrdgez	%l1,	%f6,	%f12
	addccc	%i2,	%o6,	%l2
	sll	%l0,	%l5,	%i6
	andcc	%o7,	%o3,	%o4
	tcs	%icc,	0x4
	mulscc	%o2,	%i4,	%g6
	stx	%i3,	[%l7 + 0x08]
	fzeros	%f16
	fcmpne32	%f10,	%f20,	%o0
	fcmpgt16	%f16,	%f6,	%g4
	fmovscc	%icc,	%f22,	%f3
	movvc	%icc,	%i7,	%g7
	edge32n	%o5,	%l6,	%g3
	xor	%i5,	%l4,	%l3
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	te	%icc,	0x3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%i0
	orncc	%o1,	0x1CF8,	%g5
	tcc	%icc,	0x7
	bcs,a	loop_1441
	udivx	%i1,	0x19FC,	%g1
	bpos,a	%xcc,	loop_1442
	movrlez	%g2,	0x074,	%i2
loop_1441:
	popc	%l1,	%l2
	andcc	%l0,	0x174D,	%l5
loop_1442:
	movcc	%xcc,	%o6,	%i6
	fnors	%f28,	%f20,	%f22
	movre	%o7,	%o3,	%o4
	fbue	%fcc1,	loop_1443
	fmovd	%f30,	%f2
	umul	%i4,	0x0E24,	%g6
	edge16ln	%o2,	%i3,	%g4
loop_1443:
	stbar
	movcc	%xcc,	%o0,	%g7
	edge16n	%i7,	%l6,	%o5
	addccc	%g3,	%i5,	%l4
	edge8n	%i0,	%o1,	%g5
	fbo,a	%fcc2,	loop_1444
	orcc	%l3,	%i1,	%g2
	lduh	[%l7 + 0x62],	%i2
	mulscc	%l1,	0x15FA,	%l2
loop_1444:
	xnorcc	%g1,	0x034D,	%l5
	tpos	%icc,	0x2
	addccc	%l0,	%o6,	%i6
	umul	%o3,	%o4,	%i4
	bge	loop_1445
	st	%f5,	[%l7 + 0x58]
	movneg	%icc,	%o7,	%o2
	bcs,a	loop_1446
loop_1445:
	fzero	%f24
	movn	%xcc,	%i3,	%g6
	sub	%o0,	0x1B09,	%g4
loop_1446:
	fandnot2s	%f23,	%f17,	%f21
	movneg	%icc,	%i7,	%l6
	tl	%icc,	0x1
	tge	%icc,	0x6
	movleu	%xcc,	%o5,	%g7
	mova	%icc,	%i5,	%l4
	stw	%i0,	[%l7 + 0x2C]
	fble,a	%fcc2,	loop_1447
	fnors	%f19,	%f26,	%f2
	sdivcc	%g3,	0x13FE,	%g5
	stw	%o1,	[%l7 + 0x08]
loop_1447:
	fpack16	%f24,	%f8
	or	%l3,	0x0E4D,	%g2
	movcs	%icc,	%i2,	%l1
	ble	%xcc,	loop_1448
	fmovsge	%icc,	%f7,	%f26
	fcmpeq32	%f0,	%f10,	%l2
	fandnot2	%f6,	%f6,	%f30
loop_1448:
	fmovsvs	%icc,	%f28,	%f25
	bleu,a	%xcc,	loop_1449
	tn	%xcc,	0x4
	fbule,a	%fcc3,	loop_1450
	movrlz	%i1,	%l5,	%g1
loop_1449:
	subccc	%o6,	0x14AA,	%i6
	edge32ln	%l0,	%o4,	%i4
loop_1450:
	stw	%o3,	[%l7 + 0x08]
	fabss	%f7,	%f19
	add	%o2,	0x102F,	%o7
	fbue	%fcc1,	loop_1451
	sub	%g6,	0x122A,	%i3
	fmovsne	%xcc,	%f27,	%f1
	udivx	%o0,	0x0D62,	%g4
loop_1451:
	udivcc	%l6,	0x12C5,	%o5
	fpack16	%f0,	%f24
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%i7
	fbn	%fcc3,	loop_1452
	smul	%l4,	0x1F75,	%i0
	srlx	%g3,	0x1E,	%i5
	subccc	%o1,	%l3,	%g5
loop_1452:
	andn	%g2,	%l1,	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l5
	fcmple32	%f2,	%f4,	%l2
	movleu	%icc,	%o6,	%g1
	fbne	%fcc2,	loop_1453
	taddcc	%i6,	0x194B,	%o4
	movcs	%icc,	%i4,	%l0
	fmovsne	%xcc,	%f11,	%f3
loop_1453:
	array8	%o3,	%o2,	%o7
	fmul8sux16	%f2,	%f0,	%f18
	movl	%xcc,	%g6,	%i3
	tcs	%xcc,	0x0
	wr	%g0,	0x2f,	%asi
	stda	%g4,	[%l7 + 0x48] %asi
	membar	#Sync
	movvs	%xcc,	%o0,	%o5
	tvc	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1454
	sra	%g7,	0x13,	%l6
	ba,a	loop_1455
	smul	%l4,	%i0,	%i7
loop_1454:
	ldsb	[%l7 + 0x11],	%i5
	movge	%icc,	%o1,	%g3
loop_1455:
	movcs	%icc,	%l3,	%g2
	fcmps	%fcc3,	%f22,	%f16
	nop
	setx	loop_1456,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbule,a	%fcc2,	loop_1457
	fbne,a	%fcc1,	loop_1458
	tvs	%xcc,	0x5
loop_1456:
	fmovdvs	%icc,	%f3,	%f5
loop_1457:
	call	loop_1459
loop_1458:
	tcc	%icc,	0x7
	srl	%l1,	%i2,	%i1
	fbu,a	%fcc3,	loop_1460
loop_1459:
	movrne	%l5,	0x38D,	%g5
	fandnot2s	%f13,	%f17,	%f7
	movneg	%xcc,	%o6,	%g1
loop_1460:
	movvs	%xcc,	%i6,	%l2
	andn	%i4,	0x1F02,	%o4
	umul	%l0,	%o2,	%o7
	stw	%g6,	[%l7 + 0x20]
	movrne	%i3,	%o3,	%g4
	tvc	%icc,	0x0
	movpos	%icc,	%o5,	%o0
	edge32ln	%l6,	%g7,	%i0
	srl	%i7,	0x11,	%l4
	movn	%xcc,	%i5,	%o1
	edge32	%l3,	%g3,	%g2
	fmovrdlz	%i2,	%f12,	%f8
	fblg	%fcc3,	loop_1461
	te	%icc,	0x7
	fandnot2	%f20,	%f20,	%f16
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x04
loop_1461:
	fbuge	%fcc3,	loop_1462
	fbul	%fcc3,	loop_1463
	sll	%l1,	0x0A,	%l5
	alignaddr	%i1,	%o6,	%g5
loop_1462:
	movge	%icc,	%i6,	%l2
loop_1463:
	nop
	wr	%g0,	0x18,	%asi
	stwa	%g1,	[%l7 + 0x40] %asi
	move	%icc,	%o4,	%i4
	srax	%o2,	0x08,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g6,	%i3
	edge8l	%o7,	%g4,	%o3
	tneg	%xcc,	0x0
	edge32ln	%o0,	%o5,	%g7
	ldd	[%l7 + 0x58],	%i0
	mova	%icc,	%i7,	%l4
	movl	%icc,	%l6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l3,	0x1085,	%o1
	srl	%g2,	%g3,	%l1
	xnorcc	%i2,	%l5,	%o6
	set	0x68, %g7
	sta	%f30,	[%l7 + %g7] 0x80
	fcmpne32	%f20,	%f24,	%g5
	tcc	%icc,	0x7
	tsubcc	%i1,	%l2,	%i6
	fnands	%f16,	%f5,	%f7
	fpsub32s	%f25,	%f29,	%f4
	fbug	%fcc3,	loop_1464
	fpadd32s	%f16,	%f22,	%f5
	umulcc	%g1,	%i4,	%o4
	sllx	%o2,	0x14,	%g6
loop_1464:
	edge8	%l0,	%i3,	%o7
	ldd	[%l7 + 0x20],	%f20
	fmovdge	%icc,	%f3,	%f14
	ble,a,pn	%xcc,	loop_1465
	tvc	%xcc,	0x0
	fbue,a	%fcc2,	loop_1466
	xnorcc	%g4,	0x0AA4,	%o3
loop_1465:
	tgu	%xcc,	0x4
	tne	%icc,	0x2
loop_1466:
	orn	%o5,	0x185B,	%g7
	stx	%o0,	[%l7 + 0x20]
	addccc	%i7,	0x03C4,	%i0
	lduh	[%l7 + 0x76],	%l6
	subcc	%l4,	%i5,	%o1
	fands	%f24,	%f31,	%f19
	fpadd32s	%f19,	%f7,	%f31
	bg,a,pn	%xcc,	loop_1467
	orn	%g2,	%g3,	%l3
	movvs	%icc,	%l1,	%l5
	ldd	[%l7 + 0x38],	%o6
loop_1467:
	subc	%g5,	%i1,	%i2
	array16	%i6,	%g1,	%l2
	tcs	%xcc,	0x7
	array16	%i4,	%o4,	%g6
	ba,a,pn	%xcc,	loop_1468
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f0,	%f6,	%f8
	movgu	%icc,	%l0,	%o2
loop_1468:
	stbar
	fxnor	%f28,	%f10,	%f10
	tpos	%xcc,	0x4
	orncc	%i3,	%o7,	%o3
	umul	%o5,	%g4,	%o0
	bl,a	loop_1469
	edge8ln	%g7,	%i0,	%i7
	mulx	%l6,	0x1401,	%i5
	st	%f23,	[%l7 + 0x48]
loop_1469:
	fbul,a	%fcc1,	loop_1470
	umulcc	%o1,	%g2,	%g3
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f16
	nop
	setx	loop_1471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1470:
	tle	%icc,	0x3
	tg	%icc,	0x3
	tpos	%icc,	0x4
loop_1471:
	fornot2	%f14,	%f22,	%f2
	sdivcc	%l3,	0x1063,	%l1
	popc	%l5,	%l4
	fzeros	%f15
	movrne	%o6,	0x1B1,	%g5
	movl	%icc,	%i2,	%i1
	edge32l	%i6,	%l2,	%g1
	st	%f17,	[%l7 + 0x78]
	sethi	0x09C1,	%o4
	nop
	set	0x5E, %o5
	ldsh	[%l7 + %o5],	%g6
	udivcc	%i4,	0x0467,	%o2
	edge32l	%l0,	%i3,	%o7
	array32	%o3,	%g4,	%o0
	fmovsleu	%xcc,	%f20,	%f16
	smul	%g7,	%o5,	%i0
	movvc	%icc,	%i7,	%l6
	srl	%i5,	%o1,	%g2
	movn	%icc,	%l3,	%g3
	orn	%l1,	%l5,	%l4
	srl	%g5,	0x13,	%i2
	fabsd	%f24,	%f18
	tsubcctv	%i1,	0x053B,	%i6
	sdivcc	%l2,	0x0C43,	%o6
	fcmpd	%fcc1,	%f22,	%f24
	umul	%o4,	%g6,	%i4
	ldstub	[%l7 + 0x61],	%o2
	fpsub32	%f24,	%f12,	%f0
	movgu	%xcc,	%l0,	%i3
	andncc	%g1,	%o7,	%g4
	set	0x24, %l2
	lda	[%l7 + %l2] 0x88,	%f9
	addc	%o3,	%g7,	%o5
	fpadd16s	%f26,	%f9,	%f29
	movrlez	%i0,	0x065,	%i7
	tcc	%xcc,	0x4
	fbu,a	%fcc3,	loop_1472
	xnor	%o0,	0x06F1,	%i5
	movpos	%xcc,	%l6,	%g2
	taddcc	%l3,	%g3,	%l1
loop_1472:
	fnors	%f0,	%f21,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o1,	0x3EC,	%l4
	fxnors	%f26,	%f28,	%f31
	fzeros	%f2
	movneg	%icc,	%g5,	%i2
	tvs	%xcc,	0x1
	alignaddr	%l5,	%i6,	%i1
	fmul8x16al	%f31,	%f13,	%f30
	tvc	%icc,	0x6
	set	0x20, %l6
	stha	%l2,	[%l7 + %l6] 0x14
	array16	%o6,	%o4,	%g6
	and	%i4,	0x02D1,	%o2
	orcc	%i3,	%g1,	%l0
	tl	%xcc,	0x7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o3
	array16	%g4,	%g7,	%o5
	sethi	0x10E0,	%i7
	std	%i0,	[%l7 + 0x08]
	fmul8ulx16	%f28,	%f2,	%f10
	bvs,pt	%xcc,	loop_1473
	movrgez	%o0,	0x248,	%i5
	faligndata	%f14,	%f26,	%f18
	bcc,a	%xcc,	loop_1474
loop_1473:
	fmuld8ulx16	%f30,	%f31,	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l6,	%l3
loop_1474:
	or	%g3,	0x0E6F,	%l1
	edge32l	%g2,	%l4,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o1,	%i2
	nop
	setx loop_1475, %l0, %l1
	jmpl %l1, %i6
	edge32ln	%i1,	%l5,	%l2
	fmovdle	%xcc,	%f11,	%f27
	xnor	%o6,	%o4,	%g6
loop_1475:
	fnot1s	%f12,	%f22
	orncc	%o2,	%i4,	%i3
	fbge,a	%fcc1,	loop_1476
	fcmple16	%f12,	%f28,	%g1
	fbl	%fcc3,	loop_1477
	ld	[%l7 + 0x10],	%f22
loop_1476:
	xorcc	%o7,	%o3,	%l0
	movcs	%icc,	%g7,	%g4
loop_1477:
	bleu,a,pt	%xcc,	loop_1478
	edge16	%i7,	%o5,	%i0
	taddcc	%i5,	%o0,	%l6
	tne	%icc,	0x4
loop_1478:
	movge	%xcc,	%g3,	%l3
	fbu,a	%fcc1,	loop_1479
	edge16	%l1,	%g2,	%g5
	sllx	%l4,	0x00,	%i2
	udiv	%o1,	0x0FE2,	%i1
loop_1479:
	fmovdg	%xcc,	%f20,	%f27
	edge32n	%l5,	%i6,	%l2
	tcs	%xcc,	0x2
	smulcc	%o4,	%g6,	%o6
	tgu	%xcc,	0x1
	sethi	0x0F04,	%i4
	add	%o2,	%g1,	%i3
	edge16n	%o7,	%l0,	%g7
	fand	%f4,	%f14,	%f20
	or	%o3,	%g4,	%i7
	edge8	%i0,	%o5,	%i5
	fmovrsgz	%l6,	%f19,	%f3
	fbge	%fcc2,	loop_1480
	fbug,a	%fcc1,	loop_1481
	srlx	%o0,	0x08,	%g3
	te	%icc,	0x2
loop_1480:
	ldsh	[%l7 + 0x7E],	%l1
loop_1481:
	tg	%xcc,	0x6
	fnot2s	%f1,	%f9
	nop
	set	0x08, %o1
	ldsw	[%l7 + %o1],	%l3
	fbu	%fcc3,	loop_1482
	srax	%g2,	%g5,	%i2
	stbar
	sdivcc	%o1,	0x10D9,	%l4
loop_1482:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bge,pt	%icc,	loop_1483
	sir	0x1855
	srlx	%l5,	%i1,	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g6
loop_1483:
	fmovdg	%icc,	%f0,	%f17
	bl,a,pn	%icc,	loop_1484
	fbl	%fcc3,	loop_1485
	fmovd	%f12,	%f22
	set	0x34, %l3
	sta	%f9,	[%l7 + %l3] 0x80
loop_1484:
	tleu	%xcc,	0x6
loop_1485:
	bneg,a	%icc,	loop_1486
	edge16l	%o6,	%i6,	%o2
	fmovsgu	%icc,	%f15,	%f23
	prefetch	[%l7 + 0x18],	 0x0
loop_1486:
	fxors	%f26,	%f19,	%f23
	movrlez	%i4,	0x1CD,	%g1
	bcc,pn	%icc,	loop_1487
	fmovsn	%icc,	%f10,	%f9
	addc	%i3,	0x1079,	%l0
	fmovrdlez	%o7,	%f26,	%f22
loop_1487:
	brgez	%g7,	loop_1488
	fcmped	%fcc1,	%f2,	%f12
	fnors	%f28,	%f7,	%f22
	tcc	%xcc,	0x4
loop_1488:
	fbug,a	%fcc1,	loop_1489
	tge	%icc,	0x7
	smulcc	%g4,	%i7,	%o3
	movne	%icc,	%o5,	%i0
loop_1489:
	swap	[%l7 + 0x20],	%i5
	subc	%l6,	0x038C,	%o0
	addccc	%g3,	0x0E82,	%l1
	wr	%g0,	0x18,	%asi
	sta	%f9,	[%l7 + 0x18] %asi
	addc	%l3,	0x14AF,	%g2
	orn	%g5,	%i2,	%o1
	tsubcc	%l4,	0x0C4F,	%i1
	fpadd16s	%f0,	%f9,	%f3
	flush	%l7 + 0x10
	popc	%l2,	%l5
	movrne	%g6,	0x219,	%o6
	add	%i6,	0x01CE,	%o2
	movl	%icc,	%o4,	%i4
	bvc,a,pt	%xcc,	loop_1490
	bn,pn	%xcc,	loop_1491
	fzero	%f0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g1
loop_1490:
	fmovsne	%xcc,	%f2,	%f0
loop_1491:
	tvc	%xcc,	0x7
	fba,a	%fcc3,	loop_1492
	tgu	%icc,	0x6
	fzeros	%f13
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%o7
loop_1492:
	and	%l0,	%g7,	%g4
	subccc	%i7,	%o5,	%o3
	te	%icc,	0x2
	fbu	%fcc3,	loop_1493
	alignaddr	%i0,	%i5,	%l6
	bvs,pn	%xcc,	loop_1494
	addc	%o0,	%g3,	%l1
loop_1493:
	addc	%g2,	%l3,	%i2
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x11,	 0x2
loop_1494:
	sllx	%g5,	0x12,	%i1
	tge	%icc,	0x6
	tge	%xcc,	0x1
	membar	0x1C
	tcs	%icc,	0x4
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x48] %asi,	%l2
	tleu	%xcc,	0x1
	fmovdgu	%icc,	%f9,	%f8
	fbne,a	%fcc3,	loop_1495
	bleu,a,pt	%icc,	loop_1496
	movrlez	%l4,	0x290,	%l5
	set	0x370, %g4
	nop 	! 	nop 	! 	ldxa	[%g0 + %g4] 0x40,	%o6 ripped by fixASI40.pl ripped by fixASI40.pl
loop_1495:
	ldub	[%l7 + 0x51],	%i6
loop_1496:
	stx	%o2,	[%l7 + 0x68]
	edge8n	%o4,	%i4,	%i3
	movre	%g1,	%g6,	%o7
	tl	%xcc,	0x6
	movg	%xcc,	%g7,	%l0
	set	0x18, %g3
	ldswa	[%l7 + %g3] 0x11,	%g4
	fbo	%fcc1,	loop_1497
	edge8	%i7,	%o5,	%i0
	tvc	%icc,	0x6
	umul	%i5,	%l6,	%o3
loop_1497:
	srl	%o0,	0x17,	%g3
	fmovrdlz	%l1,	%f0,	%f26
	fmovdge	%icc,	%f22,	%f27
	movpos	%icc,	%g2,	%l3
	movvc	%xcc,	%o1,	%i2
	sra	%g5,	0x18,	%l2
	sethi	0x1C49,	%l4
	nop
	setx	loop_1498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%l5,	0x1F4F,	%o6
	addc	%i1,	%o2,	%i6
	fbe,a	%fcc2,	loop_1499
loop_1498:
	mulx	%i4,	%i3,	%o4
	fxnor	%f12,	%f28,	%f16
	fmovscs	%icc,	%f14,	%f8
loop_1499:
	edge32ln	%g1,	%o7,	%g6
	fcmpeq32	%f8,	%f28,	%l0
	array16	%g4,	%g7,	%i7
	fmovrdne	%o5,	%f8,	%f26
	add	%i5,	0x0118,	%l6
	fbu,a	%fcc2,	loop_1500
	fbu,a	%fcc0,	loop_1501
	move	%icc,	%o3,	%i0
	swap	[%l7 + 0x34],	%g3
loop_1500:
	add	%o0,	%l1,	%g2
loop_1501:
	movvc	%icc,	%o1,	%l3
	edge32l	%g5,	%i2,	%l4
	fpadd32	%f30,	%f2,	%f12
	brz,a	%l5,	loop_1502
	andncc	%o6,	%l2,	%o2
	andcc	%i1,	0x0E56,	%i6
	alignaddr	%i4,	%i3,	%g1
loop_1502:
	srlx	%o7,	%g6,	%o4
	fxors	%f15,	%f31,	%f20
	ba,a,pn	%xcc,	loop_1503
	fmovdn	%xcc,	%f23,	%f19
	orn	%g4,	0x02B2,	%l0
	fmul8x16al	%f9,	%f7,	%f12
loop_1503:
	nop
	set	0x14, %g1
	ldswa	[%l7 + %g1] 0x80,	%i7
	nop
	set	0x44, %o7
	ldsb	[%l7 + %o7],	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x04,	%i5,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o3
	popc	0x05CA,	%i0
	fmovdgu	%xcc,	%f14,	%f29
	fpadd16s	%f12,	%f2,	%f25
	addcc	%o5,	0x0F46,	%o0
	movneg	%xcc,	%g3,	%g2
	tvs	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x5E] %asi,	%o1
	movleu	%icc,	%l3,	%g5
	movg	%xcc,	%l1,	%l4
	fpsub32s	%f11,	%f12,	%f12
	fsrc2s	%f25,	%f27
	fpadd16s	%f17,	%f19,	%f11
	movneg	%icc,	%l5,	%o6
	udivx	%l2,	0x0C8B,	%i2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movne	%icc,	%i1,	%o2
	fblg	%fcc2,	loop_1504
	fmovsvs	%icc,	%f6,	%f29
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f0
loop_1504:
	edge8ln	%i6,	%i3,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i4,	%o7
	sll	%o4,	%g6,	%l0
	udivcc	%g4,	0x017A,	%g7
	edge16n	%i7,	%i5,	%o3
	tl	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f10,	%f26,	%f20
	wr	%g0,	0xe3,	%asi
	stwa	%i0,	[%l7 + 0x5C] %asi
	membar	#Sync
	fxor	%f28,	%f16,	%f10
	movre	%l6,	0x116,	%o5
	fmovs	%f6,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f25,	%f31
	st	%f5,	[%l7 + 0x58]
	stbar
	xnorcc	%o0,	%g2,	%o1
	movvc	%xcc,	%g3,	%g5
	fxnor	%f30,	%f12,	%f22
	movrlez	%l1,	%l4,	%l5
	stx	%o6,	[%l7 + 0x28]
	fble,a	%fcc1,	loop_1505
	tvs	%xcc,	0x0
	brz	%l3,	loop_1506
	brlez,a	%i2,	loop_1507
loop_1505:
	fmul8x16au	%f14,	%f17,	%f2
	set	0x80, %o0
	ldxa	[%g0 + %o0] 0x58,	%l2
loop_1506:
	alignaddrl	%o2,	%i6,	%i3
loop_1507:
	stx	%i1,	[%l7 + 0x48]
	tpos	%xcc,	0x1
	fcmpgt16	%f4,	%f30,	%i4
	set	0x18, %g5
	sta	%f19,	[%l7 + %g5] 0x88
	fone	%f20
	fba	%fcc3,	loop_1508
	fnot2s	%f18,	%f12
	umulcc	%o7,	%g1,	%o4
	fnot1s	%f21,	%f10
loop_1508:
	umul	%l0,	0x0DB6,	%g4
	srax	%g6,	0x14,	%g7
	fbe	%fcc2,	loop_1509
	umul	%i7,	%o3,	%i0
	array32	%i5,	%l6,	%o0
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x16,	%f16
loop_1509:
	fnot2s	%f0,	%f17
	call	loop_1510
	taddcc	%g2,	0x1343,	%o1
	edge8n	%g3,	%g5,	%o5
	sdivcc	%l1,	0x07D6,	%l5
loop_1510:
	te	%xcc,	0x1
	movpos	%xcc,	%o6,	%l3
	or	%i2,	0x1067,	%l2
	mova	%xcc,	%o2,	%l4
	edge8ln	%i3,	%i1,	%i4
	or	%o7,	0x0AD6,	%g1
	sll	%o4,	%i6,	%l0
	tsubcc	%g4,	0x0DC2,	%g6
	edge16n	%i7,	%g7,	%o3
	tneg	%xcc,	0x5
	movpos	%icc,	%i0,	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i5,	%g2
	movcc	%icc,	%o1,	%o0
	or	%g3,	%o5,	%l1
	set	0x68, %i7
	sta	%f24,	[%l7 + %i7] 0x10
	edge16n	%g5,	%l5,	%o6
	fmovsg	%icc,	%f16,	%f16
	bcc,a,pt	%xcc,	loop_1511
	stbar
	wr	%g0,	0xea,	%asi
	stha	%l3,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1511:
	udivx	%i2,	0x0EAD,	%l2
	movl	%xcc,	%o2,	%i3
	fpmerge	%f25,	%f11,	%f16
	tvc	%icc,	0x1
	fabss	%f0,	%f24
	swap	[%l7 + 0x5C],	%l4
	fzero	%f4
	edge8n	%i4,	%i1,	%o7
	lduw	[%l7 + 0x60],	%g1
	ba,a	loop_1512
	movneg	%icc,	%i6,	%o4
	movvs	%icc,	%l0,	%g6
	brz,a	%g4,	loop_1513
loop_1512:
	sdivx	%i7,	0x17CC,	%g7
	sdiv	%i0,	0x0CF5,	%o3
	fbo	%fcc3,	loop_1514
loop_1513:
	membar	0x26
	srlx	%l6,	0x14,	%g2
	xnor	%i5,	0x144D,	%o1
loop_1514:
	nop
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x89,	%g3
	or	%o5,	0x0678,	%l1
	edge32l	%o0,	%g5,	%l5
	fbo,a	%fcc1,	loop_1515
	membar	0x16
	fble	%fcc2,	loop_1516
	taddcctv	%l3,	0x0628,	%i2
loop_1515:
	xnor	%l2,	%o6,	%o2
	sdivcc	%l4,	0x13B0,	%i4
loop_1516:
	tsubcctv	%i3,	%i1,	%o7
	addccc	%i6,	0x0F40,	%o4
	brlz	%g1,	loop_1517
	popc	0x162E,	%g6
	smulcc	%g4,	0x0F7C,	%l0
	tcc	%icc,	0x1
loop_1517:
	fbg	%fcc3,	loop_1518
	ba,pt	%icc,	loop_1519
	sdivcc	%i7,	0x020C,	%g7
	movne	%icc,	%i0,	%o3
loop_1518:
	andn	%l6,	0x0F64,	%g2
loop_1519:
	xnorcc	%i5,	0x160D,	%g3
	flush	%l7 + 0x5C
	tpos	%xcc,	0x6
	fcmpgt16	%f16,	%f24,	%o5
	sra	%o1,	0x16,	%l1
	fpack16	%f20,	%f28
	orn	%o0,	%g5,	%l5
	tcs	%icc,	0x4
	ba,a,pt	%icc,	loop_1520
	mova	%xcc,	%l3,	%l2
	movre	%i2,	0x3C3,	%o2
	tsubcctv	%o6,	0x0161,	%l4
loop_1520:
	for	%f6,	%f10,	%f2
	movrlez	%i3,	0x011,	%i4
	fmovscs	%xcc,	%f26,	%f3
	xnor	%i1,	%o7,	%o4
	fsrc2s	%f20,	%f21
	taddcctv	%i6,	0x0CE9,	%g6
	srlx	%g1,	0x05,	%g4
	nop
	setx	loop_1521,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l0,	%g7,	%i7
	tsubcc	%i0,	%l6,	%o3
	edge8ln	%g2,	%g3,	%o5
loop_1521:
	sethi	0x10CA,	%i5
	sdivcc	%o1,	0x1678,	%l1
	set	0x30, %g2
	swapa	[%l7 + %g2] 0x80,	%o0
	tle	%icc,	0x5
	fbug,a	%fcc2,	loop_1522
	add	%g5,	%l5,	%l2
	movneg	%icc,	%l3,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1522:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1C, %i5
	swapa	[%l7 + %i5] 0x88,	%o6
	fmovrsne	%l4,	%f25,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x34],	%i3
	fnand	%f0,	%f14,	%f30
	ld	[%l7 + 0x28],	%f20
	movrgez	%i4,	%o2,	%i1
	brgez	%o7,	loop_1523
	fsrc2	%f30,	%f24
	sth	%o4,	[%l7 + 0x1C]
	addcc	%i6,	%g1,	%g4
loop_1523:
	fpmerge	%f4,	%f23,	%f4
	smulcc	%l0,	%g7,	%i7
	brz	%i0,	loop_1524
	ba,pn	%xcc,	loop_1525
	movne	%xcc,	%l6,	%o3
	alignaddr	%g2,	%g3,	%o5
loop_1524:
	xnorcc	%i5,	%g6,	%l1
loop_1525:
	addccc	%o1,	%o0,	%g5
	array32	%l5,	%l3,	%i2
	fblg,a	%fcc0,	loop_1526
	mulscc	%o6,	%l4,	%i3
	sllx	%i4,	%l2,	%i1
	flush	%l7 + 0x38
loop_1526:
	orncc	%o2,	0x02D1,	%o7
	set	0x28, %i1
	stda	%i6,	[%l7 + %i1] 0x81
	udiv	%o4,	0x1443,	%g1
	fmovdgu	%xcc,	%f13,	%f14
	tne	%xcc,	0x0
	fmovsvs	%icc,	%f26,	%f27
	tcc	%xcc,	0x2
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x80,	%g4
	movge	%xcc,	%l0,	%g7
	movgu	%xcc,	%i7,	%i0
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x19,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x110, %i2
	stxa	%l6,	[%g0 + %i2] 0x21
	tg	%xcc,	0x3
	movne	%xcc,	%g3,	%o5
	ldub	[%l7 + 0x25],	%i5
	subccc	%g6,	0x0670,	%g2
	sdivcc	%l1,	0x1A13,	%o0
	fbule	%fcc3,	loop_1527
	add	%o1,	0x188F,	%g5
	andcc	%l3,	0x0526,	%l5
	array8	%o6,	%l4,	%i2
loop_1527:
	alignaddr	%i3,	%l2,	%i1
	fbug,a	%fcc0,	loop_1528
	fnot2	%f2,	%f12
	smul	%i4,	%o2,	%i6
	fmovsn	%icc,	%f27,	%f18
loop_1528:
	movle	%xcc,	%o7,	%g1
	fmul8x16	%f23,	%f22,	%f16
	brz,a	%o4,	loop_1529
	tcs	%xcc,	0x0
	sth	%l0,	[%l7 + 0x68]
	tcs	%icc,	0x4
loop_1529:
	fnor	%f8,	%f22,	%f12
	fandnot1	%f6,	%f4,	%f6
	sll	%g4,	0x08,	%g7
	addc	%i7,	%i0,	%o3
	movrne	%g3,	0x18F,	%o5
	fmovda	%xcc,	%f0,	%f22
	brnz,a	%i5,	loop_1530
	bvs	%icc,	loop_1531
	movle	%xcc,	%g6,	%l6
	tcs	%xcc,	0x0
loop_1530:
	brlz,a	%g2,	loop_1532
loop_1531:
	fmovdg	%xcc,	%f3,	%f5
	movne	%icc,	%o0,	%l1
	tleu	%xcc,	0x4
loop_1532:
	sra	%g5,	0x13,	%l3
	fbul,a	%fcc2,	loop_1533
	movpos	%icc,	%o1,	%l5
	ldd	[%l7 + 0x58],	%o6
	alignaddrl	%i2,	%l4,	%l2
loop_1533:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i1,	%i4
	tsubcctv	%o2,	0x12B0,	%i6
	bvs,a,pt	%xcc,	loop_1534
	array8	%o7,	%g1,	%o4
	mulx	%i3,	0x1698,	%g4
	edge8ln	%l0,	%g7,	%i0
loop_1534:
	movle	%icc,	%o3,	%g3
	xor	%i7,	0x0322,	%o5
	taddcctv	%i5,	%g6,	%l6
	bvs,a	%xcc,	loop_1535
	fmovrde	%o0,	%f22,	%f28
	bpos,pn	%icc,	loop_1536
	fbul	%fcc1,	loop_1537
loop_1535:
	fmovsleu	%icc,	%f27,	%f29
	taddcctv	%l1,	%g5,	%l3
loop_1536:
	edge16ln	%o1,	%l5,	%g2
loop_1537:
	edge16l	%i2,	%l4,	%o6
	fsrc2s	%f17,	%f18
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	fblg,a	%fcc0,	loop_1538
	srlx	%l2,	0x05,	%i1
	tvs	%icc,	0x6
	fmovdg	%xcc,	%f15,	%f17
loop_1538:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%o2
	tl	%icc,	0x1
	smulcc	%i4,	%i6,	%g1
	and	%o7,	0x06C6,	%i3
	movl	%xcc,	%g4,	%o4
	andncc	%l0,	%i0,	%g7
	fandnot1	%f16,	%f28,	%f18
	bleu,pt	%icc,	loop_1539
	movl	%icc,	%g3,	%o3
	movn	%icc,	%o5,	%i5
	fnegd	%f24,	%f16
loop_1539:
	movn	%xcc,	%i7,	%l6
	alignaddrl	%g6,	%l1,	%g5
	nop
	setx	loop_1540,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%o0,	%l3,	%o1
	edge16ln	%g2,	%l5,	%i2
	edge32ln	%o6,	%l4,	%l2
loop_1540:
	fmovse	%icc,	%f24,	%f24
	alignaddr	%o2,	%i1,	%i6
	set	0x74, %i0
	lduha	[%l7 + %i0] 0x10,	%g1
	fmuld8sux16	%f13,	%f9,	%f12
	tge	%xcc,	0x7
	te	%icc,	0x0
	nop
	setx	loop_1541,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%o7,	0x12A9,	%i3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x6A] %asi,	%g4
loop_1541:
	sllx	%o4,	%i4,	%i0
	movne	%xcc,	%g7,	%l0
	fbuge,a	%fcc2,	loop_1542
	edge8ln	%o3,	%g3,	%o5
	movre	%i7,	%i5,	%g6
	fmovdle	%xcc,	%f26,	%f12
loop_1542:
	edge8n	%l6,	%g5,	%l1
	smulcc	%l3,	0x0938,	%o0
	fpadd16s	%f10,	%f30,	%f14
	fmovrslz	%o1,	%f30,	%f26
	movrlz	%l5,	%i2,	%o6
	nop
	set	0x3D, %i3
	ldstub	[%l7 + %i3],	%l4
	movn	%xcc,	%g2,	%o2
	movcc	%xcc,	%i1,	%i6
	fbu,a	%fcc3,	loop_1543
	fmovrslz	%l2,	%f24,	%f4
	edge32n	%g1,	%i3,	%o7
	movne	%xcc,	%o4,	%i4
loop_1543:
	tn	%xcc,	0x6
	fmovsge	%xcc,	%f28,	%f17
	movcc	%xcc,	%g4,	%i0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x51] %asi,	%l0
	set	0x4C, %o3
	ldswa	[%l7 + %o3] 0x81,	%g7
	fmovrsgez	%o3,	%f15,	%f6
	movcs	%xcc,	%o5,	%i7
	ba,a,pt	%icc,	loop_1544
	fbn	%fcc3,	loop_1545
	edge8ln	%g3,	%i5,	%g6
	edge16l	%g5,	%l6,	%l3
loop_1544:
	srl	%o0,	%l1,	%l5
loop_1545:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x5E] %asi,	%o1
	movrlz	%i2,	0x311,	%l4
	orncc	%o6,	0x1661,	%o2
	andncc	%g2,	%i1,	%i6
	bvc	loop_1546
	sth	%g1,	[%l7 + 0x50]
	edge8l	%l2,	%o7,	%i3
	fbul,a	%fcc2,	loop_1547
loop_1546:
	and	%o4,	0x0CCB,	%i4
	set	0x38, %g7
	lda	[%l7 + %g7] 0x04,	%f13
loop_1547:
	fcmpeq32	%f16,	%f18,	%g4
	movn	%xcc,	%l0,	%g7
	edge32l	%i0,	%o5,	%o3
	fmuld8sux16	%f22,	%f26,	%f8
	umulcc	%g3,	%i5,	%i7
	srl	%g6,	0x08,	%l6
	brlz	%g5,	loop_1548
	fcmpne16	%f8,	%f10,	%l3
	andncc	%l1,	%l5,	%o0
	fcmps	%fcc1,	%f7,	%f10
loop_1548:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o1,	%i2,	%l4
	fmul8sux16	%f18,	%f18,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o6,	%o2,	%g2
	udivcc	%i1,	0x0DB9,	%i6
	umul	%g1,	%l2,	%i3
	edge16	%o7,	%i4,	%g4
	set	0x5C, %o6
	lduwa	[%l7 + %o6] 0x89,	%o4
	siam	0x3
	bl,a,pt	%icc,	loop_1549
	tne	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f18,	%f16
loop_1549:
	srl	%l0,	0x16,	%i0
	fcmple16	%f30,	%f0,	%o5
	fcmpgt32	%f26,	%f14,	%o3
	flush	%l7 + 0x4C
	movneg	%xcc,	%g3,	%g7
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x22] %asi,	%i5
	or	%g6,	%l6,	%i7
	brz,a	%l3,	loop_1550
	fnand	%f6,	%f0,	%f16
	movcc	%icc,	%l1,	%l5
	tcc	%xcc,	0x1
loop_1550:
	bleu,a,pt	%icc,	loop_1551
	tle	%xcc,	0x4
	fmovsgu	%xcc,	%f16,	%f2
	fbo,a	%fcc3,	loop_1552
loop_1551:
	movcs	%xcc,	%g5,	%o0
	movn	%icc,	%i2,	%o1
	tn	%icc,	0x5
loop_1552:
	movrgez	%l4,	0x0CB,	%o2
	srl	%o6,	%i1,	%g2
	fnor	%f12,	%f18,	%f30
	fbo,a	%fcc0,	loop_1553
	ldstub	[%l7 + 0x6E],	%i6
	fzero	%f28
	addccc	%g1,	%i3,	%l2
loop_1553:
	st	%f15,	[%l7 + 0x4C]
	bne,pn	%xcc,	loop_1554
	umulcc	%o7,	0x1FC8,	%i4
	addcc	%g4,	0x1832,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1554:
	sra	%o4,	%o5,	%i0
	sllx	%g3,	0x0F,	%g7
	movcc	%icc,	%o3,	%i5
	fmovdneg	%xcc,	%f0,	%f27
	movle	%xcc,	%l6,	%g6
	fmuld8ulx16	%f6,	%f21,	%f28
	subcc	%l3,	0x0B65,	%i7
	fnot1s	%f20,	%f22
	faligndata	%f24,	%f12,	%f0
	tcs	%icc,	0x2
	smulcc	%l1,	%g5,	%o0
	sub	%l5,	0x067F,	%i2
	tle	%icc,	0x3
	fornot2s	%f30,	%f9,	%f26
	fmovsleu	%xcc,	%f26,	%f14
	sdiv	%o1,	0x005B,	%o2
	tg	%icc,	0x1
	andcc	%o6,	0x0476,	%l4
	movgu	%xcc,	%i1,	%g2
	fmovrsgez	%g1,	%f29,	%f26
	move	%xcc,	%i6,	%i3
	addcc	%l2,	0x0E4F,	%i4
	movrlz	%o7,	%l0,	%g4
	addc	%o4,	0x0376,	%o5
	fmovrdgez	%i0,	%f14,	%f8
	brlez	%g3,	loop_1555
	fbul,a	%fcc2,	loop_1556
	fmovrdgez	%g7,	%f8,	%f30
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o3,	%l6
loop_1555:
	fmovrsgez	%g6,	%f17,	%f4
loop_1556:
	tpos	%xcc,	0x5
	edge16n	%l3,	%i7,	%l1
	popc	%i5,	%g5
	set	0x40, %o5
	sta	%f30,	[%l7 + %o5] 0x0c
	nop
	setx	loop_1557,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2s	%f31,	%f10
	edge8l	%o0,	%l5,	%i2
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1557:
	fandnot2	%f0,	%f24,	%f26
	tcs	%xcc,	0x1
	set	0x5E, %l2
	stha	%o2,	[%l7 + %l2] 0x18
	fmovrde	%o1,	%f30,	%f18
	bn,a	%xcc,	loop_1558
	movge	%icc,	%l4,	%i1
	edge16n	%o6,	%g2,	%i6
	fba	%fcc2,	loop_1559
loop_1558:
	nop
	setx loop_1560, %l0, %l1
	jmpl %l1, %i3
	edge16	%l2,	%g1,	%i4
	mulx	%l0,	0x13A6,	%o7
loop_1559:
	taddcctv	%o4,	0x002A,	%g4
loop_1560:
	sir	0x09A9
	mulx	%o5,	%g3,	%i0
	wr	%g0,	0x2b,	%asi
	stda	%g6,	[%l7 + 0x58] %asi
	membar	#Sync
	andncc	%o3,	%g6,	%l6
	edge16	%i7,	%l3,	%i5
	array32	%l1,	%o0,	%l5
	and	%i2,	%g5,	%o1
	srax	%l4,	0x0E,	%o2
	move	%xcc,	%i1,	%g2
	swap	[%l7 + 0x24],	%i6
	tleu	%xcc,	0x7
	edge8	%o6,	%l2,	%g1
	fbge,a	%fcc3,	loop_1561
	fble	%fcc2,	loop_1562
	sdivx	%i3,	0x1C86,	%i4
	stw	%l0,	[%l7 + 0x60]
loop_1561:
	fmovsa	%xcc,	%f7,	%f2
loop_1562:
	fmovdle	%xcc,	%f22,	%f2
	sdiv	%o4,	0x10E8,	%g4
	srl	%o5,	%g3,	%o7
	umulcc	%g7,	0x1BF2,	%i0
	edge8n	%o3,	%l6,	%i7
	fmovs	%f11,	%f1
	fbul	%fcc3,	loop_1563
	fbn,a	%fcc0,	loop_1564
	edge16	%g6,	%i5,	%l3
	movl	%icc,	%o0,	%l1
loop_1563:
	addccc	%l5,	%g5,	%i2
loop_1564:
	fnands	%f10,	%f9,	%f9
	edge8ln	%l4,	%o2,	%o1
	tn	%xcc,	0x5
	edge8ln	%i1,	%i6,	%g2
	movle	%xcc,	%l2,	%g1
	edge32	%i3,	%o6,	%i4
	set	0x18, %l6
	stda	%l0,	[%l7 + %l6] 0x81
	edge8l	%o4,	%o5,	%g3
	set	0x1D, %o1
	lduba	[%l7 + %o1] 0x14,	%o7
	fxor	%f8,	%f26,	%f4
	fnors	%f26,	%f26,	%f31
	srlx	%g4,	0x1F,	%g7
	tn	%xcc,	0x5
	fcmpes	%fcc1,	%f9,	%f1
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x77] %asi,	%o3
	tgu	%xcc,	0x0
	movvs	%xcc,	%l6,	%i7
	movrgz	%i0,	0x30C,	%i5
	tvs	%xcc,	0x6
	edge16n	%g6,	%l3,	%o0
	tcc	%icc,	0x1
	movle	%xcc,	%l1,	%l5
	movvc	%icc,	%i2,	%l4
	movvs	%xcc,	%o2,	%g5
	udivx	%i1,	0x1E59,	%o1
	bvs,a	loop_1565
	fandnot1s	%f0,	%f10,	%f13
	mulx	%i6,	0x11DD,	%g2
	fmovsle	%icc,	%f25,	%f31
loop_1565:
	popc	0x0182,	%g1
	sub	%i3,	%o6,	%i4
	fbne,a	%fcc1,	loop_1566
	andn	%l2,	0x100C,	%l0
	edge32l	%o4,	%o5,	%g3
	movpos	%xcc,	%g4,	%o7
loop_1566:
	nop
	set	0x50, %l3
	stda	%g6,	[%l7 + %l3] 0x15
	edge16	%o3,	%i7,	%i0
	movrlez	%i5,	%l6,	%g6
	sir	0x06FA
	tne	%xcc,	0x2
	srlx	%l3,	0x14,	%o0
	fmovsle	%xcc,	%f3,	%f6
	fmovsleu	%xcc,	%f29,	%f2
	movg	%xcc,	%l1,	%i2
	sdivx	%l4,	0x0C28,	%l5
	movcc	%xcc,	%g5,	%o2
	subccc	%o1,	0x042F,	%i1
	faligndata	%f0,	%f4,	%f12
	andn	%i6,	0x13A2,	%g1
	array32	%i3,	%g2,	%o6
	fbg,a	%fcc0,	loop_1567
	srlx	%i4,	0x0F,	%l0
	fmovdn	%xcc,	%f0,	%f0
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x22,	%l2
loop_1567:
	tne	%xcc,	0x1
	set	0x50, %g6
	stha	%o5,	[%l7 + %g6] 0x23
	membar	#Sync
	and	%g3,	%o4,	%o7
	tge	%icc,	0x7
	tvc	%icc,	0x2
	edge32	%g7,	%o3,	%g4
	tpos	%icc,	0x3
	array32	%i7,	%i5,	%i0
	fbul,a	%fcc0,	loop_1568
	smulcc	%l6,	%g6,	%o0
	udivcc	%l1,	0x1138,	%i2
	fcmpeq32	%f10,	%f16,	%l4
loop_1568:
	fpack32	%f20,	%f26,	%f18
	brz,a	%l3,	loop_1569
	edge16ln	%g5,	%l5,	%o1
	movg	%xcc,	%i1,	%o2
	alignaddr	%g1,	%i6,	%i3
loop_1569:
	subccc	%o6,	%i4,	%g2
	ta	%icc,	0x2
	tle	%xcc,	0x3
	call	loop_1570
	movrne	%l2,	0x1C3,	%o5
	ble,a,pt	%xcc,	loop_1571
	fornot1s	%f8,	%f26,	%f30
loop_1570:
	udivcc	%g3,	0x1230,	%l0
	sdiv	%o7,	0x0C5B,	%o4
loop_1571:
	tcs	%xcc,	0x6
	movcs	%icc,	%g7,	%o3
	umul	%g4,	%i5,	%i0
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i7
	udiv	%l6,	0x151A,	%o0
	fcmpes	%fcc0,	%f14,	%f1
	edge32	%l1,	%g6,	%l4
	fmovsvc	%xcc,	%f2,	%f24
	sdiv	%l3,	0x1179,	%i2
	fbul	%fcc3,	loop_1572
	fbg	%fcc3,	loop_1573
	fmovdle	%xcc,	%f12,	%f7
	sll	%l5,	%o1,	%g5
loop_1572:
	fmovsneg	%icc,	%f16,	%f22
loop_1573:
	movcs	%icc,	%i1,	%g1
	fbl,a	%fcc2,	loop_1574
	fnot2	%f16,	%f16
	movre	%i6,	0x1C5,	%o2
	smul	%i3,	%o6,	%i4
loop_1574:
	edge32l	%l2,	%g2,	%o5
	mulx	%l0,	0x0ABC,	%g3
	tg	%xcc,	0x3
	tsubcc	%o4,	%o7,	%o3
	fpadd32s	%f3,	%f15,	%f10
	xorcc	%g4,	%i5,	%i0
	std	%g6,	[%l7 + 0x48]
	bneg,pt	%icc,	loop_1575
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f26,	%f20
	movle	%icc,	%l6,	%o0
loop_1575:
	edge16ln	%l1,	%i7,	%g6
	membar	0x13
	edge8	%l4,	%i2,	%l3
	subc	%o1,	%g5,	%l5
	bne,a	%icc,	loop_1576
	fornot1s	%f19,	%f24,	%f2
	fmovrdlez	%i1,	%f16,	%f20
	fcmps	%fcc2,	%f27,	%f9
loop_1576:
	subc	%g1,	0x1C82,	%i6
	bl,a,pn	%icc,	loop_1577
	fmovrdgez	%i3,	%f12,	%f14
	tne	%icc,	0x5
	fmovrde	%o2,	%f20,	%f12
loop_1577:
	andncc	%o6,	%l2,	%g2
	wr	%g0,	0xeb,	%asi
	stba	%i4,	[%l7 + 0x6C] %asi
	membar	#Sync
	set	0x1A, %l4
	stha	%l0,	[%l7 + %l4] 0x14
	brnz,a	%o5,	loop_1578
	be	%xcc,	loop_1579
	subc	%o4,	%g3,	%o7
	bge	loop_1580
loop_1578:
	fornot1s	%f6,	%f17,	%f14
loop_1579:
	bpos,pn	%icc,	loop_1581
	fmovscc	%xcc,	%f1,	%f13
loop_1580:
	brnz,a	%g4,	loop_1582
	brlz	%o3,	loop_1583
loop_1581:
	array32	%i5,	%i0,	%g7
	fones	%f28
loop_1582:
	bleu,pn	%icc,	loop_1584
loop_1583:
	fcmps	%fcc0,	%f13,	%f17
	tvc	%icc,	0x0
	umul	%o0,	%l1,	%i7
loop_1584:
	edge8	%g6,	%l6,	%l4
	movleu	%xcc,	%l3,	%i2
	fmovsvc	%icc,	%f21,	%f26
	addc	%o1,	0x1891,	%g5
	subc	%i1,	0x1D8B,	%l5
	xnor	%g1,	%i6,	%i3
	edge16n	%o2,	%o6,	%g2
	edge32ln	%i4,	%l0,	%o5
	edge32	%o4,	%g3,	%o7
	ble,pn	%xcc,	loop_1585
	addc	%l2,	0x1B03,	%o3
	edge8ln	%i5,	%g4,	%g7
	movge	%icc,	%i0,	%o0
loop_1585:
	movl	%icc,	%l1,	%i7
	orcc	%l6,	%g6,	%l4
	tsubcc	%i2,	%o1,	%g5
	sdivcc	%i1,	0x19F0,	%l3
	alignaddrl	%g1,	%i6,	%l5
	movrgz	%o2,	%o6,	%g2
	fpadd16s	%f12,	%f25,	%f18
	addcc	%i4,	%l0,	%i3
	sdivcc	%o5,	0x1D9A,	%o4
	sub	%o7,	0x0CF3,	%g3
	brz	%o3,	loop_1586
	movvc	%xcc,	%i5,	%l2
	fmovdn	%icc,	%f21,	%f5
	subcc	%g4,	0x1310,	%i0
loop_1586:
	fmovdn	%icc,	%f15,	%f14
	bvc	loop_1587
	tneg	%xcc,	0x7
	fandnot2s	%f3,	%f12,	%f25
	subccc	%g7,	0x0E08,	%l1
loop_1587:
	fbug,a	%fcc0,	loop_1588
	tne	%icc,	0x7
	ble,a,pt	%icc,	loop_1589
	fors	%f19,	%f12,	%f29
loop_1588:
	edge8ln	%o0,	%i7,	%l6
	movcs	%icc,	%l4,	%i2
loop_1589:
	fmul8ulx16	%f14,	%f12,	%f10
	sll	%g6,	0x0E,	%o1
	orcc	%i1,	%l3,	%g5
	fornot1s	%f16,	%f16,	%f18
	membar	0x7A
	udiv	%i6,	0x1E19,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x0c,	%o2
	fbe	%fcc1,	loop_1590
	tneg	%icc,	0x6
	taddcc	%l5,	%g2,	%i4
	movgu	%xcc,	%o6,	%l0
loop_1590:
	fcmpeq16	%f20,	%f10,	%i3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%o4
	brlz,a	%o5,	loop_1591
	edge16ln	%g3,	%o3,	%i5
	srl	%o7,	0x05,	%g4
	set	0x48, %g1
	stwa	%l2,	[%l7 + %g1] 0x0c
loop_1591:
	fmovsleu	%xcc,	%f2,	%f30
	edge16n	%i0,	%l1,	%o0
	udivcc	%g7,	0x1274,	%i7
	addc	%l6,	0x1EDE,	%i2
	ldsw	[%l7 + 0x74],	%l4
	edge16ln	%g6,	%o1,	%i1
	xorcc	%l3,	%i6,	%g1
	fmovrdne	%g5,	%f12,	%f30
	srax	%o2,	0x02,	%l5
	tpos	%icc,	0x4
	fmovdcs	%xcc,	%f2,	%f25
	sir	0x182C
	tneg	%icc,	0x7
	tvs	%icc,	0x3
	edge8l	%g2,	%o6,	%i4
	bneg	loop_1592
	tn	%xcc,	0x3
	fmovda	%xcc,	%f28,	%f4
	fbuge	%fcc1,	loop_1593
loop_1592:
	array8	%l0,	%o4,	%i3
	mulx	%g3,	%o5,	%o3
	bneg	%xcc,	loop_1594
loop_1593:
	fxnor	%f28,	%f28,	%f28
	fpsub32	%f18,	%f6,	%f10
	tvs	%xcc,	0x4
loop_1594:
	sdiv	%o7,	0x1AA9,	%g4
	ble,pt	%xcc,	loop_1595
	udiv	%l2,	0x085B,	%i0
	and	%i5,	0x00AA,	%o0
	edge8ln	%g7,	%l1,	%i7
loop_1595:
	tvs	%xcc,	0x4
	nop
	setx loop_1596, %l0, %l1
	jmpl %l1, %l6
	fnor	%f6,	%f6,	%f4
	membar	0x5E
	ldub	[%l7 + 0x62],	%i2
loop_1596:
	tne	%xcc,	0x1
	sth	%g6,	[%l7 + 0x7C]
	set	0x48, %g3
	swapa	[%l7 + %g3] 0x18,	%l4
	srax	%o1,	%l3,	%i6
	set	0x3C, %o2
	ldsha	[%l7 + %o2] 0x11,	%g1
	faligndata	%f20,	%f12,	%f16
	swap	[%l7 + 0x1C],	%i1
	xnorcc	%o2,	%g5,	%l5
	array32	%o6,	%g2,	%i4
	fbne	%fcc2,	loop_1597
	fpsub32	%f14,	%f4,	%f28
	smul	%l0,	0x1854,	%i3
	fmovsneg	%icc,	%f3,	%f31
loop_1597:
	sdivx	%o4,	0x16E5,	%g3
	move	%xcc,	%o5,	%o7
	udivcc	%o3,	0x1B47,	%g4
	ldd	[%l7 + 0x20],	%l2
	fmovdg	%xcc,	%f20,	%f20
	stb	%i5,	[%l7 + 0x51]
	andcc	%o0,	0x1845,	%i0
	fpsub32	%f10,	%f14,	%f22
	taddcc	%l1,	0x085B,	%g7
	fmovdg	%xcc,	%f31,	%f21
	array32	%l6,	%i7,	%g6
	ldsb	[%l7 + 0x1B],	%l4
	fsrc1	%f16,	%f28
	tg	%xcc,	0x6
	te	%xcc,	0x4
	fmovdleu	%xcc,	%f10,	%f11
	tg	%icc,	0x0
	fmul8sux16	%f22,	%f26,	%f14
	umulcc	%o1,	%i2,	%i6
	move	%icc,	%l3,	%i1
	edge8ln	%g1,	%o2,	%g5
	fpack16	%f10,	%f28
	fmovrdne	%o6,	%f26,	%f26
	xor	%g2,	%l5,	%l0
	udivx	%i3,	0x0FA7,	%i4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%o4
	movrne	%o7,	%o5,	%o3
	fors	%f1,	%f16,	%f0
	tn	%xcc,	0x7
	xor	%g4,	%l2,	%o0
	fmovsleu	%xcc,	%f5,	%f14
	movpos	%xcc,	%i0,	%i5
	fmovsleu	%xcc,	%f8,	%f30
	movvc	%xcc,	%l1,	%g7
	fbl	%fcc1,	loop_1598
	add	%l6,	%g6,	%l4
	xnorcc	%o1,	0x1319,	%i7
	fmovscs	%icc,	%f0,	%f21
loop_1598:
	xorcc	%i2,	%i6,	%i1
	movre	%l3,	0x378,	%g1
	siam	0x3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o2
	std	%f30,	[%l7 + 0x60]
	smul	%o6,	%g2,	%l5
	fmovrsne	%l0,	%f25,	%f3
	te	%xcc,	0x1
	edge16	%g5,	%i3,	%i4
	edge16ln	%o4,	%g3,	%o7
	set	0x7C, %o7
	ldsha	[%l7 + %o7] 0x0c,	%o3
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 0x0
	edge8ln	%g4,	%o5,	%l2
	fcmpes	%fcc0,	%f15,	%f8
	edge32	%o0,	%i0,	%i5
	udiv	%g7,	0x0117,	%l1
	add	%g6,	%l4,	%l6
	fba,a	%fcc2,	loop_1599
	fcmple16	%f28,	%f14,	%o1
	wr	%g0,	0x2f,	%asi
	stda	%i2,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1599:
	movrlez	%i6,	%i1,	%l3
	fmovrdne	%i7,	%f6,	%f0
	movl	%xcc,	%g1,	%o2
	fbue	%fcc1,	loop_1600
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	stha	%o6,	[%l7 + 0x6A] %asi
loop_1600:
	movrgez	%g2,	%l5,	%g5
	movre	%l0,	%i3,	%i4
	orn	%g3,	%o7,	%o3
	sdiv	%g4,	0x008C,	%o5
	sub	%l2,	0x1C8A,	%o4
	fmul8x16au	%f2,	%f5,	%f24
	movn	%icc,	%o0,	%i0
	tge	%xcc,	0x2
	stx	%g7,	[%l7 + 0x68]
	tvs	%xcc,	0x1
	fpadd16s	%f20,	%f1,	%f13
	udivcc	%i5,	0x0A33,	%g6
	fbo,a	%fcc2,	loop_1601
	ldsb	[%l7 + 0x4B],	%l1
	sir	0x119E
	addcc	%l4,	0x19A7,	%l6
loop_1601:
	tpos	%xcc,	0x4
	edge8	%i2,	%o1,	%i6
	orn	%l3,	0x165A,	%i1
	tg	%icc,	0x2
	tpos	%xcc,	0x5
	mulscc	%i7,	0x0ED7,	%g1
	fnot2	%f26,	%f8
	edge8ln	%o2,	%g2,	%l5
	xnorcc	%g5,	%l0,	%o6
	bgu,a	loop_1602
	st	%f12,	[%l7 + 0x34]
	stw	%i4,	[%l7 + 0x58]
	array32	%i3,	%o7,	%o3
loop_1602:
	edge8n	%g4,	%g3,	%o5
	mulscc	%l2,	%o0,	%o4
	fbne,a	%fcc3,	loop_1603
	orn	%g7,	%i5,	%g6
	movvs	%xcc,	%i0,	%l4
	edge16l	%l1,	%l6,	%o1
loop_1603:
	nop
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x2
	fbne,a	%fcc1,	loop_1604
	udivx	%i2,	0x035D,	%l3
	xor	%i7,	0x192D,	%g1
	edge8n	%i1,	%g2,	%o2
loop_1604:
	movrgz	%g5,	0x081,	%l0
	fands	%f1,	%f19,	%f10
	movn	%xcc,	%o6,	%i4
	fpadd16	%f28,	%f8,	%f30
	addccc	%i3,	%o7,	%l5
	srlx	%o3,	0x1C,	%g4
	fmovsl	%icc,	%f8,	%f17
	sub	%o5,	%l2,	%g3
	fcmple32	%f14,	%f14,	%o0
	ldub	[%l7 + 0x1F],	%o4
	udivx	%g7,	0x1299,	%g6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x58] %asi,	%i0
	fmovrdgz	%i5,	%f20,	%f4
	nop
	set	0x60, %i7
	std	%f10,	[%l7 + %i7]
	sdivx	%l1,	0x0D12,	%l6
	nop
	setx loop_1605, %l0, %l1
	jmpl %l1, %l4
	lduw	[%l7 + 0x28],	%o1
	edge32n	%i6,	%i2,	%i7
	movne	%xcc,	%l3,	%i1
loop_1605:
	movcc	%xcc,	%g2,	%o2
	fbne	%fcc2,	loop_1606
	smul	%g5,	0x19A0,	%g1
	stbar
	fble	%fcc0,	loop_1607
loop_1606:
	orcc	%l0,	%i4,	%o6
	fpadd32	%f24,	%f4,	%f18
	bcc,a,pt	%icc,	loop_1608
loop_1607:
	nop
	setx	loop_1609,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulscc	%o7,	0x0B35,	%l5
	bcc,a,pt	%xcc,	loop_1610
loop_1608:
	ldub	[%l7 + 0x5A],	%i3
loop_1609:
	edge8l	%o3,	%g4,	%o5
	tvs	%xcc,	0x0
loop_1610:
	ldsw	[%l7 + 0x24],	%l2
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf8,	%f16
	fmovsne	%xcc,	%f26,	%f3
	fmovrde	%o0,	%f12,	%f0
	umul	%o4,	%g3,	%g7
	sth	%i0,	[%l7 + 0x2A]
	orncc	%g6,	0x1BED,	%i5
	subcc	%l6,	%l4,	%o1
	addc	%l1,	0x0DF3,	%i6
	addc	%i2,	0x02BF,	%l3
	tn	%xcc,	0x4
	stx	%i1,	[%l7 + 0x60]
	sdiv	%i7,	0x1FF0,	%g2
	subcc	%g5,	0x1021,	%o2
	fpsub32	%f14,	%f22,	%f20
	smulcc	%g1,	0x1966,	%i4
	andncc	%l0,	%o7,	%l5
	bcs,a	loop_1611
	fbge,a	%fcc2,	loop_1612
	movn	%xcc,	%o6,	%o3
	edge8l	%i3,	%o5,	%g4
loop_1611:
	tle	%xcc,	0x6
loop_1612:
	movvc	%xcc,	%l2,	%o4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4B] %asi,	%o0
	siam	0x4
	movn	%icc,	%g7,	%i0
	movn	%icc,	%g6,	%g3
	bneg,a,pt	%icc,	loop_1613
	movle	%xcc,	%i5,	%l4
	taddcc	%o1,	%l1,	%l6
	umulcc	%i2,	0x07D1,	%i6
loop_1613:
	fcmps	%fcc1,	%f18,	%f25
	fcmpne32	%f8,	%f22,	%i1
	fmul8x16au	%f9,	%f8,	%f12
	fble	%fcc1,	loop_1614
	membar	0x15
	set	0x6D, %g5
	stba	%i7,	[%l7 + %g5] 0x2f
	membar	#Sync
loop_1614:
	subccc	%g2,	%g5,	%o2
	smulcc	%g1,	%l3,	%l0
	bvc,a,pt	%xcc,	loop_1615
	edge8l	%o7,	%l5,	%o6
	fcmpes	%fcc3,	%f28,	%f1
	set	0x44, %g2
	ldswa	[%l7 + %g2] 0x89,	%i4
loop_1615:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i3
	fbu	%fcc0,	loop_1616
	bvc,a	%xcc,	loop_1617
	fpack16	%f22,	%f8
	taddcctv	%o3,	0x1CA0,	%g4
loop_1616:
	ld	[%l7 + 0x58],	%f30
loop_1617:
	tge	%xcc,	0x3
	movrgez	%o5,	%o4,	%l2
	tpos	%icc,	0x0
	sll	%o0,	0x17,	%i0
	fmovrdlez	%g7,	%f24,	%f0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sllx	%g3,	0x04,	%i5
	tvs	%xcc,	0x3
	fnand	%f2,	%f26,	%f16
	movl	%icc,	%g6,	%o1
	bcs,a,pt	%icc,	loop_1618
	movvs	%xcc,	%l4,	%l1
	be,a	%xcc,	loop_1619
	fands	%f31,	%f24,	%f25
loop_1618:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f7,	[%l7 + 0x18] %asi
loop_1619:
	addc	%l6,	0x1E03,	%i6
	tvs	%icc,	0x3
	fmovdcc	%xcc,	%f2,	%f10
	tcs	%xcc,	0x0
	andn	%i1,	0x1208,	%i2
	tcc	%icc,	0x0
	movgu	%icc,	%i7,	%g2
	array8	%g5,	%g1,	%l3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%o2
	movrgez	%l0,	%l5,	%o7
	fornot2	%f0,	%f28,	%f16
	sra	%o6,	0x12,	%i4
	edge16	%o3,	%i3,	%g4
	srax	%o5,	0x18,	%o4
	bgu	loop_1620
	array32	%o0,	%i0,	%g7
	brlez,a	%g3,	loop_1621
	fnegd	%f10,	%f2
loop_1620:
	sdivcc	%i5,	0x0D11,	%g6
	nop
	setx loop_1622, %l0, %l1
	jmpl %l1, %l2
loop_1621:
	edge8l	%o1,	%l1,	%l6
	addcc	%i6,	%i1,	%i2
	fnot1s	%f29,	%f20
loop_1622:
	te	%icc,	0x0
	membar	0x58
	edge8ln	%l4,	%g2,	%i7
	edge16n	%g5,	%l3,	%g1
	movg	%icc,	%o2,	%l5
	fcmpes	%fcc1,	%f11,	%f22
	fones	%f2
	edge16	%l0,	%o6,	%i4
	srl	%o3,	0x1D,	%o7
	tle	%xcc,	0x7
	fxnors	%f14,	%f6,	%f8
	movpos	%icc,	%g4,	%o5
	bge,pt	%icc,	loop_1623
	tcs	%icc,	0x2
	tneg	%xcc,	0x0
	array32	%i3,	%o4,	%o0
loop_1623:
	smul	%g7,	%g3,	%i0
	xor	%i5,	%g6,	%l2
	sdivcc	%o1,	0x1E7D,	%l6
	tle	%icc,	0x6
	xnorcc	%l1,	%i6,	%i2
	xorcc	%l4,	%g2,	%i1
	movgu	%icc,	%i7,	%l3
	tn	%xcc,	0x7
	call	loop_1624
	fmovsle	%icc,	%f23,	%f17
	array8	%g5,	%o2,	%g1
	fmovrdlz	%l5,	%f30,	%f0
loop_1624:
	siam	0x7
	sllx	%o6,	0x06,	%l0
	ldd	[%l7 + 0x48],	%i4
	movpos	%icc,	%o7,	%g4
	set	0x6C, %i1
	stwa	%o5,	[%l7 + %i1] 0xe3
	membar	#Sync
	xnor	%i3,	0x16C3,	%o3
	nop
	set	0x5A, %i5
	ldsh	[%l7 + %i5],	%o4
	tcs	%icc,	0x5
	fmul8x16al	%f27,	%f5,	%f30
	movle	%icc,	%o0,	%g3
	movvc	%xcc,	%g7,	%i5
	st	%f23,	[%l7 + 0x40]
	fmovse	%xcc,	%f31,	%f30
	tneg	%xcc,	0x3
	bn,pn	%xcc,	loop_1625
	popc	%i0,	%g6
	tvc	%xcc,	0x2
	array16	%o1,	%l2,	%l1
loop_1625:
	subcc	%i6,	0x0038,	%i2
	tne	%icc,	0x6
	fmuld8sux16	%f9,	%f14,	%f22
	andncc	%l4,	%l6,	%g2
	popc	0x000E,	%i7
	bleu,pn	%icc,	loop_1626
	te	%icc,	0x4
	bge,a	%icc,	loop_1627
	swap	[%l7 + 0x74],	%l3
loop_1626:
	smulcc	%i1,	%o2,	%g5
	fblg,a	%fcc0,	loop_1628
loop_1627:
	fand	%f26,	%f12,	%f6
	mulx	%l5,	0x0CE1,	%o6
	alignaddrl	%g1,	%i4,	%o7
loop_1628:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f1,	[%l7 + 0x14] %asi
	fbe	%fcc0,	loop_1629
	sdivx	%g4,	0x001D,	%o5
	edge8n	%i3,	%l0,	%o3
	sdivx	%o0,	0x0BB2,	%g3
loop_1629:
	bpos	loop_1630
	fmovsleu	%xcc,	%f20,	%f6
	udivcc	%o4,	0x0CE5,	%i5
	fmovdne	%xcc,	%f9,	%f6
loop_1630:
	addccc	%i0,	0x0B59,	%g7
	bleu,pt	%icc,	loop_1631
	bne,a,pn	%icc,	loop_1632
	ldsh	[%l7 + 0x42],	%g6
	xnor	%l2,	%l1,	%i6
loop_1631:
	subc	%i2,	%l4,	%l6
loop_1632:
	orncc	%g2,	%i7,	%o1
	tn	%icc,	0x2
	and	%i1,	0x17F4,	%l3
	movg	%xcc,	%g5,	%l5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x12] %asi,	%o6
	popc	0x0B78,	%g1
	orncc	%i4,	0x118A,	%o7
	sth	%o2,	[%l7 + 0x68]
	edge32	%o5,	%i3,	%g4
	subcc	%o3,	0x1CE7,	%l0
	set	0x50, %o4
	lda	[%l7 + %o4] 0x0c,	%f19
	edge16l	%o0,	%o4,	%g3
	smul	%i0,	0x027A,	%g7
	nop
	setx	loop_1633,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array16	%g6,	%i5,	%l1
	sllx	%i6,	0x14,	%l2
	tg	%xcc,	0x5
loop_1633:
	fbe,a	%fcc1,	loop_1634
	call	loop_1635
	bshuffle	%f30,	%f22,	%f8
	bgu,a	loop_1636
loop_1634:
	subc	%i2,	0x0599,	%l4
loop_1635:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l6,	0x1F64,	%g2
loop_1636:
	taddcctv	%i7,	0x1BC8,	%o1
	ldd	[%l7 + 0x48],	%f4
	brgez,a	%i1,	loop_1637
	fmovrslz	%l3,	%f12,	%f31
	edge32ln	%l5,	%o6,	%g5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1637:
	movleu	%xcc,	%g1,	%i4
	prefetch	[%l7 + 0x40],	 0x0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x32] %asi,	%o2
	bn,pn	%xcc,	loop_1638
	fbule	%fcc2,	loop_1639
	sdivcc	%o7,	0x0D40,	%i3
	tne	%xcc,	0x0
loop_1638:
	fsrc2	%f24,	%f30
loop_1639:
	fzero	%f0
	fnand	%f12,	%f30,	%f22
	movge	%xcc,	%o5,	%o3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x34] %asi,	%f6
	or	%g4,	0x0A07,	%o0
	movcs	%xcc,	%o4,	%l0
	edge8n	%g3,	%i0,	%g6
	fmul8x16al	%f3,	%f19,	%f14
	xnor	%g7,	0x0979,	%i5
	tgu	%icc,	0x7
	fpadd16s	%f9,	%f10,	%f5
	addcc	%i6,	%l1,	%i2
	fmovdcs	%icc,	%f19,	%f16
	sdivcc	%l2,	0x1696,	%l4
	stx	%l6,	[%l7 + 0x78]
	fzeros	%f8
	edge8l	%i7,	%o1,	%i1
	subcc	%g2,	%l5,	%o6
	set	0x60, %l1
	ldswa	[%l7 + %l1] 0x11,	%l3
	edge16l	%g5,	%g1,	%i4
	tne	%xcc,	0x1
	set	0x78, %i2
	stxa	%o2,	[%l7 + %i2] 0xea
	membar	#Sync
	udiv	%o7,	0x0FB9,	%o5
	fpackfix	%f22,	%f26
	movrne	%o3,	0x005,	%i3
	wr	%g0,	0x04,	%asi
	sta	%f0,	[%l7 + 0x44] %asi
	mulx	%g4,	%o4,	%o0
	subcc	%g3,	%i0,	%l0
	and	%g6,	0x0893,	%i5
	tneg	%xcc,	0x2
	addcc	%i6,	0x0C61,	%l1
	udivx	%i2,	0x0CF7,	%l2
	movvs	%icc,	%l4,	%g7
	edge16ln	%l6,	%i7,	%i1
	tle	%icc,	0x6
	add	%g2,	%l5,	%o1
	sra	%l3,	0x13,	%g5
	tsubcctv	%g1,	%i4,	%o6
	movrgz	%o2,	0x29B,	%o5
	subcc	%o7,	0x0E0F,	%o3
	edge16n	%g4,	%i3,	%o0
	edge32n	%o4,	%g3,	%i0
	fble,a	%fcc0,	loop_1640
	movge	%xcc,	%g6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x5C],	%f23
loop_1640:
	movrne	%l0,	%i6,	%l1
	edge8	%i2,	%l2,	%l4
	bneg,pt	%xcc,	loop_1641
	ldsw	[%l7 + 0x40],	%g7
	tvc	%icc,	0x1
	sir	0x199B
loop_1641:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i7
	and	%i1,	0x1625,	%g2
	srlx	%l6,	%l5,	%l3
	fone	%f4
	movrgz	%g5,	0x055,	%g1
	fnot2s	%f29,	%f12
	edge16ln	%o1,	%i4,	%o2
	sdivx	%o5,	0x02FD,	%o6
	fpsub16s	%f27,	%f21,	%f19
	tl	%icc,	0x4
	fmovdneg	%xcc,	%f30,	%f27
	fmovdcc	%xcc,	%f2,	%f17
	ldsh	[%l7 + 0x08],	%o7
	bne,a	loop_1642
	flush	%l7 + 0x68
	fbo	%fcc1,	loop_1643
	movpos	%icc,	%g4,	%o3
loop_1642:
	array8	%o0,	%o4,	%g3
	ble	%xcc,	loop_1644
loop_1643:
	udivx	%i0,	0x1AFF,	%i3
	fmovrdgez	%i5,	%f28,	%f12
	alignaddr	%g6,	%i6,	%l0
loop_1644:
	tg	%icc,	0x6
	fbn	%fcc0,	loop_1645
	tg	%xcc,	0x4
	fcmple32	%f28,	%f8,	%i2
	wr	%g0,	0xe2,	%asi
	stda	%l0,	[%l7 + 0x50] %asi
	membar	#Sync
loop_1645:
	array8	%l2,	%l4,	%g7
	ldub	[%l7 + 0x69],	%i1
	edge16	%g2,	%i7,	%l5
	ldd	[%l7 + 0x60],	%i6
	sdiv	%g5,	0x07C1,	%l3
	fabss	%f2,	%f6
	tl	%icc,	0x6
	tneg	%icc,	0x7
	alignaddrl	%g1,	%i4,	%o2
	fxors	%f4,	%f11,	%f10
	tl	%xcc,	0x5
	te	%icc,	0x2
	addc	%o1,	0x1C5B,	%o5
	mova	%icc,	%o7,	%g4
	move	%icc,	%o3,	%o0
	ldd	[%l7 + 0x78],	%o4
	sdivcc	%g3,	0x1D9D,	%o6
	set	0x0A, %i0
	ldsba	[%l7 + %i0] 0x10,	%i0
	ldub	[%l7 + 0x0A],	%i5
	stx	%i3,	[%l7 + 0x68]
	fbg,a	%fcc3,	loop_1646
	tneg	%xcc,	0x4
	fmovscs	%icc,	%f20,	%f3
	bg,pn	%xcc,	loop_1647
loop_1646:
	fmovspos	%xcc,	%f13,	%f20
	bn,a,pn	%icc,	loop_1648
	swap	[%l7 + 0x5C],	%g6
loop_1647:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i6
loop_1648:
	fmovdn	%xcc,	%f24,	%f14
	tn	%xcc,	0x0
	edge32l	%i2,	%l1,	%l2
	movrne	%l0,	0x262,	%l4
	orcc	%g7,	0x12E1,	%i1
	movle	%xcc,	%i7,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g2,	[%l7 + 0x65]
	srax	%l6,	0x05,	%g5
	set	0x30, %i3
	lduwa	[%l7 + %i3] 0x14,	%l3
	brlz	%i4,	loop_1649
	fbue,a	%fcc0,	loop_1650
	movvs	%icc,	%g1,	%o2
	edge16n	%o1,	%o7,	%g4
loop_1649:
	tvc	%xcc,	0x3
loop_1650:
	ta	%xcc,	0x0
	bgu,a,pt	%icc,	loop_1651
	sub	%o3,	0x094B,	%o5
	ba,a,pn	%xcc,	loop_1652
	alignaddr	%o4,	%o0,	%g3
loop_1651:
	nop
	set	0x60, %o3
	lduwa	[%l7 + %o3] 0x10,	%o6
loop_1652:
	pdist	%f14,	%f12,	%f22
	popc	0x0DC5,	%i5
	edge8n	%i0,	%g6,	%i3
	ld	[%l7 + 0x60],	%f12
	edge32ln	%i2,	%i6,	%l2
	subccc	%l0,	%l1,	%l4
	fmovrdlz	%i1,	%f12,	%f30
	bge,a	loop_1653
	movne	%icc,	%g7,	%i7
	fbule	%fcc0,	loop_1654
	edge8ln	%l5,	%g2,	%g5
loop_1653:
	fornot2s	%f2,	%f0,	%f31
	fmovdvs	%icc,	%f12,	%f9
loop_1654:
	sllx	%l3,	%i4,	%l6
	fmovda	%icc,	%f19,	%f0
	nop
	setx	loop_1655,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%g1,	%o1,	%o2
	fcmped	%fcc0,	%f22,	%f16
	ldx	[%l7 + 0x58],	%g4
loop_1655:
	fbge	%fcc1,	loop_1656
	fcmpgt16	%f4,	%f2,	%o3
	ldsw	[%l7 + 0x6C],	%o5
	udivcc	%o7,	0x0289,	%o4
loop_1656:
	bleu,a	%xcc,	loop_1657
	fbue,a	%fcc1,	loop_1658
	fmovda	%xcc,	%f20,	%f19
	nop
	setx	loop_1659,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1657:
	fone	%f12
loop_1658:
	nop
	set	0x71, %i4
	stba	%o0,	[%l7 + %i4] 0x10
loop_1659:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%i5
	fpsub16s	%f1,	%f24,	%f26
	tg	%xcc,	0x4
	tpos	%icc,	0x1
	fbge,a	%fcc2,	loop_1660
	sra	%o6,	%g6,	%i0
	taddcc	%i2,	0x151B,	%i6
	fmovsle	%icc,	%f29,	%f23
loop_1660:
	brgez	%l2,	loop_1661
	andn	%i3,	%l1,	%l0
	fbl,a	%fcc1,	loop_1662
	movvs	%xcc,	%l4,	%g7
loop_1661:
	mulscc	%i7,	%i1,	%l5
	xnorcc	%g2,	%g5,	%i4
loop_1662:
	movl	%xcc,	%l3,	%l6
	fmovsge	%icc,	%f7,	%f20
	xorcc	%g1,	0x0E2F,	%o1
	fpadd16s	%f12,	%f28,	%f17
	fmovdgu	%icc,	%f1,	%f16
	tne	%xcc,	0x1
	sir	0x1C83
	fbule,a	%fcc3,	loop_1663
	udivcc	%g4,	0x17DE,	%o3
	movneg	%xcc,	%o2,	%o5
	te	%icc,	0x2
loop_1663:
	tgu	%icc,	0x3
	srl	%o7,	0x0A,	%o4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o0
	fpsub32	%f22,	%f26,	%f30
	fand	%f6,	%f12,	%f24
	fsrc1	%f6,	%f20
	udivcc	%g3,	0x1225,	%o6
	movrgez	%g6,	0x1EA,	%i0
	addccc	%i5,	%i2,	%i6
	tvc	%xcc,	0x0
	tgu	%icc,	0x0
	xor	%i3,	%l2,	%l0
	fnot2	%f2,	%f0
	mova	%icc,	%l4,	%g7
	fbn,a	%fcc0,	loop_1664
	smulcc	%l1,	%i1,	%l5
	nop
	setx loop_1665, %l0, %l1
	jmpl %l1, %g2
	sllx	%g5,	0x1D,	%i7
loop_1664:
	bleu,a,pt	%icc,	loop_1666
	tvs	%xcc,	0x2
loop_1665:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x6
loop_1666:
	fandnot2s	%f19,	%f7,	%f12
	addc	%i4,	%l3,	%g1
	edge8l	%l6,	%o1,	%g4
	fmovda	%icc,	%f8,	%f9
	movleu	%xcc,	%o2,	%o3
	fmovdle	%xcc,	%f16,	%f2
	tle	%xcc,	0x0
	tl	%icc,	0x6
	srlx	%o5,	0x0F,	%o7
	tgu	%icc,	0x2
	mulscc	%o0,	%o4,	%o6
	taddcctv	%g3,	%i0,	%i5
	umul	%g6,	0x18A3,	%i2
	edge8n	%i6,	%i3,	%l0
	movvs	%icc,	%l4,	%l2
	call	loop_1667
	umul	%l1,	0x03FF,	%g7
	orn	%l5,	0x1978,	%i1
	fsrc2s	%f12,	%f15
loop_1667:
	bvs,a,pt	%icc,	loop_1668
	fcmpeq32	%f12,	%f4,	%g5
	fcmpd	%fcc0,	%f30,	%f28
	ldub	[%l7 + 0x1C],	%g2
loop_1668:
	add	%i7,	0x1ED6,	%l3
	srl	%i4,	0x1C,	%l6
	bneg,a	loop_1669
	movrlz	%o1,	%g4,	%o2
	fmovs	%f2,	%f17
	movpos	%xcc,	%o3,	%o5
loop_1669:
	fpadd32	%f6,	%f0,	%f0
	addc	%o7,	%o0,	%o4
	movle	%icc,	%g1,	%g3
	fmovsne	%xcc,	%f18,	%f1
	nop
	setx loop_1670, %l0, %l1
	jmpl %l1, %o6
	fmovsgu	%xcc,	%f0,	%f27
	fpadd32	%f4,	%f14,	%f28
	umul	%i0,	%g6,	%i5
loop_1670:
	tsubcctv	%i6,	%i3,	%l0
	edge16l	%i2,	%l4,	%l1
	ld	[%l7 + 0x24],	%f1
	or	%g7,	%l2,	%i1
	fone	%f22
	movneg	%icc,	%g5,	%g2
	movpos	%icc,	%l5,	%l3
	fcmpne16	%f20,	%f12,	%i4
	movgu	%xcc,	%i7,	%o1
	tle	%icc,	0x5
	fbo	%fcc1,	loop_1671
	alignaddrl	%g4,	%o2,	%o3
	mulx	%o5,	%o7,	%o0
	alignaddrl	%l6,	%o4,	%g1
loop_1671:
	fsrc2	%f26,	%f28
	fmovrslz	%g3,	%f23,	%f13
	edge16	%i0,	%o6,	%i5
	udiv	%i6,	0x0528,	%i3
	movre	%l0,	0x1CF,	%g6
	xnorcc	%i2,	%l1,	%g7
	movrne	%l4,	0x0C9,	%l2
	movcc	%icc,	%i1,	%g2
	bl,a	loop_1672
	fnot1s	%f25,	%f28
	sub	%g5,	0x1ECF,	%l3
	edge32n	%l5,	%i7,	%i4
loop_1672:
	bpos	%xcc,	loop_1673
	bl,pn	%xcc,	loop_1674
	udiv	%g4,	0x03E5,	%o1
	smulcc	%o2,	0x00F6,	%o3
loop_1673:
	andncc	%o5,	%o7,	%o0
loop_1674:
	fmovrslz	%l6,	%f23,	%f6
	set	0x50, %g7
	stda	%o4,	[%l7 + %g7] 0x18
	fmovsle	%xcc,	%f12,	%f3
	movre	%g3,	%i0,	%g1
	tpos	%xcc,	0x7
	addc	%o6,	%i6,	%i3
	fnand	%f14,	%f10,	%f10
	edge32n	%i5,	%l0,	%i2
	movneg	%icc,	%l1,	%g7
	tne	%icc,	0x4
	movleu	%icc,	%l4,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %o5
	sta	%f4,	[%l7 + %o5] 0x81
	fpsub16	%f26,	%f20,	%f6
	edge16	%i1,	%g2,	%g5
	brz,a	%l3,	loop_1675
	fands	%f10,	%f6,	%f3
	movpos	%xcc,	%l5,	%i7
	fsrc1s	%f14,	%f4
loop_1675:
	edge32	%i4,	%l2,	%o1
	xor	%g4,	%o3,	%o5
	udivcc	%o7,	0x1BF6,	%o2
	fcmpd	%fcc2,	%f14,	%f10
	sllx	%l6,	%o0,	%o4
	fsrc2s	%f25,	%f8
	or	%g3,	%i0,	%g1
	ldx	[%l7 + 0x30],	%i6
	ba,a	%icc,	loop_1676
	bpos,a	loop_1677
	fbge	%fcc1,	loop_1678
	edge16n	%o6,	%i3,	%l0
loop_1676:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x34] %asi,	%f7
loop_1677:
	srl	%i5,	%i2,	%l1
loop_1678:
	prefetch	[%l7 + 0x2C],	 0x2
	taddcc	%l4,	0x1C4D,	%g7
	ld	[%l7 + 0x18],	%f28
	fmovdcc	%xcc,	%f29,	%f4
	xnorcc	%g6,	0x1C39,	%i1
	edge8l	%g5,	%l3,	%g2
	movge	%xcc,	%i7,	%i4
	bshuffle	%f26,	%f4,	%f8
	bvc,a	%xcc,	loop_1679
	movrgz	%l5,	0x27C,	%l2
	edge8ln	%o1,	%g4,	%o5
	ldx	[%l7 + 0x38],	%o3
loop_1679:
	tgu	%icc,	0x5
	fmul8x16	%f11,	%f14,	%f22
	bl,a,pt	%xcc,	loop_1680
	srl	%o2,	%l6,	%o0
	addccc	%o4,	0x1987,	%o7
	fcmpeq32	%f12,	%f6,	%i0
loop_1680:
	xorcc	%g3,	%i6,	%g1
	bneg,pt	%xcc,	loop_1681
	fpackfix	%f24,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o6,	%i3,	%i5
loop_1681:
	nop
	set	0x40, %o6
	ldsh	[%l7 + %o6],	%l0
	subcc	%i2,	0x0CB2,	%l1
	edge32	%g7,	%l4,	%g6
	movne	%icc,	%i1,	%l3
	bneg,pt	%icc,	loop_1682
	movpos	%xcc,	%g2,	%i7
	set	0x2C, %l2
	lda	[%l7 + %l2] 0x15,	%f13
loop_1682:
	movrlez	%i4,	%l5,	%g5
	mova	%xcc,	%o1,	%l2
	bpos,a,pn	%xcc,	loop_1683
	edge16ln	%o5,	%o3,	%o2
	ldd	[%l7 + 0x30],	%g4
	set	0x6C, %o1
	lda	[%l7 + %o1] 0x81,	%f21
loop_1683:
	movleu	%xcc,	%l6,	%o0
	ldx	[%l7 + 0x28],	%o4
	alignaddrl	%i0,	%o7,	%g3
	subccc	%g1,	%o6,	%i6
	wr	%g0,	0x81,	%asi
	sta	%f12,	[%l7 + 0x74] %asi
	sdiv	%i5,	0x1B56,	%l0
	fbuge,a	%fcc1,	loop_1684
	fmovsa	%icc,	%f11,	%f7
	movrgez	%i3,	%l1,	%i2
	orcc	%g7,	0x1A90,	%l4
loop_1684:
	nop
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x15
	tvs	%xcc,	0x7
	movne	%icc,	%i1,	%l3
	tcc	%icc,	0x0
	fcmpgt32	%f2,	%f10,	%g6
	wr	%g0,	0x5f,	%asi
	stxa	%g2,	[%g0 + 0x0] %asi
	orn	%i7,	%l5,	%i4
	nop
	set	0x24, %l0
	lduw	[%l7 + %l0],	%g5
	prefetch	[%l7 + 0x64],	 0x2
	fmovdl	%xcc,	%f10,	%f22
	orn	%o1,	0x1582,	%o5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x74] %asi,	%f13
	fba	%fcc3,	loop_1685
	and	%o3,	%l2,	%o2
	fmovdvc	%icc,	%f9,	%f17
	sdivx	%g4,	0x0643,	%l6
loop_1685:
	add	%o0,	%o4,	%i0
	orn	%g3,	%o7,	%g1
	fmovrdgz	%o6,	%f8,	%f24
	bl,a,pn	%xcc,	loop_1686
	sub	%i6,	%l0,	%i3
	edge16l	%l1,	%i5,	%g7
	fmovrsgez	%l4,	%f5,	%f29
loop_1686:
	edge32	%i2,	%i1,	%l3
	tsubcctv	%g2,	0x16E0,	%g6
	tl	%xcc,	0x5
	sdivcc	%l5,	0x1837,	%i4
	movge	%xcc,	%i7,	%o1
	tpos	%xcc,	0x0
	fbule,a	%fcc0,	loop_1687
	umulcc	%o5,	%o3,	%g5
	taddcc	%l2,	0x0B05,	%g4
	sdiv	%l6,	0x1818,	%o0
loop_1687:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x38] %asi
	subcc	%o4,	0x188F,	%o2
	bgu,pt	%icc,	loop_1688
	movcs	%xcc,	%i0,	%g3
	movrgez	%o7,	%g1,	%o6
	movgu	%xcc,	%l0,	%i3
loop_1688:
	fcmps	%fcc3,	%f19,	%f4
	fcmpne32	%f16,	%f0,	%l1
	nop
	set	0x0C, %l3
	stw	%i6,	[%l7 + %l3]
	srl	%i5,	%g7,	%l4
	brgez	%i1,	loop_1689
	movre	%i2,	%l3,	%g2
	addc	%l5,	%g6,	%i7
	tge	%icc,	0x0
loop_1689:
	sdivcc	%i4,	0x140D,	%o1
	bneg,a,pt	%xcc,	loop_1690
	sub	%o3,	0x1B7D,	%o5
	andncc	%g5,	%g4,	%l6
	fzeros	%f5
loop_1690:
	ldd	[%l7 + 0x38],	%f24
	fba	%fcc1,	loop_1691
	subcc	%l2,	0x16C7,	%o0
	sra	%o4,	%i0,	%g3
	bshuffle	%f2,	%f28,	%f22
loop_1691:
	mova	%xcc,	%o2,	%o7
	bleu,pt	%icc,	loop_1692
	fmovsneg	%xcc,	%f7,	%f22
	edge32	%g1,	%o6,	%i3
	tsubcctv	%l1,	0x16F7,	%i6
loop_1692:
	fxnor	%f10,	%f22,	%f24
	subc	%l0,	%g7,	%i5
	andn	%i1,	0x1CF1,	%l4
	tsubcc	%l3,	%i2,	%g2
	edge16n	%g6,	%l5,	%i4
	te	%xcc,	0x2
	srl	%i7,	0x10,	%o1
	fmovd	%f26,	%f30
	movn	%xcc,	%o5,	%g5
	fabss	%f17,	%f31
	orn	%o3,	%g4,	%l6
	prefetch	[%l7 + 0x4C],	 0x1
	alignaddr	%l2,	%o4,	%i0
	array8	%g3,	%o2,	%o0
	sethi	0x1E6D,	%g1
	fcmpd	%fcc3,	%f14,	%f18
	udivx	%o7,	0x01E2,	%o6
	xorcc	%l1,	0x0200,	%i6
	taddcc	%l0,	%i3,	%g7
	fnot2s	%f8,	%f6
	movn	%xcc,	%i5,	%l4
	umul	%i1,	0x0E96,	%i2
	srlx	%g2,	0x06,	%l3
	edge16l	%g6,	%l5,	%i4
	movpos	%xcc,	%i7,	%o5
	addc	%g5,	%o1,	%g4
	std	%f18,	[%l7 + 0x58]
	udivcc	%l6,	0x1261,	%o3
	tsubcctv	%o4,	%l2,	%i0
	fbul,a	%fcc1,	loop_1693
	movre	%g3,	0x29E,	%o2
	swap	[%l7 + 0x48],	%o0
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x48] %asi
loop_1693:
	fbge,a	%fcc1,	loop_1694
	udivcc	%g1,	0x0E11,	%o7
	fmovsleu	%xcc,	%f14,	%f2
	ldd	[%l7 + 0x40],	%f12
loop_1694:
	fbue	%fcc1,	loop_1695
	fmovdle	%xcc,	%f7,	%f25
	alignaddr	%o6,	%i6,	%l0
	bneg	%xcc,	loop_1696
loop_1695:
	smulcc	%l1,	0x00DB,	%g7
	andn	%i3,	%l4,	%i1
	movre	%i5,	0x297,	%i2
loop_1696:
	bvs,pn	%icc,	loop_1697
	movrlz	%g2,	0x2FA,	%g6
	movvs	%icc,	%l3,	%i4
	tleu	%icc,	0x1
loop_1697:
	sdivx	%l5,	0x0359,	%i7
	udivx	%g5,	0x0FA9,	%o5
	orn	%o1,	0x09AE,	%l6
	sub	%o3,	0x0E37,	%g4
	swap	[%l7 + 0x54],	%o4
	ldub	[%l7 + 0x60],	%i0
	fbug,a	%fcc0,	loop_1698
	ldstub	[%l7 + 0x31],	%g3
	prefetch	[%l7 + 0x30],	 0x3
	edge8n	%l2,	%o2,	%o0
loop_1698:
	brnz,a	%g1,	loop_1699
	taddcctv	%o6,	0x0547,	%o7
	fcmpeq32	%f18,	%f16,	%l0
	sdiv	%l1,	0x1331,	%g7
loop_1699:
	sra	%i3,	%l4,	%i6
	fbue,a	%fcc0,	loop_1700
	mulx	%i1,	0x18F9,	%i5
	tcs	%icc,	0x2
	pdist	%f12,	%f4,	%f0
loop_1700:
	fmovdge	%icc,	%f22,	%f10
	fbu	%fcc2,	loop_1701
	fbe	%fcc3,	loop_1702
	fbuge	%fcc1,	loop_1703
	tle	%icc,	0x0
loop_1701:
	edge32l	%i2,	%g2,	%l3
loop_1702:
	xorcc	%i4,	%l5,	%i7
loop_1703:
	srl	%g5,	0x1D,	%g6
	set	0x4C, %g6
	lduwa	[%l7 + %g6] 0x88,	%o5
	movn	%xcc,	%o1,	%l6
	fbe	%fcc1,	loop_1704
	fmuld8sux16	%f25,	%f15,	%f6
	tcc	%icc,	0x2
	movneg	%icc,	%g4,	%o3
loop_1704:
	mova	%xcc,	%i0,	%g3
	sir	0x0F16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x2
	movre	%l2,	0x3C4,	%o2
	membar	0x52
	ldd	[%l7 + 0x18],	%f0
	std	%f18,	[%l7 + 0x28]
	ldd	[%l7 + 0x30],	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o0,	0x20D,	%g1
	fpadd32	%f22,	%f6,	%f2
	set	0x1F, %g4
	lduba	[%l7 + %g4] 0x0c,	%o6
	udiv	%o7,	0x115F,	%o4
	array32	%l0,	%g7,	%i3
	movre	%l4,	0x2FD,	%i6
	fpack32	%f12,	%f18,	%f12
	fbue,a	%fcc2,	loop_1705
	add	%l1,	%i5,	%i2
	taddcctv	%g2,	0x19C9,	%i1
	fnegs	%f2,	%f8
loop_1705:
	fpadd32	%f16,	%f0,	%f22
	or	%l3,	0x1417,	%l5
	tvs	%icc,	0x2
	fbue,a	%fcc1,	loop_1706
	tsubcctv	%i7,	0x18B8,	%i4
	tgu	%icc,	0x7
	alignaddrl	%g5,	%o5,	%o1
loop_1706:
	fpadd16	%f30,	%f30,	%f24
	ld	[%l7 + 0x1C],	%f15
	edge8n	%g6,	%g4,	%l6
	tl	%xcc,	0x5
	array16	%i0,	%g3,	%l2
	fornot1	%f16,	%f4,	%f12
	brlz,a	%o3,	loop_1707
	tl	%xcc,	0x1
	edge16	%o0,	%g1,	%o2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x46] %asi,	%o6
loop_1707:
	fnor	%f16,	%f26,	%f22
	movrgez	%o4,	%o7,	%g7
	tge	%icc,	0x5
	be	%xcc,	loop_1708
	edge32l	%i3,	%l4,	%i6
	move	%icc,	%l1,	%l0
	sdivx	%i2,	0x1F92,	%i5
loop_1708:
	tn	%icc,	0x1
	sethi	0x0CF8,	%g2
	movvc	%xcc,	%i1,	%l3
	fcmple32	%f14,	%f0,	%i7
	fbne	%fcc3,	loop_1709
	pdist	%f10,	%f20,	%f10
	tneg	%icc,	0x1
	tcc	%xcc,	0x2
loop_1709:
	array8	%l5,	%g5,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x4
	movvs	%xcc,	%o5,	%o1
	sllx	%g4,	0x16,	%g6
	brlz,a	%l6,	loop_1710
	fnot2s	%f6,	%f9
	sllx	%i0,	0x0E,	%l2
	fbug,a	%fcc0,	loop_1711
loop_1710:
	nop
	setx loop_1712, %l0, %l1
	jmpl %l1, %g3
	fmovd	%f24,	%f26
	udivx	%o0,	0x1D17,	%o3
loop_1711:
	tpos	%icc,	0x5
loop_1712:
	bne,pn	%icc,	loop_1713
	nop
	setx loop_1714, %l0, %l1
	jmpl %l1, %o2
	orcc	%g1,	0x10DD,	%o4
	fba	%fcc2,	loop_1715
loop_1713:
	mulx	%o6,	%o7,	%g7
loop_1714:
	smul	%i3,	%l4,	%i6
	tcc	%xcc,	0x7
loop_1715:
	or	%l1,	%i2,	%l0
	array16	%i5,	%g2,	%i1
	te	%xcc,	0x0
	tsubcc	%l3,	0x168C,	%i7
	fbne,a	%fcc0,	loop_1716
	fmovspos	%xcc,	%f16,	%f22
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x65] %asi,	%g5
loop_1716:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%xcc,	%f9,	%f27
	subcc	%i4,	0x1DFF,	%l5
	movrgz	%o1,	0x15C,	%g4
	umulcc	%g6,	%l6,	%i0
	fmovscs	%icc,	%f26,	%f8
	edge8ln	%o5,	%l2,	%o0
	srlx	%g3,	0x05,	%o2
	bneg	%icc,	loop_1717
	edge8l	%g1,	%o3,	%o4
	fmovrslz	%o7,	%f21,	%f25
	fpsub16s	%f0,	%f18,	%f5
loop_1717:
	fcmpgt16	%f22,	%f0,	%g7
	tvc	%xcc,	0x1
	brlez,a	%o6,	loop_1718
	brgez	%i3,	loop_1719
	edge32ln	%l4,	%i6,	%i2
	fpsub32	%f26,	%f28,	%f2
loop_1718:
	xor	%l0,	%i5,	%g2
loop_1719:
	udiv	%i1,	0x0F3A,	%l1
	edge16n	%l3,	%i7,	%i4
	movpos	%icc,	%l5,	%o1
	tcs	%icc,	0x0
	siam	0x7
	fmovdvs	%icc,	%f13,	%f25
	set	0x14, %l4
	lda	[%l7 + %l4] 0x89,	%f25
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x11
	tsubcctv	%g4,	%g6,	%g5
	array8	%i0,	%o5,	%l2
	bgu,a	loop_1720
	umul	%l6,	%o0,	%o2
	movvc	%icc,	%g3,	%o3
	fmul8ulx16	%f14,	%f4,	%f20
loop_1720:
	movg	%icc,	%g1,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x10,	%g7,	%o6
	fmovda	%xcc,	%f25,	%f18
	set	0x0, %g3
	stxa	%o4,	[%g0 + %g3] 0x5f
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x32] %asi,	%i3
	sethi	0x0FD6,	%i6
	fmovdn	%icc,	%f29,	%f18
	tsubcctv	%i2,	%l4,	%l0
	smulcc	%g2,	0x03DC,	%i1
	sdivcc	%i5,	0x1A77,	%l1
	edge32l	%l3,	%i4,	%i7
	fbuge,a	%fcc2,	loop_1721
	orcc	%l5,	0x15BD,	%o1
	ta	%icc,	0x7
	edge16	%g4,	%g5,	%i0
loop_1721:
	nop
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x17
	membar	#Sync
	bcs	loop_1722
	alignaddrl	%g6,	%l2,	%o5
	flush	%l7 + 0x20
	set	0x0E, %o2
	ldsba	[%l7 + %o2] 0x18,	%l6
loop_1722:
	and	%o2,	0x16BE,	%g3
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%o0
	udiv	%g1,	0x0980,	%o3
	fmovd	%f22,	%f2
	andn	%o7,	0x143E,	%o6
	movle	%icc,	%o4,	%i3
	andcc	%i6,	%g7,	%i2
	movrlez	%l0,	0x03A,	%l4
	tge	%xcc,	0x0
	tg	%icc,	0x0
	xorcc	%i1,	%g2,	%i5
	sllx	%l1,	%l3,	%i4
	ldub	[%l7 + 0x16],	%i7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%o1
	andncc	%l5,	%g5,	%g4
	taddcc	%i0,	0x15BD,	%g6
	fmovsneg	%xcc,	%f1,	%f29
	sra	%l2,	%o5,	%l6
	tsubcc	%g3,	%o0,	%g1
	tge	%xcc,	0x4
	addc	%o2,	%o3,	%o6
	array8	%o7,	%o4,	%i3
	fpack32	%f24,	%f22,	%f14
	fbl,a	%fcc2,	loop_1723
	fmovdle	%icc,	%f7,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f2,	%f2
loop_1723:
	fbn	%fcc1,	loop_1724
	bl,a,pn	%icc,	loop_1725
	umul	%i6,	%i2,	%l0
	edge8l	%g7,	%i1,	%g2
loop_1724:
	movcs	%icc,	%i5,	%l1
loop_1725:
	edge8l	%l3,	%l4,	%i7
	edge32	%o1,	%i4,	%g5
	fpadd32	%f10,	%f12,	%f4
	stb	%g4,	[%l7 + 0x75]
	fblg,a	%fcc2,	loop_1726
	fpsub32s	%f7,	%f7,	%f3
	fornot2s	%f18,	%f29,	%f31
	andcc	%i0,	0x14FB,	%l5
loop_1726:
	fxors	%f23,	%f15,	%f20
	fmovsa	%xcc,	%f24,	%f18
	orncc	%g6,	0x0B10,	%o5
	fmovrsgez	%l6,	%f13,	%f23
	for	%f8,	%f20,	%f14
	sethi	0x0961,	%g3
	fpadd16	%f26,	%f22,	%f20
	tleu	%xcc,	0x5
	lduh	[%l7 + 0x6E],	%l2
	tl	%icc,	0x6
	lduw	[%l7 + 0x40],	%g1
	movrgez	%o0,	0x377,	%o3
	fornot1s	%f14,	%f20,	%f23
	bvc,a	%icc,	loop_1727
	sdivcc	%o2,	0x0C75,	%o7
	ldd	[%l7 + 0x60],	%f30
	movl	%icc,	%o6,	%i3
loop_1727:
	srl	%o4,	0x05,	%i2
	ldstub	[%l7 + 0x79],	%l0
	sub	%g7,	0x0847,	%i1
	smulcc	%g2,	0x188A,	%i6
	movge	%icc,	%l1,	%l3
	bcc,pn	%xcc,	loop_1728
	tcc	%xcc,	0x5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%i7
loop_1728:
	umul	%o1,	0x1C05,	%l4
	fcmps	%fcc3,	%f22,	%f1
	ldstub	[%l7 + 0x41],	%i4
	movre	%g4,	%g5,	%l5
	be	loop_1729
	fmovrsne	%i0,	%f2,	%f3
	subcc	%o5,	0x17F3,	%l6
	bleu,pt	%icc,	loop_1730
loop_1729:
	membar	0x6D
	fmovscs	%xcc,	%f26,	%f29
	movvs	%icc,	%g3,	%g6
loop_1730:
	tcs	%icc,	0x4
	udivcc	%l2,	0x1CFB,	%g1
	fornot2s	%f8,	%f24,	%f17
	fxnor	%f20,	%f30,	%f2
	fxnors	%f9,	%f24,	%f24
	wr	%g0,	0x27,	%asi
	stha	%o3,	[%l7 + 0x14] %asi
	membar	#Sync
	nop
	set	0x40, %i7
	stx	%o0,	[%l7 + %i7]
	movneg	%icc,	%o7,	%o2
	fmovsvs	%xcc,	%f10,	%f27
	fnands	%f8,	%f13,	%f1
	tleu	%xcc,	0x6
	fbug	%fcc3,	loop_1731
	udivx	%o6,	0x03B4,	%i3
	fpadd16s	%f15,	%f21,	%f6
	alignaddr	%i2,	%l0,	%g7
loop_1731:
	fbe	%fcc1,	loop_1732
	fmovdle	%xcc,	%f10,	%f3
	edge8n	%i1,	%o4,	%i6
	edge8n	%g2,	%l3,	%i5
loop_1732:
	flush	%l7 + 0x70
	movrlz	%i7,	%o1,	%l4
	fmovrslez	%l1,	%f19,	%f8
	tg	%icc,	0x4
	flush	%l7 + 0x20
	movvc	%xcc,	%g4,	%i4
	srlx	%g5,	0x16,	%i0
	movgu	%icc,	%l5,	%l6
	andcc	%o5,	0x110F,	%g6
	bg,pt	%icc,	loop_1733
	tcs	%xcc,	0x6
	addc	%g3,	0x02FF,	%l2
	movvc	%xcc,	%g1,	%o0
loop_1733:
	movrlz	%o7,	0x32C,	%o3
	sra	%o2,	0x05,	%o6
	movge	%icc,	%i2,	%l0
	umulcc	%g7,	0x01A7,	%i1
	edge32ln	%o4,	%i6,	%g2
	xorcc	%i3,	%i5,	%i7
	stbar
	fcmpgt32	%f22,	%f8,	%l3
	nop
	set	0x60, %l5
	stx	%o1,	[%l7 + %l5]
	st	%f31,	[%l7 + 0x7C]
	movrgz	%l1,	%g4,	%l4
	fbul	%fcc3,	loop_1734
	tvc	%xcc,	0x5
	movne	%xcc,	%i4,	%g5
	te	%icc,	0x1
loop_1734:
	move	%xcc,	%l5,	%i0
	orncc	%o5,	%l6,	%g6
	ldsw	[%l7 + 0x50],	%l2
	orncc	%g1,	0x1C5B,	%g3
	edge32n	%o0,	%o7,	%o3
	movrgz	%o6,	0x097,	%i2
	fblg,a	%fcc1,	loop_1735
	fmovdneg	%icc,	%f8,	%f2
	array32	%o2,	%l0,	%i1
	fcmped	%fcc3,	%f4,	%f20
loop_1735:
	sra	%g7,	0x15,	%i6
	orncc	%g2,	0x057D,	%i3
	nop
	setx	loop_1736,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%o4,	%i7,	%i5
	addcc	%l3,	0x0CBE,	%o1
	set	0x70, %g5
	stda	%l0,	[%l7 + %g5] 0xea
	membar	#Sync
loop_1736:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%g4
	add	%l4,	%g5,	%l5
	movge	%xcc,	%i4,	%o5
	addcc	%i0,	%g6,	%l2
	sir	0x1D66
	fbu,a	%fcc1,	loop_1737
	sdivcc	%l6,	0x1042,	%g1
	movl	%xcc,	%o0,	%g3
	brnz	%o7,	loop_1738
loop_1737:
	udivcc	%o3,	0x0C41,	%i2
	set	0x6C, %i6
	ldsha	[%l7 + %i6] 0x15,	%o6
loop_1738:
	for	%f16,	%f16,	%f16
	fcmpeq16	%f4,	%f24,	%l0
	pdist	%f16,	%f30,	%f24
	sethi	0x05D5,	%i1
	edge16n	%g7,	%o2,	%i6
	fmul8x16al	%f28,	%f27,	%f12
	movg	%icc,	%g2,	%o4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i3,	%i5
	sdivx	%i7,	0x0130,	%o1
	xor	%l3,	0x0AE8,	%l1
	bge,a,pt	%xcc,	loop_1739
	movrne	%l4,	0x2D8,	%g5
	edge8n	%l5,	%g4,	%i4
	bpos,a,pt	%icc,	loop_1740
loop_1739:
	movrlz	%o5,	0x302,	%g6
	set	0x4C, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i0
loop_1740:
	xorcc	%l6,	0x130D,	%g1
	tne	%icc,	0x0
	fandnot1	%f14,	%f22,	%f2
	bshuffle	%f12,	%f22,	%f10
	mova	%xcc,	%l2,	%o0
	movre	%o7,	%g3,	%o3
	alignaddr	%i2,	%l0,	%o6
	xnor	%g7,	%i1,	%i6
	set	0x0C, %i5
	swapa	[%l7 + %i5] 0x89,	%o2
	movl	%xcc,	%o4,	%i3
	brlz,a	%g2,	loop_1741
	udiv	%i7,	0x0148,	%o1
	edge8ln	%i5,	%l1,	%l4
	fbg	%fcc3,	loop_1742
loop_1741:
	brz	%l3,	loop_1743
	sll	%g5,	%l5,	%g4
	fmovrde	%o5,	%f6,	%f18
loop_1742:
	nop
	set	0x2C, %o4
	prefetch	[%l7 + %o4],	 0x0
loop_1743:
	fmovspos	%xcc,	%f28,	%f1
	subcc	%i4,	%g6,	%l6
	edge32ln	%i0,	%g1,	%l2
	alignaddrl	%o0,	%g3,	%o3
	fmovrse	%i2,	%f6,	%f8
	andn	%o7,	0x0D73,	%o6
	tcs	%xcc,	0x5
	popc	%l0,	%g7
	movle	%xcc,	%i1,	%o2
	tgu	%icc,	0x7
	movcs	%icc,	%i6,	%o4
	bleu,a,pn	%xcc,	loop_1744
	membar	0x47
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1744:
	edge8ln	%i3,	%i7,	%g2
	andncc	%o1,	%i5,	%l1
	bpos	loop_1745
	mulx	%l3,	0x0856,	%g5
	tge	%icc,	0x7
	fabsd	%f4,	%f30
loop_1745:
	orcc	%l4,	0x1B3A,	%g4
	fbule,a	%fcc0,	loop_1746
	tn	%xcc,	0x3
	fble	%fcc1,	loop_1747
	brlez	%l5,	loop_1748
loop_1746:
	mulx	%o5,	0x0824,	%i4
	fbe	%fcc0,	loop_1749
loop_1747:
	sra	%g6,	%i0,	%g1
loop_1748:
	fmovdl	%xcc,	%f7,	%f13
	fmovsa	%xcc,	%f17,	%f2
loop_1749:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x62] %asi,	%l6
	membar	0x5F
	fmovsl	%icc,	%f25,	%f18
	fmovrslez	%o0,	%f13,	%f21
	faligndata	%f20,	%f12,	%f6
	edge8l	%g3,	%l2,	%o3
	fbuge,a	%fcc2,	loop_1750
	brgez,a	%i2,	loop_1751
	tleu	%xcc,	0x6
	tg	%icc,	0x2
loop_1750:
	edge16	%o7,	%o6,	%l0
loop_1751:
	brgez	%g7,	loop_1752
	fnot1s	%f25,	%f21
	tge	%icc,	0x0
	fnot1	%f0,	%f2
loop_1752:
	edge8	%o2,	%i1,	%o4
	fsrc2	%f16,	%f6
	fxnors	%f22,	%f13,	%f14
	fmul8ulx16	%f30,	%f28,	%f4
	subcc	%i3,	0x0D51,	%i6
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tle	%icc,	0x5
	movge	%icc,	%g2,	%o1
	movn	%xcc,	%i5,	%i7
	nop
	setx	loop_1753,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%l1,	%l3,	%l4
	fmovsne	%xcc,	%f31,	%f2
	fbo,a	%fcc2,	loop_1754
loop_1753:
	alignaddr	%g5,	%g4,	%o5
	udivx	%i4,	0x016F,	%l5
	srax	%g6,	%g1,	%i0
loop_1754:
	ldx	[%l7 + 0x48],	%o0
	addcc	%l6,	%l2,	%o3
	udivx	%g3,	0x018E,	%i2
	sethi	0x12B4,	%o7
	edge8	%l0,	%g7,	%o6
	fmovrdlz	%o2,	%f12,	%f22
	tleu	%xcc,	0x5
	fcmpgt16	%f6,	%f6,	%o4
	lduw	[%l7 + 0x78],	%i3
	edge16l	%i1,	%g2,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1AA6,	%i5
	sdivcc	%i7,	0x1EB8,	%l1
	be	loop_1755
	array8	%l3,	%o1,	%g5
	fmovdgu	%xcc,	%f3,	%f22
	ta	%icc,	0x0
loop_1755:
	flush	%l7 + 0x18
	umul	%l4,	%o5,	%i4
	alignaddr	%g4,	%g6,	%g1
	edge16	%l5,	%o0,	%l6
	array32	%i0,	%o3,	%l2
	movvc	%xcc,	%g3,	%o7
	sllx	%i2,	0x18,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc2,	loop_1756
	movle	%xcc,	%l0,	%o2
	fmovde	%xcc,	%f0,	%f29
	movvs	%xcc,	%o4,	%i3
loop_1756:
	fzeros	%f3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f13
	tvc	%icc,	0x3
	bpos,a	%icc,	loop_1757
	edge16ln	%o6,	%i1,	%i6
	fbul	%fcc2,	loop_1758
	movleu	%icc,	%g2,	%i7
loop_1757:
	fblg,a	%fcc1,	loop_1759
	mulscc	%l1,	%i5,	%o1
loop_1758:
	fandnot2	%f4,	%f14,	%f22
	andn	%l3,	%l4,	%g5
loop_1759:
	fmovdleu	%xcc,	%f3,	%f3
	fpmerge	%f9,	%f11,	%f30
	edge16ln	%i4,	%o5,	%g6
	std	%g4,	[%l7 + 0x30]
	ldd	[%l7 + 0x60],	%g0
	smul	%l5,	0x1481,	%o0
	fpadd16	%f0,	%f20,	%f16
	move	%icc,	%i0,	%o3
	sdiv	%l6,	0x014B,	%l2
	srlx	%o7,	%g3,	%i2
	edge32ln	%g7,	%o2,	%l0
	edge8ln	%i3,	%o6,	%i1
	fpsub16s	%f5,	%f4,	%f6
	xor	%i6,	0x14B7,	%o4
	set	0x40, %l1
	stha	%g2,	[%l7 + %l1] 0x14
	movrlz	%l1,	0x213,	%i5
	brnz,a	%o1,	loop_1760
	array8	%l3,	%i7,	%g5
	sir	0x1FE3
	xorcc	%l4,	%i4,	%o5
loop_1760:
	orcc	%g4,	0x16E4,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%g1,	loop_1761
	ldsh	[%l7 + 0x52],	%l5
	tcs	%icc,	0x4
	fbu	%fcc1,	loop_1762
loop_1761:
	edge16	%o0,	%i0,	%o3
	sdivx	%l2,	0x18BC,	%l6
	tcs	%icc,	0x2
loop_1762:
	edge8	%g3,	%o7,	%i2
	membar	0x67
	brz	%g7,	loop_1763
	fnors	%f4,	%f31,	%f23
	fabss	%f2,	%f30
	xnor	%o2,	%i3,	%o6
loop_1763:
	bne,a	loop_1764
	brgez,a	%i1,	loop_1765
	taddcctv	%i6,	%o4,	%l0
	fsrc2s	%f23,	%f15
loop_1764:
	fpack32	%f6,	%f18,	%f14
loop_1765:
	udiv	%l1,	0x0CFC,	%g2
	tn	%icc,	0x2
	srl	%i5,	%o1,	%i7
	fnegd	%f18,	%f18
	sllx	%g5,	0x0A,	%l3
	mulx	%i4,	0x19BF,	%o5
	fmul8sux16	%f28,	%f16,	%f28
	andncc	%g4,	%g6,	%l4
	alignaddrl	%l5,	%o0,	%i0
	edge8	%g1,	%l2,	%l6
	fcmpgt16	%f4,	%f14,	%o3
	fxor	%f18,	%f0,	%f16
	bleu,a,pt	%icc,	loop_1766
	fmovda	%icc,	%f29,	%f12
	edge16n	%g3,	%i2,	%o7
	tpos	%xcc,	0x5
loop_1766:
	movrlez	%g7,	0x0D5,	%o2
	xnorcc	%o6,	0x00C4,	%i1
	srax	%i6,	%i3,	%l0
	movrne	%o4,	0x2AC,	%l1
	add	%g2,	%o1,	%i7
	xnor	%i5,	%g5,	%i4
	std	%f30,	[%l7 + 0x10]
	set	0x08, %i1
	stwa	%o5,	[%l7 + %i1] 0x80
	addcc	%l3,	%g6,	%l4
	brlez,a	%g4,	loop_1767
	add	%l5,	0x0DB2,	%i0
	movn	%icc,	%g1,	%o0
	ta	%xcc,	0x7
loop_1767:
	nop
	set	0x68, %i2
	ldxa	[%l7 + %i2] 0x80,	%l2
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0x1
	srlx	%l6,	%i2,	%o7
	bge	%xcc,	loop_1768
	or	%g3,	0x15D5,	%o2
	nop
	setx loop_1769, %l0, %l1
	jmpl %l1, %g7
	fpsub32s	%f28,	%f16,	%f10
loop_1768:
	tge	%xcc,	0x1
	movvc	%xcc,	%o6,	%i6
loop_1769:
	taddcctv	%i3,	%i1,	%o4
	fmovrsgez	%l1,	%f30,	%f26
	srl	%l0,	0x0C,	%o1
	taddcc	%g2,	%i7,	%g5
	fmovs	%f17,	%f30
	alignaddr	%i5,	%o5,	%i4
	array32	%g6,	%l3,	%l4
	fmovdcc	%icc,	%f4,	%f26
	bne,a	loop_1770
	movpos	%xcc,	%g4,	%l5
	fcmpgt16	%f8,	%f20,	%g1
	subcc	%o0,	%l2,	%i0
loop_1770:
	movre	%o3,	0x37C,	%i2
	sub	%l6,	%g3,	%o7
	fcmple32	%f0,	%f24,	%o2
	fblg,a	%fcc3,	loop_1771
	bcs,a	loop_1772
	fmovdgu	%icc,	%f6,	%f21
	addc	%g7,	%i6,	%o6
loop_1771:
	membar	0x62
loop_1772:
	add	%i1,	0x042D,	%i3
	edge16ln	%l1,	%o4,	%o1
	xorcc	%l0,	0x1052,	%i7
	movrgz	%g2,	0x16E,	%i5
	xor	%g5,	%o5,	%g6
	taddcc	%l3,	0x05AB,	%i4
	brlz	%l4,	loop_1773
	tge	%xcc,	0x3
	array32	%l5,	%g4,	%g1
	fzeros	%f11
loop_1773:
	subcc	%o0,	%l2,	%o3
	add	%i2,	%i0,	%g3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	fnot1	%f0,	%f24
	stw	%o7,	[%l7 + 0x3C]
	udivx	%g7,	0x0102,	%i6
	wr	%g0,	0x2a,	%asi
	stda	%o6,	[%l7 + 0x30] %asi
	membar	#Sync
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x04,	 0x2
	tvs	%icc,	0x3
	fands	%f16,	%f10,	%f2
	movl	%xcc,	%i3,	%l1
	edge8l	%o4,	%o1,	%l0
	movne	%icc,	%i7,	%g2
	taddcc	%i5,	%g5,	%o2
	movre	%o5,	0x2F4,	%l3
	xnor	%i4,	%g6,	%l5
	movneg	%icc,	%g4,	%l4
	sll	%o0,	%g1,	%o3
	mulscc	%i2,	%l2,	%i0
	fpadd32	%f0,	%f22,	%f6
	fornot2	%f16,	%f12,	%f26
	fxnor	%f22,	%f12,	%f16
	array8	%g3,	%o7,	%g7
	movrgez	%l6,	%o6,	%i6
	fmuld8ulx16	%f6,	%f1,	%f6
	sir	0x1570
	fmovrslz	%i1,	%f16,	%f31
	movle	%xcc,	%l1,	%o4
	set	0x2E, %i4
	ldsba	[%l7 + %i4] 0x18,	%o1
	fbe	%fcc1,	loop_1774
	tgu	%xcc,	0x4
	mulscc	%i3,	0x16F0,	%l0
	fandnot1	%f28,	%f2,	%f26
loop_1774:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g2
	ba,a,pn	%xcc,	loop_1775
	fbug,a	%fcc3,	loop_1776
	fmovdcc	%xcc,	%f2,	%f27
	fxnors	%f9,	%f28,	%f26
loop_1775:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1776:
	fnegd	%f8,	%f8
	fbe,a	%fcc1,	loop_1777
	orncc	%i7,	0x0218,	%i5
	srax	%g5,	%o5,	%o2
	edge8ln	%i4,	%l3,	%g6
loop_1777:
	brnz	%g4,	loop_1778
	udivcc	%l4,	0x1203,	%o0
	movre	%l5,	0x2FF,	%g1
	popc	0x07BE,	%o3
loop_1778:
	fbge	%fcc3,	loop_1779
	edge8l	%l2,	%i2,	%g3
	add	%o7,	%g7,	%l6
	bneg,a	loop_1780
loop_1779:
	sll	%o6,	0x1D,	%i6
	fmul8sux16	%f18,	%f16,	%f30
	fmovda	%xcc,	%f5,	%f25
loop_1780:
	subc	%i0,	0x066E,	%l1
	ldd	[%l7 + 0x28],	%i0
	fcmple16	%f20,	%f0,	%o4
	orn	%i3,	%l0,	%o1
	alignaddr	%g2,	%i5,	%g5
	andcc	%i7,	%o5,	%i4
	fmovrsgez	%o2,	%f2,	%f9
	sdivx	%g6,	0x02F1,	%l3
	ldx	[%l7 + 0x60],	%g4
	fbue,a	%fcc1,	loop_1781
	sethi	0x0B11,	%l4
	fmovsn	%xcc,	%f24,	%f3
	movne	%icc,	%o0,	%g1
loop_1781:
	bpos,a,pn	%icc,	loop_1782
	fbe	%fcc0,	loop_1783
	be	%xcc,	loop_1784
	bl	loop_1785
loop_1782:
	edge16n	%l5,	%l2,	%o3
loop_1783:
	xorcc	%i2,	0x0FC6,	%o7
loop_1784:
	mova	%icc,	%g3,	%g7
loop_1785:
	fcmpeq16	%f26,	%f16,	%l6
	edge8	%o6,	%i6,	%l1
	edge32l	%i0,	%o4,	%i1
	xorcc	%l0,	%o1,	%i3
	fmovsvs	%icc,	%f1,	%f16
	bcs	%icc,	loop_1786
	fnors	%f26,	%f10,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g2,	%g5
loop_1786:
	lduw	[%l7 + 0x20],	%i7
	orcc	%o5,	0x119B,	%i4
	fornot1	%f4,	%f26,	%f10
	te	%icc,	0x5
	movrlz	%i5,	0x11D,	%o2
	wr	%g0,	0xe2,	%asi
	stba	%l3,	[%l7 + 0x30] %asi
	membar	#Sync
	movle	%icc,	%g6,	%g4
	fbug	%fcc0,	loop_1787
	srax	%o0,	0x03,	%g1
	edge8ln	%l4,	%l2,	%o3
	edge16l	%i2,	%l5,	%o7
loop_1787:
	fcmpne32	%f10,	%f4,	%g7
	edge8ln	%l6,	%o6,	%i6
	srlx	%l1,	%g3,	%o4
	subccc	%i0,	0x16DE,	%i1
	edge16n	%l0,	%o1,	%i3
	brlz,a	%g2,	loop_1788
	orn	%g5,	0x0CE4,	%o5
	andn	%i4,	%i5,	%i7
	tge	%xcc,	0x5
loop_1788:
	xor	%l3,	0x17E4,	%o2
	tn	%xcc,	0x7
	fone	%f12
	fmul8x16au	%f29,	%f16,	%f0
	fxnor	%f4,	%f14,	%f12
	fnot1s	%f26,	%f30
	fpsub32	%f6,	%f20,	%f28
	fmovrdgz	%g4,	%f20,	%f28
	fabsd	%f22,	%f20
	udivx	%o0,	0x19FD,	%g1
	fmovdvc	%icc,	%f21,	%f21
	tl	%xcc,	0x1
	sdivx	%g6,	0x0282,	%l2
	fmul8x16au	%f23,	%f1,	%f12
	array32	%l4,	%i2,	%o3
	tsubcc	%o7,	%l5,	%l6
	sdivcc	%o6,	0x17F0,	%i6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x27] %asi,	%g7
	edge16ln	%l1,	%o4,	%i0
	bpos,pn	%icc,	loop_1789
	tvc	%icc,	0x0
	sra	%g3,	%i1,	%l0
	nop
	set	0x36, %o3
	lduh	[%l7 + %o3],	%i3
loop_1789:
	fmovsgu	%xcc,	%f7,	%f20
	movcs	%icc,	%g2,	%o1
	sdivcc	%g5,	0x1EEC,	%i4
	addccc	%o5,	0x1A5B,	%i7
	fbul	%fcc1,	loop_1790
	movvs	%xcc,	%l3,	%i5
	movrne	%o2,	0x09A,	%o0
	fmovrslz	%g4,	%f23,	%f10
loop_1790:
	srlx	%g1,	%l2,	%l4
	fmovsvs	%icc,	%f5,	%f2
	fmovsn	%xcc,	%f29,	%f20
	andcc	%g6,	0x116E,	%i2
	and	%o3,	0x0A9D,	%o7
	edge8l	%l6,	%o6,	%l5
	flush	%l7 + 0x08
	fsrc2	%f16,	%f24
	umul	%g7,	0x14D8,	%l1
	nop
	setx	loop_1791,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x3
	fand	%f20,	%f18,	%f10
	andcc	%o4,	%i0,	%g3
loop_1791:
	subccc	%i1,	%i6,	%i3
	fmovdvc	%xcc,	%f3,	%f11
	movre	%l0,	%g2,	%g5
	array8	%i4,	%o1,	%i7
	bneg	%xcc,	loop_1792
	edge16ln	%o5,	%l3,	%o2
	sdiv	%o0,	0x0F0A,	%g4
	fmovdn	%xcc,	%f25,	%f5
loop_1792:
	array8	%i5,	%g1,	%l2
	fpsub16	%f2,	%f16,	%f4
	tleu	%icc,	0x2
	flush	%l7 + 0x7C
	addcc	%g6,	0x02F4,	%i2
	and	%o3,	%l4,	%o7
	movn	%icc,	%l6,	%o6
	pdist	%f22,	%f24,	%f0
	stbar
	ta	%icc,	0x6
	wr	%g0,	0x52,	%asi
	stxa	%g7,	[%g0 + 0x108] %asi
	sdiv	%l5,	0x0031,	%l1
	tle	%icc,	0x5
	bpos,a	loop_1793
	movneg	%icc,	%i0,	%g3
	sth	%o4,	[%l7 + 0x34]
	movrgez	%i1,	0x371,	%i6
loop_1793:
	fpsub32s	%f24,	%f14,	%f5
	sra	%i3,	0x05,	%l0
	sdivx	%g5,	0x121C,	%g2
	edge16l	%i4,	%i7,	%o5
	fnot1s	%f25,	%f17
	udivcc	%o1,	0x08B4,	%o2
	edge8l	%l3,	%o0,	%g4
	addccc	%g1,	0x1405,	%i5
	tsubcc	%g6,	%i2,	%o3
	fbue,a	%fcc2,	loop_1794
	mulscc	%l2,	0x101F,	%l4
	udivcc	%o7,	0x0ECA,	%o6
	tsubcc	%g7,	%l6,	%l1
loop_1794:
	orncc	%i0,	%l5,	%o4
	edge16	%i1,	%g3,	%i3
	ldstub	[%l7 + 0x53],	%i6
	tvs	%xcc,	0x3
	tg	%xcc,	0x6
	subcc	%g5,	0x067B,	%g2
	fmuld8ulx16	%f23,	%f7,	%f6
	sethi	0x15C3,	%l0
	tvc	%xcc,	0x1
	fcmpne32	%f2,	%f30,	%i7
	fandnot1	%f14,	%f28,	%f10
	orcc	%o5,	%i4,	%o1
	fzero	%f8
	tsubcctv	%o2,	0x04BC,	%l3
	andncc	%g4,	%o0,	%g1
	edge8ln	%i5,	%i2,	%o3
	addcc	%g6,	0x069B,	%l4
	set	0x4D, %o5
	lduba	[%l7 + %o5] 0x04,	%o7
	xnor	%o6,	0x1550,	%l2
	umul	%g7,	%l6,	%i0
	movle	%xcc,	%l5,	%l1
	stb	%o4,	[%l7 + 0x34]
	ldd	[%l7 + 0x58],	%i0
	array16	%i3,	%i6,	%g5
	bpos,pt	%xcc,	loop_1795
	fmovrslz	%g3,	%f12,	%f24
	sethi	0x1EC7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1795:
	tg	%xcc,	0x7
	fmovd	%f2,	%f6
	bneg,pt	%icc,	loop_1796
	umulcc	%g2,	0x0FC2,	%i7
	xor	%o5,	0x1334,	%i4
	srax	%o1,	%l3,	%o2
loop_1796:
	fmul8x16al	%f21,	%f9,	%f10
	sdivcc	%g4,	0x182C,	%g1
	sll	%o0,	%i5,	%o3
	tle	%icc,	0x4
	fmovdvc	%xcc,	%f22,	%f8
	tcc	%icc,	0x6
	movvs	%xcc,	%i2,	%g6
	tle	%icc,	0x3
	ld	[%l7 + 0x14],	%f31
	tg	%xcc,	0x2
	sll	%o7,	0x02,	%o6
	te	%icc,	0x0
	st	%f5,	[%l7 + 0x18]
	movrlez	%l4,	0x1D2,	%g7
	fpadd32s	%f14,	%f25,	%f24
	srl	%l2,	0x00,	%i0
	brlez	%l6,	loop_1797
	edge16n	%l1,	%l5,	%i1
	edge8ln	%i3,	%i6,	%o4
	sra	%g5,	%l0,	%g3
loop_1797:
	or	%g2,	0x1510,	%o5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x10] %asi,	%i4
	bn	loop_1798
	stw	%o1,	[%l7 + 0x7C]
	orncc	%l3,	%o2,	%i7
	fmovdleu	%xcc,	%f19,	%f22
loop_1798:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g1,	%o0,	%g4
	st	%f20,	[%l7 + 0x4C]
	fabss	%f7,	%f30
	brlz	%o3,	loop_1799
	fmul8x16	%f30,	%f8,	%f26
	umulcc	%i2,	%g6,	%o7
	srax	%i5,	%l4,	%o6
loop_1799:
	pdist	%f28,	%f22,	%f30
	mulscc	%l2,	0x0F34,	%g7
	alignaddrl	%i0,	%l6,	%l5
	bleu,pn	%icc,	loop_1800
	addccc	%i1,	0x18B1,	%l1
	fnot2s	%f31,	%f18
	udivx	%i6,	0x1314,	%i3
loop_1800:
	addc	%o4,	%g5,	%g3
	edge16l	%g2,	%o5,	%l0
	taddcctv	%o1,	0x0581,	%i4
	alignaddrl	%l3,	%i7,	%g1
	alignaddr	%o0,	%g4,	%o3
	set	0x60, %o6
	stwa	%o2,	[%l7 + %o6] 0x2b
	membar	#Sync
	fbl,a	%fcc2,	loop_1801
	fmovdg	%xcc,	%f4,	%f0
	fbuge,a	%fcc0,	loop_1802
	srlx	%g6,	%o7,	%i5
loop_1801:
	mulscc	%i2,	%l4,	%o6
	edge32l	%l2,	%g7,	%l6
loop_1802:
	mova	%xcc,	%l5,	%i1
	andcc	%l1,	0x1DBB,	%i6
	movrgez	%i3,	0x143,	%o4
	fpack16	%f2,	%f19
	nop
	set	0x38, %l2
	lduw	[%l7 + %l2],	%g5
	movrgz	%g3,	%g2,	%o5
	tcs	%icc,	0x5
	tcs	%xcc,	0x4
	fcmpd	%fcc0,	%f16,	%f20
	bge,pt	%xcc,	loop_1803
	brz,a	%l0,	loop_1804
	movg	%icc,	%i0,	%o1
	move	%icc,	%l3,	%i4
loop_1803:
	bleu,pn	%icc,	loop_1805
loop_1804:
	fmovsgu	%icc,	%f25,	%f13
	and	%g1,	%o0,	%g4
	tvs	%icc,	0x2
loop_1805:
	andncc	%o3,	%o2,	%g6
	smul	%o7,	0x066E,	%i5
	mulx	%i2,	%i7,	%o6
	orncc	%l4,	%l2,	%l6
	bleu	%icc,	loop_1806
	bgu,a,pn	%icc,	loop_1807
	movn	%xcc,	%g7,	%l5
	wr	%g0,	0x0c,	%asi
	stba	%l1,	[%l7 + 0x70] %asi
loop_1806:
	ta	%xcc,	0x3
loop_1807:
	siam	0x2
	set	0x56, %o1
	ldstuba	[%l7 + %o1] 0x19,	%i6
	pdist	%f14,	%f26,	%f18
	tgu	%xcc,	0x5
	fnors	%f9,	%f0,	%f26
	fmovscs	%icc,	%f5,	%f5
	mulscc	%i1,	0x01EC,	%o4
	xor	%i3,	0x17E2,	%g5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%o5
	tvs	%icc,	0x7
	tcc	%xcc,	0x2
	fble	%fcc0,	loop_1808
	bleu	%xcc,	loop_1809
	edge8	%l0,	%i0,	%g3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x6C] %asi,	%f5
loop_1808:
	sub	%l3,	0x086A,	%o1
loop_1809:
	std	%g0,	[%l7 + 0x18]
	movrgez	%o0,	%i4,	%o3
	sllx	%g4,	0x02,	%g6
	tcc	%xcc,	0x6
	fmovscc	%xcc,	%f19,	%f10
	sethi	0x0C78,	%o7
	fmovsgu	%icc,	%f6,	%f24
	call	loop_1810
	mova	%xcc,	%o2,	%i5
	and	%i2,	0x13E5,	%i7
	set	0x74, %l6
	lda	[%l7 + %l6] 0x88,	%f23
loop_1810:
	edge16ln	%o6,	%l4,	%l6
	tvc	%icc,	0x4
	orcc	%g7,	%l5,	%l2
	movrgz	%l1,	%i1,	%o4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%i3
	set	0x2F, %g7
	stba	%i6,	[%l7 + %g7] 0x15
	and	%g5,	%g2,	%l0
	fnegs	%f11,	%f8
	fors	%f21,	%f4,	%f22
	tg	%xcc,	0x3
	faligndata	%f16,	%f18,	%f26
	brgez	%o5,	loop_1811
	brlz,a	%i0,	loop_1812
	umulcc	%l3,	0x106B,	%g3
	orncc	%o1,	0x15E2,	%g1
loop_1811:
	nop
	set	0x60, %l3
	swapa	[%l7 + %l3] 0x80,	%i4
loop_1812:
	fbo	%fcc1,	loop_1813
	or	%o0,	%o3,	%g4
	tsubcc	%o7,	%o2,	%i5
	sdiv	%g6,	0x1E6D,	%i2
loop_1813:
	nop
	setx loop_1814, %l0, %l1
	jmpl %l1, %i7
	fbue,a	%fcc0,	loop_1815
	bge	loop_1816
	movvs	%icc,	%l4,	%o6
loop_1814:
	fcmpeq16	%f12,	%f8,	%g7
loop_1815:
	fcmpgt16	%f28,	%f26,	%l6
loop_1816:
	or	%l2,	%l5,	%l1
	edge8ln	%o4,	%i1,	%i3
	mulx	%g5,	0x0E49,	%g2
	sra	%i6,	%o5,	%l0
	fors	%f15,	%f23,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%i0,	%f30,	%f31
	umul	%g3,	%l3,	%g1
	subccc	%o1,	%o0,	%o3
	andncc	%g4,	%o7,	%o2
	movrlez	%i4,	0x382,	%g6
	orn	%i2,	%i7,	%l4
	srl	%o6,	0x16,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l6,	%i5,	%l2
	array16	%l5,	%l1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f16
	edge8	%i1,	%i3,	%g5
	xorcc	%i6,	0x085D,	%g2
	fbul	%fcc3,	loop_1817
	addccc	%l0,	0x0691,	%i0
	movpos	%icc,	%o5,	%g3
	set	0x27, %g4
	stba	%l3,	[%l7 + %g4] 0x2f
	membar	#Sync
loop_1817:
	umulcc	%o1,	%o0,	%o3
	tvc	%icc,	0x0
	edge8l	%g1,	%g4,	%o7
	umulcc	%i4,	0x1A0C,	%g6
	sdivcc	%i2,	0x1D8B,	%o2
	fandnot2s	%f15,	%f5,	%f11
	tgu	%icc,	0x6
	movrlz	%l4,	%i7,	%o6
	wr	%g0,	0x2f,	%asi
	stha	%l6,	[%l7 + 0x4E] %asi
	membar	#Sync
	tge	%icc,	0x7
	sdivx	%g7,	0x1473,	%l2
	fba,a	%fcc2,	loop_1818
	xorcc	%i5,	%l1,	%o4
	fpsub16s	%f15,	%f13,	%f9
	edge16l	%i1,	%i3,	%l5
loop_1818:
	fbn,a	%fcc3,	loop_1819
	mulx	%i6,	%g2,	%g5
	nop
	setx loop_1820, %l0, %l1
	jmpl %l1, %i0
	fbne	%fcc1,	loop_1821
loop_1819:
	addcc	%o5,	0x02B2,	%g3
	fcmpes	%fcc1,	%f24,	%f16
loop_1820:
	stx	%l3,	[%l7 + 0x08]
loop_1821:
	subc	%o1,	0x0F9D,	%o0
	brlz	%o3,	loop_1822
	membar	0x02
	movrlz	%g1,	%l0,	%o7
	or	%g4,	0x00E9,	%g6
loop_1822:
	ldub	[%l7 + 0x6D],	%i2
	edge8l	%o2,	%i4,	%i7
	tn	%xcc,	0x4
	lduw	[%l7 + 0x70],	%o6
	edge32ln	%l6,	%l4,	%g7
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x0c,	%l2
	fxnor	%f18,	%f6,	%f16
	fmovsleu	%icc,	%f17,	%f31
	tleu	%xcc,	0x0
	ba,pn	%icc,	loop_1823
	fornot1	%f30,	%f20,	%f26
	fmovrdne	%l1,	%f18,	%f24
	ta	%xcc,	0x2
loop_1823:
	orn	%i5,	0x0A17,	%o4
	fmul8x16au	%f25,	%f16,	%f28
	add	%i1,	%i3,	%i6
	edge16n	%l5,	%g5,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%g2
	tcc	%xcc,	0x6
	addc	%g3,	%l3,	%o1
	fble	%fcc0,	loop_1824
	fand	%f4,	%f26,	%f20
	orn	%o0,	%o3,	%l0
	addcc	%g1,	%o7,	%g4
loop_1824:
	be,a,pn	%icc,	loop_1825
	fmovdcs	%icc,	%f23,	%f31
	fbg,a	%fcc0,	loop_1826
	andcc	%i2,	0x0CBB,	%g6
loop_1825:
	nop
	set	0x62, %g1
	stha	%i4,	[%l7 + %g1] 0x04
loop_1826:
	movcc	%icc,	%o2,	%i7
	smulcc	%o6,	0x1464,	%l6
	fornot2s	%f6,	%f28,	%f27
	fmovdn	%icc,	%f14,	%f27
	edge8l	%l4,	%g7,	%l2
	fblg,a	%fcc3,	loop_1827
	tl	%xcc,	0x0
	orncc	%l1,	%o4,	%i5
	movrne	%i1,	0x29F,	%i3
loop_1827:
	xor	%l5,	0x0A22,	%i6
	fnands	%f18,	%f4,	%f7
	bvs,a,pt	%xcc,	loop_1828
	edge32n	%i0,	%o5,	%g2
	movrne	%g5,	0x259,	%l3
	fblg,a	%fcc2,	loop_1829
loop_1828:
	fmovd	%f18,	%f16
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%g3
loop_1829:
	swap	[%l7 + 0x24],	%o1
	bneg,pt	%xcc,	loop_1830
	ta	%xcc,	0x0
	movrgz	%o0,	%l0,	%g1
	sllx	%o3,	%g4,	%i2
loop_1830:
	udivcc	%g6,	0x0ABF,	%i4
	array16	%o7,	%i7,	%o2
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x11,	%l6
	move	%xcc,	%o6,	%g7
	subc	%l2,	%l4,	%o4
	fmovrslz	%l1,	%f6,	%f20
	movcc	%icc,	%i1,	%i5
	fbe	%fcc3,	loop_1831
	taddcctv	%i3,	0x0E0E,	%i6
	movne	%xcc,	%l5,	%o5
	bl,a,pn	%xcc,	loop_1832
loop_1831:
	srl	%g2,	%g5,	%i0
	move	%xcc,	%l3,	%o1
	edge8l	%g3,	%l0,	%g1
loop_1832:
	or	%o0,	%o3,	%g4
	sdivx	%i2,	0x1F9C,	%i4
	edge8n	%g6,	%o7,	%o2
	fpsub16s	%f12,	%f24,	%f6
	taddcctv	%l6,	0x1F3E,	%o6
	set	0x68, %l4
	lda	[%l7 + %l4] 0x19,	%f8
	orn	%g7,	0x0570,	%i7
	fble	%fcc1,	loop_1833
	stb	%l2,	[%l7 + 0x42]
	stx	%o4,	[%l7 + 0x70]
	fcmpd	%fcc1,	%f24,	%f12
loop_1833:
	orcc	%l4,	%l1,	%i5
	movge	%xcc,	%i1,	%i6
	xor	%l5,	%o5,	%i3
	fmovrdgez	%g2,	%f28,	%f6
	srlx	%i0,	0x16,	%g5
	fnot2	%f24,	%f8
	fmovrslz	%l3,	%f21,	%f26
	bcc,a,pn	%xcc,	loop_1834
	xor	%g3,	0x07CE,	%o1
	movrlez	%l0,	0x35B,	%o0
	subc	%g1,	%o3,	%g4
loop_1834:
	move	%xcc,	%i2,	%i4
	tcc	%icc,	0x7
	fmuld8sux16	%f12,	%f3,	%f20
	tg	%xcc,	0x1
	membar	0x2E
	and	%g6,	%o7,	%l6
	tsubcctv	%o6,	%g7,	%i7
	orcc	%l2,	%o2,	%l4
	umul	%o4,	%i5,	%i1
	movcs	%xcc,	%l1,	%i6
	fmovsvs	%icc,	%f4,	%f17
	movvs	%xcc,	%l5,	%i3
	tle	%icc,	0x5
	subc	%o5,	0x12EF,	%i0
	set	0x18, %o2
	ldxa	[%l7 + %o2] 0x88,	%g2
	fbue	%fcc1,	loop_1835
	and	%l3,	0x0CA8,	%g5
	sethi	0x0709,	%g3
	movn	%xcc,	%l0,	%o1
loop_1835:
	taddcctv	%g1,	%o0,	%g4
	tl	%icc,	0x7
	srax	%o3,	%i2,	%i4
	set	0x2C, %o0
	swapa	[%l7 + %o0] 0x10,	%o7
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bgu,pn	%icc,	loop_1836
	move	%xcc,	%l6,	%o6
	set	0x20, %i7
	lduwa	[%l7 + %i7] 0x19,	%g7
loop_1836:
	fabss	%f14,	%f10
	tgu	%xcc,	0x7
	fbo	%fcc3,	loop_1837
	ldd	[%l7 + 0x58],	%f24
	xnor	%i7,	0x0529,	%l2
	edge32l	%g6,	%l4,	%o2
loop_1837:
	swap	[%l7 + 0x54],	%i5
	prefetch	[%l7 + 0x1C],	 0x3
	fmovrde	%o4,	%f26,	%f8
	edge8l	%i1,	%l1,	%l5
	udivx	%i3,	0x0FA0,	%o5
	set	0x0C, %o7
	stwa	%i0,	[%l7 + %o7] 0x22
	membar	#Sync
	set	0x38, %g5
	lduha	[%l7 + %g5] 0x0c,	%g2
	bvc	%icc,	loop_1838
	be,a,pt	%icc,	loop_1839
	fbuge	%fcc1,	loop_1840
	fmovd	%f10,	%f6
loop_1838:
	movcs	%icc,	%l3,	%i6
loop_1839:
	ld	[%l7 + 0x54],	%f19
loop_1840:
	brz	%g5,	loop_1841
	ldsb	[%l7 + 0x1B],	%g3
	bcc,pn	%xcc,	loop_1842
	movg	%xcc,	%l0,	%o1
loop_1841:
	sdivcc	%o0,	0x11DE,	%g4
	edge8	%o3,	%g1,	%i4
loop_1842:
	movneg	%icc,	%o7,	%l6
	xnor	%o6,	%g7,	%i2
	subc	%l2,	0x0DB1,	%g6
	sth	%i7,	[%l7 + 0x12]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%i5
	fmovsvs	%icc,	%f1,	%f3
	orn	%o4,	%o2,	%l1
	brlz	%i1,	loop_1843
	srlx	%i3,	%l5,	%o5
	mulx	%g2,	0x0085,	%l3
	tcc	%xcc,	0x5
loop_1843:
	nop
	set	0x0C, %l5
	lduwa	[%l7 + %l5] 0x18,	%i0
	set	0x2A, %i6
	lduha	[%l7 + %i6] 0x19,	%i6
	std	%f6,	[%l7 + 0x38]
	fmovdneg	%xcc,	%f13,	%f26
	array16	%g5,	%g3,	%l0
	array32	%o1,	%g4,	%o0
	bgu,a	%icc,	loop_1844
	std	%f28,	[%l7 + 0x58]
	fmovsa	%xcc,	%f20,	%f7
	brlez,a	%o3,	loop_1845
loop_1844:
	tcs	%icc,	0x3
	std	%f20,	[%l7 + 0x40]
	fpadd16s	%f25,	%f18,	%f24
loop_1845:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i4
	edge16	%o7,	%l6,	%o6
	xorcc	%g7,	%g1,	%i2
	stx	%l2,	[%l7 + 0x58]
	brlz	%g6,	loop_1846
	ldx	[%l7 + 0x38],	%l4
	taddcctv	%i5,	%o4,	%o2
	orn	%i7,	0x1134,	%l1
loop_1846:
	nop
	setx	loop_1847,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16	%f11,	%f0,	%f14
	ldx	[%l7 + 0x08],	%i3
	xor	%i1,	%o5,	%g2
loop_1847:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x12],	%l5
	sub	%i0,	0x04B1,	%l3
	edge32l	%i6,	%g3,	%l0
	fmovrslez	%g5,	%f17,	%f8
	edge16ln	%o1,	%o0,	%g4
	or	%i4,	0x017A,	%o3
	edge8	%l6,	%o6,	%g7
	fcmpes	%fcc1,	%f27,	%f10
	sdiv	%g1,	0x17B3,	%o7
	or	%i2,	0x15C8,	%g6
	tcc	%icc,	0x2
	sdivx	%l4,	0x1B84,	%i5
	edge8l	%l2,	%o4,	%o2
	xnorcc	%l1,	0x165F,	%i3
	fcmped	%fcc3,	%f8,	%f14
	nop
	set	0x48, %g2
	std	%i6,	[%l7 + %g2]
	brlz,a	%i1,	loop_1848
	edge8ln	%g2,	%l5,	%i0
	pdist	%f28,	%f10,	%f12
	edge16ln	%o5,	%l3,	%i6
loop_1848:
	movrgz	%l0,	0x04A,	%g5
	lduh	[%l7 + 0x1E],	%o1
	edge16n	%g3,	%g4,	%o0
	tvs	%icc,	0x1
	fmovrdne	%o3,	%f22,	%f2
	membar	0x08
	ldsh	[%l7 + 0x24],	%i4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x10] %asi,	%o6
	srl	%g7,	0x08,	%g1
	ta	%xcc,	0x3
	srax	%l6,	%o7,	%g6
	movge	%icc,	%i2,	%l4
	fmovrde	%l2,	%f14,	%f8
	brlez	%o4,	loop_1849
	fble,a	%fcc2,	loop_1850
	sub	%i5,	0x0140,	%l1
	fmovdn	%icc,	%f11,	%f20
loop_1849:
	movl	%icc,	%i3,	%o2
loop_1850:
	smulcc	%i7,	%g2,	%l5
	srlx	%i1,	0x04,	%i0
	movvs	%xcc,	%o5,	%l3
	taddcctv	%i6,	%g5,	%l0
	be,pt	%icc,	loop_1851
	fsrc1s	%f16,	%f19
	bn,a	%icc,	loop_1852
	tpos	%xcc,	0x4
loop_1851:
	add	%g3,	%g4,	%o0
	edge8	%o3,	%i4,	%o6
loop_1852:
	fmovscc	%xcc,	%f2,	%f19
	movle	%icc,	%g7,	%o1
	mova	%icc,	%g1,	%o7
	fmovrsne	%l6,	%f1,	%f3
	wr	%g0,	0x2f,	%asi
	stwa	%g6,	[%l7 + 0x30] %asi
	membar	#Sync
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldsw	[%l7 + 0x34],	%l4
	fmovdg	%xcc,	%f25,	%f22
	movle	%xcc,	%l2,	%o4
	tsubcc	%i2,	%l1,	%i5
	wr	%g0,	0x22,	%asi
	stda	%i2,	[%l7 + 0x48] %asi
	membar	#Sync
	bneg,pt	%icc,	loop_1853
	udivx	%i7,	0x1620,	%o2
	fmovde	%xcc,	%f4,	%f30
	fbo	%fcc2,	loop_1854
loop_1853:
	call	loop_1855
	move	%xcc,	%g2,	%l5
	popc	0x19DC,	%i0
loop_1854:
	ta	%icc,	0x1
loop_1855:
	bcc,pt	%xcc,	loop_1856
	mova	%icc,	%o5,	%i1
	fbuge	%fcc0,	loop_1857
	ld	[%l7 + 0x38],	%f2
loop_1856:
	popc	%i6,	%g5
	fcmpd	%fcc3,	%f6,	%f30
loop_1857:
	edge8l	%l0,	%g3,	%g4
	mova	%icc,	%l3,	%o0
	bgu,a,pn	%xcc,	loop_1858
	xor	%o3,	%o6,	%i4
	edge8l	%g7,	%g1,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1858:
	fcmpne16	%f30,	%f18,	%o1
	set	0x24, %i5
	ldswa	[%l7 + %i5] 0x10,	%g6
	tcs	%icc,	0x2
	udiv	%l6,	0x165F,	%l4
	array16	%l2,	%o4,	%l1
	wr	%g0,	0x18,	%asi
	stba	%i5,	[%l7 + 0x41] %asi
	fsrc2s	%f15,	%f4
	lduw	[%l7 + 0x70],	%i3
	edge32ln	%i2,	%i7,	%o2
	fcmps	%fcc2,	%f0,	%f29
	tpos	%xcc,	0x5
	bneg,a	loop_1859
	te	%xcc,	0x3
	edge16l	%g2,	%i0,	%l5
	popc	0x00B7,	%o5
loop_1859:
	brz	%i1,	loop_1860
	fmovsn	%xcc,	%f6,	%f0
	movrne	%i6,	0x27C,	%l0
	fmovd	%f20,	%f12
loop_1860:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x4
	fmovrslz	%g3,	%f23,	%f7
	fmovdvc	%xcc,	%f20,	%f14
	for	%f20,	%f24,	%f18
	array16	%g5,	%g4,	%l3
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0x0
	orncc	%o3,	0x1A3D,	%i4
	sdiv	%g7,	0x1E0A,	%g1
	movrgez	%o7,	%o1,	%o6
	fmuld8sux16	%f13,	%f10,	%f24
	and	%g6,	%l6,	%l4
	sdivcc	%l2,	0x0659,	%l1
	sub	%o4,	%i3,	%i5
	fmovsle	%xcc,	%f7,	%f8
	umul	%i2,	%i7,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x6
	fmovdvs	%icc,	%f18,	%f28
	tpos	%xcc,	0x3
	movrlz	%g2,	%l5,	%i0
	movge	%xcc,	%o5,	%i6
	fmul8ulx16	%f12,	%f16,	%f2
	addc	%l0,	0x0E9F,	%i1
	ldd	[%l7 + 0x30],	%g2
	fnot2	%f4,	%f24
	fsrc2	%f14,	%f14
	fbuge,a	%fcc1,	loop_1861
	ldsh	[%l7 + 0x0E],	%g4
	sub	%l3,	0x1D95,	%o0
	fbuge	%fcc0,	loop_1862
loop_1861:
	movcs	%icc,	%o3,	%g5
	tvs	%xcc,	0x3
	xor	%g7,	0x0D96,	%i4
loop_1862:
	addccc	%o7,	%g1,	%o6
	movcc	%xcc,	%g6,	%o1
	edge16n	%l4,	%l6,	%l2
	andncc	%o4,	%i3,	%l1
	orcc	%i2,	%i7,	%i5
	fmovrsgez	%g2,	%f10,	%f1
	edge8	%l5,	%i0,	%o5
	xor	%i6,	%l0,	%o2
	edge8	%i1,	%g3,	%l3
	fmovsvs	%xcc,	%f3,	%f24
	fmovrdgz	%g4,	%f0,	%f0
	sethi	0x11CE,	%o3
	set	0x48, %i1
	lduwa	[%l7 + %i1] 0x11,	%o0
	fcmpne32	%f14,	%f8,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_1863, %l0, %l1
	jmpl %l1, %g7
	udiv	%o7,	0x1053,	%g1
	fmovrslz	%o6,	%f1,	%f18
	bgu,a,pn	%xcc,	loop_1864
loop_1863:
	srax	%g6,	0x18,	%i4
	popc	%l4,	%l6
	andcc	%o1,	0x0298,	%l2
loop_1864:
	fmovdvc	%icc,	%f0,	%f12
	movl	%icc,	%i3,	%l1
	fmovsg	%icc,	%f13,	%f19
	movcs	%xcc,	%o4,	%i7
	fmovrdne	%i2,	%f14,	%f0
	orn	%i5,	0x0E24,	%l5
	xnorcc	%i0,	%o5,	%i6
	umulcc	%l0,	%g2,	%i1
	subc	%o2,	0x08BB,	%g3
	orncc	%l3,	0x01B9,	%o3
	or	%o0,	%g4,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o7,	%g7
	edge32n	%o6,	%g6,	%g1
	lduw	[%l7 + 0x34],	%l4
	fandnot2	%f10,	%f24,	%f14
	addccc	%l6,	0x1A2A,	%i4
	sdiv	%o1,	0x021C,	%i3
	edge16	%l1,	%o4,	%i7
	tcc	%xcc,	0x1
	tneg	%xcc,	0x4
	movgu	%icc,	%i2,	%l2
	movrlez	%l5,	0x17E,	%i0
	lduh	[%l7 + 0x0C],	%o5
	edge32l	%i5,	%l0,	%g2
	mulx	%i1,	0x0B0C,	%i6
	fbul,a	%fcc1,	loop_1865
	bne,a	loop_1866
	fcmpeq16	%f8,	%f14,	%o2
	move	%xcc,	%g3,	%o3
loop_1865:
	nop
	setx	loop_1867,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1866:
	addc	%l3,	%o0,	%g4
	wr	%g0,	0x11,	%asi
	stxa	%g5,	[%l7 + 0x40] %asi
loop_1867:
	fmovrdlz	%g7,	%f22,	%f16
	tn	%icc,	0x1
	sethi	0x1176,	%o6
	srl	%o7,	0x18,	%g6
	bvs,a,pn	%icc,	loop_1868
	edge8l	%g1,	%l6,	%l4
	movleu	%icc,	%o1,	%i4
	and	%i3,	0x1DE4,	%o4
loop_1868:
	tsubcctv	%i7,	0x1D8F,	%i2
	fcmpeq16	%f22,	%f28,	%l2
	fmovrslz	%l1,	%f28,	%f14
	edge32ln	%i0,	%o5,	%i5
	fsrc2	%f26,	%f8
	fpadd32s	%f0,	%f11,	%f14
	udiv	%l5,	0x15D5,	%g2
	sdiv	%l0,	0x1D76,	%i6
	tsubcc	%i1,	%g3,	%o3
	tgu	%xcc,	0x4
	nop
	setx	loop_1869,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x0983,	%l3
	movne	%xcc,	%o2,	%g4
	fnot1s	%f11,	%f6
loop_1869:
	movneg	%icc,	%o0,	%g5
	andn	%o6,	%o7,	%g7
	fmovdn	%icc,	%f25,	%f20
	fmovse	%xcc,	%f10,	%f25
	udiv	%g6,	0x1616,	%g1
	mova	%xcc,	%l6,	%o1
	movle	%icc,	%l4,	%i3
	fmovsge	%xcc,	%f27,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i4,	%o4
	movrgez	%i2,	%l2,	%l1
	alignaddrl	%i7,	%i0,	%o5
	stx	%i5,	[%l7 + 0x18]
	sub	%l5,	%g2,	%l0
	edge32	%i6,	%i1,	%o3
	movrlz	%l3,	0x23D,	%g3
	fornot1s	%f4,	%f31,	%f14
	fabss	%f13,	%f30
	bcs,a,pt	%icc,	loop_1870
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x61
	movrlez	%o2,	0x224,	%g4
loop_1870:
	edge8	%g5,	%o0,	%o6
	ldd	[%l7 + 0x68],	%f22
	sethi	0x0ABB,	%o7
	set	0x5C, %o4
	stwa	%g7,	[%l7 + %o4] 0x80
	fzeros	%f17
	movge	%icc,	%g6,	%l6
	umul	%o1,	%g1,	%i3
	sub	%l4,	%i4,	%o4
	stx	%l2,	[%l7 + 0x58]
	umul	%i2,	%l1,	%i0
	brz	%i7,	loop_1871
	nop
	setx loop_1872, %l0, %l1
	jmpl %l1, %i5
	movcc	%icc,	%l5,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1871:
	nop
	set	0x20, %i2
	stda	%g2,	[%l7 + %i2] 0xe2
	membar	#Sync
loop_1872:
	smulcc	%i6,	0x0969,	%i1
	mova	%xcc,	%l0,	%l3
	fcmpd	%fcc0,	%f8,	%f0
	fba	%fcc1,	loop_1873
	edge16n	%o3,	%g3,	%o2
	tneg	%icc,	0x6
	fcmple32	%f28,	%f30,	%g4
loop_1873:
	lduh	[%l7 + 0x76],	%o0
	alignaddrl	%g5,	%o7,	%g7
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x1f,	%f0
	subcc	%g6,	%o6,	%o1
	movleu	%icc,	%g1,	%l6
	fandnot2s	%f18,	%f19,	%f2
	fornot1	%f12,	%f6,	%f10
	movrlz	%i3,	0x079,	%i4
	fpsub32s	%f9,	%f27,	%f19
	tvc	%xcc,	0x4
	array16	%o4,	%l4,	%i2
	sdiv	%l2,	0x162B,	%l1
	edge16	%i7,	%i5,	%l5
	fmovrsne	%o5,	%f2,	%f3
	movl	%icc,	%i0,	%i6
	orn	%i1,	%g2,	%l3
	te	%icc,	0x6
	tpos	%xcc,	0x3
	xorcc	%l0,	0x1F62,	%o3
	fand	%f26,	%f28,	%f28
	array8	%o2,	%g3,	%g4
	sethi	0x18DB,	%g5
	ba,pt	%xcc,	loop_1874
	fcmped	%fcc1,	%f18,	%f20
	bgu	%xcc,	loop_1875
	stx	%o0,	[%l7 + 0x58]
loop_1874:
	edge16l	%g7,	%o7,	%o6
	bg,pt	%xcc,	loop_1876
loop_1875:
	faligndata	%f30,	%f4,	%f18
	movgu	%xcc,	%g6,	%g1
	fandnot1	%f24,	%f28,	%f8
loop_1876:
	fnot2	%f16,	%f20
	xnorcc	%l6,	0x0070,	%i3
	orncc	%i4,	%o1,	%l4
	addc	%o4,	%l2,	%l1
	te	%xcc,	0x6
	fcmpeq16	%f20,	%f20,	%i7
	fmovsa	%icc,	%f5,	%f15
	mova	%xcc,	%i5,	%l5
	movpos	%xcc,	%i2,	%o5
	mulscc	%i0,	%i1,	%i6
	tle	%xcc,	0x4
	movl	%icc,	%g2,	%l0
	tsubcc	%o3,	%l3,	%g3
	fpsub16s	%f22,	%f23,	%f7
	fcmple32	%f16,	%f12,	%o2
	fbne,a	%fcc0,	loop_1877
	fbl	%fcc3,	loop_1878
	movneg	%xcc,	%g5,	%o0
	edge16ln	%g7,	%g4,	%o7
loop_1877:
	movg	%icc,	%g6,	%o6
loop_1878:
	udiv	%g1,	0x06E9,	%l6
	orn	%i3,	%o1,	%l4
	te	%xcc,	0x7
	fbge,a	%fcc0,	loop_1879
	edge16	%o4,	%l2,	%l1
	alignaddrl	%i4,	%i7,	%l5
	addcc	%i2,	%i5,	%i0
loop_1879:
	bge	%xcc,	loop_1880
	tvc	%icc,	0x1
	xnorcc	%i1,	0x16E2,	%i6
	edge16l	%g2,	%o5,	%o3
loop_1880:
	sir	0x1D70
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x14] %asi,	%l3
	edge8ln	%l0,	%g3,	%o2
	prefetch	[%l7 + 0x34],	 0x0
	movge	%icc,	%g5,	%o0
	srl	%g7,	%g4,	%g6
	set	0x50, %i0
	stxa	%o6,	[%l7 + %i0] 0x81
	bge,a	loop_1881
	fsrc1s	%f2,	%f16
	movrlez	%o7,	%g1,	%i3
	movle	%icc,	%o1,	%l4
loop_1881:
	nop
	wr	%g0,	0x11,	%asi
	stba	%o4,	[%l7 + 0x35] %asi
	xnorcc	%l6,	%l1,	%i4
	movvc	%xcc,	%i7,	%l5
	tcc	%xcc,	0x7
	movleu	%icc,	%l2,	%i5
	xorcc	%i0,	0x1732,	%i1
	movvc	%xcc,	%i6,	%g2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x81,	%o5
	tleu	%xcc,	0x3
	fbge	%fcc3,	loop_1882
	fbule	%fcc2,	loop_1883
	edge8ln	%o3,	%l0,	%g3
	taddcctv	%o2,	%g5,	%l3
loop_1882:
	andncc	%g7,	%g4,	%o0
loop_1883:
	fpack16	%f28,	%f20
	movgu	%xcc,	%g6,	%o7
	sllx	%o6,	0x0E,	%g1
	move	%icc,	%i3,	%l4
	addc	%o4,	%o1,	%l1
	tneg	%xcc,	0x2
	fmovrslez	%l6,	%f28,	%f0
	fandnot1s	%f20,	%f30,	%f21
	andncc	%i4,	%l5,	%l2
	ta	%xcc,	0x5
	edge8ln	%i5,	%i7,	%i1
	fmovsvc	%xcc,	%f2,	%f8
	mulscc	%i0,	%i6,	%i2
	tcs	%xcc,	0x3
	flush	%l7 + 0x10
	addccc	%o5,	%g2,	%l0
	fmovrsne	%g3,	%f9,	%f21
	sdivx	%o3,	0x15FA,	%g5
	srlx	%o2,	%l3,	%g7
	sdivx	%g4,	0x04E5,	%o0
	fble	%fcc0,	loop_1884
	fsrc2s	%f18,	%f2
	sethi	0x19C6,	%o7
	bshuffle	%f28,	%f2,	%f18
loop_1884:
	fmovrdlz	%g6,	%f2,	%f0
	te	%xcc,	0x3
	bge,pt	%xcc,	loop_1885
	sllx	%g1,	%i3,	%l4
	brz	%o6,	loop_1886
	movrgz	%o4,	0x09B,	%l1
loop_1885:
	tn	%icc,	0x3
	srax	%l6,	0x11,	%i4
loop_1886:
	fcmpeq16	%f24,	%f12,	%o1
	or	%l5,	0x0C0F,	%i5
	addc	%i7,	%i1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l2,	0x0F15,	%i2
	umul	%i6,	0x0FDD,	%o5
	set	0x30, %o5
	ldsha	[%l7 + %o5] 0x80,	%g2
	mulx	%g3,	%o3,	%g5
	edge8l	%l0,	%o2,	%l3
	tgu	%icc,	0x4
	umulcc	%g4,	%g7,	%o0
	xnorcc	%g6,	%o7,	%i3
	movvc	%icc,	%g1,	%o6
	subcc	%o4,	%l1,	%l6
	fone	%f14
	swap	[%l7 + 0x20],	%l4
	sethi	0x1E46,	%o1
	tg	%icc,	0x7
	or	%l5,	0x0851,	%i5
	flush	%l7 + 0x3C
	movleu	%icc,	%i7,	%i1
	set	0x3A, %i4
	lduha	[%l7 + %i4] 0x18,	%i0
	fpadd32	%f24,	%f26,	%f18
	te	%xcc,	0x4
	fpackfix	%f16,	%f12
	edge32n	%l2,	%i2,	%i4
	stb	%o5,	[%l7 + 0x46]
	nop
	setx loop_1887, %l0, %l1
	jmpl %l1, %g2
	udivcc	%i6,	0x15B3,	%o3
	fzeros	%f16
	udiv	%g3,	0x08E8,	%g5
loop_1887:
	tleu	%icc,	0x7
	stbar
	fmovrsgz	%o2,	%f20,	%f17
	edge8ln	%l3,	%g4,	%l0
	fmovsg	%icc,	%f21,	%f6
	mulx	%g7,	%o0,	%o7
	nop
	setx	loop_1888,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz	%g6,	loop_1889
	sdivx	%i3,	0x17AD,	%g1
	ld	[%l7 + 0x5C],	%f8
loop_1888:
	movne	%icc,	%o6,	%o4
loop_1889:
	movrgz	%l6,	0x346,	%l1
	fpackfix	%f16,	%f20
	fmovdvc	%icc,	%f0,	%f10
	fmuld8ulx16	%f9,	%f23,	%f8
	bcs	loop_1890
	subcc	%l4,	0x1432,	%o1
	call	loop_1891
	movg	%icc,	%i5,	%i7
loop_1890:
	tsubcc	%l5,	%i0,	%i1
	movrgez	%l2,	0x2D1,	%i2
loop_1891:
	fmovsne	%icc,	%f19,	%f1
	xnor	%i4,	%o5,	%i6
	tsubcc	%g2,	%o3,	%g5
	fbu	%fcc0,	loop_1892
	movneg	%icc,	%g3,	%o2
	fcmpd	%fcc3,	%f18,	%f10
	mulscc	%l3,	0x0966,	%l0
loop_1892:
	mova	%xcc,	%g7,	%o0
	tsubcctv	%g4,	%g6,	%o7
	taddcc	%g1,	0x05A3,	%i3
	movcs	%icc,	%o6,	%o4
	fble,a	%fcc0,	loop_1893
	fmul8x16au	%f27,	%f20,	%f2
	array8	%l1,	%l4,	%l6
	ldsb	[%l7 + 0x50],	%i5
loop_1893:
	add	%i7,	%o1,	%i0
	movre	%i1,	0x3E3,	%l2
	fandnot1	%f22,	%f28,	%f14
	fcmps	%fcc2,	%f8,	%f14
	fmovdle	%xcc,	%f6,	%f28
	edge16l	%l5,	%i2,	%o5
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	movge	%xcc,	%i6,	%g2
	sir	0x1E25
	xnor	%o3,	0x1228,	%g5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%o2
	fones	%f0
	fnot1	%f16,	%f28
	stbar
	array16	%l3,	%g3,	%l0
	set	0x68, %o6
	stwa	%g7,	[%l7 + %o6] 0x18
	edge16l	%g4,	%g6,	%o7
	udivx	%g1,	0x0733,	%o0
	smulcc	%i3,	%o4,	%l1
	fmovsgu	%xcc,	%f19,	%f14
	lduw	[%l7 + 0x48],	%o6
	bleu,a,pt	%xcc,	loop_1894
	movneg	%xcc,	%l4,	%i5
	bgu	loop_1895
	brlez,a	%i7,	loop_1896
loop_1894:
	fmul8x16	%f12,	%f14,	%f28
	fcmpne32	%f10,	%f6,	%o1
loop_1895:
	bl,pn	%icc,	loop_1897
loop_1896:
	fzero	%f14
	fsrc2s	%f5,	%f2
	lduw	[%l7 + 0x60],	%l6
loop_1897:
	fmovsvs	%xcc,	%f29,	%f19
	edge16	%i1,	%i0,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%xcc,	%f19,	%f20
	set	0x68, %o1
	lduha	[%l7 + %o1] 0x18,	%l2
	srax	%o5,	%i2,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x10,	%i4,	%g2
	addc	%o3,	%g5,	%l3
	tgu	%icc,	0x3
	siam	0x2
	set	0x7D, %l6
	lduba	[%l7 + %l6] 0x89,	%o2
	tvc	%xcc,	0x3
	add	%g3,	%g7,	%g4
	orn	%g6,	0x1B47,	%o7
	sir	0x19FE
	xor	%l0,	%o0,	%i3
	array16	%g1,	%o4,	%l1
	edge32ln	%l4,	%o6,	%i5
	fmovscs	%icc,	%f25,	%f27
	addc	%o1,	0x0A70,	%l6
	udivx	%i7,	0x00F5,	%i1
	movneg	%icc,	%l5,	%l2
	fmovrdlz	%o5,	%f8,	%f0
	bl	%icc,	loop_1898
	srl	%i2,	%i0,	%i6
	edge32l	%g2,	%i4,	%o3
	edge8n	%g5,	%o2,	%l3
loop_1898:
	tvc	%icc,	0x3
	and	%g3,	%g4,	%g7
	fmovdcs	%icc,	%f19,	%f6
	srlx	%o7,	%l0,	%g6
	fmuld8sux16	%f21,	%f9,	%f4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovdn	%icc,	%f17,	%f26
	edge8ln	%i3,	%o0,	%g1
	addc	%l1,	%l4,	%o4
	fmovdn	%icc,	%f11,	%f22
	ldsh	[%l7 + 0x58],	%o6
	udivx	%i5,	0x05D0,	%l6
	movn	%xcc,	%o1,	%i1
	orn	%l5,	%i7,	%l2
	movvs	%icc,	%i2,	%o5
	sir	0x05F9
	sethi	0x15FB,	%i6
	movre	%i0,	0x154,	%g2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i4
	andcc	%g5,	0x01CF,	%o3
	fmovsge	%icc,	%f6,	%f20
	movle	%xcc,	%l3,	%o2
	fbule,a	%fcc0,	loop_1899
	edge32ln	%g3,	%g4,	%o7
	fcmpne16	%f26,	%f28,	%g7
	xorcc	%g6,	0x134F,	%l0
loop_1899:
	addcc	%i3,	0x0866,	%o0
	set	0x44, %g7
	lduha	[%l7 + %g7] 0x19,	%l1
	srax	%g1,	0x1B,	%o4
	orn	%o6,	%i5,	%l4
	fnot1	%f28,	%f4
	fmovdvc	%xcc,	%f19,	%f16
	edge16	%o1,	%l6,	%l5
	andn	%i1,	%l2,	%i2
	movcc	%icc,	%o5,	%i6
	std	%i6,	[%l7 + 0x68]
	fpsub16	%f2,	%f12,	%f4
	tpos	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f4,	%f30,	%i0
	bn,a	loop_1900
	addc	%i4,	0x0B23,	%g5
	tcc	%xcc,	0x0
	fmovd	%f8,	%f30
loop_1900:
	tcc	%icc,	0x7
	std	%f30,	[%l7 + 0x18]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%o3
	srax	%o2,	%g3,	%l3
	fxnors	%f3,	%f8,	%f20
	edge32	%g4,	%o7,	%g7
	movne	%icc,	%l0,	%i3
	fmovdgu	%xcc,	%f19,	%f9
	brlz	%g6,	loop_1901
	fnors	%f30,	%f1,	%f9
	membar	0x0F
	fbule	%fcc2,	loop_1902
loop_1901:
	tgu	%xcc,	0x0
	udivx	%l1,	0x0A6B,	%o0
	and	%g1,	0x1298,	%o4
loop_1902:
	movrgez	%i5,	0x30E,	%o6
	tge	%xcc,	0x4
	bleu	loop_1903
	bgu,a	loop_1904
	andncc	%l4,	%l6,	%l5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%o1
loop_1903:
	xorcc	%i1,	%i2,	%o5
loop_1904:
	subc	%l2,	%i6,	%i7
	addc	%i0,	%i4,	%g2
	movn	%icc,	%o3,	%o2
	umul	%g5,	%l3,	%g3
	fabss	%f31,	%f27
	array8	%g4,	%g7,	%o7
	subccc	%l0,	%g6,	%i3
	tge	%xcc,	0x4
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o0
	srlx	%g1,	0x0D,	%i5
	movneg	%icc,	%o6,	%o4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x7C] %asi,	%l4
	nop
	setx	loop_1905,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbl,a	%fcc1,	loop_1906
	edge32ln	%l6,	%o1,	%i1
	fmovsa	%icc,	%f21,	%f16
loop_1905:
	bne,a	loop_1907
loop_1906:
	srlx	%l5,	0x0E,	%i2
	fone	%f16
	fxors	%f27,	%f15,	%f24
loop_1907:
	fornot2s	%f17,	%f23,	%f25
	srlx	%l2,	%i6,	%i7
	andn	%i0,	%i4,	%g2
	bpos	loop_1908
	srl	%o3,	0x1C,	%o5
	addcc	%g5,	0x13F3,	%l3
	and	%o2,	0x0BDF,	%g3
loop_1908:
	fmovdge	%icc,	%f12,	%f17
	fpsub16s	%f3,	%f15,	%f26
	movrgz	%g7,	0x32C,	%g4
	sdivcc	%o7,	0x024B,	%g6
	fmovrsgez	%i3,	%f22,	%f7
	set	0x6C, %l2
	sta	%f10,	[%l7 + %l2] 0x89
	fmovdpos	%xcc,	%f29,	%f28
	tne	%icc,	0x2
	orncc	%l1,	0x0AA9,	%l0
	fbule,a	%fcc1,	loop_1909
	brnz,a	%o0,	loop_1910
	movl	%xcc,	%i5,	%o6
	bshuffle	%f20,	%f24,	%f6
loop_1909:
	call	loop_1911
loop_1910:
	fnors	%f24,	%f7,	%f19
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g1
loop_1911:
	udiv	%l4,	0x0013,	%o4
	set	0x0E, %g6
	lduha	[%l7 + %g6] 0x89,	%l6
	fbo,a	%fcc3,	loop_1912
	orcc	%o1,	0x095C,	%i1
	fmovdn	%icc,	%f30,	%f2
	orncc	%i2,	%l5,	%i6
loop_1912:
	edge32	%l2,	%i7,	%i0
	bne,a	%xcc,	loop_1913
	fmul8x16	%f5,	%f12,	%f22
	sra	%g2,	0x1D,	%o3
	fbge,a	%fcc2,	loop_1914
loop_1913:
	fmovsne	%xcc,	%f15,	%f4
	lduh	[%l7 + 0x1A],	%i4
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o5
loop_1914:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	tvs	%xcc,	0x5
	xorcc	%o2,	0x1C66,	%g5
	fcmpd	%fcc0,	%f4,	%f4
	fsrc2	%f10,	%f2
	xor	%g7,	0x1C66,	%g3
	orncc	%o7,	%g6,	%g4
	ta	%icc,	0x6
	tle	%icc,	0x0
	mulscc	%l1,	%l0,	%o0
	fxor	%f0,	%f12,	%f22
	fbule	%fcc3,	loop_1915
	lduh	[%l7 + 0x6A],	%i3
	fcmps	%fcc3,	%f24,	%f30
	edge16n	%i5,	%o6,	%g1
loop_1915:
	smul	%o4,	0x1F3B,	%l6
	movl	%xcc,	%o1,	%i1
	st	%f27,	[%l7 + 0x48]
	alignaddrl	%l4,	%i2,	%l5
	fbuge	%fcc1,	loop_1916
	te	%xcc,	0x5
	alignaddrl	%l2,	%i7,	%i6
	movneg	%xcc,	%g2,	%i0
loop_1916:
	for	%f12,	%f6,	%f2
	alignaddrl	%i4,	%o5,	%l3
	stb	%o3,	[%l7 + 0x55]
	tsubcc	%g5,	%g7,	%g3
	ta	%icc,	0x4
	bleu,a	%icc,	loop_1917
	tsubcctv	%o7,	%o2,	%g6
	tpos	%xcc,	0x5
	fxnors	%f9,	%f30,	%f20
loop_1917:
	bneg	%xcc,	loop_1918
	tle	%icc,	0x5
	sdivx	%g4,	0x1DEE,	%l1
	and	%l0,	%i3,	%i5
loop_1918:
	tge	%icc,	0x7
	movre	%o0,	0x365,	%g1
	movrlez	%o4,	0x3ED,	%l6
	srl	%o1,	%o6,	%i1
	umulcc	%i2,	0x0AFA,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_1919
	edge16ln	%l2,	%l4,	%i6
	move	%icc,	%g2,	%i7
	mulx	%i4,	%i0,	%l3
loop_1919:
	edge16	%o3,	%g5,	%o5
	fmovd	%f4,	%f0
	tsubcctv	%g7,	0x0828,	%o7
	alignaddr	%o2,	%g3,	%g6
	nop
	setx	loop_1920,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%l1,	%l0,	%i3
	movre	%i5,	%g4,	%g1
	fmovda	%xcc,	%f21,	%f26
loop_1920:
	fabss	%f19,	%f6
	fandnot1s	%f10,	%f29,	%f29
	and	%o4,	0x19D3,	%l6
	fmovscs	%xcc,	%f24,	%f28
	xor	%o0,	0x0085,	%o1
	fbul,a	%fcc2,	loop_1921
	edge16	%o6,	%i2,	%l5
	lduw	[%l7 + 0x54],	%l2
	ldd	[%l7 + 0x28],	%f20
loop_1921:
	fexpand	%f8,	%f26
	xnorcc	%i1,	0x1A29,	%i6
	edge16n	%l4,	%g2,	%i4
	movgu	%xcc,	%i0,	%l3
	udiv	%o3,	0x1174,	%g5
	fcmps	%fcc3,	%f10,	%f24
	movleu	%xcc,	%o5,	%i7
	edge16	%o7,	%g7,	%o2
	fmovdge	%xcc,	%f20,	%f12
	or	%g3,	0x1149,	%l1
	edge8ln	%g6,	%l0,	%i3
	array16	%g4,	%i5,	%o4
	alignaddrl	%g1,	%l6,	%o0
	siam	0x5
	udiv	%o6,	0x09AD,	%i2
	edge32	%l5,	%o1,	%i1
	set	0x6E, %l3
	lduha	[%l7 + %l3] 0x88,	%i6
	fmovrsgz	%l4,	%f18,	%f28
	smul	%g2,	%l2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l3,	%o3,	%i0
	umul	%g5,	0x1937,	%i7
	pdist	%f8,	%f16,	%f28
	sdiv	%o7,	0x01C4,	%g7
	edge32ln	%o5,	%o2,	%g3
	tn	%xcc,	0x3
	udivcc	%l1,	0x1333,	%l0
	array16	%i3,	%g4,	%i5
	te	%icc,	0x2
	fblg	%fcc3,	loop_1922
	mova	%xcc,	%g6,	%o4
	fbu,a	%fcc1,	loop_1923
	tne	%icc,	0x4
loop_1922:
	orn	%l6,	0x1FB3,	%g1
	fzero	%f18
loop_1923:
	movneg	%xcc,	%o6,	%o0
	ldd	[%l7 + 0x70],	%f8
	brnz	%l5,	loop_1924
	umulcc	%i2,	0x0588,	%i1
	ldub	[%l7 + 0x26],	%i6
	edge32	%l4,	%o1,	%g2
loop_1924:
	movne	%icc,	%l2,	%i4
	orncc	%l3,	0x16FA,	%i0
	fnand	%f10,	%f16,	%f12
	tneg	%xcc,	0x0
	ble	%xcc,	loop_1925
	xor	%o3,	%i7,	%g5
	taddcctv	%g7,	%o5,	%o7
	tcc	%icc,	0x5
loop_1925:
	movn	%icc,	%g3,	%o2
	subccc	%l1,	%l0,	%i3
	xnor	%i5,	%g6,	%g4
	movcc	%icc,	%o4,	%g1
	fnegd	%f2,	%f16
	be,a,pn	%xcc,	loop_1926
	subc	%o6,	0x1C0D,	%o0
	tg	%xcc,	0x3
	movrlz	%l5,	%i2,	%l6
loop_1926:
	fands	%f6,	%f2,	%f6
	fmovdneg	%xcc,	%f22,	%f20
	fornot2s	%f12,	%f13,	%f15
	umulcc	%i6,	%i1,	%o1
	addcc	%l4,	%l2,	%i4
	smul	%g2,	0x01F7,	%i0
	or	%o3,	0x116E,	%l3
	sdiv	%g5,	0x0318,	%i7
	fpadd16s	%f24,	%f8,	%f26
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x68] %asi,	%o5
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x0c,	%f0
	set	0x20, %g1
	ldstuba	[%l7 + %g1] 0x81,	%o7
	tsubcc	%g3,	%g7,	%l1
	wr	%g0,	0xea,	%asi
	stxa	%o2,	[%l7 + 0x40] %asi
	membar	#Sync
	tsubcc	%i3,	0x1DCF,	%i5
	orncc	%g6,	0x0917,	%l0
	fnot1s	%f11,	%f24
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	brlez	%g4,	loop_1927
	taddcc	%o4,	0x177C,	%o6
	fmovsl	%xcc,	%f6,	%f6
	ta	%icc,	0x2
loop_1927:
	fbule,a	%fcc2,	loop_1928
	ble	loop_1929
	subccc	%o0,	%l5,	%g1
	fmovsvc	%icc,	%f20,	%f12
loop_1928:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x58] %asi,	%l6
loop_1929:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x34] %asi,	%i6
	edge8ln	%i1,	%i2,	%l4
	addcc	%l2,	%i4,	%g2
	fmovda	%icc,	%f28,	%f7
	fbug	%fcc2,	loop_1930
	lduw	[%l7 + 0x34],	%i0
	ldd	[%l7 + 0x28],	%o0
	fmovdneg	%xcc,	%f22,	%f16
loop_1930:
	nop
	set	0x36, %l0
	sth	%o3,	[%l7 + %l0]
	umulcc	%l3,	%i7,	%g5
	fmovrsgez	%o7,	%f10,	%f6
	set	0x22, %g3
	lduha	[%l7 + %g3] 0x0c,	%o5
	movl	%xcc,	%g3,	%g7
	ta	%xcc,	0x7
	ldsh	[%l7 + 0x5C],	%o2
	xnorcc	%i3,	0x0BC0,	%i5
	srax	%g6,	%l0,	%l1
	fpsub32s	%f19,	%f21,	%f1
	nop
	setx loop_1931, %l0, %l1
	jmpl %l1, %g4
	movgu	%xcc,	%o6,	%o0
	mulx	%l5,	0x1EA6,	%g1
	membar	0x35
loop_1931:
	subccc	%l6,	%i6,	%o4
	tgu	%icc,	0x1
	smul	%i2,	0x02E9,	%i1
	lduw	[%l7 + 0x50],	%l2
	orcc	%i4,	0x0E93,	%g2
	edge32	%i0,	%l4,	%o1
	xnorcc	%o3,	%l3,	%i7
	set	0x08, %l4
	lda	[%l7 + %l4] 0x11,	%f2
	movrgez	%o7,	0x3E2,	%o5
	subcc	%g5,	%g3,	%o2
	edge16ln	%i3,	%g7,	%g6
	fble	%fcc2,	loop_1932
	bvs,a	%xcc,	loop_1933
	tsubcctv	%i5,	%l0,	%g4
	sdivcc	%l1,	0x1421,	%o0
loop_1932:
	edge8n	%l5,	%o6,	%g1
loop_1933:
	edge8n	%i6,	%o4,	%l6
	edge8ln	%i2,	%i1,	%l2
	sllx	%i4,	%g2,	%l4
	fmovsle	%xcc,	%f11,	%f19
	addccc	%i0,	0x0EE6,	%o1
	add	%l3,	%i7,	%o3
	fmovrdgez	%o5,	%f24,	%f2
	fmovsneg	%xcc,	%f4,	%f29
	fmovsle	%xcc,	%f30,	%f9
	ldsb	[%l7 + 0x5F],	%o7
	edge16	%g5,	%g3,	%i3
	ldsb	[%l7 + 0x68],	%g7
	orn	%g6,	0x1EEB,	%o2
	addccc	%l0,	%i5,	%l1
	movrgz	%g4,	0x0FB,	%o0
	sllx	%o6,	0x00,	%l5
	tge	%xcc,	0x7
	set	0x30, %o2
	stba	%i6,	[%l7 + %o2] 0x27
	membar	#Sync
	subccc	%o4,	0x1505,	%g1
	stw	%i2,	[%l7 + 0x68]
	andncc	%l6,	%i1,	%i4
	fnot2	%f22,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x0
	mulx	%g2,	0x1CE6,	%l4
	movvc	%icc,	%i0,	%l2
	tcs	%xcc,	0x3
	ta	%icc,	0x5
	set	0x50, %i7
	stda	%l2,	[%l7 + %i7] 0x19
	fpsub32s	%f14,	%f10,	%f6
	sdivx	%i7,	0x12E2,	%o1
	fbu	%fcc1,	loop_1934
	and	%o3,	0x1BC1,	%o7
	bneg,a,pn	%icc,	loop_1935
	movrlez	%g5,	%o5,	%i3
loop_1934:
	fcmpne32	%f26,	%f22,	%g3
	subcc	%g7,	%g6,	%o2
loop_1935:
	std	%i4,	[%l7 + 0x68]
	bvs	loop_1936
	fmovscs	%icc,	%f13,	%f5
	sdivcc	%l0,	0x0D1C,	%g4
	edge16	%o0,	%l1,	%o6
loop_1936:
	edge8	%l5,	%i6,	%g1
	movvs	%icc,	%o4,	%i2
	lduw	[%l7 + 0x68],	%l6
	set	0x1C, %o0
	stha	%i1,	[%l7 + %o0] 0xe2
	membar	#Sync
	sdivx	%g2,	0x0685,	%i4
	sllx	%i0,	0x1C,	%l2
	stbar
	addc	%l3,	0x1BA6,	%i7
	orn	%o1,	%o3,	%l4
	movrne	%o7,	0x0A1,	%o5
	edge32ln	%g5,	%i3,	%g3
	array8	%g7,	%g6,	%i5
	movre	%o2,	0x006,	%l0
	fmovrdlez	%o0,	%f6,	%f0
	subccc	%g4,	%l1,	%o6
	fmovdl	%icc,	%f13,	%f8
	ldsb	[%l7 + 0x61],	%l5
	sub	%i6,	0x0798,	%g1
	edge8l	%i2,	%l6,	%o4
	movre	%i1,	%g2,	%i0
	be,a,pn	%icc,	loop_1937
	fble,a	%fcc0,	loop_1938
	movrne	%i4,	%l2,	%l3
	srlx	%o1,	%i7,	%o3
loop_1937:
	prefetch	[%l7 + 0x38],	 0x1
loop_1938:
	nop
	set	0x70, %o7
	stwa	%l4,	[%l7 + %o7] 0x2a
	membar	#Sync
	sub	%o5,	0x1D6D,	%o7
	edge32ln	%i3,	%g5,	%g7
	tsubcctv	%g6,	%g3,	%o2
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x78] %asi
	fmovrslz	%i5,	%f0,	%f6
	fnot2s	%f16,	%f29
	tneg	%xcc,	0x0
	fmovsg	%xcc,	%f4,	%f11
	tpos	%icc,	0x3
	fzeros	%f3
	stw	%o0,	[%l7 + 0x5C]
	tn	%icc,	0x5
	fmovdle	%icc,	%f31,	%f20
	udiv	%l0,	0x0562,	%g4
	fbn	%fcc2,	loop_1939
	srl	%o6,	0x1C,	%l5
	fmovdge	%xcc,	%f10,	%f5
	st	%f11,	[%l7 + 0x3C]
loop_1939:
	fcmped	%fcc3,	%f22,	%f8
	edge32	%i6,	%l1,	%g1
	movvc	%icc,	%l6,	%o4
	array32	%i1,	%i2,	%g2
	taddcc	%i0,	0x0604,	%l2
	fone	%f2
	fbne,a	%fcc3,	loop_1940
	te	%xcc,	0x4
	fmovrdgz	%l3,	%f28,	%f20
	edge8l	%o1,	%i4,	%i7
loop_1940:
	ld	[%l7 + 0x40],	%f22
	bn,a,pt	%xcc,	loop_1941
	fsrc1	%f20,	%f26
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf1
	membar	#Sync
loop_1941:
	edge32ln	%l4,	%o3,	%o5
	sub	%i3,	0x0D66,	%g5
	fpsub16s	%f0,	%f7,	%f4
	fpmerge	%f24,	%f12,	%f22
	movle	%xcc,	%o7,	%g7
	tn	%xcc,	0x7
	fsrc1	%f0,	%f6
	edge8	%g3,	%o2,	%i5
	subccc	%g6,	%l0,	%o0
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x5C] %asi,	%f16
	fornot1s	%f2,	%f30,	%f6
	fxors	%f3,	%f26,	%f27
	orncc	%o6,	%g4,	%i6
	lduh	[%l7 + 0x38],	%l1
	movvc	%xcc,	%g1,	%l6
	fcmpeq16	%f8,	%f24,	%o4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i1
	movgu	%xcc,	%i2,	%l5
	edge32ln	%g2,	%i0,	%l2
	sdiv	%l3,	0x0313,	%o1
	fmovdn	%icc,	%f3,	%f24
	tle	%xcc,	0x7
	and	%i4,	0x06FB,	%l4
	tcc	%xcc,	0x6
	bn,a	%icc,	loop_1942
	fpadd32	%f0,	%f2,	%f26
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x80,	%i7
loop_1942:
	udivx	%o5,	0x00AF,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%g5
	movrgez	%g7,	%g3,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%g6
	std	%f12,	[%l7 + 0x78]
	sdivcc	%i5,	0x04B5,	%o0
	xnor	%o6,	0x0A38,	%l0
	edge32ln	%g4,	%i6,	%l1
	tsubcctv	%l6,	%o4,	%i1
	sdivx	%i2,	0x126E,	%l5
	andncc	%g2,	%i0,	%g1
	fmovsl	%xcc,	%f7,	%f30
	edge16l	%l3,	%l2,	%o1
	te	%icc,	0x1
	flush	%l7 + 0x24
	xorcc	%i4,	%i7,	%o5
	membar	0x64
	fabsd	%f8,	%f28
	tg	%xcc,	0x3
	srlx	%l4,	0x17,	%o3
	fmovdleu	%xcc,	%f22,	%f14
	edge16ln	%g5,	%i3,	%g3
	edge32l	%g7,	%o2,	%o7
	mulx	%i5,	%o0,	%o6
	edge32ln	%g6,	%g4,	%l0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f0
	movge	%icc,	%l1,	%i6
	orn	%l6,	%o4,	%i1
	addccc	%i2,	0x0C44,	%g2
	tgu	%icc,	0x5
	fmovse	%icc,	%f2,	%f17
	bvc,a,pn	%xcc,	loop_1943
	movne	%icc,	%l5,	%g1
	subccc	%i0,	%l3,	%o1
	ble,pt	%icc,	loop_1944
loop_1943:
	movvs	%icc,	%i4,	%l2
	edge8l	%i7,	%o5,	%l4
	alignaddrl	%g5,	%i3,	%o3
loop_1944:
	taddcc	%g3,	0x198B,	%g7
	tl	%icc,	0x3
	fxnors	%f12,	%f19,	%f7
	fxor	%f12,	%f20,	%f30
	addcc	%o2,	0x077E,	%i5
	fbn,a	%fcc0,	loop_1945
	nop
	setx	loop_1946,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%o0,	0x0801,	%o6
	tgu	%icc,	0x5
loop_1945:
	movrlz	%g6,	%o7,	%g4
loop_1946:
	movge	%xcc,	%l0,	%i6
	tn	%xcc,	0x0
	xnorcc	%l1,	%l6,	%i1
	and	%o4,	%i2,	%l5
	addcc	%g2,	0x1B3D,	%g1
	fxors	%f24,	%f10,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%o1
	move	%xcc,	%i0,	%l2
	tle	%xcc,	0x0
	sir	0x0925
	taddcc	%i7,	%o5,	%i4
	ta	%icc,	0x6
	orcc	%g5,	%l4,	%i3
	movrlz	%g3,	%g7,	%o2
	subcc	%i5,	%o0,	%o3
	movrgz	%g6,	%o7,	%o6
	edge16ln	%l0,	%g4,	%l1
	fornot2	%f22,	%f8,	%f14
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x31] %asi,	%l6
	tle	%icc,	0x3
	sllx	%i6,	0x06,	%i1
	fpadd32	%f14,	%f28,	%f22
	sdivx	%o4,	0x1A5C,	%l5
	fmovdcs	%icc,	%f4,	%f15
	array32	%g2,	%g1,	%l3
	movne	%xcc,	%i2,	%o1
	sra	%i0,	0x17,	%i7
	edge16l	%l2,	%o5,	%g5
	or	%l4,	%i4,	%i3
	fmovdne	%icc,	%f29,	%f0
	fcmple32	%f22,	%f12,	%g3
	fcmpeq16	%f6,	%f8,	%g7
	addc	%i5,	%o2,	%o3
	sdivx	%o0,	0x1046,	%g6
	tg	%icc,	0x4
	taddcc	%o7,	0x1F8D,	%o6
	brz	%l0,	loop_1947
	sethi	0x0B78,	%g4
	taddcctv	%l1,	0x0291,	%i6
	fbue	%fcc0,	loop_1948
loop_1947:
	fzero	%f8
	tsubcctv	%i1,	%o4,	%l5
	fmovsgu	%xcc,	%f7,	%f20
loop_1948:
	movvc	%xcc,	%g2,	%g1
	tne	%xcc,	0x1
	orn	%l6,	0x0A33,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o1,	0x1C6A,	%i0
	srlx	%i7,	%l3,	%o5
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%g4
	edge32l	%l2,	%i4,	%l4
	fmovrdlez	%g3,	%f4,	%f10
	tge	%xcc,	0x1
	fbn,a	%fcc0,	loop_1949
	bgu,a	loop_1950
	fnands	%f16,	%f28,	%f15
	fpmerge	%f19,	%f29,	%f14
loop_1949:
	fornot1s	%f27,	%f17,	%f25
loop_1950:
	alignaddr	%g7,	%i5,	%i3
	sub	%o2,	0x1325,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g6,	%o7,	%o3
	ldsh	[%l7 + 0x32],	%l0
	fornot2	%f10,	%f0,	%f24
	edge8	%o6,	%g4,	%i6
	movle	%xcc,	%l1,	%i1
	wr	%g0,	0x22,	%asi
	stxa	%o4,	[%l7 + 0x10] %asi
	membar	#Sync
	movre	%l5,	%g2,	%l6
	tvc	%icc,	0x7
	movl	%xcc,	%i2,	%o1
	movrlz	%g1,	%i0,	%i7
	movleu	%xcc,	%l3,	%g5
	set	0x75, %i5
	lduba	[%l7 + %i5] 0x04,	%o5
	edge32	%i4,	%l2,	%l4
	tcs	%xcc,	0x6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g7
	fmovrdgz	%g3,	%f30,	%f8
	tcc	%icc,	0x1
	fmovdle	%icc,	%f28,	%f25
	movre	%i3,	%o2,	%o0
	sdivcc	%g6,	0x04D4,	%o7
	subc	%i5,	0x0F19,	%l0
	tne	%xcc,	0x4
	bpos,a,pn	%icc,	loop_1951
	fmovdge	%icc,	%f13,	%f19
	te	%icc,	0x0
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x0c
loop_1951:
	nop
	set	0x78, %o4
	lduba	[%l7 + %o4] 0x15,	%o6
	fxor	%f8,	%f8,	%f14
	fabss	%f6,	%f6
	taddcctv	%g4,	0x1CEF,	%o3
	subccc	%l1,	%i6,	%o4
	fands	%f26,	%f11,	%f21
	movvs	%xcc,	%i1,	%l5
	bvs,a,pn	%xcc,	loop_1952
	smulcc	%l6,	0x1E20,	%i2
	andncc	%g2,	%g1,	%o1
	set	0x58, %i2
	swapa	[%l7 + %i2] 0x88,	%i0
loop_1952:
	sethi	0x1275,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l3,	0x0829,	%o5
	sethi	0x1C97,	%g5
	fornot1s	%f13,	%f3,	%f18
	edge32	%l2,	%i4,	%g7
	ldstub	[%l7 + 0x08],	%g3
	movn	%xcc,	%i3,	%o2
	fmovsg	%xcc,	%f0,	%f6
	movn	%xcc,	%o0,	%g6
	movrlez	%l4,	%i5,	%l0
	ldsw	[%l7 + 0x78],	%o7
	fnot1	%f22,	%f26
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x1B] %asi,	%o6
	fmovsge	%icc,	%f28,	%f26
	sdivx	%g4,	0x02A2,	%l1
	srax	%o3,	%o4,	%i6
	mulx	%l5,	%i1,	%l6
	subc	%i2,	%g2,	%g1
	nop
	set	0x78, %i1
	prefetch	[%l7 + %i1],	 0x3
	edge32	%i0,	%o1,	%i7
	tsubcctv	%l3,	%o5,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f29,	%f31
	movleu	%xcc,	%l2,	%g7
	fba,a	%fcc0,	loop_1953
	movn	%xcc,	%i4,	%g3
	and	%i3,	%o2,	%o0
	andcc	%g6,	0x1FC8,	%i5
loop_1953:
	edge16	%l0,	%l4,	%o6
	movvs	%xcc,	%g4,	%l1
	fbug,a	%fcc1,	loop_1954
	add	%o3,	%o7,	%i6
	movrgez	%o4,	0x0BE,	%l5
	udiv	%i1,	0x069F,	%l6
loop_1954:
	ldub	[%l7 + 0x7C],	%i2
	set	0x74, %i0
	sta	%f4,	[%l7 + %i0] 0x89
	pdist	%f30,	%f14,	%f10
	te	%xcc,	0x0
	fnot2	%f4,	%f10
	or	%g1,	%g2,	%i0
	edge32n	%i7,	%o1,	%o5
	edge16l	%g5,	%l3,	%l2
	edge8l	%i4,	%g7,	%g3
	sdiv	%i3,	0x1B7D,	%o2
	fmovsa	%xcc,	%f11,	%f5
	srax	%g6,	%i5,	%l0
	set	0x6E, %i3
	ldsba	[%l7 + %i3] 0x80,	%o0
	fmovsg	%xcc,	%f26,	%f9
	movrgz	%o6,	0x11D,	%g4
	movrne	%l1,	0x2EB,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc3,	loop_1955
	sra	%o3,	0x16,	%o7
	movne	%icc,	%i6,	%l5
	orn	%i1,	%o4,	%l6
loop_1955:
	movl	%icc,	%g1,	%i2
	stw	%g2,	[%l7 + 0x30]
	andncc	%i0,	%o1,	%i7
	bg,pt	%icc,	loop_1956
	edge32ln	%o5,	%l3,	%g5
	movgu	%icc,	%i4,	%g7
	fmovscc	%xcc,	%f2,	%f14
loop_1956:
	fmovrsne	%g3,	%f10,	%f12
	ldsb	[%l7 + 0x6E],	%l2
	fmovsleu	%icc,	%f19,	%f4
	fmovsne	%xcc,	%f14,	%f25
	andcc	%i3,	%g6,	%i5
	tle	%xcc,	0x4
	fandnot2	%f26,	%f6,	%f2
	fmovd	%f28,	%f6
	faligndata	%f18,	%f30,	%f16
	mulx	%l0,	0x1E23,	%o2
	fmovdpos	%xcc,	%f29,	%f4
	alignaddr	%o0,	%g4,	%l1
	movre	%o6,	%o3,	%o7
	fandnot1s	%f14,	%f7,	%f24
	edge8ln	%l4,	%l5,	%i1
	orn	%o4,	0x0C4F,	%l6
	fsrc1	%f6,	%f12
	fmuld8ulx16	%f22,	%f6,	%f18
	movrne	%g1,	0x1EA,	%i2
	xorcc	%i6,	0x1A9F,	%i0
	umul	%g2,	%i7,	%o1
	sra	%o5,	0x11,	%g5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x2C] %asi,	%i4
	fmovsgu	%icc,	%f5,	%f22
	fba,a	%fcc2,	loop_1957
	fornot2	%f4,	%f10,	%f22
	tgu	%icc,	0x5
	sub	%g7,	0x1C4D,	%g3
loop_1957:
	alignaddrl	%l2,	%l3,	%i3
	add	%i5,	0x08DB,	%l0
	xor	%g6,	0x14A9,	%o0
	std	%o2,	[%l7 + 0x08]
	ldub	[%l7 + 0x4C],	%g4
	taddcc	%o6,	0x1C57,	%o3
	tn	%xcc,	0x4
	fmovsne	%xcc,	%f22,	%f23
	fzero	%f20
	fcmple32	%f14,	%f20,	%o7
	xor	%l1,	%l5,	%l4
	fmovdgu	%icc,	%f7,	%f30
	udivx	%o4,	0x1D97,	%l6
	fbge	%fcc2,	loop_1958
	orncc	%g1,	%i1,	%i2
	udiv	%i0,	0x0711,	%i6
	sdivcc	%i7,	0x01AF,	%g2
loop_1958:
	edge32n	%o1,	%o5,	%g5
	tn	%icc,	0x1
	orcc	%g7,	0x0D00,	%i4
	fmovrdgz	%l2,	%f20,	%f18
	set	0x50, %o5
	ldsha	[%l7 + %o5] 0x80,	%l3
	addc	%i3,	%i5,	%l0
	lduh	[%l7 + 0x50],	%g6
	sra	%o0,	%o2,	%g3
	tneg	%xcc,	0x5
	ldsw	[%l7 + 0x50],	%g4
	orn	%o3,	%o7,	%l1
	fpsub32	%f28,	%f16,	%f6
	udivcc	%o6,	0x1168,	%l4
	movrlez	%l5,	%l6,	%o4
	and	%g1,	%i2,	%i1
	tle	%icc,	0x0
	fpsub16s	%f12,	%f5,	%f6
	movleu	%xcc,	%i0,	%i7
	ldsb	[%l7 + 0x2B],	%g2
	tcc	%icc,	0x2
	edge32n	%i6,	%o5,	%o1
	for	%f20,	%f14,	%f22
	movre	%g7,	0x025,	%g5
	set	0x39, %i4
	stba	%l2,	[%l7 + %i4] 0x88
	fandnot1s	%f4,	%f11,	%f9
	fands	%f25,	%f0,	%f10
	array8	%l3,	%i4,	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%g6
	srl	%o0,	%o2,	%g3
	movrlz	%i3,	0x0D8,	%o3
	orn	%o7,	0x1B70,	%l1
	tg	%icc,	0x6
	andcc	%o6,	0x183D,	%g4
	udiv	%l4,	0x0694,	%l6
	movrlz	%l5,	0x104,	%g1
	movg	%xcc,	%i2,	%i1
	edge16n	%i0,	%o4,	%i7
	andcc	%g2,	%o5,	%i6
	te	%icc,	0x3
	nop
	setx loop_1959, %l0, %l1
	jmpl %l1, %o1
	edge16	%g7,	%l2,	%l3
	movrlz	%i4,	%g5,	%i5
	fmovscs	%icc,	%f22,	%f1
loop_1959:
	fmovd	%f20,	%f14
	andcc	%g6,	%l0,	%o0
	fpadd16	%f22,	%f10,	%f18
	movl	%icc,	%o2,	%i3
	movrlez	%o3,	%g3,	%l1
	bne,pt	%icc,	loop_1960
	sdiv	%o6,	0x0EBB,	%g4
	move	%xcc,	%o7,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l4
loop_1960:
	movneg	%icc,	%g1,	%l5
	set	0x67, %o3
	lduba	[%l7 + %o3] 0x10,	%i1
	movl	%icc,	%i0,	%o4
	fbg,a	%fcc1,	loop_1961
	movn	%icc,	%i2,	%i7
	tsubcctv	%g2,	%i6,	%o5
	sth	%g7,	[%l7 + 0x68]
loop_1961:
	movrne	%o1,	0x1F4,	%l2
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x5C] %asi,	%l3
	fmovsneg	%icc,	%f27,	%f29
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fxors	%f29,	%f19,	%f20
	bne,pt	%xcc,	loop_1962
	movrlez	%g5,	%i4,	%g6
	fcmpeq32	%f16,	%f4,	%i5
	umul	%o0,	%l0,	%o2
loop_1962:
	movleu	%icc,	%o3,	%g3
	movcs	%icc,	%i3,	%l1
	alignaddrl	%g4,	%o7,	%l6
	orn	%o6,	0x19B2,	%l4
	movg	%icc,	%g1,	%i1
	xnorcc	%i0,	%o4,	%i2
	tpos	%icc,	0x5
	alignaddr	%l5,	%i7,	%g2
	be,a,pn	%icc,	loop_1963
	addcc	%i6,	%g7,	%o5
	fmul8sux16	%f16,	%f16,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1963:
	fmovrsgz	%o1,	%f9,	%f26
	tgu	%icc,	0x0
	fbe,a	%fcc0,	loop_1964
	movl	%icc,	%l2,	%l3
	fbue	%fcc1,	loop_1965
	call	loop_1966
loop_1964:
	fbue,a	%fcc3,	loop_1967
	edge8n	%g5,	%i4,	%g6
loop_1965:
	be,a	loop_1968
loop_1966:
	edge16n	%o0,	%i5,	%o2
loop_1967:
	fornot1s	%f13,	%f2,	%f5
	umul	%o3,	%l0,	%i3
loop_1968:
	sethi	0x0496,	%l1
	srlx	%g3,	%g4,	%o7
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bleu,a,pt	%xcc,	loop_1969
	fzero	%f22
	lduh	[%l7 + 0x64],	%l6
	edge16n	%o6,	%l4,	%g1
loop_1969:
	nop
	set	0x3C, %o1
	sta	%f28,	[%l7 + %o1] 0x18
	wr	%g0,	0xe3,	%asi
	stwa	%i0,	[%l7 + 0x60] %asi
	membar	#Sync
	ldsh	[%l7 + 0x72],	%i1
	subcc	%o4,	0x1873,	%l5
	orn	%i2,	0x110C,	%i7
	fmovsneg	%icc,	%f21,	%f24
	movneg	%xcc,	%g2,	%i6
	fbule,a	%fcc2,	loop_1970
	edge8	%g7,	%o5,	%l2
	and	%l3,	%o1,	%i4
	ldsb	[%l7 + 0x4B],	%g5
loop_1970:
	std	%o0,	[%l7 + 0x70]
	tneg	%icc,	0x3
	udiv	%g6,	0x0376,	%o2
	sdiv	%i5,	0x142C,	%o3
	subccc	%l0,	%l1,	%g3
	fxnor	%f22,	%f22,	%f20
	subc	%g4,	%o7,	%i3
	edge32l	%o6,	%l4,	%g1
	movneg	%icc,	%i0,	%l6
	tvs	%icc,	0x0
	swap	[%l7 + 0x68],	%i1
	ldsw	[%l7 + 0x68],	%o4
	edge16ln	%l5,	%i7,	%i2
	add	%i6,	%g7,	%o5
	alignaddrl	%l2,	%g2,	%l3
	ld	[%l7 + 0x3C],	%f20
	fxor	%f18,	%f8,	%f14
	xnor	%o1,	%g5,	%i4
	andn	%g6,	%o2,	%o0
	nop
	setx	loop_1971,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%i5,	0x0662,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x2C] %asi,	%f31
loop_1971:
	fzero	%f6
	movre	%l0,	%g3,	%l1
	tneg	%icc,	0x3
	edge8	%o7,	%i3,	%o6
	udivcc	%l4,	0x1F0A,	%g4
	move	%icc,	%g1,	%i0
	tcc	%icc,	0x6
	fbg	%fcc0,	loop_1972
	srlx	%i1,	0x0B,	%l6
	bcs,a,pt	%icc,	loop_1973
	taddcc	%l5,	0x0937,	%i7
loop_1972:
	movcs	%xcc,	%o4,	%i2
	movre	%i6,	%o5,	%l2
loop_1973:
	tne	%icc,	0x3
	srlx	%g7,	%g2,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g5,	%i4,	%g6
	xnorcc	%o1,	0x1BDB,	%o0
	movn	%icc,	%i5,	%o2
	te	%xcc,	0x7
	fnors	%f2,	%f30,	%f0
	ba,pt	%icc,	loop_1974
	umulcc	%l0,	%o3,	%g3
	movvc	%icc,	%o7,	%i3
	fmovdg	%icc,	%f26,	%f19
loop_1974:
	sth	%l1,	[%l7 + 0x42]
	ble,pt	%xcc,	loop_1975
	fornot2	%f12,	%f14,	%f6
	te	%icc,	0x2
	movl	%icc,	%l4,	%g4
loop_1975:
	fmovdn	%xcc,	%f3,	%f30
	set	0x14, %l6
	lduwa	[%l7 + %l6] 0x18,	%g1
	sra	%o6,	%i0,	%i1
	sra	%l6,	%l5,	%o4
	sra	%i7,	0x03,	%i2
	fmovs	%f26,	%f28
	udivcc	%o5,	0x1C5D,	%l2
	edge16n	%g7,	%i6,	%g2
	fmovdn	%xcc,	%f12,	%f5
	fnot1	%f10,	%f26
	array8	%l3,	%g5,	%g6
	umulcc	%i4,	%o0,	%i5
	movpos	%icc,	%o1,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l0,	0x12A3,	%o3
	fmovscc	%xcc,	%f29,	%f28
	fmovrsne	%o7,	%f15,	%f29
	wr	%g0,	0xe2,	%asi
	stxa	%g3,	[%l7 + 0x68] %asi
	membar	#Sync
	fmovdne	%icc,	%f24,	%f6
	fmovsleu	%xcc,	%f13,	%f1
	movrlez	%l1,	%i3,	%l4
	popc	0x0422,	%g1
	fmovsneg	%xcc,	%f31,	%f13
	set	0x46, %g7
	lduha	[%l7 + %g7] 0x19,	%o6
	fmuld8sux16	%f21,	%f28,	%f30
	brnz,a	%i0,	loop_1976
	fnot2s	%f27,	%f30
	nop
	setx	loop_1977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos,pt	%icc,	loop_1978
loop_1976:
	fornot2s	%f3,	%f18,	%f13
	fba	%fcc3,	loop_1979
loop_1977:
	membar	0x7F
loop_1978:
	tn	%icc,	0x4
	edge16ln	%i1,	%g4,	%l6
loop_1979:
	or	%o4,	%i7,	%i2
	fmul8x16al	%f18,	%f12,	%f8
	bg,pt	%icc,	loop_1980
	movvc	%xcc,	%o5,	%l5
	set	0x4A, %o6
	lduba	[%l7 + %o6] 0x19,	%g7
loop_1980:
	srax	%l2,	%g2,	%i6
	orcc	%g5,	%g6,	%l3
	taddcctv	%o0,	0x1A02,	%i5
	mulscc	%i4,	0x0027,	%o1
	xnor	%l0,	%o2,	%o3
	bgu,pn	%xcc,	loop_1981
	andn	%g3,	0x06A6,	%l1
	array16	%i3,	%l4,	%g1
	set	0x34, %l2
	stwa	%o6,	[%l7 + %l2] 0x18
loop_1981:
	movvs	%icc,	%o7,	%i1
	tvc	%icc,	0x5
	movcc	%icc,	%i0,	%g4
	set	0x30, %g6
	stwa	%o4,	[%l7 + %g6] 0x14
	udiv	%l6,	0x15D5,	%i7
	fnegd	%f6,	%f24
	sir	0x1FC6
	subc	%o5,	%i2,	%g7
	fpsub16	%f6,	%f2,	%f0
	fmovdcc	%xcc,	%f3,	%f25
	membar	0x73
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x44] %asi,	%l2
	orcc	%l5,	0x02D5,	%i6
	set	0x57, %g4
	ldsba	[%l7 + %g4] 0x89,	%g2
	sdiv	%g5,	0x1F9C,	%l3
	fcmpes	%fcc2,	%f19,	%f17
	sra	%g6,	0x16,	%o0
	fpack32	%f10,	%f2,	%f4
	sdivx	%i4,	0x1A55,	%i5
	addcc	%l0,	0x06D1,	%o2
	movne	%icc,	%o1,	%o3
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x16,	%f0
	fmovdl	%xcc,	%f28,	%f8
	fornot2	%f6,	%f16,	%f2
	std	%f4,	[%l7 + 0x58]
	nop
	set	0x64, %l0
	stb	%g3,	[%l7 + %l0]
	movpos	%icc,	%i3,	%l4
	movre	%l1,	%g1,	%o6
	edge32n	%i1,	%o7,	%i0
	movrlez	%g4,	0x209,	%o4
	swap	[%l7 + 0x34],	%l6
	fmovrdgez	%i7,	%f12,	%f2
	tvc	%icc,	0x7
	fmovscs	%icc,	%f2,	%f5
	fbn,a	%fcc1,	loop_1982
	movrgez	%o5,	0x0DD,	%g7
	flush	%l7 + 0x64
	movrlz	%l2,	%i2,	%l5
loop_1982:
	umul	%i6,	0x12D9,	%g5
	bne,a,pn	%icc,	loop_1983
	movcs	%icc,	%l3,	%g2
	stw	%g6,	[%l7 + 0x14]
	movle	%icc,	%i4,	%o0
loop_1983:
	tcs	%icc,	0x6
	fnands	%f18,	%f9,	%f7
	fbo,a	%fcc1,	loop_1984
	movpos	%xcc,	%i5,	%o2
	ta	%icc,	0x2
	movn	%icc,	%o1,	%l0
loop_1984:
	nop
	set	0x4C, %g3
	lda	[%l7 + %g3] 0x11,	%f5
	orncc	%g3,	0x109A,	%o3
	lduw	[%l7 + 0x2C],	%l4
	fmovrsne	%i3,	%f12,	%f13
	edge32ln	%g1,	%o6,	%l1
	popc	%i1,	%i0
	fmovrse	%o7,	%f17,	%f22
	tne	%icc,	0x7
	mova	%xcc,	%g4,	%l6
	movvs	%xcc,	%i7,	%o5
	fandnot2s	%f24,	%f30,	%f5
	tleu	%xcc,	0x1
	fsrc1s	%f15,	%f11
	bgu,pn	%xcc,	loop_1985
	taddcc	%g7,	0x0E4A,	%l2
	alignaddrl	%i2,	%o4,	%i6
	for	%f0,	%f22,	%f22
loop_1985:
	fmovrsgz	%g5,	%f5,	%f11
	andn	%l3,	%l5,	%g2
	ldd	[%l7 + 0x40],	%f4
	orcc	%i4,	0x0B8A,	%g6
	brnz	%o0,	loop_1986
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o2,	[%l7 + 0x68]
	addccc	%i5,	0x17A9,	%o1
loop_1986:
	srax	%g3,	%l0,	%o3
	stb	%l4,	[%l7 + 0x5C]
	ble,a,pn	%xcc,	loop_1987
	movgu	%xcc,	%g1,	%o6
	popc	%l1,	%i3
	te	%xcc,	0x2
loop_1987:
	movcs	%xcc,	%i0,	%o7
	fmovdne	%xcc,	%f28,	%f5
	fnegd	%f24,	%f2
	fbule,a	%fcc3,	loop_1988
	lduw	[%l7 + 0x20],	%i1
	alignaddr	%l6,	%i7,	%g4
	edge32l	%o5,	%l2,	%g7
loop_1988:
	bcs	loop_1989
	fxors	%f7,	%f19,	%f22
	tsubcctv	%o4,	%i6,	%g5
	tge	%xcc,	0x2
loop_1989:
	bshuffle	%f10,	%f26,	%f2
	call	loop_1990
	addc	%i2,	0x1B49,	%l3
	nop
	setx	loop_1991,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%g2,	0x003D,	%i4
loop_1990:
	fmovscs	%xcc,	%f23,	%f29
	andn	%g6,	0x1845,	%l5
loop_1991:
	srax	%o2,	%o0,	%i5
	subcc	%g3,	%o1,	%o3
	set	0x4E, %g1
	stha	%l0,	[%l7 + %g1] 0x22
	membar	#Sync
	orcc	%l4,	0x1E27,	%g1
	fones	%f10
	edge16l	%o6,	%i3,	%l1
	sllx	%i0,	0x0F,	%o7
	edge8	%l6,	%i7,	%g4
	movpos	%xcc,	%o5,	%i1
	movrgez	%g7,	%o4,	%i6
	set	0x1C, %o2
	stwa	%l2,	[%l7 + %o2] 0x80
	movpos	%icc,	%g5,	%l3
	movvs	%icc,	%g2,	%i4
	edge16	%i2,	%g6,	%l5
	movvs	%xcc,	%o2,	%o0
	bcs,pt	%xcc,	loop_1992
	tne	%icc,	0x1
	tle	%icc,	0x7
	brgez	%i5,	loop_1993
loop_1992:
	umul	%o1,	%g3,	%l0
	call	loop_1994
	fpadd16s	%f7,	%f3,	%f21
loop_1993:
	sth	%l4,	[%l7 + 0x68]
	movrgz	%g1,	%o3,	%i3
loop_1994:
	taddcc	%l1,	%o6,	%o7
	movre	%l6,	%i7,	%i0
	edge16ln	%g4,	%o5,	%g7
	fsrc2	%f28,	%f20
	fmovdne	%icc,	%f29,	%f30
	udivcc	%o4,	0x02D5,	%i6
	tne	%xcc,	0x6
	tle	%xcc,	0x7
	movg	%icc,	%l2,	%g5
	tgu	%icc,	0x4
	sllx	%l3,	%g2,	%i1
	popc	%i4,	%i2
	bge,a	%xcc,	loop_1995
	srax	%l5,	0x09,	%g6
	xnor	%o2,	%o0,	%o1
	fmovsge	%icc,	%f26,	%f25
loop_1995:
	fmovdn	%icc,	%f9,	%f17
	movcs	%xcc,	%g3,	%i5
	fnor	%f6,	%f24,	%f28
	movrne	%l0,	0x2CB,	%g1
	bleu	loop_1996
	addc	%o3,	0x0B80,	%i3
	udivx	%l4,	0x066E,	%o6
	move	%icc,	%l1,	%o7
loop_1996:
	sdivcc	%l6,	0x19C2,	%i0
	mova	%icc,	%i7,	%o5
	edge16n	%g4,	%o4,	%g7
	popc	0x03D2,	%i6
	mulx	%g5,	0x1D4A,	%l3
	lduh	[%l7 + 0x26],	%l2
	fbule	%fcc1,	loop_1997
	sdivx	%g2,	0x09C7,	%i4
	alignaddr	%i2,	%l5,	%g6
	sdivx	%i1,	0x1838,	%o2
loop_1997:
	edge8	%o0,	%o1,	%i5
	taddcc	%g3,	%g1,	%l0
	sir	0x0369
	addcc	%i3,	0x1F18,	%o3
	tl	%xcc,	0x3
	fnors	%f20,	%f28,	%f1
	andncc	%o6,	%l4,	%o7
	xor	%l6,	%i0,	%l1
	movgu	%icc,	%o5,	%g4
	edge8l	%i7,	%o4,	%g7
	fmul8sux16	%f2,	%f24,	%f18
	mova	%xcc,	%g5,	%l3
	mulscc	%l2,	%g2,	%i6
	fzero	%f8
	taddcc	%i4,	%l5,	%i2
	or	%g6,	%o2,	%o0
	movcc	%icc,	%o1,	%i1
	fmovscc	%icc,	%f24,	%f20
	fmovsl	%icc,	%f3,	%f6
	fabsd	%f12,	%f14
	fmovdle	%xcc,	%f29,	%f8
	membar	0x5C
	or	%i5,	%g1,	%g3
	subc	%i3,	0x1C47,	%o3
	fnands	%f25,	%f2,	%f13
	bneg,pn	%icc,	loop_1998
	bvs,a,pt	%icc,	loop_1999
	fnand	%f8,	%f26,	%f20
	fxnor	%f20,	%f30,	%f0
loop_1998:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1999:
	sub	%l0,	0x06DD,	%o6
	sir	0x1D32
	be,a,pn	%icc,	loop_2000
	tleu	%xcc,	0x6
	tgu	%icc,	0x4
	nop
	set	0x76, %l4
	ldsb	[%l7 + %l4],	%l4
loop_2000:
	fsrc2	%f4,	%f22
	be	loop_2001
	tne	%xcc,	0x0
	ta	%xcc,	0x3
	ldsb	[%l7 + 0x54],	%l6
loop_2001:
	fzero	%f26
	fbuge	%fcc3,	loop_2002
	tle	%xcc,	0x5
	fcmpgt32	%f6,	%f4,	%o7
	wr	%g0,	0x80,	%asi
	stba	%i0,	[%l7 + 0x64] %asi
loop_2002:
	andncc	%o5,	%g4,	%l1
	tsubcc	%i7,	%o4,	%g5
	fmovrdlez	%g7,	%f12,	%f6
	andn	%l2,	0x1B8F,	%l3
	nop
	set	0x60, %o0
	lduw	[%l7 + %o0],	%g2
	std	%f0,	[%l7 + 0x60]
	movle	%icc,	%i4,	%i6
	fmovda	%icc,	%f16,	%f10
	movle	%icc,	%i2,	%g6
	brlz	%l5,	loop_2003
	brgz,a	%o2,	loop_2004
	edge8ln	%o1,	%i1,	%o0
	ldsb	[%l7 + 0x40],	%i5
loop_2003:
	umulcc	%g3,	%g1,	%i3
loop_2004:
	fmovsgu	%icc,	%f0,	%f9
	xnor	%l0,	0x0D11,	%o6
	ba	%xcc,	loop_2005
	edge8l	%l4,	%l6,	%o7
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i0
loop_2005:
	movrlez	%o3,	%o5,	%l1
	bn,a	%xcc,	loop_2006
	fmovrdlez	%i7,	%f10,	%f14
	ble	loop_2007
	fpadd16	%f24,	%f16,	%f24
loop_2006:
	tvs	%xcc,	0x1
	ba,pt	%xcc,	loop_2008
loop_2007:
	sdivx	%o4,	0x1B92,	%g5
	fexpand	%f3,	%f10
	addc	%g7,	0x162F,	%l2
loop_2008:
	fzeros	%f22
	fmovsl	%xcc,	%f27,	%f26
	edge16l	%g4,	%g2,	%l3
	membar	0x13
	edge32l	%i4,	%i6,	%g6
	orn	%l5,	0x0C46,	%i2
	fbule	%fcc2,	loop_2009
	std	%f28,	[%l7 + 0x48]
	taddcctv	%o2,	0x018C,	%o1
	array32	%i1,	%i5,	%o0
loop_2009:
	movle	%xcc,	%g1,	%i3
	movcc	%icc,	%l0,	%g3
	tcc	%xcc,	0x6
	andncc	%l4,	%l6,	%o6
	sth	%i0,	[%l7 + 0x10]
	ba,a	%icc,	loop_2010
	andncc	%o3,	%o7,	%o5
	sll	%l1,	0x19,	%i7
	edge32n	%g5,	%o4,	%g7
loop_2010:
	fmovsne	%xcc,	%f7,	%f15
	swap	[%l7 + 0x78],	%g4
	edge8	%g2,	%l2,	%l3
	tg	%xcc,	0x5
	umulcc	%i6,	0x1B2B,	%i4
	tge	%icc,	0x6
	sir	0x17AF
	movcs	%xcc,	%g6,	%i2
	fandnot2	%f22,	%f0,	%f8
	sdivcc	%l5,	0x0414,	%o2
	mulscc	%o1,	%i5,	%o0
	ta	%icc,	0x5
	stbar
	movvc	%xcc,	%i1,	%i3
	xor	%g1,	%g3,	%l4
	fnot1s	%f29,	%f13
	tleu	%xcc,	0x4
	movgu	%icc,	%l6,	%o6
	te	%icc,	0x4
	fbule,a	%fcc1,	loop_2011
	fbo,a	%fcc1,	loop_2012
	stbar
	ldd	[%l7 + 0x40],	%f28
loop_2011:
	fornot1s	%f26,	%f18,	%f23
loop_2012:
	fmovdleu	%xcc,	%f4,	%f25
	bshuffle	%f30,	%f26,	%f10
	taddcctv	%i0,	0x0B86,	%l0
	set	0x62, %o7
	ldsba	[%l7 + %o7] 0x80,	%o7
	membar	0x70
	movvs	%icc,	%o5,	%l1
	tgu	%xcc,	0x6
	sdivx	%i7,	0x08F7,	%o3
	edge32ln	%o4,	%g7,	%g4
	stw	%g2,	[%l7 + 0x20]
	array32	%g5,	%l2,	%l3
	fbule	%fcc0,	loop_2013
	movge	%xcc,	%i6,	%g6
	stw	%i2,	[%l7 + 0x64]
	movrgz	%l5,	%i4,	%o2
loop_2013:
	fornot2	%f0,	%f6,	%f0
	bge	loop_2014
	fnot2s	%f26,	%f22
	te	%xcc,	0x4
	fabsd	%f20,	%f4
loop_2014:
	movneg	%xcc,	%i5,	%o1
	sra	%o0,	0x04,	%i3
	edge16l	%i1,	%g1,	%g3
	bg,a,pt	%icc,	loop_2015
	fpack32	%f18,	%f28,	%f18
	smulcc	%l4,	%l6,	%o6
	tn	%icc,	0x4
loop_2015:
	lduh	[%l7 + 0x4E],	%i0
	fbue,a	%fcc1,	loop_2016
	tgu	%icc,	0x0
	fmovsg	%xcc,	%f9,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2016:
	andcc	%l0,	%o5,	%l1
	tcs	%xcc,	0x3
	bvs,pn	%icc,	loop_2017
	fmovsvs	%xcc,	%f18,	%f2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o7
loop_2017:
	mulscc	%o4,	0x16A8,	%o3
	fornot1s	%f7,	%f13,	%f21
	edge32l	%g4,	%g2,	%g7
	movne	%icc,	%g5,	%l3
	fpackfix	%f18,	%f8
	srlx	%l2,	0x09,	%i6
	bcc,a,pn	%icc,	loop_2018
	fbule,a	%fcc3,	loop_2019
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x0
loop_2018:
	brnz	%g6,	loop_2020
loop_2019:
	fbl	%fcc3,	loop_2021
	udiv	%l5,	0x142D,	%i2
	fcmpne16	%f12,	%f6,	%o2
loop_2020:
	brgez,a	%i4,	loop_2022
loop_2021:
	sdivx	%o1,	0x0414,	%o0
	ba,pt	%icc,	loop_2023
	edge8n	%i3,	%i1,	%g1
loop_2022:
	fmovrdlez	%g3,	%f4,	%f12
	array16	%i5,	%l4,	%l6
loop_2023:
	ble,a,pt	%xcc,	loop_2024
	smulcc	%i0,	0x08AD,	%o6
	brz	%o5,	loop_2025
	udiv	%l0,	0x0D8A,	%l1
loop_2024:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%o4
loop_2025:
	movcc	%icc,	%o7,	%g4
	set	0x0C, %l5
	ldsha	[%l7 + %l5] 0x80,	%g2
	mulx	%o3,	0x1A49,	%g5
	set	0x70, %g5
	lduwa	[%l7 + %g5] 0x15,	%g7
	tsubcc	%l3,	0x140B,	%l2
	fxor	%f26,	%f8,	%f14
	xor	%i6,	%l5,	%i2
	srl	%o2,	0x01,	%g6
	fmovdvc	%xcc,	%f11,	%f6
	subccc	%i4,	%o1,	%o0
	fmovdge	%xcc,	%f19,	%f29
	bcc,a	loop_2026
	edge32l	%i3,	%i1,	%g3
	set	0x08, %g2
	stwa	%g1,	[%l7 + %g2] 0x81
loop_2026:
	fmovse	%xcc,	%f22,	%f2
	tn	%icc,	0x7
	fbule,a	%fcc3,	loop_2027
	fmovdpos	%xcc,	%f3,	%f20
	sll	%l4,	%i5,	%l6
	fmovrdlz	%o6,	%f20,	%f10
loop_2027:
	addccc	%o5,	%i0,	%l1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i7,	%o4
	fbn,a	%fcc1,	loop_2028
	movneg	%icc,	%o7,	%l0
	movpos	%icc,	%g4,	%o3
	tvc	%icc,	0x0
loop_2028:
	orncc	%g5,	%g2,	%g7
	tne	%xcc,	0x3
	addc	%l2,	%l3,	%i6
	movre	%i2,	%l5,	%g6
	srl	%i4,	0x07,	%o1
	tle	%xcc,	0x2
	nop
	set	0x54, %i7
	lduh	[%l7 + %i7],	%o2
	fmul8x16au	%f30,	%f3,	%f8
	movrgz	%i3,	0x08E,	%i1
	edge32ln	%g3,	%o0,	%g1
	tne	%icc,	0x4
	edge8n	%i5,	%l6,	%o6
	mova	%xcc,	%l4,	%o5
	orn	%i0,	%i7,	%l1
	movrlz	%o4,	%l0,	%o7
	tn	%icc,	0x5
	srax	%o3,	%g5,	%g2
	ta	%icc,	0x0
	srl	%g7,	0x17,	%g4
	tle	%xcc,	0x4
	mulx	%l2,	%i6,	%l3
	movge	%xcc,	%l5,	%i2
	fones	%f6
	brnz,a	%g6,	loop_2029
	ld	[%l7 + 0x54],	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o1,	%i4
loop_2029:
	udivcc	%o2,	0x0070,	%i1
	andn	%g3,	0x125B,	%i3
	addccc	%g1,	%i5,	%o0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%o6
	smul	%l4,	%o5,	%l6
	fnand	%f14,	%f0,	%f10
	ldd	[%l7 + 0x30],	%f30
	fmuld8ulx16	%f1,	%f18,	%f14
	nop
	setx	loop_2030,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sth	%i0,	[%l7 + 0x4C]
	fbne,a	%fcc2,	loop_2031
	array8	%l1,	%i7,	%l0
loop_2030:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o4
loop_2031:
	alignaddr	%o3,	%g5,	%g2
	fmovsvs	%xcc,	%f1,	%f30
	fmovrdgez	%o7,	%f6,	%f20
	tpos	%xcc,	0x2
	fcmps	%fcc2,	%f26,	%f31
	std	%f0,	[%l7 + 0x48]
	tcs	%xcc,	0x6
	brgez,a	%g7,	loop_2032
	sll	%l2,	0x0A,	%i6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g4
loop_2032:
	tcc	%xcc,	0x1
	swap	[%l7 + 0x6C],	%l3
	ldsh	[%l7 + 0x5A],	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x51, %i6
	ldsba	[%l7 + %i6] 0x18,	%i2
	bge,a,pn	%icc,	loop_2033
	fnors	%f0,	%f29,	%f25
	brlez	%o1,	loop_2034
	taddcc	%i4,	0x1186,	%g6
loop_2033:
	sdivcc	%o2,	0x072D,	%i1
	edge8l	%g3,	%i3,	%i5
loop_2034:
	tge	%xcc,	0x1
	sra	%g1,	0x00,	%o0
	edge32	%l4,	%o5,	%o6
	tsubcctv	%l6,	0x1650,	%i0
	fand	%f16,	%f18,	%f30
	edge32	%i7,	%l0,	%l1
	tne	%xcc,	0x1
	xnor	%o4,	%o3,	%g5
	fmovdne	%xcc,	%f1,	%f7
	move	%icc,	%o7,	%g2
	fmovscs	%xcc,	%f4,	%f14
	mulscc	%l2,	0x1BD4,	%g7
	movvs	%icc,	%g4,	%l3
	edge16ln	%l5,	%i2,	%o1
	mova	%xcc,	%i4,	%g6
	fmovdcs	%icc,	%f18,	%f17
	andncc	%i6,	%i1,	%o2
	fbne	%fcc1,	loop_2035
	fmovdle	%xcc,	%f30,	%f9
	lduh	[%l7 + 0x70],	%g3
	srlx	%i5,	0x1A,	%g1
loop_2035:
	edge8l	%o0,	%i3,	%o5
	call	loop_2036
	membar	0x5C
	fpsub16s	%f1,	%f23,	%f20
	fcmple16	%f20,	%f20,	%o6
loop_2036:
	fbn,a	%fcc2,	loop_2037
	movn	%icc,	%l4,	%l6
	sethi	0x19B6,	%i7
	fmovspos	%xcc,	%f31,	%f6
loop_2037:
	bcc	loop_2038
	udivcc	%i0,	0x18DA,	%l0
	movvs	%icc,	%o4,	%o3
	srl	%g5,	%o7,	%l1
loop_2038:
	membar	0x27
	ld	[%l7 + 0x24],	%f4
	fbul,a	%fcc3,	loop_2039
	udivcc	%l2,	0x0689,	%g7
	sra	%g2,	0x02,	%g4
	brnz,a	%l3,	loop_2040
loop_2039:
	bgu,pt	%xcc,	loop_2041
	fbg	%fcc0,	loop_2042
	taddcctv	%i2,	%o1,	%l5
loop_2040:
	for	%f10,	%f22,	%f0
loop_2041:
	edge32ln	%i4,	%i6,	%i1
loop_2042:
	nop
	wr	%g0,	0x88,	%asi
	stda	%g6,	[%l7 + 0x28] %asi
	sllx	%g3,	0x1C,	%i5
	alignaddrl	%o2,	%o0,	%i3
	fbe,a	%fcc2,	loop_2043
	andcc	%o5,	%o6,	%g1
	addc	%l6,	%l4,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o4
loop_2043:
	movrgez	%o3,	%g5,	%i0
	stb	%o7,	[%l7 + 0x6C]
	bcc,a	loop_2044
	fmovde	%xcc,	%f26,	%f14
	taddcc	%l2,	%g7,	%g2
	brlz,a	%g4,	loop_2045
loop_2044:
	edge8l	%l1,	%i2,	%l3
	edge16n	%o1,	%i4,	%i6
	tvs	%xcc,	0x3
loop_2045:
	movrne	%l5,	%i1,	%g3
	udiv	%g6,	0x0DC6,	%i5
	srl	%o2,	0x12,	%o0
	brgz	%i3,	loop_2046
	fcmpgt16	%f14,	%f14,	%o5
	fmovsvs	%xcc,	%f5,	%f0
	tle	%icc,	0x1
loop_2046:
	pdist	%f14,	%f20,	%f26
	edge16ln	%o6,	%g1,	%l6
	lduh	[%l7 + 0x2C],	%i7
	fmovsvs	%xcc,	%f0,	%f27
	umul	%l0,	%o4,	%l4
	bge,pn	%xcc,	loop_2047
	fmovscs	%xcc,	%f25,	%f10
	mulx	%g5,	0x02DE,	%o3
	movge	%xcc,	%i0,	%l2
loop_2047:
	sdivx	%g7,	0x1BD0,	%g2
	edge16l	%g4,	%l1,	%o7
	fmovsleu	%xcc,	%f25,	%f9
	call	loop_2048
	orn	%l3,	%i2,	%o1
	movrgez	%i4,	%i6,	%i1
	subccc	%g3,	%g6,	%l5
loop_2048:
	addcc	%i5,	0x09B7,	%o0
	fmovsvc	%icc,	%f1,	%f19
	bcs,a,pn	%xcc,	loop_2049
	movneg	%icc,	%i3,	%o5
	fbne,a	%fcc2,	loop_2050
	tsubcc	%o6,	0x1B1A,	%g1
loop_2049:
	brgez	%o2,	loop_2051
	fcmpne16	%f0,	%f8,	%l6
loop_2050:
	xorcc	%i7,	%l0,	%l4
	edge16n	%g5,	%o4,	%o3
loop_2051:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%i0,	[%l7 + 0x70] %asi
	movl	%icc,	%g7,	%l2
	brgz,a	%g4,	loop_2052
	smulcc	%g2,	%l1,	%l3
	popc	0x0C0D,	%o7
	orn	%i2,	0x123E,	%i4
loop_2052:
	movneg	%xcc,	%o1,	%i6
	umulcc	%g3,	0x19FD,	%i1
	bgu,pt	%xcc,	loop_2053
	tsubcc	%g6,	0x18AD,	%i5
	ba,a	loop_2054
	fbe,a	%fcc3,	loop_2055
loop_2053:
	umul	%o0,	%l5,	%o5
	movcs	%xcc,	%o6,	%g1
loop_2054:
	nop
	set	0x28, %i5
	stda	%o2,	[%l7 + %i5] 0x15
loop_2055:
	movn	%icc,	%i3,	%i7
	fpadd32	%f10,	%f10,	%f8
	fornot2s	%f13,	%f2,	%f23
	smulcc	%l6,	%l0,	%g5
	andn	%l4,	0x1CA4,	%o3
	fcmpd	%fcc0,	%f10,	%f20
	tcc	%icc,	0x1
	sir	0x1873
	smul	%o4,	%i0,	%g7
	alignaddr	%l2,	%g4,	%l1
	sir	0x00F2
	tcs	%xcc,	0x6
	fbn,a	%fcc1,	loop_2056
	fmovsle	%xcc,	%f27,	%f16
	fmovscc	%xcc,	%f11,	%f12
	tvc	%xcc,	0x5
loop_2056:
	ldsw	[%l7 + 0x20],	%l3
	array16	%g2,	%o7,	%i2
	fnor	%f20,	%f8,	%f8
	movvs	%xcc,	%i4,	%o1
	bneg,a,pt	%xcc,	loop_2057
	edge16l	%i6,	%i1,	%g6
	bgu	loop_2058
	fblg	%fcc1,	loop_2059
loop_2057:
	andcc	%i5,	0x12A1,	%g3
	sdiv	%o0,	0x1AC2,	%o5
loop_2058:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7B] %asi,	%l5
loop_2059:
	orcc	%g1,	0x0407,	%o2
	sdivx	%o6,	0x092D,	%i3
	tsubcc	%l6,	0x069E,	%l0
	fmovdleu	%icc,	%f15,	%f24
	fzero	%f4
	fmovdcc	%icc,	%f14,	%f9
	movg	%xcc,	%i7,	%g5
	tleu	%xcc,	0x0
	movne	%xcc,	%o3,	%l4
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x53] %asi,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g7,	%l2
	alignaddr	%g4,	%l1,	%l3
	umulcc	%g2,	0x143D,	%o7
	be	loop_2060
	bne	%icc,	loop_2061
	brlez,a	%i2,	loop_2062
	fmuld8sux16	%f10,	%f20,	%f4
loop_2060:
	fzeros	%f20
loop_2061:
	fcmpeq16	%f8,	%f24,	%i0
loop_2062:
	fpsub16	%f30,	%f12,	%f6
	brlez	%i4,	loop_2063
	ldsb	[%l7 + 0x24],	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i6,	%g6,	%i1
loop_2063:
	nop
	set	0x22, %l1
	stha	%i5,	[%l7 + %l1] 0x10
	brlz,a	%g3,	loop_2064
	array8	%o5,	%l5,	%g1
	fmovsl	%xcc,	%f15,	%f10
	movpos	%icc,	%o2,	%o6
loop_2064:
	fnor	%f28,	%f14,	%f10
	tne	%xcc,	0x5
	fmovspos	%xcc,	%f27,	%f4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i3,	%l6
	tcc	%xcc,	0x0
	movle	%icc,	%l0,	%i7
	andncc	%g5,	%o0,	%l4
	movpos	%xcc,	%o3,	%o4
	swap	[%l7 + 0x5C],	%l2
	fcmpgt16	%f8,	%f22,	%g4
	fmovsa	%xcc,	%f24,	%f7
	ble	loop_2065
	edge16l	%g7,	%l3,	%l1
	smul	%g2,	%i2,	%o7
	sdiv	%i0,	0x1EDC,	%o1
loop_2065:
	fcmpeq16	%f28,	%f28,	%i6
	fxnors	%f16,	%f9,	%f17
	ldub	[%l7 + 0x18],	%i4
	subc	%g6,	%i1,	%i5
	array16	%g3,	%o5,	%g1
	fandnot1	%f10,	%f30,	%f26
	tgu	%xcc,	0x4
	movvs	%xcc,	%l5,	%o2
	udivcc	%o6,	0x0048,	%i3
	ldsb	[%l7 + 0x6A],	%l0
	fmovsl	%icc,	%f7,	%f11
	smul	%l6,	%i7,	%g5
	edge8n	%o0,	%o3,	%l4
	tsubcc	%l2,	0x0B98,	%g4
	tvs	%xcc,	0x3
	alignaddr	%o4,	%g7,	%l1
	udivcc	%g2,	0x114E,	%l3
	srax	%i2,	0x02,	%o7
	edge8l	%o1,	%i0,	%i4
	fmovdge	%xcc,	%f11,	%f4
	set	0x28, %i2
	stwa	%i6,	[%l7 + %i2] 0x04
	tle	%xcc,	0x0
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x27,	%i0
	add	%i5,	%g3,	%o5
	pdist	%f2,	%f30,	%f0
	fmovdpos	%icc,	%f8,	%f15
	fcmpne32	%f22,	%f12,	%g6
	set	0x1d8, %o4
	nop 	! 	nop 	! 	ldxa	[%g0 + %o4] 0x40,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
	fbn,a	%fcc0,	loop_2066
	srl	%l5,	%o2,	%o6
	mulscc	%i3,	0x152A,	%l6
	fmovsneg	%xcc,	%f20,	%f0
loop_2066:
	ldub	[%l7 + 0x31],	%l0
	nop
	setx	loop_2067,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%g5,	%o0,	%i7
	tne	%icc,	0x0
	add	%l4,	0x1305,	%l2
loop_2067:
	ba,pn	%icc,	loop_2068
	array16	%g4,	%o4,	%o3
	addccc	%g7,	0x1C25,	%g2
	movvs	%xcc,	%l1,	%i2
loop_2068:
	movge	%xcc,	%l3,	%o7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x3F] %asi,	%o1
	ldd	[%l7 + 0x28],	%i4
	edge8l	%i0,	%i6,	%i1
	tgu	%icc,	0x4
	nop
	setx	loop_2069,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16	%i5,	%g3,	%o5
	fabss	%f25,	%f9
	popc	0x1FC9,	%g6
loop_2069:
	orncc	%g1,	0x07FB,	%o2
	mova	%icc,	%o6,	%i3
	tsubcc	%l5,	%l0,	%l6
	sdivcc	%o0,	0x1C30,	%i7
	fmovse	%icc,	%f27,	%f11
	movrne	%l4,	0x1D5,	%g5
	xnor	%g4,	%o4,	%l2
	edge32ln	%g7,	%g2,	%l1
	membar	0x7E
	movg	%icc,	%i2,	%o3
	smul	%o7,	%o1,	%l3
	tge	%icc,	0x2
	xorcc	%i0,	%i6,	%i1
	nop
	setx	loop_2070,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bl,a	loop_2071
	movneg	%icc,	%i4,	%i5
	sdivcc	%g3,	0x1F70,	%g6
loop_2070:
	popc	%g1,	%o5
loop_2071:
	subcc	%o2,	0x0047,	%i3
	lduw	[%l7 + 0x0C],	%l5
	fble,a	%fcc2,	loop_2072
	bcs	loop_2073
	movrlz	%o6,	0x13E,	%l6
	smulcc	%l0,	%i7,	%l4
loop_2072:
	nop
	set	0x2D, %i0
	ldstub	[%l7 + %i0],	%g5
loop_2073:
	sdivx	%g4,	0x089F,	%o0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4C] %asi,	%o4
	smulcc	%l2,	0x1F26,	%g2
	bneg,a	%xcc,	loop_2074
	tgu	%xcc,	0x6
	fnands	%f28,	%f13,	%f0
	movre	%g7,	0x094,	%l1
loop_2074:
	sub	%o3,	0x1058,	%i2
	edge16l	%o7,	%l3,	%i0
	sethi	0x1438,	%i6
	tg	%icc,	0x7
	bvc,a,pn	%icc,	loop_2075
	fmul8x16	%f4,	%f26,	%f0
	tg	%xcc,	0x0
	addcc	%o1,	%i1,	%i5
loop_2075:
	ba,pn	%icc,	loop_2076
	movvs	%xcc,	%g3,	%i4
	fpadd32	%f26,	%f28,	%f24
	ldstub	[%l7 + 0x41],	%g1
loop_2076:
	prefetch	[%l7 + 0x14],	 0x3
	xorcc	%g6,	0x1CD0,	%o2
	alignaddrl	%i3,	%l5,	%o5
	nop
	setx	loop_2077,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%xcc,	%o6,	%l6
	movg	%icc,	%i7,	%l0
	movl	%icc,	%g5,	%l4
loop_2077:
	smulcc	%o0,	0x18D6,	%g4
	orn	%o4,	0x1658,	%l2
	tvc	%xcc,	0x1
	alignaddr	%g2,	%g7,	%o3
	fmovrslez	%i2,	%f12,	%f30
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 0x1
	fnands	%f2,	%f19,	%f6
	srax	%o7,	%l1,	%l3
	mulx	%i0,	%i6,	%i1
	fnand	%f22,	%f12,	%f30
	sub	%i5,	%g3,	%i4
	tneg	%icc,	0x2
	srax	%g1,	0x00,	%o1
	srlx	%o2,	%i3,	%l5
	add	%o5,	0x0719,	%g6
	bvs,a	loop_2078
	tpos	%icc,	0x1
	tleu	%icc,	0x1
	sth	%l6,	[%l7 + 0x5C]
loop_2078:
	andncc	%o6,	%l0,	%g5
	movle	%icc,	%l4,	%o0
	or	%i7,	0x012A,	%g4
	srlx	%l2,	%o4,	%g2
	edge8	%o3,	%i2,	%g7
	swap	[%l7 + 0x1C],	%o7
	fmovdpos	%xcc,	%f20,	%f22
	movcs	%xcc,	%l3,	%i0
	srax	%l1,	%i6,	%i5
	taddcc	%i1,	%i4,	%g1
	fmovd	%f16,	%f22
	tsubcctv	%o1,	0x15BB,	%g3
	tneg	%xcc,	0x1
	fmovdne	%icc,	%f3,	%f5
	umulcc	%i3,	%l5,	%o2
	stw	%g6,	[%l7 + 0x50]
	edge32	%l6,	%o5,	%l0
	taddcc	%o6,	0x1611,	%g5
	fpadd16s	%f13,	%f26,	%f10
	fxnors	%f20,	%f8,	%f13
	edge8l	%l4,	%i7,	%o0
	edge32n	%l2,	%g4,	%g2
	edge16n	%o3,	%o4,	%g7
	xnor	%o7,	%i2,	%i0
	taddcc	%l3,	%l1,	%i6
	fbo	%fcc1,	loop_2079
	tcs	%xcc,	0x4
	fexpand	%f10,	%f20
	ta	%icc,	0x7
loop_2079:
	movpos	%xcc,	%i1,	%i4
	fcmple16	%f20,	%f6,	%i5
	fmovrslez	%g1,	%f16,	%f9
	fxnor	%f20,	%f0,	%f26
	fbule	%fcc2,	loop_2080
	umul	%o1,	%g3,	%l5
	fnor	%f6,	%f20,	%f16
	tge	%icc,	0x3
loop_2080:
	fmovdn	%icc,	%f10,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o2,	%g6,	%l6
	edge16l	%o5,	%i3,	%o6
	ta	%xcc,	0x3
	or	%l0,	0x08B2,	%l4
	taddcctv	%i7,	0x1C83,	%g5
	bpos	%icc,	loop_2081
	taddcc	%o0,	0x0DDA,	%g4
	alignaddr	%g2,	%o3,	%l2
	fmovde	%xcc,	%f22,	%f12
loop_2081:
	brlz	%o4,	loop_2082
	array8	%o7,	%i2,	%i0
	orcc	%g7,	0x1EDF,	%l1
	edge8	%l3,	%i1,	%i4
loop_2082:
	fmovrdgez	%i6,	%f22,	%f0
	movleu	%xcc,	%g1,	%i5
	brz	%o1,	loop_2083
	fcmps	%fcc0,	%f11,	%f18
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%o2
loop_2083:
	ldd	[%l7 + 0x60],	%f0
	xnor	%g6,	0x1FFF,	%l6
	fmuld8ulx16	%f8,	%f5,	%f16
	siam	0x0
	call	loop_2084
	edge16l	%l5,	%i3,	%o6
	sdivcc	%o5,	0x0943,	%l0
	set	0x40, %i3
	stxa	%l4,	[%l7 + %i3] 0x27
	membar	#Sync
loop_2084:
	bvc,pn	%icc,	loop_2085
	fxnors	%f31,	%f4,	%f17
	fcmps	%fcc0,	%f8,	%f9
	addccc	%i7,	0x0AB6,	%o0
loop_2085:
	movge	%icc,	%g5,	%g2
	popc	0x19EE,	%g4
	tgu	%icc,	0x3
	fpack32	%f20,	%f4,	%f4
	tcs	%xcc,	0x4
	brlez	%o3,	loop_2086
	sub	%o4,	%l2,	%i2
	bshuffle	%f2,	%f16,	%f8
	fcmple16	%f2,	%f2,	%o7
loop_2086:
	udivx	%g7,	0x0846,	%i0
	fmovrslz	%l1,	%f7,	%f16
	mulx	%i1,	%i4,	%i6
	swap	[%l7 + 0x20],	%g1
	subc	%i5,	%l3,	%o1
	mulx	%o2,	%g3,	%l6
	fmovdcc	%xcc,	%f22,	%f30
	add	%l5,	0x0E26,	%g6
	subcc	%i3,	0x0FD4,	%o5
	srax	%l0,	%o6,	%l4
	set	0x6C, %o3
	sta	%f16,	[%l7 + %o3] 0x18
	fbul,a	%fcc3,	loop_2087
	fbuge,a	%fcc0,	loop_2088
	movle	%icc,	%o0,	%g5
	movleu	%xcc,	%i7,	%g4
loop_2087:
	ldsw	[%l7 + 0x30],	%g2
loop_2088:
	fand	%f16,	%f8,	%f30
	edge16ln	%o4,	%o3,	%i2
	movre	%o7,	0x2DB,	%g7
	brnz,a	%l2,	loop_2089
	fmul8ulx16	%f8,	%f8,	%f8
	set	0x2C, %o1
	stwa	%i0,	[%l7 + %o1] 0x15
loop_2089:
	brnz,a	%i1,	loop_2090
	xor	%l1,	0x1C42,	%i4
	sllx	%g1,	0x08,	%i5
	movrgz	%i6,	0x2A1,	%o1
loop_2090:
	fxnors	%f8,	%f18,	%f28
	movneg	%icc,	%l3,	%o2
	be,a	loop_2091
	xnorcc	%g3,	0x14D0,	%l5
	nop
	setx	loop_2092,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x1777,	%g6
loop_2091:
	fcmpes	%fcc0,	%f1,	%f2
	movre	%l6,	%i3,	%o5
loop_2092:
	movn	%icc,	%o6,	%l0
	bvc,pt	%icc,	loop_2093
	membar	0x26
	fnot2	%f2,	%f28
	movrgez	%l4,	0x322,	%g5
loop_2093:
	edge32ln	%o0,	%g4,	%g2
	fpsub32s	%f11,	%f12,	%f23
	ba	%icc,	loop_2094
	fbge	%fcc1,	loop_2095
	andn	%o4,	0x1846,	%i7
	andcc	%i2,	0x195C,	%o3
loop_2094:
	fmovsvc	%icc,	%f15,	%f13
loop_2095:
	bshuffle	%f8,	%f14,	%f28
	edge8ln	%g7,	%o7,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f26,	%f21,	%f27
	subcc	%l2,	%i1,	%l1
	brlz,a	%g1,	loop_2096
	fcmps	%fcc0,	%f26,	%f7
	movn	%xcc,	%i4,	%i6
	nop
	setx	loop_2097,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2096:
	subcc	%o1,	0x0E60,	%l3
	srax	%i5,	%o2,	%l5
	sub	%g3,	%g6,	%i3
loop_2097:
	brnz	%l6,	loop_2098
	sir	0x1EBB
	subc	%o6,	0x1512,	%l0
	set	0x14, %l6
	ldsba	[%l7 + %l6] 0x14,	%l4
loop_2098:
	fmul8x16au	%f31,	%f18,	%f26
	tgu	%xcc,	0x7
	sdivcc	%g5,	0x0267,	%o0
	fbe,a	%fcc2,	loop_2099
	movrgez	%g4,	%o5,	%g2
	fmovdne	%icc,	%f29,	%f11
	fbge	%fcc1,	loop_2100
loop_2099:
	fsrc2	%f30,	%f18
	edge8l	%o4,	%i7,	%o3
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g7
loop_2100:
	nop
	wr	%g0,	0x81,	%asi
	stxa	%i2,	[%l7 + 0x58] %asi
	fcmpes	%fcc1,	%f14,	%f31
	fornot1	%f24,	%f6,	%f0
	te	%icc,	0x1
	nop
	set	0x4D, %i4
	ldub	[%l7 + %i4],	%i0
	fmovsleu	%icc,	%f3,	%f8
	edge32ln	%o7,	%i1,	%l2
	movcs	%icc,	%g1,	%l1
	tn	%xcc,	0x4
	membar	0x12
	movg	%xcc,	%i4,	%o1
	fbug,a	%fcc2,	loop_2101
	be	%xcc,	loop_2102
	brz	%l3,	loop_2103
	xnor	%i6,	0x1174,	%i5
loop_2101:
	popc	%o2,	%l5
loop_2102:
	movrgz	%g6,	%i3,	%g3
loop_2103:
	umul	%l6,	0x034B,	%o6
	move	%icc,	%l4,	%l0
	orn	%g5,	%o0,	%o5
	fble,a	%fcc2,	loop_2104
	fmovrslz	%g4,	%f23,	%f27
	sll	%g2,	0x01,	%o4
	membar	0x2D
loop_2104:
	swap	[%l7 + 0x28],	%i7
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x14
	tgu	%xcc,	0x5
	ldstub	[%l7 + 0x64],	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g7,	0x19,	%i2
	movgu	%icc,	%i0,	%o7
	fabsd	%f2,	%f22
	sethi	0x00A1,	%l2
	faligndata	%f24,	%f0,	%f20
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x44] %asi,	%g1
	array32	%i1,	%l1,	%o1
	addcc	%i4,	0x0CE7,	%i6
	fmovdneg	%xcc,	%f6,	%f16
	sub	%l3,	%i5,	%l5
	fmovrse	%g6,	%f17,	%f5
	fpsub16	%f14,	%f14,	%f16
	fcmpgt16	%f24,	%f28,	%i3
	xnorcc	%o2,	0x1796,	%l6
	edge32ln	%o6,	%l4,	%g3
	fxors	%f23,	%f8,	%f2
	fpadd16	%f18,	%f16,	%f22
	fble	%fcc3,	loop_2105
	sll	%l0,	0x1E,	%g5
	andn	%o0,	0x1F61,	%o5
	fmovrsne	%g4,	%f26,	%f13
loop_2105:
	tg	%icc,	0x3
	movrlz	%g2,	0x155,	%i7
	move	%icc,	%o4,	%g7
	movcs	%xcc,	%o3,	%i0
	fbug	%fcc1,	loop_2106
	move	%icc,	%o7,	%l2
	move	%xcc,	%g1,	%i1
	fmul8ulx16	%f26,	%f22,	%f18
loop_2106:
	taddcctv	%l1,	0x1214,	%i2
	movvs	%icc,	%i4,	%i6
	tg	%icc,	0x2
	te	%icc,	0x4
	movg	%icc,	%o1,	%l3
	mulx	%l5,	0x1C73,	%g6
	edge16	%i3,	%o2,	%l6
	sir	0x1F4E
	movrgz	%i5,	%l4,	%g3
	std	%f10,	[%l7 + 0x70]
	movre	%o6,	0x331,	%g5
	addc	%o0,	0x0E4F,	%l0
	srl	%g4,	%g2,	%i7
	edge32ln	%o4,	%g7,	%o5
	array16	%o3,	%i0,	%o7
	membar	0x78
	movrlz	%l2,	0x27E,	%i1
	fnand	%f8,	%f28,	%f2
	movrgz	%l1,	0x3F7,	%i2
	stbar
	fnot1	%f8,	%f18
	popc	%g1,	%i4
	stx	%i6,	[%l7 + 0x10]
	sub	%l3,	%o1,	%g6
	fpackfix	%f2,	%f8
	edge8n	%i3,	%o2,	%l5
	movre	%i5,	%l4,	%l6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x71] %asi,	%g3
	stx	%g5,	[%l7 + 0x28]
	move	%icc,	%o0,	%l0
	pdist	%f2,	%f2,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o6,	%g2
	bleu	%icc,	loop_2107
	addcc	%g4,	%i7,	%g7
	alignaddr	%o5,	%o4,	%o3
	set	0x70, %l2
	stda	%o6,	[%l7 + %l2] 0x2f
	membar	#Sync
loop_2107:
	std	%f8,	[%l7 + 0x18]
	orcc	%i0,	0x1D4C,	%i1
	fmovde	%icc,	%f25,	%f12
	movrgz	%l2,	%i2,	%l1
	xnor	%g1,	0x1EDE,	%i4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x69] %asi,	%i6
	subccc	%l3,	%o1,	%g6
	brz	%i3,	loop_2108
	nop
	setx loop_2109, %l0, %l1
	jmpl %l1, %o2
	movrlz	%i5,	%l5,	%l6
	and	%g3,	%g5,	%l4
loop_2108:
	movg	%icc,	%l0,	%o6
loop_2109:
	fmovdcs	%xcc,	%f17,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,pt	%icc,	loop_2110
	orncc	%o0,	%g4,	%g2
	movpos	%xcc,	%g7,	%o5
	nop
	setx	loop_2111,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2110:
	edge16	%o4,	%o3,	%i7
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_2111:
	nop
	setx	loop_2112,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdgu	%xcc,	%f13,	%f30
	andcc	%i0,	0x0775,	%l2
	fba	%fcc1,	loop_2113
loop_2112:
	ba,a,pt	%icc,	loop_2114
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f1,	%f15
loop_2113:
	tgu	%icc,	0x7
loop_2114:
	fnot1	%f22,	%f8
	fbug	%fcc0,	loop_2115
	flush	%l7 + 0x08
	xorcc	%i2,	%l1,	%i1
	tne	%xcc,	0x6
loop_2115:
	movcc	%xcc,	%g1,	%i4
	nop
	set	0x10, %g6
	stw	%i6,	[%l7 + %g6]
	fandnot1	%f24,	%f28,	%f12
	bneg,pn	%xcc,	loop_2116
	movn	%xcc,	%l3,	%o1
	set	0x38, %o6
	stxa	%i3,	[%l7 + %o6] 0x23
	membar	#Sync
loop_2116:
	movleu	%xcc,	%g6,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%l6
	movre	%g3,	%o2,	%l4
	mulscc	%l0,	0x044A,	%o6
	fpsub32s	%f16,	%f7,	%f6
	sll	%g5,	%o0,	%g2
	tgu	%icc,	0x0
	array8	%g7,	%o5,	%o4
	movl	%icc,	%g4,	%o3
	edge16ln	%i7,	%i0,	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i2,	%l1
	membar	0x4C
	fmul8sux16	%f16,	%f18,	%f4
	fmovsge	%xcc,	%f7,	%f12
	popc	0x089F,	%o7
	fnot1	%f20,	%f22
	movle	%icc,	%i1,	%g1
	tcs	%icc,	0x7
	array32	%i4,	%i6,	%l3
	taddcc	%o1,	%i3,	%i5
	ble,a	%xcc,	loop_2117
	tle	%xcc,	0x4
	array16	%g6,	%l6,	%g3
	add	%l5,	%o2,	%l4
loop_2117:
	fones	%f29
	edge8l	%l0,	%o6,	%o0
	brgez,a	%g5,	loop_2118
	ldd	[%l7 + 0x48],	%f22
	fble,a	%fcc3,	loop_2119
	alignaddrl	%g7,	%g2,	%o4
loop_2118:
	movrgz	%g4,	%o3,	%i7
	fbul	%fcc0,	loop_2120
loop_2119:
	bpos	loop_2121
	call	loop_2122
	movle	%xcc,	%o5,	%l2
loop_2120:
	edge32ln	%i0,	%i2,	%l1
loop_2121:
	edge32n	%o7,	%i1,	%i4
loop_2122:
	sethi	0x0733,	%i6
	st	%f11,	[%l7 + 0x2C]
	movgu	%xcc,	%l3,	%o1
	fpsub32s	%f20,	%f29,	%f25
	srax	%i3,	%i5,	%g6
	umulcc	%l6,	0x18E5,	%g1
	fornot1	%f10,	%f12,	%f12
	tn	%icc,	0x4
	brz	%g3,	loop_2123
	udivcc	%o2,	0x0A8E,	%l4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x20] %asi,	%l5
loop_2123:
	bne	loop_2124
	edge16n	%l0,	%o6,	%o0
	ldub	[%l7 + 0x47],	%g7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%g5
loop_2124:
	sethi	0x03A7,	%o4
	fcmpd	%fcc0,	%f26,	%f26
	movrlz	%g4,	%g2,	%o3
	sdivcc	%o5,	0x1E1D,	%i7
	movne	%icc,	%l2,	%i2
	tcs	%xcc,	0x2
	fmovdcc	%xcc,	%f1,	%f30
	xnorcc	%l1,	0x098D,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o7,	%i1,	%i4
	fpadd16	%f28,	%f22,	%f24
	edge8ln	%i6,	%l3,	%i3
	movg	%icc,	%o1,	%g6
	udivx	%l6,	0x003B,	%i5
	movrgz	%g3,	%o2,	%g1
	or	%l5,	0x15B1,	%l4
	bge	loop_2125
	edge32	%o6,	%o0,	%l0
	faligndata	%f28,	%f14,	%f0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g7,	%o4
loop_2125:
	tvc	%icc,	0x2
	ldx	[%l7 + 0x08],	%g4
	st	%f27,	[%l7 + 0x58]
	siam	0x1
	fandnot2	%f12,	%f20,	%f14
	sra	%g5,	%g2,	%o3
	edge16ln	%o5,	%l2,	%i7
	array32	%l1,	%i2,	%o7
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x22] %asi,	%i1
	fbul,a	%fcc0,	loop_2126
	and	%i0,	%i4,	%l3
	add	%i6,	%i3,	%g6
	xor	%l6,	0x18D2,	%o1
loop_2126:
	fbg	%fcc2,	loop_2127
	fbo,a	%fcc2,	loop_2128
	smulcc	%i5,	%o2,	%g1
	bneg,pn	%xcc,	loop_2129
loop_2127:
	edge8n	%l5,	%g3,	%l4
loop_2128:
	smulcc	%o6,	%o0,	%g7
	fble,a	%fcc3,	loop_2130
loop_2129:
	be,pt	%icc,	loop_2131
	ldsb	[%l7 + 0x6E],	%l0
	fornot1	%f4,	%f24,	%f28
loop_2130:
	fmovrsgez	%g4,	%f24,	%f8
loop_2131:
	edge16	%o4,	%g5,	%g2
	bcs	loop_2132
	fmovrdlz	%o3,	%f30,	%f18
	std	%f2,	[%l7 + 0x78]
	nop
	setx loop_2133, %l0, %l1
	jmpl %l1, %o5
loop_2132:
	fmovdg	%xcc,	%f5,	%f18
	st	%f20,	[%l7 + 0x64]
	movvs	%icc,	%l2,	%i7
loop_2133:
	sdiv	%i2,	0x1A7B,	%l1
	edge32	%i1,	%i0,	%i4
	subcc	%o7,	0x1793,	%i6
	popc	0x046B,	%l3
	fmovsgu	%icc,	%f4,	%f27
	std	%f26,	[%l7 + 0x30]
	array8	%g6,	%i3,	%o1
	ldd	[%l7 + 0x60],	%f26
	ld	[%l7 + 0x48],	%f18
	fpadd16s	%f1,	%f4,	%f20
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%o2
	fmovdleu	%xcc,	%f18,	%f4
	tsubcc	%l6,	0x10F8,	%g1
	wr	%g0,	0x19,	%asi
	stha	%l5,	[%l7 + 0x32] %asi
	array8	%l4,	%g3,	%o6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	wr	%g0,	0x0c,	%asi
	sta	%f30,	[%l7 + 0x1C] %asi
	wr	%g0,	0x81,	%asi
	stba	%l0,	[%l7 + 0x1B] %asi
	sra	%g4,	0x1E,	%g7
	movvs	%xcc,	%g5,	%o4
	fornot1s	%f26,	%f16,	%f8
	set	0x1C, %g4
	stwa	%g2,	[%l7 + %g4] 0x2f
	membar	#Sync
	movrlz	%o3,	%l2,	%i7
	edge8n	%o5,	%i2,	%l1
	umul	%i0,	0x13C4,	%i1
	sethi	0x0459,	%i4
	fble	%fcc0,	loop_2134
	subc	%i6,	0x1F09,	%l3
	udivx	%o7,	0x1D23,	%i3
	fandnot1	%f16,	%f8,	%f2
loop_2134:
	fpsub16s	%f25,	%f2,	%f26
	add	%o1,	%g6,	%i5
	or	%o2,	%g1,	%l5
	edge8	%l6,	%g3,	%o6
	fone	%f2
	lduh	[%l7 + 0x4E],	%l4
	srlx	%l0,	0x00,	%o0
	sra	%g7,	0x08,	%g4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g5
	wr	%g0,	0x89,	%asi
	stba	%o4,	[%l7 + 0x6A] %asi
	fmuld8sux16	%f24,	%f17,	%f28
	edge16n	%o3,	%l2,	%g2
	tvc	%icc,	0x7
	edge32ln	%i7,	%i2,	%l1
	fmovsleu	%icc,	%f29,	%f31
	movl	%icc,	%i0,	%o5
	nop
	set	0x2C, %l0
	ldstub	[%l7 + %l0],	%i1
	flush	%l7 + 0x20
	bvs,a,pn	%icc,	loop_2135
	nop
	setx	loop_2136,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%i4,	%i6
	fmovdne	%xcc,	%f0,	%f30
loop_2135:
	fbn	%fcc2,	loop_2137
loop_2136:
	bg,a,pn	%xcc,	loop_2138
	xnor	%o7,	0x0995,	%i3
	mulscc	%o1,	0x1942,	%l3
loop_2137:
	or	%i5,	%g6,	%o2
loop_2138:
	bge	%icc,	loop_2139
	fbue,a	%fcc2,	loop_2140
	or	%g1,	%l6,	%l5
	orcc	%g3,	%o6,	%l0
loop_2139:
	fmul8x16au	%f30,	%f27,	%f4
loop_2140:
	tsubcctv	%o0,	%l4,	%g4
	movrgez	%g5,	0x1B6,	%g7
	movne	%xcc,	%o3,	%o4
	tvs	%xcc,	0x5
	fnands	%f19,	%f26,	%f2
	fmuld8sux16	%f7,	%f16,	%f26
	fandnot2s	%f29,	%f7,	%f26
	or	%g2,	%l2,	%i7
	movleu	%xcc,	%i2,	%l1
	move	%xcc,	%i0,	%o5
	sll	%i4,	0x0A,	%i6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x74] %asi,	%f15
	set	0x58, %l3
	stwa	%o7,	[%l7 + %l3] 0x18
	fbg	%fcc3,	loop_2141
	array32	%i3,	%o1,	%l3
	bne	%xcc,	loop_2142
	movvc	%xcc,	%i1,	%i5
loop_2141:
	umulcc	%g6,	%o2,	%l6
	fble,a	%fcc0,	loop_2143
loop_2142:
	fmovdneg	%icc,	%f12,	%f7
	edge16ln	%l5,	%g3,	%o6
	movg	%icc,	%g1,	%l0
loop_2143:
	edge8n	%l4,	%g4,	%g5
	fornot2s	%f12,	%f6,	%f23
	sll	%o0,	%g7,	%o3
	udivx	%o4,	0x17FA,	%l2
	edge8l	%i7,	%g2,	%l1
	sth	%i2,	[%l7 + 0x28]
	add	%o5,	%i0,	%i6
	and	%i4,	%i3,	%o7
	fblg,a	%fcc3,	loop_2144
	sdivcc	%l3,	0x14D4,	%i1
	fmovse	%icc,	%f7,	%f8
	sdivcc	%o1,	0x067E,	%g6
loop_2144:
	movleu	%xcc,	%i5,	%l6
	set	0x1C, %g3
	ldsba	[%l7 + %g3] 0x04,	%o2
	edge16ln	%g3,	%o6,	%l5
	fabss	%f13,	%f12
	sll	%g1,	0x06,	%l4
	xorcc	%l0,	%g4,	%g5
	xnorcc	%g7,	0x1B51,	%o0
	movleu	%xcc,	%o4,	%o3
	edge32l	%i7,	%l2,	%l1
	fcmpd	%fcc2,	%f12,	%f24
	movle	%icc,	%i2,	%g2
	fblg	%fcc2,	loop_2145
	movvc	%xcc,	%i0,	%i6
	fandnot1s	%f18,	%f30,	%f16
	fpsub32s	%f17,	%f7,	%f14
loop_2145:
	addc	%o5,	0x1B71,	%i3
	tcc	%icc,	0x3
	ldsw	[%l7 + 0x78],	%o7
	fnegs	%f5,	%f11
	fblg	%fcc2,	loop_2146
	ldstub	[%l7 + 0x55],	%i4
	fpmerge	%f9,	%f0,	%f4
	edge16ln	%l3,	%o1,	%i1
loop_2146:
	orn	%i5,	0x04F4,	%l6
	fpadd32s	%f5,	%f17,	%f19
	xor	%g6,	%g3,	%o6
	mova	%icc,	%o2,	%g1
	fmovsneg	%xcc,	%f6,	%f31
	bcc,a,pn	%xcc,	loop_2147
	fbge,a	%fcc2,	loop_2148
	sdiv	%l5,	0x1A1E,	%l4
	prefetch	[%l7 + 0x60],	 0x1
loop_2147:
	orn	%l0,	0x1878,	%g5
loop_2148:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%g7,	[%l7 + 0x10] %asi
	fsrc2	%f6,	%f28
	array32	%g4,	%o0,	%o3
	set	0x69, %g1
	stba	%o4,	[%l7 + %g1] 0x89
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge16ln	%i7,	%l2,	%l1
	fbule,a	%fcc3,	loop_2149
	array32	%g2,	%i0,	%i2
	sllx	%o5,	0x10,	%i3
	fmul8sux16	%f8,	%f22,	%f22
loop_2149:
	sllx	%i6,	%o7,	%l3
	srl	%o1,	0x00,	%i4
	xorcc	%i5,	%l6,	%g6
	mova	%xcc,	%i1,	%o6
	addccc	%o2,	0x189E,	%g3
	fmovsl	%icc,	%f28,	%f30
	andcc	%g1,	0x1F51,	%l5
	popc	0x09AA,	%l0
	move	%icc,	%g5,	%l4
	mulx	%g4,	0x14E8,	%g7
	umul	%o0,	0x15B3,	%o4
	brgez,a	%o3,	loop_2150
	sethi	0x1713,	%l2
	movre	%i7,	0x190,	%g2
	tleu	%icc,	0x4
loop_2150:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2F] %asi,	%i0
	fmovscs	%icc,	%f3,	%f13
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l1
	edge8ln	%i2,	%i3,	%o5
	fmovdne	%xcc,	%f20,	%f0
	fmovspos	%xcc,	%f24,	%f6
	fmovrdgez	%o7,	%f20,	%f0
	fmovse	%icc,	%f22,	%f4
	brlz	%l3,	loop_2151
	subccc	%i6,	%i4,	%o1
	edge32	%l6,	%g6,	%i5
	set	0x68, %l4
	lduwa	[%l7 + %l4] 0x88,	%i1
loop_2151:
	bvs	%icc,	loop_2152
	xorcc	%o2,	0x1EAB,	%g3
	brgez,a	%g1,	loop_2153
	move	%icc,	%l5,	%o6
loop_2152:
	smul	%l0,	%g5,	%l4
	udiv	%g4,	0x09BD,	%o0
loop_2153:
	subc	%o4,	0x0964,	%g7
	ba,pn	%icc,	loop_2154
	subc	%l2,	0x03B5,	%i7
	edge32l	%g2,	%o3,	%i0
	edge8l	%i2,	%l1,	%i3
loop_2154:
	subcc	%o5,	0x03F3,	%l3
	edge32	%o7,	%i4,	%o1
	tvs	%xcc,	0x4
	fbge,a	%fcc2,	loop_2155
	tneg	%xcc,	0x2
	stx	%i6,	[%l7 + 0x18]
	movpos	%xcc,	%g6,	%l6
loop_2155:
	tcs	%icc,	0x2
	movpos	%icc,	%i5,	%i1
	movre	%o2,	%g1,	%l5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g3
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x73] %asi,	%l0
	fmovdg	%icc,	%f16,	%f6
	tsubcctv	%o6,	0x0C0A,	%l4
	alignaddrl	%g5,	%g4,	%o4
	xnorcc	%o0,	%g7,	%i7
	fcmple32	%f10,	%f22,	%l2
	bleu	loop_2156
	fbuge,a	%fcc0,	loop_2157
	tsubcc	%g2,	0x13BC,	%o3
	edge32	%i2,	%l1,	%i3
loop_2156:
	lduh	[%l7 + 0x0A],	%i0
loop_2157:
	fmovdne	%xcc,	%f26,	%f2
	movre	%o5,	%l3,	%o7
	sethi	0x0403,	%o1
	or	%i6,	%i4,	%g6
	fpsub32s	%f26,	%f5,	%f28
	fandnot1s	%f7,	%f2,	%f10
	addccc	%i5,	0x0A96,	%i1
	fpmerge	%f28,	%f6,	%f16
	brlz,a	%l6,	loop_2158
	tvs	%xcc,	0x0
	fmovrsne	%o2,	%f14,	%f6
	tle	%xcc,	0x1
loop_2158:
	sdivcc	%g1,	0x0C33,	%g3
	fmovdvc	%xcc,	%f2,	%f12
	bvc	%xcc,	loop_2159
	nop
	setx	loop_2160,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%icc,	0x4
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%l0
loop_2159:
	ta	%icc,	0x7
loop_2160:
	edge8ln	%l5,	%o6,	%l4
	popc	%g4,	%o4
	edge8n	%o0,	%g7,	%i7
	movge	%icc,	%l2,	%g5
	fabss	%f13,	%f23
	bgu,a	loop_2161
	fmovsa	%xcc,	%f14,	%f14
	tcs	%icc,	0x5
	xnor	%g2,	0x0F11,	%i2
loop_2161:
	movleu	%xcc,	%l1,	%i3
	orcc	%i0,	%o5,	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%o1
	andncc	%o3,	%i4,	%g6
	tsubcctv	%i5,	%i6,	%i1
	be	%xcc,	loop_2162
	movg	%xcc,	%l6,	%o2
	std	%f6,	[%l7 + 0x40]
	fmovdn	%icc,	%f15,	%f26
loop_2162:
	ldx	[%l7 + 0x18],	%g1
	addcc	%g3,	%l0,	%l5
	tneg	%icc,	0x6
	wr	%g0,	0x89,	%asi
	stha	%o6,	[%l7 + 0x22] %asi
	fpadd32	%f26,	%f6,	%f0
	orn	%g4,	0x1BC3,	%l4
	lduw	[%l7 + 0x1C],	%o0
	fnand	%f26,	%f30,	%f30
	fmovdleu	%icc,	%f26,	%f8
	bshuffle	%f8,	%f10,	%f24
	fmovscc	%icc,	%f23,	%f31
	mova	%xcc,	%g7,	%o4
	bne,pt	%xcc,	loop_2163
	fmovsg	%icc,	%f24,	%f25
	siam	0x2
	tneg	%xcc,	0x0
loop_2163:
	bcs,a,pt	%xcc,	loop_2164
	brgz,a	%i7,	loop_2165
	sth	%g5,	[%l7 + 0x34]
	and	%g2,	%l2,	%i2
loop_2164:
	fabsd	%f20,	%f16
loop_2165:
	array8	%l1,	%i0,	%i3
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x30] %asi,	%o5
	fnands	%f13,	%f14,	%f18
	andn	%o7,	0x0510,	%o1
	fcmple32	%f26,	%f26,	%l3
	tn	%xcc,	0x1
	udivcc	%o3,	0x1D24,	%i4
	fmul8ulx16	%f30,	%f16,	%f12
	tvs	%icc,	0x6
	sllx	%g6,	%i5,	%i6
	edge8n	%l6,	%i1,	%o2
	te	%icc,	0x4
	ldx	[%l7 + 0x18],	%g3
	edge16ln	%l0,	%g1,	%l5
	brgez	%o6,	loop_2166
	bg,a,pn	%xcc,	loop_2167
	tneg	%icc,	0x7
	mulx	%g4,	%l4,	%g7
loop_2166:
	nop
	setx loop_2168, %l0, %l1
	jmpl %l1, %o0
loop_2167:
	srax	%i7,	%o4,	%g2
	tleu	%icc,	0x7
	andcc	%l2,	%g5,	%l1
loop_2168:
	brgz,a	%i2,	loop_2169
	xorcc	%i0,	%i3,	%o7
	tleu	%icc,	0x2
	smul	%o1,	0x1BF6,	%l3
loop_2169:
	srl	%o3,	%i4,	%o5
	edge8	%i5,	%i6,	%g6
	taddcc	%i1,	%o2,	%l6
	edge16n	%l0,	%g1,	%g3
	movcs	%xcc,	%o6,	%l5
	ld	[%l7 + 0x40],	%f25
	taddcc	%l4,	0x11FE,	%g7
	tgu	%xcc,	0x5
	fmul8x16al	%f27,	%f16,	%f0
	srl	%g4,	0x11,	%o0
	te	%icc,	0x3
	fmovsgu	%xcc,	%f30,	%f11
	addccc	%o4,	%i7,	%l2
	tcc	%xcc,	0x5
	andn	%g5,	0x011B,	%l1
	umulcc	%g2,	0x149C,	%i2
	fornot2	%f0,	%f22,	%f12
	udivx	%i3,	0x17D4,	%i0
	fble,a	%fcc3,	loop_2170
	ldsw	[%l7 + 0x14],	%o1
	ldsw	[%l7 + 0x38],	%o7
	edge32ln	%l3,	%i4,	%o3
loop_2170:
	or	%i5,	0x1C26,	%i6
	srax	%g6,	0x04,	%i1
	sub	%o2,	%o5,	%l6
	sethi	0x0C5D,	%l0
	fmovrslez	%g3,	%f23,	%f22
	smul	%g1,	0x0D89,	%o6
	array32	%l4,	%g7,	%g4
	fmovdg	%icc,	%f21,	%f3
	tvs	%icc,	0x5
	tneg	%icc,	0x1
	fbul	%fcc3,	loop_2171
	alignaddrl	%o0,	%l5,	%i7
	nop
	setx	loop_2172,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%o4,	%l2
loop_2171:
	subccc	%g5,	0x0304,	%l1
	wr	%g0,	0x80,	%asi
	stba	%i2,	[%l7 + 0x3D] %asi
loop_2172:
	nop
	set	0x38, %o7
	stda	%i2,	[%l7 + %o7] 0x18
	std	%f28,	[%l7 + 0x78]
	be	%xcc,	loop_2173
	movvc	%icc,	%g2,	%i0
	tneg	%xcc,	0x2
	tneg	%xcc,	0x3
loop_2173:
	fone	%f2
	fmovrde	%o1,	%f4,	%f20
	edge32n	%l3,	%i4,	%o3
	ldsw	[%l7 + 0x48],	%i5
	fba,a	%fcc3,	loop_2174
	brz	%i6,	loop_2175
	bcs,a	%icc,	loop_2176
	siam	0x4
loop_2174:
	fones	%f21
loop_2175:
	fbne,a	%fcc1,	loop_2177
loop_2176:
	tleu	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x5C] %asi,	%o7
loop_2177:
	sra	%g6,	%i1,	%o5
	movvs	%xcc,	%l6,	%l0
	fbo,a	%fcc2,	loop_2178
	movrgz	%o2,	%g3,	%g1
	array32	%o6,	%g7,	%g4
	fandnot2	%f12,	%f18,	%f20
loop_2178:
	movrgez	%l4,	%o0,	%l5
	movn	%icc,	%i7,	%l2
	fmovrsgez	%g5,	%f31,	%f28
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x10,	%o4
	srlx	%i2,	%l1,	%g2
	movneg	%xcc,	%i3,	%i0
	edge32	%o1,	%i4,	%o3
	mulscc	%l3,	%i6,	%i5
	tne	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f20,	%f6
	xor	%o7,	%g6,	%i1
	fone	%f12
	bg	loop_2179
	fcmple16	%f20,	%f12,	%o5
	sllx	%l6,	0x11,	%l0
	bl,pn	%icc,	loop_2180
loop_2179:
	fbe,a	%fcc3,	loop_2181
	nop
	setx loop_2182, %l0, %l1
	jmpl %l1, %g3
	movl	%icc,	%g1,	%o2
loop_2180:
	movre	%g7,	%o6,	%g4
loop_2181:
	addc	%l4,	0x1798,	%o0
loop_2182:
	bn,a	loop_2183
	tne	%icc,	0x7
	edge32ln	%l5,	%i7,	%l2
	sdiv	%o4,	0x00DA,	%g5
loop_2183:
	nop
	setx	loop_2184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%icc,	0x6
	fmovrde	%l1,	%f22,	%f22
	movrlez	%i2,	0x129,	%g2
loop_2184:
	tcc	%xcc,	0x3
	smul	%i3,	%i0,	%i4
	tvs	%icc,	0x2
	orn	%o1,	0x0CCA,	%l3
	fandnot2	%f10,	%f6,	%f10
	fbl,a	%fcc0,	loop_2185
	fabsd	%f8,	%f30
	std	%f26,	[%l7 + 0x40]
	edge32n	%i6,	%o3,	%i5
loop_2185:
	nop
	wr	%g0,	0x10,	%asi
	stha	%g6,	[%l7 + 0x5A] %asi
	edge16n	%i1,	%o5,	%o7
	fmovs	%f21,	%f7
	edge32	%l6,	%g3,	%l0
	bcc,a,pn	%icc,	loop_2186
	fcmple32	%f22,	%f2,	%o2
	movcc	%xcc,	%g1,	%g7
	fcmpeq32	%f12,	%f28,	%o6
loop_2186:
	fba	%fcc2,	loop_2187
	edge8n	%l4,	%g4,	%l5
	fcmps	%fcc3,	%f10,	%f4
	tvc	%icc,	0x4
loop_2187:
	stw	%o0,	[%l7 + 0x50]
	movleu	%icc,	%l2,	%i7
	fmovdne	%xcc,	%f3,	%f20
	fmovsvc	%xcc,	%f29,	%f5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o4
	udivx	%g5,	0x1536,	%l1
	andcc	%g2,	0x1A0D,	%i3
	wr	%g0,	0x2f,	%asi
	stda	%i0,	[%l7 + 0x78] %asi
	membar	#Sync
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x28] %asi,	%f28
	bn	loop_2188
	srlx	%i2,	0x0F,	%o1
	movrgz	%l3,	0x3D4,	%i4
	array16	%o3,	%i5,	%g6
loop_2188:
	movgu	%xcc,	%i6,	%i1
	fcmple32	%f26,	%f16,	%o5
	sllx	%l6,	%o7,	%l0
	umul	%g3,	%g1,	%g7
	srax	%o2,	%o6,	%l4
	tgu	%xcc,	0x5
	orn	%g4,	0x1958,	%o0
	array8	%l5,	%i7,	%o4
	fmovdle	%xcc,	%f22,	%f12
	movpos	%xcc,	%l2,	%g5
	xorcc	%l1,	0x0432,	%i3
	tg	%icc,	0x1
	movpos	%xcc,	%g2,	%i2
	fcmps	%fcc3,	%f8,	%f3
	fsrc2	%f0,	%f24
	movg	%xcc,	%i0,	%l3
	movrgez	%o1,	0x1C3,	%o3
	fmovdcc	%icc,	%f25,	%f30
	fabss	%f13,	%f27
	set	0x54, %g5
	ldswa	[%l7 + %g5] 0x11,	%i4
	tne	%icc,	0x6
	tcc	%xcc,	0x4
	nop
	set	0x5A, %o2
	sth	%i5,	[%l7 + %o2]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc0,	loop_2189
	tl	%icc,	0x1
	movre	%i6,	%i1,	%g6
	movle	%xcc,	%l6,	%o7
loop_2189:
	sethi	0x16AF,	%l0
	movrgz	%o5,	%g3,	%g7
	movre	%g1,	0x2D7,	%o2
	ldsw	[%l7 + 0x44],	%l4
	tvc	%icc,	0x7
	tneg	%xcc,	0x0
	movpos	%icc,	%g4,	%o6
	ld	[%l7 + 0x64],	%f23
	addc	%o0,	%i7,	%l5
	fcmpd	%fcc1,	%f16,	%f6
	smul	%l2,	%o4,	%g5
	tcc	%icc,	0x1
	tn	%icc,	0x2
	ldsh	[%l7 + 0x6E],	%i3
	tgu	%icc,	0x5
	udivx	%g2,	0x1C0B,	%l1
	taddcctv	%i0,	%i2,	%l3
	edge32l	%o3,	%i4,	%i5
	srax	%i6,	0x16,	%i1
	fmovscs	%icc,	%f3,	%f16
	movne	%xcc,	%o1,	%g6
	fabsd	%f28,	%f16
	set	0x2C, %i7
	lda	[%l7 + %i7] 0x0c,	%f30
	movcc	%icc,	%l6,	%l0
	std	%f8,	[%l7 + 0x58]
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o7
	mulx	%g3,	0x0B57,	%o5
	edge16n	%g7,	%g1,	%o2
	tvc	%icc,	0x3
	siam	0x7
	siam	0x3
	fxnor	%f22,	%f12,	%f22
	movl	%icc,	%g4,	%l4
	brz,a	%o0,	loop_2190
	fcmps	%fcc2,	%f3,	%f17
	alignaddrl	%i7,	%l5,	%l2
	sra	%o4,	%g5,	%o6
loop_2190:
	srlx	%g2,	%l1,	%i0
	movpos	%icc,	%i3,	%i2
	movrne	%o3,	0x1F5,	%l3
	addcc	%i4,	0x1864,	%i6
	movl	%xcc,	%i5,	%i1
	tvs	%xcc,	0x2
	taddcctv	%o1,	0x078F,	%g6
	wr	%g0,	0x80,	%asi
	stba	%l0,	[%l7 + 0x44] %asi
	fbe,a	%fcc3,	loop_2191
	edge32ln	%o7,	%l6,	%o5
	fmovscs	%xcc,	%f10,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2191:
	membar	0x21
	fmovdn	%xcc,	%f27,	%f20
	stb	%g3,	[%l7 + 0x76]
	bshuffle	%f8,	%f2,	%f18
	pdist	%f6,	%f8,	%f8
	set	0x24, %g2
	lda	[%l7 + %g2] 0x80,	%f3
	movrne	%g7,	%o2,	%g1
	ldstub	[%l7 + 0x64],	%l4
	movge	%xcc,	%g4,	%o0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%l5
	and	%i7,	0x1E23,	%o4
	brnz,a	%l2,	loop_2192
	movrne	%g5,	%g2,	%l1
	wr	%g0,	0x80,	%asi
	stxa	%i0,	[%l7 + 0x58] %asi
loop_2192:
	edge8l	%i3,	%o6,	%i2
	subccc	%o3,	%l3,	%i4
	array32	%i5,	%i1,	%o1
	sir	0x07AD
	edge8n	%i6,	%l0,	%o7
	mova	%xcc,	%l6,	%g6
	set	0x70, %i5
	lduwa	[%l7 + %i5] 0x11,	%g3
	movpos	%icc,	%g7,	%o2
	andncc	%g1,	%l4,	%o5
	mova	%icc,	%o0,	%l5
	movneg	%icc,	%i7,	%o4
	fsrc2	%f26,	%f4
	movcc	%icc,	%l2,	%g4
	and	%g2,	0x0232,	%l1
	bne,a,pn	%icc,	loop_2193
	membar	0x75
	stw	%i0,	[%l7 + 0x38]
	movrlz	%i3,	0x3C5,	%o6
loop_2193:
	sdiv	%i2,	0x06EE,	%g5
	fmul8x16au	%f11,	%f14,	%f16
	ble	%xcc,	loop_2194
	xor	%l3,	0x011B,	%i4
	fbo	%fcc2,	loop_2195
	movge	%xcc,	%i5,	%i1
loop_2194:
	sethi	0x0B96,	%o3
	fcmpeq32	%f26,	%f28,	%o1
loop_2195:
	fpadd16	%f0,	%f6,	%f30
	array8	%i6,	%o7,	%l6
	tvc	%icc,	0x6
	umul	%l0,	%g6,	%g7
	tne	%xcc,	0x2
	fmovrslez	%o2,	%f28,	%f31
	tvs	%icc,	0x1
	sub	%g1,	0x07E6,	%l4
	fmovrde	%o5,	%f8,	%f10
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x62] %asi,	%o0
	xnor	%g3,	0x0BF6,	%i7
	tleu	%xcc,	0x5
	tsubcctv	%o4,	%l2,	%l5
	fnot2s	%f25,	%f19
	fcmpgt32	%f20,	%f10,	%g4
	tvs	%xcc,	0x1
	andncc	%g2,	%l1,	%i3
	set	0x74, %l1
	lda	[%l7 + %l1] 0x89,	%f9
	movrgez	%o6,	0x1FD,	%i2
	srl	%g5,	0x07,	%l3
	udivx	%i0,	0x04E5,	%i5
	prefetch	[%l7 + 0x1C],	 0x0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x1e
	membar	#Sync
	mova	%icc,	%i1,	%i4
	tvc	%xcc,	0x3
	fmovdle	%icc,	%f8,	%f15
	fmovscs	%icc,	%f25,	%f17
	movrlz	%o3,	%i6,	%o1
	taddcc	%l6,	0x071E,	%o7
	udiv	%l0,	0x003F,	%g7
	fmovdvs	%icc,	%f19,	%f6
	st	%f6,	[%l7 + 0x20]
	tpos	%xcc,	0x4
	movrlz	%g6,	%g1,	%o2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x0c,	%f16
	fcmple32	%f30,	%f14,	%l4
	flush	%l7 + 0x40
	alignaddrl	%o0,	%o5,	%i7
	array32	%o4,	%l2,	%l5
	movneg	%icc,	%g4,	%g3
	fmovdvc	%icc,	%f13,	%f1
	subc	%l1,	%g2,	%o6
	orn	%i3,	%i2,	%g5
	movg	%icc,	%i0,	%i5
	andn	%l3,	0x0582,	%i4
	smul	%i1,	%o3,	%i6
	stw	%l6,	[%l7 + 0x64]
	movrgz	%o7,	0x2B5,	%l0
	fxnor	%f12,	%f14,	%f28
	fcmple16	%f6,	%f30,	%o1
	fandnot1s	%f21,	%f19,	%f15
	ldsw	[%l7 + 0x70],	%g7
	movcc	%icc,	%g1,	%o2
	orncc	%l4,	0x1365,	%o0
	membar	0x2D
	fpackfix	%f10,	%f31
	bneg,a	%icc,	loop_2196
	brlz,a	%o5,	loop_2197
	bshuffle	%f6,	%f2,	%f30
	movrlez	%g6,	0x1B5,	%i7
loop_2196:
	edge16ln	%l2,	%o4,	%l5
loop_2197:
	stx	%g4,	[%l7 + 0x58]
	stx	%l1,	[%l7 + 0x48]
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g2
	mulx	%g3,	0x1D1E,	%i3
	fbo,a	%fcc2,	loop_2198
	smulcc	%o6,	0x0EAB,	%i2
	sub	%i0,	0x156E,	%g5
	tl	%xcc,	0x5
loop_2198:
	movg	%icc,	%i5,	%l3
	andncc	%i4,	%i1,	%i6
	stx	%l6,	[%l7 + 0x78]
	xorcc	%o3,	%o7,	%o1
	brgz,a	%l0,	loop_2199
	movrgez	%g1,	%g7,	%o2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o0
loop_2199:
	add	%l4,	%o5,	%i7
	sdivx	%l2,	0x11FC,	%g6
	udiv	%o4,	0x1E64,	%l5
	edge16ln	%g4,	%l1,	%g3
	fpsub32	%f18,	%f12,	%f24
	edge8n	%i3,	%o6,	%i2
	set	0x40, %i1
	stha	%g2,	[%l7 + %i1] 0x81
	fmovspos	%icc,	%f11,	%f22
	movge	%xcc,	%g5,	%i0
	addcc	%i5,	0x192B,	%i4
	fcmple16	%f2,	%f2,	%i1
	tge	%xcc,	0x1
	movne	%icc,	%i6,	%l3
	tcs	%xcc,	0x5
	nop
	setx	loop_2200,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrslez	%o3,	%f7,	%f14
	fpack32	%f8,	%f24,	%f6
	srl	%l6,	0x02,	%o7
loop_2200:
	smul	%l0,	%g1,	%g7
	mova	%xcc,	%o1,	%o2
	mova	%xcc,	%o0,	%o5
	umul	%l4,	%l2,	%i7
	xnorcc	%o4,	0x11BE,	%l5
	be,a	%icc,	loop_2201
	movgu	%xcc,	%g4,	%g6
	nop
	setx	loop_2202,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%g3,	0x10C4,	%i3
loop_2201:
	mova	%xcc,	%o6,	%i2
	mova	%icc,	%g2,	%g5
loop_2202:
	edge16l	%l1,	%i0,	%i5
	ble,a	%xcc,	loop_2203
	tg	%icc,	0x1
	prefetch	[%l7 + 0x30],	 0x0
	srl	%i4,	%i1,	%l3
loop_2203:
	fcmple16	%f16,	%f30,	%o3
	fzeros	%f6
	ldx	[%l7 + 0x48],	%i6
	fbue	%fcc3,	loop_2204
	nop
	set	0x22, %i0
	ldub	[%l7 + %i0],	%o7
	alignaddrl	%l0,	%l6,	%g7
	edge16l	%o1,	%o2,	%o0
loop_2204:
	edge32n	%g1,	%o5,	%l4
	smul	%l2,	%o4,	%i7
	edge16l	%g4,	%l5,	%g3
	srl	%i3,	%g6,	%o6
	wr	%g0,	0x04,	%asi
	stba	%g2,	[%l7 + 0x48] %asi
	mulx	%i2,	0x1AB1,	%g5
	fabss	%f13,	%f0
	fbug	%fcc3,	loop_2205
	xnorcc	%l1,	0x14D8,	%i5
	move	%xcc,	%i0,	%i4
	add	%l3,	%i1,	%o3
loop_2205:
	sethi	0x1B50,	%o7
	bpos,a	loop_2206
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x7
	udiv	%i6,	0x0CA5,	%l6
loop_2206:
	fmovsleu	%icc,	%f11,	%f3
	taddcc	%g7,	%o1,	%o2
	ld	[%l7 + 0x50],	%f3
	edge16l	%l0,	%o0,	%o5
	array32	%g1,	%l4,	%l2
	fcmped	%fcc3,	%f30,	%f18
	move	%xcc,	%i7,	%o4
	swap	[%l7 + 0x28],	%g4
	edge32	%l5,	%g3,	%g6
	subc	%i3,	0x130E,	%o6
	tl	%xcc,	0x6
	fpsub16	%f8,	%f12,	%f24
	fbn	%fcc1,	loop_2207
	fmovrdgez	%g2,	%f6,	%f24
	fbug,a	%fcc1,	loop_2208
	tcc	%xcc,	0x2
loop_2207:
	edge8n	%i2,	%l1,	%i5
	fmovsneg	%xcc,	%f31,	%f29
loop_2208:
	brgez	%i0,	loop_2209
	fbule	%fcc2,	loop_2210
	fmul8x16al	%f18,	%f25,	%f22
	fmovsle	%icc,	%f14,	%f0
loop_2209:
	edge8	%i4,	%l3,	%i1
loop_2210:
	tneg	%icc,	0x3
	fornot1	%f2,	%f16,	%f8
	orn	%o3,	%o7,	%g5
	add	%i6,	0x1102,	%g7
	ldsb	[%l7 + 0x3C],	%o1
	fmovdn	%xcc,	%f9,	%f3
	swap	[%l7 + 0x08],	%o2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x19,	%f0
	ldsb	[%l7 + 0x21],	%l6
	tne	%icc,	0x3
	ldd	[%l7 + 0x20],	%f14
	movrne	%o0,	%l0,	%g1
	alignaddr	%o5,	%l2,	%i7
	fmovsneg	%xcc,	%f24,	%f3
	movrlez	%l4,	0x391,	%g4
	xor	%l5,	0x1782,	%o4
	movcc	%xcc,	%g3,	%g6
	subccc	%i3,	%o6,	%i2
	fmul8x16al	%f16,	%f13,	%f18
	movrlz	%g2,	0x12A,	%i5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x24] %asi,	%i0
	flush	%l7 + 0x40
	move	%icc,	%i4,	%l3
	sll	%l1,	%o3,	%i1
	fmovdgu	%xcc,	%f0,	%f31
	fmul8ulx16	%f26,	%f12,	%f30
	xnor	%g5,	0x0061,	%i6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g7,	%o7
	fmul8x16au	%f1,	%f17,	%f30
	movl	%xcc,	%o2,	%l6
	set	0x18, %o4
	stxa	%o0,	[%l7 + %o4] 0x80
	bge	%icc,	loop_2211
	tcs	%xcc,	0x0
	orcc	%o1,	%l0,	%g1
	fmovsa	%icc,	%f31,	%f7
loop_2211:
	st	%f1,	[%l7 + 0x2C]
	alignaddrl	%o5,	%i7,	%l2
	movrlz	%l4,	%l5,	%o4
	fmovdle	%icc,	%f22,	%f20
	fmovdn	%xcc,	%f23,	%f25
	taddcctv	%g4,	%g3,	%g6
	tsubcctv	%o6,	%i3,	%g2
	tleu	%icc,	0x7
	fcmps	%fcc3,	%f23,	%f10
	fbul,a	%fcc1,	loop_2212
	andn	%i5,	%i0,	%i2
	fmovrdne	%l3,	%f4,	%f4
	tsubcctv	%l1,	0x01E0,	%o3
loop_2212:
	fsrc1s	%f2,	%f2
	fbn,a	%fcc3,	loop_2213
	membar	0x16
	sth	%i1,	[%l7 + 0x40]
	fpsub32	%f18,	%f8,	%f14
loop_2213:
	fmovsneg	%icc,	%f13,	%f22
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x24,	%g4
	for	%f14,	%f30,	%f26
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x36] %asi,	%i4
	movrlez	%i6,	%o7,	%g7
	fmovsge	%icc,	%f16,	%f17
	movne	%xcc,	%o2,	%l6
	bge	loop_2214
	edge16n	%o1,	%o0,	%l0
	fnands	%f11,	%f19,	%f25
	taddcc	%o5,	%g1,	%l2
loop_2214:
	fabss	%f13,	%f29
	fbne,a	%fcc0,	loop_2215
	fmovsg	%icc,	%f17,	%f10
	fmovdgu	%xcc,	%f10,	%f20
	movvc	%icc,	%l4,	%l5
loop_2215:
	fmovsa	%xcc,	%f31,	%f8
	movcs	%icc,	%o4,	%g4
	fmovrse	%i7,	%f16,	%f25
	fmovdg	%xcc,	%f28,	%f4
	swap	[%l7 + 0x70],	%g3
	movg	%xcc,	%g6,	%i3
	swap	[%l7 + 0x30],	%g2
	be,pt	%icc,	loop_2216
	bge,pn	%icc,	loop_2217
	ldsb	[%l7 + 0x62],	%i5
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf9,	%f16
loop_2216:
	orn	%i0,	0x0AB8,	%o6
loop_2217:
	xor	%i2,	%l3,	%o3
	ldd	[%l7 + 0x68],	%f4
	fmovscc	%icc,	%f30,	%f24
	udiv	%l1,	0x0678,	%g5
	fmovsvs	%icc,	%f15,	%f19
	set	0x20, %l6
	ldsba	[%l7 + %l6] 0x04,	%i1
	fpackfix	%f28,	%f27
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x34] %asi,	%i4
	tg	%xcc,	0x6
	fxnors	%f22,	%f30,	%f19
	andncc	%i6,	%o7,	%o2
	fmovsg	%icc,	%f2,	%f31
	sdivcc	%g7,	0x0DC1,	%l6
	move	%xcc,	%o1,	%o0
	fnot2s	%f24,	%f17
	sethi	0x10E5,	%l0
	nop
	set	0x38, %i4
	ldx	[%l7 + %i4],	%g1
	set	0x38, %o1
	stwa	%o5,	[%l7 + %o1] 0x2a
	membar	#Sync
	movleu	%icc,	%l4,	%l5
	movrne	%l2,	0x108,	%g4
	fmovrde	%o4,	%f2,	%f22
	fmovdneg	%icc,	%f28,	%f25
	fcmped	%fcc0,	%f8,	%f24
	brz,a	%g3,	loop_2218
	fmuld8sux16	%f23,	%f23,	%f12
	subccc	%i7,	0x0D4D,	%g6
	move	%xcc,	%i3,	%g2
loop_2218:
	fmovdpos	%xcc,	%f24,	%f19
	flush	%l7 + 0x78
	edge32ln	%i5,	%o6,	%i2
	fands	%f9,	%f12,	%f24
	movrne	%l3,	%o3,	%i0
	xnorcc	%g5,	0x0586,	%l1
	andncc	%i1,	%i6,	%i4
	sth	%o2,	[%l7 + 0x10]
	sdivx	%o7,	0x013A,	%g7
	fbul	%fcc0,	loop_2219
	movrlez	%l6,	%o0,	%l0
	andncc	%o1,	%g1,	%l4
	subccc	%o5,	%l5,	%l2
loop_2219:
	edge16l	%g4,	%g3,	%o4
	subc	%i7,	0x14A9,	%i3
	edge32n	%g6,	%i5,	%g2
	edge32n	%i2,	%l3,	%o6
	movre	%o3,	%g5,	%l1
	popc	0x0EE6,	%i0
	fnor	%f16,	%f16,	%f18
	fmovs	%f8,	%f16
	udivx	%i1,	0x0B53,	%i6
	fpackfix	%f8,	%f20
	edge16ln	%i4,	%o7,	%o2
	tsubcctv	%g7,	0x022C,	%o0
	set	0x30, %g7
	stha	%l6,	[%l7 + %g7] 0x18
	fmovdneg	%xcc,	%f29,	%f4
	fmovrsgz	%l0,	%f23,	%f23
	te	%icc,	0x5
	fmovdcs	%icc,	%f12,	%f20
	movgu	%xcc,	%g1,	%o1
	fors	%f8,	%f6,	%f8
	tvs	%icc,	0x2
	movleu	%icc,	%o5,	%l5
	ldx	[%l7 + 0x78],	%l2
	xnorcc	%l4,	%g4,	%o4
	smul	%i7,	%i3,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g3,	0x198C,	%i5
	set	0x60, %l2
	ldda	[%l7 + %l2] 0x0c,	%i2
	edge32	%g2,	%o6,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%g5,	loop_2220
	movne	%icc,	%o3,	%i0
	addcc	%l1,	0x0AB7,	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%i4
loop_2220:
	bleu,a	%icc,	loop_2221
	xor	%o2,	0x0230,	%o7
	udiv	%g7,	0x0642,	%l6
	ldsh	[%l7 + 0x3A],	%l0
loop_2221:
	move	%xcc,	%o0,	%g1
	edge32	%o1,	%o5,	%l2
	sllx	%l4,	0x14,	%l5
	movrne	%o4,	%i7,	%i3
	fmovdl	%icc,	%f25,	%f12
	for	%f0,	%f14,	%f28
	ld	[%l7 + 0x20],	%f18
	fmovdl	%xcc,	%f21,	%f17
	edge8	%g4,	%g6,	%i5
	fmovrslz	%g3,	%f0,	%f8
	tle	%icc,	0x2
	tn	%xcc,	0x5
	sdiv	%g2,	0x13CF,	%i2
	tge	%icc,	0x5
	tcc	%xcc,	0x1
	fbg	%fcc1,	loop_2222
	srlx	%l3,	%g5,	%o6
	fbu	%fcc3,	loop_2223
	movge	%icc,	%i0,	%l1
loop_2222:
	andn	%o3,	%i6,	%i4
	orn	%i1,	0x148D,	%o7
loop_2223:
	movcs	%xcc,	%o2,	%g7
	mova	%xcc,	%l0,	%o0
	movleu	%xcc,	%g1,	%l6
	std	%o0,	[%l7 + 0x48]
	alignaddrl	%o5,	%l4,	%l5
	st	%f31,	[%l7 + 0x74]
	fcmpgt16	%f20,	%f24,	%o4
	fmovsn	%icc,	%f19,	%f2
	tcc	%icc,	0x2
	nop
	setx	loop_2224,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%l2,	%i3,	%i7
	set	0x23, %g6
	ldstuba	[%l7 + %g6] 0x11,	%g6
loop_2224:
	nop
	set	0x58, %o6
	lduba	[%l7 + %o6] 0x80,	%i5
	sdiv	%g3,	0x144D,	%g4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x52] %asi,	%g2
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x11,	%f24
	subc	%i2,	%g5,	%l3
	sub	%o6,	%l1,	%o3
	fpsub16s	%f1,	%f10,	%f31
	sdivx	%i0,	0x0607,	%i4
	fabsd	%f0,	%f20
	fmovsgu	%icc,	%f29,	%f24
	fxors	%f12,	%f25,	%f6
	move	%xcc,	%i6,	%i1
	brgz,a	%o7,	loop_2225
	movg	%xcc,	%o2,	%g7
	subc	%o0,	0x07D1,	%l0
	movre	%g1,	0x35A,	%l6
loop_2225:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%o1,	%f2,	%f8
	sdivx	%l4,	0x0181,	%l5
	or	%o4,	0x038F,	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i3,	%l2
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	fbe,a	%fcc1,	loop_2226
	edge32n	%i7,	%i5,	%g4
	edge8n	%g2,	%i2,	%g3
	orn	%l3,	%o6,	%l1
loop_2226:
	movrlez	%g5,	%i0,	%o3
	srl	%i6,	%i4,	%o7
	edge32	%i1,	%g7,	%o0
	tneg	%xcc,	0x2
	movrgez	%l0,	%o2,	%l6
	movvc	%xcc,	%o1,	%g1
	fmovdpos	%icc,	%f10,	%f10
	add	%l4,	0x0941,	%o4
	fnor	%f18,	%f16,	%f28
	movl	%icc,	%o5,	%l5
	fmul8sux16	%f10,	%f6,	%f28
	fba,a	%fcc2,	loop_2227
	movn	%xcc,	%l2,	%i3
	wr	%g0,	0x2f,	%asi
	stwa	%g6,	[%l7 + 0x4C] %asi
	membar	#Sync
loop_2227:
	fnot2	%f12,	%f10
	fmovde	%xcc,	%f7,	%f3
	fcmpne32	%f6,	%f2,	%i5
	subcc	%i7,	%g2,	%i2
	edge16l	%g4,	%l3,	%g3
	tgu	%xcc,	0x7
	fmovdge	%xcc,	%f28,	%f28
	sub	%l1,	%g5,	%i0
	fcmpd	%fcc3,	%f18,	%f14
	flush	%l7 + 0x44
	fblg,a	%fcc2,	loop_2228
	edge16n	%o3,	%i6,	%o6
	ldx	[%l7 + 0x68],	%i4
	bgu	%icc,	loop_2229
loop_2228:
	sll	%o7,	%i1,	%o0
	udiv	%l0,	0x0D26,	%o2
	sllx	%l6,	%o1,	%g7
loop_2229:
	movgu	%icc,	%g1,	%l4
	orcc	%o5,	%o4,	%l2
	ldub	[%l7 + 0x43],	%i3
	xorcc	%g6,	%i5,	%l5
	set	0x54, %l3
	lduha	[%l7 + %l3] 0x04,	%i7
	wr	%g0,	0x10,	%asi
	stwa	%i2,	[%l7 + 0x08] %asi
	movneg	%icc,	%g2,	%g4
	fmovrdgez	%g3,	%f12,	%f14
	tn	%xcc,	0x6
	fba,a	%fcc3,	loop_2230
	sra	%l3,	%l1,	%g5
	alignaddr	%i0,	%o3,	%o6
	te	%icc,	0x5
loop_2230:
	tcc	%icc,	0x2
	brgz,a	%i4,	loop_2231
	call	loop_2232
	fsrc2s	%f4,	%f1
	movrgz	%o7,	0x0AA,	%i1
loop_2231:
	tl	%icc,	0x7
loop_2232:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x31] %asi,	%o0
	addccc	%l0,	%o2,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o1,	0x04AC,	%i6
	fpsub16s	%f8,	%f1,	%f11
	taddcc	%g1,	0x01C1,	%l4
	tneg	%icc,	0x0
	fzero	%f18
	addccc	%o5,	%o4,	%g7
	bne,pn	%xcc,	loop_2233
	fmovspos	%xcc,	%f0,	%f22
	edge8ln	%i3,	%l2,	%i5
	sllx	%l5,	0x12,	%i7
loop_2233:
	brz,a	%i2,	loop_2234
	tneg	%icc,	0x3
	fbn,a	%fcc3,	loop_2235
	bl,pn	%xcc,	loop_2236
loop_2234:
	fmovdle	%xcc,	%f16,	%f11
	udiv	%g2,	0x0944,	%g4
loop_2235:
	orncc	%g3,	%g6,	%l3
loop_2236:
	edge16n	%l1,	%i0,	%o3
	fmovsleu	%xcc,	%f10,	%f1
	srax	%g5,	0x0C,	%o6
	fbu	%fcc2,	loop_2237
	move	%xcc,	%o7,	%i4
	nop
	set	0x12, %g3
	ldsh	[%l7 + %g3],	%i1
	movneg	%xcc,	%o0,	%o2
loop_2237:
	move	%xcc,	%l0,	%o1
	movvc	%icc,	%i6,	%g1
	set	0x60, %g1
	lda	[%l7 + %g1] 0x81,	%f2
	movg	%xcc,	%l4,	%l6
	bcc,pn	%icc,	loop_2238
	fbo,a	%fcc1,	loop_2239
	ba	%xcc,	loop_2240
	tsubcctv	%o4,	%o5,	%g7
loop_2238:
	movvs	%xcc,	%l2,	%i3
loop_2239:
	fmovsne	%icc,	%f5,	%f2
loop_2240:
	sdiv	%i5,	0x15A3,	%i7
	tpos	%xcc,	0x5
	set	0x3A, %l0
	lduha	[%l7 + %l0] 0x81,	%l5
	fpsub16s	%f9,	%f15,	%f1
	bge,pt	%icc,	loop_2241
	bn	%icc,	loop_2242
	movl	%xcc,	%g2,	%g4
	fmovrslez	%i2,	%f18,	%f10
loop_2241:
	fbo,a	%fcc2,	loop_2243
loop_2242:
	sll	%g3,	0x0C,	%l3
	fmovsneg	%icc,	%f18,	%f0
	taddcctv	%g6,	%i0,	%l1
loop_2243:
	fbne	%fcc1,	loop_2244
	edge32	%g5,	%o3,	%o6
	fmul8x16al	%f14,	%f9,	%f4
	ldd	[%l7 + 0x38],	%o6
loop_2244:
	fmuld8ulx16	%f13,	%f1,	%f26
	array32	%i1,	%o0,	%o2
	xor	%i4,	%l0,	%o1
	tleu	%icc,	0x2
	edge16n	%g1,	%i6,	%l6
	edge32	%o4,	%l4,	%g7
	edge32ln	%l2,	%o5,	%i5
	andncc	%i3,	%l5,	%g2
	or	%g4,	0x1CB1,	%i7
	fmovde	%xcc,	%f23,	%f22
	orncc	%g3,	%i2,	%l3
	movle	%xcc,	%i0,	%l1
	tgu	%xcc,	0x2
	tpos	%icc,	0x6
	mulx	%g5,	%g6,	%o3
	sllx	%o7,	0x15,	%o6
	fmovsge	%xcc,	%f9,	%f15
	fcmple32	%f28,	%f10,	%i1
	fcmpgt32	%f24,	%f28,	%o2
	edge16ln	%o0,	%l0,	%o1
	flush	%l7 + 0x08
	fmovdcc	%xcc,	%f2,	%f5
	fmul8sux16	%f16,	%f18,	%f22
	orcc	%g1,	%i4,	%l6
	smulcc	%i6,	0x1CFE,	%l4
	alignaddr	%g7,	%l2,	%o5
	fmovdvs	%icc,	%f15,	%f8
	fbug,a	%fcc2,	loop_2245
	movvs	%icc,	%i5,	%o4
	orcc	%i3,	%g2,	%g4
	smul	%l5,	0x0EEC,	%g3
loop_2245:
	bge,pt	%icc,	loop_2246
	fmovdleu	%xcc,	%f2,	%f25
	edge32l	%i7,	%i2,	%l3
	mulx	%i0,	0x0048,	%l1
loop_2246:
	fand	%f26,	%f10,	%f4
	sir	0x01B8
	addc	%g5,	0x0861,	%g6
	edge32l	%o3,	%o6,	%o7
	alignaddrl	%o2,	%o0,	%l0
	fmovrsgez	%o1,	%f29,	%f3
	taddcctv	%i1,	%g1,	%l6
	sdivx	%i6,	0x08CD,	%l4
	subcc	%i4,	0x0DB3,	%g7
	movvc	%xcc,	%l2,	%o5
	fbl	%fcc0,	loop_2247
	movcs	%icc,	%i5,	%o4
	tleu	%xcc,	0x3
	addcc	%i3,	%g4,	%g2
loop_2247:
	sdivcc	%l5,	0x18B3,	%g3
	fmovdvs	%xcc,	%f29,	%f8
	xnorcc	%i2,	0x0826,	%l3
	fexpand	%f18,	%f4
	fxor	%f2,	%f24,	%f18
	subc	%i7,	%l1,	%i0
	subcc	%g6,	%o3,	%g5
	std	%f30,	[%l7 + 0x18]
	movne	%icc,	%o7,	%o6
	edge16	%o2,	%o0,	%l0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
	add	%o1,	%g1,	%l6
	fzero	%f24
	movn	%icc,	%l4,	%i4
	fmovs	%f31,	%f30
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
	fmovrdgz	%l2,	%f0,	%f26
	subccc	%o5,	%i6,	%i5
	set	0x10, %l4
	stwa	%i3,	[%l7 + %l4] 0x80
	edge32n	%g4,	%o4,	%g2
	edge8l	%g3,	%l5,	%i2
	movleu	%icc,	%l3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pn	%icc,	loop_2248
	fmovdleu	%icc,	%f23,	%f3
	fmovrdne	%l1,	%f8,	%f16
	tn	%icc,	0x7
loop_2248:
	nop
	setx	loop_2249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue,a	%fcc3,	loop_2250
	sir	0x0870
	movrlz	%i0,	0x072,	%o3
loop_2249:
	alignaddrl	%g5,	%g6,	%o6
loop_2250:
	popc	0x1652,	%o2
	fcmpes	%fcc2,	%f8,	%f12
	array32	%o0,	%l0,	%o7
	movcs	%icc,	%o1,	%g1
	prefetch	[%l7 + 0x60],	 0x1
	fmovrsne	%i1,	%f13,	%f22
	movge	%xcc,	%l4,	%i4
	tg	%icc,	0x5
	fcmpne32	%f2,	%f26,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc1,	loop_2251
	ld	[%l7 + 0x6C],	%f20
	andn	%l2,	%g7,	%i6
	fmovrdlz	%i5,	%f28,	%f2
loop_2251:
	movcs	%xcc,	%i3,	%o5
	set	0x28, %o0
	stwa	%o4,	[%l7 + %o0] 0x27
	membar	#Sync
	fmovrdlez	%g4,	%f12,	%f14
	tgu	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g2
	te	%xcc,	0x4
	fpack32	%f22,	%f14,	%f12
	brnz,a	%g3,	loop_2252
	movvs	%icc,	%i2,	%l3
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2252:
	fpack16	%f16,	%f7
	fmovscc	%icc,	%f6,	%f10
	movleu	%icc,	%l5,	%l1
	addc	%i0,	0x01FA,	%i7
	movrlz	%g5,	%g6,	%o3
	edge32n	%o6,	%o0,	%o2
	te	%icc,	0x5
	mulx	%l0,	%o7,	%o1
	fble,a	%fcc0,	loop_2253
	movrne	%g1,	%l4,	%i4
	ldx	[%l7 + 0x48],	%i1
	bneg,pn	%icc,	loop_2254
loop_2253:
	sir	0x0B26
	fbug	%fcc1,	loop_2255
	pdist	%f0,	%f14,	%f26
loop_2254:
	popc	0x0BF2,	%l6
	bg,a	%xcc,	loop_2256
loop_2255:
	movcs	%xcc,	%g7,	%i6
	fexpand	%f5,	%f10
	ldub	[%l7 + 0x34],	%l2
loop_2256:
	tgu	%xcc,	0x4
	ld	[%l7 + 0x68],	%f28
	udiv	%i5,	0x1C50,	%o5
	orn	%o4,	%g4,	%i3
	fxnors	%f16,	%f9,	%f27
	movrne	%g3,	%g2,	%i2
	movvs	%icc,	%l3,	%l5
	movre	%i0,	0x140,	%l1
	umul	%g5,	0x0175,	%g6
	tcc	%icc,	0x1
	set	0x08, %l5
	lda	[%l7 + %l5] 0x19,	%f3
	array32	%o3,	%i7,	%o0
	edge32	%o2,	%o6,	%o7
	bge	%xcc,	loop_2257
	movne	%icc,	%l0,	%g1
	sdivcc	%l4,	0x08F6,	%o1
	sra	%i4,	%l6,	%i1
loop_2257:
	nop
	setx	loop_2258,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%g7,	%i6
	edge8	%i5,	%l2,	%o4
	mulx	%o5,	0x022A,	%i3
loop_2258:
	movcc	%xcc,	%g3,	%g4
	tl	%icc,	0x6
	popc	%g2,	%i2
	alignaddrl	%l3,	%i0,	%l5
	bpos,a,pn	%xcc,	loop_2259
	tpos	%icc,	0x4
	orcc	%g5,	%l1,	%g6
	bleu,pn	%icc,	loop_2260
loop_2259:
	swap	[%l7 + 0x64],	%o3
	tcs	%xcc,	0x4
	bleu	loop_2261
loop_2260:
	fpack16	%f8,	%f14
	array16	%o0,	%i7,	%o6
	orn	%o7,	%l0,	%o2
loop_2261:
	sth	%l4,	[%l7 + 0x54]
	tleu	%icc,	0x7
	subcc	%g1,	0x1C39,	%o1
	addccc	%l6,	0x18A1,	%i4
	fornot1s	%f11,	%f2,	%f26
	udivx	%g7,	0x1E4E,	%i6
	fmovrslez	%i1,	%f23,	%f1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	wr	%g0,	0x80,	%asi
	stwa	%i5,	[%l7 + 0x24] %asi
	smul	%o4,	0x1923,	%o5
	fmovsge	%icc,	%f16,	%f3
	stbar
	taddcc	%g3,	0x0DAD,	%i3
	movn	%icc,	%g2,	%g4
	std	%l2,	[%l7 + 0x40]
	move	%icc,	%i2,	%i0
	subc	%l5,	%g5,	%l1
	smul	%o3,	%g6,	%i7
	fpsub32	%f12,	%f20,	%f28
	umul	%o0,	%o7,	%o6
	fmovdneg	%icc,	%f30,	%f0
	fandnot1	%f30,	%f2,	%f22
	edge32	%l0,	%o2,	%l4
	movrne	%g1,	0x3C6,	%o1
	movcc	%icc,	%l6,	%i4
	movrgez	%g7,	%i1,	%i6
	sub	%i5,	%o4,	%o5
	fmovscc	%xcc,	%f26,	%f6
	sdivx	%g3,	0x1A3A,	%i3
	bvc	loop_2262
	fpack16	%f4,	%f26
	movrlz	%g2,	%g4,	%l2
	xnorcc	%l3,	0x1FC9,	%i2
loop_2262:
	sllx	%i0,	%g5,	%l5
	movvc	%xcc,	%o3,	%g6
	fnegd	%f16,	%f30
	fpackfix	%f4,	%f21
	stbar
	movpos	%xcc,	%i7,	%o0
	nop
	setx loop_2263, %l0, %l1
	jmpl %l1, %o7
	movrne	%l1,	0x007,	%l0
	fandnot2	%f14,	%f12,	%f22
	te	%icc,	0x5
loop_2263:
	andn	%o2,	%o6,	%l4
	fnot1s	%f23,	%f13
	ldx	[%l7 + 0x18],	%g1
	tsubcctv	%l6,	0x17BB,	%i4
	siam	0x3
	wr	%g0,	0xeb,	%asi
	stda	%o0,	[%l7 + 0x40] %asi
	membar	#Sync
	sdivx	%g7,	0x17AB,	%i1
	edge32	%i5,	%i6,	%o4
	fmovdneg	%xcc,	%f14,	%f0
	tvs	%icc,	0x1
	add	%o5,	0x1AE5,	%g3
	fmovsgu	%xcc,	%f2,	%f24
	fpadd32	%f14,	%f4,	%f0
	tn	%xcc,	0x6
	movle	%icc,	%g2,	%i3
	nop
	set	0x28, %g5
	ldsb	[%l7 + %g5],	%l2
	set	0x3C, %o2
	sta	%f2,	[%l7 + %o2] 0x89
	mova	%xcc,	%l3,	%g4
	set	0x18, %o7
	stda	%i0,	[%l7 + %o7] 0x2b
	membar	#Sync
	tn	%xcc,	0x5
	movgu	%xcc,	%g5,	%l5
	movcs	%icc,	%o3,	%i2
	fcmped	%fcc3,	%f16,	%f18
	movcs	%xcc,	%g6,	%o0
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x38] %asi,	%f30
	andcc	%i7,	%l1,	%l0
	fcmpes	%fcc1,	%f21,	%f22
	andcc	%o2,	%o7,	%l4
	array8	%o6,	%g1,	%i4
	umul	%l6,	0x0B3A,	%g7
	set	0x68, %i7
	swapa	[%l7 + %i7] 0x11,	%o1
	wr	%g0,	0xe3,	%asi
	stxa	%i1,	[%l7 + 0x28] %asi
	membar	#Sync
	wr	%g0,	0x18,	%asi
	stha	%i6,	[%l7 + 0x4C] %asi
	movleu	%xcc,	%i5,	%o4
	bleu,pn	%icc,	loop_2264
	fbne,a	%fcc3,	loop_2265
	fpsub16	%f6,	%f12,	%f10
	set	0x10, %i5
	lduha	[%l7 + %i5] 0x81,	%g3
loop_2264:
	srax	%o5,	0x09,	%i3
loop_2265:
	fpackfix	%f0,	%f17
	bn,pt	%xcc,	loop_2266
	fble	%fcc3,	loop_2267
	lduw	[%l7 + 0x68],	%l2
	fbl	%fcc0,	loop_2268
loop_2266:
	tvc	%icc,	0x3
loop_2267:
	brgez,a	%l3,	loop_2269
	pdist	%f18,	%f6,	%f18
loop_2268:
	siam	0x1
	taddcc	%g4,	%i0,	%g2
loop_2269:
	edge16n	%g5,	%l5,	%o3
	tne	%icc,	0x0
	fones	%f15
	edge16ln	%g6,	%o0,	%i2
	fcmpeq32	%f14,	%f22,	%i7
	movrne	%l1,	0x341,	%o2
	ble,pt	%xcc,	loop_2270
	fnor	%f18,	%f18,	%f4
	fbug	%fcc0,	loop_2271
	umulcc	%l0,	0x023D,	%l4
loop_2270:
	fsrc1s	%f18,	%f2
	edge32	%o7,	%o6,	%i4
loop_2271:
	std	%g0,	[%l7 + 0x08]
	umul	%l6,	0x1E11,	%o1
	nop
	setx loop_2272, %l0, %l1
	jmpl %l1, %g7
	tsubcc	%i1,	%i6,	%o4
	subcc	%g3,	0x1CA7,	%o5
	sll	%i5,	%i3,	%l2
loop_2272:
	taddcctv	%l3,	0x151B,	%g4
	movne	%icc,	%g2,	%g5
	fmovdne	%xcc,	%f14,	%f12
	fbne	%fcc2,	loop_2273
	addccc	%i0,	%l5,	%o3
	edge32	%g6,	%i2,	%o0
	sll	%l1,	%o2,	%i7
loop_2273:
	nop
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x81,	%l4
	udivcc	%l0,	0x130C,	%o6
	movrgz	%i4,	0x0A5,	%g1
	wr	%g0,	0x19,	%asi
	sta	%f22,	[%l7 + 0x30] %asi
	edge32l	%o7,	%o1,	%g7
	sllx	%i1,	0x0F,	%l6
	movg	%xcc,	%i6,	%o4
	taddcctv	%g3,	0x03B6,	%o5
	edge8l	%i5,	%l2,	%l3
	fandnot2s	%f2,	%f1,	%f31
	xor	%i3,	%g4,	%g2
	fpsub32s	%f14,	%f13,	%f3
	srax	%g5,	%l5,	%i0
	fmovrdlz	%g6,	%f12,	%f16
	movge	%icc,	%i2,	%o0
	stw	%l1,	[%l7 + 0x54]
	srlx	%o2,	0x17,	%o3
	tn	%xcc,	0x0
	subc	%i7,	%l4,	%l0
	ldd	[%l7 + 0x10],	%f26
	sir	0x0910
	alignaddrl	%i4,	%g1,	%o7
	addccc	%o6,	0x1B63,	%o1
	sllx	%i1,	%l6,	%i6
	fbge,a	%fcc0,	loop_2274
	edge32ln	%o4,	%g3,	%o5
	edge32	%i5,	%g7,	%l3
	te	%icc,	0x1
loop_2274:
	ta	%xcc,	0x1
	edge8n	%l2,	%i3,	%g4
	movpos	%icc,	%g5,	%l5
	smul	%i0,	0x1C86,	%g6
	fcmpes	%fcc1,	%f10,	%f24
	tn	%xcc,	0x1
	edge8ln	%g2,	%i2,	%o0
	fnegd	%f22,	%f14
	movneg	%icc,	%l1,	%o3
	movn	%icc,	%i7,	%o2
	movgu	%icc,	%l0,	%i4
	popc	%g1,	%l4
	fbl	%fcc2,	loop_2275
	sethi	0x1BEA,	%o7
	xnorcc	%o6,	%i1,	%l6
	edge16ln	%i6,	%o4,	%g3
loop_2275:
	andncc	%o1,	%o5,	%g7
	bl,a	loop_2276
	taddcc	%l3,	%l2,	%i3
	std	%i4,	[%l7 + 0x78]
	sub	%g4,	%l5,	%g5
loop_2276:
	membar	0x24
	nop
	setx	loop_2277,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgz	%g6,	%f18,	%f22
	srlx	%g2,	%i2,	%o0
	tvs	%icc,	0x5
loop_2277:
	swap	[%l7 + 0x6C],	%i0
	xnorcc	%o3,	0x1076,	%i7
	ld	[%l7 + 0x48],	%f3
	edge32l	%l1,	%l0,	%i4
	bne,a	%icc,	loop_2278
	fmovdle	%icc,	%f18,	%f13
	movg	%icc,	%o2,	%g1
	movrgz	%l4,	%o6,	%i1
loop_2278:
	fmovs	%f12,	%f18
	fornot1s	%f24,	%f12,	%f30
	edge32l	%o7,	%l6,	%i6
	wr	%g0,	0x10,	%asi
	stda	%o4,	[%l7 + 0x18] %asi
	ldd	[%l7 + 0x20],	%f4
	movleu	%xcc,	%g3,	%o5
	umul	%g7,	0x1243,	%l3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x44] %asi,	%l2
	bneg	loop_2279
	udivcc	%i3,	0x0B51,	%i5
	prefetch	[%l7 + 0x4C],	 0x0
	set	0x24, %g2
	swapa	[%l7 + %g2] 0x04,	%o1
loop_2279:
	tgu	%xcc,	0x6
	taddcctv	%l5,	%g5,	%g4
	set	0x18, %i2
	swapa	[%l7 + %i2] 0x11,	%g6
	std	%f10,	[%l7 + 0x68]
	movrlz	%i2,	%g2,	%o0
	smul	%o3,	0x0A29,	%i7
	tg	%xcc,	0x5
	andcc	%i0,	%l0,	%i4
	fmul8ulx16	%f18,	%f6,	%f30
	smul	%o2,	0x0C35,	%g1
	fnot2s	%f26,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l4,	0x0DCE,	%l1
	sdivcc	%i1,	0x151B,	%o7
	movge	%xcc,	%o6,	%l6
	fnot2s	%f3,	%f20
	ldstub	[%l7 + 0x33],	%o4
	edge16ln	%g3,	%o5,	%g7
	fornot1s	%f25,	%f28,	%f11
	andn	%i6,	0x113C,	%l3
	brnz,a	%i3,	loop_2280
	mulx	%l2,	%o1,	%i5
	movn	%icc,	%g5,	%l5
	fbule	%fcc3,	loop_2281
loop_2280:
	movrgez	%g6,	0x24C,	%i2
	movneg	%icc,	%g4,	%o0
	fmovdg	%xcc,	%f26,	%f19
loop_2281:
	ldstub	[%l7 + 0x10],	%g2
	set	0x22, %i1
	stha	%i7,	[%l7 + %i1] 0x15
	fblg,a	%fcc3,	loop_2282
	tcc	%icc,	0x1
	te	%xcc,	0x4
	nop
	setx loop_2283, %l0, %l1
	jmpl %l1, %o3
loop_2282:
	and	%i0,	0x0754,	%i4
	fba	%fcc1,	loop_2284
	fbe,a	%fcc2,	loop_2285
loop_2283:
	bn,a	loop_2286
	movvs	%icc,	%l0,	%g1
loop_2284:
	fbge	%fcc2,	loop_2287
loop_2285:
	andncc	%l4,	%l1,	%i1
loop_2286:
	udivcc	%o7,	0x0377,	%o2
	edge16	%o6,	%o4,	%l6
loop_2287:
	smul	%g3,	0x1AAD,	%g7
	movvc	%xcc,	%i6,	%l3
	fbu	%fcc1,	loop_2288
	fmovdn	%xcc,	%f23,	%f2
	fbg	%fcc1,	loop_2289
	movl	%xcc,	%o5,	%i3
loop_2288:
	fzeros	%f18
	fbn	%fcc1,	loop_2290
loop_2289:
	xor	%o1,	%l2,	%g5
	taddcc	%i5,	%l5,	%g6
	stw	%g4,	[%l7 + 0x4C]
loop_2290:
	fpadd16	%f10,	%f30,	%f12
	fmovdge	%icc,	%f17,	%f4
	fbne	%fcc2,	loop_2291
	orn	%o0,	0x0D4A,	%g2
	tvc	%xcc,	0x7
	movg	%xcc,	%i2,	%o3
loop_2291:
	movvs	%icc,	%i0,	%i4
	srl	%i7,	0x1F,	%g1
	bshuffle	%f18,	%f12,	%f2
	array8	%l0,	%l4,	%i1
	fbue,a	%fcc1,	loop_2292
	srlx	%l1,	0x12,	%o7
	bgu,a,pn	%xcc,	loop_2293
	fbu,a	%fcc1,	loop_2294
loop_2292:
	fxor	%f10,	%f22,	%f14
	fbule	%fcc2,	loop_2295
loop_2293:
	andcc	%o6,	%o2,	%l6
loop_2294:
	fcmple16	%f12,	%f10,	%g3
	tn	%xcc,	0x2
loop_2295:
	nop
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x1e,	%f16
	fble	%fcc2,	loop_2296
	std	%g6,	[%l7 + 0x50]
	fbug	%fcc3,	loop_2297
	fmovrslez	%i6,	%f23,	%f7
loop_2296:
	mulx	%o4,	0x106C,	%l3
	movleu	%icc,	%o5,	%o1
loop_2297:
	smul	%i3,	%g5,	%l2
	array32	%l5,	%i5,	%g4
	fmovrdlz	%g6,	%f28,	%f18
	membar	0x54
	fblg	%fcc0,	loop_2298
	fmovdneg	%icc,	%f27,	%f6
	tn	%icc,	0x3
	wr	%g0,	0x19,	%asi
	stba	%g2,	[%l7 + 0x49] %asi
loop_2298:
	bge,a	loop_2299
	movleu	%icc,	%i2,	%o3
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%i0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%o0
loop_2299:
	fmovsgu	%xcc,	%f26,	%f3
	set	0x44, %o5
	stwa	%i4,	[%l7 + %o5] 0x15
	ldd	[%l7 + 0x38],	%i6
	movl	%xcc,	%g1,	%l4
	membar	0x71
	ldd	[%l7 + 0x20],	%l0
	fmovdn	%icc,	%f26,	%f3
	smul	%l1,	%o7,	%i1
	edge32l	%o6,	%o2,	%g3
	movvc	%icc,	%l6,	%i6
	add	%g7,	%l3,	%o4
	orn	%o5,	%i3,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x4
	tle	%xcc,	0x0
	edge32n	%l2,	%o1,	%i5
	movcs	%xcc,	%g4,	%l5
	udivx	%g6,	0x021D,	%i2
	ble	loop_2300
	udivcc	%g2,	0x1A67,	%o3
	srl	%o0,	%i0,	%i4
	call	loop_2301
loop_2300:
	bneg,a,pt	%xcc,	loop_2302
	umul	%i7,	0x0210,	%g1
	fornot2	%f6,	%f8,	%f20
loop_2301:
	fmovrdgez	%l4,	%f16,	%f28
loop_2302:
	fbge,a	%fcc1,	loop_2303
	fpsub32s	%f3,	%f16,	%f21
	fpsub32s	%f2,	%f14,	%f18
	swap	[%l7 + 0x4C],	%l0
loop_2303:
	sdivcc	%l1,	0x11C2,	%i1
	fnot2s	%f6,	%f2
	taddcc	%o6,	%o7,	%o2
	tsubcc	%l6,	0x0B49,	%i6
	udivx	%g7,	0x17DC,	%g3
	fmul8x16	%f24,	%f14,	%f2
	movgu	%icc,	%l3,	%o4
	smul	%o5,	%g5,	%l2
	std	%i2,	[%l7 + 0x78]
	sdivx	%o1,	0x1DEC,	%i5
	ldsw	[%l7 + 0x64],	%g4
	fmul8x16	%f3,	%f18,	%f24
	taddcctv	%g6,	0x1ECC,	%i2
	movcs	%xcc,	%l5,	%o3
	sll	%g2,	%i0,	%i4
	movrlez	%i7,	%o0,	%g1
	fmovde	%icc,	%f11,	%f3
	movgu	%xcc,	%l4,	%l1
	movcs	%xcc,	%i1,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%o2
	movrne	%o6,	%l6,	%i6
	brnz	%g3,	loop_2304
	ldsb	[%l7 + 0x27],	%l3
	ble,a	loop_2305
	bneg,a,pn	%xcc,	loop_2306
loop_2304:
	movrgez	%o4,	0x058,	%g7
	tvs	%xcc,	0x0
loop_2305:
	tcc	%xcc,	0x7
loop_2306:
	fbue	%fcc3,	loop_2307
	smulcc	%o5,	0x1955,	%l2
	std	%i2,	[%l7 + 0x58]
	tpos	%xcc,	0x5
loop_2307:
	sll	%o1,	%g5,	%i5
	call	loop_2308
	nop
	setx	loop_2309,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgez	%g6,	%f24,	%f22
	fcmpgt16	%f10,	%f22,	%g4
loop_2308:
	sethi	0x1581,	%l5
loop_2309:
	ldd	[%l7 + 0x40],	%i2
	sir	0x05D6
	udivx	%o3,	0x152C,	%i0
	movl	%icc,	%g2,	%i7
	brz,a	%o0,	loop_2310
	brlez	%g1,	loop_2311
	edge16l	%i4,	%l4,	%i1
	addccc	%l1,	%o7,	%o2
loop_2310:
	sll	%o6,	%l6,	%l0
loop_2311:
	srax	%g3,	0x06,	%l3
	xorcc	%o4,	0x0AB3,	%i6
	xorcc	%g7,	0x16A3,	%l2
	tcs	%xcc,	0x7
	tleu	%icc,	0x0
	fmovdn	%icc,	%f24,	%f6
	edge8ln	%o5,	%i3,	%o1
	fbule,a	%fcc2,	loop_2312
	edge16l	%i5,	%g5,	%g6
	fmovsvc	%icc,	%f31,	%f2
	tsubcc	%g4,	%i2,	%l5
loop_2312:
	membar	0x0E
	fmul8x16al	%f5,	%f2,	%f6
	orncc	%i0,	%o3,	%i7
	call	loop_2313
	fbge	%fcc0,	loop_2314
	addc	%o0,	%g1,	%g2
	edge16	%i4,	%i1,	%l1
loop_2313:
	tleu	%xcc,	0x3
loop_2314:
	sllx	%o7,	0x03,	%o2
	fbge,a	%fcc3,	loop_2315
	srl	%l4,	0x05,	%l6
	fmovrdne	%l0,	%f8,	%f16
	movrgz	%g3,	0x27D,	%o6
loop_2315:
	xnor	%l3,	0x0179,	%o4
	fabsd	%f2,	%f24
	fmovscc	%icc,	%f23,	%f22
	movge	%icc,	%i6,	%l2
	fbg	%fcc1,	loop_2316
	fpsub32	%f12,	%f30,	%f4
	movg	%icc,	%g7,	%o5
	srlx	%i3,	%o1,	%g5
loop_2316:
	xor	%i5,	%g4,	%g6
	membar	0x15
	srax	%i2,	%i0,	%o3
	sll	%i7,	0x1A,	%o0
	udivcc	%g1,	0x0B56,	%l5
	bne,a	loop_2317
	movrgz	%g2,	%i1,	%l1
	st	%f2,	[%l7 + 0x50]
	sdivx	%i4,	0x0B64,	%o7
loop_2317:
	movneg	%xcc,	%o2,	%l6
	brlez,a	%l4,	loop_2318
	taddcc	%g3,	%o6,	%l3
	tleu	%icc,	0x0
	taddcctv	%o4,	0x1278,	%i6
loop_2318:
	mova	%xcc,	%l2,	%l0
	stb	%o5,	[%l7 + 0x14]
	movcc	%xcc,	%i3,	%o1
	fbne,a	%fcc0,	loop_2319
	ldsb	[%l7 + 0x1B],	%g7
	srax	%g5,	%i5,	%g4
	fones	%f28
loop_2319:
	addcc	%g6,	0x11CB,	%i2
	brgz,a	%i0,	loop_2320
	call	loop_2321
	fbge	%fcc2,	loop_2322
	srax	%o3,	%i7,	%o0
loop_2320:
	fcmple16	%f18,	%f20,	%g1
loop_2321:
	tl	%xcc,	0x2
loop_2322:
	movrlez	%g2,	%i1,	%l5
	array8	%i4,	%o7,	%o2
	movne	%icc,	%l6,	%l4
	xor	%l1,	0x0733,	%o6
	tn	%xcc,	0x7
	be	loop_2323
	fmovsn	%icc,	%f27,	%f15
	membar	0x0D
	sdivcc	%l3,	0x1F9D,	%g3
loop_2323:
	ldd	[%l7 + 0x70],	%f16
	sll	%o4,	%l2,	%l0
	bcs,pn	%xcc,	loop_2324
	tgu	%icc,	0x4
	set	0x24, %o3
	sta	%f29,	[%l7 + %o3] 0x14
loop_2324:
	edge8ln	%o5,	%i3,	%i6
	fmovrsgez	%o1,	%f15,	%f9
	fmovsvc	%icc,	%f4,	%f0
	umul	%g7,	%g5,	%g4
	fmovdg	%xcc,	%f12,	%f1
	fmul8sux16	%f14,	%f20,	%f4
	bleu	loop_2325
	movvs	%icc,	%i5,	%g6
	srl	%i2,	0x14,	%o3
	fmovdneg	%xcc,	%f26,	%f28
loop_2325:
	fmovda	%xcc,	%f24,	%f13
	movn	%xcc,	%i0,	%i7
	edge32n	%g1,	%o0,	%g2
	addc	%l5,	0x1BE9,	%i1
	mova	%icc,	%i4,	%o7
	tne	%xcc,	0x2
	fbue	%fcc3,	loop_2326
	lduh	[%l7 + 0x08],	%l6
	fzero	%f0
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x47] %asi,	%o2
loop_2326:
	fmovrdne	%l4,	%f20,	%f24
	fands	%f6,	%f23,	%f23
	movle	%icc,	%l1,	%o6
	movne	%icc,	%l3,	%g3
	movcs	%icc,	%o4,	%l2
	fandnot1s	%f16,	%f29,	%f8
	movrgez	%l0,	0x297,	%i3
	taddcc	%i6,	%o1,	%g7
	sdiv	%o5,	0x07DD,	%g5
	fpsub32	%f6,	%f24,	%f28
	edge16l	%g4,	%g6,	%i5
	addccc	%i2,	%i0,	%o3
	srlx	%i7,	0x1F,	%g1
	fmovdne	%icc,	%f17,	%f17
	fmovdleu	%icc,	%f7,	%f6
	add	%o0,	0x1034,	%g2
	nop
	setx	loop_2327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%i1,	%i4,	%l5
	edge16	%o7,	%l6,	%o2
	orcc	%l4,	0x1351,	%l1
loop_2327:
	stbar
	fmul8x16	%f22,	%f24,	%f2
	movrlez	%l3,	%o6,	%o4
	ble,a,pt	%icc,	loop_2328
	fmovsne	%xcc,	%f31,	%f3
	mova	%icc,	%g3,	%l2
	set	0x28, %o4
	sta	%f15,	[%l7 + %o4] 0x88
loop_2328:
	movleu	%xcc,	%i3,	%l0
	srax	%o1,	0x04,	%g7
	xnor	%o5,	0x0FB5,	%i6
	edge16ln	%g5,	%g6,	%i5
	andcc	%i2,	%i0,	%g4
	movvc	%icc,	%i7,	%o3
	srax	%g1,	0x17,	%o0
	udivcc	%i1,	0x1A05,	%g2
	ldsh	[%l7 + 0x2C],	%l5
	andcc	%i4,	%o7,	%l6
	array32	%o2,	%l4,	%l1
	movre	%l3,	0x349,	%o6
	edge16n	%g3,	%o4,	%l2
	fsrc1	%f0,	%f8
	tsubcc	%i3,	0x1688,	%o1
	fbule	%fcc2,	loop_2329
	movrgz	%l0,	%o5,	%g7
	edge8n	%i6,	%g5,	%g6
	nop
	setx	loop_2330,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2329:
	add	%i5,	%i2,	%i0
	bvs,a	%xcc,	loop_2331
	movle	%xcc,	%g4,	%i7
loop_2330:
	umul	%g1,	0x13C7,	%o0
	fmovrslz	%i1,	%f21,	%f28
loop_2331:
	taddcc	%o3,	0x01EA,	%l5
	orncc	%i4,	%g2,	%o7
	fmovrsgz	%o2,	%f15,	%f11
	move	%xcc,	%l6,	%l4
	andn	%l3,	0x1034,	%l1
	siam	0x4
	sth	%o6,	[%l7 + 0x54]
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x28] %asi,	%g3
	edge32ln	%l2,	%i3,	%o4
	tl	%xcc,	0x5
	subccc	%o1,	%l0,	%o5
	stx	%i6,	[%l7 + 0x60]
	movleu	%xcc,	%g5,	%g6
	movvs	%icc,	%i5,	%g7
	movrgez	%i2,	%i0,	%i7
	movrgez	%g4,	%g1,	%o0
	membar	0x2A
	srl	%o3,	0x0F,	%i1
	stx	%l5,	[%l7 + 0x30]
	sll	%g2,	0x0A,	%i4
	tgu	%xcc,	0x6
	subc	%o2,	0x11DB,	%o7
	taddcctv	%l6,	0x164D,	%l3
	fcmpes	%fcc0,	%f0,	%f6
	fcmple32	%f12,	%f20,	%l4
	flush	%l7 + 0x30
	ldd	[%l7 + 0x28],	%l0
	fmovrdgez	%g3,	%f22,	%f20
	tpos	%icc,	0x3
	ldsw	[%l7 + 0x54],	%o6
	fands	%f16,	%f7,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f18,	%f6
	add	%l2,	0x12DF,	%o4
	andn	%o1,	%l0,	%o5
	fpsub32s	%f16,	%f17,	%f22
	movl	%xcc,	%i3,	%i6
	tge	%xcc,	0x1
	movl	%icc,	%g6,	%i5
	tn	%xcc,	0x4
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x14
	membar	0x42
	mulx	%g5,	%i2,	%i0
	fmovd	%f18,	%f6
	fmovrslz	%i7,	%f16,	%f1
	for	%f0,	%f6,	%f22
	mova	%xcc,	%g7,	%g4
	fmovdleu	%xcc,	%f16,	%f5
	xorcc	%o0,	0x1DFE,	%o3
	bl,a,pt	%xcc,	loop_2332
	fpack16	%f16,	%f17
	sethi	0x06CA,	%g1
	sdiv	%l5,	0x08E1,	%i1
loop_2332:
	nop
	wr	%g0,	0x04,	%asi
	stda	%i4,	[%l7 + 0x38] %asi
	srl	%g2,	%o7,	%o2
	srax	%l3,	0x0F,	%l4
	bcc,a	%icc,	loop_2333
	movl	%icc,	%l1,	%l6
	bpos,a,pt	%icc,	loop_2334
	fmovdvc	%xcc,	%f5,	%f22
loop_2333:
	fpack32	%f24,	%f26,	%f10
	move	%xcc,	%o6,	%g3
loop_2334:
	tg	%xcc,	0x6
	subc	%o4,	0x10D8,	%o1
	andn	%l0,	%o5,	%l2
	movle	%icc,	%i6,	%i3
	fmovsne	%xcc,	%f15,	%f2
	bneg	%xcc,	loop_2335
	lduw	[%l7 + 0x44],	%g6
	addccc	%g5,	%i2,	%i0
	fnot2	%f20,	%f10
loop_2335:
	brgez	%i5,	loop_2336
	smul	%g7,	%i7,	%g4
	call	loop_2337
	edge32	%o3,	%g1,	%l5
loop_2336:
	bne,a,pt	%icc,	loop_2338
	fmovdne	%xcc,	%f26,	%f28
loop_2337:
	nop
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x15,	%f16
loop_2338:
	nop
	set	0x44, %o1
	lda	[%l7 + %o1] 0x14,	%f24
	edge16l	%o0,	%i1,	%g2
	edge32	%i4,	%o7,	%l3
	sdivcc	%l4,	0x0DFF,	%o2
	tvs	%icc,	0x6
	tl	%xcc,	0x0
	ldsw	[%l7 + 0x5C],	%l6
	movvc	%xcc,	%o6,	%g3
	mulx	%o4,	0x03C8,	%l1
	fmovdne	%xcc,	%f16,	%f14
	bneg,a	%xcc,	loop_2339
	mulx	%o1,	%l0,	%l2
	fmul8x16al	%f3,	%f21,	%f8
	set	0x19, %g7
	ldsba	[%l7 + %g7] 0x18,	%i6
loop_2339:
	fbn,a	%fcc1,	loop_2340
	smulcc	%o5,	0x1A1C,	%i3
	tsubcc	%g6,	0x16EE,	%i2
	fmovdn	%icc,	%f25,	%f16
loop_2340:
	edge8n	%g5,	%i0,	%i5
	set	0x38, %l2
	lda	[%l7 + %l2] 0x89,	%f6
	sub	%i7,	0x0A81,	%g7
	tvc	%xcc,	0x4
	set	0x48, %g6
	lduwa	[%l7 + %g6] 0x89,	%o3
	xnorcc	%g1,	%g4,	%o0
	edge16	%i1,	%g2,	%i4
	fmovse	%icc,	%f29,	%f23
	smul	%l5,	%l3,	%o7
	edge16l	%l4,	%l6,	%o2
	brgz	%g3,	loop_2341
	fbuge	%fcc3,	loop_2342
	stb	%o6,	[%l7 + 0x19]
	tg	%xcc,	0x0
loop_2341:
	nop
	set	0x46, %o6
	sth	%l1,	[%l7 + %o6]
loop_2342:
	fcmpeq32	%f16,	%f6,	%o1
	edge32ln	%l0,	%o4,	%i6
	ldstub	[%l7 + 0x0F],	%o5
	alignaddrl	%l2,	%i3,	%g6
	taddcctv	%g5,	0x040F,	%i0
	stw	%i5,	[%l7 + 0x68]
	movpos	%xcc,	%i2,	%i7
	sll	%o3,	%g1,	%g7
	movneg	%xcc,	%g4,	%o0
	for	%f24,	%f28,	%f26
	umul	%g2,	%i4,	%i1
	addccc	%l3,	0x050B,	%o7
	or	%l5,	%l4,	%l6
	sethi	0x0954,	%o2
	alignaddr	%g3,	%o6,	%o1
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x80,	%l0
	bl	loop_2343
	edge32l	%o4,	%l1,	%i6
	addcc	%l2,	0x02B8,	%o5
	fmovdvs	%icc,	%f12,	%f8
loop_2343:
	tne	%icc,	0x7
	umulcc	%g6,	0x16F2,	%i3
	siam	0x3
	fabsd	%f20,	%f18
	alignaddrl	%i0,	%i5,	%g5
	ta	%icc,	0x5
	alignaddr	%i7,	%o3,	%g1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%g7
	fbue,a	%fcc3,	loop_2344
	fbl	%fcc1,	loop_2345
	tsubcc	%o0,	%g2,	%i4
	bvc	loop_2346
loop_2344:
	andcc	%i1,	0x098A,	%l3
loop_2345:
	fcmple32	%f6,	%f14,	%g4
	fmovrdlez	%o7,	%f14,	%f6
loop_2346:
	edge32ln	%l5,	%l6,	%o2
	umul	%g3,	%l4,	%o6
	brlez	%o1,	loop_2347
	fxnors	%f14,	%f27,	%f28
	tleu	%icc,	0x6
	st	%f28,	[%l7 + 0x50]
loop_2347:
	fnegs	%f15,	%f24
	sra	%l0,	0x06,	%l1
	fmovrse	%i6,	%f22,	%f17
	fsrc1s	%f0,	%f7
	fmovda	%icc,	%f30,	%f26
	xor	%o4,	0x0391,	%o5
	fmovrsgz	%l2,	%f14,	%f3
	pdist	%f14,	%f4,	%f26
	movrgez	%g6,	0x085,	%i3
	brnz	%i5,	loop_2348
	edge16	%g5,	%i7,	%o3
	tcc	%icc,	0x5
	movvc	%xcc,	%g1,	%i2
loop_2348:
	fbuge	%fcc1,	loop_2349
	ldsb	[%l7 + 0x1A],	%g7
	fmovscs	%xcc,	%f23,	%f30
	edge8ln	%o0,	%g2,	%i4
loop_2349:
	addcc	%i0,	0x00D0,	%i1
	xorcc	%g4,	%l3,	%o7
	movrgez	%l6,	0x041,	%l5
	udivx	%g3,	0x1492,	%l4
	fmovrsne	%o2,	%f10,	%f4
	fmovdle	%xcc,	%f13,	%f15
	movge	%icc,	%o6,	%l0
	edge16n	%o1,	%l1,	%i6
	fmovscs	%xcc,	%f13,	%f9
	sra	%o5,	%o4,	%g6
	tcc	%icc,	0x0
	sllx	%i3,	0x11,	%l2
	tn	%icc,	0x1
	edge8l	%i5,	%g5,	%i7
	movrgez	%g1,	0x16C,	%i2
	taddcctv	%o3,	0x111A,	%g7
	fxnor	%f10,	%f22,	%f10
	edge8l	%g2,	%i4,	%o0
	sdiv	%i1,	0x087A,	%g4
	fandnot1s	%f5,	%f25,	%f18
	edge16n	%l3,	%i0,	%o7
	movrgez	%l5,	0x2EA,	%g3
	membar	0x53
	subc	%l6,	%o2,	%l4
	fpack32	%f20,	%f4,	%f24
	fmovsvc	%xcc,	%f23,	%f15
	bcs	%icc,	loop_2350
	addcc	%l0,	0x1E25,	%o6
	fmovdcs	%xcc,	%f4,	%f18
	fmovsl	%xcc,	%f27,	%f15
loop_2350:
	tsubcctv	%o1,	0x058E,	%l1
	fpack32	%f14,	%f26,	%f28
	swap	[%l7 + 0x10],	%i6
	subccc	%o4,	%o5,	%i3
	xor	%g6,	%i5,	%g5
	tl	%icc,	0x0
	tvs	%icc,	0x3
	tle	%icc,	0x2
	bleu,a	loop_2351
	movrne	%l2,	0x023,	%i7
	alignaddrl	%g1,	%i2,	%g7
	fpackfix	%f4,	%f2
loop_2351:
	and	%g2,	%i4,	%o0
	orn	%i1,	0x0684,	%o3
	edge32	%l3,	%i0,	%g4
	tsubcctv	%l5,	0x0387,	%g3
	subcc	%o7,	%l6,	%l4
	edge8n	%l0,	%o2,	%o6
	tge	%xcc,	0x1
	fandnot2s	%f25,	%f27,	%f15
	fbul	%fcc1,	loop_2352
	sub	%l1,	0x143A,	%o1
	tne	%icc,	0x7
	tne	%xcc,	0x4
loop_2352:
	taddcctv	%i6,	0x14D6,	%o5
	nop
	setx loop_2353, %l0, %l1
	jmpl %l1, %i3
	movrgez	%g6,	0x297,	%o4
	fmovdl	%icc,	%f23,	%f28
	set	0x30, %i4
	ldsha	[%l7 + %i4] 0x14,	%g5
loop_2353:
	nop
	setx	loop_2354,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%l2,	0x1B6B,	%i7
	sth	%i5,	[%l7 + 0x44]
	udivx	%g1,	0x104B,	%i2
loop_2354:
	sethi	0x0E68,	%g2
	tpos	%icc,	0x0
	ldsw	[%l7 + 0x68],	%g7
	move	%xcc,	%i4,	%i1
	umul	%o3,	%l3,	%o0
	srax	%i0,	0x0C,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs	loop_2355
	umul	%g3,	0x15E0,	%g4
	edge32n	%o7,	%l6,	%l0
	array16	%o2,	%o6,	%l1
loop_2355:
	tcs	%icc,	0x6
	xor	%o1,	%l4,	%o5
	ldsh	[%l7 + 0x6A],	%i6
	membar	0x10
	smul	%g6,	%i3,	%g5
	movne	%icc,	%o4,	%i7
	brz,a	%l2,	loop_2356
	tl	%xcc,	0x6
	tleu	%xcc,	0x0
	nop
	set	0x0D, %l3
	ldsb	[%l7 + %l3],	%g1
loop_2356:
	nop
	wr	%g0,	0x22,	%asi
	stda	%i4,	[%l7 + 0x10] %asi
	membar	#Sync
	array32	%g2,	%i2,	%g7
	set	0x74, %g1
	stba	%i4,	[%l7 + %g1] 0x15
	alignaddrl	%o3,	%i1,	%l3
	edge8l	%i0,	%l5,	%g3
	fones	%f12
	fabss	%f22,	%f14
	and	%o0,	0x0DFD,	%o7
	fones	%f3
	set	0x7D, %g3
	ldstuba	[%l7 + %g3] 0x19,	%g4
	fbe	%fcc0,	loop_2357
	fmovda	%icc,	%f20,	%f6
	fnot1	%f22,	%f4
	edge32n	%l6,	%l0,	%o2
loop_2357:
	edge16ln	%l1,	%o1,	%l4
	mova	%icc,	%o6,	%o5
	fandnot2	%f10,	%f22,	%f22
	movleu	%xcc,	%i6,	%i3
	or	%g5,	0x1847,	%g6
	movrgz	%o4,	0x2AC,	%i7
	movcc	%icc,	%l2,	%g1
	andn	%g2,	0x1D5E,	%i5
	andn	%g7,	%i2,	%i4
	bpos,pn	%xcc,	loop_2358
	edge8l	%o3,	%l3,	%i1
	srlx	%i0,	%l5,	%o0
	tcs	%xcc,	0x3
loop_2358:
	subccc	%g3,	0x177A,	%o7
	edge16ln	%l6,	%l0,	%o2
	set	0x48, %l4
	stha	%l1,	[%l7 + %l4] 0x14
	bgu,a,pn	%xcc,	loop_2359
	movleu	%xcc,	%o1,	%l4
	sdivcc	%o6,	0x11E7,	%g4
	movne	%icc,	%i6,	%o5
loop_2359:
	movge	%xcc,	%i3,	%g5
	fmovsle	%icc,	%f8,	%f3
	ba,pn	%icc,	loop_2360
	tsubcc	%g6,	0x13D8,	%i7
	brz	%l2,	loop_2361
	fmovrdlz	%o4,	%f10,	%f30
loop_2360:
	orcc	%g2,	0x1024,	%g1
	fmovrsgez	%i5,	%f20,	%f26
loop_2361:
	xnor	%i2,	0x1BCF,	%i4
	ldd	[%l7 + 0x28],	%f22
	movg	%xcc,	%o3,	%l3
	tvs	%icc,	0x5
	st	%f4,	[%l7 + 0x4C]
	fornot2	%f20,	%f28,	%f24
	fbue,a	%fcc3,	loop_2362
	mulx	%i1,	%i0,	%g7
	andcc	%o0,	0x079E,	%g3
	movn	%xcc,	%o7,	%l6
loop_2362:
	sth	%l5,	[%l7 + 0x2A]
	fmovrsne	%l0,	%f30,	%f29
	fmovsg	%xcc,	%f26,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pt	%xcc,	loop_2363
	edge8l	%l1,	%o1,	%o2
	ldstub	[%l7 + 0x4E],	%l4
	stbar
loop_2363:
	fandnot2	%f16,	%f14,	%f30
	addccc	%g4,	%o6,	%o5
	udivx	%i3,	0x1E3F,	%g5
	fbue,a	%fcc2,	loop_2364
	tgu	%icc,	0x3
	bne,pt	%xcc,	loop_2365
	tsubcctv	%i6,	0x1EB2,	%i7
loop_2364:
	fmovrdlz	%g6,	%f18,	%f12
	bcc,a,pn	%icc,	loop_2366
loop_2365:
	umulcc	%l2,	0x0196,	%g2
	fmovscc	%xcc,	%f8,	%f21
	and	%g1,	0x0D22,	%o4
loop_2366:
	addccc	%i2,	0x16D6,	%i4
	stw	%o3,	[%l7 + 0x74]
	fornot1	%f10,	%f6,	%f18
	srl	%i5,	%i1,	%i0
	fsrc2s	%f3,	%f13
	fbug	%fcc3,	loop_2367
	fbuge,a	%fcc1,	loop_2368
	movleu	%xcc,	%g7,	%l3
	tn	%xcc,	0x4
loop_2367:
	edge16ln	%g3,	%o7,	%l6
loop_2368:
	addc	%l5,	%l0,	%o0
	fmovrse	%o1,	%f7,	%f13
	fabss	%f10,	%f16
	movvs	%xcc,	%o2,	%l1
	fcmped	%fcc2,	%f14,	%f2
	or	%g4,	0x03CC,	%l4
	fbg,a	%fcc0,	loop_2369
	sra	%o6,	%o5,	%i3
	sra	%i6,	0x01,	%i7
	alignaddr	%g6,	%l2,	%g5
loop_2369:
	te	%xcc,	0x0
	fbn,a	%fcc0,	loop_2370
	movg	%xcc,	%g1,	%g2
	ldd	[%l7 + 0x50],	%o4
	set	0x5E, %l0
	ldsha	[%l7 + %l0] 0x10,	%i2
loop_2370:
	sllx	%o3,	0x03,	%i5
	bgu,pn	%icc,	loop_2371
	tn	%icc,	0x4
	smul	%i4,	%i1,	%i0
	movrlez	%g7,	0x0E7,	%g3
loop_2371:
	srax	%o7,	%l3,	%l5
	mulscc	%l6,	0x1A30,	%l0
	bcc,a,pn	%icc,	loop_2372
	sll	%o1,	%o0,	%l1
	movn	%xcc,	%g4,	%l4
	fmovsle	%icc,	%f2,	%f17
loop_2372:
	nop
	set	0x7C, %l5
	stba	%o2,	[%l7 + %l5] 0x04
	call	loop_2373
	tgu	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o6,	%i3
loop_2373:
	orncc	%i6,	%i7,	%g6
	fba	%fcc3,	loop_2374
	tn	%icc,	0x4
	fbg	%fcc3,	loop_2375
	edge32n	%l2,	%o5,	%g1
loop_2374:
	movrlz	%g5,	0x0E7,	%o4
	movvc	%xcc,	%g2,	%i2
loop_2375:
	mulx	%o3,	%i4,	%i5
	fbue	%fcc3,	loop_2376
	movne	%xcc,	%i1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%g3,	loop_2377
loop_2376:
	mova	%icc,	%o7,	%l3
	bgu,a,pn	%xcc,	loop_2378
	smulcc	%l5,	0x12F9,	%l6
loop_2377:
	xnor	%g7,	%l0,	%o0
	fmovsvc	%xcc,	%f17,	%f10
loop_2378:
	tneg	%icc,	0x6
	fornot1	%f0,	%f20,	%f24
	tg	%xcc,	0x1
	fpsub32s	%f11,	%f30,	%f24
	tleu	%xcc,	0x3
	edge16n	%o1,	%l1,	%l4
	fmovdleu	%icc,	%f28,	%f22
	move	%icc,	%g4,	%o2
	addccc	%o6,	0x0D33,	%i3
	srl	%i7,	%g6,	%l2
	edge16	%i6,	%o5,	%g1
	sll	%o4,	%g2,	%g5
	fbe	%fcc1,	loop_2379
	edge32l	%i2,	%i4,	%o3
	movrgz	%i1,	%i5,	%i0
	movgu	%icc,	%g3,	%o7
loop_2379:
	umulcc	%l5,	%l6,	%l3
	sdiv	%g7,	0x1141,	%l0
	set	0x58, %g5
	stxa	%o1,	[%l7 + %g5] 0x22
	membar	#Sync
	ta	%icc,	0x1
	wr	%g0,	0x88,	%asi
	stda	%o0,	[%l7 + 0x60] %asi
	fnot2	%f14,	%f12
	array32	%l1,	%g4,	%l4
	movrne	%o6,	0x2D0,	%o2
	fpadd32s	%f14,	%f24,	%f14
	nop
	setx	loop_2380,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%xcc,	%i7,	%i3
	stb	%g6,	[%l7 + 0x22]
	swap	[%l7 + 0x74],	%i6
loop_2380:
	brlz,a	%o5,	loop_2381
	fmovdcc	%xcc,	%f18,	%f24
	fmovdleu	%xcc,	%f5,	%f8
	edge8l	%l2,	%g1,	%o4
loop_2381:
	andncc	%g5,	%g2,	%i2
	sdivcc	%i4,	0x0172,	%o3
	lduh	[%l7 + 0x0A],	%i1
	fmovdpos	%xcc,	%f27,	%f2
	fmovsneg	%xcc,	%f12,	%f4
	and	%i5,	%g3,	%o7
	movne	%icc,	%l5,	%i0
	tsubcc	%l6,	%g7,	%l3
	edge16	%l0,	%o1,	%l1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x18] %asi,	%o0
	tle	%icc,	0x2
	movpos	%xcc,	%g4,	%l4
	xorcc	%o2,	%i7,	%o6
	swap	[%l7 + 0x28],	%g6
	movrne	%i6,	%i3,	%l2
	fsrc2	%f10,	%f6
	move	%icc,	%g1,	%o5
	tl	%icc,	0x7
	te	%xcc,	0x5
	movrgez	%o4,	0x0C8,	%g5
	andcc	%g2,	%i4,	%o3
	tvc	%icc,	0x5
	fcmpeq32	%f8,	%f18,	%i1
	fcmple32	%f8,	%f30,	%i2
	be,a	loop_2382
	edge16	%g3,	%o7,	%l5
	sllx	%i0,	0x11,	%i5
	be,a	%xcc,	loop_2383
loop_2382:
	tvs	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	stha	%l6,	[%l7 + 0x08] %asi
loop_2383:
	bn,pn	%xcc,	loop_2384
	edge8n	%g7,	%l0,	%l3
	fxors	%f7,	%f17,	%f20
	taddcc	%l1,	%o1,	%g4
loop_2384:
	fmovsvc	%xcc,	%f0,	%f24
	brgz,a	%l4,	loop_2385
	edge16l	%o2,	%o0,	%o6
	nop
	setx	loop_2386,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%i7,	0x16,	%i6
loop_2385:
	fmovdcc	%xcc,	%f20,	%f5
	andncc	%g6,	%l2,	%g1
loop_2386:
	bpos,a,pn	%icc,	loop_2387
	udiv	%o5,	0x1420,	%i3
	umulcc	%o4,	%g5,	%i4
	fnegd	%f16,	%f28
loop_2387:
	fpadd32	%f18,	%f12,	%f20
	edge16	%g2,	%o3,	%i1
	brgz	%g3,	loop_2388
	tl	%icc,	0x5
	bleu,a,pt	%icc,	loop_2389
	alignaddrl	%o7,	%l5,	%i0
loop_2388:
	subc	%i2,	%i5,	%l6
	fandnot2s	%f25,	%f20,	%f27
loop_2389:
	subcc	%g7,	0x05B0,	%l0
	fbne,a	%fcc3,	loop_2390
	orn	%l1,	0x0B29,	%l3
	fpack16	%f12,	%f9
	array8	%o1,	%l4,	%o2
loop_2390:
	fbn	%fcc3,	loop_2391
	sub	%o0,	0x1811,	%g4
	taddcctv	%i7,	0x1376,	%i6
	tvs	%icc,	0x3
loop_2391:
	fcmpd	%fcc3,	%f20,	%f12
	bl	loop_2392
	st	%f14,	[%l7 + 0x4C]
	smulcc	%o6,	0x194D,	%l2
	udiv	%g6,	0x00BF,	%o5
loop_2392:
	srlx	%g1,	%i3,	%g5
	movre	%i4,	0x245,	%o4
	sdivx	%g2,	0x1BBC,	%i1
	sllx	%g3,	%o7,	%l5
	fblg,a	%fcc1,	loop_2393
	movrne	%i0,	%o3,	%i5
	edge32n	%l6,	%g7,	%l0
	movn	%icc,	%i2,	%l3
loop_2393:
	fbn	%fcc3,	loop_2394
	and	%o1,	%l1,	%o2
	mova	%icc,	%o0,	%g4
	alignaddrl	%l4,	%i6,	%i7
loop_2394:
	stbar
	movrgez	%o6,	%g6,	%l2
	fcmpgt16	%f8,	%f10,	%g1
	edge32ln	%i3,	%g5,	%o5
	fbge	%fcc2,	loop_2395
	movrlz	%o4,	%g2,	%i1
	st	%f16,	[%l7 + 0x5C]
	movl	%icc,	%g3,	%i4
loop_2395:
	movrlz	%l5,	0x184,	%o7
	sethi	0x100D,	%o3
	movle	%icc,	%i5,	%i0
	fone	%f4
	fnot2	%f8,	%f26
	fmovrse	%g7,	%f27,	%f9
	alignaddrl	%l0,	%i2,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x20, %o0
	stwa	%o1,	[%l7 + %o0] 0xe3
	membar	#Sync
	bne,a	loop_2396
	fmovrsgez	%l1,	%f12,	%f30
	edge32n	%o2,	%l3,	%o0
	fnegd	%f12,	%f24
loop_2396:
	edge32n	%l4,	%g4,	%i7
	fors	%f8,	%f19,	%f25
	subc	%o6,	%i6,	%l2
	xorcc	%g6,	%i3,	%g5
	tgu	%xcc,	0x1
	umul	%o5,	0x05F6,	%o4
	swap	[%l7 + 0x48],	%g2
	edge8ln	%i1,	%g3,	%i4
	set	0x20, %o7
	swapa	[%l7 + %o7] 0x81,	%g1
	swap	[%l7 + 0x14],	%o7
	fxor	%f2,	%f20,	%f20
	addc	%o3,	0x13B2,	%l5
	andncc	%i5,	%i0,	%l0
	edge32	%g7,	%i2,	%l6
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x54] %asi,	%l1
	fmovdle	%icc,	%f30,	%f23
	udivx	%o2,	0x11C6,	%o1
	set	0x38, %o2
	sta	%f6,	[%l7 + %o2] 0x80
	set	0x10, %i5
	stxa	%l3,	[%l7 + %i5] 0x2b
	membar	#Sync
	tpos	%xcc,	0x0
	umulcc	%l4,	0x00CA,	%g4
	movrgez	%o0,	0x1C6,	%o6
	tcc	%xcc,	0x4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%i6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x69] %asi,	%g6
	movrgez	%i3,	%g5,	%l2
	fmovspos	%icc,	%f24,	%f17
	srlx	%o5,	0x15,	%g2
	fnot1s	%f20,	%f22
	movl	%xcc,	%o4,	%i1
	fpack16	%f4,	%f4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x2C] %asi,	%f31
	fmovsneg	%xcc,	%f8,	%f5
	sll	%i4,	0x13,	%g3
	tpos	%xcc,	0x7
	bg,pn	%icc,	loop_2397
	fmovsle	%xcc,	%f15,	%f11
	fxor	%f28,	%f22,	%f22
	edge32ln	%g1,	%o7,	%l5
loop_2397:
	movn	%icc,	%o3,	%i0
	for	%f0,	%f2,	%f22
	add	%i5,	%g7,	%l0
	for	%f26,	%f30,	%f22
	be,pn	%icc,	loop_2398
	fmovdge	%icc,	%f19,	%f13
	subccc	%l6,	0x05A1,	%l1
	edge8	%o2,	%i2,	%o1
loop_2398:
	fba	%fcc1,	loop_2399
	membar	0x3F
	fcmple16	%f4,	%f20,	%l3
	set	0x38, %l1
	lduha	[%l7 + %l1] 0x88,	%l4
loop_2399:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f22,	%f2
	fbule	%fcc2,	loop_2400
	fble	%fcc3,	loop_2401
	tpos	%xcc,	0x7
	fbl,a	%fcc0,	loop_2402
loop_2400:
	fmovdcc	%xcc,	%f27,	%f14
loop_2401:
	edge8l	%g4,	%o6,	%o0
	edge8	%i6,	%g6,	%i3
loop_2402:
	movn	%xcc,	%i7,	%l2
	sir	0x0A21
	tvs	%xcc,	0x2
	brgez	%o5,	loop_2403
	movrgez	%g2,	0x2AE,	%g5
	or	%o4,	0x04AF,	%i4
	movrgez	%g3,	%i1,	%g1
loop_2403:
	fxnors	%f4,	%f16,	%f9
	xnorcc	%l5,	0x1EAE,	%o3
	fpsub16	%f12,	%f22,	%f22
	edge8ln	%i0,	%o7,	%g7
	nop
	set	0x50, %i7
	lduh	[%l7 + %i7],	%l0
	set	0x08, %g2
	stda	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	edge16l	%l1,	%l6,	%i2
	alignaddr	%o2,	%o1,	%l4
	fmovsa	%xcc,	%f14,	%f0
	edge32	%l3,	%o6,	%g4
	ldub	[%l7 + 0x37],	%o0
	stx	%g6,	[%l7 + 0x28]
	bcc,a	loop_2404
	edge16ln	%i6,	%i3,	%l2
	movpos	%icc,	%o5,	%g2
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
loop_2404:
	sdivcc	%o4,	0x1632,	%i4
	ldd	[%l7 + 0x20],	%f18
	fmovrsne	%g3,	%f25,	%f28
	array16	%g5,	%i1,	%g1
	movre	%o3,	%i0,	%l5
	fcmps	%fcc0,	%f13,	%f10
	set	0x24, %i1
	lduwa	[%l7 + %i1] 0x18,	%g7
	fbug	%fcc0,	loop_2405
	xor	%o7,	0x0074,	%i5
	edge32ln	%l1,	%l0,	%l6
	umul	%i2,	0x10EF,	%o1
loop_2405:
	addccc	%l4,	0x0E68,	%l3
	array32	%o6,	%o2,	%o0
	membar	0x5B
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
	fbu	%fcc2,	loop_2407
	brgez,a	%g6,	loop_2408
	fbo,a	%fcc0,	loop_2409
loop_2406:
	fcmpes	%fcc1,	%f31,	%f6
loop_2407:
	call	loop_2410
loop_2408:
	or	%i6,	0x14FA,	%g4
loop_2409:
	nop
	setx	loop_2411,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%xcc,	%i3,	%l2
loop_2410:
	fpsub32s	%f2,	%f3,	%f22
	srl	%g2,	%i7,	%o5
loop_2411:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f27,	%f21,	%f14
	fexpand	%f27,	%f12
	udivcc	%i4,	0x0969,	%g3
	srax	%o4,	0x10,	%g5
	srax	%g1,	0x03,	%i1
	udivx	%i0,	0x0EBE,	%o3
	array16	%g7,	%l5,	%i5
	fmovrslz	%o7,	%f11,	%f22
	tcc	%icc,	0x2
	fbul	%fcc0,	loop_2412
	mulx	%l0,	%l1,	%i2
	tvs	%xcc,	0x7
	fbe,a	%fcc0,	loop_2413
loop_2412:
	movge	%icc,	%l6,	%o1
	fmovdneg	%xcc,	%f6,	%f20
	smul	%l3,	0x1F80,	%o6
loop_2413:
	fbug,a	%fcc3,	loop_2414
	fnand	%f2,	%f8,	%f16
	edge16l	%o2,	%o0,	%g6
	xorcc	%i6,	%g4,	%i3
loop_2414:
	sra	%l2,	0x06,	%g2
	mova	%xcc,	%i7,	%o5
	xorcc	%i4,	0x12AC,	%g3
	tsubcc	%l4,	0x047B,	%g5
	edge32l	%o4,	%i1,	%i0
	edge8l	%o3,	%g7,	%g1
	taddcctv	%l5,	%o7,	%l0
	edge32l	%l1,	%i5,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f6,	%f27
	tsubcc	%l6,	0x0544,	%o1
	fbe,a	%fcc1,	loop_2415
	fbe,a	%fcc0,	loop_2416
	taddcc	%l3,	%o2,	%o0
	siam	0x3
loop_2415:
	ldsw	[%l7 + 0x3C],	%o6
loop_2416:
	tleu	%xcc,	0x0
	lduw	[%l7 + 0x2C],	%i6
	edge8	%g6,	%g4,	%i3
	fmovse	%xcc,	%f9,	%f29
	sub	%l2,	0x0EF6,	%g2
	fnot1s	%f17,	%f11
	fmovrdlez	%o5,	%f0,	%f8
	brgez,a	%i4,	loop_2417
	fmovdpos	%xcc,	%f13,	%f17
	edge16n	%g3,	%l4,	%i7
	fba,a	%fcc1,	loop_2418
loop_2417:
	movl	%xcc,	%o4,	%g5
	move	%xcc,	%i1,	%o3
	subccc	%g7,	0x1FE3,	%g1
loop_2418:
	nop
	set	0x50, %i2
	lduba	[%l7 + %i2] 0x80,	%l5
	movgu	%xcc,	%i0,	%o7
	udivx	%l0,	0x1663,	%i5
	fcmped	%fcc1,	%f24,	%f10
	fpsub16s	%f11,	%f13,	%f17
	movre	%i2,	0x258,	%l6
	movrlez	%o1,	0x17C,	%l3
	fmovdneg	%xcc,	%f30,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o2,	0x026E,	%o0
	sub	%l1,	%i6,	%o6
	array8	%g4,	%g6,	%i3
	fmovsneg	%xcc,	%f31,	%f16
	std	%l2,	[%l7 + 0x10]
	fpadd32	%f8,	%f28,	%f8
	movvs	%xcc,	%o5,	%i4
	fmovde	%icc,	%f20,	%f10
	nop
	set	0x25, %i0
	ldub	[%l7 + %i0],	%g2
	umulcc	%g3,	0x07E4,	%i7
	fsrc2	%f20,	%f14
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x52] %asi,	%l4
	mulscc	%g5,	%i1,	%o4
	tpos	%xcc,	0x7
	std	%g6,	[%l7 + 0x48]
	movrlez	%o3,	%l5,	%g1
	movge	%xcc,	%i0,	%o7
	fble	%fcc3,	loop_2419
	tge	%xcc,	0x6
	movle	%xcc,	%l0,	%i5
	membar	0x12
loop_2419:
	fnor	%f12,	%f24,	%f8
	fbn,a	%fcc2,	loop_2420
	fmovdvs	%xcc,	%f21,	%f20
	fand	%f0,	%f14,	%f24
	udiv	%i2,	0x1984,	%l6
loop_2420:
	fandnot2	%f20,	%f2,	%f14
	tvc	%xcc,	0x2
	movrlez	%l3,	%o2,	%o1
	udivcc	%l1,	0x0BD7,	%i6
	movl	%xcc,	%o0,	%g4
	orcc	%g6,	%i3,	%o6
	fmovrsne	%l2,	%f6,	%f29
	fba	%fcc1,	loop_2421
	fbue,a	%fcc0,	loop_2422
	fnot1s	%f31,	%f17
	udivx	%i4,	0x043B,	%o5
loop_2421:
	bne	%icc,	loop_2423
loop_2422:
	add	%g3,	%i7,	%g2
	fcmple16	%f28,	%f28,	%l4
	tvs	%xcc,	0x0
loop_2423:
	movleu	%icc,	%g5,	%i1
	movge	%xcc,	%g7,	%o3
	udivcc	%o4,	0x1D48,	%l5
	fmovdgu	%icc,	%f23,	%f6
	brgez,a	%i0,	loop_2424
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pt	%icc,	loop_2425
	sdivcc	%o7,	0x1022,	%g1
loop_2424:
	tvc	%icc,	0x7
	fmovsg	%xcc,	%f18,	%f12
loop_2425:
	tg	%xcc,	0x2
	andn	%i5,	%l0,	%l6
	orn	%l3,	0x0C96,	%i2
	fbue,a	%fcc2,	loop_2426
	xnor	%o1,	%l1,	%i6
	mulx	%o2,	0x0AF6,	%g4
	set	0x80, %i6
	ldxa	[%g0 + %i6] 0x58,	%o0
loop_2426:
	tpos	%xcc,	0x7
	movl	%xcc,	%g6,	%i3
	orncc	%o6,	%l2,	%o5
	movleu	%xcc,	%g3,	%i4
	fpsub16s	%f27,	%f7,	%f19
	fmovsneg	%xcc,	%f26,	%f20
	edge8ln	%i7,	%g2,	%l4
	fzeros	%f30
	movvc	%xcc,	%i1,	%g7
	movgu	%xcc,	%o3,	%o4
	edge16	%g5,	%i0,	%l5
	andn	%g1,	%i5,	%l0
	siam	0x1
	edge8ln	%o7,	%l6,	%l3
	udivx	%o1,	0x1D47,	%i2
	movvs	%icc,	%i6,	%l1
	prefetch	[%l7 + 0x6C],	 0x2
	ba,a,pn	%xcc,	loop_2427
	edge32n	%o2,	%g4,	%g6
	nop
	set	0x44, %o3
	sth	%o0,	[%l7 + %o3]
	movle	%xcc,	%o6,	%i3
loop_2427:
	ta	%xcc,	0x2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o5,	%g3
	udivcc	%l2,	0x10C7,	%i7
	tcs	%icc,	0x5
	srl	%g2,	%i4,	%i1
	sdivcc	%g7,	0x1440,	%l4
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	stb	%o3,	[%l7 + 0x58]
	fmovse	%xcc,	%f19,	%f1
	movle	%icc,	%o4,	%i0
	andn	%l5,	%g1,	%i5
	umul	%l0,	%o7,	%g5
	and	%l3,	0x0916,	%l6
	tn	%xcc,	0x3
	te	%icc,	0x2
	tl	%xcc,	0x0
	movl	%icc,	%i2,	%i6
	set	0x70, %o4
	sta	%f16,	[%l7 + %o4] 0x15
	sth	%l1,	[%l7 + 0x66]
	siam	0x6
	fsrc1s	%f3,	%f31
	edge8ln	%o2,	%g4,	%o1
	smulcc	%g6,	0x1F33,	%o0
	fmul8x16au	%f17,	%f29,	%f0
	fmul8x16au	%f5,	%f7,	%f2
	fmovdg	%xcc,	%f25,	%f19
	sir	0x0914
	fnegd	%f10,	%f4
	fsrc1s	%f24,	%f7
	tge	%xcc,	0x1
	fpadd32s	%f6,	%f28,	%f5
	pdist	%f14,	%f12,	%f12
	addc	%o6,	%o5,	%i3
	xnorcc	%l2,	%g3,	%i7
	movvc	%icc,	%i4,	%g2
	movle	%xcc,	%i1,	%g7
	movvs	%icc,	%o3,	%l4
	bcc,pn	%icc,	loop_2428
	edge16	%i0,	%l5,	%o4
	fmovsvc	%icc,	%f23,	%f0
	xnorcc	%g1,	0x11DE,	%i5
loop_2428:
	addccc	%l0,	0x10D4,	%o7
	mulx	%l3,	%g5,	%l6
	alignaddr	%i2,	%l1,	%i6
	popc	%o2,	%g4
	tleu	%icc,	0x7
	orcc	%o1,	%o0,	%g6
	fpadd32	%f26,	%f26,	%f22
	movneg	%icc,	%o6,	%o5
	taddcctv	%i3,	0x17BF,	%l2
	mulx	%g3,	%i4,	%i7
	edge8	%g2,	%i1,	%o3
	membar	0x2F
	brlez,a	%l4,	loop_2429
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%i0
	edge16n	%l5,	%o4,	%g7
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
loop_2429:
	tsubcc	%i5,	0x0851,	%o7
	movrgz	%l0,	0x074,	%g5
	edge8l	%l6,	%i2,	%l3
	fmovdg	%icc,	%f13,	%f26
	brlz,a	%l1,	loop_2430
	tcc	%xcc,	0x6
	andcc	%i6,	%o2,	%o1
	edge32ln	%o0,	%g6,	%g4
loop_2430:
	tneg	%icc,	0x1
	movrlez	%o6,	0x131,	%i3
	move	%xcc,	%l2,	%g3
	movrlez	%o5,	0x190,	%i7
	and	%g2,	%i4,	%o3
	fzeros	%f30
	movrne	%l4,	%i1,	%l5
	bpos,pn	%icc,	loop_2431
	sdivcc	%i0,	0x0955,	%g7
	addccc	%o4,	%i5,	%g1
	alignaddr	%o7,	%l0,	%g5
loop_2431:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%l6,	[%l7 + 0x38] %asi
	movneg	%xcc,	%l3,	%l1
	andcc	%i6,	0x05FC,	%i2
	movneg	%xcc,	%o1,	%o2
	fmovdpos	%xcc,	%f11,	%f0
	orncc	%o0,	%g4,	%g6
	umul	%i3,	0x0EB1,	%l2
	fmovscc	%xcc,	%f15,	%f25
	set	0x58, %l6
	lda	[%l7 + %l6] 0x14,	%f26
	edge16l	%g3,	%o6,	%i7
	array32	%o5,	%i4,	%o3
	umul	%g2,	0x086B,	%l4
	andncc	%i1,	%l5,	%i0
	movcs	%icc,	%o4,	%i5
	fbne	%fcc3,	loop_2432
	movne	%xcc,	%g1,	%o7
	tvs	%icc,	0x3
	udivcc	%l0,	0x191A,	%g7
loop_2432:
	array16	%l6,	%g5,	%l1
	set	0x0C, %i3
	lda	[%l7 + %i3] 0x89,	%f22
	fmovda	%xcc,	%f1,	%f20
	wr	%g0,	0x0c,	%asi
	sta	%f28,	[%l7 + 0x20] %asi
	subc	%l3,	0x0DE6,	%i6
	tneg	%xcc,	0x1
	andncc	%o1,	%o2,	%o0
	smul	%i2,	0x1255,	%g4
	brnz	%i3,	loop_2433
	edge32ln	%g6,	%g3,	%o6
	orn	%l2,	%o5,	%i4
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
loop_2433:
	xnor	%g2,	0x02E2,	%i7
	ldd	[%l7 + 0x48],	%f20
	tleu	%icc,	0x2
	mova	%xcc,	%l4,	%i1
	umulcc	%i0,	%l5,	%i5
	fxors	%f17,	%f23,	%f16
	move	%icc,	%g1,	%o7
	sll	%o4,	0x1B,	%l0
	fmovdvc	%xcc,	%f17,	%f12
	edge32l	%l6,	%g7,	%g5
	add	%l3,	0x05BD,	%i6
	umulcc	%o1,	0x1236,	%o2
	sra	%l1,	%o0,	%g4
	edge16n	%i3,	%g6,	%g3
	fbo,a	%fcc3,	loop_2434
	fcmped	%fcc1,	%f4,	%f2
	faligndata	%f4,	%f2,	%f4
	movcc	%xcc,	%o6,	%l2
loop_2434:
	tneg	%xcc,	0x4
	edge16ln	%o5,	%i2,	%o3
	tcs	%icc,	0x3
	edge32n	%i4,	%g2,	%i7
	addccc	%i1,	%i0,	%l5
	edge8l	%l4,	%g1,	%i5
	tpos	%xcc,	0x7
	fmovscc	%icc,	%f22,	%f18
	tne	%icc,	0x6
	and	%o7,	0x131F,	%o4
	fnor	%f16,	%f28,	%f10
	ld	[%l7 + 0x18],	%f30
	alignaddrl	%l6,	%g7,	%g5
	smul	%l0,	%l3,	%i6
	tle	%xcc,	0x4
	set	0x20, %o1
	lda	[%l7 + %o1] 0x89,	%f13
	bge	loop_2435
	brgz,a	%o2,	loop_2436
	and	%o1,	0x0DF2,	%o0
	fandnot2s	%f0,	%f28,	%f22
loop_2435:
	edge16ln	%l1,	%i3,	%g6
loop_2436:
	fzero	%f4
	ldstub	[%l7 + 0x1B],	%g4
	movvs	%xcc,	%o6,	%g3
	brlz,a	%l2,	loop_2437
	stbar
	bne,a	loop_2438
	mulx	%i2,	%o5,	%o3
loop_2437:
	fcmple32	%f22,	%f16,	%i4
	movg	%xcc,	%g2,	%i1
loop_2438:
	sdiv	%i7,	0x016F,	%i0
	fmuld8sux16	%f25,	%f14,	%f16
	bneg,a,pn	%xcc,	loop_2439
	fmovdpos	%icc,	%f15,	%f25
	fmovdne	%icc,	%f11,	%f13
	movcs	%xcc,	%l4,	%l5
loop_2439:
	movrgz	%i5,	%o7,	%o4
	fmovsleu	%icc,	%f31,	%f4
	flush	%l7 + 0x40
	movrlez	%g1,	%g7,	%g5
	edge32ln	%l6,	%l0,	%i6
	addcc	%l3,	0x10DC,	%o1
	wr	%g0,	0x80,	%asi
	stxa	%o2,	[%l7 + 0x40] %asi
	fbge	%fcc1,	loop_2440
	prefetch	[%l7 + 0x08],	 0x2
	movrne	%o0,	0x2E2,	%l1
	fmovdvc	%icc,	%f21,	%f20
loop_2440:
	brlez	%g6,	loop_2441
	bgu	%icc,	loop_2442
	ta	%icc,	0x0
	fmul8ulx16	%f26,	%f22,	%f30
loop_2441:
	fpmerge	%f21,	%f3,	%f4
loop_2442:
	fcmps	%fcc0,	%f9,	%f17
	fmovsgu	%xcc,	%f13,	%f3
	edge8	%g4,	%i3,	%o6
	movg	%icc,	%l2,	%g3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o5,	%o3
	udiv	%i4,	0x02E9,	%i2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%i7
	fpmerge	%f1,	%f4,	%f6
	movne	%xcc,	%i0,	%l4
	fandnot1	%f26,	%f0,	%f26
	sdivx	%l5,	0x1025,	%i5
	bge,a	loop_2443
	array16	%g2,	%o4,	%g1
	array8	%o7,	%g5,	%l6
	set	0x10, %g7
	stda	%g6,	[%l7 + %g7] 0x88
loop_2443:
	movrlez	%i6,	%l0,	%o1
	sub	%l3,	0x0F92,	%o2
	taddcc	%o0,	0x130E,	%g6
	stb	%l1,	[%l7 + 0x7A]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g4,	%i3
	fcmped	%fcc0,	%f30,	%f30
	smul	%o6,	0x10D4,	%l2
	fcmpeq16	%f22,	%f2,	%g3
	bvc	%icc,	loop_2444
	srlx	%o5,	0x02,	%o3
	edge32	%i4,	%i2,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i0,	%i7
loop_2444:
	brgz,a	%l5,	loop_2445
	nop
	set	0x78, %l2
	std	%i4,	[%l7 + %l2]
	siam	0x4
	srl	%l4,	0x11,	%g2
loop_2445:
	move	%xcc,	%g1,	%o7
	xnorcc	%o4,	%g5,	%g7
	mova	%icc,	%i6,	%l0
	taddcctv	%o1,	0x17FE,	%l6
	edge32n	%l3,	%o2,	%o0
	fbul,a	%fcc0,	loop_2446
	fmovspos	%xcc,	%f5,	%f13
	edge16n	%l1,	%g6,	%i3
	alignaddrl	%g4,	%o6,	%l2
loop_2446:
	brgez,a	%g3,	loop_2447
	fble,a	%fcc0,	loop_2448
	srax	%o5,	%o3,	%i2
	ta	%xcc,	0x3
loop_2447:
	movneg	%icc,	%i1,	%i4
loop_2448:
	fpadd16s	%f27,	%f19,	%f24
	fmovscc	%icc,	%f7,	%f3
	fsrc1	%f24,	%f28
	umul	%i0,	0x0414,	%l5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x43] %asi,	%i5
	sdiv	%i7,	0x0411,	%l4
	fmul8sux16	%f12,	%f4,	%f2
	xnor	%g1,	%g2,	%o7
	movrlz	%o4,	0x0FD,	%g7
	fblg,a	%fcc3,	loop_2449
	mova	%icc,	%i6,	%g5
	sdivcc	%o1,	0x028C,	%l0
	ld	[%l7 + 0x7C],	%f8
loop_2449:
	te	%icc,	0x6
	movcc	%icc,	%l3,	%o2
	fmovsvc	%icc,	%f29,	%f25
	subcc	%o0,	%l6,	%g6
	fmovrsgez	%l1,	%f0,	%f16
	fand	%f8,	%f18,	%f4
	movrlz	%i3,	%g4,	%l2
	fba	%fcc3,	loop_2450
	movne	%xcc,	%o6,	%o5
	tne	%icc,	0x4
	tg	%xcc,	0x6
loop_2450:
	prefetch	[%l7 + 0x5C],	 0x3
	tpos	%xcc,	0x3
	edge8ln	%o3,	%i2,	%i1
	tcs	%icc,	0x3
	movleu	%xcc,	%g3,	%i4
	sth	%i0,	[%l7 + 0x2C]
	srlx	%i5,	0x0B,	%l5
	movneg	%icc,	%i7,	%l4
	movcc	%icc,	%g2,	%g1
	udiv	%o7,	0x0D92,	%o4
	udivx	%g7,	0x09BA,	%i6
	flush	%l7 + 0x44
	alignaddrl	%o1,	%g5,	%l3
	tle	%xcc,	0x3
	orncc	%o2,	%l0,	%l6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x38] %asi,	%o0
	edge16l	%g6,	%l1,	%i3
	taddcc	%g4,	0x1D9D,	%l2
	popc	%o6,	%o5
	tge	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f28,	%f30
	mulscc	%o3,	%i1,	%g3
	alignaddr	%i2,	%i0,	%i4
	xnorcc	%i5,	%i7,	%l4
	wr	%g0,	0x19,	%asi
	stba	%g2,	[%l7 + 0x1E] %asi
	movrne	%g1,	%l5,	%o4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x0c
	fmuld8ulx16	%f4,	%f31,	%f12
	membar	0x76
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o7,	0x1358,	%i6
	movrgez	%g7,	0x2B1,	%g5
	add	%o1,	%l3,	%l0
	fcmpgt32	%f12,	%f26,	%l6
	fble,a	%fcc1,	loop_2451
	nop
	setx	loop_2452,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%xcc,	0x1
	fpadd32s	%f6,	%f13,	%f7
loop_2451:
	srl	%o2,	0x11,	%o0
loop_2452:
	fnegs	%f25,	%f24
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
	membar	0x62
	fmovrsne	%l1,	%f6,	%f18
	fbge,a	%fcc3,	loop_2454
loop_2453:
	movrlez	%g6,	%i3,	%l2
	set	0x64, %g6
	ldswa	[%l7 + %g6] 0x14,	%o6
loop_2454:
	movcc	%xcc,	%o5,	%g4
	fmovsge	%xcc,	%f18,	%f7
	fpsub32	%f6,	%f8,	%f20
	ldsb	[%l7 + 0x56],	%i1
	andcc	%o3,	0x1AF2,	%i2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i0
	subccc	%i4,	0x1743,	%g3
	fba	%fcc0,	loop_2455
	call	loop_2456
	sll	%i7,	0x16,	%i5
	fcmpeq16	%f10,	%f8,	%g2
loop_2455:
	nop
	set	0x2E, %g4
	ldsha	[%l7 + %g4] 0x04,	%g1
loop_2456:
	edge16n	%l4,	%l5,	%o4
	edge32l	%i6,	%g7,	%o7
	tle	%icc,	0x2
	for	%f10,	%f4,	%f18
	ldd	[%l7 + 0x48],	%f28
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%o1
	movrlz	%l3,	%g5,	%l6
	fpsub16	%f26,	%f4,	%f16
	array16	%o2,	%l0,	%l1
	set	0x08, %l3
	stba	%g6,	[%l7 + %l3] 0x18
	ldd	[%l7 + 0x28],	%f4
	fmul8ulx16	%f2,	%f12,	%f24
	edge16ln	%i3,	%l2,	%o6
	sdivcc	%o0,	0x10E3,	%g4
	bne	%icc,	loop_2457
	tgu	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	stha	%o5,	[%l7 + 0x18] %asi
loop_2457:
	sra	%o3,	0x0E,	%i1
	subccc	%i2,	%i4,	%i0
	movl	%icc,	%i7,	%i5
	sethi	0x0912,	%g2
	movleu	%icc,	%g3,	%l4
	bgu,pt	%icc,	loop_2458
	fmovrse	%l5,	%f3,	%f0
	sir	0x1A1A
	bge	loop_2459
loop_2458:
	movrgz	%g1,	%i6,	%g7
	fmovdvc	%xcc,	%f22,	%f29
	subccc	%o4,	%o1,	%l3
loop_2459:
	edge8	%o7,	%g5,	%o2
	tcc	%icc,	0x3
	tneg	%xcc,	0x7
	fmovsgu	%icc,	%f23,	%f7
	sir	0x0926
	movg	%icc,	%l6,	%l1
	edge32l	%g6,	%l0,	%l2
	fnand	%f0,	%f24,	%f14
	tleu	%icc,	0x6
	edge32n	%i3,	%o0,	%g4
	fmovdvc	%xcc,	%f9,	%f7
	set	0x12, %i4
	lduba	[%l7 + %i4] 0x15,	%o6
	bvs,pt	%xcc,	loop_2460
	sub	%o3,	%i1,	%i2
	edge32l	%i4,	%i0,	%i7
	movrlez	%i5,	%o5,	%g2
loop_2460:
	nop
	setx	loop_2461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovs	%f6,	%f19
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x19,	%l4,	%g3
loop_2461:
	smulcc	%g1,	0x11EC,	%l5
	bpos,a,pt	%xcc,	loop_2462
	fpsub32	%f10,	%f14,	%f30
	call	loop_2463
	movg	%xcc,	%i6,	%g7
loop_2462:
	fnands	%f29,	%f16,	%f31
	movge	%icc,	%o1,	%l3
loop_2463:
	brlz	%o7,	loop_2464
	movgu	%xcc,	%o4,	%o2
	edge32l	%l6,	%g5,	%l1
	edge8l	%l0,	%g6,	%l2
loop_2464:
	fxnors	%f11,	%f2,	%f21
	fmovsg	%xcc,	%f14,	%f30
	edge8ln	%i3,	%g4,	%o0
	movrgez	%o6,	0x1C3,	%o3
	brnz	%i2,	loop_2465
	sdivx	%i4,	0x1DB1,	%i1
	set	0x1F, %g3
	lduba	[%l7 + %g3] 0x04,	%i7
loop_2465:
	movrgz	%i0,	%i5,	%g2
	ldd	[%l7 + 0x78],	%l4
	andncc	%o5,	%g3,	%l5
	nop
	setx loop_2466, %l0, %l1
	jmpl %l1, %g1
	ldsw	[%l7 + 0x2C],	%g7
	mulx	%o1,	%i6,	%o7
	fmovscc	%icc,	%f30,	%f24
loop_2466:
	ba,pn	%icc,	loop_2467
	swap	[%l7 + 0x14],	%l3
	subc	%o4,	%o2,	%l6
	srax	%l1,	%l0,	%g6
loop_2467:
	movrne	%l2,	0x39D,	%i3
	andn	%g5,	0x1BC8,	%g4
	bvc,pn	%icc,	loop_2468
	fcmpeq16	%f10,	%f22,	%o0
	bgu	%xcc,	loop_2469
	bg	%xcc,	loop_2470
loop_2468:
	addc	%o3,	%o6,	%i2
	umulcc	%i1,	0x0586,	%i7
loop_2469:
	brlz	%i4,	loop_2471
loop_2470:
	addccc	%i0,	0x02F7,	%i5
	fble	%fcc0,	loop_2472
	fmovsge	%xcc,	%f2,	%f15
loop_2471:
	tge	%icc,	0x1
	tcc	%xcc,	0x0
loop_2472:
	nop
	setx loop_2473, %l0, %l1
	jmpl %l1, %g2
	tn	%icc,	0x5
	umulcc	%o5,	0x17D2,	%l4
	movrgz	%g3,	0x1F9,	%l5
loop_2473:
	fmovrse	%g7,	%f18,	%f25
	edge8n	%g1,	%i6,	%o1
	fmovsl	%icc,	%f31,	%f10
	set	0x08, %l4
	lduwa	[%l7 + %l4] 0x10,	%o7
	brnz	%l3,	loop_2474
	movleu	%xcc,	%o4,	%o2
	edge32ln	%l1,	%l0,	%l6
	edge32	%l2,	%g6,	%g5
loop_2474:
	fbu,a	%fcc2,	loop_2475
	fsrc1	%f20,	%f8
	move	%xcc,	%i3,	%g4
	movvs	%xcc,	%o0,	%o3
loop_2475:
	ba	%xcc,	loop_2476
	fmovrdne	%o6,	%f10,	%f8
	movne	%xcc,	%i1,	%i2
	movne	%xcc,	%i4,	%i7
loop_2476:
	xor	%i5,	%i0,	%g2
	edge32n	%o5,	%l4,	%g3
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x0c,	 0x3
	taddcctv	%g7,	%g1,	%o1
	std	%o6,	[%l7 + 0x60]
	tgu	%xcc,	0x1
	stb	%l3,	[%l7 + 0x2F]
	fxnor	%f24,	%f2,	%f2
	fcmpgt16	%f24,	%f2,	%i6
	fbe	%fcc3,	loop_2477
	tneg	%icc,	0x7
	orncc	%o2,	%o4,	%l0
	movleu	%xcc,	%l1,	%l2
loop_2477:
	ta	%icc,	0x4
	movl	%xcc,	%g6,	%l6
	taddcctv	%g5,	%i3,	%o0
	udivcc	%g4,	0x1C49,	%o6
	edge16	%i1,	%o3,	%i2
	tsubcctv	%i4,	%i7,	%i5
	be,a	%icc,	loop_2478
	movge	%xcc,	%g2,	%i0
	movle	%icc,	%o5,	%l4
	nop
	setx loop_2479, %l0, %l1
	jmpl %l1, %l5
loop_2478:
	bvs,a	%xcc,	loop_2480
	edge16	%g7,	%g1,	%g3
	andncc	%o1,	%o7,	%i6
loop_2479:
	taddcc	%o2,	%l3,	%o4
loop_2480:
	sdiv	%l1,	0x1A2B,	%l0
	umulcc	%g6,	0x1648,	%l2
	addc	%g5,	0x0A95,	%l6
	fmovscs	%xcc,	%f6,	%f9
	set	0x10, %l5
	lduha	[%l7 + %l5] 0x14,	%i3
	edge32	%g4,	%o6,	%i1
	fmovd	%f0,	%f24
	bneg,a,pn	%icc,	loop_2481
	movle	%icc,	%o0,	%i2
	ldub	[%l7 + 0x6D],	%o3
	umulcc	%i7,	0x19AD,	%i5
loop_2481:
	addcc	%g2,	%i0,	%o5
	tpos	%xcc,	0x2
	alignaddr	%l4,	%i4,	%l5
	fmovsvs	%icc,	%f9,	%f8
	fbge,a	%fcc2,	loop_2482
	sdivcc	%g1,	0x0252,	%g7
	xor	%o1,	%g3,	%i6
	addc	%o2,	%l3,	%o7
loop_2482:
	andn	%l1,	%l0,	%g6
	bvc,a,pt	%xcc,	loop_2483
	tleu	%xcc,	0x6
	mulscc	%o4,	0x19E6,	%l2
	edge8	%l6,	%g5,	%i3
loop_2483:
	srlx	%o6,	0x19,	%g4
	sdiv	%o0,	0x0802,	%i1
	bcc,a	loop_2484
	umulcc	%i2,	0x030B,	%i7
	fcmple32	%f2,	%f2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2484:
	xnorcc	%i5,	%g2,	%o5
	addccc	%i0,	0x1D15,	%i4
	sub	%l4,	0x1F38,	%l5
	movl	%xcc,	%g1,	%o1
	edge16n	%g3,	%i6,	%o2
	brgz,a	%l3,	loop_2485
	mulx	%g7,	%l1,	%o7
	tl	%icc,	0x3
	taddcctv	%g6,	0x14EB,	%l0
loop_2485:
	taddcctv	%o4,	0x1BA4,	%l2
	sethi	0x1526,	%g5
	brlz	%l6,	loop_2486
	sll	%o6,	0x0E,	%g4
	fbge,a	%fcc1,	loop_2487
	edge16l	%i3,	%o0,	%i2
loop_2486:
	movrne	%i7,	0x369,	%i1
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x18,	%i5
loop_2487:
	sll	%g2,	0x04,	%o5
	nop
	set	0x10, %o0
	std	%f12,	[%l7 + %o0]
	tsubcc	%i0,	%i4,	%o3
	fnot1	%f18,	%f18
	fmovd	%f30,	%f30
	movre	%l4,	%g1,	%o1
	movn	%icc,	%g3,	%l5
	fmovde	%icc,	%f20,	%f31
	movg	%icc,	%o2,	%i6
	bvc,a,pn	%icc,	loop_2488
	udivx	%l3,	0x1FE4,	%l1
	and	%o7,	%g6,	%g7
	smulcc	%o4,	0x002F,	%l0
loop_2488:
	sdiv	%l2,	0x0498,	%l6
	fble	%fcc1,	loop_2489
	fone	%f28
	movrne	%o6,	%g5,	%i3
	edge16l	%g4,	%o0,	%i7
loop_2489:
	tpos	%xcc,	0x7
	movgu	%xcc,	%i2,	%i1
	fmovsn	%icc,	%f28,	%f25
	bcc,a	%icc,	loop_2490
	movpos	%xcc,	%g2,	%o5
	movle	%xcc,	%i5,	%i0
	fmovsneg	%xcc,	%f22,	%f12
loop_2490:
	fsrc2	%f24,	%f0
	fnands	%f4,	%f3,	%f11
	std	%f18,	[%l7 + 0x50]
	fbg	%fcc1,	loop_2491
	brlz	%o3,	loop_2492
	fmovrslez	%i4,	%f23,	%f10
	set	0x4C, %o7
	ldswa	[%l7 + %o7] 0x15,	%l4
loop_2491:
	mulx	%o1,	0x1135,	%g1
loop_2492:
	tpos	%xcc,	0x5
	andcc	%l5,	0x0835,	%o2
	srax	%i6,	0x17,	%l3
	edge16ln	%g3,	%o7,	%g6
	fble,a	%fcc3,	loop_2493
	movvc	%icc,	%g7,	%l1
	srlx	%o4,	0x02,	%l2
	tneg	%xcc,	0x6
loop_2493:
	addccc	%l6,	%l0,	%o6
	movgu	%xcc,	%i3,	%g4
	bcc,a,pt	%xcc,	loop_2494
	array16	%g5,	%o0,	%i7
	sir	0x04C7
	tn	%xcc,	0x7
loop_2494:
	swap	[%l7 + 0x14],	%i1
	tleu	%icc,	0x1
	tsubcc	%g2,	0x0F66,	%o5
	fands	%f7,	%f6,	%f13
	tne	%xcc,	0x6
	taddcctv	%i5,	%i0,	%o3
	srlx	%i2,	%l4,	%i4
	edge32ln	%g1,	%o1,	%l5
	mova	%xcc,	%i6,	%o2
	fmovs	%f6,	%f14
	fabsd	%f10,	%f28
	wr	%g0,	0x18,	%asi
	stba	%g3,	[%l7 + 0x47] %asi
	umulcc	%l3,	%g6,	%o7
	edge8ln	%l1,	%g7,	%l2
	movrne	%o4,	%l0,	%o6
	movrne	%l6,	%g4,	%g5
	bneg,pn	%icc,	loop_2495
	bleu,pt	%icc,	loop_2496
	bvc,a	loop_2497
	lduh	[%l7 + 0x42],	%o0
loop_2495:
	popc	%i7,	%i3
loop_2496:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g2
loop_2497:
	bpos,pn	%icc,	loop_2498
	sdivcc	%i1,	0x1DFA,	%i5
	tcc	%xcc,	0x5
	srax	%o5,	0x15,	%i0
loop_2498:
	umul	%i2,	%l4,	%i4
	nop
	set	0x3D, %l0
	ldstub	[%l7 + %l0],	%o3
	ldsb	[%l7 + 0x79],	%o1
	add	%g1,	%l5,	%i6
	movrne	%o2,	0x3A5,	%l3
	movrne	%g6,	%o7,	%l1
	movle	%xcc,	%g3,	%g7
	orn	%l2,	0x1598,	%l0
	movrgz	%o6,	%l6,	%o4
	ble	%xcc,	loop_2499
	movvs	%xcc,	%g5,	%o0
	wr	%g0,	0x89,	%asi
	stba	%g4,	[%l7 + 0x1F] %asi
loop_2499:
	smulcc	%i7,	0x0BBA,	%i3
	fblg	%fcc2,	loop_2500
	tge	%xcc,	0x4
	fmovrde	%g2,	%f18,	%f14
	wr	%g0,	0x2b,	%asi
	stwa	%i1,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2500:
	tcs	%icc,	0x1
	fblg,a	%fcc0,	loop_2501
	smulcc	%i5,	%o5,	%i0
	te	%xcc,	0x2
	move	%icc,	%l4,	%i2
loop_2501:
	bl	%icc,	loop_2502
	alignaddr	%o3,	%i4,	%g1
	movcc	%xcc,	%l5,	%i6
	udivx	%o2,	0x0030,	%l3
loop_2502:
	fbg	%fcc2,	loop_2503
	orn	%g6,	0x1F82,	%o1
	fandnot2	%f24,	%f6,	%f8
	fmovrdlz	%l1,	%f16,	%f16
loop_2503:
	edge32ln	%o7,	%g7,	%l2
	bl	%icc,	loop_2504
	tcc	%icc,	0x5
	edge32l	%g3,	%o6,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o4
loop_2504:
	fbuge	%fcc1,	loop_2505
	fmovrslez	%g5,	%f3,	%f21
	ldsw	[%l7 + 0x24],	%g4
	subc	%o0,	%i7,	%g2
loop_2505:
	fmovspos	%icc,	%f13,	%f6
	bcc,a,pt	%icc,	loop_2506
	taddcc	%i1,	0x038E,	%i3
	sll	%i5,	0x0D,	%i0
	array32	%o5,	%i2,	%o3
loop_2506:
	nop
	wr	%g0,	0x89,	%asi
	stba	%i4,	[%l7 + 0x6E] %asi
	movge	%xcc,	%g1,	%l5
	fmovde	%xcc,	%f29,	%f15
	movcs	%icc,	%i6,	%l4
	edge32l	%l3,	%g6,	%o2
	subc	%o1,	0x12F4,	%l1
	fmovsg	%xcc,	%f15,	%f8
	fxnors	%f11,	%f15,	%f23
	fmovdvs	%xcc,	%f13,	%f5
	fmovdgu	%xcc,	%f28,	%f25
	movneg	%xcc,	%o7,	%g7
	smul	%g3,	%l2,	%o6
	movne	%xcc,	%l0,	%l6
	mova	%xcc,	%o4,	%g5
	srl	%o0,	%g4,	%g2
	tsubcc	%i1,	%i3,	%i7
	fabss	%f23,	%f9
	movvc	%icc,	%i5,	%i0
	fmovrse	%o5,	%f7,	%f20
	fmovdge	%icc,	%f1,	%f28
	fnors	%f8,	%f24,	%f31
	smul	%o3,	0x1D92,	%i4
	fmul8x16au	%f31,	%f28,	%f2
	fnegd	%f12,	%f10
	ldsh	[%l7 + 0x30],	%i2
	sllx	%g1,	%i6,	%l5
	fbge	%fcc3,	loop_2507
	fand	%f28,	%f30,	%f10
	tge	%icc,	0x7
	array16	%l3,	%l4,	%g6
loop_2507:
	nop
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x26,	%o2
	fmovdcs	%xcc,	%f22,	%f17
	fornot2s	%f6,	%f14,	%f6
	udivx	%o1,	0x070E,	%l1
	fmovrsne	%g7,	%f9,	%f9
	brnz,a	%g3,	loop_2508
	sllx	%l2,	%o7,	%l0
	fmuld8ulx16	%f13,	%f15,	%f8
	umul	%o6,	%l6,	%g5
loop_2508:
	fbg,a	%fcc1,	loop_2509
	bcc,pn	%icc,	loop_2510
	fmovdcc	%xcc,	%f13,	%f8
	brnz,a	%o4,	loop_2511
loop_2509:
	fbn,a	%fcc0,	loop_2512
loop_2510:
	xnorcc	%o0,	0x0440,	%g2
	edge32	%i1,	%g4,	%i3
loop_2511:
	sdivx	%i7,	0x1199,	%i5
loop_2512:
	ta	%xcc,	0x2
	srl	%i0,	%o5,	%i4
	fmovsn	%icc,	%f12,	%f15
	edge8ln	%o3,	%g1,	%i6
	movrgez	%i2,	0x1CB,	%l3
	fmovsvs	%icc,	%f2,	%f13
	tsubcc	%l4,	0x1B9B,	%g6
	movrne	%l5,	%o1,	%l1
	array32	%o2,	%g7,	%g3
	tneg	%icc,	0x7
	umul	%o7,	0x1F04,	%l2
	bg,a,pn	%icc,	loop_2513
	addccc	%o6,	0x0B4B,	%l0
	popc	0x089A,	%g5
	movrlez	%l6,	%o4,	%g2
loop_2513:
	edge8	%o0,	%i1,	%g4
	fmovsg	%icc,	%f25,	%f16
	fand	%f12,	%f28,	%f18
	fpsub16	%f26,	%f16,	%f16
	fnot1s	%f10,	%f8
	subccc	%i3,	%i7,	%i5
	movrgez	%o5,	%i4,	%i0
	movneg	%xcc,	%g1,	%i6
	edge8l	%o3,	%l3,	%l4
	sllx	%i2,	%g6,	%o1
	sll	%l1,	%o2,	%l5
	brlz,a	%g3,	loop_2514
	array32	%g7,	%o7,	%l2
	wr	%g0,	0x20,	%asi
	stxa	%o6,	[%g0 + 0x28] %asi
loop_2514:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x1E] %asi,	%l0
	fmovsvs	%icc,	%f11,	%f7
	umul	%l6,	0x063C,	%g5
	brgz,a	%o4,	loop_2515
	fpadd32s	%f1,	%f8,	%f9
	edge32	%o0,	%g2,	%i1
	fbu	%fcc1,	loop_2516
loop_2515:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i3,	%i7
	fmovsvc	%icc,	%f31,	%f24
loop_2516:
	umul	%g4,	0x1AF2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i4,	0x0CD6,	%i5
	edge32	%g1,	%i0,	%i6
	edge8l	%l3,	%o3,	%l4
	membar	0x2E
	fbge,a	%fcc0,	loop_2517
	ld	[%l7 + 0x74],	%f19
	tcs	%icc,	0x5
	xorcc	%i2,	%g6,	%l1
loop_2517:
	brnz	%o2,	loop_2518
	fcmpd	%fcc3,	%f26,	%f8
	movle	%xcc,	%o1,	%g3
	sdiv	%l5,	0x000A,	%g7
loop_2518:
	and	%l2,	0x0C91,	%o6
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	fmul8x16al	%f30,	%f7,	%f4
	movrne	%o7,	%g5,	%o4
	fcmple16	%f14,	%f26,	%o0
	udivcc	%g2,	0x016D,	%i1
	taddcc	%l6,	0x1182,	%i7
	movneg	%icc,	%i3,	%g4
	fzeros	%f23
	taddcctv	%i4,	%o5,	%i5
	te	%xcc,	0x2
	fxors	%f6,	%f16,	%f21
	tsubcctv	%g1,	0x1E7F,	%i0
	fbge,a	%fcc0,	loop_2519
	subcc	%l3,	0x1F66,	%o3
	sir	0x0354
	srl	%i6,	%i2,	%g6
loop_2519:
	fmovspos	%icc,	%f22,	%f15
	te	%xcc,	0x1
	udivcc	%l1,	0x1269,	%o2
	bn,a,pt	%xcc,	loop_2520
	edge32ln	%l4,	%g3,	%l5
	or	%g7,	0x1BA3,	%o1
	ldsb	[%l7 + 0x1F],	%l2
loop_2520:
	sll	%o6,	0x13,	%o7
	andncc	%l0,	%g5,	%o0
	sdivx	%g2,	0x1DE3,	%i1
	smulcc	%o4,	0x15AD,	%i7
	fxnor	%f22,	%f0,	%f22
	brz	%l6,	loop_2521
	brlz	%i3,	loop_2522
	brlez	%g4,	loop_2523
	movrlz	%o5,	%i5,	%i4
loop_2521:
	andncc	%i0,	%l3,	%g1
loop_2522:
	fornot1s	%f0,	%f3,	%f29
loop_2523:
	xorcc	%i6,	%o3,	%i2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l1
	fxor	%f0,	%f26,	%f12
	fsrc1s	%f22,	%f15
	sllx	%o2,	0x0A,	%g6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x5C] %asi,	%f18
	edge32	%l4,	%g3,	%g7
	fnot2	%f30,	%f14
	fnor	%f22,	%f24,	%f14
	edge32	%o1,	%l2,	%o6
	movg	%xcc,	%l5,	%l0
	fors	%f5,	%f13,	%f31
	sir	0x1829
	edge8	%o7,	%o0,	%g2
	umul	%i1,	%o4,	%g5
	movcc	%icc,	%l6,	%i7
	brgz	%i3,	loop_2524
	brgz	%g4,	loop_2525
	fmovde	%xcc,	%f18,	%f7
	movl	%icc,	%i5,	%o5
loop_2524:
	fmovdn	%icc,	%f18,	%f13
loop_2525:
	edge32n	%i4,	%l3,	%i0
	tg	%xcc,	0x3
	brlez,a	%g1,	loop_2526
	movrne	%o3,	%i2,	%l1
	subcc	%i6,	%g6,	%o2
	movrlez	%g3,	%l4,	%g7
loop_2526:
	nop
	set	0x6A, %l1
	ldsba	[%l7 + %l1] 0x0c,	%o1
	srl	%l2,	%o6,	%l0
	fnands	%f23,	%f9,	%f31
	umulcc	%l5,	0x0C86,	%o0
	set	0x1f8, %o2
	nop 	! 	nop 	! 	ldxa	[%g0 + %o2] 0x40,	%g2 ripped by fixASI40.pl ripped by fixASI40.pl
	tcs	%xcc,	0x6
	sdiv	%i1,	0x03EF,	%o7
	srl	%g5,	0x11,	%o4
	mulx	%i7,	%i3,	%l6
	tvs	%icc,	0x3
	movrne	%i5,	0x2FD,	%g4
	tn	%icc,	0x2
	smul	%i4,	%l3,	%i0
	tgu	%xcc,	0x5
	movrgz	%g1,	0x070,	%o5
	srax	%i2,	0x07,	%l1
	fmovdge	%xcc,	%f13,	%f8
	movcc	%xcc,	%i6,	%g6
	ldsw	[%l7 + 0x38],	%o2
	fmovdvs	%icc,	%f26,	%f31
	stb	%o3,	[%l7 + 0x41]
	srl	%l4,	%g3,	%o1
	edge8	%l2,	%g7,	%l0
	set	0x22, %i7
	lduha	[%l7 + %i7] 0x89,	%o6
	set	0x28, %g2
	sta	%f0,	[%l7 + %g2] 0x19
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%l5
	fmovsgu	%icc,	%f19,	%f10
	array32	%i1,	%o7,	%g2
	smul	%o4,	0x1ACA,	%g5
	mulscc	%i7,	0x05AD,	%l6
	taddcc	%i3,	0x1DA2,	%g4
	fmovrde	%i4,	%f14,	%f0
	set	0x08, %i2
	stha	%i5,	[%l7 + %i2] 0x15
	sub	%i0,	%g1,	%l3
	fble	%fcc3,	loop_2527
	fba,a	%fcc1,	loop_2528
	xnor	%o5,	0x1463,	%l1
	fcmpgt32	%f18,	%f2,	%i6
loop_2527:
	fmovs	%f22,	%f0
loop_2528:
	ta	%icc,	0x7
	subcc	%i2,	%o2,	%o3
	orn	%g6,	0x1260,	%l4
	tneg	%xcc,	0x1
	alignaddr	%o1,	%l2,	%g7
	fmovdg	%xcc,	%f20,	%f28
	fmovdneg	%xcc,	%f11,	%f7
	movneg	%icc,	%l0,	%g3
	movrlez	%o6,	%l5,	%i1
	tcs	%icc,	0x3
	edge8n	%o7,	%o0,	%g2
	bg,pt	%xcc,	loop_2529
	orcc	%o4,	0x080B,	%g5
	membar	0x5E
	umulcc	%l6,	%i7,	%i3
loop_2529:
	fblg	%fcc2,	loop_2530
	array32	%i4,	%i5,	%i0
	tge	%icc,	0x6
	tvc	%xcc,	0x3
loop_2530:
	edge8	%g1,	%l3,	%g4
	tcs	%icc,	0x5
	movge	%icc,	%o5,	%i6
	fcmped	%fcc0,	%f30,	%f0
	subc	%l1,	0x13C3,	%o2
	fmovd	%f18,	%f6
	te	%xcc,	0x7
	ldstub	[%l7 + 0x41],	%o3
	sllx	%g6,	0x1C,	%l4
	fpadd16s	%f15,	%f1,	%f30
	sir	0x065E
	swap	[%l7 + 0x50],	%i2
	xnorcc	%l2,	0x0909,	%g7
	membar	0x7A
	movleu	%xcc,	%l0,	%g3
	ldx	[%l7 + 0x20],	%o1
	udiv	%o6,	0x1224,	%i1
	fmul8sux16	%f16,	%f16,	%f18
	xnorcc	%o7,	0x14FE,	%l5
	mulx	%o0,	%g2,	%o4
	fpsub32s	%f21,	%f0,	%f18
	be	%xcc,	loop_2531
	siam	0x4
	subc	%g5,	0x0746,	%i7
	mulx	%i3,	%i4,	%i5
loop_2531:
	fpadd16s	%f24,	%f29,	%f21
	fbue,a	%fcc0,	loop_2532
	edge8ln	%l6,	%g1,	%l3
	taddcc	%g4,	0x0736,	%i0
	fbn	%fcc3,	loop_2533
loop_2532:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x3
	fmovdn	%xcc,	%f24,	%f20
loop_2533:
	fbo,a	%fcc2,	loop_2534
	or	%i6,	0x1499,	%o5
	fbne	%fcc3,	loop_2535
	andcc	%l1,	0x0B21,	%o2
loop_2534:
	sdivcc	%g6,	0x1C84,	%o3
	movl	%xcc,	%i2,	%l4
loop_2535:
	srax	%l2,	0x0F,	%l0
	flush	%l7 + 0x34
	fmovsg	%xcc,	%f11,	%f1
	orncc	%g7,	%o1,	%o6
	mulscc	%i1,	0x1BB1,	%g3
	fmovrdne	%o7,	%f18,	%f0
	tle	%icc,	0x0
	tpos	%icc,	0x0
	mulx	%l5,	%o0,	%g2
	fmovd	%f10,	%f2
	tn	%icc,	0x2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x74] %asi,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x2
	or	%o4,	%i3,	%i4
	tgu	%icc,	0x0
	fsrc2s	%f19,	%f8
	fcmpeq32	%f26,	%f24,	%i7
	movrgz	%i5,	0x1FB,	%l6
	orcc	%g1,	0x03CC,	%g4
	movge	%xcc,	%l3,	%i6
	orncc	%o5,	0x1F0F,	%l1
	smul	%o2,	0x0670,	%g6
	bne,a	loop_2536
	edge16n	%o3,	%i0,	%l4
	fornot1s	%f0,	%f1,	%f17
	mulscc	%l2,	%l0,	%g7
loop_2536:
	brgz	%i2,	loop_2537
	fmul8x16au	%f13,	%f14,	%f24
	fabss	%f5,	%f14
	tle	%icc,	0x7
loop_2537:
	sllx	%o6,	%i1,	%o1
	movne	%icc,	%g3,	%o7
	mulx	%l5,	%g2,	%o0
	xor	%g5,	0x1A50,	%o4
	movrlez	%i3,	0x3F1,	%i4
	tl	%icc,	0x6
	ta	%icc,	0x6
	ble,a	%xcc,	loop_2538
	mulx	%i7,	0x0B91,	%l6
	tle	%icc,	0x0
	fbu	%fcc0,	loop_2539
loop_2538:
	fmovrsgz	%g1,	%f27,	%f2
	fmovsl	%xcc,	%f18,	%f20
	tsubcc	%i5,	%l3,	%i6
loop_2539:
	xor	%g4,	0x0531,	%l1
	andncc	%o2,	%g6,	%o3
	sll	%o5,	%l4,	%l2
	fmovdne	%xcc,	%f20,	%f23
	tpos	%icc,	0x2
	bcs,a	%icc,	loop_2540
	bvs,a,pt	%icc,	loop_2541
	mulscc	%i0,	0x0DD0,	%l0
	tsubcc	%g7,	%o6,	%i2
loop_2540:
	movle	%xcc,	%o1,	%i1
loop_2541:
	sdivcc	%o7,	0x13A2,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l5,	%g2,	%g5
	addcc	%o4,	0x0DD2,	%i3
	bcc	loop_2542
	tvs	%icc,	0x4
	movge	%xcc,	%i4,	%i7
	fmovdne	%icc,	%f23,	%f0
loop_2542:
	prefetch	[%l7 + 0x1C],	 0x2
	fmovscc	%xcc,	%f29,	%f5
	set	0x69, %i0
	stba	%l6,	[%l7 + %i0] 0x22
	membar	#Sync
	fmul8sux16	%f6,	%f28,	%f14
	fornot2s	%f6,	%f15,	%f22
	fmovs	%f21,	%f4
	sub	%g1,	0x0D23,	%o0
	fbule,a	%fcc0,	loop_2543
	movrgez	%l3,	%i5,	%g4
	fmovdg	%xcc,	%f6,	%f29
	movre	%i6,	%l1,	%o2
loop_2543:
	brnz,a	%o3,	loop_2544
	edge8n	%o5,	%g6,	%l2
	movl	%icc,	%l4,	%i0
	udivx	%l0,	0x0795,	%g7
loop_2544:
	fblg,a	%fcc1,	loop_2545
	movre	%i2,	%o1,	%i1
	ldd	[%l7 + 0x68],	%o6
	bn	loop_2546
loop_2545:
	edge8n	%o6,	%g3,	%g2
	sth	%l5,	[%l7 + 0x4E]
	udivcc	%g5,	0x0A0A,	%o4
loop_2546:
	sra	%i3,	%i7,	%l6
	movre	%i4,	%g1,	%o0
	movge	%xcc,	%i5,	%l3
	stx	%i6,	[%l7 + 0x40]
	tle	%xcc,	0x6
	srax	%g4,	%o2,	%l1
	udiv	%o5,	0x1AD8,	%g6
	ldsh	[%l7 + 0x4A],	%o3
	tvc	%icc,	0x5
	tl	%xcc,	0x4
	stb	%l4,	[%l7 + 0x60]
	fmovrsne	%i0,	%f10,	%f16
	movvs	%xcc,	%l2,	%l0
	edge16ln	%i2,	%o1,	%i1
	tl	%xcc,	0x2
	orcc	%g7,	0x1F4B,	%o6
	movvs	%icc,	%o7,	%g3
	tle	%xcc,	0x4
	xorcc	%g2,	%g5,	%o4
	sdiv	%i3,	0x1CDB,	%i7
	edge32	%l6,	%i4,	%l5
	ta	%xcc,	0x7
	fbne,a	%fcc1,	loop_2547
	array16	%o0,	%i5,	%l3
	fors	%f29,	%f7,	%f29
	fmovrslz	%i6,	%f18,	%f18
loop_2547:
	orncc	%g4,	%o2,	%l1
	fnot1	%f2,	%f16
	fmovspos	%xcc,	%f22,	%f9
	prefetch	[%l7 + 0x6C],	 0x1
	fbu	%fcc2,	loop_2548
	ldstub	[%l7 + 0x0E],	%o5
	fcmpne32	%f18,	%f18,	%g6
	set	0x78, %i6
	stda	%o2,	[%l7 + %i6] 0x18
loop_2548:
	fmovdne	%xcc,	%f15,	%f10
	movrlz	%l4,	%i0,	%l2
	mova	%icc,	%l0,	%i2
	fbul	%fcc3,	loop_2549
	sdivcc	%o1,	0x0A97,	%g1
	bne,pn	%xcc,	loop_2550
	ld	[%l7 + 0x0C],	%f6
loop_2549:
	nop
	set	0x2C, %o3
	lda	[%l7 + %o3] 0x04,	%f18
loop_2550:
	fandnot1s	%f31,	%f23,	%f15
	fmovdge	%icc,	%f12,	%f6
	edge32ln	%i1,	%g7,	%o6
	movvs	%xcc,	%o7,	%g2
	set	0x54, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g3
	mulx	%g5,	%o4,	%i7
	edge8l	%l6,	%i4,	%i3
	mova	%xcc,	%l5,	%i5
	edge8n	%l3,	%i6,	%o0
	brgz,a	%o2,	loop_2551
	brlz,a	%g4,	loop_2552
	umulcc	%o5,	%l1,	%o3
	tvc	%xcc,	0x4
loop_2551:
	edge16l	%l4,	%i0,	%g6
loop_2552:
	array32	%l2,	%i2,	%l0
	orncc	%o1,	%i1,	%g7
	sllx	%o6,	%g1,	%g2
	ldsb	[%l7 + 0x0E],	%g3
	subccc	%o7,	%o4,	%g5
	sdivcc	%l6,	0x00BA,	%i7
	st	%f15,	[%l7 + 0x10]
	be	%icc,	loop_2553
	fmovdle	%xcc,	%f11,	%f31
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2553:
	fmovscc	%xcc,	%f8,	%f29
	edge16n	%i3,	%l5,	%i5
	umul	%i4,	%l3,	%i6
	brz,a	%o0,	loop_2554
	fble,a	%fcc2,	loop_2555
	tvc	%xcc,	0x3
	set	0x38, %o4
	ldsha	[%l7 + %o4] 0x04,	%g4
loop_2554:
	movvc	%icc,	%o2,	%l1
loop_2555:
	umul	%o3,	%l4,	%o5
	bleu,pn	%xcc,	loop_2556
	tcs	%xcc,	0x3
	brgz	%g6,	loop_2557
	movre	%l2,	%i0,	%i2
loop_2556:
	fbul	%fcc3,	loop_2558
	edge16n	%o1,	%i1,	%g7
loop_2557:
	andn	%l0,	%o6,	%g1
	mulx	%g2,	0x0675,	%g3
loop_2558:
	bge,a	loop_2559
	udivx	%o7,	0x0D30,	%o4
	movleu	%xcc,	%l6,	%i7
	subcc	%g5,	%l5,	%i5
loop_2559:
	fbue,a	%fcc3,	loop_2560
	mova	%icc,	%i3,	%i4
	tg	%xcc,	0x3
	tsubcctv	%i6,	0x09E4,	%o0
loop_2560:
	nop
	set	0x5E, %l6
	lduha	[%l7 + %l6] 0x89,	%l3
	edge16ln	%g4,	%l1,	%o2
	ld	[%l7 + 0x64],	%f6
	sdivcc	%l4,	0x18FA,	%o5
	movre	%g6,	0x223,	%l2
	movcs	%xcc,	%i0,	%o3
	sll	%o1,	0x13,	%i2
	srax	%g7,	%l0,	%i1
	smul	%o6,	%g2,	%g3
	movre	%g1,	0x2B1,	%o7
	array8	%l6,	%i7,	%g5
	subc	%o4,	0x19F5,	%l5
	ldub	[%l7 + 0x1D],	%i3
	wr	%g0,	0x19,	%asi
	stda	%i4,	[%l7 + 0x10] %asi
	andcc	%i6,	%i5,	%l3
	wr	%g0,	0x11,	%asi
	sta	%f23,	[%l7 + 0x70] %asi
	sllx	%g4,	0x1C,	%l1
	array16	%o2,	%o0,	%l4
	smul	%o5,	0x109C,	%g6
	movrlz	%l2,	0x1DA,	%i0
	fmovrsgz	%o1,	%f5,	%f2
	array32	%o3,	%g7,	%l0
	add	%i2,	0x12FA,	%i1
	te	%icc,	0x4
	edge16n	%o6,	%g3,	%g1
	udivx	%o7,	0x0BD6,	%g2
	std	%f0,	[%l7 + 0x08]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l6,	%g5,	%i7
	set	0x30, %i3
	lduba	[%l7 + %i3] 0x19,	%o4
	fba,a	%fcc2,	loop_2561
	bge,a	%icc,	loop_2562
	bleu,a	%xcc,	loop_2563
	ba,pt	%icc,	loop_2564
loop_2561:
	tneg	%xcc,	0x1
loop_2562:
	edge32	%l5,	%i4,	%i6
loop_2563:
	xnor	%i3,	%i5,	%l3
loop_2564:
	fbue	%fcc3,	loop_2565
	stbar
	movvc	%icc,	%g4,	%o2
	brgz	%o0,	loop_2566
loop_2565:
	sub	%l1,	0x1576,	%o5
	fbe,a	%fcc2,	loop_2567
	movrlz	%g6,	0x27A,	%l2
loop_2566:
	movg	%icc,	%i0,	%l4
	bpos	loop_2568
loop_2567:
	movg	%xcc,	%o3,	%o1
	edge8	%l0,	%g7,	%i2
	tneg	%icc,	0x2
loop_2568:
	mova	%icc,	%i1,	%o6
	movl	%xcc,	%g3,	%o7
	fbl,a	%fcc0,	loop_2569
	smul	%g2,	%g1,	%g5
	xnor	%i7,	0x1865,	%o4
	udivcc	%l6,	0x0CE0,	%l5
loop_2569:
	fmovsge	%xcc,	%f0,	%f16
	membar	0x23
	movle	%xcc,	%i6,	%i4
	ldsw	[%l7 + 0x20],	%i3
	movgu	%icc,	%l3,	%i5
	xorcc	%o2,	%g4,	%o0
	array32	%o5,	%g6,	%l1
	smulcc	%l2,	0x1AF7,	%i0
	set	0x11, %o1
	ldsba	[%l7 + %o1] 0x18,	%l4
	edge32n	%o1,	%l0,	%o3
	ldd	[%l7 + 0x20],	%g6
	bleu,a	loop_2570
	andcc	%i1,	%i2,	%o6
	flush	%l7 + 0x18
	andcc	%g3,	0x07BB,	%o7
loop_2570:
	andncc	%g1,	%g2,	%g5
	be,a	loop_2571
	movl	%icc,	%o4,	%i7
	fbuge,a	%fcc0,	loop_2572
	umul	%l6,	%l5,	%i4
loop_2571:
	fandnot2s	%f8,	%f16,	%f26
	bleu	loop_2573
loop_2572:
	tpos	%icc,	0x7
	andncc	%i6,	%l3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2573:
	fbul,a	%fcc2,	loop_2574
	sdivx	%i5,	0x07DD,	%g4
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
loop_2574:
	alignaddr	%o0,	%o2,	%o5
	array32	%g6,	%l1,	%l2
	srl	%l4,	0x0F,	%i0
	edge8	%l0,	%o1,	%o3
	tpos	%xcc,	0x7
	bneg,pn	%xcc,	loop_2575
	fbn,a	%fcc0,	loop_2576
	tle	%icc,	0x1
	movleu	%icc,	%i1,	%g7
loop_2575:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x48] %asi,	%o6
loop_2576:
	edge16l	%g3,	%i2,	%o7
	wr	%g0,	0x11,	%asi
	stwa	%g2,	[%l7 + 0x10] %asi
	flush	%l7 + 0x0C
	fbe,a	%fcc2,	loop_2577
	fsrc2	%f4,	%f24
	sllx	%g1,	0x1C,	%o4
	movrne	%i7,	%l6,	%g5
loop_2577:
	stbar
	addcc	%l5,	0x0E78,	%i6
	sdivx	%i4,	0x0BB1,	%l3
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	fmovsneg	%xcc,	%f0,	%f20
	fsrc1	%f26,	%f20
	fornot1	%f14,	%f26,	%f0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%i3
	nop
	setx loop_2578, %l0, %l1
	jmpl %l1, %g4
	tsubcc	%o0,	0x1C17,	%o5
	fpack32	%f24,	%f20,	%f8
	fmul8x16	%f5,	%f16,	%f14
loop_2578:
	edge32n	%g6,	%o2,	%l2
	edge16ln	%l1,	%i0,	%l4
	tleu	%icc,	0x5
	udivcc	%l0,	0x12B4,	%o3
	smulcc	%i1,	0x07F5,	%g7
	fmul8x16al	%f26,	%f21,	%f20
	xorcc	%o1,	0x03FE,	%o6
	fmovrdlez	%i2,	%f8,	%f6
	fmovdcs	%icc,	%f19,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x48],	%o7
	fbl,a	%fcc3,	loop_2579
	edge8n	%g2,	%g3,	%o4
	fcmped	%fcc2,	%f28,	%f6
	fmovdle	%icc,	%f4,	%f8
loop_2579:
	std	%f12,	[%l7 + 0x08]
	subccc	%i7,	%g1,	%g5
	fble,a	%fcc1,	loop_2580
	popc	%l5,	%l6
	or	%i4,	0x10C7,	%l3
	tle	%xcc,	0x4
loop_2580:
	tg	%icc,	0x5
	movneg	%xcc,	%i6,	%i3
	movle	%icc,	%g4,	%i5
	umulcc	%o0,	0x0089,	%g6
	fblg	%fcc0,	loop_2581
	sdivcc	%o5,	0x06B4,	%o2
	bshuffle	%f28,	%f6,	%f12
	orn	%l1,	0x0CEC,	%l2
loop_2581:
	fmovsne	%xcc,	%f20,	%f28
	fpackfix	%f22,	%f27
	movge	%xcc,	%l4,	%i0
	fmovdn	%icc,	%f23,	%f30
	tcc	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o3,	%l0,	%i1
	taddcctv	%o1,	%g7,	%o6
	ldstub	[%l7 + 0x4C],	%o7
	movrlz	%i2,	0x2BE,	%g2
	ldsh	[%l7 + 0x44],	%g3
	tcs	%icc,	0x2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i7
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf8
	membar	#Sync
	tcs	%xcc,	0x4
	edge32n	%o4,	%g1,	%g5
	tcc	%xcc,	0x1
	tvs	%xcc,	0x2
	movrlz	%l6,	0x043,	%i4
	movpos	%xcc,	%l5,	%l3
	fmovdg	%icc,	%f23,	%f0
	prefetch	[%l7 + 0x74],	 0x3
	tgu	%icc,	0x2
	movcs	%icc,	%i3,	%i6
	siam	0x6
	movrlz	%i5,	%o0,	%g4
	lduh	[%l7 + 0x1A],	%o5
	fmul8x16au	%f8,	%f27,	%f4
	set	0x0E, %g7
	ldsba	[%l7 + %g7] 0x19,	%o2
	addc	%g6,	0x1190,	%l1
	fbul	%fcc2,	loop_2582
	brlz,a	%l2,	loop_2583
	edge16	%i0,	%l4,	%l0
	alignaddr	%o3,	%i1,	%o1
loop_2582:
	orncc	%o6,	%o7,	%i2
loop_2583:
	fmul8x16	%f14,	%f20,	%f2
	fba	%fcc3,	loop_2584
	sir	0x1FCA
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	loop_2585
loop_2584:
	edge32n	%g2,	%g3,	%i7
	smulcc	%o4,	0x0D5E,	%g7
	bshuffle	%f22,	%f26,	%f2
loop_2585:
	movre	%g5,	%g1,	%i4
	pdist	%f8,	%f24,	%f14
	edge8	%l6,	%l3,	%i3
	edge32	%l5,	%i5,	%o0
	fnors	%f16,	%f18,	%f3
	bneg,a,pt	%xcc,	loop_2586
	srax	%g4,	%i6,	%o5
	bgu,a,pn	%icc,	loop_2587
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2586:
	alignaddrl	%o2,	%l1,	%l2
	subccc	%i0,	0x14B2,	%g6
loop_2587:
	umulcc	%l0,	%l4,	%i1
	fnot1s	%f27,	%f22
	fmovdg	%xcc,	%f3,	%f25
	brlz,a	%o3,	loop_2588
	xorcc	%o1,	0x10EF,	%o6
	taddcc	%o7,	%g2,	%i2
	fmovsgu	%icc,	%f30,	%f2
loop_2588:
	fcmpeq16	%f26,	%f20,	%g3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bvs,pn	%icc,	loop_2589
	brnz	%o4,	loop_2590
	fnor	%f30,	%f22,	%f12
	sra	%g7,	%g5,	%g1
loop_2589:
	bg	loop_2591
loop_2590:
	fandnot2s	%f18,	%f14,	%f15
	brlz	%i7,	loop_2592
	bvc,pn	%icc,	loop_2593
loop_2591:
	be,a,pt	%icc,	loop_2594
	ldx	[%l7 + 0x58],	%l6
loop_2592:
	orncc	%l3,	0x18A9,	%i3
loop_2593:
	popc	%l5,	%i4
loop_2594:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6D] %asi,	%o0
	fpack32	%f20,	%f6,	%f0
	set	0x68, %o6
	stwa	%i5,	[%l7 + %o6] 0x89
	tl	%xcc,	0x6
	mulscc	%g4,	%o5,	%i6
	membar	0x15
	orn	%o2,	%l2,	%l1
	fmovdcs	%icc,	%f30,	%f5
	edge16	%g6,	%i0,	%l0
	fmovspos	%icc,	%f28,	%f20
	tvc	%xcc,	0x5
	fmovrsne	%l4,	%f11,	%f14
	addc	%i1,	%o1,	%o6
	brlez,a	%o3,	loop_2595
	membar	0x6A
	edge16n	%o7,	%g2,	%g3
	set	0x19, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i2
loop_2595:
	fble,a	%fcc1,	loop_2596
	movpos	%xcc,	%g7,	%g5
	taddcctv	%g1,	0x0E9E,	%i7
	fmovrdgez	%o4,	%f16,	%f20
loop_2596:
	ld	[%l7 + 0x34],	%f29
	movrgz	%l6,	%i3,	%l3
	fcmple32	%f14,	%f20,	%i4
	fandnot2s	%f4,	%f0,	%f2
	subccc	%o0,	0x14DB,	%i5
	bcc	%icc,	loop_2597
	fbu,a	%fcc2,	loop_2598
	movrgz	%l5,	0x025,	%g4
	fmovdvc	%icc,	%f27,	%f26
loop_2597:
	fmul8sux16	%f8,	%f20,	%f12
loop_2598:
	tgu	%xcc,	0x4
	set	0x64, %g6
	sta	%f4,	[%l7 + %g6] 0x89
	fmovdgu	%xcc,	%f11,	%f27
	movre	%i6,	0x08F,	%o2
	fba	%fcc3,	loop_2599
	movne	%icc,	%o5,	%l1
	taddcc	%g6,	0x0249,	%l2
	array32	%l0,	%l4,	%i0
loop_2599:
	xnor	%i1,	0x0857,	%o1
	tl	%icc,	0x5
	sdivcc	%o3,	0x1EF2,	%o6
	bn,a	%icc,	loop_2600
	movvc	%icc,	%o7,	%g3
	fmovrdgez	%i2,	%f2,	%f22
	sethi	0x13C3,	%g2
loop_2600:
	fmovsvc	%icc,	%f5,	%f9
	tcc	%xcc,	0x3
	fnand	%f0,	%f16,	%f2
	fone	%f6
	wr	%g0,	0x23,	%asi
	stha	%g7,	[%l7 + 0x50] %asi
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x27,	%g4
	movleu	%icc,	%i7,	%o4
	popc	%l6,	%i3
	fmovrsgz	%l3,	%f7,	%f2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%o0
	andn	%g1,	%l5,	%g4
	movcc	%xcc,	%i6,	%o2
	pdist	%f18,	%f12,	%f24
	fornot1s	%f30,	%f2,	%f26
	bcc	loop_2601
	fcmpne16	%f22,	%f28,	%o5
	fbo	%fcc3,	loop_2602
	nop
	setx	loop_2603,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2601:
	call	loop_2604
	andcc	%l1,	0x04D2,	%i5
loop_2602:
	fcmpeq16	%f22,	%f18,	%g6
loop_2603:
	bne,a,pt	%icc,	loop_2605
loop_2604:
	fmovdne	%icc,	%f31,	%f25
	brlez	%l2,	loop_2606
	addc	%l0,	0x0598,	%l4
loop_2605:
	taddcc	%i1,	0x036C,	%o1
	fmovsge	%xcc,	%f29,	%f3
loop_2606:
	fmovsn	%xcc,	%f15,	%f1
	te	%icc,	0x7
	addccc	%i0,	%o6,	%o3
	edge16	%g3,	%o7,	%g2
	movvs	%xcc,	%g7,	%g5
	and	%i7,	0x09F6,	%i2
	fandnot2s	%f3,	%f4,	%f25
	movvs	%xcc,	%l6,	%o4
	array8	%i3,	%i4,	%o0
	fxors	%f10,	%f3,	%f18
	udivcc	%l3,	0x1B4E,	%g1
	stbar
	fmuld8ulx16	%f2,	%f29,	%f22
	subccc	%g4,	%i6,	%l5
	edge16n	%o5,	%l1,	%o2
	fcmped	%fcc2,	%f6,	%f20
	tle	%xcc,	0x7
	movne	%icc,	%i5,	%l2
	movrne	%l0,	0x3F4,	%g6
	xorcc	%i1,	0x15E7,	%o1
	edge16n	%l4,	%i0,	%o3
	set	0x52, %g3
	stba	%g3,	[%l7 + %g3] 0x27
	membar	#Sync
	addcc	%o7,	0x19F9,	%o6
	siam	0x3
	edge32l	%g2,	%g7,	%g5
	tneg	%xcc,	0x6
	fpmerge	%f3,	%f22,	%f8
	stx	%i7,	[%l7 + 0x20]
	fblg	%fcc1,	loop_2607
	movneg	%icc,	%i2,	%o4
	movle	%icc,	%l6,	%i4
	membar	0x31
loop_2607:
	fbule,a	%fcc0,	loop_2608
	fmovdl	%icc,	%f6,	%f21
	addcc	%i3,	%l3,	%g1
	movvc	%xcc,	%o0,	%g4
loop_2608:
	tg	%xcc,	0x7
	bleu	%icc,	loop_2609
	subccc	%l5,	0x0173,	%i6
	movge	%icc,	%l1,	%o2
	taddcc	%i5,	0x0CF6,	%l2
loop_2609:
	movne	%xcc,	%o5,	%l0
	fmovsvs	%xcc,	%f7,	%f0
	wr	%g0,	0xea,	%asi
	stha	%g6,	[%l7 + 0x74] %asi
	membar	#Sync
	movvs	%icc,	%i1,	%o1
	subc	%l4,	0x127A,	%o3
	addcc	%i0,	0x01B7,	%g3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2C] %asi,	%o6
	brlez,a	%o7,	loop_2610
	brlz	%g7,	loop_2611
	edge16ln	%g5,	%i7,	%g2
	wr	%g0,	0x2f,	%asi
	stwa	%o4,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_2610:
	ta	%icc,	0x1
loop_2611:
	tsubcc	%l6,	%i2,	%i4
	ldsb	[%l7 + 0x3C],	%l3
	alignaddr	%g1,	%i3,	%g4
	nop
	setx	loop_2612,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack16	%f2,	%f6
	ldub	[%l7 + 0x6D],	%l5
	bg,a,pt	%icc,	loop_2613
loop_2612:
	sub	%i6,	%l1,	%o2
	fble,a	%fcc1,	loop_2614
	fnors	%f5,	%f23,	%f27
loop_2613:
	fexpand	%f18,	%f26
	fbe,a	%fcc1,	loop_2615
loop_2614:
	fxor	%f24,	%f16,	%f22
	membar	0x4F
	ldx	[%l7 + 0x58],	%o0
loop_2615:
	sdiv	%i5,	0x1904,	%o5
	fsrc2	%f20,	%f16
	fbu	%fcc3,	loop_2616
	tcc	%icc,	0x6
	orn	%l0,	0x14A3,	%l2
	edge8ln	%i1,	%o1,	%l4
loop_2616:
	tle	%xcc,	0x5
	edge32	%o3,	%g6,	%i0
	tneg	%icc,	0x6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%o6
	fmul8sux16	%f6,	%f4,	%f20
	andn	%o7,	0x0647,	%g7
	orcc	%g3,	%g5,	%g2
	tl	%icc,	0x2
	mulscc	%o4,	0x087B,	%l6
	smul	%i2,	%i7,	%l3
	tvs	%icc,	0x2
	fmovdcc	%xcc,	%f28,	%f26
	alignaddrl	%i4,	%g1,	%g4
	mova	%xcc,	%i3,	%i6
	edge16n	%l1,	%l5,	%o2
	fba	%fcc2,	loop_2617
	fmuld8ulx16	%f11,	%f13,	%f0
	array8	%o0,	%i5,	%o5
	smulcc	%l0,	0x1C37,	%l2
loop_2617:
	nop
	set	0x54, %l4
	ldsha	[%l7 + %l4] 0x81,	%o1
	movle	%xcc,	%i1,	%o3
	bcs,a	loop_2618
	fmovdcc	%icc,	%f20,	%f4
	movrlez	%g6,	0x0B7,	%i0
	or	%o6,	%l4,	%o7
loop_2618:
	sra	%g3,	%g5,	%g2
	tne	%xcc,	0x2
	fsrc1s	%f31,	%f30
	edge32ln	%o4,	%l6,	%g7
	set	0x3C, %g1
	ldswa	[%l7 + %g1] 0x19,	%i2
	bpos	%icc,	loop_2619
	tg	%xcc,	0x1
	tsubcctv	%l3,	%i7,	%i4
	movre	%g1,	%i3,	%g4
loop_2619:
	tsubcc	%i6,	0x1784,	%l5
	fcmpgt32	%f26,	%f4,	%l1
	movne	%xcc,	%o0,	%o2
	smul	%i5,	0x1A92,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o5,	0x108D,	%o1
	edge16ln	%l2,	%i1,	%o3
	fnands	%f14,	%f28,	%f1
	fbo	%fcc1,	loop_2620
	fands	%f28,	%f4,	%f29
	edge16ln	%g6,	%i0,	%l4
	fpmerge	%f4,	%f25,	%f20
loop_2620:
	fornot2s	%f25,	%f13,	%f11
	set	0x1F, %i4
	lduba	[%l7 + %i4] 0x14,	%o6
	fmovrsne	%g3,	%f11,	%f28
	fmovdl	%icc,	%f26,	%f23
	xorcc	%g5,	%o7,	%g2
	bvc,a	%icc,	loop_2621
	alignaddrl	%l6,	%o4,	%i2
	udivcc	%l3,	0x0489,	%g7
	mulx	%i7,	%g1,	%i4
loop_2621:
	movpos	%xcc,	%g4,	%i6
	tcs	%xcc,	0x4
	alignaddrl	%l5,	%i3,	%l1
	fbge	%fcc3,	loop_2622
	tsubcctv	%o0,	%i5,	%o2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o5
loop_2622:
	fbo	%fcc2,	loop_2623
	bleu,a	loop_2624
	fcmple32	%f14,	%f26,	%o1
	ldstub	[%l7 + 0x6B],	%l2
loop_2623:
	smulcc	%i1,	0x0C6D,	%g6
loop_2624:
	edge8ln	%i0,	%l4,	%o6
	orn	%g3,	0x1F67,	%o3
	movne	%xcc,	%o7,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g2,	0x06C0,	%o4
	mulscc	%l6,	0x109E,	%l3
	addcc	%i2,	0x1BA9,	%i7
	tvs	%icc,	0x0
	edge16ln	%g1,	%g7,	%i4
	fbo,a	%fcc1,	loop_2625
	brlz	%g4,	loop_2626
	bne,a,pn	%icc,	loop_2627
	sdivx	%l5,	0x1FE5,	%i6
loop_2625:
	ldx	[%l7 + 0x20],	%i3
loop_2626:
	udiv	%l1,	0x1A4E,	%i5
loop_2627:
	tne	%xcc,	0x2
	set	0x10, %l5
	lduha	[%l7 + %l5] 0x19,	%o2
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32n	%o0,	%l0,	%o1
	smul	%o5,	0x15E5,	%i1
	alignaddrl	%l2,	%g6,	%i0
	stbar
	tle	%icc,	0x3
	srlx	%l4,	0x05,	%g3
	and	%o6,	0x0F0F,	%o7
	movle	%xcc,	%g5,	%g2
	fsrc1	%f24,	%f10
	xor	%o3,	0x174F,	%o4
	edge32	%l6,	%l3,	%i2
	edge8	%g1,	%i7,	%g7
	tsubcc	%g4,	0x0E4D,	%l5
	sdivcc	%i4,	0x0BB7,	%i3
	udivx	%i6,	0x02B8,	%l1
	lduh	[%l7 + 0x2C],	%o2
	movrne	%i5,	%o0,	%l0
	fpsub32s	%f3,	%f0,	%f5
	srl	%o1,	%i1,	%l2
	call	loop_2628
	sdivx	%o5,	0x05B9,	%i0
	brlz,a	%g6,	loop_2629
	or	%g3,	0x0593,	%l4
loop_2628:
	or	%o6,	0x1472,	%g5
	ldub	[%l7 + 0x5E],	%g2
loop_2629:
	array8	%o7,	%o3,	%l6
	srlx	%l3,	0x00,	%i2
	fblg	%fcc0,	loop_2630
	umul	%g1,	%o4,	%i7
	array8	%g7,	%l5,	%g4
	wr	%g0,	0xea,	%asi
	stwa	%i4,	[%l7 + 0x2C] %asi
	membar	#Sync
loop_2630:
	movcc	%icc,	%i6,	%l1
	swap	[%l7 + 0x24],	%i3
	tsubcc	%o2,	%o0,	%i5
	addc	%l0,	0x1AF7,	%i1
	movpos	%icc,	%l2,	%o5
	bleu,a	loop_2631
	array8	%o1,	%i0,	%g6
	edge16l	%l4,	%g3,	%g5
	fcmps	%fcc3,	%f23,	%f19
loop_2631:
	sethi	0x0B4B,	%g2
	movrne	%o7,	0x062,	%o3
	fmovdvc	%icc,	%f24,	%f6
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x88,	%o6
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f8
	fmovrse	%l3,	%f28,	%f16
	sll	%i2,	%l6,	%g1
	fblg	%fcc3,	loop_2632
	fnot1s	%f26,	%f1
	edge16ln	%i7,	%g7,	%o4
	addcc	%l5,	%i4,	%g4
loop_2632:
	nop
	set	0x78, %l0
	stba	%l1,	[%l7 + %l0] 0xe3
	membar	#Sync
	move	%icc,	%i6,	%o2
	udiv	%o0,	0x1175,	%i5
	nop
	setx loop_2633, %l0, %l1
	jmpl %l1, %l0
	fbn,a	%fcc2,	loop_2634
	tsubcctv	%i1,	0x1430,	%l2
	xorcc	%i3,	%o5,	%o1
loop_2633:
	movrne	%i0,	0x11F,	%g6
loop_2634:
	sethi	0x1966,	%l4
	tpos	%icc,	0x3
	sdivx	%g3,	0x0A09,	%g2
	fmovdn	%xcc,	%f26,	%f27
	edge8l	%g5,	%o7,	%o6
	fmovsvs	%xcc,	%f26,	%f7
	brnz	%l3,	loop_2635
	taddcctv	%o3,	%l6,	%i2
	xor	%i7,	%g1,	%o4
	stw	%l5,	[%l7 + 0x0C]
loop_2635:
	fmovdleu	%xcc,	%f3,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g7,	%g4,	%l1
	wr	%g0,	0xeb,	%asi
	stha	%i6,	[%l7 + 0x5A] %asi
	membar	#Sync
	movrgz	%i4,	%o2,	%i5
	addc	%o0,	0x1B88,	%i1
	tvc	%icc,	0x6
	sdivcc	%l0,	0x0507,	%i3
	popc	0x09DC,	%l2
	fmul8x16al	%f17,	%f4,	%f18
	std	%f8,	[%l7 + 0x28]
	ld	[%l7 + 0x60],	%f21
	movg	%icc,	%o5,	%i0
	tvc	%xcc,	0x0
	ldub	[%l7 + 0x7A],	%o1
	fmovrse	%l4,	%f3,	%f4
	xorcc	%g6,	0x0FF0,	%g2
	wr	%g0,	0x80,	%asi
	sta	%f27,	[%l7 + 0x20] %asi
	fpadd16s	%f12,	%f1,	%f6
	movvc	%xcc,	%g3,	%g5
	tpos	%icc,	0x5
	sdiv	%o6,	0x1FC8,	%o7
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x89
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	fmul8ulx16	%f8,	%f14,	%f2
	ld	[%l7 + 0x64],	%f7
	be,a,pt	%xcc,	loop_2636
	udiv	%l3,	0x02D5,	%i2
	movcs	%icc,	%l6,	%g1
	fsrc1	%f22,	%f18
loop_2636:
	fmovsgu	%xcc,	%f29,	%f8
	edge8	%i7,	%o4,	%g7
	std	%f6,	[%l7 + 0x08]
	movl	%xcc,	%g4,	%l5
	fpsub16	%f10,	%f26,	%f14
	fba,a	%fcc2,	loop_2637
	movvc	%icc,	%i6,	%i4
	tcc	%xcc,	0x6
	sdivcc	%o2,	0x0650,	%l1
loop_2637:
	addc	%i5,	0x0DFB,	%i1
	fmovrse	%l0,	%f20,	%f5
	srl	%o0,	0x0F,	%i3
	xnorcc	%l2,	0x1B3E,	%o5
	ble,pt	%xcc,	loop_2638
	brgz	%o1,	loop_2639
	fmul8x16al	%f16,	%f20,	%f18
	nop
	setx loop_2640, %l0, %l1
	jmpl %l1, %l4
loop_2638:
	fmovdle	%xcc,	%f28,	%f23
loop_2639:
	array32	%i0,	%g6,	%g3
	sub	%g2,	%o6,	%g5
loop_2640:
	addcc	%o7,	0x1026,	%o3
	ldstub	[%l7 + 0x73],	%i2
	or	%l3,	%g1,	%i7
	fnegs	%f12,	%f28
	smul	%l6,	0x1EDC,	%g7
	andcc	%g4,	0x0604,	%o4
	tpos	%icc,	0x2
	wr	%g0,	0x18,	%asi
	stda	%l4,	[%l7 + 0x10] %asi
	lduw	[%l7 + 0x14],	%i6
	tleu	%xcc,	0x4
	bcs	loop_2641
	fone	%f20
	fmovdleu	%xcc,	%f21,	%f28
	fmovdl	%xcc,	%f22,	%f23
loop_2641:
	fandnot2	%f0,	%f18,	%f12
	brz	%o2,	loop_2642
	srl	%l1,	%i5,	%i4
	fandnot1	%f0,	%f12,	%f26
	fornot2s	%f8,	%f13,	%f8
loop_2642:
	nop
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x0c,	 0x0
	edge8ln	%o0,	%i3,	%l2
	movle	%xcc,	%i1,	%o1
	fmovdpos	%xcc,	%f6,	%f3
	umul	%l4,	%o5,	%i0
	fmovrdlz	%g6,	%f28,	%f26
	xnorcc	%g3,	%o6,	%g5
	edge16	%o7,	%g2,	%i2
	siam	0x6
	taddcc	%l3,	0x05CE,	%g1
	fpadd16	%f28,	%f14,	%f22
	array8	%o3,	%i7,	%g7
	alignaddr	%l6,	%o4,	%g4
	taddcctv	%i6,	%o2,	%l1
	movrgez	%l5,	0x0C0,	%i5
	brlez	%i4,	loop_2643
	mova	%icc,	%o0,	%i3
	tge	%xcc,	0x1
	fmul8ulx16	%f8,	%f20,	%f28
loop_2643:
	sth	%l2,	[%l7 + 0x44]
	tvs	%icc,	0x1
	addc	%l0,	0x1F9D,	%o1
	tgu	%xcc,	0x0
	edge8l	%i1,	%o5,	%i0
	fbuge,a	%fcc2,	loop_2644
	ldd	[%l7 + 0x20],	%f30
	fxnors	%f3,	%f0,	%f20
	fnot1	%f26,	%f16
loop_2644:
	tne	%icc,	0x6
	subc	%l4,	0x0B76,	%g6
	ldub	[%l7 + 0x28],	%g3
	mova	%icc,	%g5,	%o7
	movle	%icc,	%g2,	%o6
	flush	%l7 + 0x40
	orcc	%i2,	%l3,	%g1
	ble,a,pt	%xcc,	loop_2645
	srlx	%i7,	0x0D,	%o3
	nop
	setx loop_2646, %l0, %l1
	jmpl %l1, %l6
	movleu	%icc,	%g7,	%g4
loop_2645:
	nop
	setx	loop_2647,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%i6,	%o2,	%o4
loop_2646:
	sub	%l5,	0x149A,	%i5
	fmovsge	%xcc,	%f10,	%f30
loop_2647:
	fbe,a	%fcc3,	loop_2648
	fpadd16s	%f4,	%f9,	%f23
	movvs	%xcc,	%l1,	%o0
	tge	%xcc,	0x6
loop_2648:
	tl	%xcc,	0x7
	tvs	%xcc,	0x6
	bcc,pt	%xcc,	loop_2649
	fmuld8ulx16	%f31,	%f13,	%f14
	fxors	%f3,	%f7,	%f19
	stw	%i3,	[%l7 + 0x74]
loop_2649:
	ta	%xcc,	0x5
	bvs,a	loop_2650
	edge8l	%i4,	%l2,	%l0
	taddcc	%o1,	%i1,	%i0
	andn	%o5,	0x1ABE,	%g6
loop_2650:
	fmovsg	%icc,	%f28,	%f8
	ldd	[%l7 + 0x60],	%f4
	fxor	%f2,	%f28,	%f0
	fmovs	%f4,	%f4
	ta	%icc,	0x2
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g3
	sll	%g5,	0x10,	%l4
	nop
	setx	loop_2651,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bgu,a,pt	%xcc,	loop_2652
	movvs	%xcc,	%g2,	%o6
	sub	%o7,	0x0C5C,	%l3
loop_2651:
	array32	%i2,	%g1,	%i7
loop_2652:
	umulcc	%l6,	0x0C6F,	%g7
	fmul8ulx16	%f10,	%f14,	%f0
	andn	%o3,	%i6,	%o2
	flush	%l7 + 0x18
	alignaddr	%g4,	%l5,	%i5
	alignaddr	%l1,	%o4,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%i4
	tge	%icc,	0x3
	ldx	[%l7 + 0x10],	%l2
	lduh	[%l7 + 0x24],	%o1
	mulscc	%i1,	0x0ECE,	%l0
	taddcctv	%i0,	%o5,	%g6
	movvs	%xcc,	%g5,	%l4
	array8	%g2,	%g3,	%o7
	fpadd32	%f26,	%f20,	%f0
	stx	%l3,	[%l7 + 0x08]
	edge8ln	%o6,	%i2,	%g1
	stb	%i7,	[%l7 + 0x45]
	set	0x29, %o2
	ldstuba	[%l7 + %o2] 0x80,	%l6
	tne	%icc,	0x0
	orncc	%o3,	%g7,	%i6
	umul	%g4,	0x1B73,	%l5
	srlx	%i5,	%o2,	%l1
	fbl	%fcc1,	loop_2653
	fbe	%fcc1,	loop_2654
	addc	%o4,	0x11F9,	%o0
	set	0x40, %i7
	stwa	%i4,	[%l7 + %i7] 0x14
loop_2653:
	bg	%xcc,	loop_2655
loop_2654:
	andncc	%i3,	%o1,	%i1
	fmovscc	%icc,	%f20,	%f31
	movn	%xcc,	%l2,	%i0
loop_2655:
	umulcc	%o5,	%g6,	%l0
	fnot2s	%f22,	%f20
	fzero	%f22
	srlx	%g5,	0x0C,	%g2
	mulscc	%l4,	%g3,	%o7
	be	%xcc,	loop_2656
	mova	%xcc,	%o6,	%l3
	fnegd	%f18,	%f28
	tvc	%xcc,	0x7
loop_2656:
	tcc	%xcc,	0x0
	fbl	%fcc0,	loop_2657
	tsubcc	%i2,	0x0F2F,	%i7
	fbul,a	%fcc0,	loop_2658
	udiv	%g1,	0x0947,	%o3
loop_2657:
	movleu	%xcc,	%g7,	%l6
	subcc	%g4,	%l5,	%i5
loop_2658:
	ldstub	[%l7 + 0x2C],	%i6
	fexpand	%f14,	%f24
	tpos	%xcc,	0x0
	fcmpne16	%f14,	%f14,	%l1
	tcc	%icc,	0x2
	sra	%o2,	%o0,	%o4
	faligndata	%f6,	%f10,	%f14
	edge32	%i4,	%i3,	%i1
	sub	%o1,	0x0505,	%i0
	movge	%xcc,	%l2,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f0,	%f14,	%f27
	subc	%l0,	%o5,	%g5
	subc	%l4,	%g2,	%o7
	movgu	%xcc,	%o6,	%g3
	movcs	%xcc,	%i2,	%l3
	subcc	%i7,	0x111F,	%g1
	tvc	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o3,	%l6
	wr	%g0,	0x27,	%asi
	stha	%g7,	[%l7 + 0x2E] %asi
	membar	#Sync
	sir	0x07CA
	for	%f10,	%f20,	%f22
	bneg,a,pt	%xcc,	loop_2659
	edge8l	%g4,	%l5,	%i6
	bpos,pn	%xcc,	loop_2660
	fbg,a	%fcc1,	loop_2661
loop_2659:
	fmovdcs	%xcc,	%f0,	%f31
	wr	%g0,	0xe2,	%asi
	stda	%l0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2660:
	ta	%icc,	0x4
loop_2661:
	subc	%i5,	%o2,	%o0
	andncc	%i4,	%i3,	%o4
	fmovdcs	%icc,	%f1,	%f1
	movrlez	%i1,	%i0,	%o1
	edge16ln	%l2,	%l0,	%g6
	popc	%g5,	%o5
	tpos	%xcc,	0x1
	popc	%g2,	%o7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x1F] %asi,	%l4
	sth	%g3,	[%l7 + 0x50]
	tsubcc	%o6,	%l3,	%i7
	fble	%fcc3,	loop_2662
	move	%icc,	%i2,	%o3
	fmovrdne	%g1,	%f30,	%f14
	tsubcc	%l6,	0x18DF,	%g4
loop_2662:
	movne	%icc,	%g7,	%i6
	fmovrdgz	%l1,	%f10,	%f0
	sdiv	%i5,	0x1373,	%l5
	set	0x50, %g2
	lda	[%l7 + %g2] 0x11,	%f11
	tvc	%icc,	0x4
	fandnot1s	%f29,	%f19,	%f23
	srl	%o2,	0x0B,	%i4
	fzero	%f8
	edge16ln	%i3,	%o4,	%i1
	addc	%i0,	%o0,	%o1
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f18
	tpos	%xcc,	0x0
	fmovrsgz	%l2,	%f31,	%f15
	umulcc	%g6,	0x0BFF,	%l0
	orcc	%g5,	0x0FFC,	%g2
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x89,	%o7
	xor	%o5,	%l4,	%o6
	lduw	[%l7 + 0x10],	%g3
	movge	%icc,	%i7,	%l3
	mulscc	%i2,	%o3,	%l6
	edge8n	%g1,	%g7,	%g4
	orncc	%l1,	0x062A,	%i5
	fsrc2s	%f29,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4E, %i0
	ldsba	[%l7 + %i0] 0x80,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o2
	ble,a,pt	%icc,	loop_2663
	tpos	%icc,	0x4
	tge	%icc,	0x5
	array32	%i4,	%l5,	%i3
loop_2663:
	movre	%o4,	0x135,	%i0
	faligndata	%f12,	%f24,	%f0
	edge16n	%i1,	%o1,	%l2
	fnot1s	%f28,	%f26
	fnegs	%f12,	%f21
	edge8ln	%g6,	%o0,	%g5
	fmovrslez	%l0,	%f4,	%f21
	set	0x70, %o3
	stba	%o7,	[%l7 + %o3] 0x23
	membar	#Sync
	alignaddrl	%g2,	%l4,	%o6
	movre	%g3,	0x04F,	%i7
	tvc	%xcc,	0x4
	tg	%xcc,	0x4
	array32	%l3,	%i2,	%o3
	wr	%g0,	0x2b,	%asi
	stha	%l6,	[%l7 + 0x74] %asi
	membar	#Sync
	fbge	%fcc0,	loop_2664
	edge16ln	%o5,	%g1,	%g7
	popc	%l1,	%g4
	ba,a,pt	%icc,	loop_2665
loop_2664:
	and	%i5,	0x0C29,	%i6
	flush	%l7 + 0x30
	fblg,a	%fcc0,	loop_2666
loop_2665:
	membar	0x4F
	stx	%i4,	[%l7 + 0x30]
	fands	%f11,	%f5,	%f10
loop_2666:
	fcmple32	%f8,	%f10,	%l5
	edge8	%o2,	%o4,	%i0
	bgu,pn	%xcc,	loop_2667
	ldx	[%l7 + 0x30],	%i3
	wr	%g0,	0x89,	%asi
	stda	%o0,	[%l7 + 0x50] %asi
loop_2667:
	fmovrslz	%l2,	%f30,	%f5
	movne	%xcc,	%i1,	%o0
	fmovdleu	%xcc,	%f28,	%f11
	tne	%xcc,	0x7
	umulcc	%g6,	0x18BA,	%g5
	fcmps	%fcc2,	%f11,	%f14
	fmuld8sux16	%f3,	%f22,	%f22
	edge16ln	%o7,	%l0,	%l4
	fbue,a	%fcc2,	loop_2668
	ld	[%l7 + 0x0C],	%f21
	edge32n	%o6,	%g2,	%g3
	fandnot1	%f2,	%f6,	%f26
loop_2668:
	smul	%i7,	0x193C,	%l3
	subccc	%i2,	%l6,	%o5
	edge32ln	%g1,	%g7,	%l1
	popc	%o3,	%i5
	bgu,a	loop_2669
	addcc	%i6,	0x03BA,	%i4
	edge8n	%g4,	%o2,	%o4
	movrgez	%l5,	%i3,	%o1
loop_2669:
	fpack16	%f12,	%f11
	fba,a	%fcc0,	loop_2670
	ldd	[%l7 + 0x30],	%l2
	ldsh	[%l7 + 0x42],	%i0
	sll	%o0,	%i1,	%g6
loop_2670:
	movrlz	%g5,	0x1EB,	%o7
	movrlz	%l0,	%o6,	%l4
	edge16l	%g2,	%g3,	%l3
	xor	%i2,	%i7,	%o5
	sllx	%g1,	0x02,	%l6
	movleu	%xcc,	%g7,	%l1
	fmovrsne	%i5,	%f17,	%f4
	mova	%xcc,	%i6,	%i4
	fmovdgu	%xcc,	%f15,	%f3
	fcmpgt16	%f4,	%f30,	%g4
	bn,pt	%icc,	loop_2671
	udiv	%o2,	0x1200,	%o3
	ldsb	[%l7 + 0x66],	%o4
	bl	loop_2672
loop_2671:
	edge8	%l5,	%o1,	%i3
	sdivcc	%i0,	0x0614,	%o0
	movg	%icc,	%l2,	%i1
loop_2672:
	ldx	[%l7 + 0x30],	%g6
	srl	%o7,	0x06,	%l0
	udivx	%g5,	0x02BC,	%o6
	fmovrsne	%l4,	%f30,	%f5
	wr	%g0,	0x2b,	%asi
	stwa	%g3,	[%l7 + 0x14] %asi
	membar	#Sync
	fmovdleu	%xcc,	%f31,	%f24
	fxnor	%f30,	%f6,	%f10
	tl	%xcc,	0x2
	fmovrde	%g2,	%f16,	%f10
	movg	%icc,	%i2,	%l3
	movcs	%xcc,	%o5,	%i7
	andncc	%l6,	%g1,	%l1
	edge16n	%i5,	%g7,	%i6
	umulcc	%g4,	%i4,	%o3
	udivx	%o2,	0x1DFB,	%o4
	sdivx	%o1,	0x04DE,	%i3
	set	0x5C, %i1
	sta	%f10,	[%l7 + %i1] 0x15
	bpos	%icc,	loop_2673
	movgu	%xcc,	%l5,	%i0
	brnz,a	%o0,	loop_2674
	bcc,a,pt	%xcc,	loop_2675
loop_2673:
	movre	%i1,	0x1ED,	%g6
	array32	%o7,	%l0,	%l2
loop_2674:
	tn	%xcc,	0x7
loop_2675:
	fmovdge	%icc,	%f22,	%f15
	movn	%icc,	%o6,	%l4
	swap	[%l7 + 0x28],	%g3
	edge16	%g2,	%i2,	%l3
	fmovsle	%xcc,	%f19,	%f11
	umulcc	%g5,	0x0F54,	%i7
	fcmped	%fcc1,	%f16,	%f2
	tneg	%icc,	0x4
	fabss	%f24,	%f3
	tvc	%icc,	0x5
	fmovdcs	%icc,	%f16,	%f27
	fmovdgu	%icc,	%f15,	%f21
	orncc	%l6,	%o5,	%l1
	movge	%icc,	%i5,	%g7
	subccc	%i6,	0x04B4,	%g1
	movrlz	%g4,	0x393,	%o3
	movge	%icc,	%i4,	%o2
	fabss	%f20,	%f15
	fcmpeq32	%f8,	%f14,	%o1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	sdivx	%l5,	0x1D00,	%i3
	tvc	%icc,	0x2
	movrlz	%o0,	%i0,	%g6
	fbu,a	%fcc0,	loop_2676
	fabsd	%f6,	%f20
	fbge,a	%fcc0,	loop_2677
	orn	%i1,	%l0,	%l2
loop_2676:
	add	%o7,	%o6,	%l4
	srlx	%g2,	0x19,	%g3
loop_2677:
	tvs	%xcc,	0x7
	srl	%i2,	%g5,	%i7
	fbge,a	%fcc0,	loop_2678
	sllx	%l3,	%o5,	%l6
	movre	%i5,	%g7,	%i6
	fmovdneg	%xcc,	%f7,	%f29
loop_2678:
	movpos	%icc,	%g1,	%g4
	mova	%icc,	%o3,	%l1
	fmovdcc	%icc,	%f26,	%f21
	tgu	%xcc,	0x3
	fblg,a	%fcc2,	loop_2679
	mova	%icc,	%o2,	%o1
	tle	%xcc,	0x4
	addccc	%i4,	%l5,	%i3
loop_2679:
	edge8n	%o4,	%o0,	%g6
	movle	%xcc,	%i1,	%i0
	sll	%l2,	%o7,	%o6
	ta	%xcc,	0x1
	movvc	%icc,	%l0,	%l4
	bvs,a	%xcc,	loop_2680
	taddcctv	%g2,	%g3,	%i2
	sth	%g5,	[%l7 + 0x38]
	tneg	%xcc,	0x5
loop_2680:
	brgez	%i7,	loop_2681
	tsubcctv	%o5,	0x0BB4,	%l3
	flush	%l7 + 0x08
	stx	%i5,	[%l7 + 0x78]
loop_2681:
	subc	%g7,	%l6,	%i6
	srl	%g4,	0x14,	%g1
	fmuld8sux16	%f9,	%f15,	%f30
	movvs	%icc,	%l1,	%o2
	add	%o1,	0x057D,	%i4
	tsubcc	%o3,	0x0D9B,	%l5
	array8	%i3,	%o0,	%o4
	sir	0x0F7B
	fcmpd	%fcc1,	%f14,	%f12
	lduh	[%l7 + 0x70],	%i1
	fpsub32s	%f28,	%f2,	%f16
	fnands	%f12,	%f9,	%f21
	bn,pn	%icc,	loop_2682
	popc	0x0530,	%g6
	set	0x30, %o4
	stda	%i0,	[%l7 + %o4] 0x14
loop_2682:
	movge	%icc,	%l2,	%o7
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x11,	%o6
	membar	0x1C
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%l0
	sethi	0x15EE,	%g2
	xorcc	%i2,	0x034A,	%g5
	for	%f28,	%f0,	%f18
	edge32l	%g3,	%i7,	%l3
	tleu	%icc,	0x4
	movleu	%xcc,	%o5,	%g7
	edge32ln	%l6,	%i5,	%g4
	fones	%f2
	bneg,a,pt	%icc,	loop_2683
	fnot2	%f12,	%f14
	fandnot2	%f0,	%f24,	%f28
	ta	%xcc,	0x4
loop_2683:
	move	%icc,	%i6,	%l1
	fbu	%fcc1,	loop_2684
	fnor	%f2,	%f6,	%f16
	movgu	%xcc,	%g1,	%o1
	movvc	%xcc,	%o2,	%o3
loop_2684:
	sub	%l5,	0x039D,	%i4
	fmovrsne	%o0,	%f15,	%f26
	fmovsa	%icc,	%f12,	%f6
	udivx	%i3,	0x1B1B,	%o4
	fmovscs	%icc,	%f21,	%f31
	fnegs	%f12,	%f6
	edge32	%g6,	%i1,	%l2
	fmovrdne	%i0,	%f10,	%f12
	ldsw	[%l7 + 0x18],	%o6
	bne,a	loop_2685
	fbg,a	%fcc0,	loop_2686
	tcc	%xcc,	0x5
	orcc	%o7,	0x0C34,	%l4
loop_2685:
	edge8	%l0,	%i2,	%g5
loop_2686:
	udivx	%g3,	0x0E37,	%g2
	fmovdgu	%icc,	%f20,	%f26
	udiv	%l3,	0x14A8,	%o5
	fmovsg	%xcc,	%f23,	%f14
	prefetch	[%l7 + 0x60],	 0x0
	fmovsa	%xcc,	%f26,	%f16
	tn	%icc,	0x3
	array16	%i7,	%l6,	%g7
	edge16	%i5,	%g4,	%l1
	umul	%i6,	0x1D95,	%g1
	orcc	%o2,	%o1,	%o3
	tn	%xcc,	0x3
	membar	0x47
	edge16n	%l5,	%i4,	%i3
	andn	%o0,	%o4,	%g6
	fbl	%fcc2,	loop_2687
	edge8	%l2,	%i0,	%o6
	movl	%xcc,	%i1,	%l4
	fbge	%fcc0,	loop_2688
loop_2687:
	edge8n	%l0,	%i2,	%o7
	swap	[%l7 + 0x44],	%g3
	fpsub16	%f0,	%f14,	%f16
loop_2688:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	loop_2689
	movrgez	%g5,	0x3F3,	%l3
	wr	%g0,	0x89,	%asi
	stwa	%o5,	[%l7 + 0x20] %asi
loop_2689:
	fmovrsgez	%i7,	%f1,	%f5
	andn	%l6,	%g2,	%i5
	tpos	%xcc,	0x2
	movne	%xcc,	%g4,	%g7
	subcc	%i6,	0x0514,	%l1
	movrgz	%g1,	%o1,	%o2
	fble,a	%fcc3,	loop_2690
	fmovrse	%o3,	%f29,	%f18
	fandnot1s	%f1,	%f0,	%f8
	sll	%l5,	%i3,	%i4
loop_2690:
	bvs,pn	%xcc,	loop_2691
	tle	%icc,	0x3
	tgu	%xcc,	0x0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o0,	%o4
loop_2691:
	movne	%icc,	%g6,	%i0
	xorcc	%o6,	%i1,	%l2
	flush	%l7 + 0x30
	movrlz	%l4,	%l0,	%o7
	movl	%icc,	%i2,	%g5
	edge16ln	%g3,	%o5,	%i7
	orcc	%l3,	%g2,	%i5
	nop
	setx loop_2692, %l0, %l1
	jmpl %l1, %g4
	taddcctv	%g7,	%i6,	%l1
	sllx	%g1,	%o1,	%o2
	bge,pt	%xcc,	loop_2693
loop_2692:
	sdivcc	%o3,	0x1039,	%l5
	movgu	%xcc,	%l6,	%i4
	std	%i2,	[%l7 + 0x48]
loop_2693:
	orn	%o0,	%g6,	%o4
	std	%i0,	[%l7 + 0x60]
	tge	%xcc,	0x5
	alignaddrl	%o6,	%l2,	%l4
	nop
	setx loop_2694, %l0, %l1
	jmpl %l1, %i1
	xor	%l0,	0x0FAE,	%o7
	fmovdvc	%icc,	%f14,	%f22
	mulx	%i2,	0x1789,	%g5
loop_2694:
	call	loop_2695
	bvc	%xcc,	loop_2696
	xor	%g3,	0x17CA,	%i7
	bge,a,pn	%xcc,	loop_2697
loop_2695:
	sra	%l3,	%g2,	%o5
loop_2696:
	sdiv	%i5,	0x0D4A,	%g7
	fones	%f12
loop_2697:
	movvc	%icc,	%g4,	%l1
	fpack32	%f26,	%f12,	%f16
	xnorcc	%g1,	0x10BB,	%o1
	tleu	%icc,	0x5
	bvs,a,pn	%icc,	loop_2698
	bleu,a	%icc,	loop_2699
	tcs	%xcc,	0x5
	prefetch	[%l7 + 0x18],	 0x3
loop_2698:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x38] %asi,	%o2
loop_2699:
	movleu	%icc,	%i6,	%l5
	fmovdvc	%xcc,	%f9,	%f28
	edge32n	%o3,	%l6,	%i3
	membar	0x78
	fpadd32	%f4,	%f6,	%f20
	movg	%xcc,	%i4,	%g6
	set	0x44, %i3
	ldswa	[%l7 + %i3] 0x80,	%o4
	edge16n	%i0,	%o6,	%o0
	tvc	%xcc,	0x1
	andncc	%l2,	%l4,	%i1
	tvs	%xcc,	0x3
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tsubcctv	%l0,	%i2,	%g5
	std	%g2,	[%l7 + 0x48]
	flush	%l7 + 0x24
	fxors	%f1,	%f20,	%f2
	or	%i7,	0x0F7C,	%o7
	edge16l	%g2,	%o5,	%l3
	fmul8x16au	%f19,	%f5,	%f28
	ldsw	[%l7 + 0x34],	%g7
	sir	0x0396
	bneg,pn	%xcc,	loop_2700
	fmovdg	%icc,	%f9,	%f4
	movpos	%icc,	%i5,	%l1
	edge8	%g4,	%o1,	%g1
loop_2700:
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
	mulx	%i6,	%o2,	%o3
	movgu	%icc,	%l6,	%l5
	tcs	%icc,	0x1
loop_2701:
	fpadd32	%f18,	%f0,	%f8
	sdivx	%i3,	0x1EAB,	%g6
	tne	%icc,	0x3
	umul	%o4,	%i0,	%o6
	fpadd16s	%f20,	%f14,	%f7
	tle	%xcc,	0x5
	ta	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f28,	%f30
	array32	%o0,	%i4,	%l2
	movrgez	%l4,	0x149,	%i1
	fpackfix	%f10,	%f1
	movn	%xcc,	%l0,	%g5
	fmovdleu	%xcc,	%f30,	%f24
	sra	%i2,	0x09,	%g3
	movvc	%icc,	%o7,	%g2
	set	0x3A, %o1
	lduha	[%l7 + %o1] 0x89,	%i7
	set	0x6F, %o5
	lduba	[%l7 + %o5] 0x88,	%l3
	xor	%o5,	%g7,	%l1
	tsubcc	%g4,	%o1,	%g1
	mulx	%i6,	%o2,	%o3
	alignaddrl	%i5,	%l5,	%l6
	fmovd	%f20,	%f16
	fble	%fcc0,	loop_2702
	edge32l	%g6,	%i3,	%i0
	fmul8sux16	%f28,	%f20,	%f26
	tleu	%xcc,	0x3
loop_2702:
	ldsh	[%l7 + 0x1C],	%o4
	fmovsle	%icc,	%f0,	%f4
	brgez	%o0,	loop_2703
	st	%f6,	[%l7 + 0x64]
	tpos	%xcc,	0x0
	brlz,a	%o6,	loop_2704
loop_2703:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i4,	0x1343,	%l4
	tle	%xcc,	0x2
loop_2704:
	tgu	%icc,	0x1
	umul	%l2,	%i1,	%l0
	andcc	%i2,	%g3,	%o7
	xnorcc	%g5,	0x0B0D,	%i7
	wr	%g0,	0x23,	%asi
	stha	%l3,	[%l7 + 0x7C] %asi
	membar	#Sync
	movpos	%icc,	%o5,	%g7
	stx	%l1,	[%l7 + 0x70]
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x30] %asi,	%g4
	array8	%o1,	%g2,	%g1
	fmovsleu	%xcc,	%f19,	%f6
	te	%icc,	0x1
	addccc	%i6,	0x1F5A,	%o3
	fxnor	%f26,	%f28,	%f18
	brnz	%i5,	loop_2705
	movpos	%icc,	%o2,	%l5
	fnot2	%f16,	%f6
	edge8n	%l6,	%g6,	%i0
loop_2705:
	sethi	0x0A8C,	%o4
	brz,a	%i3,	loop_2706
	movgu	%xcc,	%o0,	%o6
	mulx	%i4,	%l2,	%i1
	movl	%xcc,	%l4,	%l0
loop_2706:
	sethi	0x0295,	%g3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o7
	tcs	%icc,	0x7
	movge	%xcc,	%g5,	%i2
	edge32	%i7,	%l3,	%g7
	fmovda	%xcc,	%f27,	%f9
	taddcc	%o5,	%l1,	%o1
	movcc	%icc,	%g4,	%g1
	bne,a,pn	%icc,	loop_2707
	sdivcc	%g2,	0x1DD9,	%i6
	orn	%i5,	0x1673,	%o3
	fnot2	%f12,	%f14
loop_2707:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o2,	%l5,	%g6
	fmovdge	%icc,	%f14,	%f31
	brz	%l6,	loop_2708
	sll	%i0,	%i3,	%o4
	fcmpeq16	%f2,	%f0,	%o6
	xnorcc	%i4,	%o0,	%i1
loop_2708:
	fmovda	%xcc,	%f2,	%f26
	fmovdn	%icc,	%f15,	%f22
	fornot2	%f18,	%f2,	%f30
	movrlez	%l2,	%l0,	%l4
	fmovdge	%icc,	%f4,	%f29
	movcc	%icc,	%g3,	%g5
	mulx	%i2,	%o7,	%l3
	fmovsl	%xcc,	%f28,	%f13
	edge8l	%g7,	%i7,	%l1
	tcs	%xcc,	0x2
	fmovrse	%o1,	%f7,	%f8
	movrne	%o5,	0x2E8,	%g1
	xnor	%g2,	0x161B,	%i6
	fmovrdne	%i5,	%f16,	%f16
	fsrc1s	%f14,	%f16
	tsubcctv	%g4,	%o3,	%o2
	brlez	%g6,	loop_2709
	membar	0x69
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%l6
loop_2709:
	tn	%xcc,	0x5
	movrgez	%l5,	%i0,	%o4
	ldd	[%l7 + 0x68],	%f2
	std	%f10,	[%l7 + 0x20]
	movcc	%xcc,	%i3,	%o6
	move	%icc,	%o0,	%i4
	srl	%i1,	0x0E,	%l0
	ldsb	[%l7 + 0x53],	%l4
	bcs,a,pt	%xcc,	loop_2710
	edge16	%g3,	%l2,	%i2
	set	0x50, %l2
	lduwa	[%l7 + %l2] 0x18,	%o7
loop_2710:
	lduw	[%l7 + 0x30],	%g5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sll	%l3,	%i7,	%l1
	fpadd32s	%f14,	%f7,	%f7
	fandnot1	%f24,	%f14,	%f30
	ta	%icc,	0x0
	tvs	%xcc,	0x5
	tvs	%xcc,	0x0
	fbue	%fcc3,	loop_2711
	fxnor	%f6,	%f12,	%f12
	set	0x68, %i6
	lduha	[%l7 + %i6] 0x88,	%o1
loop_2711:
	fmovsneg	%xcc,	%f9,	%f8
	movpos	%icc,	%g7,	%o5
	subccc	%g1,	%g2,	%i6
	alignaddr	%g4,	%i5,	%o2
	movrlz	%o3,	0x0FF,	%g6
	fpsub32	%f0,	%f22,	%f0
	orncc	%l5,	0x0C27,	%l6
	pdist	%f14,	%f6,	%f28
	popc	0x1582,	%o4
	fnors	%f19,	%f3,	%f27
	umul	%i0,	%o6,	%i3
	srlx	%o0,	%i4,	%i1
	fmovdgu	%xcc,	%f14,	%f19
	nop
	setx	loop_2712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovd	%f14,	%f26
	mulscc	%l4,	0x03BF,	%g3
	fbuge	%fcc0,	loop_2713
loop_2712:
	and	%l0,	0x0F83,	%l2
	membar	0x3F
	sdivx	%i2,	0x0D04,	%o7
loop_2713:
	sdivcc	%g5,	0x116F,	%i7
	xorcc	%l1,	0x1049,	%o1
	fmovrdgez	%g7,	%f8,	%f12
	edge32n	%o5,	%g1,	%g2
	tcs	%icc,	0x2
	tge	%xcc,	0x5
	movcs	%xcc,	%l3,	%i6
	fba	%fcc0,	loop_2714
	array8	%i5,	%o2,	%o3
	movrgez	%g4,	%g6,	%l6
	fors	%f28,	%f20,	%f23
loop_2714:
	alignaddrl	%o4,	%i0,	%l5
	movrlez	%i3,	0x291,	%o6
	edge8	%i4,	%o0,	%i1
	fones	%f0
	udivx	%l4,	0x1056,	%l0
	te	%icc,	0x5
	sra	%g3,	0x10,	%l2
	edge32n	%o7,	%i2,	%i7
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g5
	tleu	%icc,	0x0
	edge32ln	%o1,	%g7,	%o5
	std	%f10,	[%l7 + 0x20]
	prefetch	[%l7 + 0x6C],	 0x2
	edge32	%l1,	%g1,	%g2
	lduw	[%l7 + 0x38],	%i6
	smulcc	%i5,	%o2,	%l3
	fmul8ulx16	%f20,	%f2,	%f12
	tsubcctv	%g4,	%g6,	%l6
	edge8l	%o4,	%i0,	%l5
	tcc	%xcc,	0x6
	tg	%icc,	0x5
	ld	[%l7 + 0x28],	%f14
	ldsw	[%l7 + 0x44],	%o3
	array8	%o6,	%i4,	%i3
	edge32n	%i1,	%l4,	%l0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%o0
	and	%o7,	0x0C96,	%l2
	addc	%i2,	0x1C86,	%i7
	subc	%g5,	%g7,	%o1
	fabss	%f10,	%f12
	edge16l	%o5,	%l1,	%g2
	movge	%xcc,	%g1,	%i6
	movl	%xcc,	%i5,	%o2
	mulx	%l3,	%g4,	%g6
	umulcc	%o4,	%i0,	%l5
	fandnot1	%f20,	%f0,	%f0
	fmovde	%icc,	%f4,	%f24
	ble,pn	%icc,	loop_2715
	alignaddr	%o3,	%o6,	%i4
	ta	%icc,	0x1
	srlx	%l6,	%i3,	%i1
loop_2715:
	fmovdl	%icc,	%f18,	%f29
	edge32	%l4,	%g3,	%o0
	umul	%l0,	0x020E,	%o7
	fmovrdlz	%i2,	%f22,	%f0
	fmovdg	%icc,	%f29,	%f2
	sll	%i7,	%g5,	%l2
	fmovdg	%icc,	%f10,	%f18
	alignaddrl	%g7,	%o1,	%o5
	fmul8x16	%f21,	%f2,	%f10
	sub	%l1,	0x13E5,	%g1
	subc	%i6,	%i5,	%g2
	fsrc2s	%f25,	%f26
	fmovdcs	%icc,	%f23,	%f18
	movl	%icc,	%o2,	%g4
	umul	%l3,	0x1F16,	%o4
	bvc,a	%xcc,	loop_2716
	edge16	%g6,	%i0,	%o3
	sdiv	%o6,	0x016B,	%i4
	srax	%l6,	%i3,	%l5
loop_2716:
	ld	[%l7 + 0x54],	%f5
	movne	%xcc,	%l4,	%i1
	movrgez	%o0,	0x1A9,	%g3
	std	%f22,	[%l7 + 0x30]
	bn,a,pt	%icc,	loop_2717
	taddcctv	%l0,	0x0478,	%i2
	fexpand	%f26,	%f4
	ba,a,pn	%xcc,	loop_2718
loop_2717:
	bn,a,pn	%xcc,	loop_2719
	array8	%i7,	%o7,	%g5
	set	0x1B, %g7
	stba	%g7,	[%l7 + %g7] 0x2b
	membar	#Sync
loop_2718:
	stw	%o1,	[%l7 + 0x60]
loop_2719:
	tn	%xcc,	0x2
	fbn	%fcc3,	loop_2720
	orncc	%o5,	0x1323,	%l1
	fpmerge	%f29,	%f9,	%f16
	umulcc	%l2,	%i6,	%i5
loop_2720:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g2
	array16	%g1,	%g4,	%o2
	pdist	%f16,	%f8,	%f22
	brgz,a	%o4,	loop_2721
	movl	%icc,	%l3,	%g6
	fnor	%f6,	%f10,	%f22
	udivcc	%i0,	0x1C20,	%o3
loop_2721:
	fabsd	%f26,	%f14
	tn	%xcc,	0x4
	stw	%i4,	[%l7 + 0x70]
	membar	0x47
	fexpand	%f23,	%f30
	fbuge,a	%fcc2,	loop_2722
	movg	%icc,	%l6,	%i3
	fmovrse	%l5,	%f7,	%f28
	tgu	%xcc,	0x2
loop_2722:
	tleu	%xcc,	0x5
	movvs	%icc,	%l4,	%i1
	movrne	%o6,	0x28A,	%g3
	tge	%xcc,	0x7
	sllx	%o0,	%i2,	%i7
	ld	[%l7 + 0x68],	%f12
	addcc	%o7,	%g5,	%l0
	fmovsleu	%icc,	%f8,	%f30
	edge32ln	%g7,	%o1,	%l1
	movpos	%icc,	%o5,	%i6
	taddcc	%i5,	0x1C0A,	%l2
	fpackfix	%f2,	%f16
	edge32ln	%g1,	%g4,	%o2
	std	%o4,	[%l7 + 0x50]
	fmul8x16al	%f0,	%f0,	%f0
	movge	%xcc,	%l3,	%g2
	sdiv	%g6,	0x1D97,	%i0
	movre	%o3,	%i4,	%i3
	xnorcc	%l6,	0x1F49,	%l5
	stb	%i1,	[%l7 + 0x24]
	ble	%xcc,	loop_2723
	bgu	%xcc,	loop_2724
	andn	%l4,	0x0493,	%g3
	fbge	%fcc0,	loop_2725
loop_2723:
	tle	%icc,	0x7
loop_2724:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc3,	loop_2726
loop_2725:
	tle	%xcc,	0x1
	edge32ln	%o0,	%i2,	%o6
	fmul8x16al	%f11,	%f7,	%f2
loop_2726:
	udivcc	%o7,	0x0D29,	%g5
	set	0x0C, %o6
	stwa	%l0,	[%l7 + %o6] 0xea
	membar	#Sync
	umul	%g7,	%i7,	%o1
	udiv	%o5,	0x1910,	%l1
	srax	%i6,	0x16,	%i5
	sll	%l2,	%g4,	%o2
	fcmps	%fcc2,	%f6,	%f18
	edge8n	%g1,	%l3,	%g2
	set	0x20, %g4
	ldswa	[%l7 + %g4] 0x88,	%o4
	stbar
	orncc	%g6,	0x0710,	%i0
	fmovsa	%xcc,	%f6,	%f17
	tn	%xcc,	0x7
	fmuld8sux16	%f25,	%f12,	%f26
	array8	%i4,	%o3,	%l6
	fmovrdlz	%l5,	%f2,	%f10
	fmovse	%icc,	%f5,	%f0
	edge16	%i1,	%i3,	%l4
	movcs	%xcc,	%o0,	%i2
	fble	%fcc3,	loop_2727
	srlx	%g3,	%o6,	%g5
	sll	%l0,	0x0B,	%g7
	fbuge	%fcc3,	loop_2728
loop_2727:
	edge16ln	%o7,	%i7,	%o1
	fbl,a	%fcc2,	loop_2729
	fandnot2	%f26,	%f6,	%f10
loop_2728:
	fmovdneg	%icc,	%f2,	%f15
	xnor	%o5,	0x16FA,	%l1
loop_2729:
	movleu	%xcc,	%i5,	%l2
	fbue,a	%fcc1,	loop_2730
	membar	0x2E
	fbl,a	%fcc0,	loop_2731
	movcs	%icc,	%g4,	%i6
loop_2730:
	sllx	%o2,	%l3,	%g2
	tvs	%xcc,	0x7
loop_2731:
	udiv	%g1,	0x1951,	%g6
	fzeros	%f26
	mulscc	%i0,	0x0E95,	%i4
	fmovsl	%icc,	%f17,	%f23
	edge8l	%o3,	%o4,	%l6
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x04,	 0x0
	edge32	%i1,	%l4,	%i3
	xnorcc	%i2,	%o0,	%o6
	movge	%xcc,	%g3,	%l0
	sdivcc	%g5,	0x09A6,	%g7
	edge8n	%i7,	%o1,	%o7
	andncc	%l1,	%i5,	%o5
	bneg,pt	%icc,	loop_2732
	fbuge,a	%fcc3,	loop_2733
	ldx	[%l7 + 0x40],	%g4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%o2
loop_2732:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x34] %asi,	%l3
loop_2733:
	fbe,a	%fcc1,	loop_2734
	ldsw	[%l7 + 0x34],	%i6
	ldsw	[%l7 + 0x30],	%g1
	orncc	%g6,	%i0,	%g2
loop_2734:
	fsrc2s	%f16,	%f16
	srl	%o3,	0x16,	%i4
	bgu,a,pt	%icc,	loop_2735
	fbug,a	%fcc3,	loop_2736
	fmovrde	%l6,	%f4,	%f2
	fmul8ulx16	%f8,	%f4,	%f20
loop_2735:
	movvs	%icc,	%o4,	%l5
loop_2736:
	umul	%i1,	0x0C57,	%i3
	udiv	%i2,	0x0627,	%o0
	fmovrsgez	%l4,	%f11,	%f23
	tle	%icc,	0x4
	bne,a	loop_2737
	sra	%g3,	0x1A,	%o6
	addc	%g5,	0x077E,	%l0
	xnor	%g7,	%i7,	%o7
loop_2737:
	fmovrdlz	%o1,	%f12,	%f28
	membar	0x1C
	stw	%i5,	[%l7 + 0x78]
	taddcc	%o5,	0x176C,	%g4
	orcc	%l2,	%o2,	%l1
	fcmpeq16	%f24,	%f6,	%i6
	bpos	loop_2738
	sethi	0x0A90,	%g1
	bcs,pt	%xcc,	loop_2739
	sub	%g6,	%l3,	%i0
loop_2738:
	movg	%icc,	%g2,	%o3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%i4
loop_2739:
	for	%f22,	%f2,	%f12
	fmovdcs	%icc,	%f26,	%f30
	be,a,pt	%icc,	loop_2740
	orn	%o4,	0x053C,	%l6
	ta	%icc,	0x3
	edge32l	%l5,	%i1,	%i3
loop_2740:
	stb	%o0,	[%l7 + 0x3F]
	movcs	%xcc,	%i2,	%l4
	tvs	%xcc,	0x1
	fmovda	%xcc,	%f15,	%f21
	fbl	%fcc3,	loop_2741
	sethi	0x1A52,	%o6
	ldx	[%l7 + 0x48],	%g5
	bne,pt	%icc,	loop_2742
loop_2741:
	tg	%xcc,	0x1
	srl	%l0,	0x14,	%g7
	bl,pt	%icc,	loop_2743
loop_2742:
	fbo	%fcc3,	loop_2744
	add	%i7,	0x1E0A,	%g3
	lduw	[%l7 + 0x3C],	%o1
loop_2743:
	udiv	%o7,	0x10EE,	%o5
loop_2744:
	fnand	%f2,	%f12,	%f16
	fmuld8ulx16	%f19,	%f27,	%f0
	xor	%g4,	%l2,	%i5
	fble	%fcc0,	loop_2745
	edge32l	%o2,	%l1,	%i6
	tn	%icc,	0x3
	andncc	%g6,	%l3,	%g1
loop_2745:
	xor	%g2,	%o3,	%i0
	bvs,pt	%icc,	loop_2746
	fors	%f14,	%f24,	%f20
	fpadd32s	%f16,	%f11,	%f10
	fmuld8ulx16	%f8,	%f9,	%f12
loop_2746:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o4
	tsubcc	%i4,	%l5,	%i1
	array32	%i3,	%o0,	%i2
	andn	%l4,	%l6,	%g5
	addcc	%o6,	0x0CC3,	%l0
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	fsrc2s	%f6,	%f23
	set	0x6C, %g3
	lduwa	[%l7 + %g3] 0x18,	%i7
	move	%icc,	%g3,	%o1
	movrlez	%o5,	0x304,	%o7
	alignaddrl	%g4,	%i5,	%o2
	mova	%xcc,	%l1,	%l2
	swap	[%l7 + 0x38],	%g6
	sdivcc	%i6,	0x05C9,	%l3
	movvs	%xcc,	%g1,	%g2
	tgu	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	stha	%o3,	[%l7 + 0x7C] %asi
	edge8l	%o4,	%i0,	%l5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x30] %asi,	%i1
	movge	%icc,	%i4,	%o0
	udivx	%i3,	0x0D80,	%l4
	movrgz	%l6,	%i2,	%o6
	orn	%l0,	0x12D4,	%g5
	edge16ln	%g7,	%i7,	%g3
	std	%f4,	[%l7 + 0x30]
	tsubcc	%o5,	0x0645,	%o1
	fmovdcs	%xcc,	%f6,	%f17
	fnor	%f16,	%f26,	%f20
	stw	%o7,	[%l7 + 0x7C]
	bne,a	loop_2747
	tcs	%icc,	0x3
	edge8	%i5,	%o2,	%l1
	tle	%xcc,	0x3
loop_2747:
	ldub	[%l7 + 0x08],	%l2
	sir	0x18C8
	tvs	%icc,	0x2
	umulcc	%g4,	0x1518,	%i6
	xorcc	%g6,	%g1,	%l3
	movrne	%o3,	0x296,	%o4
	xnorcc	%g2,	0x194B,	%l5
	udivx	%i1,	0x0F30,	%i4
	be,a,pn	%icc,	loop_2748
	edge16	%i0,	%o0,	%i3
	edge8n	%l4,	%i2,	%l6
	siam	0x7
loop_2748:
	movg	%icc,	%l0,	%o6
	brgez,a	%g5,	loop_2749
	movvc	%icc,	%i7,	%g3
	taddcc	%o5,	0x0079,	%o1
	fcmpeq16	%f28,	%f30,	%o7
loop_2749:
	edge8l	%i5,	%g7,	%l1
	nop
	setx loop_2750, %l0, %l1
	jmpl %l1, %o2
	membar	0x26
	fmovde	%xcc,	%f14,	%f16
	tn	%xcc,	0x4
loop_2750:
	movneg	%xcc,	%g4,	%i6
	movleu	%xcc,	%l2,	%g6
	st	%f27,	[%l7 + 0x58]
	fmovrdgz	%g1,	%f26,	%f8
	ta	%icc,	0x0
	fmovrdlz	%l3,	%f10,	%f0
	smulcc	%o4,	0x1E94,	%g2
	addcc	%o3,	0x0F2C,	%i1
	fand	%f18,	%f12,	%f28
	addccc	%l5,	0x0FE3,	%i0
	fpackfix	%f6,	%f25
	subcc	%o0,	0x0508,	%i4
	fmovrslz	%i3,	%f6,	%f25
	tsubcctv	%i2,	%l6,	%l4
	std	%o6,	[%l7 + 0x08]
	movpos	%xcc,	%g5,	%i7
	te	%icc,	0x2
	fcmple32	%f24,	%f28,	%l0
	edge32ln	%g3,	%o5,	%o7
	addccc	%i5,	0x1B37,	%g7
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o1
	taddcctv	%o2,	%g4,	%l1
	tge	%xcc,	0x4
	smul	%l2,	0x0A21,	%i6
	fmovdleu	%icc,	%f2,	%f6
	orcc	%g1,	0x1226,	%l3
	set	0x30, %l4
	lduba	[%l7 + %l4] 0x14,	%o4
	movneg	%xcc,	%g2,	%o3
	array32	%g6,	%i1,	%i0
	fmovde	%xcc,	%f7,	%f22
	addccc	%o0,	0x16A1,	%l5
	fsrc1	%f26,	%f26
	lduh	[%l7 + 0x6C],	%i3
	bgu,a	loop_2751
	and	%i4,	%i2,	%l6
	sll	%o6,	%g5,	%l4
	movg	%xcc,	%i7,	%l0
loop_2751:
	movvs	%xcc,	%g3,	%o5
	nop
	setx	loop_2752,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x4F],	%i5
	fblg,a	%fcc2,	loop_2753
	tsubcctv	%g7,	0x0B57,	%o7
loop_2752:
	srlx	%o2,	%o1,	%g4
	fornot1s	%f31,	%f11,	%f8
loop_2753:
	nop
	set	0x50, %g1
	ldsh	[%l7 + %g1],	%l2
	fpadd16	%f2,	%f14,	%f8
	set	0x10, %g6
	lda	[%l7 + %g6] 0x89,	%f23
	orcc	%i6,	%l1,	%g1
	tpos	%icc,	0x1
	fmovdle	%xcc,	%f23,	%f23
	addc	%o4,	%g2,	%o3
	movre	%g6,	%l3,	%i0
	array32	%o0,	%l5,	%i1
	tcs	%xcc,	0x3
	fbu,a	%fcc1,	loop_2754
	fmul8x16al	%f23,	%f15,	%f2
	stbar
	fmul8x16al	%f0,	%f17,	%f30
loop_2754:
	lduw	[%l7 + 0x5C],	%i3
	udivx	%i2,	0x0C8B,	%i4
	tsubcc	%l6,	0x146F,	%o6
	fbuge	%fcc2,	loop_2755
	movne	%xcc,	%g5,	%i7
	fpmerge	%f16,	%f25,	%f6
	ba,pt	%icc,	loop_2756
loop_2755:
	fmovdg	%xcc,	%f31,	%f19
	udivcc	%l0,	0x005D,	%g3
	bg	%xcc,	loop_2757
loop_2756:
	ble,pt	%icc,	loop_2758
	brlez,a	%o5,	loop_2759
	and	%i5,	0x178C,	%l4
loop_2757:
	nop
	setx	loop_2760,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2758:
	edge16	%g7,	%o2,	%o7
loop_2759:
	nop
	set	0x50, %i4
	stba	%g4,	[%l7 + %i4] 0x0c
loop_2760:
	movge	%xcc,	%l2,	%i6
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xe2,	%l0
	taddcctv	%g1,	%o1,	%o4
	fmovd	%f4,	%f2
	movge	%xcc,	%g2,	%g6
	srlx	%o3,	0x1D,	%l3
	fble,a	%fcc2,	loop_2761
	fbg	%fcc3,	loop_2762
	ble,a,pt	%icc,	loop_2763
	sethi	0x1D5A,	%o0
loop_2761:
	andn	%i0,	0x1CC9,	%l5
loop_2762:
	fcmpeq32	%f30,	%f6,	%i3
loop_2763:
	udivcc	%i1,	0x0355,	%i2
	or	%i4,	0x1F66,	%o6
	fbue	%fcc0,	loop_2764
	fands	%f30,	%f1,	%f29
	taddcctv	%l6,	0x0CAC,	%i7
	fcmple32	%f20,	%f4,	%l0
loop_2764:
	tsubcc	%g5,	%g3,	%i5
	fmovrdgz	%o5,	%f22,	%f8
	srax	%l4,	%g7,	%o2
	alignaddrl	%g4,	%o7,	%i6
	orncc	%l1,	0x1639,	%l2
	edge16ln	%g1,	%o1,	%g2
	nop
	setx	loop_2765,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%icc,	0x6
	srax	%o4,	0x12,	%g6
	fmovrde	%l3,	%f26,	%f6
loop_2765:
	movl	%icc,	%o3,	%o0
	lduh	[%l7 + 0x10],	%l5
	movn	%xcc,	%i3,	%i0
	tleu	%xcc,	0x6
	tn	%xcc,	0x3
	srax	%i1,	0x08,	%i2
	set	0x20, %g5
	stwa	%i4,	[%l7 + %g5] 0x27
	membar	#Sync
	ldsb	[%l7 + 0x11],	%l6
	nop
	setx	loop_2766,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgz,a	%i7,	loop_2767
	prefetch	[%l7 + 0x0C],	 0x1
	ldsw	[%l7 + 0x10],	%o6
loop_2766:
	be	%xcc,	loop_2768
loop_2767:
	andncc	%g5,	%g3,	%l0
	orcc	%i5,	%o5,	%l4
	move	%xcc,	%g7,	%o2
loop_2768:
	subccc	%o7,	0x0BFD,	%g4
	edge16ln	%i6,	%l1,	%g1
	fmovsge	%icc,	%f2,	%f26
	mova	%xcc,	%l2,	%g2
	movg	%icc,	%o4,	%o1
	xnorcc	%g6,	0x1C78,	%l3
	fmuld8ulx16	%f5,	%f16,	%f16
	taddcctv	%o0,	%l5,	%i3
	ldx	[%l7 + 0x08],	%o3
	or	%i0,	0x09B9,	%i2
	fmovsvc	%icc,	%f24,	%f13
	xnorcc	%i1,	0x07EC,	%l6
	edge16	%i4,	%o6,	%g5
	bg,pn	%xcc,	loop_2769
	tne	%xcc,	0x2
	addcc	%g3,	%i7,	%i5
	edge8n	%o5,	%l0,	%g7
loop_2769:
	fabss	%f3,	%f7
	movvc	%icc,	%l4,	%o7
	fmovsleu	%icc,	%f4,	%f12
	fmul8sux16	%f20,	%f6,	%f22
	movpos	%xcc,	%g4,	%o2
	andn	%l1,	%i6,	%g1
	set	0x3A, %l0
	stba	%l2,	[%l7 + %l0] 0x2b
	membar	#Sync
	fbe	%fcc0,	loop_2770
	movn	%icc,	%o4,	%o1
	xorcc	%g6,	0x03BD,	%l3
	fbuge,a	%fcc1,	loop_2771
loop_2770:
	movcc	%xcc,	%o0,	%l5
	edge16n	%g2,	%o3,	%i0
	ba,pn	%icc,	loop_2772
loop_2771:
	bshuffle	%f30,	%f28,	%f12
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
loop_2772:
	fnor	%f16,	%f12,	%f20
	movrlez	%i2,	0x193,	%i1
	brlz	%i4,	loop_2773
	movgu	%icc,	%o6,	%g5
	nop
	setx loop_2774, %l0, %l1
	jmpl %l1, %l6
	edge32l	%g3,	%i7,	%o5
loop_2773:
	tpos	%icc,	0x6
	fmul8ulx16	%f26,	%f12,	%f0
loop_2774:
	prefetch	[%l7 + 0x44],	 0x1
	ldsw	[%l7 + 0x78],	%i5
	movrlz	%l0,	%g7,	%o7
	bl,pn	%icc,	loop_2775
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2776, %l0, %l1
	jmpl %l1, %g4
	fbn,a	%fcc2,	loop_2777
loop_2775:
	fmovdcs	%xcc,	%f5,	%f19
	movcc	%xcc,	%l4,	%l1
loop_2776:
	orncc	%i6,	%g1,	%l2
loop_2777:
	fmovda	%xcc,	%f31,	%f27
	edge32l	%o4,	%o2,	%g6
	fbge,a	%fcc3,	loop_2778
	xnor	%l3,	%o0,	%l5
	orn	%o1,	0x0921,	%g2
	tvs	%xcc,	0x7
loop_2778:
	tn	%icc,	0x3
	bneg,pn	%xcc,	loop_2779
	or	%o3,	0x1385,	%i0
	bg,pn	%xcc,	loop_2780
	tvc	%xcc,	0x6
loop_2779:
	tle	%icc,	0x4
	std	%i2,	[%l7 + 0x58]
loop_2780:
	fpack16	%f30,	%f25
	fbe,a	%fcc1,	loop_2781
	fmovsvc	%xcc,	%f2,	%f14
	smulcc	%i1,	0x1C71,	%i2
	fcmpd	%fcc0,	%f18,	%f0
loop_2781:
	std	%i4,	[%l7 + 0x08]
	fabsd	%f28,	%f16
	lduw	[%l7 + 0x14],	%o6
	fnot1	%f10,	%f20
	stw	%l6,	[%l7 + 0x08]
	wr	%g0,	0x80,	%asi
	stda	%g2,	[%l7 + 0x60] %asi
	addcc	%i7,	%g5,	%i5
	addcc	%l0,	0x0B01,	%o5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g7
	fmovdg	%xcc,	%f30,	%f0
	movle	%icc,	%o7,	%g4
	tvc	%icc,	0x6
	movrgez	%l1,	0x385,	%l4
	movl	%icc,	%g1,	%l2
	fcmpgt16	%f18,	%f30,	%i6
	movvs	%icc,	%o2,	%o4
	taddcctv	%l3,	0x09DF,	%o0
	fones	%f16
	fcmpgt16	%f18,	%f8,	%l5
	fmuld8sux16	%f18,	%f28,	%f22
	fmul8x16	%f4,	%f8,	%f30
	sdiv	%g6,	0x1031,	%o1
	bpos,a,pt	%xcc,	loop_2782
	tleu	%xcc,	0x6
	set	0x26, %i5
	stha	%o3,	[%l7 + %i5] 0x23
	membar	#Sync
loop_2782:
	st	%f21,	[%l7 + 0x50]
	ldstub	[%l7 + 0x26],	%g2
	fnor	%f28,	%f6,	%f2
	array16	%i0,	%i1,	%i2
	fmovs	%f10,	%f23
	subccc	%i3,	0x0231,	%o6
	sdiv	%i4,	0x0A61,	%l6
	wr	%g0,	0x04,	%asi
	stda	%i6,	[%l7 + 0x30] %asi
	xnorcc	%g3,	%g5,	%l0
	ldsh	[%l7 + 0x38],	%i5
	bge,a	loop_2783
	umul	%g7,	%o7,	%g4
	taddcctv	%o5,	%l4,	%l1
	fmovde	%icc,	%f29,	%f25
loop_2783:
	movl	%icc,	%g1,	%l2
	tle	%icc,	0x2
	sllx	%o2,	%i6,	%l3
	umul	%o0,	0x0CA0,	%o4
	smul	%l5,	0x1C3A,	%g6
	faligndata	%f24,	%f16,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f25,	%f12
	fcmple32	%f26,	%f18,	%o3
	subccc	%o1,	0x1385,	%i0
	fmul8x16au	%f14,	%f12,	%f10
	umul	%i1,	%i2,	%i3
	edge8	%g2,	%o6,	%i4
	tle	%icc,	0x5
	edge16l	%l6,	%i7,	%g3
	fmul8sux16	%f22,	%f16,	%f8
	ble,a,pn	%icc,	loop_2784
	tsubcctv	%g5,	0x0FF3,	%i5
	movcs	%xcc,	%g7,	%o7
	fmovse	%xcc,	%f11,	%f22
loop_2784:
	movleu	%xcc,	%g4,	%o5
	fmovdpos	%icc,	%f1,	%f4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%l4
	movleu	%icc,	%l0,	%g1
	sub	%l2,	%o2,	%l1
	edge8ln	%l3,	%i6,	%o4
	brgez,a	%o0,	loop_2785
	movge	%xcc,	%l5,	%g6
	fmovse	%xcc,	%f28,	%f0
	movg	%xcc,	%o1,	%o3
loop_2785:
	movcs	%icc,	%i1,	%i2
	fcmpne16	%f30,	%f8,	%i0
	ta	%icc,	0x1
	tge	%icc,	0x3
	fand	%f12,	%f24,	%f26
	tge	%xcc,	0x3
	fzeros	%f5
	tn	%xcc,	0x5
	taddcc	%g2,	%o6,	%i3
	bl	%icc,	loop_2786
	ta	%icc,	0x3
	orcc	%i4,	0x033B,	%l6
	fcmple16	%f14,	%f28,	%i7
loop_2786:
	tn	%icc,	0x0
	sll	%g5,	0x0C,	%g3
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%g7
	udivcc	%o7,	0x079B,	%g4
	srlx	%i5,	0x12,	%l4
	tvs	%icc,	0x2
	fnegd	%f16,	%f8
	fabsd	%f16,	%f20
	edge16	%l0,	%g1,	%l2
	tne	%xcc,	0x5
	fbn,a	%fcc0,	loop_2787
	movleu	%xcc,	%o2,	%l1
	ldsb	[%l7 + 0x44],	%l3
	sllx	%i6,	%o5,	%o0
loop_2787:
	std	%f24,	[%l7 + 0x70]
	tle	%icc,	0x7
	fnegs	%f4,	%f31
	fbge,a	%fcc3,	loop_2788
	fabsd	%f10,	%f8
	fnands	%f0,	%f6,	%f25
	srax	%o4,	0x1B,	%g6
loop_2788:
	tn	%icc,	0x0
	stbar
	tcs	%xcc,	0x6
	movrgez	%l5,	%o3,	%o1
	mulx	%i2,	0x1AD5,	%i0
	edge16ln	%g2,	%i1,	%i3
	add	%o6,	0x0C39,	%i4
	flush	%l7 + 0x4C
	std	%i6,	[%l7 + 0x70]
	tne	%icc,	0x4
	fmovda	%xcc,	%f11,	%f18
	tne	%icc,	0x3
	xor	%l6,	0x015B,	%g3
	nop
	setx	loop_2789,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%g7,	%o7,	%g4
	mulscc	%i5,	0x1051,	%g5
	fmovrsne	%l0,	%f22,	%f27
loop_2789:
	lduw	[%l7 + 0x0C],	%l4
	tne	%icc,	0x4
	ldd	[%l7 + 0x38],	%f0
	sethi	0x0839,	%l2
	ldstub	[%l7 + 0x36],	%o2
	fbug,a	%fcc1,	loop_2790
	fmovrdne	%g1,	%f2,	%f16
	fnegd	%f4,	%f22
	fpack32	%f6,	%f20,	%f12
loop_2790:
	fpack16	%f4,	%f29
	fmovsa	%xcc,	%f11,	%f18
	call	loop_2791
	prefetch	[%l7 + 0x68],	 0x1
	alignaddr	%l3,	%l1,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%i6
loop_2791:
	movleu	%xcc,	%g6,	%l5
	tge	%icc,	0x0
	bpos	loop_2792
	add	%o4,	%o1,	%o3
	tn	%xcc,	0x5
	fpack32	%f26,	%f6,	%f4
loop_2792:
	tneg	%icc,	0x4
	mulscc	%i2,	0x06E0,	%g2
	fmovdgu	%icc,	%f12,	%f5
	edge16	%i1,	%i0,	%i3
	prefetch	[%l7 + 0x6C],	 0x2
	movg	%icc,	%i4,	%o6
	ldsb	[%l7 + 0x70],	%i7
	fbo	%fcc3,	loop_2793
	tn	%icc,	0x2
	xnorcc	%l6,	%g7,	%o7
	udivx	%g4,	0x17FC,	%i5
loop_2793:
	tle	%icc,	0x3
	movg	%icc,	%g5,	%l0
	fmovdvc	%xcc,	%f26,	%f7
	fbug,a	%fcc0,	loop_2794
	movneg	%icc,	%g3,	%l2
	sra	%o2,	%g1,	%l3
	movne	%xcc,	%l4,	%l1
loop_2794:
	udivx	%o0,	0x1A51,	%o5
	sub	%g6,	0x096E,	%i6
	fble	%fcc1,	loop_2795
	tvs	%xcc,	0x2
	fmovsl	%xcc,	%f15,	%f27
	tcc	%icc,	0x6
loop_2795:
	tn	%icc,	0x3
	srlx	%l5,	0x11,	%o4
	alignaddr	%o3,	%o1,	%i2
	edge16	%g2,	%i0,	%i1
	and	%i3,	0x0CD4,	%o6
	set	0x6D, %o0
	lduba	[%l7 + %o0] 0x04,	%i4
	membar	0x10
	fmovdgu	%xcc,	%f14,	%f25
	srax	%l6,	0x18,	%g7
	movcs	%xcc,	%i7,	%o7
	tl	%icc,	0x6
	sllx	%g4,	0x14,	%i5
	stbar
	fmovrsne	%g5,	%f0,	%f10
	fmul8x16	%f20,	%f12,	%f8
	sethi	0x08FE,	%g3
	umul	%l2,	0x103E,	%l0
	tcc	%icc,	0x7
	tcs	%icc,	0x5
	ba	loop_2796
	sdivcc	%o2,	0x1BCB,	%g1
	popc	%l3,	%l1
	edge8ln	%l4,	%o5,	%g6
loop_2796:
	smul	%i6,	0x1F86,	%o0
	brz	%l5,	loop_2797
	udivcc	%o4,	0x042E,	%o1
	nop
	set	0x70, %o2
	prefetch	[%l7 + %o2],	 0x2
	fnors	%f1,	%f13,	%f6
loop_2797:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	set	0x50, %i7
	lduwa	[%l7 + %i7] 0x15,	%g2
	mova	%xcc,	%i0,	%o3
	smulcc	%i3,	0x0E8A,	%o6
	bneg,a,pt	%icc,	loop_2798
	fcmpgt16	%f10,	%f10,	%i4
	fornot1s	%f22,	%f23,	%f15
	movcc	%xcc,	%i1,	%g7
loop_2798:
	movre	%i7,	0x218,	%o7
	ld	[%l7 + 0x18],	%f6
	fcmpne16	%f16,	%f28,	%l6
	fmovrslz	%g4,	%f18,	%f23
	xnor	%i5,	%g3,	%g5
	fbule,a	%fcc1,	loop_2799
	be,a	loop_2800
	edge32ln	%l0,	%o2,	%l2
	movge	%xcc,	%l3,	%l1
loop_2799:
	movcc	%icc,	%l4,	%g1
loop_2800:
	xnor	%g6,	%o5,	%o0
	fmovdn	%icc,	%f9,	%f27
	movrlez	%i6,	0x287,	%l5
	umul	%o1,	%o4,	%g2
	bpos,a	loop_2801
	fmovsle	%icc,	%f23,	%f12
	tsubcctv	%i2,	0x0191,	%o3
	fmovdvc	%icc,	%f6,	%f24
loop_2801:
	fsrc1s	%f15,	%f21
	fors	%f6,	%f14,	%f29
	movgu	%icc,	%i0,	%i3
	tsubcc	%i4,	%o6,	%g7
	bg	loop_2802
	udiv	%i1,	0x0BCD,	%i7
	udiv	%l6,	0x1F16,	%g4
	addccc	%o7,	%g3,	%g5
loop_2802:
	bleu,a,pt	%icc,	loop_2803
	edge8ln	%i5,	%o2,	%l2
	subcc	%l0,	0x1198,	%l3
	movpos	%icc,	%l1,	%g1
loop_2803:
	popc	0x1922,	%l4
	set	0x64, %g2
	swapa	[%l7 + %g2] 0x80,	%o5
	bneg,a	%xcc,	loop_2804
	fnot1s	%f4,	%f29
	lduw	[%l7 + 0x6C],	%g6
	tne	%xcc,	0x6
loop_2804:
	orcc	%i6,	%l5,	%o0
	tvs	%xcc,	0x0
	fandnot2	%f6,	%f8,	%f28
	bcc,a	%xcc,	loop_2805
	flush	%l7 + 0x60
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x69] %asi,	%o1
loop_2805:
	fmovsleu	%icc,	%f6,	%f11
	addccc	%o4,	0x0AD2,	%g2
	srax	%i2,	0x1C,	%i0
	movvs	%icc,	%o3,	%i4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x30] %asi,	%f1
	fbl	%fcc3,	loop_2806
	fbo,a	%fcc1,	loop_2807
	tvs	%icc,	0x2
	orn	%i3,	0x0110,	%o6
loop_2806:
	mova	%xcc,	%i1,	%i7
loop_2807:
	fblg,a	%fcc3,	loop_2808
	fcmple16	%f20,	%f8,	%g7
	fnor	%f28,	%f22,	%f26
	call	loop_2809
loop_2808:
	fba	%fcc1,	loop_2810
	nop
	setx	loop_2811,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%g4,	%o7,	%l6
loop_2809:
	alignaddrl	%g3,	%i5,	%o2
loop_2810:
	membar	0x03
loop_2811:
	movrne	%l2,	0x3E8,	%g5
	edge16n	%l0,	%l1,	%g1
	mulx	%l3,	0x111E,	%o5
	movleu	%xcc,	%l4,	%i6
	sllx	%l5,	%g6,	%o0
	bgu	loop_2812
	nop
	set	0x68, %l1
	ldstub	[%l7 + %l1],	%o1
	fmovsge	%icc,	%f8,	%f17
	st	%f8,	[%l7 + 0x64]
loop_2812:
	fbue	%fcc3,	loop_2813
	edge16	%g2,	%o4,	%i2
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2813:
	ld	[%l7 + 0x7C],	%f4
	tge	%icc,	0x6
	sllx	%i0,	%i4,	%o3
	addccc	%i3,	0x1351,	%o6
	move	%icc,	%i7,	%g7
	sdivx	%g4,	0x184E,	%i1
	set	0x78, %o7
	lduwa	[%l7 + %o7] 0x14,	%o7
	set	0x27, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g3
	tsubcc	%l6,	0x0469,	%o2
	fcmpne16	%f6,	%f14,	%l2
	edge32ln	%i5,	%l0,	%l1
	brgez,a	%g1,	loop_2814
	fnot2s	%f24,	%f5
	srl	%g5,	%l3,	%l4
	fmovdn	%icc,	%f23,	%f23
loop_2814:
	movvs	%xcc,	%i6,	%o5
	fmovsne	%xcc,	%f26,	%f20
	srax	%g6,	0x14,	%l5
	te	%xcc,	0x6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o0,	%o1
	edge32l	%o4,	%g2,	%i2
	orncc	%i4,	%i0,	%o3
	alignaddrl	%i3,	%i7,	%g7
	movrlez	%o6,	0x3CB,	%i1
	fnors	%f16,	%f10,	%f1
	array16	%g4,	%o7,	%g3
	fbo,a	%fcc0,	loop_2815
	tleu	%xcc,	0x2
	mova	%icc,	%l6,	%l2
	stb	%o2,	[%l7 + 0x5E]
loop_2815:
	movg	%icc,	%l0,	%i5
	ldd	[%l7 + 0x70],	%f8
	move	%icc,	%l1,	%g1
	edge32n	%l3,	%g5,	%i6
	fmovrdlz	%o5,	%f6,	%f20
	fmovsneg	%icc,	%f26,	%f0
	edge32n	%l4,	%g6,	%o0
	mova	%icc,	%l5,	%o1
	movpos	%xcc,	%g2,	%i2
	move	%xcc,	%i4,	%o4
	fornot2	%f20,	%f10,	%f2
	movcc	%xcc,	%o3,	%i3
	bshuffle	%f20,	%f30,	%f26
	sth	%i0,	[%l7 + 0x7C]
	xnorcc	%i7,	%g7,	%i1
	xorcc	%o6,	%g4,	%g3
	fors	%f6,	%f16,	%f23
	fmovsne	%xcc,	%f22,	%f5
	tvs	%icc,	0x0
	fmovsge	%icc,	%f25,	%f5
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x18,	%o7
	bcs,a	%xcc,	loop_2816
	std	%i6,	[%l7 + 0x50]
	movne	%xcc,	%o2,	%l2
	tsubcc	%l0,	%i5,	%l1
loop_2816:
	fsrc2	%f2,	%f10
	nop
	setx	loop_2817,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%g1,	0x1D09,	%g5
	sdivx	%l3,	0x1D3C,	%o5
	sdiv	%i6,	0x0EC9,	%l4
loop_2817:
	array32	%g6,	%l5,	%o1
	edge8n	%o0,	%g2,	%i4
	tge	%icc,	0x1
	tvc	%icc,	0x1
	fblg,a	%fcc3,	loop_2818
	membar	0x38
	fors	%f4,	%f13,	%f31
	edge16n	%o4,	%i2,	%o3
loop_2818:
	sth	%i0,	[%l7 + 0x34]
	fmovrdne	%i3,	%f14,	%f8
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x46] %asi,	%i7
	andcc	%i1,	0x0441,	%g7
	umulcc	%g4,	0x0D5F,	%o6
	wr	%g0,	0xeb,	%asi
	stwa	%g3,	[%l7 + 0x50] %asi
	membar	#Sync
	array16	%o7,	%o2,	%l2
	set	0x42, %i1
	ldstuba	[%l7 + %i1] 0x88,	%l6
	edge32l	%i5,	%l0,	%l1
	edge8ln	%g5,	%g1,	%o5
	flush	%l7 + 0x20
	bl,pn	%xcc,	loop_2819
	fmovdleu	%xcc,	%f5,	%f2
	udivx	%i6,	0x1C94,	%l4
	tge	%xcc,	0x5
loop_2819:
	popc	0x0EC3,	%l3
	fnot1	%f20,	%f2
	fbule,a	%fcc3,	loop_2820
	sub	%l5,	%g6,	%o0
	movre	%o1,	0x230,	%g2
	tge	%xcc,	0x2
loop_2820:
	sdivx	%i4,	0x1C2C,	%o4
	fzero	%f8
	edge32ln	%o3,	%i2,	%i3
	movge	%xcc,	%i7,	%i0
	orn	%g7,	0x1319,	%i1
	fpmerge	%f19,	%f25,	%f10
	bge,a	loop_2821
	edge16l	%g4,	%o6,	%g3
	andcc	%o7,	0x07F2,	%o2
	tneg	%icc,	0x2
loop_2821:
	xorcc	%l2,	%l6,	%i5
	flush	%l7 + 0x54
	tcc	%xcc,	0x7
	edge16n	%l0,	%g5,	%l1
	xnorcc	%g1,	0x10BA,	%o5
	bne,a,pn	%xcc,	loop_2822
	fpack16	%f6,	%f4
	sll	%l4,	%l3,	%i6
	tn	%icc,	0x3
loop_2822:
	te	%xcc,	0x4
	movl	%xcc,	%l5,	%o0
	orncc	%g6,	%o1,	%i4
	bvc,a	%icc,	loop_2823
	fmovscs	%xcc,	%f18,	%f8
	set	0x29, %i0
	lduba	[%l7 + %i0] 0x88,	%g2
loop_2823:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
	brnz	%o4,	loop_2824
	stbar
	nop
	setx	loop_2825,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%i2,	%i7,	%i3
loop_2824:
	sdivx	%i0,	0x0847,	%g7
	tpos	%icc,	0x2
loop_2825:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%o6
	fbule	%fcc0,	loop_2826
	movgu	%icc,	%g3,	%g4
	fand	%f14,	%f28,	%f30
	edge16l	%o2,	%o7,	%l2
loop_2826:
	xor	%i5,	%l6,	%g5
	fmovdvc	%xcc,	%f1,	%f3
	fnot2s	%f26,	%f16
	and	%l1,	0x0135,	%l0
	edge8	%g1,	%l4,	%o5
	tle	%xcc,	0x1
	umulcc	%l3,	%l5,	%i6
	udivcc	%o0,	0x0C95,	%g6
	tge	%icc,	0x3
	ble,pn	%icc,	loop_2827
	movvs	%xcc,	%o1,	%i4
	fnegs	%f7,	%f28
	faligndata	%f22,	%f28,	%f18
loop_2827:
	movrne	%g2,	%o3,	%i2
	tl	%icc,	0x5
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x28] %asi
	xnor	%o4,	%i7,	%i3
	fmovdcc	%icc,	%f18,	%f3
	bne,a	%xcc,	loop_2828
	bneg,a,pt	%xcc,	loop_2829
	movrlz	%i0,	%g7,	%o6
	orcc	%i1,	%g3,	%o2
loop_2828:
	siam	0x1
loop_2829:
	movre	%g4,	%o7,	%i5
	edge8l	%l2,	%g5,	%l1
	andncc	%l0,	%g1,	%l6
	te	%icc,	0x6
	brlez,a	%l4,	loop_2830
	movcc	%xcc,	%l3,	%l5
	st	%f22,	[%l7 + 0x78]
	andn	%o5,	%i6,	%o0
loop_2830:
	bne,a	loop_2831
	orn	%o1,	%g6,	%i4
	tpos	%icc,	0x3
	tge	%icc,	0x1
loop_2831:
	sdiv	%g2,	0x0CB3,	%o3
	stbar
	fbge	%fcc1,	loop_2832
	tg	%icc,	0x7
	array16	%i2,	%o4,	%i3
	edge8	%i0,	%i7,	%g7
loop_2832:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%o6
	alignaddr	%i1,	%g3,	%g4
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x04,	%o6
	tl	%icc,	0x3
	fbn	%fcc0,	loop_2833
	array32	%o2,	%l2,	%g5
	andn	%l1,	0x1340,	%l0
	edge16n	%i5,	%g1,	%l4
loop_2833:
	edge32n	%l3,	%l6,	%o5
	fbug	%fcc2,	loop_2834
	fmovsneg	%xcc,	%f26,	%f31
	move	%xcc,	%i6,	%o0
	movgu	%xcc,	%l5,	%o1
loop_2834:
	bshuffle	%f30,	%f18,	%f12
	membar	0x68
	be,a	%icc,	loop_2835
	edge32l	%g6,	%i4,	%o3
	fbg,a	%fcc2,	loop_2836
	tleu	%icc,	0x1
loop_2835:
	tcs	%xcc,	0x0
	fmovsleu	%xcc,	%f26,	%f13
loop_2836:
	edge16n	%i2,	%g2,	%o4
	tneg	%icc,	0x5
	orcc	%i0,	0x1332,	%i7
	fsrc2	%f12,	%f16
	srl	%g7,	%o6,	%i3
	tl	%icc,	0x0
	fzeros	%f28
	subccc	%g3,	0x16C8,	%i1
	fpadd16	%f26,	%f14,	%f22
	fpackfix	%f22,	%f0
	and	%g4,	0x19DD,	%o7
	fmovd	%f10,	%f12
	edge16l	%l2,	%o2,	%g5
	movg	%icc,	%l0,	%i5
	nop
	setx loop_2837, %l0, %l1
	jmpl %l1, %g1
	srl	%l1,	0x01,	%l3
	bvs	%xcc,	loop_2838
	fone	%f24
loop_2837:
	brgz,a	%l6,	loop_2839
	tcs	%xcc,	0x0
loop_2838:
	movrlz	%o5,	0x1D4,	%i6
	sir	0x1586
loop_2839:
	tsubcctv	%o0,	0x0C09,	%l5
	udivcc	%l4,	0x0E5B,	%g6
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf8
	membar	#Sync
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%o1
	movle	%xcc,	%i2,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x0
	movl	%xcc,	%o4,	%i0
	taddcctv	%o3,	%g7,	%o6
	movre	%i3,	0x07C,	%i7
	tge	%icc,	0x0
	tleu	%xcc,	0x5
	fbn	%fcc1,	loop_2840
	fbl	%fcc1,	loop_2841
	fandnot1s	%f14,	%f1,	%f29
	xnor	%g3,	0x0051,	%i1
loop_2840:
	fbo,a	%fcc1,	loop_2842
loop_2841:
	edge32	%g4,	%o7,	%l2
	stx	%o2,	[%l7 + 0x70]
	brlez	%l0,	loop_2843
loop_2842:
	bneg	%xcc,	loop_2844
	fbu,a	%fcc1,	loop_2845
	tsubcc	%i5,	0x080B,	%g1
loop_2843:
	move	%xcc,	%l1,	%g5
loop_2844:
	nop
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2845:
	udivx	%l3,	0x1135,	%o5
	fpsub32s	%f28,	%f11,	%f27
	brgez	%i6,	loop_2846
	st	%f31,	[%l7 + 0x30]
	fcmpgt32	%f22,	%f28,	%o0
	swap	[%l7 + 0x5C],	%l6
loop_2846:
	bpos,a,pn	%xcc,	loop_2847
	mova	%xcc,	%l4,	%g6
	movrgez	%l5,	%o1,	%i4
	fmovdg	%icc,	%f18,	%f5
loop_2847:
	fmovrde	%g2,	%f22,	%f10
	movvc	%icc,	%o4,	%i0
	movl	%icc,	%i2,	%g7
	fble,a	%fcc0,	loop_2848
	bn,a	%icc,	loop_2849
	sllx	%o6,	0x04,	%i3
	fmovs	%f18,	%f13
loop_2848:
	fornot1	%f2,	%f14,	%f12
loop_2849:
	std	%f0,	[%l7 + 0x78]
	edge32l	%i7,	%g3,	%o3
	fandnot2s	%f6,	%f15,	%f10
	fnand	%f6,	%f22,	%f16
	movl	%xcc,	%i1,	%g4
	fmovrde	%o7,	%f20,	%f8
	orncc	%l2,	0x1913,	%l0
	bcs	loop_2850
	bcc,pt	%icc,	loop_2851
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc0,	loop_2852
loop_2850:
	srlx	%o2,	%g1,	%i5
loop_2851:
	std	%f20,	[%l7 + 0x10]
	add	%g5,	%l1,	%l3
loop_2852:
	brnz,a	%o5,	loop_2853
	movrgez	%o0,	%l6,	%l4
	move	%xcc,	%g6,	%i6
	movl	%icc,	%l5,	%i4
loop_2853:
	tl	%icc,	0x1
	fmovd	%f26,	%f24
	movg	%xcc,	%o1,	%o4
	fone	%f4
	movrlez	%i0,	0x1D8,	%g2
	fpack16	%f4,	%f19
	udivx	%g7,	0x1E2D,	%i2
	fsrc1	%f10,	%f14
	movpos	%xcc,	%o6,	%i7
	tvs	%xcc,	0x7
	srlx	%g3,	%o3,	%i1
	alignaddrl	%g4,	%i3,	%o7
	brgez	%l2,	loop_2854
	fble,a	%fcc3,	loop_2855
	movne	%xcc,	%o2,	%g1
	smul	%i5,	%g5,	%l1
loop_2854:
	fbne,a	%fcc3,	loop_2856
loop_2855:
	fble,a	%fcc0,	loop_2857
	fmovsne	%xcc,	%f24,	%f9
	array32	%l3,	%l0,	%o5
loop_2856:
	fmovrdgz	%l6,	%f26,	%f22
loop_2857:
	srl	%o0,	0x05,	%l4
	edge16ln	%g6,	%l5,	%i4
	fmovspos	%icc,	%f15,	%f21
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrne	%i6,	0x2F6,	%o4
	edge32ln	%i0,	%o1,	%g2
	array32	%i2,	%o6,	%i7
	fpsub16s	%f6,	%f25,	%f0
	mulx	%g3,	0x0A09,	%o3
	fmovdgu	%xcc,	%f1,	%f16
	fors	%f18,	%f17,	%f23
	fbne,a	%fcc2,	loop_2858
	tgu	%icc,	0x3
	smul	%i1,	0x1EB9,	%g7
	movvs	%xcc,	%i3,	%o7
loop_2858:
	xor	%g4,	0x07B0,	%l2
	umulcc	%o2,	0x04A0,	%i5
	xnor	%g5,	0x127B,	%g1
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x81,	%l2
	set	0x74, %o1
	stha	%l1,	[%l7 + %o1] 0x80
	addccc	%o5,	0x0883,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x1C] %asi,	%f5
	call	loop_2859
	udivx	%l0,	0x0721,	%l4
	subc	%o0,	0x0BB1,	%l5
	xnorcc	%g6,	0x0CEB,	%i4
loop_2859:
	fpack32	%f26,	%f0,	%f0
	fbo	%fcc3,	loop_2860
	bneg,a	%xcc,	loop_2861
	movvs	%xcc,	%i6,	%i0
	fmovsg	%xcc,	%f17,	%f25
loop_2860:
	movrne	%o4,	0x0B4,	%g2
loop_2861:
	tsubcc	%i2,	0x1736,	%o1
	fmovrdne	%i7,	%f28,	%f28
	fmuld8ulx16	%f4,	%f21,	%f20
	siam	0x5
	membar	0x27
	bcs,a,pt	%xcc,	loop_2862
	sdivx	%g3,	0x125F,	%o3
	sll	%o6,	0x12,	%i1
	array16	%i3,	%g7,	%g4
loop_2862:
	nop
	set	0x48, %l2
	stda	%l2,	[%l7 + %l2] 0x14
	fpack32	%f6,	%f18,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o2,	%i5,	%g5
	fmovdleu	%icc,	%f15,	%f3
	fcmpne16	%f22,	%f16,	%g1
	tcc	%xcc,	0x4
	nop
	setx	loop_2863,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%l3,	%l1
	movleu	%icc,	%o7,	%l6
	addccc	%l0,	%o5,	%o0
loop_2863:
	tvs	%icc,	0x1
	tg	%xcc,	0x3
	tvc	%icc,	0x0
	fand	%f18,	%f30,	%f26
	movle	%icc,	%l4,	%l5
	andcc	%i4,	0x1FD6,	%i6
	fmovrsgz	%g6,	%f2,	%f4
	movn	%xcc,	%o4,	%g2
	mova	%xcc,	%i0,	%i2
	sdivx	%i7,	0x0949,	%o1
	sir	0x0B04
	lduh	[%l7 + 0x5A],	%g3
	bg,pt	%xcc,	loop_2864
	sethi	0x04BE,	%o6
	ta	%xcc,	0x0
	movgu	%xcc,	%o3,	%i3
loop_2864:
	fcmpgt16	%f4,	%f16,	%i1
	fcmpeq16	%f30,	%f0,	%g7
	fmovdle	%icc,	%f27,	%f7
	fexpand	%f4,	%f14
	fmovse	%xcc,	%f18,	%f14
	wr	%g0,	0x10,	%asi
	stba	%g4,	[%l7 + 0x2F] %asi
	movgu	%icc,	%o2,	%l2
	or	%i5,	0x01E0,	%g5
	taddcc	%g1,	%l3,	%l1
	brnz,a	%o7,	loop_2865
	fpadd32s	%f29,	%f22,	%f8
	edge8	%l6,	%o5,	%l0
	fmovdcs	%icc,	%f17,	%f20
loop_2865:
	tl	%icc,	0x7
	fcmpes	%fcc0,	%f11,	%f0
	umul	%o0,	0x1C17,	%l5
	tcs	%xcc,	0x3
	srlx	%l4,	0x10,	%i6
	fmovrde	%i4,	%f14,	%f16
	and	%g6,	0x0BE9,	%o4
	edge32n	%g2,	%i2,	%i0
	alignaddr	%i7,	%g3,	%o6
	tne	%xcc,	0x6
	alignaddrl	%o1,	%i3,	%i1
	umulcc	%g7,	0x0F42,	%g4
	fpsub16	%f18,	%f14,	%f12
	movcs	%icc,	%o3,	%o2
	edge16	%i5,	%l2,	%g1
	brgz	%l3,	loop_2866
	fmovsgu	%icc,	%f23,	%f2
	alignaddr	%l1,	%o7,	%l6
	mulscc	%g5,	0x0098,	%l0
loop_2866:
	movvs	%icc,	%o0,	%o5
	bleu,a,pn	%icc,	loop_2867
	fcmple32	%f4,	%f4,	%l4
	movrne	%i6,	%i4,	%g6
	edge32	%l5,	%g2,	%i2
loop_2867:
	tcc	%xcc,	0x6
	fmovdl	%icc,	%f19,	%f30
	tl	%icc,	0x7
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x08] %asi,	%i0
	subc	%o4,	%i7,	%g3
	fmovsle	%xcc,	%f13,	%f3
	ldstub	[%l7 + 0x51],	%o1
	prefetch	[%l7 + 0x7C],	 0x3
	fmovse	%icc,	%f22,	%f13
	fmovrdlz	%i3,	%f10,	%f0
	ldsh	[%l7 + 0x5E],	%o6
	fmovdneg	%icc,	%f21,	%f23
	xorcc	%g7,	%g4,	%i1
	move	%xcc,	%o3,	%o2
	fxors	%f19,	%f23,	%f3
	tcs	%xcc,	0x2
	edge16	%l2,	%i5,	%g1
	fcmple16	%f0,	%f16,	%l1
	flush	%l7 + 0x1C
	fba	%fcc1,	loop_2868
	movrne	%l3,	0x1C7,	%l6
	fpadd32	%f12,	%f22,	%f30
	mulx	%o7,	%l0,	%g5
loop_2868:
	smulcc	%o0,	0x06AD,	%l4
	fblg	%fcc1,	loop_2869
	sdivx	%i6,	0x0A5E,	%o5
	lduh	[%l7 + 0x52],	%g6
	sth	%i4,	[%l7 + 0x5C]
loop_2869:
	sra	%g2,	%l5,	%i0
	smulcc	%i2,	%o4,	%g3
	edge8l	%o1,	%i7,	%o6
	add	%g7,	%g4,	%i3
	be,a	loop_2870
	alignaddrl	%o3,	%o2,	%i1
	ta	%icc,	0x1
	tle	%xcc,	0x6
loop_2870:
	membar	0x4E
	and	%l2,	%g1,	%i5
	tl	%icc,	0x2
	fble,a	%fcc2,	loop_2871
	ta	%icc,	0x4
	wr	%g0,	0x81,	%asi
	sta	%f12,	[%l7 + 0x3C] %asi
loop_2871:
	fbo	%fcc1,	loop_2872
	movge	%xcc,	%l1,	%l3
	umul	%l6,	%o7,	%l0
	udiv	%g5,	0x1062,	%o0
loop_2872:
	movrlz	%l4,	0x2EA,	%o5
	fbul	%fcc3,	loop_2873
	tcs	%icc,	0x3
	tcc	%xcc,	0x1
	smul	%i6,	%g6,	%i4
loop_2873:
	fnot2s	%f21,	%f4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	set	0x76, %o5
	stha	%g2,	[%l7 + %o5] 0x27
	membar	#Sync
	brlez,a	%i2,	loop_2874
	orcc	%o4,	%g3,	%o1
	tsubcc	%i0,	%i7,	%o6
	ldsb	[%l7 + 0x19],	%g4
loop_2874:
	bshuffle	%f10,	%f18,	%f8
	and	%i3,	0x1562,	%g7
	fcmpes	%fcc0,	%f23,	%f8
	sdivx	%o2,	0x122A,	%o3
	alignaddrl	%i1,	%g1,	%i5
	ble,a,pt	%icc,	loop_2875
	ble,pn	%icc,	loop_2876
	add	%l2,	%l3,	%l6
	fone	%f24
loop_2875:
	movrlz	%o7,	0x06C,	%l1
loop_2876:
	movrlz	%g5,	%l0,	%l4
	fba,a	%fcc1,	loop_2877
	xnor	%o5,	0x172D,	%o0
	fnot2	%f14,	%f12
	andcc	%i6,	%i4,	%g6
loop_2877:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g2
	fpack32	%f6,	%f20,	%f28
	movrlz	%o4,	%g3,	%o1
	sllx	%i2,	%i0,	%i7
	fbe,a	%fcc3,	loop_2878
	ldsw	[%l7 + 0x60],	%g4
	udiv	%o6,	0x1FCA,	%i3
	xnor	%g7,	%o2,	%o3
loop_2878:
	nop
	set	0x10, %g7
	stda	%g0,	[%l7 + %g7] 0x15
	ldd	[%l7 + 0x70],	%f26
	bn,a	loop_2879
	edge8	%i1,	%i5,	%l3
	sdiv	%l2,	0x1912,	%l6
	edge32ln	%l1,	%o7,	%g5
loop_2879:
	bleu	loop_2880
	movleu	%xcc,	%l0,	%l4
	smulcc	%o0,	0x0D74,	%o5
	sll	%i4,	%i6,	%g6
loop_2880:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc2,	loop_2881
	movleu	%icc,	%g2,	%o4
	subcc	%g3,	%l5,	%o1
	taddcc	%i0,	%i7,	%i2
loop_2881:
	membar	0x08
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g4,	0x09A6,	%o6
	fandnot2	%f30,	%f4,	%f22
	wr	%g0,	0x23,	%asi
	stda	%g6,	[%l7 + 0x08] %asi
	membar	#Sync
	bcc	loop_2882
	ldsh	[%l7 + 0x14],	%o2
	edge8	%i3,	%o3,	%g1
	std	%i0,	[%l7 + 0x20]
loop_2882:
	ta	%xcc,	0x0
	edge16	%l3,	%i5,	%l6
	or	%l1,	%l2,	%g5
	call	loop_2883
	fsrc2s	%f5,	%f8
	prefetch	[%l7 + 0x08],	 0x3
	ld	[%l7 + 0x24],	%f2
loop_2883:
	edge8ln	%o7,	%l4,	%o0
	array32	%l0,	%i4,	%o5
	movrgz	%g6,	0x12C,	%i6
	fbge,a	%fcc1,	loop_2884
	fbl,a	%fcc0,	loop_2885
	brz,a	%o4,	loop_2886
	te	%icc,	0x2
loop_2884:
	fsrc1s	%f6,	%f29
loop_2885:
	fnot1	%f2,	%f0
loop_2886:
	fmul8x16	%f21,	%f12,	%f8
	nop
	setx	loop_2887,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2887:
	fbul,a	%fcc2,	loop_2888
	fmovrde	%g3,	%f2,	%f10
	fmovdneg	%xcc,	%f23,	%f18
	te	%xcc,	0x0
loop_2888:
	tcs	%xcc,	0x5
	movvs	%icc,	%l5,	%g2
	set	0x40, %i6
	stda	%i0,	[%l7 + %i6] 0x04
	tl	%icc,	0x0
	ldx	[%l7 + 0x30],	%i7
	xnorcc	%o1,	0x0671,	%g4
	tl	%icc,	0x6
	ldub	[%l7 + 0x70],	%o6
	edge32l	%i2,	%o2,	%g7
	ta	%xcc,	0x5
	xorcc	%i3,	%o3,	%g1
	edge8ln	%i1,	%l3,	%i5
	movrgez	%l1,	0x375,	%l6
	membar	0x26
	fcmpgt16	%f14,	%f14,	%g5
	membar	0x0D
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%o7
	edge16n	%o0,	%l0,	%l4
	array8	%i4,	%o5,	%i6
	tpos	%xcc,	0x5
	brgez	%g6,	loop_2889
	tvc	%icc,	0x6
	taddcctv	%g3,	%o4,	%g2
	ld	[%l7 + 0x48],	%f26
loop_2889:
	srl	%l5,	%i0,	%o1
	brlz	%i7,	loop_2890
	popc	%o6,	%i2
	movrlz	%o2,	0x029,	%g7
	nop
	set	0x48, %o6
	ldsw	[%l7 + %o6],	%i3
loop_2890:
	tcc	%icc,	0x2
	sllx	%o3,	0x0D,	%g1
	edge8ln	%i1,	%l3,	%i5
	bpos,a,pt	%xcc,	loop_2891
	ba,a,pt	%icc,	loop_2892
	fble	%fcc3,	loop_2893
	mulscc	%l1,	%l6,	%g5
loop_2891:
	sdivcc	%g4,	0x0D88,	%o7
loop_2892:
	umulcc	%l2,	0x11F8,	%o0
loop_2893:
	brz,a	%l0,	loop_2894
	edge32n	%i4,	%o5,	%i6
	tgu	%xcc,	0x1
	add	%l4,	%g6,	%g3
loop_2894:
	nop
	setx	loop_2895,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%o4,	%g2,	%l5
	flush	%l7 + 0x5C
	ldub	[%l7 + 0x26],	%o1
loop_2895:
	fbe,a	%fcc1,	loop_2896
	edge16n	%i7,	%i0,	%i2
	tcs	%icc,	0x7
	fandnot2s	%f17,	%f8,	%f0
loop_2896:
	fors	%f21,	%f9,	%f15
	movre	%o2,	%g7,	%o6
	fxnor	%f8,	%f8,	%f20
	add	%i3,	%o3,	%g1
	tsubcctv	%l3,	%i5,	%l1
	move	%icc,	%l6,	%i1
	wr	%g0,	0x80,	%asi
	stxa	%g5,	[%l7 + 0x28] %asi
	fmovse	%icc,	%f14,	%f22
	move	%icc,	%o7,	%g4
	fbn,a	%fcc0,	loop_2897
	brlez	%l2,	loop_2898
	call	loop_2899
	ldx	[%l7 + 0x68],	%l0
loop_2897:
	tl	%icc,	0x0
loop_2898:
	fnor	%f26,	%f12,	%f26
loop_2899:
	smul	%i4,	0x0BE4,	%o5
	edge8	%i6,	%o0,	%g6
	xnorcc	%l4,	%g3,	%o4
	lduh	[%l7 + 0x24],	%l5
	fmovrdgez	%o1,	%f16,	%f10
	xorcc	%g2,	0x138B,	%i7
	fpadd32s	%f1,	%f5,	%f10
	tcs	%icc,	0x1
	sub	%i0,	0x01B4,	%o2
	be	%xcc,	loop_2900
	srlx	%g7,	%o6,	%i2
	smul	%o3,	%i3,	%g1
	tl	%icc,	0x6
loop_2900:
	movg	%icc,	%l3,	%l1
	tne	%icc,	0x7
	subccc	%i5,	%i1,	%g5
	ld	[%l7 + 0x20],	%f24
	movgu	%icc,	%o7,	%g4
	tcs	%xcc,	0x0
	andncc	%l2,	%l0,	%i4
	fbg,a	%fcc3,	loop_2901
	std	%o4,	[%l7 + 0x50]
	stb	%i6,	[%l7 + 0x1E]
	sub	%o0,	0x1D7C,	%l6
loop_2901:
	nop
	set	0x4D, %g4
	lduba	[%l7 + %g4] 0x0c,	%g6
	edge32ln	%g3,	%l4,	%o4
	ldstub	[%l7 + 0x3C],	%l5
	sdivx	%g2,	0x13B3,	%o1
	fmovrslz	%i0,	%f9,	%f31
	tsubcc	%o2,	%g7,	%o6
	fbuge,a	%fcc2,	loop_2902
	tle	%xcc,	0x2
	movrlz	%i7,	%i2,	%o3
	fbl	%fcc0,	loop_2903
loop_2902:
	umul	%i3,	%l3,	%l1
	tn	%icc,	0x3
	fcmpne16	%f20,	%f28,	%i5
loop_2903:
	tgu	%xcc,	0x6
	fbuge,a	%fcc0,	loop_2904
	bcs,a,pt	%xcc,	loop_2905
	edge8	%g1,	%i1,	%g5
	andn	%o7,	%g4,	%l2
loop_2904:
	swap	[%l7 + 0x10],	%l0
loop_2905:
	fmovdne	%xcc,	%f2,	%f20
	fba	%fcc1,	loop_2906
	ta	%xcc,	0x1
	set	0x6C, %l3
	lda	[%l7 + %l3] 0x04,	%f25
loop_2906:
	fbuge	%fcc1,	loop_2907
	orncc	%i4,	%o5,	%o0
	movge	%icc,	%l6,	%i6
	mulx	%g3,	0x08D8,	%l4
loop_2907:
	andcc	%g6,	0x0F46,	%l5
	wr	%g0,	0x19,	%asi
	stba	%o4,	[%l7 + 0x45] %asi
	array32	%g2,	%i0,	%o2
	fmovsg	%icc,	%f16,	%f12
	brz,a	%g7,	loop_2908
	movvs	%icc,	%o6,	%i7
	st	%f27,	[%l7 + 0x18]
	edge32	%i2,	%o3,	%o1
loop_2908:
	brgez,a	%l3,	loop_2909
	taddcc	%l1,	%i3,	%g1
	std	%i4,	[%l7 + 0x50]
	array16	%i1,	%g5,	%g4
loop_2909:
	te	%xcc,	0x3
	subccc	%o7,	%l0,	%l2
	addccc	%i4,	%o0,	%o5
	tge	%xcc,	0x0
	fmovrsne	%l6,	%f24,	%f4
	movn	%xcc,	%g3,	%l4
	array8	%i6,	%g6,	%o4
	std	%l4,	[%l7 + 0x08]
	fmovrse	%g2,	%f17,	%f24
	std	%i0,	[%l7 + 0x10]
	nop
	setx loop_2910, %l0, %l1
	jmpl %l1, %o2
	movcs	%icc,	%o6,	%i7
	fmovsgu	%xcc,	%f1,	%f4
	orn	%g7,	%o3,	%o1
loop_2910:
	fpsub16	%f2,	%f30,	%f20
	bvc,pt	%icc,	loop_2911
	fbug,a	%fcc3,	loop_2912
	brlez,a	%l3,	loop_2913
	andcc	%i2,	0x0711,	%l1
loop_2911:
	fxnor	%f0,	%f24,	%f18
loop_2912:
	mulx	%g1,	%i3,	%i1
loop_2913:
	be,a	loop_2914
	movleu	%icc,	%i5,	%g5
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%o7
	tvc	%icc,	0x7
loop_2914:
	addc	%g4,	%l0,	%l2
	fmul8sux16	%f14,	%f26,	%f18
	xnorcc	%i4,	0x025A,	%o5
	addccc	%o0,	%l6,	%g3
	addccc	%i6,	0x0636,	%g6
	std	%f0,	[%l7 + 0x18]
	fbl	%fcc1,	loop_2915
	andncc	%l4,	%o4,	%l5
	taddcc	%i0,	%o2,	%g2
	fpack32	%f16,	%f22,	%f0
loop_2915:
	bvc,a,pn	%xcc,	loop_2916
	subcc	%o6,	%i7,	%g7
	andcc	%o1,	%l3,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2916:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x26] %asi,	%l1
	taddcc	%g1,	%i3,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i2,	%g5,	%o7
	movrlz	%i5,	%g4,	%l0
	edge16n	%l2,	%o5,	%o0
	ld	[%l7 + 0x5C],	%f11
	tsubcctv	%i4,	%l6,	%i6
	stbar
	nop
	setx	loop_2917,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%g3,	%g6,	%l4
	fcmpes	%fcc1,	%f0,	%f5
	movrlez	%l5,	%o4,	%i0
loop_2917:
	taddcc	%o2,	0x0893,	%o6
	subc	%i7,	%g2,	%g7
	edge16n	%o1,	%l3,	%o3
	edge16	%l1,	%g1,	%i3
	swap	[%l7 + 0x28],	%i1
	brgez	%g5,	loop_2918
	bvs,pt	%xcc,	loop_2919
	te	%xcc,	0x4
	tsubcc	%i2,	%i5,	%o7
loop_2918:
	xnor	%l0,	%l2,	%g4
loop_2919:
	sllx	%o0,	0x0C,	%o5
	srl	%i4,	0x08,	%l6
	sir	0x064D
	edge16n	%i6,	%g3,	%l4
	movg	%icc,	%g6,	%o4
	smul	%i0,	%l5,	%o2
	stbar
	edge8	%o6,	%g2,	%g7
	subccc	%i7,	0x1618,	%l3
	fnegs	%f22,	%f2
	addcc	%o1,	0x01DB,	%l1
	edge8l	%g1,	%o3,	%i1
	fmovd	%f8,	%f30
	edge8ln	%g5,	%i3,	%i5
	movneg	%xcc,	%o7,	%i2
	set	0x09, %g1
	stba	%l0,	[%l7 + %g1] 0xea
	membar	#Sync
	fbge	%fcc1,	loop_2920
	st	%f12,	[%l7 + 0x08]
	sdiv	%g4,	0x1611,	%l2
	tg	%xcc,	0x0
loop_2920:
	sethi	0x0B81,	%o0
	udivx	%o5,	0x082B,	%i4
	fmovsa	%icc,	%f14,	%f15
	flush	%l7 + 0x2C
	bcc,a	%xcc,	loop_2921
	fmul8sux16	%f18,	%f12,	%f24
	edge8	%l6,	%g3,	%i6
	fblg,a	%fcc1,	loop_2922
loop_2921:
	bneg,a,pn	%xcc,	loop_2923
	bvc	loop_2924
	fmovsl	%icc,	%f5,	%f10
loop_2922:
	fzero	%f28
loop_2923:
	tl	%xcc,	0x7
loop_2924:
	movvs	%icc,	%g6,	%o4
	movcc	%icc,	%i0,	%l4
	sdivx	%o2,	0x1725,	%o6
	fmovd	%f4,	%f24
	alignaddrl	%l5,	%g7,	%i7
	movn	%icc,	%l3,	%o1
	bcs,a	loop_2925
	fmovscs	%icc,	%f3,	%f21
	movne	%icc,	%l1,	%g2
	xor	%o3,	0x13FF,	%g1
loop_2925:
	sdiv	%g5,	0x0BC5,	%i3
	edge8	%i5,	%i1,	%o7
	tg	%icc,	0x0
	tsubcc	%i2,	%l0,	%l2
	or	%g4,	0x0518,	%o5
	fpadd16	%f10,	%f2,	%f14
	fmovdgu	%xcc,	%f10,	%f14
	fbule,a	%fcc1,	loop_2926
	sub	%i4,	%l6,	%g3
	fcmpgt32	%f6,	%f12,	%o0
	fmovdne	%icc,	%f12,	%f8
loop_2926:
	xnorcc	%g6,	%o4,	%i6
	edge32n	%i0,	%l4,	%o2
	fxnor	%f22,	%f18,	%f26
	membar	0x10
	movn	%xcc,	%l5,	%o6
	sll	%g7,	%i7,	%o1
	movge	%xcc,	%l3,	%g2
	smulcc	%o3,	%g1,	%l1
	bn,a,pt	%xcc,	loop_2927
	udivcc	%i3,	0x1948,	%i5
	edge16l	%i1,	%g5,	%i2
	fpadd32	%f22,	%f26,	%f14
loop_2927:
	tn	%icc,	0x5
	fcmple32	%f14,	%f12,	%o7
	ba	%icc,	loop_2928
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l2,	0x07B,	%g4
	stb	%l0,	[%l7 + 0x4B]
loop_2928:
	brlez	%i4,	loop_2929
	fmuld8ulx16	%f24,	%f5,	%f16
	sll	%o5,	0x15,	%g3
	andncc	%l6,	%o0,	%o4
loop_2929:
	nop
	set	0x20, %l4
	ldsba	[%l7 + %l4] 0x11,	%g6
	orcc	%i6,	0x0642,	%i0
	sllx	%o2,	%l4,	%o6
	move	%xcc,	%g7,	%i7
	for	%f20,	%f20,	%f28
	edge32n	%o1,	%l3,	%l5
	fmovdle	%icc,	%f8,	%f8
	fcmple32	%f16,	%f0,	%o3
	popc	0x1DAA,	%g1
	std	%l0,	[%l7 + 0x10]
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	lduw	[%l7 + 0x44],	%g2
	fmovsneg	%icc,	%f5,	%f25
	siam	0x4
	tvs	%icc,	0x6
	fornot1s	%f12,	%f24,	%f20
	fmovdge	%icc,	%f2,	%f15
	sub	%i3,	0x1571,	%i1
	orncc	%g5,	%i5,	%i2
	brz	%l2,	loop_2930
	fmovdpos	%icc,	%f1,	%f27
	movleu	%xcc,	%g4,	%l0
	edge8	%o7,	%o5,	%i4
loop_2930:
	movre	%l6,	%o0,	%o4
	brnz	%g6,	loop_2931
	fpackfix	%f4,	%f28
	array32	%i6,	%i0,	%g3
	edge32l	%o2,	%l4,	%o6
loop_2931:
	nop
	setx	loop_2932,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%g7,	0x1D,	%o1
	udivcc	%l3,	0x1C26,	%i7
	srax	%l5,	0x00,	%o3
loop_2932:
	call	loop_2933
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l1,	%g2,	%g1
	orncc	%i3,	%g5,	%i1
loop_2933:
	taddcc	%i2,	0x01B3,	%i5
	membar	0x5C
	sub	%g4,	0x0FAC,	%l2
	set	0x31, %g6
	lduba	[%l7 + %g6] 0x89,	%o7
	sub	%l0,	0x17E2,	%i4
	movne	%xcc,	%o5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x3
	tsubcctv	%o4,	%l6,	%g6
	srax	%i6,	0x14,	%g3
	movcs	%icc,	%o2,	%i0
	fmovdl	%icc,	%f29,	%f1
	mova	%icc,	%l4,	%o6
	fbul,a	%fcc3,	loop_2934
	movrgz	%o1,	%g7,	%l3
	addc	%l5,	%i7,	%l1
	brgz	%g2,	loop_2935
loop_2934:
	movn	%xcc,	%g1,	%i3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%g5,	%o3
loop_2935:
	ldx	[%l7 + 0x60],	%i2
	fmovrsgez	%i5,	%f7,	%f18
	ldstub	[%l7 + 0x65],	%i1
	pdist	%f10,	%f24,	%f22
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x19,	 0x0
	sdiv	%l2,	0x0F96,	%l0
	orn	%o7,	%i4,	%o0
	ldsb	[%l7 + 0x5E],	%o4
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x17,	%f0
	set	0x24, %l0
	ldswa	[%l7 + %l0] 0x88,	%o5
	taddcctv	%l6,	0x13B8,	%g6
	edge16l	%i6,	%o2,	%i0
	alignaddr	%l4,	%g3,	%o6
	fpsub16	%f8,	%f20,	%f26
	fmovdg	%icc,	%f6,	%f3
	fbul	%fcc3,	loop_2936
	sdivx	%g7,	0x1104,	%o1
	fbn,a	%fcc3,	loop_2937
	edge8	%l3,	%l5,	%l1
loop_2936:
	edge16n	%g2,	%i7,	%i3
	fpsub32	%f30,	%f24,	%f18
loop_2937:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x5C] %asi,	%g5
	edge32ln	%g1,	%o3,	%i5
	sdiv	%i1,	0x177F,	%g4
	fbu,a	%fcc2,	loop_2938
	tpos	%icc,	0x3
	tgu	%icc,	0x2
	bn	loop_2939
loop_2938:
	andcc	%i2,	0x04E9,	%l2
	tcc	%icc,	0x2
	tvs	%icc,	0x0
loop_2939:
	sdivcc	%l0,	0x0725,	%i4
	mulx	%o0,	%o4,	%o5
	fpadd16s	%f29,	%f19,	%f6
	membar	0x2B
	edge16ln	%o7,	%l6,	%g6
	fmul8x16	%f10,	%f16,	%f8
	fba,a	%fcc3,	loop_2940
	srax	%o2,	%i6,	%i0
	tl	%icc,	0x1
	sra	%g3,	%o6,	%l4
loop_2940:
	fmovrslz	%g7,	%f28,	%f20
	fcmpgt16	%f30,	%f28,	%l3
	movpos	%icc,	%l5,	%l1
	st	%f27,	[%l7 + 0x30]
	fmovsge	%xcc,	%f6,	%f5
	fbg	%fcc0,	loop_2941
	tl	%icc,	0x3
	fzeros	%f5
	ldsw	[%l7 + 0x40],	%g2
loop_2941:
	fmovrde	%o1,	%f18,	%f16
	fmovde	%xcc,	%f12,	%f31
	move	%xcc,	%i7,	%g5
	edge32l	%i3,	%o3,	%i5
	fbge,a	%fcc3,	loop_2942
	fbug	%fcc1,	loop_2943
	tn	%icc,	0x5
	movrlz	%g1,	0x260,	%i1
loop_2942:
	fmovdne	%icc,	%f16,	%f2
loop_2943:
	tg	%xcc,	0x7
	movg	%icc,	%i2,	%g4
	xorcc	%l0,	0x120A,	%l2
	membar	0x41
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x4
	movge	%xcc,	%o0,	%i4
	edge32n	%o4,	%o5,	%o7
	ldsw	[%l7 + 0x30],	%l6
	set	0x5F, %g5
	stba	%o2,	[%l7 + %g5] 0x14
	fornot1	%f4,	%f12,	%f20
	andcc	%g6,	0x0E05,	%i6
	sll	%i0,	%o6,	%l4
	taddcctv	%g3,	0x1E60,	%l3
	brz	%g7,	loop_2944
	sllx	%l1,	%l5,	%o1
	fandnot2	%f16,	%f4,	%f16
	movl	%xcc,	%i7,	%g2
loop_2944:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g5,	%o3,	%i5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	movvc	%xcc,	%i3,	%i1
	ble,pn	%icc,	loop_2945
	add	%i2,	0x02FF,	%l0
	srax	%g4,	0x1B,	%o0
	sethi	0x0836,	%i4
loop_2945:
	fbge	%fcc1,	loop_2946
	fmovda	%icc,	%f18,	%f26
	bge	%xcc,	loop_2947
	udiv	%o4,	0x07D6,	%o5
loop_2946:
	fornot2s	%f4,	%f3,	%f20
	tsubcc	%l2,	%o7,	%l6
loop_2947:
	ldsb	[%l7 + 0x0E],	%g6
	tne	%xcc,	0x6
	add	%o2,	%i0,	%o6
	xorcc	%l4,	%i6,	%l3
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x45] %asi,	%g3
	movneg	%xcc,	%l1,	%g7
	fmul8x16au	%f7,	%f16,	%f12
	sdiv	%l5,	0x0A9B,	%o1
	movle	%icc,	%i7,	%g2
	call	loop_2948
	movpos	%icc,	%o3,	%g5
	movn	%icc,	%g1,	%i3
	fxnor	%f30,	%f26,	%f2
loop_2948:
	edge8	%i5,	%i2,	%l0
	fone	%f20
	fone	%f10
	tge	%xcc,	0x4
	mulx	%i1,	0x1DC5,	%o0
	tn	%xcc,	0x2
	nop
	setx	loop_2949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%g4,	0x1894,	%i4
	mulscc	%o4,	0x07AC,	%o5
	umul	%l2,	0x141D,	%o7
loop_2949:
	orn	%g6,	%o2,	%l6
	mova	%xcc,	%o6,	%l4
	taddcctv	%i6,	%l3,	%i0
	sdivx	%g3,	0x1752,	%l1
	nop
	setx	loop_2950,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%l5,	%g7,	%o1
	brlz,a	%g2,	loop_2951
	sth	%i7,	[%l7 + 0x64]
loop_2950:
	fnot2s	%f26,	%f18
	brgz,a	%o3,	loop_2952
loop_2951:
	edge8ln	%g1,	%g5,	%i5
	fmovsvc	%xcc,	%f22,	%f26
	tne	%icc,	0x0
loop_2952:
	sll	%i3,	0x19,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x2D],	%i1
	fmovrsgz	%i2,	%f17,	%f8
	fbuge,a	%fcc1,	loop_2953
	edge8n	%g4,	%i4,	%o0
	xnor	%o5,	%o4,	%o7
	fbule,a	%fcc2,	loop_2954
loop_2953:
	fandnot1s	%f8,	%f4,	%f31
	addcc	%g6,	%l2,	%l6
	fmul8ulx16	%f22,	%f10,	%f0
loop_2954:
	movleu	%xcc,	%o2,	%o6
	brgez,a	%l4,	loop_2955
	movneg	%icc,	%l3,	%i0
	fmovdcc	%icc,	%f28,	%f10
	fxors	%f29,	%f26,	%f28
loop_2955:
	flush	%l7 + 0x74
	fblg,a	%fcc2,	loop_2956
	fzero	%f24
	addc	%g3,	%i6,	%l1
	udiv	%l5,	0x18DA,	%g7
loop_2956:
	edge32n	%o1,	%g2,	%i7
	mova	%xcc,	%o3,	%g5
	ldsh	[%l7 + 0x14],	%g1
	movcs	%xcc,	%i5,	%l0
	addcc	%i3,	0x056F,	%i2
	fpack16	%f28,	%f26
	subc	%i1,	0x0060,	%i4
	stw	%o0,	[%l7 + 0x28]
	tge	%xcc,	0x4
	bne,a	loop_2957
	fnot1	%f12,	%f24
	subc	%g4,	%o5,	%o7
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x16
	membar	#Sync
loop_2957:
	ldd	[%l7 + 0x18],	%f8
	fmovsvs	%icc,	%f25,	%f4
	taddcctv	%o4,	%g6,	%l6
	fornot1s	%f13,	%f9,	%f8
	orn	%o2,	0x0DE6,	%o6
	fblg,a	%fcc2,	loop_2958
	fmovscc	%xcc,	%f8,	%f25
	ldd	[%l7 + 0x70],	%f16
	orcc	%l2,	0x0A55,	%l3
loop_2958:
	tl	%icc,	0x1
	te	%icc,	0x3
	fxnor	%f2,	%f26,	%f4
	orncc	%l4,	0x0A5B,	%g3
	udivcc	%i0,	0x04F6,	%i6
	fones	%f15
	fxnor	%f22,	%f2,	%f8
	bvs,pn	%icc,	loop_2959
	addc	%l5,	%g7,	%o1
	bl,pt	%icc,	loop_2960
	edge8	%l1,	%g2,	%o3
loop_2959:
	ldsh	[%l7 + 0x52],	%i7
	fba,a	%fcc0,	loop_2961
loop_2960:
	alignaddr	%g5,	%i5,	%l0
	movl	%icc,	%g1,	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%i4
loop_2961:
	fmovsneg	%xcc,	%f9,	%f26
	subccc	%o0,	%i2,	%o5
	fbg,a	%fcc0,	loop_2962
	tvs	%xcc,	0x3
	fpsub32	%f8,	%f24,	%f14
	udiv	%o7,	0x1B4B,	%g4
loop_2962:
	alignaddrl	%g6,	%o4,	%o2
	addcc	%o6,	%l6,	%l2
	udivx	%l4,	0x162C,	%g3
	sdiv	%i0,	0x0587,	%i6
	fone	%f8
	std	%f24,	[%l7 + 0x68]
	fbne,a	%fcc2,	loop_2963
	movre	%l3,	0x0F3,	%g7
	fsrc2s	%f28,	%f15
	orcc	%o1,	0x1E04,	%l1
loop_2963:
	fbug,a	%fcc3,	loop_2964
	fnors	%f3,	%f22,	%f13
	fbg,a	%fcc0,	loop_2965
	alignaddrl	%g2,	%o3,	%i7
loop_2964:
	fmovrdgz	%l5,	%f16,	%f20
	edge32n	%g5,	%l0,	%i5
loop_2965:
	addcc	%g1,	0x18DC,	%i3
	nop
	setx	loop_2966,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f23,	%f20
	fsrc1	%f2,	%f8
	te	%icc,	0x1
loop_2966:
	sth	%i1,	[%l7 + 0x44]
	addc	%i4,	%i2,	%o5
	fcmpeq16	%f8,	%f0,	%o0
	movpos	%icc,	%g4,	%g6
	pdist	%f22,	%f22,	%f18
	st	%f30,	[%l7 + 0x68]
	tle	%xcc,	0x2
	array16	%o7,	%o4,	%o2
	movne	%xcc,	%o6,	%l6
	sll	%l2,	%g3,	%i0
	edge32	%i6,	%l3,	%l4
	xor	%o1,	0x1DBE,	%l1
	alignaddrl	%g2,	%o3,	%i7
	edge32	%l5,	%g7,	%g5
	fmovsne	%icc,	%f22,	%f31
	fmovdg	%xcc,	%f28,	%f17
	udiv	%l0,	0x09CB,	%i5
	edge32n	%i3,	%i1,	%i4
	movleu	%icc,	%i2,	%g1
	udivx	%o5,	0x06F6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g6,	%g4
	set	0x78, %i5
	lduwa	[%l7 + %i5] 0x10,	%o4
	and	%o7,	0x0F4F,	%o2
	edge32	%l6,	%o6,	%g3
	udivx	%l2,	0x1311,	%i6
	std	%f2,	[%l7 + 0x28]
	prefetch	[%l7 + 0x7C],	 0x0
	fmovsn	%icc,	%f8,	%f22
	alignaddrl	%l3,	%i0,	%o1
	xor	%l1,	%l4,	%o3
	tn	%xcc,	0x1
	array16	%i7,	%g2,	%l5
	membar	0x5A
	fmovda	%xcc,	%f23,	%f1
	xnor	%g5,	0x0B25,	%g7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%i5
	membar	0x0A
	edge16l	%l0,	%i3,	%i4
	tneg	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	sta	%f7,	[%l7 + 0x2C] %asi
	sdivx	%i1,	0x1E74,	%g1
	move	%xcc,	%i2,	%o5
	tleu	%icc,	0x5
	movn	%icc,	%g6,	%g4
	st	%f14,	[%l7 + 0x44]
	array8	%o0,	%o7,	%o4
	smul	%o2,	0x1634,	%l6
	fpsub16s	%f0,	%f5,	%f6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x62] %asi,	%g3
	brz	%l2,	loop_2967
	movn	%icc,	%i6,	%l3
	sdivx	%o6,	0x191A,	%o1
	mova	%icc,	%l1,	%l4
loop_2967:
	fmovs	%f17,	%f28
	ta	%icc,	0x7
	fbge,a	%fcc2,	loop_2968
	prefetch	[%l7 + 0x40],	 0x2
	tgu	%xcc,	0x0
	fmovde	%icc,	%f15,	%f25
loop_2968:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%o3
	brgz,a	%g2,	loop_2969
	move	%icc,	%l5,	%g5
	bcc	loop_2970
	fcmpgt16	%f30,	%f4,	%i7
loop_2969:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g7,	%l0,	%i3
loop_2970:
	siam	0x6
	addccc	%i5,	0x1DB7,	%i1
	tne	%icc,	0x3
	tle	%xcc,	0x6
	nop
	setx	loop_2971,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%g1,	%i2
	movneg	%xcc,	%o5,	%g6
	fcmpgt32	%f30,	%f12,	%i4
loop_2971:
	brgz	%g4,	loop_2972
	fbg,a	%fcc0,	loop_2973
	nop
	set	0x5A, %o2
	lduh	[%l7 + %o2],	%o0
	fnot1	%f14,	%f24
loop_2972:
	orn	%o7,	%o4,	%o2
loop_2973:
	srl	%l6,	%l2,	%i6
	stb	%l3,	[%l7 + 0x15]
	fmovscs	%icc,	%f22,	%f17
	movvs	%xcc,	%g3,	%o6
	ba,a	%xcc,	loop_2974
	sethi	0x0836,	%l1
	bcc,a,pt	%xcc,	loop_2975
	fpadd16	%f12,	%f30,	%f8
loop_2974:
	sdiv	%l4,	0x1878,	%i0
	array8	%o1,	%o3,	%g2
loop_2975:
	fmovrse	%l5,	%f11,	%f27
	fmovrde	%g5,	%f0,	%f22
	fones	%f18
	edge16l	%g7,	%l0,	%i7
	fmovs	%f5,	%f16
	movvc	%icc,	%i5,	%i3
	ld	[%l7 + 0x78],	%f2
	sir	0x1FCB
	fmovsleu	%xcc,	%f13,	%f16
	movrne	%i1,	%i2,	%o5
	fbule	%fcc0,	loop_2976
	tsubcc	%g1,	0x0E0C,	%i4
	smul	%g6,	%g4,	%o7
	mova	%icc,	%o4,	%o2
loop_2976:
	udivcc	%l6,	0x0964,	%l2
	edge8ln	%i6,	%l3,	%g3
	array32	%o6,	%o0,	%l1
	set	0x80, %i7
	ldxa	[%g0 + %i7] 0x58,	%l4
	movne	%xcc,	%o1,	%i0
	orn	%g2,	%l5,	%o3
	mulx	%g5,	0x0875,	%l0
	addc	%g7,	%i5,	%i3
	xnor	%i7,	%i1,	%o5
	fcmpgt32	%f0,	%f20,	%g1
	array16	%i2,	%g6,	%g4
	edge8	%o7,	%i4,	%o4
	movvc	%icc,	%o2,	%l2
	fmovrdne	%i6,	%f24,	%f0
	fbe	%fcc0,	loop_2977
	fcmped	%fcc0,	%f10,	%f12
	fxors	%f8,	%f12,	%f25
	edge32n	%l3,	%g3,	%l6
loop_2977:
	fbule	%fcc3,	loop_2978
	fmovsl	%xcc,	%f31,	%f19
	brlez,a	%o0,	loop_2979
	orcc	%o6,	%l1,	%l4
loop_2978:
	nop
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x48] %asi
loop_2979:
	subc	%g2,	0x1A7D,	%l5
	fnegs	%f30,	%f12
	sllx	%o1,	0x00,	%g5
	tneg	%icc,	0x7
	fcmps	%fcc0,	%f3,	%f23
	tn	%icc,	0x1
	tvc	%icc,	0x6
	andn	%l0,	0x0140,	%o3
	umul	%g7,	0x1AC6,	%i5
	ldx	[%l7 + 0x58],	%i7
	sdivx	%i1,	0x05AF,	%i3
	tg	%xcc,	0x0
	mulx	%g1,	%o5,	%g6
	tne	%icc,	0x3
	move	%icc,	%g4,	%i2
	set	0x34, %l1
	stwa	%o7,	[%l7 + %l1] 0xeb
	membar	#Sync
	bneg	%icc,	loop_2980
	alignaddr	%o4,	%o2,	%l2
	smulcc	%i6,	%l3,	%i4
	movne	%icc,	%g3,	%o0
loop_2980:
	movrne	%o6,	0x328,	%l1
	sethi	0x0D0C,	%l6
	fxors	%f1,	%f26,	%f3
	movvs	%icc,	%i0,	%l4
	edge16n	%l5,	%o1,	%g5
	xorcc	%g2,	0x10BE,	%l0
	movrne	%g7,	0x2BA,	%i5
	prefetch	[%l7 + 0x58],	 0x3
	movrne	%o3,	%i7,	%i1
	movcc	%icc,	%g1,	%o5
	fnegs	%f2,	%f6
	movrlz	%i3,	0x2B3,	%g6
	sllx	%g4,	0x01,	%i2
	xorcc	%o4,	0x1E41,	%o2
	fand	%f16,	%f0,	%f12
	fmovsg	%xcc,	%f0,	%f24
	movrgez	%o7,	0x318,	%l2
	movrlz	%i6,	%i4,	%l3
	tleu	%icc,	0x5
	udivx	%o0,	0x0B22,	%o6
	ld	[%l7 + 0x44],	%f14
	bpos	loop_2981
	fcmpd	%fcc1,	%f14,	%f2
	alignaddrl	%l1,	%l6,	%g3
	udivx	%i0,	0x0C01,	%l4
loop_2981:
	nop
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x10,	%l5
	fbg,a	%fcc2,	loop_2982
	tl	%xcc,	0x7
	tneg	%xcc,	0x5
	fmovdcc	%icc,	%f15,	%f15
loop_2982:
	fmovsl	%xcc,	%f9,	%f16
	nop
	setx	loop_2983,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brz,a	%o1,	loop_2984
	fpadd32s	%f15,	%f20,	%f0
	edge8	%g2,	%g5,	%g7
loop_2983:
	fmovdcs	%xcc,	%f27,	%f2
loop_2984:
	movleu	%icc,	%l0,	%i5
	fmul8x16au	%f12,	%f6,	%f16
	tgu	%icc,	0x6
	tsubcctv	%o3,	%i7,	%i1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%g1
	movrlz	%o5,	%g6,	%i3
	sir	0x0EAC
	add	%i2,	%g4,	%o4
	taddcctv	%o2,	%o7,	%l2
	fors	%f7,	%f13,	%f24
	array16	%i6,	%i4,	%l3
	edge8ln	%o6,	%l1,	%l6
	sdivx	%g3,	0x1F99,	%i0
	edge32n	%o0,	%l4,	%o1
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x56] %asi,	%g2
	fcmpne16	%f2,	%f10,	%l5
	movg	%icc,	%g5,	%l0
	fcmpne32	%f10,	%f16,	%i5
	edge32l	%o3,	%i7,	%i1
	edge8l	%g7,	%g1,	%o5
	fmul8sux16	%f0,	%f18,	%f0
	fbn,a	%fcc2,	loop_2985
	orn	%i3,	%i2,	%g4
	fandnot2s	%f17,	%f14,	%f25
	tcc	%icc,	0x3
loop_2985:
	fones	%f22
	taddcc	%g6,	0x0094,	%o2
	wr	%g0,	0x81,	%asi
	stda	%o4,	[%l7 + 0x20] %asi
	bleu,a,pt	%icc,	loop_2986
	movle	%xcc,	%l2,	%i6
	fcmped	%fcc2,	%f18,	%f24
	brgz	%o7,	loop_2987
loop_2986:
	flush	%l7 + 0x18
	fmul8x16al	%f11,	%f19,	%f10
	edge8n	%i4,	%l3,	%o6
loop_2987:
	edge32l	%l1,	%l6,	%g3
	be,pn	%xcc,	loop_2988
	movcs	%icc,	%i0,	%o0
	xorcc	%o1,	0x193A,	%l4
	fbge	%fcc0,	loop_2989
loop_2988:
	xor	%l5,	0x0EA6,	%g5
	fbg	%fcc0,	loop_2990
	tne	%xcc,	0x2
loop_2989:
	std	%g2,	[%l7 + 0x30]
	array8	%l0,	%o3,	%i7
loop_2990:
	mova	%xcc,	%i1,	%i5
	and	%g7,	%o5,	%g1
	movn	%xcc,	%i2,	%g4
	fmovse	%icc,	%f9,	%f26
	fpadd16s	%f7,	%f20,	%f1
	tpos	%xcc,	0x2
	orncc	%i3,	%g6,	%o4
	array16	%l2,	%i6,	%o2
	andncc	%i4,	%o7,	%l3
	sdivx	%o6,	0x0F06,	%l6
	set	0x4C, %i2
	stha	%l1,	[%l7 + %i2] 0xe3
	membar	#Sync
	sdiv	%i0,	0x17A3,	%g3
	tleu	%xcc,	0x0
	sir	0x0CB8
	smulcc	%o0,	0x175E,	%l4
	movpos	%icc,	%l5,	%o1
	xnor	%g2,	%l0,	%g5
	bvs,pt	%xcc,	loop_2991
	tsubcctv	%o3,	%i1,	%i7
	ldub	[%l7 + 0x2D],	%i5
	movvs	%icc,	%o5,	%g7
loop_2991:
	sdiv	%g1,	0x016E,	%i2
	fmuld8sux16	%f28,	%f18,	%f28
	tg	%icc,	0x7
	fmovdleu	%icc,	%f15,	%f12
	tpos	%icc,	0x0
	bl	loop_2992
	fcmple32	%f8,	%f30,	%g4
	array32	%g6,	%i3,	%o4
	movleu	%icc,	%l2,	%i6
loop_2992:
	ld	[%l7 + 0x2C],	%f7
	tsubcc	%i4,	%o7,	%l3
	edge8l	%o2,	%o6,	%l6
	movvc	%xcc,	%l1,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f7,	%f7,	%f24
	fbule,a	%fcc1,	loop_2993
	fmovdleu	%xcc,	%f14,	%f13
	fmovsge	%icc,	%f6,	%f2
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x48] %asi,	%o0
loop_2993:
	movle	%xcc,	%l4,	%l5
	stbar
	bge,a,pt	%icc,	loop_2994
	addccc	%o1,	0x0FDA,	%g2
	and	%i0,	%g5,	%l0
	set	0x32, %o7
	stba	%i1,	[%l7 + %o7] 0x10
loop_2994:
	tvc	%icc,	0x3
	fmovrslez	%o3,	%f30,	%f28
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x33] %asi,	%i5
	sir	0x1F3B
	tge	%icc,	0x5
	movne	%xcc,	%i7,	%g7
	tsubcc	%o5,	%g1,	%i2
	movcc	%icc,	%g6,	%g4
	membar	0x19
	orn	%o4,	%l2,	%i3
	fmovdg	%icc,	%f30,	%f8
	fcmpeq32	%f22,	%f2,	%i6
	fands	%f2,	%f2,	%f23
	movl	%icc,	%o7,	%i4
	addcc	%l3,	0x0764,	%o2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x10] %asi,	%l6
	edge8n	%o6,	%g3,	%o0
	ld	[%l7 + 0x7C],	%f11
	movn	%xcc,	%l4,	%l1
	nop
	set	0x15, %o3
	ldsb	[%l7 + %o3],	%l5
	or	%o1,	%g2,	%i0
	add	%g5,	0x004E,	%i1
	set	0x54, %i0
	lda	[%l7 + %i0] 0x80,	%f30
	tsubcc	%o3,	0x177B,	%l0
	ldd	[%l7 + 0x20],	%i4
	fble,a	%fcc2,	loop_2995
	movgu	%icc,	%g7,	%i7
	movcs	%xcc,	%g1,	%o5
	set	0x60, %o4
	lduwa	[%l7 + %o4] 0x0c,	%i2
loop_2995:
	ldsw	[%l7 + 0x24],	%g4
	tleu	%xcc,	0x4
	std	%f12,	[%l7 + 0x70]
	fands	%f26,	%f10,	%f16
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movvc	%xcc,	%g6,	%l2
	movrne	%o4,	%i3,	%i6
	movpos	%xcc,	%o7,	%i4
	lduw	[%l7 + 0x28],	%l3
	fpadd32	%f8,	%f16,	%f0
	udivcc	%l6,	0x1CCA,	%o6
	tn	%icc,	0x3
	tle	%xcc,	0x3
	movleu	%icc,	%g3,	%o2
	fmovsneg	%icc,	%f26,	%f29
	sethi	0x1D05,	%l4
	tge	%xcc,	0x4
	taddcc	%l1,	0x1D92,	%o0
	fcmpgt32	%f2,	%f10,	%l5
	movcc	%icc,	%g2,	%o1
	addccc	%g5,	%i1,	%o3
	xnor	%i0,	0x0854,	%l0
	smulcc	%i5,	%i7,	%g1
	movgu	%xcc,	%g7,	%o5
	mova	%xcc,	%i2,	%g6
	udivcc	%g4,	0x0700,	%o4
	udivcc	%i3,	0x0B2C,	%i6
	fbuge	%fcc3,	loop_2996
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%l2
	bg,a,pn	%icc,	loop_2997
	movcc	%icc,	%i4,	%l3
loop_2996:
	sdivx	%l6,	0x15AD,	%o6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g3,	%o7
loop_2997:
	swap	[%l7 + 0x38],	%o2
	movge	%xcc,	%l4,	%l1
	tpos	%xcc,	0x5
	set	0x48, %i3
	ldsha	[%l7 + %i3] 0x88,	%l5
	fmovsvc	%xcc,	%f27,	%f27
	tg	%icc,	0x7
	tle	%xcc,	0x4
	and	%g2,	%o1,	%o0
	fmovspos	%xcc,	%f4,	%f15
	fsrc1	%f2,	%f22
	ldsb	[%l7 + 0x3E],	%i1
	edge32n	%g5,	%i0,	%o3
	addcc	%i5,	0x0443,	%i7
	fnot1	%f12,	%f14
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%g1
	be,a	loop_2998
	fcmpne32	%f26,	%f8,	%l0
	sllx	%g7,	0x01,	%i2
	fmovrdgz	%o5,	%f20,	%f16
loop_2998:
	umul	%g6,	%o4,	%i3
	movre	%g4,	0x0D1,	%i6
	movleu	%icc,	%i4,	%l3
	sdiv	%l2,	0x0A82,	%l6
	membar	0x21
	movvs	%xcc,	%o6,	%g3
	alignaddr	%o7,	%o2,	%l1
	ldstub	[%l7 + 0x6B],	%l4
	andncc	%g2,	%o1,	%l5
	brgez	%i1,	loop_2999
	siam	0x6
	fmul8x16al	%f24,	%f22,	%f24
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%i0
loop_2999:
	edge32l	%o0,	%i5,	%o3
	orncc	%g1,	0x1D2F,	%i7
	brnz	%l0,	loop_3000
	movrgez	%g7,	0x23E,	%o5
	fbule,a	%fcc2,	loop_3001
	std	%i2,	[%l7 + 0x20]
loop_3000:
	tsubcctv	%o4,	0x0F3C,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3001:
	fpsub32s	%f1,	%f12,	%f15
	movrlez	%i3,	0x2C7,	%g4
	fbne,a	%fcc1,	loop_3002
	edge16l	%i4,	%l3,	%l2
	tgu	%icc,	0x7
	srl	%l6,	%o6,	%g3
loop_3002:
	movrgez	%o7,	0x05C,	%o2
	fxnors	%f11,	%f7,	%f26
	tcc	%xcc,	0x2
	nop
	setx	loop_3003,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f12,	%f16
	edge32	%l1,	%i6,	%l4
	tcc	%xcc,	0x2
loop_3003:
	membar	0x09
	fmovrdlez	%o1,	%f26,	%f8
	wr	%g0,	0x11,	%asi
	stxa	%l5,	[%l7 + 0x28] %asi
	movrlez	%g2,	0x213,	%g5
	smul	%i0,	%o0,	%i1
	udivx	%o3,	0x0C81,	%g1
	bleu,pn	%icc,	loop_3004
	fmul8x16au	%f18,	%f21,	%f10
	orncc	%i7,	0x04DA,	%l0
	nop
	setx	loop_3005,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_3004:
	movrlz	%i5,	0x29D,	%o5
	subccc	%g7,	0x00D1,	%o4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x60] %asi,	%g6
loop_3005:
	movne	%icc,	%i2,	%g4
	fpadd32s	%f14,	%f26,	%f12
	tl	%icc,	0x3
	bcs,a	loop_3006
	umul	%i4,	%l3,	%i3
	tvc	%xcc,	0x4
	xnor	%l6,	%o6,	%g3
loop_3006:
	srlx	%l2,	0x00,	%o7
	fmovsleu	%icc,	%f28,	%f21
	andcc	%o2,	0x0C38,	%l1
	prefetch	[%l7 + 0x34],	 0x1
	and	%i6,	0x1A7F,	%o1
	popc	0x1096,	%l4
	nop
	setx loop_3007, %l0, %l1
	jmpl %l1, %g2
	movrne	%l5,	%i0,	%g5
	brgz,a	%o0,	loop_3008
	movcs	%icc,	%i1,	%g1
loop_3007:
	tge	%xcc,	0x0
	fpsub16	%f30,	%f8,	%f20
loop_3008:
	fandnot2	%f6,	%f8,	%f20
	movrne	%i7,	%o3,	%i5
	fnot2	%f2,	%f24
	fbu	%fcc1,	loop_3009
	popc	%o5,	%l0
	fpackfix	%f24,	%f9
	sir	0x02E6
loop_3009:
	edge16n	%o4,	%g7,	%i2
	nop
	set	0x34, %o1
	ldub	[%l7 + %o1],	%g6
	alignaddr	%g4,	%i4,	%i3
	andncc	%l3,	%o6,	%l6
	fmovrdlez	%g3,	%f6,	%f22
	membar	0x2A
	umul	%l2,	%o2,	%o7
	fmovrslz	%i6,	%f28,	%f7
	fmovdneg	%xcc,	%f27,	%f10
	add	%o1,	0x0567,	%l1
	fbo,a	%fcc1,	loop_3010
	srax	%l4,	0x0D,	%l5
	tcc	%icc,	0x5
	and	%i0,	%g5,	%g2
loop_3010:
	lduw	[%l7 + 0x10],	%o0
	movge	%xcc,	%g1,	%i1
	fmovrsgez	%o3,	%f26,	%f24
	tleu	%xcc,	0x3
	movcs	%xcc,	%i5,	%i7
	set	0x18, %i1
	lduwa	[%l7 + %i1] 0x80,	%l0
	edge16l	%o5,	%o4,	%g7
	taddcc	%i2,	0x0FB6,	%g4
	udivcc	%i4,	0x0DED,	%i3
	and	%g6,	0x149F,	%l3
	subccc	%o6,	%g3,	%l2
	fornot2s	%f10,	%f14,	%f2
	edge8n	%l6,	%o7,	%o2
	fbe,a	%fcc1,	loop_3011
	movrgz	%o1,	0x3DD,	%l1
	fcmpeq32	%f14,	%f8,	%l4
	swap	[%l7 + 0x38],	%i6
loop_3011:
	fornot2	%f30,	%f22,	%f18
	bcs,a,pn	%icc,	loop_3012
	alignaddr	%l5,	%g5,	%g2
	move	%xcc,	%o0,	%g1
	fmovdge	%icc,	%f17,	%f8
loop_3012:
	ldx	[%l7 + 0x18],	%i1
	fbl	%fcc2,	loop_3013
	movcc	%icc,	%o3,	%i0
	movcs	%icc,	%i5,	%i7
	mulx	%o5,	0x13DD,	%l0
loop_3013:
	be	%icc,	loop_3014
	brz,a	%g7,	loop_3015
	tsubcctv	%o4,	0x1AF3,	%g4
	movpos	%xcc,	%i4,	%i3
loop_3014:
	andcc	%g6,	%i2,	%o6
loop_3015:
	ldsh	[%l7 + 0x74],	%g3
	movg	%xcc,	%l2,	%l3
	fmovsa	%icc,	%f31,	%f9
	movcs	%icc,	%l6,	%o7
	brgez	%o2,	loop_3016
	fzero	%f8
	set	0x30, %o5
	ldswa	[%l7 + %o5] 0x0c,	%l1
loop_3016:
	fba,a	%fcc1,	loop_3017
	sdivx	%l4,	0x19F0,	%i6
	edge32ln	%o1,	%g5,	%g2
	sir	0x1E85
loop_3017:
	bneg,pn	%icc,	loop_3018
	umul	%l5,	%g1,	%i1
	xor	%o3,	%o0,	%i0
	andn	%i7,	0x118A,	%i5
loop_3018:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%o5
	xorcc	%g7,	0x1A35,	%o4
	fbl,a	%fcc3,	loop_3019
	xnor	%l0,	0x0037,	%i4
	bcs,a,pn	%icc,	loop_3020
	udivx	%i3,	0x1CD9,	%g6
loop_3019:
	fcmple32	%f28,	%f16,	%i2
	fors	%f30,	%f19,	%f12
loop_3020:
	movrgez	%o6,	0x3A3,	%g3
	ldub	[%l7 + 0x47],	%g4
	addccc	%l3,	0x01AC,	%l6
	edge32l	%l2,	%o7,	%o2
	bcc	loop_3021
	subc	%l1,	0x0494,	%i6
	tgu	%icc,	0x4
	lduw	[%l7 + 0x34],	%o1
loop_3021:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%l4
	fmul8ulx16	%f10,	%f14,	%f26
	movcc	%xcc,	%g5,	%l5
	orn	%g2,	0x15E4,	%g1
	fmovs	%f3,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%o0
	xnor	%o3,	0x0E68,	%i7
	andncc	%i5,	%o5,	%g7
	movneg	%icc,	%i0,	%o4
	ld	[%l7 + 0x44],	%f11
	wr	%g0,	0x80,	%asi
	stba	%l0,	[%l7 + 0x4A] %asi
	edge16n	%i4,	%i3,	%i2
	edge8n	%o6,	%g3,	%g4
	fbne	%fcc0,	loop_3022
	movn	%icc,	%g6,	%l6
	st	%f13,	[%l7 + 0x54]
	fmovsvc	%icc,	%f24,	%f25
loop_3022:
	xnor	%l2,	%l3,	%o7
	fnor	%f16,	%f18,	%f24
	fnot1	%f14,	%f8
	te	%icc,	0x7
	movle	%xcc,	%o2,	%i6
	xnorcc	%o1,	0x171B,	%l1
	movne	%icc,	%l4,	%g5
	alignaddrl	%g2,	%g1,	%i1
	movne	%xcc,	%l5,	%o0
	xor	%o3,	%i7,	%i5
	or	%g7,	0x097B,	%o5
	tpos	%icc,	0x5
	set	0x42, %l2
	stha	%o4,	[%l7 + %l2] 0x10
	sdivx	%l0,	0x1056,	%i4
	fblg,a	%fcc2,	loop_3023
	movl	%icc,	%i0,	%i2
	tle	%icc,	0x4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x11] %asi,	%o6
loop_3023:
	udivcc	%i3,	0x1EEB,	%g3
	brz,a	%g6,	loop_3024
	fmovdleu	%xcc,	%f22,	%f14
	srax	%g4,	%l6,	%l2
	edge8l	%o7,	%l3,	%i6
loop_3024:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	edge32ln	%l1,	%o1,	%l4
	movgu	%xcc,	%g5,	%g1
	for	%f18,	%f8,	%f22
	ldsb	[%l7 + 0x62],	%g2
	st	%f0,	[%l7 + 0x40]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f5,	%f19
	subc	%i1,	0x0698,	%o0
	set	0x34, %g7
	lduwa	[%l7 + %g7] 0x0c,	%l5
	srl	%i7,	0x08,	%i5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7E] %asi,	%g7
	fmovdne	%xcc,	%f29,	%f17
	movvc	%icc,	%o3,	%o4
	move	%icc,	%l0,	%o5
	fbug,a	%fcc0,	loop_3025
	edge8ln	%i4,	%i2,	%o6
	move	%xcc,	%i0,	%i3
	fbl,a	%fcc0,	loop_3026
loop_3025:
	xnorcc	%g6,	%g4,	%l6
	orncc	%l2,	0x031D,	%o7
	tvc	%icc,	0x2
loop_3026:
	movn	%icc,	%g3,	%l3
	fornot1s	%f8,	%f21,	%f1
	tn	%icc,	0x4
	movn	%icc,	%o2,	%l1
	ldsh	[%l7 + 0x0E],	%i6
	fmovdpos	%icc,	%f18,	%f16
	orncc	%o1,	%l4,	%g1
	and	%g5,	%g2,	%o0
	add	%l5,	0x1A12,	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%i5
	ta	%xcc,	0x2
	addccc	%g7,	0x016B,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o3,	%l0
	tsubcc	%o5,	0x16C3,	%i2
	fandnot1	%f16,	%f30,	%f8
	edge8ln	%o6,	%i4,	%i3
	movrgz	%i0,	%g6,	%l6
	popc	0x136A,	%g4
	sdivcc	%l2,	0x1FDD,	%o7
	tle	%xcc,	0x6
	array16	%g3,	%l3,	%l1
	ta	%icc,	0x5
	sllx	%o2,	0x16,	%i6
	set	0x3D, %i6
	ldsba	[%l7 + %i6] 0x81,	%l4
	movge	%icc,	%g1,	%g5
	ta	%xcc,	0x4
	tpos	%xcc,	0x4
	ldsh	[%l7 + 0x16],	%o1
	lduh	[%l7 + 0x28],	%o0
	tvc	%xcc,	0x5
	movcs	%icc,	%g2,	%l5
	fbu	%fcc2,	loop_3027
	bge,a,pt	%xcc,	loop_3028
	smulcc	%i7,	%i1,	%g7
	wr	%g0,	0xea,	%asi
	stwa	%i5,	[%l7 + 0x54] %asi
	membar	#Sync
loop_3027:
	lduh	[%l7 + 0x36],	%o4
loop_3028:
	fpsub16s	%f2,	%f28,	%f14
	sra	%l0,	%o5,	%o3
	movle	%icc,	%i2,	%i4
	taddcc	%i3,	0x0AFF,	%o6
	addcc	%i0,	0x1E39,	%l6
	movpos	%xcc,	%g6,	%g4
	membar	0x79
	for	%f18,	%f20,	%f4
	edge16	%l2,	%g3,	%l3
	fmuld8sux16	%f20,	%f29,	%f12
	sub	%o7,	0x0338,	%o2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2834
!	Type x   	: 1366
!	Type cti   	: 3028
!	Type f   	: 4435
!	Type i   	: 13337
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xD0727189
.word 0x01E0F0CB
.word 0xF07A8DD7
.word 0x5DF130D5
.word 0x35FD7963
.word 0x98E2E3FE
.word 0xFFE426F8
.word 0x4A48676C
.word 0x6D952E9B
.word 0x3E1FC14C
.word 0x7E42029D
.word 0xE3C3FC53
.word 0x911740E6
.word 0x830C44D7
.word 0xAEDAC10B
.word 0x9E92CDF4
.word 0x97D5257D
.word 0x736419B0
.word 0x775780A7
.word 0xB90C075E
.word 0x3372FE82
.word 0x97DBC9DE
.word 0xFD2C22E5
.word 0xD7BF46FC
.word 0xDA0BA9A1
.word 0x0DAEEF99
.word 0x85527A7C
.word 0xC61BFC8B
.word 0x933F27AB
.word 0xF19AF3B1
.word 0x92569B7D
.word 0x7E74B107
.word 0x1D7BCBB0
.word 0x3EB425B4
.word 0xC8A15A2A
.word 0xFFFAB42F
.word 0x6C623B11
.word 0x8AF8358A
.word 0x98E316A7
.word 0x69F223BA
.word 0x4EFCEE12
.word 0xD7543E9B
.word 0x5B51624D
.word 0x932DF92C
.word 0x5E4FC21E
.word 0x2E37B712
.word 0x7230AC34
.word 0x5FEF6EBF
.word 0xB96F69E3
.word 0x9E5316DB
.word 0x54EB0582
.word 0x68F8D794
.word 0xC58DB90C
.word 0x6E1A25ED
.word 0x7567F891
.word 0xD1455700
.word 0x4CB082AB
.word 0x3A672DA2
.word 0xBD1C5F12
.word 0x1E68A3C9
.word 0x3F9C0DD2
.word 0x3804304E
.word 0xA592D172
.word 0x76E741D9
.end
