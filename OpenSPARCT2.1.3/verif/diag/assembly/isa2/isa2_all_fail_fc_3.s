/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa2_all_fail_fc_3.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ /import/n2-aus-dump1/somePerson/dump/24x7/spc_basic_isa2.pl FOCUS_SEED=739887052"
.ident "BY somePerson ON Wed Aug  6 14:28:00 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa2_all_fail_fc_3.s,v 1.3 2007/07/05 21:58:50 drp Exp $"
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

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0x3,	%g2
	set	0x6,	%g3
	set	0x8,	%g4
	set	0x9,	%g5
	set	0x4,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x2,	%i1
	set	-0x4,	%i2
	set	-0xB,	%i3
	set	-0x1,	%i4
	set	-0x5,	%i5
	set	-0x5,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x1AB35219,	%l0
	set	0x31852F49,	%l1
	set	0x7A6C23B9,	%l2
	set	0x2FE9B7FD,	%l3
	set	0x212B24A9,	%l4
	set	0x6B399C0F,	%l5
	set	0x48C956FC,	%l6
	!# Output registers
	set	0x040A,	%o0
	set	-0x069B,	%o1
	set	0x16DB,	%o2
	set	-0x14FE,	%o3
	set	0x05EF,	%o4
	set	0x1796,	%o5
	set	-0x196D,	%o6
	set	0x0E3B,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	te	%xcc,	0x1
	fbn	%fcc1,	loop_1
loop_1:
	bpos,a,pt	%xcc,	loop_2
loop_2:
	bvs,a,pn	%icc,	loop_3
loop_3:
	smulcc	%o3,	%l3,	%o5
	st	%f2,	[%l7 + 0x58]
	taddcc	%o7,	%i5,	%l2
	bvc,a	loop_4
loop_4:
	fmovd	%f14,	%f10
	xnorcc	%g1,	%l6,	%g3
	movre	%o0,	%i7,	%i4
	movrgez	%g2,	0x3BC,	%i0
	mulscc	%i6,	0x15BA,	%i2
	fbule	%fcc1,	loop_5
loop_5:
	fbe	%fcc0,	loop_6
loop_6:
	ble,a,pt	%xcc,	loop_7
loop_7:
	ld	[%l7 + 0x28],	%f4
	addccc	%g5,	0x1DDD,	%i3
	brnz	%g7,	loop_8
loop_8:
	brgz,a	%i1,	loop_9
loop_9:
	ldsw	[%l7 + 0x20],	%o2
	bvc,a,pt	%icc,	loop_10
loop_10:
	ldsw	[%l7 + 0x2C],	%l4
	ldub	[%l7 + 0x29],	%l1
	bvc,a,pn	%icc,	loop_11
loop_11:
	bne	loop_12
loop_12:
	ldsw	[%l7 + 0x44],	%o4
	fmovsne	%xcc,	%f6,	%f3
	ldx	[%l7 + 0x78],	%g6
	bl	%icc,	loop_13
loop_13:
	bleu,a	%xcc,	loop_14
loop_14:
	edge8l	%o1,	%l5,	%l0
	ldsb	[%l7 + 0x21],	%o6
	andncc	%g4,	%l3,	%o5
	umulcc	%o7,	0x0B3A,	%o3
	bvs,a	loop_15
loop_15:
	st	%f6,	[%l7 + 0x38]
	stx	%l2,	[%l7 + 0x70]
	fbne,a	%fcc2,	loop_16
loop_16:
	bcs,a,pt	%xcc,	loop_17
loop_17:
	udivx	%g1,	0x1519,	%i5
	brlez,a	%g3,	loop_18
loop_18:
	ldx	[%l7 + 0x68],	%l6
	fbuge	%fcc3,	loop_19
loop_19:
	subc	%i7,	%i4,	%o0
	movvs	%xcc,	%g2,	%i0
	sdivcc	%i6,	0x0919,	%i2
	ldx	[%l7 + 0x28],	%g5
	ld	[%l7 + 0x34],	%f15
	xnor	%i3,	0x0B45,	%i1
	fexpand	%f8,	%f4
	movcc	%xcc,	%g7,	%o2
	bvs,a,pt	%xcc,	loop_20
loop_20:
	st	%f9,	[%l7 + 0x1C]
	ld	[%l7 + 0x4C],	%f13
	orcc	%l4,	0x0AF3,	%l1
	stw	%o4,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x74],	%o1
	bpos	%xcc,	loop_21
loop_21:
	smulcc	%g6,	%l5,	%o6
	tneg	%xcc,	0x3
	te	%icc,	0x2
	addc	%l0,	0x0249,	%g4
	udivx	%o5,	0x0408,	%l3
	st	%f15,	[%l7 + 0x28]
	fmovdg	%icc,	%f9,	%f2
	fbe	%fcc3,	loop_22
loop_22:
	umul	%o7,	%l2,	%o3
	movg	%xcc,	%i5,	%g1
	lduh	[%l7 + 0x66],	%l6
	fpsub32s	%f8,	%f13,	%f12
	fbne	%fcc3,	loop_23
loop_23:
	ldsb	[%l7 + 0x75],	%g3
	lduh	[%l7 + 0x60],	%i4
	lduw	[%l7 + 0x48],	%i7
	and	%g2,	%i0,	%i6
	stx	%o0,	[%l7 + 0x68]
	fbe	%fcc0,	loop_24
loop_24:
	stx	%g5,	[%l7 + 0x30]
	alignaddr	%i2,	%i1,	%i3
	fba	%fcc1,	loop_25
loop_25:
	ldsw	[%l7 + 0x10],	%o2
	array8	%g7,	%l4,	%o4
	ldx	[%l7 + 0x68],	%o1
	bge,a,pn	%icc,	loop_26
loop_26:
	tsubcctv	%g6,	%l5,	%l1
	bvc	loop_27
loop_27:
	fmovsl	%icc,	%f4,	%f11
	brgez	%l0,	loop_28
loop_28:
	mulscc	%g4,	0x0A9E,	%o5
	alignaddr	%o6,	%o7,	%l2
	ldsh	[%l7 + 0x4A],	%l3
	movne	%xcc,	%i5,	%o3
	srlx	%l6,	0x18,	%g3
	movrgz	%g1,	%i7,	%g2
	fbo	%fcc1,	loop_29
loop_29:
	fblg	%fcc2,	loop_30
loop_30:
	st	%f8,	[%l7 + 0x3C]
	ldsh	[%l7 + 0x10],	%i4
	ldsw	[%l7 + 0x28],	%i0
	srax	%i6,	0x07,	%o0
	sdiv	%i2,	0x1EBE,	%i1
	ldsh	[%l7 + 0x34],	%g5
	and	%o2,	0x1F95,	%g7
	smulcc	%i3,	%o4,	%o1
	fblg,a	%fcc0,	loop_31
loop_31:
	edge8	%l4,	%g6,	%l5
	lduw	[%l7 + 0x24],	%l1
	ldd	[%l7 + 0x58],	%f0
	brgez,a	%g4,	loop_32
loop_32:
	fcmpeq16	%f6,	%f8,	%l0
	ld	[%l7 + 0x0C],	%f13
	orcc	%o6,	%o5,	%l2
	fsrc2s	%f0,	%f1
	tvc	%xcc,	0x0
	nop
	setx loop_33, %l0, %l1
	jmpl %l1, %o7
loop_33:
	tleu	%icc,	0x3
	brlez	%l3,	loop_34
loop_34:
	fbne,a	%fcc3,	loop_35
loop_35:
	st	%f5,	[%l7 + 0x34]
	ldd	[%l7 + 0x10],	%f4
	stb	%o3,	[%l7 + 0x4F]
	ldx	[%l7 + 0x08],	%l6
	ldsw	[%l7 + 0x44],	%g3
	std	%f0,	[%l7 + 0x40]
	ldx	[%l7 + 0x68],	%i5
	ldub	[%l7 + 0x17],	%g1
	movcc	%icc,	%g2,	%i4
	tl	%xcc,	0x6
	stw	%i0,	[%l7 + 0x5C]
	movleu	%icc,	%i6,	%o0
	bneg,pt	%icc,	loop_36
loop_36:
	movgu	%icc,	%i7,	%i1
	fbu,a	%fcc2,	loop_37
loop_37:
	orn	%i2,	0x1B74,	%o2
	ldsb	[%l7 + 0x29],	%g7
	bgu	%icc,	loop_38
loop_38:
	movg	%icc,	%i3,	%o4
	fornot1s	%f15,	%f7,	%f1
	tcs	%icc,	0x2
	nop
	setx loop_39, %l0, %l1
	jmpl %l1, %g5
loop_39:
	ble,pn	%icc,	loop_40
loop_40:
	brnz,a	%l4,	loop_41
loop_41:
	or	%o1,	0x09D0,	%g6
	sth	%l5,	[%l7 + 0x0A]
	andcc	%g4,	%l0,	%l1
	fbe	%fcc2,	loop_42
loop_42:
	movvc	%xcc,	%o6,	%l2
	ldub	[%l7 + 0x71],	%o7
	addc	%l3,	0x0590,	%o5
	fmovsne	%icc,	%f6,	%f3
	stw	%o3,	[%l7 + 0x38]
	sth	%g3,	[%l7 + 0x6C]
	fbule,a	%fcc1,	loop_43
loop_43:
	fbg	%fcc3,	loop_44
loop_44:
	ta	%xcc,	0x5
	movvs	%icc,	%l6,	%i5
	st	%f15,	[%l7 + 0x2C]
	array32	%g2,	%i4,	%g1
	movcc	%icc,	%i0,	%o0
	ldd	[%l7 + 0x20],	%f8
	fmovda	%xcc,	%f8,	%f6
	brgez,a	%i7,	loop_45
loop_45:
	edge16l	%i1,	%i6,	%i2
	bvc,a,pn	%xcc,	loop_46
loop_46:
	fmovrdne	%g7,	%f2,	%f2
	brgz,a	%i3,	loop_47
loop_47:
	fmovse	%icc,	%f3,	%f13
	add	%o2,	%g5,	%o4
	ldd	[%l7 + 0x38],	%f14
	tvs	%icc,	0x3
	fbne	%fcc1,	loop_48
loop_48:
	fbo,a	%fcc3,	loop_49
loop_49:
	ld	[%l7 + 0x08],	%f14
	movpos	%icc,	%l4,	%o1
	bg,a	loop_50
loop_50:
	ldx	[%l7 + 0x18],	%l5
	bcs,pt	%icc,	loop_51
loop_51:
	tcc	%icc,	0x5
	add	%g6,	0x1464,	%g4
	stx	%l0,	[%l7 + 0x28]
	ldsb	[%l7 + 0x0D],	%l1
	subcc	%o6,	0x1B88,	%l2
	srl	%o7,	%o5,	%l3
	ldx	[%l7 + 0x28],	%o3
	fba	%fcc1,	loop_52
loop_52:
	fpadd16	%f4,	%f4,	%f12
	edge32l	%g3,	%i5,	%l6
	alignaddr	%g2,	%g1,	%i0
	fpsub16s	%f2,	%f13,	%f9
	ldsw	[%l7 + 0x58],	%i4
	edge16	%i7,	%o0,	%i6
	bl	%xcc,	loop_53
loop_53:
	ld	[%l7 + 0x60],	%f8
	ldsw	[%l7 + 0x5C],	%i1
	alignaddrl	%i2,	%g7,	%o2
	addcc	%i3,	0x0E59,	%g5
	fmovdneg	%xcc,	%f6,	%f15
	array8	%o4,	%l4,	%o1
	be	loop_54
loop_54:
	fpsub32	%f6,	%f4,	%f4
	be,a,pt	%icc,	loop_55
loop_55:
	sdivcc	%l5,	0x0B92,	%g6
	st	%f5,	[%l7 + 0x58]
	bneg,a	loop_56
loop_56:
	brgz,a	%l0,	loop_57
loop_57:
	te	%xcc,	0x3
	stw	%g4,	[%l7 + 0x34]
	bn,a	%icc,	loop_58
loop_58:
	stw	%l1,	[%l7 + 0x50]
	ldx	[%l7 + 0x10],	%o6
	fbuge	%fcc0,	loop_59
loop_59:
	brgz,a	%o7,	loop_60
loop_60:
	movl	%xcc,	%l2,	%o5
	fmovrse	%l3,	%f6,	%f0
	addcc	%g3,	%i5,	%l6
	brgez	%g2,	loop_61
loop_61:
	bge	loop_62
loop_62:
	ldub	[%l7 + 0x60],	%g1
	sth	%i0,	[%l7 + 0x7E]
	fmovspos	%xcc,	%f0,	%f12
	ldsw	[%l7 + 0x28],	%o3
	stb	%i7,	[%l7 + 0x6E]
	fmovrsne	%o0,	%f7,	%f11
	lduw	[%l7 + 0x0C],	%i6
	umul	%i4,	%i1,	%i2
	fmovscc	%icc,	%f5,	%f4
	ld	[%l7 + 0x78],	%f6
	movre	%g7,	0x294,	%i3
	subcc	%g5,	0x13B6,	%o4
	te	%icc,	0x6
	addccc	%l4,	%o1,	%o2
	brlz	%l5,	loop_63
loop_63:
	bne,pt	%icc,	loop_64
loop_64:
	ld	[%l7 + 0x3C],	%f8
	ldub	[%l7 + 0x71],	%l0
	bcs,pt	%xcc,	loop_65
loop_65:
	tn	%icc,	0x4
	ldx	[%l7 + 0x20],	%g6
	tsubcctv	%l1,	0x179D,	%o6
	bg	%xcc,	loop_66
loop_66:
	fbue,a	%fcc0,	loop_67
loop_67:
	and	%g4,	0x0696,	%l2
	srl	%o7,	%l3,	%g3
	fbuge	%fcc2,	loop_68
loop_68:
	xnor	%o5,	0x0038,	%l6
	lduw	[%l7 + 0x28],	%i5
	ldub	[%l7 + 0x50],	%g1
	ldsh	[%l7 + 0x30],	%g2
	ldd	[%l7 + 0x28],	%f12
	movcc	%xcc,	%o3,	%i7
	fbule	%fcc1,	loop_69
loop_69:
	brlz,a	%i0,	loop_70
loop_70:
	fbuge	%fcc0,	loop_71
loop_71:
	udivx	%o0,	0x0393,	%i6
	orncc	%i4,	%i2,	%g7
	orcc	%i3,	0x1879,	%i1
	fmovrslez	%o4,	%f4,	%f2
	fbuge,a	%fcc3,	loop_72
loop_72:
	edge32ln	%g5,	%o1,	%l4
	fzeros	%f10
	brlz	%l5,	loop_73
loop_73:
	fbe,a	%fcc0,	loop_74
loop_74:
	lduw	[%l7 + 0x60],	%o2
	bgu	%icc,	loop_75
loop_75:
	fbu,a	%fcc1,	loop_76
loop_76:
	fbl,a	%fcc0,	loop_77
loop_77:
	ba	loop_78
loop_78:
	lduh	[%l7 + 0x08],	%l0
	movl	%icc,	%l1,	%g6
	bleu,a,pt	%xcc,	loop_79
loop_79:
	ldsw	[%l7 + 0x68],	%o6
	stx	%g4,	[%l7 + 0x40]
	fbo	%fcc3,	loop_80
loop_80:
	movcc	%xcc,	%o7,	%l3
	fabsd	%f0,	%f14
	st	%f8,	[%l7 + 0x20]
	tvc	%icc,	0x0
	ldsh	[%l7 + 0x2E],	%g3
	fble,a	%fcc2,	loop_81
loop_81:
	st	%f10,	[%l7 + 0x70]
	andncc	%o5,	%l6,	%i5
	sth	%g1,	[%l7 + 0x36]
	edge32l	%l2,	%o3,	%i7
	tcc	%icc,	0x3
	sllx	%i0,	%g2,	%o0
	tpos	%icc,	0x7
	fbe,a	%fcc3,	loop_82
loop_82:
	ta	%icc,	0x7
	stx	%i4,	[%l7 + 0x58]
	bvs,a	%xcc,	loop_83
loop_83:
	brz,a	%i2,	loop_84
loop_84:
	smul	%g7,	0x1B19,	%i3
	array16	%i6,	%o4,	%i1
	bvc,pt	%icc,	loop_85
loop_85:
	st	%f10,	[%l7 + 0x78]
	nop
	setx loop_86, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_86:
	umulcc	%o1,	%g5,	%l5
	st	%f2,	[%l7 + 0x1C]
	brlez,a	%l4,	loop_87
loop_87:
	bneg,pt	%icc,	loop_88
loop_88:
	brlz,a	%l0,	loop_89
loop_89:
	movvs	%icc,	%o2,	%l1
	bge,a	loop_90
loop_90:
	ldsb	[%l7 + 0x08],	%g6
	lduw	[%l7 + 0x38],	%g4
	nop
	setx loop_91, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_91:
	smul	%o6,	%o7,	%g3
	fnot2s	%f2,	%f6
	ldsw	[%l7 + 0x44],	%l3
	ldsh	[%l7 + 0x54],	%o5
	sth	%i5,	[%l7 + 0x7A]
	movleu	%xcc,	%l6,	%g1
	fbne	%fcc2,	loop_92
loop_92:
	fcmpgt32	%f12,	%f10,	%l2
	edge8n	%o3,	%i7,	%i0
	fbu,a	%fcc3,	loop_93
loop_93:
	udivcc	%o0,	0x136D,	%i4
	movrgz	%g2,	%i2,	%g7
	ldx	[%l7 + 0x50],	%i3
	fble	%fcc2,	loop_94
loop_94:
	fbge	%fcc2,	loop_95
loop_95:
	tneg	%icc,	0x5
	fble	%fcc2,	loop_96
loop_96:
	ldsh	[%l7 + 0x5C],	%i6
	brgz	%i1,	loop_97
loop_97:
	stb	%o4,	[%l7 + 0x16]
	fcmps	%fcc0,	%f2,	%f15
	sth	%o1,	[%l7 + 0x12]
	nop
	setx loop_98, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_98:
	fcmpne32	%f2,	%f10,	%g5
	ldsb	[%l7 + 0x49],	%l4
	bge,a,pt	%icc,	loop_99
loop_99:
	bn,a,pn	%icc,	loop_100
loop_100:
	fbn	%fcc3,	loop_101
loop_101:
	fbuge,a	%fcc2,	loop_102
loop_102:
	nop
	setx loop_103, %l0, %l1
	jmpl %l1, %l5
loop_103:
	fble	%fcc2,	loop_104
loop_104:
	fbne,a	%fcc1,	loop_105
loop_105:
	brgz	%o2,	loop_106
loop_106:
	brgz	%l1,	loop_107
loop_107:
	fpadd32s	%f13,	%f3,	%f12
	st	%f3,	[%l7 + 0x70]
	stb	%g6,	[%l7 + 0x2D]
	sllx	%g4,	%o6,	%o7
	stw	%l0,	[%l7 + 0x14]
	bge,a,pn	%icc,	loop_108
loop_108:
	subccc	%g3,	%o5,	%l3
	movl	%xcc,	%i5,	%g1
	bvs,a,pt	%icc,	loop_109
loop_109:
	ld	[%l7 + 0x4C],	%f0
	fmovse	%icc,	%f4,	%f0
	ld	[%l7 + 0x18],	%f15
	brnz	%l6,	loop_110
loop_110:
	fmul8ulx16	%f6,	%f6,	%f2
	fbe,a	%fcc1,	loop_111
loop_111:
	ldsh	[%l7 + 0x4A],	%o3
	ldx	[%l7 + 0x50],	%i7
	nop
	setx loop_112, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_112:
	tvc	%xcc,	0x1
	movrgz	%i0,	0x0F7,	%o0
	nop
	setx loop_113, %l0, %l1
	jmpl %l1, %l2
loop_113:
	st	%f8,	[%l7 + 0x28]
	andcc	%g2,	0x0E6A,	%i4
	bcc,a	loop_114
loop_114:
	bcc,a	loop_115
loop_115:
	lduh	[%l7 + 0x5A],	%g7
	array8	%i3,	%i6,	%i1
	ldsh	[%l7 + 0x34],	%o4
	edge16l	%i2,	%g5,	%o1
	movcc	%xcc,	%l4,	%o2
	lduw	[%l7 + 0x2C],	%l5
	udivx	%l1,	0x0FCF,	%g4
	std	%f14,	[%l7 + 0x60]
	stw	%g6,	[%l7 + 0x4C]
	popc	0x0F22,	%o6
	stx	%l0,	[%l7 + 0x68]
	std	%f12,	[%l7 + 0x70]
	sdivcc	%g3,	0x0F2A,	%o7
	fnot2	%f6,	%f2
	ld	[%l7 + 0x64],	%f1
	st	%f7,	[%l7 + 0x30]
	st	%f3,	[%l7 + 0x70]
	nop
	setx loop_116, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_116:
	edge32l	%l3,	%i5,	%o5
	stw	%g1,	[%l7 + 0x50]
	movrlez	%l6,	0x1C4,	%o3
	fmovrdgez	%i7,	%f4,	%f0
	sth	%o0,	[%l7 + 0x74]
	lduw	[%l7 + 0x38],	%i0
	ld	[%l7 + 0x60],	%f12
	sdivcc	%g2,	0x0F29,	%l2
	orn	%g7,	%i3,	%i4
	fmovscs	%xcc,	%f0,	%f1
	lduh	[%l7 + 0x3C],	%i1
	ldsw	[%l7 + 0x5C],	%i6
	xnor	%i2,	%g5,	%o4
	taddcctv	%o1,	%o2,	%l4
	bcs,a,pn	%xcc,	loop_117
loop_117:
	brlz	%l5,	loop_118
loop_118:
	andn	%l1,	%g4,	%g6
	mova	%icc,	%l0,	%o6
	fba	%fcc0,	loop_119
loop_119:
	addc	%g3,	%o7,	%i5
	srlx	%o5,	0x10,	%l3
	udiv	%l6,	0x119D,	%g1
	fnegd	%f6,	%f10
	ldx	[%l7 + 0x18],	%o3
	ldub	[%l7 + 0x68],	%i7
	tle	%xcc,	0x4
	ldx	[%l7 + 0x10],	%i0
	ldsb	[%l7 + 0x51],	%o0
	movn	%icc,	%l2,	%g7
	tle	%icc,	0x5
	fnot1	%f0,	%f8
	faligndata	%f10,	%f14,	%f8
	fpsub32s	%f6,	%f9,	%f0
	ldsb	[%l7 + 0x43],	%i3
	te	%icc,	0x7
	fnegs	%f14,	%f6
	te	%icc,	0x1
	movrlez	%g2,	%i4,	%i6
	fbge,a	%fcc1,	loop_120
loop_120:
	popc	0x0314,	%i2
	ldsh	[%l7 + 0x44],	%g5
	fmovsneg	%icc,	%f9,	%f14
	tpos	%icc,	0x5
	stb	%i1,	[%l7 + 0x43]
	xor	%o4,	%o2,	%o1
	ldx	[%l7 + 0x70],	%l4
	fbue,a	%fcc2,	loop_121
loop_121:
	movrlez	%l5,	%g4,	%l1
	bcc	%icc,	loop_122
loop_122:
	fbuge	%fcc2,	loop_123
loop_123:
	fornot1	%f6,	%f2,	%f14
	edge16n	%l0,	%o6,	%g6
	fbug	%fcc0,	loop_124
loop_124:
	brlez,a	%g3,	loop_125
loop_125:
	movg	%icc,	%o7,	%o5
	stw	%i5,	[%l7 + 0x10]
	nop
	setx loop_126, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_126:
	st	%f0,	[%l7 + 0x20]
	ba	loop_127
loop_127:
	movneg	%xcc,	%l3,	%l6
	lduh	[%l7 + 0x5C],	%o3
	st	%f2,	[%l7 + 0x2C]
	movrlz	%g1,	%i7,	%i0
	bge,a,pn	%icc,	loop_128
loop_128:
	ldd	[%l7 + 0x60],	%f14
	ble,a	%icc,	loop_129
loop_129:
	brz	%l2,	loop_130
loop_130:
	subcc	%g7,	0x0871,	%o0
	fba	%fcc2,	loop_131
loop_131:
	ldub	[%l7 + 0x62],	%g2
	fbuge,a	%fcc1,	loop_132
loop_132:
	tl	%xcc,	0x7
	bl,pt	%icc,	loop_133
loop_133:
	st	%f1,	[%l7 + 0x3C]
	movre	%i4,	0x141,	%i6
	fbuge,a	%fcc1,	loop_134
loop_134:
	nop
	setx loop_135, %l0, %l1
	jmpl %l1, %i2
loop_135:
	ldsb	[%l7 + 0x67],	%g5
	tvs	%icc,	0x6
	umulcc	%i3,	%o4,	%o2
	andn	%i1,	0x1CB4,	%o1
	movle	%icc,	%l4,	%g4
	fandnot2s	%f14,	%f1,	%f11
	tsubcctv	%l1,	0x1B44,	%l0
	bgu,a	loop_136
loop_136:
	ldsh	[%l7 + 0x3E],	%l5
	fbg	%fcc0,	loop_137
loop_137:
	brlz,a	%o6,	loop_138
loop_138:
	fmovde	%xcc,	%f1,	%f9
	fmovsne	%icc,	%f15,	%f7
	lduw	[%l7 + 0x64],	%g3
	fpmerge	%f11,	%f7,	%f8
	srl	%o7,	0x0F,	%g6
	fbue	%fcc2,	loop_139
loop_139:
	ldsw	[%l7 + 0x50],	%i5
	fbn,a	%fcc0,	loop_140
loop_140:
	sdivcc	%o5,	0x1D78,	%l6
	movneg	%icc,	%o3,	%l3
	fbne,a	%fcc0,	loop_141
loop_141:
	ldx	[%l7 + 0x70],	%i7
	fba,a	%fcc2,	loop_142
loop_142:
	movneg	%icc,	%i0,	%g1
	fmovda	%icc,	%f12,	%f3
	movvc	%xcc,	%l2,	%o0
	udiv	%g7,	0x0FCF,	%g2
	fands	%f5,	%f1,	%f0
	array32	%i4,	%i2,	%i6
	lduh	[%l7 + 0x0C],	%i3
	sth	%g5,	[%l7 + 0x7C]
	sra	%o4,	%i1,	%o2
	fbn,a	%fcc1,	loop_143
loop_143:
	mova	%xcc,	%l4,	%o1
	std	%f6,	[%l7 + 0x58]
	fmovdcc	%xcc,	%f4,	%f10
	ldsh	[%l7 + 0x7E],	%l1
	and	%g4,	0x0438,	%l5
	fandnot2s	%f4,	%f15,	%f12
	lduw	[%l7 + 0x40],	%l0
	brnz,a	%o6,	loop_144
loop_144:
	ldsw	[%l7 + 0x6C],	%g3
	ba,pt	%xcc,	loop_145
loop_145:
	fnands	%f6,	%f4,	%f3
	movle	%icc,	%g6,	%i5
	ldsb	[%l7 + 0x6F],	%o5
	lduw	[%l7 + 0x64],	%o7
	ldd	[%l7 + 0x48],	%f6
	bcc,pt	%icc,	loop_146
loop_146:
	st	%f3,	[%l7 + 0x58]
	edge8	%o3,	%l3,	%i7
	bgu,pn	%xcc,	loop_147
loop_147:
	stb	%i0,	[%l7 + 0x2D]
	ta	%xcc,	0x0
	ba,a,pt	%xcc,	loop_148
loop_148:
	stb	%g1,	[%l7 + 0x5C]
	addccc	%l6,	%o0,	%g7
	stx	%l2,	[%l7 + 0x18]
	edge8n	%g2,	%i2,	%i4
	std	%f8,	[%l7 + 0x48]
	array8	%i6,	%i3,	%g5
	movrgz	%o4,	0x2F4,	%o2
	fbl,a	%fcc1,	loop_149
loop_149:
	bneg	loop_150
loop_150:
	movcc	%icc,	%l4,	%i1
	bvs,a,pn	%xcc,	loop_151
loop_151:
	edge32	%o1,	%g4,	%l5
	fnegd	%f12,	%f8
	movge	%xcc,	%l0,	%l1
	tcs	%icc,	0x2
	edge32n	%o6,	%g6,	%i5
	bvs,pn	%icc,	loop_152
loop_152:
	bgu,a	%xcc,	loop_153
loop_153:
	movg	%icc,	%o5,	%o7
	fbge	%fcc1,	loop_154
loop_154:
	edge32l	%o3,	%l3,	%g3
	bne,pt	%icc,	loop_155
loop_155:
	array32	%i0,	%g1,	%i7
	lduh	[%l7 + 0x60],	%l6
	udivx	%o0,	0x07B0,	%l2
	fmovs	%f4,	%f6
	edge16ln	%g7,	%g2,	%i2
	pdist	%f12,	%f14,	%f12
	stw	%i4,	[%l7 + 0x50]
	mulx	%i6,	0x013E,	%g5
	nop
	setx loop_156, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_156:
	fmovdge	%icc,	%f0,	%f8
	addc	%i3,	0x13B1,	%o4
	popc	%l4,	%i1
	stx	%o2,	[%l7 + 0x68]
	sth	%o1,	[%l7 + 0x7A]
	ldx	[%l7 + 0x48],	%g4
	tcs	%icc,	0x3
	lduh	[%l7 + 0x20],	%l0
	ldsh	[%l7 + 0x24],	%l5
	movpos	%icc,	%l1,	%o6
	edge16n	%g6,	%o5,	%i5
	ldsh	[%l7 + 0x5E],	%o7
	ldd	[%l7 + 0x40],	%f8
	fmul8ulx16	%f10,	%f0,	%f4
	subcc	%l3,	%o3,	%i0
	bgu	%xcc,	loop_157
loop_157:
	edge32ln	%g1,	%i7,	%g3
	ld	[%l7 + 0x50],	%f12
	bg,a	%icc,	loop_158
loop_158:
	fmovd	%f6,	%f10
	brgz	%l6,	loop_159
loop_159:
	pdist	%f4,	%f6,	%f4
	lduw	[%l7 + 0x18],	%o0
	brgez,a	%l2,	loop_160
loop_160:
	lduw	[%l7 + 0x68],	%g2
	tg	%icc,	0x5
	sll	%i2,	0x1D,	%g7
	sub	%i6,	%i4,	%g5
	fbug,a	%fcc0,	loop_161
loop_161:
	fxor	%f4,	%f8,	%f10
	sdivcc	%o4,	0x1CF1,	%l4
	ldsw	[%l7 + 0x30],	%i3
	call	loop_162
loop_162:
	ldd	[%l7 + 0x50],	%f14
	tvc	%xcc,	0x6
	bvc,a	loop_163
loop_163:
	lduh	[%l7 + 0x3C],	%i1
	ba	%icc,	loop_164
loop_164:
	movrgz	%o1,	%o2,	%g4
	st	%f13,	[%l7 + 0x54]
	std	%f0,	[%l7 + 0x38]
	bg	%icc,	loop_165
loop_165:
	edge8n	%l0,	%l5,	%o6
	ldsw	[%l7 + 0x74],	%l1
	ba,a	%xcc,	loop_166
loop_166:
	movn	%icc,	%o5,	%g6
	array32	%o7,	%i5,	%o3
	bcs,a	loop_167
loop_167:
	fmovse	%xcc,	%f12,	%f4
	bgu,pn	%icc,	loop_168
loop_168:
	movge	%icc,	%l3,	%i0
	ldsb	[%l7 + 0x7A],	%i7
	bcc,pn	%xcc,	loop_169
loop_169:
	fnot1	%f0,	%f6
	ldub	[%l7 + 0x4B],	%g1
	udivx	%g3,	0x09EA,	%o0
	srlx	%l2,	0x18,	%l6
	fbl,a	%fcc2,	loop_170
loop_170:
	fbu,a	%fcc0,	loop_171
loop_171:
	fexpand	%f15,	%f12
	fmovsg	%xcc,	%f8,	%f11
	brlez	%g2,	loop_172
loop_172:
	fba,a	%fcc1,	loop_173
loop_173:
	tn	%icc,	0x5
	ldd	[%l7 + 0x40],	%f10
	bvs,pt	%xcc,	loop_174
loop_174:
	fbn,a	%fcc2,	loop_175
loop_175:
	movre	%g7,	0x0A4,	%i2
	fbe	%fcc1,	loop_176
loop_176:
	brgz	%i6,	loop_177
loop_177:
	and	%i4,	%o4,	%l4
	brnz,a	%i3,	loop_178
loop_178:
	fmul8x16	%f4,	%f10,	%f10
	stw	%i1,	[%l7 + 0x6C]
	brlz	%o1,	loop_179
loop_179:
	movl	%icc,	%o2,	%g4
	std	%f6,	[%l7 + 0x28]
	fpmerge	%f9,	%f3,	%f4
	be,a	loop_180
loop_180:
	fblg	%fcc2,	loop_181
loop_181:
	move	%icc,	%g5,	%l5
	fnands	%f1,	%f5,	%f6
	st	%f6,	[%l7 + 0x54]
	mulx	%l0,	0x0219,	%o6
	taddcc	%l1,	0x187D,	%g6
	fbul	%fcc1,	loop_182
loop_182:
	stx	%o7,	[%l7 + 0x30]
	taddcctv	%o5,	%i5,	%l3
	edge32n	%o3,	%i7,	%g1
	sll	%g3,	%o0,	%l2
	bgu,a	%xcc,	loop_183
loop_183:
	stx	%i0,	[%l7 + 0x60]
	stx	%g2,	[%l7 + 0x38]
	smul	%l6,	0x0D83,	%i2
	fcmple16	%f8,	%f8,	%g7
	fmovsle	%icc,	%f11,	%f14
	edge16l	%i4,	%o4,	%l4
	addcc	%i6,	%i1,	%i3
	mulscc	%o1,	%g4,	%o2
	fnot1	%f14,	%f10
	stx	%g5,	[%l7 + 0x20]
	mova	%icc,	%l0,	%l5
	bvc,a,pn	%xcc,	loop_184
loop_184:
	edge16l	%o6,	%g6,	%l1
	orncc	%o5,	0x04CE,	%i5
	bvc,a,pt	%icc,	loop_185
loop_185:
	stw	%o7,	[%l7 + 0x0C]
	st	%f6,	[%l7 + 0x18]
	tneg	%icc,	0x2
	lduw	[%l7 + 0x40],	%o3
	tg	%xcc,	0x5
	stw	%i7,	[%l7 + 0x1C]
	fble,a	%fcc2,	loop_186
loop_186:
	brnz	%l3,	loop_187
loop_187:
	fbug	%fcc0,	loop_188
loop_188:
	fbo,a	%fcc2,	loop_189
loop_189:
	fbue,a	%fcc0,	loop_190
loop_190:
	umul	%g1,	%g3,	%l2
	tl	%xcc,	0x6
	edge8n	%o0,	%g2,	%l6
	st	%f8,	[%l7 + 0x58]
	std	%f10,	[%l7 + 0x40]
	fba	%fcc1,	loop_191
loop_191:
	ldsh	[%l7 + 0x6E],	%i0
	ldd	[%l7 + 0x08],	%f6
	ld	[%l7 + 0x74],	%f10
	ld	[%l7 + 0x0C],	%f5
	addcc	%i2,	%i4,	%o4
	fxor	%f10,	%f0,	%f4
	and	%l4,	%i6,	%i1
	fbul	%fcc3,	loop_192
loop_192:
	srl	%i3,	0x1B,	%o1
	ldsw	[%l7 + 0x3C],	%g7
	ld	[%l7 + 0x68],	%f5
	bvc,a,pt	%icc,	loop_193
loop_193:
	or	%o2,	%g4,	%l0
	fbuge,a	%fcc0,	loop_194
loop_194:
	brnz,a	%g5,	loop_195
loop_195:
	edge8l	%o6,	%g6,	%l1
	ba,a,pn	%xcc,	loop_196
loop_196:
	lduh	[%l7 + 0x76],	%l5
	taddcc	%o5,	0x034E,	%o7
	fbue,a	%fcc2,	loop_197
loop_197:
	fnands	%f10,	%f2,	%f3
	fbge,a	%fcc1,	loop_198
loop_198:
	ldub	[%l7 + 0x58],	%o3
	array8	%i7,	%l3,	%g1
	movleu	%icc,	%g3,	%i5
	fnot1s	%f9,	%f5
	fmovsge	%xcc,	%f0,	%f11
	fba	%fcc2,	loop_199
loop_199:
	ldub	[%l7 + 0x0C],	%o0
	brz,a	%l2,	loop_200
loop_200:
	fbl	%fcc2,	loop_201
loop_201:
	ldsb	[%l7 + 0x6A],	%g2
	nop
	setx loop_202, %l0, %l1
	jmpl %l1, %l6
loop_202:
	be	loop_203
loop_203:
	sub	%i0,	%i2,	%o4
	fmovse	%xcc,	%f14,	%f14
	popc	%i4,	%l4
	nop
	setx loop_204, %l0, %l1
	jmpl %l1, %i6
loop_204:
	fbn,a	%fcc2,	loop_205
loop_205:
	fblg,a	%fcc1,	loop_206
loop_206:
	bleu,pn	%xcc,	loop_207
loop_207:
	fblg	%fcc3,	loop_208
loop_208:
	stx	%i3,	[%l7 + 0x30]
	sth	%o1,	[%l7 + 0x4C]
	fmovdvs	%xcc,	%f11,	%f4
	st	%f12,	[%l7 + 0x60]
	andn	%i1,	%o2,	%g7
	lduw	[%l7 + 0x2C],	%l0
	fbn	%fcc1,	loop_209
loop_209:
	fblg	%fcc2,	loop_210
loop_210:
	fnegd	%f6,	%f8
	lduh	[%l7 + 0x40],	%g4
	ld	[%l7 + 0x0C],	%f13
	movvs	%xcc,	%g5,	%g6
	lduh	[%l7 + 0x1C],	%l1
	brnz	%o6,	loop_211
loop_211:
	tvs	%icc,	0x4
	stw	%o5,	[%l7 + 0x68]
	tgu	%icc,	0x3
	sth	%l5,	[%l7 + 0x6C]
	std	%f8,	[%l7 + 0x58]
	andcc	%o7,	0x0CF8,	%i7
	fmovrsne	%l3,	%f14,	%f7
	stx	%o3,	[%l7 + 0x68]
	alignaddrl	%g3,	%g1,	%o0
	or	%l2,	%g2,	%l6
	fbn	%fcc0,	loop_212
loop_212:
	edge32l	%i0,	%i5,	%i2
	ldsb	[%l7 + 0x4A],	%o4
	stb	%i4,	[%l7 + 0x1F]
	ldsw	[%l7 + 0x1C],	%i6
	stb	%l4,	[%l7 + 0x0D]
	sdivcc	%o1,	0x115F,	%i1
	ldsw	[%l7 + 0x38],	%i3
	std	%f14,	[%l7 + 0x58]
	tneg	%icc,	0x3
	brgez,a	%g7,	loop_213
loop_213:
	ldd	[%l7 + 0x30],	%f4
	lduw	[%l7 + 0x58],	%l0
	bne,pt	%xcc,	loop_214
loop_214:
	udiv	%o2,	0x0E07,	%g4
	tn	%icc,	0x7
	taddcc	%g5,	%g6,	%l1
	ldsw	[%l7 + 0x28],	%o5
	fbuge,a	%fcc1,	loop_215
loop_215:
	ldx	[%l7 + 0x70],	%l5
	fcmpeq16	%f4,	%f12,	%o7
	stx	%i7,	[%l7 + 0x08]
	smul	%o6,	0x1F7E,	%l3
	popc	0x0749,	%g3
	fmovdgu	%xcc,	%f9,	%f1
	sll	%g1,	%o3,	%o0
	ldx	[%l7 + 0x08],	%l2
	srl	%g2,	%i0,	%i5
	ld	[%l7 + 0x64],	%f13
	fbug,a	%fcc0,	loop_216
loop_216:
	addc	%i2,	%l6,	%i4
	move	%icc,	%i6,	%l4
	fbge	%fcc3,	loop_217
loop_217:
	fbl	%fcc1,	loop_218
loop_218:
	sdiv	%o1,	0x00D1,	%o4
	sth	%i1,	[%l7 + 0x3C]
	xnorcc	%g7,	0x1010,	%l0
	stw	%o2,	[%l7 + 0x50]
	bne,a,pt	%icc,	loop_219
loop_219:
	edge16l	%i3,	%g4,	%g5
	std	%f12,	[%l7 + 0x18]
	ldsh	[%l7 + 0x2C],	%g6
	fmovspos	%icc,	%f6,	%f4
	fbne	%fcc1,	loop_220
loop_220:
	stb	%l1,	[%l7 + 0x39]
	bgu,pt	%xcc,	loop_221
loop_221:
	ldsw	[%l7 + 0x54],	%l5
	movvs	%xcc,	%o7,	%i7
	array32	%o5,	%l3,	%o6
	fbu,a	%fcc0,	loop_222
loop_222:
	ble,pn	%icc,	loop_223
loop_223:
	ldsh	[%l7 + 0x38],	%g1
	fbl	%fcc3,	loop_224
loop_224:
	fxors	%f4,	%f7,	%f1
	smulcc	%o3,	%o0,	%l2
	ble,pt	%xcc,	loop_225
loop_225:
	sll	%g2,	0x00,	%g3
	st	%f2,	[%l7 + 0x38]
	tpos	%icc,	0x5
	fbne,a	%fcc2,	loop_226
loop_226:
	fbe,a	%fcc0,	loop_227
loop_227:
	fands	%f0,	%f4,	%f11
	fbe	%fcc2,	loop_228
loop_228:
	sth	%i5,	[%l7 + 0x0E]
	fmovd	%f10,	%f6
	fmovd	%f10,	%f0
	movcc	%icc,	%i0,	%l6
	movre	%i4,	%i2,	%i6
	bvs,a,pt	%xcc,	loop_229
loop_229:
	bcc,a,pn	%xcc,	loop_230
loop_230:
	ldd	[%l7 + 0x18],	%f6
	fblg,a	%fcc0,	loop_231
loop_231:
	movre	%l4,	0x108,	%o1
	movvs	%xcc,	%i1,	%g7
	srax	%o4,	0x14,	%o2
	fone	%f14
	fbu	%fcc2,	loop_232
loop_232:
	array32	%i3,	%l0,	%g4
	std	%f6,	[%l7 + 0x58]
	sth	%g6,	[%l7 + 0x66]
	bg	loop_233
loop_233:
	mova	%icc,	%g5,	%l5
	srl	%o7,	%i7,	%l1
	bvs,a	loop_234
loop_234:
	lduw	[%l7 + 0x18],	%l3
	brlz	%o5,	loop_235
loop_235:
	bg	loop_236
loop_236:
	fbn	%fcc3,	loop_237
loop_237:
	std	%f0,	[%l7 + 0x20]
	std	%f2,	[%l7 + 0x58]
	or	%o6,	%g1,	%o3
	fmovrdne	%l2,	%f6,	%f14
	tleu	%xcc,	0x6
	brz,a	%o0,	loop_238
loop_238:
	brgz	%g3,	loop_239
loop_239:
	nop
	setx loop_240, %l0, %l1
	jmpl %l1, %g2
loop_240:
	sth	%i5,	[%l7 + 0x20]
	stb	%l6,	[%l7 + 0x0E]
	fmul8x16au	%f1,	%f3,	%f6
	brlz,a	%i4,	loop_241
loop_241:
	std	%f2,	[%l7 + 0x18]
	fbl	%fcc2,	loop_242
loop_242:
	tg	%icc,	0x2
	nop
	setx loop_243, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_243:
	bne,a	loop_244
loop_244:
	brlz,a	%i0,	loop_245
loop_245:
	bl,pt	%icc,	loop_246
loop_246:
	edge8n	%i2,	%l4,	%o1
	fmul8x16	%f6,	%f0,	%f12
	nop
	setx loop_247, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_247:
	sra	%i1,	%g7,	%o4
	fbo	%fcc2,	loop_248
loop_248:
	sdivcc	%o2,	0x1A14,	%i6
	ld	[%l7 + 0x68],	%f12
	movl	%xcc,	%l0,	%g4
	fpadd16s	%f8,	%f13,	%f14
	fbule	%fcc1,	loop_249
loop_249:
	ba,pt	%xcc,	loop_250
loop_250:
	array32	%i3,	%g5,	%l5
	fbe	%fcc2,	loop_251
loop_251:
	array16	%g6,	%i7,	%o7
	nop
	setx loop_252, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_252:
	sth	%l1,	[%l7 + 0x44]
	nop
	setx loop_253, %l0, %l1
	jmpl %l1, %o5
loop_253:
	bne,pn	%xcc,	loop_254
loop_254:
	st	%f11,	[%l7 + 0x14]
	std	%f4,	[%l7 + 0x68]
	bvc,a,pt	%icc,	loop_255
loop_255:
	brgez,a	%l3,	loop_256
loop_256:
	tn	%xcc,	0x5
	array16	%o6,	%o3,	%g1
	ldub	[%l7 + 0x10],	%o0
	popc	0x128A,	%l2
	xnor	%g3,	%i5,	%l6
	std	%f2,	[%l7 + 0x20]
	mulx	%g2,	0x1A85,	%i0
	ld	[%l7 + 0x4C],	%f14
	movpos	%xcc,	%i2,	%l4
	fmovdn	%icc,	%f14,	%f0
	bpos,a	loop_257
loop_257:
	bneg,a	loop_258
loop_258:
	udiv	%o1,	0x0449,	%i4
	ldub	[%l7 + 0x21],	%g7
	edge32n	%o4,	%i1,	%i6
	fmovscs	%xcc,	%f11,	%f4
	lduh	[%l7 + 0x6A],	%o2
	edge16l	%l0,	%i3,	%g4
	bvc,a	loop_259
loop_259:
	edge16ln	%g5,	%g6,	%i7
	tge	%xcc,	0x3
	ld	[%l7 + 0x4C],	%f10
	edge16n	%o7,	%l5,	%o5
	fmovscs	%xcc,	%f8,	%f9
	lduh	[%l7 + 0x38],	%l1
	ldub	[%l7 + 0x6F],	%l3
	fzeros	%f5
	fbuge,a	%fcc2,	loop_260
loop_260:
	lduw	[%l7 + 0x50],	%o3
	fbuge,a	%fcc2,	loop_261
loop_261:
	sethi	0x0BCB,	%o6
	andn	%o0,	%l2,	%g3
	ldsw	[%l7 + 0x08],	%i5
	fbug,a	%fcc1,	loop_262
loop_262:
	stw	%g1,	[%l7 + 0x20]
	andn	%g2,	%i0,	%i2
	addcc	%l4,	0x10E0,	%o1
	ldsb	[%l7 + 0x72],	%l6
	brnz,a	%i4,	loop_263
loop_263:
	sethi	0x1DD8,	%g7
	movrlz	%i1,	0x1F5,	%o4
	bl,pt	%icc,	loop_264
loop_264:
	ld	[%l7 + 0x70],	%f2
	alignaddrl	%o2,	%i6,	%i3
	lduw	[%l7 + 0x70],	%g4
	bg,a	%xcc,	loop_265
loop_265:
	ldx	[%l7 + 0x08],	%g5
	sdivcc	%g6,	0x07A9,	%l0
	bge	%xcc,	loop_266
loop_266:
	nop
	setx loop_267, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_267:
	brgz	%o7,	loop_268
loop_268:
	call	loop_269
loop_269:
	fornot1s	%f8,	%f2,	%f8
	lduw	[%l7 + 0x18],	%i7
	fbn,a	%fcc3,	loop_270
loop_270:
	tsubcctv	%o5,	0x1D65,	%l5
	taddcctv	%l1,	0x11FE,	%l3
	fbge	%fcc1,	loop_271
loop_271:
	orn	%o6,	%o0,	%l2
	fcmpne32	%f12,	%f2,	%o3
	movrgz	%g3,	%i5,	%g2
	fmul8x16	%f5,	%f2,	%f14
	fbug	%fcc2,	loop_272
loop_272:
	fnegs	%f5,	%f13
	sra	%i0,	0x16,	%i2
	umulcc	%g1,	%o1,	%l4
	nop
	setx loop_273, %l0, %l1
	jmpl %l1, %l6
loop_273:
	fbul	%fcc0,	loop_274
loop_274:
	std	%f4,	[%l7 + 0x58]
	fcmpeq16	%f4,	%f10,	%i4
	srlx	%g7,	%i1,	%o2
	subccc	%i6,	0x192B,	%o4
	call	loop_275
loop_275:
	fpsub32s	%f6,	%f14,	%f12
	edge16l	%i3,	%g5,	%g6
	tl	%icc,	0x5
	smulcc	%g4,	0x18AF,	%l0
	ldx	[%l7 + 0x20],	%o7
	ld	[%l7 + 0x50],	%f0
	nop
	setx loop_276, %l0, %l1
	jmpl %l1, %o5
loop_276:
	bleu,pt	%xcc,	loop_277
loop_277:
	stb	%l5,	[%l7 + 0x52]
	stb	%i7,	[%l7 + 0x7D]
	lduw	[%l7 + 0x1C],	%l1
	tcc	%icc,	0x1
	edge32	%o6,	%o0,	%l3
	ldsb	[%l7 + 0x52],	%o3
	fcmpne32	%f2,	%f2,	%l2
	std	%f8,	[%l7 + 0x48]
	lduw	[%l7 + 0x48],	%g3
	brgez,a	%g2,	loop_278
loop_278:
	movle	%icc,	%i5,	%i2
	fmovrslez	%i0,	%f13,	%f4
	ldsw	[%l7 + 0x3C],	%o1
	fbe	%fcc2,	loop_279
loop_279:
	smul	%l4,	%l6,	%g1
	sth	%i4,	[%l7 + 0x42]
	stw	%g7,	[%l7 + 0x28]
	bge,pt	%xcc,	loop_280
loop_280:
	mulscc	%o2,	0x1F47,	%i1
	add	%o4,	0x10B5,	%i3
	fbn	%fcc1,	loop_281
loop_281:
	tge	%xcc,	0x6
	stx	%i6,	[%l7 + 0x20]
	tn	%icc,	0x6
	bn,pn	%icc,	loop_282
loop_282:
	brnz	%g6,	loop_283
loop_283:
	taddcctv	%g5,	0x0EA1,	%l0
	udiv	%o7,	0x0973,	%g4
	fbg,a	%fcc0,	loop_284
loop_284:
	fbo,a	%fcc3,	loop_285
loop_285:
	tsubcc	%o5,	0x019B,	%i7
	sra	%l1,	%l5,	%o0
	stb	%l3,	[%l7 + 0x26]
	tvc	%xcc,	0x1
	fbl,a	%fcc3,	loop_286
loop_286:
	ble	loop_287
loop_287:
	movpos	%xcc,	%o3,	%l2
	fandnot1	%f14,	%f6,	%f2
	addccc	%g3,	0x0533,	%o6
	movrgez	%g2,	0x306,	%i2
	stw	%i5,	[%l7 + 0x24]
	brgez	%i0,	loop_288
loop_288:
	ldx	[%l7 + 0x10],	%o1
	srl	%l4,	%g1,	%i4
	fnegs	%f9,	%f9
	movleu	%xcc,	%g7,	%l6
	fbo	%fcc0,	loop_289
loop_289:
	ld	[%l7 + 0x54],	%f13
	ldsb	[%l7 + 0x4D],	%i1
	fbu	%fcc0,	loop_290
loop_290:
	fmovda	%icc,	%f2,	%f2
	bge,a,pt	%xcc,	loop_291
loop_291:
	bn,a,pt	%xcc,	loop_292
loop_292:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 103
!	Type cti   	: 292
!	Type i   	: 326
!	Type l   	: 279
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
main_t1:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0xD,	%g2
	set	0x7,	%g3
	set	0xC,	%g4
	set	0x2,	%g5
	set	0x4,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xA,	%i1
	set	-0x1,	%i2
	set	-0x5,	%i3
	set	-0xC,	%i4
	set	-0x6,	%i5
	set	-0x1,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x1B315E52,	%l0
	set	0x203CB5D8,	%l1
	set	0x7CF1D0A2,	%l2
	set	0x7033979F,	%l3
	set	0x08A42092,	%l4
	set	0x7F477959,	%l5
	set	0x0225A10C,	%l6
	!# Output registers
	set	0x1F13,	%o0
	set	0x074E,	%o1
	set	0x1D97,	%o2
	set	-0x0F8E,	%o3
	set	0x1166,	%o4
	set	0x0DE8,	%o5
	set	-0x0754,	%o6
	set	0x1802,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	udivx	%o2,	0x0343,	%o4
	bvc,pt	%xcc,	loop_293
loop_293:
	orn	%i6,	%g6,	%g5
	movg	%icc,	%l0,	%i3
	fornot2	%f4,	%f10,	%f6
	taddcctv	%g4,	%o5,	%i7
	fxnor	%f0,	%f2,	%f12
	ldsb	[%l7 + 0x2E],	%o7
	mova	%xcc,	%l5,	%l1
	brgez,a	%l3,	loop_294
loop_294:
	sdiv	%o3,	0x0853,	%o0
	fmovs	%f13,	%f15
	fbo,a	%fcc2,	loop_295
loop_295:
	fmovsle	%xcc,	%f14,	%f9
	fmovdvs	%icc,	%f11,	%f11
	brz,a	%l2,	loop_296
loop_296:
	edge8ln	%o6,	%g3,	%i2
	fmovrdne	%g2,	%f8,	%f6
	ldsw	[%l7 + 0x68],	%i0
	fbn	%fcc2,	loop_297
loop_297:
	fbe	%fcc0,	loop_298
loop_298:
	fmovrsgez	%o1,	%f3,	%f10
	ldsh	[%l7 + 0x3E],	%l4
	bl,a,pt	%xcc,	loop_299
loop_299:
	fandnot1s	%f4,	%f4,	%f15
	smul	%i5,	%i4,	%g1
	subcc	%l6,	%i1,	%o2
	fpsub16s	%f7,	%f11,	%f0
	andcc	%g7,	%i6,	%g6
	bvc	loop_300
loop_300:
	nop
	setx loop_301, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_301:
	taddcctv	%g5,	%l0,	%i3
	std	%f8,	[%l7 + 0x70]
	call	loop_302
loop_302:
	ldsh	[%l7 + 0x3C],	%g4
	bshuffle	%f4,	%f2,	%f14
	fpsub32s	%f15,	%f6,	%f3
	udivcc	%o5,	0x1875,	%i7
	movrne	%o7,	0x0DB,	%l5
	ldx	[%l7 + 0x20],	%l1
	array32	%o4,	%o3,	%l3
	stw	%o0,	[%l7 + 0x3C]
	fcmple16	%f6,	%f10,	%l2
	brz	%g3,	loop_303
loop_303:
	fbug,a	%fcc1,	loop_304
loop_304:
	bgu,a,pn	%xcc,	loop_305
loop_305:
	movpos	%icc,	%i2,	%g2
	ldsh	[%l7 + 0x40],	%o6
	fmovsne	%xcc,	%f11,	%f5
	stb	%o1,	[%l7 + 0x7E]
	fmovsge	%xcc,	%f15,	%f7
	bcs,a	loop_306
loop_306:
	fmovsl	%xcc,	%f10,	%f8
	umul	%l4,	%i0,	%i5
	fbl,a	%fcc1,	loop_307
loop_307:
	tg	%icc,	0x5
	fpsub16s	%f11,	%f6,	%f6
	andcc	%i4,	%l6,	%g1
	or	%o2,	0x01A7,	%i1
	fandnot1	%f12,	%f10,	%f14
	stb	%i6,	[%l7 + 0x47]
	fcmpd	%fcc1,	%f14,	%f8
	nop
	setx loop_308, %l0, %l1
	jmpl %l1, %g6
loop_308:
	st	%f3,	[%l7 + 0x74]
	sub	%g7,	%l0,	%g5
	fcmpne32	%f2,	%f12,	%i3
	sth	%g4,	[%l7 + 0x58]
	ldub	[%l7 + 0x2B],	%i7
	ldx	[%l7 + 0x70],	%o5
	fxor	%f2,	%f12,	%f6
	movn	%icc,	%o7,	%l5
	std	%f0,	[%l7 + 0x68]
	bg,a	loop_309
loop_309:
	edge16	%o4,	%l1,	%l3
	fmovdge	%xcc,	%f14,	%f8
	orncc	%o0,	0x03B9,	%o3
	call	loop_310
loop_310:
	stw	%l2,	[%l7 + 0x0C]
	be,a,pn	%xcc,	loop_311
loop_311:
	fpsub16	%f8,	%f10,	%f8
	fpsub16	%f12,	%f8,	%f12
	edge16n	%i2,	%g3,	%o6
	sra	%g2,	%l4,	%o1
	fmovdvc	%icc,	%f14,	%f10
	stb	%i5,	[%l7 + 0x12]
	ld	[%l7 + 0x74],	%f12
	fpackfix	%f8,	%f5
	stb	%i4,	[%l7 + 0x45]
	bgu	loop_312
loop_312:
	ldx	[%l7 + 0x78],	%l6
	ba,pt	%xcc,	loop_313
loop_313:
	brz	%i0,	loop_314
loop_314:
	ldd	[%l7 + 0x50],	%f10
	xnorcc	%g1,	0x1C33,	%i1
	sdivx	%i6,	0x17E8,	%o2
	tne	%icc,	0x5
	subccc	%g7,	%l0,	%g6
	std	%f8,	[%l7 + 0x10]
	mova	%icc,	%i3,	%g5
	udivx	%g4,	0x1F13,	%o5
	siam	0x5
	stw	%o7,	[%l7 + 0x0C]
	alignaddr	%i7,	%l5,	%l1
	fbl	%fcc0,	loop_315
loop_315:
	xnorcc	%l3,	0x1E1A,	%o0
	sdivx	%o3,	0x1EFE,	%l2
	fandnot1	%f4,	%f8,	%f8
	tsubcctv	%o4,	0x161D,	%g3
	fbne,a	%fcc2,	loop_316
loop_316:
	fbue	%fcc3,	loop_317
loop_317:
	ldd	[%l7 + 0x60],	%f14
	subccc	%i2,	%g2,	%l4
	fblg	%fcc0,	loop_318
loop_318:
	ldub	[%l7 + 0x72],	%o1
	ld	[%l7 + 0x08],	%f10
	movgu	%icc,	%i5,	%o6
	and	%l6,	0x09B9,	%i4
	fbn,a	%fcc0,	loop_319
loop_319:
	array16	%i0,	%i1,	%i6
	tpos	%icc,	0x7
	fmovsl	%xcc,	%f8,	%f12
	stx	%o2,	[%l7 + 0x40]
	fblg	%fcc3,	loop_320
loop_320:
	fmovscs	%icc,	%f2,	%f4
	srlx	%g7,	%l0,	%g6
	bcs,pt	%icc,	loop_321
loop_321:
	orn	%i3,	0x1C23,	%g5
	sth	%g4,	[%l7 + 0x7C]
	addccc	%o5,	%o7,	%i7
	brlez	%l5,	loop_322
loop_322:
	ble,pt	%xcc,	loop_323
loop_323:
	bn,pn	%xcc,	loop_324
loop_324:
	bvs	%icc,	loop_325
loop_325:
	or	%l1,	0x026A,	%g1
	fmovdpos	%icc,	%f3,	%f8
	fnot2s	%f1,	%f7
	bgu,a,pt	%xcc,	loop_326
loop_326:
	fabss	%f5,	%f1
	fcmpes	%fcc0,	%f11,	%f2
	orn	%l3,	0x1433,	%o0
	orncc	%o3,	%o4,	%l2
	fabss	%f8,	%f2
	fpackfix	%f6,	%f4
	sub	%g3,	%i2,	%l4
	fmovrsgz	%g2,	%f4,	%f0
	fbg	%fcc3,	loop_327
loop_327:
	fmovrsgez	%i5,	%f12,	%f12
	andn	%o1,	%o6,	%l6
	fmovrsgz	%i0,	%f1,	%f14
	alignaddrl	%i4,	%i1,	%i6
	subc	%o2,	%g7,	%l0
	fmul8x16au	%f9,	%f3,	%f8
	ldsb	[%l7 + 0x42],	%g6
	edge32n	%g5,	%g4,	%i3
	movre	%o7,	0x295,	%o5
	fbl,a	%fcc2,	loop_328
loop_328:
	fmovdgu	%icc,	%f3,	%f7
	andncc	%l5,	%i7,	%g1
	fmovse	%xcc,	%f8,	%f1
	fsrc2	%f8,	%f4
	fmovrslez	%l1,	%f13,	%f8
	fcmpgt16	%f12,	%f14,	%l3
	edge32ln	%o0,	%o4,	%l2
	fbue,a	%fcc2,	loop_329
loop_329:
	bge,a,pn	%icc,	loop_330
loop_330:
	udivx	%o3,	0x02E7,	%i2
	brlez,a	%l4,	loop_331
loop_331:
	edge8l	%g2,	%g3,	%i5
	ldx	[%l7 + 0x18],	%o1
	fmovrdlz	%l6,	%f2,	%f6
	brlez,a	%i0,	loop_332
loop_332:
	sra	%i4,	%o6,	%i6
	nop
	setx loop_333, %l0, %l1
	jmpl %l1, %o2
loop_333:
	ba	%xcc,	loop_334
loop_334:
	fcmpes	%fcc3,	%f6,	%f11
	addc	%i1,	0x0407,	%l0
	fornot2s	%f7,	%f0,	%f10
	srl	%g6,	%g5,	%g7
	fbl,a	%fcc0,	loop_335
loop_335:
	bneg,pn	%icc,	loop_336
loop_336:
	brgez,a	%i3,	loop_337
loop_337:
	fcmple32	%f2,	%f14,	%g4
	brgz,a	%o7,	loop_338
loop_338:
	bvs,pt	%xcc,	loop_339
loop_339:
	fpack32	%f10,	%f12,	%f6
	edge16	%l5,	%o5,	%g1
	bcs,a	%icc,	loop_340
loop_340:
	edge32l	%l1,	%l3,	%i7
	fbn,a	%fcc3,	loop_341
loop_341:
	movg	%icc,	%o4,	%o0
	fbne,a	%fcc3,	loop_342
loop_342:
	ld	[%l7 + 0x0C],	%f12
	fmovdcc	%xcc,	%f14,	%f4
	ta	%xcc,	0x6
	fbuge	%fcc3,	loop_343
loop_343:
	fmovsneg	%xcc,	%f13,	%f15
	fxor	%f8,	%f14,	%f0
	movg	%xcc,	%o3,	%l2
	ldub	[%l7 + 0x3E],	%l4
	sth	%i2,	[%l7 + 0x08]
	fmovrsgez	%g2,	%f5,	%f5
	ldd	[%l7 + 0x70],	%f0
	tg	%icc,	0x6
	ldx	[%l7 + 0x70],	%g3
	tl	%xcc,	0x5
	ldub	[%l7 + 0x50],	%i5
	edge32n	%l6,	%o1,	%i4
	edge16n	%o6,	%i6,	%i0
	popc	0x137D,	%i1
	brlez	%l0,	loop_344
loop_344:
	nop
	setx loop_345, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_345:
	stx	%o2,	[%l7 + 0x40]
	fmovsl	%icc,	%f6,	%f12
	fmovdcs	%xcc,	%f2,	%f8
	fornot1s	%f1,	%f14,	%f15
	fmuld8ulx16	%f9,	%f6,	%f4
	fpadd16s	%f6,	%f14,	%f12
	fble,a	%fcc2,	loop_346
loop_346:
	sdivx	%g6,	0x0EF2,	%g7
	ldsb	[%l7 + 0x45],	%g5
	ldd	[%l7 + 0x38],	%f10
	bvs	%xcc,	loop_347
loop_347:
	bge,a,pt	%icc,	loop_348
loop_348:
	fnot2	%f10,	%f12
	lduw	[%l7 + 0x30],	%g4
	bneg	loop_349
loop_349:
	ldd	[%l7 + 0x08],	%f4
	ldsh	[%l7 + 0x30],	%o7
	fcmple16	%f6,	%f4,	%l5
	siam	0x0
	movrgz	%i3,	%g1,	%o5
	ldd	[%l7 + 0x38],	%f10
	array32	%l3,	%i7,	%l1
	fpsub32	%f2,	%f10,	%f6
	fmovsa	%icc,	%f1,	%f8
	stw	%o4,	[%l7 + 0x50]
	movge	%icc,	%o3,	%o0
	movgu	%icc,	%l2,	%i2
	fmovdvs	%xcc,	%f3,	%f10
	lduh	[%l7 + 0x0E],	%l4
	pdist	%f10,	%f6,	%f0
	fmovrslez	%g3,	%f12,	%f8
	fbue,a	%fcc3,	loop_350
loop_350:
	fble,a	%fcc3,	loop_351
loop_351:
	fnors	%f3,	%f1,	%f4
	fzeros	%f1
	brnz,a	%g2,	loop_352
loop_352:
	movre	%l6,	%i5,	%o1
	movre	%o6,	0x294,	%i4
	fmovrdlez	%i6,	%f4,	%f6
	lduh	[%l7 + 0x74],	%i0
	call	loop_353
loop_353:
	fors	%f3,	%f6,	%f11
	edge16ln	%l0,	%o2,	%g6
	fnot1s	%f13,	%f12
	fbug	%fcc0,	loop_354
loop_354:
	tle	%icc,	0x5
	tge	%icc,	0x0
	ldub	[%l7 + 0x7F],	%g7
	fmovdn	%xcc,	%f9,	%f1
	fmul8ulx16	%f6,	%f12,	%f14
	ldub	[%l7 + 0x43],	%g5
	fcmpgt16	%f6,	%f4,	%g4
	smulcc	%o7,	%i1,	%i3
	edge16ln	%l5,	%g1,	%l3
	fnot1s	%f15,	%f3
	bge,a,pt	%xcc,	loop_355
loop_355:
	ld	[%l7 + 0x5C],	%f0
	smul	%o5,	0x0FEA,	%i7
	array32	%o4,	%l1,	%o3
	ld	[%l7 + 0x54],	%f14
	fblg,a	%fcc1,	loop_356
loop_356:
	fbn	%fcc3,	loop_357
loop_357:
	sth	%l2,	[%l7 + 0x3A]
	bvc,a,pn	%xcc,	loop_358
loop_358:
	srlx	%o0,	0x12,	%i2
	edge8ln	%l4,	%g3,	%g2
	fcmped	%fcc1,	%f0,	%f2
	edge8n	%i5,	%l6,	%o6
	addccc	%o1,	0x1B5C,	%i6
	edge32l	%i0,	%i4,	%o2
	fbge,a	%fcc1,	loop_359
loop_359:
	tleu	%xcc,	0x1
	bg,a	loop_360
loop_360:
	nop
	setx loop_361, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_361:
	fnors	%f1,	%f1,	%f3
	mulscc	%g6,	0x0D7C,	%l0
	bleu,a,pn	%icc,	loop_362
loop_362:
	st	%f5,	[%l7 + 0x3C]
	movl	%xcc,	%g5,	%g7
	ldsh	[%l7 + 0x58],	%g4
	fmovrsne	%o7,	%f0,	%f0
	fmovdn	%xcc,	%f10,	%f10
	popc	%i1,	%l5
	fbul,a	%fcc2,	loop_363
loop_363:
	fpackfix	%f14,	%f12
	fnegd	%f10,	%f8
	pdist	%f8,	%f2,	%f2
	tpos	%icc,	0x3
	std	%f2,	[%l7 + 0x78]
	sub	%i3,	%g1,	%o5
	alignaddrl	%l3,	%o4,	%i7
	tsubcc	%o3,	0x163F,	%l2
	fcmped	%fcc1,	%f2,	%f0
	fbe	%fcc3,	loop_364
loop_364:
	fmovsneg	%xcc,	%f5,	%f11
	fpack32	%f6,	%f6,	%f4
	mulscc	%o0,	0x0FB0,	%l1
	mulx	%l4,	%g3,	%g2
	movvc	%icc,	%i5,	%i2
	fbl	%fcc0,	loop_365
loop_365:
	stb	%l6,	[%l7 + 0x1C]
	edge8	%o1,	%i6,	%i0
	std	%f0,	[%l7 + 0x10]
	fblg	%fcc0,	loop_366
loop_366:
	fpack16	%f6,	%f8
	movl	%icc,	%i4,	%o6
	stw	%g6,	[%l7 + 0x14]
	tg	%icc,	0x4
	tn	%icc,	0x6
	brgz,a	%l0,	loop_367
loop_367:
	ldub	[%l7 + 0x1D],	%o2
	ldsb	[%l7 + 0x7A],	%g5
	movrgz	%g7,	0x181,	%g4
	fmovse	%xcc,	%f8,	%f13
	fbul,a	%fcc3,	loop_368
loop_368:
	sllx	%o7,	%i1,	%i3
	fornot2s	%f15,	%f15,	%f9
	fsrc2s	%f2,	%f10
	fbl,a	%fcc1,	loop_369
loop_369:
	nop
	setx loop_370, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_370:
	movgu	%xcc,	%l5,	%g1
	ldd	[%l7 + 0x70],	%f12
	tne	%xcc,	0x5
	fbl	%fcc2,	loop_371
loop_371:
	array8	%o5,	%o4,	%l3
	ldx	[%l7 + 0x30],	%i7
	fbo	%fcc0,	loop_372
loop_372:
	fnot2	%f8,	%f8
	sdivx	%o3,	0x1B01,	%l2
	ba	%icc,	loop_373
loop_373:
	fnor	%f2,	%f2,	%f0
	lduh	[%l7 + 0x74],	%l1
	brz,a	%l4,	loop_374
loop_374:
	stw	%g3,	[%l7 + 0x08]
	fpadd32s	%f8,	%f0,	%f0
	fpmerge	%f12,	%f6,	%f14
	andn	%o0,	0x00E1,	%g2
	tl	%xcc,	0x7
	udivcc	%i2,	0x057C,	%i5
	sdivcc	%o1,	0x0A58,	%i6
	fmovrdgz	%i0,	%f8,	%f14
	movpos	%xcc,	%i4,	%l6
	tgu	%xcc,	0x6
	stw	%o6,	[%l7 + 0x58]
	udivcc	%g6,	0x1EF6,	%l0
	movvs	%icc,	%o2,	%g5
	ldsb	[%l7 + 0x19],	%g7
	fmul8x16au	%f4,	%f6,	%f14
	smul	%o7,	0x0E48,	%g4
	fmovdg	%icc,	%f14,	%f12
	tsubcctv	%i1,	%l5,	%g1
	alignaddr	%o5,	%o4,	%i3
	fbne,a	%fcc0,	loop_375
loop_375:
	ldsh	[%l7 + 0x32],	%l3
	tleu	%icc,	0x3
	fcmped	%fcc1,	%f12,	%f2
	nop
	setx loop_376, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_376:
	addcc	%o3,	0x102C,	%l2
	movrgez	%i7,	%l4,	%g3
	orn	%o0,	0x11D8,	%l1
	std	%f8,	[%l7 + 0x68]
	bgu,a	loop_377
loop_377:
	movgu	%icc,	%i2,	%g2
	fmovdge	%icc,	%f8,	%f11
	tneg	%icc,	0x6
	fmovsneg	%xcc,	%f14,	%f4
	sth	%o1,	[%l7 + 0x0A]
	fbl	%fcc0,	loop_378
loop_378:
	orcc	%i5,	0x0340,	%i0
	orcc	%i6,	%l6,	%i4
	fmovdcc	%icc,	%f2,	%f1
	bcc	%icc,	loop_379
loop_379:
	sethi	0x0E50,	%o6
	ld	[%l7 + 0x20],	%f5
	fnor	%f0,	%f2,	%f14
	tneg	%xcc,	0x3
	fblg,a	%fcc1,	loop_380
loop_380:
	fsrc1s	%f10,	%f6
	fabss	%f6,	%f7
	bleu,a	loop_381
loop_381:
	fones	%f15
	stb	%l0,	[%l7 + 0x2A]
	ldd	[%l7 + 0x38],	%f14
	brgez,a	%o2,	loop_382
loop_382:
	fmovdne	%icc,	%f2,	%f0
	stb	%g5,	[%l7 + 0x7F]
	fbu,a	%fcc2,	loop_383
loop_383:
	fmovrsne	%g6,	%f3,	%f4
	lduw	[%l7 + 0x7C],	%g7
	bvs,a	loop_384
loop_384:
	fmul8x16au	%f6,	%f15,	%f8
	fmovdneg	%icc,	%f4,	%f1
	fbue	%fcc3,	loop_385
loop_385:
	be,a,pt	%icc,	loop_386
loop_386:
	fsrc2	%f10,	%f4
	fnot2	%f14,	%f8
	umulcc	%o7,	0x1FA3,	%i1
	movre	%g4,	0x332,	%g1
	fmovsl	%icc,	%f0,	%f11
	alignaddrl	%l5,	%o5,	%i3
	fmovdle	%xcc,	%f13,	%f7
	fpsub32s	%f10,	%f4,	%f15
	fblg,a	%fcc2,	loop_387
loop_387:
	array32	%o4,	%l3,	%l2
	tcs	%icc,	0x3
	stw	%i7,	[%l7 + 0x44]
	fmovdge	%icc,	%f13,	%f8
	fblg	%fcc1,	loop_388
loop_388:
	st	%f13,	[%l7 + 0x54]
	fpmerge	%f0,	%f2,	%f14
	edge32n	%o3,	%g3,	%l4
	fpadd16	%f8,	%f0,	%f10
	lduh	[%l7 + 0x16],	%o0
	movrne	%l1,	0x3D0,	%i2
	tg	%xcc,	0x1
	movvs	%xcc,	%o1,	%g2
	stb	%i5,	[%l7 + 0x43]
	be,pn	%icc,	loop_389
loop_389:
	ble,a	%xcc,	loop_390
loop_390:
	ba,a	%icc,	loop_391
loop_391:
	stb	%i0,	[%l7 + 0x65]
	nop
	setx loop_392, %l0, %l1
	jmpl %l1, %l6
loop_392:
	udivx	%i4,	0x0D73,	%i6
	fmovdvs	%xcc,	%f11,	%f7
	fnot2	%f2,	%f2
	fmovdgu	%icc,	%f15,	%f2
	fmovdneg	%icc,	%f7,	%f12
	lduw	[%l7 + 0x34],	%o6
	fmul8x16al	%f2,	%f12,	%f12
	fbug	%fcc3,	loop_393
loop_393:
	call	loop_394
loop_394:
	fmul8sux16	%f0,	%f0,	%f12
	sdivcc	%l0,	0x1890,	%g5
	fsrc1s	%f2,	%f4
	movne	%xcc,	%g6,	%o2
	bn	loop_395
loop_395:
	movpos	%icc,	%o7,	%g7
	fmovdcc	%icc,	%f7,	%f6
	fmovsle	%xcc,	%f10,	%f12
	srlx	%g4,	%g1,	%i1
	nop
	setx loop_396, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_396:
	fabss	%f5,	%f5
	brnz	%o5,	loop_397
loop_397:
	fnand	%f14,	%f0,	%f0
	ldx	[%l7 + 0x40],	%l5
	alignaddr	%i3,	%o4,	%l3
	ld	[%l7 + 0x24],	%f0
	ldsb	[%l7 + 0x53],	%i7
	std	%f4,	[%l7 + 0x70]
	tn	%icc,	0x0
	movcs	%icc,	%o3,	%l2
	ba,a	loop_398
loop_398:
	taddcctv	%g3,	%l4,	%o0
	fmovsne	%icc,	%f3,	%f9
	fsrc2s	%f9,	%f9
	stx	%l1,	[%l7 + 0x28]
	fbug	%fcc2,	loop_399
loop_399:
	fpsub32s	%f4,	%f9,	%f15
	addcc	%o1,	%g2,	%i2
	ldd	[%l7 + 0x10],	%f14
	fbuge	%fcc2,	loop_400
loop_400:
	fcmpes	%fcc0,	%f1,	%f3
	fmovdle	%icc,	%f10,	%f14
	fpack16	%f8,	%f12
	stb	%i0,	[%l7 + 0x3D]
	fand	%f4,	%f14,	%f4
	st	%f11,	[%l7 + 0x38]
	fblg	%fcc3,	loop_401
loop_401:
	movleu	%xcc,	%l6,	%i5
	edge32n	%i4,	%i6,	%o6
	std	%f12,	[%l7 + 0x18]
	ldsh	[%l7 + 0x0E],	%g5
	fand	%f4,	%f8,	%f10
	movgu	%xcc,	%g6,	%o2
	tvs	%icc,	0x3
	ldx	[%l7 + 0x58],	%o7
	fba	%fcc1,	loop_402
loop_402:
	sth	%g7,	[%l7 + 0x2E]
	fmovrdlz	%g4,	%f14,	%f8
	bne,a	loop_403
loop_403:
	tl	%icc,	0x7
	lduw	[%l7 + 0x70],	%l0
	movvc	%icc,	%g1,	%i1
	fandnot1	%f0,	%f2,	%f0
	stw	%l5,	[%l7 + 0x1C]
	fcmpne32	%f2,	%f4,	%o5
	tne	%icc,	0x0
	ldsh	[%l7 + 0x24],	%o4
	fmovdpos	%xcc,	%f4,	%f5
	stx	%l3,	[%l7 + 0x20]
	sth	%i7,	[%l7 + 0x40]
	srlx	%o3,	0x05,	%l2
	fpsub32s	%f6,	%f13,	%f12
	fone	%f2
	lduh	[%l7 + 0x62],	%g3
	fxnor	%f8,	%f10,	%f0
	fone	%f6
	fxnors	%f6,	%f1,	%f3
	fsrc2s	%f1,	%f3
	fbge	%fcc3,	loop_404
loop_404:
	sll	%l4,	0x0C,	%i3
	sth	%l1,	[%l7 + 0x62]
	be,a,pn	%xcc,	loop_405
loop_405:
	movge	%icc,	%o0,	%g2
	fabss	%f7,	%f11
	alignaddrl	%i2,	%o1,	%i0
	fornot1s	%f0,	%f3,	%f1
	ldx	[%l7 + 0x48],	%l6
	bcs,a	loop_406
loop_406:
	tcs	%xcc,	0x2
	bl	loop_407
loop_407:
	nop
	setx loop_408, %l0, %l1
	jmpl %l1, %i4
loop_408:
	ldsw	[%l7 + 0x74],	%i5
	ldub	[%l7 + 0x30],	%i6
	edge32ln	%o6,	%g6,	%g5
	bcs,a	%icc,	loop_409
loop_409:
	brlez	%o2,	loop_410
loop_410:
	bleu,a	%icc,	loop_411
loop_411:
	movrgz	%g7,	%g4,	%o7
	fbu	%fcc1,	loop_412
loop_412:
	movrlez	%l0,	0x256,	%i1
	edge16ln	%g1,	%l5,	%o5
	fmovsn	%icc,	%f11,	%f9
	fxnors	%f12,	%f10,	%f8
	fpadd16s	%f13,	%f7,	%f7
	bcc	%xcc,	loop_413
loop_413:
	fcmpeq32	%f4,	%f6,	%o4
	fmovdne	%xcc,	%f13,	%f0
	fxor	%f10,	%f0,	%f0
	ldsw	[%l7 + 0x50],	%l3
	ldsh	[%l7 + 0x36],	%i7
	fmovd	%f10,	%f2
	fcmpgt16	%f14,	%f10,	%o3
	bcs	%icc,	loop_414
loop_414:
	sdivx	%g3,	0x0777,	%l2
	fcmps	%fcc0,	%f7,	%f14
	tn	%xcc,	0x3
	sth	%i3,	[%l7 + 0x1A]
	movleu	%xcc,	%l1,	%o0
	xnor	%l4,	0x1EE7,	%g2
	bpos,pn	%icc,	loop_415
loop_415:
	fsrc1	%f14,	%f0
	ldsb	[%l7 + 0x28],	%o1
	call	loop_416
loop_416:
	move	%xcc,	%i2,	%i0
	fnot1	%f6,	%f14
	fxnors	%f14,	%f3,	%f12
	fbg,a	%fcc3,	loop_417
loop_417:
	udiv	%l6,	0x1317,	%i4
	movrgz	%i5,	0x090,	%o6
	ldsw	[%l7 + 0x30],	%i6
	fnot1	%f0,	%f12
	fbn	%fcc0,	loop_418
loop_418:
	ldub	[%l7 + 0x1A],	%g5
	fmovdgu	%xcc,	%f3,	%f6
	lduh	[%l7 + 0x5E],	%o2
	nop
	setx loop_419, %l0, %l1
	jmpl %l1, %g7
loop_419:
	bpos,pt	%xcc,	loop_420
loop_420:
	fmul8sux16	%f4,	%f4,	%f8
	ldub	[%l7 + 0x0B],	%g6
	ldsh	[%l7 + 0x72],	%o7
	ldsw	[%l7 + 0x40],	%l0
	ldsh	[%l7 + 0x62],	%i1
	brlz,a	%g4,	loop_421
loop_421:
	fmovsgu	%icc,	%f3,	%f6
	fmovspos	%icc,	%f1,	%f12
	ldsh	[%l7 + 0x5A],	%l5
	xnor	%o5,	%o4,	%l3
	brgz,a	%i7,	loop_422
loop_422:
	fmovdpos	%icc,	%f14,	%f14
	fmovsl	%icc,	%f3,	%f13
	fmovsvs	%icc,	%f2,	%f2
	edge8l	%o3,	%g3,	%l2
	fmovse	%icc,	%f11,	%f11
	sdivx	%i3,	0x1B6B,	%l1
	tcs	%icc,	0x1
	fabsd	%f4,	%f10
	fcmpgt32	%f0,	%f8,	%o0
	udiv	%l4,	0x13F8,	%g1
	fpsub32s	%f13,	%f9,	%f7
	tcc	%xcc,	0x6
	fcmpeq16	%f8,	%f0,	%g2
	popc	0x173A,	%i2
	ldsh	[%l7 + 0x48],	%i0
	fbue,a	%fcc0,	loop_423
loop_423:
	fmovsneg	%icc,	%f1,	%f3
	movrlez	%o1,	%l6,	%i4
	orcc	%o6,	0x09CF,	%i5
	call	loop_424
loop_424:
	movpos	%icc,	%i6,	%o2
	fmovde	%xcc,	%f12,	%f6
	tcc	%xcc,	0x6
	fmovrdlz	%g5,	%f6,	%f8
	tl	%xcc,	0x5
	brgez,a	%g7,	loop_425
loop_425:
	subcc	%o7,	0x00B4,	%l0
	fbuge,a	%fcc0,	loop_426
loop_426:
	fmuld8sux16	%f2,	%f3,	%f0
	movleu	%xcc,	%g6,	%g4
	tneg	%icc,	0x0
	fnands	%f12,	%f15,	%f3
	ldsb	[%l7 + 0x54],	%i1
	sra	%o5,	%l5,	%l3
	ldsh	[%l7 + 0x46],	%o4
	stx	%i7,	[%l7 + 0x20]
	movge	%icc,	%g3,	%l2
	umulcc	%o3,	0x149E,	%i3
	fbne,a	%fcc1,	loop_427
loop_427:
	fcmpgt16	%f12,	%f12,	%o0
	fble	%fcc2,	loop_428
loop_428:
	ldub	[%l7 + 0x31],	%l1
	stw	%g1,	[%l7 + 0x44]
	ldsh	[%l7 + 0x3A],	%l4
	tsubcctv	%i2,	0x0F45,	%g2
	bg,a	%xcc,	loop_429
loop_429:
	ldsh	[%l7 + 0x32],	%o1
	fcmps	%fcc0,	%f8,	%f15
	fmul8ulx16	%f4,	%f10,	%f4
	fbo	%fcc0,	loop_430
loop_430:
	std	%f14,	[%l7 + 0x68]
	movg	%xcc,	%i0,	%l6
	nop
	setx loop_431, %l0, %l1
	jmpl %l1, %i4
loop_431:
	array16	%i5,	%o6,	%i6
	sll	%o2,	%g7,	%o7
	brlz	%l0,	loop_432
loop_432:
	movg	%icc,	%g6,	%g5
	alignaddrl	%g4,	%i1,	%o5
	bgu,pn	%xcc,	loop_433
loop_433:
	brnz	%l3,	loop_434
loop_434:
	fmovda	%xcc,	%f2,	%f5
	stw	%l5,	[%l7 + 0x7C]
	alignaddr	%i7,	%o4,	%l2
	ldd	[%l7 + 0x10],	%f2
	fbe	%fcc0,	loop_435
loop_435:
	sth	%o3,	[%l7 + 0x44]
	brlz,a	%g3,	loop_436
loop_436:
	sll	%o0,	0x15,	%i3
	lduw	[%l7 + 0x5C],	%g1
	stx	%l4,	[%l7 + 0x18]
	mulx	%i2,	0x0F39,	%g2
	ldd	[%l7 + 0x70],	%f0
	andn	%l1,	%o1,	%l6
	tsubcctv	%i0,	0x1493,	%i4
	te	%xcc,	0x1
	smulcc	%i5,	0x0498,	%o6
	fmul8x16	%f0,	%f8,	%f4
	fornot1s	%f15,	%f2,	%f7
	sra	%i6,	0x18,	%g7
	tpos	%icc,	0x2
	fnot2	%f2,	%f8
	fcmpne32	%f6,	%f4,	%o7
	fmuld8sux16	%f4,	%f15,	%f6
	fpsub16s	%f14,	%f8,	%f7
	stx	%o2,	[%l7 + 0x70]
	fmovdcs	%xcc,	%f13,	%f4
	te	%icc,	0x2
	fble,a	%fcc0,	loop_437
loop_437:
	fmovdg	%icc,	%f2,	%f4
	fcmple32	%f6,	%f4,	%l0
	fsrc1s	%f14,	%f6
	tne	%icc,	0x1
	ta	%icc,	0x4
	bcs,pn	%xcc,	loop_438
loop_438:
	tleu	%icc,	0x3
	ldsb	[%l7 + 0x77],	%g5
	fors	%f8,	%f0,	%f12
	fcmpeq16	%f10,	%f2,	%g4
	fnot2s	%f15,	%f4
	call	loop_439
loop_439:
	sdivx	%g6,	0x1CFB,	%i1
	std	%f2,	[%l7 + 0x10]
	udiv	%o5,	0x1C9C,	%l5
	ldsw	[%l7 + 0x20],	%i7
	ldub	[%l7 + 0x33],	%o4
	fmovsn	%xcc,	%f1,	%f3
	fbug,a	%fcc3,	loop_440
loop_440:
	or	%l2,	0x12C7,	%l3
	fmovsg	%xcc,	%f3,	%f0
	bge,a,pn	%icc,	loop_441
loop_441:
	ta	%xcc,	0x7
	movcc	%icc,	%o3,	%o0
	tle	%xcc,	0x4
	fmovsleu	%xcc,	%f14,	%f9
	udiv	%i3,	0x0953,	%g1
	fsrc2s	%f1,	%f6
	fmovspos	%icc,	%f12,	%f10
	srlx	%g3,	0x1D,	%i2
	fmovsa	%icc,	%f11,	%f4
	ta	%icc,	0x3
	fexpand	%f6,	%f10
	nop
	setx loop_442, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_442:
	ldsw	[%l7 + 0x6C],	%g2
	movl	%xcc,	%l1,	%l4
	addcc	%l6,	%i0,	%i4
	add	%o1,	0x1CE7,	%o6
	fornot2s	%f14,	%f10,	%f8
	movpos	%icc,	%i6,	%i5
	smul	%g7,	%o7,	%l0
	fble	%fcc1,	loop_443
loop_443:
	fmovsvs	%icc,	%f7,	%f11
	fbo,a	%fcc1,	loop_444
loop_444:
	nop
	setx loop_445, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_445:
	nop
	setx loop_446, %l0, %l1
	jmpl %l1, %o2
loop_446:
	fpadd16	%f10,	%f14,	%f12
	edge8	%g4,	%g6,	%i1
	sethi	0x0D04,	%o5
	sth	%g5,	[%l7 + 0x7C]
	sth	%i7,	[%l7 + 0x0C]
	tneg	%icc,	0x5
	bpos,a	%xcc,	loop_447
loop_447:
	ldx	[%l7 + 0x08],	%l5
	fmuld8sux16	%f14,	%f13,	%f0
	ldx	[%l7 + 0x18],	%l2
	fsrc1	%f10,	%f14
	bg	%icc,	loop_448
loop_448:
	edge16	%o4,	%o3,	%o0
	fmovrsgez	%i3,	%f13,	%f7
	edge8	%l3,	%g3,	%g1
	array8	%g2,	%l1,	%l4
	edge8ln	%i2,	%l6,	%i0
	stb	%o1,	[%l7 + 0x11]
	movvs	%icc,	%i4,	%o6
	lduh	[%l7 + 0x42],	%i6
	edge32l	%i5,	%o7,	%g7
	fbue,a	%fcc0,	loop_449
loop_449:
	edge8n	%l0,	%o2,	%g4
	fbuge,a	%fcc0,	loop_450
loop_450:
	fcmpne32	%f4,	%f14,	%g6
	fandnot2	%f8,	%f4,	%f14
	fcmpgt16	%f10,	%f14,	%o5
	ldsh	[%l7 + 0x36],	%g5
	fmovsleu	%icc,	%f13,	%f13
	fpsub16	%f12,	%f8,	%f14
	fone	%f14
	fmovrdne	%i7,	%f12,	%f4
	sll	%l5,	0x10,	%i1
	ldd	[%l7 + 0x30],	%f12
	movg	%xcc,	%o4,	%o3
	fba	%fcc0,	loop_451
loop_451:
	bshuffle	%f14,	%f6,	%f6
	movne	%xcc,	%o0,	%i3
	ld	[%l7 + 0x5C],	%f14
	nop
	setx loop_452, %l0, %l1
	jmpl %l1, %l3
loop_452:
	brlez,a	%l2,	loop_453
loop_453:
	fcmpgt32	%f4,	%f8,	%g3
	ldx	[%l7 + 0x50],	%g2
	movpos	%icc,	%l1,	%g1
	sra	%i2,	%l4,	%l6
	nop
	setx loop_454, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_454:
	fbul,a	%fcc0,	loop_455
loop_455:
	fmovrdne	%i0,	%f10,	%f4
	fmovrsgz	%i4,	%f15,	%f10
	tgu	%xcc,	0x4
	fmovdvc	%xcc,	%f4,	%f14
	stw	%o1,	[%l7 + 0x34]
	bvc,a,pt	%xcc,	loop_456
loop_456:
	fmovdcs	%icc,	%f10,	%f13
	brlez	%o6,	loop_457
loop_457:
	srax	%i5,	0x0E,	%o7
	fcmpgt32	%f10,	%f10,	%g7
	nop
	setx loop_458, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_458:
	alignaddrl	%i6,	%o2,	%g4
	umulcc	%g6,	0x0E02,	%o5
	bneg,a	%xcc,	loop_459
loop_459:
	edge8	%g5,	%i7,	%l5
	movrlez	%i1,	%o4,	%o3
	stx	%l0,	[%l7 + 0x20]
	nop
	setx loop_460, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_460:
	bpos,a,pn	%xcc,	loop_461
loop_461:
	fnand	%f4,	%f14,	%f0
	siam	0x2
	edge8l	%o0,	%i3,	%l2
	umulcc	%g3,	%l3,	%l1
	fmovdvs	%xcc,	%f9,	%f13
	lduw	[%l7 + 0x2C],	%g2
	bvc	%xcc,	loop_462
loop_462:
	stw	%g1,	[%l7 + 0x20]
	fandnot1s	%f12,	%f7,	%f9
	fcmps	%fcc1,	%f7,	%f14
	subc	%i2,	%l4,	%i0
	ldsw	[%l7 + 0x54],	%l6
	movrlez	%i4,	0x355,	%o1
	pdist	%f4,	%f6,	%f10
	movrlz	%o6,	%i5,	%g7
	fnors	%f12,	%f7,	%f2
	stw	%o7,	[%l7 + 0x78]
	edge8	%i6,	%o2,	%g4
	fmovsle	%xcc,	%f14,	%f14
	fmovde	%icc,	%f7,	%f13
	addcc	%o5,	0x18BA,	%g5
	bvc,a,pn	%xcc,	loop_463
loop_463:
	movpos	%icc,	%g6,	%l5
	fbge	%fcc0,	loop_464
loop_464:
	fnot1	%f6,	%f2
	movrgez	%i7,	%i1,	%o4
	std	%f14,	[%l7 + 0x28]
	fpackfix	%f12,	%f4
	fxors	%f12,	%f4,	%f11
	ldd	[%l7 + 0x60],	%f4
	addc	%o3,	0x17F4,	%o0
	fcmpd	%fcc3,	%f10,	%f8
	fxors	%f7,	%f11,	%f2
	sllx	%i3,	0x01,	%l2
	fabss	%f7,	%f15
	fmovdcc	%xcc,	%f15,	%f4
	std	%f0,	[%l7 + 0x50]
	tgu	%icc,	0x0
	tne	%icc,	0x5
	fba	%fcc1,	loop_465
loop_465:
	tge	%icc,	0x1
	std	%f6,	[%l7 + 0x18]
	brz,a	%l0,	loop_466
loop_466:
	fnot1	%f10,	%f12
	fmovsneg	%icc,	%f15,	%f14
	fba,a	%fcc3,	loop_467
loop_467:
	ld	[%l7 + 0x4C],	%f6
	fbuge,a	%fcc0,	loop_468
loop_468:
	ldsw	[%l7 + 0x68],	%g3
	fcmple16	%f0,	%f8,	%l1
	fbug,a	%fcc1,	loop_469
loop_469:
	movre	%l3,	0x032,	%g1
	movgu	%icc,	%g2,	%l4
	fmovdne	%xcc,	%f9,	%f11
	array32	%i2,	%i0,	%l6
	movcc	%icc,	%i4,	%o1
	fmovrsgez	%o6,	%f8,	%f2
	fbne	%fcc0,	loop_470
loop_470:
	srax	%g7,	0x09,	%o7
	movre	%i6,	%o2,	%g4
	ldsw	[%l7 + 0x64],	%o5
	fmovrslez	%g5,	%f13,	%f2
	lduh	[%l7 + 0x32],	%i5
	tg	%icc,	0x1
	nop
	setx loop_471, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_471:
	tcs	%icc,	0x2
	bgu,a	%xcc,	loop_472
loop_472:
	subc	%l5,	0x08AF,	%g6
	edge8l	%i7,	%o4,	%o3
	tle	%xcc,	0x7
	be,a,pt	%xcc,	loop_473
loop_473:
	fpadd32	%f8,	%f6,	%f12
	fbu,a	%fcc2,	loop_474
loop_474:
	stw	%o0,	[%l7 + 0x40]
	edge8n	%i1,	%l2,	%l0
	lduw	[%l7 + 0x5C],	%g3
	fcmps	%fcc0,	%f4,	%f5
	fabsd	%f0,	%f14
	fbule	%fcc2,	loop_475
loop_475:
	fmovdne	%icc,	%f1,	%f12
	fbu,a	%fcc2,	loop_476
loop_476:
	fmovde	%icc,	%f9,	%f0
	fmovsn	%icc,	%f6,	%f13
	movl	%icc,	%l1,	%l3
	taddcctv	%i3,	0x1FC0,	%g1
	ldd	[%l7 + 0x60],	%f0
	fmovrdlz	%l4,	%f4,	%f2
	udiv	%i2,	0x0D07,	%g2
	edge8	%l6,	%i0,	%i4
	nop
	setx loop_477, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_477:
	edge8n	%o1,	%g7,	%o6
	stb	%o7,	[%l7 + 0x62]
	fmovdvc	%icc,	%f10,	%f1
	tgu	%icc,	0x2
	std	%f0,	[%l7 + 0x40]
	ldub	[%l7 + 0x52],	%i6
	fsrc2s	%f13,	%f5
	ldsh	[%l7 + 0x34],	%o2
	bleu,a,pt	%icc,	loop_478
loop_478:
	alignaddr	%g4,	%g5,	%i5
	fmovrslz	%o5,	%f9,	%f2
	fbuge	%fcc1,	loop_479
loop_479:
	fzeros	%f7
	fmovdneg	%xcc,	%f2,	%f0
	alignaddrl	%l5,	%i7,	%o4
	fpadd16	%f4,	%f0,	%f4
	fba,a	%fcc1,	loop_480
loop_480:
	fbne	%fcc2,	loop_481
loop_481:
	movn	%icc,	%o3,	%o0
	fmovrsgez	%i1,	%f4,	%f6
	faligndata	%f10,	%f4,	%f14
	stx	%g6,	[%l7 + 0x40]
	fpack32	%f12,	%f14,	%f4
	tpos	%icc,	0x1
	fpsub16s	%f10,	%f3,	%f8
	ld	[%l7 + 0x48],	%f4
	fbn,a	%fcc0,	loop_482
loop_482:
	edge8ln	%l2,	%l0,	%l1
	fmovscs	%icc,	%f9,	%f2
	fbge	%fcc2,	loop_483
loop_483:
	fmovsvs	%xcc,	%f8,	%f5
	sth	%g3,	[%l7 + 0x52]
	fmovdne	%icc,	%f5,	%f2
	stw	%l3,	[%l7 + 0x44]
	fmovrdgez	%i3,	%f8,	%f6
	fba,a	%fcc0,	loop_484
loop_484:
	fmovdleu	%icc,	%f15,	%f10
	edge16l	%g1,	%i2,	%l4
	fandnot1	%f2,	%f10,	%f10
	sethi	0x07F9,	%l6
	ldx	[%l7 + 0x78],	%g2
	ldsb	[%l7 + 0x15],	%i0
	fbge,a	%fcc3,	loop_485
loop_485:
	edge32l	%o1,	%i4,	%g7
	fsrc2	%f0,	%f8
	nop
	setx loop_486, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_486:
	sdivcc	%o7,	0x0E4F,	%o6
	andcc	%i6,	%g4,	%o2
	fbuge,a	%fcc3,	loop_487
loop_487:
	fmuld8ulx16	%f2,	%f13,	%f4
	mulx	%g5,	0x0431,	%o5
	fbn	%fcc2,	loop_488
loop_488:
	bcc,a	loop_489
loop_489:
	st	%f2,	[%l7 + 0x3C]
	bge,a	loop_490
loop_490:
	bn	loop_491
loop_491:
	fsrc1s	%f15,	%f8
	bvs,pt	%xcc,	loop_492
loop_492:
	fmovsgu	%icc,	%f12,	%f10
	fandnot2	%f10,	%f12,	%f10
	sra	%l5,	%i7,	%o4
	stw	%i5,	[%l7 + 0x78]
	fbule	%fcc2,	loop_493
loop_493:
	fbn,a	%fcc0,	loop_494
loop_494:
	fbug	%fcc0,	loop_495
loop_495:
	mulx	%o3,	%o0,	%g6
	fmovrsgez	%l2,	%f8,	%f11
	array8	%l0,	%l1,	%g3
	fmovrslz	%l3,	%f6,	%f2
	fmovrdgz	%i3,	%f4,	%f10
	ldd	[%l7 + 0x10],	%f2
	ldsw	[%l7 + 0x44],	%i1
	ldub	[%l7 + 0x34],	%i2
	fornot1	%f10,	%f10,	%f10
	fpadd16	%f6,	%f0,	%f14
	ldsb	[%l7 + 0x6B],	%l4
	fmul8x16au	%f2,	%f12,	%f2
	mova	%xcc,	%g1,	%l6
	ldsh	[%l7 + 0x36],	%i0
	call	loop_496
loop_496:
	fbuge	%fcc2,	loop_497
loop_497:
	bn,a	%xcc,	loop_498
loop_498:
	movrgez	%g2,	0x387,	%i4
	ta	%xcc,	0x6
	ldub	[%l7 + 0x48],	%o1
	bgu,a,pn	%icc,	loop_499
loop_499:
	bvc,pt	%icc,	loop_500
loop_500:
	movle	%xcc,	%g7,	%o6
	edge16l	%o7,	%i6,	%g4
	fxor	%f4,	%f10,	%f10
	fmovdcc	%xcc,	%f4,	%f9
	lduw	[%l7 + 0x30],	%o2
	fands	%f11,	%f7,	%f10
	movg	%xcc,	%o5,	%l5
	bl,a	loop_501
loop_501:
	fbue,a	%fcc1,	loop_502
loop_502:
	edge16ln	%i7,	%o4,	%i5
	fmovsge	%xcc,	%f13,	%f11
	fblg	%fcc0,	loop_503
loop_503:
	stx	%o3,	[%l7 + 0x18]
	fandnot2	%f12,	%f8,	%f0
	ba,pn	%xcc,	loop_504
loop_504:
	fpack16	%f0,	%f15
	sth	%o0,	[%l7 + 0x3A]
	st	%f4,	[%l7 + 0x6C]
	std	%f4,	[%l7 + 0x68]
	umulcc	%g5,	0x02BA,	%g6
	fmovrse	%l2,	%f8,	%f4
	fmovsgu	%xcc,	%f6,	%f3
	fpsub16	%f6,	%f10,	%f10
	edge16n	%l0,	%g3,	%l3
	std	%f14,	[%l7 + 0x58]
	bneg,a	%icc,	loop_505
loop_505:
	ba,a	%xcc,	loop_506
loop_506:
	te	%xcc,	0x4
	mulscc	%l1,	%i3,	%i1
	bpos,a	%xcc,	loop_507
loop_507:
	movre	%l4,	%i2,	%l6
	fandnot2s	%f11,	%f14,	%f3
	fmovdle	%icc,	%f0,	%f4
	fble	%fcc1,	loop_508
loop_508:
	movre	%g1,	0x387,	%i0
	fbue,a	%fcc2,	loop_509
loop_509:
	udivcc	%g2,	0x089D,	%o1
	tneg	%xcc,	0x0
	sub	%g7,	0x111D,	%i4
	or	%o7,	%i6,	%g4
	udivcc	%o2,	0x02D6,	%o6
	fmul8x16	%f6,	%f4,	%f10
	srax	%l5,	0x1E,	%i7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type f   	: 289
!	Type cti   	: 217
!	Type i   	: 309
!	Type l   	: 185
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
main_t2:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0xB,	%g2
	set	0x2,	%g3
	set	0xA,	%g4
	set	0x5,	%g5
	set	0xA,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x7,	%i1
	set	-0xC,	%i2
	set	-0x3,	%i3
	set	-0xE,	%i4
	set	-0x7,	%i5
	set	-0x5,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x159A7925,	%l0
	set	0x2E19AD7E,	%l1
	set	0x6E7339FE,	%l2
	set	0x159106AC,	%l3
	set	0x3942AACD,	%l4
	set	0x1C5D7066,	%l5
	set	0x71121B09,	%l6
	!# Output registers
	set	0x0C89,	%o0
	set	0x1197,	%o1
	set	-0x18D1,	%o2
	set	0x0E61,	%o3
	set	-0x067C,	%o4
	set	0x15FE,	%o5
	set	0x1FB2,	%o6
	set	0x1F28,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	bn,a,pn	%icc,	loop_510
loop_510:
	edge8	%o5,	%o4,	%o3
	tcc	%xcc,	0x1
	ldsh	[%l7 + 0x26],	%o0
	fmovdn	%icc,	%f2,	%f8
	tneg	%icc,	0x2
	movgu	%xcc,	%g5,	%g6
	lduh	[%l7 + 0x54],	%l2
	fnor	%f8,	%f6,	%f6
	umul	%l0,	%i5,	%g3
	fble	%fcc1,	loop_511
loop_511:
	bne,a,pt	%xcc,	loop_512
loop_512:
	taddcc	%l1,	%l3,	%i1
	movrgez	%l4,	0x0D5,	%i3
	ldx	[%l7 + 0x10],	%l6
	fmovrdlez	%g1,	%f12,	%f4
	bvs,a	loop_513
loop_513:
	stx	%i2,	[%l7 + 0x78]
	ble	loop_514
loop_514:
	alignaddrl	%g2,	%o1,	%g7
	fmul8x16	%f11,	%f6,	%f10
	ldsb	[%l7 + 0x3C],	%i4
	xor	%o7,	0x1F37,	%i6
	fmovsa	%xcc,	%f0,	%f3
	taddcctv	%g4,	%i0,	%o2
	udivx	%o6,	0x0530,	%l5
	ld	[%l7 + 0x44],	%f1
	fnegs	%f2,	%f2
	stx	%o5,	[%l7 + 0x20]
	fnegd	%f0,	%f14
	fmovdle	%xcc,	%f2,	%f5
	fnor	%f6,	%f2,	%f14
	movge	%xcc,	%i7,	%o4
	movn	%icc,	%o3,	%o0
	udiv	%g5,	0x1B91,	%g6
	tgu	%icc,	0x5
	fbo,a	%fcc0,	loop_515
loop_515:
	movneg	%icc,	%l0,	%i5
	udivcc	%l2,	0x0CC8,	%l1
	fmovsa	%icc,	%f14,	%f1
	edge32n	%l3,	%g3,	%i1
	orn	%l4,	0x085B,	%i3
	tne	%xcc,	0x7
	taddcc	%g1,	0x13FC,	%l6
	movleu	%xcc,	%g2,	%i2
	sdivcc	%o1,	0x1BAD,	%g7
	udiv	%o7,	0x102F,	%i6
	bcs,a	loop_516
loop_516:
	tleu	%xcc,	0x6
	fbn	%fcc2,	loop_517
loop_517:
	stx	%g4,	[%l7 + 0x68]
	andncc	%i0,	%o2,	%o6
	bl	%icc,	loop_518
loop_518:
	movge	%xcc,	%i4,	%o5
	ta	%xcc,	0x5
	movg	%xcc,	%i7,	%o4
	fmovdl	%xcc,	%f10,	%f3
	movrlez	%l5,	0x16E,	%o3
	fbge	%fcc3,	loop_519
loop_519:
	movpos	%icc,	%o0,	%g5
	fmuld8sux16	%f5,	%f8,	%f14
	addccc	%g6,	%i5,	%l2
	stw	%l0,	[%l7 + 0x1C]
	xorcc	%l1,	%g3,	%l3
	brnz	%l4,	loop_520
loop_520:
	edge16	%i1,	%g1,	%i3
	tne	%xcc,	0x5
	sra	%l6,	%g2,	%i2
	fpsub32	%f12,	%f12,	%f2
	edge32l	%o1,	%o7,	%i6
	tpos	%icc,	0x0
	movrgz	%g7,	%i0,	%g4
	tsubcctv	%o2,	0x179E,	%i4
	st	%f11,	[%l7 + 0x3C]
	fmovrsgz	%o5,	%f2,	%f11
	tge	%icc,	0x4
	ldsh	[%l7 + 0x2E],	%i7
	movrlz	%o4,	%l5,	%o6
	addcc	%o0,	0x1B5E,	%g5
	tvs	%xcc,	0x6
	std	%f12,	[%l7 + 0x30]
	tleu	%xcc,	0x3
	bpos,pn	%icc,	loop_521
loop_521:
	ba,pt	%icc,	loop_522
loop_522:
	fpadd16	%f14,	%f2,	%f4
	stw	%o3,	[%l7 + 0x44]
	andcc	%i5,	%g6,	%l2
	tleu	%icc,	0x4
	fcmpne32	%f0,	%f8,	%l0
	tne	%icc,	0x0
	lduh	[%l7 + 0x0A],	%l1
	fmul8x16au	%f4,	%f10,	%f14
	movvc	%xcc,	%l3,	%g3
	movvs	%icc,	%l4,	%g1
	lduw	[%l7 + 0x44],	%i1
	edge32	%i3,	%g2,	%l6
	fnegs	%f11,	%f11
	fbule,a	%fcc0,	loop_523
loop_523:
	edge16n	%i2,	%o1,	%o7
	sdivx	%i6,	0x17E0,	%i0
	fmovsle	%icc,	%f14,	%f9
	sth	%g4,	[%l7 + 0x66]
	fbu,a	%fcc3,	loop_524
loop_524:
	addc	%o2,	%g7,	%i4
	sdivx	%o5,	0x048C,	%o4
	edge8ln	%l5,	%o6,	%i7
	tl	%icc,	0x1
	movvs	%xcc,	%g5,	%o0
	fpadd16	%f8,	%f2,	%f0
	alignaddr	%i5,	%o3,	%l2
	srlx	%g6,	%l0,	%l1
	movn	%xcc,	%g3,	%l4
	fbue	%fcc0,	loop_525
loop_525:
	brlez	%l3,	loop_526
loop_526:
	ld	[%l7 + 0x68],	%f3
	sllx	%g1,	0x0C,	%i1
	stb	%i3,	[%l7 + 0x61]
	fmovdle	%icc,	%f7,	%f4
	srlx	%l6,	0x0E,	%g2
	subc	%i2,	0x1CE9,	%o7
	addc	%i6,	0x1318,	%i0
	edge16	%o1,	%o2,	%g7
	array8	%g4,	%i4,	%o4
	taddcc	%o5,	%o6,	%i7
	fbule	%fcc0,	loop_527
loop_527:
	sub	%l5,	0x1EB3,	%g5
	brz,a	%o0,	loop_528
loop_528:
	ldd	[%l7 + 0x78],	%f12
	fxnors	%f2,	%f14,	%f0
	edge8	%o3,	%l2,	%i5
	tn	%icc,	0x0
	taddcctv	%g6,	%l0,	%l1
	ld	[%l7 + 0x2C],	%f13
	fmovsg	%icc,	%f0,	%f5
	fpack32	%f12,	%f2,	%f10
	stb	%l4,	[%l7 + 0x67]
	mulx	%g3,	%l3,	%g1
	ldx	[%l7 + 0x58],	%i3
	andncc	%i1,	%l6,	%i2
	fba	%fcc3,	loop_529
loop_529:
	andncc	%g2,	%i6,	%i0
	array8	%o1,	%o7,	%g7
	tneg	%xcc,	0x1
	fbug	%fcc3,	loop_530
loop_530:
	movge	%icc,	%o2,	%i4
	fpsub32	%f6,	%f2,	%f10
	orcc	%g4,	%o5,	%o6
	stb	%i7,	[%l7 + 0x2F]
	tle	%xcc,	0x4
	fpsub16	%f12,	%f0,	%f10
	udivx	%l5,	0x1555,	%o4
	array32	%g5,	%o0,	%o3
	xor	%l2,	%i5,	%g6
	sdivx	%l1,	0x08DA,	%l0
	xnorcc	%l4,	0x05E9,	%l3
	xnor	%g1,	%g3,	%i3
	ble,pn	%xcc,	loop_531
loop_531:
	array8	%i1,	%l6,	%i2
	edge8	%i6,	%g2,	%i0
	fbg	%fcc3,	loop_532
loop_532:
	fmul8x16	%f13,	%f4,	%f0
	fbuge,a	%fcc0,	loop_533
loop_533:
	mova	%icc,	%o7,	%o1
	bneg,pt	%xcc,	loop_534
loop_534:
	sll	%g7,	0x0F,	%i4
	fmovdvs	%icc,	%f9,	%f2
	udivcc	%g4,	0x189E,	%o5
	fmovsn	%xcc,	%f13,	%f3
	movvc	%xcc,	%o6,	%o2
	udivcc	%i7,	0x1AE2,	%l5
	edge8n	%g5,	%o4,	%o0
	edge16ln	%o3,	%l2,	%i5
	orn	%l1,	%g6,	%l0
	fornot2s	%f9,	%f5,	%f2
	ldx	[%l7 + 0x30],	%l4
	andncc	%l3,	%g3,	%i3
	brlz	%g1,	loop_535
loop_535:
	movgu	%icc,	%l6,	%i2
	sth	%i1,	[%l7 + 0x30]
	move	%xcc,	%i6,	%i0
	fmovrdgz	%g2,	%f12,	%f8
	xnorcc	%o7,	0x154E,	%g7
	edge16ln	%i4,	%o1,	%g4
	brgez,a	%o6,	loop_536
loop_536:
	movn	%icc,	%o2,	%i7
	mulscc	%o5,	0x0BB3,	%l5
	udivx	%o4,	0x1358,	%g5
	fcmpgt32	%f12,	%f14,	%o0
	fmovdne	%icc,	%f0,	%f12
	udivx	%l2,	0x1E34,	%o3
	edge8	%l1,	%g6,	%l0
	lduw	[%l7 + 0x3C],	%i5
	srl	%l4,	%l3,	%g3
	stb	%i3,	[%l7 + 0x1B]
	movvc	%xcc,	%g1,	%l6
	ld	[%l7 + 0x5C],	%f0
	xnorcc	%i1,	0x0692,	%i2
	xor	%i0,	0x0E13,	%i6
	edge32l	%o7,	%g7,	%g2
	fmovdn	%icc,	%f12,	%f5
	ldub	[%l7 + 0x1F],	%o1
	srlx	%g4,	0x13,	%o6
	fmovscs	%icc,	%f15,	%f0
	fmovsvs	%xcc,	%f7,	%f0
	tvs	%xcc,	0x4
	bn	loop_537
loop_537:
	umul	%o2,	%i4,	%o5
	ld	[%l7 + 0x34],	%f14
	fone	%f14
	sdivx	%i7,	0x1895,	%l5
	xor	%o4,	%g5,	%l2
	mulx	%o0,	%o3,	%l1
	movg	%icc,	%g6,	%l0
	fnors	%f3,	%f2,	%f12
	fbo,a	%fcc3,	loop_538
loop_538:
	ldx	[%l7 + 0x18],	%i5
	ta	%xcc,	0x4
	srl	%l4,	%l3,	%g3
	lduh	[%l7 + 0x62],	%i3
	movrlez	%g1,	%l6,	%i1
	fmovrsgez	%i0,	%f4,	%f14
	fbg,a	%fcc3,	loop_539
loop_539:
	bcc,a	loop_540
loop_540:
	stx	%i2,	[%l7 + 0x50]
	edge8ln	%o7,	%g7,	%g2
	lduh	[%l7 + 0x08],	%o1
	tneg	%xcc,	0x0
	tvc	%icc,	0x2
	add	%i6,	%g4,	%o2
	movne	%icc,	%o6,	%i4
	fsrc1s	%f5,	%f1
	fnegs	%f12,	%f15
	udivcc	%o5,	0x1343,	%l5
	fnot2	%f6,	%f14
	fmovspos	%xcc,	%f4,	%f14
	fpack32	%f8,	%f8,	%f10
	fmovrslz	%i7,	%f12,	%f4
	tge	%icc,	0x4
	srl	%o4,	0x11,	%l2
	fba	%fcc0,	loop_541
loop_541:
	andncc	%g5,	%o3,	%o0
	fcmple16	%f4,	%f6,	%l1
	andcc	%l0,	0x1E32,	%i5
	taddcc	%g6,	%l4,	%g3
	fmovspos	%icc,	%f7,	%f13
	fsrc1s	%f6,	%f15
	fcmpes	%fcc0,	%f10,	%f12
	movcs	%xcc,	%i3,	%g1
	tcs	%icc,	0x4
	tsubcc	%l3,	%l6,	%i1
	st	%f10,	[%l7 + 0x6C]
	ta	%xcc,	0x4
	ldub	[%l7 + 0x6D],	%i2
	tne	%icc,	0x7
	movneg	%icc,	%o7,	%g7
	alignaddr	%g2,	%i0,	%i6
	mulscc	%o1,	%g4,	%o2
	bl,pt	%xcc,	loop_542
loop_542:
	edge16	%o6,	%i4,	%l5
	movle	%icc,	%o5,	%i7
	movrne	%l2,	%g5,	%o4
	fpsub16s	%f5,	%f9,	%f11
	edge8n	%o3,	%o0,	%l0
	fmovrsne	%l1,	%f15,	%f8
	tcs	%icc,	0x1
	udiv	%i5,	0x0C41,	%g6
	fbn,a	%fcc2,	loop_543
loop_543:
	edge32n	%l4,	%i3,	%g3
	fbge,a	%fcc1,	loop_544
loop_544:
	tsubcctv	%g1,	%l6,	%i1
	bgu,pt	%icc,	loop_545
loop_545:
	array32	%l3,	%i2,	%g7
	movcs	%xcc,	%g2,	%i0
	te	%icc,	0x1
	movrlz	%i6,	0x01F,	%o1
	movgu	%icc,	%g4,	%o2
	udivcc	%o7,	0x16F5,	%i4
	movrgez	%l5,	0x180,	%o6
	umulcc	%o5,	0x02DC,	%l2
	fmovdvs	%icc,	%f2,	%f7
	movle	%xcc,	%g5,	%o4
	fmovrdlez	%i7,	%f14,	%f4
	popc	%o3,	%l0
	subc	%l1,	%o0,	%g6
	sub	%l4,	0x013A,	%i5
	tge	%icc,	0x7
	bvc,a	loop_546
loop_546:
	movvc	%icc,	%i3,	%g1
	sdiv	%l6,	0x02E9,	%i1
	st	%f14,	[%l7 + 0x0C]
	brlez,a	%l3,	loop_547
loop_547:
	fbuge	%fcc0,	loop_548
loop_548:
	movneg	%icc,	%g3,	%g7
	fnot1	%f8,	%f4
	udivcc	%i2,	0x16BB,	%g2
	fmul8x16au	%f7,	%f15,	%f0
	fmovsvc	%xcc,	%f9,	%f13
	fmovs	%f14,	%f15
	ble	loop_549
loop_549:
	fmovsneg	%xcc,	%f15,	%f10
	andcc	%i6,	0x1CC1,	%o1
	edge32l	%i0,	%g4,	%o2
	addccc	%i4,	%l5,	%o6
	movg	%xcc,	%o7,	%l2
	ldsh	[%l7 + 0x0C],	%g5
	umul	%o4,	%o5,	%o3
	ta	%xcc,	0x3
	andn	%i7,	%l1,	%o0
	fbg	%fcc0,	loop_550
loop_550:
	ldsh	[%l7 + 0x28],	%g6
	movrlz	%l4,	0x0A4,	%l0
	ldub	[%l7 + 0x27],	%i5
	sllx	%i3,	0x0D,	%l6
	ldx	[%l7 + 0x50],	%i1
	fpsub32	%f10,	%f2,	%f12
	addccc	%g1,	%l3,	%g7
	taddcc	%g3,	0x07EE,	%i2
	fbuge,a	%fcc3,	loop_551
loop_551:
	st	%f13,	[%l7 + 0x5C]
	call	loop_552
loop_552:
	tle	%xcc,	0x7
	andcc	%i6,	%o1,	%i0
	ldsw	[%l7 + 0x60],	%g2
	ldsb	[%l7 + 0x25],	%o2
	sdivcc	%g4,	0x12C5,	%i4
	fpadd32	%f10,	%f4,	%f14
	addc	%l5,	%o7,	%o6
	fmovsl	%icc,	%f9,	%f6
	brlz	%g5,	loop_553
loop_553:
	fxnors	%f2,	%f5,	%f14
	mulscc	%l2,	%o4,	%o5
	movl	%xcc,	%i7,	%l1
	subccc	%o3,	%g6,	%l4
	movne	%xcc,	%l0,	%o0
	movre	%i3,	0x175,	%i5
	srax	%i1,	0x10,	%g1
	movneg	%icc,	%l3,	%l6
	tvs	%icc,	0x5
	sub	%g7,	%i2,	%g3
	fnot1s	%f7,	%f8
	tg	%xcc,	0x4
	fsrc1s	%f4,	%f15
	ldsh	[%l7 + 0x50],	%i6
	edge8n	%o1,	%i0,	%g2
	ldd	[%l7 + 0x08],	%f8
	bpos,pn	%xcc,	loop_554
loop_554:
	fbuge,a	%fcc3,	loop_555
loop_555:
	stx	%o2,	[%l7 + 0x20]
	sdiv	%i4,	0x11C2,	%l5
	addc	%o7,	%g4,	%o6
	udivcc	%l2,	0x1843,	%g5
	ld	[%l7 + 0x30],	%f11
	sethi	0x0ADE,	%o4
	sub	%i7,	0x17C0,	%o5
	fmul8x16al	%f11,	%f9,	%f14
	bne,a	loop_556
loop_556:
	sdivx	%l1,	0x1E7F,	%o3
	stb	%g6,	[%l7 + 0x2C]
	movpos	%icc,	%l4,	%o0
	tsubcc	%l0,	0x1594,	%i5
	fmovse	%xcc,	%f0,	%f5
	edge16ln	%i1,	%i3,	%l3
	tsubcctv	%l6,	0x1B29,	%g7
	sdivcc	%g1,	0x1B58,	%i2
	fcmple16	%f2,	%f2,	%g3
	fbg	%fcc2,	loop_557
loop_557:
	alignaddr	%i6,	%o1,	%g2
	fmovsg	%icc,	%f10,	%f4
	fnands	%f5,	%f6,	%f10
	umulcc	%o2,	0x160E,	%i4
	ldub	[%l7 + 0x74],	%i0
	addc	%o7,	%l5,	%g4
	movg	%icc,	%l2,	%g5
	sethi	0x140F,	%o6
	lduh	[%l7 + 0x42],	%i7
	movneg	%icc,	%o5,	%l1
	tvs	%xcc,	0x7
	tvs	%xcc,	0x1
	array16	%o4,	%g6,	%o3
	udivx	%o0,	0x1377,	%l4
	srl	%l0,	0x1F,	%i5
	udivcc	%i3,	0x080F,	%i1
	movcs	%xcc,	%l6,	%l3
	fmovrsgez	%g1,	%f8,	%f8
	fcmps	%fcc1,	%f13,	%f2
	mulx	%i2,	0x1FE0,	%g3
	mova	%icc,	%g7,	%o1
	sth	%i6,	[%l7 + 0x54]
	fbg	%fcc1,	loop_558
loop_558:
	fand	%f10,	%f0,	%f6
	array8	%o2,	%g2,	%i0
	smul	%i4,	%l5,	%g4
	bge,a,pn	%xcc,	loop_559
loop_559:
	movvc	%xcc,	%l2,	%g5
	tn	%xcc,	0x1
	std	%f2,	[%l7 + 0x70]
	umul	%o6,	0x1AB7,	%o7
	fxnor	%f6,	%f12,	%f12
	udiv	%i7,	0x0759,	%o5
	fones	%f10
	tvs	%xcc,	0x5
	fbu	%fcc1,	loop_560
loop_560:
	move	%icc,	%l1,	%g6
	edge32	%o3,	%o4,	%o0
	umul	%l0,	%l4,	%i3
	tge	%xcc,	0x4
	ldsb	[%l7 + 0x1F],	%i1
	ta	%xcc,	0x0
	tsubcc	%i5,	0x1926,	%l3
	ldsh	[%l7 + 0x2C],	%l6
	bshuffle	%f8,	%f14,	%f0
	ldx	[%l7 + 0x58],	%g1
	ldsh	[%l7 + 0x28],	%i2
	fmovrdgez	%g3,	%f4,	%f0
	smulcc	%g7,	0x1BCE,	%i6
	ldx	[%l7 + 0x60],	%o2
	array32	%o1,	%g2,	%i0
	fmovdne	%icc,	%f14,	%f9
	alignaddr	%i4,	%g4,	%l2
	addcc	%g5,	0x05B6,	%o6
	tvc	%icc,	0x5
	edge16	%l5,	%o7,	%i7
	addcc	%o5,	%g6,	%o3
	tvs	%xcc,	0x3
	fpack32	%f2,	%f14,	%f14
	fmovsle	%icc,	%f15,	%f6
	brgez	%l1,	loop_561
loop_561:
	te	%icc,	0x6
	movrgz	%o0,	0x1F0,	%o4
	tne	%xcc,	0x3
	tg	%xcc,	0x6
	fmovs	%f5,	%f13
	taddcc	%l0,	0x0244,	%l4
	movg	%xcc,	%i3,	%i5
	movg	%icc,	%l3,	%l6
	stx	%i1,	[%l7 + 0x10]
	bcs,a,pt	%icc,	loop_562
loop_562:
	edge16l	%g1,	%i2,	%g7
	fbo,a	%fcc2,	loop_563
loop_563:
	bne,pn	%icc,	loop_564
loop_564:
	bl,a	%icc,	loop_565
loop_565:
	movcc	%icc,	%i6,	%o2
	sll	%o1,	0x1E,	%g2
	fmovda	%xcc,	%f2,	%f2
	fmovs	%f6,	%f1
	srax	%g3,	%i4,	%g4
	ldub	[%l7 + 0x3F],	%i0
	fmovsge	%xcc,	%f8,	%f3
	xnorcc	%l2,	%g5,	%o6
	fmovscc	%icc,	%f1,	%f5
	movrgz	%l5,	0x2D1,	%i7
	sth	%o7,	[%l7 + 0x36]
	stb	%o5,	[%l7 + 0x77]
	fmovscc	%icc,	%f5,	%f4
	sub	%o3,	%l1,	%g6
	fmovsl	%icc,	%f6,	%f1
	udivcc	%o4,	0x18BE,	%o0
	smul	%l0,	%i3,	%i5
	be,a	loop_566
loop_566:
	fpsub16s	%f11,	%f14,	%f10
	and	%l4,	0x12D8,	%l6
	nop
	setx loop_567, %l0, %l1
	jmpl %l1, %i1
loop_567:
	tvs	%icc,	0x0
	ta	%icc,	0x1
	fbul,a	%fcc3,	loop_568
loop_568:
	fmovsge	%icc,	%f8,	%f2
	fmovrdlez	%l3,	%f14,	%f2
	smul	%g1,	%g7,	%i6
	movrlz	%o2,	0x0AD,	%i2
	tpos	%xcc,	0x0
	edge32l	%g2,	%g3,	%o1
	ldd	[%l7 + 0x58],	%f12
	tne	%icc,	0x2
	movle	%icc,	%g4,	%i4
	edge16l	%l2,	%g5,	%o6
	sethi	0x10F2,	%l5
	alignaddr	%i7,	%i0,	%o7
	ble,a	loop_569
loop_569:
	fmovda	%xcc,	%f8,	%f0
	bvs,a	%icc,	loop_570
loop_570:
	sth	%o5,	[%l7 + 0x4A]
	stw	%o3,	[%l7 + 0x18]
	ldd	[%l7 + 0x20],	%f4
	sllx	%g6,	0x02,	%o4
	fcmpne16	%f2,	%f14,	%l1
	movvc	%icc,	%o0,	%l0
	subcc	%i5,	0x1732,	%l4
	subc	%l6,	%i1,	%i3
	fmovs	%f11,	%f2
	edge8l	%l3,	%g1,	%g7
	array16	%i6,	%i2,	%g2
	tgu	%xcc,	0x4
	movvs	%xcc,	%o2,	%o1
	fandnot2	%f10,	%f2,	%f0
	ldsh	[%l7 + 0x52],	%g3
	stx	%g4,	[%l7 + 0x48]
	addc	%l2,	%i4,	%o6
	fmovse	%icc,	%f9,	%f14
	sub	%g5,	%l5,	%i7
	fnot1	%f4,	%f8
	umulcc	%o7,	%i0,	%o5
	ldub	[%l7 + 0x50],	%g6
	bneg,a	%icc,	loop_571
loop_571:
	edge32	%o3,	%l1,	%o0
	tpos	%xcc,	0x7
	smul	%o4,	%i5,	%l4
	stb	%l0,	[%l7 + 0x09]
	stb	%i1,	[%l7 + 0x63]
	movge	%xcc,	%l6,	%l3
	std	%f0,	[%l7 + 0x50]
	sub	%g1,	0x0662,	%i3
	fmovsge	%xcc,	%f15,	%f4
	sdiv	%g7,	0x0129,	%i6
	nop
	setx loop_572, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_572:
	fmul8sux16	%f0,	%f2,	%f14
	fbo,a	%fcc0,	loop_573
loop_573:
	alignaddrl	%i2,	%g2,	%o1
	tne	%icc,	0x1
	sra	%g3,	0x0D,	%g4
	movrlez	%o2,	%i4,	%o6
	tg	%icc,	0x6
	movcs	%icc,	%l2,	%g5
	edge16l	%l5,	%o7,	%i0
	tleu	%icc,	0x2
	bneg,a,pn	%xcc,	loop_574
loop_574:
	mova	%icc,	%i7,	%o5
	array8	%o3,	%g6,	%o0
	fmovse	%xcc,	%f3,	%f0
	ldsb	[%l7 + 0x65],	%o4
	bvc,a	loop_575
loop_575:
	fnand	%f4,	%f4,	%f10
	tsubcctv	%i5,	%l4,	%l0
	movle	%icc,	%l1,	%l6
	ldsw	[%l7 + 0x58],	%i1
	tne	%xcc,	0x4
	call	loop_576
loop_576:
	orcc	%g1,	0x17C0,	%l3
	std	%f14,	[%l7 + 0x10]
	tne	%xcc,	0x4
	xor	%i3,	%g7,	%i6
	edge32n	%g2,	%o1,	%g3
	sra	%g4,	%i2,	%o2
	sth	%o6,	[%l7 + 0x10]
	andcc	%i4,	0x0E2E,	%l2
	st	%f11,	[%l7 + 0x20]
	sdiv	%g5,	0x1A99,	%l5
	ldd	[%l7 + 0x08],	%f2
	xnorcc	%i0,	0x05D0,	%o7
	movvs	%icc,	%i7,	%o3
	xnorcc	%g6,	%o0,	%o4
	mulx	%i5,	%o5,	%l4
	fmovsge	%icc,	%f6,	%f12
	fpsub32	%f14,	%f0,	%f10
	fmul8x16	%f14,	%f2,	%f8
	tsubcc	%l1,	%l6,	%i1
	movcs	%icc,	%g1,	%l0
	bge,a	%xcc,	loop_577
loop_577:
	tcc	%xcc,	0x4
	bneg,a,pt	%icc,	loop_578
loop_578:
	fcmpd	%fcc1,	%f4,	%f0
	orn	%l3,	0x1C75,	%g7
	tg	%icc,	0x0
	ldsb	[%l7 + 0x56],	%i6
	udivx	%g2,	0x1D2D,	%i3
	addc	%o1,	%g4,	%i2
	edge8l	%g3,	%o2,	%i4
	add	%o6,	%g5,	%l2
	fbug	%fcc1,	loop_579
loop_579:
	ld	[%l7 + 0x48],	%f14
	fsrc1	%f14,	%f2
	fpackfix	%f0,	%f13
	fpmerge	%f14,	%f13,	%f12
	fmovdg	%icc,	%f5,	%f3
	alignaddr	%i0,	%o7,	%i7
	tl	%icc,	0x1
	movpos	%xcc,	%o3,	%l5
	alignaddr	%g6,	%o0,	%o4
	fbul,a	%fcc2,	loop_580
loop_580:
	ba,a,pt	%icc,	loop_581
loop_581:
	edge16l	%i5,	%l4,	%l1
	add	%l6,	%o5,	%i1
	edge16n	%g1,	%l0,	%l3
	sdivx	%i6,	0x0105,	%g7
	xor	%i3,	0x0F00,	%g2
	fmovrslz	%o1,	%f14,	%f9
	te	%xcc,	0x5
	srl	%g4,	%i2,	%o2
	andncc	%g3,	%i4,	%o6
	fbul	%fcc2,	loop_582
loop_582:
	stb	%l2,	[%l7 + 0x08]
	edge32n	%g5,	%o7,	%i7
	mova	%icc,	%o3,	%l5
	nop
	setx loop_583, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_583:
	andn	%g6,	0x126E,	%o0
	fmul8sux16	%f2,	%f12,	%f4
	sllx	%o4,	0x1F,	%i5
	tcs	%xcc,	0x5
	fbg	%fcc2,	loop_584
loop_584:
	edge16	%i0,	%l4,	%l1
	edge8n	%o5,	%l6,	%g1
	fbg,a	%fcc0,	loop_585
loop_585:
	movn	%icc,	%i1,	%l3
	array8	%l0,	%g7,	%i3
	brlz	%g2,	loop_586
loop_586:
	edge8n	%o1,	%g4,	%i2
	fnors	%f6,	%f2,	%f3
	ldd	[%l7 + 0x40],	%f6
	st	%f9,	[%l7 + 0x7C]
	fbl	%fcc3,	loop_587
loop_587:
	ta	%xcc,	0x2
	movvc	%xcc,	%o2,	%i6
	sllx	%i4,	0x06,	%g3
	or	%o6,	0x0F49,	%g5
	fba	%fcc2,	loop_588
loop_588:
	sdiv	%l2,	0x02A0,	%i7
	movcs	%icc,	%o3,	%o7
	fbug,a	%fcc1,	loop_589
loop_589:
	tvc	%xcc,	0x5
	fpsub32s	%f12,	%f9,	%f8
	ld	[%l7 + 0x08],	%f5
	fpadd16	%f4,	%f10,	%f8
	siam	0x6
	addcc	%g6,	%l5,	%o4
	ldx	[%l7 + 0x20],	%o0
	fmovrsne	%i5,	%f9,	%f11
	udiv	%i0,	0x1E49,	%l1
	addccc	%o5,	0x03D0,	%l4
	edge32l	%g1,	%l6,	%i1
	andn	%l0,	0x1C87,	%l3
	ldsh	[%l7 + 0x08],	%g7
	sdivcc	%g2,	0x1975,	%i3
	alignaddr	%g4,	%i2,	%o1
	tsubcc	%i6,	%o2,	%i4
	edge8l	%o6,	%g5,	%l2
	std	%f0,	[%l7 + 0x60]
	bcs,a	%icc,	loop_590
loop_590:
	tcc	%icc,	0x3
	lduh	[%l7 + 0x6A],	%g3
	srl	%o3,	%o7,	%g6
	sub	%l5,	0x17F1,	%o4
	fmovdne	%icc,	%f8,	%f10
	and	%o0,	0x0388,	%i5
	xnorcc	%i7,	0x13D5,	%l1
	movg	%icc,	%i0,	%l4
	tn	%icc,	0x7
	mulscc	%o5,	0x03E8,	%g1
	brlez	%i1,	loop_591
loop_591:
	fsrc2s	%f13,	%f0
	and	%l0,	%l3,	%g7
	bl,a,pn	%xcc,	loop_592
loop_592:
	stw	%g2,	[%l7 + 0x24]
	siam	0x0
	fornot1	%f12,	%f12,	%f12
	bvs	loop_593
loop_593:
	fxor	%f4,	%f8,	%f10
	fandnot2	%f14,	%f2,	%f8
	sethi	0x1E37,	%l6
	ldsb	[%l7 + 0x7C],	%i3
	movpos	%icc,	%g4,	%i2
	fmovdg	%icc,	%f15,	%f6
	ldub	[%l7 + 0x47],	%o1
	move	%icc,	%i6,	%o2
	for	%f12,	%f14,	%f12
	movle	%icc,	%i4,	%o6
	sll	%g5,	0x04,	%l2
	edge16	%o3,	%g3,	%g6
	bne	loop_594
loop_594:
	popc	0x1413,	%l5
	fxnor	%f0,	%f14,	%f14
	stb	%o7,	[%l7 + 0x54]
	movne	%xcc,	%o0,	%o4
	for	%f12,	%f8,	%f0
	srax	%i7,	%i5,	%i0
	edge16ln	%l1,	%o5,	%l4
	smulcc	%i1,	%l0,	%l3
	bg	loop_595
loop_595:
	fornot1	%f6,	%f6,	%f8
	orncc	%g1,	%g7,	%g2
	srlx	%l6,	%g4,	%i2
	fnot2	%f8,	%f2
	fcmped	%fcc3,	%f14,	%f4
	alignaddrl	%i3,	%o1,	%i6
	bneg,pt	%icc,	loop_596
loop_596:
	tl	%xcc,	0x3
	movleu	%icc,	%i4,	%o2
	fabsd	%f4,	%f0
	bvs	%xcc,	loop_597
loop_597:
	call	loop_598
loop_598:
	orcc	%o6,	%g5,	%l2
	movle	%xcc,	%g3,	%o3
	edge8l	%g6,	%l5,	%o7
	udiv	%o4,	0x076F,	%i7
	fmovrsne	%o0,	%f1,	%f13
	orncc	%i0,	%l1,	%i5
	fmul8ulx16	%f14,	%f4,	%f2
	lduw	[%l7 + 0x58],	%l4
	fmul8x16al	%f4,	%f5,	%f4
	udivcc	%i1,	0x1BF1,	%l0
	movrgez	%o5,	0x0F4,	%g1
	fnands	%f5,	%f4,	%f6
	srax	%g7,	%g2,	%l3
	brlez,a	%g4,	loop_599
loop_599:
	movre	%l6,	0x1C1,	%i3
	movn	%xcc,	%i2,	%o1
	fpsub16s	%f3,	%f8,	%f8
	ldsb	[%l7 + 0x5C],	%i4
	ldsb	[%l7 + 0x35],	%o2
	andn	%i6,	%g5,	%l2
	ldx	[%l7 + 0x28],	%g3
	udiv	%o6,	0x1D8F,	%o3
	stb	%l5,	[%l7 + 0x25]
	movre	%g6,	0x101,	%o7
	edge16	%i7,	%o4,	%o0
	fxnors	%f1,	%f0,	%f4
	movle	%xcc,	%i0,	%l1
	sub	%l4,	0x118F,	%i1
	subcc	%l0,	%i5,	%g1
	fmovrsgez	%g7,	%f4,	%f6
	movl	%icc,	%g2,	%l3
	movg	%icc,	%o5,	%l6
	tne	%icc,	0x5
	movrgz	%g4,	0x11F,	%i3
	fnor	%f8,	%f4,	%f14
	fmovdvs	%icc,	%f3,	%f0
	fmovrse	%o1,	%f7,	%f2
	sub	%i2,	%o2,	%i6
	alignaddrl	%i4,	%l2,	%g5
	array16	%o6,	%o3,	%l5
	fsrc1s	%f12,	%f11
	fsrc2s	%f1,	%f15
	brnz,a	%g3,	loop_600
loop_600:
	fmovs	%f3,	%f8
	sdiv	%g6,	0x0220,	%i7
	sdiv	%o7,	0x0C3F,	%o0
	edge32l	%o4,	%i0,	%l4
	tneg	%icc,	0x1
	bge,a	loop_601
loop_601:
	fpadd16s	%f4,	%f10,	%f14
	array32	%i1,	%l1,	%l0
	xnorcc	%g1,	0x11A4,	%i5
	fzero	%f10
	brlez,a	%g7,	loop_602
loop_602:
	fxors	%f9,	%f10,	%f7
	mulx	%l3,	0x1962,	%o5
	st	%f7,	[%l7 + 0x3C]
	orcc	%l6,	%g2,	%g4
	ta	%icc,	0x7
	tg	%xcc,	0x7
	sra	%o1,	%i2,	%o2
	fpack16	%f4,	%f12
	umul	%i6,	%i3,	%l2
	movne	%xcc,	%g5,	%i4
	movvs	%icc,	%o3,	%l5
	bpos	loop_603
loop_603:
	ldx	[%l7 + 0x68],	%o6
	fbe	%fcc2,	loop_604
loop_604:
	udiv	%g3,	0x08C9,	%i7
	tle	%xcc,	0x6
	movle	%icc,	%o7,	%o0
	ldd	[%l7 + 0x18],	%f10
	std	%f12,	[%l7 + 0x48]
	orn	%o4,	%i0,	%g6
	srax	%l4,	0x1F,	%i1
	orn	%l0,	%g1,	%i5
	tne	%icc,	0x5
	stw	%g7,	[%l7 + 0x4C]
	ldx	[%l7 + 0x50],	%l1
	stb	%o5,	[%l7 + 0x3D]
	movg	%icc,	%l3,	%l6
	fmovdvs	%xcc,	%f9,	%f0
	st	%f0,	[%l7 + 0x0C]
	andn	%g4,	%o1,	%i2
	nop
	setx loop_605, %l0, %l1
	jmpl %l1, %g2
loop_605:
	fmovd	%f0,	%f10
	tgu	%icc,	0x1
	move	%icc,	%i6,	%i3
	movge	%icc,	%o2,	%l2
	udiv	%g5,	0x0B25,	%o3
	fbn	%fcc3,	loop_606
loop_606:
	array8	%l5,	%i4,	%g3
	lduh	[%l7 + 0x20],	%o6
	fbne,a	%fcc2,	loop_607
loop_607:
	xnorcc	%i7,	0x16EC,	%o0
	edge8l	%o4,	%i0,	%o7
	stw	%g6,	[%l7 + 0x78]
	ldx	[%l7 + 0x50],	%i1
	ldx	[%l7 + 0x30],	%l0
	edge8ln	%l4,	%g1,	%g7
	tsubcctv	%l1,	0x003D,	%i5
	fornot1	%f2,	%f10,	%f2
	fxnor	%f12,	%f2,	%f0
	movl	%xcc,	%o5,	%l3
	edge32ln	%l6,	%o1,	%i2
	lduw	[%l7 + 0x3C],	%g2
	edge8ln	%g4,	%i3,	%i6
	fabsd	%f14,	%f12
	edge32ln	%l2,	%g5,	%o2
	xorcc	%l5,	%i4,	%o3
	tvc	%icc,	0x4
	fpsub16	%f2,	%f14,	%f10
	tvs	%xcc,	0x6
	fnot2s	%f5,	%f9
	stx	%o6,	[%l7 + 0x30]
	bge	%xcc,	loop_608
loop_608:
	srlx	%i7,	0x1D,	%g3
	smul	%o0,	0x1198,	%o4
	movg	%icc,	%o7,	%i0
	movrgez	%i1,	%g6,	%l4
	fmovrde	%g1,	%f8,	%f6
	lduw	[%l7 + 0x48],	%g7
	movge	%xcc,	%l1,	%i5
	nop
	setx loop_609, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_609:
	move	%icc,	%l0,	%o5
	bl,a	%icc,	loop_610
loop_610:
	tsubcctv	%l6,	0x0A45,	%o1
	stx	%l3,	[%l7 + 0x60]
	ldx	[%l7 + 0x28],	%i2
	fandnot1s	%f15,	%f10,	%f0
	sub	%g4,	%i3,	%i6
	fmovdvs	%xcc,	%f14,	%f3
	edge8n	%l2,	%g2,	%g5
	tle	%xcc,	0x3
	edge16ln	%o2,	%i4,	%l5
	smulcc	%o6,	%i7,	%o3
	srl	%o0,	0x14,	%o4
	fmovd	%f10,	%f0
	ba,pn	%xcc,	loop_611
loop_611:
	tvs	%xcc,	0x4
	taddcc	%o7,	%g3,	%i0
	andcc	%g6,	0x1D33,	%l4
	sll	%g1,	0x18,	%i1
	taddcctv	%g7,	%i5,	%l1
	movle	%xcc,	%l0,	%o5
	fmovdl	%xcc,	%f15,	%f15
	array32	%o1,	%l3,	%l6
	edge32l	%g4,	%i2,	%i3
	fcmpeq16	%f4,	%f14,	%l2
	umulcc	%g2,	0x02A9,	%i6
	sdivcc	%o2,	0x0971,	%i4
	andn	%l5,	%g5,	%o6
	pdist	%f8,	%f14,	%f14
	movcc	%icc,	%i7,	%o3
	fcmpeq32	%f10,	%f12,	%o0
	fmovrdlz	%o7,	%f12,	%f8
	fbul	%fcc3,	loop_612
loop_612:
	fcmple32	%f8,	%f8,	%g3
	tcs	%xcc,	0x1
	xor	%o4,	0x1EF6,	%g6
	addccc	%l4,	0x1CE2,	%g1
	tl	%icc,	0x6
	bvs,a,pn	%xcc,	loop_613
loop_613:
	xorcc	%i0,	0x02B4,	%g7
	sdiv	%i1,	0x1289,	%i5
	or	%l0,	%o5,	%l1
	be,a,pt	%xcc,	loop_614
loop_614:
	fcmps	%fcc2,	%f4,	%f14
	edge8	%l3,	%l6,	%o1
	stx	%i2,	[%l7 + 0x08]
	addccc	%g4,	0x0B2A,	%l2
	srl	%g2,	%i6,	%i3
	fbu	%fcc1,	loop_615
loop_615:
	bvs,pn	%xcc,	loop_616
loop_616:
	st	%f5,	[%l7 + 0x44]
	udivcc	%o2,	0x06A1,	%i4
	ldx	[%l7 + 0x48],	%l5
	brgez,a	%o6,	loop_617
loop_617:
	tcs	%xcc,	0x1
	andcc	%i7,	%o3,	%o0
	ldd	[%l7 + 0x40],	%f0
	bn,a	loop_618
loop_618:
	fmovrdlez	%o7,	%f8,	%f14
	srlx	%g5,	0x13,	%o4
	movneg	%xcc,	%g3,	%l4
	tpos	%xcc,	0x7
	fors	%f6,	%f3,	%f8
	ldub	[%l7 + 0x4B],	%g6
	tcs	%icc,	0x3
	smulcc	%g1,	%i0,	%i1
	subc	%g7,	0x19E7,	%i5
	te	%icc,	0x1
	edge8l	%l0,	%l1,	%l3
	xor	%o5,	0x125A,	%l6
	fmovsne	%xcc,	%f1,	%f7
	fmuld8sux16	%f7,	%f15,	%f14
	tn	%icc,	0x1
	fmovdle	%icc,	%f12,	%f2
	addc	%o1,	0x0585,	%g4
	movn	%icc,	%l2,	%g2
	stx	%i6,	[%l7 + 0x38]
	tg	%icc,	0x6
	or	%i3,	0x0516,	%o2
	and	%i2,	0x1B96,	%i4
	tsubcctv	%o6,	%i7,	%l5
	fmovrdlez	%o0,	%f6,	%f10
	fmovrdlz	%o3,	%f14,	%f12
	sub	%o7,	0x11FF,	%g5
	sll	%g3,	%l4,	%g6
	fandnot1	%f6,	%f14,	%f6
	andn	%o4,	0x0D0D,	%g1
	bl,a	loop_619
loop_619:
	taddcc	%i0,	%i1,	%g7
	sllx	%i5,	%l1,	%l0
	fandnot1s	%f12,	%f7,	%f12
	fmovs	%f10,	%f0
	fcmpne16	%f0,	%f6,	%o5
	umul	%l3,	%o1,	%l6
	add	%g4,	%g2,	%i6
	subccc	%l2,	%i3,	%i2
	addc	%i4,	%o6,	%o2
	movl	%icc,	%l5,	%i7
	movleu	%icc,	%o0,	%o7
	fsrc2s	%f9,	%f0
	movl	%icc,	%o3,	%g3
	tne	%xcc,	0x2
	stw	%l4,	[%l7 + 0x4C]
	tn	%icc,	0x4
	sth	%g6,	[%l7 + 0x56]
	sethi	0x06C5,	%g5
	orcc	%o4,	%g1,	%i0
	tsubcc	%g7,	0x13B0,	%i5
	edge32ln	%i1,	%l1,	%o5
	ld	[%l7 + 0x20],	%f11
	edge32	%l3,	%o1,	%l0
	fornot2	%f10,	%f14,	%f2
	alignaddr	%l6,	%g4,	%g2
	stb	%l2,	[%l7 + 0x41]
	fbn	%fcc0,	loop_620
loop_620:
	fmovrdgez	%i6,	%f6,	%f12
	movneg	%xcc,	%i3,	%i4
	fmovdge	%icc,	%f8,	%f11
	andcc	%i2,	%o6,	%o2
	movre	%l5,	%i7,	%o0
	movvc	%xcc,	%o7,	%g3
	brnz	%l4,	loop_621
loop_621:
	edge16l	%o3,	%g5,	%o4
	udivcc	%g1,	0x08F0,	%g6
	fpmerge	%f2,	%f10,	%f8
	bshuffle	%f14,	%f2,	%f4
	andcc	%i0,	%i5,	%i1
	sub	%l1,	%g7,	%l3
	movg	%xcc,	%o5,	%l0
	st	%f4,	[%l7 + 0x3C]
	edge16	%l6,	%g4,	%g2
	fmovscc	%icc,	%f8,	%f15
	brlz	%o1,	loop_622
loop_622:
	fornot2	%f10,	%f2,	%f6
	edge8n	%i6,	%i3,	%i4
	stw	%i2,	[%l7 + 0x20]
	tpos	%icc,	0x7
	st	%f13,	[%l7 + 0x44]
	tcs	%xcc,	0x3
	fpadd16	%f0,	%f14,	%f6
	sethi	0x0335,	%l2
	fpack32	%f4,	%f10,	%f12
	tl	%xcc,	0x7
	edge8	%o6,	%l5,	%o2
	fbl,a	%fcc1,	loop_623
loop_623:
	bvc,a,pt	%xcc,	loop_624
loop_624:
	movneg	%icc,	%i7,	%o0
	fbe,a	%fcc2,	loop_625
loop_625:
	srax	%o7,	%g3,	%o3
	tn	%xcc,	0x0
	fmovsn	%icc,	%f13,	%f1
	sllx	%g5,	0x0B,	%o4
	call	loop_626
loop_626:
	bvc,pn	%xcc,	loop_627
loop_627:
	orn	%l4,	0x0CE6,	%g6
	udiv	%i0,	0x00DC,	%g1
	fmovdleu	%xcc,	%f3,	%f1
	movleu	%xcc,	%i5,	%l1
	tsubcc	%i1,	0x18BB,	%g7
	sllx	%o5,	0x00,	%l0
	tne	%xcc,	0x3
	edge16ln	%l6,	%l3,	%g2
	stx	%o1,	[%l7 + 0x08]
	tge	%icc,	0x0
	addccc	%i6,	%g4,	%i3
	fmul8x16	%f0,	%f14,	%f8
	udivx	%i4,	0x0CD1,	%l2
	and	%o6,	%i2,	%o2
	movrgez	%l5,	0x275,	%i7
	tcc	%xcc,	0x5
	bcc,a	loop_628
loop_628:
	fpadd32	%f12,	%f14,	%f0
	fnot1s	%f1,	%f2
	tcc	%icc,	0x1
	movrlz	%o0,	0x305,	%g3
	ldsw	[%l7 + 0x34],	%o3
	lduh	[%l7 + 0x0E],	%g5
	tgu	%xcc,	0x4
	fcmpne32	%f0,	%f0,	%o7
	stw	%l4,	[%l7 + 0x7C]
	sdivcc	%g6,	0x031D,	%i0
	fmovdle	%icc,	%f15,	%f2
	xor	%g1,	%i5,	%o4
	fmovdcs	%icc,	%f0,	%f0
	movpos	%icc,	%l1,	%i1
	ble	loop_629
loop_629:
	srlx	%g7,	0x1F,	%o5
	brgez,a	%l6,	loop_630
loop_630:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type f   	: 192
!	Type i   	: 556
!	Type cti   	: 121
!	Type l   	: 131
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
main_t3:

	!# Initialize registers ..

	!# Global registers
	set	0x4,	%g1
	set	0xE,	%g2
	set	0x5,	%g3
	set	0x6,	%g4
	set	0x8,	%g5
	set	0x2,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xB,	%i1
	set	-0x9,	%i2
	set	-0xD,	%i3
	set	-0xC,	%i4
	set	-0x5,	%i5
	set	-0xC,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x72DBB874,	%l0
	set	0x612AEBD6,	%l1
	set	0x197D1A86,	%l2
	set	0x2F641483,	%l3
	set	0x2DACA623,	%l4
	set	0x2FA695FB,	%l5
	set	0x628F867D,	%l6
	!# Output registers
	set	-0x17F2,	%o0
	set	0x1F43,	%o1
	set	0x1264,	%o2
	set	-0x1C26,	%o3
	set	-0x1A7F,	%o4
	set	-0x0BCB,	%o5
	set	0x0C31,	%o6
	set	0x1A05,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	xor	%l3,	0x06F1,	%g2
	fmul8ulx16	%f10,	%f0,	%f2
	fmuld8sux16	%f15,	%f11,	%f8
	tpos	%icc,	0x0
	fpadd16	%f0,	%f6,	%f8
	fnegs	%f0,	%f14
	fmul8x16	%f9,	%f10,	%f0
	fmovrslz	%o1,	%f8,	%f11
	fmovspos	%xcc,	%f1,	%f13
	bvc,pn	%xcc,	loop_631
loop_631:
	sllx	%i6,	%g4,	%i3
	fpadd32	%f2,	%f2,	%f14
	fand	%f2,	%f12,	%f12
	nop
	setx loop_632, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_632:
	tl	%icc,	0x7
	bne,a	%icc,	loop_633
loop_633:
	fmovdvs	%icc,	%f11,	%f14
	lduw	[%l7 + 0x70],	%i4
	fone	%f8
	bpos,pt	%xcc,	loop_634
loop_634:
	fcmps	%fcc0,	%f11,	%f12
	fmuld8ulx16	%f5,	%f15,	%f8
	fpmerge	%f11,	%f8,	%f8
	move	%xcc,	%l2,	%l0
	bge,pn	%xcc,	loop_635
loop_635:
	ldx	[%l7 + 0x58],	%i2
	fmovrslz	%o6,	%f0,	%f4
	fmovdl	%icc,	%f1,	%f7
	fmovdpos	%xcc,	%f0,	%f10
	ldd	[%l7 + 0x18],	%f10
	fmovsle	%icc,	%f6,	%f12
	fmovsleu	%xcc,	%f13,	%f5
	array8	%o2,	%l5,	%i7
	bge	loop_636
loop_636:
	fabss	%f13,	%f0
	stb	%g3,	[%l7 + 0x68]
	xor	%o3,	0x1B93,	%o0
	fmovse	%icc,	%f7,	%f15
	fsrc1	%f0,	%f2
	ldsh	[%l7 + 0x28],	%o7
	fmul8ulx16	%f0,	%f4,	%f6
	siam	0x2
	fmovdneg	%xcc,	%f10,	%f5
	fmovse	%icc,	%f15,	%f15
	fmovsg	%icc,	%f15,	%f9
	edge32	%l4,	%g6,	%g5
	mulscc	%g1,	%i0,	%o4
	brz	%l1,	loop_637
loop_637:
	fmovd	%f0,	%f6
	fmovdpos	%icc,	%f15,	%f6
	stw	%i5,	[%l7 + 0x54]
	addcc	%i1,	0x09D2,	%o5
	fbug,a	%fcc2,	loop_638
loop_638:
	tle	%icc,	0x2
	faligndata	%f6,	%f4,	%f12
	brlz,a	%l6,	loop_639
loop_639:
	brlez,a	%l3,	loop_640
loop_640:
	edge16l	%g7,	%g2,	%o1
	ta	%xcc,	0x4
	tn	%xcc,	0x5
	andcc	%i6,	0x11D4,	%g4
	ldx	[%l7 + 0x60],	%i3
	for	%f0,	%f2,	%f2
	fcmple32	%f2,	%f14,	%i4
	fmovdgu	%icc,	%f4,	%f9
	fmovrdlz	%l0,	%f0,	%f4
	edge32l	%l2,	%i2,	%o2
	fbl	%fcc3,	loop_641
loop_641:
	fmovdcs	%icc,	%f0,	%f10
	fbuge	%fcc3,	loop_642
loop_642:
	fmovscs	%xcc,	%f2,	%f3
	bne,a,pt	%xcc,	loop_643
loop_643:
	fbuge	%fcc0,	loop_644
loop_644:
	fmovdge	%icc,	%f6,	%f5
	xorcc	%l5,	%i7,	%g3
	fmovsl	%xcc,	%f13,	%f13
	fbl	%fcc2,	loop_645
loop_645:
	fmovdvc	%icc,	%f8,	%f5
	fmul8x16al	%f1,	%f0,	%f2
	fcmpne16	%f10,	%f8,	%o3
	brgez	%o0,	loop_646
loop_646:
	stw	%o7,	[%l7 + 0x48]
	movrne	%l4,	%o6,	%g6
	fmovsl	%xcc,	%f11,	%f8
	bcs	loop_647
loop_647:
	faligndata	%f4,	%f0,	%f2
	ldsb	[%l7 + 0x36],	%g5
	fmuld8sux16	%f1,	%f15,	%f4
	faligndata	%f0,	%f10,	%f8
	fmovrdne	%i0,	%f6,	%f4
	fnegs	%f8,	%f15
	fmovsge	%xcc,	%f9,	%f15
	array16	%g1,	%o4,	%i5
	movcc	%xcc,	%i1,	%l1
	edge16l	%o5,	%l3,	%g7
	fnands	%f13,	%f13,	%f14
	fbul,a	%fcc3,	loop_648
loop_648:
	fsrc1	%f0,	%f0
	fba,a	%fcc3,	loop_649
loop_649:
	fmovdcs	%xcc,	%f10,	%f11
	fmul8x16	%f10,	%f2,	%f8
	fmovscc	%xcc,	%f9,	%f1
	fpack16	%f8,	%f8
	fpadd32	%f0,	%f4,	%f12
	fmovdl	%xcc,	%f11,	%f3
	fmovsneg	%icc,	%f1,	%f7
	fbue,a	%fcc3,	loop_650
loop_650:
	fpsub32s	%f15,	%f2,	%f10
	ldsw	[%l7 + 0x20],	%g2
	fpackfix	%f12,	%f1
	fcmple32	%f12,	%f4,	%l6
	srl	%o1,	%i6,	%g4
	fmovrsgez	%i4,	%f1,	%f8
	fbl,a	%fcc3,	loop_651
loop_651:
	ld	[%l7 + 0x18],	%f0
	or	%i3,	0x1214,	%l2
	stx	%l0,	[%l7 + 0x10]
	fxor	%f10,	%f14,	%f12
	movrgez	%i2,	0x3A7,	%l5
	sth	%o2,	[%l7 + 0x70]
	fcmpes	%fcc1,	%f12,	%f0
	udivcc	%i7,	0x06FD,	%g3
	ldsh	[%l7 + 0x64],	%o0
	fmovsleu	%icc,	%f6,	%f13
	fmovdle	%xcc,	%f3,	%f4
	ble,pt	%icc,	loop_652
loop_652:
	fmovsvc	%icc,	%f9,	%f2
	and	%o7,	0x1DED,	%o3
	fmuld8ulx16	%f15,	%f7,	%f6
	ld	[%l7 + 0x20],	%f11
	fcmple32	%f10,	%f2,	%l4
	tvs	%icc,	0x1
	fones	%f14
	nop
	setx loop_653, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_653:
	bg	%icc,	loop_654
loop_654:
	ldsb	[%l7 + 0x7F],	%g6
	tneg	%xcc,	0x2
	fnot2s	%f3,	%f7
	fornot1s	%f7,	%f7,	%f1
	fmuld8sux16	%f12,	%f6,	%f10
	edge32	%g5,	%o6,	%g1
	fmul8x16al	%f7,	%f14,	%f4
	fbug,a	%fcc0,	loop_655
loop_655:
	fmovrse	%o4,	%f12,	%f7
	stx	%i5,	[%l7 + 0x28]
	edge16l	%i1,	%l1,	%i0
	fmovdcc	%icc,	%f4,	%f2
	fmovrse	%o5,	%f9,	%f10
	fpackfix	%f10,	%f9
	fxors	%f0,	%f12,	%f4
	fsrc2	%f10,	%f14
	tleu	%xcc,	0x2
	fmovdge	%xcc,	%f5,	%f1
	fmovdneg	%icc,	%f1,	%f15
	fmovsa	%icc,	%f15,	%f8
	brz,a	%g7,	loop_656
loop_656:
	st	%f0,	[%l7 + 0x78]
	fba,a	%fcc2,	loop_657
loop_657:
	sth	%g2,	[%l7 + 0x58]
	fnors	%f13,	%f14,	%f4
	bvc,pt	%xcc,	loop_658
loop_658:
	fmovsle	%xcc,	%f5,	%f15
	fcmpne32	%f8,	%f4,	%l3
	andn	%o1,	0x1C53,	%i6
	fsrc1	%f4,	%f2
	fmul8x16	%f4,	%f4,	%f10
	fmovsl	%xcc,	%f9,	%f11
	fcmple16	%f4,	%f10,	%g4
	fbo,a	%fcc2,	loop_659
loop_659:
	for	%f8,	%f8,	%f12
	fmul8sux16	%f4,	%f0,	%f12
	sth	%i4,	[%l7 + 0x20]
	fbue,a	%fcc1,	loop_660
loop_660:
	fmovdle	%icc,	%f12,	%f5
	st	%f10,	[%l7 + 0x50]
	fnor	%f0,	%f4,	%f4
	fmul8x16	%f0,	%f12,	%f0
	fxnor	%f4,	%f12,	%f14
	fbne	%fcc1,	loop_661
loop_661:
	fcmpne32	%f12,	%f12,	%l6
	fcmps	%fcc3,	%f7,	%f0
	fbl,a	%fcc3,	loop_662
loop_662:
	add	%i3,	0x10A0,	%l2
	ld	[%l7 + 0x14],	%f0
	brlz,a	%l0,	loop_663
loop_663:
	fand	%f8,	%f8,	%f6
	ld	[%l7 + 0x44],	%f13
	fmovsleu	%icc,	%f13,	%f11
	fmul8x16au	%f10,	%f9,	%f2
	nop
	setx loop_664, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_664:
	fsrc2	%f10,	%f4
	fpack16	%f14,	%f3
	st	%f10,	[%l7 + 0x40]
	fmovdn	%icc,	%f8,	%f6
	fcmpne16	%f2,	%f6,	%i2
	lduw	[%l7 + 0x24],	%o2
	fpadd32s	%f5,	%f2,	%f1
	brlez	%l5,	loop_665
loop_665:
	smul	%i7,	0x0BD4,	%g3
	bne,pt	%icc,	loop_666
loop_666:
	fandnot1	%f4,	%f8,	%f0
	fpackfix	%f4,	%f15
	addccc	%o7,	0x13BC,	%o3
	fble	%fcc1,	loop_667
loop_667:
	umul	%l4,	0x104D,	%o0
	fmovdcs	%xcc,	%f15,	%f0
	fpadd32s	%f11,	%f10,	%f2
	fnot1s	%f3,	%f11
	fmovdg	%icc,	%f10,	%f8
	stx	%g6,	[%l7 + 0x68]
	pdist	%f0,	%f8,	%f2
	fmovrse	%o6,	%f0,	%f3
	fmovsa	%icc,	%f9,	%f9
	tl	%icc,	0x6
	fmovsle	%icc,	%f5,	%f11
	fpadd16	%f14,	%f12,	%f10
	fmovse	%xcc,	%f8,	%f3
	fornot2s	%f1,	%f2,	%f12
	lduh	[%l7 + 0x3A],	%g5
	fmovdpos	%xcc,	%f13,	%f15
	siam	0x0
	taddcc	%g1,	%i5,	%i1
	fabss	%f10,	%f12
	fmovsg	%xcc,	%f6,	%f4
	sdivcc	%o4,	0x02BD,	%l1
	fabss	%f4,	%f14
	fnor	%f0,	%f0,	%f6
	ldsh	[%l7 + 0x5C],	%i0
	fbge	%fcc3,	loop_668
loop_668:
	fpack16	%f8,	%f4
	fsrc1s	%f10,	%f2
	fpsub16s	%f13,	%f5,	%f13
	ldub	[%l7 + 0x4A],	%o5
	ta	%xcc,	0x1
	for	%f12,	%f10,	%f14
	fornot1s	%f0,	%f14,	%f6
	fbue	%fcc1,	loop_669
loop_669:
	tle	%xcc,	0x4
	sub	%g2,	0x074B,	%l3
	fxnors	%f13,	%f13,	%f9
	fmovscs	%icc,	%f14,	%f10
	fmovda	%xcc,	%f6,	%f15
	fmovdn	%icc,	%f4,	%f13
	fmovdvs	%xcc,	%f7,	%f4
	tl	%xcc,	0x7
	fpackfix	%f10,	%f8
	fpackfix	%f4,	%f2
	fands	%f8,	%f7,	%f4
	and	%o1,	0x167F,	%i6
	xor	%g4,	0x0CF1,	%g7
	fxnors	%f2,	%f6,	%f2
	fmovrsgez	%i4,	%f12,	%f12
	lduh	[%l7 + 0x56],	%l6
	xor	%i3,	0x0E7D,	%l2
	fnot1	%f4,	%f4
	fmovsvc	%icc,	%f12,	%f10
	for	%f14,	%f0,	%f12
	fornot1s	%f14,	%f5,	%f9
	movle	%icc,	%i2,	%l0
	fpack16	%f2,	%f14
	fmovdgu	%xcc,	%f10,	%f9
	fones	%f8
	fcmped	%fcc1,	%f8,	%f2
	st	%f1,	[%l7 + 0x2C]
	stb	%l5,	[%l7 + 0x0C]
	fmovdle	%icc,	%f4,	%f9
	fmuld8sux16	%f3,	%f11,	%f8
	siam	0x4
	ldd	[%l7 + 0x50],	%f10
	ldsw	[%l7 + 0x28],	%i7
	fnegs	%f6,	%f1
	fandnot2s	%f7,	%f4,	%f4
	fmovdl	%icc,	%f5,	%f11
	fzero	%f8
	fmovscs	%icc,	%f1,	%f13
	fnegd	%f12,	%f8
	fcmps	%fcc0,	%f8,	%f13
	brnz,a	%g3,	loop_670
loop_670:
	fsrc1s	%f5,	%f4
	fmul8sux16	%f4,	%f6,	%f4
	fpadd32s	%f14,	%f7,	%f5
	brnz,a	%o7,	loop_671
loop_671:
	fmovd	%f8,	%f12
	fzeros	%f13
	addc	%o3,	%o2,	%l4
	tcc	%xcc,	0x2
	fcmpgt16	%f12,	%f2,	%o0
	tsubcctv	%o6,	%g5,	%g1
	std	%f10,	[%l7 + 0x38]
	fmovsle	%xcc,	%f15,	%f2
	fcmpeq32	%f14,	%f8,	%g6
	ldsw	[%l7 + 0x34],	%i1
	fmovrdlz	%o4,	%f14,	%f14
	fornot1	%f2,	%f12,	%f2
	fandnot1	%f4,	%f8,	%f6
	tcc	%icc,	0x2
	ldx	[%l7 + 0x68],	%l1
	fxor	%f8,	%f0,	%f0
	bneg,a	loop_672
loop_672:
	siam	0x2
	movpos	%icc,	%i0,	%i5
	movn	%icc,	%o5,	%g2
	fcmps	%fcc1,	%f13,	%f9
	fpadd16	%f12,	%f2,	%f4
	fsrc1	%f14,	%f12
	fmul8x16	%f10,	%f10,	%f4
	tg	%icc,	0x0
	fnor	%f10,	%f8,	%f6
	fmovrsne	%o1,	%f7,	%f10
	fmuld8ulx16	%f0,	%f12,	%f10
	movg	%xcc,	%i6,	%l3
	fble,a	%fcc1,	loop_673
loop_673:
	fmovdgu	%xcc,	%f6,	%f10
	edge32ln	%g7,	%g4,	%i4
	fmovdle	%xcc,	%f6,	%f2
	fbge,a	%fcc0,	loop_674
loop_674:
	fmovda	%xcc,	%f9,	%f14
	fmovs	%f10,	%f1
	fand	%f14,	%f4,	%f6
	fmovrsgez	%l6,	%f2,	%f0
	udivcc	%i3,	0x1B83,	%l2
	fnand	%f14,	%f14,	%f6
	fbg,a	%fcc3,	loop_675
loop_675:
	addcc	%l0,	%l5,	%i2
	ba,pt	%icc,	loop_676
loop_676:
	brlz,a	%i7,	loop_677
loop_677:
	edge16	%o7,	%o3,	%o2
	fmovrslz	%g3,	%f3,	%f14
	fnands	%f3,	%f13,	%f3
	orncc	%l4,	%o6,	%o0
	fmovsg	%xcc,	%f7,	%f11
	movcc	%xcc,	%g1,	%g6
	fmovrdgz	%g5,	%f2,	%f2
	fnands	%f10,	%f3,	%f8
	ldsh	[%l7 + 0x7C],	%i1
	tne	%xcc,	0x1
	fbule	%fcc2,	loop_678
loop_678:
	fnot2	%f6,	%f6
	bvs,a,pn	%xcc,	loop_679
loop_679:
	fpadd32	%f8,	%f2,	%f4
	fpsub32s	%f8,	%f6,	%f11
	fmovsvc	%icc,	%f5,	%f11
	fmovdvs	%xcc,	%f9,	%f1
	fxnor	%f2,	%f0,	%f8
	fble,a	%fcc3,	loop_680
loop_680:
	fmovd	%f6,	%f6
	alignaddr	%l1,	%o4,	%i5
	fbe	%fcc0,	loop_681
loop_681:
	lduw	[%l7 + 0x60],	%i0
	fmovrslz	%o5,	%f13,	%f6
	fandnot1	%f6,	%f8,	%f12
	fmovdn	%xcc,	%f5,	%f8
	fmovrse	%o1,	%f13,	%f9
	fnot1s	%f0,	%f4
	fmovdn	%icc,	%f13,	%f8
	mova	%icc,	%g2,	%l3
	fornot1	%f4,	%f0,	%f6
	sth	%i6,	[%l7 + 0x1C]
	tle	%xcc,	0x3
	ldx	[%l7 + 0x30],	%g4
	ld	[%l7 + 0x2C],	%f15
	fandnot2	%f6,	%f4,	%f8
	fpsub32s	%f4,	%f10,	%f8
	fcmpd	%fcc3,	%f12,	%f12
	fba	%fcc1,	loop_682
loop_682:
	fpsub16s	%f0,	%f1,	%f8
	fpack16	%f12,	%f10
	stw	%g7,	[%l7 + 0x3C]
	fmovd	%f4,	%f0
	fnot2	%f10,	%f4
	sdivx	%l6,	0x138E,	%i4
	fmovdn	%icc,	%f7,	%f5
	fmovsvc	%icc,	%f14,	%f5
	fnegd	%f8,	%f14
	fpsub16s	%f8,	%f12,	%f1
	brgz	%l2,	loop_683
loop_683:
	fmovse	%icc,	%f12,	%f13
	fpack32	%f12,	%f0,	%f10
	sth	%l0,	[%l7 + 0x1C]
	fmovdpos	%icc,	%f13,	%f2
	stb	%l5,	[%l7 + 0x0E]
	ldx	[%l7 + 0x50],	%i3
	fmovrde	%i7,	%f10,	%f10
	fmovspos	%icc,	%f0,	%f1
	fornot2s	%f7,	%f7,	%f14
	fmovdvs	%xcc,	%f12,	%f4
	fmovdgu	%xcc,	%f0,	%f9
	fcmpd	%fcc1,	%f4,	%f14
	fbu,a	%fcc3,	loop_684
loop_684:
	fpack16	%f2,	%f7
	fpsub16s	%f4,	%f12,	%f4
	fcmpne16	%f10,	%f4,	%o7
	fcmped	%fcc2,	%f12,	%f8
	udivx	%i2,	0x1B40,	%o2
	fmovdn	%xcc,	%f7,	%f11
	fmul8x16al	%f11,	%f14,	%f0
	fmovsa	%icc,	%f11,	%f0
	edge32l	%o3,	%g3,	%l4
	ldsw	[%l7 + 0x40],	%o0
	fpack32	%f2,	%f2,	%f2
	fmovd	%f4,	%f10
	ld	[%l7 + 0x40],	%f11
	fbl,a	%fcc1,	loop_685
loop_685:
	fmovsg	%icc,	%f7,	%f13
	addc	%g1,	%g6,	%o6
	fnot1	%f12,	%f6
	fmovdgu	%icc,	%f1,	%f4
	movvs	%xcc,	%g5,	%i1
	fcmpd	%fcc2,	%f0,	%f4
	srax	%o4,	0x06,	%l1
	lduh	[%l7 + 0x36],	%i5
	sdiv	%o5,	0x1326,	%o1
	fbe	%fcc3,	loop_686
loop_686:
	fnot2	%f8,	%f2
	fmovrde	%g2,	%f14,	%f6
	fmovdpos	%icc,	%f0,	%f7
	std	%f10,	[%l7 + 0x48]
	ldd	[%l7 + 0x78],	%f4
	stx	%i0,	[%l7 + 0x68]
	fone	%f4
	te	%icc,	0x3
	fcmpd	%fcc0,	%f8,	%f14
	fmovs	%f2,	%f7
	fsrc1	%f0,	%f0
	array8	%i6,	%l3,	%g7
	fmul8x16al	%f2,	%f12,	%f4
	fmovsl	%icc,	%f7,	%f0
	fmovrdlz	%l6,	%f6,	%f14
	alignaddr	%i4,	%l2,	%g4
	and	%l0,	0x020F,	%l5
	movvc	%xcc,	%i7,	%i3
	fcmpes	%fcc3,	%f10,	%f1
	fandnot2s	%f6,	%f6,	%f15
	fzeros	%f4
	bpos,a,pn	%xcc,	loop_687
loop_687:
	fcmpne16	%f0,	%f14,	%o7
	alignaddr	%i2,	%o2,	%g3
	fpsub32s	%f14,	%f5,	%f10
	udivcc	%l4,	0x14FF,	%o3
	fbg	%fcc2,	loop_688
loop_688:
	be,a	loop_689
loop_689:
	stw	%g1,	[%l7 + 0x24]
	fbge,a	%fcc0,	loop_690
loop_690:
	tsubcctv	%g6,	%o6,	%o0
	tle	%xcc,	0x7
	lduw	[%l7 + 0x78],	%g5
	fxor	%f12,	%f6,	%f6
	fmovsn	%icc,	%f5,	%f13
	fcmpne16	%f14,	%f12,	%o4
	fsrc2	%f10,	%f2
	edge8	%i1,	%l1,	%i5
	st	%f10,	[%l7 + 0x78]
	bneg,a	loop_691
loop_691:
	sra	%o1,	%o5,	%i0
	movgu	%xcc,	%i6,	%g2
	fbu	%fcc0,	loop_692
loop_692:
	xor	%g7,	0x049C,	%l6
	bleu	%xcc,	loop_693
loop_693:
	fpadd32	%f14,	%f8,	%f2
	fnot1	%f2,	%f12
	fmovdgu	%icc,	%f14,	%f15
	edge32l	%l3,	%i4,	%g4
	bneg,a,pn	%xcc,	loop_694
loop_694:
	fpsub32s	%f9,	%f1,	%f15
	fcmpgt16	%f14,	%f10,	%l0
	andncc	%l2,	%l5,	%i3
	fmovsvs	%xcc,	%f7,	%f1
	fcmpne16	%f2,	%f8,	%o7
	fcmple16	%f14,	%f8,	%i7
	brgez,a	%o2,	loop_695
loop_695:
	fpsub32s	%f13,	%f2,	%f10
	fmovrse	%g3,	%f7,	%f4
	fmovrdlz	%l4,	%f12,	%f6
	bpos,pt	%xcc,	loop_696
loop_696:
	fbe,a	%fcc3,	loop_697
loop_697:
	bn,a,pn	%xcc,	loop_698
loop_698:
	stw	%i2,	[%l7 + 0x30]
	brlz,a	%g1,	loop_699
loop_699:
	srlx	%o3,	0x09,	%g6
	sethi	0x00A5,	%o0
	fpsub32	%f4,	%f0,	%f2
	fbge	%fcc1,	loop_700
loop_700:
	sth	%o6,	[%l7 + 0x60]
	sllx	%o4,	0x05,	%g5
	fmovspos	%icc,	%f12,	%f11
	fornot2	%f10,	%f14,	%f6
	fmovrse	%l1,	%f7,	%f13
	ld	[%l7 + 0x74],	%f8
	movrgez	%i5,	%i1,	%o5
	fbl	%fcc1,	loop_701
loop_701:
	fxnor	%f10,	%f14,	%f4
	stw	%o1,	[%l7 + 0x78]
	bgu,a,pn	%icc,	loop_702
loop_702:
	faligndata	%f6,	%f4,	%f8
	fcmpgt32	%f4,	%f6,	%i6
	fmovdne	%icc,	%f9,	%f5
	fcmped	%fcc1,	%f0,	%f8
	fmovdg	%xcc,	%f5,	%f2
	array8	%g2,	%i0,	%l6
	fcmple16	%f6,	%f2,	%g7
	fmovrdne	%l3,	%f10,	%f0
	fpackfix	%f4,	%f11
	movvc	%xcc,	%i4,	%l0
	fpadd32s	%f6,	%f10,	%f4
	stx	%g4,	[%l7 + 0x78]
	ldsb	[%l7 + 0x6B],	%l2
	fmovrsne	%i3,	%f14,	%f7
	fmovdne	%xcc,	%f5,	%f3
	ldsh	[%l7 + 0x14],	%o7
	brgez	%l5,	loop_703
loop_703:
	fmovsn	%xcc,	%f6,	%f8
	edge16n	%i7,	%g3,	%l4
	andncc	%o2,	%g1,	%i2
	fmovde	%xcc,	%f13,	%f14
	fbl	%fcc3,	loop_704
loop_704:
	fcmps	%fcc2,	%f13,	%f5
	bcc	loop_705
loop_705:
	fsrc1s	%f4,	%f7
	brgz	%g6,	loop_706
loop_706:
	fbue	%fcc3,	loop_707
loop_707:
	fbl	%fcc3,	loop_708
loop_708:
	ldx	[%l7 + 0x08],	%o3
	movne	%xcc,	%o6,	%o4
	orn	%o0,	%g5,	%l1
	lduw	[%l7 + 0x60],	%i1
	fcmpne16	%f4,	%f12,	%o5
	fbo,a	%fcc3,	loop_709
loop_709:
	tgu	%icc,	0x4
	movg	%xcc,	%o1,	%i6
	pdist	%f4,	%f2,	%f0
	ldsb	[%l7 + 0x73],	%i5
	fmovsge	%xcc,	%f1,	%f11
	fcmpgt16	%f8,	%f8,	%g2
	bgu,pt	%xcc,	loop_710
loop_710:
	movre	%i0,	%g7,	%l3
	lduh	[%l7 + 0x60],	%l6
	fors	%f6,	%f5,	%f6
	nop
	setx loop_711, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_711:
	bshuffle	%f8,	%f6,	%f2
	fmovdn	%icc,	%f15,	%f5
	fandnot2s	%f6,	%f9,	%f7
	ldsh	[%l7 + 0x46],	%l0
	fone	%f12
	bpos	%icc,	loop_712
loop_712:
	fmovd	%f14,	%f4
	fmovsa	%xcc,	%f1,	%f4
	fmovsgu	%icc,	%f2,	%f15
	pdist	%f0,	%f2,	%f2
	fnot1s	%f12,	%f1
	fcmps	%fcc0,	%f10,	%f12
	for	%f8,	%f10,	%f12
	bshuffle	%f4,	%f4,	%f2
	fpadd32s	%f3,	%f11,	%f7
	siam	0x5
	fors	%f13,	%f6,	%f10
	bg	%xcc,	loop_713
loop_713:
	stx	%i4,	[%l7 + 0x68]
	brgez,a	%g4,	loop_714
loop_714:
	fmovrdgez	%l2,	%f2,	%f0
	fxors	%f4,	%f13,	%f1
	fmovrsgez	%o7,	%f12,	%f6
	stx	%l5,	[%l7 + 0x38]
	ldd	[%l7 + 0x40],	%f10
	std	%f6,	[%l7 + 0x30]
	fxor	%f0,	%f14,	%f6
	edge8ln	%i3,	%i7,	%l4
	sth	%g3,	[%l7 + 0x56]
	fbo,a	%fcc3,	loop_715
loop_715:
	bl,pt	%xcc,	loop_716
loop_716:
	fornot1	%f2,	%f4,	%f4
	fmovsneg	%icc,	%f2,	%f15
	bgu,a,pn	%icc,	loop_717
loop_717:
	fmovrdgez	%g1,	%f14,	%f14
	fmul8x16	%f3,	%f12,	%f0
	fmovdn	%icc,	%f1,	%f13
	ba,a	%icc,	loop_718
loop_718:
	fmovdle	%icc,	%f11,	%f1
	fmovrdgez	%i2,	%f10,	%f8
	fmovscc	%icc,	%f6,	%f11
	mulscc	%g6,	0x006E,	%o2
	fmovsl	%icc,	%f12,	%f8
	fpsub32	%f14,	%f4,	%f12
	movne	%icc,	%o3,	%o6
	nop
	setx loop_719, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_719:
	stb	%o4,	[%l7 + 0x4D]
	ldd	[%l7 + 0x10],	%f14
	ldsh	[%l7 + 0x50],	%o0
	fnot2	%f6,	%f12
	ldsw	[%l7 + 0x0C],	%g5
	fmovrdlez	%l1,	%f10,	%f6
	tleu	%icc,	0x5
	fcmpeq16	%f14,	%f2,	%o5
	fmovrdgez	%i1,	%f4,	%f14
	fmovspos	%icc,	%f7,	%f14
	fnors	%f14,	%f10,	%f6
	brgez	%i6,	loop_720
loop_720:
	fmovrde	%i5,	%f6,	%f10
	array32	%o1,	%i0,	%g7
	fcmpne16	%f12,	%f6,	%g2
	andncc	%l6,	%l3,	%l0
	fmovse	%icc,	%f7,	%f7
	fnot2	%f4,	%f2
	fnands	%f11,	%f14,	%f11
	fxnor	%f0,	%f6,	%f10
	ld	[%l7 + 0x5C],	%f1
	ldsb	[%l7 + 0x5F],	%i4
	ld	[%l7 + 0x54],	%f0
	mulx	%g4,	0x0121,	%l2
	fones	%f10
	fpack32	%f14,	%f0,	%f10
	fmovdgu	%xcc,	%f14,	%f6
	fpsub32	%f0,	%f4,	%f8
	stw	%o7,	[%l7 + 0x78]
	ldsh	[%l7 + 0x72],	%l5
	udivx	%i7,	0x0340,	%i3
	fandnot1s	%f12,	%f5,	%f9
	fornot2s	%f12,	%f8,	%f12
	fmovsgu	%icc,	%f7,	%f6
	bleu,pn	%icc,	loop_721
loop_721:
	bl	loop_722
loop_722:
	fsrc1s	%f0,	%f5
	bcs,a,pt	%icc,	loop_723
loop_723:
	bcs,a,pt	%xcc,	loop_724
loop_724:
	ldsw	[%l7 + 0x40],	%g3
	fmul8sux16	%f6,	%f6,	%f12
	movneg	%xcc,	%l4,	%g1
	bleu,a	%xcc,	loop_725
loop_725:
	fnors	%f3,	%f7,	%f10
	fba	%fcc1,	loop_726
loop_726:
	fmuld8sux16	%f12,	%f1,	%f14
	movpos	%icc,	%i2,	%g6
	fmovscc	%icc,	%f2,	%f0
	fmovdl	%icc,	%f15,	%f1
	brlez,a	%o3,	loop_727
loop_727:
	fmovrdlez	%o2,	%f4,	%f0
	bvs	%xcc,	loop_728
loop_728:
	std	%f4,	[%l7 + 0x60]
	movl	%icc,	%o6,	%o4
	movrlz	%g5,	%o0,	%o5
	bgu	loop_729
loop_729:
	fexpand	%f11,	%f10
	fmovrsgez	%i1,	%f10,	%f6
	fpack32	%f14,	%f10,	%f14
	fmovrde	%i6,	%f14,	%f4
	fcmps	%fcc3,	%f8,	%f7
	fbn	%fcc2,	loop_730
loop_730:
	fmovrde	%i5,	%f14,	%f6
	brlez	%o1,	loop_731
loop_731:
	fandnot1s	%f9,	%f15,	%f13
	fmovdl	%icc,	%f12,	%f14
	fmovrdlez	%i0,	%f4,	%f14
	srlx	%g7,	%l1,	%g2
	fmovdge	%xcc,	%f14,	%f11
	fandnot1	%f10,	%f4,	%f8
	fpack16	%f14,	%f14
	fmovrdlz	%l6,	%f4,	%f0
	sth	%l0,	[%l7 + 0x0A]
	xorcc	%i4,	0x0AF5,	%g4
	stx	%l3,	[%l7 + 0x60]
	fornot1	%f14,	%f0,	%f0
	edge32ln	%l2,	%l5,	%o7
	fnot2	%f8,	%f8
	fnands	%f11,	%f12,	%f4
	sth	%i7,	[%l7 + 0x7C]
	fmovdn	%icc,	%f6,	%f9
	ldsw	[%l7 + 0x34],	%g3
	movrgez	%i3,	0x14C,	%l4
	ldsw	[%l7 + 0x38],	%i2
	fbug,a	%fcc3,	loop_732
loop_732:
	srl	%g1,	0x1D,	%o3
	sllx	%g6,	0x05,	%o6
	std	%f12,	[%l7 + 0x18]
	fmovrdlez	%o4,	%f8,	%f12
	lduh	[%l7 + 0x1A],	%o2
	fmovrdlez	%g5,	%f10,	%f12
	fmovs	%f12,	%f2
	fmovrdlez	%o0,	%f14,	%f12
	stx	%o5,	[%l7 + 0x38]
	fmovsl	%icc,	%f12,	%f8
	fpadd32	%f12,	%f14,	%f8
	fbo,a	%fcc0,	loop_733
loop_733:
	fcmpes	%fcc2,	%f13,	%f3
	ld	[%l7 + 0x3C],	%f7
	ldx	[%l7 + 0x20],	%i6
	fmovsa	%xcc,	%f4,	%f2
	fmovdneg	%xcc,	%f15,	%f8
	stb	%i5,	[%l7 + 0x2E]
	ldd	[%l7 + 0x28],	%f4
	fmovdgu	%xcc,	%f14,	%f8
	fpadd16	%f8,	%f12,	%f10
	fmovsleu	%xcc,	%f14,	%f10
	fpmerge	%f7,	%f1,	%f6
	bneg,a,pn	%xcc,	loop_734
loop_734:
	movrne	%i1,	%o1,	%i0
	movpos	%xcc,	%g7,	%l1
	fmovdcc	%icc,	%f8,	%f8
	bvs	%icc,	loop_735
loop_735:
	orcc	%l6,	0x0928,	%g2
	fmovsgu	%xcc,	%f2,	%f4
	smul	%l0,	%i4,	%l3
	fmovdvc	%xcc,	%f5,	%f15
	nop
	setx loop_736, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_736:
	fmul8ulx16	%f10,	%f6,	%f2
	fmovdvc	%icc,	%f13,	%f5
	fxors	%f0,	%f14,	%f0
	add	%g4,	%l5,	%o7
	fzero	%f14
	ld	[%l7 + 0x20],	%f3
	fbn	%fcc2,	loop_737
loop_737:
	movrgz	%i7,	%g3,	%l2
	fmul8x16al	%f0,	%f9,	%f4
	edge32l	%i3,	%i2,	%g1
	fmovdcs	%icc,	%f13,	%f8
	andcc	%o3,	%l4,	%g6
	fmovsgu	%xcc,	%f4,	%f12
	stx	%o4,	[%l7 + 0x08]
	fmovsle	%xcc,	%f9,	%f14
	fcmpgt32	%f12,	%f14,	%o6
	ba,a,pn	%xcc,	loop_738
loop_738:
	fmovdg	%icc,	%f8,	%f0
	bpos,pt	%icc,	loop_739
loop_739:
	subcc	%o2,	0x089E,	%o0
	fandnot1	%f14,	%f2,	%f10
	fnegd	%f14,	%f2
	fmul8x16au	%f1,	%f13,	%f14
	fmovdg	%xcc,	%f7,	%f13
	tle	%icc,	0x0
	movrgez	%o5,	0x36D,	%i6
	st	%f12,	[%l7 + 0x30]
	fnands	%f1,	%f1,	%f8
	nop
	setx loop_740, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_740:
	fsrc1	%f12,	%f2
	movre	%i5,	%i1,	%g5
	andn	%o1,	0x0890,	%i0
	fmovrdlz	%l1,	%f6,	%f10
	tne	%icc,	0x1
	fmovrdlz	%g7,	%f12,	%f8
	stw	%g2,	[%l7 + 0x3C]
	fnot2s	%f15,	%f15
	bge,a	%xcc,	loop_741
loop_741:
	tle	%icc,	0x6
	sra	%l0,	%l6,	%i4
	fmovdgu	%xcc,	%f13,	%f1
	fmovrdgz	%g4,	%f4,	%f6
	fands	%f6,	%f6,	%f10
	fands	%f4,	%f1,	%f13
	fmovsvs	%icc,	%f13,	%f9
	fpsub32	%f6,	%f10,	%f2
	array8	%l5,	%l3,	%i7
	fandnot1s	%f1,	%f13,	%f2
	fnot1s	%f3,	%f0
	bvc,pt	%icc,	loop_742
loop_742:
	ldsb	[%l7 + 0x7F],	%g3
	lduw	[%l7 + 0x74],	%o7
	ta	%icc,	0x3
	fmovdcc	%icc,	%f5,	%f3
	sdiv	%i3,	0x1527,	%i2
	fmovdne	%xcc,	%f0,	%f6
	fbe	%fcc3,	loop_743
loop_743:
	fmovsneg	%icc,	%f12,	%f2
	stw	%l2,	[%l7 + 0x6C]
	nop
	setx loop_744, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_744:
	sdivcc	%o3,	0x1CCE,	%l4
	fbn,a	%fcc1,	loop_745
loop_745:
	fmovdleu	%xcc,	%f9,	%f14
	fmovs	%f3,	%f4
	fmovsvs	%xcc,	%f11,	%f2
	stb	%g1,	[%l7 + 0x74]
	edge32	%o4,	%g6,	%o2
	andncc	%o0,	%o6,	%o5
	fmovrsne	%i6,	%f4,	%f14
	fmovsn	%xcc,	%f5,	%f8
	stx	%i5,	[%l7 + 0x48]
	fmovrdlez	%i1,	%f0,	%f10
	tg	%icc,	0x5
	addc	%o1,	0x14A7,	%i0
	fcmpgt32	%f0,	%f2,	%l1
	st	%f1,	[%l7 + 0x2C]
	lduw	[%l7 + 0x64],	%g5
	bvs	loop_746
loop_746:
	fmovdneg	%xcc,	%f11,	%f6
	fmovsleu	%icc,	%f8,	%f10
	movvs	%icc,	%g2,	%l0
	fbge	%fcc2,	loop_747
loop_747:
	stx	%g7,	[%l7 + 0x50]
	fbule	%fcc3,	loop_748
loop_748:
	orncc	%i4,	%l6,	%l5
	fmovsleu	%xcc,	%f15,	%f4
	fcmpeq32	%f6,	%f6,	%l3
	fmul8x16al	%f8,	%f0,	%f2
	fmovsle	%icc,	%f12,	%f0
	fornot2s	%f6,	%f6,	%f7
	fcmpeq32	%f0,	%f2,	%g4
	siam	0x3
	ble,a	loop_749
loop_749:
	fmovrsgz	%g3,	%f11,	%f5
	udivx	%o7,	0x12C4,	%i7
	fnegd	%f6,	%f12
	stb	%i2,	[%l7 + 0x3C]
	edge32ln	%i3,	%o3,	%l4
	fxnor	%f8,	%f10,	%f12
	ld	[%l7 + 0x78],	%f0
	fpsub32	%f6,	%f4,	%f0
	bn	%icc,	loop_750
loop_750:
	stw	%g1,	[%l7 + 0x30]
	siam	0x6
	lduh	[%l7 + 0x22],	%o4
	fpadd32s	%f8,	%f4,	%f0
	fmovdgu	%xcc,	%f11,	%f12
	fmovrslez	%l2,	%f5,	%f9
	fmovdvs	%xcc,	%f11,	%f0
	edge8	%o2,	%g6,	%o0
	fbule,a	%fcc3,	loop_751
loop_751:
	pdist	%f2,	%f8,	%f14
	fmovdcs	%xcc,	%f7,	%f5
	fmovspos	%xcc,	%f0,	%f15
	fpsub32s	%f5,	%f3,	%f15
	fnegd	%f8,	%f12
	lduh	[%l7 + 0x52],	%o6
	lduw	[%l7 + 0x54],	%i6
	umulcc	%i5,	0x1878,	%i1
	fornot2	%f8,	%f12,	%f4
	umul	%o5,	%i0,	%l1
	sth	%g5,	[%l7 + 0x68]
	fors	%f9,	%f1,	%f1
	sth	%g2,	[%l7 + 0x46]
	ld	[%l7 + 0x78],	%f3
	fmovdneg	%xcc,	%f7,	%f3
	fornot1s	%f13,	%f2,	%f9
	std	%f10,	[%l7 + 0x28]
	fmovrsgz	%o1,	%f8,	%f1
	ldub	[%l7 + 0x42],	%g7
	fpsub16	%f4,	%f12,	%f12
	fcmpd	%fcc2,	%f10,	%f0
	xor	%l0,	0x1F08,	%l6
	fornot1s	%f4,	%f4,	%f10
	move	%xcc,	%l5,	%l3
	fbl,a	%fcc0,	loop_752
loop_752:
	ldsb	[%l7 + 0x0E],	%g4
	fmovrslez	%i4,	%f6,	%f10
	orn	%g3,	0x1E66,	%o7
	fnors	%f14,	%f15,	%f15
	fbug,a	%fcc0,	loop_753
loop_753:
	fmovdne	%xcc,	%f9,	%f3
	sll	%i2,	%i7,	%o3
	fba,a	%fcc2,	loop_754
loop_754:
	fba,a	%fcc1,	loop_755
loop_755:
	fmovdgu	%xcc,	%f2,	%f9
	stx	%l4,	[%l7 + 0x10]
	orncc	%g1,	0x088C,	%i3
	array8	%l2,	%o4,	%g6
	edge16	%o0,	%o6,	%o2
	fmovsgu	%xcc,	%f4,	%f8
	stw	%i6,	[%l7 + 0x4C]
	lduh	[%l7 + 0x4C],	%i1
	stx	%i5,	[%l7 + 0x30]
	fnegd	%f4,	%f10
	std	%f6,	[%l7 + 0x28]
	fandnot2	%f10,	%f0,	%f10
	fmul8sux16	%f2,	%f4,	%f2
	fmovdvc	%xcc,	%f9,	%f6
	fmovs	%f15,	%f15
	fnot2s	%f4,	%f6
	edge8l	%i0,	%l1,	%o5
	fmovs	%f7,	%f14
	lduw	[%l7 + 0x30],	%g2
	fmovsn	%icc,	%f7,	%f13
	fnot2	%f6,	%f10
	tl	%xcc,	0x7
	fmovdgu	%icc,	%f2,	%f4
	fbo	%fcc3,	loop_756
loop_756:
	fmovda	%icc,	%f1,	%f8
	xnor	%g5,	%o1,	%g7
	orcc	%l6,	%l5,	%l0
	fxnors	%f10,	%f8,	%f9
	fbge	%fcc0,	loop_757
loop_757:
	fnor	%f12,	%f0,	%f10
	fnot1	%f4,	%f14
	bvs,pn	%xcc,	loop_758
loop_758:
	fbg	%fcc1,	loop_759
loop_759:
	bn,a,pn	%icc,	loop_760
loop_760:
	fnegd	%f14,	%f8
	fpadd32	%f2,	%f14,	%f8
	stb	%l3,	[%l7 + 0x15]
	fcmpd	%fcc2,	%f12,	%f2
	nop
	setx loop_761, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_761:
	movre	%g4,	0x025,	%g3
	brlez	%i4,	loop_762
loop_762:
	udivx	%i2,	0x08AE,	%o7
	sth	%o3,	[%l7 + 0x1C]
	fcmpeq16	%f6,	%f8,	%l4
	fxnors	%f13,	%f1,	%f14
	fmovsg	%xcc,	%f0,	%f13
	smul	%g1,	%i7,	%i3
	fmovs	%f5,	%f1
	ldd	[%l7 + 0x40],	%f6
	tle	%icc,	0x1
	std	%f14,	[%l7 + 0x50]
	fand	%f12,	%f10,	%f12
	fbul	%fcc1,	loop_763
loop_763:
	fmovrsgz	%o4,	%f5,	%f2
	umulcc	%l2,	0x1527,	%o0
	ld	[%l7 + 0x20],	%f15
	fnot1	%f2,	%f4
	lduw	[%l7 + 0x38],	%o6
	tgu	%xcc,	0x1
	fbge,a	%fcc2,	loop_764
loop_764:
	edge32ln	%g6,	%i6,	%i1
	fmovscs	%icc,	%f5,	%f6
	fornot2s	%f15,	%f1,	%f2
	fnot1s	%f10,	%f15
	fmovdleu	%xcc,	%f2,	%f6
	ldx	[%l7 + 0x70],	%i5
	fmovdg	%icc,	%f5,	%f0
	fpack16	%f14,	%f13
	alignaddr	%o2,	%l1,	%o5
	fmovsle	%xcc,	%f1,	%f3
	fmovsle	%xcc,	%f7,	%f9
	fxors	%f9,	%f8,	%f13
	edge32	%i0,	%g2,	%g5
	fxor	%f10,	%f8,	%f2
	fcmpne16	%f0,	%f14,	%o1
	stx	%g7,	[%l7 + 0x38]
	fmovdvc	%icc,	%f7,	%f3
	st	%f14,	[%l7 + 0x2C]
	edge16l	%l6,	%l5,	%l0
	fnand	%f12,	%f6,	%f12
	fmovsleu	%xcc,	%f8,	%f4
	tn	%icc,	0x3
	ble,a	loop_765
loop_765:
	ldsh	[%l7 + 0x0C],	%g4
	edge16n	%l3,	%i4,	%i2
	movne	%icc,	%o7,	%g3
	fornot1s	%f13,	%f7,	%f1
	fmovdneg	%xcc,	%f7,	%f13
	fmovsle	%xcc,	%f15,	%f15
	fmovsgu	%icc,	%f9,	%f14
	fmovspos	%icc,	%f14,	%f5
	movvc	%icc,	%l4,	%g1
	subcc	%o3,	%i3,	%o4
	subccc	%i7,	%o0,	%o6
	brz,a	%l2,	loop_766
loop_766:
	ld	[%l7 + 0x0C],	%f14
	movne	%xcc,	%g6,	%i6
	brgz,a	%i1,	loop_767
loop_767:
	fmovde	%xcc,	%f15,	%f14
	ldx	[%l7 + 0x30],	%i5
	fmuld8ulx16	%f2,	%f3,	%f0
	ldx	[%l7 + 0x78],	%o2
	stw	%o5,	[%l7 + 0x24]
	fnot1s	%f10,	%f6
	bl,a,pn	%icc,	loop_768
loop_768:
	fsrc2s	%f12,	%f11
	fzero	%f6
	fmovrdne	%l1,	%f6,	%f10
	movrlz	%g2,	0x2F1,	%g5
	fmovdn	%icc,	%f3,	%f2
	fmovrse	%i0,	%f10,	%f1
	ld	[%l7 + 0x30],	%f9
	movrgez	%g7,	0x01D,	%l6
	fnands	%f10,	%f14,	%f11
	and	%l5,	0x1334,	%o1
	fmovrdne	%g4,	%f14,	%f6
	srlx	%l0,	%l3,	%i2
	fmuld8ulx16	%f6,	%f9,	%f6
	fcmpgt16	%f12,	%f2,	%o7
	fsrc2s	%f12,	%f15
	fmovrdlz	%g3,	%f12,	%f10
	andncc	%i4,	%l4,	%g1
	fmovrdgz	%i3,	%f0,	%f10
	fmovsa	%xcc,	%f1,	%f13
	fornot1	%f2,	%f2,	%f8
	pdist	%f8,	%f8,	%f6
	fpsub16	%f0,	%f6,	%f4
	fcmple32	%f14,	%f14,	%o4
	fmovdg	%icc,	%f5,	%f12
	fcmple16	%f12,	%f2,	%i7
	fxnor	%f0,	%f0,	%f4
	fmovsg	%xcc,	%f12,	%f4
	fpadd16	%f2,	%f12,	%f2
	sth	%o3,	[%l7 + 0x36]
	fpadd32s	%f4,	%f9,	%f7
	addc	%o0,	%o6,	%g6
	fpmerge	%f8,	%f15,	%f0
	lduw	[%l7 + 0x2C],	%i6
	fmovdleu	%icc,	%f14,	%f4
	fcmpeq16	%f2,	%f2,	%i1
	stw	%l2,	[%l7 + 0x28]
	bleu	loop_769
loop_769:
	edge8	%i5,	%o2,	%o5
	lduw	[%l7 + 0x54],	%g2
	ld	[%l7 + 0x60],	%f14
	fmovdleu	%icc,	%f14,	%f12
	fabsd	%f8,	%f4
	fnot1s	%f7,	%f0
	fmovrsgez	%g5,	%f13,	%f6
	fmovrdgz	%i0,	%f14,	%f0
	fbul,a	%fcc1,	loop_770
loop_770:
	add	%g7,	0x08A4,	%l6
	fsrc2	%f10,	%f12
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type f   	: 530
!	Type cti   	: 140
!	Type i   	: 185
!	Type l   	: 145
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
main_t4:

	!# Initialize registers ..

	!# Global registers
	set	0xD,	%g1
	set	0xB,	%g2
	set	0xE,	%g3
	set	0x1,	%g4
	set	0x0,	%g5
	set	0xA,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x4,	%i1
	set	-0x3,	%i2
	set	-0x8,	%i3
	set	-0x9,	%i4
	set	-0xF,	%i5
	set	-0x2,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x64F6A9B6,	%l0
	set	0x3D26C589,	%l1
	set	0x456AE902,	%l2
	set	0x28086EA0,	%l3
	set	0x76B6A2F9,	%l4
	set	0x6151461F,	%l5
	set	0x7EA717A0,	%l6
	!# Output registers
	set	-0x0B1E,	%o0
	set	0x1522,	%o1
	set	-0x04E6,	%o2
	set	-0x0455,	%o3
	set	0x11CA,	%o4
	set	0x11EC,	%o5
	set	0x1EAB,	%o6
	set	-0x0EC9,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	ldd	[%l7 + 0x78],	%f14
	srlx	%l5,	0x1B,	%o1
	bn,pn	%icc,	loop_771
loop_771:
	bge	loop_772
loop_772:
	xorcc	%l1,	0x099F,	%g4
	fnegs	%f15,	%f4
	bn	%icc,	loop_773
loop_773:
	bg,a	loop_774
loop_774:
	nop
	setx loop_775, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_775:
	brgz	%l0,	loop_776
loop_776:
	fmovrsgez	%l3,	%f11,	%f3
	fbg	%fcc0,	loop_777
loop_777:
	bpos,a	%xcc,	loop_778
loop_778:
	stw	%o7,	[%l7 + 0x54]
	fpmerge	%f13,	%f3,	%f2
	be,pt	%icc,	loop_779
loop_779:
	bpos,pn	%xcc,	loop_780
loop_780:
	ldub	[%l7 + 0x66],	%g3
	ble	loop_781
loop_781:
	fmovdne	%xcc,	%f6,	%f14
	movg	%xcc,	%i4,	%l4
	nop
	setx loop_782, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_782:
	or	%g1,	0x1F96,	%i3
	fbule,a	%fcc0,	loop_783
loop_783:
	fble	%fcc3,	loop_784
loop_784:
	fsrc2	%f12,	%f10
	tvc	%xcc,	0x2
	edge32	%o4,	%i7,	%i2
	fmovdle	%xcc,	%f9,	%f3
	call	loop_785
loop_785:
	bpos,pn	%xcc,	loop_786
loop_786:
	std	%f6,	[%l7 + 0x38]
	fmovscc	%icc,	%f8,	%f4
	movleu	%icc,	%o3,	%o6
	fbo	%fcc1,	loop_787
loop_787:
	sdivx	%g6,	0x1DD7,	%o0
	lduh	[%l7 + 0x56],	%i6
	movgu	%icc,	%i1,	%i5
	or	%o2,	%o5,	%g2
	edge8	%l2,	%g5,	%i0
	fpsub16	%f6,	%f4,	%f6
	fbuge,a	%fcc2,	loop_788
loop_788:
	fcmpeq16	%f10,	%f2,	%g7
	stw	%l6,	[%l7 + 0x1C]
	fbuge	%fcc0,	loop_789
loop_789:
	nop
	setx loop_790, %l0, %l1
	jmpl %l1, %o1
loop_790:
	fpadd32s	%f11,	%f10,	%f11
	call	loop_791
loop_791:
	addccc	%l1,	0x10CE,	%g4
	brz,a	%l5,	loop_792
loop_792:
	bleu	%xcc,	loop_793
loop_793:
	fmovrslez	%l0,	%f15,	%f12
	fbule,a	%fcc0,	loop_794
loop_794:
	fmuld8sux16	%f12,	%f1,	%f0
	bleu,pn	%xcc,	loop_795
loop_795:
	bgu,pn	%icc,	loop_796
loop_796:
	fmovsgu	%icc,	%f6,	%f15
	tgu	%icc,	0x6
	movcc	%icc,	%l3,	%o7
	fnot2	%f0,	%f8
	fnor	%f14,	%f8,	%f10
	fbl	%fcc0,	loop_797
loop_797:
	fnors	%f7,	%f15,	%f6
	smul	%i4,	0x1375,	%l4
	xnorcc	%g3,	%g1,	%o4
	bne,a	loop_798
loop_798:
	fcmped	%fcc2,	%f0,	%f12
	fbg,a	%fcc1,	loop_799
loop_799:
	fmovdne	%xcc,	%f12,	%f8
	ld	[%l7 + 0x10],	%f0
	for	%f12,	%f12,	%f0
	tcs	%icc,	0x5
	fbu,a	%fcc3,	loop_800
loop_800:
	ld	[%l7 + 0x60],	%f14
	brgz	%i7,	loop_801
loop_801:
	bleu,pn	%icc,	loop_802
loop_802:
	fmovsle	%icc,	%f11,	%f8
	bcc	loop_803
loop_803:
	bvc,a	%xcc,	loop_804
loop_804:
	bpos,a,pn	%icc,	loop_805
loop_805:
	lduh	[%l7 + 0x6E],	%i2
	nop
	setx loop_806, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_806:
	fbe,a	%fcc3,	loop_807
loop_807:
	bleu,a,pn	%xcc,	loop_808
loop_808:
	fbul	%fcc1,	loop_809
loop_809:
	ldd	[%l7 + 0x08],	%f0
	bge,a,pn	%icc,	loop_810
loop_810:
	array8	%o3,	%o6,	%g6
	bleu,a,pt	%xcc,	loop_811
loop_811:
	bleu,a	loop_812
loop_812:
	bge,a	loop_813
loop_813:
	bvs	loop_814
loop_814:
	nop
	setx loop_815, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_815:
	udiv	%o0,	0x1312,	%i3
	for	%f0,	%f0,	%f0
	fble,a	%fcc3,	loop_816
loop_816:
	movle	%icc,	%i1,	%i6
	brgz	%o2,	loop_817
loop_817:
	fblg,a	%fcc1,	loop_818
loop_818:
	stx	%o5,	[%l7 + 0x78]
	stw	%g2,	[%l7 + 0x18]
	fbu,a	%fcc3,	loop_819
loop_819:
	bcc,pn	%xcc,	loop_820
loop_820:
	bvc	loop_821
loop_821:
	mova	%xcc,	%l2,	%i5
	std	%f12,	[%l7 + 0x08]
	fmovscs	%xcc,	%f13,	%f11
	edge16ln	%g5,	%g7,	%i0
	fmovdn	%icc,	%f15,	%f6
	ldsw	[%l7 + 0x2C],	%o1
	ble	loop_822
loop_822:
	call	loop_823
loop_823:
	nop
	setx loop_824, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_824:
	movne	%xcc,	%l6,	%l1
	fbne,a	%fcc0,	loop_825
loop_825:
	brgz	%g4,	loop_826
loop_826:
	ldsw	[%l7 + 0x20],	%l0
	fmuld8ulx16	%f7,	%f9,	%f2
	ldub	[%l7 + 0x1D],	%l3
	bge,a,pn	%icc,	loop_827
loop_827:
	std	%f10,	[%l7 + 0x40]
	bvs,a,pn	%icc,	loop_828
loop_828:
	fbo	%fcc3,	loop_829
loop_829:
	bvc,a,pn	%xcc,	loop_830
loop_830:
	ldx	[%l7 + 0x18],	%o7
	fbo,a	%fcc1,	loop_831
loop_831:
	brgz	%l5,	loop_832
loop_832:
	fbuge	%fcc3,	loop_833
loop_833:
	lduw	[%l7 + 0x70],	%i4
	stw	%l4,	[%l7 + 0x78]
	st	%f9,	[%l7 + 0x38]
	fmovrdlez	%g1,	%f0,	%f2
	srl	%o4,	%i7,	%g3
	bn,a	%icc,	loop_834
loop_834:
	fmovsvc	%icc,	%f11,	%f5
	fbl,a	%fcc0,	loop_835
loop_835:
	ldsh	[%l7 + 0x7C],	%i2
	fmovrdne	%o6,	%f4,	%f4
	std	%f8,	[%l7 + 0x10]
	fba	%fcc1,	loop_836
loop_836:
	bvs,a	loop_837
loop_837:
	nop
	setx loop_838, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_838:
	edge32ln	%o3,	%o0,	%g6
	fmovdvc	%xcc,	%f5,	%f0
	bpos	%xcc,	loop_839
loop_839:
	stw	%i1,	[%l7 + 0x30]
	fmovsleu	%xcc,	%f3,	%f6
	fmovrdgez	%i3,	%f12,	%f12
	brz	%i6,	loop_840
loop_840:
	nop
	setx loop_841, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_841:
	sra	%o2,	%o5,	%g2
	bl	%icc,	loop_842
loop_842:
	fmovda	%icc,	%f0,	%f7
	bvc,a	%xcc,	loop_843
loop_843:
	brz	%i5,	loop_844
loop_844:
	edge32n	%l2,	%g7,	%i0
	movrgez	%o1,	%g5,	%l6
	nop
	setx loop_845, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_845:
	fmovsne	%icc,	%f13,	%f12
	udivx	%g4,	0x0452,	%l1
	tn	%xcc,	0x2
	fzero	%f10
	ldx	[%l7 + 0x08],	%l3
	fmovsle	%xcc,	%f14,	%f11
	fbg	%fcc0,	loop_846
loop_846:
	nop
	setx loop_847, %l0, %l1
	jmpl %l1, %o7
loop_847:
	bl,a,pt	%icc,	loop_848
loop_848:
	subcc	%l5,	%i4,	%l0
	fble	%fcc0,	loop_849
loop_849:
	movne	%xcc,	%l4,	%o4
	ba,pt	%icc,	loop_850
loop_850:
	brz,a	%g1,	loop_851
loop_851:
	brgz,a	%g3,	loop_852
loop_852:
	ldx	[%l7 + 0x30],	%i2
	fxnor	%f4,	%f2,	%f14
	brlz,a	%o6,	loop_853
loop_853:
	fmovdgu	%xcc,	%f5,	%f6
	fbo	%fcc3,	loop_854
loop_854:
	nop
	setx loop_855, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_855:
	fbl	%fcc1,	loop_856
loop_856:
	tcc	%icc,	0x6
	fba	%fcc2,	loop_857
loop_857:
	ldd	[%l7 + 0x58],	%f0
	call	loop_858
loop_858:
	fbne,a	%fcc0,	loop_859
loop_859:
	ldub	[%l7 + 0x37],	%o3
	bg,pt	%xcc,	loop_860
loop_860:
	fmovsg	%xcc,	%f9,	%f5
	stx	%o0,	[%l7 + 0x18]
	fpadd16	%f2,	%f8,	%f8
	addcc	%i7,	0x045E,	%i1
	te	%xcc,	0x1
	edge32ln	%i3,	%g6,	%i6
	movcs	%xcc,	%o2,	%o5
	fpadd16	%f12,	%f10,	%f0
	bvs,a	%xcc,	loop_861
loop_861:
	brgez,a	%g2,	loop_862
loop_862:
	lduw	[%l7 + 0x44],	%l2
	stx	%g7,	[%l7 + 0x70]
	fand	%f4,	%f14,	%f0
	fmovsvs	%xcc,	%f10,	%f6
	fbge,a	%fcc3,	loop_863
loop_863:
	nop
	setx loop_864, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_864:
	fabss	%f0,	%f4
	fbg	%fcc3,	loop_865
loop_865:
	bneg,a,pn	%icc,	loop_866
loop_866:
	stb	%i0,	[%l7 + 0x53]
	sdiv	%i5,	0x1227,	%g5
	fbue,a	%fcc2,	loop_867
loop_867:
	ldsw	[%l7 + 0x44],	%o1
	tvs	%xcc,	0x0
	bgu,pn	%icc,	loop_868
loop_868:
	fba,a	%fcc3,	loop_869
loop_869:
	ba,a,pn	%xcc,	loop_870
loop_870:
	bge	%xcc,	loop_871
loop_871:
	srl	%l6,	%l1,	%l3
	nop
	setx loop_872, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_872:
	fmovrdgez	%o7,	%f10,	%f14
	brlez,a	%g4,	loop_873
loop_873:
	brnz,a	%l5,	loop_874
loop_874:
	brgez,a	%l0,	loop_875
loop_875:
	fbo,a	%fcc0,	loop_876
loop_876:
	st	%f10,	[%l7 + 0x64]
	edge16l	%i4,	%o4,	%l4
	fmovs	%f6,	%f9
	for	%f6,	%f12,	%f14
	fpadd32s	%f12,	%f7,	%f7
	bn,a	%xcc,	loop_877
loop_877:
	call	loop_878
loop_878:
	fbge	%fcc2,	loop_879
loop_879:
	fbul	%fcc1,	loop_880
loop_880:
	bleu,a	%icc,	loop_881
loop_881:
	xorcc	%g1,	%g3,	%o6
	bcs,pt	%icc,	loop_882
loop_882:
	bleu	loop_883
loop_883:
	brnz,a	%i2,	loop_884
loop_884:
	bvs,a	%icc,	loop_885
loop_885:
	bcs,pn	%icc,	loop_886
loop_886:
	umul	%o3,	0x1755,	%o0
	sth	%i1,	[%l7 + 0x40]
	bvs,a,pn	%icc,	loop_887
loop_887:
	bleu,a,pn	%xcc,	loop_888
loop_888:
	edge32ln	%i7,	%g6,	%i3
	fbule,a	%fcc0,	loop_889
loop_889:
	fbne	%fcc3,	loop_890
loop_890:
	bvc,a,pt	%xcc,	loop_891
loop_891:
	stw	%i6,	[%l7 + 0x54]
	bgu,a	loop_892
loop_892:
	ble	%xcc,	loop_893
loop_893:
	stb	%o2,	[%l7 + 0x3A]
	be,a,pt	%xcc,	loop_894
loop_894:
	fmovsle	%icc,	%f15,	%f1
	bge	loop_895
loop_895:
	fbn,a	%fcc1,	loop_896
loop_896:
	popc	0x0F51,	%o5
	sth	%l2,	[%l7 + 0x36]
	smul	%g7,	0x137D,	%i0
	bl,a,pt	%xcc,	loop_897
loop_897:
	fmovdcs	%xcc,	%f0,	%f5
	call	loop_898
loop_898:
	bcs,a	loop_899
loop_899:
	fbul,a	%fcc2,	loop_900
loop_900:
	fmovrsne	%i5,	%f5,	%f2
	bcc,pn	%xcc,	loop_901
loop_901:
	tge	%icc,	0x4
	bgu,a	loop_902
loop_902:
	nop
	setx loop_903, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_903:
	fnor	%f6,	%f2,	%f0
	edge8	%g2,	%o1,	%g5
	fsrc1s	%f14,	%f3
	brnz,a	%l1,	loop_904
loop_904:
	fmovsg	%icc,	%f1,	%f8
	stb	%l3,	[%l7 + 0x64]
	bneg,pn	%icc,	loop_905
loop_905:
	brgz,a	%l6,	loop_906
loop_906:
	fbg	%fcc0,	loop_907
loop_907:
	nop
	setx loop_908, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_908:
	fmovsleu	%xcc,	%f9,	%f2
	std	%f4,	[%l7 + 0x70]
	tsubcctv	%g4,	0x1BDE,	%o7
	fone	%f8
	bvc,a	%xcc,	loop_909
loop_909:
	fbu	%fcc0,	loop_910
loop_910:
	ld	[%l7 + 0x64],	%f2
	ldsw	[%l7 + 0x6C],	%l0
	andcc	%i4,	0x1B6F,	%o4
	brgez,a	%l5,	loop_911
loop_911:
	movn	%icc,	%l4,	%g1
	ble,pn	%icc,	loop_912
loop_912:
	be	%icc,	loop_913
loop_913:
	brgez,a	%g3,	loop_914
loop_914:
	ba,pn	%xcc,	loop_915
loop_915:
	fbn,a	%fcc3,	loop_916
loop_916:
	bneg,a,pn	%xcc,	loop_917
loop_917:
	bcc	loop_918
loop_918:
	fbn,a	%fcc0,	loop_919
loop_919:
	nop
	setx loop_920, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_920:
	fmovde	%icc,	%f5,	%f13
	ldsh	[%l7 + 0x10],	%i2
	lduw	[%l7 + 0x58],	%o6
	fpackfix	%f2,	%f6
	stx	%o0,	[%l7 + 0x58]
	fornot1	%f8,	%f4,	%f4
	fmovrde	%i1,	%f4,	%f6
	xnorcc	%i7,	%g6,	%i3
	bcs,pn	%icc,	loop_921
loop_921:
	ba,a	loop_922
loop_922:
	taddcc	%o3,	%o2,	%i6
	fmovda	%icc,	%f4,	%f8
	fba,a	%fcc3,	loop_923
loop_923:
	fbl,a	%fcc0,	loop_924
loop_924:
	fbn	%fcc0,	loop_925
loop_925:
	bvs,pn	%xcc,	loop_926
loop_926:
	fmovdvc	%xcc,	%f14,	%f8
	fbul,a	%fcc0,	loop_927
loop_927:
	sth	%l2,	[%l7 + 0x54]
	fnot2s	%f3,	%f11
	bpos,a	%xcc,	loop_928
loop_928:
	ldsb	[%l7 + 0x46],	%o5
	xorcc	%i0,	0x09E7,	%g7
	fba	%fcc1,	loop_929
loop_929:
	taddcctv	%i5,	0x029D,	%o1
	stw	%g5,	[%l7 + 0x50]
	bcc,a	%xcc,	loop_930
loop_930:
	fnot2	%f12,	%f10
	fbug,a	%fcc0,	loop_931
loop_931:
	fbug,a	%fcc3,	loop_932
loop_932:
	fmovrdlez	%l1,	%f12,	%f14
	fbu	%fcc2,	loop_933
loop_933:
	st	%f2,	[%l7 + 0x1C]
	fblg,a	%fcc2,	loop_934
loop_934:
	tg	%icc,	0x2
	fbg	%fcc2,	loop_935
loop_935:
	fbu,a	%fcc2,	loop_936
loop_936:
	fmovrse	%g2,	%f14,	%f3
	fble	%fcc1,	loop_937
loop_937:
	ldsw	[%l7 + 0x20],	%l6
	fba	%fcc0,	loop_938
loop_938:
	fmovsgu	%icc,	%f7,	%f8
	andncc	%g4,	%l3,	%l0
	bg,a,pn	%xcc,	loop_939
loop_939:
	fbge	%fcc0,	loop_940
loop_940:
	fmovscs	%xcc,	%f7,	%f6
	fbge,a	%fcc2,	loop_941
loop_941:
	bpos,a	%xcc,	loop_942
loop_942:
	std	%f4,	[%l7 + 0x18]
	bvc,a	%icc,	loop_943
loop_943:
	srlx	%o7,	%o4,	%l5
	fbn	%fcc0,	loop_944
loop_944:
	or	%l4,	%i4,	%g1
	brgez	%g3,	loop_945
loop_945:
	fbe,a	%fcc1,	loop_946
loop_946:
	fpsub32s	%f1,	%f14,	%f10
	subcc	%o6,	0x07EA,	%i2
	fcmpes	%fcc3,	%f5,	%f11
	fbg	%fcc2,	loop_947
loop_947:
	nop
	setx loop_948, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_948:
	fbule,a	%fcc2,	loop_949
loop_949:
	fmovdl	%xcc,	%f5,	%f15
	fbne,a	%fcc1,	loop_950
loop_950:
	fbuge,a	%fcc3,	loop_951
loop_951:
	fbuge,a	%fcc3,	loop_952
loop_952:
	fbue	%fcc3,	loop_953
loop_953:
	brnz,a	%i1,	loop_954
loop_954:
	fmovdle	%xcc,	%f5,	%f6
	brnz	%i7,	loop_955
loop_955:
	fcmpgt32	%f0,	%f2,	%o0
	stb	%g6,	[%l7 + 0x74]
	sdiv	%o3,	0x1DA6,	%i3
	fnors	%f5,	%f12,	%f3
	fnot2s	%f0,	%f13
	tg	%xcc,	0x3
	nop
	setx loop_956, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_956:
	fbl,a	%fcc3,	loop_957
loop_957:
	bn,a	%xcc,	loop_958
loop_958:
	fba	%fcc0,	loop_959
loop_959:
	bvc,a,pt	%xcc,	loop_960
loop_960:
	fsrc2s	%f14,	%f15
	orn	%i6,	0x01EC,	%l2
	fxors	%f14,	%f3,	%f14
	ldsw	[%l7 + 0x38],	%o5
	nop
	setx loop_961, %l0, %l1
	jmpl %l1, %o2
loop_961:
	brgz,a	%i0,	loop_962
loop_962:
	ldsh	[%l7 + 0x76],	%g7
	tcs	%icc,	0x6
	fcmpeq32	%f8,	%f14,	%o1
	fmovdne	%xcc,	%f3,	%f12
	fbug,a	%fcc0,	loop_963
loop_963:
	nop
	setx loop_964, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_964:
	bg,pn	%xcc,	loop_965
loop_965:
	fmovsa	%icc,	%f1,	%f3
	or	%i5,	%l1,	%g2
	movrgz	%l6,	%g4,	%l3
	ldsw	[%l7 + 0x6C],	%g5
	udivx	%l0,	0x1319,	%o4
	fnot2s	%f14,	%f0
	fmovscc	%xcc,	%f8,	%f11
	brlz,a	%l5,	loop_966
loop_966:
	bvc,a,pt	%xcc,	loop_967
loop_967:
	fmovdl	%xcc,	%f10,	%f2
	bleu,a	%xcc,	loop_968
loop_968:
	tg	%icc,	0x3
	st	%f13,	[%l7 + 0x08]
	fbe	%fcc0,	loop_969
loop_969:
	ble	loop_970
loop_970:
	bge	%xcc,	loop_971
loop_971:
	fba,a	%fcc2,	loop_972
loop_972:
	fpsub32	%f12,	%f8,	%f12
	fbl	%fcc2,	loop_973
loop_973:
	nop
	setx loop_974, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_974:
	srax	%l4,	0x13,	%o7
	taddcc	%g1,	0x1D28,	%i4
	fbue	%fcc3,	loop_975
loop_975:
	fcmps	%fcc1,	%f12,	%f5
	stw	%g3,	[%l7 + 0x44]
	fbug,a	%fcc2,	loop_976
loop_976:
	fblg	%fcc3,	loop_977
loop_977:
	fmovrdlez	%i2,	%f6,	%f4
	stx	%i1,	[%l7 + 0x38]
	fbg,a	%fcc3,	loop_978
loop_978:
	fcmple16	%f0,	%f4,	%o6
	tsubcctv	%o0,	0x1EFB,	%g6
	edge16ln	%o3,	%i7,	%i6
	fmovdg	%xcc,	%f9,	%f7
	bcc	loop_979
loop_979:
	lduh	[%l7 + 0x22],	%i3
	orncc	%l2,	%o2,	%o5
	udivx	%g7,	0x1CB3,	%o1
	fble,a	%fcc1,	loop_980
loop_980:
	fand	%f12,	%f6,	%f10
	fornot2	%f8,	%f4,	%f4
	nop
	setx loop_981, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_981:
	brgez,a	%i5,	loop_982
loop_982:
	fblg,a	%fcc3,	loop_983
loop_983:
	fpadd32s	%f14,	%f4,	%f15
	bne	loop_984
loop_984:
	edge8n	%i0,	%g2,	%l6
	ldub	[%l7 + 0x0D],	%g4
	subc	%l3,	%l1,	%g5
	fbn	%fcc0,	loop_985
loop_985:
	tn	%icc,	0x2
	st	%f2,	[%l7 + 0x20]
	fmovrdne	%o4,	%f2,	%f14
	nop
	setx loop_986, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_986:
	bcs,pn	%icc,	loop_987
loop_987:
	fmovdle	%icc,	%f15,	%f5
	bge,pn	%icc,	loop_988
loop_988:
	fbne	%fcc2,	loop_989
loop_989:
	ldub	[%l7 + 0x38],	%l5
	fnot2s	%f6,	%f12
	fnegs	%f6,	%f12
	brgz	%l0,	loop_990
loop_990:
	bleu,pt	%xcc,	loop_991
loop_991:
	bneg,a	loop_992
loop_992:
	xor	%o7,	%l4,	%i4
	fcmpes	%fcc1,	%f11,	%f5
	tsubcctv	%g3,	0x0271,	%i2
	fbu	%fcc3,	loop_993
loop_993:
	fxor	%f8,	%f0,	%f0
	tgu	%icc,	0x7
	fbge	%fcc0,	loop_994
loop_994:
	nop
	setx loop_995, %l0, %l1
	jmpl %l1, %i1
loop_995:
	fbue	%fcc2,	loop_996
loop_996:
	call	loop_997
loop_997:
	bg,a,pt	%xcc,	loop_998
loop_998:
	fbu,a	%fcc1,	loop_999
loop_999:
	nop
	setx loop_1000, %l0, %l1
	jmpl %l1, %g1
loop_1000:
	fbule,a	%fcc0,	loop_1001
loop_1001:
	fble	%fcc3,	loop_1002
loop_1002:
	fbne	%fcc2,	loop_1003
loop_1003:
	fba	%fcc2,	loop_1004
loop_1004:
	array32	%o0,	%o6,	%g6
	fandnot1s	%f3,	%f15,	%f2
	fmovrdlz	%i7,	%f10,	%f6
	bcc,pn	%icc,	loop_1005
loop_1005:
	brlez,a	%i6,	loop_1006
loop_1006:
	bl	%xcc,	loop_1007
loop_1007:
	edge32	%i3,	%l2,	%o2
	brgz	%o3,	loop_1008
loop_1008:
	fxnors	%f15,	%f5,	%f6
	fblg	%fcc2,	loop_1009
loop_1009:
	nop
	setx loop_1010, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1010:
	lduw	[%l7 + 0x48],	%o5
	movrlz	%o1,	%g7,	%i0
	fmovrde	%i5,	%f6,	%f12
	nop
	setx loop_1011, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1011:
	fba,a	%fcc2,	loop_1012
loop_1012:
	fornot2	%f2,	%f12,	%f10
	fbul	%fcc3,	loop_1013
loop_1013:
	bneg	%icc,	loop_1014
loop_1014:
	subc	%g2,	%g4,	%l3
	fbule	%fcc0,	loop_1015
loop_1015:
	brlez	%l1,	loop_1016
loop_1016:
	bvs,pt	%icc,	loop_1017
loop_1017:
	movre	%g5,	0x209,	%l6
	tne	%xcc,	0x7
	sth	%l5,	[%l7 + 0x46]
	ldsw	[%l7 + 0x48],	%o4
	ldsb	[%l7 + 0x71],	%o7
	movne	%icc,	%l4,	%l0
	bg,pn	%xcc,	loop_1018
loop_1018:
	for	%f14,	%f2,	%f14
	bvc	loop_1019
loop_1019:
	fpmerge	%f14,	%f0,	%f0
	fnot1	%f8,	%f12
	fmovs	%f7,	%f11
	andcc	%i4,	0x16CF,	%i2
	addcc	%g3,	%i1,	%o0
	fble	%fcc0,	loop_1020
loop_1020:
	fbug,a	%fcc1,	loop_1021
loop_1021:
	tn	%icc,	0x4
	xor	%o6,	0x0001,	%g1
	fbo,a	%fcc3,	loop_1022
loop_1022:
	fbne,a	%fcc3,	loop_1023
loop_1023:
	fbue,a	%fcc1,	loop_1024
loop_1024:
	fpmerge	%f15,	%f5,	%f0
	edge16n	%g6,	%i6,	%i7
	brgz,a	%i3,	loop_1025
loop_1025:
	stb	%o2,	[%l7 + 0x3D]
	st	%f13,	[%l7 + 0x54]
	ld	[%l7 + 0x24],	%f9
	ldd	[%l7 + 0x68],	%f4
	call	loop_1026
loop_1026:
	bn,pn	%xcc,	loop_1027
loop_1027:
	bneg,pn	%icc,	loop_1028
loop_1028:
	fmovdleu	%icc,	%f2,	%f9
	fbul	%fcc3,	loop_1029
loop_1029:
	umul	%o3,	0x0649,	%l2
	bl,a,pt	%icc,	loop_1030
loop_1030:
	fandnot2s	%f14,	%f8,	%f13
	fbge,a	%fcc3,	loop_1031
loop_1031:
	ldx	[%l7 + 0x60],	%o1
	bne,pt	%xcc,	loop_1032
loop_1032:
	fmovdpos	%icc,	%f5,	%f7
	brlez	%o5,	loop_1033
loop_1033:
	fbe,a	%fcc2,	loop_1034
loop_1034:
	edge16n	%i0,	%i5,	%g2
	udivx	%g7,	0x0AC5,	%l3
	brgz,a	%g4,	loop_1035
loop_1035:
	tcs	%xcc,	0x4
	bpos,a,pt	%xcc,	loop_1036
loop_1036:
	ldd	[%l7 + 0x70],	%f2
	fnot1s	%f10,	%f12
	ldub	[%l7 + 0x61],	%g5
	brgez	%l6,	loop_1037
loop_1037:
	fmovrsne	%l5,	%f15,	%f4
	brnz	%l1,	loop_1038
loop_1038:
	lduh	[%l7 + 0x4E],	%o4
	srax	%o7,	%l4,	%i4
	fbug,a	%fcc1,	loop_1039
loop_1039:
	ldsh	[%l7 + 0x48],	%i2
	fsrc1	%f6,	%f8
	fzeros	%f15
	stx	%g3,	[%l7 + 0x28]
	sth	%l0,	[%l7 + 0x1A]
	fba	%fcc1,	loop_1040
loop_1040:
	stx	%i1,	[%l7 + 0x10]
	bgu	loop_1041
loop_1041:
	fnot1	%f8,	%f2
	bpos,a,pn	%xcc,	loop_1042
loop_1042:
	xnorcc	%o0,	%o6,	%g1
	bg,a	loop_1043
loop_1043:
	and	%g6,	0x129A,	%i7
	bl,pn	%xcc,	loop_1044
loop_1044:
	fbe	%fcc3,	loop_1045
loop_1045:
	fnot2	%f12,	%f6
	fbo	%fcc2,	loop_1046
loop_1046:
	srax	%i6,	%o2,	%o3
	fbu,a	%fcc0,	loop_1047
loop_1047:
	lduw	[%l7 + 0x64],	%l2
	fblg,a	%fcc3,	loop_1048
loop_1048:
	smulcc	%o1,	0x0ABD,	%i3
	fcmpne16	%f12,	%f4,	%o5
	ld	[%l7 + 0x64],	%f11
	fbge	%fcc2,	loop_1049
loop_1049:
	sth	%i5,	[%l7 + 0x0E]
	ba,pt	%xcc,	loop_1050
loop_1050:
	fbuge	%fcc3,	loop_1051
loop_1051:
	ldsh	[%l7 + 0x48],	%g2
	fbg,a	%fcc2,	loop_1052
loop_1052:
	fpsub16s	%f0,	%f10,	%f10
	lduw	[%l7 + 0x64],	%g7
	tg	%xcc,	0x5
	tneg	%xcc,	0x6
	fbuge,a	%fcc3,	loop_1053
loop_1053:
	bge	%xcc,	loop_1054
loop_1054:
	ldub	[%l7 + 0x75],	%i0
	sdivx	%l3,	0x1FF1,	%g5
	fbe	%fcc0,	loop_1055
loop_1055:
	bge,a	%xcc,	loop_1056
loop_1056:
	fbne,a	%fcc1,	loop_1057
loop_1057:
	fmovsneg	%xcc,	%f12,	%f4
	fbu	%fcc1,	loop_1058
loop_1058:
	fmovrdgz	%g4,	%f12,	%f6
	ldsh	[%l7 + 0x52],	%l6
	bcc,a,pn	%icc,	loop_1059
loop_1059:
	bvs,pt	%xcc,	loop_1060
loop_1060:
	xorcc	%l5,	0x1DF9,	%l1
	fcmpes	%fcc3,	%f0,	%f9
	stx	%o7,	[%l7 + 0x78]
	sdivcc	%o4,	0x0045,	%l4
	bge,pn	%icc,	loop_1061
loop_1061:
	fbug	%fcc3,	loop_1062
loop_1062:
	movleu	%icc,	%i2,	%i4
	fors	%f8,	%f6,	%f8
	bshuffle	%f0,	%f6,	%f8
	fbn,a	%fcc0,	loop_1063
loop_1063:
	fbul,a	%fcc3,	loop_1064
loop_1064:
	fmovsle	%xcc,	%f4,	%f1
	taddcctv	%l0,	0x0204,	%i1
	fbl	%fcc1,	loop_1065
loop_1065:
	movpos	%icc,	%o0,	%o6
	lduh	[%l7 + 0x18],	%g3
	fbge,a	%fcc2,	loop_1066
loop_1066:
	fmuld8sux16	%f7,	%f14,	%f6
	call	loop_1067
loop_1067:
	fbue	%fcc2,	loop_1068
loop_1068:
	fbug,a	%fcc2,	loop_1069
loop_1069:
	tcc	%xcc,	0x5
	orn	%g6,	%g1,	%i6
	and	%o2,	%i7,	%l2
	bvc,a	%icc,	loop_1070
loop_1070:
	fbue	%fcc2,	loop_1071
loop_1071:
	fbue	%fcc2,	loop_1072
loop_1072:
	fsrc2	%f8,	%f8
	edge32l	%o3,	%i3,	%o5
	orn	%i5,	%o1,	%g7
	fba	%fcc3,	loop_1073
loop_1073:
	bleu,pn	%icc,	loop_1074
loop_1074:
	bcs,a	loop_1075
loop_1075:
	fcmpd	%fcc2,	%f12,	%f8
	be	%xcc,	loop_1076
loop_1076:
	ldd	[%l7 + 0x30],	%f8
	fble,a	%fcc3,	loop_1077
loop_1077:
	nop
	setx loop_1078, %l0, %l1
	jmpl %l1, %i0
loop_1078:
	fbule,a	%fcc3,	loop_1079
loop_1079:
	stx	%l3,	[%l7 + 0x60]
	fba,a	%fcc3,	loop_1080
loop_1080:
	ba,a	loop_1081
loop_1081:
	fbn,a	%fcc0,	loop_1082
loop_1082:
	std	%f8,	[%l7 + 0x58]
	fbl,a	%fcc0,	loop_1083
loop_1083:
	fble,a	%fcc0,	loop_1084
loop_1084:
	sllx	%g2,	0x11,	%g5
	orn	%g4,	0x1AD4,	%l6
	bcs	%xcc,	loop_1085
loop_1085:
	call	loop_1086
loop_1086:
	fbu,a	%fcc2,	loop_1087
loop_1087:
	xnor	%l1,	0x1213,	%l5
	brz,a	%o4,	loop_1088
loop_1088:
	bge,pn	%xcc,	loop_1089
loop_1089:
	stb	%l4,	[%l7 + 0x6C]
	bvs	%icc,	loop_1090
loop_1090:
	mulx	%i2,	%o7,	%l0
	fbn	%fcc0,	loop_1091
loop_1091:
	bne,a	%icc,	loop_1092
loop_1092:
	stw	%i1,	[%l7 + 0x44]
	fcmpne32	%f10,	%f4,	%o0
	fbl,a	%fcc2,	loop_1093
loop_1093:
	brlez,a	%i4,	loop_1094
loop_1094:
	lduh	[%l7 + 0x54],	%o6
	ble,a	%icc,	loop_1095
loop_1095:
	stw	%g3,	[%l7 + 0x44]
	fmovdle	%icc,	%f7,	%f4
	bpos,a	loop_1096
loop_1096:
	brlez	%g1,	loop_1097
loop_1097:
	ldx	[%l7 + 0x48],	%g6
	lduw	[%l7 + 0x4C],	%o2
	sdivx	%i6,	0x199A,	%l2
	edge32l	%i7,	%o3,	%i3
	bpos,a,pn	%xcc,	loop_1098
loop_1098:
	addc	%o5,	%o1,	%i5
	ldub	[%l7 + 0x7A],	%i0
	fbne,a	%fcc0,	loop_1099
loop_1099:
	bcs,a,pt	%xcc,	loop_1100
loop_1100:
	brgez,a	%l3,	loop_1101
loop_1101:
	fmuld8ulx16	%f2,	%f12,	%f4
	brgz,a	%g7,	loop_1102
loop_1102:
	edge16n	%g2,	%g4,	%l6
	stw	%g5,	[%l7 + 0x40]
	xorcc	%l5,	0x1585,	%o4
	bvs,pn	%icc,	loop_1103
loop_1103:
	fmovrdlez	%l1,	%f4,	%f10
	fble	%fcc1,	loop_1104
loop_1104:
	movne	%icc,	%i2,	%o7
	nop
	setx loop_1105, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1105:
	ba,a	loop_1106
loop_1106:
	ldsh	[%l7 + 0x54],	%l0
	fbug,a	%fcc3,	loop_1107
loop_1107:
	bg,pn	%xcc,	loop_1108
loop_1108:
	fornot1s	%f9,	%f2,	%f13
	brz	%l4,	loop_1109
loop_1109:
	bneg,pt	%xcc,	loop_1110
loop_1110:
	andcc	%o0,	%i4,	%i1
	bne,a,pt	%xcc,	loop_1111
loop_1111:
	movne	%icc,	%g3,	%o6
	fbe,a	%fcc1,	loop_1112
loop_1112:
	be,a	%xcc,	loop_1113
loop_1113:
	bcs	%icc,	loop_1114
loop_1114:
	movrgz	%g6,	0x280,	%g1
	fble	%fcc2,	loop_1115
loop_1115:
	fbne	%fcc2,	loop_1116
loop_1116:
	fexpand	%f8,	%f6
	fbne	%fcc2,	loop_1117
loop_1117:
	fbu,a	%fcc3,	loop_1118
loop_1118:
	lduw	[%l7 + 0x10],	%o2
	fblg,a	%fcc0,	loop_1119
loop_1119:
	fsrc1s	%f11,	%f6
	fbl	%fcc1,	loop_1120
loop_1120:
	stb	%i6,	[%l7 + 0x7E]
	fnands	%f2,	%f1,	%f5
	stx	%i7,	[%l7 + 0x38]
	lduh	[%l7 + 0x38],	%o3
	bvc	%xcc,	loop_1121
loop_1121:
	fbge,a	%fcc2,	loop_1122
loop_1122:
	fbuge,a	%fcc1,	loop_1123
loop_1123:
	fbn,a	%fcc0,	loop_1124
loop_1124:
	fbo,a	%fcc2,	loop_1125
loop_1125:
	fnegd	%f14,	%f12
	smul	%i3,	0x0DFB,	%o5
	fexpand	%f14,	%f4
	edge8l	%o1,	%l2,	%i5
	fbo	%fcc2,	loop_1126
loop_1126:
	st	%f11,	[%l7 + 0x58]
	bge,a,pn	%icc,	loop_1127
loop_1127:
	fone	%f8
	fmovrdgz	%i0,	%f12,	%f0
	movgu	%icc,	%g7,	%g2
	fmovrdlez	%g4,	%f12,	%f0
	be,pt	%icc,	loop_1128
loop_1128:
	brz,a	%l3,	loop_1129
loop_1129:
	fble	%fcc1,	loop_1130
loop_1130:
	fbge,a	%fcc3,	loop_1131
loop_1131:
	fbu	%fcc1,	loop_1132
loop_1132:
	lduh	[%l7 + 0x62],	%g5
	fbug,a	%fcc1,	loop_1133
loop_1133:
	fbl	%fcc3,	loop_1134
loop_1134:
	bpos,pn	%xcc,	loop_1135
loop_1135:
	edge16	%l5,	%o4,	%l6
	fbg,a	%fcc1,	loop_1136
loop_1136:
	fbu	%fcc3,	loop_1137
loop_1137:
	fba,a	%fcc2,	loop_1138
loop_1138:
	fcmpeq16	%f10,	%f8,	%l1
	subcc	%o7,	%l0,	%i2
	brlez,a	%o0,	loop_1139
loop_1139:
	bshuffle	%f0,	%f12,	%f10
	fbge	%fcc1,	loop_1140
loop_1140:
	fnot1s	%f8,	%f14
	fone	%f6
	bne,a	%xcc,	loop_1141
loop_1141:
	fbue,a	%fcc3,	loop_1142
loop_1142:
	tn	%icc,	0x1
	fbne	%fcc2,	loop_1143
loop_1143:
	bleu	%xcc,	loop_1144
loop_1144:
	bne,a,pt	%xcc,	loop_1145
loop_1145:
	fbuge,a	%fcc2,	loop_1146
loop_1146:
	bcs	%icc,	loop_1147
loop_1147:
	call	loop_1148
loop_1148:
	udivx	%l4,	0x0E97,	%i1
	fbo	%fcc0,	loop_1149
loop_1149:
	orn	%g3,	0x0C6B,	%o6
	fcmpgt32	%f2,	%f2,	%g6
	fba,a	%fcc3,	loop_1150
loop_1150:
	ldx	[%l7 + 0x28],	%g1
	fbul,a	%fcc0,	loop_1151
loop_1151:
	fmovsg	%xcc,	%f13,	%f14
	fcmpd	%fcc3,	%f12,	%f2
	lduw	[%l7 + 0x14],	%o2
	fbg,a	%fcc0,	loop_1152
loop_1152:
	array8	%i4,	%i6,	%o3
	fbn,a	%fcc3,	loop_1153
loop_1153:
	fcmpd	%fcc3,	%f14,	%f10
	fbe	%fcc3,	loop_1154
loop_1154:
	sllx	%i3,	%o5,	%o1
	fmovdn	%icc,	%f8,	%f4
	bvs,a,pn	%icc,	loop_1155
loop_1155:
	brnz,a	%l2,	loop_1156
loop_1156:
	fbl	%fcc1,	loop_1157
loop_1157:
	lduh	[%l7 + 0x42],	%i7
	fcmpne32	%f12,	%f8,	%i5
	nop
	setx loop_1158, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1158:
	fbu	%fcc3,	loop_1159
loop_1159:
	tleu	%icc,	0x4
	sth	%i0,	[%l7 + 0x78]
	fmovrdlez	%g2,	%f4,	%f6
	bcc,pt	%xcc,	loop_1160
loop_1160:
	ldsw	[%l7 + 0x74],	%g7
	edge16n	%g4,	%l3,	%g5
	st	%f2,	[%l7 + 0x60]
	fbe,a	%fcc0,	loop_1161
loop_1161:
	fbuge,a	%fcc3,	loop_1162
loop_1162:
	fba,a	%fcc2,	loop_1163
loop_1163:
	ld	[%l7 + 0x38],	%f11
	brlz	%l5,	loop_1164
loop_1164:
	te	%xcc,	0x1
	movn	%xcc,	%l6,	%l1
	srlx	%o4,	0x10,	%l0
	ld	[%l7 + 0x34],	%f0
	fbule	%fcc3,	loop_1165
loop_1165:
	fxors	%f12,	%f1,	%f5
	fcmpgt16	%f8,	%f12,	%i2
	bcc	%xcc,	loop_1166
loop_1166:
	lduh	[%l7 + 0x40],	%o7
	fmovdge	%icc,	%f1,	%f14
	fcmpeq32	%f14,	%f12,	%l4
	fpack16	%f0,	%f7
	ble	%xcc,	loop_1167
loop_1167:
	fbl	%fcc1,	loop_1168
loop_1168:
	fnot2	%f10,	%f10
	fmovdle	%xcc,	%f6,	%f5
	ta	%xcc,	0x5
	sethi	0x02A7,	%o0
	fmovrdne	%i1,	%f2,	%f12
	movcs	%xcc,	%o6,	%g3
	tne	%xcc,	0x1
	andn	%g6,	0x0C86,	%g1
	fbo	%fcc2,	loop_1169
loop_1169:
	fbule,a	%fcc3,	loop_1170
loop_1170:
	fbue,a	%fcc0,	loop_1171
loop_1171:
	bgu,pn	%xcc,	loop_1172
loop_1172:
	ldx	[%l7 + 0x20],	%i4
	brgez,a	%i6,	loop_1173
loop_1173:
	ba,a,pn	%xcc,	loop_1174
loop_1174:
	fmul8x16au	%f2,	%f13,	%f8
	brnz	%o3,	loop_1175
loop_1175:
	umulcc	%i3,	%o2,	%o1
	addc	%o5,	0x09BE,	%l2
	nop
	setx loop_1176, %l0, %l1
	jmpl %l1, %i5
loop_1176:
	bne,a	%xcc,	loop_1177
loop_1177:
	bl,a	%icc,	loop_1178
loop_1178:
	ldub	[%l7 + 0x4E],	%i0
	fbule	%fcc2,	loop_1179
loop_1179:
	stx	%g2,	[%l7 + 0x38]
	ba,a,pt	%xcc,	loop_1180
loop_1180:
	bgu,a	loop_1181
loop_1181:
	andncc	%g7,	%g4,	%i7
	stw	%l3,	[%l7 + 0x2C]
	movvc	%icc,	%l5,	%g5
	call	loop_1182
loop_1182:
	fmovrdgz	%l6,	%f0,	%f8
	fba	%fcc3,	loop_1183
loop_1183:
	bvs,pt	%xcc,	loop_1184
loop_1184:
	stw	%o4,	[%l7 + 0x78]
	fcmpeq16	%f10,	%f0,	%l1
	bshuffle	%f2,	%f4,	%f14
	brgez,a	%i2,	loop_1185
loop_1185:
	ldd	[%l7 + 0x30],	%f12
	bcs,a	loop_1186
loop_1186:
	movre	%o7,	%l4,	%l0
	lduh	[%l7 + 0x2A],	%i1
	be,pn	%icc,	loop_1187
loop_1187:
	fmovdge	%xcc,	%f15,	%f15
	fba	%fcc0,	loop_1188
loop_1188:
	sra	%o0,	0x1B,	%g3
	bge,pt	%icc,	loop_1189
loop_1189:
	fornot1	%f4,	%f14,	%f0
	bgu,a,pt	%xcc,	loop_1190
loop_1190:
	ldsb	[%l7 + 0x78],	%o6
	fmovsneg	%xcc,	%f6,	%f0
	be	%xcc,	loop_1191
loop_1191:
	sethi	0x1EDB,	%g6
	bn,a,pt	%icc,	loop_1192
loop_1192:
	fcmpne32	%f8,	%f6,	%g1
	nop
	setx loop_1193, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1193:
	bneg,pn	%icc,	loop_1194
loop_1194:
	bneg,a,pn	%icc,	loop_1195
loop_1195:
	bneg	loop_1196
loop_1196:
	edge32	%i4,	%o3,	%i6
	ldsh	[%l7 + 0x1E],	%o2
	tg	%icc,	0x5
	fbn	%fcc2,	loop_1197
loop_1197:
	fexpand	%f12,	%f14
	st	%f9,	[%l7 + 0x44]
	edge32n	%i3,	%o5,	%l2
	bn,a	%icc,	loop_1198
loop_1198:
	addcc	%i5,	0x0D6F,	%o1
	fbn,a	%fcc2,	loop_1199
loop_1199:
	fbge,a	%fcc2,	loop_1200
loop_1200:
	std	%f6,	[%l7 + 0x10]
	fsrc1s	%f1,	%f11
	bl,a,pn	%icc,	loop_1201
loop_1201:
	brlez,a	%i0,	loop_1202
loop_1202:
	stw	%g7,	[%l7 + 0x50]
	tne	%xcc,	0x6
	edge32ln	%g2,	%g4,	%i7
	bgu,a,pt	%xcc,	loop_1203
loop_1203:
	stw	%l3,	[%l7 + 0x0C]
	brnz	%l5,	loop_1204
loop_1204:
	lduw	[%l7 + 0x50],	%g5
	brlz,a	%l6,	loop_1205
loop_1205:
	brnz	%o4,	loop_1206
loop_1206:
	orn	%i2,	0x1678,	%l1
	bl	%icc,	loop_1207
loop_1207:
	call	loop_1208
loop_1208:
	sth	%o7,	[%l7 + 0x74]
	nop
	setx loop_1209, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1209:
	nop
	setx loop_1210, %l0, %l1
	jmpl %l1, %l4
loop_1210:
	fbu,a	%fcc0,	loop_1211
loop_1211:
	ldd	[%l7 + 0x60],	%f4
	tvs	%icc,	0x2
	bl,a	%xcc,	loop_1212
loop_1212:
	nop
	setx loop_1213, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1213:
	ldub	[%l7 + 0x48],	%l0
	array32	%o0,	%g3,	%i1
	udivx	%g6,	0x1551,	%o6
	fbe	%fcc1,	loop_1214
loop_1214:
	tl	%icc,	0x0
	bshuffle	%f8,	%f6,	%f14
	nop
	setx loop_1215, %l0, %l1
	jmpl %l1, %i4
loop_1215:
	udivx	%g1,	0x1B40,	%o3
	fbule,a	%fcc2,	loop_1216
loop_1216:
	fba	%fcc1,	loop_1217
loop_1217:
	fpsub16	%f2,	%f4,	%f4
	bleu,a	%icc,	loop_1218
loop_1218:
	bpos	%xcc,	loop_1219
loop_1219:
	ldd	[%l7 + 0x58],	%f6
	fbo,a	%fcc1,	loop_1220
loop_1220:
	sllx	%i6,	0x1E,	%o2
	bne	loop_1221
loop_1221:
	fbo	%fcc0,	loop_1222
loop_1222:
	fbe	%fcc2,	loop_1223
loop_1223:
	fbge	%fcc0,	loop_1224
loop_1224:
	bshuffle	%f12,	%f10,	%f10
	taddcctv	%i3,	%o5,	%i5
	fmovdle	%icc,	%f6,	%f2
	bne,pn	%icc,	loop_1225
loop_1225:
	tne	%icc,	0x1
	stx	%l2,	[%l7 + 0x38]
	stb	%o1,	[%l7 + 0x7E]
	fbue,a	%fcc1,	loop_1226
loop_1226:
	bvc,pn	%icc,	loop_1227
loop_1227:
	bl,a	loop_1228
loop_1228:
	brgez	%g7,	loop_1229
loop_1229:
	movgu	%xcc,	%g2,	%i0
	fcmpeq16	%f14,	%f8,	%i7
	ldx	[%l7 + 0x50],	%g4
	fnot1	%f4,	%f4
	nop
	setx loop_1230, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1230:
	sth	%l3,	[%l7 + 0x50]
	std	%f6,	[%l7 + 0x48]
	taddcctv	%l5,	%l6,	%o4
	fbl,a	%fcc2,	loop_1231
loop_1231:
	fbl,a	%fcc0,	loop_1232
loop_1232:
	fxnors	%f14,	%f9,	%f1
	bshuffle	%f10,	%f12,	%f2
	fmovrdne	%i2,	%f2,	%f4
	edge8n	%l1,	%o7,	%l4
	fble	%fcc0,	loop_1233
loop_1233:
	udivx	%l0,	0x0871,	%g5
	fbne,a	%fcc1,	loop_1234
loop_1234:
	fcmpeq32	%f0,	%f10,	%g3
	bleu,pn	%icc,	loop_1235
loop_1235:
	fbge,a	%fcc1,	loop_1236
loop_1236:
	fbl,a	%fcc0,	loop_1237
loop_1237:
	brlz	%i1,	loop_1238
loop_1238:
	fmovsvc	%xcc,	%f10,	%f6
	sllx	%g6,	%o0,	%i4
	nop
	setx loop_1239, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1239:
	fpack16	%f12,	%f9
	ld	[%l7 + 0x18],	%f8
	brgez	%o6,	loop_1240
loop_1240:
	fnors	%f13,	%f3,	%f7
	orcc	%g1,	0x049F,	%o3
	std	%f0,	[%l7 + 0x70]
	brz	%o2,	loop_1241
loop_1241:
	subccc	%i3,	%i6,	%o5
	fblg,a	%fcc1,	loop_1242
loop_1242:
	ld	[%l7 + 0x40],	%f12
	bneg	loop_1243
loop_1243:
	fbl	%fcc0,	loop_1244
loop_1244:
	fbuge,a	%fcc3,	loop_1245
loop_1245:
	bcs,pn	%icc,	loop_1246
loop_1246:
	fbe,a	%fcc3,	loop_1247
loop_1247:
	srlx	%l2,	%o1,	%i5
	bl	loop_1248
loop_1248:
	fcmpne32	%f6,	%f4,	%g2
	bge,pt	%icc,	loop_1249
loop_1249:
	fmul8x16al	%f7,	%f15,	%f14
	fxors	%f14,	%f1,	%f6
	movrne	%g7,	%i0,	%g4
	brlz,a	%i7,	loop_1250
loop_1250:
	tg	%xcc,	0x7
	fbo,a	%fcc0,	loop_1251
loop_1251:
	brlz	%l3,	loop_1252
loop_1252:
	fblg,a	%fcc2,	loop_1253
loop_1253:
	fbul	%fcc0,	loop_1254
loop_1254:
	stw	%l6,	[%l7 + 0x30]
	bleu,a	loop_1255
loop_1255:
	lduh	[%l7 + 0x24],	%o4
	fors	%f12,	%f10,	%f1
	bcc,a	loop_1256
loop_1256:
	subccc	%i2,	%l5,	%l1
	fbge	%fcc3,	loop_1257
loop_1257:
	brgz,a	%l4,	loop_1258
loop_1258:
	bg,a	loop_1259
loop_1259:
	fbge,a	%fcc1,	loop_1260
loop_1260:
	nop
	setx loop_1261, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1261:
	fba	%fcc0,	loop_1262
loop_1262:
	ldd	[%l7 + 0x78],	%f6
	ldsb	[%l7 + 0x60],	%o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type f   	: 184
!	Type cti   	: 492
!	Type i   	: 180
!	Type l   	: 144
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
main_t5:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x0,	%g2
	set	0x8,	%g3
	set	0xF,	%g4
	set	0x3,	%g5
	set	0x5,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xF,	%i1
	set	-0x2,	%i2
	set	-0xC,	%i3
	set	-0xA,	%i4
	set	-0xE,	%i5
	set	-0x8,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x10D830C7,	%l0
	set	0x07D34FE6,	%l1
	set	0x54E297A3,	%l2
	set	0x77D72F2B,	%l3
	set	0x414BDE7E,	%l4
	set	0x22DA573B,	%l5
	set	0x3015B110,	%l6
	!# Output registers
	set	0x00F5,	%o0
	set	0x0E87,	%o1
	set	0x01C1,	%o2
	set	0x0FF4,	%o3
	set	0x0866,	%o4
	set	0x0FFF,	%o5
	set	-0x09FA,	%o6
	set	0x1925,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	array32	%l0,	%g3,	%i1
	fble	%fcc3,	loop_1263
loop_1263:
	fpmerge	%f12,	%f13,	%f10
	andcc	%g6,	%g5,	%o0
	fmovsne	%icc,	%f11,	%f14
	fbul,a	%fcc0,	loop_1264
loop_1264:
	alignaddr	%i4,	%o6,	%o3
	fmovsge	%icc,	%f9,	%f8
	bvc	loop_1265
loop_1265:
	fmovscc	%xcc,	%f5,	%f1
	fmovde	%icc,	%f6,	%f15
	std	%f2,	[%l7 + 0x40]
	nop
	setx loop_1266, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1266:
	taddcc	%o2,	%g1,	%i3
	and	%o5,	%i6,	%l2
	sethi	0x04C4,	%o1
	movn	%xcc,	%i5,	%g2
	movrgez	%g7,	%g4,	%i7
	lduw	[%l7 + 0x5C],	%l3
	bcs,a,pt	%icc,	loop_1267
loop_1267:
	ta	%xcc,	0x2
	bgu,a,pt	%icc,	loop_1268
loop_1268:
	fmovrdne	%l6,	%f14,	%f10
	ldsh	[%l7 + 0x4E],	%o4
	movl	%icc,	%i2,	%l5
	fnot1	%f4,	%f12
	andn	%l1,	%i0,	%l4
	addc	%o7,	%g3,	%l0
	fmovdleu	%xcc,	%f7,	%f0
	tg	%xcc,	0x7
	fbug	%fcc0,	loop_1269
loop_1269:
	sdivcc	%i1,	0x130D,	%g6
	tsubcc	%g5,	0x0E6F,	%o0
	edge32n	%o6,	%o3,	%o2
	fbue,a	%fcc0,	loop_1270
loop_1270:
	tpos	%xcc,	0x5
	fxnors	%f14,	%f7,	%f13
	xorcc	%g1,	0x0FED,	%i3
	bge,pn	%xcc,	loop_1271
loop_1271:
	fcmpne16	%f10,	%f2,	%i4
	subcc	%i6,	0x14E3,	%l2
	bgu,a	loop_1272
loop_1272:
	bvc,pn	%icc,	loop_1273
loop_1273:
	fcmple16	%f12,	%f6,	%o1
	andn	%o5,	0x19BC,	%g2
	tcs	%icc,	0x5
	addccc	%i5,	0x1C11,	%g7
	bcc,pn	%xcc,	loop_1274
loop_1274:
	movg	%icc,	%g4,	%l3
	sllx	%i7,	%l6,	%i2
	tn	%xcc,	0x4
	movl	%icc,	%l5,	%l1
	move	%icc,	%i0,	%o4
	umul	%o7,	0x126D,	%l4
	lduh	[%l7 + 0x2E],	%g3
	mova	%xcc,	%l0,	%i1
	tleu	%icc,	0x7
	and	%g6,	%o0,	%g5
	xnor	%o6,	0x0044,	%o2
	movrne	%g1,	0x32E,	%o3
	alignaddr	%i3,	%i6,	%i4
	andcc	%o1,	0x151B,	%o5
	lduw	[%l7 + 0x1C],	%l2
	tsubcc	%i5,	%g2,	%g4
	fpsub32	%f2,	%f12,	%f10
	movrgez	%g7,	%l3,	%l6
	fcmple32	%f2,	%f12,	%i2
	bleu,a,pn	%xcc,	loop_1275
loop_1275:
	andncc	%l5,	%l1,	%i0
	fnor	%f0,	%f10,	%f6
	addcc	%o4,	%o7,	%i7
	fmovrsgz	%l4,	%f10,	%f11
	sdiv	%l0,	0x0D36,	%g3
	fnegd	%f4,	%f14
	smulcc	%i1,	0x0DB9,	%g6
	movrlz	%g5,	%o0,	%o6
	tge	%xcc,	0x5
	array16	%g1,	%o2,	%o3
	fmovsneg	%xcc,	%f14,	%f14
	mova	%xcc,	%i3,	%i6
	nop
	setx loop_1276, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1276:
	brgz,a	%o1,	loop_1277
loop_1277:
	fmuld8sux16	%f13,	%f12,	%f0
	movpos	%icc,	%o5,	%i4
	xnor	%l2,	0x05F0,	%i5
	fpsub16s	%f3,	%f12,	%f4
	movg	%icc,	%g4,	%g7
	stx	%l3,	[%l7 + 0x48]
	fmul8x16au	%f8,	%f8,	%f2
	nop
	setx loop_1278, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1278:
	srl	%l6,	0x0C,	%i2
	brlz,a	%g2,	loop_1279
loop_1279:
	tn	%xcc,	0x6
	alignaddrl	%l1,	%l5,	%o4
	bl	loop_1280
loop_1280:
	movrgez	%i0,	0x1C4,	%i7
	lduh	[%l7 + 0x20],	%o7
	movgu	%icc,	%l4,	%g3
	fba	%fcc2,	loop_1281
loop_1281:
	movl	%icc,	%i1,	%l0
	ba,a,pn	%xcc,	loop_1282
loop_1282:
	sll	%g6,	0x1C,	%o0
	movge	%icc,	%o6,	%g5
	edge32l	%g1,	%o3,	%i3
	edge8n	%i6,	%o1,	%o5
	call	loop_1283
loop_1283:
	smul	%o2,	%i4,	%i5
	mulx	%l2,	0x0FB4,	%g7
	movn	%xcc,	%l3,	%g4
	taddcctv	%l6,	0x0692,	%i2
	std	%f12,	[%l7 + 0x28]
	movre	%g2,	0x2C8,	%l5
	sra	%l1,	%i0,	%o4
	edge16l	%o7,	%l4,	%g3
	sethi	0x04C5,	%i1
	sdivcc	%l0,	0x0BA6,	%i7
	bg,pn	%icc,	loop_1284
loop_1284:
	movvc	%icc,	%o0,	%g6
	std	%f6,	[%l7 + 0x60]
	ldd	[%l7 + 0x60],	%f8
	array32	%o6,	%g1,	%g5
	fnot2	%f10,	%f8
	subccc	%o3,	%i3,	%i6
	udivx	%o1,	0x17CF,	%o5
	sethi	0x0FFC,	%o2
	fcmpne32	%f14,	%f12,	%i5
	std	%f6,	[%l7 + 0x60]
	mulx	%l2,	%i4,	%g7
	tleu	%icc,	0x6
	bg,a	%xcc,	loop_1285
loop_1285:
	bvc,pt	%icc,	loop_1286
loop_1286:
	edge16l	%g4,	%l3,	%i2
	movne	%xcc,	%l6,	%g2
	array16	%l1,	%l5,	%i0
	fmovs	%f2,	%f11
	lduw	[%l7 + 0x64],	%o4
	tgu	%icc,	0x6
	orcc	%o7,	%g3,	%l4
	std	%f14,	[%l7 + 0x68]
	fmovscc	%icc,	%f6,	%f14
	pdist	%f0,	%f12,	%f4
	fnors	%f9,	%f9,	%f4
	andncc	%i1,	%i7,	%o0
	lduw	[%l7 + 0x2C],	%l0
	fnand	%f8,	%f12,	%f4
	fornot1	%f4,	%f14,	%f6
	fmovdcs	%xcc,	%f5,	%f9
	stx	%o6,	[%l7 + 0x50]
	st	%f6,	[%l7 + 0x28]
	movcs	%icc,	%g1,	%g5
	fmovrde	%g6,	%f10,	%f10
	alignaddr	%o3,	%i3,	%o1
	edge32	%i6,	%o5,	%o2
	tleu	%icc,	0x6
	ldsh	[%l7 + 0x7A],	%l2
	fsrc1	%f12,	%f14
	fxors	%f5,	%f6,	%f14
	sdivx	%i4,	0x11E7,	%g7
	fcmpeq16	%f6,	%f2,	%i5
	fnot2s	%f9,	%f13
	sll	%g4,	0x17,	%i2
	xnorcc	%l3,	%g2,	%l6
	ldd	[%l7 + 0x50],	%f0
	edge32ln	%l5,	%i0,	%o4
	fand	%f2,	%f4,	%f2
	addccc	%l1,	0x17D8,	%g3
	fbug	%fcc1,	loop_1287
loop_1287:
	fornot2	%f6,	%f6,	%f10
	ba,a	%icc,	loop_1288
loop_1288:
	bge,a,pt	%xcc,	loop_1289
loop_1289:
	orn	%o7,	%i1,	%l4
	ta	%xcc,	0x4
	movre	%o0,	0x3CE,	%l0
	fcmped	%fcc1,	%f4,	%f12
	tneg	%xcc,	0x4
	movgu	%icc,	%i7,	%o6
	fbo,a	%fcc3,	loop_1290
loop_1290:
	taddcc	%g1,	0x1650,	%g6
	fcmpgt16	%f10,	%f12,	%o3
	tcs	%icc,	0x4
	fcmpd	%fcc0,	%f14,	%f14
	fble,a	%fcc0,	loop_1291
loop_1291:
	and	%i3,	0x0B00,	%o1
	fmovscc	%icc,	%f4,	%f2
	fmovdvs	%icc,	%f13,	%f12
	ldx	[%l7 + 0x40],	%g5
	movvc	%icc,	%o5,	%o2
	movneg	%icc,	%i6,	%l2
	umul	%g7,	%i4,	%g4
	sdivx	%i5,	0x0471,	%i2
	fcmpeq16	%f2,	%f14,	%l3
	ble,pt	%icc,	loop_1292
loop_1292:
	xnorcc	%g2,	0x053D,	%l6
	mulx	%i0,	%o4,	%l1
	udivcc	%l5,	0x164B,	%g3
	fpadd16	%f14,	%f12,	%f6
	fbe,a	%fcc1,	loop_1293
loop_1293:
	mulx	%i1,	0x1650,	%o7
	udiv	%o0,	0x0028,	%l4
	fmul8x16	%f7,	%f12,	%f14
	edge16ln	%l0,	%i7,	%g1
	sth	%g6,	[%l7 + 0x58]
	movrlez	%o3,	0x2E3,	%i3
	fnot1	%f14,	%f6
	call	loop_1294
loop_1294:
	tle	%icc,	0x1
	movneg	%icc,	%o1,	%o6
	lduh	[%l7 + 0x50],	%g5
	movneg	%icc,	%o5,	%i6
	edge32	%o2,	%l2,	%g7
	ld	[%l7 + 0x6C],	%f3
	taddcc	%i4,	0x1A68,	%i5
	st	%f12,	[%l7 + 0x60]
	smulcc	%i2,	%g4,	%g2
	stx	%l3,	[%l7 + 0x40]
	tn	%xcc,	0x7
	edge16	%i0,	%o4,	%l1
	edge16n	%l6,	%g3,	%i1
	movcc	%icc,	%l5,	%o7
	tsubcctv	%o0,	%l4,	%i7
	addccc	%l0,	0x096D,	%g6
	fbge,a	%fcc2,	loop_1295
loop_1295:
	subcc	%g1,	0x065C,	%i3
	ldx	[%l7 + 0x30],	%o1
	fornot2s	%f9,	%f7,	%f7
	sethi	0x19DA,	%o3
	orncc	%o6,	0x025F,	%o5
	array8	%i6,	%o2,	%l2
	st	%f8,	[%l7 + 0x64]
	fxnors	%f9,	%f15,	%f10
	tg	%xcc,	0x0
	movgu	%xcc,	%g5,	%i4
	edge32n	%i5,	%g7,	%i2
	tvc	%icc,	0x4
	lduh	[%l7 + 0x6E],	%g4
	movcs	%icc,	%l3,	%g2
	array16	%o4,	%l1,	%i0
	tle	%icc,	0x5
	fmovrslz	%l6,	%f1,	%f1
	ldsw	[%l7 + 0x6C],	%i1
	bgu,a,pn	%xcc,	loop_1296
loop_1296:
	tsubcc	%l5,	%g3,	%o7
	bshuffle	%f10,	%f0,	%f6
	popc	0x10B6,	%l4
	movvs	%icc,	%i7,	%o0
	movgu	%xcc,	%l0,	%g1
	edge8l	%g6,	%i3,	%o3
	sdivcc	%o1,	0x0CC7,	%o5
	be	loop_1297
loop_1297:
	fnor	%f10,	%f6,	%f12
	fmovrsne	%o6,	%f7,	%f8
	fcmple16	%f12,	%f14,	%o2
	fbul	%fcc0,	loop_1298
loop_1298:
	ldsw	[%l7 + 0x38],	%l2
	brlz,a	%i6,	loop_1299
loop_1299:
	te	%icc,	0x0
	fnand	%f4,	%f10,	%f4
	fandnot2	%f2,	%f4,	%f14
	fmovde	%icc,	%f13,	%f0
	edge16l	%i4,	%i5,	%g5
	fmovrdgz	%i2,	%f8,	%f6
	movvc	%icc,	%g7,	%l3
	fandnot2s	%f7,	%f13,	%f7
	edge32n	%g4,	%o4,	%l1
	fmovsgu	%icc,	%f14,	%f6
	ldx	[%l7 + 0x08],	%i0
	movrgez	%g2,	%l6,	%l5
	tvs	%icc,	0x7
	tpos	%xcc,	0x3
	subcc	%g3,	%o7,	%i1
	fmul8ulx16	%f0,	%f14,	%f6
	udivcc	%l4,	0x15FB,	%i7
	srlx	%o0,	0x0B,	%g1
	srl	%g6,	0x16,	%i3
	mova	%xcc,	%o3,	%o1
	movle	%xcc,	%l0,	%o5
	smul	%o2,	0x1657,	%o6
	ldsw	[%l7 + 0x40],	%i6
	fmuld8ulx16	%f15,	%f12,	%f12
	ldub	[%l7 + 0x28],	%i4
	tne	%icc,	0x4
	fornot1s	%f0,	%f2,	%f10
	orn	%l2,	0x184C,	%g5
	bvs,a,pn	%icc,	loop_1300
loop_1300:
	tne	%xcc,	0x3
	edge8n	%i2,	%g7,	%i5
	fpadd16s	%f3,	%f6,	%f0
	tsubcc	%l3,	0x10F1,	%g4
	stw	%l1,	[%l7 + 0x14]
	array8	%o4,	%g2,	%i0
	tpos	%xcc,	0x3
	addcc	%l5,	0x0672,	%g3
	lduw	[%l7 + 0x64],	%l6
	ldd	[%l7 + 0x28],	%f6
	tge	%xcc,	0x4
	siam	0x5
	stb	%i1,	[%l7 + 0x3A]
	movre	%o7,	%l4,	%o0
	array32	%i7,	%g1,	%i3
	sth	%o3,	[%l7 + 0x42]
	andcc	%g6,	%o1,	%o5
	fba	%fcc3,	loop_1301
loop_1301:
	bpos,pt	%icc,	loop_1302
loop_1302:
	sth	%l0,	[%l7 + 0x2A]
	edge32n	%o2,	%o6,	%i6
	edge32l	%l2,	%g5,	%i2
	tn	%xcc,	0x2
	ldsh	[%l7 + 0x66],	%i4
	tl	%xcc,	0x1
	movg	%xcc,	%i5,	%g7
	fmovdg	%icc,	%f1,	%f2
	movle	%xcc,	%g4,	%l1
	for	%f8,	%f4,	%f10
	edge16l	%l3,	%o4,	%i0
	te	%xcc,	0x6
	fabss	%f7,	%f13
	edge16n	%g2,	%g3,	%l5
	mova	%icc,	%i1,	%o7
	edge32n	%l4,	%o0,	%l6
	edge16l	%i7,	%i3,	%g1
	addccc	%g6,	%o3,	%o5
	orncc	%o1,	%o2,	%l0
	array8	%o6,	%i6,	%l2
	fcmpgt16	%f0,	%f14,	%i2
	fzeros	%f12
	std	%f4,	[%l7 + 0x48]
	taddcctv	%g5,	%i4,	%g7
	brgz,a	%g4,	loop_1303
loop_1303:
	addc	%i5,	0x1E4E,	%l3
	edge32	%l1,	%i0,	%o4
	tg	%icc,	0x1
	movgu	%xcc,	%g3,	%g2
	tl	%xcc,	0x5
	tn	%xcc,	0x5
	edge32l	%i1,	%l5,	%o7
	sll	%l4,	%l6,	%o0
	edge32ln	%i7,	%g1,	%i3
	orncc	%g6,	0x1AD4,	%o5
	fornot1	%f4,	%f8,	%f8
	tcs	%xcc,	0x1
	bleu,a	%xcc,	loop_1304
loop_1304:
	fandnot1s	%f14,	%f10,	%f7
	alignaddrl	%o3,	%o2,	%l0
	stb	%o1,	[%l7 + 0x18]
	stw	%o6,	[%l7 + 0x44]
	fsrc2	%f0,	%f10
	movcc	%xcc,	%i6,	%l2
	orn	%g5,	0x18E6,	%i4
	fmovsl	%icc,	%f6,	%f1
	fbg	%fcc0,	loop_1305
loop_1305:
	ldsw	[%l7 + 0x5C],	%i2
	sethi	0x1D07,	%g4
	stx	%g7,	[%l7 + 0x38]
	udiv	%l3,	0x023B,	%l1
	fmovrdne	%i5,	%f2,	%f12
	ldsw	[%l7 + 0x64],	%o4
	ldx	[%l7 + 0x78],	%i0
	andcc	%g2,	%g3,	%i1
	tvs	%icc,	0x6
	umul	%o7,	0x1D1D,	%l4
	sethi	0x0B82,	%l6
	fblg	%fcc0,	loop_1306
loop_1306:
	bvs,a,pt	%xcc,	loop_1307
loop_1307:
	edge32n	%o0,	%l5,	%i7
	lduw	[%l7 + 0x50],	%i3
	tcc	%xcc,	0x5
	fbl	%fcc2,	loop_1308
loop_1308:
	edge8l	%g1,	%o5,	%o3
	bshuffle	%f2,	%f2,	%f14
	fcmpeq16	%f12,	%f6,	%o2
	ld	[%l7 + 0x18],	%f4
	ldsw	[%l7 + 0x18],	%g6
	fnor	%f2,	%f8,	%f8
	orn	%l0,	0x19B3,	%o1
	alignaddr	%o6,	%l2,	%g5
	fmovdneg	%xcc,	%f12,	%f9
	sll	%i4,	%i2,	%i6
	stx	%g4,	[%l7 + 0x68]
	sth	%g7,	[%l7 + 0x5C]
	edge32n	%l3,	%l1,	%o4
	orncc	%i0,	0x1E1F,	%i5
	sub	%g3,	%i1,	%o7
	fbe	%fcc3,	loop_1309
loop_1309:
	fcmpeq32	%f0,	%f6,	%g2
	mulx	%l6,	%l4,	%l5
	fandnot2	%f14,	%f0,	%f10
	ldsb	[%l7 + 0x51],	%i7
	srl	%i3,	%g1,	%o5
	fmovs	%f4,	%f15
	edge16	%o0,	%o3,	%o2
	fpadd16	%f2,	%f14,	%f2
	fcmpne32	%f4,	%f14,	%g6
	bne	loop_1310
loop_1310:
	movrlz	%l0,	0x046,	%o6
	andn	%l2,	0x119D,	%g5
	ld	[%l7 + 0x78],	%f13
	tl	%icc,	0x7
	subcc	%o1,	0x03B2,	%i2
	ldsw	[%l7 + 0x38],	%i4
	movneg	%icc,	%g4,	%g7
	tle	%xcc,	0x6
	fnot1	%f6,	%f12
	fornot1s	%f11,	%f10,	%f6
	siam	0x0
	addcc	%i6,	%l1,	%l3
	sth	%i0,	[%l7 + 0x2A]
	lduw	[%l7 + 0x5C],	%o4
	fblg	%fcc2,	loop_1311
loop_1311:
	fmul8ulx16	%f14,	%f14,	%f12
	tl	%icc,	0x2
	edge8	%i5,	%g3,	%i1
	tgu	%xcc,	0x5
	xorcc	%o7,	0x07C9,	%l6
	tpos	%xcc,	0x3
	brlz	%g2,	loop_1312
loop_1312:
	movge	%xcc,	%l5,	%i7
	xorcc	%l4,	0x11CF,	%i3
	brgz,a	%o5,	loop_1313
loop_1313:
	taddcc	%g1,	%o0,	%o3
	fmovdn	%xcc,	%f7,	%f5
	tn	%icc,	0x7
	bcc,pt	%xcc,	loop_1314
loop_1314:
	movvc	%icc,	%g6,	%l0
	xnorcc	%o6,	0x0FCC,	%o2
	subc	%l2,	%o1,	%i2
	movre	%i4,	0x2BC,	%g5
	movn	%icc,	%g7,	%g4
	te	%xcc,	0x2
	tcs	%icc,	0x7
	orn	%l1,	%i6,	%i0
	bge,a	loop_1315
loop_1315:
	array32	%l3,	%o4,	%i5
	tn	%icc,	0x6
	udiv	%i1,	0x114E,	%o7
	tn	%xcc,	0x3
	tcs	%icc,	0x4
	and	%g3,	0x1754,	%l6
	fnot1s	%f8,	%f4
	tle	%xcc,	0x3
	lduh	[%l7 + 0x50],	%g2
	ldd	[%l7 + 0x50],	%f0
	fble,a	%fcc0,	loop_1316
loop_1316:
	be,pn	%icc,	loop_1317
loop_1317:
	tne	%xcc,	0x4
	movrgez	%l5,	%i7,	%i3
	andcc	%o5,	0x0362,	%l4
	fbne,a	%fcc0,	loop_1318
loop_1318:
	tneg	%icc,	0x2
	ldsb	[%l7 + 0x53],	%o0
	add	%o3,	%g1,	%g6
	smul	%l0,	0x1000,	%o2
	bge,pt	%xcc,	loop_1319
loop_1319:
	edge16l	%o6,	%l2,	%o1
	movvc	%xcc,	%i2,	%i4
	movre	%g5,	0x300,	%g4
	std	%f8,	[%l7 + 0x60]
	fmovdg	%icc,	%f9,	%f7
	xnorcc	%g7,	%l1,	%i0
	tn	%icc,	0x5
	movne	%xcc,	%i6,	%o4
	movrgz	%l3,	%i5,	%i1
	fxnor	%f6,	%f10,	%f2
	popc	0x109B,	%g3
	ld	[%l7 + 0x7C],	%f9
	subc	%o7,	%l6,	%l5
	st	%f4,	[%l7 + 0x78]
	fbue	%fcc0,	loop_1320
loop_1320:
	udivx	%i7,	0x0F2D,	%g2
	xnorcc	%i3,	%l4,	%o5
	alignaddr	%o0,	%g1,	%g6
	fcmple16	%f6,	%f4,	%l0
	udivx	%o2,	0x0467,	%o3
	tcs	%xcc,	0x2
	alignaddrl	%o6,	%o1,	%i2
	te	%xcc,	0x2
	sdiv	%l2,	0x0115,	%g5
	andn	%i4,	0x1C63,	%g4
	te	%xcc,	0x4
	sra	%g7,	0x12,	%l1
	alignaddrl	%i6,	%i0,	%o4
	ldx	[%l7 + 0x38],	%i5
	xor	%l3,	0x1812,	%g3
	fmovrslz	%i1,	%f14,	%f15
	movl	%icc,	%l6,	%o7
	orncc	%l5,	0x1E6F,	%g2
	bg,a,pt	%icc,	loop_1321
loop_1321:
	movrgz	%i7,	0x38B,	%i3
	edge32n	%l4,	%o0,	%o5
	smulcc	%g1,	%l0,	%g6
	movne	%icc,	%o2,	%o3
	nop
	setx loop_1322, %l0, %l1
	jmpl %l1, %o1
loop_1322:
	movrlz	%o6,	0x100,	%l2
	orcc	%g5,	%i2,	%i4
	udivx	%g4,	0x1BEE,	%l1
	movpos	%icc,	%g7,	%i0
	tpos	%icc,	0x4
	edge32l	%i6,	%o4,	%l3
	movpos	%xcc,	%g3,	%i1
	fcmpd	%fcc0,	%f6,	%f2
	movle	%icc,	%i5,	%o7
	subc	%l6,	0x1B1B,	%l5
	ldd	[%l7 + 0x78],	%f12
	ldx	[%l7 + 0x18],	%i7
	ldsb	[%l7 + 0x1C],	%i3
	tl	%icc,	0x3
	move	%icc,	%l4,	%o0
	fmovsvs	%xcc,	%f3,	%f6
	andncc	%g2,	%o5,	%g1
	fcmpes	%fcc2,	%f7,	%f2
	stw	%g6,	[%l7 + 0x14]
	fmovsle	%icc,	%f9,	%f8
	ld	[%l7 + 0x2C],	%f11
	edge8n	%o2,	%l0,	%o1
	tn	%icc,	0x5
	udivx	%o6,	0x1D3F,	%o3
	edge16	%g5,	%l2,	%i2
	bn,pt	%icc,	loop_1323
loop_1323:
	addccc	%i4,	0x06C3,	%l1
	fmovdneg	%xcc,	%f8,	%f5
	fbge,a	%fcc2,	loop_1324
loop_1324:
	taddcctv	%g7,	0x184C,	%i0
	udivcc	%g4,	0x149A,	%o4
	orn	%i6,	0x05FD,	%l3
	brlez,a	%i1,	loop_1325
loop_1325:
	tn	%xcc,	0x3
	ldub	[%l7 + 0x17],	%i5
	siam	0x7
	sllx	%g3,	0x09,	%o7
	xnor	%l6,	0x0A60,	%i7
	fmovs	%f5,	%f10
	fbne	%fcc1,	loop_1326
loop_1326:
	tge	%xcc,	0x3
	movleu	%icc,	%l5,	%i3
	xnor	%l4,	%g2,	%o0
	stw	%o5,	[%l7 + 0x40]
	edge32n	%g1,	%o2,	%g6
	edge8l	%o1,	%o6,	%o3
	sdivcc	%l0,	0x0A7B,	%l2
	srlx	%g5,	%i4,	%i2
	lduh	[%l7 + 0x16],	%l1
	edge8	%g7,	%i0,	%o4
	mulscc	%g4,	0x0290,	%l3
	brgz,a	%i6,	loop_1327
loop_1327:
	subccc	%i1,	0x10B6,	%g3
	smul	%o7,	0x0EC7,	%l6
	tsubcc	%i7,	%l5,	%i5
	bl,pn	%xcc,	loop_1328
loop_1328:
	orncc	%l4,	0x0FA0,	%i3
	sdivx	%g2,	0x000C,	%o0
	tvs	%xcc,	0x3
	sll	%g1,	0x06,	%o5
	fpadd16s	%f4,	%f7,	%f14
	fmovsneg	%xcc,	%f8,	%f15
	edge16l	%o2,	%o1,	%o6
	bleu	loop_1329
loop_1329:
	te	%xcc,	0x3
	ble,a,pt	%xcc,	loop_1330
loop_1330:
	ldsh	[%l7 + 0x7A],	%g6
	udiv	%o3,	0x149C,	%l0
	movrne	%l2,	0x361,	%g5
	st	%f13,	[%l7 + 0x14]
	fmovdvs	%icc,	%f10,	%f6
	edge32ln	%i4,	%i2,	%g7
	sllx	%i0,	%o4,	%l1
	movne	%xcc,	%g4,	%i6
	sra	%l3,	%i1,	%g3
	tsubcctv	%l6,	0x1082,	%o7
	move	%xcc,	%i7,	%l5
	sethi	0x147C,	%l4
	xor	%i5,	0x0CFF,	%g2
	brgz	%o0,	loop_1331
loop_1331:
	xnorcc	%i3,	%g1,	%o2
	fmul8x16	%f6,	%f14,	%f0
	bleu,pt	%icc,	loop_1332
loop_1332:
	add	%o5,	%o1,	%g6
	array16	%o3,	%l0,	%o6
	fmovrsgz	%g5,	%f6,	%f11
	andncc	%i4,	%i2,	%l2
	sdivcc	%i0,	0x1BD8,	%g7
	xor	%o4,	%l1,	%i6
	sra	%g4,	0x11,	%l3
	ble	loop_1333
loop_1333:
	tpos	%xcc,	0x3
	ld	[%l7 + 0x4C],	%f6
	movrgz	%g3,	0x0F5,	%l6
	stb	%i1,	[%l7 + 0x14]
	edge32ln	%i7,	%l5,	%o7
	movg	%icc,	%i5,	%l4
	sllx	%o0,	%g2,	%g1
	tneg	%icc,	0x1
	movge	%xcc,	%i3,	%o5
	edge8l	%o1,	%o2,	%o3
	movcs	%xcc,	%l0,	%o6
	fpadd16s	%f15,	%f10,	%f12
	sllx	%g6,	0x04,	%i4
	taddcctv	%g5,	%l2,	%i0
	movle	%xcc,	%g7,	%o4
	umulcc	%i2,	0x1656,	%i6
	fmovscc	%xcc,	%f0,	%f6
	ldsb	[%l7 + 0x4D],	%l1
	mulscc	%l3,	%g3,	%g4
	ldub	[%l7 + 0x38],	%i1
	ta	%icc,	0x7
	addc	%l6,	%l5,	%o7
	addccc	%i5,	0x14FA,	%l4
	fmul8ulx16	%f14,	%f4,	%f6
	edge32l	%o0,	%g2,	%i7
	popc	0x0013,	%g1
	xnor	%i3,	0x0D69,	%o5
	umul	%o2,	0x07D8,	%o1
	xnor	%l0,	0x07E2,	%o6
	tg	%xcc,	0x5
	movl	%icc,	%g6,	%i4
	ld	[%l7 + 0x78],	%f5
	edge32ln	%g5,	%l2,	%o3
	fcmpes	%fcc1,	%f8,	%f13
	movge	%icc,	%i0,	%o4
	bvc	loop_1334
loop_1334:
	fmovdg	%icc,	%f12,	%f1
	sth	%g7,	[%l7 + 0x78]
	taddcctv	%i6,	%l1,	%l3
	tcc	%xcc,	0x2
	fmovrdgez	%g3,	%f8,	%f4
	subc	%g4,	0x0666,	%i1
	tgu	%icc,	0x2
	ldsw	[%l7 + 0x30],	%l6
	fble,a	%fcc1,	loop_1335
loop_1335:
	sdivcc	%i2,	0x166C,	%l5
	fzero	%f0
	edge8l	%o7,	%i5,	%l4
	movleu	%icc,	%g2,	%i7
	bpos,a	loop_1336
loop_1336:
	fpadd16	%f2,	%f14,	%f4
	st	%f11,	[%l7 + 0x58]
	srlx	%g1,	0x01,	%i3
	st	%f11,	[%l7 + 0x60]
	edge8n	%o0,	%o5,	%o2
	edge32l	%o1,	%o6,	%l0
	fmovdl	%xcc,	%f1,	%f5
	movn	%xcc,	%i4,	%g5
	sdiv	%g6,	0x0803,	%o3
	sethi	0x1CD8,	%l2
	xnorcc	%i0,	0x1218,	%g7
	fmovrdgz	%o4,	%f8,	%f4
	brnz,a	%l1,	loop_1337
loop_1337:
	ba,pn	%xcc,	loop_1338
loop_1338:
	movge	%icc,	%i6,	%l3
	tn	%icc,	0x1
	movleu	%icc,	%g4,	%i1
	movvs	%xcc,	%l6,	%g3
	edge32	%l5,	%i2,	%i5
	fnors	%f0,	%f1,	%f10
	fnot1s	%f0,	%f11
	udiv	%o7,	0x16E4,	%g2
	fbn,a	%fcc0,	loop_1339
loop_1339:
	ld	[%l7 + 0x5C],	%f9
	mulx	%l4,	0x0C3B,	%g1
	edge16l	%i7,	%o0,	%i3
	siam	0x5
	brgz	%o2,	loop_1340
loop_1340:
	ldx	[%l7 + 0x40],	%o1
	fmovrde	%o6,	%f10,	%f4
	ldub	[%l7 + 0x2B],	%l0
	fmovdcs	%icc,	%f7,	%f9
	mulx	%o5,	%g5,	%i4
	fmovrde	%g6,	%f10,	%f12
	orncc	%l2,	0x16E1,	%o3
	smulcc	%i0,	0x0DCA,	%o4
	fmovsa	%xcc,	%f1,	%f9
	tcs	%xcc,	0x0
	edge32n	%l1,	%g7,	%l3
	ldd	[%l7 + 0x68],	%f12
	tge	%icc,	0x0
	movrlez	%g4,	0x269,	%i6
	std	%f6,	[%l7 + 0x68]
	sra	%i1,	%g3,	%l5
	fmovda	%xcc,	%f13,	%f4
	edge32ln	%l6,	%i2,	%i5
	movn	%icc,	%o7,	%g2
	fnot1	%f10,	%f12
	tleu	%icc,	0x4
	andn	%l4,	%i7,	%o0
	stb	%i3,	[%l7 + 0x26]
	edge8	%o2,	%o1,	%o6
	movgu	%xcc,	%g1,	%o5
	fbne,a	%fcc2,	loop_1341
loop_1341:
	fcmpne16	%f2,	%f4,	%g5
	fandnot1s	%f3,	%f3,	%f0
	ble	%icc,	loop_1342
loop_1342:
	mulscc	%i4,	0x0D1E,	%l0
	fbne,a	%fcc2,	loop_1343
loop_1343:
	movleu	%xcc,	%g6,	%l2
	stw	%i0,	[%l7 + 0x4C]
	array32	%o3,	%o4,	%g7
	sdivcc	%l3,	0x1014,	%g4
	tgu	%xcc,	0x4
	fmovsvs	%xcc,	%f5,	%f14
	orncc	%i6,	%i1,	%l1
	orncc	%l5,	%l6,	%i2
	nop
	setx loop_1344, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1344:
	fpack16	%f6,	%f1
	ldd	[%l7 + 0x50],	%f6
	fmovsgu	%xcc,	%f1,	%f1
	alignaddr	%i5,	%o7,	%g2
	fpsub16	%f10,	%f6,	%f14
	sra	%g3,	0x01,	%i7
	edge8	%o0,	%i3,	%o2
	bcc,a	%xcc,	loop_1345
loop_1345:
	edge16l	%l4,	%o6,	%g1
	tne	%xcc,	0x3
	fmovd	%f10,	%f2
	edge8n	%o5,	%g5,	%o1
	srax	%i4,	%g6,	%l0
	sra	%l2,	0x08,	%o3
	movneg	%xcc,	%i0,	%g7
	fnot1s	%f9,	%f0
	movle	%xcc,	%l3,	%o4
	fornot1	%f8,	%f8,	%f12
	add	%i6,	0x030E,	%i1
	nop
	setx loop_1346, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1346:
	or	%l1,	%g4,	%l6
	ldd	[%l7 + 0x70],	%f2
	add	%l5,	0x0328,	%i5
	addccc	%i2,	0x0058,	%o7
	fmovscs	%icc,	%f2,	%f14
	fmovspos	%icc,	%f15,	%f11
	brz	%g3,	loop_1347
loop_1347:
	popc	0x04E7,	%g2
	ldsh	[%l7 + 0x26],	%o0
	fcmpgt16	%f6,	%f10,	%i3
	ldd	[%l7 + 0x50],	%f0
	edge16n	%i7,	%o2,	%o6
	andn	%l4,	0x0039,	%g1
	stw	%o5,	[%l7 + 0x30]
	fcmpgt32	%f8,	%f8,	%g5
	edge32l	%i4,	%g6,	%l0
	ldsw	[%l7 + 0x38],	%l2
	fmovde	%xcc,	%f12,	%f15
	ldsh	[%l7 + 0x60],	%o1
	st	%f3,	[%l7 + 0x10]
	fxor	%f12,	%f12,	%f8
	sll	%o3,	0x03,	%i0
	movrne	%g7,	0x237,	%l3
	fmul8x16au	%f0,	%f2,	%f4
	ldx	[%l7 + 0x68],	%o4
	array16	%i1,	%i6,	%g4
	fmovdcs	%icc,	%f0,	%f7
	st	%f7,	[%l7 + 0x3C]
	xor	%l6,	0x1774,	%l5
	orncc	%l1,	%i2,	%i5
	fmovsgu	%icc,	%f9,	%f10
	sllx	%o7,	%g2,	%o0
	tvc	%icc,	0x7
	orncc	%i3,	0x1F6C,	%i7
	movrlz	%o2,	%g3,	%o6
	tne	%xcc,	0x3
	movleu	%icc,	%l4,	%o5
	fmovsvs	%xcc,	%f5,	%f14
	sub	%g5,	%i4,	%g6
	fnand	%f8,	%f4,	%f14
	movrgz	%g1,	%l0,	%o1
	xnor	%l2,	0x0CDE,	%o3
	orcc	%g7,	0x133D,	%i0
	tle	%xcc,	0x0
	tle	%icc,	0x6
	fmovrslz	%o4,	%f11,	%f7
	fbu	%fcc0,	loop_1348
loop_1348:
	fnot1s	%f15,	%f15
	tgu	%xcc,	0x6
	mova	%icc,	%i1,	%l3
	ldd	[%l7 + 0x20],	%f2
	fbl	%fcc1,	loop_1349
loop_1349:
	edge8	%i6,	%g4,	%l5
	edge32ln	%l1,	%i2,	%i5
	fnot2s	%f1,	%f5
	fexpand	%f11,	%f14
	xnorcc	%o7,	0x01D0,	%g2
	tsubcc	%o0,	0x0404,	%i3
	fpsub16s	%f1,	%f14,	%f15
	tne	%icc,	0x6
	bl,pt	%xcc,	loop_1350
loop_1350:
	srlx	%i7,	0x11,	%o2
	fmul8x16al	%f2,	%f2,	%f6
	subc	%g3,	0x0473,	%o6
	fmuld8ulx16	%f2,	%f0,	%f2
	ta	%xcc,	0x4
	stx	%l6,	[%l7 + 0x70]
	movge	%xcc,	%o5,	%g5
	stb	%i4,	[%l7 + 0x69]
	ldub	[%l7 + 0x0C],	%l4
	movleu	%xcc,	%g1,	%g6
	fandnot2	%f12,	%f8,	%f14
	movre	%l0,	%l2,	%o1
	fmovrdgez	%g7,	%f2,	%f0
	lduw	[%l7 + 0x28],	%i0
	edge32l	%o3,	%o4,	%i1
	tn	%icc,	0x1
	fpsub16s	%f11,	%f7,	%f10
	fnegs	%f11,	%f5
	fcmps	%fcc2,	%f6,	%f2
	tn	%xcc,	0x3
	movre	%i6,	%g4,	%l5
	tvs	%xcc,	0x1
	udivcc	%l3,	0x0176,	%i2
	fcmped	%fcc1,	%f6,	%f12
	fnors	%f4,	%f13,	%f11
	sdivcc	%l1,	0x18FF,	%i5
	fbge,a	%fcc2,	loop_1351
loop_1351:
	move	%icc,	%o7,	%o0
	movneg	%xcc,	%i3,	%i7
	bvc,pn	%xcc,	loop_1352
loop_1352:
	std	%f10,	[%l7 + 0x78]
	brlz	%g2,	loop_1353
loop_1353:
	andcc	%g3,	%o6,	%o2
	lduw	[%l7 + 0x48],	%o5
	ldd	[%l7 + 0x40],	%f6
	fpadd32s	%f8,	%f6,	%f14
	fba	%fcc1,	loop_1354
loop_1354:
	bcc	%xcc,	loop_1355
loop_1355:
	fandnot1s	%f7,	%f10,	%f4
	bgu	%xcc,	loop_1356
loop_1356:
	udiv	%g5,	0x0D5D,	%i4
	subc	%l4,	%l6,	%g1
	mulscc	%l0,	%l2,	%o1
	umulcc	%g6,	0x0F9B,	%i0
	stb	%g7,	[%l7 + 0x5C]
	fxnor	%f12,	%f2,	%f10
	edge32n	%o4,	%i1,	%o3
	tcc	%xcc,	0x2
	fandnot2	%f6,	%f0,	%f2
	fcmpeq16	%f6,	%f14,	%i6
	tvs	%xcc,	0x4
	movcc	%icc,	%g4,	%l3
	movvs	%icc,	%i2,	%l1
	movne	%xcc,	%l5,	%i5
	fmul8x16	%f14,	%f12,	%f4
	edge32n	%o7,	%i3,	%i7
	tgu	%icc,	0x3
	move	%icc,	%g2,	%g3
	bcc,a,pt	%xcc,	loop_1357
loop_1357:
	mulx	%o0,	0x10F0,	%o6
	st	%f6,	[%l7 + 0x14]
	bn	%icc,	loop_1358
loop_1358:
	stw	%o5,	[%l7 + 0x24]
	sub	%o2,	%g5,	%i4
	subccc	%l4,	%l6,	%g1
	movneg	%xcc,	%l0,	%l2
	tvs	%xcc,	0x2
	fbne	%fcc3,	loop_1359
loop_1359:
	sra	%o1,	%g6,	%g7
	edge8	%o4,	%i1,	%o3
	st	%f1,	[%l7 + 0x38]
	movleu	%icc,	%i0,	%i6
	xnor	%l3,	%g4,	%l1
	movne	%icc,	%i2,	%l5
	array16	%i5,	%i3,	%i7
	or	%g2,	%g3,	%o0
	movpos	%xcc,	%o7,	%o5
	edge16	%o2,	%g5,	%i4
	ble,pn	%icc,	loop_1360
loop_1360:
	fpackfix	%f8,	%f9
	stb	%l4,	[%l7 + 0x4C]
	fmovdn	%xcc,	%f3,	%f5
	array16	%o6,	%g1,	%l6
	fmovdle	%xcc,	%f1,	%f9
	movre	%l2,	%o1,	%l0
	fors	%f14,	%f6,	%f3
	mulscc	%g7,	%o4,	%i1
	orn	%g6,	0x0141,	%i0
	std	%f14,	[%l7 + 0x08]
	fba,a	%fcc3,	loop_1361
loop_1361:
	smul	%o3,	0x145C,	%l3
	fands	%f1,	%f15,	%f11
	fbge,a	%fcc2,	loop_1362
loop_1362:
	sub	%i6,	0x0CAB,	%l1
	fba,a	%fcc1,	loop_1363
loop_1363:
	subc	%i2,	%g4,	%l5
	fand	%f8,	%f0,	%f14
	fpsub16	%f8,	%f10,	%f10
	fmovdpos	%icc,	%f1,	%f10
	movgu	%icc,	%i3,	%i7
	fors	%f4,	%f9,	%f4
	fmovdl	%icc,	%f2,	%f11
	sllx	%i5,	%g3,	%g2
	subc	%o0,	%o7,	%o5
	movgu	%xcc,	%o2,	%g5
	tne	%xcc,	0x1
	mulx	%i4,	%o6,	%l4
	xnor	%g1,	0x141C,	%l6
	movle	%xcc,	%o1,	%l2
	sll	%g7,	%o4,	%l0
	tl	%icc,	0x1
	fors	%f15,	%f4,	%f7
	fmovdcc	%icc,	%f5,	%f14
	fmovdpos	%icc,	%f7,	%f3
	andn	%i1,	0x0136,	%i0
	fmovsa	%xcc,	%f6,	%f13
	fands	%f0,	%f9,	%f6
	popc	%o3,	%g6
	subccc	%i6,	0x1D4C,	%l3
	stw	%l1,	[%l7 + 0x68]
	ldsh	[%l7 + 0x76],	%g4
	fmovrdgz	%l5,	%f10,	%f10
	fbn,a	%fcc1,	loop_1364
loop_1364:
	fmovsg	%icc,	%f12,	%f8
	tsubcctv	%i2,	0x138A,	%i3
	orcc	%i7,	%i5,	%g2
	fcmpne32	%f2,	%f10,	%g3
	movne	%xcc,	%o7,	%o0
	ldsb	[%l7 + 0x4E],	%o5
	movre	%o2,	0x065,	%i4
	fcmple32	%f10,	%f4,	%g5
	addc	%o6,	0x0100,	%g1
	mulscc	%l6,	0x1E2C,	%l4
	tpos	%icc,	0x7
	edge8l	%l2,	%g7,	%o1
	tvc	%icc,	0x0
	fbul,a	%fcc0,	loop_1365
loop_1365:
	movne	%xcc,	%o4,	%l0
	fmuld8sux16	%f15,	%f10,	%f14
	fbu	%fcc3,	loop_1366
loop_1366:
	srl	%i0,	%i1,	%g6
	fcmpne16	%f2,	%f0,	%o3
	fcmps	%fcc3,	%f15,	%f3
	ld	[%l7 + 0x5C],	%f0
	edge8n	%l3,	%l1,	%g4
	fcmpd	%fcc2,	%f0,	%f12
	sth	%i6,	[%l7 + 0x32]
	andn	%i2,	0x0CED,	%l5
	fcmpgt16	%f14,	%f12,	%i7
	sll	%i5,	%g2,	%g3
	fornot2s	%f14,	%f11,	%f7
	array32	%i3,	%o0,	%o7
	movneg	%xcc,	%o2,	%o5
	movgu	%xcc,	%i4,	%o6
	edge8n	%g5,	%g1,	%l4
	edge16n	%l2,	%l6,	%o1
	fexpand	%f15,	%f0
	ldsh	[%l7 + 0x48],	%g7
	edge16n	%o4,	%i0,	%l0
	srlx	%i1,	%g6,	%o3
	te	%icc,	0x2
	sdivcc	%l1,	0x168E,	%l3
	movrgz	%g4,	0x3DB,	%i6
	bneg	loop_1367
loop_1367:
	ldub	[%l7 + 0x16],	%l5
	fmovdcc	%xcc,	%f0,	%f5
	andncc	%i2,	%i5,	%g2
	fbl,a	%fcc1,	loop_1368
loop_1368:
	fmovscs	%xcc,	%f14,	%f6
	array8	%g3,	%i3,	%o0
	fpack16	%f10,	%f3
	fmovdvs	%icc,	%f10,	%f3
	udivcc	%i7,	0x0F2B,	%o7
	fbl	%fcc3,	loop_1369
loop_1369:
	xnorcc	%o2,	%o5,	%i4
	orn	%g5,	0x166F,	%o6
	sra	%l4,	%l2,	%l6
	tneg	%icc,	0x0
	fmovde	%xcc,	%f11,	%f12
	edge8n	%g1,	%g7,	%o1
	srlx	%i0,	%l0,	%i1
	edge8	%o4,	%g6,	%o3
	tsubcc	%l1,	0x1E59,	%l3
	subccc	%i6,	0x18CE,	%g4
	sth	%l5,	[%l7 + 0x5A]
	add	%i5,	%i2,	%g3
	and	%i3,	%g2,	%i7
	brgz,a	%o7,	loop_1370
loop_1370:
	brgz,a	%o0,	loop_1371
loop_1371:
	ta	%icc,	0x4
	andncc	%o2,	%i4,	%g5
	xnorcc	%o5,	0x149F,	%o6
	brgez	%l2,	loop_1372
loop_1372:
	tcs	%icc,	0x5
	edge8	%l6,	%l4,	%g1
	brlz	%o1,	loop_1373
loop_1373:
	edge16n	%g7,	%i0,	%l0
	fmovrdlez	%o4,	%f10,	%f12
	stb	%g6,	[%l7 + 0x37]
	fornot2s	%f10,	%f4,	%f3
	umul	%i1,	0x0C65,	%l1
	fabsd	%f0,	%f8
	movcs	%xcc,	%o3,	%l3
	ldsw	[%l7 + 0x20],	%i6
	movne	%icc,	%g4,	%i5
	fcmpeq16	%f8,	%f0,	%l5
	sra	%i2,	0x05,	%g3
	fornot2s	%f10,	%f15,	%f1
	ta	%xcc,	0x5
	fcmpne16	%f12,	%f0,	%i3
	fbg	%fcc1,	loop_1374
loop_1374:
	ta	%xcc,	0x0
	fmovdgu	%icc,	%f9,	%f11
	addccc	%i7,	0x0C09,	%g2
	edge8n	%o0,	%o2,	%i4
	fbe	%fcc3,	loop_1375
loop_1375:
	sllx	%o7,	%g5,	%o5
	fandnot1s	%f11,	%f2,	%f2
	move	%icc,	%o6,	%l2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type f   	: 202
!	Type cti   	: 113
!	Type i   	: 562
!	Type l   	: 123
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
main_t6:

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x2,	%g2
	set	0xD,	%g3
	set	0x7,	%g4
	set	0x5,	%g5
	set	0xD,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x2,	%i1
	set	-0x4,	%i2
	set	-0xE,	%i3
	set	-0x9,	%i4
	set	-0x5,	%i5
	set	-0x7,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x04493196,	%l0
	set	0x7F1BE356,	%l1
	set	0x3CC215F2,	%l2
	set	0x15660669,	%l3
	set	0x6891837A,	%l4
	set	0x786F792A,	%l5
	set	0x5BFFC0E4,	%l6
	!# Output registers
	set	0x1801,	%o0
	set	0x03E8,	%o1
	set	-0x12BF,	%o2
	set	0x0A38,	%o3
	set	-0x0936,	%o4
	set	-0x0AAF,	%o5
	set	-0x033E,	%o6
	set	-0x0ED3,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	ble	loop_1376
loop_1376:
	lduh	[%l7 + 0x60],	%l6
	movneg	%xcc,	%g1,	%l4
	fpsub32	%f0,	%f2,	%f10
	ldsw	[%l7 + 0x68],	%g7
	sth	%o1,	[%l7 + 0x22]
	ldsw	[%l7 + 0x38],	%i0
	movg	%xcc,	%l0,	%o4
	movre	%i1,	0x214,	%l1
	ldub	[%l7 + 0x21],	%g6
	ldsh	[%l7 + 0x5C],	%l3
	ldsw	[%l7 + 0x7C],	%i6
	fcmple32	%f10,	%f10,	%o3
	ldx	[%l7 + 0x68],	%i5
	ldsh	[%l7 + 0x36],	%g4
	umulcc	%i2,	0x0152,	%l5
	ldd	[%l7 + 0x38],	%f4
	ldsh	[%l7 + 0x72],	%i3
	xorcc	%i7,	%g2,	%o0
	subc	%g3,	%o2,	%i4
	st	%f1,	[%l7 + 0x28]
	stw	%o7,	[%l7 + 0x14]
	std	%f4,	[%l7 + 0x78]
	tvs	%icc,	0x1
	edge16l	%o5,	%o6,	%l2
	fnegd	%f8,	%f10
	stx	%g5,	[%l7 + 0x30]
	stb	%g1,	[%l7 + 0x64]
	movleu	%icc,	%l4,	%g7
	ldsw	[%l7 + 0x58],	%o1
	stw	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x28],	%i0
	edge32	%o4,	%i1,	%l1
	tge	%icc,	0x2
	ldsb	[%l7 + 0x1D],	%l0
	ldsw	[%l7 + 0x08],	%l3
	tle	%icc,	0x3
	tsubcctv	%i6,	%g6,	%i5
	fba	%fcc0,	loop_1377
loop_1377:
	tcs	%icc,	0x3
	ld	[%l7 + 0x34],	%f1
	stb	%o3,	[%l7 + 0x6A]
	for	%f10,	%f10,	%f4
	ldsh	[%l7 + 0x7A],	%g4
	lduh	[%l7 + 0x1C],	%i2
	ldub	[%l7 + 0x72],	%i3
	std	%f14,	[%l7 + 0x18]
	sth	%l5,	[%l7 + 0x68]
	ldsw	[%l7 + 0x74],	%i7
	tneg	%icc,	0x6
	fbg	%fcc2,	loop_1378
loop_1378:
	ldd	[%l7 + 0x68],	%f6
	tvc	%xcc,	0x3
	ta	%xcc,	0x7
	ld	[%l7 + 0x60],	%f10
	ldd	[%l7 + 0x78],	%f14
	tvs	%xcc,	0x2
	edge32	%o0,	%g2,	%g3
	movne	%icc,	%i4,	%o7
	taddcc	%o2,	%o6,	%o5
	stb	%g5,	[%l7 + 0x75]
	std	%f8,	[%l7 + 0x20]
	std	%f14,	[%l7 + 0x40]
	st	%f12,	[%l7 + 0x74]
	sth	%l2,	[%l7 + 0x2A]
	stx	%g1,	[%l7 + 0x18]
	fmovrdlez	%g7,	%f4,	%f6
	sdivx	%l4,	0x1F10,	%l6
	xnor	%o1,	%i0,	%o4
	ldsb	[%l7 + 0x72],	%i1
	st	%f1,	[%l7 + 0x50]
	fsrc1	%f4,	%f4
	fnot1	%f4,	%f10
	std	%f14,	[%l7 + 0x40]
	ldd	[%l7 + 0x40],	%f14
	brz,a	%l0,	loop_1379
loop_1379:
	lduh	[%l7 + 0x10],	%l1
	ldsw	[%l7 + 0x6C],	%l3
	ldd	[%l7 + 0x60],	%f8
	stx	%i6,	[%l7 + 0x28]
	lduh	[%l7 + 0x2A],	%i5
	ldsw	[%l7 + 0x60],	%g6
	sub	%g4,	0x103E,	%i2
	st	%f7,	[%l7 + 0x50]
	alignaddrl	%i3,	%o3,	%i7
	stb	%l5,	[%l7 + 0x1E]
	sllx	%g2,	%o0,	%g3
	udiv	%i4,	0x120F,	%o2
	lduh	[%l7 + 0x54],	%o7
	tneg	%icc,	0x5
	st	%f3,	[%l7 + 0x44]
	st	%f6,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x2E],	%o5
	ldsh	[%l7 + 0x0E],	%o6
	tne	%icc,	0x3
	tg	%xcc,	0x2
	movl	%xcc,	%l2,	%g5
	sllx	%g1,	0x15,	%g7
	te	%icc,	0x6
	fpadd16s	%f6,	%f13,	%f7
	tvc	%icc,	0x5
	mova	%icc,	%l6,	%l4
	sth	%o1,	[%l7 + 0x18]
	sth	%o4,	[%l7 + 0x44]
	tle	%xcc,	0x5
	fmovspos	%icc,	%f3,	%f1
	std	%f10,	[%l7 + 0x70]
	brz,a	%i1,	loop_1380
loop_1380:
	edge8ln	%i0,	%l1,	%l0
	edge16ln	%i6,	%l3,	%i5
	ldsb	[%l7 + 0x64],	%g4
	std	%f8,	[%l7 + 0x30]
	fbul	%fcc0,	loop_1381
loop_1381:
	ld	[%l7 + 0x1C],	%f0
	ldsb	[%l7 + 0x18],	%g6
	ldsw	[%l7 + 0x38],	%i3
	ldd	[%l7 + 0x48],	%f10
	lduw	[%l7 + 0x58],	%o3
	ldsw	[%l7 + 0x28],	%i2
	fmovde	%xcc,	%f4,	%f8
	fmovrdne	%i7,	%f14,	%f14
	lduw	[%l7 + 0x58],	%g2
	std	%f6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%o0
	smul	%g3,	%i4,	%o2
	taddcc	%l5,	%o7,	%o6
	ldsw	[%l7 + 0x2C],	%l2
	fbule	%fcc0,	loop_1382
loop_1382:
	fbo	%fcc1,	loop_1383
loop_1383:
	ldsb	[%l7 + 0x7D],	%o5
	bg	loop_1384
loop_1384:
	fornot1	%f4,	%f14,	%f0
	ldub	[%l7 + 0x1C],	%g5
	orn	%g7,	%l6,	%l4
	sth	%o1,	[%l7 + 0x44]
	st	%f6,	[%l7 + 0x28]
	fbug	%fcc1,	loop_1385
loop_1385:
	movl	%xcc,	%g1,	%o4
	bn	%icc,	loop_1386
loop_1386:
	ldx	[%l7 + 0x68],	%i0
	sth	%i1,	[%l7 + 0x2E]
	ldsh	[%l7 + 0x3A],	%l0
	bpos	%xcc,	loop_1387
loop_1387:
	edge16ln	%l1,	%l3,	%i5
	lduh	[%l7 + 0x6E],	%g4
	fmovrse	%g6,	%f7,	%f10
	movvs	%xcc,	%i3,	%o3
	ldsb	[%l7 + 0x30],	%i6
	tn	%icc,	0x7
	ldx	[%l7 + 0x10],	%i2
	st	%f6,	[%l7 + 0x28]
	fmovdne	%xcc,	%f1,	%f0
	fnot1s	%f8,	%f4
	ldsb	[%l7 + 0x7F],	%g2
	ldsh	[%l7 + 0x38],	%i7
	sth	%o0,	[%l7 + 0x38]
	addcc	%g3,	0x0102,	%i4
	stx	%o2,	[%l7 + 0x50]
	ldsb	[%l7 + 0x4E],	%l5
	bg,a,pt	%icc,	loop_1388
loop_1388:
	movleu	%xcc,	%o6,	%o7
	ldub	[%l7 + 0x6B],	%l2
	ld	[%l7 + 0x28],	%f4
	stw	%o5,	[%l7 + 0x24]
	ldsh	[%l7 + 0x7A],	%g7
	fxnors	%f4,	%f0,	%f10
	stb	%g5,	[%l7 + 0x15]
	lduw	[%l7 + 0x4C],	%l6
	std	%f14,	[%l7 + 0x78]
	st	%f1,	[%l7 + 0x10]
	ldsw	[%l7 + 0x74],	%o1
	or	%g1,	%l4,	%i0
	tgu	%icc,	0x4
	st	%f13,	[%l7 + 0x78]
	movcs	%xcc,	%i1,	%l0
	move	%xcc,	%o4,	%l1
	ldsb	[%l7 + 0x10],	%i5
	bpos,a,pn	%xcc,	loop_1389
loop_1389:
	add	%l3,	0x15CB,	%g6
	stw	%g4,	[%l7 + 0x7C]
	st	%f5,	[%l7 + 0x1C]
	popc	%i3,	%i6
	st	%f2,	[%l7 + 0x48]
	stx	%o3,	[%l7 + 0x50]
	lduw	[%l7 + 0x24],	%i2
	ldsb	[%l7 + 0x73],	%g2
	ld	[%l7 + 0x54],	%f2
	ldub	[%l7 + 0x7C],	%i7
	fcmpes	%fcc0,	%f13,	%f15
	movne	%xcc,	%g3,	%o0
	bneg	loop_1390
loop_1390:
	umul	%i4,	%l5,	%o2
	ldsb	[%l7 + 0x7D],	%o7
	stb	%l2,	[%l7 + 0x66]
	fexpand	%f3,	%f8
	sethi	0x0A20,	%o6
	st	%f11,	[%l7 + 0x68]
	subccc	%g7,	%o5,	%g5
	alignaddrl	%o1,	%l6,	%g1
	fmul8sux16	%f0,	%f14,	%f4
	srl	%l4,	%i0,	%l0
	ldsb	[%l7 + 0x36],	%o4
	umulcc	%l1,	0x1D9F,	%i5
	lduh	[%l7 + 0x1E],	%i1
	be,a,pt	%xcc,	loop_1391
loop_1391:
	brlz	%g6,	loop_1392
loop_1392:
	edge8ln	%l3,	%g4,	%i6
	ldd	[%l7 + 0x50],	%f0
	tsubcctv	%o3,	0x1136,	%i3
	brgez	%g2,	loop_1393
loop_1393:
	bn,a	%icc,	loop_1394
loop_1394:
	nop
	setx loop_1395, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1395:
	stb	%i7,	[%l7 + 0x52]
	sllx	%i2,	%g3,	%i4
	fmovrsgez	%l5,	%f11,	%f6
	stx	%o0,	[%l7 + 0x68]
	taddcc	%o7,	0x14B7,	%l2
	st	%f11,	[%l7 + 0x20]
	std	%f6,	[%l7 + 0x48]
	fcmpd	%fcc1,	%f10,	%f14
	movcc	%xcc,	%o6,	%g7
	stb	%o5,	[%l7 + 0x52]
	tvc	%xcc,	0x1
	movrlz	%o2,	%o1,	%g5
	tcs	%xcc,	0x0
	ldsw	[%l7 + 0x7C],	%l6
	andn	%l4,	%g1,	%i0
	and	%o4,	0x092D,	%l0
	fpsub16	%f6,	%f2,	%f8
	ldx	[%l7 + 0x58],	%i5
	ldd	[%l7 + 0x08],	%f0
	brlz,a	%l1,	loop_1396
loop_1396:
	tn	%xcc,	0x7
	xnor	%g6,	%l3,	%i1
	be	loop_1397
loop_1397:
	movrlez	%g4,	%o3,	%i3
	ldx	[%l7 + 0x60],	%i6
	tsubcctv	%i7,	%g2,	%i2
	stw	%i4,	[%l7 + 0x34]
	xor	%g3,	%o0,	%o7
	tl	%xcc,	0x3
	sth	%l2,	[%l7 + 0x2C]
	lduh	[%l7 + 0x46],	%o6
	lduw	[%l7 + 0x64],	%l5
	ldsh	[%l7 + 0x38],	%o5
	umul	%o2,	%o1,	%g5
	lduw	[%l7 + 0x74],	%g7
	edge8n	%l4,	%l6,	%i0
	std	%f14,	[%l7 + 0x60]
	srax	%g1,	0x0E,	%l0
	sth	%i5,	[%l7 + 0x64]
	std	%f14,	[%l7 + 0x70]
	lduw	[%l7 + 0x1C],	%l1
	addc	%g6,	0x0054,	%l3
	ldd	[%l7 + 0x70],	%f4
	taddcctv	%o4,	%g4,	%o3
	fmovrdlez	%i1,	%f0,	%f8
	ldx	[%l7 + 0x70],	%i6
	fba	%fcc0,	loop_1398
loop_1398:
	te	%icc,	0x3
	ldx	[%l7 + 0x28],	%i3
	movpos	%icc,	%i7,	%g2
	ldx	[%l7 + 0x40],	%i2
	ldd	[%l7 + 0x78],	%f8
	te	%xcc,	0x0
	ldsb	[%l7 + 0x61],	%i4
	std	%f6,	[%l7 + 0x68]
	xnor	%o0,	0x1AB0,	%o7
	stb	%l2,	[%l7 + 0x2F]
	fbug	%fcc3,	loop_1399
loop_1399:
	ldsw	[%l7 + 0x54],	%o6
	fexpand	%f11,	%f6
	stw	%l5,	[%l7 + 0x50]
	ld	[%l7 + 0x38],	%f12
	fpadd32	%f4,	%f0,	%f14
	ldub	[%l7 + 0x13],	%o5
	alignaddr	%o2,	%g3,	%o1
	edge8	%g7,	%l4,	%l6
	ldd	[%l7 + 0x40],	%f2
	sdivx	%i0,	0x0A40,	%g1
	fnegd	%f12,	%f2
	fpadd32s	%f8,	%f1,	%f1
	sth	%g5,	[%l7 + 0x54]
	ldd	[%l7 + 0x78],	%f6
	tle	%icc,	0x7
	and	%l0,	0x1FC9,	%i5
	ldd	[%l7 + 0x38],	%f12
	tg	%xcc,	0x3
	ldsh	[%l7 + 0x16],	%g6
	smul	%l3,	0x1B67,	%o4
	movvc	%xcc,	%l1,	%g4
	st	%f7,	[%l7 + 0x28]
	st	%f15,	[%l7 + 0x78]
	udiv	%i1,	0x078A,	%o3
	fbg,a	%fcc3,	loop_1400
loop_1400:
	ldx	[%l7 + 0x40],	%i6
	sth	%i3,	[%l7 + 0x76]
	std	%f6,	[%l7 + 0x30]
	fornot2	%f12,	%f4,	%f12
	umulcc	%i7,	%i2,	%g2
	edge8	%o0,	%i4,	%o7
	st	%f8,	[%l7 + 0x4C]
	stx	%l2,	[%l7 + 0x38]
	nop
	setx loop_1401, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1401:
	brgz,a	%l5,	loop_1402
loop_1402:
	lduw	[%l7 + 0x48],	%o6
	fmul8x16al	%f13,	%f12,	%f2
	lduw	[%l7 + 0x14],	%o5
	ld	[%l7 + 0x50],	%f6
	stw	%g3,	[%l7 + 0x10]
	sethi	0x1B97,	%o2
	for	%f6,	%f2,	%f4
	brlez,a	%o1,	loop_1403
loop_1403:
	movrgz	%l4,	0x362,	%l6
	mova	%xcc,	%i0,	%g7
	fbule	%fcc1,	loop_1404
loop_1404:
	ldsh	[%l7 + 0x4E],	%g5
	edge32	%l0,	%i5,	%g1
	fmovrslez	%g6,	%f13,	%f7
	movle	%xcc,	%o4,	%l1
	fcmple16	%f10,	%f2,	%g4
	tvs	%xcc,	0x2
	ldx	[%l7 + 0x28],	%i1
	udiv	%o3,	0x05DC,	%l3
	fbn,a	%fcc1,	loop_1405
loop_1405:
	ldsw	[%l7 + 0x60],	%i6
	stx	%i7,	[%l7 + 0x58]
	ldsw	[%l7 + 0x38],	%i3
	fxors	%f15,	%f8,	%f0
	fbu,a	%fcc2,	loop_1406
loop_1406:
	movrlz	%i2,	%o0,	%i4
	ldub	[%l7 + 0x72],	%o7
	st	%f10,	[%l7 + 0x64]
	brgez,a	%l2,	loop_1407
loop_1407:
	udivx	%l5,	0x0641,	%o6
	lduw	[%l7 + 0x18],	%o5
	tsubcc	%g3,	%g2,	%o1
	andcc	%l4,	%l6,	%o2
	ldsh	[%l7 + 0x2E],	%g7
	sth	%g5,	[%l7 + 0x10]
	lduw	[%l7 + 0x3C],	%l0
	ldub	[%l7 + 0x5D],	%i0
	stx	%i5,	[%l7 + 0x48]
	ld	[%l7 + 0x5C],	%f11
	lduw	[%l7 + 0x38],	%g6
	std	%f2,	[%l7 + 0x38]
	sth	%g1,	[%l7 + 0x2C]
	fmovrdgz	%l1,	%f12,	%f0
	edge16	%g4,	%o4,	%i1
	sth	%o3,	[%l7 + 0x12]
	movne	%xcc,	%i6,	%i7
	fmul8x16	%f12,	%f4,	%f8
	ldsb	[%l7 + 0x17],	%l3
	ldsh	[%l7 + 0x34],	%i2
	ldd	[%l7 + 0x20],	%f2
	ldub	[%l7 + 0x76],	%o0
	ldsw	[%l7 + 0x5C],	%i3
	mulscc	%o7,	0x0F62,	%l2
	lduh	[%l7 + 0x46],	%l5
	stx	%o6,	[%l7 + 0x20]
	tl	%xcc,	0x1
	std	%f4,	[%l7 + 0x18]
	stb	%i4,	[%l7 + 0x55]
	st	%f15,	[%l7 + 0x1C]
	std	%f6,	[%l7 + 0x48]
	array8	%o5,	%g3,	%g2
	lduw	[%l7 + 0x54],	%l4
	fbg,a	%fcc2,	loop_1408
loop_1408:
	ldub	[%l7 + 0x21],	%l6
	sth	%o1,	[%l7 + 0x1C]
	lduh	[%l7 + 0x64],	%o2
	movne	%xcc,	%g7,	%l0
	ldsw	[%l7 + 0x4C],	%g5
	edge16	%i0,	%i5,	%g1
	ldd	[%l7 + 0x08],	%f2
	array16	%g6,	%l1,	%g4
	tcs	%xcc,	0x3
	fblg,a	%fcc1,	loop_1409
loop_1409:
	fpsub16s	%f0,	%f3,	%f11
	mova	%xcc,	%o4,	%o3
	st	%f0,	[%l7 + 0x70]
	ldd	[%l7 + 0x28],	%f2
	stw	%i1,	[%l7 + 0x68]
	tpos	%icc,	0x4
	lduw	[%l7 + 0x4C],	%i7
	ldd	[%l7 + 0x20],	%f10
	edge16ln	%i6,	%i2,	%l3
	ldsb	[%l7 + 0x66],	%i3
	stb	%o0,	[%l7 + 0x37]
	lduw	[%l7 + 0x38],	%l2
	stb	%l5,	[%l7 + 0x2D]
	stw	%o7,	[%l7 + 0x50]
	tgu	%xcc,	0x2
	sllx	%o6,	%i4,	%o5
	ba,a,pn	%icc,	loop_1410
loop_1410:
	stw	%g3,	[%l7 + 0x78]
	edge16l	%l4,	%g2,	%l6
	fcmple16	%f12,	%f2,	%o2
	ldd	[%l7 + 0x10],	%f14
	tsubcctv	%g7,	0x10AC,	%o1
	tcs	%xcc,	0x5
	st	%f13,	[%l7 + 0x24]
	xorcc	%l0,	%i0,	%g5
	ldd	[%l7 + 0x30],	%f0
	ta	%xcc,	0x2
	std	%f4,	[%l7 + 0x68]
	bcc	loop_1411
loop_1411:
	smul	%i5,	%g1,	%g6
	fpackfix	%f6,	%f3
	tsubcctv	%g4,	%o4,	%o3
	ldub	[%l7 + 0x0F],	%l1
	ldd	[%l7 + 0x48],	%f0
	ldsw	[%l7 + 0x5C],	%i7
	brgez	%i1,	loop_1412
loop_1412:
	stx	%i6,	[%l7 + 0x18]
	movge	%icc,	%l3,	%i2
	ldsb	[%l7 + 0x4A],	%i3
	fpadd16	%f14,	%f14,	%f4
	ldsw	[%l7 + 0x28],	%l2
	movge	%xcc,	%o0,	%l5
	sub	%o7,	%i4,	%o5
	sth	%g3,	[%l7 + 0x3A]
	nop
	setx loop_1413, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1413:
	tg	%xcc,	0x1
	orncc	%o6,	0x1698,	%l4
	st	%f1,	[%l7 + 0x6C]
	sth	%l6,	[%l7 + 0x1C]
	te	%xcc,	0x1
	stx	%g2,	[%l7 + 0x60]
	smulcc	%g7,	%o2,	%o1
	lduw	[%l7 + 0x44],	%i0
	lduw	[%l7 + 0x30],	%l0
	ldsb	[%l7 + 0x62],	%i5
	edge8	%g5,	%g1,	%g4
	stx	%o4,	[%l7 + 0x30]
	bpos,a,pn	%icc,	loop_1414
loop_1414:
	stb	%g6,	[%l7 + 0x46]
	edge32l	%l1,	%o3,	%i7
	lduw	[%l7 + 0x60],	%i6
	movle	%icc,	%i1,	%l3
	fbe,a	%fcc3,	loop_1415
loop_1415:
	movrgz	%i2,	0x35E,	%i3
	edge32	%l2,	%l5,	%o7
	edge16ln	%o0,	%i4,	%g3
	movleu	%xcc,	%o5,	%l4
	ldx	[%l7 + 0x20],	%l6
	movne	%xcc,	%g2,	%o6
	bn,a,pn	%icc,	loop_1416
loop_1416:
	ldd	[%l7 + 0x58],	%f10
	ldd	[%l7 + 0x08],	%f2
	ldsw	[%l7 + 0x3C],	%o2
	st	%f10,	[%l7 + 0x48]
	nop
	setx loop_1417, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1417:
	stw	%o1,	[%l7 + 0x10]
	ldub	[%l7 + 0x7D],	%g7
	ldub	[%l7 + 0x1D],	%i0
	lduh	[%l7 + 0x1C],	%i5
	stw	%l0,	[%l7 + 0x4C]
	ldub	[%l7 + 0x79],	%g1
	and	%g4,	%g5,	%o4
	ldx	[%l7 + 0x58],	%g6
	st	%f9,	[%l7 + 0x10]
	edge32n	%o3,	%i7,	%i6
	stx	%i1,	[%l7 + 0x70]
	stb	%l3,	[%l7 + 0x55]
	lduw	[%l7 + 0x70],	%i2
	movrgez	%i3,	0x167,	%l1
	orncc	%l2,	0x1BF0,	%l5
	lduh	[%l7 + 0x4A],	%o0
	movcs	%xcc,	%o7,	%g3
	ld	[%l7 + 0x10],	%f11
	fbue,a	%fcc2,	loop_1418
loop_1418:
	lduh	[%l7 + 0x54],	%i4
	sth	%o5,	[%l7 + 0x0A]
	bcc,a	loop_1419
loop_1419:
	movcc	%xcc,	%l4,	%g2
	array8	%o6,	%o2,	%l6
	ldsb	[%l7 + 0x5A],	%o1
	fbu,a	%fcc1,	loop_1420
loop_1420:
	st	%f4,	[%l7 + 0x50]
	xor	%i0,	0x1A58,	%i5
	add	%l0,	0x1F3D,	%g1
	sll	%g7,	0x14,	%g4
	fmovrslez	%o4,	%f2,	%f0
	fmovrsgez	%g5,	%f0,	%f12
	stx	%g6,	[%l7 + 0x48]
	ld	[%l7 + 0x0C],	%f0
	lduh	[%l7 + 0x70],	%o3
	and	%i7,	%i6,	%i1
	edge16	%i2,	%i3,	%l3
	ld	[%l7 + 0x08],	%f2
	st	%f5,	[%l7 + 0x7C]
	fnot1s	%f5,	%f8
	edge16n	%l2,	%l5,	%l1
	movre	%o0,	0x20A,	%g3
	stw	%o7,	[%l7 + 0x34]
	fbo,a	%fcc2,	loop_1421
loop_1421:
	ldd	[%l7 + 0x20],	%f0
	addcc	%o5,	%l4,	%g2
	fbule,a	%fcc1,	loop_1422
loop_1422:
	stb	%o6,	[%l7 + 0x2B]
	movl	%xcc,	%i4,	%o2
	std	%f8,	[%l7 + 0x10]
	fexpand	%f9,	%f8
	ldd	[%l7 + 0x68],	%f12
	fnot1s	%f12,	%f8
	tpos	%xcc,	0x6
	lduw	[%l7 + 0x3C],	%l6
	lduw	[%l7 + 0x34],	%i0
	ldsh	[%l7 + 0x44],	%i5
	ldx	[%l7 + 0x30],	%l0
	ldsw	[%l7 + 0x50],	%o1
	ld	[%l7 + 0x44],	%f8
	tvc	%xcc,	0x3
	ldsh	[%l7 + 0x7E],	%g1
	ld	[%l7 + 0x44],	%f14
	std	%f2,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%g7
	sth	%o4,	[%l7 + 0x7C]
	srax	%g4,	%g5,	%g6
	lduw	[%l7 + 0x2C],	%o3
	lduw	[%l7 + 0x20],	%i6
	std	%f14,	[%l7 + 0x58]
	fmovsn	%icc,	%f11,	%f1
	srl	%i7,	%i1,	%i2
	movneg	%icc,	%i3,	%l3
	lduh	[%l7 + 0x42],	%l5
	bl	loop_1423
loop_1423:
	stb	%l2,	[%l7 + 0x74]
	tleu	%xcc,	0x0
	fors	%f0,	%f4,	%f0
	umul	%o0,	0x0C00,	%l1
	ldsb	[%l7 + 0x1C],	%o7
	ldsh	[%l7 + 0x1A],	%g3
	mulscc	%o5,	%l4,	%g2
	xnor	%o6,	%o2,	%l6
	sth	%i4,	[%l7 + 0x20]
	pdist	%f12,	%f0,	%f6
	ldx	[%l7 + 0x68],	%i5
	stb	%i0,	[%l7 + 0x4B]
	fbe,a	%fcc1,	loop_1424
loop_1424:
	add	%l0,	0x1504,	%o1
	tcc	%xcc,	0x4
	addcc	%g7,	0x157A,	%o4
	move	%icc,	%g1,	%g4
	nop
	setx loop_1425, %l0, %l1
	jmpl %l1, %g6
loop_1425:
	stx	%o3,	[%l7 + 0x10]
	ld	[%l7 + 0x64],	%f0
	stw	%i6,	[%l7 + 0x20]
	ldub	[%l7 + 0x3E],	%i7
	taddcc	%g5,	0x0BB5,	%i2
	std	%f6,	[%l7 + 0x30]
	movle	%icc,	%i3,	%l3
	sth	%i1,	[%l7 + 0x76]
	fbuge	%fcc1,	loop_1426
loop_1426:
	std	%f14,	[%l7 + 0x28]
	fbug	%fcc1,	loop_1427
loop_1427:
	stx	%l2,	[%l7 + 0x10]
	fors	%f5,	%f7,	%f3
	ldx	[%l7 + 0x28],	%l5
	tne	%xcc,	0x5
	ldsh	[%l7 + 0x4A],	%l1
	tg	%xcc,	0x5
	srax	%o0,	%o7,	%g3
	ld	[%l7 + 0x60],	%f12
	edge16ln	%o5,	%l4,	%g2
	ldx	[%l7 + 0x30],	%o2
	ldx	[%l7 + 0x10],	%l6
	ldub	[%l7 + 0x50],	%i4
	addcc	%i5,	%o6,	%i0
	ldsb	[%l7 + 0x72],	%o1
	stx	%g7,	[%l7 + 0x58]
	stw	%o4,	[%l7 + 0x10]
	udivx	%l0,	0x0FAE,	%g1
	subcc	%g6,	0x0C62,	%o3
	ld	[%l7 + 0x28],	%f11
	nop
	setx loop_1428, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1428:
	sdiv	%g4,	0x1095,	%i7
	fexpand	%f14,	%f8
	stb	%g5,	[%l7 + 0x56]
	tgu	%xcc,	0x0
	ldsh	[%l7 + 0x28],	%i6
	subccc	%i3,	%l3,	%i2
	fbul,a	%fcc0,	loop_1429
loop_1429:
	st	%f6,	[%l7 + 0x18]
	fbg,a	%fcc3,	loop_1430
loop_1430:
	brnz	%i1,	loop_1431
loop_1431:
	lduh	[%l7 + 0x68],	%l2
	bn,a	loop_1432
loop_1432:
	fmovrsgez	%l1,	%f9,	%f4
	bne,a,pn	%xcc,	loop_1433
loop_1433:
	st	%f14,	[%l7 + 0x20]
	tl	%xcc,	0x6
	ldsw	[%l7 + 0x64],	%l5
	ldsw	[%l7 + 0x0C],	%o0
	edge32l	%o7,	%g3,	%l4
	bshuffle	%f8,	%f12,	%f10
	tsubcc	%o5,	0x1216,	%o2
	fcmpne32	%f4,	%f12,	%g2
	stx	%l6,	[%l7 + 0x10]
	ldsw	[%l7 + 0x64],	%i5
	fmovd	%f8,	%f8
	ldx	[%l7 + 0x78],	%i4
	tcs	%xcc,	0x0
	sth	%i0,	[%l7 + 0x60]
	st	%f0,	[%l7 + 0x58]
	addc	%o6,	%g7,	%o1
	stx	%l0,	[%l7 + 0x08]
	ldsb	[%l7 + 0x22],	%o4
	xor	%g1,	%o3,	%g4
	lduw	[%l7 + 0x10],	%i7
	ldsh	[%l7 + 0x26],	%g6
	edge32l	%i6,	%i3,	%l3
	edge32ln	%i2,	%i1,	%l2
	std	%f8,	[%l7 + 0x30]
	stx	%l1,	[%l7 + 0x38]
	movleu	%icc,	%g5,	%o0
	ldsb	[%l7 + 0x41],	%o7
	fmovsa	%icc,	%f14,	%f9
	ldx	[%l7 + 0x48],	%l5
	fpackfix	%f0,	%f8
	stw	%g3,	[%l7 + 0x50]
	subcc	%o5,	%o2,	%g2
	sth	%l4,	[%l7 + 0x40]
	taddcc	%l6,	0x1B16,	%i4
	brlz,a	%i5,	loop_1434
loop_1434:
	fexpand	%f6,	%f12
	ld	[%l7 + 0x4C],	%f13
	srax	%o6,	%g7,	%i0
	st	%f12,	[%l7 + 0x0C]
	stb	%l0,	[%l7 + 0x08]
	subcc	%o1,	%o4,	%g1
	andncc	%g4,	%i7,	%o3
	ld	[%l7 + 0x40],	%f9
	sra	%g6,	%i6,	%i3
	stw	%l3,	[%l7 + 0x14]
	tn	%xcc,	0x6
	xnorcc	%i2,	%l2,	%i1
	te	%xcc,	0x4
	ldd	[%l7 + 0x30],	%f10
	fbule	%fcc3,	loop_1435
loop_1435:
	tleu	%icc,	0x7
	movl	%icc,	%g5,	%o0
	fmovda	%xcc,	%f7,	%f2
	std	%f6,	[%l7 + 0x10]
	movvs	%icc,	%o7,	%l5
	ldsh	[%l7 + 0x40],	%l1
	ldsw	[%l7 + 0x40],	%o5
	stx	%o2,	[%l7 + 0x60]
	ldub	[%l7 + 0x4A],	%g2
	sdivcc	%g3,	0x02CE,	%l4
	fcmps	%fcc3,	%f9,	%f1
	ldsb	[%l7 + 0x68],	%l6
	sth	%i5,	[%l7 + 0x0E]
	stw	%i4,	[%l7 + 0x58]
	lduw	[%l7 + 0x2C],	%g7
	ldx	[%l7 + 0x40],	%i0
	fmovdvs	%xcc,	%f8,	%f5
	ldx	[%l7 + 0x50],	%o6
	tl	%xcc,	0x6
	stb	%o1,	[%l7 + 0x6A]
	srl	%o4,	%g1,	%g4
	lduh	[%l7 + 0x36],	%i7
	tsubcctv	%o3,	%l0,	%i6
	std	%f4,	[%l7 + 0x08]
	popc	%i3,	%g6
	lduh	[%l7 + 0x60],	%i2
	stw	%l3,	[%l7 + 0x68]
	ldsh	[%l7 + 0x28],	%l2
	ldsh	[%l7 + 0x74],	%i1
	xnor	%o0,	%o7,	%l5
	nop
	setx loop_1436, %l0, %l1
	jmpl %l1, %g5
loop_1436:
	movrlz	%o5,	%o2,	%l1
	edge8l	%g3,	%l4,	%g2
	ldd	[%l7 + 0x10],	%f10
	udivcc	%l6,	0x0500,	%i5
	edge8n	%i4,	%g7,	%i0
	ldd	[%l7 + 0x50],	%f0
	stx	%o6,	[%l7 + 0x40]
	movre	%o1,	%o4,	%g4
	ldx	[%l7 + 0x48],	%i7
	ldd	[%l7 + 0x58],	%f10
	tle	%xcc,	0x5
	edge8n	%o3,	%g1,	%i6
	ldsh	[%l7 + 0x30],	%l0
	ldub	[%l7 + 0x18],	%g6
	ldsw	[%l7 + 0x44],	%i3
	tvc	%icc,	0x1
	ldub	[%l7 + 0x17],	%i2
	fbge,a	%fcc3,	loop_1437
loop_1437:
	ldsw	[%l7 + 0x6C],	%l2
	movne	%xcc,	%i1,	%l3
	ldd	[%l7 + 0x18],	%f2
	bshuffle	%f6,	%f14,	%f10
	std	%f4,	[%l7 + 0x18]
	andn	%o7,	0x15C0,	%l5
	fmul8x16au	%f2,	%f9,	%f10
	movvs	%icc,	%o0,	%g5
	ldx	[%l7 + 0x58],	%o2
	ldx	[%l7 + 0x40],	%l1
	stb	%o5,	[%l7 + 0x67]
	fsrc2	%f4,	%f8
	std	%f12,	[%l7 + 0x78]
	ldx	[%l7 + 0x30],	%l4
	ldsb	[%l7 + 0x5C],	%g3
	stb	%l6,	[%l7 + 0x58]
	srax	%g2,	0x18,	%i4
	lduh	[%l7 + 0x5A],	%i5
	sth	%i0,	[%l7 + 0x6E]
	alignaddr	%o6,	%o1,	%g7
	movrne	%o4,	0x387,	%i7
	tvs	%icc,	0x5
	lduw	[%l7 + 0x1C],	%g4
	te	%xcc,	0x6
	udiv	%o3,	0x1C3E,	%i6
	brgz	%l0,	loop_1438
loop_1438:
	ldd	[%l7 + 0x40],	%f12
	movvs	%icc,	%g6,	%i3
	std	%f6,	[%l7 + 0x30]
	ldsb	[%l7 + 0x68],	%i2
	sdivcc	%l2,	0x1855,	%i1
	ldsh	[%l7 + 0x34],	%l3
	ldsh	[%l7 + 0x60],	%o7
	ba,a	loop_1439
loop_1439:
	fpadd32	%f10,	%f0,	%f2
	stw	%g1,	[%l7 + 0x34]
	edge8n	%o0,	%l5,	%g5
	movn	%icc,	%o2,	%o5
	lduh	[%l7 + 0x30],	%l4
	ldd	[%l7 + 0x30],	%f4
	fnor	%f10,	%f4,	%f0
	ldsw	[%l7 + 0x4C],	%l1
	fmovsleu	%icc,	%f1,	%f1
	fbuge,a	%fcc0,	loop_1440
loop_1440:
	std	%f8,	[%l7 + 0x20]
	ldsw	[%l7 + 0x70],	%g3
	ldsh	[%l7 + 0x60],	%l6
	orcc	%i4,	%g2,	%i0
	fsrc1s	%f9,	%f2
	fba	%fcc1,	loop_1441
loop_1441:
	srl	%o6,	0x04,	%i5
	stx	%g7,	[%l7 + 0x58]
	orn	%o1,	%o4,	%i7
	movrlez	%o3,	0x2BD,	%i6
	subccc	%l0,	%g6,	%i3
	sll	%g4,	%l2,	%i1
	ldd	[%l7 + 0x38],	%f4
	ldd	[%l7 + 0x20],	%f14
	stb	%l3,	[%l7 + 0x66]
	ldub	[%l7 + 0x63],	%i2
	srl	%g1,	%o0,	%o7
	andncc	%g5,	%o2,	%l5
	std	%f6,	[%l7 + 0x38]
	std	%f10,	[%l7 + 0x70]
	ld	[%l7 + 0x6C],	%f1
	ldx	[%l7 + 0x28],	%o5
	lduw	[%l7 + 0x14],	%l1
	sub	%l4,	0x17E5,	%l6
	ld	[%l7 + 0x1C],	%f10
	movrgez	%g3,	0x3E5,	%i4
	ldd	[%l7 + 0x40],	%f2
	stb	%g2,	[%l7 + 0x19]
	tsubcc	%o6,	0x09CA,	%i5
	xor	%g7,	0x0C56,	%o1
	sth	%o4,	[%l7 + 0x54]
	ld	[%l7 + 0x4C],	%f5
	ldsw	[%l7 + 0x6C],	%i0
	movrlez	%i7,	%i6,	%o3
	ldsb	[%l7 + 0x45],	%g6
	lduw	[%l7 + 0x58],	%i3
	ldsw	[%l7 + 0x4C],	%g4
	udivcc	%l2,	0x0498,	%i1
	st	%f6,	[%l7 + 0x5C]
	smulcc	%l0,	%l3,	%i2
	stw	%o0,	[%l7 + 0x60]
	ldd	[%l7 + 0x18],	%f12
	fnot2	%f8,	%f6
	stw	%g1,	[%l7 + 0x24]
	ldd	[%l7 + 0x30],	%f10
	st	%f7,	[%l7 + 0x60]
	std	%f14,	[%l7 + 0x28]
	fmovd	%f12,	%f2
	andcc	%o7,	0x0EF3,	%o2
	fsrc1	%f14,	%f10
	ldd	[%l7 + 0x38],	%f6
	ldub	[%l7 + 0x21],	%l5
	std	%f14,	[%l7 + 0x20]
	fbuge	%fcc0,	loop_1442
loop_1442:
	srl	%o5,	0x0A,	%g5
	lduw	[%l7 + 0x2C],	%l4
	stb	%l6,	[%l7 + 0x7E]
	ldsh	[%l7 + 0x4C],	%g3
	alignaddr	%i4,	%g2,	%o6
	smul	%l1,	0x0E03,	%g7
	fnot2	%f12,	%f0
	lduh	[%l7 + 0x4E],	%o1
	edge16	%o4,	%i0,	%i5
	ldsb	[%l7 + 0x2B],	%i7
	lduw	[%l7 + 0x2C],	%o3
	fmovspos	%xcc,	%f1,	%f0
	ldsh	[%l7 + 0x12],	%g6
	movpos	%xcc,	%i3,	%i6
	edge16l	%l2,	%i1,	%g4
	lduw	[%l7 + 0x30],	%l3
	ldsb	[%l7 + 0x68],	%l0
	ldx	[%l7 + 0x18],	%i2
	stb	%g1,	[%l7 + 0x5C]
	tgu	%icc,	0x1
	edge32ln	%o0,	%o7,	%o2
	ldub	[%l7 + 0x40],	%l5
	movgu	%xcc,	%o5,	%g5
	ldx	[%l7 + 0x28],	%l6
	fmovrsgez	%l4,	%f7,	%f9
	ldub	[%l7 + 0x0B],	%i4
	te	%icc,	0x6
	tvc	%icc,	0x6
	movrne	%g3,	0x0E2,	%g2
	ldub	[%l7 + 0x6C],	%o6
	lduh	[%l7 + 0x50],	%l1
	array8	%o1,	%o4,	%g7
	ldsb	[%l7 + 0x57],	%i0
	sllx	%i5,	0x11,	%o3
	movne	%icc,	%g6,	%i7
	ldx	[%l7 + 0x10],	%i6
	ldsh	[%l7 + 0x28],	%i3
	te	%icc,	0x6
	std	%f12,	[%l7 + 0x28]
	fcmpd	%fcc0,	%f2,	%f2
	ldub	[%l7 + 0x0C],	%l2
	ldx	[%l7 + 0x10],	%g4
	addccc	%l3,	0x129A,	%i1
	std	%f10,	[%l7 + 0x18]
	mulx	%l0,	%g1,	%o0
	lduh	[%l7 + 0x3C],	%i2
	lduh	[%l7 + 0x70],	%o7
	sth	%l5,	[%l7 + 0x52]
	array32	%o2,	%o5,	%g5
	fandnot1	%f12,	%f2,	%f6
	stb	%l4,	[%l7 + 0x55]
	lduw	[%l7 + 0x20],	%l6
	umulcc	%i4,	%g3,	%g2
	sllx	%l1,	0x0B,	%o6
	lduw	[%l7 + 0x1C],	%o1
	stb	%o4,	[%l7 + 0x0A]
	ldsh	[%l7 + 0x4C],	%i0
	fxor	%f14,	%f12,	%f8
	ldsh	[%l7 + 0x62],	%i5
	movcs	%icc,	%g7,	%o3
	ldx	[%l7 + 0x48],	%i7
	std	%f10,	[%l7 + 0x48]
	ldx	[%l7 + 0x30],	%g6
	udivcc	%i6,	0x0C1D,	%i3
	lduh	[%l7 + 0x36],	%l2
	fbg,a	%fcc1,	loop_1443
loop_1443:
	tle	%xcc,	0x6
	st	%f14,	[%l7 + 0x38]
	ldsw	[%l7 + 0x20],	%l3
	std	%f14,	[%l7 + 0x18]
	xor	%g4,	%l0,	%i1
	sth	%g1,	[%l7 + 0x26]
	ldsb	[%l7 + 0x2D],	%o0
	stw	%i2,	[%l7 + 0x0C]
	lduh	[%l7 + 0x2A],	%o7
	tleu	%icc,	0x4
	orn	%l5,	0x1DBA,	%o2
	ldd	[%l7 + 0x68],	%f4
	movcs	%xcc,	%o5,	%l4
	fandnot2	%f6,	%f12,	%f0
	stw	%g5,	[%l7 + 0x50]
	ldd	[%l7 + 0x30],	%f0
	movvs	%icc,	%l6,	%i4
	umulcc	%g3,	%l1,	%o6
	addccc	%g2,	0x1A0F,	%o1
	brlz	%i0,	loop_1444
loop_1444:
	lduh	[%l7 + 0x1A],	%o4
	addc	%i5,	%o3,	%i7
	std	%f6,	[%l7 + 0x78]
	ldsw	[%l7 + 0x4C],	%g6
	udivcc	%i6,	0x0EA4,	%i3
	lduh	[%l7 + 0x22],	%l2
	lduh	[%l7 + 0x6A],	%g7
	sth	%g4,	[%l7 + 0x34]
	std	%f6,	[%l7 + 0x50]
	ldd	[%l7 + 0x78],	%f14
	ld	[%l7 + 0x64],	%f11
	ldsb	[%l7 + 0x78],	%l3
	orn	%i1,	0x1E6C,	%g1
	ldd	[%l7 + 0x68],	%f4
	sth	%l0,	[%l7 + 0x64]
	stx	%i2,	[%l7 + 0x78]
	stw	%o0,	[%l7 + 0x44]
	ldsw	[%l7 + 0x18],	%l5
	fmovsle	%icc,	%f15,	%f14
	fornot1s	%f5,	%f8,	%f11
	ldx	[%l7 + 0x70],	%o2
	ld	[%l7 + 0x30],	%f1
	movcc	%xcc,	%o5,	%l4
	ldx	[%l7 + 0x08],	%g5
	ldd	[%l7 + 0x28],	%f8
	fbe,a	%fcc0,	loop_1445
loop_1445:
	bn,a	%icc,	loop_1446
loop_1446:
	std	%f0,	[%l7 + 0x38]
	ldd	[%l7 + 0x10],	%f0
	lduw	[%l7 + 0x74],	%o7
	ld	[%l7 + 0x74],	%f14
	edge32	%i4,	%g3,	%l1
	tsubcctv	%l6,	%o6,	%o1
	stw	%i0,	[%l7 + 0x14]
	tneg	%icc,	0x1
	fmovsa	%icc,	%f3,	%f11
	stx	%o4,	[%l7 + 0x10]
	taddcctv	%i5,	0x073A,	%o3
	ldd	[%l7 + 0x50],	%f12
	subccc	%g2,	0x14EC,	%i7
	addccc	%g6,	0x05AE,	%i3
	movrgz	%i6,	%g7,	%l2
	st	%f9,	[%l7 + 0x34]
	ldd	[%l7 + 0x20],	%f14
	lduh	[%l7 + 0x2C],	%g4
	st	%f3,	[%l7 + 0x30]
	ldsw	[%l7 + 0x24],	%l3
	ldub	[%l7 + 0x45],	%g1
	st	%f4,	[%l7 + 0x7C]
	bvc	loop_1447
loop_1447:
	lduh	[%l7 + 0x18],	%l0
	ldsh	[%l7 + 0x1A],	%i2
	sth	%i1,	[%l7 + 0x32]
	fabsd	%f6,	%f12
	ldub	[%l7 + 0x1D],	%l5
	std	%f0,	[%l7 + 0x28]
	edge32l	%o2,	%o0,	%o5
	andncc	%g5,	%o7,	%l4
	std	%f6,	[%l7 + 0x78]
	ldx	[%l7 + 0x50],	%g3
	move	%xcc,	%i4,	%l1
	ble,pn	%xcc,	loop_1448
loop_1448:
	array8	%l6,	%o6,	%i0
	addccc	%o1,	%i5,	%o3
	ldub	[%l7 + 0x38],	%g2
	tneg	%icc,	0x1
	ld	[%l7 + 0x40],	%f11
	ldd	[%l7 + 0x68],	%f14
	brz	%i7,	loop_1449
loop_1449:
	tsubcctv	%o4,	%g6,	%i6
	srlx	%g7,	0x10,	%i3
	ldsh	[%l7 + 0x66],	%g4
	taddcc	%l3,	%l2,	%l0
	bn,a	%icc,	loop_1450
loop_1450:
	smulcc	%g1,	%i1,	%i2
	ldsb	[%l7 + 0x4A],	%o2
	std	%f12,	[%l7 + 0x58]
	ldsw	[%l7 + 0x6C],	%l5
	st	%f5,	[%l7 + 0x48]
	ld	[%l7 + 0x6C],	%f2
	fbo	%fcc2,	loop_1451
loop_1451:
	ldsw	[%l7 + 0x3C],	%o5
	stb	%g5,	[%l7 + 0x7F]
	xorcc	%o0,	%l4,	%o7
	fmovd	%f4,	%f0
	st	%f10,	[%l7 + 0x50]
	movneg	%xcc,	%i4,	%g3
	fnot1s	%f11,	%f2
	sdivcc	%l1,	0x16AB,	%o6
	sth	%l6,	[%l7 + 0x1E]
	ld	[%l7 + 0x6C],	%f6
	fnot1s	%f1,	%f0
	orn	%i0,	%i5,	%o3
	stx	%o1,	[%l7 + 0x68]
	fsrc2	%f8,	%f2
	stw	%g2,	[%l7 + 0x6C]
	srax	%i7,	%g6,	%i6
	movle	%xcc,	%g7,	%i3
	std	%f6,	[%l7 + 0x48]
	xnor	%g4,	%o4,	%l3
	tneg	%xcc,	0x1
	tneg	%icc,	0x6
	ldsh	[%l7 + 0x64],	%l0
	xor	%g1,	0x142D,	%l2
	stx	%i1,	[%l7 + 0x50]
	stx	%i2,	[%l7 + 0x58]
	or	%l5,	0x1B96,	%o5
	st	%f6,	[%l7 + 0x74]
	movre	%o2,	%g5,	%o0
	bcs,a,pn	%icc,	loop_1452
loop_1452:
	fmovdg	%icc,	%f6,	%f11
	te	%xcc,	0x2
	movrgz	%o7,	%l4,	%g3
	ldub	[%l7 + 0x49],	%i4
	lduh	[%l7 + 0x66],	%l1
	tge	%xcc,	0x7
	fsrc2	%f4,	%f4
	ldsb	[%l7 + 0x3D],	%l6
	st	%f2,	[%l7 + 0x18]
	bge,a,pn	%icc,	loop_1453
loop_1453:
	fmovspos	%icc,	%f9,	%f4
	std	%f14,	[%l7 + 0x18]
	taddcctv	%i0,	0x0F1A,	%o6
	sth	%o3,	[%l7 + 0x24]
	ldsh	[%l7 + 0x0E],	%i5
	ldub	[%l7 + 0x2A],	%o1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type f   	: 87
!	Type i   	: 316
!	Type cti   	: 78
!	Type l   	: 519
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
main_t7:

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0xD,	%g2
	set	0x7,	%g3
	set	0x7,	%g4
	set	0x0,	%g5
	set	0xF,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x6,	%i1
	set	-0x6,	%i2
	set	-0xA,	%i3
	set	-0x0,	%i4
	set	-0x6,	%i5
	set	-0x1,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x4BF7276A,	%l0
	set	0x5167491C,	%l1
	set	0x25E47F7C,	%l2
	set	0x67520ABB,	%l3
	set	0x50EAC92A,	%l4
	set	0x77679DF7,	%l5
	set	0x4098A4CC,	%l6
	!# Output registers
	set	-0x17F4,	%o0
	set	-0x125E,	%o1
	set	-0x0C40,	%o2
	set	0x0BD1,	%o3
	set	0x152D,	%o4
	set	0x0E8D,	%o5
	set	-0x1051,	%o6
	set	-0x19C5,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	fbul	%fcc2,	loop_1454
loop_1454:
	fbul	%fcc3,	loop_1455
loop_1455:
	bg,a,pt	%icc,	loop_1456
loop_1456:
	fbu,a	%fcc3,	loop_1457
loop_1457:
	fsrc1	%f10,	%f0
	fnands	%f3,	%f14,	%f4
	fmuld8ulx16	%f15,	%f1,	%f6
	fpsub32s	%f4,	%f3,	%f8
	ldsh	[%l7 + 0x6E],	%g2
	movrne	%g6,	%i6,	%i7
	ble,pt	%xcc,	loop_1458
loop_1458:
	fmovsgu	%icc,	%f10,	%f15
	lduh	[%l7 + 0x20],	%g7
	std	%f2,	[%l7 + 0x28]
	fmovsa	%icc,	%f4,	%f11
	fpack32	%f0,	%f14,	%f0
	fmovdvc	%xcc,	%f9,	%f3
	fbe,a	%fcc1,	loop_1459
loop_1459:
	fands	%f1,	%f10,	%f7
	bpos,a,pn	%icc,	loop_1460
loop_1460:
	edge8n	%g4,	%o4,	%l3
	fbul,a	%fcc2,	loop_1461
loop_1461:
	fnot1	%f12,	%f10
	fand	%f12,	%f12,	%f10
	fmul8x16	%f3,	%f2,	%f14
	bleu,a,pt	%icc,	loop_1462
loop_1462:
	fpmerge	%f11,	%f1,	%f6
	fbge	%fcc3,	loop_1463
loop_1463:
	bvc	loop_1464
loop_1464:
	xor	%l0,	%i3,	%l2
	fnot2	%f10,	%f8
	fmovrdlez	%g1,	%f10,	%f4
	fmul8sux16	%f4,	%f8,	%f12
	fbu	%fcc0,	loop_1465
loop_1465:
	fmovsl	%xcc,	%f8,	%f4
	fandnot1s	%f4,	%f14,	%f0
	bvc,a	%icc,	loop_1466
loop_1466:
	brnz	%i2,	loop_1467
loop_1467:
	ble,pn	%icc,	loop_1468
loop_1468:
	fors	%f12,	%f11,	%f3
	be,a,pt	%xcc,	loop_1469
loop_1469:
	bn,pn	%xcc,	loop_1470
loop_1470:
	fnot1	%f8,	%f0
	brgz	%l5,	loop_1471
loop_1471:
	bg,a,pt	%xcc,	loop_1472
loop_1472:
	fnot2	%f6,	%f0
	fpack32	%f4,	%f2,	%f4
	brnz	%i1,	loop_1473
loop_1473:
	fbul	%fcc0,	loop_1474
loop_1474:
	fbge,a	%fcc0,	loop_1475
loop_1475:
	nop
	setx loop_1476, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1476:
	stw	%o2,	[%l7 + 0x64]
	fbu	%fcc3,	loop_1477
loop_1477:
	fcmpgt16	%f6,	%f4,	%g5
	ba,a	loop_1478
loop_1478:
	sth	%o0,	[%l7 + 0x20]
	tn	%xcc,	0x6
	faligndata	%f2,	%f6,	%f4
	fmul8x16au	%f14,	%f10,	%f6
	fbn	%fcc3,	loop_1479
loop_1479:
	fbule,a	%fcc3,	loop_1480
loop_1480:
	bcc,pt	%xcc,	loop_1481
loop_1481:
	brnz	%o7,	loop_1482
loop_1482:
	tl	%icc,	0x2
	fabsd	%f0,	%f6
	fbn	%fcc2,	loop_1483
loop_1483:
	stx	%o5,	[%l7 + 0x30]
	fba,a	%fcc2,	loop_1484
loop_1484:
	fsrc1	%f14,	%f0
	fbule,a	%fcc1,	loop_1485
loop_1485:
	bpos,a	%icc,	loop_1486
loop_1486:
	array16	%g3,	%i4,	%l1
	fmuld8sux16	%f1,	%f5,	%f2
	nop
	setx loop_1487, %l0, %l1
	jmpl %l1, %l6
loop_1487:
	nop
	setx loop_1488, %l0, %l1
	jmpl %l1, %l4
loop_1488:
	fone	%f6
	brgez,a	%i0,	loop_1489
loop_1489:
	fmovrdgez	%o3,	%f12,	%f0
	ldsh	[%l7 + 0x2E],	%o6
	fmovde	%icc,	%f9,	%f15
	fmovrdlz	%i5,	%f0,	%f10
	fmovde	%icc,	%f9,	%f1
	fmovrse	%g2,	%f7,	%f1
	bgu,pn	%icc,	loop_1490
loop_1490:
	fbe,a	%fcc1,	loop_1491
loop_1491:
	be,pn	%xcc,	loop_1492
loop_1492:
	stx	%o1,	[%l7 + 0x38]
	bge,pt	%icc,	loop_1493
loop_1493:
	fbule,a	%fcc1,	loop_1494
loop_1494:
	fpsub16s	%f13,	%f13,	%f0
	bcc,pt	%xcc,	loop_1495
loop_1495:
	ldd	[%l7 + 0x28],	%f2
	bvs	loop_1496
loop_1496:
	fbe,a	%fcc0,	loop_1497
loop_1497:
	brnz	%g6,	loop_1498
loop_1498:
	fbul	%fcc2,	loop_1499
loop_1499:
	fmovsgu	%xcc,	%f13,	%f2
	fmovscc	%xcc,	%f8,	%f6
	fbug,a	%fcc3,	loop_1500
loop_1500:
	fmovse	%icc,	%f14,	%f14
	brlz	%i7,	loop_1501
loop_1501:
	fmul8x16au	%f3,	%f12,	%f2
	fbu,a	%fcc2,	loop_1502
loop_1502:
	ldub	[%l7 + 0x63],	%g7
	fxnors	%f6,	%f14,	%f1
	ba	%icc,	loop_1503
loop_1503:
	fpack16	%f6,	%f2
	bg,pt	%xcc,	loop_1504
loop_1504:
	fmovdg	%icc,	%f13,	%f0
	brgez,a	%g4,	loop_1505
loop_1505:
	brgez	%o4,	loop_1506
loop_1506:
	brgz	%i6,	loop_1507
loop_1507:
	fcmpeq32	%f0,	%f14,	%l3
	ldsw	[%l7 + 0x7C],	%i3
	fmovsgu	%icc,	%f0,	%f0
	fpack16	%f14,	%f11
	fpsub32	%f2,	%f0,	%f2
	fmovspos	%xcc,	%f10,	%f11
	std	%f8,	[%l7 + 0x40]
	fnors	%f4,	%f0,	%f12
	fsrc1s	%f12,	%f5
	fcmpeq16	%f12,	%f2,	%l0
	fbuge,a	%fcc3,	loop_1508
loop_1508:
	bl	%xcc,	loop_1509
loop_1509:
	fbo,a	%fcc1,	loop_1510
loop_1510:
	fpadd32	%f10,	%f6,	%f8
	bcc	loop_1511
loop_1511:
	fmovs	%f3,	%f14
	fbe,a	%fcc3,	loop_1512
loop_1512:
	stw	%g1,	[%l7 + 0x4C]
	fbule,a	%fcc3,	loop_1513
loop_1513:
	fmovscc	%icc,	%f2,	%f5
	fxors	%f10,	%f9,	%f3
	call	loop_1514
loop_1514:
	bne,pt	%icc,	loop_1515
loop_1515:
	fmovsleu	%xcc,	%f4,	%f2
	andncc	%i2,	%l5,	%l2
	fmovscs	%icc,	%f0,	%f9
	fblg,a	%fcc3,	loop_1516
loop_1516:
	fnegs	%f9,	%f3
	bne,a,pn	%icc,	loop_1517
loop_1517:
	fbue	%fcc1,	loop_1518
loop_1518:
	call	loop_1519
loop_1519:
	fbule,a	%fcc2,	loop_1520
loop_1520:
	bcs,a	loop_1521
loop_1521:
	bgu,pt	%xcc,	loop_1522
loop_1522:
	fxor	%f12,	%f14,	%f12
	bg	%icc,	loop_1523
loop_1523:
	fmovsvs	%xcc,	%f14,	%f2
	nop
	setx loop_1524, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1524:
	pdist	%f14,	%f6,	%f12
	fones	%f0
	addcc	%i1,	0x0A2B,	%o2
	brnz,a	%g5,	loop_1525
loop_1525:
	fmovda	%xcc,	%f12,	%f14
	for	%f2,	%f4,	%f2
	fzeros	%f15
	fmovdvs	%xcc,	%f8,	%f6
	fbl,a	%fcc2,	loop_1526
loop_1526:
	lduh	[%l7 + 0x20],	%o7
	fnegs	%f6,	%f7
	fmovrdlz	%o0,	%f10,	%f14
	bcc,a	%icc,	loop_1527
loop_1527:
	fnor	%f2,	%f4,	%f10
	fmul8x16al	%f5,	%f0,	%f8
	fmovdn	%icc,	%f6,	%f5
	fxnors	%f12,	%f15,	%f7
	nop
	setx loop_1528, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1528:
	fblg,a	%fcc2,	loop_1529
loop_1529:
	fmovdleu	%xcc,	%f11,	%f0
	bgu,pt	%xcc,	loop_1530
loop_1530:
	bvs	loop_1531
loop_1531:
	fmovdle	%xcc,	%f2,	%f8
	fcmpd	%fcc2,	%f12,	%f4
	fmovrdlz	%o5,	%f6,	%f14
	movne	%icc,	%i4,	%g3
	fmovsvc	%icc,	%f11,	%f15
	fmovsne	%icc,	%f12,	%f11
	bcs,a	%icc,	loop_1532
loop_1532:
	fxors	%f14,	%f3,	%f3
	be	%xcc,	loop_1533
loop_1533:
	fmovdvs	%xcc,	%f15,	%f14
	fbg,a	%fcc1,	loop_1534
loop_1534:
	bcs,a,pn	%xcc,	loop_1535
loop_1535:
	fmovd	%f8,	%f0
	fsrc1s	%f11,	%f13
	fmovdle	%xcc,	%f15,	%f5
	fmul8x16au	%f13,	%f14,	%f6
	fbe	%fcc3,	loop_1536
loop_1536:
	fbuge,a	%fcc2,	loop_1537
loop_1537:
	fmovrdne	%l6,	%f12,	%f6
	for	%f6,	%f2,	%f6
	brgez	%l1,	loop_1538
loop_1538:
	fmovrse	%i0,	%f14,	%f12
	stb	%l4,	[%l7 + 0x52]
	fbl,a	%fcc0,	loop_1539
loop_1539:
	bvc	%icc,	loop_1540
loop_1540:
	movrgz	%o6,	0x0C2,	%o3
	fmovsleu	%icc,	%f15,	%f13
	fcmped	%fcc3,	%f10,	%f2
	fbge	%fcc1,	loop_1541
loop_1541:
	fcmple32	%f4,	%f0,	%i5
	fmovdle	%xcc,	%f8,	%f0
	fbge	%fcc3,	loop_1542
loop_1542:
	fsrc2	%f4,	%f4
	fcmple32	%f12,	%f0,	%g2
	fmovsn	%icc,	%f1,	%f13
	fnot1	%f8,	%f8
	bgu,a,pn	%icc,	loop_1543
loop_1543:
	fmovrse	%o1,	%f0,	%f15
	fors	%f13,	%f4,	%f10
	bne,pn	%xcc,	loop_1544
loop_1544:
	bcs	loop_1545
loop_1545:
	bge,pn	%icc,	loop_1546
loop_1546:
	fmovsle	%icc,	%f1,	%f8
	brgez,a	%i7,	loop_1547
loop_1547:
	fbu	%fcc1,	loop_1548
loop_1548:
	fbue,a	%fcc3,	loop_1549
loop_1549:
	fcmpgt32	%f12,	%f10,	%g6
	fmovsl	%icc,	%f13,	%f0
	fbue,a	%fcc2,	loop_1550
loop_1550:
	stb	%g4,	[%l7 + 0x63]
	fba	%fcc3,	loop_1551
loop_1551:
	fsrc2s	%f5,	%f5
	fnot1s	%f13,	%f6
	bvc,a,pn	%icc,	loop_1552
loop_1552:
	movg	%icc,	%g7,	%i6
	bcc,pn	%xcc,	loop_1553
loop_1553:
	fbn,a	%fcc0,	loop_1554
loop_1554:
	fbu	%fcc0,	loop_1555
loop_1555:
	fzeros	%f5
	bvs,pn	%xcc,	loop_1556
loop_1556:
	ld	[%l7 + 0x48],	%f1
	lduh	[%l7 + 0x6E],	%l3
	movrlz	%i3,	0x207,	%o4
	siam	0x7
	movge	%xcc,	%g1,	%i2
	fblg	%fcc2,	loop_1557
loop_1557:
	stx	%l0,	[%l7 + 0x78]
	bcs	loop_1558
loop_1558:
	fbe	%fcc1,	loop_1559
loop_1559:
	umul	%l5,	%i1,	%l2
	fmovspos	%icc,	%f12,	%f1
	fble,a	%fcc2,	loop_1560
loop_1560:
	fmovspos	%xcc,	%f4,	%f1
	bvs,a,pt	%xcc,	loop_1561
loop_1561:
	bgu,pt	%icc,	loop_1562
loop_1562:
	brlez	%g5,	loop_1563
loop_1563:
	fmovdvs	%xcc,	%f0,	%f6
	fnand	%f8,	%f10,	%f2
	bleu,a,pt	%icc,	loop_1564
loop_1564:
	fmovdvs	%icc,	%f9,	%f9
	be,a	%icc,	loop_1565
loop_1565:
	ldsb	[%l7 + 0x5E],	%o7
	bge,a	%xcc,	loop_1566
loop_1566:
	ble,pt	%icc,	loop_1567
loop_1567:
	ble	loop_1568
loop_1568:
	bge,pn	%xcc,	loop_1569
loop_1569:
	st	%f13,	[%l7 + 0x3C]
	fmovdn	%icc,	%f15,	%f9
	fsrc2s	%f2,	%f8
	ldsb	[%l7 + 0x4D],	%o2
	nop
	setx loop_1570, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1570:
	nop
	setx loop_1571, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1571:
	fmovsle	%icc,	%f9,	%f1
	ldsw	[%l7 + 0x74],	%o5
	fmovrsgz	%i4,	%f13,	%f1
	fmovdvs	%icc,	%f6,	%f10
	fnot2	%f0,	%f6
	bcc,a	loop_1572
loop_1572:
	ldsh	[%l7 + 0x0A],	%o0
	fbn	%fcc1,	loop_1573
loop_1573:
	fxnor	%f14,	%f0,	%f8
	fbo	%fcc3,	loop_1574
loop_1574:
	fbug	%fcc3,	loop_1575
loop_1575:
	pdist	%f8,	%f0,	%f10
	stx	%l6,	[%l7 + 0x18]
	call	loop_1576
loop_1576:
	stb	%l1,	[%l7 + 0x48]
	fmovdn	%icc,	%f8,	%f7
	ldub	[%l7 + 0x72],	%g3
	bcc,pn	%xcc,	loop_1577
loop_1577:
	fbne,a	%fcc2,	loop_1578
loop_1578:
	bshuffle	%f2,	%f4,	%f6
	bn,a,pn	%xcc,	loop_1579
loop_1579:
	fnor	%f10,	%f14,	%f12
	bpos,pt	%xcc,	loop_1580
loop_1580:
	brgez,a	%l4,	loop_1581
loop_1581:
	fmuld8sux16	%f1,	%f11,	%f10
	bvc,pt	%icc,	loop_1582
loop_1582:
	ldd	[%l7 + 0x10],	%f12
	for	%f12,	%f10,	%f10
	fmovsleu	%xcc,	%f10,	%f6
	ble,a	loop_1583
loop_1583:
	nop
	setx loop_1584, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1584:
	fmovdcs	%xcc,	%f3,	%f6
	fcmped	%fcc1,	%f2,	%f14
	bpos	loop_1585
loop_1585:
	fmovrdlez	%o6,	%f2,	%f12
	fpadd16s	%f6,	%f7,	%f2
	fmovda	%icc,	%f10,	%f5
	fmovsg	%xcc,	%f8,	%f11
	fandnot1	%f14,	%f6,	%f4
	fpsub32s	%f2,	%f4,	%f9
	fcmpeq32	%f10,	%f12,	%o3
	fbg	%fcc0,	loop_1586
loop_1586:
	fmovdcc	%icc,	%f12,	%f1
	fmovrdlez	%i0,	%f0,	%f14
	fmovdpos	%icc,	%f10,	%f13
	fnors	%f2,	%f4,	%f12
	fnor	%f10,	%f0,	%f14
	fpsub16s	%f8,	%f2,	%f12
	fmovdcc	%icc,	%f13,	%f4
	fnands	%f5,	%f12,	%f1
	fsrc1	%f10,	%f6
	fmovrdne	%g2,	%f0,	%f14
	nop
	setx loop_1587, %l0, %l1
	jmpl %l1, %o1
loop_1587:
	faligndata	%f14,	%f14,	%f4
	bneg,a	loop_1588
loop_1588:
	fmuld8ulx16	%f12,	%f4,	%f0
	bneg	%icc,	loop_1589
loop_1589:
	fbl	%fcc1,	loop_1590
loop_1590:
	fones	%f14
	nop
	setx loop_1591, %l0, %l1
	jmpl %l1, %i5
loop_1591:
	fnot1s	%f9,	%f0
	fnegs	%f4,	%f14
	fbue	%fcc3,	loop_1592
loop_1592:
	edge32ln	%i7,	%g4,	%g6
	brlz,a	%i6,	loop_1593
loop_1593:
	fmovscs	%xcc,	%f1,	%f15
	fands	%f4,	%f6,	%f4
	addccc	%l3,	0x0E27,	%i3
	nop
	setx loop_1594, %l0, %l1
	jmpl %l1, %g7
loop_1594:
	fpack32	%f8,	%f0,	%f10
	fnot1	%f2,	%f4
	fbn,a	%fcc0,	loop_1595
loop_1595:
	fbn,a	%fcc0,	loop_1596
loop_1596:
	fbuge	%fcc1,	loop_1597
loop_1597:
	call	loop_1598
loop_1598:
	bne,a	loop_1599
loop_1599:
	bcc,pn	%icc,	loop_1600
loop_1600:
	fmovsn	%icc,	%f15,	%f2
	fbue	%fcc0,	loop_1601
loop_1601:
	fpack32	%f6,	%f4,	%f0
	bg,pt	%icc,	loop_1602
loop_1602:
	subccc	%o4,	%g1,	%l0
	fmovscc	%icc,	%f0,	%f9
	bleu,a,pn	%xcc,	loop_1603
loop_1603:
	fnands	%f3,	%f15,	%f14
	addcc	%i2,	0x10F0,	%i1
	fbne	%fcc1,	loop_1604
loop_1604:
	fandnot1	%f2,	%f4,	%f4
	call	loop_1605
loop_1605:
	fmovrdgez	%l5,	%f10,	%f12
	fbule,a	%fcc3,	loop_1606
loop_1606:
	bne,pn	%icc,	loop_1607
loop_1607:
	fmovrdgz	%l2,	%f4,	%f14
	fmuld8ulx16	%f10,	%f1,	%f4
	fnegs	%f4,	%f10
	fbl,a	%fcc3,	loop_1608
loop_1608:
	fcmpne32	%f4,	%f0,	%o7
	fsrc1s	%f7,	%f10
	ldsb	[%l7 + 0x6B],	%o2
	ldsb	[%l7 + 0x46],	%g5
	bcc	%icc,	loop_1609
loop_1609:
	fmovrsgz	%o5,	%f0,	%f13
	fbu	%fcc2,	loop_1610
loop_1610:
	bleu,a	%xcc,	loop_1611
loop_1611:
	fpsub32s	%f12,	%f11,	%f4
	fandnot1	%f14,	%f10,	%f12
	fbule,a	%fcc0,	loop_1612
loop_1612:
	bpos	loop_1613
loop_1613:
	fpsub16	%f6,	%f8,	%f12
	bvc,pn	%icc,	loop_1614
loop_1614:
	fbuge,a	%fcc1,	loop_1615
loop_1615:
	bn,a	%icc,	loop_1616
loop_1616:
	fnor	%f2,	%f8,	%f10
	fmovsleu	%xcc,	%f6,	%f11
	bvs,a	loop_1617
loop_1617:
	fbug,a	%fcc0,	loop_1618
loop_1618:
	fnot1	%f4,	%f0
	fandnot2	%f14,	%f4,	%f10
	bn,pt	%xcc,	loop_1619
loop_1619:
	fbul,a	%fcc3,	loop_1620
loop_1620:
	fbne	%fcc3,	loop_1621
loop_1621:
	fmovdcs	%xcc,	%f9,	%f6
	fbe	%fcc0,	loop_1622
loop_1622:
	fpackfix	%f2,	%f6
	nop
	setx loop_1623, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1623:
	fble,a	%fcc1,	loop_1624
loop_1624:
	fsrc1	%f14,	%f12
	movrlez	%o0,	%l6,	%l1
	brz,a	%g3,	loop_1625
loop_1625:
	fmovsl	%xcc,	%f6,	%f12
	lduw	[%l7 + 0x50],	%i4
	fbuge	%fcc1,	loop_1626
loop_1626:
	call	loop_1627
loop_1627:
	bvs,a,pn	%xcc,	loop_1628
loop_1628:
	ldd	[%l7 + 0x78],	%f8
	fbl	%fcc0,	loop_1629
loop_1629:
	fpadd32s	%f11,	%f11,	%f13
	lduw	[%l7 + 0x54],	%o6
	fbo,a	%fcc1,	loop_1630
loop_1630:
	fsrc2	%f6,	%f4
	bl,pn	%xcc,	loop_1631
loop_1631:
	fbuge,a	%fcc2,	loop_1632
loop_1632:
	fexpand	%f7,	%f8
	brgz,a	%l4,	loop_1633
loop_1633:
	bcs	loop_1634
loop_1634:
	fcmpeq32	%f0,	%f10,	%o3
	std	%f14,	[%l7 + 0x18]
	fnot2	%f6,	%f10
	nop
	setx loop_1635, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1635:
	ld	[%l7 + 0x0C],	%f15
	fsrc2	%f10,	%f6
	nop
	setx loop_1636, %l0, %l1
	jmpl %l1, %i0
loop_1636:
	fnot2s	%f14,	%f13
	fbl	%fcc1,	loop_1637
loop_1637:
	fbn	%fcc1,	loop_1638
loop_1638:
	fpadd32s	%f3,	%f13,	%f6
	pdist	%f14,	%f2,	%f6
	fpadd16s	%f8,	%f12,	%f1
	fmul8x16au	%f1,	%f15,	%f14
	bge,a	%xcc,	loop_1639
loop_1639:
	fbu,a	%fcc1,	loop_1640
loop_1640:
	fmovrdlz	%o1,	%f6,	%f14
	fbge,a	%fcc2,	loop_1641
loop_1641:
	fzeros	%f0
	bneg	%xcc,	loop_1642
loop_1642:
	bleu,a,pn	%icc,	loop_1643
loop_1643:
	fmovdle	%icc,	%f13,	%f0
	fmovd	%f10,	%f2
	fxor	%f4,	%f10,	%f14
	fmovse	%xcc,	%f2,	%f12
	fmovdneg	%xcc,	%f5,	%f0
	fmovda	%xcc,	%f3,	%f3
	sth	%g2,	[%l7 + 0x38]
	fnors	%f12,	%f0,	%f15
	brlz,a	%i5,	loop_1644
loop_1644:
	fmovdg	%xcc,	%f9,	%f9
	fbo	%fcc3,	loop_1645
loop_1645:
	brlez	%g4,	loop_1646
loop_1646:
	fbule,a	%fcc2,	loop_1647
loop_1647:
	fpsub32	%f10,	%f12,	%f4
	call	loop_1648
loop_1648:
	bneg	loop_1649
loop_1649:
	fnegd	%f4,	%f12
	fbu,a	%fcc1,	loop_1650
loop_1650:
	ble,a	%icc,	loop_1651
loop_1651:
	faligndata	%f0,	%f6,	%f8
	fmovdle	%xcc,	%f4,	%f6
	fbule,a	%fcc3,	loop_1652
loop_1652:
	fbge	%fcc3,	loop_1653
loop_1653:
	ble,a	loop_1654
loop_1654:
	bpos,a	%icc,	loop_1655
loop_1655:
	fmovscc	%icc,	%f0,	%f8
	tge	%icc,	0x4
	stb	%g6,	[%l7 + 0x2F]
	fmovsvc	%icc,	%f0,	%f2
	fmovdle	%xcc,	%f14,	%f2
	fpsub32s	%f0,	%f9,	%f4
	bvs	loop_1656
loop_1656:
	call	loop_1657
loop_1657:
	fnand	%f6,	%f2,	%f4
	ldsb	[%l7 + 0x54],	%i7
	fandnot2s	%f9,	%f11,	%f3
	fone	%f6
	brgz	%l3,	loop_1658
loop_1658:
	stx	%i3,	[%l7 + 0x10]
	fmovrsgz	%i6,	%f13,	%f15
	fpsub32s	%f5,	%f12,	%f3
	fbn	%fcc2,	loop_1659
loop_1659:
	fmovdneg	%xcc,	%f6,	%f14
	fand	%f0,	%f2,	%f8
	call	loop_1660
loop_1660:
	fors	%f13,	%f14,	%f12
	bge,a,pt	%icc,	loop_1661
loop_1661:
	fmovrde	%g7,	%f12,	%f14
	fbo,a	%fcc2,	loop_1662
loop_1662:
	fmul8x16al	%f6,	%f10,	%f6
	brlez,a	%g1,	loop_1663
loop_1663:
	bcc	%icc,	loop_1664
loop_1664:
	ble,a,pt	%icc,	loop_1665
loop_1665:
	lduw	[%l7 + 0x2C],	%l0
	fbue	%fcc1,	loop_1666
loop_1666:
	fmovdgu	%xcc,	%f9,	%f10
	tvc	%xcc,	0x6
	fnot2	%f12,	%f6
	fmovrse	%o4,	%f4,	%f1
	fblg	%fcc1,	loop_1667
loop_1667:
	fxors	%f13,	%f4,	%f9
	fmovsl	%xcc,	%f7,	%f14
	fmul8sux16	%f0,	%f12,	%f0
	bgu,pn	%xcc,	loop_1668
loop_1668:
	fcmpgt16	%f6,	%f2,	%i1
	fble,a	%fcc3,	loop_1669
loop_1669:
	fandnot1	%f12,	%f2,	%f6
	fbn	%fcc1,	loop_1670
loop_1670:
	fmovse	%xcc,	%f2,	%f0
	bvc,a	%icc,	loop_1671
loop_1671:
	fmovda	%xcc,	%f12,	%f2
	fmovdg	%xcc,	%f13,	%f14
	nop
	setx loop_1672, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1672:
	ba,a,pn	%icc,	loop_1673
loop_1673:
	fcmpeq32	%f6,	%f12,	%i2
	fbug,a	%fcc0,	loop_1674
loop_1674:
	brgez,a	%l2,	loop_1675
loop_1675:
	fzero	%f4
	fnot1	%f0,	%f2
	fmovse	%xcc,	%f4,	%f10
	ldub	[%l7 + 0x5E],	%l5
	brlez,a	%o2,	loop_1676
loop_1676:
	bleu	%icc,	loop_1677
loop_1677:
	fmovrdlez	%o7,	%f8,	%f8
	fcmpne16	%f8,	%f10,	%o5
	fbn	%fcc0,	loop_1678
loop_1678:
	fpackfix	%f2,	%f15
	fpsub32	%f2,	%f4,	%f6
	fsrc1s	%f15,	%f12
	fmovsl	%xcc,	%f13,	%f3
	fmuld8ulx16	%f0,	%f2,	%f10
	fmovd	%f2,	%f10
	bneg,a	%xcc,	loop_1679
loop_1679:
	stx	%g5,	[%l7 + 0x28]
	bleu	loop_1680
loop_1680:
	fmul8x16au	%f11,	%f0,	%f10
	ldub	[%l7 + 0x0C],	%l6
	fandnot1	%f0,	%f10,	%f8
	fbg	%fcc1,	loop_1681
loop_1681:
	brz	%o0,	loop_1682
loop_1682:
	addc	%l1,	%i4,	%o6
	bn,pn	%xcc,	loop_1683
loop_1683:
	stw	%g3,	[%l7 + 0x30]
	fbg	%fcc0,	loop_1684
loop_1684:
	nop
	setx loop_1685, %l0, %l1
	jmpl %l1, %o3
loop_1685:
	call	loop_1686
loop_1686:
	fmul8x16	%f0,	%f2,	%f12
	bleu	loop_1687
loop_1687:
	fnand	%f12,	%f14,	%f10
	fpadd32	%f8,	%f0,	%f6
	brgez,a	%l4,	loop_1688
loop_1688:
	bn,a	%xcc,	loop_1689
loop_1689:
	ldsw	[%l7 + 0x18],	%i0
	fpmerge	%f3,	%f8,	%f12
	fsrc2s	%f5,	%f4
	fmovsl	%xcc,	%f5,	%f1
	bvs,a	loop_1690
loop_1690:
	fpsub16s	%f8,	%f4,	%f0
	fbn,a	%fcc1,	loop_1691
loop_1691:
	fmuld8sux16	%f9,	%f6,	%f4
	fcmple16	%f10,	%f12,	%g2
	fxnor	%f8,	%f14,	%f12
	fbg,a	%fcc2,	loop_1692
loop_1692:
	brgz	%i5,	loop_1693
loop_1693:
	fnot2s	%f8,	%f11
	fmovdgu	%icc,	%f11,	%f0
	bn,a	%icc,	loop_1694
loop_1694:
	brlz	%g4,	loop_1695
loop_1695:
	brgz	%o1,	loop_1696
loop_1696:
	ldx	[%l7 + 0x40],	%g6
	bn,pt	%icc,	loop_1697
loop_1697:
	fmovdcc	%icc,	%f9,	%f15
	bg,a,pt	%xcc,	loop_1698
loop_1698:
	fpadd32	%f8,	%f4,	%f4
	fcmpeq16	%f0,	%f8,	%i7
	bg,a,pn	%icc,	loop_1699
loop_1699:
	fmuld8ulx16	%f7,	%f3,	%f2
	fble,a	%fcc0,	loop_1700
loop_1700:
	brgez,a	%l3,	loop_1701
loop_1701:
	lduh	[%l7 + 0x3C],	%i3
	fnot2s	%f0,	%f12
	fmovdg	%xcc,	%f14,	%f12
	nop
	setx loop_1702, %l0, %l1
	jmpl %l1, %i6
loop_1702:
	fzero	%f0
	fmovrde	%g1,	%f10,	%f2
	fones	%f3
	fbug	%fcc2,	loop_1703
loop_1703:
	brlez	%g7,	loop_1704
loop_1704:
	fxor	%f8,	%f6,	%f10
	fbne,a	%fcc0,	loop_1705
loop_1705:
	bgu	%xcc,	loop_1706
loop_1706:
	fmovrslez	%l0,	%f12,	%f4
	fmovs	%f5,	%f10
	fmovsg	%xcc,	%f9,	%f15
	fmovsa	%xcc,	%f3,	%f15
	nop
	setx loop_1707, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1707:
	bcc,pn	%icc,	loop_1708
loop_1708:
	bg,a,pt	%xcc,	loop_1709
loop_1709:
	fbl,a	%fcc3,	loop_1710
loop_1710:
	fexpand	%f0,	%f12
	fmovse	%xcc,	%f15,	%f7
	fmovdpos	%icc,	%f8,	%f3
	edge8	%i1,	%o4,	%l2
	lduh	[%l7 + 0x0E],	%i2
	bg,pn	%xcc,	loop_1711
loop_1711:
	ldx	[%l7 + 0x18],	%l5
	brgz	%o7,	loop_1712
loop_1712:
	fba,a	%fcc2,	loop_1713
loop_1713:
	fbn	%fcc0,	loop_1714
loop_1714:
	array32	%o2,	%g5,	%o5
	fmovrsgz	%l6,	%f2,	%f2
	bl,a,pn	%icc,	loop_1715
loop_1715:
	fpsub32s	%f9,	%f8,	%f4
	fble	%fcc1,	loop_1716
loop_1716:
	bvc,a,pt	%xcc,	loop_1717
loop_1717:
	fmovrslz	%o0,	%f1,	%f13
	fbul,a	%fcc2,	loop_1718
loop_1718:
	ldsw	[%l7 + 0x20],	%l1
	fmovdne	%xcc,	%f7,	%f9
	fnegs	%f9,	%f4
	mova	%icc,	%i4,	%o6
	fmovdg	%icc,	%f11,	%f8
	subc	%o3,	%l4,	%g3
	fmovsa	%icc,	%f5,	%f7
	fmovdgu	%icc,	%f11,	%f10
	fsrc1	%f0,	%f14
	bpos,pn	%xcc,	loop_1719
loop_1719:
	fbn	%fcc0,	loop_1720
loop_1720:
	fandnot2	%f10,	%f14,	%f12
	nop
	setx loop_1721, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1721:
	nop
	setx loop_1722, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1722:
	bn,a,pt	%icc,	loop_1723
loop_1723:
	ba,pn	%icc,	loop_1724
loop_1724:
	bg,a	loop_1725
loop_1725:
	fpack16	%f12,	%f0
	be,a,pt	%icc,	loop_1726
loop_1726:
	fcmple16	%f12,	%f6,	%i0
	lduw	[%l7 + 0x08],	%g2
	bcs,a,pn	%icc,	loop_1727
loop_1727:
	fmovsvc	%xcc,	%f6,	%f8
	fsrc1	%f10,	%f0
	bcc	%xcc,	loop_1728
loop_1728:
	bneg,a,pt	%icc,	loop_1729
loop_1729:
	fpadd16	%f0,	%f4,	%f6
	brz	%g4,	loop_1730
loop_1730:
	fbe	%fcc0,	loop_1731
loop_1731:
	bl,a	loop_1732
loop_1732:
	bn,pt	%xcc,	loop_1733
loop_1733:
	fnot2	%f10,	%f14
	fpadd16s	%f4,	%f4,	%f4
	fba	%fcc3,	loop_1734
loop_1734:
	fmovsvs	%icc,	%f3,	%f3
	fbl,a	%fcc2,	loop_1735
loop_1735:
	fbug,a	%fcc1,	loop_1736
loop_1736:
	brgz	%i5,	loop_1737
loop_1737:
	fpack32	%f14,	%f8,	%f2
	brz,a	%g6,	loop_1738
loop_1738:
	fcmpes	%fcc2,	%f1,	%f9
	fsrc2	%f12,	%f4
	stx	%o1,	[%l7 + 0x18]
	fbe	%fcc0,	loop_1739
loop_1739:
	fbge	%fcc3,	loop_1740
loop_1740:
	ldsh	[%l7 + 0x3E],	%l3
	ldsb	[%l7 + 0x37],	%i3
	bpos,a,pn	%xcc,	loop_1741
loop_1741:
	fbo	%fcc3,	loop_1742
loop_1742:
	fmul8x16al	%f13,	%f14,	%f14
	fcmpeq16	%f0,	%f0,	%i7
	std	%f8,	[%l7 + 0x38]
	fcmpeq32	%f6,	%f14,	%i6
	fbul	%fcc0,	loop_1743
loop_1743:
	fpackfix	%f4,	%f13
	ldsh	[%l7 + 0x26],	%g1
	nop
	setx loop_1744, %l0, %l1
	jmpl %l1, %l0
loop_1744:
	fmovde	%xcc,	%f7,	%f0
	fornot1	%f10,	%f12,	%f4
	fzero	%f6
	fmovsvc	%icc,	%f1,	%f8
	fmovrdlez	%g7,	%f10,	%f6
	fbn,a	%fcc1,	loop_1745
loop_1745:
	fnot2s	%f13,	%f6
	fmovdcc	%icc,	%f2,	%f14
	fbn,a	%fcc2,	loop_1746
loop_1746:
	ble,a,pn	%xcc,	loop_1747
loop_1747:
	fornot2	%f2,	%f10,	%f12
	fba,a	%fcc0,	loop_1748
loop_1748:
	call	loop_1749
loop_1749:
	fmovsa	%xcc,	%f12,	%f0
	bvs,pn	%xcc,	loop_1750
loop_1750:
	be,a,pt	%icc,	loop_1751
loop_1751:
	ldx	[%l7 + 0x50],	%i1
	bvc,pn	%xcc,	loop_1752
loop_1752:
	fornot2	%f14,	%f2,	%f14
	tneg	%xcc,	0x2
	fbe	%fcc0,	loop_1753
loop_1753:
	tle	%xcc,	0x3
	bn,a,pt	%xcc,	loop_1754
loop_1754:
	brnz	%l2,	loop_1755
loop_1755:
	fmovrslz	%i2,	%f4,	%f3
	bvc,pn	%xcc,	loop_1756
loop_1756:
	bcs,a	%icc,	loop_1757
loop_1757:
	fbul,a	%fcc1,	loop_1758
loop_1758:
	fpadd16	%f10,	%f12,	%f14
	nop
	setx loop_1759, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1759:
	bvc,a	%xcc,	loop_1760
loop_1760:
	fzeros	%f6
	xor	%l5,	%o4,	%o2
	subc	%g5,	0x1A30,	%o7
	bvc,a	loop_1761
loop_1761:
	fcmps	%fcc2,	%f1,	%f11
	fandnot1	%f12,	%f0,	%f2
	fmovrsgez	%l6,	%f10,	%f10
	bpos	loop_1762
loop_1762:
	bpos	%icc,	loop_1763
loop_1763:
	fmovrslez	%o0,	%f14,	%f3
	stx	%l1,	[%l7 + 0x28]
	brgez	%o5,	loop_1764
loop_1764:
	fmovsn	%xcc,	%f1,	%f2
	brgez	%o6,	loop_1765
loop_1765:
	fandnot1s	%f10,	%f12,	%f1
	fpadd32s	%f15,	%f15,	%f12
	fpack16	%f4,	%f9
	bpos,a	loop_1766
loop_1766:
	nop
	setx loop_1767, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1767:
	ldub	[%l7 + 0x65],	%i4
	fmovdge	%xcc,	%f0,	%f15
	fmovda	%xcc,	%f0,	%f9
	fbule,a	%fcc2,	loop_1768
loop_1768:
	brz,a	%l4,	loop_1769
loop_1769:
	bvs,a	%icc,	loop_1770
loop_1770:
	fnors	%f13,	%f0,	%f1
	fabss	%f12,	%f9
	fmovrdgz	%o3,	%f12,	%f4
	bge,pn	%icc,	loop_1771
loop_1771:
	fbule	%fcc3,	loop_1772
loop_1772:
	ldub	[%l7 + 0x0E],	%i0
	fmovrdlz	%g2,	%f12,	%f4
	fsrc2s	%f9,	%f5
	fpsub16s	%f0,	%f2,	%f9
	bvs,a	%xcc,	loop_1773
loop_1773:
	fbne,a	%fcc1,	loop_1774
loop_1774:
	fmovrdne	%g3,	%f6,	%f12
	fcmpeq16	%f10,	%f2,	%i5
	fnot1	%f10,	%f10
	bneg,pt	%icc,	loop_1775
loop_1775:
	fexpand	%f4,	%f10
	bshuffle	%f6,	%f14,	%f4
	edge8n	%g6,	%o1,	%g4
	fxors	%f11,	%f2,	%f0
	brnz,a	%i3,	loop_1776
loop_1776:
	fmovse	%xcc,	%f1,	%f9
	brlz,a	%l3,	loop_1777
loop_1777:
	brgez,a	%i6,	loop_1778
loop_1778:
	fbo	%fcc1,	loop_1779
loop_1779:
	ldsw	[%l7 + 0x50],	%g1
	fcmpeq16	%f10,	%f6,	%l0
	ldsb	[%l7 + 0x2E],	%g7
	tneg	%icc,	0x1
	fmovdneg	%xcc,	%f5,	%f2
	brlz	%i7,	loop_1780
loop_1780:
	fmovrdgez	%i1,	%f0,	%f12
	fmovrslz	%l2,	%f1,	%f12
	siam	0x3
	fbu,a	%fcc3,	loop_1781
loop_1781:
	edge16n	%i2,	%l5,	%o2
	fornot2s	%f4,	%f13,	%f7
	be,pn	%xcc,	loop_1782
loop_1782:
	fbue,a	%fcc0,	loop_1783
loop_1783:
	siam	0x5
	ldd	[%l7 + 0x40],	%f12
	bcs	loop_1784
loop_1784:
	stw	%o4,	[%l7 + 0x38]
	bgu	loop_1785
loop_1785:
	fbul	%fcc0,	loop_1786
loop_1786:
	fbug,a	%fcc0,	loop_1787
loop_1787:
	fexpand	%f14,	%f14
	bl,a	%icc,	loop_1788
loop_1788:
	bgu,a	loop_1789
loop_1789:
	fpsub16s	%f6,	%f12,	%f15
	fandnot1s	%f13,	%f11,	%f12
	fbu	%fcc1,	loop_1790
loop_1790:
	fbl,a	%fcc0,	loop_1791
loop_1791:
	bl	loop_1792
loop_1792:
	nop
	setx loop_1793, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1793:
	fba	%fcc0,	loop_1794
loop_1794:
	fpmerge	%f13,	%f7,	%f8
	fbug,a	%fcc0,	loop_1795
loop_1795:
	fpadd32s	%f1,	%f4,	%f0
	fones	%f2
	fand	%f2,	%f6,	%f6
	brgez	%g5,	loop_1796
loop_1796:
	fone	%f2
	fzeros	%f12
	fxnors	%f6,	%f11,	%f11
	fmovscc	%xcc,	%f2,	%f11
	fmovrsgez	%l6,	%f14,	%f12
	fpadd16s	%f7,	%f9,	%f13
	bvc	loop_1797
loop_1797:
	brz,a	%o0,	loop_1798
loop_1798:
	fmovsg	%icc,	%f6,	%f9
	brlz	%o7,	loop_1799
loop_1799:
	fmovrdgz	%l1,	%f6,	%f12
	fbo	%fcc2,	loop_1800
loop_1800:
	stw	%o5,	[%l7 + 0x14]
	nop
	setx loop_1801, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1801:
	be,a	%xcc,	loop_1802
loop_1802:
	fnegd	%f14,	%f0
	ldx	[%l7 + 0x58],	%o6
	lduw	[%l7 + 0x54],	%l4
	fcmpes	%fcc3,	%f15,	%f5
	fand	%f2,	%f12,	%f10
	fmovdvc	%xcc,	%f3,	%f12
	fmul8x16al	%f8,	%f3,	%f12
	fcmpgt16	%f12,	%f10,	%o3
	ld	[%l7 + 0x2C],	%f6
	bleu,a,pn	%xcc,	loop_1803
loop_1803:
	ble,a,pn	%xcc,	loop_1804
loop_1804:
	fpack16	%f4,	%f2
	fbl	%fcc2,	loop_1805
loop_1805:
	bneg,pn	%xcc,	loop_1806
loop_1806:
	nop
	setx loop_1807, %l0, %l1
	jmpl %l1, %i4
loop_1807:
	fbl	%fcc0,	loop_1808
loop_1808:
	ldd	[%l7 + 0x50],	%f14
	fmovspos	%xcc,	%f13,	%f13
	srl	%i0,	0x02,	%g3
	fble,a	%fcc3,	loop_1809
loop_1809:
	ldd	[%l7 + 0x60],	%f8
	brgez,a	%g2,	loop_1810
loop_1810:
	bleu,pt	%xcc,	loop_1811
loop_1811:
	bge	%xcc,	loop_1812
loop_1812:
	fcmpgt16	%f6,	%f8,	%i5
	fmovsl	%xcc,	%f15,	%f13
	fmovdleu	%xcc,	%f3,	%f5
	fbue	%fcc3,	loop_1813
loop_1813:
	nop
	setx loop_1814, %l0, %l1
	jmpl %l1, %o1
loop_1814:
	bneg,a,pt	%icc,	loop_1815
loop_1815:
	fmovrslez	%g6,	%f4,	%f4
	fmovspos	%icc,	%f10,	%f8
	nop
	setx loop_1816, %l0, %l1
	jmpl %l1, %i3
loop_1816:
	fnands	%f9,	%f10,	%f15
	bl,a	loop_1817
loop_1817:
	fnot1s	%f14,	%f7
	fbne,a	%fcc0,	loop_1818
loop_1818:
	fnegs	%f14,	%f5
	fcmple16	%f14,	%f6,	%l3
	brgez,a	%i6,	loop_1819
loop_1819:
	fbge,a	%fcc0,	loop_1820
loop_1820:
	bneg	%icc,	loop_1821
loop_1821:
	fmovrdgz	%g4,	%f14,	%f12
	fcmps	%fcc1,	%f5,	%f15
	fbne	%fcc0,	loop_1822
loop_1822:
	fbuge	%fcc1,	loop_1823
loop_1823:
	fbue,a	%fcc2,	loop_1824
loop_1824:
	ba,a	%icc,	loop_1825
loop_1825:
	fbne	%fcc2,	loop_1826
loop_1826:
	fcmpne16	%f6,	%f6,	%l0
	fmovdl	%xcc,	%f8,	%f8
	fbug	%fcc1,	loop_1827
loop_1827:
	ble,pn	%xcc,	loop_1828
loop_1828:
	fbue	%fcc3,	loop_1829
loop_1829:
	fmovdg	%icc,	%f3,	%f11
	ld	[%l7 + 0x3C],	%f12
	fpmerge	%f9,	%f11,	%f12
	fmovdge	%xcc,	%f10,	%f10
	nop
	setx loop_1830, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1830:
	fmovrdgez	%g7,	%f0,	%f14
	stw	%i7,	[%l7 + 0x5C]
	nop
	setx loop_1831, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1831:
	fxor	%f4,	%f0,	%f14
	bg,a,pn	%icc,	loop_1832
loop_1832:
	fnot1	%f12,	%f14
	fornot2s	%f4,	%f10,	%f6
	fmovrdlez	%g1,	%f0,	%f2
	fbge,a	%fcc0,	loop_1833
loop_1833:
	bge,pt	%icc,	loop_1834
loop_1834:
	fbne,a	%fcc3,	loop_1835
loop_1835:
	edge8ln	%l2,	%i1,	%l5
	fmovsle	%xcc,	%f0,	%f1
	brz	%i2,	loop_1836
loop_1836:
	faligndata	%f12,	%f10,	%f14
	fand	%f10,	%f12,	%f4
	bg,a	loop_1837
loop_1837:
	fpadd32	%f2,	%f0,	%f8
	fmuld8ulx16	%f4,	%f11,	%f0
	fbe,a	%fcc2,	loop_1838
loop_1838:
	fbue,a	%fcc3,	loop_1839
loop_1839:
	call	loop_1840
loop_1840:
	edge16n	%o4,	%g5,	%o2
	bshuffle	%f8,	%f14,	%f0
	fbo,a	%fcc2,	loop_1841
loop_1841:
	bne,pt	%xcc,	loop_1842
loop_1842:
	fmovsne	%xcc,	%f13,	%f2
	fbg,a	%fcc0,	loop_1843
loop_1843:
	fble	%fcc3,	loop_1844
loop_1844:
	fmovsa	%icc,	%f11,	%f8
	bneg	%xcc,	loop_1845
loop_1845:
	fpadd16s	%f0,	%f11,	%f0
	fmovdge	%icc,	%f8,	%f6
	stx	%l6,	[%l7 + 0x68]
	bne,a	loop_1846
loop_1846:
	sra	%o0,	%o7,	%o5
	ble,pt	%xcc,	loop_1847
loop_1847:
	fbu,a	%fcc0,	loop_1848
loop_1848:
	fble,a	%fcc0,	loop_1849
loop_1849:
	ldub	[%l7 + 0x72],	%l1
	fmovscc	%icc,	%f7,	%f3
	orn	%l4,	%o6,	%o3
	udivx	%i0,	0x07C2,	%g3
	fbug	%fcc1,	loop_1850
loop_1850:
	fmuld8ulx16	%f1,	%f15,	%f2
	fmovscc	%xcc,	%f11,	%f0
	fmovdcc	%xcc,	%f1,	%f10
	fba,a	%fcc2,	loop_1851
loop_1851:
	fbuge	%fcc1,	loop_1852
loop_1852:
	fxors	%f10,	%f15,	%f7
	nop
	setx loop_1853, %l0, %l1
	jmpl %l1, %g2
loop_1853:
	fbug	%fcc2,	loop_1854
loop_1854:
	bneg,pt	%icc,	loop_1855
loop_1855:
	fbn	%fcc3,	loop_1856
loop_1856:
	bshuffle	%f4,	%f6,	%f2
	fcmps	%fcc0,	%f9,	%f3
	brz,a	%i4,	loop_1857
loop_1857:
	fmovdneg	%xcc,	%f14,	%f0
	bvs,a	%xcc,	loop_1858
loop_1858:
	bg,a,pt	%icc,	loop_1859
loop_1859:
	bleu	%icc,	loop_1860
loop_1860:
	ble	loop_1861
loop_1861:
	bge,pt	%xcc,	loop_1862
loop_1862:
	brlez,a	%i5,	loop_1863
loop_1863:
	fbule,a	%fcc3,	loop_1864
loop_1864:
	ldsw	[%l7 + 0x60],	%g6
	fmovse	%xcc,	%f3,	%f7
	fsrc1	%f0,	%f12
	ble,a	%icc,	loop_1865
loop_1865:
	fbe,a	%fcc0,	loop_1866
loop_1866:
	fbue,a	%fcc3,	loop_1867
loop_1867:
	fcmpgt32	%f4,	%f0,	%o1
	st	%f5,	[%l7 + 0x20]
	nop
	setx loop_1868, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1868:
	fblg,a	%fcc1,	loop_1869
loop_1869:
	fnot2	%f2,	%f2
	fmuld8ulx16	%f11,	%f0,	%f10
	siam	0x5
	bcs,a,pn	%xcc,	loop_1870
loop_1870:
	bge,pn	%xcc,	loop_1871
loop_1871:
	fcmpne16	%f2,	%f8,	%l3
	fbug	%fcc2,	loop_1872
loop_1872:
	brnz	%i3,	loop_1873
loop_1873:
	fmovdg	%xcc,	%f7,	%f10
	fzero	%f2
	fba,a	%fcc0,	loop_1874
loop_1874:
	nop
	setx loop_1875, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1875:
	edge16ln	%i6,	%l0,	%g7
	fmovdg	%xcc,	%f2,	%f0
	bleu,pn	%xcc,	loop_1876
loop_1876:
	fmovrse	%g4,	%f12,	%f2
	bleu,pn	%icc,	loop_1877
loop_1877:
	stb	%i7,	[%l7 + 0x2D]
	ba,a,pt	%icc,	loop_1878
loop_1878:
	fmuld8ulx16	%f9,	%f2,	%f6
	be,a,pt	%icc,	loop_1879
loop_1879:
	fnors	%f5,	%f10,	%f14
	tcc	%icc,	0x4
	fbl,a	%fcc3,	loop_1880
loop_1880:
	st	%f14,	[%l7 + 0x40]
	bgu,pt	%xcc,	loop_1881
loop_1881:
	udivx	%g1,	0x16FE,	%l2
	fmul8sux16	%f12,	%f12,	%f2
	bleu	loop_1882
loop_1882:
	fxors	%f4,	%f4,	%f4
	fmul8sux16	%f2,	%f4,	%f4
	fcmpne16	%f12,	%f12,	%l5
	nop
	setx loop_1883, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1883:
	fcmple16	%f12,	%f8,	%i1
	sth	%o4,	[%l7 + 0x46]
	bneg,pn	%icc,	loop_1884
loop_1884:
	brlez	%i2,	loop_1885
loop_1885:
	fmovscs	%icc,	%f12,	%f9
	fmul8ulx16	%f6,	%f12,	%f10
	fmovdleu	%icc,	%f5,	%f9
	fbo,a	%fcc0,	loop_1886
loop_1886:
	bcc,a,pt	%xcc,	loop_1887
loop_1887:
	ble,a	loop_1888
loop_1888:
	be,pn	%icc,	loop_1889
loop_1889:
	fbo,a	%fcc0,	loop_1890
loop_1890:
	bvs,pn	%icc,	loop_1891
loop_1891:
	lduh	[%l7 + 0x4E],	%o2
	brnz	%l6,	loop_1892
loop_1892:
	nop
	setx loop_1893, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1893:
	fbne,a	%fcc3,	loop_1894
loop_1894:
	fmovrslez	%g5,	%f7,	%f9
	bge,a,pn	%xcc,	loop_1895
loop_1895:
	bvc	%icc,	loop_1896
loop_1896:
	for	%f14,	%f0,	%f6
	fmovrdlez	%o0,	%f2,	%f8
	sth	%o5,	[%l7 + 0x0E]
	bn,pt	%xcc,	loop_1897
loop_1897:
	ba,a,pt	%icc,	loop_1898
loop_1898:
	fpmerge	%f3,	%f7,	%f4
	fcmpgt16	%f0,	%f12,	%o7
	sllx	%l4,	0x17,	%o6
	ldub	[%l7 + 0x53],	%l1
	fmovs	%f13,	%f7
	nop
	setx loop_1899, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	done
loop_1899:
	fcmpgt16	%f8,	%f12,	%o3
	fble,a	%fcc2,	loop_1900
loop_1900:
	bge,a	%icc,	loop_1901
loop_1901:
	pdist	%f8,	%f10,	%f2
	fbn,a	%fcc0,	loop_1902
loop_1902:
	nop
	setx loop_1903, %l0, %l1
	wrpr 0x1, %tl
	wrpr %l1, %tpc
	add %l1, 0x4, %l1
	wrpr %l1, %tnpc
	setx 0x34400001400, %l0, %l1
	wrpr %l1, %tstate
	wrhpr 0x4, %htstate
	retry
loop_1903:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type f   	: 425
!	Type i   	: 43
!	Type cti   	: 450
!	Type l   	: 82
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xA4D7215B
.word 0x142F9186
.word 0x153A32ED
.word 0xBD671696
.word 0xC9AEF198
.word 0x4E2822D6
.word 0x4C7DF277
.word 0x6201859F
.word 0x03B3C8E7
.word 0x0656A210
.word 0xEF575DB2
.word 0x412A20FC
.word 0x9E99B450
.word 0xF2E320A7
.word 0x861EBB38
.word 0xF0EC3533
.word 0x1698A3B5
.word 0x5DAB0876
.word 0x7F5E4412
.word 0x65097C8A
.word 0xEF3802CD
.word 0x4FE6FDB5
.word 0xFD84F3EF
.word 0x9F105737
.word 0xCEEE5FE1
.word 0xBB135FCA
.word 0xB36A3252
.word 0xC9136498
.word 0xECBEB9E5
.word 0xE0FFAA61
.word 0x3DF9F5DC
.word 0x83CAD5C1
.word 0x43A83313
.word 0x63DB6C5E
.word 0x8D2520AE
.word 0x3B12C66F
.word 0x648F8DC2
.word 0x6B4DD2DE
.word 0x7D8F09B1
.word 0x2DB8D1A4
.word 0x9A1494AC
.word 0x7E783A6D
.word 0x7A6B9F39
.word 0x4E5A9089
.word 0x35DB4098
.word 0x6F50656E
.word 0x171D06B8
.word 0xB4C9D9E8
.word 0xBA34D2FC
.word 0xA270240D
.word 0xFE17F275
.word 0x67C08189
.word 0x733D48B2
.word 0x54EDE5C2
.word 0x483782D9
.word 0x69098857
.word 0x5C106864
.word 0x3D950CB0
.word 0x7A49FBAF
.word 0x1F0AAF27
.word 0xA5848994
.word 0x178B5F75
.word 0xAF37FA65
.word 0x22B9251B
.end
