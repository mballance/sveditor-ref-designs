/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f12.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f12.s,v 1.1 2007/05/11 17:22:21 drp Exp $"
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
	setx	0x71586DC0F06984AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0x0,	%g2
	set	0x1,	%g3
	set	0x8,	%g4
	set	0x4,	%g5
	set	0xA,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xC,	%i1
	set	-0xE,	%i2
	set	-0xB,	%i3
	set	-0xF,	%i4
	set	-0xC,	%i5
	set	-0x3,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x3B3C6D93,	%l0
	set	0x5763E2C7,	%l1
	set	0x5B3D3A37,	%l2
	set	0x62F8CD42,	%l3
	set	0x70CC6C3C,	%l4
	set	0x28D6064D,	%l5
	set	0x55F54D9D,	%l6
	!# Output registers
	set	0x0228,	%o0
	set	0x1496,	%o1
	set	0x0A8C,	%o2
	set	-0x062D,	%o3
	set	-0x163B,	%o4
	set	0x1958,	%o5
	set	0x1B45,	%o6
	set	-0x0E5C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC786C5B613D6F8C)
	INIT_TH_FP_REG(%l7,%f2,0xA80779842C9BF31B)
	INIT_TH_FP_REG(%l7,%f4,0xE24AA0682D607328)
	INIT_TH_FP_REG(%l7,%f6,0x5D08B574E7E8491C)
	INIT_TH_FP_REG(%l7,%f8,0x1BF63E00EBB88638)
	INIT_TH_FP_REG(%l7,%f10,0x59F48D4BC4867E04)
	INIT_TH_FP_REG(%l7,%f12,0xF364526A12575C66)
	INIT_TH_FP_REG(%l7,%f14,0xD187CFCF95E7A0C3)
	INIT_TH_FP_REG(%l7,%f16,0xD9ADC4C3CA743513)
	INIT_TH_FP_REG(%l7,%f18,0x1329E85AD5BA56FE)
	INIT_TH_FP_REG(%l7,%f20,0x26CF0B61A1A871B3)
	INIT_TH_FP_REG(%l7,%f22,0xC155C8267B48FD69)
	INIT_TH_FP_REG(%l7,%f24,0xC8A0D1F6C67F727C)
	INIT_TH_FP_REG(%l7,%f26,0xE1188E48B04109D5)
	INIT_TH_FP_REG(%l7,%f28,0x90D6D0549E7B0ADF)
	INIT_TH_FP_REG(%l7,%f30,0x9A7C81B3FB23F12F)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	stbar
	fpmerge	%f17,	%f2,	%f6
	tg	%icc,	0x7
	fornot2	%f4,	%f12,	%f28
	add	%g2,	%i2,	%o2
	ta	%xcc,	0x4
	ldsh	[%l7 + 0x14],	%l4
	for	%f0,	%f16,	%f26
	ldx	[%l7 + 0x38],	%o4
	tl	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f24,	%f28
	edge16ln	%l3,	%i4,	%g4
	stx	%o3,	[%l7 + 0x70]
	tg	%xcc,	0x2
	tvs	%icc,	0x1
	edge16ln	%l0,	%i3,	%l2
	sll	%o5,	0x02,	%g6
	set	0x50, %i4
	stda	%g4,	[%l7 + %i4] 0x11
	edge32	%i1,	%g1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc0,	loop_1
	flush	%l7 + 0x14
	bl,a,pt	%xcc,	loop_2
	mulscc	%i5,	%o7,	%i6
loop_1:
	movcc	%icc,	%l1,	%o1
	swap	[%l7 + 0x18],	%g3
loop_2:
	tl	%icc,	0x3
	movcc	%icc,	%g7,	%l6
	fbu	%fcc1,	loop_3
	tn	%xcc,	0x5
	fmovd	%f20,	%f30
	bneg	loop_4
loop_3:
	fmovscc	%xcc,	%f27,	%f27
	move	%icc,	%o6,	%o0
	movl	%xcc,	%l5,	%i7
loop_4:
	andcc	%i2,	0x01AF,	%g2
	array32	%o2,	%o4,	%l3
	fmuld8ulx16	%f25,	%f29,	%f0
	fcmps	%fcc1,	%f13,	%f21
	udivcc	%i4,	0x1ECF,	%l4
	fbue,a	%fcc2,	loop_5
	ldd	[%l7 + 0x68],	%f24
	movrlz	%g4,	0x2E5,	%o3
	fmovdgu	%xcc,	%f7,	%f7
loop_5:
	fpack32	%f10,	%f6,	%f26
	movvs	%icc,	%l0,	%i3
	srlx	%l2,	%g6,	%g5
	set	0x10, %l0
	stda	%i0,	[%l7 + %l0] 0x23
	membar	#Sync
	fpack32	%f22,	%f10,	%f0
	array32	%g1,	%o5,	%i0
	orcc	%i5,	0x1084,	%i6
	tsubcc	%l1,	0x0361,	%o7
	prefetch	[%l7 + 0x18],	 0x2
	fmovspos	%icc,	%f24,	%f31
	tg	%icc,	0x5
	fnors	%f10,	%f24,	%f6
	brgz,a	%o1,	loop_6
	st	%f30,	[%l7 + 0x1C]
	bvs,a,pn	%icc,	loop_7
	tvs	%xcc,	0x5
loop_6:
	edge8	%g7,	%l6,	%g3
	array16	%o6,	%l5,	%o0
loop_7:
	fmul8sux16	%f26,	%f26,	%f20
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x19
	sub	%i7,	0x1758,	%i2
	addc	%o2,	%o4,	%g2
	fcmpeq16	%f22,	%f24,	%i4
	popc	0x067C,	%l4
	nop
	set	0x30, %i7
	std	%f0,	[%l7 + %i7]
	membar	0x17
	array8	%l3,	%g4,	%l0
	mulx	%o3,	0x1832,	%i3
	fbule	%fcc2,	loop_8
	sll	%g6,	%g5,	%i1
	orcc	%l2,	0x19F8,	%g1
	smul	%i0,	0x05B1,	%i5
loop_8:
	movcs	%xcc,	%i6,	%o5
	tsubcc	%o7,	0x0464,	%o1
	bneg,a,pn	%icc,	loop_9
	subcc	%l1,	%l6,	%g3
	fcmpne32	%f8,	%f24,	%o6
	edge16l	%g7,	%o0,	%i7
loop_9:
	movgu	%icc,	%i2,	%l5
	stbar
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x58] %asi,	%o4
	udiv	%o2,	0x0631,	%g2
	taddcc	%l4,	%i4,	%g4
	movge	%xcc,	%l3,	%l0
	tleu	%icc,	0x2
	std	%o2,	[%l7 + 0x40]
	lduw	[%l7 + 0x38],	%g6
	movleu	%icc,	%g5,	%i3
	fnot1s	%f11,	%f11
	std	%i0,	[%l7 + 0x28]
	smul	%l2,	%i0,	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%o5
	fpsub16s	%f18,	%f29,	%f15
	tvc	%icc,	0x0
	membar	0x5D
	tvc	%xcc,	0x0
	addcc	%o7,	0x04B3,	%o1
	fcmps	%fcc3,	%f31,	%f23
	fmovsvc	%icc,	%f2,	%f7
	te	%xcc,	0x1
	fmovrse	%i6,	%f19,	%f6
	movneg	%xcc,	%l1,	%g3
	udiv	%l6,	0x098E,	%g7
	bl,pt	%xcc,	loop_10
	or	%o0,	%o6,	%i7
	mulscc	%l5,	%o4,	%i2
	fmovrslz	%o2,	%f5,	%f21
loop_10:
	nop
	set	0x7C, %i3
	ldsha	[%l7 + %i3] 0x18,	%l4
	tvc	%icc,	0x7
	sir	0x1194
	edge32ln	%g2,	%i4,	%l3
	movcc	%xcc,	%l0,	%o3
	swap	[%l7 + 0x44],	%g6
	fmovdpos	%xcc,	%f10,	%f30
	array32	%g4,	%i3,	%g5
	fbue	%fcc3,	loop_11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l2,	0x01,	%i1
	fmovsvc	%xcc,	%f7,	%f11
loop_11:
	add	%i0,	0x128F,	%i5
	movl	%xcc,	%g1,	%o5
	sllx	%o7,	%o1,	%l1
	addccc	%g3,	%l6,	%g7
	fcmpgt32	%f12,	%f12,	%i6
	bshuffle	%f4,	%f6,	%f20
	fpsub32s	%f5,	%f6,	%f20
	fpsub32s	%f25,	%f4,	%f26
	movge	%xcc,	%o6,	%o0
	add	%i7,	%l5,	%o4
	tsubcc	%i2,	%l4,	%g2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x50] %asi,	%i4
	be	loop_12
	edge32n	%l3,	%o2,	%l0
	fcmpne16	%f10,	%f26,	%o3
	bne,pn	%icc,	loop_13
loop_12:
	movrlez	%g6,	0x1B2,	%g4
	movneg	%icc,	%g5,	%l2
	movpos	%xcc,	%i1,	%i3
loop_13:
	te	%icc,	0x2
	move	%icc,	%i5,	%i0
	ldstub	[%l7 + 0x10],	%o5
	set	0x10, %g5
	lduha	[%l7 + %g5] 0x0c,	%g1
	fmovsvc	%icc,	%f22,	%f9
	fcmpes	%fcc1,	%f28,	%f3
	taddcc	%o7,	0x16BE,	%o1
	tl	%xcc,	0x3
	add	%l1,	0x10AC,	%g3
	sllx	%g7,	0x0F,	%l6
	stb	%i6,	[%l7 + 0x7E]
	and	%o6,	%i7,	%o0
	movrgz	%l5,	%o4,	%l4
	bshuffle	%f0,	%f24,	%f0
	tvc	%xcc,	0x3
	nop
	setx	loop_14,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg	%fcc1,	loop_15
	fpadd16s	%f13,	%f19,	%f5
	xor	%g2,	0x1491,	%i2
loop_14:
	movpos	%icc,	%i4,	%l3
loop_15:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x46] %asi,	%o2
	fand	%f24,	%f12,	%f22
	sub	%l0,	%g6,	%g4
	movge	%icc,	%g5,	%l2
	set	0x08, %l5
	ldxa	[%l7 + %l5] 0x14,	%o3
	membar	0x77
	tg	%icc,	0x5
	edge8	%i3,	%i1,	%i5
	ldstub	[%l7 + 0x79],	%i0
	tne	%xcc,	0x1
	fmovsle	%xcc,	%f8,	%f24
	movre	%g1,	%o7,	%o1
	movcs	%xcc,	%o5,	%l1
	sethi	0x0775,	%g7
	array32	%l6,	%g3,	%o6
	be	loop_16
	fsrc2s	%f20,	%f13
	bn,pn	%icc,	loop_17
	sdivcc	%i6,	0x11DA,	%i7
loop_16:
	edge16ln	%l5,	%o0,	%o4
	ldd	[%l7 + 0x38],	%g2
loop_17:
	nop
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x11
	edge16l	%l4,	%i4,	%l3
	tl	%xcc,	0x7
	bcc,a,pn	%xcc,	loop_18
	brz	%i2,	loop_19
	edge8	%o2,	%g6,	%g4
	udivcc	%g5,	0x0EC3,	%l2
loop_18:
	tg	%xcc,	0x2
loop_19:
	addc	%o3,	%l0,	%i3
	fmovsvs	%icc,	%f20,	%f29
	tle	%xcc,	0x2
	tl	%icc,	0x5
	fbl,a	%fcc1,	loop_20
	movcc	%xcc,	%i1,	%i0
	tvc	%xcc,	0x3
	and	%g1,	0x1C29,	%i5
loop_20:
	nop
	setx loop_21, %l0, %l1
	jmpl %l1, %o7
	movne	%icc,	%o1,	%o5
	ta	%xcc,	0x3
	popc	0x0061,	%g7
loop_21:
	move	%icc,	%l1,	%l6
	udivcc	%g3,	0x0D25,	%o6
	mulscc	%i7,	%l5,	%i6
	set	0x1C, %i1
	stwa	%o0,	[%l7 + %i1] 0x10
	movn	%xcc,	%g2,	%l4
	edge8ln	%o4,	%i4,	%i2
	fones	%f17
	fmovrse	%l3,	%f29,	%f7
	fmovdvc	%xcc,	%f18,	%f21
	ldsb	[%l7 + 0x29],	%o2
	fbge,a	%fcc0,	loop_22
	movne	%icc,	%g4,	%g6
	movvc	%icc,	%g5,	%o3
	tsubcc	%l0,	0x15FF,	%l2
loop_22:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x54] %asi,	%i1
	tsubcc	%i0,	0x16CA,	%i3
	and	%i5,	%g1,	%o7
	tge	%icc,	0x2
	fcmple32	%f22,	%f22,	%o1
	tleu	%xcc,	0x1
	fble,a	%fcc0,	loop_23
	fmovdvs	%icc,	%f17,	%f19
	subc	%o5,	0x02BF,	%l1
	nop
	setx	loop_24,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_23:
	subcc	%g7,	%g3,	%l6
	fmul8x16au	%f7,	%f28,	%f2
	fmovscs	%xcc,	%f21,	%f10
loop_24:
	sethi	0x00FE,	%i7
	ble,a,pt	%xcc,	loop_25
	edge16n	%o6,	%l5,	%o0
	subccc	%i6,	0x0D30,	%g2
	fmovrsgez	%o4,	%f18,	%f24
loop_25:
	fpmerge	%f30,	%f2,	%f28
	stw	%l4,	[%l7 + 0x64]
	subcc	%i2,	%i4,	%o2
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0x2
	sll	%l3,	0x1C,	%g5
	smulcc	%g6,	0x0561,	%l0
	tle	%icc,	0x6
	fabss	%f28,	%f26
	fxnors	%f30,	%f31,	%f12
	orn	%l2,	%i1,	%o3
	fmovdl	%xcc,	%f20,	%f16
	fandnot1	%f28,	%f24,	%f28
	tcs	%icc,	0x4
	ld	[%l7 + 0x68],	%f0
	smul	%i0,	0x0EE5,	%i5
	edge8n	%g1,	%i3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o1,	%l1,	%o5
	movgu	%xcc,	%g7,	%l6
	umulcc	%g3,	0x0B25,	%i7
	xor	%o6,	%l5,	%o0
	fone	%f6
	be,a,pt	%xcc,	loop_26
	subcc	%g2,	0x0E2D,	%i6
	and	%l4,	%i2,	%i4
	set	0x32, %i0
	ldsha	[%l7 + %i0] 0x04,	%o4
loop_26:
	addcc	%g4,	0x15C3,	%o2
	membar	0x36
	fcmpeq16	%f14,	%f14,	%l3
	fmovdgu	%icc,	%f1,	%f16
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g6
	edge32	%l0,	%l2,	%g5
	edge8l	%o3,	%i0,	%i5
	movn	%xcc,	%g1,	%i3
	ldsw	[%l7 + 0x54],	%o7
	movcs	%xcc,	%i1,	%l1
	fnor	%f28,	%f4,	%f24
	ble,a	%xcc,	loop_27
	udiv	%o5,	0x05E2,	%g7
	mulscc	%o1,	0x16AE,	%g3
	addc	%l6,	%o6,	%i7
loop_27:
	stb	%o0,	[%l7 + 0x71]
	stw	%g2,	[%l7 + 0x28]
	edge32n	%i6,	%l5,	%i2
	fnot2	%f30,	%f12
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x38] %asi,	%i4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%l4
	bn,a,pt	%icc,	loop_28
	fcmps	%fcc1,	%f5,	%f26
	edge32n	%o2,	%g4,	%g6
	sub	%l0,	0x18C0,	%l3
loop_28:
	move	%xcc,	%l2,	%o3
	popc	0x1B82,	%i0
	fandnot2s	%f7,	%f5,	%f12
	fcmpne32	%f22,	%f30,	%g5
	te	%icc,	0x3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%i5
	bne	loop_29
	fexpand	%f29,	%f22
	sllx	%o7,	0x1E,	%i1
	tl	%xcc,	0x6
loop_29:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x74] %asi,	%f27
	ble,a	%xcc,	loop_30
	fpsub16s	%f17,	%f1,	%f24
	orn	%l1,	0x160F,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30:
	movne	%icc,	%i3,	%o1
	sdiv	%g3,	0x00EF,	%g7
	sdivx	%o6,	0x1B76,	%i7
	fbe,a	%fcc0,	loop_31
	udivcc	%l6,	0x1C0C,	%o0
	sir	0x0DD2
	stw	%i6,	[%l7 + 0x24]
loop_31:
	edge16ln	%g2,	%l5,	%i2
	fbo	%fcc3,	loop_32
	brz	%o4,	loop_33
	tpos	%xcc,	0x5
	fmovs	%f17,	%f3
loop_32:
	sra	%l4,	%i4,	%o2
loop_33:
	tle	%xcc,	0x0
	movneg	%xcc,	%g4,	%g6
	call	loop_34
	bpos,a	loop_35
	movn	%xcc,	%l0,	%l3
	movcc	%xcc,	%l2,	%i0
loop_34:
	fmovsa	%icc,	%f4,	%f10
loop_35:
	sdivcc	%g5,	0x0C03,	%o3
	edge16l	%g1,	%o7,	%i1
	fba	%fcc3,	loop_36
	srax	%l1,	0x1A,	%i5
	fmovdcc	%icc,	%f9,	%f28
	alignaddr	%i3,	%o1,	%g3
loop_36:
	ldx	[%l7 + 0x60],	%o5
	bleu,a,pt	%xcc,	loop_37
	tcs	%icc,	0x6
	brgez	%g7,	loop_38
	tsubcctv	%i7,	%o6,	%l6
loop_37:
	fmovscs	%xcc,	%f7,	%f11
	wr	%g0,	0x11,	%asi
	stha	%o0,	[%l7 + 0x16] %asi
loop_38:
	popc	%g2,	%i6
	tgu	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x24] %asi,	%f4
	or	%i2,	0x12FE,	%o4
	addcc	%l5,	0x1DF7,	%l4
	or	%o2,	0x13A0,	%i4
	movne	%icc,	%g6,	%g4
	edge32l	%l0,	%l2,	%i0
	fbl	%fcc0,	loop_39
	sdivx	%g5,	0x02C8,	%l3
	fbe	%fcc1,	loop_40
	srax	%g1,	0x13,	%o3
loop_39:
	movn	%xcc,	%o7,	%i1
	bpos,pn	%icc,	loop_41
loop_40:
	udivx	%i5,	0x166D,	%l1
	umulcc	%i3,	0x17DE,	%g3
	fcmpd	%fcc2,	%f10,	%f10
loop_41:
	fmovde	%xcc,	%f15,	%f20
	andn	%o1,	%g7,	%i7
	sir	0x0C51
	tge	%xcc,	0x3
	sllx	%o6,	0x09,	%l6
	ldub	[%l7 + 0x32],	%o5
	fbne	%fcc0,	loop_42
	xnor	%g2,	0x0B5A,	%o0
	fbue,a	%fcc3,	loop_43
	fcmpeq32	%f2,	%f4,	%i6
loop_42:
	addccc	%i2,	0x18F3,	%o4
	and	%l5,	0x1539,	%l4
loop_43:
	movn	%icc,	%i4,	%o2
	sethi	0x1FBB,	%g4
	bshuffle	%f22,	%f4,	%f22
	tne	%xcc,	0x7
	popc	0x0EF1,	%g6
	fpadd32	%f12,	%f26,	%f20
	fbl,a	%fcc2,	loop_44
	movle	%icc,	%l0,	%l2
	fmuld8ulx16	%f23,	%f2,	%f6
	movleu	%xcc,	%g5,	%i0
loop_44:
	bge,a,pt	%xcc,	loop_45
	fnor	%f6,	%f28,	%f18
	addc	%g1,	%l3,	%o3
	bl,a	loop_46
loop_45:
	sra	%i1,	%o7,	%l1
	fblg,a	%fcc2,	loop_47
	movle	%icc,	%i5,	%g3
loop_46:
	fbuge	%fcc0,	loop_48
	tge	%icc,	0x1
loop_47:
	fsrc2	%f20,	%f20
	umulcc	%o1,	%i3,	%i7
loop_48:
	movvs	%icc,	%g7,	%o6
	ldub	[%l7 + 0x26],	%o5
	fabss	%f12,	%f8
	movrlez	%l6,	%g2,	%o0
	edge16ln	%i2,	%i6,	%o4
	fbue	%fcc0,	loop_49
	movre	%l4,	0x264,	%i4
	smul	%o2,	0x1BE0,	%l5
	fone	%f10
loop_49:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g4,	%g6,	%l0
	movn	%xcc,	%g5,	%i0
	sdivcc	%g1,	0x05FC,	%l3
	edge8n	%o3,	%l2,	%o7
	udiv	%i1,	0x0283,	%i5
	set	0x4C, %l4
	lduha	[%l7 + %l4] 0x15,	%l1
	fandnot2	%f14,	%f6,	%f12
	fbul,a	%fcc1,	loop_50
	movg	%xcc,	%g3,	%i3
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x80,	%o1
loop_50:
	tvs	%icc,	0x1
	movvs	%xcc,	%g7,	%o6
	xnorcc	%o5,	0x0DC1,	%i7
	smulcc	%l6,	%o0,	%i2
	sll	%i6,	0x15,	%g2
	nop
	setx	loop_51,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%o4,	%i4,	%l4
	fmovsa	%xcc,	%f25,	%f26
	addcc	%o2,	0x0DD5,	%g4
loop_51:
	movrlez	%g6,	%l5,	%l0
	edge16n	%g5,	%i0,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x18,	%g1,	%o3
	tgu	%xcc,	0x2
	stb	%l2,	[%l7 + 0x3C]
	bg,a	%icc,	loop_52
	movne	%xcc,	%o7,	%i1
	stw	%i5,	[%l7 + 0x20]
	movrgz	%g3,	%i3,	%l1
loop_52:
	array16	%g7,	%o1,	%o5
	fmovsn	%xcc,	%f11,	%f23
	andcc	%i7,	%o6,	%o0
	edge8ln	%i2,	%i6,	%g2
	alignaddr	%o4,	%l6,	%i4
	tvs	%icc,	0x3
	fbge,a	%fcc1,	loop_53
	edge16n	%o2,	%g4,	%g6
	tpos	%icc,	0x5
	nop
	setx	loop_54,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_53:
	tgu	%xcc,	0x7
	tcc	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54:
	prefetch	[%l7 + 0x60],	 0x0
	alignaddr	%l5,	%l4,	%g5
	brnz	%i0,	loop_55
	array16	%l3,	%g1,	%o3
	bvs	%icc,	loop_56
	prefetch	[%l7 + 0x4C],	 0x3
loop_55:
	sll	%l0,	%l2,	%i1
	srlx	%i5,	%o7,	%g3
loop_56:
	tvc	%xcc,	0x0
	bg	loop_57
	edge32ln	%l1,	%i3,	%g7
	udivx	%o5,	0x1308,	%i7
	fba	%fcc2,	loop_58
loop_57:
	sra	%o6,	%o0,	%i2
	prefetch	[%l7 + 0x10],	 0x2
	fcmpne32	%f26,	%f30,	%o1
loop_58:
	mulscc	%i6,	0x0779,	%o4
	fbuge,a	%fcc3,	loop_59
	brgz,a	%l6,	loop_60
	movcc	%xcc,	%g2,	%o2
	edge16l	%i4,	%g4,	%g6
loop_59:
	xorcc	%l5,	%g5,	%l4
loop_60:
	nop
	set	0x0C, %i2
	ldsw	[%l7 + %i2],	%i0
	movre	%g1,	%o3,	%l3
	fmovrslz	%l2,	%f17,	%f12
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	tneg	%icc,	0x6
	andcc	%l0,	%o7,	%g3
	add	%l1,	0x1166,	%i3
	fands	%f16,	%f23,	%f7
	tn	%icc,	0x0
	fabsd	%f0,	%f2
	edge16n	%i5,	%o5,	%i7
	mulx	%g7,	0x05E6,	%o0
	fmovdpos	%xcc,	%f26,	%f5
	fpackfix	%f30,	%f31
	umul	%i2,	%o1,	%i6
	bl,a,pn	%icc,	loop_61
	fmovsge	%icc,	%f27,	%f25
	tn	%icc,	0x3
	nop
	setx loop_62, %l0, %l1
	jmpl %l1, %o4
loop_61:
	array8	%o6,	%g2,	%o2
	brz	%l6,	loop_63
	xnor	%g4,	%g6,	%l5
loop_62:
	bcc,a	%icc,	loop_64
	sir	0x0062
loop_63:
	fmovrsgz	%i4,	%f11,	%f24
	fabsd	%f24,	%f0
loop_64:
	andcc	%l4,	0x1BC0,	%g5
	bge	loop_65
	bcc,a	%xcc,	loop_66
	subcc	%i0,	0x1B2E,	%g1
	fmovspos	%icc,	%f18,	%f3
loop_65:
	edge8l	%l3,	%l2,	%i1
loop_66:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fcmpgt32	%f20,	%f8,	%l0
	taddcc	%o3,	%o7,	%g3
	edge16	%l1,	%i5,	%i3
	fabss	%f15,	%f4
	fmovrdgez	%i7,	%f28,	%f24
	ba	loop_67
	fmovdleu	%xcc,	%f10,	%f11
	movcs	%xcc,	%g7,	%o0
	bg,a	%icc,	loop_68
loop_67:
	umulcc	%i2,	0x1647,	%o5
	ldsh	[%l7 + 0x42],	%o1
	std	%f10,	[%l7 + 0x18]
loop_68:
	popc	%i6,	%o4
	add	%o6,	0x1EE6,	%g2
	fbuge,a	%fcc0,	loop_69
	faligndata	%f8,	%f10,	%f4
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l6
loop_69:
	nop
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	call	loop_70
	alignaddrl	%g6,	%o2,	%i4
	pdist	%f22,	%f4,	%f24
	movrlz	%l5,	0x15C,	%g5
loop_70:
	edge8ln	%i0,	%l4,	%g1
	sub	%l3,	%l2,	%l0
	call	loop_71
	fnegd	%f16,	%f20
	andcc	%i1,	0x1F9D,	%o7
	fbo,a	%fcc1,	loop_72
loop_71:
	sethi	0x0BBC,	%o3
	nop
	set	0x3A, %l3
	lduh	[%l7 + %l3],	%g3
	call	loop_73
loop_72:
	orncc	%i5,	0x1F8D,	%i3
	fpack32	%f22,	%f4,	%f10
	movre	%l1,	%g7,	%i7
loop_73:
	tsubcc	%i2,	%o5,	%o1
	tsubcctv	%i6,	%o4,	%o6
	subc	%o0,	0x0372,	%l6
	tpos	%icc,	0x3
	fmovsvc	%icc,	%f2,	%f29
	array8	%g4,	%g2,	%g6
	mulx	%o2,	%l5,	%i4
	fnors	%f31,	%f23,	%f18
	bg,a,pn	%xcc,	loop_74
	udivx	%g5,	0x0B4C,	%i0
	ldsw	[%l7 + 0x7C],	%g1
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x26,	%l4
loop_74:
	tleu	%xcc,	0x6
	and	%l3,	%l2,	%i1
	xnorcc	%o7,	%l0,	%g3
	edge16	%i5,	%o3,	%l1
	nop
	setx	loop_75,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%g7,	0x11CA,	%i3
	sth	%i2,	[%l7 + 0x08]
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x11,	 0x2
loop_75:
	ba,a,pt	%xcc,	loop_76
	andcc	%i7,	%i6,	%o1
	alignaddrl	%o4,	%o0,	%l6
	subcc	%o6,	0x1AE8,	%g4
loop_76:
	tleu	%xcc,	0x2
	orn	%g2,	%o2,	%g6
	tle	%icc,	0x3
	fpsub16s	%f26,	%f9,	%f19
	movle	%xcc,	%l5,	%i4
	sllx	%g5,	%i0,	%l4
	fmovdg	%icc,	%f30,	%f12
	bl,a,pt	%xcc,	loop_77
	andcc	%g1,	0x1D5B,	%l3
	movl	%icc,	%l2,	%o7
	fors	%f22,	%f18,	%f31
loop_77:
	fandnot1s	%f16,	%f1,	%f25
	flush	%l7 + 0x50
	tneg	%xcc,	0x2
	tsubcc	%i1,	%g3,	%i5
	umul	%o3,	%l0,	%l1
	array8	%g7,	%i3,	%i2
	or	%o5,	%i6,	%i7
	movneg	%xcc,	%o1,	%o0
	tg	%icc,	0x4
	xor	%o4,	0x156C,	%l6
	fnor	%f28,	%f18,	%f10
	fexpand	%f24,	%f8
	tsubcc	%o6,	0x1C20,	%g2
	orncc	%o2,	0x0AA3,	%g6
	brgz,a	%l5,	loop_78
	movrlz	%i4,	0x2CC,	%g4
	fmovdle	%xcc,	%f24,	%f4
	or	%i0,	0x1336,	%l4
loop_78:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x1C] %asi,	%g5
	sra	%g1,	0x1D,	%l2
	mova	%xcc,	%l3,	%o7
	movrgz	%g3,	0x00D,	%i5
	ldx	[%l7 + 0x10],	%o3
	nop
	setx	loop_79,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsleu	%xcc,	%f10,	%f12
	std	%i0,	[%l7 + 0x70]
	tcc	%xcc,	0x2
loop_79:
	nop
	set	0x44, %l2
	stha	%l0,	[%l7 + %l2] 0x18
	movvs	%icc,	%g7,	%i3
	srl	%i2,	%o5,	%l1
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movre	%i6,	0x28E,	%o1
	brlez	%o0,	loop_80
	lduh	[%l7 + 0x0E],	%i7
	fbul,a	%fcc1,	loop_81
	mulscc	%l6,	%o4,	%g2
loop_80:
	mova	%icc,	%o6,	%o2
	wr	%g0,	0x04,	%asi
	stwa	%g6,	[%l7 + 0x1C] %asi
loop_81:
	bvs,a	loop_82
	orncc	%i4,	%l5,	%i0
	fsrc2s	%f6,	%f24
	tgu	%xcc,	0x7
loop_82:
	fmovde	%xcc,	%f27,	%f11
	nop
	setx loop_83, %l0, %l1
	jmpl %l1, %l4
	andcc	%g4,	%g5,	%g1
	orn	%l3,	0x0502,	%l2
	bleu,pt	%icc,	loop_84
loop_83:
	fmovsa	%icc,	%f26,	%f0
	fxors	%f8,	%f10,	%f12
	fmul8x16al	%f18,	%f17,	%f12
loop_84:
	fmovdn	%xcc,	%f10,	%f14
	fmovrsgz	%g3,	%f9,	%f27
	orcc	%o7,	%o3,	%i1
	ba,a	loop_85
	ld	[%l7 + 0x54],	%f17
	fmovdcc	%xcc,	%f4,	%f8
	movre	%l0,	0x3C3,	%g7
loop_85:
	xorcc	%i3,	0x1822,	%i2
	movl	%icc,	%i5,	%l1
	edge16ln	%o5,	%o1,	%o0
	fmovdcs	%icc,	%f11,	%f26
	movrlz	%i7,	0x189,	%l6
	lduh	[%l7 + 0x6C],	%o4
	fble,a	%fcc3,	loop_86
	fors	%f7,	%f28,	%f30
	sdiv	%i6,	0x07CE,	%g2
	fmovsge	%xcc,	%f9,	%f17
loop_86:
	fmovdneg	%icc,	%f17,	%f29
	movvs	%xcc,	%o2,	%o6
	fmul8x16	%f23,	%f12,	%f0
	udivx	%g6,	0x0FCB,	%i4
	swap	[%l7 + 0x4C],	%i0
	tsubcc	%l4,	%l5,	%g4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x35] %asi,	%g1
	movrgez	%l3,	0x193,	%l2
	nop
	set	0x60, %g4
	stx	%g3,	[%l7 + %g4]
	fmovsle	%icc,	%f13,	%f27
	movgu	%icc,	%g5,	%o3
	movrlez	%i1,	0x3E9,	%o7
	smulcc	%l0,	0x13B6,	%g7
	bg	%icc,	loop_87
	ble,a	%xcc,	loop_88
	udivx	%i3,	0x10C1,	%i2
	set	0x6E, %g3
	ldsba	[%l7 + %g3] 0x15,	%i5
loop_87:
	or	%l1,	%o5,	%o1
loop_88:
	fble	%fcc2,	loop_89
	xor	%o0,	%i7,	%o4
	edge16l	%l6,	%i6,	%o2
	bg	%icc,	loop_90
loop_89:
	orcc	%g2,	0x0E6A,	%g6
	orncc	%i4,	%i0,	%o6
	fbe	%fcc2,	loop_91
loop_90:
	bshuffle	%f0,	%f18,	%f2
	taddcctv	%l5,	0x133F,	%l4
	ldsw	[%l7 + 0x28],	%g1
loop_91:
	fcmpd	%fcc3,	%f20,	%f2
	taddcc	%g4,	0x1823,	%l2
	tcc	%xcc,	0x1
	bg,a	%xcc,	loop_92
	edge8n	%g3,	%l3,	%g5
	orcc	%o3,	0x17EB,	%i1
	ble,pn	%xcc,	loop_93
loop_92:
	umulcc	%l0,	0x00D0,	%g7
	ld	[%l7 + 0x38],	%f3
	alignaddr	%i3,	%i2,	%o7
loop_93:
	fmovdge	%xcc,	%f25,	%f15
	movge	%xcc,	%i5,	%l1
	xnorcc	%o5,	0x0C24,	%o1
	tge	%xcc,	0x4
	ldsw	[%l7 + 0x10],	%i7
	brgz	%o4,	loop_94
	sll	%o0,	0x1E,	%l6
	fmovda	%icc,	%f22,	%f9
	fpack32	%f16,	%f6,	%f22
loop_94:
	movleu	%xcc,	%o2,	%g2
	movrne	%i6,	%g6,	%i4
	fsrc1s	%f2,	%f16
	fbn,a	%fcc1,	loop_95
	subc	%o6,	0x13C9,	%i0
	set	0x24, %l6
	ldswa	[%l7 + %l6] 0x80,	%l4
loop_95:
	edge8ln	%g1,	%l5,	%g4
	tgu	%xcc,	0x2
	tne	%xcc,	0x7
	edge16	%g3,	%l2,	%g5
	bpos,pn	%xcc,	loop_96
	smul	%l3,	%o3,	%i1
	movne	%xcc,	%g7,	%i3
	mulx	%i2,	%l0,	%i5
loop_96:
	tg	%icc,	0x5
	tg	%xcc,	0x6
	tl	%icc,	0x4
	andcc	%l1,	%o7,	%o5
	orn	%i7,	%o1,	%o4
	sll	%l6,	0x1F,	%o0
	edge16	%o2,	%g2,	%i6
	move	%icc,	%g6,	%i4
	movgu	%xcc,	%o6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%l4,	[%l7 + 0x38]
	fornot1	%f18,	%f4,	%f18
	or	%l5,	%g4,	%g1
	tvc	%icc,	0x2
	fpsub16	%f10,	%f18,	%f22
	fmovdvc	%icc,	%f9,	%f10
	bvs,a	loop_97
	lduh	[%l7 + 0x18],	%l2
	addcc	%g5,	%l3,	%o3
	addccc	%i1,	0x1FF5,	%g3
loop_97:
	addc	%g7,	0x0404,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l0,	%i5,	%i2
	mulx	%o7,	0x05DC,	%l1
	set	0x40, %i6
	stxa	%i7,	[%l7 + %i6] 0x81
	orncc	%o5,	%o1,	%o4
	andcc	%l6,	%o2,	%o0
	fpack32	%f4,	%f16,	%f14
	bpos,a	loop_98
	sir	0x105E
	edge8n	%g2,	%i6,	%g6
	edge16n	%i4,	%i0,	%o6
loop_98:
	bpos,pt	%xcc,	loop_99
	fabss	%f1,	%f22
	sllx	%l5,	%g4,	%g1
	tcs	%xcc,	0x5
loop_99:
	xorcc	%l4,	0x097A,	%l2
	nop
	setx	loop_100,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%l3,	%g5,	%o3
	fandnot2s	%f15,	%f27,	%f10
	sllx	%i1,	0x04,	%g7
loop_100:
	umulcc	%g3,	%l0,	%i3
	tg	%icc,	0x0
	taddcc	%i5,	0x1DB2,	%i2
	taddcc	%o7,	%i7,	%o5
	fmovs	%f15,	%f5
	fcmpgt32	%f6,	%f30,	%l1
	addccc	%o1,	%o4,	%l6
	fnot1s	%f17,	%f5
	set	0x70, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o2
	xnorcc	%o0,	%i6,	%g6
	edge16l	%i4,	%i0,	%g2
	bg	%xcc,	loop_101
	bleu	%icc,	loop_102
	popc	0x00DA,	%l5
	fmovdne	%xcc,	%f7,	%f2
loop_101:
	fmovrdgz	%g4,	%f30,	%f12
loop_102:
	movg	%xcc,	%o6,	%l4
	bleu,a	%xcc,	loop_103
	edge16n	%l2,	%l3,	%g5
	tn	%icc,	0x3
	ta	%xcc,	0x6
loop_103:
	fabsd	%f22,	%f2
	nop
	set	0x30, %g7
	std	%f2,	[%l7 + %g7]
	set	0x3E, %i5
	stha	%g1,	[%l7 + %i5] 0x89
	set	0x4C, %o6
	swapa	[%l7 + %o6] 0x04,	%o3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x0C] %asi,	%g7
	edge16ln	%g3,	%l0,	%i1
	fmovdcc	%xcc,	%f26,	%f21
	ldsh	[%l7 + 0x0C],	%i5
	set	0x0A, %o5
	stba	%i2,	[%l7 + %o5] 0xea
	membar	#Sync
	bge,a,pn	%icc,	loop_104
	fpadd32	%f22,	%f20,	%f18
	taddcc	%i3,	0x0A51,	%o7
	pdist	%f14,	%f22,	%f0
loop_104:
	or	%o5,	0x0516,	%l1
	fones	%f27
	movg	%icc,	%o1,	%i7
	movrgz	%l6,	0x124,	%o4
	tsubcctv	%o2,	0x0D85,	%o0
	movpos	%icc,	%g6,	%i6
	fornot2	%f0,	%f14,	%f20
	srax	%i0,	0x09,	%g2
	set	0x35, %o2
	lduba	[%l7 + %o2] 0x88,	%i4
	prefetch	[%l7 + 0x4C],	 0x3
	te	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_105
	alignaddr	%l5,	%o6,	%g4
	taddcctv	%l4,	%l3,	%l2
	set	0x108, %o4
	ldxa	[%g0 + %o4] 0x21,	%g5
loop_105:
	array32	%g1,	%o3,	%g3
	xor	%l0,	%g7,	%i1
	xor	%i2,	%i3,	%i5
	stx	%o7,	[%l7 + 0x58]
	sdivx	%l1,	0x01D1,	%o5
	array8	%i7,	%l6,	%o4
	sdiv	%o2,	0x0799,	%o0
	brgz,a	%g6,	loop_106
	fnegd	%f8,	%f0
	movrne	%i6,	%o1,	%g2
	fandnot1	%f24,	%f24,	%f12
loop_106:
	fandnot2s	%f18,	%f22,	%f1
	edge8	%i4,	%l5,	%i0
	wr	%g0,	0x80,	%asi
	sta	%f25,	[%l7 + 0x24] %asi
	fpmerge	%f0,	%f10,	%f26
	move	%xcc,	%o6,	%g4
	tg	%icc,	0x1
	fsrc2	%f26,	%f24
	ldd	[%l7 + 0x40],	%l2
	std	%l2,	[%l7 + 0x28]
	fmovrslez	%l4,	%f17,	%f17
	te	%icc,	0x3
	bcs	loop_107
	nop
	setx loop_108, %l0, %l1
	jmpl %l1, %g1
	nop
	setx	loop_109,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcc	%icc,	%f1,	%f2
loop_107:
	bleu,a	%xcc,	loop_110
loop_108:
	ldd	[%l7 + 0x18],	%g4
loop_109:
	bne	loop_111
	movl	%icc,	%o3,	%g3
loop_110:
	brnz,a	%g7,	loop_112
	tl	%icc,	0x4
loop_111:
	movn	%icc,	%l0,	%i1
	sub	%i3,	%i2,	%o7
loop_112:
	sra	%i5,	%l1,	%o5
	te	%xcc,	0x0
	taddcctv	%l6,	0x0412,	%o4
	fmuld8sux16	%f18,	%f1,	%f8
	xorcc	%i7,	0x0663,	%o0
	fmul8ulx16	%f28,	%f20,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f16,	%f2
	bvc,a	%xcc,	loop_113
	fba	%fcc1,	loop_114
	xor	%o2,	%g6,	%i6
	xor	%g2,	0x0BBB,	%o1
loop_113:
	xorcc	%i4,	0x1C77,	%l5
loop_114:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%o6,	[%l7 + 0x48] %asi
	movre	%i0,	0x3DF,	%g4
	movn	%xcc,	%l2,	%l4
	edge32	%g1,	%g5,	%l3
	fmovdl	%xcc,	%f16,	%f11
	udivx	%g3,	0x0F23,	%g7
	sethi	0x0643,	%l0
	fcmps	%fcc0,	%f21,	%f26
	fands	%f9,	%f7,	%f2
	bvs	%xcc,	loop_115
	edge32	%o3,	%i1,	%i2
	nop
	setx	loop_116,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	0x1AD2,	%o7
loop_115:
	te	%icc,	0x4
	srlx	%i3,	%i5,	%l1
loop_116:
	sdivx	%o5,	0x1E65,	%o4
	tpos	%xcc,	0x5
	fnot2s	%f15,	%f28
	sdivcc	%l6,	0x0AAE,	%o0
	fpadd32	%f8,	%f22,	%f28
	nop
	setx	loop_117,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%i7,	%o2,	%g6
	bvc	%icc,	loop_118
	edge32	%g2,	%o1,	%i6
loop_117:
	xnorcc	%l5,	0x0E72,	%i4
	fmovscs	%icc,	%f0,	%f11
loop_118:
	movvs	%xcc,	%i0,	%o6
	movrgz	%l2,	0x209,	%l4
	movvc	%xcc,	%g4,	%g1
	smulcc	%l3,	%g3,	%g5
	fmovrdlez	%g7,	%f22,	%f16
	fzeros	%f12
	mulx	%l0,	%i1,	%o3
	ldx	[%l7 + 0x68],	%o7
	mova	%xcc,	%i2,	%i5
	addcc	%l1,	0x1F1A,	%i3
	tg	%xcc,	0x6
	set	0x68, %l0
	ldxa	[%l7 + %l0] 0x14,	%o4
	addccc	%l6,	%o5,	%i7
	movcc	%xcc,	%o2,	%o0
	movcs	%icc,	%g2,	%g6
	fbue	%fcc0,	loop_119
	edge16l	%o1,	%i6,	%i4
	ldstub	[%l7 + 0x45],	%i0
	tsubcctv	%o6,	0x0348,	%l2
loop_119:
	ta	%icc,	0x3
	alignaddrl	%l4,	%l5,	%g4
	movne	%icc,	%l3,	%g3
	fnands	%f2,	%f8,	%f8
	movne	%icc,	%g5,	%g7
	movge	%icc,	%g1,	%l0
	membar	0x4F
	bne,a	%xcc,	loop_120
	alignaddr	%i1,	%o3,	%i2
	smulcc	%i5,	0x0ABB,	%l1
	bne,pt	%icc,	loop_121
loop_120:
	add	%i3,	%o7,	%l6
	smul	%o5,	%i7,	%o4
	edge32	%o2,	%g2,	%g6
loop_121:
	or	%o1,	0x1D7A,	%i6
	movrne	%i4,	%i0,	%o6
	fmovdvs	%xcc,	%f30,	%f14
	udivx	%l2,	0x1FFF,	%l4
	tn	%icc,	0x4
	sra	%l5,	0x1E,	%g4
	tvs	%xcc,	0x6
	sir	0x120C
	popc	%o0,	%l3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%g3
	umul	%g7,	0x02EB,	%g1
	fbe	%fcc2,	loop_122
	or	%l0,	0x0146,	%i1
	tg	%xcc,	0x2
	edge16n	%g5,	%i2,	%i5
loop_122:
	ldsh	[%l7 + 0x76],	%l1
	fcmple16	%f10,	%f28,	%o3
	call	loop_123
	fcmpeq16	%f6,	%f28,	%o7
	subccc	%l6,	0x1196,	%o5
	xor	%i7,	%o4,	%i3
loop_123:
	sub	%o2,	0x0047,	%g6
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tl	%icc,	0x5
	bge,a	%icc,	loop_124
	sdiv	%o1,	0x0726,	%i6
	swap	[%l7 + 0x70],	%i4
	fmovsvc	%xcc,	%f11,	%f21
loop_124:
	movg	%xcc,	%g2,	%o6
	tne	%xcc,	0x4
	taddcctv	%l2,	0x0438,	%l4
	sra	%i0,	%g4,	%l5
	tsubcc	%l3,	%o0,	%g3
	fcmple16	%f8,	%f26,	%g1
	ldd	[%l7 + 0x40],	%f24
	taddcctv	%l0,	%g7,	%g5
	fsrc1s	%f23,	%f2
	fmovrsne	%i1,	%f4,	%f7
	movle	%icc,	%i2,	%i5
	nop
	set	0x3A, %l1
	ldstub	[%l7 + %l1],	%l1
	movvc	%xcc,	%o7,	%l6
	fmovrdgz	%o3,	%f22,	%f20
	bge,a	%xcc,	loop_125
	fmovrdlez	%i7,	%f2,	%f22
	fmovdle	%icc,	%f19,	%f31
	ldsh	[%l7 + 0x64],	%o4
loop_125:
	fmovrslez	%i3,	%f22,	%f19
	movpos	%icc,	%o2,	%o5
	sll	%o1,	%i6,	%i4
	fcmpne32	%f12,	%f12,	%g6
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movcc	%xcc,	%g2,	%l2
	mulscc	%o6,	0x1436,	%l4
	brnz	%g4,	loop_126
	fmul8ulx16	%f8,	%f20,	%f16
	fmovscc	%icc,	%f31,	%f23
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%l3
loop_126:
	fmuld8sux16	%f2,	%f28,	%f24
	lduh	[%l7 + 0x22],	%o0
	movle	%icc,	%i0,	%g1
	array16	%l0,	%g7,	%g3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x24] %asi,	%g5
	nop
	setx	loop_127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fba,a	%fcc3,	loop_128
	movne	%xcc,	%i1,	%i2
	set	0x3C, %i4
	stwa	%i5,	[%l7 + %i4] 0x0c
loop_127:
	or	%o7,	0x1858,	%l1
loop_128:
	fpadd16	%f18,	%f18,	%f0
	fnot1s	%f8,	%f6
	movg	%icc,	%o3,	%i7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	udiv	%o4,	0x026C,	%i3
	tpos	%icc,	0x2
	srlx	%o5,	0x0A,	%o1
	and	%i6,	0x184C,	%o2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	fands	%f2,	%f15,	%f4
	movg	%icc,	%g6,	%g2
	sra	%i4,	%o6,	%l2
	movne	%xcc,	%g4,	%l4
	ta	%icc,	0x3
	array8	%l5,	%l3,	%o0
	tn	%xcc,	0x7
	fpack32	%f14,	%f28,	%f12
	or	%i0,	%g1,	%l0
	movrlz	%g7,	%g3,	%i1
	orn	%g5,	0x13EE,	%i2
	alignaddr	%i5,	%o7,	%o3
	movne	%xcc,	%l1,	%l6
	mova	%xcc,	%o4,	%i7
	movleu	%xcc,	%o5,	%i3
	tsubcc	%o1,	%i6,	%g6
	nop
	set	0x1C, %g6
	ldsh	[%l7 + %g6],	%g2
	bvc,a,pn	%xcc,	loop_129
	edge8n	%o2,	%o6,	%i4
	edge32ln	%g4,	%l4,	%l5
	ldstub	[%l7 + 0x64],	%l2
loop_129:
	mulx	%l3,	0x0BC9,	%i0
	movpos	%icc,	%o0,	%g1
	fbue,a	%fcc2,	loop_130
	tgu	%icc,	0x1
	ldstub	[%l7 + 0x3F],	%g7
	set	0x74, %i7
	stha	%l0,	[%l7 + %i7] 0x14
loop_130:
	smul	%g3,	%i1,	%i2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x58] %asi,	%i5
	mulscc	%g5,	%o3,	%o7
	tsubcc	%l1,	0x1907,	%o4
	udivx	%i7,	0x1E03,	%l6
	bcs,a	%xcc,	loop_131
	movvs	%icc,	%i3,	%o5
	fbl,a	%fcc0,	loop_132
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_131:
	bl,a	%xcc,	loop_133
	sdivx	%i6,	0x1983,	%g6
loop_132:
	tge	%xcc,	0x5
	alignaddrl	%o1,	%g2,	%o6
loop_133:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	stxa	%o2,	[%l7 + 0x60] %asi
	movleu	%xcc,	%g4,	%l4
	mulscc	%i4,	%l5,	%l2
	fpadd32	%f30,	%f4,	%f14
	fcmped	%fcc2,	%f28,	%f28
	fors	%f25,	%f3,	%f4
	smul	%l3,	%i0,	%o0
	sdivcc	%g1,	0x02E9,	%l0
	fmovd	%f6,	%f0
	fpadd32	%f22,	%f4,	%f2
	srlx	%g3,	%i1,	%g7
	srl	%i5,	0x0F,	%g5
	fmovsge	%xcc,	%f13,	%f0
	srlx	%i2,	%o3,	%l1
	mova	%icc,	%o7,	%o4
	set	0x5B, %l5
	stba	%l6,	[%l7 + %l5] 0xea
	membar	#Sync
	movge	%xcc,	%i7,	%i3
	tn	%xcc,	0x7
	srlx	%o5,	0x1A,	%g6
	udivcc	%o1,	0x00D0,	%i6
	tg	%xcc,	0x4
	movcs	%icc,	%g2,	%o2
	ta	%xcc,	0x1
	fmovsl	%icc,	%f17,	%f9
	tvs	%icc,	0x1
	edge8ln	%o6,	%g4,	%l4
	subccc	%i4,	0x1A39,	%l2
	fornot1	%f18,	%f10,	%f2
	fbge,a	%fcc0,	loop_134
	xor	%l3,	%i0,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l5,	%l0,	%g3
loop_134:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i1,	%g7,	%i5
	edge32l	%g5,	%g1,	%i2
	tgu	%xcc,	0x2
	fble	%fcc1,	loop_135
	movrlz	%o3,	0x17E,	%l1
	fbe	%fcc1,	loop_136
	umulcc	%o7,	%l6,	%i7
loop_135:
	fnegs	%f1,	%f1
	brnz	%o4,	loop_137
loop_136:
	fmovsvs	%xcc,	%f15,	%f28
	udivx	%o5,	0x054E,	%i3
	andncc	%g6,	%i6,	%g2
loop_137:
	fbue	%fcc3,	loop_138
	stbar
	brlez	%o2,	loop_139
	movneg	%xcc,	%o6,	%o1
loop_138:
	movneg	%icc,	%g4,	%l4
	fpadd32	%f10,	%f12,	%f18
loop_139:
	xor	%i4,	%l2,	%i0
	tneg	%icc,	0x1
	bpos,a	%icc,	loop_140
	fmovdn	%xcc,	%f21,	%f8
	bshuffle	%f22,	%f2,	%f28
	pdist	%f0,	%f14,	%f14
loop_140:
	mova	%xcc,	%o0,	%l3
	tcc	%xcc,	0x7
	sub	%l5,	0x1034,	%g3
	movneg	%xcc,	%l0,	%g7
	movvc	%icc,	%i5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	stxa	%g1,	[%l7 + 0x50] %asi
	orn	%g5,	0x11EE,	%o3
	fpackfix	%f22,	%f11
	taddcctv	%i2,	0x0292,	%l1
	and	%l6,	0x1936,	%i7
	and	%o4,	0x1399,	%o5
	orncc	%i3,	%o7,	%g6
	fnegs	%f30,	%f26
	smulcc	%g2,	0x0684,	%i6
	tcc	%xcc,	0x0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o6,	%o2
	fbo	%fcc0,	loop_141
	orcc	%o1,	%g4,	%i4
	tcc	%xcc,	0x0
	fbuge	%fcc0,	loop_142
loop_141:
	xor	%l4,	%l2,	%o0
	fcmple16	%f18,	%f6,	%i0
	fand	%f0,	%f6,	%f10
loop_142:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x49] %asi,	%l3
	fands	%f3,	%f30,	%f4
	xnorcc	%g3,	0x0956,	%l0
	edge16l	%l5,	%g7,	%i5
	edge32	%g1,	%g5,	%o3
	ta	%xcc,	0x1
	fxnors	%f25,	%f15,	%f15
	edge16l	%i1,	%i2,	%l1
	fbul,a	%fcc3,	loop_143
	fpackfix	%f4,	%f18
	tn	%xcc,	0x0
	popc	%l6,	%i7
loop_143:
	movre	%o5,	0x1D7,	%o4
	fmuld8ulx16	%f15,	%f24,	%f4
	srl	%i3,	%o7,	%g6
	fxnor	%f26,	%f26,	%f24
	or	%i6,	%g2,	%o2
	tsubcctv	%o6,	%g4,	%o1
	array16	%i4,	%l2,	%l4
	edge32ln	%i0,	%l3,	%g3
	fnands	%f5,	%f16,	%f31
	set	0x3C, %g5
	lduwa	[%l7 + %g5] 0x15,	%l0
	faligndata	%f10,	%f22,	%f16
	xnor	%l5,	%g7,	%i5
	movcc	%xcc,	%g1,	%g5
	fmovdcc	%icc,	%f14,	%f3
	tl	%icc,	0x0
	stx	%o0,	[%l7 + 0x40]
	brlz	%i1,	loop_144
	andncc	%i2,	%l1,	%o3
	fmovrslez	%l6,	%f2,	%f19
	taddcctv	%o5,	%o4,	%i7
loop_144:
	edge32	%o7,	%g6,	%i3
	ta	%icc,	0x4
	mulscc	%g2,	%o2,	%o6
	subccc	%g4,	0x0DF2,	%o1
	fmovdne	%xcc,	%f4,	%f5
	or	%i6,	%l2,	%i4
	ta	%icc,	0x3
	tl	%xcc,	0x6
	orn	%l4,	%i0,	%l3
	sdivcc	%g3,	0x1846,	%l5
	fmovsl	%xcc,	%f25,	%f16
	smulcc	%l0,	%g7,	%g1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x76] %asi,	%i5
	fba,a	%fcc2,	loop_145
	bpos,pn	%icc,	loop_146
	lduh	[%l7 + 0x62],	%g5
	fmovsgu	%xcc,	%f6,	%f20
loop_145:
	movvc	%xcc,	%i1,	%i2
loop_146:
	fnand	%f10,	%f0,	%f12
	movrne	%o0,	%l1,	%o3
	fmovscs	%xcc,	%f24,	%f13
	movrlz	%o5,	0x129,	%l6
	fbge	%fcc2,	loop_147
	fcmple32	%f6,	%f6,	%o4
	andncc	%i7,	%g6,	%o7
	sdiv	%i3,	0x1EC4,	%g2
loop_147:
	movre	%o2,	%o6,	%o1
	tl	%xcc,	0x4
	movl	%xcc,	%i6,	%g4
	mova	%xcc,	%i4,	%l2
	tle	%icc,	0x1
	mulscc	%l4,	%i0,	%l3
	movle	%icc,	%g3,	%l0
	edge32ln	%g7,	%g1,	%l5
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x18,	%i5
	udiv	%g5,	0x0548,	%i1
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x5C] %asi,	%o0
	movcs	%icc,	%l1,	%i2
	fmovrdgez	%o3,	%f4,	%f14
	sethi	0x1D76,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o4,	%i7
	srl	%o5,	%g6,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%g2,	%i3
	fbl,a	%fcc1,	loop_148
	smulcc	%o2,	%o6,	%i6
	fnot2	%f10,	%f18
	edge32	%g4,	%i4,	%o1
loop_148:
	mulscc	%l4,	%l2,	%l3
	fbge,a	%fcc1,	loop_149
	fmuld8sux16	%f9,	%f31,	%f10
	set	0x58, %o1
	sta	%f14,	[%l7 + %o1] 0x14
loop_149:
	tge	%xcc,	0x1
	bcc,a,pn	%xcc,	loop_150
	movn	%icc,	%i0,	%l0
	fone	%f22
	edge32l	%g3,	%g7,	%g1
loop_150:
	movgu	%xcc,	%l5,	%g5
	subc	%i1,	0x1FB4,	%i5
	brgz,a	%o0,	loop_151
	sdivcc	%i2,	0x1C11,	%l1
	movg	%icc,	%l6,	%o4
	edge16n	%i7,	%o5,	%g6
loop_151:
	te	%icc,	0x3
	movne	%icc,	%o7,	%g2
	brnz,a	%o3,	loop_152
	subc	%i3,	%o2,	%o6
	umul	%g4,	%i4,	%o1
	tgu	%icc,	0x1
loop_152:
	udiv	%l4,	0x12B5,	%l2
	fmul8sux16	%f28,	%f26,	%f22
	ld	[%l7 + 0x68],	%f25
	tleu	%xcc,	0x7
	fbge	%fcc3,	loop_153
	movleu	%icc,	%i6,	%l3
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l0
loop_153:
	movrlz	%g3,	0x35E,	%g7
	movvc	%icc,	%g1,	%i0
	subc	%l5,	0x0005,	%g5
	popc	0x1AEB,	%i5
	brlez	%i1,	loop_154
	flush	%l7 + 0x10
	fcmpgt32	%f0,	%f10,	%o0
	srlx	%i2,	0x1B,	%l1
loop_154:
	fbug,a	%fcc1,	loop_155
	fmovrdgz	%o4,	%f16,	%f26
	edge16	%i7,	%o5,	%l6
	movrne	%o7,	0x25A,	%g2
loop_155:
	movrne	%o3,	%g6,	%o2
	orn	%i3,	0x1F70,	%g4
	std	%o6,	[%l7 + 0x50]
	edge32	%i4,	%l4,	%o1
	andncc	%i6,	%l3,	%l0
	addc	%g3,	%g7,	%l2
	movcc	%xcc,	%g1,	%i0
	movrgez	%g5,	%i5,	%i1
	edge8l	%o0,	%i2,	%l5
	membar	0x50
	orn	%l1,	%o4,	%o5
	srl	%l6,	0x1F,	%i7
	movgu	%icc,	%g2,	%o7
	movn	%icc,	%g6,	%o2
	umul	%i3,	0x06EF,	%g4
	movvs	%xcc,	%o6,	%o3
	te	%xcc,	0x6
	fmovdpos	%icc,	%f12,	%f6
	mulscc	%i4,	%o1,	%i6
	tne	%icc,	0x2
	fmovsn	%icc,	%f26,	%f10
	subc	%l4,	0x0DD3,	%l3
	ta	%icc,	0x7
	srax	%l0,	0x03,	%g3
	edge8ln	%l2,	%g1,	%i0
	mova	%xcc,	%g7,	%i5
	or	%i1,	%g5,	%i2
	fmovrse	%o0,	%f3,	%f2
	movrgz	%l1,	%o4,	%o5
	wr	%g0,	0x22,	%asi
	stda	%l4,	[%l7 + 0x18] %asi
	membar	#Sync
	for	%f26,	%f8,	%f0
	brlz,a	%i7,	loop_156
	edge32	%g2,	%o7,	%g6
	smul	%l6,	%o2,	%i3
	sub	%g4,	0x0AAB,	%o6
loop_156:
	fbge	%fcc0,	loop_157
	tg	%icc,	0x0
	tcs	%xcc,	0x5
	fpadd16s	%f12,	%f21,	%f4
loop_157:
	tsubcctv	%i4,	0x05B3,	%o1
	fors	%f25,	%f12,	%f24
	udiv	%i6,	0x1953,	%o3
	fmovdl	%xcc,	%f7,	%f25
	bcs,a,pt	%xcc,	loop_158
	movvs	%xcc,	%l4,	%l0
	tvc	%xcc,	0x1
	movrgz	%l3,	%g3,	%g1
loop_158:
	ldsw	[%l7 + 0x1C],	%l2
	edge8ln	%g7,	%i0,	%i1
	andn	%g5,	%i5,	%o0
	xorcc	%i2,	0x1E58,	%o4
	movleu	%icc,	%l1,	%o5
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	andn	%l5,	0x045F,	%g2
	bn,pt	%xcc,	loop_159
	movne	%icc,	%i7,	%o7
	fblg	%fcc1,	loop_160
	mova	%icc,	%l6,	%g6
loop_159:
	xnor	%i3,	%o2,	%o6
	popc	%i4,	%g4
loop_160:
	xnorcc	%o1,	%i6,	%o3
	addc	%l4,	%l0,	%g3
	udivx	%g1,	0x0F71,	%l3
	movgu	%xcc,	%g7,	%i0
	fbe	%fcc2,	loop_161
	add	%l2,	0x0161,	%g5
	tg	%icc,	0x3
	movcs	%icc,	%i1,	%i5
loop_161:
	array32	%i2,	%o4,	%o0
	std	%o4,	[%l7 + 0x68]
	fmuld8sux16	%f26,	%f0,	%f4
	fbug	%fcc3,	loop_162
	brnz	%l1,	loop_163
	ldd	[%l7 + 0x20],	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l5
loop_162:
	bne,pt	%xcc,	loop_164
loop_163:
	addccc	%l6,	0x0FA0,	%g6
	fbu	%fcc0,	loop_165
	fbue,a	%fcc1,	loop_166
loop_164:
	bne,pn	%xcc,	loop_167
	ta	%icc,	0x0
loop_165:
	call	loop_168
loop_166:
	srl	%i3,	0x14,	%o2
loop_167:
	brgez,a	%o6,	loop_169
	fcmple32	%f4,	%f2,	%o7
loop_168:
	fmovdge	%xcc,	%f22,	%f27
	movrgez	%i4,	%g4,	%o1
loop_169:
	fnors	%f8,	%f23,	%f0
	taddcc	%i6,	0x0CCB,	%o3
	fones	%f24
	fmovda	%icc,	%f30,	%f1
	fpsub16s	%f31,	%f18,	%f26
	movrlz	%l0,	%l4,	%g3
	bl,a	%xcc,	loop_170
	edge16l	%l3,	%g7,	%i0
	movvc	%xcc,	%g1,	%l2
	array32	%g5,	%i5,	%i2
loop_170:
	tvc	%xcc,	0x2
	fbg	%fcc1,	loop_171
	movgu	%xcc,	%o4,	%o0
	sethi	0x13BE,	%o5
	udivx	%l1,	0x0DB2,	%g2
loop_171:
	lduh	[%l7 + 0x12],	%i7
	move	%icc,	%l5,	%i1
	array16	%g6,	%l6,	%o2
	tgu	%xcc,	0x0
	edge32n	%o6,	%o7,	%i3
	xnor	%i4,	%o1,	%i6
	movle	%icc,	%o3,	%g4
	taddcc	%l0,	%l4,	%g3
	bl,a	%icc,	loop_172
	fmovspos	%icc,	%f2,	%f26
	tg	%xcc,	0x4
	sub	%g7,	0x0BD3,	%l3
loop_172:
	movl	%xcc,	%i0,	%g1
	fpmerge	%f17,	%f15,	%f14
	movvc	%xcc,	%g5,	%l2
	sra	%i5,	%i2,	%o4
	fmul8x16al	%f11,	%f28,	%f2
	subc	%o0,	0x007E,	%l1
	set	0x20, %i0
	ldxa	[%g0 + %i0] 0x20,	%o5
	fmovda	%icc,	%f14,	%f8
	add	%i7,	0x1DFC,	%g2
	array16	%l5,	%g6,	%i1
	edge32n	%o2,	%l6,	%o7
	set	0x6E, %i1
	stha	%i3,	[%l7 + %i1] 0x2f
	membar	#Sync
	addc	%i4,	0x09E2,	%o6
	array32	%i6,	%o3,	%o1
	tvs	%xcc,	0x0
	tg	%xcc,	0x6
	te	%xcc,	0x2
	fmul8x16au	%f14,	%f28,	%f22
	movrne	%l0,	0x163,	%l4
	xnorcc	%g3,	%g7,	%g4
	xorcc	%l3,	0x1123,	%i0
	set	0x26, %o7
	ldstuba	[%l7 + %o7] 0x11,	%g1
	brlez,a	%l2,	loop_173
	swap	[%l7 + 0x30],	%i5
	movgu	%xcc,	%g5,	%i2
	fpsub32s	%f30,	%f22,	%f27
loop_173:
	fxnor	%f12,	%f4,	%f20
	bn,a	loop_174
	edge8	%o0,	%o4,	%l1
	movpos	%xcc,	%o5,	%i7
	nop
	setx loop_175, %l0, %l1
	jmpl %l1, %g2
loop_174:
	array32	%g6,	%i1,	%l5
	sub	%l6,	0x0A52,	%o7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x10] %asi,	%o2
loop_175:
	bn,pt	%xcc,	loop_176
	tcs	%xcc,	0x0
	fmul8x16au	%f30,	%f18,	%f20
	ldsb	[%l7 + 0x50],	%i4
loop_176:
	fxnors	%f24,	%f27,	%f12
	brz	%o6,	loop_177
	fpadd32	%f12,	%f14,	%f20
	tcs	%xcc,	0x1
	sra	%i6,	0x07,	%o3
loop_177:
	fbe,a	%fcc2,	loop_178
	umulcc	%o1,	0x0AF3,	%l0
	fmovdcc	%icc,	%f31,	%f2
	movne	%xcc,	%l4,	%i3
loop_178:
	nop
	set	0x68, %l4
	swapa	[%l7 + %l4] 0x10,	%g7
	movre	%g3,	0x28B,	%g4
	fbul	%fcc1,	loop_179
	fpack32	%f24,	%f18,	%f20
	movgu	%icc,	%l3,	%g1
	movre	%i0,	%i5,	%g5
loop_179:
	fmovsvc	%icc,	%f3,	%f28
	te	%xcc,	0x4
	fpadd32	%f0,	%f12,	%f2
	andn	%l2,	%i2,	%o0
	edge16l	%l1,	%o5,	%o4
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%g2
	ldx	[%l7 + 0x08],	%i7
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%i1
	srl	%g6,	0x16,	%l5
	srax	%o7,	0x1F,	%o2
	brnz,a	%l6,	loop_180
	movrne	%o6,	%i4,	%o3
	fxor	%f24,	%f22,	%f8
	fmul8x16au	%f0,	%f11,	%f8
loop_180:
	edge32ln	%o1,	%i6,	%l0
	fmovspos	%xcc,	%f7,	%f14
	wr	%g0,	0x11,	%asi
	sta	%f15,	[%l7 + 0x2C] %asi
	sir	0x073C
	edge32n	%l4,	%i3,	%g3
	andncc	%g4,	%g7,	%g1
	ldsw	[%l7 + 0x68],	%l3
	fmovde	%xcc,	%f7,	%f28
	wr	%g0,	0x23,	%asi
	stba	%i5,	[%l7 + 0x12] %asi
	membar	#Sync
	sllx	%i0,	0x0A,	%g5
	fmovdge	%icc,	%f2,	%f18
	prefetch	[%l7 + 0x68],	 0x2
	movle	%xcc,	%l2,	%o0
	fmovsvc	%icc,	%f9,	%f12
	bl,pt	%xcc,	loop_181
	sub	%i2,	0x1B88,	%o5
	move	%icc,	%o4,	%g2
	xorcc	%i7,	0x0ACE,	%l1
loop_181:
	fmovs	%f28,	%f7
	edge16ln	%g6,	%l5,	%i1
	bl	loop_182
	edge32ln	%o2,	%o7,	%l6
	fbg	%fcc0,	loop_183
	orncc	%o6,	%i4,	%o3
loop_182:
	brgz	%o1,	loop_184
	movleu	%icc,	%l0,	%l4
loop_183:
	movl	%xcc,	%i6,	%g3
	fmul8sux16	%f12,	%f30,	%f24
loop_184:
	srax	%g4,	0x09,	%i3
	membar	0x24
	fmovrdlez	%g7,	%f8,	%f16
	movcs	%icc,	%l3,	%g1
	fnot2	%f24,	%f24
	tl	%icc,	0x6
	tge	%icc,	0x6
	movrgz	%i0,	%g5,	%l2
	edge8	%o0,	%i5,	%o5
	fmovrdlz	%i2,	%f0,	%f14
	addc	%g2,	0x1CEA,	%i7
	movge	%xcc,	%o4,	%g6
	ldsw	[%l7 + 0x24],	%l1
	orn	%l5,	%i1,	%o2
	stb	%o7,	[%l7 + 0x37]
	sdivx	%l6,	0x14F5,	%o6
	umul	%o3,	0x1597,	%o1
	taddcctv	%i4,	%l0,	%i6
	nop
	setx	loop_185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%l4,	%g3
	smul	%g4,	%i3,	%g7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%g1
loop_185:
	brlz,a	%l3,	loop_186
	fsrc2s	%f13,	%f24
	prefetch	[%l7 + 0x24],	 0x2
	movleu	%xcc,	%g5,	%l2
loop_186:
	fbne,a	%fcc0,	loop_187
	edge8	%i0,	%o0,	%i5
	set	0x0C, %i2
	ldsba	[%l7 + %i2] 0x11,	%o5
loop_187:
	edge8l	%g2,	%i7,	%o4
	fmovsg	%icc,	%f0,	%f8
	tpos	%xcc,	0x1
	movle	%icc,	%g6,	%l1
	edge8	%i2,	%l5,	%o2
	set	0x28, %g1
	ldswa	[%l7 + %g1] 0x19,	%o7
	ta	%icc,	0x4
	fbuge,a	%fcc0,	loop_188
	addc	%i1,	%l6,	%o3
	fmovsge	%xcc,	%f20,	%f29
	edge32	%o1,	%o6,	%i4
loop_188:
	movrgez	%l0,	0x0D5,	%i6
	array8	%g3,	%l4,	%g4
	edge16ln	%g7,	%i3,	%l3
	tsubcctv	%g5,	%l2,	%i0
	fbne	%fcc2,	loop_189
	and	%o0,	0x19BB,	%i5
	sll	%o5,	0x17,	%g1
	flush	%l7 + 0x2C
loop_189:
	fmovde	%xcc,	%f15,	%f3
	fmovde	%icc,	%f12,	%f11
	fmovrdgz	%g2,	%f0,	%f24
	xorcc	%i7,	0x1E6C,	%o4
	addccc	%g6,	0x0AF2,	%l1
	sub	%l5,	0x11AD,	%i2
	ta	%icc,	0x3
	edge8	%o2,	%i1,	%l6
	taddcc	%o7,	%o1,	%o6
	movpos	%icc,	%i4,	%o3
	fcmpne16	%f24,	%f24,	%i6
	ldub	[%l7 + 0x54],	%g3
	ldstub	[%l7 + 0x0E],	%l4
	fnors	%f27,	%f19,	%f15
	edge16	%l0,	%g7,	%i3
	fabss	%f22,	%f21
	membar	0x5A
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g4,	0x0DFF,	%g5
	movg	%xcc,	%l2,	%l3
	flush	%l7 + 0x44
	wr	%g0,	0xeb,	%asi
	stha	%o0,	[%l7 + 0x60] %asi
	membar	#Sync
	fpack16	%f0,	%f18
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
	taddcctv	%i0,	%i5,	%g1
	fmovdleu	%xcc,	%f18,	%f5
	stx	%o5,	[%l7 + 0x28]
loop_190:
	orncc	%i7,	%o4,	%g2
	ta	%icc,	0x5
	movge	%icc,	%g6,	%l5
	wr	%g0,	0xe3,	%asi
	stwa	%l1,	[%l7 + 0x44] %asi
	membar	#Sync
	membar	0x5C
	tgu	%xcc,	0x6
	movvc	%xcc,	%i2,	%o2
	fzero	%f10
	tcc	%xcc,	0x7
	addcc	%i1,	%o7,	%o1
	tn	%xcc,	0x0
	edge16n	%o6,	%l6,	%o3
	flush	%l7 + 0x7C
	stw	%i6,	[%l7 + 0x1C]
	stw	%i4,	[%l7 + 0x74]
	fzero	%f0
	tvs	%xcc,	0x7
	tneg	%xcc,	0x7
	udivx	%l4,	0x1164,	%g3
	fmovdneg	%icc,	%f5,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f31,	%f31
	fbul	%fcc1,	loop_191
	alignaddrl	%g7,	%i3,	%g4
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0x1
loop_191:
	fcmpne32	%f18,	%f2,	%l0
	stbar
	flush	%l7 + 0x20
	movleu	%icc,	%l2,	%o0
	movvs	%xcc,	%l3,	%i0
	fnot1	%f4,	%f8
	ldsh	[%l7 + 0x66],	%g1
	movvs	%icc,	%o5,	%i7
	sdiv	%i5,	0x0694,	%g2
	edge8n	%o4,	%g6,	%l1
	sllx	%i2,	%l5,	%o2
	xorcc	%i1,	0x15D0,	%o7
	fnot1	%f10,	%f26
	nop
	set	0x30, %l2
	ldsh	[%l7 + %l2],	%o1
	fands	%f24,	%f19,	%f16
	ldx	[%l7 + 0x40],	%o6
	tvc	%xcc,	0x4
	sll	%o3,	0x19,	%l6
	or	%i4,	0x09D5,	%i6
	bl	%icc,	loop_192
	te	%xcc,	0x3
	edge32	%g3,	%g7,	%i3
	fmul8ulx16	%f20,	%f20,	%f22
loop_192:
	bne,pt	%xcc,	loop_193
	tsubcc	%g4,	%g5,	%l0
	or	%l4,	0x1F83,	%l2
	edge32ln	%o0,	%l3,	%i0
loop_193:
	and	%o5,	0x187D,	%i7
	sdivx	%i5,	0x1C2C,	%g2
	movcs	%icc,	%g1,	%g6
	tleu	%xcc,	0x7
	umul	%o4,	%i2,	%l5
	prefetch	[%l7 + 0x08],	 0x1
	fsrc2	%f0,	%f8
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%o2
	fxnors	%f28,	%f21,	%f21
	edge8n	%l1,	%o7,	%o1
	popc	0x02DE,	%i1
	edge8n	%o6,	%l6,	%o3
	smul	%i4,	%i6,	%g7
	smulcc	%g3,	0x070E,	%g4
	faligndata	%f18,	%f22,	%f14
	fbue	%fcc2,	loop_194
	fnot1s	%f27,	%f27
	movle	%xcc,	%i3,	%g5
	fornot2	%f16,	%f26,	%f6
loop_194:
	fcmpgt16	%f16,	%f0,	%l0
	bshuffle	%f10,	%f4,	%f0
	nop
	set	0x0B, %l3
	stb	%l2,	[%l7 + %l3]
	andn	%l4,	%o0,	%l3
	sdivx	%o5,	0x071C,	%i0
	sll	%i5,	%i7,	%g2
	movcs	%xcc,	%g1,	%g6
	tsubcc	%o4,	%l5,	%o2
	orn	%l1,	0x0563,	%o7
	set	0x50, %g4
	ldxa	[%l7 + %g4] 0x19,	%o1
	bvs,pn	%xcc,	loop_195
	te	%icc,	0x0
	tle	%icc,	0x7
	srlx	%i2,	0x15,	%i1
loop_195:
	fpadd32s	%f14,	%f19,	%f1
	and	%o6,	%o3,	%i4
	movrlz	%i6,	%g7,	%g3
	set	0x5C, %g3
	ldswa	[%l7 + %g3] 0x10,	%g4
	fsrc1	%f18,	%f10
	tvs	%icc,	0x7
	fba,a	%fcc0,	loop_196
	fors	%f14,	%f22,	%f9
	tcc	%xcc,	0x4
	smul	%l6,	%g5,	%i3
loop_196:
	nop
	set	0x18, %i6
	stwa	%l0,	[%l7 + %i6] 0x19
	bge,pt	%xcc,	loop_197
	fsrc2s	%f12,	%f0
	tvs	%icc,	0x6
	tleu	%xcc,	0x7
loop_197:
	taddcctv	%l4,	0x1D45,	%o0
	andn	%l3,	0x1DA4,	%o5
	movn	%xcc,	%l2,	%i5
	bshuffle	%f0,	%f18,	%f26
	movneg	%icc,	%i0,	%i7
	mulscc	%g2,	%g6,	%o4
	movrlz	%l5,	%g1,	%o2
	movrlz	%o7,	0x21C,	%o1
	orncc	%i2,	%i1,	%o6
	edge16l	%o3,	%i4,	%l1
	edge8n	%g7,	%i6,	%g3
	fcmpgt32	%f4,	%f24,	%l6
	fbne,a	%fcc0,	loop_198
	and	%g5,	%g4,	%i3
	mulscc	%l4,	%o0,	%l0
	set	0x7E, %l6
	lduba	[%l7 + %l6] 0x89,	%l3
loop_198:
	subc	%o5,	0x192B,	%i5
	fbuge,a	%fcc1,	loop_199
	mulx	%i0,	0x19C3,	%l2
	srl	%i7,	0x1D,	%g2
	lduw	[%l7 + 0x0C],	%g6
loop_199:
	andn	%l5,	0x1290,	%o4
	fcmpes	%fcc2,	%f18,	%f17
	orncc	%o2,	0x156E,	%g1
	ta	%xcc,	0x2
	taddcc	%o7,	%o1,	%i1
	fcmple32	%f26,	%f14,	%i2
	fmovrdgz	%o6,	%f0,	%f10
	sethi	0x1730,	%i4
	movre	%l1,	0x08B,	%o3
	tge	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	stwa	%g7,	[%l7 + 0x48] %asi
	edge32n	%g3,	%i6,	%l6
	fmovrsgz	%g4,	%f8,	%f2
	smulcc	%g5,	%i3,	%l4
	edge32	%o0,	%l3,	%o5
	fbne	%fcc1,	loop_200
	fmovsvs	%icc,	%f23,	%f9
	udiv	%i5,	0x1445,	%l0
	addcc	%i0,	0x0413,	%i7
loop_200:
	fbe	%fcc0,	loop_201
	ldx	[%l7 + 0x78],	%l2
	fbo	%fcc0,	loop_202
	movrlez	%g2,	0x02F,	%g6
loop_201:
	movl	%xcc,	%o4,	%l5
	bshuffle	%f12,	%f28,	%f0
loop_202:
	fmovrsne	%o2,	%f0,	%f15
	sll	%o7,	%o1,	%g1
	brlez,a	%i2,	loop_203
	fmovdneg	%icc,	%f6,	%f9
	edge16	%o6,	%i4,	%i1
	brnz,a	%l1,	loop_204
loop_203:
	movleu	%xcc,	%o3,	%g3
	tpos	%icc,	0x7
	fornot1	%f2,	%f24,	%f4
loop_204:
	fxor	%f12,	%f4,	%f2
	pdist	%f10,	%f24,	%f14
	tleu	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x3C, %g2
	stwa	%g7,	[%l7 + %g2] 0x88
	xor	%l6,	%g4,	%g5
	te	%xcc,	0x6
	alignaddr	%i3,	%l4,	%i6
	fexpand	%f11,	%f4
	bleu,a	%xcc,	loop_205
	orncc	%o0,	0x1B0D,	%l3
	alignaddrl	%i5,	%o5,	%l0
	movcc	%icc,	%i7,	%l2
loop_205:
	bvs,a	%icc,	loop_206
	tge	%icc,	0x2
	umulcc	%i0,	0x1A4F,	%g6
	bpos	loop_207
loop_206:
	mova	%xcc,	%g2,	%o4
	edge32l	%l5,	%o7,	%o1
	membar	0x79
loop_207:
	umul	%o2,	%g1,	%i2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x20] %asi,	%f1
	fbl	%fcc0,	loop_208
	tcs	%icc,	0x6
	movle	%icc,	%i4,	%i1
	sub	%o6,	0x0D36,	%l1
loop_208:
	bcs,a	loop_209
	movneg	%xcc,	%o3,	%g7
	stb	%g3,	[%l7 + 0x13]
	swap	[%l7 + 0x70],	%g4
loop_209:
	addc	%l6,	0x1B79,	%g5
	tl	%xcc,	0x0
	fmul8x16au	%f5,	%f15,	%f18
	fmovsne	%icc,	%f15,	%f10
	pdist	%f2,	%f8,	%f16
	tgu	%xcc,	0x1
	nop
	set	0x66, %i5
	stb	%i3,	[%l7 + %i5]
	alignaddrl	%l4,	%i6,	%o0
	tle	%xcc,	0x2
	edge32l	%l3,	%o5,	%l0
	sir	0x17D4
	edge32n	%i7,	%i5,	%l2
	fbe	%fcc0,	loop_210
	brgz,a	%i0,	loop_211
	orncc	%g2,	0x0E8A,	%g6
	fmovse	%xcc,	%f25,	%f1
loop_210:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f29,	[%l7 + 0x5C] %asi
loop_211:
	fmovd	%f6,	%f16
	fnot1s	%f5,	%f31
	bn,pn	%icc,	loop_212
	movneg	%icc,	%o4,	%o7
	fpadd32	%f2,	%f8,	%f22
	brgz,a	%l5,	loop_213
loop_212:
	array8	%o2,	%o1,	%g1
	bpos,a	loop_214
	edge8l	%i2,	%i4,	%o6
loop_213:
	movrgez	%l1,	%i1,	%o3
	array16	%g7,	%g4,	%l6
loop_214:
	movvc	%icc,	%g5,	%i3
	sll	%l4,	0x1B,	%i6
	bge,a,pt	%icc,	loop_215
	fpsub32	%f14,	%f18,	%f20
	sdivcc	%o0,	0x020E,	%g3
	xor	%o5,	0x1438,	%l3
loop_215:
	umulcc	%l0,	0x0212,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f30,	%f21
	tl	%xcc,	0x7
	fbn	%fcc2,	loop_216
	edge32n	%i5,	%i0,	%l2
	tneg	%icc,	0x4
	movrlez	%g2,	0x03F,	%g6
loop_216:
	fbne,a	%fcc0,	loop_217
	srl	%o4,	0x18,	%l5
	fmovrsne	%o7,	%f0,	%f7
	or	%o2,	%g1,	%i2
loop_217:
	movvc	%xcc,	%i4,	%o1
	stbar
	smul	%l1,	0x00E0,	%i1
	bvc,pt	%xcc,	loop_218
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o3,	%o6,	%g7
	fexpand	%f16,	%f20
loop_218:
	ldub	[%l7 + 0x7E],	%g4
	bvc,a,pn	%icc,	loop_219
	fmul8x16au	%f30,	%f8,	%f16
	andn	%g5,	%i3,	%l4
	bvc,pn	%icc,	loop_220
loop_219:
	fbug,a	%fcc1,	loop_221
	sdivx	%l6,	0x029A,	%o0
	sir	0x1EEC
loop_220:
	fbuge,a	%fcc3,	loop_222
loop_221:
	sdiv	%g3,	0x1C9B,	%o5
	edge32l	%l3,	%i6,	%l0
	tneg	%xcc,	0x4
loop_222:
	addcc	%i7,	%i0,	%i5
	fzeros	%f26
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%l2
	srax	%g2,	0x08,	%o4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l5
	set	0x59, %g7
	ldsba	[%l7 + %g7] 0x15,	%g6
	srl	%o2,	0x0A,	%o7
	fmovsneg	%xcc,	%f22,	%f15
	fbn,a	%fcc1,	loop_223
	addccc	%i2,	0x0937,	%i4
	udiv	%o1,	0x104B,	%l1
	array8	%g1,	%i1,	%o3
loop_223:
	and	%g7,	0x1401,	%g4
	tle	%xcc,	0x0
	fbul,a	%fcc2,	loop_224
	sdiv	%g5,	0x1039,	%o6
	set	0x40, %o5
	lda	[%l7 + %o5] 0x10,	%f7
loop_224:
	tpos	%icc,	0x7
	fpadd32s	%f25,	%f4,	%f16
	brlez,a	%i3,	loop_225
	fmovsne	%icc,	%f24,	%f0
	fsrc2s	%f22,	%f27
	wr	%g0,	0x18,	%asi
	sta	%f10,	[%l7 + 0x74] %asi
loop_225:
	stx	%l4,	[%l7 + 0x58]
	edge32	%o0,	%l6,	%o5
	ldub	[%l7 + 0x6B],	%g3
	xorcc	%i6,	0x07BB,	%l0
	tsubcctv	%i7,	0x1198,	%l3
	subcc	%i0,	%i5,	%l2
	edge32ln	%o4,	%g2,	%g6
	fmovrsne	%l5,	%f9,	%f28
	tsubcctv	%o7,	0x0945,	%o2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%i2
	fexpand	%f31,	%f20
	bl	%icc,	loop_226
	taddcctv	%o1,	%l1,	%g1
	te	%xcc,	0x6
	edge32n	%o3,	%i1,	%g4
loop_226:
	fands	%f26,	%f28,	%f27
	alignaddrl	%g5,	%g7,	%o6
	array8	%i3,	%l4,	%l6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%o0
	fmovspos	%icc,	%f9,	%f10
	stw	%g3,	[%l7 + 0x64]
	movle	%xcc,	%i6,	%l0
	stw	%o5,	[%l7 + 0x4C]
	movvs	%icc,	%l3,	%i7
	edge8	%i0,	%l2,	%o4
	movrlez	%g2,	%g6,	%l5
	ld	[%l7 + 0x4C],	%f12
	movrgez	%i5,	0x3C7,	%o7
	nop
	setx	loop_227,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%icc,	%o2,	%i4
	fcmpes	%fcc0,	%f20,	%f9
	xnor	%i2,	%l1,	%o1
loop_227:
	ta	%icc,	0x6
	movvc	%icc,	%g1,	%o3
	smul	%g4,	%g5,	%i1
	movg	%icc,	%g7,	%o6
	movle	%xcc,	%i3,	%l4
	subcc	%l6,	0x0E96,	%g3
	sub	%i6,	%o0,	%l0
	fbn	%fcc3,	loop_228
	srlx	%l3,	0x1B,	%i7
	addccc	%o5,	0x05CD,	%l2
	fbul,a	%fcc1,	loop_229
loop_228:
	brnz	%o4,	loop_230
	fbu,a	%fcc1,	loop_231
	movrgz	%g2,	0x1BA,	%g6
loop_229:
	fpadd16s	%f16,	%f26,	%f17
loop_230:
	nop
	setx	loop_232,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_231:
	udivcc	%i0,	0x1E9D,	%l5
	umul	%o7,	%i5,	%i4
	set	0x48, %o2
	sta	%f7,	[%l7 + %o2] 0x18
loop_232:
	movg	%xcc,	%o2,	%l1
	movg	%icc,	%o1,	%i2
	tcs	%xcc,	0x4
	fcmple16	%f2,	%f4,	%o3
	tne	%xcc,	0x2
	tvc	%icc,	0x7
	edge32l	%g1,	%g4,	%i1
	tsubcc	%g5,	0x0CFE,	%o6
	wr	%g0,	0x10,	%asi
	stha	%i3,	[%l7 + 0x4C] %asi
	alignaddr	%g7,	%l6,	%g3
	srax	%l4,	0x0B,	%i6
	siam	0x7
	bpos,pn	%xcc,	loop_233
	smul	%l0,	0x0D47,	%o0
	addcc	%i7,	%o5,	%l3
	movl	%xcc,	%o4,	%g2
loop_233:
	fnot1s	%f16,	%f17
	tvc	%xcc,	0x5
	edge16	%l2,	%i0,	%g6
	sdiv	%l5,	0x1345,	%i5
	fbue,a	%fcc0,	loop_234
	alignaddr	%i4,	%o2,	%o7
	movrne	%o1,	0x11E,	%i2
	std	%f12,	[%l7 + 0x38]
loop_234:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l1,	0x0584,	%o3
	movpos	%xcc,	%g4,	%g1
	xor	%i1,	0x1091,	%o6
	fpsub16	%f16,	%f12,	%f2
	ta	%xcc,	0x5
	add	%i3,	0x1C35,	%g7
	fone	%f0
	sir	0x0E38
	movrlz	%g5,	%l6,	%l4
	ldx	[%l7 + 0x30],	%g3
	movvc	%xcc,	%i6,	%o0
	movle	%xcc,	%l0,	%i7
	fmovdpos	%icc,	%f15,	%f9
	tneg	%icc,	0x2
	sdivcc	%l3,	0x0A3E,	%o4
	ldd	[%l7 + 0x30],	%f28
	movvs	%xcc,	%g2,	%l2
	tsubcctv	%i0,	%o5,	%g6
	andncc	%i5,	%i4,	%l5
	fmovsg	%xcc,	%f15,	%f12
	ldsb	[%l7 + 0x31],	%o2
	fzeros	%f9
	fmuld8ulx16	%f18,	%f3,	%f18
	ldstub	[%l7 + 0x5A],	%o7
	bvc,a,pn	%xcc,	loop_235
	edge8	%i2,	%o1,	%o3
	edge8ln	%g4,	%l1,	%i1
	fba	%fcc2,	loop_236
loop_235:
	fnot2	%f6,	%f30
	ldsw	[%l7 + 0x20],	%o6
	bshuffle	%f4,	%f0,	%f16
loop_236:
	fsrc1s	%f8,	%f26
	lduw	[%l7 + 0x24],	%g1
	fnot1s	%f3,	%f25
	movrlz	%i3,	%g5,	%l6
	edge32ln	%g7,	%l4,	%g3
	movre	%o0,	%i6,	%l0
	movrgz	%l3,	0x0B7,	%i7
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x60] %asi,	%o4
	movre	%g2,	%l2,	%o5
	fpsub32	%f20,	%f10,	%f6
	fbge,a	%fcc1,	loop_237
	or	%g6,	%i5,	%i4
	movl	%xcc,	%i0,	%o2
	alignaddrl	%l5,	%i2,	%o7
loop_237:
	orn	%o1,	%g4,	%l1
	fblg,a	%fcc0,	loop_238
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%o3,	loop_239
	prefetch	[%l7 + 0x64],	 0x3
loop_238:
	alignaddrl	%i1,	%o6,	%g1
	set	0x34, %o4
	lduba	[%l7 + %o4] 0x11,	%i3
loop_239:
	mova	%xcc,	%g5,	%g7
	tcs	%xcc,	0x4
	movvs	%xcc,	%l6,	%l4
	alignaddr	%g3,	%o0,	%i6
	taddcc	%l3,	%l0,	%i7
	bg,pt	%icc,	loop_240
	lduw	[%l7 + 0x4C],	%g2
	srax	%o4,	%l2,	%g6
	fmovdneg	%icc,	%f1,	%f5
loop_240:
	bcs,pn	%icc,	loop_241
	bvs,pt	%xcc,	loop_242
	ble,pn	%xcc,	loop_243
	movrlz	%i5,	%o5,	%i4
loop_241:
	xor	%o2,	0x1F35,	%l5
loop_242:
	tsubcctv	%i0,	0x068C,	%i2
loop_243:
	srlx	%o1,	%g4,	%o7
	alignaddr	%l1,	%i1,	%o3
	be,a,pt	%icc,	loop_244
	bvc,pt	%icc,	loop_245
	fbne,a	%fcc3,	loop_246
	edge16	%o6,	%g1,	%g5
loop_244:
	edge32l	%g7,	%i3,	%l4
loop_245:
	edge32l	%g3,	%o0,	%i6
loop_246:
	xorcc	%l6,	%l0,	%l3
	edge16ln	%g2,	%i7,	%o4
	be,a	loop_247
	fbug	%fcc1,	loop_248
	tpos	%xcc,	0x0
	or	%g6,	%l2,	%i5
loop_247:
	fnot1	%f0,	%f24
loop_248:
	fmovsne	%xcc,	%f16,	%f17
	nop
	set	0x70, %l0
	std	%f28,	[%l7 + %l0]
	fcmpd	%fcc0,	%f0,	%f26
	edge8	%i4,	%o5,	%l5
	orn	%i0,	%o2,	%o1
	fandnot2s	%f22,	%f26,	%f24
	fbo	%fcc1,	loop_249
	xorcc	%i2,	%g4,	%l1
	movl	%icc,	%o7,	%i1
	fbl,a	%fcc1,	loop_250
loop_249:
	fbge	%fcc1,	loop_251
	bshuffle	%f16,	%f8,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_250:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f19,	[%l7 + 0x60] %asi
loop_251:
	move	%icc,	%o3,	%g1
	movl	%icc,	%o6,	%g7
	flush	%l7 + 0x34
	bn,pn	%icc,	loop_252
	fbuge	%fcc2,	loop_253
	tne	%icc,	0x2
	set	0x34, %o6
	lduwa	[%l7 + %o6] 0x19,	%i3
loop_252:
	sdiv	%g5,	0x1261,	%l4
loop_253:
	movleu	%icc,	%o0,	%g3
	ldstub	[%l7 + 0x63],	%l6
	be	%icc,	loop_254
	movne	%icc,	%l0,	%i6
	fones	%f21
	xorcc	%l3,	0x1BA4,	%g2
loop_254:
	tgu	%xcc,	0x6
	te	%xcc,	0x4
	sub	%o4,	%g6,	%l2
	ldx	[%l7 + 0x70],	%i7
	movneg	%icc,	%i5,	%o5
	tpos	%xcc,	0x1
	tgu	%icc,	0x3
	movrlz	%l5,	%i4,	%o2
	fpadd16	%f18,	%f10,	%f30
	movvs	%xcc,	%o1,	%i0
	ldstub	[%l7 + 0x21],	%g4
	or	%l1,	0x0E32,	%i2
	fsrc1	%f22,	%f20
	fxor	%f8,	%f30,	%f16
	sdivcc	%o7,	0x1379,	%i1
	tneg	%icc,	0x6
	movn	%xcc,	%o3,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x3
	umul	%g7,	%i3,	%g1
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	tg	%icc,	0x7
	edge32	%o0,	%g3,	%l6
	fcmpeq32	%f12,	%f4,	%l0
	fbn,a	%fcc0,	loop_255
	fmovdge	%xcc,	%f11,	%f30
	bcs,a	%icc,	loop_256
	movpos	%icc,	%i6,	%l3
loop_255:
	srax	%l4,	0x19,	%g2
	edge32n	%g6,	%l2,	%o4
loop_256:
	fnands	%f30,	%f8,	%f23
	tleu	%icc,	0x5
	tle	%icc,	0x2
	fandnot1s	%f2,	%f2,	%f26
	srlx	%i5,	0x0D,	%o5
	tge	%xcc,	0x2
	umulcc	%l5,	0x1DA9,	%i4
	fmovrdne	%i7,	%f28,	%f24
	or	%o2,	0x173C,	%i0
	edge8n	%g4,	%l1,	%o1
	fbug,a	%fcc0,	loop_257
	fbge,a	%fcc3,	loop_258
	for	%f20,	%f12,	%f22
	set	0x39, %i4
	ldstuba	[%l7 + %i4] 0x04,	%o7
loop_257:
	std	%f16,	[%l7 + 0x38]
loop_258:
	movvc	%icc,	%i1,	%i2
	srlx	%o3,	%g7,	%i3
	movrgez	%o6,	0x03A,	%g1
	fcmpgt32	%f24,	%f12,	%o0
	fmovrse	%g3,	%f18,	%f22
	movle	%icc,	%g5,	%l6
	bcs,a	loop_259
	fpsub16s	%f0,	%f28,	%f29
	tge	%icc,	0x6
	fpsub16	%f0,	%f2,	%f14
loop_259:
	mova	%icc,	%i6,	%l0
	fzeros	%f4
	edge32	%l4,	%g2,	%g6
	tne	%xcc,	0x1
	fmovrdne	%l2,	%f30,	%f18
	brlz	%o4,	loop_260
	fones	%f25
	sethi	0x0670,	%i5
	set	0x18, %l1
	lduwa	[%l7 + %l1] 0x15,	%l3
loop_260:
	fcmpne16	%f4,	%f16,	%o5
	fornot2	%f12,	%f12,	%f8
	membar	0x0D
	sdivx	%l5,	0x03E6,	%i7
	fblg	%fcc1,	loop_261
	andncc	%o2,	%i4,	%i0
	movne	%icc,	%l1,	%g4
	bvs,a,pn	%icc,	loop_262
loop_261:
	fpadd32	%f22,	%f0,	%f8
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_262:
	srl	%o1,	0x1B,	%i1
	sub	%o7,	0x167F,	%o3
	sir	0x0E77
	srlx	%g7,	%i2,	%i3
	xnor	%g1,	0x0536,	%o0
	tpos	%icc,	0x7
	movvs	%xcc,	%g3,	%g5
	ldd	[%l7 + 0x78],	%o6
	stbar
	fbug	%fcc3,	loop_263
	fpadd16s	%f4,	%f11,	%f18
	orn	%l6,	%l0,	%l4
	srlx	%i6,	0x05,	%g2
loop_263:
	mulscc	%g6,	%o4,	%l2
	addc	%l3,	%o5,	%i5
	tn	%xcc,	0x0
	stb	%l5,	[%l7 + 0x50]
	set	0x10, %i3
	stba	%i7,	[%l7 + %i3] 0x15
	sir	0x1EEE
	edge32ln	%o2,	%i0,	%l1
	st	%f11,	[%l7 + 0x18]
	taddcctv	%g4,	0x10FA,	%i4
	fabss	%f25,	%f16
	edge16ln	%i1,	%o1,	%o3
	brlz,a	%g7,	loop_264
	edge8l	%i2,	%i3,	%g1
	edge32	%o7,	%g3,	%o0
	edge8	%o6,	%l6,	%g5
loop_264:
	fmovsa	%icc,	%f0,	%f21
	fmovse	%icc,	%f21,	%f6
	set	0x6C, %i7
	ldswa	[%l7 + %i7] 0x15,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x5
	edge16ln	%i6,	%l4,	%g6
	fxor	%f18,	%f16,	%f0
	fpsub16s	%f1,	%f29,	%f9
	movneg	%icc,	%o4,	%g2
	move	%icc,	%l2,	%l3
	bvc	%xcc,	loop_265
	tgu	%xcc,	0x2
	fpadd32s	%f3,	%f1,	%f22
	prefetch	[%l7 + 0x58],	 0x2
loop_265:
	fmovsg	%xcc,	%f12,	%f6
	udivx	%o5,	0x0658,	%l5
	fbule,a	%fcc0,	loop_266
	popc	0x0197,	%i5
	fcmped	%fcc3,	%f6,	%f28
	fcmpeq32	%f24,	%f10,	%i7
loop_266:
	edge8l	%i0,	%l1,	%g4
	movrgez	%i4,	%o2,	%o1
	fxnors	%f16,	%f10,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_267
	fmovsneg	%icc,	%f0,	%f24
	sdivx	%o3,	0x104E,	%i1
	fbn,a	%fcc3,	loop_268
loop_267:
	fbne	%fcc0,	loop_269
	edge16	%i2,	%i3,	%g7
	fbo	%fcc1,	loop_270
loop_268:
	and	%g1,	0x1732,	%o7
loop_269:
	be,a,pt	%xcc,	loop_271
	fba	%fcc3,	loop_272
loop_270:
	fpack32	%f2,	%f18,	%f2
	srax	%o0,	%o6,	%g3
loop_271:
	fmovd	%f10,	%f26
loop_272:
	ldx	[%l7 + 0x28],	%l6
	tpos	%icc,	0x4
	mulx	%l0,	%i6,	%l4
	addcc	%g6,	%o4,	%g2
	srax	%l2,	%g5,	%o5
	nop
	set	0x0A, %l5
	lduh	[%l7 + %l5],	%l3
	orncc	%i5,	%i7,	%l5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i0
	fmuld8ulx16	%f27,	%f7,	%f18
	fmovrde	%g4,	%f2,	%f26
	movne	%xcc,	%i4,	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%o3
	edge16ln	%i2,	%i1,	%i3
	movvs	%xcc,	%g1,	%o7
	orn	%o0,	0x156D,	%o6
	orn	%g7,	%l6,	%g3
	addcc	%i6,	0x10AE,	%l4
	bcs,a,pn	%icc,	loop_273
	fandnot2	%f26,	%f18,	%f4
	movl	%xcc,	%l0,	%o4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g6
loop_273:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%l2,	[%l7 + 0x20] %asi
	membar	#Sync
	fnegs	%f30,	%f31
	fmovsge	%xcc,	%f13,	%f23
	wr	%g0,	0x81,	%asi
	stba	%g2,	[%l7 + 0x3D] %asi
	array32	%g5,	%l3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pt	%xcc,	loop_274
	edge16l	%i7,	%l5,	%l1
	subcc	%i5,	%i0,	%g4
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
	fpsub16s	%f7,	%f14,	%f10
	wr	%g0,	0x88,	%asi
	stwa	%i4,	[%l7 + 0x18] %asi
loop_275:
	move	%icc,	%o1,	%o3
	fbule	%fcc3,	loop_276
	movn	%icc,	%i2,	%o2
	sethi	0x1950,	%i1
	fmovrdlez	%g1,	%f18,	%f12
loop_276:
	bleu,pn	%xcc,	loop_277
	srlx	%i3,	0x1D,	%o0
	sub	%o6,	%g7,	%l6
	addcc	%g3,	0x0943,	%o7
loop_277:
	movrgz	%l4,	%l0,	%o4
	movvc	%icc,	%i6,	%l2
	fmul8ulx16	%f18,	%f10,	%f2
	tsubcc	%g2,	%g5,	%g6
	bgu,pn	%xcc,	loop_278
	fmovsne	%icc,	%f26,	%f10
	tvc	%icc,	0x2
	orncc	%l3,	0x0607,	%i7
loop_278:
	fsrc2	%f16,	%f22
	movpos	%xcc,	%l5,	%o5
	set	0x34, %g6
	stwa	%i5,	[%l7 + %g6] 0x2b
	membar	#Sync
	lduh	[%l7 + 0x46],	%l1
	ldsb	[%l7 + 0x75],	%i0
	sdiv	%g4,	0x1350,	%o1
	fcmpgt16	%f24,	%f2,	%o3
	swap	[%l7 + 0x2C],	%i2
	addcc	%i4,	%o2,	%i1
	ldsb	[%l7 + 0x6F],	%g1
	set	0x60, %o0
	swapa	[%l7 + %o0] 0x89,	%o0
	srl	%o6,	0x18,	%g7
	fmovdpos	%xcc,	%f3,	%f22
	tg	%xcc,	0x4
	movrne	%l6,	0x3B9,	%g3
	srl	%i3,	0x14,	%o7
	fcmpeq32	%f16,	%f8,	%l4
	fmovrdlez	%o4,	%f28,	%f6
	fpsub16	%f28,	%f8,	%f16
	srax	%i6,	0x1A,	%l0
	fmovsl	%xcc,	%f19,	%f14
	orcc	%l2,	0x11D6,	%g5
	fcmped	%fcc2,	%f22,	%f6
	movge	%icc,	%g6,	%g2
	umul	%i7,	%l5,	%o5
	srlx	%l3,	%l1,	%i0
	sdivcc	%i5,	0x0D27,	%o1
	movre	%o3,	0x198,	%g4
	or	%i2,	0x1410,	%i4
	movpos	%xcc,	%i1,	%o2
	movrgz	%o0,	%g1,	%g7
	array16	%o6,	%l6,	%i3
	fnot1	%f2,	%f22
	fbo	%fcc2,	loop_279
	edge32l	%g3,	%o7,	%o4
	fmovdvc	%xcc,	%f27,	%f2
	fabsd	%f6,	%f18
loop_279:
	fbul	%fcc0,	loop_280
	movrgz	%i6,	%l0,	%l4
	edge8ln	%l2,	%g5,	%g2
	fmovspos	%icc,	%f10,	%f28
loop_280:
	andncc	%g6,	%l5,	%o5
	movrgz	%i7,	%l1,	%i0
	orcc	%i5,	%l3,	%o1
	fands	%f30,	%f7,	%f7
	brgez	%g4,	loop_281
	or	%i2,	%o3,	%i4
	edge32	%o2,	%o0,	%g1
	udivx	%g7,	0x0B31,	%i1
loop_281:
	sdiv	%o6,	0x1372,	%i3
	set	0x78, %g5
	swapa	[%l7 + %g5] 0x11,	%g3
	fpadd16	%f10,	%f24,	%f2
	movl	%xcc,	%o7,	%l6
	taddcctv	%i6,	0x0524,	%o4
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xeb,	%l0
	siam	0x4
	andn	%l2,	0x1D51,	%g5
	movl	%icc,	%g2,	%g6
	membar	0x19
	call	loop_282
	tge	%icc,	0x6
	set	0x70, %i1
	stda	%l4,	[%l7 + %i1] 0x89
loop_282:
	movrgez	%l4,	%o5,	%i7
	movneg	%icc,	%l1,	%i5
	te	%icc,	0x6
	fnot2s	%f31,	%f31
	tvs	%xcc,	0x5
	fmovsvc	%xcc,	%f21,	%f25
	tle	%icc,	0x0
	smul	%i0,	0x0F80,	%o1
	nop
	set	0x24, %i0
	lduw	[%l7 + %i0],	%l3
	orn	%i2,	%g4,	%o3
	srax	%o2,	%i4,	%o0
	fone	%f24
	or	%g1,	%g7,	%i1
	tvc	%xcc,	0x3
	movcs	%xcc,	%o6,	%i3
	ldub	[%l7 + 0x79],	%g3
	xor	%l6,	%i6,	%o4
	tvc	%icc,	0x1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%l2
	and	%o7,	0x1CB4,	%g2
	xorcc	%g6,	0x13C2,	%g5
	bcs,pt	%xcc,	loop_283
	fble	%fcc0,	loop_284
	stx	%l4,	[%l7 + 0x30]
	tg	%icc,	0x4
loop_283:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f28,	[%l7 + 0x40] %asi
loop_284:
	movrlez	%o5,	0x246,	%i7
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%l5
	bne,pt	%xcc,	loop_285
	srl	%i5,	0x06,	%l1
	edge16l	%i0,	%o1,	%i2
	fmovsn	%xcc,	%f29,	%f8
loop_285:
	andcc	%g4,	0x15BB,	%l3
	tl	%xcc,	0x5
	tleu	%icc,	0x1
	fnand	%f2,	%f2,	%f8
	movgu	%xcc,	%o2,	%o3
	movn	%xcc,	%o0,	%g1
	tcs	%icc,	0x5
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x89,	 0x3
	sethi	0x0672,	%i4
	membar	0x23
	or	%i1,	0x0A57,	%i3
	movrgz	%g3,	0x139,	%l6
	andn	%o6,	0x0F90,	%i6
	movrlez	%l0,	%o4,	%l2
	fmovdn	%xcc,	%f9,	%f1
	sub	%o7,	0x191C,	%g6
	sub	%g5,	%g2,	%l4
	tcs	%xcc,	0x2
	bn,a,pt	%xcc,	loop_286
	fpack16	%f18,	%f0
	andn	%i7,	%l5,	%o5
	fmul8x16al	%f13,	%f24,	%f10
loop_286:
	ta	%xcc,	0x3
	be,a,pt	%icc,	loop_287
	or	%i5,	%i0,	%l1
	stw	%i2,	[%l7 + 0x34]
	addc	%g4,	0x0CE1,	%o1
loop_287:
	tne	%xcc,	0x2
	tg	%xcc,	0x1
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%o2
	fzero	%f12
	mova	%xcc,	%l3,	%o0
	stw	%o3,	[%l7 + 0x78]
	fbe	%fcc3,	loop_288
	subc	%g7,	0x1D24,	%g1
	xorcc	%i4,	0x170E,	%i1
	orncc	%g3,	0x1AEF,	%l6
loop_288:
	movre	%i3,	%i6,	%l0
	bvc,pn	%icc,	loop_289
	fsrc2s	%f31,	%f20
	subccc	%o4,	%o6,	%o7
	brgez,a	%g6,	loop_290
loop_289:
	ta	%icc,	0x0
	movvs	%icc,	%g5,	%g2
	nop
	setx	loop_291,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_290:
	srl	%l4,	0x07,	%i7
	fxnor	%f24,	%f0,	%f26
	smul	%l5,	%l2,	%o5
loop_291:
	move	%xcc,	%i0,	%i5
	fmovrdlz	%i2,	%f26,	%f0
	xnorcc	%g4,	0x0C68,	%o1
	fmovsgu	%icc,	%f13,	%f25
	fmovrdgez	%o2,	%f18,	%f24
	movrgz	%l3,	0x04C,	%o0
	stb	%l1,	[%l7 + 0x57]
	nop
	setx	loop_292,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdlez	%g7,	%f16,	%f26
	fcmped	%fcc2,	%f4,	%f26
loop_292:
	bgu	%xcc,	loop_294
loop_293:
	alignaddrl	%o3,	%i4,	%i1
	mulscc	%g1,	%l6,	%g3
	movpos	%xcc,	%i6,	%l0
loop_294:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%i3
	fmovsg	%icc,	%f12,	%f17
	sdivx	%o7,	0x0416,	%g6
	movg	%icc,	%o6,	%g2
	bne,pn	%xcc,	loop_295
	xnor	%l4,	0x05F5,	%g5
	tvc	%icc,	0x5
	fmovdcs	%icc,	%f6,	%f3
loop_295:
	nop
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	tleu	%icc,	0x3
	bvs	loop_296
	fmovdge	%icc,	%f9,	%f23
	fmovsl	%icc,	%f24,	%f9
	fmovrdgez	%l5,	%f12,	%f10
loop_296:
	stbar
	edge16ln	%l2,	%i7,	%i0
	fcmpgt16	%f0,	%f4,	%o5
	tle	%icc,	0x4
	tsubcctv	%i5,	%i2,	%g4
	umul	%o1,	0x121D,	%o2
	lduh	[%l7 + 0x7E],	%l3
	fmuld8sux16	%f14,	%f6,	%f26
	alignaddr	%o0,	%l1,	%o3
	umulcc	%i4,	%i1,	%g1
	movgu	%icc,	%l6,	%g7
	movpos	%icc,	%g3,	%i6
	fbg	%fcc0,	loop_297
	fsrc1s	%f19,	%f8
	sdivx	%l0,	0x1F77,	%o4
	set	0x48, %o3
	lduha	[%l7 + %o3] 0x15,	%i3
loop_297:
	fmul8x16al	%f1,	%f19,	%f10
	brgez	%o7,	loop_298
	sdiv	%g6,	0x142C,	%g2
	edge32l	%l4,	%o6,	%l5
	smulcc	%l2,	%g5,	%i0
loop_298:
	fbge	%fcc2,	loop_299
	fnegs	%f12,	%f6
	sir	0x0BE1
	stbar
loop_299:
	bg,a	%xcc,	loop_300
	edge8ln	%i7,	%o5,	%i5
	stb	%i2,	[%l7 + 0x20]
	movrlz	%o1,	0x1DA,	%o2
loop_300:
	movrne	%g4,	%o0,	%l1
	movrlez	%l3,	%o3,	%i4
	fmovsneg	%icc,	%f1,	%f5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x10] %asi,	%i1
	tn	%xcc,	0x6
	fcmple32	%f6,	%f14,	%g1
	fpsub32	%f20,	%f14,	%f10
	fbo,a	%fcc0,	loop_301
	fmovsneg	%xcc,	%f19,	%f13
	edge32n	%l6,	%g7,	%g3
	tgu	%icc,	0x2
loop_301:
	fxors	%f26,	%f15,	%f25
	bg	loop_302
	movne	%icc,	%i6,	%l0
	sll	%i3,	0x11,	%o4
	st	%f2,	[%l7 + 0x64]
loop_302:
	fmovrdgz	%o7,	%f6,	%f14
	smul	%g6,	0x10F7,	%l4
	fcmped	%fcc0,	%f16,	%f22
	edge16	%o6,	%l5,	%g2
	udivcc	%l2,	0x1014,	%i0
	subc	%g5,	%o5,	%i5
	movcs	%icc,	%i7,	%o1
	tl	%icc,	0x4
	tsubcc	%i2,	0x0459,	%o2
	mova	%icc,	%o0,	%l1
	fpsub16s	%f19,	%f15,	%f4
	taddcctv	%l3,	%g4,	%o3
	edge32n	%i4,	%i1,	%g1
	edge32	%l6,	%g7,	%g3
	fandnot1	%f10,	%f26,	%f30
	udivx	%i6,	0x0C78,	%i3
	brlz,a	%l0,	loop_303
	sllx	%o7,	%g6,	%l4
	membar	0x50
	lduw	[%l7 + 0x5C],	%o6
loop_303:
	fbug,a	%fcc2,	loop_304
	fmovsgu	%xcc,	%f28,	%f10
	popc	%o4,	%l5
	fcmpne32	%f6,	%f28,	%l2
loop_304:
	tcc	%icc,	0x4
	tleu	%xcc,	0x7
	edge16n	%g2,	%g5,	%o5
	fmovrdne	%i5,	%f18,	%f0
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x24, %l2
	lda	[%l7 + %l2] 0x14,	%f18
	movrne	%i7,	0x20D,	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i0,	%o2
	swap	[%l7 + 0x34],	%i2
	tcc	%icc,	0x2
	movn	%icc,	%o0,	%l1
	srax	%g4,	%o3,	%l3
	fandnot1	%f18,	%f14,	%f26
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x61] %asi,	%i4
	movpos	%xcc,	%i1,	%l6
	brz	%g1,	loop_305
	and	%g3,	%i6,	%g7
	movvs	%icc,	%l0,	%o7
	brz	%g6,	loop_306
loop_305:
	fmovs	%f6,	%f12
	fnand	%f0,	%f10,	%f18
	fpsub16s	%f9,	%f17,	%f19
loop_306:
	movrlz	%i3,	%o6,	%l4
	mova	%icc,	%l5,	%l2
	xnorcc	%g2,	%g5,	%o4
	ldx	[%l7 + 0x08],	%i5
	fnors	%f0,	%f28,	%f13
	orncc	%i7,	0x0024,	%o5
	fbu	%fcc3,	loop_307
	popc	0x050E,	%i0
	fpsub32s	%f2,	%f15,	%f7
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x15,	 0x2
loop_307:
	tsubcctv	%i2,	0x0BE3,	%o2
	fmovsvc	%icc,	%f2,	%f24
	fornot2s	%f20,	%f28,	%f24
	xorcc	%l1,	0x1B20,	%o0
	orncc	%o3,	0x0784,	%l3
	move	%icc,	%i4,	%g4
	tl	%icc,	0x7
	sdivcc	%i1,	0x0F6E,	%l6
	set	0x4E, %g4
	stba	%g1,	[%l7 + %g4] 0x15
	fmovdne	%xcc,	%f2,	%f28
	tcs	%icc,	0x0
	add	%i6,	0x0422,	%g7
	flush	%l7 + 0x68
	tge	%icc,	0x1
	andcc	%l0,	0x1292,	%g3
	tvc	%icc,	0x5
	fbu	%fcc2,	loop_308
	movleu	%icc,	%o7,	%g6
	xnorcc	%o6,	%l4,	%i3
	tvc	%xcc,	0x2
loop_308:
	fpsub16s	%f29,	%f1,	%f13
	xnor	%l5,	0x0897,	%g2
	set	0x24, %l3
	lduba	[%l7 + %l3] 0x88,	%l2
	movrlez	%g5,	%i5,	%o4
	edge16n	%o5,	%i0,	%o1
	edge8ln	%i7,	%i2,	%o2
	fors	%f21,	%f0,	%f5
	and	%l1,	0x0C1B,	%o3
	movvc	%xcc,	%o0,	%l3
	fblg,a	%fcc3,	loop_309
	edge32l	%g4,	%i4,	%i1
	fpsub16s	%f16,	%f13,	%f8
	fcmple32	%f10,	%f2,	%g1
loop_309:
	fpack32	%f8,	%f18,	%f14
	sdiv	%l6,	0x1996,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f6,	%f6,	%f18
	fmovsleu	%icc,	%f8,	%f27
	bpos,pt	%xcc,	loop_310
	movpos	%icc,	%l0,	%i6
	udivx	%o7,	0x0682,	%g3
	xorcc	%g6,	0x0BA4,	%o6
loop_310:
	umulcc	%l4,	%i3,	%l5
	movg	%xcc,	%l2,	%g5
	stbar
	set	0x22, %i6
	ldsba	[%l7 + %i6] 0x14,	%g2
	te	%icc,	0x0
	bn,a	%xcc,	loop_311
	smul	%o4,	%i5,	%i0
	nop
	setx	loop_312,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%o1,	0x0B08,	%i7
loop_311:
	mulx	%i2,	%o5,	%l1
	xor	%o3,	%o0,	%l3
loop_312:
	movvc	%xcc,	%g4,	%o2
	fxors	%f23,	%f0,	%f24
	fmovrse	%i4,	%f31,	%f23
	edge8n	%i1,	%g1,	%g7
	array32	%l0,	%i6,	%o7
	movneg	%xcc,	%g3,	%l6
	edge16	%o6,	%l4,	%g6
	udivx	%i3,	0x0AFC,	%l2
	fcmped	%fcc3,	%f28,	%f20
	tneg	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f7,	%f28
	bvc,a,pt	%icc,	loop_313
	sir	0x0CC0
	fmovdl	%icc,	%f0,	%f3
	bcs,a,pn	%icc,	loop_314
loop_313:
	addccc	%l5,	%g5,	%o4
	edge8l	%i5,	%g2,	%i0
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe2,	%i6
loop_314:
	fmovdg	%icc,	%f16,	%f2
	std	%i2,	[%l7 + 0x50]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x0c,	%o5,	%o1
	fxors	%f15,	%f11,	%f30
	movvc	%xcc,	%l1,	%o0
	xorcc	%o3,	%g4,	%l3
	orncc	%o2,	%i4,	%g1
	add	%i1,	%g7,	%i6
	fmovscc	%xcc,	%f17,	%f7
	fmovd	%f24,	%f0
	movge	%xcc,	%o7,	%g3
	movrlez	%l6,	0x0EC,	%o6
	popc	%l0,	%g6
	set	0x4C, %g2
	lda	[%l7 + %g2] 0x19,	%f25
	pdist	%f0,	%f6,	%f16
	andcc	%i3,	0x0685,	%l2
	add	%l5,	%g5,	%o4
	alignaddrl	%i5,	%g2,	%i0
	edge32n	%l4,	%i7,	%i2
	te	%icc,	0x7
	nop
	set	0x70, %l6
	std	%f0,	[%l7 + %l6]
	array16	%o5,	%o1,	%o0
	srl	%o3,	0x07,	%l1
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x14,	 0x3
	wr	%g0,	0x22,	%asi
	stwa	%o2,	[%l7 + 0x54] %asi
	membar	#Sync
	fmovsl	%xcc,	%f11,	%f4
	fmovdneg	%xcc,	%f30,	%f3
	tn	%xcc,	0x4
	umul	%i4,	%g1,	%g4
	edge32n	%g7,	%i6,	%o7
	tge	%xcc,	0x5
	andncc	%g3,	%l6,	%i1
	taddcctv	%o6,	%g6,	%l0
	fmuld8sux16	%f10,	%f18,	%f8
	sll	%i3,	%l5,	%l2
	be,a,pt	%xcc,	loop_315
	addcc	%g5,	0x0BF3,	%o4
	sir	0x1ACF
	edge8n	%g2,	%i5,	%i0
loop_315:
	movrgez	%i7,	0x3B4,	%i2
	fmovdleu	%xcc,	%f2,	%f20
	fbul	%fcc0,	loop_316
	lduh	[%l7 + 0x60],	%l4
	fmovdl	%xcc,	%f18,	%f17
	fcmpgt32	%f8,	%f26,	%o1
loop_316:
	sdivcc	%o5,	0x035C,	%o3
	fcmpgt16	%f18,	%f6,	%l1
	udiv	%l3,	0x1BB9,	%o2
	ldd	[%l7 + 0x70],	%i4
	xorcc	%o0,	%g4,	%g7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%i6
	fands	%f6,	%f9,	%f21
	wr	%g0,	0x10,	%asi
	sta	%f4,	[%l7 + 0x18] %asi
	sth	%o7,	[%l7 + 0x7E]
	orcc	%g3,	0x07EB,	%g1
	addccc	%l6,	0x0CF8,	%o6
	edge16l	%g6,	%l0,	%i3
	stx	%l5,	[%l7 + 0x48]
	movge	%xcc,	%i1,	%l2
	fmovdpos	%icc,	%f31,	%f10
	tcc	%icc,	0x4
	xorcc	%g5,	%o4,	%i5
	fmovrse	%g2,	%f17,	%f27
	tge	%icc,	0x3
	fpadd16s	%f20,	%f21,	%f20
	orn	%i7,	0x1F45,	%i0
	fbul	%fcc0,	loop_317
	fmovsleu	%icc,	%f19,	%f26
	pdist	%f12,	%f24,	%f4
	subcc	%i2,	0x1952,	%o1
loop_317:
	swap	[%l7 + 0x44],	%o5
	fmovsvs	%xcc,	%f27,	%f25
	fmovdgu	%icc,	%f11,	%f8
	wr	%g0,	0x27,	%asi
	stxa	%o3,	[%l7 + 0x30] %asi
	membar	#Sync
	subcc	%l1,	0x02B0,	%l4
	ta	%xcc,	0x2
	tleu	%xcc,	0x2
	and	%o2,	0x1979,	%i4
	ld	[%l7 + 0x14],	%f21
	set	0x79, %g7
	ldstuba	[%l7 + %g7] 0x11,	%o0
	edge32l	%g4,	%l3,	%g7
	umulcc	%o7,	0x0CB6,	%i6
	tsubcctv	%g1,	0x0444,	%l6
	fmovrdne	%o6,	%f18,	%f22
	fmovsne	%xcc,	%f28,	%f1
	tn	%xcc,	0x2
	fpmerge	%f8,	%f22,	%f16
	fpadd16s	%f18,	%f1,	%f15
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x18,	%g6,	%l0
	sdivcc	%i3,	0x17B9,	%g3
	fnot1	%f30,	%f10
	andcc	%i1,	0x052B,	%l5
	tgu	%icc,	0x6
	bgu	loop_318
	tsubcctv	%g5,	0x002B,	%l2
	subccc	%o4,	%g2,	%i5
	srl	%i0,	0x08,	%i2
loop_318:
	movpos	%icc,	%o1,	%i7
	fcmpeq32	%f2,	%f30,	%o3
	fmovdg	%icc,	%f4,	%f28
	ta	%xcc,	0x5
	andcc	%l1,	0x03B5,	%l4
	mova	%xcc,	%o5,	%o2
	smul	%i4,	%g4,	%o0
	tle	%icc,	0x5
	be,a,pn	%xcc,	loop_319
	movn	%icc,	%g7,	%l3
	movre	%i6,	%o7,	%g1
	subccc	%l6,	0x0E36,	%g6
loop_319:
	sir	0x0966
	movrne	%l0,	%o6,	%g3
	bcc	%icc,	loop_320
	edge16l	%i3,	%l5,	%g5
	bne,pt	%icc,	loop_321
	tvs	%icc,	0x5
loop_320:
	movcs	%xcc,	%l2,	%i1
	xnorcc	%g2,	%i5,	%i0
loop_321:
	brnz,a	%o4,	loop_322
	fmovrdgz	%o1,	%f16,	%f30
	tcs	%icc,	0x4
	fcmpd	%fcc2,	%f26,	%f18
loop_322:
	tsubcctv	%i2,	%o3,	%i7
	movrne	%l1,	%o5,	%o2
	fnot2	%f24,	%f10
	edge16l	%i4,	%l4,	%g4
	tleu	%icc,	0x6
	membar	0x7E
	edge8	%g7,	%o0,	%l3
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x60] %asi,	%o7
	bn,pt	%icc,	loop_323
	stbar
	fbo	%fcc2,	loop_324
	ta	%xcc,	0x2
loop_323:
	nop
	set	0x40, %o2
	ldswa	[%l7 + %o2] 0x10,	%g1
loop_324:
	subccc	%l6,	0x0249,	%g6
	movne	%xcc,	%l0,	%i6
	sdivcc	%g3,	0x1645,	%i3
	fcmpgt32	%f14,	%f16,	%l5
	fmovdvs	%icc,	%f1,	%f30
	mulscc	%o6,	0x0BC4,	%l2
	movvc	%xcc,	%g5,	%g2
	fornot2	%f20,	%f26,	%f26
	st	%f21,	[%l7 + 0x50]
	movcc	%xcc,	%i1,	%i5
	fmovdneg	%icc,	%f18,	%f13
	mulscc	%o4,	%i0,	%o1
	udiv	%o3,	0x011D,	%i2
	sir	0x073F
	srl	%i7,	%o5,	%o2
	orn	%l1,	%l4,	%g4
	tcs	%icc,	0x0
	for	%f2,	%f22,	%f10
	sir	0x0817
	edge8n	%i4,	%g7,	%l3
	ldsh	[%l7 + 0x68],	%o0
	movne	%xcc,	%o7,	%g1
	tpos	%icc,	0x5
	ble,a	loop_325
	movg	%icc,	%g6,	%l0
	fandnot1	%f12,	%f20,	%f20
	fmovrse	%l6,	%f18,	%f26
loop_325:
	bge,a,pn	%icc,	loop_326
	movge	%icc,	%i6,	%i3
	tle	%xcc,	0x5
	fble,a	%fcc1,	loop_327
loop_326:
	tleu	%icc,	0x2
	brlez,a	%l5,	loop_328
	or	%o6,	0x041A,	%g3
loop_327:
	fmovdvs	%xcc,	%f5,	%f7
	fbuge	%fcc3,	loop_329
loop_328:
	edge32l	%l2,	%g2,	%g5
	fmovd	%f2,	%f16
	fabss	%f30,	%f8
loop_329:
	udivcc	%i1,	0x0E37,	%i5
	brlez	%i0,	loop_330
	bvs,a	%icc,	loop_331
	tcs	%xcc,	0x1
	movle	%icc,	%o1,	%o3
loop_330:
	addccc	%o4,	0x06EF,	%i2
loop_331:
	sllx	%o5,	0x02,	%o2
	brnz,a	%l1,	loop_332
	movneg	%xcc,	%i7,	%l4
	movneg	%icc,	%i4,	%g7
	fpadd16	%f18,	%f12,	%f0
loop_332:
	alignaddrl	%g4,	%l3,	%o0
	pdist	%f24,	%f22,	%f30
	bcc,a,pt	%xcc,	loop_333
	siam	0x3
	taddcctv	%g1,	0x006A,	%g6
	tn	%xcc,	0x5
loop_333:
	fbne,a	%fcc1,	loop_334
	lduh	[%l7 + 0x1A],	%l0
	fmovsvs	%xcc,	%f13,	%f10
	sll	%o7,	0x0A,	%l6
loop_334:
	call	loop_335
	sub	%i3,	0x0188,	%i6
	fmovsne	%xcc,	%f11,	%f23
	tvs	%icc,	0x2
loop_335:
	fpsub32	%f12,	%f8,	%f0
	umul	%l5,	%g3,	%l2
	ldd	[%l7 + 0x40],	%f6
	sll	%g2,	%o6,	%g5
	edge16ln	%i5,	%i0,	%o1
	nop
	setx loop_336, %l0, %l1
	jmpl %l1, %o3
	edge16ln	%o4,	%i2,	%o5
	addccc	%o2,	%l1,	%i1
	addc	%i7,	%i4,	%g7
loop_336:
	subcc	%l4,	0x071E,	%g4
	fbuge,a	%fcc3,	loop_337
	fnegd	%f8,	%f26
	sdivcc	%o0,	0x0928,	%l3
	stx	%g6,	[%l7 + 0x20]
loop_337:
	nop
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf1,	%f16
	movrgz	%l0,	%o7,	%l6
	fmovrdgz	%i3,	%f16,	%f26
	fxnors	%f15,	%f10,	%f9
	movcc	%icc,	%i6,	%l5
	nop
	setx	loop_338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu	%fcc0,	loop_339
	stw	%g1,	[%l7 + 0x24]
	fpadd32	%f20,	%f20,	%f26
loop_338:
	fmovdle	%xcc,	%f8,	%f22
loop_339:
	udiv	%g3,	0x1E45,	%g2
	bshuffle	%f12,	%f28,	%f18
	edge16n	%l2,	%o6,	%i5
	ldstub	[%l7 + 0x57],	%g5
	edge8	%i0,	%o1,	%o3
	fba,a	%fcc0,	loop_340
	tcc	%icc,	0x7
	sll	%o4,	0x17,	%o5
	bge,a,pn	%icc,	loop_341
loop_340:
	edge32n	%i2,	%l1,	%o2
	taddcc	%i7,	%i4,	%g7
	smulcc	%l4,	0x003F,	%g4
loop_341:
	fblg,a	%fcc2,	loop_342
	movn	%icc,	%i1,	%l3
	tne	%xcc,	0x0
	andn	%o0,	0x0C11,	%g6
loop_342:
	movneg	%xcc,	%o7,	%l6
	sethi	0x0FF2,	%l0
	tle	%icc,	0x6
	bvc,a,pt	%icc,	loop_343
	ta	%xcc,	0x6
	udiv	%i3,	0x01DD,	%l5
	ldd	[%l7 + 0x48],	%g0
loop_343:
	edge16n	%g3,	%i6,	%g2
	std	%f18,	[%l7 + 0x18]
	movvs	%xcc,	%o6,	%l2
	fmul8ulx16	%f8,	%f4,	%f30
	sir	0x1500
	movg	%xcc,	%i5,	%g5
	fble,a	%fcc2,	loop_344
	stw	%o1,	[%l7 + 0x58]
	wr	%g0,	0x23,	%asi
	stba	%i0,	[%l7 + 0x29] %asi
	membar	#Sync
loop_344:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x2e,	%o2
	subccc	%o4,	%i2,	%l1
	fcmped	%fcc0,	%f8,	%f10
	smul	%o2,	0x0D9C,	%o5
	tneg	%icc,	0x7
	fmovdneg	%xcc,	%f21,	%f21
	fmovrdlz	%i4,	%f20,	%f8
	sra	%i7,	0x1C,	%l4
	set	0x30, %o6
	ldswa	[%l7 + %o6] 0x0c,	%g7
	fmovs	%f14,	%f5
	fornot2s	%f7,	%f4,	%f25
	and	%i1,	%l3,	%o0
	array8	%g4,	%o7,	%l6
	tge	%xcc,	0x7
	movleu	%icc,	%g6,	%i3
	edge8n	%l0,	%g1,	%g3
	fmovdle	%icc,	%f7,	%f24
	fblg,a	%fcc3,	loop_345
	movvc	%icc,	%i6,	%g2
	movpos	%icc,	%o6,	%l5
	stb	%i5,	[%l7 + 0x78]
loop_345:
	movl	%icc,	%g5,	%o1
	move	%icc,	%i0,	%l2
	set	0x38, %i4
	stwa	%o4,	[%l7 + %i4] 0x0c
	ldsh	[%l7 + 0x1A],	%i2
	brnz	%l1,	loop_346
	edge32	%o3,	%o5,	%o2
	sub	%i4,	%l4,	%g7
	movvs	%icc,	%i1,	%l3
loop_346:
	fmovdle	%xcc,	%f5,	%f10
	tcs	%xcc,	0x3
	umulcc	%i7,	0x1222,	%g4
	set	0x64, %l1
	swapa	[%l7 + %l1] 0x89,	%o7
	movl	%xcc,	%l6,	%g6
	xorcc	%o0,	0x09D6,	%i3
	tsubcc	%g1,	%g3,	%l0
	fbo,a	%fcc0,	loop_347
	edge8n	%g2,	%o6,	%l5
	andn	%i5,	0x195D,	%g5
	edge8ln	%i6,	%i0,	%o1
loop_347:
	prefetch	[%l7 + 0x74],	 0x2
	edge8n	%l2,	%i2,	%l1
	stbar
	xnor	%o3,	0x06BF,	%o4
	edge16	%o2,	%o5,	%l4
	sub	%g7,	0x1B64,	%i4
	prefetch	[%l7 + 0x54],	 0x1
	set	0x62, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i1
	sll	%i7,	0x09,	%g4
	brgz,a	%o7,	loop_348
	fmul8sux16	%f16,	%f2,	%f2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l3
loop_348:
	umul	%g6,	0x16A6,	%l6
	movle	%icc,	%i3,	%g1
	fpadd32	%f8,	%f18,	%f2
	movrgez	%g3,	0x32A,	%l0
	bcs,a	loop_349
	udiv	%g2,	0x0BA5,	%o0
	fbg	%fcc1,	loop_350
	fmovscs	%xcc,	%f24,	%f23
loop_349:
	srl	%l5,	%o6,	%g5
	fcmpgt16	%f6,	%f10,	%i5
loop_350:
	umulcc	%i6,	%o1,	%i0
	edge32ln	%i2,	%l1,	%o3
	fandnot1	%f8,	%f26,	%f8
	fmovdleu	%xcc,	%f28,	%f2
	bneg,a	loop_351
	fcmple32	%f6,	%f20,	%o4
	fandnot2	%f6,	%f0,	%f28
	udivx	%l2,	0x1FCA,	%o5
loop_351:
	ldstub	[%l7 + 0x18],	%o2
	xor	%l4,	%g7,	%i1
	tneg	%xcc,	0x2
	movcs	%xcc,	%i4,	%g4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x7D] %asi,	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%l3
	xor	%l6,	%i3,	%g1
	set	0x4C, %l0
	sta	%f28,	[%l7 + %l0] 0x11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %i7
	stxa	%g6,	[%l7 + %i7] 0x80
	fbule,a	%fcc2,	loop_352
	mulscc	%g3,	0x1933,	%l0
	movpos	%xcc,	%o0,	%g2
	tleu	%xcc,	0x6
loop_352:
	fornot1	%f2,	%f20,	%f30
	addc	%l5,	%o6,	%i5
	fcmple16	%f26,	%f20,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a,pt	%xcc,	loop_353
	fnot2	%f2,	%f0
	bge,pn	%xcc,	loop_354
	membar	0x02
loop_353:
	edge16l	%i6,	%o1,	%i0
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x24,	%l0
loop_354:
	fxor	%f28,	%f2,	%f4
	movrlez	%i2,	0x049,	%o3
	sir	0x1CCE
	brgz,a	%l2,	loop_355
	edge32	%o4,	%o5,	%l4
	fblg,a	%fcc3,	loop_356
	fbe,a	%fcc0,	loop_357
loop_355:
	edge32l	%g7,	%i1,	%i4
	fmovdneg	%icc,	%f20,	%f9
loop_356:
	nop
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x81,	%o2
loop_357:
	tvs	%xcc,	0x6
	movvc	%xcc,	%i7,	%g4
	movrgz	%l3,	0x39E,	%l6
	fba	%fcc0,	loop_358
	tvs	%xcc,	0x4
	tneg	%xcc,	0x7
	ldsw	[%l7 + 0x2C],	%i3
loop_358:
	movge	%xcc,	%o7,	%g6
	mova	%xcc,	%g3,	%g1
	fmovdn	%xcc,	%f12,	%f26
	tg	%icc,	0x1
	fmovdne	%icc,	%f13,	%f18
	tvs	%icc,	0x2
	add	%o0,	%l0,	%l5
	alignaddrl	%g2,	%i5,	%g5
	fandnot2	%f14,	%f12,	%f10
	std	%o6,	[%l7 + 0x50]
	bge,a	%icc,	loop_359
	fmovde	%icc,	%f30,	%f27
	move	%xcc,	%i6,	%i0
	sdiv	%o1,	0x12D4,	%i2
loop_359:
	sdivcc	%l1,	0x1A52,	%l2
	bg,a,pt	%icc,	loop_360
	sethi	0x1CE0,	%o3
	orcc	%o4,	%l4,	%g7
	orncc	%i1,	0x0CA3,	%i4
loop_360:
	tle	%xcc,	0x7
	fcmpgt16	%f26,	%f2,	%o5
	fnot1s	%f14,	%f31
	movge	%icc,	%o2,	%g4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%l3
	movg	%icc,	%i3,	%o7
	alignaddr	%g6,	%l6,	%g3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%o0
	movneg	%icc,	%l5,	%l0
	fmovrsne	%i5,	%f21,	%f27
	fbge,a	%fcc3,	loop_361
	umulcc	%g2,	0x0F71,	%o6
	sllx	%g5,	0x0B,	%i0
	fblg,a	%fcc2,	loop_362
loop_361:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i6,	0x18D,	%i2
	move	%xcc,	%l1,	%o1
loop_362:
	tcs	%xcc,	0x7
	tvs	%xcc,	0x1
	fmul8sux16	%f8,	%f14,	%f24
	movge	%xcc,	%o3,	%o4
	fpackfix	%f30,	%f0
	fmovrdgz	%l4,	%f8,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l2,	%i1,	%g7
	xorcc	%i4,	%o2,	%o5
	set	0x40, %g5
	stda	%i6,	[%l7 + %g5] 0xea
	membar	#Sync
	edge16ln	%l3,	%i3,	%o7
	edge16	%g4,	%l6,	%g6
	movpos	%xcc,	%g1,	%o0
	fnot1	%f24,	%f30
	sdivcc	%g3,	0x0DD2,	%l5
	xnor	%i5,	%g2,	%l0
	fcmpd	%fcc2,	%f30,	%f8
	movne	%xcc,	%o6,	%i0
	movle	%xcc,	%i6,	%i2
	orncc	%l1,	%o1,	%o3
	movrgez	%o4,	%l4,	%g5
	fones	%f28
	movcs	%xcc,	%l2,	%g7
	alignaddrl	%i4,	%i1,	%o2
	ble,a,pt	%xcc,	loop_363
	xnor	%o5,	0x15CB,	%i7
	fnors	%f8,	%f30,	%f19
	edge32ln	%l3,	%i3,	%o7
loop_363:
	srlx	%l6,	0x09,	%g4
	brnz,a	%g1,	loop_364
	taddcc	%o0,	0x1F88,	%g3
	mova	%xcc,	%l5,	%i5
	movn	%xcc,	%g6,	%g2
loop_364:
	tvs	%xcc,	0x2
	popc	%o6,	%l0
	addccc	%i6,	0x1F98,	%i0
	andncc	%i2,	%l1,	%o1
	fpadd32	%f16,	%f28,	%f0
	array16	%o4,	%o3,	%l4
	srlx	%g5,	%g7,	%i4
	movl	%xcc,	%i1,	%l2
	ta	%icc,	0x4
	movge	%icc,	%o2,	%i7
	ble,a,pn	%icc,	loop_365
	ld	[%l7 + 0x44],	%f12
	popc	%o5,	%l3
	movre	%i3,	0x159,	%l6
loop_365:
	edge32	%o7,	%g4,	%o0
	edge32ln	%g3,	%g1,	%l5
	set	0x74, %o1
	ldsha	[%l7 + %o1] 0x88,	%i5
	tl	%xcc,	0x1
	bgu,a	%icc,	loop_366
	sdiv	%g2,	0x0266,	%g6
	bg,a,pt	%icc,	loop_367
	movrlez	%o6,	%i6,	%i0
loop_366:
	ldub	[%l7 + 0x64],	%l0
	fabss	%f31,	%f5
loop_367:
	andn	%i2,	0x0DEA,	%o1
	udivx	%l1,	0x1A97,	%o3
	andn	%l4,	0x14B6,	%o4
	fxnor	%f8,	%f28,	%f0
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g7
	tge	%xcc,	0x4
	fexpand	%f28,	%f16
	srax	%i4,	0x12,	%g5
	mulx	%i1,	0x1E9C,	%o2
	tvs	%icc,	0x0
	sethi	0x0CFF,	%i7
	siam	0x7
	movn	%xcc,	%o5,	%l2
	fmovsne	%xcc,	%f11,	%f5
	movneg	%xcc,	%l3,	%l6
	srlx	%i3,	0x1A,	%g4
	fbug	%fcc3,	loop_368
	edge16n	%o7,	%g3,	%o0
	fba	%fcc0,	loop_369
	fcmpes	%fcc1,	%f25,	%f25
loop_368:
	te	%xcc,	0x4
	tl	%icc,	0x7
loop_369:
	addccc	%l5,	0x0C63,	%i5
	edge8ln	%g1,	%g2,	%o6
	sdivcc	%g6,	0x0144,	%i0
	ldd	[%l7 + 0x10],	%l0
	andcc	%i2,	%i6,	%o1
	sllx	%o3,	0x13,	%l4
	wr	%g0,	0xe3,	%asi
	stha	%l1,	[%l7 + 0x6E] %asi
	membar	#Sync
	be,a,pt	%xcc,	loop_370
	fmovsneg	%xcc,	%f7,	%f8
	movvs	%icc,	%g7,	%o4
	orcc	%i4,	0x05E3,	%g5
loop_370:
	edge32n	%o2,	%i7,	%i1
	fmovsleu	%xcc,	%f23,	%f2
	fmovrsgez	%l2,	%f3,	%f23
	tvc	%xcc,	0x6
	call	loop_371
	orcc	%l3,	0x03C4,	%o5
	edge32ln	%i3,	%l6,	%g4
	bcs,a	loop_372
loop_371:
	fornot1	%f12,	%f10,	%f22
	fcmpne32	%f14,	%f10,	%g3
	srlx	%o0,	0x0F,	%o7
loop_372:
	movge	%xcc,	%l5,	%g1
	fbn	%fcc3,	loop_373
	fxor	%f28,	%f20,	%f26
	alignaddrl	%i5,	%o6,	%g2
	fxor	%f20,	%f4,	%f6
loop_373:
	edge32l	%i0,	%l0,	%i2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x18] %asi,	%i6
	fornot2	%f26,	%f8,	%f12
	udivcc	%o1,	0x07DC,	%o3
	fmovsg	%icc,	%f14,	%f31
	tne	%xcc,	0x4
	taddcctv	%l4,	0x071C,	%g6
	tg	%icc,	0x7
	fxnor	%f6,	%f16,	%f4
	fpmerge	%f27,	%f0,	%f2
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x15,	 0x2
	orncc	%o4,	%i4,	%g7
	addcc	%g5,	%i7,	%i1
	fmovsleu	%icc,	%f11,	%f24
	edge16	%l2,	%o2,	%l3
	wr	%g0,	0x18,	%asi
	sta	%f6,	[%l7 + 0x40] %asi
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x80,	%o4
	edge32l	%i3,	%g4,	%l6
	fxnor	%f30,	%f26,	%f14
	umulcc	%o0,	%g3,	%l5
	fcmple32	%f16,	%f2,	%g1
	fcmpeq16	%f14,	%f26,	%o7
	edge32l	%o6,	%i5,	%g2
	addccc	%i0,	0x1C57,	%l0
	orncc	%i2,	0x19BB,	%o1
	sub	%o3,	%i6,	%l4
	movvc	%xcc,	%g6,	%o4
	array32	%i4,	%l1,	%g5
	movrgez	%i7,	%i1,	%g7
	sllx	%o2,	0x09,	%l2
	fbule	%fcc2,	loop_374
	prefetch	[%l7 + 0x20],	 0x2
	sdivx	%o5,	0x01BD,	%i3
	sdivx	%l3,	0x1F69,	%l6
loop_374:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%o0
	smulcc	%g3,	0x14CE,	%g4
	fnor	%f18,	%f14,	%f20
	fnors	%f24,	%f0,	%f20
	movn	%icc,	%l5,	%o7
	movrlez	%o6,	0x061,	%i5
	edge32l	%g1,	%i0,	%l0
	udivx	%i2,	0x1D92,	%g2
	set	0x45, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i6
	tvs	%icc,	0x6
	brnz,a	%o1,	loop_375
	tleu	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l4,	0x18,	%o4
loop_375:
	lduw	[%l7 + 0x44],	%i4
	alignaddrl	%l1,	%g5,	%i7
	mulx	%i1,	%g6,	%o2
	fpadd32	%f30,	%f2,	%f20
	movl	%icc,	%g7,	%o5
	fmovda	%xcc,	%f9,	%f2
	fmovsle	%xcc,	%f12,	%f10
	fxors	%f18,	%f1,	%f18
	movg	%xcc,	%i3,	%l3
	nop
	setx loop_376, %l0, %l1
	jmpl %l1, %l2
	array32	%l6,	%o0,	%g3
	set	0x4C, %i0
	swapa	[%l7 + %i0] 0x81,	%g4
loop_376:
	nop
	setx loop_377, %l0, %l1
	jmpl %l1, %o7
	fzero	%f12
	fnor	%f16,	%f30,	%f12
	edge8n	%o6,	%i5,	%g1
loop_377:
	ldx	[%l7 + 0x20],	%l5
	tleu	%icc,	0x4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%l0
	fbue,a	%fcc1,	loop_378
	ble,a,pn	%xcc,	loop_379
	fcmpd	%fcc3,	%f22,	%f12
	edge16ln	%g2,	%i2,	%i6
loop_378:
	xnorcc	%o1,	0x14FD,	%l4
loop_379:
	orcc	%o4,	%i4,	%o3
	array16	%g5,	%i7,	%l1
	set	0x3E, %i2
	stha	%i1,	[%l7 + %i2] 0x89
	taddcc	%o2,	0x0093,	%g7
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g6
	edge32	%o5,	%l3,	%l2
	edge32ln	%l6,	%i3,	%o0
	fmovrdgez	%g4,	%f16,	%f22
	movn	%icc,	%o7,	%g3
	bpos,a	%xcc,	loop_380
	bne,a	%icc,	loop_381
	fmovrdlez	%i5,	%f10,	%f16
	tvs	%icc,	0x6
loop_380:
	fmovdne	%icc,	%f30,	%f4
loop_381:
	stb	%o6,	[%l7 + 0x14]
	tleu	%xcc,	0x0
	fzero	%f10
	fpack32	%f14,	%f24,	%f12
	fba,a	%fcc1,	loop_382
	movrne	%g1,	0x1C8,	%i0
	andcc	%l0,	0x152B,	%l5
	set	0x12, %o3
	ldsha	[%l7 + %o3] 0x11,	%i2
loop_382:
	fmuld8ulx16	%f8,	%f9,	%f0
	mova	%icc,	%i6,	%g2
	sethi	0x1ABD,	%o1
	fcmped	%fcc2,	%f16,	%f6
	tsubcctv	%l4,	0x123F,	%i4
	movl	%icc,	%o3,	%o4
	fexpand	%f13,	%f18
	movg	%xcc,	%g5,	%l1
	brlez,a	%i1,	loop_383
	fblg	%fcc0,	loop_384
	fmovsvs	%xcc,	%f4,	%f5
	addc	%i7,	0x059F,	%g7
loop_383:
	alignaddrl	%g6,	%o2,	%l3
loop_384:
	fpsub16s	%f3,	%f12,	%f31
	tge	%icc,	0x3
	set	0x48, %l2
	stda	%l2,	[%l7 + %l2] 0x80
	bneg	loop_385
	sllx	%l6,	0x01,	%i3
	orn	%o5,	%o0,	%g4
	fmovsvs	%xcc,	%f3,	%f6
loop_385:
	fbule,a	%fcc3,	loop_386
	edge32	%o7,	%i5,	%o6
	stx	%g1,	[%l7 + 0x78]
	bg,a,pn	%xcc,	loop_387
loop_386:
	fandnot1	%f6,	%f16,	%f12
	swap	[%l7 + 0x40],	%g3
	move	%icc,	%l0,	%l5
loop_387:
	tsubcc	%i0,	0x1F7F,	%i6
	fones	%f8
	st	%f22,	[%l7 + 0x6C]
	nop
	setx	loop_388,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%g2,	0x0E73,	%o1
	movne	%xcc,	%i2,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_388:
	nop
	set	0x18, %g1
	lda	[%l7 + %g1] 0x81,	%f30
	sll	%l4,	0x1C,	%o4
	orn	%o3,	%l1,	%g5
	edge32ln	%i1,	%g7,	%i7
	ldsb	[%l7 + 0x30],	%o2
	movge	%xcc,	%l3,	%g6
	fsrc1s	%f24,	%f22
	umul	%l6,	%l2,	%i3
	xnorcc	%o0,	0x142A,	%o5
	tne	%icc,	0x5
	fbuge	%fcc0,	loop_389
	tneg	%xcc,	0x1
	bn,a	%xcc,	loop_390
	fmovsvs	%xcc,	%f6,	%f8
loop_389:
	nop
	setx loop_391, %l0, %l1
	jmpl %l1, %o7
	movrlz	%i5,	0x014,	%o6
loop_390:
	fxors	%f18,	%f19,	%f28
	bn,a,pt	%xcc,	loop_392
loop_391:
	movrlez	%g1,	0x052,	%g4
	movre	%g3,	0x154,	%l0
	movrlz	%i0,	%i6,	%l5
loop_392:
	ldd	[%l7 + 0x58],	%g2
	movg	%icc,	%i2,	%o1
	subc	%i4,	%o4,	%l4
	tl	%xcc,	0x1
	fmovrsgz	%o3,	%f27,	%f14
	flush	%l7 + 0x20
	bcs	%xcc,	loop_393
	ldd	[%l7 + 0x28],	%g4
	tl	%xcc,	0x5
	andncc	%l1,	%g7,	%i1
loop_393:
	movrlez	%o2,	%i7,	%l3
	fnot2s	%f14,	%f31
	fxors	%f6,	%f4,	%f0
	fmovsa	%icc,	%f24,	%f23
	fbuge,a	%fcc3,	loop_394
	fmovrdgz	%l6,	%f4,	%f10
	fbn	%fcc2,	loop_395
	ldd	[%l7 + 0x78],	%f12
loop_394:
	fmovdne	%xcc,	%f5,	%f8
	movpos	%icc,	%g6,	%i3
loop_395:
	fnot1	%f2,	%f6
	set	0x210, %g4
	stxa	%o0,	[%g0 + %g4] 0x52
	movvs	%icc,	%l2,	%o7
	fnot2	%f28,	%f18
	brlez,a	%o5,	loop_396
	movn	%icc,	%i5,	%g1
	fpadd32	%f20,	%f10,	%f2
	movcs	%xcc,	%g4,	%o6
loop_396:
	xnorcc	%l0,	%i0,	%g3
	xor	%i6,	%g2,	%l5
	movvc	%xcc,	%o1,	%i4
	orncc	%i2,	%l4,	%o3
	sra	%g5,	0x1E,	%o4
	movvc	%xcc,	%l1,	%i1
	fpadd16s	%f7,	%f23,	%f15
	sdivx	%o2,	0x0D09,	%i7
	fcmpeq32	%f4,	%f10,	%g7
	set	0x38, %l4
	ldxa	[%l7 + %l4] 0x81,	%l6
	sll	%g6,	0x07,	%l3
	subccc	%o0,	0x13A7,	%i3
	udivcc	%l2,	0x0A6A,	%o5
	sth	%o7,	[%l7 + 0x72]
	fmovsvs	%icc,	%f18,	%f10
	addccc	%g1,	0x06CB,	%g4
	sub	%i5,	0x080C,	%l0
	fmovsne	%icc,	%f22,	%f6
	movneg	%icc,	%i0,	%g3
	fbo	%fcc1,	loop_397
	srax	%i6,	0x12,	%o6
	tleu	%xcc,	0x3
	fbug	%fcc1,	loop_398
loop_397:
	bpos,a,pn	%icc,	loop_399
	array16	%l5,	%o1,	%g2
	sir	0x025A
loop_398:
	movrne	%i2,	%l4,	%i4
loop_399:
	alignaddr	%g5,	%o3,	%o4
	stb	%l1,	[%l7 + 0x14]
	fmuld8sux16	%f27,	%f21,	%f24
	and	%o2,	0x1048,	%i1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x38] %asi,	%f9
	fmul8x16	%f16,	%f24,	%f8
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x10
	sdivx	%g7,	0x1D18,	%i7
	fbule	%fcc3,	loop_400
	fmovdpos	%icc,	%f9,	%f24
	edge32n	%l6,	%g6,	%o0
	tvc	%icc,	0x2
loop_400:
	tgu	%icc,	0x0
	fsrc1s	%f23,	%f21
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l3
	fmul8x16au	%f21,	%f10,	%f16
	srax	%i3,	%l2,	%o5
	movrgz	%o7,	0x353,	%g4
	move	%xcc,	%i5,	%g1
	ldd	[%l7 + 0x78],	%i0
	fcmple32	%f16,	%f28,	%l0
	tcs	%xcc,	0x2
	udiv	%i6,	0x177C,	%g3
	fxnors	%f7,	%f4,	%f12
	fmovdne	%xcc,	%f30,	%f16
	bgu	%icc,	loop_401
	call	loop_402
	and	%l5,	0x1833,	%o6
	movrne	%o1,	%g2,	%i2
loop_401:
	tsubcc	%l4,	%i4,	%o3
loop_402:
	tg	%icc,	0x1
	ldsb	[%l7 + 0x73],	%o4
	movle	%icc,	%g5,	%o2
	fmovsge	%icc,	%f21,	%f24
	subcc	%i1,	0x15F4,	%g7
	bcc,a	loop_403
	xor	%i7,	%l1,	%l6
	set	0x30, %i6
	stda	%g6,	[%l7 + %i6] 0xeb
	membar	#Sync
loop_403:
	subcc	%l3,	0x1F04,	%i3
	fornot1s	%f18,	%f22,	%f2
	tle	%icc,	0x1
	sra	%l2,	%o0,	%o7
	fbn,a	%fcc0,	loop_404
	brgez	%g4,	loop_405
	bshuffle	%f30,	%f6,	%f12
	fbue	%fcc0,	loop_406
loop_404:
	movcs	%icc,	%i5,	%g1
loop_405:
	xnorcc	%o5,	0x102B,	%l0
	ta	%icc,	0x2
loop_406:
	fabsd	%f26,	%f24
	alignaddrl	%i6,	%g3,	%i0
	fornot1	%f6,	%f4,	%f16
	edge8l	%o6,	%o1,	%g2
	edge16n	%i2,	%l5,	%i4
	tcc	%icc,	0x2
	for	%f20,	%f0,	%f16
	std	%f10,	[%l7 + 0x60]
	sth	%l4,	[%l7 + 0x42]
	fornot2	%f18,	%f28,	%f10
	fornot2	%f14,	%f18,	%f24
	tneg	%xcc,	0x1
	fmovde	%icc,	%f29,	%f25
	ldd	[%l7 + 0x10],	%f12
	ldstub	[%l7 + 0x4C],	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g5,	%o2
	fpadd16	%f22,	%f10,	%f26
	addcc	%o4,	0x1E5D,	%g7
	movcc	%icc,	%i7,	%l1
	fand	%f26,	%f0,	%f28
	mulscc	%l6,	%i1,	%l3
	flush	%l7 + 0x1C
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x81
	set	0x60, %g2
	ldda	[%l7 + %g2] 0xeb,	%g6
	movre	%l2,	%i3,	%o0
	edge32l	%o7,	%i5,	%g1
	alignaddr	%g4,	%l0,	%i6
	fbl	%fcc2,	loop_407
	lduw	[%l7 + 0x48],	%o5
	fbul,a	%fcc2,	loop_408
	movvc	%icc,	%i0,	%o6
loop_407:
	tcs	%xcc,	0x6
	fmovdleu	%icc,	%f19,	%f14
loop_408:
	mulx	%o1,	%g3,	%g2
	fand	%f12,	%f0,	%f24
	tpos	%xcc,	0x5
	movrgez	%l5,	0x3C5,	%i2
	fexpand	%f11,	%f18
	fmovs	%f28,	%f18
	movrlz	%l4,	0x285,	%i4
	bgu	loop_409
	membar	0x41
	membar	0x29
	subc	%g5,	%o2,	%o4
loop_409:
	fbul	%fcc3,	loop_410
	movl	%xcc,	%g7,	%o3
	stbar
	umulcc	%i7,	%l1,	%l6
loop_410:
	brgz	%i1,	loop_411
	bne,pt	%icc,	loop_412
	alignaddrl	%g6,	%l3,	%l2
	smulcc	%i3,	%o7,	%i5
loop_411:
	fpadd32s	%f0,	%f13,	%f3
loop_412:
	fmovda	%icc,	%f29,	%f15
	fble	%fcc2,	loop_413
	fmovse	%xcc,	%f6,	%f2
	fmovscs	%xcc,	%f28,	%f13
	edge16	%g1,	%g4,	%o0
loop_413:
	ta	%xcc,	0x7
	fxor	%f30,	%f6,	%f0
	fexpand	%f15,	%f10
	ldub	[%l7 + 0x67],	%l0
	sir	0x11E4
	membar	0x15
	sdiv	%o5,	0x0943,	%i0
	srlx	%o6,	0x03,	%i6
	tgu	%xcc,	0x6
	nop
	set	0x3D, %l6
	stb	%o1,	[%l7 + %l6]
	fcmple16	%f28,	%f26,	%g3
	tg	%xcc,	0x4
	movn	%icc,	%g2,	%i2
	movne	%xcc,	%l4,	%i4
	udivx	%g5,	0x036E,	%o2
	movg	%icc,	%l5,	%g7
	movne	%icc,	%o4,	%i7
	movre	%o3,	%l6,	%i1
	nop
	setx	loop_414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%g6,	%l1,	%l2
	sir	0x0E2E
	sllx	%l3,	0x07,	%i3
loop_414:
	std	%o6,	[%l7 + 0x08]
	fpack32	%f26,	%f30,	%f30
	bne,a	loop_415
	andcc	%g1,	0x02CE,	%i5
	fsrc2s	%f15,	%f14
	sdiv	%g4,	0x10D3,	%l0
loop_415:
	stx	%o5,	[%l7 + 0x40]
	taddcc	%o0,	0x0351,	%o6
	movgu	%xcc,	%i0,	%i6
	fnegd	%f20,	%f0
	fcmps	%fcc3,	%f14,	%f8
	fpadd32	%f22,	%f14,	%f30
	fandnot2	%f18,	%f2,	%f18
	bge,a,pt	%icc,	loop_416
	fmuld8ulx16	%f12,	%f9,	%f14
	movl	%icc,	%g3,	%o1
	tvc	%xcc,	0x6
loop_416:
	fmovd	%f10,	%f8
	tpos	%xcc,	0x2
	subccc	%i2,	0x1A21,	%l4
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tl	%icc,	0x1
	andcc	%i4,	%g2,	%g5
	edge8n	%l5,	%o2,	%g7
	fmovrslez	%o4,	%f29,	%f23
	fmovdpos	%xcc,	%f11,	%f11
	fmovsgu	%xcc,	%f22,	%f0
	brgz,a	%o3,	loop_417
	movcs	%xcc,	%l6,	%i7
	andn	%g6,	0x0F08,	%l1
	brgz	%l2,	loop_418
loop_417:
	popc	0x00BF,	%i1
	xor	%l3,	%o7,	%g1
	movneg	%icc,	%i5,	%g4
loop_418:
	subc	%i3,	0x0D82,	%o5
	bpos,a,pn	%icc,	loop_419
	edge16	%l0,	%o6,	%i0
	fba,a	%fcc2,	loop_420
	fbule	%fcc2,	loop_421
loop_419:
	ld	[%l7 + 0x70],	%f11
	tneg	%xcc,	0x3
loop_420:
	tg	%xcc,	0x6
loop_421:
	movne	%xcc,	%i6,	%g3
	movrgz	%o1,	0x17E,	%o0
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i2
	fabsd	%f0,	%f30
	fcmple16	%f26,	%f2,	%l4
	popc	%i4,	%g5
	tg	%icc,	0x7
	edge16ln	%g2,	%o2,	%l5
	fcmps	%fcc2,	%f27,	%f23
	te	%xcc,	0x7
	mulscc	%g7,	%o4,	%o3
	fcmpd	%fcc2,	%f10,	%f30
	tne	%xcc,	0x4
	fcmpne32	%f24,	%f16,	%i7
	fone	%f30
	ldd	[%l7 + 0x38],	%f24
	fmovdg	%xcc,	%f16,	%f27
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x108] %asi,	%l6
	movre	%l1,	0x2FB,	%g6
	ldsw	[%l7 + 0x54],	%l2
	movrgz	%i1,	%l3,	%o7
	be,a	loop_422
	fmovrdlez	%i5,	%f16,	%f18
	tle	%xcc,	0x7
	fexpand	%f8,	%f0
loop_422:
	movrne	%g4,	0x0F2,	%g1
	fmovda	%xcc,	%f9,	%f4
	tcs	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	sta	%f21,	[%l7 + 0x30] %asi
	bgu,pt	%xcc,	loop_423
	fnegd	%f0,	%f4
	edge16n	%i3,	%l0,	%o6
	movge	%xcc,	%i0,	%o5
loop_423:
	fandnot1	%f2,	%f14,	%f28
	movrne	%i6,	%g3,	%o0
	fxors	%f30,	%f12,	%f24
	fnot2	%f4,	%f20
	fbe,a	%fcc0,	loop_424
	fbn	%fcc0,	loop_425
	mulx	%o1,	%i2,	%l4
	udivx	%g5,	0x102E,	%i4
loop_424:
	edge32l	%o2,	%g2,	%l5
loop_425:
	smul	%g7,	0x0914,	%o3
	smul	%i7,	0x003F,	%l6
	fsrc1s	%f20,	%f23
	srax	%l1,	%g6,	%l2
	sdivcc	%o4,	0x175F,	%i1
	popc	%o7,	%l3
	addcc	%i5,	%g4,	%g1
	brgz	%l0,	loop_426
	fmovdpos	%icc,	%f16,	%f24
	fzero	%f16
	edge8	%o6,	%i3,	%o5
loop_426:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	ldx	[%l7 + 0x48],	%i6
	movn	%xcc,	%o0,	%g3
	sir	0x01D2
	nop
	set	0x50, %i5
	stx	%o1,	[%l7 + %i5]
	srax	%l4,	0x1C,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc1,	loop_427
	xor	%i4,	0x026B,	%o2
	movrlez	%i2,	%g2,	%g7
	edge16	%l5,	%o3,	%i7
loop_427:
	tn	%xcc,	0x7
	ldsh	[%l7 + 0x40],	%l1
	umulcc	%g6,	%l2,	%o4
	orncc	%l6,	0x11FD,	%o7
	srax	%i1,	%l3,	%i5
	subccc	%g1,	%l0,	%o6
	fmul8sux16	%f6,	%f30,	%f24
	edge16	%i3,	%o5,	%g4
	edge16	%i0,	%o0,	%g3
	tge	%icc,	0x6
	fmovdpos	%icc,	%f13,	%f18
	umul	%i6,	0x0726,	%o1
	fcmple16	%f6,	%f4,	%g5
	andncc	%l4,	%i4,	%i2
	xor	%o2,	0x071C,	%g2
	tn	%icc,	0x0
	edge16n	%l5,	%g7,	%o3
	addccc	%l1,	0x1902,	%i7
	bne,pt	%xcc,	loop_428
	sll	%l2,	%o4,	%g6
	bgu,a,pt	%xcc,	loop_429
	sth	%l6,	[%l7 + 0x60]
loop_428:
	and	%i1,	0x1C97,	%o7
	fmovdcc	%icc,	%f29,	%f12
loop_429:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%i5
	bcs,a,pn	%xcc,	loop_430
	fandnot1s	%f17,	%f16,	%f0
	smulcc	%g1,	0x1466,	%l0
	fcmple16	%f26,	%f0,	%l3
loop_430:
	edge16l	%o6,	%i3,	%o5
	fornot2	%f30,	%f24,	%f30
	smulcc	%g4,	%i0,	%g3
	add	%o0,	%i6,	%g5
	fmovrslz	%o1,	%f11,	%f15
	fmovscc	%xcc,	%f8,	%f15
	movleu	%icc,	%l4,	%i2
	fcmpgt32	%f24,	%f16,	%i4
	set	0x36, %o2
	ldsha	[%l7 + %o2] 0x14,	%g2
	tcs	%xcc,	0x0
	orn	%l5,	%o2,	%o3
	xnorcc	%g7,	%l1,	%i7
	edge8ln	%l2,	%g6,	%o4
	fmovrslz	%i1,	%f15,	%f3
	fmul8x16	%f1,	%f2,	%f0
	mova	%xcc,	%l6,	%i5
	ldsb	[%l7 + 0x32],	%o7
	sethi	0x01AA,	%g1
	fmovsgu	%icc,	%f16,	%f2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l3
	std	%f2,	[%l7 + 0x48]
	bg,pn	%icc,	loop_431
	tne	%icc,	0x4
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%o6
	movne	%xcc,	%l0,	%o5
loop_431:
	tvs	%xcc,	0x6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g4
	bcc	%xcc,	loop_432
	brlez,a	%i3,	loop_433
	fmovdg	%icc,	%f19,	%f26
	edge8n	%g3,	%o0,	%i0
loop_432:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x19,	%i6,	%g5
loop_433:
	edge32l	%l4,	%o1,	%i2
	udivcc	%i4,	0x0269,	%g2
	movcc	%icc,	%l5,	%o3
	alignaddrl	%o2,	%l1,	%i7
	sllx	%l2,	%g7,	%g6
	array32	%i1,	%l6,	%o4
	fcmpgt16	%f4,	%f8,	%o7
	andncc	%i5,	%l3,	%o6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x18] %asi,	%g1
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	subccc	%g4,	0x1316,	%i3
	siam	0x7
	tn	%icc,	0x1
	udivx	%g3,	0x1E66,	%o0
	popc	%o5,	%i6
	wr	%g0,	0x22,	%asi
	stba	%g5,	[%l7 + 0x4B] %asi
	membar	#Sync
	movgu	%xcc,	%i0,	%o1
	tvs	%xcc,	0x3
	movneg	%xcc,	%l4,	%i4
	fbug,a	%fcc2,	loop_434
	smulcc	%g2,	0x083B,	%i2
	and	%l5,	0x11F6,	%o3
	sethi	0x1321,	%o2
loop_434:
	te	%xcc,	0x2
	movneg	%icc,	%i7,	%l1
	fpsub16s	%f19,	%f18,	%f30
	edge8l	%g7,	%l2,	%i1
	popc	%g6,	%o4
	fbug	%fcc3,	loop_435
	orcc	%o7,	0x1686,	%i5
	movrgez	%l6,	%l3,	%g1
	fcmped	%fcc1,	%f2,	%f16
loop_435:
	andn	%o6,	0x07CC,	%l0
	movn	%xcc,	%i3,	%g3
	fmovsne	%xcc,	%f11,	%f25
	addc	%g4,	%o5,	%o0
	fbule,a	%fcc3,	loop_436
	fmovdpos	%icc,	%f23,	%f15
	movle	%icc,	%g5,	%i0
	fcmpgt32	%f28,	%f4,	%o1
loop_436:
	sir	0x08A9
	ba	%xcc,	loop_437
	xorcc	%i6,	%l4,	%i4
	fandnot1s	%f14,	%f16,	%f27
	lduw	[%l7 + 0x18],	%i2
loop_437:
	tsubcc	%l5,	0x086C,	%g2
	tvc	%xcc,	0x6
	set	0x2A, %g7
	ldsba	[%l7 + %g7] 0x10,	%o3
	fpadd16	%f30,	%f20,	%f14
	brlez	%i7,	loop_438
	movre	%o2,	0x2A4,	%g7
	mulscc	%l2,	0x0CD2,	%i1
	movvs	%icc,	%l1,	%o4
loop_438:
	fmovsgu	%xcc,	%f0,	%f28
	fsrc2	%f12,	%f24
	movrlz	%o7,	%i5,	%l6
	fbo	%fcc1,	loop_439
	fornot2	%f18,	%f4,	%f12
	std	%f12,	[%l7 + 0x70]
	orncc	%g6,	%l3,	%g1
loop_439:
	fbge	%fcc2,	loop_440
	bne,pn	%xcc,	loop_441
	addcc	%l0,	0x15E5,	%i3
	addccc	%g3,	0x1FA9,	%o6
loop_440:
	fpsub32s	%f6,	%f3,	%f24
loop_441:
	tgu	%xcc,	0x1
	edge8n	%g4,	%o0,	%o5
	bneg	loop_442
	umulcc	%i0,	%o1,	%i6
	srl	%g5,	0x11,	%i4
	sir	0x0E2F
loop_442:
	bgu,a	loop_443
	movneg	%xcc,	%i2,	%l4
	fpack16	%f4,	%f9
	tvs	%xcc,	0x1
loop_443:
	fbule,a	%fcc3,	loop_444
	subccc	%g2,	%l5,	%o3
	movvc	%icc,	%o2,	%i7
	set	0x44, %o6
	ldswa	[%l7 + %o6] 0x10,	%l2
loop_444:
	mulscc	%i1,	%l1,	%o4
	sdivcc	%g7,	0x1628,	%o7
	orncc	%l6,	0x05F5,	%i5
	edge8n	%l3,	%g6,	%g1
	tn	%xcc,	0x1
	taddcc	%l0,	0x03E1,	%g3
	fbule	%fcc1,	loop_445
	tcs	%xcc,	0x7
	bg,a,pt	%icc,	loop_446
	srlx	%o6,	%g4,	%o0
loop_445:
	orncc	%i3,	0x1D3E,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_446:
	movrne	%o1,	0x172,	%o5
	xorcc	%g5,	%i4,	%i6
	fmuld8sux16	%f29,	%f24,	%f20
	fsrc2s	%f30,	%f30
	ldstub	[%l7 + 0x25],	%l4
	subccc	%g2,	0x012F,	%i2
	fcmpgt16	%f22,	%f18,	%o3
	brlez,a	%o2,	loop_447
	fors	%f17,	%f16,	%f19
	nop
	setx	loop_448,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x64
loop_447:
	fandnot2	%f8,	%f18,	%f2
	ldsh	[%l7 + 0x72],	%l5
loop_448:
	array32	%l2,	%i7,	%i1
	movrlez	%l1,	0x212,	%g7
	sethi	0x17CE,	%o4
	fmovsvc	%icc,	%f18,	%f20
	popc	%o7,	%i5
	edge32ln	%l3,	%g6,	%l6
	set	0x60, %i4
	sta	%f14,	[%l7 + %i4] 0x15
	srax	%g1,	%g3,	%l0
	edge16	%g4,	%o0,	%o6
	bl,pn	%icc,	loop_449
	sra	%i0,	%i3,	%o1
	tgu	%xcc,	0x4
	lduw	[%l7 + 0x70],	%g5
loop_449:
	array32	%o5,	%i6,	%i4
	set	0x48, %l1
	lduha	[%l7 + %l1] 0x88,	%g2
	fornot1s	%f28,	%f20,	%f23
	sdivcc	%l4,	0x1921,	%o3
	movrgz	%o2,	%i2,	%l5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l2,	%i7
	tvs	%icc,	0x0
	addc	%l1,	0x0B9C,	%i1
	wr	%g0,	0x10,	%asi
	stha	%g7,	[%l7 + 0x72] %asi
	movcc	%xcc,	%o7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc3,	loop_450
	fandnot1	%f22,	%f8,	%f14
	edge32l	%l3,	%o4,	%l6
	edge16l	%g1,	%g6,	%g3
loop_450:
	alignaddr	%l0,	%o0,	%o6
	mulx	%g4,	0x0B7C,	%i0
	sll	%i3,	%g5,	%o5
	andn	%i6,	0x16A6,	%i4
	add	%g2,	0x0ABE,	%o1
	edge16l	%o3,	%l4,	%i2
	tvc	%icc,	0x2
	fcmpgt32	%f0,	%f0,	%l5
	xorcc	%l2,	%o2,	%i7
	move	%xcc,	%l1,	%g7
	flush	%l7 + 0x50
	fmovrdgez	%o7,	%f10,	%f8
	taddcc	%i5,	%i1,	%l3
	fcmpeq16	%f28,	%f28,	%o4
	tn	%icc,	0x0
	bn,pn	%xcc,	loop_451
	alignaddr	%l6,	%g1,	%g6
	edge32ln	%l0,	%o0,	%o6
	edge8n	%g3,	%g4,	%i3
loop_451:
	ta	%icc,	0x7
	tne	%xcc,	0x0
	edge32	%i0,	%o5,	%i6
	movvs	%icc,	%i4,	%g5
	fmovspos	%xcc,	%f10,	%f24
	bg	loop_452
	popc	%g2,	%o3
	tgu	%xcc,	0x0
	movl	%xcc,	%l4,	%i2
loop_452:
	tsubcctv	%o1,	0x1008,	%l5
	mova	%icc,	%o2,	%i7
	movn	%xcc,	%l1,	%g7
	tcc	%xcc,	0x1
	fandnot1	%f18,	%f8,	%f12
	tgu	%icc,	0x4
	tne	%xcc,	0x4
	tg	%icc,	0x6
	alignaddr	%l2,	%i5,	%o7
	set	0x20, %o5
	ldswa	[%l7 + %o5] 0x18,	%i1
	fbuge	%fcc0,	loop_453
	bvs	loop_454
	stb	%l3,	[%l7 + 0x15]
	fblg	%fcc0,	loop_455
loop_453:
	tvs	%xcc,	0x1
loop_454:
	subccc	%o4,	%g1,	%l6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x19,	%g6
loop_455:
	edge16l	%l0,	%o6,	%o0
	brz,a	%g3,	loop_456
	brgez	%i3,	loop_457
	stbar
	xnor	%g4,	0x0425,	%i0
loop_456:
	movrgez	%o5,	%i6,	%i4
loop_457:
	sll	%g2,	0x07,	%g5
	sllx	%o3,	0x10,	%l4
	bleu,a,pt	%icc,	loop_458
	edge16	%i2,	%l5,	%o2
	sll	%i7,	0x0F,	%l1
	fbge,a	%fcc0,	loop_459
loop_458:
	ta	%xcc,	0x0
	fmovsa	%xcc,	%f21,	%f5
	bcs,a,pt	%icc,	loop_460
loop_459:
	tcs	%xcc,	0x3
	ta	%xcc,	0x7
	ldub	[%l7 + 0x27],	%o1
loop_460:
	sub	%l2,	%i5,	%g7
	andcc	%o7,	0x0FD6,	%i1
	set	0x4E, %i7
	ldsba	[%l7 + %i7] 0x0c,	%l3
	movg	%xcc,	%o4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g6,	%g1,	%l0
	edge8l	%o0,	%o6,	%g3
	sllx	%i3,	0x0C,	%i0
	fmovrdgz	%o5,	%f2,	%f12
	sdivx	%i6,	0x017C,	%g4
	tneg	%icc,	0x4
	movre	%g2,	%g5,	%i4
	ldsb	[%l7 + 0x20],	%l4
	fmovrse	%i2,	%f12,	%f24
	andn	%o3,	0x0456,	%o2
	fsrc1s	%f3,	%f28
	edge8n	%i7,	%l5,	%o1
	edge32n	%l1,	%l2,	%g7
	orncc	%o7,	%i5,	%i1
	brgz,a	%o4,	loop_461
	ldd	[%l7 + 0x50],	%l2
	bcc,pn	%icc,	loop_462
	bvs,a	%xcc,	loop_463
loop_461:
	mova	%icc,	%l6,	%g6
	edge16ln	%l0,	%o0,	%o6
loop_462:
	addcc	%g1,	%i3,	%g3
loop_463:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%i0
	movle	%xcc,	%i6,	%o5
	fbge,a	%fcc0,	loop_464
	fmovscs	%xcc,	%f19,	%f25
	nop
	setx	loop_465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%f12,	[%l7 + 0x48]
loop_464:
	brnz,a	%g2,	loop_466
	fpadd32	%f12,	%f22,	%f30
loop_465:
	edge16l	%g4,	%i4,	%g5
	smulcc	%i2,	0x03DB,	%l4
loop_466:
	edge32ln	%o3,	%i7,	%o2
	bne,pn	%icc,	loop_467
	andn	%o1,	%l5,	%l2
	brgz,a	%g7,	loop_468
	bcs,pt	%xcc,	loop_469
loop_467:
	brlz	%o7,	loop_470
	movre	%i5,	0x2D1,	%i1
loop_468:
	tpos	%icc,	0x7
loop_469:
	edge8n	%l1,	%l3,	%o4
loop_470:
	fmovdg	%xcc,	%f22,	%f13
	stb	%l6,	[%l7 + 0x31]
	array32	%g6,	%l0,	%o6
	movvs	%icc,	%o0,	%g1
	edge16l	%i3,	%i0,	%g3
	udiv	%o5,	0x04C5,	%g2
	brnz,a	%i6,	loop_471
	umulcc	%i4,	%g5,	%g4
	fmovspos	%xcc,	%f11,	%f22
	set	0x5E, %l0
	stha	%i2,	[%l7 + %l0] 0x10
loop_471:
	edge8	%o3,	%i7,	%l4
	fmovsne	%xcc,	%f13,	%f16
	and	%o2,	0x0202,	%l5
	fbo	%fcc2,	loop_472
	alignaddr	%o1,	%l2,	%g7
	sethi	0x125F,	%i5
	movrlez	%o7,	0x04A,	%i1
loop_472:
	fmul8x16	%f14,	%f28,	%f20
	edge32l	%l1,	%o4,	%l6
	fmovsne	%xcc,	%f28,	%f20
	srax	%l3,	0x0D,	%l0
	bl,pn	%xcc,	loop_473
	udiv	%o6,	0x031E,	%o0
	sll	%g1,	0x1C,	%g6
	set	0x1A, %l5
	stha	%i0,	[%l7 + %l5] 0x89
loop_473:
	fornot1s	%f16,	%f24,	%f22
	fzeros	%f7
	fpack32	%f30,	%f4,	%f16
	tgu	%xcc,	0x4
	edge32l	%g3,	%o5,	%i3
	movcc	%icc,	%i6,	%g2
	array32	%g5,	%i4,	%g4
	nop
	setx	loop_474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%xcc,	%o3,	%i2
	fblg	%fcc2,	loop_475
	movcs	%xcc,	%i7,	%o2
loop_474:
	subc	%l4,	%l5,	%l2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_475:
	movcs	%icc,	%g7,	%i5
	fpackfix	%f2,	%f25
	movpos	%xcc,	%o1,	%o7
	movpos	%xcc,	%i1,	%o4
	tcs	%icc,	0x6
	movrlez	%l6,	0x187,	%l3
	edge8ln	%l1,	%l0,	%o6
	mova	%xcc,	%o0,	%g1
	tge	%xcc,	0x5
	movne	%icc,	%g6,	%g3
	edge32ln	%i0,	%i3,	%o5
	bge,a,pt	%icc,	loop_476
	fnot1s	%f5,	%f15
	fmul8ulx16	%f20,	%f8,	%f10
	ba	loop_477
loop_476:
	prefetch	[%l7 + 0x7C],	 0x2
	edge16l	%i6,	%g2,	%i4
	edge16n	%g4,	%o3,	%g5
loop_477:
	edge16l	%i2,	%o2,	%i7
	alignaddr	%l4,	%l2,	%l5
	sra	%i5,	0x19,	%g7
	tvs	%xcc,	0x1
	ba	%xcc,	loop_478
	subc	%o1,	0x0819,	%i1
	tsubcctv	%o7,	%l6,	%o4
	bg,pn	%xcc,	loop_479
loop_478:
	brgez,a	%l1,	loop_480
	smul	%l3,	0x1300,	%o6
	bgu,a	%icc,	loop_481
loop_479:
	udivcc	%o0,	0x0EA2,	%g1
loop_480:
	fcmple32	%f20,	%f6,	%g6
	tvs	%icc,	0x3
loop_481:
	lduh	[%l7 + 0x4E],	%g3
	move	%xcc,	%l0,	%i3
	fmovsne	%icc,	%f17,	%f0
	edge32	%i0,	%i6,	%o5
	fblg,a	%fcc3,	loop_482
	umulcc	%i4,	0x02A9,	%g2
	tge	%icc,	0x2
	addccc	%g4,	0x05F5,	%g5
loop_482:
	fbn,a	%fcc2,	loop_483
	fbule,a	%fcc0,	loop_484
	tn	%icc,	0x1
	fnot2	%f24,	%f4
loop_483:
	andcc	%i2,	0x0C99,	%o3
loop_484:
	fors	%f11,	%f4,	%f1
	nop
	set	0x28, %g5
	lduh	[%l7 + %g5],	%o2
	bg,a	%xcc,	loop_485
	sdiv	%l4,	0x0744,	%i7
	fbge	%fcc1,	loop_486
	tcs	%icc,	0x0
loop_485:
	edge16l	%l5,	%i5,	%l2
	or	%g7,	0x08E5,	%o1
loop_486:
	stbar
	tn	%icc,	0x4
	tsubcc	%i1,	0x155F,	%l6
	bcs,a,pt	%icc,	loop_487
	taddcc	%o4,	%o7,	%l1
	alignaddrl	%l3,	%o0,	%o6
	te	%xcc,	0x5
loop_487:
	tleu	%icc,	0x7
	edge32n	%g1,	%g6,	%g3
	udivx	%l0,	0x0A1D,	%i3
	sll	%i6,	%o5,	%i4
	smul	%i0,	%g2,	%g4
	fmovrsgez	%i2,	%f4,	%f20
	andn	%o3,	0x07C2,	%o2
	udivcc	%g5,	0x19FF,	%i7
	fmovrslez	%l5,	%f7,	%f13
	set	0x5C, %g6
	lda	[%l7 + %g6] 0x18,	%f25
	srl	%l4,	%l2,	%g7
	ta	%xcc,	0x0
	fpadd32	%f14,	%f6,	%f6
	fcmpgt32	%f12,	%f26,	%i5
	ba,a,pn	%xcc,	loop_488
	movpos	%icc,	%i1,	%l6
	movrlz	%o1,	0x260,	%o7
	brlz	%o4,	loop_489
loop_488:
	srax	%l3,	0x11,	%o0
	brlz	%l1,	loop_490
	tcc	%icc,	0x7
loop_489:
	bleu,a,pt	%xcc,	loop_491
	movrlez	%g1,	0x1EF,	%o6
loop_490:
	movvs	%icc,	%g3,	%g6
	fmul8x16al	%f5,	%f0,	%f24
loop_491:
	array16	%l0,	%i6,	%o5
	subc	%i4,	%i3,	%i0
	tcs	%xcc,	0x0
	fmul8x16au	%f19,	%f3,	%f6
	fbo	%fcc3,	loop_492
	fmovrslz	%g4,	%f26,	%f21
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
loop_492:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%i2,	[%l7 + 0x14] %asi
	tleu	%icc,	0x4
	fmovrsgz	%o3,	%f14,	%f17
	fbg	%fcc0,	loop_493
	edge32	%g5,	%o2,	%i7
	siam	0x5
	xor	%l5,	0x0007,	%l2
loop_493:
	edge16	%l4,	%g7,	%i1
	set	0x0C, %o1
	ldswa	[%l7 + %o1] 0x18,	%l6
	set	0x30, %i1
	ldxa	[%l7 + %i1] 0x11,	%o1
	popc	%o7,	%i5
	te	%icc,	0x5
	movvs	%icc,	%o4,	%o0
	andn	%l3,	0x1E65,	%g1
	array32	%l1,	%g3,	%g6
	edge16l	%o6,	%l0,	%i6
	ble,a,pt	%icc,	loop_494
	taddcctv	%o5,	%i4,	%i0
	movre	%g4,	%i3,	%g2
	tn	%xcc,	0x6
loop_494:
	movpos	%xcc,	%i2,	%g5
	fbule,a	%fcc3,	loop_495
	movvc	%icc,	%o2,	%o3
	brlez	%i7,	loop_496
	tne	%xcc,	0x1
loop_495:
	subccc	%l2,	0x05E0,	%l5
	fabss	%f19,	%f17
loop_496:
	smulcc	%g7,	%l4,	%i1
	tsubcctv	%l6,	0x1C27,	%o1
	fmovsneg	%icc,	%f6,	%f11
	nop
	setx	loop_497,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%i5,	%o4,	%o0
	edge8	%l3,	%o7,	%g1
	ldstub	[%l7 + 0x2F],	%l1
loop_497:
	edge16	%g6,	%o6,	%l0
	brnz	%g3,	loop_498
	movrgz	%o5,	%i6,	%i0
	edge16ln	%g4,	%i3,	%g2
	edge8	%i4,	%g5,	%o2
loop_498:
	sir	0x1EC8
	move	%xcc,	%i2,	%o3
	add	%l2,	0x060A,	%l5
	srax	%g7,	0x0B,	%i7
	lduh	[%l7 + 0x5A],	%l4
	edge16ln	%l6,	%i1,	%i5
	fnot1s	%f20,	%f26
	move	%icc,	%o1,	%o4
	subccc	%l3,	%o0,	%g1
	tleu	%xcc,	0x4
	alignaddrl	%o7,	%g6,	%o6
	tsubcctv	%l1,	%g3,	%l0
	fpack16	%f16,	%f8
	bne,a,pt	%icc,	loop_499
	srlx	%i6,	0x16,	%o5
	taddcc	%g4,	0x1845,	%i0
	fbg	%fcc0,	loop_500
loop_499:
	ble	%xcc,	loop_501
	fmuld8sux16	%f8,	%f19,	%f6
	ldd	[%l7 + 0x28],	%i2
loop_500:
	fmul8x16au	%f29,	%f12,	%f0
loop_501:
	fbo	%fcc2,	loop_502
	tneg	%icc,	0x4
	movcs	%icc,	%g2,	%g5
	smulcc	%i4,	0x0015,	%o2
loop_502:
	edge32n	%i2,	%l2,	%l5
	movle	%xcc,	%o3,	%g7
	tcc	%xcc,	0x5
	fnot2	%f20,	%f26
	set	0x50, %o7
	lduwa	[%l7 + %o7] 0x11,	%i7
	sra	%l6,	%i1,	%i5
	movn	%xcc,	%l4,	%o4
	movn	%icc,	%l3,	%o1
	fbg	%fcc0,	loop_503
	tsubcctv	%o0,	%g1,	%o7
	nop
	set	0x12, %o0
	ldsh	[%l7 + %o0],	%g6
	lduw	[%l7 + 0x0C],	%o6
loop_503:
	tsubcc	%g3,	%l0,	%i6
	bg	loop_504
	xnorcc	%l1,	%g4,	%o5
	sll	%i0,	0x0D,	%i3
	edge8n	%g5,	%i4,	%o2
loop_504:
	fmovde	%icc,	%f27,	%f16
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x24] %asi,	%g2
	fbne,a	%fcc0,	loop_505
	popc	0x1C7C,	%l2
	fbue	%fcc3,	loop_506
	orncc	%l5,	%i2,	%g7
loop_505:
	edge16	%i7,	%o3,	%l6
	fmovsle	%icc,	%f23,	%f5
loop_506:
	sdivx	%i5,	0x1C54,	%i1
	movrgz	%o4,	%l4,	%l3
	srl	%o0,	0x1C,	%o1
	edge16l	%o7,	%g6,	%o6
	bne,a	loop_507
	movrgez	%g3,	0x3A2,	%l0
	andncc	%i6,	%g1,	%l1
	bne	%xcc,	loop_508
loop_507:
	movg	%icc,	%g4,	%o5
	ldsh	[%l7 + 0x22],	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_508:
	tneg	%xcc,	0x4
	movpos	%icc,	%g5,	%i3
	fblg	%fcc1,	loop_509
	tgu	%icc,	0x6
	alignaddr	%o2,	%g2,	%l2
	fcmpeq32	%f22,	%f28,	%i4
loop_509:
	edge16l	%l5,	%g7,	%i2
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x74] %asi,	%o3
	fnot2s	%f24,	%f25
	fmul8x16	%f29,	%f12,	%f14
	tneg	%xcc,	0x6
	addccc	%l6,	0x0708,	%i5
	fmovscs	%icc,	%f25,	%f15
	ldstub	[%l7 + 0x63],	%i1
	fbo,a	%fcc3,	loop_510
	orncc	%o4,	0x0F75,	%l4
	tleu	%xcc,	0x5
	orcc	%i7,	0x109F,	%o0
loop_510:
	sdivcc	%l3,	0x13CA,	%o1
	taddcctv	%g6,	%o7,	%g3
	edge8l	%l0,	%o6,	%i6
	movcs	%xcc,	%g1,	%g4
	tcs	%xcc,	0x4
	orn	%o5,	%l1,	%g5
	tvc	%xcc,	0x0
	set	0x43, %i0
	stba	%i0,	[%l7 + %i0] 0x88
	array32	%i3,	%o2,	%g2
	umul	%i4,	%l5,	%g7
	array32	%l2,	%i2,	%o3
	fcmpeq16	%f4,	%f26,	%l6
	srl	%i5,	0x18,	%o4
	bshuffle	%f28,	%f0,	%f14
	sir	0x1997
	wr	%g0,	0x27,	%asi
	stxa	%i1,	[%l7 + 0x78] %asi
	membar	#Sync
	te	%xcc,	0x4
	movrlez	%l4,	%o0,	%i7
	sir	0x0B8B
	ld	[%l7 + 0x58],	%f28
	addc	%o1,	%l3,	%o7
	fpadd16	%f2,	%f6,	%f12
	fbg,a	%fcc0,	loop_511
	edge16	%g6,	%l0,	%g3
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
loop_511:
	sdiv	%g1,	0x0192,	%i6
	bgu	%icc,	loop_512
	addccc	%g4,	0x0957,	%l1
	membar	0x76
	tg	%xcc,	0x7
loop_512:
	move	%xcc,	%g5,	%o5
	movrlez	%i0,	%o2,	%i3
	nop
	setx loop_513, %l0, %l1
	jmpl %l1, %g2
	fpmerge	%f7,	%f11,	%f10
	fmovdcs	%xcc,	%f4,	%f5
	for	%f26,	%f20,	%f4
loop_513:
	brgz	%l5,	loop_514
	edge8l	%g7,	%l2,	%i2
	movrgz	%o3,	%l6,	%i4
	movcs	%xcc,	%i5,	%o4
loop_514:
	andncc	%i1,	%l4,	%i7
	edge16n	%o1,	%l3,	%o0
	movn	%xcc,	%g6,	%o7
	orn	%l0,	%o6,	%g3
	fmovsn	%icc,	%f22,	%f2
	nop
	setx	loop_515,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%icc,	%g1,	%i6
	fpadd32s	%f20,	%f24,	%f15
	faligndata	%f18,	%f28,	%f2
loop_515:
	fmovrdgez	%g4,	%f2,	%f2
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x81,	%l1
	fbule,a	%fcc2,	loop_516
	orcc	%g5,	%o5,	%i0
	subcc	%i3,	%g2,	%o2
	fbl	%fcc3,	loop_517
loop_516:
	edge16l	%g7,	%l5,	%i2
	bleu,pn	%icc,	loop_518
	movcc	%xcc,	%l2,	%l6
loop_517:
	movne	%xcc,	%i4,	%i5
	tsubcctv	%o4,	%i1,	%l4
loop_518:
	movge	%xcc,	%o3,	%o1
	fmovrdgez	%l3,	%f26,	%f0
	sub	%o0,	%i7,	%g6
	edge16n	%o7,	%l0,	%g3
	edge16ln	%o6,	%i6,	%g4
	edge8ln	%g1,	%l1,	%o5
	xnorcc	%g5,	0x0469,	%i3
	fmovse	%icc,	%f22,	%f31
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i0,	%g2
	ldx	[%l7 + 0x58],	%o2
	fabsd	%f8,	%f0
	udiv	%g7,	0x081C,	%i2
	bl,pt	%xcc,	loop_519
	array16	%l2,	%l5,	%i4
	set	0x24, %l2
	ldsha	[%l7 + %l2] 0x0c,	%l6
loop_519:
	fmovrdne	%o4,	%f6,	%f16
	addccc	%i1,	%i5,	%o3
	movvc	%icc,	%o1,	%l3
	tgu	%icc,	0x1
	srl	%l4,	%o0,	%g6
	sllx	%o7,	%l0,	%i7
	fmovdvc	%icc,	%f1,	%f11
	movcc	%xcc,	%g3,	%o6
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	std	%f18,	[%l7 + 0x40]
	edge16ln	%i6,	%g4,	%g1
	array8	%o5,	%g5,	%i3
	bneg,pn	%icc,	loop_520
	swap	[%l7 + 0x64],	%i0
	fmovdg	%xcc,	%f7,	%f21
	orcc	%l1,	0x0046,	%g2
loop_520:
	bleu,a	loop_521
	movn	%icc,	%o2,	%g7
	srl	%i2,	0x03,	%l2
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f22
loop_521:
	tvc	%xcc,	0x3
	be,pt	%xcc,	loop_522
	ble,a	loop_523
	movrlz	%i4,	%l5,	%l6
	std	%o4,	[%l7 + 0x38]
loop_522:
	array8	%i1,	%o3,	%o1
loop_523:
	sethi	0x109D,	%i5
	movgu	%icc,	%l4,	%l3
	and	%o0,	0x1072,	%o7
	tsubcctv	%g6,	0x1B89,	%l0
	fxnors	%f10,	%f11,	%f7
	brz,a	%i7,	loop_524
	edge8n	%g3,	%i6,	%g4
	umulcc	%g1,	0x1C90,	%o6
	lduh	[%l7 + 0x40],	%g5
loop_524:
	fcmpeq32	%f8,	%f0,	%i3
	fnands	%f10,	%f31,	%f2
	array16	%o5,	%l1,	%g2
	sll	%i0,	0x12,	%o2
	fnors	%f28,	%f8,	%f10
	smul	%i2,	0x1FE7,	%g7
	edge8n	%l2,	%l5,	%i4
	movneg	%icc,	%o4,	%l6
	tgu	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x68] %asi,	%i1
	fmovsge	%xcc,	%f7,	%f0
	tne	%icc,	0x6
	sdivx	%o1,	0x1F89,	%i5
	mulscc	%l4,	%l3,	%o3
	andn	%o7,	%g6,	%l0
	bpos,a,pn	%icc,	loop_525
	andcc	%i7,	%o0,	%i6
	ta	%xcc,	0x5
	sdiv	%g3,	0x182A,	%g4
loop_525:
	xor	%o6,	%g5,	%g1
	wr	%g0,	0x23,	%asi
	stda	%i2,	[%l7 + 0x20] %asi
	membar	#Sync
	tn	%icc,	0x3
	nop
	set	0x0C, %g1
	prefetch	[%l7 + %g1],	 0x2
	sdivx	%l1,	0x0D91,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%g2
	edge8ln	%i2,	%g7,	%o2
	brnz	%l5,	loop_526
	fbne	%fcc1,	loop_527
	mulscc	%i4,	0x1647,	%l2
	brgez	%l6,	loop_528
loop_526:
	subc	%o4,	0x0A53,	%o1
loop_527:
	fbule	%fcc1,	loop_529
	brz,a	%i5,	loop_530
loop_528:
	fnands	%f3,	%f23,	%f24
	fmovsgu	%icc,	%f30,	%f0
loop_529:
	tleu	%icc,	0x4
loop_530:
	bg,pn	%xcc,	loop_531
	fbl,a	%fcc2,	loop_532
	brz,a	%i1,	loop_533
	smulcc	%l4,	%o3,	%l3
loop_531:
	tvc	%xcc,	0x7
loop_532:
	fmul8x16au	%f6,	%f5,	%f18
loop_533:
	sdiv	%o7,	0x0564,	%l0
	stb	%i7,	[%l7 + 0x6A]
	brlz	%o0,	loop_534
	sll	%g6,	0x07,	%g3
	or	%g4,	%o6,	%g5
	move	%icc,	%g1,	%i6
loop_534:
	mova	%xcc,	%i3,	%o5
	xnor	%l1,	0x1D5A,	%g2
	fxor	%f4,	%f14,	%f26
	edge8	%i2,	%i0,	%o2
	fcmpeq32	%f22,	%f22,	%l5
	set	0x58, %g4
	swapa	[%l7 + %g4] 0x0c,	%g7
	movpos	%icc,	%i4,	%l6
	movre	%o4,	%l2,	%i5
	tcs	%xcc,	0x5
	membar	0x7D
	bneg,a	%icc,	loop_535
	te	%xcc,	0x7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x24] %asi,	%i1
loop_535:
	addc	%o1,	0x1465,	%l4
	smulcc	%l3,	0x0651,	%o7
	array32	%o3,	%l0,	%o0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%g3
	brz,a	%g4,	loop_536
	and	%i7,	0x0A6E,	%g5
	mulx	%o6,	0x0934,	%i6
	fzeros	%f15
loop_536:
	sllx	%i3,	%o5,	%g1
	mulx	%l1,	%g2,	%i0
	fmovrdgez	%o2,	%f12,	%f26
	wr	%g0,	0x88,	%asi
	stha	%i2,	[%l7 + 0x08] %asi
	fmovsge	%xcc,	%f19,	%f25
	fabsd	%f26,	%f22
	fmovrsne	%g7,	%f13,	%f29
	srl	%l5,	%l6,	%i4
	array8	%l2,	%i5,	%o4
	swap	[%l7 + 0x60],	%o1
	std	%f18,	[%l7 + 0x20]
	xnorcc	%i1,	0x059B,	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%o7
	fandnot1	%f26,	%f26,	%f30
	andcc	%o3,	0x135F,	%o0
	subccc	%g6,	%g3,	%g4
	tgu	%xcc,	0x0
	movcs	%icc,	%l0,	%i7
	movrgez	%g5,	%i6,	%o6
	pdist	%f18,	%f30,	%f10
	edge8l	%i3,	%o5,	%l1
	movge	%icc,	%g2,	%i0
	edge8ln	%o2,	%i2,	%g1
	tleu	%icc,	0x2
	movgu	%xcc,	%g7,	%l6
	srlx	%l5,	%i4,	%i5
	set	0x2A, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o4
	tg	%icc,	0x3
	fmovdne	%xcc,	%f20,	%f6
	edge8l	%l2,	%o1,	%i1
	sllx	%l3,	0x07,	%l4
	bvc	%xcc,	loop_537
	movcc	%xcc,	%o7,	%o0
	smul	%o3,	%g3,	%g6
	set	0x30, %l3
	ldxa	[%g0 + %l3] 0x50,	%l0
loop_537:
	xorcc	%g4,	0x0F9C,	%i7
	andncc	%g5,	%o6,	%i6
	fcmpgt32	%f6,	%f22,	%o5
	nop
	setx	loop_538,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%i3,	0x1289,	%g2
	fcmple16	%f8,	%f10,	%l1
	bne,a	loop_539
loop_538:
	sllx	%i0,	%o2,	%g1
	tvc	%icc,	0x1
	umul	%i2,	0x05AF,	%l6
loop_539:
	fzero	%f24
	movge	%icc,	%g7,	%i4
	fpadd32	%f0,	%f10,	%f30
	addc	%i5,	0x0A0D,	%l5
	fmovdge	%icc,	%f28,	%f2
	sdivcc	%l2,	0x0104,	%o1
	edge16	%o4,	%l3,	%i1
	bcc,pn	%icc,	loop_540
	bcc,a,pn	%xcc,	loop_541
	edge32n	%l4,	%o7,	%o0
	wr	%g0,	0x88,	%asi
	stba	%g3,	[%l7 + 0x65] %asi
loop_540:
	xnor	%o3,	%l0,	%g4
loop_541:
	stbar
	srax	%g6,	%i7,	%g5
	movgu	%icc,	%o6,	%o5
	tgu	%icc,	0x5
	bne,pn	%icc,	loop_542
	andcc	%i3,	%g2,	%l1
	fors	%f16,	%f15,	%f3
	movrne	%i6,	0x161,	%o2
loop_542:
	fandnot2s	%f11,	%f14,	%f0
	orcc	%g1,	0x051B,	%i0
	fbl,a	%fcc0,	loop_543
	fnegd	%f24,	%f28
	edge16	%i2,	%g7,	%i4
	tne	%xcc,	0x4
loop_543:
	nop
	set	0x68, %g3
	lda	[%l7 + %g3] 0x89,	%f21
	edge32l	%i5,	%l5,	%l2
	addc	%o1,	%l6,	%l3
	or	%o4,	%i1,	%l4
	tne	%icc,	0x4
	fnot1s	%f1,	%f15
	movvs	%icc,	%o0,	%o7
	sll	%o3,	%g3,	%l0
	bl,a,pt	%icc,	loop_544
	subccc	%g4,	0x06FF,	%i7
	ldsw	[%l7 + 0x70],	%g6
	fxor	%f0,	%f24,	%f30
loop_544:
	nop
	set	0x68, %g2
	ldswa	[%l7 + %g2] 0x11,	%g5
	movpos	%icc,	%o6,	%i3
	set	0x53, %i6
	lduba	[%l7 + %i6] 0x11,	%o5
	sir	0x0866
	fandnot2s	%f16,	%f5,	%f5
	fmuld8ulx16	%f14,	%f13,	%f4
	bneg,a,pn	%xcc,	loop_545
	srlx	%g2,	0x00,	%i6
	mulscc	%o2,	%l1,	%g1
	fexpand	%f14,	%f0
loop_545:
	umulcc	%i2,	%i0,	%i4
	mulscc	%i5,	%g7,	%l2
	tge	%icc,	0x3
	srl	%l5,	%o1,	%l6
	movge	%icc,	%o4,	%i1
	fbn,a	%fcc2,	loop_546
	fmovsa	%icc,	%f19,	%f2
	fblg,a	%fcc0,	loop_547
	sllx	%l4,	0x10,	%l3
loop_546:
	tvs	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_547:
	srlx	%o7,	0x18,	%o3
	brlez,a	%g3,	loop_548
	subccc	%l0,	%g4,	%o0
	sdivx	%i7,	0x042E,	%g5
	alignaddr	%g6,	%i3,	%o5
loop_548:
	fmovscs	%xcc,	%f14,	%f9
	fcmpgt16	%f0,	%f30,	%o6
	tle	%xcc,	0x5
	movne	%xcc,	%g2,	%i6
	fxnors	%f13,	%f7,	%f9
	alignaddr	%l1,	%o2,	%i2
	fcmple32	%f0,	%f26,	%i0
	ldd	[%l7 + 0x50],	%f2
	xnor	%i4,	0x1EED,	%i5
	bvc	%icc,	loop_549
	addcc	%g7,	0x1173,	%g1
	edge8n	%l5,	%l2,	%o1
	fcmps	%fcc2,	%f7,	%f26
loop_549:
	movrgez	%o4,	%l6,	%l4
	andcc	%i1,	%o7,	%o3
	mulscc	%l3,	%l0,	%g4
	fabsd	%f10,	%f26
	fbule	%fcc1,	loop_550
	movne	%icc,	%g3,	%i7
	bge,pn	%icc,	loop_551
	srax	%o0,	%g5,	%g6
loop_550:
	tcs	%xcc,	0x2
	tsubcc	%i3,	%o5,	%o6
loop_551:
	prefetch	[%l7 + 0x74],	 0x0
	edge32n	%i6,	%g2,	%o2
	fpmerge	%f0,	%f26,	%f0
	sethi	0x07D7,	%l1
	tneg	%icc,	0x6
	tcc	%icc,	0x1
	alignaddrl	%i2,	%i0,	%i4
	alignaddr	%g7,	%g1,	%l5
	set	0x08, %i5
	ldswa	[%l7 + %i5] 0x89,	%i5
	subc	%l2,	0x0C06,	%o1
	tl	%icc,	0x2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%o4
	orncc	%l6,	%i1,	%o7
	movrlez	%l4,	%o3,	%l0
	set	0x2C, %o2
	lda	[%l7 + %o2] 0x10,	%f4
	tneg	%icc,	0x0
	srlx	%l3,	0x17,	%g4
	tsubcctv	%i7,	%o0,	%g3
	movrlz	%g5,	0x2C0,	%i3
	sdivx	%o5,	0x1C87,	%o6
	tne	%icc,	0x0
	orncc	%i6,	0x16AB,	%g6
	edge16	%o2,	%g2,	%l1
	movne	%icc,	%i0,	%i4
	andn	%g7,	0x0DEE,	%i2
	tgu	%icc,	0x0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l5
	fbne,a	%fcc3,	loop_552
	te	%icc,	0x4
	movpos	%icc,	%i5,	%l2
	edge32n	%o1,	%o4,	%l6
loop_552:
	fzeros	%f6
	srax	%i1,	0x06,	%o7
	addccc	%g1,	%o3,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %l6
	stda	%l4,	[%l7 + %l6] 0x10
	addc	%l3,	0x18FA,	%i7
	nop
	set	0x5A, %o4
	ldstub	[%l7 + %o4],	%o0
	fmovd	%f16,	%f30
	fmovdpos	%xcc,	%f6,	%f7
	tge	%xcc,	0x2
	orcc	%g4,	0x0D81,	%g3
	set	0x68, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g5
	array8	%i3,	%o5,	%i6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x24] %asi,	%g6
	subccc	%o2,	0x004B,	%o6
	brgz,a	%g2,	loop_553
	fmovs	%f0,	%f30
	tsubcctv	%i0,	0x1424,	%l1
	tl	%icc,	0x0
loop_553:
	add	%g7,	%i2,	%i4
	movrlez	%i5,	0x306,	%l2
	set	0x58, %o6
	lduwa	[%l7 + %o6] 0x81,	%l5
	bpos	%xcc,	loop_554
	fmovsvc	%xcc,	%f29,	%f0
	edge32l	%o1,	%l6,	%o4
	ldub	[%l7 + 0x45],	%i1
loop_554:
	fmovdvc	%icc,	%f16,	%f9
	ldsw	[%l7 + 0x1C],	%o7
	wr	%g0,	0x0c,	%asi
	stda	%g0,	[%l7 + 0x38] %asi
	subc	%o3,	0x02DF,	%l4
	array16	%l0,	%l3,	%i7
	edge8l	%o0,	%g3,	%g4
	sdivx	%i3,	0x0C4C,	%o5
	movrgz	%i6,	%g6,	%g5
	fmovsleu	%icc,	%f0,	%f6
	orncc	%o6,	0x0DE3,	%o2
	bvc	%xcc,	loop_555
	stb	%i0,	[%l7 + 0x7E]
	taddcctv	%g2,	%g7,	%l1
	tvc	%xcc,	0x2
loop_555:
	umul	%i2,	%i4,	%i5
	bvs,pn	%xcc,	loop_556
	bneg	%xcc,	loop_557
	movre	%l2,	0x390,	%l5
	movn	%icc,	%l6,	%o4
loop_556:
	tpos	%xcc,	0x1
loop_557:
	mulx	%o1,	0x1AE2,	%o7
	edge16l	%i1,	%g1,	%l4
	array16	%o3,	%l0,	%i7
	movg	%icc,	%l3,	%g3
	fmovdg	%xcc,	%f7,	%f18
	andcc	%o0,	%i3,	%g4
	movrgz	%o5,	0x176,	%i6
	fmul8x16au	%f9,	%f15,	%f8
	fmovrslez	%g5,	%f24,	%f28
	tg	%xcc,	0x3
	st	%f23,	[%l7 + 0x60]
	movne	%icc,	%g6,	%o6
	mova	%icc,	%i0,	%o2
	fxnors	%f22,	%f17,	%f11
	edge16ln	%g2,	%l1,	%i2
	fbe,a	%fcc0,	loop_558
	fmovsne	%xcc,	%f20,	%f27
	fsrc1	%f2,	%f28
	fors	%f22,	%f13,	%f6
loop_558:
	movrlz	%i4,	%g7,	%i5
	bn,a,pn	%icc,	loop_559
	mova	%xcc,	%l5,	%l2
	fors	%f14,	%f29,	%f13
	membar	0x3D
loop_559:
	sub	%l6,	0x14B3,	%o1
	subccc	%o4,	0x0D2F,	%o7
	tpos	%icc,	0x1
	tpos	%xcc,	0x5
	subccc	%i1,	%g1,	%l4
	addcc	%o3,	%i7,	%l0
	subcc	%l3,	%o0,	%i3
	edge32	%g3,	%o5,	%i6
	smul	%g5,	0x146A,	%g4
	tneg	%xcc,	0x4
	set	0x50, %i4
	ldswa	[%l7 + %i4] 0x88,	%g6
	fornot2s	%f5,	%f30,	%f3
	fpackfix	%f4,	%f11
	edge8	%i0,	%o6,	%o2
	edge32ln	%l1,	%i2,	%i4
	movrlez	%g2,	0x3FC,	%g7
	array8	%i5,	%l2,	%l6
	sdivcc	%o1,	0x0D94,	%o4
	movvc	%xcc,	%l5,	%i1
	fornot2	%f6,	%f20,	%f8
	fnor	%f0,	%f8,	%f22
	fbne	%fcc3,	loop_560
	movcs	%xcc,	%o7,	%g1
	edge32	%o3,	%l4,	%i7
	fone	%f8
loop_560:
	tg	%xcc,	0x1
	movpos	%xcc,	%l3,	%l0
	edge8	%i3,	%o0,	%g3
	nop
	setx	loop_561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%icc,	%i6,	%g5
	fandnot1	%f4,	%f8,	%f12
	sra	%g4,	%g6,	%i0
loop_561:
	fmovrdlz	%o5,	%f14,	%f8
	sth	%o6,	[%l7 + 0x6E]
	edge32l	%l1,	%i2,	%o2
	fcmpes	%fcc2,	%f5,	%f9
	fmovrde	%i4,	%f20,	%f14
	addc	%g7,	0x1F00,	%g2
	fmovsle	%xcc,	%f6,	%f29
	fmovrdne	%l2,	%f14,	%f0
	sethi	0x120F,	%l6
	bcc,a	loop_562
	fpadd32s	%f30,	%f13,	%f14
	edge32	%i5,	%o4,	%o1
	xnor	%i1,	0x0789,	%l5
loop_562:
	and	%o7,	0x0804,	%o3
	tsubcc	%l4,	0x1146,	%g1
	fbu,a	%fcc2,	loop_563
	xorcc	%i7,	%l0,	%i3
	taddcc	%o0,	0x0985,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_563:
	stbar
	fandnot2	%f4,	%f2,	%f6
	tg	%xcc,	0x5
	edge8n	%i6,	%g5,	%g4
	fnot1	%f0,	%f20
	ldsh	[%l7 + 0x0A],	%g6
	ta	%icc,	0x6
	subc	%g3,	%o5,	%o6
	bpos,a,pn	%xcc,	loop_564
	tvc	%icc,	0x3
	membar	0x25
	edge32n	%i0,	%i2,	%l1
loop_564:
	bgu	%icc,	loop_565
	srax	%i4,	0x00,	%g7
	xorcc	%o2,	0x1E8A,	%g2
	swap	[%l7 + 0x10],	%l6
loop_565:
	movne	%xcc,	%l2,	%i5
	edge16	%o1,	%i1,	%l5
	and	%o7,	%o4,	%l4
	tpos	%xcc,	0x5
	tsubcctv	%g1,	%o3,	%l0
	andcc	%i3,	%o0,	%i7
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%f30
	edge16n	%l3,	%g5,	%i6
	fba,a	%fcc0,	loop_566
	tleu	%icc,	0x7
	brz,a	%g6,	loop_567
	fble	%fcc3,	loop_568
loop_566:
	sdivcc	%g3,	0x140A,	%g4
	mulscc	%o5,	0x1969,	%o6
loop_567:
	tgu	%xcc,	0x1
loop_568:
	st	%f5,	[%l7 + 0x18]
	andncc	%i2,	%i0,	%l1
	stb	%g7,	[%l7 + 0x50]
	srlx	%i4,	%g2,	%l6
	tle	%icc,	0x4
	movn	%xcc,	%l2,	%o2
	ldsb	[%l7 + 0x0C],	%i5
	fpsub16	%f18,	%f22,	%f18
	wr	%g0,	0x04,	%asi
	stwa	%i1,	[%l7 + 0x6C] %asi
	fmovrse	%l5,	%f23,	%f15
	edge32	%o1,	%o7,	%o4
	fpadd16s	%f14,	%f28,	%f13
	set	0x4B, %o5
	stba	%g1,	[%l7 + %o5] 0x2b
	membar	#Sync
	fmovrdlez	%o3,	%f16,	%f10
	fandnot2	%f6,	%f6,	%f14
	fpadd32s	%f26,	%f19,	%f26
	or	%l0,	0x09FE,	%l4
	fones	%f3
	movrlz	%i3,	0x22D,	%o0
	xnorcc	%i7,	0x0E84,	%g5
	fmovsvs	%icc,	%f12,	%f15
	fcmpne32	%f20,	%f28,	%l3
	ble,a	%icc,	loop_569
	udiv	%g6,	0x08F5,	%g3
	fbu	%fcc2,	loop_570
	tcc	%icc,	0x2
loop_569:
	movre	%g4,	0x17C,	%o5
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_570:
	edge8l	%i6,	%o6,	%i2
	tvs	%xcc,	0x7
	movleu	%icc,	%l1,	%i0
	edge8l	%i4,	%g2,	%l6
	edge32ln	%g7,	%o2,	%i5
	wr	%g0,	0x04,	%asi
	stda	%i0,	[%l7 + 0x70] %asi
	fmovse	%icc,	%f17,	%f16
	tne	%xcc,	0x6
	and	%l5,	%o1,	%o7
	smulcc	%o4,	%g1,	%o3
	tvs	%icc,	0x0
	subcc	%l0,	0x0525,	%l4
	movpos	%xcc,	%l2,	%o0
	tsubcctv	%i7,	%g5,	%i3
	movcc	%icc,	%g6,	%l3
	movne	%icc,	%g4,	%o5
	movpos	%icc,	%i6,	%g3
	edge32l	%o6,	%i2,	%l1
	alignaddrl	%i4,	%i0,	%l6
	movrgez	%g7,	%g2,	%o2
	stbar
	tne	%icc,	0x7
	tpos	%icc,	0x7
	umulcc	%i5,	0x08A6,	%l5
	fmovdne	%xcc,	%f4,	%f4
	edge16n	%o1,	%o7,	%i1
	sir	0x0ABA
	fmovsge	%icc,	%f10,	%f15
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ble,pn	%xcc,	loop_571
	edge8ln	%o4,	%g1,	%o3
	edge8	%l4,	%l2,	%o0
	sub	%i7,	0x0E4C,	%l0
loop_571:
	sdivcc	%g5,	0x1ED0,	%i3
	array8	%l3,	%g6,	%g4
	fmovrsgez	%o5,	%f7,	%f29
	edge16n	%i6,	%g3,	%i2
	fmovdleu	%xcc,	%f3,	%f8
	movleu	%xcc,	%o6,	%l1
	bshuffle	%f16,	%f22,	%f2
	sllx	%i0,	%i4,	%l6
	movg	%xcc,	%g7,	%g2
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
	movg	%icc,	%o2,	%l5
	fmovdge	%xcc,	%f31,	%f6
	movle	%icc,	%i5,	%o7
loop_572:
	fmovdle	%icc,	%f8,	%f27
	xorcc	%i1,	0x1DCD,	%o1
	tneg	%icc,	0x4
	fmovdneg	%xcc,	%f4,	%f14
	tle	%icc,	0x1
	fpadd16	%f22,	%f20,	%f28
	set	0x39, %i3
	ldstuba	[%l7 + %i3] 0x80,	%g1
	lduh	[%l7 + 0x28],	%o4
	tleu	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o3
	edge32n	%l2,	%o0,	%i7
	fba	%fcc1,	loop_573
	nop
	setx	loop_574,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%l0,	0x0C02,	%l4
	nop
	setx	loop_575,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_573:
	fmuld8ulx16	%f22,	%f19,	%f20
loop_574:
	edge16n	%g5,	%i3,	%g6
	set	0x74, %l0
	swapa	[%l7 + %l0] 0x80,	%l3
loop_575:
	edge32	%o5,	%i6,	%g3
	edge32	%g4,	%o6,	%l1
	te	%xcc,	0x6
	movrne	%i0,	0x2A1,	%i4
	set	0x69, %i7
	stba	%l6,	[%l7 + %i7] 0xe3
	membar	#Sync
	xnor	%i2,	0x0B47,	%g2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x0c
	addccc	%o2,	%l5,	%i5
	wr	%g0,	0x22,	%asi
	stxa	%o7,	[%l7 + 0x38] %asi
	membar	#Sync
	alignaddr	%i1,	%g7,	%g1
	udivcc	%o4,	0x092B,	%o3
	subcc	%o1,	%o0,	%i7
	fcmpgt32	%f18,	%f26,	%l2
	tvs	%icc,	0x5
	nop
	set	0x10, %g6
	stb	%l4,	[%l7 + %g6]
	fbo,a	%fcc1,	loop_576
	fbule,a	%fcc3,	loop_577
	fnegd	%f16,	%f6
	fmovdleu	%xcc,	%f13,	%f6
loop_576:
	fbule,a	%fcc2,	loop_578
loop_577:
	udivx	%l0,	0x0536,	%g5
	fmovsg	%xcc,	%f6,	%f3
	nop
	setx loop_579, %l0, %l1
	jmpl %l1, %g6
loop_578:
	udivcc	%l3,	0x110A,	%i3
	edge8l	%o5,	%i6,	%g4
	fmovrdlez	%o6,	%f30,	%f2
loop_579:
	bvc,a,pn	%xcc,	loop_580
	nop
	setx loop_581, %l0, %l1
	jmpl %l1, %l1
	alignaddrl	%i0,	%g3,	%i4
	fnot2s	%f10,	%f8
loop_580:
	pdist	%f14,	%f16,	%f4
loop_581:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ba	%icc,	loop_582
	stw	%l6,	[%l7 + 0x34]
	subc	%i2,	0x1B79,	%o2
	subcc	%l5,	0x1E26,	%i5
loop_582:
	bvs,a,pn	%icc,	loop_583
	stb	%o7,	[%l7 + 0x11]
	fmovrdgez	%g2,	%f22,	%f28
	edge16l	%i1,	%g7,	%o4
loop_583:
	tge	%xcc,	0x1
	ld	[%l7 + 0x6C],	%f23
	edge8l	%o3,	%g1,	%o1
	smul	%i7,	0x000E,	%l2
	subcc	%l4,	%o0,	%g5
	andcc	%l0,	%l3,	%i3
	edge8l	%g6,	%o5,	%g4
	fcmpd	%fcc0,	%f14,	%f30
	edge8ln	%o6,	%l1,	%i6
	fcmps	%fcc2,	%f16,	%f12
	array8	%i0,	%i4,	%g3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2B] %asi,	%l6
	fmovdcs	%xcc,	%f8,	%f17
	smul	%o2,	%l5,	%i2
	taddcc	%i5,	0x0473,	%g2
	bleu,pt	%xcc,	loop_584
	sethi	0x0BB6,	%i1
	sdiv	%g7,	0x0328,	%o7
	lduw	[%l7 + 0x48],	%o3
loop_584:
	srl	%g1,	0x11,	%o4
	bn,a	loop_585
	fbu	%fcc3,	loop_586
	orncc	%i7,	0x02F6,	%l2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o1
loop_585:
	smulcc	%l4,	0x0346,	%o0
loop_586:
	brlez,a	%l0,	loop_587
	sub	%l3,	0x0E59,	%i3
	edge16ln	%g5,	%g6,	%g4
	edge8l	%o6,	%o5,	%l1
loop_587:
	fmovsn	%xcc,	%f22,	%f31
	movcc	%icc,	%i0,	%i4
	fmovd	%f22,	%f28
	sub	%i6,	%l6,	%o2
	array8	%l5,	%g3,	%i2
	movrlez	%g2,	0x20A,	%i1
	sra	%i5,	%g7,	%o7
	orcc	%o3,	0x1F2F,	%g1
	array8	%i7,	%l2,	%o1
	subcc	%o4,	%o0,	%l0
	fmovrdlz	%l4,	%f30,	%f16
	edge8ln	%l3,	%i3,	%g5
	fmovscs	%icc,	%f0,	%f26
	te	%icc,	0x6
	orcc	%g4,	0x04E3,	%o6
	bleu,pn	%xcc,	loop_588
	movpos	%xcc,	%o5,	%l1
	srax	%g6,	0x0C,	%i0
	edge16ln	%i4,	%l6,	%i6
loop_588:
	movrlez	%l5,	%o2,	%g3
	fpsub32	%f16,	%f16,	%f16
	ta	%icc,	0x6
	addcc	%g2,	0x16AA,	%i2
	tle	%icc,	0x2
	orn	%i5,	%i1,	%o7
	sdiv	%g7,	0x14A5,	%g1
	movcs	%icc,	%o3,	%i7
	smul	%l2,	0x191A,	%o4
	edge8	%o0,	%o1,	%l0
	movg	%icc,	%l4,	%l3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%g5
	movgu	%icc,	%g4,	%o6
	tgu	%icc,	0x0
	tgu	%xcc,	0x2
	movrne	%l1,	%g6,	%o5
	set	0x18, %l5
	stxa	%i4,	[%l7 + %l5] 0x22
	membar	#Sync
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%i0
	be,pn	%xcc,	loop_589
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%f14
	wr	%g0,	0x0c,	%asi
	stha	%l6,	[%l7 + 0x0C] %asi
loop_589:
	edge16n	%i6,	%l5,	%g3
	fcmpgt32	%f16,	%f4,	%o2
	ldsh	[%l7 + 0x3E],	%i2
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%g2
	ba	%icc,	loop_590
	mulx	%i5,	%i1,	%g7
	fmovrde	%g1,	%f30,	%f28
	fmovsa	%xcc,	%f22,	%f6
loop_590:
	udivcc	%o7,	0x1312,	%i7
	fmovdgu	%xcc,	%f13,	%f19
	umul	%l2,	0x0D7A,	%o4
	edge8ln	%o3,	%o0,	%o1
	movrne	%l4,	%l3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc3,	loop_591
	fmovd	%f12,	%f30
	fbg	%fcc3,	loop_592
	movrne	%g5,	%l0,	%o6
loop_591:
	bne,a	%icc,	loop_593
	fcmpeq16	%f6,	%f22,	%g4
loop_592:
	bcc	%xcc,	loop_594
	fmovsa	%icc,	%f5,	%f0
loop_593:
	edge16n	%g6,	%l1,	%i4
	tg	%icc,	0x3
loop_594:
	nop
	set	0x36, %o1
	stha	%i0,	[%l7 + %o1] 0xe2
	membar	#Sync
	std	%f6,	[%l7 + 0x20]
	sir	0x09C8
	movcs	%icc,	%l6,	%o5
	edge16n	%l5,	%g3,	%i6
	brlez,a	%o2,	loop_595
	movl	%icc,	%i2,	%i5
	set	0x1A, %o0
	lduha	[%l7 + %o0] 0x81,	%i1
loop_595:
	sll	%g2,	0x1A,	%g7
	fbuge,a	%fcc3,	loop_596
	movvc	%xcc,	%g1,	%i7
	brlz	%l2,	loop_597
	sdivcc	%o7,	0x0346,	%o3
loop_596:
	udiv	%o0,	0x04A0,	%o1
	tneg	%xcc,	0x6
loop_597:
	tpos	%xcc,	0x6
	smulcc	%l4,	0x02ED,	%o4
	movgu	%xcc,	%l3,	%i3
	brlez	%g5,	loop_598
	andcc	%l0,	0x1811,	%g4
	tge	%xcc,	0x6
	ldub	[%l7 + 0x1F],	%o6
loop_598:
	fcmpd	%fcc2,	%f4,	%f0
	and	%l1,	0x12A3,	%g6
	fmovrse	%i4,	%f4,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i0,	[%l7 + 0x28]
	movge	%xcc,	%l6,	%o5
	fandnot2s	%f23,	%f11,	%f31
	movrlez	%g3,	0x2E3,	%i6
	tg	%icc,	0x4
	alignaddr	%o2,	%l5,	%i5
	ba,a	%icc,	loop_599
	movleu	%xcc,	%i1,	%i2
	add	%g7,	0x0821,	%g2
	fnot1s	%f10,	%f27
loop_599:
	fbn,a	%fcc2,	loop_600
	addccc	%g1,	%i7,	%o7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x20] %asi,	%o3
loop_600:
	fbug	%fcc3,	loop_601
	tge	%xcc,	0x1
	bshuffle	%f12,	%f16,	%f14
	fmul8x16	%f27,	%f8,	%f6
loop_601:
	fandnot1	%f14,	%f0,	%f22
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x46] %asi,	%l2
	stbar
	te	%icc,	0x1
	movge	%xcc,	%o1,	%o0
	array8	%l4,	%l3,	%o4
	wr	%g0,	0xe3,	%asi
	stba	%i3,	[%l7 + 0x71] %asi
	membar	#Sync
	movcs	%xcc,	%g5,	%l0
	tleu	%xcc,	0x4
	bl	%xcc,	loop_602
	tcc	%xcc,	0x2
	tne	%icc,	0x5
	tle	%xcc,	0x3
loop_602:
	nop
	set	0x34, %i0
	swapa	[%l7 + %i0] 0x04,	%o6
	tcs	%xcc,	0x6
	edge16	%g4,	%g6,	%i4
	fbu,a	%fcc3,	loop_603
	sdivx	%l1,	0x1208,	%i0
	fmul8x16	%f5,	%f6,	%f12
	sra	%l6,	%g3,	%i6
loop_603:
	xorcc	%o2,	%o5,	%i5
	fbue,a	%fcc2,	loop_604
	smulcc	%l5,	%i2,	%g7
	fnot2s	%f22,	%f26
	edge32l	%g2,	%g1,	%i1
loop_604:
	popc	0x0256,	%o7
	fmovdne	%xcc,	%f2,	%f7
	tneg	%icc,	0x5
	fmovsvc	%icc,	%f23,	%f27
	edge8l	%i7,	%l2,	%o1
	brnz	%o0,	loop_605
	tn	%xcc,	0x0
	fbul	%fcc1,	loop_606
	movvc	%icc,	%o3,	%l3
loop_605:
	bge	%xcc,	loop_607
	fnegs	%f23,	%f8
loop_606:
	nop
	setx	loop_608,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%o4,	%i3,	%l4
loop_607:
	fpsub32s	%f2,	%f31,	%f21
	fmovrsgez	%l0,	%f1,	%f10
loop_608:
	edge16l	%g5,	%g4,	%g6
	fbn	%fcc1,	loop_609
	andn	%o6,	0x1A84,	%i4
	fmovdcs	%icc,	%f24,	%f10
	movrne	%l1,	0x05A,	%l6
loop_609:
	taddcc	%g3,	0x1415,	%i0
	movgu	%xcc,	%o2,	%i6
	fba,a	%fcc2,	loop_610
	smulcc	%o5,	%l5,	%i5
	brlez,a	%i2,	loop_611
	orcc	%g2,	%g7,	%g1
loop_610:
	movn	%xcc,	%o7,	%i1
	tvs	%icc,	0x4
loop_611:
	udivx	%i7,	0x0C4A,	%o1
	edge32	%o0,	%l2,	%o3
	ba,a,pt	%icc,	loop_612
	membar	0x7F
	movleu	%xcc,	%l3,	%i3
	orncc	%l4,	%l0,	%o4
loop_612:
	edge32	%g5,	%g4,	%g6
	umulcc	%o6,	0x16A4,	%i4
	fandnot1s	%f4,	%f24,	%f31
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x10,	%f0
	andn	%l6,	0x0831,	%g3
	tcc	%xcc,	0x6
	tgu	%xcc,	0x4
	taddcctv	%l1,	0x0873,	%i0
	bneg	loop_613
	fpadd32s	%f2,	%f29,	%f9
	tleu	%xcc,	0x7
	edge32ln	%i6,	%o5,	%o2
loop_613:
	edge16l	%l5,	%i2,	%g2
	sir	0x1449
	edge32ln	%g7,	%i5,	%o7
	movcc	%xcc,	%g1,	%i7
	tvs	%xcc,	0x2
	movrgz	%i1,	%o0,	%o1
	array16	%o3,	%l2,	%l3
	set	0x74, %l2
	stba	%l4,	[%l7 + %l2] 0xe2
	membar	#Sync
	movpos	%icc,	%i3,	%o4
	fmovsge	%icc,	%f13,	%f22
	fmovde	%icc,	%f7,	%f16
	mulscc	%l0,	0x1564,	%g4
	tgu	%icc,	0x0
	alignaddr	%g5,	%g6,	%o6
	edge8n	%i4,	%g3,	%l6
	movg	%icc,	%l1,	%i0
	movg	%icc,	%i6,	%o5
	fmovdge	%icc,	%f23,	%f3
	fzero	%f12
	ldub	[%l7 + 0x13],	%l5
	movvs	%icc,	%o2,	%g2
	fbule,a	%fcc3,	loop_614
	orncc	%i2,	0x0E2A,	%i5
	fnot1	%f4,	%f0
	fpsub16	%f4,	%f16,	%f24
loop_614:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%g1
	bl,a,pn	%xcc,	loop_615
	fpmerge	%f10,	%f11,	%f8
	movvc	%icc,	%g7,	%i1
	fmovda	%xcc,	%f4,	%f7
loop_615:
	nop
	set	0x1E, %i2
	stb	%i7,	[%l7 + %i2]
	srl	%o0,	%o3,	%l2
	sth	%o1,	[%l7 + 0x46]
	move	%xcc,	%l4,	%l3
	tcs	%icc,	0x4
	smulcc	%o4,	0x1587,	%l0
	movleu	%xcc,	%g4,	%g5
	fmovscs	%xcc,	%f31,	%f29
	fmovdge	%icc,	%f27,	%f24
	ldstub	[%l7 + 0x51],	%g6
	fmul8ulx16	%f18,	%f6,	%f28
	fmovsgu	%icc,	%f17,	%f4
	ldub	[%l7 + 0x22],	%o6
	subccc	%i3,	0x0016,	%i4
	tn	%xcc,	0x0
	popc	%l6,	%g3
	addc	%i0,	%i6,	%o5
	ld	[%l7 + 0x48],	%f12
	stw	%l5,	[%l7 + 0x7C]
	xorcc	%l1,	%g2,	%o2
	ldd	[%l7 + 0x20],	%f2
	edge16l	%i2,	%o7,	%g1
	xnor	%g7,	%i5,	%i7
	tsubcctv	%o0,	%i1,	%l2
	movge	%icc,	%o1,	%o3
	movne	%icc,	%l4,	%l3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o4
	sllx	%g4,	0x06,	%l0
	edge16n	%g5,	%g6,	%o6
	srl	%i4,	0x08,	%l6
	mulx	%i3,	0x137C,	%i0
	sub	%g3,	%i6,	%l5
	fbu	%fcc3,	loop_616
	xnorcc	%l1,	0x1F7E,	%g2
	movn	%xcc,	%o5,	%o2
	tn	%xcc,	0x1
loop_616:
	sth	%o7,	[%l7 + 0x5A]
	array32	%i2,	%g1,	%g7
	fmovdleu	%xcc,	%f20,	%f12
	fbu,a	%fcc1,	loop_617
	edge32ln	%i5,	%o0,	%i7
	tvs	%xcc,	0x2
	srl	%i1,	0x0E,	%o1
loop_617:
	fmovdge	%xcc,	%f16,	%f20
	movpos	%xcc,	%o3,	%l2
	fpack16	%f28,	%f4
	smulcc	%l4,	0x0DD8,	%o4
	fnors	%f19,	%f28,	%f26
	sethi	0x1464,	%l3
	sub	%g4,	%l0,	%g6
	tle	%xcc,	0x3
	fnand	%f30,	%f6,	%f28
	edge8ln	%o6,	%g5,	%l6
	move	%xcc,	%i3,	%i0
	set	0x54, %o7
	swapa	[%l7 + %o7] 0x04,	%i4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%g3
	tvc	%icc,	0x4
	sdivx	%i6,	0x152F,	%l1
	fcmpeq16	%f12,	%f12,	%g2
	fcmpne32	%f10,	%f22,	%l5
	set	0x50, %g4
	lduha	[%l7 + %g4] 0x19,	%o2
	movre	%o5,	%i2,	%o7
	movge	%icc,	%g7,	%i5
	set	0x19, %l4
	stba	%g1,	[%l7 + %l4] 0x14
	array32	%o0,	%i7,	%i1
	tn	%xcc,	0x7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o3
	set	0x46, %g1
	lduha	[%l7 + %g1] 0x19,	%l4
	std	%f20,	[%l7 + 0x60]
	taddcc	%l2,	0x0D1D,	%l3
	subc	%o4,	%l0,	%g4
	st	%f23,	[%l7 + 0x60]
	fmovrslz	%o6,	%f16,	%f30
	tle	%xcc,	0x2
	nop
	setx	loop_618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1	%f28,	%f10
	stb	%g5,	[%l7 + 0x3D]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i3
loop_618:
	andncc	%i0,	%i4,	%l6
	srl	%i6,	%g3,	%l1
	edge16n	%l5,	%o2,	%g2
	movne	%icc,	%o5,	%o7
	movvs	%xcc,	%g7,	%i5
	fbu	%fcc1,	loop_619
	stw	%i2,	[%l7 + 0x48]
	fornot2s	%f17,	%f3,	%f1
	ldsb	[%l7 + 0x5C],	%o0
loop_619:
	nop
	set	0x20, %g3
	ldxa	[%g0 + %g3] 0x4f,	%g1
	srax	%i1,	0x1C,	%o1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	wr	%g0,	0x18,	%asi
	stwa	%i7,	[%l7 + 0x50] %asi
	movrlz	%l2,	%l4,	%l3
	srl	%o4,	0x17,	%l0
	fba,a	%fcc3,	loop_620
	mulx	%o6,	%g4,	%g5
	add	%g6,	0x1A9E,	%i0
	wr	%g0,	0xeb,	%asi
	stwa	%i3,	[%l7 + 0x18] %asi
	membar	#Sync
loop_620:
	alignaddr	%i4,	%l6,	%g3
	tle	%icc,	0x3
	fbu,a	%fcc3,	loop_621
	ba,pn	%xcc,	loop_622
	fzeros	%f20
	popc	%i6,	%l5
loop_621:
	edge16	%o2,	%g2,	%l1
loop_622:
	addcc	%o5,	0x0941,	%o7
	array16	%i5,	%i2,	%o0
	bneg,a,pt	%icc,	loop_623
	tcc	%icc,	0x5
	call	loop_624
	tleu	%xcc,	0x0
loop_623:
	fpsub32	%f2,	%f24,	%f28
	fmovrsgz	%g7,	%f23,	%f31
loop_624:
	sub	%i1,	0x1FEC,	%g1
	fbug	%fcc2,	loop_625
	ldsw	[%l7 + 0x14],	%o1
	brgez,a	%i7,	loop_626
	tle	%icc,	0x1
loop_625:
	fbe,a	%fcc3,	loop_627
	add	%l2,	%o3,	%l4
loop_626:
	tsubcctv	%o4,	0x15CE,	%l3
	fbuge	%fcc3,	loop_628
loop_627:
	edge8n	%l0,	%o6,	%g5
	ldsh	[%l7 + 0x52],	%g4
	fmovsge	%icc,	%f22,	%f29
loop_628:
	alignaddrl	%i0,	%g6,	%i4
	fmovrdgz	%l6,	%f24,	%f8
	tl	%icc,	0x6
	fmovdge	%xcc,	%f22,	%f10
	movl	%xcc,	%g3,	%i6
	tn	%icc,	0x0
	tvs	%icc,	0x5
	fnand	%f2,	%f26,	%f14
	fbuge	%fcc2,	loop_629
	fmovs	%f9,	%f16
	ldstub	[%l7 + 0x12],	%i3
	movvs	%xcc,	%o2,	%l5
loop_629:
	tpos	%icc,	0x6
	fba,a	%fcc1,	loop_630
	edge32l	%l1,	%o5,	%g2
	ldsw	[%l7 + 0x30],	%i5
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
loop_630:
	tpos	%xcc,	0x0
	sethi	0x1132,	%o0
	fmovsn	%xcc,	%f4,	%f31
	tn	%icc,	0x2
	membar	0x6C
	wr	%g0,	0x0c,	%asi
	stha	%g7,	[%l7 + 0x50] %asi
	sllx	%i1,	%g1,	%o1
	orcc	%i7,	%l2,	%o7
	wr	%g0,	0x23,	%asi
	stha	%o3,	[%l7 + 0x66] %asi
	membar	#Sync
	edge16	%l4,	%l3,	%l0
	edge32l	%o4,	%o6,	%g5
	fbne	%fcc1,	loop_631
	tn	%icc,	0x7
	te	%icc,	0x0
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x19,	 0x0
loop_631:
	bgu	loop_632
	fcmpeq32	%f12,	%f26,	%i0
	edge16	%g6,	%l6,	%i4
	fbne,a	%fcc1,	loop_633
loop_632:
	alignaddr	%i6,	%g3,	%o2
	tvs	%xcc,	0x6
	fbu	%fcc2,	loop_634
loop_633:
	fors	%f4,	%f7,	%f15
	orn	%l5,	0x1606,	%l1
	and	%i3,	0x1090,	%o5
loop_634:
	tle	%icc,	0x4
	fbne,a	%fcc0,	loop_635
	sth	%g2,	[%l7 + 0x7C]
	fmovde	%icc,	%f6,	%f13
	tpos	%xcc,	0x2
loop_635:
	taddcc	%i5,	%i2,	%g7
	orn	%i1,	0x1C07,	%g1
	edge16	%o0,	%i7,	%l2
	ta	%xcc,	0x4
	nop
	setx loop_636, %l0, %l1
	jmpl %l1, %o7
	mova	%xcc,	%o3,	%l4
	set	0x4E, %l3
	ldstuba	[%l7 + %l3] 0x11,	%l3
loop_636:
	movgu	%xcc,	%l0,	%o4
	set	0x60, %i6
	stda	%o6,	[%l7 + %i6] 0x19
	movleu	%icc,	%g5,	%o1
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g4
	andncc	%i0,	%l6,	%g6
	movrne	%i4,	0x077,	%i6
	movge	%icc,	%o2,	%l5
	sdiv	%g3,	0x1718,	%l1
	membar	0x43
	bcs,a,pn	%icc,	loop_637
	edge16	%i3,	%o5,	%i5
	sra	%i2,	%g7,	%i1
	edge32n	%g1,	%o0,	%i7
loop_637:
	and	%l2,	%o7,	%o3
	fmovsneg	%icc,	%f29,	%f30
	fmovde	%icc,	%f11,	%f22
	sdiv	%l4,	0x08D7,	%g2
	fbuge	%fcc3,	loop_638
	prefetch	[%l7 + 0x2C],	 0x2
	te	%icc,	0x1
	movl	%xcc,	%l0,	%l3
loop_638:
	st	%f12,	[%l7 + 0x18]
	movvc	%xcc,	%o6,	%o4
	tleu	%icc,	0x3
	fandnot1	%f16,	%f0,	%f14
	bgu,a,pt	%icc,	loop_639
	tcs	%icc,	0x2
	movrgez	%o1,	0x11B,	%g4
	movgu	%xcc,	%g5,	%l6
loop_639:
	sethi	0x199D,	%g6
	tleu	%icc,	0x1
	bl	%xcc,	loop_640
	movrlez	%i4,	0x158,	%i6
	set	0x0B, %i5
	ldstuba	[%l7 + %i5] 0x04,	%o2
loop_640:
	taddcc	%l5,	%i0,	%l1
	fbg,a	%fcc0,	loop_641
	movn	%icc,	%i3,	%o5
	movneg	%icc,	%i5,	%i2
	sdiv	%g7,	0x01A0,	%i1
loop_641:
	fmovdcs	%xcc,	%f10,	%f31
	be,pt	%icc,	loop_642
	tleu	%icc,	0x2
	udiv	%g3,	0x106F,	%g1
	or	%o0,	%i7,	%l2
loop_642:
	fmovsge	%xcc,	%f11,	%f27
	tcs	%xcc,	0x5
	xnor	%o3,	0x1089,	%l4
	membar	0x72
	set	0x08, %o2
	stda	%g2,	[%l7 + %o2] 0xe2
	membar	#Sync
	alignaddr	%o7,	%l0,	%l3
	fabsd	%f2,	%f14
	stx	%o6,	[%l7 + 0x08]
	addcc	%o1,	0x12D0,	%o4
	edge32ln	%g4,	%g5,	%g6
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x0c,	 0x3
	edge16	%i6,	%o2,	%l6
	srl	%l5,	%i0,	%i3
	udiv	%o5,	0x0498,	%i5
	movrgz	%i2,	%l1,	%i1
	tne	%xcc,	0x0
	fmovse	%xcc,	%f4,	%f1
	wr	%g0,	0x10,	%asi
	stwa	%g7,	[%l7 + 0x64] %asi
	edge8	%g1,	%g3,	%o0
	orn	%i7,	%l2,	%o3
	fpadd16	%f22,	%f22,	%f2
	set	0x66, %o4
	stba	%g2,	[%l7 + %o4] 0x80
	movge	%xcc,	%l4,	%o7
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x11
	edge8ln	%l0,	%o6,	%l3
	fmovdneg	%xcc,	%f19,	%f24
	fmovde	%xcc,	%f16,	%f1
	tpos	%xcc,	0x1
	sir	0x10A9
	xnorcc	%o4,	0x10B1,	%o1
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%g4
	and	%g5,	0x0B6E,	%i4
	bcc,pt	%xcc,	loop_643
	tgu	%icc,	0x3
	taddcc	%i6,	%g6,	%o2
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
loop_643:
	fcmped	%fcc1,	%f14,	%f26
	movl	%xcc,	%l6,	%i3
	fmovrdlz	%o5,	%f20,	%f14
	bvc,pn	%icc,	loop_644
	fcmpeq32	%f2,	%f10,	%i0
	fblg,a	%fcc1,	loop_645
	bge,a	%xcc,	loop_646
loop_644:
	fand	%f10,	%f26,	%f0
	tn	%icc,	0x6
loop_645:
	fmovsle	%icc,	%f20,	%f21
loop_646:
	andcc	%i2,	%l1,	%i5
	fsrc2	%f0,	%f16
	fbge	%fcc3,	loop_647
	addc	%i1,	0x1546,	%g7
	alignaddrl	%g1,	%g3,	%o0
	brgez,a	%i7,	loop_648
loop_647:
	array16	%l2,	%o3,	%l4
	ld	[%l7 + 0x30],	%f23
	alignaddr	%g2,	%l0,	%o7
loop_648:
	movrlz	%l3,	%o4,	%o1
	tvc	%xcc,	0x6
	srax	%g4,	%g5,	%o6
	bneg	loop_649
	subcc	%i4,	%i6,	%g6
	movre	%o2,	%l6,	%l5
	movgu	%icc,	%i3,	%o5
loop_649:
	subc	%i2,	%i0,	%i5
	fbo,a	%fcc0,	loop_650
	tneg	%icc,	0x6
	sdiv	%l1,	0x167E,	%i1
	fcmped	%fcc0,	%f28,	%f30
loop_650:
	fbug,a	%fcc3,	loop_651
	fcmpgt32	%f30,	%f12,	%g1
	subccc	%g3,	0x00E0,	%g7
	and	%o0,	%i7,	%o3
loop_651:
	sethi	0x019E,	%l4
	fmovsleu	%icc,	%f12,	%f31
	fbuge,a	%fcc1,	loop_652
	xnorcc	%l2,	%g2,	%o7
	tge	%icc,	0x1
	nop
	setx loop_653, %l0, %l1
	jmpl %l1, %l3
loop_652:
	fble,a	%fcc2,	loop_654
	movrlez	%o4,	0x2A4,	%o1
	fbn,a	%fcc1,	loop_655
loop_653:
	bg	loop_656
loop_654:
	tvc	%xcc,	0x2
	umul	%l0,	%g5,	%g4
loop_655:
	bn,pn	%xcc,	loop_657
loop_656:
	smul	%i4,	0x0400,	%i6
	fcmpeq16	%f12,	%f18,	%g6
	tpos	%xcc,	0x0
loop_657:
	fbuge	%fcc1,	loop_658
	movrlez	%o2,	%o6,	%l5
	bge,a,pt	%icc,	loop_659
	fzero	%f30
loop_658:
	tg	%xcc,	0x7
	fandnot2	%f8,	%f28,	%f14
loop_659:
	fcmpd	%fcc0,	%f10,	%f4
	fnand	%f24,	%f6,	%f2
	andcc	%l6,	0x0F28,	%i3
	bneg,a,pn	%icc,	loop_660
	tn	%xcc,	0x7
	tg	%icc,	0x6
	movgu	%xcc,	%o5,	%i2
loop_660:
	movne	%icc,	%i0,	%l1
	tvs	%xcc,	0x1
	movne	%icc,	%i1,	%g1
	smul	%g3,	%g7,	%i5
	fmul8ulx16	%f10,	%f18,	%f4
	ldsb	[%l7 + 0x0E],	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i7,	%l4
	movg	%xcc,	%l2,	%o3
	tsubcc	%g2,	0x1CDC,	%l3
	fmovsneg	%xcc,	%f11,	%f23
	umulcc	%o4,	0x1039,	%o7
	movneg	%xcc,	%o1,	%g5
	fxors	%f5,	%f21,	%f18
	lduh	[%l7 + 0x60],	%g4
	taddcctv	%l0,	0x0291,	%i4
	fpack16	%f4,	%f0
	alignaddr	%g6,	%o2,	%o6
	array32	%l5,	%i6,	%i3
	tgu	%icc,	0x1
	movneg	%xcc,	%l6,	%i2
	umul	%o5,	0x08F4,	%l1
	stw	%i1,	[%l7 + 0x20]
	fnor	%f16,	%f0,	%f22
	or	%i0,	0x0A53,	%g3
	brlz	%g7,	loop_661
	xor	%i5,	%g1,	%i7
	orcc	%l4,	%l2,	%o0
	tl	%icc,	0x0
loop_661:
	fmovdneg	%icc,	%f7,	%f10
	array32	%o3,	%g2,	%l3
	fpack32	%f28,	%f2,	%f24
	set	0x64, %g7
	stwa	%o7,	[%l7 + %g7] 0x2b
	membar	#Sync
	and	%o4,	0x0709,	%g5
	fbuge	%fcc1,	loop_662
	ldd	[%l7 + 0x70],	%o0
	fpadd32	%f18,	%f10,	%f10
	edge32l	%l0,	%g4,	%g6
loop_662:
	movcs	%icc,	%i4,	%o6
	edge8n	%l5,	%o2,	%i6
	sub	%i3,	0x0A24,	%i2
	edge16ln	%o5,	%l1,	%l6
	movrgz	%i1,	0x29D,	%g3
	tleu	%xcc,	0x0
	alignaddr	%g7,	%i5,	%i0
	bpos,a	loop_663
	or	%i7,	0x13DE,	%l4
	taddcc	%l2,	0x00EE,	%o0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o3
loop_663:
	edge32n	%g2,	%l3,	%o7
	fsrc1	%f14,	%f0
	srax	%o4,	0x07,	%g1
	fcmped	%fcc1,	%f8,	%f22
	movg	%xcc,	%o1,	%l0
	xor	%g5,	0x0278,	%g4
	subcc	%g6,	0x1B92,	%o6
	edge8ln	%i4,	%l5,	%i6
	brz	%i3,	loop_664
	fors	%f31,	%f10,	%f26
	fbul,a	%fcc3,	loop_665
	tpos	%xcc,	0x6
loop_664:
	array8	%i2,	%o5,	%o2
	for	%f26,	%f30,	%f18
loop_665:
	bcc,a	loop_666
	srl	%l6,	0x19,	%l1
	brz,a	%g3,	loop_667
	fmovdvc	%icc,	%f30,	%f27
loop_666:
	udivx	%i1,	0x1410,	%g7
	fmovsne	%xcc,	%f9,	%f16
loop_667:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i0
	ldsw	[%l7 + 0x1C],	%i7
	subccc	%i5,	%l4,	%o0
	for	%f20,	%f16,	%f26
	edge16ln	%l2,	%o3,	%l3
	fcmps	%fcc3,	%f2,	%f16
	bge	%xcc,	loop_668
	movrlz	%g2,	%o7,	%g1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x04,	%o4,	%o1
loop_668:
	fbe,a	%fcc0,	loop_669
	edge32l	%l0,	%g5,	%g4
	mulscc	%g6,	%o6,	%l5
	alignaddr	%i6,	%i3,	%i4
loop_669:
	bcc,pn	%xcc,	loop_670
	addc	%i2,	0x098E,	%o5
	movneg	%icc,	%l6,	%l1
	edge32l	%g3,	%o2,	%g7
loop_670:
	fsrc2s	%f13,	%f0
	and	%i1,	0x1585,	%i7
	xnorcc	%i0,	0x14C7,	%i5
	edge32ln	%l4,	%o0,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l3,	%l2,	%g2
	fnot2s	%f1,	%f1
	edge32ln	%o7,	%g1,	%o4
	tneg	%xcc,	0x7
	fmuld8sux16	%f18,	%f11,	%f16
	fornot1	%f16,	%f24,	%f0
	sra	%l0,	0x11,	%g5
	fblg	%fcc1,	loop_671
	xnorcc	%g4,	%g6,	%o6
	movcs	%xcc,	%l5,	%o1
	tg	%xcc,	0x5
loop_671:
	umul	%i6,	0x06B9,	%i4
	fcmpne16	%f18,	%f24,	%i2
	taddcctv	%o5,	0x13B7,	%i3
	call	loop_672
	movge	%icc,	%l1,	%g3
	andncc	%l6,	%g7,	%o2
	popc	%i7,	%i1
loop_672:
	fba	%fcc0,	loop_673
	fmovsvc	%icc,	%f18,	%f13
	movrgez	%i5,	%l4,	%i0
	andncc	%o0,	%l3,	%l2
loop_673:
	move	%icc,	%g2,	%o3
	fpadd16	%f0,	%f26,	%f6
	movneg	%xcc,	%o7,	%g1
	xnorcc	%l0,	%o4,	%g5
	fmovrsne	%g6,	%f5,	%f30
	bcc	loop_674
	edge8ln	%o6,	%g4,	%l5
	fbe,a	%fcc3,	loop_675
	edge8l	%o1,	%i6,	%i2
loop_674:
	tge	%icc,	0x7
	fbg,a	%fcc3,	loop_676
loop_675:
	addccc	%i4,	%o5,	%i3
	tvc	%icc,	0x5
	smul	%g3,	%l1,	%l6
loop_676:
	edge16	%g7,	%o2,	%i1
	andcc	%i5,	0x02BA,	%i7
	movne	%icc,	%l4,	%o0
	fnot1s	%f27,	%f10
	tle	%icc,	0x1
	fbule	%fcc0,	loop_677
	bshuffle	%f18,	%f14,	%f16
	nop
	set	0x18, %i4
	lduh	[%l7 + %i4],	%l3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i0
loop_677:
	move	%xcc,	%g2,	%o3
	fnegd	%f12,	%f6
	andcc	%l2,	0x13C3,	%g1
	xor	%o7,	0x068C,	%l0
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	mova	%xcc,	%o4,	%g6
	tvs	%icc,	0x0
	umulcc	%g5,	%o6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o1,	0x1A9D,	%i6
	mulscc	%l5,	0x0CC7,	%i4
	fpadd16s	%f26,	%f29,	%f1
	fandnot2s	%f4,	%f28,	%f27
	tsubcctv	%i2,	0x0DC9,	%o5
	movneg	%xcc,	%g3,	%l1
	array16	%l6,	%i3,	%g7
	alignaddrl	%o2,	%i1,	%i5
	movl	%icc,	%l4,	%o0
	tsubcctv	%i7,	%l3,	%g2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x29] %asi,	%i0
	fmovda	%icc,	%f13,	%f30
	tg	%icc,	0x2
	tge	%xcc,	0x2
	xnorcc	%l2,	%o3,	%o7
	subccc	%l0,	0x0DB1,	%o4
	xnor	%g6,	%g1,	%o6
	tg	%xcc,	0x7
	fsrc2	%f18,	%f30
	fornot2	%f6,	%f24,	%f28
	xorcc	%g4,	0x0465,	%o1
	fmovdneg	%xcc,	%f31,	%f30
	fmovsvs	%icc,	%f18,	%f28
	alignaddrl	%g5,	%l5,	%i6
	bvs,a	loop_678
	fbule	%fcc0,	loop_679
	andn	%i4,	%o5,	%g3
	edge32n	%l1,	%i2,	%i3
loop_678:
	ba	loop_680
loop_679:
	andcc	%l6,	%g7,	%i1
	edge32ln	%o2,	%l4,	%i5
	fandnot2	%f24,	%f18,	%f8
loop_680:
	brlz	%i7,	loop_681
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f22,	%f29,	%f30
	movne	%xcc,	%l3,	%g2
loop_681:
	lduw	[%l7 + 0x68],	%i0
	brlez	%o0,	loop_682
	fcmpne16	%f14,	%f22,	%l2
	subcc	%o3,	0x1DCE,	%l0
	movne	%xcc,	%o4,	%g6
loop_682:
	movcs	%xcc,	%g1,	%o6
	fmovdl	%icc,	%f0,	%f2
	movl	%xcc,	%o7,	%g4
	te	%xcc,	0x2
	stx	%o1,	[%l7 + 0x40]
	fble	%fcc3,	loop_683
	tgu	%xcc,	0x1
	andn	%l5,	0x0934,	%i6
	sub	%g5,	%o5,	%g3
loop_683:
	fcmpne32	%f2,	%f26,	%l1
	movne	%icc,	%i4,	%i3
	movne	%icc,	%i2,	%g7
	udivx	%i1,	0x1A23,	%o2
	std	%l4,	[%l7 + 0x70]
	sethi	0x18F6,	%i5
	fcmped	%fcc2,	%f4,	%f4
	std	%f26,	[%l7 + 0x78]
	edge8n	%i7,	%l3,	%l6
	tvs	%xcc,	0x6
	be,pt	%xcc,	loop_684
	fba	%fcc0,	loop_685
	orn	%i0,	%o0,	%l2
	fandnot1	%f28,	%f28,	%f4
loop_684:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x0C] %asi,	%f30
loop_685:
	nop
	set	0x62, %l1
	lduha	[%l7 + %l1] 0x04,	%g2
	fbne,a	%fcc3,	loop_686
	st	%f23,	[%l7 + 0x08]
	st	%f14,	[%l7 + 0x2C]
	mulx	%l0,	%o3,	%g6
loop_686:
	fbu	%fcc1,	loop_687
	sub	%g1,	0x164A,	%o4
	tpos	%icc,	0x6
	call	loop_688
loop_687:
	fbue,a	%fcc3,	loop_689
	sdivcc	%o7,	0x1D7D,	%g4
	srl	%o1,	0x1A,	%o6
loop_688:
	nop
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x11,	%i6
loop_689:
	brz,a	%l5,	loop_690
	edge8l	%o5,	%g5,	%l1
	edge8ln	%i4,	%i3,	%g3
	brgez,a	%g7,	loop_691
loop_690:
	te	%icc,	0x0
	movneg	%xcc,	%i2,	%o2
	taddcc	%i1,	0x1854,	%i5
loop_691:
	fbug,a	%fcc0,	loop_692
	fpsub32s	%f31,	%f24,	%f4
	fors	%f29,	%f6,	%f11
	movrgez	%l4,	%l3,	%i7
loop_692:
	fmovsge	%xcc,	%f0,	%f3
	stw	%i0,	[%l7 + 0x40]
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x75] %asi,	%l6
	te	%xcc,	0x5
	membar	0x1E
	ldx	[%l7 + 0x78],	%o0
	xorcc	%g2,	0x12EF,	%l2
	fbl,a	%fcc2,	loop_693
	fpsub32	%f26,	%f14,	%f20
	orn	%l0,	%o3,	%g1
	subc	%o4,	0x0C79,	%g6
loop_693:
	nop
	set	0x64, %i3
	stw	%o7,	[%l7 + %i3]
	stw	%o1,	[%l7 + 0x7C]
	sth	%o6,	[%l7 + 0x42]
	movcc	%xcc,	%i6,	%g4
	addccc	%l5,	0x12A2,	%o5
	tleu	%xcc,	0x6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l1,	%g5
	bn	%xcc,	loop_694
	sdivcc	%i4,	0x0FD2,	%i3
	fbn	%fcc2,	loop_695
	popc	0x1072,	%g7
loop_694:
	umul	%i2,	%o2,	%i1
	fcmple32	%f18,	%f0,	%i5
loop_695:
	bvc,a	%xcc,	loop_696
	fpackfix	%f12,	%f18
	movvs	%icc,	%l4,	%l3
	edge32	%i7,	%i0,	%l6
loop_696:
	movl	%xcc,	%g3,	%g2
	fmovsvs	%icc,	%f17,	%f27
	tne	%icc,	0x7
	fandnot1s	%f0,	%f23,	%f31
	tgu	%xcc,	0x6
	nop
	setx	loop_697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%o0,	0x0539,	%l2
	sub	%l0,	%g1,	%o3
	orcc	%o4,	%o7,	%g6
loop_697:
	bneg,a	loop_698
	fmovdle	%xcc,	%f8,	%f13
	addccc	%o6,	%i6,	%g4
	fbule,a	%fcc0,	loop_699
loop_698:
	movne	%icc,	%o1,	%o5
	ldx	[%l7 + 0x30],	%l1
	addcc	%g5,	%l5,	%i3
loop_699:
	fmovdgu	%icc,	%f16,	%f12
	umulcc	%g7,	0x1155,	%i2
	tsubcctv	%i4,	%o2,	%i1
	edge8n	%i5,	%l3,	%i7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x14] %asi,	%l4
	movrne	%i0,	%l6,	%g3
	fbl,a	%fcc1,	loop_700
	bgu,a	loop_701
	smulcc	%g2,	0x1C08,	%l2
	edge32l	%o0,	%g1,	%o3
loop_700:
	nop
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x88,	%l0
loop_701:
	movg	%xcc,	%o4,	%g6
	movcc	%icc,	%o6,	%o7
	sir	0x1C94
	ldsh	[%l7 + 0x6A],	%i6
	ldub	[%l7 + 0x52],	%o1
	fbg,a	%fcc1,	loop_702
	membar	0x3A
	tsubcctv	%g4,	0x0EAB,	%l1
	fmovrse	%g5,	%f7,	%f17
loop_702:
	andncc	%o5,	%l5,	%g7
	fmovsne	%xcc,	%f10,	%f7
	bne,pn	%xcc,	loop_703
	ta	%xcc,	0x3
	fmovrsgez	%i2,	%f21,	%f21
	fpack16	%f30,	%f11
loop_703:
	fnot2	%f0,	%f12
	tcc	%icc,	0x4
	fmovrslez	%i3,	%f12,	%f8
	edge16l	%i4,	%o2,	%i5
	movrne	%l3,	0x08D,	%i7
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%i1
	stx	%i0,	[%l7 + 0x50]
	subc	%l4,	0x1BDA,	%g3
	fmuld8sux16	%f26,	%f30,	%f10
	addccc	%l6,	%l2,	%g2
	set	0x10, %g5
	stxa	%o0,	[%l7 + %g5] 0xe3
	membar	#Sync
	fmovsneg	%xcc,	%f28,	%f7
	taddcc	%o3,	%l0,	%g1
	orcc	%o4,	0x1CB3,	%o6
	ldsh	[%l7 + 0x7A],	%o7
	fmovrslez	%g6,	%f29,	%f9
	smulcc	%o1,	%i6,	%l1
	edge8l	%g5,	%o5,	%l5
	tleu	%icc,	0x3
	tle	%icc,	0x2
	bl	loop_704
	movrgz	%g4,	%g7,	%i3
	fpsub16s	%f15,	%f8,	%f19
	fbuge,a	%fcc2,	loop_705
loop_704:
	array32	%i2,	%i4,	%o2
	umulcc	%i5,	%i7,	%i1
	bcc,a	loop_706
loop_705:
	sra	%i0,	%l3,	%l4
	bpos,a	%icc,	loop_707
	membar	0x60
loop_706:
	tneg	%xcc,	0x7
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x62] %asi,	%l6
loop_707:
	fandnot2	%f12,	%f2,	%f2
	nop
	setx	loop_708,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	%l2,	%g2
	fandnot2s	%f7,	%f27,	%f2
	xorcc	%o0,	%o3,	%l0
loop_708:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g3,	%g1
	array8	%o4,	%o7,	%o6
	fpmerge	%f7,	%f11,	%f24
	fnors	%f10,	%f25,	%f30
	ld	[%l7 + 0x48],	%f17
	bneg,a	%icc,	loop_709
	movleu	%xcc,	%o1,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%l1,	%g5
loop_709:
	addcc	%l5,	0x14D9,	%g4
	xor	%o5,	0x06EF,	%g7
	edge16	%i3,	%i4,	%i2
	bpos,a,pt	%icc,	loop_710
	taddcctv	%i5,	%i7,	%i1
	nop
	setx	loop_711,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2	%f20,	%f24
loop_710:
	fbn	%fcc1,	loop_712
	sra	%o2,	0x03,	%l3
loop_711:
	movge	%xcc,	%i0,	%l4
	movrne	%l6,	%l2,	%o0
loop_712:
	fbul	%fcc2,	loop_713
	smulcc	%o3,	%g2,	%g3
	tpos	%icc,	0x5
	movrgez	%l0,	%g1,	%o7
loop_713:
	st	%f3,	[%l7 + 0x1C]
	fbug,a	%fcc1,	loop_714
	sethi	0x0521,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o4,	%g6
loop_714:
	fbug,a	%fcc0,	loop_715
	movl	%xcc,	%o1,	%l1
	fbug,a	%fcc2,	loop_716
	taddcctv	%g5,	0x0F07,	%i6
loop_715:
	fandnot1s	%f5,	%f29,	%f11
	tleu	%icc,	0x5
loop_716:
	tge	%icc,	0x3
	wr	%g0,	0x27,	%asi
	stha	%g4,	[%l7 + 0x08] %asi
	membar	#Sync
	set	0x3a8, %g6
	nop 	! 	nop 	! 	ldxa	[%g0 + %g6] 0x40,	%o5 ripped by fixASI40.pl ripped by fixASI40.pl
	srax	%l5,	%g7,	%i3
	movrgz	%i2,	0x1C4,	%i5
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i7
	edge16n	%i4,	%i1,	%l3
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o2
	orncc	%i0,	0x10B9,	%l4
	umul	%l6,	%l2,	%o3
	srl	%g2,	%o0,	%g3
	xnorcc	%l0,	%o7,	%g1
	fnegd	%f14,	%f22
	tn	%icc,	0x0
	movcs	%icc,	%o6,	%o4
	fmovdle	%icc,	%f28,	%f19
	srax	%o1,	0x09,	%g6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g5
	fmovsvc	%xcc,	%f6,	%f12
	fmovde	%icc,	%f13,	%f20
	movle	%xcc,	%l1,	%g4
	fmovrsne	%i6,	%f6,	%f19
	movpos	%xcc,	%l5,	%g7
	fsrc1	%f14,	%f16
	bcs,a,pt	%icc,	loop_717
	edge16l	%i3,	%o5,	%i5
	fbule,a	%fcc3,	loop_718
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_717:
	fmul8sux16	%f28,	%f18,	%f14
	subcc	%i7,	%i4,	%i2
loop_718:
	move	%icc,	%l3,	%o2
	fmovdpos	%icc,	%f31,	%f20
	andn	%i0,	0x003D,	%l4
	tleu	%icc,	0x7
	orcc	%l6,	%l2,	%o3
	bge,pt	%xcc,	loop_719
	movle	%xcc,	%i1,	%g2
	tvs	%xcc,	0x7
	movcs	%xcc,	%o0,	%l0
loop_719:
	fbu,a	%fcc0,	loop_720
	fmovsl	%icc,	%f6,	%f28
	fmovsg	%xcc,	%f1,	%f9
	edge8	%o7,	%g3,	%g1
loop_720:
	umulcc	%o6,	%o4,	%o1
	fbg,a	%fcc1,	loop_721
	bvs,pn	%xcc,	loop_722
	fmovrde	%g5,	%f18,	%f10
	add	%l1,	0x1DE6,	%g4
loop_721:
	srlx	%i6,	%g6,	%l5
loop_722:
	movrlez	%g7,	0x070,	%o5
	fnors	%f15,	%f5,	%f15
	edge16ln	%i3,	%i7,	%i4
	set	0x24, %l5
	swapa	[%l7 + %l5] 0x89,	%i2
	sdivcc	%i5,	0x064C,	%l3
	add	%o2,	%i0,	%l4
	bn,a,pt	%icc,	loop_723
	stx	%l6,	[%l7 + 0x20]
	sdiv	%o3,	0x0524,	%l2
	taddcctv	%i1,	%o0,	%g2
loop_723:
	xor	%l0,	%o7,	%g1
	smul	%g3,	%o4,	%o1
	sdivcc	%o6,	0x0ACD,	%g5
	udiv	%g4,	0x138D,	%l1
	tcc	%icc,	0x6
	stb	%g6,	[%l7 + 0x55]
	fmovsgu	%xcc,	%f0,	%f16
	fbo	%fcc1,	loop_724
	movg	%xcc,	%l5,	%g7
	movrgz	%i6,	%i3,	%o5
	tgu	%icc,	0x4
loop_724:
	tg	%icc,	0x4
	edge16n	%i4,	%i7,	%i2
	fmuld8ulx16	%f21,	%f2,	%f12
	sdiv	%i5,	0x0B9A,	%l3
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x24] %asi,	%i0
	set	0x56, %l0
	lduha	[%l7 + %l0] 0x18,	%o2
	move	%xcc,	%l4,	%o3
	tsubcctv	%l2,	0x0D96,	%l6
	tl	%xcc,	0x3
	umulcc	%i1,	0x16B7,	%g2
	brgez,a	%o0,	loop_725
	swap	[%l7 + 0x30],	%l0
	brlez	%o7,	loop_726
	fmovs	%f30,	%f15
loop_725:
	tne	%xcc,	0x0
	sdivx	%g3,	0x0A4B,	%o4
loop_726:
	edge32l	%o1,	%o6,	%g5
	set	0x10, %o1
	stha	%g4,	[%l7 + %o1] 0x2f
	membar	#Sync
	fmovrdgz	%g1,	%f26,	%f14
	fmul8ulx16	%f12,	%f28,	%f2
	tcc	%xcc,	0x4
	fmovdne	%xcc,	%f11,	%f3
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
	tpos	%icc,	0x2
	fbg	%fcc3,	loop_727
	edge32	%l1,	%l5,	%g6
	bpos	%xcc,	loop_728
	udivcc	%i6,	0x102D,	%i3
loop_727:
	umulcc	%g7,	0x07D9,	%o5
	addccc	%i7,	%i4,	%i2
loop_728:
	movrne	%l3,	%i0,	%o2
	udivcc	%l4,	0x12E6,	%o3
	and	%i5,	0x1965,	%l2
	udivx	%l6,	0x1B89,	%g2
	tl	%xcc,	0x7
	bneg,a,pn	%xcc,	loop_729
	udiv	%i1,	0x103D,	%l0
	xorcc	%o7,	%o0,	%o4
	stx	%g3,	[%l7 + 0x50]
loop_729:
	fmul8x16al	%f26,	%f1,	%f26
	ldsw	[%l7 + 0x58],	%o6
	sdiv	%g5,	0x02C6,	%g4
	fba,a	%fcc2,	loop_730
	tle	%xcc,	0x0
	xnorcc	%o1,	0x036D,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_730:
	movneg	%xcc,	%l1,	%l5
	tneg	%xcc,	0x5
	fmovdle	%xcc,	%f10,	%f3
	ldsw	[%l7 + 0x14],	%g6
	fbug,a	%fcc2,	loop_731
	tg	%icc,	0x6
	fmovsvc	%icc,	%f31,	%f4
	movre	%i3,	0x03F,	%g7
loop_731:
	fcmpeq16	%f26,	%f6,	%i6
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x66] %asi
	ldsw	[%l7 + 0x44],	%i7
	sth	%i4,	[%l7 + 0x68]
	xnorcc	%l3,	0x1B31,	%i2
	ldsw	[%l7 + 0x24],	%i0
	fcmpd	%fcc3,	%f14,	%f28
	alignaddr	%o2,	%l4,	%o3
	movrlez	%i5,	0x12D,	%l2
	sdiv	%l6,	0x1999,	%g2
	tge	%xcc,	0x4
	tg	%xcc,	0x0
	edge8	%l0,	%o7,	%o0
	ldsh	[%l7 + 0x30],	%o4
	bn,pt	%xcc,	loop_732
	tl	%icc,	0x7
	fmovsne	%icc,	%f31,	%f15
	tsubcc	%i1,	0x0B83,	%g3
loop_732:
	udivx	%o6,	0x1C6A,	%g4
	bvc,a	%xcc,	loop_733
	xor	%o1,	%g1,	%g5
	call	loop_734
	subcc	%l5,	0x0C24,	%l1
loop_733:
	fmovdn	%xcc,	%f25,	%f3
	sir	0x137D
loop_734:
	nop
	set	0x60, %o0
	sta	%f26,	[%l7 + %o0] 0x10
	sra	%g6,	%g7,	%i3
	bleu,a	%icc,	loop_735
	edge8	%i6,	%i7,	%i4
	std	%l2,	[%l7 + 0x58]
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x11,	%f6
loop_735:
	tsubcctv	%i2,	0x0212,	%i0
	ble,pt	%xcc,	loop_736
	fpsub16	%f6,	%f30,	%f10
	bne,a	loop_737
	tge	%xcc,	0x0
loop_736:
	andcc	%o2,	%l4,	%o5
	movg	%icc,	%i5,	%o3
loop_737:
	bn	%xcc,	loop_738
	mulx	%l2,	0x1DC9,	%l6
	fone	%f22
	faligndata	%f16,	%f12,	%f10
loop_738:
	tg	%icc,	0x3
	srlx	%g2,	0x1A,	%o7
	fmul8sux16	%f28,	%f24,	%f4
	fmovd	%f12,	%f0
	andncc	%l0,	%o4,	%i1
	andncc	%g3,	%o0,	%g4
	fbne,a	%fcc3,	loop_739
	subccc	%o6,	0x0A0C,	%o1
	edge32ln	%g1,	%l5,	%l1
	edge16	%g6,	%g5,	%i3
loop_739:
	alignaddrl	%g7,	%i7,	%i6
	fbo,a	%fcc0,	loop_740
	andcc	%l3,	%i2,	%i4
	smulcc	%o2,	0x1E48,	%i0
	movgu	%xcc,	%o5,	%l4
loop_740:
	movrgez	%o3,	0x34F,	%i5
	fmovdg	%icc,	%f5,	%f11
	srax	%l6,	0x1C,	%g2
	popc	%l2,	%l0
	fmul8ulx16	%f24,	%f10,	%f28
	movrgez	%o7,	0x275,	%o4
	brgz,a	%i1,	loop_741
	bgu,a,pn	%icc,	loop_742
	fpack16	%f24,	%f29
	set	0x54, %i0
	ldswa	[%l7 + %i0] 0x0c,	%g3
loop_741:
	addc	%o0,	0x1614,	%o6
loop_742:
	edge8ln	%g4,	%g1,	%o1
	fmovrde	%l5,	%f30,	%f22
	udivx	%l1,	0x0D78,	%g6
	alignaddrl	%g5,	%i3,	%g7
	sub	%i6,	%i7,	%l3
	fmovrsne	%i2,	%f27,	%f29
	subcc	%i4,	%i0,	%o2
	orn	%o5,	%o3,	%l4
	ldsb	[%l7 + 0x14],	%i5
	array16	%g2,	%l2,	%l6
	udiv	%l0,	0x1080,	%o7
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x17
	membar	#Sync
	movrgez	%o4,	0x0DA,	%g3
	umul	%o0,	0x1F85,	%o6
	subcc	%g4,	0x0068,	%i1
	tneg	%icc,	0x4
	stx	%g1,	[%l7 + 0x78]
	fones	%f8
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%l5
	udivcc	%l1,	0x1EAE,	%g6
	fbue,a	%fcc3,	loop_743
	movgu	%icc,	%o1,	%g5
	ble	%icc,	loop_744
	ldsb	[%l7 + 0x16],	%g7
loop_743:
	fzero	%f16
	edge32	%i3,	%i7,	%l3
loop_744:
	nop
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f16
	tn	%icc,	0x2
	sub	%i2,	%i4,	%i0
	orncc	%o2,	0x1512,	%i6
	ldx	[%l7 + 0x68],	%o5
	fpack16	%f22,	%f2
	bleu,a,pt	%xcc,	loop_745
	movne	%xcc,	%o3,	%l4
	movvc	%xcc,	%g2,	%i5
	movpos	%icc,	%l6,	%l0
loop_745:
	movl	%xcc,	%o7,	%o4
	sllx	%l2,	%o0,	%g3
	tg	%xcc,	0x7
	tgu	%xcc,	0x0
	srlx	%g4,	0x1D,	%o6
	brgz,a	%i1,	loop_746
	fmovrsne	%l5,	%f22,	%f29
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x08] %asi,	%l1
loop_746:
	fmovsneg	%icc,	%f14,	%f9
	umul	%g1,	%g6,	%o1
	fmovdle	%icc,	%f29,	%f1
	sra	%g7,	0x0A,	%g5
	fmovdvs	%icc,	%f16,	%f3
	fornot2s	%f7,	%f13,	%f15
	movrgz	%i3,	0x25A,	%l3
	fxors	%f13,	%f0,	%f12
	bpos,a,pn	%xcc,	loop_747
	movrgez	%i7,	%i4,	%i2
	fmovdvc	%xcc,	%f15,	%f25
	sdivx	%i0,	0x1F5D,	%o2
loop_747:
	tpos	%xcc,	0x6
	movrne	%i6,	0x3D4,	%o3
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x11,	%l4
	sdivx	%o5,	0x04D0,	%i5
	fbule,a	%fcc2,	loop_748
	andncc	%g2,	%l6,	%l0
	movrlez	%o7,	0x0C3,	%l2
	udivx	%o4,	0x1725,	%o0
loop_748:
	edge8	%g3,	%g4,	%i1
	nop
	set	0x50, %g4
	std	%f24,	[%l7 + %g4]
	movcc	%xcc,	%o6,	%l1
	edge16l	%l5,	%g1,	%g6
	fnegs	%f21,	%f13
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o1
	sir	0x0E59
	movvc	%xcc,	%g5,	%i3
	fbne	%fcc1,	loop_749
	movleu	%xcc,	%g7,	%i7
	tle	%xcc,	0x3
	alignaddr	%i4,	%l3,	%i2
loop_749:
	sra	%i0,	%o2,	%o3
	taddcctv	%l4,	0x0F9B,	%o5
	sethi	0x0F1E,	%i6
	movge	%xcc,	%i5,	%l6
	fba,a	%fcc3,	loop_750
	edge8ln	%l0,	%g2,	%l2
	fcmpne16	%f30,	%f12,	%o7
	umul	%o0,	%g3,	%g4
loop_750:
	edge8	%i1,	%o6,	%l1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o4
	bvc,a	%xcc,	loop_751
	fmovdneg	%xcc,	%f22,	%f29
	fexpand	%f1,	%f30
	fsrc2	%f14,	%f16
loop_751:
	tsubcctv	%l5,	%g1,	%g6
	movre	%o1,	0x2A4,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf9
	membar	#Sync
	popc	%i3,	%i7
	fmovdcc	%icc,	%f24,	%f7
	fbule	%fcc2,	loop_752
	ld	[%l7 + 0x7C],	%f5
	fcmple16	%f18,	%f8,	%g7
	movrlz	%i4,	0x232,	%l3
loop_752:
	fones	%f28
	fcmps	%fcc1,	%f12,	%f23
	fmovs	%f17,	%f10
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf1
	membar	#Sync
	stb	%i2,	[%l7 + 0x5F]
	tle	%xcc,	0x3
	fpsub32	%f16,	%f24,	%f10
	fmovdl	%xcc,	%f1,	%f9
	fmovrdgz	%i0,	%f10,	%f8
	edge32l	%o3,	%o2,	%l4
	st	%f4,	[%l7 + 0x7C]
	edge8	%i6,	%o5,	%l6
	popc	%i5,	%g2
	nop
	set	0x30, %g3
	sth	%l0,	[%l7 + %g3]
	movl	%xcc,	%l2,	%o7
	fmovrse	%o0,	%f27,	%f18
	srl	%g4,	%g3,	%o6
	movcs	%icc,	%l1,	%i1
	edge8n	%o4,	%g1,	%g6
	mulscc	%l5,	0x05B6,	%o1
	faligndata	%f12,	%f22,	%f4
	add	%i3,	0x1D35,	%i7
	fexpand	%f11,	%f26
	brlz	%g5,	loop_753
	alignaddrl	%g7,	%l3,	%i2
	movre	%i0,	%i4,	%o3
	movrgz	%l4,	0x3F6,	%i6
loop_753:
	addccc	%o2,	%l6,	%i5
	array16	%g2,	%o5,	%l0
	alignaddrl	%l2,	%o0,	%g4
	subccc	%g3,	%o6,	%l1
	movcs	%xcc,	%i1,	%o4
	ldsb	[%l7 + 0x7C],	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g1,	0x0D7A,	%l5
	fpsub32s	%f14,	%f21,	%f19
	movrlez	%o1,	%g6,	%i3
	fmovs	%f7,	%f10
	prefetch	[%l7 + 0x10],	 0x0
	ldd	[%l7 + 0x70],	%g4
	tleu	%xcc,	0x3
	fmovrdgez	%i7,	%f24,	%f18
	fnot2s	%f0,	%f23
	fbul	%fcc3,	loop_754
	bne,a	loop_755
	brlz	%g7,	loop_756
	orcc	%i2,	0x01A3,	%l3
loop_754:
	fmovsle	%xcc,	%f19,	%f31
loop_755:
	sth	%i4,	[%l7 + 0x2A]
loop_756:
	edge16	%i0,	%l4,	%o3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f1
	fmovrsgz	%i6,	%f0,	%f19
	fsrc1s	%f1,	%f25
	movrne	%o2,	0x230,	%l6
	tneg	%icc,	0x1
	movrlz	%g2,	0x06D,	%o5
	mulscc	%l0,	0x1FC5,	%l2
	edge32ln	%i5,	%g4,	%o0
	edge16ln	%o6,	%l1,	%i1
	tneg	%xcc,	0x5
	addc	%g3,	%o7,	%g1
	movpos	%icc,	%l5,	%o4
	tle	%icc,	0x5
	ldd	[%l7 + 0x50],	%o0
	fcmple32	%f24,	%f12,	%g6
	sdiv	%g5,	0x11E4,	%i3
	membar	0x47
	addc	%i7,	%g7,	%i2
	brlz	%l3,	loop_757
	movpos	%xcc,	%i4,	%i0
	edge16l	%l4,	%i6,	%o3
	alignaddrl	%o2,	%g2,	%o5
loop_757:
	mulscc	%l6,	%l0,	%l2
	stw	%i5,	[%l7 + 0x18]
	movleu	%xcc,	%g4,	%o6
	fnor	%f4,	%f20,	%f6
	stbar
	srl	%o0,	0x08,	%i1
	edge16n	%l1,	%g3,	%o7
	edge32ln	%l5,	%o4,	%g1
	wr	%g0,	0x2b,	%asi
	stba	%g6,	[%l7 + 0x69] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g5
	bgu,pn	%icc,	loop_758
	movne	%icc,	%i3,	%o1
	fmul8x16	%f27,	%f18,	%f2
	tne	%icc,	0x1
loop_758:
	movne	%icc,	%g7,	%i2
	fpack32	%f22,	%f8,	%f18
	fbe	%fcc2,	loop_759
	movgu	%xcc,	%i7,	%l3
	ldx	[%l7 + 0x20],	%i0
	fmovrdlz	%i4,	%f22,	%f20
loop_759:
	edge8n	%l4,	%i6,	%o3
	ldx	[%l7 + 0x68],	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o5,	%l6
	set	0x48, %g1
	lduwa	[%l7 + %g1] 0x15,	%l0
	tle	%icc,	0x6
	fsrc1s	%f1,	%f28
	tcs	%icc,	0x6
	set	0x120, %l3
	stxa	%o2,	[%g0 + %l3] 0x52
	be,pn	%xcc,	loop_760
	sll	%l2,	%g4,	%i5
	taddcc	%o0,	%i1,	%o6
	nop
	setx	loop_761,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_760:
	movleu	%icc,	%g3,	%o7
	fmovdcc	%icc,	%f18,	%f10
	andncc	%l1,	%o4,	%l5
loop_761:
	fmovsgu	%icc,	%f16,	%f24
	orn	%g6,	0x1328,	%g5
	sub	%g1,	0x1E9E,	%i3
	udivcc	%g7,	0x1C51,	%o1
	fbge,a	%fcc2,	loop_762
	movle	%xcc,	%i2,	%l3
	te	%icc,	0x1
	fmovsge	%xcc,	%f5,	%f3
loop_762:
	fbge	%fcc2,	loop_763
	bvs	%icc,	loop_764
	fmovrdne	%i7,	%f2,	%f16
	fcmpgt16	%f20,	%f2,	%i0
loop_763:
	fmovdvs	%icc,	%f3,	%f15
loop_764:
	move	%xcc,	%i4,	%i6
	sub	%l4,	%g2,	%o5
	call	loop_765
	tne	%xcc,	0x1
	subccc	%o3,	0x0EF8,	%l6
	ta	%xcc,	0x2
loop_765:
	fbuge	%fcc3,	loop_766
	fpadd32	%f20,	%f18,	%f10
	movl	%xcc,	%l0,	%o2
	xnorcc	%g4,	%i5,	%l2
loop_766:
	swap	[%l7 + 0x4C],	%i1
	flush	%l7 + 0x40
	mova	%icc,	%o6,	%g3
	fmovrdlz	%o0,	%f18,	%f28
	movrlez	%l1,	0x147,	%o7
	subc	%o4,	0x09A5,	%g6
	brlez	%l5,	loop_767
	movle	%xcc,	%g5,	%g1
	tn	%icc,	0x0
	tgu	%xcc,	0x7
loop_767:
	tgu	%icc,	0x4
	taddcctv	%i3,	0x0962,	%o1
	edge16	%g7,	%l3,	%i2
	fnot2s	%f4,	%f18
	sll	%i7,	%i0,	%i4
	movrlz	%l4,	0x2FE,	%i6
	xnorcc	%g2,	%o3,	%o5
	orn	%l0,	%l6,	%g4
	brgz	%o2,	loop_768
	subc	%i5,	%l2,	%i1
	fmovsge	%icc,	%f4,	%f17
	nop
	setx loop_769, %l0, %l1
	jmpl %l1, %o6
loop_768:
	orn	%g3,	0x0AD6,	%o0
	std	%l0,	[%l7 + 0x70]
	sdivcc	%o4,	0x142D,	%g6
loop_769:
	movneg	%icc,	%o7,	%l5
	movn	%icc,	%g5,	%i3
	fpsub32	%f2,	%f0,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o1,	%g7,	%g1
	edge16l	%i2,	%i7,	%i0
	tcs	%icc,	0x4
	array8	%l3,	%i4,	%i6
	and	%g2,	%l4,	%o3
	sethi	0x1236,	%l0
	xorcc	%o5,	%g4,	%l6
	fxor	%f0,	%f6,	%f20
	movrne	%o2,	0x34F,	%i5
	movrne	%i1,	0x2EE,	%o6
	fcmpgt16	%f14,	%f8,	%g3
	movne	%icc,	%l2,	%o0
	ba,a,pt	%icc,	loop_770
	fcmpne16	%f30,	%f6,	%l1
	tvc	%xcc,	0x5
	fbe,a	%fcc0,	loop_771
loop_770:
	tvc	%icc,	0x1
	set	0x5C, %g2
	ldswa	[%l7 + %g2] 0x88,	%o4
loop_771:
	edge16n	%g6,	%l5,	%g5
	ldstub	[%l7 + 0x3C],	%o7
	udivx	%o1,	0x0C78,	%i3
	movn	%xcc,	%g7,	%i2
	array16	%g1,	%i0,	%l3
	umulcc	%i4,	0x1453,	%i6
	set	0x4E, %i5
	ldsha	[%l7 + %i5] 0x10,	%g2
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x0c,	%l4
	tge	%xcc,	0x4
	edge32l	%o3,	%l0,	%i7
	fmovrde	%g4,	%f14,	%f22
	movrlz	%o5,	0x110,	%o2
	sir	0x1748
	sll	%l6,	%i5,	%i1
	sir	0x10A2
	fbule,a	%fcc1,	loop_772
	subcc	%g3,	%o6,	%l2
	movge	%icc,	%l1,	%o0
	addccc	%o4,	0x122A,	%l5
loop_772:
	ba,pn	%icc,	loop_773
	fmovse	%icc,	%f14,	%f13
	fmovdcc	%icc,	%f19,	%f17
	tneg	%xcc,	0x0
loop_773:
	movg	%xcc,	%g5,	%g6
	movg	%icc,	%o1,	%o7
	movleu	%icc,	%i3,	%i2
	fone	%f6
	edge32l	%g7,	%g1,	%l3
	wr	%g0,	0x89,	%asi
	sta	%f29,	[%l7 + 0x1C] %asi
	array32	%i0,	%i4,	%i6
	movvs	%xcc,	%l4,	%o3
	subcc	%g2,	0x118F,	%i7
	fmovd	%f14,	%f28
	fnors	%f3,	%f7,	%f24
	sth	%l0,	[%l7 + 0x76]
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3D] %asi,	%g4
	membar	0x5A
	movcs	%icc,	%o5,	%o2
	fcmpeq16	%f30,	%f8,	%l6
	fpadd16s	%f24,	%f8,	%f5
	addcc	%i1,	0x0A86,	%g3
	movpos	%icc,	%o6,	%l2
	fmovrdlz	%i5,	%f26,	%f10
	fmovdvs	%xcc,	%f29,	%f7
	orn	%o0,	0x027F,	%o4
	fcmpes	%fcc0,	%f8,	%f0
	fbl	%fcc2,	loop_774
	brgz	%l1,	loop_775
	stb	%l5,	[%l7 + 0x6A]
	movre	%g6,	%g5,	%o7
loop_774:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o1
loop_775:
	std	%f16,	[%l7 + 0x48]
	bge	%xcc,	loop_776
	tge	%icc,	0x2
	alignaddrl	%i3,	%g7,	%i2
	subcc	%g1,	%i0,	%i4
loop_776:
	tsubcc	%l3,	%l4,	%i6
	fmovrdlz	%o3,	%f30,	%f24
	fmovrse	%g2,	%f28,	%f7
	movrgz	%l0,	%i7,	%o5
	edge8l	%g4,	%o2,	%i1
	fzeros	%f28
	fpsub32s	%f20,	%f21,	%f7
	nop
	setx loop_777, %l0, %l1
	jmpl %l1, %l6
	mova	%xcc,	%g3,	%o6
	fbule	%fcc0,	loop_778
	membar	0x04
loop_777:
	udivx	%i5,	0x11AC,	%o0
	tg	%xcc,	0x2
loop_778:
	subcc	%o4,	%l2,	%l1
	movn	%icc,	%g6,	%g5
	array8	%o7,	%l5,	%o1
	umulcc	%i3,	0x02DC,	%g7
	nop
	setx loop_779, %l0, %l1
	jmpl %l1, %g1
	fmovsn	%icc,	%f27,	%f3
	edge8n	%i0,	%i2,	%i4
	ta	%xcc,	0x7
loop_779:
	ld	[%l7 + 0x34],	%f7
	tpos	%xcc,	0x3
	srlx	%l3,	%i6,	%o3
	ta	%icc,	0x0
	tgu	%icc,	0x7
	bgu,pt	%xcc,	loop_780
	movle	%icc,	%g2,	%l4
	set	0x6C, %i6
	ldsba	[%l7 + %i6] 0x04,	%i7
loop_780:
	fbn,a	%fcc1,	loop_781
	alignaddr	%o5,	%g4,	%o2
	tge	%icc,	0x1
	be	loop_782
loop_781:
	bvc,a,pn	%icc,	loop_783
	sir	0x15B7
	edge32l	%l0,	%i1,	%l6
loop_782:
	fbuge	%fcc3,	loop_784
loop_783:
	and	%g3,	%o6,	%i5
	edge16ln	%o0,	%l2,	%o4
	sdivcc	%l1,	0x06E3,	%g6
loop_784:
	fbg,a	%fcc3,	loop_785
	tleu	%xcc,	0x3
	subcc	%g5,	0x1B62,	%o7
	fxnor	%f26,	%f2,	%f22
loop_785:
	fpack16	%f22,	%f12
	fornot2	%f18,	%f2,	%f18
	movrgez	%l5,	%i3,	%g7
	orncc	%g1,	0x1346,	%o1
	movrlez	%i2,	0x364,	%i0
	movrlez	%l3,	0x0F7,	%i4
	fble	%fcc3,	loop_786
	movpos	%icc,	%o3,	%g2
	ld	[%l7 + 0x38],	%f1
	movneg	%icc,	%l4,	%i6
loop_786:
	udiv	%o5,	0x1FC2,	%g4
	fmovs	%f11,	%f2
	fornot2s	%f2,	%f4,	%f9
	tsubcctv	%o2,	0x0D8C,	%l0
	edge8ln	%i1,	%i7,	%l6
	xnorcc	%g3,	0x14DD,	%i5
	popc	0x0993,	%o6
	tne	%icc,	0x0
	wr	%g0,	0x80,	%asi
	stxa	%l2,	[%l7 + 0x20] %asi
	movvs	%icc,	%o0,	%l1
	sub	%o4,	0x0D8D,	%g6
	fmovsneg	%xcc,	%f4,	%f30
	set	0x34, %l6
	sta	%f25,	[%l7 + %l6] 0x19
	movneg	%xcc,	%o7,	%g5
	movre	%i3,	0x3EB,	%g7
	taddcc	%g1,	0x1702,	%l5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	ta	%xcc,	0x3
	movrgez	%o1,	0x00B,	%i0
	bge	loop_787
	movcs	%xcc,	%i4,	%l3
	fnand	%f14,	%f30,	%f14
	fandnot1	%f12,	%f8,	%f6
loop_787:
	bpos,a	loop_788
	array32	%o3,	%g2,	%l4
	movneg	%icc,	%o5,	%i6
	orcc	%o2,	%l0,	%g4
loop_788:
	fabsd	%f2,	%f20
	fmovs	%f13,	%f1
	bg,a	%icc,	loop_789
	add	%i1,	0x142E,	%i7
	fpadd32s	%f4,	%f14,	%f11
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%l6
loop_789:
	edge32	%i5,	%o6,	%g3
	sll	%o0,	0x13,	%l1
	set	0x14, %o4
	swapa	[%l7 + %o4] 0x80,	%o4
	movre	%g6,	%o7,	%g5
	edge32l	%i3,	%g7,	%g1
	add	%l5,	%i2,	%o1
	tge	%xcc,	0x0
	nop
	setx loop_790, %l0, %l1
	jmpl %l1, %i0
	orn	%l2,	0x15F3,	%i4
	mulx	%l3,	0x1554,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_790:
	array32	%l4,	%g2,	%o5
	fxors	%f19,	%f3,	%f6
	fmovdgu	%icc,	%f23,	%f28
	fmovde	%xcc,	%f29,	%f10
	fabss	%f25,	%f31
	movcc	%xcc,	%i6,	%o2
	brgz,a	%g4,	loop_791
	srlx	%i1,	%i7,	%l6
	nop
	setx loop_792, %l0, %l1
	jmpl %l1, %i5
	fcmpgt16	%f8,	%f8,	%l0
loop_791:
	std	%o6,	[%l7 + 0x28]
	fmovdvs	%xcc,	%f16,	%f26
loop_792:
	movvc	%icc,	%g3,	%l1
	fcmpd	%fcc2,	%f14,	%f4
	ldd	[%l7 + 0x50],	%f30
	fbl	%fcc2,	loop_793
	fmovdne	%icc,	%f27,	%f8
	fblg,a	%fcc1,	loop_794
	edge16l	%o4,	%o0,	%g6
loop_793:
	array16	%g5,	%o7,	%g7
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%g0
loop_794:
	nop
	set	0x0C, %g7
	stb	%i3,	[%l7 + %g7]
	fmovdl	%xcc,	%f7,	%f12
	fcmple16	%f10,	%f18,	%i2
	fnand	%f26,	%f24,	%f4
	edge16	%l5,	%i0,	%o1
	udiv	%i4,	0x1E50,	%l2
	movrlz	%o3,	0x06B,	%l4
	alignaddrl	%g2,	%o5,	%l3
	movrgez	%o2,	0x20A,	%i6
	umulcc	%g4,	0x0787,	%i1
	edge32ln	%l6,	%i5,	%i7
	fmovdle	%xcc,	%f24,	%f21
	nop
	setx	loop_795,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%l0,	%g3
	xnorcc	%l1,	0x13D2,	%o4
	smulcc	%o6,	0x00E5,	%g6
loop_795:
	sir	0x000B
	movge	%icc,	%g5,	%o0
	movl	%icc,	%o7,	%g7
	subccc	%g1,	0x1829,	%i2
	andn	%i3,	%l5,	%o1
	orn	%i0,	%i4,	%l2
	fcmpeq16	%f16,	%f24,	%o3
	or	%l4,	0x0C9D,	%g2
	umulcc	%l3,	%o5,	%o2
	tl	%xcc,	0x5
	fcmpeq32	%f2,	%f10,	%i6
	taddcctv	%i1,	%g4,	%l6
	sllx	%i7,	0x01,	%i5
	fands	%f7,	%f18,	%f13
	andn	%l0,	%g3,	%o4
	fbg,a	%fcc2,	loop_796
	brlz,a	%l1,	loop_797
	movl	%xcc,	%g6,	%g5
	fmovscs	%icc,	%f21,	%f11
loop_796:
	fmovsle	%xcc,	%f0,	%f3
loop_797:
	bl,pn	%xcc,	loop_798
	udivx	%o0,	0x05DF,	%o6
	ldx	[%l7 + 0x60],	%g7
	fbue	%fcc0,	loop_799
loop_798:
	tg	%xcc,	0x2
	fcmpne16	%f6,	%f0,	%o7
	fmovdneg	%xcc,	%f3,	%f22
loop_799:
	fcmple32	%f18,	%f24,	%i2
	edge32	%i3,	%g1,	%l5
	udivcc	%o1,	0x0385,	%i4
	fbule,a	%fcc1,	loop_800
	fmovsl	%icc,	%f10,	%f11
	edge8n	%i0,	%l2,	%o3
	fpmerge	%f29,	%f10,	%f4
loop_800:
	smul	%l4,	%l3,	%o5
	lduw	[%l7 + 0x74],	%g2
	edge16	%i6,	%i1,	%g4
	ba,pt	%xcc,	loop_801
	fpsub16s	%f2,	%f5,	%f26
	st	%f8,	[%l7 + 0x08]
	srlx	%l6,	%o2,	%i7
loop_801:
	tneg	%xcc,	0x7
	addcc	%i5,	%g3,	%l0
	stw	%o4,	[%l7 + 0x3C]
	sethi	0x1153,	%g6
	movg	%icc,	%g5,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc2,	loop_802
	subcc	%o6,	%g7,	%o0
	fnand	%f16,	%f6,	%f2
	sethi	0x1888,	%o7
loop_802:
	lduw	[%l7 + 0x54],	%i3
	movcs	%xcc,	%g1,	%i2
	bne	%icc,	loop_803
	lduh	[%l7 + 0x4E],	%o1
	tcs	%xcc,	0x5
	bcc	%icc,	loop_804
loop_803:
	fmovsgu	%icc,	%f10,	%f7
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x57] %asi,	%i4
loop_804:
	udiv	%l5,	0x0B1A,	%i0
	nop
	set	0x6C, %i4
	stw	%l2,	[%l7 + %i4]
	mova	%xcc,	%l4,	%o3
	fzeros	%f2
	brlz	%o5,	loop_805
	edge32	%l3,	%g2,	%i1
	ldx	[%l7 + 0x28],	%i6
	tsubcc	%l6,	0x1B33,	%o2
loop_805:
	nop
	set	0x18, %l1
	lduwa	[%l7 + %l1] 0x81,	%i7
	fmovsgu	%xcc,	%f4,	%f23
	set	0x48, %o5
	stxa	%g4,	[%l7 + %o5] 0x22
	membar	#Sync
	edge16ln	%g3,	%i5,	%l0
	and	%o4,	%g5,	%l1
	fmovsa	%icc,	%f18,	%f5
	edge16n	%o6,	%g7,	%o0
	srlx	%g6,	%i3,	%g1
	stb	%i2,	[%l7 + 0x0D]
	mulx	%o1,	0x05BF,	%i4
	umulcc	%o7,	%l5,	%l2
	fone	%f16
	xorcc	%i0,	0x1736,	%l4
	fands	%f9,	%f6,	%f5
	tvs	%icc,	0x1
	lduh	[%l7 + 0x1C],	%o5
	orn	%l3,	%g2,	%o3
	array8	%i6,	%i1,	%l6
	fbue	%fcc0,	loop_806
	mulscc	%o2,	0x13C7,	%g4
	tn	%icc,	0x6
	edge32ln	%i7,	%i5,	%l0
loop_806:
	movcs	%icc,	%o4,	%g3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%g5
	andcc	%l1,	0x0769,	%o6
	smul	%g7,	%o0,	%i3
	array32	%g1,	%g6,	%o1
	movcs	%xcc,	%i2,	%i4
	move	%xcc,	%l5,	%l2
	fxnors	%f14,	%f18,	%f15
	tsubcc	%o7,	%i0,	%l4
	tle	%icc,	0x3
	movrgez	%o5,	%l3,	%g2
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x15,	%o2
	fbg	%fcc0,	loop_807
	xor	%i6,	%i1,	%o2
	fmovrdgez	%l6,	%f30,	%f26
	movge	%icc,	%g4,	%i5
loop_807:
	sir	0x0589
	subc	%l0,	%o4,	%g3
	fxnor	%f26,	%f28,	%f24
	move	%icc,	%g5,	%i7
	tneg	%xcc,	0x5
	stx	%o6,	[%l7 + 0x18]
	fcmple32	%f18,	%f2,	%g7
	subccc	%l1,	0x10EB,	%o0
	smul	%i3,	0x1363,	%g6
	bvs,a	%icc,	loop_808
	tcs	%icc,	0x3
	srlx	%g1,	0x07,	%o1
	stx	%i2,	[%l7 + 0x20]
loop_808:
	movle	%xcc,	%i4,	%l2
	movrlez	%o7,	%l5,	%l4
	edge16n	%i0,	%o5,	%g2
	bneg	loop_809
	movcc	%icc,	%o3,	%l3
	fbe,a	%fcc0,	loop_810
	bn,a,pt	%icc,	loop_811
loop_809:
	fone	%f0
	fmul8ulx16	%f28,	%f10,	%f24
loop_810:
	fbug	%fcc1,	loop_812
loop_811:
	fmovs	%f6,	%f28
	xnor	%i6,	0x02D3,	%o2
	edge16ln	%i1,	%l6,	%i5
loop_812:
	fabss	%f31,	%f11
	alignaddrl	%g4,	%o4,	%g3
	alignaddr	%l0,	%g5,	%i7
	srax	%o6,	0x16,	%g7
	fmovrdgz	%l1,	%f8,	%f20
	srlx	%i3,	0x0D,	%o0
	fmul8x16al	%f14,	%f26,	%f16
	udivcc	%g6,	0x0391,	%g1
	fbg	%fcc0,	loop_813
	sdivcc	%i2,	0x1370,	%i4
	edge8	%o1,	%o7,	%l5
	ba	%icc,	loop_814
loop_813:
	bvs,a	%xcc,	loop_815
	edge32n	%l2,	%l4,	%i0
	te	%xcc,	0x2
loop_814:
	xor	%g2,	0x0449,	%o3
loop_815:
	popc	%o5,	%l3
	fpadd16	%f16,	%f2,	%f6
	mova	%icc,	%i6,	%o2
	and	%l6,	%i1,	%g4
	fcmpgt32	%f10,	%f6,	%i5
	fpadd32	%f10,	%f18,	%f18
	srax	%g3,	%l0,	%g5
	edge32l	%o4,	%o6,	%i7
	fmovdpos	%icc,	%f17,	%f9
	addc	%g7,	%l1,	%i3
	fxor	%f26,	%f16,	%f12
	brgz	%o0,	loop_816
	xnor	%g6,	0x11ED,	%g1
	stx	%i2,	[%l7 + 0x28]
	array32	%o1,	%o7,	%i4
loop_816:
	movvc	%icc,	%l2,	%l5
	andcc	%l4,	%i0,	%g2
	edge32	%o5,	%l3,	%i6
	bg,a,pt	%icc,	loop_817
	fpmerge	%f21,	%f22,	%f8
	addc	%o3,	%l6,	%o2
	edge8l	%g4,	%i1,	%g3
loop_817:
	tgu	%icc,	0x3
	or	%l0,	0x1286,	%g5
	set	0x36, %i3
	ldsba	[%l7 + %i3] 0x80,	%o4
	edge16n	%o6,	%i5,	%i7
	fbue,a	%fcc1,	loop_818
	fpadd16s	%f8,	%f31,	%f15
	srl	%g7,	%i3,	%l1
	bvs,a	loop_819
loop_818:
	fnand	%f20,	%f14,	%f8
	movg	%icc,	%o0,	%g1
	movne	%xcc,	%i2,	%o1
loop_819:
	bshuffle	%f4,	%f6,	%f24
	ldx	[%l7 + 0x68],	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%i4
	smul	%l5,	0x1073,	%l4
	tvs	%xcc,	0x0
	subccc	%i0,	0x0D91,	%g2
	umul	%l2,	0x1C3B,	%l3
	movrgez	%o5,	%o3,	%l6
	alignaddr	%i6,	%g4,	%o2
	orncc	%g3,	%i1,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x2
	te	%xcc,	0x0
	srlx	%o4,	0x0C,	%o6
	tsubcc	%i5,	%i7,	%g7
	fmovrslz	%g5,	%f16,	%f23
	smulcc	%l1,	0x1D2F,	%i3
	fpadd16s	%f26,	%f21,	%f6
	std	%o0,	[%l7 + 0x60]
	stw	%g1,	[%l7 + 0x38]
	tvs	%xcc,	0x3
	tleu	%icc,	0x6
	mulscc	%i2,	%g6,	%o7
	edge8n	%i4,	%l5,	%l4
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x80,	%o0
	ba,pn	%xcc,	loop_820
	movvs	%icc,	%g2,	%l2
	movrgez	%i0,	%l3,	%o5
	set	0x54, %g6
	swapa	[%l7 + %g6] 0x11,	%o3
loop_820:
	movrgez	%i6,	0x094,	%g4
	fbu	%fcc2,	loop_821
	bleu,a	%icc,	loop_822
	edge8ln	%o2,	%l6,	%i1
	tge	%xcc,	0x7
loop_821:
	fbne	%fcc0,	loop_823
loop_822:
	edge8n	%g3,	%l0,	%o6
	bl	%icc,	loop_824
	swap	[%l7 + 0x50],	%o4
loop_823:
	swap	[%l7 + 0x54],	%i7
	tvc	%icc,	0x4
loop_824:
	brlez	%g7,	loop_825
	edge16	%i5,	%l1,	%g5
	set	0x5C, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i3
loop_825:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%o0
	movle	%xcc,	%g1,	%g6
	edge16ln	%o7,	%i2,	%l5
	mova	%icc,	%i4,	%o1
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l4
	ldub	[%l7 + 0x63],	%l2
	edge16	%i0,	%l3,	%o5
	membar	0x69
	wr	%g0,	0xea,	%asi
	stda	%g2,	[%l7 + 0x68] %asi
	membar	#Sync
	st	%f7,	[%l7 + 0x68]
	and	%o3,	%i6,	%o2
	movre	%l6,	0x19C,	%g4
	brz	%g3,	loop_826
	movrlez	%l0,	%o6,	%o4
	movrlz	%i1,	%i7,	%i5
	swap	[%l7 + 0x40],	%g7
loop_826:
	fxors	%f27,	%f15,	%f24
	movrlez	%g5,	0x2C1,	%l1
	fmovrdlez	%o0,	%f4,	%f6
	movn	%icc,	%g1,	%i3
	smul	%g6,	%i2,	%l5
	fmovsgu	%icc,	%f30,	%f17
	fand	%f30,	%f18,	%f24
	and	%o7,	0x1CE3,	%i4
	fbn	%fcc1,	loop_827
	sub	%o1,	0x10AD,	%l4
	nop
	setx loop_828, %l0, %l1
	jmpl %l1, %l2
	fbule	%fcc3,	loop_829
loop_827:
	edge32	%l3,	%i0,	%o5
	edge16l	%g2,	%o3,	%o2
loop_828:
	fbug	%fcc0,	loop_830
loop_829:
	xnor	%i6,	%g4,	%g3
	flush	%l7 + 0x64
	andn	%l0,	0x1E61,	%o6
loop_830:
	fornot1	%f14,	%f2,	%f24
	fmovse	%icc,	%f6,	%f12
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o4
	orncc	%i1,	%i7,	%l6
	udivx	%i5,	0x0EEE,	%g7
	movpos	%xcc,	%g5,	%l1
	wr	%g0,	0x2a,	%asi
	stwa	%o0,	[%l7 + 0x64] %asi
	membar	#Sync
	fmovrdne	%g1,	%f8,	%f8
	movrlz	%i3,	%g6,	%l5
	edge16l	%o7,	%i2,	%i4
	array32	%o1,	%l2,	%l3
	movleu	%icc,	%l4,	%o5
	fnegs	%f26,	%f26
	movleu	%icc,	%g2,	%i0
	and	%o3,	0x1BEF,	%o2
	fcmple16	%f18,	%f12,	%g4
	tsubcctv	%i6,	0x182F,	%g3
	tvc	%icc,	0x4
	tleu	%xcc,	0x7
	tcc	%xcc,	0x6
	te	%xcc,	0x7
	tl	%icc,	0x0
	andncc	%l0,	%o4,	%i1
	srlx	%i7,	0x08,	%o6
	fandnot2	%f22,	%f14,	%f14
	fmovrslz	%l6,	%f11,	%f14
	movleu	%xcc,	%g7,	%i5
	membar	0x0C
	sra	%l1,	%g5,	%g1
	movg	%icc,	%i3,	%o0
	srlx	%g6,	0x0A,	%o7
	movneg	%icc,	%i2,	%l5
	movrlz	%i4,	0x397,	%l2
	fmovdvc	%xcc,	%f29,	%f15
	tne	%icc,	0x5
	srl	%l3,	%l4,	%o1
	fbl,a	%fcc1,	loop_831
	smul	%g2,	%i0,	%o5
	sll	%o2,	%o3,	%g4
	movgu	%icc,	%g3,	%i6
loop_831:
	xnorcc	%o4,	%i1,	%i7
	lduw	[%l7 + 0x14],	%l0
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	array8	%g7,	%l6,	%i5
	wr	%g0,	0x2a,	%asi
	stda	%l0,	[%l7 + 0x78] %asi
	membar	#Sync
	tvc	%xcc,	0x0
	edge8n	%g5,	%i3,	%o0
	orcc	%g1,	0x08B7,	%g6
	srl	%i2,	%o7,	%i4
	sethi	0x1BF0,	%l2
	ldd	[%l7 + 0x70],	%f16
	sth	%l5,	[%l7 + 0x68]
	fmovsn	%xcc,	%f15,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l3,	0x036A,	%o1
	tsubcc	%g2,	0x16A0,	%l4
	brnz	%i0,	loop_832
	edge8ln	%o2,	%o3,	%o5
	udiv	%g3,	0x09C2,	%g4
	fzero	%f4
loop_832:
	fmul8x16al	%f30,	%f12,	%f16
	movre	%i6,	0x343,	%i1
	srl	%i7,	%l0,	%o6
	set	0x7C, %l0
	ldstuba	[%l7 + %l0] 0x19,	%g7
	movne	%icc,	%o4,	%l6
	bvc,pt	%xcc,	loop_833
	andncc	%l1,	%g5,	%i3
	andncc	%o0,	%i5,	%g1
	fmovse	%xcc,	%f25,	%f25
loop_833:
	edge32	%g6,	%i2,	%o7
	fnegd	%f0,	%f12
	fcmpne16	%f8,	%f30,	%l2
	fcmpgt16	%f30,	%f8,	%l5
	fmovrsgz	%l3,	%f2,	%f25
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x20] %asi,	%f25
	edge32l	%o1,	%g2,	%l4
	ldstub	[%l7 + 0x3F],	%i0
	addc	%i4,	%o3,	%o2
	be	loop_834
	edge8n	%o5,	%g3,	%i6
	tge	%xcc,	0x4
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f16
loop_834:
	tvc	%xcc,	0x2
	tg	%xcc,	0x2
	set	0x5B, %i1
	stba	%i1,	[%l7 + %i1] 0x14
	fmovdleu	%xcc,	%f20,	%f23
	tl	%xcc,	0x6
	xnorcc	%g4,	%l0,	%o6
	movn	%xcc,	%g7,	%i7
	sir	0x14B6
	bge,pn	%xcc,	loop_835
	stb	%o4,	[%l7 + 0x43]
	orn	%l6,	%l1,	%g5
	movrlez	%i3,	0x359,	%o0
loop_835:
	fsrc1	%f6,	%f0
	fones	%f12
	movcc	%xcc,	%g1,	%i5
	sllx	%g6,	%i2,	%l2
	movrlez	%l5,	0x124,	%l3
	ldsh	[%l7 + 0x38],	%o1
	movl	%xcc,	%o7,	%l4
	udivcc	%g2,	0x138E,	%i4
	lduw	[%l7 + 0x14],	%o3
	fmovrdgz	%o2,	%f26,	%f28
	fpadd32	%f8,	%f26,	%f8
	fornot2	%f22,	%f24,	%f14
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x7A] %asi,	%i0
	sdivx	%g3,	0x0DE8,	%o5
	srax	%i1,	%i6,	%g4
	fpsub32s	%f10,	%f24,	%f27
	set	0x3C, %i0
	stwa	%o6,	[%l7 + %i0] 0xe3
	membar	#Sync
	movne	%xcc,	%g7,	%i7
	fandnot2	%f0,	%f30,	%f12
	nop
	set	0x40, %o0
	stw	%o4,	[%l7 + %o0]
	fxnors	%f0,	%f14,	%f27
	movl	%icc,	%l6,	%l0
	fcmple32	%f12,	%f2,	%l1
	sub	%g5,	%o0,	%g1
	edge32n	%i3,	%i5,	%g6
	fpadd32	%f12,	%f2,	%f28
	udivx	%i2,	0x1E1E,	%l5
	brlez	%l3,	loop_836
	movvs	%xcc,	%o1,	%l2
	orcc	%o7,	0x1931,	%g2
	subc	%l4,	%i4,	%o3
loop_836:
	sir	0x01BE
	ldd	[%l7 + 0x40],	%f30
	fzero	%f6
	subccc	%i0,	%o2,	%g3
	udivx	%o5,	0x1C0B,	%i1
	edge32l	%g4,	%i6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o6,	%i7,	%o4
	set	0x7C, %l2
	lduwa	[%l7 + %l2] 0x10,	%l0
	movrgz	%l1,	0x350,	%l6
	movvs	%xcc,	%o0,	%g5
	bshuffle	%f12,	%f24,	%f16
	addcc	%g1,	%i3,	%i5
	ldsh	[%l7 + 0x12],	%i2
	xorcc	%g6,	%l5,	%l3
	fmovsl	%icc,	%f19,	%f16
	bpos,pn	%icc,	loop_837
	tleu	%xcc,	0x6
	edge8l	%o1,	%l2,	%o7
	movcc	%xcc,	%l4,	%i4
loop_837:
	edge32ln	%g2,	%o3,	%o2
	sdivx	%i0,	0x1A02,	%o5
	set	0x4E, %i2
	ldsba	[%l7 + %i2] 0x04,	%i1
	fornot2	%f20,	%f14,	%f22
	fble,a	%fcc3,	loop_838
	tsubcctv	%g3,	0x13C6,	%i6
	addc	%g4,	0x07AA,	%g7
	wr	%g0,	0x89,	%asi
	stwa	%o6,	[%l7 + 0x68] %asi
loop_838:
	tn	%xcc,	0x7
	fbne	%fcc3,	loop_839
	xor	%o4,	%l0,	%i7
	fmovdcs	%xcc,	%f30,	%f15
	move	%xcc,	%l1,	%o0
loop_839:
	tne	%icc,	0x0
	edge8l	%l6,	%g1,	%i3
	orn	%i5,	0x1FA4,	%g5
	orcc	%g6,	0x124F,	%i2
	tcs	%icc,	0x2
	movrgez	%l3,	%l5,	%o1
	add	%o7,	%l4,	%i4
	move	%icc,	%l2,	%o3
	bl,a	loop_840
	bge,a	%icc,	loop_841
	tcc	%icc,	0x4
	move	%icc,	%o2,	%g2
loop_840:
	membar	0x78
loop_841:
	brgez,a	%i0,	loop_842
	sdivx	%o5,	0x0CB6,	%i1
	movgu	%icc,	%g3,	%i6
	fpadd16s	%f11,	%f20,	%f20
loop_842:
	srax	%g4,	%g7,	%o6
	set	0x49, %g4
	ldsba	[%l7 + %g4] 0x14,	%l0
	sdiv	%i7,	0x14E3,	%l1
	tpos	%xcc,	0x0
	sdivx	%o0,	0x0939,	%o4
	set	0x40, %o7
	stda	%i6,	[%l7 + %o7] 0x2a
	membar	#Sync
	mova	%icc,	%g1,	%i5
	edge32l	%g5,	%g6,	%i2
	bpos,a,pn	%icc,	loop_843
	orn	%i3,	0x1391,	%l3
	fand	%f14,	%f6,	%f4
	edge8ln	%o1,	%l5,	%l4
loop_843:
	ldd	[%l7 + 0x70],	%o6
	brz	%l2,	loop_844
	lduh	[%l7 + 0x74],	%o3
	taddcctv	%o2,	0x1BE6,	%g2
	wr	%g0,	0x2f,	%asi
	stha	%i4,	[%l7 + 0x38] %asi
	membar	#Sync
loop_844:
	alignaddr	%o5,	%i1,	%g3
	ldx	[%l7 + 0x38],	%i0
	taddcc	%i6,	%g4,	%g7
	tleu	%icc,	0x6
	edge16ln	%l0,	%i7,	%o6
	andncc	%o0,	%l1,	%l6
	stb	%g1,	[%l7 + 0x21]
	fmovrslez	%i5,	%f10,	%f26
	stbar
	sra	%o4,	0x00,	%g5
	tl	%icc,	0x6
	fmovsvs	%xcc,	%f8,	%f29
	call	loop_845
	movcc	%icc,	%g6,	%i3
	fmovdleu	%xcc,	%f3,	%f0
	tleu	%icc,	0x0
loop_845:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l3
	edge16l	%i2,	%l5,	%o1
	edge32ln	%o7,	%l2,	%l4
	tgu	%icc,	0x7
	mulx	%o3,	0x09CF,	%o2
	andcc	%g2,	%i4,	%o5
	movge	%icc,	%i1,	%i0
	andcc	%i6,	0x15FC,	%g4
	fornot2s	%f2,	%f11,	%f15
	edge16n	%g7,	%l0,	%g3
	fbne,a	%fcc1,	loop_846
	tl	%icc,	0x4
	set	0x4E, %o3
	ldsha	[%l7 + %o3] 0x10,	%o6
loop_846:
	array32	%i7,	%l1,	%l6
	edge16ln	%g1,	%o0,	%i5
	udivx	%o4,	0x1446,	%g6
	bcs,a	loop_847
	bg,a,pn	%icc,	loop_848
	tl	%xcc,	0x5
	fsrc2	%f22,	%f20
loop_847:
	nop
	setx	loop_849,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_848:
	tvc	%icc,	0x7
	set	0x78, %g3
	stxa	%g5,	[%l7 + %g3] 0x0c
loop_849:
	movg	%xcc,	%l3,	%i2
	movpos	%icc,	%i3,	%l5
	movl	%icc,	%o7,	%o1
	nop
	set	0x50, %l4
	prefetch	[%l7 + %l4],	 0x3
	set	0x7D, %l3
	ldstuba	[%l7 + %l3] 0x89,	%l4
	membar	0x34
	movrgez	%o3,	0x396,	%l2
	addc	%o2,	%g2,	%i4
	fbule,a	%fcc3,	loop_850
	edge8l	%i1,	%o5,	%i6
	mova	%xcc,	%i0,	%g7
	taddcc	%l0,	0x1B08,	%g4
loop_850:
	prefetch	[%l7 + 0x44],	 0x0
	ba	loop_851
	fmovsvs	%xcc,	%f25,	%f7
	tge	%icc,	0x7
	array16	%g3,	%o6,	%i7
loop_851:
	mulscc	%l1,	0x1887,	%g1
	sethi	0x1E38,	%l6
	umul	%o0,	%o4,	%g6
	xor	%i5,	%g5,	%l3
	alignaddrl	%i2,	%l5,	%o7
	srlx	%i3,	0x17,	%o1
	fbge	%fcc3,	loop_852
	edge16n	%o3,	%l4,	%l2
	orn	%g2,	%o2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_852:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i4
	fbul	%fcc3,	loop_853
	fandnot2	%f0,	%f18,	%f28
	fmovrde	%i6,	%f6,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_853:
	fmovsl	%icc,	%f10,	%f4
	popc	0x0BAA,	%o5
	fpadd32	%f4,	%f30,	%f28
	andncc	%g7,	%l0,	%g4
	fmovdgu	%xcc,	%f14,	%f6
	sir	0x0DDA
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	fsrc2	%f10,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	loop_854
	fbn,a	%fcc0,	loop_855
	andcc	%o6,	0x1E08,	%i7
	edge8	%l1,	%g1,	%l6
loop_854:
	swap	[%l7 + 0x34],	%o0
loop_855:
	st	%f16,	[%l7 + 0x18]
	lduw	[%l7 + 0x54],	%o4
	fnot1	%f16,	%f20
	umul	%g6,	0x13B2,	%g3
	andn	%g5,	%l3,	%i5
	udiv	%l5,	0x01CF,	%i2
	edge16n	%i3,	%o7,	%o1
	siam	0x4
	stx	%o3,	[%l7 + 0x28]
	movg	%icc,	%l2,	%g2
	mulscc	%o2,	%l4,	%i4
	brgez	%i6,	loop_856
	edge32	%i1,	%o5,	%g7
	tvc	%xcc,	0x6
	ble,pn	%xcc,	loop_857
loop_856:
	fmul8x16au	%f29,	%f5,	%f6
	array8	%g4,	%i0,	%l0
	movrgz	%o6,	%l1,	%i7
loop_857:
	addc	%g1,	0x1532,	%o0
	brlez	%o4,	loop_858
	std	%i6,	[%l7 + 0x70]
	movn	%xcc,	%g6,	%g5
	fones	%f15
loop_858:
	array32	%l3,	%g3,	%l5
	orcc	%i5,	%i3,	%i2
	fpsub32s	%f23,	%f2,	%f10
	smul	%o7,	0x04C3,	%o1
	ldub	[%l7 + 0x60],	%l2
	tle	%icc,	0x3
	smulcc	%o3,	0x05F6,	%g2
	movrgz	%o2,	%i4,	%i6
	alignaddrl	%i1,	%o5,	%g7
	umul	%l4,	%g4,	%i0
	fzero	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l0,	%o6
	edge32l	%l1,	%g1,	%i7
	fmovrdlz	%o0,	%f8,	%f16
	udivcc	%l6,	0x1F1E,	%g6
	movrlz	%g5,	0x12B,	%o4
	fandnot1	%f0,	%f0,	%f10
	fnot1s	%f10,	%f17
	edge8l	%l3,	%l5,	%g3
	fbge,a	%fcc2,	loop_859
	movvc	%xcc,	%i5,	%i3
	ldsb	[%l7 + 0x3E],	%i2
	move	%xcc,	%o7,	%o1
loop_859:
	sub	%o3,	%g2,	%l2
	subc	%o2,	%i4,	%i6
	tpos	%icc,	0x3
	orcc	%i1,	0x0406,	%g7
	tcc	%xcc,	0x4
	tneg	%xcc,	0x0
	mulx	%l4,	%g4,	%o5
	srl	%l0,	%o6,	%l1
	edge32	%i0,	%g1,	%o0
	movcc	%xcc,	%l6,	%i7
	tvc	%icc,	0x6
	bcc,a,pt	%icc,	loop_860
	std	%f6,	[%l7 + 0x58]
	membar	0x7F
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_860:
	movvs	%xcc,	%g5,	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l3,	%l5
	fmovdne	%xcc,	%f25,	%f27
	stb	%g3,	[%l7 + 0x08]
	edge8n	%o4,	%i3,	%i2
	smulcc	%o7,	0x0671,	%i5
	prefetch	[%l7 + 0x54],	 0x1
	andcc	%o1,	%g2,	%o3
	wr	%g0,	0x89,	%asi
	stwa	%l2,	[%l7 + 0x48] %asi
	mova	%xcc,	%i4,	%o2
	tg	%icc,	0x6
	fsrc2s	%f31,	%f16
	edge16n	%i1,	%i6,	%l4
	sra	%g7,	%o5,	%g4
	edge32n	%o6,	%l0,	%l1
	sra	%g1,	0x07,	%o0
	orncc	%l6,	0x1A3F,	%i7
	fbue,a	%fcc2,	loop_861
	xnor	%i0,	%g6,	%l3
	ldsw	[%l7 + 0x24],	%g5
	movrgez	%g3,	%l5,	%i3
loop_861:
	std	%f30,	[%l7 + 0x38]
	ldx	[%l7 + 0x30],	%i2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x40] %asi,	%f6
	movre	%o4,	%o7,	%i5
	movn	%icc,	%o1,	%g2
	bn,a,pn	%icc,	loop_862
	edge16	%o3,	%i4,	%l2
	set	0x48, %g1
	stda	%o2,	[%l7 + %g1] 0xe2
	membar	#Sync
loop_862:
	subc	%i1,	%l4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x4
	movcs	%icc,	%g7,	%g4
	movrlz	%o6,	0x1EC,	%l0
	addc	%l1,	%g1,	%o5
	fbue	%fcc3,	loop_863
	movgu	%xcc,	%o0,	%i7
	fcmpgt32	%f6,	%f6,	%l6
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2D] %asi,	%i0
loop_863:
	movre	%g6,	%g5,	%g3
	movre	%l5,	0x1A2,	%l3
	fmovse	%xcc,	%f17,	%f11
	ldd	[%l7 + 0x08],	%i2
	xorcc	%i3,	%o7,	%i5
	fpadd32	%f4,	%f30,	%f20
	fbule,a	%fcc2,	loop_864
	smulcc	%o4,	0x0F1B,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f15,	%f11,	%f19
loop_864:
	umulcc	%o3,	%i4,	%o1
	sdivcc	%o2,	0x0A88,	%l2
	stw	%l4,	[%l7 + 0x30]
	tg	%xcc,	0x5
	fble	%fcc1,	loop_865
	fornot2	%f12,	%f16,	%f10
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
loop_865:
	ldd	[%l7 + 0x08],	%f14
	sethi	0x134D,	%g7
	mulscc	%i6,	0x1F0F,	%o6
	fornot1s	%f25,	%f12,	%f15
	bvc,pn	%icc,	loop_866
	movle	%icc,	%l0,	%g4
	tgu	%icc,	0x5
	array8	%l1,	%o5,	%o0
loop_866:
	addc	%i7,	0x0E90,	%l6
	udivcc	%g1,	0x0BF5,	%g6
	fmovdcc	%xcc,	%f30,	%f20
	edge16n	%g5,	%i0,	%l5
	fornot2	%f12,	%f0,	%f16
	tg	%xcc,	0x4
	sra	%g3,	%l3,	%i3
	tg	%icc,	0x2
	set	0x36, %i5
	lduha	[%l7 + %i5] 0x81,	%o7
	subccc	%i2,	0x023F,	%o4
	movrlz	%g2,	0x290,	%i5
	fpsub32	%f26,	%f18,	%f30
	fnand	%f18,	%f14,	%f4
	brz	%i4,	loop_867
	edge8l	%o1,	%o3,	%o2
	fmul8x16	%f14,	%f16,	%f30
	brlez,a	%l2,	loop_868
loop_867:
	brnz	%l4,	loop_869
	subcc	%g7,	%i6,	%o6
	membar	0x36
loop_868:
	tleu	%xcc,	0x5
loop_869:
	umulcc	%i1,	0x0455,	%g4
	array16	%l0,	%l1,	%o5
	stb	%o0,	[%l7 + 0x6D]
	fmovsle	%icc,	%f23,	%f17
	sir	0x03AB
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x19,	%l6
	fpsub16s	%f23,	%f13,	%f23
	fmovspos	%xcc,	%f20,	%f14
	umulcc	%g1,	%g6,	%g5
	move	%icc,	%i0,	%i7
	faligndata	%f18,	%f0,	%f12
	orn	%l5,	0x0E30,	%g3
	srax	%l3,	%o7,	%i2
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x10] %asi
	fcmple32	%f26,	%f0,	%o4
	fmovrsgz	%g2,	%f26,	%f19
	sub	%i5,	%i3,	%o1
	subccc	%o3,	0x0991,	%o2
	movl	%icc,	%l2,	%l4
	fpack32	%f26,	%f30,	%f18
	tleu	%xcc,	0x3
	orcc	%i4,	0x0919,	%g7
	movl	%xcc,	%i6,	%o6
	fmovse	%icc,	%f11,	%f2
	be	%icc,	loop_870
	fmul8x16	%f0,	%f26,	%f10
	srlx	%g4,	%i1,	%l0
	edge8ln	%l1,	%o0,	%l6
loop_870:
	alignaddrl	%g1,	%g6,	%g5
	taddcc	%o5,	%i0,	%i7
	fxnors	%f30,	%f28,	%f0
	pdist	%f20,	%f10,	%f2
	andncc	%g3,	%l5,	%l3
	edge32	%o7,	%o4,	%g2
	smulcc	%i2,	0x0A55,	%i3
	movge	%xcc,	%i5,	%o1
	udivcc	%o3,	0x10F3,	%o2
	edge16n	%l4,	%l2,	%g7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x78] %asi,	%f6
	movl	%icc,	%i4,	%o6
	edge32	%g4,	%i1,	%l0
	tpos	%icc,	0x1
	and	%l1,	0x1AD8,	%i6
	tge	%icc,	0x7
	stbar
	sth	%l6,	[%l7 + 0x6A]
	fxor	%f0,	%f30,	%f28
	tleu	%icc,	0x4
	movn	%xcc,	%o0,	%g6
	movgu	%xcc,	%g1,	%g5
	fbue	%fcc1,	loop_871
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f6,	%f8,	%f18
	fandnot1s	%f7,	%f12,	%f12
loop_871:
	std	%f10,	[%l7 + 0x10]
	movre	%i0,	%i7,	%g3
	sdivcc	%l5,	0x05AC,	%l3
	edge8ln	%o7,	%o4,	%g2
	andn	%i2,	0x05F7,	%o5
	fsrc1	%f16,	%f6
	brgz,a	%i5,	loop_872
	tne	%icc,	0x7
	tl	%xcc,	0x0
	edge16	%o1,	%o3,	%i3
loop_872:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l4,	%l2
	tneg	%xcc,	0x0
	orncc	%o2,	0x1D9E,	%g7
	fmovsg	%icc,	%f24,	%f29
	array8	%o6,	%g4,	%i1
	movg	%icc,	%l0,	%i4
	mova	%xcc,	%l1,	%i6
	fexpand	%f8,	%f2
	smul	%l6,	0x1137,	%o0
	tneg	%xcc,	0x2
	fmovrslz	%g1,	%f6,	%f3
	fmovsne	%xcc,	%f31,	%f21
	fmovdcs	%xcc,	%f5,	%f29
	orcc	%g6,	%g5,	%i7
	nop
	set	0x50, %i6
	std	%f8,	[%l7 + %i6]
	tle	%icc,	0x1
	sethi	0x0AB4,	%i0
	movg	%xcc,	%g3,	%l3
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brz,a	%l5,	loop_873
	tvc	%xcc,	0x6
	srl	%o7,	%g2,	%o4
	fmul8x16	%f1,	%f28,	%f22
loop_873:
	fone	%f20
	tvs	%icc,	0x1
	fbg	%fcc2,	loop_874
	edge32ln	%o5,	%i2,	%i5
	bneg,pn	%icc,	loop_875
	smul	%o1,	%i3,	%o3
loop_874:
	tne	%xcc,	0x7
	set	0x76, %o2
	stba	%l2,	[%l7 + %o2] 0x2b
	membar	#Sync
loop_875:
	movle	%xcc,	%l4,	%g7
	std	%f10,	[%l7 + 0x60]
	fmovde	%icc,	%f30,	%f1
	tn	%icc,	0x6
	edge32l	%o2,	%o6,	%i1
	fmovscs	%xcc,	%f9,	%f18
	fmovdne	%icc,	%f20,	%f28
	tleu	%xcc,	0x2
	movrgez	%l0,	0x10B,	%i4
	xor	%l1,	0x0BA0,	%g4
	tl	%xcc,	0x5
	ldsb	[%l7 + 0x12],	%l6
	mulscc	%i6,	0x11E3,	%g1
	taddcctv	%g6,	%o0,	%i7
	fcmple16	%f12,	%f14,	%g5
	fmovsneg	%icc,	%f1,	%f19
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x08] %asi,	%f15
	nop
	setx	loop_876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x3
	sth	%g3,	[%l7 + 0x7E]
	fxnors	%f26,	%f30,	%f22
loop_876:
	edge32	%l3,	%l5,	%o7
	fmovspos	%icc,	%f31,	%f18
	nop
	set	0x24, %l6
	ldstub	[%l7 + %l6],	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o4,	%i0,	%o5
	movleu	%icc,	%i5,	%i2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i3
	tl	%xcc,	0x7
	membar	0x7E
	and	%o1,	%l2,	%o3
	umulcc	%l4,	%g7,	%o2
	movrlez	%i1,	0x3C1,	%l0
	movleu	%icc,	%i4,	%o6
	sdivx	%g4,	0x1792,	%l1
	subcc	%l6,	%g1,	%g6
	udivx	%i6,	0x098D,	%o0
	fsrc1	%f20,	%f10
	fmul8x16au	%f10,	%f22,	%f0
	alignaddr	%g5,	%i7,	%g3
	fblg	%fcc1,	loop_877
	mulx	%l5,	%o7,	%g2
	tvc	%xcc,	0x2
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x04,	%l2
loop_877:
	nop
	setx	loop_878,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%i0,	%o5,	%o4
	fmovrdgz	%i2,	%f16,	%f28
	lduh	[%l7 + 0x58],	%i3
loop_878:
	subcc	%i5,	%o1,	%o3
	edge8n	%l2,	%l4,	%o2
	movneg	%xcc,	%i1,	%l0
	edge32n	%g7,	%i4,	%o6
	umul	%l1,	%g4,	%g1
	add	%l6,	%g6,	%o0
	movl	%xcc,	%i6,	%g5
	fblg,a	%fcc0,	loop_879
	fpadd32	%f16,	%f18,	%f4
	fmovsge	%icc,	%f29,	%f13
	fmovse	%icc,	%f10,	%f24
loop_879:
	tge	%icc,	0x3
	srlx	%i7,	%g3,	%l5
	ld	[%l7 + 0x54],	%f29
	fbul,a	%fcc0,	loop_880
	tsubcctv	%g2,	0x1319,	%o7
	tsubcctv	%i0,	0x10DE,	%o5
	tgu	%icc,	0x5
loop_880:
	move	%icc,	%l3,	%o4
	set	0x50, %g7
	ldsha	[%l7 + %g7] 0x89,	%i2
	srlx	%i5,	0x14,	%o1
	sdivcc	%i3,	0x00FB,	%l2
	movre	%l4,	%o3,	%o2
	andn	%i1,	0x1327,	%l0
	fpsub32s	%f31,	%f2,	%f0
	fandnot2	%f16,	%f24,	%f2
	taddcctv	%i4,	0x1703,	%g7
	tg	%icc,	0x6
	fbul,a	%fcc0,	loop_881
	edge32l	%l1,	%o6,	%g4
	fcmped	%fcc3,	%f10,	%f20
	sra	%l6,	0x10,	%g1
loop_881:
	movleu	%xcc,	%o0,	%g6
	taddcctv	%i6,	0x1613,	%g5
	tpos	%xcc,	0x4
	sdivcc	%g3,	0x1525,	%l5
	fmovda	%icc,	%f9,	%f22
	edge32ln	%g2,	%i7,	%i0
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f0
	tcc	%xcc,	0x6
	subc	%o7,	%l3,	%o4
	fmul8x16	%f10,	%f18,	%f0
	mova	%icc,	%i2,	%o5
	fzero	%f12
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movre	%o1,	%i5,	%l2
	fpackfix	%f28,	%f28
	xnorcc	%l4,	0x1EFF,	%i3
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x10,	%o2
	bn	%icc,	loop_882
	tg	%xcc,	0x6
	addcc	%o2,	0x095D,	%i1
	sir	0x0AD2
loop_882:
	tcs	%xcc,	0x5
	fmul8x16	%f21,	%f12,	%f18
	orncc	%l0,	%i4,	%l1
	fbe	%fcc3,	loop_883
	fandnot1	%f6,	%f0,	%f6
	sll	%o6,	%g4,	%l6
	tle	%xcc,	0x5
loop_883:
	nop
	setx	loop_884,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%g7,	%o0,	%g6
	ta	%xcc,	0x7
	tcc	%xcc,	0x7
loop_884:
	ldsw	[%l7 + 0x64],	%g1
	bne,a,pt	%icc,	loop_885
	movl	%xcc,	%g5,	%g3
	edge32	%i6,	%l5,	%g2
	add	%i0,	0x015F,	%o7
loop_885:
	movrgez	%l3,	0x066,	%i7
	fble	%fcc3,	loop_886
	udiv	%o4,	0x01CB,	%o5
	fble	%fcc2,	loop_887
	sdivcc	%i2,	0x1F3B,	%i5
loop_886:
	nop
	set	0x38, %o5
	stda	%l2,	[%l7 + %o5] 0x04
loop_887:
	fmovdgu	%xcc,	%f23,	%f16
	fnor	%f14,	%f26,	%f8
	fmul8ulx16	%f30,	%f22,	%f4
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l4
	movrlez	%i3,	0x208,	%o1
	array16	%o2,	%i1,	%o3
	sdiv	%l0,	0x0646,	%l1
	tvc	%icc,	0x5
	tne	%xcc,	0x2
	bpos	%icc,	loop_888
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f10,	%f16,	%f0
	alignaddrl	%o6,	%g4,	%i4
loop_888:
	movge	%xcc,	%g7,	%l6
	movrlez	%g6,	%o0,	%g5
	smulcc	%g3,	0x1BB6,	%i6
	srl	%g1,	%g2,	%i0
	fmovdcs	%xcc,	%f30,	%f11
	edge16	%l5,	%l3,	%o7
	add	%i7,	%o5,	%i2
	movleu	%icc,	%o4,	%i5
	mulscc	%l2,	%l4,	%o1
	ta	%xcc,	0x3
	fbn,a	%fcc3,	loop_889
	sll	%o2,	0x0D,	%i1
	brlz	%i3,	loop_890
	bgu,pt	%xcc,	loop_891
loop_889:
	fandnot1s	%f17,	%f6,	%f20
	edge8ln	%o3,	%l0,	%l1
loop_890:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_891:
	xnorcc	%o6,	0x0510,	%i4
	edge16n	%g4,	%l6,	%g7
	taddcc	%g6,	0x0028,	%o0
	sll	%g5,	0x07,	%g3
	movneg	%icc,	%i6,	%g1
	xor	%i0,	0x017A,	%l5
	bleu,a	%xcc,	loop_892
	movneg	%icc,	%l3,	%o7
	fmul8ulx16	%f4,	%f22,	%f26
	xor	%i7,	0x0EBF,	%g2
loop_892:
	fcmple32	%f26,	%f4,	%i2
	fbe	%fcc2,	loop_893
	movcc	%icc,	%o5,	%o4
	edge32ln	%l2,	%l4,	%o1
	movvc	%icc,	%o2,	%i1
loop_893:
	fmovdleu	%icc,	%f3,	%f6
	subc	%i5,	%o3,	%i3
	srax	%l1,	0x0E,	%o6
	xnor	%i4,	%l0,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f20,	[%l7 + 0x20]
	movrne	%g7,	0x13A,	%g6
	sir	0x01A4
	tsubcc	%g4,	0x1EAF,	%o0
	array8	%g5,	%i6,	%g3
	taddcc	%i0,	0x0D99,	%l5
	tpos	%xcc,	0x3
	tcc	%xcc,	0x4
	smul	%g1,	%o7,	%i7
	sll	%l3,	%g2,	%i2
	membar	0x04
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
	xnorcc	%l2,	0x1E0D,	%l4
	movrgez	%o1,	0x338,	%o2
	subc	%i1,	%i5,	%o3
	fmovdge	%xcc,	%f5,	%f27
	tpos	%xcc,	0x4
	movrlz	%o5,	%l1,	%i3
	sra	%i4,	%o6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pt	%xcc,	loop_894
	fmovsgu	%xcc,	%f18,	%f13
	call	loop_895
	be,pt	%icc,	loop_896
loop_894:
	ta	%icc,	0x1
	ldd	[%l7 + 0x18],	%g6
loop_895:
	tcc	%xcc,	0x6
loop_896:
	fcmpne16	%f20,	%f16,	%l6
	brlez	%g4,	loop_897
	nop
	setx loop_898, %l0, %l1
	jmpl %l1, %g6
	edge16	%o0,	%i6,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_897:
	movrlez	%i0,	0x117,	%g5
loop_898:
	nop
	set	0x10, %i7
	stwa	%g1,	[%l7 + %i7] 0x27
	membar	#Sync
	sub	%l5,	%o7,	%l3
	fblg	%fcc3,	loop_899
	and	%g2,	0x1255,	%i2
	sdivcc	%o4,	0x1424,	%l2
	fnand	%f26,	%f12,	%f2
loop_899:
	fmovrdgz	%l4,	%f30,	%f24
	fcmped	%fcc1,	%f0,	%f10
	smul	%o1,	0x020C,	%o2
	subc	%i7,	0x0619,	%i1
	udivcc	%o3,	0x0382,	%i5
	nop
	set	0x78, %i3
	prefetch	[%l7 + %i3],	 0x1
	fmovrse	%l1,	%f16,	%f9
	fmovrsne	%i3,	%f19,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1CD7
	fmovse	%icc,	%f20,	%f1
	fmul8ulx16	%f14,	%f24,	%f8
	movrgz	%o5,	0x2D9,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x7
	fmul8x16al	%f12,	%f1,	%f2
	mova	%icc,	%l0,	%o6
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fandnot1	%f12,	%f4,	%f24
	edge16ln	%g7,	%g4,	%l6
	fbo,a	%fcc2,	loop_900
	sub	%g6,	%i6,	%g3
	array8	%i0,	%o0,	%g1
	mova	%icc,	%l5,	%g5
loop_900:
	lduh	[%l7 + 0x4C],	%o7
	tpos	%icc,	0x1
	ble,pn	%icc,	loop_901
	tne	%icc,	0x5
	ldstub	[%l7 + 0x4E],	%g2
	tsubcc	%i2,	0x0AFC,	%l3
loop_901:
	sethi	0x1DE2,	%o4
	edge8ln	%l2,	%o1,	%l4
	srax	%o2,	%i7,	%o3
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x81
	array32	%i1,	%l1,	%i5
	fnors	%f17,	%f31,	%f28
	umul	%o5,	%i3,	%i4
	movn	%icc,	%l0,	%g7
	fzero	%f0
	ble,a	%icc,	loop_902
	ldsb	[%l7 + 0x65],	%g4
	fmovdne	%icc,	%f16,	%f22
	movg	%xcc,	%l6,	%g6
loop_902:
	sra	%o6,	%i6,	%g3
	fbl	%fcc3,	loop_903
	bvs,a	loop_904
	ta	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_903:
	tle	%xcc,	0x4
loop_904:
	bpos	%icc,	loop_905
	fmovscc	%icc,	%f30,	%f3
	stbar
	fabss	%f7,	%f12
loop_905:
	edge8	%i0,	%g1,	%o0
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0x1
	movgu	%xcc,	%g5,	%g2
	set	0x7E, %l5
	lduha	[%l7 + %l5] 0x04,	%i2
	movpos	%xcc,	%l3,	%o7
	edge16l	%o4,	%o1,	%l2
	fmovdg	%icc,	%f31,	%f26
	prefetch	[%l7 + 0x64],	 0x3
	fbge	%fcc2,	loop_906
	fmovrdne	%l4,	%f12,	%f26
	fbo,a	%fcc1,	loop_907
	tle	%xcc,	0x3
loop_906:
	tge	%icc,	0x4
	tgu	%xcc,	0x3
loop_907:
	andncc	%i7,	%o3,	%i1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%l0
	movrgez	%i5,	0x1F0,	%o2
	stbar
	tpos	%xcc,	0x5
	movg	%xcc,	%i3,	%i4
	tgu	%xcc,	0x6
	subc	%o5,	%g7,	%l0
	tvs	%icc,	0x0
	fornot2	%f6,	%f30,	%f12
	mova	%xcc,	%l6,	%g4
	fnegs	%f22,	%f1
	subc	%o6,	0x0134,	%i6
	movneg	%icc,	%g3,	%i0
	srax	%g1,	0x03,	%g6
	tne	%xcc,	0x7
	ldsw	[%l7 + 0x10],	%o0
	orn	%g5,	0x1900,	%g2
	be,a	loop_908
	movrne	%i2,	0x2B7,	%l5
	mulscc	%l3,	0x10AC,	%o7
	movrlz	%o4,	0x0F7,	%l2
loop_908:
	movne	%xcc,	%o1,	%i7
	ldsw	[%l7 + 0x2C],	%o3
	ldstub	[%l7 + 0x52],	%i1
	fnors	%f20,	%f1,	%f21
	smulcc	%l4,	0x17AE,	%i5
	set	0x20, %g5
	ldstuba	[%l7 + %g5] 0x0c,	%l1
	fmovsvc	%xcc,	%f24,	%f3
	fbue,a	%fcc0,	loop_909
	fcmps	%fcc0,	%f20,	%f25
	sra	%o2,	%i4,	%i3
	fmovspos	%xcc,	%f3,	%f17
loop_909:
	fcmple32	%f10,	%f20,	%o5
	tvc	%icc,	0x5
	sdivx	%g7,	0x08E0,	%l6
	xnorcc	%l0,	%o6,	%g4
	tcs	%xcc,	0x0
	fmovsl	%xcc,	%f2,	%f21
	fbule,a	%fcc3,	loop_910
	alignaddr	%g3,	%i0,	%i6
	or	%g6,	%o0,	%g5
	addc	%g1,	%i2,	%g2
loop_910:
	fmovd	%f6,	%f18
	mova	%icc,	%l3,	%l5
	fmovdge	%icc,	%f1,	%f14
	udivcc	%o7,	0x1BC6,	%l2
	fmovscs	%xcc,	%f4,	%f12
	subccc	%o4,	%o1,	%o3
	siam	0x5
	fbue	%fcc2,	loop_911
	fabss	%f1,	%f28
	sllx	%i7,	%l4,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_911:
	taddcc	%l1,	%i5,	%o2
	fone	%f16
	edge32n	%i3,	%o5,	%g7
	movle	%icc,	%i4,	%l0
	subccc	%o6,	%g4,	%l6
	xnorcc	%i0,	%g3,	%g6
	fmovscc	%xcc,	%f18,	%f11
	lduw	[%l7 + 0x7C],	%o0
	edge8n	%i6,	%g5,	%i2
	tle	%icc,	0x2
	fmovdg	%xcc,	%f27,	%f7
	bn,a,pt	%icc,	loop_912
	tvs	%xcc,	0x2
	movg	%icc,	%g2,	%l3
	sra	%g1,	0x1D,	%l5
loop_912:
	xorcc	%l2,	%o7,	%o4
	bgu,a,pt	%xcc,	loop_913
	fmovdvs	%icc,	%f27,	%f11
	ldsb	[%l7 + 0x6C],	%o1
	prefetch	[%l7 + 0x2C],	 0x0
loop_913:
	tneg	%icc,	0x5
	subc	%o3,	%i7,	%l4
	subccc	%i1,	%i5,	%l1
	fxors	%f6,	%f13,	%f0
	popc	0x125E,	%o2
	mova	%icc,	%o5,	%g7
	fpsub16s	%f0,	%f25,	%f31
	tge	%xcc,	0x7
	alignaddr	%i3,	%l0,	%i4
	xnorcc	%o6,	0x1276,	%l6
	ta	%xcc,	0x5
	udivx	%i0,	0x15E1,	%g4
	movg	%icc,	%g3,	%o0
	mulx	%i6,	%g6,	%i2
	taddcc	%g2,	%l3,	%g1
	fmovsle	%xcc,	%f1,	%f16
	fones	%f10
	subccc	%l5,	0x06D0,	%g5
	edge16l	%o7,	%o4,	%l2
	srax	%o3,	%o1,	%i7
	xnor	%i1,	%i5,	%l1
	brgez,a	%o2,	loop_914
	movge	%xcc,	%o5,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f12,	%f28,	%f26
loop_914:
	movre	%i3,	%l4,	%i4
	tne	%xcc,	0x4
	xnorcc	%o6,	%l0,	%i0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%g3
	sethi	0x1A35,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l6,	0x1322,	%i6
	popc	%g6,	%g2
	brgz,a	%l3,	loop_915
	fcmpne16	%f6,	%f22,	%g1
	sdivcc	%l5,	0x0CD0,	%g5
	taddcc	%i2,	0x001B,	%o7
loop_915:
	tneg	%icc,	0x6
	fnor	%f4,	%f0,	%f0
	tvc	%icc,	0x2
	movgu	%icc,	%l2,	%o3
	sub	%o1,	%o4,	%i7
	tg	%xcc,	0x2
	movl	%xcc,	%i5,	%i1
	move	%icc,	%l1,	%o5
	fbuge	%fcc1,	loop_916
	sethi	0x19BD,	%o2
	umulcc	%i3,	0x0A40,	%g7
	array16	%i4,	%o6,	%l4
loop_916:
	brnz,a	%l0,	loop_917
	movle	%xcc,	%g4,	%i0
	bcs,pn	%icc,	loop_918
	stbar
loop_917:
	movpos	%xcc,	%o0,	%g3
	fbge,a	%fcc3,	loop_919
loop_918:
	edge16	%i6,	%l6,	%g6
	tle	%xcc,	0x0
	tcs	%xcc,	0x3
loop_919:
	fmul8ulx16	%f18,	%f8,	%f28
	fbu	%fcc3,	loop_920
	fpadd32	%f0,	%f24,	%f26
	add	%l3,	%g1,	%g2
	edge16	%l5,	%g5,	%o7
loop_920:
	tvc	%icc,	0x6
	and	%i2,	0x19FD,	%o3
	subc	%o1,	0x1CE2,	%l2
	edge8n	%o4,	%i5,	%i1
	subcc	%l1,	%i7,	%o5
	tneg	%icc,	0x0
	fmovdleu	%icc,	%f14,	%f22
	fornot1	%f28,	%f18,	%f0
	fpadd16	%f20,	%f12,	%f30
	array16	%o2,	%i3,	%i4
	sll	%o6,	%g7,	%l0
	orcc	%g4,	0x0109,	%i0
	fpsub16s	%f12,	%f16,	%f16
	movn	%xcc,	%o0,	%g3
	taddcctv	%l4,	0x1AE1,	%l6
	be	loop_921
	edge32n	%i6,	%g6,	%g1
	edge8l	%g2,	%l5,	%g5
	bgu,a	%icc,	loop_922
loop_921:
	pdist	%f4,	%f2,	%f30
	bvc	loop_923
	move	%xcc,	%o7,	%i2
loop_922:
	udivcc	%l3,	0x17D2,	%o3
	movrlz	%o1,	%o4,	%i5
loop_923:
	movvs	%xcc,	%l2,	%i1
	brgz,a	%l1,	loop_924
	movrne	%o5,	%o2,	%i3
	brlez,a	%i7,	loop_925
	sdivcc	%i4,	0x12A5,	%g7
loop_924:
	fbg,a	%fcc3,	loop_926
	orn	%l0,	%o6,	%i0
loop_925:
	addc	%g4,	%o0,	%g3
	std	%f8,	[%l7 + 0x28]
loop_926:
	fbu	%fcc3,	loop_927
	orn	%l6,	0x1F34,	%i6
	bg,a,pt	%xcc,	loop_928
	movrgez	%l4,	%g1,	%g6
loop_927:
	movleu	%xcc,	%g2,	%l5
	add	%o7,	0x1CB3,	%i2
loop_928:
	bne,a,pn	%xcc,	loop_929
	movvc	%xcc,	%g5,	%l3
	udivx	%o1,	0x09D9,	%o3
	movgu	%xcc,	%i5,	%l2
loop_929:
	tpos	%xcc,	0x6
	fble,a	%fcc0,	loop_930
	fmovsle	%icc,	%f16,	%f5
	edge8	%o4,	%i1,	%l1
	taddcctv	%o5,	%i3,	%i7
loop_930:
	fxor	%f14,	%f18,	%f4
	fmovsvc	%xcc,	%f2,	%f6
	fmovsgu	%xcc,	%f0,	%f27
	ldsb	[%l7 + 0x1A],	%o2
	xorcc	%g7,	0x0E6D,	%l0
	fcmpgt16	%f22,	%f12,	%i4
	bvs,a	loop_931
	addc	%o6,	%i0,	%o0
	fmovs	%f1,	%f25
	tg	%icc,	0x0
loop_931:
	st	%f23,	[%l7 + 0x48]
	fcmpeq32	%f6,	%f6,	%g4
	array8	%l6,	%g3,	%l4
	udiv	%g1,	0x1DFF,	%g6
	edge32l	%i6,	%g2,	%o7
	srl	%i2,	0x04,	%g5
	edge32l	%l3,	%l5,	%o3
	xnor	%i5,	%o1,	%l2
	edge32	%i1,	%l1,	%o4
	xorcc	%o5,	%i3,	%o2
	wr	%g0,	0x89,	%asi
	stda	%i6,	[%l7 + 0x18] %asi
	sth	%g7,	[%l7 + 0x44]
	xorcc	%i4,	0x1174,	%o6
	sll	%l0,	0x0E,	%i0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbul	%fcc0,	loop_932
	ld	[%l7 + 0x58],	%f27
	fmovsn	%xcc,	%f19,	%f25
	fmovdne	%xcc,	%f17,	%f7
loop_932:
	fmovrde	%g4,	%f22,	%f26
	fmovdg	%xcc,	%f13,	%f29
	set	0x60, %l0
	ldswa	[%l7 + %l0] 0x88,	%o0
	movcc	%xcc,	%g3,	%l4
	movneg	%icc,	%l6,	%g6
	ta	%icc,	0x1
	fmuld8sux16	%f31,	%f7,	%f16
	sir	0x01E7
	fmovdleu	%icc,	%f13,	%f20
	fmovsneg	%icc,	%f13,	%f15
	brgz,a	%g1,	loop_933
	sll	%i6,	0x03,	%o7
	movrgz	%i2,	%g2,	%g5
	umul	%l5,	0x111E,	%l3
loop_933:
	subc	%o3,	0x0084,	%i5
	orcc	%o1,	%i1,	%l1
	fmul8sux16	%f26,	%f12,	%f30
	fornot1s	%f19,	%f1,	%f16
	ldub	[%l7 + 0x29],	%o4
	tcs	%icc,	0x4
	bge	%xcc,	loop_934
	fcmple16	%f22,	%f20,	%o5
	addc	%l2,	%i3,	%o2
	fpmerge	%f30,	%f26,	%f0
loop_934:
	tneg	%icc,	0x1
	addcc	%i7,	%g7,	%i4
	set	0x2B, %i1
	ldstuba	[%l7 + %i1] 0x89,	%l0
	sub	%o6,	%g4,	%o0
	edge32l	%g3,	%i0,	%l6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x14
	tg	%icc,	0x5
	stx	%l4,	[%l7 + 0x60]
	st	%f14,	[%l7 + 0x20]
	fzeros	%f4
	srax	%g6,	0x13,	%i6
	edge32ln	%g1,	%o7,	%i2
	bne	loop_935
	fmovdvs	%xcc,	%f17,	%f6
	fornot1s	%f24,	%f0,	%f2
	membar	0x3B
loop_935:
	xor	%g5,	0x063C,	%g2
	movg	%icc,	%l5,	%o3
	movvc	%icc,	%l3,	%o1
	tne	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i1
	alignaddr	%l1,	%o4,	%i5
	popc	%l2,	%o5
	subcc	%o2,	%i7,	%i3
	flush	%l7 + 0x24
	tsubcc	%i4,	0x1C0E,	%l0
	tvc	%icc,	0x3
	fcmpgt16	%f16,	%f30,	%o6
	fmovspos	%icc,	%f6,	%f17
	fmovse	%icc,	%f19,	%f7
	srlx	%g7,	%o0,	%g3
	sll	%i0,	%l6,	%l4
	alignaddrl	%g6,	%g4,	%i6
	movrlez	%o7,	0x07F,	%i2
	fzero	%f4
	fbg,a	%fcc2,	loop_936
	sir	0x1598
	movn	%icc,	%g5,	%g2
	tcs	%icc,	0x7
loop_936:
	bn	loop_937
	movneg	%xcc,	%g1,	%o3
	sir	0x00FA
	sra	%l3,	0x07,	%l5
loop_937:
	bleu,pn	%xcc,	loop_938
	stb	%i1,	[%l7 + 0x37]
	movrlz	%l1,	%o4,	%o1
	wr	%g0,	0xeb,	%asi
	stxa	%i5,	[%l7 + 0x40] %asi
	membar	#Sync
loop_938:
	tvs	%icc,	0x6
	fnot2	%f16,	%f20
	xnorcc	%o5,	%l2,	%o2
	fmovdn	%icc,	%f21,	%f6
	bpos,pt	%icc,	loop_939
	movn	%icc,	%i7,	%i3
	edge16l	%l0,	%i4,	%g7
	movle	%icc,	%o6,	%g3
loop_939:
	udivcc	%i0,	0x08BF,	%o0
	fnegd	%f6,	%f18
	movne	%xcc,	%l6,	%l4
	addc	%g4,	%i6,	%g6
	fxnors	%f31,	%f4,	%f14
	set	0x48, %i0
	lda	[%l7 + %i0] 0x88,	%f3
	fmovdg	%xcc,	%f7,	%f7
	edge8l	%i2,	%o7,	%g5
	smul	%g2,	0x11D4,	%g1
	bl,a	%icc,	loop_940
	sir	0x1B3D
	move	%icc,	%o3,	%l3
	tvs	%xcc,	0x2
loop_940:
	fcmpgt32	%f22,	%f8,	%i1
	fpack32	%f4,	%f16,	%f24
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	tleu	%icc,	0x2
	edge32n	%o4,	%o1,	%i5
	tvc	%xcc,	0x4
	set	0x6A, %o0
	ldsha	[%l7 + %o0] 0x11,	%l5
	stb	%l2,	[%l7 + 0x2E]
	brz,a	%o5,	loop_941
	tl	%xcc,	0x6
	fmovrse	%i7,	%f6,	%f9
	tle	%icc,	0x0
loop_941:
	movre	%i3,	0x162,	%o2
	tcc	%xcc,	0x0
	edge8n	%l0,	%g7,	%o6
	fzero	%f6
	and	%g3,	%i0,	%o0
	movg	%icc,	%l6,	%i4
	movrne	%l4,	%i6,	%g6
	fbul,a	%fcc2,	loop_942
	andcc	%g4,	%o7,	%i2
	ba	loop_943
	movle	%icc,	%g5,	%g2
loop_942:
	edge8	%o3,	%g1,	%l3
	membar	0x09
loop_943:
	tn	%icc,	0x3
	set	0x78, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0x0
	fmovsl	%icc,	%f12,	%f27
	fmul8x16au	%f10,	%f28,	%f26
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xea,	%i0
	tn	%xcc,	0x7
	edge16	%o1,	%o4,	%i5
	tcc	%icc,	0x4
	popc	%l2,	%o5
	brlz	%i7,	loop_944
	movpos	%xcc,	%i3,	%l5
	andn	%o2,	%g7,	%l0
	fmovdvs	%xcc,	%f17,	%f4
loop_944:
	sllx	%g3,	0x0C,	%o6
	movrgz	%o0,	0x314,	%i0
	fnot1	%f0,	%f18
	brz	%i4,	loop_945
	fmovsneg	%icc,	%f21,	%f30
	smul	%l6,	%l4,	%g6
	alignaddr	%i6,	%g4,	%o7
loop_945:
	movre	%i2,	0x246,	%g5
	ba,pt	%icc,	loop_946
	andcc	%o3,	%g1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc0,	loop_947
loop_946:
	movcc	%icc,	%g2,	%i1
	fand	%f12,	%f8,	%f2
	orcc	%l1,	0x0C79,	%o4
loop_947:
	subcc	%o1,	0x13D8,	%l2
	pdist	%f4,	%f8,	%f14
	sdivx	%i5,	0x1940,	%o5
	ldd	[%l7 + 0x08],	%i6
	tcs	%icc,	0x0
	popc	0x16E8,	%l5
	umul	%i3,	0x1E8A,	%o2
	stx	%l0,	[%l7 + 0x18]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g7,	0x0F43,	%o6
	bn	%icc,	loop_948
	bl,a,pn	%icc,	loop_949
	fabsd	%f30,	%f18
	sub	%g3,	0x0102,	%i0
loop_948:
	edge8ln	%o0,	%l6,	%i4
loop_949:
	fbule	%fcc0,	loop_950
	fmovdge	%xcc,	%f27,	%f27
	tvc	%icc,	0x2
	tleu	%icc,	0x5
loop_950:
	udivx	%l4,	0x0922,	%g6
	tle	%icc,	0x4
	movrlez	%g4,	%o7,	%i6
	ldd	[%l7 + 0x28],	%i2
	edge8l	%g5,	%g1,	%o3
	sdivcc	%g2,	0x0BD9,	%i1
	ldstub	[%l7 + 0x7E],	%l3
	addc	%l1,	0x04C8,	%o4
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l2
	movrlez	%o1,	0x37E,	%i5
	fmovsl	%xcc,	%f10,	%f8
	brlez	%o5,	loop_951
	fnot1	%f16,	%f8
	fmovspos	%xcc,	%f18,	%f9
	sir	0x17A8
loop_951:
	xor	%i7,	0x1FF9,	%l5
	udivcc	%i3,	0x0B7C,	%l0
	edge8	%g7,	%o6,	%g3
	srlx	%o2,	0x15,	%i0
	fmovsvs	%icc,	%f29,	%f25
	ldd	[%l7 + 0x20],	%f10
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x2b,	%i6
	for	%f26,	%f12,	%f28
	movrlz	%o0,	0x3DB,	%l4
	fmovrdgez	%i4,	%f6,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x2
	alignaddr	%g4,	%o7,	%i6
	movvs	%icc,	%g6,	%i2
	tge	%xcc,	0x1
	movrlez	%g5,	0x27D,	%g1
	fsrc2s	%f24,	%f18
	mulx	%g2,	0x1E7C,	%i1
	nop
	setx	loop_952,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%l3,	%l1,	%o4
	movcc	%icc,	%o3,	%l2
	fnegd	%f18,	%f6
loop_952:
	movre	%i5,	%o1,	%o5
	bge	%icc,	loop_953
	fmovscs	%icc,	%f28,	%f26
	fandnot2s	%f30,	%f7,	%f21
	fbge,a	%fcc0,	loop_954
loop_953:
	bge,pt	%xcc,	loop_955
	edge8ln	%l5,	%i3,	%l0
	edge32l	%i7,	%o6,	%g7
loop_954:
	subccc	%g3,	%o2,	%l6
loop_955:
	alignaddr	%o0,	%l4,	%i0
	set	0x44, %o7
	swapa	[%l7 + %o7] 0x89,	%g4
	lduw	[%l7 + 0x1C],	%o7
	fnot2s	%f4,	%f14
	movre	%i6,	0x035,	%g6
	orncc	%i2,	0x0DDB,	%i4
	fabss	%f20,	%f2
	xorcc	%g5,	0x0F21,	%g2
	fmovsneg	%xcc,	%f7,	%f8
	sethi	0x0483,	%g1
	taddcc	%l3,	%l1,	%i1
	ta	%icc,	0x7
	bcs,a	loop_956
	fbule,a	%fcc3,	loop_957
	fmovsgu	%icc,	%f9,	%f28
	flush	%l7 + 0x48
loop_956:
	alignaddrl	%o4,	%l2,	%i5
loop_957:
	fand	%f22,	%f10,	%f26
	ldd	[%l7 + 0x58],	%o2
	sethi	0x0076,	%o5
	fpack32	%f4,	%f26,	%f12
	fcmpd	%fcc1,	%f18,	%f22
	ba	loop_958
	ld	[%l7 + 0x60],	%f28
	fmuld8ulx16	%f22,	%f13,	%f8
	mulx	%l5,	0x0A84,	%i3
loop_958:
	subc	%l0,	0x16AA,	%o1
	orncc	%o6,	%i7,	%g3
	movgu	%icc,	%g7,	%l6
	fblg	%fcc3,	loop_959
	brnz,a	%o2,	loop_960
	call	loop_961
	fbue	%fcc2,	loop_962
loop_959:
	brgez,a	%o0,	loop_963
loop_960:
	lduh	[%l7 + 0x1A],	%i0
loop_961:
	movge	%icc,	%l4,	%g4
loop_962:
	fbge	%fcc3,	loop_964
loop_963:
	movrgez	%i6,	0x0E4,	%o7
	addcc	%g6,	0x1B49,	%i2
	and	%g5,	%i4,	%g2
loop_964:
	movrne	%l3,	0x187,	%l1
	orcc	%g1,	%i1,	%l2
	bcs,a,pt	%icc,	loop_965
	brz,a	%i5,	loop_966
	stx	%o3,	[%l7 + 0x60]
	fands	%f29,	%f27,	%f22
loop_965:
	fmovsg	%icc,	%f18,	%f8
loop_966:
	tvc	%xcc,	0x0
	fpsub32	%f20,	%f16,	%f26
	edge8n	%o5,	%o4,	%i3
	movrne	%l0,	%l5,	%o6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3b8] %asi,	%o1 ripped by fixASI40.pl ripped by fixASI40.pl
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x1A] %asi,	%i7
	fnegs	%f13,	%f10
	bpos	%xcc,	loop_967
	smul	%g3,	0x0E33,	%g7
	lduw	[%l7 + 0x7C],	%l6
	andncc	%o0,	%o2,	%i0
loop_967:
	sub	%g4,	0x10B2,	%l4
	xnorcc	%i6,	%o7,	%i2
	ldstub	[%l7 + 0x3A],	%g6
	fbul	%fcc1,	loop_968
	nop
	setx	loop_969,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16	%f29,	%f8,	%f4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x18,	%f0
loop_968:
	movrne	%g5,	%i4,	%l3
loop_969:
	nop
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	udivx	%g1,	0x076A,	%i1
	fmovsleu	%icc,	%f30,	%f26
	fmovdcs	%xcc,	%f31,	%f26
	tpos	%xcc,	0x7
	bcc,a,pt	%xcc,	loop_970
	mulscc	%l1,	0x099F,	%i5
	nop
	setx loop_971, %l0, %l1
	jmpl %l1, %l2
	fnand	%f26,	%f24,	%f2
loop_970:
	and	%o3,	%o4,	%i3
	sdiv	%l0,	0x1585,	%l5
loop_971:
	brz	%o6,	loop_972
	movrne	%o5,	0x2B0,	%i7
	brlz,a	%o1,	loop_973
	bl,a,pn	%icc,	loop_974
loop_972:
	movle	%xcc,	%g3,	%l6
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_973:
	fzeros	%f9
loop_974:
	addccc	%o0,	0x11A8,	%g7
	ba	%xcc,	loop_975
	fcmped	%fcc0,	%f12,	%f22
	subccc	%i0,	%o2,	%l4
	movn	%xcc,	%g4,	%i6
loop_975:
	nop
	set	0x56, %l4
	ldsha	[%l7 + %l4] 0x18,	%o7
	addcc	%g6,	%g5,	%i4
	alignaddrl	%i2,	%g2,	%l3
	fbo	%fcc2,	loop_976
	and	%g1,	%l1,	%i5
	fbug	%fcc2,	loop_977
	fnegs	%f12,	%f1
loop_976:
	tpos	%icc,	0x0
	fzero	%f6
loop_977:
	movrlz	%i1,	%o3,	%o4
	xor	%i3,	%l0,	%l5
	fmovde	%xcc,	%f16,	%f13
	movl	%icc,	%l2,	%o5
	orn	%i7,	%o1,	%g3
	movrgez	%o6,	%o0,	%g7
	fzeros	%f12
	fmovsle	%icc,	%f5,	%f7
	movrlz	%i0,	0x293,	%l6
	fcmpeq32	%f22,	%f16,	%l4
	andcc	%o2,	0x1A79,	%i6
	fcmpgt16	%f4,	%f22,	%o7
	fmul8sux16	%f18,	%f18,	%f26
	add	%g4,	%g5,	%g6
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x16,	%f0
	bpos,a	loop_978
	fsrc1s	%f12,	%f12
	edge32n	%i4,	%g2,	%l3
	alignaddr	%i2,	%g1,	%l1
loop_978:
	andcc	%i5,	0x09A1,	%i1
	smul	%o4,	%i3,	%o3
	array16	%l5,	%l0,	%l2
	fbue,a	%fcc2,	loop_979
	alignaddrl	%i7,	%o5,	%o1
	fmovdleu	%icc,	%f15,	%f24
	andcc	%o6,	0x1C49,	%g3
loop_979:
	array16	%g7,	%i0,	%o0
	tsubcc	%l4,	%o2,	%i6
	brlz	%o7,	loop_980
	ldstub	[%l7 + 0x2B],	%g4
	tsubcctv	%l6,	0x1B38,	%g5
	fabss	%f6,	%f30
loop_980:
	tsubcc	%i4,	0x1102,	%g6
	andn	%l3,	0x1AFA,	%i2
	sll	%g2,	%g1,	%i5
	tgu	%xcc,	0x5
	bge,pt	%xcc,	loop_981
	bne	%xcc,	loop_982
	bne,a,pn	%icc,	loop_983
	brgz	%l1,	loop_984
loop_981:
	edge32	%o4,	%i1,	%i3
loop_982:
	smulcc	%o3,	0x1137,	%l0
loop_983:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%i7
loop_984:
	mulscc	%l2,	0x0C4D,	%o1
	srlx	%o5,	%g3,	%o6
	edge32ln	%i0,	%o0,	%g7
	fmovdl	%xcc,	%f3,	%f30
	smulcc	%o2,	%l4,	%i6
	sdivx	%g4,	0x0B89,	%l6
	tne	%icc,	0x2
	edge32l	%g5,	%o7,	%g6
	brnz	%l3,	loop_985
	smulcc	%i2,	0x0C61,	%g2
	orcc	%g1,	0x179C,	%i5
	fmovdcs	%xcc,	%f12,	%f8
loop_985:
	fmul8sux16	%f0,	%f26,	%f0
	tg	%xcc,	0x5
	set	0x6C, %g1
	stwa	%l1,	[%l7 + %g1] 0x19
	fcmpgt16	%f24,	%f2,	%o4
	fcmps	%fcc3,	%f26,	%f7
	umul	%i1,	0x0237,	%i4
	set	0x10, %l3
	stxa	%i3,	[%l7 + %l3] 0x88
	set	0x3C, %g2
	sta	%f21,	[%l7 + %g2] 0x10
	fcmpgt32	%f6,	%f28,	%o3
	fmovrsgz	%l0,	%f11,	%f16
	edge16ln	%l5,	%i7,	%l2
	tl	%icc,	0x1
	udivcc	%o5,	0x0A33,	%g3
	ta	%icc,	0x6
	udiv	%o1,	0x0BE8,	%o6
	mulx	%i0,	%o0,	%o2
	stbar
	nop
	setx	loop_986,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbge	%fcc0,	loop_987
	fmovde	%icc,	%f15,	%f18
	edge8	%l4,	%g7,	%g4
loop_986:
	edge16l	%i6,	%g5,	%o7
loop_987:
	orn	%g6,	0x0778,	%l6
	ta	%xcc,	0x2
	for	%f18,	%f24,	%f24
	bleu	%icc,	loop_988
	edge8n	%l3,	%i2,	%g1
	array16	%g2,	%l1,	%o4
	ldsh	[%l7 + 0x12],	%i1
loop_988:
	movl	%xcc,	%i5,	%i3
	orcc	%i4,	0x1BDF,	%o3
	movcc	%xcc,	%l0,	%l5
	movg	%xcc,	%i7,	%l2
	sra	%o5,	%g3,	%o1
	sllx	%i0,	%o0,	%o2
	bne,a,pn	%xcc,	loop_989
	xnorcc	%l4,	%o6,	%g4
	movpos	%xcc,	%g7,	%g5
	fbue	%fcc0,	loop_990
loop_989:
	srax	%o7,	%g6,	%i6
	edge32	%l6,	%i2,	%g1
	fmovrdgz	%l3,	%f14,	%f0
loop_990:
	fmovsgu	%xcc,	%f16,	%f9
	andn	%l1,	0x070D,	%g2
	udivx	%o4,	0x155E,	%i5
	xorcc	%i1,	0x0138,	%i3
	bneg,a	%xcc,	loop_991
	fmovrsgez	%o3,	%f1,	%f28
	bvs	loop_992
	flush	%l7 + 0x78
loop_991:
	tl	%xcc,	0x0
	umulcc	%i4,	0x00DA,	%l5
loop_992:
	array32	%i7,	%l0,	%o5
	tg	%icc,	0x3
	fmul8x16	%f7,	%f8,	%f2
	call	loop_993
	ba,a	loop_994
	fmovdge	%icc,	%f31,	%f14
	tcc	%icc,	0x2
loop_993:
	movre	%l2,	0x0C5,	%o1
loop_994:
	fnand	%f24,	%f22,	%f14
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i0,	%g3
	fcmpgt32	%f12,	%f16,	%o2
	sdivx	%l4,	0x0449,	%o0
	te	%xcc,	0x7
	edge32ln	%o6,	%g4,	%g7
	tsubcctv	%o7,	%g5,	%i6
	fbl	%fcc0,	loop_995
	fandnot1	%f8,	%f24,	%f8
	fbe	%fcc3,	loop_996
	fand	%f4,	%f4,	%f4
loop_995:
	fsrc2s	%f8,	%f21
	ldd	[%l7 + 0x18],	%f4
loop_996:
	edge32n	%l6,	%g6,	%g1
	sub	%l3,	%i2,	%g2
	edge16	%o4,	%l1,	%i5
	fbe	%fcc3,	loop_997
	taddcc	%i1,	0x08BF,	%o3
	ldsb	[%l7 + 0x70],	%i4
	st	%f30,	[%l7 + 0x74]
loop_997:
	movleu	%icc,	%i3,	%i7
	movg	%icc,	%l0,	%o5
	srax	%l5,	0x18,	%l2
	edge32ln	%o1,	%g3,	%o2
	move	%icc,	%l4,	%o0
	movne	%xcc,	%o6,	%g4
	fmovrse	%g7,	%f7,	%f2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x3C] %asi,	%i0
	movre	%g5,	0x015,	%o7
	wr	%g0,	0x11,	%asi
	sta	%f17,	[%l7 + 0x58] %asi
	bn,a	loop_998
	brgez	%i6,	loop_999
	st	%f23,	[%l7 + 0x74]
	brgz,a	%l6,	loop_1000
loop_998:
	movle	%xcc,	%g6,	%g1
loop_999:
	alignaddrl	%i2,	%l3,	%o4
	be,a,pt	%xcc,	loop_1001
loop_1000:
	fpsub32s	%f29,	%f28,	%f23
	bne,pn	%xcc,	loop_1002
	sir	0x0BCA
loop_1001:
	addcc	%l1,	0x1455,	%i5
	std	%f18,	[%l7 + 0x10]
loop_1002:
	movle	%xcc,	%g2,	%o3
	srax	%i4,	%i1,	%i7
	fcmped	%fcc2,	%f20,	%f0
	fmovsg	%icc,	%f11,	%f11
	ldub	[%l7 + 0x1B],	%i3
	fcmpne32	%f4,	%f26,	%l0
	smulcc	%o5,	0x00BC,	%l2
	edge32	%l5,	%o1,	%g3
	edge8	%o2,	%l4,	%o0
	addccc	%g4,	%o6,	%g7
	sdivcc	%g5,	0x0F0B,	%o7
	fmovd	%f24,	%f4
	siam	0x0
	alignaddrl	%i0,	%l6,	%g6
	alignaddrl	%i6,	%i2,	%g1
	taddcctv	%l3,	%o4,	%l1
	fblg,a	%fcc0,	loop_1003
	edge8	%i5,	%g2,	%i4
	stx	%i1,	[%l7 + 0x78]
	srl	%o3,	%i3,	%i7
loop_1003:
	srax	%o5,	%l2,	%l0
	fabsd	%f18,	%f12
	movne	%xcc,	%o1,	%g3
	move	%icc,	%l5,	%l4
	edge8n	%o2,	%o0,	%o6
	fone	%f30
	fmovrse	%g4,	%f8,	%f2
	movle	%icc,	%g7,	%g5
	or	%i0,	0x1F6D,	%o7
	tleu	%icc,	0x1
	sdivx	%g6,	0x1D1F,	%i6
	ta	%icc,	0x0
	alignaddrl	%l6,	%i2,	%g1
	bne	%icc,	loop_1004
	fxors	%f14,	%f6,	%f28
	tvc	%icc,	0x6
	tvc	%icc,	0x6
loop_1004:
	nop
	set	0x20, %i6
	sth	%o4,	[%l7 + %i6]
	tle	%xcc,	0x5
	edge16ln	%l3,	%i5,	%l1
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x0c,	%i4
	fpmerge	%f19,	%f10,	%f18
	smulcc	%g2,	%i1,	%o3
	brlz,a	%i7,	loop_1005
	edge16ln	%i3,	%o5,	%l2
	sll	%o1,	%g3,	%l0
	ta	%icc,	0x7
loop_1005:
	fcmpeq32	%f22,	%f28,	%l4
	movrlz	%o2,	0x26F,	%o0
	xnor	%l5,	0x0E86,	%g4
	srl	%o6,	0x0B,	%g7
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x68] %asi,	%i0
	sra	%o7,	0x11,	%g6
	fbg,a	%fcc3,	loop_1006
	xor	%g5,	0x0ED9,	%l6
	fcmpd	%fcc3,	%f14,	%f8
	bgu	%icc,	loop_1007
loop_1006:
	fnor	%f10,	%f18,	%f26
	mulscc	%i6,	%g1,	%o4
	bneg,a	loop_1008
loop_1007:
	fcmpgt32	%f22,	%f0,	%i2
	movleu	%icc,	%i5,	%l3
	ble,pn	%icc,	loop_1009
loop_1008:
	sethi	0x189A,	%l1
	udiv	%g2,	0x1512,	%i4
	edge32	%o3,	%i7,	%i1
loop_1009:
	nop
	set	0x20, %l6
	stda	%i2,	[%l7 + %l6] 0x10
	xor	%l2,	0x1FF2,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o5,	0x0846,	%l0
	edge32	%g3,	%l4,	%o0
	tcc	%icc,	0x4
	fpsub16s	%f19,	%f22,	%f8
	fnot2	%f0,	%f12
	addc	%l5,	%o2,	%o6
	fzeros	%f10
	movre	%g4,	%i0,	%g7
	ldx	[%l7 + 0x28],	%o7
	fornot2s	%f30,	%f3,	%f21
	fbge,a	%fcc2,	loop_1010
	movcc	%xcc,	%g6,	%l6
	orn	%g5,	%g1,	%o4
	call	loop_1011
loop_1010:
	edge32l	%i6,	%i5,	%i2
	fba,a	%fcc0,	loop_1012
	fabsd	%f24,	%f20
loop_1011:
	array16	%l1,	%g2,	%i4
	stx	%o3,	[%l7 + 0x18]
loop_1012:
	tpos	%icc,	0x2
	fmovse	%xcc,	%f12,	%f9
	edge32ln	%i7,	%i1,	%i3
	movcs	%xcc,	%l3,	%o1
	fsrc2	%f30,	%f10
	brlz,a	%l2,	loop_1013
	fandnot1	%f22,	%f30,	%f28
	fmovse	%icc,	%f7,	%f31
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l0
loop_1013:
	fabsd	%f16,	%f18
	fabsd	%f6,	%f10
	srl	%g3,	%o0,	%l4
	fpack32	%f4,	%f24,	%f14
	fbe	%fcc0,	loop_1014
	sdivx	%l5,	0x020C,	%o6
	set	0x64, %i5
	swapa	[%l7 + %i5] 0x88,	%g4
loop_1014:
	fpsub32	%f26,	%f10,	%f16
	fandnot1s	%f12,	%f26,	%f6
	and	%o2,	0x0962,	%g7
	sdivcc	%i0,	0x1BB7,	%g6
	subcc	%l6,	0x11BA,	%o7
	fmovdcc	%xcc,	%f24,	%f18
	fbu	%fcc2,	loop_1015
	movn	%icc,	%g5,	%o4
	nop
	setx	loop_1016,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%i6,	0x1929,	%i5
loop_1015:
	or	%g1,	0x0E30,	%i2
	bne,pt	%xcc,	loop_1017
loop_1016:
	ldd	[%l7 + 0x68],	%g2
	movge	%icc,	%l1,	%i4
	xor	%i7,	%i1,	%i3
loop_1017:
	edge16ln	%o3,	%l3,	%o1
	umul	%l2,	%o5,	%l0
	tvc	%xcc,	0x7
	ldd	[%l7 + 0x58],	%g2
	mulscc	%l4,	0x1FB0,	%o0
	alignaddrl	%o6,	%g4,	%o2
	movneg	%icc,	%g7,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g6,	0x2FB,	%l6
	fornot2s	%f7,	%f1,	%f24
	edge16ln	%l5,	%g5,	%o7
	srax	%o4,	0x0A,	%i6
	srax	%i5,	%g1,	%g2
	bg	%icc,	loop_1018
	fpsub32	%f20,	%f10,	%f4
	movvs	%xcc,	%i2,	%l1
	fbug	%fcc3,	loop_1019
loop_1018:
	fbn,a	%fcc1,	loop_1020
	tvc	%icc,	0x7
	xor	%i4,	0x0DFB,	%i7
loop_1019:
	andncc	%i1,	%i3,	%l3
loop_1020:
	fbe	%fcc1,	loop_1021
	fbge	%fcc3,	loop_1022
	fmovsl	%xcc,	%f25,	%f6
	sdivcc	%o1,	0x1DDC,	%o3
loop_1021:
	mulx	%o5,	%l0,	%g3
loop_1022:
	sllx	%l4,	0x11,	%o0
	brnz	%l2,	loop_1023
	fbug	%fcc3,	loop_1024
	fbo	%fcc2,	loop_1025
	edge32n	%o6,	%o2,	%g7
loop_1023:
	edge32l	%g4,	%g6,	%l6
loop_1024:
	movge	%icc,	%i0,	%l5
loop_1025:
	fbuge,a	%fcc3,	loop_1026
	tsubcc	%o7,	0x04F1,	%g5
	ldsw	[%l7 + 0x2C],	%i6
	set	0x14, %g7
	stha	%i5,	[%l7 + %g7] 0x80
loop_1026:
	umulcc	%g1,	%g2,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x44, %i4
	ldsba	[%l7 + %i4] 0x19,	%o4
	tcs	%icc,	0x5
	set	0x70, %o6
	sta	%f4,	[%l7 + %o6] 0x11
	array32	%l1,	%i4,	%i7
	ba,a,pt	%xcc,	loop_1027
	and	%i3,	0x0AE1,	%i1
	fnand	%f4,	%f20,	%f28
	subc	%l3,	0x084E,	%o3
loop_1027:
	sll	%o1,	0x14,	%l0
	edge16l	%g3,	%o5,	%o0
	srax	%l4,	%l2,	%o2
	sir	0x1D44
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g7,	%g4,	%g6
	tl	%icc,	0x0
	te	%icc,	0x5
	movrgez	%o6,	0x14B,	%i0
	flush	%l7 + 0x40
	sll	%l6,	0x17,	%l5
	movg	%icc,	%g5,	%o7
	sir	0x040C
	edge8l	%i5,	%i6,	%g2
	brlz	%i2,	loop_1028
	srlx	%g1,	0x13,	%l1
	bcs,pt	%icc,	loop_1029
	fmovde	%icc,	%f12,	%f5
loop_1028:
	fpadd16s	%f17,	%f21,	%f25
	and	%o4,	0x19A4,	%i4
loop_1029:
	movrlez	%i3,	0x069,	%i7
	movvs	%icc,	%i1,	%o3
	brgez	%o1,	loop_1030
	fbge	%fcc0,	loop_1031
	bpos,a	loop_1032
	fornot2	%f18,	%f26,	%f30
loop_1030:
	ldd	[%l7 + 0x68],	%f4
loop_1031:
	add	%l0,	%l3,	%o5
loop_1032:
	movneg	%xcc,	%g3,	%o0
	movrlez	%l2,	%o2,	%l4
	taddcctv	%g7,	%g6,	%g4
	sdivcc	%o6,	0x1F8D,	%l6
	fmovrsgz	%l5,	%f0,	%f11
	brgez	%g5,	loop_1033
	fba	%fcc0,	loop_1034
	fmul8x16au	%f15,	%f17,	%f26
	movleu	%xcc,	%o7,	%i0
loop_1033:
	edge16ln	%i5,	%i6,	%g2
loop_1034:
	smulcc	%i2,	%g1,	%l1
	addcc	%o4,	%i4,	%i7
	orn	%i1,	%o3,	%o1
	tn	%icc,	0x2
	std	%f4,	[%l7 + 0x30]
	alignaddr	%i3,	%l0,	%l3
	mova	%xcc,	%o5,	%o0
	fmovrdlz	%g3,	%f22,	%f12
	xor	%o2,	%l2,	%l4
	tn	%icc,	0x1
	edge16n	%g6,	%g7,	%g4
	fmovscc	%xcc,	%f4,	%f0
	st	%f19,	[%l7 + 0x64]
	fpsub16s	%f0,	%f12,	%f3
	fpsub32s	%f24,	%f28,	%f0
	tn	%icc,	0x6
	subc	%o6,	%l5,	%l6
	orncc	%g5,	0x1DE0,	%i0
	movvs	%icc,	%i5,	%i6
	tl	%xcc,	0x0
	edge16ln	%g2,	%i2,	%g1
	movcc	%icc,	%o7,	%o4
	bn,pt	%xcc,	loop_1035
	nop
	set	0x7E, %o5
	ldstub	[%l7 + %o5],	%i4
	bn,pt	%icc,	loop_1036
	srlx	%l1,	0x00,	%i7
loop_1035:
	ldub	[%l7 + 0x43],	%i1
	tsubcc	%o3,	0x15AB,	%o1
loop_1036:
	movvc	%xcc,	%l0,	%l3
	fxnors	%f13,	%f19,	%f3
	addc	%i3,	%o0,	%o5
	smul	%g3,	0x182C,	%o2
	fcmpne16	%f8,	%f26,	%l2
	tge	%icc,	0x4
	be,a,pn	%icc,	loop_1037
	bvc,a,pt	%icc,	loop_1038
	fbo	%fcc1,	loop_1039
	movcs	%xcc,	%l4,	%g7
loop_1037:
	andn	%g4,	%g6,	%o6
loop_1038:
	nop
	wr	%g0,	0x80,	%asi
	stba	%l6,	[%l7 + 0x37] %asi
loop_1039:
	sub	%l5,	0x0587,	%i0
	brgz,a	%i5,	loop_1040
	ble,a	%icc,	loop_1041
	ldstub	[%l7 + 0x54],	%i6
	udiv	%g2,	0x1DE0,	%g5
loop_1040:
	array32	%g1,	%o7,	%i2
loop_1041:
	movle	%xcc,	%o4,	%i4
	fblg	%fcc1,	loop_1042
	taddcctv	%i7,	%l1,	%i1
	fcmpeq16	%f28,	%f22,	%o3
	fnegd	%f26,	%f30
loop_1042:
	flush	%l7 + 0x0C
	fpack32	%f16,	%f24,	%f8
	sdivx	%l0,	0x1BD6,	%o1
	movpos	%xcc,	%l3,	%i3
	tle	%xcc,	0x0
	fsrc1	%f16,	%f4
	mulscc	%o5,	%o0,	%g3
	ldd	[%l7 + 0x28],	%l2
	fabsd	%f20,	%f4
	fbe	%fcc2,	loop_1043
	popc	%o2,	%g7
	movvc	%icc,	%l4,	%g6
	fbuge	%fcc3,	loop_1044
loop_1043:
	orn	%g4,	0x1298,	%l6
	fnot1	%f28,	%f8
	ba,a	loop_1045
loop_1044:
	array32	%l5,	%i0,	%o6
	edge8ln	%i6,	%g2,	%g5
	fbl,a	%fcc1,	loop_1046
loop_1045:
	fmovscs	%xcc,	%f30,	%f12
	fandnot2s	%f8,	%f27,	%f16
	fmovrdgez	%g1,	%f10,	%f10
loop_1046:
	umul	%o7,	0x10D4,	%i5
	edge8	%i2,	%o4,	%i4
	orncc	%l1,	0x1DC8,	%i7
	tge	%icc,	0x3
	tle	%icc,	0x4
	srax	%o3,	0x0F,	%i1
	movvc	%xcc,	%o1,	%l3
	edge32ln	%i3,	%o5,	%o0
	movleu	%xcc,	%g3,	%l2
	brnz	%l0,	loop_1047
	edge16n	%g7,	%o2,	%l4
	movvc	%icc,	%g4,	%l6
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x0A] %asi,	%l5
loop_1047:
	edge8	%g6,	%i0,	%i6
	fcmpes	%fcc3,	%f2,	%f0
	set	0x64, %i7
	ldswa	[%l7 + %i7] 0x89,	%o6
	fpadd16	%f2,	%f18,	%f2
	wr	%g0,	0x0c,	%asi
	stba	%g5,	[%l7 + 0x57] %asi
	srl	%g1,	%o7,	%g2
	fbne,a	%fcc2,	loop_1048
	subc	%i2,	0x17C8,	%i5
	movrne	%o4,	0x2CC,	%l1
	stbar
loop_1048:
	andcc	%i4,	0x0886,	%o3
	edge8l	%i7,	%o1,	%l3
	addccc	%i3,	0x07CF,	%i1
	edge16l	%o5,	%g3,	%o0
	membar	0x12
	fba,a	%fcc3,	loop_1049
	alignaddrl	%l0,	%g7,	%o2
	srlx	%l4,	0x05,	%l2
	ta	%icc,	0x5
loop_1049:
	array8	%l6,	%l5,	%g6
	call	loop_1050
	bg	loop_1051
	fmovsne	%xcc,	%f11,	%f31
	movne	%xcc,	%g4,	%i0
loop_1050:
	and	%i6,	%o6,	%g1
loop_1051:
	brnz,a	%o7,	loop_1052
	fmuld8sux16	%f14,	%f2,	%f20
	std	%f20,	[%l7 + 0x20]
	andncc	%g5,	%i2,	%i5
loop_1052:
	tl	%xcc,	0x7
	tsubcctv	%o4,	%l1,	%g2
	smulcc	%o3,	%i7,	%o1
	fmovsl	%icc,	%f30,	%f17
	fmovrdne	%l3,	%f8,	%f4
	movn	%xcc,	%i3,	%i1
	bne	%xcc,	loop_1053
	fmovda	%icc,	%f28,	%f8
	movvs	%xcc,	%i4,	%o5
	tg	%icc,	0x5
loop_1053:
	taddcctv	%o0,	%g3,	%l0
	edge8l	%g7,	%l4,	%l2
	prefetch	[%l7 + 0x14],	 0x3
	movgu	%xcc,	%o2,	%l5
	tn	%icc,	0x6
	be,pt	%icc,	loop_1054
	stw	%l6,	[%l7 + 0x30]
	bvs,pt	%icc,	loop_1055
	movcc	%xcc,	%g6,	%g4
loop_1054:
	edge32ln	%i0,	%i6,	%o6
	set	0x3C, %o4
	stwa	%o7,	[%l7 + %o4] 0x2b
	membar	#Sync
loop_1055:
	nop
	setx	loop_1056,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16ln	%g5,	%i2,	%g1
	fors	%f21,	%f29,	%f22
	andcc	%i5,	0x1C51,	%l1
loop_1056:
	bvc	loop_1057
	edge16	%o4,	%o3,	%g2
	tg	%icc,	0x0
	nop
	setx loop_1058, %l0, %l1
	jmpl %l1, %o1
loop_1057:
	movre	%i7,	0x10C,	%i3
	move	%xcc,	%l3,	%i4
	brnz	%o5,	loop_1059
loop_1058:
	movrlez	%o0,	%i1,	%l0
	tne	%xcc,	0x7
	edge16	%g7,	%l4,	%l2
loop_1059:
	edge32	%o2,	%g3,	%l5
	fpsub16s	%f20,	%f0,	%f13
	fsrc2	%f18,	%f12
	sdivcc	%l6,	0x09EB,	%g4
	movrlez	%i0,	%i6,	%o6
	fcmple32	%f4,	%f8,	%o7
	sdivx	%g5,	0x0C73,	%g6
	andcc	%g1,	0x1EB1,	%i5
	ldsb	[%l7 + 0x52],	%l1
	fbl,a	%fcc0,	loop_1060
	srax	%i2,	%o3,	%o4
	edge16	%o1,	%i7,	%g2
	taddcctv	%l3,	%i4,	%o5
loop_1060:
	fcmpeq32	%f22,	%f26,	%o0
	xnor	%i1,	0x066E,	%l0
	fmul8sux16	%f8,	%f26,	%f0
	fnot2	%f24,	%f12
	fpadd32s	%f21,	%f20,	%f22
	pdist	%f12,	%f4,	%f30
	orncc	%i3,	%l4,	%g7
	bge,pt	%icc,	loop_1061
	udivcc	%o2,	0x0E6B,	%l2
	fsrc2	%f12,	%f22
	andn	%g3,	%l5,	%l6
loop_1061:
	fmovdpos	%xcc,	%f3,	%f12
	pdist	%f4,	%f4,	%f20
	lduh	[%l7 + 0x1A],	%i0
	fpadd32	%f16,	%f30,	%f4
	movrne	%g4,	0x007,	%i6
	array32	%o7,	%o6,	%g6
	tcs	%xcc,	0x1
	fmovdne	%icc,	%f5,	%f10
	fble,a	%fcc0,	loop_1062
	ldsh	[%l7 + 0x30],	%g1
	sra	%g5,	0x18,	%i5
	movrgez	%l1,	%o3,	%i2
loop_1062:
	addc	%o4,	0x1EF9,	%i7
	nop
	setx	loop_1063,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%o1,	%l3,	%g2
	edge32	%i4,	%o0,	%o5
	bne,a,pn	%icc,	loop_1064
loop_1063:
	movrlz	%l0,	0x10F,	%i1
	andncc	%i3,	%g7,	%o2
	set	0x38, %l1
	stxa	%l4,	[%l7 + %l1] 0x04
loop_1064:
	edge8ln	%l2,	%g3,	%l5
	subcc	%i0,	%g4,	%l6
	nop
	setx	loop_1065,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%i6,	%o6,	%o7
	edge8ln	%g1,	%g5,	%i5
	std	%f2,	[%l7 + 0x58]
loop_1065:
	fmovdne	%icc,	%f30,	%f2
	brlez,a	%g6,	loop_1066
	movrlz	%o3,	%l1,	%o4
	fblg,a	%fcc0,	loop_1067
	fcmps	%fcc2,	%f11,	%f14
loop_1066:
	fmovdleu	%icc,	%f15,	%f25
	edge16ln	%i2,	%i7,	%o1
loop_1067:
	fors	%f7,	%f14,	%f27
	fmovsgu	%icc,	%f16,	%f22
	udivx	%g2,	0x03C8,	%l3
	pdist	%f18,	%f16,	%f26
	orn	%i4,	0x1F2C,	%o5
	movgu	%icc,	%l0,	%o0
	faligndata	%f8,	%f4,	%f12
	fmovrsgz	%i1,	%f5,	%f21
	tcc	%icc,	0x1
	fbe,a	%fcc1,	loop_1068
	tleu	%xcc,	0x5
	membar	0x7F
	fmovdleu	%xcc,	%f31,	%f3
loop_1068:
	sll	%g7,	%o2,	%l4
	fmovd	%f14,	%f24
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x5C] %asi,	%f28
	movn	%xcc,	%l2,	%g3
	mova	%xcc,	%i3,	%i0
	bcs,a,pn	%icc,	loop_1069
	nop
	setx	loop_1070,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovs	%f11,	%f27
	fnot1	%f30,	%f4
loop_1069:
	umul	%g4,	%l5,	%i6
loop_1070:
	sub	%l6,	0x0A45,	%o7
	edge8n	%o6,	%g5,	%i5
	fand	%f12,	%f22,	%f2
	fpack16	%f12,	%f10
	fbe,a	%fcc1,	loop_1071
	std	%g6,	[%l7 + 0x38]
	siam	0x1
	subc	%o3,	%l1,	%g1
loop_1071:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	ldstub	[%l7 + 0x50],	%i7
	fpsub32s	%f5,	%f17,	%f7
	udiv	%i2,	0x05DF,	%g2
	set	0x28, %g6
	swapa	[%l7 + %g6] 0x19,	%l3
	movg	%xcc,	%o1,	%o5
	smul	%i4,	0x02CF,	%l0
	andn	%o0,	%g7,	%i1
	edge8n	%o2,	%l4,	%g3
	xnorcc	%i3,	%l2,	%i0
	edge16ln	%g4,	%l5,	%l6
	bgu,pn	%xcc,	loop_1072
	fnot1	%f2,	%f28
	fandnot2	%f26,	%f28,	%f26
	sll	%o7,	%o6,	%g5
loop_1072:
	nop
	set	0x58, %i3
	ldsha	[%l7 + %i3] 0x04,	%i5
	sll	%g6,	0x06,	%o3
	movle	%xcc,	%i6,	%g1
	bvs,a,pn	%xcc,	loop_1073
	mulscc	%o4,	0x08EE,	%i7
	andcc	%l1,	%g2,	%i2
	movcc	%icc,	%o1,	%o5
loop_1073:
	andncc	%l3,	%l0,	%o0
	xor	%i4,	0x18A0,	%i1
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x1e
	membar	#Sync
	flush	%l7 + 0x48
	orn	%g7,	%o2,	%g3
	fsrc2s	%f16,	%f11
	fcmpne32	%f2,	%f12,	%l4
	umul	%i3,	0x0DE1,	%l2
	srax	%i0,	%l5,	%l6
	sth	%g4,	[%l7 + 0x62]
	tle	%icc,	0x2
	alignaddrl	%o6,	%g5,	%i5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%g6
	subcc	%o7,	0x01CD,	%o3
	bne,a	loop_1074
	fbul	%fcc2,	loop_1075
	fnot2	%f18,	%f16
	edge16n	%i6,	%g1,	%i7
loop_1074:
	tge	%icc,	0x5
loop_1075:
	movrlz	%o4,	0x102,	%l1
	fandnot1	%f2,	%f26,	%f8
	wr	%g0,	0x2f,	%asi
	stda	%i2,	[%l7 + 0x18] %asi
	membar	#Sync
	tneg	%icc,	0x7
	ldstub	[%l7 + 0x34],	%o1
	fnands	%f25,	%f7,	%f14
	fmovrdne	%g2,	%f6,	%f30
	fbu,a	%fcc0,	loop_1076
	sdivcc	%l3,	0x181D,	%o5
	andcc	%o0,	%l0,	%i1
	fxnors	%f8,	%f16,	%f25
loop_1076:
	ldsh	[%l7 + 0x42],	%i4
	edge16l	%o2,	%g7,	%g3
	edge16n	%l4,	%i3,	%i0
	add	%l5,	%l6,	%g4
	fmovsge	%icc,	%f17,	%f17
	tvs	%xcc,	0x4
	movpos	%xcc,	%l2,	%g5
	fmovrslz	%o6,	%f9,	%f2
	movcc	%xcc,	%i5,	%g6
	addccc	%o3,	%i6,	%g1
	fcmpeq16	%f14,	%f30,	%o7
	array32	%o4,	%i7,	%i2
	movgu	%xcc,	%o1,	%l1
	tsubcctv	%g2,	%o5,	%o0
	ta	%icc,	0x2
	fbg,a	%fcc2,	loop_1077
	edge32	%l3,	%l0,	%i4
	fmovse	%icc,	%f29,	%f1
	fmovrde	%o2,	%f30,	%f20
loop_1077:
	andn	%g7,	0x1052,	%g3
	fmul8sux16	%f4,	%f6,	%f8
	movl	%icc,	%l4,	%i3
	fxor	%f20,	%f14,	%f12
	udivx	%i0,	0x1C95,	%l5
	sethi	0x0CE0,	%l6
	fsrc1	%f6,	%f10
	array32	%g4,	%l2,	%g5
	edge8l	%o6,	%i1,	%i5
	srlx	%o3,	%g6,	%i6
	tcc	%icc,	0x4
	bleu,a	loop_1078
	edge8	%o7,	%o4,	%g1
	tg	%icc,	0x4
	add	%i2,	%i7,	%l1
loop_1078:
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%g2,	[%l7 + 0x08] %asi
	membar	#Sync
	fbo,a	%fcc0,	loop_1079
	movre	%o5,	0x084,	%o0
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1079:
	smulcc	%o1,	%l0,	%l3
	tvs	%icc,	0x3
	sdivx	%i4,	0x0F5C,	%o2
	fcmped	%fcc0,	%f20,	%f24
	addccc	%g7,	%g3,	%i3
	fmovsne	%xcc,	%f22,	%f17
	umul	%i0,	0x1A3C,	%l5
	movvs	%xcc,	%l4,	%g4
	array16	%l6,	%l2,	%g5
	fmul8ulx16	%f22,	%f6,	%f22
	nop
	setx	loop_1080,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%o6,	0x1666,	%i5
	ldsw	[%l7 + 0x14],	%o3
	tneg	%icc,	0x1
loop_1080:
	movcs	%xcc,	%i1,	%i6
	ldx	[%l7 + 0x60],	%g6
	std	%o6,	[%l7 + 0x48]
	fbue,a	%fcc1,	loop_1081
	fand	%f2,	%f4,	%f28
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x1e,	%f16
loop_1081:
	fone	%f30
	add	%g1,	%o4,	%i2
	edge32	%l1,	%g2,	%i7
	movrgz	%o5,	0x111,	%o1
	edge32n	%l0,	%o0,	%i4
	sir	0x1558
	tsubcctv	%l3,	0x0EA0,	%o2
	tl	%xcc,	0x7
	mova	%xcc,	%g7,	%g3
	edge8	%i3,	%i0,	%l4
	edge16	%g4,	%l5,	%l6
	xor	%l2,	%o6,	%i5
	fmovdpos	%icc,	%f4,	%f16
	movl	%icc,	%g5,	%i1
	stw	%i6,	[%l7 + 0x10]
	edge32ln	%g6,	%o3,	%o7
	fmuld8ulx16	%f31,	%f24,	%f2
	andncc	%o4,	%i2,	%g1
	fmovrdlez	%l1,	%f24,	%f0
	srax	%g2,	%o5,	%i7
	add	%l0,	0x1758,	%o0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x10] %asi,	%o1
	edge16	%l3,	%o2,	%i4
	fnot1s	%f31,	%f21
	andn	%g3,	0x0057,	%i3
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x7E] %asi,	%g7
	movl	%icc,	%i0,	%g4
	fmovde	%xcc,	%f26,	%f7
	te	%xcc,	0x3
	tsubcc	%l4,	0x09C1,	%l5
	movrgez	%l2,	0x0D3,	%o6
	movn	%xcc,	%i5,	%l6
	movre	%i1,	%g5,	%g6
	sdivx	%o3,	0x06DC,	%i6
	mulscc	%o4,	0x0D55,	%o7
	orncc	%g1,	0x142F,	%l1
	edge16l	%i2,	%g2,	%o5
	alignaddr	%l0,	%o0,	%i7
	subc	%o1,	%l3,	%o2
	nop
	setx	loop_1082,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%g3,	0x1002,	%i4
	fmovsne	%icc,	%f8,	%f20
	andcc	%i3,	0x0178,	%g7
loop_1082:
	std	%i0,	[%l7 + 0x50]
	fmovde	%xcc,	%f16,	%f25
	movvs	%xcc,	%l4,	%g4
	fmovdn	%icc,	%f6,	%f8
	taddcctv	%l5,	%l2,	%o6
	add	%l6,	%i1,	%i5
	sir	0x0EE9
	mulx	%g6,	0x05B8,	%g5
	edge32n	%i6,	%o3,	%o4
	fmovdpos	%icc,	%f11,	%f6
	set	0x40, %l0
	lda	[%l7 + %l0] 0x19,	%f6
	tg	%xcc,	0x7
	fandnot1	%f10,	%f26,	%f0
	movrne	%o7,	0x2A3,	%l1
	smulcc	%g1,	0x1EBF,	%i2
	tleu	%icc,	0x6
	movg	%icc,	%g2,	%l0
	fandnot1	%f6,	%f10,	%f18
	srl	%o0,	0x16,	%i7
	set	0x0C, %o1
	swapa	[%l7 + %o1] 0x18,	%o1
	sdivcc	%o5,	0x0813,	%o2
	andcc	%g3,	0x1899,	%i4
	sethi	0x1067,	%i3
	ldstub	[%l7 + 0x72],	%l3
	mulscc	%g7,	0x13E9,	%l4
	fpadd16	%f12,	%f12,	%f0
	tleu	%icc,	0x3
	tneg	%xcc,	0x6
	bcs,pt	%xcc,	loop_1083
	fmovrdne	%i0,	%f16,	%f4
	fmovrsgez	%g4,	%f1,	%f30
	edge8l	%l2,	%l5,	%o6
loop_1083:
	fands	%f27,	%f6,	%f16
	movrlez	%l6,	%i1,	%i5
	smul	%g6,	%g5,	%o3
	sir	0x1AFF
	fmovse	%xcc,	%f20,	%f1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%o4
	brnz,a	%o7,	loop_1084
	sir	0x0BFA
	addc	%i6,	0x05CA,	%g1
	mova	%icc,	%i2,	%l1
loop_1084:
	srax	%g2,	%o0,	%i7
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x68] %asi,	%l0
	fmovrdgez	%o1,	%f12,	%f2
	sdivcc	%o5,	0x0947,	%o2
	movge	%icc,	%i4,	%g3
	smul	%i3,	0x1740,	%l3
	umulcc	%l4,	0x1139,	%i0
	popc	0x018C,	%g4
	orcc	%g7,	0x0846,	%l2
	fornot1s	%f31,	%f6,	%f10
	fcmpgt16	%f24,	%f2,	%o6
	brz,a	%l6,	loop_1085
	andcc	%i1,	0x1F51,	%i5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%g6
loop_1085:
	subccc	%o3,	%g5,	%o7
	fzeros	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x0
	fbne	%fcc0,	loop_1086
	edge16	%i6,	%g1,	%i2
	fmovdvc	%xcc,	%f29,	%f14
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%o4
loop_1086:
	move	%icc,	%g2,	%i7
	set	0x3C, %i0
	stwa	%o0,	[%l7 + %i0] 0x80
	fpmerge	%f16,	%f10,	%f20
	movrne	%l0,	0x114,	%o5
	brnz,a	%o1,	loop_1087
	edge8n	%i4,	%g3,	%i3
	fmul8ulx16	%f24,	%f16,	%f10
	addcc	%l3,	0x1CDE,	%l4
loop_1087:
	fxnors	%f14,	%f9,	%f23
	movge	%icc,	%o2,	%g4
	brnz,a	%i0,	loop_1088
	tpos	%icc,	0x3
	tcs	%icc,	0x5
	fbug	%fcc3,	loop_1089
loop_1088:
	popc	0x0A67,	%g7
	brlz,a	%o6,	loop_1090
	mulscc	%l6,	0x1900,	%l2
loop_1089:
	xnor	%i1,	0x180C,	%l5
	bge,a	loop_1091
loop_1090:
	srlx	%i5,	%o3,	%g5
	fmovrdlz	%o7,	%f22,	%f0
	fmovrdlez	%i6,	%f16,	%f14
loop_1091:
	flush	%l7 + 0x74
	tle	%icc,	0x5
	movn	%icc,	%g1,	%g6
	fmovrdgez	%l1,	%f14,	%f10
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	popc	0x0D6C,	%i2
	xorcc	%o4,	0x0D29,	%g2
	movrlez	%o0,	0x290,	%i7
	fbn,a	%fcc1,	loop_1092
	mova	%xcc,	%l0,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i4,	0x19D3,	%o5
loop_1092:
	ta	%icc,	0x6
	brz	%g3,	loop_1093
	fand	%f20,	%f12,	%f16
	movrlez	%i3,	%l3,	%l4
	xnor	%o2,	%i0,	%g4
loop_1093:
	popc	0x1653,	%o6
	tge	%xcc,	0x3
	bpos,pn	%icc,	loop_1094
	edge16ln	%g7,	%l2,	%i1
	brlz	%l5,	loop_1095
	edge8n	%l6,	%o3,	%g5
loop_1094:
	movpos	%icc,	%o7,	%i6
	movn	%icc,	%i5,	%g1
loop_1095:
	movg	%xcc,	%g6,	%l1
	fnegd	%f14,	%f2
	mulx	%o4,	%g2,	%i2
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x11,	 0x3
	tgu	%xcc,	0x4
	fnand	%f2,	%f20,	%f30
	fmovsge	%xcc,	%f29,	%f30
	fbul	%fcc1,	loop_1096
	alignaddr	%o0,	%l0,	%o1
	ldd	[%l7 + 0x10],	%o4
	subc	%g3,	%i4,	%i3
loop_1096:
	ta	%xcc,	0x1
	bcc,a,pn	%icc,	loop_1097
	edge8ln	%l4,	%o2,	%i0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l3
loop_1097:
	fmovsg	%icc,	%f27,	%f2
	movge	%icc,	%o6,	%g4
	brgez	%l2,	loop_1098
	movcs	%icc,	%g7,	%i1
	movpos	%icc,	%l5,	%l6
	sllx	%g5,	0x1A,	%o3
loop_1098:
	membar	0x40
	mova	%xcc,	%o7,	%i6
	movrgez	%i5,	%g6,	%l1
	orn	%o4,	%g1,	%i2
	andncc	%i7,	%o0,	%l0
	sub	%g2,	%o5,	%o1
	umulcc	%i4,	%i3,	%g3
	fnands	%f9,	%f20,	%f1
	addc	%l4,	%o2,	%l3
	nop
	setx loop_1099, %l0, %l1
	jmpl %l1, %i0
	fornot1	%f10,	%f20,	%f22
	addcc	%o6,	0x04A5,	%g4
	movn	%xcc,	%g7,	%i1
loop_1099:
	fnot1s	%f20,	%f18
	add	%l5,	0x0718,	%l6
	addc	%g5,	%o3,	%l2
	fpadd32	%f20,	%f28,	%f4
	bl,pt	%xcc,	loop_1100
	bn,a	loop_1101
	bn,pn	%xcc,	loop_1102
	xnor	%i6,	%o7,	%g6
loop_1100:
	ldstub	[%l7 + 0x36],	%i5
loop_1101:
	swap	[%l7 + 0x48],	%o4
loop_1102:
	andn	%g1,	0x0617,	%i2
	fbn,a	%fcc2,	loop_1103
	movvc	%icc,	%l1,	%i7
	udivx	%o0,	0x1A32,	%l0
	set	0x38, %l2
	ldsha	[%l7 + %l2] 0x10,	%o5
loop_1103:
	for	%f26,	%f12,	%f20
	fblg	%fcc2,	loop_1104
	tn	%icc,	0x3
	tneg	%xcc,	0x6
	addcc	%o1,	%g2,	%i3
loop_1104:
	fbn,a	%fcc2,	loop_1105
	taddcc	%g3,	0x193D,	%i4
	brlez	%o2,	loop_1106
	fmovrdgz	%l4,	%f30,	%f28
loop_1105:
	fmovdgu	%xcc,	%f29,	%f16
	popc	%l3,	%i0
loop_1106:
	popc	0x1595,	%o6
	fmovrsne	%g4,	%f8,	%f25
	orcc	%i1,	0x17C4,	%g7
	fzeros	%f13
	nop
	set	0x58, %i2
	stx	%l6,	[%l7 + %i2]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x28],	 0x1
	udiv	%g5,	0x019E,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	stda	%l2,	[%l7 + 0x70] %asi
	xnorcc	%i6,	0x1A57,	%o7
	edge8n	%o3,	%i5,	%g6
	fmovsvc	%xcc,	%f22,	%f6
	fmul8x16au	%f11,	%f20,	%f20
	fmovdpos	%xcc,	%f11,	%f19
	edge32n	%g1,	%o4,	%i2
	fbge,a	%fcc0,	loop_1107
	xnorcc	%i7,	0x166A,	%l1
	sdiv	%o0,	0x16BE,	%l0
	fornot1	%f24,	%f6,	%f10
loop_1107:
	or	%o5,	0x080E,	%g2
	lduw	[%l7 + 0x78],	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g3,	%i4,	%o2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x80
	fone	%f22
	tgu	%icc,	0x7
	subc	%l4,	%l3,	%i3
	bleu,pt	%xcc,	loop_1108
	movn	%icc,	%o6,	%i0
	movle	%icc,	%i1,	%g7
	fcmpgt16	%f24,	%f28,	%g4
loop_1108:
	srlx	%l6,	0x1B,	%l5
	tvs	%xcc,	0x3
	movg	%xcc,	%l2,	%g5
	array32	%o7,	%o3,	%i6
	bg	loop_1109
	tge	%xcc,	0x7
	orn	%i5,	0x1215,	%g1
	fornot1s	%f30,	%f21,	%f10
loop_1109:
	nop
	set	0x42, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g6
	sra	%i2,	0x0B,	%i7
	subccc	%l1,	0x0229,	%o4
	fmul8x16	%f23,	%f16,	%f20
	udiv	%l0,	0x1A33,	%o0
	tn	%icc,	0x1
	fmul8x16al	%f25,	%f23,	%f28
	srl	%g2,	0x12,	%o5
	bg,a	loop_1110
	edge8l	%o1,	%i4,	%o2
	bn	%icc,	loop_1111
	fmuld8ulx16	%f17,	%f14,	%f26
loop_1110:
	brnz	%l4,	loop_1112
	tne	%xcc,	0x5
loop_1111:
	sir	0x1BEF
	movcs	%xcc,	%g3,	%l3
loop_1112:
	tvc	%xcc,	0x3
	ta	%icc,	0x7
	fpadd32	%f10,	%f18,	%f4
	fmovdle	%icc,	%f24,	%f30
	fmovdleu	%icc,	%f5,	%f1
	xnorcc	%i3,	%o6,	%i0
	edge16l	%i1,	%g4,	%l6
	smul	%g7,	0x14FC,	%l5
	fxnors	%f31,	%f1,	%f19
	fbu	%fcc1,	loop_1113
	tcs	%xcc,	0x5
	udiv	%g5,	0x0533,	%l2
	xorcc	%o7,	%o3,	%i6
loop_1113:
	nop
	set	0x40, %o0
	lda	[%l7 + %o0] 0x19,	%f3
	ldd	[%l7 + 0x28],	%i4
	fmul8x16	%f4,	%f20,	%f24
	fmovdpos	%icc,	%f14,	%f29
	lduw	[%l7 + 0x50],	%g1
	call	loop_1114
	brgz	%i2,	loop_1115
	and	%g6,	0x0E30,	%l1
	brlz,a	%i7,	loop_1116
loop_1114:
	tvs	%icc,	0x3
loop_1115:
	edge32	%l0,	%o0,	%g2
	bshuffle	%f2,	%f16,	%f30
loop_1116:
	xnorcc	%o5,	%o4,	%i4
	movrne	%o2,	%l4,	%g3
	brnz,a	%l3,	loop_1117
	fsrc1	%f18,	%f14
	edge16n	%o1,	%o6,	%i0
	fnot1	%f2,	%f6
loop_1117:
	te	%icc,	0x6
	fmovrdgz	%i1,	%f4,	%f4
	flush	%l7 + 0x54
	mulscc	%i3,	%g4,	%l6
	smul	%l5,	%g7,	%l2
	wr	%g0,	0x04,	%asi
	sta	%f24,	[%l7 + 0x78] %asi
	popc	0x08AD,	%g5
	tcc	%icc,	0x0
	fpadd32s	%f31,	%f17,	%f3
	stx	%o3,	[%l7 + 0x40]
	add	%i6,	0x095A,	%i5
	bg,pn	%xcc,	loop_1118
	edge16l	%o7,	%i2,	%g6
	lduw	[%l7 + 0x48],	%g1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x60] %asi,	%i7
loop_1118:
	tl	%xcc,	0x1
	sub	%l1,	0x0747,	%l0
	fbuge	%fcc2,	loop_1119
	fmovrdlez	%o0,	%f10,	%f8
	movrne	%g2,	0x19F,	%o4
	fbul,a	%fcc2,	loop_1120
loop_1119:
	subccc	%o5,	0x1B56,	%o2
	fmovscc	%icc,	%f31,	%f10
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%f2
loop_1120:
	movrgez	%i4,	0x398,	%g3
	array32	%l3,	%l4,	%o1
	edge16	%i0,	%i1,	%o6
	nop
	setx	loop_1121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%xcc,	0x2
	fmovrdne	%g4,	%f4,	%f2
	fones	%f16
loop_1121:
	movrne	%i3,	%l6,	%g7
	fpmerge	%f28,	%f11,	%f18
	umulcc	%l5,	%l2,	%g5
	movle	%icc,	%o3,	%i6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x66] %asi,	%o7
	addccc	%i5,	0x0E77,	%i2
	mulscc	%g1,	0x1F24,	%g6
	sth	%i7,	[%l7 + 0x4A]
	bcc,a	%xcc,	loop_1122
	movgu	%xcc,	%l1,	%o0
	subc	%g2,	%o4,	%o5
	tsubcc	%l0,	0x17CF,	%o2
loop_1122:
	lduh	[%l7 + 0x10],	%i4
	add	%l3,	0x0D13,	%g3
	fpsub16	%f16,	%f6,	%f18
	fandnot1s	%f30,	%f27,	%f3
	alignaddr	%l4,	%i0,	%o1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	fmovrsne	%o6,	%f31,	%f15
	xnorcc	%g4,	%l6,	%g7
	movcs	%icc,	%l5,	%l2
	fnot2	%f6,	%f6
	tne	%icc,	0x7
	sll	%g5,	0x16,	%i3
	bpos,a	%xcc,	loop_1123
	movrlz	%i6,	%o3,	%o7
	fmovdl	%icc,	%f25,	%f15
	srlx	%i2,	0x04,	%g1
loop_1123:
	fsrc1s	%f31,	%f1
	sll	%g6,	0x19,	%i7
	fbuge	%fcc2,	loop_1124
	fnot1s	%f0,	%f26
	fmovrse	%l1,	%f3,	%f8
	array8	%o0,	%g2,	%o4
loop_1124:
	udiv	%i5,	0x185B,	%l0
	movle	%icc,	%o5,	%i4
	set	0x24, %l4
	swapa	[%l7 + %l4] 0x89,	%o2
	fpadd16s	%f15,	%f14,	%f26
	movre	%l3,	0x317,	%l4
	sth	%i0,	[%l7 + 0x78]
	be,a,pt	%icc,	loop_1125
	xnor	%o1,	%g3,	%o6
	edge32	%g4,	%i1,	%g7
	udiv	%l5,	0x03B2,	%l6
loop_1125:
	movrne	%l2,	%i3,	%i6
	tcs	%icc,	0x5
	umul	%g5,	%o3,	%i2
	movpos	%icc,	%o7,	%g1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g6
	xor	%l1,	%i7,	%o0
	taddcc	%g2,	%o4,	%l0
	movge	%xcc,	%o5,	%i4
	tpos	%icc,	0x7
	ldsh	[%l7 + 0x2A],	%o2
	membar	0x0B
	fba	%fcc2,	loop_1126
	fmovsleu	%icc,	%f25,	%f13
	smul	%i5,	0x06DD,	%l3
	and	%l4,	0x194F,	%o1
loop_1126:
	fmovdvc	%xcc,	%f21,	%f26
	bcs,a	loop_1127
	fcmpne32	%f28,	%f14,	%g3
	stx	%i0,	[%l7 + 0x10]
	edge16	%o6,	%i1,	%g7
loop_1127:
	alignaddrl	%l5,	%g4,	%l2
	movcc	%xcc,	%l6,	%i3
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x89
	fnegd	%f30,	%f24
	set	0x4C, %g1
	stba	%i6,	[%l7 + %g1] 0x22
	membar	#Sync
	fornot2	%f10,	%f18,	%f16
	nop
	setx	loop_1128,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x7
	movre	%g5,	%i2,	%o7
	bvs,pt	%xcc,	loop_1129
loop_1128:
	tn	%xcc,	0x2
	fornot1s	%f31,	%f6,	%f9
	set	0x78, %l3
	prefetcha	[%l7 + %l3] 0x11,	 0x2
loop_1129:
	prefetch	[%l7 + 0x20],	 0x3
	add	%g1,	%g6,	%l1
	fmovrdlez	%i7,	%f0,	%f6
	fpadd32	%f26,	%f22,	%f10
	brz	%g2,	loop_1130
	orncc	%o0,	0x04DE,	%o4
	udivx	%l0,	0x004A,	%o5
	fpsub32s	%f15,	%f17,	%f28
loop_1130:
	brz,a	%o2,	loop_1131
	movrgez	%i5,	%i4,	%l4
	edge16ln	%l3,	%g3,	%o1
	siam	0x1
loop_1131:
	nop
	set	0x5A, %g2
	stha	%o6,	[%l7 + %g2] 0xea
	membar	#Sync
	tl	%icc,	0x5
	edge16l	%i0,	%i1,	%g7
	sub	%g4,	%l2,	%l6
	umulcc	%l5,	0x1825,	%i6
	popc	0x1D42,	%i3
	xor	%g5,	0x0EBC,	%o7
	call	loop_1132
	ta	%icc,	0x2
	orn	%i2,	0x195E,	%g1
	tcs	%xcc,	0x1
loop_1132:
	be,a	%icc,	loop_1133
	array16	%o3,	%g6,	%i7
	fcmpgt16	%f24,	%f10,	%g2
	tle	%icc,	0x0
loop_1133:
	fabss	%f15,	%f30
	movneg	%icc,	%l1,	%o4
	tcs	%xcc,	0x2
	sethi	0x1657,	%l0
	fmovrdlez	%o5,	%f28,	%f28
	movcc	%icc,	%o0,	%o2
	umulcc	%i5,	0x1B4D,	%i4
	edge8n	%l3,	%l4,	%g3
	udivcc	%o1,	0x137F,	%i0
	popc	%i1,	%o6
	sra	%g4,	%g7,	%l6
	fmovdge	%icc,	%f6,	%f5
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l2
	tcs	%xcc,	0x1
	fands	%f27,	%f18,	%f24
	fmovdcs	%xcc,	%f31,	%f6
	fpadd16	%f12,	%f10,	%f30
	ldd	[%l7 + 0x10],	%f30
	fmovrsgz	%l5,	%f18,	%f12
	xor	%i3,	0x15E5,	%g5
	sdivcc	%i6,	0x1B77,	%i2
	set	0x10, %i6
	stwa	%o7,	[%l7 + %i6] 0x15
	movg	%icc,	%g1,	%o3
	fmovrslz	%g6,	%f0,	%f25
	tle	%xcc,	0x3
	subccc	%g2,	%i7,	%l1
	ble,a,pt	%icc,	loop_1134
	sdivcc	%l0,	0x0C96,	%o5
	st	%f15,	[%l7 + 0x2C]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%o4
loop_1134:
	tsubcctv	%i5,	0x0AED,	%o2
	movvs	%icc,	%l3,	%i4
	call	loop_1135
	fzero	%f6
	movrgz	%g3,	%l4,	%i0
	fbo,a	%fcc0,	loop_1136
loop_1135:
	popc	%o1,	%i1
	srlx	%o6,	0x0F,	%g4
	fexpand	%f27,	%f4
loop_1136:
	edge16n	%g7,	%l6,	%l2
	tpos	%xcc,	0x2
	ba	%xcc,	loop_1137
	fmovdl	%icc,	%f23,	%f5
	fexpand	%f11,	%f14
	popc	0x1DDB,	%l5
loop_1137:
	std	%i2,	[%l7 + 0x78]
	ldd	[%l7 + 0x60],	%f8
	array32	%i6,	%g5,	%o7
	tvc	%xcc,	0x0
	tge	%xcc,	0x2
	fbn	%fcc2,	loop_1138
	brgz,a	%g1,	loop_1139
	lduh	[%l7 + 0x22],	%o3
	edge16l	%g6,	%g2,	%i2
loop_1138:
	fbne	%fcc2,	loop_1140
loop_1139:
	std	%f22,	[%l7 + 0x40]
	sethi	0x0685,	%i7
	ldd	[%l7 + 0x50],	%f26
loop_1140:
	ldub	[%l7 + 0x5B],	%l1
	wr	%g0,	0x11,	%asi
	stda	%l0,	[%l7 + 0x30] %asi
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x14] %asi,	%o5
	bge,a,pn	%icc,	loop_1141
	srlx	%o4,	0x03,	%o0
	edge16ln	%o2,	%i5,	%l3
	fmovrdgez	%i4,	%f28,	%f24
loop_1141:
	fmovdleu	%icc,	%f15,	%f29
	tn	%xcc,	0x4
	set	0x64, %l6
	sta	%f19,	[%l7 + %l6] 0x81
	sethi	0x0AEE,	%l4
	add	%i0,	0x0166,	%g3
	movre	%i1,	0x27F,	%o1
	fzeros	%f29
	addccc	%g4,	%o6,	%g7
	ldub	[%l7 + 0x73],	%l6
	tgu	%icc,	0x3
	fba	%fcc0,	loop_1142
	bne,a,pt	%icc,	loop_1143
	fcmple32	%f16,	%f20,	%l2
	movne	%icc,	%l5,	%i3
loop_1142:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1143:
	tne	%xcc,	0x2
	xor	%g5,	%o7,	%g1
	mova	%xcc,	%o3,	%g6
	flush	%l7 + 0x68
	brnz,a	%i6,	loop_1144
	movg	%icc,	%i2,	%g2
	tl	%xcc,	0x1
	fcmpgt32	%f2,	%f20,	%i7
loop_1144:
	and	%l1,	0x1A8A,	%l0
	taddcc	%o5,	%o0,	%o2
	array16	%o4,	%i5,	%l3
	movpos	%xcc,	%i4,	%i0
	xor	%l4,	0x09CD,	%g3
	bvc,pn	%icc,	loop_1145
	popc	%o1,	%i1
	fmovrdne	%g4,	%f4,	%f22
	udiv	%o6,	0x0C30,	%g7
loop_1145:
	fpsub16	%f26,	%f0,	%f6
	tsubcctv	%l2,	0x06DE,	%l5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x40] %asi,	%l6
	fmuld8sux16	%f21,	%f15,	%f20
	andn	%i3,	%o7,	%g5
	umulcc	%o3,	0x199E,	%g1
	movre	%i6,	0x1F3,	%g6
	tcs	%icc,	0x4
	subcc	%g2,	%i2,	%i7
	umulcc	%l0,	0x1793,	%l1
	fbe,a	%fcc0,	loop_1146
	and	%o5,	0x1A90,	%o0
	bneg,a	loop_1147
	ldd	[%l7 + 0x58],	%f2
loop_1146:
	alignaddrl	%o4,	%i5,	%l3
	fpadd32s	%f16,	%f13,	%f3
loop_1147:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%i4,	[%l7 + 0x1C] %asi
	membar	#Sync
	udivcc	%i0,	0x1B7E,	%o2
	fpack32	%f20,	%f24,	%f24
	swap	[%l7 + 0x40],	%g3
	alignaddr	%l4,	%o1,	%g4
	fnot2s	%f4,	%f9
	fmovsvs	%icc,	%f31,	%f29
	tg	%icc,	0x0
	fbule	%fcc3,	loop_1148
	add	%i1,	%o6,	%l2
	tcc	%xcc,	0x7
	bpos,a	loop_1149
loop_1148:
	fandnot1	%f24,	%f22,	%f18
	fcmped	%fcc3,	%f2,	%f24
	set	0x58, %o2
	lduwa	[%l7 + %o2] 0x14,	%g7
loop_1149:
	movleu	%icc,	%l6,	%l5
	edge8n	%o7,	%i3,	%g5
	fbne,a	%fcc2,	loop_1150
	tvc	%xcc,	0x3
	bleu,a,pt	%icc,	loop_1151
	array16	%g1,	%o3,	%i6
loop_1150:
	nop
	wr	%g0,	0x2f,	%asi
	stha	%g6,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_1151:
	nop
	set	0x24, %g7
	stw	%g2,	[%l7 + %g7]
	addcc	%i2,	%i7,	%l1
	ld	[%l7 + 0x18],	%f12
	fbg	%fcc1,	loop_1152
	nop
	setx loop_1153, %l0, %l1
	jmpl %l1, %l0
	orn	%o0,	0x07EE,	%o5
	edge16ln	%i5,	%o4,	%l3
loop_1152:
	sth	%i0,	[%l7 + 0x32]
loop_1153:
	fbl,a	%fcc2,	loop_1154
	tg	%icc,	0x6
	edge32	%o2,	%i4,	%l4
	movvc	%icc,	%g3,	%g4
loop_1154:
	umul	%i1,	0x11C5,	%o1
	array8	%l2,	%g7,	%o6
	movl	%icc,	%l5,	%l6
	srlx	%o7,	0x12,	%i3
	bg,pt	%icc,	loop_1155
	tcs	%icc,	0x6
	edge16l	%g5,	%o3,	%g1
	fpadd16	%f0,	%f0,	%f12
loop_1155:
	tl	%icc,	0x3
	andncc	%g6,	%g2,	%i2
	srl	%i7,	%l1,	%l0
	orn	%i6,	%o5,	%i5
	addccc	%o4,	0x0E69,	%l3
	movneg	%icc,	%i0,	%o0
	nop
	setx	loop_1156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%i4,	%o2,	%l4
	set	0x18, %i5
	stxa	%g3,	[%l7 + %i5] 0x2f
	membar	#Sync
loop_1156:
	udiv	%g4,	0x1AF2,	%o1
	bvc	%icc,	loop_1157
	tsubcc	%i1,	%g7,	%o6
	movrgez	%l2,	%l5,	%o7
	array8	%l6,	%g5,	%i3
loop_1157:
	edge32	%o3,	%g6,	%g2
	movn	%icc,	%g1,	%i7
	sdiv	%i2,	0x1DF8,	%l0
	fcmpgt16	%f14,	%f2,	%i6
	fbule,a	%fcc3,	loop_1158
	movrlez	%o5,	0x350,	%i5
	movrlez	%o4,	%l3,	%i0
	tn	%xcc,	0x0
loop_1158:
	fands	%f20,	%f25,	%f6
	popc	%l1,	%o0
	movrgz	%i4,	0x213,	%l4
	fmovrsgz	%o2,	%f14,	%f5
	array16	%g3,	%o1,	%i1
	fcmple32	%f8,	%f12,	%g7
	srax	%o6,	0x07,	%l2
	fmovdvs	%xcc,	%f23,	%f28
	fbe	%fcc3,	loop_1159
	movn	%xcc,	%l5,	%o7
	bn	loop_1160
	movvc	%icc,	%l6,	%g5
loop_1159:
	array16	%g4,	%i3,	%o3
	lduh	[%l7 + 0x52],	%g2
loop_1160:
	fmovdvc	%icc,	%f30,	%f21
	smulcc	%g1,	%g6,	%i7
	subcc	%l0,	0x1E00,	%i2
	std	%f24,	[%l7 + 0x30]
	movgu	%icc,	%i6,	%o5
	movn	%icc,	%i5,	%o4
	xnor	%l3,	%i0,	%l1
	set	0x70, %o6
	lduwa	[%l7 + %o6] 0x04,	%o0
	tvc	%xcc,	0x0
	andn	%l4,	%i4,	%o2
	bn,pn	%xcc,	loop_1161
	movre	%g3,	%o1,	%i1
	tle	%icc,	0x7
	tsubcc	%o6,	%g7,	%l2
loop_1161:
	bgu	%icc,	loop_1162
	alignaddrl	%o7,	%l5,	%g5
	udivcc	%g4,	0x0370,	%l6
	movleu	%xcc,	%i3,	%o3
loop_1162:
	subc	%g2,	0x1812,	%g6
	sethi	0x195C,	%i7
	membar	0x46
	addcc	%l0,	0x0D4A,	%g1
	bcc,a,pt	%icc,	loop_1163
	fmovrsgz	%i6,	%f10,	%f22
	ldsh	[%l7 + 0x56],	%o5
	fornot1	%f28,	%f10,	%f16
loop_1163:
	ld	[%l7 + 0x48],	%f31
	array8	%i2,	%i5,	%l3
	movre	%i0,	%o4,	%l1
	xnorcc	%o0,	%l4,	%o2
	addccc	%i4,	0x0997,	%g3
	andncc	%i1,	%o6,	%o1
	st	%f12,	[%l7 + 0x4C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l2,	0x0D3C,	%g7
	fbn,a	%fcc0,	loop_1164
	tg	%xcc,	0x2
	movpos	%xcc,	%l5,	%g5
	fcmped	%fcc3,	%f28,	%f2
loop_1164:
	nop
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32	%g4,	%o7,	%l6
	add	%o3,	0x12D7,	%g2
	ba,pn	%icc,	loop_1165
	movle	%xcc,	%i3,	%g6
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
loop_1165:
	edge32ln	%g1,	%l0,	%o5
	fmovsneg	%xcc,	%f16,	%f27
	edge8ln	%i6,	%i5,	%i2
	tneg	%icc,	0x4
	be,pn	%icc,	loop_1166
	movcs	%icc,	%i0,	%l3
	movleu	%icc,	%o4,	%o0
	fzeros	%f30
loop_1166:
	brz	%l4,	loop_1167
	bl,pn	%icc,	loop_1168
	edge8ln	%o2,	%l1,	%g3
	movcs	%icc,	%i4,	%i1
loop_1167:
	tgu	%xcc,	0x4
loop_1168:
	movleu	%xcc,	%o6,	%l2
	alignaddrl	%g7,	%o1,	%l5
	xor	%g5,	0x1FE3,	%o7
	move	%xcc,	%g4,	%o3
	bn,a	loop_1169
	fmuld8sux16	%f21,	%f17,	%f6
	movrne	%l6,	0x1FC,	%i3
	smul	%g2,	%i7,	%g6
loop_1169:
	fbug,a	%fcc3,	loop_1170
	edge8n	%l0,	%g1,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	loop_1171
loop_1170:
	fcmpd	%fcc3,	%f24,	%f22
	xnorcc	%i5,	%o5,	%i2
	srax	%l3,	%o4,	%o0
loop_1171:
	sll	%l4,	%i0,	%o2
	fnand	%f26,	%f30,	%f0
	fnors	%f18,	%f26,	%f0
	taddcctv	%g3,	0x0B4C,	%i4
	addc	%l1,	%o6,	%l2
	edge32	%i1,	%o1,	%g7
	movleu	%icc,	%l5,	%o7
	fmovrdlez	%g5,	%f12,	%f28
	xnorcc	%o3,	%g4,	%l6
	fornot2	%f0,	%f20,	%f10
	fpack32	%f2,	%f14,	%f30
	edge32l	%i3,	%g2,	%i7
	movvs	%icc,	%g6,	%g1
	sub	%i6,	0x1233,	%i5
	edge16n	%o5,	%l0,	%l3
	sdivcc	%o4,	0x004E,	%i2
	edge16n	%o0,	%l4,	%i0
	fnegd	%f16,	%f12
	edge32	%g3,	%o2,	%i4
	swap	[%l7 + 0x28],	%o6
	sdivx	%l1,	0x1308,	%l2
	fnot2	%f8,	%f20
	fsrc2s	%f8,	%f18
	fblg	%fcc3,	loop_1172
	movneg	%xcc,	%o1,	%g7
	movle	%icc,	%i1,	%l5
	tcs	%xcc,	0x1
loop_1172:
	alignaddrl	%g5,	%o3,	%g4
	wr	%g0,	0x27,	%asi
	stda	%i6,	[%l7 + 0x48] %asi
	membar	#Sync
	fmovdne	%icc,	%f18,	%f1
	fmovrde	%o7,	%f14,	%f28
	fnands	%f8,	%f14,	%f14
	fbug	%fcc0,	loop_1173
	udivcc	%i3,	0x1CC4,	%i7
	bcs,a	loop_1174
	brgz,a	%g6,	loop_1175
loop_1173:
	sethi	0x0FF7,	%g2
	subc	%g1,	0x0A66,	%i6
loop_1174:
	mulscc	%o5,	0x0305,	%l0
loop_1175:
	fmovdcc	%icc,	%f23,	%f3
	brlez,a	%l3,	loop_1176
	edge8ln	%o4,	%i2,	%i5
	add	%o0,	0x003B,	%l4
	bgu,a	loop_1177
loop_1176:
	movleu	%icc,	%g3,	%i0
	fcmpgt16	%f22,	%f28,	%i4
	ba,a	%icc,	loop_1178
loop_1177:
	movcs	%icc,	%o6,	%l1
	umul	%o2,	0x0F14,	%l2
	fmovrslz	%g7,	%f22,	%f11
loop_1178:
	nop
	set	0x29, %o5
	ldsba	[%l7 + %o5] 0x04,	%o1
	fnand	%f0,	%f30,	%f18
	ldub	[%l7 + 0x51],	%i1
	taddcc	%l5,	%g5,	%o3
	bvc	loop_1179
	xorcc	%l6,	%g4,	%i3
	edge32n	%i7,	%o7,	%g6
	fnand	%f16,	%f8,	%f18
loop_1179:
	xnorcc	%g2,	0x1EEC,	%i6
	fmovrse	%g1,	%f19,	%f25
	te	%icc,	0x3
	ble,a	%icc,	loop_1180
	xnor	%o5,	0x0A50,	%l0
	sdiv	%l3,	0x1CEA,	%o4
	orncc	%i2,	0x1CA0,	%o0
loop_1180:
	udivcc	%i5,	0x0286,	%g3
	fmovsg	%xcc,	%f4,	%f0
	tgu	%xcc,	0x4
	movrne	%l4,	0x2EA,	%i0
	popc	0x12DD,	%i4
	set	0x39, %i4
	stba	%o6,	[%l7 + %i4] 0x2a
	membar	#Sync
	edge16	%o2,	%l1,	%l2
	xnor	%g7,	%o1,	%i1
	fmovsle	%icc,	%f10,	%f24
	te	%xcc,	0x0
	movrlz	%g5,	%o3,	%l5
	and	%g4,	%i3,	%i7
	siam	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o7,	0x1EAC,	%g6
	taddcctv	%g2,	0x1F64,	%i6
	bpos,a,pn	%xcc,	loop_1181
	fcmps	%fcc0,	%f24,	%f24
	andcc	%g1,	%l6,	%o5
	ldd	[%l7 + 0x68],	%l0
loop_1181:
	taddcc	%l3,	0x045F,	%o4
	bshuffle	%f22,	%f8,	%f20
	fcmpne16	%f26,	%f26,	%i2
	tle	%xcc,	0x6
	bge	loop_1182
	fmovrdgz	%i5,	%f16,	%f24
	fmovrsne	%o0,	%f24,	%f15
	bleu,a	loop_1183
loop_1182:
	movcs	%xcc,	%l4,	%g3
	popc	%i4,	%i0
	tneg	%icc,	0x4
loop_1183:
	movl	%icc,	%o6,	%o2
	sra	%l1,	0x0E,	%g7
	nop
	set	0x40, %i7
	sth	%l2,	[%l7 + %i7]
	fmul8x16al	%f26,	%f16,	%f6
	ldsh	[%l7 + 0x28],	%i1
	fmul8x16au	%f12,	%f15,	%f6
	fnor	%f22,	%f4,	%f10
	fcmpeq16	%f26,	%f2,	%o1
	array32	%g5,	%l5,	%g4
	orcc	%o3,	0x0A5E,	%i3
	bneg,a,pn	%icc,	loop_1184
	fands	%f25,	%f2,	%f30
	set	0x64, %l1
	swapa	[%l7 + %l1] 0x80,	%i7
loop_1184:
	fpsub16	%f2,	%f4,	%f28
	set	0x3C, %g6
	stwa	%g6,	[%l7 + %g6] 0x88
	xnorcc	%o7,	0x0C23,	%g2
	tne	%icc,	0x0
	fbue,a	%fcc1,	loop_1185
	movrlez	%g1,	%l6,	%o5
	ldub	[%l7 + 0x66],	%i6
	fxnor	%f4,	%f4,	%f2
loop_1185:
	ba,pn	%icc,	loop_1186
	fones	%f6
	edge32l	%l3,	%o4,	%i2
	fsrc2	%f0,	%f30
loop_1186:
	fmovsa	%icc,	%f4,	%f13
	fpadd16	%f28,	%f4,	%f18
	move	%xcc,	%l0,	%i5
	tge	%icc,	0x7
	set	0x54, %o4
	sta	%f5,	[%l7 + %o4] 0x15
	edge16l	%o0,	%g3,	%i4
	popc	0x189A,	%l4
	brz,a	%i0,	loop_1187
	tvs	%icc,	0x4
	movne	%xcc,	%o6,	%o2
	fmovspos	%xcc,	%f10,	%f5
loop_1187:
	fcmpne16	%f8,	%f2,	%l1
	stx	%g7,	[%l7 + 0x18]
	taddcctv	%l2,	0x1513,	%i1
	bvc,pt	%icc,	loop_1188
	xor	%g5,	%l5,	%g4
	fmuld8ulx16	%f20,	%f29,	%f8
	fxnor	%f26,	%f0,	%f6
loop_1188:
	popc	%o3,	%i3
	fnegs	%f12,	%f19
	srl	%o1,	0x0A,	%g6
	fmovspos	%icc,	%f5,	%f21
	move	%icc,	%i7,	%g2
	fnand	%f0,	%f4,	%f14
	and	%g1,	0x12C5,	%o7
	umulcc	%o5,	0x0191,	%l6
	edge32ln	%i6,	%l3,	%o4
	movn	%xcc,	%i2,	%l0
	edge16	%o0,	%i5,	%g3
	ldd	[%l7 + 0x40],	%i4
	fbn,a	%fcc2,	loop_1189
	edge32	%i0,	%l4,	%o2
	fornot2s	%f25,	%f26,	%f15
	movre	%o6,	0x145,	%g7
loop_1189:
	edge8l	%l1,	%l2,	%i1
	edge32l	%l5,	%g4,	%o3
	edge32ln	%g5,	%i3,	%g6
	addc	%o1,	%g2,	%g1
	tcc	%icc,	0x0
	ldsw	[%l7 + 0x40],	%i7
	movre	%o5,	0x247,	%l6
	sethi	0x0AFB,	%o7
	edge8l	%l3,	%o4,	%i2
	mova	%icc,	%l0,	%i6
	movg	%xcc,	%o0,	%i5
	edge32	%i4,	%g3,	%i0
	srlx	%l4,	0x1E,	%o6
	sdiv	%g7,	0x10E1,	%o2
	stbar
	te	%xcc,	0x6
	bvc,pt	%icc,	loop_1190
	membar	0x5D
	tle	%xcc,	0x6
	movneg	%xcc,	%l2,	%i1
loop_1190:
	sdivcc	%l5,	0x1FCE,	%l1
	edge16l	%o3,	%g5,	%i3
	ble	loop_1191
	movvc	%icc,	%g6,	%g4
	smulcc	%o1,	0x1BCF,	%g2
	ldx	[%l7 + 0x40],	%i7
loop_1191:
	addcc	%g1,	0x18C5,	%o5
	fandnot2s	%f9,	%f3,	%f19
	xnorcc	%o7,	%l3,	%o4
	brgz	%l6,	loop_1192
	fcmpes	%fcc1,	%f4,	%f22
	tvs	%xcc,	0x1
	ldsb	[%l7 + 0x54],	%i2
loop_1192:
	edge16	%i6,	%l0,	%i5
	fsrc2	%f18,	%f18
	fbe,a	%fcc0,	loop_1193
	fbe	%fcc0,	loop_1194
	mulscc	%o0,	%g3,	%i4
	tvc	%icc,	0x0
loop_1193:
	nop
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x0c,	%i0
loop_1194:
	tleu	%xcc,	0x7
	fcmped	%fcc1,	%f18,	%f30
	edge8l	%l4,	%o6,	%o2
	movleu	%icc,	%g7,	%i1
	fmovscs	%icc,	%f27,	%f17
	tpos	%xcc,	0x4
	bn	%icc,	loop_1195
	fsrc2s	%f22,	%f24
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
loop_1195:
	movle	%xcc,	%l5,	%l1
	brgz	%g5,	loop_1196
	xnor	%o3,	%i3,	%g4
	movrgz	%g6,	0x008,	%o1
	edge32	%i7,	%g2,	%o5
loop_1196:
	edge16l	%o7,	%g1,	%o4
	ldstub	[%l7 + 0x6D],	%l3
	tvc	%xcc,	0x3
	fnot1	%f30,	%f26
	fmovsneg	%xcc,	%f0,	%f25
	flush	%l7 + 0x20
	movleu	%icc,	%i2,	%l6
	tvc	%xcc,	0x4
	swap	[%l7 + 0x08],	%l0
	sdivcc	%i6,	0x058C,	%i5
	tle	%icc,	0x3
	tne	%icc,	0x5
	movrgz	%g3,	%i4,	%i0
	bne,pn	%icc,	loop_1197
	sethi	0x0CB3,	%l4
	array8	%o0,	%o6,	%o2
	ldd	[%l7 + 0x30],	%g6
loop_1197:
	call	loop_1198
	tvc	%icc,	0x7
	subc	%l2,	0x0426,	%l5
	movrgz	%i1,	%g5,	%l1
loop_1198:
	edge8	%o3,	%i3,	%g6
	movpos	%xcc,	%g4,	%i7
	tcc	%icc,	0x4
	std	%g2,	[%l7 + 0x30]
	set	0x64, %i3
	stha	%o1,	[%l7 + %i3] 0x23
	membar	#Sync
	fcmpeq16	%f10,	%f30,	%o5
	popc	%g1,	%o4
	array8	%l3,	%i2,	%o7
	fmovrdlez	%l0,	%f4,	%f2
	fmuld8sux16	%f20,	%f29,	%f8
	fmovs	%f3,	%f15
	udiv	%i6,	0x1E8B,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f30,	%f7
	tneg	%xcc,	0x1
	set	0x20, %l0
	lda	[%l7 + %l0] 0x04,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l6,	%i4
	stbar
	xnorcc	%i0,	%l4,	%g3
	tge	%icc,	0x4
	movl	%xcc,	%o6,	%o0
	edge8l	%o2,	%g7,	%l5
	movcc	%icc,	%l2,	%i1
	udivx	%g5,	0x1F6E,	%o3
	movgu	%icc,	%l1,	%g6
	set	0x14, %g5
	stba	%g4,	[%l7 + %g5] 0x89
	mulx	%i3,	%g2,	%i7
	fpack32	%f6,	%f28,	%f0
	fornot1s	%f3,	%f22,	%f4
	edge32n	%o5,	%g1,	%o1
	movgu	%icc,	%l3,	%i2
	fcmpne32	%f26,	%f18,	%o7
	fmovd	%f26,	%f28
	wr	%g0,	0x27,	%asi
	stha	%o4,	[%l7 + 0x0C] %asi
	membar	#Sync
	fmovrde	%i6,	%f14,	%f28
	tge	%icc,	0x6
	tvc	%icc,	0x6
	movge	%xcc,	%l0,	%i5
	movn	%icc,	%l6,	%i4
	alignaddrl	%i0,	%g3,	%o6
	orncc	%o0,	0x0646,	%o2
	movleu	%xcc,	%g7,	%l5
	udivx	%l2,	0x1328,	%i1
	fcmpne32	%f12,	%f12,	%l4
	fands	%f19,	%f26,	%f31
	orncc	%g5,	0x1C95,	%o3
	andn	%l1,	0x10CE,	%g4
	tl	%icc,	0x1
	fnegd	%f24,	%f30
	fbl	%fcc0,	loop_1199
	fcmpgt32	%f22,	%f0,	%i3
	fcmpgt32	%f22,	%f2,	%g6
	movcs	%xcc,	%g2,	%o5
loop_1199:
	udivx	%g1,	0x064F,	%o1
	tgu	%xcc,	0x5
	bneg	loop_1200
	tleu	%icc,	0x1
	set	0x1C, %i0
	sta	%f4,	[%l7 + %i0] 0x0c
loop_1200:
	orcc	%i7,	%l3,	%o7
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x10
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x51] %asi,	%i2
	edge16ln	%i6,	%o4,	%l0
	te	%icc,	0x5
	movpos	%xcc,	%l6,	%i5
	udivcc	%i4,	0x120C,	%g3
	movpos	%xcc,	%i0,	%o0
	movge	%icc,	%o6,	%g7
	movleu	%xcc,	%o2,	%l5
	bl,a,pt	%xcc,	loop_1201
	fmovscc	%xcc,	%f24,	%f14
	fmuld8sux16	%f31,	%f5,	%f8
	smulcc	%i1,	%l2,	%l4
loop_1201:
	movcs	%icc,	%o3,	%g5
	fmuld8ulx16	%f7,	%f27,	%f10
	move	%xcc,	%g4,	%i3
	bpos,a	%xcc,	loop_1202
	nop
	setx loop_1203, %l0, %l1
	jmpl %l1, %g6
	tg	%xcc,	0x6
	orn	%l1,	%o5,	%g2
loop_1202:
	fands	%f22,	%f24,	%f1
loop_1203:
	edge32l	%g1,	%o1,	%l3
	fmovsl	%icc,	%f19,	%f31
	array32	%o7,	%i2,	%i6
	stb	%i7,	[%l7 + 0x78]
	edge8	%o4,	%l6,	%l0
	edge32n	%i4,	%i5,	%g3
	movn	%icc,	%o0,	%o6
	fands	%f21,	%f7,	%f30
	tg	%icc,	0x3
	movn	%xcc,	%g7,	%o2
	fmovdcc	%xcc,	%f23,	%f17
	tleu	%icc,	0x2
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x23,	%i0
	tneg	%xcc,	0x4
	or	%l5,	0x0BC0,	%l2
	fmovrsgz	%i1,	%f2,	%f3
	set	0x12, %i2
	stha	%o3,	[%l7 + %i2] 0x22
	membar	#Sync
	edge8	%g5,	%g4,	%l4
	fcmped	%fcc3,	%f12,	%f8
	mulx	%g6,	%i3,	%l1
	fsrc1	%f16,	%f0
	tpos	%xcc,	0x0
	tsubcctv	%g2,	0x08DF,	%g1
	subcc	%o1,	0x03EE,	%o5
	tl	%xcc,	0x4
	fxnors	%f23,	%f0,	%f4
	tvs	%icc,	0x7
	tneg	%xcc,	0x3
	nop
	set	0x60, %l2
	std	%f6,	[%l7 + %l2]
	fmovdneg	%icc,	%f9,	%f26
	tneg	%icc,	0x7
	addcc	%l3,	0x1DC2,	%o7
	tpos	%icc,	0x0
	set	0x58, %o7
	ldsha	[%l7 + %o7] 0x04,	%i6
	edge8ln	%i2,	%i7,	%l6
	tle	%icc,	0x2
	array32	%o4,	%i4,	%i5
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3e0] %asi,	%l0 ripped by fixASI40.pl ripped by fixASI40.pl
	fcmps	%fcc1,	%f22,	%f18
	sll	%o0,	0x09,	%o6
	fbe,a	%fcc1,	loop_1204
	tcc	%icc,	0x5
	fbn,a	%fcc3,	loop_1205
	xorcc	%g7,	0x1DF0,	%g3
loop_1204:
	nop
	set	0x28, %g4
	ldsha	[%l7 + %g4] 0x11,	%i0
loop_1205:
	nop
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x88,	%o2
	std	%f14,	[%l7 + 0x28]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f29,	%f29
	tcs	%xcc,	0x2
	tge	%xcc,	0x5
	move	%xcc,	%l2,	%l5
	edge8ln	%i1,	%o3,	%g4
	movvc	%icc,	%g5,	%l4
	bne	loop_1206
	edge32n	%g6,	%i3,	%l1
	movre	%g2,	0x219,	%o1
	orcc	%g1,	%l3,	%o5
loop_1206:
	sub	%o7,	%i2,	%i6
	tcc	%icc,	0x2
	ta	%xcc,	0x2
	set	0x65, %o3
	ldsba	[%l7 + %o3] 0x15,	%i7
	nop
	set	0x70, %l4
	stx	%l6,	[%l7 + %l4]
	tn	%xcc,	0x0
	std	%i4,	[%l7 + 0x18]
	mulscc	%i5,	%o4,	%o0
	bn,pt	%icc,	loop_1207
	movpos	%xcc,	%l0,	%o6
	fmovsn	%icc,	%f16,	%f9
	srl	%g7,	0x04,	%g3
loop_1207:
	tl	%xcc,	0x1
	brlez	%o2,	loop_1208
	fcmpne32	%f22,	%f16,	%l2
	bgu	%icc,	loop_1209
	tg	%xcc,	0x2
loop_1208:
	bl,a	loop_1210
	edge32n	%l5,	%i1,	%o3
loop_1209:
	nop
	set	0x7C, %g1
	sth	%g4,	[%l7 + %g1]
	alignaddr	%i0,	%l4,	%g6
loop_1210:
	movn	%xcc,	%g5,	%l1
	umul	%i3,	%g2,	%g1
	st	%f30,	[%l7 + 0x7C]
	bg,pt	%icc,	loop_1211
	movvc	%icc,	%l3,	%o5
	or	%o7,	0x14D6,	%o1
	movleu	%xcc,	%i6,	%i7
loop_1211:
	orn	%i2,	0x13D8,	%i4
	te	%xcc,	0x6
	set	0x44, %l3
	ldswa	[%l7 + %l3] 0x88,	%i5
	srl	%l6,	%o0,	%o4
	fble	%fcc1,	loop_1212
	edge32ln	%l0,	%g7,	%g3
	ldub	[%l7 + 0x21],	%o2
	movle	%icc,	%o6,	%l2
loop_1212:
	fbge,a	%fcc2,	loop_1213
	tneg	%xcc,	0x3
	call	loop_1214
	popc	0x16E6,	%i1
loop_1213:
	subc	%o3,	%g4,	%l5
	fnand	%f0,	%f8,	%f18
loop_1214:
	bge	loop_1215
	bg,pt	%icc,	loop_1216
	tl	%icc,	0x2
	fmovs	%f19,	%f18
loop_1215:
	orn	%i0,	0x049B,	%l4
loop_1216:
	edge32ln	%g6,	%g5,	%i3
	addccc	%l1,	%g2,	%l3
	andcc	%g1,	0x1A62,	%o5
	fpmerge	%f28,	%f0,	%f26
	bn,a,pt	%xcc,	loop_1217
	te	%icc,	0x4
	ldsb	[%l7 + 0x1F],	%o7
	fcmpgt32	%f18,	%f16,	%o1
loop_1217:
	movneg	%xcc,	%i7,	%i2
	bcs,pt	%xcc,	loop_1218
	bn,a	%icc,	loop_1219
	fmovsg	%icc,	%f1,	%f20
	tg	%icc,	0x7
loop_1218:
	be,pt	%icc,	loop_1220
loop_1219:
	taddcctv	%i4,	%i5,	%l6
	set	0x48, %g3
	stda	%o0,	[%l7 + %g3] 0xea
	membar	#Sync
loop_1220:
	ldsb	[%l7 + 0x25],	%i6
	fnors	%f3,	%f28,	%f15
	set	0x28, %i6
	lda	[%l7 + %i6] 0x04,	%f30
	udiv	%o4,	0x1DAD,	%g7
	fxor	%f24,	%f24,	%f26
	tle	%xcc,	0x5
	fmovdn	%icc,	%f14,	%f28
	movg	%xcc,	%g3,	%o2
	bg	loop_1221
	bne,a,pn	%icc,	loop_1222
	fbe	%fcc3,	loop_1223
	or	%l0,	0x10E8,	%l2
loop_1221:
	edge32ln	%i1,	%o6,	%g4
loop_1222:
	andncc	%o3,	%i0,	%l5
loop_1223:
	fmovrslz	%l4,	%f3,	%f11
	bleu	loop_1224
	fands	%f21,	%f9,	%f22
	fbg,a	%fcc3,	loop_1225
	fmovdcs	%icc,	%f11,	%f22
loop_1224:
	edge32n	%g6,	%i3,	%l1
	movge	%xcc,	%g2,	%g5
loop_1225:
	fbne,a	%fcc0,	loop_1226
	mulscc	%l3,	%g1,	%o5
	fnegd	%f10,	%f24
	brlez,a	%o1,	loop_1227
loop_1226:
	bgu,a,pt	%icc,	loop_1228
	tg	%xcc,	0x6
	andncc	%i7,	%o7,	%i2
loop_1227:
	edge8n	%i4,	%l6,	%i5
loop_1228:
	tgu	%icc,	0x7
	fornot2s	%f30,	%f21,	%f26
	bn	loop_1229
	sdivcc	%o0,	0x048F,	%o4
	fones	%f29
	smul	%g7,	0x194D,	%g3
loop_1229:
	edge32	%i6,	%l0,	%l2
	movcc	%icc,	%i1,	%o6
	or	%o2,	%o3,	%g4
	ldsb	[%l7 + 0x2F],	%l5
	fmovrde	%l4,	%f14,	%f30
	mova	%xcc,	%i0,	%g6
	mulscc	%l1,	%g2,	%g5
	movleu	%icc,	%i3,	%g1
	movle	%xcc,	%o5,	%l3
	fcmple16	%f14,	%f30,	%o1
	fmovdneg	%xcc,	%f8,	%f31
	sllx	%i7,	0x13,	%o7
	set	0x51, %l6
	ldstuba	[%l7 + %l6] 0x10,	%i2
	fmovda	%xcc,	%f24,	%f23
	tgu	%icc,	0x1
	be	%xcc,	loop_1230
	fmovrde	%l6,	%f6,	%f6
	fbe,a	%fcc3,	loop_1231
	ta	%xcc,	0x0
loop_1230:
	tgu	%xcc,	0x3
	fmul8x16	%f8,	%f14,	%f4
loop_1231:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f14,	[%l7 + 0x78] %asi
	bleu,a,pn	%icc,	loop_1232
	array32	%i5,	%o0,	%i4
	edge16	%o4,	%g7,	%i6
	fsrc2	%f20,	%f24
loop_1232:
	bne,a,pt	%icc,	loop_1233
	taddcc	%g3,	%l0,	%l2
	addc	%i1,	%o2,	%o3
	movg	%icc,	%g4,	%o6
loop_1233:
	bcs,pn	%xcc,	loop_1234
	fpack16	%f18,	%f29
	fmovsl	%icc,	%f1,	%f12
	prefetch	[%l7 + 0x2C],	 0x1
loop_1234:
	tsubcc	%l5,	0x04BB,	%l4
	orcc	%g6,	0x112A,	%l1
	set	0x0C, %g2
	lduwa	[%l7 + %g2] 0x10,	%g2
	tcs	%icc,	0x6
	lduw	[%l7 + 0x54],	%i0
	fblg	%fcc0,	loop_1235
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	stwa	%g5,	[%l7 + 0x30] %asi
loop_1235:
	brnz,a	%g1,	loop_1236
	movge	%xcc,	%o5,	%i3
	movl	%xcc,	%l3,	%o1
	udivx	%i7,	0x1AF3,	%i2
loop_1236:
	brlz	%o7,	loop_1237
	fbn,a	%fcc3,	loop_1238
	sllx	%l6,	0x11,	%i5
	fnands	%f11,	%f20,	%f4
loop_1237:
	tsubcc	%o0,	%o4,	%g7
loop_1238:
	nop
	wr	%g0,	0x04,	%asi
	stha	%i4,	[%l7 + 0x2A] %asi
	fbul	%fcc1,	loop_1239
	orncc	%g3,	%l0,	%l2
	movvs	%xcc,	%i1,	%i6
	orncc	%o2,	%o3,	%o6
loop_1239:
	xnorcc	%l5,	0x1A89,	%l4
	addccc	%g6,	%l1,	%g4
	set	0x4D, %o2
	ldstuba	[%l7 + %o2] 0x81,	%g2
	popc	0x096F,	%g5
	fxor	%f30,	%f4,	%f12
	movvc	%icc,	%i0,	%g1
	add	%i3,	0x05B6,	%o5
	sdivx	%o1,	0x04C2,	%i7
	set	0x10, %g7
	lduwa	[%l7 + %g7] 0x04,	%l3
	fcmpne16	%f16,	%f0,	%i2
	umul	%o7,	0x0040,	%l6
	sra	%o0,	%o4,	%g7
	ta	%xcc,	0x1
	fmovda	%icc,	%f1,	%f8
	tg	%xcc,	0x1
	fbl	%fcc3,	loop_1240
	movcs	%xcc,	%i5,	%i4
	addcc	%g3,	%l0,	%i1
	fsrc1s	%f14,	%f20
loop_1240:
	tcc	%icc,	0x1
	edge16	%i6,	%o2,	%o3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x22] %asi,	%o6
	brgez,a	%l2,	loop_1241
	edge16ln	%l5,	%l4,	%l1
	sll	%g4,	0x1E,	%g6
	fexpand	%f8,	%f2
loop_1241:
	tle	%xcc,	0x7
	movg	%icc,	%g5,	%g2
	movle	%icc,	%i0,	%g1
	fmovda	%icc,	%f3,	%f19
	fmovsvc	%xcc,	%f3,	%f5
	udivcc	%i3,	0x139D,	%o5
	fcmps	%fcc1,	%f0,	%f22
	fmovrdgez	%i7,	%f16,	%f26
	fnand	%f22,	%f4,	%f26
	sra	%l3,	0x02,	%i2
	tcs	%icc,	0x1
	bne,a	loop_1242
	tne	%xcc,	0x7
	sth	%o1,	[%l7 + 0x62]
	fmovrslz	%o7,	%f1,	%f15
loop_1242:
	fblg	%fcc1,	loop_1243
	andcc	%l6,	%o0,	%g7
	fmovrsne	%o4,	%f21,	%f10
	orn	%i5,	%i4,	%g3
loop_1243:
	movrgez	%l0,	0x17F,	%i6
	addccc	%i1,	0x0B17,	%o2
	brnz,a	%o3,	loop_1244
	nop
	setx	loop_1245,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba	loop_1246
	srl	%o6,	%l5,	%l4
loop_1244:
	fnegd	%f18,	%f28
loop_1245:
	and	%l1,	%l2,	%g6
loop_1246:
	taddcctv	%g5,	0x14AA,	%g4
	prefetch	[%l7 + 0x30],	 0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x81
	ldsh	[%l7 + 0x42],	%g2
	std	%f20,	[%l7 + 0x20]
	mova	%icc,	%i0,	%g1
	sir	0x1247
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrslz	%i3,	%f31,	%f10
	sub	%o5,	%l3,	%i2
	edge32n	%o1,	%i7,	%o7
	xnor	%o0,	%l6,	%o4
	xnor	%g7,	%i4,	%i5
	fbuge	%fcc0,	loop_1247
	edge16	%g3,	%l0,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x4f,	%asi
	stxa	%o2,	[%g0 + 0x8] %asi
loop_1247:
	ldub	[%l7 + 0x5D],	%i1
	fpadd16s	%f6,	%f6,	%f14
	membar	0x05
	subc	%o3,	0x1909,	%l5
	fmovsl	%icc,	%f30,	%f12
	tpos	%xcc,	0x7
	fbe	%fcc0,	loop_1248
	tcs	%icc,	0x3
	nop
	set	0x34, %o5
	prefetch	[%l7 + %o5],	 0x1
	wr	%g0,	0x89,	%asi
	stxa	%l4,	[%l7 + 0x10] %asi
loop_1248:
	edge16l	%o6,	%l1,	%l2
	set	0x4C, %i4
	stha	%g5,	[%l7 + %i4] 0x18
	sdiv	%g6,	0x08EF,	%g4
	fmovrdgz	%i0,	%f6,	%f18
	fbne,a	%fcc2,	loop_1249
	add	%g1,	0x06B5,	%g2
	bcs	loop_1250
	fbo	%fcc2,	loop_1251
loop_1249:
	movn	%xcc,	%i3,	%l3
	fmovda	%xcc,	%f28,	%f24
loop_1250:
	mulx	%i2,	%o1,	%o5
loop_1251:
	edge8	%i7,	%o7,	%o0
	sra	%l6,	%o4,	%g7
	sdiv	%i5,	0x12A5,	%i4
	movpos	%xcc,	%g3,	%l0
	movpos	%icc,	%i6,	%i1
	bn,a,pt	%xcc,	loop_1252
	fmovdcc	%icc,	%f25,	%f10
	bshuffle	%f6,	%f28,	%f20
	fcmped	%fcc0,	%f24,	%f0
loop_1252:
	ta	%xcc,	0x7
	tge	%icc,	0x6
	fornot2s	%f8,	%f23,	%f19
	mulscc	%o3,	%o2,	%l5
	ba,a,pn	%xcc,	loop_1253
	sdivx	%l4,	0x1675,	%o6
	edge32	%l2,	%l1,	%g6
	sir	0x181D
loop_1253:
	movre	%g5,	0x1F7,	%g4
	ble,a	%icc,	loop_1254
	addc	%i0,	%g2,	%g1
	fcmpgt16	%f8,	%f8,	%i3
	stbar
loop_1254:
	nop
	set	0x0A, %i5
	lduha	[%l7 + %i5] 0x19,	%l3
	xnorcc	%i2,	0x00D6,	%o5
	tpos	%xcc,	0x7
	fsrc1s	%f1,	%f7
	fmovrde	%i7,	%f20,	%f30
	sdivcc	%o7,	0x14A8,	%o1
	move	%icc,	%o0,	%o4
	wr	%g0,	0x2f,	%asi
	stda	%g6,	[%l7 + 0x60] %asi
	membar	#Sync
	bneg,a	%xcc,	loop_1255
	tvs	%icc,	0x1
	udiv	%l6,	0x0B8D,	%i4
	siam	0x6
loop_1255:
	fnot1s	%f17,	%f0
	fxnors	%f23,	%f21,	%f0
	movg	%xcc,	%g3,	%i5
	andn	%i6,	0x02BD,	%l0
	movre	%o3,	0x27F,	%o2
	movrgez	%l5,	0x3C4,	%l4
	movrlez	%o6,	0x070,	%i1
	alignaddr	%l1,	%l2,	%g6
	andncc	%g5,	%g4,	%g2
	std	%f30,	[%l7 + 0x38]
	edge8l	%g1,	%i3,	%l3
	movleu	%xcc,	%i2,	%i0
	tsubcctv	%o5,	0x04CE,	%i7
	tcs	%icc,	0x5
	movvs	%icc,	%o1,	%o0
	alignaddrl	%o7,	%o4,	%l6
	array16	%i4,	%g7,	%g3
	edge8n	%i5,	%l0,	%i6
	ta	%xcc,	0x7
	sdiv	%o2,	0x02D8,	%o3
	prefetch	[%l7 + 0x60],	 0x2
	te	%icc,	0x1
	wr	%g0,	0x27,	%asi
	stda	%l4,	[%l7 + 0x58] %asi
	membar	#Sync
	tcs	%xcc,	0x5
	move	%xcc,	%l4,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%o6,	%f22,	%f2
	array32	%l2,	%g6,	%l1
	addc	%g4,	0x0EA5,	%g5
	sra	%g1,	0x1F,	%i3
	movge	%xcc,	%l3,	%g2
	fbue	%fcc0,	loop_1256
	smul	%i0,	0x08A1,	%o5
	brlz	%i2,	loop_1257
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1256:
	movneg	%icc,	%i7,	%o1
	movleu	%xcc,	%o0,	%o7
loop_1257:
	ldd	[%l7 + 0x70],	%o4
	sll	%i4,	0x02,	%l6
	fnot1s	%f21,	%f29
	smul	%g3,	0x14B3,	%g7
	sll	%l0,	%i6,	%i5
	sethi	0x0FB4,	%o2
	movneg	%icc,	%o3,	%l5
	xnorcc	%l4,	%i1,	%l2
	movl	%xcc,	%o6,	%g6
	andcc	%l1,	0x04BB,	%g5
	stw	%g1,	[%l7 + 0x0C]
	mova	%xcc,	%g4,	%l3
	fmovrslez	%i3,	%f18,	%f5
	and	%g2,	0x0748,	%i0
	movcc	%xcc,	%i2,	%i7
	sdiv	%o1,	0x004F,	%o0
	movge	%xcc,	%o5,	%o7
	subcc	%i4,	0x1D07,	%l6
	taddcctv	%o4,	%g3,	%l0
	brz,a	%i6,	loop_1258
	brlz	%g7,	loop_1259
	tcc	%xcc,	0x7
	prefetch	[%l7 + 0x7C],	 0x0
loop_1258:
	fmovdg	%xcc,	%f10,	%f8
loop_1259:
	bleu,a	loop_1260
	nop
	set	0x43, %l1
	ldub	[%l7 + %l1],	%i5
	mulx	%o3,	%l5,	%l4
	nop
	set	0x30, %g6
	std	%i0,	[%l7 + %g6]
loop_1260:
	tn	%icc,	0x1
	fbe	%fcc3,	loop_1261
	movrlz	%l2,	0x238,	%o6
	movrlz	%g6,	0x0C1,	%l1
	edge8n	%g5,	%g1,	%g4
loop_1261:
	ldd	[%l7 + 0x38],	%l2
	srl	%o2,	0x0D,	%i3
	fcmpgt32	%f30,	%f30,	%i0
	udivcc	%g2,	0x07B8,	%i2
	array8	%i7,	%o1,	%o5
	fnegs	%f0,	%f21
	udivx	%o7,	0x1381,	%o0
	srlx	%i4,	0x1C,	%o4
	subc	%l6,	%g3,	%l0
	tneg	%xcc,	0x0
	srax	%g7,	%i6,	%i5
	brlez,a	%l5,	loop_1262
	move	%icc,	%l4,	%i1
	sll	%o3,	%l2,	%g6
	edge32l	%o6,	%l1,	%g1
loop_1262:
	move	%icc,	%g4,	%g5
	std	%f20,	[%l7 + 0x70]
	tgu	%icc,	0x6
	fxnors	%f16,	%f26,	%f11
	taddcctv	%l3,	0x0A27,	%o2
	movcs	%xcc,	%i0,	%i3
	movrgz	%g2,	%i2,	%o1
	set	0x22, %o4
	lduba	[%l7 + %o4] 0x11,	%o5
	bge,a,pt	%xcc,	loop_1263
	sth	%o7,	[%l7 + 0x1E]
	brlz,a	%o0,	loop_1264
	ldd	[%l7 + 0x20],	%f28
loop_1263:
	addccc	%i4,	0x1998,	%i7
	tsubcctv	%l6,	%o4,	%l0
loop_1264:
	sir	0x1D89
	tsubcctv	%g7,	0x115B,	%i6
	ldsw	[%l7 + 0x28],	%g3
	sra	%l5,	0x18,	%l4
	fnor	%f26,	%f28,	%f18
	tn	%xcc,	0x4
	fmovdneg	%xcc,	%f4,	%f25
	fbge,a	%fcc2,	loop_1265
	fbule,a	%fcc0,	loop_1266
	fmovsn	%icc,	%f6,	%f14
	sdivcc	%i1,	0x1ABA,	%i5
loop_1265:
	tl	%xcc,	0x7
loop_1266:
	fmovdne	%icc,	%f13,	%f28
	fmovsn	%xcc,	%f5,	%f5
	smul	%l2,	%g6,	%o6
	fcmpes	%fcc1,	%f0,	%f22
	wr	%g0,	0x11,	%asi
	stha	%o3,	[%l7 + 0x56] %asi
	sllx	%g1,	0x16,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%f14
	fbug	%fcc2,	loop_1267
	brgz	%g5,	loop_1268
	mulx	%l1,	%l3,	%o2
	xnor	%i0,	0x0703,	%g2
loop_1267:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1268:
	nop
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x88,	%i2
	subc	%o1,	%o5,	%o7
	udiv	%o0,	0x0A52,	%i4
	ldd	[%l7 + 0x08],	%i2
	xorcc	%l6,	0x1D6E,	%i7
	sub	%o4,	0x130B,	%l0
	fnot2	%f12,	%f24
	fmovsge	%xcc,	%f24,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i6,	0x1A1D,	%g7
	movre	%g3,	%l5,	%i1
	fnot1s	%f23,	%f16
	subc	%l4,	0x0E75,	%i5
	bcs,a	loop_1269
	fmovrdgez	%g6,	%f6,	%f18
	set	0x12, %l5
	ldsha	[%l7 + %l5] 0x14,	%o6
loop_1269:
	sdivcc	%o3,	0x1AA5,	%l2
	taddcc	%g1,	%g4,	%g5
	edge8ln	%l3,	%l1,	%o2
	movrgez	%g2,	%i2,	%i0
	movleu	%icc,	%o1,	%o7
	tge	%icc,	0x0
	udiv	%o5,	0x0B52,	%i4
	fmovsa	%icc,	%f20,	%f5
	fabss	%f20,	%f25
	movge	%icc,	%i3,	%l6
	move	%icc,	%i7,	%o4
	edge16	%o0,	%i6,	%l0
	sra	%g3,	0x0C,	%g7
	srlx	%l5,	%l4,	%i5
	srax	%i1,	0x00,	%o6
	sdivx	%g6,	0x0860,	%l2
	fpmerge	%f6,	%f17,	%f0
	movleu	%xcc,	%o3,	%g4
	fbule	%fcc2,	loop_1270
	andcc	%g5,	0x01B2,	%l3
	orcc	%l1,	0x0537,	%g1
	brlez,a	%o2,	loop_1271
loop_1270:
	sdivcc	%g2,	0x1EB5,	%i2
	fcmpes	%fcc2,	%f13,	%f25
	sub	%o1,	0x1B7E,	%o7
loop_1271:
	fblg,a	%fcc0,	loop_1272
	movge	%xcc,	%o5,	%i0
	xnorcc	%i4,	%l6,	%i7
	tvc	%icc,	0x1
loop_1272:
	ldsb	[%l7 + 0x7D],	%i3
	ldub	[%l7 + 0x1F],	%o0
	movn	%xcc,	%i6,	%o4
	sethi	0x0C76,	%l0
	fbg	%fcc1,	loop_1273
	fandnot1	%f18,	%f0,	%f18
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%g3
loop_1273:
	popc	0x1CA9,	%l5
	popc	%i5,	%i1
	tn	%icc,	0x7
	stb	%l4,	[%l7 + 0x64]
	bcs,a,pt	%xcc,	loop_1274
	taddcc	%g6,	0x159F,	%o6
	edge16l	%o3,	%l2,	%g5
	array8	%g4,	%l3,	%l1
loop_1274:
	fpadd32s	%f16,	%f17,	%f6
	edge8n	%g1,	%g2,	%o2
	movleu	%xcc,	%i2,	%o1
	movle	%icc,	%o5,	%i0
	array32	%o7,	%i4,	%i7
	srl	%l6,	0x11,	%i3
	fnor	%f10,	%f24,	%f22
	umul	%o0,	0x12BE,	%o4
	tne	%xcc,	0x0
	andcc	%l0,	0x0439,	%i6
	movrne	%g3,	%l5,	%i5
	fxnor	%f10,	%f16,	%f6
	nop
	set	0x7D, %l0
	ldstub	[%l7 + %l0],	%g7
	tpos	%icc,	0x1
	orn	%i1,	0x1E15,	%g6
	movcc	%xcc,	%o6,	%o3
	sethi	0x06DD,	%l2
	xor	%g5,	0x1048,	%l4
	movg	%xcc,	%g4,	%l1
	stbar
	sub	%l3,	0x163F,	%g1
	fmovspos	%icc,	%f31,	%f7
	fbuge	%fcc3,	loop_1275
	nop
	setx	loop_1276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%g2,	%o2,	%i2
	edge16l	%o5,	%i0,	%o1
loop_1275:
	bneg	loop_1277
loop_1276:
	alignaddr	%o7,	%i4,	%l6
	nop
	set	0x53, %g5
	ldstub	[%l7 + %g5],	%i7
	edge16n	%o0,	%o4,	%l0
loop_1277:
	fmovrslz	%i6,	%f20,	%f27
	movvc	%icc,	%i3,	%l5
	movvs	%icc,	%i5,	%g3
	movn	%icc,	%g7,	%i1
	edge16n	%g6,	%o3,	%o6
	tcs	%icc,	0x5
	udivx	%l2,	0x135A,	%g5
	xnor	%l4,	%l1,	%g4
	movl	%icc,	%l3,	%g1
	edge16l	%g2,	%o2,	%o5
	sra	%i0,	0x0E,	%o1
	sra	%i2,	%o7,	%i4
	edge8l	%l6,	%i7,	%o4
	subccc	%o0,	0x17B9,	%l0
	fblg	%fcc1,	loop_1278
	movrgz	%i3,	0x11A,	%l5
	movne	%xcc,	%i5,	%g3
	stx	%i6,	[%l7 + 0x48]
loop_1278:
	bg,a	%xcc,	loop_1279
	movrlez	%i1,	0x2AD,	%g7
	array8	%g6,	%o6,	%l2
	movre	%o3,	0x2A7,	%g5
loop_1279:
	fmovdcs	%xcc,	%f11,	%f1
	andncc	%l1,	%l4,	%g4
	bg,a	%xcc,	loop_1280
	edge32ln	%l3,	%g1,	%o2
	alignaddrl	%o5,	%g2,	%o1
	bge,pn	%xcc,	loop_1281
loop_1280:
	stw	%i2,	[%l7 + 0x50]
	tgu	%icc,	0x4
	sdivcc	%o7,	0x0E10,	%i0
loop_1281:
	tg	%xcc,	0x5
	fmovscc	%xcc,	%f30,	%f25
	and	%i4,	0x06BA,	%l6
	fmovrde	%o4,	%f16,	%f30
	andncc	%i7,	%o0,	%l0
	flush	%l7 + 0x24
	edge8n	%i3,	%l5,	%g3
	add	%i6,	%i1,	%i5
	std	%f10,	[%l7 + 0x10]
	tgu	%xcc,	0x3
	set	0x34, %i3
	lduba	[%l7 + %i3] 0x88,	%g6
	wr	%g0,	0x11,	%asi
	stha	%g7,	[%l7 + 0x52] %asi
	edge8l	%l2,	%o3,	%o6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x78] %asi,	%f18
	fcmpeq32	%f8,	%f8,	%l1
	add	%g5,	0x07AF,	%g4
	fbe	%fcc2,	loop_1282
	edge8ln	%l3,	%g1,	%l4
	movrne	%o5,	%g2,	%o1
	fpackfix	%f18,	%f27
loop_1282:
	fzeros	%f26
	umulcc	%i2,	0x19E9,	%o2
	membar	0x1C
	bgu,a	%icc,	loop_1283
	fblg,a	%fcc2,	loop_1284
	edge8l	%o7,	%i4,	%i0
	fbug	%fcc1,	loop_1285
loop_1283:
	sdivx	%o4,	0x1F14,	%l6
loop_1284:
	ldx	[%l7 + 0x30],	%o0
	bcs,a,pt	%xcc,	loop_1286
loop_1285:
	popc	%i7,	%i3
	movrgez	%l0,	%l5,	%g3
	edge32	%i6,	%i5,	%i1
loop_1286:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x58] %asi,	%g6
	movne	%xcc,	%g7,	%o3
	fabsd	%f4,	%f6
	bcs,a	%xcc,	loop_1287
	mulx	%o6,	0x0457,	%l2
	udiv	%g5,	0x0A5B,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1287:
	nop
	set	0x5C, %i0
	stba	%l3,	[%l7 + %i0] 0xe2
	membar	#Sync
	fbo,a	%fcc0,	loop_1288
	movgu	%xcc,	%g1,	%l1
	fmovrdgz	%o5,	%f2,	%f26
	bpos,pt	%xcc,	loop_1289
loop_1288:
	tgu	%icc,	0x5
	tpos	%icc,	0x4
	fandnot1s	%f17,	%f14,	%f16
loop_1289:
	addcc	%g2,	0x1790,	%o1
	alignaddr	%l4,	%i2,	%o2
	edge16l	%i4,	%o7,	%i0
	addc	%o4,	%o0,	%l6
	xor	%i3,	%i7,	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x19,	%l5,	%i6
	mulscc	%g3,	%i1,	%i5
	edge32l	%g7,	%o3,	%o6
	taddcc	%g6,	0x1417,	%l2
	std	%g4,	[%l7 + 0x58]
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%g5
	movleu	%xcc,	%g1,	%l1
	bpos,a,pt	%xcc,	loop_1290
	umul	%l3,	%o5,	%o1
	lduw	[%l7 + 0x20],	%g2
	movneg	%xcc,	%l4,	%o2
loop_1290:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i4,	%i2,	%i0
	fmovrdlez	%o4,	%f4,	%f16
	srax	%o7,	%o0,	%l6
	umulcc	%i7,	%l0,	%i3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i6
	movn	%xcc,	%g3,	%l5
	andn	%i5,	0x1BAB,	%i1
	set	0x18, %i1
	stha	%g7,	[%l7 + %i1] 0xeb
	membar	#Sync
	edge8	%o6,	%g6,	%l2
	xnor	%g4,	0x1E7B,	%o3
	edge32n	%g1,	%l1,	%l3
	wr	%g0,	0x2b,	%asi
	stha	%g5,	[%l7 + 0x3C] %asi
	membar	#Sync
	lduw	[%l7 + 0x54],	%o5
	bne,a,pn	%icc,	loop_1291
	tvc	%icc,	0x2
	sllx	%g2,	0x13,	%o1
	add	%l4,	0x1261,	%i4
loop_1291:
	tsubcc	%i2,	%o2,	%i0
	stb	%o7,	[%l7 + 0x6A]
	edge32l	%o4,	%l6,	%i7
	bn,a,pt	%xcc,	loop_1292
	edge8ln	%l0,	%i3,	%i6
	andncc	%g3,	%o0,	%i5
	fmovse	%icc,	%f6,	%f4
loop_1292:
	stx	%l5,	[%l7 + 0x78]
	lduw	[%l7 + 0x64],	%i1
	tcc	%xcc,	0x1
	andcc	%o6,	%g6,	%l2
	tvs	%icc,	0x3
	fmul8sux16	%f18,	%f2,	%f28
	te	%xcc,	0x4
	sdiv	%g7,	0x0E43,	%g4
	sdivcc	%g1,	0x0F9C,	%l1
	tg	%icc,	0x1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x19,	%f0
	tge	%icc,	0x3
	edge32n	%l3,	%o3,	%g5
	movvs	%icc,	%g2,	%o5
	fpadd32s	%f2,	%f4,	%f30
	fnors	%f2,	%f10,	%f6
	fbo	%fcc2,	loop_1293
	movneg	%xcc,	%l4,	%i4
	fmovrdgz	%i2,	%f24,	%f2
	mulscc	%o2,	%o1,	%i0
loop_1293:
	addcc	%o7,	0x14F6,	%l6
	addcc	%i7,	%l0,	%i3
	fmovdneg	%icc,	%f24,	%f12
	orcc	%o4,	%i6,	%o0
	fcmpgt32	%f30,	%f12,	%i5
	te	%icc,	0x4
	fcmple16	%f20,	%f0,	%l5
	andncc	%i1,	%o6,	%g3
	fmovdcc	%icc,	%f4,	%f12
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x60] %asi,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xea,	%asi
	stba	%g7,	[%l7 + 0x5B] %asi
	membar	#Sync
	fmovrslez	%g4,	%f31,	%f26
	sub	%l2,	%l1,	%l3
	ldsw	[%l7 + 0x68],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%g2
	fandnot2s	%f7,	%f9,	%f23
	ldsh	[%l7 + 0x0C],	%g5
	fmul8sux16	%f8,	%f18,	%f8
	taddcc	%l4,	0x0032,	%i4
	srl	%o5,	%o2,	%o1
	umulcc	%i2,	0x1F19,	%i0
	sllx	%o7,	0x0C,	%i7
	addccc	%l0,	0x1F21,	%l6
	array16	%i3,	%i6,	%o4
	lduw	[%l7 + 0x50],	%o0
	tvc	%icc,	0x2
	add	%i5,	0x1BA4,	%i1
	membar	0x40
	srlx	%l5,	0x17,	%g3
	or	%g6,	%o6,	%g4
	movn	%icc,	%g7,	%l2
	subcc	%l3,	0x19FC,	%l1
	set	0x08, %l2
	stxa	%g1,	[%l7 + %l2] 0x22
	membar	#Sync
	fbul	%fcc0,	loop_1294
	tneg	%xcc,	0x3
	be	loop_1295
	movn	%icc,	%o3,	%g2
loop_1294:
	fxor	%f22,	%f8,	%f12
	srl	%l4,	0x15,	%g5
loop_1295:
	ldstub	[%l7 + 0x18],	%o5
	tg	%icc,	0x3
	fxors	%f14,	%f19,	%f24
	xor	%o2,	0x1227,	%o1
	fors	%f30,	%f12,	%f17
	tneg	%icc,	0x6
	edge16ln	%i2,	%i4,	%o7
	fmovrde	%i0,	%f30,	%f12
	ldsw	[%l7 + 0x70],	%i7
	xnorcc	%l0,	0x0013,	%l6
	fandnot2	%f18,	%f14,	%f22
	movpos	%xcc,	%i3,	%o4
	movn	%xcc,	%i6,	%o0
	fbe	%fcc3,	loop_1296
	umul	%i1,	%i5,	%g3
	lduw	[%l7 + 0x64],	%g6
	orcc	%o6,	0x175E,	%g4
loop_1296:
	fblg,a	%fcc2,	loop_1297
	fbge	%fcc3,	loop_1298
	movvs	%xcc,	%l5,	%g7
	edge16n	%l2,	%l3,	%g1
loop_1297:
	movrlez	%l1,	%g2,	%o3
loop_1298:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x29] %asi,	%l4
	fpadd32	%f20,	%f10,	%f24
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g5
	fbn	%fcc2,	loop_1299
	fcmped	%fcc2,	%f24,	%f2
	xorcc	%o1,	0x1CC0,	%i2
	addc	%o2,	0x07BD,	%i4
loop_1299:
	brlz	%i0,	loop_1300
	call	loop_1301
	smulcc	%o7,	%l0,	%l6
	tgu	%icc,	0x5
loop_1300:
	fmovsg	%xcc,	%f18,	%f6
loop_1301:
	fbge,a	%fcc1,	loop_1302
	fpackfix	%f30,	%f8
	set	0x70, %o1
	lduba	[%l7 + %o1] 0x0c,	%i7
loop_1302:
	or	%o4,	0x0E82,	%i3
	movneg	%xcc,	%o0,	%i6
	array16	%i1,	%g3,	%i5
	fones	%f21
	tpos	%xcc,	0x4
	sdivx	%o6,	0x1B8E,	%g6
	fmovsle	%xcc,	%f0,	%f23
	fnand	%f2,	%f14,	%f0
	mulx	%l5,	%g7,	%l2
	tpos	%icc,	0x3
	movge	%xcc,	%g4,	%l3
	movgu	%xcc,	%l1,	%g2
	fbne	%fcc1,	loop_1303
	bvs	loop_1304
	fmovdvc	%icc,	%f17,	%f22
	smul	%o3,	%l4,	%g1
loop_1303:
	umulcc	%o5,	0x0D3F,	%g5
loop_1304:
	tl	%xcc,	0x7
	xnorcc	%o1,	%i2,	%i4
	smul	%o2,	%i0,	%o7
	andncc	%l0,	%l6,	%o4
	fmovsle	%icc,	%f30,	%f26
	fnor	%f24,	%f20,	%f8
	array16	%i3,	%o0,	%i7
	xnor	%i6,	0x0E20,	%g3
	movpos	%icc,	%i5,	%i1
	movcc	%icc,	%g6,	%l5
	andn	%g7,	%l2,	%o6
	edge32l	%l3,	%l1,	%g4
	fmovrdlez	%o3,	%f28,	%f12
	tvs	%icc,	0x6
	movrgz	%l4,	%g1,	%o5
	bneg,pn	%xcc,	loop_1305
	fpsub32	%f16,	%f6,	%f6
	tne	%xcc,	0x0
	alignaddrl	%g5,	%o1,	%i2
loop_1305:
	sdivx	%i4,	0x1EC9,	%o2
	movleu	%icc,	%g2,	%i0
	call	loop_1306
	tpos	%icc,	0x3
	brgz,a	%o7,	loop_1307
	fpack32	%f2,	%f30,	%f16
loop_1306:
	std	%i6,	[%l7 + 0x18]
	udivx	%o4,	0x1B2F,	%l0
loop_1307:
	movre	%o0,	0x383,	%i7
	ldsh	[%l7 + 0x12],	%i3
	movrgez	%g3,	%i5,	%i1
	sllx	%i6,	0x14,	%l5
	stbar
	array32	%g7,	%g6,	%o6
	te	%xcc,	0x3
	st	%f27,	[%l7 + 0x5C]
	movcs	%icc,	%l2,	%l1
	bcs,a,pt	%icc,	loop_1308
	movrlez	%g4,	0x0E7,	%o3
	tleu	%icc,	0x0
	edge16l	%l3,	%l4,	%g1
loop_1308:
	movn	%xcc,	%o5,	%g5
	edge32n	%o1,	%i2,	%o2
	sdiv	%g2,	0x1501,	%i4
	fmuld8ulx16	%f29,	%f1,	%f26
	fmovdle	%icc,	%f29,	%f19
	set	0x6C, %g4
	sta	%f0,	[%l7 + %g4] 0x81
	movrlez	%i0,	0x0FE,	%o7
	srl	%o4,	0x04,	%l6
	fandnot1	%f18,	%f20,	%f14
	edge8l	%o0,	%l0,	%i3
	bge	loop_1309
	fmovs	%f25,	%f18
	bne,a	loop_1310
	mulx	%i7,	%g3,	%i1
loop_1309:
	edge16	%i5,	%l5,	%i6
	taddcc	%g6,	0x008F,	%g7
loop_1310:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l2,	%o6,	%g4
	sir	0x0C46
	set	0x0C, %o7
	lduwa	[%l7 + %o7] 0x15,	%o3
	xnor	%l3,	0x12C1,	%l4
	bpos,pn	%icc,	loop_1311
	addc	%l1,	0x12C7,	%g1
	sllx	%o5,	%g5,	%o1
	ldub	[%l7 + 0x1D],	%o2
loop_1311:
	udivx	%i2,	0x1F9A,	%i4
	fxors	%f30,	%f8,	%f8
	tvs	%icc,	0x4
	tl	%icc,	0x1
	fba	%fcc3,	loop_1312
	tpos	%xcc,	0x5
	movrne	%g2,	%o7,	%i0
	mulscc	%l6,	0x1B9D,	%o0
loop_1312:
	fble,a	%fcc1,	loop_1313
	movleu	%xcc,	%o4,	%i3
	set	0x12, %o3
	stba	%i7,	[%l7 + %o3] 0x2b
	membar	#Sync
loop_1313:
	andncc	%g3,	%l0,	%i1
	call	loop_1314
	tne	%icc,	0x3
	fbge	%fcc0,	loop_1315
	fmovsl	%icc,	%f25,	%f22
loop_1314:
	movg	%icc,	%i5,	%i6
	bn,a	loop_1316
loop_1315:
	nop
	setx	loop_1317,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8sux16	%f8,	%f2,	%f0
	bg,a,pt	%icc,	loop_1318
loop_1316:
	fbo,a	%fcc0,	loop_1319
loop_1317:
	xorcc	%g6,	0x1BF7,	%g7
	faligndata	%f8,	%f22,	%f30
loop_1318:
	sdivx	%l2,	0x0DFA,	%o6
loop_1319:
	alignaddrl	%g4,	%o3,	%l3
	movleu	%icc,	%l4,	%l5
	brlez	%g1,	loop_1320
	fzero	%f20
	andcc	%o5,	%l1,	%g5
	movrne	%o2,	0x1DE,	%o1
loop_1320:
	nop
	wr	%g0,	0x2b,	%asi
	stwa	%i4,	[%l7 + 0x30] %asi
	membar	#Sync
	sethi	0x1FB6,	%i2
	orn	%o7,	%g2,	%i0
	ldd	[%l7 + 0x48],	%f0
	tsubcc	%l6,	0x0E63,	%o0
	udivx	%i3,	0x0B44,	%i7
	andcc	%g3,	%l0,	%o4
	movn	%icc,	%i1,	%i6
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x22,	%i4
	fsrc2s	%f4,	%f19
	fbug	%fcc2,	loop_1321
	prefetch	[%l7 + 0x10],	 0x3
	tne	%xcc,	0x0
	fmovrslz	%g7,	%f19,	%f3
loop_1321:
	sll	%g6,	%o6,	%l2
	tle	%xcc,	0x4
	bl	%icc,	loop_1322
	swap	[%l7 + 0x68],	%g4
	edge16	%o3,	%l4,	%l3
	te	%icc,	0x7
loop_1322:
	nop
	setx loop_1323, %l0, %l1
	jmpl %l1, %g1
	fnegd	%f24,	%f30
	tpos	%icc,	0x1
	fmovsa	%icc,	%f14,	%f23
loop_1323:
	tge	%icc,	0x1
	fmul8x16al	%f21,	%f19,	%f10
	tsubcctv	%l5,	%l1,	%g5
	bn,pn	%xcc,	loop_1324
	fpack32	%f8,	%f4,	%f8
	edge16l	%o2,	%o1,	%i4
	andcc	%o5,	%i2,	%o7
loop_1324:
	tle	%xcc,	0x0
	fnegd	%f14,	%f0
	fbo	%fcc0,	loop_1325
	sethi	0x14D8,	%i0
	tcs	%icc,	0x0
	bneg,pt	%icc,	loop_1326
loop_1325:
	movrne	%l6,	0x3EC,	%o0
	movvc	%icc,	%i3,	%i7
	fmuld8ulx16	%f26,	%f10,	%f8
loop_1326:
	fabss	%f1,	%f2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x27] %asi,	%g2
	array8	%l0,	%o4,	%g3
	movre	%i1,	%i6,	%i5
	umul	%g6,	0x021A,	%g7
	edge32l	%l2,	%g4,	%o6
	membar	0x06
	fmovrslz	%o3,	%f29,	%f5
	udivcc	%l4,	0x0E8B,	%l3
	addc	%l5,	0x0685,	%l1
	ldd	[%l7 + 0x30],	%f22
	sdiv	%g5,	0x1A8E,	%o2
	mulx	%o1,	0x0A40,	%i4
	move	%icc,	%g1,	%o5
	wr	%g0,	0xe2,	%asi
	stba	%o7,	[%l7 + 0x4A] %asi
	membar	#Sync
	movre	%i2,	%i0,	%o0
	fxor	%f16,	%f30,	%f24
	sir	0x0692
	fmovrsgz	%i3,	%f15,	%f17
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%g2
	tleu	%xcc,	0x7
	alignaddr	%l6,	%l0,	%g3
	nop
	set	0x38, %g1
	prefetch	[%l7 + %g1],	 0x0
	sdivx	%o4,	0x0725,	%i1
	tvs	%icc,	0x2
	flush	%l7 + 0x68
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%i6
	edge8	%i5,	%g6,	%l2
	umulcc	%g7,	%o6,	%o3
	movl	%icc,	%l4,	%g4
	be	%icc,	loop_1327
	edge8l	%l5,	%l1,	%g5
	fmovdn	%xcc,	%f3,	%f6
	fmovsne	%icc,	%f0,	%f11
loop_1327:
	fmul8ulx16	%f10,	%f22,	%f0
	bg,a,pn	%icc,	loop_1328
	bvs,a	%icc,	loop_1329
	fbuge	%fcc1,	loop_1330
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1328:
	sdivcc	%o2,	0x02AC,	%o1
loop_1329:
	tsubcctv	%i4,	0x1821,	%g1
loop_1330:
	movrgez	%l3,	0x388,	%o7
	sll	%o5,	%i2,	%i0
	edge16l	%i3,	%i7,	%g2
	movrne	%l6,	%l0,	%g3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o0,	%o4
	orncc	%i6,	%i5,	%i1
	and	%g6,	0x0275,	%g7
	tpos	%xcc,	0x0
	orncc	%l2,	0x08ED,	%o3
	fbge,a	%fcc2,	loop_1331
	movrgz	%o6,	%l4,	%l5
	edge8n	%g4,	%l1,	%o2
	nop
	setx	loop_1332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1331:
	sllx	%g5,	%i4,	%o1
	tvc	%icc,	0x5
	ldsh	[%l7 + 0x30],	%l3
loop_1332:
	fbo,a	%fcc1,	loop_1333
	sir	0x0D1C
	sethi	0x15B4,	%o7
	set	0x0C, %l3
	sta	%f18,	[%l7 + %l3] 0x89
loop_1333:
	stx	%o5,	[%l7 + 0x38]
	xor	%i2,	%g1,	%i3
	fmovrslz	%i7,	%f8,	%f12
	sll	%g2,	%l6,	%i0
	ta	%icc,	0x2
	fcmpeq32	%f18,	%f8,	%g3
	sdivcc	%l0,	0x0AA0,	%o4
	srl	%i6,	0x1F,	%o0
	fmovsge	%icc,	%f3,	%f23
	movleu	%xcc,	%i5,	%i1
	fbn	%fcc1,	loop_1334
	fnot2s	%f5,	%f28
	fbne	%fcc0,	loop_1335
	taddcc	%g7,	%g6,	%l2
loop_1334:
	fbuge	%fcc3,	loop_1336
	taddcctv	%o6,	%o3,	%l5
loop_1335:
	tpos	%icc,	0x7
	addccc	%g4,	%l1,	%o2
loop_1336:
	edge16l	%g5,	%l4,	%i4
	smul	%l3,	0x17BA,	%o7
	edge8	%o1,	%i2,	%g1
	movge	%xcc,	%o5,	%i7
	sdivx	%g2,	0x0D83,	%i3
	edge16	%i0,	%g3,	%l0
	te	%icc,	0x0
	movrlez	%l6,	0x314,	%o4
	tn	%icc,	0x1
	and	%i6,	0x1CF1,	%o0
	bvs,a	loop_1337
	stx	%i5,	[%l7 + 0x58]
	fmovsne	%xcc,	%f10,	%f31
	fmovdne	%xcc,	%f29,	%f26
loop_1337:
	edge32l	%g7,	%g6,	%l2
	set	0x58, %l4
	stba	%o6,	[%l7 + %l4] 0x23
	membar	#Sync
	movle	%icc,	%i1,	%l5
	andcc	%g4,	%o3,	%l1
	fpadd16	%f18,	%f2,	%f20
	fmovdleu	%xcc,	%f8,	%f16
	addccc	%o2,	%g5,	%l4
	fmovsgu	%icc,	%f21,	%f18
	edge32l	%l3,	%o7,	%o1
	set	0x18, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0x1
	bpos,a	%xcc,	loop_1338
	alignaddr	%g1,	%o5,	%i2
	be,a,pt	%xcc,	loop_1339
	bvs,pt	%icc,	loop_1340
loop_1338:
	array8	%g2,	%i7,	%i0
	te	%xcc,	0x3
loop_1339:
	fcmps	%fcc3,	%f31,	%f3
loop_1340:
	fone	%f20
	edge32n	%i3,	%g3,	%l0
	fabsd	%f6,	%f0
	stx	%o4,	[%l7 + 0x10]
	movl	%xcc,	%i6,	%o0
	fblg	%fcc1,	loop_1341
	bleu,pt	%xcc,	loop_1342
	umul	%i5,	0x1913,	%g7
	call	loop_1343
loop_1341:
	movrgez	%l6,	0x3EA,	%g6
loop_1342:
	xnorcc	%o6,	0x1985,	%i1
	tsubcctv	%l2,	0x119A,	%g4
loop_1343:
	movvc	%xcc,	%l5,	%o3
	fbue	%fcc3,	loop_1344
	smul	%l1,	0x11B4,	%g5
	movne	%icc,	%o2,	%l3
	tpos	%xcc,	0x3
loop_1344:
	srlx	%l4,	%o1,	%o7
	fmovdg	%icc,	%f23,	%f24
	subc	%i4,	0x04F3,	%o5
	tsubcc	%i2,	0x1F50,	%g1
	edge16l	%g2,	%i7,	%i0
	movl	%icc,	%i3,	%g3
	fble,a	%fcc1,	loop_1345
	smul	%l0,	0x080E,	%i6
	fzero	%f12
	udiv	%o4,	0x1A38,	%o0
loop_1345:
	for	%f14,	%f2,	%f24
	udivx	%i5,	0x0FBD,	%l6
	tsubcc	%g7,	0x1407,	%o6
	umul	%i1,	0x117B,	%g6
	fbule	%fcc0,	loop_1346
	add	%g4,	%l5,	%l2
	movg	%icc,	%o3,	%g5
	bvs,pt	%xcc,	loop_1347
loop_1346:
	edge32ln	%o2,	%l3,	%l4
	addccc	%l1,	0x164B,	%o1
	fnors	%f3,	%f0,	%f5
loop_1347:
	movcs	%icc,	%i4,	%o7
	and	%o5,	0x1796,	%g1
	brlz,a	%i2,	loop_1348
	lduw	[%l7 + 0x30],	%g2
	srlx	%i0,	%i7,	%g3
	wr	%g0,	0x80,	%asi
	stxa	%i3,	[%l7 + 0x58] %asi
loop_1348:
	popc	%l0,	%o4
	fcmpgt32	%f26,	%f0,	%i6
	brlz	%i5,	loop_1349
	lduh	[%l7 + 0x76],	%o0
	fcmpeq16	%f20,	%f26,	%l6
	xorcc	%g7,	0x0AEA,	%o6
loop_1349:
	fmovdneg	%xcc,	%f6,	%f17
	tl	%xcc,	0x0
	taddcctv	%i1,	0x1C90,	%g4
	movvs	%xcc,	%g6,	%l2
	tpos	%icc,	0x3
	fxnor	%f8,	%f2,	%f14
	bl	loop_1350
	tneg	%icc,	0x1
	nop
	setx	loop_1351,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%xcc,	%l5,	%g5
loop_1350:
	bn	loop_1352
	move	%icc,	%o2,	%o3
loop_1351:
	mulscc	%l3,	0x0D5E,	%l1
	fcmpgt16	%f26,	%f6,	%l4
loop_1352:
	fcmple16	%f20,	%f10,	%i4
	orcc	%o7,	0x185F,	%o1
	siam	0x2
	addc	%o5,	0x1EAE,	%g1
	nop
	set	0x12, %i6
	ldsh	[%l7 + %i6],	%i2
	alignaddr	%g2,	%i0,	%i7
	movneg	%icc,	%i3,	%g3
	move	%icc,	%l0,	%i6
	tsubcctv	%i5,	%o4,	%l6
	siam	0x0
	sra	%g7,	0x15,	%o6
	fsrc2	%f28,	%f12
	smulcc	%i1,	%o0,	%g6
	xnor	%g4,	%l5,	%l2
	set	0x08, %l6
	ldswa	[%l7 + %l6] 0x10,	%o2
	fmovda	%xcc,	%f21,	%f2
	fbuge,a	%fcc3,	loop_1353
	ba,pn	%xcc,	loop_1354
	subcc	%g5,	%o3,	%l1
	movrne	%l4,	%l3,	%i4
loop_1353:
	movl	%icc,	%o1,	%o5
loop_1354:
	fmovsgu	%xcc,	%f4,	%f11
	fornot1	%f18,	%f28,	%f14
	nop
	set	0x0C, %g2
	ldsw	[%l7 + %g2],	%o7
	srl	%g1,	0x17,	%i2
	movneg	%icc,	%g2,	%i0
	nop
	setx loop_1355, %l0, %l1
	jmpl %l1, %i7
	andn	%i3,	0x0366,	%l0
	udivcc	%g3,	0x0787,	%i5
	movvc	%icc,	%o4,	%i6
loop_1355:
	edge16l	%g7,	%l6,	%i1
	swap	[%l7 + 0x54],	%o0
	mova	%xcc,	%g6,	%g4
	fblg	%fcc3,	loop_1356
	alignaddrl	%l5,	%o6,	%l2
	call	loop_1357
	orncc	%g5,	%o3,	%l1
loop_1356:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l4,	%o2,	%l3
loop_1357:
	nop
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x23,	%o0
	sll	%o5,	0x0C,	%o7
	smul	%i4,	0x1AAB,	%i2
	fmovsn	%icc,	%f30,	%f9
	subccc	%g2,	0x011E,	%i0
	alignaddrl	%i7,	%g1,	%i3
	stw	%g3,	[%l7 + 0x2C]
	ta	%xcc,	0x7
	bn	loop_1358
	addc	%i5,	0x1F92,	%l0
	set	0x20, %g7
	stwa	%o4,	[%l7 + %g7] 0x80
loop_1358:
	umulcc	%i6,	0x143C,	%g7
	fmovdne	%xcc,	%f29,	%f17
	bneg	loop_1359
	fmovdle	%icc,	%f26,	%f1
	movrlz	%i1,	%l6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1359:
	movrgez	%g6,	%l5,	%o6
	movneg	%xcc,	%g4,	%g5
	srl	%l2,	%l1,	%l4
	fornot2	%f6,	%f22,	%f6
	fmuld8sux16	%f0,	%f11,	%f2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x46] %asi,	%o3
	set	0x78, %o5
	stda	%o2,	[%l7 + %o5] 0x22
	membar	#Sync
	std	%f24,	[%l7 + 0x38]
	membar	0x46
	movrlez	%l3,	0x129,	%o1
	tpos	%xcc,	0x3
	nop
	setx	loop_1360,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%xcc,	%o7,	%o5
	sethi	0x013D,	%i2
	movrgez	%i4,	%g2,	%i0
loop_1360:
	ta	%xcc,	0x5
	fmul8x16au	%f28,	%f5,	%f20
	fbe,a	%fcc0,	loop_1361
	orncc	%i7,	0x03AE,	%g1
	edge8l	%i3,	%g3,	%i5
	taddcc	%o4,	%l0,	%i6
loop_1361:
	fbe,a	%fcc3,	loop_1362
	movrgez	%i1,	0x011,	%l6
	srlx	%g7,	%o0,	%l5
	edge8ln	%g6,	%o6,	%g4
loop_1362:
	mulx	%l2,	0x0B34,	%l1
	array32	%l4,	%o3,	%g5
	fxors	%f15,	%f14,	%f1
	be,a,pn	%xcc,	loop_1363
	tleu	%xcc,	0x6
	addc	%o2,	0x1253,	%o1
	faligndata	%f6,	%f0,	%f6
loop_1363:
	sdivcc	%l3,	0x0B7E,	%o5
	bpos,a,pn	%xcc,	loop_1364
	ba,a,pt	%icc,	loop_1365
	popc	%o7,	%i4
	movneg	%icc,	%g2,	%i0
loop_1364:
	fzero	%f20
loop_1365:
	array32	%i7,	%i2,	%g1
	ble,a,pt	%xcc,	loop_1366
	fmul8x16	%f12,	%f24,	%f16
	movcs	%xcc,	%g3,	%i3
	wr	%g0,	0x2b,	%asi
	stda	%o4,	[%l7 + 0x18] %asi
	membar	#Sync
loop_1366:
	brz,a	%i5,	loop_1367
	sdiv	%l0,	0x135E,	%i6
	udivcc	%l6,	0x07A3,	%i1
	xorcc	%o0,	0x0EA6,	%l5
loop_1367:
	movcs	%icc,	%g6,	%o6
	edge32	%g4,	%l2,	%l1
	movgu	%icc,	%g7,	%l4
	movleu	%xcc,	%g5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o1,	0x0F,	%l3
	tge	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o2,	%o5,	%i4
	std	%g2,	[%l7 + 0x40]
	call	loop_1368
	ble	%icc,	loop_1369
	tsubcctv	%i0,	0x0153,	%i7
	tl	%xcc,	0x3
loop_1368:
	edge16ln	%o7,	%g1,	%i2
loop_1369:
	movrgz	%i3,	%g3,	%i5
	movrgz	%l0,	%o4,	%i6
	add	%i1,	0x09E1,	%l6
	tpos	%xcc,	0x1
	movcc	%icc,	%o0,	%l5
	fnegs	%f4,	%f0
	or	%o6,	0x0AB6,	%g4
	sethi	0x032C,	%g6
	edge8	%l2,	%l1,	%g7
	movcs	%xcc,	%l4,	%o3
	tcs	%xcc,	0x2
	set	0x16, %i4
	stba	%g5,	[%l7 + %i4] 0x14
	udivcc	%o1,	0x1D3C,	%l3
	fands	%f23,	%f10,	%f24
	fsrc2s	%f6,	%f26
	tne	%xcc,	0x0
	movne	%xcc,	%o2,	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g2,	%i0
	sdiv	%o5,	0x1270,	%i7
	sdivx	%g1,	0x1806,	%i2
	sll	%i3,	0x07,	%g3
	fmuld8ulx16	%f16,	%f7,	%f0
	fcmpgt16	%f22,	%f12,	%o7
	ldx	[%l7 + 0x40],	%i5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%i6
	alignaddr	%i1,	%l6,	%o4
	movrgz	%o0,	0x36E,	%o6
	tcs	%xcc,	0x2
	movvc	%xcc,	%l5,	%g6
	fbuge	%fcc1,	loop_1370
	sra	%l2,	0x1C,	%l1
	fandnot1s	%f23,	%f23,	%f12
	fblg,a	%fcc3,	loop_1371
loop_1370:
	alignaddrl	%g4,	%g7,	%o3
	addccc	%l4,	0x12B3,	%o1
	fmovsa	%xcc,	%f30,	%f15
loop_1371:
	ldsh	[%l7 + 0x58],	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o2,	%l3,	%i4
	tne	%xcc,	0x6
	fmovd	%f26,	%f30
	movcc	%xcc,	%i0,	%g2
	add	%o5,	%i7,	%g1
	fxors	%f21,	%f18,	%f25
	set	0x6B, %o6
	lduba	[%l7 + %o6] 0x14,	%i3
	sth	%i2,	[%l7 + 0x76]
	tl	%icc,	0x7
	fbu	%fcc1,	loop_1372
	alignaddrl	%g3,	%i5,	%l0
	tge	%icc,	0x0
	fmovrsne	%o7,	%f24,	%f23
loop_1372:
	array32	%i1,	%i6,	%o4
	add	%l6,	%o0,	%l5
	fpsub16	%f6,	%f6,	%f24
	umul	%o6,	0x0DE4,	%l2
	movle	%icc,	%l1,	%g6
	and	%g4,	%o3,	%g7
	taddcc	%l4,	%o1,	%o2
	movrgz	%g5,	0x03D,	%i4
	taddcctv	%l3,	0x0E41,	%g2
	edge8	%i0,	%o5,	%i7
	movn	%xcc,	%i3,	%i2
	fba	%fcc3,	loop_1373
	ba,pn	%xcc,	loop_1374
	fbu	%fcc2,	loop_1375
	addccc	%g1,	%i5,	%g3
loop_1373:
	mova	%icc,	%o7,	%i1
loop_1374:
	edge32n	%i6,	%o4,	%l0
loop_1375:
	movvc	%xcc,	%o0,	%l6
	tg	%icc,	0x1
	fcmpeq16	%f4,	%f18,	%l5
	fmovs	%f9,	%f21
	tl	%icc,	0x6
	edge8l	%o6,	%l2,	%g6
	addc	%l1,	0x10C6,	%g4
	flush	%l7 + 0x38
	tvc	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g7,	%o3
	movg	%icc,	%l4,	%o2
	tsubcc	%g5,	%i4,	%l3
	fsrc1	%f0,	%f22
	fmovdne	%xcc,	%f5,	%f21
	smul	%o1,	%g2,	%i0
	array32	%i7,	%i3,	%i2
	and	%o5,	0x1860,	%g1
	stx	%g3,	[%l7 + 0x20]
	fble,a	%fcc2,	loop_1376
	edge32ln	%o7,	%i1,	%i5
	movge	%xcc,	%i6,	%l0
	fpsub32	%f22,	%f28,	%f30
loop_1376:
	fcmpd	%fcc3,	%f24,	%f28
	tneg	%xcc,	0x3
	xorcc	%o0,	%o4,	%l6
	ld	[%l7 + 0x34],	%f14
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	fmovdne	%icc,	%f25,	%f12
	movgu	%xcc,	%o6,	%g6
	fandnot1	%f18,	%f20,	%f12
	xnor	%l1,	0x034D,	%g4
	tle	%xcc,	0x2
	tn	%xcc,	0x3
	srax	%g7,	0x0D,	%o3
	fmovrde	%l2,	%f4,	%f4
	edge8l	%l4,	%o2,	%g5
	fsrc1	%f12,	%f2
	edge8ln	%l3,	%i4,	%o1
	movrlz	%g2,	0x0E2,	%i7
	bn,pt	%xcc,	loop_1377
	tl	%xcc,	0x0
	tle	%icc,	0x7
	bne,pt	%icc,	loop_1378
loop_1377:
	fmovscc	%icc,	%f15,	%f6
	bleu,a	%icc,	loop_1379
	movre	%i0,	0x2D7,	%i2
loop_1378:
	edge8	%i3,	%g1,	%o5
	set	0x38, %l1
	lda	[%l7 + %l1] 0x89,	%f3
loop_1379:
	edge16ln	%o7,	%i1,	%i5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ta	%icc,	0x4
	udivcc	%i6,	0x1007,	%l0
	fmovsn	%xcc,	%f5,	%f28
	movcc	%icc,	%o0,	%o4
	fandnot1s	%f28,	%f20,	%f25
	tpos	%icc,	0x7
	te	%xcc,	0x5
	fones	%f4
	fors	%f3,	%f3,	%f12
	andncc	%g3,	%l6,	%o6
	bgu	loop_1380
	edge16	%l5,	%g6,	%l1
	fmovdvc	%icc,	%f6,	%f14
	prefetch	[%l7 + 0x5C],	 0x2
loop_1380:
	add	%g4,	%g7,	%l2
	tle	%icc,	0x1
	sdivx	%o3,	0x12AF,	%l4
	sdivcc	%g5,	0x1A1D,	%o2
	or	%i4,	%l3,	%g2
	sdiv	%i7,	0x154A,	%i0
	tsubcc	%i2,	0x01EB,	%o1
	sir	0x1828
	fnand	%f8,	%f24,	%f20
	fmovsge	%icc,	%f14,	%f11
	fors	%f16,	%f25,	%f11
	array32	%g1,	%o5,	%i3
	sdiv	%i1,	0x1EB7,	%i5
	swap	[%l7 + 0x78],	%i6
	movg	%xcc,	%l0,	%o7
	alignaddr	%o0,	%o4,	%g3
	sir	0x075A
	subccc	%o6,	0x1BD7,	%l5
	brnz,a	%g6,	loop_1381
	te	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x64, %g6
	lduha	[%l7 + %g6] 0x10,	%l6
loop_1381:
	lduw	[%l7 + 0x24],	%l1
	andcc	%g4,	%l2,	%g7
	fbge	%fcc0,	loop_1382
	tl	%xcc,	0x3
	alignaddr	%l4,	%o3,	%g5
	fmovrdlz	%i4,	%f8,	%f2
loop_1382:
	edge16n	%o2,	%l3,	%i7
	membar	0x48
	movvc	%xcc,	%g2,	%i2
	edge16ln	%o1,	%i0,	%o5
	taddcc	%i3,	%g1,	%i1
	fsrc2s	%f13,	%f23
	st	%f14,	[%l7 + 0x3C]
	wr	%g0,	0x18,	%asi
	stda	%i6,	[%l7 + 0x70] %asi
	movrlz	%i5,	0x126,	%o7
	edge16l	%l0,	%o0,	%g3
	bcc,a	%icc,	loop_1383
	nop
	setx	loop_1384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrslz	%o4,	%f31,	%f29
	addcc	%l5,	%g6,	%o6
loop_1383:
	movge	%icc,	%l6,	%g4
loop_1384:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	andcc	%l2,	%g7,	%l4
	movleu	%icc,	%l1,	%g5
	tl	%icc,	0x5
	tl	%icc,	0x1
	fcmple32	%f22,	%f12,	%o3
	st	%f21,	[%l7 + 0x6C]
	edge32n	%i4,	%o2,	%i7
	mulx	%g2,	0x145A,	%i2
	edge8ln	%l3,	%o1,	%i0
	set	0x7C, %o4
	lda	[%l7 + %o4] 0x18,	%f11
	fpsub32s	%f9,	%f24,	%f16
	tcs	%icc,	0x6
	movleu	%icc,	%o5,	%i3
	movre	%i1,	%i6,	%i5
	bshuffle	%f4,	%f8,	%f18
	orcc	%o7,	0x1558,	%g1
	move	%icc,	%l0,	%o0
	tge	%icc,	0x5
	fcmpeq32	%f8,	%f2,	%o4
	te	%icc,	0x0
	mova	%xcc,	%g3,	%g6
	tsubcctv	%o6,	%l5,	%g4
	movcs	%xcc,	%l6,	%l2
	movrgez	%l4,	%l1,	%g7
	membar	0x0E
	edge8ln	%g5,	%i4,	%o3
	set	0x50, %i7
	lduwa	[%l7 + %i7] 0x11,	%o2
	mulscc	%i7,	0x1289,	%g2
	movvs	%xcc,	%i2,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f16,	%f10,	%f19
	brgez,a	%o1,	loop_1385
	bl	loop_1386
	array8	%i0,	%o5,	%i1
	fexpand	%f0,	%f6
loop_1385:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%i3,	[%l7 + 0x0A] %asi
	membar	#Sync
loop_1386:
	fmovsgu	%icc,	%f21,	%f20
	movrlz	%i6,	%i5,	%o7
	fbo,a	%fcc0,	loop_1387
	mova	%icc,	%g1,	%o0
	fcmple32	%f18,	%f30,	%o4
	fsrc2s	%f1,	%f24
loop_1387:
	movle	%icc,	%l0,	%g3
	fand	%f0,	%f8,	%f4
	tge	%xcc,	0x4
	xorcc	%o6,	0x1D10,	%l5
	tleu	%xcc,	0x0
	taddcc	%g4,	%g6,	%l2
	movrlz	%l6,	%l1,	%g7
	subcc	%g5,	%i4,	%o3
	tsubcctv	%l4,	%o2,	%i7
	sllx	%g2,	%i2,	%o1
	fmovsne	%xcc,	%f12,	%f29
	fcmpd	%fcc3,	%f30,	%f10
	set	0x75, %i5
	ldstuba	[%l7 + %i5] 0x11,	%l3
	fmovrsgz	%i0,	%f23,	%f15
	sdiv	%i1,	0x1804,	%o5
	ldstub	[%l7 + 0x39],	%i6
	sdiv	%i3,	0x03F7,	%i5
	xnorcc	%g1,	0x1405,	%o0
	brz	%o7,	loop_1388
	movrlez	%l0,	0x20F,	%o4
	nop
	setx loop_1389, %l0, %l1
	jmpl %l1, %o6
	membar	0x0C
loop_1388:
	movre	%l5,	%g4,	%g6
	array32	%l2,	%g3,	%l6
loop_1389:
	edge16l	%l1,	%g5,	%g7
	fsrc2s	%f4,	%f18
	fpadd32s	%f11,	%f26,	%f30
	brnz,a	%o3,	loop_1390
	fbuge	%fcc2,	loop_1391
	andn	%i4,	%l4,	%o2
	fcmpne16	%f18,	%f14,	%i7
loop_1390:
	orn	%i2,	0x1682,	%o1
loop_1391:
	tn	%icc,	0x1
	movrlz	%g2,	0x341,	%l3
	tge	%xcc,	0x0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i0,	%i1
	set	0x40, %l0
	ldsha	[%l7 + %l0] 0x18,	%o5
	xor	%i6,	0x1324,	%i5
	call	loop_1392
	edge32ln	%g1,	%i3,	%o7
	fcmpgt16	%f4,	%f16,	%o0
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x81
loop_1392:
	be	%icc,	loop_1393
	tleu	%xcc,	0x4
	srax	%o4,	%o6,	%l0
	orncc	%g4,	%g6,	%l5
loop_1393:
	ta	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x70],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l2,	%l6,	%g3
	tne	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udiv	%g5,	0x185A,	%g7
	fpmerge	%f16,	%f31,	%f14
	movge	%xcc,	%l1,	%o3
	movle	%xcc,	%i4,	%o2
	move	%xcc,	%i7,	%i2
	array16	%o1,	%l4,	%l3
	tg	%xcc,	0x4
	bleu	%xcc,	loop_1394
	smulcc	%i0,	%i1,	%o5
	edge32	%i6,	%g2,	%g1
	udiv	%i3,	0x127D,	%o7
loop_1394:
	movcs	%icc,	%i5,	%o0
	alignaddr	%o4,	%l0,	%o6
	fcmpes	%fcc3,	%f7,	%f20
	fmovda	%xcc,	%f25,	%f17
	movn	%xcc,	%g4,	%g6
	orcc	%l5,	0x199D,	%l2
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	prefetch	[%l7 + 0x20],	 0x3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%g5,	loop_1395
	sir	0x0A00
	subcc	%l1,	0x0D85,	%o3
	brlz	%g7,	loop_1396
loop_1395:
	xnor	%i4,	0x0679,	%i7
	movcc	%xcc,	%i2,	%o2
	fbe,a	%fcc3,	loop_1397
loop_1396:
	tvs	%icc,	0x0
	array16	%o1,	%l3,	%i0
	or	%i1,	%l4,	%o5
loop_1397:
	orcc	%g2,	0x06C1,	%i6
	subc	%g1,	%o7,	%i5
	xor	%o0,	%i3,	%l0
	wr	%g0,	0x89,	%asi
	stda	%o4,	[%l7 + 0x30] %asi
	addccc	%g4,	0x0FF7,	%o6
	movneg	%xcc,	%g6,	%l2
	nop
	setx	loop_1398,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1	%f16,	%f14,	%f6
	be,a,pt	%xcc,	loop_1399
	xnor	%g3,	0x1F61,	%l5
loop_1398:
	te	%icc,	0x0
	udiv	%g5,	0x0A8D,	%l1
loop_1399:
	fabss	%f14,	%f26
	set	0x18, %g5
	lduwa	[%l7 + %g5] 0x11,	%o3
	edge32ln	%l6,	%g7,	%i7
	edge16	%i4,	%o2,	%o1
	movpos	%xcc,	%i2,	%i0
	movneg	%xcc,	%i1,	%l4
	udivcc	%l3,	0x1B66,	%g2
	fble,a	%fcc1,	loop_1400
	andncc	%o5,	%g1,	%o7
	fmovdcc	%icc,	%f31,	%f10
	xorcc	%i5,	0x023E,	%o0
loop_1400:
	subcc	%i3,	%l0,	%i6
	taddcctv	%g4,	%o4,	%o6
	addc	%l2,	%g6,	%g3
	fnands	%f12,	%f10,	%f16
	addccc	%g5,	0x1F4D,	%l1
	fpsub16	%f26,	%f4,	%f2
	mova	%xcc,	%o3,	%l5
	array16	%g7,	%l6,	%i7
	addccc	%i4,	0x0D85,	%o1
	fbuge	%fcc0,	loop_1401
	bgu,pt	%icc,	loop_1402
	movge	%xcc,	%o2,	%i0
	fmul8x16al	%f19,	%f11,	%f24
loop_1401:
	orcc	%i1,	0x1990,	%l4
loop_1402:
	fpmerge	%f13,	%f18,	%f14
	set	0x14, %i0
	lduha	[%l7 + %i0] 0x18,	%i2
	nop
	setx loop_1403, %l0, %l1
	jmpl %l1, %l3
	udivx	%o5,	0x1192,	%g2
	tgu	%icc,	0x6
	movrgz	%o7,	0x3E3,	%g1
loop_1403:
	sub	%o0,	%i3,	%i5
	fcmpeq32	%f28,	%f24,	%l0
	movge	%icc,	%i6,	%g4
	wr	%g0,	0x18,	%asi
	stba	%o4,	[%l7 + 0x30] %asi
	set	0x68, %i3
	sta	%f29,	[%l7 + %i3] 0x15
	for	%f20,	%f12,	%f26
	tsubcctv	%l2,	0x0AAA,	%o6
	fxors	%f3,	%f15,	%f20
	fcmpeq32	%f6,	%f28,	%g3
	bl,pt	%icc,	loop_1404
	orn	%g6,	%g5,	%l1
	subcc	%l5,	0x1D2B,	%g7
	umulcc	%o3,	%l6,	%i4
loop_1404:
	bleu,pn	%icc,	loop_1405
	subccc	%o1,	0x0EB7,	%o2
	move	%xcc,	%i0,	%i1
	bvc,pt	%xcc,	loop_1406
loop_1405:
	xnor	%i7,	%l4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x04,	%f16
loop_1406:
	fmovrdlez	%l3,	%f10,	%f2
	sir	0x1EA1
	addcc	%o5,	0x0CB8,	%o7
	udiv	%g1,	0x1CD1,	%g2
	edge8	%o0,	%i5,	%l0
	sethi	0x1522,	%i6
	mulx	%g4,	%i3,	%o4
	tsubcctv	%l2,	%o6,	%g6
	edge16n	%g5,	%g3,	%l1
	tge	%icc,	0x5
	sir	0x0831
	bl,a	loop_1407
	srl	%l5,	0x14,	%o3
	edge32ln	%g7,	%i4,	%l6
	stw	%o1,	[%l7 + 0x3C]
loop_1407:
	bvc,a,pn	%icc,	loop_1408
	fmovrsgz	%i0,	%f9,	%f8
	set	0x7A, %l2
	stha	%o2,	[%l7 + %l2] 0x19
loop_1408:
	tge	%xcc,	0x2
	mulscc	%i1,	0x18D4,	%i7
	umul	%l4,	0x0EF9,	%l3
	umul	%o5,	%i2,	%o7
	fmovdge	%icc,	%f3,	%f25
	set	0x6A, %i2
	lduha	[%l7 + %i2] 0x0c,	%g2
	flush	%l7 + 0x08
	tl	%icc,	0x4
	fmovda	%icc,	%f23,	%f31
	bgu,a,pt	%xcc,	loop_1409
	sra	%o0,	%g1,	%i5
	bn	%icc,	loop_1410
	udivcc	%i6,	0x00CD,	%l0
loop_1409:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%g4
loop_1410:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%i3
	fzeros	%f8
	fnegd	%f24,	%f18
	addccc	%l2,	%o6,	%g6
	bneg	loop_1411
	fbne	%fcc0,	loop_1412
	edge8ln	%g5,	%g3,	%l1
	tcs	%xcc,	0x2
loop_1411:
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
	ble,pn	%icc,	loop_1414
	array8	%o4,	%l5,	%g7
	fmovrdlz	%i4,	%f30,	%f4
loop_1413:
	movrlez	%l6,	%o3,	%o1
loop_1414:
	lduw	[%l7 + 0x60],	%i0
	fpack16	%f14,	%f29
	fabss	%f14,	%f26
	bg,pn	%icc,	loop_1415
	edge16ln	%i1,	%o2,	%i7
	ble,a	%icc,	loop_1416
	movre	%l4,	%o5,	%l3
loop_1415:
	fmovs	%f30,	%f12
	tne	%icc,	0x4
loop_1416:
	umul	%o7,	%g2,	%o0
	movcs	%xcc,	%i2,	%g1
	tge	%icc,	0x4
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x04,	%i6
	fmovsvs	%icc,	%f26,	%f24
	popc	0x1D21,	%l0
	subccc	%g4,	0x1711,	%i5
	fpadd32	%f10,	%f24,	%f12
	edge8	%i3,	%o6,	%g6
	sth	%l2,	[%l7 + 0x20]
	mulscc	%g5,	0x00CA,	%l1
	fmovdge	%xcc,	%f7,	%f17
	fmovs	%f13,	%f10
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x30] %asi,	%g3
	orcc	%o4,	0x19C8,	%l5
	ble	loop_1417
	tl	%xcc,	0x5
	bn,a,pt	%xcc,	loop_1418
	tneg	%icc,	0x1
loop_1417:
	tleu	%xcc,	0x3
	ldx	[%l7 + 0x30],	%i4
loop_1418:
	andn	%g7,	0x144C,	%l6
	movrlez	%o1,	%i0,	%i1
	fandnot2	%f14,	%f28,	%f6
	edge32n	%o3,	%i7,	%o2
	fbue	%fcc3,	loop_1419
	prefetch	[%l7 + 0x1C],	 0x2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%l4
loop_1419:
	movcc	%icc,	%o7,	%g2
	edge16n	%o0,	%l3,	%g1
	subc	%i6,	%i2,	%g4
	andcc	%i5,	%l0,	%o6
	udiv	%i3,	0x0A5E,	%l2
	membar	0x7B
	movle	%xcc,	%g5,	%l1
	sir	0x0C2B
	xor	%g3,	%o4,	%g6
	umulcc	%i4,	%l5,	%l6
	popc	%o1,	%g7
	brgez	%i0,	loop_1420
	fmovsvc	%xcc,	%f31,	%f15
	movl	%icc,	%o3,	%i7
	stbar
loop_1420:
	subccc	%o2,	%i1,	%o5
	fbule	%fcc2,	loop_1421
	fpmerge	%f20,	%f9,	%f14
	fmovrde	%o7,	%f4,	%f10
	faligndata	%f30,	%f20,	%f26
loop_1421:
	membar	0x76
	movge	%icc,	%g2,	%o0
	movneg	%xcc,	%l4,	%g1
	udiv	%i6,	0x00E9,	%l3
	tl	%xcc,	0x0
	movle	%xcc,	%g4,	%i2
	movle	%icc,	%i5,	%l0
	fsrc2	%f4,	%f6
	subc	%i3,	%l2,	%o6
	fmovsl	%icc,	%f22,	%f28
	fmovs	%f8,	%f12
	fbne,a	%fcc1,	loop_1422
	lduh	[%l7 + 0x20],	%g5
	addcc	%l1,	0x1050,	%g3
	fmovsvc	%icc,	%f11,	%f23
loop_1422:
	fmuld8ulx16	%f13,	%f17,	%f4
	edge8l	%g6,	%o4,	%l5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	fcmpeq16	%f24,	%f4,	%o1
	bge	loop_1423
	std	%g6,	[%l7 + 0x40]
	tleu	%icc,	0x3
	fmovscc	%icc,	%f29,	%f28
loop_1423:
	movrlez	%l6,	0x02C,	%o3
	tcc	%icc,	0x6
	sra	%i0,	%o2,	%i7
	movpos	%xcc,	%i1,	%o5
	sll	%g2,	%o7,	%l4
	xorcc	%o0,	%g1,	%l3
	fmul8ulx16	%f4,	%f24,	%f0
	tsubcc	%g4,	%i6,	%i5
	fmovsleu	%icc,	%f12,	%f14
	udiv	%i2,	0x1852,	%i3
	movcs	%xcc,	%l0,	%l2
	fnands	%f4,	%f17,	%f6
	srl	%o6,	0x07,	%l1
	srlx	%g3,	0x07,	%g5
	add	%g6,	0x08C5,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%i4
	fmovsa	%icc,	%f29,	%f0
	fones	%f2
	movge	%icc,	%o1,	%g7
	fandnot1s	%f5,	%f31,	%f4
	ldd	[%l7 + 0x20],	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%l6
	orcc	%o2,	0x146F,	%i0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x88
	fzero	%f8
	fornot1s	%f7,	%f26,	%f17
	udivx	%i7,	0x1310,	%o5
	fexpand	%f22,	%f22
	add	%g2,	0x16E5,	%o7
	tvs	%icc,	0x6
	fmovdcs	%xcc,	%f8,	%f28
	fpsub16s	%f7,	%f14,	%f15
	fors	%f24,	%f28,	%f25
	array16	%i1,	%o0,	%g1
	bn	%xcc,	loop_1424
	fcmple16	%f24,	%f2,	%l4
	sethi	0x1E01,	%g4
	movrgz	%i6,	%i5,	%i2
loop_1424:
	ldd	[%l7 + 0x60],	%l2
	bne,a,pt	%icc,	loop_1425
	fcmpgt32	%f28,	%f20,	%l0
	movl	%icc,	%i3,	%o6
	popc	%l1,	%l2
loop_1425:
	move	%xcc,	%g3,	%g6
	fxnors	%f28,	%f3,	%f1
	tpos	%icc,	0x7
	tcs	%icc,	0x2
	addccc	%g5,	%l5,	%o4
	stbar
	fmovsvs	%icc,	%f6,	%f19
	tneg	%icc,	0x0
	movle	%xcc,	%o1,	%g7
	fba	%fcc1,	loop_1426
	smul	%i4,	0x1BC6,	%o3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l6,	%o2
loop_1426:
	bgu,pn	%icc,	loop_1427
	fmovrsgz	%i7,	%f18,	%f9
	array32	%o5,	%i0,	%o7
	fmovdleu	%xcc,	%f23,	%f12
loop_1427:
	tge	%xcc,	0x3
	movne	%xcc,	%g2,	%o0
	fnot1s	%f1,	%f9
	fbug,a	%fcc2,	loop_1428
	taddcctv	%g1,	0x0D4A,	%l4
	tgu	%icc,	0x4
	wr	%g0,	0x81,	%asi
	stba	%g4,	[%l7 + 0x75] %asi
loop_1428:
	nop
	set	0x76, %o1
	ldsha	[%l7 + %o1] 0x04,	%i1
	sub	%i6,	0x15B1,	%i2
	umulcc	%i5,	%l0,	%i3
	fbge	%fcc3,	loop_1429
	fcmple16	%f28,	%f0,	%o6
	fornot1s	%f31,	%f11,	%f11
	set	0x30, %o3
	ldsba	[%l7 + %o3] 0x80,	%l3
loop_1429:
	ldd	[%l7 + 0x30],	%f2
	tge	%icc,	0x6
	fandnot1s	%f18,	%f1,	%f23
	fsrc1	%f24,	%f18
	te	%xcc,	0x1
	fbge,a	%fcc1,	loop_1430
	fmovdcs	%xcc,	%f23,	%f29
	addcc	%l1,	%l2,	%g6
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
	add	%g5,	%g3,	%o4
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x89,	%l5
loop_1431:
	taddcctv	%g7,	%o1,	%i4
	fmovrsgez	%o3,	%f19,	%f16
	brlz,a	%o2,	loop_1432
	edge8ln	%l6,	%i7,	%o5
	fpadd16s	%f20,	%f10,	%f10
	fmovsle	%icc,	%f15,	%f0
loop_1432:
	movvc	%icc,	%i0,	%o7
	add	%o0,	%g1,	%g2
	bcs,a,pn	%icc,	loop_1433
	mulscc	%g4,	0x19F8,	%i1
	edge8l	%i6,	%l4,	%i2
	bgu,a,pt	%xcc,	loop_1434
loop_1433:
	mova	%xcc,	%i5,	%i3
	movrgez	%o6,	0x168,	%l3
	ldx	[%l7 + 0x30],	%l0
loop_1434:
	membar	0x24
	edge8n	%l2,	%l1,	%g6
	movneg	%xcc,	%g5,	%g3
	movpos	%icc,	%l5,	%o4
	xnorcc	%g7,	%i4,	%o1
	mulscc	%o2,	%o3,	%i7
	membar	0x61
	fands	%f25,	%f24,	%f6
	tsubcc	%l6,	%i0,	%o7
	tpos	%icc,	0x3
	xnorcc	%o5,	%g1,	%g2
	tcs	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x48] %asi,	%f30
	subccc	%g4,	0x1227,	%i1
	srl	%i6,	0x1D,	%o0
	movrlz	%l4,	0x387,	%i5
	fpadd16	%f0,	%f12,	%f0
	edge16l	%i2,	%i3,	%l3
	fmovsleu	%icc,	%f18,	%f26
	tn	%xcc,	0x7
	edge8ln	%l0,	%o6,	%l1
	fbule,a	%fcc3,	loop_1435
	std	%l2,	[%l7 + 0x60]
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g6
loop_1435:
	fmul8x16au	%f9,	%f22,	%f8
	flush	%l7 + 0x60
	addccc	%g5,	%l5,	%g3
	sethi	0x1D7C,	%o4
	fones	%f3
	siam	0x1
	fzero	%f14
	ldsh	[%l7 + 0x70],	%i4
	smulcc	%o1,	0x1274,	%o2
	call	loop_1436
	fpadd32s	%f28,	%f11,	%f30
	fmovrslz	%g7,	%f31,	%f3
	andncc	%o3,	%l6,	%i0
loop_1436:
	bcc,a,pn	%icc,	loop_1437
	fcmps	%fcc2,	%f18,	%f14
	stbar
	fbge	%fcc0,	loop_1438
loop_1437:
	fmovrse	%i7,	%f5,	%f12
	ldsb	[%l7 + 0x41],	%o7
	subcc	%g1,	%o5,	%g4
loop_1438:
	fors	%f11,	%f27,	%f11
	tneg	%xcc,	0x5
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g2,	0x1D8A,	%i1
	addcc	%i6,	0x08F6,	%o0
	sllx	%l4,	%i2,	%i5
	udivx	%l3,	0x14BD,	%i3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	fbe,a	%fcc1,	loop_1439
	fornot2s	%f6,	%f23,	%f11
	fpackfix	%f18,	%f23
	wr	%g0,	0x81,	%asi
	sta	%f2,	[%l7 + 0x50] %asi
loop_1439:
	stbar
	sllx	%l1,	%o6,	%g6
	fba,a	%fcc2,	loop_1440
	stx	%l2,	[%l7 + 0x28]
	brlez	%l5,	loop_1441
	xorcc	%g5,	%o4,	%i4
loop_1440:
	edge16	%o1,	%g3,	%g7
	fmovdcc	%xcc,	%f9,	%f12
loop_1441:
	sra	%o2,	%l6,	%o3
	edge16n	%i0,	%o7,	%i7
	movcc	%icc,	%o5,	%g4
	st	%f12,	[%l7 + 0x1C]
	nop
	setx	loop_1442,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	for	%f20,	%f2,	%f10
	fba,a	%fcc1,	loop_1443
	tg	%xcc,	0x4
loop_1442:
	call	loop_1444
	bl,a,pt	%xcc,	loop_1445
loop_1443:
	fxors	%f11,	%f30,	%f10
	sdivx	%g1,	0x02CE,	%i1
loop_1444:
	ldd	[%l7 + 0x60],	%g2
loop_1445:
	ldub	[%l7 + 0x77],	%i6
	movg	%xcc,	%o0,	%l4
	movpos	%xcc,	%i5,	%i2
	edge32n	%l3,	%l0,	%l1
	siam	0x2
	xnor	%i3,	%o6,	%g6
	fmovsge	%icc,	%f27,	%f13
	fnot1s	%f12,	%f18
	fmovdg	%icc,	%f25,	%f13
	sdivx	%l5,	0x0032,	%l2
	udivcc	%g5,	0x1E2F,	%i4
	fbl	%fcc3,	loop_1446
	fmul8ulx16	%f2,	%f20,	%f8
	fornot1	%f2,	%f20,	%f20
	array16	%o1,	%g3,	%g7
loop_1446:
	movgu	%xcc,	%o2,	%l6
	addc	%o4,	0x1F05,	%o3
	sdivcc	%o7,	0x0645,	%i7
	fpadd32	%f4,	%f0,	%f30
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x14
	st	%f16,	[%l7 + 0x48]
	fba	%fcc1,	loop_1447
	orn	%o5,	%i0,	%g1
	wr	%g0,	0x0c,	%asi
	sta	%f18,	[%l7 + 0x08] %asi
loop_1447:
	nop
	setx loop_1448, %l0, %l1
	jmpl %l1, %g4
	prefetch	[%l7 + 0x5C],	 0x0
	fmovrsgz	%i1,	%f31,	%f19
	sethi	0x0A30,	%i6
loop_1448:
	fand	%f16,	%f22,	%f20
	array8	%g2,	%l4,	%i5
	movrlz	%i2,	0x3ED,	%o0
	tvs	%icc,	0x3
	fmovdvs	%icc,	%f0,	%f14
	mulx	%l0,	0x03C2,	%l1
	fsrc2s	%f3,	%f23
	popc	%l3,	%o6
	movle	%xcc,	%g6,	%i3
	edge32l	%l2,	%g5,	%i4
	fands	%f2,	%f28,	%f8
	edge8	%l5,	%o1,	%g3
	tsubcc	%o2,	0x00AE,	%l6
	tvs	%xcc,	0x6
	tcs	%xcc,	0x4
	fmovdvs	%xcc,	%f11,	%f29
	bcs	%xcc,	loop_1449
	edge32ln	%g7,	%o3,	%o7
	alignaddrl	%i7,	%o4,	%o5
	lduw	[%l7 + 0x58],	%g1
loop_1449:
	udivx	%i0,	0x07D0,	%i1
	ldsw	[%l7 + 0x10],	%g4
	movl	%xcc,	%g2,	%l4
	taddcc	%i5,	0x1BB1,	%i6
	edge16l	%o0,	%i2,	%l0
	brnz,a	%l3,	loop_1450
	movrgez	%o6,	0x018,	%g6
	edge8	%i3,	%l2,	%l1
	sethi	0x112A,	%g5
loop_1450:
	nop
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x11
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x1f
	membar	#Sync
	wr	%g0,	0x2a,	%asi
	stba	%i4,	[%l7 + 0x56] %asi
	membar	#Sync
	prefetch	[%l7 + 0x0C],	 0x2
	fpadd32s	%f16,	%f19,	%f15
	fbe,a	%fcc0,	loop_1451
	edge8l	%l5,	%o1,	%g3
	set	0x4A, %l3
	ldstuba	[%l7 + %l3] 0x80,	%o2
loop_1451:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	tleu	%icc,	0x4
	stbar
	fmovsleu	%icc,	%f31,	%f11
	call	loop_1452
	tleu	%xcc,	0x3
	fxnors	%f14,	%f11,	%f24
	fnegd	%f26,	%f22
loop_1452:
	fmovd	%f6,	%f4
	edge8l	%l6,	%o7,	%i7
	fmovrsgez	%o3,	%f19,	%f19
	mulx	%o5,	0x0AD6,	%g1
	set	0x18, %i6
	stda	%i0,	[%l7 + %i6] 0x15
	mova	%xcc,	%i1,	%g4
	tl	%xcc,	0x1
	tn	%icc,	0x0
	movcc	%xcc,	%g2,	%l4
	fmovrdgez	%i5,	%f28,	%f4
	sdiv	%i6,	0x0418,	%o4
	tne	%icc,	0x1
	edge32	%o0,	%i2,	%l0
	popc	%o6,	%l3
	fbl,a	%fcc3,	loop_1453
	tvs	%xcc,	0x4
	movgu	%xcc,	%i3,	%l2
	movg	%xcc,	%l1,	%g6
loop_1453:
	fxors	%f25,	%f14,	%f6
	tsubcc	%i4,	%l5,	%o1
	fmovsn	%xcc,	%f9,	%f26
	fandnot2	%f30,	%f14,	%f0
	tneg	%xcc,	0x4
	fmovsne	%icc,	%f10,	%f25
	movle	%icc,	%g5,	%g3
	movneg	%icc,	%o2,	%g7
	fmovdpos	%xcc,	%f16,	%f16
	movleu	%xcc,	%o7,	%i7
	taddcctv	%l6,	0x09EB,	%o3
	fcmpeq32	%f26,	%f10,	%o5
	ldsb	[%l7 + 0x0E],	%i0
	fba	%fcc1,	loop_1454
	bn,a	%xcc,	loop_1455
	smul	%g1,	0x156A,	%i1
	fcmped	%fcc3,	%f20,	%f14
loop_1454:
	movg	%icc,	%g4,	%g2
loop_1455:
	xnorcc	%l4,	%i5,	%o4
	tsubcctv	%i6,	0x1EA0,	%i2
	edge8	%o0,	%o6,	%l3
	fpackfix	%f20,	%f10
	fcmpes	%fcc1,	%f31,	%f8
	call	loop_1456
	addc	%l0,	%i3,	%l1
	movleu	%icc,	%l2,	%i4
	set	0x68, %g2
	ldswa	[%l7 + %g2] 0x81,	%g6
loop_1456:
	srl	%l5,	%o1,	%g5
	fmovrslz	%g3,	%f31,	%f24
	sub	%o2,	0x1648,	%g7
	sethi	0x1B16,	%o7
	edge16ln	%i7,	%o3,	%l6
	ta	%xcc,	0x3
	orcc	%i0,	%g1,	%o5
	srax	%i1,	0x17,	%g4
	fcmps	%fcc0,	%f27,	%f23
	fmovdleu	%icc,	%f30,	%f25
	fmovsa	%xcc,	%f4,	%f18
	movg	%icc,	%l4,	%i5
	fone	%f0
	stw	%o4,	[%l7 + 0x58]
	edge16l	%g2,	%i2,	%i6
	andcc	%o0,	0x1AFE,	%o6
	fands	%f29,	%f25,	%f9
	fbue,a	%fcc2,	loop_1457
	tvs	%icc,	0x1
	edge8l	%l3,	%l0,	%i3
	movrgz	%l1,	%l2,	%g6
loop_1457:
	movn	%icc,	%i4,	%l5
	edge16l	%g5,	%o1,	%o2
	edge32ln	%g3,	%o7,	%g7
	sethi	0x09E1,	%i7
	fmovspos	%xcc,	%f2,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f12,	%f19
	xor	%o3,	%l6,	%g1
	andncc	%o5,	%i1,	%i0
	movrgz	%g4,	%i5,	%l4
	brz,a	%o4,	loop_1458
	fornot1	%f18,	%f20,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f29,	%f25
loop_1458:
	fpadd16s	%f5,	%f31,	%f20
	tvc	%icc,	0x1
	array8	%g2,	%i6,	%o0
	srax	%i2,	0x0B,	%o6
	taddcc	%l0,	0x0AFF,	%l3
	andn	%i3,	%l2,	%l1
	fbe	%fcc2,	loop_1459
	sdiv	%g6,	0x0A22,	%i4
	udiv	%g5,	0x08EE,	%l5
	srl	%o2,	%g3,	%o1
loop_1459:
	tsubcc	%o7,	%i7,	%o3
	brz,a	%g7,	loop_1460
	edge32ln	%g1,	%l6,	%o5
	fcmpgt32	%f30,	%f2,	%i1
	fmovsn	%icc,	%f7,	%f29
loop_1460:
	movleu	%icc,	%i0,	%i5
	movrne	%l4,	%o4,	%g2
	sll	%g4,	%o0,	%i2
	fcmple32	%f22,	%f10,	%o6
	fmovdne	%xcc,	%f26,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l0,	%l3,	%i3
	edge32l	%l2,	%i6,	%l1
	fble,a	%fcc2,	loop_1461
	fzero	%f0
	smulcc	%g6,	0x04B6,	%i4
	movleu	%xcc,	%l5,	%g5
loop_1461:
	tcs	%xcc,	0x6
	fmovdvs	%xcc,	%f21,	%f1
	bne,a	loop_1462
	fmovse	%icc,	%f10,	%f22
	mova	%xcc,	%o2,	%o1
	fmovsn	%xcc,	%f19,	%f1
loop_1462:
	fbug,a	%fcc2,	loop_1463
	move	%xcc,	%o7,	%g3
	movn	%xcc,	%o3,	%i7
	sdiv	%g1,	0x0AAA,	%g7
loop_1463:
	nop
	set	0x40, %o2
	ldsw	[%l7 + %o2],	%l6
	movne	%icc,	%i1,	%o5
	tg	%xcc,	0x7
	sllx	%i0,	0x05,	%i5
	movcs	%icc,	%o4,	%g2
	nop
	setx	loop_1464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%g4,	0x0C8A,	%o0
	edge8	%i2,	%o6,	%l0
	fmovrdlz	%l3,	%f14,	%f20
loop_1464:
	fmovdvs	%xcc,	%f24,	%f26
	movl	%xcc,	%l4,	%l2
	sir	0x0708
	srl	%i3,	%i6,	%g6
	udivcc	%l1,	0x1F60,	%i4
	fcmpeq16	%f10,	%f16,	%l5
	edge32n	%g5,	%o2,	%o7
	fcmple16	%f6,	%f24,	%g3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addc	%o3,	%o1,	%i7
	bneg,pn	%icc,	loop_1465
	bne	%icc,	loop_1466
	fmovdl	%icc,	%f7,	%f1
	edge8ln	%g7,	%g1,	%l6
loop_1465:
	bne,pn	%icc,	loop_1467
loop_1466:
	mulx	%o5,	0x05D7,	%i1
	movleu	%icc,	%i5,	%i0
	lduw	[%l7 + 0x08],	%o4
loop_1467:
	sir	0x09B2
	edge32ln	%g4,	%g2,	%i2
	fxnor	%f2,	%f2,	%f22
	tneg	%xcc,	0x6
	edge8ln	%o6,	%l0,	%l3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o0
	te	%xcc,	0x2
	fcmps	%fcc0,	%f23,	%f5
	tge	%xcc,	0x4
	nop
	set	0x18, %g7
	stx	%l2,	[%l7 + %g7]
	srlx	%i3,	%i6,	%l4
	udivcc	%l1,	0x0D22,	%g6
	fmovdpos	%icc,	%f28,	%f5
	set	0x00, %l6
	ldxa	[%g0 + %l6] 0x50,	%l5
	movge	%icc,	%i4,	%g5
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o7
	fmovsneg	%icc,	%f7,	%f25
	sub	%g3,	%o2,	%o3
	tpos	%xcc,	0x3
	edge16l	%i7,	%g7,	%o1
	fbo,a	%fcc3,	loop_1468
	ldsw	[%l7 + 0x70],	%g1
	edge8l	%l6,	%i1,	%o5
	edge8	%i0,	%i5,	%g4
loop_1468:
	fandnot2s	%f26,	%f3,	%f26
	andncc	%o4,	%i2,	%o6
	set	0x5C, %o5
	swapa	[%l7 + %o5] 0x80,	%l0
	bleu,a	%xcc,	loop_1469
	xnor	%g2,	%l3,	%l2
	add	%i3,	%o0,	%i6
	sethi	0x1376,	%l4
loop_1469:
	fba,a	%fcc3,	loop_1470
	sll	%l1,	%l5,	%i4
	movvc	%xcc,	%g5,	%g6
	fbn,a	%fcc2,	loop_1471
loop_1470:
	subc	%g3,	0x14C6,	%o2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
loop_1471:
	fnot2	%f22,	%f8
	movvs	%icc,	%o3,	%o7
	movn	%xcc,	%g7,	%i7
	sdivx	%g1,	0x0DCF,	%o1
	taddcctv	%i1,	0x1D64,	%l6
	bg,a	loop_1472
	edge8	%i0,	%o5,	%g4
	addc	%o4,	%i2,	%i5
	edge32	%o6,	%l0,	%l3
loop_1472:
	orcc	%g2,	%i3,	%l2
	movvc	%icc,	%o0,	%i6
	udivcc	%l4,	0x01B0,	%l5
	fbuge,a	%fcc1,	loop_1473
	fnegd	%f18,	%f24
	orncc	%i4,	0x05A7,	%g5
	edge8n	%l1,	%g3,	%o2
loop_1473:
	edge32l	%g6,	%o7,	%o3
	bg	%icc,	loop_1474
	swap	[%l7 + 0x3C],	%g7
	ldsw	[%l7 + 0x30],	%i7
	edge16n	%g1,	%o1,	%i1
loop_1474:
	andcc	%i0,	0x005B,	%l6
	fmovrslez	%g4,	%f8,	%f17
	fcmpgt16	%f26,	%f8,	%o4
	nop
	set	0x64, %l1
	ldsb	[%l7 + %l1],	%i2
	movvc	%icc,	%i5,	%o5
	mulscc	%o6,	0x16E4,	%l0
	or	%l3,	%i3,	%l2
	fbug	%fcc0,	loop_1475
	edge16l	%g2,	%o0,	%i6
	ldd	[%l7 + 0x40],	%f22
	membar	0x1C
loop_1475:
	tge	%icc,	0x2
	fbo,a	%fcc2,	loop_1476
	xorcc	%l5,	%i4,	%g5
	orn	%l4,	0x17D8,	%l1
	fbge	%fcc2,	loop_1477
loop_1476:
	ld	[%l7 + 0x10],	%f1
	fbl	%fcc0,	loop_1478
	edge16l	%o2,	%g3,	%g6
loop_1477:
	bn	%icc,	loop_1479
	fmovrdne	%o7,	%f2,	%f4
loop_1478:
	or	%o3,	%g7,	%i7
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g1,	%o1
loop_1479:
	movneg	%icc,	%i1,	%l6
	ldsb	[%l7 + 0x08],	%g4
	fones	%f30
	tpos	%icc,	0x2
	fcmps	%fcc0,	%f6,	%f23
	fmul8x16	%f23,	%f30,	%f16
	movvs	%icc,	%o4,	%i0
	nop
	set	0x6E, %o6
	ldstub	[%l7 + %o6],	%i5
	fmovdvc	%icc,	%f13,	%f28
	set	0x34, %o4
	lduwa	[%l7 + %o4] 0x10,	%i2
	stx	%o6,	[%l7 + 0x08]
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x3D] %asi,	%l0
	set	0x18, %g6
	sta	%f28,	[%l7 + %g6] 0x89
	fmovrse	%o5,	%f26,	%f27
	ldstub	[%l7 + 0x42],	%l3
	sllx	%l2,	0x08,	%i3
	movpos	%icc,	%o0,	%i6
	taddcctv	%l5,	%i4,	%g2
	fbule	%fcc3,	loop_1480
	edge16	%g5,	%l4,	%o2
	movleu	%icc,	%g3,	%g6
	set	0x1C, %i5
	lda	[%l7 + %i5] 0x10,	%f16
loop_1480:
	brz	%l1,	loop_1481
	fpmerge	%f0,	%f29,	%f22
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x18,	%o7,	%g7
loop_1481:
	fmovdcc	%xcc,	%f17,	%f7
	tneg	%xcc,	0x7
	alignaddr	%i7,	%o3,	%o1
	fnot1	%f28,	%f2
	umul	%g1,	%l6,	%i1
	movge	%xcc,	%o4,	%i0
	alignaddrl	%i5,	%i2,	%o6
	movn	%xcc,	%l0,	%g4
	taddcctv	%o5,	%l2,	%i3
	fpsub32	%f22,	%f20,	%f2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o0
	fbge	%fcc3,	loop_1482
	sllx	%l3,	0x1B,	%i6
	tl	%icc,	0x4
	or	%l5,	0x10EC,	%i4
loop_1482:
	umulcc	%g2,	0x0FA1,	%l4
	lduh	[%l7 + 0x4C],	%o2
	tle	%icc,	0x3
	mova	%xcc,	%g5,	%g3
	bcs,pt	%xcc,	loop_1483
	srlx	%g6,	%l1,	%o7
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x1e,	%f0
loop_1483:
	edge8l	%g7,	%o3,	%i7
	bcs,pt	%icc,	loop_1484
	fxnor	%f8,	%f30,	%f4
	wr	%g0,	0x19,	%asi
	stha	%o1,	[%l7 + 0x12] %asi
loop_1484:
	be,a,pt	%xcc,	loop_1485
	edge16n	%l6,	%i1,	%g1
	taddcctv	%i0,	%o4,	%i5
	fornot1	%f0,	%f0,	%f18
loop_1485:
	movcc	%xcc,	%o6,	%l0
	alignaddr	%i2,	%g4,	%o5
	set	0x00, %l5
	ldxa	[%g0 + %l5] 0x50,	%l2
	movrne	%i3,	0x2E9,	%o0
	tcc	%xcc,	0x6
	edge32	%i6,	%l5,	%l3
	mulx	%g2,	%l4,	%o2
	movl	%icc,	%i4,	%g3
	fmovdcs	%xcc,	%f15,	%f7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
	fmovdne	%xcc,	%f13,	%f24
	movcc	%xcc,	%l1,	%g6
	subc	%o7,	%g7,	%i7
	fsrc2	%f16,	%f26
	sdivcc	%o1,	0x1492,	%l6
	fmovrde	%o3,	%f26,	%f26
	edge16ln	%i1,	%g1,	%i0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x26,	%i4
	bcc,a	%icc,	loop_1486
	srlx	%o6,	0x07,	%l0
	fones	%f30
	std	%o4,	[%l7 + 0x40]
loop_1486:
	fsrc1s	%f29,	%f12
	fmovsne	%xcc,	%f1,	%f12
	srax	%g4,	0x1A,	%o5
	taddcc	%i2,	0x011D,	%l2
	faligndata	%f20,	%f18,	%f14
	and	%o0,	0x1409,	%i3
	edge8ln	%l5,	%l3,	%g2
	movrlz	%l4,	0x35E,	%o2
	movg	%xcc,	%i6,	%i4
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f22
	fcmped	%fcc3,	%f20,	%f28
	sth	%g3,	[%l7 + 0x12]
	xorcc	%l1,	%g5,	%g6
	fmovrsne	%g7,	%f29,	%f19
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x55] %asi,	%i7
	udivcc	%o1,	0x0BEB,	%o7
	fbule	%fcc3,	loop_1487
	umulcc	%l6,	0x0472,	%o3
	tge	%icc,	0x0
	movrgz	%g1,	0x08B,	%i1
loop_1487:
	srl	%i0,	%o6,	%i5
	movgu	%xcc,	%l0,	%g4
	fnors	%f19,	%f23,	%f24
	fbo,a	%fcc2,	loop_1488
	fandnot2s	%f15,	%f0,	%f12
	andcc	%o5,	0x0B5D,	%i2
	fmovdcc	%xcc,	%f23,	%f31
loop_1488:
	fpack16	%f26,	%f5
	set	0x7A, %i0
	stba	%o4,	[%l7 + %i0] 0x81
	edge32n	%l2,	%i3,	%l5
	fbg,a	%fcc2,	loop_1489
	movrlz	%l3,	%o0,	%l4
	sub	%o2,	%g2,	%i4
	udiv	%g3,	0x1324,	%i6
loop_1489:
	bvs,a	%xcc,	loop_1490
	udiv	%l1,	0x0814,	%g6
	movrlz	%g7,	0x1F5,	%g5
	bgu,pt	%xcc,	loop_1491
loop_1490:
	orcc	%o1,	%o7,	%i7
	fxors	%f3,	%f1,	%f23
	bg,a	loop_1492
loop_1491:
	sdivx	%o3,	0x115C,	%l6
	add	%g1,	%i0,	%o6
	fmovdgu	%icc,	%f28,	%f23
loop_1492:
	andncc	%i1,	%l0,	%g4
	movgu	%icc,	%o5,	%i5
	set	0x65, %i3
	ldsba	[%l7 + %i3] 0x15,	%o4
	fbe,a	%fcc0,	loop_1493
	smulcc	%i2,	%l2,	%i3
	fbn,a	%fcc3,	loop_1494
	fbuge	%fcc1,	loop_1495
loop_1493:
	flush	%l7 + 0x28
	wr	%g0,	0x19,	%asi
	stha	%l5,	[%l7 + 0x66] %asi
loop_1494:
	or	%l3,	0x04DF,	%o0
loop_1495:
	lduw	[%l7 + 0x28],	%l4
	edge16ln	%o2,	%g2,	%i4
	fornot1s	%f17,	%f29,	%f28
	andn	%g3,	0x173E,	%l1
	movrne	%i6,	%g6,	%g7
	stb	%o1,	[%l7 + 0x11]
	tvc	%icc,	0x6
	andcc	%g5,	%i7,	%o7
	sth	%l6,	[%l7 + 0x08]
	movrlz	%g1,	%o3,	%i0
	sra	%i1,	0x13,	%o6
	umulcc	%g4,	%l0,	%i5
	orcc	%o4,	%o5,	%i2
	add	%i3,	%l2,	%l3
	orncc	%o0,	%l5,	%l4
	edge32n	%g2,	%o2,	%i4
	fbge	%fcc1,	loop_1496
	udivx	%l1,	0x1E93,	%g3
	fbg	%fcc2,	loop_1497
	tne	%xcc,	0x6
loop_1496:
	sdiv	%i6,	0x1378,	%g6
	movl	%icc,	%g7,	%g5
loop_1497:
	movne	%xcc,	%o1,	%i7
	fmovrdne	%o7,	%f28,	%f6
	mulscc	%g1,	0x0F53,	%o3
	subcc	%l6,	0x0341,	%i1
	movneg	%xcc,	%o6,	%g4
	nop
	setx	loop_1498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%icc,	0x0
	smul	%i0,	%l0,	%i5
	tsubcc	%o5,	%i2,	%i3
loop_1498:
	add	%o4,	%l2,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l5,	0x19A4,	%o0
	sir	0x11CE
	srax	%l4,	0x07,	%o2
	tcc	%xcc,	0x4
	bl	%icc,	loop_1499
	sub	%i4,	%g2,	%g3
	fbne,a	%fcc2,	loop_1500
	movvs	%xcc,	%l1,	%g6
loop_1499:
	mulscc	%g7,	0x0588,	%i6
	subccc	%g5,	%o1,	%o7
loop_1500:
	movre	%g1,	%i7,	%o3
	wr	%g0,	0xea,	%asi
	stba	%l6,	[%l7 + 0x6F] %asi
	membar	#Sync
	bne,pn	%xcc,	loop_1501
	subc	%i1,	%g4,	%i0
	wr	%g0,	0x89,	%asi
	stha	%o6,	[%l7 + 0x60] %asi
loop_1501:
	fabsd	%f26,	%f12
	movre	%l0,	%o5,	%i2
	addc	%i5,	%o4,	%i3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%l3
	xorcc	%l5,	%o0,	%o2
	udivx	%i4,	0x1AB3,	%g2
	fble	%fcc2,	loop_1502
	edge16l	%l4,	%g3,	%g6
	mulscc	%l1,	%g7,	%g5
	fbg,a	%fcc3,	loop_1503
loop_1502:
	fmul8sux16	%f8,	%f14,	%f12
	fpack32	%f22,	%f8,	%f6
	ldsw	[%l7 + 0x64],	%o1
loop_1503:
	fones	%f16
	orn	%o7,	0x0C36,	%g1
	addccc	%i7,	0x00E4,	%o3
	ldstub	[%l7 + 0x4D],	%l6
	movcc	%xcc,	%i6,	%i1
	edge8n	%g4,	%i0,	%l0
	alignaddrl	%o5,	%i2,	%o6
	udiv	%i5,	0x1D35,	%i3
	alignaddrl	%o4,	%l3,	%l2
	brnz	%l5,	loop_1504
	movneg	%icc,	%o2,	%i4
	fpadd32s	%f12,	%f2,	%f15
	fpadd32	%f12,	%f12,	%f14
loop_1504:
	bneg,a,pt	%icc,	loop_1505
	movn	%icc,	%o0,	%l4
	sllx	%g2,	0x11,	%g3
	fbue	%fcc3,	loop_1506
loop_1505:
	flush	%l7 + 0x0C
	tvc	%icc,	0x4
	fabsd	%f22,	%f18
loop_1506:
	ldstub	[%l7 + 0x77],	%l1
	ldsb	[%l7 + 0x20],	%g7
	taddcc	%g5,	0x18EB,	%g6
	tvs	%icc,	0x0
	movg	%xcc,	%o7,	%g1
	fcmpne16	%f12,	%f24,	%o1
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
	bleu,a	%xcc,	loop_1508
	movne	%xcc,	%i7,	%o3
	tleu	%icc,	0x5
loop_1507:
	stw	%i6,	[%l7 + 0x60]
loop_1508:
	orncc	%l6,	0x0F8A,	%g4
	bvc,a	loop_1509
	fmovsn	%xcc,	%f12,	%f4
	bge,pn	%icc,	loop_1510
	movrlz	%i0,	0x0C8,	%l0
loop_1509:
	movrne	%o5,	%i1,	%o6
	ldub	[%l7 + 0x71],	%i2
loop_1510:
	movle	%icc,	%i5,	%i3
	addc	%o4,	0x1E56,	%l2
	fmovsg	%icc,	%f25,	%f23
	fmovrdgez	%l3,	%f30,	%f6
	fxnors	%f22,	%f26,	%f7
	udiv	%l5,	0x16D4,	%o2
	srax	%o0,	0x16,	%i4
	xorcc	%g2,	%g3,	%l1
	fnands	%f20,	%f18,	%f6
	add	%g7,	%g5,	%l4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	wr	%g0,	0x2f,	%asi
	stha	%o7,	[%l7 + 0x3A] %asi
	membar	#Sync
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x11,	 0x0
	mulx	%i7,	0x16B6,	%o3
	sra	%i6,	0x1E,	%l6
	ldsw	[%l7 + 0x20],	%g1
	fmovdn	%icc,	%f30,	%f2
	srl	%g4,	%l0,	%i0
	fblg	%fcc2,	loop_1511
	siam	0x2
	movl	%xcc,	%o5,	%i1
	edge8	%i2,	%i5,	%i3
loop_1511:
	tgu	%icc,	0x0
	smul	%o4,	%o6,	%l2
	tsubcc	%l5,	0x16E9,	%o2
	wr	%g0,	0x80,	%asi
	stwa	%o0,	[%l7 + 0x7C] %asi
	call	loop_1512
	call	loop_1513
	edge32	%i4,	%l3,	%g3
	add	%g2,	%l1,	%g7
loop_1512:
	bshuffle	%f0,	%f10,	%f20
loop_1513:
	udiv	%l4,	0x1463,	%g5
	orn	%o7,	0x0989,	%o1
	set	0x78, %i1
	sta	%f4,	[%l7 + %i1] 0x89
	movneg	%xcc,	%g6,	%o3
	movleu	%xcc,	%i7,	%i6
	andncc	%l6,	%g4,	%g1
	tl	%icc,	0x1
	ldstub	[%l7 + 0x57],	%l0
	fnot2	%f28,	%f20
	srl	%o5,	0x00,	%i0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x18,	%f16
	set	0x08, %o7
	ldswa	[%l7 + %o7] 0x18,	%i2
	srax	%i5,	0x03,	%i3
	stb	%o4,	[%l7 + 0x50]
	tne	%xcc,	0x4
	bneg,a,pn	%icc,	loop_1514
	ta	%xcc,	0x0
	add	%o6,	%l2,	%i1
	brnz	%l5,	loop_1515
loop_1514:
	movne	%xcc,	%o2,	%o0
	xnor	%i4,	%l3,	%g2
	fmuld8ulx16	%f8,	%f23,	%f26
loop_1515:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%g7
	xnorcc	%g3,	0x0DC4,	%l4
	fornot2s	%f31,	%f7,	%f25
	nop
	setx	loop_1516,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%o7,	0x0AFE,	%o1
	fnot2	%f2,	%f14
	fba	%fcc1,	loop_1517
loop_1516:
	udivx	%g6,	0x116B,	%g5
	flush	%l7 + 0x50
	movl	%icc,	%i7,	%o3
loop_1517:
	fmovd	%f26,	%f10
	taddcctv	%i6,	0x1A32,	%l6
	sllx	%g4,	%l0,	%g1
	ld	[%l7 + 0x7C],	%f0
	sll	%o5,	0x01,	%i2
	movvc	%xcc,	%i5,	%i3
	fpsub16	%f4,	%f14,	%f2
	andn	%o4,	%i0,	%o6
	edge32	%i1,	%l5,	%o2
	sethi	0x0D61,	%o0
	fpsub16	%f0,	%f6,	%f2
	fbue	%fcc2,	loop_1518
	popc	%i4,	%l2
	add	%g2,	%l1,	%l3
	orncc	%g7,	0x0BB7,	%l4
loop_1518:
	fors	%f11,	%f29,	%f26
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%o1
	bcc	loop_1519
	taddcc	%g6,	0x083A,	%o7
	sdivx	%g5,	0x1122,	%o3
	fmovdne	%icc,	%f8,	%f7
loop_1519:
	tsubcc	%i6,	0x00DB,	%i7
	movge	%xcc,	%l6,	%l0
	edge8	%g1,	%o5,	%g4
	addcc	%i5,	%i2,	%i3
	andcc	%i0,	%o6,	%i1
	movrlz	%l5,	%o4,	%o2
	movpos	%icc,	%i4,	%o0
	fmovrslez	%g2,	%f11,	%f5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%l3
	andncc	%l2,	%g7,	%g3
	tpos	%xcc,	0x5
	flush	%l7 + 0x14
	movl	%xcc,	%o1,	%l4
	ldub	[%l7 + 0x43],	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g5,	%g6,	%i6
	edge32	%o3,	%l6,	%l0
	tneg	%xcc,	0x2
	te	%icc,	0x7
	for	%f14,	%f14,	%f0
	subccc	%i7,	0x13B5,	%o5
	fmovrdgz	%g1,	%f8,	%f0
	orcc	%g4,	0x14FA,	%i2
	fpadd16s	%f4,	%f3,	%f15
	subcc	%i3,	%i5,	%i0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x70] %asi,	%o6
	xor	%i1,	0x0A45,	%l5
	xorcc	%o2,	0x0730,	%i4
	tne	%icc,	0x1
	andn	%o0,	0x10D4,	%o4
	sdivcc	%g2,	0x1ED9,	%l3
	movle	%xcc,	%l2,	%l1
	tvc	%icc,	0x7
	fcmpne16	%f6,	%f24,	%g3
	set	0x22, %o1
	lduha	[%l7 + %o1] 0x88,	%g7
	stw	%o1,	[%l7 + 0x34]
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	fbug,a	%fcc0,	loop_1520
	bgu	%icc,	loop_1521
	fnegs	%f3,	%f5
	array16	%l4,	%g6,	%i6
loop_1520:
	tne	%xcc,	0x3
loop_1521:
	fbo	%fcc2,	loop_1522
	nop
	setx	loop_1523,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x2E],	%o3
	std	%f30,	[%l7 + 0x60]
loop_1522:
	orncc	%g5,	%l6,	%i7
loop_1523:
	edge32l	%o5,	%g1,	%g4
	fmovdcc	%xcc,	%f12,	%f7
	andcc	%l0,	0x061F,	%i2
	tge	%xcc,	0x4
	fmovrdlez	%i3,	%f30,	%f22
	tsubcc	%i5,	0x1E62,	%i0
	movcc	%xcc,	%i1,	%l5
	sra	%o2,	0x0F,	%i4
	movcc	%xcc,	%o0,	%o4
	fmovrde	%g2,	%f0,	%f16
	andncc	%o6,	%l3,	%l2
	fmovrdgz	%g3,	%f20,	%f24
	edge32l	%l1,	%g7,	%o7
	or	%o1,	%l4,	%g6
	brlz,a	%i6,	loop_1524
	movcs	%xcc,	%o3,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%l6,	loop_1525
loop_1524:
	edge32l	%o5,	%i7,	%g1
	xnor	%l0,	%g4,	%i2
	fbe,a	%fcc2,	loop_1526
loop_1525:
	prefetch	[%l7 + 0x34],	 0x1
	move	%xcc,	%i5,	%i3
	fornot1	%f2,	%f10,	%f28
loop_1526:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x74] %asi,	%f31
	brgez,a	%i1,	loop_1527
	movle	%xcc,	%i0,	%o2
	movl	%icc,	%i4,	%o0
	tn	%icc,	0x6
loop_1527:
	lduh	[%l7 + 0x70],	%l5
	bl,a	loop_1528
	udivcc	%g2,	0x184D,	%o6
	call	loop_1529
	stb	%o4,	[%l7 + 0x77]
loop_1528:
	ta	%icc,	0x5
	addcc	%l3,	%l2,	%g3
loop_1529:
	fabsd	%f6,	%f26
	fbue,a	%fcc3,	loop_1530
	fxors	%f13,	%f0,	%f25
	srl	%l1,	%o7,	%o1
	prefetch	[%l7 + 0x70],	 0x3
loop_1530:
	movrlz	%l4,	%g7,	%g6
	and	%i6,	0x185A,	%o3
	fcmpd	%fcc2,	%f18,	%f2
	move	%xcc,	%l6,	%o5
	movcc	%xcc,	%g5,	%g1
	movrlez	%l0,	%g4,	%i7
	brgez	%i5,	loop_1531
	st	%f3,	[%l7 + 0x20]
	edge8ln	%i3,	%i2,	%i0
	fxors	%f30,	%f6,	%f9
loop_1531:
	sub	%i1,	%i4,	%o2
	sir	0x0684
	fxnors	%f25,	%f31,	%f16
	tg	%xcc,	0x5
	fbul	%fcc0,	loop_1532
	fors	%f23,	%f8,	%f31
	sdivcc	%o0,	0x13F7,	%l5
	movleu	%icc,	%o6,	%g2
loop_1532:
	edge8n	%o4,	%l3,	%g3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	umulcc	%l1,	0x035E,	%o1
	fcmpes	%fcc3,	%f23,	%f6
	tcs	%icc,	0x1
	fabsd	%f6,	%f14
	fornot1s	%f1,	%f19,	%f25
	stbar
	edge8l	%o7,	%l4,	%g6
	fbo	%fcc3,	loop_1533
	movl	%xcc,	%i6,	%o3
	sub	%g7,	%l6,	%g5
	fbug,a	%fcc2,	loop_1534
loop_1533:
	fmovsn	%xcc,	%f18,	%f1
	andn	%o5,	%l0,	%g4
	edge8	%g1,	%i5,	%i7
loop_1534:
	movg	%xcc,	%i3,	%i0
	tneg	%icc,	0x0
	fmovrse	%i1,	%f24,	%f17
	swap	[%l7 + 0x30],	%i4
	fbul	%fcc2,	loop_1535
	tl	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%i2
loop_1535:
	array16	%o2,	%o0,	%o6
	fcmpgt16	%f24,	%f2,	%l5
	movgu	%icc,	%g2,	%o4
	fnegs	%f27,	%f18
	udiv	%g3,	0x19E4,	%l2
	movn	%xcc,	%l1,	%l3
	edge32n	%o7,	%o1,	%g6
	and	%i6,	%l4,	%o3
	prefetch	[%l7 + 0x44],	 0x3
	tcs	%xcc,	0x5
	set	0x42, %o3
	ldstuba	[%l7 + %o3] 0x0c,	%l6
	fmovdn	%xcc,	%f30,	%f3
	edge32l	%g7,	%g5,	%l0
	addccc	%g4,	%o5,	%g1
	movle	%icc,	%i5,	%i3
	fmul8sux16	%f0,	%f4,	%f6
	fsrc1s	%f3,	%f14
	call	loop_1536
	bneg,a,pn	%xcc,	loop_1537
	brgz	%i7,	loop_1538
	move	%xcc,	%i1,	%i0
loop_1536:
	edge16n	%i4,	%i2,	%o2
loop_1537:
	edge32ln	%o0,	%o6,	%l5
loop_1538:
	movvs	%icc,	%o4,	%g2
	tcs	%xcc,	0x6
	movpos	%icc,	%l2,	%l1
	sdivx	%g3,	0x0D21,	%l3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%o1
	taddcctv	%o7,	0x0827,	%i6
	fmovsgu	%xcc,	%f9,	%f25
	fba,a	%fcc1,	loop_1539
	move	%xcc,	%g6,	%o3
	movre	%l4,	0x162,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1539:
	or	%g5,	0x1CC6,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l0,	%o5
	sth	%g1,	[%l7 + 0x2C]
	fmovrdgez	%g4,	%f0,	%f30
	edge8ln	%i3,	%i5,	%i7
	movl	%xcc,	%i1,	%i4
	tg	%xcc,	0x2
	fbo	%fcc2,	loop_1540
	subcc	%i2,	%i0,	%o0
	movrlez	%o2,	0x008,	%l5
	array16	%o4,	%o6,	%l2
loop_1540:
	tvs	%icc,	0x7
	mulscc	%g2,	0x1FE0,	%l1
	fbo,a	%fcc1,	loop_1541
	fblg	%fcc3,	loop_1542
	fbug	%fcc2,	loop_1543
	fbo	%fcc0,	loop_1544
loop_1541:
	tg	%icc,	0x3
loop_1542:
	edge16	%l3,	%g3,	%o1
loop_1543:
	movcs	%icc,	%o7,	%i6
loop_1544:
	sdiv	%o3,	0x09D9,	%g6
	movneg	%icc,	%l4,	%g7
	set	0x20, %g4
	stxa	%g5,	[%l7 + %g4] 0x89
	movn	%xcc,	%l6,	%l0
	fmovrsne	%o5,	%f1,	%f26
	andncc	%g4,	%i3,	%i5
	tsubcctv	%i7,	%g1,	%i4
	andcc	%i2,	0x1D09,	%i1
	srl	%o0,	0x0D,	%o2
	fbl	%fcc3,	loop_1545
	tsubcctv	%i0,	%l5,	%o4
	fbule,a	%fcc0,	loop_1546
	ldd	[%l7 + 0x08],	%o6
loop_1545:
	ldub	[%l7 + 0x61],	%g2
	fmovscs	%icc,	%f6,	%f16
loop_1546:
	fpadd32s	%f18,	%f16,	%f13
	edge16	%l2,	%l3,	%g3
	udivcc	%l1,	0x1CA2,	%o1
	orcc	%i6,	0x1D13,	%o7
	sra	%g6,	0x18,	%o3
	tcs	%icc,	0x6
	fnot1	%f26,	%f0
	array8	%l4,	%g5,	%l6
	bneg	%icc,	loop_1547
	sth	%g7,	[%l7 + 0x34]
	swap	[%l7 + 0x68],	%o5
	fbue	%fcc3,	loop_1548
loop_1547:
	nop
	setx loop_1549, %l0, %l1
	jmpl %l1, %g4
	array32	%i3,	%l0,	%i7
	edge8ln	%g1,	%i4,	%i2
loop_1548:
	edge8ln	%i5,	%o0,	%o2
loop_1549:
	edge16ln	%i1,	%i0,	%l5
	fbe	%fcc0,	loop_1550
	movrgz	%o6,	0x1BB,	%g2
	fmovsneg	%xcc,	%f25,	%f21
	add	%l2,	0x0066,	%o4
loop_1550:
	taddcctv	%l3,	%g3,	%o1
	fbne	%fcc0,	loop_1551
	edge32l	%i6,	%o7,	%g6
	edge8n	%l1,	%l4,	%o3
	movrgez	%l6,	%g5,	%o5
loop_1551:
	edge16ln	%g4,	%g7,	%l0
	smul	%i7,	%g1,	%i4
	edge32l	%i2,	%i3,	%i5
	tcs	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o2,	%o0,	%i1
	edge8n	%l5,	%o6,	%g2
	sll	%l2,	0x10,	%o4
	set	0x24, %g1
	swapa	[%l7 + %g1] 0x80,	%i0
	array8	%g3,	%o1,	%l3
	fbo	%fcc2,	loop_1552
	srax	%o7,	0x05,	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%l4
loop_1552:
	edge32	%g6,	%l6,	%g5
	umul	%o5,	%g4,	%g7
	fandnot2	%f28,	%f26,	%f8
	fbo,a	%fcc0,	loop_1553
	udivx	%l0,	0x191C,	%i7
	taddcctv	%g1,	0x06D2,	%o3
	taddcctv	%i4,	%i3,	%i2
loop_1553:
	bvc	%icc,	loop_1554
	tg	%icc,	0x3
	fornot2	%f20,	%f12,	%f18
	addcc	%i5,	0x0DA6,	%o2
loop_1554:
	srax	%i1,	%o0,	%o6
	array8	%l5,	%l2,	%g2
	fnor	%f26,	%f18,	%f26
	udivx	%o4,	0x0953,	%i0
	array16	%o1,	%g3,	%l3
	call	loop_1555
	bl,pn	%icc,	loop_1556
	movg	%icc,	%o7,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1555:
	fxnor	%f8,	%f30,	%f4
loop_1556:
	fxors	%f4,	%f14,	%f24
	fblg,a	%fcc0,	loop_1557
	movrgez	%l4,	0x31E,	%g6
	tcc	%xcc,	0x5
	sub	%l6,	0x118B,	%l1
loop_1557:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%g4
	udivcc	%o5,	0x1C59,	%l0
	stbar
	fcmple32	%f12,	%f28,	%i7
	andcc	%g1,	0x083B,	%o3
	fcmped	%fcc1,	%f26,	%f28
	fmovsvs	%xcc,	%f1,	%f29
	tle	%xcc,	0x1
	udiv	%i4,	0x0428,	%i3
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g7
	movg	%xcc,	%i2,	%o2
	fmovdleu	%xcc,	%f2,	%f1
	fbge,a	%fcc0,	loop_1558
	sethi	0x1789,	%i1
	ldd	[%l7 + 0x20],	%i4
	add	%o6,	0x02B7,	%o0
loop_1558:
	swap	[%l7 + 0x40],	%l5
	movn	%xcc,	%g2,	%o4
	ldd	[%l7 + 0x70],	%l2
	xorcc	%o1,	0x1466,	%i0
	andn	%g3,	%o7,	%i6
	std	%l4,	[%l7 + 0x70]
	fble,a	%fcc0,	loop_1559
	fmovrdgz	%g6,	%f16,	%f12
	array32	%l3,	%l6,	%l1
	pdist	%f20,	%f24,	%f30
loop_1559:
	tcc	%xcc,	0x7
	subccc	%g5,	0x01B3,	%g4
	fnands	%f16,	%f18,	%f31
	movvc	%xcc,	%o5,	%i7
	fbl,a	%fcc3,	loop_1560
	te	%xcc,	0x3
	brlz,a	%g1,	loop_1561
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1560:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1C] %asi,	%l0
loop_1561:
	bshuffle	%f4,	%f28,	%f2
	umul	%o3,	%i3,	%i4
	edge32l	%g7,	%o2,	%i1
	andncc	%i5,	%o6,	%i2
	addc	%o0,	0x0E94,	%g2
	fbo	%fcc3,	loop_1562
	movrlez	%o4,	0x16E,	%l5
	fmovdcc	%xcc,	%f21,	%f31
	umulcc	%o1,	%l2,	%i0
loop_1562:
	xnorcc	%o7,	%g3,	%i6
	movneg	%xcc,	%g6,	%l4
	fmovde	%xcc,	%f6,	%f24
	stbar
	bl,pn	%icc,	loop_1563
	fbn,a	%fcc0,	loop_1564
	fzeros	%f15
	add	%l6,	0x0AB1,	%l1
loop_1563:
	movgu	%icc,	%l3,	%g4
loop_1564:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x61] %asi,	%g5
	ldd	[%l7 + 0x40],	%f26
	mulscc	%o5,	%i7,	%g1
	ta	%xcc,	0x2
	movre	%o3,	%l0,	%i4
	fbul	%fcc1,	loop_1565
	fble,a	%fcc0,	loop_1566
	fornot2s	%f8,	%f15,	%f5
	fmovda	%icc,	%f2,	%f13
loop_1565:
	ld	[%l7 + 0x30],	%f25
loop_1566:
	fmovrdgz	%i3,	%f16,	%f0
	tvc	%xcc,	0x3
	taddcc	%g7,	0x05EE,	%o2
	ldub	[%l7 + 0x24],	%i5
	fornot2	%f0,	%f2,	%f10
	fnors	%f3,	%f5,	%f27
	fmovdle	%xcc,	%f4,	%f24
	fpadd32	%f0,	%f2,	%f18
	edge32	%i1,	%i2,	%o0
	brlez,a	%o6,	loop_1567
	st	%f23,	[%l7 + 0x2C]
	ta	%xcc,	0x1
	fmovsgu	%icc,	%f11,	%f26
loop_1567:
	stbar
	fcmpne32	%f6,	%f16,	%o4
	edge8	%g2,	%o1,	%l5
	fmovsgu	%icc,	%f7,	%f24
	addcc	%l2,	%o7,	%i0
	std	%f30,	[%l7 + 0x30]
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	flush	%l7 + 0x34
	udiv	%g6,	0x0635,	%l4
	fands	%f5,	%f25,	%f18
	movleu	%icc,	%g3,	%l6
	fbu,a	%fcc2,	loop_1568
	tpos	%xcc,	0x4
	edge16	%l3,	%g4,	%l1
	fbuge	%fcc3,	loop_1569
loop_1568:
	sdivx	%g5,	0x1B36,	%i7
	tn	%xcc,	0x0
	fmovdl	%xcc,	%f4,	%f6
loop_1569:
	alignaddr	%g1,	%o3,	%l0
	sll	%i4,	%o5,	%g7
	fmovrdlz	%o2,	%f12,	%f14
	edge8	%i5,	%i1,	%i2
	andncc	%o0,	%i3,	%o4
	sra	%o6,	0x0A,	%o1
	tl	%xcc,	0x1
	tne	%icc,	0x0
	and	%g2,	%l2,	%l5
	array32	%o7,	%i0,	%i6
	subc	%g6,	0x171B,	%l4
	fmuld8ulx16	%f9,	%f9,	%f0
	brz	%l6,	loop_1570
	movre	%g3,	0x25F,	%l3
	fmovrde	%l1,	%f30,	%f8
	wr	%g0,	0x27,	%asi
	stba	%g5,	[%l7 + 0x3A] %asi
	membar	#Sync
loop_1570:
	stw	%i7,	[%l7 + 0x24]
	fmovrdgez	%g4,	%f12,	%f2
	brgz,a	%o3,	loop_1571
	tpos	%icc,	0x6
	sethi	0x1516,	%g1
	fsrc2	%f4,	%f8
loop_1571:
	array16	%i4,	%l0,	%g7
	fmovrdlez	%o2,	%f0,	%f0
	ldsh	[%l7 + 0x34],	%i5
	fcmpeq32	%f0,	%f26,	%o5
	movpos	%xcc,	%i1,	%o0
	edge32	%i3,	%o4,	%i2
	tl	%xcc,	0x6
	edge32n	%o1,	%o6,	%g2
	fbn,a	%fcc3,	loop_1572
	movcs	%xcc,	%l2,	%o7
	bgu,a,pt	%icc,	loop_1573
	ldx	[%l7 + 0x48],	%i0
loop_1572:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x4
loop_1573:
	array32	%i6,	%l5,	%g6
	fandnot1	%f22,	%f26,	%f26
	movgu	%xcc,	%l4,	%l6
	edge16l	%l3,	%g3,	%l1
	subccc	%g5,	0x03A1,	%i7
	fmovsneg	%xcc,	%f20,	%f2
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x15
	edge8n	%g4,	%g1,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o3,	%g7
	sir	0x0A08
	fmul8ulx16	%f8,	%f30,	%f16
	fcmpne16	%f30,	%f0,	%o2
	add	%l0,	%o5,	%i5
	fandnot1s	%f18,	%f14,	%f5
	tne	%xcc,	0x7
	fmovrdgz	%o0,	%f14,	%f6
	subcc	%i1,	0x0C71,	%i3
	tge	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x0C] %asi,	%o4
	fmovrdne	%o1,	%f30,	%f6
	popc	%o6,	%i2
	brlez	%g2,	loop_1574
	ta	%icc,	0x0
	pdist	%f0,	%f0,	%f12
	movcc	%icc,	%o7,	%l2
loop_1574:
	addc	%i6,	%i0,	%g6
	bneg,pn	%icc,	loop_1575
	movvs	%icc,	%l4,	%l6
	udivx	%l5,	0x01D3,	%g3
	sethi	0x08E3,	%l3
loop_1575:
	nop
	set	0x78, %l4
	lduwa	[%l7 + %l4] 0x18,	%g5
	srlx	%i7,	%g4,	%l1
	movle	%xcc,	%g1,	%o3
	tg	%icc,	0x7
	fbu,a	%fcc2,	loop_1576
	movneg	%xcc,	%g7,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f8,	%f8,	%f26
loop_1576:
	fcmpgt32	%f6,	%f28,	%l0
	fpadd32s	%f4,	%f25,	%f21
	fcmps	%fcc3,	%f23,	%f30
	sub	%i4,	0x1EB3,	%o5
	tcs	%xcc,	0x2
	tcc	%icc,	0x5
	movge	%xcc,	%o0,	%i1
	movleu	%icc,	%i5,	%i3
	fnegs	%f23,	%f0
	fmovdneg	%icc,	%f28,	%f1
	subcc	%o4,	0x1866,	%o6
	movl	%xcc,	%o1,	%i2
	fmovsne	%icc,	%f29,	%f13
	std	%g2,	[%l7 + 0x58]
	st	%f17,	[%l7 + 0x0C]
	edge8n	%l2,	%i6,	%i0
	nop
	set	0x62, %l3
	sth	%g6,	[%l7 + %l3]
	ldstub	[%l7 + 0x7A],	%o7
	fnand	%f26,	%f6,	%f24
	edge32n	%l6,	%l4,	%l5
	fmovrde	%l3,	%f12,	%f10
	movrlz	%g5,	%i7,	%g3
	bg,a,pn	%xcc,	loop_1577
	movrne	%g4,	%g1,	%l1
	sdivx	%o3,	0x0D5A,	%g7
	edge8n	%o2,	%l0,	%i4
loop_1577:
	movge	%xcc,	%o5,	%i1
	bl	%xcc,	loop_1578
	mova	%icc,	%i5,	%o0
	subccc	%i3,	0x02A5,	%o6
	popc	%o1,	%i2
loop_1578:
	fmovsne	%icc,	%f6,	%f29
	mulscc	%o4,	%g2,	%i6
	fcmpeq32	%f10,	%f0,	%l2
	tgu	%icc,	0x2
	taddcc	%g6,	0x1CD9,	%o7
	popc	%l6,	%i0
	andn	%l4,	%l5,	%l3
	sllx	%i7,	0x16,	%g3
	movrlez	%g4,	%g1,	%g5
	std	%f8,	[%l7 + 0x40]
	flush	%l7 + 0x4C
	fble,a	%fcc2,	loop_1579
	addcc	%o3,	%g7,	%o2
	tvs	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%l0
loop_1579:
	tneg	%icc,	0x0
	set	0x5C, %g3
	swapa	[%l7 + %g3] 0x88,	%l1
	fbn,a	%fcc1,	loop_1580
	xorcc	%o5,	%i1,	%i5
	ld	[%l7 + 0x30],	%f19
	edge16l	%i4,	%o0,	%o6
loop_1580:
	array16	%i3,	%i2,	%o1
	fmovsvc	%icc,	%f20,	%f8
	fbn	%fcc0,	loop_1581
	subccc	%o4,	0x1678,	%i6
	alignaddr	%l2,	%g2,	%g6
	call	loop_1582
loop_1581:
	tvs	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f10,	[%l7 + 0x20]
loop_1582:
	tcc	%xcc,	0x1
	udivx	%l6,	0x115D,	%i0
	fmovdge	%icc,	%f16,	%f1
	set	0x24, %i6
	lda	[%l7 + %i6] 0x18,	%f14
	edge16l	%o7,	%l4,	%l5
	fbge	%fcc2,	loop_1583
	subc	%l3,	0x1953,	%i7
	edge8ln	%g3,	%g1,	%g4
	movrgz	%g5,	%o3,	%g7
loop_1583:
	fnands	%f6,	%f31,	%f8
	or	%o2,	%l1,	%o5
	fcmpgt16	%f24,	%f12,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i5,	%i1
	fmovsvs	%icc,	%f16,	%f27
	set	0x68, %g2
	stha	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	subcc	%o0,	%o6,	%i3
	brz,a	%i2,	loop_1584
	tsubcctv	%o1,	%o4,	%l2
	fbge	%fcc3,	loop_1585
	bne,pn	%xcc,	loop_1586
loop_1584:
	fmovsvc	%xcc,	%f1,	%f19
	movrlez	%g2,	0x02B,	%i6
loop_1585:
	edge32ln	%l6,	%g6,	%o7
loop_1586:
	brgz,a	%i0,	loop_1587
	nop
	set	0x6E, %g7
	ldsb	[%l7 + %g7],	%l4
	fnot1s	%f16,	%f21
	smul	%l3,	%l5,	%g3
loop_1587:
	andncc	%i7,	%g4,	%g5
	srl	%o3,	%g1,	%o2
	fmovdvc	%xcc,	%f15,	%f22
	addccc	%l1,	%g7,	%l0
	edge16n	%o5,	%i1,	%i5
	fmovsneg	%icc,	%f24,	%f15
	stx	%i4,	[%l7 + 0x58]
	orcc	%o6,	%i3,	%o0
	tn	%xcc,	0x1
	movneg	%xcc,	%i2,	%o1
	subc	%o4,	0x0141,	%g2
	sdivcc	%i6,	0x12B0,	%l2
	add	%l6,	0x03E9,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%g6
	smulcc	%l3,	0x044C,	%l5
	stb	%g3,	[%l7 + 0x75]
	udivcc	%l4,	0x165E,	%i7
	fandnot2	%f18,	%f14,	%f12
	be,a	loop_1588
	fmuld8ulx16	%f8,	%f8,	%f22
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%g5
loop_1588:
	fbg,a	%fcc1,	loop_1589
	bne,a,pn	%xcc,	loop_1590
	tcs	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1589:
	fmul8x16al	%f6,	%f17,	%f4
loop_1590:
	fmovsvs	%icc,	%f28,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o3,	%g4,	%o2
	tge	%xcc,	0x1
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x11
	fpsub32s	%f15,	%f30,	%f8
	edge32n	%g1,	%l1,	%l0
	sllx	%o5,	0x19,	%g7
	fnor	%f18,	%f30,	%f26
	movl	%xcc,	%i5,	%i4
	sllx	%i1,	0x0D,	%o6
	andncc	%i3,	%o0,	%i2
	udivx	%o1,	0x10E8,	%g2
	movre	%o4,	%l2,	%i6
	movre	%o7,	%l6,	%g6
	edge32	%i0,	%l5,	%l3
	smulcc	%l4,	0x0F44,	%g3
	taddcc	%g5,	%i7,	%g4
	sdiv	%o3,	0x1935,	%g1
	smulcc	%l1,	%o2,	%l0
	movleu	%xcc,	%g7,	%o5
	set	0x20, %o2
	stxa	%i5,	[%l7 + %o2] 0x19
	movn	%xcc,	%i1,	%i4
	stw	%o6,	[%l7 + 0x0C]
	set	0x70, %i4
	stda	%o0,	[%l7 + %i4] 0xe2
	membar	#Sync
	fbge	%fcc0,	loop_1591
	sdivcc	%i3,	0x0A19,	%i2
	mova	%xcc,	%o1,	%g2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%l2
loop_1591:
	srl	%i6,	%o7,	%o4
	xorcc	%l6,	0x1F2C,	%i0
	addccc	%l5,	%g6,	%l4
	addcc	%g3,	%g5,	%i7
	tge	%xcc,	0x2
	edge8ln	%g4,	%l3,	%o3
	array8	%g1,	%o2,	%l0
	edge16ln	%g7,	%o5,	%i5
	umulcc	%i1,	%i4,	%o6
	movpos	%icc,	%o0,	%i3
	std	%f24,	[%l7 + 0x78]
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l1
	edge32n	%o1,	%g2,	%i2
	fmovrslez	%i6,	%f3,	%f28
	edge32ln	%l2,	%o4,	%l6
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf9
	membar	#Sync
	sdivx	%o7,	0x138B,	%l5
	nop
	setx loop_1592, %l0, %l1
	jmpl %l1, %i0
	stbar
	ldsh	[%l7 + 0x24],	%g6
	brlz	%g3,	loop_1593
loop_1592:
	fmovdle	%icc,	%f0,	%f24
	edge32	%l4,	%i7,	%g4
	edge16l	%l3,	%g5,	%o3
loop_1593:
	nop
	set	0x0B, %o6
	ldsba	[%l7 + %o6] 0x04,	%o2
	smulcc	%l0,	%g7,	%o5
	sth	%i5,	[%l7 + 0x72]
	fmovdcc	%xcc,	%f31,	%f2
	fnegd	%f2,	%f6
	xor	%g1,	%i4,	%i1
	fmovdvs	%xcc,	%f9,	%f8
	mulscc	%o6,	%o0,	%i3
	fmovse	%icc,	%f20,	%f2
	srax	%l1,	0x02,	%g2
	mova	%icc,	%i2,	%i6
	orn	%l2,	0x1242,	%o4
	brgz	%o1,	loop_1594
	movne	%icc,	%o7,	%l6
	brlz	%i0,	loop_1595
	fandnot1s	%f10,	%f15,	%f11
loop_1594:
	xnor	%l5,	0x019A,	%g6
	sdivcc	%l4,	0x114E,	%i7
loop_1595:
	tg	%icc,	0x5
	wr	%g0,	0x04,	%asi
	sta	%f24,	[%l7 + 0x20] %asi
	fbg	%fcc2,	loop_1596
	nop
	set	0x12, %l1
	ldstub	[%l7 + %l1],	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g3,	%g5
loop_1596:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0C] %asi,	%l3
	ba,pt	%xcc,	loop_1597
	tgu	%icc,	0x2
	edge32n	%o2,	%o3,	%l0
	fpack32	%f8,	%f14,	%f8
loop_1597:
	movge	%icc,	%g7,	%i5
	bn,a	%icc,	loop_1598
	edge8ln	%g1,	%o5,	%i4
	xnor	%o6,	0x1712,	%o0
	orn	%i3,	%l1,	%i1
loop_1598:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fba	%fcc1,	loop_1599
	and	%i2,	%g2,	%i6
	tcs	%icc,	0x7
	fpsub32s	%f5,	%f1,	%f20
loop_1599:
	andcc	%l2,	0x1598,	%o1
	bvc,a	loop_1600
	edge16	%o7,	%l6,	%i0
	tcc	%xcc,	0x4
	sll	%l5,	0x1A,	%g6
loop_1600:
	flush	%l7 + 0x1C
	addc	%o4,	0x158F,	%i7
	movpos	%icc,	%l4,	%g3
	fornot1	%f6,	%f20,	%f14
	movneg	%xcc,	%g5,	%l3
	movg	%xcc,	%g4,	%o2
	movre	%l0,	0x132,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o3,	%i5
	movrgez	%g1,	%i4,	%o5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x40] %asi,	%o0
	addccc	%i3,	0x153A,	%o6
	xnorcc	%l1,	%i1,	%g2
	andcc	%i2,	0x06F9,	%i6
	brgez,a	%l2,	loop_1601
	smulcc	%o7,	%o1,	%l6
	sdivx	%i0,	0x0739,	%l5
	or	%g6,	0x0D39,	%i7
loop_1601:
	tn	%xcc,	0x6
	fsrc2s	%f8,	%f9
	std	%f28,	[%l7 + 0x38]
	sth	%o4,	[%l7 + 0x6A]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%l4,	%g5
	set	0x34, %g6
	lduwa	[%l7 + %g6] 0x15,	%g3
	andn	%l3,	0x0F1D,	%g4
	and	%o2,	0x0E01,	%g7
	edge16l	%o3,	%l0,	%g1
	set	0x1B, %i5
	ldsba	[%l7 + %i5] 0x19,	%i4
	tle	%xcc,	0x7
	movneg	%xcc,	%i5,	%o5
	mova	%xcc,	%o0,	%i3
	orncc	%o6,	%i1,	%l1
	andcc	%g2,	0x1CF9,	%i6
	xor	%l2,	%o7,	%o1
	sdiv	%l6,	0x08C6,	%i0
	nop
	setx loop_1602, %l0, %l1
	jmpl %l1, %l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x5
	subccc	%i2,	0x1264,	%g6
loop_1602:
	fbe	%fcc2,	loop_1603
	be,pt	%xcc,	loop_1604
	mulx	%i7,	0x0111,	%o4
	edge32l	%g5,	%l4,	%l3
loop_1603:
	or	%g4,	0x1B53,	%g3
loop_1604:
	fnot1s	%f9,	%f14
	movrne	%g7,	%o3,	%l0
	fmovdge	%xcc,	%f4,	%f25
	sdivcc	%o2,	0x1680,	%g1
	bg,a	loop_1605
	ldsh	[%l7 + 0x3C],	%i4
	ldsw	[%l7 + 0x08],	%i5
	flush	%l7 + 0x14
loop_1605:
	fabss	%f22,	%f1
	swap	[%l7 + 0x38],	%o0
	edge16n	%o5,	%i3,	%i1
	umulcc	%l1,	%g2,	%i6
	faligndata	%f28,	%f8,	%f6
	fbn,a	%fcc1,	loop_1606
	fbge	%fcc3,	loop_1607
	or	%o6,	%l2,	%o1
	movgu	%xcc,	%o7,	%l6
loop_1606:
	edge32l	%l5,	%i0,	%i2
loop_1607:
	movle	%xcc,	%i7,	%o4
	tcc	%icc,	0x5
	sir	0x1EFB
	sdivcc	%g5,	0x0E38,	%g6
	fmul8sux16	%f10,	%f16,	%f16
	sdivx	%l3,	0x1C29,	%l4
	fmovscc	%icc,	%f21,	%f10
	smulcc	%g4,	%g3,	%g7
	edge32n	%o3,	%l0,	%o2
	call	loop_1608
	sdivcc	%g1,	0x0B61,	%i5
	sub	%o0,	0x07D8,	%o5
	fpack32	%f10,	%f28,	%f28
loop_1608:
	edge8ln	%i3,	%i4,	%l1
	fmovdpos	%xcc,	%f15,	%f12
	fmul8x16al	%f7,	%f17,	%f4
	sethi	0x1F00,	%i1
	smulcc	%g2,	0x0191,	%i6
	fbuge	%fcc1,	loop_1609
	stb	%l2,	[%l7 + 0x10]
	taddcc	%o6,	%o1,	%l6
	movne	%icc,	%o7,	%l5
loop_1609:
	orcc	%i0,	0x1598,	%i7
	mova	%xcc,	%i2,	%g5
	mova	%xcc,	%g6,	%l3
	tsubcctv	%o4,	0x1114,	%g4
	tleu	%icc,	0x3
	tne	%xcc,	0x2
	udivx	%l4,	0x0160,	%g7
	sdivx	%g3,	0x129E,	%o3
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x14] %asi,	%o2
	fmovrsgz	%l0,	%f24,	%f4
	ta	%icc,	0x6
	movle	%xcc,	%g1,	%i5
	movcc	%icc,	%o5,	%i3
	edge8l	%o0,	%l1,	%i1
	fnot1	%f14,	%f2
	tgu	%xcc,	0x2
	edge16ln	%g2,	%i4,	%i6
	bcc	loop_1610
	edge8n	%l2,	%o1,	%o6
	edge32l	%l6,	%o7,	%l5
	fpmerge	%f23,	%f16,	%f20
loop_1610:
	sdivx	%i7,	0x0F12,	%i2
	edge8ln	%g5,	%g6,	%i0
	addccc	%o4,	%l3,	%l4
	smulcc	%g4,	%g3,	%g7
	fnor	%f22,	%f10,	%f6
	tpos	%xcc,	0x3
	fcmpd	%fcc3,	%f22,	%f14
	lduw	[%l7 + 0x44],	%o2
	movrgez	%l0,	%g1,	%i5
	set	0x44, %o4
	sta	%f22,	[%l7 + %o4] 0x10
	fbne,a	%fcc2,	loop_1611
	fnot1	%f18,	%f8
	umulcc	%o5,	0x076D,	%o3
	umul	%o0,	0x1C71,	%i3
loop_1611:
	movg	%icc,	%l1,	%i1
	bleu	loop_1612
	fones	%f5
	edge8	%g2,	%i6,	%l2
	movrlez	%o1,	%o6,	%l6
loop_1612:
	fnegs	%f15,	%f13
	andncc	%i4,	%l5,	%i7
	edge32l	%o7,	%i2,	%g6
	andcc	%i0,	0x169B,	%g5
	fbul	%fcc3,	loop_1613
	ldsw	[%l7 + 0x28],	%l3
	wr	%g0,	0x18,	%asi
	stha	%l4,	[%l7 + 0x42] %asi
loop_1613:
	fzero	%f28
	fandnot1	%f0,	%f26,	%f4
	fmovsneg	%icc,	%f26,	%f22
	movleu	%xcc,	%g4,	%g3
	tcc	%xcc,	0x4
	movvs	%icc,	%o4,	%o2
	srax	%g7,	0x1D,	%l0
	array32	%g1,	%o5,	%o3
	bne,a	loop_1614
	tvs	%icc,	0x4
	fmul8x16au	%f30,	%f14,	%f14
	sdiv	%o0,	0x0AC0,	%i5
loop_1614:
	edge16l	%l1,	%i3,	%g2
	wr	%g0,	0x2a,	%asi
	stwa	%i1,	[%l7 + 0x1C] %asi
	membar	#Sync
	bvs,a,pt	%icc,	loop_1615
	fpsub32s	%f23,	%f26,	%f24
	fmovdcs	%icc,	%f20,	%f16
	tvs	%icc,	0x3
loop_1615:
	bpos,a	loop_1616
	tleu	%icc,	0x6
	tgu	%xcc,	0x4
	fcmple32	%f18,	%f16,	%i6
loop_1616:
	fnegs	%f10,	%f10
	srax	%l2,	0x0E,	%o1
	srl	%l6,	%i4,	%o6
	srlx	%i7,	0x04,	%l5
	for	%f14,	%f28,	%f22
	tcc	%xcc,	0x6
	tle	%icc,	0x2
	popc	0x043C,	%i2
	smulcc	%o7,	%g6,	%i0
	nop
	setx	loop_1617,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%l3,	%g5,	%g4
	movre	%g3,	0x0FA,	%l4
	fpadd32s	%f2,	%f15,	%f20
loop_1617:
	fbe,a	%fcc0,	loop_1618
	fmuld8sux16	%f27,	%f27,	%f16
	fsrc2s	%f0,	%f18
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%o2
loop_1618:
	fcmpd	%fcc1,	%f6,	%f18
	alignaddrl	%o4,	%g7,	%l0
	array16	%g1,	%o5,	%o3
	tsubcc	%i5,	%o0,	%l1
	array32	%g2,	%i3,	%i6
	fbne	%fcc3,	loop_1619
	tcc	%xcc,	0x4
	movvs	%xcc,	%l2,	%i1
	bpos	loop_1620
loop_1619:
	movle	%xcc,	%o1,	%l6
	tcc	%icc,	0x7
	fpack32	%f28,	%f24,	%f24
loop_1620:
	nop
	set	0x2A, %i7
	lduha	[%l7 + %i7] 0x18,	%o6
	movvc	%icc,	%i4,	%l5
	tneg	%icc,	0x4
	st	%f20,	[%l7 + 0x4C]
	sra	%i7,	%o7,	%g6
	ba	loop_1621
	stw	%i2,	[%l7 + 0x34]
	ldd	[%l7 + 0x60],	%l2
	fpsub16s	%f5,	%f4,	%f1
loop_1621:
	bleu,pn	%icc,	loop_1622
	tneg	%icc,	0x1
	fmovda	%icc,	%f23,	%f18
	fmovdvs	%icc,	%f17,	%f17
loop_1622:
	fmovdcc	%icc,	%f12,	%f3
	sdivcc	%i0,	0x07BA,	%g5
	edge16l	%g4,	%g3,	%l4
	tpos	%xcc,	0x6
	movrgez	%o2,	0x278,	%o4
	fmovdcs	%icc,	%f9,	%f0
	fmovdg	%icc,	%f4,	%f18
	edge16ln	%l0,	%g7,	%o5
	add	%g1,	%o3,	%o0
	sdiv	%i5,	0x1812,	%l1
	fmovrdgez	%g2,	%f24,	%f26
	nop
	setx loop_1623, %l0, %l1
	jmpl %l1, %i6
	movn	%icc,	%i3,	%i1
	orcc	%l2,	0x117A,	%o1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x14,	%f0
loop_1623:
	tle	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc0,	loop_1624
	brz	%o6,	loop_1625
	tleu	%icc,	0x3
	edge8	%i4,	%l6,	%i7
loop_1624:
	fcmpes	%fcc2,	%f26,	%f3
loop_1625:
	bpos,pn	%xcc,	loop_1626
	tsubcctv	%o7,	%g6,	%l5
	bcs,pn	%xcc,	loop_1627
	addcc	%l3,	0x05B8,	%i2
loop_1626:
	tgu	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g5
loop_1627:
	edge32l	%g4,	%g3,	%l4
	fmovrdlez	%o2,	%f30,	%f18
	addccc	%o4,	0x04B4,	%i0
	fbuge,a	%fcc0,	loop_1628
	alignaddrl	%g7,	%l0,	%g1
	tneg	%xcc,	0x0
	bcs	loop_1629
loop_1628:
	bcc,pn	%xcc,	loop_1630
	fpackfix	%f0,	%f25
	tpos	%xcc,	0x2
loop_1629:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
loop_1630:
	std	%o0,	[%l7 + 0x18]
	wr	%g0,	0x10,	%asi
	stxa	%o5,	[%l7 + 0x18] %asi
	tn	%xcc,	0x7
	call	loop_1631
	brgez,a	%i5,	loop_1632
	fone	%f28
	movvs	%icc,	%l1,	%i6
loop_1631:
	edge8l	%i3,	%g2,	%l2
loop_1632:
	umulcc	%i1,	%o6,	%i4
	movrne	%l6,	%o1,	%i7
	ta	%xcc,	0x5
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sdiv	%o7,	0x1E2C,	%g6
	array16	%l5,	%i2,	%l3
	udivx	%g5,	0x0FD6,	%g3
	bvc,pn	%xcc,	loop_1633
	edge8l	%g4,	%l4,	%o4
	fblg	%fcc0,	loop_1634
	movne	%xcc,	%i0,	%g7
loop_1633:
	fbn	%fcc0,	loop_1635
	fmovsn	%xcc,	%f5,	%f28
loop_1634:
	bshuffle	%f22,	%f30,	%f2
	fnands	%f30,	%f19,	%f11
loop_1635:
	edge16n	%l0,	%o2,	%o3
	fmovsn	%xcc,	%f8,	%f19
	xnor	%o0,	0x0E9C,	%o5
	orcc	%g1,	0x047C,	%l1
	ta	%xcc,	0x6
	andn	%i5,	%i6,	%i3
	tleu	%xcc,	0x5
	fsrc2	%f12,	%f20
	movn	%xcc,	%l2,	%i1
	subc	%o6,	0x070D,	%g2
	edge16l	%i4,	%o1,	%l6
	fands	%f14,	%f22,	%f19
	movg	%xcc,	%i7,	%g6
	ldd	[%l7 + 0x78],	%l4
	fbg,a	%fcc3,	loop_1636
	srl	%i2,	%l3,	%o7
	udiv	%g3,	0x13F9,	%g4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%l4
loop_1636:
	fmul8x16au	%f2,	%f27,	%f10
	addc	%i0,	0x19C4,	%o4
	st	%f27,	[%l7 + 0x78]
	mulx	%l0,	0x12AB,	%o2
	fbn,a	%fcc2,	loop_1637
	umul	%o3,	%g7,	%o5
	tcs	%xcc,	0x5
	movrgez	%g1,	%l1,	%i5
loop_1637:
	edge8l	%o0,	%i6,	%i3
	fabss	%f3,	%f21
	edge16n	%l2,	%o6,	%g2
	edge32ln	%i4,	%i1,	%o1
	stb	%i7,	[%l7 + 0x2B]
	tvs	%icc,	0x1
	brgez	%g6,	loop_1638
	sdivcc	%l6,	0x1EC4,	%i2
	sub	%l3,	0x0C1C,	%l5
	fzeros	%f14
loop_1638:
	tl	%xcc,	0x6
	siam	0x0
	fandnot2s	%f21,	%f1,	%f1
	edge8ln	%g3,	%g4,	%g5
	edge32l	%o7,	%l4,	%o4
	orcc	%i0,	%o2,	%l0
	ldd	[%l7 + 0x30],	%g6
	edge8n	%o3,	%g1,	%l1
	brgez	%i5,	loop_1639
	fbue	%fcc2,	loop_1640
	sdivcc	%o0,	0x100D,	%i6
	fbe	%fcc0,	loop_1641
loop_1639:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1640:
	fba,a	%fcc0,	loop_1642
	fcmpes	%fcc0,	%f11,	%f21
loop_1641:
	edge32ln	%i3,	%l2,	%o5
	andcc	%g2,	0x12A6,	%o6
loop_1642:
	movrgz	%i1,	%o1,	%i4
	mova	%icc,	%i7,	%g6
	sethi	0x082E,	%i2
	bg	%icc,	loop_1643
	fsrc1	%f26,	%f8
	fpsub32s	%f22,	%f18,	%f24
	tpos	%icc,	0x7
loop_1643:
	tpos	%xcc,	0x3
	set	0x4A, %l0
	stha	%l3,	[%l7 + %l0] 0x10
	fones	%f12
	fbge	%fcc3,	loop_1644
	fmul8x16al	%f17,	%f16,	%f30
	fmovsn	%xcc,	%f6,	%f3
	fpmerge	%f30,	%f12,	%f10
loop_1644:
	mulx	%l5,	%g3,	%l6
	sllx	%g5,	%g4,	%o7
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o4
	array32	%i0,	%o2,	%l4
	mova	%xcc,	%g7,	%o3
	fmovrdgez	%g1,	%f18,	%f22
	udiv	%l1,	0x0403,	%l0
	fmovde	%icc,	%f20,	%f29
	fnegd	%f28,	%f0
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%i5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x1A] %asi,	%o0
	subcc	%i6,	%l2,	%o5
	movg	%xcc,	%g2,	%i3
	edge16l	%i1,	%o1,	%i4
	mulx	%o6,	%g6,	%i2
	bcc,pt	%xcc,	loop_1645
	edge32n	%l3,	%l5,	%g3
	movcc	%icc,	%i7,	%g5
	alignaddr	%g4,	%o7,	%o4
loop_1645:
	or	%l6,	0x12FE,	%i0
	movcc	%icc,	%o2,	%g7
	fcmpgt32	%f24,	%f10,	%l4
	flush	%l7 + 0x4C
	xnor	%o3,	0x04CF,	%l1
	xor	%g1,	%l0,	%i5
	movvc	%icc,	%i6,	%o0
	xnorcc	%l2,	0x14FB,	%g2
	movrlz	%o5,	0x3E8,	%i1
	tcc	%xcc,	0x3
	fnot1s	%f13,	%f24
	bl,pn	%icc,	loop_1646
	tpos	%xcc,	0x0
	movn	%icc,	%i3,	%i4
	edge32l	%o6,	%g6,	%i2
loop_1646:
	ldsw	[%l7 + 0x3C],	%o1
	movrlez	%l5,	%g3,	%l3
	brgz,a	%g5,	loop_1647
	movvs	%xcc,	%i7,	%o7
	brgez,a	%g4,	loop_1648
	tg	%icc,	0x5
loop_1647:
	tg	%xcc,	0x6
	orn	%o4,	0x1DFD,	%l6
loop_1648:
	taddcctv	%o2,	%i0,	%l4
	tl	%icc,	0x6
	tcs	%icc,	0x0
	movvc	%xcc,	%o3,	%l1
	movle	%xcc,	%g1,	%g7
	sth	%i5,	[%l7 + 0x62]
	fbge	%fcc3,	loop_1649
	fpackfix	%f20,	%f21
	fmuld8ulx16	%f27,	%f1,	%f8
	addccc	%i6,	%o0,	%l0
loop_1649:
	srlx	%l2,	%o5,	%g2
	fmovdl	%icc,	%f17,	%f4
	edge16l	%i1,	%i3,	%o6
	edge8n	%i4,	%g6,	%o1
	ldstub	[%l7 + 0x48],	%l5
	srax	%i2,	%g3,	%l3
	fmovrse	%g5,	%f1,	%f19
	tpos	%xcc,	0x6
	srax	%i7,	%g4,	%o4
	xorcc	%o7,	0x1D36,	%o2
	tle	%icc,	0x1
	srl	%i0,	%l4,	%l6
	fabsd	%f0,	%f26
	or	%o3,	%l1,	%g1
	fand	%f4,	%f12,	%f14
	stx	%g7,	[%l7 + 0x68]
	fmovdne	%icc,	%f14,	%f28
	tne	%xcc,	0x4
	movl	%icc,	%i5,	%o0
	tne	%xcc,	0x4
	taddcctv	%l0,	%i6,	%o5
	fmovdcc	%xcc,	%f9,	%f23
	bcc,pt	%xcc,	loop_1650
	fpsub32	%f28,	%f20,	%f16
	taddcc	%g2,	%l2,	%i3
	fmovsneg	%icc,	%f11,	%f7
loop_1650:
	fcmpgt32	%f24,	%f18,	%i1
	sra	%i4,	%g6,	%o6
	fbge	%fcc1,	loop_1651
	umulcc	%o1,	0x0A64,	%l5
	udivcc	%i2,	0x1F9C,	%g3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g5,	%l3
loop_1651:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x28] %asi,	%g4
	mova	%xcc,	%i7,	%o7
	fbuge	%fcc0,	loop_1652
	fnot2	%f18,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o4,	0x3C3,	%o2
loop_1652:
	fcmpgt16	%f4,	%f30,	%l4
	addccc	%i0,	0x0479,	%o3
	ta	%icc,	0x0
	fmovdvc	%xcc,	%f22,	%f23
	srl	%l1,	%l6,	%g1
	fornot2s	%f28,	%f15,	%f18
	andncc	%i5,	%o0,	%g7
	fbge,a	%fcc0,	loop_1653
	fmovrse	%i6,	%f28,	%f28
	fmul8x16al	%f26,	%f12,	%f8
	fandnot1	%f24,	%f4,	%f6
loop_1653:
	movcs	%xcc,	%l0,	%g2
	tle	%xcc,	0x0
	nop
	set	0x08, %g5
	std	%l2,	[%l7 + %g5]
	tvs	%icc,	0x3
	movg	%icc,	%o5,	%i3
	brlz	%i1,	loop_1654
	movle	%xcc,	%g6,	%o6
	alignaddr	%i4,	%l5,	%o1
	srl	%g3,	%i2,	%l3
loop_1654:
	movge	%xcc,	%g4,	%i7
	movrgz	%o7,	0x177,	%o4
	fbug,a	%fcc3,	loop_1655
	tcc	%xcc,	0x3
	edge16	%o2,	%g5,	%l4
	andn	%i0,	%l1,	%l6
loop_1655:
	bne	loop_1656
	fpsub32s	%f31,	%f3,	%f27
	fnands	%f13,	%f13,	%f27
	nop
	setx	loop_1657,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1656:
	fbo,a	%fcc2,	loop_1658
	movge	%xcc,	%g1,	%i5
	addcc	%o3,	0x15D2,	%g7
loop_1657:
	movl	%icc,	%i6,	%l0
loop_1658:
	fmovdge	%icc,	%f31,	%f18
	udiv	%g2,	0x0BEA,	%l2
	ldsw	[%l7 + 0x50],	%o0
	membar	0x7E
	lduw	[%l7 + 0x14],	%i3
	alignaddrl	%i1,	%g6,	%o6
	fmovdge	%icc,	%f15,	%f5
	xor	%i4,	%o5,	%o1
	sethi	0x0EE8,	%l5
	fblg,a	%fcc3,	loop_1659
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f12,	%f12
	brz,a	%i2,	loop_1660
loop_1659:
	edge8l	%g3,	%g4,	%l3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x34] %asi,	%o7
loop_1660:
	xnorcc	%o4,	%i7,	%g5
	tg	%icc,	0x4
	movrgz	%l4,	%i0,	%l1
	sdiv	%l6,	0x15B7,	%o2
	fmul8sux16	%f20,	%f0,	%f22
	movne	%xcc,	%i5,	%g1
	fandnot2	%f18,	%f18,	%f30
	movn	%icc,	%o3,	%g7
	bge,pt	%xcc,	loop_1661
	nop
	setx	loop_1662,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,a	%icc,	loop_1663
	sll	%i6,	0x0C,	%l0
loop_1661:
	fcmpes	%fcc0,	%f27,	%f5
loop_1662:
	edge8l	%l2,	%o0,	%g2
loop_1663:
	fmovrdne	%i3,	%f30,	%f12
	fornot1s	%f4,	%f26,	%f27
	tg	%icc,	0x7
	and	%g6,	0x0DE8,	%i1
	fnors	%f1,	%f23,	%f31
	movvc	%xcc,	%i4,	%o5
	addcc	%o6,	0x0008,	%o1
	xor	%l5,	%i2,	%g3
	sth	%l3,	[%l7 + 0x32]
	fmovdl	%icc,	%f15,	%f2
	taddcc	%o7,	%o4,	%g4
	sra	%g5,	0x13,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x78, %i0
	ldsha	[%l7 + %i0] 0x80,	%i7
	taddcc	%l1,	%l6,	%i0
	fmovspos	%xcc,	%f8,	%f10
	movrlz	%i5,	0x201,	%o2
	bleu,pn	%icc,	loop_1664
	edge8ln	%o3,	%g1,	%i6
	fmul8ulx16	%f10,	%f14,	%f12
	te	%xcc,	0x3
loop_1664:
	xnor	%l0,	%l2,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g2,	0x17,	%o0
	set	0x44, %l2
	lda	[%l7 + %l2] 0x80,	%f31
	edge8l	%i3,	%g6,	%i1
	sethi	0x1048,	%i4
	sll	%o6,	0x01,	%o1
	tne	%xcc,	0x3
	srl	%l5,	0x11,	%o5
	fornot1	%f0,	%f6,	%f30
	lduh	[%l7 + 0x28],	%i2
	addc	%l3,	0x0312,	%g3
	fmovrdlez	%o4,	%f4,	%f20
	set	0x30, %i1
	ldswa	[%l7 + %i1] 0x11,	%o7
	set	0x48, %i3
	stxa	%g4,	[%l7 + %i3] 0x0c
	andcc	%g5,	0x0A6B,	%l4
	tsubcc	%i7,	0x1EDB,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i0,	%i5
	bne,a	%xcc,	loop_1665
	movneg	%xcc,	%o2,	%o3
	fmovdvc	%icc,	%f6,	%f9
	sra	%g1,	0x0A,	%l1
loop_1665:
	nop
	setx loop_1666, %l0, %l1
	jmpl %l1, %i6
	edge32l	%l0,	%l2,	%g2
	tleu	%xcc,	0x5
	smulcc	%g7,	0x1E84,	%o0
loop_1666:
	movneg	%icc,	%i3,	%g6
	sub	%i4,	0x1F07,	%i1
	movle	%xcc,	%o1,	%l5
	sethi	0x1337,	%o5
	set	0x20, %i2
	stxa	%o6,	[%l7 + %i2] 0x27
	membar	#Sync
	fnot1	%f24,	%f4
	or	%i2,	%l3,	%g3
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x89,	%o4
	lduh	[%l7 + 0x2C],	%g4
	edge8	%o7,	%g5,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f2,	%f28,	%f22
	movrgz	%i7,	%i0,	%i5
	movrlez	%o2,	%o3,	%g1
	fcmpne16	%f30,	%f30,	%l1
	stw	%i6,	[%l7 + 0x6C]
	sll	%l6,	0x08,	%l2
	bn,pn	%xcc,	loop_1667
	srl	%g2,	0x1C,	%g7
	tvc	%icc,	0x6
	movpos	%icc,	%o0,	%i3
loop_1667:
	taddcc	%l0,	0x0537,	%g6
	for	%f14,	%f18,	%f24
	faligndata	%f26,	%f18,	%f2
	move	%xcc,	%i1,	%o1
	tne	%icc,	0x2
	tleu	%xcc,	0x5
	andncc	%i4,	%o5,	%l5
	tl	%xcc,	0x7
	tpos	%xcc,	0x2
	nop
	setx	loop_1668,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsneg	%xcc,	%f22,	%f28
	bge,pn	%xcc,	loop_1669
	tne	%icc,	0x1
loop_1668:
	fnegs	%f5,	%f3
	udivcc	%o6,	0x1B7B,	%l3
loop_1669:
	popc	%g3,	%o4
	fmovrde	%i2,	%f24,	%f14
	tge	%icc,	0x4
	nop
	setx loop_1670, %l0, %l1
	jmpl %l1, %g4
	std	%f16,	[%l7 + 0x78]
	udiv	%g5,	0x1095,	%o7
	pdist	%f18,	%f12,	%f24
loop_1670:
	movleu	%xcc,	%i7,	%i0
	fnands	%f14,	%f14,	%f18
	or	%l4,	0x000B,	%i5
	edge32ln	%o3,	%o2,	%l1
	fbu,a	%fcc3,	loop_1671
	swap	[%l7 + 0x28],	%g1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%l6
loop_1671:
	tneg	%icc,	0x4
	array16	%l2,	%i6,	%g7
	movvs	%xcc,	%g2,	%o0
	movvs	%icc,	%i3,	%l0
	ble	%icc,	loop_1672
	udiv	%g6,	0x1100,	%o1
	fcmpes	%fcc3,	%f11,	%f12
	movle	%xcc,	%i1,	%i4
loop_1672:
	umulcc	%l5,	0x1408,	%o5
	sir	0x1430
	brnz	%l3,	loop_1673
	andncc	%g3,	%o6,	%o4
	fcmpgt16	%f28,	%f24,	%i2
	fbu	%fcc0,	loop_1674
loop_1673:
	pdist	%f30,	%f10,	%f6
	edge16l	%g5,	%o7,	%g4
	smulcc	%i7,	%i0,	%i5
loop_1674:
	tg	%icc,	0x2
	tcs	%xcc,	0x0
	ldsh	[%l7 + 0x0E],	%o3
	mova	%icc,	%l4,	%o2
	sllx	%g1,	0x02,	%l6
	set	0x58, %o3
	lduwa	[%l7 + %o3] 0x81,	%l1
	fpadd32s	%f7,	%f31,	%f3
	bg,a,pn	%xcc,	loop_1675
	addcc	%l2,	%i6,	%g2
	brgz	%g7,	loop_1676
	tcc	%xcc,	0x2
loop_1675:
	brgez,a	%o0,	loop_1677
	for	%f28,	%f6,	%f20
loop_1676:
	popc	0x1A9E,	%i3
	bcs,a	%xcc,	loop_1678
loop_1677:
	movrlez	%l0,	%g6,	%i1
	alignaddr	%o1,	%l5,	%i4
	sll	%l3,	%o5,	%o6
loop_1678:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x35] %asi,	%o4
	tg	%icc,	0x7
	array32	%g3,	%i2,	%o7
	movn	%icc,	%g4,	%g5
	taddcc	%i0,	%i5,	%o3
	sdivx	%l4,	0x0494,	%i7
	tvs	%xcc,	0x4
	srax	%g1,	0x14,	%l6
	xnor	%o2,	%l2,	%i6
	stbar
	mulx	%g2,	%g7,	%l1
	movgu	%xcc,	%o0,	%i3
	tneg	%xcc,	0x0
	srlx	%g6,	%i1,	%l0
	tvc	%xcc,	0x6
	fble	%fcc2,	loop_1679
	fble,a	%fcc2,	loop_1680
	edge16l	%o1,	%l5,	%l3
	movgu	%xcc,	%i4,	%o5
loop_1679:
	orcc	%o6,	0x1A4D,	%o4
loop_1680:
	tge	%xcc,	0x7
	mova	%icc,	%i2,	%g3
	addc	%o7,	0x1103,	%g4
	fbge,a	%fcc2,	loop_1681
	ldx	[%l7 + 0x38],	%i0
	andn	%g5,	%i5,	%o3
	fmovdcs	%xcc,	%f23,	%f24
loop_1681:
	subccc	%i7,	%l4,	%g1
	stx	%o2,	[%l7 + 0x58]
	orn	%l2,	%l6,	%g2
	fmovrsgz	%i6,	%f11,	%f12
	edge16ln	%g7,	%o0,	%i3
	fone	%f2
	set	0x28, %g4
	stda	%l0,	[%l7 + %g4] 0x88
	tcs	%xcc,	0x7
	fmovdneg	%xcc,	%f31,	%f1
	tg	%xcc,	0x3
	subccc	%g6,	0x0841,	%i1
	addcc	%o1,	0x19EF,	%l5
	bcs,a,pn	%xcc,	loop_1682
	fbug,a	%fcc2,	loop_1683
	tl	%icc,	0x6
	wr	%g0,	0x80,	%asi
	sta	%f20,	[%l7 + 0x3C] %asi
loop_1682:
	bvs	loop_1684
loop_1683:
	fbul	%fcc3,	loop_1685
	movle	%icc,	%l0,	%i4
	xorcc	%l3,	%o6,	%o4
loop_1684:
	subccc	%o5,	%g3,	%o7
loop_1685:
	xorcc	%i2,	%g4,	%i0
	subcc	%i5,	%o3,	%g5
	fmovda	%icc,	%f30,	%f17
	movrlz	%i7,	0x239,	%g1
	fmovdleu	%xcc,	%f6,	%f4
	ldd	[%l7 + 0x50],	%f16
	andcc	%l4,	%o2,	%l2
	tgu	%xcc,	0x6
	andncc	%g2,	%l6,	%g7
	movrlez	%o0,	0x101,	%i6
	tsubcc	%i3,	0x0C78,	%g6
	edge32ln	%i1,	%l1,	%o1
	bleu,pt	%icc,	loop_1686
	sub	%l5,	0x0CEB,	%i4
	bcc,pt	%xcc,	loop_1687
	fsrc1s	%f22,	%f6
loop_1686:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%xcc,	%f23,	%f17
loop_1687:
	movge	%icc,	%l0,	%o6
	membar	0x10
	orncc	%l3,	%o5,	%g3
	movneg	%xcc,	%o7,	%i2
	mova	%xcc,	%g4,	%i0
	edge8	%i5,	%o4,	%o3
	fmovrslez	%i7,	%f23,	%f19
	ble,a,pt	%xcc,	loop_1688
	edge8	%g1,	%g5,	%o2
	mulscc	%l4,	%g2,	%l6
	subcc	%g7,	0x192E,	%o0
loop_1688:
	orcc	%l2,	0x10B5,	%i3
	fsrc2s	%f3,	%f20
	sll	%g6,	%i6,	%l1
	movre	%o1,	0x219,	%l5
	fpadd32s	%f17,	%f30,	%f13
	tvc	%icc,	0x2
	udivcc	%i1,	0x03DE,	%l0
	addcc	%o6,	%l3,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x20, %g1
	stwa	%o5,	[%l7 + %g1] 0x2f
	membar	#Sync
	fmuld8ulx16	%f21,	%f9,	%f28
	sub	%g3,	%i2,	%g4
	std	%f30,	[%l7 + 0x28]
	tgu	%icc,	0x6
	sdivcc	%i0,	0x056F,	%o7
	movcs	%xcc,	%o4,	%i5
	tgu	%icc,	0x6
	stb	%i7,	[%l7 + 0x14]
	fmovdvs	%xcc,	%f10,	%f9
	srax	%g1,	%o3,	%g5
	sethi	0x0F9B,	%o2
	edge8ln	%g2,	%l4,	%l6
	edge16ln	%g7,	%o0,	%l2
	fmovdn	%icc,	%f23,	%f29
	ldx	[%l7 + 0x50],	%i3
	movrne	%i6,	%l1,	%o1
	fzero	%f2
	ldd	[%l7 + 0x28],	%f14
	edge16n	%l5,	%g6,	%l0
	lduh	[%l7 + 0x4E],	%i1
	edge32ln	%o6,	%i4,	%o5
	array16	%l3,	%g3,	%g4
	srax	%i0,	0x14,	%i2
	tsubcctv	%o7,	%i5,	%o4
	fandnot2s	%f24,	%f10,	%f22
	tne	%icc,	0x5
	fbul	%fcc0,	loop_1689
	fcmpgt32	%f28,	%f0,	%g1
	fbge	%fcc0,	loop_1690
	udivcc	%i7,	0x08EA,	%g5
loop_1689:
	fmovdne	%xcc,	%f29,	%f16
	edge8	%o3,	%g2,	%l4
loop_1690:
	fmovdne	%xcc,	%f5,	%f3
	wr	%g0,	0x4f,	%asi
	stxa	%o2,	[%g0 + 0x18] %asi
	fmovdn	%xcc,	%f8,	%f9
	fzero	%f22
	movpos	%xcc,	%l6,	%o0
	array16	%g7,	%i3,	%l2
	ldx	[%l7 + 0x60],	%i6
	edge8l	%l1,	%o1,	%l5
	edge8	%l0,	%i1,	%o6
	sdiv	%i4,	0x079F,	%g6
	edge32n	%l3,	%g3,	%o5
	fmovrsne	%g4,	%f8,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i0,	%i2,	%i5
	ba,a,pn	%icc,	loop_1691
	stb	%o4,	[%l7 + 0x4C]
	fornot1s	%f31,	%f31,	%f10
	set	0x3C, %o0
	lduwa	[%l7 + %o0] 0x19,	%g1
loop_1691:
	taddcctv	%o7,	0x18B3,	%g5
	movvc	%xcc,	%o3,	%i7
	ldstub	[%l7 + 0x35],	%l4
	andn	%o2,	%l6,	%g2
	edge32ln	%g7,	%i3,	%o0
	st	%f10,	[%l7 + 0x20]
	ta	%icc,	0x4
	edge32l	%l2,	%i6,	%o1
	movrgez	%l5,	%l0,	%l1
	movvs	%icc,	%i1,	%i4
	tpos	%xcc,	0x6
	set	0x0C, %o1
	ldswa	[%l7 + %o1] 0x15,	%o6
	movle	%xcc,	%g6,	%l3
	sll	%g3,	0x0C,	%g4
	mova	%icc,	%o5,	%i2
	orcc	%i5,	%i0,	%g1
	ldsb	[%l7 + 0x52],	%o7
	tge	%xcc,	0x6
	xnorcc	%g5,	%o4,	%i7
	set	0x60, %l4
	stha	%o3,	[%l7 + %l4] 0x0c
	tcs	%icc,	0x4
	fpadd16	%f6,	%f2,	%f6
	fmovdgu	%xcc,	%f15,	%f30
	srax	%l4,	%o2,	%g2
	smul	%g7,	%l6,	%o0
	be	%xcc,	loop_1692
	movleu	%xcc,	%l2,	%i3
	tleu	%icc,	0x3
	edge8n	%o1,	%l5,	%i6
loop_1692:
	movg	%xcc,	%l0,	%l1
	movrgz	%i1,	0x39A,	%o6
	fmovrdlez	%i4,	%f8,	%f6
	tsubcc	%g6,	0x12B2,	%l3
	movle	%xcc,	%g3,	%g4
	movre	%o5,	%i2,	%i5
	array8	%i0,	%o7,	%g5
	fpack32	%f8,	%f4,	%f24
	bl,a,pt	%xcc,	loop_1693
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o4,	0x153A,	%i7
	tsubcc	%g1,	%l4,	%o2
loop_1693:
	edge8l	%o3,	%g7,	%l6
	movrlez	%g2,	%l2,	%o0
	subc	%o1,	0x1183,	%l5
	sub	%i6,	0x0CE4,	%i3
	xnor	%l1,	0x0AB6,	%i1
	sra	%o6,	%i4,	%g6
	subccc	%l3,	%g3,	%l0
	tne	%xcc,	0x2
	fcmple16	%f8,	%f0,	%o5
	fmovsle	%icc,	%f7,	%f30
	alignaddr	%i2,	%i5,	%g4
	umulcc	%i0,	0x0A70,	%g5
	lduh	[%l7 + 0x2E],	%o4
	tcs	%icc,	0x0
	addccc	%i7,	0x0AA5,	%g1
	fcmpd	%fcc3,	%f24,	%f18
	tsubcctv	%o7,	0x0070,	%o2
	movgu	%xcc,	%l4,	%o3
	wr	%g0,	0x04,	%asi
	stba	%l6,	[%l7 + 0x38] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g7,	%l2
	orncc	%o0,	%o1,	%g2
	movvc	%xcc,	%i6,	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%i1
	sdiv	%l5,	0x1894,	%o6
	fbue	%fcc3,	loop_1694
	sdivx	%g6,	0x0E3C,	%l3
	edge32ln	%i4,	%l0,	%o5
	fmul8x16au	%f1,	%f14,	%f8
loop_1694:
	fornot2	%f24,	%f28,	%f4
	fpsub32	%f6,	%f10,	%f20
	set	0x44, %g3
	sta	%f16,	[%l7 + %g3] 0x81
	and	%i2,	%i5,	%g3
	subc	%g4,	0x0E1F,	%i0
	xorcc	%g5,	0x0AED,	%o4
	movne	%icc,	%g1,	%o7
	movpos	%xcc,	%i7,	%o2
	xnorcc	%l4,	%o3,	%l6
	fbge,a	%fcc3,	loop_1695
	umul	%l2,	%g7,	%o0
	prefetch	[%l7 + 0x44],	 0x2
	mulx	%o1,	0x0C8B,	%i6
loop_1695:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x3B] %asi,	%g2
	fmovrsgez	%l1,	%f17,	%f19
	taddcc	%i1,	0x11FF,	%i3
	fblg	%fcc1,	loop_1696
	ldub	[%l7 + 0x57],	%l5
	srax	%o6,	%g6,	%i4
	movne	%xcc,	%l0,	%o5
loop_1696:
	te	%xcc,	0x2
	tleu	%xcc,	0x2
	tcc	%icc,	0x4
	prefetch	[%l7 + 0x64],	 0x2
	tgu	%icc,	0x1
	movcc	%icc,	%l3,	%i2
	tn	%xcc,	0x1
	udivx	%g3,	0x0C4B,	%g4
	set	0x68, %l3
	ldsba	[%l7 + %l3] 0x81,	%i5
	fcmped	%fcc3,	%f22,	%f2
	xnorcc	%i0,	0x1FF3,	%o4
	movgu	%xcc,	%g1,	%o7
	movcs	%icc,	%i7,	%o2
	set	0x10, %g2
	sta	%f29,	[%l7 + %g2] 0x18
	xnor	%g5,	%o3,	%l4
	movgu	%xcc,	%l6,	%l2
	edge32l	%o0,	%o1,	%i6
	fandnot2s	%f31,	%f12,	%f22
	sub	%g2,	%l1,	%i1
	movne	%xcc,	%i3,	%l5
	andncc	%o6,	%g7,	%g6
	fcmpeq16	%f20,	%f22,	%i4
	array32	%l0,	%l3,	%o5
	subccc	%g3,	0x12D1,	%i2
	alignaddrl	%g4,	%i5,	%o4
	fbn,a	%fcc3,	loop_1697
	taddcc	%i0,	%o7,	%g1
	fbule	%fcc2,	loop_1698
	fandnot2	%f12,	%f26,	%f20
loop_1697:
	ta	%icc,	0x4
	bcs,a	loop_1699
loop_1698:
	membar	0x00
	tl	%icc,	0x1
	andcc	%i7,	%g5,	%o2
loop_1699:
	fbo,a	%fcc2,	loop_1700
	nop
	setx	loop_1701,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%l4,	%o3
	edge8	%l6,	%l2,	%o0
loop_1700:
	xnor	%i6,	0x1E1F,	%g2
loop_1701:
	fmovsneg	%xcc,	%f8,	%f26
	xnor	%l1,	0x01E6,	%i1
	xor	%o1,	0x142B,	%l5
	tg	%icc,	0x2
	movcc	%xcc,	%i3,	%g7
	wr	%g0,	0x22,	%asi
	stba	%o6,	[%l7 + 0x6B] %asi
	membar	#Sync
	edge32	%g6,	%i4,	%l0
	taddcc	%o5,	%l3,	%i2
	movrlez	%g3,	0x27F,	%g4
	mulscc	%i5,	0x11A5,	%i0
	set	0x30, %g7
	stda	%o6,	[%l7 + %g7] 0x10
	orcc	%o4,	0x0199,	%g1
	fmovsle	%xcc,	%f4,	%f19
	edge16ln	%i7,	%g5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o2,	0x12AE,	%o3
	tgu	%icc,	0x6
	subcc	%l6,	%o0,	%l2
	tvs	%icc,	0x6
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x11,	%f0
	and	%g2,	%l1,	%i6
	fmovrslez	%o1,	%f16,	%f10
	fnand	%f30,	%f20,	%f0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x04,	%i1,	%i3
	udiv	%l5,	0x18FA,	%g7
	fmovrsgez	%g6,	%f15,	%f27
	andncc	%o6,	%i4,	%o5
	xnor	%l0,	0x0604,	%l3
	tsubcctv	%g3,	0x0550,	%g4
	set	0x5C, %o2
	lda	[%l7 + %o2] 0x18,	%f5
	or	%i5,	0x0B21,	%i0
	edge32n	%i2,	%o4,	%o7
	movcs	%icc,	%i7,	%g5
	stw	%l4,	[%l7 + 0x4C]
	mulscc	%o2,	%g1,	%l6
	tge	%icc,	0x4
	srl	%o0,	%l2,	%o3
	bg,pt	%xcc,	loop_1702
	movvc	%xcc,	%l1,	%g2
	add	%i6,	%o1,	%i3
	edge32	%i1,	%g7,	%g6
loop_1702:
	edge8l	%l5,	%i4,	%o5
	movrlez	%l0,	0x1C3,	%o6
	fpadd16s	%f11,	%f22,	%f8
	tsubcctv	%g3,	0x1AF8,	%g4
	fblg,a	%fcc0,	loop_1703
	call	loop_1704
	move	%xcc,	%i5,	%i0
	movcs	%icc,	%i2,	%o4
loop_1703:
	stx	%o7,	[%l7 + 0x50]
loop_1704:
	fmovdleu	%xcc,	%f12,	%f13
	sll	%i7,	%g5,	%l4
	movge	%xcc,	%o2,	%g1
	movgu	%xcc,	%l3,	%o0
	fba	%fcc1,	loop_1705
	array8	%l2,	%o3,	%l1
	edge32ln	%l6,	%i6,	%g2
	tvc	%xcc,	0x6
loop_1705:
	fzeros	%f29
	stb	%i3,	[%l7 + 0x73]
	fmovsn	%icc,	%f15,	%f4
	fmovdvs	%xcc,	%f14,	%f31
	taddcc	%o1,	%i1,	%g7
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movn	%icc,	%g6,	%l5
	movrlz	%i4,	%l0,	%o5
	fblg,a	%fcc2,	loop_1706
	fand	%f30,	%f30,	%f12
	fxnor	%f26,	%f22,	%f14
	xnor	%g3,	%g4,	%o6
loop_1706:
	tneg	%icc,	0x7
	andn	%i5,	%i0,	%i2
	fba,a	%fcc3,	loop_1707
	fones	%f11
	subccc	%o4,	%o7,	%g5
	smulcc	%l4,	0x06E1,	%o2
loop_1707:
	addc	%g1,	%i7,	%l3
	nop
	setx	loop_1708,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f26,	%f30,	%f6
	orncc	%l2,	%o3,	%o0
	movn	%xcc,	%l6,	%l1
loop_1708:
	fmovdpos	%xcc,	%f19,	%f21
	lduw	[%l7 + 0x18],	%i6
	tgu	%icc,	0x7
	tge	%xcc,	0x2
	fmovrdlez	%g2,	%f2,	%f16
	subccc	%o1,	%i3,	%g7
	movcs	%xcc,	%g6,	%i1
	fmul8x16al	%f10,	%f24,	%f14
	udivcc	%l5,	0x1EFD,	%i4
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o5
	tg	%xcc,	0x6
	set	0x6C, %l6
	lduha	[%l7 + %l6] 0x88,	%g3
	fmovrde	%l0,	%f24,	%f4
	alignaddrl	%o6,	%i5,	%i0
	fmovrsgez	%i2,	%f31,	%f12
	fbl	%fcc2,	loop_1709
	stbar
	orn	%g4,	0x1D08,	%o4
	tvc	%icc,	0x4
loop_1709:
	mova	%xcc,	%o7,	%l4
	fnot2s	%f8,	%f20
	membar	0x12
	mova	%icc,	%o2,	%g1
	ldsh	[%l7 + 0x0E],	%i7
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x38] %asi,	%f26
	fpsub32s	%f15,	%f7,	%f16
	edge16l	%l3,	%g5,	%l2
	movne	%icc,	%o0,	%l6
	stbar
	fble	%fcc3,	loop_1710
	xorcc	%o3,	%i6,	%g2
	xor	%l1,	%o1,	%g7
	array32	%g6,	%i3,	%l5
loop_1710:
	xor	%i1,	0x0353,	%i4
	fmovs	%f0,	%f25
	mulx	%o5,	0x07CF,	%g3
	fmovspos	%xcc,	%f9,	%f0
	wr	%g0,	0x04,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
	xnorcc	%i5,	%l0,	%i2
	orn	%g4,	%o4,	%o7
	orcc	%l4,	%i0,	%o2
	fbo	%fcc2,	loop_1711
	alignaddr	%g1,	%l3,	%i7
	movpos	%icc,	%l2,	%o0
	brgez	%l6,	loop_1712
loop_1711:
	andcc	%g5,	0x1AD3,	%i6
	tle	%xcc,	0x3
	array8	%o3,	%l1,	%g2
loop_1712:
	fbug	%fcc1,	loop_1713
	st	%f27,	[%l7 + 0x28]
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%o1
loop_1713:
	sdivx	%g6,	0x0293,	%i3
	sdivcc	%g7,	0x0702,	%l5
	tneg	%xcc,	0x2
	movrlez	%i1,	%i4,	%g3
	ldsw	[%l7 + 0x2C],	%o5
	bg,a	%icc,	loop_1714
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%o6,	%f30,	%f4
	array16	%l0,	%i5,	%i2
loop_1714:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	mulscc	%g4,	%o7,	%o4
	sethi	0x19C9,	%i0
	sra	%o2,	0x11,	%g1
	fmovsgu	%icc,	%f17,	%f6
	srl	%l4,	0x04,	%l3
	edge16n	%i7,	%o0,	%l6
	membar	0x04
	mulx	%g5,	%i6,	%l2
	subccc	%o3,	0x1517,	%g2
	brgz,a	%o1,	loop_1715
	stx	%l1,	[%l7 + 0x78]
	move	%xcc,	%g6,	%i3
	set	0x28, %o5
	stxa	%l5,	[%l7 + %o5] 0x2f
	membar	#Sync
loop_1715:
	or	%g7,	%i4,	%g3
	fbn	%fcc3,	loop_1716
	fsrc2	%f2,	%f16
	fsrc1s	%f30,	%f9
	set	0x28, %i4
	ldstuba	[%l7 + %i4] 0x10,	%i1
loop_1716:
	fmovrsgz	%o5,	%f8,	%f4
	sdivx	%l0,	0x1BC3,	%o6
	movcc	%xcc,	%i2,	%g4
	movrgz	%o7,	%i5,	%i0
	sth	%o2,	[%l7 + 0x72]
	movneg	%xcc,	%o4,	%g1
	movcs	%icc,	%l4,	%l3
	edge16l	%o0,	%l6,	%g5
	set	0x18, %o6
	lduwa	[%l7 + %o6] 0x80,	%i7
	sdivcc	%l2,	0x1630,	%i6
	lduh	[%l7 + 0x3C],	%g2
	fmovsge	%xcc,	%f26,	%f2
	smulcc	%o3,	0x0676,	%l1
	stbar
	std	%g6,	[%l7 + 0x78]
	fand	%f26,	%f0,	%f2
	fexpand	%f0,	%f20
	mulscc	%o1,	%l5,	%i3
	ta	%icc,	0x0
	fmovdvc	%xcc,	%f24,	%f7
	nop
	set	0x7A, %g6
	lduh	[%l7 + %g6],	%g7
	tle	%icc,	0x7
	movrlz	%g3,	0x03C,	%i1
	siam	0x6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%o5
	edge16n	%l0,	%o6,	%g4
	sllx	%i2,	%i5,	%i0
	tvs	%xcc,	0x2
	edge8ln	%o2,	%o4,	%g1
	bl,pt	%xcc,	loop_1717
	ld	[%l7 + 0x54],	%f31
	sdivx	%o7,	0x1DD5,	%l4
	array16	%l3,	%o0,	%g5
loop_1717:
	stb	%l6,	[%l7 + 0x5C]
	membar	0x3A
	andn	%i7,	%l2,	%g2
	flush	%l7 + 0x2C
	udiv	%o3,	0x110B,	%i6
	smul	%g6,	0x06EE,	%o1
	ldd	[%l7 + 0x38],	%l4
	bshuffle	%f22,	%f0,	%f16
	or	%i3,	%g7,	%g3
	edge32l	%i1,	%i4,	%l1
	bcs,a	loop_1718
	movvs	%icc,	%o5,	%l0
	tneg	%icc,	0x5
	fcmpgt16	%f24,	%f8,	%o6
loop_1718:
	ta	%icc,	0x4
	popc	%i2,	%i5
	fandnot2	%f16,	%f4,	%f30
	fpackfix	%f26,	%f30
	fmovdle	%xcc,	%f8,	%f12
	subcc	%g4,	%i0,	%o4
	srlx	%o2,	%o7,	%l4
	fexpand	%f2,	%f18
	movrne	%g1,	%o0,	%l3
	fmovdn	%xcc,	%f4,	%f22
	fcmple16	%f20,	%f4,	%l6
	movleu	%icc,	%g5,	%i7
	srlx	%g2,	%o3,	%l2
	andncc	%g6,	%o1,	%l5
	ldsb	[%l7 + 0x38],	%i6
	bvc,pn	%xcc,	loop_1719
	nop
	set	0x28, %i5
	stw	%g7,	[%l7 + %i5]
	ldd	[%l7 + 0x40],	%f14
	fbo	%fcc2,	loop_1720
loop_1719:
	fbg,a	%fcc2,	loop_1721
	xnorcc	%g3,	0x07C8,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1720:
	fnot2	%f22,	%f6
loop_1721:
	movgu	%xcc,	%i4,	%l1
	tcs	%icc,	0x6
	bneg,a	%xcc,	loop_1722
	ld	[%l7 + 0x14],	%f22
	movn	%icc,	%o5,	%i3
	andcc	%l0,	%o6,	%i5
loop_1722:
	fbule,a	%fcc1,	loop_1723
	fmovrdlz	%i2,	%f24,	%f0
	fble,a	%fcc1,	loop_1724
	edge8ln	%g4,	%i0,	%o2
loop_1723:
	tgu	%icc,	0x5
	tge	%icc,	0x2
loop_1724:
	fmovrslz	%o7,	%f2,	%f4
	array32	%l4,	%o4,	%o0
	fmovde	%xcc,	%f9,	%f20
	movrgz	%l3,	0x03B,	%g1
	subcc	%l6,	%i7,	%g2
	udivcc	%g5,	0x0333,	%l2
	fbule,a	%fcc3,	loop_1725
	tl	%icc,	0x6
	fmovsn	%icc,	%f3,	%f19
	tcs	%icc,	0x6
loop_1725:
	movge	%xcc,	%g6,	%o1
	membar	0x56
	addccc	%l5,	%o3,	%i6
	movne	%xcc,	%g7,	%i1
	andcc	%g3,	0x033E,	%i4
	fsrc1s	%f3,	%f9
	fbue	%fcc2,	loop_1726
	fmovsvc	%xcc,	%f18,	%f12
	set	0x20, %l1
	ldstuba	[%l7 + %l1] 0x0c,	%o5
loop_1726:
	orncc	%i3,	%l1,	%l0
	fmovse	%icc,	%f4,	%f25
	edge16ln	%o6,	%i5,	%i2
	udiv	%g4,	0x00F5,	%o2
	andncc	%i0,	%o7,	%o4
	xnor	%o0,	0x0678,	%l3
	bge,a	%xcc,	loop_1727
	fmul8x16al	%f18,	%f7,	%f22
	andn	%g1,	%l6,	%l4
	array32	%i7,	%g5,	%g2
loop_1727:
	fmovdge	%xcc,	%f31,	%f27
	sdivcc	%g6,	0x13EC,	%o1
	fbug	%fcc1,	loop_1728
	smulcc	%l2,	0x1F15,	%o3
	addc	%l5,	%i6,	%i1
	array32	%g3,	%g7,	%o5
loop_1728:
	sdiv	%i4,	0x0EF9,	%i3
	tvc	%icc,	0x5
	fmovrsgez	%l0,	%f13,	%f18
	stbar
	fbn	%fcc2,	loop_1729
	umulcc	%o6,	0x17AA,	%i5
	subc	%i2,	0x04E3,	%g4
	bvs,a,pt	%xcc,	loop_1730
loop_1729:
	udivx	%o2,	0x1EC1,	%l1
	fmovda	%xcc,	%f8,	%f27
	udiv	%o7,	0x01A8,	%i0
loop_1730:
	siam	0x5
	fba,a	%fcc3,	loop_1731
	sdivcc	%o4,	0x1527,	%o0
	fpsub32	%f28,	%f2,	%f18
	mova	%icc,	%g1,	%l3
loop_1731:
	edge32ln	%l6,	%l4,	%i7
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movneg	%xcc,	%g5,	%g6
	ldsb	[%l7 + 0x5E],	%o1
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%l2
	movpos	%icc,	%o3,	%l5
	movne	%icc,	%g2,	%i6
	fbg,a	%fcc2,	loop_1732
	sllx	%g3,	0x11,	%g7
	prefetch	[%l7 + 0x4C],	 0x3
	srax	%o5,	%i1,	%i3
loop_1732:
	tl	%xcc,	0x4
	swap	[%l7 + 0x6C],	%l0
	array32	%i4,	%i5,	%o6
	te	%icc,	0x7
	bneg,pt	%icc,	loop_1733
	ldsh	[%l7 + 0x6E],	%g4
	smulcc	%o2,	%i2,	%l1
	brz	%i0,	loop_1734
loop_1733:
	tle	%icc,	0x5
	smul	%o7,	0x03A0,	%o4
	fexpand	%f28,	%f24
loop_1734:
	sth	%g1,	[%l7 + 0x6C]
	movpos	%icc,	%l3,	%o0
	array8	%l6,	%i7,	%l4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g6
	srax	%o1,	0x07,	%g5
	tneg	%icc,	0x6
	fcmple32	%f4,	%f20,	%o3
	fmovdvs	%xcc,	%f25,	%f12
	movne	%xcc,	%l5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x05B1,	%g2
	movcc	%icc,	%g3,	%g7
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x20] %asi,	%i6
	movre	%i1,	%o5,	%i3
	set	0x79, %i7
	ldstuba	[%l7 + %i7] 0x0c,	%i4
	bleu,pt	%xcc,	loop_1735
	swap	[%l7 + 0x54],	%l0
	orn	%i5,	%o6,	%o2
	edge8n	%i2,	%g4,	%l1
loop_1735:
	edge8	%o7,	%i0,	%o4
	nop
	setx	loop_1736,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%l3,	%o0
	fmovrdne	%l6,	%f2,	%f28
	movrlez	%i7,	%g1,	%l4
loop_1736:
	fsrc1	%f24,	%f8
	orcc	%g6,	%g5,	%o3
	fmovdvs	%icc,	%f30,	%f11
	alignaddr	%o1,	%l5,	%l2
	fmovse	%xcc,	%f0,	%f26
	orn	%g2,	0x1885,	%g7
	fbl	%fcc0,	loop_1737
	mulx	%i6,	%i1,	%g3
	fbe	%fcc3,	loop_1738
	fornot1	%f10,	%f2,	%f20
loop_1737:
	fmovrdgz	%i3,	%f14,	%f14
	ta	%icc,	0x2
loop_1738:
	fmovrslz	%o5,	%f21,	%f6
	taddcc	%i4,	0x03CA,	%i5
	sdiv	%o6,	0x03F0,	%l0
	tpos	%icc,	0x1
	tn	%xcc,	0x1
	bleu	loop_1739
	srax	%o2,	0x12,	%i2
	tl	%icc,	0x7
	umul	%g4,	%o7,	%l1
loop_1739:
	tsubcc	%o4,	0x04B2,	%i0
	fnegd	%f14,	%f4
	tpos	%xcc,	0x5
	edge8ln	%l3,	%l6,	%o0
	bcc,a,pn	%xcc,	loop_1740
	fmovrdlez	%i7,	%f6,	%f16
	popc	%g1,	%l4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x28] %asi,	%g5
loop_1740:
	array16	%o3,	%g6,	%l5
	bcc,a	loop_1741
	alignaddr	%l2,	%g2,	%g7
	edge8n	%o1,	%i6,	%g3
	edge32n	%i1,	%i3,	%o5
loop_1741:
	tvc	%icc,	0x0
	movl	%xcc,	%i5,	%i4
	fba	%fcc0,	loop_1742
	tsubcc	%o6,	%l0,	%i2
	subcc	%g4,	%o2,	%o7
	fble,a	%fcc3,	loop_1743
loop_1742:
	movre	%l1,	0x22A,	%o4
	bl,pt	%icc,	loop_1744
	tg	%xcc,	0x5
loop_1743:
	edge8n	%l3,	%l6,	%i0
	bgu,a	loop_1745
loop_1744:
	xnorcc	%o0,	0x1BC2,	%i7
	fnot1	%f18,	%f8
	ldstub	[%l7 + 0x6B],	%l4
loop_1745:
	fmovsleu	%xcc,	%f3,	%f29
	tcc	%icc,	0x3
	sra	%g5,	%o3,	%g6
	bneg,a	%xcc,	loop_1746
	edge16	%g1,	%l5,	%l2
	movne	%xcc,	%g7,	%o1
	edge32ln	%g2,	%i6,	%i1
loop_1746:
	fbl	%fcc2,	loop_1747
	fbne	%fcc0,	loop_1748
	movcc	%icc,	%g3,	%o5
	movrlez	%i3,	%i5,	%o6
loop_1747:
	sra	%l0,	0x12,	%i4
loop_1748:
	xnorcc	%i2,	0x03A7,	%o2
	fands	%f3,	%f18,	%f22
	fmovscs	%xcc,	%f30,	%f12
	bneg,a	loop_1749
	fmovrsgz	%o7,	%f13,	%f29
	movre	%l1,	%o4,	%l3
	fmovde	%icc,	%f20,	%f4
loop_1749:
	edge32l	%l6,	%i0,	%o0
	fexpand	%f14,	%f6
	fble,a	%fcc0,	loop_1750
	fblg,a	%fcc3,	loop_1751
	add	%i7,	%l4,	%g4
	movrgez	%o3,	0x265,	%g5
loop_1750:
	std	%g6,	[%l7 + 0x78]
loop_1751:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x6E] %asi,	%l5
	sll	%g1,	%g7,	%o1
	movcc	%icc,	%l2,	%g2
	mulscc	%i1,	%g3,	%i6
	te	%icc,	0x5
	movrlz	%i3,	0x084,	%o5
	sra	%i5,	%l0,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%i4,	%f20,	%f23
	edge32ln	%o2,	%o7,	%l1
	fxors	%f3,	%f0,	%f15
	sll	%o4,	0x08,	%i2
	tg	%xcc,	0x1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x15,	%f0
	fmovsn	%icc,	%f12,	%f10
	sllx	%l6,	0x01,	%l3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o0
	tsubcc	%i0,	%i7,	%l4
	fmovrdgz	%g4,	%f22,	%f2
	alignaddrl	%o3,	%g6,	%g5
	srl	%g1,	%g7,	%o1
	nop
	setx	loop_1752,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x035A
	tl	%icc,	0x4
	bge,a,pn	%icc,	loop_1753
loop_1752:
	fpmerge	%f13,	%f27,	%f8
	fmovdcc	%icc,	%f31,	%f16
	fsrc2	%f6,	%f22
loop_1753:
	bcs	%xcc,	loop_1754
	mova	%xcc,	%l2,	%l5
	and	%i1,	%g2,	%i6
	umulcc	%i3,	%o5,	%g3
loop_1754:
	fands	%f28,	%f20,	%f20
	std	%i4,	[%l7 + 0x68]
	tn	%icc,	0x5
	movn	%xcc,	%l0,	%i4
	fnot2	%f14,	%f12
	sir	0x0EF5
	movpos	%xcc,	%o2,	%o7
	xnorcc	%o6,	%l1,	%o4
	movg	%icc,	%i2,	%l3
	bleu,a,pn	%xcc,	loop_1755
	edge16ln	%l6,	%i0,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f1,	%f13
loop_1755:
	fmovde	%xcc,	%f30,	%f30
	movvc	%xcc,	%l4,	%g4
	fone	%f4
	tpos	%icc,	0x5
	tsubcc	%i7,	%g6,	%g5
	fmovrdgez	%g1,	%f28,	%f2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o3
	sub	%o1,	0x151D,	%l2
	set	0x08, %o4
	stda	%g6,	[%l7 + %o4] 0x23
	membar	#Sync
	subccc	%l5,	%g2,	%i6
	fmul8x16	%f13,	%f14,	%f18
	alignaddrl	%i1,	%o5,	%g3
	fnegd	%f30,	%f14
	tsubcc	%i3,	0x15F6,	%l0
	movcs	%icc,	%i4,	%o2
	fpadd32s	%f26,	%f0,	%f23
	addccc	%i5,	0x1BCF,	%o6
	fmovrdgez	%l1,	%f0,	%f26
	ldd	[%l7 + 0x20],	%o4
	bleu,a,pn	%icc,	loop_1756
	subc	%i2,	%o7,	%l6
	fsrc1s	%f13,	%f26
	te	%xcc,	0x1
loop_1756:
	sllx	%l3,	%i0,	%o0
	nop
	set	0x38, %g5
	ldstub	[%l7 + %g5],	%g4
	movg	%icc,	%l4,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i7,	%g5
	orncc	%o3,	%g1,	%o1
	wr	%g0,	0x89,	%asi
	stba	%g7,	[%l7 + 0x64] %asi
	movgu	%icc,	%l2,	%g2
	addccc	%i6,	0x1A11,	%l5
	tcc	%xcc,	0x1
	fxor	%f24,	%f22,	%f22
	fbul	%fcc2,	loop_1757
	be,a	loop_1758
	tle	%icc,	0x6
	taddcctv	%o5,	%i1,	%i3
loop_1757:
	srl	%g3,	%i4,	%l0
loop_1758:
	move	%xcc,	%i5,	%o6
	movleu	%xcc,	%o2,	%l1
	array16	%o4,	%i2,	%l6
	fba,a	%fcc1,	loop_1759
	movrgz	%l3,	0x2B0,	%i0
	movcs	%icc,	%o0,	%o7
	ldd	[%l7 + 0x30],	%g4
loop_1759:
	mova	%xcc,	%g6,	%l4
	tneg	%icc,	0x2
	xor	%i7,	0x1F85,	%o3
	movvs	%xcc,	%g1,	%g5
	wr	%g0,	0x2f,	%asi
	stha	%o1,	[%l7 + 0x32] %asi
	membar	#Sync
	addccc	%g7,	%g2,	%i6
	edge16l	%l2,	%l5,	%i1
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i3
	fmovse	%icc,	%f19,	%f30
	addc	%o5,	%i4,	%g3
	fcmpne16	%f16,	%f8,	%i5
	bneg,a,pn	%xcc,	loop_1760
	tvs	%xcc,	0x5
	taddcctv	%l0,	0x11BC,	%o6
	bvs,pn	%icc,	loop_1761
loop_1760:
	tvs	%icc,	0x4
	or	%l1,	%o2,	%i2
	movrne	%l6,	0x06A,	%l3
loop_1761:
	bvc,pn	%xcc,	loop_1762
	fbn,a	%fcc2,	loop_1763
	orn	%o4,	%o0,	%i0
	umulcc	%o7,	%g6,	%l4
loop_1762:
	fmovdvc	%xcc,	%f29,	%f9
loop_1763:
	movrgz	%g4,	%o3,	%g1
	and	%g5,	%o1,	%g7
	fcmpgt16	%f0,	%f6,	%g2
	call	loop_1764
	fmovrdne	%i6,	%f2,	%f16
	tcs	%xcc,	0x5
	sethi	0x0F18,	%i7
loop_1764:
	edge32n	%l2,	%i1,	%i3
	addc	%l5,	0x1764,	%i4
	sdivx	%o5,	0x0410,	%g3
	fcmpne32	%f14,	%f8,	%l0
	fnegd	%f16,	%f10
	fmovscc	%xcc,	%f9,	%f26
	fpsub16	%f4,	%f4,	%f20
	udiv	%o6,	0x1105,	%l1
	tvc	%xcc,	0x5
	fand	%f16,	%f6,	%f0
	tgu	%icc,	0x6
	movn	%icc,	%o2,	%i5
	ldstub	[%l7 + 0x3B],	%i2
	nop
	setx loop_1765, %l0, %l1
	jmpl %l1, %l3
	movrlez	%o4,	%l6,	%i0
	fbuge	%fcc1,	loop_1766
	movrne	%o7,	%o0,	%l4
loop_1765:
	tcc	%xcc,	0x4
	fmovdleu	%xcc,	%f12,	%f15
loop_1766:
	sub	%g6,	0x0175,	%o3
	sub	%g4,	0x1641,	%g1
	bvc	loop_1767
	fmovdvc	%xcc,	%f27,	%f25
	tl	%icc,	0x1
	fpmerge	%f18,	%f23,	%f16
loop_1767:
	sub	%g5,	0x072D,	%o1
	edge8n	%g7,	%g2,	%i6
	brgez,a	%l2,	loop_1768
	xnorcc	%i7,	%i1,	%i3
	stbar
	edge32ln	%l5,	%i4,	%g3
loop_1768:
	fmovsleu	%xcc,	%f19,	%f23
	edge8	%l0,	%o6,	%o5
	std	%f26,	[%l7 + 0x60]
	fmovdneg	%icc,	%f14,	%f7
	fmovsleu	%xcc,	%f3,	%f19
	ldsb	[%l7 + 0x54],	%o2
	alignaddrl	%l1,	%i2,	%l3
	fmovdvs	%icc,	%f17,	%f26
	tcc	%icc,	0x1
	tcs	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i5,	0x383,	%l6
	sdivcc	%o4,	0x11C9,	%o7
	xnor	%i0,	0x19F4,	%o0
	tvs	%xcc,	0x4
	bleu,pn	%xcc,	loop_1769
	edge16n	%g6,	%o3,	%g4
	fpackfix	%f0,	%f3
	movpos	%xcc,	%g1,	%g5
loop_1769:
	fors	%f6,	%f3,	%f22
	edge16ln	%o1,	%l4,	%g7
	fxnor	%f24,	%f20,	%f18
	edge8	%i6,	%g2,	%i7
	flush	%l7 + 0x50
	udivx	%l2,	0x1B82,	%i1
	subcc	%i3,	%l5,	%i4
	xnorcc	%l0,	0x1738,	%o6
	fnor	%f8,	%f8,	%f30
	srax	%g3,	%o5,	%l1
	set	0x10, %l0
	stwa	%i2,	[%l7 + %l0] 0x14
	bcc,a,pn	%icc,	loop_1770
	edge32ln	%l3,	%i5,	%o2
	fandnot1s	%f2,	%f5,	%f6
	bge,a	loop_1771
loop_1770:
	fbl,a	%fcc0,	loop_1772
	fmovsn	%icc,	%f0,	%f11
	fbule,a	%fcc3,	loop_1773
loop_1771:
	udivx	%o4,	0x1A1E,	%l6
loop_1772:
	fpadd16	%f4,	%f2,	%f10
	edge8	%o7,	%o0,	%i0
loop_1773:
	fors	%f0,	%f14,	%f25
	fcmps	%fcc0,	%f1,	%f26
	movvs	%icc,	%g6,	%o3
	fmovsvc	%icc,	%f19,	%f11
	ta	%xcc,	0x1
	andcc	%g1,	%g5,	%g4
	array32	%l4,	%g7,	%i6
	movg	%xcc,	%o1,	%g2
	sethi	0x0455,	%i7
	edge16n	%l2,	%i3,	%l5
	movrlez	%i1,	%l0,	%o6
	or	%i4,	%g3,	%o5
	add	%i2,	0x0202,	%l3
	alignaddr	%l1,	%o2,	%i5
	stbar
	xorcc	%o4,	0x0247,	%o7
	fmovrsgez	%o0,	%f4,	%f12
	fmovdgu	%icc,	%f5,	%f2
	edge32n	%i0,	%l6,	%o3
	set	0x6C, %i0
	stwa	%g1,	[%l7 + %i0] 0x80
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x71] %asi,	%g5
	edge32n	%g6,	%g4,	%l4
	set	0x64, %i1
	ldswa	[%l7 + %i1] 0x80,	%i6
	array8	%g7,	%g2,	%i7
	movvs	%icc,	%l2,	%o1
	andncc	%l5,	%i3,	%l0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o6
	membar	0x03
	fnot2	%f2,	%f4
	fmovrdlz	%i4,	%f8,	%f12
	set	0x32, %i3
	stha	%g3,	[%l7 + %i3] 0x23
	membar	#Sync
	edge16ln	%i1,	%o5,	%i2
	fba,a	%fcc0,	loop_1774
	fxnors	%f24,	%f6,	%f26
	ldd	[%l7 + 0x48],	%l0
	tvs	%icc,	0x0
loop_1774:
	movgu	%icc,	%l3,	%i5
	orn	%o4,	0x193C,	%o7
	edge16n	%o0,	%o2,	%l6
	movre	%o3,	%g1,	%g5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x04,	%g6,	%i0
	fbuge	%fcc2,	loop_1775
	fbe,a	%fcc3,	loop_1776
	fmovrsne	%g4,	%f10,	%f5
	fbne	%fcc0,	loop_1777
loop_1775:
	ldub	[%l7 + 0x14],	%l4
loop_1776:
	sdivcc	%i6,	0x00F1,	%g2
	movne	%xcc,	%i7,	%g7
loop_1777:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x3A] %asi,	%l2
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l5
	fmovdn	%icc,	%f23,	%f26
	lduh	[%l7 + 0x22],	%o1
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	fmovsgu	%icc,	%f12,	%f4
	call	loop_1778
	bgu,a,pt	%icc,	loop_1779
	smulcc	%o6,	%i4,	%g3
	fble	%fcc1,	loop_1780
loop_1778:
	tneg	%icc,	0x4
loop_1779:
	edge8	%i1,	%o5,	%i3
	tneg	%xcc,	0x0
loop_1780:
	and	%l1,	0x15BC,	%i2
	fones	%f19
	fmovs	%f1,	%f13
	sdivx	%i5,	0x14AC,	%o4
	subc	%o7,	%l3,	%o0
	popc	0x04BB,	%l6
	xnorcc	%o3,	%g1,	%g5
	srlx	%g6,	0x0C,	%o2
	faligndata	%f8,	%f26,	%f12
	edge8	%i0,	%l4,	%i6
	sub	%g4,	%i7,	%g7
	stw	%l2,	[%l7 + 0x0C]
	move	%xcc,	%g2,	%o1
	umul	%l5,	0x1441,	%l0
	tle	%xcc,	0x0
	fmovsleu	%xcc,	%f24,	%f20
	fandnot2s	%f13,	%f12,	%f17
	fornot2	%f8,	%f22,	%f20
	orncc	%i4,	%o6,	%g3
	edge8n	%i1,	%o5,	%i3
	array32	%i2,	%i5,	%o4
	std	%f12,	[%l7 + 0x68]
	fbule,a	%fcc2,	loop_1781
	edge16	%l1,	%o7,	%l3
	bg,pn	%xcc,	loop_1782
	movg	%icc,	%o0,	%l6
loop_1781:
	sra	%o3,	0x1F,	%g1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x4C] %asi,	%f7
loop_1782:
	sllx	%g5,	0x01,	%g6
	membar	0x0B
	edge8n	%o2,	%l4,	%i6
	movrlz	%i0,	%i7,	%g7
	edge8	%g4,	%g2,	%l2
	tcs	%xcc,	0x5
	movl	%icc,	%l5,	%o1
	nop
	setx	loop_1783,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%l0,	%o6,	%g3
	movcc	%icc,	%i1,	%i4
	wr	%g0,	0x89,	%asi
	stba	%i3,	[%l7 + 0x28] %asi
loop_1783:
	movle	%xcc,	%i2,	%i5
	fmovdneg	%xcc,	%f5,	%f2
	array16	%o4,	%o5,	%l1
	fmovrslz	%o7,	%f12,	%f7
	movg	%icc,	%o0,	%l6
	movl	%xcc,	%o3,	%g1
	fbuge	%fcc0,	loop_1784
	te	%xcc,	0x5
	andcc	%g5,	%l3,	%g6
	fors	%f28,	%f13,	%f8
loop_1784:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f8,	[%l7 + 0x10] %asi
	edge16	%o2,	%i6,	%i0
	ldsh	[%l7 + 0x6A],	%l4
	flush	%l7 + 0x20
	sdivcc	%i7,	0x19E0,	%g4
	umul	%g2,	0x015A,	%l2
	edge16ln	%g7,	%l5,	%l0
	and	%o6,	%g3,	%o1
	fsrc2	%f10,	%f28
	fba	%fcc1,	loop_1785
	movl	%icc,	%i1,	%i4
	xorcc	%i3,	0x03FD,	%i2
	xnorcc	%o4,	0x150B,	%o5
loop_1785:
	brnz	%i5,	loop_1786
	xnorcc	%l1,	%o0,	%o7
	nop
	setx loop_1787, %l0, %l1
	jmpl %l1, %o3
	and	%l6,	%g1,	%g5
loop_1786:
	fmovscc	%xcc,	%f23,	%f7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g6
loop_1787:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x10,	%o2,	%i6
	movrlez	%i0,	0x0C7,	%l4
	wr	%g0,	0x10,	%asi
	sta	%f6,	[%l7 + 0x3C] %asi
	edge32	%i7,	%g4,	%l3
	alignaddr	%g2,	%l2,	%l5
	mova	%xcc,	%g7,	%l0
	fnands	%f31,	%f24,	%f15
	fmovdvs	%icc,	%f21,	%f20
	add	%g3,	%o6,	%i1
	udiv	%o1,	0x1631,	%i3
	fnegd	%f14,	%f26
	edge32n	%i4,	%i2,	%o4
	addc	%o5,	0x0866,	%i5
	sdivx	%o0,	0x062D,	%o7
	fxnors	%f2,	%f21,	%f2
	fcmpgt16	%f10,	%f26,	%o3
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x89,	%l1
	tpos	%xcc,	0x0
	fmovsneg	%xcc,	%f15,	%f13
	popc	%l6,	%g1
	fmul8x16al	%f6,	%f23,	%f14
	fmovdpos	%icc,	%f11,	%f21
	fand	%f30,	%f24,	%f4
	alignaddrl	%g6,	%o2,	%i6
	fcmpd	%fcc2,	%f14,	%f26
	edge16l	%g5,	%l4,	%i0
	tg	%icc,	0x2
	tvc	%xcc,	0x1
	ld	[%l7 + 0x68],	%f1
	set	0x4C, %l2
	sta	%f20,	[%l7 + %l2] 0x0c
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x14] %asi,	%f11
	nop
	setx	loop_1788,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%i7,	%g4
	edge32	%g2,	%l2,	%l5
	te	%xcc,	0x6
loop_1788:
	st	%f0,	[%l7 + 0x5C]
	brgz	%l3,	loop_1789
	membar	0x75
	movneg	%icc,	%l0,	%g3
	andcc	%g7,	0x1F62,	%i1
loop_1789:
	fmovrde	%o1,	%f2,	%f30
	brgez	%o6,	loop_1790
	fbo,a	%fcc3,	loop_1791
	tgu	%xcc,	0x0
	movg	%icc,	%i4,	%i3
loop_1790:
	movpos	%icc,	%o4,	%i2
loop_1791:
	edge8n	%i5,	%o0,	%o7
	subcc	%o3,	%o5,	%l1
	fandnot2	%f8,	%f4,	%f10
	fabss	%f18,	%f8
	fmovrdgez	%l6,	%f6,	%f20
	ta	%icc,	0x2
	edge16ln	%g1,	%g6,	%i6
	alignaddrl	%g5,	%l4,	%o2
	umulcc	%i0,	0x1A59,	%i7
	movrlz	%g2,	0x17A,	%g4
	ta	%icc,	0x3
	edge8l	%l2,	%l3,	%l5
	sll	%l0,	0x1C,	%g7
	fnot2	%f4,	%f20
	tleu	%icc,	0x5
	movpos	%xcc,	%g3,	%o1
	subccc	%o6,	%i1,	%i4
	srax	%o4,	%i3,	%i5
	edge32l	%i2,	%o0,	%o7
	fmovdg	%icc,	%f30,	%f6
	bcs,a,pt	%icc,	loop_1792
	fbue	%fcc1,	loop_1793
	tle	%icc,	0x5
	udivx	%o3,	0x07F9,	%o5
loop_1792:
	sllx	%l6,	0x02,	%l1
loop_1793:
	nop
	set	0x18, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g6
	array32	%g1,	%g5,	%l4
	edge8n	%i6,	%o2,	%i0
	tsubcc	%i7,	0x0D82,	%g4
	movrlz	%g2,	0x0D2,	%l2
	fcmpd	%fcc2,	%f16,	%f14
	set	0x48, %g4
	lda	[%l7 + %g4] 0x80,	%f18
	fcmpeq32	%f24,	%f12,	%l3
	subccc	%l0,	%g7,	%l5
	udivx	%g3,	0x0789,	%o1
	tcc	%icc,	0x1
	fnand	%f14,	%f26,	%f18
	sir	0x1F15
	ldd	[%l7 + 0x50],	%f28
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x6E] %asi,	%i1
	sub	%i4,	%o6,	%o4
	stw	%i3,	[%l7 + 0x7C]
	orncc	%i2,	0x05DD,	%o0
	tl	%icc,	0x2
	fmovspos	%xcc,	%f1,	%f6
	tvs	%icc,	0x3
	fmovdn	%xcc,	%f14,	%f2
	tg	%icc,	0x7
	fcmpne32	%f8,	%f2,	%o7
	set	0x50, %o3
	stda	%o2,	[%l7 + %o3] 0x10
	tge	%xcc,	0x2
	tleu	%icc,	0x5
	array32	%o5,	%i5,	%l6
	ba,pt	%icc,	loop_1794
	fpackfix	%f8,	%f18
	fsrc2s	%f30,	%f6
	movcs	%icc,	%l1,	%g1
loop_1794:
	bcc,a	%xcc,	loop_1795
	andncc	%g5,	%l4,	%i6
	move	%icc,	%o2,	%i0
	tg	%xcc,	0x3
loop_1795:
	addcc	%i7,	0x15F4,	%g6
	mulscc	%g2,	%l2,	%l3
	fmovdcs	%icc,	%f6,	%f11
	movge	%xcc,	%l0,	%g7
	fble,a	%fcc1,	loop_1796
	srl	%l5,	0x19,	%g4
	std	%f26,	[%l7 + 0x10]
	xnor	%o1,	%i1,	%i4
loop_1796:
	fbg	%fcc2,	loop_1797
	movcc	%xcc,	%o6,	%o4
	movleu	%icc,	%i3,	%i2
	mulx	%o0,	0x1E5B,	%g3
loop_1797:
	movrgez	%o7,	%o3,	%o5
	udivx	%i5,	0x035C,	%l1
	tg	%icc,	0x4
	ldstub	[%l7 + 0x22],	%g1
	subc	%l6,	0x1264,	%g5
	xnorcc	%l4,	0x0C6B,	%o2
	tleu	%icc,	0x3
	tg	%icc,	0x3
	brlz,a	%i6,	loop_1798
	brnz,a	%i7,	loop_1799
	movcc	%icc,	%i0,	%g6
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x80
loop_1798:
	fmovdpos	%icc,	%f4,	%f8
loop_1799:
	alignaddr	%g2,	%l3,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc3,	loop_1800
	tne	%icc,	0x3
	ldsw	[%l7 + 0x2C],	%g7
	andncc	%l0,	%g4,	%l5
loop_1800:
	edge8n	%o1,	%i1,	%o6
	fmovrdlz	%o4,	%f16,	%f0
	movle	%xcc,	%i3,	%i4
	edge8n	%i2,	%o0,	%g3
	udivx	%o3,	0x03DB,	%o7
	edge8ln	%o5,	%i5,	%g1
	movge	%xcc,	%l6,	%l1
	fpadd32	%f2,	%f14,	%f16
	fxor	%f2,	%f6,	%f18
	movn	%icc,	%l4,	%g5
	fnot1	%f16,	%f14
	array8	%i6,	%i7,	%i0
	ldsb	[%l7 + 0x3C],	%o2
	movg	%icc,	%g2,	%l3
	addcc	%l2,	%g6,	%g7
	orncc	%g4,	%l5,	%o1
	swap	[%l7 + 0x74],	%i1
	orcc	%o6,	%o4,	%l0
	movvs	%icc,	%i3,	%i4
	fbu,a	%fcc1,	loop_1801
	stx	%o0,	[%l7 + 0x70]
	movl	%xcc,	%g3,	%i2
	xor	%o3,	0x1713,	%o5
loop_1801:
	edge32	%i5,	%o7,	%l6
	movrgz	%l1,	0x16E,	%g1
	bn,a,pt	%icc,	loop_1802
	ble,a	loop_1803
	edge32ln	%l4,	%i6,	%g5
	movneg	%xcc,	%i7,	%o2
loop_1802:
	bge,pt	%icc,	loop_1804
loop_1803:
	tvc	%xcc,	0x0
	srax	%g2,	%i0,	%l2
	xnorcc	%l3,	%g7,	%g6
loop_1804:
	srlx	%l5,	%o1,	%g4
	tgu	%icc,	0x7
	movrgz	%o6,	%i1,	%o4
	te	%icc,	0x4
	bge,a	%xcc,	loop_1805
	tcc	%xcc,	0x5
	movrne	%l0,	%i4,	%o0
	bn	%xcc,	loop_1806
loop_1805:
	movne	%xcc,	%i3,	%g3
	mulscc	%o3,	0x114A,	%i2
	ldstub	[%l7 + 0x29],	%i5
loop_1806:
	brlz	%o7,	loop_1807
	mulscc	%o5,	0x1CE3,	%l1
	subccc	%g1,	%l6,	%l4
	set	0x40, %g1
	stda	%g4,	[%l7 + %g1] 0x0c
loop_1807:
	tvc	%xcc,	0x4
	movge	%icc,	%i6,	%i7
	orcc	%g2,	%i0,	%l2
	fble	%fcc1,	loop_1808
	sdivx	%l3,	0x172D,	%g7
	movvs	%icc,	%o2,	%g6
	or	%l5,	%g4,	%o6
loop_1808:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i1,	%o1,	%l0
	bge,a	loop_1809
	tgu	%icc,	0x4
	addc	%o4,	0x16E2,	%o0
	tle	%icc,	0x5
loop_1809:
	fnot2s	%f4,	%f0
	movn	%icc,	%i4,	%i3
	fcmpeq16	%f12,	%f8,	%g3
	tcs	%xcc,	0x2
	ta	%icc,	0x0
	membar	0x25
	membar	0x05
	sra	%o3,	%i5,	%o7
	edge16	%i2,	%o5,	%g1
	alignaddrl	%l6,	%l1,	%l4
	fand	%f10,	%f2,	%f0
	ldd	[%l7 + 0x10],	%g4
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	edge32l	%g2,	%i0,	%l2
	andncc	%i7,	%l3,	%o2
	edge32ln	%g6,	%l5,	%g4
	brgz	%o6,	loop_1810
	edge32n	%i1,	%g7,	%l0
	popc	0x1DD0,	%o1
	array32	%o0,	%o4,	%i3
loop_1810:
	movgu	%icc,	%g3,	%o3
	bn,a	loop_1811
	edge16	%i5,	%i4,	%o7
	fmovsl	%xcc,	%f2,	%f3
	tne	%icc,	0x2
loop_1811:
	brgez,a	%o5,	loop_1812
	movgu	%icc,	%i2,	%l6
	movn	%icc,	%l1,	%g1
	tvc	%icc,	0x6
loop_1812:
	andcc	%l4,	0x07FF,	%i6
	fcmped	%fcc2,	%f18,	%f10
	orn	%g5,	%i0,	%l2
	array32	%g2,	%i7,	%l3
	fmovrdlez	%o2,	%f16,	%f12
	udiv	%g6,	0x12FA,	%g4
	fmovsneg	%xcc,	%f11,	%f18
	fmovde	%icc,	%f0,	%f3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l5
	fandnot2	%f18,	%f22,	%f8
	stb	%i1,	[%l7 + 0x0C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x4
	movle	%icc,	%g7,	%l0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x51] %asi,	%o1
	swap	[%l7 + 0x60],	%o6
	addc	%o0,	%i3,	%o4
	edge8ln	%g3,	%o3,	%i5
	movre	%o7,	%o5,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x2
	nop
	setx	loop_1813,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8sux16	%f12,	%f16,	%f2
	udivx	%i4,	0x0ADD,	%l1
	fbe	%fcc0,	loop_1814
loop_1813:
	addcc	%g1,	%l6,	%i6
	array8	%l4,	%i0,	%g5
	movg	%icc,	%g2,	%l2
loop_1814:
	sub	%l3,	0x19A1,	%i7
	wr	%g0,	0x4f,	%asi
	stxa	%g6,	[%g0 + 0x8] %asi
	udivx	%g4,	0x034E,	%l5
	ba	%xcc,	loop_1815
	te	%xcc,	0x0
	fbul	%fcc3,	loop_1816
	edge16	%i1,	%g7,	%o2
loop_1815:
	tgu	%xcc,	0x5
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1816:
	movrne	%l0,	%o6,	%o0
	tcc	%xcc,	0x7
	orncc	%i3,	0x0683,	%o1
	and	%o4,	%g3,	%o3
	sll	%o7,	%i5,	%i2
	array16	%i4,	%l1,	%o5
	sethi	0x1F56,	%g1
	movvc	%icc,	%l6,	%i6
	fmovrdlez	%i0,	%f18,	%f12
	brgz	%l4,	loop_1817
	fmovdn	%xcc,	%f25,	%f0
	fbu,a	%fcc3,	loop_1818
	add	%g2,	0x1816,	%l2
loop_1817:
	srl	%l3,	0x15,	%i7
	subc	%g6,	0x0828,	%g5
loop_1818:
	orn	%l5,	%i1,	%g7
	movvs	%icc,	%g4,	%l0
	fmovdn	%xcc,	%f20,	%f3
	ble,pn	%icc,	loop_1819
	movrne	%o6,	%o0,	%o2
	tvs	%icc,	0x4
	orcc	%i3,	%o1,	%g3
loop_1819:
	lduh	[%l7 + 0x10],	%o3
	orcc	%o7,	%i5,	%o4
	edge16	%i2,	%i4,	%o5
	tleu	%icc,	0x4
	ba,a,pn	%icc,	loop_1820
	bn,a,pn	%xcc,	loop_1821
	fpadd32s	%f19,	%f15,	%f28
	movn	%icc,	%l1,	%l6
loop_1820:
	edge32l	%i6,	%i0,	%g1
loop_1821:
	mova	%xcc,	%g2,	%l4
	movvs	%xcc,	%l3,	%l2
	fands	%f23,	%f25,	%f24
	fpadd32	%f2,	%f18,	%f24
	orn	%g6,	%g5,	%i7
	orcc	%i1,	0x15D8,	%g7
	fornot1	%f30,	%f16,	%f18
	addccc	%l5,	%l0,	%o6
	taddcctv	%g4,	%o0,	%i3
	fpadd32	%f10,	%f12,	%f22
	ldsw	[%l7 + 0x38],	%o1
	mulx	%g3,	0x1DC4,	%o3
	tpos	%xcc,	0x2
	movle	%xcc,	%o2,	%o7
	xnorcc	%o4,	0x07DE,	%i2
	smulcc	%i5,	%o5,	%l1
	orncc	%l6,	0x1C2E,	%i4
	fxnor	%f2,	%f6,	%f26
	tpos	%xcc,	0x1
	movleu	%xcc,	%i0,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g2,	%l4,	%l3
	fbge	%fcc2,	loop_1822
	movrgez	%i6,	0x079,	%g6
	brnz	%g5,	loop_1823
	movcs	%xcc,	%i7,	%i1
loop_1822:
	nop
	set	0x50, %o1
	stda	%g6,	[%l7 + %o1] 0x81
loop_1823:
	sdivx	%l2,	0x1E2C,	%l5
	wr	%g0,	0x11,	%asi
	stda	%l0,	[%l7 + 0x38] %asi
	fnands	%f2,	%f11,	%f27
	edge16l	%g4,	%o6,	%o0
	fmovsge	%icc,	%f10,	%f24
	edge32l	%i3,	%o1,	%o3
	taddcctv	%g3,	%o7,	%o4
	stbar
	smul	%o2,	0x06AB,	%i5
	fbule	%fcc2,	loop_1824
	edge16	%o5,	%i2,	%l6
	alignaddr	%i4,	%i0,	%l1
	fmovdgu	%icc,	%f28,	%f0
loop_1824:
	tg	%icc,	0x7
	fbul,a	%fcc2,	loop_1825
	tg	%xcc,	0x5
	te	%xcc,	0x7
	movle	%icc,	%g1,	%l4
loop_1825:
	movgu	%icc,	%g2,	%i6
	fpackfix	%f6,	%f18
	udiv	%l3,	0x0412,	%g6
	orcc	%g5,	0x11C1,	%i7
	ldsw	[%l7 + 0x70],	%i1
	fcmpgt32	%f30,	%f8,	%l2
	ta	%xcc,	0x3
	tg	%xcc,	0x5
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%g6
	sub	%l0,	0x005B,	%g4
	and	%l5,	%o6,	%o0
	tvc	%xcc,	0x0
	tvc	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	xnorcc	%i3,	%o3,	%o1
	fands	%f30,	%f21,	%f2
	tvc	%xcc,	0x5
	fmovdcs	%xcc,	%f6,	%f0
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	sra	%g3,	%o7,	%o4
	fblg	%fcc0,	loop_1826
	fmovdn	%xcc,	%f11,	%f7
	sdivx	%i5,	0x0EF2,	%o2
	subc	%o5,	0x1C68,	%i2
loop_1826:
	movl	%xcc,	%i4,	%i0
	fmovda	%xcc,	%f24,	%f17
	fmovrsgez	%l6,	%f30,	%f2
	alignaddr	%g1,	%l1,	%l4
	sra	%g2,	%i6,	%g6
	umulcc	%l3,	%g5,	%i7
	stw	%i1,	[%l7 + 0x70]
	movl	%xcc,	%g7,	%l0
	fxors	%f29,	%f17,	%f8
	fmovrde	%l2,	%f14,	%f28
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	srl	%l5,	%g4,	%o6
	alignaddr	%i3,	%o0,	%o3
	siam	0x4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x50] %asi,	%o1
	sra	%o7,	0x05,	%o4
	fmovdvs	%xcc,	%f8,	%f17
	edge16ln	%g3,	%i5,	%o2
	movgu	%icc,	%i2,	%o5
	call	loop_1827
	movl	%xcc,	%i4,	%i0
	be,pn	%icc,	loop_1828
	tn	%icc,	0x1
loop_1827:
	fsrc2s	%f9,	%f13
	fblg,a	%fcc3,	loop_1829
loop_1828:
	tneg	%xcc,	0x5
	wr	%g0,	0xe3,	%asi
	stba	%g1,	[%l7 + 0x74] %asi
	membar	#Sync
loop_1829:
	fsrc1s	%f0,	%f20
	tcs	%icc,	0x1
	movne	%icc,	%l1,	%l6
	ta	%icc,	0x3
	movrgez	%g2,	0x093,	%i6
	movrgz	%l4,	%l3,	%g5
	edge32n	%g6,	%i1,	%i7
	fbue	%fcc0,	loop_1830
	fbo,a	%fcc2,	loop_1831
	fands	%f11,	%f10,	%f21
	fnot1	%f10,	%f22
loop_1830:
	edge8ln	%g7,	%l0,	%l2
loop_1831:
	tn	%icc,	0x1
	array16	%g4,	%o6,	%l5
	fmovdg	%xcc,	%f5,	%f17
	movcc	%xcc,	%i3,	%o3
	fmovdleu	%xcc,	%f3,	%f29
	edge16	%o0,	%o7,	%o4
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x27,	%o0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x7D] %asi,	%i5
	fmovdn	%xcc,	%f15,	%f18
	edge32	%g3,	%o2,	%o5
	srl	%i4,	%i0,	%i2
	fbul,a	%fcc3,	loop_1832
	fsrc2s	%f11,	%f24
	sir	0x0C54
	fcmpd	%fcc0,	%f2,	%f6
loop_1832:
	bpos	%icc,	loop_1833
	nop
	set	0x58, %l3
	prefetch	[%l7 + %l3],	 0x3
	movrgz	%l1,	%l6,	%g1
	tleu	%xcc,	0x2
loop_1833:
	mova	%xcc,	%i6,	%g2
	fmuld8ulx16	%f1,	%f30,	%f20
	movrlez	%l4,	0x07C,	%l3
	subcc	%g5,	0x1388,	%i1
	fbug,a	%fcc0,	loop_1834
	flush	%l7 + 0x10
	srl	%g6,	0x14,	%g7
	fmovrdlz	%l0,	%f22,	%f24
loop_1834:
	addc	%l2,	0x11C3,	%i7
	taddcc	%g4,	%o6,	%i3
	andncc	%l5,	%o3,	%o7
	udivx	%o4,	0x0D6B,	%o1
	edge8	%o0,	%g3,	%i5
	ldd	[%l7 + 0x40],	%f10
	srlx	%o5,	0x1B,	%i4
	movleu	%icc,	%o2,	%i2
	sdiv	%i0,	0x0DD3,	%l1
	srl	%l6,	%i6,	%g2
	brgz,a	%g1,	loop_1835
	tvc	%xcc,	0x1
	brlez	%l3,	loop_1836
	bge,pn	%xcc,	loop_1837
loop_1835:
	bne,pt	%xcc,	loop_1838
	mulx	%g5,	%l4,	%g6
loop_1836:
	fmovsleu	%icc,	%f19,	%f12
loop_1837:
	movrgz	%i1,	0x154,	%g7
loop_1838:
	bpos,a,pn	%icc,	loop_1839
	bvs,a,pn	%xcc,	loop_1840
	fbe,a	%fcc1,	loop_1841
	be	loop_1842
loop_1839:
	sethi	0x0BA3,	%l0
loop_1840:
	fandnot1s	%f17,	%f29,	%f24
loop_1841:
	umul	%l2,	%i7,	%g4
loop_1842:
	brgez	%i3,	loop_1843
	faligndata	%f28,	%f2,	%f22
	fpadd32s	%f23,	%f22,	%f21
	tleu	%icc,	0x3
loop_1843:
	bcc,pt	%xcc,	loop_1844
	andncc	%l5,	%o3,	%o7
	orcc	%o4,	%o6,	%o0
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1844:
	movg	%xcc,	%g3,	%o1
	srax	%i5,	%o5,	%o2
	bshuffle	%f4,	%f4,	%f14
	orncc	%i2,	0x0B18,	%i4
	fcmpgt32	%f10,	%f20,	%l1
	tle	%xcc,	0x3
	sdivx	%l6,	0x1F9E,	%i0
	tpos	%icc,	0x2
	movre	%i6,	0x272,	%g1
	udiv	%l3,	0x0996,	%g2
	fmovdle	%xcc,	%f4,	%f5
	fmul8sux16	%f20,	%f24,	%f28
	srl	%l4,	0x13,	%g5
	tpos	%xcc,	0x0
	movrlz	%g6,	0x0DD,	%g7
	add	%i1,	%l0,	%l2
	fnot1s	%f4,	%f7
	subccc	%i7,	0x0812,	%i3
	sethi	0x0E96,	%g4
	movvc	%icc,	%l5,	%o7
	alignaddrl	%o3,	%o6,	%o4
	te	%icc,	0x1
	nop
	set	0x18, %g7
	lduh	[%l7 + %g7],	%o0
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x2e,	%g2
	tsubcc	%i5,	0x1804,	%o1
	edge8ln	%o5,	%o2,	%i4
	fornot1s	%f26,	%f6,	%f1
	tcs	%xcc,	0x2
	subccc	%l1,	%i2,	%l6
	umul	%i0,	%i6,	%l3
	movge	%xcc,	%g2,	%g1
	alignaddr	%g5,	%g6,	%l4
	tle	%xcc,	0x4
	subccc	%g7,	%l0,	%i1
	fbe,a	%fcc3,	loop_1845
	andncc	%i7,	%l2,	%i3
	st	%f26,	[%l7 + 0x4C]
	fabsd	%f4,	%f28
loop_1845:
	tn	%icc,	0x7
	fpsub32s	%f13,	%f29,	%f22
	fmovrdgz	%l5,	%f0,	%f4
	xnor	%o7,	%g4,	%o6
	edge16l	%o4,	%o3,	%o0
	movge	%icc,	%g3,	%o1
	smul	%i5,	0x022C,	%o5
	fsrc2	%f0,	%f0
	fmovscc	%icc,	%f1,	%f10
	sra	%o2,	0x18,	%l1
	bpos,a	loop_1846
	bl,a	%icc,	loop_1847
	tgu	%icc,	0x7
	srax	%i2,	%l6,	%i4
loop_1846:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1847:
	edge32ln	%i6,	%l3,	%i0
	movvs	%xcc,	%g2,	%g5
	xnor	%g6,	0x1848,	%g1
	movrgez	%g7,	0x3DD,	%l0
	movneg	%icc,	%i1,	%i7
	edge16l	%l2,	%i3,	%l5
	sir	0x0F30
	add	%o7,	0x142F,	%l4
	alignaddrl	%g4,	%o6,	%o4
	umul	%o3,	0x1CF9,	%o0
	fmovdcc	%icc,	%f28,	%f14
	sra	%g3,	%o1,	%i5
	addcc	%o2,	0x1351,	%l1
	tcc	%xcc,	0x4
	edge32	%o5,	%i2,	%l6
	addccc	%i4,	%l3,	%i6
	fcmpeq16	%f20,	%f24,	%i0
	edge8	%g2,	%g5,	%g6
	fmovdl	%xcc,	%f15,	%f5
	orncc	%g1,	%g7,	%l0
	edge16	%i7,	%i1,	%l2
	subc	%i3,	0x17DF,	%o7
	sdiv	%l4,	0x0282,	%l5
	mulscc	%o6,	0x1324,	%o4
	bn,pt	%icc,	loop_1848
	alignaddr	%o3,	%g4,	%g3
	fmul8x16au	%f25,	%f15,	%f28
	tl	%xcc,	0x3
loop_1848:
	ldd	[%l7 + 0x08],	%o0
	andcc	%i5,	%o2,	%l1
	sethi	0x093C,	%o0
	addcc	%o5,	%i2,	%l6
	brz	%i4,	loop_1849
	udivx	%i6,	0x0A09,	%l3
	fmovdcs	%xcc,	%f2,	%f10
	fnors	%f16,	%f10,	%f13
loop_1849:
	fblg	%fcc3,	loop_1850
	movrlz	%g2,	%g5,	%g6
	add	%g1,	0x0385,	%i0
	tcc	%xcc,	0x2
loop_1850:
	and	%g7,	%l0,	%i7
	bgu,a,pn	%icc,	loop_1851
	movrlez	%i1,	%l2,	%i3
	subcc	%l4,	%l5,	%o6
	udivx	%o7,	0x098F,	%o4
loop_1851:
	sdiv	%o3,	0x0899,	%g3
	tpos	%xcc,	0x4
	bgu,a,pt	%xcc,	loop_1852
	fble,a	%fcc3,	loop_1853
	ldx	[%l7 + 0x38],	%g4
	smulcc	%o1,	%o2,	%i5
loop_1852:
	movcc	%icc,	%o0,	%l1
loop_1853:
	move	%icc,	%o5,	%l6
	udivx	%i2,	0x031C,	%i6
	bcs	%xcc,	loop_1854
	tvs	%icc,	0x0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%i4
loop_1854:
	bge,a	%icc,	loop_1855
	fnot1	%f28,	%f8
	movleu	%icc,	%g2,	%g5
	fnand	%f0,	%f16,	%f2
loop_1855:
	nop
	setx	loop_1856,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%xcc,	%l3,	%g6
	srl	%g1,	0x00,	%g7
	movg	%xcc,	%l0,	%i0
loop_1856:
	movvs	%icc,	%i7,	%l2
	fbg	%fcc2,	loop_1857
	fcmpne32	%f6,	%f6,	%i3
	sth	%l4,	[%l7 + 0x42]
	tsubcctv	%i1,	0x1160,	%l5
loop_1857:
	movrne	%o6,	%o7,	%o3
	movcs	%xcc,	%g3,	%g4
	edge16ln	%o4,	%o1,	%o2
	tsubcctv	%i5,	0x13CE,	%l1
	udiv	%o0,	0x137A,	%l6
	pdist	%f12,	%f18,	%f12
	fbne	%fcc2,	loop_1858
	edge32n	%i2,	%i6,	%o5
	movpos	%xcc,	%i4,	%g5
	orcc	%l3,	%g6,	%g1
loop_1858:
	std	%g6,	[%l7 + 0x28]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x18
	bcs,pn	%icc,	loop_1859
	edge32	%l0,	%i0,	%i7
	movneg	%xcc,	%l2,	%i3
	udivx	%g2,	0x01DE,	%i1
loop_1859:
	fornot2	%f12,	%f24,	%f12
	tl	%xcc,	0x3
	orn	%l4,	%o6,	%o7
	sub	%o3,	%g3,	%l5
	bleu,a	%xcc,	loop_1860
	ldx	[%l7 + 0x10],	%o4
	fmul8sux16	%f4,	%f20,	%f12
	movcs	%xcc,	%g4,	%o2
loop_1860:
	fmovdne	%icc,	%f11,	%f15
	movge	%xcc,	%i5,	%l1
	edge8ln	%o0,	%o1,	%l6
	sdivcc	%i6,	0x0C25,	%i2
	mulscc	%o5,	%i4,	%l3
	fnot2	%f26,	%f0
	xnorcc	%g5,	%g6,	%g1
	fba,a	%fcc0,	loop_1861
	addccc	%l0,	%g7,	%i7
	xnorcc	%l2,	0x1F20,	%i0
	tne	%xcc,	0x5
loop_1861:
	nop
	set	0x66, %g2
	lduh	[%l7 + %g2],	%i3
	fmovrdgez	%g2,	%f14,	%f14
	sir	0x1D14
	alignaddr	%l4,	%i1,	%o6
	srlx	%o3,	0x17,	%g3
	umul	%o7,	0x07ED,	%o4
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldd	[%l7 + 0x28],	%f28
	fnot2s	%f30,	%f28
	movcc	%icc,	%g4,	%o2
	movvc	%xcc,	%l5,	%i5
	bcs,a	loop_1862
	fbule,a	%fcc2,	loop_1863
	bvc,a,pn	%xcc,	loop_1864
	fbule,a	%fcc1,	loop_1865
loop_1862:
	move	%xcc,	%l1,	%o0
loop_1863:
	andn	%l6,	0x03FE,	%i6
loop_1864:
	movre	%i2,	%o1,	%o5
loop_1865:
	xnor	%l3,	%g5,	%g6
	fnors	%f6,	%f13,	%f9
	orcc	%g1,	%i4,	%g7
	tn	%icc,	0x4
	bshuffle	%f24,	%f22,	%f6
	edge16ln	%i7,	%l2,	%l0
	fmovsvs	%xcc,	%f17,	%f15
	movle	%xcc,	%i0,	%g2
	edge8	%i3,	%i1,	%o6
	fsrc2	%f10,	%f16
	bcs,pt	%xcc,	loop_1866
	fmovrdgez	%l4,	%f6,	%f16
	fnands	%f3,	%f27,	%f23
	tvc	%xcc,	0x1
loop_1866:
	nop
	setx	loop_1867,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%o3,	%g3,	%o4
	or	%g4,	%o7,	%o2
	array16	%l5,	%i5,	%o0
loop_1867:
	edge32ln	%l6,	%i6,	%l1
	fors	%f14,	%f24,	%f18
	for	%f8,	%f28,	%f28
	fmovsneg	%icc,	%f0,	%f0
	nop
	setx	loop_1868,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%o1,	%o5,	%i2
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x22,	%l2
loop_1868:
	fmovrdgz	%g5,	%f4,	%f0
	xor	%g1,	0x0051,	%g6
	fmovrde	%g7,	%f6,	%f4
	bneg,pt	%icc,	loop_1869
	edge8ln	%i7,	%i4,	%l0
	bn,pn	%icc,	loop_1870
	fbo,a	%fcc3,	loop_1871
loop_1869:
	fbn,a	%fcc0,	loop_1872
	fmovs	%f25,	%f3
loop_1870:
	sdiv	%l2,	0x1A6B,	%i0
loop_1871:
	movcc	%icc,	%i3,	%g2
loop_1872:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o6
	ldsh	[%l7 + 0x6C],	%i1
	stx	%o3,	[%l7 + 0x38]
	wr	%g0,	0x04,	%asi
	sta	%f31,	[%l7 + 0x48] %asi
	fnot1s	%f1,	%f23
	addccc	%l4,	0x03DF,	%g3
	popc	%g4,	%o4
	tgu	%xcc,	0x4
	andcc	%o2,	0x04A1,	%l5
	movrlez	%i5,	%o7,	%l6
	fornot1	%f20,	%f2,	%f22
	andcc	%i6,	%l1,	%o0
	ldsb	[%l7 + 0x3C],	%o5
	tcc	%xcc,	0x6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i2
	nop
	setx	loop_1873,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32s	%f31,	%f25,	%f16
	fmovsne	%xcc,	%f28,	%f16
	movgu	%xcc,	%o1,	%g5
loop_1873:
	tvs	%xcc,	0x0
	set	0x14, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g1
	edge16n	%g6,	%g7,	%l3
	fpmerge	%f19,	%f1,	%f22
	fmovsg	%xcc,	%f14,	%f20
	flush	%l7 + 0x68
	sth	%i7,	[%l7 + 0x16]
	srlx	%l0,	0x0C,	%i4
	edge16	%l2,	%i3,	%g2
	or	%o6,	%i1,	%o3
	taddcctv	%i0,	%l4,	%g4
	fba,a	%fcc0,	loop_1874
	tcs	%icc,	0x4
	edge32n	%g3,	%o4,	%o2
	bneg,pt	%icc,	loop_1875
loop_1874:
	brgez	%l5,	loop_1876
	fbule	%fcc1,	loop_1877
	fcmpgt16	%f2,	%f2,	%o7
loop_1875:
	movpos	%xcc,	%i5,	%i6
loop_1876:
	siam	0x6
loop_1877:
	popc	%l1,	%o0
	umulcc	%l6,	0x1F58,	%i2
	fmovrsgz	%o1,	%f27,	%f8
	movl	%icc,	%o5,	%g1
	bvs	loop_1878
	movgu	%icc,	%g5,	%g7
	faligndata	%f28,	%f14,	%f8
	array8	%g6,	%l3,	%l0
loop_1878:
	fmul8x16au	%f27,	%f19,	%f30
	array16	%i4,	%i7,	%i3
	movrgez	%g2,	%o6,	%i1
	set	0x49, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o3
	ta	%icc,	0x5
	fbug	%fcc1,	loop_1879
	xorcc	%l2,	%l4,	%i0
	tsubcctv	%g3,	0x0846,	%o4
	bleu,a	loop_1880
loop_1879:
	fmovsl	%icc,	%f12,	%f28
	nop
	set	0x1C, %g6
	ldsh	[%l7 + %g6],	%o2
	udivcc	%g4,	0x0584,	%l5
loop_1880:
	fbl,a	%fcc1,	loop_1881
	movn	%icc,	%i5,	%o7
	edge8	%l1,	%i6,	%l6
	tsubcc	%i2,	0x17F0,	%o0
loop_1881:
	tn	%icc,	0x0
	movrgz	%o5,	%g1,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o1,	0x1758,	%g7
	addc	%g6,	0x1F4D,	%l3
	xorcc	%l0,	%i7,	%i4
	fmovde	%icc,	%f19,	%f20
	movrlez	%i3,	%o6,	%i1
	fornot2	%f10,	%f4,	%f0
	taddcctv	%o3,	0x1508,	%l2
	tn	%xcc,	0x7
	andn	%g2,	%l4,	%i0
	membar	0x15
	alignaddrl	%g3,	%o4,	%o2
	fba,a	%fcc3,	loop_1882
	fpsub32s	%f16,	%f5,	%f4
	xor	%g4,	0x0005,	%l5
	nop
	setx loop_1883, %l0, %l1
	jmpl %l1, %o7
loop_1882:
	andcc	%l1,	%i5,	%i6
	fcmpne32	%f4,	%f24,	%l6
	movrlz	%i2,	%o5,	%o0
loop_1883:
	fmovsg	%xcc,	%f14,	%f21
	fmovs	%f26,	%f5
	srax	%g5,	0x08,	%g1
	fornot1	%f18,	%f16,	%f10
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g7,	%o1
	ldstub	[%l7 + 0x66],	%g6
	sdivcc	%l0,	0x0667,	%l3
	movpos	%icc,	%i7,	%i3
	movvc	%icc,	%i4,	%o6
	ldsh	[%l7 + 0x20],	%i1
	bgu	%icc,	loop_1884
	fand	%f6,	%f8,	%f18
	movrlz	%l2,	%o3,	%g2
	umul	%i0,	%l4,	%g3
loop_1884:
	fcmpgt16	%f20,	%f16,	%o2
	fmovsg	%icc,	%f26,	%f12
	sir	0x1575
	set	0x78, %i5
	sta	%f31,	[%l7 + %i5] 0x0c
	edge32n	%g4,	%o4,	%o7
	tcc	%xcc,	0x0
	ld	[%l7 + 0x6C],	%f3
	bcc,a,pn	%xcc,	loop_1885
	bneg,pt	%xcc,	loop_1886
	movle	%icc,	%l1,	%i5
	bn,a	loop_1887
loop_1885:
	umulcc	%i6,	0x1B05,	%l5
loop_1886:
	fcmpes	%fcc0,	%f28,	%f25
	brlz,a	%i2,	loop_1888
loop_1887:
	or	%o5,	0x0354,	%o0
	fpadd32s	%f6,	%f22,	%f12
	movleu	%xcc,	%l6,	%g1
loop_1888:
	taddcc	%g7,	0x17AA,	%g5
	addcc	%g6,	%l0,	%o1
	fpsub16s	%f17,	%f17,	%f16
	sra	%l3,	%i7,	%i4
	sth	%i3,	[%l7 + 0x64]
	fbuge	%fcc3,	loop_1889
	fmul8sux16	%f14,	%f30,	%f10
	brgez	%i1,	loop_1890
	movn	%icc,	%o6,	%l2
loop_1889:
	fmovsn	%xcc,	%f6,	%f26
	fbule,a	%fcc3,	loop_1891
loop_1890:
	for	%f20,	%f22,	%f14
	fmovdcc	%icc,	%f16,	%f2
	smul	%o3,	0x049F,	%i0
loop_1891:
	andn	%l4,	%g3,	%g2
	alignaddr	%o2,	%o4,	%o7
	srlx	%g4,	%l1,	%i5
	sub	%i6,	0x1D2C,	%l5
	fblg,a	%fcc0,	loop_1892
	fmovrdlez	%o5,	%f0,	%f26
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
loop_1892:
	fmovspos	%icc,	%f12,	%f2
	sdivx	%l6,	0x0483,	%i2
	mulx	%g1,	0x1D5E,	%g5
	fmovdl	%xcc,	%f30,	%f16
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	array32	%g7,	%l0,	%o1
	swap	[%l7 + 0x1C],	%i7
	andn	%l3,	%i4,	%i3
	fone	%f12
	movrlz	%i1,	0x3B2,	%l2
	sethi	0x1BEC,	%o3
	fmovdvs	%xcc,	%f11,	%f20
	te	%xcc,	0x1
	edge16n	%o6,	%l4,	%i0
	nop
	set	0x74, %i4
	ldsw	[%l7 + %i4],	%g3
	movgu	%xcc,	%o2,	%g2
	brgz	%o7,	loop_1893
	fxor	%f2,	%f12,	%f18
	tpos	%icc,	0x2
	sdivx	%o4,	0x0BD9,	%g4
loop_1893:
	ble	loop_1894
	fmovdg	%icc,	%f2,	%f17
	sdivx	%l1,	0x1675,	%i6
	movleu	%xcc,	%l5,	%i5
loop_1894:
	fba	%fcc0,	loop_1895
	orn	%o0,	0x1421,	%o5
	bvc,a,pt	%xcc,	loop_1896
	movcc	%icc,	%l6,	%i2
loop_1895:
	movvc	%xcc,	%g5,	%g1
	udivcc	%g7,	0x0E08,	%g6
loop_1896:
	sdivcc	%l0,	0x1524,	%i7
	tl	%xcc,	0x7
	fbule,a	%fcc2,	loop_1897
	sdivcc	%o1,	0x0A6F,	%l3
	edge8	%i4,	%i1,	%l2
	tle	%xcc,	0x1
loop_1897:
	movg	%xcc,	%o3,	%o6
	ldub	[%l7 + 0x3E],	%i3
	fbug,a	%fcc1,	loop_1898
	fors	%f30,	%f2,	%f16
	or	%l4,	0x0FF8,	%i0
	mova	%icc,	%g3,	%g2
loop_1898:
	bne,pt	%xcc,	loop_1899
	sdivcc	%o2,	0x07C3,	%o4
	bge,pn	%icc,	loop_1900
	srlx	%g4,	%l1,	%o7
loop_1899:
	orncc	%i6,	%i5,	%l5
	call	loop_1901
loop_1900:
	smul	%o0,	%o5,	%l6
	tcc	%icc,	0x4
	tg	%icc,	0x2
loop_1901:
	fmovscs	%icc,	%f25,	%f2
	andcc	%i2,	%g5,	%g7
	fones	%f16
	or	%g6,	%l0,	%i7
	subc	%g1,	0x1156,	%o1
	ba,a	%icc,	loop_1902
	fornot2s	%f12,	%f21,	%f30
	subccc	%l3,	0x0B72,	%i1
	xor	%i4,	%l2,	%o3
loop_1902:
	nop
	set	0x28, %l1
	stxa	%i3,	[%l7 + %l1] 0xe2
	membar	#Sync
	fmovrdgz	%l4,	%f8,	%f18
	fbug,a	%fcc3,	loop_1903
	edge16n	%o6,	%i0,	%g3
	and	%g2,	%o2,	%o4
	movcs	%icc,	%l1,	%o7
loop_1903:
	fnot2s	%f2,	%f26
	ldd	[%l7 + 0x40],	%g4
	fcmpne32	%f6,	%f26,	%i6
	tvc	%icc,	0x7
	ldstub	[%l7 + 0x2C],	%l5
	movleu	%icc,	%o0,	%i5
	fbg,a	%fcc3,	loop_1904
	fblg	%fcc0,	loop_1905
	brgz	%o5,	loop_1906
	fmovsn	%xcc,	%f8,	%f7
loop_1904:
	edge32	%i2,	%g5,	%g7
loop_1905:
	edge16ln	%g6,	%l0,	%i7
loop_1906:
	fmovrslez	%l6,	%f30,	%f22
	fbge,a	%fcc0,	loop_1907
	fpadd32	%f16,	%f8,	%f24
	bcc,pt	%xcc,	loop_1908
	subcc	%o1,	0x0EB3,	%g1
loop_1907:
	sllx	%i1,	%i4,	%l2
	fbule	%fcc1,	loop_1909
loop_1908:
	udivx	%o3,	0x1F90,	%i3
	array32	%l4,	%o6,	%i0
	te	%xcc,	0x3
loop_1909:
	fpsub32s	%f24,	%f11,	%f7
	tsubcctv	%g3,	0x0C60,	%g2
	xorcc	%l3,	0x1BDF,	%o4
	fmovdpos	%xcc,	%f5,	%f18
	fblg	%fcc1,	loop_1910
	andncc	%l1,	%o2,	%g4
	movneg	%xcc,	%i6,	%o7
	fmul8ulx16	%f8,	%f8,	%f2
loop_1910:
	mulscc	%l5,	%i5,	%o5
	edge16n	%i2,	%o0,	%g7
	orn	%g5,	%l0,	%g6
	movrlz	%i7,	0x070,	%o1
	movpos	%xcc,	%g1,	%i1
	edge32	%i4,	%l2,	%l6
	sub	%i3,	0x0E08,	%o3
	ldd	[%l7 + 0x30],	%f6
	sllx	%l4,	%o6,	%g3
	tleu	%xcc,	0x7
	fones	%f18
	for	%f30,	%f24,	%f10
	udiv	%i0,	0x0F23,	%g2
	edge16n	%l3,	%l1,	%o4
	ta	%icc,	0x0
	fcmpne32	%f12,	%f16,	%o2
	movg	%icc,	%i6,	%g4
	movl	%xcc,	%o7,	%l5
	fpack32	%f2,	%f30,	%f8
	brlez	%o5,	loop_1911
	movrlez	%i5,	0x1DF,	%i2
	xnor	%o0,	0x0673,	%g7
	fbge	%fcc2,	loop_1912
loop_1911:
	fmovsn	%xcc,	%f10,	%f14
	sll	%l0,	0x17,	%g5
	fcmpes	%fcc3,	%f15,	%f18
loop_1912:
	stx	%i7,	[%l7 + 0x38]
	edge8ln	%g6,	%g1,	%o1
	ldsh	[%l7 + 0x12],	%i1
	fbl,a	%fcc1,	loop_1913
	ta	%icc,	0x0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i4
loop_1913:
	tl	%xcc,	0x4
	te	%icc,	0x6
	fbo	%fcc1,	loop_1914
	add	%l6,	0x06A5,	%i3
	fnor	%f30,	%f24,	%f8
	set	0x38, %i7
	stda	%l2,	[%l7 + %i7] 0x2f
	membar	#Sync
loop_1914:
	movn	%xcc,	%o3,	%o6
	movrlez	%g3,	0x1E3,	%l4
	tpos	%xcc,	0x1
	tgu	%xcc,	0x0
	nop
	setx loop_1915, %l0, %l1
	jmpl %l1, %i0
	sdivx	%g2,	0x0231,	%l1
	nop
	set	0x2B, %o4
	stb	%o4,	[%l7 + %o4]
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
loop_1915:
	movleu	%icc,	%l3,	%i6
	fcmpes	%fcc0,	%f31,	%f12
	orncc	%o7,	0x172B,	%g4
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l5
	movge	%icc,	%i5,	%i2
	brz,a	%o5,	loop_1916
	srl	%o0,	%l0,	%g5
	fcmpgt16	%f22,	%f30,	%g7
	fcmpeq32	%f0,	%f4,	%g6
loop_1916:
	fcmple16	%f4,	%f8,	%g1
	fandnot2s	%f22,	%f12,	%f26
	movgu	%xcc,	%i7,	%i1
	movvs	%xcc,	%i4,	%o1
	fsrc1	%f16,	%f14
	fbge	%fcc0,	loop_1917
	tneg	%xcc,	0x6
	tn	%xcc,	0x1
	movgu	%xcc,	%i3,	%l2
loop_1917:
	alignaddr	%l6,	%o6,	%g3
	ld	[%l7 + 0x68],	%f23
	fbuge,a	%fcc3,	loop_1918
	tpos	%xcc,	0x1
	ta	%xcc,	0x1
	sll	%o3,	%l4,	%g2
loop_1918:
	popc	%i0,	%l1
	tcs	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	stwa	%o2,	[%l7 + 0x24] %asi
	movleu	%icc,	%o4,	%l3
	fbule,a	%fcc3,	loop_1919
	movrgez	%o7,	%i6,	%l5
	array32	%i5,	%g4,	%o5
	prefetch	[%l7 + 0x10],	 0x1
loop_1919:
	alignaddrl	%o0,	%l0,	%g5
	fmovrse	%g7,	%f16,	%f11
	tl	%icc,	0x2
	tpos	%xcc,	0x3
	sdivcc	%g6,	0x16A9,	%i2
	tpos	%xcc,	0x3
	smul	%i7,	%g1,	%i4
	edge8n	%i1,	%i3,	%o1
	or	%l2,	0x1396,	%o6
	sllx	%l6,	0x10,	%o3
	movleu	%icc,	%g3,	%l4
	orncc	%g2,	0x1259,	%i0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x30] %asi,	%o2
	tgu	%icc,	0x2
	add	%l1,	%o4,	%o7
	movpos	%icc,	%l3,	%l5
	tge	%icc,	0x5
	fabss	%f21,	%f8
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	tleu	%icc,	0x6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g4
	fpadd16s	%f6,	%f9,	%f12
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
	tneg	%icc,	0x5
	bshuffle	%f12,	%f4,	%f26
	fornot2	%f10,	%f6,	%f18
loop_1920:
	fmovdge	%icc,	%f20,	%f18
	umul	%o0,	0x1F58,	%l0
	fands	%f19,	%f3,	%f19
	movrgz	%g5,	0x04E,	%g7
	sra	%o5,	%i2,	%g6
	ldstub	[%l7 + 0x4A],	%i7
	popc	%g1,	%i4
	addc	%i1,	0x0A5C,	%o1
	fmul8ulx16	%f30,	%f14,	%f24
	movge	%xcc,	%i3,	%o6
	tleu	%xcc,	0x7
	addc	%l2,	0x1259,	%l6
	fones	%f2
	srl	%g3,	0x02,	%o3
	fcmpeq32	%f4,	%f26,	%l4
	srlx	%i0,	0x05,	%g2
	tle	%icc,	0x2
	fpsub32s	%f10,	%f20,	%f12
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x10,	%f16
	edge8l	%o2,	%l1,	%o4
	set	0x0, %l0
	stxa	%l3,	[%g0 + %l0] 0x5f
	fmovrdgez	%l5,	%f14,	%f0
	or	%o7,	%i5,	%i6
	array32	%g4,	%l0,	%o0
	for	%f4,	%f0,	%f16
	tn	%xcc,	0x0
	stb	%g7,	[%l7 + 0x1E]
	ta	%icc,	0x4
	udiv	%g5,	0x1705,	%o5
	tl	%icc,	0x1
	fabsd	%f30,	%f8
	orn	%i2,	0x0407,	%g6
	fpack32	%f20,	%f16,	%f24
	fmovrde	%g1,	%f22,	%f2
	bl,a,pn	%icc,	loop_1921
	edge32	%i4,	%i1,	%o1
	fands	%f22,	%f29,	%f20
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x19
loop_1921:
	ldstub	[%l7 + 0x6F],	%i3
	alignaddr	%o6,	%i7,	%l6
	fmovsle	%icc,	%f17,	%f6
	movg	%icc,	%l2,	%g3
	sra	%o3,	%i0,	%l4
	movne	%xcc,	%g2,	%o2
	movre	%l1,	0x111,	%l3
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l5
	sllx	%o7,	0x05,	%i5
	fmovsge	%icc,	%f11,	%f3
	set	0x38, %i1
	ldxa	[%l7 + %i1] 0x14,	%i6
	movgu	%xcc,	%g4,	%l0
	edge8l	%o4,	%o0,	%g7
	fmovspos	%xcc,	%f18,	%f22
	subc	%o5,	0x1F98,	%g5
	sll	%i2,	0x0F,	%g6
	sdivx	%g1,	0x0948,	%i4
	subccc	%i1,	0x1E56,	%o1
	stw	%o6,	[%l7 + 0x5C]
	fxor	%f4,	%f22,	%f18
	subc	%i7,	%l6,	%l2
	fmovsle	%xcc,	%f0,	%f25
	tcc	%xcc,	0x6
	orcc	%i3,	%g3,	%i0
	addccc	%l4,	0x0A9B,	%o3
	fzeros	%f5
	bcs,a	%icc,	loop_1922
	fbu,a	%fcc3,	loop_1923
	st	%f9,	[%l7 + 0x64]
	subccc	%g2,	0x12F4,	%o2
loop_1922:
	tcs	%xcc,	0x6
loop_1923:
	addccc	%l1,	%l5,	%l3
	fornot2s	%f22,	%f0,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1924,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x2
	edge16	%i5,	%i6,	%o7
	fmovrde	%g4,	%f4,	%f16
loop_1924:
	bcs,a	loop_1925
	brgz,a	%l0,	loop_1926
	alignaddrl	%o0,	%o4,	%o5
	alignaddrl	%g7,	%g5,	%i2
loop_1925:
	bcs	%xcc,	loop_1927
loop_1926:
	sll	%g1,	0x05,	%g6
	fmovda	%icc,	%f15,	%f22
	prefetch	[%l7 + 0x68],	 0x1
loop_1927:
	movle	%icc,	%i4,	%o1
	fpack32	%f18,	%f28,	%f22
	brnz	%o6,	loop_1928
	tleu	%icc,	0x2
	bl,a,pt	%icc,	loop_1929
	sub	%i1,	0x1AC3,	%l6
loop_1928:
	udivx	%l2,	0x1427,	%i3
	edge8ln	%i7,	%g3,	%i0
loop_1929:
	bl	loop_1930
	mova	%icc,	%l4,	%o3
	udivcc	%g2,	0x1B03,	%o2
	sub	%l5,	%l3,	%l1
loop_1930:
	fmovdle	%xcc,	%f8,	%f29
	membar	0x09
	edge16	%i6,	%o7,	%i5
	pdist	%f16,	%f10,	%f24
	fmovdl	%xcc,	%f31,	%f16
	fmovdcc	%icc,	%f23,	%f26
	movge	%icc,	%g4,	%o0
	movg	%xcc,	%o4,	%o5
	andcc	%l0,	%g7,	%i2
	srlx	%g5,	0x03,	%g6
	fcmped	%fcc2,	%f28,	%f24
	fbul	%fcc0,	loop_1931
	sth	%i4,	[%l7 + 0x38]
	bvc,a	%icc,	loop_1932
	movge	%xcc,	%o1,	%o6
loop_1931:
	sllx	%i1,	%g1,	%l6
	fmovscs	%icc,	%f18,	%f7
loop_1932:
	edge16ln	%i3,	%i7,	%g3
	movle	%xcc,	%i0,	%l4
	xorcc	%o3,	%g2,	%o2
	bl,a	%xcc,	loop_1933
	tgu	%icc,	0x4
	mova	%icc,	%l2,	%l3
	fpsub16s	%f18,	%f15,	%f30
loop_1933:
	sir	0x15F1
	movleu	%xcc,	%l1,	%l5
	ld	[%l7 + 0x44],	%f3
	smulcc	%o7,	%i6,	%i5
	movvs	%icc,	%g4,	%o0
	fbul	%fcc0,	loop_1934
	array16	%o5,	%o4,	%l0
	fone	%f14
	xorcc	%g7,	%i2,	%g5
loop_1934:
	movle	%icc,	%g6,	%i4
	tle	%icc,	0x7
	fsrc2	%f10,	%f26
	fcmpgt32	%f26,	%f14,	%o1
	fbe,a	%fcc0,	loop_1935
	movgu	%icc,	%o6,	%g1
	sdivcc	%i1,	0x1424,	%i3
	fsrc1	%f20,	%f28
loop_1935:
	edge8n	%i7,	%l6,	%i0
	fmovscc	%icc,	%f10,	%f26
	fmovdleu	%xcc,	%f30,	%f21
	and	%l4,	0x1724,	%o3
	move	%icc,	%g3,	%o2
	ldsw	[%l7 + 0x44],	%g2
	nop
	set	0x0E, %l5
	lduh	[%l7 + %l5],	%l3
	fmovsleu	%icc,	%f18,	%f29
	move	%xcc,	%l1,	%l5
	tsubcc	%o7,	0x19BB,	%i6
	edge8	%i5,	%l2,	%g4
	fexpand	%f30,	%f30
	ta	%icc,	0x0
	tpos	%xcc,	0x1
	bvs,pt	%icc,	loop_1936
	edge8	%o0,	%o5,	%o4
	brz	%g7,	loop_1937
	udivcc	%i2,	0x0EE5,	%l0
loop_1936:
	bn	loop_1938
	mova	%xcc,	%g6,	%i4
loop_1937:
	tl	%icc,	0x5
	lduh	[%l7 + 0x3A],	%g5
loop_1938:
	tvc	%icc,	0x0
	xor	%o1,	0x1656,	%o6
	fpadd32s	%f1,	%f0,	%f0
	fble	%fcc2,	loop_1939
	fbge,a	%fcc0,	loop_1940
	taddcc	%i1,	%i3,	%i7
	stw	%l6,	[%l7 + 0x18]
loop_1939:
	ldsb	[%l7 + 0x5E],	%i0
loop_1940:
	fabss	%f21,	%f3
	ta	%icc,	0x7
	fpack16	%f2,	%f14
	fpack16	%f14,	%f20
	udivx	%g1,	0x0015,	%o3
	edge16	%g3,	%o2,	%g2
	set	0x59, %i3
	stba	%l4,	[%l7 + %i3] 0x23
	membar	#Sync
	fbg,a	%fcc3,	loop_1941
	fmovspos	%icc,	%f11,	%f15
	movle	%xcc,	%l1,	%l3
	membar	0x51
loop_1941:
	bvc	%icc,	loop_1942
	tcc	%icc,	0x3
	fmovrdne	%o7,	%f14,	%f10
	addc	%i6,	%l5,	%l2
loop_1942:
	stb	%g4,	[%l7 + 0x13]
	bgu,a,pn	%icc,	loop_1943
	sra	%i5,	%o0,	%o4
	tl	%icc,	0x0
	fnands	%f15,	%f11,	%f23
loop_1943:
	umul	%o5,	%g7,	%i2
	fcmple16	%f12,	%f20,	%g6
	edge8	%l0,	%i4,	%o1
	fbg	%fcc3,	loop_1944
	movrne	%o6,	%i1,	%i3
	edge8	%g5,	%i7,	%l6
	sub	%g1,	0x1B7C,	%o3
loop_1944:
	ldstub	[%l7 + 0x5C],	%i0
	te	%icc,	0x3
	fandnot2s	%f4,	%f27,	%f11
	sdivx	%g3,	0x1473,	%o2
	fzero	%f0
	tl	%icc,	0x1
	tsubcctv	%l4,	0x01AC,	%g2
	sir	0x1F76
	edge16n	%l1,	%l3,	%o7
	te	%icc,	0x2
	fbg	%fcc1,	loop_1945
	tcs	%icc,	0x4
	addccc	%i6,	%l2,	%g4
	swap	[%l7 + 0x74],	%l5
loop_1945:
	nop
	set	0x62, %l2
	lduba	[%l7 + %l2] 0x88,	%i5
	movrne	%o0,	0x1F2,	%o5
	andn	%o4,	0x1489,	%g7
	movn	%xcc,	%g6,	%i2
	smul	%i4,	%o1,	%o6
	fmovsl	%xcc,	%f23,	%f17
	udivcc	%l0,	0x156B,	%i3
	nop
	setx	loop_1946,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x6
	sethi	0x1B53,	%g5
	edge16	%i7,	%l6,	%g1
loop_1946:
	stbar
	brz,a	%i1,	loop_1947
	tsubcc	%o3,	0x1E19,	%g3
	srax	%o2,	0x06,	%i0
	wr	%g0,	0x2b,	%asi
	stba	%l4,	[%l7 + 0x37] %asi
	membar	#Sync
loop_1947:
	nop
	set	0x40, %o7
	ldsba	[%l7 + %o7] 0x89,	%g2
	fmovrdgz	%l1,	%f28,	%f0
	fmovsne	%xcc,	%f17,	%f12
	fcmpne16	%f2,	%f18,	%o7
	tvc	%icc,	0x5
	nop
	set	0x1E, %i2
	lduh	[%l7 + %i2],	%l3
	fcmpne32	%f4,	%f10,	%i6
	fandnot1	%f26,	%f20,	%f6
	fpsub32	%f6,	%f8,	%f22
	subcc	%g4,	0x15A9,	%l5
	fandnot1	%f10,	%f4,	%f26
	brz	%l2,	loop_1948
	fbge,a	%fcc3,	loop_1949
	xnor	%o0,	%i5,	%o4
	fmul8sux16	%f6,	%f4,	%f4
loop_1948:
	ld	[%l7 + 0x48],	%f21
loop_1949:
	tn	%icc,	0x2
	sethi	0x1018,	%g7
	tgu	%xcc,	0x6
	tsubcc	%o5,	0x1035,	%g6
	tvc	%icc,	0x0
	or	%i4,	%o1,	%i2
	fbu	%fcc0,	loop_1950
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o6,	0x19F0,	%l0
	andcc	%g5,	%i7,	%i3
loop_1950:
	edge32	%g1,	%l6,	%i1
	movge	%xcc,	%g3,	%o2
	lduw	[%l7 + 0x70],	%i0
	nop
	set	0x50, %o3
	std	%f30,	[%l7 + %o3]
	fsrc1s	%f30,	%f3
	fbn	%fcc3,	loop_1951
	fbg,a	%fcc1,	loop_1952
	fnor	%f26,	%f10,	%f26
	ldd	[%l7 + 0x40],	%f0
loop_1951:
	movrgz	%l4,	0x02B,	%g2
loop_1952:
	brgez	%o3,	loop_1953
	sllx	%l1,	0x19,	%l3
	tleu	%icc,	0x1
	andn	%i6,	%g4,	%l5
loop_1953:
	movrgez	%o7,	0x374,	%l2
	fpmerge	%f14,	%f24,	%f20
	udiv	%i5,	0x09C9,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	%icc,	loop_1954
	movvc	%xcc,	%g7,	%o4
	movl	%xcc,	%g6,	%o5
	andncc	%i4,	%o1,	%i2
loop_1954:
	fabss	%f6,	%f31
	udivx	%l0,	0x0A34,	%g5
	tge	%icc,	0x0
	prefetch	[%l7 + 0x1C],	 0x1
	subc	%i7,	0x1587,	%i3
	xnorcc	%o6,	0x1A36,	%g1
	subcc	%l6,	%i1,	%o2
	stbar
	tleu	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	stba	%i0,	[%l7 + 0x27] %asi
	bcs,pt	%icc,	loop_1955
	ld	[%l7 + 0x3C],	%f2
	edge32l	%l4,	%g3,	%o3
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x18,	 0x3
loop_1955:
	tleu	%xcc,	0x0
	fbg,a	%fcc1,	loop_1956
	movvs	%xcc,	%l1,	%i6
	stw	%g4,	[%l7 + 0x28]
	brgez,a	%l3,	loop_1957
loop_1956:
	fandnot2	%f18,	%f28,	%f16
	smulcc	%o7,	%l2,	%l5
	fpsub16	%f26,	%f2,	%f18
loop_1957:
	swap	[%l7 + 0x64],	%i5
	xnor	%o0,	0x1567,	%g7
	tvc	%icc,	0x1
	popc	%o4,	%g6
	fmovd	%f22,	%f26
	array32	%o5,	%i4,	%i2
	fpack16	%f14,	%f18
	wr	%g0,	0x89,	%asi
	stha	%o1,	[%l7 + 0x3A] %asi
	andncc	%g5,	%i7,	%l0
	movvc	%xcc,	%i3,	%g1
	tn	%icc,	0x0
	addc	%l6,	%o6,	%i1
	ble,a	%xcc,	loop_1958
	fsrc2s	%f25,	%f10
	or	%o2,	%i0,	%l4
	fba	%fcc3,	loop_1959
loop_1958:
	udivcc	%g3,	0x1FC0,	%o3
	edge8	%l1,	%g2,	%i6
	popc	0x0988,	%g4
loop_1959:
	movgu	%icc,	%l3,	%o7
	fble	%fcc2,	loop_1960
	movrlz	%l2,	%l5,	%o0
	set	0x20, %g4
	swapa	[%l7 + %g4] 0x11,	%g7
loop_1960:
	bneg,pt	%icc,	loop_1961
	mulx	%i5,	0x0289,	%o4
	ldx	[%l7 + 0x58],	%g6
	tneg	%icc,	0x2
loop_1961:
	fmovsa	%xcc,	%f23,	%f13
	tsubcc	%o5,	0x0220,	%i2
	ba	loop_1962
	fmovsle	%icc,	%f4,	%f6
	fbn	%fcc2,	loop_1963
	fmovsneg	%icc,	%f11,	%f1
loop_1962:
	movle	%xcc,	%o1,	%g5
	fmul8sux16	%f18,	%f2,	%f4
loop_1963:
	movpos	%icc,	%i7,	%l0
	movpos	%icc,	%i4,	%g1
	fmovsge	%icc,	%f31,	%f25
	movl	%icc,	%i3,	%l6
	array8	%o6,	%i1,	%o2
	te	%xcc,	0x2
	brgz	%l4,	loop_1964
	movcs	%icc,	%i0,	%g3
	sllx	%o3,	%l1,	%i6
	edge16	%g2,	%l3,	%g4
loop_1964:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%o7
	orn	%l5,	%l2,	%g7
	bvc,a,pt	%xcc,	loop_1965
	srax	%i5,	0x13,	%o0
	fmovsne	%icc,	%f17,	%f13
	ta	%xcc,	0x5
loop_1965:
	tg	%xcc,	0x1
	movgu	%icc,	%o4,	%o5
	edge32ln	%g6,	%o1,	%g5
	fandnot1	%f26,	%f4,	%f16
	sra	%i7,	0x03,	%i2
	addcc	%i4,	0x0AB5,	%g1
	mulx	%i3,	%l0,	%o6
	bg,a,pn	%xcc,	loop_1966
	fpsub32	%f26,	%f14,	%f14
	fmovdleu	%icc,	%f5,	%f14
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x11,	%i1,	%o2
loop_1966:
	faligndata	%f8,	%f14,	%f12
	fpsub32	%f14,	%f10,	%f14
	subc	%l4,	%i0,	%g3
	addc	%o3,	%l1,	%l6
	sllx	%i6,	%l3,	%g4
	edge16l	%o7,	%l5,	%l2
	subccc	%g2,	0x1DC0,	%i5
	movl	%icc,	%g7,	%o0
	edge16n	%o4,	%o5,	%g6
	sethi	0x18A2,	%g5
	fnot1	%f6,	%f10
	set	0x58, %o1
	lduwa	[%l7 + %o1] 0x0c,	%i7
	movrlez	%o1,	0x14E,	%i2
	movvs	%xcc,	%i4,	%i3
	fands	%f0,	%f12,	%f22
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	mova	%xcc,	%g1,	%o6
	movrlez	%o2,	0x162,	%i1
	bpos	loop_1967
	fnegs	%f0,	%f22
	nop
	setx	loop_1968,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%xcc,	%l4,	%g3
loop_1967:
	taddcc	%o3,	%i0,	%l6
	movleu	%xcc,	%l1,	%i6
loop_1968:
	fmovdne	%xcc,	%f12,	%f26
	sra	%l3,	%o7,	%l5
	edge16	%l2,	%g4,	%i5
	sub	%g7,	0x10C2,	%g2
	set	0x1B, %g3
	ldsba	[%l7 + %g3] 0x11,	%o0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f0
	tge	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o4,	0x08,	%o5
	tsubcc	%g6,	%i7,	%o1
	srlx	%g5,	0x1F,	%i2
	movrne	%i3,	0x2AF,	%l0
	brlez	%g1,	loop_1969
	xnorcc	%i4,	%o6,	%o2
	edge16l	%i1,	%l4,	%g3
	fmovrdne	%o3,	%f22,	%f6
loop_1969:
	lduw	[%l7 + 0x28],	%i0
	umulcc	%l6,	0x09E5,	%i6
	and	%l3,	0x06AF,	%o7
	fnands	%f29,	%f14,	%f0
	sir	0x1F92
	taddcctv	%l5,	%l2,	%l1
	subccc	%i5,	%g7,	%g4
	for	%f20,	%f2,	%f24
	movrlez	%o0,	%g2,	%o5
	xor	%o4,	0x1479,	%i7
	fmovrdgz	%g6,	%f24,	%f2
	popc	%o1,	%i2
	tsubcctv	%g5,	0x155C,	%l0
	movneg	%xcc,	%g1,	%i4
	te	%xcc,	0x1
	fbg	%fcc3,	loop_1970
	movrgez	%i3,	0x03F,	%o2
	taddcc	%o6,	%i1,	%g3
	set	0x21, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o3
loop_1970:
	udivcc	%l4,	0x1BFF,	%l6
	orcc	%i6,	%l3,	%i0
	fbn	%fcc2,	loop_1971
	fmovdleu	%icc,	%f18,	%f7
	srax	%o7,	0x0A,	%l2
	movrgez	%l5,	0x0AC,	%l1
loop_1971:
	xnor	%g7,	%i5,	%g4
	andn	%g2,	0x1FFC,	%o0
	fbl,a	%fcc0,	loop_1972
	xnorcc	%o4,	%i7,	%o5
	xnor	%g6,	%i2,	%o1
	fmovdne	%icc,	%f23,	%f29
loop_1972:
	umulcc	%l0,	%g5,	%i4
	sdivcc	%i3,	0x0FFC,	%o2
	fblg	%fcc2,	loop_1973
	edge8n	%o6,	%i1,	%g3
	edge8	%g1,	%l4,	%o3
	brgz,a	%i6,	loop_1974
loop_1973:
	taddcc	%l6,	%i0,	%o7
	fcmpgt16	%f20,	%f6,	%l3
	fmul8sux16	%f10,	%f12,	%f26
loop_1974:
	orncc	%l2,	0x1AD0,	%l5
	edge32l	%l1,	%g7,	%i5
	movge	%xcc,	%g2,	%g4
	addc	%o4,	%o0,	%o5
	edge16n	%i7,	%g6,	%i2
	movrlz	%o1,	%g5,	%l0
	andn	%i3,	%o2,	%i4
	fmovdle	%xcc,	%f24,	%f17
	fmovdgu	%xcc,	%f13,	%f9
	orcc	%i1,	0x02C5,	%o6
	ldd	[%l7 + 0x28],	%g0
	be,pt	%xcc,	loop_1975
	udivcc	%l4,	0x05B3,	%g3
	edge32n	%i6,	%o3,	%l6
	sdivx	%i0,	0x0A6F,	%o7
loop_1975:
	fmovrdgez	%l2,	%f20,	%f30
	bgu,a	%icc,	loop_1976
	bneg,a,pn	%icc,	loop_1977
	fmovrsne	%l5,	%f16,	%f13
	movge	%icc,	%l1,	%g7
loop_1976:
	udivx	%l3,	0x1206,	%i5
loop_1977:
	fmovsne	%xcc,	%f3,	%f10
	ldsh	[%l7 + 0x10],	%g4
	bl	loop_1978
	ldsh	[%l7 + 0x12],	%g2
	fabss	%f22,	%f2
	tle	%xcc,	0x1
loop_1978:
	nop
	set	0x5E, %g1
	stha	%o0,	[%l7 + %g1] 0x11
	fblg	%fcc1,	loop_1979
	fcmpne32	%f22,	%f12,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o4
loop_1979:
	fblg,a	%fcc2,	loop_1980
	sra	%g6,	0x14,	%i2
	orcc	%g5,	0x1927,	%o1
	fmovdl	%xcc,	%f13,	%f8
loop_1980:
	movpos	%xcc,	%l0,	%o2
	fcmpgt16	%f2,	%f14,	%i4
	alignaddr	%i3,	%o6,	%g1
	bneg	%xcc,	loop_1981
	tvc	%icc,	0x2
	edge8l	%l4,	%i1,	%g3
	membar	0x44
loop_1981:
	movrlez	%i6,	0x285,	%o3
	fmovda	%xcc,	%f31,	%f6
	fornot2	%f22,	%f14,	%f18
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i0,	%o7
	tge	%xcc,	0x7
	addccc	%l2,	0x1788,	%l5
	subcc	%l1,	%g7,	%l6
	mulx	%l3,	%g4,	%i5
	fbue,a	%fcc3,	loop_1982
	fandnot2s	%f30,	%f27,	%f1
	edge16n	%g2,	%o0,	%i7
	stx	%o4,	[%l7 + 0x28]
loop_1982:
	srax	%g6,	%i2,	%o5
	bvc,a,pn	%icc,	loop_1983
	fandnot2	%f4,	%f2,	%f16
	fbul,a	%fcc3,	loop_1984
	fornot1s	%f8,	%f7,	%f30
loop_1983:
	fabsd	%f2,	%f30
	movne	%xcc,	%g5,	%o1
loop_1984:
	fmovrdlz	%l0,	%f4,	%f28
	ba,a,pn	%icc,	loop_1985
	fandnot2	%f10,	%f14,	%f18
	movge	%icc,	%o2,	%i4
	tsubcctv	%o6,	0x1248,	%g1
loop_1985:
	tcs	%icc,	0x7
	taddcc	%l4,	%i1,	%i3
	tl	%xcc,	0x7
	fandnot1	%f18,	%f2,	%f6
	movl	%icc,	%g3,	%i6
	movrne	%i0,	%o3,	%l2
	set	0x38, %g7
	stda	%o6,	[%l7 + %g7] 0xea
	membar	#Sync
	movcc	%xcc,	%l1,	%l5
	smul	%g7,	%l6,	%g4
	fmovsl	%xcc,	%f14,	%f31
	bleu	%icc,	loop_1986
	edge32	%l3,	%g2,	%o0
	te	%xcc,	0x5
	movpos	%xcc,	%i7,	%o4
loop_1986:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g6
	fmovsa	%icc,	%f20,	%f1
	fnands	%f3,	%f17,	%f18
	xnor	%o5,	%i2,	%o1
	fzeros	%f14
	subcc	%g5,	0x073E,	%o2
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bcc,a,pn	%xcc,	loop_1987
	fpadd32s	%f13,	%f17,	%f6
	tleu	%xcc,	0x2
	fnegd	%f6,	%f18
loop_1987:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x4
	bge,a	%xcc,	loop_1988
	orn	%l0,	%o6,	%i4
	fsrc1	%f6,	%f2
	movvs	%icc,	%g1,	%l4
loop_1988:
	nop
	set	0x60, %o2
	stxa	%i3,	[%l7 + %o2] 0x14
	lduh	[%l7 + 0x30],	%g3
	fxnors	%f12,	%f29,	%f31
	fandnot1	%f22,	%f18,	%f14
	udiv	%i1,	0x16E6,	%i0
	ble	loop_1989
	tleu	%xcc,	0x0
	alignaddr	%i6,	%l2,	%o3
	nop
	setx	loop_1990,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1989:
	fmovdle	%icc,	%f12,	%f23
	subccc	%o7,	%l1,	%g7
	tne	%xcc,	0x5
loop_1990:
	taddcctv	%l6,	%l5,	%g4
	sdiv	%g2,	0x19E1,	%o0
	fnegd	%f6,	%f8
	array32	%i7,	%o4,	%i5
	fbuge,a	%fcc3,	loop_1991
	movcc	%icc,	%l3,	%o5
	fornot1	%f22,	%f16,	%f10
	edge32n	%g6,	%o1,	%i2
loop_1991:
	fbue	%fcc2,	loop_1992
	edge32l	%o2,	%l0,	%o6
	fmovrdgz	%i4,	%f20,	%f20
	srax	%g5,	0x0C,	%l4
loop_1992:
	andcc	%i3,	0x16BA,	%g1
	edge32n	%i1,	%g3,	%i6
	set	0x26, %i6
	stha	%i0,	[%l7 + %i6] 0x14
	edge32n	%l2,	%o3,	%o7
	set	0x72, %g2
	lduha	[%l7 + %g2] 0x80,	%g7
	movneg	%icc,	%l6,	%l1
	brgz,a	%l5,	loop_1993
	fmul8x16au	%f13,	%f13,	%f30
	addc	%g2,	0x19A9,	%g4
	tcc	%xcc,	0x0
loop_1993:
	mulscc	%i7,	%o4,	%i5
	fmovrdgez	%o0,	%f4,	%f16
	popc	%o5,	%g6
	movn	%icc,	%l3,	%o1
	umulcc	%i2,	%o2,	%o6
	edge8	%i4,	%l0,	%l4
	tgu	%icc,	0x4
	fand	%f2,	%f16,	%f10
	sllx	%i3,	%g5,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g1,	%i6
	fmovdvc	%icc,	%f0,	%f12
	movrne	%i0,	0x14A,	%l2
	xnorcc	%g3,	%o3,	%o7
	prefetch	[%l7 + 0x6C],	 0x0
	sethi	0x17B5,	%g7
	fpsub16	%f30,	%f26,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f10,	%f13
	fmul8x16	%f19,	%f16,	%f22
	fabsd	%f26,	%f22
	fmovdcc	%icc,	%f29,	%f29
	mova	%icc,	%l6,	%l5
	tgu	%xcc,	0x1
	subc	%g2,	%g4,	%i7
	tn	%xcc,	0x2
	sll	%o4,	%i5,	%l1
	ta	%icc,	0x1
	movrgz	%o5,	0x365,	%g6
	xnorcc	%l3,	0x0627,	%o1
	fbul	%fcc2,	loop_1994
	add	%i2,	%o2,	%o0
	sir	0x0924
	edge32	%i4,	%l0,	%l4
loop_1994:
	array8	%o6,	%g5,	%i3
	fmovdl	%xcc,	%f23,	%f5
	fcmple16	%f14,	%f26,	%i1
	sdivcc	%i6,	0x1072,	%g1
	fmovspos	%xcc,	%f1,	%f29
	nop
	setx	loop_1995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgz	%i0,	%f20,	%f10
	fpadd32	%f12,	%f26,	%f0
	edge32l	%g3,	%o3,	%l2
loop_1995:
	nop
	set	0x44, %l6
	ldsb	[%l7 + %l6],	%g7
	array32	%l6,	%o7,	%g2
	addcc	%g4,	0x0F0F,	%i7
	tsubcctv	%l5,	%i5,	%o4
	array8	%l1,	%g6,	%l3
	movre	%o1,	0x279,	%i2
	std	%f2,	[%l7 + 0x38]
	fcmps	%fcc2,	%f6,	%f22
	mulx	%o5,	0x1BE8,	%o0
	orcc	%i4,	%o2,	%l4
	fandnot1s	%f1,	%f4,	%f25
	sra	%o6,	0x1B,	%g5
	movle	%xcc,	%l0,	%i3
	fandnot1s	%f11,	%f29,	%f3
	movcc	%icc,	%i1,	%i6
	fxor	%f16,	%f18,	%f26
	taddcc	%i0,	0x1A78,	%g3
	brz,a	%g1,	loop_1996
	fmovdge	%xcc,	%f7,	%f11
	tg	%xcc,	0x3
	umul	%l2,	%o3,	%g7
loop_1996:
	fcmple32	%f6,	%f30,	%o7
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0x3
	edge32n	%l6,	%g4,	%i7
	udivcc	%l5,	0x0FED,	%o4
	te	%icc,	0x6
	movre	%i5,	0x19E,	%g6
	tcs	%xcc,	0x3
	sdivcc	%l1,	0x1008,	%l3
	tcc	%xcc,	0x5
	srlx	%i2,	0x07,	%o1
	std	%o0,	[%l7 + 0x48]
	brz	%o5,	loop_1997
	fmovdcs	%icc,	%f3,	%f1
	sllx	%i4,	0x13,	%l4
	fmovrdlez	%o6,	%f6,	%f22
loop_1997:
	fbo	%fcc0,	loop_1998
	edge8	%o2,	%g5,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f8,	%f24,	%f30
loop_1998:
	tvs	%xcc,	0x1
	alignaddrl	%i1,	%i6,	%i3
	tne	%icc,	0x2
	movcs	%icc,	%g3,	%g1
	sdivx	%l2,	0x1D1B,	%i0
	subccc	%o3,	0x0E4C,	%g7
	movneg	%xcc,	%o7,	%l6
	udiv	%g2,	0x0531,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l5,	%o4,	%i5
	mulscc	%i7,	0x02CC,	%l1
	movl	%icc,	%l3,	%i2
	addc	%o1,	%g6,	%o0
	fnegd	%f6,	%f8
	stw	%o5,	[%l7 + 0x64]
	lduw	[%l7 + 0x3C],	%i4
	and	%o6,	%l4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g5,	%l0,	%i1
	set	0x3B, %g6
	stba	%i6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	setx loop_1999, %l0, %l1
	jmpl %l1, %g3
	edge32n	%g1,	%l2,	%i0
	addcc	%o3,	%g7,	%i3
	umul	%l6,	0x01F7,	%o7
loop_1999:
	tsubcctv	%g4,	%l5,	%o4
	addc	%i5,	0x1776,	%g2
	subc	%l1,	0x1CEB,	%i7
	lduw	[%l7 + 0x10],	%i2
	wr	%g0,	0x89,	%asi
	stha	%o1,	[%l7 + 0x68] %asi
	umulcc	%l3,	%g6,	%o0
	movvs	%xcc,	%i4,	%o6
	srlx	%o5,	%l4,	%o2
	fmovde	%icc,	%f26,	%f12
	set	0x54, %i5
	swapa	[%l7 + %i5] 0x89,	%g5
	tpos	%icc,	0x3
	fmuld8ulx16	%f14,	%f3,	%f2
	ldstub	[%l7 + 0x3C],	%i1
	andn	%i6,	%g3,	%l0
	bgu,a	loop_2000
	udivx	%g1,	0x1D25,	%i0
	edge32ln	%l2,	%o3,	%g7
	xnorcc	%l6,	0x1E40,	%o7
loop_2000:
	ldsb	[%l7 + 0x1A],	%i3
	sdivx	%g4,	0x07FF,	%o4
	udivcc	%l5,	0x0F49,	%g2
	movre	%i5,	0x12C,	%l1
	movrgez	%i7,	%o1,	%i2
	add	%g6,	0x158F,	%o0
	fmovdg	%icc,	%f4,	%f31
	fnot1s	%f31,	%f10
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	ldsw	[%l7 + 0x74],	%o6
	fmovdn	%xcc,	%f8,	%f6
	movgu	%icc,	%l3,	%l4
	sllx	%o2,	0x00,	%g5
	edge16ln	%o5,	%i6,	%i1
	move	%xcc,	%g3,	%g1
	tgu	%xcc,	0x5
	udivx	%l0,	0x01E7,	%i0
	smul	%o3,	%l2,	%l6
	bl,pt	%icc,	loop_2001
	edge8ln	%o7,	%g7,	%g4
	mova	%icc,	%o4,	%i3
	fnors	%f22,	%f7,	%f14
loop_2001:
	andn	%g2,	%l5,	%i5
	movle	%xcc,	%l1,	%o1
	fmovdl	%xcc,	%f0,	%f8
	addcc	%i7,	0x0F0E,	%i2
	fandnot1s	%f31,	%f16,	%f14
	movrlz	%o0,	0x087,	%i4
	stbar
	tleu	%xcc,	0x6
	ta	%xcc,	0x7
	stb	%g6,	[%l7 + 0x11]
	call	loop_2002
	sub	%l3,	%o6,	%o2
	smulcc	%l4,	0x0401,	%o5
	movgu	%xcc,	%i6,	%g5
loop_2002:
	movneg	%icc,	%i1,	%g3
	fmovrse	%g1,	%f4,	%f27
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i0
	fands	%f22,	%f18,	%f19
	fsrc1	%f22,	%f8
	fmovsle	%icc,	%f25,	%f21
	edge16ln	%l0,	%l2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%o7,	%f13,	%f15
	taddcc	%o3,	%g4,	%g7
	for	%f10,	%f14,	%f28
	umulcc	%i3,	%o4,	%l5
	movrgez	%g2,	%i5,	%o1
	nop
	setx loop_2003, %l0, %l1
	jmpl %l1, %l1
	tvs	%icc,	0x4
	addcc	%i7,	0x0C20,	%o0
	edge16n	%i4,	%g6,	%i2
loop_2003:
	bne	loop_2004
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f12,	%f10
	udivx	%o6,	0x051F,	%l3
loop_2004:
	movle	%icc,	%l4,	%o5
	be	loop_2005
	brz	%i6,	loop_2006
	edge8ln	%g5,	%o2,	%g3
	fnands	%f12,	%f27,	%f26
loop_2005:
	fors	%f19,	%f20,	%f16
loop_2006:
	fornot1	%f30,	%f22,	%f28
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x80] %asi,	%i1
	andn	%i0,	0x1113,	%l0
	fsrc2s	%f6,	%f3
	movpos	%icc,	%l2,	%g1
	xnorcc	%o7,	0x1906,	%o3
	popc	0x1F15,	%g4
	movcc	%icc,	%l6,	%i3
	movrlez	%o4,	0x3E3,	%l5
	stx	%g2,	[%l7 + 0x68]
	fmovscc	%icc,	%f11,	%f29
	taddcctv	%i5,	0x0350,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%o1,	0x1F8A,	%l1
	set	0x14, %o5
	stwa	%i7,	[%l7 + %o5] 0x2b
	membar	#Sync
	fpmerge	%f18,	%f3,	%f16
	sdivcc	%i4,	0x1ADD,	%o0
	srlx	%i2,	%o6,	%l3
	tn	%icc,	0x6
	orncc	%g6,	%l4,	%o5
	fbge	%fcc1,	loop_2007
	array8	%g5,	%o2,	%i6
	fsrc1	%f14,	%f30
	edge16ln	%g3,	%i1,	%l0
loop_2007:
	tcc	%xcc,	0x0
	andncc	%i0,	%l2,	%o7
	movvc	%xcc,	%o3,	%g4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x0C, %l1
	swapa	[%l7 + %l1] 0x10,	%g1
	fbue	%fcc0,	loop_2008
	addc	%i3,	0x16F2,	%l6
	fbue	%fcc3,	loop_2009
	edge16ln	%o4,	%l5,	%i5
loop_2008:
	fmovsgu	%xcc,	%f19,	%f15
	udivx	%g2,	0x110A,	%g7
loop_2009:
	edge8ln	%o1,	%l1,	%i7
	set	0x30, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0x2
	sdiv	%i2,	0x0150,	%o6
	swap	[%l7 + 0x64],	%i4
	wr	%g0,	0x88,	%asi
	stwa	%g6,	[%l7 + 0x08] %asi
	bge,a,pn	%icc,	loop_2010
	movcc	%icc,	%l3,	%o5
	popc	0x1074,	%l4
	fnot1s	%f29,	%f6
loop_2010:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x4F] %asi,	%g5
	ble,a,pt	%xcc,	loop_2011
	nop
	setx loop_2012, %l0, %l1
	jmpl %l1, %i6
	fpsub16	%f28,	%f26,	%f28
	srl	%o2,	0x14,	%i1
loop_2011:
	sdivx	%l0,	0x0344,	%g3
loop_2012:
	tle	%icc,	0x6
	stw	%l2,	[%l7 + 0x4C]
	movrgz	%o7,	%o3,	%i0
	membar	0x2C
	movl	%xcc,	%g4,	%i3
	xnor	%g1,	0x1576,	%l6
	tneg	%icc,	0x5
	fpmerge	%f28,	%f20,	%f6
	set	0x50, %o4
	ldswa	[%l7 + %o4] 0x11,	%l5
	movneg	%icc,	%o4,	%g2
	tvs	%xcc,	0x0
	brnz	%i5,	loop_2013
	umulcc	%o1,	0x1A5E,	%l1
	xor	%g7,	%i7,	%i2
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x50] %asi,	%o6
loop_2013:
	te	%icc,	0x6
	fbue,a	%fcc2,	loop_2014
	bne,a,pt	%xcc,	loop_2015
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i4,	%g6,	%o0
loop_2014:
	brlez,a	%l3,	loop_2016
loop_2015:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o5,	0x1B6C,	%l4
	udivcc	%g5,	0x1C71,	%o2
loop_2016:
	tge	%icc,	0x0
	stw	%i6,	[%l7 + 0x50]
	bcs,pt	%xcc,	loop_2017
	movne	%xcc,	%l0,	%i1
	be,a,pt	%icc,	loop_2018
	alignaddrl	%l2,	%g3,	%o3
loop_2017:
	movl	%xcc,	%o7,	%i0
	sdivcc	%i3,	0x1CDA,	%g4
loop_2018:
	taddcctv	%l6,	%g1,	%l5
	movrgz	%o4,	0x259,	%g2
	orn	%i5,	%l1,	%o1
	edge8ln	%i7,	%g7,	%o6
	taddcctv	%i2,	0x1500,	%i4
	fmuld8sux16	%f0,	%f27,	%f28
	set	0x0A, %i7
	ldsba	[%l7 + %i7] 0x15,	%o0
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x17,	%f16
	set	0x40, %i0
	stxa	%g6,	[%l7 + %i0] 0xea
	membar	#Sync
	edge16ln	%o5,	%l4,	%g5
	be,pt	%icc,	loop_2019
	fmovsg	%xcc,	%f11,	%f15
	tleu	%icc,	0x2
	brlez	%l3,	loop_2020
loop_2019:
	add	%i6,	0x118B,	%o2
	fmovd	%f4,	%f2
	be,a	loop_2021
loop_2020:
	edge32l	%l0,	%l2,	%g3
	tg	%xcc,	0x7
	movn	%xcc,	%o3,	%i1
loop_2021:
	bne	loop_2022
	fandnot2	%f26,	%f18,	%f10
	fbl,a	%fcc2,	loop_2023
	orcc	%i0,	0x167C,	%i3
loop_2022:
	fmovsg	%icc,	%f13,	%f4
	mulscc	%g4,	%o7,	%g1
loop_2023:
	or	%l5,	0x1FFC,	%o4
	fmovsvs	%icc,	%f26,	%f8
	edge16ln	%l6,	%g2,	%l1
	tpos	%icc,	0x6
	fcmpd	%fcc1,	%f28,	%f2
	srax	%i5,	0x16,	%i7
	movcs	%icc,	%g7,	%o6
	ta	%xcc,	0x4
	fmovsn	%xcc,	%f6,	%f20
	subccc	%i2,	%i4,	%o0
	fmul8sux16	%f2,	%f18,	%f10
	prefetch	[%l7 + 0x48],	 0x1
	edge32	%g6,	%o1,	%l4
	umul	%g5,	%l3,	%i6
	fornot2s	%f21,	%f31,	%f22
	addccc	%o5,	0x0876,	%l0
	fxor	%f2,	%f10,	%f20
	sub	%o2,	%g3,	%o3
	fabsd	%f0,	%f20
	edge16	%l2,	%i1,	%i3
	andncc	%g4,	%o7,	%i0
	fornot2	%f8,	%f16,	%f20
	fba	%fcc2,	loop_2024
	srlx	%g1,	%o4,	%l6
	te	%icc,	0x2
	tne	%xcc,	0x4
loop_2024:
	nop
	setx	loop_2025,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%g2,	0x001F,	%l1
	fpsub16s	%f30,	%f18,	%f27
	flush	%l7 + 0x44
loop_2025:
	array16	%l5,	%i7,	%g7
	edge8	%i5,	%i2,	%o6
	movge	%icc,	%o0,	%g6
	sethi	0x08A8,	%o1
	addc	%l4,	0x112F,	%i4
	udivx	%g5,	0x076E,	%l3
	movrgz	%o5,	%i6,	%l0
	subcc	%g3,	0x17EC,	%o2
	wr	%g0,	0x27,	%asi
	stxa	%o3,	[%l7 + 0x40] %asi
	membar	#Sync
	tne	%xcc,	0x1
	fmuld8sux16	%f30,	%f6,	%f24
	fmovdle	%icc,	%f23,	%f3
	srl	%l2,	0x14,	%i3
	fmovdl	%xcc,	%f17,	%f19
	movn	%xcc,	%i1,	%g4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%i0
	xorcc	%g1,	%l6,	%o4
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g2,	%l5
	udiv	%l1,	0x0C53,	%g7
	set	0x66, %i1
	lduba	[%l7 + %i1] 0x11,	%i5
	ldd	[%l7 + 0x08],	%i6
	srlx	%o6,	%i2,	%g6
	fpsub32s	%f8,	%f23,	%f8
	mova	%xcc,	%o1,	%o0
	fcmple16	%f16,	%f18,	%i4
	fmovse	%icc,	%f13,	%f15
	movpos	%xcc,	%g5,	%l3
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	membar	0x04
	set	0x60, %l0
	ldxa	[%l7 + %l0] 0x80,	%i6
	subcc	%l4,	%g3,	%l0
	bg,a,pn	%icc,	loop_2026
	movpos	%xcc,	%o3,	%o2
	sub	%i3,	%l2,	%i1
	fbe,a	%fcc0,	loop_2027
loop_2026:
	bvs,a	%icc,	loop_2028
	for	%f24,	%f20,	%f2
	sdivcc	%g4,	0x0A93,	%o7
loop_2027:
	movg	%xcc,	%i0,	%g1
loop_2028:
	fmovrse	%l6,	%f2,	%f14
	tneg	%icc,	0x2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o4,	%l5
	mulx	%g2,	0x17F3,	%g7
	sll	%i5,	0x01,	%i7
	fornot1s	%f22,	%f6,	%f17
	srlx	%o6,	0x1A,	%i2
	movl	%icc,	%g6,	%o1
	xor	%l1,	0x00B2,	%i4
	edge8	%g5,	%l3,	%o0
	fmovsne	%icc,	%f11,	%f18
	movvs	%icc,	%o5,	%l4
	ldstub	[%l7 + 0x47],	%g3
	sethi	0x034F,	%l0
	brgz	%i6,	loop_2029
	movrgez	%o3,	%o2,	%i3
	sra	%i1,	%g4,	%l2
	fmuld8ulx16	%f24,	%f2,	%f0
loop_2029:
	bn,pt	%xcc,	loop_2030
	bneg,pn	%icc,	loop_2031
	edge8n	%o7,	%g1,	%i0
	sra	%l6,	%l5,	%o4
loop_2030:
	movne	%icc,	%g7,	%i5
loop_2031:
	fmovs	%f30,	%f20
	movgu	%icc,	%g2,	%o6
	membar	0x50
	fbul,a	%fcc3,	loop_2032
	xorcc	%i7,	0x0A44,	%i2
	fcmple32	%f28,	%f14,	%g6
	mulscc	%o1,	%l1,	%g5
loop_2032:
	movvc	%xcc,	%l3,	%i4
	popc	0x050B,	%o0
	taddcc	%l4,	%o5,	%l0
	smulcc	%g3,	%o3,	%o2
	tg	%icc,	0x5
	fmuld8ulx16	%f6,	%f16,	%f28
	brnz,a	%i6,	loop_2033
	fnor	%f0,	%f14,	%f14
	movneg	%icc,	%i1,	%g4
	fmovsvs	%xcc,	%f18,	%f5
loop_2033:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	edge32	%l2,	%g1,	%o7
	srlx	%l6,	%l5,	%i0
	subc	%o4,	%g7,	%g2
	xorcc	%i5,	%o6,	%i7
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x24,	%i2
	te	%xcc,	0x4
	fmovrdgz	%g6,	%f26,	%f6
	movre	%l1,	0x318,	%g5
	sdivcc	%o1,	0x1C32,	%l3
	sdivx	%o0,	0x0C15,	%l4
	fmovda	%icc,	%f5,	%f27
	bleu,a,pt	%xcc,	loop_2034
	orcc	%i4,	%o5,	%g3
	movcs	%icc,	%o3,	%o2
	ta	%icc,	0x0
loop_2034:
	std	%f10,	[%l7 + 0x70]
	movpos	%xcc,	%l0,	%i6
	fcmpeq32	%f30,	%f10,	%i1
	fbug,a	%fcc3,	loop_2035
	udivcc	%g4,	0x0B17,	%i3
	ldsw	[%l7 + 0x3C],	%g1
	tcc	%icc,	0x6
loop_2035:
	srlx	%l2,	%o7,	%l5
	xnorcc	%i0,	0x1009,	%o4
	fnors	%f15,	%f23,	%f21
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fba	%fcc3,	loop_2036
	call	loop_2037
	andncc	%g7,	%g2,	%l6
	movrlz	%o6,	0x033,	%i5
loop_2036:
	bpos,pt	%xcc,	loop_2038
loop_2037:
	fmovrsgz	%i7,	%f2,	%f4
	sub	%i2,	%l1,	%g5
	tl	%xcc,	0x5
loop_2038:
	sdivcc	%g6,	0x0963,	%l3
	sra	%o0,	%l4,	%o1
	orcc	%o5,	%i4,	%g3
	sra	%o2,	0x0B,	%l0
	xnorcc	%i6,	%i1,	%g4
	fmovdvs	%icc,	%f4,	%f31
	fmovrdgz	%i3,	%f6,	%f22
	bl,pn	%xcc,	loop_2039
	addcc	%o3,	0x1958,	%l2
	popc	%g1,	%l5
	set	0x39, %l5
	lduba	[%l7 + %l5] 0x15,	%o7
loop_2039:
	array32	%o4,	%g7,	%g2
	sra	%i0,	%o6,	%l6
	ba	%xcc,	loop_2040
	fornot1s	%f28,	%f6,	%f10
	movg	%xcc,	%i5,	%i7
	tleu	%icc,	0x0
loop_2040:
	tcc	%xcc,	0x5
	movrgez	%l1,	%g5,	%g6
	fornot1s	%f16,	%f13,	%f23
	fornot1	%f10,	%f12,	%f6
	sdiv	%l3,	0x14FE,	%i2
	fmovsn	%icc,	%f1,	%f25
	ldx	[%l7 + 0x18],	%l4
	tne	%xcc,	0x2
	udivcc	%o0,	0x15C4,	%o5
	ldd	[%l7 + 0x48],	%o0
	srlx	%g3,	%i4,	%l0
	fbul	%fcc2,	loop_2041
	sethi	0x1A3C,	%o2
	sdiv	%i1,	0x1148,	%i6
	fxnors	%f25,	%f5,	%f11
loop_2041:
	nop
	set	0x6F, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g4
	srl	%i3,	%l2,	%g1
	tge	%xcc,	0x4
	fmovrsgz	%l5,	%f17,	%f12
	fmovrse	%o3,	%f29,	%f21
	andn	%o4,	0x1EF0,	%o7
	movn	%xcc,	%g7,	%g2
	sdivx	%o6,	0x0568,	%l6
	fmovsa	%icc,	%f11,	%f1
	andcc	%i5,	0x09E5,	%i7
	xnorcc	%l1,	%i0,	%g6
	movrgez	%g5,	0x3DD,	%l3
	edge16n	%i2,	%o0,	%o5
	edge16ln	%l4,	%o1,	%g3
	tpos	%icc,	0x1
	tpos	%xcc,	0x5
	edge16l	%i4,	%l0,	%o2
	umul	%i6,	%i1,	%i3
	tneg	%icc,	0x3
	fmovse	%xcc,	%f14,	%f16
	xnor	%g4,	0x0693,	%l2
	subccc	%l5,	0x08BD,	%g1
	nop
	setx loop_2042, %l0, %l1
	jmpl %l1, %o4
	edge8l	%o7,	%g7,	%g2
	swap	[%l7 + 0x48],	%o6
	tn	%icc,	0x6
loop_2042:
	nop
	wr	%g0,	0x89,	%asi
	stba	%l6,	[%l7 + 0x35] %asi
	addccc	%i5,	0x1BC6,	%i7
	movg	%xcc,	%o3,	%i0
	edge16	%g6,	%g5,	%l1
	sir	0x017F
	fmuld8ulx16	%f12,	%f16,	%f4
	te	%icc,	0x0
	movrgz	%i2,	%o0,	%o5
	umulcc	%l4,	0x11EA,	%l3
	movn	%icc,	%o1,	%i4
	sdivx	%l0,	0x056F,	%o2
	movrgez	%g3,	0x0F6,	%i6
	popc	%i1,	%i3
	brlz	%l2,	loop_2043
	mulx	%l5,	%g4,	%o4
	smulcc	%g1,	0x06EC,	%g7
	addcc	%o7,	%g2,	%o6
loop_2043:
	xnorcc	%l6,	0x015E,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i7,	%o3,	%i0
	fmul8ulx16	%f24,	%f20,	%f20
	sll	%g6,	0x04,	%g5
	movvc	%icc,	%l1,	%o0
	be,a	%xcc,	loop_2044
	sdivx	%i2,	0x03A9,	%l4
	popc	%l3,	%o1
	sdiv	%o5,	0x0612,	%i4
loop_2044:
	srlx	%l0,	0x05,	%o2
	movrlez	%i6,	0x179,	%i1
	fabss	%f28,	%f13
	fmovrde	%i3,	%f0,	%f0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x14,	%f0
	tvs	%xcc,	0x5
	xorcc	%l2,	0x12A3,	%l5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x28] %asi,	%g4
	fabss	%f20,	%f20
	srl	%o4,	%g1,	%g3
	umulcc	%g7,	0x1F7B,	%o7
	fmovrdlez	%o6,	%f28,	%f24
	sll	%l6,	0x12,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i7,	%g2,	%o3
	movrlz	%g6,	%i0,	%g5
	movrlez	%l1,	0x2ED,	%o0
	edge16ln	%i2,	%l3,	%l4
	edge32ln	%o5,	%o1,	%l0
	fcmpeq16	%f10,	%f20,	%o2
	fmovrdlez	%i4,	%f30,	%f28
	fmovrdne	%i1,	%f4,	%f24
	tne	%xcc,	0x3
	tleu	%icc,	0x4
	andcc	%i6,	0x01F8,	%i3
	ldsw	[%l7 + 0x64],	%l2
	fble,a	%fcc2,	loop_2045
	movvc	%xcc,	%g4,	%o4
	swap	[%l7 + 0x34],	%l5
	movre	%g3,	%g1,	%g7
loop_2045:
	tg	%icc,	0x1
	fornot2s	%f30,	%f12,	%f9
	movneg	%xcc,	%o7,	%o6
	mulscc	%l6,	%i7,	%i5
	fmovrsgez	%o3,	%f8,	%f20
	popc	%g2,	%i0
	bcc,a	loop_2046
	taddcc	%g6,	0x0184,	%l1
	nop
	set	0x20, %o7
	stx	%o0,	[%l7 + %o7]
	stx	%i2,	[%l7 + 0x40]
loop_2046:
	tgu	%icc,	0x2
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
	ba,a	%xcc,	loop_2047
	fmovsn	%xcc,	%f27,	%f0
	bvc,a	%icc,	loop_2048
	fbul	%fcc0,	loop_2049
loop_2047:
	movleu	%xcc,	%l4,	%o5
	fmovrdne	%l3,	%f14,	%f10
loop_2048:
	mulscc	%o1,	%o2,	%i4
loop_2049:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%i1,	[%l7 + 0x0C] %asi
	membar	#Sync
	sdiv	%i6,	0x18C0,	%i3
	fnand	%f10,	%f24,	%f24
	fzero	%f14
	edge8	%l0,	%g4,	%l2
	fmovrdgz	%l5,	%f10,	%f22
	bl	loop_2050
	fmovs	%f13,	%f19
	tne	%xcc,	0x1
	bge	loop_2051
loop_2050:
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%o4
	andn	%g3,	%g7,	%o7
	fmovrsne	%g1,	%f11,	%f15
loop_2051:
	tg	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o6,	%l6,	%i5
	andn	%o3,	0x0E12,	%i7
	edge8	%i0,	%g2,	%g6
	tgu	%icc,	0x5
	fcmpgt32	%f26,	%f20,	%o0
	fandnot2	%f0,	%f12,	%f0
	sllx	%i2,	0x04,	%l1
	movn	%xcc,	%g5,	%o5
	ldub	[%l7 + 0x1D],	%l4
	bvs,a	loop_2052
	array8	%o1,	%l3,	%o2
	xnor	%i4,	0x1D13,	%i1
	flush	%l7 + 0x24
loop_2052:
	andcc	%i3,	0x1055,	%l0
	fnegs	%f4,	%f24
	fornot2s	%f18,	%f10,	%f1
	fmovdvs	%xcc,	%f25,	%f6
	fmovrdne	%i6,	%f0,	%f8
	movre	%g4,	%l2,	%o4
	movvs	%xcc,	%l5,	%g3
	sir	0x1288
	bl	%icc,	loop_2053
	array8	%o7,	%g7,	%o6
	brlez,a	%l6,	loop_2054
	addc	%i5,	%g1,	%o3
loop_2053:
	mulx	%i0,	%g2,	%g6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i7
loop_2054:
	andncc	%i2,	%o0,	%l1
	fbge,a	%fcc1,	loop_2055
	fbo	%fcc2,	loop_2056
	fcmpes	%fcc2,	%f19,	%f10
	orncc	%o5,	%l4,	%o1
loop_2055:
	movvc	%xcc,	%g5,	%l3
loop_2056:
	array32	%i4,	%i1,	%o2
	array8	%i3,	%i6,	%l0
	fxnors	%f31,	%f26,	%f16
	taddcc	%g4,	%o4,	%l2
	set	0x08, %g4
	ldswa	[%l7 + %g4] 0x0c,	%l5
	edge16	%o7,	%g7,	%g3
	tl	%icc,	0x5
	wr	%g0,	0x89,	%asi
	stha	%o6,	[%l7 + 0x20] %asi
	sll	%l6,	%g1,	%i5
	sub	%i0,	%g2,	%o3
	array32	%g6,	%i2,	%i7
	subc	%o0,	%l1,	%o5
	tpos	%icc,	0x2
	or	%o1,	%l4,	%l3
	edge16n	%i4,	%g5,	%i1
	sir	0x1E15
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o2
	tgu	%xcc,	0x6
	edge32	%i6,	%i3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g4,	%o4,	%l2
	xor	%l5,	%g7,	%o7
	fmovdneg	%icc,	%f7,	%f5
	movrlz	%g3,	%o6,	%g1
	movneg	%xcc,	%i5,	%l6
	mulx	%g2,	0x13F6,	%o3
	fcmpeq32	%f6,	%f22,	%g6
	ldstub	[%l7 + 0x13],	%i0
	subc	%i2,	%i7,	%o0
	movpos	%xcc,	%o5,	%l1
	edge32	%l4,	%l3,	%i4
	orn	%g5,	%o1,	%o2
	brgez,a	%i6,	loop_2057
	edge32ln	%i1,	%l0,	%g4
	sdiv	%o4,	0x08D1,	%i3
	srlx	%l2,	%g7,	%o7
loop_2057:
	fbl,a	%fcc0,	loop_2058
	edge32n	%l5,	%o6,	%g3
	te	%xcc,	0x5
	tcc	%xcc,	0x7
loop_2058:
	fmovrsgez	%g1,	%f0,	%f27
	ldub	[%l7 + 0x7D],	%l6
	fornot2	%f10,	%f14,	%f6
	fcmpgt32	%f16,	%f16,	%i5
	movrgz	%o3,	0x0F8,	%g2
	srax	%g6,	0x1B,	%i2
	srlx	%i0,	0x08,	%i7
	std	%o0,	[%l7 + 0x58]
	edge8l	%l1,	%o5,	%l4
	edge8	%l3,	%g5,	%o1
	popc	0x1794,	%o2
	pdist	%f24,	%f12,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x6
	bcs	loop_2059
	fmovdge	%xcc,	%f30,	%f21
	set	0x220, %o1
	ldxa	[%g0 + %o1] 0x52,	%i6
loop_2059:
	fmovrsne	%i4,	%f31,	%f11
	edge8ln	%l0,	%i1,	%g4
	srax	%i3,	%o4,	%l2
	tsubcc	%o7,	%l5,	%o6
	bn,a	%xcc,	loop_2060
	fbug,a	%fcc0,	loop_2061
	movrgz	%g7,	0x1CD,	%g3
	addc	%l6,	%i5,	%g1
loop_2060:
	fmovsleu	%xcc,	%f28,	%f17
loop_2061:
	tleu	%xcc,	0x1
	edge8ln	%o3,	%g6,	%g2
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x89,	%i2
	sir	0x1938
	set	0x38, %l4
	lduha	[%l7 + %l4] 0x10,	%i7
	mova	%xcc,	%i0,	%l1
	fmovrsgez	%o5,	%f17,	%f29
	tvs	%icc,	0x1
	fmovrslez	%o0,	%f17,	%f17
	mulx	%l4,	0x0284,	%l3
	ldx	[%l7 + 0x38],	%o1
	subccc	%g5,	%o2,	%i4
	fmul8x16	%f3,	%f6,	%f0
	te	%xcc,	0x4
	array16	%i6,	%i1,	%g4
	bne	loop_2062
	fmovrdne	%l0,	%f20,	%f2
	movgu	%icc,	%o4,	%i3
	fmovrdlz	%l2,	%f22,	%f24
loop_2062:
	fbg	%fcc1,	loop_2063
	movl	%xcc,	%o7,	%o6
	ble,a	loop_2064
	fbl	%fcc3,	loop_2065
loop_2063:
	movrgz	%g7,	0x34C,	%l5
	fmovrslz	%g3,	%f17,	%f14
loop_2064:
	nop
	set	0x20, %l3
	lduba	[%l7 + %l3] 0x11,	%l6
loop_2065:
	movrgez	%i5,	0x2B4,	%g1
	array16	%g6,	%o3,	%g2
	nop
	set	0x38, %g1
	stx	%i2,	[%l7 + %g1]
	mulx	%i0,	0x12FE,	%l1
	ta	%xcc,	0x4
	membar	0x3B
	xnorcc	%i7,	0x01FE,	%o5
	smul	%l4,	0x02F6,	%o0
	fmovdn	%icc,	%f10,	%f30
	edge8n	%o1,	%l3,	%g5
	xorcc	%o2,	0x0C2F,	%i4
	tleu	%xcc,	0x1
	ba,a	loop_2066
	tvs	%icc,	0x2
	movl	%icc,	%i1,	%g4
	fands	%f30,	%f0,	%f17
loop_2066:
	ldd	[%l7 + 0x70],	%f14
	nop
	setx	loop_2067,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%icc,	%l0,	%o4
	edge16ln	%i3,	%i6,	%o7
	fbul	%fcc3,	loop_2068
loop_2067:
	swap	[%l7 + 0x40],	%o6
	fbule	%fcc3,	loop_2069
	tl	%xcc,	0x7
loop_2068:
	xnor	%l2,	0x1C69,	%g7
	stx	%g3,	[%l7 + 0x28]
loop_2069:
	fcmple16	%f22,	%f4,	%l5
	sir	0x00EC
	fsrc2s	%f23,	%f15
	nop
	set	0x20, %g3
	lduh	[%l7 + %g3],	%i5
	srl	%g1,	%g6,	%l6
	movn	%xcc,	%g2,	%o3
	ldsh	[%l7 + 0x76],	%i0
	for	%f30,	%f12,	%f30
	fbo	%fcc1,	loop_2070
	sllx	%l1,	0x0B,	%i7
	fbl	%fcc0,	loop_2071
	brz,a	%o5,	loop_2072
loop_2070:
	subc	%l4,	0x0B24,	%o0
	bneg,a	%xcc,	loop_2073
loop_2071:
	xnor	%o1,	0x01BE,	%l3
loop_2072:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g5,	%i2,	%o2
loop_2073:
	edge8n	%i1,	%i4,	%g4
	tleu	%icc,	0x2
	tcs	%xcc,	0x5
	wr	%g0,	0xea,	%asi
	stda	%o4,	[%l7 + 0x68] %asi
	membar	#Sync
	tsubcctv	%i3,	0x106B,	%i6
	fmovdpos	%xcc,	%f22,	%f21
	sdivcc	%o7,	0x11D2,	%o6
	subcc	%l2,	%l0,	%g7
	fxnors	%f14,	%f12,	%f12
	tn	%icc,	0x1
	nop
	set	0x5A, %g7
	sth	%l5,	[%l7 + %g7]
	fnot2s	%f31,	%f26
	fand	%f6,	%f16,	%f4
	mulx	%i5,	%g3,	%g1
	bleu,pn	%icc,	loop_2074
	umulcc	%g6,	%g2,	%o3
	lduh	[%l7 + 0x54],	%l6
	array32	%l1,	%i7,	%i0
loop_2074:
	nop
	set	0x38, %o2
	stha	%l4,	[%l7 + %o2] 0xe3
	membar	#Sync
	bcs	loop_2075
	movneg	%icc,	%o5,	%o0
	fmovrdgz	%l3,	%f2,	%f2
	nop
	set	0x68, %i6
	std	%f16,	[%l7 + %i6]
loop_2075:
	tg	%xcc,	0x0
	addcc	%g5,	%o1,	%i2
	andncc	%o2,	%i1,	%g4
	movvc	%icc,	%o4,	%i3
	edge8n	%i4,	%i6,	%o7
	mulx	%l2,	%l0,	%o6
	movge	%xcc,	%g7,	%l5
	or	%g3,	0x05B7,	%i5
	tsubcc	%g6,	%g2,	%g1
	tcs	%xcc,	0x4
	edge8l	%o3,	%l6,	%l1
	tle	%xcc,	0x1
	edge16n	%i0,	%l4,	%o5
	tleu	%xcc,	0x1
	movleu	%icc,	%o0,	%l3
	ldsw	[%l7 + 0x18],	%i7
	and	%g5,	0x0A74,	%i2
	sllx	%o1,	%o2,	%i1
	edge16n	%o4,	%g4,	%i4
	srlx	%i3,	%i6,	%l2
	fbul,a	%fcc1,	loop_2076
	sll	%o7,	%l0,	%o6
	udivx	%l5,	0x0DFB,	%g7
	tg	%xcc,	0x6
loop_2076:
	sub	%g3,	0x1768,	%i5
	andn	%g6,	0x06C8,	%g2
	mulscc	%o3,	%g1,	%l6
	fmovsneg	%icc,	%f4,	%f6
	tsubcc	%i0,	%l1,	%l4
	bcs,a	loop_2077
	array32	%o5,	%o0,	%l3
	std	%i6,	[%l7 + 0x10]
	fandnot2	%f4,	%f22,	%f18
loop_2077:
	edge8ln	%i2,	%g5,	%o1
	mulscc	%o2,	0x099D,	%i1
	wr	%g0,	0x10,	%asi
	stxa	%o4,	[%l7 + 0x08] %asi
	bn,pt	%xcc,	loop_2078
	fbn,a	%fcc3,	loop_2079
	tcc	%icc,	0x0
	mulx	%i4,	%i3,	%i6
loop_2078:
	fand	%f16,	%f18,	%f2
loop_2079:
	umulcc	%g4,	%o7,	%l2
	sdivcc	%o6,	0x0D15,	%l0
	movrgez	%l5,	%g7,	%g3
	fcmped	%fcc1,	%f4,	%f8
	addc	%i5,	%g6,	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x74] %asi,	%g1
	fcmpgt16	%f12,	%f24,	%o3
	orn	%l6,	%l1,	%i0
	mova	%icc,	%o5,	%l4
	fones	%f19
	membar	0x58
	fbn	%fcc1,	loop_2080
	tvs	%xcc,	0x1
	ldsh	[%l7 + 0x6E],	%o0
	sdiv	%l3,	0x15D8,	%i7
loop_2080:
	nop
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x80
	mova	%xcc,	%i2,	%o1
	fcmpgt16	%f22,	%f16,	%g5
	stw	%i1,	[%l7 + 0x2C]
	fmovrsgez	%o2,	%f17,	%f26
	bge	%xcc,	loop_2081
	fbo	%fcc1,	loop_2082
	edge16ln	%o4,	%i4,	%i6
	bn,a,pt	%icc,	loop_2083
loop_2081:
	move	%xcc,	%g4,	%i3
loop_2082:
	fpadd16s	%f20,	%f7,	%f10
	srl	%l2,	0x02,	%o7
loop_2083:
	fmovde	%xcc,	%f30,	%f15
	movrlez	%l0,	%o6,	%l5
	edge8n	%g7,	%i5,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1A7B,	%g3
	move	%icc,	%g1,	%g2
	ta	%icc,	0x0
	orcc	%o3,	%l6,	%i0
	fones	%f27
	edge8l	%o5,	%l4,	%l1
	bn,a	%icc,	loop_2084
	fmovrsne	%o0,	%f17,	%f8
	flush	%l7 + 0x58
	fmovdge	%xcc,	%f16,	%f23
loop_2084:
	movcc	%icc,	%i7,	%l3
	edge8l	%o1,	%g5,	%i2
	orcc	%i1,	%o2,	%o4
	fmovrslez	%i4,	%f22,	%f16
	movrgz	%i6,	%g4,	%i3
	tvc	%icc,	0x3
	sll	%l2,	0x0E,	%o7
	fmovsle	%xcc,	%f24,	%f6
	flush	%l7 + 0x28
	call	loop_2085
	sllx	%l0,	%l5,	%o6
	sdiv	%g7,	0x0B94,	%i5
	sdivx	%g6,	0x1237,	%g1
loop_2085:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x44] %asi,	%g3
	movgu	%icc,	%o3,	%g2
	movg	%icc,	%l6,	%o5
	tvs	%icc,	0x1
	edge16	%i0,	%l4,	%l1
	sll	%o0,	0x1D,	%l3
	fcmple32	%f18,	%f26,	%i7
	srax	%o1,	0x0C,	%i2
	orn	%g5,	%i1,	%o4
	edge16n	%i4,	%i6,	%g4
	fcmple16	%f12,	%f6,	%i3
	bge	loop_2086
	tneg	%xcc,	0x5
	movrgz	%l2,	%o2,	%o7
	mulx	%l5,	0x1915,	%l0
loop_2086:
	movge	%icc,	%g7,	%o6
	smulcc	%i5,	%g6,	%g3
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x32] %asi
	movneg	%icc,	%o3,	%l6
	edge32n	%o5,	%i0,	%l4
	or	%l1,	0x044F,	%g2
	edge32n	%l3,	%o0,	%o1
	fbn	%fcc2,	loop_2087
	fones	%f2
	fnot2s	%f31,	%f18
	tcc	%icc,	0x1
loop_2087:
	sdivcc	%i2,	0x084E,	%i7
	movrgez	%i1,	%g5,	%i4
	mova	%xcc,	%o4,	%g4
	sub	%i3,	0x1AED,	%l2
	edge32ln	%o2,	%o7,	%l5
	edge32	%l0,	%g7,	%o6
	bcs	%xcc,	loop_2088
	edge8n	%i6,	%g6,	%i5
	fornot2s	%f24,	%f25,	%f9
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2088:
	movgu	%xcc,	%g3,	%g1
	movcc	%icc,	%l6,	%o5
	array16	%o3,	%l4,	%l1
	fbul,a	%fcc2,	loop_2089
	array8	%i0,	%l3,	%o0
	fandnot2s	%f10,	%f2,	%f22
	srl	%o1,	0x0C,	%g2
loop_2089:
	mulx	%i2,	%i1,	%g5
	fnot2	%f18,	%f12
	fpadd16	%f24,	%f2,	%f12
	ta	%icc,	0x3
	xorcc	%i7,	0x00A2,	%o4
	tn	%xcc,	0x7
	add	%i4,	%i3,	%g4
	fmovrsgez	%l2,	%f12,	%f23
	add	%o2,	%o7,	%l0
	tneg	%icc,	0x7
	edge16	%l5,	%g7,	%i6
	movrgz	%o6,	0x396,	%g6
	sdiv	%i5,	0x138A,	%g3
	edge16ln	%g1,	%o5,	%l6
	movle	%xcc,	%o3,	%l1
	movne	%xcc,	%i0,	%l4
	xnorcc	%l3,	0x09C5,	%o0
	fmovspos	%icc,	%f19,	%f31
	fmul8x16al	%f14,	%f16,	%f12
	fmovsge	%xcc,	%f18,	%f17
	addcc	%o1,	0x0804,	%g2
	edge8	%i2,	%g5,	%i7
	tsubcc	%i1,	0x076F,	%o4
	mova	%icc,	%i4,	%i3
	mulx	%l2,	%o2,	%g4
	movrlz	%o7,	%l5,	%g7
	addccc	%i6,	%l0,	%o6
	bleu,pt	%xcc,	loop_2090
	popc	0x0E49,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g6,	%g1
loop_2090:
	fmovdg	%icc,	%f12,	%f3
	mulscc	%g3,	%o5,	%l6
	fpadd16s	%f8,	%f3,	%f8
	tle	%xcc,	0x3
	nop
	setx	loop_2091,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpgt32	%f16,	%f16,	%o3
	fbule,a	%fcc1,	loop_2092
	edge16l	%i0,	%l4,	%l3
loop_2091:
	andcc	%o0,	%o1,	%l1
	call	loop_2093
loop_2092:
	fsrc1s	%f23,	%f7
	fmovsvc	%icc,	%f20,	%f26
	bge,pt	%xcc,	loop_2094
loop_2093:
	fba,a	%fcc2,	loop_2095
	fmuld8sux16	%f6,	%f14,	%f24
	stb	%g2,	[%l7 + 0x52]
loop_2094:
	movrgz	%i2,	0x3A6,	%g5
loop_2095:
	addc	%i1,	0x0059,	%i7
	xnor	%o4,	%i3,	%i4
	ldd	[%l7 + 0x10],	%f20
	popc	%l2,	%g4
	udiv	%o7,	0x1223,	%o2
	fmovrslez	%l5,	%f19,	%f29
	tsubcc	%g7,	%i6,	%l0
	call	loop_2096
	srl	%i5,	%g6,	%o6
	addc	%g3,	0x0211,	%g1
	fbo,a	%fcc2,	loop_2097
loop_2096:
	tne	%xcc,	0x3
	movpos	%xcc,	%l6,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x64] %asi,	%f3
loop_2097:
	fmul8x16au	%f10,	%f10,	%f10
	membar	0x56
	tleu	%xcc,	0x4
	movrgez	%o5,	%l4,	%i0
	array32	%o0,	%l3,	%o1
	set	0x08, %l6
	stxa	%g2,	[%l7 + %l6] 0xe2
	membar	#Sync
	smul	%i2,	0x0629,	%g5
	movvs	%xcc,	%i1,	%i7
	ld	[%l7 + 0x64],	%f26
	bne	%icc,	loop_2098
	tgu	%xcc,	0x0
	sir	0x139C
	sra	%o4,	%i3,	%i4
loop_2098:
	addc	%l2,	%g4,	%l1
	edge32l	%o7,	%l5,	%o2
	movne	%icc,	%i6,	%g7
	xnorcc	%i5,	0x074E,	%g6
	movrgz	%o6,	%l0,	%g3
	fmul8x16	%f11,	%f2,	%f20
	fands	%f9,	%f0,	%f7
	fmovsge	%icc,	%f25,	%f14
	be	%icc,	loop_2099
	fzero	%f4
	set	0x20, %o6
	stha	%l6,	[%l7 + %o6] 0xe2
	membar	#Sync
loop_2099:
	addccc	%o3,	0x0F1C,	%g1
	edge16l	%o5,	%i0,	%l4
	fnand	%f22,	%f12,	%f26
	edge32ln	%l3,	%o1,	%o0
	edge8l	%i2,	%g2,	%g5
	fnegd	%f2,	%f10
	taddcctv	%i1,	%i7,	%i3
	edge8ln	%o4,	%l2,	%g4
	movrlez	%l1,	0x3BF,	%o7
	brlez	%i4,	loop_2100
	tpos	%xcc,	0x2
	tl	%xcc,	0x6
	tvs	%xcc,	0x1
loop_2100:
	nop
	set	0x48, %g6
	lduwa	[%l7 + %g6] 0x11,	%l5
	andncc	%i6,	%g7,	%i5
	tcc	%icc,	0x0
	edge16ln	%g6,	%o6,	%o2
	fnegs	%f3,	%f4
	umulcc	%g3,	0x1188,	%l0
	tsubcc	%l6,	0x1F61,	%g1
	xorcc	%o3,	%o5,	%i0
	fxnor	%f6,	%f4,	%f28
	brgz	%l4,	loop_2101
	fmovdneg	%xcc,	%f21,	%f28
	wr	%g0,	0xe3,	%asi
	stxa	%l3,	[%l7 + 0x58] %asi
	membar	#Sync
loop_2101:
	fmovdl	%xcc,	%f25,	%f2
	orn	%o0,	%i2,	%o1
	fbug	%fcc1,	loop_2102
	fzero	%f14
	sdivcc	%g2,	0x0BA6,	%i1
	add	%i7,	%g5,	%o4
loop_2102:
	stx	%i3,	[%l7 + 0x70]
	andncc	%l2,	%l1,	%g4
	be,a	loop_2103
	udiv	%o7,	0x16A2,	%i4
	movneg	%icc,	%i6,	%l5
	movvs	%xcc,	%g7,	%g6
loop_2103:
	fmovdneg	%xcc,	%f21,	%f20
	lduh	[%l7 + 0x22],	%i5
	movg	%icc,	%o2,	%o6
	wr	%g0,	0x2f,	%asi
	stba	%g3,	[%l7 + 0x5F] %asi
	membar	#Sync
	fble	%fcc0,	loop_2104
	fmovdge	%xcc,	%f17,	%f17
	wr	%g0,	0x22,	%asi
	stba	%l6,	[%l7 + 0x3A] %asi
	membar	#Sync
loop_2104:
	tvs	%icc,	0x6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%g1
	fpadd16s	%f17,	%f28,	%f15
	array16	%o3,	%l0,	%i0
	flush	%l7 + 0x78
	fbe,a	%fcc2,	loop_2105
	mova	%xcc,	%l4,	%l3
	sdivcc	%o0,	0x0D5A,	%o5
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o1
loop_2105:
	ldd	[%l7 + 0x68],	%f26
	movl	%icc,	%g2,	%i1
	andcc	%i2,	0x0E93,	%i7
	movne	%xcc,	%o4,	%i3
	fmovrdgz	%g5,	%f26,	%f30
	tvs	%icc,	0x6
	fmovsa	%xcc,	%f14,	%f29
	movrgz	%l1,	0x24B,	%l2
	fmovdge	%icc,	%f13,	%f15
	edge32l	%g4,	%i4,	%i6
	fcmpd	%fcc2,	%f12,	%f8
	edge32n	%o7,	%l5,	%g7
	xnorcc	%g6,	0x0A70,	%o2
	membar	0x31
	edge8	%o6,	%i5,	%l6
	fornot2	%f0,	%f30,	%f14
	tge	%xcc,	0x3
	fmovrdlez	%g3,	%f18,	%f0
	fnands	%f18,	%f6,	%f4
	ldsb	[%l7 + 0x5E],	%g1
	tvs	%xcc,	0x2
	subcc	%l0,	%o3,	%i0
	stx	%l3,	[%l7 + 0x40]
	andcc	%o0,	%o5,	%l4
	movle	%xcc,	%g2,	%o1
	sir	0x16AB
	set	0x6C, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i1
	orn	%i2,	%i7,	%i3
	taddcctv	%o4,	%g5,	%l1
	addccc	%l2,	0x1230,	%i4
	fmovdvc	%xcc,	%f21,	%f4
	sub	%g4,	%i6,	%l5
	movrgez	%g7,	%o7,	%o2
	movre	%g6,	%i5,	%o6
	fpsub16s	%f21,	%f13,	%f10
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%l6
	movn	%xcc,	%g1,	%g3
	fmovsa	%icc,	%f12,	%f29
	movleu	%icc,	%o3,	%i0
	movneg	%xcc,	%l3,	%l0
	fcmped	%fcc2,	%f20,	%f8
	udivx	%o5,	0x1E80,	%o0
	ta	%xcc,	0x0
	ldx	[%l7 + 0x50],	%l4
	andcc	%g2,	%i1,	%o1
	fzero	%f16
	fandnot2	%f12,	%f16,	%f26
	andncc	%i2,	%i7,	%o4
	fmovrdlez	%g5,	%f26,	%f12
	edge32	%l1,	%i3,	%l2
	fba,a	%fcc1,	loop_2106
	addc	%g4,	0x0037,	%i4
	sir	0x0C0E
	tne	%icc,	0x1
loop_2106:
	movpos	%icc,	%i6,	%l5
	fbn,a	%fcc2,	loop_2107
	edge8l	%g7,	%o7,	%g6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x15,	%f0
loop_2107:
	movrlez	%o2,	0x31A,	%o6
	fbo	%fcc2,	loop_2108
	fble,a	%fcc1,	loop_2109
	fsrc2s	%f4,	%f7
	sth	%l6,	[%l7 + 0x68]
loop_2108:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x72] %asi,	%i5
loop_2109:
	sll	%g1,	0x09,	%g3
	edge8l	%i0,	%o3,	%l3
	fmovrse	%l0,	%f7,	%f10
	subcc	%o5,	0x1ED5,	%o0
	pdist	%f6,	%f20,	%f28
	tleu	%xcc,	0x7
	movle	%xcc,	%l4,	%g2
	umul	%o1,	%i2,	%i7
	sir	0x05E5
	te	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	sta	%f21,	[%l7 + 0x1C] %asi
	ba	loop_2110
	sll	%o4,	%g5,	%i1
	sll	%i3,	0x11,	%l1
	brgez	%g4,	loop_2111
loop_2110:
	fnegd	%f6,	%f24
	edge32ln	%i4,	%i6,	%l5
	movcs	%icc,	%l2,	%g7
loop_2111:
	fba,a	%fcc2,	loop_2112
	edge32l	%o7,	%o2,	%o6
	movrlz	%g6,	0x2BB,	%l6
	tpos	%xcc,	0x4
loop_2112:
	fmovsvc	%xcc,	%f4,	%f16
	fnot2	%f30,	%f28
	orn	%i5,	0x0171,	%g1
	fpack16	%f26,	%f8
	set	0x2B, %i4
	lduba	[%l7 + %i4] 0x18,	%g3
	fpsub16	%f10,	%f12,	%f10
	movcs	%icc,	%i0,	%l3
	xnor	%o3,	%l0,	%o0
	stw	%o5,	[%l7 + 0x5C]
	sub	%g2,	%l4,	%i2
	brz,a	%i7,	loop_2113
	fbo	%fcc2,	loop_2114
	ldstub	[%l7 + 0x79],	%o4
	stb	%o1,	[%l7 + 0x3D]
loop_2113:
	brlz,a	%g5,	loop_2115
loop_2114:
	sllx	%i3,	0x0A,	%l1
	call	loop_2116
	sllx	%i1,	%i4,	%g4
loop_2115:
	smulcc	%l5,	%l2,	%i6
	mulscc	%o7,	0x0084,	%g7
loop_2116:
	movle	%icc,	%o2,	%g6
	fmovspos	%xcc,	%f14,	%f31
	movrlz	%o6,	0x216,	%i5
	movl	%xcc,	%g1,	%l6
	movg	%icc,	%i0,	%l3
	fandnot2s	%f18,	%f30,	%f4
	prefetch	[%l7 + 0x34],	 0x2
	umulcc	%o3,	0x088B,	%l0
	ta	%icc,	0x7
	fmovdneg	%xcc,	%f6,	%f4
	srlx	%g3,	0x0A,	%o5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x57] %asi,	%o0
	fmovs	%f30,	%f23
	fmovsvc	%icc,	%f21,	%f4
	tvs	%icc,	0x7
	bpos,pt	%xcc,	loop_2117
	fandnot1s	%f14,	%f20,	%f22
	bneg,a	loop_2118
	add	%g2,	%l4,	%i2
loop_2117:
	nop
	wr	%g0,	0xeb,	%asi
	stxa	%o4,	[%l7 + 0x28] %asi
	membar	#Sync
loop_2118:
	movrgz	%i7,	0x275,	%g5
	sllx	%o1,	0x08,	%l1
	fblg,a	%fcc0,	loop_2119
	movcs	%icc,	%i3,	%i4
	movl	%xcc,	%i1,	%l5
	udiv	%g4,	0x1343,	%l2
loop_2119:
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
	edge8l	%i6,	%g7,	%o7
	sethi	0x132A,	%g6
	andncc	%o2,	%o6,	%i5
loop_2120:
	fmul8x16	%f7,	%f4,	%f24
	movcc	%xcc,	%l6,	%i0
	fmovrsgz	%g1,	%f28,	%f13
	tge	%icc,	0x4
	bvs	loop_2121
	fabss	%f12,	%f16
	movge	%xcc,	%o3,	%l3
	sdivx	%g3,	0x171B,	%o5
loop_2121:
	tpos	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l0,	0x03,	%g2
	array16	%l4,	%i2,	%o0
	ldub	[%l7 + 0x1D],	%i7
	set	0x5C, %i5
	ldsha	[%l7 + %i5] 0x15,	%g5
	std	%f2,	[%l7 + 0x48]
	ble,pn	%icc,	loop_2122
	udivx	%o1,	0x197D,	%l1
	smul	%o4,	0x1D8C,	%i4
	orn	%i1,	%i3,	%g4
loop_2122:
	srlx	%l5,	0x08,	%i6
	brgz	%l2,	loop_2123
	bshuffle	%f14,	%f20,	%f10
	fbue	%fcc0,	loop_2124
	fmovsg	%xcc,	%f21,	%f3
loop_2123:
	tle	%icc,	0x7
	addccc	%o7,	0x1587,	%g7
loop_2124:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
	edge32l	%g6,	%o6,	%l6
	fbule	%fcc2,	loop_2125
	movleu	%xcc,	%i0,	%g1
	and	%i5,	%o3,	%g3
	edge32l	%l3,	%l0,	%g2
loop_2125:
	bshuffle	%f6,	%f4,	%f2
	fmovsg	%xcc,	%f11,	%f6
	fmovsg	%icc,	%f15,	%f30
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o5
	ldsw	[%l7 + 0x14],	%l4
	bvc,a	loop_2126
	tsubcc	%o0,	0x1517,	%i7
	fbo	%fcc3,	loop_2127
	fbn,a	%fcc1,	loop_2128
loop_2126:
	move	%xcc,	%g5,	%o1
	srax	%i2,	0x06,	%l1
loop_2127:
	movvs	%icc,	%o4,	%i4
loop_2128:
	fones	%f0
	array32	%i1,	%i3,	%l5
	udivcc	%i6,	0x080B,	%l2
	edge8l	%g4,	%g7,	%o7
	sdiv	%o2,	0x06EA,	%o6
	membar	0x54
	set	0x08, %i7
	stha	%g6,	[%l7 + %i7] 0x04
	andncc	%i0,	%l6,	%i5
	xorcc	%o3,	%g1,	%g3
	movge	%icc,	%l0,	%l3
	fpsub16s	%f28,	%f26,	%f22
	fbul	%fcc1,	loop_2129
	ldx	[%l7 + 0x68],	%o5
	sir	0x0C32
	movcc	%icc,	%g2,	%l4
loop_2129:
	movrgz	%o0,	0x28C,	%g5
	fcmple16	%f16,	%f0,	%i7
	sdiv	%o1,	0x1F62,	%l1
	set	0x62, %g5
	lduba	[%l7 + %g5] 0x81,	%o4
	fmovdl	%icc,	%f3,	%f9
	lduh	[%l7 + 0x74],	%i2
	movcc	%icc,	%i4,	%i3
	movn	%xcc,	%i1,	%l5
	subc	%l2,	0x147B,	%g4
	fmovdneg	%icc,	%f30,	%f2
	prefetch	[%l7 + 0x08],	 0x0
	fmovsvs	%xcc,	%f9,	%f0
	pdist	%f6,	%f2,	%f0
	ldx	[%l7 + 0x70],	%i6
	stbar
	srlx	%o7,	%g7,	%o6
	fbg	%fcc3,	loop_2130
	flush	%l7 + 0x1C
	movg	%icc,	%o2,	%g6
	edge32ln	%l6,	%i5,	%i0
loop_2130:
	fmovrdne	%o3,	%f20,	%f6
	andn	%g1,	0x0074,	%l0
	brnz,a	%l3,	loop_2131
	umul	%g3,	0x1A32,	%g2
	wr	%g0,	0x10,	%asi
	stda	%o4,	[%l7 + 0x28] %asi
loop_2131:
	fmovsl	%xcc,	%f4,	%f22
	subcc	%o0,	%l4,	%g5
	bgu,a	%xcc,	loop_2132
	tvc	%icc,	0x0
	fcmpne16	%f22,	%f20,	%i7
	fpadd32s	%f17,	%f20,	%f3
loop_2132:
	nop
	set	0x34, %i0
	ldsw	[%l7 + %i0],	%o1
	move	%icc,	%l1,	%o4
	udivcc	%i2,	0x0541,	%i3
	xnorcc	%i1,	0x0D81,	%i4
	bn	loop_2133
	tcc	%icc,	0x2
	movcs	%icc,	%l5,	%g4
	orn	%i6,	%l2,	%g7
loop_2133:
	sub	%o7,	%o2,	%g6
	array32	%l6,	%i5,	%o6
	edge16	%i0,	%g1,	%o3
	array8	%l0,	%l3,	%g2
	sir	0x172E
	tvs	%icc,	0x5
	fbg	%fcc1,	loop_2134
	bl,a,pt	%xcc,	loop_2135
	mulscc	%o5,	0x1058,	%o0
	sth	%g3,	[%l7 + 0x32]
loop_2134:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3D] %asi,	%g5
loop_2135:
	array32	%i7,	%o1,	%l4
	fmovd	%f14,	%f14
	swap	[%l7 + 0x0C],	%l1
	fmovrslez	%o4,	%f17,	%f10
	movn	%icc,	%i2,	%i3
	movcc	%xcc,	%i4,	%i1
	movpos	%xcc,	%l5,	%i6
	xorcc	%g4,	0x1E8F,	%l2
	fpadd32s	%f20,	%f30,	%f29
	fmovdvc	%xcc,	%f9,	%f12
	fornot2	%f22,	%f30,	%f8
	fone	%f22
	ldx	[%l7 + 0x38],	%g7
	fmul8x16al	%f1,	%f25,	%f28
	tgu	%xcc,	0x5
	st	%f2,	[%l7 + 0x50]
	bshuffle	%f12,	%f26,	%f18
	movg	%xcc,	%o2,	%g6
	or	%l6,	%o7,	%i5
	nop
	set	0x6E, %o4
	ldub	[%l7 + %o4],	%o6
	lduh	[%l7 + 0x24],	%i0
	set	0x49, %l0
	stba	%o3,	[%l7 + %l0] 0x27
	membar	#Sync
	fandnot1s	%f7,	%f4,	%f25
	addcc	%g1,	%l3,	%g2
	brlez,a	%o5,	loop_2136
	edge8	%o0,	%g3,	%g5
	tg	%xcc,	0x3
	bvc,pn	%icc,	loop_2137
loop_2136:
	ta	%icc,	0x1
	fmul8x16au	%f11,	%f24,	%f30
	edge16l	%i7,	%l0,	%l4
loop_2137:
	fmovdg	%xcc,	%f24,	%f25
	fcmps	%fcc3,	%f15,	%f21
	bcs	loop_2138
	umulcc	%o1,	%l1,	%i2
	addc	%i3,	%i4,	%i1
	sub	%o4,	%l5,	%i6
loop_2138:
	smulcc	%g4,	%g7,	%o2
	movpos	%icc,	%l2,	%g6
	fmovscc	%xcc,	%f18,	%f13
	fpadd32	%f28,	%f0,	%f18
	add	%l6,	0x163D,	%o7
	xnorcc	%i5,	%i0,	%o3
	and	%o6,	0x1469,	%l3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g1
	taddcctv	%o5,	0x1E3A,	%o0
	udiv	%g3,	0x1D82,	%g2
	orncc	%g5,	%l0,	%l4
	fmovdn	%icc,	%f7,	%f31
	taddcc	%i7,	0x136D,	%o1
	udiv	%i2,	0x0215,	%l1
	fbue	%fcc0,	loop_2139
	fba	%fcc2,	loop_2140
	ldstub	[%l7 + 0x42],	%i3
	xorcc	%i4,	0x14D9,	%i1
loop_2139:
	fzero	%f20
loop_2140:
	fmovdcc	%xcc,	%f7,	%f3
	fone	%f6
	smulcc	%l5,	%o4,	%g4
	mulx	%g7,	%o2,	%i6
	movvc	%icc,	%g6,	%l6
	tne	%xcc,	0x6
	edge32n	%l2,	%i5,	%i0
	fbule,a	%fcc2,	loop_2141
	brlz	%o3,	loop_2142
	movn	%xcc,	%o7,	%l3
	movrgez	%o6,	%o5,	%o0
loop_2141:
	nop
	set	0x38, %i3
	lduwa	[%l7 + %i3] 0x81,	%g3
loop_2142:
	movpos	%icc,	%g1,	%g5
	bne,a	%xcc,	loop_2143
	movrlez	%g2,	%l0,	%l4
	movrlz	%o1,	0x2C6,	%i2
	movpos	%xcc,	%l1,	%i7
loop_2143:
	movne	%icc,	%i4,	%i3
	fcmpeq32	%f28,	%f18,	%i1
	fbuge,a	%fcc1,	loop_2144
	umulcc	%o4,	%g4,	%g7
	andn	%o2,	0x1723,	%i6
	fpsub32s	%f0,	%f12,	%f24
loop_2144:
	fbne,a	%fcc2,	loop_2145
	tvc	%xcc,	0x1
	nop
	setx	loop_2146,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g6,	%l6,	%l5
loop_2145:
	movgu	%xcc,	%i5,	%l2
	fzeros	%f6
loop_2146:
	andncc	%o3,	%i0,	%o7
	fzeros	%f27
	lduh	[%l7 + 0x44],	%o6
	fbule,a	%fcc0,	loop_2147
	bn,a	loop_2148
	edge32	%o5,	%o0,	%l3
	lduh	[%l7 + 0x1A],	%g1
loop_2147:
	ba	%xcc,	loop_2149
loop_2148:
	bcc,pn	%xcc,	loop_2150
	movg	%icc,	%g5,	%g3
	ld	[%l7 + 0x78],	%f21
loop_2149:
	nop
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g2
loop_2150:
	stbar
	umul	%l0,	%l4,	%i2
	tsubcc	%l1,	0x1AA7,	%o1
	fmovrdlez	%i4,	%f8,	%f24
	fpadd16s	%f18,	%f5,	%f23
	smulcc	%i3,	0x0EFB,	%i1
	fble	%fcc2,	loop_2151
	taddcctv	%o4,	%g4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o2,	%g7
loop_2151:
	nop
	setx	loop_2152,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%i6,	%g6,	%l6
	sethi	0x01F4,	%i5
	fbge,a	%fcc2,	loop_2153
loop_2152:
	fbuge,a	%fcc2,	loop_2154
	fxnor	%f18,	%f26,	%f4
	tvs	%icc,	0x1
loop_2153:
	fmovsa	%xcc,	%f22,	%f0
loop_2154:
	bvs,a	%icc,	loop_2155
	fbu	%fcc1,	loop_2156
	addccc	%l5,	0x013D,	%l2
	array32	%o3,	%i0,	%o7
loop_2155:
	edge16l	%o6,	%o0,	%o5
loop_2156:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x78] %asi,	%l3
	srl	%g5,	%g3,	%g2
	movre	%g1,	%l0,	%i2
	tle	%xcc,	0x4
	ta	%xcc,	0x0
	smul	%l1,	%o1,	%l4
	fpackfix	%f24,	%f8
	fnot2s	%f2,	%f0
	add	%i3,	0x0531,	%i1
	srax	%o4,	0x09,	%g4
	movre	%i4,	%i7,	%o2
	umul	%g7,	0x06B1,	%g6
	fmovsl	%icc,	%f12,	%f19
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
	brlz	%l6,	loop_2158
	sll	%i6,	%i5,	%l2
	fmovrse	%o3,	%f8,	%f31
loop_2157:
	move	%icc,	%l5,	%o7
loop_2158:
	fbe,a	%fcc2,	loop_2159
	subc	%o6,	%o0,	%o5
	swap	[%l7 + 0x34],	%i0
	sll	%g5,	%g3,	%g2
loop_2159:
	ldd	[%l7 + 0x48],	%f22
	fbug	%fcc3,	loop_2160
	movre	%g1,	0x107,	%l3
	movpos	%icc,	%i2,	%l0
	movrlz	%o1,	%l1,	%l4
loop_2160:
	nop
	set	0x6C, %l5
	stwa	%i3,	[%l7 + %l5] 0x2a
	membar	#Sync
	fbul	%fcc2,	loop_2161
	sdivx	%o4,	0x03A9,	%i1
	tpos	%xcc,	0x1
	smulcc	%i4,	0x0CD8,	%i7
loop_2161:
	movg	%xcc,	%g4,	%g7
	lduh	[%l7 + 0x56],	%o2
	fpsub16	%f0,	%f6,	%f2
	nop
	setx	loop_2162,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs,a,pt	%xcc,	loop_2163
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x12] %asi,	%l6
loop_2162:
	bgu	loop_2164
loop_2163:
	tsubcc	%i6,	%i5,	%g6
	ldsb	[%l7 + 0x17],	%o3
	movg	%icc,	%l5,	%o7
loop_2164:
	alignaddrl	%l2,	%o0,	%o6
	bg,a	%icc,	loop_2165
	fmovse	%icc,	%f31,	%f14
	ldx	[%l7 + 0x50],	%o5
	fpack16	%f2,	%f31
loop_2165:
	fmovrslez	%g5,	%f26,	%f14
	movcs	%icc,	%i0,	%g3
	fmul8x16	%f19,	%f24,	%f16
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x11,	%f7
	movrgez	%g2,	%g1,	%i2
	tpos	%icc,	0x4
	edge16n	%l3,	%l0,	%l1
	addc	%l4,	%o1,	%i3
	fcmps	%fcc1,	%f14,	%f26
	fmovdn	%icc,	%f10,	%f28
	fmovde	%xcc,	%f16,	%f18
	addcc	%i1,	0x13CB,	%i4
	movcc	%xcc,	%i7,	%g4
	fmovd	%f10,	%f0
	addc	%g7,	%o2,	%l6
	lduh	[%l7 + 0x1E],	%o4
	movcc	%icc,	%i6,	%g6
	movre	%o3,	%i5,	%l5
	ldsw	[%l7 + 0x74],	%l2
	tleu	%icc,	0x1
	fcmpeq32	%f24,	%f18,	%o0
	sra	%o6,	%o7,	%g5
	set	0x74, %i2
	ldswa	[%l7 + %i2] 0x89,	%o5
	srlx	%g3,	0x0A,	%g2
	fmovdg	%xcc,	%f2,	%f7
	te	%icc,	0x1
	tleu	%icc,	0x7
	sdivx	%i0,	0x06F7,	%g1
	movn	%xcc,	%l3,	%i2
	orncc	%l0,	%l4,	%o1
	fbg	%fcc2,	loop_2166
	st	%f24,	[%l7 + 0x54]
	movne	%xcc,	%i3,	%l1
	bg,pn	%icc,	loop_2167
loop_2166:
	fbne,a	%fcc2,	loop_2168
	mova	%xcc,	%i4,	%i1
	wr	%g0,	0x88,	%asi
	stda	%i6,	[%l7 + 0x68] %asi
loop_2167:
	and	%g4,	%g7,	%o2
loop_2168:
	nop
	set	0x2C, %o7
	ldsba	[%l7 + %o7] 0x89,	%o4
	movpos	%xcc,	%i6,	%l6
	tg	%icc,	0x7
	array32	%g6,	%o3,	%i5
	ldsh	[%l7 + 0x4E],	%l5
	mulx	%l2,	%o0,	%o7
	tl	%icc,	0x3
	popc	%g5,	%o6
	movpos	%icc,	%g3,	%o5
	tsubcctv	%i0,	0x0CFA,	%g1
	movge	%xcc,	%l3,	%i2
	umulcc	%l0,	%l4,	%g2
	stbar
	fbuge,a	%fcc2,	loop_2169
	fmuld8sux16	%f6,	%f25,	%f30
	subc	%o1,	%i3,	%l1
	edge8	%i1,	%i4,	%i7
loop_2169:
	orncc	%g7,	0x15E7,	%g4
	fmovdneg	%icc,	%f9,	%f18
	fornot1s	%f4,	%f30,	%f28
	fnot1s	%f26,	%f24
	std	%o2,	[%l7 + 0x28]
	mulx	%i6,	0x0E0C,	%l6
	movpos	%icc,	%g6,	%o4
	tg	%xcc,	0x7
	mulscc	%o3,	0x1140,	%l5
	ld	[%l7 + 0x5C],	%f7
	lduw	[%l7 + 0x38],	%l2
	tcc	%icc,	0x4
	taddcctv	%i5,	%o7,	%g5
	edge32ln	%o0,	%g3,	%o5
	fcmped	%fcc0,	%f10,	%f28
	fnegd	%f2,	%f22
	fmovdge	%icc,	%f13,	%f7
	and	%i0,	0x14A5,	%o6
	movre	%g1,	0x35C,	%l3
	movgu	%xcc,	%i2,	%l4
	tleu	%icc,	0x3
	movn	%xcc,	%g2,	%o1
	mulx	%l0,	%l1,	%i1
	bcc,a	loop_2170
	srlx	%i4,	%i3,	%i7
	fbne,a	%fcc3,	loop_2171
	movrlez	%g7,	%o2,	%i6
loop_2170:
	prefetch	[%l7 + 0x40],	 0x3
	set	0x61, %l2
	lduba	[%l7 + %l2] 0x15,	%l6
loop_2171:
	array32	%g4,	%o4,	%o3
	or	%l5,	0x0F26,	%g6
	andn	%l2,	%i5,	%g5
	fsrc2s	%f30,	%f3
	fcmpgt16	%f16,	%f0,	%o7
	smulcc	%o0,	%g3,	%o5
	bne	%icc,	loop_2172
	udiv	%o6,	0x0C7A,	%g1
	bleu,a	loop_2173
	xnor	%l3,	0x0509,	%i0
loop_2172:
	addc	%i2,	%l4,	%o1
	fandnot2s	%f19,	%f14,	%f9
loop_2173:
	xnor	%g2,	%l1,	%i1
	xorcc	%i4,	%l0,	%i7
	fmovdleu	%icc,	%f17,	%f10
	andcc	%i3,	%g7,	%i6
	edge32	%o2,	%g4,	%o4
	tn	%xcc,	0x2
	fbo,a	%fcc3,	loop_2174
	popc	%l6,	%o3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x31] %asi,	%g6
loop_2174:
	lduh	[%l7 + 0x12],	%l5
	movleu	%xcc,	%l2,	%i5
	fones	%f31
	edge32n	%o7,	%g5,	%g3
	array8	%o0,	%o5,	%g1
	sub	%o6,	0x104A,	%l3
	fmovrslz	%i0,	%f12,	%f19
	brlz	%l4,	loop_2175
	fpsub32	%f4,	%f20,	%f26
	alignaddr	%i2,	%o1,	%g2
	andncc	%i1,	%i4,	%l1
loop_2175:
	mulscc	%i7,	%i3,	%g7
	xnor	%l0,	%o2,	%i6
	taddcc	%g4,	%l6,	%o3
	tsubcc	%o4,	0x0923,	%l5
	umul	%l2,	%i5,	%g6
	addccc	%o7,	%g5,	%g3
	flush	%l7 + 0x4C
	mulx	%o5,	0x16B6,	%g1
	srax	%o6,	0x17,	%l3
	sdivx	%o0,	0x0C4F,	%i0
	sdivcc	%l4,	0x1B7C,	%o1
	nop
	set	0x22, %g4
	ldub	[%l7 + %g4],	%i2
	subccc	%g2,	%i4,	%i1
	xorcc	%i7,	%l1,	%g7
	movcs	%xcc,	%l0,	%i3
	prefetch	[%l7 + 0x54],	 0x0
	sra	%o2,	%i6,	%g4
	fmovdgu	%icc,	%f25,	%f11
	tpos	%icc,	0x2
	fbne,a	%fcc1,	loop_2176
	call	loop_2177
	nop
	set	0x5F, %o0
	stb	%l6,	[%l7 + %o0]
	fcmpne32	%f6,	%f0,	%o4
loop_2176:
	fmovdgu	%xcc,	%f30,	%f17
loop_2177:
	tvs	%xcc,	0x6
	xorcc	%l5,	0x1B38,	%l2
	fmovscc	%xcc,	%f2,	%f17
	add	%i5,	%g6,	%o3
	srl	%g5,	%g3,	%o7
	fmovd	%f14,	%f8
	fcmpne16	%f28,	%f12,	%g1
	fbuge	%fcc3,	loop_2178
	smul	%o6,	%o5,	%l3
	subccc	%i0,	0x1653,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2178:
	umulcc	%l4,	0x0C0F,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o1,	%i4,	%i1
	sir	0x1CCB
	fbe	%fcc2,	loop_2179
	bne,pt	%icc,	loop_2180
	movrlez	%g2,	0x38E,	%i7
	orcc	%l1,	0x05DD,	%l0
loop_2179:
	fnands	%f21,	%f22,	%f2
loop_2180:
	and	%g7,	%i3,	%o2
	fones	%f30
	subc	%g4,	%i6,	%o4
	edge32	%l5,	%l6,	%l2
	orcc	%g6,	0x06BF,	%i5
	sdivcc	%o3,	0x1491,	%g5
	set	0x16, %o1
	stha	%o7,	[%l7 + %o1] 0x14
	ldx	[%l7 + 0x20],	%g1
	tcs	%icc,	0x7
	array32	%g3,	%o6,	%l3
	fsrc2s	%f21,	%f1
	set	0x34, %l4
	stha	%o5,	[%l7 + %l4] 0x19
	tpos	%xcc,	0x6
	membar	0x38
	tge	%icc,	0x4
	fone	%f24
	movgu	%xcc,	%i0,	%o0
	movne	%xcc,	%l4,	%i2
	subc	%o1,	0x14B1,	%i1
	movrgz	%i4,	0x121,	%i7
	fbul,a	%fcc1,	loop_2181
	ba,a	loop_2182
	edge32n	%g2,	%l1,	%l0
	edge8n	%g7,	%o2,	%g4
loop_2181:
	nop
	set	0x28, %l3
	swapa	[%l7 + %l3] 0x89,	%i6
loop_2182:
	nop
	set	0x38, %g1
	stxa	%i3,	[%l7 + %g1] 0x14
	flush	%l7 + 0x28
	xnor	%l5,	%o4,	%l6
	edge16l	%g6,	%l2,	%i5
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x22,	%g4
	xorcc	%o3,	%g1,	%g3
	prefetch	[%l7 + 0x48],	 0x3
	movrgz	%o6,	0x242,	%l3
	sub	%o5,	%i0,	%o0
	tgu	%xcc,	0x2
	edge32ln	%l4,	%i2,	%o1
	movrgz	%o7,	0x330,	%i4
	subccc	%i7,	%i1,	%g2
	movn	%icc,	%l1,	%l0
	fabsd	%f28,	%f14
	wr	%g0,	0xe3,	%asi
	stxa	%g7,	[%l7 + 0x58] %asi
	membar	#Sync
	xorcc	%o2,	%g4,	%i3
	udivx	%l5,	0x17DB,	%i6
	brz	%o4,	loop_2183
	for	%f14,	%f20,	%f24
	fmul8ulx16	%f2,	%f0,	%f18
	edge8n	%l6,	%g6,	%i5
loop_2183:
	sethi	0x005B,	%l2
	movrlez	%g5,	%o3,	%g1
	fmovrdgz	%g3,	%f20,	%f20
	fandnot1	%f20,	%f16,	%f18
	addcc	%l3,	%o5,	%o6
	tg	%icc,	0x1
	umulcc	%i0,	%o0,	%l4
	bcs,a,pt	%xcc,	loop_2184
	fbl,a	%fcc3,	loop_2185
	fandnot2	%f12,	%f12,	%f18
	movge	%xcc,	%i2,	%o1
loop_2184:
	movgu	%icc,	%o7,	%i4
loop_2185:
	call	loop_2186
	fbu	%fcc2,	loop_2187
	orn	%i7,	%g2,	%i1
	sra	%l1,	%g7,	%o2
loop_2186:
	nop
	set	0x78, %g3
	lduba	[%l7 + %g3] 0x89,	%l0
loop_2187:
	fmovse	%icc,	%f20,	%f18
	ldsh	[%l7 + 0x7E],	%i3
	fpack16	%f18,	%f1
	brlez,a	%l5,	loop_2188
	membar	0x63
	tle	%icc,	0x1
	bshuffle	%f8,	%f20,	%f0
loop_2188:
	tneg	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x0
	set	0x0D, %o2
	lduba	[%l7 + %o2] 0x89,	%g4
	andn	%i6,	%o4,	%g6
	array32	%l6,	%i5,	%l2
	movvc	%icc,	%g5,	%o3
	popc	%g1,	%l3
	fxor	%f14,	%f26,	%f28
	umul	%g3,	%o6,	%o5
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x0c,	%f16
	orcc	%o0,	%i0,	%i2
	fmovda	%xcc,	%f18,	%f17
	srax	%o1,	0x04,	%o7
	movne	%xcc,	%i4,	%i7
	movl	%icc,	%g2,	%l4
	edge8	%l1,	%i1,	%g7
	movneg	%icc,	%l0,	%i3
	tn	%icc,	0x5
	ldd	[%l7 + 0x38],	%f2
	fmovdcs	%icc,	%f22,	%f10
	mulscc	%o2,	%g4,	%l5
	udivcc	%i6,	0x1975,	%o4
	stb	%g6,	[%l7 + 0x37]
	sra	%l6,	%i5,	%g5
	ta	%xcc,	0x5
	edge16ln	%l2,	%o3,	%l3
	fbg,a	%fcc0,	loop_2189
	bvs,a	%xcc,	loop_2190
	fnot1s	%f21,	%f21
	xor	%g3,	0x034F,	%g1
loop_2189:
	movrgz	%o5,	%o0,	%i0
loop_2190:
	fmovdg	%icc,	%f10,	%f21
	fbuge	%fcc3,	loop_2191
	ba,a	loop_2192
	fpsub32s	%f28,	%f16,	%f22
	for	%f30,	%f10,	%f12
loop_2191:
	be	loop_2193
loop_2192:
	edge8n	%i2,	%o1,	%o6
	brlz,a	%o7,	loop_2194
	edge16l	%i4,	%i7,	%g2
loop_2193:
	mova	%xcc,	%l1,	%l4
	fmovrdlez	%g7,	%f24,	%f28
loop_2194:
	tvs	%icc,	0x4
	fblg	%fcc3,	loop_2195
	movpos	%xcc,	%l0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f26,	%f16,	%i3
loop_2195:
	movg	%icc,	%o2,	%g4
	tcc	%icc,	0x1
	fmovdcc	%xcc,	%f6,	%f22
	movcs	%xcc,	%l5,	%o4
	fmovse	%xcc,	%f11,	%f7
	bvc,a	%xcc,	loop_2196
	smulcc	%i6,	0x05A2,	%g6
	fpadd16	%f28,	%f24,	%f18
	nop
	set	0x2C, %g7
	ldsh	[%l7 + %g7],	%l6
loop_2196:
	stw	%i5,	[%l7 + 0x20]
	fpadd32	%f2,	%f26,	%f6
	smulcc	%l2,	%g5,	%o3
	fmovrdlez	%g3,	%f18,	%f28
	alignaddrl	%l3,	%o5,	%g1
	alignaddrl	%i0,	%i2,	%o0
	udiv	%o6,	0x0961,	%o7
	fxor	%f24,	%f12,	%f22
	fmovrdgez	%o1,	%f6,	%f6
	fmovrsgz	%i4,	%f15,	%f30
	movcs	%icc,	%g2,	%i7
	fzeros	%f0
	fnor	%f16,	%f22,	%f20
	prefetch	[%l7 + 0x34],	 0x2
	fandnot2	%f6,	%f8,	%f20
	tsubcctv	%l1,	0x0227,	%l4
	movcs	%xcc,	%l0,	%g7
	srlx	%i3,	%i1,	%g4
	st	%f17,	[%l7 + 0x64]
	fcmpd	%fcc1,	%f30,	%f26
	mova	%xcc,	%o2,	%l5
	movle	%xcc,	%i6,	%o4
	tge	%icc,	0x2
	movne	%icc,	%g6,	%i5
	mova	%icc,	%l2,	%l6
	fmovscc	%xcc,	%f14,	%f8
	fmuld8sux16	%f30,	%f6,	%f6
	fcmpeq16	%f2,	%f2,	%g5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%o3
	mulscc	%g3,	%o5,	%l3
	xnor	%i0,	0x0029,	%i2
	bgu,pn	%xcc,	loop_2197
	fbe,a	%fcc3,	loop_2198
	stw	%o0,	[%l7 + 0x0C]
	edge32n	%o6,	%o7,	%g1
loop_2197:
	fmovrdgz	%i4,	%f12,	%f2
loop_2198:
	ldx	[%l7 + 0x10],	%o1
	movcs	%xcc,	%i7,	%g2
	mova	%xcc,	%l1,	%l0
	tleu	%xcc,	0x4
	tsubcc	%g7,	0x0B1A,	%l4
	udivcc	%i1,	0x1DD4,	%i3
	fpackfix	%f24,	%f2
	set	0x60, %g2
	stwa	%g4,	[%l7 + %g2] 0x04
	sethi	0x1909,	%l5
	movrne	%o2,	0x0BC,	%o4
	fcmpeq32	%f20,	%f26,	%g6
	movrgz	%i5,	%i6,	%l2
	tpos	%icc,	0x0
	fnot2s	%f17,	%f8
	fandnot1s	%f30,	%f17,	%f31
	tle	%xcc,	0x0
	fcmpgt32	%f18,	%f2,	%l6
	fpsub32	%f22,	%f6,	%f16
	fnot1s	%f27,	%f28
	fcmpeq16	%f20,	%f26,	%o3
	alignaddrl	%g3,	%g5,	%l3
	srlx	%i0,	%o5,	%o0
	ldsw	[%l7 + 0x14],	%i2
	fblg	%fcc0,	loop_2199
	fabsd	%f10,	%f20
	fpadd32	%f6,	%f26,	%f0
	fsrc1s	%f19,	%f3
loop_2199:
	fpack16	%f12,	%f18
	ldd	[%l7 + 0x38],	%f26
	fmul8ulx16	%f22,	%f30,	%f2
	subc	%o6,	0x03F3,	%o7
	orn	%i4,	0x0871,	%o1
	prefetch	[%l7 + 0x74],	 0x0
	alignaddr	%i7,	%g2,	%g1
	sll	%l0,	%l1,	%g7
	popc	0x01C7,	%l4
	subc	%i3,	0x1AFE,	%i1
	fmovrdne	%g4,	%f2,	%f18
	srlx	%l5,	%o2,	%o4
	movl	%icc,	%g6,	%i5
	array8	%i6,	%l6,	%l2
	taddcc	%g3,	0x0324,	%g5
	edge16	%l3,	%o3,	%i0
	fmul8x16	%f18,	%f4,	%f16
	brgez,a	%o5,	loop_2200
	fmovsn	%xcc,	%f24,	%f5
	orncc	%i2,	0x1B58,	%o6
	swap	[%l7 + 0x4C],	%o0
loop_2200:
	srlx	%i4,	0x05,	%o1
	nop
	setx loop_2201, %l0, %l1
	jmpl %l1, %o7
	fandnot2	%f26,	%f2,	%f10
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i7
loop_2201:
	edge16	%g1,	%g2,	%l1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l0
	taddcctv	%g7,	0x1402,	%i3
	fpsub32	%f22,	%f6,	%f14
	mova	%xcc,	%l4,	%g4
	srax	%i1,	%l5,	%o4
	fbn	%fcc3,	loop_2202
	taddcctv	%g6,	0x00EA,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o2,	%l6,	%l2
loop_2202:
	nop
	set	0x4A, %l6
	lduha	[%l7 + %l6] 0x81,	%i6
	tge	%xcc,	0x3
	fmul8x16	%f0,	%f30,	%f8
	xnorcc	%g3,	0x08F8,	%l3
	move	%xcc,	%o3,	%g5
	edge16	%i0,	%i2,	%o6
	set	0x3C, %g6
	swapa	[%l7 + %g6] 0x10,	%o5
	movrlez	%o0,	%i4,	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i7,	%o1
	movle	%xcc,	%g2,	%g1
	alignaddrl	%l1,	%g7,	%l0
	sra	%i3,	0x11,	%g4
	fmovsvs	%xcc,	%f11,	%f9
	sll	%l4,	0x0F,	%l5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2C] %asi,	%i1
	andn	%g6,	0x122D,	%o4
	fpack16	%f2,	%f23
	edge16ln	%i5,	%o2,	%l2
	tcs	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i6,	0x041,	%l6
	move	%icc,	%g3,	%l3
	stbar
	taddcctv	%o3,	0x0657,	%i0
	fandnot2s	%f26,	%f8,	%f25
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	smulcc	%g5,	%o6,	%o5
	sdivx	%i2,	0x0C5D,	%o0
	fnors	%f1,	%f10,	%f18
	movgu	%xcc,	%o7,	%i7
	movcc	%xcc,	%i4,	%g2
	alignaddr	%o1,	%g1,	%l1
	umulcc	%l0,	0x1C4B,	%g7
	set	0x7C, %o6
	swapa	[%l7 + %o6] 0x10,	%g4
	fsrc2s	%f15,	%f6
	set	0x78, %l1
	lduha	[%l7 + %l1] 0x81,	%i3
	udivx	%l5,	0x11BA,	%i1
	stbar
	tcs	%icc,	0x5
	te	%xcc,	0x1
	tsubcctv	%l4,	0x0478,	%o4
	sdiv	%g6,	0x0716,	%i5
	brlez	%o2,	loop_2203
	bne	%xcc,	loop_2204
	fbe,a	%fcc3,	loop_2205
	edge8n	%l2,	%l6,	%g3
loop_2203:
	subcc	%l3,	0x1DD3,	%o3
loop_2204:
	nop
	set	0x18, %i4
	ldxa	[%l7 + %i4] 0x88,	%i0
loop_2205:
	edge16ln	%g5,	%o6,	%o5
	sub	%i2,	%o0,	%o7
	ta	%icc,	0x7
	tle	%xcc,	0x3
	nop
	setx	loop_2206,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%i6,	%i7,	%g2
	xorcc	%o1,	0x14A0,	%g1
	array8	%l1,	%i4,	%l0
loop_2206:
	tleu	%icc,	0x0
	array8	%g7,	%i3,	%l5
	edge32ln	%i1,	%g4,	%o4
	movrlz	%l4,	%i5,	%o2
	lduh	[%l7 + 0x0C],	%l2
	subc	%g6,	0x0E86,	%g3
	srax	%l6,	0x14,	%o3
	edge32	%l3,	%i0,	%o6
	edge8n	%g5,	%o5,	%i2
	move	%xcc,	%o7,	%o0
	fmovsg	%icc,	%f15,	%f8
	addccc	%i7,	%g2,	%o1
	brlez,a	%i6,	loop_2207
	fxnors	%f27,	%f14,	%f27
	xnorcc	%l1,	0x0FC2,	%i4
	fmovsge	%icc,	%f10,	%f29
loop_2207:
	flush	%l7 + 0x14
	fbuge,a	%fcc1,	loop_2208
	andcc	%l0,	%g1,	%i3
	sdivx	%g7,	0x12C5,	%i1
	tsubcc	%l5,	%o4,	%l4
loop_2208:
	bne,a	%icc,	loop_2209
	faligndata	%f12,	%f30,	%f24
	tvc	%icc,	0x0
	fmovdl	%icc,	%f24,	%f15
loop_2209:
	tge	%icc,	0x7
	popc	0x06CA,	%i5
	bne	%icc,	loop_2210
	srax	%o2,	%l2,	%g4
	brz	%g6,	loop_2211
	membar	0x19
loop_2210:
	fmovrdne	%g3,	%f26,	%f14
	set	0x10, %i5
	ldxa	[%g0 + %i5] 0x20,	%l6
loop_2211:
	ldd	[%l7 + 0x18],	%f10
	sdivcc	%l3,	0x00DD,	%o3
	fbge	%fcc0,	loop_2212
	stx	%o6,	[%l7 + 0x58]
	edge8l	%i0,	%o5,	%i2
	set	0x5C, %o5
	lda	[%l7 + %o5] 0x0c,	%f19
loop_2212:
	or	%o7,	0x0F1E,	%o0
	array16	%i7,	%g5,	%g2
	movcc	%xcc,	%i6,	%l1
	sdiv	%o1,	0x08DD,	%l0
	fble,a	%fcc2,	loop_2213
	sllx	%i4,	0x02,	%g1
	ldd	[%l7 + 0x18],	%f28
	fmovsneg	%xcc,	%f25,	%f30
loop_2213:
	mova	%icc,	%g7,	%i1
	stbar
	movcc	%icc,	%i3,	%o4
	move	%xcc,	%l4,	%i5
	movle	%xcc,	%o2,	%l2
	fmovdge	%xcc,	%f4,	%f1
	tn	%icc,	0x1
	alignaddrl	%l5,	%g4,	%g6
	edge16n	%g3,	%l3,	%o3
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x44] %asi,	%o6
	fbu	%fcc1,	loop_2214
	sllx	%i0,	%o5,	%l6
	fmovdg	%icc,	%f23,	%f24
	udiv	%i2,	0x0BBA,	%o0
loop_2214:
	taddcc	%i7,	0x0ED9,	%o7
	sub	%g2,	0x194A,	%g5
	ldsh	[%l7 + 0x20],	%i6
	fbge	%fcc3,	loop_2215
	udivx	%l1,	0x143C,	%l0
	movg	%xcc,	%i4,	%g1
	fcmpes	%fcc0,	%f7,	%f13
loop_2215:
	fmovdn	%xcc,	%f4,	%f29
	movg	%xcc,	%g7,	%i1
	tpos	%icc,	0x1
	fandnot2	%f18,	%f20,	%f10
	fmul8ulx16	%f20,	%f2,	%f8
	fornot2	%f22,	%f14,	%f20
	ba,pt	%icc,	loop_2216
	smulcc	%i3,	%o1,	%l4
	movgu	%xcc,	%i5,	%o2
	fbg	%fcc2,	loop_2217
loop_2216:
	xnorcc	%o4,	%l2,	%l5
	orn	%g4,	0x1214,	%g6
	movg	%icc,	%l3,	%o3
loop_2217:
	and	%g3,	%o6,	%o5
	xnorcc	%i0,	0x1D1A,	%l6
	edge8	%o0,	%i7,	%o7
	and	%i2,	%g5,	%i6
	sllx	%g2,	0x1F,	%l1
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%l0
	ldstub	[%l7 + 0x14],	%i4
	ble,a,pn	%xcc,	loop_2218
	array8	%g7,	%g1,	%i3
	fmovsa	%icc,	%f13,	%f9
	brlez,a	%o1,	loop_2219
loop_2218:
	edge16ln	%l4,	%i5,	%o2
	tleu	%xcc,	0x6
	movge	%xcc,	%i1,	%l2
loop_2219:
	sdivcc	%l5,	0x14E6,	%g4
	udivx	%o4,	0x0E3F,	%g6
	fbul,a	%fcc3,	loop_2220
	andcc	%l3,	%g3,	%o6
	movleu	%xcc,	%o3,	%o5
	te	%icc,	0x5
loop_2220:
	fxors	%f19,	%f16,	%f7
	fba	%fcc2,	loop_2221
	edge32l	%l6,	%o0,	%i0
	movre	%o7,	%i7,	%g5
	umul	%i6,	%g2,	%i2
loop_2221:
	fmovsne	%xcc,	%f29,	%f13
	fornot2	%f26,	%f4,	%f8
	orcc	%l0,	%l1,	%g7
	movrgez	%i4,	0x0DC,	%i3
	te	%xcc,	0x1
	tpos	%xcc,	0x3
	sdiv	%o1,	0x0AB4,	%g1
	bpos,a	%icc,	loop_2222
	te	%icc,	0x6
	fbo,a	%fcc1,	loop_2223
	movrlez	%l4,	%o2,	%i5
loop_2222:
	fmovsl	%xcc,	%f1,	%f24
	lduw	[%l7 + 0x0C],	%l2
loop_2223:
	smulcc	%i1,	0x0BC1,	%g4
	xor	%l5,	%g6,	%l3
	xnorcc	%o4,	%g3,	%o3
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%o6
	fbule	%fcc0,	loop_2224
	mova	%xcc,	%l6,	%o5
	mulscc	%i0,	%o0,	%i7
	bpos,pn	%xcc,	loop_2225
loop_2224:
	fmovsn	%icc,	%f17,	%f25
	subccc	%o7,	%g5,	%i6
	nop
	setx loop_2226, %l0, %l1
	jmpl %l1, %g2
loop_2225:
	movge	%xcc,	%i2,	%l0
	movpos	%xcc,	%l1,	%g7
	fabss	%f21,	%f14
loop_2226:
	movvc	%xcc,	%i4,	%o1
	fandnot1s	%f15,	%f24,	%f28
	fmovdpos	%icc,	%f17,	%f12
	stb	%i3,	[%l7 + 0x3C]
	popc	%l4,	%g1
	fnand	%f14,	%f2,	%f24
	taddcctv	%i5,	%o2,	%l2
	sdivcc	%g4,	0x039F,	%l5
	bshuffle	%f2,	%f12,	%f0
	edge16	%g6,	%i1,	%l3
	sll	%o4,	0x08,	%g3
	fbne,a	%fcc2,	loop_2227
	fnegs	%f16,	%f2
	edge16n	%o6,	%l6,	%o5
	movgu	%xcc,	%o3,	%o0
loop_2227:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f12,	[%l7 + 0x60] %asi
	fmovsneg	%icc,	%f21,	%f3
	fmovrsgez	%i0,	%f26,	%f3
	xnor	%i7,	%o7,	%i6
	nop
	setx loop_2228, %l0, %l1
	jmpl %l1, %g2
	edge8	%i2,	%l0,	%g5
	mulx	%l1,	0x1912,	%i4
	nop
	set	0x58, %i7
	std	%f0,	[%l7 + %i7]
loop_2228:
	movre	%g7,	%i3,	%o1
	fmovsgu	%xcc,	%f30,	%f7
	lduw	[%l7 + 0x24],	%l4
	xnorcc	%i5,	0x0817,	%g1
	movvs	%xcc,	%l2,	%g4
	tne	%icc,	0x4
	edge32l	%o2,	%g6,	%l5
	fpack32	%f24,	%f28,	%f6
	fbu	%fcc3,	loop_2229
	sdivx	%l3,	0x19D7,	%o4
	fmovsg	%icc,	%f28,	%f2
	movneg	%icc,	%i1,	%g3
loop_2229:
	orcc	%l6,	%o6,	%o5
	udiv	%o0,	0x015F,	%o3
	tl	%icc,	0x6
	sir	0x1E78
	taddcctv	%i7,	0x06AD,	%i0
	nop
	setx loop_2230, %l0, %l1
	jmpl %l1, %i6
	brlz	%o7,	loop_2231
	movl	%xcc,	%i2,	%g2
	edge32ln	%g5,	%l0,	%i4
loop_2230:
	tleu	%xcc,	0x4
loop_2231:
	andcc	%g7,	%l1,	%i3
	fandnot1s	%f21,	%f5,	%f17
	edge8n	%l4,	%o1,	%i5
	fmovrsne	%g1,	%f11,	%f26
	orcc	%l2,	0x1B86,	%o2
	call	loop_2232
	udivx	%g6,	0x0323,	%g4
	edge8n	%l3,	%l5,	%o4
	orcc	%i1,	%l6,	%g3
loop_2232:
	tge	%icc,	0x3
	bvs	%xcc,	loop_2233
	movcs	%icc,	%o6,	%o5
	udivcc	%o3,	0x0A33,	%i7
	nop
	setx	loop_2234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2233:
	tl	%icc,	0x0
	fpack16	%f18,	%f28
	srlx	%i0,	%o0,	%o7
loop_2234:
	subccc	%i6,	%g2,	%i2
	tne	%icc,	0x5
	set	0x24, %i0
	lduwa	[%l7 + %i0] 0x19,	%g5
	fmovdvs	%icc,	%f19,	%f23
	sllx	%i4,	%g7,	%l0
	fbne	%fcc2,	loop_2235
	popc	0x165D,	%l1
	umulcc	%i3,	%o1,	%l4
	edge32l	%g1,	%i5,	%l2
loop_2235:
	addccc	%o2,	%g4,	%g6
	edge16ln	%l5,	%l3,	%i1
	fbo	%fcc1,	loop_2236
	tvc	%xcc,	0x5
	tgu	%icc,	0x2
	sdivx	%o4,	0x0742,	%l6
loop_2236:
	fmovd	%f22,	%f18
	nop
	setx	loop_2237,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovscc	%xcc,	%f7,	%f11
	mova	%xcc,	%g3,	%o5
	fbne	%fcc2,	loop_2238
loop_2237:
	movneg	%icc,	%o6,	%i7
	fmovdleu	%xcc,	%f18,	%f29
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f16
loop_2238:
	fnor	%f6,	%f12,	%f10
	udivx	%i0,	0x02E6,	%o3
	umulcc	%o7,	%i6,	%o0
	sllx	%i2,	0x08,	%g2
	fmovdn	%icc,	%f9,	%f19
	fsrc2s	%f10,	%f3
	movn	%xcc,	%i4,	%g5
	bpos	%xcc,	loop_2239
	tvs	%xcc,	0x5
	subc	%l0,	%g7,	%l1
	movn	%xcc,	%o1,	%i3
loop_2239:
	bshuffle	%f2,	%f0,	%f4
	tne	%xcc,	0x5
	edge16ln	%l4,	%i5,	%g1
	prefetch	[%l7 + 0x10],	 0x2
	fblg	%fcc3,	loop_2240
	tge	%icc,	0x0
	stb	%l2,	[%l7 + 0x3F]
	brlz	%o2,	loop_2241
loop_2240:
	fmul8x16au	%f26,	%f12,	%f24
	fmovsge	%icc,	%f23,	%f28
	sub	%g4,	%l5,	%g6
loop_2241:
	addcc	%l3,	%i1,	%l6
	sllx	%o4,	0x0C,	%o5
	stbar
	nop
	setx loop_2242, %l0, %l1
	jmpl %l1, %g3
	array16	%i7,	%o6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i0,	0x00,	%i6
loop_2242:
	tge	%xcc,	0x5
	andn	%o0,	%o7,	%g2
	udivcc	%i4,	0x056D,	%g5
	sdivx	%i2,	0x1200,	%l0
	smulcc	%l1,	%g7,	%o1
	smulcc	%i3,	%i5,	%g1
	movge	%xcc,	%l2,	%o2
	edge32ln	%l4,	%l5,	%g4
	fble	%fcc2,	loop_2243
	fmovrdgez	%g6,	%f14,	%f26
	fpackfix	%f8,	%f6
	fnor	%f30,	%f28,	%f10
loop_2243:
	fpsub16	%f18,	%f12,	%f0
	tvs	%icc,	0x1
	alignaddr	%i1,	%l3,	%o4
	subc	%l6,	%o5,	%g3
	xor	%o6,	%i7,	%o3
	siam	0x4
	fcmpgt16	%f18,	%f8,	%i0
	move	%icc,	%i6,	%o7
	subcc	%o0,	%i4,	%g5
	fbe	%fcc0,	loop_2244
	tl	%icc,	0x3
	set	0x4E, %o4
	stha	%g2,	[%l7 + %o4] 0xe3
	membar	#Sync
loop_2244:
	pdist	%f10,	%f30,	%f12
	fpadd16	%f16,	%f6,	%f28
	fmovda	%icc,	%f30,	%f12
	movvs	%icc,	%i2,	%l0
	fornot1s	%f14,	%f1,	%f29
	andn	%l1,	0x132E,	%o1
	siam	0x0
	edge16n	%i3,	%i5,	%g1
	subcc	%g7,	%l2,	%o2
	taddcc	%l4,	0x0FA2,	%l5
	nop
	setx loop_2245, %l0, %l1
	jmpl %l1, %g4
	and	%g6,	0x1014,	%i1
	fcmpgt16	%f22,	%f30,	%o4
	tvc	%icc,	0x0
loop_2245:
	srlx	%l3,	%o5,	%l6
	tl	%icc,	0x6
	fabsd	%f14,	%f28
	xnorcc	%g3,	%o6,	%i7
	movleu	%xcc,	%o3,	%i6
	and	%o7,	0x0F9F,	%i0
	faligndata	%f22,	%f18,	%f14
	movneg	%icc,	%i4,	%g5
	fbe,a	%fcc2,	loop_2246
	fnands	%f14,	%f21,	%f18
	xor	%g2,	0x0FD9,	%i2
	fmovdvc	%icc,	%f8,	%f24
loop_2246:
	ldstub	[%l7 + 0x35],	%o0
	membar	0x31
	faligndata	%f26,	%f4,	%f0
	movpos	%icc,	%l1,	%o1
	bn,a,pt	%xcc,	loop_2247
	bleu,a,pn	%xcc,	loop_2248
	movne	%xcc,	%i3,	%l0
	movcs	%icc,	%i5,	%g7
loop_2247:
	movleu	%icc,	%g1,	%o2
loop_2248:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f30,	%f23
	fsrc2	%f30,	%f22
	ldd	[%l7 + 0x58],	%l2
	movcc	%xcc,	%l4,	%g4
	stbar
	wr	%g0,	0x2a,	%asi
	stda	%l4,	[%l7 + 0x18] %asi
	membar	#Sync
	smulcc	%g6,	%i1,	%l3
	subc	%o4,	0x1637,	%o5
	edge16ln	%g3,	%l6,	%i7
	tcc	%icc,	0x7
	fpadd32s	%f11,	%f25,	%f3
	st	%f2,	[%l7 + 0x7C]
	fpmerge	%f29,	%f21,	%f0
	fmovsvc	%icc,	%f23,	%f25
	wr	%g0,	0x0c,	%asi
	stwa	%o6,	[%l7 + 0x24] %asi
	fpsub32s	%f13,	%f13,	%f7
	wr	%g0,	0x81,	%asi
	stba	%i6,	[%l7 + 0x5E] %asi
	stb	%o7,	[%l7 + 0x26]
	fmovsgu	%xcc,	%f2,	%f31
	srl	%i0,	%i4,	%g5
	alignaddr	%o3,	%i2,	%o0
	sdivx	%l1,	0x1066,	%g2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%o1
	set	0x1E, %i3
	ldsba	[%l7 + %i3] 0x81,	%i3
	edge32	%l0,	%g7,	%i5
	xnorcc	%g1,	0x129D,	%l2
	and	%l4,	0x10EB,	%g4
	xor	%l5,	0x1248,	%o2
	edge16n	%g6,	%i1,	%o4
	sll	%l3,	%o5,	%l6
	ta	%xcc,	0x3
	fbuge,a	%fcc1,	loop_2249
	stbar
	fba	%fcc2,	loop_2250
	fmovda	%xcc,	%f16,	%f26
loop_2249:
	nop
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2250:
	fbl,a	%fcc1,	loop_2251
	edge16l	%g3,	%o6,	%i6
	movn	%xcc,	%o7,	%i7
	subc	%i0,	0x0617,	%i4
loop_2251:
	fpsub16	%f12,	%f22,	%f12
	nop
	setx loop_2252, %l0, %l1
	jmpl %l1, %g5
	ld	[%l7 + 0x08],	%f1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o3,	%o0
loop_2252:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x18] %asi,	%l1
	xorcc	%i2,	%g2,	%i3
	fble,a	%fcc1,	loop_2253
	fmul8x16al	%f12,	%f19,	%f24
	tpos	%xcc,	0x3
	edge16	%l0,	%o1,	%g7
loop_2253:
	fbl	%fcc3,	loop_2254
	sra	%g1,	0x01,	%l2
	sethi	0x0E47,	%i5
	addccc	%g4,	%l4,	%l5
loop_2254:
	srlx	%o2,	%i1,	%g6
	call	loop_2255
	taddcc	%o4,	0x0D78,	%l3
	movcs	%icc,	%o5,	%g3
	tge	%icc,	0x6
loop_2255:
	smulcc	%o6,	%l6,	%o7
	fbn	%fcc3,	loop_2256
	sdiv	%i6,	0x09B5,	%i7
	movvc	%icc,	%i0,	%i4
	tle	%icc,	0x3
loop_2256:
	fble	%fcc2,	loop_2257
	fmovdneg	%xcc,	%f31,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o3,	%o0,	%l1
loop_2257:
	fbl	%fcc3,	loop_2258
	ldsb	[%l7 + 0x49],	%i2
	sdivcc	%g2,	0x1DE7,	%g5
	movpos	%icc,	%l0,	%i3
loop_2258:
	fcmpgt32	%f8,	%f8,	%o1
	udivcc	%g7,	0x0EF2,	%l2
	fcmple32	%f6,	%f20,	%g1
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	move	%xcc,	%i5,	%g4
	udiv	%l4,	0x1E19,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc1,	loop_2259
	fmovsvc	%xcc,	%f25,	%f27
	brgz	%l5,	loop_2260
	edge32	%i1,	%o4,	%g6
loop_2259:
	movcc	%icc,	%o5,	%g3
	fbge	%fcc3,	loop_2261
loop_2260:
	fsrc2s	%f25,	%f19
	movgu	%xcc,	%o6,	%l6
	fbue,a	%fcc1,	loop_2262
loop_2261:
	orn	%o7,	%l3,	%i6
	umulcc	%i0,	%i7,	%i4
	fmuld8sux16	%f8,	%f19,	%f14
loop_2262:
	bn	loop_2263
	bl,a,pt	%xcc,	loop_2264
	bneg,pt	%icc,	loop_2265
	ldsw	[%l7 + 0x7C],	%o3
loop_2263:
	tsubcc	%o0,	%l1,	%i2
loop_2264:
	edge8ln	%g2,	%l0,	%i3
loop_2265:
	ta	%icc,	0x5
	movleu	%icc,	%o1,	%g5
	bg,a	%icc,	loop_2266
	fpsub32	%f30,	%f14,	%f4
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x1
loop_2266:
	tvs	%icc,	0x4
	and	%g7,	%i5,	%g1
	srlx	%l4,	0x1A,	%g4
	bge,a,pn	%icc,	loop_2267
	fmovdleu	%xcc,	%f17,	%f31
	wr	%g0,	0x10,	%asi
	stwa	%o2,	[%l7 + 0x70] %asi
loop_2267:
	tl	%icc,	0x4
	umulcc	%l5,	%i1,	%g6
	sra	%o4,	0x0F,	%g3
	nop
	setx	loop_2268,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	lduh	[%l7 + 0x2C],	%o5
	bcs,a	%xcc,	loop_2269
	mulscc	%o6,	0x05C7,	%l6
loop_2268:
	fandnot2	%f20,	%f16,	%f28
	fpack16	%f20,	%f2
loop_2269:
	nop
	wr	%g0,	0x22,	%asi
	stba	%o7,	[%l7 + 0x78] %asi
	membar	#Sync
	addccc	%i6,	%i0,	%l3
	fmovrdgez	%i4,	%f10,	%f6
	add	%o3,	%i7,	%l1
	tg	%xcc,	0x6
	brz	%o0,	loop_2270
	fmovdneg	%icc,	%f0,	%f1
	fornot2	%f18,	%f2,	%f4
	tle	%icc,	0x3
loop_2270:
	movvc	%icc,	%g2,	%i2
	bneg,a	loop_2271
	edge16n	%l0,	%o1,	%i3
	nop
	set	0x78, %l0
	stw	%l2,	[%l7 + %l0]
	siam	0x7
loop_2271:
	fmovscs	%xcc,	%f15,	%f23
	brz	%g7,	loop_2272
	movcc	%xcc,	%i5,	%g5
	movrlz	%l4,	0x070,	%g1
	movrgz	%g4,	%l5,	%i1
loop_2272:
	fsrc1	%f6,	%f22
	sdiv	%g6,	0x0A1E,	%o4
	mova	%icc,	%g3,	%o2
	umul	%o5,	%l6,	%o7
	tge	%icc,	0x4
	alignaddrl	%i6,	%o6,	%i0
	fbl	%fcc3,	loop_2273
	subc	%i4,	%o3,	%i7
	sir	0x0E63
	movcs	%icc,	%l1,	%o0
loop_2273:
	fsrc1	%f2,	%f30
	set	0x30, %i1
	stha	%l3,	[%l7 + %i1] 0x2f
	membar	#Sync
	be,a	loop_2274
	udivx	%i2,	0x0926,	%g2
	nop
	setx	loop_2275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x2
loop_2274:
	edge16l	%l0,	%o1,	%i3
	fmovsneg	%icc,	%f15,	%f4
loop_2275:
	std	%l2,	[%l7 + 0x18]
	movvs	%xcc,	%g7,	%i5
	set	0x68, %i2
	sta	%f19,	[%l7 + %i2] 0x15
	fmovsn	%icc,	%f25,	%f31
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x0F] %asi,	%l4
	edge8ln	%g5,	%g4,	%g1
	fexpand	%f3,	%f14
	subccc	%i1,	0x0D04,	%l5
	tcc	%xcc,	0x3
	set	0x2C, %o7
	lda	[%l7 + %o7] 0x81,	%f31
	sll	%o4,	0x0E,	%g3
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
	movg	%xcc,	%o2,	%o5
	addc	%l6,	%o7,	%g6
	movge	%icc,	%i6,	%i0
loop_2276:
	movrlez	%i4,	%o3,	%o6
	movrgz	%l1,	0x2F8,	%o0
	brgez	%i7,	loop_2277
	ta	%icc,	0x3
	sra	%i2,	%l3,	%l0
	fornot1s	%f22,	%f6,	%f27
loop_2277:
	fmovrdgez	%o1,	%f28,	%f14
	array32	%i3,	%l2,	%g7
	fmovdvc	%xcc,	%f23,	%f24
	tvc	%icc,	0x7
	fpadd16s	%f14,	%f6,	%f30
	movneg	%icc,	%g2,	%i5
	tvs	%xcc,	0x3
	fmovdvc	%xcc,	%f25,	%f13
	andncc	%g5,	%l4,	%g1
	array16	%i1,	%l5,	%g4
	andncc	%o4,	%g3,	%o2
	srlx	%o5,	0x0A,	%o7
	fbule,a	%fcc0,	loop_2278
	fmovscc	%icc,	%f2,	%f21
	srl	%l6,	%i6,	%g6
	prefetch	[%l7 + 0x70],	 0x0
loop_2278:
	swap	[%l7 + 0x50],	%i4
	movrgez	%i0,	0x232,	%o3
	fmovsvc	%xcc,	%f23,	%f31
	movre	%o6,	%l1,	%i7
	edge8l	%o0,	%i2,	%l3
	subccc	%l0,	0x0288,	%i3
	move	%xcc,	%l2,	%o1
	fnot2s	%f26,	%f28
	fnot1s	%f16,	%f6
	edge16ln	%g2,	%i5,	%g7
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0x0
	tvs	%xcc,	0x6
	sth	%l4,	[%l7 + 0x4C]
	fbl,a	%fcc1,	loop_2279
	addccc	%i1,	0x0082,	%l5
	sir	0x0BFF
	brnz	%g1,	loop_2280
loop_2279:
	tvc	%xcc,	0x2
	array32	%g4,	%g3,	%o2
	fcmpes	%fcc2,	%f27,	%f7
loop_2280:
	fbug,a	%fcc3,	loop_2281
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o4,	0x0F,	%o5
	stx	%l6,	[%l7 + 0x60]
loop_2281:
	fornot1	%f20,	%f0,	%f0
	umulcc	%i6,	0x1B9E,	%g6
	fbu	%fcc0,	loop_2282
	fmovsgu	%icc,	%f11,	%f9
	srlx	%o7,	0x1D,	%i0
	taddcctv	%o3,	0x103D,	%i4
loop_2282:
	fcmpeq16	%f12,	%f8,	%o6
	udiv	%i7,	0x1F91,	%l1
	edge16n	%o0,	%i2,	%l3
	sll	%l0,	0x0F,	%i3
	sdivx	%o1,	0x0CA9,	%g2
	membar	0x1A
	array32	%i5,	%g7,	%g5
	fnegs	%f24,	%f16
	sllx	%l2,	0x15,	%l4
	fpack16	%f16,	%f23
	udivcc	%l5,	0x0A3D,	%g1
	sethi	0x16A3,	%g4
	edge8ln	%i1,	%g3,	%o4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbg,a	%fcc1,	loop_2283
	fbul	%fcc2,	loop_2284
	edge16l	%o5,	%o2,	%i6
	nop
	setx	loop_2285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2283:
	sethi	0x01AF,	%l6
loop_2284:
	orncc	%o7,	%i0,	%g6
	tcc	%icc,	0x3
loop_2285:
	nop
	set	0x4A, %l2
	ldsha	[%l7 + %l2] 0x19,	%i4
	fmul8x16au	%f5,	%f16,	%f0
	sdiv	%o3,	0x13B8,	%o6
	wr	%g0,	0x11,	%asi
	stha	%i7,	[%l7 + 0x78] %asi
	srax	%l1,	0x0B,	%o0
	udivx	%i2,	0x1F12,	%l0
	andncc	%i3,	%l3,	%o1
	tneg	%xcc,	0x7
	fxnor	%f16,	%f30,	%f6
	fones	%f11
	fpadd32s	%f15,	%f24,	%f0
	sllx	%i5,	0x00,	%g2
	popc	%g7,	%l2
	edge8	%g5,	%l4,	%g1
	membar	0x41
	set	0x54, %o1
	sta	%f28,	[%l7 + %o1] 0x0c
	movrgz	%g4,	0x21D,	%i1
	movrgez	%l5,	0x07A,	%o4
	orncc	%g3,	0x058D,	%o5
	andncc	%i6,	%o2,	%l6
	movpos	%xcc,	%i0,	%o7
	fba,a	%fcc2,	loop_2286
	and	%g6,	%o3,	%o6
	fmul8x16al	%f24,	%f8,	%f0
	sth	%i7,	[%l7 + 0x58]
loop_2286:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x24] %asi,	%i4
	fnot2s	%f11,	%f15
	movre	%l1,	%i2,	%o0
	fmovdcc	%xcc,	%f11,	%f24
	smulcc	%l0,	%l3,	%i3
	movn	%xcc,	%o1,	%i5
	fmovrdlz	%g2,	%f0,	%f12
	or	%g7,	0x0DDB,	%l2
	movn	%icc,	%g5,	%l4
	array8	%g1,	%g4,	%l5
	edge32l	%o4,	%i1,	%g3
	brlz,a	%i6,	loop_2287
	taddcctv	%o5,	0x095A,	%o2
	orncc	%i0,	0x17E5,	%l6
	taddcc	%o7,	0x082F,	%g6
loop_2287:
	edge8	%o6,	%o3,	%i4
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	membar	0x2D
	fmovrslez	%i7,	%f17,	%f8
	tsubcctv	%l1,	%i2,	%l0
	fbule	%fcc3,	loop_2288
	movcs	%xcc,	%o0,	%i3
	fornot1s	%f19,	%f10,	%f1
	fsrc2	%f18,	%f14
loop_2288:
	brlz	%o1,	loop_2289
	fcmple32	%f26,	%f18,	%i5
	ldstub	[%l7 + 0x25],	%g2
	tcc	%icc,	0x3
loop_2289:
	sdivx	%l3,	0x026B,	%g7
	tneg	%xcc,	0x6
	fblg	%fcc3,	loop_2290
	fcmple16	%f0,	%f2,	%g5
	fnot2s	%f27,	%f26
	fand	%f8,	%f10,	%f14
loop_2290:
	andncc	%l4,	%g1,	%g4
	smulcc	%l5,	%o4,	%i1
	fpack32	%f12,	%f0,	%f20
	set	0x7B, %o0
	lduba	[%l7 + %o0] 0x19,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%o5
	fxnor	%f10,	%f30,	%f16
	movne	%icc,	%g3,	%i0
	addc	%o2,	0x1825,	%l6
	fpackfix	%f10,	%f6
	bl,a	%xcc,	loop_2291
	fmovrdlz	%o7,	%f26,	%f14
	ld	[%l7 + 0x0C],	%f22
	set	0x7C, %l4
	ldsha	[%l7 + %l4] 0x11,	%g6
loop_2291:
	fmovsgu	%icc,	%f12,	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x0c,	%o3,	%o6
	fmovrsne	%i7,	%f10,	%f17
	call	loop_2292
	tleu	%xcc,	0x1
	andcc	%l1,	%i2,	%i4
	movgu	%xcc,	%o0,	%l0
loop_2292:
	movneg	%xcc,	%i3,	%i5
	sethi	0x0801,	%g2
	fmovdg	%xcc,	%f2,	%f4
	movrgz	%l3,	%g7,	%g5
	subccc	%o1,	%g1,	%l4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	st	%f30,	[%l7 + 0x40]
	bcc,a	loop_2293
	sdiv	%o4,	0x1087,	%i1
	alignaddr	%l5,	%l2,	%i6
	taddcctv	%g3,	0x0F92,	%o5
loop_2293:
	movrgz	%o2,	0x22A,	%l6
	ldsh	[%l7 + 0x24],	%o7
	subc	%i0,	0x0A0F,	%g6
	bl,a,pn	%xcc,	loop_2294
	tle	%xcc,	0x5
	ble,a	%xcc,	loop_2295
	addccc	%o6,	%o3,	%l1
loop_2294:
	movrgz	%i2,	0x330,	%i4
	popc	%i7,	%l0
loop_2295:
	nop
	wr	%g0,	0xe2,	%asi
	stba	%i3,	[%l7 + 0x0E] %asi
	membar	#Sync
	movvc	%icc,	%o0,	%g2
	fandnot2s	%f19,	%f2,	%f17
	lduh	[%l7 + 0x14],	%i5
	orncc	%l3,	0x09CF,	%g7
	fcmpd	%fcc3,	%f0,	%f22
	bleu,a	%xcc,	loop_2296
	fmovrsne	%g5,	%f24,	%f17
	movvs	%icc,	%o1,	%l4
	tle	%icc,	0x2
loop_2296:
	addccc	%g1,	%o4,	%i1
	call	loop_2297
	fmovdleu	%xcc,	%f16,	%f21
	sra	%g4,	0x10,	%l2
	movg	%icc,	%l5,	%g3
loop_2297:
	fbge	%fcc0,	loop_2298
	movrgez	%o5,	%i6,	%o2
	smul	%l6,	%o7,	%i0
	call	loop_2299
loop_2298:
	movrlez	%o6,	0x39C,	%o3
	edge32ln	%l1,	%i2,	%g6
	movrlez	%i7,	0x101,	%l0
loop_2299:
	ble	loop_2300
	umulcc	%i3,	%o0,	%i4
	or	%i5,	0x0790,	%l3
	popc	%g7,	%g2
loop_2300:
	tcc	%icc,	0x2
	tleu	%icc,	0x2
	smulcc	%g5,	%o1,	%l4
	sdivcc	%g1,	0x1CB4,	%i1
	smul	%g4,	0x1C9D,	%l2
	edge8	%o4,	%g3,	%o5
	edge8	%l5,	%i6,	%o2
	sdivcc	%l6,	0x009B,	%o7
	movleu	%xcc,	%i0,	%o3
	fone	%f10
	movre	%o6,	%l1,	%i2
	udivcc	%i7,	0x0237,	%l0
	movne	%xcc,	%g6,	%o0
	fmovdl	%xcc,	%f2,	%f25
	smulcc	%i4,	0x0C30,	%i3
	bpos,a,pn	%xcc,	loop_2301
	edge8l	%l3,	%g7,	%i5
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
	tpos	%xcc,	0x5
loop_2301:
	movcs	%icc,	%g5,	%o1
	tgu	%icc,	0x3
loop_2302:
	fmovrdlz	%g2,	%f20,	%f8
	array16	%g1,	%l4,	%i1
	movvc	%xcc,	%l2,	%o4
	alignaddrl	%g3,	%g4,	%l5
	umul	%o5,	%i6,	%o2
	fmovdpos	%xcc,	%f0,	%f25
	fbe	%fcc1,	loop_2303
	taddcc	%o7,	0x0DF8,	%l6
	umulcc	%i0,	%o6,	%l1
	fsrc1s	%f23,	%f17
loop_2303:
	mulscc	%o3,	0x1009,	%i2
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	andncc	%i7,	%l0,	%g6
	srl	%o0,	0x00,	%i4
	movg	%icc,	%l3,	%i3
	fpackfix	%f22,	%f9
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x44] %asi,	%i5
	xor	%g5,	0x0E3E,	%g7
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g1
	movvs	%xcc,	%l4,	%i1
	array8	%o1,	%o4,	%l2
	fpadd16s	%f14,	%f26,	%f12
	movg	%xcc,	%g4,	%l5
	fcmpes	%fcc3,	%f3,	%f25
	movge	%icc,	%o5,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x11,	%g3,	%o2
	andn	%l6,	%o7,	%i0
	movcc	%xcc,	%o6,	%l1
	tsubcctv	%i2,	0x1831,	%o3
	umulcc	%i7,	0x02C1,	%l0
	edge32	%o0,	%i4,	%g6
	ldd	[%l7 + 0x78],	%l2
	edge16	%i3,	%g5,	%i5
	edge8n	%g7,	%g2,	%l4
	movrlz	%i1,	%o1,	%o4
	fpsub32	%f12,	%f26,	%f6
	andcc	%g1,	0x055A,	%g4
	brgz,a	%l5,	loop_2304
	subc	%l2,	%i6,	%o5
	sdivx	%o2,	0x040D,	%l6
	subccc	%g3,	0x067F,	%o7
loop_2304:
	fsrc1s	%f27,	%f1
	sdivcc	%i0,	0x068D,	%o6
	fbu	%fcc2,	loop_2305
	flush	%l7 + 0x78
	edge8l	%i2,	%l1,	%i7
	sdivx	%l0,	0x06CA,	%o0
loop_2305:
	nop
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x89,	%i4
	movgu	%xcc,	%o3,	%g6
	bgu,a,pt	%xcc,	loop_2306
	movne	%icc,	%i3,	%g5
	fbo	%fcc1,	loop_2307
	array16	%i5,	%g7,	%g2
loop_2306:
	smul	%l3,	%l4,	%i1
	fsrc1	%f12,	%f18
loop_2307:
	fmovsg	%icc,	%f4,	%f5
	fnot1	%f30,	%f4
	udiv	%o1,	0x156A,	%o4
	pdist	%f18,	%f18,	%f24
	nop
	setx	loop_2308,	%l0,	%l1
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
	tneg	%icc,	0x3
	fmovrsne	%g1,	%f25,	%f31
loop_2308:
	bleu,a	%xcc,	loop_2309
	subccc	%l5,	%l2,	%i6
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f4
	fnegd	%f30,	%f24
loop_2309:
	addc	%g4,	0x0949,	%o5
	tvs	%icc,	0x4
	movrlez	%l6,	%g3,	%o2
	brgz,a	%i0,	loop_2310
	srl	%o7,	%i2,	%l1
	membar	0x62
	subcc	%i7,	0x1CB3,	%l0
loop_2310:
	taddcctv	%o6,	0x056F,	%i4
	fabss	%f30,	%f28
	fmul8x16al	%f28,	%f31,	%f2
	movgu	%xcc,	%o3,	%g6
	tsubcctv	%i3,	0x0D8E,	%o0
	fnot2	%f20,	%f4
	subcc	%i5,	%g5,	%g2
	fmovrslz	%l3,	%f10,	%f0
	nop
	setx	loop_2311,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bshuffle	%f10,	%f4,	%f26
	alignaddrl	%l4,	%i1,	%o1
	movge	%xcc,	%g7,	%o4
loop_2311:
	fmul8x16al	%f4,	%f6,	%f2
	smulcc	%l5,	%l2,	%g1
	movne	%icc,	%i6,	%o5
	alignaddrl	%l6,	%g4,	%o2
	tcs	%icc,	0x6
	tneg	%icc,	0x5
	udivcc	%g3,	0x1EDA,	%o7
	umul	%i2,	%i0,	%i7
	and	%l1,	0x10C1,	%l0
	sdivx	%i4,	0x1387,	%o3
	fbuge	%fcc3,	loop_2312
	udivx	%g6,	0x07DF,	%o6
	ta	%xcc,	0x5
	tleu	%icc,	0x5
loop_2312:
	tne	%icc,	0x2
	udivcc	%i3,	0x14F7,	%i5
	xor	%g5,	%o0,	%l3
	fors	%f29,	%f31,	%f13
	sub	%l4,	0x19E5,	%i1
	tsubcctv	%g2,	%g7,	%o1
	array32	%l5,	%l2,	%o4
	sth	%i6,	[%l7 + 0x44]
	smul	%g1,	0x12FE,	%o5
	ldsw	[%l7 + 0x64],	%g4
	brgz	%o2,	loop_2313
	array16	%l6,	%o7,	%i2
	edge32l	%g3,	%i0,	%l1
	fcmple32	%f0,	%f18,	%i7
loop_2313:
	fbo	%fcc2,	loop_2314
	siam	0x1
	array16	%i4,	%o3,	%l0
	tgu	%xcc,	0x6
loop_2314:
	bne,a	%xcc,	loop_2315
	ldub	[%l7 + 0x2D],	%g6
	movgu	%icc,	%i3,	%i5
	fbge	%fcc2,	loop_2316
loop_2315:
	array32	%g5,	%o6,	%o0
	fmovrsgez	%l3,	%f18,	%f9
	fcmpd	%fcc0,	%f26,	%f22
loop_2316:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i1,	%l4
	movg	%icc,	%g2,	%o1
	srl	%l5,	%g7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l2,	%i6,	%o5
	fnot2	%f16,	%f16
	mulx	%g4,	%g1,	%o2
	tpos	%icc,	0x5
	tsubcctv	%l6,	%i2,	%g3
	andncc	%i0,	%o7,	%i7
	fmovrdlz	%i4,	%f4,	%f8
	sra	%o3,	0x0D,	%l1
	subcc	%l0,	0x1A2F,	%g6
	movneg	%xcc,	%i5,	%g5
	membar	0x1F
	srl	%o6,	0x04,	%i3
	and	%o0,	%l3,	%l4
	fmovdvs	%xcc,	%f14,	%f23
	mulx	%g2,	%o1,	%i1
	orcc	%l5,	0x1807,	%o4
	fbo	%fcc0,	loop_2317
	mova	%xcc,	%g7,	%i6
	fmovrde	%o5,	%f20,	%f16
	tgu	%xcc,	0x0
loop_2317:
	fbne,a	%fcc0,	loop_2318
	ldx	[%l7 + 0x30],	%g4
	fzeros	%f0
	fornot2	%f24,	%f26,	%f22
loop_2318:
	sll	%g1,	0x09,	%o2
	movcs	%xcc,	%l2,	%l6
	movrgez	%i2,	0x32E,	%i0
	tne	%icc,	0x4
	movrgez	%o7,	%g3,	%i7
	addcc	%o3,	%l1,	%l0
	mulx	%i4,	0x0754,	%i5
	sub	%g6,	0x17F3,	%o6
	fble	%fcc1,	loop_2319
	movcs	%xcc,	%i3,	%g5
	array16	%l3,	%o0,	%l4
	fpack16	%f10,	%f5
loop_2319:
	sub	%g2,	%o1,	%i1
	tge	%xcc,	0x4
	fmul8x16al	%f26,	%f31,	%f10
	fmovsge	%icc,	%f3,	%f16
	xorcc	%l5,	0x0603,	%g7
	ldsh	[%l7 + 0x32],	%i6
	prefetch	[%l7 + 0x14],	 0x1
	wr	%g0,	0xeb,	%asi
	stwa	%o5,	[%l7 + 0x08] %asi
	membar	#Sync
	movrlz	%g4,	%o4,	%o2
	edge16l	%l2,	%g1,	%l6
	tcc	%icc,	0x4
	movrgez	%i2,	0x17E,	%i0
	edge16n	%g3,	%o7,	%i7
	edge32l	%o3,	%l0,	%l1
	movrlez	%i4,	0x026,	%g6
	sdivx	%i5,	0x0EA5,	%o6
	addcc	%i3,	%l3,	%o0
	tgu	%icc,	0x4
	move	%xcc,	%g5,	%g2
	fpsub16s	%f25,	%f27,	%f17
	sll	%l4,	0x02,	%i1
	addccc	%l5,	0x184C,	%g7
	movn	%icc,	%i6,	%o5
	sllx	%o1,	%g4,	%o2
	smul	%l2,	0x16C1,	%g1
	alignaddr	%o4,	%l6,	%i2
	set	0x30, %o3
	ldxa	[%l7 + %o3] 0x80,	%g3
	movne	%icc,	%i0,	%o7
	brz	%o3,	loop_2320
	tcs	%icc,	0x2
	sdivx	%l0,	0x1B3B,	%i7
	tne	%xcc,	0x0
loop_2320:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f3,	[%l7 + 0x18] %asi
	movrne	%l1,	%g6,	%i5
	nop
	set	0x3C, %g3
	ldsw	[%l7 + %g3],	%i4
	bvs,pn	%xcc,	loop_2321
	orncc	%i3,	0x1DBA,	%o6
	movpos	%xcc,	%o0,	%g5
	ldsw	[%l7 + 0x44],	%l3
loop_2321:
	fmovrdlez	%l4,	%f12,	%f14
	fbl	%fcc3,	loop_2322
	ta	%icc,	0x6
	xor	%g2,	%l5,	%g7
	sdivcc	%i1,	0x0276,	%i6
loop_2322:
	fandnot1	%f18,	%f30,	%f8
	fzeros	%f15
	edge32n	%o1,	%o5,	%g4
	tgu	%icc,	0x1
	tsubcctv	%l2,	%o2,	%o4
	bvc,a,pt	%icc,	loop_2323
	nop
	set	0x79, %i6
	ldub	[%l7 + %i6],	%l6
	lduw	[%l7 + 0x6C],	%g1
	sllx	%i2,	0x08,	%i0
loop_2323:
	array8	%g3,	%o7,	%l0
	tcs	%xcc,	0x7
	mulx	%o3,	%l1,	%g6
	movn	%icc,	%i5,	%i4
	tleu	%icc,	0x3
	ldd	[%l7 + 0x70],	%i2
	movpos	%icc,	%i7,	%o6
	brlez,a	%o0,	loop_2324
	stw	%g5,	[%l7 + 0x6C]
	srax	%l3,	0x1F,	%g2
	edge8	%l5,	%l4,	%g7
loop_2324:
	nop
	set	0x70, %g7
	lda	[%l7 + %g7] 0x18,	%f18
	movcc	%icc,	%i6,	%o1
	movpos	%icc,	%o5,	%g4
	tgu	%xcc,	0x6
	edge8n	%l2,	%o2,	%o4
	nop
	setx	loop_2325,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%i1,	%g1,	%l6
	edge32l	%i2,	%i0,	%o7
	fbl	%fcc3,	loop_2326
loop_2325:
	fabsd	%f26,	%f2
	umul	%l0,	0x12DF,	%o3
	fbue	%fcc2,	loop_2327
loop_2326:
	flush	%l7 + 0x58
	tvs	%xcc,	0x2
	smulcc	%l1,	0x0244,	%g6
loop_2327:
	sll	%g3,	0x14,	%i4
	fmovsneg	%icc,	%f16,	%f1
	wr	%g0,	0x04,	%asi
	stda	%i4,	[%l7 + 0x60] %asi
	movge	%icc,	%i3,	%o6
	wr	%g0,	0x2f,	%asi
	stha	%o0,	[%l7 + 0x2C] %asi
	membar	#Sync
	array8	%g5,	%i7,	%l3
	bg	%icc,	loop_2328
	sethi	0x18FC,	%l5
	mulscc	%l4,	0x1BCC,	%g7
	fxor	%f2,	%f10,	%f20
loop_2328:
	fandnot1	%f0,	%f30,	%f18
	movcs	%xcc,	%i6,	%g2
	edge32ln	%o5,	%o1,	%l2
	popc	%g4,	%o2
	udivcc	%i1,	0x11F7,	%o4
	bge	loop_2329
	movvc	%xcc,	%g1,	%i2
	set	0x30, %o2
	swapa	[%l7 + %o2] 0x89,	%l6
loop_2329:
	tvc	%icc,	0x4
	edge32n	%o7,	%l0,	%i0
	srlx	%l1,	0x03,	%g6
	fsrc2	%f0,	%f6
	sub	%g3,	%i4,	%i5
	tleu	%icc,	0x4
	movne	%xcc,	%o3,	%o6
	nop
	setx loop_2330, %l0, %l1
	jmpl %l1, %o0
	fmul8ulx16	%f0,	%f22,	%f26
	fpack16	%f30,	%f10
	tcs	%xcc,	0x1
loop_2330:
	fcmpeq16	%f0,	%f22,	%g5
	fpadd32	%f2,	%f26,	%f24
	fmovdcc	%xcc,	%f19,	%f17
	movvs	%xcc,	%i7,	%l3
	sra	%i3,	0x11,	%l4
	wr	%g0,	0x89,	%asi
	sta	%f29,	[%l7 + 0x18] %asi
	addccc	%g7,	%l5,	%i6
	fmuld8sux16	%f24,	%f9,	%f12
	ldd	[%l7 + 0x58],	%f6
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x81,	%g2
	lduh	[%l7 + 0x28],	%o5
	nop
	setx loop_2331, %l0, %l1
	jmpl %l1, %l2
	tl	%icc,	0x5
	set	0x6A, %g6
	lduha	[%l7 + %g6] 0x0c,	%o1
loop_2331:
	movneg	%icc,	%g4,	%i1
	xnor	%o4,	0x0237,	%o2
	st	%f11,	[%l7 + 0x0C]
	tg	%xcc,	0x3
	fnot1s	%f17,	%f3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x19,	%i2,	%l6
	movrgez	%o7,	0x3BF,	%l0
	smulcc	%i0,	0x0279,	%l1
	udiv	%g1,	0x114D,	%g3
	edge32n	%g6,	%i5,	%i4
	fornot1s	%f6,	%f4,	%f19
	fmovsl	%xcc,	%f0,	%f27
	tneg	%icc,	0x4
	sdiv	%o6,	0x0B0F,	%o0
	xorcc	%o3,	0x1BC3,	%g5
	tleu	%xcc,	0x4
	fmovsvs	%icc,	%f17,	%f12
	taddcctv	%l3,	%i3,	%l4
	nop
	setx	loop_2332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%i7,	%l5,	%i6
	movpos	%icc,	%g7,	%g2
	xnorcc	%o5,	0x07A7,	%o1
loop_2332:
	edge8	%g4,	%i1,	%o4
	movvs	%icc,	%l2,	%o2
	xnor	%l6,	%o7,	%i2
	movcs	%xcc,	%i0,	%l1
	movrgez	%g1,	0x389,	%g3
	fmovrdlez	%l0,	%f2,	%f4
	edge32	%g6,	%i4,	%o6
	fmovscs	%xcc,	%f0,	%f19
	sllx	%o0,	0x1D,	%i5
	addcc	%g5,	%l3,	%o3
	fmovsle	%xcc,	%f9,	%f1
	sllx	%i3,	%i7,	%l5
	fmovdcs	%icc,	%f21,	%f26
	tsubcctv	%i6,	%g7,	%g2
	fors	%f12,	%f23,	%f5
	tcc	%icc,	0x4
	sub	%l4,	0x1A40,	%o5
	fmovrde	%g4,	%f0,	%f18
	fmovrsgez	%o1,	%f5,	%f18
	tne	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe,a	%fcc3,	loop_2333
	fcmpne32	%f24,	%f0,	%i1
	alignaddr	%o4,	%l2,	%l6
	movl	%icc,	%o7,	%o2
loop_2333:
	fxnor	%f12,	%f18,	%f16
	edge32ln	%i0,	%l1,	%g1
	array32	%i2,	%g3,	%g6
	movvc	%xcc,	%l0,	%i4
	fbg	%fcc2,	loop_2334
	fmovsvc	%icc,	%f13,	%f28
	stx	%o6,	[%l7 + 0x08]
	move	%xcc,	%i5,	%o0
loop_2334:
	tleu	%xcc,	0x7
	fpadd32	%f0,	%f16,	%f8
	movleu	%icc,	%g5,	%o3
	fsrc2	%f8,	%f22
	membar	0x5F
	fbu	%fcc1,	loop_2335
	tne	%icc,	0x4
	fornot2s	%f31,	%f21,	%f18
	movle	%xcc,	%i3,	%i7
loop_2335:
	fmul8sux16	%f8,	%f0,	%f20
	fmovscs	%xcc,	%f31,	%f29
	fnot1s	%f11,	%f14
	sth	%l3,	[%l7 + 0x68]
	movg	%icc,	%l5,	%g7
	ldsw	[%l7 + 0x78],	%g2
	movgu	%xcc,	%i6,	%o5
	fnot1	%f6,	%f2
	sra	%l4,	%o1,	%i1
	movge	%icc,	%g4,	%o4
	fmovrdlez	%l6,	%f28,	%f16
	edge32l	%o7,	%o2,	%i0
	orn	%l2,	%l1,	%g1
	mova	%xcc,	%i2,	%g6
	movneg	%xcc,	%l0,	%i4
	ldx	[%l7 + 0x40],	%o6
	fmovsle	%icc,	%f9,	%f25
	fmovrse	%g3,	%f10,	%f31
	sra	%i5,	%o0,	%g5
	siam	0x0
	ldub	[%l7 + 0x10],	%o3
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fxors	%f7,	%f19,	%f8
	movgu	%xcc,	%i7,	%i3
	set	0x76, %o6
	stha	%l5,	[%l7 + %o6] 0x0c
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x19,	 0x3
	edge8ln	%g2,	%i6,	%g7
	edge32	%l4,	%o5,	%o1
	mova	%xcc,	%i1,	%o4
	bleu	%icc,	loop_2336
	fble,a	%fcc2,	loop_2337
	bleu,a,pt	%xcc,	loop_2338
	and	%g4,	0x0C32,	%o7
loop_2336:
	movle	%xcc,	%o2,	%l6
loop_2337:
	xnor	%i0,	%l1,	%g1
loop_2338:
	fabsd	%f6,	%f16
	fzeros	%f1
	tle	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x5
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	stw	%l2,	[%l7 + 0x34]
	brlez	%g6,	loop_2339
	fpsub16	%f8,	%f24,	%f26
	faligndata	%f6,	%f18,	%f14
	subc	%i2,	%l0,	%i4
loop_2339:
	move	%icc,	%g3,	%i5
	orncc	%o6,	%o0,	%o3
	xnor	%g5,	0x174E,	%i3
	and	%l5,	%l3,	%i7
	brlez	%i6,	loop_2340
	edge8	%g7,	%l4,	%g2
	fnot2	%f12,	%f14
	fcmpd	%fcc2,	%f0,	%f26
loop_2340:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x0C] %asi,	%f22
	ldx	[%l7 + 0x18],	%o5
	movvc	%xcc,	%i1,	%o4
	edge16n	%o1,	%o7,	%o2
	fmovdvs	%icc,	%f25,	%f2
	brz,a	%l6,	loop_2341
	movre	%g4,	0x1C0,	%i0
	fpadd16	%f0,	%f26,	%f20
	movrne	%g1,	0x017,	%l1
loop_2341:
	andn	%l2,	%i2,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i4,	%g3,	%l0
	nop
	setx loop_2342, %l0, %l1
	jmpl %l1, %o6
	fmul8x16au	%f0,	%f20,	%f18
	fpmerge	%f12,	%f13,	%f0
	fmovrdne	%o0,	%f0,	%f20
loop_2342:
	tleu	%icc,	0x4
	movcc	%xcc,	%i5,	%o3
	fmovdge	%xcc,	%f13,	%f20
	edge16	%g5,	%i3,	%l5
	fble	%fcc3,	loop_2343
	ba,a,pt	%icc,	loop_2344
	brnz	%l3,	loop_2345
	taddcc	%i6,	0x10B0,	%g7
loop_2343:
	movpos	%xcc,	%i7,	%l4
loop_2344:
	ta	%xcc,	0x5
loop_2345:
	tvc	%icc,	0x7
	set	0x28, %g2
	stda	%g2,	[%l7 + %g2] 0xe3
	membar	#Sync
	tneg	%icc,	0x0
	addc	%o5,	0x0A89,	%o4
	fmovrse	%o1,	%f19,	%f3
	edge8n	%o7,	%o2,	%l6
	tg	%xcc,	0x3
	orcc	%i1,	%i0,	%g4
	te	%icc,	0x5
	movcc	%xcc,	%l1,	%l2
	fmovdleu	%icc,	%f2,	%f31
	edge32ln	%i2,	%g6,	%g1
	tgu	%xcc,	0x6
	edge8ln	%i4,	%l0,	%g3
	fmovdgu	%xcc,	%f17,	%f7
	bvc,pn	%icc,	loop_2346
	brz	%o0,	loop_2347
	srl	%o6,	%i5,	%o3
	alignaddr	%g5,	%l5,	%l3
loop_2346:
	fbul	%fcc0,	loop_2348
loop_2347:
	tvc	%icc,	0x3
	brz,a	%i3,	loop_2349
	movg	%icc,	%g7,	%i6
loop_2348:
	movcc	%xcc,	%l4,	%i7
	edge16n	%o5,	%o4,	%o1
loop_2349:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%g2
	sra	%o2,	0x0E,	%o7
	sdivcc	%i1,	0x0D50,	%i0
	udiv	%g4,	0x1DFF,	%l1
	pdist	%f6,	%f0,	%f18
	movn	%xcc,	%l6,	%l2
	tl	%xcc,	0x3
	movleu	%xcc,	%g6,	%g1
	fmovsneg	%icc,	%f23,	%f1
	set	0x46, %o5
	lduha	[%l7 + %o5] 0x88,	%i4
	fbug	%fcc2,	loop_2350
	fnand	%f0,	%f10,	%f30
	tleu	%icc,	0x7
	nop
	setx	loop_2351,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2350:
	fmul8sux16	%f12,	%f26,	%f28
	set	0x2C, %i7
	ldswa	[%l7 + %i7] 0x19,	%i2
loop_2351:
	addcc	%g3,	%l0,	%o6
	udivx	%o0,	0x12D3,	%o3
	tne	%xcc,	0x7
	tg	%icc,	0x5
	fmovrsgz	%g5,	%f4,	%f22
	std	%i4,	[%l7 + 0x28]
	nop
	setx loop_2352, %l0, %l1
	jmpl %l1, %l5
	fmovsle	%xcc,	%f17,	%f29
	fmul8ulx16	%f26,	%f18,	%f0
	movl	%icc,	%l3,	%i3
loop_2352:
	fmovsg	%icc,	%f18,	%f18
	movrgez	%g7,	0x102,	%i6
	st	%f1,	[%l7 + 0x3C]
	taddcc	%l4,	0x0697,	%o5
	smul	%o4,	%i7,	%g2
	udivx	%o2,	0x1D83,	%o1
	edge8	%o7,	%i1,	%g4
	fmovdvc	%xcc,	%f30,	%f22
	fmovrdne	%i0,	%f16,	%f10
	fcmpne32	%f16,	%f12,	%l6
	fmovdn	%xcc,	%f29,	%f12
	te	%icc,	0x7
	tsubcctv	%l1,	%l2,	%g1
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x30] %asi,	%i4
	edge8ln	%g6,	%g3,	%l0
	fbne,a	%fcc3,	loop_2353
	umul	%o6,	%i2,	%o3
	fcmpd	%fcc1,	%f18,	%f0
	orncc	%g5,	%i5,	%l5
loop_2353:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l3,	%i3,	%o0
	te	%xcc,	0x7
	fpsub16	%f12,	%f28,	%f12
	fnot1	%f10,	%f16
	ta	%xcc,	0x0
	stx	%g7,	[%l7 + 0x70]
	tcs	%xcc,	0x7
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x1f,	%f0
	movg	%xcc,	%l4,	%o5
	fmovrsgz	%o4,	%f18,	%f23
	fpadd16	%f4,	%f18,	%f22
	smulcc	%i6,	%i7,	%g2
	umulcc	%o2,	0x1C8A,	%o1
	srl	%o7,	0x19,	%i1
	movrne	%g4,	%l6,	%i0
	move	%icc,	%l1,	%g1
	subccc	%i4,	0x0009,	%l2
	movrlz	%g3,	%g6,	%o6
	tle	%xcc,	0x1
	movrne	%l0,	%o3,	%g5
	sdiv	%i2,	0x169E,	%l5
	fmovdgu	%xcc,	%f5,	%f2
	addcc	%i5,	0x0928,	%i3
	tleu	%xcc,	0x1
	movg	%icc,	%o0,	%l3
	fmovs	%f28,	%f24
	and	%l4,	%g7,	%o5
	bgu	loop_2354
	sllx	%o4,	0x0B,	%i6
	movcc	%xcc,	%i7,	%g2
	andcc	%o2,	%o1,	%o7
loop_2354:
	lduh	[%l7 + 0x2E],	%g4
	fpsub16	%f10,	%f26,	%f28
	fmovdne	%xcc,	%f30,	%f2
	set	0x16, %g5
	ldsba	[%l7 + %g5] 0x19,	%l6
	lduw	[%l7 + 0x38],	%i0
	movne	%icc,	%i1,	%g1
	taddcctv	%l1,	0x1041,	%i4
	fmovde	%xcc,	%f28,	%f20
	fbue	%fcc1,	loop_2355
	ldsw	[%l7 + 0x5C],	%l2
	xnor	%g3,	%g6,	%l0
	taddcctv	%o3,	0x1328,	%g5
loop_2355:
	fmul8ulx16	%f28,	%f10,	%f22
	fmovse	%icc,	%f4,	%f6
	ba,a,pt	%icc,	loop_2356
	movrgz	%o6,	0x3FB,	%l5
	edge32ln	%i2,	%i3,	%i5
	set	0x38, %o4
	lda	[%l7 + %o4] 0x81,	%f6
loop_2356:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o0,	%l3,	%l4
	fors	%f26,	%f0,	%f7
	fmovde	%icc,	%f11,	%f5
	fmovrslz	%o5,	%f6,	%f7
	fmovdne	%icc,	%f18,	%f12
	edge8l	%o4,	%g7,	%i6
	mulscc	%g2,	0x0DBA,	%o2
	udiv	%i7,	0x1D3B,	%o7
	fmovsn	%xcc,	%f19,	%f3
	fpack32	%f16,	%f30,	%f6
	brnz,a	%g4,	loop_2357
	edge16ln	%l6,	%o1,	%i0
	movrgz	%g1,	%i1,	%l1
	add	%l2,	%i4,	%g6
loop_2357:
	xnorcc	%l0,	%o3,	%g5
	sub	%g3,	0x07B0,	%l5
	sra	%i2,	%o6,	%i5
	edge16ln	%i3,	%o0,	%l4
	and	%l3,	%o4,	%g7
	movpos	%icc,	%i6,	%o5
	umul	%g2,	0x0058,	%i7
	set	0x4C, %i3
	swapa	[%l7 + %i3] 0x88,	%o2
	fmovsn	%icc,	%f1,	%f23
	srax	%g4,	0x01,	%o7
	sra	%o1,	0x19,	%i0
	brgz,a	%l6,	loop_2358
	add	%g1,	0x1A7C,	%l1
	bleu	loop_2359
	sdivcc	%i1,	0x0669,	%i4
loop_2358:
	edge8ln	%g6,	%l2,	%l0
	lduh	[%l7 + 0x1A],	%g5
loop_2359:
	sdiv	%o3,	0x12DF,	%l5
	xor	%i2,	0x0CA9,	%o6
	taddcc	%g3,	0x1FDD,	%i3
	srl	%o0,	%l4,	%l3
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	srl	%o4,	0x1E,	%i5
	tg	%icc,	0x3
	tsubcc	%g7,	%i6,	%g2
	tn	%xcc,	0x2
	fble,a	%fcc2,	loop_2360
	tneg	%xcc,	0x7
	fzero	%f16
	tg	%xcc,	0x6
loop_2360:
	te	%icc,	0x3
	stb	%i7,	[%l7 + 0x30]
	sdivx	%o5,	0x0665,	%o2
	stw	%o7,	[%l7 + 0x78]
	bn,a	loop_2361
	fbo,a	%fcc0,	loop_2362
	movge	%icc,	%o1,	%i0
	taddcc	%l6,	%g1,	%g4
loop_2361:
	umul	%i1,	0x01D1,	%l1
loop_2362:
	movrgez	%g6,	%l2,	%l0
	edge32n	%g5,	%o3,	%l5
	addc	%i4,	0x0387,	%i2
	umul	%o6,	%i3,	%o0
	xorcc	%l4,	%g3,	%o4
	array16	%l3,	%i5,	%i6
	bcs,a	%icc,	loop_2363
	ldsb	[%l7 + 0x25],	%g7
	edge16l	%g2,	%i7,	%o5
	membar	0x77
loop_2363:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x28] %asi,	%o7
	orncc	%o2,	%i0,	%o1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	set	0x58, %i0
	sta	%f27,	[%l7 + %i0] 0x11
	tcs	%icc,	0x0
	fsrc2s	%f6,	%f23
	bg,a,pt	%xcc,	loop_2364
	edge8n	%l6,	%g4,	%l1
	movrne	%i1,	%g6,	%l2
	tge	%icc,	0x3
loop_2364:
	tvs	%icc,	0x6
	edge8l	%l0,	%o3,	%l5
	st	%f3,	[%l7 + 0x34]
	tvc	%icc,	0x2
	tl	%xcc,	0x7
	tge	%xcc,	0x4
	tpos	%icc,	0x2
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x34] %asi,	%i4
	fcmple16	%f14,	%f12,	%g5
	addcc	%i2,	0x01AF,	%o6
	orncc	%o0,	%l4,	%g3
	tn	%xcc,	0x0
	fmovrslz	%o4,	%f6,	%f11
	std	%f26,	[%l7 + 0x50]
	fmovscc	%xcc,	%f14,	%f22
	fand	%f10,	%f8,	%f2
	sdivcc	%l3,	0x03B8,	%i5
	edge32n	%i6,	%g7,	%g2
	brnz,a	%i3,	loop_2365
	fmovsne	%icc,	%f5,	%f8
	movrgz	%i7,	%o5,	%o7
	ldsb	[%l7 + 0x1F],	%o2
loop_2365:
	fabss	%f29,	%f18
	fpsub32s	%f27,	%f21,	%f8
	bcs,pn	%xcc,	loop_2366
	fbn,a	%fcc3,	loop_2367
	ldd	[%l7 + 0x10],	%f30
	bcs,a,pn	%xcc,	loop_2368
loop_2366:
	move	%icc,	%i0,	%g1
loop_2367:
	sub	%l6,	0x1C91,	%g4
	tleu	%xcc,	0x6
loop_2368:
	popc	0x005D,	%l1
	fxors	%f18,	%f25,	%f0
	fmuld8ulx16	%f24,	%f7,	%f6
	srl	%i1,	%o1,	%l2
	array16	%g6,	%l0,	%l5
	fbug,a	%fcc2,	loop_2369
	ba	loop_2370
	fbu,a	%fcc0,	loop_2371
	sub	%o3,	0x081D,	%g5
loop_2369:
	tneg	%xcc,	0x2
loop_2370:
	fmovsg	%xcc,	%f27,	%f22
loop_2371:
	taddcc	%i2,	0x0B9F,	%o6
	fcmpne32	%f4,	%f10,	%i4
	mulx	%o0,	0x116A,	%g3
	movl	%xcc,	%l4,	%o4
	bneg,pn	%xcc,	loop_2372
	movvc	%xcc,	%l3,	%i6
	tcs	%xcc,	0x0
	addccc	%g7,	0x19DD,	%g2
loop_2372:
	sir	0x08EC
	ldx	[%l7 + 0x70],	%i5
	movcc	%icc,	%i3,	%o5
	movleu	%xcc,	%i7,	%o2
	edge8	%i0,	%o7,	%l6
	tpos	%icc,	0x7
	fmovdcs	%icc,	%f7,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g4,	0x04E4,	%g1
	tgu	%icc,	0x4
	fbe,a	%fcc0,	loop_2373
	edge16ln	%l1,	%i1,	%o1
	brgez	%g6,	loop_2374
	sdiv	%l0,	0x0D3C,	%l2
loop_2373:
	membar	0x42
	fabsd	%f16,	%f2
loop_2374:
	tge	%icc,	0x0
	movg	%icc,	%l5,	%g5
	movleu	%icc,	%i2,	%o6
	tpos	%xcc,	0x2
	subc	%o3,	%o0,	%g3
	fmovse	%icc,	%f4,	%f14
	swap	[%l7 + 0x3C],	%i4
	mulscc	%l4,	0x01D1,	%l3
	tpos	%icc,	0x3
	fcmpgt32	%f12,	%f20,	%o4
	edge8	%g7,	%i6,	%i5
	wr	%g0,	0x18,	%asi
	stxa	%i3,	[%l7 + 0x38] %asi
	set	0x56, %l0
	lduha	[%l7 + %l0] 0x88,	%o5
	ldsw	[%l7 + 0x28],	%i7
	edge32	%o2,	%i0,	%g2
	fandnot2s	%f26,	%f12,	%f24
	edge8ln	%l6,	%g4,	%o7
	movgu	%xcc,	%l1,	%i1
	tcs	%icc,	0x3
	andncc	%g1,	%g6,	%o1
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x10
	bne,a,pt	%icc,	loop_2375
	fbuge,a	%fcc1,	loop_2376
	fba	%fcc1,	loop_2377
	stw	%l0,	[%l7 + 0x58]
loop_2375:
	smulcc	%l5,	%l2,	%i2
loop_2376:
	fbue,a	%fcc2,	loop_2378
loop_2377:
	movle	%xcc,	%g5,	%o3
	fcmpgt16	%f28,	%f0,	%o0
	movne	%xcc,	%g3,	%i4
loop_2378:
	tne	%xcc,	0x1
	srax	%o6,	%l3,	%l4
	fpackfix	%f12,	%f1
	sra	%g7,	%o4,	%i6
	fpsub32	%f4,	%f26,	%f10
	fmovrse	%i5,	%f30,	%f27
	swap	[%l7 + 0x34],	%o5
	sllx	%i3,	0x0B,	%i7
	fxors	%f22,	%f21,	%f4
	call	loop_2379
	orn	%o2,	%g2,	%l6
	fmovrse	%g4,	%f31,	%f26
	srl	%i0,	%l1,	%o7
loop_2379:
	movge	%icc,	%i1,	%g6
	bpos	loop_2380
	edge8l	%g1,	%l0,	%o1
	popc	%l5,	%l2
	movgu	%icc,	%g5,	%o3
loop_2380:
	fpsub16	%f0,	%f12,	%f14
	fmul8x16	%f18,	%f28,	%f8
	fnand	%f28,	%f16,	%f28
	fble	%fcc1,	loop_2381
	fbne	%fcc1,	loop_2382
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i2,	%o0,	%i4
loop_2381:
	ldstub	[%l7 + 0x08],	%o6
loop_2382:
	te	%xcc,	0x0
	xnorcc	%l3,	0x0EA5,	%g3
	fcmpgt16	%f14,	%f0,	%g7
	edge16ln	%o4,	%l4,	%i6
	sllx	%i5,	0x08,	%i3
	wr	%g0,	0x80,	%asi
	stda	%o4,	[%l7 + 0x68] %asi
	edge16ln	%i7,	%g2,	%l6
	nop
	setx	loop_2383,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bshuffle	%f6,	%f8,	%f6
	array32	%g4,	%i0,	%o2
	subcc	%l1,	%o7,	%i1
loop_2383:
	fmovdpos	%icc,	%f27,	%f26
	sll	%g1,	0x05,	%l0
	fnot1	%f18,	%f20
	fbug	%fcc0,	loop_2384
	edge8n	%g6,	%o1,	%l2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g5
loop_2384:
	sllx	%o3,	0x0E,	%l5
	tgu	%xcc,	0x6
	srax	%o0,	%i4,	%o6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x14] %asi,	%i2
	xorcc	%g3,	%l3,	%o4
	orcc	%g7,	0x1B34,	%i6
	fsrc1	%f16,	%f30
	xnor	%l4,	0x1A49,	%i3
	fpsub32	%f30,	%f12,	%f12
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%i5
	add	%g2,	0x1A0C,	%l6
	movrne	%i7,	%i0,	%o2
	fbg	%fcc1,	loop_2385
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l1,	%g4,	%i1
	fmovsa	%icc,	%f28,	%f17
loop_2385:
	andn	%g1,	%l0,	%g6
	movrgz	%o7,	%l2,	%o1
	fmovdpos	%xcc,	%f0,	%f8
	movge	%xcc,	%g5,	%o3
	fcmpeq32	%f14,	%f14,	%l5
	smul	%o0,	0x0966,	%o6
	xnor	%i4,	%i2,	%l3
	fbg	%fcc2,	loop_2386
	edge16ln	%o4,	%g3,	%g7
	movl	%xcc,	%i6,	%i3
	fbo,a	%fcc2,	loop_2387
loop_2386:
	fsrc1s	%f22,	%f30
	movcc	%xcc,	%o5,	%l4
	tleu	%icc,	0x5
loop_2387:
	fble,a	%fcc2,	loop_2388
	umul	%g2,	0x1A22,	%l6
	bcs,a	%xcc,	loop_2389
	movrgez	%i5,	%i0,	%o2
loop_2388:
	bgu	%icc,	loop_2390
	fbl	%fcc3,	loop_2391
loop_2389:
	sdivx	%l1,	0x1966,	%g4
	tne	%xcc,	0x2
loop_2390:
	fnor	%f6,	%f8,	%f22
loop_2391:
	edge8n	%i1,	%g1,	%i7
	movne	%icc,	%g6,	%o7
	srax	%l0,	%l2,	%o1
	tg	%xcc,	0x2
	movrne	%o3,	%l5,	%o0
	taddcctv	%g5,	0x0CF0,	%i4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o6,	%l3
	movrgez	%i2,	0x39B,	%g3
	tl	%xcc,	0x4
	edge8ln	%g7,	%i6,	%o4
	movcc	%xcc,	%o5,	%i3
	be	%icc,	loop_2392
	xorcc	%l4,	0x1454,	%l6
	fmovdpos	%xcc,	%f4,	%f15
	fcmpeq16	%f30,	%f30,	%g2
loop_2392:
	tleu	%xcc,	0x1
	wr	%g0,	0x2a,	%asi
	stwa	%i0,	[%l7 + 0x44] %asi
	membar	#Sync
	tne	%xcc,	0x2
	movpos	%xcc,	%o2,	%i5
	srl	%g4,	0x19,	%i1
	edge16ln	%g1,	%l1,	%g6
	udivcc	%i7,	0x0BE6,	%l0
	fexpand	%f19,	%f12
	ldd	[%l7 + 0x68],	%o6
	tl	%icc,	0x7
	fxnor	%f4,	%f26,	%f16
	array32	%o1,	%l2,	%o3
	tvc	%icc,	0x2
	ldsh	[%l7 + 0x22],	%o0
	fornot2s	%f9,	%f14,	%f21
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%l5
	alignaddr	%g5,	%o6,	%l3
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x44] %asi,	%i2
	tle	%xcc,	0x5
	fmovsl	%icc,	%f18,	%f9
	edge16ln	%g3,	%i4,	%g7
	bvc,a,pn	%xcc,	loop_2393
	brgz	%i6,	loop_2394
	movge	%xcc,	%o5,	%o4
	flush	%l7 + 0x6C
loop_2393:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2394:
	tg	%icc,	0x5
	faligndata	%f12,	%f30,	%f28
	lduw	[%l7 + 0x10],	%l4
	addc	%i3,	%g2,	%i0
	movre	%o2,	%l6,	%g4
	fsrc2s	%f0,	%f14
	fmovrdlz	%i5,	%f30,	%f8
	stbar
	fmovrdgz	%g1,	%f28,	%f12
	for	%f6,	%f0,	%f20
	addc	%i1,	0x0B17,	%g6
	edge32l	%i7,	%l0,	%l1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x0C] %asi,	%f5
	set	0x62, %i2
	ldsha	[%l7 + %i2] 0x04,	%o7
	fnors	%f27,	%f13,	%f13
	membar	0x6C
	or	%l2,	0x0763,	%o3
	fmul8x16al	%f10,	%f14,	%f12
	fbne,a	%fcc3,	loop_2395
	fmovscc	%xcc,	%f4,	%f31
	addcc	%o1,	%l5,	%o0
	tle	%icc,	0x4
loop_2395:
	ta	%icc,	0x6
	srl	%g5,	%l3,	%i2
	std	%f28,	[%l7 + 0x08]
	fmovrdne	%g3,	%f26,	%f10
	andncc	%i4,	%g7,	%i6
	xor	%o6,	%o5,	%l4
	edge32n	%o4,	%i3,	%g2
	orcc	%i0,	0x0806,	%o2
	tgu	%xcc,	0x5
	ld	[%l7 + 0x5C],	%f2
	popc	0x0876,	%l6
	sllx	%g4,	%i5,	%g1
	tsubcctv	%g6,	0x06ED,	%i1
	bge,a,pn	%icc,	loop_2396
	fbule	%fcc2,	loop_2397
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
	movrgez	%i7,	%l1,	%o7
loop_2396:
	movne	%xcc,	%l2,	%o3
loop_2397:
	brlz,a	%l0,	loop_2399
loop_2398:
	mulscc	%o1,	0x0818,	%o0
	fbug	%fcc1,	loop_2400
	movn	%xcc,	%l5,	%g5
loop_2399:
	tneg	%xcc,	0x5
	tvs	%xcc,	0x4
loop_2400:
	sethi	0x065D,	%l3
	movle	%icc,	%g3,	%i2
	brz,a	%i4,	loop_2401
	edge16	%i6,	%o6,	%o5
	movre	%g7,	0x2E7,	%l4
	tl	%xcc,	0x5
loop_2401:
	tcc	%icc,	0x0
	edge16n	%i3,	%g2,	%i0
	tcc	%icc,	0x3
	srlx	%o4,	0x18,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l6,	%g4
	edge8n	%i5,	%g1,	%g6
	edge32ln	%i7,	%l1,	%o7
	fmovrde	%i1,	%f2,	%f18
	andcc	%o3,	%l0,	%l2
	fxnors	%f13,	%f28,	%f24
	movrgez	%o0,	%l5,	%g5
	sdivcc	%l3,	0x19C1,	%g3
	for	%f8,	%f14,	%f6
	tsubcctv	%i2,	0x09C5,	%i4
	tgu	%xcc,	0x7
	tpos	%icc,	0x3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i6
	fmul8x16	%f24,	%f8,	%f2
	fmovsle	%xcc,	%f3,	%f2
	bvc,a,pt	%xcc,	loop_2402
	ta	%icc,	0x4
	movrlz	%o6,	0x0CB,	%o5
	or	%g7,	%o1,	%l4
loop_2402:
	edge32l	%g2,	%i0,	%i3
	fbne,a	%fcc3,	loop_2403
	taddcctv	%o2,	0x0102,	%o4
	fcmpeq32	%f26,	%f28,	%l6
	set	0x50, %o7
	lda	[%l7 + %o7] 0x19,	%f11
loop_2403:
	nop
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f16
	fbu	%fcc0,	loop_2404
	tne	%icc,	0x1
	fxnor	%f16,	%f14,	%f24
	movrne	%i5,	0x189,	%g4
loop_2404:
	add	%g6,	%g1,	%l1
	xnor	%i7,	%o7,	%i1
	movneg	%icc,	%o3,	%l0
	udivx	%o0,	0x102D,	%l5
	fble	%fcc3,	loop_2405
	movrlz	%g5,	%l2,	%g3
	fxors	%f12,	%f6,	%f16
	srax	%l3,	0x0D,	%i2
loop_2405:
	fmovrse	%i6,	%f16,	%f17
	popc	%o6,	%o5
	ldd	[%l7 + 0x30],	%i4
	sll	%g7,	0x16,	%l4
	fmovsle	%xcc,	%f0,	%f20
	nop
	set	0x70, %g4
	lduh	[%l7 + %g4],	%o1
	fone	%f28
	srax	%i0,	0x15,	%g2
	srax	%i3,	0x0A,	%o4
	bgu	loop_2406
	nop
	setx	loop_2407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%xcc,	0x2
	movleu	%icc,	%o2,	%i5
loop_2406:
	stb	%l6,	[%l7 + 0x5F]
loop_2407:
	tsubcctv	%g4,	%g6,	%g1
	udivx	%l1,	0x16C6,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x40],	%o7
	andn	%o3,	0x0735,	%l0
	bcc,a	%icc,	loop_2408
	brgz,a	%i1,	loop_2409
	fmovs	%f0,	%f10
	udivx	%l5,	0x0E64,	%g5
loop_2408:
	brlz	%l2,	loop_2410
loop_2409:
	alignaddr	%o0,	%l3,	%i2
	subc	%g3,	0x17EA,	%o6
	sra	%o5,	0x14,	%i4
loop_2410:
	sub	%i6,	%g7,	%l4
	tn	%xcc,	0x6
	udiv	%i0,	0x0BC6,	%g2
	sllx	%o1,	0x11,	%i3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x50] %asi,	%o2
	fnot1s	%f9,	%f12
	alignaddr	%o4,	%i5,	%l6
	fzeros	%f25
	call	loop_2411
	sllx	%g4,	0x18,	%g1
	lduh	[%l7 + 0x5C],	%l1
	array8	%i7,	%g6,	%o7
loop_2411:
	brgz	%l0,	loop_2412
	fmovsg	%icc,	%f7,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i1,	0x15B8,	%o3
loop_2412:
	st	%f29,	[%l7 + 0x44]
	fcmple32	%f22,	%f26,	%g5
	xnor	%l2,	0x1CF5,	%o0
	fones	%f23
	umul	%l5,	0x0379,	%i2
	sll	%l3,	0x15,	%o6
	orn	%o5,	0x00C2,	%i4
	fmovsne	%icc,	%f29,	%f30
	prefetch	[%l7 + 0x24],	 0x0
	sll	%i6,	0x13,	%g7
	tsubcc	%g3,	%l4,	%i0
	fands	%f9,	%f17,	%f20
	fmovrslz	%g2,	%f9,	%f8
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x18,	%o0
	stx	%o2,	[%l7 + 0x48]
	ta	%icc,	0x6
	movle	%xcc,	%i3,	%o4
	movvc	%icc,	%i5,	%g4
	fpadd32s	%f11,	%f10,	%f12
	sir	0x1263
	orcc	%l6,	0x09B9,	%l1
	udiv	%i7,	0x1DCF,	%g6
	fmovdpos	%icc,	%f12,	%f26
	fmovsle	%icc,	%f5,	%f5
	movrgz	%g1,	%o7,	%i1
	popc	0x1968,	%l0
	movrne	%o3,	0x3EA,	%g5
	bvc,a,pn	%icc,	loop_2413
	sdiv	%l2,	0x180D,	%l5
	fpsub32	%f20,	%f22,	%f30
	fmovsn	%icc,	%f28,	%f13
loop_2413:
	fmovse	%icc,	%f12,	%f31
	movneg	%xcc,	%o0,	%l3
	edge8ln	%i2,	%o6,	%i4
	brgez,a	%i6,	loop_2414
	edge16	%o5,	%g7,	%g3
	fcmped	%fcc2,	%f4,	%f10
	smulcc	%i0,	%l4,	%o1
loop_2414:
	array32	%o2,	%i3,	%o4
	edge16	%i5,	%g2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l1,	%l6,	%g6
	fmovspos	%icc,	%f30,	%f30
	movleu	%xcc,	%g1,	%i7
	subcc	%i1,	0x094A,	%o7
	movl	%icc,	%l0,	%o3
	ldd	[%l7 + 0x38],	%g4
	brgez,a	%l5,	loop_2415
	fmul8x16al	%f0,	%f20,	%f16
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o0,	%l2
loop_2415:
	movleu	%xcc,	%l3,	%o6
	sll	%i2,	0x03,	%i6
	fmovrdgez	%i4,	%f22,	%f18
	bvc	%icc,	loop_2416
	fones	%f24
	movn	%xcc,	%o5,	%g3
	nop
	setx	loop_2417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2416:
	edge16ln	%g7,	%i0,	%o1
	fornot1	%f6,	%f0,	%f30
	sra	%o2,	0x08,	%l4
loop_2417:
	movvc	%icc,	%o4,	%i5
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movrgz	%g2,	%i3,	%l1
	or	%l6,	0x0394,	%g4
	movrgez	%g6,	%g1,	%i7
	movn	%xcc,	%o7,	%l0
	edge16ln	%i1,	%o3,	%g5
	edge8n	%l5,	%l2,	%o0
	movrlz	%l3,	%i2,	%i6
	fnot2	%f12,	%f4
	movcs	%xcc,	%i4,	%o5
	subccc	%o6,	%g7,	%i0
	srlx	%o1,	0x1C,	%g3
	set	0x30, %o0
	ldswa	[%l7 + %o0] 0x15,	%o2
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%l4
	array32	%o4,	%g2,	%i3
	bvs,a,pt	%xcc,	loop_2418
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%l1,	%i5,	%g4
	add	%g6,	%l6,	%g1
loop_2418:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o7,	%l0
	fcmpeq32	%f14,	%f6,	%i7
	move	%icc,	%o3,	%g5
	fmuld8sux16	%f0,	%f16,	%f22
	fcmped	%fcc1,	%f8,	%f16
	sir	0x1239
	fxor	%f20,	%f18,	%f14
	xnor	%i1,	%l5,	%l2
	set	0x4A, %l4
	ldsba	[%l7 + %l4] 0x11,	%o0
	edge32ln	%l3,	%i6,	%i4
	movn	%xcc,	%i2,	%o5
	fcmpne16	%f14,	%f30,	%g7
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%o6
	movvc	%xcc,	%o1,	%g3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x30] %asi,	%f22
	fxnors	%f11,	%f12,	%f6
	fand	%f6,	%f8,	%f16
	tsubcctv	%i0,	0x14E2,	%l4
	bvc,a,pt	%icc,	loop_2419
	srl	%o4,	0x19,	%g2
	tg	%icc,	0x3
	membar	0x0F
loop_2419:
	nop
	set	0x7A, %l2
	stha	%i3,	[%l7 + %l2] 0x23
	membar	#Sync
	set	0x40, %l3
	swapa	[%l7 + %l3] 0x04,	%l1
	fornot1	%f6,	%f14,	%f14
	fxnor	%f10,	%f24,	%f4
	brnz,a	%o2,	loop_2420
	fpsub32	%f22,	%f12,	%f30
	fmovsgu	%xcc,	%f15,	%f1
	subcc	%g4,	0x0719,	%g6
loop_2420:
	movle	%xcc,	%l6,	%g1
	tneg	%icc,	0x3
	bcs,pn	%icc,	loop_2421
	movrgz	%o7,	%l0,	%i7
	sdivx	%o3,	0x0B85,	%i5
	ba,pn	%xcc,	loop_2422
loop_2421:
	tneg	%icc,	0x0
	sll	%g5,	0x1A,	%l5
	sra	%i1,	0x0C,	%o0
loop_2422:
	fcmpes	%fcc1,	%f12,	%f0
	tgu	%icc,	0x0
	fbg	%fcc2,	loop_2423
	fnot1	%f24,	%f30
	membar	0x3A
	movre	%l3,	0x0D5,	%i6
loop_2423:
	edge8ln	%i4,	%i2,	%l2
	set	0x68, %g1
	lduba	[%l7 + %g1] 0x88,	%g7
	xnorcc	%o6,	0x0809,	%o5
	tcc	%xcc,	0x2
	tcc	%icc,	0x3
	tsubcc	%o1,	0x14FC,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g3,	%o4,	%l4
	andn	%g2,	%i3,	%l1
	membar	0x22
	lduh	[%l7 + 0x14],	%o2
	movcc	%xcc,	%g4,	%g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l6,	%o7
	tvs	%xcc,	0x0
	fbg,a	%fcc2,	loop_2424
	tleu	%xcc,	0x2
	set	0x48, %g3
	stxa	%l0,	[%l7 + %g3] 0x2b
	membar	#Sync
loop_2424:
	faligndata	%f20,	%f28,	%f30
	fcmpeq32	%f8,	%f0,	%i7
	fxor	%f16,	%f2,	%f16
	stx	%g1,	[%l7 + 0x58]
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x20] %asi,	%o3
	movpos	%xcc,	%i5,	%g5
	fbul,a	%fcc1,	loop_2425
	move	%xcc,	%i1,	%l5
	brz	%o0,	loop_2426
	edge32l	%l3,	%i6,	%i4
loop_2425:
	movvs	%xcc,	%i2,	%l2
	fble,a	%fcc0,	loop_2427
loop_2426:
	tg	%xcc,	0x6
	add	%g7,	0x1E07,	%o6
	sethi	0x1D3A,	%o1
loop_2427:
	stx	%i0,	[%l7 + 0x28]
	taddcc	%o5,	%g3,	%l4
	fbg	%fcc2,	loop_2428
	movrlz	%g2,	0x253,	%i3
	srax	%l1,	0x0C,	%o4
	fcmps	%fcc3,	%f5,	%f10
loop_2428:
	tge	%icc,	0x2
	popc	%o2,	%g4
	edge8ln	%g6,	%o7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%i7
	umulcc	%o3,	0x0E99,	%i5
	tcs	%icc,	0x3
	edge32ln	%g1,	%i1,	%g5
	addccc	%o0,	0x0B7F,	%l3
	umulcc	%l5,	0x14F4,	%i4
	tvc	%icc,	0x3
	edge16n	%i2,	%i6,	%l2
	movvs	%icc,	%g7,	%o6
	fmovrse	%i0,	%f19,	%f15
	edge16	%o5,	%o1,	%l4
	membar	0x74
	fmovscc	%xcc,	%f6,	%f14
	addcc	%g3,	0x0820,	%i3
	edge32l	%g2,	%o4,	%o2
	tneg	%icc,	0x4
	bcs,pn	%icc,	loop_2429
	fmovscs	%xcc,	%f24,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l1,	%g4,	%o7
loop_2429:
	move	%xcc,	%l6,	%g6
	sllx	%l0,	%o3,	%i5
	sethi	0x0337,	%g1
	fbu	%fcc3,	loop_2430
	bleu,pt	%xcc,	loop_2431
	fmovsvc	%xcc,	%f13,	%f7
	edge8l	%i7,	%g5,	%i1
loop_2430:
	sdiv	%l3,	0x1C6F,	%l5
loop_2431:
	sdivx	%o0,	0x14E7,	%i2
	fmovrslez	%i4,	%f21,	%f26
	bvs	%icc,	loop_2432
	movne	%xcc,	%i6,	%g7
	ldsw	[%l7 + 0x74],	%o6
	smulcc	%i0,	0x1E29,	%l2
loop_2432:
	fbn	%fcc1,	loop_2433
	ta	%xcc,	0x2
	movcs	%xcc,	%o1,	%o5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g3
loop_2433:
	fmul8x16au	%f8,	%f18,	%f10
	tsubcctv	%l4,	%g2,	%o4
	tn	%xcc,	0x7
	wr	%g0,	0x2a,	%asi
	stba	%o2,	[%l7 + 0x47] %asi
	membar	#Sync
	stbar
	movcs	%icc,	%i3,	%l1
	orn	%o7,	%g4,	%g6
	fmovdpos	%xcc,	%f5,	%f5
	andcc	%l0,	0x04C1,	%o3
	stbar
	addc	%i5,	%l6,	%g1
	te	%icc,	0x3
	orncc	%i7,	0x1322,	%i1
	movvs	%xcc,	%g5,	%l5
	stx	%l3,	[%l7 + 0x30]
	fbl,a	%fcc1,	loop_2434
	movgu	%xcc,	%o0,	%i2
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x15
loop_2434:
	sll	%i4,	%g7,	%o6
	movgu	%xcc,	%i6,	%i0
	fsrc2s	%f29,	%f3
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o1
	brlz,a	%l2,	loop_2435
	mova	%icc,	%g3,	%o5
	addc	%l4,	0x0EEE,	%o4
	fbug	%fcc2,	loop_2436
loop_2435:
	sdivcc	%g2,	0x08E0,	%o2
	fcmps	%fcc0,	%f19,	%f20
	movrgez	%l1,	0x155,	%i3
loop_2436:
	tgu	%xcc,	0x5
	umul	%o7,	0x19B7,	%g6
	edge8	%g4,	%o3,	%i5
	array16	%l6,	%l0,	%g1
	and	%i7,	%i1,	%g5
	movrlez	%l5,	%o0,	%l3
	bpos,a,pn	%icc,	loop_2437
	movrne	%i2,	0x3EB,	%i4
	brlz,a	%g7,	loop_2438
	movle	%icc,	%o6,	%i0
loop_2437:
	fone	%f8
	sdivcc	%o1,	0x04F5,	%i6
loop_2438:
	and	%l2,	0x0D18,	%o5
	fpadd16s	%f6,	%f30,	%f31
	subc	%g3,	%l4,	%o4
	tsubcctv	%g2,	0x0AB6,	%l1
	tvs	%icc,	0x3
	ldub	[%l7 + 0x71],	%i3
	brz	%o7,	loop_2439
	tvs	%icc,	0x0
	fcmpeq32	%f14,	%f22,	%o2
	fcmple32	%f30,	%f0,	%g4
loop_2439:
	orn	%o3,	0x1A2B,	%i5
	tge	%icc,	0x0
	fbo,a	%fcc2,	loop_2440
	fbe,a	%fcc3,	loop_2441
	umul	%l6,	0x0773,	%l0
	movneg	%xcc,	%g6,	%g1
loop_2440:
	alignaddrl	%i7,	%g5,	%l5
loop_2441:
	nop
	set	0x42, %g7
	ldsha	[%l7 + %g7] 0x19,	%i1
	taddcc	%l3,	%o0,	%i4
	movvs	%icc,	%i2,	%o6
	movcc	%xcc,	%g7,	%o1
	smul	%i6,	0x0BB6,	%l2
	movgu	%xcc,	%i0,	%g3
	fpmerge	%f17,	%f26,	%f28
	fcmpeq16	%f20,	%f10,	%o5
	alignaddrl	%o4,	%g2,	%l1
	movge	%xcc,	%i3,	%l4
	fmul8x16al	%f15,	%f27,	%f14
	bg,a,pt	%xcc,	loop_2442
	movl	%icc,	%o7,	%o2
	tcs	%xcc,	0x3
	mulscc	%o3,	0x0D27,	%i5
loop_2442:
	nop
	setx loop_2443, %l0, %l1
	jmpl %l1, %l6
	fmovsge	%xcc,	%f5,	%f31
	movrgz	%l0,	0x0D8,	%g6
	flush	%l7 + 0x24
loop_2443:
	movneg	%xcc,	%g4,	%g1
	add	%i7,	0x0D33,	%l5
	fmovsgu	%xcc,	%f26,	%f31
	movneg	%xcc,	%g5,	%l3
	fbu,a	%fcc1,	loop_2444
	fpack32	%f18,	%f26,	%f4
	sdiv	%o0,	0x1295,	%i4
	tvc	%icc,	0x3
loop_2444:
	fmovscs	%xcc,	%f26,	%f22
	ldsb	[%l7 + 0x26],	%i1
	movrgz	%i2,	0x361,	%g7
	movrlez	%o1,	%i6,	%l2
	fsrc2	%f2,	%f28
	pdist	%f8,	%f20,	%f4
	move	%xcc,	%i0,	%g3
	fsrc2s	%f18,	%f29
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	movrgez	%o4,	0x2D7,	%g2
	orncc	%o5,	%l1,	%l4
	movvs	%xcc,	%i3,	%o2
	orn	%o7,	%i5,	%o3
	sdiv	%l6,	0x1717,	%g6
	tg	%icc,	0x6
	sra	%l0,	0x16,	%g4
	sdivcc	%g1,	0x05D3,	%i7
	movpos	%xcc,	%g5,	%l5
	tle	%icc,	0x7
	bge,a	loop_2445
	popc	0x132F,	%o0
	mulscc	%i4,	%i1,	%i2
	fmovdle	%icc,	%f29,	%f24
loop_2445:
	nop
	setx	loop_2446,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%g7,	0x15C6,	%o1
	fmovd	%f8,	%f22
	edge16n	%i6,	%l3,	%l2
loop_2446:
	ta	%icc,	0x2
	ldd	[%l7 + 0x60],	%f26
	fmovrsgz	%i0,	%f29,	%f29
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpack32	%f4,	%f26,	%f28
	edge8n	%g3,	%o6,	%o4
	edge8	%o5,	%g2,	%l4
	fbul,a	%fcc1,	loop_2447
	or	%i3,	0x1CA0,	%l1
	movg	%xcc,	%o2,	%i5
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x49] %asi,	%o3
loop_2447:
	movrlz	%o7,	%g6,	%l0
	fxors	%f25,	%f21,	%f24
	ldub	[%l7 + 0x3F],	%l6
	siam	0x4
	fands	%f6,	%f30,	%f26
	fmovscc	%icc,	%f1,	%f16
	array32	%g4,	%i7,	%g1
	fnot1s	%f15,	%f25
	be,a	%icc,	loop_2448
	fnors	%f2,	%f30,	%f14
	array32	%g5,	%o0,	%i4
	subccc	%i1,	%i2,	%g7
loop_2448:
	fmovrde	%o1,	%f10,	%f12
	lduw	[%l7 + 0x60],	%l5
	xnor	%i6,	%l3,	%l2
	fsrc1s	%f6,	%f29
	movneg	%icc,	%g3,	%i0
	movneg	%xcc,	%o4,	%o5
	fcmpes	%fcc0,	%f11,	%f3
	tcc	%icc,	0x2
	te	%icc,	0x5
	fpsub16s	%f0,	%f18,	%f1
	fcmped	%fcc1,	%f30,	%f20
	movrlez	%g2,	0x22D,	%l4
	tpos	%xcc,	0x0
	tne	%xcc,	0x7
	fbul,a	%fcc3,	loop_2449
	fandnot2	%f4,	%f30,	%f4
	andn	%o6,	%i3,	%o2
	andcc	%l1,	%o3,	%o7
loop_2449:
	fpsub16s	%f17,	%f5,	%f22
	orcc	%i5,	%l0,	%l6
	fmul8x16al	%f25,	%f20,	%f14
	fcmped	%fcc3,	%f12,	%f24
	fbl,a	%fcc3,	loop_2450
	orn	%g6,	0x131A,	%g4
	fzeros	%f5
	sdiv	%i7,	0x0752,	%g5
loop_2450:
	sll	%o0,	0x16,	%i4
	edge16l	%i1,	%g1,	%g7
	fmovrslez	%o1,	%f15,	%f23
	wr	%g0,	0xeb,	%asi
	stda	%l4,	[%l7 + 0x38] %asi
	membar	#Sync
	movvs	%icc,	%i2,	%i6
	sdivcc	%l2,	0x048F,	%l3
	lduh	[%l7 + 0x3A],	%i0
	bge,a	%icc,	loop_2451
	ta	%xcc,	0x2
	fandnot2s	%f25,	%f20,	%f10
	fbl	%fcc3,	loop_2452
loop_2451:
	fmovdvc	%icc,	%f16,	%f0
	swap	[%l7 + 0x54],	%g3
	array32	%o4,	%g2,	%l4
loop_2452:
	edge16n	%o6,	%o5,	%o2
	orncc	%l1,	0x102B,	%i3
	std	%f12,	[%l7 + 0x48]
	fmul8x16	%f24,	%f22,	%f16
	tcc	%icc,	0x3
	edge8n	%o3,	%o7,	%i5
	edge32	%l6,	%g6,	%g4
	fblg	%fcc3,	loop_2453
	umul	%l0,	%i7,	%o0
	udiv	%g5,	0x0B07,	%i1
	movrlz	%g1,	0x25A,	%i4
loop_2453:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f3,	%f29
	set	0x3C, %o2
	stwa	%o1,	[%l7 + %o2] 0xe2
	membar	#Sync
	fbue,a	%fcc1,	loop_2454
	movcc	%xcc,	%l5,	%g7
	tcs	%icc,	0x6
	brgez	%i2,	loop_2455
loop_2454:
	array16	%i6,	%l2,	%i0
	fmovda	%xcc,	%f23,	%f27
	subc	%g3,	0x0AA5,	%o4
loop_2455:
	sethi	0x1235,	%g2
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
	sir	0x0388
	edge8ln	%l3,	%o6,	%l4
	tvc	%xcc,	0x5
loop_2456:
	edge32	%o5,	%o2,	%l1
	andcc	%o3,	0x0E28,	%o7
	sethi	0x172A,	%i3
	fmovdn	%icc,	%f4,	%f0
	taddcc	%i5,	%l6,	%g4
	movrgz	%g6,	0x2D5,	%l0
	xnor	%i7,	0x1699,	%o0
	call	loop_2457
	subccc	%g5,	0x1853,	%g1
	xnor	%i4,	%i1,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2457:
	movle	%xcc,	%o1,	%g7
	andncc	%i2,	%l2,	%i0
	fandnot2s	%f12,	%f5,	%f25
	brgz	%g3,	loop_2458
	fpmerge	%f25,	%f4,	%f6
	fbl	%fcc3,	loop_2459
	mulx	%o4,	%i6,	%g2
loop_2458:
	subc	%l3,	%l4,	%o5
	subcc	%o6,	0x1BB2,	%o2
loop_2459:
	move	%icc,	%o3,	%o7
	lduw	[%l7 + 0x54],	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f14
	movvc	%icc,	%i5,	%l1
	tsubcctv	%g4,	%l6,	%l0
	tsubcc	%i7,	0x0647,	%g6
	fabss	%f4,	%f12
	fcmpgt16	%f28,	%f8,	%g5
	tge	%xcc,	0x6
	fbge	%fcc1,	loop_2460
	fmovse	%icc,	%f12,	%f16
	edge16	%o0,	%i4,	%g1
	movvc	%icc,	%l5,	%i1
loop_2460:
	fmovsle	%xcc,	%f12,	%f31
	popc	%o1,	%g7
	std	%f24,	[%l7 + 0x38]
	fone	%f14
	fnor	%f18,	%f18,	%f2
	smulcc	%i2,	%l2,	%g3
	fbg	%fcc3,	loop_2461
	fmovse	%xcc,	%f29,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i0,	%o4
loop_2461:
	tl	%xcc,	0x4
	movn	%icc,	%i6,	%l3
	srax	%l4,	0x08,	%o5
	bge,a,pn	%icc,	loop_2462
	add	%o6,	%o2,	%o3
	movne	%xcc,	%o7,	%i3
	std	%g2,	[%l7 + 0x08]
loop_2462:
	taddcctv	%i5,	0x1E19,	%l1
	tcs	%icc,	0x2
	andncc	%g4,	%l6,	%i7
	alignaddr	%g6,	%g5,	%o0
	fbule,a	%fcc1,	loop_2463
	sll	%l0,	%i4,	%l5
	sdivcc	%i1,	0x1E21,	%g1
	popc	%g7,	%i2
loop_2463:
	fabss	%f13,	%f10
	movpos	%icc,	%l2,	%g3
	nop
	setx	loop_2464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%xcc,	%i0,	%o1
	set	0x78, %i6
	sta	%f10,	[%l7 + %i6] 0x0c
loop_2464:
	addccc	%i6,	0x11D1,	%o4
	edge32n	%l4,	%l3,	%o5
	fnot2s	%f6,	%f10
	xnor	%o6,	%o2,	%o7
	ldsb	[%l7 + 0x48],	%o3
	fmovrde	%g2,	%f30,	%f12
	fba,a	%fcc0,	loop_2465
	fbg,a	%fcc3,	loop_2466
	fba	%fcc1,	loop_2467
	nop
	setx	loop_2468,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2465:
	brnz,a	%i5,	loop_2469
loop_2466:
	fbo	%fcc0,	loop_2470
loop_2467:
	bcc,pt	%xcc,	loop_2471
loop_2468:
	nop
	set	0x18, %g6
	sth	%i3,	[%l7 + %g6]
loop_2469:
	tcs	%icc,	0x6
loop_2470:
	tcs	%xcc,	0x0
loop_2471:
	fbn	%fcc1,	loop_2472
	ldx	[%l7 + 0x10],	%g4
	movrlz	%l1,	%i7,	%g6
	movrgez	%l6,	%g5,	%l0
loop_2472:
	fpmerge	%f12,	%f16,	%f18
	umulcc	%o0,	0x180D,	%l5
	movne	%xcc,	%i4,	%g1
	sethi	0x0570,	%i1
	edge16l	%g7,	%l2,	%g3
	set	0x1C, %o6
	lduha	[%l7 + %o6] 0x14,	%i2
	call	loop_2473
	sth	%o1,	[%l7 + 0x32]
	edge8	%i6,	%o4,	%l4
	edge16n	%i0,	%o5,	%o6
loop_2473:
	fmovrdgez	%o2,	%f26,	%f12
	orn	%o7,	0x0F4A,	%o3
	fsrc1s	%f31,	%f28
	fmovrslez	%g2,	%f1,	%f12
	fmovrde	%i5,	%f30,	%f28
	mulx	%i3,	0x13B2,	%l3
	edge8	%g4,	%l1,	%g6
	fxor	%f24,	%f0,	%f20
	nop
	setx	loop_2474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%i7,	%g5,	%l0
	tneg	%icc,	0x3
	tneg	%icc,	0x5
loop_2474:
	subcc	%o0,	%l6,	%i4
	set	0x74, %l1
	ldsha	[%l7 + %l1] 0x88,	%l5
	edge8l	%i1,	%g7,	%g1
	orcc	%l2,	%g3,	%i2
	movrgez	%i6,	%o4,	%o1
	fblg,a	%fcc1,	loop_2475
	ta	%icc,	0x2
	taddcc	%i0,	0x1085,	%o5
	membar	0x20
loop_2475:
	bge	loop_2476
	edge8l	%o6,	%l4,	%o2
	fnors	%f30,	%f21,	%f30
	edge32l	%o3,	%g2,	%o7
loop_2476:
	ta	%xcc,	0x7
	movgu	%xcc,	%i5,	%l3
	edge16n	%g4,	%l1,	%g6
	fors	%f26,	%f11,	%f28
	stbar
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0F] %asi,	%i3
	popc	%i7,	%g5
	fmovda	%icc,	%f17,	%f23
	edge8	%o0,	%l6,	%l0
	bleu,pn	%icc,	loop_2477
	fone	%f30
	tpos	%xcc,	0x2
	andncc	%i4,	%l5,	%g7
loop_2477:
	fxnor	%f30,	%f8,	%f4
	bpos,a,pt	%icc,	loop_2478
	fbe	%fcc2,	loop_2479
	fnot1s	%f6,	%f17
	sir	0x0E3A
loop_2478:
	fxors	%f17,	%f13,	%f19
loop_2479:
	fbul	%fcc1,	loop_2480
	andn	%i1,	%l2,	%g3
	fcmpgt32	%f2,	%f12,	%g1
	stx	%i2,	[%l7 + 0x10]
loop_2480:
	tneg	%icc,	0x0
	udivx	%i6,	0x0032,	%o1
	mulx	%o4,	%o5,	%o6
	movre	%l4,	0x207,	%i0
	alignaddrl	%o2,	%g2,	%o7
	srl	%i5,	%l3,	%o3
	taddcctv	%l1,	%g6,	%g4
	ldd	[%l7 + 0x30],	%f30
	movcc	%xcc,	%i3,	%g5
	udivcc	%i7,	0x0A47,	%o0
	sll	%l6,	%i4,	%l5
	orn	%l0,	0x190C,	%i1
	bl,a,pn	%icc,	loop_2481
	movvc	%icc,	%g7,	%g3
	ta	%icc,	0x4
	fmovdvs	%xcc,	%f24,	%f23
loop_2481:
	edge8l	%l2,	%i2,	%i6
	fba,a	%fcc2,	loop_2482
	subcc	%g1,	%o1,	%o4
	bneg,pn	%xcc,	loop_2483
	edge16n	%o6,	%o5,	%l4
loop_2482:
	edge8l	%o2,	%g2,	%i0
	ldstub	[%l7 + 0x55],	%i5
loop_2483:
	nop
	wr	%g0,	0x2a,	%asi
	stxa	%o7,	[%l7 + 0x68] %asi
	membar	#Sync
	sll	%o3,	0x1B,	%l1
	tvs	%icc,	0x1
	fmovse	%xcc,	%f12,	%f29
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x10,	%l2
	brnz,a	%g4,	loop_2484
	fone	%f24
	fzeros	%f16
	edge16ln	%g6,	%i3,	%g5
loop_2484:
	movn	%icc,	%i7,	%o0
	sir	0x0883
	edge16ln	%i4,	%l6,	%l5
	set	0x53, %g2
	stba	%l0,	[%l7 + %g2] 0x80
	array8	%g7,	%g3,	%l2
	movcc	%icc,	%i2,	%i1
	fmovda	%xcc,	%f16,	%f14
	tsubcctv	%i6,	0x1B86,	%o1
	movrlz	%g1,	0x043,	%o6
	array32	%o4,	%o5,	%o2
	fmovdge	%icc,	%f13,	%f21
	bcc,a,pn	%icc,	loop_2485
	movn	%icc,	%l4,	%g2
	fmovsgu	%xcc,	%f10,	%f5
	wr	%g0,	0x10,	%asi
	stda	%i0,	[%l7 + 0x40] %asi
loop_2485:
	andcc	%i5,	%o7,	%o3
	fmovdvs	%xcc,	%f25,	%f22
	or	%l3,	%g4,	%g6
	array16	%i3,	%l1,	%g5
	fmovde	%xcc,	%f21,	%f25
	movneg	%xcc,	%o0,	%i7
	mulx	%i4,	%l5,	%l6
	alignaddr	%g7,	%l0,	%g3
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x81,	 0x2
	fble,a	%fcc2,	loop_2486
	udiv	%i1,	0x1531,	%l2
	udiv	%i6,	0x08FE,	%o1
	edge8	%g1,	%o4,	%o6
loop_2486:
	tle	%xcc,	0x6
	tle	%icc,	0x1
	bvs	loop_2487
	fcmpne16	%f10,	%f0,	%o2
	movcs	%xcc,	%l4,	%g2
	set	0x58, %i7
	sta	%f5,	[%l7 + %i7] 0x15
loop_2487:
	fbo	%fcc3,	loop_2488
	srax	%i0,	%i5,	%o7
	taddcc	%o3,	0x00B5,	%o5
	addc	%l3,	0x1308,	%g6
loop_2488:
	smulcc	%i3,	0x1F95,	%l1
	fpadd32s	%f11,	%f2,	%f28
	edge16ln	%g5,	%o0,	%g4
	xnor	%i4,	0x0012,	%i7
	add	%l6,	0x0D5C,	%g7
	edge16ln	%l0,	%g3,	%l5
	fnot2s	%f14,	%f2
	fpsub32	%f22,	%f6,	%f30
	fbe,a	%fcc3,	loop_2489
	ble,pt	%icc,	loop_2490
	edge16l	%i1,	%i2,	%i6
	smulcc	%o1,	%g1,	%o4
loop_2489:
	edge32n	%o6,	%l2,	%o2
loop_2490:
	fmovrslez	%g2,	%f18,	%f25
	movne	%icc,	%i0,	%i5
	sth	%o7,	[%l7 + 0x4A]
	mova	%xcc,	%l4,	%o5
	ld	[%l7 + 0x28],	%f17
	stb	%o3,	[%l7 + 0x6C]
	tgu	%icc,	0x1
	tn	%xcc,	0x0
	edge32ln	%l3,	%g6,	%l1
	sdiv	%g5,	0x0F44,	%i3
	fmovse	%icc,	%f26,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g4,	0x059A,	%i4
	ba,pn	%icc,	loop_2491
	fmuld8sux16	%f4,	%f6,	%f6
	andncc	%o0,	%l6,	%g7
	add	%l0,	%i7,	%g3
loop_2491:
	orn	%i1,	0x1F62,	%l5
	fble,a	%fcc2,	loop_2492
	fpmerge	%f28,	%f17,	%f6
	mova	%xcc,	%i2,	%o1
	movrgz	%i6,	%o4,	%g1
loop_2492:
	ldstub	[%l7 + 0x50],	%o6
	fmovsa	%icc,	%f26,	%f16
	edge32ln	%o2,	%g2,	%l2
	fmovrsne	%i5,	%f23,	%f17
	brgz,a	%o7,	loop_2493
	movneg	%xcc,	%l4,	%i0
	fbuge,a	%fcc1,	loop_2494
	fbge	%fcc3,	loop_2495
loop_2493:
	movvc	%xcc,	%o5,	%o3
	tneg	%xcc,	0x4
loop_2494:
	array16	%g6,	%l1,	%l3
loop_2495:
	bvs	%icc,	loop_2496
	fmovrdgez	%i3,	%f0,	%f0
	swap	[%l7 + 0x70],	%g4
	smul	%i4,	%o0,	%l6
loop_2496:
	fxnor	%f30,	%f14,	%f14
	fzero	%f30
	bne	loop_2497
	tgu	%xcc,	0x0
	umulcc	%g7,	%l0,	%g5
	fmovdvs	%xcc,	%f16,	%f30
loop_2497:
	array32	%i7,	%g3,	%i1
	edge32ln	%i2,	%o1,	%l5
	ldsh	[%l7 + 0x1E],	%o4
	fandnot1	%f14,	%f8,	%f0
	xor	%g1,	0x0DCB,	%o6
	srax	%i6,	%o2,	%g2
	bne,a	%icc,	loop_2498
	fbo,a	%fcc2,	loop_2499
	fbne,a	%fcc0,	loop_2500
	movcc	%icc,	%l2,	%i5
loop_2498:
	movcs	%xcc,	%l4,	%i0
loop_2499:
	nop
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f16
loop_2500:
	tcc	%icc,	0x4
	or	%o5,	0x0ADB,	%o7
	fmovdneg	%xcc,	%f28,	%f23
	sethi	0x0C38,	%o3
	tcc	%xcc,	0x5
	brlz	%g6,	loop_2501
	tne	%icc,	0x2
	fmovrslez	%l3,	%f15,	%f31
	fmovrdne	%i3,	%f18,	%f18
loop_2501:
	st	%f23,	[%l7 + 0x64]
	edge32ln	%l1,	%i4,	%o0
	sir	0x0ABB
	mulscc	%g4,	0x1AD0,	%l6
	tl	%icc,	0x7
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x18,	%g6
	bgu,a	%xcc,	loop_2502
	edge8	%l0,	%g5,	%i7
	fornot1	%f8,	%f8,	%f6
	edge32n	%g3,	%i1,	%o1
loop_2502:
	fbl	%fcc0,	loop_2503
	brlez,a	%i2,	loop_2504
	or	%l5,	0x1BAE,	%o4
	tsubcctv	%o6,	%g1,	%o2
loop_2503:
	bcs,a,pt	%icc,	loop_2505
loop_2504:
	xnorcc	%i6,	%l2,	%g2
	set	0x60, %o4
	lduba	[%l7 + %o4] 0x0c,	%i5
loop_2505:
	tgu	%icc,	0x2
	set	0x30, %i3
	lduha	[%l7 + %i3] 0x80,	%i0
	subccc	%o5,	%o7,	%o3
	movvc	%xcc,	%l4,	%g6
	orcc	%l3,	0x07F9,	%l1
	fpmerge	%f16,	%f10,	%f28
	nop
	setx	loop_2506,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%icc,	0x6
	srlx	%i4,	%i3,	%o0
	smulcc	%g4,	%g7,	%l0
loop_2506:
	movrne	%g5,	%i7,	%l6
	smul	%g3,	0x0AF0,	%i1
	edge8	%i2,	%o1,	%l5
	array32	%o4,	%o6,	%o2
	taddcc	%i6,	0x0222,	%g1
	movl	%icc,	%l2,	%g2
	movre	%i0,	0x37D,	%o5
	edge16	%o7,	%o3,	%l4
	taddcc	%i5,	0x16C5,	%g6
	mulscc	%l1,	%i4,	%i3
	tcc	%icc,	0x3
	tpos	%xcc,	0x2
	ldsb	[%l7 + 0x51],	%o0
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l3
	lduw	[%l7 + 0x34],	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%g5
	andcc	%g4,	0x0B33,	%l6
	stbar
	fpack16	%f12,	%f18
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g3,	%i7
	fmovdge	%xcc,	%f21,	%f1
	addcc	%i1,	0x1AA4,	%i2
	stw	%o1,	[%l7 + 0x44]
	fxnors	%f17,	%f14,	%f17
	bg,pt	%xcc,	loop_2507
	fbne	%fcc2,	loop_2508
	movn	%icc,	%o4,	%o6
	array16	%o2,	%i6,	%g1
loop_2507:
	nop
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf1,	%f16
loop_2508:
	tcc	%icc,	0x7
	fbe	%fcc2,	loop_2509
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l5,	%l2,	%g2
	be	loop_2510
loop_2509:
	xor	%i0,	%o7,	%o3
	tleu	%icc,	0x6
	edge16n	%l4,	%i5,	%o5
loop_2510:
	srlx	%g6,	0x0C,	%l1
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x30] %asi
	nop
	setx	loop_2511,	%l0,	%l1
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
	popc	%i4,	%o0
	fzeros	%f2
loop_2511:
	fmovrsne	%l3,	%f25,	%f22
	movl	%xcc,	%i3,	%g7
	fbne,a	%fcc1,	loop_2512
	movpos	%icc,	%l0,	%g5
	tpos	%icc,	0x1
	smulcc	%l6,	%g3,	%i7
loop_2512:
	alignaddr	%g4,	%i2,	%i1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	brz,a	%o4,	loop_2513
	umul	%o2,	%o6,	%i6
	tvs	%icc,	0x2
	fpadd32s	%f13,	%f10,	%f26
loop_2513:
	smulcc	%l5,	0x1727,	%l2
	fxor	%f6,	%f8,	%f28
	fmovspos	%xcc,	%f2,	%f0
	movne	%icc,	%g1,	%i0
	fmovdl	%icc,	%f9,	%f19
	addc	%o7,	0x008B,	%g2
	tgu	%icc,	0x6
	ldsh	[%l7 + 0x38],	%l4
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x19
	alignaddrl	%i5,	%o5,	%g6
	ta	%xcc,	0x0
	andncc	%l1,	%i4,	%o0
	tle	%icc,	0x3
	ld	[%l7 + 0x74],	%f22
	set	0x68, %l5
	sta	%f12,	[%l7 + %l5] 0x81
	std	%o2,	[%l7 + 0x20]
	fble	%fcc3,	loop_2514
	fabsd	%f28,	%f28
	umulcc	%i3,	0x1609,	%l3
	edge32ln	%g7,	%g5,	%l6
loop_2514:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x5
	array16	%l0,	%i7,	%g4
	fnors	%f8,	%f23,	%f21
	fmovspos	%xcc,	%f21,	%f13
	edge16l	%g3,	%i1,	%o1
	alignaddrl	%o4,	%i2,	%o6
	orncc	%o2,	%i6,	%l2
	te	%icc,	0x0
	fabsd	%f4,	%f0
	edge16l	%l5,	%i0,	%o7
	movrgez	%g2,	%g1,	%l4
	fmovrde	%o5,	%f30,	%f8
	fandnot2	%f10,	%f26,	%f24
	subccc	%i5,	0x1EC1,	%g6
	add	%i4,	0x0FD7,	%l1
	fabsd	%f20,	%f18
	tg	%icc,	0x3
	movl	%icc,	%o3,	%o0
	movrlz	%l3,	0x3A8,	%g7
	movg	%xcc,	%g5,	%l6
	sir	0x025F
	and	%l0,	%i3,	%i7
	movneg	%icc,	%g3,	%i1
	edge32n	%o1,	%o4,	%i2
	movrlz	%g4,	%o6,	%o2
	tne	%icc,	0x1
	fmovsa	%icc,	%f7,	%f18
	subc	%i6,	%l5,	%l2
	or	%o7,	%i0,	%g1
	addcc	%g2,	%o5,	%l4
	xorcc	%g6,	0x09A1,	%i4
	fmovsne	%xcc,	%f27,	%f27
	fmovdcs	%xcc,	%f1,	%f21
	nop
	set	0x7A, %i2
	lduh	[%l7 + %i2],	%i5
	orcc	%o3,	0x1E96,	%l1
	fcmple16	%f16,	%f4,	%l3
	fmovsle	%icc,	%f2,	%f26
	array32	%g7,	%o0,	%l6
	fxor	%f28,	%f0,	%f10
	fble	%fcc0,	loop_2515
	andncc	%l0,	%g5,	%i7
	edge16l	%i3,	%g3,	%i1
	smul	%o1,	0x0CB2,	%i2
loop_2515:
	fbule,a	%fcc3,	loop_2516
	fmovrslez	%o4,	%f31,	%f27
	add	%g4,	0x031C,	%o2
	set	0x26, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i6
loop_2516:
	movrlz	%l5,	0x246,	%l2
	edge32n	%o6,	%o7,	%i0
	ldsw	[%l7 + 0x68],	%g1
	addcc	%g2,	%o5,	%l4
	movre	%g6,	0x292,	%i5
	orncc	%i4,	0x1027,	%l1
	movle	%icc,	%l3,	%o3
	edge16ln	%g7,	%o0,	%l0
	sllx	%l6,	0x0F,	%i7
	set	0x28, %o7
	stda	%i2,	[%l7 + %o7] 0x18
	brgz	%g5,	loop_2517
	xnorcc	%g3,	0x1837,	%o1
	subccc	%i2,	%o4,	%i1
	movre	%o2,	%i6,	%l5
loop_2517:
	tcc	%xcc,	0x2
	sllx	%l2,	0x0D,	%g4
	fbul	%fcc3,	loop_2518
	edge8	%o6,	%i0,	%g1
	addc	%g2,	0x024C,	%o7
	addc	%l4,	0x1F14,	%o5
loop_2518:
	fbge,a	%fcc0,	loop_2519
	addcc	%g6,	0x1AEF,	%i4
	set	0x3C, %g4
	ldswa	[%l7 + %g4] 0x18,	%i5
loop_2519:
	membar	0x51
	andcc	%l1,	0x0477,	%o3
	move	%icc,	%g7,	%o0
	fbug	%fcc3,	loop_2520
	st	%f4,	[%l7 + 0x0C]
	set	0x38, %i1
	lduba	[%l7 + %i1] 0x04,	%l3
loop_2520:
	prefetch	[%l7 + 0x28],	 0x2
	tvs	%icc,	0x2
	tcc	%icc,	0x6
	stb	%l6,	[%l7 + 0x2C]
	smulcc	%i7,	%i3,	%l0
	tl	%xcc,	0x4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%g3
	fornot2s	%f20,	%f4,	%f13
	movrgz	%o1,	%g5,	%o4
	array32	%i2,	%i1,	%i6
	addc	%l5,	%l2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o6,	0x1B14,	%i0
	tneg	%xcc,	0x7
	edge32ln	%o2,	%g1,	%o7
	brgz	%l4,	loop_2521
	ble,pn	%icc,	loop_2522
	edge32	%g2,	%o5,	%g6
	fbge,a	%fcc3,	loop_2523
loop_2521:
	fmul8x16	%f11,	%f12,	%f30
loop_2522:
	movvs	%xcc,	%i4,	%i5
	mulx	%o3,	%g7,	%o0
loop_2523:
	fnegd	%f10,	%f16
	and	%l1,	0x0124,	%l6
	movgu	%icc,	%l3,	%i3
	fmovda	%icc,	%f27,	%f26
	tleu	%xcc,	0x2
	fba,a	%fcc2,	loop_2524
	fmovrdlz	%l0,	%f6,	%f14
	sra	%i7,	0x02,	%o1
	edge8ln	%g5,	%g3,	%o4
loop_2524:
	mova	%icc,	%i2,	%i6
	or	%i1,	%l2,	%g4
	udivcc	%l5,	0x1875,	%i0
	stbar
	sir	0x0B8B
	sll	%o2,	0x14,	%o6
	sethi	0x10D5,	%g1
	array8	%l4,	%o7,	%o5
	and	%g2,	0x0937,	%i4
	fcmpd	%fcc0,	%f16,	%f0
	wr	%g0,	0x11,	%asi
	stxa	%i5,	[%l7 + 0x40] %asi
	fmovd	%f10,	%f10
	edge8	%o3,	%g6,	%o0
	tne	%icc,	0x3
	movne	%xcc,	%g7,	%l1
	fmovdleu	%xcc,	%f30,	%f10
	fmul8x16au	%f10,	%f31,	%f10
	fcmple32	%f24,	%f2,	%l6
	te	%icc,	0x6
	movrgz	%i3,	0x39C,	%l3
	bneg,a,pn	%xcc,	loop_2525
	movre	%l0,	0x397,	%i7
	edge8n	%g5,	%o1,	%g3
	fpack16	%f14,	%f23
loop_2525:
	fmovsl	%xcc,	%f8,	%f16
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x26] %asi,	%o4
	taddcctv	%i6,	%i2,	%l2
	fmovdl	%icc,	%f5,	%f16
	orcc	%g4,	%i1,	%i0
	fpack16	%f28,	%f28
	smulcc	%l5,	0x0C55,	%o2
	addc	%g1,	0x03D7,	%l4
	srl	%o7,	0x00,	%o5
	fpsub16s	%f23,	%f1,	%f14
	edge32ln	%o6,	%g2,	%i5
	fmovsge	%icc,	%f3,	%f17
	tcs	%xcc,	0x0
	orncc	%o3,	%i4,	%o0
	fmovdvs	%icc,	%f21,	%f20
	movn	%xcc,	%g6,	%l1
	tvc	%xcc,	0x0
	sdivcc	%g7,	0x1776,	%i3
	orcc	%l6,	0x14D3,	%l3
	orncc	%i7,	0x0898,	%l0
	stw	%g5,	[%l7 + 0x0C]
	fornot2s	%f18,	%f22,	%f29
	bgu	%xcc,	loop_2526
	tvs	%xcc,	0x1
	sdivcc	%o1,	0x13B3,	%o4
	flush	%l7 + 0x78
loop_2526:
	ta	%icc,	0x6
	movge	%icc,	%i6,	%i2
	andcc	%l2,	0x001C,	%g3
	fnot2	%f14,	%f30
	array32	%i1,	%i0,	%l5
	udivcc	%g4,	0x1233,	%g1
	mova	%xcc,	%o2,	%l4
	fornot1	%f4,	%f16,	%f14
	xorcc	%o7,	%o6,	%g2
	edge16l	%o5,	%i5,	%o3
	tl	%xcc,	0x2
	lduh	[%l7 + 0x72],	%i4
	sdiv	%g6,	0x12FB,	%l1
	mulscc	%o0,	%g7,	%i3
	mulx	%l6,	0x100A,	%i7
	alignaddr	%l3,	%l0,	%g5
	movl	%icc,	%o1,	%i6
	addc	%o4,	%i2,	%l2
	movvs	%icc,	%g3,	%i0
	movrlez	%i1,	0x04E,	%g4
	edge32l	%l5,	%g1,	%o2
	smul	%l4,	%o7,	%g2
	fmovrsgez	%o6,	%f11,	%f0
	movneg	%xcc,	%o5,	%i5
	fpadd32	%f12,	%f26,	%f20
	set	0x5A, %o1
	stha	%o3,	[%l7 + %o1] 0x89
	fmovsleu	%xcc,	%f11,	%f7
	popc	0x09E1,	%i4
	mulscc	%g6,	%l1,	%o0
	fbn	%fcc0,	loop_2527
	smulcc	%g7,	%i3,	%i7
	fmovsge	%icc,	%f2,	%f13
	andn	%l6,	0x0CCC,	%l3
loop_2527:
	st	%f0,	[%l7 + 0x20]
	fmovdg	%icc,	%f25,	%f26
	edge16l	%l0,	%g5,	%i6
	addc	%o4,	%i2,	%o1
	fmovsl	%icc,	%f23,	%f19
	edge32l	%l2,	%i0,	%i1
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g3
	andcc	%l5,	0x0327,	%g1
	orncc	%o2,	%g4,	%o7
	movcc	%icc,	%g2,	%l4
	edge8l	%o6,	%i5,	%o3
	fxors	%f28,	%f17,	%f18
	fmovdcs	%xcc,	%f22,	%f24
	taddcctv	%o5,	%g6,	%l1
	fandnot2s	%f31,	%f24,	%f22
	brlz	%i4,	loop_2528
	movvc	%icc,	%o0,	%i3
	edge8ln	%g7,	%i7,	%l3
	brz	%l6,	loop_2529
loop_2528:
	movl	%icc,	%l0,	%g5
	tne	%icc,	0x1
	tsubcc	%o4,	%i6,	%o1
loop_2529:
	bgu	%xcc,	loop_2530
	fcmpgt32	%f26,	%f10,	%l2
	or	%i2,	%i1,	%i0
	orn	%l5,	0x0AA3,	%g1
loop_2530:
	ld	[%l7 + 0x38],	%f13
	array32	%g3,	%o2,	%o7
	srax	%g4,	0x16,	%g2
	xorcc	%o6,	%i5,	%o3
	ldsb	[%l7 + 0x54],	%l4
	udiv	%g6,	0x1D0D,	%l1
	movne	%xcc,	%i4,	%o0
	fmovdvc	%icc,	%f27,	%f16
	tvs	%icc,	0x1
	fpackfix	%f22,	%f23
	movne	%icc,	%i3,	%g7
	taddcc	%i7,	%l3,	%l6
	subccc	%o5,	%g5,	%l0
	fbo,a	%fcc3,	loop_2531
	mulx	%o4,	%i6,	%l2
	membar	0x41
	te	%icc,	0x4
loop_2531:
	fsrc2	%f8,	%f4
	lduh	[%l7 + 0x42],	%o1
	movrgez	%i1,	%i0,	%l5
	fmovrde	%g1,	%f8,	%f8
	ldub	[%l7 + 0x0F],	%i2
	sir	0x13D6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o2,	%g3,	%g4
	fone	%f26
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x24,	%o6
	movleu	%icc,	%g2,	%o6
	ldub	[%l7 + 0x3C],	%o3
	udivx	%i5,	0x18FC,	%g6
	swap	[%l7 + 0x18],	%l4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l1
	fpsub32s	%f7,	%f25,	%f12
	smulcc	%i4,	%i3,	%g7
	movne	%icc,	%i7,	%o0
	alignaddr	%l6,	%o5,	%g5
	popc	%l0,	%l3
	srlx	%o4,	%i6,	%l2
	fble,a	%fcc1,	loop_2532
	tcc	%xcc,	0x6
	fbg,a	%fcc2,	loop_2533
	ba,pn	%xcc,	loop_2534
loop_2532:
	mulscc	%o1,	0x0977,	%i0
	nop
	set	0x60, %l4
	ldx	[%l7 + %l4],	%i1
loop_2533:
	fmul8ulx16	%f8,	%f22,	%f28
loop_2534:
	mova	%xcc,	%l5,	%g1
	popc	%o2,	%i2
	movrlez	%g3,	0x117,	%g4
	subc	%g2,	0x00A2,	%o6
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o7
	te	%xcc,	0x2
	prefetch	[%l7 + 0x18],	 0x2
	fbo,a	%fcc1,	loop_2535
	fpsub16	%f20,	%f6,	%f18
	tle	%icc,	0x3
	xorcc	%i5,	%o3,	%g6
loop_2535:
	fbn	%fcc0,	loop_2536
	edge16n	%l1,	%l4,	%i3
	edge8ln	%i4,	%i7,	%o0
	fmuld8sux16	%f5,	%f26,	%f4
loop_2536:
	movgu	%xcc,	%l6,	%g7
	ldd	[%l7 + 0x10],	%g4
	fmovrdlz	%l0,	%f18,	%f16
	movg	%xcc,	%l3,	%o5
	alignaddrl	%o4,	%i6,	%o1
	tn	%icc,	0x0
	movvs	%xcc,	%l2,	%i0
	fones	%f23
	fmul8x16	%f30,	%f2,	%f24
	fcmpne16	%f6,	%f4,	%l5
	tsubcctv	%i1,	%o2,	%g1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i2,	%g3
	edge8	%g4,	%g2,	%o6
	fbug,a	%fcc3,	loop_2537
	fbl	%fcc2,	loop_2538
	movre	%o7,	%i5,	%g6
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x5B] %asi,	%o3
loop_2537:
	movgu	%xcc,	%l1,	%l4
loop_2538:
	fandnot2	%f6,	%f0,	%f0
	alignaddr	%i4,	%i3,	%o0
	ldsh	[%l7 + 0x40],	%l6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x11,	%f0
	movn	%icc,	%g7,	%i7
	bcc	%xcc,	loop_2539
	fbg,a	%fcc1,	loop_2540
	fmovrse	%g5,	%f5,	%f19
	edge16ln	%l0,	%l3,	%o4
loop_2539:
	orcc	%o5,	0x03D5,	%o1
loop_2540:
	fbl,a	%fcc3,	loop_2541
	orncc	%l2,	%i6,	%i0
	edge32ln	%l5,	%i1,	%o2
	tgu	%xcc,	0x5
loop_2541:
	xnorcc	%g1,	0x17CF,	%g3
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	membar	0x35
	tsubcc	%g2,	0x1C47,	%o6
	fmovspos	%xcc,	%f21,	%f26
	fbul,a	%fcc1,	loop_2542
	movne	%icc,	%o7,	%i5
	stb	%i2,	[%l7 + 0x77]
	edge32n	%o3,	%l1,	%l4
loop_2542:
	addc	%i4,	%g6,	%o0
	nop
	set	0x22, %g1
	lduh	[%l7 + %g1],	%i3
	ble,a,pt	%xcc,	loop_2543
	movvc	%icc,	%l6,	%g7
	movvs	%icc,	%g5,	%i7
	umul	%l0,	%o4,	%o5
loop_2543:
	nop
	set	0x78, %g3
	prefetch	[%l7 + %g3],	 0x1
	fba	%fcc3,	loop_2544
	edge16l	%l3,	%l2,	%o1
	ta	%xcc,	0x5
	sub	%i6,	%i0,	%i1
loop_2544:
	fbge	%fcc1,	loop_2545
	fmovrdne	%l5,	%f30,	%f16
	mulx	%o2,	0x05F5,	%g3
	edge32l	%g4,	%g2,	%o6
loop_2545:
	lduw	[%l7 + 0x34],	%g1
	movre	%o7,	0x3EF,	%i5
	edge32n	%i2,	%o3,	%l4
	andncc	%i4,	%g6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l1,	%i3,	%l6
	tpos	%xcc,	0x1
	addc	%g5,	0x1D11,	%g7
	fmovrdne	%l0,	%f18,	%f14
	tsubcctv	%o4,	0x15B7,	%i7
	fba,a	%fcc0,	loop_2546
	fcmpne16	%f20,	%f8,	%l3
	tpos	%icc,	0x7
	movrgz	%o5,	%l2,	%i6
loop_2546:
	tneg	%icc,	0x5
	bge,a	%xcc,	loop_2547
	udivx	%i0,	0x1FCD,	%i1
	ba	loop_2548
	movn	%xcc,	%o1,	%l5
loop_2547:
	movcs	%xcc,	%g3,	%g4
	edge16n	%g2,	%o2,	%o6
loop_2548:
	nop
	set	0x4A, %o3
	lduba	[%l7 + %o3] 0x18,	%g1
	fand	%f12,	%f0,	%f0
	fors	%f26,	%f2,	%f18
	sra	%o7,	0x0A,	%i2
	smulcc	%o3,	%i5,	%i4
	edge32n	%g6,	%l4,	%l1
	fornot1s	%f25,	%f6,	%f27
	subccc	%o0,	0x0414,	%i3
	set	0x78, %l3
	swapa	[%l7 + %l3] 0x88,	%l6
	be,a,pn	%icc,	loop_2549
	mulscc	%g7,	0x1122,	%g5
	fmovdleu	%xcc,	%f15,	%f31
	fbn,a	%fcc1,	loop_2550
loop_2549:
	movneg	%icc,	%o4,	%l0
	and	%l3,	%i7,	%l2
	movleu	%icc,	%o5,	%i0
loop_2550:
	tne	%xcc,	0x4
	stb	%i1,	[%l7 + 0x11]
	movrlz	%i6,	%o1,	%g3
	fbe	%fcc0,	loop_2551
	tleu	%icc,	0x2
	movvc	%xcc,	%l5,	%g2
	fble	%fcc1,	loop_2552
loop_2551:
	fble,a	%fcc0,	loop_2553
	edge8n	%g4,	%o2,	%g1
	stb	%o6,	[%l7 + 0x7D]
loop_2552:
	edge16l	%o7,	%i2,	%o3
loop_2553:
	fcmpgt16	%f22,	%f22,	%i5
	tvs	%xcc,	0x6
	edge16n	%i4,	%g6,	%l1
	udivx	%o0,	0x196B,	%i3
	fbul,a	%fcc2,	loop_2554
	popc	%l4,	%g7
	fmovrslez	%l6,	%f1,	%f29
	tg	%icc,	0x2
loop_2554:
	ldub	[%l7 + 0x0F],	%o4
	edge32	%g5,	%l0,	%l3
	add	%i7,	%l2,	%o5
	nop
	setx loop_2555, %l0, %l1
	jmpl %l1, %i0
	tleu	%icc,	0x5
	tle	%icc,	0x2
	subcc	%i1,	0x09B0,	%i6
loop_2555:
	nop
	set	0x58, %o2
	stxa	%o1,	[%l7 + %o2] 0xeb
	membar	#Sync
	bcc,a,pt	%icc,	loop_2556
	umulcc	%g3,	0x1C6A,	%g2
	fmovscs	%xcc,	%f11,	%f13
	sub	%l5,	0x06C1,	%g4
loop_2556:
	movvc	%icc,	%o2,	%g1
	std	%f28,	[%l7 + 0x28]
	nop
	setx	loop_2557,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%xcc,	%o7,	%o6
	fmuld8ulx16	%f17,	%f31,	%f12
	tpos	%xcc,	0x7
loop_2557:
	tvs	%icc,	0x5
	orcc	%i2,	0x1CF5,	%o3
	udiv	%i4,	0x1A1B,	%i5
	xor	%g6,	%o0,	%l1
	fxnor	%f8,	%f24,	%f20
	bcc,a,pt	%icc,	loop_2558
	fmovrsgez	%l4,	%f31,	%f22
	bne,pt	%icc,	loop_2559
	movg	%xcc,	%g7,	%i3
loop_2558:
	te	%xcc,	0x0
	movne	%xcc,	%o4,	%l6
loop_2559:
	siam	0x3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x74] %asi,	%l0
	movrlez	%g5,	%l3,	%i7
	fsrc1s	%f26,	%f26
	smulcc	%o5,	%i0,	%l2
	fmovrdne	%i1,	%f16,	%f2
	edge8	%o1,	%g3,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x1
	srl	%g2,	%g4,	%l5
	edge8l	%o2,	%o7,	%o6
	movrgz	%i2,	%g1,	%o3
	movne	%icc,	%i4,	%g6
	fmovrslez	%i5,	%f24,	%f6
	popc	0x1C2C,	%l1
	fexpand	%f10,	%f26
	fmovsg	%icc,	%f25,	%f4
	sll	%l4,	%g7,	%o0
	array8	%i3,	%l6,	%l0
	movvs	%xcc,	%g5,	%l3
	tpos	%icc,	0x2
	edge16ln	%o4,	%o5,	%i7
	xnor	%l2,	0x033E,	%i0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f30
	array16	%i1,	%g3,	%o1
	sdiv	%g2,	0x1B68,	%i6
	tleu	%xcc,	0x7
	addcc	%g4,	%l5,	%o2
	brgez	%o7,	loop_2560
	movrlez	%o6,	%g1,	%o3
	tsubcc	%i4,	0x1C15,	%i2
	sdivcc	%i5,	0x068C,	%l1
loop_2560:
	fmovsg	%xcc,	%f0,	%f30
	fands	%f31,	%f20,	%f3
	edge32n	%g6,	%l4,	%o0
	bcc,a,pt	%icc,	loop_2561
	array32	%i3,	%l6,	%l0
	ldx	[%l7 + 0x50],	%g5
	movne	%xcc,	%l3,	%o4
loop_2561:
	edge8n	%g7,	%o5,	%l2
	movg	%xcc,	%i7,	%i0
	alignaddrl	%g3,	%o1,	%g2
	fmovdle	%icc,	%f1,	%f27
	tge	%xcc,	0x7
	andcc	%i1,	0x02CD,	%i6
	edge8ln	%l5,	%g4,	%o7
	tl	%xcc,	0x1
	orcc	%o2,	0x03C0,	%g1
	orcc	%o6,	%o3,	%i2
	fbn	%fcc1,	loop_2562
	fmovdn	%icc,	%f17,	%f13
	prefetch	[%l7 + 0x38],	 0x0
	ldstub	[%l7 + 0x0E],	%i5
loop_2562:
	tg	%xcc,	0x0
	fmovsleu	%icc,	%f14,	%f14
	fbg	%fcc2,	loop_2563
	sub	%i4,	0x08B0,	%g6
	fnands	%f7,	%f14,	%f2
	addc	%l1,	%l4,	%o0
loop_2563:
	tcc	%xcc,	0x5
	ba,pt	%xcc,	loop_2564
	taddcc	%i3,	0x1018,	%l0
	srl	%l6,	%l3,	%o4
	ble,a,pn	%icc,	loop_2565
loop_2564:
	mulx	%g7,	0x04A6,	%o5
	tleu	%icc,	0x5
	tcs	%xcc,	0x1
loop_2565:
	tge	%xcc,	0x5
	fmovsa	%icc,	%f23,	%f11
	subc	%l2,	0x0614,	%g5
	popc	%i7,	%g3
	tne	%xcc,	0x5
	tsubcctv	%o1,	%g2,	%i1
	movrlz	%i0,	0x173,	%i6
	alignaddrl	%l5,	%o7,	%g4
	fmovdcs	%icc,	%f16,	%f21
	bcc,pt	%icc,	loop_2566
	andn	%g1,	0x12E6,	%o2
	ldd	[%l7 + 0x58],	%f22
	srl	%o3,	0x0E,	%o6
loop_2566:
	bgu,pt	%xcc,	loop_2567
	bvc,pn	%xcc,	loop_2568
	sdivx	%i5,	0x04EB,	%i2
	alignaddr	%g6,	%l1,	%l4
loop_2567:
	umul	%i4,	%i3,	%l0
loop_2568:
	array8	%o0,	%l6,	%o4
	movrgez	%l3,	%g7,	%l2
	alignaddrl	%o5,	%g5,	%g3
	xnor	%o1,	%g2,	%i1
	sdivcc	%i0,	0x0F61,	%i7
	edge16l	%i6,	%o7,	%l5
	fmovrde	%g1,	%f16,	%f6
	movl	%xcc,	%o2,	%o3
	tn	%xcc,	0x5
	fmovrsgz	%g4,	%f23,	%f10
	addc	%i5,	0x09E9,	%o6
	edge32n	%g6,	%i2,	%l1
	udiv	%l4,	0x0FC8,	%i3
	fbe	%fcc1,	loop_2569
	movneg	%xcc,	%i4,	%l0
	ldsb	[%l7 + 0x46],	%l6
	tcc	%icc,	0x4
loop_2569:
	taddcc	%o4,	0x0342,	%o0
	array8	%g7,	%l3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f5,	%f5
	srax	%g5,	%l2,	%o1
	movcc	%xcc,	%g3,	%i1
	udiv	%i0,	0x1537,	%i7
	andncc	%i6,	%g2,	%l5
	be,a,pt	%icc,	loop_2570
	sll	%g1,	0x1B,	%o7
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x50] %asi
loop_2570:
	bvc,a,pt	%xcc,	loop_2571
	movvc	%xcc,	%o2,	%o3
	ta	%icc,	0x1
	te	%xcc,	0x7
loop_2571:
	movcs	%xcc,	%g4,	%o6
	fbul,a	%fcc1,	loop_2572
	fbug	%fcc2,	loop_2573
	popc	0x024C,	%i5
	fmul8ulx16	%f26,	%f4,	%f24
loop_2572:
	movneg	%icc,	%i2,	%g6
loop_2573:
	fcmpne32	%f4,	%f16,	%l4
	fsrc2	%f18,	%f20
	edge32n	%i3,	%i4,	%l0
	tle	%xcc,	0x1
	fmuld8ulx16	%f11,	%f25,	%f24
	movleu	%xcc,	%l6,	%l1
	movge	%xcc,	%o4,	%o0
	addc	%l3,	%o5,	%g5
	movvc	%icc,	%l2,	%g7
	stb	%g3,	[%l7 + 0x17]
	fexpand	%f17,	%f16
	fmovsg	%icc,	%f11,	%f24
	fabss	%f23,	%f5
	srlx	%o1,	%i0,	%i1
	fpadd32	%f26,	%f4,	%f24
	nop
	set	0x66, %g7
	lduh	[%l7 + %g7],	%i7
	nop
	setx	loop_2574,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x3
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%i6
loop_2574:
	mulx	%l5,	%g2,	%o7
	edge16	%g1,	%o3,	%g4
	addcc	%o2,	%i5,	%i2
	brgez	%g6,	loop_2575
	movgu	%xcc,	%l4,	%i3
	tcs	%xcc,	0x3
	bcc,pt	%icc,	loop_2576
loop_2575:
	for	%f28,	%f16,	%f22
	fornot1	%f14,	%f2,	%f24
	alignaddr	%o6,	%l0,	%i4
loop_2576:
	movgu	%xcc,	%l1,	%l6
	tvc	%xcc,	0x4
	fones	%f24
	fnor	%f16,	%f2,	%f2
	addccc	%o0,	%l3,	%o5
	srlx	%o4,	0x12,	%l2
	bleu,a,pt	%icc,	loop_2577
	tg	%xcc,	0x5
	taddcctv	%g7,	0x0AB9,	%g5
	tcc	%icc,	0x2
loop_2577:
	movcc	%icc,	%g3,	%o1
	movre	%i1,	0x301,	%i7
	fabss	%f14,	%f3
	fmovdn	%xcc,	%f0,	%f6
	stw	%i0,	[%l7 + 0x34]
	subccc	%l5,	0x0D53,	%i6
	fmovsgu	%icc,	%f9,	%f25
	te	%icc,	0x1
	tsubcctv	%g2,	%o7,	%o3
	set	0x35, %i6
	lduba	[%l7 + %i6] 0x15,	%g1
	andcc	%g4,	%i5,	%i2
	movn	%icc,	%o2,	%g6
	edge32ln	%i3,	%o6,	%l0
	fbule,a	%fcc0,	loop_2578
	movg	%icc,	%l4,	%l1
	xnorcc	%l6,	%i4,	%l3
	mulscc	%o5,	0x1F59,	%o4
loop_2578:
	fmovdcs	%icc,	%f24,	%f23
	fmovsvc	%xcc,	%f8,	%f15
	fcmpes	%fcc1,	%f19,	%f26
	fmovsvc	%xcc,	%f17,	%f3
	movrne	%o0,	%g7,	%g5
	tge	%xcc,	0x4
	fmul8sux16	%f16,	%f28,	%f26
	andncc	%l2,	%g3,	%i1
	fmovdvs	%xcc,	%f1,	%f6
	fbug,a	%fcc3,	loop_2579
	ble,a,pt	%xcc,	loop_2580
	movrlz	%o1,	%i7,	%i0
	fmovdvs	%xcc,	%f16,	%f4
loop_2579:
	bcc,a	loop_2581
loop_2580:
	ldsb	[%l7 + 0x78],	%l5
	andncc	%i6,	%o7,	%o3
	movre	%g2,	0x29E,	%g4
loop_2581:
	fbn,a	%fcc1,	loop_2582
	nop
	setx	loop_2583,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovs	%f10,	%f31
	movge	%xcc,	%i5,	%g1
loop_2582:
	stb	%i2,	[%l7 + 0x2D]
loop_2583:
	ldub	[%l7 + 0x37],	%o2
	tge	%icc,	0x4
	edge8l	%i3,	%o6,	%g6
	bg,pt	%xcc,	loop_2584
	tne	%icc,	0x7
	prefetch	[%l7 + 0x6C],	 0x3
	fpadd16s	%f28,	%f29,	%f31
loop_2584:
	ta	%icc,	0x0
	fpadd32s	%f7,	%f4,	%f4
	movne	%xcc,	%l4,	%l1
	udivcc	%l0,	0x09B6,	%i4
	move	%xcc,	%l3,	%l6
	sdivx	%o4,	0x0ABA,	%o5
	fbu	%fcc2,	loop_2585
	fmovrdne	%g7,	%f10,	%f20
	andn	%g5,	0x1F17,	%l2
	orncc	%g3,	0x0C91,	%o0
loop_2585:
	fmovdg	%xcc,	%f31,	%f12
	fmovrdgz	%i1,	%f20,	%f6
	movgu	%xcc,	%i7,	%i0
	movvc	%xcc,	%l5,	%i6
	fbug,a	%fcc0,	loop_2586
	bleu,a	%icc,	loop_2587
	orcc	%o7,	0x1604,	%o3
	fmovsvs	%xcc,	%f16,	%f30
loop_2586:
	fmovrslez	%o1,	%f16,	%f3
loop_2587:
	fbe	%fcc1,	loop_2588
	fmovscc	%xcc,	%f23,	%f9
	movn	%icc,	%g2,	%g4
	fbge	%fcc1,	loop_2589
loop_2588:
	orn	%g1,	0x11B8,	%i5
	fands	%f23,	%f20,	%f29
	alignaddrl	%i2,	%i3,	%o2
loop_2589:
	fexpand	%f12,	%f4
	bl,a	loop_2590
	smulcc	%o6,	0x0AE9,	%l4
	fxor	%f12,	%f8,	%f20
	fornot2	%f26,	%f4,	%f12
loop_2590:
	fmovscs	%icc,	%f0,	%f25
	subccc	%g6,	0x1AAA,	%l1
	tne	%icc,	0x7
	tcs	%xcc,	0x4
	std	%f8,	[%l7 + 0x38]
	tneg	%icc,	0x1
	movrgez	%i4,	0x1B6,	%l3
	tge	%icc,	0x3
	tpos	%icc,	0x3
	fandnot2	%f10,	%f0,	%f18
	ldd	[%l7 + 0x38],	%f8
	movl	%icc,	%l6,	%o4
	stx	%l0,	[%l7 + 0x28]
	be	loop_2591
	array16	%o5,	%g5,	%g7
	nop
	setx loop_2592, %l0, %l1
	jmpl %l1, %g3
	fble	%fcc3,	loop_2593
loop_2591:
	fmovrsgz	%l2,	%f14,	%f27
	edge32ln	%i1,	%o0,	%i7
loop_2592:
	std	%f8,	[%l7 + 0x78]
loop_2593:
	stx	%i0,	[%l7 + 0x70]
	movvs	%xcc,	%l5,	%i6
	membar	0x1B
	orcc	%o3,	%o1,	%g2
	xor	%o7,	0x1691,	%g4
	movcs	%icc,	%i5,	%i2
	fmovsne	%xcc,	%f13,	%f11
	fbue,a	%fcc0,	loop_2594
	tge	%icc,	0x6
	movleu	%icc,	%g1,	%i3
	sub	%o2,	0x0568,	%l4
loop_2594:
	movg	%xcc,	%o6,	%l1
	udiv	%g6,	0x1477,	%i4
	fmovdcc	%icc,	%f31,	%f12
	alignaddrl	%l6,	%l3,	%l0
	movvs	%xcc,	%o4,	%g5
	fands	%f10,	%f11,	%f30
	andn	%g7,	%o5,	%g3
	set	0x2C, %o6
	lduha	[%l7 + %o6] 0x11,	%l2
	fba	%fcc0,	loop_2595
	tn	%icc,	0x0
	movl	%xcc,	%i1,	%o0
	fmovde	%icc,	%f18,	%f9
loop_2595:
	fmovrdne	%i0,	%f24,	%f10
	movrne	%l5,	%i7,	%i6
	tsubcctv	%o1,	0x183B,	%o3
	movle	%xcc,	%o7,	%g4
	fmovrslz	%g2,	%f29,	%f25
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i5
	wr	%g0,	0xea,	%asi
	stha	%g1,	[%l7 + 0x5E] %asi
	membar	#Sync
	ba,a,pt	%xcc,	loop_2596
	array32	%i3,	%o2,	%i2
	bleu,a,pt	%xcc,	loop_2597
	sll	%o6,	%l4,	%l1
loop_2596:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i4
loop_2597:
	sllx	%l6,	0x0A,	%l3
	movcs	%xcc,	%l0,	%o4
	sdiv	%g5,	0x0B1B,	%g7
	taddcc	%g3,	0x138B,	%o5
	alignaddrl	%i1,	%l2,	%o0
	movrgz	%l5,	%i7,	%i0
	fmovrsne	%i6,	%f25,	%f26
	fmovdl	%icc,	%f28,	%f5
	srax	%o1,	0x1E,	%o3
	sub	%o7,	%g4,	%g2
	movn	%icc,	%i5,	%i3
	movvs	%xcc,	%o2,	%i2
	ta	%icc,	0x6
	mova	%xcc,	%g1,	%l4
	subc	%o6,	%l1,	%i4
	bvs	%xcc,	loop_2598
	edge8n	%l6,	%g6,	%l3
	sdiv	%o4,	0x16A7,	%g5
	movn	%xcc,	%l0,	%g3
loop_2598:
	fsrc2s	%f18,	%f6
	xor	%o5,	0x171B,	%i1
	movpos	%xcc,	%g7,	%o0
	sir	0x0754
	movvs	%icc,	%l5,	%i7
	add	%l2,	0x005E,	%i0
	std	%f12,	[%l7 + 0x28]
	addccc	%o1,	0x1BE5,	%i6
	sdiv	%o7,	0x0453,	%g4
	te	%xcc,	0x1
	set	0x0C, %l1
	ldsba	[%l7 + %l1] 0x11,	%g2
	xor	%i5,	%o3,	%o2
	fand	%f22,	%f0,	%f20
	membar	0x6E
	movpos	%icc,	%i3,	%i2
	edge32l	%g1,	%o6,	%l4
	sir	0x05EB
	movg	%icc,	%l1,	%i4
	bn	loop_2599
	tl	%icc,	0x5
	movn	%icc,	%l6,	%l3
	sub	%o4,	0x029A,	%g5
loop_2599:
	orn	%g6,	0x04CA,	%l0
	array32	%o5,	%g3,	%i1
	movvc	%icc,	%o0,	%l5
	fpsub32s	%f8,	%f12,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i7,	[%l7 + 0x68]
	fpadd32s	%f8,	%f8,	%f18
	fmovspos	%icc,	%f28,	%f20
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l2
	movleu	%xcc,	%g7,	%i0
	fzeros	%f26
	fmuld8ulx16	%f15,	%f21,	%f26
	move	%icc,	%o1,	%o7
	array32	%g4,	%i6,	%g2
	movle	%xcc,	%i5,	%o2
	fmovdpos	%xcc,	%f7,	%f20
	movg	%icc,	%o3,	%i3
	fmuld8ulx16	%f5,	%f8,	%f22
	fpadd32	%f18,	%f28,	%f4
	srax	%i2,	%o6,	%g1
	tgu	%xcc,	0x3
	fmovspos	%icc,	%f28,	%f30
	movvs	%icc,	%l4,	%i4
	fmul8sux16	%f28,	%f22,	%f22
	movge	%icc,	%l6,	%l1
	bvc,pn	%icc,	loop_2600
	move	%icc,	%l3,	%g5
	andncc	%o4,	%g6,	%o5
	movrgz	%l0,	0x208,	%g3
loop_2600:
	movrlz	%i1,	%l5,	%o0
	fmovdpos	%xcc,	%f5,	%f12
	fpadd32s	%f16,	%f12,	%f1
	fmul8x16au	%f18,	%f18,	%f20
	xorcc	%l2,	0x09B1,	%i7
	orcc	%g7,	0x0859,	%o1
	movgu	%xcc,	%i0,	%g4
	tleu	%icc,	0x3
	tne	%xcc,	0x1
	umul	%o7,	0x1C47,	%i6
	tleu	%icc,	0x3
	fbge	%fcc0,	loop_2601
	edge16ln	%g2,	%i5,	%o2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
loop_2601:
	ble,a	%icc,	loop_2602
	nop
	setx	loop_2603,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc1	%f16,	%f18
	brlez	%i3,	loop_2604
loop_2602:
	andn	%o6,	%i2,	%l4
loop_2603:
	fcmple16	%f22,	%f4,	%i4
	movrgez	%l6,	%l1,	%g1
loop_2604:
	edge16l	%l3,	%g5,	%g6
	sll	%o4,	0x0F,	%l0
	fmovdgu	%xcc,	%f18,	%f8
	fornot2	%f4,	%f26,	%f30
	fblg,a	%fcc2,	loop_2605
	fmovsle	%xcc,	%f27,	%f14
	fpsub32	%f20,	%f28,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2605:
	fmovdgu	%xcc,	%f20,	%f26
	movvs	%icc,	%g3,	%i1
	fbuge,a	%fcc1,	loop_2606
	fmovrslez	%o5,	%f27,	%f0
	fnand	%f10,	%f0,	%f2
	edge8ln	%o0,	%l5,	%l2
loop_2606:
	subc	%g7,	0x1397,	%o1
	edge32n	%i0,	%i7,	%g4
	movne	%icc,	%i6,	%o7
	fpsub32	%f18,	%f24,	%f20
	fbug	%fcc3,	loop_2607
	andn	%i5,	0x175B,	%o2
	fcmple32	%f12,	%f2,	%g2
	fzero	%f12
loop_2607:
	brz,a	%o3,	loop_2608
	movg	%xcc,	%i3,	%i2
	fone	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2608:
	nop
	set	0x44, %l6
	ldswa	[%l7 + %l6] 0x89,	%l4
	movrgez	%i4,	%l6,	%o6
	xorcc	%g1,	0x0741,	%l1
	call	loop_2609
	fbe	%fcc2,	loop_2610
	fsrc2	%f20,	%f2
	fmovspos	%icc,	%f12,	%f14
loop_2609:
	ldub	[%l7 + 0x2E],	%l3
loop_2610:
	nop
	set	0x2C, %g2
	sta	%f19,	[%l7 + %g2] 0x04
	fsrc1	%f14,	%f8
	fcmps	%fcc0,	%f7,	%f16
	std	%g6,	[%l7 + 0x30]
	or	%o4,	0x119F,	%l0
	fbug	%fcc2,	loop_2611
	sub	%g5,	%i1,	%o5
	movge	%xcc,	%g3,	%o0
	move	%xcc,	%l2,	%g7
loop_2611:
	tne	%icc,	0x5
	fmovdl	%icc,	%f23,	%f29
	fpadd32	%f28,	%f0,	%f18
	fandnot2	%f30,	%f8,	%f10
	fbu,a	%fcc3,	loop_2612
	fbne,a	%fcc3,	loop_2613
	brlez	%l5,	loop_2614
	addccc	%o1,	0x032B,	%i0
loop_2612:
	fnot2	%f20,	%f20
loop_2613:
	subcc	%i7,	0x14F3,	%i6
loop_2614:
	smulcc	%o7,	%g4,	%o2
	umul	%g2,	0x0700,	%o3
	addcc	%i5,	0x1477,	%i3
	movl	%xcc,	%l4,	%i4
	bg,a,pn	%icc,	loop_2615
	edge32	%l6,	%i2,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x04,	%o6,	%l1
loop_2615:
	taddcc	%l3,	0x060B,	%g6
	movcs	%xcc,	%o4,	%g5
	nop
	set	0x6C, %g6
	lduh	[%l7 + %g6],	%i1
	fba,a	%fcc2,	loop_2616
	fnand	%f22,	%f6,	%f20
	movrlez	%o5,	0x076,	%g3
	fsrc2s	%f4,	%f6
loop_2616:
	subc	%o0,	%l2,	%l0
	fmovsl	%icc,	%f16,	%f11
	tg	%icc,	0x0
	movgu	%icc,	%l5,	%g7
	tgu	%icc,	0x3
	srlx	%i0,	%o1,	%i7
	sdiv	%o7,	0x19EE,	%i6
	pdist	%f18,	%f6,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x6
	sdivcc	%o2,	0x16EA,	%g2
	membar	0x57
	subccc	%g4,	%i5,	%i3
	fmovsle	%xcc,	%f2,	%f3
	sll	%l4,	0x1B,	%o3
	orncc	%l6,	0x1AE4,	%i4
	xorcc	%g1,	0x1AE8,	%i2
	sdiv	%o6,	0x0C9F,	%l3
	fexpand	%f7,	%f24
	tsubcctv	%l1,	%g6,	%o4
	movg	%xcc,	%i1,	%g5
	andn	%g3,	%o0,	%l2
	bleu	%xcc,	loop_2617
	fpsub16s	%f8,	%f15,	%f29
	edge8l	%l0,	%l5,	%g7
	subc	%i0,	%o1,	%o5
loop_2617:
	fbule,a	%fcc2,	loop_2618
	fmovde	%xcc,	%f12,	%f18
	edge16	%o7,	%i6,	%i7
	ta	%xcc,	0x2
loop_2618:
	fbu	%fcc1,	loop_2619
	tvc	%icc,	0x5
	tge	%xcc,	0x3
	movpos	%xcc,	%o2,	%g2
loop_2619:
	bvs,pt	%xcc,	loop_2620
	movcc	%xcc,	%g4,	%i5
	udiv	%i3,	0x1BD9,	%o3
	edge8ln	%l4,	%l6,	%g1
loop_2620:
	alignaddr	%i2,	%i4,	%o6
	edge16ln	%l3,	%g6,	%o4
	fmovdneg	%xcc,	%f5,	%f13
	movle	%xcc,	%i1,	%l1
	edge8	%g5,	%g3,	%o0
	addcc	%l0,	%l2,	%g7
	edge16	%l5,	%i0,	%o5
	fmovdne	%xcc,	%f23,	%f22
	fmovsgu	%xcc,	%f16,	%f22
	movleu	%xcc,	%o7,	%o1
	fnors	%f28,	%f25,	%f24
	edge16l	%i6,	%o2,	%g2
	move	%xcc,	%i7,	%g4
	edge32l	%i5,	%o3,	%i3
	bg,pn	%xcc,	loop_2621
	tge	%xcc,	0x5
	fbge,a	%fcc2,	loop_2622
	popc	%l6,	%l4
loop_2621:
	ba,pt	%icc,	loop_2623
	fmovdpos	%xcc,	%f31,	%f23
loop_2622:
	smul	%i2,	%i4,	%o6
	movrgez	%l3,	%g6,	%g1
loop_2623:
	tne	%icc,	0x6
	fmovdgu	%icc,	%f21,	%f31
	tvc	%xcc,	0x4
	brlz	%o4,	loop_2624
	tvs	%xcc,	0x7
	subcc	%i1,	%g5,	%l1
	fbge	%fcc0,	loop_2625
loop_2624:
	movrgez	%g3,	0x049,	%o0
	xor	%l2,	0x0C9A,	%l0
	set	0x54, %o5
	ldswa	[%l7 + %o5] 0x80,	%l5
loop_2625:
	mulscc	%g7,	%o5,	%i0
	be	%icc,	loop_2626
	orncc	%o1,	0x04EC,	%i6
	sub	%o2,	0x1BE1,	%o7
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
loop_2626:
	movne	%xcc,	%i7,	%g2
	movcs	%icc,	%i5,	%g4
	tleu	%icc,	0x6
	swap	[%l7 + 0x3C],	%i3
	movpos	%xcc,	%o3,	%l6
	movgu	%icc,	%i2,	%i4
	movn	%icc,	%o6,	%l3
	tge	%xcc,	0x4
	fcmple16	%f2,	%f8,	%g6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l4
	add	%o4,	0x04BE,	%i1
	ld	[%l7 + 0x70],	%f17
	st	%f1,	[%l7 + 0x3C]
	andncc	%g1,	%g5,	%g3
	fmovrsgez	%o0,	%f20,	%f13
	sllx	%l1,	%l0,	%l2
	xnor	%g7,	%l5,	%i0
	fbn,a	%fcc3,	loop_2627
	edge8l	%o5,	%i6,	%o1
	movge	%icc,	%o2,	%i7
	tge	%icc,	0x2
loop_2627:
	ba	loop_2628
	udiv	%o7,	0x07D3,	%g2
	edge16	%g4,	%i3,	%o3
	xorcc	%i5,	%l6,	%i2
loop_2628:
	tpos	%xcc,	0x1
	movn	%xcc,	%i4,	%l3
	fnegd	%f24,	%f0
	bge,pn	%icc,	loop_2629
	fcmpes	%fcc1,	%f15,	%f23
	ld	[%l7 + 0x10],	%f20
	sll	%g6,	0x03,	%l4
loop_2629:
	alignaddrl	%o6,	%o4,	%i1
	fbe,a	%fcc1,	loop_2630
	fornot2	%f24,	%f24,	%f2
	fmovsn	%icc,	%f20,	%f29
	edge8n	%g1,	%g3,	%o0
loop_2630:
	move	%icc,	%g5,	%l1
	smulcc	%l0,	%g7,	%l5
	movge	%icc,	%i0,	%o5
	sethi	0x1E76,	%i6
	movrlz	%l2,	%o1,	%i7
	edge32l	%o2,	%g2,	%o7
	fpadd32s	%f15,	%f3,	%f2
	edge16	%i3,	%g4,	%i5
	edge32	%o3,	%i2,	%i4
	fmovdpos	%xcc,	%f27,	%f5
	fmovrse	%l6,	%f30,	%f4
	lduw	[%l7 + 0x10],	%l3
	sdivcc	%g6,	0x1735,	%o6
	fcmple16	%f14,	%f18,	%l4
	srax	%o4,	0x12,	%g1
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x14] %asi
	subcc	%i1,	0x1A91,	%o0
	wr	%g0,	0x89,	%asi
	stxa	%g5,	[%l7 + 0x70] %asi
	srlx	%g3,	%l1,	%l0
	fmul8x16al	%f15,	%f8,	%f16
	edge8ln	%g7,	%l5,	%o5
	fbug,a	%fcc3,	loop_2631
	sir	0x1F6C
	fcmpne32	%f24,	%f26,	%i0
	fnot1s	%f28,	%f31
loop_2631:
	nop
	set	0x46, %i7
	stha	%l2,	[%l7 + %i7] 0x23
	membar	#Sync
	fmovdneg	%icc,	%f24,	%f14
	fsrc1	%f12,	%f24
	or	%i6,	%o1,	%o2
	fmovdg	%icc,	%f27,	%f16
	fbue	%fcc2,	loop_2632
	subcc	%g2,	0x1F27,	%i7
	tgu	%icc,	0x2
	tcs	%icc,	0x7
loop_2632:
	fxnors	%f9,	%f14,	%f19
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x80,	%o7
	addcc	%g4,	0x1A9D,	%i3
	movrgz	%i5,	%o3,	%i2
	faligndata	%f16,	%f2,	%f10
	mulscc	%l6,	%i4,	%l3
	tpos	%xcc,	0x1
	edge8n	%g6,	%o6,	%o4
	tneg	%icc,	0x1
	bn,pn	%xcc,	loop_2633
	edge32	%g1,	%i1,	%l4
	fmovdge	%xcc,	%f13,	%f17
	membar	0x64
loop_2633:
	mulx	%o0,	%g3,	%g5
	taddcctv	%l1,	0x0CE9,	%g7
	edge32l	%l0,	%l5,	%o5
	tg	%icc,	0x6
	sll	%i0,	%l2,	%i6
	nop
	setx loop_2634, %l0, %l1
	jmpl %l1, %o1
	movn	%icc,	%o2,	%g2
	xor	%i7,	0x0272,	%g4
	edge16l	%o7,	%i3,	%o3
loop_2634:
	sth	%i2,	[%l7 + 0x26]
	brz	%l6,	loop_2635
	subccc	%i5,	0x1A26,	%i4
	movl	%icc,	%g6,	%l3
	fmovdg	%icc,	%f0,	%f11
loop_2635:
	orcc	%o4,	0x0AE3,	%o6
	for	%f28,	%f20,	%f22
	stw	%i1,	[%l7 + 0x48]
	fpack32	%f4,	%f24,	%f8
	ldd	[%l7 + 0x60],	%f6
	for	%f10,	%f26,	%f14
	addc	%l4,	0x0B11,	%g1
	orn	%g3,	0x0AC9,	%g5
	fmovda	%xcc,	%f31,	%f0
	movcc	%xcc,	%o0,	%l1
	mulx	%g7,	0x1036,	%l0
	fpack32	%f28,	%f12,	%f20
	brz,a	%o5,	loop_2636
	movcs	%icc,	%l5,	%l2
	movre	%i6,	0x24F,	%o1
	array32	%o2,	%g2,	%i0
loop_2636:
	smul	%g4,	%o7,	%i3
	fandnot1s	%f8,	%f30,	%f19
	nop
	setx	loop_2637,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16au	%f15,	%f29,	%f10
	ldx	[%l7 + 0x40],	%i7
	addc	%i2,	%l6,	%i5
loop_2637:
	xor	%i4,	%g6,	%l3
	fmovrslez	%o3,	%f13,	%f14
	stbar
	set	0x4C, %i3
	stwa	%o4,	[%l7 + %i3] 0x04
	andcc	%o6,	0x0355,	%i1
	xorcc	%g1,	%g3,	%l4
	movrlez	%g5,	%o0,	%l1
	fbo	%fcc3,	loop_2638
	flush	%l7 + 0x40
	fbne	%fcc0,	loop_2639
	andn	%l0,	0x030F,	%g7
loop_2638:
	fmovsge	%icc,	%f3,	%f30
	wr	%g0,	0x2b,	%asi
	stha	%o5,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2639:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%l2
	fzero	%f0
	fmovrsne	%i6,	%f18,	%f12
	wr	%g0,	0x4f,	%asi
	stxa	%o1,	[%g0 + 0x20] %asi
	fandnot1s	%f2,	%f24,	%f24
	fornot1s	%f13,	%f21,	%f10
	addc	%o2,	0x12AF,	%l5
	fmovsvs	%icc,	%f5,	%f8
	fnot1s	%f3,	%f19
	fmul8sux16	%f22,	%f28,	%f20
	sethi	0x147C,	%g2
	edge32ln	%i0,	%g4,	%o7
	array16	%i7,	%i3,	%i2
	sll	%l6,	%i5,	%g6
	alignaddrl	%i4,	%l3,	%o4
	udiv	%o6,	0x12E9,	%o3
	bvs,a,pt	%icc,	loop_2640
	addcc	%i1,	%g1,	%l4
	lduh	[%l7 + 0x68],	%g5
	movle	%xcc,	%g3,	%o0
loop_2640:
	movgu	%xcc,	%l1,	%l0
	fmovdleu	%xcc,	%f24,	%f15
	fbne	%fcc0,	loop_2641
	fcmpgt32	%f6,	%f10,	%o5
	tcc	%icc,	0x2
	sra	%g7,	0x04,	%i6
loop_2641:
	fblg,a	%fcc3,	loop_2642
	fbn	%fcc2,	loop_2643
	fone	%f20
	movn	%icc,	%o1,	%o2
loop_2642:
	smulcc	%l2,	%l5,	%i0
loop_2643:
	udivx	%g2,	0x08A3,	%g4
	array8	%o7,	%i7,	%i2
	bvc,a,pn	%xcc,	loop_2644
	sir	0x02BE
	srlx	%l6,	0x08,	%i5
	array16	%i3,	%i4,	%l3
loop_2644:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x5D, %i0
	lduba	[%l7 + %i0] 0x80,	%o4
	fblg,a	%fcc3,	loop_2645
	fcmpne32	%f2,	%f14,	%g6
	subc	%o6,	0x1DE8,	%i1
	fpsub16s	%f2,	%f11,	%f14
loop_2645:
	movgu	%xcc,	%o3,	%l4
	srax	%g5,	0x18,	%g1
	ldstub	[%l7 + 0x37],	%g3
	bge,pn	%xcc,	loop_2646
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o0,	%l1,	%l0
	andcc	%g7,	%i6,	%o1
loop_2646:
	fcmpgt32	%f18,	%f18,	%o2
	edge8l	%l2,	%o5,	%i0
	fmovrdgz	%g2,	%f24,	%f18
	brnz,a	%g4,	loop_2647
	and	%l5,	%o7,	%i2
	subccc	%l6,	0x00DA,	%i5
	xnor	%i7,	0x1ECD,	%i4
loop_2647:
	fpack16	%f12,	%f15
	edge16	%l3,	%i3,	%o4
	fbue	%fcc0,	loop_2648
	addcc	%g6,	%o6,	%i1
	fmovse	%icc,	%f22,	%f30
	smul	%o3,	0x11A9,	%l4
loop_2648:
	edge16l	%g1,	%g5,	%o0
	movneg	%xcc,	%g3,	%l1
	tcs	%xcc,	0x0
	brnz	%g7,	loop_2649
	fcmped	%fcc1,	%f26,	%f8
	fxor	%f6,	%f14,	%f2
	fblg	%fcc0,	loop_2650
loop_2649:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l0,	%o1,	%o2
	fmovrde	%l2,	%f20,	%f4
loop_2650:
	xorcc	%i6,	0x0FAF,	%i0
	ldx	[%l7 + 0x10],	%g2
	movrlz	%o5,	%l5,	%o7
	fmovdg	%icc,	%f21,	%f12
	movcc	%xcc,	%g4,	%i2
	tvc	%icc,	0x2
	fmovde	%icc,	%f20,	%f8
	xnorcc	%l6,	%i7,	%i5
	bn	loop_2651
	brnz	%i4,	loop_2652
	te	%icc,	0x1
	fcmpne16	%f2,	%f2,	%l3
loop_2651:
	xnorcc	%o4,	0x0DEB,	%g6
loop_2652:
	movrlez	%i3,	0x25E,	%i1
	orncc	%o6,	%o3,	%g1
	te	%icc,	0x4
	movl	%xcc,	%g5,	%o0
	taddcctv	%g3,	0x1D9F,	%l1
	bvs,a,pt	%icc,	loop_2653
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_2654
	fcmps	%fcc2,	%f5,	%f4
loop_2653:
	fbge	%fcc0,	loop_2655
	ba	loop_2656
loop_2654:
	fmovsne	%icc,	%f19,	%f25
	stbar
loop_2655:
	fcmple32	%f30,	%f14,	%g7
loop_2656:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x10] %asi,	%l0
	fble	%fcc0,	loop_2657
	fmovdge	%icc,	%f18,	%f16
	fones	%f12
	tn	%icc,	0x3
loop_2657:
	addcc	%l4,	%o2,	%l2
	fbue	%fcc2,	loop_2658
	fmovrde	%i6,	%f6,	%f14
	taddcctv	%o1,	%i0,	%o5
	addcc	%l5,	%o7,	%g4
loop_2658:
	nop
	wr	%g0,	0x81,	%asi
	stwa	%g2,	[%l7 + 0x6C] %asi
	movge	%icc,	%l6,	%i2
	ldsw	[%l7 + 0x64],	%i5
	movvc	%xcc,	%i4,	%l3
	xor	%o4,	0x10D3,	%g6
	ldsw	[%l7 + 0x10],	%i7
	tg	%icc,	0x6
	fmovda	%icc,	%f13,	%f28
	movn	%icc,	%i3,	%i1
	bneg,pn	%icc,	loop_2659
	fbuge,a	%fcc1,	loop_2660
	tne	%icc,	0x3
	fandnot1	%f4,	%f4,	%f8
loop_2659:
	edge8	%o3,	%o6,	%g5
loop_2660:
	bneg,pn	%xcc,	loop_2661
	bgu,pn	%xcc,	loop_2662
	addccc	%g1,	0x0897,	%o0
	alignaddr	%l1,	%g3,	%g7
loop_2661:
	andn	%l0,	%l4,	%o2
loop_2662:
	fabss	%f4,	%f18
	andn	%l2,	%i6,	%o1
	umul	%i0,	%l5,	%o5
	sir	0x0210
	fornot2s	%f13,	%f22,	%f23
	and	%g4,	0x158A,	%g2
	andn	%o7,	%i2,	%l6
	andn	%i4,	0x069C,	%i5
	fmovdgu	%xcc,	%f7,	%f9
	edge16l	%l3,	%g6,	%i7
	movleu	%icc,	%i3,	%i1
	fmuld8sux16	%f2,	%f24,	%f12
	bge	loop_2663
	ldsh	[%l7 + 0x08],	%o4
	fbule,a	%fcc1,	loop_2664
	movrgz	%o6,	%g5,	%o3
loop_2663:
	fmovsl	%icc,	%f15,	%f18
	smul	%g1,	0x16D6,	%l1
loop_2664:
	andncc	%g3,	%o0,	%l0
	nop
	setx loop_2665, %l0, %l1
	jmpl %l1, %l4
	mulx	%g7,	0x11B4,	%l2
	addcc	%o2,	%o1,	%i0
	fpackfix	%f30,	%f23
loop_2665:
	tgu	%icc,	0x7
	bvs	%icc,	loop_2666
	movgu	%xcc,	%l5,	%o5
	movcc	%icc,	%i6,	%g2
	add	%g4,	0x0EEF,	%i2
loop_2666:
	fmovdgu	%xcc,	%f15,	%f28
	fornot1	%f16,	%f22,	%f24
	array32	%o7,	%l6,	%i5
	smulcc	%i4,	%l3,	%g6
	tn	%icc,	0x6
	taddcc	%i7,	0x1A06,	%i1
	ld	[%l7 + 0x5C],	%f17
	tcc	%xcc,	0x2
	fmovscc	%xcc,	%f10,	%f6
	smulcc	%i3,	%o6,	%g5
	movrgez	%o4,	0x216,	%o3
	edge32	%g1,	%g3,	%l1
	or	%l0,	0x168C,	%l4
	tn	%xcc,	0x4
	tvc	%icc,	0x7
	xnor	%o0,	0x1DDF,	%l2
	edge8ln	%g7,	%o2,	%i0
	move	%xcc,	%l5,	%o1
	fcmpne16	%f10,	%f22,	%i6
	move	%icc,	%g2,	%o5
	tle	%xcc,	0x7
	addc	%i2,	0x19F1,	%g4
	movre	%o7,	0x2F5,	%i5
	edge16n	%i4,	%l6,	%l3
	tsubcctv	%i7,	0x16A4,	%g6
	srax	%i3,	0x11,	%o6
	xorcc	%i1,	0x09B1,	%g5
	tgu	%xcc,	0x1
	movcs	%xcc,	%o4,	%g1
	fpadd32s	%f11,	%f2,	%f17
	tgu	%xcc,	0x1
	fnands	%f3,	%f5,	%f17
	xnor	%o3,	0x1F15,	%l1
	stx	%g3,	[%l7 + 0x08]
	movpos	%icc,	%l0,	%o0
	edge32	%l4,	%g7,	%o2
	fmovdvc	%xcc,	%f18,	%f13
	addc	%l2,	%i0,	%l5
	fzero	%f4
	addccc	%i6,	0x008A,	%g2
	brnz	%o1,	loop_2667
	addccc	%o5,	%i2,	%o7
	orncc	%i5,	0x03A9,	%g4
	brgz	%i4,	loop_2668
loop_2667:
	sdivcc	%l3,	0x00B3,	%l6
	fornot1	%f0,	%f8,	%f18
	fcmpgt16	%f26,	%f24,	%g6
loop_2668:
	ba,pt	%xcc,	loop_2669
	fmovscs	%xcc,	%f14,	%f29
	andncc	%i3,	%i7,	%o6
	tsubcctv	%i1,	0x0BE7,	%g5
loop_2669:
	or	%o4,	%g1,	%o3
	te	%xcc,	0x3
	bne,a,pn	%xcc,	loop_2670
	alignaddr	%l1,	%l0,	%g3
	smul	%l4,	%g7,	%o0
	edge16n	%l2,	%i0,	%o2
loop_2670:
	tcs	%icc,	0x7
	std	%l4,	[%l7 + 0x30]
	movrlez	%g2,	%i6,	%o1
	edge32ln	%i2,	%o5,	%i5
	sir	0x1275
	lduw	[%l7 + 0x0C],	%g4
	bg,a,pn	%icc,	loop_2671
	move	%icc,	%i4,	%o7
	flush	%l7 + 0x28
	fmovrdgez	%l6,	%f0,	%f0
loop_2671:
	add	%g6,	%l3,	%i7
	fnot2s	%f13,	%f26
	xor	%o6,	%i1,	%i3
	movg	%xcc,	%g5,	%o4
	tleu	%icc,	0x4
	ldsh	[%l7 + 0x10],	%o3
	edge8n	%l1,	%g1,	%l0
	sir	0x090E
	nop
	setx loop_2672, %l0, %l1
	jmpl %l1, %g3
	tle	%xcc,	0x1
	ta	%xcc,	0x6
	smul	%l4,	0x0C34,	%g7
loop_2672:
	sllx	%l2,	%o0,	%i0
	andn	%l5,	0x121C,	%g2
	fcmpeq16	%f28,	%f28,	%o2
	edge32l	%i6,	%o1,	%i2
	fmul8x16au	%f21,	%f0,	%f28
	srax	%o5,	%g4,	%i5
	ld	[%l7 + 0x5C],	%f22
	tne	%xcc,	0x4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bl,a	loop_2673
	fexpand	%f16,	%f18
	alignaddr	%o7,	%i4,	%g6
	bcs,a,pn	%xcc,	loop_2674
loop_2673:
	movgu	%xcc,	%l3,	%i7
	movcc	%xcc,	%o6,	%i1
	fbl	%fcc0,	loop_2675
loop_2674:
	bne,pt	%xcc,	loop_2676
	edge8ln	%i3,	%g5,	%o4
	edge8l	%o3,	%l6,	%g1
loop_2675:
	sdivcc	%l0,	0x0BAF,	%l1
loop_2676:
	call	loop_2677
	sethi	0x1E5A,	%l4
	fmovscc	%icc,	%f31,	%f27
	ba,pn	%xcc,	loop_2678
loop_2677:
	sdivcc	%g7,	0x0D02,	%l2
	fbul,a	%fcc2,	loop_2679
	brlez,a	%o0,	loop_2680
loop_2678:
	fbuge,a	%fcc1,	loop_2681
	fnegd	%f2,	%f16
loop_2679:
	movcc	%icc,	%i0,	%l5
loop_2680:
	fbu,a	%fcc2,	loop_2682
loop_2681:
	fmovdne	%icc,	%f16,	%f18
	tle	%xcc,	0x0
	alignaddrl	%g3,	%o2,	%g2
loop_2682:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i6,	%o1
	fmovrdgz	%o5,	%f26,	%f20
	srlx	%i2,	%g4,	%i5
	fmovsge	%icc,	%f29,	%f10
	edge32n	%i4,	%g6,	%o7
	xnorcc	%l3,	%o6,	%i1
	fmovsn	%icc,	%f13,	%f13
	tn	%xcc,	0x5
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x10,	%i6
	movne	%xcc,	%i3,	%g5
	sethi	0x1364,	%o3
	fbe,a	%fcc1,	loop_2683
	edge32ln	%o4,	%g1,	%l0
	movrlz	%l6,	0x077,	%l1
	srl	%g7,	%l4,	%o0
loop_2683:
	subc	%i0,	%l5,	%l2
	subc	%g3,	0x0430,	%g2
	bcs,a	%icc,	loop_2684
	movgu	%xcc,	%i6,	%o1
	ldx	[%l7 + 0x58],	%o2
	movpos	%icc,	%o5,	%i2
loop_2684:
	taddcctv	%i5,	0x1E7F,	%g4
	stbar
	or	%i4,	%o7,	%l3
	sll	%g6,	0x17,	%i1
	bshuffle	%f8,	%f0,	%f30
	ldsh	[%l7 + 0x42],	%i7
	movvc	%icc,	%o6,	%g5
	fnegd	%f16,	%f12
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%o3
	srax	%i3,	%g1,	%o4
	srax	%l6,	0x14,	%l1
	fmul8x16	%f0,	%f16,	%f24
	movge	%icc,	%g7,	%l4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	edge16	%o0,	%l5,	%l2
	fbn	%fcc2,	loop_2685
	ldsw	[%l7 + 0x44],	%g3
	bvs	%xcc,	loop_2686
	alignaddr	%g2,	%i6,	%i0
loop_2685:
	fandnot2	%f28,	%f28,	%f24
	fmovsge	%icc,	%f18,	%f28
loop_2686:
	movleu	%xcc,	%o1,	%o5
	movge	%xcc,	%o2,	%i5
	array32	%g4,	%i4,	%i2
	bvs	%xcc,	loop_2687
	fpsub32	%f30,	%f12,	%f26
	sth	%l3,	[%l7 + 0x38]
	udiv	%g6,	0x0877,	%o7
loop_2687:
	fmovsleu	%icc,	%f5,	%f31
	movrgez	%i1,	%i7,	%o6
	fmul8sux16	%f14,	%f16,	%f8
	sdivx	%g5,	0x0FAB,	%o3
	udivcc	%i3,	0x11EC,	%g1
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	fxor	%f18,	%f24,	%f28
	brgez,a	%o4,	loop_2688
	add	%g7,	0x196F,	%l4
	orncc	%l0,	0x10B5,	%l1
	orn	%l5,	0x194E,	%o0
loop_2688:
	srlx	%l2,	0x1E,	%g3
	tle	%icc,	0x6
	ldd	[%l7 + 0x30],	%g2
	fnot2s	%f21,	%f19
	andn	%i0,	%i6,	%o1
	bneg	%xcc,	loop_2689
	fsrc1s	%f8,	%f11
	orcc	%o5,	0x0AB1,	%o2
	addc	%g4,	%i4,	%i2
loop_2689:
	fmovrsgz	%i5,	%f13,	%f15
	nop
	set	0x4C, %o4
	stw	%l3,	[%l7 + %o4]
	fmuld8sux16	%f25,	%f19,	%f6
	membar	0x29
	tn	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g6,	%i1,	%o7
	fmovsa	%icc,	%f3,	%f0
	addc	%i7,	0x0906,	%o6
	fmovrdlez	%o3,	%f14,	%f10
	move	%icc,	%i3,	%g5
	movcs	%xcc,	%g1,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l6,	%l4
	movge	%xcc,	%g7,	%l1
	tn	%xcc,	0x7
	pdist	%f0,	%f18,	%f0
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x80] %asi,	%l0
	movrgez	%o0,	0x295,	%l5
	edge8l	%l2,	%g3,	%g2
	fandnot1	%f0,	%f4,	%f8
	membar	0x6D
	ldsb	[%l7 + 0x0B],	%i0
	edge16	%o1,	%i6,	%o2
	udiv	%g4,	0x09FA,	%o5
	sdiv	%i4,	0x175E,	%i5
	fbn,a	%fcc0,	loop_2690
	fnors	%f31,	%f21,	%f23
	udivx	%i2,	0x0665,	%l3
	bshuffle	%f30,	%f10,	%f30
loop_2690:
	brnz,a	%i1,	loop_2691
	srlx	%o7,	0x19,	%g6
	tvc	%icc,	0x1
	fcmps	%fcc2,	%f25,	%f16
loop_2691:
	fmovda	%icc,	%f17,	%f5
	taddcctv	%o6,	%i7,	%o3
	sra	%g5,	0x1B,	%i3
	movrne	%g1,	0x102,	%o4
	std	%i6,	[%l7 + 0x28]
	sub	%l4,	%l1,	%l0
	edge8l	%o0,	%l5,	%g7
	fpsub16	%f20,	%f28,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g3,	%g2
	movgu	%icc,	%i0,	%l2
	membar	0x0B
	tn	%icc,	0x5
	set	0x4C, %i2
	lduha	[%l7 + %i2] 0x15,	%o1
	bcc,pt	%xcc,	loop_2692
	edge16n	%i6,	%o2,	%g4
	add	%o5,	%i4,	%i5
	ta	%xcc,	0x5
loop_2692:
	addccc	%i2,	0x1A6B,	%i1
	bleu,pt	%xcc,	loop_2693
	movg	%xcc,	%o7,	%g6
	fmovdcs	%xcc,	%f14,	%f2
	sll	%o6,	%l3,	%i7
loop_2693:
	add	%g5,	0x0788,	%i3
	fmovrdlz	%o3,	%f0,	%f20
	alignaddrl	%g1,	%o4,	%l6
	set	0x4C, %l0
	lduwa	[%l7 + %l0] 0x04,	%l1
	movgu	%xcc,	%l0,	%o0
	bn	%xcc,	loop_2694
	fmovsneg	%xcc,	%f30,	%f14
	udiv	%l4,	0x0676,	%l5
	udiv	%g3,	0x088D,	%g7
loop_2694:
	sethi	0x049B,	%i0
	tcs	%icc,	0x7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%o1
	bne	%icc,	loop_2695
	fmovrdgz	%i6,	%f22,	%f4
	mova	%xcc,	%l2,	%g4
	umul	%o2,	0x1B31,	%i4
loop_2695:
	srlx	%i5,	%o5,	%i2
	or	%o7,	%g6,	%i1
	movn	%icc,	%o6,	%l3
	fpadd32s	%f2,	%f28,	%f19
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrsgz	%g5,	%f22,	%f6
	fmul8x16al	%f30,	%f9,	%f30
	move	%xcc,	%i7,	%i3
	bgu,a,pn	%icc,	loop_2696
	srax	%g1,	0x1D,	%o4
	set	0x18, %l5
	stda	%o2,	[%l7 + %l5] 0x2f
	membar	#Sync
loop_2696:
	ldsh	[%l7 + 0x2A],	%l1
	udivcc	%l6,	0x0932,	%o0
	tsubcc	%l4,	%l0,	%g3
	movcc	%xcc,	%g7,	%l5
	andncc	%g2,	%o1,	%i6
	srlx	%l2,	0x15,	%i0
	brlez,a	%o2,	loop_2697
	edge16ln	%g4,	%i4,	%i5
	movrlez	%i2,	%o7,	%o5
	array32	%i1,	%g6,	%l3
loop_2697:
	tn	%icc,	0x0
	fbue	%fcc0,	loop_2698
	fmuld8ulx16	%f20,	%f27,	%f12
	xor	%g5,	0x1CCA,	%o6
	taddcctv	%i3,	0x0705,	%i7
loop_2698:
	fmovscc	%xcc,	%f25,	%f30
	sdivcc	%g1,	0x1BC7,	%o3
	tle	%xcc,	0x6
	movrgez	%l1,	%l6,	%o4
	movrgz	%o0,	%l0,	%g3
	array32	%g7,	%l5,	%g2
	edge16ln	%o1,	%i6,	%l4
	or	%l2,	0x0052,	%o2
	call	loop_2699
	movrlz	%i0,	%i4,	%g4
	tcc	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2699:
	tleu	%icc,	0x5
	fand	%f14,	%f16,	%f12
	movrgez	%i5,	%i2,	%o7
	fmul8x16al	%f24,	%f9,	%f4
	movvc	%icc,	%o5,	%i1
	fmovs	%f23,	%f11
	movgu	%xcc,	%g6,	%g5
	add	%l3,	%o6,	%i3
	or	%g1,	%i7,	%o3
	sll	%l6,	0x03,	%o4
	fbo,a	%fcc1,	loop_2700
	or	%o0,	%l0,	%g3
	mova	%xcc,	%g7,	%l5
	movgu	%icc,	%l1,	%g2
loop_2700:
	fbl	%fcc0,	loop_2701
	fornot1	%f22,	%f8,	%f4
	tcc	%xcc,	0x3
	tg	%icc,	0x1
loop_2701:
	movg	%icc,	%i6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o1,	%o2
	tcs	%xcc,	0x6
	edge8l	%l2,	%i4,	%i0
	brlez	%g4,	loop_2702
	tpos	%icc,	0x5
	std	%i2,	[%l7 + 0x78]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x19,	%i5,	%o7
loop_2702:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%i1,	[%l7 + 0x28] %asi
	tsubcc	%g6,	0x1889,	%o5
	fmovrsgz	%l3,	%f5,	%f13
	tn	%xcc,	0x0
	subccc	%o6,	0x0C50,	%g5
	movrgez	%i3,	%g1,	%o3
	add	%l6,	%o4,	%o0
	edge32ln	%l0,	%i7,	%g3
	movpos	%icc,	%l5,	%l1
	addc	%g7,	%g2,	%l4
	andncc	%o1,	%o2,	%i6
	sdivx	%i4,	0x12E1,	%i0
	fmovsge	%icc,	%f29,	%f23
	sra	%g4,	0x04,	%l2
	movvc	%xcc,	%i2,	%i5
	sdivcc	%o7,	0x1DC7,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g6,	%l3,	%o6
	brlz,a	%g5,	loop_2703
	membar	0x7F
	edge32ln	%i3,	%g1,	%o3
	ble,pt	%xcc,	loop_2704
loop_2703:
	ta	%icc,	0x2
	set	0x68, %g4
	stha	%o5,	[%l7 + %g4] 0xea
	membar	#Sync
loop_2704:
	fxnor	%f12,	%f2,	%f14
	movg	%icc,	%o4,	%o0
	nop
	setx	loop_2705,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot1	%f0,	%f4
	fornot1	%f26,	%f2,	%f20
	movvs	%icc,	%l0,	%l6
loop_2705:
	umulcc	%i7,	0x063E,	%l5
	fmul8ulx16	%f26,	%f18,	%f4
	set	0x16, %i1
	stba	%g3,	[%l7 + %i1] 0x89
	addccc	%l1,	%g7,	%l4
	fcmpes	%fcc2,	%f12,	%f12
	ta	%xcc,	0x7
	add	%o1,	0x1D25,	%g2
	movre	%i6,	0x2B5,	%i4
	tsubcc	%i0,	%o2,	%g4
	bvc,a,pt	%xcc,	loop_2706
	fpackfix	%f10,	%f22
	fpsub32	%f20,	%f18,	%f22
	fmuld8ulx16	%f23,	%f1,	%f20
loop_2706:
	subccc	%i2,	0x1ED3,	%i5
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x2c,	%l2
	edge16	%o7,	%g6,	%i1
	fbg,a	%fcc0,	loop_2707
	mulx	%o6,	0x1E7B,	%g5
	fbne,a	%fcc2,	loop_2708
	fmovsleu	%xcc,	%f9,	%f21
loop_2707:
	fzero	%f10
	fxors	%f9,	%f31,	%f4
loop_2708:
	st	%f22,	[%l7 + 0x58]
	alignaddrl	%l3,	%i3,	%o3
	bvs,pn	%icc,	loop_2709
	movl	%icc,	%o5,	%g1
	subccc	%o0,	0x10F7,	%o4
	prefetch	[%l7 + 0x24],	 0x0
loop_2709:
	tg	%xcc,	0x6
	brnz,a	%l0,	loop_2710
	tgu	%xcc,	0x0
	fxnors	%f16,	%f0,	%f21
	stb	%i7,	[%l7 + 0x1D]
loop_2710:
	srl	%l5,	%l6,	%g3
	orn	%l1,	0x081D,	%l4
	movvc	%xcc,	%o1,	%g2
	add	%g7,	%i4,	%i6
	andcc	%o2,	0x011C,	%i0
	movl	%icc,	%g4,	%i5
	movrlz	%i2,	0x014,	%o7
	bne,a	%xcc,	loop_2711
	flush	%l7 + 0x40
	tleu	%icc,	0x2
	pdist	%f10,	%f0,	%f8
loop_2711:
	fxor	%f14,	%f2,	%f10
	fpack32	%f2,	%f16,	%f18
	fbu,a	%fcc0,	loop_2712
	fmovrse	%l2,	%f2,	%f15
	tleu	%icc,	0x4
	edge16	%g6,	%i1,	%g5
loop_2712:
	udivx	%l3,	0x1582,	%i3
	srl	%o6,	%o5,	%o3
	movne	%xcc,	%g1,	%o4
	fmovsneg	%icc,	%f2,	%f5
	fmovscc	%xcc,	%f20,	%f4
	tvc	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7C, %o0
	ldswa	[%l7 + %o0] 0x15,	%l0
	fmovrdgez	%o0,	%f20,	%f26
	edge32ln	%l5,	%i7,	%l6
	tsubcctv	%g3,	%l4,	%o1
	fxor	%f2,	%f22,	%f16
	fmovrdgz	%g2,	%f30,	%f28
	movgu	%xcc,	%g7,	%i4
	fxor	%f16,	%f20,	%f16
	tle	%xcc,	0x1
	movl	%xcc,	%l1,	%o2
	fpadd16	%f24,	%f16,	%f30
	fornot1s	%f22,	%f24,	%f11
	movne	%icc,	%i6,	%i0
	tle	%icc,	0x4
	tneg	%xcc,	0x4
	fmovrdgz	%i5,	%f20,	%f24
	tgu	%xcc,	0x1
	andn	%g4,	0x0F85,	%i2
	tvc	%xcc,	0x5
	fbl,a	%fcc3,	loop_2713
	move	%icc,	%o7,	%l2
	bcs	%xcc,	loop_2714
	swap	[%l7 + 0x24],	%g6
loop_2713:
	fmovdgu	%icc,	%f27,	%f31
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x40] %asi,	%g5
loop_2714:
	fmovdn	%xcc,	%f16,	%f28
	ta	%icc,	0x4
	fmovdneg	%xcc,	%f1,	%f12
	umulcc	%l3,	0x1870,	%i3
	udivcc	%i1,	0x0451,	%o5
	sll	%o6,	%g1,	%o3
	fcmpeq32	%f12,	%f8,	%o4
	addc	%l0,	%l5,	%o0
	movrlz	%l6,	0x335,	%i7
	alignaddrl	%l4,	%o1,	%g3
	nop
	setx	loop_2715,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdlez	%g7,	%f0,	%f8
	tgu	%xcc,	0x2
	addc	%i4,	%g2,	%o2
loop_2715:
	srax	%l1,	0x07,	%i6
	fmul8ulx16	%f8,	%f20,	%f4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i5,	%i0
	taddcc	%i2,	0x1638,	%o7
	movre	%g4,	0x162,	%g6
	fbg	%fcc2,	loop_2716
	smulcc	%g5,	%l2,	%l3
	membar	0x2A
	fmovsneg	%icc,	%f31,	%f3
loop_2716:
	fnands	%f4,	%f6,	%f12
	fcmps	%fcc0,	%f17,	%f24
	tvs	%xcc,	0x4
	tvc	%xcc,	0x2
	orn	%i1,	0x040B,	%i3
	sub	%o5,	%g1,	%o3
	fbue,a	%fcc2,	loop_2717
	or	%o4,	0x1EA2,	%l0
	movcs	%icc,	%o6,	%o0
	brnz,a	%l6,	loop_2718
loop_2717:
	fmovrsgez	%l5,	%f6,	%f4
	smulcc	%i7,	%l4,	%o1
	array32	%g7,	%g3,	%i4
loop_2718:
	membar	0x20
	te	%icc,	0x1
	fmovscs	%xcc,	%f29,	%f1
	popc	%o2,	%g2
	udiv	%l1,	0x0C89,	%i5
	mulscc	%i0,	0x0447,	%i2
	sllx	%i6,	0x14,	%o7
	brnz	%g6,	loop_2719
	ldsh	[%l7 + 0x2E],	%g4
	tn	%icc,	0x6
	subccc	%l2,	0x1BBF,	%l3
loop_2719:
	edge16l	%i1,	%i3,	%g5
	or	%g1,	0x14D9,	%o5
	fbn	%fcc0,	loop_2720
	fandnot1	%f24,	%f22,	%f22
	fmovsvc	%icc,	%f0,	%f28
	tvc	%xcc,	0x0
loop_2720:
	taddcc	%o4,	0x06FF,	%o3
	sdiv	%o6,	0x13E7,	%l0
	alignaddr	%l6,	%l5,	%o0
	membar	0x53
	movcs	%xcc,	%i7,	%l4
	orcc	%o1,	0x1E57,	%g7
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	stb	%g3,	[%l7 + 0x3F]
	umul	%i4,	%o2,	%g2
	movrlez	%i5,	0x016,	%i0
	fmovse	%xcc,	%f9,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l1,	%i2,	%o7
	movcs	%icc,	%g6,	%g4
	andcc	%l2,	0x1198,	%i6
	te	%icc,	0x2
	set	0x5C, %o7
	sta	%f10,	[%l7 + %o7] 0x15
	fmovdn	%xcc,	%f4,	%f21
	movrgez	%l3,	0x035,	%i3
	fmovdvs	%icc,	%f20,	%f31
	mova	%xcc,	%i1,	%g5
	movleu	%icc,	%o5,	%o4
	brnz,a	%o3,	loop_2721
	tleu	%xcc,	0x6
	fmovsleu	%icc,	%f14,	%f23
	edge32	%g1,	%o6,	%l6
loop_2721:
	movge	%xcc,	%l5,	%o0
	fabss	%f13,	%f11
	movrgz	%i7,	%l0,	%o1
	ldd	[%l7 + 0x18],	%f6
	mulx	%l4,	0x0602,	%g3
	tvc	%icc,	0x5
	brlz	%g7,	loop_2722
	array16	%o2,	%i4,	%i5
	bleu,a,pn	%icc,	loop_2723
	sra	%g2,	%l1,	%i0
loop_2722:
	fbug,a	%fcc0,	loop_2724
	andncc	%i2,	%g6,	%g4
loop_2723:
	movl	%icc,	%l2,	%i6
	fcmped	%fcc2,	%f0,	%f14
loop_2724:
	movn	%icc,	%l3,	%o7
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
	sdivx	%i3,	0x05C3,	%g5
	ldd	[%l7 + 0x50],	%i0
	edge8n	%o4,	%o3,	%o5
	fbe,a	%fcc1,	loop_2725
	edge8n	%o6,	%l6,	%g1
	tle	%xcc,	0x5
	array16	%l5,	%i7,	%l0
loop_2725:
	movrlez	%o1,	0x2FC,	%l4
	fcmpne16	%f24,	%f18,	%g3
	udivcc	%o0,	0x1441,	%g7
	xorcc	%i4,	%i5,	%o2
	array8	%l1,	%i0,	%i2
	edge8l	%g2,	%g4,	%g6
	fnot2s	%f17,	%f3
	fba,a	%fcc2,	loop_2726
	umulcc	%i6,	0x11EE,	%l3
	subccc	%l2,	%i3,	%o7
	edge8n	%g5,	%o4,	%o3
loop_2726:
	move	%xcc,	%o5,	%i1
	brz	%l6,	loop_2727
	fmovse	%icc,	%f15,	%f30
	tvc	%icc,	0x5
	edge8ln	%o6,	%g1,	%i7
loop_2727:
	movn	%xcc,	%l5,	%l0
	taddcc	%l4,	0x1285,	%g3
	bleu,pt	%xcc,	loop_2728
	edge32n	%o1,	%o0,	%i4
	ldx	[%l7 + 0x50],	%g7
	fmovdleu	%xcc,	%f21,	%f2
loop_2728:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brlz,a	%i5,	loop_2729
	mulscc	%o2,	%l1,	%i0
	brnz	%i2,	loop_2730
	fpsub32	%f2,	%f30,	%f14
loop_2729:
	bge,a,pt	%icc,	loop_2731
	nop
	setx	loop_2732,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2730:
	add	%g2,	%g6,	%g4
	xorcc	%l3,	0x05F7,	%l2
loop_2731:
	movne	%icc,	%i6,	%o7
loop_2732:
	andncc	%i3,	%g5,	%o4
	tneg	%xcc,	0x5
	ldd	[%l7 + 0x20],	%o2
	fnot2	%f0,	%f12
	movgu	%xcc,	%o5,	%i1
	sub	%o6,	%g1,	%i7
	fbul	%fcc2,	loop_2733
	fcmpgt32	%f8,	%f14,	%l6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%l5
loop_2733:
	bcc,a,pt	%icc,	loop_2734
	movge	%xcc,	%l4,	%l0
	fmuld8ulx16	%f28,	%f14,	%f8
	edge32l	%o1,	%g3,	%o0
loop_2734:
	fbul	%fcc1,	loop_2735
	movrlez	%i4,	0x243,	%g7
	ldsw	[%l7 + 0x50],	%i5
	and	%l1,	0x1F3E,	%o2
loop_2735:
	movneg	%icc,	%i2,	%i0
	edge16	%g2,	%g6,	%g4
	fmovs	%f3,	%f31
	brlez,a	%l3,	loop_2736
	sdiv	%l2,	0x135F,	%i6
	nop
	setx	loop_2737,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvs	%xcc,	%f15,	%f31
loop_2736:
	fnot1s	%f0,	%f31
	brlz	%o7,	loop_2738
loop_2737:
	fbug	%fcc2,	loop_2739
	fmovsge	%xcc,	%f4,	%f20
	movrlz	%g5,	%i3,	%o3
loop_2738:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6B] %asi,	%o5
loop_2739:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x14] %asi,	%o4
	tne	%xcc,	0x3
	fmovde	%xcc,	%f16,	%f2
	tne	%icc,	0x7
	ldsb	[%l7 + 0x6C],	%o6
	fmovscs	%icc,	%f19,	%f21
	andncc	%i1,	%g1,	%i7
	nop
	setx loop_2740, %l0, %l1
	jmpl %l1, %l6
	fmovrdne	%l4,	%f8,	%f2
	tgu	%xcc,	0x4
	edge16ln	%l5,	%l0,	%o1
loop_2740:
	nop
	wr	%g0,	0xe3,	%asi
	stha	%o0,	[%l7 + 0x16] %asi
	membar	#Sync
	udiv	%g3,	0x1823,	%g7
	tneg	%xcc,	0x0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x11,	%f0
	sethi	0x1939,	%i4
	fpsub32s	%f23,	%f7,	%f31
	edge8n	%l1,	%i5,	%o2
	subccc	%i2,	%g2,	%g6
	array32	%g4,	%l3,	%l2
	fsrc2	%f12,	%f26
	fnors	%f31,	%f9,	%f24
	fmovdg	%xcc,	%f1,	%f10
	sir	0x0815
	fmovdcs	%icc,	%f16,	%f11
	sdiv	%i6,	0x166A,	%i0
	brlez	%o7,	loop_2741
	edge16	%g5,	%i3,	%o5
	ta	%icc,	0x2
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o3
loop_2741:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f29,	[%l7 + 0x38] %asi
	edge32l	%o4,	%o6,	%i1
	edge8	%g1,	%i7,	%l6
	nop
	setx loop_2742, %l0, %l1
	jmpl %l1, %l4
	movge	%xcc,	%l5,	%o1
	movvs	%xcc,	%o0,	%g3
	stx	%g7,	[%l7 + 0x40]
loop_2742:
	fba	%fcc1,	loop_2743
	movvs	%icc,	%i4,	%l0
	edge8l	%l1,	%i5,	%o2
	edge8n	%g2,	%i2,	%g6
loop_2743:
	srax	%l3,	0x1D,	%g4
	ldsw	[%l7 + 0x34],	%l2
	fpmerge	%f18,	%f7,	%f16
	edge32	%i6,	%i0,	%o7
	subccc	%i3,	%g5,	%o5
	edge16	%o4,	%o3,	%o6
	fmuld8ulx16	%f30,	%f22,	%f22
	ldd	[%l7 + 0x48],	%g0
	udivx	%i1,	0x07E5,	%i7
	alignaddrl	%l6,	%l5,	%o1
	movl	%xcc,	%l4,	%o0
	fbne,a	%fcc3,	loop_2744
	tn	%icc,	0x7
	movre	%g3,	%g7,	%i4
	tg	%xcc,	0x2
loop_2744:
	tpos	%xcc,	0x2
	xorcc	%l1,	0x194F,	%i5
	tg	%icc,	0x1
	edge8n	%l0,	%g2,	%i2
	fzero	%f24
	popc	%o2,	%l3
	bgu,a	loop_2745
	edge32n	%g4,	%g6,	%l2
	movrlez	%i0,	%o7,	%i6
	fmovspos	%icc,	%f26,	%f20
loop_2745:
	lduw	[%l7 + 0x08],	%i3
	alignaddr	%o5,	%g5,	%o3
	subccc	%o6,	%g1,	%i1
	andcc	%o4,	0x1FC0,	%l6
	subc	%l5,	0x1F7D,	%i7
	edge8ln	%o1,	%o0,	%g3
	mulx	%l4,	%g7,	%l1
	tvc	%xcc,	0x3
	bcc,a	%icc,	loop_2746
	andn	%i5,	%i4,	%g2
	edge32l	%l0,	%o2,	%l3
	xnor	%i2,	%g6,	%l2
loop_2746:
	nop
	set	0x48, %l2
	ldsba	[%l7 + %l2] 0x11,	%g4
	movn	%xcc,	%i0,	%o7
	tge	%icc,	0x3
	sth	%i6,	[%l7 + 0x12]
	movre	%o5,	%g5,	%i3
	sllx	%o3,	0x08,	%g1
	fpack16	%f22,	%f29
	set	0x34, %g3
	stwa	%i1,	[%l7 + %g3] 0xe2
	membar	#Sync
	fors	%f11,	%f5,	%f1
	sdivcc	%o6,	0x0A1F,	%l6
	subccc	%o4,	0x0765,	%i7
	sir	0x0097
	movg	%xcc,	%l5,	%o0
	or	%o1,	%g3,	%l4
	andcc	%l1,	0x176C,	%g7
	fornot2	%f4,	%f22,	%f26
	stw	%i4,	[%l7 + 0x68]
	udiv	%g2,	0x1760,	%i5
	fnors	%f22,	%f5,	%f9
	array8	%l0,	%o2,	%i2
	fmovsle	%xcc,	%f1,	%f29
	array8	%g6,	%l3,	%g4
	andn	%l2,	0x03F7,	%i0
	fbu,a	%fcc2,	loop_2747
	fpadd16	%f6,	%f2,	%f18
	movpos	%icc,	%i6,	%o5
	sllx	%g5,	0x00,	%o7
loop_2747:
	edge16n	%i3,	%o3,	%g1
	xnorcc	%i1,	0x0D11,	%o6
	sth	%o4,	[%l7 + 0x28]
	tge	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	stba	%l6,	[%l7 + 0x1D] %asi
	fmul8sux16	%f14,	%f24,	%f8
	array8	%i7,	%l5,	%o1
	movg	%xcc,	%o0,	%l4
	sir	0x072D
	orncc	%l1,	%g3,	%i4
	fnors	%f10,	%f2,	%f22
	fmovrsne	%g7,	%f2,	%f6
	brgez,a	%i5,	loop_2748
	movcc	%xcc,	%g2,	%o2
	edge8ln	%l0,	%i2,	%l3
	bvc,a	%xcc,	loop_2749
loop_2748:
	xnorcc	%g4,	%g6,	%l2
	move	%xcc,	%i6,	%i0
	prefetch	[%l7 + 0x68],	 0x2
loop_2749:
	tvc	%icc,	0x5
	movpos	%icc,	%g5,	%o5
	fmovdgu	%xcc,	%f20,	%f19
	fpsub32	%f26,	%f28,	%f8
	andncc	%o7,	%o3,	%g1
	move	%icc,	%i3,	%o6
	edge32ln	%o4,	%l6,	%i7
	ld	[%l7 + 0x6C],	%f24
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l5
	fbne,a	%fcc3,	loop_2750
	or	%o1,	0x0CFE,	%i1
	movgu	%xcc,	%l4,	%l1
	fmovsleu	%icc,	%f7,	%f31
loop_2750:
	tge	%icc,	0x5
	fcmpeq16	%f22,	%f6,	%g3
	andcc	%o0,	%i4,	%g7
	fmovsne	%icc,	%f21,	%f19
	fbul,a	%fcc3,	loop_2751
	nop
	setx	loop_2752,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16	%g2,	%o2,	%i5
	wr	%g0,	0x2f,	%asi
	stda	%i2,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2751:
	pdist	%f6,	%f4,	%f24
loop_2752:
	alignaddrl	%l3,	%l0,	%g6
	edge32ln	%l2,	%i6,	%i0
	movgu	%icc,	%g5,	%o5
	udivcc	%o7,	0x1916,	%g4
	fbule,a	%fcc3,	loop_2753
	fble,a	%fcc0,	loop_2754
	subcc	%g1,	%o3,	%o6
	fmovdcc	%icc,	%f0,	%f16
loop_2753:
	andncc	%o4,	%i3,	%l6
loop_2754:
	movle	%icc,	%l5,	%o1
	fbo,a	%fcc2,	loop_2755
	fcmpd	%fcc0,	%f20,	%f0
	sllx	%i7,	%l4,	%l1
	udiv	%i1,	0x02E1,	%o0
loop_2755:
	smulcc	%i4,	%g3,	%g2
	movrlz	%o2,	0x273,	%i5
	movrlz	%i2,	0x1F8,	%l3
	edge16n	%g7,	%g6,	%l0
	stbar
	brgz	%i6,	loop_2756
	brnz	%l2,	loop_2757
	fbule,a	%fcc3,	loop_2758
	sub	%i0,	0x0177,	%g5
loop_2756:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
loop_2757:
	bl,a	loop_2759
loop_2758:
	fmuld8sux16	%f8,	%f5,	%f6
	movre	%o7,	0x1F5,	%g1
	tsubcc	%o3,	0x11BC,	%o6
loop_2759:
	fmovda	%icc,	%f22,	%f26
	ldd	[%l7 + 0x60],	%f12
	membar	0x4A
	ble,pt	%xcc,	loop_2760
	tg	%xcc,	0x2
	set	0x18, %g1
	stba	%g4,	[%l7 + %g1] 0xe3
	membar	#Sync
loop_2760:
	taddcctv	%i3,	0x1BB4,	%o4
	udivx	%l5,	0x17D4,	%o1
	wr	%g0,	0x88,	%asi
	stwa	%l6,	[%l7 + 0x0C] %asi
	std	%f30,	[%l7 + 0x70]
	tne	%icc,	0x0
	fpsub32s	%f28,	%f7,	%f23
	subccc	%i7,	0x172B,	%l4
	edge32	%l1,	%o0,	%i1
	pdist	%f2,	%f18,	%f28
	edge8	%i4,	%g3,	%o2
	fpadd32	%f24,	%f18,	%f12
	bcs,pn	%icc,	loop_2761
	movrlz	%g2,	%i2,	%l3
	orncc	%g7,	0x0336,	%i5
	sdivx	%g6,	0x0357,	%l0
loop_2761:
	fcmpgt16	%f28,	%f22,	%l2
	nop
	setx	loop_2762,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%i6,	%i0,	%o5
	addccc	%g5,	0x1188,	%g1
	bgu,pt	%xcc,	loop_2763
loop_2762:
	tge	%xcc,	0x1
	udiv	%o7,	0x1AD4,	%o6
	sub	%g4,	%o3,	%i3
loop_2763:
	ld	[%l7 + 0x70],	%f0
	fmovsg	%icc,	%f30,	%f4
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x14,	 0x2
	ldsw	[%l7 + 0x08],	%o1
	xnor	%l6,	0x1452,	%i7
	movrgez	%l4,	%o4,	%o0
	call	loop_2764
	mulscc	%l1,	%i1,	%g3
	tvs	%xcc,	0x6
	edge16n	%i4,	%g2,	%i2
loop_2764:
	udivx	%l3,	0x0991,	%g7
	ldsw	[%l7 + 0x14],	%i5
	fmovdg	%xcc,	%f11,	%f10
	fmovrdlez	%o2,	%f24,	%f22
	ble,a	loop_2765
	andcc	%l0,	0x1DE8,	%l2
	stw	%i6,	[%l7 + 0x34]
	move	%xcc,	%i0,	%g6
loop_2765:
	mulx	%o5,	%g1,	%g5
	edge32ln	%o6,	%g4,	%o3
	fba,a	%fcc3,	loop_2766
	sdivx	%o7,	0x0941,	%i3
	movn	%icc,	%o1,	%l5
	fblg,a	%fcc3,	loop_2767
loop_2766:
	alignaddr	%l6,	%l4,	%i7
	fcmple32	%f22,	%f10,	%o4
	fone	%f8
loop_2767:
	udiv	%o0,	0x0FC9,	%i1
	mulx	%g3,	0x1D74,	%i4
	fmul8x16au	%f8,	%f19,	%f2
	fcmpne16	%f12,	%f16,	%l1
	edge32	%i2,	%g2,	%l3
	mulx	%g7,	0x05DD,	%i5
	movneg	%xcc,	%o2,	%l0
	fpsub16	%f0,	%f26,	%f16
	movneg	%icc,	%l2,	%i6
	nop
	set	0x1C, %o2
	ldsw	[%l7 + %o2],	%g6
	sdiv	%i0,	0x11E2,	%g1
	popc	%o5,	%o6
	fmovdpos	%xcc,	%f24,	%f30
	add	%g4,	%g5,	%o7
	alignaddr	%i3,	%o1,	%l5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o3,	%l4
	fnor	%f6,	%f4,	%f24
	edge32	%i7,	%o4,	%l6
	fmovdle	%xcc,	%f21,	%f3
	fmovse	%xcc,	%f4,	%f9
	edge8n	%i1,	%o0,	%g3
	set	0x70, %g7
	sta	%f3,	[%l7 + %g7] 0x89
	srax	%i4,	%i2,	%g2
	brgz	%l1,	loop_2768
	xnorcc	%l3,	0x1DBA,	%i5
	movgu	%xcc,	%g7,	%l0
	mulx	%o2,	0x0B96,	%i6
loop_2768:
	fornot1	%f6,	%f2,	%f28
	taddcc	%g6,	0x1169,	%i0
	fpsub16	%f26,	%f10,	%f6
	edge16l	%g1,	%l2,	%o5
	tcs	%icc,	0x4
	fmul8ulx16	%f24,	%f26,	%f16
	std	%g4,	[%l7 + 0x60]
	andn	%g5,	0x1151,	%o6
	fmovs	%f7,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2a,	%asi
	stxa	%o7,	[%l7 + 0x60] %asi
	membar	#Sync
	smul	%o1,	%i3,	%o3
	array16	%l5,	%l4,	%o4
	xorcc	%l6,	%i7,	%i1
	addcc	%o0,	%g3,	%i2
	fmovdgu	%xcc,	%f0,	%f16
	tleu	%icc,	0x2
	sth	%i4,	[%l7 + 0x74]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l1,	%l3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i5
	addc	%g2,	%g7,	%l0
	stw	%o2,	[%l7 + 0x78]
	tn	%xcc,	0x7
	sdiv	%g6,	0x0AEB,	%i0
	umul	%g1,	%l2,	%o5
	ldsw	[%l7 + 0x3C],	%i6
	edge32	%g5,	%o6,	%g4
	fors	%f9,	%f13,	%f21
	orcc	%o1,	%i3,	%o3
	movrlz	%o7,	%l4,	%l5
	wr	%g0,	0x23,	%asi
	stha	%o4,	[%l7 + 0x22] %asi
	membar	#Sync
	fbl	%fcc2,	loop_2769
	ldd	[%l7 + 0x10],	%f2
	orncc	%l6,	%i7,	%i1
	fcmpgt32	%f30,	%f20,	%g3
loop_2769:
	tvc	%xcc,	0x1
	fmovrdlez	%o0,	%f18,	%f2
	stx	%i2,	[%l7 + 0x18]
	movcs	%icc,	%i4,	%l3
	sdivcc	%l1,	0x02A1,	%g2
	nop
	set	0x24, %i6
	ldsh	[%l7 + %i6],	%g7
	edge32	%i5,	%l0,	%g6
	stb	%o2,	[%l7 + 0x34]
	fnegs	%f24,	%f24
	tvs	%xcc,	0x6
	umulcc	%g1,	%i0,	%l2
	edge8l	%o5,	%g5,	%o6
	fnot2	%f6,	%f10
	movrne	%g4,	%i6,	%i3
	fornot2s	%f30,	%f1,	%f20
	xorcc	%o1,	0x0885,	%o3
	edge8n	%l4,	%l5,	%o4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x81
	stb	%l6,	[%l7 + 0x41]
	edge32l	%o7,	%i7,	%g3
	fornot1	%f16,	%f10,	%f24
	fcmps	%fcc2,	%f18,	%f28
	taddcc	%o0,	0x1043,	%i1
	brz,a	%i4,	loop_2770
	tvs	%icc,	0x1
	sra	%l3,	0x0B,	%l1
	edge16	%i2,	%g2,	%i5
loop_2770:
	fbn,a	%fcc1,	loop_2771
	mulscc	%g7,	%l0,	%o2
	and	%g6,	0x0748,	%g1
	ta	%xcc,	0x6
loop_2771:
	nop
	set	0x56, %o6
	stba	%i0,	[%l7 + %o6] 0x23
	membar	#Sync
	taddcctv	%l2,	%g5,	%o5
	ldstub	[%l7 + 0x6A],	%g4
	movl	%icc,	%o6,	%i6
	fmul8x16	%f4,	%f2,	%f22
	addcc	%i3,	%o3,	%o1
	addc	%l4,	0x14BF,	%o4
	ldx	[%l7 + 0x58],	%l6
	udiv	%l5,	0x07D5,	%i7
	edge8ln	%o7,	%o0,	%i1
	fbg,a	%fcc3,	loop_2772
	fbuge	%fcc3,	loop_2773
	bgu,a	loop_2774
	tle	%xcc,	0x2
loop_2772:
	fcmpeq32	%f14,	%f30,	%i4
loop_2773:
	array32	%g3,	%l1,	%i2
loop_2774:
	movre	%l3,	0x279,	%g2
	movneg	%xcc,	%i5,	%l0
	movgu	%icc,	%o2,	%g7
	pdist	%f18,	%f14,	%f16
	fnands	%f23,	%f24,	%f30
	movre	%g6,	%g1,	%l2
	tsubcctv	%i0,	%o5,	%g5
	fmovdne	%xcc,	%f18,	%f31
	fmovdvs	%xcc,	%f30,	%f0
	movrlez	%g4,	0x27E,	%i6
	edge8l	%o6,	%o3,	%o1
	edge32ln	%i3,	%l4,	%l6
	or	%l5,	0x0769,	%i7
	fmovs	%f22,	%f0
	fcmpd	%fcc2,	%f2,	%f28
	fbuge	%fcc0,	loop_2775
	ldsw	[%l7 + 0x5C],	%o4
	tge	%xcc,	0x5
	edge8ln	%o7,	%o0,	%i4
loop_2775:
	ldx	[%l7 + 0x68],	%i1
	fblg	%fcc1,	loop_2776
	std	%f26,	[%l7 + 0x40]
	mulx	%g3,	%l1,	%i2
	bcc,a	loop_2777
loop_2776:
	movvs	%xcc,	%l3,	%g2
	srlx	%l0,	%o2,	%g7
	edge8l	%i5,	%g6,	%g1
loop_2777:
	alignaddr	%l2,	%o5,	%i0
	stbar
	fmovdne	%xcc,	%f4,	%f20
	stbar
	movl	%xcc,	%g4,	%g5
	edge8l	%o6,	%o3,	%i6
	tvc	%xcc,	0x4
	popc	0x0E09,	%i3
	tl	%xcc,	0x0
	edge16l	%o1,	%l6,	%l5
	tcc	%icc,	0x6
	fnand	%f10,	%f14,	%f28
	addcc	%l4,	0x0F8F,	%i7
	tvs	%icc,	0x5
	fxnor	%f2,	%f26,	%f10
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x80
	array8	%o7,	%o4,	%o0
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
	brlz,a	%i4,	loop_2779
	fcmped	%fcc2,	%f6,	%f14
	tneg	%xcc,	0x4
loop_2778:
	tvc	%icc,	0x3
loop_2779:
	fone	%f20
	fmovdcs	%icc,	%f2,	%f6
	edge8ln	%g3,	%i1,	%i2
	movgu	%xcc,	%l1,	%l3
	tleu	%icc,	0x7
	mulscc	%l0,	%o2,	%g2
	fnot2s	%f5,	%f9
	alignaddrl	%i5,	%g6,	%g1
	fblg,a	%fcc3,	loop_2780
	brgez	%g7,	loop_2781
	swap	[%l7 + 0x7C],	%o5
	movg	%icc,	%i0,	%g4
loop_2780:
	sra	%l2,	0x09,	%o6
loop_2781:
	fnegd	%f0,	%f16
	sra	%o3,	0x1D,	%g5
	movrne	%i3,	%i6,	%o1
	fexpand	%f11,	%f8
	nop
	set	0x4C, %g2
	sth	%l5,	[%l7 + %g2]
	edge8ln	%l6,	%l4,	%i7
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x18
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%o4
	alignaddrl	%o0,	%g3,	%i4
	edge16ln	%i1,	%i2,	%l1
	fandnot1	%f0,	%f30,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l0,	%o2
	fandnot1s	%f12,	%f5,	%f22
	udivcc	%g2,	0x1AE8,	%i5
	lduh	[%l7 + 0x48],	%l3
	fmovdleu	%icc,	%f7,	%f19
	fmovrsne	%g1,	%f28,	%f24
	mulx	%g7,	0x0E41,	%g6
	bgu,a,pn	%icc,	loop_2782
	bne	%xcc,	loop_2783
	fxor	%f24,	%f0,	%f18
	orcc	%o5,	%g4,	%i0
loop_2782:
	addcc	%l2,	%o6,	%o3
loop_2783:
	fones	%f11
	mulscc	%i3,	0x144F,	%i6
	sub	%g5,	0x093D,	%l5
	fexpand	%f17,	%f18
	movpos	%xcc,	%o1,	%l6
	umul	%l4,	%i7,	%o7
	fabss	%f15,	%f15
	fbu,a	%fcc1,	loop_2784
	fnot2	%f16,	%f22
	orcc	%o0,	%g3,	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%i2
loop_2784:
	edge8ln	%i4,	%l0,	%o2
	fandnot1s	%f13,	%f9,	%f10
	swap	[%l7 + 0x48],	%g2
	stbar
	edge32l	%l1,	%i5,	%g1
	smul	%g7,	0x1460,	%l3
	fnegd	%f20,	%f24
	set	0x18, %o5
	ldxa	[%g0 + %o5] 0x4f,	%o5
	ldsh	[%l7 + 0x68],	%g4
	tg	%icc,	0x5
	fmovdge	%icc,	%f10,	%f24
	orncc	%i0,	0x0FAE,	%l2
	edge16n	%o6,	%g6,	%i3
	fcmple32	%f28,	%f26,	%i6
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x0c,	 0x3
	orcc	%l5,	0x1B2D,	%o3
	movn	%xcc,	%o1,	%l4
	fpsub32	%f22,	%f20,	%f12
	orcc	%i7,	%o7,	%o0
	tsubcc	%g3,	%l6,	%o4
	array16	%i2,	%i1,	%l0
	fpsub16	%f18,	%f28,	%f28
	movrgez	%o2,	%i4,	%g2
	fmovdvc	%icc,	%f10,	%f13
	movneg	%icc,	%l1,	%g1
	movrgz	%i5,	0x13A,	%g7
	xor	%o5,	%g4,	%i0
	edge16n	%l3,	%l2,	%g6
	sdivx	%i3,	0x142D,	%i6
	xorcc	%o6,	%g5,	%l5
	tsubcctv	%o3,	%o1,	%i7
	subccc	%l4,	0x108E,	%o0
	movcs	%xcc,	%o7,	%l6
	edge8ln	%g3,	%o4,	%i2
	xnor	%l0,	0x117E,	%i1
	tg	%xcc,	0x6
	edge8n	%o2,	%i4,	%l1
	movre	%g1,	0x253,	%i5
	bvc	%xcc,	loop_2785
	udiv	%g2,	0x1DEE,	%g7
	fbue	%fcc2,	loop_2786
	mulx	%o5,	%g4,	%l3
loop_2785:
	edge32	%i0,	%l2,	%i3
	std	%f14,	[%l7 + 0x68]
loop_2786:
	sub	%i6,	%g6,	%o6
	edge32ln	%l5,	%o3,	%g5
	fcmpgt32	%f0,	%f24,	%i7
	ldd	[%l7 + 0x68],	%f20
	set	0x64, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l4
	edge8n	%o0,	%o7,	%l6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x19,	%f16
	move	%xcc,	%o1,	%o4
	edge8l	%g3,	%i2,	%i1
	ldsw	[%l7 + 0x40],	%o2
	stw	%l0,	[%l7 + 0x7C]
	siam	0x4
	tsubcc	%i4,	%l1,	%i5
	movrlz	%g2,	%g7,	%o5
	tcc	%xcc,	0x3
	movleu	%xcc,	%g1,	%l3
	stbar
	fmovrslez	%i0,	%f26,	%f4
	fmovsg	%icc,	%f16,	%f3
	ba,a,pt	%icc,	loop_2787
	fbe	%fcc2,	loop_2788
	movcs	%xcc,	%l2,	%i3
	bne	%icc,	loop_2789
loop_2787:
	sir	0x05B7
loop_2788:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2790
loop_2789:
	fzeros	%f23
	movrgz	%i6,	0x34B,	%g4
	fnot1	%f24,	%f16
loop_2790:
	tcs	%xcc,	0x5
	fmovdl	%xcc,	%f25,	%f12
	addc	%o6,	0x1072,	%g6
	te	%icc,	0x3
	fbn	%fcc3,	loop_2791
	lduh	[%l7 + 0x32],	%o3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x44] %asi,	%l5
loop_2791:
	alignaddrl	%i7,	%g5,	%o0
	fmovrslez	%o7,	%f13,	%f6
	edge32n	%l6,	%l4,	%o1
	xor	%g3,	0x1A3F,	%i2
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	sdivx	%i1,	0x08C6,	%o4
	sth	%o2,	[%l7 + 0x7C]
	ld	[%l7 + 0x14],	%f9
	alignaddrl	%i4,	%l1,	%i5
	edge32l	%l0,	%g7,	%g2
	sllx	%g1,	%l3,	%i0
	edge8l	%o5,	%l2,	%i3
	fmovrsne	%g4,	%f29,	%f21
	fxnors	%f15,	%f13,	%f21
	xnorcc	%i6,	0x176E,	%g6
	tsubcctv	%o6,	0x0BF8,	%l5
	fnands	%f14,	%f10,	%f23
	tpos	%xcc,	0x6
	fmovsneg	%icc,	%f3,	%f0
	add	%i7,	%g5,	%o3
	swap	[%l7 + 0x14],	%o0
	movvs	%xcc,	%l6,	%l4
	edge8	%o7,	%g3,	%i2
	fmovsn	%icc,	%f30,	%f28
	movrne	%i1,	%o1,	%o2
	fbg,a	%fcc3,	loop_2792
	srl	%o4,	%i4,	%i5
	orncc	%l1,	0x0B64,	%g7
	ba,a,pn	%icc,	loop_2793
loop_2792:
	stbar
	bl,pt	%icc,	loop_2794
	srax	%l0,	0x13,	%g2
loop_2793:
	movne	%xcc,	%l3,	%g1
	alignaddrl	%o5,	%l2,	%i3
loop_2794:
	movre	%i0,	0x2A2,	%i6
	mulx	%g6,	0x0D6B,	%o6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%i7
	tsubcctv	%g5,	0x018C,	%l5
	move	%xcc,	%o3,	%o0
	edge16	%l6,	%o7,	%l4
	and	%i2,	0x18DE,	%i1
	fabss	%f12,	%f4
	movre	%o1,	%g3,	%o4
	sra	%o2,	%i5,	%i4
	smulcc	%g7,	0x01FA,	%l1
	tgu	%icc,	0x1
	ldsw	[%l7 + 0x2C],	%g2
	sdivcc	%l3,	0x1701,	%g1
	fcmpgt32	%f12,	%f30,	%o5
	mulscc	%l0,	0x11CE,	%i3
	subcc	%l2,	0x1AC9,	%i6
	fpadd16	%f28,	%f10,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f0,	%f10
	fmovsleu	%xcc,	%f14,	%f6
	udivcc	%i0,	0x1A78,	%g6
	ble,pt	%xcc,	loop_2795
	fcmpgt32	%f6,	%f24,	%g4
	umulcc	%o6,	0x18DD,	%i7
	sdivx	%g5,	0x056D,	%l5
loop_2795:
	ta	%icc,	0x1
	fmovrse	%o0,	%f6,	%f6
	udivx	%l6,	0x01A7,	%o7
	fcmpgt32	%f12,	%f22,	%l4
	movle	%xcc,	%i2,	%o3
	mulscc	%o1,	0x0AB9,	%g3
	bvc,a	loop_2796
	nop
	setx loop_2797, %l0, %l1
	jmpl %l1, %i1
	movle	%xcc,	%o2,	%i5
	sll	%o4,	%g7,	%i4
loop_2796:
	edge32	%l1,	%l3,	%g1
loop_2797:
	bg	%icc,	loop_2798
	std	%f4,	[%l7 + 0x50]
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x78] %asi,	%g2
loop_2798:
	alignaddr	%l0,	%i3,	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x11,	%o5,	%i0
	movleu	%icc,	%g6,	%i6
	fbl,a	%fcc0,	loop_2799
	movge	%icc,	%o6,	%g4
	udivx	%g5,	0x1F99,	%i7
	std	%f6,	[%l7 + 0x40]
loop_2799:
	movne	%xcc,	%l5,	%o0
	add	%o7,	%l4,	%l6
	movrlz	%o3,	%i2,	%g3
	fone	%f6
	edge16ln	%o1,	%o2,	%i1
	movcs	%xcc,	%o4,	%g7
	ta	%icc,	0x1
	pdist	%f4,	%f12,	%f6
	fandnot2	%f6,	%f24,	%f2
	andcc	%i4,	0x04BC,	%l1
	taddcc	%l3,	%g1,	%g2
	fmovrsne	%l0,	%f2,	%f27
	sir	0x0FEE
	movrlz	%i3,	0x0AE,	%i5
	xor	%o5,	%i0,	%l2
	move	%xcc,	%g6,	%o6
	fpsub16	%f20,	%f4,	%f0
	edge8l	%g4,	%g5,	%i6
	fexpand	%f14,	%f28
	movl	%xcc,	%i7,	%o0
	ldub	[%l7 + 0x38],	%o7
	edge8l	%l5,	%l6,	%o3
	fbg,a	%fcc0,	loop_2800
	movcs	%icc,	%l4,	%g3
	movrlz	%o1,	0x0D2,	%i2
	udiv	%i1,	0x1F19,	%o4
loop_2800:
	subccc	%g7,	%o2,	%l1
	fbu,a	%fcc1,	loop_2801
	xnorcc	%i4,	%l3,	%g1
	edge32	%g2,	%i3,	%l0
	fmul8x16	%f12,	%f14,	%f8
loop_2801:
	udivcc	%i5,	0x060D,	%i0
	movvc	%xcc,	%o5,	%g6
	fbug,a	%fcc1,	loop_2802
	edge32	%o6,	%g4,	%g5
	fmovrdgez	%l2,	%f22,	%f2
	fblg	%fcc3,	loop_2803
loop_2802:
	orncc	%i7,	%o0,	%i6
	movg	%xcc,	%l5,	%o7
	fble,a	%fcc0,	loop_2804
loop_2803:
	movcs	%xcc,	%o3,	%l6
	fmovdge	%icc,	%f3,	%f31
	subcc	%g3,	0x02F1,	%l4
loop_2804:
	edge32ln	%i2,	%o1,	%i1
	tneg	%xcc,	0x1
	tle	%icc,	0x2
	std	%o4,	[%l7 + 0x40]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o2,	%l1,	%g7
	alignaddrl	%i4,	%g1,	%l3
	addcc	%i3,	0x0A64,	%g2
	brlez	%l0,	loop_2805
	fbuge	%fcc2,	loop_2806
	movvc	%icc,	%i5,	%o5
	andncc	%g6,	%o6,	%g4
loop_2805:
	sir	0x0452
loop_2806:
	smul	%i0,	%g5,	%i7
	sdiv	%o0,	0x0AAF,	%l2
	movcc	%icc,	%l5,	%o7
	fmovdpos	%xcc,	%f7,	%f20
	movneg	%xcc,	%o3,	%i6
	bshuffle	%f20,	%f24,	%f26
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	subc	%g3,	0x1B0C,	%i2
	bvc	%icc,	loop_2807
	tl	%xcc,	0x5
	fpadd16	%f12,	%f0,	%f28
	andcc	%l4,	%o1,	%o4
loop_2807:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i1,	%o2
	fbge	%fcc2,	loop_2808
	movrgez	%l1,	0x325,	%i4
	fble,a	%fcc0,	loop_2809
	edge16l	%g7,	%l3,	%g1
loop_2808:
	tge	%icc,	0x1
	subccc	%g2,	0x02DB,	%l0
loop_2809:
	ldd	[%l7 + 0x18],	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o5,	%g6,	%o6
	fmovrdne	%g4,	%f12,	%f16
	orn	%i3,	0x0FAD,	%g5
	taddcc	%i7,	%i0,	%o0
	movrgez	%l5,	0x1D5,	%l2
	popc	0x1B27,	%o7
	fbge	%fcc2,	loop_2810
	fnand	%f30,	%f26,	%f10
	movre	%o3,	0x148,	%l6
	sll	%i6,	%i2,	%g3
loop_2810:
	orn	%l4,	0x07DA,	%o4
	udivcc	%i1,	0x1AD1,	%o2
	srax	%o1,	0x0F,	%l1
	move	%xcc,	%g7,	%i4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x30] %asi,	%g0
	move	%xcc,	%l3,	%l0
	tcc	%icc,	0x7
	fmovsne	%xcc,	%f14,	%f12
	bgu,a,pt	%icc,	loop_2811
	movleu	%xcc,	%i5,	%g2
	ba	%xcc,	loop_2812
	andcc	%g6,	0x1733,	%o6
loop_2811:
	nop
	setx loop_2813, %l0, %l1
	jmpl %l1, %o5
	fmovdge	%icc,	%f18,	%f17
loop_2812:
	edge32n	%g4,	%g5,	%i7
	movcs	%icc,	%i3,	%i0
loop_2813:
	nop
	setx	loop_2814,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%l5,	0x151D,	%o0
	fmovdgu	%icc,	%f19,	%f25
	alignaddr	%l2,	%o7,	%o3
loop_2814:
	nop
	setx	loop_2815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%i6,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f26,	%f24
loop_2815:
	mulx	%g3,	%l4,	%i2
	fmul8x16au	%f25,	%f22,	%f12
	movvs	%icc,	%o4,	%i1
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f17,	%f1,	%f6
	fbg	%fcc2,	loop_2816
	std	%f12,	[%l7 + 0x10]
	edge32ln	%o1,	%o2,	%l1
	fbl	%fcc2,	loop_2817
loop_2816:
	movleu	%icc,	%i4,	%g1
	mulx	%g7,	0x0866,	%l3
	taddcc	%l0,	%g2,	%i5
loop_2817:
	edge32	%o6,	%g6,	%o5
	movrlez	%g5,	%i7,	%i3
	tvc	%icc,	0x0
	xnorcc	%i0,	%l5,	%o0
	movvs	%xcc,	%g4,	%l2
	tsubcctv	%o3,	0x1BD6,	%o7
	edge16ln	%i6,	%l6,	%l4
	movpos	%xcc,	%g3,	%o4
	mova	%xcc,	%i2,	%o1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%o2
	swap	[%l7 + 0x2C],	%i1
	edge32n	%l1,	%g1,	%g7
	fblg,a	%fcc0,	loop_2818
	movn	%xcc,	%l3,	%l0
	tneg	%icc,	0x3
	addcc	%g2,	%i5,	%i4
loop_2818:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x38] %asi,	%g6
	udiv	%o5,	0x0F83,	%o6
	flush	%l7 + 0x48
	sethi	0x1AA7,	%g5
	call	loop_2819
	tgu	%xcc,	0x0
	xor	%i7,	0x15F3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2819:
	nop
	wr	%g0,	0x88,	%asi
	stwa	%i3,	[%l7 + 0x30] %asi
	add	%o0,	0x1418,	%l5
	xor	%g4,	0x14D5,	%l2
	bpos,pn	%icc,	loop_2820
	fcmpd	%fcc1,	%f26,	%f16
	fbl,a	%fcc1,	loop_2821
	stw	%o3,	[%l7 + 0x28]
loop_2820:
	fmul8x16	%f17,	%f2,	%f2
	edge32ln	%o7,	%i6,	%l4
loop_2821:
	subcc	%l6,	0x1A7C,	%g3
	movcc	%xcc,	%i2,	%o4
	movne	%icc,	%o1,	%o2
	fmovde	%xcc,	%f10,	%f4
	srlx	%i1,	%g1,	%l1
	andncc	%l3,	%l0,	%g2
	fmovsn	%xcc,	%f15,	%f14
	fpack16	%f8,	%f24
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x60] %asi,	%g7
	set	0x10, %i3
	swapa	[%l7 + %i3] 0x89,	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g6,	%i4
	srlx	%o5,	0x1A,	%o6
	fbule	%fcc1,	loop_2822
	tcs	%icc,	0x7
	smul	%g5,	0x07C5,	%i0
	brlez	%i7,	loop_2823
loop_2822:
	xor	%i3,	0x0944,	%l5
	fors	%f20,	%f1,	%f12
	tvc	%xcc,	0x6
loop_2823:
	fmovdg	%xcc,	%f24,	%f3
	edge16l	%o0,	%g4,	%l2
	fcmpne16	%f20,	%f2,	%o3
	addc	%o7,	%i6,	%l4
	swap	[%l7 + 0x60],	%g3
	fbu,a	%fcc2,	loop_2824
	fmovrdgez	%i2,	%f12,	%f28
	std	%i6,	[%l7 + 0x38]
	tg	%xcc,	0x1
loop_2824:
	bvs,pn	%xcc,	loop_2825
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x6E] %asi,	%o4
loop_2825:
	fblg	%fcc1,	loop_2826
	fone	%f28
	udiv	%o1,	0x02B2,	%i1
	ldx	[%l7 + 0x68],	%o2
loop_2826:
	fmovd	%f14,	%f14
	movne	%xcc,	%l1,	%g1
	nop
	setx loop_2827, %l0, %l1
	jmpl %l1, %l3
	fmul8x16	%f3,	%f4,	%f30
	bvs,a	%xcc,	loop_2828
	movleu	%icc,	%g2,	%g7
loop_2827:
	sllx	%l0,	%g6,	%i5
	ldd	[%l7 + 0x78],	%o4
loop_2828:
	sra	%o6,	%g5,	%i0
	movrlz	%i4,	%i7,	%i3
	bneg	loop_2829
	edge16n	%o0,	%g4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f20,	%f30,	%f7
loop_2829:
	xor	%l5,	%o3,	%i6
	fands	%f7,	%f11,	%f5
	fbne,a	%fcc0,	loop_2830
	umulcc	%l4,	0x090A,	%g3
	xnorcc	%i2,	0x1D2E,	%o7
	smulcc	%l6,	0x0083,	%o1
loop_2830:
	tn	%xcc,	0x0
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x1d0, %i0
	nop 	! 	stxa	%o4,	[%g0 + %i0] 0x40 ripped by fixASI40.pl
	sdivx	%o2,	0x1EBD,	%l1
	xnor	%g1,	0x1BEB,	%i1
	umulcc	%l3,	0x0DFC,	%g2
	tpos	%icc,	0x3
	fexpand	%f25,	%f16
	sethi	0x1D0F,	%g7
	array8	%g6,	%i5,	%o5
	orncc	%o6,	0x1F2D,	%l0
	tcs	%icc,	0x6
	movvc	%xcc,	%g5,	%i4
	edge8	%i0,	%i7,	%o0
	wr	%g0,	0x11,	%asi
	stxa	%i3,	[%l7 + 0x50] %asi
	fbul	%fcc2,	loop_2831
	lduh	[%l7 + 0x50],	%l2
	fmovdn	%icc,	%f13,	%f3
	andcc	%g4,	%l5,	%o3
loop_2831:
	movrlez	%i6,	0x2D7,	%l4
	addc	%g3,	%o7,	%i2
	brlz	%o1,	loop_2832
	edge8n	%l6,	%o2,	%o4
	set	0x10, %i5
	stxa	%g1,	[%l7 + %i5] 0x18
loop_2832:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
	wr	%g0,	0x89,	%asi
	stha	%l1,	[%l7 + 0x2E] %asi
	movpos	%xcc,	%g2,	%l3
	movge	%xcc,	%g7,	%g6
	sub	%o5,	%o6,	%l0
	fmovsneg	%xcc,	%f28,	%f0
	call	loop_2833
	membar	0x54
	sllx	%i5,	0x19,	%g5
	tsubcctv	%i4,	0x13D5,	%i7
loop_2833:
	movcs	%icc,	%i0,	%i3
	srlx	%l2,	0x0C,	%g4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x28] %asi,	%o0
	fmovs	%f10,	%f13
	fble	%fcc2,	loop_2834
	add	%l5,	0x15DE,	%o3
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x7F] %asi,	%i6
loop_2834:
	fbo,a	%fcc1,	loop_2835
	fbue	%fcc0,	loop_2836
	ldub	[%l7 + 0x3C],	%l4
	addcc	%o7,	%i2,	%g3
loop_2835:
	array8	%l6,	%o2,	%o1
loop_2836:
	movleu	%icc,	%g1,	%i1
	edge32	%l1,	%g2,	%l3
	movcc	%icc,	%o4,	%g6
	ldd	[%l7 + 0x10],	%f0
	swap	[%l7 + 0x2C],	%o5
	fmovdn	%xcc,	%f0,	%f13
	bvs	loop_2837
	fcmpeq32	%f2,	%f28,	%o6
	edge32	%l0,	%i5,	%g5
	movn	%xcc,	%i4,	%i7
loop_2837:
	fbu,a	%fcc2,	loop_2838
	tn	%icc,	0x6
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x14] %asi,	%f4
loop_2838:
	fmovd	%f8,	%f4
	fbo,a	%fcc1,	loop_2839
	orncc	%g7,	%i0,	%i3
	movcs	%xcc,	%l2,	%o0
	ta	%icc,	0x7
loop_2839:
	fmovrsgez	%l5,	%f5,	%f15
	sdivx	%g4,	0x090B,	%i6
	membar	0x26
	wr	%g0,	0x81,	%asi
	sta	%f3,	[%l7 + 0x70] %asi
	addcc	%o3,	%o7,	%i2
	sdivx	%g3,	0x02A6,	%l6
	fbu,a	%fcc3,	loop_2840
	alignaddrl	%o2,	%l4,	%o1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x78] %asi,	%i1
loop_2840:
	edge16l	%g1,	%g2,	%l3
	subccc	%o4,	0x1C10,	%g6
	movleu	%icc,	%l1,	%o5
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x14,	 0x1
	membar	0x75
	ldub	[%l7 + 0x2D],	%i5
	srax	%g5,	0x16,	%l0
	fpsub16	%f6,	%f18,	%f20
	movcs	%icc,	%i7,	%g7
	movre	%i0,	0x3F3,	%i3
	sethi	0x094B,	%i4
	movneg	%icc,	%o0,	%l2
	movle	%icc,	%g4,	%i6
	fmovdcs	%icc,	%f4,	%f7
	movrlez	%l5,	0x020,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i2,	0x172D,	%g3
	alignaddr	%o3,	%l6,	%o2
	umul	%o1,	%i1,	%g1
	lduw	[%l7 + 0x24],	%l4
	stb	%l3,	[%l7 + 0x08]
	ta	%icc,	0x2
	ldsh	[%l7 + 0x4C],	%o4
	orcc	%g2,	%g6,	%o5
	add	%l1,	0x0BD2,	%i5
	sllx	%o6,	0x07,	%g5
	tsubcctv	%i7,	0x1FD5,	%l0
	taddcctv	%g7,	0x1786,	%i0
	set	0x24, %i2
	stha	%i4,	[%l7 + %i2] 0x15
	smul	%i3,	%o0,	%g4
	movvs	%icc,	%l2,	%i6
	or	%l5,	%i2,	%o7
	fmovdne	%icc,	%f4,	%f12
	umulcc	%g3,	0x0AF8,	%l6
	edge8n	%o3,	%o2,	%o1
	mova	%xcc,	%g1,	%i1
	fbul	%fcc1,	loop_2841
	fbo,a	%fcc1,	loop_2842
	be,pt	%xcc,	loop_2843
	edge32ln	%l3,	%o4,	%g2
loop_2841:
	fmovse	%icc,	%f23,	%f3
loop_2842:
	movre	%l4,	%o5,	%l1
loop_2843:
	edge8	%i5,	%o6,	%g5
	be	loop_2844
	brgz,a	%i7,	loop_2845
	movge	%xcc,	%l0,	%g6
	be,a,pn	%icc,	loop_2846
loop_2844:
	alignaddrl	%g7,	%i4,	%i3
loop_2845:
	udivx	%o0,	0x0274,	%i0
	move	%icc,	%l2,	%g4
loop_2846:
	fbule,a	%fcc0,	loop_2847
	fmovdge	%xcc,	%f16,	%f4
	xnorcc	%l5,	0x1A2B,	%i2
	movleu	%icc,	%i6,	%o7
loop_2847:
	srl	%l6,	%o3,	%g3
	udivx	%o1,	0x1DF3,	%g1
	mulscc	%o2,	0x1B46,	%i1
	membar	0x5C
	movl	%xcc,	%l3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x3C, %l0
	stba	%l4,	[%l7 + %l0] 0x10
	sdivx	%o4,	0x0E8D,	%o5
	tne	%icc,	0x1
	sllx	%l1,	%i5,	%o6
	movneg	%xcc,	%g5,	%i7
	edge16l	%l0,	%g6,	%g7
	fmovsvc	%xcc,	%f31,	%f30
	bneg	loop_2848
	ta	%icc,	0x1
	movgu	%xcc,	%i3,	%i4
	bgu,a	%icc,	loop_2849
loop_2848:
	fbuge	%fcc2,	loop_2850
	udivcc	%o0,	0x1A89,	%i0
	umulcc	%l2,	0x1BAB,	%g4
loop_2849:
	edge16l	%l5,	%i2,	%o7
loop_2850:
	nop
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x80,	%l6
	lduh	[%l7 + 0x1C],	%o3
	xnorcc	%g3,	%o1,	%g1
	fandnot1	%f18,	%f30,	%f28
	movrgez	%o2,	%i1,	%i6
	subcc	%g2,	%l4,	%l3
	lduw	[%l7 + 0x3C],	%o5
	or	%l1,	0x061C,	%o4
	tneg	%xcc,	0x1
	addcc	%i5,	0x1D30,	%o6
	array8	%i7,	%g5,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%g7
	tn	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x67] %asi,	%i3
	array32	%o0,	%i4,	%i0
	fmovsvc	%xcc,	%f2,	%f1
	orn	%l2,	%g4,	%i2
	sir	0x07B6
	addccc	%l5,	%o7,	%o3
	fnegd	%f22,	%f16
	movpos	%icc,	%l6,	%g3
	tpos	%xcc,	0x3
	fmovse	%icc,	%f21,	%f17
	edge32n	%o1,	%o2,	%i1
	fbuge,a	%fcc1,	loop_2851
	array16	%g1,	%i6,	%l4
	orn	%g2,	%o5,	%l1
	movgu	%xcc,	%o4,	%i5
loop_2851:
	orn	%o6,	0x0D1D,	%l3
	for	%f4,	%f22,	%f14
	movge	%icc,	%i7,	%l0
	alignaddr	%g6,	%g5,	%i3
	sdiv	%o0,	0x138D,	%i4
	udivcc	%g7,	0x175A,	%i0
	fble	%fcc2,	loop_2852
	fxnors	%f6,	%f31,	%f22
	sub	%l2,	0x03F3,	%i2
	movrne	%g4,	%l5,	%o7
loop_2852:
	addc	%o3,	%g3,	%o1
	fnegd	%f16,	%f12
	andn	%o2,	%l6,	%g1
	array32	%i6,	%l4,	%g2
	xnorcc	%i1,	%l1,	%o5
	taddcc	%o4,	%i5,	%o6
	tsubcc	%i7,	%l0,	%l3
	edge32ln	%g6,	%g5,	%i3
	srlx	%i4,	%o0,	%i0
	fmovdvs	%icc,	%f23,	%f24
	udivcc	%g7,	0x0CEC,	%i2
	edge32	%g4,	%l5,	%l2
	edge16ln	%o7,	%g3,	%o3
	andcc	%o1,	0x11AC,	%o2
	lduh	[%l7 + 0x58],	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x6
	tcs	%icc,	0x5
	movrlez	%i6,	0x08D,	%l6
	ldsh	[%l7 + 0x4E],	%l4
	udivx	%i1,	0x10A9,	%l1
	movle	%icc,	%g2,	%o5
	tvs	%icc,	0x5
	movpos	%xcc,	%o4,	%i5
	wr	%g0,	0x89,	%asi
	stxa	%o6,	[%l7 + 0x18] %asi
	stx	%l0,	[%l7 + 0x18]
	movrne	%l3,	%g6,	%g5
	subc	%i3,	%i7,	%i4
	udiv	%o0,	0x07F5,	%i0
	subcc	%g7,	0x0B16,	%i2
	movcs	%icc,	%l5,	%g4
	fmovsleu	%icc,	%f1,	%f17
	taddcc	%o7,	0x1BDA,	%g3
	edge32	%o3,	%l2,	%o2
	te	%xcc,	0x4
	edge32	%o1,	%g1,	%i6
	ldub	[%l7 + 0x1C],	%l6
	andn	%l4,	%l1,	%g2
	movrlez	%o5,	0x240,	%o4
	edge32	%i1,	%o6,	%i5
	tcc	%icc,	0x3
	movvs	%xcc,	%l0,	%g6
	brgez	%l3,	loop_2853
	sdivx	%g5,	0x0C01,	%i3
	umulcc	%i7,	%o0,	%i0
	tcs	%icc,	0x1
loop_2853:
	fmovscs	%xcc,	%f29,	%f0
	edge32	%g7,	%i4,	%l5
	udivx	%g4,	0x0B52,	%i2
	and	%o7,	%o3,	%g3
	fone	%f18
	fnegd	%f8,	%f6
	fbule,a	%fcc3,	loop_2854
	brlez,a	%o2,	loop_2855
	prefetch	[%l7 + 0x20],	 0x1
	fpadd16s	%f3,	%f21,	%f3
loop_2854:
	fbn,a	%fcc3,	loop_2856
loop_2855:
	tvs	%icc,	0x5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf0
	membar	#Sync
loop_2856:
	sdivcc	%o1,	0x18CF,	%l2
	fexpand	%f15,	%f22
	movle	%xcc,	%g1,	%l6
	edge32l	%l4,	%i6,	%l1
	movrgez	%o5,	%g2,	%i1
	fbul	%fcc0,	loop_2857
	movrne	%o4,	0x25A,	%i5
	orncc	%l0,	0x0122,	%g6
	and	%o6,	%g5,	%l3
loop_2857:
	movg	%xcc,	%i3,	%i7
	fmovsgu	%xcc,	%f3,	%f27
	fpsub32	%f22,	%f0,	%f2
	fxor	%f8,	%f0,	%f10
	tge	%xcc,	0x6
	sllx	%o0,	%g7,	%i0
	brnz	%l5,	loop_2858
	fmovsleu	%xcc,	%f4,	%f26
	fcmped	%fcc1,	%f18,	%f22
	pdist	%f8,	%f18,	%f20
loop_2858:
	subcc	%g4,	0x0B51,	%i4
	smulcc	%o7,	0x07FC,	%i2
	edge32l	%o3,	%o2,	%o1
	add	%g3,	0x0CE1,	%g1
	tneg	%xcc,	0x4
	set	0x58, %g4
	lda	[%l7 + %g4] 0x11,	%f10
	movrlez	%l6,	%l2,	%i6
	fbl	%fcc1,	loop_2859
	std	%l0,	[%l7 + 0x40]
	add	%o5,	%g2,	%l4
	sub	%o4,	%i1,	%l0
loop_2859:
	taddcctv	%i5,	%o6,	%g6
	bcs	loop_2860
	srl	%l3,	%i3,	%g5
	fcmple32	%f28,	%f28,	%i7
	array8	%o0,	%i0,	%l5
loop_2860:
	smulcc	%g4,	%i4,	%o7
	fmovsl	%icc,	%f14,	%f25
	xor	%g7,	0x1146,	%i2
	set	0x6F, %o1
	ldsba	[%l7 + %o1] 0x19,	%o3
	fandnot1s	%f29,	%f4,	%f12
	fmovrdne	%o1,	%f6,	%f24
	nop
	set	0x08, %i1
	sth	%g3,	[%l7 + %i1]
	xnor	%g1,	%o2,	%l2
	tn	%icc,	0x3
	fmovrsgez	%l6,	%f24,	%f27
	subc	%i6,	%l1,	%o5
	move	%icc,	%l4,	%o4
	fornot2	%f22,	%f18,	%f16
	fmovs	%f5,	%f10
	add	%g2,	%l0,	%i1
	fornot2s	%f13,	%f14,	%f21
	fsrc1s	%f8,	%f11
	tvc	%xcc,	0x5
	lduh	[%l7 + 0x32],	%o6
	sth	%i5,	[%l7 + 0x66]
	sdivx	%l3,	0x022F,	%i3
	tn	%xcc,	0x3
	tcs	%icc,	0x7
	edge8l	%g5,	%i7,	%o0
	mulx	%g6,	%i0,	%g4
	stbar
	movvc	%icc,	%i4,	%l5
	movle	%xcc,	%g7,	%o7
	movrgez	%i2,	0x372,	%o1
	fsrc2s	%f2,	%f2
	fbul	%fcc0,	loop_2861
	fsrc2	%f12,	%f24
	fcmpgt32	%f6,	%f20,	%o3
	faligndata	%f22,	%f28,	%f14
loop_2861:
	tsubcc	%g1,	%o2,	%l2
	movg	%icc,	%g3,	%i6
	add	%l6,	0x097D,	%l1
	movg	%xcc,	%l4,	%o5
	taddcctv	%g2,	%l0,	%o4
	edge32ln	%o6,	%i5,	%l3
	edge8	%i1,	%g5,	%i7
	fmovsl	%xcc,	%f30,	%f29
	fnors	%f22,	%f5,	%f24
	edge8n	%o0,	%i3,	%i0
	fnands	%f8,	%f14,	%f7
	edge8ln	%g6,	%g4,	%i4
	fmovsle	%xcc,	%f19,	%f5
	fpadd32s	%f31,	%f17,	%f15
	movvc	%icc,	%l5,	%o7
	bcc,pn	%icc,	loop_2862
	popc	%g7,	%i2
	taddcctv	%o1,	%o3,	%g1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%g3
loop_2862:
	membar	0x5E
	tsubcctv	%l2,	0x02F0,	%i6
	fbge	%fcc2,	loop_2863
	andcc	%l6,	0x18EF,	%l4
	edge8l	%o5,	%g2,	%l0
	tl	%icc,	0x7
loop_2863:
	tsubcc	%l1,	%o6,	%o4
	subccc	%i5,	%l3,	%i1
	array16	%g5,	%i7,	%i3
	be,pn	%xcc,	loop_2864
	ldsh	[%l7 + 0x0E],	%o0
	fxnor	%f0,	%f14,	%f0
	fbge	%fcc1,	loop_2865
loop_2864:
	fzeros	%f12
	stb	%i0,	[%l7 + 0x3A]
	fnegs	%f13,	%f21
loop_2865:
	stx	%g6,	[%l7 + 0x28]
	set	0x44, %o0
	swapa	[%l7 + %o0] 0x88,	%i4
	be,a	loop_2866
	edge8l	%g4,	%l5,	%o7
	bvc,pn	%icc,	loop_2867
	bl,pt	%xcc,	loop_2868
loop_2866:
	edge16ln	%i2,	%o1,	%o3
	alignaddr	%g7,	%g1,	%o2
loop_2867:
	array32	%g3,	%i6,	%l6
loop_2868:
	fbe,a	%fcc0,	loop_2869
	fpadd32s	%f29,	%f21,	%f19
	sdivcc	%l4,	0x1EA9,	%o5
	fmul8sux16	%f30,	%f2,	%f10
loop_2869:
	movcs	%icc,	%g2,	%l2
	movl	%xcc,	%l0,	%o6
	alignaddr	%o4,	%i5,	%l1
	edge32ln	%i1,	%g5,	%i7
	fmovsvc	%icc,	%f12,	%f3
	bn	%icc,	loop_2870
	fbg,a	%fcc1,	loop_2871
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2870:
	std	%i2,	[%l7 + 0x68]
loop_2871:
	srax	%o0,	0x07,	%l3
	lduw	[%l7 + 0x7C],	%g6
	fmovda	%icc,	%f18,	%f1
	ldsw	[%l7 + 0x14],	%i4
	std	%f6,	[%l7 + 0x50]
	bneg,a,pn	%icc,	loop_2872
	andncc	%i0,	%g4,	%l5
	movrgez	%o7,	0x1F1,	%o1
	taddcc	%o3,	0x05A8,	%i2
loop_2872:
	fmovrslez	%g7,	%f26,	%f1
	addc	%o2,	%g3,	%i6
	udiv	%l6,	0x095B,	%g1
	fnor	%f28,	%f12,	%f2
	bne,a	loop_2873
	movn	%xcc,	%l4,	%g2
	movneg	%xcc,	%o5,	%l2
	fnot2s	%f25,	%f13
loop_2873:
	smul	%o6,	0x1767,	%o4
	movg	%icc,	%l0,	%l1
	srax	%i5,	%g5,	%i7
	and	%i1,	%o0,	%i3
	srl	%g6,	0x18,	%i4
	ldsh	[%l7 + 0x10],	%i0
	fandnot1	%f4,	%f28,	%f26
	stbar
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
	tsubcc	%l5,	0x0D58,	%o7
	smulcc	%o1,	%o3,	%i2
	movrne	%g7,	0x3D2,	%g4
	addcc	%o2,	%i6,	%l6
	movrgz	%g1,	0x39D,	%l4
	andcc	%g3,	0x048B,	%g2
	edge32	%l2,	%o5,	%o4
	movcc	%xcc,	%l0,	%o6
	fmovdge	%icc,	%f5,	%f31
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x38] %asi,	%l1
	tvs	%icc,	0x0
	fzeros	%f8
	tvc	%icc,	0x5
	tn	%xcc,	0x3
	fmul8x16	%f21,	%f22,	%f28
	ldsb	[%l7 + 0x47],	%g5
	tcc	%xcc,	0x0
	movpos	%xcc,	%i7,	%i5
	ta	%xcc,	0x7
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tgu	%icc,	0x5
	udivcc	%o0,	0x1983,	%i1
	fpsub32s	%f6,	%f15,	%f12
	sethi	0x1B3B,	%g6
	movcc	%xcc,	%i3,	%i4
	and	%i0,	%l5,	%o7
	popc	%o1,	%o3
	movl	%icc,	%i2,	%l3
	fone	%f0
	edge32	%g7,	%g4,	%o2
	movcs	%xcc,	%l6,	%i6
	movre	%l4,	0x0A9,	%g1
	fmovsgu	%icc,	%f15,	%f25
	orncc	%g3,	0x03AB,	%g2
	fornot1s	%f4,	%f20,	%f18
	tvc	%xcc,	0x7
	edge16l	%o5,	%l2,	%l0
	array32	%o6,	%l1,	%g5
	sllx	%o4,	0x1F,	%i5
	fbule	%fcc0,	loop_2874
	fxnors	%f20,	%f26,	%f0
	fmul8x16au	%f8,	%f18,	%f18
	edge8	%i7,	%i1,	%o0
loop_2874:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x20] %asi,	%g6
	smul	%i3,	0x0868,	%i4
	movgu	%icc,	%l5,	%i0
	set	0x7C, %l4
	stwa	%o7,	[%l7 + %l4] 0x81
	xnorcc	%o3,	0x1F0E,	%i2
	set	0x60, %o7
	prefetcha	[%l7 + %o7] 0x0c,	 0x0
	ta	%xcc,	0x1
	fxnors	%f31,	%f31,	%f15
	movne	%icc,	%o1,	%g7
	tne	%xcc,	0x2
	edge8ln	%o2,	%l6,	%i6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g4
	fcmpes	%fcc2,	%f10,	%f4
	tcs	%icc,	0x4
	array32	%l4,	%g1,	%g3
	fmovsn	%xcc,	%f20,	%f25
	edge16n	%o5,	%g2,	%l2
	edge16n	%o6,	%l1,	%l0
	mulx	%o4,	%g5,	%i5
	movl	%xcc,	%i7,	%i1
	fand	%f12,	%f14,	%f20
	fbug,a	%fcc3,	loop_2875
	taddcctv	%o0,	0x0C3F,	%g6
	sll	%i3,	0x0F,	%i4
	ldsh	[%l7 + 0x42],	%i0
loop_2875:
	edge8l	%o7,	%l5,	%o3
	tne	%xcc,	0x1
	fbul	%fcc1,	loop_2876
	fbuge,a	%fcc0,	loop_2877
	edge16ln	%l3,	%o1,	%g7
	fbule	%fcc3,	loop_2878
loop_2876:
	movrlez	%i2,	%o2,	%i6
loop_2877:
	edge8ln	%l6,	%g4,	%l4
	srl	%g1,	%g3,	%o5
loop_2878:
	fmovsn	%icc,	%f17,	%f26
	movl	%xcc,	%g2,	%l2
	bn,pn	%icc,	loop_2879
	umulcc	%l1,	%o6,	%o4
	movvc	%xcc,	%l0,	%i5
	bcc,a	loop_2880
loop_2879:
	fabss	%f11,	%f15
	xor	%i7,	0x0B6E,	%i1
	fbo,a	%fcc3,	loop_2881
loop_2880:
	fmovrdgz	%o0,	%f24,	%f28
	bleu	loop_2882
	edge32ln	%g5,	%g6,	%i4
loop_2881:
	tsubcc	%i3,	%o7,	%l5
	set	0x5B, %g3
	ldsba	[%l7 + %g3] 0x10,	%o3
loop_2882:
	alignaddrl	%l3,	%o1,	%i0
	srax	%g7,	0x00,	%i2
	fmovdne	%icc,	%f9,	%f10
	set	0x44, %g1
	lduwa	[%l7 + %g1] 0x10,	%i6
	addc	%l6,	0x1BE0,	%g4
	fmovrse	%l4,	%f12,	%f26
	array32	%o2,	%g1,	%g3
	fmovsge	%xcc,	%f8,	%f15
	edge8ln	%g2,	%o5,	%l2
	wr	%g0,	0x2f,	%asi
	stda	%l0,	[%l7 + 0x30] %asi
	membar	#Sync
	fnand	%f12,	%f10,	%f8
	alignaddr	%o6,	%l0,	%o4
	brgz	%i5,	loop_2883
	sir	0x179E
	xnorcc	%i1,	0x1851,	%o0
	fmovsle	%xcc,	%f31,	%f15
loop_2883:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc2,	loop_2884
	taddcctv	%i7,	0x0A48,	%g5
	movrne	%g6,	0x0A1,	%i4
	bcs,pt	%xcc,	loop_2885
loop_2884:
	andcc	%o7,	0x0961,	%i3
	subccc	%l5,	0x1917,	%l3
	xnorcc	%o3,	0x1AA6,	%o1
loop_2885:
	orcc	%i0,	0x15B7,	%i2
	addc	%g7,	%l6,	%g4
	fmovsn	%xcc,	%f17,	%f5
	popc	%l4,	%o2
	brz,a	%g1,	loop_2886
	movleu	%xcc,	%i6,	%g3
	addc	%g2,	0x00B0,	%o5
	fmovde	%xcc,	%f26,	%f1
loop_2886:
	bgu	%xcc,	loop_2887
	edge16l	%l2,	%l1,	%o6
	fbg	%fcc3,	loop_2888
	xorcc	%o4,	0x0B23,	%l0
loop_2887:
	fcmped	%fcc0,	%f6,	%f6
	te	%xcc,	0x1
loop_2888:
	tl	%xcc,	0x2
	fmovrslez	%i5,	%f25,	%f28
	set	0x2D, %o3
	lduba	[%l7 + %o3] 0x89,	%o0
	alignaddrl	%i1,	%g5,	%i7
	bvs,a	%icc,	loop_2889
	fornot1	%f12,	%f2,	%f28
	orn	%g6,	0x1034,	%i4
	xorcc	%i3,	0x13E3,	%o7
loop_2889:
	movrne	%l5,	0x214,	%l3
	taddcctv	%o1,	0x10B5,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o3,	%i2,	%l6
	tle	%xcc,	0x7
	xorcc	%g7,	%g4,	%o2
	ldx	[%l7 + 0x28],	%l4
	orncc	%g1,	0x0B9F,	%i6
	fmul8ulx16	%f26,	%f8,	%f2
	fnot1s	%f17,	%f6
	srl	%g2,	%g3,	%l2
	fmovdcs	%icc,	%f28,	%f13
	umulcc	%l1,	%o6,	%o5
	taddcc	%o4,	0x1D54,	%i5
	fbu,a	%fcc0,	loop_2890
	fmovse	%xcc,	%f3,	%f28
	movne	%xcc,	%o0,	%i1
	xorcc	%l0,	%g5,	%i7
loop_2890:
	tleu	%icc,	0x4
	subccc	%i4,	0x03AE,	%g6
	andn	%i3,	0x003E,	%o7
	tleu	%icc,	0x3
	movrgez	%l5,	0x147,	%o1
	membar	0x1A
	edge8l	%i0,	%l3,	%i2
	fcmpne16	%f30,	%f0,	%l6
	fmovscs	%xcc,	%f4,	%f4
	fbg,a	%fcc1,	loop_2891
	edge8l	%o3,	%g7,	%o2
	edge16ln	%g4,	%l4,	%g1
	orcc	%i6,	0x04C5,	%g2
loop_2891:
	fmovdpos	%xcc,	%f14,	%f25
	fbe,a	%fcc2,	loop_2892
	edge8ln	%g3,	%l2,	%l1
	subccc	%o5,	0x03B8,	%o4
	addc	%o6,	0x1F39,	%i5
loop_2892:
	subcc	%i1,	%l0,	%g5
	tne	%icc,	0x3
	brlez,a	%i7,	loop_2893
	fbe,a	%fcc0,	loop_2894
	tne	%icc,	0x5
	orcc	%i4,	%o0,	%i3
loop_2893:
	fmovsvs	%xcc,	%f14,	%f15
loop_2894:
	membar	0x65
	fmovscc	%icc,	%f20,	%f26
	movgu	%xcc,	%g6,	%l5
	fpadd16	%f6,	%f14,	%f10
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%o1
	movleu	%icc,	%i0,	%l3
	movle	%icc,	%o7,	%l6
	tvc	%xcc,	0x3
	movvc	%icc,	%i2,	%o3
	move	%xcc,	%g7,	%o2
	popc	0x1A87,	%l4
	xnorcc	%g4,	0x16B5,	%g1
	set	0x48, %l2
	stda	%g2,	[%l7 + %l2] 0x11
	fmovrsne	%g3,	%f5,	%f22
	orncc	%l2,	%l1,	%i6
	wr	%g0,	0x11,	%asi
	stwa	%o5,	[%l7 + 0x5C] %asi
	andcc	%o4,	0x11F2,	%i5
	fpackfix	%f2,	%f16
	movge	%icc,	%o6,	%l0
	tn	%xcc,	0x2
	fpack16	%f20,	%f11
	nop
	set	0x24, %o2
	sth	%i1,	[%l7 + %o2]
	set	0x5C, %g7
	lda	[%l7 + %g7] 0x89,	%f28
	fmovrdlez	%i7,	%f28,	%f4
	add	%i4,	0x0175,	%g5
	ble,a	loop_2895
	bpos,a,pt	%icc,	loop_2896
	tn	%icc,	0x7
	movrlz	%o0,	0x2D8,	%g6
loop_2895:
	tvc	%xcc,	0x2
loop_2896:
	tleu	%icc,	0x6
	pdist	%f28,	%f26,	%f20
	orn	%l5,	0x190A,	%o1
	movrlez	%i0,	0x1C7,	%i3
	add	%l3,	0x0EF9,	%o7
	fmovsl	%xcc,	%f12,	%f6
	fand	%f8,	%f20,	%f22
	udivcc	%i2,	0x1880,	%l6
	sub	%o3,	%g7,	%l4
	fba,a	%fcc2,	loop_2897
	stx	%g4,	[%l7 + 0x30]
	edge16ln	%g1,	%o2,	%g2
	fzero	%f4
loop_2897:
	fand	%f22,	%f8,	%f0
	movle	%icc,	%g3,	%l2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x1f
	membar	#Sync
	movrlz	%l1,	%i6,	%o5
	tneg	%xcc,	0x7
	andn	%o4,	0x113F,	%i5
	tcc	%icc,	0x0
	array8	%l0,	%o6,	%i7
	tvs	%xcc,	0x7
	sll	%i1,	%i4,	%g5
	fsrc2s	%f7,	%f6
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
	tgu	%icc,	0x6
	srlx	%g6,	%l5,	%o0
	fbu,a	%fcc2,	loop_2899
loop_2898:
	edge16n	%o1,	%i3,	%i0
	fbue	%fcc3,	loop_2900
	tl	%icc,	0x5
loop_2899:
	array8	%l3,	%o7,	%l6
	sra	%i2,	%o3,	%l4
loop_2900:
	fsrc1s	%f7,	%f10
	tsubcc	%g7,	0x01B3,	%g4
	fmovdpos	%icc,	%f10,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc0,	%f21,	%f8
	lduh	[%l7 + 0x76],	%g1
	addccc	%g2,	%g3,	%o2
	fmovsne	%xcc,	%f14,	%f29
	ldsw	[%l7 + 0x40],	%l2
	movvc	%icc,	%i6,	%l1
	fmul8x16au	%f21,	%f31,	%f2
	tg	%xcc,	0x6
	sdiv	%o5,	0x1F2E,	%o4
	std	%f6,	[%l7 + 0x50]
	tleu	%icc,	0x7
	subcc	%i5,	0x1D9D,	%o6
	edge32n	%i7,	%l0,	%i1
	faligndata	%f8,	%f22,	%f28
	ba,a,pn	%xcc,	loop_2901
	sra	%i4,	0x11,	%g5
	fpsub16s	%f8,	%f24,	%f28
	subc	%g6,	%o0,	%l5
loop_2901:
	fmovsg	%icc,	%f24,	%f20
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%i3
	edge16ln	%o1,	%l3,	%o7
	edge16l	%i0,	%i2,	%l6
	orcc	%l4,	0x077F,	%o3
	fbule,a	%fcc2,	loop_2902
	tneg	%xcc,	0x5
	subc	%g7,	0x08EE,	%g4
	be,pt	%xcc,	loop_2903
loop_2902:
	edge8n	%g1,	%g2,	%g3
	movcs	%xcc,	%l2,	%o2
	orncc	%i6,	0x1BCF,	%l1
loop_2903:
	fmovdge	%xcc,	%f11,	%f29
	movrgez	%o4,	%i5,	%o6
	xnorcc	%i7,	%o5,	%i1
	movrlez	%l0,	%i4,	%g6
	fmovd	%f2,	%f20
	movrlez	%g5,	0x2A8,	%l5
	fnot1	%f8,	%f6
	movne	%xcc,	%o0,	%i3
	xnor	%l3,	%o1,	%i0
	edge8n	%i2,	%l6,	%l4
	sllx	%o7,	%g7,	%o3
	sllx	%g1,	%g4,	%g2
	udivcc	%l2,	0x16FB,	%g3
	srax	%o2,	%i6,	%l1
	swap	[%l7 + 0x14],	%i5
	set	0x34, %l3
	swapa	[%l7 + %l3] 0x18,	%o4
	srl	%o6,	0x04,	%o5
	sub	%i7,	0x1E21,	%l0
	ldub	[%l7 + 0x51],	%i4
	movge	%icc,	%g6,	%i1
	bcc,a,pt	%xcc,	loop_2904
	edge8l	%l5,	%o0,	%i3
	fands	%f20,	%f7,	%f10
	lduh	[%l7 + 0x1E],	%g5
loop_2904:
	tneg	%xcc,	0x3
	tn	%xcc,	0x6
	fnand	%f16,	%f12,	%f8
	sir	0x05C2
	fmovsvc	%icc,	%f23,	%f16
	fmovrsgez	%o1,	%f17,	%f6
	wr	%g0,	0x2f,	%asi
	stwa	%i0,	[%l7 + 0x1C] %asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bne,pt	%xcc,	loop_2905
	nop
	set	0x3C, %l1
	lduw	[%l7 + %l1],	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f23,	%f25
loop_2905:
	bge,a,pt	%icc,	loop_2906
	xnor	%i2,	%l6,	%l4
	fmovda	%xcc,	%f0,	%f18
	edge16l	%o7,	%o3,	%g7
loop_2906:
	edge8ln	%g1,	%g4,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc1,	%f31,	%f10
	array16	%g3,	%l2,	%i6
	sdiv	%l1,	0x0E92,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i5,	%o4
	faligndata	%f6,	%f6,	%f4
	xor	%o5,	0x0742,	%o6
	add	%l0,	0x04A7,	%i7
	tcs	%xcc,	0x1
	ld	[%l7 + 0x4C],	%f12
	addccc	%i4,	%i1,	%g6
	movneg	%xcc,	%l5,	%i3
	fcmpeq16	%f0,	%f16,	%o0
	movge	%icc,	%g5,	%i0
	srlx	%l3,	0x00,	%o1
	te	%icc,	0x0
	movvs	%icc,	%i2,	%l4
	ldd	[%l7 + 0x18],	%i6
	bpos,a	loop_2907
	fbg,a	%fcc0,	loop_2908
	orn	%o7,	%o3,	%g7
	movrgz	%g1,	0x1C2,	%g2
loop_2907:
	bleu	%icc,	loop_2909
loop_2908:
	movvc	%xcc,	%g4,	%l2
	edge16l	%g3,	%i6,	%o2
	edge16l	%i5,	%o4,	%o5
loop_2909:
	umulcc	%o6,	%l0,	%i7
	edge16ln	%l1,	%i4,	%g6
	movg	%icc,	%l5,	%i1
	sdivcc	%i3,	0x1F26,	%g5
	movrlz	%o0,	0x397,	%i0
	fcmpeq32	%f22,	%f6,	%o1
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16	%i2,	%l3,	%l6
	array32	%l4,	%o7,	%o3
	flush	%l7 + 0x18
	orcc	%g1,	%g2,	%g4
	srl	%l2,	0x04,	%g3
	bge,a	loop_2910
	edge32ln	%i6,	%o2,	%g7
	movrne	%i5,	%o4,	%o6
	fxor	%f24,	%f26,	%f12
loop_2910:
	fcmpeq32	%f24,	%f14,	%o5
	fmovs	%f8,	%f11
	fmovdgu	%xcc,	%f18,	%f11
	set	0x3C, %o6
	lda	[%l7 + %o6] 0x10,	%f16
	wr	%g0,	0x10,	%asi
	stha	%i7,	[%l7 + 0x3E] %asi
	fpsub16	%f0,	%f4,	%f30
	sra	%l1,	%i4,	%l0
	movneg	%icc,	%l5,	%g6
	sir	0x09C1
	movneg	%icc,	%i3,	%g5
	sethi	0x199B,	%o0
	edge16	%i1,	%o1,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i0,	0x045D,	%l3
	mova	%xcc,	%l4,	%o7
	subccc	%l6,	0x0AC1,	%o3
	sdiv	%g1,	0x0DDF,	%g4
	fnegd	%f16,	%f10
	edge8n	%l2,	%g2,	%g3
	sth	%i6,	[%l7 + 0x46]
	fbuge	%fcc0,	loop_2911
	sir	0x18B3
	set	0x28, %l6
	stwa	%o2,	[%l7 + %l6] 0x2f
	membar	#Sync
loop_2911:
	sir	0x0BA3
	addccc	%g7,	0x18FE,	%i5
	ba,pn	%xcc,	loop_2912
	movrlez	%o6,	%o5,	%i7
	udiv	%o4,	0x097A,	%i4
	sub	%l0,	%l1,	%g6
loop_2912:
	andn	%i3,	%g5,	%l5
	edge16	%o0,	%o1,	%i1
	movcs	%xcc,	%i0,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x44, %g2
	ldstuba	[%l7 + %g2] 0x80,	%l4
	edge8	%o7,	%i2,	%o3
	xor	%g1,	%l6,	%l2
	pdist	%f16,	%f0,	%f24
	fmul8ulx16	%f22,	%f6,	%f4
	movn	%xcc,	%g4,	%g3
	ta	%icc,	0x5
	wr	%g0,	0x22,	%asi
	stba	%i6,	[%l7 + 0x54] %asi
	membar	#Sync
	movrgez	%g2,	0x335,	%g7
	movg	%icc,	%i5,	%o2
	ba	loop_2913
	xnorcc	%o6,	0x135E,	%o5
	membar	0x10
	fcmpeq16	%f8,	%f24,	%o4
loop_2913:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2805
!	Type cti   	: 2913
!	Type x   	: 1344
!	Type f   	: 4421
!	Type i   	: 13517
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x294CA1CD
.word 0xA26A3ACF
.word 0xAD170742
.word 0xCDD6E89C
.word 0x06824EFA
.word 0xBEEA43E6
.word 0x6951037C
.word 0x9CF7B92D
.word 0x02378FBA
.word 0x322A2681
.word 0xE8FAB93D
.word 0x7D96DE0A
.word 0x45D5B5E9
.word 0xB4F25725
.word 0x638B95B6
.word 0xAC223EED
.word 0x1CFCECB5
.word 0x62C9884D
.word 0x216D95BA
.word 0x5B0FB855
.word 0xF391CDF9
.word 0x4715D88E
.word 0xBAC90219
.word 0xFB7BB4B7
.word 0xEBA9B3F1
.word 0x737ECE0C
.word 0x4ED97264
.word 0x9406D26A
.word 0x1B374480
.word 0x9B67EAF0
.word 0xCD284B38
.word 0x2EC963F5
.word 0x04E9573D
.word 0x8198B0E5
.word 0x6258C53D
.word 0x6849AF36
.word 0x18CB2083
.word 0xEA208F08
.word 0x7D701F2E
.word 0x822E70D8
.word 0xB27BEE4A
.word 0x9E81D329
.word 0x92EEBE6D
.word 0x4F67BF24
.word 0xFC0B0CA6
.word 0x970E6395
.word 0xDCD89909
.word 0x8B0A5437
.word 0x88A83A4B
.word 0xC46C107D
.word 0x73E1D095
.word 0x09F865E6
.word 0x3093F109
.word 0xC969BA40
.word 0x938D8073
.word 0xFE6A550E
.word 0x63C17AFF
.word 0x4AC299CF
.word 0xFA0A9C3F
.word 0xA784EEAA
.word 0x91360C37
.word 0x3133A1F7
.word 0xAA529C5C
.word 0x2378FCAA
.end
