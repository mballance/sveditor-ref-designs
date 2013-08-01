/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_05.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12343"
.ident "Mon Dec  8 19:22:53 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_05.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0xE,	%g1
	set	0xE,	%g2
	set	0x6,	%g3
	set	0xB,	%g4
	set	0xF,	%g5
	set	0x2,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x0,	%i1
	set	-0xC,	%i2
	set	-0xD,	%i3
	set	-0x9,	%i4
	set	-0x4,	%i5
	set	-0x5,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x273B3407,	%l0
	set	0x7BA914D8,	%l1
	set	0x1C8CFB9B,	%l2
	set	0x0AC132FE,	%l3
	set	0x1B87AB96,	%l4
	set	0x30B90E41,	%l5
	set	0x21642B29,	%l6
	!# Output registers
	set	-0x1C0D,	%o0
	set	-0x1A52,	%o1
	set	0x151F,	%o2
	set	0x111A,	%o3
	set	0x1A78,	%o4
	set	-0x17ED,	%o5
	set	0x12C5,	%o6
	set	0x1B31,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	flushw
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%o2
	tcc	%icc,	0x2
	call	loop_1
	tgu	%xcc,	0x1
	fzero	%f4
	brgez,a,pt	%i6,	loop_2
loop_1:
	movcc	%xcc,	0x339,	%g4
	nop
	setx	0xAE40235E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5C946539,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f20,	%f0
	fsrc2s	%f2,	%f26
loop_2:
	nop
	setx	0x6C91CB5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB40CA33C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f11,	%f25
	call	loop_3
	call	loop_4
	call	loop_5
	fzeros	%f22
loop_3:
	movrlz	%g2,	0x14F,	%o7
loop_4:
	brlz,a,pn	%g5,	loop_6
loop_5:
	nop
	fitos	%f1,	%f25
	fstox	%f25,	%f4
	fxtos	%f4,	%f18
	fone	%f18
	call	loop_7
loop_6:
	fandnot2	%f14,	%f28,	%f18
	call	loop_8
	subcc	%l3,	%o5,	%i2
loop_7:
	call	loop_9
	umul	%l6,	0x0F88,	%o1
loop_8:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i0
loop_9:
	fxor	%f28,	%f8,	%f16
	edge8ln	%i3,	%l1,	%l5
	call	loop_10
	fxnors	%f18,	%f18,	%f1
	movvs	%icc,	0x0E0,	%o6
	fcmple32	%f24,	%f24,	%o4
loop_10:
	fornot1	%f0,	%f10,	%f28
	movpos	%xcc,	%g1,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0E8, 	%tick_cmpr
	rdhpr	%ver,	%i1
	lduw	[%l7 + 0x78],	%l0
	call	loop_11
	fpsub32	%f22,	%f28,	%f18
	call	loop_12
	tsubcctv	%l2,	%i7,	%i5
loop_11:
	fones	%f13
	mova	%xcc,	%o0,	%g7
loop_12:
	call	loop_13
	fmovsle	%fcc0,	%f21,	%f26
	wr	%i4,	%g3,	%softint
	smul	%o2,	%i6,	%g4
loop_13:
	fmovsn	%icc,	%f22,	%f22
	wr	%g0,	0x10,	%asi
	stxa	%o3,	[%l7 + 0x08] %asi
	umulcc	%g2,	%g5,	%o7
	fnegs	%f4,	%f16
	call	loop_14
	wr	%o5,	%i2,	%set_softint
	fmovdcs	%xcc,	%f10,	%f26
	andn	%l6,	0x15CE,	%o1
loop_14:
	movne	%fcc2,	0x2B8,	%i0
	tle	%xcc,	0x2
	edge16n	%i3,	%l3,	%l1
	call	loop_15
	nop
	setx	0x1DCE,	%l0,	%l5
	udivcc	%o6,	%l5,	%o4
	umul	%g1,	%l4,	%i1
	call	loop_16
loop_15:
	call	loop_17
	call	loop_18
	array32	%g6,	%l2,	%l0
loop_16:
	nop
	setx	loop_19,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_17:
	wrpr 	%g0, 	0x3, 	%gl
loop_18:
	fbu,a	%fcc2,	loop_20
	call	loop_21
loop_19:
	fmovrdlez	%i5,	%f22,	%f12
	call	loop_22
loop_20:
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f10
loop_21:
	call	loop_23
	fcmpd	%fcc1,	%f24,	%f24
loop_22:
	nop
	setx	0x01CD,	%l0,	%i4
	sdiv	%o0,	%i4,	%g3
	call	loop_24
loop_23:
	fandnot2s	%f3,	%f22,	%f30
	call	loop_25
	call	loop_26
loop_24:
	udivx	%g7,	0x0062,	%i6
	rdpr	%otherwin,	%g4
loop_25:
	fbe,pt	%fcc3,	loop_27
loop_26:
	fpsub32s	%f28,	%f13,	%f9
	rdpr	%cansave,	%o3
	addc	%o2,	0x0F13,	%g5
loop_27:
	bgu,a,pt	%xcc,	loop_28
	call	loop_29
	call	loop_30
	fmovsul	%fcc1,	%f17,	%f21
loop_28:
	fmovdul	%fcc1,	%f16,	%f14
loop_29:
	stb	%g2,	[%l7 + 0x4D]
loop_30:
	faligndata	%f10,	%f30,	%f20
	fsrc1s	%f1,	%f22
	fxor	%f18,	%f4,	%f20
	call	loop_31
	fmovdule	%fcc0,	%f6,	%f20
	edge8	%o7,	%o5,	%i2
	call	loop_32
loop_31:
	nop
	fitos	%f1,	%f6
	fstod	%f6,	%f26
	fmovscc	%icc,	%f24,	%f5
	wr	%g0,	0xe3,	%asi
	stxa	%l6,	[%l7 + 0x58] %asi
	membar	#Sync
loop_32:
	movvs	%icc,	%o1,	%i3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	set	0x78, %l6
	stda	%l2,	[%l7 + %l6] 0x19
	array8	%i0,	%l1,	%l5
	call	loop_33
	fxnor	%f10,	%f8,	%f18
	sub	%o4,	%g1,	%o6
	fmovrsgez	%l4,	%f21,	%f3
loop_33:
	xorcc	%i1,	%g6,	%l0
	call	loop_34
	call	loop_35
	addc	%l2,	%i7,	%o0
	fnot2	%f18,	%f22
loop_34:
	fornot2s	%f14,	%f6,	%f12
loop_35:
	andncc	%i4,	0x012E,	%g3
	call	loop_36
	movrlz	%g7,	%i5,	%g4
	tgu	%icc,	0x2
	movrgz	%i6,	0x2D5,	%o2
loop_36:
	call	loop_37
	fmovdleu	%xcc,	%f26,	%f6
	call	loop_38
	rd	%y,	%o3
loop_37:
	call	loop_39
	fmovsl	%fcc0,	%f21,	%f20
loop_38:
	call	loop_40
	call	loop_41
loop_39:
	fnegs	%f17,	%f27
	rd	%pc,	%g2
loop_40:
	movg	%fcc0,	0x20E,	%g5
loop_41:
	tgu	%xcc,	0x6
	movule	%fcc2,	0x026,	%o5
	fbo,a,pt	%fcc0,	loop_42
	fmovdle	%fcc0,	%f30,	%f4
	call	loop_43
	fpadd32s	%f22,	%f3,	%f7
loop_42:
	ba,pn	%icc,	loop_44
	fmovsg	%fcc1,	%f20,	%f6
loop_43:
	call	loop_45
	fbu,pn	%fcc1,	loop_46
loop_44:
	call	loop_47
	fpmerge	%f0,	%f27,	%f24
loop_45:
	movcs	%icc,	%i2,	%o7
loop_46:
	tcs	%icc,	0x2
loop_47:
	udivx	%l6,	0x0E8E,	%o1
	fbuge,pn	%fcc0,	loop_48
	call	loop_49
	call	loop_50
	wrpr	%i3,	%l3,	%pil
loop_48:
	call	loop_51
loop_49:
	stbar
loop_50:
	fbg,a,pt	%fcc1,	loop_52
	addcc	%l1,	%i0,	%l5
loop_51:
	call	loop_53
	movcc	%icc,	%o4,	%g1
loop_52:
	xorcc	%l4,	0x159E,	%i1
	nop
	setx	0x9C665C27E65123F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3EADE7FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f14,	%f20
loop_53:
	call	loop_54
	wr 	%g0, 	0x6, 	%fprs
	smul	%g6,	0x03FE,	%i7
	call	loop_55
loop_54:
	orn	%o0,	%l2,	%i4
	fxnors	%f5,	%f8,	%f9
	call	loop_56
loop_55:
	call	loop_57
	fmovdvc	%icc,	%f8,	%f12
	nop
	set	0x34, %l1
	ldsb	[%l7 + %l1],	%g7
loop_56:
	subcc	%g3,	%i5,	%g4
loop_57:
	call	loop_58
	tne	%xcc,	0x6
	sra	%o2,	%i6,	%o3
	or	%g2,	0x15C7,	%o5
loop_58:
	fones	%f0
	add	%g5,	0x021C,	%o7
	array8	%l6,	%o1,	%i2
	call	loop_59
	call	loop_60
	orn	%l3,	0x1D65,	%i3
	fmovsl	%icc,	%f5,	%f22
loop_59:
	call	loop_61
loop_60:
	call	loop_62
	movvc	%icc,	%i0,	%l5
	bge,a,pn	%xcc,	loop_63
loop_61:
	edge32l	%o4,	%l1,	%g1
loop_62:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i1,	%o6
loop_63:
	movleu	%icc,	%l4,	%l0
	call	loop_64
	movg	%icc,	%i7,	%o0
	call	loop_65
	fcmpeq32	%f16,	%f22,	%l2
loop_64:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_66
loop_65:
	fxor	%f28,	%f2,	%f28
	fxnor	%f2,	%f12,	%f12
	edge16	%g3,	%i5,	%g6
loop_66:
	nop
	setx	0xA7B0555B12B8255A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x36035460777564FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f22,	%f18
	call	loop_67
	call	loop_68
	fmovspos	%icc,	%f12,	%f10
	fcmpd	%fcc2,	%f12,	%f14
loop_67:
	call	loop_69
loop_68:
	nop
	setx	0xA414D5A699FE466B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	bshuffle	%f22,	%f10,	%f18
	mulx	%g4,	%o2,	%i6
loop_69:
	fornot2	%f2,	%f30,	%f14
	movne	%fcc2,	0x1BC,	%o3
	call	loop_70
	fbne	%fcc3,	loop_71
	fmovsul	%fcc0,	%f30,	%f29
	call	loop_72
loop_70:
	array8	%o5,	%g5,	%g2
loop_71:
	brgz,pt	%l6,	loop_73
	call	loop_74
loop_72:
	fnot1	%f18,	%f10
	set	0x24, %o0
	stwa	%o1,	[%l7 + %o0] 0xe2
	membar	#Sync
loop_73:
	nop
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x19,	%f16
loop_74:
	rdpr	%pil,	%i2
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f0
	fxtod	%f0,	%f30
	nop
	setx loop_75, %l0, %l1
	jmpl %l1, %o7
	fmuld8sux16	%f17,	%f3,	%f6
	fbuge,a	%fcc3,	loop_76
	fmul8x16al	%f29,	%f15,	%f22
loop_75:
	bg,a	%icc,	loop_77
	fpsub32s	%f24,	%f2,	%f18
loop_76:
	fnot1s	%f15,	%f22
	srax	%i3,	%i0,	%l3
loop_77:
	call	loop_78
	andcc	%o4,	0x0F4A,	%l5
	nop
	fitod	%f12,	%f6
	fdtos	%f6,	%f23
	fbg	%fcc3,	loop_79
loop_78:
	tsubcc	%l1,	0x19E2,	%g1
	fmovrsne	%o6,	%f15,	%f5
	movne	%fcc0,	0x060,	%l4
loop_79:
	membar	0x3B
	movl	%fcc0,	%l0,	%i7
	fbu,pn	%fcc2,	loop_80
	call	loop_81
	fnot1	%f30,	%f14
	nop
	setx loop_82, %l0, %l1
	jmpl %l1, %i1
loop_80:
	nop
	setx	loop_83,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x031400001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_81:
	fmovsne	%fcc0,	%f25,	%f3
	call	loop_84
loop_82:
	fandnot1	%f20,	%f10,	%f16
loop_83:
	fmovdleu	%icc,	%f30,	%f28
	movl	%icc,	%l2,	%o0
loop_84:
	fmovrdgez	%i4,	%f4,	%f10
	set	0x78, %i0
	lduba	[%l7 + %i0] 0x88,	%g3
	edge32	%i5,	%g6,	%g7
	call	loop_85
	brgez,pt	%g4,	loop_86
	call	loop_87
	edge16l	%i6,	%o3,	%o2
loop_85:
	fmovdneg	%xcc,	%f4,	%f30
loop_86:
	fcmpes	%fcc3,	%f6,	%f21
loop_87:
	brgz,a,pt	%g5,	loop_88
	fpadd32	%f10,	%f30,	%f22
	fbule	%fcc3,	loop_89
	stb	%g2,	[%l7 + 0x6F]
loop_88:
	call	loop_90
	bg	%xcc,	loop_91
loop_89:
	umul	%o5,	0x0734,	%o1
	fmovsuge	%fcc2,	%f22,	%f20
loop_90:
	tsubcctv	%i2,	0x1142,	%l6
loop_91:
	fnand	%f0,	%f28,	%f0
	fpsub16	%f2,	%f22,	%f8
	fmul8x16al	%f22,	%f31,	%f8
	fornot1	%f2,	%f8,	%f18
	fmovslg	%fcc0,	%f12,	%f1
	call	loop_92
	edge8ln	%o7,	%i3,	%l3
	movre	%o4,	0x27D,	%l5
	fmovrdlez	%i0,	%f18,	%f6
loop_92:
	call	loop_93
	fbge,a,pt	%fcc3,	loop_94
	rd	%fprs,	%g1
	fmul8ulx16	%f6,	%f24,	%f28
loop_93:
	movug	%fcc0,	0x12B,	%o6
loop_94:
	call	loop_95
	taddcctv	%l4,	%l1,	%i7
	movle	%icc,	0x6A3,	%l0
	fmovrslez	%i1,	%f5,	%f8
loop_95:
	fandnot1s	%f26,	%f18,	%f28
	call	loop_96
	fnot1	%f30,	%f0
	call	loop_97
	fbn,a,pn	%fcc2,	loop_98
loop_96:
	fmovscc	%xcc,	%f23,	%f27
	call	loop_99
loop_97:
	nop
	fitos	%f12,	%f8
	fstod	%f8,	%f14
loop_98:
	call	loop_100
	fmuld8sux16	%f17,	%f4,	%f0
loop_99:
	stw	%l2,	[%l7 + 0x60]
	call	loop_101
loop_100:
	wr	%i4,	0x074D,	%softint
	movne	%xcc,	0x6D1,	%o0
	movneg	%xcc,	0x767,	%g3
loop_101:
	fmovdne	%icc,	%f0,	%f30
	call	loop_102
	tge	%icc,	0x6
	call	loop_103
	tcs	%xcc,	0x7
loop_102:
	call	loop_104
	bl,a,pt	%icc,	loop_105
loop_103:
	edge8n	%i5,	%g6,	%g7
	call	loop_106
loop_104:
	movcs	%icc,	0x22B,	%g4
loop_105:
	call	loop_107
	call	loop_108
loop_106:
	fmovspos	%xcc,	%f8,	%f28
	wr	%i6,	0x1200,	%clear_softint
loop_107:
	fmovdn	%fcc0,	%f10,	%f26
loop_108:
	fmul8x16al	%f30,	%f29,	%f16
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%o3
	subccc	%g5,	0x0786,	%o2
	fmovrde	%o5,	%f12,	%f30
	movg	%xcc,	0x6B7,	%o1
	xorcc	%i2,	%l6,	%o7
	sllx	%g2,	0x03,	%i3
	fmovdvc	%xcc,	%f2,	%f26
	movrlz	%o4,	%l5,	%i0
	call	loop_109
	call	loop_110
	fnands	%f19,	%f14,	%f21
	call	loop_111
loop_109:
	fnot1	%f30,	%f6
loop_110:
	call	loop_112
	rdpr	%tba,	%g1
loop_111:
	fnot1s	%f29,	%f24
	ldsb	[%l7 + 0x12],	%o6
loop_112:
	tneg	%xcc,	0x2
	call	loop_113
	wrpr	%l3,	%l1,	%pil
	fmovsg	%fcc1,	%f12,	%f11
	call	loop_114
loop_113:
	call	loop_115
	nop
	set	0x22, %o4
	ldsh	[%l7 + %o4],	%i7
	sra	%l0,	%i1,	%l4
loop_114:
	xor	%l2,	%o0,	%i4
loop_115:
	movo	%fcc2,	0x44A,	%g3
	rdhpr	%hintp,	%i5
	call	loop_116
	call	loop_117
	fcmple16	%f0,	%f8,	%g6
	fmovdvs	%icc,	%f16,	%f16
loop_116:
	fmovsgu	%xcc,	%f19,	%f1
loop_117:
	tl	%icc,	0x2
	wrpr 	%g0, 	0x1, 	%gl
	fones	%f9
	nop
	setx	0xF6771E22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x50186759,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f17,	%f24
	fcmpd	%fcc2,	%f6,	%f30
	fmovsgu	%xcc,	%f22,	%f14
	call	loop_118
	fnot1	%f4,	%f22
	tsubcctv	%i6,	0x0CBB,	%g7
	call	loop_119
loop_118:
	addcc	%g5,	%o3,	%o2
	call	loop_120
	fcmpes	%fcc2,	%f15,	%f18
loop_119:
	nop
	set	0x4E, %i1
	stha	%o5,	[%l7 + %i1] 0x80
loop_120:
	srlx	%i2,	%l6,	%o7
	fbl,pn	%fcc2,	loop_121
	call	loop_122
	call	loop_123
	fcmpgt16	%f30,	%f8,	%o1
loop_121:
	fmovdo	%fcc2,	%f20,	%f24
loop_122:
	call	loop_124
loop_123:
	stb	%g2,	[%l7 + 0x33]
	call	loop_125
	fnors	%f8,	%f28,	%f22
loop_124:
	popc	%i3,	%l5
	fmuld8sux16	%f19,	%f30,	%f30
loop_125:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tsubcctv	%i0,	0x1AB0,	%g1
	lduw	[%l7 + 0x44],	%o4
	fmovscs	%xcc,	%f2,	%f13
	edge8	%l3,	%l1,	%o6
	nop
	set	0x64, %g4
	stw	%l0,	[%l7 + %g4]
	call	loop_126
	movrgez	%i1,	0x382,	%l4
	call	loop_127
	fmovdule	%fcc3,	%f24,	%f14
loop_126:
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f0
	umul	%l2,	%o0,	%i4
loop_127:
	call	loop_128
	fcmple32	%f14,	%f0,	%i7
	movge	%fcc0,	%i5,	%g3
	movrne	%g4,	0x336,	%i6
loop_128:
	move	%icc,	%g6,	%g5
	xor	%o3,	0x05ED,	%g7
	fmovdule	%fcc2,	%f4,	%f14
	fandnot2s	%f25,	%f3,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x476, 	%tick_cmpr
	call	loop_129
	call	loop_130
	edge16ln	%i2,	%l6,	%o7
	fmovrdlez	%o1,	%f2,	%f26
loop_129:
	call	loop_131
loop_130:
	fmovs	%f8,	%f9
	nop
	setx	0x1D61,	%l0,	%i3
	sdivcc	%g2,	%i3,	%o2
	movg	%xcc,	0x4CD,	%l5
loop_131:
	nop
	set	0x7C, %i6
	ldstuba	[%l7 + %i6] 0x10,	%i0
	brlez	%g1,	loop_132
	sdivcc	%l3,	0x1DCB,	%o4
	call	loop_133
	call	loop_134
loop_132:
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%f30
	fands	%f20,	%f24,	%f31
loop_133:
	srax	%o6,	%l0,	%i1
loop_134:
	fnegd	%f20,	%f28
	call	loop_135
	rdpr	%tl,	%l1
	rdpr	%tba,	%l2
	nop
	setx	0xA29F18E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xF03F8E13,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f30,	%f16
loop_135:
	call	loop_136
	bn,a,pn	%xcc,	loop_137
	call	loop_138
	call	loop_139
loop_136:
	lduw	[%l7 + 0x38],	%o0
loop_137:
	fmovdvc	%xcc,	%f22,	%f16
loop_138:
	fpadd32s	%f8,	%f30,	%f14
loop_139:
	call	loop_140
	wrpr	%l4,	0x037D,	%pil
	rdpr	%cansave,	%i4
	edge8l	%i5,	%i7,	%g4
loop_140:
	rd	%softint,	%i6
	call	loop_141
	nop
	setx	0x54F654902E00C419,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	call	loop_142
	edge32ln	%g6,	%g5,	%o3
loop_141:
	nop
	fitos	%f6,	%f14
	movrlez	%g7,	%g3,	%i2
loop_142:
	srlx	%l6,	%o7,	%o5
	fsrc2	%f10,	%f26
	ld	[%l7 + 0x78],	%f6
	fbg,a,pt	%fcc2,	loop_143
	fnands	%f7,	%f19,	%f4
	alignaddr	%g2,	%i3,	%o1
	tsubcctv	%l5,	0x0EBA,	%i0
loop_143:
	edge32ln	%o2,	%l3,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x155, 	%hsys_tick_cmpr
	subcc	%l0,	%i1,	%l1
	wr	%g0,	0x89,	%asi
	stha	%l2,	[%l7 + 0x46] %asi
	fcmpeq16	%f14,	%f0,	%o0
	fpadd16	%f4,	%f2,	%f10
	fcmpne32	%f12,	%f16,	%l4
	fmovsle	%fcc3,	%f8,	%f31
	call	loop_144
	call	loop_145
	fmovrdgez	%i4,	%f12,	%f20
	movne	%fcc0,	0x1D6,	%o6
loop_144:
	tn	%xcc,	0x2
loop_145:
	call	loop_146
	sllx	%i7,	%g4,	%i6
	fpack16	%f24,	%f25
	call	loop_147
loop_146:
	fcmped	%fcc0,	%f20,	%f26
	call	loop_148
	nop
	set	0x14, %o7
	lduw	[%l7 + %o7],	%i5
loop_147:
	fmovdl	%xcc,	%f26,	%f30
	xorcc	%g6,	0x03CC,	%g5
loop_148:
	call	loop_149
	fmovdo	%fcc0,	%f0,	%f14
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x19] %asi,	%o3
loop_149:
	nop
	fitod	%f4,	%f22
	fdtox	%f22,	%f20
	call	loop_150
	movgu	%icc,	%g3,	%g7
	xnorcc	%l6,	0x08C8,	%i2
	nop
	setx	0x437127B64E4C70EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x791547B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f28,	%f6
loop_150:
	rdhpr	%hintp,	%o7
	call	loop_151
	fmovdug	%fcc2,	%f16,	%f26
	call	loop_152
	fands	%f10,	%f16,	%f11
loop_151:
	movrgez	%o5,	0x0FC,	%i3
	fandnot1s	%f6,	%f13,	%f1
loop_152:
	fmovrdlz	%g2,	%f10,	%f16
	brgez,pt	%o1,	loop_153
	fmovsvc	%icc,	%f6,	%f9
	tge	%xcc,	0x7
	smul	%l5,	0x1CC9,	%i0
loop_153:
	call	loop_154
	fnot1s	%f14,	%f6
	alignaddrl	%l3,	%o2,	%g1
	fmovdn	%fcc3,	%f16,	%f4
loop_154:
	call	loop_155
loop_155:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 31
!	Type a   	: 28
!	Type cti   	: 155
!	Type x   	: 14
!	Type f   	: 143
!	Type i   	: 129
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
	set	0xC,	%g1
	set	0x9,	%g2
	set	0x9,	%g3
	set	0xE,	%g4
	set	0x6,	%g5
	set	0x1,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xB,	%i1
	set	-0x9,	%i2
	set	-0xB,	%i3
	set	-0xC,	%i4
	set	-0x4,	%i5
	set	-0x5,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x696FCCE0,	%l0
	set	0x1A0540C7,	%l1
	set	0x3891019A,	%l2
	set	0x37E006F5,	%l3
	set	0x55D2AA85,	%l4
	set	0x40733F31,	%l5
	set	0x3A3FA191,	%l6
	!# Output registers
	set	0x1F7C,	%o0
	set	-0x13CA,	%o1
	set	0x03BF,	%o2
	set	0x17FF,	%o3
	set	-0x0070,	%o4
	set	-0x1BAA,	%o5
	set	-0x1F7E,	%o6
	set	-0x12D3,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	call	loop_156
	fcmpeq16	%f28,	%f2,	%l0
	fmuld8sux16	%f11,	%f31,	%f8
	fbug,a,pn	%fcc3,	loop_157
loop_156:
	movvc	%xcc,	0x318,	%o4
	call	loop_158
	movlg	%fcc3,	0x353,	%i1
loop_157:
	call	loop_159
	call	loop_160
loop_158:
	fcmpeq16	%f2,	%f8,	%l2
	fmovdue	%fcc0,	%f6,	%f30
loop_159:
	fnot1s	%f23,	%f23
loop_160:
	call	loop_161
	nop
	setx	0xE911202F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x6B2FC538,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f3,	%f2
	call	loop_162
	call	loop_163
loop_161:
	fmovsue	%fcc1,	%f26,	%f30
	call	loop_164
loop_162:
	edge16ln	%l1,	%o0,	%l4
loop_163:
	movre	%o6,	0x313,	%i4
	call	loop_165
loop_164:
	call	loop_166
	bne,pn	%icc,	loop_167
	smulcc	%i7,	0x0087,	%i6
loop_165:
	fbne,pt	%fcc0,	loop_168
loop_166:
	fmovrse	%i5,	%f16,	%f11
loop_167:
	call	loop_169
	call	loop_170
loop_168:
	movue	%fcc0,	0x66F,	%g4
	call	loop_171
loop_169:
	call	loop_172
loop_170:
	call	loop_173
	nop
	fitos	%f26,	%f2
loop_171:
	fmovdvs	%icc,	%f0,	%f6
loop_172:
	wr 	%g0, 	0x6, 	%fprs
loop_173:
	fxor	%f0,	%f10,	%f24
	fmovscs	%icc,	%f30,	%f8
	tg	%icc,	0x1
	call	loop_174
	fands	%f26,	%f2,	%f29
	call	loop_175
	fcmple16	%f20,	%f0,	%g3
loop_174:
	sra	%o3,	0x16,	%l6
	fnegs	%f0,	%f31
loop_175:
	fmovsn	%xcc,	%f18,	%f26
	call	loop_176
	movrgz	%i2,	%o7,	%g7
	wr	%i3,	%o5,	%sys_tick
	fnegs	%f26,	%f24
loop_176:
	call	loop_177
	call	loop_178
	fcmpgt16	%f18,	%f22,	%o1
	call	loop_179
loop_177:
	fnands	%f3,	%f7,	%f3
loop_178:
	edge32ln	%g2,	%i0,	%l5
	fandnot1	%f2,	%f18,	%f0
loop_179:
	fmuld8sux16	%f7,	%f2,	%f4
	call	loop_180
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdge	%fcc3,	%f6,	%f20
	fpadd16s	%f17,	%f19,	%f12
loop_180:
	tle	%icc,	0x1
	nop
	setx	0x0FF1,	%l0,	%g1
	sdivx	%l3,	%g1,	%l0
	call	loop_181
	call	loop_182
	fmovsn	%fcc2,	%f6,	%f8
	call	loop_183
loop_181:
	call	loop_184
loop_182:
	fmovsug	%fcc3,	%f31,	%f10
	fcmpne32	%f18,	%f8,	%o2
loop_183:
	umul	%o4,	%l2,	%l1
loop_184:
	nop
	set	0x50, %l0
	stda	%i0,	[%l7 + %l0] 0x81
	fcmpne16	%f10,	%f26,	%o0
	fornot1s	%f22,	%f26,	%f7
	set	0x54, %l3
	lduha	[%l7 + %l3] 0x0c,	%l4
	fmovrsgez	%i4,	%f15,	%f11
	bvc,a,pn	%xcc,	loop_185
	add	%i7,	%i6,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE1A, 	%tick_cmpr
	call	loop_186
loop_185:
	nop
	setx	0x722F90CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x9AA7C119,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f24,	%f30
	call	loop_187
	movn	%xcc,	0x101,	%g4
loop_186:
	call	loop_188
	bge,a	%xcc,	loop_189
loop_187:
	fbue,a,pt	%fcc3,	loop_190
	call	loop_191
loop_188:
	subcc	%g6,	0x0A37,	%g3
loop_189:
	nop
	fitos	%f6,	%f14
loop_190:
	fmovrsgz	%o3,	%f10,	%f10
loop_191:
	nop
	fitos	%f11,	%f1
	fstox	%f1,	%f4
	fzeros	%f8
	call	loop_192
	sethi	0x121F,	%l6
	sir	0x05CA
	nop
	set	0x40, %g2
	ldstub	[%l7 + %g2],	%i2
loop_192:
	nop
	set	0x60, %g1
	stda	%o6,	[%l7 + %g1] 0x2b
	membar	#Sync
	fmovsuge	%fcc0,	%f21,	%f9
	call	loop_193
	call	loop_194
	call	loop_195
	edge32	%i3,	%o5,	%o1
loop_193:
	call	loop_196
loop_194:
	fmovrdgez	%g7,	%f12,	%f18
loop_195:
	nop
	wr	%g0,	0xe3,	%asi
	stha	%g2,	[%l7 + 0x32] %asi
	membar	#Sync
loop_196:
	call	loop_197
	movre	%i0,	0x14F,	%l5
	call	loop_198
	call	loop_199
loop_197:
	wrpr	%g1,	%l0,	%tick
	nop
	setx	0x342C1994FDB91D0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x4370A0972763C279,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f20,	%f30
loop_198:
	call	loop_200
loop_199:
	call	loop_201
	fmovdcc	%icc,	%f8,	%f2
	andncc	%l3,	%o4,	%l2
loop_200:
	fmovrdne	%l1,	%f18,	%f10
loop_201:
	fcmpeq32	%f0,	%f18,	%i1
	call	loop_202
	movgu	%icc,	%o0,	%l4
	fxor	%f0,	%f10,	%f18
	call	loop_203
loop_202:
	subc	%i4,	%o2,	%i6
	call	loop_204
	tne	%icc,	0x2
loop_203:
	call	loop_205
	nop
	setx	0x195EB78B24D349C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_204:
	movrgz	%i7,	0x105,	%o6
	nop
	setx	0x65BDD3C022C56EFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x413EDA8603F626F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f4,	%f22
loop_205:
	fbo,a	%fcc0,	loop_206
	fnot1s	%f14,	%f25
	nop
	fitos	%f11,	%f5
	fstod	%f5,	%f20
	call	loop_207
loop_206:
	call	loop_208
	nop
	setx	0x579BFEEF7F3F5A78,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x1D0A40FA3D8B5164,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f30,	%f2
	fmovslg	%fcc1,	%f9,	%f22
loop_207:
	sir	0x0970
loop_208:
	fmul8x16	%f7,	%f10,	%f14
	tvs	%icc,	0x2
	fpadd16	%f4,	%f30,	%f10
	fmovrslez	%g5,	%f15,	%f2
	nop
	setx	0xA890019E66900C2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f28
	array8	%i5,	%g6,	%g3
	mulx	%o3,	0x09B2,	%g4
	call	loop_209
	tneg	%xcc,	0x1
	call	loop_210
	rdpr	%cleanwin,	%i2
loop_209:
	movneg	%icc,	%o7,	%l6
	fmovdle	%fcc2,	%f20,	%f0
loop_210:
	fmovsn	%icc,	%f13,	%f19
	movug	%fcc3,	%o5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22E, 	%hsys_tick_cmpr
	fmovdg	%fcc0,	%f12,	%f10
	call	loop_211
	bpos	%icc,	loop_212
	faligndata	%f18,	%f30,	%f0
	nop
	setx	0x0A347888,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xC8586BC1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f14,	%f20
loop_211:
	bmask	%g2,	%i0,	%g1
loop_212:
	nop
	fitos	%f1,	%f29
	call	loop_213
	orn	%l5,	%l3,	%o4
	rdpr	%pil,	%l2
	fmovsug	%fcc1,	%f0,	%f25
loop_213:
	call	loop_214
	fmovdleu	%xcc,	%f14,	%f24
	call	loop_215
	call	loop_216
loop_214:
	movue	%fcc1,	0x34C,	%l1
	call	loop_217
loop_215:
	call	loop_218
loop_216:
	srax	%l0,	0x0D,	%i1
	membar	0x7F
loop_217:
	rdhpr	%htba,	%o0
loop_218:
	fmovdne	%fcc2,	%f24,	%f20
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f8
	call	loop_219
	tl	%xcc,	0x3
	call	loop_220
	srl	%i4,	%l4,	%i6
loop_219:
	fnegs	%f17,	%f12
	nop
	set	0x68, %i4
	ldsw	[%l7 + %i4],	%o2
loop_220:
	call	loop_221
	rd	%ccr,	%i7
	fmovdne	%xcc,	%f6,	%f2
	tsubcctv	%o6,	%i5,	%g5
loop_221:
	call	loop_222
	fmovsl	%xcc,	%f7,	%f8
	movle	%icc,	%g6,	%o3
	fmovrse	%g3,	%f9,	%f7
loop_222:
	call	loop_223
	nop
	set	0x1C, %o6
	stb	%i2,	[%l7 + %o6]
	orcc	%g4,	0x0CF7,	%o7
	tneg	%icc,	0x7
loop_223:
	bg	%xcc,	loop_224
	call	loop_225
	call	loop_226
	fandnot1	%f0,	%f0,	%f20
loop_224:
	movug	%fcc2,	%l6,	%o1
loop_225:
	fand	%f14,	%f12,	%f24
loop_226:
	brz,a	%o5,	loop_227
	call	loop_228
	call	loop_229
	call	loop_230
loop_227:
	fmovdvc	%xcc,	%f18,	%f18
loop_228:
	srlx	%i3,	%g2,	%i0
loop_229:
	fnor	%f18,	%f8,	%f30
loop_230:
	nop
	setx	0x087E,	%l0,	%l5
	sdiv	%g1,	%l5,	%g7
	smul	%o4,	0x19F1,	%l3
	orn	%l2,	%l1,	%l0
	and	%o0,	%i4,	%i1
	taddcctv	%i6,	0x160D,	%l4
	andcc	%o2,	0x19CC,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_231
	movrlz	%g6,	%g5,	%o3
	orn	%i2,	%g4,	%o7
	fmovrslz	%g3,	%f22,	%f14
loop_231:
	fnand	%f10,	%f24,	%f2
	array16	%o1,	%o5,	%l6
	call	loop_232
	call	loop_233
	call	loop_234
	call	loop_235
loop_232:
	wrpr	%g2,	0x1487,	%cwp
loop_233:
	movrgez	%i3,	%i0,	%g1
loop_234:
	fmul8sux16	%f26,	%f14,	%f0
loop_235:
	bge	%xcc,	loop_236
	movule	%fcc0,	%g7,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x627, 	%sys_tick_cmpr
	flushw
loop_236:
	ta	%icc,	0x7
	nop
	setx	0x4B7F9D5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x42233BE4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f4,	%f28
	movrgez	%l2,	0x0C7,	%l1
	fnor	%f2,	%f12,	%f26
	movlg	%fcc0,	%o0,	%i4
	nop
	setx loop_237, %l0, %l1
	jmpl %l1, %l0
	std	%i6,	[%l7 + 0x20]
	call	loop_238
	sdiv	%i1,	0x1168,	%l4
loop_237:
	movgu	%icc,	%i7,	%o6
	fnors	%f29,	%f27,	%f8
loop_238:
	nop
	set	0x30, %g6
	std	%i4,	[%l7 + %g6]
	call	loop_239
	call	loop_240
	fmovrdgez	%o2,	%f0,	%f2
	call	loop_241
loop_239:
	sllx	%g5,	%g6,	%o3
loop_240:
	fnegd	%f20,	%f6
	be,a	%icc,	loop_242
loop_241:
	edge8l	%g4,	%i2,	%o7
	fcmple16	%f14,	%f28,	%g3
	movgu	%icc,	%o5,	%o1
loop_242:
	movvc	%icc,	%g2,	%l6
	call	loop_243
	call	loop_244
	call	loop_245
	nop
	setx loop_246, %l0, %l1
	jmpl %l1, %i3
loop_243:
	call	loop_247
loop_244:
	andncc	%i0,	0x0359,	%g1
loop_245:
	call	loop_248
loop_246:
	call	loop_249
loop_247:
	rdhpr	%hsys_tick_cmpr,	%g7
	smulcc	%l5,	0x0DA5,	%o4
loop_248:
	call	loop_250
loop_249:
	bcs,pn	%icc,	loop_251
	call	loop_252
	edge32ln	%l2,	%l3,	%l1
loop_250:
	call	loop_253
loop_251:
	bpos,a	%icc,	loop_254
loop_252:
	call	loop_255
	srlx	%i4,	0x10,	%o0
loop_253:
	fmovsul	%fcc0,	%f27,	%f1
loop_254:
	tcc	%icc,	0x5
loop_255:
	tg	%icc,	0x0
	xnorcc	%i6,	%i1,	%l0
	nop
	fitos	%f2,	%f24
	fstox	%f24,	%f16
	fmovso	%fcc3,	%f2,	%f8
	call	loop_256
	edge16ln	%l4,	%i7,	%o6
	nop
	set	0x50, %l2
	swap	[%l7 + %l2],	%o2
	flush	%l7 + 0x50
loop_256:
	call	loop_257
	rdhpr	%hintp,	%g5
	tpos	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
loop_257:
	call	loop_258
	call	loop_259
	fmovso	%fcc1,	%f17,	%f15
	fnor	%f20,	%f2,	%f18
loop_258:
	call	loop_260
loop_259:
	be,a	%xcc,	loop_261
	call	loop_262
	call	loop_263
loop_260:
	fmovscs	%xcc,	%f23,	%f24
loop_261:
	fmovdue	%fcc3,	%f4,	%f10
loop_262:
	nop
	setx	0x0657202A762BD392,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x0A48000DF8D7C6AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f30,	%f10
loop_263:
	fmovdlg	%fcc1,	%f0,	%f26
	ta	%xcc,	0x4
	call	loop_264
	call	loop_265
	call	loop_266
	nop
	set	0x60, %o3
	prefetch	[%l7 + %o3],	 3
loop_264:
	tvc	%xcc,	0x1
loop_265:
	call	loop_267
loop_266:
	fand	%f12,	%f12,	%f0
	edge32l	%o3,	%g4,	%g6
	movcc	%xcc,	%o7,	%g3
loop_267:
	fpadd32	%f6,	%f10,	%f10
	movlg	%fcc0,	%i2,	%o1
	call	loop_268
	bleu,a	%icc,	loop_269
	edge16ln	%g2,	%o5,	%i3
	wr	%l6,	0x1E64,	%clear_softint
loop_268:
	tle	%xcc,	0x4
loop_269:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_270
	fxors	%f30,	%f14,	%f22
	bne	%icc,	loop_271
	fbuge,a,pn	%fcc2,	loop_272
loop_270:
	call	loop_273
	call	loop_274
loop_271:
	fmovsul	%fcc1,	%f23,	%f1
loop_272:
	movneg	%xcc,	0x0A0,	%g7
loop_273:
	movne	%icc,	0x4EC,	%l5
loop_274:
	fmovscs	%icc,	%f22,	%f30
	set	0x0B, %i2
	stba	%o4,	[%l7 + %i2] 0xe2
	membar	#Sync
	movvc	%xcc,	%l2,	%l3
	fmul8x16al	%f19,	%f24,	%f22
	tl	%icc,	0x6
	wr	%i0,	%i4,	%clear_softint
	call	loop_275
	movrne	%l1,	%o0,	%i1
	fmuld8sux16	%f24,	%f25,	%f6
	fmovdg	%xcc,	%f18,	%f0
loop_275:
	fmovs	%f29,	%f30
	fbne,pn	%fcc2,	loop_276
	fmovsa	%xcc,	%f28,	%f9
	fmovdg	%xcc,	%f10,	%f10
	xnorcc	%i6,	%l0,	%i7
loop_276:
	fmul8x16al	%f0,	%f10,	%f4
	nop
	setx	loop_277,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004200001401,	%l0,	%l1
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
	lduw	[%l7 + 0x58],	%l4
	brnz	%o6,	loop_278
	fcmple16	%f8,	%f10,	%o2
loop_277:
	bmask	%i5,	%g5,	%o3
	fmovdu	%fcc2,	%f16,	%f16
loop_278:
	nop
	set	0x14, %g7
	lduh	[%l7 + %g7],	%g6
	fmovdvc	%icc,	%f26,	%f4
	fmovsleu	%xcc,	%f20,	%f4
	addcc	%g4,	0x0A87,	%o7
	sth	%i2,	[%l7 + 0x54]
	nop
	fitos	%f3,	%f4
	fstod	%f4,	%f10
	tvc	%icc,	0x5
	movul	%fcc0,	0x769,	%g3
	fmovrslez	%o1,	%f28,	%f23
	for	%f14,	%f10,	%f2
	udivx	%o5,	0x06DD,	%i3
	call	loop_279
	fmovdn	%xcc,	%f18,	%f16
	fsrc1	%f12,	%f28
	ble,a	%xcc,	loop_280
loop_279:
	brgez	%g2,	loop_281
	membar	0x3B
	movul	%fcc2,	0x5D0,	%g1
loop_280:
	fpsub16s	%f17,	%f28,	%f14
loop_281:
	call	loop_282
	fmovs	%f11,	%f21
	pdist	%f30,	%f2,	%f16
	call	loop_283
loop_282:
	call	loop_284
	fmovd	%f30,	%f16
	addc	%g7,	0x1AA9,	%l6
loop_283:
	fpackfix	%f8,	%f10
loop_284:
	rdpr	%tba,	%o4
	fmovscc	%icc,	%f5,	%f13
	fsrc2	%f14,	%f4
	fmovdgu	%icc,	%f18,	%f16
	wrpr	%l5,	0x13C1,	%tick
	bvc,pt	%icc,	loop_285
	edge32l	%l2,	%l3,	%i0
	call	loop_286
	taddcc	%l1,	%i4,	%i1
loop_285:
	fmovrslz	%o0,	%f12,	%f18
	call	loop_287
loop_286:
	bvc,a	%xcc,	loop_288
	fmovscs	%xcc,	%f25,	%f4
	call	loop_289
loop_287:
	call	loop_290
loop_288:
	tvc	%xcc,	0x2
	fmovdule	%fcc0,	%f2,	%f18
loop_289:
	sir	0x0F57
loop_290:
	movn	%fcc0,	%i6,	%l0
	fmovsl	%icc,	%f30,	%f20
	call	loop_291
	bpos,pn	%xcc,	loop_292
	call	loop_293
	nop
	fitos	%f9,	%f15
	fstox	%f15,	%f18
	fxtos	%f18,	%f24
loop_291:
	nop
	fitod	%f0,	%f6
	fdtos	%f6,	%f19
loop_292:
	tleu	%xcc,	0x1
loop_293:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE06, 	%hsys_tick_cmpr
	call	loop_294
	fmovso	%fcc2,	%f13,	%f8
	call	loop_295
	call	loop_296
loop_294:
	tpos	%xcc,	0x3
	fmovsn	%xcc,	%f14,	%f20
loop_295:
	fmovse	%xcc,	%f31,	%f10
loop_296:
	call	loop_297
	orn	%o6,	%i7,	%o2
	tl	%icc,	0x3
	call	loop_298
loop_297:
	rdpr	%otherwin,	%g5
	andn	%i5,	0x0E3D,	%o3
	call	loop_299
loop_298:
	fmovrdlez	%g4,	%f16,	%f6
	mulscc	%o7,	%i2,	%g3
	fmovsvc	%xcc,	%f11,	%f9
loop_299:
	rdpr	%canrestore,	%o1
	fbl,a,pt	%fcc1,	loop_300
	movleu	%xcc,	%g6,	%i3
	fnot1s	%f10,	%f3
	nop
	fitod	%f4,	%f30
loop_300:
	orncc	%g2,	%o5,	%g1
	call	loop_301
	call	loop_302
	movge	%xcc,	%g7,	%o4
	fsrc1	%f28,	%f8
loop_301:
	brnz,pt	%l5,	loop_303
loop_302:
	call	loop_304
	fmovrdlez	%l2,	%f16,	%f12
	nop
	setx	0x58A3799EBEAAB24C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
loop_303:
	call	loop_305
loop_304:
	fmovdvs	%icc,	%f2,	%f0
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%l2
	movuge	%fcc2,	0x1C4,	%l6
loop_305:
	call	loop_306
	fmovrsgez	%l1,	%f23,	%f5
	umul	%i0,	%i4,	%i1
	call	loop_307
loop_306:
	call	loop_308
	xorcc	%i6,	0x02B4,	%o0
	wr	%l0,	0x19D5,	%y
loop_307:
	nop
	setx	0xFCF5D7AC3389A8F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_308:
	nop
	setx	0x9380E3BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xE0FFDE60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f29,	%f6
	rdhpr	%ver,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x49E, 	%tick_cmpr
	bmask	%g5,	%i5,	%o3
	fone	%f0
	tge	%xcc,	0x7
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f26
	call	loop_309
	call	loop_310
	fnot2	%f24,	%f14
	movlg	%fcc0,	0x556,	%o6
loop_309:
	rdhpr	%htba,	%o7
loop_310:
	addc	%i2,	0x1462,	%g3
	te	%xcc,	0x3
	call	loop_311
	fcmpne16	%f14,	%f4,	%o1
	fsrc1s	%f14,	%f14
	tpos	%icc,	0x5
loop_311:
	fnot2s	%f19,	%f27
	edge32n	%g6,	%i3,	%g4
	fbuge,a,pt	%fcc2,	loop_312
	call	loop_313
	rd	%y,	%g2
	call	loop_314
loop_312:
	membar	0x54
loop_313:
	nop
	setx loop_315, %l0, %l1
	jmpl %l1, %o5
	fpadd32s	%f3,	%f17,	%f18
loop_314:
	movule	%fcc0,	%g1,	%o4
	alignaddr	%l5,	%g7,	%l2
loop_315:
	srlx	%l3,	0x14,	%l1
	tvc	%xcc,	0x2
	fmovsneg	%xcc,	%f1,	%f2
	movpos	%icc,	0x5E8,	%i0
	fmovscs	%icc,	%f19,	%f30
	bpos,a	%icc,	loop_316
	edge8n	%i4,	%l6,	%i1
	fmovdo	%fcc2,	%f0,	%f12
	edge32n	%o0,	%l0,	%i6
loop_316:
	nop
	fitos	%f14,	%f23
	fstod	%f23,	%f0
	fsrc1s	%f30,	%f12
	bge,a,pn	%xcc,	loop_317
	call	loop_318
	fmovsg	%fcc1,	%f23,	%f7
	call	loop_319
loop_317:
	call	loop_320
loop_318:
	call	loop_321
	fmul8ulx16	%f10,	%f30,	%f12
loop_319:
	siam	0x2
loop_320:
	taddcc	%l4,	%i7,	%o2
loop_321:
	fmovrdlz	%g5,	%f20,	%f22
	brgez,a,pt	%o3,	loop_322
loop_322:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 20
!	Type a   	: 27
!	Type x   	: 6
!	Type cti   	: 167
!	Type f   	: 150
!	Type i   	: 130
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
	set	0xE,	%g2
	set	0x4,	%g3
	set	0xB,	%g4
	set	0xA,	%g5
	set	0x8,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xA,	%i1
	set	-0xD,	%i2
	set	-0x4,	%i3
	set	-0x6,	%i4
	set	-0xD,	%i5
	set	-0x7,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x5D464155,	%l0
	set	0x033D7357,	%l1
	set	0x191139D0,	%l2
	set	0x7FD64915,	%l3
	set	0x1E04D68C,	%l4
	set	0x2B0A4BD6,	%l5
	set	0x0B73D9BA,	%l6
	!# Output registers
	set	-0x1CBA,	%o0
	set	0x1473,	%o1
	set	-0x126E,	%o2
	set	-0x10AF,	%o3
	set	-0x0F12,	%o4
	set	0x1035,	%o5
	set	-0x03D7,	%o6
	set	-0x1FAE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	call	loop_323
	fmovdcc	%icc,	%f26,	%f16
	siam	0x4
	fnors	%f20,	%f2,	%f29
loop_323:
	nop
	set	0x78, %i5
	swapa	[%l7 + %i5] 0x11,	%o6
	subccc	%o7,	0x062D,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x328, 	%hsys_tick_cmpr
	fxors	%f22,	%f27,	%f9
	rdpr	%cansave,	%i2
	nop
	setx	0x7CC6C13B0DBC333C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x74CBB0A875C252DF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f6,	%f4
	call	loop_324
	xnor	%o1,	0x0CF3,	%g6
	fbe,a	%fcc0,	loop_325
	fcmpeq32	%f12,	%f22,	%g4
loop_324:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g2
loop_325:
	movlg	%fcc0,	%o5,	%i3
	call	loop_326
	orn	%o4,	0x0C49,	%l5
	fnegd	%f2,	%f14
	edge16n	%g7,	%g1,	%l3
loop_326:
	fmovdug	%fcc2,	%f8,	%f8
	call	loop_327
	fmovsge	%icc,	%f31,	%f10
	fandnot2s	%f28,	%f27,	%f3
	call	loop_328
loop_327:
	fcmpes	%fcc1,	%f4,	%f24
	call	loop_329
	fsrc2	%f22,	%f22
loop_328:
	call	loop_330
	rdhpr	%hintp,	%l1
loop_329:
	orn	%i0,	%i4,	%l6
	sir	0x0417
loop_330:
	nop
	setx	0x1F6705BE9D31443E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xF96051F069BF28B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f14,	%f22
	alignaddrl	%i1,	%l2,	%o0
	udiv	%i6,	0x0478,	%l0
	rd	%ccr,	%l4
	fxor	%f24,	%f6,	%f24
	ldsh	[%l7 + 0x6E],	%i7
	fmovdne	%icc,	%f28,	%f8
	mulx	%o2,	0x13B8,	%o3
	tge	%xcc,	0x6
	set	0x24, %l4
	ldsha	[%l7 + %l4] 0x18,	%g5
	fpsub32s	%f5,	%f29,	%f12
	fmovdu	%fcc3,	%f26,	%f2
	fmul8x16au	%f2,	%f13,	%f18
	fbu,a	%fcc2,	loop_331
	edge16ln	%o6,	%o7,	%i5
	fxor	%f8,	%f18,	%f22
	call	loop_332
loop_331:
	call	loop_333
	call	loop_334
	andcc	%i2,	0x0C37,	%g3
loop_332:
	nop
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x1e
	membar	#Sync
loop_333:
	fmul8sux16	%f18,	%f2,	%f18
loop_334:
	fmovsvc	%xcc,	%f20,	%f19
	wr	%g0,	0x2f,	%asi
	stba	%o1,	[%l7 + 0x4B] %asi
	membar	#Sync
	edge16l	%g4,	%g2,	%o5
	mulx	%i3,	%g6,	%o4
	call	loop_335
	stbar
	te	%xcc,	0x4
	call	loop_336
loop_335:
	fcmpgt16	%f10,	%f6,	%g7
	brgz	%g1,	loop_337
	fcmpgt16	%f0,	%f14,	%l3
loop_336:
	fmovrdlez	%l5,	%f28,	%f16
	bg,a	%icc,	loop_338
loop_337:
	call	loop_339
	xnor	%l1,	0x19FE,	%i4
	fabss	%f6,	%f18
loop_338:
	call	loop_340
loop_339:
	fmovrslez	%l6,	%f7,	%f2
	call	loop_341
	tcc	%icc,	0x2
loop_340:
	fnot2	%f0,	%f20
	call	loop_342
loop_341:
	or	%i1,	%l2,	%o0
	edge8ln	%i0,	%l0,	%l4
	tleu	%xcc,	0x1
loop_342:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvs,pn	%icc,	loop_343
	call	loop_344
	nop
	set	0x78, %i3
	lduw	[%l7 + %i3],	%o3
	subc	%o2,	0x054A,	%g5
loop_343:
	call	loop_345
loop_344:
	nop
	fitod	%f4,	%f30
	fdtos	%f30,	%f0
	fmul8sux16	%f24,	%f22,	%f14
	fmovduge	%fcc1,	%f28,	%f16
loop_345:
	tsubcc	%o6,	0x1887,	%o7
	fmovde	%fcc1,	%f14,	%f26
	call	loop_346
	ba,a,pt	%xcc,	loop_347
	fmovrdlz	%i5,	%f10,	%f30
	movl	%icc,	%g3,	%o1
loop_346:
	fpmerge	%f28,	%f16,	%f20
loop_347:
	call	loop_348
	pdist	%f22,	%f4,	%f22
	fmovso	%fcc2,	%f31,	%f19
	fxors	%f26,	%f31,	%f25
loop_348:
	movrlz	%i2,	%g4,	%g2
	fmul8ulx16	%f24,	%f28,	%f30
	edge32	%i3,	%g6,	%o5
	call	loop_349
	udivx	%o4,	0x12D1,	%g7
	movug	%fcc0,	%l3,	%g1
	movre	%l5,	0x05C,	%i4
loop_349:
	call	loop_350
	tg	%xcc,	0x6
	edge32l	%l6,	%i1,	%l1
	fmovdcc	%xcc,	%f30,	%f0
loop_350:
	sdiv	%l2,	0x1488,	%o0
	alignaddrl	%i0,	%l0,	%i6
	call	loop_351
	fnegs	%f9,	%f19
	call	loop_352
	siam	0x5
loop_351:
	wrpr	%l4,	%o3,	%tick
	call	loop_353
loop_352:
	fmovdul	%fcc0,	%f8,	%f14
	nop
	fitod	%f0,	%f12
	fdtoi	%f12,	%f29
	fbu,pn	%fcc2,	loop_354
loop_353:
	movge	%fcc1,	%o2,	%i7
	sll	%o6,	%o7,	%i5
	fmovrdne	%g5,	%f18,	%f26
loop_354:
	call	loop_355
	nop
	setx	0x428E16D2D5DADE2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x07F4E233C8B40F58,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f12,	%f20
	nop
	setx	0x98AA448BEC819B81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x36E3300265C4D7CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f26,	%f10
	fzeros	%f7
loop_355:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x33D, 	%hsys_tick_cmpr
	mulx	%g4,	0x1DF8,	%g2
	movvs	%xcc,	0x37A,	%i3
	orncc	%g6,	%g3,	%o4
	call	loop_356
	call	loop_357
	call	loop_358
	fmuld8sux16	%f30,	%f8,	%f22
loop_356:
	srax	%g7,	0x07,	%o5
loop_357:
	wr	%g1,	%l3,	%ccr
loop_358:
	bgu,a	%xcc,	loop_359
	addc	%l5,	%i4,	%l6
	call	loop_360
	fba,a	%fcc2,	loop_361
loop_359:
	nop
	set	0x18, %g3
	ldstub	[%l7 + %g3],	%l1
	edge16n	%l2,	%i1,	%o0
loop_360:
	call	loop_362
loop_361:
	fornot1s	%f8,	%f5,	%f31
	fmovduge	%fcc1,	%f18,	%f14
	mova	%icc,	0x7A6,	%i0
loop_362:
	edge32ln	%l0,	%i6,	%o3
	call	loop_363
	call	loop_364
	fcmple16	%f20,	%f20,	%l4
	fmovsg	%fcc2,	%f7,	%f22
loop_363:
	fpmerge	%f3,	%f5,	%f22
loop_364:
	movle	%fcc1,	%i7,	%o6
	wrpr	%o2,	%o7,	%tick
	for	%f10,	%f6,	%f2
	call	loop_365
	fmovscs	%icc,	%f16,	%f17
	call	loop_366
	orncc	%i5,	%o1,	%g5
loop_365:
	call	loop_367
	fand	%f18,	%f28,	%f30
loop_366:
	fmovdpos	%icc,	%f24,	%f6
	call	loop_368
loop_367:
	brlz,a	%i2,	loop_369
	edge16	%g2,	%i3,	%g6
	wrpr	%g3,	0x16A0,	%cwp
loop_368:
	call	loop_370
loop_369:
	call	loop_371
	movlg	%fcc1,	%g4,	%g7
	mulscc	%o4,	0x1CD4,	%g1
loop_370:
	bvs,a	%xcc,	loop_372
loop_371:
	nop
	set	0x2D, %g5
	ldub	[%l7 + %g5],	%o5
	fnors	%f31,	%f7,	%f22
	fmovda	%fcc1,	%f4,	%f0
loop_372:
	fmovscs	%xcc,	%f15,	%f27
	nop
	setx	0x3BC57A7D44C56694,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE4AFCBCF75FA27FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f14,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrsgz	%i4,	%f2,	%f7
	fbn,a,pn	%fcc1,	loop_373
	nop
	fitod	%f24,	%f0
	call	loop_374
	fmovdu	%fcc0,	%f14,	%f26
loop_373:
	call	loop_375
	call	loop_376
loop_374:
	fpadd16	%f10,	%f8,	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l1,	%l2
loop_375:
	call	loop_377
loop_376:
	movre	%i1,	0x2D5,	%l6
	fcmpd	%fcc2,	%f26,	%f22
	wrpr	%o0,	%i0,	%pil
loop_377:
	rdpr	%pil,	%l0
	fmul8x16al	%f11,	%f23,	%f4
	movpos	%icc,	0x465,	%i6
	movg	%xcc,	0x13F,	%l4
	subcc	%o3,	0x0869,	%i7
	bl,a,pn	%icc,	loop_378
	nop
	setx	0x6F2B8A4EBF76059F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xFD8D82E10538165C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f8,	%f18
	call	loop_379
	stbar
loop_378:
	orn	%o6,	0x132F,	%o2
	faligndata	%f6,	%f12,	%f6
loop_379:
	fmovdg	%fcc0,	%f4,	%f28
	call	loop_380
	fandnot1s	%f4,	%f5,	%f11
	orncc	%i5,	0x1836,	%o7
	movpos	%xcc,	0x7A2,	%o1
loop_380:
	xnorcc	%g5,	0x1FA7,	%g2
	movn	%fcc0,	%i2,	%g6
	call	loop_381
	call	loop_382
	taddcc	%i3,	%g3,	%g4
	xnor	%g7,	0x0D64,	%o4
loop_381:
	call	loop_383
loop_382:
	popc	%g1,	%l5
	fones	%f30
	sdiv	%o5,	0x18BD,	%i4
loop_383:
	edge8ln	%l1,	%l3,	%l2
	orn	%i1,	%o0,	%l6
	fmovsneg	%icc,	%f0,	%f20
	andcc	%i0,	%i6,	%l0
	fcmped	%fcc2,	%f20,	%f24
	mulx	%l4,	0x0F83,	%i7
	mulx	%o3,	0x1F96,	%o6
	tvc	%icc,	0x7
	subc	%o2,	0x07C7,	%o7
	faligndata	%f6,	%f18,	%f4
	srl	%i5,	0x09,	%g5
	movug	%fcc2,	0x561,	%o1
	sdivcc	%i2,	0x1F83,	%g6
	alignaddr	%i3,	%g2,	%g3
	edge16n	%g4,	%o4,	%g1
	fmovsvs	%icc,	%f5,	%f3
	nop
	setx	0x0C42,	%l0,	%o5
	sdivcc	%l5,	%o5,	%i4
	alignaddr	%g7,	%l1,	%l2
	call	loop_384
	fandnot1s	%f15,	%f21,	%f16
	call	loop_385
	call	loop_386
loop_384:
	nop
	setx	0x0DE0867F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f2
	wr	%l3,	%i1,	%ccr
loop_385:
	call	loop_387
loop_386:
	xorcc	%o0,	%i0,	%i6
	nop
	setx	0xA944450BD22D1884,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f4
	subcc	%l6,	0x0656,	%l0
loop_387:
	call	loop_388
	edge16ln	%l4,	%i7,	%o6
	call	loop_389
	mulscc	%o2,	%o3,	%i5
loop_388:
	movre	%g5,	0x37F,	%o7
	call	loop_390
loop_389:
	call	loop_391
	tl	%icc,	0x5
	call	loop_392
loop_390:
	array32	%o1,	%i2,	%g6
loop_391:
	call	loop_393
	subccc	%g2,	0x0EC8,	%i3
loop_392:
	fsrc1	%f10,	%f12
	movrlz	%g3,	%g4,	%o4
loop_393:
	fpadd32	%f30,	%f28,	%f2
	fpsub32s	%f25,	%f1,	%f1
	fbn,pn	%fcc1,	loop_394
	call	loop_395
	edge8ln	%l5,	%o5,	%i4
	rdhpr	%hintp,	%g7
loop_394:
	edge32n	%l1,	%g1,	%l2
loop_395:
	call	loop_396
	movge	%icc,	%i1,	%l3
	bne,a,pn	%icc,	loop_397
	mulscc	%i0,	%o0,	%i6
loop_396:
	fnand	%f4,	%f30,	%f2
	movvs	%icc,	0x6B5,	%l6
loop_397:
	fmovdcc	%icc,	%f24,	%f8
	xorcc	%l0,	%i7,	%o6
	call	loop_398
	fands	%f13,	%f31,	%f5
	wr	%g0,	0x89,	%asi
	stha	%l4,	[%l7 + 0x58] %asi
loop_398:
	call	loop_399
	call	loop_400
	call	loop_401
	call	loop_402
loop_399:
	call	loop_403
loop_400:
	call	loop_404
loop_401:
	rdhpr	%ver,	%o3
loop_402:
	fmovdleu	%icc,	%f2,	%f16
loop_403:
	sir	0x1B64
loop_404:
	call	loop_405
	call	loop_406
	movcs	%xcc,	0x4A4,	%i5
	set	0x1C, %l5
	stwa	%g5,	[%l7 + %l5] 0x19
loop_405:
	fmovsvs	%icc,	%f15,	%f28
loop_406:
	fmovdule	%fcc1,	%f10,	%f12
	edge16n	%o7,	%o2,	%i2
	call	loop_407
	call	loop_408
	fmovsule	%fcc2,	%f23,	%f21
	fmovde	%icc,	%f2,	%f18
loop_407:
	fxnor	%f30,	%f0,	%f0
loop_408:
	sir	0x1E52
	or	%g6,	0x0DB0,	%o1
	call	loop_409
	call	loop_410
	fmovdl	%fcc3,	%f0,	%f18
	fmul8x16al	%f24,	%f10,	%f16
loop_409:
	addcc	%i3,	%g2,	%g3
loop_410:
	call	loop_411
	fnand	%f8,	%f20,	%f18
	movge	%xcc,	0x6EA,	%o4
	call	loop_412
loop_411:
	tle	%xcc,	0x2
	call	loop_413
	and	%g4,	%o5,	%l5
loop_412:
	fornot1	%f2,	%f20,	%f24
	fabsd	%f22,	%f24
loop_413:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movul	%fcc3,	0x5A9,	%g7
	nop
	setx	0x1682,	%l0,	%i4
	udivcc	%l1,	%i4,	%l2
	call	loop_414
	call	loop_415
	for	%f8,	%f0,	%f12
	call	loop_416
loop_414:
	call	loop_417
loop_415:
	call	loop_418
	rd	%fprs,	%i1
loop_416:
	subccc	%g1,	%i0,	%o0
loop_417:
	mulx	%l3,	0x13BA,	%l6
loop_418:
	orn	%i6,	0x1A73,	%l0
	movre	%o6,	%i7,	%l4
	call	loop_419
	fcmpeq16	%f8,	%f12,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	fitod	%f4,	%f0
	fdtox	%f0,	%f24
loop_419:
	fbo,a	%fcc0,	loop_420
	xor	%o7,	0x07CD,	%o2
	call	loop_421
	edge16l	%i2,	%g5,	%o1
loop_420:
	call	loop_422
	call	loop_423
loop_421:
	movcs	%icc,	0x258,	%g6
	nop
	fitod	%f2,	%f4
	fdtos	%f4,	%f2
loop_422:
	call	loop_424
loop_423:
	fmovdcc	%xcc,	%f4,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x79E, 	%hsys_tick_cmpr
	nop
	setx	0x9A01169F,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
loop_424:
	sllx	%i3,	%g3,	%g4
	umulcc	%o5,	0x12F3,	%l5
	call	loop_425
	te	%icc,	0x0
	flushw
	call	loop_426
loop_425:
	movl	%xcc,	%g7,	%l1
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%o4
	call	loop_427
loop_426:
	fmovrslez	%i4,	%f8,	%f10
	fxor	%f18,	%f24,	%f22
	nop
	set	0x48, %o0
	prefetch	[%l7 + %o0],	 0
loop_427:
	edge32l	%l2,	%i1,	%g1
	movrgz	%o0,	%l3,	%i0
	srax	%i6,	0x0C,	%l0
	tn	%icc,	0x4
	fpadd16	%f2,	%f4,	%f30
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f2
	call	loop_428
	fmovdul	%fcc0,	%f18,	%f28
	call	loop_429
	fpsub16s	%f14,	%f2,	%f23
loop_428:
	fpsub16s	%f5,	%f6,	%f5
	fnegs	%f17,	%f25
loop_429:
	call	loop_430
	call	loop_431
	fabss	%f12,	%f18
	fpadd32	%f22,	%f6,	%f24
loop_430:
	fbue	%fcc3,	loop_432
loop_431:
	be	%icc,	loop_433
	tg	%icc,	0x6
	sra	%o6,	0x16,	%i7
loop_432:
	call	loop_434
loop_433:
	fmovduge	%fcc3,	%f8,	%f2
	call	loop_435
	wr	%l4,	0x03F6,	%sys_tick
loop_434:
	movrgz	%o3,	%i5,	%o7
	sdivx	%o2,	0x007A,	%l6
loop_435:
	fbul,pn	%fcc0,	loop_436
	udivcc	%i2,	0x0DC5,	%o1
	nop
	fitos	%f8,	%f4
	fstoi	%f4,	%f12
	set	0x64, %l1
	lda	[%l7 + %l1] 0x81,	%f18
loop_436:
	call	loop_437
	call	loop_438
	smulcc	%g6,	0x08EC,	%g2
	call	loop_439
loop_437:
	mulx	%i3,	0x0663,	%g3
loop_438:
	add	%g4,	%o5,	%g5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x38] %asi,	%l5
loop_439:
	nop
	set	0x44, %o1
	lduw	[%l7 + %o1],	%g7
	call	loop_440
	array16	%l1,	%i4,	%o4
	bvc,a	%icc,	loop_441
	fmovrdgez	%l2,	%f0,	%f0
loop_440:
	call	loop_442
	umul	%i1,	%o0,	%g1
loop_441:
	call	loop_443
	call	loop_444
loop_442:
	xnor	%l3,	%i0,	%l0
	call	loop_445
loop_443:
	fmovdleu	%xcc,	%f14,	%f14
loop_444:
	call	loop_446
	edge16n	%i6,	%o6,	%l4
loop_445:
	nop
	fitos	%f0,	%f11
	fstoi	%f11,	%f25
	nop
	setx	0xDF14C117C6202C29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
loop_446:
	movule	%fcc2,	%o3,	%i7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%i5
	stx	%o7,	[%l7 + 0x10]
	fcmple32	%f18,	%f22,	%l6
	bshuffle	%f14,	%f12,	%f18
	sethi	0x1FE0,	%i2
	tvs	%icc,	0x7
	wr	%o1,	%g6,	%ccr
	fcmple16	%f6,	%f0,	%g2
	fsrc1s	%f21,	%f6
	fpadd16s	%f12,	%f0,	%f22
	movleu	%icc,	%o2,	%i3
	nop
	setx	0xF7152D69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x4078E45F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f7,	%f13
	wrpr	%g4,	%g3,	%tick
	fmovrslz	%o5,	%f29,	%f4
	call	loop_447
	edge16	%l5,	%g7,	%l1
	fmovsvs	%icc,	%f7,	%f30
	fnegs	%f3,	%f31
loop_447:
	nop
	set	0x10, %i0
	std	%f4,	[%l7 + %i0]
	siam	0x2
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%g4
	swap	[%l7 + 0x3C],	%i4
	call	loop_448
	rdpr	%tl,	%o4
	nop
	setx	loop_449,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014200001404,	%l0,	%l1
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
	fones	%f7
loop_448:
	nop
	setx	0x47B550EC3055FF2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x54328F27,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f28,	%f4
	edge16n	%i1,	%o0,	%g1
loop_449:
	fmul8sux16	%f14,	%f10,	%f4
	wrpr	%l2,	%l3,	%cwp
	movcc	%xcc,	%i0,	%l0
	addccc	%i6,	%o6,	%o3
	wr	%g0,	0x2b,	%asi
	stda	%i6,	[%l7 + 0x08] %asi
	membar	#Sync
	call	loop_450
	udivcc	%l4,	0x1740,	%i5
	nop
	set	0x40, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f26
loop_450:
	call	loop_451
	fmul8x16al	%f3,	%f30,	%f30
	call	loop_452
	fnot2s	%f25,	%f8
loop_451:
	fnor	%f0,	%f22,	%f16
	call	loop_453
loop_452:
	nop
	set	0x20, %i6
	ldstub	[%l7 + %i6],	%o7
	sdiv	%i2,	0x092A,	%o1
	tcs	%icc,	0x4
loop_453:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_454
	fmul8sux16	%f14,	%f22,	%f20
	call	loop_455
	wrpr	%g2,	0x0FA6,	%cwp
loop_454:
	fmul8x16	%f21,	%f0,	%f2
	call	loop_456
loop_455:
	call	loop_457
	fxors	%f15,	%f21,	%f1
	call	loop_458
loop_456:
	edge16ln	%o2,	%g6,	%g4
loop_457:
	fmovde	%icc,	%f4,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_458:
	addc	%l5,	0x0701,	%o5
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	be,a,pn	%xcc,	loop_459
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f6
	call	loop_460
	call	loop_461
loop_459:
	edge8n	%g5,	%i4,	%l1
	be,pt	%icc,	loop_462
loop_460:
	fmovscs	%xcc,	%f4,	%f6
loop_461:
	edge32n	%o4,	%i1,	%g1
	nop
	setx	0x16E6,	%l0,	%l2
	udivx	%o0,	%l2,	%i0
loop_462:
	call	loop_463
	wrpr	%l0,	%i6,	%cwp
	movl	%fcc0,	0x243,	%o6
	wrpr	%l3,	%i7,	%cwp
loop_463:
	orn	%l4,	%i5,	%o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 30
!	Type a   	: 29
!	Type x   	: 13
!	Type cti   	: 141
!	Type f   	: 138
!	Type i   	: 149
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
	set	0x9,	%g1
	set	0x2,	%g2
	set	0xE,	%g3
	set	0x8,	%g4
	set	0x9,	%g5
	set	0x4,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xE,	%i1
	set	-0x4,	%i2
	set	-0x1,	%i3
	set	-0x1,	%i4
	set	-0xF,	%i5
	set	-0x2,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x2E22050C,	%l0
	set	0x6193B12D,	%l1
	set	0x53E1CECA,	%l2
	set	0x13EA905C,	%l3
	set	0x254FD326,	%l4
	set	0x48469EDF,	%l5
	set	0x593E1F4C,	%l6
	!# Output registers
	set	0x1CDB,	%o0
	set	0x0E1D,	%o1
	set	0x183A,	%o2
	set	-0x1EB9,	%o3
	set	0x0DC8,	%o4
	set	-0x1E0C,	%o5
	set	0x11DF,	%o6
	set	0x17AE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	fmovsvs	%xcc,	%f31,	%f17
	addc	%i2,	%o1,	%o7
	movneg	%xcc,	%g2,	%l6
	tle	%icc,	0x4
	fmul8x16au	%f7,	%f22,	%f18
	fand	%f8,	%f10,	%f24
	call	loop_464
	fzeros	%f13
	movrgz	%g6,	%g4,	%o2
	fmovdge	%xcc,	%f2,	%f16
loop_464:
	ta	%icc,	0x2
	call	loop_465
	fabsd	%f10,	%f22
	movcc	%icc,	0x041,	%g3
	nop
	setx	0x49EEFDD6A8FD5BED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xEADFC9AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f20,	%f14
loop_465:
	movvc	%icc,	%i3,	%o5
	fzero	%f20
	nop
	setx	0x7F46F43F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x456EB402,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f4,	%f30
	call	loop_466
	call	loop_467
	tle	%xcc,	0x3
	array16	%g7,	%g5,	%i4
loop_466:
	umul	%l5,	%o4,	%l1
loop_467:
	call	loop_468
	call	loop_469
	movrgz	%i1,	%o0,	%g1
	call	loop_470
loop_468:
	srax	%l2,	%l0,	%i6
loop_469:
	ldsw	[%l7 + 0x78],	%o6
	fmul8x16au	%f3,	%f1,	%f0
loop_470:
	taddcc	%i0,	0x11A1,	%l3
	movule	%fcc3,	%l4,	%i5
	or	%o3,	0x0959,	%i2
	bpos	%xcc,	loop_471
	nop
	fitos	%f0,	%f19
	fstox	%f19,	%f12
	fxtos	%f12,	%f3
	fpsub16s	%f24,	%f23,	%f16
	fmovscs	%icc,	%f0,	%f6
loop_471:
	call	loop_472
	wrpr	%i7,	0x04E1,	%pil
	fbul,a	%fcc0,	loop_473
	nop
	setx	0x1BFC,	%l0,	%o7
	udivcc	%o1,	%o7,	%l6
loop_472:
	subccc	%g6,	%g4,	%g2
	fors	%f17,	%f27,	%f12
loop_473:
	movvs	%xcc,	0x66D,	%g3
	call	loop_474
	call	loop_475
	edge8	%o2,	%i3,	%o5
	rd	%ccr,	%g7
loop_474:
	fpsub16s	%f23,	%f27,	%f14
loop_475:
	nop
	set	0x20, %g4
	std	%i4,	[%l7 + %g4]
	fmovdvs	%xcc,	%f14,	%f2
	fmovdu	%fcc3,	%f12,	%f2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovda	%fcc2,	%f0,	%f22
	rdhpr	%hpstate,	%g5
	movrlez	%l5,	0x27A,	%l1
	fornot2s	%f9,	%f3,	%f3
	array32	%o4,	%o0,	%g1
	add	%l2,	%l0,	%i6
	set	0x46, %o5
	ldsha	[%l7 + %o5] 0x18,	%i1
	call	loop_476
	fxors	%f9,	%f8,	%f6
	movrne	%o6,	0x28B,	%l3
	call	loop_477
loop_476:
	call	loop_478
	brlez,a	%l4,	loop_479
	tvs	%icc,	0x4
loop_477:
	call	loop_480
loop_478:
	nop
	setx	0x01BE,	%l0,	%i0
	udivcc	%i5,	%i0,	%i2
loop_479:
	rdhpr	%hintp,	%i7
	fbg	%fcc3,	loop_481
loop_480:
	movpos	%icc,	%o1,	%o7
	orn	%o3,	0x0284,	%g6
	call	loop_482
loop_481:
	fmovdcs	%xcc,	%f10,	%f28
	fmovde	%fcc3,	%f28,	%f8
	call	loop_483
loop_482:
	movrne	%l6,	0x27F,	%g4
	sllx	%g2,	%g3,	%i3
	nop
	fitos	%f8,	%f7
	fstox	%f7,	%f20
	fxtos	%f20,	%f31
loop_483:
	fmovrdlez	%o2,	%f6,	%f26
	mulscc	%g7,	%o5,	%g5
	ta	%icc,	0x4
	movre	%i4,	0x1BE,	%l1
	fmovdul	%fcc0,	%f18,	%f6
	taddcc	%l5,	%o4,	%o0
	fmovdvs	%icc,	%f28,	%f16
	tge	%xcc,	0x2
	call	loop_484
	call	loop_485
	call	loop_486
	call	loop_487
loop_484:
	movlg	%fcc2,	0x645,	%l2
loop_485:
	movue	%fcc1,	%g1,	%l0
loop_486:
	fmovdpos	%icc,	%f22,	%f18
loop_487:
	movre	%i1,	%i6,	%o6
	rdpr	%cleanwin,	%l3
	call	loop_488
	call	loop_489
	call	loop_490
	tvc	%icc,	0x7
loop_488:
	movle	%fcc0,	0x6BE,	%l4
loop_489:
	nop
	set	0x58, %o7
	ldub	[%l7 + %o7],	%i5
loop_490:
	fsrc2	%f18,	%f4
	tvs	%xcc,	0x5
	nop
	setx	0x09F9,	%l0,	%i2
	udivcc	%i0,	%i2,	%i7
	tge	%xcc,	0x6
	fmovsge	%fcc0,	%f29,	%f22
	fmovdge	%xcc,	%f0,	%f14
	call	loop_491
	movul	%fcc2,	0x4C6,	%o7
	movcc	%xcc,	0x2E5,	%o3
	fmovdg	%xcc,	%f16,	%f2
loop_491:
	wr 	%g0, 	0x5, 	%fprs
	fpadd16s	%f29,	%f11,	%f2
	smulcc	%l6,	0x02C8,	%g4
	fbe,a,pn	%fcc1,	loop_492
	fpsub16	%f18,	%f24,	%f20
	or	%g2,	%g3,	%o2
	call	loop_493
loop_492:
	fnot2s	%f31,	%f21
	fmovdlg	%fcc1,	%f12,	%f8
	call	loop_494
loop_493:
	fbug,a,pt	%fcc0,	loop_495
	fmovdg	%fcc3,	%f28,	%f24
	fandnot2s	%f8,	%f22,	%f12
loop_494:
	fmovso	%fcc3,	%f2,	%f8
loop_495:
	call	loop_496
	fmovdug	%fcc3,	%f20,	%f10
	nop
	setx	0x1D6C,	%l0,	%i3
	udivx	%g7,	%i3,	%g5
	bge,a	%icc,	loop_497
loop_496:
	call	loop_498
	andcc	%o5,	0x0727,	%i4
	fmovsue	%fcc1,	%f26,	%f0
loop_497:
	smul	%l5,	%l1,	%o0
loop_498:
	fpadd32	%f28,	%f16,	%f2
	call	loop_499
	call	loop_500
	tne	%icc,	0x6
	fones	%f12
loop_499:
	call	loop_501
loop_500:
	addcc	%l2,	%g1,	%l0
	fcmpne16	%f2,	%f4,	%i1
	edge8	%o4,	%o6,	%i6
loop_501:
	fcmpne32	%f16,	%f10,	%l3
	call	loop_502
	wrpr	%l4,	0x0A1E,	%tick
	call	loop_503
	sub	%i0,	0x1642,	%i5
loop_502:
	fpadd32s	%f2,	%f10,	%f3
	siam	0x1
loop_503:
	call	loop_504
	fmul8ulx16	%f2,	%f2,	%f12
	fmovsvs	%icc,	%f13,	%f31
	nop
	setx	0x1D68874D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xB32C7601,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f25,	%f18
loop_504:
	fbg,a	%fcc2,	loop_505
	fpadd16s	%f30,	%f25,	%f30
	rdpr	%pil,	%i7
	call	loop_506
loop_505:
	mulscc	%o7,	%o3,	%i2
	membar	0x7A
	edge32	%g6,	%l6,	%o1
loop_506:
	fcmps	%fcc1,	%f14,	%f13
	fmovsvs	%icc,	%f2,	%f21
	fmovsle	%fcc1,	%f14,	%f3
	call	loop_507
	nop
	fitos	%f4,	%f4
	fstox	%f4,	%f26
	call	loop_508
	fmovdn	%fcc0,	%f0,	%f12
loop_507:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B8, 	%hsys_tick_cmpr
	call	loop_509
loop_508:
	fmovdn	%icc,	%f6,	%f26
	fmovdg	%icc,	%f10,	%f6
	call	loop_510
loop_509:
	fmovsu	%fcc3,	%f25,	%f30
	call	loop_511
	fornot1s	%f27,	%f28,	%f10
loop_510:
	fmovdvc	%icc,	%f16,	%f26
	call	loop_512
loop_511:
	ldstub	[%l7 + 0x63],	%g3
	stx	%o2,	[%l7 + 0x38]
	movvs	%xcc,	%g7,	%g4
loop_512:
	wr	%i3,	%g5,	%softint
	wrpr	%i4,	%l5,	%cwp
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%l1
	call	loop_513
	edge32	%o5,	%l2,	%o0
	nop
	fitos	%f2,	%f17
	fstox	%f17,	%f6
	fmovsul	%fcc0,	%f12,	%f12
loop_513:
	fmovd	%f28,	%f18
	mova	%xcc,	0x443,	%g1
	siam	0x1
	fmovso	%fcc0,	%f3,	%f8
	sll	%l0,	%o4,	%o6
	smulcc	%i6,	0x08D9,	%i1
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f30
	fxtod	%f30,	%f24
	call	loop_514
	call	loop_515
	mulx	%l4,	%i0,	%i5
	fbo,a,pt	%fcc3,	loop_516
loop_514:
	array32	%l3,	%i7,	%o7
loop_515:
	call	loop_517
	fmovslg	%fcc3,	%f7,	%f10
loop_516:
	call	loop_518
	wrpr	%o3,	%g6,	%pil
loop_517:
	movug	%fcc3,	0x2AA,	%l6
	call	loop_519
loop_518:
	tneg	%xcc,	0x4
	ldsh	[%l7 + 0x54],	%i2
	call	loop_520
loop_519:
	call	loop_521
	edge16l	%g2,	%o1,	%g3
	movrgez	%g7,	%o2,	%g4
loop_520:
	call	loop_522
loop_521:
	srl	%i3,	%g5,	%l5
	call	loop_523
	wrpr	%l1,	0x0F1F,	%tick
loop_522:
	fcmpne32	%f6,	%f24,	%o5
	fmovscs	%xcc,	%f19,	%f31
loop_523:
	faligndata	%f30,	%f20,	%f22
	call	loop_524
	call	loop_525
	call	loop_526
	fmovdvc	%icc,	%f28,	%f20
loop_524:
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%i4
loop_525:
	call	loop_527
loop_526:
	call	loop_528
	fcmps	%fcc3,	%f5,	%f10
	fbg,a	%fcc2,	loop_529
loop_527:
	fmovsug	%fcc0,	%f8,	%f14
loop_528:
	siam	0x6
	call	loop_530
loop_529:
	fmuld8sux16	%f13,	%f8,	%f12
	bvc	%xcc,	loop_531
	fcmpeq16	%f30,	%f24,	%o0
loop_530:
	fpackfix	%f30,	%f23
	subcc	%g1,	%l0,	%l2
loop_531:
	nop
	setx	0x79C90CF3F9640B3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f2
	call	loop_532
	bmask	%o6,	%o4,	%i1
	fpadd16s	%f29,	%f27,	%f3
	call	loop_533
loop_532:
	call	loop_534
	call	loop_535
	fmovdne	%fcc3,	%f10,	%f24
loop_533:
	fcmpes	%fcc1,	%f11,	%f27
loop_534:
	call	loop_536
loop_535:
	xor	%l4,	0x162D,	%i6
	taddcc	%i5,	%i0,	%i7
	movvs	%xcc,	0x39C,	%o7
loop_536:
	fcmps	%fcc1,	%f9,	%f10
	movrgz	%o3,	%g6,	%l3
	andcc	%l6,	%g2,	%i2
	nop
	setx	loop_537,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x014400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%g3,	0x0CD8,	%g7
	fmovsg	%fcc0,	%f4,	%f7
	fpsub16	%f28,	%f10,	%f28
loop_537:
	fbug,a,pt	%fcc0,	loop_538
	fpadd16s	%f2,	%f17,	%f13
	tg	%icc,	0x6
	movne	%fcc3,	%o2,	%o1
loop_538:
	fsrc2	%f8,	%f16
	nop
	setx	0x0CAC,	%l0,	%g5
	udivx	%g4,	%g5,	%l5
	call	loop_539
	fmovspos	%icc,	%f16,	%f5
	call	loop_540
	call	loop_541
loop_539:
	call	loop_542
	call	loop_543
loop_540:
	rdpr	%pil,	%l1
loop_541:
	call	loop_544
loop_542:
	fbul	%fcc2,	loop_545
loop_543:
	srl	%i3,	%o5,	%i4
	fmovsu	%fcc2,	%f10,	%f29
loop_544:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%g1
loop_545:
	fmovrdne	%l0,	%f18,	%f6
	tneg	%xcc,	0x7
	andcc	%o6,	0x1F99,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsu	%fcc0,	%f17,	%f12
	call	loop_546
	call	loop_547
	edge8ln	%i6,	%i5,	%o4
	wrpr	%i7,	0x1A9E,	%tick
loop_546:
	nop
	set	0x4B, %g1
	ldsba	[%l7 + %g1] 0x10,	%i0
loop_547:
	wr	%o7,	%g6,	%set_softint
	fmovdo	%fcc0,	%f18,	%f2
	set	0x37, %i4
	ldsba	[%l7 + %i4] 0x89,	%o3
	nop
	setx	0x1689,	%l0,	%g2
	udivcc	%l3,	%g2,	%i2
	fandnot1	%f22,	%f24,	%f16
	orcc	%l6,	%g7,	%g3
	wr	%g0,	0x0c,	%asi
	stda	%o0,	[%l7 + 0x58] %asi
	movrgz	%g4,	%o2,	%l5
	tleu	%xcc,	0x2
	fxor	%f14,	%f4,	%f30
	faligndata	%f18,	%f20,	%f10
	wrpr	%l1,	%i3,	%cwp
	fmovsgu	%xcc,	%f14,	%f7
	fxors	%f13,	%f1,	%f24
	alignaddr	%o5,	%i4,	%o0
	call	loop_548
	movcs	%icc,	0x007,	%g1
	fcmple16	%f26,	%f0,	%l0
	nop
	set	0x6C, %l0
	ldstub	[%l7 + %l0],	%g5
loop_548:
	xorcc	%o6,	%l2,	%l4
	brgez,a,pn	%i1,	loop_549
	fcmple16	%f26,	%f16,	%i6
	call	loop_550
	call	loop_551
loop_549:
	call	loop_552
	nop
	setx	0x2F00244B226644A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x44B54E95C1AF771C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f26,	%f12
loop_550:
	movne	%fcc0,	0x541,	%i5
loop_551:
	nop
	setx	loop_553,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001100001406,	%l0,	%l1
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
loop_552:
	andcc	%o4,	%i7,	%o7
	movcs	%icc,	0x5A3,	%i0
	stb	%o3,	[%l7 + 0x31]
loop_553:
	fpadd16s	%f12,	%f1,	%f0
	rd	%pc,	%g6
	fnors	%f23,	%f19,	%f14
	call	loop_554
	call	loop_555
	brlz	%l3,	loop_556
	edge16	%i2,	%g2,	%g7
loop_554:
	tvs	%icc,	0x1
loop_555:
	call	loop_557
loop_556:
	fmul8x16al	%f5,	%f21,	%f22
	fmovde	%fcc0,	%f28,	%f26
	call	loop_558
loop_557:
	tgu	%icc,	0x0
	nop
	set	0x62, %o6
	stb	%l6,	[%l7 + %o6]
	fbul,a	%fcc3,	loop_559
loop_558:
	call	loop_560
	call	loop_561
	call	loop_562
loop_559:
	call	loop_563
loop_560:
	srlx	%g3,	%g4,	%o2
loop_561:
	edge16l	%l5,	%l1,	%i3
loop_562:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o5
loop_563:
	nop
	set	0x74, %g6
	swap	[%l7 + %g6],	%o1
	fmovso	%fcc1,	%f31,	%f12
	call	loop_564
	call	loop_565
	subcc	%o0,	%g1,	%i4
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f20
	fxtod	%f20,	%f2
loop_564:
	call	loop_566
loop_565:
	fmovrdgz	%l0,	%f4,	%f28
	subc	%g5,	%o6,	%l2
	fmovrse	%i1,	%f31,	%f29
loop_566:
	call	loop_567
	bl,pt	%xcc,	loop_568
	fsrc2s	%f6,	%f27
	fmovrdgz	%i6,	%f12,	%f6
loop_567:
	fnegd	%f10,	%f4
loop_568:
	nop
	set	0x10, %l2
	sta	%f0,	[%l7 + %l2] 0x89
	rd	%tick_cmpr,	%i5
	ld	[%l7 + 0x0C],	%f23
	fmovsge	%icc,	%f20,	%f28
	movl	%fcc0,	%l4,	%i7
	fnot1s	%f25,	%f30
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%o7
	fmovsug	%fcc2,	%f19,	%f13
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_569
	fnot2s	%f0,	%f18
	srlx	%i0,	%o3,	%g6
	movrlz	%o4,	%l3,	%g2
loop_569:
	call	loop_570
	call	loop_571
	fors	%f18,	%f24,	%f20
	rd	%y,	%i2
loop_570:
	movrlz	%g7,	0x1B4,	%g3
loop_571:
	movle	%icc,	0x58E,	%l6
	fmovdneg	%xcc,	%f16,	%f0
	fmovsvs	%xcc,	%f9,	%f15
	call	loop_572
	move	%fcc2,	0x73D,	%o2
	set	0x64, %g7
	sta	%f15,	[%l7 + %g7] 0x89
loop_572:
	fxors	%f13,	%f27,	%f7
	fmul8x16au	%f15,	%f4,	%f24
	set	0x14, %o2
	ldswa	[%l7 + %o2] 0x18,	%g4
	subcc	%l5,	0x118B,	%l1
	call	loop_573
	fmovsge	%fcc0,	%f24,	%f17
	xorcc	%o5,	0x1F6B,	%i3
	fmovsleu	%xcc,	%f19,	%f20
loop_573:
	call	loop_574
	fands	%f2,	%f31,	%f29
	fmovs	%f13,	%f3
	call	loop_575
loop_574:
	nop
	setx	0x11CC,	%l0,	%g1
	sdiv	%o1,	%g1,	%i4
	fcmps	%fcc3,	%f1,	%f30
	fmovsn	%fcc3,	%f13,	%f0
loop_575:
	fmovsvc	%icc,	%f19,	%f14
	fmovsn	%xcc,	%f0,	%f10
	fmovrdlz	%o0,	%f14,	%f30
	fabsd	%f26,	%f2
	fbu,pt	%fcc3,	loop_576
	fnor	%f6,	%f30,	%f16
	call	loop_577
	orcc	%l0,	0x18BC,	%g5
loop_576:
	call	loop_578
	movneg	%xcc,	%l2,	%o6
loop_577:
	call	loop_579
	stbar
loop_578:
	fmovrslez	%i1,	%f9,	%f1
	sllx	%i6,	0x15,	%i5
loop_579:
	call	loop_580
	call	loop_581
	fmovrde	%l4,	%f16,	%f16
	subc	%i7,	%o7,	%o3
loop_580:
	fcmpgt32	%f16,	%f22,	%g6
loop_581:
	call	loop_582
	movn	%icc,	0x582,	%i0
	popc	0x0195,	%o4
	bvc	%xcc,	loop_583
loop_582:
	ble,pn	%icc,	loop_584
	bneg	%xcc,	loop_585
	stbar
loop_583:
	call	loop_586
loop_584:
	call	loop_587
loop_585:
	call	loop_588
	sdivcc	%g2,	0x0662,	%i2
loop_586:
	call	loop_589
loop_587:
	fmovrse	%l3,	%f18,	%f6
loop_588:
	fxnor	%f20,	%f30,	%f4
	movne	%fcc0,	%g7,	%g3
loop_589:
	edge8l	%o2,	%g4,	%l5
	fones	%f7
	fnors	%f9,	%f16,	%f17
	bcs	%xcc,	loop_590
	fcmpes	%fcc0,	%f27,	%f25
	std	%l0,	[%l7 + 0x20]
	call	loop_591
loop_590:
	call	loop_592
	sub	%o5,	%l6,	%o1
	fpack16	%f6,	%f5
loop_591:
	tg	%icc,	0x7
loop_592:
	edge8ln	%g1,	%i4,	%o0
	fpadd16	%f14,	%f16,	%f14
	fpsub16s	%f6,	%f22,	%f15
	wrpr	%l0,	0x0DCC,	%tick
	fbe,a	%fcc1,	loop_593
	call	loop_594
	udivx	%g5,	0x19BE,	%i3
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
loop_593:
	nop
	wr	%g0,	0x57,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
loop_594:
	membar	0x70
	fpsub16s	%f0,	%f13,	%f27
	fmuld8sux16	%f27,	%f12,	%f16
	set	0x0B, %l4
	stba	%i6,	[%l7 + %l4] 0x2f
	membar	#Sync
	nop
	setx	0x4E2456C8ECB99ED3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f4
	fornot1s	%f13,	%f13,	%f22
	call	loop_595
	nop
	setx	0xA133CFAE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xFEC89A3B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f20,	%f26
	fbne,pn	%fcc2,	loop_596
	movrgz	%o6,	0x059,	%i5
loop_595:
	mulscc	%i7,	0x08AC,	%o7
	call	loop_597
loop_596:
	call	loop_598
	call	loop_599
	edge8	%l4,	%g6,	%i0
loop_597:
	tsubcc	%o3,	%o4,	%i2
loop_598:
	rdhpr	%ver,	%g2
loop_599:
	call	loop_600
	fmovdcs	%xcc,	%f12,	%f10
	call	loop_601
	edge8n	%g7,	%g3,	%o2
loop_600:
	call	loop_602
	movvs	%xcc,	%l3,	%l5
loop_601:
	fmovrdgez	%l1,	%f6,	%f6
	fabsd	%f16,	%f2
loop_602:
	tg	%icc,	0x0
	taddcctv	%g4,	0x1C65,	%l6
	fmovscc	%icc,	%f7,	%f18
	fmovsge	%fcc0,	%f24,	%f14
	fnot2s	%f29,	%f24
	call	loop_603
	rdpr	%cansave,	%o5
	bpos,a	%icc,	loop_604
	tsubcc	%o1,	0x01F0,	%g1
loop_603:
	sethi	0x1CF8,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x0c,	%l0,	%o0
loop_604:
	fandnot2	%f30,	%f22,	%f12
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x37] %asi,	%i3
	edge32n	%l2,	%g5,	%i1
	wr	%o6,	%i5,	%ccr
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 31
!	Type a   	: 25
!	Type x   	: 14
!	Type cti   	: 141
!	Type f   	: 153
!	Type i   	: 136
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
	set	0xC,	%g1
	set	0x7,	%g2
	set	0x9,	%g3
	set	0x0,	%g4
	set	0x1,	%g5
	set	0xF,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x8,	%i1
	set	-0xE,	%i2
	set	-0x2,	%i3
	set	-0x7,	%i4
	set	-0x9,	%i5
	set	-0x7,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x320868DE,	%l0
	set	0x0DF1D883,	%l1
	set	0x48D10054,	%l2
	set	0x5B129900,	%l3
	set	0x7B74CB2E,	%l4
	set	0x38177D3A,	%l5
	set	0x29438504,	%l6
	!# Output registers
	set	0x06BD,	%o0
	set	-0x1E0A,	%o1
	set	0x01B8,	%o2
	set	0x006D,	%o3
	set	0x11E4,	%o4
	set	-0x0BA0,	%o5
	set	0x1E76,	%o6
	set	0x038A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	sll	%i6,	0x13,	%o7
	orncc	%i7,	0x17DA,	%g6
	fmovrdgz	%l4,	%f14,	%f6
	movgu	%icc,	%o3,	%o4
	add	%i2,	%i0,	%g2
	fnegd	%f28,	%f22
	fnot1	%f24,	%f26
	fmovrdne	%g3,	%f0,	%f12
	rdpr	%gl,	%o2
	call	loop_605
	fmovsug	%fcc3,	%f14,	%f25
	call	loop_606
	siam	0x3
loop_605:
	call	loop_607
	fxnor	%f16,	%f26,	%f26
loop_606:
	membar	0x2D
	sethi	0x1A45,	%g7
loop_607:
	movrgez	%l3,	0x283,	%l1
	rdpr	%tl,	%l5
	call	loop_608
	fmovdcc	%icc,	%f30,	%f0
	nop
	set	0x56, %i5
	sth	%l6,	[%l7 + %i5]
	call	loop_609
loop_608:
	fmul8x16al	%f29,	%f6,	%f24
	call	loop_610
	call	loop_611
loop_609:
	fmovsa	%fcc0,	%f17,	%f25
	fmul8ulx16	%f4,	%f14,	%f14
loop_610:
	fnand	%f30,	%f2,	%f26
loop_611:
	fmovspos	%xcc,	%f9,	%f29
	sdiv	%g4,	0x0FF5,	%o5
	nop
	setx	0x524C6FA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xE9803AFB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f1,	%f0
	fmovdge	%fcc1,	%f26,	%f10
	fmovsu	%fcc1,	%f30,	%f23
	call	loop_612
	fmovdue	%fcc3,	%f26,	%f30
	call	loop_613
	smulcc	%o1,	%i4,	%g1
loop_612:
	xorcc	%l0,	%i3,	%o0
	call	loop_614
loop_613:
	fsrc2	%f12,	%f20
	call	loop_615
	fcmpeq32	%f26,	%f12,	%l2
loop_614:
	call	loop_616
	fble	%fcc1,	loop_617
loop_615:
	call	loop_618
	lduw	[%l7 + 0x54],	%i1
loop_616:
	for	%f16,	%f16,	%f8
loop_617:
	fmovdg	%xcc,	%f2,	%f18
loop_618:
	fsrc1	%f24,	%f18
	call	loop_619
	rdpr	%tl,	%o6
	call	loop_620
	call	loop_621
loop_619:
	smulcc	%i5,	0x073F,	%i6
	call	loop_622
loop_620:
	rd	%ccr,	%g5
loop_621:
	edge16n	%o7,	%g6,	%i7
	call	loop_623
loop_622:
	movle	%fcc2,	%l4,	%o3
	fcmpd	%fcc0,	%f16,	%f10
	fmovrdlz	%o4,	%f18,	%f0
loop_623:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x15B, 	%hsys_tick_cmpr
	call	loop_624
	call	loop_625
	fnegs	%f6,	%f1
	nop
	setx	0x15B0,	%l0,	%o2
	udivx	%g3,	%o2,	%g7
loop_624:
	umul	%l3,	0x04A6,	%l1
loop_625:
	fmovsneg	%xcc,	%f19,	%f3
	subccc	%l5,	0x1605,	%i2
	movcc	%xcc,	%l6,	%g4
	call	loop_626
	call	loop_627
	call	loop_628
	rdhpr	%htba,	%o5
loop_626:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_627:
	movl	%fcc3,	%o1,	%g1
loop_628:
	call	loop_629
	call	loop_630
	for	%f8,	%f22,	%f24
	fmul8x16au	%f18,	%f14,	%f24
loop_629:
	bcc,a	%icc,	loop_631
loop_630:
	taddcc	%i3,	%o0,	%l2
	nop
	setx	0xB60D30C72A39049C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f26
	call	loop_632
loop_631:
	call	loop_633
	fcmped	%fcc3,	%f28,	%f30
	call	loop_634
loop_632:
	brlez,pt	%l0,	loop_635
loop_633:
	fnot1s	%f10,	%f24
	subccc	%o6,	%i5,	%i1
loop_634:
	call	loop_636
loop_635:
	fmovrdlz	%i6,	%f22,	%f30
	fmovdgu	%xcc,	%f12,	%f26
	call	loop_637
loop_636:
	call	loop_638
	call	loop_639
	fmovrdne	%g5,	%f28,	%f6
loop_637:
	fmovsa	%icc,	%f20,	%f31
loop_638:
	fmovrsne	%o7,	%f8,	%f9
loop_639:
	fcmpes	%fcc3,	%f16,	%f4
	call	loop_640
	addcc	%i7,	%l4,	%o3
	orncc	%o4,	%i0,	%g6
	fmovscs	%icc,	%f16,	%f18
loop_640:
	call	loop_641
	edge8n	%g3,	%o2,	%g7
	stb	%l3,	[%l7 + 0x3C]
	for	%f22,	%f28,	%f4
loop_641:
	call	loop_642
	fmovscc	%icc,	%f3,	%f0
	call	loop_643
	movre	%l1,	%g2,	%l5
loop_642:
	fors	%f9,	%f2,	%f23
	tvs	%xcc,	0x4
loop_643:
	call	loop_644
	addcc	%l6,	0x1368,	%g4
	stbar
	umulcc	%i2,	%o5,	%o1
loop_644:
	fmovsul	%fcc0,	%f17,	%f28
	membar	0x6E
	fmovdue	%fcc0,	%f14,	%f26
	call	loop_645
	tsubcc	%g1,	0x1B08,	%i3
	fmovdul	%fcc3,	%f14,	%f6
	fnors	%f25,	%f25,	%f7
loop_645:
	nop
	set	0x30, %i7
	swapa	[%l7 + %i7] 0x80,	%o0
	tle	%xcc,	0x7
	call	loop_646
	fnands	%f0,	%f8,	%f13
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x48] %asi,	%i4
loop_646:
	fcmpne16	%f28,	%f8,	%l2
	bmask	%l0,	%o6,	%i1
	and	%i5,	%g5,	%i6
	fmovrsgez	%o7,	%f18,	%f15
	movrgz	%l4,	0x0D9,	%o3
	tn	%icc,	0x4
	fxors	%f8,	%f25,	%f5
	fornot2	%f10,	%f2,	%f16
	nop
	fitos	%f10,	%f3
	fstox	%f3,	%f4
	call	loop_647
	call	loop_648
	fmovsule	%fcc0,	%f27,	%f20
	rd	%ccr,	%o4
loop_647:
	bn,a,pn	%icc,	loop_649
loop_648:
	bg,pn	%icc,	loop_650
	addc	%i7,	0x0725,	%g6
	fmovse	%fcc3,	%f12,	%f8
loop_649:
	fmovscc	%icc,	%f7,	%f7
loop_650:
	udiv	%i0,	0x01D2,	%g3
	set	0x1E, %i3
	stha	%g7,	[%l7 + %i3] 0x23
	membar	#Sync
	call	loop_651
	call	loop_652
	edge8l	%o2,	%l1,	%l3
	bcc,a,pt	%icc,	loop_653
loop_651:
	call	loop_654
loop_652:
	call	loop_655
	fbue	%fcc2,	loop_656
loop_653:
	fpadd32s	%f1,	%f25,	%f29
loop_654:
	fmovrdgz	%g2,	%f8,	%f0
loop_655:
	movge	%icc,	0x594,	%l6
loop_656:
	tge	%icc,	0x5
	fbn	%fcc2,	loop_657
	movvc	%icc,	0x1EE,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_658
loop_657:
	call	loop_659
	nop
	set	0x20, %g3
	stb	%l5,	[%l7 + %g3]
	call	loop_660
loop_658:
	edge8n	%o1,	%g1,	%i3
loop_659:
	call	loop_661
	fsrc1	%f22,	%f12
loop_660:
	fmovs	%f3,	%f24
	fmovsue	%fcc0,	%f0,	%f3
loop_661:
	fmovdue	%fcc0,	%f22,	%f2
	movule	%fcc0,	%o0,	%i4
	fsrc1	%f26,	%f8
	call	loop_662
	call	loop_663
	orcc	%l2,	0x1C48,	%l0
	call	loop_664
loop_662:
	call	loop_665
loop_663:
	ld	[%l7 + 0x18],	%f22
	movpos	%icc,	0x57D,	%o5
loop_664:
	ld	[%l7 + 0x60],	%f22
loop_665:
	call	loop_666
	call	loop_667
	or	%i1,	0x01C6,	%i5
	fandnot2s	%f3,	%f8,	%f30
loop_666:
	rdpr	%pil,	%g5
loop_667:
	fand	%f8,	%f8,	%f4
	call	loop_668
	call	loop_669
	call	loop_670
	wr	%o6,	0x1112,	%set_softint
loop_668:
	nop
	set	0x28, %g5
	ldsw	[%l7 + %g5],	%o7
loop_669:
	fabsd	%f12,	%f8
loop_670:
	edge8ln	%i6,	%l4,	%o4
	fand	%f4,	%f4,	%f18
	nop
	setx	0x58A2F5284F08CB81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x1474F2BC78DA4E8C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f14,	%f22
	call	loop_671
	fcmpeq32	%f30,	%f14,	%i7
	subcc	%o3,	0x10C7,	%i0
	call	loop_672
loop_671:
	tge	%xcc,	0x1
	nop
	setx	0x5934652482526F06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF5E1145A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f4,	%f10
	tcc	%xcc,	0x7
loop_672:
	rd	%sys_tick_cmpr,	%g6
	fmovslg	%fcc2,	%f6,	%f14
	call	loop_673
	movrgez	%g3,	0x394,	%g7
	xorcc	%l1,	0x19E0,	%l3
	tcs	%icc,	0x2
loop_673:
	edge16l	%o2,	%l6,	%g2
	alignaddr	%g4,	%i2,	%o1
	fmovdleu	%icc,	%f26,	%f6
	rdhpr	%hintp,	%g1
	rdhpr	%hsys_tick_cmpr,	%l5
	fmovsvc	%icc,	%f31,	%f5
	movpos	%icc,	%i3,	%i4
	fmul8sux16	%f2,	%f6,	%f26
	nop
	fitos	%f4,	%f7
	fxors	%f30,	%f7,	%f25
	call	loop_674
	tle	%icc,	0x7
	ble	%xcc,	loop_675
	sub	%o0,	%l2,	%l0
loop_674:
	edge8ln	%o5,	%i5,	%g5
	fcmpne16	%f20,	%f14,	%i1
loop_675:
	rdhpr	%hintp,	%o7
	wr	%g0,	0x2b,	%asi
	stda	%i6,	[%l7 + 0x18] %asi
	membar	#Sync
	rdpr	%canrestore,	%l4
	fmovdgu	%xcc,	%f26,	%f26
	tpos	%xcc,	0x5
	tleu	%icc,	0x1
	fmovdg	%fcc2,	%f24,	%f10
	and	%o6,	0x06DE,	%i7
	fbn	%fcc2,	loop_676
	call	loop_677
	call	loop_678
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_676:
	call	loop_679
loop_677:
	nop
	setx	loop_680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002200001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_678:
	fnand	%f18,	%f26,	%f6
	tgu	%icc,	0x1
loop_679:
	fmovsvc	%xcc,	%f17,	%f4
loop_680:
	movu	%fcc1,	0x44C,	%o3
	movg	%icc,	0x57E,	%o4
	rdhpr	%ver,	%g6
	fmovsn	%icc,	%f9,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4FF, 	%hsys_tick_cmpr
	fmovsneg	%xcc,	%f21,	%f19
	fble,a,pn	%fcc3,	loop_681
	tg	%xcc,	0x0
	umul	%g7,	%g3,	%l1
	fmovsuge	%fcc0,	%f26,	%f7
loop_681:
	flushw
	fmovdle	%icc,	%f18,	%f6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o2
	movrlz	%l3,	%l6,	%g4
	call	loop_682
	fmovsu	%fcc1,	%f1,	%f29
	nop
	setx	0xECD5A93F52C605D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x71BEA312228FF8AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f28,	%f2
	fmovd	%f0,	%f0
loop_682:
	fbne,a	%fcc0,	loop_683
	nop
	setx	0xA2D30161,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xBC05EF19,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f31,	%f9
	fnegd	%f14,	%f12
	sethi	0x1C3A,	%i2
loop_683:
	edge8	%g2,	%g1,	%l5
	fpmerge	%f13,	%f3,	%f0
	fandnot2	%f0,	%f10,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	std	%o0,	[%l7 + 0x60]
	and	%l2,	0x0F71,	%i4
	mova	%icc,	%l0,	%o5
	edge32ln	%g5,	%i5,	%o7
	srlx	%i6,	0x11,	%l4
	set	0x34, %l6
	swapa	[%l7 + %l6] 0x19,	%i1
	call	loop_684
	bmask	%o6,	%o3,	%i7
	movneg	%xcc,	%g6,	%o4
	call	loop_685
loop_684:
	fsrc2	%f18,	%f10
	call	loop_686
	call	loop_687
loop_685:
	fmovduge	%fcc2,	%f12,	%f6
	set	0x4E, %o0
	lduha	[%l7 + %o0] 0x10,	%g7
loop_686:
	wrpr	%g3,	%i0,	%pil
loop_687:
	ba,a,pt	%xcc,	loop_688
	brnz,a	%o2,	loop_689
	call	loop_690
	call	loop_691
loop_688:
	call	loop_692
loop_689:
	fcmpne32	%f22,	%f2,	%l1
loop_690:
	nop
	set	0x2C, %l1
	sth	%l3,	[%l7 + %l1]
loop_691:
	nop
	fitos	%f4,	%f12
	fstox	%f12,	%f12
loop_692:
	nop
	set	0x69, %o1
	stb	%g4,	[%l7 + %o1]
	fmovspos	%xcc,	%f16,	%f23
	tcs	%xcc,	0x5
	fmovslg	%fcc0,	%f23,	%f0
	set	0x4C, %i0
	lduba	[%l7 + %i0] 0x0c,	%l6
	smulcc	%g2,	0x1189,	%i2
	fpadd32	%f2,	%f18,	%f4
	call	loop_693
	call	loop_694
	call	loop_695
	alignaddrl	%l5,	%g1,	%i3
loop_693:
	fpack16	%f16,	%f21
loop_694:
	taddcc	%o0,	%l2,	%o1
loop_695:
	nop
	fitod	%f2,	%f20
	call	loop_696
	call	loop_697
	nop
	fitos	%f1,	%f28
	fstoi	%f28,	%f14
	move	%icc,	%l0,	%i4
loop_696:
	ldub	[%l7 + 0x25],	%o5
loop_697:
	fmovsvc	%icc,	%f21,	%f23
	fabsd	%f12,	%f8
	srl	%g5,	0x12,	%i5
	call	loop_698
	call	loop_699
	fmovdlg	%fcc1,	%f28,	%f24
	call	loop_700
loop_698:
	alignaddrl	%i6,	%l4,	%i1
loop_699:
	fpsub16s	%f21,	%f17,	%f18
	call	loop_701
loop_700:
	fmul8x16al	%f29,	%f17,	%f0
	movg	%fcc2,	%o6,	%o3
	bvs,pn	%icc,	loop_702
loop_701:
	edge16n	%i7,	%g6,	%o7
	xor	%g7,	0x12C5,	%o4
	alignaddr	%i0,	%o2,	%l1
loop_702:
	srlx	%g3,	%g4,	%l6
	nop
	setx	0x2242CA9A50EF4037,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9828477EA71FD73A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f18
	edge8l	%l3,	%i2,	%g2
	fcmpne16	%f4,	%f10,	%g1
	edge8	%i3,	%l5,	%l2
	call	loop_703
	call	loop_704
	fpsub32	%f12,	%f16,	%f28
	flushw
loop_703:
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f4
loop_704:
	fmovsg	%fcc1,	%f30,	%f14
	sll	%o0,	%l0,	%i4
	tleu	%xcc,	0x3
	fmovdg	%fcc2,	%f14,	%f28
	movuge	%fcc3,	0x3CC,	%o5
	nop
	fitos	%f5,	%f4
	fstoi	%f4,	%f15
	tgu	%xcc,	0x2
	std	%o0,	[%l7 + 0x68]
	set	0x0, %l5
	stxa	%i5,	[%g0 + %l5] 0x4f
	call	loop_705
	edge8l	%i6,	%l4,	%g5
	call	loop_706
	nop
	fitos	%f29,	%f3
loop_705:
	call	loop_707
	be,a	%xcc,	loop_708
loop_706:
	movleu	%xcc,	%i1,	%o6
	rdpr	%tba,	%o3
loop_707:
	call	loop_709
loop_708:
	addcc	%g6,	0x0C61,	%o7
	call	loop_710
	ta	%xcc,	0x1
loop_709:
	andncc	%i7,	%g7,	%i0
	call	loop_711
loop_710:
	fmovrdlz	%o2,	%f18,	%f20
	wrpr 	%g0, 	0x2, 	%gl
	rdhpr	%htba,	%o4
loop_711:
	call	loop_712
	tgu	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x28A, 	%hsys_tick_cmpr
	siam	0x1
loop_712:
	call	loop_713
	umul	%l3,	0x091D,	%l6
	movgu	%icc,	%g2,	%g1
	bge,pn	%icc,	loop_714
loop_713:
	rdpr	%cwp,	%i3
	fmovrsgez	%l5,	%f23,	%f29
	call	loop_715
loop_714:
	fornot1	%f22,	%f24,	%f18
	call	loop_716
	rdpr	%canrestore,	%i2
loop_715:
	nop
	setx	0xAAE25D61F41B6630,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xBA1ED273FFC8E1DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f20,	%f30
	taddcc	%o0,	0x0B92,	%l0
loop_716:
	subc	%i4,	0x16CC,	%l2
	fmovsne	%icc,	%f4,	%f22
	fcmpes	%fcc1,	%f5,	%f12
	call	loop_717
	call	loop_718
	subcc	%o5,	%i5,	%o1
	call	loop_719
loop_717:
	movl	%fcc3,	%l4,	%i6
loop_718:
	fmovdcs	%xcc,	%f20,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_719:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_720
	fmovscs	%icc,	%f3,	%f4
	movug	%fcc2,	%o3,	%o7
	call	loop_721
loop_720:
	fmovde	%xcc,	%f6,	%f26
	call	loop_722
	nop
	set	0x0E, %o4
	lduh	[%l7 + %o4],	%g6
loop_721:
	be,a,pt	%icc,	loop_723
	edge8l	%g7,	%i0,	%o2
loop_722:
	wr	%l1,	0x19E4,	%y
	fzeros	%f28
loop_723:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f14
	fxtos	%f14,	%f3
	movlg	%fcc3,	%o4,	%g3
	sir	0x08D8
	fmovsa	%fcc2,	%f11,	%f16
	lduw	[%l7 + 0x48],	%g4
	movu	%fcc1,	0x7A5,	%l3
	call	loop_724
	nop
	fitod	%f16,	%f8
	call	loop_725
	call	loop_726
loop_724:
	fmovrdlez	%l6,	%f18,	%f2
	fmovdl	%fcc1,	%f4,	%f24
loop_725:
	call	loop_727
loop_726:
	call	loop_728
	movcs	%xcc,	0x0EC,	%i7
	addccc	%g1,	%i3,	%l5
loop_727:
	call	loop_729
loop_728:
	tne	%icc,	0x5
	set	0x18, %i1
	stda	%g2,	[%l7 + %i1] 0x2f
	membar	#Sync
loop_729:
	nop
	setx	0xAE7A0799,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x37C81C56,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f15,	%f8
	set	0x208, %g4
	stxa	%o0,	[%g0 + %g4] 0x52
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f12
	fnot2	%f30,	%f22
	nop
	set	0x68, %o7
	std	%i2,	[%l7 + %o7]
	fmul8x16al	%f17,	%f2,	%f14
	srax	%i4,	%l2,	%o5
	call	loop_730
	fmovdvs	%icc,	%f16,	%f18
	call	loop_731
	call	loop_732
loop_730:
	fnand	%f18,	%f8,	%f14
	call	loop_733
loop_731:
	ldsb	[%l7 + 0x3D],	%l0
loop_732:
	fmovdcc	%icc,	%f16,	%f14
	call	loop_734
loop_733:
	call	loop_735
	call	loop_736
	fmuld8ulx16	%f6,	%f9,	%f18
loop_734:
	tg	%icc,	0x0
loop_735:
	call	loop_737
loop_736:
	fmovrde	%i5,	%f24,	%f20
	fcmpne16	%f10,	%f16,	%o1
	fble	%fcc0,	loop_738
loop_737:
	fpadd32s	%f4,	%f20,	%f30
	fmovse	%fcc2,	%f19,	%f8
	fmovdleu	%icc,	%f8,	%f6
loop_738:
	nop
	set	0x58, %l3
	stx	%l4,	[%l7 + %l3]
	xorcc	%i6,	%i1,	%o6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%g5
	membar	0x57
	fandnot1	%f28,	%f28,	%f10
	call	loop_739
	nop
	set	0x48, %o5
	lduw	[%l7 + %o5],	%o3
	movcs	%icc,	%o7,	%g6
	tl	%icc,	0x0
loop_739:
	sllx	%i0,	%o2,	%g7
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%l1
	ldsb	[%l7 + 0x2B],	%o4
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc5
	fmovdleu	%xcc,	%f18,	%f12
	fcmpgt32	%f2,	%f28,	%g4
	fbul,a,pt	%fcc3,	loop_740
	siam	0x4
	fmovd	%f18,	%f16
	fmovduge	%fcc3,	%f0,	%f8
loop_740:
	tcc	%icc,	0x0
	fcmple32	%f2,	%f10,	%g3
	smul	%l3,	%l6,	%g1
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	umul	%i3,	0x097D,	%l5
	move	%icc,	0x056,	%i7
	call	loop_741
	call	loop_742
	rd	%softint,	%o0
	call	loop_743
loop_741:
	bge,a	%xcc,	loop_744
loop_742:
	call	loop_745
	subcc	%g2,	%i4,	%l2
loop_743:
	fcmpne16	%f8,	%f12,	%i2
loop_744:
	fmovdge	%fcc1,	%f22,	%f8
loop_745:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 36
!	Type a   	: 30
!	Type x   	: 14
!	Type cti   	: 141
!	Type f   	: 150
!	Type i   	: 129
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
	set	0xB,	%g1
	set	0xE,	%g2
	set	0xE,	%g3
	set	0xB,	%g4
	set	0x1,	%g5
	set	0x4,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xB,	%i1
	set	-0x5,	%i2
	set	-0xF,	%i3
	set	-0x5,	%i4
	set	-0xE,	%i5
	set	-0x6,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x20A4F133,	%l0
	set	0x3491AE9A,	%l1
	set	0x0C2C888C,	%l2
	set	0x3156A2DC,	%l3
	set	0x0B2D9B9E,	%l4
	set	0x3DBC5BE3,	%l5
	set	0x5311456B,	%l6
	!# Output registers
	set	-0x1E75,	%o0
	set	-0x1D5E,	%o1
	set	-0x1C81,	%o2
	set	-0x10F7,	%o3
	set	0x003A,	%o4
	set	0x176E,	%o5
	set	0x1C65,	%o6
	set	0x0F4B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	fmul8ulx16	%f24,	%f30,	%f8
	call	loop_746
	nop
	setx	0xA8746350,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f4
	edge32l	%o5,	%i5,	%l0
	fabsd	%f2,	%f24
loop_746:
	call	loop_747
	fmovsg	%xcc,	%f2,	%f7
	call	loop_748
	movne	%xcc,	%l4,	%o1
loop_747:
	fandnot1	%f18,	%f4,	%f26
	call	loop_749
loop_748:
	movvs	%icc,	%i1,	%o6
	subcc	%i6,	%o3,	%g5
	faligndata	%f6,	%f26,	%f2
loop_749:
	udivcc	%g6,	0x0827,	%i0
	movul	%fcc1,	0x048,	%o2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	addc	%o7,	0x19FB,	%g7
	call	loop_750
	wrpr	%l1,	0x1AB2,	%pil
	call	loop_751
	movle	%fcc0,	0x5E0,	%g4
loop_750:
	nop
	fitos	%f4,	%f12
	fstod	%f12,	%f26
	fandnot2	%f2,	%f14,	%f0
loop_751:
	nop
	set	0x70, %i4
	std	%g2,	[%l7 + %i4]
	fmovrdlez	%o4,	%f20,	%f0
	call	loop_752
	fmovsvc	%icc,	%f19,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_753
loop_752:
	call	loop_754
	array16	%g1,	%i3,	%l5
	smul	%l3,	0x0543,	%o0
loop_753:
	call	loop_755
loop_754:
	movcs	%icc,	%g2,	%i4
	fxor	%f16,	%f2,	%f30
	fpmerge	%f9,	%f17,	%f18
loop_755:
	rdhpr	%hintp,	%i7
	sth	%l2,	[%l7 + 0x4C]
	call	loop_756
	call	loop_757
	tle	%icc,	0x5
	wrpr	%o5,	0x0BAB,	%pil
loop_756:
	nop
	setx	0xB2EA0CF3,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_757:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i2
	lduh	[%l7 + 0x28],	%l0
	nop
	setx	loop_758,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012200001407,	%l0,	%l1
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
	fmovsug	%fcc3,	%f4,	%f23
	fandnot1	%f10,	%f10,	%f18
	nop
	set	0x68, %o6
	stw	%i5,	[%l7 + %o6]
loop_758:
	fpackfix	%f4,	%f23
	fmovdug	%fcc0,	%f2,	%f16
	fmovspos	%icc,	%f26,	%f10
	call	loop_759
	fpadd32s	%f13,	%f11,	%f24
	call	loop_760
	call	loop_761
loop_759:
	ld	[%l7 + 0x08],	%f19
	fmovsne	%icc,	%f26,	%f18
loop_760:
	rdpr	%cleanwin,	%o1
loop_761:
	wr	%i1,	0x169A,	%set_softint
	fnors	%f18,	%f20,	%f31
	fmovdgu	%xcc,	%f12,	%f18
	movul	%fcc3,	%l4,	%i6
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%o6
	fmovdleu	%xcc,	%f12,	%f22
	udiv	%g5,	0x1CAA,	%g6
	fcmple32	%f14,	%f30,	%i0
	nop
	set	0x40, %l2
	std	%f6,	[%l7 + %l2]
	movre	%o3,	0x01B,	%o7
	fmovso	%fcc1,	%f11,	%f0
	movule	%fcc2,	%g7,	%l1
	fabsd	%f4,	%f6
	fornot2	%f30,	%f22,	%f8
	fmovsug	%fcc2,	%f25,	%f13
	call	loop_762
	tcs	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2CA, 	%hsys_tick_cmpr
	membar	0x25
loop_762:
	call	loop_763
	wrpr	%g4,	0x1071,	%pil
	call	loop_764
	xorcc	%l6,	0x0E52,	%g1
loop_763:
	fmovsuge	%fcc2,	%f12,	%f31
	fcmple32	%f22,	%f12,	%i3
loop_764:
	bvc,a	%icc,	loop_765
	call	loop_766
	sdiv	%o4,	0x1CB6,	%l3
	fmovrslz	%o0,	%f24,	%f19
loop_765:
	fmovsule	%fcc0,	%f24,	%f7
loop_766:
	ble,a,pn	%icc,	loop_767
	andn	%g2,	0x1E5A,	%l5
	subc	%i4,	0x09B4,	%i7
	wr	%l2,	0x1098,	%clear_softint
loop_767:
	call	loop_768
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	brnz,pn	%i2,	loop_769
	fmovduge	%fcc1,	%f26,	%f10
loop_768:
	call	loop_770
	call	loop_771
loop_769:
	fornot1	%f4,	%f30,	%f30
	for	%f28,	%f8,	%f4
loop_770:
	movule	%fcc2,	%l0,	%o5
loop_771:
	call	loop_772
	fmovda	%fcc3,	%f16,	%f24
	fmovdg	%icc,	%f16,	%f24
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i5
loop_772:
	nop
	setx	0xA0A240CF7EA28FC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x32A9A9FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f24,	%f22
	membar	0x2A
	call	loop_773
	wr	%i1,	0x0864,	%sys_tick
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o1,	%i6
loop_773:
	edge8l	%o6,	%l4,	%g6
	fsrc2	%f10,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD8F, 	%tick_cmpr
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x18,	 4
	nop
	setx	0x0986,	%l0,	%i0
	udivx	%o7,	%i0,	%l1
	rd	%fprs,	%o2
	ta	%icc,	0x6
	fbe,pn	%fcc0,	loop_774
	nop
	fitod	%f23,	%f26
	call	loop_775
	call	loop_776
loop_774:
	tneg	%xcc,	0x2
	movneg	%xcc,	%g7,	%g4
loop_775:
	call	loop_777
loop_776:
	addc	%g3,	%l6,	%g1
	call	loop_778
	fbuge,a	%fcc1,	loop_779
loop_777:
	faligndata	%f18,	%f8,	%f6
	fcmps	%fcc2,	%f15,	%f18
loop_778:
	fcmple32	%f22,	%f28,	%i3
loop_779:
	tge	%icc,	0x7
	call	loop_780
	movpos	%xcc,	0x1A4,	%o4
	fbul	%fcc3,	loop_781
	movrgez	%l3,	0x1D1,	%o0
loop_780:
	fmovdneg	%xcc,	%f10,	%f16
	rd	%softint,	%g2
loop_781:
	call	loop_782
	tpos	%icc,	0x2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%i7
loop_782:
	fbg,a	%fcc2,	loop_783
	call	loop_784
	fmovrslez	%l5,	%f4,	%f20
	srlx	%i2,	%l2,	%l0
loop_783:
	call	loop_785
loop_784:
	fbge,a,pn	%fcc1,	loop_786
	call	loop_787
	fnot2	%f2,	%f10
loop_785:
	call	loop_788
loop_786:
	fpadd32s	%f27,	%f23,	%f29
loop_787:
	tgu	%icc,	0x7
	bleu,pn	%xcc,	loop_789
loop_788:
	call	loop_790
	fmovrslez	%i5,	%f24,	%f1
	rdpr	%cansave,	%i1
loop_789:
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f29
loop_790:
	bmask	%o5,	%o1,	%o6
	faligndata	%f14,	%f26,	%f26
	fcmps	%fcc2,	%f14,	%f4
	tpos	%xcc,	0x3
	fmovdug	%fcc0,	%f24,	%f24
	mova	%xcc,	%i6,	%g6
	call	loop_791
	nop
	setx	0x822C9C5D36AD46BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xB9055518FEAFEF84,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f26,	%f20
	call	loop_792
	fmovslg	%fcc3,	%f19,	%f18
loop_791:
	nop
	setx	0x1F2F,	%l0,	%o3
	sdiv	%g5,	%o3,	%o7
	movneg	%icc,	0x4F7,	%i0
loop_792:
	call	loop_793
	call	loop_794
	fones	%f5
	bl,a,pt	%icc,	loop_795
loop_793:
	fandnot2	%f24,	%f6,	%f6
loop_794:
	call	loop_796
	or	%l1,	0x1557,	%l4
loop_795:
	nop
	set	0x4F, %g7
	lduba	[%l7 + %g7] 0x04,	%o2
loop_796:
	call	loop_797
	fmovspos	%xcc,	%f16,	%f14
	edge8ln	%g4,	%g7,	%g3
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%g0
loop_797:
	fcmpes	%fcc0,	%f25,	%f29
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i3
	sll	%l6,	%o4,	%l3
	orncc	%g2,	0x11B2,	%i4
	for	%f0,	%f20,	%f26
	fbg,a	%fcc2,	loop_798
	edge16l	%o0,	%l5,	%i7
	wrpr	%l2,	%i2,	%tick
	fmovsvc	%icc,	%f2,	%f10
loop_798:
	ba,a	%icc,	loop_799
	fbne	%fcc3,	loop_800
	and	%i5,	0x1489,	%l0
	ldsb	[%l7 + 0x34],	%i1
loop_799:
	tle	%xcc,	0x4
loop_800:
	call	loop_801
	nop
	setx loop_802, %l0, %l1
	jmpl %l1, %o1
	nop
	setx	0x611EC700,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x473D6160,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f28,	%f16
	set	0x38, %o2
	ldswa	[%l7 + %o2] 0x19,	%o6
loop_801:
	nop
	fitos	%f13,	%f2
loop_802:
	movn	%fcc1,	%o5,	%i6
	subc	%g5,	%g6,	%o3
	call	loop_803
	smul	%i0,	%o7,	%l4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g4
loop_803:
	rdhpr	%hintp,	%g7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_804
	srl	%g3,	%g1,	%i3
	call	loop_805
	array8	%o2,	%o4,	%l3
loop_804:
	call	loop_806
	fpadd16	%f24,	%f8,	%f2
loop_805:
	fzero	%f28
	movn	%xcc,	%l6,	%g2
loop_806:
	call	loop_807
	fbue,pt	%fcc1,	loop_808
	call	loop_809
	add	%o0,	%i4,	%l5
loop_807:
	fcmps	%fcc0,	%f27,	%f23
loop_808:
	rdhpr	%hpstate,	%i7
loop_809:
	edge16ln	%i2,	%l2,	%i5
	fmovsgu	%icc,	%f6,	%f10
	fone	%f24
	andcc	%l0,	0x170F,	%o1
	fpadd32	%f4,	%f10,	%f12
	fnand	%f6,	%f12,	%f16
	fmovdcs	%icc,	%f12,	%f18
	call	loop_810
	call	loop_811
	fmovdo	%fcc1,	%f28,	%f20
	call	loop_812
loop_810:
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f14
loop_811:
	call	loop_813
	call	loop_814
loop_812:
	alignaddr	%o6,	%o5,	%i6
	fcmpd	%fcc0,	%f16,	%f26
loop_813:
	fmul8x16au	%f2,	%f7,	%f16
loop_814:
	fcmple16	%f26,	%f12,	%i1
	nop
	setx	0xA250B1E845E9091B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x3D40B1FB395D306C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f16,	%f8
	fmovdvc	%icc,	%f30,	%f2
	orncc	%g6,	0x0898,	%g5
	movneg	%xcc,	%i0,	%o3
	fsrc2	%f4,	%f16
	fornot2	%f26,	%f18,	%f6
	call	loop_815
	stbar
	wr	%o7,	0x0362,	%y
	fandnot1	%f22,	%f14,	%f10
loop_815:
	call	loop_816
	rd	%tick_cmpr,	%l4
	movneg	%icc,	%g4,	%l1
	call	loop_817
loop_816:
	bshuffle	%f22,	%f18,	%f16
	call	loop_818
	tsubcctv	%g3,	0x0F8C,	%g1
loop_817:
	nop
	fitos	%f5,	%f7
	fstox	%f7,	%f8
	fxtos	%f8,	%f17
	nop
	setx	0xDBA114F119B6AD62,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xB9B56A4A411E54ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f0,	%f10
loop_818:
	movvs	%icc,	0x096,	%g7
	call	loop_819
	tsubcc	%o2,	0x149A,	%i3
	nop
	setx	0x7838CDBB28EDF5D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f30
	tcc	%icc,	0x2
loop_819:
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	nop
	fitos	%f5,	%f14
	fstod	%f14,	%f12
	nop
	fitod	%f8,	%f12
	call	loop_820
	fmovsgu	%icc,	%f6,	%f13
	movleu	%xcc,	0x48E,	%l6
	wr	%g0,	0x57,	%asi
	stxa	%l3,	[%g0 + 0x0] %asi
loop_820:
	call	loop_821
	fpadd16	%f6,	%f28,	%f12
	fmovdpos	%icc,	%f2,	%f16
	fmovdge	%icc,	%f4,	%f16
loop_821:
	call	loop_822
	nop
	fitod	%f18,	%f20
	fmovdug	%fcc3,	%f24,	%f4
	fmovsg	%fcc3,	%f4,	%f18
loop_822:
	fpackfix	%f22,	%f2
	movleu	%icc,	0x528,	%o0
	fmovdvc	%icc,	%f24,	%f20
	call	loop_823
	nop
	setx	0x384197DF3DC53BC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f24
	edge32ln	%i4,	%g2,	%i7
	call	loop_824
loop_823:
	movul	%fcc1,	%l5,	%i2
	call	loop_825
	nop
	setx	0xDDFAC38AC6BAE2AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB2C7A107,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f10,	%f12
loop_824:
	fnegd	%f20,	%f0
	rdpr	%cansave,	%l2
loop_825:
	movo	%fcc2,	%l0,	%o1
	umulcc	%o6,	0x0504,	%i5
	call	loop_826
	ta	%icc,	0x5
	call	loop_827
	tcs	%xcc,	0x3
loop_826:
	umulcc	%o5,	0x1B42,	%i6
	bshuffle	%f28,	%f0,	%f28
loop_827:
	call	loop_828
	rd	%y,	%g6
	call	loop_829
	call	loop_830
loop_828:
	movvs	%xcc,	%g5,	%i1
	call	loop_831
loop_829:
	call	loop_832
loop_830:
	fmovdule	%fcc1,	%f28,	%f22
	xnorcc	%i0,	%o7,	%o3
loop_831:
	fmovse	%fcc0,	%f8,	%f1
loop_832:
	fand	%f6,	%f0,	%f0
	tneg	%xcc,	0x3
	fnegs	%f3,	%f6
	fmovdu	%fcc1,	%f16,	%f10
	fsrc2	%f22,	%f28
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f30
	nop
	setx	0xDB7FDB05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x4EFEA95C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f22,	%f12
	mulx	%l4,	0x14DC,	%l1
	fand	%f18,	%f22,	%f4
	nop
	fitos	%f13,	%f20
	fstoi	%f20,	%f22
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f2
	taddcc	%g3,	%g1,	%g7
	nop
	setx	0xDAE229BDD3F9BD18,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x323E566FD521068D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f10,	%f6
	movo	%fcc3,	%g4,	%i3
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f10
	fxtos	%f10,	%f8
	movvs	%icc,	0x44F,	%o4
	nop
	fitos	%f4,	%f21
	fstox	%f21,	%f6
	fxtos	%f6,	%f0
	movg	%icc,	0x4A0,	%l6
	faligndata	%f2,	%f26,	%f26
	call	loop_833
	call	loop_834
	sllx	%l3,	%o0,	%i4
	fpack16	%f2,	%f13
loop_833:
	call	loop_835
loop_834:
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f10
	fxtod	%f10,	%f14
	fmul8x16	%f2,	%f30,	%f2
	bge,a,pt	%xcc,	loop_836
loop_835:
	call	loop_837
	edge8	%g2,	%i7,	%o2
	fcmpes	%fcc2,	%f15,	%f24
loop_836:
	bcc,a,pn	%xcc,	loop_838
loop_837:
	nop
	setx	0x134B,	%l0,	%l2
	udivcc	%i2,	%l2,	%l5
	call	loop_839
	call	loop_840
loop_838:
	pdist	%f16,	%f20,	%f2
	fexpand	%f28,	%f24
loop_839:
	call	loop_841
loop_840:
	call	loop_842
	call	loop_843
	edge32	%o1,	%o6,	%l0
loop_841:
	tpos	%xcc,	0x1
loop_842:
	fmovsu	%fcc0,	%f26,	%f1
loop_843:
	tgu	%xcc,	0x0
	for	%f4,	%f30,	%f2
	bl	%xcc,	loop_844
	udivx	%i5,	0x1974,	%o5
	tgu	%icc,	0x3
	tl	%xcc,	0x0
loop_844:
	call	loop_845
	call	loop_846
	fmovsle	%xcc,	%f13,	%f17
	nop
	setx	0x330D1674,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xBA087FED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f25,	%f20
loop_845:
	call	loop_847
loop_846:
	fmovsvc	%icc,	%f2,	%f29
	fnot1	%f14,	%f30
	call	loop_848
loop_847:
	fmovsue	%fcc3,	%f15,	%f4
	call	loop_849
	fbule,a,pn	%fcc3,	loop_850
loop_848:
	fcmpgt16	%f24,	%f30,	%g6
	sdivx	%i6,	0x0E6B,	%g5
loop_849:
	call	loop_851
loop_850:
	movule	%fcc1,	0x339,	%i1
	fmuld8ulx16	%f13,	%f19,	%f20
	call	loop_852
loop_851:
	call	loop_853
	call	loop_854
	edge8ln	%o7,	%i0,	%l4
loop_852:
	nop
	set	0x74, %i2
	stwa	%l1,	[%l7 + %i2] 0xe3
	membar	#Sync
loop_853:
	fmovsule	%fcc3,	%f23,	%f3
loop_854:
	call	loop_855
	rdhpr	%hsys_tick_cmpr,	%g3
	movcc	%xcc,	0x267,	%g1
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f28
	fxtos	%f28,	%f21
loop_855:
	call	loop_856
	nop
	setx	0x6679D039DA06A8B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x918587A118111D84,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f20,	%f12
	fmovrsgez	%o3,	%f10,	%f3
	nop
	setx	0x994564D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x5D99A2BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f5,	%f12
loop_856:
	call	loop_857
	fpack16	%f28,	%f7
	fbn	%fcc0,	loop_858
	call	loop_859
loop_857:
	fmovdl	%fcc2,	%f18,	%f4
	wrpr	%g4,	0x0612,	%pil
loop_858:
	nop
	fitos	%f24,	%f27
loop_859:
	fnor	%f6,	%f2,	%f28
	call	loop_860
	call	loop_861
	nop
	set	0x2E, %i7
	ldsb	[%l7 + %i7],	%i3
	call	loop_862
loop_860:
	edge32l	%g7,	%o4,	%l3
loop_861:
	call	loop_863
	movu	%fcc3,	0x3C2,	%o0
loop_862:
	nop
	set	0x64, %i5
	stw	%i4,	[%l7 + %i5]
	fmovsul	%fcc1,	%f11,	%f19
loop_863:
	nop
	wr	%g0,	0x19,	%asi
	stda	%i6,	[%l7 + 0x50] %asi
	call	loop_864
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	mulx	%g2,	0x1FAC,	%o2
	call	loop_865
loop_864:
	rdpr	%tl,	%i2
	nop
	set	0x78, %i3
	std	%l2,	[%l7 + %i3]
	fmovsu	%fcc1,	%f31,	%f11
loop_865:
	tne	%xcc,	0x4
	movneg	%xcc,	0x7B8,	%l5
	fmovdo	%fcc1,	%f2,	%f24
	fandnot2	%f2,	%f0,	%f8
	wr	%o1,	%i7,	%set_softint
	fbe,pn	%fcc3,	loop_866
	call	loop_867
	fbl,a,pt	%fcc1,	loop_868
	call	loop_869
loop_866:
	fmovdn	%fcc2,	%f18,	%f8
loop_867:
	ta	%icc,	0x4
loop_868:
	nop
	setx	0xF6DDB6C0FCEB7320,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x9EA654D04316E8AD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f18,	%f10
loop_869:
	call	loop_870
	call	loop_871
	fpmerge	%f11,	%f16,	%f28
	fbne,pn	%fcc2,	loop_872
loop_870:
	fmovsn	%fcc3,	%f13,	%f18
loop_871:
	call	loop_873
	call	loop_874
loop_872:
	call	loop_875
	movgu	%xcc,	%o6,	%i5
loop_873:
	movu	%fcc2,	%o5,	%l0
loop_874:
	movneg	%xcc,	%g6,	%g5
loop_875:
	call	loop_876
	tvc	%xcc,	0x0
	call	loop_877
	fmovsge	%fcc1,	%f10,	%f17
loop_876:
	fmovdg	%icc,	%f10,	%f14
	sub	%i1,	0x19E4,	%i6
loop_877:
	fmovdleu	%xcc,	%f12,	%f12
	nop
	fitos	%f7,	%f9
	fstoi	%f9,	%f17
	call	loop_878
	ba,a	%icc,	loop_879
	movge	%icc,	0x3E9,	%i0
	tle	%icc,	0x3
loop_878:
	call	loop_880
loop_879:
	call	loop_881
	fsrc1	%f0,	%f20
	fmul8x16al	%f14,	%f8,	%f10
loop_880:
	andn	%l4,	%l1,	%g3
loop_881:
	nop
	set	0x44, %g3
	ldswa	[%l7 + %g3] 0x18,	%g1
	ble,pn	%icc,	loop_882
	fmovsgu	%xcc,	%f22,	%f24
	fbge	%fcc3,	loop_883
	nop
	setx	0x714F3125E3DB135B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x5F89227F4A8134FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f12,	%f28
loop_882:
	xorcc	%o7,	%g4,	%o3
	fmovdn	%xcc,	%f26,	%f6
loop_883:
	fpsub32	%f8,	%f20,	%f26
	bpos,a,pn	%icc,	loop_884
	call	loop_885
	orn	%g7,	%o4,	%l3
	fmovs	%f24,	%f19
loop_884:
	edge8l	%i3,	%o0,	%l6
loop_885:
	call	loop_886
	tsubcctv	%g2,	%i4,	%o2
	call	loop_887
	fbne,a,pn	%fcc2,	loop_888
loop_886:
	fmovrdgz	%l2,	%f28,	%f28
	movug	%fcc0,	%i2,	%o1
loop_887:
	fmovsge	%xcc,	%f30,	%f6
loop_888:
	call	loop_889
	call	loop_890
	subcc	%l5,	%i7,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o6,	%l0
loop_889:
	call	loop_891
loop_890:
	fpadd32s	%f16,	%f24,	%f31
	call	loop_892
	fzeros	%f24
loop_891:
	movleu	%xcc,	%g6,	%o5
	nop
	setx	0x7F8D48A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xD88DC6BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f9,	%f22
loop_892:
	call	loop_893
	call	loop_894
	srlx	%g5,	%i1,	%i0
loop_893:
	nop

loop_894:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 30
!	Type a   	: 25
!	Type x   	: 15
!	Type cti   	: 149
!	Type f   	: 160
!	Type i   	: 121
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
	set	0x7,	%g1
	set	0x8,	%g2
	set	0x9,	%g3
	set	0xD,	%g4
	set	0xF,	%g5
	set	0x9,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x3,	%i1
	set	-0x0,	%i2
	set	-0x3,	%i3
	set	-0x5,	%i4
	set	-0xC,	%i5
	set	-0xD,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x4D0E7561,	%l0
	set	0x6163ACEA,	%l1
	set	0x680E1192,	%l2
	set	0x2A4D99E5,	%l3
	set	0x64C2BA4D,	%l4
	set	0x239E2448,	%l5
	set	0x6FF7CC06,	%l6
	!# Output registers
	set	-0x098C,	%o0
	set	-0x0D40,	%o1
	set	0x1120,	%o2
	set	-0x02BA,	%o3
	set	-0x1EF9,	%o4
	set	-0x04CF,	%o5
	set	0x1E26,	%o6
	set	0x067A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	brlz,a,pt	%i6,	loop_895
	movue	%fcc1,	0x495,	%l1
	call	loop_896
	call	loop_897
loop_895:
	edge32ln	%g3,	%l4,	%o7
	call	loop_898
loop_896:
	fnand	%f26,	%f4,	%f26
loop_897:
	brlz,pn	%g4,	loop_899
	call	loop_900
loop_898:
	nop
	setx	0xF14DB2F5964438E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x932E4201,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f20,	%f26
	rdpr	%tl,	%g1
loop_899:
	call	loop_901
loop_900:
	fmovsne	%xcc,	%f16,	%f8
	call	loop_902
	call	loop_903
loop_901:
	fxors	%f28,	%f14,	%f11
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f4
	fxtod	%f4,	%f6
loop_902:
	be	%icc,	loop_904
loop_903:
	call	loop_905
	nop
	setx	0x3A6B7BCA04614A86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA0DE6B12DA6D7339,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f14
	umulcc	%o3,	%o4,	%l3
loop_904:
	fpsub16	%f30,	%f4,	%f28
loop_905:
	fmovdvs	%icc,	%f6,	%f8
	call	loop_906
	wr	%i3,	0x0349,	%y
	orncc	%g7,	%o0,	%g2
	call	loop_907
loop_906:
	andcc	%l6,	0x07B1,	%i4
	call	loop_908
	fcmped	%fcc3,	%f28,	%f8
loop_907:
	rdhpr	%htba,	%l2
	movvs	%xcc,	%i2,	%o1
loop_908:
	call	loop_909
	fmovsge	%fcc2,	%f9,	%f29
	call	loop_910
	edge8n	%o2,	%i7,	%i5
loop_909:
	sethi	0x0C5A,	%o6
	movleu	%xcc,	%l5,	%l0
loop_910:
	nop
	setx	0xE1C4E3C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fones	%f26
	ta	%icc,	0x1
	ldsw	[%l7 + 0x70],	%g6
	fpmerge	%f23,	%f13,	%f16
	call	loop_911
	wrpr	%g5,	0x11A4,	%tick
	call	loop_912
	call	loop_913
loop_911:
	st	%f7,	[%l7 + 0x58]
	fmovdneg	%icc,	%f20,	%f10
loop_912:
	fmovsne	%xcc,	%f23,	%f26
loop_913:
	wrpr	%i1,	0x00D0,	%tick
	fexpand	%f9,	%f24
	fnegd	%f16,	%f26
	edge16l	%i0,	%o5,	%l1
	fmovdle	%xcc,	%f16,	%f28
	xorcc	%g3,	0x0231,	%i6
	call	loop_914
	fmovsl	%xcc,	%f23,	%f14
	array8	%o7,	%g4,	%l4
	call	loop_915
loop_914:
	call	loop_916
	call	loop_917
	tvc	%icc,	0x3
loop_915:
	call	loop_918
loop_916:
	sethi	0x12D4,	%o3
loop_917:
	tl	%icc,	0x5
	bne,a	%xcc,	loop_919
loop_918:
	call	loop_920
	movge	%xcc,	%g1,	%o4
	movpos	%xcc,	0x04D,	%l3
loop_919:
	rdhpr	%htba,	%g7
loop_920:
	call	loop_921
	add	%o0,	0x1212,	%g2
	call	loop_922
	move	%fcc0,	%i3,	%i4
loop_921:
	nop
	setx	0x2BDBD645,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xF1DFA27D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f25,	%f8
	flushw
loop_922:
	fmuld8ulx16	%f1,	%f17,	%f14
	sll	%l6,	%i2,	%l2
	fpadd32s	%f0,	%f20,	%f15
	call	loop_923
	call	loop_924
	fmovduge	%fcc0,	%f16,	%f30
	call	loop_925
loop_923:
	call	loop_926
loop_924:
	fmovrde	%o2,	%f24,	%f6
	fmovsge	%fcc2,	%f7,	%f21
loop_925:
	call	loop_927
loop_926:
	srl	%i7,	0x1B,	%o1
	call	loop_928
	movrne	%i5,	%o6,	%l5
loop_927:
	array16	%g6,	%g5,	%i1
	be	%icc,	loop_929
loop_928:
	call	loop_930
	call	loop_931
	fmovrsgz	%i0,	%f26,	%f21
loop_929:
	call	loop_932
loop_930:
	movrgz	%l0,	%l1,	%g3
loop_931:
	call	loop_933
	nop
	set	0x40, %g5
	stw	%o5,	[%l7 + %g5]
loop_932:
	fcmpeq16	%f16,	%f14,	%i6
	bneg,pn	%xcc,	loop_934
loop_933:
	movcs	%xcc,	0x7F0,	%o7
	fmovduge	%fcc1,	%f18,	%f26
	fmovdul	%fcc1,	%f26,	%f24
loop_934:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%l4
	fmovscs	%icc,	%f27,	%f17
	call	loop_935
	fmovdpos	%icc,	%f8,	%f4
	nop
	fitod	%f4,	%f2
	fdtoi	%f2,	%f4
	movvs	%icc,	%g4,	%g1
loop_935:
	nop
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd9,	%f16
	call	loop_936
	ldstub	[%l7 + 0x24],	%o4
	call	loop_937
	fmovrdlz	%o3,	%f10,	%f30
loop_936:
	call	loop_938
	tcs	%icc,	0x6
loop_937:
	bg,a	%icc,	loop_939
	call	loop_940
loop_938:
	movpos	%xcc,	0x7C7,	%g7
	call	loop_941
loop_939:
	movrgz	%o0,	0x324,	%g2
loop_940:
	movl	%icc,	%i3,	%i4
	fandnot2s	%f30,	%f30,	%f14
loop_941:
	call	loop_942
	bl,pn	%xcc,	loop_943
	fmovdule	%fcc3,	%f4,	%f14
	nop
	setx	0xB56E00D6C98699D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x9FA3F161C059B18B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f28,	%f14
loop_942:
	fmovdlg	%fcc1,	%f10,	%f30
loop_943:
	wrpr	%l6,	0x0F5B,	%pil
	tcc	%xcc,	0x0
	movuge	%fcc1,	%l3,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2B1, 	%sys_tick_cmpr
	call	loop_944
	fblg,pn	%fcc2,	loop_945
	orcc	%o2,	%i5,	%o1
	sra	%o6,	0x0C,	%l5
loop_944:
	call	loop_946
loop_945:
	andncc	%g5,	%i1,	%i0
	fmovdg	%fcc1,	%f0,	%f24
	movrne	%g6,	%l1,	%g3
loop_946:
	call	loop_947
	fone	%f12
	tvc	%xcc,	0x3
	call	loop_948
loop_947:
	mova	%xcc,	0x4FA,	%o5
	rd	%ccr,	%l0
	brz,pn	%o7,	loop_949
loop_948:
	call	loop_950
	call	loop_951
	fcmpne16	%f24,	%f16,	%l4
loop_949:
	fmovdle	%xcc,	%f24,	%f30
loop_950:
	call	loop_952
loop_951:
	fnot1s	%f4,	%f18
	std	%g4,	[%l7 + 0x50]
	call	loop_953
loop_952:
	sdivx	%i6,	0x1DF1,	%o4
	call	loop_954
	rdhpr	%htba,	%g1
loop_953:
	bl,a,pt	%icc,	loop_955
	membar	0x34
loop_954:
	fble,pt	%fcc0,	loop_956
	sdiv	%g7,	0x12D2,	%o0
loop_955:
	fbne,pn	%fcc3,	loop_957
	tcc	%icc,	0x4
loop_956:
	movn	%xcc,	0x2FD,	%g2
	edge32l	%i3,	%o3,	%i4
loop_957:
	fmovsa	%fcc3,	%f23,	%f30
	tcc	%icc,	0x1
	fmovdu	%fcc3,	%f30,	%f26
	movrne	%l3,	0x3BB,	%l6
	fnot1s	%f13,	%f16
	fpadd16	%f4,	%f6,	%f8
	fmovdu	%fcc3,	%f12,	%f24
	andcc	%l2,	0x047F,	%i2
	fmovscs	%xcc,	%f25,	%f13
	call	loop_958
	fmovsule	%fcc2,	%f3,	%f12
	call	loop_959
	nop
	set	0x50, %l6
	std	%o2,	[%l7 + %l6]
loop_958:
	call	loop_960
	movle	%fcc0,	0x2AB,	%i5
loop_959:
	fnors	%f5,	%f16,	%f30
	udivcc	%o1,	0x1DBF,	%i7
loop_960:
	rdhpr	%hsys_tick_cmpr,	%o6
	fmovsge	%fcc0,	%f17,	%f1
	popc	0x1304,	%g5
	call	loop_961
	smul	%l5,	0x0827,	%i1
	call	loop_962
	call	loop_963
loop_961:
	wr	%i0,	0x01C2,	%clear_softint
	fmovdle	%xcc,	%f14,	%f26
loop_962:
	movuge	%fcc2,	%l1,	%g3
loop_963:
	tn	%icc,	0x4
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f29
	tl	%xcc,	0x2
	array32	%o5,	%l0,	%g6
	call	loop_964
	call	loop_965
	call	loop_966
	call	loop_967
loop_964:
	call	loop_968
loop_965:
	call	loop_969
loop_966:
	fbl	%fcc3,	loop_970
loop_967:
	tleu	%icc,	0x6
loop_968:
	call	loop_971
loop_969:
	fmul8x16al	%f17,	%f28,	%f24
loop_970:
	fornot2s	%f7,	%f11,	%f2
	mulscc	%o7,	0x06B9,	%l4
loop_971:
	fmovrslez	%g4,	%f27,	%f16
	call	loop_972
	fmovdul	%fcc3,	%f30,	%f16
	fcmpeq32	%f30,	%f12,	%o4
	fcmpgt32	%f30,	%f0,	%g1
loop_972:
	fmovsvs	%icc,	%f12,	%f16
	movleu	%xcc,	%g7,	%o0
	call	loop_973
	fmovsule	%fcc1,	%f10,	%f7
	ldsb	[%l7 + 0x62],	%g2
	fmovrdgez	%i6,	%f26,	%f16
loop_973:
	edge32l	%i3,	%i4,	%l3
	call	loop_974
	fmovrse	%o3,	%f27,	%f24
	fmovsg	%icc,	%f8,	%f3
	wrpr	%l2,	%i2,	%pil
loop_974:
	mulscc	%l6,	%i5,	%o2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%o1
	call	loop_975
	call	loop_976
	fmovrslez	%o6,	%f21,	%f18
	movgu	%xcc,	%g5,	%l5
loop_975:
	rdhpr	%hintp,	%i1
loop_976:
	call	loop_977
	call	loop_978
	call	loop_979
	sllx	%i0,	%i7,	%l1
loop_977:
	sllx	%o5,	%l0,	%g3
loop_978:
	srl	%o7,	%g6,	%l4
loop_979:
	rdhpr	%hsys_tick_cmpr,	%o4
	fpackfix	%f10,	%f20
	call	loop_980
	array32	%g1,	%g4,	%o0
	fpadd32	%f12,	%f24,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x506, 	%hsys_tick_cmpr
loop_980:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	call	loop_981
	call	loop_982
	subcc	%i3,	%l3,	%i4
	tneg	%icc,	0x6
loop_981:
	bmask	%o3,	%i2,	%l6
loop_982:
	fcmped	%fcc3,	%f28,	%f6
	sub	%i5,	%o2,	%l2
	bge,pt	%icc,	loop_983
	call	loop_984
	array32	%o6,	%g5,	%l5
	call	loop_985
loop_983:
	call	loop_986
loop_984:
	brnz,a,pt	%i1,	loop_987
	udivx	%i0,	0x126D,	%o1
loop_985:
	fmovdue	%fcc2,	%f8,	%f4
loop_986:
	call	loop_988
loop_987:
	brnz,a	%l1,	loop_989
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f30
	fmovdle	%xcc,	%f8,	%f8
loop_988:
	fmovrsgez	%i7,	%f23,	%f7
loop_989:
	udivx	%l0,	0x0B8A,	%g3
	sir	0x1172
	fmovrdlz	%o5,	%f14,	%f26
	call	loop_990
	movn	%icc,	%g6,	%l4
	membar	0x4A
	sra	%o7,	0x17,	%o4
loop_990:
	call	loop_991
	fmovsule	%fcc3,	%f0,	%f20
	fsrc2	%f22,	%f18
	call	loop_992
loop_991:
	addcc	%g1,	%o0,	%g2
	call	loop_993
	pdist	%f2,	%f10,	%f4
loop_992:
	fmul8ulx16	%f10,	%f16,	%f0
	fornot2	%f0,	%f30,	%f26
loop_993:
	call	loop_994
	call	loop_995
	fnor	%f0,	%f2,	%f8
	rdpr	%cansave,	%i6
loop_994:
	fbuge,a	%fcc3,	loop_996
loop_995:
	andn	%g7,	0x0629,	%g4
	edge16ln	%l3,	%i4,	%i3
	mova	%xcc,	%o3,	%i2
loop_996:
	fnand	%f6,	%f16,	%f4
	nop
	set	0x7C, %l1
	stb	%i5,	[%l7 + %l1]
	fmovdlg	%fcc3,	%f8,	%f26
	call	loop_997
	fornot2	%f24,	%f26,	%f28
	fmovrsne	%l6,	%f10,	%f1
	addcc	%l2,	%o6,	%o2
loop_997:
	call	loop_998
	rd	%asi,	%g5
	wrpr	%l5,	0x059B,	%cwp
	nop
	setx	0x278B32D5615AA839,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x24092C5E2F992302,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f22,	%f6
loop_998:
	fmovrsgz	%i0,	%f10,	%f30
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc4
	call	loop_999
	fmovslg	%fcc1,	%f21,	%f17
	nop
	setx	0x05AB,	%l0,	%o1
	sdivcc	%i1,	%o1,	%i7
	fandnot1s	%f10,	%f12,	%f7
loop_999:
	call	loop_1000
	ldd	[%l7 + 0x68],	%l0
	fmovd	%f22,	%f16
	edge16l	%g3,	%o5,	%g6
loop_1000:
	movrgz	%l0,	0x0DA,	%o7
	call	loop_1001
	subccc	%o4,	%l4,	%o0
	fnors	%f1,	%f28,	%f16
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%g1
loop_1001:
	fnot1	%f2,	%f30
	fsrc1	%f4,	%f20
	call	loop_1002
	call	loop_1003
	rdpr	%cansave,	%i6
	orncc	%g2,	0x1925,	%g4
loop_1002:
	nop
	set	0x12, %i0
	ldub	[%l7 + %i0],	%l3
loop_1003:
	fmovdcs	%icc,	%f10,	%f8
	call	loop_1004
	fabsd	%f2,	%f20
	call	loop_1005
	movule	%fcc0,	0x11E,	%g7
loop_1004:
	nop
	setx	0x7DF03AD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x5B3729BF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f26,	%f3
	fmovrslez	%i3,	%f19,	%f0
loop_1005:
	call	loop_1006
	movuge	%fcc3,	0x5FA,	%o3
	call	loop_1007
	call	loop_1008
loop_1006:
	subccc	%i2,	%i5,	%l6
	call	loop_1009
loop_1007:
	edge8ln	%i4,	%o6,	%o2
loop_1008:
	call	loop_1010
	nop
	setx	0x8605277B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xC05A5D35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f14,	%f30
loop_1009:
	nop
	fitod	%f6,	%f30
	fdtos	%f30,	%f22
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%g5
loop_1010:
	movug	%fcc0,	0x553,	%l2
	nop
	setx	0x8B974A852ADB7F71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x802321C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f22,	%f16
	call	loop_1011
	fmovscs	%xcc,	%f28,	%f30
	movlg	%fcc2,	%l5,	%i0
	fpsub16s	%f31,	%f16,	%f26
loop_1011:
	bvs,a	%xcc,	loop_1012
	be,a,pt	%xcc,	loop_1013
	fxnors	%f0,	%f3,	%f31
	rdhpr	%htba,	%i1
loop_1012:
	fmovrdgez	%o1,	%f2,	%f28
loop_1013:
	fmovrsgz	%i7,	%f4,	%f14
	rd	%asi,	%l1
	edge32	%g3,	%o5,	%l0
	fmovdo	%fcc0,	%f0,	%f2
	tge	%xcc,	0x6
	fandnot2	%f28,	%f4,	%f10
	call	loop_1014
	fmovrdlz	%g6,	%f28,	%f4
	fmovdleu	%icc,	%f14,	%f24
	udivcc	%o4,	0x0555,	%o7
loop_1014:
	smul	%o0,	%g1,	%i6
	stb	%l4,	[%l7 + 0x5D]
	fone	%f12
	call	loop_1015
	fpsub32	%f14,	%f12,	%f26
	edge32	%g4,	%g2,	%l3
	nop
	set	0x0C, %g4
	sth	%g7,	[%l7 + %g4]
loop_1015:
	sll	%o3,	%i3,	%i2
	call	loop_1016
	call	loop_1017
	te	%icc,	0x0
	movule	%fcc1,	%l6,	%i4
loop_1016:
	call	loop_1018
loop_1017:
	stbar
	fpsub16s	%f31,	%f5,	%f25
	bvs,a	%xcc,	loop_1019
loop_1018:
	call	loop_1020
	movre	%i5,	%o2,	%o6
	fcmped	%fcc1,	%f30,	%f24
loop_1019:
	call	loop_1021
loop_1020:
	fone	%f6
	fmovduge	%fcc2,	%f24,	%f0
	call	loop_1022
loop_1021:
	taddcctv	%g5,	0x0B3B,	%l2
	call	loop_1023
	nop
	fitod	%f24,	%f2
loop_1022:
	wr	%i0,	0x01BC,	%softint
	udiv	%l5,	0x139E,	%o1
loop_1023:
	fnot1s	%f15,	%f25
	call	loop_1024
	call	loop_1025
	call	loop_1026
	movue	%fcc0,	0x5CD,	%i7
loop_1024:
	call	loop_1027
loop_1025:
	call	loop_1028
loop_1026:
	fmovscc	%xcc,	%f5,	%f27
	te	%icc,	0x7
loop_1027:
	fpmerge	%f12,	%f14,	%f20
loop_1028:
	sir	0x0AD6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE5E, 	%hsys_tick_cmpr
	call	loop_1029
	edge16	%o5,	%i1,	%g6
	subc	%o4,	%o7,	%o0
	rd	%ccr,	%g1
loop_1029:
	call	loop_1030
	fmul8x16	%f31,	%f14,	%f26
	fcmpd	%fcc0,	%f20,	%f22
	rd	%pc,	%i6
loop_1030:
	fmovdge	%xcc,	%f30,	%f2
	fmovdvc	%xcc,	%f12,	%f8
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l4
	fornot1	%f2,	%f16,	%f8
	edge16l	%g4,	%l0,	%g2
	call	loop_1031
	rdhpr	%hpstate,	%l3
	edge8ln	%o3,	%i3,	%g7
	fmovsvs	%icc,	%f18,	%f31
loop_1031:
	call	loop_1032
	std	%i6,	[%l7 + 0x58]
	udiv	%i4,	0x0C03,	%i2
	fmovsvc	%icc,	%f30,	%f17
loop_1032:
	call	loop_1033
	call	loop_1034
	ldd	[%l7 + 0x60],	%o2
	fmuld8ulx16	%f28,	%f7,	%f16
loop_1033:
	fxors	%f15,	%f7,	%f4
loop_1034:
	call	loop_1035
	movrlez	%o6,	%i5,	%l2
	bpos	%icc,	loop_1036
	fcmpgt32	%f30,	%f30,	%g5
loop_1035:
	edge32	%i0,	%l5,	%o1
	call	loop_1037
loop_1036:
	edge8l	%i7,	%g3,	%l1
	fandnot2	%f24,	%f2,	%f18
	popc	0x11D5,	%i1
loop_1037:
	bne,a	%xcc,	loop_1038
	nop
	fitod	%f22,	%f2
	call	loop_1039
	fmuld8ulx16	%f3,	%f16,	%f20
loop_1038:
	fmovdle	%fcc1,	%f8,	%f24
	ldd	[%l7 + 0x78],	%f14
loop_1039:
	tne	%icc,	0x5
	fmovdvc	%xcc,	%f30,	%f0
	call	loop_1040
	fmovsg	%fcc0,	%f7,	%f21
	nop
	setx	0x2E0897567F07040C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD88F1C197B2E1ECD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f22,	%f0
	call	loop_1041
loop_1040:
	fmul8x16	%f26,	%f6,	%f14
	subcc	%o5,	0x189D,	%g6
	fmovsle	%icc,	%f5,	%f15
loop_1041:
	fpadd16	%f18,	%f14,	%f26
	pdist	%f10,	%f16,	%f28
	fmovdcc	%icc,	%f26,	%f4
	call	loop_1042
	ble,pn	%icc,	loop_1043
	fabss	%f14,	%f24
	fmovs	%f17,	%f4
loop_1042:
	flushw
loop_1043:
	nop
	setx	0x4437385E1DA7D643,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB08A6AD8E7B6D6EC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f30,	%f22
	call	loop_1044
	fandnot2s	%f10,	%f0,	%f25
	movge	%fcc3,	0x18E,	%o4
	fandnot2	%f12,	%f28,	%f10
loop_1044:
	fmovdvs	%icc,	%f14,	%f20
	fmovse	%fcc2,	%f29,	%f25
	fmovsuge	%fcc2,	%f22,	%f0
	movneg	%xcc,	0x378,	%o7
	ba,a	%icc,	loop_1045
	call	loop_1046
	fbne,a	%fcc3,	loop_1047
	fmovsug	%fcc0,	%f17,	%f25
loop_1045:
	call	loop_1048
loop_1046:
	call	loop_1049
loop_1047:
	wrpr	%o0,	%i6,	%pil
	edge8n	%l4,	%g4,	%l0
loop_1048:
	edge32n	%g1,	%g2,	%o3
loop_1049:
	fmuld8ulx16	%f15,	%f23,	%f30
	tn	%icc,	0x3
	fmovdug	%fcc1,	%f6,	%f16
	fnot1	%f16,	%f14
	fmovdvs	%icc,	%f4,	%f26
	fmul8sux16	%f20,	%f8,	%f30
	call	loop_1050
	nop
	setx	0x9662D3AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x04384661,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f6,	%f11
	fmovdleu	%icc,	%f2,	%f14
	fornot1	%f18,	%f28,	%f14
loop_1050:
	nop
	fitod	%f8,	%f16
	fdtoi	%f16,	%f19
	fmovdl	%fcc0,	%f2,	%f28
	call	loop_1051
	fcmpeq32	%f28,	%f30,	%l3
	call	loop_1052
	fnors	%f14,	%f23,	%f18
loop_1051:
	nop

loop_1052:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 24
!	Type a   	: 29
!	Type x   	: 5
!	Type cti   	: 158
!	Type f   	: 159
!	Type i   	: 125
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
	set	0xF,	%g1
	set	0x6,	%g2
	set	0x4,	%g3
	set	0x3,	%g4
	set	0x1,	%g5
	set	0xC,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x3,	%i1
	set	-0xD,	%i2
	set	-0xB,	%i3
	set	-0xE,	%i4
	set	-0x4,	%i5
	set	-0x4,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x4663319C,	%l0
	set	0x17415B4E,	%l1
	set	0x3349A1E3,	%l2
	set	0x1FE6F894,	%l3
	set	0x5B11BE3F,	%l4
	set	0x7E6B3984,	%l5
	set	0x701A30C6,	%l6
	!# Output registers
	set	-0x1A11,	%o0
	set	0x0375,	%o1
	set	-0x05B1,	%o2
	set	-0x16FF,	%o3
	set	-0x15C1,	%o4
	set	0x0CBE,	%o5
	set	-0x0C43,	%o6
	set	0x1D75,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BD5051EEB7E599C)
	INIT_TH_FP_REG(%l7,%f2,0x797AB6DE754D4BCF)
	INIT_TH_FP_REG(%l7,%f4,0xE0122B957032C660)
	INIT_TH_FP_REG(%l7,%f6,0x4035CE93E073C976)
	INIT_TH_FP_REG(%l7,%f8,0x470A2C03F23AF796)
	INIT_TH_FP_REG(%l7,%f10,0xDA2E7038560184FF)
	INIT_TH_FP_REG(%l7,%f12,0x22AEF8C07065D8AF)
	INIT_TH_FP_REG(%l7,%f14,0xFFCEF1C577113E85)
	INIT_TH_FP_REG(%l7,%f16,0x3E061A04E180C886)
	INIT_TH_FP_REG(%l7,%f18,0x0CD41A6BC8AFA446)
	INIT_TH_FP_REG(%l7,%f20,0xA5263D17ED4C924F)
	INIT_TH_FP_REG(%l7,%f22,0x5E4D304AD289E94C)
	INIT_TH_FP_REG(%l7,%f24,0xE422C7C39AE6C666)
	INIT_TH_FP_REG(%l7,%f26,0x555977C786A8C9FC)
	INIT_TH_FP_REG(%l7,%f28,0x69593A4E1160C4AE)
	INIT_TH_FP_REG(%l7,%f30,0x893E8A5A02780198)

	!# Execute Main Diag ..

	fcmpes	%fcc2,	%f2,	%f8
	array32	%i3,	%g7,	%i4
	rdpr	%canrestore,	%l6
	stb	%o2,	[%l7 + 0x7F]
	call	loop_1053
	fxnors	%f8,	%f12,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bgu	%xcc,	loop_1054
loop_1053:
	fpsub16s	%f21,	%f16,	%f21
	fmovdlg	%fcc2,	%f28,	%f16
	fmovsleu	%icc,	%f30,	%f17
loop_1054:
	call	loop_1055
	movn	%icc,	%l2,	%i5
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f20
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f10
loop_1055:
	fpsub32s	%f23,	%f20,	%f15
	st	%f13,	[%l7 + 0x08]
	call	loop_1056
	fcmpne16	%f18,	%f2,	%g5
	rd	%softint,	%l5
	call	loop_1057
loop_1056:
	fmul8ulx16	%f2,	%f4,	%f0
	andn	%o1,	%i7,	%g3
	call	loop_1058
loop_1057:
	fmovsa	%fcc3,	%f20,	%f8
	brlz,a	%i0,	loop_1059
	call	loop_1060
loop_1058:
	te	%xcc,	0x1
	tsubcctv	%l1,	0x1EF1,	%i1
loop_1059:
	nop
	set	0x0A, %o7
	stba	%g6,	[%l7 + %o7] 0xe2
	membar	#Sync
loop_1060:
	call	loop_1061
	call	loop_1062
	tle	%xcc,	0x2
	fmul8x16au	%f23,	%f27,	%f30
loop_1061:
	movg	%fcc3,	%o5,	%o7
loop_1062:
	call	loop_1063
	rdpr	%cwp,	%o4
	fbo,a,pn	%fcc0,	loop_1064
	add	%o0,	%i6,	%l4
loop_1063:
	movle	%fcc3,	%l0,	%g1
	edge8l	%g4,	%g2,	%l3
loop_1064:
	call	loop_1065
	call	loop_1066
	ldx	[%l7 + 0x28],	%o3
	call	loop_1067
loop_1065:
	movul	%fcc2,	0x066,	%g7
loop_1066:
	rdhpr	%ver,	%i4
	brgez,a	%i3,	loop_1068
loop_1067:
	array32	%o2,	%o6,	%i2
	movrne	%l2,	0x1E1,	%i5
	fmovse	%xcc,	%f27,	%f10
loop_1068:
	fpack32	%f2,	%f4,	%f30
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tge	%xcc,	0x5
	call	loop_1069
	fmovsvs	%xcc,	%f16,	%f15
	lduh	[%l7 + 0x70],	%g5
	movu	%fcc2,	0x068,	%l5
loop_1069:
	nop
	set	0x10, %o4
	flush	%l7 + %o4
	smulcc	%o1,	%l6,	%i7
	movug	%fcc1,	%i0,	%g3
	call	loop_1070
	andn	%l1,	%i1,	%o5
	call	loop_1071
	fmovsule	%fcc0,	%f14,	%f12
loop_1070:
	array32	%o7,	%g6,	%o0
	call	loop_1072
loop_1071:
	nop
	setx	0x1BE2,	%l0,	%i6
	udiv	%o4,	%i6,	%l0
	fpsub32s	%f20,	%f18,	%f4
	lduw	[%l7 + 0x44],	%g1
loop_1072:
	rdhpr	%hpstate,	%g4
	tcc	%xcc,	0x3
	fmovdcs	%icc,	%f12,	%f8
	rdhpr	%ver,	%l4
	fmovsvc	%icc,	%f27,	%f18
	fmovdg	%fcc1,	%f10,	%f16
	movcc	%xcc,	0x55C,	%l3
	wr	%o3,	0x0B4B,	%y
	movrgez	%g2,	0x27D,	%i4
	fbue,a,pn	%fcc0,	loop_1073
	umulcc	%g7,	%o2,	%o6
	call	loop_1074
	tpos	%icc,	0x1
loop_1073:
	edge32	%i2,	%i3,	%l2
	fbule	%fcc2,	loop_1075
loop_1074:
	ble,pt	%icc,	loop_1076
	fmovsu	%fcc0,	%f0,	%f15
	fmovrdgz	%g5,	%f10,	%f10
loop_1075:
	move	%icc,	0x0E6,	%i5
loop_1076:
	fone	%f20
	call	loop_1077
	srax	%o1,	%l6,	%l5
	fnot2	%f14,	%f4
	sethi	0x1B53,	%i7
loop_1077:
	movvc	%icc,	0x09F,	%g3
	movlg	%fcc1,	%i0,	%i1
	call	loop_1078
	siam	0x0
	alignaddrl	%l1,	%o5,	%o7
	fandnot2	%f2,	%f0,	%f0
loop_1078:
	nop
	setx	0x0E09,	%l0,	%o4
	udiv	%o0,	%o4,	%g6
	fpsub32	%f2,	%f4,	%f2
	fmovsg	%fcc3,	%f5,	%f11
	fabsd	%f26,	%f2
	stbar
	call	loop_1079
	fnegd	%f24,	%f6
	fmovsneg	%icc,	%f4,	%f1
	fcmpne32	%f2,	%f6,	%l0
loop_1079:
	movl	%fcc1,	0x482,	%i6
	fone	%f30
	call	loop_1080
	edge16n	%g1,	%g4,	%l3
	fmul8x16	%f17,	%f10,	%f30
	nop
	setx	0xF507F4F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xB611BCD5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f16,	%f28
loop_1080:
	rd	%asi,	%l4
	call	loop_1081
	sllx	%g2,	%o3,	%i4
	call	loop_1082
	fcmple32	%f22,	%f28,	%o2
loop_1081:
	fxnors	%f1,	%f19,	%f7
	call	loop_1083
loop_1082:
	movrlez	%g7,	0x21B,	%i2
	call	loop_1084
	fxnor	%f20,	%f24,	%f30
loop_1083:
	movcs	%xcc,	%o6,	%i3
	call	loop_1085
loop_1084:
	call	loop_1086
	ble	%icc,	loop_1087
	bl	%icc,	loop_1088
loop_1085:
	fmovrdgz	%l2,	%f6,	%f10
loop_1086:
	call	loop_1089
loop_1087:
	mova	%fcc2,	%i5,	%g5
loop_1088:
	edge32	%o1,	%l5,	%i7
	ta	%icc,	0x4
loop_1089:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l6
	call	loop_1090
	nop
	setx	0xBE2975DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x336A63D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f12,	%f20
	fmovsg	%xcc,	%f26,	%f5
	edge8ln	%i0,	%i1,	%l1
loop_1090:
	fnot1	%f14,	%f2
	mova	%fcc0,	0x7A3,	%g3
	call	loop_1091
	call	loop_1092
	rdpr	%cansave,	%o7
	nop
	fitos	%f4,	%f24
	fstoi	%f24,	%f23
loop_1091:
	call	loop_1093
loop_1092:
	movge	%xcc,	0x71F,	%o0
	flushw
	tsubcc	%o4,	0x11F6,	%g6
loop_1093:
	bcs,a,pt	%xcc,	loop_1094
	flushw
	nop
	setx	0xD67ED0F5735A543B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x648213574B63D959,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f26,	%f20
	fmovsvc	%xcc,	%f26,	%f25
loop_1094:
	rdhpr	%htba,	%l0
	movle	%xcc,	%o5,	%g1
	sllx	%i6,	%g4,	%l3
	call	loop_1095
	tge	%xcc,	0x1
	call	loop_1096
	fmovrdlz	%g2,	%f30,	%f28
loop_1095:
	edge16ln	%o3,	%i4,	%l4
	orn	%o2,	%i2,	%o6
loop_1096:
	call	loop_1097
	movcc	%icc,	0x634,	%i3
	call	loop_1098
	bge,pt	%icc,	loop_1099
loop_1097:
	movle	%fcc3,	%l2,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1098:
	array32	%g7,	%i7,	%l5
loop_1099:
	movug	%fcc1,	%l6,	%i0
	call	loop_1100
	fmovda	%fcc1,	%f26,	%f8
	wr	%l1,	%i1,	%y
	call	loop_1101
loop_1100:
	andcc	%g3,	0x0977,	%o7
	fnands	%f4,	%f17,	%f9
	srlx	%o0,	0x14,	%o4
loop_1101:
	edge8	%l0,	%g6,	%o5
	fpsub32	%f22,	%f10,	%f30
	fmovrdgz	%i6,	%f16,	%f14
	bneg,a	%icc,	loop_1102
	tg	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 2
loop_1102:
	fsrc2	%f26,	%f16
	call	loop_1103
	udivx	%g4,	0x12DF,	%l3
	fzero	%f12
	movn	%xcc,	%o3,	%g2
loop_1103:
	move	%fcc0,	%i4,	%o2
	movuge	%fcc3,	%i2,	%l4
	rdpr	%cleanwin,	%o6
	call	loop_1104
	movrgez	%l2,	%i5,	%i3
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f30
	andcc	%g5,	0x1C51,	%g7
loop_1104:
	call	loop_1105
	fcmple16	%f0,	%f22,	%i7
	st	%f23,	[%l7 + 0x40]
	fxor	%f2,	%f2,	%f20
loop_1105:
	call	loop_1106
	for	%f28,	%f6,	%f22
	subcc	%l5,	0x1B3B,	%l6
	call	loop_1107
loop_1106:
	fnot1	%f2,	%f28
	set	0x74, %o5
	ldsha	[%l7 + %o5] 0x81,	%i0
loop_1107:
	call	loop_1108
	call	loop_1109
	call	loop_1110
	fmul8ulx16	%f28,	%f6,	%f6
loop_1108:
	rd	%asi,	%o1
loop_1109:
	bmask	%l1,	%g3,	%o7
loop_1110:
	fcmpgt16	%f8,	%f8,	%o0
	fmovde	%fcc0,	%f4,	%f16
	movre	%i1,	0x02E,	%l0
	nop
	setx	0x45C8AEE6D0E65D2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xD45CACA11EEF13F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f24,	%f24
	fnegs	%f8,	%f16
	fmovdge	%fcc2,	%f26,	%f2
	pdist	%f22,	%f18,	%f14
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f27
	brnz	%o4,	loop_1111
	call	loop_1112
	call	loop_1113
	sllx	%g6,	0x08,	%o5
loop_1111:
	fmovsu	%fcc1,	%f1,	%f17
loop_1112:
	orn	%i6,	%g4,	%l3
loop_1113:
	fnot2s	%f3,	%f6
	call	loop_1114
	fmovde	%xcc,	%f28,	%f4
	call	loop_1115
	mova	%xcc,	0x253,	%g1
loop_1114:
	edge8l	%o3,	%g2,	%o2
	and	%i4,	%l4,	%o6
loop_1115:
	sir	0x0DB0
	movul	%fcc2,	0x6B6,	%l2
	call	loop_1116
	rdpr	%cleanwin,	%i2
	movrlez	%i3,	%i5,	%g7
	edge32n	%i7,	%l5,	%g5
loop_1116:
	call	loop_1117
	call	loop_1118
	popc	%i0,	%l6
	rdpr	%gl,	%l1
loop_1117:
	call	loop_1119
loop_1118:
	fba,pt	%fcc0,	loop_1120
	add	%g3,	0x1483,	%o7
	call	loop_1121
loop_1119:
	fmovscc	%xcc,	%f13,	%f30
loop_1120:
	nop
	set	0x18, %g1
	sta	%f8,	[%l7 + %g1] 0x88
loop_1121:
	udivx	%o1,	0x1BA8,	%i1
	fmovrslz	%o0,	%f10,	%f17
	call	loop_1122
	call	loop_1123
	call	loop_1124
	subc	%o4,	%g6,	%l0
loop_1122:
	nop
	set	0x48, %l3
	flush	%l7 + %l3
loop_1123:
	nop
	fitod	%f12,	%f6
loop_1124:
	edge32n	%i6,	%g4,	%o5
	tcs	%icc,	0x3
	nop
	setx	0x8603BCE8633EE10F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x003505DAE00698B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f30,	%f20
	nop
	setx	loop_1125,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%l3,	%g1,	%o3
	fmovdge	%fcc2,	%f14,	%f12
	nop
	setx	0x50CFAB485DD85F11,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f24
loop_1125:
	fmovsug	%fcc3,	%f7,	%f6
	set	0x7C, %g2
	sta	%f31,	[%l7 + %g2] 0x04
	stbar
	fmovsvs	%xcc,	%f23,	%f9
	bvs	%xcc,	loop_1126
	call	loop_1127
	movug	%fcc2,	%g2,	%i4
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f14
	fxtod	%f14,	%f0
loop_1126:
	call	loop_1128
loop_1127:
	fmovdlg	%fcc3,	%f26,	%f10
	call	loop_1129
	array8	%l4,	%o6,	%l2
loop_1128:
	call	loop_1130
	ba,a	%icc,	loop_1131
loop_1129:
	call	loop_1132
	fbne	%fcc0,	loop_1133
loop_1130:
	edge32ln	%o2,	%i2,	%i3
loop_1131:
	call	loop_1134
loop_1132:
	rd	%pc,	%g7
loop_1133:
	call	loop_1135
	call	loop_1136
loop_1134:
	call	loop_1137
	nop
	setx	0x033F39F4FE60F5F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x0E37F72C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f22,	%f20
loop_1135:
	fsrc1s	%f21,	%f9
loop_1136:
	faligndata	%f12,	%f28,	%f6
loop_1137:
	call	loop_1138
	prefetch	[%l7 + 0x5C],	 2
	tcs	%icc,	0x2
	movneg	%xcc,	%i7,	%i5
loop_1138:
	fmovrsgz	%l5,	%f16,	%f3
	call	loop_1139
	fcmpne16	%f24,	%f26,	%i0
	call	loop_1140
	fcmped	%fcc2,	%f14,	%f30
loop_1139:
	fpackfix	%f10,	%f4
	movcc	%xcc,	0x65D,	%g5
loop_1140:
	movul	%fcc3,	0x2D6,	%l1
	fpsub32s	%f16,	%f26,	%f1
	xnor	%l6,	0x1D2C,	%g3
	fpsub32s	%f7,	%f18,	%f1
	call	loop_1141
	call	loop_1142
	rd	%pc,	%o1
	call	loop_1143
loop_1141:
	call	loop_1144
loop_1142:
	xnorcc	%i1,	0x009D,	%o7
	wr	%g0,	0x18,	%asi
	sta	%f22,	[%l7 + 0x50] %asi
loop_1143:
	rdhpr	%hsys_tick_cmpr,	%o0
loop_1144:
	membar	0x4D
	nop
	setx	0xCC56BCF158A14C37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f10
	call	loop_1145
	call	loop_1146
	tpos	%xcc,	0x5
	fsrc2	%f22,	%f8
loop_1145:
	call	loop_1147
loop_1146:
	call	loop_1148
	call	loop_1149
	wrpr 	%g0, 	0x0, 	%gl
loop_1147:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i6,	%g6
loop_1148:
	call	loop_1150
loop_1149:
	movlg	%fcc2,	%g4,	%o5
	movleu	%icc,	0x409,	%l3
	smulcc	%o3,	0x1478,	%g1
loop_1150:
	fba,pn	%fcc3,	loop_1151
	movo	%fcc2,	0x173,	%i4
	nop
	setx	0x6EC7F51E9CAAE94A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x15EE4036861AB254,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f14,	%f18
	xorcc	%g2,	0x1C4F,	%l4
loop_1151:
	edge8n	%o6,	%l2,	%o2
	edge8n	%i2,	%g7,	%i3
	fmovdvs	%xcc,	%f24,	%f20
	bgu,pt	%icc,	loop_1152
	fcmpd	%fcc3,	%f6,	%f26
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f22
	fxtos	%f22,	%f11
	fnot1	%f4,	%f14
loop_1152:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fnot2	%f12,	%f16
	sdiv	%i0,	0x0B92,	%g5
	fmovsgu	%icc,	%f14,	%f11
	wr	%g0,	0x81,	%asi
	stha	%l5,	[%l7 + 0x42] %asi
	call	loop_1153
	call	loop_1154
	call	loop_1155
	fble,a	%fcc1,	loop_1156
loop_1153:
	call	loop_1157
loop_1154:
	call	loop_1158
loop_1155:
	smul	%l1,	%g3,	%l6
loop_1156:
	call	loop_1159
loop_1157:
	fmovsle	%fcc2,	%f24,	%f0
loop_1158:
	nop
	fitos	%f7,	%f13
	fmovda	%icc,	%f6,	%f20
loop_1159:
	rdpr	%wstate,	%o1
	fmovdule	%fcc0,	%f30,	%f24
	fmovrdgz	%i1,	%f16,	%f8
	set	0x28, %o6
	stda	%o0,	[%l7 + %o6] 0xea
	membar	#Sync
	sth	%o4,	[%l7 + 0x72]
	fmovdneg	%icc,	%f8,	%f2
	udivx	%l0,	0x012F,	%i6
	taddcc	%o7,	0x0266,	%g4
	bcs	%icc,	loop_1160
	edge8l	%o5,	%l3,	%o3
	rdpr	%wstate,	%g1
	nop
	setx	0x147514AF27062272,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xFBE24DE40FA9A229,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f0,	%f4
loop_1160:
	fornot1s	%f14,	%f7,	%f23
	movvc	%xcc,	0x2A7,	%i4
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f2
	fandnot2	%f24,	%f24,	%f8
	fbne,pt	%fcc2,	loop_1161
	call	loop_1162
	movvc	%icc,	%g2,	%g6
	edge8l	%o6,	%l2,	%o2
loop_1161:
	fmuld8ulx16	%f2,	%f3,	%f18
loop_1162:
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f26
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x1C] %asi
	add	%l4,	0x0AF1,	%i2
	fmul8ulx16	%f14,	%f18,	%f30
	movne	%fcc2,	0x233,	%g7
	movlg	%fcc1,	0x563,	%i3
	call	loop_1163
	call	loop_1164
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdleu	%icc,	%f26,	%f30
loop_1163:
	nop
	set	0x14, %l2
	lduw	[%l7 + %l2],	%i5
loop_1164:
	xor	%i0,	%i7,	%l5
	fand	%f16,	%f24,	%f6
	fmovrslz	%g5,	%f20,	%f25
	prefetch	[%l7 + 0x10],	 1
	fmovduge	%fcc3,	%f30,	%f20
	nop
	setx	0xF5B09E311A17DF8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
	nop
	setx	0xE4517FD63DBAF8CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x77233AEA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f20,	%f2
	flush	%l7 + 0x2C
	call	loop_1165
	rd	%asi,	%g3
	nop
	fitos	%f17,	%f13
	nop
	fitos	%f6,	%f25
	fstoi	%f25,	%f23
loop_1165:
	fmovrslez	%l6,	%f15,	%f24
	fmovrde	%o1,	%f2,	%f12
	fpadd32s	%f19,	%f19,	%f24
	fmul8x16al	%f10,	%f11,	%f30
	bpos,a,pn	%xcc,	loop_1166
	edge32	%l1,	%o0,	%i1
	fmovrse	%o4,	%f30,	%f1
	movl	%fcc3,	0x55A,	%l0
loop_1166:
	call	loop_1167
	fmovsule	%fcc2,	%f24,	%f29
	call	loop_1168
	ldstub	[%l7 + 0x5D],	%i6
loop_1167:
	fmovsue	%fcc0,	%f7,	%f2
	fabss	%f5,	%f6
loop_1168:
	call	loop_1169
	tpos	%icc,	0x0
	fcmped	%fcc1,	%f14,	%f12
	fblg,pn	%fcc1,	loop_1170
loop_1169:
	ta	%xcc,	0x3
	call	loop_1171
	movle	%fcc0,	0x526,	%g4
loop_1170:
	call	loop_1172
	wr	%o5,	0x00C0,	%set_softint
loop_1171:
	fmovsg	%fcc2,	%f23,	%f29
	call	loop_1173
loop_1172:
	addc	%o7,	%l3,	%g1
	call	loop_1174
	movn	%fcc1,	0x1B3,	%i4
loop_1173:
	bn,a	%xcc,	loop_1175
	movo	%fcc1,	%g2,	%o3
loop_1174:
	move	%xcc,	%o6,	%g6
	nop
	setx	0xBA2D827E82F84742,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x7AEB969A9B2431AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f10,	%f8
loop_1175:
	fabsd	%f6,	%f6
	call	loop_1176
	array16	%l2,	%l4,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF6F, 	%hsys_tick_cmpr
	call	loop_1177
loop_1176:
	fbge,a,pn	%fcc1,	loop_1178
	call	loop_1179
	fcmpeq32	%f14,	%f28,	%i3
loop_1177:
	fmovrsne	%i5,	%f12,	%f1
loop_1178:
	fsrc1s	%f26,	%f6
loop_1179:
	nop
	set	0x6C, %l0
	ldsha	[%l7 + %l0] 0x10,	%i7
	orn	%l5,	%i0,	%g3
	sdivx	%g5,	0x179E,	%l6
	call	loop_1180
	fmovsa	%icc,	%f4,	%f8
	fbne,a	%fcc0,	loop_1181
	movule	%fcc0,	%l1,	%o0
loop_1180:
	nop
	setx	0x0124,	%l0,	%i1
	udiv	%o1,	%i1,	%o4
	tle	%icc,	0x5
loop_1181:
	movre	%i6,	0x2FB,	%g4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	mulscc	%l0,	0x00E4,	%o5
	call	loop_1182
	fxnors	%f18,	%f19,	%f22
	edge8n	%o7,	%g1,	%l3
	nop
	setx	0xCB8163DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f0
loop_1182:
	fmovsg	%fcc0,	%f15,	%f29
	call	loop_1183
	call	loop_1184
	call	loop_1185
	tle	%icc,	0x5
loop_1183:
	fnot1s	%f27,	%f15
loop_1184:
	edge8l	%g2,	%i4,	%o3
loop_1185:
	call	loop_1186
	fpsub32s	%f30,	%f4,	%f10
	fcmple16	%f28,	%f20,	%o6
	call	loop_1187
loop_1186:
	wr	%g6,	0x12DE,	%pic
	addccc	%l2,	%i2,	%g7
	tpos	%icc,	0x6
loop_1187:
	mova	%fcc0,	0x260,	%o2
	set	0x1B, %g7
	lduba	[%l7 + %g7] 0x10,	%l4
	call	loop_1188
	edge16ln	%i5,	%i3,	%i7
	fbo,pn	%fcc2,	loop_1189
	wrpr	%l5,	%g3,	%cwp
loop_1188:
	call	loop_1190
	fandnot2	%f4,	%f30,	%f12
loop_1189:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%g5
loop_1190:
	nop
	setx	0x1D9358DF18E0D368,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB98A3F82,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f30,	%f22
	fzeros	%f7
	fand	%f28,	%f6,	%f2
	call	loop_1191
	fbg,a,pn	%fcc2,	loop_1192
	nop
	setx	0xD91B5878,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x76F5082D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f1,	%f2
loop_1191:
	nop

loop_1192:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 33
!	Type a   	: 29
!	Type x   	: 15
!	Type cti   	: 140
!	Type f   	: 142
!	Type i   	: 141
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xFDDE176E
.word 0xC92E76CA
.word 0x8B7B4FEC
.word 0x7208A9AA
.word 0x91BB7A70
.word 0x835A6542
.word 0x6D82891C
.word 0xCB300621
.word 0x79A15D4E
.word 0x88C6D5D6
.word 0xF50F6299
.word 0x3B9A93ED
.word 0xF3147163
.word 0xE3E86294
.word 0x0DBBA07D
.word 0xACF04ABD
.word 0x1DB9C35D
.word 0x3FCC821E
.word 0xA2AFABAB
.word 0x81E63715
.word 0x4F3CDFD3
.word 0x0E91232D
.word 0xF84D7528
.word 0x989618F6
.word 0x9EC3F1AC
.word 0xAB529CFF
.word 0x4CA462D9
.word 0xA27A14A2
.word 0x83E52ABA
.word 0x7A4B8A43
.word 0xEB1A0D13
.word 0x82943BCC
.word 0xF48A3156
.word 0xDB9E02C3
.word 0x519C4BFF
.word 0x47C4977C
.word 0xDAA4D505
.word 0x112FD178
.word 0x3D16C911
.word 0x47F6E8C4
.word 0xA070944E
.word 0xA3277361
.word 0x466E71E7
.word 0x53FF875F
.word 0x132866F3
.word 0xFAB62E1D
.word 0x2B32AE7D
.word 0x8AD6629F
.word 0xE9075FA0
.word 0xB453CE6A
.word 0x5B7C01AC
.word 0xF0FE5AD4
.word 0xCCA8DDEB
.word 0xEB779C10
.word 0x0BD1184C
.word 0x2C7CE848
.word 0x35DEBA37
.word 0x8F4EE672
.word 0xDBCA963C
.word 0x0C02A93C
.word 0x61DCD1CB
.word 0xBA53E74E
.word 0x5440F12B
.word 0x55D32364
.end
