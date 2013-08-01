/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: lsu_storeraw_fc_0.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa2.pl FOCUS_SEED=842910278"
.ident "BY ml138637 ON Thu Jun  5 10:23:20 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: lsu_storeraw_fc_0.s,v 1.3 2007/07/05 22:02:00 drp Exp $"
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


	!# Initialize registers ..

	!# Global registers
	set	0x4,	%g1
	set	0xD,	%g2
	set	0x8,	%g3
	set	0x7,	%g4
	set	0x8,	%g5
	set	0xA,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xB,	%i1
	set	-0x5,	%i2
	set	-0x7,	%i3
	set	-0xB,	%i4
	set	-0x3,	%i5
	set	-0x9,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x75EC2EC7,	%l0
	set	0x5D964414,	%l1
	set	0x5965225B,	%l2
	set	0x4E0B8A4A,	%l3
	set	0x5EE83335,	%l4
	set	0x6C5A1357,	%l5
	set	0x75FB42EE,	%l6

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

	stw	%i0,	[0x60]
	ldx	[0x78 + 0x0],	%l1
	faligndata	%f8,	%f4,	%f0
	fcmps	%f4,	%f13
	lduh	[0x2A + 0x0],	%i5
	fbg	%fcc3,	loop_1
	fcmpes	%f12,	%f10
	fands	%f1,	%f2,	%f7
	fnors	%f2,	%f1,	%f6
loop_1:
	lduw	[0x58 + 0x0],	%g7
	ba,a	%icc,	loop_2
	lduh	[0x62 + 0x0],	%g5
	fnegs	%f5,	%f11
	fsrc1s	%f9,	%f4
loop_2:
	ldub	[0x2D + 0x0],	%g3
	stx	%l6,	[0x48]
	lduw	[0x7C + 0x0],	%o4
	fmovs	%f10,	%f7
	lduh	[0x1E + 0x0],	%l7
	fbo,a	%fcc2,	loop_3
	stw	%l2,	[0x20]
	bl,pn	%icc,	loop_4
	ldx	[0x28 + 0x0],	%o1
loop_3:
	stx	%i2,	[0x30]
	ldub	[0x29 + 0x0],	%i3
loop_4:
	bn,a,pn	%xcc,	loop_5
	fsrc1	%f8,	%f12
	bgu,a,pn	%icc,	loop_6
	ldx	[0x50 + 0x0],	%o0
loop_5:
	ldub	[0x4B + 0x0],	%o7
	fxor	%f6,	%f12,	%f10
loop_6:
	fones	%f14
	fcmps	%f14,	%f9
	fnegs	%f2,	%f4
	lduh	[0x0E + 0x0],	%o6
	bcs	loop_7
	fnot2s	%f8,	%f14
	fnegs	%f8,	%f7
	fsrc2	%f2,	%f0
loop_7:
	fcmpes	%f14,	%f8
	ldx	[0x78 + 0x0],	%o2
	ldub	[0x28 + 0x0],	%o3
	fands	%f4,	%f13,	%f0
	fnot1s	%f6,	%f5
	stx	%l3,	[0x70]
	fxnor	%f6,	%f4,	%f12
	faligndata	%f8,	%f6,	%f2
	ldx	[0x10 + 0x0],	%i6
	fcmpd	%f10,	%f10
	lduh	[0x0E + 0x0],	%l0
	fzeros	%f8
	fbl,a	%fcc1,	loop_8
	fxnors	%f7,	%f5,	%f13
	fbne,a	%fcc1,	loop_9
	fand	%f8,	%f2,	%f0
loop_8:
	for	%f14,	%f0,	%f8
	stx	%l5,	[0x68]
loop_9:
	fand	%f14,	%f2,	%f8
	ldub	[0x6C + 0x0],	%i1
	bge	loop_10
	fxors	%f12,	%f6,	%f4
	bne,a	loop_11
	lduw	[0x0C + 0x0],	%i7
loop_10:
	fcmped	%f14,	%f8
	fbue,a	%fcc3,	loop_12
loop_11:
	ldx	[0x08 + 0x0],	%g2
	fnegd	%f12,	%f8
	ldub	[0x54 + 0x0],	%g4
loop_12:
	lduh	[0x38 + 0x0],	%o5
	stw	%l4,	[0x20]
	fandnot2s	%f4,	%f5,	%f6
	lduh	[0x16 + 0x0],	%g6
	bge,a,pn	%xcc,	loop_13
	fcmped	%f6,	%f14
	stw	%i4,	[0x70]
	stx	%l1,	[0x70]
loop_13:
	lduh	[0x2A + 0x0],	%i0
	fands	%f4,	%f6,	%f5
	stx	%g1,	[0x10]
	fandnot2s	%f13,	%f5,	%f14
	fabss	%f13,	%f15
	lduw	[0x38 + 0x0],	%g7
	stx	%i5,	[0x08]
	lduw	[0x74 + 0x0],	%g3
	fnegs	%f14,	%f3
	bleu,a,pn	%xcc,	loop_14
	fbuge,a	%fcc0,	loop_15
	lduw	[0x4C + 0x0],	%g5
	ldx	[0x28 + 0x0],	%o4
loop_14:
	ldub	[0x59 + 0x0],	%l7
loop_15:
	fandnot2s	%f14,	%f7,	%f10
	stw	%l6,	[0x58]
	ldx	[0x20 + 0x0],	%l2
	lduw	[0x54 + 0x0],	%i2
	lduh	[0x26 + 0x0],	%o0
	fsrc1	%f2,	%f0
	fxnors	%f2,	%f10,	%f1
	fbn	%fcc3,	loop_16
	stw	%o7,	[0x5C]
	ldub	[0x2B + 0x0],	%i3
	lduh	[0x04 + 0x0],	%o6
loop_16:
	brlez,a	%o1,	loop_17
	lduh	[0x4E + 0x0],	%o3
	lduh	[0x3C + 0x0],	%o2
	bvc	%icc,	loop_18
loop_17:
	fxors	%f14,	%f4,	%f6
	ldub	[0x32 + 0x0],	%l0
	fors	%f13,	%f3,	%f14
loop_18:
	lduw	[0x18 + 0x0],	%l5
	stw	%l3,	[0x0C]
	fandnot2s	%f14,	%f5,	%f15
	stx	%i6,	[0x30]
	fsrc2s	%f3,	%f14
	stw	%g2,	[0x7C]
	fcmpd	%f12,	%f2
	bleu,pt	%icc,	loop_19
	lduh	[0x7C + 0x0],	%g4
	stw	%o5,	[0x44]
	stw	%i7,	[0x7C]
loop_19:
	fbue	%fcc2,	loop_20
	ldub	[0x2F + 0x0],	%i1
	stw	%i4,	[0x14]
	fbe,a	%fcc3,	loop_21
loop_20:
	stw	%g6,	[0x68]
	ldx	[0x78 + 0x0],	%i0
	fbe	%fcc1,	loop_22
loop_21:
	ldx	[0x58 + 0x0],	%g1
	fnors	%f11,	%f15,	%f1
	ldx	[0x18 + 0x0],	%l4
loop_22:
	fors	%f3,	%f7,	%f10
	lduh	[0x56 + 0x0],	%i5
	stw	%g3,	[0x64]
	ldub	[0x1C + 0x0],	%g7
	fnor	%f0,	%f8,	%f2
	fnot2s	%f9,	%f11
	ldx	[0x08 + 0x0],	%o4
	fzeros	%f5
	fbo	%fcc0,	loop_23
	lduh	[0x14 + 0x0],	%l1
	fone	%f0
	ldx	[0x08 + 0x0],	%l7
loop_23:
	fmovs	%f1,	%f14
	stw	%g5,	[0x48]
	fbn	%fcc1,	loop_24
	stx	%l2,	[0x50]
	bgu,pt	%xcc,	loop_25
	lduh	[0x74 + 0x0],	%i2
loop_24:
	lduh	[0x34 + 0x0],	%l6
	fzeros	%f10
loop_25:
	fornot1	%f14,	%f0,	%f6
	lduh	[0x22 + 0x0],	%o0
	fbn,a	%fcc2,	loop_26
	ldx	[0x48 + 0x0],	%o7
	fone	%f10
	lduw	[0x2C + 0x0],	%o6
loop_26:
	fsrc1s	%f0,	%f11
	fnor	%f6,	%f10,	%f14
	ldx	[0x68 + 0x0],	%i3
	fxnors	%f8,	%f0,	%f4
	fand	%f10,	%f2,	%f8
	stw	%o3,	[0x6C]
	ldub	[0x1B + 0x0],	%l0
	brgz	%o2,	loop_27
	fblg	%fcc2,	loop_28
	ldx	[0x68 + 0x0],	%l5
	ldub	[0x4E + 0x0],	%o1
loop_27:
	lduh	[0x1E + 0x0],	%l3
loop_28:
	fbo	%fcc0,	loop_29
	bg	%xcc,	loop_30
	lduh	[0x64 + 0x0],	%i6
	ldx	[0x38 + 0x0],	%o5
loop_29:
	ldx	[0x40 + 0x0],	%g4
loop_30:
	fnot1	%f6,	%f12
	fnand	%f2,	%f2,	%f12
	fnors	%f4,	%f6,	%f4
	for	%f2,	%f0,	%f12
	fandnot2s	%f9,	%f4,	%f10
	fbuge	%fcc3,	loop_31
	lduh	[0x6C + 0x0],	%i7
	lduw	[0x24 + 0x0],	%g2
	lduw	[0x1C + 0x0],	%g6
loop_31:
	lduw	[0x50 + 0x0],	%i1
	ldx	[0x58 + 0x0],	%g1
	stx	%i0,	[0x48]
	lduw	[0x34 + 0x0],	%i4
	fcmped	%f6,	%f0
	fxnor	%f12,	%f14,	%f4
	ldx	[0x38 + 0x0],	%i5
	ldx	[0x48 + 0x0],	%g3
	fnands	%f8,	%f9,	%f3
	fxnors	%f7,	%f13,	%f3
	ldx	[0x40 + 0x0],	%l4
	ldub	[0x25 + 0x0],	%o4
	ldub	[0x25 + 0x0],	%l7
	fmovd	%f2,	%f14
	fbge	%fcc0,	loop_32
	lduh	[0x26 + 0x0],	%l1
	fbu,a	%fcc1,	loop_33
	stx	%g7,	[0x58]
loop_32:
	ldub	[0x2C + 0x0],	%l2
	fnot1s	%f11,	%f3
loop_33:
	ldx	[0x68 + 0x0],	%i2
	fabsd	%f6,	%f10
	fand	%f14,	%f6,	%f2
	lduh	[0x66 + 0x0],	%l6
	fbu,a	%fcc3,	loop_34
	lduw	[0x34 + 0x0],	%o0
	lduh	[0x3E + 0x0],	%o7
	lduh	[0x4A + 0x0],	%o6
loop_34:
	fbn	%fcc0,	loop_35
	ldx	[0x58 + 0x0],	%g5
	ldub	[0x45 + 0x0],	%l0
	fxors	%f10,	%f7,	%f2
loop_35:
	fones	%f5
	lduh	[0x6E + 0x0],	%o2
	fxor	%f4,	%f0,	%f6
	fcmpd	%f14,	%f8
	fbg	%fcc1,	loop_36
	ble,a,pt	%xcc,	loop_37
	fand	%f2,	%f0,	%f4
	fcmped	%f8,	%f8
loop_36:
	lduw	[0x0C + 0x0],	%l5
loop_37:
	fones	%f1
	ldx	[0x10 + 0x0],	%i3
	lduh	[0x38 + 0x0],	%l3
	fnegd	%f8,	%f12
	fand	%f14,	%f0,	%f12
	stw	%o3,	[0x6C]
	fornot1s	%f5,	%f9,	%f3
	fbe,a	%fcc1,	loop_38
	fbue,a	%fcc0,	loop_39
	fone	%f0
	ble,a,pn	%xcc,	loop_40
loop_38:
	for	%f12,	%f14,	%f6
loop_39:
	ldub	[0x39 + 0x0],	%o1
	ldx	[0x08 + 0x0],	%g4
loop_40:
	fandnot2s	%f3,	%f1,	%f6
	fnand	%f14,	%f2,	%f4
	fornot2	%f6,	%f12,	%f12
	bgu,a	loop_41
	ldub	[0x72 + 0x0],	%i7
	ldx	[0x20 + 0x0],	%g2
	ldx	[0x38 + 0x0],	%g6
loop_41:
	ldub	[0x3A + 0x0],	%o5
	fones	%f12
	stx	%i1,	[0x70]
	lduh	[0x26 + 0x0],	%i0
	fbne	%fcc1,	loop_42
	lduw	[0x2C + 0x0],	%g1
	fbule,a	%fcc0,	loop_43
	fnand	%f8,	%f10,	%f12
loop_42:
	fors	%f7,	%f11,	%f4
	fornot2	%f8,	%f12,	%f12
loop_43:
	fnands	%f1,	%f12,	%f5
	faligndata	%f6,	%f6,	%f0
	bne,a,pt	%icc,	loop_44
	fnand	%f10,	%f8,	%f2
	fabsd	%f12,	%f12
	fnand	%f0,	%f14,	%f6
loop_44:
	ldub	[0x71 + 0x0],	%i4
	lduw	[0x64 + 0x0],	%g3
	stw	%i6,	[0x4C]
	fmovd	%f4,	%f10
	stx	%l4,	[0x58]
	fands	%f3,	%f15,	%f8
	fandnot1s	%f0,	%f1,	%f3
	ble	loop_45
	stx	%l7,	[0x38]
	stw	%o4,	[0x70]
	ldub	[0x50 + 0x0],	%g7
loop_45:
	ldub	[0x31 + 0x0],	%i5
	ble	%xcc,	loop_46
	bn,pn	%icc,	loop_47
	fnands	%f15,	%f13,	%f10
	stw	%l1,	[0x48]
loop_46:
	lduw	[0x08 + 0x0],	%i2
loop_47:
	fbge,a	%fcc2,	loop_48
	ldx	[0x60 + 0x0],	%l6
	ldub	[0x4E + 0x0],	%l2
	fands	%f12,	%f7,	%f9
loop_48:
	stx	%o7,	[0x10]
	bn,a,pt	%xcc,	loop_49
	stx	%o6,	[0x38]
	ldx	[0x68 + 0x0],	%l0
	lduh	[0x2C + 0x0],	%g5
loop_49:
	fand	%f2,	%f10,	%f6
	lduw	[0x04 + 0x0],	%o2
	fornot2	%f10,	%f8,	%f0
	fnot2	%f4,	%f2
	fandnot1	%f2,	%f12,	%f14
	bg	loop_50
	fands	%f2,	%f5,	%f6
	ldub	[0x10 + 0x0],	%i3
	ldub	[0x6C + 0x0],	%o0
loop_50:
	fand	%f8,	%f4,	%f12
	lduw	[0x68 + 0x0],	%l5
	ldx	[0x10 + 0x0],	%o3
	fsrc2	%f14,	%f12
	lduw	[0x74 + 0x0],	%l3
	fblg	%fcc0,	loop_51
	brgz,a	%o1,	loop_52
	fbne	%fcc0,	loop_53
	stx	%g4,	[0x28]
loop_51:
	bg,a	%icc,	loop_54
loop_52:
	fnegs	%f1,	%f10
loop_53:
	stx	%g2,	[0x38]
	stx	%g6,	[0x08]
loop_54:
	fzero	%f4
	fbl	%fcc3,	loop_55
	lduh	[0x12 + 0x0],	%o5
	brz	%i1,	loop_56
	lduw	[0x1C + 0x0],	%i0
loop_55:
	faligndata	%f0,	%f6,	%f0
	lduh	[0x3A + 0x0],	%i4
loop_56:
	fnot1	%f8,	%f12
	brgez	%g3,	loop_57
	fandnot1	%f10,	%f4,	%f12
	fnot2	%f6,	%f2
	fcmpd	%f0,	%f0
loop_57:
	ldub	[0x09 + 0x0],	%i7
	ldub	[0x23 + 0x0],	%l4
	fornot1	%f8,	%f12,	%f6
	bleu	%xcc,	loop_58
	fnot1s	%f9,	%f12
	lduh	[0x5C + 0x0],	%i6
	stx	%g1,	[0x40]
loop_58:
	fnegd	%f6,	%f10
	stx	%l7,	[0x70]
	lduh	[0x2E + 0x0],	%g7
	stx	%i5,	[0x68]
	lduw	[0x38 + 0x0],	%l1
	fxnors	%f5,	%f14,	%f11
	stw	%l6,	[0x60]
	ldx	[0x50 + 0x0],	%o4
	fornot1s	%f14,	%f1,	%f3
	fnegd	%f0,	%f10
	stw	%i2,	[0x44]
	fandnot2	%f4,	%f0,	%f12
	fnand	%f0,	%f4,	%f6
	fnegs	%f1,	%f11
	fand	%f10,	%f12,	%f12
	ldub	[0x21 + 0x0],	%l2
	fand	%f10,	%f2,	%f8
	lduw	[0x40 + 0x0],	%o7
	ldub	[0x68 + 0x0],	%l0
	stw	%g5,	[0x18]
	lduh	[0x64 + 0x0],	%o2
	ldx	[0x28 + 0x0],	%o6
	fbuge	%fcc2,	loop_59
	ldub	[0x64 + 0x0],	%i3
	ldub	[0x47 + 0x0],	%l5
	fbug,a	%fcc3,	loop_60
loop_59:
	bgu	%xcc,	loop_61
	fcmpd	%f8,	%f0
	lduw	[0x5C + 0x0],	%o3
loop_60:
	lduh	[0x14 + 0x0],	%o0
loop_61:
	lduw	[0x44 + 0x0],	%g4
	fandnot1	%f8,	%f8,	%f10
	bvs	%icc,	loop_62
	fabss	%f3,	%f8
	fmovs	%f6,	%f1
	fornot2s	%f13,	%f14,	%f15
loop_62:
	fxnor	%f8,	%f14,	%f2
	lduw	[0x78 + 0x0],	%o1
	ldub	[0x2F + 0x0],	%l3
	fbug,a	%fcc2,	loop_63
	ldx	[0x48 + 0x0],	%o5
	fmovd	%f2,	%f10
	ldub	[0x2E + 0x0],	%g2
loop_63:
	ldub	[0x1E + 0x0],	%i1
	lduh	[0x48 + 0x0],	%g6
	fcmps	%f13,	%f2
	fcmps	%f15,	%f1
	fbug,a	%fcc1,	loop_64
	fnot1	%f4,	%f2
	lduh	[0x7A + 0x0],	%i0
	ldub	[0x76 + 0x0],	%i4
loop_64:
	fxors	%f14,	%f3,	%f11
	ldx	[0x28 + 0x0],	%l4
	ldx	[0x60 + 0x0],	%g3
	stw	%i6,	[0x5C]
	ldx	[0x20 + 0x0],	%g1
	lduh	[0x7A + 0x0],	%i7
	ldx	[0x50 + 0x0],	%g7
	fnors	%f13,	%f1,	%f10
	ldx	[0x48 + 0x0],	%i5
	stw	%l1,	[0x5C]
	lduh	[0x20 + 0x0],	%l6
	fbue	%fcc2,	loop_65
	stx	%o4,	[0x68]
	stx	%l7,	[0x58]
	fcmped	%f6,	%f2
loop_65:
	stx	%o7,	[0x30]
	lduh	[0x7A + 0x0],	%i2
	stx	%g5,	[0x68]
	fone	%f2
	stx	%l2,	[0x38]
	stw	%l0,	[0x30]
	ldub	[0x51 + 0x0],	%o6
	lduh	[0x08 + 0x0],	%i3
	ldub	[0x38 + 0x0],	%o3
	fornot2s	%f0,	%f14,	%f8
	ldx	[0x70 + 0x0],	%o0
	fornot2	%f8,	%f10,	%f14
	stx	%o2,	[0x28]
	stx	%o1,	[0x30]
	faligndata	%f12,	%f0,	%f2
	stx	%l3,	[0x30]
	fzeros	%f15
	brgez,a	%o5,	loop_66
	fcmpes	%f1,	%f9
	bleu,a	%icc,	loop_67
	fnands	%f4,	%f7,	%f15
loop_66:
	lduw	[0x54 + 0x0],	%l5
	stx	%g2,	[0x60]
loop_67:
	ldub	[0x6F + 0x0],	%i1
	fands	%f8,	%f2,	%f10
	fbge,a	%fcc0,	loop_68
	fnegd	%f2,	%f12
	fnot1	%f6,	%f12
	fabsd	%f14,	%f10
loop_68:
	fandnot1s	%f7,	%f10,	%f5
	lduh	[0x16 + 0x0],	%i0
	ldx	[0x58 + 0x0],	%g6
	lduw	[0x3C + 0x0],	%i4
	fornot2	%f4,	%f0,	%f8
	fmovd	%f0,	%f2
	ldx	[0x28 + 0x0],	%g3
	stw	%l4,	[0x48]
	ldx	[0x20 + 0x0],	%i6
	lduh	[0x3A + 0x0],	%g1
	fcmps	%f5,	%f14
	fzero	%f2
	lduh	[0x1E + 0x0],	%g4
	brlz	%i5,	loop_69
	fxor	%f0,	%f2,	%f8
	ldx	[0x08 + 0x0],	%l1
	lduh	[0x0E + 0x0],	%l6
loop_69:
	fbu	%fcc1,	loop_70
	lduh	[0x14 + 0x0],	%i7
	fble,a	%fcc3,	loop_71
	stw	%o4,	[0x38]
loop_70:
	ldx	[0x40 + 0x0],	%l7
	lduh	[0x4E + 0x0],	%g7
loop_71:
	ldx	[0x30 + 0x0],	%o7
	fxnor	%f10,	%f14,	%f6
	fandnot1	%f6,	%f0,	%f0
	lduh	[0x30 + 0x0],	%l2
	stw	%g5,	[0x78]
	fnegd	%f0,	%f4
	lduh	[0x2A + 0x0],	%i2
	stx	%o6,	[0x38]
	fandnot1s	%f6,	%f15,	%f8
	fnegs	%f14,	%f15
	fxor	%f6,	%f12,	%f4
	lduw	[0x0C + 0x0],	%i3
	faligndata	%f14,	%f8,	%f4
	fcmpes	%f6,	%f6
	lduw	[0x20 + 0x0],	%o0
	fandnot2	%f12,	%f8,	%f8
	stx	%o2,	[0x70]
	ldx	[0x10 + 0x0],	%l0
	stx	%o1,	[0x60]
	fxnors	%f0,	%f2,	%f3
	ldub	[0x0A + 0x0],	%l3
	stw	%o3,	[0x74]
	lduw	[0x54 + 0x0],	%o5
	fsrc2s	%f5,	%f12
	fones	%f13
	stw	%l5,	[0x70]
	ldub	[0x35 + 0x0],	%g2
	bvs,a,pt	%xcc,	loop_72
	ldub	[0x23 + 0x0],	%g6
	ldub	[0x39 + 0x0],	%i0
	lduw	[0x00 + 0x0],	%i1
loop_72:
	ldx	[0x38 + 0x0],	%g3
	brz,a	%l4,	loop_73
	fands	%f3,	%f9,	%f9
	ba,a,pt	%xcc,	loop_74
	fornot2s	%f0,	%f0,	%f2
loop_73:
	lduw	[0x1C + 0x0],	%i4
	brgz,a	%i6,	loop_75
loop_74:
	bne,pt	%xcc,	loop_76
	fbe,a	%fcc0,	loop_77
	fcmpes	%f7,	%f7
loop_75:
	fnegd	%f4,	%f10
loop_76:
	ldub	[0x60 + 0x0],	%g1
loop_77:
	fcmps	%f10,	%f12
	fxnors	%f9,	%f13,	%f14
	ldx	[0x10 + 0x0],	%i5
	stw	%g4,	[0x04]
	stw	%l1,	[0x7C]
	fnor	%f8,	%f10,	%f8
	stx	%o4,	[0x48]
	fnot1s	%f15,	%f11
	lduh	[0x5E + 0x0],	%l7
	fandnot1s	%f8,	%f2,	%f10
	stx	%l6,	[0x48]
	fsrc2	%f2,	%f8
	stw	%i7,	[0x10]
	fbul	%fcc3,	loop_78
	ldx	[0x10 + 0x0],	%g7
	fsrc2	%f0,	%f14
	lduh	[0x20 + 0x0],	%g5
loop_78:
	bcc,pn	%xcc,	loop_79
	fnot1s	%f9,	%f11
	stx	%l2,	[0x38]
	stw	%i2,	[0x04]
loop_79:
	ldx	[0x68 + 0x0],	%i3
	fbl	%fcc2,	loop_80
	ldx	[0x10 + 0x0],	%o6
	ldub	[0x51 + 0x0],	%o0
	fnors	%f11,	%f12,	%f13
loop_80:
	ldx	[0x50 + 0x0],	%o7
	fornot2	%f6,	%f14,	%f2
	fxnors	%f8,	%f0,	%f2
	stw	%l0,	[0x54]
	fbug	%fcc0,	loop_81
	ldx	[0x58 + 0x0],	%l3
	fnor	%f10,	%f8,	%f8
	fnot1s	%f14,	%f12
loop_81:
	fandnot1	%f0,	%f14,	%f12
	stx	%o2,	[0x08]
	lduw	[0x2C + 0x0],	%o3
	fandnot2s	%f0,	%f1,	%f10
	brz	%l5,	loop_82
	lduh	[0x58 + 0x0],	%g2
	lduw	[0x64 + 0x0],	%o5
	stw	%g6,	[0x54]
loop_82:
	fornot2s	%f9,	%f10,	%f10
	fnegs	%f12,	%f12
	lduw	[0x28 + 0x0],	%o1
	ldub	[0x36 + 0x0],	%i0
	fornot1s	%f15,	%f7,	%f0
	ldub	[0x60 + 0x0],	%g3
	fors	%f3,	%f1,	%f15
	ldx	[0x58 + 0x0],	%i4
	ldx	[0x60 + 0x0],	%i1
	bgu,a	%icc,	loop_83
	ldub	[0x72 + 0x0],	%l4
	fnot2	%f8,	%f4
	fnot1s	%f11,	%f0
loop_83:
	ldx	[0x08 + 0x0],	%i5
	fsrc1	%f6,	%f2
	fnors	%f15,	%f8,	%f13
	fornot2s	%f10,	%f5,	%f15
	fnot1s	%f1,	%f6
	stw	%i6,	[0x48]
	brz	%g1,	loop_84
	lduh	[0x22 + 0x0],	%g4
	ldub	[0x02 + 0x0],	%l7
	lduw	[0x04 + 0x0],	%o4
loop_84:
	fcmped	%f6,	%f8
	brgez	%l6,	loop_85
	faligndata	%f12,	%f14,	%f10
	ldub	[0x43 + 0x0],	%g7
	ldub	[0x2A + 0x0],	%l1
loop_85:
	fnands	%f10,	%f13,	%f7
	fnegs	%f15,	%f10
	fones	%f0
	for	%f14,	%f2,	%f2
	ldub	[0x35 + 0x0],	%g5
	bvc,a,pt	%xcc,	loop_86
	fcmped	%f8,	%f8
	fornot1s	%f0,	%f9,	%f1
	fnegd	%f2,	%f6
loop_86:
	fnot1s	%f6,	%f2
	ldx	[0x48 + 0x0],	%i2
	lduw	[0x70 + 0x0],	%i3
	stx	%i7,	[0x28]
	fbg	%fcc0,	loop_87
	lduh	[0x56 + 0x0],	%o0
	fsrc2s	%f11,	%f0
	ldx	[0x50 + 0x0],	%l2
loop_87:
	bl,a,pn	%xcc,	loop_88
	stx	%o7,	[0x70]
	ldx	[0x50 + 0x0],	%o6
	stw	%l0,	[0x7C]
loop_88:
	stx	%l3,	[0x78]
	fone	%f6
	ldx	[0x28 + 0x0],	%l5
	fors	%f4,	%f0,	%f3
	fbg,a	%fcc2,	loop_89
	fbn,a	%fcc1,	loop_90
	fsrc1s	%f8,	%f10
	stx	%o2,	[0x58]
loop_89:
	fnand	%f6,	%f4,	%f0
loop_90:
	stx	%o3,	[0x20]
	fbe,a	%fcc0,	loop_91
	ldub	[0x45 + 0x0],	%g2
	ldx	[0x28 + 0x0],	%o1
	lduw	[0x04 + 0x0],	%o5
loop_91:
	lduh	[0x16 + 0x0],	%g6
	stw	%i4,	[0x70]
	bn,pt	%icc,	loop_92
	brgz	%g3,	loop_93
	ldub	[0x6A + 0x0],	%l4
	fornot2	%f6,	%f4,	%f8
loop_92:
	fnot2s	%f13,	%f11
loop_93:
	lduw	[0x1C + 0x0],	%i0
	ldub	[0x6F + 0x0],	%i5
	ldx	[0x48 + 0x0],	%g1
	stx	%i1,	[0x30]
	lduw	[0x44 + 0x0],	%l7
	bcs,a	%icc,	loop_94
	lduw	[0x30 + 0x0],	%g4
	fabsd	%f12,	%f10
	fnor	%f14,	%f4,	%f0
loop_94:
	fones	%f4
	ldub	[0x7C + 0x0],	%l6
	fabsd	%f8,	%f4
	ldx	[0x40 + 0x0],	%i6
	ldx	[0x30 + 0x0],	%g7
	brnz	%l1,	loop_95
	fxnor	%f12,	%f2,	%f0
	lduw	[0x3C + 0x0],	%o4
	ldx	[0x58 + 0x0],	%i3
loop_95:
	fone	%f12
	stx	%i7,	[0x18]
	stx	%g5,	[0x68]
	stx	%i2,	[0x40]
	stw	%l2,	[0x44]
	ldx	[0x50 + 0x0],	%o7
	ldub	[0x0E + 0x0],	%l0
	lduw	[0x6C + 0x0],	%o0
	fornot2	%f0,	%f8,	%f6
	lduh	[0x1C + 0x0],	%l5
	fone	%f6
	fnot2	%f10,	%f8
	ldx	[0x48 + 0x0],	%l3
	fabss	%f0,	%f12
	lduw	[0x58 + 0x0],	%o2
	fnot2	%f4,	%f0
	fnegd	%f8,	%f10
	lduh	[0x38 + 0x0],	%o6
	ldub	[0x7E + 0x0],	%o3
	ldub	[0x46 + 0x0],	%o1
	fbne	%fcc3,	loop_96
	faligndata	%f2,	%f2,	%f4
	fbu	%fcc3,	loop_97
	stx	%g6,	[0x68]
loop_96:
	ldx	[0x70 + 0x0],	%i4
	lduh	[0x64 + 0x0],	%g2
loop_97:
	stw	%o5,	[0x14]
	fone	%f12
	fandnot1s	%f13,	%f7,	%f7
	stx	%l4,	[0x18]
	fbuge,a	%fcc1,	loop_98
	fxnor	%f0,	%f4,	%f12
	fbg	%fcc0,	loop_99
	ldx	[0x50 + 0x0],	%i0
loop_98:
	fabss	%f3,	%f13
	ldx	[0x38 + 0x0],	%i5
loop_99:
	stw	%g1,	[0x60]
	brz,a	%g3,	loop_100
	stw	%g4,	[0x20]
	stw	%i1,	[0x6C]
	fnot1s	%f3,	%f12
loop_100:
	ldx	[0x70 + 0x0],	%i6
	fzeros	%f4
	ldx	[0x08 + 0x0],	%l7
	faligndata	%f12,	%f6,	%f10
	ldx	[0x20 + 0x0],	%l6
	fbne	%fcc2,	loop_101
	bcc,pn	%icc,	loop_102
	ldx	[0x20 + 0x0],	%l1
	stw	%g7,	[0x4C]
loop_101:
	ldx	[0x78 + 0x0],	%i7
loop_102:
	fzero	%f4
	fnegs	%f11,	%f7
	ldub	[0x06 + 0x0],	%g5
	fsrc2	%f6,	%f10
	lduw	[0x64 + 0x0],	%o4
	lduh	[0x0C + 0x0],	%l2
	lduh	[0x52 + 0x0],	%i3
	fxors	%f7,	%f14,	%f7
	stw	%i2,	[0x0C]
	bge	loop_103
	stw	%o0,	[0x70]
	fbul,a	%fcc3,	loop_104
	ble,pn	%xcc,	loop_105
loop_103:
	fzeros	%f14
	lduh	[0x3C + 0x0],	%l5
loop_104:
	fornot2	%f10,	%f0,	%f2
loop_105:
	for	%f6,	%f4,	%f4
	fors	%f8,	%f11,	%f13
	fsrc2	%f12,	%f0
	ldx	[0x08 + 0x0],	%l0
	fands	%f14,	%f11,	%f3
	fzero	%f14
	fnand	%f6,	%f8,	%f10
	lduw	[0x40 + 0x0],	%o7
	lduw	[0x6C + 0x0],	%o6
	fnot1	%f12,	%f2
	ldub	[0x10 + 0x0],	%o3
	fnors	%f12,	%f7,	%f14
	fnand	%f12,	%f14,	%f4
	fbo,a	%fcc0,	loop_106
	lduh	[0x28 + 0x0],	%l3
	fcmped	%f6,	%f4
	fbne,a	%fcc1,	loop_107
loop_106:
	fandnot2	%f4,	%f12,	%f14
	brgez,a	%o1,	loop_108
	fmovs	%f4,	%f12
loop_107:
	fcmpd	%f10,	%f2
	fmovs	%f8,	%f1
loop_108:
	stw	%i4,	[0x20]
	stw	%g6,	[0x78]
	fnor	%f8,	%f10,	%f12
	bg,a	%icc,	loop_109
	lduh	[0x40 + 0x0],	%o5
	fnot1s	%f11,	%f0
	stx	%l4,	[0x58]
loop_109:
	faligndata	%f14,	%f0,	%f10
	ldub	[0x6E + 0x0],	%i0
	fandnot1	%f10,	%f14,	%f14
	bvs,pn	%icc,	loop_110
	fcmpd	%f10,	%f10
	lduh	[0x7C + 0x0],	%o2
	fbuge,a	%fcc1,	loop_111
loop_110:
	fandnot2	%f12,	%f2,	%f12
	lduh	[0x50 + 0x0],	%i5
	ldx	[0x28 + 0x0],	%g3
loop_111:
	fands	%f9,	%f10,	%f9
	fone	%f0
	stx	%g2,	[0x40]
	lduw	[0x0C + 0x0],	%i1
	stw	%g1,	[0x5C]
	lduh	[0x6E + 0x0],	%g4
	fblg,a	%fcc1,	loop_112
	fors	%f2,	%f5,	%f4
	lduw	[0x6C + 0x0],	%i6
	lduh	[0x24 + 0x0],	%l7
loop_112:
	fornot1s	%f11,	%f9,	%f0
	lduh	[0x36 + 0x0],	%g7
	fnand	%f6,	%f10,	%f10
	stw	%l1,	[0x4C]
	fandnot1	%f8,	%f10,	%f8
	fandnot2s	%f3,	%f9,	%f13
	lduh	[0x30 + 0x0],	%g5
	lduh	[0x42 + 0x0],	%o4
	ldub	[0x75 + 0x0],	%i7
	fzero	%f6
	lduh	[0x1E + 0x0],	%l2
	ldx	[0x60 + 0x0],	%i3
	ldx	[0x58 + 0x0],	%o0
	lduw	[0x30 + 0x0],	%l6
	fornot1	%f14,	%f12,	%f12
	bvs,a,pn	%icc,	loop_113
	fmovd	%f8,	%f14
	fornot1s	%f11,	%f10,	%f9
	stw	%l5,	[0x18]
loop_113:
	lduh	[0x08 + 0x0],	%l0
	fnors	%f7,	%f14,	%f1
	bl,a,pt	%xcc,	loop_114
	ldx	[0x48 + 0x0],	%o7
	bl,pt	%icc,	loop_115
	lduw	[0x74 + 0x0],	%i2
loop_114:
	lduw	[0x58 + 0x0],	%o3
	ba	loop_116
loop_115:
	ldub	[0x19 + 0x0],	%l3
	fnot1s	%f9,	%f12
	ldub	[0x5B + 0x0],	%i4
loop_116:
	lduw	[0x10 + 0x0],	%o1
	fsrc2	%f8,	%f6
	fsrc2s	%f8,	%f1
	ldub	[0x23 + 0x0],	%o5
	fxor	%f10,	%f12,	%f0
	fbg,a	%fcc0,	loop_117
	fbo	%fcc3,	loop_118
	brz,a	%g6,	loop_119
	ldub	[0x02 + 0x0],	%o6
loop_117:
	stx	%i0,	[0x78]
loop_118:
	fxnors	%f7,	%f15,	%f15
loop_119:
	stw	%l4,	[0x2C]
	fsrc2	%f4,	%f12
	stx	%o2,	[0x38]
	fsrc1	%f14,	%f8
	fone	%f8
	fandnot2s	%f9,	%f14,	%f14
	fbule	%fcc2,	loop_120
	ldub	[0x22 + 0x0],	%i5
	fandnot2s	%f10,	%f6,	%f11
	fnot2s	%f2,	%f13
loop_120:
	stx	%i1,	[0x40]
	fbu	%fcc2,	loop_121
	stw	%g3,	[0x7C]
	lduw	[0x74 + 0x0],	%g4
	fsrc2s	%f2,	%f4
loop_121:
	ldub	[0x46 + 0x0],	%i6
	fxnor	%f12,	%f2,	%f12
	fbo	%fcc3,	loop_122
	ldub	[0x1A + 0x0],	%l7
	bvs,a	loop_123
	fzeros	%f0
loop_122:
	fbl,a	%fcc3,	loop_124
	brlz,a	%g7,	loop_125
loop_123:
	ldx	[0x40 + 0x0],	%g1
	lduh	[0x5C + 0x0],	%g5
loop_124:
	fxor	%f0,	%f14,	%f10
loop_125:
	stx	%g2,	[0x28]
	fornot2s	%f15,	%f15,	%f9
	ldub	[0x3B + 0x0],	%l1
	ldub	[0x65 + 0x0],	%i7
	ldub	[0x77 + 0x0],	%o4
	ldx	[0x20 + 0x0],	%l2
	bleu,a	loop_126
	stw	%l6,	[0x24]
	lduw	[0x48 + 0x0],	%i3
	ldx	[0x30 + 0x0],	%l5
loop_126:
	fabsd	%f6,	%f2
	fsrc2	%f10,	%f8
	fand	%f4,	%f8,	%f10
	fnegd	%f0,	%f10
	fbne,a	%fcc1,	loop_127
	stx	%l0,	[0x08]
	stx	%o7,	[0x18]
	fnot1s	%f15,	%f13
loop_127:
	stw	%o0,	[0x68]
	bvc,a	loop_128
	brz	%l3,	loop_129
	fones	%f4
	bpos,a	%icc,	loop_130
loop_128:
	ba,a,pt	%xcc,	loop_131
loop_129:
	bpos,a	%icc,	loop_132
	fnot1s	%f9,	%f3
loop_130:
	fandnot1s	%f3,	%f10,	%f12
loop_131:
	bne	%xcc,	loop_133
loop_132:
	fcmpes	%f10,	%f3
	ldx	[0x50 + 0x0],	%o3
	stw	%i2,	[0x08]
loop_133:
	lduw	[0x2C + 0x0],	%o5
	fbule,a	%fcc1,	loop_134
	fnegd	%f14,	%f0
	fsrc2	%f10,	%f6
	lduh	[0x5E + 0x0],	%g6
loop_134:
	fabss	%f11,	%f1
	fmovd	%f14,	%f6
	fands	%f10,	%f8,	%f3
	lduw	[0x30 + 0x0],	%o1
	lduh	[0x2C + 0x0],	%o6
	fbue,a	%fcc2,	loop_135
	fands	%f3,	%f12,	%f6
	bleu,pn	%xcc,	loop_136
	stx	%i0,	[0x48]
loop_135:
	fblg,a	%fcc3,	loop_137
	ba	%xcc,	loop_138
loop_136:
	lduh	[0x24 + 0x0],	%i4
	fands	%f2,	%f2,	%f4
loop_137:
	fnot2s	%f3,	%f6
loop_138:
	fcmpes	%f5,	%f4
	fnands	%f2,	%f10,	%f6
	ldx	[0x30 + 0x0],	%i5
	fornot2s	%f7,	%f0,	%f2
	fbule	%fcc1,	loop_139
	lduw	[0x08 + 0x0],	%i1
	fble,a	%fcc0,	loop_140
	fornot1s	%f8,	%f6,	%f9
loop_139:
	fbne	%fcc3,	loop_141
	fxnor	%f12,	%f8,	%f10
loop_140:
	fands	%f8,	%f12,	%f10
	stx	%l4,	[0x38]
loop_141:
	stx	%g3,	[0x38]
	fbuge	%fcc3,	loop_142
	fnegd	%f2,	%f14
	bvc,a	loop_143
	ldub	[0x4B + 0x0],	%o2
loop_142:
	brlz	%g4,	loop_144
	ldx	[0x78 + 0x0],	%i6
loop_143:
	brlez,a	%l7,	loop_145
	brgez	%g1,	loop_146
loop_144:
	fcmps	%f1,	%f14
	stx	%g7,	[0x70]
loop_145:
	fble	%fcc2,	loop_147
loop_146:
	fxors	%f8,	%f14,	%f6
	ldx	[0x48 + 0x0],	%l1
	fcmpes	%f1,	%f15
loop_147:
	lduh	[0x22 + 0x0],	%g5
	lduw	[0x44 + 0x0],	%g2
	ldx	[0x48 + 0x0],	%o4
	for	%f8,	%f4,	%f14
	fnot1	%f0,	%f2
	ldub	[0x1C + 0x0],	%l6
	fnands	%f13,	%f3,	%f10
	bl,a	loop_148
	fnot1s	%f7,	%f9
	lduh	[0x02 + 0x0],	%i3
	ldub	[0x26 + 0x0],	%l5
loop_148:
	fornot2	%f12,	%f8,	%f6
	bcs,a,pn	%xcc,	loop_149
	lduh	[0x7C + 0x0],	%i7
	stx	%l2,	[0x70]
	fnot1s	%f12,	%f6
loop_149:
	ldub	[0x08 + 0x0],	%l0
	lduw	[0x2C + 0x0],	%o0
	stx	%o7,	[0x48]
	fabsd	%f0,	%f4
	bpos,pt	%icc,	loop_150
	ldub	[0x18 + 0x0],	%i2
	lduh	[0x26 + 0x0],	%o3
	stw	%l3,	[0x14]
loop_150:
	ldub	[0x25 + 0x0],	%o5
	stx	%o1,	[0x68]
	fnot1	%f14,	%f8
	lduw	[0x4C + 0x0],	%o6
	stw	%i0,	[0x6C]
	fxnor	%f0,	%f4,	%f4
	fbul	%fcc1,	loop_151
	lduw	[0x3C + 0x0],	%i4
	stx	%i1,	[0x30]
	ldx	[0x18 + 0x0],	%l4
loop_151:
	fors	%f3,	%f15,	%f9
	stw	%g3,	[0x68]
	ldub	[0x39 + 0x0],	%i5
	fbul,a	%fcc0,	loop_152
	fxors	%f2,	%f14,	%f6
	stx	%o2,	[0x68]
	fbo,a	%fcc1,	loop_153
loop_152:
	stx	%g6,	[0x68]
	lduw	[0x64 + 0x0],	%i6
	fmovd	%f2,	%f10
loop_153:
	ldx	[0x20 + 0x0],	%l7
	lduh	[0x3E + 0x0],	%g4
	fsrc1s	%f12,	%f14
	stx	%l1,	[0x70]
	fand	%f12,	%f2,	%f14
	stx	%g5,	[0x30]
	ldub	[0x10 + 0x0],	%g7
	ldx	[0x28 + 0x0],	%g2
	fxnor	%f2,	%f14,	%f14
	fnot1s	%f7,	%f5
	stx	%g1,	[0x18]
	fcmpes	%f2,	%f2
	fbge,a	%fcc0,	loop_154
	fcmped	%f6,	%f6
	fcmps	%f8,	%f10
	ldub	[0x63 + 0x0],	%i3
loop_154:
	brgez,a	%l5,	loop_155
	fbne	%fcc0,	loop_156
	lduh	[0x12 + 0x0],	%o4
	ldub	[0x06 + 0x0],	%l2
loop_155:
	lduh	[0x1C + 0x0],	%i7
loop_156:
	fornot1s	%f8,	%f3,	%f4
	fbuge	%fcc3,	loop_157
	ldx	[0x48 + 0x0],	%l6
	lduh	[0x06 + 0x0],	%o7
	fornot2s	%f4,	%f5,	%f2
loop_157:
	bn	%icc,	loop_158
	lduw	[0x18 + 0x0],	%o0
	bvs	%icc,	loop_159
	ldub	[0x76 + 0x0],	%l0
loop_158:
	fsrc2	%f4,	%f2
	fbul	%fcc3,	loop_160
loop_159:
	brgez	%o3,	loop_161
	fxor	%f6,	%f6,	%f8
	stw	%l3,	[0x0C]
loop_160:
	ldx	[0x70 + 0x0],	%o1
loop_161:
	fcmpes	%f15,	%f2
	stx	%o5,	[0x28]
	faligndata	%f6,	%f2,	%f14
	stx	%o6,	[0x08]
	bcc,pt	%xcc,	loop_162
	fsrc2s	%f1,	%f12
	fandnot1s	%f10,	%f11,	%f12
	ldub	[0x17 + 0x0],	%i4
loop_162:
	fands	%f10,	%f14,	%f14
	fnegd	%f2,	%f2
	fsrc2	%f2,	%f12
	fbuge	%fcc0,	loop_163
	bgu	loop_164
	stw	%i2,	[0x1C]
	fandnot1	%f2,	%f8,	%f10
loop_163:
	lduw	[0x5C + 0x0],	%i1
loop_164:
	fbe	%fcc2,	loop_165
	bge,a,pn	%icc,	loop_166
	bg,pt	%xcc,	loop_167
	fmovs	%f10,	%f5
loop_165:
	ldub	[0x4A + 0x0],	%l4
loop_166:
	bne,pn	%xcc,	loop_168
loop_167:
	stw	%g3,	[0x14]
	stw	%o2,	[0x58]
	ba,pt	%xcc,	loop_169
loop_168:
	fblg	%fcc1,	loop_170
	fnot2s	%f6,	%f5
	fcmped	%f4,	%f2
loop_169:
	brlz	%i5,	loop_171
loop_170:
	fnor	%f12,	%f6,	%f4
	lduh	[0x64 + 0x0],	%g6
	fone	%f2
loop_171:
	for	%f4,	%f10,	%f4
	brlez,a	%i0,	loop_172
	fornot2	%f4,	%f6,	%f14
	stw	%l7,	[0x08]
	lduh	[0x16 + 0x0],	%l1
loop_172:
	fnot1s	%f10,	%f12
	ldub	[0x64 + 0x0],	%g4
	bleu	loop_173
	stx	%g5,	[0x78]
	fand	%f10,	%f2,	%f0
	ldub	[0x4F + 0x0],	%i6
loop_173:
        nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Diag:
!
!	Type f   	: 354
!	Type cti   	: 173
!	Type l   	: 473
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x5CB31522
.word 0x4258B5CB
.word 0xF00AE3DA
.word 0x00529437
.word 0xE0A4E49D
.word 0x72DB0C74
.word 0x49E382BD
.word 0x42211774
.word 0xED6AE996
.word 0x0394199E
.word 0xA7C0E6AF
.word 0xA42B76D1
.word 0xBB3330B9
.word 0x41B5B078
.word 0x038EF7FB
.word 0x24DB683E
.word 0x3C84DEC3
.word 0xC2DE26D0
.word 0xE6A200E4
.word 0x9C09CB55
.word 0x8C63B37E
.word 0xD5A306D4
.word 0x096914C2
.word 0x3AE36F31
.word 0xFDC9A29D
.word 0x7E1E54E0
.word 0xB4DAD8D0
.word 0xC450571B
.word 0x473B81F5
.word 0x5397B940
.word 0x96DE03A1
.word 0x7C526536
.word 0x8FDB4970
.word 0x1CAC9400
.word 0x4C29A09D
.word 0xF09CCBDD
.word 0xF68D5064
.word 0xE23F8607
.word 0x96127EE5
.word 0x044936BB
.word 0xE7794C96
.word 0x6AB99706
.word 0x68EC6B7A
.word 0xB90A4B21
.word 0xA5D2C654
.word 0x30C8B3FF
.word 0xC0DEACFA
.word 0x472DC55F
.word 0x8DFF23C7
.word 0x379AC652
.word 0x6F1C5A2C
.word 0x4FCB4D5A
.word 0x04D276C1
.word 0xDC18A953
.word 0xF920C193
.word 0x87DE2B71
.word 0xDAB2B696
.word 0x6C06722B
.word 0xBE2A4F4C
.word 0xBBA1B343
.word 0x39B00D3C
.word 0xDA48173D
.word 0x1E95CC94
.word 0xA615C258
.end
