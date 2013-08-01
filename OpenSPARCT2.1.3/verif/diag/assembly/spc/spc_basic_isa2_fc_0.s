/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_basic_isa2_fc_0.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ jk1 FOCUS_SEED=709814444"
.ident "BY jb140515 ON Thu Jun 19 16:28:43 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: spc_basic_isa2_fc_0.s,v 1.3 2007/07/05 22:02:03 drp Exp $"
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
	mov	%o1, %l7
	umul	%l7, 256, %l7


	!# Initialize registers ..

	!# Global registers
	set	0xB,	%g1
	set	0x5,	%g2
	set	0x7,	%g3
	set	0xE,	%g4
	set	0x7,	%g5
	set	0xB,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xC,	%i1
	set	-0x8,	%i2
	set	-0xF,	%i3
	set	-0x1,	%i4
	set	-0xB,	%i5
	set	-0x4,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x08538AD0,	%l0
	set	0x07398F35,	%l1
	set	0x4B289E70,	%l2
	set	0x0004A8EF,	%l3
	set	0x7750ABA7,	%l4
	set	0x0E460AC4,	%l5
	set	0x7AA8D017,	%l6
	!# Output registers
	set	0x170F,	%o0
	set	0x14E1,	%o1
	set	0x1B1D,	%o2
	set	-0x0859,	%o3
	set	0x0DF7,	%o4
	set	-0x112E,	%o5
	set	0x1988,	%o6
	set	-0x0D3D,	%o7

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

	srl	%i2,	0x06,	%i4
	sth	%l5,	[%l7 + 0x08]
	bleu	loop_1
	fmul8x16al	%f2,	%f13,	%f2
	orn	%i3,	0x0FE7,	%o1
	fmovsvc	%icc,	%f2,	%f0
loop_1:
	fandnot2s	%f1,	%f5,	%f11
	fnot2s	%f1,	%f3
	bne,a	loop_2
	edge32	%g5,	%o5,	%g4
	and	%l2,	0x04F4,	%l6
	lduw	[%l7 + 0x34],	%l4
loop_2:
	ldsb	[%l7 + 0x26],	%i0
	fmovscc	%xcc,	%f10,	%f10
	bg,a	%xcc,	loop_3
	st	%f11,	[%l7 + 0x6C]
	bgu,a,pn	%icc,	loop_4
	movl	%icc,	%o4,	%l1
loop_3:
	xnor	%o0,	0x16A9,	%g1
	subcc	%o3,	0x00AC,	%i7
loop_4:
	fmovdvc	%xcc,	%f2,	%f11
	fmovrse	%l0,	%f6,	%f2
	std	%f8,	[%l7 + 0x40]
	fpadd32	%f6,	%f2,	%f14
	alignaddr	%i1,	%g6,	%l3
	stx	%o2,	[%l7 + 0x08]
	ldx	[%l7 + 0x10],	%g7
	bvs,pt	%xcc,	loop_5
	stw	%o6,	[%l7 + 0x58]
	fzero	%f4
	fors	%f5,	%f14,	%f11
loop_5:
	fzero	%f0
	lduh	[%l7 + 0x64],	%g2
	orcc	%o7,	0x143E,	%i6
	brlz,a	%g3,	loop_6
	bpos,a,pn	%xcc,	loop_7
	edge32l	%i2,	%i5,	%i4
	fba,a	%fcc3,	loop_8
loop_6:
	movrlez	%i3,	0x151,	%l5
loop_7:
	fornot2s	%f6,	%f9,	%f12
	fmovsa	%icc,	%f7,	%f3
loop_8:
	ldsh	[%l7 + 0x08],	%g5
	fxnor	%f10,	%f2,	%f2
	fblg	%fcc1,	loop_9
	movgu	%icc,	%o1,	%o5
	sethi	0x0998,	%g4
	set  0x0, %l0
	setx loop_10, %l0, %l1
	jmpl %l1, %l6
loop_9:
	fmovdl	%icc,	%f14,	%f13
	fpackfix	%f4,	%f11
	edge8l	%l4,	%l2,	%o4
loop_10:
	movneg	%xcc,	%l1,	%i0
	fpadd32	%f12,	%f10,	%f8
	fbug,a	%fcc2,	loop_11
	brlez,a	%o0,	loop_12
	fpsub16s	%f6,	%f9,	%f14
	edge8	%o3,	%i7,	%l0
loop_11:
	bcs	loop_13
loop_12:
	fabss	%f15,	%f10
	fbe	%fcc1,	loop_14
	brgz	%g1,	loop_15
loop_13:
	fxor	%f14,	%f8,	%f8
	fbul	%fcc1,	loop_16
loop_14:
	ldub	[%l7 + 0x6A],	%i1
loop_15:
	udivcc	%g6,	0x0782,	%o2
	fmovd	%f12,	%f2
loop_16:
	srl	%g7,	0x10,	%o6
	stw	%l3,	[%l7 + 0x58]
	fmul8x16au	%f15,	%f12,	%f2
	fbl,a	%fcc2,	loop_17
	sth	%g2,	[%l7 + 0x5E]
	stb	%i6,	[%l7 + 0x5A]
	lduh	[%l7 + 0x64],	%g3
loop_17:
	stw	%i2,	[%l7 + 0x78]
	movge	%icc,	%o7,	%i4
	bn	loop_18
	fba	%fcc2,	loop_19
	fmovse	%xcc,	%f6,	%f15
	mulx	%i5,	%l5,	%g5
loop_18:
	fmovdleu	%xcc,	%f9,	%f4
loop_19:
	fpadd32s	%f11,	%f4,	%f11
	bleu,a	%xcc,	loop_20
	brlez	%o1,	loop_21
	fmovsne	%icc,	%f15,	%f11
	fmovspos	%icc,	%f11,	%f10
loop_20:
	edge16l	%o5,	%g4,	%i3
loop_21:
	movrlz	%l6,	%l4,	%o4
	sub	%l1,	%l2,	%i0
	lduw	[%l7 + 0x08],	%o0
	fmovrslez	%o3,	%f10,	%f4
	fbn,a	%fcc0,	loop_22
	fnot1	%f4,	%f0
	fnot1s	%f11,	%f4
	fmovsgu	%icc,	%f15,	%f13
loop_22:
	fbug,a	%fcc2,	loop_23
	fabsd	%f10,	%f4
	smul	%l0,	%g1,	%i1
	ldsh	[%l7 + 0x74],	%i7
loop_23:
	bne,a,pt	%icc,	loop_24
	stx	%o2,	[%l7 + 0x10]
	stw	%g7,	[%l7 + 0x6C]
	fmovsleu	%xcc,	%f13,	%f12
loop_24:
	ldub	[%l7 + 0x5F],	%o6
	fbl,a	%fcc1,	loop_25
	fnors	%f14,	%f10,	%f13
	fxnor	%f0,	%f10,	%f8
	orncc	%l3,	0x1815,	%g6
loop_25:
	fmovscs	%icc,	%f13,	%f8
	brlz	%i6,	loop_26
	fbule	%fcc0,	loop_27
	movleu	%icc,	%g3,	%g2
	bpos	%icc,	loop_28
loop_26:
	brgz	%i2,	loop_29
loop_27:
	fmovsneg	%icc,	%f15,	%f10
	fmovsvs	%xcc,	%f15,	%f3
loop_28:
	fbn	%fcc3,	loop_30
loop_29:
	st	%f6,	[%l7 + 0x58]
	fmovrde	%i4,	%f10,	%f2
	fble,a	%fcc1,	loop_31
loop_30:
	xnor	%o7,	0x0025,	%i5
	stw	%g5,	[%l7 + 0x40]
	edge8l	%o1,	%o5,	%g4
loop_31:
	ldsb	[%l7 + 0x58],	%l5
	bcs,a	%icc,	loop_32
	fbu	%fcc2,	loop_33
	fornot2	%f14,	%f4,	%f4
	bg,a	loop_34
loop_32:
	fpsub32	%f12,	%f2,	%f0
loop_33:
	ldx	[%l7 + 0x50],	%i3
	fnot1s	%f12,	%f1
loop_34:
	addc	%l6,	0x119B,	%o4
	stb	%l1,	[%l7 + 0x48]
	sra	%l2,	0x0F,	%i0
	fble	%fcc0,	loop_35
	edge8n	%o0,	%l4,	%l0
	st	%f6,	[%l7 + 0x34]
	std	%f0,	[%l7 + 0x48]
loop_35:
	fmovrslz	%o3,	%f1,	%f2
	fbo,a	%fcc3,	loop_36
	fmovdle	%xcc,	%f13,	%f6
	fbuge,a	%fcc0,	loop_37
	for	%f6,	%f4,	%f2
loop_36:
	ldd	[%l7 + 0x60],	%f6
	fnot1s	%f6,	%f15
loop_37:
	edge8n	%g1,	%i1,	%o2
	stx	%g7,	[%l7 + 0x30]
	fbul	%fcc0,	loop_38
	fones	%f15
	fbuge,a	%fcc1,	loop_39
	and	%i7,	%l3,	%g6
loop_38:
	ldsh	[%l7 + 0x10],	%o6
	stb	%g3,	[%l7 + 0x79]
loop_39:
	fbo	%fcc2,	loop_40
	fbu,a	%fcc2,	loop_41
	fpadd16	%f12,	%f12,	%f0
	fcmpne16	%f0,	%f12,	%g2
loop_40:
	fble	%fcc2,	loop_42
loop_41:
	fxors	%f1,	%f7,	%f3
	udiv	%i6,	0x165B,	%i4
	bcc,a	%xcc,	loop_43
loop_42:
	stx	%o7,	[%l7 + 0x18]
	subccc	%i2,	%i5,	%o1
	fbo,a	%fcc3,	loop_44
loop_43:
	orn	%g5,	0x0C5A,	%o5
	bg	loop_45
	fmovdne	%xcc,	%f1,	%f1
loop_44:
	brlez	%l5,	loop_46
	edge32ln	%i3,	%g4,	%o4
loop_45:
	fmovsgu	%icc,	%f2,	%f3
	movg	%xcc,	%l6,	%l1
loop_46:
	mulscc	%l2,	0x0BDC,	%i0
	fsrc1	%f2,	%f12
	stx	%l4,	[%l7 + 0x58]
	bvc,a	%icc,	loop_47
	fmovsge	%icc,	%f11,	%f7
	ldub	[%l7 + 0x0F],	%l0
	alignaddrl	%o0,	%g1,	%i1
loop_47:
	fmovspos	%xcc,	%f4,	%f12
	fnot2s	%f1,	%f11
	umul	%o2,	0x016D,	%g7
	bn,a,pn	%xcc,	loop_48
	fmovscc	%xcc,	%f11,	%f7
	movcs	%xcc,	%i7,	%l3
	bn,a,pn	%xcc,	loop_49
loop_48:
	fmovrdgz	%o3,	%f14,	%f0
	fmovsne	%icc,	%f12,	%f14
	fmovd	%f0,	%f14
loop_49:
	fbn	%fcc0,	loop_50
	fzero	%f6
	ldsh	[%l7 + 0x6E],	%o6
	stb	%g3,	[%l7 + 0x47]
loop_50:
	ld	[%l7 + 0x50],	%f6
	ld	[%l7 + 0x68],	%f13
	stw	%g2,	[%l7 + 0x58]
	brgz	%i6,	loop_51
	edge8ln	%g6,	%i4,	%o7
	movre	%i5,	0x0AF,	%o1
	fmovdvs	%xcc,	%f7,	%f8
loop_51:
	stw	%i2,	[%l7 + 0x40]
	bvc,a	%xcc,	loop_52
	sth	%g5,	[%l7 + 0x3E]
	andcc	%l5,	%i3,	%g4
	ba,pn	%icc,	loop_53
loop_52:
	orncc	%o4,	%o5,	%l6
	lduw	[%l7 + 0x34],	%l1
	fbug,a	%fcc3,	loop_54
loop_53:
	ldx	[%l7 + 0x08],	%i0
	bcs	%xcc,	loop_55
	fpadd16	%f14,	%f6,	%f2
loop_54:
	lduw	[%l7 + 0x68],	%l4
	fbg,a	%fcc3,	loop_56
loop_55:
	fmovrsgz	%l2,	%f6,	%f4
	fmovrsgez	%l0,	%f9,	%f15
	bgu,a	loop_57
loop_56:
	ld	[%l7 + 0x60],	%f12
	ldsw	[%l7 + 0x6C],	%o0
	fxor	%f10,	%f12,	%f2
loop_57:
	stb	%g1,	[%l7 + 0x6B]
	brgez,a	%i1,	loop_58
	ldsh	[%l7 + 0x3C],	%g7
	fbue,a	%fcc0,	loop_59
	fbuge,a	%fcc3,	loop_60
loop_58:
	bn	%icc,	loop_61
	ldd	[%l7 + 0x10],	%f4
loop_59:
	fmovrde	%o2,	%f6,	%f6
loop_60:
	fornot2s	%f11,	%f1,	%f15
loop_61:
	fandnot1	%f8,	%f14,	%f8
	movpos	%xcc,	%l3,	%o3
	fmovsl	%icc,	%f11,	%f1
	fmovrslz	%i7,	%f14,	%f11
	fnands	%f7,	%f14,	%f0
	std	%f14,	[%l7 + 0x50]
	ldsh	[%l7 + 0x70],	%g3
	fmovdcs	%xcc,	%f6,	%f14
	for	%f8,	%f4,	%f2
	fmovdn	%icc,	%f11,	%f13
	fornot1s	%f13,	%f9,	%f1
	ldsb	[%l7 + 0x27],	%o6
	subccc	%i6,	%g2,	%g6
	ldsh	[%l7 + 0x62],	%i4
	fbule,a	%fcc0,	loop_62
	fblg	%fcc3,	loop_63
	fmovdcs	%xcc,	%f3,	%f6
	fmovsvs	%icc,	%f2,	%f0
loop_62:
	fsrc2s	%f14,	%f1
loop_63:
	ldsb	[%l7 + 0x20],	%i5
	movrne	%o1,	%i2,	%o7
	edge32ln	%g5,	%l5,	%g4
	fone	%f2
	lduw	[%l7 + 0x5C],	%i3
	ldd	[%l7 + 0x40],	%f4
	umul	%o5,	%o4,	%l6
	fbne	%fcc1,	loop_64
	ldsb	[%l7 + 0x54],	%i0
	bcs,a	%xcc,	loop_65
	fandnot2s	%f12,	%f15,	%f1
loop_64:
	ldd	[%l7 + 0x48],	%f10
	fbo,a	%fcc1,	loop_66
loop_65:
	ba,a,pt	%xcc,	loop_67
	bn	loop_68
	fmuld8sux16	%f0,	%f2,	%f8
loop_66:
	fbn	%fcc1,	loop_69
loop_67:
	orncc	%l4,	%l1,	%l2
loop_68:
	fbu	%fcc0,	loop_70
	movle	%xcc,	%o0,	%l0
loop_69:
	fbo,a	%fcc2,	loop_71
	fpadd32	%f6,	%f10,	%f4
loop_70:
	fmovrsgez	%g1,	%f12,	%f6
	fmovse	%xcc,	%f5,	%f3
loop_71:
	ldsb	[%l7 + 0x7F],	%g7
	fandnot2	%f0,	%f8,	%f6
	faligndata	%f4,	%f12,	%f12
	sth	%i1,	[%l7 + 0x46]
	fcmpgt32	%f8,	%f0,	%o2
	movle	%xcc,	%o3,	%l3
	fpack32	%f6,	%f4,	%f12
	fmovspos	%icc,	%f4,	%f1
	fmovsg	%icc,	%f11,	%f10
	brlez	%i7,	loop_72
	call	loop_73
	ld	[%l7 + 0x44],	%f5
	ld	[%l7 + 0x34],	%f11
loop_72:
	fmul8x16al	%f7,	%f15,	%f8
loop_73:
	fsrc1s	%f5,	%f2
	fbule	%fcc3,	loop_74
	fsrc1	%f0,	%f0
	fabss	%f8,	%f9
	andncc	%o6,	%g3,	%g2
loop_74:
	fmovsa	%icc,	%f3,	%f15
	ba,a,pn	%xcc,	loop_75
	brnz	%g6,	loop_76
	fxnor	%f14,	%f8,	%f10
	umulcc	%i4,	0x1AC6,	%i5
loop_75:
	lduh	[%l7 + 0x32],	%o1
loop_76:
	bl	%xcc,	loop_77
	lduw	[%l7 + 0x48],	%i2
	ble	loop_78
	bleu,a	%xcc,	loop_79
loop_77:
	ldsw	[%l7 + 0x70],	%o7
	fmovrde	%g5,	%f4,	%f12
loop_78:
	std	%f2,	[%l7 + 0x10]
loop_79:
	fpack16	%f2,	%f12
	fxor	%f0,	%f12,	%f4
	ldsh	[%l7 + 0x4E],	%l5
	fpsub16s	%f2,	%f1,	%f15
	fornot2	%f0,	%f8,	%f8
	ld	[%l7 + 0x24],	%f5
	stx	%g4,	[%l7 + 0x50]
	bne,a	loop_80
	fcmpes	%fcc3,	%f9,	%f12
	brgez	%i6,	loop_81
	fmovrsgz	%o5,	%f1,	%f12
loop_80:
	ldx	[%l7 + 0x20],	%i3
	fmovsleu	%xcc,	%f14,	%f14
loop_81:
	brlez,a	%o4,	loop_82
	fmul8x16	%f4,	%f12,	%f14
	edge16n	%l6,	%l4,	%l1
	fmovsn	%icc,	%f15,	%f8
loop_82:
	fcmple16	%f2,	%f6,	%l2
	brlez	%i0,	loop_83
	ld	[%l7 + 0x68],	%f9
	fmuld8ulx16	%f5,	%f12,	%f14
	movneg	%icc,	%o0,	%g1
loop_83:
	bge,pn	%icc,	loop_84
	ldub	[%l7 + 0x7C],	%l0
	bn,a,pn	%xcc,	loop_85
	fpsub32s	%f8,	%f9,	%f14
loop_84:
	fpadd16s	%f4,	%f14,	%f3
	edge8n	%i1,	%o2,	%o3
loop_85:
	fba	%fcc2,	loop_86
	stb	%g7,	[%l7 + 0x15]
	fble,a	%fcc1,	loop_87
	sth	%i7,	[%l7 + 0x38]
loop_86:
	fbn	%fcc3,	loop_88
	bge,pn	%icc,	loop_89
loop_87:
	edge8ln	%o6,	%l3,	%g2
	fmovs	%f11,	%f0
loop_88:
	fbne	%fcc0,	loop_90
loop_89:
	brz,a	%g3,	loop_91
	stw	%i4,	[%l7 + 0x50]
	set  0x0, %l0
	setx loop_92, %l0, %l1
	jmpl %l1, %i5
loop_90:
	edge8ln	%g6,	%o1,	%o7
loop_91:
	movg	%icc,	%i2,	%l5
	orcc	%g4,	0x062B,	%i6
loop_92:
	fpackfix	%f2,	%f15
	fmovsvc	%xcc,	%f13,	%f1
	alignaddrl	%g5,	%o5,	%i3
	fpadd32	%f12,	%f4,	%f2
	edge8n	%o4,	%l6,	%l4
	ldsb	[%l7 + 0x29],	%l1
	stw	%i0,	[%l7 + 0x2C]
	alignaddrl	%o0,	%l2,	%g1
	movrlez	%l0,	0x136,	%o2
	ba,a	loop_93
	fbge,a	%fcc3,	loop_94
	bge,a	loop_95
	edge8n	%i1,	%g7,	%i7
loop_93:
	bpos	%xcc,	loop_96
loop_94:
	ldsh	[%l7 + 0x7E],	%o6
loop_95:
	fmuld8ulx16	%f12,	%f12,	%f6
	ble,a	%icc,	loop_97
loop_96:
	bcc	loop_98
	brnz,a	%l3,	loop_99
	stx	%g2,	[%l7 + 0x38]
loop_97:
	fpadd16	%f14,	%f4,	%f2
loop_98:
	udiv	%g3,	0x15A7,	%o3
loop_99:
	ldub	[%l7 + 0x27],	%i4
	fmovrdgez	%i5,	%f8,	%f4
	move	%icc,	%o1,	%g6
	bge,pt	%icc,	loop_100
	stw	%o7,	[%l7 + 0x14]
	sth	%i2,	[%l7 + 0x0E]
	fmovdl	%xcc,	%f3,	%f10
loop_100:
	fmovdcc	%xcc,	%f11,	%f12
	fornot2	%f10,	%f4,	%f12
	fbul,a	%fcc1,	loop_101
	fornot1	%f0,	%f14,	%f2
	bvs,a	loop_102
	fmovsleu	%icc,	%f12,	%f15
loop_101:
	edge8n	%l5,	%i6,	%g4
	fmovsleu	%icc,	%f13,	%f12
loop_102:
	fornot1s	%f15,	%f4,	%f13
	ldub	[%l7 + 0x6F],	%g5
	std	%f0,	[%l7 + 0x58]
	xnor	%o5,	%o4,	%l6
	orcc	%l4,	0x12A9,	%l1
	fnand	%f2,	%f8,	%f6
	fpack32	%f12,	%f12,	%f0
	alignaddr	%i0,	%i3,	%o0
	fnot1s	%f5,	%f2
	fcmpd	%fcc3,	%f12,	%f8
	umul	%g1,	0x1B7A,	%l2
	fcmpes	%fcc1,	%f8,	%f4
	fpsub16	%f14,	%f10,	%f0
	sethi	0x02E5,	%l0
	ldd	[%l7 + 0x18],	%f12
	fmovrslz	%i1,	%f9,	%f9
	fcmps	%fcc1,	%f9,	%f0
	subcc	%g7,	0x025D,	%o2
	fornot2s	%f3,	%f3,	%f9
	ldsw	[%l7 + 0x50],	%o6
	movgu	%icc,	%i7,	%g2
	fmovsn	%icc,	%f14,	%f13
	brlz,a	%g3,	loop_103
	ldub	[%l7 + 0x79],	%l3
	fblg	%fcc2,	loop_104
	fble,a	%fcc0,	loop_105
loop_103:
	fmovrslz	%o3,	%f5,	%f10
	edge32ln	%i4,	%i5,	%g6
loop_104:
	stw	%o7,	[%l7 + 0x78]
loop_105:
	fmovdcc	%xcc,	%f10,	%f4
	movrgz	%o1,	%i2,	%i6
	fsrc2	%f14,	%f4
	add	%g4,	%l5,	%o5
	add	%o4,	%l6,	%g5
	fornot1	%f2,	%f0,	%f6
	fmul8x16al	%f15,	%f8,	%f6
	fornot2	%f0,	%f12,	%f10
	fxnor	%f8,	%f2,	%f12
	umulcc	%l1,	0x0284,	%i0
	ldd	[%l7 + 0x20],	%f14
	st	%f12,	[%l7 + 0x38]
	orn	%l4,	%i3,	%o0
	movcs	%xcc,	%g1,	%l0
	sll	%l2,	%i1,	%g7
	subccc	%o2,	0x028A,	%i7
	fnot2s	%f7,	%f13
	sth	%o6,	[%l7 + 0x0C]
	fcmped	%fcc0,	%f14,	%f6
	sth	%g3,	[%l7 + 0x0A]
	udivcc	%g2,	0x1AA2,	%l3
	movneg	%icc,	%o3,	%i5
	ld	[%l7 + 0x60],	%f13
	fnot1s	%f12,	%f15
	fmovdne	%icc,	%f13,	%f13
	fcmpes	%fcc1,	%f13,	%f6
	fabss	%f13,	%f1
	bn,pn	%icc,	loop_106
	fcmpes	%fcc0,	%f8,	%f0
	fnands	%f13,	%f1,	%f8
	fmovsvs	%icc,	%f9,	%f9
loop_106:
	ble,a	loop_107
	fmovrde	%i4,	%f2,	%f8
	fnand	%f4,	%f12,	%f2
	ldx	[%l7 + 0x60],	%g6
loop_107:
	sll	%o7,	%o1,	%i6
	ldsw	[%l7 + 0x70],	%g4
	fmovdvs	%xcc,	%f8,	%f13
	st	%f5,	[%l7 + 0x74]
	fmovdg	%xcc,	%f15,	%f11
	movrlez	%l5,	%i2,	%o5
	fnegd	%f6,	%f4
	stb	%o4,	[%l7 + 0x4E]
	stb	%g5,	[%l7 + 0x4B]
	srax	%l6,	%i0,	%l4
	fmovsn	%icc,	%f13,	%f15
	xor	%i3,	%o0,	%l1
	fmovrdgz	%l0,	%f14,	%f4
	fmovsneg	%xcc,	%f11,	%f7
	st	%f6,	[%l7 + 0x20]
	sra	%g1,	%l2,	%i1
	smulcc	%g7,	%o2,	%o6
	fsrc1s	%f10,	%f6
	bgu,a,pn	%xcc,	loop_108
	popc	0x1EF7,	%i7
	fmovrdgez	%g2,	%f10,	%f6
	movrne	%l3,	0x0E7,	%g3
loop_108:
	lduw	[%l7 + 0x24],	%o3
	ba	%icc,	loop_109
	fbuge,a	%fcc0,	loop_110
	fpsub32s	%f2,	%f11,	%f10
	bcc,pn	%icc,	loop_111
loop_109:
	movvc	%xcc,	%i5,	%i4
loop_110:
	fmovdg	%xcc,	%f8,	%f9
	fmovrsne	%o7,	%f9,	%f7
loop_111:
	movle	%icc,	%o1,	%i6
	edge32n	%g6,	%l5,	%g4
	bcs,a,pt	%icc,	loop_112
	bcc,a	loop_113
	fornot1s	%f14,	%f15,	%f0
	fmovsg	%icc,	%f4,	%f0
loop_112:
	subc	%i2,	0x1AD6,	%o4
loop_113:
	fnor	%f8,	%f6,	%f8
	fmovde	%icc,	%f12,	%f10
	ld	[%l7 + 0x78],	%f4
	fsrc1	%f0,	%f2
	popc	0x12F5,	%g5
	stw	%l6,	[%l7 + 0x54]
	alignaddr	%o5,	%i0,	%l4
	edge32ln	%o0,	%l1,	%i3
	fnot1s	%f10,	%f13
	fxors	%f15,	%f10,	%f5
	fcmpgt32	%f2,	%f12,	%g1
	fmovdne	%xcc,	%f11,	%f12
	sdiv	%l2,	0x1D10,	%l0
	fnegs	%f8,	%f9
	edge8ln	%i1,	%o2,	%g7
	brz	%i7,	loop_114
	fpack16	%f10,	%f0
	sll	%g2,	0x1F,	%l3
	fbule,a	%fcc0,	loop_115
loop_114:
	bgu	%xcc,	loop_116
	fbne,a	%fcc1,	loop_117
	umul	%o6,	0x1264,	%g3
loop_115:
	fnot1	%f14,	%f8
loop_116:
	fmovsne	%xcc,	%f7,	%f14
loop_117:
	subcc	%i5,	%i4,	%o3
	ldsh	[%l7 + 0x52],	%o7
	fmul8x16	%f8,	%f2,	%f2
	stx	%i6,	[%l7 + 0x08]
	fcmpeq16	%f10,	%f12,	%o1
	fbu	%fcc0,	loop_118
	std	%f4,	[%l7 + 0x78]
	fands	%f4,	%f5,	%f6
	ba	%icc,	loop_119
loop_118:
	ld	[%l7 + 0x60],	%f0
	bcs	loop_120
	ldsb	[%l7 + 0x2B],	%l5
loop_119:
	movpos	%xcc,	%g6,	%i2
	ble,a	loop_121
loop_120:
	movn	%xcc,	%g4,	%o4
	addcc	%g5,	0x12F4,	%o5
	ldsw	[%l7 + 0x30],	%l6
loop_121:
	stx	%i0,	[%l7 + 0x58]
	brgez	%l4,	loop_122
	sdiv	%l1,	0x173A,	%o0
	fmovde	%xcc,	%f13,	%f11
	sethi	0x14BE,	%g1
loop_122:
	fbg,a	%fcc2,	loop_123
	fbe,a	%fcc0,	loop_124
	call	loop_125
	fmovsgu	%icc,	%f12,	%f15
loop_123:
	fbule	%fcc2,	loop_126
loop_124:
	ldub	[%l7 + 0x60],	%l2
loop_125:
	bcs	loop_127
	fmovsn	%xcc,	%f13,	%f13
loop_126:
	sdiv	%i3,	0x1237,	%l0
	fmul8sux16	%f4,	%f2,	%f0
loop_127:
	fnot2s	%f1,	%f8
	fmovsn	%icc,	%f5,	%f3
	fbn	%fcc2,	loop_128
	orncc	%i1,	%o2,	%g7
	bcc	%icc,	loop_129
	fbule	%fcc2,	loop_130
loop_128:
	fmovrsgez	%g2,	%f0,	%f13
	sth	%l3,	[%l7 + 0x74]
loop_129:
	fmovrdgez	%o6,	%f0,	%f4
loop_130:
	stx	%i7,	[%l7 + 0x68]
	fcmpne16	%f12,	%f12,	%i5
	fcmpgt32	%f14,	%f10,	%g3
	fmovdleu	%xcc,	%f14,	%f1
	fblg	%fcc1,	loop_131
	srax	%o3,	0x09,	%o7
	fmovsleu	%xcc,	%f7,	%f12
	fbn	%fcc3,	loop_132
loop_131:
	bleu	loop_133
	movrlz	%i4,	%i6,	%o1
	for	%f4,	%f14,	%f12
loop_132:
	fmovdneg	%icc,	%f2,	%f0
loop_133:
	fmovrsne	%l5,	%f14,	%f9
	udivx	%g6,	0x026C,	%g4
	brz,a	%o4,	loop_134
	movrlz	%i2,	%o5,	%l6
	bcc	%icc,	loop_135
	fmovsne	%xcc,	%f4,	%f2
loop_134:
	ldx	[%l7 + 0x18],	%g5
	ld	[%l7 + 0x38],	%f6
loop_135:
	edge8	%i0,	%l4,	%o0
	fmovs	%f12,	%f12
	fandnot1s	%f15,	%f4,	%f8
	fornot1s	%f4,	%f15,	%f3
	fandnot1s	%f15,	%f1,	%f7
	fcmpeq32	%f12,	%f8,	%l1
	fcmple32	%f10,	%f0,	%l2
	bneg,a	%icc,	loop_136
	fmovdpos	%icc,	%f3,	%f5
	st	%f15,	[%l7 + 0x0C]
	ld	[%l7 + 0x70],	%f2
loop_136:
	fmovrdlz	%g1,	%f4,	%f10
	edge16	%l0,	%i1,	%i3
	fmovsl	%xcc,	%f2,	%f4
	srlx	%o2,	0x16,	%g2
	fone	%f6
	xor	%l3,	0x1708,	%o6
	st	%f2,	[%l7 + 0x54]
	fmovsne	%icc,	%f7,	%f2
	fand	%f10,	%f0,	%f6
	movg	%icc,	%i7,	%g7
	fmovsl	%xcc,	%f15,	%f3
	stx	%g3,	[%l7 + 0x60]
	bvs,a,pn	%icc,	loop_137
	fcmple16	%f14,	%f2,	%i5
	lduw	[%l7 + 0x14],	%o3
	fmovsleu	%icc,	%f11,	%f8
loop_137:
	fbule	%fcc2,	loop_138
	fzero	%f12
	set  0x0, %l0
	setx loop_139, %l0, %l1
	jmpl %l1, %o7
	fmovsle	%icc,	%f5,	%f14
loop_138:
	popc	%i6,	%o1
	stw	%l5,	[%l7 + 0x7C]
loop_139:
	fcmpne32	%f14,	%f0,	%g6
	bvc,a,pt	%xcc,	loop_140
	std	%f0,	[%l7 + 0x48]
	bneg,a	loop_141
	bpos,a	loop_142
loop_140:
	bne	loop_143
	lduw	[%l7 + 0x10],	%g4
loop_141:
	fpadd16	%f14,	%f12,	%f10
loop_142:
	ldsw	[%l7 + 0x24],	%o4
loop_143:
	movrne	%i4,	0x187,	%o5
	fpsub32	%f6,	%f2,	%f6
	fmovdpos	%xcc,	%f14,	%f0
	fcmpne32	%f14,	%f10,	%l6
	ldub	[%l7 + 0x4B],	%g5
	brgez,a	%i2,	loop_144
	ldx	[%l7 + 0x08],	%i0
	fpadd32s	%f1,	%f8,	%f14
	bgu,pn	%xcc,	loop_145
loop_144:
	fmovrse	%l4,	%f11,	%f10
	ldsb	[%l7 + 0x45],	%l1
	fsrc2s	%f5,	%f7
loop_145:
	fcmple32	%f6,	%f0,	%o0
	umulcc	%g1,	%l0,	%i1
	xorcc	%l2,	%o2,	%i3
	movcs	%icc,	%l3,	%g2
	lduh	[%l7 + 0x4E],	%i7
	ble,pn	%xcc,	loop_146
	fbne	%fcc2,	loop_147
	lduh	[%l7 + 0x74],	%g7
	ble,a	%icc,	loop_148
loop_146:
	movvc	%xcc,	%g3,	%i5
loop_147:
	fxnor	%f0,	%f8,	%f8
	brgez	%o3,	loop_149
loop_148:
	bcs,pn	%icc,	loop_150
	sdivcc	%o6,	0x142E,	%i6
	brlz,a	%o7,	loop_151
loop_149:
	lduh	[%l7 + 0x7A],	%l5
loop_150:
	fmovdle	%icc,	%f14,	%f15
	fmovsn	%icc,	%f7,	%f10
loop_151:
	fmovrde	%g6,	%f12,	%f2
	ldsw	[%l7 + 0x20],	%g4
	edge8	%o1,	%i4,	%o4
	fxnors	%f13,	%f12,	%f10
	sth	%l6,	[%l7 + 0x5C]
	fzero	%f6
	bcc	loop_152
	sth	%g5,	[%l7 + 0x62]
	stb	%o5,	[%l7 + 0x65]
	fmovrse	%i2,	%f2,	%f14
loop_152:
	and	%l4,	%i0,	%o0
	fmul8sux16	%f0,	%f10,	%f14
	udivx	%g1,	0x02FD,	%l0
	fbge	%fcc1,	loop_153
	fmovrsgez	%l1,	%f2,	%f8
	ldx	[%l7 + 0x10],	%l2
	bneg,a	%xcc,	loop_154
loop_153:
	lduw	[%l7 + 0x54],	%i1
	fmovdvc	%icc,	%f3,	%f10
	edge8l	%o2,	%l3,	%g2
loop_154:
	srax	%i7,	0x12,	%i3
	ldx	[%l7 + 0x68],	%g7
	fmovrslez	%i5,	%f5,	%f14
	sll	%g3,	0x00,	%o3
	fabsd	%f6,	%f0
	fmovdpos	%icc,	%f15,	%f6
	fmovrsne	%o6,	%f0,	%f5
	fbge	%fcc2,	loop_155
	stx	%o7,	[%l7 + 0x68]
	bn,a	%xcc,	loop_156
	fble	%fcc2,	loop_157
loop_155:
	fbne,a	%fcc3,	loop_158
	umulcc	%i6,	%l5,	%g6
loop_156:
	udivx	%g4,	0x1F29,	%o1
loop_157:
	edge16n	%o4,	%l6,	%i4
loop_158:
	std	%f10,	[%l7 + 0x68]
	call	loop_159
	st	%f14,	[%l7 + 0x30]
	stx	%g5,	[%l7 + 0x38]
	lduw	[%l7 + 0x20],	%o5
loop_159:
	fbe,a	%fcc1,	loop_160
	st	%f10,	[%l7 + 0x4C]
	fpsub16s	%f7,	%f8,	%f13
	stb	%l4,	[%l7 + 0x50]
loop_160:
	bn	loop_161
	ba,a	%icc,	loop_162
	set  0x0, %l0
	setx loop_163, %l0, %l1
	jmpl %l1, %i2
	fmul8x16al	%f10,	%f6,	%f12
loop_161:
	movleu	%xcc,	%i0,	%o0
loop_162:
	ld	[%l7 + 0x1C],	%f13
loop_163:
	st	%f3,	[%l7 + 0x78]
	sdivx	%g1,	0x0E9F,	%l1
	movpos	%icc,	%l2,	%i1
	udivcc	%l0,	0x1DAF,	%l3
	fmovrsne	%o2,	%f8,	%f9
	stw	%g2,	[%l7 + 0x5C]
	std	%f12,	[%l7 + 0x10]
	bg,a,pt	%icc,	loop_164
	st	%f7,	[%l7 + 0x64]
	ld	[%l7 + 0x34],	%f6
	sth	%i3,	[%l7 + 0x32]
loop_164:
	edge16n	%i7,	%g7,	%i5
	sth	%g3,	[%l7 + 0x30]
	fmovrsgz	%o6,	%f14,	%f9
	fmuld8sux16	%f14,	%f9,	%f2
	brlz	%o7,	loop_165
	fandnot2	%f10,	%f14,	%f10
	std	%f8,	[%l7 + 0x18]
	add	%o3,	%l5,	%i6
loop_165:
	fmovscc	%xcc,	%f3,	%f3
	std	%f8,	[%l7 + 0x68]
	fmovspos	%icc,	%f5,	%f4
	fandnot1	%f12,	%f14,	%f0
	ldsh	[%l7 + 0x0C],	%g4
	fors	%f13,	%f12,	%f0
	ldsh	[%l7 + 0x12],	%g6
	ldd	[%l7 + 0x40],	%f4
	brgz,a	%o1,	loop_166
	fmovdpos	%xcc,	%f13,	%f8
	fmovrslz	%o4,	%f6,	%f7
	fornot2	%f2,	%f6,	%f0
loop_166:
	bge,pn	%xcc,	loop_167
	fsrc2s	%f1,	%f10
	fcmpgt16	%f0,	%f14,	%l6
	alignaddr	%g5,	%o5,	%l4
loop_167:
	bne,a	loop_168
	lduw	[%l7 + 0x48],	%i2
	fmovdl	%xcc,	%f5,	%f14
	movleu	%xcc,	%i4,	%i0
loop_168:
	be,pt	%xcc,	loop_169
	fmovrsgz	%o0,	%f11,	%f3
	fnegs	%f1,	%f3
	ldx	[%l7 + 0x60],	%g1
loop_169:
	movre	%l1,	0x16D,	%i1
	fmovrsne	%l2,	%f5,	%f6
	stx	%l0,	[%l7 + 0x58]
	movre	%o2,	0x021,	%l3
	fmovrde	%g2,	%f2,	%f8
	smulcc	%i3,	%i7,	%g7
	bvc,a,pt	%xcc,	loop_170
	bleu,a,pt	%xcc,	loop_171
	addccc	%g3,	%o6,	%i5
	lduw	[%l7 + 0x08],	%o7
loop_170:
	fbe,a	%fcc1,	loop_172
loop_171:
	movg	%icc,	%o3,	%l5
	fand	%f6,	%f6,	%f8
	fmovdvc	%xcc,	%f2,	%f9
loop_172:
	fxnor	%f2,	%f2,	%f10
	fcmpgt32	%f10,	%f10,	%g4
	fnand	%f4,	%f8,	%f0
	fpack32	%f2,	%f6,	%f10
	ldd	[%l7 + 0x38],	%f4
	fmovdcs	%icc,	%f8,	%f6
	fbuge	%fcc1,	loop_173
	std	%f2,	[%l7 + 0x48]
	movl	%xcc,	%i6,	%g6
	ldsh	[%l7 + 0x7A],	%o4
loop_173:
	fandnot1s	%f9,	%f1,	%f6
	orn	%l6,	%g5,	%o1
	ldsh	[%l7 + 0x1E],	%o5
	st	%f15,	[%l7 + 0x44]
	fmovrde	%l4,	%f12,	%f0
	ldsb	[%l7 + 0x28],	%i4
	sth	%i2,	[%l7 + 0x32]
	stx	%o0,	[%l7 + 0x38]
	fxor	%f6,	%f12,	%f6
	fornot1	%f6,	%f0,	%f4
	fornot2s	%f1,	%f15,	%f7
	fpsub16s	%f14,	%f5,	%f4
	bneg,a,pt	%icc,	loop_174
	edge8l	%g1,	%i0,	%i1
	bl,a	%xcc,	loop_175
	lduw	[%l7 + 0x18],	%l1
loop_174:
	fmovrdlez	%l2,	%f2,	%f10
	movrgez	%o2,	%l3,	%l0
loop_175:
	fcmpgt32	%f14,	%f4,	%i3
	ldsb	[%l7 + 0x53],	%i7
	udivx	%g2,	0x11F7,	%g7
	brnz,a	%g3,	loop_176
	fbule,a	%fcc0,	loop_177
	brgz	%i5,	loop_178
	movn	%xcc,	%o7,	%o6
loop_176:
	bleu	loop_179
loop_177:
	addccc	%o3,	%l5,	%i6
loop_178:
	fbge,a	%fcc1,	loop_180
	ldx	[%l7 + 0x48],	%g6
loop_179:
	movrlz	%o4,	0x063,	%g4
	movle	%xcc,	%g5,	%o1
loop_180:
	fandnot1s	%f1,	%f0,	%f9
	ldsw	[%l7 + 0x44],	%o5
	brz	%l6,	loop_181
	orn	%l4,	0x116D,	%i2
	ldd	[%l7 + 0x58],	%f12
	stx	%o0,	[%l7 + 0x18]
loop_181:
	movcc	%icc,	%g1,	%i0
	fxor	%f2,	%f10,	%f12
	ldsb	[%l7 + 0x28],	%i4
	srax	%i1,	%l2,	%o2
	std	%f10,	[%l7 + 0x78]
	ldsb	[%l7 + 0x40],	%l1
	brz,a	%l0,	loop_182
	lduw	[%l7 + 0x38],	%i3
	bvc,a	%xcc,	loop_183
	fbl	%fcc3,	loop_184
loop_182:
	andn	%l3,	%g2,	%g7
	sdivx	%i7,	0x1765,	%i5
loop_183:
	fmul8x16al	%f13,	%f14,	%f8
loop_184:
	udiv	%o7,	0x016B,	%o6
	edge8	%g3,	%o3,	%l5
	subcc	%i6,	0x0562,	%g6
	ldd	[%l7 + 0x30],	%f12
	sth	%o4,	[%l7 + 0x6E]
	xor	%g4,	0x1548,	%g5
	fcmpne16	%f0,	%f8,	%o1
	fpadd32s	%f7,	%f4,	%f3
	bneg,a	%xcc,	loop_185
	brlez,a	%o5,	loop_186
	sdiv	%l6,	0x17A9,	%l4
	ldsb	[%l7 + 0x0E],	%o0
loop_185:
	srax	%g1,	0x05,	%i2
loop_186:
	bvs,a,pt	%xcc,	loop_187
	set  0x0, %l0
	setx loop_188, %l0, %l1
	jmpl %l1, %i0
	stx	%i1,	[%l7 + 0x68]
	sth	%i4,	[%l7 + 0x60]
loop_187:
	stw	%l2,	[%l7 + 0x18]
loop_188:
	fmovrdlz	%o2,	%f12,	%f14
	stx	%l1,	[%l7 + 0x58]
	movne	%icc,	%i3,	%l0
	fmovrslez	%l3,	%f15,	%f14
	fone	%f12
	stw	%g7,	[%l7 + 0x1C]
	fbuge	%fcc2,	loop_189
	lduw	[%l7 + 0x14],	%i7
	smulcc	%i5,	0x102C,	%g2
	set  0x0, %l0
	setx loop_190, %l0, %l1
	jmpl %l1, %o6
loop_189:
	ldsb	[%l7 + 0x2D],	%o7
	ldd	[%l7 + 0x08],	%f10
	stb	%o3,	[%l7 + 0x70]
loop_190:
	srlx	%g3,	0x00,	%l5
	bl,a,pn	%xcc,	loop_191
	fnand	%f2,	%f6,	%f10
	lduh	[%l7 + 0x6E],	%g6
	bge,pt	%icc,	loop_192
loop_191:
	fsrc1s	%f15,	%f11
	fxors	%f6,	%f5,	%f2
	stb	%i6,	[%l7 + 0x09]
loop_192:
	edge32l	%o4,	%g5,	%o1
	fpsub16s	%f15,	%f9,	%f13
	fmovdl	%xcc,	%f11,	%f0
	st	%f5,	[%l7 + 0x68]
	ldub	[%l7 + 0x60],	%o5
	fpsub32	%f4,	%f0,	%f6
	movvs	%xcc,	%l6,	%l4
	movge	%xcc,	%g4,	%g1
	lduw	[%l7 + 0x74],	%i2
	fabss	%f10,	%f9
	fmovsleu	%icc,	%f5,	%f1
	ldd	[%l7 + 0x38],	%f14
	brz	%o0,	loop_193
	fmovdcc	%xcc,	%f2,	%f12
	and	%i0,	0x1AE0,	%i4
	edge16n	%i1,	%l2,	%l1
loop_193:
	fmovdvc	%icc,	%f3,	%f10
	fmovsvs	%xcc,	%f14,	%f7
	fmovdge	%xcc,	%f9,	%f8
	alignaddr	%i3,	%l0,	%o2
	fmul8x16au	%f9,	%f7,	%f4
	fbne	%fcc3,	loop_194
	brnz,a	%g7,	loop_195
	andn	%l3,	%i7,	%i5
	udivx	%o6,	0x1F54,	%g2
loop_194:
	edge16	%o7,	%g3,	%o3
loop_195:
	std	%f14,	[%l7 + 0x08]
	udivx	%l5,	0x1ACB,	%g6
	fcmpeq16	%f0,	%f0,	%o4
	fcmped	%fcc3,	%f8,	%f8
	fxors	%f10,	%f6,	%f5
	fxnor	%f0,	%f10,	%f0
	udivcc	%g5,	0x15B4,	%o1
	fmovdpos	%icc,	%f13,	%f1
	bvs,a,pn	%xcc,	loop_196
	fcmpeq16	%f10,	%f0,	%i6
	for	%f4,	%f2,	%f0
	stb	%l6,	[%l7 + 0x0E]
loop_196:
	edge8	%o5,	%l4,	%g4
	fbo	%fcc1,	loop_197
	fzero	%f4
	bn,a,pt	%icc,	loop_198
	ldd	[%l7 + 0x58],	%f6
loop_197:
	brnz,a	%i2,	loop_199
	bvs,pn	%xcc,	loop_200
loop_198:
	fmovdpos	%icc,	%f15,	%f2
	bgu,a	%icc,	loop_201
loop_199:
	fcmpeq32	%f6,	%f0,	%g1
loop_200:
	fmovsa	%xcc,	%f1,	%f12
	ldd	[%l7 + 0x10],	%f0
loop_201:
	ldsh	[%l7 + 0x20],	%i0
	fmovsne	%xcc,	%f9,	%f6
	subcc	%i4,	%i1,	%l2
	fcmple16	%f12,	%f0,	%o0
	fpackfix	%f10,	%f9
	movvs	%xcc,	%l1,	%i3
	ba	loop_202
	bcs,a,pt	%icc,	loop_203
	ldub	[%l7 + 0x59],	%l0
	brgez	%g7,	loop_204
loop_202:
	sdivx	%o2,	0x0C8B,	%i7
loop_203:
	std	%f8,	[%l7 + 0x10]
	fbuge	%fcc1,	loop_205
loop_204:
	ldd	[%l7 + 0x40],	%f2
	std	%f0,	[%l7 + 0x30]
	edge8	%l3,	%o6,	%i5
loop_205:
	ld	[%l7 + 0x2C],	%f10
	bgu,pt	%xcc,	loop_206
	fcmple32	%f14,	%f2,	%g2
	fpack32	%f2,	%f6,	%f8
	fmovrse	%o7,	%f6,	%f11
loop_206:
	ld	[%l7 + 0x5C],	%f15
	fandnot1s	%f15,	%f8,	%f6
	fsrc2	%f0,	%f10
	fmovdgu	%icc,	%f2,	%f2
	bgu,pt	%icc,	loop_207
	fmul8x16au	%f15,	%f11,	%f12
	fcmpne16	%f2,	%f10,	%o3
	fnot2s	%f8,	%f3
loop_207:
	fpadd32s	%f3,	%f11,	%f13
	bcc	%icc,	loop_208
	movle	%xcc,	%g3,	%l5
	fbul	%fcc1,	loop_209
	movge	%icc,	%o4,	%g6
loop_208:
	edge8l	%o1,	%i6,	%g5
	add	%l6,	0x1002,	%o5
loop_209:
	fmovsleu	%icc,	%f0,	%f4
	fsrc2	%f10,	%f8
	ldub	[%l7 + 0x34],	%l4
	fsrc2	%f10,	%f6
	andncc	%i2,	%g1,	%g4
	edge8n	%i0,	%i4,	%l2
	fbo,a	%fcc2,	loop_210
	fbne	%fcc3,	loop_211
	fpadd16	%f6,	%f4,	%f8
	fpsub32	%f12,	%f12,	%f8
loop_210:
	fand	%f10,	%f14,	%f6
loop_211:
	andn	%o0,	%i1,	%l1
	lduw	[%l7 + 0x48],	%i3
	alignaddrl	%g7,	%l0,	%i7
	fmovrdgz	%l3,	%f2,	%f10
	fmovsleu	%xcc,	%f8,	%f0
	stb	%o6,	[%l7 + 0x79]
	fornot2	%f8,	%f10,	%f10
	sethi	0x0CFF,	%i5
	fmovscs	%xcc,	%f14,	%f8
	fmovsge	%xcc,	%f6,	%f4
	addccc	%g2,	0x0F39,	%o7
	edge32	%o3,	%o2,	%l5
	ldsb	[%l7 + 0x18],	%o4
	fcmpne16	%f14,	%f4,	%g6
	fnot1	%f0,	%f14
	fmovrsne	%g3,	%f1,	%f13
	bleu,a	loop_212
	subccc	%o1,	%g5,	%l6
	alignaddrl	%o5,	%l4,	%i6
	bne,a	loop_213
loop_212:
	st	%f13,	[%l7 + 0x28]
	fmovrslez	%i2,	%f9,	%f2
	fmovdvs	%icc,	%f15,	%f7
loop_213:
	edge32	%g4,	%g1,	%i0
	ldsw	[%l7 + 0x5C],	%i4
	fbe	%fcc3,	loop_214
	fmovsle	%xcc,	%f6,	%f3
	fcmpd	%fcc2,	%f8,	%f14
	fornot2	%f12,	%f0,	%f0
loop_214:
	fcmpne16	%f6,	%f10,	%l2
	edge32	%o0,	%i1,	%i3
	fands	%f8,	%f2,	%f6
	ldub	[%l7 + 0x7F],	%g7
	bn,pt	%xcc,	loop_215
	call	loop_216
	sdivcc	%l1,	0x1024,	%l0
	fpsub16	%f2,	%f10,	%f14
loop_215:
	fmuld8ulx16	%f9,	%f5,	%f0
loop_216:
	bgu,a,pt	%xcc,	loop_217
	addcc	%l3,	%i7,	%i5
	fcmpeq32	%f14,	%f10,	%g2
	fsrc2	%f2,	%f4
loop_217:
	fpackfix	%f14,	%f3
	fmovrsgez	%o6,	%f6,	%f1
	umul	%o7,	0x0CE8,	%o3
	bvs,pt	%xcc,	loop_218
	fmul8x16al	%f3,	%f14,	%f8
	bn,a,pn	%xcc,	loop_219
	brnz,a	%o2,	loop_220
loop_218:
	bcc,pn	%icc,	loop_221
	ldub	[%l7 + 0x3C],	%l5
loop_219:
	add	%o4,	%g3,	%g6
loop_220:
	ldsh	[%l7 + 0x32],	%o1
loop_221:
	fmovsl	%icc,	%f13,	%f0
	fcmpne16	%f8,	%f8,	%g5
	fmovsvs	%xcc,	%f2,	%f7
	fmovsl	%icc,	%f3,	%f2
	fnegd	%f4,	%f4
	fnand	%f6,	%f8,	%f6
	fcmpeq16	%f10,	%f8,	%o5
	ldsh	[%l7 + 0x32],	%l4
	movvs	%xcc,	%l6,	%i6
	fpsub16s	%f8,	%f2,	%f12
	fpackfix	%f4,	%f13
	fmovscs	%icc,	%f7,	%f14
	edge32n	%g4,	%i2,	%i0
	move	%xcc,	%g1,	%i4
	edge16n	%l2,	%o0,	%i1
	fmul8sux16	%f8,	%f2,	%f10
	st	%f10,	[%l7 + 0x58]
	fbu,a	%fcc0,	loop_222
	andncc	%g7,	%i3,	%l0
	fmovsgu	%icc,	%f11,	%f11
	ldsb	[%l7 + 0x56],	%l1
loop_222:
	fsrc1s	%f12,	%f8
	fandnot1	%f4,	%f8,	%f12
	ldsw	[%l7 + 0x54],	%i7
	fmovdge	%icc,	%f12,	%f14
	brnz,a	%l3,	loop_223
	fsrc2s	%f7,	%f13
	fabsd	%f10,	%f6
	stw	%i5,	[%l7 + 0x3C]
loop_223:
	ldsw	[%l7 + 0x48],	%g2
	ldsw	[%l7 + 0x58],	%o7
	fxor	%f4,	%f10,	%f0
	ldsh	[%l7 + 0x10],	%o3
	movcs	%icc,	%o2,	%o6
	fmovdcs	%xcc,	%f2,	%f2
	fandnot2s	%f5,	%f4,	%f10
	ldsb	[%l7 + 0x35],	%l5
	brgz,a	%o4,	loop_224
	mulscc	%g6,	%g3,	%g5
	fmovsneg	%icc,	%f3,	%f3
	fnegd	%f14,	%f0
loop_224:
	mulx	%o5,	0x13DE,	%l4
	lduh	[%l7 + 0x1E],	%l6
	stx	%o1,	[%l7 + 0x58]
	fmovsg	%icc,	%f1,	%f13
	stb	%i6,	[%l7 + 0x09]
	fcmple32	%f12,	%f14,	%g4
	fmul8x16au	%f3,	%f15,	%f0
	bleu,pt	%icc,	loop_225
	fbge,a	%fcc1,	loop_226
	bleu,a	%xcc,	loop_227
	fmovdvc	%xcc,	%f11,	%f2
loop_225:
	fbg	%fcc1,	loop_228
loop_226:
	fornot2	%f14,	%f10,	%f10
loop_227:
	move	%xcc,	%i2,	%i0
	stx	%g1,	[%l7 + 0x60]
loop_228:
	brnz,a	%l2,	loop_229
	set  0x0, %l0
	setx loop_230, %l0, %l1
	jmpl %l1, %i4
	umul	%i1,	0x0D9C,	%g7
	srlx	%o0,	%i3,	%l1
loop_229:
	fmovrslz	%i7,	%f5,	%f3
loop_230:
	fnegd	%f14,	%f4
	fbn	%fcc3,	loop_231
	std	%f8,	[%l7 + 0x70]
	fmovsa	%xcc,	%f1,	%f14
	fmovrse	%l0,	%f12,	%f13
loop_231:
	fbug,a	%fcc3,	loop_232
	smul	%l3,	%g2,	%i5
	ble,a,pt	%xcc,	loop_233
	orn	%o7,	0x1D34,	%o2
loop_232:
	fmovdcs	%xcc,	%f14,	%f1
	fbue,a	%fcc0,	loop_234
loop_233:
	fmovrsne	%o6,	%f6,	%f10
	fmovdg	%xcc,	%f12,	%f15
	sll	%l5,	0x19,	%o3
loop_234:
	fpadd32s	%f15,	%f2,	%f6
	fandnot1s	%f11,	%f8,	%f8
	fabsd	%f4,	%f10
	fmul8x16al	%f7,	%f15,	%f4
	bpos,a,pn	%xcc,	loop_235
	xorcc	%g6,	%o4,	%g5
	fnand	%f14,	%f10,	%f2
	movre	%g3,	0x078,	%o5
loop_235:
	edge8	%l4,	%l6,	%i6
	fcmpeq32	%f2,	%f8,	%o1
	ble,pt	%xcc,	loop_236
	sdiv	%g4,	0x002C,	%i0
	fba,a	%fcc1,	loop_237
	fnot1s	%f12,	%f14
loop_236:
	fmovdg	%xcc,	%f7,	%f5
	edge8l	%g1,	%l2,	%i2
loop_237:
	fmovrse	%i4,	%f15,	%f10
	lduh	[%l7 + 0x78],	%g7
	fcmple32	%f0,	%f14,	%i1
	fbn,a	%fcc3,	loop_238
	lduw	[%l7 + 0x5C],	%o0
	fmovsn	%icc,	%f13,	%f10
	fcmps	%fcc0,	%f11,	%f15
loop_238:
	xnorcc	%i3,	0x1040,	%l1
	brlz,a	%l0,	loop_239
	sllx	%l3,	%g2,	%i7
	bcs,a,pn	%icc,	loop_240
	fbe	%fcc2,	loop_241
loop_239:
	lduw	[%l7 + 0x70],	%i5
	fzeros	%f14
loop_240:
	stx	%o7,	[%l7 + 0x50]
loop_241:
	fmovdneg	%icc,	%f9,	%f14
	brlez,a	%o2,	loop_242
	edge8n	%l5,	%o3,	%g6
	ld	[%l7 + 0x68],	%f3
	bcs,a,pt	%xcc,	loop_243
loop_242:
	ld	[%l7 + 0x1C],	%f0
	bcc,a,pn	%xcc,	loop_244
	brz	%o6,	loop_245
loop_243:
	fmovsneg	%xcc,	%f0,	%f8
	fxor	%f4,	%f2,	%f14
loop_244:
	fmovdgu	%icc,	%f2,	%f4
loop_245:
	fsrc2s	%f1,	%f6
	ldx	[%l7 + 0x70],	%o4
	ldx	[%l7 + 0x68],	%g3
	fpsub32s	%f4,	%f8,	%f10
	addccc	%o5,	%l4,	%g5
	ldsb	[%l7 + 0x11],	%l6
	sth	%i6,	[%l7 + 0x20]
	lduh	[%l7 + 0x0C],	%g4
	std	%f6,	[%l7 + 0x58]
	ldd	[%l7 + 0x30],	%f8
	brlz,a	%i0,	loop_246
	brnz,a	%o1,	loop_247
	movg	%icc,	%l2,	%i2
	ldsb	[%l7 + 0x70],	%i4
loop_246:
	ld	[%l7 + 0x78],	%f15
loop_247:
	bgu	loop_248
	fcmpeq32	%f0,	%f12,	%g7
	stw	%g1,	[%l7 + 0x50]
	fmovdgu	%xcc,	%f11,	%f12
loop_248:
	movrne	%i1,	%o0,	%i3
	fornot1s	%f2,	%f5,	%f15
	ldx	[%l7 + 0x58],	%l0
	sra	%l3,	%g2,	%i7
	ldsh	[%l7 + 0x0C],	%i5
	bleu	loop_249
	fbu	%fcc3,	loop_250
	ldub	[%l7 + 0x27],	%l1
	sra	%o2,	%o7,	%l5
loop_249:
	smulcc	%g6,	0x1A70,	%o6
loop_250:
	sllx	%o4,	0x0D,	%g3
	movg	%icc,	%o5,	%l4
	ldub	[%l7 + 0x28],	%o3
	fnegs	%f3,	%f14
	lduh	[%l7 + 0x22],	%g5
	fbl,a	%fcc2,	loop_251
	fsrc2s	%f12,	%f11
	edge8l	%l6,	%g4,	%i6
	call	loop_252
loop_251:
	andncc	%i0,	%o1,	%l2
	bl,a,pn	%icc,	loop_253
	fmovdcs	%icc,	%f8,	%f15
loop_252:
	std	%f12,	[%l7 + 0x68]
	fbe,a	%fcc3,	loop_254
loop_253:
	fnot1s	%f12,	%f9
	movl	%xcc,	%i4,	%g7
	srlx	%i2,	%i1,	%g1
loop_254:
	fmovrsgz	%i3,	%f13,	%f10
	fcmped	%fcc0,	%f4,	%f2
	ldsh	[%l7 + 0x18],	%o0
	mulscc	%l0,	%l3,	%i7
	ldd	[%l7 + 0x40],	%f14
	mulx	%g2,	%i5,	%l1
	ldd	[%l7 + 0x30],	%f14
	fzeros	%f5
	fpsub32s	%f14,	%f14,	%f0
	sth	%o2,	[%l7 + 0x0C]
	fba	%fcc0,	loop_255
	bneg,a,pn	%xcc,	loop_256
	fmovsleu	%icc,	%f7,	%f15
	fble,a	%fcc1,	loop_257
loop_255:
	fsrc2s	%f4,	%f10
loop_256:
	fbue,a	%fcc1,	loop_258
	fmul8x16au	%f14,	%f14,	%f12
loop_257:
	bg	loop_259
	fbl	%fcc0,	loop_260
loop_258:
	popc	0x123D,	%o7
	movrgez	%g6,	0x195,	%l5
loop_259:
	fbo	%fcc1,	loop_261
loop_260:
	bgu,pn	%xcc,	loop_262
	stw	%o6,	[%l7 + 0x54]
	std	%f14,	[%l7 + 0x60]
loop_261:
	fcmpne16	%f12,	%f6,	%g3
loop_262:
	ldsh	[%l7 + 0x46],	%o4
	edge32	%o5,	%o3,	%l4
	movneg	%xcc,	%g5,	%l6
	fmovdvs	%icc,	%f12,	%f7
	lduw	[%l7 + 0x2C],	%g4
	bvc,pn	%xcc,	loop_263
	lduw	[%l7 + 0x28],	%i6
	movneg	%icc,	%o1,	%i0
	fcmpne32	%f8,	%f6,	%l2
loop_263:
	bne,pt	%icc,	loop_264
	fbue,a	%fcc0,	loop_265
	fpsub32s	%f14,	%f4,	%f4
	brlz	%i4,	loop_266
loop_264:
	fxnor	%f8,	%f14,	%f4
loop_265:
	ldd	[%l7 + 0x28],	%f14
	fmovscs	%icc,	%f13,	%f12
loop_266:
	fors	%f11,	%f12,	%f12
	sth	%i2,	[%l7 + 0x72]
	subcc	%g7,	%i1,	%i3
	lduw	[%l7 + 0x64],	%g1
	fpadd32	%f14,	%f4,	%f10
	fabss	%f9,	%f6
	fzeros	%f14
	ldd	[%l7 + 0x70],	%f8
	edge16	%o0,	%l0,	%i7
	sll	%l3,	0x16,	%i5
	fcmpd	%fcc1,	%f12,	%f10
	fnands	%f13,	%f14,	%f3
	ldd	[%l7 + 0x28],	%f12
	stb	%l1,	[%l7 + 0x1D]
	fcmpeq16	%f6,	%f8,	%g2
	addc	%o2,	%g6,	%l5
	fnors	%f7,	%f12,	%f7
	fbl,a	%fcc1,	loop_267
	movge	%icc,	%o6,	%o7
	fsrc1s	%f9,	%f11
	fnors	%f11,	%f14,	%f14
loop_267:
	fmuld8ulx16	%f11,	%f1,	%f2
	fmovrse	%g3,	%f7,	%f2
	stw	%o4,	[%l7 + 0x38]
	sethi	0x14B9,	%o3
	brnz,a	%o5,	loop_268
	brz	%g5,	loop_269
	ldd	[%l7 + 0x68],	%f10
	fornot2	%f10,	%f0,	%f4
loop_268:
	fcmple32	%f12,	%f2,	%l6
loop_269:
	fmovdgu	%icc,	%f3,	%f11
	fmovdvs	%icc,	%f3,	%f6
	fmovdleu	%xcc,	%f1,	%f5
	fbuge	%fcc0,	loop_270
	fnot1s	%f2,	%f1
	ldsb	[%l7 + 0x72],	%g4
	fmovdle	%icc,	%f14,	%f9
loop_270:
	fbl,a	%fcc1,	loop_271
	and	%i6,	%o1,	%l4
	bn,a	loop_272
	fbl	%fcc3,	loop_273
loop_271:
	movrne	%l2,	%i0,	%i2
	stw	%g7,	[%l7 + 0x3C]
loop_272:
	faligndata	%f12,	%f0,	%f4
loop_273:
	fmovrse	%i1,	%f8,	%f9
	stx	%i3,	[%l7 + 0x78]
	ldsw	[%l7 + 0x48],	%i4
	lduw	[%l7 + 0x68],	%g1
	ldx	[%l7 + 0x10],	%l0
	sll	%i7,	0x08,	%o0
	fpadd16	%f6,	%f0,	%f10
	fbuge,a	%fcc3,	loop_274
	std	%f12,	[%l7 + 0x28]
	ldd	[%l7 + 0x30],	%f8
	fmovdge	%icc,	%f10,	%f7
loop_274:
	fmovde	%xcc,	%f3,	%f10
	fmul8x16al	%f7,	%f7,	%f4
	fcmpeq16	%f0,	%f0,	%l3
	ldsh	[%l7 + 0x0A],	%l1
	andn	%i5,	%o2,	%g2
	brgez	%l5,	loop_275
	add	%o6,	%o7,	%g6
	fble	%fcc0,	loop_276
	st	%f3,	[%l7 + 0x1C]
loop_275:
	edge8ln	%g3,	%o4,	%o3
	brlez	%o5,	loop_277
loop_276:
	fmovsgu	%icc,	%f7,	%f7
	fbge	%fcc2,	loop_278
	udivx	%g5,	0x073E,	%g4
loop_277:
	ld	[%l7 + 0x70],	%f2
	fble	%fcc2,	loop_279
loop_278:
	lduh	[%l7 + 0x6E],	%i6
	lduh	[%l7 + 0x62],	%o1
	fmovrsgz	%l6,	%f6,	%f0
loop_279:
	fcmps	%fcc3,	%f14,	%f5
	fmovd	%f2,	%f12
	ldub	[%l7 + 0x33],	%l4
	fornot2s	%f13,	%f5,	%f4
	movvs	%icc,	%l2,	%i2
	orncc	%i0,	%g7,	%i1
	fmovsvc	%xcc,	%f9,	%f1
	fmovscs	%icc,	%f15,	%f8
	fandnot1	%f2,	%f4,	%f10
	ldd	[%l7 + 0x70],	%f2
	fmovdvs	%xcc,	%f14,	%f4
	ld	[%l7 + 0x5C],	%f1
	lduw	[%l7 + 0x54],	%i3
	fmovrde	%i4,	%f2,	%f10
	ldsb	[%l7 + 0x22],	%g1
	fble,a	%fcc2,	loop_280
	addccc	%l0,	%o0,	%i7
	fpack32	%f0,	%f6,	%f2
	bcs,a,pn	%icc,	loop_281
loop_280:
	ld	[%l7 + 0x6C],	%f7
	udivx	%l3,	0x130A,	%i5
	fmovsne	%icc,	%f8,	%f13
loop_281:
	brz,a	%l1,	loop_282
	fbn,a	%fcc3,	loop_283
	bleu,a	loop_284
	sdivx	%o2,	0x17DD,	%g2
loop_282:
	fornot1	%f0,	%f10,	%f12
loop_283:
	edge8l	%o6,	%l5,	%g6
loop_284:
	sdivcc	%g3,	0x0ABE,	%o7
	fpack16	%f14,	%f14
	lduw	[%l7 + 0x60],	%o4
	move	%icc,	%o3,	%g5
	fblg	%fcc1,	loop_285
	fba	%fcc2,	loop_286
	fornot1	%f12,	%f6,	%f14
	lduw	[%l7 + 0x50],	%o5
loop_285:
	movre	%g4,	%i6,	%l6
loop_286:
	orn	%l4,	0x1662,	%o1
	brnz,a	%l2,	loop_287
	fnegd	%f14,	%f10
	bge,a,pn	%icc,	loop_288
	fpadd16s	%f12,	%f1,	%f8
loop_287:
	fmovdne	%icc,	%f12,	%f8
	ldub	[%l7 + 0x15],	%i2
loop_288:
	fpadd32s	%f12,	%f13,	%f3
	set  0x0, %l0
	setx loop_289, %l0, %l1
	jmpl %l1, %g7
	fmovdn	%xcc,	%f13,	%f9
	fbo,a	%fcc3,	loop_290
	sllx	%i1,	%i0,	%i4
loop_289:
	ldub	[%l7 + 0x48],	%g1
	fornot2	%f2,	%f0,	%f2
loop_290:
	fmovrdgez	%l0,	%f10,	%f8
	ldd	[%l7 + 0x60],	%f4
	fmovrdlz	%o0,	%f4,	%f4
	movneg	%icc,	%i7,	%l3
	fbu	%fcc1,	loop_291
	fmovspos	%icc,	%f14,	%f6
	fbug	%fcc3,	loop_292
	std	%f4,	[%l7 + 0x30]
loop_291:
	fpadd16s	%f10,	%f7,	%f12
	bl	%icc,	loop_293
loop_292:
	fmovrdne	%i3,	%f4,	%f4
	edge32l	%l1,	%o2,	%g2
	ldsw	[%l7 + 0x28],	%o6
loop_293:
	fmovrdne	%i5,	%f12,	%f2
	std	%f2,	[%l7 + 0x10]
	fbl	%fcc0,	loop_294
	fsrc1s	%f15,	%f1
	fandnot1	%f10,	%f12,	%f14
	fbule,a	%fcc0,	loop_295
loop_294:
	fcmpeq32	%f12,	%f6,	%l5
	fones	%f3
	bleu,a,pn	%icc,	loop_296
loop_295:
	andcc	%g6,	%g3,	%o4
	fones	%f2
	fnot2s	%f14,	%f2
loop_296:
	lduw	[%l7 + 0x08],	%o3
	lduh	[%l7 + 0x7C],	%o7
	udiv	%o5,	0x09AF,	%g4
	fmovrdne	%g5,	%f6,	%f2
	fbu	%fcc2,	loop_297
	addc	%l6,	0x16CC,	%l4
	fabss	%f10,	%f15
	movle	%xcc,	%o1,	%l2
loop_297:
	movg	%icc,	%i6,	%i2
	fnot2s	%f15,	%f2
	bpos,a,pt	%icc,	loop_298
	popc	0x0566,	%i1
	add	%g7,	%i0,	%g1
	ldsh	[%l7 + 0x46],	%l0
loop_298:
	fmovrsgz	%o0,	%f0,	%f12
	lduh	[%l7 + 0x1C],	%i7
	add	%i4,	%l3,	%i3
	movn	%xcc,	%o2,	%l1
	fmovsn	%xcc,	%f11,	%f7
	fbn,a	%fcc3,	loop_299
	xorcc	%g2,	%o6,	%l5
	sll	%g6,	%i5,	%g3
	brnz	%o3,	loop_300
loop_299:
	sub	%o7,	%o5,	%o4
	stw	%g5,	[%l7 + 0x44]
	ldsb	[%l7 + 0x28],	%g4
loop_300:
	fpack32	%f6,	%f2,	%f0
	fmovd	%f10,	%f0
	fbn,a	%fcc3,	loop_301
	sdivcc	%l4,	0x068A,	%o1
	fnot2s	%f0,	%f1
	bpos	%xcc,	loop_302
loop_301:
	fba	%fcc1,	loop_303
	fbl,a	%fcc3,	loop_304
	stb	%l2,	[%l7 + 0x3A]
loop_302:
	fxnors	%f0,	%f2,	%f9
loop_303:
	fcmpeq32	%f14,	%f14,	%l6
loop_304:
	fone	%f6
	smul	%i2,	0x0932,	%i1
	brgez,a	%g7,	loop_305
	bge,a,pn	%xcc,	loop_306
	ba,a,pt	%icc,	loop_307
	udivx	%i6,	0x16D9,	%g1
loop_305:
	fone	%f6
loop_306:
	alignaddr	%l0,	%i0,	%o0
loop_307:
	mulscc	%i7,	0x0216,	%i4
	add	%i3,	%l3,	%o2
	st	%f8,	[%l7 + 0x50]
	fbne	%fcc2,	loop_308
	fnot1s	%f2,	%f4
	xnor	%l1,	0x1614,	%g2
	edge32	%o6,	%l5,	%g6
loop_308:
	brz,a	%g3,	loop_309
	fmovrsgez	%o3,	%f9,	%f12
	fmovsne	%icc,	%f9,	%f7
	orn	%o7,	%i5,	%o5
loop_309:
	fmuld8sux16	%f11,	%f2,	%f2
	bcs,a	%icc,	loop_310
	popc	%o4,	%g4
	xor	%l4,	%g5,	%l2
	movpos	%xcc,	%o1,	%i2
loop_310:
	fmovsvs	%xcc,	%f1,	%f11
	fbu	%fcc1,	loop_311
	ldx	[%l7 + 0x78],	%i1
	fors	%f6,	%f11,	%f12
	ldd	[%l7 + 0x08],	%f4
loop_311:
	fand	%f8,	%f12,	%f6
	ldsb	[%l7 + 0x42],	%g7
	fnor	%f8,	%f10,	%f2
	fpackfix	%f6,	%f14
	movcs	%icc,	%l6,	%g1
	fsrc1	%f12,	%f0
	fmuld8ulx16	%f7,	%f10,	%f2
	andcc	%l0,	%i6,	%i0
	lduw	[%l7 + 0x30],	%i7
	fxor	%f12,	%f14,	%f12
	fxor	%f12,	%f8,	%f2
	move	%xcc,	%i4,	%i3
	movvc	%xcc,	%l3,	%o2
	fmovde	%icc,	%f2,	%f12
	fmovsleu	%icc,	%f4,	%f12
	fbg	%fcc3,	loop_312
	bcs	%icc,	loop_313
	bcc	loop_314
	fcmple16	%f10,	%f12,	%o0
loop_312:
	add	%g2,	%o6,	%l1
loop_313:
	fnors	%f15,	%f12,	%f10
loop_314:
	fbule	%fcc2,	loop_315
	fmovrslz	%g6,	%f9,	%f9
	popc	%g3,	%o3
	fandnot1s	%f15,	%f7,	%f3
loop_315:
	fzeros	%f12
	edge16l	%o7,	%i5,	%l5
	brlez,a	%o4,	loop_316
	fone	%f4
	ldx	[%l7 + 0x20],	%g4
	fmovsle	%xcc,	%f9,	%f6
loop_316:
	fmovdle	%xcc,	%f12,	%f5
	bleu,a	loop_317
	ldsb	[%l7 + 0x24],	%o5
	fble,a	%fcc2,	loop_318
	lduh	[%l7 + 0x4A],	%l4
loop_317:
	stx	%g5,	[%l7 + 0x10]
	stx	%l2,	[%l7 + 0x70]
loop_318:
	ldub	[%l7 + 0x7C],	%i2
	fmovrslez	%o1,	%f6,	%f10
	edge32n	%g7,	%i1,	%l6
	fbuge	%fcc3,	loop_319
	movrgz	%g1,	0x02B,	%i6
	fmovsgu	%xcc,	%f15,	%f13
	brgz,a	%l0,	loop_320
loop_319:
	movcc	%icc,	%i7,	%i0
	fmul8x16au	%f4,	%f3,	%f14
	fands	%f2,	%f15,	%f13
loop_320:
	fcmpes	%fcc0,	%f9,	%f3
	movleu	%xcc,	%i4,	%l3
	lduw	[%l7 + 0x1C],	%o2
	movrne	%o0,	0x192,	%i3
	srl	%o6,	0x1A,	%l1
	sllx	%g6,	%g3,	%g2
	lduw	[%l7 + 0x08],	%o3
	stb	%i5,	[%l7 + 0x35]
	fabsd	%f12,	%f4
	fmovdge	%xcc,	%f8,	%f13
	fpack32	%f8,	%f8,	%f14
	fandnot2s	%f15,	%f5,	%f13
	ble,a	%xcc,	loop_321
	fmovdg	%xcc,	%f7,	%f6
	ld	[%l7 + 0x6C],	%f6
	brgz	%l5,	loop_322
loop_321:
	fmovrde	%o4,	%f8,	%f10
	fmovsne	%icc,	%f14,	%f1
	edge16	%o7,	%o5,	%g4
loop_322:
	movpos	%icc,	%l4,	%l2
	ldd	[%l7 + 0x68],	%f14
	movrlz	%i2,	0x1D2,	%o1
	mulscc	%g7,	%g5,	%l6
	for	%f2,	%f6,	%f14
	fandnot2s	%f13,	%f8,	%f5
	fpsub32s	%f14,	%f9,	%f8
	ldx	[%l7 + 0x18],	%g1
	and	%i1,	%l0,	%i6
	sra	%i7,	0x05,	%i4
	udivx	%l3,	0x1866,	%i0
	fpack16	%f2,	%f8
	fmovrdne	%o0,	%f12,	%f14
	fmovrsne	%i3,	%f13,	%f4
	sdivx	%o6,	0x1849,	%o2
	edge32l	%l1,	%g3,	%g2
	fnor	%f14,	%f8,	%f14
	edge8n	%g6,	%o3,	%i5
	movneg	%icc,	%o4,	%o7
	fmovda	%icc,	%f2,	%f11
	fcmpeq32	%f14,	%f12,	%o5
	edge32n	%l5,	%g4,	%l4
	brnz,a	%l2,	loop_323
	addc	%o1,	%i2,	%g7
	fnot2	%f0,	%f0
	set  0x0, %l0
	setx loop_324, %l0, %l1
	jmpl %l1, %l6
loop_323:
	ldx	[%l7 + 0x60],	%g1
	stw	%g5,	[%l7 + 0x2C]
	edge8l	%l0,	%i6,	%i1
loop_324:
	ldsb	[%l7 + 0x55],	%i7
	subc	%l3,	%i4,	%i0
	fmovrse	%o0,	%f8,	%f12
	bne,a,pn	%icc,	loop_325
	ld	[%l7 + 0x70],	%f8
	edge16	%o6,	%o2,	%l1
	fmovdg	%xcc,	%f1,	%f0
loop_325:
	fba,a	%fcc1,	loop_326
	ldub	[%l7 + 0x4F],	%g3
	fcmpne16	%f8,	%f12,	%g2
	stw	%i3,	[%l7 + 0x64]
loop_326:
	fornot1	%f2,	%f10,	%f10
	fmovdvs	%xcc,	%f8,	%f8
	movcs	%icc,	%g6,	%i5
	fmovrdne	%o3,	%f12,	%f8
	bneg,a,pt	%icc,	loop_327
	fmovdge	%xcc,	%f15,	%f3
	fblg	%fcc3,	loop_328
	ld	[%l7 + 0x18],	%f6
loop_327:
	bvs,pn	%xcc,	loop_329
	sth	%o7,	[%l7 + 0x7C]
loop_328:
	brlz	%o4,	loop_330
	bn	loop_331
loop_329:
	call	loop_332
	ldsb	[%l7 + 0x2E],	%l5
loop_330:
	brlez,a	%g4,	loop_333
loop_331:
	fmovrsgz	%l4,	%f7,	%f10
loop_332:
	fand	%f10,	%f0,	%f2
	fbu	%fcc2,	loop_334
loop_333:
	ldx	[%l7 + 0x18],	%o5
	bge,a,pt	%icc,	loop_335
	brlz,a	%l2,	loop_336
loop_334:
	xnor	%o1,	%g7,	%l6
	std	%f6,	[%l7 + 0x68]
loop_335:
	fmovdge	%icc,	%f9,	%f4
loop_336:
	movne	%icc,	%g1,	%i2
	fmovspos	%xcc,	%f3,	%f4
	fpack16	%f2,	%f14
	fcmpne16	%f2,	%f12,	%l0
	fmovdl	%icc,	%f0,	%f1
	fbule	%fcc0,	loop_337
	brgz,a	%i6,	loop_338
	ldsw	[%l7 + 0x20],	%g5
	sra	%i7,	0x1B,	%i1
loop_337:
	fandnot1s	%f0,	%f6,	%f4
loop_338:
	fbe,a	%fcc1,	loop_339
	set  0x0, %l0
	setx loop_340, %l0, %l1
	jmpl %l1, %i4
	andn	%l3,	0x0C57,	%i0
	fmovdvs	%icc,	%f14,	%f1
loop_339:
	be,a,pt	%icc,	loop_341
loop_340:
	fmovdvc	%xcc,	%f6,	%f8
	fcmped	%fcc0,	%f14,	%f2
	fbo,a	%fcc2,	loop_342
loop_341:
	ldd	[%l7 + 0x08],	%f2
	stb	%o0,	[%l7 + 0x60]
	fpadd32s	%f10,	%f12,	%f5
loop_342:
	bne	loop_343
	fmovda	%xcc,	%f13,	%f13
	brlz,a	%o2,	loop_344
	movvs	%icc,	%l1,	%g3
loop_343:
	fmuld8sux16	%f10,	%f13,	%f8
	fmovde	%icc,	%f9,	%f1
loop_344:
	edge8n	%o6,	%g2,	%i3
	fmovsle	%xcc,	%f15,	%f11
	fbo,a	%fcc2,	loop_345
	fmovdleu	%icc,	%f7,	%f2
	movre	%g6,	0x135,	%i5
	ldsw	[%l7 + 0x6C],	%o3
loop_345:
	bvs,a	%icc,	loop_346
	fbg	%fcc3,	loop_347
	fbue,a	%fcc2,	loop_348
	fornot1	%f12,	%f2,	%f4
loop_346:
	ldd	[%l7 + 0x28],	%f0
loop_347:
	subccc	%o4,	%o7,	%g4
loop_348:
	fzeros	%f3
	movvs	%icc,	%l4,	%o5
	fbu,a	%fcc2,	loop_349
	fcmpne16	%f12,	%f4,	%l2
	fmovdle	%xcc,	%f2,	%f5
	fabss	%f6,	%f10
loop_349:
	fmovsge	%icc,	%f12,	%f0
	lduh	[%l7 + 0x18],	%o1
	fmovdvc	%icc,	%f2,	%f12
	movleu	%icc,	%g7,	%l6
	fmovrslez	%l5,	%f11,	%f10
	fcmple32	%f10,	%f10,	%i2
	bge,pt	%icc,	loop_350
	fzeros	%f9
	fmovdcc	%xcc,	%f8,	%f6
	fbl,a	%fcc1,	loop_351
loop_350:
	brlz	%l0,	loop_352
	fbne,a	%fcc2,	loop_353
	ld	[%l7 + 0x70],	%f1
loop_351:
	bpos	loop_354
loop_352:
	fnot2	%f4,	%f10
loop_353:
	bg,a,pn	%xcc,	loop_355
	ldsw	[%l7 + 0x28],	%g1
loop_354:
	bvs,a,pn	%xcc,	loop_356
	edge32ln	%i6,	%i7,	%g5
loop_355:
	lduh	[%l7 + 0x66],	%i1
	edge8n	%i4,	%l3,	%i0
loop_356:
	bleu	loop_357
	ldsw	[%l7 + 0x38],	%o0
	movvs	%icc,	%o2,	%l1
	bpos,pt	%xcc,	loop_358
loop_357:
	fnot1	%f4,	%f0
	ba	%xcc,	loop_359
	fmul8x16al	%f3,	%f14,	%f10
loop_358:
	fmovdge	%xcc,	%f9,	%f9
	fmovsneg	%xcc,	%f1,	%f10
loop_359:
	bgu	loop_360
	movge	%icc,	%g3,	%o6
	umulcc	%i3,	0x1454,	%g2
	bgu,a,pn	%icc,	loop_361
loop_360:
	stx	%g6,	[%l7 + 0x40]
	fmovsvs	%icc,	%f12,	%f9
	fcmpgt32	%f14,	%f10,	%o3
loop_361:
	fmuld8sux16	%f1,	%f0,	%f10
	fbge	%fcc2,	loop_362
	fpadd16s	%f10,	%f2,	%f9
	bneg,a	loop_363
	fornot2	%f2,	%f12,	%f10
loop_362:
	fones	%f14
	fmovda	%icc,	%f9,	%f13
loop_363:
	bl,a,pn	%xcc,	loop_364
	stw	%i5,	[%l7 + 0x7C]
	lduh	[%l7 + 0x4C],	%o7
	fmovdvc	%icc,	%f4,	%f4
loop_364:
	fbo	%fcc2,	loop_365
	subcc	%o4,	%l4,	%g4
	fxnors	%f15,	%f7,	%f1
	fmovdg	%xcc,	%f7,	%f8
loop_365:
	movcs	%icc,	%o5,	%l2
	bpos,a,pn	%icc,	loop_366
	brnz	%o1,	loop_367
	stb	%l6,	[%l7 + 0x13]
	stb	%l5,	[%l7 + 0x0C]
loop_366:
	ldsh	[%l7 + 0x24],	%g7
loop_367:
	fmovsl	%icc,	%f11,	%f15
	fbo,a	%fcc0,	loop_368
	ldsh	[%l7 + 0x26],	%i2
	fsrc2s	%f1,	%f6
	lduh	[%l7 + 0x10],	%g1
loop_368:
	fmovrdne	%l0,	%f8,	%f14
	fbule	%fcc0,	loop_369
	fmuld8ulx16	%f4,	%f7,	%f2
	fmovdvc	%icc,	%f8,	%f6
	ldsh	[%l7 + 0x38],	%i7
loop_369:
	faligndata	%f6,	%f6,	%f0
	movg	%xcc,	%g5,	%i6
	brnz,a	%i4,	loop_370
	fmovrdlez	%i1,	%f2,	%f8
	brgz	%i0,	loop_371
	call	loop_372
loop_370:
	fors	%f3,	%f1,	%f13
	fmovda	%icc,	%f3,	%f2
loop_371:
	fble,a	%fcc1,	loop_373
loop_372:
	ba	%xcc,	loop_374
	fnors	%f15,	%f11,	%f0
	bcc,pt	%icc,	loop_375
loop_373:
	bneg,a	loop_376
loop_374:
	fmuld8sux16	%f8,	%f10,	%f6
	xnorcc	%l3,	0x16D9,	%o0
loop_375:
	fnot1	%f4,	%f8
loop_376:
	fmovs	%f0,	%f4
	ldsh	[%l7 + 0x24],	%o2
	bvc,a	%icc,	loop_377
	stw	%l1,	[%l7 + 0x7C]
	fmovrsne	%o6,	%f12,	%f1
	stx	%g3,	[%l7 + 0x48]
loop_377:
	ldub	[%l7 + 0x47],	%i3
	set  0x0, %l0
	setx loop_378, %l0, %l1
	jmpl %l1, %g2
	subcc	%o3,	0x019D,	%i5
	st	%f1,	[%l7 + 0x08]
	fcmple32	%f6,	%f14,	%o7
loop_378:
	fmovdl	%xcc,	%f3,	%f9
	fnegs	%f8,	%f14
	fmovscc	%icc,	%f12,	%f7
	st	%f7,	[%l7 + 0x34]
	bl,a,pt	%xcc,	loop_379
	srax	%o4,	0x1C,	%l4
	fmovsl	%icc,	%f11,	%f8
	bge,pn	%icc,	loop_380
loop_379:
	brgz,a	%g4,	loop_381
	fmovdgu	%xcc,	%f6,	%f6
	subc	%o5,	%l2,	%o1
loop_380:
	fnegs	%f14,	%f3
loop_381:
	edge32l	%g6,	%l6,	%l5
	fmovscs	%icc,	%f8,	%f12
	stb	%i2,	[%l7 + 0x49]
	bleu,a	loop_382
	ldd	[%l7 + 0x18],	%f14
	udivcc	%g1,	0x0DD9,	%l0
	ld	[%l7 + 0x44],	%f10
loop_382:
	fabsd	%f10,	%f8
	movcs	%icc,	%g7,	%g5
	ldub	[%l7 + 0x40],	%i6
	fnor	%f4,	%f4,	%f8
	ldx	[%l7 + 0x30],	%i4
	fands	%f9,	%f11,	%f8
	fornot1	%f4,	%f2,	%f4
	fmovsle	%xcc,	%f2,	%f1
	movle	%xcc,	%i1,	%i0
	ldsb	[%l7 + 0x0E],	%i7
	stx	%l3,	[%l7 + 0x30]
	edge16l	%o0,	%l1,	%o2
	fmul8x16au	%f15,	%f12,	%f6
	lduh	[%l7 + 0x32],	%g3
	fmovdpos	%xcc,	%f7,	%f11
	bne,pt	%xcc,	loop_383
	bg	%icc,	loop_384
	fba,a	%fcc2,	loop_385
	fand	%f8,	%f8,	%f14
loop_383:
	fble,a	%fcc0,	loop_386
loop_384:
	fmovrdne	%o6,	%f12,	%f12
loop_385:
	umul	%i3,	0x1385,	%o3
	fmovrdlz	%i5,	%f6,	%f14
loop_386:
	fmovdl	%icc,	%f6,	%f11
	ldx	[%l7 + 0x58],	%o7
	ldub	[%l7 + 0x67],	%o4
	fmovrsgz	%g2,	%f10,	%f7
	lduh	[%l7 + 0x3E],	%g4
	stb	%l4,	[%l7 + 0x41]
	fcmpgt32	%f10,	%f2,	%l2
	ldsh	[%l7 + 0x4A],	%o1
	fabsd	%f6,	%f2
	bn,pn	%xcc,	loop_387
	fnand	%f6,	%f14,	%f0
	bleu,a	%xcc,	loop_388
	brlz,a	%g6,	loop_389
loop_387:
	ldub	[%l7 + 0x12],	%l6
	ldsw	[%l7 + 0x38],	%o5
loop_388:
	lduh	[%l7 + 0x3E],	%l5
loop_389:
	fbue,a	%fcc0,	loop_390
	bgu,a,pt	%xcc,	loop_391
	fcmpgt16	%f4,	%f0,	%g1
	subccc	%l0,	0x1D07,	%i2
loop_390:
	ldd	[%l7 + 0x38],	%f12
loop_391:
	fbl,a	%fcc1,	loop_392
	fba,a	%fcc0,	loop_393
	fpadd16	%f8,	%f12,	%f0
	fabss	%f4,	%f11
loop_392:
	fnands	%f10,	%f10,	%f6
loop_393:
	bvc,pn	%xcc,	loop_394
	fmovscc	%xcc,	%f15,	%f2
	fbuge	%fcc3,	loop_395
	ld	[%l7 + 0x08],	%f12
loop_394:
	fandnot2s	%f9,	%f15,	%f15
	andcc	%g7,	0x064D,	%g5
loop_395:
	bpos,a	%icc,	loop_396
	fnot2s	%f3,	%f3
	bg,a,pt	%icc,	loop_397
	fbl	%fcc1,	loop_398
loop_396:
	fcmpne16	%f0,	%f2,	%i4
	fsrc1s	%f9,	%f0
loop_397:
	ldub	[%l7 + 0x3F],	%i6
loop_398:
	fpack16	%f2,	%f13
	udivx	%i1,	0x0043,	%i0
	bvc	loop_399
	fbug	%fcc0,	loop_400
	fmovrdlez	%l3,	%f2,	%f14
	bn,pt	%xcc,	loop_401
loop_399:
	st	%f1,	[%l7 + 0x50]
loop_400:
	fbo,a	%fcc2,	loop_402
	bgu,a	loop_403
loop_401:
	fmul8x16al	%f11,	%f9,	%f8
	bleu	%icc,	loop_404
loop_402:
	sdiv	%i7,	0x0029,	%l1
loop_403:
	fblg	%fcc3,	loop_405
	ba,a,pt	%icc,	loop_406
loop_404:
	smulcc	%o2,	0x12FC,	%g3
	alignaddr	%o0,	%o6,	%i3
loop_405:
	fmovsge	%icc,	%f10,	%f14
loop_406:
	ldub	[%l7 + 0x3F],	%i5
	fcmped	%fcc2,	%f12,	%f12
	ble,pt	%icc,	loop_407
	fnands	%f4,	%f12,	%f7
	ld	[%l7 + 0x30],	%f15
	fands	%f3,	%f6,	%f13
loop_407:
	edge16l	%o3,	%o4,	%g2
	alignaddr	%g4,	%o7,	%l4
	stx	%l2,	[%l7 + 0x50]
	sethi	0x10B6,	%o1
	fmovda	%icc,	%f10,	%f12
	fornot1s	%f2,	%f14,	%f7
	fcmpd	%fcc0,	%f0,	%f14
	srlx	%l6,	0x0C,	%g6
	fnot2	%f0,	%f2
	fnot1	%f4,	%f10
	ldd	[%l7 + 0x28],	%f10
	edge8ln	%l5,	%o5,	%l0
	bvs,a	%xcc,	loop_408
	fxors	%f1,	%f6,	%f7
	fornot2s	%f11,	%f10,	%f3
	movleu	%xcc,	%g1,	%g7
loop_408:
	edge32ln	%i2,	%i4,	%i6
	fmovsneg	%icc,	%f3,	%f12
	fnegs	%f11,	%f1
	sra	%g5,	0x04,	%i0
	bvs,a,pn	%icc,	loop_409
	lduw	[%l7 + 0x68],	%l3
	edge16	%i1,	%l1,	%i7
	fand	%f8,	%f12,	%f10
loop_409:
	lduh	[%l7 + 0x44],	%o2
	fpsub16	%f2,	%f0,	%f0
	udivcc	%o0,	0x0AAE,	%g3
	fpadd32s	%f9,	%f2,	%f0
	fmovscs	%xcc,	%f11,	%f12
	fble,a	%fcc2,	loop_410
	fsrc2s	%f10,	%f4
	srax	%o6,	%i5,	%i3
	stw	%o3,	[%l7 + 0x68]
loop_410:
	fmovsle	%icc,	%f5,	%f14
	fmovs	%f14,	%f3
	fnors	%f1,	%f6,	%f6
	fcmpeq32	%f2,	%f0,	%o4
	fmovrde	%g4,	%f2,	%f4
	fmovsn	%icc,	%f10,	%f6
	udivcc	%o7,	0x199C,	%g2
	fcmpd	%fcc2,	%f6,	%f8
	movrgz	%l2,	%o1,	%l6
	fabsd	%f0,	%f10
	bg,a,pt	%icc,	loop_411
	ldsw	[%l7 + 0x50],	%l4
	fmovsne	%xcc,	%f3,	%f15
	fmovdl	%xcc,	%f14,	%f10
loop_411:
	fbge,a	%fcc0,	loop_412
	fmovdg	%xcc,	%f6,	%f7
	bl,pt	%xcc,	loop_413
	popc	0x03D7,	%l5
loop_412:
	ldsb	[%l7 + 0x70],	%o5
	fmovdne	%xcc,	%f8,	%f13
loop_413:
	lduh	[%l7 + 0x36],	%l0
	umulcc	%g1,	%g7,	%i2
	std	%f10,	[%l7 + 0x08]
	st	%f3,	[%l7 + 0x68]
	bn	loop_414
	stw	%i4,	[%l7 + 0x2C]
	call	loop_415
	brgz	%i6,	loop_416
loop_414:
	movle	%icc,	%g5,	%i0
	fbuge,a	%fcc1,	loop_417
loop_415:
	fmovsvc	%xcc,	%f12,	%f10
loop_416:
	brnz	%l3,	loop_418
	ldsw	[%l7 + 0x7C],	%g6
loop_417:
	bg,pn	%xcc,	loop_419
	bgu,pn	%xcc,	loop_420
loop_418:
	fmovsn	%icc,	%f1,	%f12
	fbne,a	%fcc1,	loop_421
loop_419:
	fmovdne	%icc,	%f11,	%f4
loop_420:
	ldub	[%l7 + 0x79],	%i1
	fmovsleu	%icc,	%f8,	%f10
loop_421:
	brz	%i7,	loop_422
	bvs,a,pt	%xcc,	loop_423
	fandnot1s	%f5,	%f15,	%f11
	lduh	[%l7 + 0x48],	%o2
loop_422:
	st	%f10,	[%l7 + 0x74]
loop_423:
	fmovsleu	%xcc,	%f14,	%f1
	fcmpeq32	%f8,	%f10,	%l1
	bvc,pt	%xcc,	loop_424
	fcmpes	%fcc2,	%f1,	%f10
	mulscc	%g3,	%o6,	%i5
	bgu,a,pn	%xcc,	loop_425
loop_424:
	fcmpgt32	%f6,	%f10,	%o0
	fmul8x16au	%f2,	%f15,	%f2
	lduw	[%l7 + 0x4C],	%i3
loop_425:
	fmovs	%f9,	%f10
	ldsb	[%l7 + 0x65],	%o3
	fmovsne	%xcc,	%f7,	%f13
	fble	%fcc1,	loop_426
	bcc	loop_427
	fmovrdne	%g4,	%f10,	%f2
	ldsw	[%l7 + 0x34],	%o4
loop_426:
	lduh	[%l7 + 0x7E],	%g2
loop_427:
	ldsb	[%l7 + 0x3C],	%l2
	call	loop_428
	fmovsgu	%icc,	%f11,	%f13
	fbge	%fcc3,	loop_429
	bneg,a,pn	%icc,	loop_430
loop_428:
	movrgez	%o1,	0x330,	%l6
	fmovd	%f10,	%f14
loop_429:
	fcmpgt32	%f4,	%f6,	%o7
loop_430:
	brnz	%l5,	loop_431
	movcs	%icc,	%o5,	%l0
	lduh	[%l7 + 0x3A],	%l4
	fbuge	%fcc0,	loop_432
loop_431:
	fnors	%f14,	%f1,	%f11
	bcs	loop_433
	fbe,a	%fcc1,	loop_434
loop_432:
	ldsh	[%l7 + 0x48],	%g1
	fmovse	%xcc,	%f10,	%f14
loop_433:
	fmovrse	%g7,	%f7,	%f0
loop_434:
	movle	%xcc,	%i4,	%i6
	fmovdle	%xcc,	%f7,	%f14
	movrlz	%i2,	0x135,	%g5
	fxnor	%f2,	%f6,	%f10
	mulscc	%i0,	%g6,	%l3
	movpos	%icc,	%i7,	%i1
	ldub	[%l7 + 0x28],	%l1
	lduw	[%l7 + 0x24],	%o2
	edge16	%o6,	%g3,	%o0
	fornot2s	%f12,	%f10,	%f7
	ldd	[%l7 + 0x48],	%f6
	movrne	%i3,	%i5,	%g4
	set  0x0, %l0
	setx loop_435, %l0, %l1
	jmpl %l1, %o4
	fmul8x16al	%f13,	%f6,	%f14
	mulscc	%o3,	%l2,	%g2
	fmovsleu	%xcc,	%f4,	%f6
loop_435:
	fpack32	%f8,	%f4,	%f14
	sdivcc	%l6,	0x04D6,	%o1
	movneg	%icc,	%o7,	%o5
	fmovs	%f0,	%f8
	fandnot1s	%f10,	%f0,	%f4
	bleu,a	%xcc,	loop_436
	fnot1	%f6,	%f4
	and	%l5,	%l0,	%l4
	udivx	%g1,	0x064C,	%g7
loop_436:
	srax	%i6,	0x1B,	%i2
	srlx	%g5,	0x05,	%i4
	fble,a	%fcc3,	loop_437
	fpadd32	%f10,	%f12,	%f6
	fnands	%f15,	%f14,	%f12
	movrgez	%g6,	%l3,	%i0
loop_437:
	ldub	[%l7 + 0x33],	%i7
	andn	%l1,	0x0DAE,	%i1
	ldsh	[%l7 + 0x68],	%o2
	brz	%g3,	loop_438
	edge32ln	%o0,	%i3,	%o6
	movrgez	%g4,	%i5,	%o4
	alignaddr	%l2,	%o3,	%g2
loop_438:
	bcc	loop_439
	ldx	[%l7 + 0x68],	%o1
	faligndata	%f8,	%f2,	%f10
	fmovspos	%xcc,	%f4,	%f4
loop_439:
	ldub	[%l7 + 0x2D],	%o7
	fbne,a	%fcc3,	loop_440
	fmovsn	%icc,	%f15,	%f15
	movrne	%l6,	%l5,	%l0
	stw	%o5,	[%l7 + 0x38]
loop_440:
	stb	%l4,	[%l7 + 0x0A]
	brlz	%g1,	loop_441
	stb	%i6,	[%l7 + 0x58]
	fpadd16s	%f4,	%f7,	%f0
	fcmped	%fcc0,	%f0,	%f8
loop_441:
	fmovdl	%icc,	%f1,	%f13
	bpos	loop_442
	stx	%g7,	[%l7 + 0x08]
	bneg,pt	%xcc,	loop_443
	andn	%g5,	0x17B3,	%i2
loop_442:
	sth	%i4,	[%l7 + 0x58]
	fbe	%fcc0,	loop_444
loop_443:
	movle	%xcc,	%l3,	%i0
	bvc	loop_445
	fmuld8sux16	%f0,	%f7,	%f6
loop_444:
	ldsh	[%l7 + 0x4E],	%i7
	fmul8x16al	%f15,	%f6,	%f10
loop_445:
	fxnors	%f3,	%f11,	%f12
	bl,a,pt	%icc,	loop_446
	ldd	[%l7 + 0x10],	%f6
	srax	%l1,	%g6,	%o2
	fmul8x16al	%f8,	%f15,	%f4
loop_446:
	fcmpes	%fcc2,	%f2,	%f10
	srlx	%g3,	0x19,	%o0
	ldsh	[%l7 + 0x30],	%i3
	fnegd	%f8,	%f8
	fbule	%fcc0,	loop_447
	mova	%xcc,	%i1,	%g4
	fmul8x16au	%f11,	%f0,	%f0
	subccc	%o6,	%o4,	%i5
loop_447:
	fmovsneg	%icc,	%f11,	%f14
	fnot2	%f0,	%f2
	sth	%l2,	[%l7 + 0x72]
	andncc	%o3,	%o1,	%o7
	ldd	[%l7 + 0x78],	%f8
	sth	%g2,	[%l7 + 0x70]
	ba,a,pn	%xcc,	loop_448
	fnor	%f10,	%f10,	%f10
	brgz,a	%l5,	loop_449
	stx	%l0,	[%l7 + 0x70]
loop_448:
	fmovsvs	%icc,	%f1,	%f13
	fmovs	%f8,	%f6
loop_449:
	fbul	%fcc1,	loop_450
	subc	%l6,	%l4,	%g1
	fmovdg	%icc,	%f6,	%f2
	fmovs	%f5,	%f1
loop_450:
	umul	%i6,	0x1BE5,	%o5
	movg	%icc,	%g7,	%i2
	bgu,pt	%xcc,	loop_451
	fblg,a	%fcc1,	loop_452
	sth	%g5,	[%l7 + 0x7C]
	fnegs	%f3,	%f6
loop_451:
	bneg,a,pt	%xcc,	loop_453
loop_452:
	xnorcc	%l3,	%i4,	%i0
	bleu	loop_454
	brz	%l1,	loop_455
loop_453:
	fnors	%f9,	%f14,	%f4
	st	%f12,	[%l7 + 0x5C]
loop_454:
	subc	%i7,	%g6,	%g3
loop_455:
	fnors	%f4,	%f10,	%f12
	edge32ln	%o0,	%o2,	%i3
	edge16l	%i1,	%o6,	%g4
	movn	%icc,	%o4,	%l2
	bge,pt	%xcc,	loop_456
	umul	%o3,	0x117F,	%o1
	ldsh	[%l7 + 0x7C],	%o7
	fnor	%f12,	%f0,	%f14
loop_456:
	ldsh	[%l7 + 0x44],	%i5
	fmovdcc	%icc,	%f2,	%f7
	fpsub32	%f10,	%f2,	%f10
	fmovsgu	%xcc,	%f12,	%f6
	movrlez	%l5,	0x2F7,	%l0
	fsrc1	%f4,	%f6
	set  0x0, %l0
	setx loop_457, %l0, %l1
	jmpl %l1, %l6
	std	%f0,	[%l7 + 0x58]
	fbne,a	%fcc0,	loop_458
	or	%l4,	%g2,	%g1
loop_457:
	fcmpgt32	%f4,	%f6,	%o5
	fpack16	%f10,	%f14
loop_458:
	fpadd32s	%f10,	%f11,	%f6
	fba	%fcc2,	loop_459
	fbn,a	%fcc2,	loop_460
	fzeros	%f11
	fmovsl	%icc,	%f15,	%f12
loop_459:
	fmovscs	%icc,	%f1,	%f3
loop_460:
	fandnot1	%f8,	%f6,	%f4
	fnot2s	%f13,	%f5
	movge	%xcc,	%i6,	%g7
	fbe,a	%fcc1,	loop_461
	stb	%i2,	[%l7 + 0x5F]
	fmovsgu	%xcc,	%f5,	%f5
	stx	%g5,	[%l7 + 0x38]
loop_461:
	fmovsneg	%xcc,	%f14,	%f10
	stx	%l3,	[%l7 + 0x38]
	std	%f8,	[%l7 + 0x40]
	fmovsvc	%xcc,	%f8,	%f8
	ldd	[%l7 + 0x28],	%f4
	lduh	[%l7 + 0x6A],	%i4
	mulx	%l1,	0x0346,	%i0
	fmovdge	%icc,	%f10,	%f2
	fandnot2	%f0,	%f8,	%f0
	bvc	%xcc,	loop_462
	movne	%icc,	%i7,	%g3
	brgez	%o0,	loop_463
	movrlz	%o2,	0x15B,	%g6
loop_462:
	fcmpeq32	%f4,	%f0,	%i3
	fmovsleu	%icc,	%f8,	%f13
loop_463:
	fbl	%fcc0,	loop_464
	fpsub32s	%f4,	%f0,	%f12
	ldub	[%l7 + 0x7C],	%i1
	fcmpne16	%f12,	%f4,	%o6
loop_464:
	fmuld8sux16	%f2,	%f12,	%f8
	fbue	%fcc2,	loop_465
	fmovrsgez	%o4,	%f6,	%f13
	ldsw	[%l7 + 0x4C],	%l2
	sll	%g4,	0x07,	%o1
loop_465:
	fabss	%f9,	%f5
	mulscc	%o7,	%o3,	%i5
	movrgz	%l5,	0x28A,	%l0
	fmovdpos	%xcc,	%f2,	%f14
	fbn,a	%fcc2,	loop_466
	fbo	%fcc0,	loop_467
	fornot1	%f8,	%f8,	%f0
	bg	loop_468
loop_466:
	ldx	[%l7 + 0x40],	%l6
loop_467:
	fbule	%fcc2,	loop_469
	movleu	%xcc,	%g2,	%g1
loop_468:
	fmovsn	%icc,	%f9,	%f9
	fsrc1s	%f8,	%f4
loop_469:
	ldx	[%l7 + 0x48],	%o5
	addc	%i6,	0x0CFF,	%l4
	ldsh	[%l7 + 0x3C],	%i2
	fmul8x16	%f14,	%f0,	%f0
	sethi	0x0314,	%g5
	bg	%icc,	loop_470
	fornot1	%f14,	%f14,	%f0
	udiv	%g7,	0x1259,	%i4
	bcc,a,pn	%icc,	loop_471
loop_470:
	ldsb	[%l7 + 0x69],	%l1
	fble,a	%fcc2,	loop_472
	fsrc1	%f6,	%f6
loop_471:
	movpos	%icc,	%i0,	%l3
	fzeros	%f4
loop_472:
	xorcc	%i7,	0x0A62,	%g3
	udiv	%o2,	0x051B,	%g6
	ldsh	[%l7 + 0x56],	%i3
	brz	%o0,	loop_473
	stw	%o6,	[%l7 + 0x34]
	ld	[%l7 + 0x6C],	%f13
	lduh	[%l7 + 0x66],	%o4
loop_473:
	std	%f12,	[%l7 + 0x58]
	brz	%i1,	loop_474
	fcmpeq16	%f12,	%f14,	%l2
	bcs,pt	%xcc,	loop_475
	fabsd	%f4,	%f0
loop_474:
	stw	%g4,	[%l7 + 0x3C]
	fmovdpos	%icc,	%f15,	%f8
loop_475:
	st	%f15,	[%l7 + 0x78]
	alignaddrl	%o1,	%o7,	%o3
	ldsb	[%l7 + 0x77],	%i5
	faligndata	%f14,	%f4,	%f10
	lduw	[%l7 + 0x50],	%l0
	fbu,a	%fcc0,	loop_476
	fsrc1s	%f2,	%f7
	fmovsneg	%xcc,	%f3,	%f13
	or	%l6,	%g2,	%l5
loop_476:
	ldub	[%l7 + 0x4B],	%o5
	edge16	%i6,	%l4,	%i2
	ldsh	[%l7 + 0x68],	%g1
	brgz,a	%g7,	loop_477
	ldd	[%l7 + 0x08],	%f10
	fzeros	%f7
	fnot2	%f10,	%f0
loop_477:
	fand	%f8,	%f6,	%f12
	fblg,a	%fcc0,	loop_478
	ldsw	[%l7 + 0x4C],	%i4
	ble,pt	%icc,	loop_479
	fmovrdgz	%l1,	%f0,	%f14
loop_478:
	sll	%g5,	0x09,	%i0
	fmovsleu	%icc,	%f10,	%f15
loop_479:
	orcc	%l3,	0x193C,	%i7
	fmovsle	%icc,	%f13,	%f12
	fornot2s	%f3,	%f13,	%f1
	fbule,a	%fcc1,	loop_480
	fand	%f12,	%f14,	%f10
	fnot2	%f2,	%f0
	ld	[%l7 + 0x5C],	%f10
loop_480:
	edge32ln	%o2,	%g6,	%i3
	fnand	%f2,	%f12,	%f12
	bvc	loop_481
	fcmple32	%f4,	%f4,	%o0
	fmovde	%xcc,	%f4,	%f2
	srax	%o6,	0x14,	%g3
loop_481:
	fnand	%f10,	%f2,	%f2
	fsrc1	%f10,	%f6
	fmovdvs	%xcc,	%f10,	%f11
	ldd	[%l7 + 0x58],	%f6
	fmovrdlez	%i1,	%f2,	%f8
	std	%f2,	[%l7 + 0x58]
	fbe,a	%fcc3,	loop_482
	fmovrdgz	%o4,	%f14,	%f12
	mulx	%g4,	0x13CC,	%l2
	lduw	[%l7 + 0x20],	%o7
loop_482:
	andncc	%o3,	%i5,	%l0
	fmovdn	%icc,	%f2,	%f0
	ldsw	[%l7 + 0x1C],	%l6
	fnot2	%f8,	%f14
	sub	%g2,	%l5,	%o1
	fmul8x16al	%f11,	%f5,	%f4
	fmovrdgez	%i6,	%f10,	%f14
	bleu,a	loop_483
	stw	%o5,	[%l7 + 0x70]
	fmovsn	%xcc,	%f0,	%f11
	fnot2s	%f3,	%f13
loop_483:
	stw	%i2,	[%l7 + 0x58]
	bcc	%icc,	loop_484
	fxor	%f10,	%f0,	%f12
	for	%f8,	%f6,	%f2
	fmuld8ulx16	%f4,	%f12,	%f8
loop_484:
	stw	%l4,	[%l7 + 0x5C]
	fandnot1s	%f0,	%f5,	%f1
	fabss	%f1,	%f5
	ldsb	[%l7 + 0x33],	%g7
	fmovdcs	%xcc,	%f14,	%f14
	andcc	%i4,	%l1,	%g5
	fornot1	%f12,	%f8,	%f14
	ldsh	[%l7 + 0x0A],	%i0
	fornot1s	%f11,	%f15,	%f3
	fpadd32s	%f8,	%f4,	%f3
	umulcc	%g1,	0x116E,	%l3
	fbe,a	%fcc1,	loop_485
	bcs	loop_486
	fmovsneg	%icc,	%f11,	%f11
	lduh	[%l7 + 0x70],	%o2
loop_485:
	smulcc	%i7,	0x1AA3,	%g6
loop_486:
	stw	%i3,	[%l7 + 0x48]
	andncc	%o0,	%g3,	%i1
	edge8	%o4,	%g4,	%l2
	fcmpd	%fcc3,	%f6,	%f12
	fmovsge	%xcc,	%f1,	%f9
	fbule	%fcc2,	loop_487
	ldd	[%l7 + 0x18],	%f6
	fmovrslz	%o6,	%f5,	%f13
	fxnors	%f4,	%f12,	%f2
loop_487:
	fmovdvs	%xcc,	%f5,	%f11
	andncc	%o3,	%o7,	%l0
	bcs,pt	%icc,	loop_488
	ldsw	[%l7 + 0x5C],	%i5
	bge,a,pn	%xcc,	loop_489
	ldub	[%l7 + 0x66],	%g2
loop_488:
	xorcc	%l6,	%l5,	%i6
	st	%f8,	[%l7 + 0x5C]
loop_489:
	std	%f6,	[%l7 + 0x10]
	movge	%xcc,	%o1,	%i2
	fblg,a	%fcc0,	loop_490
	fbne	%fcc0,	loop_491
	stw	%o5,	[%l7 + 0x44]
	smulcc	%l4,	0x1400,	%g7
loop_490:
	fmovda	%xcc,	%f12,	%f10
loop_491:
	fbue,a	%fcc2,	loop_492
	ldsw	[%l7 + 0x24],	%i4
	brlez,a	%l1,	loop_493
	fands	%f11,	%f14,	%f0
loop_492:
	fabss	%f10,	%f2
	fcmped	%fcc0,	%f0,	%f8
loop_493:
	edge32n	%g5,	%g1,	%l3
	edge32ln	%o2,	%i0,	%i7
	umulcc	%g6,	0x0AB9,	%o0
	ldd	[%l7 + 0x58],	%f0
	std	%f0,	[%l7 + 0x60]
	subc	%i3,	%g3,	%o4
	be,a	%icc,	loop_494
	fbg,a	%fcc2,	loop_495
	fmovdpos	%icc,	%f10,	%f4
	fmovrslz	%g4,	%f6,	%f13
loop_494:
	fmovrdgez	%i1,	%f6,	%f4
loop_495:
	fcmped	%fcc2,	%f10,	%f10
	fabsd	%f8,	%f4
	bneg,pn	%xcc,	loop_496
	fpadd16s	%f14,	%f5,	%f14
	set  0x0, %l0
	setx loop_497, %l0, %l1
	jmpl %l1, %l2
	stx	%o3,	[%l7 + 0x20]
loop_496:
	fmovspos	%xcc,	%f0,	%f6
	udivx	%o7,	0x0215,	%o6
loop_497:
	ldsb	[%l7 + 0x4F],	%l0
	fmovrsgez	%i5,	%f8,	%f4
	fcmple32	%f2,	%f10,	%g2
	std	%f0,	[%l7 + 0x10]
	lduw	[%l7 + 0x08],	%l6
	bneg,a,pt	%icc,	loop_498
	ldd	[%l7 + 0x28],	%f4
	fornot1	%f6,	%f4,	%f0
	brnz	%i6,	loop_499
loop_498:
	fbg	%fcc3,	loop_500
	fpsub32	%f2,	%f10,	%f10
	fmovrde	%o1,	%f0,	%f6
loop_499:
	udivx	%i2,	0x033F,	%l5
loop_500:
	and	%o5,	0x1804,	%l4
	fmovse	%icc,	%f1,	%f12
	fbne,a	%fcc3,	loop_501
	lduw	[%l7 + 0x14],	%i4
	fcmpgt16	%f8,	%f8,	%g7
	fnor	%f4,	%f14,	%f6
loop_501:
	lduh	[%l7 + 0x08],	%g5
	movcs	%icc,	%l1,	%l3
	be,pt	%icc,	loop_502
	movrgez	%g1,	0x173,	%o2
	ldx	[%l7 + 0x58],	%i0
	fnot2	%f14,	%f12
loop_502:
	bcs	%icc,	loop_503
	fcmpes	%fcc3,	%f14,	%f5
	fba	%fcc0,	loop_504
	bn,a	loop_505
loop_503:
	sth	%i7,	[%l7 + 0x40]
	fpsub16s	%f2,	%f4,	%f10
loop_504:
	lduw	[%l7 + 0x50],	%o0
loop_505:
	fnot2	%f6,	%f6
	fcmpeq32	%f10,	%f4,	%g6
	fba	%fcc1,	loop_506
	fands	%f9,	%f0,	%f6
	smulcc	%g3,	0x1EC6,	%o4
	ldub	[%l7 + 0x53],	%g4
loop_506:
	movgu	%icc,	%i1,	%i3
	brgez,a	%l2,	loop_507
	ldd	[%l7 + 0x20],	%f8
	lduh	[%l7 + 0x64],	%o7
	bgu,a	loop_508
loop_507:
	fmovd	%f10,	%f10
	bn	%xcc,	loop_509
	movvs	%xcc,	%o6,	%o3
loop_508:
	fmovrsgez	%i5,	%f0,	%f7
	ldsw	[%l7 + 0x60],	%g2
loop_509:
	movrgz	%l0,	0x27B,	%l6
	ldd	[%l7 + 0x78],	%f12
	fornot1s	%f10,	%f10,	%f9
	bcc,pt	%xcc,	loop_510
	smul	%i6,	%i2,	%o1
	fcmple32	%f8,	%f4,	%o5
	stw	%l5,	[%l7 + 0x48]
loop_510:
	udiv	%i4,	0x004B,	%l4
	ldd	[%l7 + 0x20],	%f10
	ldd	[%l7 + 0x78],	%f12
	ld	[%l7 + 0x34],	%f6
	fmovscs	%icc,	%f8,	%f13
	fnands	%f2,	%f0,	%f0
	stx	%g5,	[%l7 + 0x30]
	lduh	[%l7 + 0x40],	%g7
	ldd	[%l7 + 0x30],	%f12
	movvc	%xcc,	%l1,	%g1
	bl,a	%icc,	loop_511
	fones	%f11
	andn	%l3,	0x0EAA,	%i0
	movrlez	%i7,	0x2B7,	%o2
loop_511:
	set  0x0, %l0
	setx loop_512, %l0, %l1
	jmpl %l1, %o0
	ldub	[%l7 + 0x78],	%g3
	fmovdcc	%xcc,	%f9,	%f9
	fmovsn	%xcc,	%f5,	%f10
loop_512:
	sth	%g6,	[%l7 + 0x5A]
	fmovdcc	%icc,	%f3,	%f5
	sth	%g4,	[%l7 + 0x68]
	fpack32	%f10,	%f10,	%f6
	bneg	loop_513
	brz	%i1,	loop_514
	stb	%o4,	[%l7 + 0x10]
	edge16n	%l2,	%i3,	%o6
loop_513:
	ldub	[%l7 + 0x11],	%o3
loop_514:
	ldd	[%l7 + 0x20],	%f12
	fbne	%fcc2,	loop_515
	stx	%o7,	[%l7 + 0x30]
	edge32ln	%g2,	%l0,	%i5
	orcc	%i6,	%i2,	%o1
loop_515:
	popc	%l6,	%o5
	stx	%l5,	[%l7 + 0x68]
	ldsb	[%l7 + 0x79],	%l4
	ld	[%l7 + 0x30],	%f0
	movrlez	%i4,	%g5,	%g7
	fnands	%f0,	%f5,	%f3
	ldsh	[%l7 + 0x6E],	%l1
	bn,a,pn	%xcc,	loop_516
	orn	%g1,	0x015D,	%l3
	movn	%icc,	%i7,	%i0
	ldsw	[%l7 + 0x2C],	%o0
loop_516:
	edge32n	%g3,	%g6,	%o2
	ldd	[%l7 + 0x18],	%f2
	fmovdneg	%icc,	%f4,	%f0
	lduh	[%l7 + 0x44],	%g4
	fsrc2s	%f9,	%f8
	fmovsne	%xcc,	%f7,	%f3
	sth	%o4,	[%l7 + 0x52]
	ld	[%l7 + 0x10],	%f9
	movgu	%icc,	%l2,	%i1
	fmovs	%f9,	%f10
	addcc	%i3,	%o3,	%o7
	movle	%xcc,	%g2,	%l0
	ldsh	[%l7 + 0x42],	%o6
	andcc	%i6,	0x1429,	%i5
	fblg	%fcc3,	loop_517
	andcc	%i2,	%l6,	%o1
	ldsb	[%l7 + 0x4A],	%l5
	fone	%f8
loop_517:
	bge	loop_518
	sdiv	%o5,	0x183B,	%l4
	ldub	[%l7 + 0x74],	%i4
	fmovsge	%icc,	%f12,	%f14
loop_518:
	ldsb	[%l7 + 0x1E],	%g7
	fmovsg	%icc,	%f15,	%f10
	fblg	%fcc0,	loop_519
	fmovdvs	%xcc,	%f13,	%f7
	fpsub16s	%f11,	%f12,	%f12
	edge16n	%l1,	%g1,	%l3
loop_519:
	alignaddr	%g5,	%i7,	%o0
	fornot1	%f12,	%f10,	%f0
	fblg	%fcc3,	loop_520
	fnot2	%f2,	%f10
	bpos,a,pt	%icc,	loop_521
	fbn	%fcc1,	loop_522
loop_520:
	fmovrdgz	%g3,	%f0,	%f2
	movpos	%icc,	%i0,	%g6
loop_521:
	bne	%icc,	loop_523
loop_522:
	fbuge	%fcc0,	loop_524
	fcmpne32	%f4,	%f2,	%g4
	movge	%icc,	%o2,	%o4
loop_523:
	ld	[%l7 + 0x6C],	%f8
loop_524:
	ble,pt	%icc,	loop_525
	umulcc	%l2,	0x0CA1,	%i1
	fcmpne32	%f14,	%f4,	%o3
	ldx	[%l7 + 0x20],	%o7
loop_525:
	bg,a	%xcc,	loop_526
	edge16	%g2,	%i3,	%o6
	bneg,a	%icc,	loop_527
	ldx	[%l7 + 0x28],	%l0
loop_526:
	fpadd16	%f0,	%f4,	%f0
	smul	%i6,	%i5,	%l6
loop_527:
	stw	%i2,	[%l7 + 0x60]
	lduh	[%l7 + 0x70],	%o1
	ldd	[%l7 + 0x20],	%f0
	fxnors	%f8,	%f1,	%f4
	ldd	[%l7 + 0x38],	%f10
	andcc	%l5,	%o5,	%i4
	fmovrse	%l4,	%f12,	%f6
	ba,a	loop_528
	fcmpeq32	%f0,	%f2,	%g7
	fandnot2s	%f0,	%f11,	%f10
	subcc	%l1,	%l3,	%g1
loop_528:
	lduw	[%l7 + 0x54],	%i7
	fnors	%f3,	%f10,	%f1
	brlez	%o0,	loop_529
	stw	%g5,	[%l7 + 0x30]
	fmovrslez	%i0,	%f13,	%f15
	fpadd32	%f14,	%f0,	%f0
loop_529:
	bpos,a,pt	%icc,	loop_530
	st	%f11,	[%l7 + 0x2C]
	fmovsl	%xcc,	%f15,	%f9
	movg	%icc,	%g3,	%g4
loop_530:
	fandnot2	%f0,	%f14,	%f14
	bvs,pn	%xcc,	loop_531
	stx	%o2,	[%l7 + 0x60]
	bne	%xcc,	loop_532
	brgz	%g6,	loop_533
loop_531:
	fbue,a	%fcc3,	loop_534
	movrne	%l2,	%o4,	%o3
loop_532:
	ldub	[%l7 + 0x4C],	%o7
loop_533:
	srax	%g2,	0x1D,	%i1
loop_534:
	fmovdg	%icc,	%f2,	%f12
	movneg	%xcc,	%o6,	%l0
	ldsw	[%l7 + 0x60],	%i3
	ldub	[%l7 + 0x7C],	%i6
	ldsb	[%l7 + 0x5D],	%i5
	fbue	%fcc3,	loop_535
	xorcc	%l6,	0x1A46,	%o1
	bpos,pn	%xcc,	loop_536
	or	%l5,	%o5,	%i4
loop_535:
	ldsh	[%l7 + 0x74],	%i2
	fmovsvc	%xcc,	%f6,	%f0
loop_536:
	add	%l4,	0x0D47,	%l1
	fmovrdne	%g7,	%f12,	%f8
	andn	%l3,	%g1,	%i7
	fmovdgu	%icc,	%f8,	%f11
	movn	%icc,	%o0,	%g5
	orcc	%i0,	0x092E,	%g3
	fmovrdlez	%o2,	%f2,	%f4
	fornot1s	%f15,	%f2,	%f6
	fandnot1s	%f9,	%f13,	%f6
	fmovdpos	%xcc,	%f3,	%f1
	fornot1	%f6,	%f14,	%f8
	fmovrslz	%g4,	%f15,	%f7
	fmovsg	%icc,	%f11,	%f11
	bvc,pt	%xcc,	loop_537
	stx	%l2,	[%l7 + 0x18]
	fnegd	%f10,	%f10
	movvc	%icc,	%o4,	%o3
loop_537:
	fbue,a	%fcc0,	loop_538
	ldsw	[%l7 + 0x2C],	%g6
	bneg,pt	%xcc,	loop_539
	movvc	%xcc,	%o7,	%g2
loop_538:
	bvc	loop_540
	ldsh	[%l7 + 0x40],	%o6
loop_539:
	fxnors	%f9,	%f11,	%f7
	add	%l0,	%i1,	%i3
loop_540:
	sdivx	%i6,	0x1C96,	%i5
	fpadd16s	%f14,	%f6,	%f2
	brz,a	%o1,	loop_541
	brz	%l5,	loop_542
	call	loop_543
	fmovsl	%icc,	%f13,	%f8
loop_541:
	sth	%o5,	[%l7 + 0x56]
loop_542:
	bn,a	%xcc,	loop_544
loop_543:
	fmovsl	%icc,	%f5,	%f8
	fpsub16s	%f12,	%f4,	%f9
	fpadd32	%f6,	%f12,	%f10
loop_544:
	ldd	[%l7 + 0x30],	%f6
	fmul8x16au	%f11,	%f1,	%f0
	fbuge	%fcc3,	loop_545
	fmovrdgez	%l6,	%f0,	%f0
	ldsb	[%l7 + 0x78],	%i4
	ldsb	[%l7 + 0x4A],	%i2
loop_545:
	fnegs	%f14,	%f8
	brlz,a	%l4,	loop_546
	sth	%l1,	[%l7 + 0x3C]
	lduw	[%l7 + 0x08],	%l3
	stb	%g1,	[%l7 + 0x35]
loop_546:
	mulx	%g7,	0x1BD1,	%i7
	faligndata	%f10,	%f2,	%f4
	fbne,a	%fcc2,	loop_547
	movle	%xcc,	%g5,	%o0
	fnand	%f10,	%f8,	%f10
	fand	%f4,	%f2,	%f0
loop_547:
	lduh	[%l7 + 0x0A],	%i0
	mulx	%o2,	0x12DD,	%g4
	fabss	%f3,	%f7
	fsrc1	%f14,	%f4
	fnands	%f11,	%f9,	%f10
	movre	%g3,	%o4,	%l2
	sll	%g6,	0x18,	%o3
	fbge	%fcc2,	loop_548
	xor	%g2,	0x1118,	%o6
	fbug,a	%fcc0,	loop_549
	fornot1s	%f1,	%f13,	%f4
loop_548:
	ldsh	[%l7 + 0x0C],	%l0
	fbuge,a	%fcc1,	loop_550
loop_549:
	fmovdge	%icc,	%f5,	%f5
	stb	%i1,	[%l7 + 0x6B]
	fmovrse	%i3,	%f1,	%f3
loop_550:
	fnors	%f10,	%f6,	%f5
	brz,a	%o7,	loop_551
	fnands	%f10,	%f11,	%f4
	fmovsle	%icc,	%f13,	%f9
	fcmps	%fcc2,	%f1,	%f9
loop_551:
	fcmpgt16	%f12,	%f4,	%i6
	fmovse	%icc,	%f3,	%f4
	umul	%i5,	0x00B8,	%l5
	ldsw	[%l7 + 0x1C],	%o1
	bvs	%icc,	loop_552
	fmovsvs	%icc,	%f11,	%f8
	edge32n	%l6,	%o5,	%i4
	fmovde	%xcc,	%f4,	%f5
loop_552:
	fcmpgt32	%f14,	%f2,	%i2
	fmovdgu	%xcc,	%f9,	%f3
	fbul,a	%fcc0,	loop_553
	fba	%fcc1,	loop_554
	sth	%l1,	[%l7 + 0x68]
	fsrc2	%f12,	%f0
loop_553:
	ble,a,pt	%icc,	loop_555
loop_554:
	ldx	[%l7 + 0x68],	%l3
	orncc	%g1,	0x0BC3,	%g7
	fmovrslz	%i7,	%f6,	%f4
loop_555:
	fcmpes	%fcc1,	%f11,	%f15
	fbue,a	%fcc2,	loop_556
	bl	loop_557
	lduw	[%l7 + 0x0C],	%l4
	lduw	[%l7 + 0x38],	%g5
loop_556:
	ldd	[%l7 + 0x38],	%f6
loop_557:
	stx	%i0,	[%l7 + 0x18]
	bne,a,pn	%xcc,	loop_558
	fabsd	%f14,	%f4
	for	%f6,	%f6,	%f8
	bl,a,pt	%xcc,	loop_559
loop_558:
	edge32n	%o0,	%g4,	%g3
	ldx	[%l7 + 0x28],	%o4
	ldx	[%l7 + 0x50],	%l2
loop_559:
	fone	%f10
	lduh	[%l7 + 0x76],	%o2
	fandnot1	%f6,	%f12,	%f8
	fornot2s	%f13,	%f2,	%f12
	bgu,a,pt	%xcc,	loop_560
	fcmpeq16	%f14,	%f8,	%o3
	ld	[%l7 + 0x30],	%f13
	fzeros	%f11
loop_560:
	xnorcc	%g6,	0x19C5,	%o6
	stw	%l0,	[%l7 + 0x08]
	fcmpne16	%f10,	%f10,	%i1
	fnors	%f6,	%f9,	%f0
	movneg	%icc,	%i3,	%g2
	ldsw	[%l7 + 0x7C],	%i6
	fmul8sux16	%f12,	%f14,	%f4
	faligndata	%f6,	%f4,	%f0
	ldsh	[%l7 + 0x64],	%o7
	stx	%l5,	[%l7 + 0x58]
	fandnot2	%f10,	%f4,	%f10
	fcmpne16	%f8,	%f0,	%o1
	smulcc	%i5,	%l6,	%o5
	fbge,a	%fcc1,	loop_561
	fbne,a	%fcc1,	loop_562
	fbne,a	%fcc1,	loop_563
	lduh	[%l7 + 0x70],	%i2
loop_561:
	fnors	%f2,	%f4,	%f0
loop_562:
	fmovsleu	%xcc,	%f6,	%f14
loop_563:
	faligndata	%f4,	%f8,	%f14
	lduh	[%l7 + 0x46],	%l1
	brnz,a	%l3,	loop_564
	fmovsl	%xcc,	%f6,	%f4
	movvs	%icc,	%g1,	%g7
	brgez	%i4,	loop_565
loop_564:
	smulcc	%i7,	0x138B,	%g5
	fmovdl	%xcc,	%f14,	%f10
	fpadd32s	%f14,	%f2,	%f10
loop_565:
	bne	loop_566
	set  0x0, %l0
	setx loop_567, %l0, %l1
	jmpl %l1, %i0
	lduw	[%l7 + 0x44],	%l4
	fpack16	%f6,	%f13
loop_566:
	stw	%g4,	[%l7 + 0x70]
loop_567:
	sth	%o0,	[%l7 + 0x0E]
	bneg,pn	%xcc,	loop_568
	fmovse	%xcc,	%f13,	%f7
	ldsb	[%l7 + 0x36],	%g3
	fcmpne32	%f10,	%f12,	%o4
loop_568:
	bg,pt	%icc,	loop_569
	movleu	%icc,	%o2,	%l2
	fmovsg	%icc,	%f7,	%f9
	fmovrde	%o3,	%f8,	%f6
loop_569:
	fbue	%fcc2,	loop_570
	fxnors	%f6,	%f15,	%f9
	ldsh	[%l7 + 0x64],	%o6
	ld	[%l7 + 0x64],	%f4
loop_570:
	bneg,a	loop_571
	ldsb	[%l7 + 0x4A],	%l0
	ldsw	[%l7 + 0x1C],	%g6
	fnegd	%f14,	%f14
loop_571:
	addc	%i1,	%i3,	%i6
	std	%f8,	[%l7 + 0x40]
	fpadd16	%f4,	%f2,	%f8
	bne,a,pn	%icc,	loop_572
	movl	%icc,	%g2,	%l5
	ldsb	[%l7 + 0x3F],	%o7
	fmovde	%icc,	%f7,	%f5
loop_572:
	brz,a	%i5,	loop_573
	fandnot2	%f6,	%f2,	%f6
	fmovdgu	%icc,	%f4,	%f13
	stw	%o1,	[%l7 + 0x14]
loop_573:
	fmovdcs	%icc,	%f15,	%f13
	fornot2	%f6,	%f12,	%f2
	fandnot2s	%f4,	%f8,	%f2
	fcmpgt16	%f10,	%f6,	%o5
	fpadd32	%f0,	%f14,	%f8
	fmovs	%f10,	%f5
	fbne	%fcc2,	loop_574
	mulx	%l6,	0x1A1A,	%i2
	orn	%l3,	%g1,	%l1
	fcmpeq32	%f10,	%f2,	%i4
loop_574:
	fnot1s	%f1,	%f6
	fmovrdgz	%g7,	%f8,	%f14
	fmovdgu	%icc,	%f3,	%f1
	movvs	%xcc,	%i7,	%i0
	fbule	%fcc2,	loop_575
	fnegs	%f15,	%f0
	fmovrsgz	%l4,	%f3,	%f12
	fsrc2	%f14,	%f2
loop_575:
	fmovs	%f13,	%f4
	addc	%g5,	%g4,	%g3
	fmovrdne	%o4,	%f6,	%f14
	srax	%o0,	0x05,	%l2
	fandnot1s	%f8,	%f11,	%f2
	fmovrsne	%o2,	%f6,	%f7
	fmovdcs	%icc,	%f1,	%f6
	movvs	%icc,	%o6,	%o3
	fornot2s	%f15,	%f0,	%f1
	fcmpgt16	%f12,	%f0,	%l0
	ble,a	loop_576
	fabsd	%f6,	%f14
	lduh	[%l7 + 0x16],	%g6
	lduh	[%l7 + 0x14],	%i1
loop_576:
	move	%xcc,	%i6,	%g2
	fbule	%fcc1,	loop_577
	ld	[%l7 + 0x5C],	%f12
	bgu,a	%xcc,	loop_578
	edge8ln	%i3,	%o7,	%l5
loop_577:
	sth	%o1,	[%l7 + 0x10]
	fmovda	%xcc,	%f1,	%f7
loop_578:
	fbug	%fcc3,	loop_579
	smulcc	%o5,	0x1994,	%i5
	set  0x0, %l0
	setx loop_580, %l0, %l1
	jmpl %l1, %l6
	fmuld8sux16	%f0,	%f4,	%f14
loop_579:
	movrlz	%i2,	%g1,	%l1
	st	%f13,	[%l7 + 0x40]
loop_580:
	ldub	[%l7 + 0x12],	%i4
	ldd	[%l7 + 0x38],	%f8
	sth	%g7,	[%l7 + 0x20]
	xnorcc	%i7,	0x02EE,	%i0
	lduh	[%l7 + 0x48],	%l3
	fmovrse	%g5,	%f7,	%f11
	fornot2	%f14,	%f10,	%f0
	fabsd	%f12,	%f12
	subc	%g4,	0x1B61,	%g3
	xor	%o4,	%o0,	%l4
	fmovdge	%icc,	%f8,	%f13
	edge16ln	%l2,	%o6,	%o3
	ble,a,pn	%icc,	loop_581
	ld	[%l7 + 0x14],	%f3
	fabss	%f4,	%f14
	orn	%o2,	%l0,	%g6
loop_581:
	bg,a,pt	%icc,	loop_582
	fmovdl	%xcc,	%f8,	%f11
	orncc	%i1,	%g2,	%i3
	fornot2	%f0,	%f12,	%f12
loop_582:
	fmovrdlez	%o7,	%f14,	%f6
	addc	%l5,	%i6,	%o1
	edge8n	%o5,	%i5,	%i2
	fbuge,a	%fcc0,	loop_583
	bvs	loop_584
	brz	%g1,	loop_585
	andcc	%l1,	0x1090,	%i4
loop_583:
	for	%f0,	%f12,	%f4
loop_584:
	movre	%g7,	%l6,	%i0
loop_585:
	ldsh	[%l7 + 0x42],	%l3
	ldsw	[%l7 + 0x18],	%g5
	bneg,a,pn	%icc,	loop_586
	sdivx	%i7,	0x02BB,	%g4
	std	%f8,	[%l7 + 0x30]
	fmovsvc	%xcc,	%f2,	%f6
loop_586:
	fpackfix	%f8,	%f3
	fbue	%fcc0,	loop_587
	fmuld8ulx16	%f7,	%f4,	%f14
	fba,a	%fcc2,	loop_588
	movvc	%icc,	%o4,	%o0
loop_587:
	fbo,a	%fcc3,	loop_589
	movvs	%xcc,	%g3,	%l2
loop_588:
	sth	%o6,	[%l7 + 0x1E]
	fnot1s	%f12,	%f2
loop_589:
	stw	%o3,	[%l7 + 0x10]
	edge8	%o2,	%l0,	%g6
	fnors	%f4,	%f2,	%f4
	fmovdge	%icc,	%f1,	%f15
	bl,a	loop_590
	ba,pt	%xcc,	loop_591
	ble,a,pn	%icc,	loop_592
	ldsh	[%l7 + 0x3C],	%l4
loop_590:
	fmovrdlez	%i1,	%f14,	%f2
loop_591:
	stb	%g2,	[%l7 + 0x4A]
loop_592:
	fmovdle	%icc,	%f3,	%f13
	bcs	%icc,	loop_593
	fcmpes	%fcc2,	%f11,	%f15
	fmovsl	%icc,	%f7,	%f10
	ldsw	[%l7 + 0x58],	%i3
loop_593:
	srl	%o7,	0x10,	%i6
	subc	%l5,	%o5,	%i5
	orncc	%i2,	0x0229,	%o1
	fmovsl	%xcc,	%f4,	%f4
	faligndata	%f4,	%f10,	%f0
	ldx	[%l7 + 0x18],	%l1
	ldsh	[%l7 + 0x48],	%g1
	std	%f14,	[%l7 + 0x68]
	fmovsle	%xcc,	%f9,	%f2
	brnz	%g7,	loop_594
	ldub	[%l7 + 0x55],	%i4
	fble	%fcc2,	loop_595
	bl,a	loop_596
loop_594:
	fmovdleu	%icc,	%f9,	%f0
	fmovs	%f6,	%f11
loop_595:
	ldx	[%l7 + 0x48],	%i0
loop_596:
	st	%f14,	[%l7 + 0x2C]
	movrlz	%l3,	%g5,	%l6
	fba,a	%fcc1,	loop_597
	bneg,pt	%icc,	loop_598
	fmovsne	%icc,	%f5,	%f14
	fmovsg	%xcc,	%f7,	%f8
loop_597:
	bcs,pt	%xcc,	loop_599
loop_598:
	brgz	%i7,	loop_600
	srl	%o4,	0x0A,	%g4
	bl	%icc,	loop_601
loop_599:
	fnors	%f7,	%f6,	%f3
loop_600:
	fmovrdne	%g3,	%f10,	%f0
	fbu	%fcc2,	loop_602
loop_601:
	bne,a	%xcc,	loop_603
	fpack32	%f0,	%f12,	%f14
	add	%o0,	0x128C,	%l2
loop_602:
	fmovrsgz	%o6,	%f1,	%f0
loop_603:
	st	%f11,	[%l7 + 0x38]
	fornot2	%f14,	%f0,	%f6
	ldsb	[%l7 + 0x1E],	%o2
	fxors	%f12,	%f8,	%f12
	ld	[%l7 + 0x0C],	%f11
	fnors	%f12,	%f3,	%f13
	fpackfix	%f14,	%f14
	ld	[%l7 + 0x70],	%f0
	be	%xcc,	loop_604
	movrgez	%o3,	%g6,	%l0
	fmovsle	%icc,	%f2,	%f13
	move	%xcc,	%i1,	%l4
loop_604:
	ldd	[%l7 + 0x38],	%f0
	fzeros	%f15
	movl	%icc,	%g2,	%i3
	fmovrsgz	%i6,	%f10,	%f11
	std	%f0,	[%l7 + 0x08]
	set  0x0, %l0
	setx loop_605, %l0, %l1
	jmpl %l1, %l5
	fpadd16s	%f14,	%f7,	%f4
	brgz,a	%o7,	loop_606
	fmovrdgz	%i5,	%f0,	%f4
loop_605:
	fmovrslz	%i2,	%f15,	%f15
	fmovdg	%xcc,	%f12,	%f6
loop_606:
	ldsh	[%l7 + 0x76],	%o5
	srlx	%o1,	0x03,	%l1
	stw	%g1,	[%l7 + 0x38]
	ble,a	loop_607
	brgez,a	%i4,	loop_608
	fmovrde	%i0,	%f4,	%f10
	fnot1	%f4,	%f10
loop_607:
	fmovdvs	%icc,	%f12,	%f4
loop_608:
	movcs	%icc,	%g7,	%l3
	call	loop_609
	movvc	%xcc,	%l6,	%i7
	brgz,a	%o4,	loop_610
	fbe,a	%fcc2,	loop_611
loop_609:
	brz,a	%g4,	loop_612
	bcs	loop_613
loop_610:
	movrlez	%g5,	%o0,	%l2
loop_611:
	fmovsl	%icc,	%f9,	%f9
loop_612:
	fpackfix	%f8,	%f8
loop_613:
	movl	%icc,	%o6,	%g3
	fpsub32s	%f6,	%f0,	%f15
	brlz,a	%o2,	loop_614
	brlz	%o3,	loop_615
	ld	[%l7 + 0x54],	%f5
	fmovdleu	%xcc,	%f11,	%f11
loop_614:
	fcmpeq32	%f6,	%f2,	%g6
loop_615:
	fpsub16s	%f15,	%f4,	%f4
	ldsw	[%l7 + 0x48],	%i1
	fcmpeq32	%f8,	%f6,	%l4
	andncc	%l0,	%i3,	%g2
	st	%f10,	[%l7 + 0x2C]
	std	%f14,	[%l7 + 0x48]
	fornot1	%f14,	%f2,	%f4
	fbg,a	%fcc2,	loop_616
	fbu	%fcc0,	loop_617
	fmul8x16al	%f14,	%f12,	%f10
	fbe,a	%fcc1,	loop_618
loop_616:
	fnand	%f10,	%f2,	%f12
loop_617:
	fbug,a	%fcc3,	loop_619
	ldsh	[%l7 + 0x38],	%l5
loop_618:
	sth	%i6,	[%l7 + 0x6A]
	brnz	%i5,	loop_620
loop_619:
	fbe,a	%fcc3,	loop_621
	movgu	%xcc,	%i2,	%o5
	fcmpd	%fcc3,	%f14,	%f0
loop_620:
	fmovrse	%o7,	%f11,	%f0
loop_621:
	fbl	%fcc1,	loop_622
	movvc	%xcc,	%o1,	%l1
	move	%icc,	%g1,	%i0
	ld	[%l7 + 0x50],	%f9
loop_622:
	fxor	%f14,	%f8,	%f8
	ldsb	[%l7 + 0x28],	%i4
	edge32l	%l3,	%l6,	%g7
	srlx	%i7,	0x03,	%o4
	bge	%icc,	loop_623
	and	%g5,	%o0,	%g4
	ble,pt	%icc,	loop_624
	fmul8x16al	%f11,	%f1,	%f12
loop_623:
	movgu	%icc,	%o6,	%l2
	ldsh	[%l7 + 0x46],	%g3
loop_624:
	edge16ln	%o3,	%g6,	%o2
	fmovrsgz	%l4,	%f10,	%f12
	edge32n	%i1,	%i3,	%g2
	brgez,a	%l5,	loop_625
	fpadd32s	%f4,	%f15,	%f3
	fbl,a	%fcc2,	loop_626
	fmovdpos	%icc,	%f9,	%f13
loop_625:
	fmovsvc	%icc,	%f6,	%f4
	bge	loop_627
loop_626:
	fornot1s	%f0,	%f14,	%f10
	fmovrse	%l0,	%f6,	%f9
	ba	%icc,	loop_628
loop_627:
	fnot2	%f0,	%f0
	fmul8sux16	%f10,	%f0,	%f14
	fandnot2	%f14,	%f12,	%f2
loop_628:
	ldsh	[%l7 + 0x1C],	%i5
	edge8	%i2,	%i6,	%o5
	fpadd32	%f4,	%f8,	%f12
	fmovrdgez	%o1,	%f2,	%f6
	fbug,a	%fcc1,	loop_629
	ldsb	[%l7 + 0x4B],	%l1
	sth	%g1,	[%l7 + 0x48]
	fmovrslez	%o7,	%f4,	%f14
loop_629:
	ldsh	[%l7 + 0x2A],	%i0
	fmovsl	%xcc,	%f1,	%f15
	bleu,pt	%icc,	loop_630
	bcs,a,pt	%icc,	loop_631
	subccc	%i4,	%l6,	%l3
	ldd	[%l7 + 0x38],	%f10
loop_630:
	fmovrsne	%g7,	%f4,	%f14
loop_631:
	stx	%o4,	[%l7 + 0x20]
	fmovdpos	%xcc,	%f10,	%f13
	ld	[%l7 + 0x54],	%f13
	fmovdneg	%xcc,	%f10,	%f9
	brgz	%g5,	loop_632
	stb	%o0,	[%l7 + 0x2C]
	fnor	%f2,	%f6,	%f10
	fmovscc	%xcc,	%f3,	%f15
loop_632:
	lduw	[%l7 + 0x14],	%g4
	st	%f11,	[%l7 + 0x68]
	bg	%icc,	loop_633
	fmovsleu	%xcc,	%f14,	%f0
	st	%f3,	[%l7 + 0x20]
	ldx	[%l7 + 0x38],	%o6
loop_633:
	bleu,a,pn	%icc,	loop_634
	movl	%icc,	%i7,	%g3
	ldx	[%l7 + 0x78],	%o3
	edge16n	%l2,	%o2,	%l4
loop_634:
	lduw	[%l7 + 0x08],	%i1
	fcmpeq32	%f8,	%f0,	%i3
	bge	%icc,	loop_635
	fmovrdgz	%g2,	%f6,	%f0
	fblg,a	%fcc1,	loop_636
	fbul,a	%fcc3,	loop_637
loop_635:
	bgu,a,pt	%xcc,	loop_638
	movcs	%icc,	%l5,	%g6
loop_636:
	fble,a	%fcc2,	loop_639
loop_637:
	std	%f12,	[%l7 + 0x60]
loop_638:
	bneg,pn	%xcc,	loop_640
	ba	loop_641
loop_639:
	fmovrsne	%i5,	%f14,	%f2
	fmovrdgez	%i2,	%f0,	%f10
loop_640:
	move	%xcc,	%l0,	%i6
loop_641:
	bvc,a	loop_642
	ldd	[%l7 + 0x10],	%f8
	umulcc	%o1,	0x00A0,	%o5
	fmovrdgz	%g1,	%f2,	%f8
loop_642:
	movle	%xcc,	%l1,	%i0
	or	%o7,	%l6,	%i4
	movge	%icc,	%g7,	%o4
	fcmpgt16	%f10,	%f14,	%l3
	fmovdvs	%xcc,	%f13,	%f12
	bcc,a,pn	%icc,	loop_643
	ldsw	[%l7 + 0x48],	%o0
	sdiv	%g4,	0x158E,	%g5
	fcmpne32	%f14,	%f2,	%o6
loop_643:
	fpadd32	%f6,	%f6,	%f14
	ldsw	[%l7 + 0x6C],	%i7
	fmovrsgz	%o3,	%f14,	%f0
	bcs,pt	%icc,	loop_644
	fmovrsgez	%l2,	%f15,	%f14
	fmovdvc	%icc,	%f4,	%f4
	fnot1	%f6,	%f2
loop_644:
	faligndata	%f4,	%f6,	%f2
	stx	%g3,	[%l7 + 0x60]
	fpadd16s	%f14,	%f2,	%f10
	stb	%o2,	[%l7 + 0x2A]
	stx	%l4,	[%l7 + 0x08]
	lduh	[%l7 + 0x26],	%i3
	sdiv	%i1,	0x0E76,	%g2
	ldx	[%l7 + 0x58],	%l5
	fcmpne32	%f12,	%f8,	%g6
	ba,pt	%icc,	loop_645
	move	%xcc,	%i5,	%i2
	fnot2	%f0,	%f6
	fcmple32	%f10,	%f0,	%i6
loop_645:
	fmovdcc	%xcc,	%f1,	%f15
	fmuld8sux16	%f11,	%f11,	%f4
	sub	%o1,	0x0F97,	%o5
	movcs	%icc,	%g1,	%l0
	fbule	%fcc0,	loop_646
	ldd	[%l7 + 0x70],	%f14
	sth	%l1,	[%l7 + 0x24]
	lduh	[%l7 + 0x32],	%o7
loop_646:
	st	%f7,	[%l7 + 0x2C]
	bcs,pt	%xcc,	loop_647
	sub	%l6,	%i0,	%i4
	fornot1	%f14,	%f8,	%f0
	std	%f6,	[%l7 + 0x50]
loop_647:
	fone	%f14
	brlez,a	%o4,	loop_648
	fmovs	%f12,	%f1
	stw	%g7,	[%l7 + 0x44]
	fmovdg	%xcc,	%f0,	%f3
loop_648:
	bg	loop_649
	sth	%o0,	[%l7 + 0x62]
	fsrc2	%f8,	%f4
	movgu	%icc,	%l3,	%g5
loop_649:
	fmovscc	%xcc,	%f13,	%f6
	lduh	[%l7 + 0x62],	%o6
	fmovdvc	%icc,	%f12,	%f3
	stx	%i7,	[%l7 + 0x10]
	fmovsneg	%xcc,	%f1,	%f12
	fandnot1s	%f11,	%f12,	%f1
	bleu	loop_650
	movpos	%xcc,	%g4,	%o3
	fmovdl	%xcc,	%f5,	%f6
	fmuld8sux16	%f2,	%f7,	%f8
loop_650:
	movl	%xcc,	%l2,	%o2
	fxors	%f15,	%f11,	%f13
	brlz	%l4,	loop_651
	fones	%f6
	fmovrsgz	%i3,	%f5,	%f8
	fcmple32	%f14,	%f0,	%g3
loop_651:
	fpsub32s	%f4,	%f11,	%f6
	fpack32	%f4,	%f2,	%f0
	edge8l	%i1,	%l5,	%g6
	movrlz	%i5,	0x2F4,	%g2
	lduh	[%l7 + 0x0C],	%i6
	sdivx	%o1,	0x0BA7,	%i2
	fmovsle	%icc,	%f10,	%f13
	fmovdvc	%icc,	%f3,	%f1
	orn	%o5,	0x19DD,	%l0
	fmovrde	%g1,	%f2,	%f4
	fmovrslz	%l1,	%f1,	%f7
	fxors	%f4,	%f6,	%f2
	fxors	%f2,	%f9,	%f4
	addccc	%o7,	%i0,	%l6
	ld	[%l7 + 0x44],	%f1
	fmovde	%icc,	%f12,	%f2
	fnand	%f8,	%f4,	%f8
	fxnors	%f5,	%f10,	%f9
	fands	%f3,	%f12,	%f5
	fmovrsgz	%o4,	%f8,	%f8
	lduh	[%l7 + 0x60],	%i4
	fmovsleu	%icc,	%f2,	%f14
	bcc,a,pn	%xcc,	loop_652
	addccc	%g7,	%o0,	%g5
	fmovrslez	%l3,	%f4,	%f0
	ldx	[%l7 + 0x08],	%o6
loop_652:
	srax	%g4,	0x0E,	%o3
	fmovscs	%icc,	%f10,	%f13
	lduw	[%l7 + 0x5C],	%i7
	sdivcc	%o2,	0x041A,	%l2
	fmovsl	%xcc,	%f8,	%f8
	fmul8sux16	%f12,	%f2,	%f6
	fmovdn	%xcc,	%f10,	%f12
	fpadd32	%f8,	%f0,	%f10
	brlez	%i3,	loop_653
	fcmpes	%fcc0,	%f7,	%f3
	movrgez	%l4,	0x245,	%g3
	std	%f0,	[%l7 + 0x30]
loop_653:
	stx	%i1,	[%l7 + 0x30]
	std	%f2,	[%l7 + 0x48]
	addcc	%l5,	%i5,	%g6
	ld	[%l7 + 0x58],	%f0
	fcmps	%fcc2,	%f8,	%f3
	fbug,a	%fcc2,	loop_654
	ldsw	[%l7 + 0x44],	%g2
	ldsb	[%l7 + 0x56],	%o1
	fbule,a	%fcc1,	loop_655
loop_654:
	fnor	%f12,	%f12,	%f4
	fbule,a	%fcc1,	loop_656
	brnz,a	%i6,	loop_657
loop_655:
	ldsh	[%l7 + 0x0A],	%o5
	xnorcc	%l0,	%i2,	%l1
loop_656:
	ldx	[%l7 + 0x18],	%o7
loop_657:
	fmovsge	%xcc,	%f2,	%f10
	ld	[%l7 + 0x5C],	%f15
	fmovse	%icc,	%f1,	%f1
	fcmpgt32	%f8,	%f4,	%g1
	fcmps	%fcc3,	%f9,	%f6
	lduh	[%l7 + 0x54],	%i0
	fmovrslez	%l6,	%f0,	%f9
	stw	%o4,	[%l7 + 0x24]
	and	%i4,	0x0D2E,	%g7
	fmovdge	%xcc,	%f3,	%f5
	bneg,a,pt	%icc,	loop_658
	fmovsvc	%xcc,	%f8,	%f3
	fabss	%f6,	%f1
	sdivcc	%o0,	0x00F4,	%g5
loop_658:
	fbuge	%fcc1,	loop_659
	movge	%xcc,	%o6,	%g4
	fmovda	%icc,	%f10,	%f14
	fnegs	%f6,	%f10
loop_659:
	brnz,a	%o3,	loop_660
	ld	[%l7 + 0x28],	%f9
	fsrc2	%f10,	%f4
	sth	%l3,	[%l7 + 0x34]
loop_660:
	lduw	[%l7 + 0x54],	%o2
	st	%f7,	[%l7 + 0x44]
	umul	%i7,	0x1801,	%i3
	ldsb	[%l7 + 0x18],	%l2
	fzeros	%f10
	fpadd16s	%f8,	%f4,	%f14
	movneg	%xcc,	%l4,	%g3
	fmul8x16au	%f15,	%f5,	%f14
	movrne	%l5,	%i5,	%i1
	fcmped	%fcc3,	%f2,	%f10
	fcmpes	%fcc0,	%f3,	%f6
	ldsh	[%l7 + 0x40],	%g2
	ldub	[%l7 + 0x31],	%g6
	fbuge,a	%fcc3,	loop_661
	brlez	%i6,	loop_662
	bpos,a,pt	%xcc,	loop_663
	fmul8x16au	%f3,	%f7,	%f2
loop_661:
	fmovdvc	%xcc,	%f3,	%f15
loop_662:
	fmovscs	%icc,	%f3,	%f5
loop_663:
	fmovrdlez	%o5,	%f6,	%f2
	movl	%xcc,	%o1,	%i2
	movrgz	%l1,	0x2F5,	%l0
	ldub	[%l7 + 0x5D],	%g1
	lduw	[%l7 + 0x4C],	%o7
	fmovde	%icc,	%f12,	%f7
	edge32l	%i0,	%l6,	%o4
	st	%f13,	[%l7 + 0x28]
	stx	%g7,	[%l7 + 0x08]
	fabss	%f13,	%f2
	st	%f14,	[%l7 + 0x78]
	fmovrslez	%o0,	%f14,	%f7
	fbg	%fcc0,	loop_664
	mova	%icc,	%g5,	%o6
	fmovdne	%xcc,	%f13,	%f2
	fandnot1s	%f13,	%f10,	%f11
loop_664:
	fcmpne16	%f4,	%f4,	%i4
	st	%f8,	[%l7 + 0x48]
	fbg,a	%fcc2,	loop_665
	fand	%f6,	%f6,	%f12
	fbug	%fcc3,	loop_666
	bge,a	%xcc,	loop_667
loop_665:
	fcmple16	%f6,	%f4,	%g4
	fmovscc	%icc,	%f10,	%f12
loop_666:
	fxnors	%f15,	%f13,	%f5
loop_667:
	fabsd	%f14,	%f12
	fmovrdgz	%l3,	%f6,	%f2
	fmovsvc	%icc,	%f0,	%f13
	fmovsleu	%xcc,	%f13,	%f12
	ble,a,pn	%xcc,	loop_668
	sdivcc	%o2,	0x09A8,	%i7
	ldub	[%l7 + 0x20],	%i3
	fsrc1s	%f8,	%f11
loop_668:
	fmul8x16	%f6,	%f2,	%f6
	alignaddrl	%o3,	%l4,	%l2
	fand	%f6,	%f6,	%f8
	fpsub16s	%f5,	%f12,	%f2
	fzeros	%f0
	orn	%l5,	0x1999,	%g3
	sethi	0x0028,	%i5
	srl	%i1,	%g6,	%g2
	move	%xcc,	%o5,	%i6
	edge16l	%o1,	%i2,	%l1
	fmovrsgez	%g1,	%f2,	%f8
	bl,pn	%icc,	loop_669
	fmovdleu	%icc,	%f9,	%f0
	fsrc2s	%f10,	%f6
	fnand	%f14,	%f8,	%f2
loop_669:
	fsrc2s	%f13,	%f10
	fcmps	%fcc2,	%f7,	%f5
	st	%f13,	[%l7 + 0x40]
	smulcc	%l0,	%o7,	%l6
	alignaddrl	%o4,	%g7,	%o0
	stb	%i0,	[%l7 + 0x12]
	fornot1	%f12,	%f12,	%f8
	fpsub32s	%f12,	%f7,	%f5
	sdivx	%o6,	0x152D,	%i4
	stb	%g5,	[%l7 + 0x7A]
	fmovrsgez	%g4,	%f6,	%f4
	movneg	%icc,	%l3,	%i7
	fcmpgt16	%f10,	%f14,	%i3
	fpsub16	%f6,	%f10,	%f8
	fxnors	%f10,	%f12,	%f5
	ldub	[%l7 + 0x27],	%o3
	fmovscc	%xcc,	%f4,	%f1
	smulcc	%l4,	%l2,	%l5
	sll	%g3,	%i5,	%i1
	bvs,pn	%icc,	loop_670
	brgz	%g6,	loop_671
	movn	%icc,	%o2,	%g2
	fmovrslz	%i6,	%f13,	%f3
loop_670:
	fbg,a	%fcc2,	loop_672
loop_671:
	fcmpne16	%f6,	%f2,	%o5
	stx	%i2,	[%l7 + 0x50]
	bn	loop_673
loop_672:
	edge32l	%o1,	%g1,	%l0
	ldub	[%l7 + 0x53],	%o7
	be,pn	%icc,	loop_674
loop_673:
	fpack32	%f2,	%f10,	%f6
	bleu,pn	%xcc,	loop_675
	brlez	%l1,	loop_676
loop_674:
	sdiv	%o4,	0x168D,	%g7
	fmovsne	%xcc,	%f10,	%f2
loop_675:
	bn,pt	%xcc,	loop_677
loop_676:
	std	%f6,	[%l7 + 0x20]
	sth	%o0,	[%l7 + 0x46]
	xnor	%i0,	0x0B90,	%o6
loop_677:
	sdivx	%i4,	0x0121,	%g5
	smulcc	%g4,	%l3,	%l6
	ldsb	[%l7 + 0x0C],	%i3
	addc	%o3,	0x10AA,	%i7
	stb	%l2,	[%l7 + 0x25]
	sethi	0x1BFD,	%l5
	bge	loop_678
	fbl	%fcc0,	loop_679
	ldx	[%l7 + 0x68],	%g3
	stb	%l4,	[%l7 + 0x0F]
loop_678:
	add	%i1,	%i5,	%o2
loop_679:
	fabsd	%f10,	%f14
	fmovdgu	%xcc,	%f8,	%f12
	edge16l	%g2,	%g6,	%o5
	xnor	%i6,	%i2,	%o1
	fmovsne	%xcc,	%f15,	%f0
	fmovdcs	%icc,	%f7,	%f9
	lduh	[%l7 + 0x58],	%l0
	sth	%o7,	[%l7 + 0x10]
	ld	[%l7 + 0x50],	%f4
	fbul	%fcc0,	loop_680
	fcmpes	%fcc1,	%f4,	%f11
	popc	0x0AF9,	%g1
	fmovsn	%icc,	%f6,	%f11
loop_680:
	ldd	[%l7 + 0x30],	%f14
	alignaddr	%o4,	%l1,	%o0
	fmovsn	%icc,	%f7,	%f10
	movcs	%xcc,	%g7,	%i0
	fmovsle	%icc,	%f14,	%f1
	fbo,a	%fcc1,	loop_681
	movpos	%icc,	%o6,	%g5
	ble,pn	%xcc,	loop_682
	bl,a,pn	%icc,	loop_683
loop_681:
	fbul,a	%fcc1,	loop_684
	fmovdgu	%xcc,	%f15,	%f14
loop_682:
	fnot2s	%f7,	%f12
loop_683:
	edge16l	%i4,	%g4,	%l6
loop_684:
	fmovd	%f6,	%f14
	fpadd16	%f14,	%f10,	%f12
	edge8l	%i3,	%o3,	%l3
	bgu,a	loop_685
	edge16n	%l2,	%l5,	%g3
	ldx	[%l7 + 0x38],	%l4
	ble,pt	%xcc,	loop_686
loop_685:
	lduh	[%l7 + 0x2E],	%i7
	brlz,a	%i5,	loop_687
	fmovrsgez	%o2,	%f0,	%f10
loop_686:
	andcc	%i1,	0x1E0A,	%g2
	fmovde	%icc,	%f8,	%f7
loop_687:
	lduh	[%l7 + 0x58],	%g6
	fnors	%f13,	%f11,	%f13
	movl	%icc,	%o5,	%i6
	xorcc	%i2,	%o1,	%o7
	alignaddrl	%l0,	%o4,	%l1
	ldsh	[%l7 + 0x1E],	%o0
	fands	%f2,	%f11,	%f11
	fmuld8sux16	%f5,	%f0,	%f0
	xorcc	%g7,	0x032F,	%i0
	ldsw	[%l7 + 0x34],	%o6
	fmovrslez	%g5,	%f12,	%f14
	ldub	[%l7 + 0x64],	%i4
	fbge	%fcc3,	loop_688
	smulcc	%g4,	%l6,	%i3
	edge16	%g1,	%l3,	%o3
	fbge,a	%fcc0,	loop_689
loop_688:
	brgz,a	%l2,	loop_690
	fmovsle	%icc,	%f6,	%f9
	fpsub16	%f10,	%f0,	%f4
loop_689:
	fbne,a	%fcc0,	loop_691
loop_690:
	srlx	%l5,	0x14,	%l4
	edge16l	%i7,	%g3,	%i5
	bn,a	%xcc,	loop_692
loop_691:
	fsrc1s	%f6,	%f7
	edge16	%i1,	%o2,	%g6
	fbo,a	%fcc1,	loop_693
loop_692:
	fmovrdgez	%o5,	%f8,	%f6
	fnegd	%f8,	%f12
	sllx	%i6,	0x02,	%i2
loop_693:
	fbl,a	%fcc0,	loop_694
	fsrc1s	%f5,	%f0
	fsrc1s	%f3,	%f9
	movneg	%icc,	%o1,	%o7
loop_694:
	fmovdneg	%icc,	%f13,	%f8
	fbge,a	%fcc2,	loop_695
	fmovsg	%icc,	%f9,	%f2
	xor	%l0,	0x15FE,	%o4
	sethi	0x093A,	%g2
loop_695:
	fmovsl	%xcc,	%f5,	%f5
	brnz	%l1,	loop_696
	fors	%f2,	%f12,	%f15
	bge,pn	%xcc,	loop_697
	brz,a	%g7,	loop_698
loop_696:
	stx	%o0,	[%l7 + 0x58]
	fcmple16	%f6,	%f4,	%o6
loop_697:
	fmovscc	%xcc,	%f14,	%f12
loop_698:
	fmovde	%icc,	%f4,	%f3
	call	loop_699
	fbue	%fcc3,	loop_700
	sth	%i0,	[%l7 + 0x42]
	bcc	loop_701
loop_699:
	addcc	%g5,	0x032C,	%i4
loop_700:
	fbu	%fcc0,	loop_702
	lduh	[%l7 + 0x2A],	%l6
loop_701:
	fones	%f4
	fcmpd	%fcc2,	%f4,	%f12
loop_702:
	fmovsn	%icc,	%f11,	%f11
	stx	%i3,	[%l7 + 0x68]
	fmovrslez	%g1,	%f8,	%f14
	sethi	0x138C,	%g4
	sra	%o3,	%l3,	%l2
	fmovdne	%xcc,	%f7,	%f14
	ldx	[%l7 + 0x18],	%l4
	edge8ln	%l5,	%g3,	%i5
	fcmpes	%fcc3,	%f14,	%f14
	sethi	0x1B5D,	%i1
	bn,a,pt	%icc,	loop_703
	andncc	%i7,	%o2,	%o5
	fmovdl	%xcc,	%f11,	%f8
	fbo	%fcc1,	loop_704
loop_703:
	brlz	%g6,	loop_705
	sdiv	%i2,	0x1A95,	%o1
	fmul8x16	%f12,	%f4,	%f6
loop_704:
	brgz	%i6,	loop_706
loop_705:
	fmovsn	%icc,	%f14,	%f0
	lduh	[%l7 + 0x6C],	%o7
	stw	%l0,	[%l7 + 0x64]
loop_706:
	bleu,a,pt	%xcc,	loop_707
	fmovrslez	%o4,	%f1,	%f8
	movcc	%icc,	%g2,	%l1
	fmovsvs	%xcc,	%f7,	%f5
loop_707:
	fxnors	%f9,	%f10,	%f13
	fcmpne32	%f6,	%f10,	%o0
	movvs	%icc,	%g7,	%o6
	fcmpeq32	%f2,	%f14,	%i0
	bcc,pt	%icc,	loop_708
	stx	%g5,	[%l7 + 0x28]
	ldsh	[%l7 + 0x20],	%i4
	fmovde	%xcc,	%f6,	%f3
loop_708:
	fzero	%f8
	fpack16	%f12,	%f10
	sdivx	%l6,	0x0FB7,	%i3
	bge,a	loop_709
	movneg	%xcc,	%g4,	%o3
	lduw	[%l7 + 0x6C],	%g1
	fmovsneg	%icc,	%f11,	%f2
loop_709:
	fmovsvc	%xcc,	%f8,	%f5
	fmovdvs	%icc,	%f2,	%f4
	orn	%l3,	0x178E,	%l2
	fpadd16s	%f1,	%f7,	%f6
	sethi	0x0CC4,	%l4
	ldsb	[%l7 + 0x6A],	%l5
	st	%f3,	[%l7 + 0x3C]
	fcmple16	%f8,	%f12,	%i5
	for	%f0,	%f2,	%f8
	movrne	%g3,	%i7,	%o2
	subc	%o5,	0x0148,	%i1
	fmovsl	%icc,	%f0,	%f4
	fors	%f4,	%f15,	%f1
	fcmpeq32	%f4,	%f14,	%g6
	ldsh	[%l7 + 0x52],	%o1
	fmovd	%f12,	%f6
	ldsh	[%l7 + 0x4C],	%i2
	lduh	[%l7 + 0x5E],	%i6
	fmovdleu	%xcc,	%f9,	%f13
	stx	%l0,	[%l7 + 0x08]
	move	%icc,	%o7,	%g2
	edge16ln	%l1,	%o4,	%o0
	fblg,a	%fcc2,	loop_710
	fmovdne	%xcc,	%f3,	%f3
	lduw	[%l7 + 0x08],	%o6
	fnor	%f8,	%f0,	%f14
loop_710:
	movrlez	%g7,	%g5,	%i0
	fmovdcc	%icc,	%f10,	%f13
	fba,a	%fcc0,	loop_711
	umulcc	%i4,	0x03DB,	%l6
	fmovsle	%xcc,	%f8,	%f6
	bg,pn	%icc,	loop_712
loop_711:
	fbuge	%fcc0,	loop_713
	fmovrslz	%i3,	%f15,	%f10
	fbu	%fcc3,	loop_714
loop_712:
	fnands	%f4,	%f6,	%f7
loop_713:
	brnz	%o3,	loop_715
	st	%f7,	[%l7 + 0x0C]
loop_714:
	bvc,a	%icc,	loop_716
	bn,a,pt	%xcc,	loop_717
loop_715:
	fmovspos	%xcc,	%f13,	%f4
	fbl,a	%fcc2,	loop_718
loop_716:
	subcc	%g4,	0x06D9,	%l3
loop_717:
	edge16	%g1,	%l2,	%l5
	movvc	%icc,	%i5,	%l4
loop_718:
	edge8ln	%g3,	%i7,	%o5
	fnot1	%f0,	%f2
	stx	%i1,	[%l7 + 0x68]
	fmovrsgz	%o2,	%f10,	%f7
	call	loop_719
	bn	loop_720
	fandnot2s	%f10,	%f11,	%f3
	fbul,a	%fcc1,	loop_721
loop_719:
	fmovrdne	%g6,	%f8,	%f6
loop_720:
	bcs,a	%xcc,	loop_722
	ldd	[%l7 + 0x50],	%f10
loop_721:
	smulcc	%o1,	0x132B,	%i2
	srl	%i6,	%o7,	%g2
loop_722:
	edge8l	%l0,	%o4,	%l1
	fmovrse	%o6,	%f15,	%f12
	ldx	[%l7 + 0x70],	%o0
	brlz	%g7,	loop_723
	ld	[%l7 + 0x20],	%f14
	lduw	[%l7 + 0x34],	%g5
	stw	%i0,	[%l7 + 0x58]
loop_723:
	fmovsge	%icc,	%f9,	%f14
	fmovrdne	%l6,	%f14,	%f2
	subc	%i4,	0x14AF,	%o3
	fcmpes	%fcc0,	%f2,	%f11
	edge32ln	%g4,	%i3,	%l3
	movneg	%xcc,	%g1,	%l2
	stb	%l5,	[%l7 + 0x4C]
	ld	[%l7 + 0x10],	%f5
	ld	[%l7 + 0x14],	%f2
	fmovsvc	%xcc,	%f4,	%f7
	movgu	%xcc,	%l4,	%g3
	fmovrslz	%i5,	%f3,	%f8
	fmovsne	%xcc,	%f6,	%f8
	stb	%i7,	[%l7 + 0x79]
	fcmpeq32	%f14,	%f4,	%o5
	orcc	%o2,	0x0715,	%i1
	alignaddrl	%o1,	%g6,	%i6
	addc	%o7,	0x0934,	%i2
	udiv	%g2,	0x16A6,	%o4
	bn,a	loop_724
	sth	%l0,	[%l7 + 0x70]
	mulscc	%o6,	0x1C4F,	%o0
	fbge,a	%fcc2,	loop_725
loop_724:
	fmul8x16al	%f13,	%f11,	%f0
	fnot1	%f10,	%f6
	fandnot2s	%f12,	%f11,	%f13
loop_725:
	fmovrsgez	%l1,	%f7,	%f13
	fmovdleu	%icc,	%f1,	%f4
	fcmpeq32	%f0,	%f4,	%g5
	fmovscc	%icc,	%f6,	%f10
	addcc	%i0,	0x1232,	%g7
	move	%xcc,	%i4,	%l6
	ldd	[%l7 + 0x48],	%f0
	lduw	[%l7 + 0x2C],	%g4
	fcmpeq16	%f12,	%f2,	%o3
	fors	%f15,	%f10,	%f14
	mulscc	%l3,	%i3,	%l2
	edge16n	%g1,	%l4,	%g3
	fcmpne32	%f8,	%f14,	%i5
	movge	%icc,	%l5,	%i7
	bvs	loop_726
	fmovrslez	%o2,	%f14,	%f15
	movvc	%xcc,	%i1,	%o1
	bge,pn	%xcc,	loop_727
loop_726:
	ldsb	[%l7 + 0x6E],	%o5
	std	%f6,	[%l7 + 0x70]
	srl	%i6,	0x02,	%g6
loop_727:
	fmovdl	%xcc,	%f8,	%f2
	fmovrdgez	%i2,	%f10,	%f6
	fbuge	%fcc0,	loop_728
	fpack16	%f10,	%f4
	fpack32	%f8,	%f10,	%f2
	fmul8x16au	%f5,	%f4,	%f8
loop_728:
	fbu,a	%fcc0,	loop_729
	lduw	[%l7 + 0x1C],	%g2
	movgu	%xcc,	%o7,	%o4
	brlz,a	%o6,	loop_730
loop_729:
	fbue	%fcc2,	loop_731
	bneg	loop_732
	st	%f7,	[%l7 + 0x28]
loop_730:
	fornot1s	%f4,	%f2,	%f14
loop_731:
	fbo	%fcc1,	loop_733
loop_732:
	movpos	%xcc,	%l0,	%l1
	fmovdpos	%icc,	%f0,	%f4
	popc	%o0,	%g5
loop_733:
	fmovdvs	%xcc,	%f5,	%f0
	fpsub16s	%f1,	%f8,	%f7
	fbul,a	%fcc1,	loop_734
	bne,a,pt	%icc,	loop_735
	lduh	[%l7 + 0x44],	%i0
	udivcc	%g7,	0x089E,	%l6
loop_734:
	fnors	%f6,	%f12,	%f14
loop_735:
	fmovscs	%xcc,	%f4,	%f7
	fmovdleu	%xcc,	%f7,	%f8
	sth	%i4,	[%l7 + 0x32]
	fbe	%fcc1,	loop_736
	fba,a	%fcc2,	loop_737
	st	%f11,	[%l7 + 0x40]
	andncc	%o3,	%g4,	%i3
loop_736:
	fmovse	%xcc,	%f8,	%f5
loop_737:
	call	loop_738
	ldsw	[%l7 + 0x44],	%l3
	fmovdvc	%icc,	%f7,	%f15
	popc	%g1,	%l4
loop_738:
	movpos	%xcc,	%l2,	%i5
	stw	%g3,	[%l7 + 0x08]
	fmovdle	%xcc,	%f5,	%f0
	mova	%icc,	%l5,	%o2
	movcc	%xcc,	%i1,	%i7
	ld	[%l7 + 0x20],	%f6
	fbge	%fcc3,	loop_739
	edge16ln	%o5,	%i6,	%g6
	fmovrsgez	%i2,	%f1,	%f3
	stb	%g2,	[%l7 + 0x44]
loop_739:
	umul	%o7,	%o4,	%o6
	fornot2s	%f9,	%f8,	%f1
	faligndata	%f12,	%f10,	%f8
	subc	%l0,	%o1,	%l1
	fnors	%f8,	%f9,	%f10
	fmovsn	%icc,	%f3,	%f1
	srl	%o0,	%i0,	%g5
	ld	[%l7 + 0x60],	%f12
	brnz,a	%l6,	loop_740
	fmovspos	%icc,	%f1,	%f15
	fcmpne16	%f8,	%f10,	%i4
	fbug,a	%fcc3,	loop_741
loop_740:
	call	loop_742
	call	loop_743
	ldsb	[%l7 + 0x3F],	%g7
loop_741:
	fmovdn	%icc,	%f4,	%f8
loop_742:
	fnor	%f6,	%f6,	%f8
loop_743:
	add	%g4,	0x122E,	%i3
	fandnot2s	%f6,	%f0,	%f9
	fmovsne	%icc,	%f10,	%f15
	srlx	%o3,	0x1B,	%l3
	fand	%f2,	%f12,	%f8
	ldd	[%l7 + 0x08],	%f6
	brnz,a	%l4,	loop_744
	fmovrde	%l2,	%f12,	%f2
	fpack32	%f0,	%f14,	%f12
	fmul8x16au	%f11,	%f4,	%f2
loop_744:
	fbu	%fcc2,	loop_745
	std	%f2,	[%l7 + 0x58]
	sth	%i5,	[%l7 + 0x6E]
	sll	%g3,	%g1,	%l5
loop_745:
	fcmped	%fcc1,	%f8,	%f6
	faligndata	%f2,	%f2,	%f4
	bgu,pn	%xcc,	loop_746
	andncc	%i1,	%i7,	%o5
	fcmpeq16	%f6,	%f4,	%i6
	fmovdpos	%xcc,	%f3,	%f8
loop_746:
	fbl,a	%fcc3,	loop_747
	xor	%g6,	%o2,	%i2
	fnot1	%f4,	%f0
	fcmple32	%f14,	%f2,	%o7
loop_747:
	fabss	%f11,	%f14
	fsrc1	%f6,	%f12
	movcc	%icc,	%g2,	%o6
	stw	%o4,	[%l7 + 0x10]
	ldsh	[%l7 + 0x3E],	%o1
	stw	%l1,	[%l7 + 0x7C]
	fmovrdlz	%o0,	%f6,	%f2
	fcmped	%fcc3,	%f2,	%f6
	fones	%f1
	subcc	%l0,	0x13EC,	%g5
	fmuld8sux16	%f3,	%f6,	%f8
	fmovdvc	%icc,	%f4,	%f14
	std	%f10,	[%l7 + 0x20]
	fmovdn	%icc,	%f3,	%f13
	movrne	%l6,	0x12A,	%i0
	fmuld8ulx16	%f11,	%f3,	%f10
	fmovrsne	%i4,	%f7,	%f2
	edge32	%g4,	%i3,	%o3
	movge	%icc,	%l3,	%l4
	stb	%g7,	[%l7 + 0x40]
	sethi	0x1C9C,	%l2
	brlez	%i5,	loop_748
	xnorcc	%g3,	0x1032,	%l5
	fpadd32	%f8,	%f6,	%f8
	fmovrde	%g1,	%f12,	%f14
loop_748:
	fmovrsgez	%i7,	%f11,	%f4
	fpack32	%f0,	%f0,	%f6
	fbue	%fcc0,	loop_749
	fbo,a	%fcc0,	loop_750
	xorcc	%o5,	%i1,	%g6
	popc	%i6,	%o2
loop_749:
	addccc	%i2,	%g2,	%o7
loop_750:
	fpadd16	%f8,	%f10,	%f8
	fbul,a	%fcc3,	loop_751
	udivcc	%o6,	0x01AB,	%o1
	edge16l	%l1,	%o4,	%o0
	movn	%icc,	%l0,	%l6
loop_751:
	bl,a	%xcc,	loop_752
	fmovsg	%icc,	%f11,	%f11
	fcmpes	%fcc1,	%f3,	%f14
	fblg,a	%fcc3,	loop_753
loop_752:
	ldsw	[%l7 + 0x40],	%i0
	bl,a,pn	%xcc,	loop_754
	movrlez	%g5,	%i4,	%i3
loop_753:
	fsrc2	%f2,	%f8
	lduw	[%l7 + 0x18],	%o3
loop_754:
	bvc,a	%xcc,	loop_755
	fmovsvc	%icc,	%f8,	%f14
	fmovse	%xcc,	%f1,	%f5
	st	%f0,	[%l7 + 0x48]
loop_755:
	fmovsvs	%xcc,	%f10,	%f3
	fpsub16	%f12,	%f8,	%f2
	sethi	0x1F6C,	%g4
	fnors	%f2,	%f15,	%f8
	fmovdg	%xcc,	%f11,	%f9
	st	%f13,	[%l7 + 0x60]
	movn	%xcc,	%l3,	%g7
	umulcc	%l4,	%l2,	%g3
	orcc	%l5,	0x1148,	%i5
	fmovse	%icc,	%f14,	%f8
	bn	loop_756
	ldsh	[%l7 + 0x16],	%i7
	movpos	%icc,	%g1,	%o5
	sth	%i1,	[%l7 + 0x5E]
loop_756:
	udivx	%g6,	0x00B0,	%o2
	sdivcc	%i6,	0x1FDE,	%g2
	fmovsle	%xcc,	%f7,	%f6
	fmovdcs	%xcc,	%f8,	%f14
	orn	%o7,	0x1960,	%i2
	ld	[%l7 + 0x5C],	%f3
	fmovsgu	%icc,	%f1,	%f10
	edge16	%o6,	%o1,	%o4
	ld	[%l7 + 0x28],	%f1
	fcmpne32	%f0,	%f4,	%l1
	bn,pt	%icc,	loop_757
	ldx	[%l7 + 0x78],	%o0
	fcmpne32	%f10,	%f0,	%l6
	fpsub32s	%f15,	%f9,	%f2
loop_757:
	lduw	[%l7 + 0x1C],	%i0
	fpsub32	%f14,	%f2,	%f0
	std	%f6,	[%l7 + 0x10]
	stx	%g5,	[%l7 + 0x78]
	fabss	%f13,	%f5
	fbug,a	%fcc2,	loop_758
	fmovrslez	%l0,	%f7,	%f12
	fbne,a	%fcc0,	loop_759
	fbule,a	%fcc3,	loop_760
loop_758:
	fblg,a	%fcc2,	loop_761
	xnor	%i3,	0x02A1,	%i4
loop_759:
	fands	%f5,	%f14,	%f11
loop_760:
	brz,a	%o3,	loop_762
loop_761:
	lduw	[%l7 + 0x58],	%g4
	fmovdcs	%icc,	%f11,	%f2
	fcmple16	%f14,	%f2,	%l3
loop_762:
	bvs	%icc,	loop_763
	ldub	[%l7 + 0x3D],	%g7
	fxor	%f6,	%f8,	%f6
	fmovdg	%icc,	%f3,	%f9
loop_763:
	fmovrdlz	%l2,	%f8,	%f8
	movneg	%xcc,	%l4,	%l5
	bvs,a,pt	%xcc,	loop_764
	fmul8x16	%f8,	%f10,	%f12
	ldsw	[%l7 + 0x3C],	%i5
	lduw	[%l7 + 0x14],	%g3
loop_764:
	sth	%g1,	[%l7 + 0x66]
	lduw	[%l7 + 0x14],	%o5
	fands	%f13,	%f13,	%f13
	brlz,a	%i1,	loop_765
	fnor	%f4,	%f12,	%f6
	fbu,a	%fcc1,	loop_766
	movpos	%xcc,	%g6,	%i7
loop_765:
	fble	%fcc1,	loop_767
	fmuld8ulx16	%f7,	%f14,	%f0
loop_766:
	edge8l	%o2,	%i6,	%g2
	bcs,pn	%icc,	loop_768
loop_767:
	movcc	%icc,	%i2,	%o6
	fbl	%fcc2,	loop_769
	ldx	[%l7 + 0x40],	%o1
loop_768:
	fmovrdlz	%o4,	%f12,	%f8
	ldd	[%l7 + 0x20],	%f14
loop_769:
	mova	%xcc,	%l1,	%o7
	fmovdg	%xcc,	%f6,	%f6
	bleu,a	%xcc,	loop_770
	fbl,a	%fcc2,	loop_771
	fpack16	%f0,	%f5
	fbuge,a	%fcc3,	loop_772
loop_770:
	fornot2s	%f5,	%f15,	%f12
loop_771:
	fmul8sux16	%f0,	%f0,	%f14
	brgez,a	%l6,	loop_773
loop_772:
	ldd	[%l7 + 0x60],	%f8
	addc	%i0,	0x1A51,	%g5
	lduh	[%l7 + 0x0A],	%o0
loop_773:
	movneg	%icc,	%l0,	%i3
	addcc	%o3,	0x04BE,	%i4
	fornot1	%f14,	%f0,	%f8
	sethi	0x1DE4,	%g4
	fmovsl	%xcc,	%f6,	%f1
	sth	%l3,	[%l7 + 0x18]
	fone	%f14
	call	loop_774
	fcmple16	%f14,	%f8,	%g7
	brz	%l2,	loop_775
	ldsw	[%l7 + 0x60],	%l4
loop_774:
	bg,a,pt	%icc,	loop_776
	st	%f8,	[%l7 + 0x3C]
loop_775:
	fandnot1s	%f4,	%f5,	%f14
	fbo,a	%fcc1,	loop_777
loop_776:
	fand	%f12,	%f6,	%f4
	udivcc	%i5,	0x17E7,	%l5
	ldub	[%l7 + 0x3A],	%g3
loop_777:
	movleu	%xcc,	%g1,	%o5
	fbul,a	%fcc0,	loop_778
	fmovsneg	%icc,	%f7,	%f12
	fcmpeq32	%f4,	%f0,	%i1
	orn	%i7,	0x0E7F,	%o2
loop_778:
	movgu	%xcc,	%g6,	%g2
	fmovrde	%i2,	%f4,	%f2
	fmovdge	%xcc,	%f3,	%f9
	fmul8x16	%f6,	%f0,	%f2
	faligndata	%f6,	%f4,	%f0
	fpack16	%f8,	%f4
	ldub	[%l7 + 0x57],	%o6
	bg,pn	%xcc,	loop_779
	fbge,a	%fcc0,	loop_780
	fbuge,a	%fcc3,	loop_781
	mulscc	%i6,	0x0E1D,	%o1
loop_779:
	fornot2s	%f0,	%f5,	%f8
loop_780:
	fmul8sux16	%f0,	%f6,	%f6
loop_781:
	ldsh	[%l7 + 0x46],	%o4
	set  0x0, %l0
	setx loop_782, %l0, %l1
	jmpl %l1, %o7
	fmul8x16al	%f0,	%f14,	%f8
	st	%f14,	[%l7 + 0x30]
	lduw	[%l7 + 0x44],	%l6
loop_782:
	bge,pn	%xcc,	loop_783
	stw	%i0,	[%l7 + 0x3C]
	fpack32	%f8,	%f0,	%f8
	edge32l	%g5,	%l1,	%o0
loop_783:
	ldx	[%l7 + 0x10],	%i3
	fsrc2s	%f11,	%f5
	fornot1s	%f3,	%f0,	%f10
	sra	%o3,	%i4,	%l0
	fcmple16	%f10,	%f2,	%g4
	fmovdn	%icc,	%f0,	%f7
	sth	%g7,	[%l7 + 0x54]
	fbn	%fcc0,	loop_784
	fmovsl	%icc,	%f12,	%f14
	for	%f6,	%f10,	%f10
	fnegd	%f6,	%f12
loop_784:
	fmovrsgez	%l3,	%f7,	%f8
	fcmple32	%f12,	%f4,	%l4
	fmovdpos	%icc,	%f15,	%f0
	fcmple32	%f14,	%f12,	%i5
	fmovrsne	%l5,	%f3,	%f1
	fmul8x16	%f11,	%f10,	%f0
	sth	%l2,	[%l7 + 0x7E]
	fble,a	%fcc2,	loop_785
	bg	loop_786
	addccc	%g3,	0x1F7C,	%o5
	fble	%fcc3,	loop_787
loop_785:
	lduh	[%l7 + 0x7E],	%g1
loop_786:
	orn	%i1,	%i7,	%o2
	addcc	%g6,	%i2,	%o6
loop_787:
	bge,pt	%xcc,	loop_788
	fmovdleu	%xcc,	%f15,	%f2
	fcmpne32	%f6,	%f12,	%g2
	sth	%o1,	[%l7 + 0x4E]
loop_788:
	st	%f13,	[%l7 + 0x10]
	movneg	%xcc,	%o4,	%o7
	lduh	[%l7 + 0x62],	%i6
	fmovsne	%icc,	%f15,	%f14
	st	%f9,	[%l7 + 0x0C]
	movle	%icc,	%l6,	%g5
	fbug,a	%fcc0,	loop_789
	sth	%i0,	[%l7 + 0x42]
	ldd	[%l7 + 0x50],	%f12
	andncc	%o0,	%l1,	%i3
loop_789:
	fmuld8sux16	%f2,	%f4,	%f6
	movre	%o3,	0x290,	%l0
	udivcc	%g4,	0x1AC8,	%g7
	ldsb	[%l7 + 0x20],	%i4
	ldx	[%l7 + 0x20],	%l4
	lduw	[%l7 + 0x30],	%l3
	bcc,a,pn	%xcc,	loop_790
	orn	%i5,	%l2,	%l5
	std	%f8,	[%l7 + 0x40]
	fmuld8ulx16	%f2,	%f4,	%f4
loop_790:
	fmovrdgez	%o5,	%f4,	%f14
	ldsh	[%l7 + 0x16],	%g3
	movcc	%icc,	%i1,	%g1
	bg,pt	%xcc,	loop_791
	fmovdcc	%xcc,	%f13,	%f11
	sllx	%o2,	0x08,	%i7
	lduh	[%l7 + 0x46],	%i2
loop_791:
	ldx	[%l7 + 0x08],	%o6
	fcmple32	%f10,	%f0,	%g2
	fpadd32s	%f15,	%f2,	%f11
	ldx	[%l7 + 0x10],	%g6
	ldsb	[%l7 + 0x6D],	%o4
	ld	[%l7 + 0x08],	%f13
	subcc	%o1,	%o7,	%l6
	brgez	%g5,	loop_792
	subcc	%i0,	%o0,	%l1
	fmovsa	%icc,	%f7,	%f5
	edge8ln	%i6,	%i3,	%o3
loop_792:
	movrne	%g4,	0x378,	%l0
	fand	%f8,	%f4,	%f6
	ldub	[%l7 + 0x77],	%i4
	movn	%icc,	%l4,	%g7
	stx	%i5,	[%l7 + 0x50]
	be,a	loop_793
	fmovde	%xcc,	%f6,	%f14
	ldub	[%l7 + 0x7C],	%l2
	stx	%l5,	[%l7 + 0x10]
loop_793:
	fmuld8ulx16	%f2,	%f10,	%f2
	fmovsn	%xcc,	%f15,	%f7
	fmovdn	%icc,	%f13,	%f8
	bvc,a	loop_794
	fmovrsgez	%o5,	%f11,	%f13
	be,pn	%icc,	loop_795
	ldsh	[%l7 + 0x3A],	%g3
loop_794:
	ld	[%l7 + 0x5C],	%f5
	fand	%f12,	%f14,	%f0
loop_795:
	fcmpes	%fcc3,	%f11,	%f0
	sub	%i1,	0x1884,	%l3
	mulscc	%g1,	%i7,	%o2
	fmovdpos	%icc,	%f3,	%f11
	bcc	%xcc,	loop_796
	stx	%o6,	[%l7 + 0x40]
	edge32ln	%i2,	%g6,	%g2
	for	%f0,	%f12,	%f4
loop_796:
	fmovdvs	%icc,	%f3,	%f0
	fcmpgt16	%f12,	%f8,	%o4
	fmovrdgz	%o1,	%f12,	%f12
	lduh	[%l7 + 0x24],	%l6
	ldx	[%l7 + 0x48],	%o7
	fmovd	%f2,	%f0
	xorcc	%g5,	%i0,	%o0
	fabsd	%f0,	%f0
	fmovdne	%icc,	%f9,	%f9
	fpack16	%f0,	%f15
	bgu	%xcc,	loop_797
	fxnor	%f12,	%f12,	%f0
	edge32ln	%i6,	%l1,	%o3
	bl,a,pn	%xcc,	loop_798
loop_797:
	ldd	[%l7 + 0x08],	%f6
	movgu	%icc,	%g4,	%i3
	lduw	[%l7 + 0x28],	%l0
loop_798:
	for	%f0,	%f14,	%f6
	ld	[%l7 + 0x70],	%f5
	umul	%l4,	%g7,	%i5
	lduw	[%l7 + 0x18],	%l2
	bne,a,pn	%xcc,	loop_799
	movcs	%icc,	%l5,	%i4
	fmovdleu	%icc,	%f0,	%f2
	fbu,a	%fcc1,	loop_800
loop_799:
	movn	%xcc,	%g3,	%o5
	sth	%l3,	[%l7 + 0x16]
	ldsb	[%l7 + 0x64],	%g1
loop_800:
	ldsh	[%l7 + 0x24],	%i1
	fcmple32	%f14,	%f10,	%i7
	call	loop_801
	movn	%xcc,	%o2,	%i2
	srax	%o6,	0x1B,	%g6
	fnot1	%f2,	%f12
loop_801:
	fmovda	%icc,	%f9,	%f9
	brz	%o4,	loop_802
	fbug	%fcc0,	loop_803
	udiv	%g2,	0x1755,	%o1
	fxnor	%f4,	%f10,	%f10
loop_802:
	fmovrdne	%o7,	%f8,	%f0
loop_803:
	fmovrdgz	%l6,	%f2,	%f8
	fnands	%f15,	%f2,	%f5
	st	%f12,	[%l7 + 0x24]
	brgez,a	%i0,	loop_804
	bvc,a	loop_805
	fmovdne	%xcc,	%f7,	%f14
	bvc,pn	%icc,	loop_806
loop_804:
	ldsh	[%l7 + 0x48],	%o0
loop_805:
	lduh	[%l7 + 0x6C],	%g5
	fmuld8sux16	%f0,	%f3,	%f6
loop_806:
	brlez,a	%i6,	loop_807
	fnot2	%f6,	%f4
	movne	%xcc,	%o3,	%g4
	ldub	[%l7 + 0x6A],	%i3
loop_807:
	edge8l	%l1,	%l4,	%g7
	fmovspos	%icc,	%f13,	%f4
	fmovrdgz	%l0,	%f4,	%f14
	fpsub16s	%f2,	%f13,	%f6
	fpack32	%f0,	%f10,	%f6
	brgz,a	%i5,	loop_808
	stx	%l2,	[%l7 + 0x58]
	fmovs	%f10,	%f14
	sdivcc	%l5,	0x18F1,	%i4
loop_808:
	ld	[%l7 + 0x78],	%f9
	movcc	%icc,	%o5,	%g3
	andn	%g1,	0x1B5E,	%i1
	ldd	[%l7 + 0x70],	%f10
	smul	%l3,	%i7,	%i2
	fbn,a	%fcc1,	loop_809
	fbul,a	%fcc2,	loop_810
	fcmpd	%fcc3,	%f8,	%f12
	movle	%icc,	%o2,	%g6
loop_809:
	ble,a,pn	%xcc,	loop_811
loop_810:
	stw	%o4,	[%l7 + 0x78]
	fones	%f9
	fcmped	%fcc0,	%f6,	%f4
loop_811:
	fbge,a	%fcc2,	loop_812
	andncc	%o6,	%g2,	%o7
	fmovsn	%icc,	%f11,	%f0
	sth	%l6,	[%l7 + 0x2A]
loop_812:
	fmovsle	%xcc,	%f4,	%f7
	sll	%i0,	0x1C,	%o0
	fpsub16	%f8,	%f8,	%f14
	fcmps	%fcc2,	%f5,	%f10
	fnor	%f10,	%f0,	%f10
	fsrc2s	%f7,	%f6
	faligndata	%f10,	%f8,	%f12
	subcc	%g5,	%i6,	%o1
	sth	%o3,	[%l7 + 0x4A]
	ldd	[%l7 + 0x28],	%f2
	bpos,a	loop_813
	andn	%i3,	0x1601,	%g4
	ldsw	[%l7 + 0x6C],	%l4
	ldsb	[%l7 + 0x6A],	%g7
loop_813:
	fmovdg	%icc,	%f12,	%f5
	bneg	%icc,	loop_814
	sth	%l0,	[%l7 + 0x32]
	movrlez	%i5,	%l1,	%l2
	ldsh	[%l7 + 0x36],	%i4
loop_814:
	fcmpgt16	%f2,	%f12,	%o5
	fandnot1	%f4,	%f2,	%f2
	lduw	[%l7 + 0x70],	%g3
	bl,pn	%icc,	loop_815
	ble	loop_816
	ldd	[%l7 + 0x78],	%f2
	st	%f12,	[%l7 + 0x34]
loop_815:
	ld	[%l7 + 0x28],	%f7
loop_816:
	ld	[%l7 + 0x34],	%f15
	edge16ln	%g1,	%l5,	%l3
	ldx	[%l7 + 0x60],	%i1
	xnor	%i2,	%o2,	%i7
	udiv	%o4,	0x1A08,	%g6
	fcmpeq32	%f12,	%f12,	%o6
	stb	%o7,	[%l7 + 0x4E]
	lduh	[%l7 + 0x60],	%l6
	srl	%g2,	%i0,	%g5
	bcs,a	%xcc,	loop_817
	fcmpeq32	%f0,	%f14,	%i6
	fbn,a	%fcc1,	loop_818
	xnorcc	%o1,	0x1DC4,	%o3
loop_817:
	alignaddrl	%o0,	%i3,	%l4
	add	%g4,	0x0044,	%l0
loop_818:
	ldub	[%l7 + 0x33],	%g7
	movle	%icc,	%l1,	%l2
	fbge,a	%fcc2,	loop_819
	fmovsne	%xcc,	%f7,	%f6
	movl	%icc,	%i5,	%o5
	alignaddr	%g3,	%i4,	%g1
loop_819:
	sethi	0x0E2A,	%l3
	brgz,a	%i1,	loop_820
	mova	%icc,	%l5,	%o2
	stx	%i2,	[%l7 + 0x28]
	movg	%icc,	%o4,	%i7
loop_820:
	movne	%icc,	%g6,	%o7
	stw	%l6,	[%l7 + 0x64]
	andncc	%o6,	%i0,	%g5
	fand	%f4,	%f14,	%f12
	fbul	%fcc1,	loop_821
	brz,a	%g2,	loop_822
	fsrc2	%f0,	%f4
	stb	%i6,	[%l7 + 0x7A]
loop_821:
	fmovsle	%xcc,	%f4,	%f5
loop_822:
	fcmped	%fcc0,	%f4,	%f10
	ld	[%l7 + 0x58],	%f6
	srax	%o3,	0x08,	%o0
	fmovsn	%xcc,	%f3,	%f8
	mulscc	%o1,	%l4,	%g4
	fbuge	%fcc3,	loop_823
	st	%f10,	[%l7 + 0x44]
	movrgz	%i3,	%g7,	%l1
	ldsh	[%l7 + 0x0E],	%l2
loop_823:
	movge	%xcc,	%l0,	%i5
	bn	loop_824
	addc	%g3,	%i4,	%o5
	orncc	%l3,	%i1,	%l5
	ldd	[%l7 + 0x78],	%f6
loop_824:
	fcmpd	%fcc0,	%f12,	%f6
	ld	[%l7 + 0x58],	%f12
	movl	%icc,	%o2,	%i2
	fzeros	%f14
	ldsw	[%l7 + 0x78],	%o4
	fnegd	%f2,	%f2
	fpack16	%f12,	%f10
	ldd	[%l7 + 0x38],	%f8
	be,a,pn	%xcc,	loop_825
	st	%f14,	[%l7 + 0x50]
	edge16l	%g1,	%g6,	%i7
	fbn,a	%fcc3,	loop_826
loop_825:
	andncc	%l6,	%o6,	%o7
	fmovsvc	%icc,	%f12,	%f14
	bge,pt	%icc,	loop_827
loop_826:
	stw	%i0,	[%l7 + 0x50]
	stw	%g2,	[%l7 + 0x50]
	fnors	%f13,	%f10,	%f10
loop_827:
	bge,pn	%icc,	loop_828
	fbge	%fcc3,	loop_829
	ldd	[%l7 + 0x30],	%f10
	ldsb	[%l7 + 0x66],	%i6
loop_828:
	fmuld8sux16	%f9,	%f14,	%f2
loop_829:
	xor	%g5,	0x1AAC,	%o0
	fpack16	%f2,	%f1
	ldub	[%l7 + 0x36],	%o1
	std	%f14,	[%l7 + 0x48]
	ldx	[%l7 + 0x60],	%o3
	brnz	%g4,	loop_830
	ba,a,pn	%xcc,	loop_831
	umul	%i3,	0x0D6A,	%l4
	fmovsl	%xcc,	%f15,	%f0
loop_830:
	fcmpes	%fcc0,	%f5,	%f7
loop_831:
	fmovsneg	%xcc,	%f10,	%f13
	fbul,a	%fcc3,	loop_832
	fmovsvc	%icc,	%f5,	%f13
	fmovrslz	%g7,	%f6,	%f15
	fmul8x16al	%f3,	%f7,	%f8
loop_832:
	fnot2	%f14,	%f0
	fzero	%f8
	fmovrde	%l1,	%f6,	%f8
	bcc	loop_833
	stw	%l2,	[%l7 + 0x7C]
	fmovdg	%icc,	%f1,	%f9
	sdiv	%i5,	0x16DA,	%g3
loop_833:
	umulcc	%l0,	%o5,	%l3
	mulx	%i4,	%i1,	%o2
	edge8n	%l5,	%o4,	%i2
	fbg,a	%fcc3,	loop_834
	fnot2s	%f15,	%f1
	fnot2	%f14,	%f12
	fcmple32	%f12,	%f14,	%g1
loop_834:
	stw	%i7,	[%l7 + 0x3C]
	ldub	[%l7 + 0x0D],	%l6
	movvs	%icc,	%g6,	%o6
	edge32l	%o7,	%g2,	%i6
	fandnot1	%f6,	%f6,	%f14
	fandnot1s	%f9,	%f7,	%f5
	ldsb	[%l7 + 0x51],	%g5
	movn	%xcc,	%o0,	%o1
	fnand	%f12,	%f2,	%f0
	fnor	%f8,	%f0,	%f8
	sdivx	%o3,	0x12DE,	%i0
	stw	%i3,	[%l7 + 0x28]
	fmovdg	%icc,	%f4,	%f8
	fcmpeq32	%f6,	%f14,	%l4
	fnegs	%f14,	%f6
	fbul	%fcc1,	loop_835
	ble	loop_836
	fcmpd	%fcc2,	%f4,	%f6
	fmovspos	%icc,	%f9,	%f2
loop_835:
	ldub	[%l7 + 0x74],	%g4
loop_836:
	sethi	0x1417,	%l1
	fone	%f12
	st	%f9,	[%l7 + 0x20]
	fmovsvs	%icc,	%f0,	%f10
	ble	loop_837
	lduw	[%l7 + 0x54],	%l2
	movrgz	%i5,	%g7,	%l0
	ldsw	[%l7 + 0x3C],	%g3
loop_837:
	bgu,a	%icc,	loop_838
	fsrc1s	%f14,	%f12
	xor	%l3,	%i4,	%o5
	ld	[%l7 + 0x7C],	%f7
loop_838:
	fmovrdgez	%i1,	%f10,	%f4
	addcc	%o2,	%o4,	%i2
	fmovrslz	%g1,	%f9,	%f1
	subc	%i7,	0x0E19,	%l6
	fmovd	%f12,	%f0
	andncc	%g6,	%o6,	%o7
	stx	%l5,	[%l7 + 0x28]
	fba	%fcc3,	loop_839
	fpsub16	%f12,	%f6,	%f10
	fxnors	%f3,	%f7,	%f10
	fandnot2	%f4,	%f4,	%f6
loop_839:
	edge16ln	%i6,	%g2,	%g5
	fnot1	%f0,	%f2
	bvs,a,pt	%icc,	loop_840
	st	%f11,	[%l7 + 0x2C]
	sth	%o1,	[%l7 + 0x56]
	be,a,pt	%icc,	loop_841
loop_840:
	fmovsneg	%icc,	%f10,	%f6
	ldd	[%l7 + 0x78],	%f12
	fbug,a	%fcc0,	loop_842
loop_841:
	movrgz	%o0,	0x29F,	%i0
	bvs	%icc,	loop_843
	brgz	%i3,	loop_844
loop_842:
	fmovsvc	%icc,	%f5,	%f14
	fmovrsgez	%l4,	%f7,	%f4
loop_843:
	fmovdneg	%icc,	%f11,	%f5
loop_844:
	orn	%o3,	%l1,	%g4
	fcmpeq32	%f8,	%f8,	%i5
	fbug	%fcc2,	loop_845
	bcs	%icc,	loop_846
	mova	%xcc,	%g7,	%l0
	fmovdl	%xcc,	%f6,	%f0
loop_845:
	stx	%l2,	[%l7 + 0x18]
loop_846:
	ba,pn	%xcc,	loop_847
	edge8	%l3,	%i4,	%g3
	fandnot2s	%f15,	%f8,	%f4
	std	%f8,	[%l7 + 0x20]
loop_847:
	fnands	%f15,	%f8,	%f3
	fmovscc	%xcc,	%f9,	%f2
	std	%f4,	[%l7 + 0x08]
	ldsh	[%l7 + 0x26],	%o5
	fbule	%fcc2,	loop_848
	fxnors	%f10,	%f8,	%f10
	ldd	[%l7 + 0x78],	%f8
	movn	%xcc,	%i1,	%o2
loop_848:
	fcmps	%fcc3,	%f9,	%f13
	fmuld8sux16	%f11,	%f9,	%f10
	fandnot2	%f8,	%f6,	%f8
	ldub	[%l7 + 0x32],	%o4
	fmovrdgez	%i2,	%f2,	%f14
	bl,a,pt	%icc,	loop_849
	fba,a	%fcc0,	loop_850
	stw	%g1,	[%l7 + 0x4C]
	udivx	%i7,	0x0B34,	%l6
loop_849:
	fones	%f12
loop_850:
	fcmple32	%f4,	%f14,	%o6
	fmovsle	%icc,	%f3,	%f2
	subccc	%g6,	%o7,	%l5
	fble,a	%fcc3,	loop_851
	sra	%g2,	%i6,	%o1
	fand	%f12,	%f6,	%f14
	fbe	%fcc2,	loop_852
loop_851:
	brz,a	%o0,	loop_853
	stw	%g5,	[%l7 + 0x6C]
	brlz,a	%i3,	loop_854
loop_852:
	fcmpd	%fcc3,	%f6,	%f14
loop_853:
	fmul8x16al	%f3,	%f9,	%f10
	fornot2s	%f0,	%f1,	%f8
loop_854:
	stx	%l4,	[%l7 + 0x38]
	movre	%i0,	0x1C1,	%o3
	fbue,a	%fcc3,	loop_855
	lduh	[%l7 + 0x26],	%g4
	ldx	[%l7 + 0x60],	%i5
	be,a	%icc,	loop_856
loop_855:
	edge32ln	%g7,	%l0,	%l2
	lduh	[%l7 + 0x5C],	%l1
	bvs	%icc,	loop_857
loop_856:
	call	loop_858
	movrlez	%i4,	%l3,	%g3
	lduh	[%l7 + 0x78],	%i1
loop_857:
	fnot2	%f8,	%f12
loop_858:
	fblg,a	%fcc3,	loop_859
	fmovdne	%xcc,	%f7,	%f10
	fmovdneg	%xcc,	%f15,	%f1
	fmovdvs	%icc,	%f13,	%f10
loop_859:
	fabss	%f4,	%f10
	fbne,a	%fcc2,	loop_860
	fmovse	%xcc,	%f4,	%f14
	stw	%o2,	[%l7 + 0x14]
	fmovdne	%icc,	%f11,	%f15
loop_860:
	stw	%o4,	[%l7 + 0x58]
	movcc	%xcc,	%o5,	%i2
	alignaddrl	%i7,	%l6,	%o6
	ldsh	[%l7 + 0x3A],	%g1
	fcmpgt16	%f0,	%f4,	%g6
	edge32	%l5,	%g2,	%i6
	edge16l	%o1,	%o0,	%g5
	fsrc2	%f14,	%f10
	sth	%o7,	[%l7 + 0x18]
	fmovrse	%l4,	%f0,	%f10
	movrlz	%i3,	%i0,	%g4
	movle	%icc,	%o3,	%g7
	ldd	[%l7 + 0x68],	%f14
	ldd	[%l7 + 0x60],	%f2
	fmovd	%f10,	%f2
	edge32n	%i5,	%l0,	%l2
	lduh	[%l7 + 0x76],	%l1
	orn	%i4,	%l3,	%i1
	fmovsgu	%icc,	%f7,	%f1
	fmovdleu	%xcc,	%f4,	%f1
	fmovdne	%icc,	%f1,	%f3
	fone	%f6
	ble,pn	%xcc,	loop_861
	lduw	[%l7 + 0x10],	%g3
	ld	[%l7 + 0x50],	%f14
	fmovrdgez	%o4,	%f2,	%f2
loop_861:
	and	%o2,	%i2,	%i7
	fble	%fcc3,	loop_862
	fmovrdgez	%o5,	%f0,	%f10
	std	%f8,	[%l7 + 0x18]
	fsrc2s	%f2,	%f6
loop_862:
	ld	[%l7 + 0x10],	%f12
	set  0x0, %l0
	setx loop_863, %l0, %l1
	jmpl %l1, %o6
	fnot2	%f0,	%f6
	stw	%l6,	[%l7 + 0x50]
	udiv	%g6,	0x1430,	%l5
loop_863:
	std	%f10,	[%l7 + 0x18]
	bleu	%xcc,	loop_864
	fbue	%fcc1,	loop_865
	fones	%f14
	ldsb	[%l7 + 0x1E],	%g2
loop_864:
	bleu	loop_866
loop_865:
	ldsw	[%l7 + 0x58],	%g1
	set  0x0, %l0
	setx loop_867, %l0, %l1
	jmpl %l1, %i6
	fmuld8sux16	%f4,	%f3,	%f2
loop_866:
	fmovd	%f8,	%f10
	bcc	loop_868
loop_867:
	bn,a,pt	%icc,	loop_869
	movcs	%icc,	%o0,	%o1
	brgz,a	%g5,	loop_870
loop_868:
	srl	%o7,	%l4,	%i0
loop_869:
	movrlez	%i3,	0x301,	%o3
	fbo	%fcc3,	loop_871
loop_870:
	fmovrsgz	%g4,	%f10,	%f3
	stx	%i5,	[%l7 + 0x18]
	alignaddr	%l0,	%l2,	%g7
loop_871:
	fmovdleu	%xcc,	%f6,	%f4
	mulscc	%i4,	%l1,	%l3
	movrlez	%i1,	%g3,	%o2
	ld	[%l7 + 0x74],	%f7
	fbule	%fcc0,	loop_872
	and	%i2,	0x12F7,	%o4
	umulcc	%o5,	0x0BCA,	%o6
	stx	%i7,	[%l7 + 0x38]
loop_872:
	lduh	[%l7 + 0x4A],	%g6
	fbul	%fcc3,	loop_873
	fbe	%fcc0,	loop_874
	fmovdcs	%xcc,	%f14,	%f0
	bleu,pt	%icc,	loop_875
loop_873:
	orn	%l5,	%l6,	%g2
loop_874:
	ldd	[%l7 + 0x68],	%f0
	ldub	[%l7 + 0x22],	%i6
loop_875:
	fandnot2s	%f12,	%f11,	%f15
	udiv	%g1,	0x001F,	%o0
	fnot2	%f14,	%f8
	brgz,a	%g5,	loop_876
	movrgez	%o7,	0x206,	%l4
	ldd	[%l7 + 0x50],	%f8
	ldsw	[%l7 + 0x74],	%i0
loop_876:
	addccc	%i3,	0x0EBC,	%o3
	bneg,a,pn	%xcc,	loop_877
	movre	%o1,	%i5,	%g4
	ldsw	[%l7 + 0x6C],	%l0
	bcc,pn	%icc,	loop_878
loop_877:
	umulcc	%l2,	%i4,	%g7
	ldd	[%l7 + 0x10],	%f10
	sll	%l1,	0x18,	%i1
loop_878:
	fandnot1s	%f10,	%f0,	%f10
	fbn	%fcc1,	loop_879
	fmovsge	%icc,	%f10,	%f8
	ldd	[%l7 + 0x28],	%f4
	stx	%g3,	[%l7 + 0x68]
loop_879:
	stx	%o2,	[%l7 + 0x20]
	ldx	[%l7 + 0x78],	%i2
	fnands	%f12,	%f8,	%f8
	xnorcc	%l3,	0x0165,	%o5
	fble,a	%fcc2,	loop_880
	udiv	%o6,	0x1512,	%i7
	stx	%o4,	[%l7 + 0x58]
	bvs,a,pt	%icc,	loop_881
loop_880:
	fbug,a	%fcc1,	loop_882
	fnand	%f0,	%f0,	%f0
	fmovdl	%icc,	%f7,	%f13
loop_881:
	stw	%g6,	[%l7 + 0x74]
loop_882:
	fmovrsgez	%l6,	%f7,	%f1
	fpadd32s	%f12,	%f14,	%f10
	lduh	[%l7 + 0x4A],	%g2
	brz	%i6,	loop_883
	sub	%l5,	0x003A,	%g1
	fmovdvc	%xcc,	%f1,	%f1
	fnot1	%f0,	%f12
loop_883:
	bvs	%icc,	loop_884
	fors	%f10,	%f5,	%f11
	ldsb	[%l7 + 0x74],	%o0
	fcmpne16	%f4,	%f2,	%g5
loop_884:
	fbug,a	%fcc3,	loop_885
	add	%o7,	%i0,	%l4
	faligndata	%f6,	%f10,	%f4
	srlx	%i3,	%o3,	%o1
loop_885:
	bgu,pt	%icc,	loop_886
	fabsd	%f10,	%f8
	fbue,a	%fcc1,	loop_887
	sub	%g4,	0x03D2,	%i5
loop_886:
	fornot1s	%f6,	%f7,	%f15
	set  0x0, %l0
	setx loop_888, %l0, %l1
	jmpl %l1, %l2
loop_887:
	stw	%l0,	[%l7 + 0x3C]
	fand	%f4,	%f8,	%f12
	fzeros	%f4
loop_888:
	for	%f8,	%f12,	%f0
	ble,pn	%xcc,	loop_889
	xnor	%g7,	0x0A2D,	%i4
	andcc	%i1,	0x1964,	%l1
	umulcc	%g3,	%o2,	%l3
loop_889:
	fpackfix	%f8,	%f6
	sdivx	%o5,	0x0307,	%o6
	ldub	[%l7 + 0x4F],	%i7
	fone	%f6
	ldsb	[%l7 + 0x72],	%i2
	fxor	%f4,	%f2,	%f4
	fmovse	%xcc,	%f2,	%f9
	subcc	%o4,	0x1E10,	%g6
	fmovsa	%xcc,	%f2,	%f2
	xor	%l6,	0x17B4,	%i6
	bcs	loop_890
	ld	[%l7 + 0x74],	%f12
	stw	%g2,	[%l7 + 0x18]
	sdiv	%l5,	0x0BFB,	%g1
loop_890:
	st	%f8,	[%l7 + 0x70]
	fmovsneg	%icc,	%f15,	%f15
	ldd	[%l7 + 0x08],	%f4
	fcmpne16	%f0,	%f10,	%g5
	fands	%f5,	%f5,	%f10
	fmovda	%icc,	%f15,	%f9
	orncc	%o7,	%i0,	%o0
	fmovscc	%icc,	%f5,	%f10
	brlz	%i3,	loop_891
	fbne,a	%fcc3,	loop_892
	fmovd	%f6,	%f4
	fbug,a	%fcc0,	loop_893
loop_891:
	or	%l4,	%o3,	%g4
loop_892:
	fmovdcs	%icc,	%f7,	%f12
	ble,a,pn	%icc,	loop_894
loop_893:
	move	%icc,	%o1,	%i5
	fblg	%fcc3,	loop_895
	stx	%l0,	[%l7 + 0x20]
loop_894:
	udivcc	%g7,	0x165C,	%i4
	ldx	[%l7 + 0x18],	%l2
loop_895:
	ldd	[%l7 + 0x70],	%f10
	sth	%i1,	[%l7 + 0x22]
	edge16n	%g3,	%o2,	%l3
	xorcc	%o5,	%o6,	%i7
	ld	[%l7 + 0x58],	%f0
	udivcc	%l1,	0x0FA8,	%o4
	fcmpgt32	%f2,	%f0,	%i2
	fbule,a	%fcc0,	loop_896
	st	%f3,	[%l7 + 0x38]
	movre	%l6,	%g6,	%i6
	fbul	%fcc1,	loop_897
loop_896:
	subc	%g2,	0x1E5C,	%l5
	fornot1	%f2,	%f4,	%f4
	lduh	[%l7 + 0x34],	%g1
loop_897:
	ldd	[%l7 + 0x38],	%f0
	bleu	%xcc,	loop_898
	ld	[%l7 + 0x70],	%f13
	ldx	[%l7 + 0x50],	%o7
	ld	[%l7 + 0x18],	%f1
loop_898:
	bpos,pn	%xcc,	loop_899
	fbge,a	%fcc1,	loop_900
	fone	%f12
	fmovsleu	%xcc,	%f5,	%f1
loop_899:
	fnands	%f1,	%f1,	%f10
loop_900:
	fbo	%fcc3,	loop_901
	srlx	%g5,	%i0,	%o0
	movneg	%xcc,	%l4,	%i3
	fpsub16s	%f8,	%f13,	%f1
loop_901:
	lduh	[%l7 + 0x28],	%o3
	fmul8sux16	%f8,	%f4,	%f10
	movl	%xcc,	%g4,	%o1
	ldd	[%l7 + 0x60],	%f10
	fzeros	%f1
	std	%f2,	[%l7 + 0x78]
	set  0x0, %l0
	setx loop_902, %l0, %l1
	jmpl %l1, %i5
	xnorcc	%g7,	0x1DC9,	%l0
	fcmpes	%fcc3,	%f3,	%f2
	andn	%l2,	0x0A89,	%i1
loop_902:
	bl,pn	%xcc,	loop_903
	movrne	%g3,	0x016,	%o2
	movrlz	%i4,	%l3,	%o6
	subc	%i7,	0x0E21,	%o5
loop_903:
	edge16l	%o4,	%i2,	%l1
	movcc	%xcc,	%l6,	%g6
	stx	%g2,	[%l7 + 0x10]
	fpsub16	%f8,	%f2,	%f4
	bleu,a	%icc,	loop_904
	fbe	%fcc1,	loop_905
	movpos	%icc,	%i6,	%g1
	ldub	[%l7 + 0x43],	%l5
loop_904:
	fbe,a	%fcc0,	loop_906
loop_905:
	ld	[%l7 + 0x34],	%f11
	stb	%o7,	[%l7 + 0x13]
	xnorcc	%g5,	0x16B5,	%i0
loop_906:
	lduw	[%l7 + 0x5C],	%o0
	addc	%l4,	%o3,	%i3
	ldsh	[%l7 + 0x60],	%o1
	edge16l	%i5,	%g4,	%l0
	movcs	%xcc,	%l2,	%i1
	ld	[%l7 + 0x18],	%f10
	brlz,a	%g3,	loop_907
	addcc	%g7,	0x00CC,	%o2
	lduh	[%l7 + 0x0E],	%i4
	addccc	%l3,	0x13E7,	%i7
loop_907:
	brlz,a	%o6,	loop_908
	fabsd	%f10,	%f10
	sethi	0x0AF4,	%o4
	stb	%o5,	[%l7 + 0x4C]
loop_908:
	brlez	%l1,	loop_909
	fsrc2s	%f14,	%f12
	fmovrdgez	%i2,	%f12,	%f8
	fmovdcc	%icc,	%f8,	%f1
loop_909:
	ldd	[%l7 + 0x20],	%f10
	fmul8x16	%f2,	%f0,	%f12
	brlez	%l6,	loop_910
	sllx	%g2,	%g6,	%g1
	orcc	%i6,	%l5,	%g5
	sll	%i0,	0x17,	%o0
loop_910:
	fabss	%f11,	%f6
	ldub	[%l7 + 0x08],	%l4
	call	loop_911
	for	%f12,	%f14,	%f14
	and	%o7,	%i3,	%o3
	fcmpes	%fcc0,	%f4,	%f11
loop_911:
	fcmple16	%f8,	%f10,	%i5
	bpos,a,pn	%xcc,	loop_912
	movre	%o1,	%l0,	%l2
	fcmps	%fcc1,	%f8,	%f8
	bneg,a,pt	%icc,	loop_913
loop_912:
	fbge,a	%fcc0,	loop_914
	fmovse	%xcc,	%f7,	%f3
	movle	%icc,	%i1,	%g4
loop_913:
	fbug,a	%fcc0,	loop_915
loop_914:
	ldsh	[%l7 + 0x52],	%g7
	fnegd	%f4,	%f14
	fmovsleu	%icc,	%f9,	%f8
loop_915:
	ldsb	[%l7 + 0x18],	%o2
	umul	%i4,	0x1BD6,	%l3
	movg	%icc,	%i7,	%g3
	fbul	%fcc2,	loop_916
	fbul	%fcc2,	loop_917
	fandnot1s	%f15,	%f5,	%f7
	fones	%f15
loop_916:
	ld	[%l7 + 0x58],	%f12
loop_917:
	fcmpeq32	%f4,	%f4,	%o6
	lduw	[%l7 + 0x58],	%o4
	fbl	%fcc3,	loop_918
	fbge,a	%fcc3,	loop_919
	fmul8x16au	%f4,	%f6,	%f2
	fbg,a	%fcc1,	loop_920
loop_918:
	fcmpgt32	%f14,	%f14,	%l1
loop_919:
	movge	%icc,	%o5,	%i2
	fpadd16	%f8,	%f10,	%f4
loop_920:
	fxor	%f0,	%f14,	%f12
	fbu,a	%fcc1,	loop_921
	st	%f6,	[%l7 + 0x0C]
	stx	%l6,	[%l7 + 0x20]
	fmovdle	%icc,	%f6,	%f8
loop_921:
	bvs	loop_922
	call	loop_923
	bcc,a,pn	%icc,	loop_924
	lduh	[%l7 + 0x7A],	%g6
loop_922:
	movpos	%icc,	%g1,	%g2
loop_923:
	ldsh	[%l7 + 0x24],	%l5
loop_924:
	fbn	%fcc2,	loop_925
	be,a	%icc,	loop_926
	popc	0x0939,	%i6
	bl,a,pt	%icc,	loop_927
loop_925:
	edge8l	%g5,	%i0,	%l4
loop_926:
	ldub	[%l7 + 0x67],	%o0
	fblg,a	%fcc3,	loop_928
loop_927:
	stw	%i3,	[%l7 + 0x68]
	movrlz	%o3,	%o7,	%o1
	orcc	%i5,	%l2,	%i1
loop_928:
	fbug,a	%fcc2,	loop_929
	bvs,a	loop_930
	fmovsge	%xcc,	%f10,	%f5
	fmovdvs	%icc,	%f15,	%f11
loop_929:
	movrgez	%l0,	0x198,	%g7
loop_930:
	edge32	%g4,	%i4,	%o2
	alignaddr	%l3,	%i7,	%o6
	fmovdgu	%icc,	%f0,	%f7
	sub	%o4,	%l1,	%o5
	fmovdle	%icc,	%f15,	%f1
	ldsb	[%l7 + 0x4F],	%i2
	fmovdg	%xcc,	%f12,	%f3
	fmovsgu	%xcc,	%f14,	%f11
	fmovsvc	%icc,	%f14,	%f7
	fzeros	%f13
	stx	%g3,	[%l7 + 0x50]
	fbg,a	%fcc1,	loop_931
	bvc	loop_932
	fmovdn	%xcc,	%f5,	%f8
	movne	%xcc,	%g6,	%l6
loop_931:
	fcmple16	%f10,	%f0,	%g1
loop_932:
	fbul	%fcc1,	loop_933
	stx	%g2,	[%l7 + 0x60]
	fmovde	%xcc,	%f5,	%f12
	brgez	%l5,	loop_934
loop_933:
	fpsub16	%f2,	%f2,	%f4
	fmovsg	%icc,	%f9,	%f11
	fcmple16	%f2,	%f6,	%g5
loop_934:
	brz	%i0,	loop_935
	udiv	%i6,	0x1400,	%l4
	fcmpeq32	%f10,	%f4,	%i3
	fcmpne32	%f2,	%f6,	%o0
loop_935:
	addcc	%o3,	%o1,	%o7
	fbue,a	%fcc2,	loop_936
	fnors	%f13,	%f14,	%f11
	brgz,a	%i5,	loop_937
	addccc	%i1,	%l0,	%g7
loop_936:
	fnot1	%f2,	%f12
	fpsub32	%f4,	%f10,	%f6
loop_937:
	fnand	%f2,	%f14,	%f10
	brlz,a	%g4,	loop_938
	stb	%l2,	[%l7 + 0x26]
	fbul,a	%fcc0,	loop_939
	fcmpeq32	%f2,	%f0,	%o2
loop_938:
	ldsh	[%l7 + 0x12],	%l3
	stx	%i4,	[%l7 + 0x68]
loop_939:
	ldsw	[%l7 + 0x6C],	%o6
	edge8l	%o4,	%i7,	%o5
	fmovsvc	%icc,	%f3,	%f10
	fcmped	%fcc0,	%f2,	%f0
	be,pn	%xcc,	loop_940
	stb	%i2,	[%l7 + 0x3B]
	fmovrse	%l1,	%f3,	%f2
	fabsd	%f8,	%f4
loop_940:
	fpadd32	%f4,	%f12,	%f8
	subc	%g6,	0x02B5,	%l6
	bneg,pt	%xcc,	loop_941
	stw	%g1,	[%l7 + 0x54]
	fandnot2	%f4,	%f2,	%f2
	brz	%g2,	loop_942
loop_941:
	fmovrslz	%g3,	%f5,	%f8
	brnz,a	%g5,	loop_943
	fmovsvc	%xcc,	%f11,	%f13
loop_942:
	fmul8sux16	%f0,	%f10,	%f2
	movpos	%xcc,	%l5,	%i6
loop_943:
	fcmps	%fcc1,	%f5,	%f4
	ba,pt	%xcc,	loop_944
	fcmple16	%f4,	%f0,	%l4
	fmovsl	%icc,	%f8,	%f7
	bne	loop_945
loop_944:
	ldsb	[%l7 + 0x08],	%i3
	std	%f14,	[%l7 + 0x40]
	fzero	%f14
loop_945:
	sdivcc	%o0,	0x0EA2,	%o3
	subcc	%o1,	0x0C5D,	%i0
	ldsh	[%l7 + 0x3C],	%i5
	fnot2s	%f0,	%f4
	bn	%icc,	loop_946
	sdivcc	%i1,	0x0F4F,	%o7
	orncc	%g7,	%g4,	%l0
	ldsb	[%l7 + 0x0C],	%l2
loop_946:
	subcc	%l3,	%o2,	%i4
	ld	[%l7 + 0x5C],	%f2
	fmovdneg	%xcc,	%f4,	%f7
	fbe,a	%fcc1,	loop_947
	fcmpgt16	%f8,	%f8,	%o4
	fmovdvs	%xcc,	%f13,	%f5
	fmovsl	%icc,	%f11,	%f0
loop_947:
	st	%f7,	[%l7 + 0x50]
	bg,pn	%icc,	loop_948
	lduh	[%l7 + 0x58],	%o6
	bgu	loop_949
	ldub	[%l7 + 0x23],	%i7
loop_948:
	xorcc	%i2,	%o5,	%g6
	fnegd	%f6,	%f6
loop_949:
	fbge	%fcc0,	loop_950
	fornot1s	%f7,	%f12,	%f5
	bvc,a	loop_951
	ldub	[%l7 + 0x1A],	%l6
loop_950:
	std	%f8,	[%l7 + 0x38]
	fpadd16	%f4,	%f2,	%f6
loop_951:
	stx	%g1,	[%l7 + 0x30]
	fmovsne	%xcc,	%f6,	%f5
	ld	[%l7 + 0x54],	%f2
	sub	%l1,	%g2,	%g3
	fors	%f12,	%f3,	%f5
	fornot1	%f0,	%f10,	%f0
	ld	[%l7 + 0x74],	%f8
	fbug,a	%fcc3,	loop_952
	stw	%g5,	[%l7 + 0x4C]
	fnot2	%f10,	%f12
	bne,pt	%xcc,	loop_953
loop_952:
	fcmpgt32	%f6,	%f12,	%i6
	ldsw	[%l7 + 0x18],	%l5
	fmovda	%icc,	%f13,	%f11
loop_953:
	stb	%l4,	[%l7 + 0x56]
	call	loop_954
	bneg,a	loop_955
	subc	%i3,	0x17BD,	%o0
	ldx	[%l7 + 0x08],	%o3
loop_954:
	fmovsvc	%xcc,	%f6,	%f14
loop_955:
	fpadd32	%f10,	%f14,	%f14
	subccc	%i0,	0x0EE2,	%o1
	xnorcc	%i5,	0x0836,	%o7
	fbo,a	%fcc1,	loop_956
	call	loop_957
	fba	%fcc0,	loop_958
	fands	%f3,	%f12,	%f0
loop_956:
	fmovda	%xcc,	%f15,	%f10
loop_957:
	edge8	%g7,	%g4,	%i1
loop_958:
	movrgez	%l0,	%l3,	%o2
	fpadd16	%f6,	%f0,	%f12
	alignaddr	%i4,	%o4,	%o6
	fmul8x16al	%f7,	%f2,	%f4
	movvc	%xcc,	%l2,	%i7
	fbue	%fcc1,	loop_959
	fbge,a	%fcc3,	loop_960
	fmovrsgez	%o5,	%f15,	%f8
	fbo,a	%fcc2,	loop_961
loop_959:
	srl	%i2,	%l6,	%g1
loop_960:
	fmovsleu	%xcc,	%f4,	%f7
	fmovdvs	%icc,	%f3,	%f5
loop_961:
	fcmpeq16	%f2,	%f2,	%g6
	fnegs	%f4,	%f5
	lduw	[%l7 + 0x44],	%g2
	fbo,a	%fcc2,	loop_962
	set  0x0, %l0
	setx loop_963, %l0, %l1
	jmpl %l1, %g3
	fmovdg	%icc,	%f6,	%f3
	bge	loop_964
loop_962:
	ba	loop_965
loop_963:
	sra	%l1,	%i6,	%g5
	fones	%f11
loop_964:
	fmovspos	%icc,	%f0,	%f4
loop_965:
	fbe	%fcc1,	loop_966
	be,a,pt	%icc,	loop_967
	ldsw	[%l7 + 0x50],	%l4
	call	loop_968
loop_966:
	bneg	%icc,	loop_969
loop_967:
	lduw	[%l7 + 0x28],	%i3
	fpsub32	%f0,	%f12,	%f12
loop_968:
	fnegs	%f8,	%f10
loop_969:
	fone	%f4
	fmovrdlz	%l5,	%f4,	%f0
	ldub	[%l7 + 0x78],	%o0
	lduh	[%l7 + 0x4C],	%o3
	std	%f8,	[%l7 + 0x20]
	lduw	[%l7 + 0x10],	%o1
	ldsw	[%l7 + 0x10],	%i5
	edge8n	%i0,	%g7,	%o7
	movle	%xcc,	%g4,	%l0
	std	%f12,	[%l7 + 0x38]
	fpsub32	%f14,	%f6,	%f6
	fnands	%f11,	%f9,	%f12
	fba	%fcc3,	loop_970
	xnor	%l3,	%o2,	%i1
	fsrc2	%f12,	%f4
	fands	%f0,	%f6,	%f7
loop_970:
	movle	%xcc,	%i4,	%o4
	fabsd	%f6,	%f12
	udiv	%l2,	0x0D80,	%i7
	bl,a	loop_971
	ba,a	%xcc,	loop_972
	fmovrsgz	%o5,	%f10,	%f13
	srl	%i2,	0x0D,	%l6
loop_971:
	fpack16	%f2,	%f14
loop_972:
	fxnor	%f4,	%f12,	%f8
	call	loop_973
	fxors	%f11,	%f3,	%f7
	ld	[%l7 + 0x54],	%f11
	edge16l	%o6,	%g1,	%g6
loop_973:
	edge16n	%g3,	%l1,	%g2
	fbl,a	%fcc2,	loop_974
	brnz,a	%i6,	loop_975
	fands	%f9,	%f1,	%f2
	fpack16	%f14,	%f12
loop_974:
	sth	%g5,	[%l7 + 0x18]
loop_975:
	fornot2	%f2,	%f10,	%f12
	fcmped	%fcc2,	%f8,	%f4
	sdivx	%i3,	0x0206,	%l5
	fbl	%fcc2,	loop_976
	fbo	%fcc2,	loop_977
	edge32ln	%o0,	%l4,	%o1
	fnand	%f0,	%f4,	%f10
loop_976:
	fsrc2	%f8,	%f6
loop_977:
	fnegd	%f10,	%f10
	ldx	[%l7 + 0x78],	%i5
	lduh	[%l7 + 0x0C],	%i0
	sllx	%g7,	0x1A,	%o3
	mova	%icc,	%o7,	%l0
	movcc	%icc,	%l3,	%o2
	fmovd	%f14,	%f10
	stw	%g4,	[%l7 + 0x10]
	stw	%i1,	[%l7 + 0x68]
	ldsh	[%l7 + 0x08],	%i4
	st	%f5,	[%l7 + 0x08]
	brgez	%l2,	loop_978
	sethi	0x1E6A,	%o4
	addcc	%o5,	%i2,	%l6
	edge8n	%o6,	%g1,	%i7
loop_978:
	fmovrdne	%g6,	%f12,	%f10
	fmovsge	%xcc,	%f5,	%f0
	movrgez	%l1,	%g2,	%i6
	stw	%g3,	[%l7 + 0x18]
	fone	%f14
	fmovrsne	%i3,	%f0,	%f7
	fnors	%f14,	%f5,	%f9
	ldub	[%l7 + 0x34],	%l5
	fmovrdgz	%o0,	%f0,	%f6
	sth	%g5,	[%l7 + 0x08]
	fmovrdgz	%o1,	%f6,	%f2
	call	loop_979
	sub	%l4,	0x1ACB,	%i5
	edge32	%g7,	%i0,	%o7
	addc	%l0,	%l3,	%o2
loop_979:
	fornot1	%f10,	%f0,	%f4
	fmovrse	%o3,	%f7,	%f14
	fbule	%fcc2,	loop_980
	fmovrslz	%g4,	%f14,	%f10
	lduh	[%l7 + 0x26],	%i4
	movn	%xcc,	%l2,	%o4
loop_980:
	fandnot1s	%f6,	%f10,	%f7
	lduh	[%l7 + 0x70],	%o5
	movrne	%i1,	0x040,	%i2
	std	%f4,	[%l7 + 0x70]
	movle	%xcc,	%o6,	%g1
	movge	%xcc,	%i7,	%g6
	bvc	%icc,	loop_981
	ld	[%l7 + 0x70],	%f15
	xor	%l6,	%l1,	%i6
	sdivcc	%g2,	0x0784,	%g3
loop_981:
	bcc	loop_982
	fmovdcc	%xcc,	%f9,	%f10
	ldsb	[%l7 + 0x7F],	%l5
	movvc	%xcc,	%i3,	%g5
loop_982:
	fmovrdlz	%o0,	%f12,	%f14
	movl	%icc,	%o1,	%l4
	fcmps	%fcc0,	%f5,	%f4
	bpos	loop_983
	fcmple32	%f0,	%f6,	%i5
	brlez,a	%g7,	loop_984
	std	%f12,	[%l7 + 0x38]
loop_983:
	fnot2	%f2,	%f14
	fmovsa	%icc,	%f8,	%f15
loop_984:
	fbo,a	%fcc1,	loop_985
	ldub	[%l7 + 0x4D],	%o7
	fbo,a	%fcc3,	loop_986
	ldsb	[%l7 + 0x3F],	%i0
loop_985:
	fcmpd	%fcc0,	%f2,	%f12
	fpackfix	%f14,	%f6
loop_986:
	fmovrsne	%l0,	%f11,	%f15
	srax	%l3,	%o3,	%o2
	movle	%icc,	%i4,	%g4
	subcc	%o4,	%o5,	%l2
	st	%f6,	[%l7 + 0x40]
	fnot1	%f10,	%f6
	bg,a	%icc,	loop_987
	st	%f5,	[%l7 + 0x14]
	fbuge	%fcc2,	loop_988
	ldx	[%l7 + 0x48],	%i1
loop_987:
	fxnor	%f14,	%f2,	%f4
	udiv	%o6,	0x0499,	%g1
loop_988:
	faligndata	%f4,	%f10,	%f0
	fmovrslez	%i7,	%f4,	%f14
	ldsb	[%l7 + 0x1F],	%i2
	fsrc2s	%f15,	%f5
	fmovdneg	%icc,	%f11,	%f13
	fnot2s	%f13,	%f7
	stx	%g6,	[%l7 + 0x30]
	fmovrslz	%l6,	%f13,	%f4
	fmul8x16	%f5,	%f6,	%f14
	fornot1s	%f0,	%f4,	%f0
	set  0x0, %l0
	setx loop_989, %l0, %l1
	jmpl %l1, %l1
	bpos,pn	%icc,	loop_990
	fpadd16	%f14,	%f0,	%f8
	fmovrde	%g2,	%f10,	%f12
loop_989:
	mulx	%i6,	%l5,	%i3
loop_990:
	ldd	[%l7 + 0x70],	%f6
	fbul	%fcc1,	loop_991
	lduh	[%l7 + 0x6A],	%g3
	fmovsvc	%icc,	%f8,	%f2
	ba,a	loop_992
loop_991:
	bpos,pt	%xcc,	loop_993
	smul	%g5,	0x07C3,	%o1
	fzero	%f12
loop_992:
	ldsw	[%l7 + 0x2C],	%l4
loop_993:
	fxor	%f10,	%f8,	%f6
	lduw	[%l7 + 0x10],	%o0
	fsrc2s	%f1,	%f6
	movg	%xcc,	%i5,	%o7
	fbg	%fcc3,	loop_994
	movrlz	%i0,	0x07D,	%l0
	fxors	%f10,	%f10,	%f11
	sllx	%l3,	%g7,	%o2
loop_994:
	fcmpgt16	%f8,	%f14,	%o3
	andncc	%g4,	%i4,	%o5
	edge32	%l2,	%i1,	%o6
	sdivcc	%g1,	0x1ED0,	%o4
	fmovs	%f12,	%f10
	ble	loop_995
	fpadd32	%f14,	%f4,	%f14
	movcs	%xcc,	%i7,	%g6
	fone	%f10
loop_995:
	xorcc	%l6,	0x1257,	%l1
	ldub	[%l7 + 0x5B],	%i2
	ld	[%l7 + 0x70],	%f12
	ldd	[%l7 + 0x50],	%f8
	fabsd	%f10,	%f14
	bl,a,pt	%icc,	loop_996
	move	%xcc,	%g2,	%l5
	be,pt	%icc,	loop_997
	fmovdgu	%xcc,	%f0,	%f2
loop_996:
	addccc	%i6,	%i3,	%g5
	fba,a	%fcc1,	loop_998
loop_997:
	fmovdvc	%xcc,	%f12,	%f14
	fnor	%f6,	%f10,	%f14
	fmovdg	%icc,	%f12,	%f12
loop_998:
	fmovdg	%xcc,	%f0,	%f9
	set  0x0, %l0
	setx loop_999, %l0, %l1
	jmpl %l1, %o1
	fpsub16s	%f10,	%f7,	%f0
	call	loop_1000
	xnor	%g3,	%l4,	%o0
loop_999:
	fmovrdgez	%o7,	%f8,	%f10
	fcmpeq16	%f2,	%f6,	%i5
loop_1000:
	fmovrdgez	%l0,	%f8,	%f12
	fmovse	%xcc,	%f14,	%f0
	fbuge,a	%fcc3,	loop_1001
	ba,pn	%xcc,	loop_1002
	umul	%l3,	0x1929,	%g7
	fsrc2s	%f6,	%f9
loop_1001:
	fmovdle	%icc,	%f1,	%f14
loop_1002:
	brz,a	%i0,	loop_1003
	st	%f13,	[%l7 + 0x50]
	fsrc1s	%f0,	%f13
	bpos,a	loop_1004
loop_1003:
	fbuge,a	%fcc3,	loop_1005
	ldsb	[%l7 + 0x5A],	%o2
	fpackfix	%f2,	%f14
loop_1004:
	fcmpgt16	%f6,	%f2,	%o3
loop_1005:
	fmovscs	%xcc,	%f1,	%f9
	sth	%i4,	[%l7 + 0x6E]
	fmul8x16al	%f0,	%f10,	%f6
	fmovsl	%icc,	%f15,	%f12
	fpadd16s	%f6,	%f2,	%f7
	fone	%f14
	fmul8x16au	%f4,	%f2,	%f2
	fmovrsne	%g4,	%f10,	%f8
	orn	%o5,	%l2,	%o6
	st	%f8,	[%l7 + 0x28]
	fmovsvs	%xcc,	%f11,	%f4
	fmovsn	%icc,	%f5,	%f0
	andcc	%g1,	%o4,	%i7
	set  0x0, %l0
	setx loop_1006, %l0, %l1
	jmpl %l1, %g6
	ldd	[%l7 + 0x50],	%f6
	fcmps	%fcc0,	%f15,	%f12
	fmovdg	%xcc,	%f12,	%f5
loop_1006:
	mulscc	%l6,	0x17F4,	%i1
	fble,a	%fcc0,	loop_1007
	fmul8x16al	%f7,	%f2,	%f10
	ld	[%l7 + 0x48],	%f8
	fnors	%f11,	%f6,	%f3
loop_1007:
	fmovrdgez	%l1,	%f0,	%f8
	fmovrsgz	%i2,	%f11,	%f11
	ldsh	[%l7 + 0x66],	%l5
	bl,a	loop_1008
	ldx	[%l7 + 0x48],	%g2
	stw	%i3,	[%l7 + 0x20]
	fmovsl	%icc,	%f13,	%f5
loop_1008:
	fxors	%f2,	%f15,	%f4
	fnands	%f9,	%f13,	%f13
	fnot2s	%f4,	%f0
	stw	%i6,	[%l7 + 0x30]
	fmovs	%f0,	%f9
	bne,a	loop_1009
	fors	%f11,	%f4,	%f11
	movrgez	%o1,	0x08E,	%g3
	ldsw	[%l7 + 0x10],	%g5
loop_1009:
	fcmpd	%fcc0,	%f4,	%f10
	sllx	%o0,	0x18,	%l4
	fbu,a	%fcc0,	loop_1010
	fmovdgu	%xcc,	%f0,	%f12
	brgz	%i5,	loop_1011
	fmovdpos	%xcc,	%f3,	%f13
loop_1010:
	bne	loop_1012
	andncc	%o7,	%l0,	%g7
loop_1011:
	fmuld8sux16	%f15,	%f5,	%f12
	ldsb	[%l7 + 0x79],	%i0
loop_1012:
	fbn	%fcc0,	loop_1013
	ldsb	[%l7 + 0x3D],	%o2
	bn	loop_1014
	ldsw	[%l7 + 0x18],	%l3
loop_1013:
	fbge,a	%fcc2,	loop_1015
	fpack16	%f14,	%f14
loop_1014:
	movpos	%xcc,	%i4,	%o3
	fpsub16s	%f3,	%f13,	%f9
loop_1015:
	fornot1s	%f12,	%f6,	%f6
	andn	%g4,	%l2,	%o5
	fxor	%f12,	%f12,	%f4
	fmuld8sux16	%f14,	%f14,	%f14
	movvs	%xcc,	%g1,	%o6
	popc	0x0EED,	%i7
	movrgez	%o4,	0x015,	%l6
	ldsw	[%l7 + 0x20],	%i1
	srax	%l1,	%g6,	%i2
	fpack16	%f10,	%f12
	subc	%g2,	%l5,	%i3
	fba	%fcc1,	loop_1016
	fmovdcs	%icc,	%f6,	%f4
	mova	%xcc,	%o1,	%i6
	fand	%f8,	%f10,	%f12
loop_1016:
	fmovscc	%icc,	%f12,	%f12
	ble,a,pt	%icc,	loop_1017
	sub	%g5,	%o0,	%g3
	fmovdl	%xcc,	%f9,	%f7
	movpos	%icc,	%i5,	%l4
loop_1017:
	bg	%xcc,	loop_1018
	brlez	%l0,	loop_1019
	bg	%icc,	loop_1020
	edge8n	%o7,	%g7,	%o2
loop_1018:
	ldub	[%l7 + 0x15],	%l3
loop_1019:
	fpackfix	%f12,	%f3
loop_1020:
	sra	%i4,	%o3,	%g4
	brlez,a	%l2,	loop_1021
	bcc,pt	%xcc,	loop_1022
	xorcc	%i0,	0x0790,	%g1
	movne	%icc,	%o6,	%i7
loop_1021:
	fmul8sux16	%f0,	%f4,	%f2
loop_1022:
	fmovrse	%o4,	%f7,	%f7
	stx	%o5,	[%l7 + 0x60]
	brz,a	%i1,	loop_1023
	fmovdvc	%icc,	%f7,	%f9
	udiv	%l1,	0x1128,	%g6
	lduh	[%l7 + 0x72],	%i2
loop_1023:
	movrgz	%l6,	0x0CA,	%g2
	fnot2s	%f11,	%f6
	edge16n	%i3,	%o1,	%l5
	fnands	%f15,	%f15,	%f5
	ldsh	[%l7 + 0x4C],	%g5
	ldub	[%l7 + 0x11],	%i6
	bn,a	%xcc,	loop_1024
	fnot1	%f14,	%f2
	mova	%icc,	%o0,	%g3
	fbn,a	%fcc3,	loop_1025
loop_1024:
	bvc,a	%xcc,	loop_1026
	lduw	[%l7 + 0x08],	%l4
	fmovde	%icc,	%f9,	%f9
loop_1025:
	lduh	[%l7 + 0x5E],	%i5
loop_1026:
	sth	%l0,	[%l7 + 0x14]
	fmovdn	%xcc,	%f0,	%f10
	edge8n	%o7,	%o2,	%l3
	smul	%g7,	%i4,	%g4
	brgz	%o3,	loop_1027
	edge32	%i0,	%g1,	%o6
	fbl,a	%fcc2,	loop_1028
	fnand	%f6,	%f0,	%f14
loop_1027:
	sllx	%l2,	0x1F,	%o4
	fand	%f8,	%f10,	%f12
loop_1028:
	fmovsge	%xcc,	%f7,	%f12
	fones	%f12
	fmovsvc	%icc,	%f3,	%f4
	bvc	%xcc,	loop_1029
	edge8	%i7,	%i1,	%l1
	ldd	[%l7 + 0x48],	%f10
	sdivx	%o5,	0x0496,	%i2
loop_1029:
	fmovsa	%icc,	%f7,	%f2
	fbuge	%fcc2,	loop_1030
	fbule,a	%fcc0,	loop_1031
	movg	%xcc,	%l6,	%g6
	edge16l	%g2,	%i3,	%l5
loop_1030:
	edge32l	%g5,	%o1,	%i6
loop_1031:
	lduw	[%l7 + 0x2C],	%o0
	stw	%l4,	[%l7 + 0x74]
	fmovrdne	%g3,	%f12,	%f0
	brgez	%i5,	loop_1032
	fbo,a	%fcc2,	loop_1033
	brlez	%o7,	loop_1034
	fsrc2	%f6,	%f12
loop_1032:
	fcmpd	%fcc0,	%f12,	%f12
loop_1033:
	addccc	%o2,	0x0C1B,	%l0
loop_1034:
	sth	%g7,	[%l7 + 0x40]
	fnot1	%f8,	%f4
	fmuld8ulx16	%f13,	%f9,	%f6
	ldd	[%l7 + 0x40],	%f14
	addc	%l3,	%g4,	%o3
	sdivx	%i4,	0x10DF,	%g1
	stx	%o6,	[%l7 + 0x08]
	ldub	[%l7 + 0x71],	%l2
	fpack32	%f14,	%f4,	%f2
	faligndata	%f2,	%f6,	%f8
	fbuge	%fcc0,	loop_1035
	ldub	[%l7 + 0x6B],	%i0
	edge16l	%i7,	%i1,	%o4
	brgz	%l1,	loop_1036
loop_1035:
	fnor	%f2,	%f8,	%f2
	stb	%o5,	[%l7 + 0x75]
	umul	%l6,	%i2,	%g2
loop_1036:
	fpack32	%f6,	%f2,	%f0
	lduh	[%l7 + 0x36],	%g6
	fcmpeq32	%f2,	%f14,	%i3
	fandnot2	%f10,	%f10,	%f6
	be,pt	%icc,	loop_1037
	xor	%g5,	%l5,	%o1
	ldx	[%l7 + 0x28],	%i6
	fmovsneg	%xcc,	%f8,	%f11
loop_1037:
	st	%f2,	[%l7 + 0x0C]
	std	%f12,	[%l7 + 0x48]
	movne	%xcc,	%o0,	%g3
	edge16n	%i5,	%o7,	%o2
	fandnot2s	%f6,	%f12,	%f5
	ldsw	[%l7 + 0x78],	%l0
	brgez,a	%l4,	loop_1038
	mulx	%g7,	%l3,	%g4
	fmovdge	%xcc,	%f10,	%f3
	fbo	%fcc0,	loop_1039
loop_1038:
	xorcc	%i4,	%o3,	%o6
	ld	[%l7 + 0x64],	%f2
	fxnors	%f15,	%f1,	%f10
loop_1039:
	fsrc2	%f8,	%f8
	fmovdn	%xcc,	%f6,	%f13
	fmovsne	%icc,	%f5,	%f9
	fand	%f12,	%f12,	%f2
	fnot1	%f4,	%f14
	std	%f4,	[%l7 + 0x18]
	fmovdg	%icc,	%f13,	%f8
	ldsw	[%l7 + 0x40],	%l2
	subc	%g1,	0x10CB,	%i7
	fbue	%fcc1,	loop_1040
	fmovsn	%xcc,	%f7,	%f9
	fmovrslz	%i0,	%f5,	%f2
	fcmple32	%f2,	%f10,	%i1
loop_1040:
	fbg,a	%fcc0,	loop_1041
	fornot2	%f2,	%f0,	%f6
	addccc	%o4,	0x1D7E,	%l1
	fbl,a	%fcc1,	loop_1042
loop_1041:
	fnors	%f10,	%f5,	%f9
	brgz,a	%o5,	loop_1043
	fmovrslez	%i2,	%f9,	%f4
loop_1042:
	ldub	[%l7 + 0x53],	%l6
	fmovrdlez	%g2,	%f10,	%f6
loop_1043:
	ble,a	%xcc,	loop_1044
	fmuld8sux16	%f0,	%f11,	%f10
	fbul,a	%fcc1,	loop_1045
	fbne	%fcc1,	loop_1046
loop_1044:
	ldsh	[%l7 + 0x10],	%g6
	stw	%i3,	[%l7 + 0x5C]
loop_1045:
	bgu,a,pt	%xcc,	loop_1047
loop_1046:
	sth	%l5,	[%l7 + 0x58]
	bn	%icc,	loop_1048
	bvc,pt	%xcc,	loop_1049
loop_1047:
	fornot1s	%f4,	%f1,	%f15
	ld	[%l7 + 0x74],	%f12
loop_1048:
	fmovrdne	%o1,	%f6,	%f10
loop_1049:
	orncc	%i6,	0x14BD,	%o0
	stw	%g3,	[%l7 + 0x28]
	fnor	%f0,	%f10,	%f14
	brgez	%i5,	loop_1050
	fmovdge	%xcc,	%f11,	%f10
	fornot1	%f0,	%f12,	%f12
	fmovdgu	%icc,	%f4,	%f15
loop_1050:
	movn	%xcc,	%o7,	%o2
	movcc	%icc,	%l0,	%g5
	fmovspos	%icc,	%f12,	%f4
	movgu	%icc,	%l4,	%l3
	faligndata	%f4,	%f2,	%f6
	andn	%g4,	0x074F,	%i4
	st	%f11,	[%l7 + 0x48]
	movrne	%o3,	%o6,	%g7
	fblg,a	%fcc2,	loop_1051
	movne	%icc,	%g1,	%i7
	stb	%l2,	[%l7 + 0x6F]
	fmovscs	%icc,	%f10,	%f7
loop_1051:
	orcc	%i0,	0x1EF9,	%i1
	fbe	%fcc1,	loop_1052
	fmovdpos	%xcc,	%f13,	%f1
	fbne	%fcc2,	loop_1053
	fnors	%f8,	%f1,	%f3
loop_1052:
	fpadd32	%f12,	%f14,	%f0
	fpsub32s	%f13,	%f15,	%f0
loop_1053:
	brgz,a	%o4,	loop_1054
	movgu	%xcc,	%l1,	%o5
	st	%f11,	[%l7 + 0x44]
	fmovsneg	%xcc,	%f5,	%f10
loop_1054:
	bneg,pn	%xcc,	loop_1055
	fmovsvc	%icc,	%f13,	%f4
	stw	%i2,	[%l7 + 0x6C]
	mulscc	%l6,	0x1C03,	%g6
loop_1055:
	fmovrdgez	%g2,	%f14,	%f8
	fmovrdlz	%l5,	%f6,	%f14
	ldsw	[%l7 + 0x50],	%o1
	st	%f12,	[%l7 + 0x4C]
	mulscc	%i3,	0x0348,	%i6
	fmovsvc	%xcc,	%f1,	%f13
	movrgez	%o0,	%g3,	%i5
	bneg	%xcc,	loop_1056
	edge32	%o7,	%l0,	%g5
	fxnors	%f12,	%f2,	%f1
	fnegs	%f11,	%f10
loop_1056:
	fmovd	%f8,	%f0
	bne,a	loop_1057
	ldsh	[%l7 + 0x22],	%o2
	fabss	%f0,	%f13
	set  0x0, %l0
	setx loop_1058, %l0, %l1
	jmpl %l1, %l4
loop_1057:
        nop

loop_1058:
        nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Diag:
!
!	Type f   	: 1800
!	Type cti   	: 1058
!	Type i   	: 1065
!	Type l   	: 1077
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x3C2D3A79
.word 0xA4FF68F0
.word 0x13C701A5
.word 0xC99B6312
.word 0xA4F4C560
.word 0x5BABF289
.word 0xFCE126DE
.word 0x192FB03E
.word 0x6E8EE4BD
.word 0x2B2C2E3E
.word 0xB6DED02A
.word 0xC01083B1
.word 0x44988A1F
.word 0x9DE7EB5A
.word 0xB74AA760
.word 0xE4BEBA23
.word 0x91772362
.word 0x0EFD27D4
.word 0x0A6D28DF
.word 0x1E6E6B20
.word 0x37CF0203
.word 0x08A35333
.word 0x37D2B902
.word 0x40B11BA1
.word 0x753FB53E
.word 0x915CE10C
.word 0xEA67753F
.word 0xAF5B00C5
.word 0xBDB94A52
.word 0x1D0FD9E3
.word 0x9EA12949
.word 0xF6D465AC
.word 0x3D702202
.word 0x3142FEAE
.word 0x1C59D52C
.word 0xCFA86D05
.word 0xE2CCEFBC
.word 0xB384E260
.word 0x9479CC2D
.word 0x9F49FC0A
.word 0xFA0AFE12
.word 0x9BADD844
.word 0x7ABF68B6
.word 0xD79B2787
.word 0x2DABAA5B
.word 0x2A7D2369
.word 0xEBC7D953
.word 0xC91A563E
.word 0x21899566
.word 0x5545E80A
.word 0xD551D8ED
.word 0xECBD2D1B
.word 0x5F55E84B
.word 0x51D80E1A
.word 0x8D1CE3BC
.word 0xD126CC9F
.word 0x3939976F
.word 0xD0E0B2D5
.word 0xD7524BD8
.word 0x86F9D052
.word 0x005953F7
.word 0xB834B88A
.word 0x0B2A90E3
.word 0x0F749E26
.end
