/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_stfsr_traps_22.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12387"
.ident "Mon Dec  8 19:56:04 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_stfsr_traps_22.s,v 1.4 2007/07/27 21:45:32 drp Exp $"
#include "defines.h"
#include "nmacros.h"
#include "old_boot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	! Get TID/DIAG DATA AREA. Separate memory for each thread.
	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	DIAG_DATA_AREA, %g1, %g3
	add	%l7, %g3, %l7

	cmp %l6, 0x0
	be main_t0
	nop
	cmp %l6, 0x1
	be main_t1
	nop
	cmp %l6, 0x2
	be main_t2
	nop
	cmp %l6, 0x3
	be main_t3
	nop
	cmp %l6, 0x4
	be main_t4
	nop
	cmp %l6, 0x5
	be main_t5
	nop
	cmp %l6, 0x6
	be main_t6
	nop
	cmp %l6, 0x7
	be main_t7
	nop
	EXIT_GOOD
!
! Thread 0 Start
!
main_t0:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0x4,	%g2
	set	0x1,	%g3
	set	0xD,	%g4
	set	0x6,	%g5
	set	0x8,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x3,	%i1
	set	-0x5,	%i2
	set	-0x3,	%i3
	set	-0x4,	%i4
	set	-0xA,	%i5
	set	-0xD,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x6B73716B,	%l0
	set	0x05EB1F11,	%l1
	set	0x6C42EC90,	%l2
	set	0x646E48A5,	%l3
	set	0x4A6774DB,	%l4
	set	0x5A204DA8,	%l5
	set	0x1CD90970,	%l6
	!# Output registers
	set	-0x137F,	%o0
	set	-0x1D16,	%o1
	set	-0x0049,	%o2
	set	-0x0998,	%o3
	set	0x0213,	%o4
	set	0x0400,	%o5
	set	-0x1BEB,	%o6
	set	-0x00F7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	tcc	%icc,	0x5
	fpadd32	%f18,	%f2,	%f2
	alignaddr	%l1,	%l0,	%g3
	swap	[%l7 + 0x0C],	%i3
	fmovrslz	%i7,	%f30,	%f24
	fbe,a	%fcc1,	loop_1
	tge	%xcc,	0x4
	st	%fsr,	[%l7 + 0x0C]
	alignaddrl	%l3,	%i0,	%o5
loop_1:
	nop
	setx	0xAE6F8A512DD43C0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f4
	fzero	%f30
	fmovduge	%fcc3,	%f30,	%f26
	fnot1	%f24,	%f10
	fabsd	%f0,	%f30
	movre	%g4,	0x052,	%g2
	fnands	%f0,	%f16,	%f1
	fmuld8ulx16	%f15,	%f13,	%f18
	edge32ln	%o7,	%i1,	%o2
	set	0x78, %l2
	stda	%g6,	[%l7 + %l2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	orcc	%o1,	0x1BE8,	%l5
	rdhpr	%hpstate,	%i5
	edge8l	%g1,	%o3,	%i2
	add	%g5,	0x068F,	%o0
	fsrc1s	%f5,	%f29
	subc	%g7,	0x1A7F,	%o4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movrne	%l2,	0x04F,	%l4
	sllx	%i4,	%o6,	%l6
	nop
	set	0x50, %l1
	stx	%i6,	[%l7 + %l1]
	fbue,pt	%fcc2,	loop_2
	addcc	%l1,	%l0,	%i3
	movcc	%xcc,	0x538,	%i7
	add	%l3,	%i0,	%o5
loop_2:
	st	%fsr,	[%l7 + 0x0C]
	nop
	fitos	%f9,	%f31
	fstod	%f31,	%f20
	fmovdvc	%icc,	%f4,	%f10
	fpsub32	%f24,	%f6,	%f12
	rdpr	%wstate,	%g4
	st	%fsr,	[%l7 + 0x0C]
	wrpr 	%g0, 	0x0, 	%gl
	st	%fsr,	[%l7 + 0x4C]
	mulx	%o7,	%i1,	%g3
	st	%fsr,	[%l7 + 0x48]
	orcc	%o2,	0x0987,	%g6
	st	%fsr,	[%l7 + 0x70]
	addc	%o1,	%i5,	%l5
	rd	%y,	%g1
	tsubcc	%i2,	0x18FB,	%g5
	fmovsge	%xcc,	%f20,	%f13
	fmuld8ulx16	%f24,	%f5,	%f20
	sll	%o0,	0x1C,	%o3
	popc	%o4,	%l2
	mova	%fcc1,	0x07E,	%l4
	fmovrslz	%g7,	%f2,	%f6
	movcc	%icc,	0x54D,	%o6
	bshuffle	%f8,	%f10,	%f16
	fmovsvs	%xcc,	%f15,	%f12
	st	%fsr,	[%l7 + 0x24]
	st	%fsr,	[%l7 + 0x28]
	fmul8ulx16	%f6,	%f6,	%f22
	fxnor	%f2,	%f6,	%f6
	fmovrslz	%l6,	%f17,	%f25
	nop
	set	0x72, %l6
	sth	%i4,	[%l7 + %l6]
	movg	%fcc0,	%i6,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC2, 	%hsys_tick_cmpr
	st	%f9,	[%l7 + 0x70]
	andncc	%l3,	0x143F,	%i0
	ldd	[%l7 + 0x40],	%f18
	st	%fsr,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x78]
	membar	0x2F
	st	%fsr,	[%l7 + 0x50]
	fmovdvc	%icc,	%f8,	%f2
	st	%fsr,	[%l7 + 0x50]
	stbar
	brgz,a,pn	%l0,	loop_3
	st	%fsr,	[%l7 + 0x44]
	edge8l	%g4,	%g2,	%o7
	movo	%fcc0,	%i1,	%o5
loop_3:
	fcmpne16	%f4,	%f12,	%o2
	st	%fsr,	[%l7 + 0x7C]
	movneg	%xcc,	0x331,	%g3
	fmovdule	%fcc3,	%f26,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x39, %o7
	ldstub	[%l7 + %o7],	%i5
	movl	%icc,	0x5C3,	%g6
	st	%fsr,	[%l7 + 0x38]
	movcc	%xcc,	%l5,	%i2
	movug	%fcc1,	0x346,	%g5
	membar	0x46
	fnot1s	%f18,	%f13
	movge	%xcc,	%g1,	%o3
	st	%fsr,	[%l7 + 0x60]
	sethi	0x00BF,	%o4
	st	%fsr,	[%l7 + 0x38]
	fmovdcs	%icc,	%f20,	%f28
	fbn,a	%fcc3,	loop_4
	brlz,a,pn	%o0,	loop_5
	rdpr	%gl,	%l2
	srl	%g7,	%o6,	%l4
loop_4:
	fmul8x16au	%f23,	%f21,	%f28
loop_5:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movrgez	%l6,	%i4,	%i6
	or	%l1,	0x128B,	%i7
	movneg	%icc,	0x7B9,	%l3
	nop
	set	0x58, %l3
	stx	%fsr,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x1C]
	st	%fsr,	[%l7 + 0x18]
	subc	%i0,	0x014A,	%l0
	fmovrse	%g4,	%f4,	%f21
	movge	%xcc,	%i3,	%o7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdn	%fcc2,	%f0,	%f30
	fpmerge	%f15,	%f6,	%f24
	nop
	setx	0x126920DF7CB7F5E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0EB397608DCB85F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f26,	%f6
	st	%fsr,	[%l7 + 0x50]
	rdpr	%cansave,	%g2
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o5
	fpsub16s	%f18,	%f31,	%f12
	fmovsn	%fcc1,	%f21,	%f19
	movuge	%fcc2,	%i1,	%g3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fandnot2s	%f5,	%f26,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCF9, 	%tick_cmpr
	edge8l	%o1,	%i5,	%g6
	fmovscs	%xcc,	%f15,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2E1, 	%hsys_tick_cmpr
	st	%fsr,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x34]
	movrgz	%g5,	0x0DB,	%g1
	fmovduge	%fcc3,	%f2,	%f12
	fnot2	%f0,	%f6
	fmovrdne	%o3,	%f26,	%f4
	ldub	[%l7 + 0x4B],	%o4
	edge16ln	%i2,	%l2,	%g7
	bvs,a	%xcc,	loop_6
	fmovdge	%xcc,	%f24,	%f12
	st	%fsr,	[%l7 + 0x58]
	xnorcc	%o0,	0x072F,	%o6
loop_6:
	stb	%l4,	[%l7 + 0x54]
	brz,a	%l6,	loop_7
	fmovdneg	%xcc,	%f2,	%f14
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f4
	fxtod	%f4,	%f20
loop_7:
	tge	%xcc,	0x4
	fmovsvc	%xcc,	%f26,	%f13
	nop
	set	0x6B, %g4
	stb	%i6,	[%l7 + %g4]
	array8	%i4,	%i7,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE1, 	%hsys_tick_cmpr
	andcc	%i0,	%l0,	%i3
	movrlz	%g4,	%o7,	%o5
	wr	%g0,	0xd1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	popc	%g2,	%g3
	nop
	setx	0x16C0,	%l0,	%o1
	sdivx	%i1,	%o1,	%i5
	fmovsul	%fcc0,	%f6,	%f11
	fble,pn	%fcc1,	loop_8
	fmovsule	%fcc2,	%f4,	%f27
	fba	%fcc1,	loop_9
	srlx	%g6,	0x0F,	%o2
loop_8:
	tg	%icc,	0x5
	fpadd16	%f8,	%f12,	%f12
loop_9:
	flushw
	bgu,a,pt	%icc,	loop_10
	fpadd16s	%f9,	%f15,	%f1
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x24]
loop_10:
	st	%fsr,	[%l7 + 0x1C]
	st	%fsr,	[%l7 + 0x10]
	fmovsule	%fcc1,	%f7,	%f8
	st	%fsr,	[%l7 + 0x50]
	movneg	%xcc,	%l5,	%g5
	st	%fsr,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x4C]
	st	%fsr,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x30]
	sir	0x0820
	sll	%g1,	%o3,	%i2
	tpos	%xcc,	0x4
	fnor	%f8,	%f16,	%f28
	st	%fsr,	[%l7 + 0x5C]
	bvc,pn	%icc,	loop_11
	addccc	%l2,	0x07CF,	%o4
	fone	%f14
	set	0x40, %o0
	stha	%g7,	[%l7 + %o0] 0x2f
	membar	#Sync
loop_11:
	st	%fsr,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x24]
	nop
	setx	0x063D,	%l0,	%o6
	sdivcc	%o0,	%o6,	%l4
	sll	%i6,	%i4,	%i7
	movl	%fcc3,	0x674,	%l6
	st	%fsr,	[%l7 + 0x24]
	st	%fsr,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x48]
	nop
	fitos	%f9,	%f25
	wrpr	%l1,	0x08ED,	%cwp
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 55
!	Type a   	: 12
!	Type x   	: 4
!	Type cti   	: 11
!	Type f   	: 50
!	Type i   	: 68
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
main_t1:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xD,	%g1
	set	0x5,	%g2
	set	0x8,	%g3
	set	0x4,	%g4
	set	0x9,	%g5
	set	0xA,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xB,	%i1
	set	-0xB,	%i2
	set	-0x9,	%i3
	set	-0x0,	%i4
	set	-0x5,	%i5
	set	-0xE,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x7685806A,	%l0
	set	0x37E7DC2B,	%l1
	set	0x71FF9317,	%l2
	set	0x41ACEFDD,	%l3
	set	0x0EB9C626,	%l4
	set	0x78C202D8,	%l5
	set	0x48628AB1,	%l6
	!# Output registers
	set	0x0A0A,	%o0
	set	0x0842,	%o1
	set	0x1810,	%o2
	set	0x1296,	%o3
	set	0x1A32,	%o4
	set	-0x16CE,	%o5
	set	0x1AF4,	%o6
	set	-0x08D0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	bgu,pn	%xcc,	loop_12
	st	%fsr,	[%l7 + 0x38]
	fmovsu	%fcc2,	%f11,	%f16
	nop
	setx	0x1D1D,	%l0,	%l3
	sdivcc	%i0,	%l3,	%l0
loop_12:
	st	%fsr,	[%l7 + 0x4C]
	rd	%asi,	%g4
	fbo,a,pn	%fcc1,	loop_13
	fmovdpos	%icc,	%f2,	%f30
	edge32l	%o7,	%o5,	%i3
	nop
	setx	0x9972168E7072D22D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f18
loop_13:
	wrpr	%g2,	%i1,	%cwp
	rd	%softint,	%o1
	st	%fsr,	[%l7 + 0x7C]
	fmovduge	%fcc1,	%f12,	%f16
	st	%fsr,	[%l7 + 0x20]
	movrne	%i5,	%g3,	%o2
	fmovdvc	%xcc,	%f6,	%f0
	wr	%l5,	0x0EEC,	%ccr
	tgu	%xcc,	0x2
	rdpr	%pil,	%g5
	swap	[%l7 + 0x58],	%g1
	ta	%icc,	0x6
	move	%xcc,	%g6,	%o3
	st	%fsr,	[%l7 + 0x44]
	fmovdu	%fcc0,	%f12,	%f30
	st	%fsr,	[%l7 + 0x34]
	movue	%fcc1,	0x4B1,	%i2
	st	%fsr,	[%l7 + 0x28]
	addc	%l2,	0x0BDE,	%o4
	pdist	%f12,	%f18,	%f8
	movue	%fcc2,	%g7,	%o6
	fmovsule	%fcc3,	%f1,	%f12
	fpadd32s	%f29,	%f14,	%f21
	rd	%asi,	%o0
	fpadd32	%f4,	%f22,	%f22
	movgu	%icc,	%l4,	%i4
	tsubcctv	%i6,	%l6,	%i7
	set	0x6A, %i5
	stha	%l1,	[%l7 + %i5] 0x10
	fmovscs	%xcc,	%f7,	%f25
	st	%fsr,	[%l7 + 0x48]
	nop
	setx	0xAC49407F09B6DC6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f26
	st	%fsr,	[%l7 + 0x74]
	brlez,pn	%i0,	loop_14
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f10
	st	%fsr,	[%l7 + 0x48]
	fnot1	%f16,	%f30
loop_14:
	wr	%l0,	%g4,	%softint
	movcc	%icc,	%o7,	%l3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd9,	%f0
	movu	%fcc0,	0x31B,	%o5
	st	%fsr,	[%l7 + 0x18]
	fornot2	%f6,	%f20,	%f24
	fble	%fcc1,	loop_15
	bgu,pn	%icc,	loop_16
	taddcctv	%g2,	0x1371,	%i3
	fmovrdne	%i1,	%f24,	%f28
loop_15:
	wrpr	%i5,	%o1,	%pil
loop_16:
	rd	%pc,	%g3
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	rd	%asi,	%l5
	tneg	%icc,	0x2
	bgu,a,pn	%icc,	loop_17
	edge8	%g5,	%o2,	%g6
	ta	%xcc,	0x1
	and	%g1,	%i2,	%l2
loop_17:
	st	%fsr,	[%l7 + 0x60]
	st	%fsr,	[%l7 + 0x40]
	ldsb	[%l7 + 0x61],	%o3
	fmul8sux16	%f14,	%f20,	%f18
	fble,a	%fcc3,	loop_18
	stw	%o4,	[%l7 + 0x44]
	st	%fsr,	[%l7 + 0x08]
	fbule	%fcc2,	loop_19
loop_18:
	st	%fsr,	[%l7 + 0x58]
	fmovdcc	%icc,	%f8,	%f0
	nop
	setx	0x2CE9C0DB22627062,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1EE9BED3B923B078,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f22,	%f2
loop_19:
	st	%fsr,	[%l7 + 0x1C]
	tg	%icc,	0x7
	st	%fsr,	[%l7 + 0x58]
	fcmple32	%f26,	%f14,	%o6
	fmovdneg	%icc,	%f8,	%f0
	st	%fsr,	[%l7 + 0x30]
	stbar
	fone	%f24
	st	%fsr,	[%l7 + 0x5C]
	rd	%y,	%g7
	st	%fsr,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x20]
	alignaddr	%o0,	%i4,	%i6
	wr	%l6,	%i7,	%sys_tick
	fand	%f30,	%f24,	%f0
	st	%fsr,	[%l7 + 0x7C]
	fmovsneg	%xcc,	%f16,	%f2
	stx	%l1,	[%l7 + 0x70]
	wr	%g0,	0x10,	%asi
	sta	%f22,	[%l7 + 0x08] %asi
	addcc	%l4,	0x0977,	%i0
	fmovdle	%xcc,	%f8,	%f6
	st	%fsr,	[%l7 + 0x70]
	brgez	%l0,	loop_20
	st	%fsr,	[%l7 + 0x5C]
	fpsub16s	%f7,	%f26,	%f20
	movcc	%icc,	%g4,	%l3
loop_20:
	edge16n	%o7,	%o5,	%i3
	rdpr	%tl,	%i1
	fxor	%f10,	%f2,	%f16
	nop
	setx	0x2C19EB62211A325E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6A228ABD79DC21DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f20,	%f4
	fbl,pn	%fcc0,	loop_21
	fbuge,pn	%fcc2,	loop_22
	st	%fsr,	[%l7 + 0x20]
	move	%fcc0,	%i5,	%g2
loop_21:
	alignaddr	%o1,	%g3,	%l5
loop_22:
	tcc	%icc,	0x5
	tg	%icc,	0x5
	orncc	%o2,	0x1F6D,	%g5
	fmovdo	%fcc3,	%f20,	%f26
	orncc	%g6,	%g1,	%i2
	movrgz	%l2,	0x152,	%o3
	rdhpr	%hpstate,	%o6
	smulcc	%o4,	%g7,	%o0
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f4
	fnot1s	%f5,	%f3
	or	%i4,	%i6,	%l6
	movpos	%xcc,	0x2BE,	%l1
	st	%fsr,	[%l7 + 0x38]
	fands	%f24,	%f7,	%f12
	orcc	%l4,	%i0,	%l0
	st	%fsr,	[%l7 + 0x58]
	movpos	%icc,	%g4,	%l3
	fmovse	%fcc2,	%f12,	%f8
	fmovrde	%i7,	%f30,	%f10
	fmovdule	%fcc0,	%f6,	%f4
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%o6
	st	%fsr,	[%l7 + 0x2C]
	alignaddr	%i3,	%i1,	%o5
	fmovdu	%fcc0,	%f16,	%f4
	fmovsvs	%xcc,	%f0,	%f22
	fmovscc	%xcc,	%f8,	%f14
	fcmps	%fcc3,	%f17,	%f15
	st	%fsr,	[%l7 + 0x5C]
	addc	%g2,	%i5,	%o1
	movre	%l5,	0x271,	%g3
	bleu,pt	%icc,	loop_23
	st	%fsr,	[%l7 + 0x14]
	st	%fsr,	[%l7 + 0x6C]
	fmovsa	%xcc,	%f25,	%f27
loop_23:
	edge32n	%g5,	%g6,	%o2
	nop
	setx	0x1274,	%l0,	%l2
	udivcc	%i2,	%l2,	%o3
	st	%fsr,	[%l7 + 0x14]
	set	0x4A, %l0
	lduha	[%l7 + %l0] 0x81,	%g1
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x28]
	orn	%o6,	%g7,	%o4
	smul	%i4,	0x1C13,	%o0
	fmovs	%f25,	%f6
	fmovdule	%fcc1,	%f0,	%f4
	fsrc2	%f22,	%f26
	movvc	%xcc,	%l6,	%l1
	orncc	%l4,	%i6,	%l0
	nop
	fitos	%f8,	%f9
	edge32ln	%g4,	%l3,	%i7
	rdpr	%otherwin,	%i0
	tcs	%xcc,	0x4
	fzero	%f26
	rd	%ccr,	%i3
	fzero	%f6
	st	%fsr,	[%l7 + 0x7C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x556, 	%hsys_tick_cmpr
	wrpr 	%g0, 	0x2, 	%gl
	rd	%sys_tick_cmpr,	%o1
	fxnors	%f7,	%f1,	%f4
	st	%fsr,	[%l7 + 0x28]
	fmovsneg	%xcc,	%f21,	%f27
	fmovsleu	%xcc,	%f16,	%f25
	st	%fsr,	[%l7 + 0x34]
	edge32l	%l5,	%g3,	%o5
	nop
	setx	0x32D19367,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xF9B5E97B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f0,	%f25
	bn,pt	%xcc,	loop_24
	st	%fsr,	[%l7 + 0x08]
	ldx	[%l7 + 0x78],	%g6
	fmovrse	%g5,	%f22,	%f0
loop_24:
	nop
	fitos	%f5,	%f5
	fstoi	%f5,	%f6
	udiv	%o2,	0x165A,	%i2
	st	%fsr,	[%l7 + 0x28]
	alignaddrl	%l2,	%o3,	%o6
	st	%fsr,	[%l7 + 0x2C]
	rdpr	%canrestore,	%g1
	fmovrsgez	%g7,	%f9,	%f26
	st	%fsr,	[%l7 + 0x3C]
	fmul8x16au	%f30,	%f15,	%f12
	add	%i4,	%o0,	%o4
	st	%fsr,	[%l7 + 0x50]
	tvc	%icc,	0x2
	tpos	%icc,	0x2
	mova	%icc,	0x603,	%l6
	add	%l4,	%l1,	%l0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 57
!	Type a   	: 20
!	Type x   	: 4
!	Type cti   	: 13
!	Type f   	: 52
!	Type i   	: 54
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
main_t2:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xA,	%g1
	set	0x0,	%g2
	set	0xF,	%g3
	set	0x1,	%g4
	set	0x8,	%g5
	set	0xA,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x6,	%i1
	set	-0x2,	%i2
	set	-0xA,	%i3
	set	-0xB,	%i4
	set	-0xD,	%i5
	set	-0x3,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x5039558F,	%l0
	set	0x6680A21B,	%l1
	set	0x4BF3CDDC,	%l2
	set	0x0F3E6246,	%l3
	set	0x656510D6,	%l4
	set	0x582FE47A,	%l5
	set	0x12B916C3,	%l6
	!# Output registers
	set	-0x0680,	%o0
	set	-0x1C4C,	%o1
	set	0x0643,	%o2
	set	-0x1FE5,	%o3
	set	-0x0040,	%o4
	set	0x1E70,	%o5
	set	-0x0D6F,	%o6
	set	-0x1034,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	fcmps	%fcc2,	%f21,	%f9
	srl	%i6,	%l3,	%g4
	fnot2s	%f24,	%f12
	edge8l	%i0,	%i7,	%i3
	subcc	%o7,	0x0BEF,	%g2
	movrlz	%i1,	%o1,	%i5
	tvs	%xcc,	0x4
	fmovsgu	%icc,	%f2,	%f5
	movrlez	%g3,	%o5,	%g6
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x1C]
	ldx	[%l7 + 0x20],	%g5
	fmovs	%f15,	%f31
	st	%fsr,	[%l7 + 0x70]
	fmovslg	%fcc1,	%f31,	%f25
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f12
	fxtos	%f12,	%f14
	st	%fsr,	[%l7 + 0x70]
	rd	%softint,	%l5
	fmovsug	%fcc0,	%f4,	%f11
	ldsw	[%l7 + 0x70],	%i2
	bcs,a,pt	%xcc,	loop_25
	st	%fsr,	[%l7 + 0x58]
	fand	%f30,	%f26,	%f2
	nop
	set	0x5A, %i1
	stb	%o2,	[%l7 + %i1]
loop_25:
	subccc	%o3,	%o6,	%g1
	stbar
	st	%fsr,	[%l7 + 0x40]
	udiv	%l2,	0x14E1,	%g7
	fmovse	%fcc2,	%f23,	%f15
	mulscc	%o0,	0x1BFC,	%o4
	fmovrse	%i4,	%f24,	%f16
	st	%fsr,	[%l7 + 0x48]
	wrpr	%l4,	0x1B7E,	%pil
	st	%fsr,	[%l7 + 0x34]
	movuge	%fcc3,	%l6,	%l1
	tgu	%icc,	0x4
	wrpr	%l0,	0x0B1C,	%tick
	sll	%i6,	%l3,	%g4
	alignaddr	%i0,	%i7,	%o7
	fpadd16	%f28,	%f30,	%f30
	prefetch	[%l7 + 0x14],	 3
	fbg,a,pt	%fcc0,	loop_26
	sub	%i3,	%g2,	%i1
	st	%fsr,	[%l7 + 0x58]
	fmovsvc	%xcc,	%f27,	%f13
loop_26:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%fsr,	[%l7 + 0x40]
	fcmple16	%f22,	%f26,	%i5
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x4C]
	fmovdne	%fcc3,	%f10,	%f6
	fands	%f26,	%f1,	%f13
	st	%fsr,	[%l7 + 0x50]
	nop
	setx	0x0290,	%l0,	%g5
	udiv	%g6,	%g5,	%l5
	fxors	%f23,	%f2,	%f30
	nop
	fitos	%f8,	%f1
	fstox	%f1,	%f18
	fxtos	%f18,	%f22
	fmovd	%f10,	%f4
	array8	%o5,	%i2,	%o3
	movrlz	%o6,	%g1,	%o2
	movrgz	%g7,	%o0,	%o4
	sllx	%l2,	%i4,	%l4
	st	%fsr,	[%l7 + 0x08]
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	st	%fsr,	[%l7 + 0x68]
	tle	%icc,	0x7
	fones	%f25
	alignaddr	%l1,	%i6,	%l3
	edge8	%g4,	%i0,	%l0
	st	%fsr,	[%l7 + 0x7C]
	movcc	%xcc,	0x2FB,	%i7
	fmovrde	%i3,	%f0,	%f2
	tgu	%icc,	0x3
	st	%fsr,	[%l7 + 0x24]
	fbuge,a	%fcc3,	loop_27
	fmovdne	%icc,	%f28,	%f18
	wrpr	%g2,	%i1,	%pil
	st	%fsr,	[%l7 + 0x2C]
loop_27:
	fmovdl	%xcc,	%f26,	%f0
	nop
	setx	0x63A72EFA427D853E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2D131417,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f24,	%f28
	fmovsgu	%icc,	%f0,	%f23
	fmovsne	%fcc3,	%f17,	%f21
	movul	%fcc3,	%o7,	%o1
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x44]
	st	%fsr,	[%l7 + 0x7C]
	bcs,a	%xcc,	loop_28
	ldub	[%l7 + 0x45],	%g3
	wr	%g6,	%i5,	%clear_softint
	rd	%asi,	%l5
loop_28:
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x10]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	st	%fsr,	[%l7 + 0x74]
	fcmped	%fcc1,	%f30,	%f10
	rdpr	%tl,	%g5
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x60]
	fmovso	%fcc0,	%f12,	%f23
	movn	%fcc2,	%o3,	%o6
	fmovdle	%fcc3,	%f14,	%f0
	st	%fsr,	[%l7 + 0x78]
	fabsd	%f4,	%f18
	st	%fsr,	[%l7 + 0x54]
	st	%fsr,	[%l7 + 0x58]
	fmovsul	%fcc0,	%f26,	%f5
	movre	%g1,	0x305,	%i2
	st	%fsr,	[%l7 + 0x3C]
	st	%fsr,	[%l7 + 0x74]
	rdhpr	%ver,	%g7
	st	%fsr,	[%l7 + 0x40]
	tneg	%xcc,	0x1
	fmovsue	%fcc0,	%f11,	%f11
	fba	%fcc3,	loop_29
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f2
	fpsub16s	%f2,	%f24,	%f28
	st	%fsr,	[%l7 + 0x44]
loop_29:
	wrpr 	%g0, 	0x1, 	%gl
	nop
	fitod	%f27,	%f18
	movvs	%icc,	0x33D,	%o4
	fmovrslez	%o2,	%f4,	%f12
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%i4
	movrne	%l2,	%l6,	%l1
	fandnot1	%f28,	%f20,	%f30
	fmovrslez	%i6,	%f0,	%f17
	st	%fsr,	[%l7 + 0x18]
	rd	%fprs,	%l4
	rdpr	%otherwin,	%g4
	fnegd	%f8,	%f26
	movvs	%icc,	0x0FB,	%i0
	wr	%l3,	%l0,	%sys_tick
	rdpr	%canrestore,	%i7
	st	%fsr,	[%l7 + 0x08]
	fmovdu	%fcc3,	%f6,	%f4
	st	%fsr,	[%l7 + 0x1C]
	tge	%xcc,	0x2
	st	%fsr,	[%l7 + 0x50]
	nop
	setx	0xC2892534,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x629BFC8F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f10,	%f14
	or	%g2,	%i1,	%i3
	fxnors	%f8,	%f6,	%f25
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x38]
	bvs,a,pt	%icc,	loop_30
	te	%xcc,	0x5
	st	%fsr,	[%l7 + 0x20]
	nop
	fitos	%f8,	%f16
	fstox	%f16,	%f14
loop_30:
	st	%fsr,	[%l7 + 0x08]
	bmask	%o1,	%o7,	%g3
	tg	%icc,	0x6
	addcc	%i5,	0x1B5F,	%g6
	edge32n	%o5,	%g5,	%o3
	fpadd32	%f6,	%f20,	%f30
	fbe,pn	%fcc0,	loop_31
	st	%fsr,	[%l7 + 0x24]
	mova	%fcc1,	%o6,	%l5
	nop
	setx	0x0474,	%l0,	%g7
	udivx	%g1,	%g7,	%o0
loop_31:
	fands	%f0,	%f12,	%f2
	movug	%fcc0,	0x29A,	%i2
	fnegs	%f8,	%f15
	st	%fsr,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x28]
	fnegd	%f26,	%f14
	mova	%fcc3,	%o4,	%o2
	st	%fsr,	[%l7 + 0x28]
	fmovs	%f30,	%f25
	fnot1s	%f28,	%f19
	edge32n	%l2,	%l6,	%i4
	rdpr	%tl,	%l1
	fmovsu	%fcc0,	%f0,	%f5
	edge16n	%l4,	%g4,	%i0
	nop
	setx	loop_32,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022100001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	rdpr	%tt,	%l1
	wrpr	%g0,	%l1,	%tt
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	rdpr	%tl,	%l1
	wrpr	%g0,	%l1,	%tl
	rdpr	%tpc,	%l1
	wrpr	%g0,	%l1,	%tpc
	rdpr	%tnpc,	%l1
	wrpr	%g0,	%l1,	%tnpc
	rdpr	%tstate,	%l1
	wrpr	%g0,	%l1,	%tstate
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdhpr	%hpstate,	%l1
	wrhpr	%g0,	%l1,	%hpstate
	rdhpr	%htstate,	%l1
	wrhpr	%g0,	%l1,	%htstate
	rdhpr	%hintp,	%l1
	wrhpr	%g0,	%l1,	%hintp
	done
	st	%fsr,	[%l7 + 0x74]
	st	%fsr,	[%l7 + 0x4C]
	fmovdleu	%xcc,	%f8,	%f28
loop_32:
	st	%fsr,	[%l7 + 0x14]
	alignaddr	%l3,	%i6,	%l0
	tcs	%icc,	0x7
	fmovdlg	%fcc2,	%f14,	%f0
	st	%fsr,	[%l7 + 0x34]
	nop
	setx	0x19B9,	%l0,	%i7
	udivx	%g2,	%i7,	%i3
	st	%fsr,	[%l7 + 0x68]
	move	%xcc,	0x04A,	%o1
	st	%fsr,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x34]
	st	%fsr,	[%l7 + 0x3C]
	flushw
	fcmpne32	%f30,	%f20,	%o7
	tsubcc	%g3,	%i1,	%i5
	fbne,pt	%fcc0,	loop_33
	fmovsule	%fcc0,	%f10,	%f31
	tle	%icc,	0x5
	fornot2	%f6,	%f2,	%f2
loop_33:
	fpsub16s	%f25,	%f24,	%f27
	fabss	%f6,	%f31
	edge8l	%o5,	%g6,	%g5
	fblg	%fcc1,	loop_34
	st	%fsr,	[%l7 + 0x60]
	fba,a,pn	%fcc3,	loop_35
	movlg	%fcc3,	%o3,	%o6
loop_34:
	nop

loop_35:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 63
!	Type a   	: 16
!	Type x   	: 1
!	Type cti   	: 11
!	Type f   	: 56
!	Type i   	: 53
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
main_t3:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x9,	%g2
	set	0x0,	%g3
	set	0x6,	%g4
	set	0x0,	%g5
	set	0x7,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x4,	%i1
	set	-0x3,	%i2
	set	-0x2,	%i3
	set	-0x2,	%i4
	set	-0xE,	%i5
	set	-0xD,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x694911C5,	%l0
	set	0x47689B72,	%l1
	set	0x60FE1226,	%l2
	set	0x72D2B397,	%l3
	set	0x7A053B7F,	%l4
	set	0x5702EF7D,	%l5
	set	0x647F50FB,	%l6
	!# Output registers
	set	-0x0F74,	%o0
	set	-0x0851,	%o1
	set	-0x179D,	%o2
	set	0x1DC6,	%o3
	set	-0x1D95,	%o4
	set	0x1FA1,	%o5
	set	-0x1BE2,	%o6
	set	0x1E91,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	nop
	setx	0xDA9A3E5DD9D6CA39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x780E3EE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f6,	%f22
	st	%fsr,	[%l7 + 0x3C]
	fmovrse	%g1,	%f8,	%f5
	st	%fsr,	[%l7 + 0x10]
	fcmpgt16	%f0,	%f8,	%g7
	fnot2	%f16,	%f26
	andcc	%l5,	0x04B4,	%o0
	st	%fsr,	[%l7 + 0x68]
	nop
	setx	0xDE33AF3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE66FEC9F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f11,	%f23
	array16	%o4,	%o2,	%l2
	fmovse	%fcc3,	%f28,	%f14
	fxors	%f28,	%f18,	%f28
	st	%fsr,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x30]
	fpackfix	%f0,	%f17
	mova	%icc,	0x312,	%l6
	fmovdne	%fcc0,	%f26,	%f0
	srl	%i4,	%i2,	%l1
	st	%fsr,	[%l7 + 0x74]
	fnand	%f6,	%f10,	%f12
	bl,a	%icc,	loop_36
	st	%fsr,	[%l7 + 0x48]
	nop
	setx	0xC6955B340DE70A0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fone	%f16
loop_36:
	fcmpne16	%f4,	%f14,	%l4
	st	%fsr,	[%l7 + 0x50]
	addccc	%g4,	0x0DA2,	%l3
	rdhpr	%hpstate,	%i0
	edge16n	%i6,	%l0,	%i7
	te	%icc,	0x2
	subccc	%i3,	%o1,	%g2
	or	%g3,	0x1BD4,	%o7
	xorcc	%i1,	0x06D9,	%o5
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x30]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpack16	%f22,	%f13
	fmovdcs	%xcc,	%f0,	%f16
	wr	%o3,	%g5,	%pic
	nop
	setx	0x38D8B4DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB53982C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f1,	%f17
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wr	%g0,	0x2f,	%asi
	stda	%g0,	[%l7 + 0x20] %asi
	membar	#Sync
	nop
	setx	0x9EDF1B12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x474C3123,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f27,	%f11
	fmovdge	%fcc1,	%f26,	%f20
	mulx	%o6,	0x0945,	%l5
	fornot1s	%f30,	%f1,	%f31
	ldsw	[%l7 + 0x14],	%g7
	fmovdne	%xcc,	%f20,	%f18
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x3C]
	wrpr	%o0,	%o4,	%tick
	st	%fsr,	[%l7 + 0x6C]
	orncc	%l2,	0x0E3B,	%l6
	move	%fcc2,	0x672,	%o2
	st	%fsr,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x60]
	fmovrse	%i2,	%f19,	%f5
	fabss	%f18,	%f24
	brlez	%i4,	loop_37
	rd	%tick_cmpr,	%l1
	st	%fsr,	[%l7 + 0x14]
	st	%fsr,	[%l7 + 0x48]
loop_37:
	fmovrslz	%l4,	%f17,	%f24
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x14]
	siam	0x0
	fmovdue	%fcc3,	%f2,	%f20
	nop
	setx	0x23D321BB0DDDB048,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f8
	st	%fsr,	[%l7 + 0x20]
	tl	%xcc,	0x4
	fmovscs	%xcc,	%f0,	%f23
	st	%fsr,	[%l7 + 0x24]
	andcc	%l3,	0x10BE,	%i0
	movcs	%icc,	0x4DA,	%i6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x44] %asi,	%l0
	fcmpgt16	%f2,	%f6,	%g4
	nop
	setx	0x776EB75C,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	andn	%i7,	0x1411,	%i3
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%g2
	edge16l	%o7,	%i1,	%g3
	bne,a,pn	%xcc,	loop_38
	siam	0x7
	bn,pt	%icc,	loop_39
	fbug	%fcc0,	loop_40
loop_38:
	rd	%pc,	%o5
	tsubcc	%g6,	0x0CE8,	%i5
loop_39:
	nop
	setx	0xCDDB3F25,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x0F2EA867,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f3,	%f3
loop_40:
	fmovrse	%g5,	%f4,	%f16
	st	%fsr,	[%l7 + 0x78]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA04, 	%hsys_tick_cmpr
	st	%fsr,	[%l7 + 0x44]
	fabss	%f14,	%f16
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdgu	%xcc,	%f2,	%f6
	taddcctv	%l5,	%g7,	%o6
	st	%fsr,	[%l7 + 0x6C]
	movrlz	%o4,	%o0,	%l2
	tpos	%icc,	0x3
	tsubcctv	%o2,	%i2,	%l6
	tsubcc	%l1,	%i4,	%l4
	rd	%ccr,	%l3
	wr	%i0,	%l0,	%sys_tick
	st	%fsr,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x54]
	st	%fsr,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x1C]
	sra	%g4,	0x14,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsl	%fcc3,	%f8,	%f19
	xorcc	%o1,	0x0929,	%i6
	nop
	setx	0x05B1,	%l0,	%i1
	sdiv	%o7,	%i1,	%g3
	tcs	%icc,	0x1
	array32	%o5,	%g2,	%i5
	movrne	%g6,	0x3C9,	%g5
	st	%fsr,	[%l7 + 0x70]
	fmul8x16au	%f8,	%f9,	%f4
	tvc	%icc,	0x7
	st	%fsr,	[%l7 + 0x34]
	bcs,a	%xcc,	loop_41
	fpsub32	%f30,	%f0,	%f16
	bg,pt	%xcc,	loop_42
	wr	%g1,	%o3,	%sys_tick
loop_41:
	fbule,pt	%fcc2,	loop_43
	fone	%f2
loop_42:
	fmovd	%f4,	%f8
	fmovda	%fcc2,	%f8,	%f18
loop_43:
	fnand	%f2,	%f12,	%f24
	st	%fsr,	[%l7 + 0x74]
	fors	%f13,	%f9,	%f6
	smul	%g7,	0x0465,	%o6
	nop
	set	0x5C, %i7
	prefetch	[%l7 + %i7],	 2
	fmovsne	%fcc1,	%f13,	%f26
	movvs	%xcc,	%l5,	%o0
	nop
	setx	0x40A060E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x8F6D1168,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f10,	%f20
	rd	%tick_cmpr,	%l2
	st	%fsr,	[%l7 + 0x74]
	st	%fsr,	[%l7 + 0x1C]
	tn	%xcc,	0x0
	st	%fsr,	[%l7 + 0x34]
	edge16n	%o4,	%i2,	%l6
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f4
	fmovsue	%fcc0,	%f23,	%f23
	st	%fsr,	[%l7 + 0x3C]
	movrgez	%o2,	%i4,	%l1
	smulcc	%l4,	0x0CC9,	%l3
	fmovsge	%fcc0,	%f8,	%f15
	stbar
	fandnot1s	%f6,	%f10,	%f13
	st	%fsr,	[%l7 + 0x08]
	nop
	setx	0x1954,	%l1,	%l0
	sdivx	%i0,	%l0,	%g4
	movrlz	%i3,	0x3DB,	%o1
	st	%fsr,	[%l7 + 0x3C]
	fmovrslz	%i6,	%f8,	%f9
	udivcc	%o7,	0x192D,	%i7
	rdhpr	%hintp,	%i1
	fmovsg	%fcc0,	%f10,	%f15
	fmovrdlz	%g3,	%f22,	%f6
	st	%fsr,	[%l7 + 0x30]
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	bmask	%o5,	%i5,	%g2
	udiv	%g6,	0x0433,	%g5
	wr	%g1,	0x025E,	%softint
	fmovrsgz	%g7,	%f5,	%f10
	st	%fsr,	[%l7 + 0x30]
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f30
	nop
	setx	0xA73EB7C207ACA7B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xDE339ED29062DC17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f18,	%f2
	movpos	%xcc,	0x484,	%o6
	tle	%icc,	0x5
	faligndata	%f24,	%f6,	%f12
	fmovrdlez	%l5,	%f8,	%f26
	array32	%o0,	%o3,	%l2
	set	0x74, %o1
	ldsha	[%l7 + %o1] 0x88,	%o4
	fors	%f8,	%f4,	%f11
	movule	%fcc1,	%l6,	%o2
	fmovde	%fcc3,	%f30,	%f6
	udiv	%i4,	0x148C,	%i2
	fcmpd	%fcc2,	%f18,	%f30
	tleu	%xcc,	0x5
	te	%xcc,	0x6
	edge32n	%l4,	%l1,	%l3
	umul	%i0,	0x136C,	%g4
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x48]
	bne,pn	%xcc,	loop_44
	fornot1	%f22,	%f10,	%f10
	st	%fsr,	[%l7 + 0x0C]
	rd	%y,	%i3
loop_44:
	xor	%l0,	0x1E62,	%o1
	fornot1s	%f29,	%f3,	%f17
	udivcc	%o7,	0x1882,	%i7
	stx	%fsr,	[%l7 + 0x68]
	movpos	%xcc,	0x52D,	%i6
	st	%fsr,	[%l7 + 0x58]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 56
!	Type a   	: 15
!	Type x   	: 4
!	Type cti   	: 9
!	Type f   	: 59
!	Type i   	: 57
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
main_t4:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0xF,	%g2
	set	0xE,	%g3
	set	0x1,	%g4
	set	0x5,	%g5
	set	0x8,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x3,	%i1
	set	-0xD,	%i2
	set	-0x5,	%i3
	set	-0xE,	%i4
	set	-0x8,	%i5
	set	-0x3,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x601417E0,	%l0
	set	0x651D0D4D,	%l1
	set	0x683B4593,	%l2
	set	0x26CD6757,	%l3
	set	0x540B50BC,	%l4
	set	0x0BFEBCE5,	%l5
	set	0x24EF1243,	%l6
	!# Output registers
	set	-0x0746,	%o0
	set	-0x1C76,	%o1
	set	-0x0AD5,	%o2
	set	0x1F9C,	%o3
	set	0x18D6,	%o4
	set	-0x0279,	%o5
	set	0x0DF0,	%o6
	set	0x18E1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	fmovsul	%fcc3,	%f20,	%f27
	andncc	%i1,	%o5,	%i5
	srl	%g3,	0x0A,	%g2
	fmovsule	%fcc1,	%f16,	%f6
	st	%fsr,	[%l7 + 0x6C]
	rd	%asi,	%g6
	st	%fsr,	[%l7 + 0x7C]
	bshuffle	%f28,	%f20,	%f14
	st	%fsr,	[%l7 + 0x6C]
	st	%fsr,	[%l7 + 0x70]
	fone	%f6
	fbule,a,pt	%fcc3,	loop_45
	xnorcc	%g5,	%g7,	%g1
	st	%fsr,	[%l7 + 0x50]
	sdivcc	%o6,	0x10A1,	%l5
loop_45:
	fandnot2s	%f8,	%f6,	%f5
	nop
	fitos	%f6,	%f26
	fstoi	%f26,	%f21
	st	%fsr,	[%l7 + 0x34]
	st	%fsr,	[%l7 + 0x28]
	fmovdlg	%fcc0,	%f24,	%f16
	fmovdule	%fcc3,	%f16,	%f14
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc2
	nop
	fitos	%f12,	%f30
	fmovdvs	%xcc,	%f26,	%f28
	st	%fsr,	[%l7 + 0x1C]
	fmovsle	%fcc1,	%f1,	%f21
	membar	0x59
	fpackfix	%f22,	%f16
	movne	%fcc0,	%o3,	%l2
	fmovsue	%fcc0,	%f31,	%f24
	srlx	%o0,	0x0A,	%l6
	fnands	%f4,	%f13,	%f1
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x2C]
	fmovrslez	%o2,	%f13,	%f30
	fmovdue	%fcc0,	%f28,	%f0
	st	%fsr,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x40]
	fcmpeq32	%f8,	%f0,	%o4
	nop
	fitos	%f6,	%f3
	fstoi	%f3,	%f28
	st	%fsr,	[%l7 + 0x78]
	fornot2	%f26,	%f2,	%f20
	fmovrdlz	%i2,	%f4,	%f4
	fnot1	%f8,	%f24
	rdpr	%otherwin,	%i4
	fzero	%f18
	tvc	%icc,	0x1
	for	%f6,	%f28,	%f18
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x64]
	bl,a,pt	%icc,	loop_46
	st	%fsr,	[%l7 + 0x38]
	smulcc	%l4,	0x1695,	%l1
	wr	%g0,	0xd2,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_46:
	tgu	%xcc,	0x4
	fmovdn	%fcc1,	%f24,	%f30
	fxors	%f29,	%f8,	%f2
	array8	%i0,	%g4,	%i3
	fpack16	%f24,	%f11
	fsrc2	%f4,	%f2
	fmovsu	%fcc2,	%f15,	%f10
	nop
	fitos	%f1,	%f30
	fstod	%f30,	%f28
	fornot1	%f2,	%f28,	%f28
	st	%fsr,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x78]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3FE, 	%hsys_tick_cmpr
	andncc	%o7,	%i7,	%i6
	st	%fsr,	[%l7 + 0x0C]
	wrpr 	%g0, 	0x2, 	%gl
	fpsub16	%f20,	%f16,	%f14
	st	%fsr,	[%l7 + 0x74]
	srl	%i1,	%i5,	%o5
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x40, %o6
	std	%g2,	[%l7 + %o6]
	bgu	%icc,	loop_47
	fmovdge	%xcc,	%f24,	%f24
	st	%fsr,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x28]
loop_47:
	fnot2	%f2,	%f16
	fnands	%f12,	%f28,	%f2
	sethi	0x0A7D,	%g6
	bshuffle	%f18,	%f20,	%f8
	fabss	%f13,	%f13
	movleu	%xcc,	0x4D4,	%g5
	nop
	fitod	%f8,	%f8
	fdtoi	%f8,	%f13
	tle	%icc,	0x3
	st	%fsr,	[%l7 + 0x4C]
	umulcc	%g7,	%g1,	%o6
	rdhpr	%hsys_tick_cmpr,	%g2
	st	%fsr,	[%l7 + 0x0C]
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x54]
	fmovdu	%fcc2,	%f20,	%f20
	movrne	%l5,	%l2,	%o0
	fmovdlg	%fcc0,	%f28,	%f4
	fmovsuge	%fcc0,	%f14,	%f24
	nop
	setx	0x205753CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f7
	movl	%xcc,	0x382,	%l6
	edge8n	%o3,	%o4,	%o2
	wr	%g0,	0x2a,	%asi
	stda	%i4,	[%l7 + 0x28] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC35, 	%hsys_tick_cmpr
	fcmple16	%f16,	%f18,	%l1
	st	%fsr,	[%l7 + 0x14]
	nop
	fitos	%f2,	%f8
	fstod	%f8,	%f2
	fzero	%f24
	or	%l4,	0x109C,	%g4
	movrgez	%i3,	0x072,	%i0
	set	0x61, %l5
	ldsba	[%l7 + %l5] 0x89,	%l3
	movvc	%xcc,	%o7,	%l0
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x34]
	ta	%icc,	0x4
	st	%fsr,	[%l7 + 0x5C]
	fba,a	%fcc0,	loop_48
	st	%fsr,	[%l7 + 0x60]
	tsubcctv	%i7,	0x10A0,	%o1
	movrne	%i1,	%i6,	%i5
loop_48:
	fmovdcc	%xcc,	%f6,	%f2
	rdpr	%canrestore,	%g3
	st	%fsr,	[%l7 + 0x10]
	rd	%pc,	%g6
	st	%fsr,	[%l7 + 0x2C]
	sra	%g5,	0x01,	%o5
	fcmple16	%f20,	%f22,	%g1
	st	%fsr,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x47, %o3
	ldub	[%l7 + %o3],	%o6
	bge	%icc,	loop_49
	fmovsg	%icc,	%f3,	%f10
	andn	%g2,	0x0C6B,	%l5
	st	%fsr,	[%l7 + 0x28]
loop_49:
	rd	%ccr,	%g7
	st	%fsr,	[%l7 + 0x34]
	fmovrdlz	%l2,	%f20,	%f0
	nop
	setx loop_50, %l0, %l1
	jmpl %l1, %l6
	tsubcctv	%o0,	%o4,	%o2
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x54]
loop_50:
	st	%fsr,	[%l7 + 0x2C]
	lduw	[%l7 + 0x74],	%o3
	st	%fsr,	[%l7 + 0x5C]
	fmovdo	%fcc2,	%f30,	%f30
	st	%fsr,	[%l7 + 0x2C]
	orn	%i4,	0x1CD3,	%l1
	fsrc1	%f2,	%f14
	st	%fsr,	[%l7 + 0x34]
	fpack32	%f0,	%f30,	%f16
	st	%fsr,	[%l7 + 0x68]
	st	%fsr,	[%l7 + 0x0C]
	smul	%i2,	0x1737,	%l4
	movo	%fcc2,	0x78D,	%g4
	nop
	fitos	%f11,	%f20
	fstox	%f20,	%f2
	st	%fsr,	[%l7 + 0x68]
	andncc	%i3,	0x12CB,	%i0
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	brz,a,pt	%l3,	loop_51
	st	%fsr,	[%l7 + 0x68]
	st	%fsr,	[%l7 + 0x6C]
	st	%fsr,	[%l7 + 0x3C]
loop_51:
	bgu,a,pt	%xcc,	loop_52
	fmovsgu	%xcc,	%f22,	%f2
	st	%fsr,	[%l7 + 0x54]
	nop
	setx	0x6A19815C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f10
loop_52:
	fmul8sux16	%f24,	%f18,	%f12
	movle	%fcc3,	%o7,	%i7
	fornot1s	%f6,	%f15,	%f17
	fmovsvc	%xcc,	%f4,	%f15
	sethi	0x178C,	%o1
	rdhpr	%hpstate,	%i1
	fxors	%f1,	%f16,	%f12
	edge32n	%l0,	%i6,	%i5
	fmovsl	%fcc3,	%f21,	%f24
	bleu,a,pt	%xcc,	loop_53
	tvs	%icc,	0x7
	bn	%xcc,	loop_54
	fmovrdne	%g3,	%f26,	%f26
loop_53:
	st	%fsr,	[%l7 + 0x54]
	fcmped	%fcc0,	%f24,	%f20
loop_54:
	fmovsvc	%xcc,	%f4,	%f23
	wr	%g0,	0xeb,	%asi
	stda	%g4,	[%l7 + 0x58] %asi
	membar	#Sync
	and	%g6,	%o5,	%g1
	fmovsvc	%icc,	%f6,	%f5
	prefetch	[%l7 + 0x34],	 4
	ta	%xcc,	0x0
	st	%fsr,	[%l7 + 0x30]
	tcs	%xcc,	0x2
	st	%fsr,	[%l7 + 0x0C]
	fcmpes	%fcc2,	%f3,	%f20
	st	%fsr,	[%l7 + 0x58]
	fpadd16s	%f8,	%f5,	%f20
	movleu	%xcc,	%o6,	%g2
	st	%fsr,	[%l7 + 0x10]
	st	%fsr,	[%l7 + 0x14]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 68
!	Type a   	: 10
!	Type x   	: 5
!	Type cti   	: 10
!	Type f   	: 65
!	Type i   	: 42
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
main_t5:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0x2,	%g2
	set	0x7,	%g3
	set	0xD,	%g4
	set	0x6,	%g5
	set	0x8,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xC,	%i1
	set	-0xD,	%i2
	set	-0x1,	%i3
	set	-0xC,	%i4
	set	-0x3,	%i5
	set	-0x8,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x6FD1168D,	%l0
	set	0x5010DD63,	%l1
	set	0x111C2379,	%l2
	set	0x581CD540,	%l3
	set	0x7F96D71E,	%l4
	set	0x0A40B6F7,	%l5
	set	0x1CD88ACB,	%l6
	!# Output registers
	set	-0x12D0,	%o0
	set	-0x1F78,	%o1
	set	-0x117D,	%o2
	set	-0x171E,	%o3
	set	-0x10E2,	%o4
	set	0x1E29,	%o5
	set	0x0316,	%o6
	set	-0x156D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	rd	%y,	%l5
	pdist	%f24,	%f16,	%f0
	subcc	%l2,	%g7,	%l6
	edge16n	%o0,	%o2,	%o3
	nop
	fitod	%f18,	%f16
	st	%fsr,	[%l7 + 0x7C]
	fmovsule	%fcc3,	%f22,	%f17
	fmul8ulx16	%f8,	%f20,	%f8
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	st	%fsr,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x60]
	st	%fsr,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x6C]
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f14
	sub	%o4,	0x0F01,	%i4
	umul	%i2,	0x0755,	%l1
	st	%fsr,	[%l7 + 0x44]
	movre	%g4,	%l4,	%i3
	bcc	%xcc,	loop_55
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x78]
	movre	%l3,	0x17E,	%i0
loop_55:
	st	%fsr,	[%l7 + 0x7C]
	array32	%o7,	%i7,	%i1
	array32	%o1,	%i6,	%i5
	st	%fsr,	[%l7 + 0x20]
	fpack16	%f24,	%f26
	fble	%fcc0,	loop_56
	st	%fsr,	[%l7 + 0x20]
	fnot2s	%f25,	%f28
	fxors	%f4,	%f28,	%f20
loop_56:
	fmovsuge	%fcc0,	%f1,	%f29
	st	%fsr,	[%l7 + 0x1C]
	movre	%l0,	0x3E0,	%g3
	fmovdpos	%icc,	%f28,	%f30
	fnors	%f8,	%f24,	%f24
	st	%fsr,	[%l7 + 0x20]
	sth	%g6,	[%l7 + 0x16]
	edge16	%o5,	%g1,	%o6
	fmovsvc	%icc,	%f25,	%f8
	membar	0x09
	edge8	%g2,	%l5,	%l2
	fmovsne	%xcc,	%f14,	%f29
	orn	%g5,	%g7,	%l6
	mulscc	%o0,	0x0E18,	%o3
	fcmple32	%f22,	%f22,	%o4
	fbue	%fcc3,	loop_57
	st	%fsr,	[%l7 + 0x70]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	setx	0x668DA4375D8E9520,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA66F82BA3E3FCC86,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f4,	%f16
loop_57:
	add	%i2,	%g4,	%l4
	st	%fsr,	[%l7 + 0x48]
	alignaddr	%i3,	%l1,	%l3
	st	%fsr,	[%l7 + 0x2C]
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i0
	bgu,pn	%icc,	loop_58
	st	%fsr,	[%l7 + 0x34]
	nop
	setx	0xC9FE439E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f9
	fpackfix	%f4,	%f31
loop_58:
	fmovscc	%xcc,	%f6,	%f31
	fone	%f0
	st	%fsr,	[%l7 + 0x28]
	fmovdcc	%icc,	%f28,	%f0
	movug	%fcc0,	%o7,	%i1
	ldub	[%l7 + 0x41],	%i7
	alignaddrl	%i6,	%i5,	%l0
	addcc	%g3,	%o1,	%g6
	srlx	%o5,	%o6,	%g2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0
	st	%fsr,	[%l7 + 0x40]
	fzero	%f8
	tl	%xcc,	0x4
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x4C, %g1
	stw	%l2,	[%l7 + %g1]
	nop
	setx	0x17A6,	%l0,	%g7
	sdivcc	%g1,	%g7,	%l6
	ta	%xcc,	0x6
	st	%fsr,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x0C]
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x20]
	rdhpr	%hpstate,	%o0
	rd	%sys_tick_cmpr,	%g5
	fmovduge	%fcc0,	%f16,	%f6
	xnorcc	%o4,	0x0C0F,	%o3
	bgu	%icc,	loop_59
	fbge,a	%fcc3,	loop_60
	st	%fsr,	[%l7 + 0x40]
	bmask	%o2,	%i4,	%i2
loop_59:
	st	%fsr,	[%l7 + 0x40]
loop_60:
	sethi	0x1F0E,	%g4
	fandnot1s	%f17,	%f2,	%f9
	wrpr 	%g0, 	0x2, 	%gl
	fmovrse	%l1,	%f31,	%f7
	st	%fsr,	[%l7 + 0x68]
	ld	[%l7 + 0x40],	%f25
	fmovscc	%xcc,	%f29,	%f30
	andn	%l4,	%i0,	%l3
	movle	%fcc0,	0x557,	%i1
	fbe,pn	%fcc3,	loop_61
	fnands	%f30,	%f18,	%f18
	fmovsleu	%icc,	%f19,	%f8
	andcc	%i7,	%i6,	%o7
loop_61:
	movrgz	%i5,	0x309,	%g3
	sllx	%o1,	%g6,	%l0
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x220] %asi,	%o5
	movrne	%g2,	%l5,	%o6
	fone	%f26
	fpack16	%f16,	%f0
	movue	%fcc2,	%l2,	%g1
	fpadd32	%f28,	%f26,	%f30
	st	%fsr,	[%l7 + 0x68]
	membar	0x79
	st	%fsr,	[%l7 + 0x70]
	fmovdu	%fcc3,	%f4,	%f18
	fmovrdgez	%g7,	%f22,	%f22
	st	%fsr,	[%l7 + 0x78]
	st	%fsr,	[%l7 + 0x54]
	rdhpr	%ver,	%l6
	st	%fsr,	[%l7 + 0x34]
	fnegs	%f6,	%f10
	st	%fsr,	[%l7 + 0x6C]
	fbul	%fcc2,	loop_62
	edge32l	%g5,	%o4,	%o3
	prefetch	[%l7 + 0x30],	 1
	st	%fsr,	[%l7 + 0x4C]
loop_62:
	rdhpr	%hintp,	%o0
	fmovdgu	%xcc,	%f28,	%f28
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f1
	tleu	%icc,	0x2
	st	%fsr,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x18]
	fbuge	%fcc1,	loop_63
	fzero	%f18
	movne	%xcc,	0x349,	%i4
	taddcctv	%o2,	0x1D57,	%i2
loop_63:
	fsrc1s	%f3,	%f15
	ld	[%l7 + 0x5C],	%f19
	st	%fsr,	[%l7 + 0x24]
	edge8l	%g4,	%l1,	%l4
	wr	%i3,	0x1225,	%ccr
	st	%fsr,	[%l7 + 0x74]
	lduw	[%l7 + 0x14],	%i0
	st	%fsr,	[%l7 + 0x14]
	movpos	%icc,	0x22C,	%i1
	array32	%l3,	%i7,	%o7
	st	%fsr,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D0, 	%hsys_tick_cmpr
	or	%i5,	%g6,	%l0
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f0
	fxtod	%f0,	%f6
	st	%fsr,	[%l7 + 0x48]
	fmovspos	%xcc,	%f30,	%f28
	nop
	fitos	%f12,	%f21
	fstox	%f21,	%f10
	fxtos	%f10,	%f2
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x78]
	nop
	setx	0x7ACC8DB8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x37C4EF7D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f28,	%f3
	fandnot1s	%f22,	%f20,	%f27
	fbul,a	%fcc1,	loop_64
	popc	0x06ED,	%o5
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x58]
loop_64:
	st	%f17,	[%l7 + 0x14]
	nop
	set	0x1C, %o4
	ldsw	[%l7 + %o4],	%o1
	tvs	%icc,	0x4
	fmovsvc	%icc,	%f9,	%f23
	wrpr	%g2,	%o6,	%cwp
	rd	%tick_cmpr,	%l2
	wr 	%g0, 	0x5, 	%fprs
	udivcc	%g1,	0x1F05,	%g7
	fandnot1s	%f30,	%f17,	%f13
	fcmpd	%fcc3,	%f24,	%f28
	st	%fsr,	[%l7 + 0x48]
	movrgz	%g5,	0x316,	%o4
	wrpr 	%g0, 	0x0, 	%gl
	edge32l	%i4,	%o2,	%o0
	movule	%fcc1,	0x564,	%i2
	set	0x24, %g7
	ldsba	[%l7 + %g7] 0x0c,	%g4
	fmovdo	%fcc2,	%f30,	%f14
	fbn,pt	%fcc2,	loop_65
	movrgz	%l1,	%i3,	%l4
	st	%fsr,	[%l7 + 0x78]
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f26
loop_65:
	fmovdgu	%icc,	%f18,	%f24
	st	%fsr,	[%l7 + 0x68]
	tleu	%xcc,	0x2
	fnot1	%f26,	%f30
	st	%fsr,	[%l7 + 0x4C]
	rdhpr	%hintp,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3D1, 	%sys_tick_cmpr
	st	%fsr,	[%l7 + 0x40]
	fmovdue	%fcc2,	%f10,	%f0
	fand	%f30,	%f30,	%f4
	st	%fsr,	[%l7 + 0x38]
	wr	%o7,	%i7,	%sys_tick
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 67
!	Type a   	: 16
!	Type x   	: 4
!	Type cti   	: 11
!	Type f   	: 51
!	Type i   	: 51
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
main_t6:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0xE,	%g2
	set	0xC,	%g3
	set	0x2,	%g4
	set	0x5,	%g5
	set	0x2,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x1,	%i1
	set	-0x9,	%i2
	set	-0xC,	%i3
	set	-0x7,	%i4
	set	-0x5,	%i5
	set	-0x2,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x2112852E,	%l0
	set	0x752E1CAF,	%l1
	set	0x238EE386,	%l2
	set	0x48907B13,	%l3
	set	0x4D5A19D7,	%l4
	set	0x759655FF,	%l5
	set	0x4A9B080A,	%l6
	!# Output registers
	set	-0x19A0,	%o0
	set	0x0042,	%o1
	set	0x0A12,	%o2
	set	-0x12C9,	%o3
	set	0x06FF,	%o4
	set	-0x19AA,	%o5
	set	0x0D5B,	%o6
	set	-0x11BB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	fmul8ulx16	%f0,	%f22,	%f12
	movleu	%xcc,	%i6,	%i5
	fzeros	%f30
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x0C]
	brgez,a,pn	%g6,	loop_66
	rdpr	%gl,	%g3
	fmovsule	%fcc0,	%f15,	%f7
	edge16n	%o5,	%l0,	%g2
loop_66:
	st	%fsr,	[%l7 + 0x70]
	sra	%o6,	0x03,	%l2
	st	%fsr,	[%l7 + 0x74]
	movvs	%xcc,	%o1,	%g1
	fmovsvc	%xcc,	%f15,	%f17
	st	%fsr,	[%l7 + 0x54]
	nop
	fitod	%f14,	%f30
	st	%fsr,	[%l7 + 0x5C]
	movuge	%fcc1,	%g7,	%g5
	array32	%o4,	%l5,	%l6
	movge	%xcc,	0x59F,	%o3
	st	%fsr,	[%l7 + 0x08]
	wrpr	%i4,	0x1769,	%pil
	ldsb	[%l7 + 0x5D],	%o2
	fmovslg	%fcc1,	%f11,	%f30
	st	%fsr,	[%l7 + 0x74]
	fmovdvc	%xcc,	%f2,	%f10
	bshuffle	%f22,	%f18,	%f18
	rd	%fprs,	%i2
	fmovdle	%icc,	%f30,	%f0
	st	%fsr,	[%l7 + 0x78]
	fbue,a	%fcc1,	loop_67
	st	%fsr,	[%l7 + 0x20]
	rdhpr	%hintp,	%o0
	st	%fsr,	[%l7 + 0x3C]
loop_67:
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x08]
	fandnot1	%f28,	%f24,	%f10
	smul	%l1,	0x0579,	%g4
	st	%fsr,	[%l7 + 0x64]
	wrpr 	%g0, 	0x2, 	%gl
	fnands	%f18,	%f30,	%f28
	st	%fsr,	[%l7 + 0x7C]
	faligndata	%f6,	%f0,	%f26
	set	0x54, %i3
	lduwa	[%l7 + %i3] 0x19,	%l3
	fnot1	%f8,	%f14
	st	%fsr,	[%l7 + 0x40]
	alignaddrl	%i1,	%i0,	%o7
	edge16n	%i6,	%i5,	%g6
	rd	%sys_tick_cmpr,	%g3
	fbge,a	%fcc3,	loop_68
	movrne	%o5,	%l0,	%g2
	edge32n	%i7,	%o6,	%o1
	nop
	set	0x60, %i4
	stx	%fsr,	[%l7 + %i4]
loop_68:
	andncc	%l2,	0x1008,	%g1
	bcc,pt	%xcc,	loop_69
	lduh	[%l7 + 0x54],	%g5
	st	%fsr,	[%l7 + 0x3C]
	tsubcc	%o4,	%l5,	%g7
loop_69:
	mova	%xcc,	0x39A,	%o3
	nop
	setx	0x7820D755,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x5E3E6C2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f21,	%f25
	movg	%fcc0,	%i4,	%l6
	fmovdcs	%icc,	%f18,	%f18
	fmuld8ulx16	%f28,	%f5,	%f6
	tneg	%icc,	0x5
	fpmerge	%f18,	%f13,	%f8
	rd	%y,	%o2
	sllx	%o0,	0x15,	%i2
	fmovsvs	%xcc,	%f14,	%f0
	stbar
	fornot2	%f24,	%f30,	%f28
	fcmpd	%fcc3,	%f2,	%f12
	mulscc	%l1,	%i3,	%g4
	nop
	fitos	%f9,	%f28
	fstox	%f28,	%f8
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge16l	%l3,	%i1,	%l4
	st	%fsr,	[%l7 + 0x08]
	fmovdle	%icc,	%f10,	%f0
	fand	%f30,	%f28,	%f22
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f9
	edge8n	%o7,	%i0,	%i5
	xnor	%g6,	0x0DB6,	%g3
	alignaddr	%o5,	%l0,	%g2
	fmovrdlez	%i7,	%f2,	%f26
	umul	%i6,	0x10B2,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%fsr,	[%l7 + 0x14]
	bvs	%xcc,	loop_70
	fmovsug	%fcc3,	%f31,	%f4
	fandnot2s	%f3,	%f19,	%f13
	st	%fsr,	[%l7 + 0x7C]
loop_70:
	srax	%g1,	0x13,	%g5
	rd	%fprs,	%l2
	nop
	set	0x3C, %g5
	stw	%l5,	[%l7 + %g5]
	add	%o4,	0x1C30,	%o3
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f15
	taddcctv	%i4,	%l6,	%g7
	edge8ln	%o2,	%o0,	%l1
	st	%fsr,	[%l7 + 0x3C]
	fbu	%fcc2,	loop_71
	fbn	%fcc1,	loop_72
	st	%fsr,	[%l7 + 0x10]
	st	%fsr,	[%l7 + 0x0C]
loop_71:
	rdhpr	%hpstate,	%i3
loop_72:
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%i2
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f18
	addc	%l3,	%g4,	%i1
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x28]
	taddcctv	%o7,	0x06FB,	%l4
	ble,a	%icc,	loop_73
	brz	%i0,	loop_74
	nop
	setx	0xFAD4CA632B8C5474,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE1178B6AB0186909,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f6,	%f16
	te	%icc,	0x4
loop_73:
	nop
	setx	0x17ED,	%l0,	%g3
	udivx	%i5,	%g3,	%g6
loop_74:
	std	%f30,	[%l7 + 0x30]
	nop
	setx	0x7A0A557B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x568564A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f2,	%f6
	fmul8x16au	%f20,	%f1,	%f24
	fmovsneg	%icc,	%f31,	%f18
	nop
	setx	0x0898,	%l1,	%l0
	udiv	%o5,	%l0,	%g2
	fexpand	%f30,	%f12
	fpadd16s	%f7,	%f22,	%f13
	st	%fsr,	[%l7 + 0x54]
	fcmpne32	%f20,	%f4,	%i6
	st	%fsr,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x1C]
	fmovrdgz	%o6,	%f20,	%f14
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x34]
	taddcc	%i7,	0x10C8,	%g1
	st	%fsr,	[%l7 + 0x24]
	rdpr	%gl,	%o1
	fpsub32	%f22,	%f0,	%f8
	st	%fsr,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x78]
	fmovdl	%fcc3,	%f2,	%f22
	st	%fsr,	[%l7 + 0x10]
	fmovdge	%fcc3,	%f8,	%f16
	st	%fsr,	[%l7 + 0x1C]
	st	%fsr,	[%l7 + 0x10]
	edge16	%l2,	%l5,	%g5
	movul	%fcc1,	%o3,	%o4
	movrlz	%l6,	%g7,	%i4
	fcmpd	%fcc1,	%f18,	%f14
	nop
	setx loop_75, %l0, %l1
	jmpl %l1, %o0
	fors	%f26,	%f26,	%f19
	fmovscc	%xcc,	%f18,	%f11
	movneg	%xcc,	%l1,	%o2
loop_75:
	umul	%i3,	%i2,	%g4
	st	%fsr,	[%l7 + 0x08]
	fand	%f10,	%f14,	%f12
	fbe,a	%fcc2,	loop_76
	fmovdule	%fcc0,	%f20,	%f28
	nop
	setx	0x99586FC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x8C8638FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f8,	%f2
	st	%fsr,	[%l7 + 0x40]
loop_76:
	nop
	set	0x48, %i2
	sth	%l3,	[%l7 + %i2]
	fbo,a	%fcc3,	loop_77
	st	%fsr,	[%l7 + 0x54]
	movle	%fcc3,	%o7,	%i1
	fmovsuge	%fcc2,	%f17,	%f8
loop_77:
	fpsub32	%f0,	%f8,	%f30
	ble,a	%icc,	loop_78
	edge8	%i0,	%i5,	%l4
	st	%fsr,	[%l7 + 0x48]
	fones	%f17
loop_78:
	movl	%icc,	0x07E,	%g6
	nop
	setx	0x5144C81C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x73D10D47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f19,	%f31
	st	%fsr,	[%l7 + 0x40]
	andncc	%g3,	0x00E1,	%o5
	fmovrdne	%l0,	%f10,	%f10
	st	%fsr,	[%l7 + 0x1C]
	tsubcc	%g2,	%i6,	%i7
	nop
	fitos	%f20,	%f3
	fmovde	%fcc3,	%f12,	%f24
	fmovsuge	%fcc1,	%f2,	%f9
	andn	%g1,	%o1,	%o6
	addc	%l2,	0x1265,	%l5
	st	%fsr,	[%l7 + 0x7C]
	subccc	%o3,	%g5,	%l6
	nop
	setx	loop_79,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034400001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%o4,	0x1C9,	%i4
	fmovrdne	%g7,	%f28,	%f12
	st	%fsr,	[%l7 + 0x6C]
loop_79:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%l1,	[%l7 + 0x18] %asi
	xorcc	%o2,	%i3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE9C, 	%hsys_tick_cmpr
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsue	%fcc0,	%f5,	%f20
	orncc	%l3,	%g4,	%o7
	movrgz	%i1,	%i0,	%l4
	bneg	%icc,	loop_80
	st	%fsr,	[%l7 + 0x58]
	fandnot1	%f4,	%f8,	%f28
	fbue,a,pt	%fcc0,	loop_81
loop_80:
	st	%fsr,	[%l7 + 0x6C]
	fabss	%f30,	%f25
	add	%g6,	%i5,	%o5
loop_81:
	st	%fsr,	[%l7 + 0x44]
	fmovsa	%xcc,	%f30,	%f15
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 58
!	Type a   	: 12
!	Type x   	: 2
!	Type cti   	: 16
!	Type f   	: 58
!	Type i   	: 54
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
main_t7:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x4,	%g2
	set	0xB,	%g3
	set	0x1,	%g4
	set	0xA,	%g5
	set	0xB,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x3,	%i1
	set	-0x8,	%i2
	set	-0x8,	%i3
	set	-0x5,	%i4
	set	-0x9,	%i5
	set	-0x3,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x5DDA7069,	%l0
	set	0x2245D858,	%l1
	set	0x564DB3B0,	%l2
	set	0x14C86928,	%l3
	set	0x41500F72,	%l4
	set	0x043D8F9F,	%l5
	set	0x4D841C51,	%l6
	!# Output registers
	set	0x16DD,	%o0
	set	0x074A,	%o1
	set	-0x1F93,	%o2
	set	-0x0B06,	%o3
	set	-0x05E5,	%o4
	set	0x1754,	%o5
	set	-0x1326,	%o6
	set	-0x1C37,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCC8D0620E2DA3693)
	INIT_TH_FP_REG(%l7,%f2,0xFA244F23DF29DB54)
	INIT_TH_FP_REG(%l7,%f4,0xB3D57F1FD825C368)
	INIT_TH_FP_REG(%l7,%f6,0xD424E498A853CE5F)
	INIT_TH_FP_REG(%l7,%f8,0x977F0E2124D33F26)
	INIT_TH_FP_REG(%l7,%f10,0xA0B27E8022DAD6F1)
	INIT_TH_FP_REG(%l7,%f12,0x0E18BA3EE2FD2B03)
	INIT_TH_FP_REG(%l7,%f14,0x82E2F7E67C833C90)
	INIT_TH_FP_REG(%l7,%f16,0xB89D0594757DA2EA)
	INIT_TH_FP_REG(%l7,%f18,0x13FED6033727FCD0)
	INIT_TH_FP_REG(%l7,%f20,0x07AF4B2FEA0A7C57)
	INIT_TH_FP_REG(%l7,%f22,0xF9469CA7B8499B25)
	INIT_TH_FP_REG(%l7,%f24,0x44BC25C38BAFF430)
	INIT_TH_FP_REG(%l7,%f26,0x93A19EEFE466340C)
	INIT_TH_FP_REG(%l7,%f28,0xAAE03C1EEE40660C)
	INIT_TH_FP_REG(%l7,%f30,0x355FB97FCC4E55E9)

	!# Execute Main Diag ..

	nop
	setx	0xB02FBBF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x9770274D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f15,	%f16
	add	%l0,	%g2,	%i6
	std	%g2,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x30]
	taddcc	%i7,	%g1,	%o1
	tne	%xcc,	0x5
	wr	%o6,	%l5,	%ccr
	fmovrslz	%l2,	%f27,	%f5
	fmovsleu	%xcc,	%f2,	%f22
	mulx	%g5,	0x08E6,	%o3
	nop
	setx	0xA55E23FDF05AC1A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF5C5304A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f2,	%f24
	fbge	%fcc2,	loop_82
	rdhpr	%hsys_tick_cmpr,	%o4
	movcc	%xcc,	%l6,	%i4
	st	%fsr,	[%l7 + 0x10]
loop_82:
	ldub	[%l7 + 0x0F],	%g7
	st	%fsr,	[%l7 + 0x14]
	brgez,a,pn	%o2,	loop_83
	orcc	%i3,	%l1,	%i2
	st	%fsr,	[%l7 + 0x64]
	rdpr	%otherwin,	%o0
loop_83:
	fcmpes	%fcc3,	%f18,	%f9
	st	%fsr,	[%l7 + 0x2C]
	movuge	%fcc2,	%g4,	%l3
	st	%fsr,	[%l7 + 0x28]
	alignaddr	%o7,	%i0,	%l4
	sethi	0x1246,	%i1
	st	%fsr,	[%l7 + 0x5C]
	tsubcctv	%i5,	0x17CC,	%g6
	rdpr	%wstate,	%l0
	fpadd16s	%f13,	%f12,	%f5
	andn	%o5,	0x19C0,	%i6
	st	%fsr,	[%l7 + 0x6C]
	fpsub16s	%f19,	%f18,	%f22
	fmovdug	%fcc3,	%f24,	%f2
	rd	%tick_cmpr,	%g2
	bmask	%g3,	%i7,	%o1
	ta	%xcc,	0x2
	nop
	setx	0x782DD334EE84254E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f10
	rdpr	%wstate,	%o6
	wr	%l5,	%g1,	%sys_tick
	nop
	setx	0x3C997840E1EA1B55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f20
	st	%fsr,	[%l7 + 0x48]
	tvs	%icc,	0x5
	st	%fsr,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x34]
	fcmped	%fcc1,	%f20,	%f24
	bg,pn	%xcc,	loop_84
	array16	%l2,	%g5,	%o3
	fcmpes	%fcc2,	%f17,	%f14
	tn	%icc,	0x2
loop_84:
	taddcctv	%o4,	%i4,	%g7
	nop
	setx	0x3586122081AEBDC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	edge8	%l6,	%i3,	%o2
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x30]
	fmovslg	%fcc2,	%f5,	%f24
	fmovsue	%fcc1,	%f0,	%f0
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fcmpne32	%f18,	%f6,	%i2
	edge32ln	%l1,	%g4,	%o0
	fbl,pn	%fcc1,	loop_85
	st	%fsr,	[%l7 + 0x78]
	nop
	setx	0x1137,	%l0,	%o7
	sdivx	%l3,	%o7,	%l4
	fpsub32s	%f12,	%f17,	%f0
loop_85:
	fzero	%f16
	ldd	[%l7 + 0x38],	%f24
	fmovsuge	%fcc0,	%f10,	%f18
	smulcc	%i1,	%i5,	%g6
	umulcc	%i0,	0x1B5C,	%l0
	fmovrdlz	%o5,	%f24,	%f8
	subc	%i6,	0x03ED,	%g3
	st	%fsr,	[%l7 + 0x1C]
	wrpr	%i7,	%o1,	%tick
	sethi	0x1681,	%g2
	st	%fsr,	[%l7 + 0x34]
	st	%fsr,	[%l7 + 0x34]
	tneg	%xcc,	0x5
	mulscc	%o6,	0x08F9,	%l5
	movn	%icc,	0x6CB,	%g1
	fmovsne	%fcc1,	%f17,	%f2
	fpackfix	%f14,	%f31
	st	%fsr,	[%l7 + 0x10]
	tle	%icc,	0x5
	wr	%g0,	0x80,	%asi
	stwa	%g5,	[%l7 + 0x70] %asi
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x28]
	fxnors	%f29,	%f21,	%f9
	nop
	setx	0x82857030FE441B96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x247CEEE2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f16,	%f10
	st	%fsr,	[%l7 + 0x54]
	fmovrdlz	%o3,	%f30,	%f8
	fmovsue	%fcc0,	%f12,	%f30
	st	%fsr,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x38]
	andcc	%o4,	0x054C,	%i4
	movue	%fcc2,	0x040,	%g7
	fmul8x16	%f14,	%f2,	%f12
	fmovsuge	%fcc3,	%f0,	%f6
	st	%fsr,	[%l7 + 0x10]
	nop
	setx	0x13DC,	%l0,	%i3
	udiv	%l2,	%i3,	%o2
	fmovdcs	%icc,	%f4,	%f24
	fmovdneg	%icc,	%f16,	%f30
	stw	%i2,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x4C]
	nop
	setx	0x08A6,	%l0,	%g4
	sdivcc	%l6,	%g4,	%l1
	st	%fsr,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x6C]
	fmovse	%fcc3,	%f29,	%f15
	movul	%fcc2,	%o0,	%o7
	st	%fsr,	[%l7 + 0x30]
	edge32ln	%l3,	%l4,	%i5
	st	%fsr,	[%l7 + 0x6C]
	fbue,a	%fcc0,	loop_86
	movre	%g6,	%i0,	%i1
	st	%fsr,	[%l7 + 0x48]
	fpadd32	%f24,	%f10,	%f12
loop_86:
	st	%fsr,	[%l7 + 0x60]
	set	0x32, %l6
	lduha	[%l7 + %l6] 0x19,	%l0
	fpadd16	%f20,	%f24,	%f8
	st	%fsr,	[%l7 + 0x28]
	siam	0x3
	movvs	%icc,	0x115,	%o5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	orn	%i6,	%i7,	%g3
	st	%fsr,	[%l7 + 0x14]
	movcs	%xcc,	%o1,	%g2
	nop
	setx	0xEA8921BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xF0DBBDF4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f27,	%f1
	fmovdul	%fcc3,	%f18,	%f6
	st	%fsr,	[%l7 + 0x54]
	movneg	%icc,	%l5,	%o6
	andn	%g1,	0x011A,	%o3
	movn	%fcc0,	0x7E7,	%o4
	st	%fsr,	[%l7 + 0x18]
	fbue,a	%fcc1,	loop_87
	stx	%fsr,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x68]
	edge16n	%g5,	%i4,	%g7
loop_87:
	nop
	setx	0x1B29,	%l0,	%o2
	udivx	%i3,	%o2,	%l2
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x40]
	fmuld8sux16	%f6,	%f15,	%f4
	fbe,a,pt	%fcc1,	loop_88
	array8	%i2,	%g4,	%l1
	st	%fsr,	[%l7 + 0x38]
	ldub	[%l7 + 0x26],	%l6
loop_88:
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f4
	st	%fsr,	[%l7 + 0x68]
	movrlz	%o7,	%l3,	%o0
	st	%fsr,	[%l7 + 0x34]
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x60]
	fmul8sux16	%f22,	%f6,	%f16
	movrlez	%i5,	%g6,	%l4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f0
	fxnor	%f16,	%f30,	%f12
	fmovdpos	%icc,	%f22,	%f14
	or	%i1,	%i0,	%o5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc1
	st	%fsr,	[%l7 + 0x64]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD0F, 	%hsys_tick_cmpr
	fmovso	%fcc1,	%f12,	%f24
	nop
	fitod	%f0,	%f6
	prefetch	[%l7 + 0x2C],	 3
	faligndata	%f22,	%f2,	%f24
	st	%fsr,	[%l7 + 0x08]
	tcc	%icc,	0x3
	fmovspos	%xcc,	%f12,	%f0
	fbule,a,pn	%fcc2,	loop_89
	st	%fsr,	[%l7 + 0x70]
	fabss	%f22,	%f4
	st	%fsr,	[%l7 + 0x60]
loop_89:
	nop
	setx	0x6A0250869ECAE2B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC8FE7DA7FF149BB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f12,	%f12
	flush	%l7 + 0x44
	bleu	%xcc,	loop_90
	nop
	set	0x40, %o7
	std	%f8,	[%l7 + %o7]
	fpackfix	%f12,	%f20
	sub	%g3,	0x0E0C,	%i7
loop_90:
	tl	%icc,	0x3
	fmovsu	%fcc1,	%f27,	%f4
	array8	%o1,	%g2,	%o6
	movre	%l5,	%g1,	%o3
	fcmpd	%fcc2,	%f4,	%f4
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x66] %asi,	%o4
	fmovrdgez	%g5,	%f4,	%f30
	brlez,a	%g7,	loop_91
	st	%fsr,	[%l7 + 0x10]
	fmovduge	%fcc2,	%f24,	%f4
	nop
	setx	0x0935,	%l0,	%i4
	udivcc	%i3,	%i4,	%o2
loop_91:
	movge	%fcc3,	0x590,	%i2
	fmovdcc	%icc,	%f28,	%f0
	st	%fsr,	[%l7 + 0x54]
	fmovsge	%icc,	%f5,	%f13
	st	%fsr,	[%l7 + 0x60]
	nop
	setx	0xBA728830,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5BF76D90,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f20,	%f27
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 66
!	Type a   	: 9
!	Type x   	: 5
!	Type cti   	: 10
!	Type f   	: 54
!	Type i   	: 56
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xF5681776
.word 0x885F1365
.word 0xA2754697
.word 0xED619F24
.word 0xCE7CC31B
.word 0x67367937
.word 0xE1DFFE70
.word 0xB1C3F371
.word 0x52D43409
.word 0x23A7D161
.word 0x95E6AC99
.word 0x1ADD80DB
.word 0x9275C51E
.word 0x7244D468
.word 0x998C82B6
.word 0xC68B0EC9
.word 0xC633A9E5
.word 0x82AB8B81
.word 0x02203605
.word 0x8BF40F64
.word 0x581784BC
.word 0x6BE48BF2
.word 0x36B0857B
.word 0x09F35909
.word 0x18BD51A9
.word 0xB99B0817
.word 0xCBD4BFFF
.word 0x0DD99D0B
.word 0x31FDBC62
.word 0x2E4AC7BE
.word 0x00920AB0
.word 0x72F91BF5
.word 0x16AA0AF2
.word 0x155F9687
.word 0x1AB46A47
.word 0xDF134426
.word 0xE0499366
.word 0x439E716A
.word 0x8FDC773F
.word 0x79AD1E25
.word 0x7A29D6AE
.word 0x53E9F36A
.word 0x4EC5F198
.word 0x2010033A
.word 0xCAA06637
.word 0xD59BC676
.word 0x8C651B87
.word 0x5711061E
.word 0x11CDB84D
.word 0x2800A008
.word 0xF437927A
.word 0x440BBD19
.word 0xAF570264
.word 0x25CE52E7
.word 0xCD4E3A38
.word 0xB1015F98
.word 0xD8FA9405
.word 0xAD455F5B
.word 0xA8105A1F
.word 0xB1642078
.word 0xD754725F
.word 0x76E21C51
.word 0x1DF32B80
.word 0x07A1AAAF
.end
