/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_04.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=115127"
.ident "Thu Dec 11 11:42:52 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_04.s,v 1.4 2007/07/27 21:45:30 drp Exp $"
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
	set	0xF,	%g1
	set	0xB,	%g2
	set	0x0,	%g3
	set	0x2,	%g4
	set	0xA,	%g5
	set	0xE,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x5,	%i1
	set	-0x8,	%i2
	set	-0x2,	%i3
	set	-0x6,	%i4
	set	-0xC,	%i5
	set	-0xD,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x24466B89,	%l0
	set	0x16134B0B,	%l1
	set	0x78BEC051,	%l2
	set	0x55F4BA60,	%l3
	set	0x51BA298C,	%l4
	set	0x75BAA76E,	%l5
	set	0x35208103,	%l6
	!# Output registers
	set	0x0D5A,	%o0
	set	0x1ABB,	%o1
	set	0x1765,	%o2
	set	0x0DA3,	%o3
	set	0x05D4,	%o4
	set	0x0637,	%o5
	set	-0x0F99,	%o6
	set	-0x03FC,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	movneg	%xcc,	%o2,	%o5
	fsrc2s	%f11,	%f14
	siam	0x7
	bpos,pn	%icc,	loop_1
	rd	%sys_tick_cmpr,	%l4
	move	%xcc,	0x102,	%i2
	call	loop_2
loop_1:
	edge8n	%g6,	%l6,	%l2
	fcmped	%fcc2,	%f30,	%f10
	call	loop_3
loop_2:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	ldsw	[%l7 + 0x54],	%o6
	xnor	%g4,	%i1,	%o1
loop_3:
	edge8	%o0,	%o3,	%g1
	fmovdule	%fcc0,	%f18,	%f6
	rdhpr	%htba,	%l3
	fmuld8sux16	%f30,	%f21,	%f0
	set	0x5C, %o1
	lda	[%l7 + %o1] 0x81,	%f14
	fnor	%f28,	%f24,	%f6
	call	loop_4
	call	loop_5
	tge	%xcc,	0x6
	call	loop_6
loop_4:
	fcmple32	%f6,	%f18,	%o7
loop_5:
	sub	%i7,	0x12E1,	%g5
	call	loop_7
loop_6:
	call	loop_8
	smul	%o4,	%l1,	%i4
	nop
	setx	loop_9,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031200001403,	%l0,	%l1
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
loop_7:
	movge	%fcc0,	%g7,	%l5
loop_8:
	array16	%i0,	%l0,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5CD, 	%tick_cmpr
loop_9:
	bne,a	%xcc,	loop_10
	call	loop_11
	rdpr	%wstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE09, 	%hsys_tick_cmpr
loop_10:
	rd	%y,	%o5
loop_11:
	fmovdg	%icc,	%f10,	%f2
	fcmpd	%fcc2,	%f10,	%f2
	fnot1s	%f25,	%f9
	fmovda	%icc,	%f6,	%f18
	fpadd16s	%f22,	%f14,	%f8
	nop
	fitos	%f13,	%f20
	fstod	%f20,	%f30
	fmul8x16au	%f4,	%f25,	%f28
	edge16ln	%i5,	%l4,	%g6
	call	loop_12
	movue	%fcc2,	%i2,	%l6
	fmovsl	%fcc3,	%f3,	%f21
	sllx	%o6,	%l2,	%g4
loop_12:
	fmovdul	%fcc1,	%f28,	%f2
	call	loop_13
	tle	%icc,	0x1
	fpackfix	%f26,	%f26
	movge	%xcc,	0x0B1,	%i1
loop_13:
	edge32	%o0,	%o1,	%g1
	bgu,pt	%xcc,	loop_14
	tvc	%icc,	0x7
	ldsw	[%l7 + 0x6C],	%o3
	edge8l	%o7,	%l3,	%i7
loop_14:
	fbul,a	%fcc0,	loop_15
	call	loop_16
	brgez	%g5,	loop_17
	call	loop_18
loop_15:
	call	loop_19
loop_16:
	call	loop_20
loop_17:
	orncc	%l1,	%o4,	%g7
loop_18:
	faligndata	%f16,	%f0,	%f4
loop_19:
	movpos	%icc,	0x791,	%l5
loop_20:
	fone	%f26
	edge32n	%i4,	%i0,	%l0
	fmovsg	%fcc1,	%f6,	%f4
	call	loop_21
	movule	%fcc2,	0x75D,	%g3
	fmovdge	%fcc3,	%f26,	%f10
	call	loop_22
loop_21:
	edge32l	%i6,	%i3,	%o2
	fmovdule	%fcc3,	%f0,	%f4
	rdpr	%cleanwin,	%g2
loop_22:
	nop
	set	0x4A, %l2
	lduha	[%l7 + %l2] 0x04,	%i5
	call	loop_23
	movrne	%o5,	0x1ED,	%g6
	fabss	%f22,	%f8
	call	loop_24
loop_23:
	sdiv	%l4,	%l6,	%i2
	wr	%l2,	0x136C,	%y
	addccc	%o6,	%i1,	%g4
loop_24:
	nop
	setx	0xF4EBD1F6FFF514A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	bge,a,pt	%xcc,	loop_25
	call	loop_26
	pdist	%f20,	%f0,	%f4
	fandnot2	%f4,	%f8,	%f6
loop_25:
	fcmpeq16	%f4,	%f12,	%o0
loop_26:
	fzero	%f6
	call	loop_27
	fpadd32	%f16,	%f16,	%f10
	rd	%softint,	%g1
	wr	%o3,	%o1,	%clear_softint
loop_27:
	fpadd16	%f18,	%f14,	%f20
	xor	%l3,	0x0D57,	%i7
	wrpr 	%g0, 	0x3, 	%gl
	movug	%fcc3,	0x7E4,	%o4
	sdivx	%g7,	0x00,	%l5
	fornot2s	%f21,	%f13,	%f28
	fmovdu	%fcc1,	%f2,	%f2
	fmul8sux16	%f20,	%f20,	%f6
	fmovdpos	%xcc,	%f8,	%f2
	fbge	%fcc1,	loop_28
	edge8n	%l1,	%i0,	%i4
	call	loop_29
	tl	%xcc,	0x0
loop_28:
	sub	%l0,	%g3,	%i6
	edge32ln	%o2,	%i3,	%i5
loop_29:
	movn	%xcc,	%g2,	%g6
	movu	%fcc1,	%l4,	%o5
	movrne	%i2,	%l2,	%o6
	call	loop_30
	tn	%icc,	0x2
	rd	%softint,	%i1
	sth	%l6,	[%l7 + 0x7E]
loop_30:
	fmovdge	%fcc0,	%f24,	%f14
	tcc	%icc,	0x7
	call	loop_31
	call	loop_32
	pdist	%f24,	%f8,	%f14
	rdpr	%cleanwin,	%o0
loop_31:
	fmovsge	%fcc3,	%f4,	%f8
loop_32:
	fmovdvs	%xcc,	%f24,	%f18
	fabsd	%f28,	%f12
	call	loop_33
	fmovdge	%icc,	%f4,	%f16
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g1,	%o3
loop_33:
	movug	%fcc0,	0x444,	%g4
	subcc	%o1,	0x0B32,	%l3
	movrgez	%g5,	0x046,	%i7
	movule	%fcc0,	%o4,	%o7
	fmul8x16au	%f19,	%f16,	%f28
	call	loop_34
	wrpr	%g7,	0x01B1,	%cwp
	addcc	%l5,	0x0983,	%l1
	fmovsl	%fcc0,	%f22,	%f4
loop_34:
	fmovdu	%fcc3,	%f20,	%f14
	call	loop_35
	ldd	[%l7 + 0x68],	%i0
	call	loop_36
	nop
	set	0x13, %o6
	ldsb	[%l7 + %o6],	%l0
loop_35:
	movvs	%icc,	0x608,	%i4
	fpadd16s	%f11,	%f18,	%f24
loop_36:
	call	loop_37
	movleu	%xcc,	%g3,	%i6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	addcc	%i3,	0x1094,	%o2
loop_37:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g2
	fpack16	%f18,	%f23
	wrpr	%i5,	%l4,	%cwp
	call	loop_38
	fmovdl	%icc,	%f2,	%f30
	movne	%fcc0,	0x60C,	%o5
	for	%f12,	%f30,	%f22
loop_38:
	call	loop_39
	edge16	%g6,	%l2,	%i2
	movrlz	%o6,	0x0DE,	%i1
	fcmple32	%f14,	%f8,	%o0
loop_39:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f9,	[%l7 + 0x20] %asi
	call	loop_40
	fmovrslz	%g1,	%f10,	%f30
	call	loop_41
	call	loop_42
loop_40:
	fsrc1	%f2,	%f16
	ldsw	[%l7 + 0x40],	%l6
loop_41:
	fpack16	%f6,	%f19
loop_42:
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f26
	nop
	set	0x19, %g4
	stb	%g4,	[%l7 + %g4]
	call	loop_43
	tn	%icc,	0x0
	call	loop_44
	nop
	setx	0x4805869F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x3BE7719F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f8,	%f16
loop_43:
	bne	%icc,	loop_45
	call	loop_46
loop_44:
	sdivx	%o1,	%l3,	%g5
	movl	%fcc3,	%i7,	%o4
loop_45:
	edge16l	%o7,	%o3,	%l5
loop_46:
	fmovrdne	%g7,	%f18,	%f6
	call	loop_47
	fabsd	%f2,	%f20
	fbne,pt	%fcc3,	loop_48
	movrgez	%i0,	0x168,	%l0
loop_47:
	edge16	%l1,	%g3,	%i6
	movcc	%icc,	%i3,	%o2
loop_48:
	call	loop_49
	sethi	0x1AEA,	%i4
	call	loop_50
	call	loop_51
loop_49:
	ldsb	[%l7 + 0x25],	%g2
	array32	%l4,	%o5,	%i5
loop_50:
	fmovsl	%xcc,	%f15,	%f13
loop_51:
	nop
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l2
	call	loop_52
	fmovdcs	%icc,	%f14,	%f20
	fpadd32s	%f13,	%f25,	%f16
	call	loop_53
loop_52:
	fbe,a,pt	%fcc3,	loop_54
	call	loop_55
	call	loop_56
loop_53:
	fcmpne32	%f12,	%f6,	%g6
loop_54:
	wr 	%g0, 	0x5, 	%fprs
loop_55:
	subccc	%i1,	0x12F6,	%o6
loop_56:
	sra	%o0,	0x08,	%l6
	call	loop_57
	fmovrdlez	%g4,	%f6,	%f0
	call	loop_58
	call	loop_59
loop_57:
	call	loop_60
	call	loop_61
loop_58:
	bgu,pt	%xcc,	loop_62
loop_59:
	fnegs	%f14,	%f19
loop_60:
	call	loop_63
loop_61:
	array8	%g1,	%l3,	%g5
loop_62:
	call	loop_64
	call	loop_65
loop_63:
	fnot2s	%f21,	%f5
	fcmpgt16	%f22,	%f18,	%i7
loop_64:
	call	loop_66
loop_65:
	nop
	setx	0xA223C7FF15F256E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x866DEE732303BBE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f4,	%f0
	fcmple32	%f24,	%f14,	%o4
	brnz,a	%o7,	loop_67
loop_66:
	fnand	%f26,	%f8,	%f26
	st	%fsr,	[%l7 + 0x08]
	fors	%f4,	%f6,	%f31
loop_67:
	fandnot1s	%f15,	%f22,	%f24
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	fmovs	%f16,	%f12
	fmovdlg	%fcc3,	%f0,	%f30
	call	loop_68
	nop
	setx	0x905ED197913CAB6E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD541C2BD915FF332,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f12,	%f0
	fmovsa	%fcc3,	%f3,	%f23
	stbar
loop_68:
	edge8l	%l5,	%g7,	%i0
	fnot1s	%f14,	%f31
	call	loop_69
	edge32n	%o1,	%l0,	%l1
	call	loop_70
	bmask	%g3,	%i3,	%i6
loop_69:
	ta	%icc,	0x6
	bge,a,pn	%icc,	loop_71
loop_70:
	fxor	%f28,	%f28,	%f12
	andncc	%o2,	0x15AC,	%g2
	call	loop_72
loop_71:
	call	loop_73
	edge8ln	%l4,	%i4,	%i5
	edge32l	%o5,	%l2,	%i2
loop_72:
	nop
	setx	0x682FD0CE695DBBF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x000303387377D531,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f2,	%f10
loop_73:
	movre	%g6,	0x2E8,	%i1
	fnand	%f6,	%f10,	%f12
	tvs	%xcc,	0x1
	call	loop_74
	nop
	setx	0x86163AEA0C24E9D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x71B174058BDA6B1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f30,	%f24
	fmovrslz	%o0,	%f12,	%f14
	xor	%l6,	0x14A6,	%g4
loop_74:
	nop
	set	0x18, %o2
	prefetch	[%l7 + %o2],	 4
	fmovdleu	%xcc,	%f16,	%f20
	mulscc	%o6,	0x14E8,	%g1
	fzero	%f6
	fxnor	%f22,	%f22,	%f14
	subcc	%g5,	0x0289,	%i7
	fmovsue	%fcc2,	%f1,	%f7
	rdhpr	%htba,	%l3
	call	loop_75
	fmovdpos	%icc,	%f12,	%f6
	andncc	%o4,	0x00F6,	%o3
	rd	%asi,	%l5
loop_75:
	rd	%sys_tick_cmpr,	%o7
	nop
	set	0x1C, %o5
	stw	%g7,	[%l7 + %o5]
	fpsub16	%f18,	%f4,	%f12
	fmovdg	%fcc1,	%f4,	%f10
	edge32l	%i0,	%l0,	%o1
	brlz	%l1,	loop_76
	call	loop_77
	fnot1s	%f25,	%f3
	call	loop_78
loop_76:
	call	loop_79
loop_77:
	tgu	%xcc,	0x1
	fmovdue	%fcc2,	%f24,	%f24
loop_78:
	movo	%fcc2,	0x5DA,	%g3
loop_79:
	fors	%f3,	%f24,	%f3
	edge32l	%i3,	%i6,	%o2
	call	loop_80
	xnorcc	%l4,	%i4,	%g2
	wr	%o5,	%l2,	%sys_tick
	movrlez	%i5,	%i2,	%i1
loop_80:
	edge16ln	%o0,	%l6,	%g4
	nop
	setx	0xF44776F1A4CD54B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	call	loop_81
	fmovsuge	%fcc0,	%f31,	%f9
	srl	%g6,	0x01,	%g1
	fzeros	%f13
loop_81:
	call	loop_82
	edge8l	%g5,	%o6,	%i7
	call	loop_83
	movcs	%icc,	0x067,	%l3
loop_82:
	call	loop_84
	movleu	%icc,	%o3,	%l5
loop_83:
	sll	%o7,	%g7,	%o4
	call	loop_85
loop_84:
	srlx	%i0,	0x1B,	%l0
	call	loop_86
	rdpr	%tl,	%l1
loop_85:
	call	loop_87
	fmul8x16au	%f30,	%f30,	%f12
loop_86:
	fpack32	%f8,	%f16,	%f28
	call	loop_88
loop_87:
	call	loop_89
	fzeros	%f24
	call	loop_90
loop_88:
	rd	%ccr,	%g3
loop_89:
	fornot2	%f8,	%f12,	%f6
	fmovdcs	%icc,	%f18,	%f12
loop_90:
	call	loop_91
	nop
	set	0x58, %o3
	lduw	[%l7 + %o3],	%i3
	call	loop_92
	ldd	[%l7 + 0x78],	%f16
loop_91:
	call	loop_93
	call	loop_94
loop_92:
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%i6
	call	loop_95
loop_93:
	call	loop_96
loop_94:
	call	loop_97
	st	%fsr,	[%l7 + 0x7C]
loop_95:
	call	loop_98
loop_96:
	rdpr	%gl,	%o2
loop_97:
	fmovrslez	%l4,	%f23,	%f31
	fmovrdgz	%i4,	%f12,	%f8
loop_98:
	call	loop_99
	srlx	%o1,	0x10,	%o5
	fmovdge	%icc,	%f2,	%f28
	wr	%g2,	%l2,	%pic
loop_99:
	fmovrsgez	%i5,	%f23,	%f17
	call	loop_100
	fcmpgt16	%f10,	%f16,	%i1
	fandnot1	%f18,	%f2,	%f22
	subcc	%o0,	%l6,	%i2
loop_100:
	stw	%g6,	[%l7 + 0x60]
	fornot2s	%f12,	%f7,	%f8
	fnot2	%f14,	%f16
	call	loop_101
	tge	%icc,	0x3
	fcmpgt16	%f0,	%f24,	%g4
	fmovsule	%fcc0,	%f21,	%f31
loop_101:
	fmovrslz	%g1,	%f25,	%f23
	tne	%xcc,	0x3
	fmovsvs	%xcc,	%f13,	%f5
	tg	%xcc,	0x2
	sdivx	%o6,	%i7,	%l3
!!	wr	%g0,	0x40,	%asi
!!	ldxa	[%g0 + 0x318] %asi,	%o3
	fmovdn	%icc,	%f14,	%f16
	fcmpes	%fcc3,	%f6,	%f16
	call	loop_102
	movuge	%fcc1,	0x103,	%l5
	call	loop_103
	call	loop_104
loop_102:
	fbo,a	%fcc0,	loop_105
	call	loop_106
loop_103:
	fnot2	%f14,	%f20
loop_104:
	call	loop_107
loop_105:
	edge8l	%g5,	%o7,	%o4
loop_106:
	alignaddr	%g7,	%l0,	%i0
	nop
	set	0x18, %i5
	std	%f26,	[%l7 + %i5]
loop_107:
	mulx	%g3,	0x184D,	%i3
	call	loop_108
	fmovdvs	%xcc,	%f2,	%f12
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x6
loop_108:
	fmovso	%fcc3,	%f16,	%f1
	fornot1s	%f6,	%f3,	%f14
	tgu	%icc,	0x1
	sllx	%i6,	0x04,	%l1
	fmul8sux16	%f6,	%f4,	%f10
	fbge,a,pn	%fcc2,	loop_109
	rd	%ccr,	%l4
	tpos	%icc,	0x7
	addccc	%o2,	%i4,	%o1
loop_109:
	fmovsu	%fcc2,	%f29,	%f28
	call	loop_110
	fmovsvc	%xcc,	%f17,	%f4
	call	loop_111
	call	loop_112
loop_110:
	call	loop_113
	fmovdgu	%xcc,	%f4,	%f26
loop_111:
	call	loop_114
loop_112:
	fmovsgu	%xcc,	%f3,	%f27
loop_113:
	srax	%g2,	%o5,	%l2
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%i1
loop_114:
	addccc	%o0,	0x087E,	%i5
	call	loop_115
	call	loop_116
	fmovduge	%fcc1,	%f30,	%f8
	alignaddrl	%l6,	%i2,	%g4
loop_115:
	tsubcc	%g6,	0x1569,	%o6
loop_116:
	fmovsa	%fcc2,	%f10,	%f22
	mulscc	%g1,	0x079A,	%i7
	set	0x18, %l6
	lda	[%l7 + %l6] 0x04,	%f7
	andncc	%o3,	0x1C02,	%l5
	bpos,a,pt	%xcc,	loop_117
	call	loop_118
	call	loop_119
	call	loop_120
loop_117:
	movle	%fcc0,	0x040,	%g5
loop_118:
	movvs	%xcc,	%l3,	%o4
loop_119:
	call	loop_121
loop_120:
	fmovdule	%fcc3,	%f16,	%f0
	fexpand	%f23,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x302, 	%hsys_tick_cmpr
loop_121:
	movcc	%icc,	%g7,	%g3
	fmovs	%f16,	%f25
	edge8n	%i0,	%i6,	%i3
	call	loop_122
	call	loop_123
	tleu	%icc,	0x1
	fmovdleu	%xcc,	%f8,	%f10
loop_122:
	bcc,a,pt	%icc,	loop_124
loop_123:
	fxor	%f28,	%f10,	%f26
	call	loop_125
	call	loop_126
loop_124:
	fblg	%fcc0,	loop_127
	edge16ln	%l1,	%o2,	%l4
loop_125:
	nop
	fitod	%f4,	%f2
	fdtoi	%f2,	%f16
loop_126:
	nop
	setx	0xD63A4F3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
loop_127:
	taddcc	%i4,	%g2,	%o1
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x3C] %asi,	%l2
	call	loop_128
	fmovdneg	%icc,	%f16,	%f30
	fpsub32	%f4,	%f10,	%f26
	subcc	%i1,	0x1848,	%o0
loop_128:
	fbo,a,pt	%fcc3,	loop_129
	movleu	%icc,	%i5,	%o5
	sth	%i2,	[%l7 + 0x3A]
	call	loop_130
loop_129:
	fmul8x16al	%f28,	%f12,	%f8
	nop
	setx	0xC0D4AF10DACA7FF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f4
	mulx	%g4,	%l6,	%g6
loop_130:
	fnegd	%f6,	%f6
	nop
	set	0x7F, %i4
	ldsb	[%l7 + %i4],	%g1
	call	loop_131
	fmovspos	%icc,	%f18,	%f27
	call	loop_132
	fmovsn	%xcc,	%f18,	%f27
loop_131:
	fmovdvs	%icc,	%f10,	%f22
	edge32l	%i7,	%o3,	%o6
loop_132:
	call	loop_133
	call	loop_134
	fcmpeq16	%f12,	%f14,	%g5
	call	loop_135
loop_133:
	udivcc	%l5,	%l3,	%o7
loop_134:
	mulx	%o4,	%l0,	%g7
	nop
	setx	0x7FDA9B7370D88C02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6B73776C85C5722B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f2,	%f8
loop_135:
	call	loop_136
	nop
	setx	0x4435DE86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x82101737,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f24,	%f24
	movo	%fcc2,	0x1D9,	%i0
	call	loop_137
loop_136:
	movl	%xcc,	%g3,	%i3
	call	loop_138
	fpmerge	%f12,	%f30,	%f28
loop_137:
	fcmpgt16	%f18,	%f0,	%i6
	edge32l	%l1,	%o2,	%l4
loop_138:
	fpadd32s	%f28,	%f20,	%f17
	nop
	setx	0x7ED9910C607A81C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x935A924A4BF20C02,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f6,	%f16
	fmul8x16al	%f6,	%f30,	%f18
	call	loop_139
	add	%i4,	0x0427,	%o1
	call	loop_140
	fpackfix	%f6,	%f2
loop_139:
	nop
!!	wr	%g0,	0x40,	%asi
!!	ldxa	[%g0 + 0x328] %asi,	%g2
loop_140:
	call	loop_141
	fbul,a	%fcc2,	loop_142
	brgz,pn	%i1,	loop_143
	call	loop_144
loop_141:
	call	loop_145
loop_142:
	call	loop_146
loop_143:
	movleu	%icc,	%l2,	%o0
loop_144:
	call	loop_147
loop_145:
	fnor	%f12,	%f4,	%f30
loop_146:
	call	loop_148
	edge32n	%i5,	%i2,	%o5
loop_147:
	fmovsue	%fcc0,	%f16,	%f23
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
loop_148:
	edge8l	%l6,	%g6,	%g4
	bvc,a,pt	%icc,	loop_149
	call	loop_150
	call	loop_151
	rdpr	%gl,	%i7
loop_149:
	nop

loop_150:
	nop

loop_151:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 37
!	Type a   	: 27
!	Type x   	: 11
!	Type cti   	: 151
!	Type f   	: 144
!	Type i   	: 130
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
	set	0x4,	%g1
	set	0x8,	%g2
	set	0xA,	%g3
	set	0x9,	%g4
	set	0x3,	%g5
	set	0x7,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xA,	%i1
	set	-0x7,	%i2
	set	-0x2,	%i3
	set	-0x0,	%i4
	set	-0x3,	%i5
	set	-0x1,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x4D075E39,	%l0
	set	0x4C887E3B,	%l1
	set	0x409C5C6D,	%l2
	set	0x4B06581F,	%l3
	set	0x33BBF6FD,	%l4
	set	0x5B0E15DD,	%l5
	set	0x68669149,	%l6
	!# Output registers
	set	0x10AE,	%o0
	set	0x0BDA,	%o1
	set	-0x00F7,	%o2
	set	-0x17C6,	%o3
	set	-0x1D32,	%o4
	set	0x07B4,	%o5
	set	0x1871,	%o6
	set	-0x1257,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	fsrc1s	%f15,	%f5
	movuge	%fcc2,	0x2FA,	%o3
	udivcc	%g1,	%g5,	%l5
	call	loop_152
	xnor	%o6,	0x0CFA,	%l3
	st	%f13,	[%l7 + 0x48]
	fnegs	%f26,	%f14
loop_152:
	movo	%fcc0,	%o7,	%o4
	fbug	%fcc2,	loop_153
	call	loop_154
	wr	%g7,	%l0,	%y
	tsubcc	%g3,	%i3,	%i0
loop_153:
	call	loop_155
loop_154:
	andncc	%l1,	0x17AD,	%i6
	call	loop_156
	call	loop_157
loop_155:
	fmovdlg	%fcc0,	%f6,	%f4
	fble,pt	%fcc2,	loop_158
loop_156:
	call	loop_159
loop_157:
	srlx	%l4,	0x1B,	%o2
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f16
loop_158:
	call	loop_160
loop_159:
	ta	%xcc,	0x0
	nop
	set	0x18, %g7
	ldx	[%l7 + %g7],	%o1
	nop
	setx	0xF922D6E96DAEDE46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0F0104306600B494,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f14,	%f0
loop_160:
	call	loop_161
	edge16ln	%i4,	%g2,	%l2
	array16	%o0,	%i5,	%i1
	call	loop_162
loop_161:
	call	loop_163
	subc	%o5,	%i2,	%l6
	fpsub32	%f6,	%f28,	%f10
loop_162:
	fornot2s	%f9,	%f31,	%f19
loop_163:
	call	loop_164
	ldx	[%l7 + 0x10],	%g6
	call	loop_165
	fmovdg	%fcc3,	%f20,	%f26
loop_164:
	fcmpes	%fcc2,	%f26,	%f15
	movre	%i7,	%g4,	%g1
loop_165:
	fcmps	%fcc1,	%f25,	%f11
	rd	%ccr,	%o3
	move	%fcc0,	%l5,	%g5
	nop
	setx loop_166, %l0, %l1
	jmpl %l1, %o6
	call	loop_167
	nop
	set	0x28, %l4
	std	%l2,	[%l7 + %l4]
	call	loop_168
loop_166:
	xor	%o4,	%o7,	%g7
loop_167:
	call	loop_169
	mulscc	%g3,	%l0,	%i0
loop_168:
	ta	%icc,	0x7
	subcc	%l1,	%i3,	%l4
loop_169:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdle	%icc,	%f12,	%f8
	call	loop_170
	call	loop_171
	stb	%o2,	[%l7 + 0x77]
	sdivx	%i6,	%o1,	%g2
loop_170:
	call	loop_172
loop_171:
	call	loop_173
	call	loop_174
	call	loop_175
loop_172:
	andncc	%i4,	0x01A1,	%o0
loop_173:
	sra	%i5,	%i1,	%l2
loop_174:
	brgz,a,pt	%i2,	loop_176
loop_175:
	array16	%l6,	%o5,	%g6
	call	loop_177
	call	loop_178
loop_176:
	call	loop_179
	fmovdo	%fcc3,	%f12,	%f16
loop_177:
	nop
	setx	0xE25C2D79,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x298E0C75,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f28,	%f29
loop_178:
	fpsub32	%f30,	%f24,	%f6
loop_179:
	fbul,pt	%fcc3,	loop_180
	brz,pn	%i7,	loop_181
	call	loop_182
	fmovdu	%fcc3,	%f0,	%f2
loop_180:
	fnot1	%f0,	%f24
loop_181:
	movo	%fcc1,	%g1,	%o3
loop_182:
	membar	0x09
	fmovsl	%icc,	%f19,	%f21
	rdpr	%cwp,	%l5
	smul	%g4,	0x1951,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%g5,	%o4,	%o7
	call	loop_183
	fmovde	%icc,	%f8,	%f22
	call	loop_184
	edge8	%g3,	%g7,	%i0
loop_183:
	call	loop_185
	alignaddrl	%l0,	%i3,	%l4
loop_184:
	call	loop_186
	fmovdcc	%xcc,	%f10,	%f20
loop_185:
	nop
	setx	0x25BE3364EE228B66,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF7D372D483C5FD4A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f16
	xor	%l1,	%i6,	%o1
loop_186:
	call	loop_187
	fabsd	%f0,	%f4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%g2
loop_187:
	edge32l	%i4,	%i5,	%o0
	nop
	set	0x58, %i3
	std	%f16,	[%l7 + %i3]
	movl	%fcc1,	%i1,	%l2
	fmovdug	%fcc0,	%f22,	%f28
	fmovdge	%icc,	%f0,	%f8
	call	loop_188
	edge32l	%i2,	%l6,	%g6
	movrlz	%i7,	%o5,	%o3
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
loop_188:
	fmovdul	%fcc0,	%f0,	%f24
	bvs,a,pn	%xcc,	loop_189
	movo	%fcc2,	%g1,	%o6
	fmovda	%xcc,	%f30,	%f30
	wr	%g0,	0x23,	%asi
	stwa	%l3,	[%l7 + 0x3C] %asi
	membar	#Sync
loop_189:
	fmovdug	%fcc2,	%f28,	%f16
	fmul8x16al	%f29,	%f17,	%f4
	call	loop_190
	call	loop_191
	call	loop_192
	call	loop_193
loop_190:
	movue	%fcc2,	0x059,	%g5
loop_191:
	call	loop_194
loop_192:
	fcmpes	%fcc1,	%f4,	%f11
loop_193:
	fmovdvs	%icc,	%f20,	%f28
	movlg	%fcc1,	0x305,	%o4
loop_194:
	prefetch	[%l7 + 0x68],	 2
	andn	%g4,	0x1CBA,	%o7
	andn	%g3,	%g7,	%l0
	fone	%f28
	set	0x54, %i0
	stha	%i0,	[%l7 + %i0] 0x22
	membar	#Sync
	fnors	%f0,	%f22,	%f19
	call	loop_195
	edge8n	%l4,	%l1,	%i3
	call	loop_196
	brlez,pt	%o1,	loop_197
loop_195:
	tsubcc	%i6,	%o2,	%i4
	rdhpr	%hintp,	%g2
loop_196:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_197:
	movne	%fcc0,	0x72E,	%o0
	sdivx	%i1,	%l2,	%i2
	tvc	%icc,	0x6
	call	loop_198
	call	loop_199
	fnot2s	%f2,	%f26
	fpack16	%f8,	%f25
loop_198:
	bcs,pt	%xcc,	loop_200
loop_199:
	call	loop_201
	call	loop_202
	movleu	%icc,	%l6,	%g6
loop_200:
	tl	%xcc,	0x0
loop_201:
	call	loop_203
loop_202:
	nop
	fitod	%f4,	%f2
	fdtox	%f2,	%f26
	alignaddr	%i7,	%o5,	%l5
	call	loop_204
loop_203:
	fpadd32	%f10,	%f2,	%f6
	fmovsge	%icc,	%f5,	%f18
	call	loop_205
loop_204:
	tne	%icc,	0x1
	fand	%f10,	%f10,	%f2
	fmovdue	%fcc3,	%f14,	%f28
loop_205:
	nop
	setx	0x75053A76,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x440450A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f13,	%f29
	wr	%o3,	%o6,	%set_softint
	stbar
	udivcc	%g1,	%g5,	%l3
	set	0x44, %l3
	stha	%o4,	[%l7 + %l3] 0x2a
	membar	#Sync
	call	loop_206
	srax	%g4,	%o7,	%g3
	alignaddrl	%g7,	%l0,	%l4
	fxors	%f6,	%f10,	%f7
loop_206:
	call	loop_207
	fcmple16	%f12,	%f22,	%i0
	addccc	%i3,	%l1,	%i6
	wrpr	%o1,	0x1520,	%cwp
loop_207:
	edge8l	%i4,	%o2,	%i5
	call	loop_208
	call	loop_209
	tn	%icc,	0x3
	fmovrse	%o0,	%f11,	%f0
loop_208:
	call	loop_210
loop_209:
	call	loop_211
	fxnors	%f2,	%f23,	%f10
	call	loop_212
loop_210:
	nop
	setx	0x9517A5CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x9AA401AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f25,	%f23
loop_211:
	call	loop_213
	call	loop_214
loop_212:
	fpsub16	%f20,	%f8,	%f2
	udiv	%g2,	0x00,	%i1
loop_213:
	subccc	%i2,	%l6,	%g6
loop_214:
	orcc	%l2,	0x15A9,	%i7
	tg	%xcc,	0x6
	fnot2	%f26,	%f6
	rdpr	%tl,	%l5
	bmask	%o3,	%o6,	%o5
	call	loop_215
	movcc	%icc,	0x5B0,	%g5
	call	loop_216
	brgez,a	%g1,	loop_217
loop_215:
	wr 	%g0, 	0x4, 	%fprs
	nop
	setx	0xF4B274F617BA55F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD584D0D3AD06BB28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f30,	%f16
loop_216:
	xnor	%g4,	0x07FA,	%l3
loop_217:
	movcc	%xcc,	%o7,	%g3
	fmovd	%f2,	%f18
	bn,pn	%icc,	loop_218
	array32	%l0,	%l4,	%i0
	call	loop_219
	fbn,pn	%fcc3,	loop_220
loop_218:
	movug	%fcc0,	%i3,	%g7
	xnorcc	%i6,	0x12A9,	%l1
loop_219:
	sir	0x0ACF
loop_220:
	call	loop_221
	call	loop_222
	edge8ln	%i4,	%o2,	%o1
	nop
	fitos	%f1,	%f13
	fstoi	%f13,	%f21
loop_221:
	movcc	%xcc,	%o0,	%g2
loop_222:
	sub	%i5,	%i1,	%l6
	movn	%icc,	0x512,	%g6
	call	loop_223
	call	loop_224
	wr	%l2,	%i7,	%clear_softint
	addc	%l5,	0x004D,	%o3
loop_223:
	fpsub32s	%f25,	%f12,	%f11
loop_224:
	taddcc	%o6,	%i2,	%o5
	call	loop_225
	fpsub16	%f22,	%f0,	%f10
	fmovsleu	%xcc,	%f5,	%f27
	ldd	[%l7 + 0x78],	%g0
loop_225:
	call	loop_226
	nop
	setx	loop_227,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012100001400,	%l0,	%l1
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
	brgz,a,pt	%o4,	loop_228
	tvc	%icc,	0x1
loop_226:
	popc	0x0EA9,	%g4
loop_227:
	fbg,a	%fcc3,	loop_229
loop_228:
	srl	%g5,	0x10,	%o7
	call	loop_230
	fcmped	%fcc0,	%f12,	%f4
loop_229:
	call	loop_231
	brnz,pn	%l3,	loop_232
loop_230:
	call	loop_233
	brnz,a,pn	%l0,	loop_234
loop_231:
	call	loop_235
loop_232:
	fpsub32	%f6,	%f12,	%f16
loop_233:
	fors	%f27,	%f21,	%f18
loop_234:
	tpos	%xcc,	0x6
loop_235:
	fmovsuge	%fcc0,	%f6,	%f19
	call	loop_236
	movre	%l4,	0x023,	%g3
	fmovdpos	%xcc,	%f16,	%f20
	call	loop_237
loop_236:
	fcmpgt32	%f14,	%f24,	%i0
	fmul8ulx16	%f22,	%f12,	%f24
	mulx	%i3,	0x09E1,	%i6
loop_237:
	and	%g7,	0x0A88,	%i4
	movge	%icc,	0x522,	%o2
	fmovdu	%fcc3,	%f4,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg,a	%fcc0,	loop_238
	fmovdu	%fcc1,	%f24,	%f8
	call	loop_239
	fmovsvs	%icc,	%f29,	%f27
loop_238:
	nop
	set	0x40, %l5
	std	%o0,	[%l7 + %l5]
	call	loop_240
loop_239:
	rd	%ccr,	%i5
	bcs,pt	%xcc,	loop_241
	movue	%fcc3,	%g2,	%i1
loop_240:
	nop
	set	0x30, %l1
	prefetcha	[%l7 + %l1] 0x81,	 3
loop_241:
	call	loop_242
	call	loop_243
	movrlz	%l2,	%l6,	%l5
	rd	%sys_tick_cmpr,	%o3
loop_242:
	fmovse	%xcc,	%f27,	%f28
loop_243:
	sdivx	%o6,	0x00,	%i2
	orcc	%o5,	%g1,	%o4
	edge32	%i7,	%g5,	%g4
	popc	%l3,	%o7
	wrpr	%l0,	0x15F2,	%tick
	fmovse	%fcc2,	%f8,	%f23
	fabss	%f3,	%f29
	call	loop_244
	movle	%fcc2,	%l4,	%i0
	ldd	[%l7 + 0x10],	%i2
	srl	%g3,	0x15,	%i6
loop_244:
	call	loop_245
	edge32n	%g7,	%i4,	%o2
	fmovsneg	%xcc,	%f28,	%f3
	call	loop_246
loop_245:
	and	%o0,	0x17FC,	%o1
	rdpr	%cwp,	%l1
	rdhpr	%hpstate,	%g2
loop_246:
	call	loop_247
	call	loop_248
	fmuld8ulx16	%f14,	%f8,	%f0
	bcc	%xcc,	loop_249
loop_247:
	edge16	%i5,	%g6,	%i1
loop_248:
	edge8ln	%l2,	%l6,	%o3
	movg	%fcc3,	%l5,	%i2
loop_249:
	call	loop_250
	fpack32	%f20,	%f8,	%f28
	fands	%f27,	%f1,	%f21
	flush	%l7 + 0x54
loop_250:
	call	loop_251
	edge8n	%o6,	%g1,	%o4
	nop
	setx	loop_252,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024400001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x99EA00CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x36AFD08D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f31,	%f15
loop_251:
	fones	%f5
	call	loop_253
loop_252:
	mova	%xcc,	0x031,	%i7
	fnors	%f21,	%f22,	%f27
	tl	%xcc,	0x7
loop_253:
	fmovso	%fcc0,	%f3,	%f28
	fmovdl	%fcc1,	%f22,	%f14
	fmovdue	%fcc0,	%f6,	%f24
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f12
	movre	%o5,	%g5,	%g4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o7
	call	loop_254
	orcc	%l3,	0x1731,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB75, 	%hsys_tick_cmpr
	fpsub32	%f12,	%f0,	%f8
loop_254:
	fmovso	%fcc1,	%f24,	%f30
	call	loop_255
	sll	%g3,	0x02,	%i0
	rd	%softint,	%i6
	subcc	%g7,	%i4,	%o2
loop_255:
	tn	%icc,	0x2
	edge16l	%o1,	%l1,	%o0
	call	loop_256
	wrpr	%i5,	%g2,	%tick
	call	loop_257
	fsrc1	%f20,	%f18
loop_256:
	call	loop_258
	fornot2	%f24,	%f14,	%f0
loop_257:
	nop
	set	0x74, %g3
	lduw	[%l7 + %g3],	%g6
	fandnot2	%f20,	%f4,	%f0
loop_258:
	popc	%l2,	%i1
	call	loop_259
	xnorcc	%l6,	%l5,	%o3
	fnot1	%f18,	%f20
	fmovrslez	%i2,	%f11,	%f22
loop_259:
	movrgez	%g1,	%o4,	%o6
	fcmpd	%fcc0,	%f0,	%f6
	fsrc1	%f4,	%f20
	mova	%fcc2,	0x3C5,	%o5
	nop
	setx	0x69B2C1B9FED3BF60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x52ACD08EADCB4FD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f26,	%f2
	orncc	%g5,	0x0799,	%i7
	call	loop_260
	fmovdo	%fcc1,	%f6,	%f18
	for	%f0,	%f2,	%f18
	ldd	[%l7 + 0x28],	%f12
loop_260:
	ble,a	%icc,	loop_261
	st	%f21,	[%l7 + 0x60]
	edge32l	%o7,	%l3,	%l0
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x88
loop_261:
	call	loop_262
	call	loop_263
	fandnot2	%f30,	%f0,	%f16
	siam	0x4
loop_262:
	edge8ln	%l4,	%i3,	%g3
loop_263:
	fmovdn	%fcc2,	%f6,	%f12
	nop
	setx	0xE888356B4A91151F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xA74E13582435FE00,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f22,	%f30
	fmovrse	%g4,	%f17,	%f25
	fcmple16	%f30,	%f10,	%i0
	bl,pn	%xcc,	loop_264
	wrpr	%g7,	%i4,	%cwp
	fbg,a,pn	%fcc3,	loop_265
	srax	%i6,	%o1,	%l1
loop_264:
	nop
	setx	0x10ED64214F2C9506,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC84603D491C1C5BB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f18,	%f22
	fandnot1	%f4,	%f30,	%f6
loop_265:
	fmuld8sux16	%f14,	%f8,	%f12
	call	loop_266
	fmul8x16au	%f31,	%f28,	%f28
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x18] %asi,	%f23
loop_266:
	call	loop_267
	fmovscc	%icc,	%f0,	%f29
	fandnot2s	%f18,	%f2,	%f24
	fpack32	%f18,	%f6,	%f26
loop_267:
	tleu	%icc,	0x5
	subc	%o0,	0x1D20,	%o2
	nop
	setx	0x166A1675E59EC82B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xEF34283E4BCEFFD2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f24,	%f16
	fmovdge	%icc,	%f20,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xor	%g2,	0x1D36,	%l2
	fcmpd	%fcc3,	%f28,	%f24
	nop
	fitos	%f1,	%f2
	fstox	%f2,	%f18
	fmovdl	%fcc2,	%f10,	%f4
	wr	%i1,	%l6,	%y
	call	loop_268
	movrne	%o3,	0x38B,	%l5
	fmovsneg	%xcc,	%f22,	%f17
	ta	%xcc,	0x2
loop_268:
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f6
	and	%i2,	%g1,	%o4
	rd	%softint,	%o6
	call	loop_269
	fblg,a,pt	%fcc3,	loop_270
	brnz,a,pn	%o5,	loop_271
	fmovdneg	%xcc,	%f0,	%f26
loop_269:
	or	%g5,	0x12B5,	%i7
loop_270:
	nop
	fitos	%f10,	%f22
	fstox	%f22,	%f4
loop_271:
	fones	%f10
	edge32	%o7,	%l0,	%l3
	te	%xcc,	0x3
	and	%l4,	0x0ED6,	%i3
	fones	%f11
	call	loop_272
	fpsub16	%f18,	%f2,	%f2
	fmovrsgez	%g3,	%f24,	%f12
	movne	%fcc0,	%g4,	%i0
loop_272:
	nop
	set	0x4C, %o4
	stwa	%i4,	[%l7 + %o4] 0xeb
	membar	#Sync
	fmovdge	%fcc3,	%f28,	%f12
	fzeros	%f20
	subcc	%g7,	0x021D,	%o1
	call	loop_273
	call	loop_274
	rdhpr	%hintp,	%i6
	call	loop_275
loop_273:
	sdivcc	%o0,	0x00,	%o2
loop_274:
	fcmpgt16	%f10,	%f14,	%l1
	sllx	%g6,	%g2,	%i5
loop_275:
	bvs,a	%xcc,	loop_276
	udivcc	%l2,	0x00,	%i1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovso	%fcc3,	%f25,	%f0
loop_276:
	call	loop_277
	fxnors	%f3,	%f15,	%f14
	addc	%l6,	0x0ACC,	%l5
	te	%icc,	0x1
loop_277:
	nop
	wr	%g0,	0x2f,	%asi
	stha	%o3,	[%l7 + 0x58] %asi
	membar	#Sync
	brgez,a,pn	%g1,	loop_278
	fzeros	%f22
	fmul8x16al	%f1,	%f6,	%f8
	wrpr	%o4,	0x1440,	%cwp
loop_278:
	subcc	%o6,	%i2,	%o5
	call	loop_279
	tvs	%icc,	0x2
	fmovdpos	%icc,	%f2,	%f16
	sdivx	%g5,	%o7,	%l0
loop_279:
	fand	%f30,	%f14,	%f16
	fmovrsgez	%i7,	%f15,	%f28
	sll	%l4,	%l3,	%i3
	fornot2	%f4,	%f8,	%f14
	call	loop_280
	call	loop_281
	rd	%ccr,	%g3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x10,	%f16
loop_280:
	rdhpr	%hsys_tick_cmpr,	%i0
loop_281:
	movlg	%fcc2,	%g4,	%i4
	call	loop_282
	fnand	%f26,	%f0,	%f12
	fmovrsgez	%o1,	%f18,	%f8
	fmovsneg	%xcc,	%f18,	%f6
loop_282:
	nop
	set	0x20, %i6
	swapa	[%l7 + %i6] 0x89,	%i6
	udivx	%g7,	0x00,	%o0
	sra	%o2,	0x0A,	%l1
	movlg	%fcc2,	%g6,	%g2
	fmul8sux16	%f28,	%f2,	%f18
	fmovsul	%fcc1,	%f31,	%f20
	call	loop_283
	fcmple16	%f12,	%f4,	%i5
	sll	%l2,	%l6,	%l5
	call	loop_284
loop_283:
	edge16	%i1,	%g1,	%o3
	fmovdn	%fcc2,	%f2,	%f18
	call	loop_285
loop_284:
	array8	%o4,	%o6,	%o5
	membar	0x32
	fsrc1	%f28,	%f20
loop_285:
	sra	%g5,	%i2,	%o7
	fornot2s	%f1,	%f31,	%f31
	wrpr	%i7,	0x1FD7,	%cwp
	call	loop_286
	nop
	fitod	%f0,	%f16
	fdtos	%f16,	%f12
	call	loop_287
	andncc	%l4,	0x1924,	%l0
loop_286:
	fabsd	%f20,	%f20
	fcmps	%fcc3,	%f23,	%f2
loop_287:
	fmovsule	%fcc0,	%f31,	%f2
	call	loop_288
	tle	%icc,	0x4
	nop
	setx	0xB449D420,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f25
	tg	%xcc,	0x7
loop_288:
	array32	%i3,	%g3,	%l3
	addcc	%g4,	%i0,	%i4
	fmovrdlz	%o1,	%f0,	%f18
	fbule,a	%fcc2,	loop_289
	addcc	%i6,	0x09CD,	%o0
	call	loop_290
	fpack16	%f14,	%f8
loop_289:
	ta	%icc,	0x4
	edge32ln	%g7,	%l1,	%g6
loop_290:
	fpadd16s	%f26,	%f20,	%f30
	fmovsug	%fcc3,	%f9,	%f31
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 28
!	Type a   	: 29
!	Type x   	: 13
!	Type cti   	: 139
!	Type f   	: 143
!	Type i   	: 148
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
	set	0xB,	%g1
	set	0xB,	%g2
	set	0x2,	%g3
	set	0x4,	%g4
	set	0x7,	%g5
	set	0xC,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x3,	%i1
	set	-0x2,	%i2
	set	-0x5,	%i3
	set	-0x0,	%i4
	set	-0x0,	%i5
	set	-0x5,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x1B6CA161,	%l0
	set	0x11A438D1,	%l1
	set	0x1DF47DB4,	%l2
	set	0x5D8CF8C9,	%l3
	set	0x4D9A3CF8,	%l4
	set	0x613F5B3C,	%l5
	set	0x4908AEB0,	%l6
	!# Output registers
	set	0x0C50,	%o0
	set	0x0F1C,	%o1
	set	0x1E19,	%o2
	set	-0x06BA,	%o3
	set	0x0F4E,	%o4
	set	0x0F1A,	%o5
	set	0x165F,	%o6
	set	0x1A41,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	fmovse	%icc,	%f2,	%f5
	movne	%fcc2,	%o2,	%g2
	fmovsleu	%xcc,	%f7,	%f19
	nop
	setx	0xA4BB2731,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x9A2E5849,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f23,	%f0
	edge16ln	%i5,	%l6,	%l2
	fbl	%fcc1,	loop_291
	call	loop_292
	fzero	%f8
	orncc	%l5,	%g1,	%i1
loop_291:
	movre	%o4,	0x0F7,	%o3
loop_292:
	movpos	%xcc,	0x513,	%o5
	nop
	fitos	%f3,	%f16
	fstox	%f16,	%f30
	rd	%fprs,	%o6
	fands	%f18,	%f7,	%f7
	rd	%pc,	%g5
	call	loop_293
	wr 	%g0, 	0x6, 	%fprs
	call	loop_294
	subc	%o7,	%l4,	%i7
loop_293:
	fmovsvs	%xcc,	%f6,	%f18
	call	loop_295
loop_294:
	rdhpr	%hpstate,	%l0
	bcc,pt	%xcc,	loop_296
	fmovde	%xcc,	%f24,	%f18
loop_295:
	bmask	%g3,	%i3,	%l3
	fxnor	%f8,	%f10,	%f2
loop_296:
	bmask	%i0,	%g4,	%o1
	fzeros	%f7
	call	loop_297
	call	loop_298
	call	loop_299
	fand	%f16,	%f30,	%f0
loop_297:
	movvc	%xcc,	0x54A,	%i6
loop_298:
	call	loop_300
loop_299:
	fsrc2s	%f2,	%f28
	call	loop_301
	call	loop_302
loop_300:
	fmovde	%fcc0,	%f18,	%f14
	call	loop_303
loop_301:
	nop
	set	0x40, %i1
	stw	%o0,	[%l7 + %i1]
loop_302:
	nop
	fitod	%f2,	%f24
	fdtos	%f24,	%f19
	mova	%fcc1,	%g7,	%i4
loop_303:
	call	loop_304
	fmovdn	%xcc,	%f4,	%f8
	fnot1	%f14,	%f6
	fbne,a,pn	%fcc2,	loop_305
loop_304:
	fmovdg	%fcc0,	%f16,	%f10
	call	loop_306
	movgu	%icc,	%g6,	%l1
loop_305:
	fpmerge	%f26,	%f27,	%f20
	tvs	%icc,	0x0
loop_306:
	array8	%o2,	%g2,	%i5
	edge32ln	%l2,	%l6,	%g1
	flushw
	fmovdleu	%xcc,	%f22,	%f10
	movneg	%xcc,	%i1,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_307
	ta	%icc,	0x4
	fmovsu	%fcc3,	%f28,	%f25
	movrgz	%o5,	0x1D4,	%o6
loop_307:
	call	loop_308
	siam	0x3
	fcmpes	%fcc0,	%f8,	%f1
	sethi	0x090B,	%o3
loop_308:
	fmovrsne	%g5,	%f26,	%f25
	fmovrdgez	%o7,	%f28,	%f20
	call	loop_309
	fmovrdgez	%l4,	%f24,	%f16
	call	loop_310
	fmul8x16al	%f0,	%f9,	%f4
loop_309:
	ba,pt	%xcc,	loop_311
	fnegs	%f28,	%f11
loop_310:
	fcmpeq32	%f22,	%f30,	%i7
	call	loop_312
loop_311:
	call	loop_313
	fsrc2	%f14,	%f0
	fmovdo	%fcc3,	%f14,	%f12
loop_312:
	call	loop_314
loop_313:
	tleu	%xcc,	0x2
	bvc,a	%xcc,	loop_315
	ldsh	[%l7 + 0x0E],	%l0
loop_314:
	nop
	setx	0xD6550E226D986EAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f24
	wrpr	%i2,	%g3,	%cwp
loop_315:
	ba	%icc,	loop_316
	call	loop_317
	fbo,a,pt	%fcc0,	loop_318
	movn	%fcc2,	%i3,	%i0
loop_316:
	call	loop_319
loop_317:
	fmovdule	%fcc2,	%f10,	%f20
loop_318:
	fpmerge	%f22,	%f8,	%f28
	fpack32	%f22,	%f2,	%f24
loop_319:
	movge	%fcc3,	0x0A3,	%g4
	fmovrdne	%o1,	%f16,	%f10
	movlg	%fcc0,	%l3,	%i6
	fmovdl	%xcc,	%f8,	%f24
	movcs	%icc,	0x75F,	%g7
	movrlz	%i4,	%o0,	%g6
	call	loop_320
	movrgz	%l1,	0x37B,	%o2
	fzeros	%f16
	call	loop_321
loop_320:
	rd	%ccr,	%i5
	edge8ln	%l2,	%g2,	%g1
	xor	%i1,	%l5,	%o4
loop_321:
	orncc	%o5,	%o6,	%o3
	tpos	%icc,	0x7
	fmovsleu	%icc,	%f17,	%f4
	movrlez	%g5,	0x2FA,	%o7
	call	loop_322
	pdist	%f18,	%f10,	%f2
	fandnot2s	%f30,	%f1,	%f24
	edge32ln	%l4,	%l6,	%l0
loop_322:
	fmul8ulx16	%f28,	%f10,	%f0
	bleu,a	%icc,	loop_323
	fmovrdlez	%i2,	%f4,	%f6
	fandnot1	%f12,	%f10,	%f12
	fmovscc	%xcc,	%f31,	%f16
loop_323:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsg	%fcc2,	%f20,	%f23
	fnot1s	%f31,	%f22
	fcmpeq16	%f2,	%f16,	%g3
	fmovsa	%fcc1,	%f4,	%f30
	call	loop_324
	fcmpne32	%f16,	%f6,	%i7
	rdhpr	%hsys_tick_cmpr,	%i3
	movpos	%icc,	%g4,	%i0
loop_324:
	call	loop_325
	bcc	%xcc,	loop_326
	fzero	%f20
	fbu,pn	%fcc0,	loop_327
loop_325:
	fnand	%f30,	%f0,	%f8
loop_326:
	nop
	fitod	%f4,	%f14
	fdtos	%f14,	%f1
	set	0x78, %o0
	ldswa	[%l7 + %o0] 0x0c,	%l3
loop_327:
	fandnot1s	%f2,	%f19,	%f22
	fbn,a,pt	%fcc0,	loop_328
	add	%o1,	0x106D,	%g7
	fnot2	%f10,	%f16
	fmovrdgez	%i4,	%f26,	%f4
loop_328:
	lduh	[%l7 + 0x2A],	%i6
	call	loop_329
	movl	%fcc0,	0x782,	%o0
	tle	%icc,	0x4
	edge8l	%g6,	%l1,	%i5
loop_329:
	mulscc	%l2,	0x1BA9,	%g2
	movrne	%o2,	%g1,	%l5
	fmovsul	%fcc3,	%f31,	%f10
	edge32ln	%i1,	%o4,	%o5
	call	loop_330
	call	loop_331
	fmovdug	%fcc1,	%f30,	%f12
	call	loop_332
loop_330:
	ldub	[%l7 + 0x79],	%o6
loop_331:
	rdhpr	%ver,	%g5
	wrpr	%o3,	%o7,	%tick
loop_332:
	addcc	%l6,	%l0,	%i2
	fcmpd	%fcc3,	%f2,	%f22
	fbge	%fcc2,	loop_333
	nop
	setx	0xDFB8C0832B78D670,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB2C831E08CD3F5AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f6
	fmovdn	%fcc2,	%f16,	%f22
	fabss	%f21,	%f21
loop_333:
	call	loop_334
	nop
	setx	0x76C3876912EA7B38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x6DDD87E14F6FE656,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f28,	%f0
	rd	%ccr,	%g3
	call	loop_335
loop_334:
	edge32	%l4,	%i3,	%g4
	movre	%i7,	%i0,	%o1
	call	loop_336
loop_335:
	fmovdo	%fcc1,	%f22,	%f6
	fpadd16s	%f26,	%f12,	%f29
	bne	%icc,	loop_337
loop_336:
	call	loop_338
	call	loop_339
	fmovsuge	%fcc0,	%f10,	%f1
loop_337:
	call	loop_340
loop_338:
	call	loop_341
loop_339:
	fmovrdgez	%g7,	%f18,	%f20
	movpos	%icc,	%l3,	%i4
loop_340:
	edge16l	%o0,	%i6,	%l1
loop_341:
	call	loop_342
	fmovsle	%xcc,	%f4,	%f6
	call	loop_343
	bleu,a,pt	%xcc,	loop_344
loop_342:
	flushw
	call	loop_345
loop_343:
	call	loop_346
loop_344:
	fmovsvc	%xcc,	%f28,	%f12
	call	loop_347
loop_345:
	call	loop_348
loop_346:
	fpsub16s	%f13,	%f1,	%f14
	call	loop_349
loop_347:
	pdist	%f18,	%f26,	%f20
loop_348:
	taddcctv	%i5,	%l2,	%g2
	call	loop_350
loop_349:
	fmovdn	%fcc0,	%f10,	%f16
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x64] %asi,	%o2
loop_350:
	movul	%fcc1,	0x4DA,	%g1
	bg,a	%xcc,	loop_351
	call	loop_352
	call	loop_353
	fcmped	%fcc1,	%f24,	%f0
loop_351:
	wrpr	%g6,	0x06C1,	%pil
loop_352:
	subcc	%i1,	0x0E30,	%o4
loop_353:
	fmul8x16al	%f7,	%f5,	%f8
	fmuld8sux16	%f14,	%f2,	%f18
	fmovdul	%fcc2,	%f18,	%f12
	fmovrslz	%l5,	%f4,	%f9
	nop
	fitos	%f7,	%f15
	fstod	%f15,	%f2
	fmovspos	%icc,	%f8,	%f4
	fpadd32	%f0,	%f4,	%f28
	srlx	%o6,	%o5,	%g5
	faligndata	%f24,	%f22,	%f30
	fmuld8ulx16	%f16,	%f27,	%f12
	call	loop_354
	call	loop_355
	call	loop_356
	call	loop_357
loop_354:
	or	%o7,	0x12B8,	%l6
loop_355:
	fmul8x16	%f12,	%f14,	%f16
loop_356:
	call	loop_358
loop_357:
	movge	%xcc,	0x586,	%o3
	call	loop_359
	fandnot2	%f4,	%f0,	%f4
loop_358:
	tsubcctv	%i2,	0x09EE,	%g3
	call	loop_360
loop_359:
	fmovdgu	%icc,	%f4,	%f8
	array32	%l4,	%i3,	%l0
	rd	%fprs,	%g4
loop_360:
	nop
	set	0x08, %o1
	stxa	%i0,	[%l7 + %o1] 0x0c
	stb	%i7,	[%l7 + 0x39]
	mulscc	%o1,	%l3,	%i4
	membar	0x3A
	movrne	%o0,	%g7,	%l1
	call	loop_361
	tge	%xcc,	0x7
	call	loop_362
	fpadd16	%f20,	%f4,	%f18
loop_361:
	call	loop_363
	call	loop_364
loop_362:
	fmovdgu	%xcc,	%f26,	%f2
	fmovrslz	%i5,	%f25,	%f29
loop_363:
	tvs	%xcc,	0x4
loop_364:
	wr	%l2,	0x00BD,	%softint
	call	loop_365
	smulcc	%i6,	%g2,	%g1
	edge8l	%g6,	%o2,	%i1
	subcc	%o4,	0x1A3F,	%l5
loop_365:
	tsubcc	%o6,	%g5,	%o5
	call	loop_366
	fmovrsgez	%l6,	%f5,	%f30
	fmovrdlez	%o7,	%f22,	%f28
	umulcc	%i2,	%o3,	%l4
loop_366:
	call	loop_367
	umul	%i3,	%l0,	%g3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fcmple32	%f24,	%f0,	%i0
loop_367:
	nop
	fitos	%f6,	%f9
	fstox	%f9,	%f20
	call	loop_368
	fmovsu	%fcc3,	%f6,	%f6
	array8	%g4,	%i7,	%o1
	movul	%fcc0,	%i4,	%l3
loop_368:
	fmovscs	%icc,	%f3,	%f3
	array8	%o0,	%l1,	%i5
	edge16	%g7,	%l2,	%i6
	movvc	%icc,	%g2,	%g6
	tge	%xcc,	0x3
	fbl	%fcc1,	loop_369
	rd	%y,	%o2
	wrpr	%i1,	0x0BDA,	%tick
	call	loop_370
loop_369:
	fbu,pt	%fcc0,	loop_371
	fand	%f0,	%f26,	%f16
	call	loop_372
loop_370:
	movpos	%xcc,	0x18D,	%o4
loop_371:
	wr	%g1,	%o6,	%pic
	faligndata	%f26,	%f20,	%f6
loop_372:
	movleu	%xcc,	0x582,	%l5
	call	loop_373
	rdhpr	%hintp,	%o5
	call	loop_374
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_373:
	edge8ln	%g5,	%o7,	%i2
	movue	%fcc0,	%l6,	%l4
loop_374:
	edge32ln	%i3,	%o3,	%g3
	call	loop_375
	tge	%icc,	0x0
	call	loop_376
	call	loop_377
loop_375:
	wr	%l0,	%i0,	%sys_tick
	nop
	setx	0x3036DC9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xA8EB6EDB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f7,	%f27
loop_376:
	rdhpr	%htba,	%i7
loop_377:
	call	loop_378
	call	loop_379
	edge16ln	%g4,	%i4,	%o1
	fandnot2	%f2,	%f22,	%f8
loop_378:
	call	loop_380
loop_379:
	nop
	fitod	%f23,	%f22
	edge32l	%l3,	%l1,	%i5
	nop
	setx loop_381, %l0, %l1
	jmpl %l1, %o0
loop_380:
	nop
	fitos	%f29,	%f16
	wr	%g7,	%i6,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_381:
	fmovsle	%fcc3,	%f13,	%f20
	stbar
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g6
	fmovduge	%fcc0,	%f6,	%f20
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sdivx	%o2,	%g2,	%o4
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%g1
	fmovdge	%fcc1,	%f16,	%f0
	addccc	%o6,	%l5,	%o5
	call	loop_382
	call	loop_383
	fone	%f18
	fpsub16	%f16,	%f22,	%f26
loop_382:
	fmovsgu	%icc,	%f6,	%f19
loop_383:
	movvs	%xcc,	%i1,	%o7
	call	loop_384
	tsubcc	%i2,	%l6,	%l4
	fmovdleu	%xcc,	%f24,	%f0
	edge8ln	%g5,	%o3,	%g3
loop_384:
	edge8n	%l0,	%i0,	%i3
	nop
	setx	loop_385,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004200001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	st	%f12,	[%l7 + 0x20]
	fmovdne	%fcc3,	%f6,	%f8
	call	loop_386
loop_385:
	fmovd	%f18,	%f6
	call	loop_387
	orcc	%i7,	0x11B4,	%g4
loop_386:
	call	loop_388
	call	loop_389
loop_387:
	fpsub16s	%f0,	%f4,	%f26
	tcs	%icc,	0x2
loop_388:
	fmovdgu	%icc,	%f24,	%f20
loop_389:
	call	loop_390
	call	loop_391
	fmovrsgez	%i4,	%f22,	%f12
	call	loop_392
loop_390:
	call	loop_393
loop_391:
	orn	%l3,	0x132A,	%o1
	fabss	%f14,	%f0
loop_392:
	udivcc	%l1,	0x00,	%i5
loop_393:
	fnot2s	%f22,	%f10
	call	loop_394
	call	loop_395
	fmovdcc	%xcc,	%f24,	%f16
	fornot1s	%f27,	%f19,	%f15
loop_394:
	call	loop_396
loop_395:
	call	loop_397
	wrpr	%o0,	0x1115,	%cwp
	fmovspos	%icc,	%f13,	%f5
loop_396:
	movn	%xcc,	%g7,	%i6
loop_397:
	udivx	%g6,	%o2,	%g2
	fones	%f23
	call	loop_398
	nop
	set	0x50, %o6
	stx	%o4,	[%l7 + %o6]
	fone	%f24
	fmovsne	%fcc0,	%f20,	%f19
loop_398:
	call	loop_399
	wrpr	%l2,	0x002D,	%tick
	call	loop_400
	edge8l	%o6,	%l5,	%g1
loop_399:
	srlx	%i1,	0x11,	%o7
	wr	%g0,	0xd1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_400:
	fbne,a,pn	%fcc3,	loop_401
	call	loop_402
	fsrc2s	%f30,	%f30
	call	loop_403
loop_401:
	call	loop_404
loop_402:
	fmovsvs	%xcc,	%f13,	%f16
	call	loop_405
loop_403:
	fxnors	%f19,	%f25,	%f25
loop_404:
	fpadd32s	%f27,	%f8,	%f17
	fmovrde	%o5,	%f30,	%f28
loop_405:
	call	loop_406
	call	loop_407
	fmovrslez	%i2,	%f9,	%f2
	call	loop_408
loop_406:
	call	loop_409
loop_407:
	nop
	setx	loop_410,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024100001403,	%l0,	%l1
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
	fcmpgt32	%f20,	%f4,	%l6
loop_408:
	nop
	wr	%g0,	0x88,	%asi
	stwa	%g5,	[%l7 + 0x10] %asi
loop_409:
	fmovscc	%xcc,	%f24,	%f20
loop_410:
	fmovrdgz	%l4,	%f30,	%f24
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f8
	movuge	%fcc2,	0x62A,	%o3
	fnot1	%f8,	%f28
	sub	%g3,	%i0,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE46, 	%hsys_tick_cmpr
	addccc	%g4,	%l3,	%i4
	call	loop_411
	edge8n	%l1,	%i5,	%o0
	bmask	%g7,	%i6,	%o1
	nop
	fitos	%f1,	%f26
	fstox	%f26,	%f4
loop_411:
	nop
	setx	0xA6862A38896C4920,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x713B33B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f24,	%f22
	call	loop_412
	pdist	%f14,	%f18,	%f24
	fmul8x16al	%f11,	%f31,	%f12
	call	loop_413
loop_412:
	call	loop_414
	call	loop_415
	movug	%fcc3,	%o2,	%g6
loop_413:
	fmovdg	%icc,	%f30,	%f22
loop_414:
	fmovrslez	%g2,	%f13,	%f17
loop_415:
	edge8ln	%o4,	%l2,	%l5
	fmovdgu	%xcc,	%f16,	%f6
	edge32n	%o6,	%g1,	%o7
	fors	%f24,	%f13,	%f16
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f7
	fmovsl	%icc,	%f4,	%f28
	wrpr	%o5,	%i1,	%cwp
	movleu	%icc,	%i2,	%l6
	fpsub32	%f22,	%f6,	%f22
	subccc	%g5,	%l4,	%o3
	edge16n	%i0,	%i3,	%i7
	fpadd16s	%f21,	%f9,	%f7
	fmul8ulx16	%f18,	%f10,	%f28
	fzero	%f0
	orcc	%l0,	%g3,	%g4
	movrgez	%i4,	0x398,	%l3
	srax	%l1,	0x0F,	%o0
	movrlez	%i5,	%i6,	%o1
	movneg	%xcc,	%o2,	%g7
	call	loop_416
	srl	%g2,	%g6,	%l2
	fmovdo	%fcc1,	%f30,	%f0
	fmovrsgz	%l5,	%f11,	%f7
loop_416:
	call	loop_417
	call	loop_418
	srax	%o6,	0x01,	%o4
	call	loop_419
loop_417:
	tge	%xcc,	0x4
loop_418:
	fand	%f22,	%f18,	%f8
	brgz,pt	%o7,	loop_420
loop_419:
	edge8ln	%g1,	%o5,	%i1
	subccc	%i2,	0x116D,	%l6
	nop
	setx	0xB196EF7FCFBCDB8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x5C0755DA02BBBABD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f4,	%f0
loop_420:
	sub	%l4,	0x110B,	%g5
	call	loop_421
	rdhpr	%hpstate,	%i0
	rd	%asi,	%o3
	fcmpgt16	%f4,	%f22,	%i3
loop_421:
	stx	%fsr,	[%l7 + 0x20]
	fpsub16s	%f16,	%f19,	%f21
	srlx	%i7,	%l0,	%g4
	nop
	fitos	%f0,	%f15
	fstox	%f15,	%f6
	rdpr	%cleanwin,	%i4
	call	loop_422
	call	loop_423
	lduw	[%l7 + 0x28],	%l3
	movue	%fcc0,	0x27E,	%g3
loop_422:
	fmovdg	%fcc0,	%f22,	%f16
loop_423:
	edge16ln	%o0,	%i5,	%i6
	nop
	setx	loop_424,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031400001405,	%l0,	%l1
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
	xnor	%l1,	%o2,	%o1
	fbn,pt	%fcc3,	loop_425
	call	loop_426
loop_424:
	fble	%fcc0,	loop_427
	movre	%g2,	0x19D,	%g6
loop_425:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE6, 	%hsys_tick_cmpr
loop_426:
	call	loop_428
loop_427:
	tgu	%icc,	0x3
	tle	%xcc,	0x3
	ta	%xcc,	0x7
loop_428:
	fcmpes	%fcc0,	%f17,	%f24
	tne	%icc,	0x5
	fands	%f17,	%f10,	%f26
	wr	%g0,	0x04,	%asi
	stha	%o6,	[%l7 + 0x32] %asi
	taddcctv	%l2,	0x0018,	%o7
	fmovdul	%fcc3,	%f10,	%f30
	call	loop_429
	call	loop_430
	tvc	%icc,	0x0
	tcc	%xcc,	0x7
loop_429:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_430:
	fabss	%f11,	%f1
	fnegs	%f24,	%f3
	call	loop_431
	for	%f18,	%f24,	%f16
	membar	0x0C
	fpadd32s	%f16,	%f30,	%f19
loop_431:
	move	%icc,	0x1A8,	%g1
	fsrc2	%f28,	%f10
	rdhpr	%hpstate,	%o4
	call	loop_432
	rdhpr	%htba,	%o5
	subc	%i2,	%i1,	%l6
	flushw
loop_432:
	nop
	setx	0x3EBAE79AD44B769C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x87483357E982C4FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f20,	%f16
	tleu	%icc,	0x7
	popc	0x0DD0,	%g5
	tne	%icc,	0x5
	fmovdule	%fcc0,	%f12,	%f28
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 18
!	Type a   	: 32
!	Type x   	: 7
!	Type cti   	: 142
!	Type f   	: 162
!	Type i   	: 139
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
	set	0x5,	%g1
	set	0x9,	%g2
	set	0xE,	%g3
	set	0xD,	%g4
	set	0x7,	%g5
	set	0x8,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xC,	%i1
	set	-0x2,	%i2
	set	-0xF,	%i3
	set	-0x1,	%i4
	set	-0xF,	%i5
	set	-0x7,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x5CDDF175,	%l0
	set	0x447E933E,	%l1
	set	0x512BFF1F,	%l2
	set	0x5FF81379,	%l3
	set	0x5ED3D6BC,	%l4
	set	0x12576056,	%l5
	set	0x10FF61AC,	%l6
	!# Output registers
	set	-0x1115,	%o0
	set	0x10A3,	%o1
	set	0x1D6F,	%o2
	set	-0x05D5,	%o3
	set	0x0D79,	%o4
	set	0x0E47,	%o5
	set	0x1869,	%o6
	set	-0x0332,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	fmovsleu	%icc,	%f24,	%f25
	call	loop_433
	call	loop_434
	edge32	%i0,	%o3,	%l4
	fsrc1s	%f8,	%f8
loop_433:
	nop
	set	0x3A, %o7
	ldsha	[%l7 + %o7] 0x18,	%i7
loop_434:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x906, 	%hsys_tick_cmpr
	udivcc	%i4,	%l3,	%g3
	fmul8x16al	%f30,	%f7,	%f26
	xnorcc	%o0,	%i5,	%i6
	tge	%xcc,	0x7
	rd	%sys_tick_cmpr,	%l1
	fbl	%fcc1,	loop_435
	sdivx	%o2,	0x00,	%l0
	set	0x1C, %g4
	lduwa	[%l7 + %g4] 0x89,	%o1
loop_435:
	call	loop_436
	tsubcctv	%g2,	0x030A,	%g7
	call	loop_437
	movvs	%xcc,	%l5,	%o6
loop_436:
	rd	%pc,	%g6
	fzeros	%f26
loop_437:
	pdist	%f16,	%f2,	%f28
	call	loop_438
	popc	%o7,	%g1
	call	loop_439
	movl	%fcc0,	%l2,	%o4
loop_438:
	nop
	set	0x1F, %l2
	ldsba	[%l7 + %l2] 0x0c,	%o5
loop_439:
	call	loop_440
	fcmps	%fcc1,	%f11,	%f0
	call	loop_441
	fmovsge	%xcc,	%f22,	%f13
loop_440:
	fmovdul	%fcc1,	%f20,	%f20
	call	loop_442
loop_441:
	tn	%icc,	0x3
	movrlez	%i1,	%l6,	%i2
	ldstub	[%l7 + 0x48],	%g5
loop_442:
	fmovduge	%fcc0,	%f6,	%f20
	xnor	%i0,	%o3,	%i7
	rd	%pc,	%l4
	call	loop_443
	xnor	%g4,	0x10D1,	%i4
	call	loop_444
	orn	%i3,	0x0448,	%l3
loop_443:
	fxnor	%f26,	%f20,	%f24
	call	loop_445
loop_444:
	call	loop_446
	call	loop_447
	movlg	%fcc0,	%g3,	%i5
loop_445:
	std	%f16,	[%l7 + 0x68]
loop_446:
	call	loop_448
loop_447:
	call	loop_449
	sub	%o0,	0x1F31,	%i6
	rd	%pc,	%l1
loop_448:
	movule	%fcc0,	0x2BA,	%o2
loop_449:
	sra	%l0,	0x17,	%g2
	call	loop_450
	call	loop_451
	fone	%f30
	andncc	%g7,	0x1338,	%l5
loop_450:
	wr	%o1,	%g6,	%ccr
loop_451:
	call	loop_452
	fmovdvs	%icc,	%f16,	%f8
	edge16	%o7,	%g1,	%o6
	nop
	setx	0x25A9F4B3E6FA3954,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xF027EF966B59BCD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f24,	%f6
loop_452:
	call	loop_453
	movre	%o4,	0x185,	%l2
	rd	%ccr,	%i1
	call	loop_454
loop_453:
	call	loop_455
	call	loop_456
	nop
	fitod	%f12,	%f0
loop_454:
	call	loop_457
loop_455:
	fand	%f12,	%f14,	%f14
loop_456:
	fexpand	%f3,	%f20
	st	%fsr,	[%l7 + 0x64]
loop_457:
	call	loop_458
	fmovsgu	%icc,	%f21,	%f4
	fmovrdgz	%o5,	%f14,	%f20
	call	loop_459
loop_458:
	nop
	setx loop_460, %l0, %l1
	jmpl %l1, %l6
	fabss	%f20,	%f29
	fsrc2	%f16,	%f30
loop_459:
	nop
	setx	0x69D384A83E8A8865,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x02849318E1C91818,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f30,	%f14
loop_460:
	movule	%fcc2,	0x774,	%i2
	tl	%icc,	0x1
	fcmpgt16	%f14,	%f28,	%g5
	brnz	%i0,	loop_461
	sdivcc	%i7,	0x00,	%l4
	fcmpne16	%f8,	%f4,	%o3
	wr	%i4,	%g4,	%clear_softint
loop_461:
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f12
	ld	[%l7 + 0x64],	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdu	%fcc2,	%f6,	%f6
	call	loop_462
	call	loop_463
	call	loop_464
	fpadd16	%f4,	%f0,	%f22
loop_462:
	call	loop_465
loop_463:
	movuge	%fcc2,	0x48B,	%i3
loop_464:
	fnand	%f10,	%f2,	%f16
	call	loop_466
loop_465:
	rdhpr	%htba,	%g3
	movul	%fcc2,	%o0,	%i6
	rd	%softint,	%i5
loop_466:
	fmovduge	%fcc3,	%f14,	%f28
	fmovdge	%fcc1,	%f12,	%f20
	nop
	set	0x7E, %o2
	ldsh	[%l7 + %o2],	%l1
	sir	0x013E
	call	loop_467
	andncc	%o2,	0x0457,	%l0
	bcs,pt	%xcc,	loop_468
	fmovrdgz	%g7,	%f2,	%f4
loop_467:
	andcc	%g2,	0x0955,	%l5
	call	loop_469
loop_468:
	nop
	setx	0xD2E9F11D13F90359,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f2
	membar	0x12
	bcs,pt	%icc,	loop_470
loop_469:
	call	loop_471
	rdpr	%cleanwin,	%o1
	for	%f22,	%f28,	%f28
loop_470:
	call	loop_472
loop_471:
	fone	%f14
	call	loop_473
	taddcc	%o7,	%g1,	%o6
loop_472:
	call	loop_474
	orncc	%g6,	%l2,	%o4
loop_473:
	umul	%i1,	%o5,	%i2
	call	loop_475
loop_474:
	fmovrdne	%g5,	%f8,	%f24
	fsrc1	%f2,	%f18
	call	loop_476
loop_475:
	srl	%i0,	%i7,	%l4
	and	%l6,	0x18E4,	%i4
	nop
	set	0x10, %i2
	ldsh	[%l7 + %i2],	%g4
loop_476:
	mulscc	%l3,	%o3,	%g3
	st	%f20,	[%l7 + 0x78]
	movcs	%xcc,	%o0,	%i6
	brz,a,pn	%i3,	loop_477
	fmovrse	%l1,	%f5,	%f16
	call	loop_478
	alignaddrl	%i5,	%l0,	%g7
loop_477:
	std	%g2,	[%l7 + 0x70]
	fands	%f18,	%f26,	%f11
loop_478:
	brlz,pn	%o2,	loop_479
	call	loop_480
	call	loop_481
	fpack16	%f16,	%f19
loop_479:
	tpos	%icc,	0x0
loop_480:
	edge16ln	%l5,	%o1,	%g1
loop_481:
	mulscc	%o6,	%o7,	%l2
	call	loop_482
	tg	%icc,	0x3
	array8	%o4,	%i1,	%o5
	ta	%icc,	0x5
loop_482:
	call	loop_483
	rd	%pc,	%g6
	add	%g5,	0x023E,	%i0
	fmovdge	%fcc2,	%f20,	%f26
loop_483:
	fcmpgt32	%f6,	%f0,	%i2
	call	loop_484
	movrlez	%i7,	%l4,	%l6
	wr	%i4,	0x001D,	%clear_softint
	call	loop_485
loop_484:
	rd	%softint,	%g4
	call	loop_486
	nop
	setx	0x21F15712,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x9C5346D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f10,	%f5
loop_485:
	call	loop_487
	sra	%l3,	%g3,	%o3
loop_486:
	movule	%fcc1,	0x783,	%i6
	fbule,pt	%fcc3,	loop_488
loop_487:
	fpadd32s	%f27,	%f28,	%f15
	srlx	%o0,	%l1,	%i3
	tsubcc	%l0,	0x110D,	%i5
loop_488:
	fmovsu	%fcc3,	%f21,	%f22
	fmul8ulx16	%f10,	%f8,	%f24
	rdhpr	%htba,	%g7
	call	loop_489
	srax	%g2,	0x01,	%l5
	fmovsle	%fcc1,	%f12,	%f28
	fabsd	%f14,	%f26
loop_489:
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f12
	fmovsvc	%icc,	%f15,	%f3
	call	loop_490
	ba,pt	%icc,	loop_491
	ta	%icc,	0x0
	fmovdpos	%xcc,	%f22,	%f0
loop_490:
	movre	%o1,	%o2,	%g1
loop_491:
	movrgez	%o7,	0x245,	%o6
	fmovrslez	%l2,	%f5,	%f16
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	call	loop_492
	call	loop_493
	srl	%i1,	0x14,	%o5
	call	loop_494
loop_492:
	fabss	%f19,	%f2
loop_493:
	call	loop_495
	call	loop_496
loop_494:
	rdhpr	%hsys_tick_cmpr,	%g6
	call	loop_497
loop_495:
	call	loop_498
loop_496:
	bg,a,pn	%icc,	loop_499
	fmovsne	%icc,	%f4,	%f20
loop_497:
	fpack32	%f14,	%f10,	%f0
loop_498:
	wrpr	%g5,	0x06A3,	%cwp
loop_499:
	call	loop_500
	flushw
	rd	%softint,	%i0
	ldd	[%l7 + 0x10],	%f20
loop_500:
	fmul8ulx16	%f12,	%f4,	%f8
	fandnot1	%f26,	%f8,	%f18
	faligndata	%f24,	%f0,	%f28
	brnz,pt	%o4,	loop_501
	fcmpeq32	%f8,	%f20,	%i7
	call	loop_502
	fabsd	%f2,	%f12
loop_501:
	sll	%l4,	0x07,	%i2
	bvc	%icc,	loop_503
loop_502:
	fcmple16	%f8,	%f0,	%i4
	fmovscs	%xcc,	%f1,	%f17
	pdist	%f28,	%f18,	%f14
loop_503:
	call	loop_504
	fsrc1	%f10,	%f8
	fmovsn	%xcc,	%f22,	%f3
	bpos,a	%xcc,	loop_505
loop_504:
	fmovduge	%fcc2,	%f20,	%f28
	call	loop_506
	nop
	setx	0x5CD92A27C466778D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x8D2938C9F807A601,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f30,	%f18
loop_505:
	orn	%l6,	%g4,	%l3
	call	loop_507
loop_506:
	nop
	fitos	%f7,	%f3
	fstox	%f3,	%f4
	fxtos	%f4,	%f1
	fmovscs	%xcc,	%f11,	%f1
	orcc	%g3,	%i6,	%o3
loop_507:
	call	loop_508
	call	loop_509
	tgu	%icc,	0x6
	fpmerge	%f12,	%f30,	%f4
loop_508:
	call	loop_510
loop_509:
	call	loop_511
	fand	%f4,	%f28,	%f22
	fmovdg	%fcc0,	%f6,	%f4
loop_510:
	call	loop_512
loop_511:
	mulx	%o0,	0x164D,	%l1
	nop
	setx	loop_513,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011400001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr 	%g0, 	0x4, 	%fprs
loop_512:
	tl	%icc,	0x7
	call	loop_514
loop_513:
	andncc	%i3,	0x0C0C,	%g7
	fxors	%f12,	%f15,	%f9
	bshuffle	%f20,	%f10,	%f26
loop_514:
	nop
	set	0x78, %o3
	stba	%g2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f24
	call	loop_515
	movg	%icc,	0x760,	%l5
	sdiv	%o1,	0x00,	%o2
	fpsub16	%f28,	%f14,	%f30
loop_515:
	movl	%icc,	0x209,	%g1
	call	loop_516
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_517
	call	loop_518
loop_516:
	fpadd32	%f16,	%f6,	%f26
	fpmerge	%f3,	%f2,	%f8
loop_517:
	rdhpr	%ver,	%o7
loop_518:
	fmovrdlez	%o6,	%f2,	%f8
	fmovrdne	%l2,	%f14,	%f30
	fmovdgu	%icc,	%f28,	%f10
	taddcc	%o5,	0x1BD0,	%i1
	fmovdue	%fcc0,	%f24,	%f20
	fxors	%f30,	%f20,	%f1
	edge32ln	%g5,	%i0,	%o4
	umul	%g6,	%l4,	%i2
	call	loop_519
	fmovsue	%fcc1,	%f15,	%f13
	fbge,a	%fcc1,	loop_520
	nop
	setx	0x377611EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xC8AF0231,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f25,	%f20
loop_519:
	call	loop_521
	call	loop_522
loop_520:
	edge8l	%i4,	%i7,	%g4
	movpos	%icc,	0x5D7,	%l3
loop_521:
	nop
	set	0x48, %o5
	stb	%l6,	[%l7 + %o5]
loop_522:
	call	loop_523
	call	loop_524
	bn,a	%xcc,	loop_525
	fmovsug	%fcc2,	%f11,	%f19
loop_523:
	fmovdug	%fcc1,	%f12,	%f24
loop_524:
	fba	%fcc0,	loop_526
loop_525:
	fmuld8ulx16	%f4,	%f13,	%f24
	call	loop_527
	smulcc	%i6,	0x0618,	%g3
loop_526:
	nop
	setx	0x33289A3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x2FD55FED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f12,	%f7
	fnegs	%f28,	%f8
loop_527:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_528
	movgu	%xcc,	%l0,	%l1
	fpadd16s	%f29,	%f6,	%f25
	brgez,a,pn	%i3,	loop_529
loop_528:
	movneg	%xcc,	0x26E,	%g7
	call	loop_530
	brgez,a,pn	%g2,	loop_531
loop_529:
	sdivcc	%l5,	%o1,	%i5
	ldd	[%l7 + 0x38],	%f0
loop_530:
	fmovdcc	%icc,	%f24,	%f30
loop_531:
	wrpr	%g1,	%o2,	%pil
	call	loop_532
	tneg	%xcc,	0x7
	tg	%xcc,	0x5
	call	loop_533
loop_532:
	call	loop_534
	orncc	%o7,	0x1961,	%o6
	fpadd32s	%f2,	%f20,	%f31
loop_533:
	fba,a,pn	%fcc3,	loop_535
loop_534:
	call	loop_536
	fornot1	%f20,	%f4,	%f12
	fmovse	%icc,	%f29,	%f12
loop_535:
	fmovsleu	%xcc,	%f15,	%f24
loop_536:
	nop
	fitos	%f15,	%f28
	smul	%o5,	%l2,	%i1
	call	loop_537
	edge16ln	%i0,	%o4,	%g5
	fmovsle	%fcc0,	%f17,	%f3
	bn,a	%icc,	loop_538
loop_537:
	tg	%icc,	0x4
	fmovrslez	%l4,	%f23,	%f27
	call	loop_539
loop_538:
	for	%f16,	%f12,	%f26
	edge8	%i2,	%g6,	%i4
	srax	%g4,	0x04,	%l3
loop_539:
	call	loop_540
	tl	%icc,	0x2
	nop
	setx	loop_541,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021100001404,	%l0,	%l1
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
	call	loop_542
loop_540:
	tle	%icc,	0x4
	fcmpne16	%f18,	%f6,	%i7
loop_541:
	orcc	%i6,	%l6,	%g3
loop_542:
	wr	%o3,	%o0,	%sys_tick
	fmovsgu	%icc,	%f9,	%f1
	tge	%icc,	0x7
	movge	%fcc3,	0x7A5,	%l0
	call	loop_543
	fandnot1s	%f17,	%f27,	%f23
	nop
	setx	0xC23DE199,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f29
	movneg	%xcc,	%i3,	%g7
loop_543:
	call	loop_544
	wr	%g2,	0x0CA3,	%ccr
	call	loop_545
	movuge	%fcc1,	0x3F5,	%l1
loop_544:
	tsubcctv	%l5,	0x1FEF,	%o1
	call	loop_546
loop_545:
	tneg	%xcc,	0x4
	rdhpr	%htba,	%g1
	sra	%i5,	0x19,	%o2
loop_546:
	array8	%o7,	%o6,	%l2
	andcc	%o5,	%i1,	%o4
	fmovsug	%fcc1,	%f28,	%f1
	call	loop_547
	wrpr	%g5,	%l4,	%pil
	nop
	set	0x6C, %g1
	swap	[%l7 + %g1],	%i2
	fmovdvc	%icc,	%f10,	%f16
loop_547:
	nop
	setx	0x38B708CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f5
	edge32ln	%i0,	%i4,	%g6
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f24
	alignaddr	%g4,	%i7,	%i6
	call	loop_548
	call	loop_549
	te	%xcc,	0x0
	edge16n	%l6,	%l3,	%g3
loop_548:
	fmovdvs	%icc,	%f30,	%f6
loop_549:
	movrlz	%o3,	0x35D,	%o0
	call	loop_550
	add	%i3,	%g7,	%l0
	brlez	%l1,	loop_551
	call	loop_552
loop_550:
	call	loop_553
	xnor	%l5,	0x11CD,	%g2
loop_551:
	st	%f13,	[%l7 + 0x38]
loop_552:
	tvs	%icc,	0x7
loop_553:
	sdiv	%o1,	0x00,	%g1
	call	loop_554
	call	loop_555
	fcmpes	%fcc1,	%f16,	%f27
	umul	%o2,	%o7,	%i5
loop_554:
	call	loop_556
loop_555:
	bn,pt	%xcc,	loop_557
	call	loop_558
	movrne	%o6,	0x26D,	%o5
loop_556:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_557:
	call	loop_559
loop_558:
	fmovsuge	%fcc1,	%f1,	%f28
	movle	%fcc0,	0x37F,	%o4
	movul	%fcc0,	%l4,	%g5
loop_559:
	call	loop_560
	brgez,a,pn	%i0,	loop_561
	call	loop_562
	call	loop_563
loop_560:
	fzeros	%f25
loop_561:
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f0
loop_562:
	fmovdule	%fcc0,	%f0,	%f6
loop_563:
	call	loop_564
	fblg,pn	%fcc1,	loop_565
	fmovdcc	%xcc,	%f20,	%f18
	call	loop_566
loop_564:
	movlg	%fcc0,	0x19A,	%i4
loop_565:
	call	loop_567
	call	loop_568
loop_566:
	call	loop_569
	fmovdu	%fcc0,	%f18,	%f12
loop_567:
	rdhpr	%hpstate,	%i2
loop_568:
	call	loop_570
loop_569:
	rdpr	%tba,	%g6
	fmovdug	%fcc3,	%f6,	%f16
	rd	%tick_cmpr,	%i7
loop_570:
	nop
	fitos	%f9,	%f30
	fstoi	%f30,	%f18
	edge8	%g4,	%l6,	%l3
	nop
	setx	0x74071717,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x7D32045E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f19,	%f20
	movrgez	%g3,	0x1D9,	%o3
	fbule,pt	%fcc3,	loop_571
	call	loop_572
	fabsd	%f20,	%f16
	brnz,a	%o0,	loop_573
loop_571:
	fcmpgt32	%f16,	%f10,	%i3
loop_572:
	movul	%fcc1,	%i6,	%g7
	call	loop_574
loop_573:
	pdist	%f30,	%f8,	%f18
	fbul,pn	%fcc3,	loop_575
	movg	%xcc,	0x6A2,	%l1
loop_574:
	call	loop_576
	pdist	%f14,	%f20,	%f26
loop_575:
	call	loop_577
	fmovsvs	%icc,	%f22,	%f17
loop_576:
	udiv	%l5,	%g2,	%o1
	fbul,a,pt	%fcc1,	loop_578
loop_577:
	call	loop_579
	tl	%xcc,	0x4
	wrpr	%l0,	0x1EBF,	%pil
loop_578:
	call	loop_580
loop_579:
	tleu	%icc,	0x2
	fpadd16s	%f4,	%f13,	%f14
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o2
loop_580:
	wrpr 	%g0, 	0x2, 	%gl
	rdpr	%tl,	%i5
	fmovdu	%fcc0,	%f0,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tpos	%icc,	0x4
	call	loop_581
	fpadd32s	%f27,	%f13,	%f21
	call	loop_582
	fbul,pt	%fcc2,	loop_583
loop_581:
	movcs	%xcc,	%o6,	%i1
	edge32ln	%l2,	%o4,	%l4
loop_582:
	udivcc	%i0,	0x00,	%i4
loop_583:
	fxnor	%f14,	%f12,	%f6
	fmovduge	%fcc3,	%f8,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fcmple32	%f4,	%f10,	%i2
	rd	%ccr,	%i7
	andn	%l6,	0x0BC3,	%l3
	srlx	%g3,	0x06,	%g4
	rdhpr	%ver,	%o0
	wrpr	%i3,	0x115E,	%pil
	edge32n	%o3,	%i6,	%g7
	be,a	%icc,	loop_584
	call	loop_585
	tneg	%xcc,	0x7
	call	loop_586
loop_584:
	movrne	%l5,	%g2,	%o1
loop_585:
	tne	%xcc,	0x5
	fmovdule	%fcc2,	%f26,	%f26
loop_586:
	fcmped	%fcc1,	%f4,	%f18
	fmovdle	%fcc1,	%f16,	%f24
	nop
	setx	0xA95FA541,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x888184C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f31,	%f21
	movul	%fcc2,	0x1F5,	%l0
	call	loop_587
	call	loop_588
	call	loop_589
	ldsh	[%l7 + 0x44],	%l1
loop_587:
	movrgez	%o7,	%o2,	%i5
loop_588:
	tsubcctv	%o5,	%o6,	%g1
loop_589:
	call	loop_590
	call	loop_591
	pdist	%f16,	%f6,	%f6
	call	loop_592
loop_590:
	bcc,a,pt	%xcc,	loop_593
loop_591:
	alignaddr	%i1,	%l2,	%l4
	call	loop_594
loop_592:
	fmovdlg	%fcc2,	%f16,	%f24
loop_593:
	fabss	%f18,	%f7
	rdpr	%cleanwin,	%o4
loop_594:
	movleu	%xcc,	%i4,	%g5
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%f12
	xor	%g6,	%i2,	%i0
	call	loop_595
	call	loop_596
	fmovsneg	%icc,	%f17,	%f21
loop_595:
	nop

loop_596:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 21
!	Type a   	: 40
!	Type x   	: 6
!	Type cti   	: 164
!	Type f   	: 136
!	Type i   	: 133
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
	set	0x1,	%g1
	set	0xE,	%g2
	set	0x2,	%g3
	set	0x5,	%g4
	set	0xB,	%g5
	set	0xC,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xE,	%i1
	set	-0xA,	%i2
	set	-0xB,	%i3
	set	-0xE,	%i4
	set	-0xE,	%i5
	set	-0xB,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x3AC9E5FC,	%l0
	set	0x13DD5F21,	%l1
	set	0x230E305B,	%l2
	set	0x0A51ECB7,	%l3
	set	0x76F22DDB,	%l4
	set	0x650E5572,	%l5
	set	0x4F013ABC,	%l6
	!# Output registers
	set	0x12EE,	%o0
	set	0x03B4,	%o1
	set	-0x10D9,	%o2
	set	-0x007B,	%o3
	set	-0x0F8B,	%o4
	set	0x1693,	%o5
	set	0x06E2,	%o6
	set	-0x0E6C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	movul	%fcc0,	0x42F,	%i7
	fpadd16	%f4,	%f0,	%f30
	fmovsne	%xcc,	%f11,	%f30
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x45] %asi,	%l6
	prefetch	[%l7 + 0x60],	 2
	fbne	%fcc3,	loop_597
	fcmps	%fcc3,	%f19,	%f3
	xor	%g3,	0x0DDB,	%l3
	faligndata	%f8,	%f8,	%f0
loop_597:
	sub	%g4,	%o0,	%i3
	fmovrsgz	%o3,	%f17,	%f19
	bneg,a	%xcc,	loop_598
	movge	%fcc1,	0x3A9,	%i6
	fmovsug	%fcc0,	%f27,	%f11
	call	loop_599
loop_598:
	nop
	fitos	%f10,	%f12
	fstox	%f12,	%f6
	set	0x28, %l0
	ldswa	[%l7 + %l0] 0x0c,	%l5
loop_599:
	tne	%icc,	0x1
	fmovdcc	%xcc,	%f26,	%f22
	fmovde	%fcc3,	%f18,	%f26
	udiv	%g7,	%g2,	%o1
	call	loop_600
	fbne	%fcc1,	loop_601
	fmovrdgez	%l0,	%f0,	%f16
	fmovsa	%fcc1,	%f25,	%f22
loop_600:
	wr	%l1,	%o7,	%clear_softint
loop_601:
	movue	%fcc3,	0x27B,	%o2
	std	%f22,	[%l7 + 0x38]
	call	loop_602
	call	loop_603
	call	loop_604
	fmul8sux16	%f30,	%f30,	%f24
loop_602:
	nop
	setx	0xE8A038081FE5AB55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x186A0F299E88ECBE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f16,	%f16
loop_603:
	fbul,pn	%fcc1,	loop_605
loop_604:
	sdiv	%i5,	0x00,	%o6
	call	loop_606
	wr 	%g0, 	0x7, 	%fprs
loop_605:
	smulcc	%i1,	%l4,	%l2
	call	loop_607
loop_606:
	brgez	%o4,	loop_608
	movrgez	%i4,	%g6,	%g5
	movo	%fcc1,	0x62E,	%i2
loop_607:
	fmovsn	%fcc1,	%f21,	%f17
loop_608:
	tvs	%icc,	0x3
	subc	%i7,	%l6,	%g3
	fcmpd	%fcc3,	%f18,	%f30
	fcmpne32	%f22,	%f16,	%i0
	fpsub16	%f8,	%f16,	%f8
	call	loop_609
	fandnot2	%f16,	%f2,	%f14
	edge16	%g4,	%l3,	%i3
	smul	%o0,	0x0E8C,	%i6
loop_609:
	call	loop_610
	call	loop_611
	movg	%fcc0,	0x16B,	%l5
	call	loop_612
loop_610:
	fmul8sux16	%f10,	%f8,	%f12
loop_611:
	fbg,pn	%fcc1,	loop_613
	call	loop_614
loop_612:
	edge16n	%o3,	%g2,	%o1
	bg,a	%icc,	loop_615
loop_613:
	call	loop_616
loop_614:
	nop
	set	0x18, %i4
	stx	%g7,	[%l7 + %i4]
	nop
	setx	0xB7C7ED89,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
loop_615:
	fandnot1s	%f29,	%f15,	%f0
loop_616:
	call	loop_617
	te	%xcc,	0x2
	edge8ln	%l1,	%l0,	%o2
	call	loop_618
loop_617:
	ldsw	[%l7 + 0x24],	%i5
	tne	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6D6, 	%hsys_tick_cmpr
loop_618:
	fnot1	%f16,	%f6
	fzeros	%f13
	fmovdge	%fcc2,	%f26,	%f12
	tcc	%icc,	0x0
	call	loop_619
	edge8n	%o6,	%i1,	%l4
	add	%g1,	0x1D8B,	%l2
	fmovdneg	%xcc,	%f0,	%f2
loop_619:
	nop
	set	0x2A, %g2
	ldsha	[%l7 + %g2] 0x81,	%i4
	call	loop_620
	sir	0x11ED
	movrne	%g6,	0x288,	%g5
	andn	%o4,	%i2,	%i7
loop_620:
	fandnot1	%f8,	%f6,	%f28
	subccc	%g3,	%l6,	%i0
	call	loop_621
	call	loop_622
	brgez,a,pt	%l3,	loop_623
	movrgz	%i3,	0x2C1,	%o0
loop_621:
	fmovdg	%fcc1,	%f10,	%f4
loop_622:
	ldd	[%l7 + 0x70],	%g4
loop_623:
	flushw
	fxnor	%f26,	%f2,	%f12
	call	loop_624
	rd	%y,	%i6
	nop
	set	0x18, %l6
	ldub	[%l7 + %l6],	%l5
	fzero	%f12
loop_624:
	fmuld8ulx16	%f28,	%f11,	%f30
	nop
	fitos	%f6,	%f10
	fstoi	%f10,	%f10
	bshuffle	%f6,	%f10,	%f14
	call	loop_625
	fbl,a,pn	%fcc3,	loop_626
	fmovdl	%xcc,	%f22,	%f12
	rdhpr	%hintp,	%o3
loop_625:
	call	loop_627
loop_626:
	addccc	%o1,	%g7,	%g2
	fone	%f18
	tg	%icc,	0x7
loop_627:
	call	loop_628
	nop
	set	0x60, %l4
	prefetch	[%l7 + %l4],	 4
	fmovdu	%fcc1,	%f4,	%f2
	orn	%l0,	0x0D7A,	%o2
loop_628:
	movn	%fcc3,	0x396,	%i5
	call	loop_629
	addccc	%l1,	0x010E,	%o7
	udiv	%o6,	0x00,	%i1
	brz,pn	%l4,	loop_630
loop_629:
	sll	%o5,	0x1C,	%g1
	fpackfix	%f10,	%f13
	bleu,pt	%xcc,	loop_631
loop_630:
	fmovslg	%fcc1,	%f17,	%f1
	fmovsu	%fcc3,	%f17,	%f29
	fmovdlg	%fcc2,	%f16,	%f22
loop_631:
	ldstub	[%l7 + 0x37],	%i4
	tneg	%xcc,	0x7
	andncc	%g6,	%g5,	%o4
	set	0x10, %g7
	stxa	%l2,	[%l7 + %g7] 0x18
	call	loop_632
	fmovsu	%fcc1,	%f30,	%f11
	fbul,pn	%fcc0,	loop_633
	fmovdcs	%xcc,	%f6,	%f14
loop_632:
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f4
	sdivx	%i7,	0x00,	%g3
loop_633:
	call	loop_634
	orcc	%i2,	%l6,	%l3
	call	loop_635
	call	loop_636
loop_634:
	rdhpr	%htba,	%i3
	fmovs	%f11,	%f28
loop_635:
	call	loop_637
loop_636:
	fcmpgt32	%f30,	%f12,	%i0
	fmovrdne	%g4,	%f8,	%f4
	movu	%fcc2,	%i6,	%l5
loop_637:
	fblg	%fcc3,	loop_638
	tcs	%xcc,	0x4
	fpack32	%f14,	%f22,	%f22
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o0
loop_638:
	edge32	%o1,	%o3,	%g7
	fpackfix	%f24,	%f9
	udivx	%l0,	0x00,	%o2
	fmovsul	%fcc2,	%f14,	%f17
	fbug,a,pn	%fcc1,	loop_639
	call	loop_640
	call	loop_641
	call	loop_642
loop_639:
	rdpr	%tl,	%g2
loop_640:
	popc	0x1D4D,	%i5
loop_641:
	for	%f12,	%f26,	%f6
loop_642:
	fmovrsgz	%o7,	%f7,	%f0
	call	loop_643
	add	%o6,	%i1,	%l1
	taddcc	%l4,	%g1,	%o5
	orncc	%g6,	%g5,	%i4
loop_643:
	ta	%icc,	0x6
	fzero	%f12
	xnorcc	%l2,	%i7,	%g3
	fpack32	%f10,	%f22,	%f8
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdivx	%o4,	0x00,	%l6
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f15
	rdhpr	%hintp,	%l3
	fand	%f8,	%f18,	%f2
	fmovrse	%i2,	%f0,	%f2
	wr	%g0,	0x19,	%asi
	sta	%f2,	[%l7 + 0x5C] %asi
	wr	%g0,	0x18,	%asi
	stda	%i0,	[%l7 + 0x38] %asi
	edge16n	%g4,	%i6,	%i3
	fpackfix	%f24,	%f27
	tvc	%xcc,	0x1
	nop
	setx	0xE7F4A2F116A46A18,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xF10BDE63,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f28,	%f20
	fmovrsne	%o0,	%f1,	%f30
	pdist	%f0,	%f2,	%f28
	movul	%fcc1,	0x401,	%o1
	fpadd32	%f12,	%f24,	%f22
	ta	%xcc,	0x6
	edge32	%l5,	%g7,	%o3
	call	loop_644
	edge32n	%o2,	%l0,	%g2
	smulcc	%i5,	%o7,	%o6
	nop
	setx	loop_645,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022200001404,	%l0,	%l1
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
loop_644:
	call	loop_646
	taddcctv	%l1,	0x021C,	%i1
	movg	%xcc,	0x77D,	%l4
loop_645:
	fmovsu	%fcc1,	%f9,	%f26
loop_646:
	fandnot2	%f20,	%f8,	%f28
	orcc	%g1,	0x1E1E,	%g6
	bmask	%o5,	%i4,	%l2
	srl	%i7,	%g5,	%o4
	call	loop_647
	membar	0x1E
	fexpand	%f13,	%f30
	call	loop_648
loop_647:
	nop
	fitod	%f24,	%f18
	nop
	fitos	%f2,	%f20
	fstoi	%f20,	%f1
	call	loop_649
loop_648:
	mulscc	%g3,	0x0A4F,	%l3
	fmovrsgz	%l6,	%f14,	%f31
	movle	%xcc,	0x26C,	%i0
loop_649:
	nop
	setx	0x706DAEBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x03FF204C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f18,	%f30
	fpsub16	%f10,	%f16,	%f10
	call	loop_650
	fmovso	%fcc2,	%f7,	%f1
	nop
	fitos	%f14,	%f7
	fstoi	%f7,	%f27
	fpackfix	%f22,	%f30
loop_650:
	call	loop_651
	call	loop_652
	call	loop_653
	wr 	%g0, 	0x7, 	%fprs
loop_651:
	fornot1s	%f17,	%f28,	%f31
loop_652:
	pdist	%f10,	%f14,	%f6
loop_653:
	tn	%icc,	0x7
	alignaddrl	%i6,	%i3,	%o0
	call	loop_654
	subccc	%i2,	%l5,	%o1
	call	loop_655
	call	loop_656
loop_654:
	fbne,a,pn	%fcc3,	loop_657
	tgu	%icc,	0x7
loop_655:
	edge8n	%o3,	%o2,	%g7
loop_656:
	call	loop_658
loop_657:
	fabsd	%f12,	%f18
	fnegd	%f26,	%f10
	tleu	%icc,	0x0
loop_658:
	call	loop_659
	nop
	setx	0x6E5C69D81361981C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xD6335FB4A8632B56,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f4,	%f28
	call	loop_660
	nop
	fitod	%f6,	%f6
	fdtos	%f6,	%f31
loop_659:
	bmask	%g2,	%l0,	%i5
	fcmpeq32	%f20,	%f12,	%o6
loop_660:
	fmovsuge	%fcc1,	%f28,	%f2
	fmovsge	%fcc0,	%f6,	%f11
	call	loop_661
	call	loop_662
	movul	%fcc2,	0x049,	%l1
	call	loop_663
loop_661:
	movule	%fcc1,	%o7,	%i1
loop_662:
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_664
loop_663:
	bgu,a	%xcc,	loop_665
	bmask	%o5,	%i4,	%g6
	call	loop_666
loop_664:
	mulx	%l2,	0x0918,	%g5
loop_665:
	nop
	set	0x70, %i0
	stxa	%o4,	[%l7 + %i0] 0x22
	membar	#Sync
loop_666:
	call	loop_667
	movge	%fcc2,	%i7,	%l3
	call	loop_668
	call	loop_669
loop_667:
	call	loop_670
	fmovscs	%icc,	%f25,	%f7
loop_668:
	call	loop_671
loop_669:
	wr	%l6,	%g3,	%softint
loop_670:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i0
loop_671:
	nop
	set	0x7C, %i3
	flush	%l7 + %i3
	rd	%softint,	%g4
	fmovs	%f31,	%f12
	fexpand	%f3,	%f6
	call	loop_672
	call	loop_673
	fnegd	%f16,	%f12
	call	loop_674
loop_672:
	nop
	setx	0x369C0E802EC3EC3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xEBF9358798218FCA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f24,	%f2
loop_673:
	fmovs	%f6,	%f18
	fmovsule	%fcc0,	%f5,	%f24
loop_674:
	movu	%fcc0,	%i6,	%o0
	add	%i3,	%i2,	%l5
	call	loop_675
	tsubcctv	%o1,	0x1426,	%o3
	nop
	setx	loop_676,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022200001404,	%l0,	%l1
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
	fpadd32s	%f18,	%f13,	%f18
loop_675:
	fpsub32s	%f24,	%f19,	%f17
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xcc
loop_676:
	srlx	%o2,	%g2,	%g7
	addc	%i5,	%o6,	%l0
	fmovda	%fcc0,	%f4,	%f16
	call	loop_677
	array32	%o7,	%i1,	%g1
	call	loop_678
	fandnot2	%f14,	%f12,	%f30
loop_677:
	call	loop_679
	edge8ln	%l4,	%o5,	%l1
loop_678:
	wrpr	%i4,	0x0834,	%pil
	call	loop_680
loop_679:
	fble	%fcc2,	loop_681
	call	loop_682
	or	%l2,	0x0D4E,	%g5
loop_680:
	call	loop_683
loop_681:
	call	loop_684
loop_682:
	srlx	%o4,	%i7,	%g6
	fmul8ulx16	%f24,	%f30,	%f10
loop_683:
	pdist	%f6,	%f8,	%f10
loop_684:
	fmovsl	%xcc,	%f9,	%f16
	fpack32	%f18,	%f0,	%f24
	nop
	setx	0x9488F02E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xD6A7918E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f24,	%f14
	rdhpr	%htba,	%l6
	tneg	%xcc,	0x1
	fmovsg	%icc,	%f24,	%f28
	call	loop_685
	movrgez	%l3,	0x129,	%i0
	tvs	%icc,	0x4
	call	loop_686
loop_685:
	wr	%g4,	%i6,	%softint
	call	loop_687
	movrlez	%g3,	0x03C,	%i3
loop_686:
	call	loop_688
	call	loop_689
loop_687:
	fmovda	%xcc,	%f22,	%f6
	fmovrsne	%i2,	%f8,	%f27
loop_688:
	fmul8ulx16	%f6,	%f16,	%f24
loop_689:
	fmovsvs	%xcc,	%f26,	%f7
	call	loop_690
	call	loop_691
	fpmerge	%f7,	%f2,	%f30
	tpos	%xcc,	0x5
loop_690:
	nop
	set	0x40, %l5
	prefetch	[%l7 + %l5],	 3
loop_691:
	fxnor	%f22,	%f10,	%f28
	andcc	%l5,	%o1,	%o0
	fand	%f2,	%f30,	%f18
	fands	%f22,	%f27,	%f29
	tl	%xcc,	0x3
	fmovse	%fcc0,	%f7,	%f1
	fmovdg	%icc,	%f6,	%f28
	fnands	%f7,	%f0,	%f15
	edge32	%o2,	%o3,	%g2
	bneg,a	%icc,	loop_692
	call	loop_693
	tsubcc	%i5,	0x0A75,	%o6
	call	loop_694
loop_692:
	nop
	fitos	%f8,	%f18
loop_693:
	fmovsue	%fcc2,	%f0,	%f6
	call	loop_695
loop_694:
	fnegs	%f13,	%f18
	movcc	%icc,	0x2E4,	%l0
	nop
	setx	0x156B3DE4E1A47D84,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5889F3022B41C536,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f18
loop_695:
	fmovrsgz	%o7,	%f12,	%f18
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%g7
	call	loop_696
	call	loop_697
	nop
	setx	0xC1943822,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xB1F1715F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f28,	%f12
	st	%f22,	[%l7 + 0x10]
loop_696:
	call	loop_698
loop_697:
	call	loop_699
	fmovdug	%fcc0,	%f16,	%f30
	call	loop_700
loop_698:
	addc	%g1,	0x0753,	%i1
loop_699:
	fmovs	%f14,	%f19
	call	loop_701
loop_700:
	rd	%y,	%o5
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
loop_701:
	nop
	setx	0x9A284F6CF813AA32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD25CFB0E00F8197F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f12,	%f26
	call	loop_702
	nop
	setx	loop_703,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032400001401,	%l0,	%l1
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
	fmovsu	%fcc3,	%f13,	%f15
	call	loop_704
loop_702:
	subc	%l1,	%l2,	%g5
loop_703:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%i4
loop_704:
	fmovrdgez	%o4,	%f12,	%f18
	movug	%fcc3,	%i7,	%l6
	popc	%g6,	%i0
	call	loop_705
	nop
	set	0x28, %l1
	swap	[%l7 + %l1],	%l3
	tge	%icc,	0x7
	call	loop_706
loop_705:
	call	loop_707
	call	loop_708
	fpsub16	%f20,	%f18,	%f18
loop_706:
	orn	%i6,	0x0C14,	%g3
loop_707:
	call	loop_709
loop_708:
	call	loop_710
	fcmple16	%f0,	%f14,	%g4
	call	loop_711
loop_709:
	ldsh	[%l7 + 0x0C],	%i2
loop_710:
	add	%l5,	%o1,	%o0
	tle	%xcc,	0x4
loop_711:
	call	loop_712
	fandnot1	%f26,	%f10,	%f28
	rdpr	%canrestore,	%i3
	nop
	setx	0xDB962ABE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x3D13E9D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f8,	%f24
loop_712:
	fpadd16	%f12,	%f2,	%f10
	nop
	setx	0xACD9D2C2FC367D86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x17B7797FA839A431,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f4,	%f26
	mova	%fcc0,	0x212,	%o2
	movue	%fcc3,	%g2,	%i5
	call	loop_713
	fmovdgu	%icc,	%f24,	%f20
	fmovscs	%icc,	%f22,	%f5
	tsubcctv	%o3,	%l0,	%o7
loop_713:
	call	loop_714
	call	loop_715
	array8	%g7,	%o6,	%g1
	call	loop_716
loop_714:
	movuge	%fcc3,	%o5,	%i1
loop_715:
	fmovse	%icc,	%f27,	%f9
	call	loop_717
loop_716:
	call	loop_718
	call	loop_719
	mova	%fcc2,	%l1,	%l4
loop_717:
	nop
	wr	%g0,	0xda,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_718:
	subccc	%g5,	%l2,	%o4
loop_719:
	nop
	setx	0x0441AA01,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB1AD2BF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f15,	%f29
	movne	%fcc3,	%i4,	%l6
	call	loop_720
	wrpr 	%g0, 	0x1, 	%gl
	bn,a,pn	%xcc,	loop_721
	call	loop_722
loop_720:
	nop
	set	0x14, %g3
	lduw	[%l7 + %g3],	%l3
	fzero	%f2
loop_721:
	wrpr	%i6,	0x08C4,	%tick
loop_722:
	fxnors	%f5,	%f23,	%f11
	ba,a	%icc,	loop_723
	call	loop_724
	call	loop_725
	fble,pn	%fcc3,	loop_726
loop_723:
	tcc	%xcc,	0x1
loop_724:
	movgu	%xcc,	%g3,	%i0
loop_725:
	wr	%i2,	0x0A88,	%softint
loop_726:
	rdpr	%cleanwin,	%l5
	call	loop_727
	taddcc	%g4,	%o1,	%o0
	fmovrdne	%i3,	%f10,	%f6
	srl	%o2,	%i5,	%g2
loop_727:
	call	loop_728
	sethi	0x04C4,	%o3
	call	loop_729
	fmul8ulx16	%f22,	%f8,	%f0
loop_728:
	sdivcc	%l0,	0x00,	%o7
	call	loop_730
loop_729:
	nop
	setx	0xA5C190AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	nop
	setx	0x1F50F1EDD422BE7C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f22
	movre	%o6,	0x1A5,	%g7
loop_730:
	bmask	%g1,	%i1,	%o5
	wr	%l4,	0x1122,	%pic
	call	loop_731
	edge32l	%l1,	%g5,	%o4
	call	loop_732
	fsrc1s	%f0,	%f15
loop_731:
	smul	%l2,	0x0B3B,	%i4
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f26
loop_732:
	call	loop_733
	te	%icc,	0x4
	fpsub16	%f6,	%f24,	%f8
	sll	%l6,	%g6,	%l3
loop_733:
	fmovso	%fcc3,	%f24,	%f25
	bleu,a	%icc,	loop_734
	sdivx	%i6,	%i7,	%i0
	bneg,pt	%icc,	loop_735
	mova	%icc,	%g3,	%l5
loop_734:
	fmovsgu	%xcc,	%f0,	%f24
	call	loop_736
loop_735:
	fmovrdlez	%g4,	%f2,	%f0
	fmovsleu	%xcc,	%f23,	%f27
	fnot2	%f16,	%f28
loop_736:
	call	loop_737
	bneg,pn	%xcc,	loop_738
	call	loop_739
	call	loop_740
loop_737:
	fnot2	%f28,	%f0
loop_738:
	subccc	%o1,	%o0,	%i3
loop_739:
	fmovso	%fcc2,	%f3,	%f9
loop_740:
	fmovrslez	%o2,	%f18,	%f6
	nop
	fitos	%f11,	%f9
	fstox	%f9,	%f0
	fone	%f26
	movl	%xcc,	0x227,	%i2
	ble,a	%xcc,	loop_741
	fsrc1	%f22,	%f22
	movne	%xcc,	%i5,	%o3
	taddcctv	%g2,	%o7,	%l0
loop_741:
	fxors	%f17,	%f26,	%f9
	fmovrdlez	%o6,	%f22,	%f22
	fmovdne	%icc,	%f4,	%f2
	sth	%g7,	[%l7 + 0x3A]
	movle	%icc,	%i1,	%o5
	nop
	set	0x64, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x1E, %g6
	ldsh	[%l7 + %g6],	%g1
	fbug	%fcc3,	loop_742
	fmovdo	%fcc1,	%f2,	%f6
loop_742:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 34
!	Type a   	: 22
!	Type cti   	: 146
!	Type x   	: 15
!	Type f   	: 151
!	Type i   	: 132
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
	set	0xA,	%g1
	set	0xB,	%g2
	set	0xA,	%g3
	set	0xF,	%g4
	set	0xB,	%g5
	set	0x2,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xA,	%i1
	set	-0x3,	%i2
	set	-0xB,	%i3
	set	-0x8,	%i4
	set	-0xF,	%i5
	set	-0x4,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x50CB166B,	%l0
	set	0x0531FBA3,	%l1
	set	0x3405A0C7,	%l2
	set	0x5DDC4F9B,	%l3
	set	0x3F8252BE,	%l4
	set	0x4D2572B1,	%l5
	set	0x2F7A1AF4,	%l6
	!# Output registers
	set	-0x00B7,	%o0
	set	-0x15D8,	%o1
	set	-0x08F0,	%o2
	set	-0x1F51,	%o3
	set	0x0F6C,	%o4
	set	-0x0D3B,	%o5
	set	0x04D0,	%o6
	set	-0x0DA0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	fmovsneg	%icc,	%f15,	%f26
	addccc	%l1,	%l4,	%o4
	tsubcc	%g5,	0x18C0,	%l2
	call	loop_743
	call	loop_744
	pdist	%f22,	%f22,	%f24
	call	loop_745
loop_743:
	fmovdleu	%icc,	%f14,	%f4
loop_744:
	faligndata	%f14,	%f22,	%f6
	addc	%l6,	%i4,	%l3
loop_745:
	fmovdue	%fcc1,	%f10,	%f8
	call	loop_746
	rdhpr	%hintp,	%g6
	fmovse	%fcc1,	%f29,	%f9
	fmovsue	%fcc2,	%f18,	%f5
loop_746:
	fmovsl	%fcc0,	%f21,	%f19
	sra	%i7,	%i0,	%g3
	fands	%f28,	%f25,	%f13
	fmovdu	%fcc3,	%f24,	%f18
	call	loop_747
	brgez,a	%l5,	loop_748
	fmovso	%fcc2,	%f26,	%f18
	bvc,a,pt	%icc,	loop_749
loop_747:
	call	loop_750
loop_748:
	fmovsuge	%fcc0,	%f0,	%f24
	be,pt	%icc,	loop_751
loop_749:
	fnegs	%f10,	%f31
loop_750:
	fmovsle	%fcc1,	%f9,	%f23
	call	loop_752
loop_751:
	call	loop_753
	andcc	%i6,	0x0D06,	%o1
	fcmpne32	%f12,	%f10,	%o0
loop_752:
	fmovrdgz	%g4,	%f26,	%f16
loop_753:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%i2
	call	loop_754
	call	loop_755
	xnor	%i5,	%o3,	%i3
	wrpr	%o7,	%g2,	%cwp
loop_754:
	bpos	%icc,	loop_756
loop_755:
	call	loop_757
	nop
	setx	0x4CB9F796B6A92E05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x1F712F66B3A6ACF5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f24,	%f6
	call	loop_758
loop_756:
	sra	%o6,	0x16,	%g7
loop_757:
	call	loop_759
	call	loop_760
loop_758:
	call	loop_761
	call	loop_762
loop_759:
	fpsub32s	%f22,	%f24,	%f24
loop_760:
	call	loop_763
loop_761:
	fmovsgu	%xcc,	%f19,	%f29
loop_762:
	bshuffle	%f4,	%f8,	%f22
	fxor	%f2,	%f18,	%f8
loop_763:
	fmovsneg	%icc,	%f22,	%f12
	fblg,a	%fcc1,	loop_764
	fornot2	%f26,	%f12,	%f10
	fsrc1	%f26,	%f8
	wrpr 	%g0, 	0x0, 	%gl
loop_764:
	nop
	fitos	%f2,	%f22
	fstoi	%f22,	%f24
	call	loop_765
	edge32n	%i1,	%l1,	%l4
	call	loop_766
	fmovsne	%xcc,	%f11,	%f1
loop_765:
	call	loop_767
	nop
	setx loop_768, %l0, %l1
	jmpl %l1, %g1
loop_766:
	andn	%o4,	%l2,	%l6
	fpsub32s	%f31,	%f29,	%f26
loop_767:
	fpack16	%f20,	%f17
loop_768:
	fmovdl	%fcc3,	%f22,	%f14
	set	0x78, %i6
	swapa	[%l7 + %i6] 0x0c,	%i4
	movul	%fcc1,	%g5,	%g6
	fcmpes	%fcc0,	%f8,	%f20
	nop
	fitos	%f11,	%f18
	fstoi	%f18,	%f5
	fcmpd	%fcc3,	%f28,	%f8
	fmovscc	%icc,	%f29,	%f2
	movge	%xcc,	0x4DE,	%l3
	fmovdul	%fcc1,	%f24,	%f28
	call	loop_769
	nop
	fitos	%f12,	%f24
	fnors	%f22,	%f15,	%f11
	edge16n	%i7,	%g3,	%i0
loop_769:
	call	loop_770
	sth	%l5,	[%l7 + 0x48]
	fandnot2	%f2,	%f10,	%f26
	movrlz	%i6,	%o1,	%o0
loop_770:
	andn	%g4,	0x1520,	%o2
	call	loop_771
	tvs	%xcc,	0x4
	call	loop_772
	rdhpr	%hintp,	%i2
loop_771:
	edge8l	%o3,	%i5,	%i3
	fcmpd	%fcc3,	%f24,	%f20
loop_772:
	call	loop_773
	call	loop_774
	orncc	%o7,	%o6,	%g2
	andncc	%g7,	0x0723,	%l0
loop_773:
	call	loop_775
loop_774:
	addccc	%o5,	0x094D,	%l1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i1
loop_775:
	call	loop_776
	call	loop_777
	bcc	%xcc,	loop_778
	movule	%fcc1,	%g1,	%o4
loop_776:
	fmovsg	%fcc1,	%f2,	%f2
loop_777:
	call	loop_779
loop_778:
	addc	%l6,	%i4,	%g5
	call	loop_780
	fmuld8sux16	%f28,	%f13,	%f30
loop_779:
	brgez,a,pt	%l2,	loop_781
	call	loop_782
loop_780:
	fmovsvc	%xcc,	%f11,	%f31
	andn	%l3,	0x1B3A,	%g6
loop_781:
	fbug,a,pn	%fcc1,	loop_783
loop_782:
	and	%g3,	%i7,	%i0
	edge8l	%i6,	%o1,	%o0
	call	loop_784
loop_783:
	call	loop_785
	call	loop_786
	call	loop_787
loop_784:
	call	loop_788
loop_785:
	call	loop_789
loop_786:
	bleu,a	%xcc,	loop_790
loop_787:
	rdpr	%tl,	%g4
loop_788:
	movo	%fcc0,	%o2,	%l5
loop_789:
	sllx	%o3,	0x03,	%i2
loop_790:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i3
	fpadd16	%f22,	%f28,	%f12
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%o7
	movg	%fcc1,	0x330,	%o6
	fpsub16	%f0,	%f20,	%f6
	fbge,a	%fcc0,	loop_791
	fmovrse	%g2,	%f6,	%f15
	call	loop_792
	fpack16	%f6,	%f9
loop_791:
	call	loop_793
	movgu	%xcc,	%i5,	%l0
loop_792:
	alignaddr	%o5,	%g7,	%l4
	fmovsgu	%xcc,	%f27,	%f4
loop_793:
	faligndata	%f22,	%f4,	%f14
	fba,pt	%fcc1,	loop_794
	fmovrdlez	%i1,	%f12,	%f6
	call	loop_795
	subc	%g1,	0x0E59,	%l1
loop_794:
	smulcc	%l6,	0x1CAC,	%i4
	for	%f4,	%f28,	%f18
loop_795:
	call	loop_796
	fornot2	%f26,	%f18,	%f28
	bn	%icc,	loop_797
	fmovdl	%icc,	%f8,	%f16
loop_796:
	array32	%o4,	%g5,	%l3
	tsubcc	%l2,	0x0941,	%g6
loop_797:
	fcmpgt16	%f18,	%f24,	%i7
	or	%g3,	%i6,	%o1
	movuge	%fcc3,	0x3C6,	%i0
	movrgez	%o0,	0x0A1,	%g4
	fmovdul	%fcc1,	%f10,	%f30
	fnot2s	%f22,	%f16
	call	loop_798
	call	loop_799
	call	loop_800
	tvs	%xcc,	0x5
loop_798:
	subcc	%l5,	%o3,	%i2
loop_799:
	sethi	0x0790,	%i3
loop_800:
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_801
	tcc	%xcc,	0x3
	for	%f10,	%f10,	%f6
	fnors	%f24,	%f17,	%f13
loop_801:
	bneg,pn	%icc,	loop_802
	call	loop_803
	fabsd	%f8,	%f0
	movg	%fcc1,	0x702,	%o2
loop_802:
	call	loop_804
loop_803:
	and	%g2,	%i5,	%l0
	call	loop_805
	call	loop_806
loop_804:
	st	%f14,	[%l7 + 0x68]
	rdpr	%wstate,	%o5
loop_805:
	call	loop_807
loop_806:
	fmovsneg	%icc,	%f21,	%f16
	call	loop_808
	smul	%g7,	%i1,	%g1
loop_807:
	call	loop_809
	andncc	%l4,	%l6,	%i4
loop_808:
	call	loop_810
	fmovrdlz	%o4,	%f6,	%f0
loop_809:
	nop
	fitos	%f22,	%f31
	fmovdge	%fcc2,	%f12,	%f28
loop_810:
	movrlez	%g5,	%l3,	%l1
	call	loop_811
	fmul8ulx16	%f18,	%f14,	%f18
	call	loop_812
	edge8l	%g6,	%i7,	%l2
loop_811:
	bvc	%xcc,	loop_813
	edge8n	%i6,	%g3,	%i0
loop_812:
	tcs	%icc,	0x4
	fandnot2s	%f22,	%f1,	%f21
loop_813:
	sir	0x0B69
	edge16l	%o1,	%g4,	%l5
	edge32l	%o3,	%o0,	%i2
	bcc,a	%icc,	loop_814
	rdhpr	%htba,	%i3
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f2
	call	loop_815
loop_814:
	fxors	%f1,	%f2,	%f24
	ldd	[%l7 + 0x30],	%o6
	udivx	%o7,	0x00,	%o2
loop_815:
	nop
	setx	0x83493CB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f25
	rdpr	%gl,	%g2
	add	%i5,	0x0771,	%o5
	movge	%fcc0,	%g7,	%i1
	fsrc2	%f22,	%f20
	sll	%g1,	0x16,	%l4
	movge	%icc,	0x0F6,	%l6
	tcc	%xcc,	0x5
	fmovrslz	%i4,	%f8,	%f22
	fmovda	%fcc0,	%f14,	%f10
	fmovdne	%fcc3,	%f22,	%f12
	fmovrsgz	%o4,	%f16,	%f16
	fmovdle	%fcc2,	%f22,	%f30
	array16	%g5,	%l0,	%l3
	fxor	%f12,	%f12,	%f2
	fpackfix	%f24,	%f28
	tpos	%icc,	0x2
	fmovsu	%fcc0,	%f14,	%f1
	fandnot1s	%f15,	%f8,	%f2
	movpos	%xcc,	%g6,	%i7
	rdpr	%gl,	%l1
	nop
	fitos	%f5,	%f25
	fstod	%f25,	%f14
	fmovdvc	%xcc,	%f6,	%f14
	fandnot1	%f6,	%f6,	%f28
	fornot1s	%f9,	%f17,	%f10
	fble	%fcc3,	loop_816
	call	loop_817
	rdhpr	%hpstate,	%i6
	call	loop_818
loop_816:
	movcc	%xcc,	0x640,	%g3
loop_817:
	call	loop_819
	brlz,a,pt	%l2,	loop_820
loop_818:
	nop
	setx	0x312645AE672952FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xF2D3A50CD4D013D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f6,	%f14
	faligndata	%f0,	%f6,	%f22
loop_819:
	edge8ln	%o1,	%g4,	%i0
loop_820:
	nop
	set	0x48, %o4
	flush	%l7 + %o4
	fsrc2s	%f8,	%f20
	call	loop_821
	movrlz	%l5,	%o3,	%o0
	call	loop_822
	nop
	set	0x4C, %i1
	lduh	[%l7 + %i1],	%i2
loop_821:
	fmul8x16au	%f16,	%f0,	%f22
	call	loop_823
loop_822:
	addccc	%i3,	%o7,	%o2
	ldd	[%l7 + 0x60],	%g2
	fbue,pn	%fcc3,	loop_824
loop_823:
	bg,a	%xcc,	loop_825
	fmovsge	%xcc,	%f18,	%f10
	fandnot2s	%f0,	%f6,	%f2
loop_824:
	call	loop_826
loop_825:
	lduw	[%l7 + 0x70],	%i5
	tcc	%icc,	0x5
	call	loop_827
loop_826:
	fmovrslez	%o5,	%f25,	%f4
	nop
	set	0x70, %o0
	ldsw	[%l7 + %o0],	%o6
	sllx	%i1,	0x19,	%g7
loop_827:
	fbg,a	%fcc2,	loop_828
	and	%g1,	0x1032,	%l4
	tne	%xcc,	0x2
	bcc,a,pt	%icc,	loop_829
loop_828:
	move	%icc,	0x367,	%l6
	fmovdue	%fcc1,	%f8,	%f28
	edge16n	%o4,	%g5,	%l0
loop_829:
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f2
	orcc	%l3,	%i4,	%i7
	call	loop_830
	subccc	%l1,	0x1770,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B3, 	%hsys_tick_cmpr
	te	%icc,	0x3
loop_830:
	nop
	set	0x28, %g5
	ldswa	[%l7 + %g5] 0x89,	%l2
	tvs	%icc,	0x5
	te	%icc,	0x3
	fcmpd	%fcc2,	%f10,	%f16
	call	loop_831
	call	loop_832
	call	loop_833
	call	loop_834
loop_831:
	movo	%fcc3,	0x0AF,	%g3
loop_832:
	bvc,a	%icc,	loop_835
loop_833:
	nop
	set	0x3C, %o6
	flush	%l7 + %o6
loop_834:
	fpack32	%f22,	%f12,	%f6
	rdhpr	%hintp,	%g4
loop_835:
	movue	%fcc1,	%i0,	%o1
	addccc	%l5,	%o3,	%o0
	call	loop_836
	fmovsue	%fcc0,	%f20,	%f4
	fmovdleu	%xcc,	%f12,	%f2
	fmovde	%fcc3,	%f20,	%f28
loop_836:
	fmovsuge	%fcc3,	%f23,	%f26
	call	loop_837
	fmuld8ulx16	%f25,	%f1,	%f16
	call	loop_838
	tcs	%icc,	0x4
loop_837:
	movlg	%fcc1,	%i2,	%o7
	call	loop_839
loop_838:
	call	loop_840
	call	loop_841
	fcmpeq32	%f16,	%f8,	%o2
loop_839:
	bshuffle	%f22,	%f26,	%f20
loop_840:
	fmovsne	%fcc1,	%f15,	%f7
loop_841:
	fzeros	%f4
	call	loop_842
	edge16	%g2,	%i3,	%i5
	orn	%o6,	0x007E,	%o5
	fmovsug	%fcc0,	%f30,	%f22
loop_842:
	movleu	%icc,	0x6DD,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l6
	mova	%icc,	0x6E9,	%o4
	movne	%fcc1,	0x1DF,	%g1
	wr	%l0,	%l3,	%softint
	call	loop_843
	fmul8x16	%f4,	%f12,	%f22
	call	loop_844
	call	loop_845
loop_843:
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f19
	call	loop_846
loop_844:
	call	loop_847
loop_845:
	call	loop_848
	edge16l	%i4,	%g5,	%l1
loop_846:
	call	loop_849
loop_847:
	fmovso	%fcc2,	%f18,	%f9
loop_848:
	fpsub16s	%f9,	%f5,	%f25
	add	%i7,	%g6,	%l2
loop_849:
	call	loop_850
	call	loop_851
	edge32ln	%g3,	%g4,	%i0
	flushw
loop_850:
	fmovdleu	%icc,	%f8,	%f14
loop_851:
	nop
	setx	0x1A6C05EB166EC9F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE44C131739A7D43E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f14,	%f8
	brz	%o1,	loop_852
	stbar
	movu	%fcc0,	0x6D6,	%l5
	fsrc1s	%f0,	%f28
loop_852:
	fmovsgu	%icc,	%f14,	%f24
	call	loop_853
	fcmpeq16	%f10,	%f6,	%i6
	fmovdge	%fcc2,	%f22,	%f26
	fzeros	%f29
loop_853:
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%o0
	fmovdug	%fcc2,	%f24,	%f4
	addccc	%i2,	0x1213,	%o7
	srl	%o3,	%o2,	%i3
	bmask	%i5,	%g2,	%o6
	movo	%fcc0,	0x639,	%o5
	fpadd16	%f26,	%f10,	%f26
	wr	%i1,	%l4,	%y
	fpack32	%f14,	%f30,	%f6
	nop
	fitod	%f2,	%f28
	fdtoi	%f28,	%f26
	fmovslg	%fcc2,	%f31,	%f21
	movcs	%xcc,	0x340,	%l6
	sdivx	%g7,	0x00,	%g1
	bne,pt	%icc,	loop_854
	movneg	%icc,	%l0,	%l3
	fornot2s	%f20,	%f6,	%f12
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f22
loop_854:
	movle	%icc,	0x77B,	%i4
	call	loop_855
	wr 	%g0, 	0x4, 	%fprs
	fmovsue	%fcc1,	%f7,	%f25
	ble,a	%xcc,	loop_856
loop_855:
	tn	%xcc,	0x2
	array8	%l1,	%i7,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_856:
	faligndata	%f16,	%f24,	%f28
	fornot2	%f2,	%f16,	%f8
	bvc,a	%icc,	loop_857
	nop
	set	0x48, %g4
	std	%f18,	[%l7 + %g4]
	fmovdle	%fcc3,	%f20,	%f8
	call	loop_858
loop_857:
	call	loop_859
	fabss	%f25,	%f7
	call	loop_860
loop_858:
	call	loop_861
loop_859:
	fmovdgu	%icc,	%f26,	%f22
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%g4
loop_860:
	nop
	set	0x2C, %l2
	ldsh	[%l7 + %l2],	%i0
loop_861:
	taddcctv	%g3,	0x064A,	%o1
	fmovrdlz	%l5,	%f10,	%f18
	sdivx	%i6,	%o0,	%o7
	tpos	%icc,	0x2
	call	loop_862
	call	loop_863
	fmovsvc	%xcc,	%f17,	%f6
	movvc	%xcc,	%o3,	%i2
loop_862:
	fmovdue	%fcc2,	%f20,	%f16
loop_863:
	bcs,pt	%xcc,	loop_864
	fxors	%f5,	%f29,	%f4
	call	loop_865
	fornot1	%f18,	%f4,	%f20
loop_864:
	fmovdgu	%xcc,	%f2,	%f0
	call	loop_866
loop_865:
	call	loop_867
	or	%o2,	0x189B,	%i3
	andn	%i5,	0x190D,	%g2
loop_866:
	movlg	%fcc3,	0x28F,	%o6
loop_867:
	fmovrse	%o5,	%f5,	%f3
	edge16ln	%l4,	%i1,	%l6
	nop
	fitos	%f5,	%f8
	fstoi	%f8,	%f24
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x11,	%f0
	call	loop_868
	andncc	%g1,	0x1F82,	%l0
	fpsub16s	%f28,	%f16,	%f22
	sub	%l3,	0x1EBF,	%g7
loop_868:
	call	loop_869
	std	%f22,	[%l7 + 0x58]
	nop
	setx	0x515EEC05,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fmovdcc	%icc,	%f24,	%f6
loop_869:
	wrpr	%i4,	%l1,	%cwp
	call	loop_870
	call	loop_871
	nop
	setx	0x41B85C355CEAA444,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5EB7330927F46CED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f16,	%f4
	call	loop_872
loop_870:
	rdhpr	%hsys_tick_cmpr,	%i7
loop_871:
	movrlez	%o4,	%g5,	%g6
	nop
	setx	0xDBC0049D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x2D9CE88B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f7,	%f10
loop_872:
	nop
	setx	loop_873,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034200001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack32	%f0,	%f22,	%f16
	nop
	set	0x50, %o7
	ldsw	[%l7 + %o7],	%l2
	fnands	%f30,	%f6,	%f31
loop_873:
	tneg	%xcc,	0x5
	call	loop_874
	fmovso	%fcc3,	%f15,	%f18
	call	loop_875
	call	loop_876
loop_874:
	rdhpr	%hsys_tick_cmpr,	%i0
	sub	%g3,	%g4,	%l5
loop_875:
	call	loop_877
loop_876:
	fnand	%f20,	%f22,	%f0
	fmovsvs	%xcc,	%f23,	%f6
	addccc	%i6,	%o0,	%o1
loop_877:
	call	loop_878
	fnegd	%f16,	%f28
	fmovrslz	%o7,	%f30,	%f0
	rdpr	%wstate,	%o3
loop_878:
	movg	%xcc,	0x348,	%i2
	fmul8sux16	%f12,	%f0,	%f30
	movneg	%icc,	0x502,	%o2
	array32	%i5,	%i3,	%o6
	wr	%g0,	0x0c,	%asi
	sta	%f18,	[%l7 + 0x60] %asi
	call	loop_879
	tge	%icc,	0x6
	call	loop_880
	nop
	setx	0x3EE13701,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f11
loop_879:
	fmovdleu	%icc,	%f24,	%f6
	fxors	%f30,	%f9,	%f11
loop_880:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x14] %asi,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x17B, 	%hsys_tick_cmpr
	tge	%icc,	0x4
	call	loop_881
	call	loop_882
	fmuld8sux16	%f14,	%f26,	%f0
	rd	%asi,	%i1
loop_881:
	call	loop_883
loop_882:
	taddcctv	%l4,	%l6,	%g1
	call	loop_884
	fpack32	%f16,	%f6,	%f22
loop_883:
	call	loop_885
	fmovs	%f27,	%f28
loop_884:
	tneg	%icc,	0x6
	fmovsgu	%icc,	%f11,	%f31
loop_885:
	bpos,a,pt	%icc,	loop_886
	edge8ln	%l0,	%g7,	%l3
	nop
	set	0x6A, %i2
	lduh	[%l7 + %i2],	%i4
	movne	%icc,	%l1,	%i7
loop_886:
	movug	%fcc0,	0x1E8,	%o4
	srl	%g6,	%g5,	%i0
	nop
	set	0x70, %o3
	std	%f4,	[%l7 + %o3]
	edge8ln	%l2,	%g3,	%g4
	fcmpeq16	%f28,	%f24,	%l5
	movul	%fcc1,	0x779,	%o0
	fmovsge	%fcc1,	%f4,	%f28
	fpsub16	%f8,	%f10,	%f2
	popc	0x0DDA,	%i6
	fpsub32s	%f16,	%f16,	%f10
	nop
	setx	0xF52A9D40,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f22
	fone	%f2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rdpr	%wstate,	%o1
	nop
	fitod	%f0,	%f26
	fnand	%f16,	%f8,	%f2
	tpos	%xcc,	0x3
	movuge	%fcc3,	%o3,	%i2
	call	loop_887
loop_887:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 28
!	Type a   	: 26
!	Type x   	: 10
!	Type cti   	: 145
!	Type f   	: 160
!	Type i   	: 131
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
	set	0x6,	%g1
	set	0x6,	%g2
	set	0x2,	%g3
	set	0x1,	%g4
	set	0xE,	%g5
	set	0x9,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xF,	%i1
	set	-0xB,	%i2
	set	-0x2,	%i3
	set	-0x1,	%i4
	set	-0x9,	%i5
	set	-0xA,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x56549E39,	%l0
	set	0x0FA407BB,	%l1
	set	0x5BA1B849,	%l2
	set	0x1DBA7D3B,	%l3
	set	0x7ABAA14C,	%l4
	set	0x49E72BA5,	%l5
	set	0x57A2FF18,	%l6
	!# Output registers
	set	0x0898,	%o0
	set	-0x0676,	%o1
	set	-0x123C,	%o2
	set	-0x0242,	%o3
	set	0x0349,	%o4
	set	0x1E05,	%o5
	set	-0x00DC,	%o6
	set	-0x0411,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	fnegs	%f10,	%f6
	fcmped	%fcc0,	%f24,	%f24
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	te	%xcc,	0x7
	call	loop_888
	call	loop_889
	call	loop_890
	mova	%icc,	0x36B,	%o2
loop_888:
	call	loop_891
loop_889:
	fmovse	%fcc3,	%f15,	%f21
loop_890:
	mova	%icc,	%o7,	%i5
	rd	%softint,	%o6
loop_891:
	fnand	%f18,	%f10,	%f0
	subc	%o5,	0x1CC8,	%i3
	nop
	fitod	%f4,	%f30
	fdtox	%f30,	%f12
	movu	%fcc1,	0x7F9,	%i1
	call	loop_892
	call	loop_893
	tge	%icc,	0x4
	call	loop_894
loop_892:
	movneg	%xcc,	%g2,	%l4
loop_893:
	call	loop_895
	ta	%xcc,	0x1
loop_894:
	te	%xcc,	0x5
	fmovrdne	%g1,	%f22,	%f22
loop_895:
	movlg	%fcc2,	0x2AD,	%l6
	fmovrsne	%l0,	%f19,	%f9
	movvc	%icc,	0x48E,	%l3
	movg	%fcc3,	%g7,	%i4
	nop
	setx	0xD5373091,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xE9CB8BFB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f3,	%f19
	call	loop_896
	fmovscc	%icc,	%f13,	%f1
	fmovduge	%fcc2,	%f26,	%f6
	fbul,a	%fcc2,	loop_897
loop_896:
	fmovdvs	%icc,	%f28,	%f24
	call	loop_898
	stbar
loop_897:
	sir	0x14AC
	nop
	setx	0x1EFB2F50975014E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF7375A3D1A63D52F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f12,	%f24
loop_898:
	nop
	setx	0x49DB3CBA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f4
	edge16ln	%l1,	%i7,	%o4
	call	loop_899
	movuge	%fcc2,	%g5,	%i0
	call	loop_900
	rdhpr	%hsys_tick_cmpr,	%l2
loop_899:
	rd	%pc,	%g3
	fmovda	%icc,	%f4,	%f14
loop_900:
	fmovrdne	%g6,	%f0,	%f18
	alignaddrl	%l5,	%g4,	%i6
	call	loop_901
	call	loop_902
	rdhpr	%hsys_tick_cmpr,	%o1
	call	loop_903
loop_901:
	subcc	%o3,	%o0,	%i2
loop_902:
	bmask	%o2,	%i5,	%o7
	fmovrse	%o5,	%f29,	%f11
loop_903:
	fnegd	%f20,	%f6
	call	loop_904
	nop
	setx	0x37C8A513,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xDEE98C35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f25,	%f29
	rdhpr	%hintp,	%o6
	call	loop_905
loop_904:
	movneg	%xcc,	%i3,	%g2
	brgz,pt	%i1,	loop_906
	fmovrsne	%l4,	%f8,	%f13
loop_905:
	movle	%fcc1,	%g1,	%l6
	fxnors	%f16,	%f23,	%f0
loop_906:
	nop
	fitos	%f12,	%f17
	fstod	%f17,	%f24
	bvc	%xcc,	loop_907
	fbul,a,pt	%fcc1,	loop_908
	tleu	%icc,	0x4
	fnot2s	%f7,	%f14
loop_907:
	call	loop_909
loop_908:
	edge8ln	%l3,	%l0,	%i4
	call	loop_910
	nop
	set	0x26, %g1
	ldsh	[%l7 + %g1],	%g7
loop_909:
	fsrc1s	%f10,	%f24
	fbge	%fcc1,	loop_911
loop_910:
	nop
	fitos	%f23,	%f7
	add	%i7,	%o4,	%l1
	call	loop_912
loop_911:
	xorcc	%i0,	%l2,	%g3
	fxnors	%f17,	%f0,	%f17
	call	loop_913
loop_912:
	srl	%g5,	%l5,	%g6
	nop
	setx	0x1C0FF960,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x2F5D28CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f28,	%f17
	call	loop_914
loop_913:
	fnegs	%f25,	%f12
	fsrc1s	%f29,	%f13
	movle	%fcc0,	%i6,	%g4
loop_914:
	call	loop_915
	edge16n	%o1,	%o3,	%o0
	bpos,pn	%xcc,	loop_916
	srlx	%o2,	0x1A,	%i5
loop_915:
	movcs	%xcc,	%i2,	%o7
	fpack32	%f24,	%f12,	%f2
loop_916:
	fmovsue	%fcc0,	%f28,	%f15
	fmovdneg	%xcc,	%f22,	%f0
	call	loop_917
	movu	%fcc3,	0x41C,	%o5
	call	loop_918
	srl	%o6,	0x15,	%i3
loop_917:
	call	loop_919
	edge8	%i1,	%l4,	%g1
loop_918:
	for	%f8,	%f30,	%f22
	call	loop_920
loop_919:
	fnot2s	%f8,	%f13
	rd	%sys_tick_cmpr,	%g2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2
loop_920:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C0, 	%hsys_tick_cmpr
	call	loop_921
	fmovsul	%fcc0,	%f6,	%f6
	nop
	setx	0xB96BC7FFD55C8342,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x17F9A72B49CB06BF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f30,	%f28
	call	loop_922
loop_921:
	call	loop_923
	call	loop_924
	nop
	fitos	%f2,	%f3
	fstox	%f3,	%f18
	fxtos	%f18,	%f14
loop_922:
	fabss	%f12,	%f15
loop_923:
	fandnot2s	%f1,	%f19,	%f17
loop_924:
	movue	%fcc3,	0x4AC,	%i4
	fmovrsne	%i7,	%f11,	%f15
	fmovdue	%fcc0,	%f4,	%f28
	call	loop_925
	fmovspos	%xcc,	%f0,	%f29
	fmul8x16	%f18,	%f6,	%f24
	fnegd	%f14,	%f8
loop_925:
	call	loop_926
	fmovdgu	%icc,	%f20,	%f16
	call	loop_927
	call	loop_928
loop_926:
	edge32ln	%o4,	%l1,	%i0
	call	loop_929
loop_927:
	nop
	fitos	%f5,	%f14
	fstoi	%f14,	%f1
loop_928:
	fbne,a,pt	%fcc2,	loop_930
	call	loop_931
loop_929:
	fmovdlg	%fcc2,	%f22,	%f18
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_930:
	call	loop_932
loop_931:
	te	%xcc,	0x3
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%g6
	movo	%fcc2,	%g3,	%l2
loop_932:
	rd	%ccr,	%g5
	call	loop_933
	fsrc2s	%f13,	%f9
	bshuffle	%f28,	%f10,	%f26
	edge8n	%l5,	%g6,	%g4
loop_933:
	fmovdle	%icc,	%f10,	%f26
	call	loop_934
	sll	%o1,	0x1C,	%i6
	nop
	fitos	%f4,	%f12
	fstoi	%f12,	%f11
	fmovdule	%fcc1,	%f2,	%f14
loop_934:
	tleu	%xcc,	0x0
	fcmpes	%fcc3,	%f12,	%f2
	call	loop_935
	tpos	%xcc,	0x6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%o3
loop_935:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%i2,	0x1C9B,	%o2
	brnz,pn	%o7,	loop_936
	flushw
	fmul8x16	%f24,	%f30,	%f8
	nop
	setx	0x9893D228,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xF38256DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f22,	%f23
loop_936:
	tg	%xcc,	0x4
	nop
	set	0x72, %o5
	stb	%o5,	[%l7 + %o5]
	rdpr	%wstate,	%i3
	fmovdgu	%icc,	%f0,	%f22
	movl	%icc,	0x06F,	%o6
	nop
	fitos	%f31,	%f11
	movule	%fcc3,	%i1,	%g1
	edge32	%l4,	%g2,	%l6
	call	loop_937
	nop
	setx	loop_938,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004100001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%l0,	%l3,	%i4
	set	0x5C, %i4
	ldsha	[%l7 + %i4] 0x04,	%o4
loop_937:
	fmovdg	%xcc,	%f8,	%f4
loop_938:
	fandnot1s	%f24,	%f13,	%f14
	rd	%softint,	%i7
	brgez,a,pn	%l1,	loop_939
	fmovsleu	%icc,	%f3,	%f26
	nop
	set	0x38, %g2
	stx	%i0,	[%l7 + %g2]
	call	loop_940
loop_939:
	nop
	setx	0xAC637BF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x702536DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f12,	%f12
	call	loop_941
	movne	%xcc,	%g3,	%l2
loop_940:
	fmuld8sux16	%f30,	%f0,	%f4
	fbue	%fcc1,	loop_942
loop_941:
	fmovs	%f19,	%f7
	movrne	%g7,	%l5,	%g5
	rd	%tick_cmpr,	%g6
loop_942:
	fcmpgt32	%f24,	%f24,	%o1
	call	loop_943
	call	loop_944
	movne	%fcc1,	0x4E0,	%i6
	tn	%xcc,	0x3
loop_943:
	fsrc2s	%f0,	%f23
loop_944:
	call	loop_945
	edge8	%g4,	%o0,	%o3
	call	loop_946
	sra	%i2,	0x08,	%o2
loop_945:
	call	loop_947
	fmovdn	%fcc3,	%f24,	%f22
loop_946:
	ldd	[%l7 + 0x20],	%o6
	call	loop_948
loop_947:
	call	loop_949
	fmovdvc	%icc,	%f22,	%f0
	call	loop_950
loop_948:
	call	loop_951
loop_949:
	andcc	%i5,	%o5,	%o6
	fmovrdgez	%i3,	%f24,	%f12
loop_950:
	movl	%icc,	0x1EE,	%g1
loop_951:
	siam	0x5
	rd	%ccr,	%i1
	fnot1	%f8,	%f16
	fands	%f16,	%f2,	%f12
	ld	[%l7 + 0x44],	%f19
	nop
	setx	0x2A1B4D3ABF3F4884,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x15675BA6F737F765,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f16,	%f10
	edge16l	%l4,	%g2,	%l0
	call	loop_952
	fmovdule	%fcc2,	%f0,	%f22
	call	loop_953
	fmovs	%f22,	%f22
loop_952:
	fpmerge	%f26,	%f1,	%f14
	call	loop_954
loop_953:
	fsrc1s	%f22,	%f6
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f21
	andncc	%l3,	%l6,	%o4
loop_954:
	fmovdul	%fcc2,	%f2,	%f4
	nop
	fitos	%f14,	%f21
	fstox	%f21,	%f18
	fxtos	%f18,	%f22
	rdpr	%tba,	%i4
	movrlez	%l1,	%i0,	%i7
	call	loop_955
	bmask	%g3,	%g7,	%l2
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x6A] %asi,	%l5
loop_955:
	fmovsul	%fcc1,	%f7,	%f2
	mulscc	%g6,	0x11FF,	%g5
	fmul8x16	%f26,	%f6,	%f14
	fmovs	%f22,	%f25
	call	loop_956
	orcc	%i6,	%o1,	%g4
	call	loop_957
	movneg	%xcc,	0x120,	%o0
loop_956:
	movre	%o3,	%i2,	%o2
	fxnor	%f2,	%f16,	%f24
loop_957:
	ldsh	[%l7 + 0x2E],	%i5
	fmovsge	%xcc,	%f9,	%f22
	mulx	%o7,	%o6,	%o5
	call	loop_958
	rdhpr	%hintp,	%i3
	nop
	setx	0xEDDAE31C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x67630BE4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f17,	%f4
	taddcc	%i1,	0x145D,	%g1
loop_958:
	call	loop_959
	call	loop_960
	call	loop_961
	rdpr	%gl,	%g2
loop_959:
	call	loop_962
loop_960:
	tneg	%xcc,	0x5
loop_961:
	fmovscs	%xcc,	%f2,	%f29
	movu	%fcc1,	0x701,	%l4
loop_962:
	call	loop_963
	call	loop_964
	call	loop_965
	fmovsl	%icc,	%f22,	%f4
loop_963:
	call	loop_966
loop_964:
	popc	%l3,	%l0
loop_965:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAF7, 	%hsys_tick_cmpr
	movl	%fcc1,	%i4,	%l1
loop_966:
	movrgz	%i7,	%g3,	%i0
	call	loop_967
	fmovrdlez	%g7,	%f24,	%f12
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f28
	fpadd16s	%f16,	%f28,	%f30
loop_967:
	fmovsvc	%xcc,	%f31,	%f27
	call	loop_968
	call	loop_969
	brgez,pt	%l5,	loop_970
	fmovdpos	%icc,	%f18,	%f2
loop_968:
	xnorcc	%l2,	0x0054,	%g5
loop_969:
	fnot2	%f14,	%f4
loop_970:
	movrne	%g6,	0x0C4,	%i6
	call	loop_971
	fnegs	%f24,	%f24
	call	loop_972
	fmovdug	%fcc3,	%f10,	%f24
loop_971:
	bmask	%g4,	%o0,	%o3
	tcs	%icc,	0x2
loop_972:
	fbn,a,pn	%fcc2,	loop_973
	call	loop_974
	edge32n	%o1,	%i2,	%i5
	call	loop_975
loop_973:
	call	loop_976
loop_974:
	andcc	%o2,	%o6,	%o7
	taddcctv	%o5,	%i1,	%g1
loop_975:
	fnegs	%f31,	%f24
loop_976:
	orn	%i3,	%l4,	%g2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpadd32	%f12,	%f30,	%f6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_977
	wr	%l0,	%l6,	%sys_tick
	fmovrslz	%o4,	%f9,	%f27
	tge	%xcc,	0x3
loop_977:
	fpadd16s	%f28,	%f8,	%f7
	rd	%pc,	%l3
	call	loop_978
	bcs,a,pn	%icc,	loop_979
	fmovdle	%fcc2,	%f24,	%f0
	fornot2	%f20,	%f4,	%f18
loop_978:
	prefetch	[%l7 + 0x68],	 3
loop_979:
	taddcc	%i4,	%l1,	%i7
	andcc	%g3,	%g7,	%i0
	sdivx	%l5,	0x00,	%l2
	call	loop_980
	fnegs	%f13,	%f15
	wrpr	%g5,	0x0E42,	%pil
	fmovscc	%icc,	%f19,	%f27
loop_980:
	call	loop_981
	call	loop_982
	call	loop_983
	lduw	[%l7 + 0x48],	%g6
loop_981:
	call	loop_984
loop_982:
	fmovdug	%fcc1,	%f20,	%f16
loop_983:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x71] %asi,	%i6
loop_984:
	fsrc2	%f18,	%f14
	call	loop_985
	rdpr	%wstate,	%g4
	fmovdue	%fcc0,	%f28,	%f18
	nop
	fitos	%f1,	%f15
	fstod	%f15,	%f14
loop_985:
	nop
	setx	0x517B9E66,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f1
	fpack16	%f20,	%f2
	fmovrse	%o0,	%f26,	%f8
	fpack16	%f0,	%f10
	fmovrsgz	%o1,	%f17,	%f24
	sethi	0x0907,	%o3
	fmul8x16al	%f7,	%f15,	%f14
	call	loop_986
	fands	%f14,	%f31,	%f13
	fmovdu	%fcc2,	%f24,	%f6
	nop
	fitos	%f11,	%f11
	fstox	%f11,	%f18
	fxtos	%f18,	%f19
loop_986:
	ble,a,pn	%icc,	loop_987
	call	loop_988
	call	loop_989
	edge16	%i2,	%i5,	%o6
loop_987:
	fbul,pn	%fcc1,	loop_990
loop_988:
	fmovda	%icc,	%f8,	%f18
loop_989:
	call	loop_991
	call	loop_992
loop_990:
	fble,a,pn	%fcc0,	loop_993
	call	loop_994
loop_991:
	nop
	fitod	%f6,	%f30
loop_992:
	fxnor	%f8,	%f18,	%f8
loop_993:
	fors	%f17,	%f13,	%f30
loop_994:
	tgu	%xcc,	0x4
	call	loop_995
	call	loop_996
	mulscc	%o7,	%o2,	%i1
	nop
	setx	0xA43E267B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xD2576DA5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f30,	%f11
loop_995:
	movrlz	%o5,	%i3,	%g1
loop_996:
	bpos,a	%xcc,	loop_997
	call	loop_998
	call	loop_999
	call	loop_1000
loop_997:
	fandnot2	%f30,	%f14,	%f0
loop_998:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_999:
	call	loop_1001
loop_1000:
	fsrc2s	%f20,	%f24
	fxnors	%f16,	%f5,	%f13
	call	loop_1002
loop_1001:
	taddcc	%l4,	0x0FEA,	%l0
	fmovsne	%fcc0,	%f18,	%f23
	fmovsg	%icc,	%f14,	%f20
loop_1002:
	movul	%fcc3,	%g2,	%l6
	brgz,a	%o4,	loop_1003
	call	loop_1004
	tne	%icc,	0x3
	movre	%l3,	%i4,	%l1
loop_1003:
	fxor	%f28,	%f4,	%f22
loop_1004:
	fmovsug	%fcc3,	%f20,	%f2
	fmovsug	%fcc0,	%f25,	%f15
	call	loop_1005
	mulx	%i7,	0x0E68,	%g7
	sdivx	%i0,	%l5,	%l2
	movrne	%g5,	0x0EF,	%g3
loop_1005:
	fnegd	%f6,	%f24
	call	loop_1006
	wr	%g6,	0x1DBD,	%ccr
	call	loop_1007
	call	loop_1008
loop_1006:
	movvs	%icc,	0x4C1,	%g4
	call	loop_1009
loop_1007:
	srax	%i6,	%o0,	%o1
loop_1008:
	fbo,a,pt	%fcc1,	loop_1010
	call	loop_1011
loop_1009:
	call	loop_1012
	call	loop_1013
loop_1010:
	fmovrdlez	%o3,	%f4,	%f26
loop_1011:
	call	loop_1014
loop_1012:
	fpsub32	%f20,	%f30,	%f6
loop_1013:
	fnor	%f28,	%f24,	%f12
	fornot1	%f12,	%f20,	%f6
loop_1014:
	call	loop_1015
	taddcctv	%i2,	0x04DD,	%i5
	fmovdul	%fcc1,	%f4,	%f12
	fmovscs	%icc,	%f23,	%f15
loop_1015:
	fba,a,pn	%fcc3,	loop_1016
	call	loop_1017
	fcmpgt16	%f18,	%f26,	%o7
	fmuld8ulx16	%f29,	%f21,	%f4
loop_1016:
	fmovscs	%icc,	%f24,	%f25
loop_1017:
	srlx	%o2,	0x19,	%o6
	edge32l	%i1,	%o5,	%g1
	fcmpgt32	%f2,	%f12,	%l4
	fmul8ulx16	%f28,	%f10,	%f8
	fornot2s	%f28,	%f18,	%f30
	ta	%xcc,	0x7
	bmask	%i3,	%l0,	%g2
	brz,a,pn	%l6,	loop_1018
	tn	%xcc,	0x1
	movrlz	%l3,	0x2A6,	%i4
	edge16n	%l1,	%i7,	%g7
loop_1018:
	fandnot2	%f28,	%f2,	%f2
	stw	%i0,	[%l7 + 0x0C]
	fpsub16	%f10,	%f26,	%f0
	nop
	set	0x30, %l0
	std	%l4,	[%l7 + %l0]
	call	loop_1019
	fornot1s	%f25,	%f4,	%f2
	fnors	%f5,	%f23,	%f9
	edge8l	%o4,	%l2,	%g5
loop_1019:
	call	loop_1020
	brz,a,pn	%g6,	loop_1021
	tpos	%xcc,	0x1
	call	loop_1022
loop_1020:
	call	loop_1023
loop_1021:
	nop
	set	0x51, %l6
	ldstub	[%l7 + %l6],	%g3
	wrpr 	%g0, 	0x2, 	%gl
loop_1022:
	fmovdul	%fcc3,	%f24,	%f20
loop_1023:
	fbo,a	%fcc2,	loop_1024
	call	loop_1025
	call	loop_1026
	call	loop_1027
loop_1024:
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f2
loop_1025:
	call	loop_1028
loop_1026:
	fzeros	%f16
loop_1027:
	fabsd	%f10,	%f18
	call	loop_1029
loop_1028:
	rdhpr	%htba,	%g4
	fabss	%f21,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F5, 	%hsys_tick_cmpr
loop_1029:
	call	loop_1030
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f22
	fblg	%fcc0,	loop_1031
	nop
	set	0x20, %g7
	std	%o0,	[%l7 + %g7]
loop_1030:
	fands	%f16,	%f25,	%f2
	sdivx	%o3,	0x00,	%i2
loop_1031:
	call	loop_1032
	call	loop_1033
	call	loop_1034
	xnor	%o7,	%o2,	%o6
loop_1032:
	call	loop_1035
loop_1033:
	taddcctv	%i1,	0x05AD,	%o5
loop_1034:
	movcc	%icc,	0x36C,	%g1
	orn	%i5,	0x1957,	%i3
loop_1035:
	addc	%l0,	0x1C97,	%l4
	brlz	%g2,	loop_1036
	movlg	%fcc3,	0x778,	%l6
	call	loop_1037
	ldstub	[%l7 + 0x25],	%l3
loop_1036:
	call	loop_1038
	movcs	%icc,	%i4,	%l1
loop_1037:
	fmul8ulx16	%f0,	%f30,	%f0
	fmovdg	%fcc3,	%f10,	%f28
loop_1038:
	tcs	%xcc,	0x0
	fnot1s	%f24,	%f27
	call	loop_1039
	sdiv	%i7,	0x00,	%g7
	fmovrsgez	%l5,	%f8,	%f4
	fmovrsne	%i0,	%f25,	%f5
loop_1039:
	wrpr	%l2,	%g5,	%pil
	fmovdgu	%xcc,	%f28,	%f16
	call	loop_1040
	faligndata	%f4,	%f10,	%f24
	call	loop_1041
	nop
	setx	0xB1817928,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x7BE09B20,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f2,	%f19
loop_1040:
	tpos	%xcc,	0x6
	popc	%g6,	%g3
loop_1041:
	fpadd16s	%f31,	%f5,	%f22
	fmovsug	%fcc3,	%f14,	%f21
	fmovdn	%fcc3,	%f6,	%f10
	call	loop_1042
	movrgz	%o4,	0x039,	%i6
	edge16ln	%o0,	%g4,	%o1
	movgu	%icc,	%o3,	%i2
loop_1042:
	fandnot2s	%f5,	%f18,	%f19
	fabss	%f27,	%f13
	fmovdneg	%xcc,	%f14,	%f28
	fpack32	%f18,	%f20,	%f4
	edge32l	%o7,	%o6,	%i1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 20
!	Type a   	: 26
!	Type x   	: 5
!	Type cti   	: 155
!	Type f   	: 167
!	Type i   	: 127
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
	set	0x1,	%g2
	set	0x2,	%g3
	set	0x7,	%g4
	set	0xB,	%g5
	set	0x3,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xE,	%i1
	set	-0x7,	%i2
	set	-0x4,	%i3
	set	-0x4,	%i4
	set	-0x0,	%i5
	set	-0x5,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x317AABE5,	%l0
	set	0x7A208FD9,	%l1
	set	0x529818D0,	%l2
	set	0x26821F1B,	%l3
	set	0x145818B0,	%l4
	set	0x3613D4D9,	%l5
	set	0x20CA509B,	%l6
	!# Output registers
	set	-0x138A,	%o0
	set	-0x15DA,	%o1
	set	0x08B9,	%o2
	set	-0x0974,	%o3
	set	-0x1E63,	%o4
	set	0x07D8,	%o5
	set	-0x097F,	%o6
	set	-0x047C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x073845C4797F1257)
	INIT_TH_FP_REG(%l7,%f2,0x7E6C25FC799338B2)
	INIT_TH_FP_REG(%l7,%f4,0x2B2060A2101FCE47)
	INIT_TH_FP_REG(%l7,%f6,0x31BCD323CAD83734)
	INIT_TH_FP_REG(%l7,%f8,0x6F4B6E7D7B97B8CD)
	INIT_TH_FP_REG(%l7,%f10,0x49ECD2BDA3BE01A0)
	INIT_TH_FP_REG(%l7,%f12,0x42A4A01257ED7272)
	INIT_TH_FP_REG(%l7,%f14,0x063AD53F1C9F7F17)
	INIT_TH_FP_REG(%l7,%f16,0xD25F8D9B093193F0)
	INIT_TH_FP_REG(%l7,%f18,0x679BF347BA2825F3)
	INIT_TH_FP_REG(%l7,%f20,0xC7B4CB8A2304AD39)
	INIT_TH_FP_REG(%l7,%f22,0x7D600AD73F3101BA)
	INIT_TH_FP_REG(%l7,%f24,0x6A9C6F9CBE58D3ED)
	INIT_TH_FP_REG(%l7,%f26,0xACD4CA22DF2094B5)
	INIT_TH_FP_REG(%l7,%f28,0x65CDB02D991993C2)
	INIT_TH_FP_REG(%l7,%f30,0x2DF8ADDFA2311BD7)

	!# Execute Main Diag ..

	membar	0x32
	call	loop_1043
	bleu,a,pn	%icc,	loop_1044
	fmovd	%f20,	%f6
	sethi	0x0710,	%o5
loop_1043:
	movu	%fcc2,	%o2,	%i5
loop_1044:
	bvc	%xcc,	loop_1045
	sir	0x0AF9
	fmovs	%f29,	%f10
	nop
	fitos	%f24,	%f4
loop_1045:
	call	loop_1046
	fmovduge	%fcc3,	%f24,	%f8
	call	loop_1047
	ta	%xcc,	0x5
loop_1046:
	tcc	%icc,	0x7
	call	loop_1048
loop_1047:
	movrlez	%g1,	%l0,	%l4
	rdpr	%canrestore,	%g2
	siam	0x6
loop_1048:
	flush	%l7 + 0x30
	fornot1s	%f2,	%f24,	%f7
	fabsd	%f16,	%f6
	fbule,a,pn	%fcc2,	loop_1049
	call	loop_1050
	call	loop_1051
	movrlez	%i3,	0x10C,	%l6
loop_1049:
	fand	%f6,	%f6,	%f22
loop_1050:
	movg	%fcc3,	%i4,	%l3
loop_1051:
	fpadd16s	%f3,	%f12,	%f13
	call	loop_1052
	fcmped	%fcc3,	%f2,	%f26
	movg	%fcc1,	0x35C,	%i7
	sir	0x083B
loop_1052:
	fzeros	%f11
	movgu	%xcc,	%g7,	%l5
	call	loop_1053
	or	%l1,	0x0470,	%l2
	rdpr	%otherwin,	%i0
	call	loop_1054
loop_1053:
	fxnors	%f25,	%f18,	%f1
	call	loop_1055
	movre	%g5,	%g6,	%g3
loop_1054:
	fmovrse	%o4,	%f3,	%f28
	brz,a	%i6,	loop_1056
loop_1055:
	brlz,pt	%o0,	loop_1057
	fsrc1	%f0,	%f22
	edge8l	%g4,	%o1,	%o3
loop_1056:
	call	loop_1058
loop_1057:
	fmovdl	%xcc,	%f0,	%f26
	fmovsleu	%icc,	%f1,	%f0
	array8	%o7,	%i2,	%i1
loop_1058:
	srax	%o6,	%o5,	%i5
	fandnot1s	%f5,	%f2,	%f31
	fmovrdlz	%g1,	%f10,	%f16
	fmovrsgez	%o2,	%f8,	%f29
	fmovrdne	%l4,	%f14,	%f24
	call	loop_1059
	addc	%g2,	%i3,	%l6
	call	loop_1060
	call	loop_1061
loop_1059:
	call	loop_1062
	movneg	%icc,	%l0,	%i4
loop_1060:
	call	loop_1063
loop_1061:
	fpsub32	%f14,	%f18,	%f22
loop_1062:
	fsrc1	%f2,	%f4
	call	loop_1064
loop_1063:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsn	%fcc2,	%f2,	%f1
	rd	%asi,	%l3
loop_1064:
	fmovsgu	%icc,	%f4,	%f29
	fabsd	%f28,	%f28
	set	0x50, %i0
	stwa	%g7,	[%l7 + %i0] 0x2a
	membar	#Sync
	fmovrdne	%l5,	%f0,	%f18
	call	loop_1065
	fnors	%f15,	%f5,	%f26
	call	loop_1066
	xnorcc	%l1,	0x1188,	%i7
loop_1065:
	fone	%f4
	fmovse	%fcc2,	%f14,	%f10
loop_1066:
	smulcc	%i0,	%l2,	%g5
	bvc,a	%xcc,	loop_1067
	mulx	%g6,	%o4,	%i6
	nop
	fitod	%f6,	%f14
	fdtoi	%f14,	%f18
	fxnors	%f17,	%f9,	%f6
loop_1067:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fxnor	%f16,	%f8,	%f14
	movo	%fcc2,	0x714,	%o0
	fmovrdgez	%g4,	%f16,	%f0
	call	loop_1068
	rdhpr	%hintp,	%o1
	call	loop_1069
	fmovdg	%fcc1,	%f16,	%f2
loop_1068:
	srax	%o3,	%o7,	%i1
	fabsd	%f28,	%f16
loop_1069:
	call	loop_1070
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%i2
	call	loop_1071
	movvc	%icc,	%o5,	%o6
loop_1070:
	fmovdue	%fcc2,	%f8,	%f26
	fpackfix	%f26,	%f10
loop_1071:
	fcmpeq32	%f18,	%f28,	%g1
	call	loop_1072
	fmovrdne	%i5,	%f26,	%f6
	fnands	%f15,	%f2,	%f14
	movre	%o2,	%g2,	%i3
loop_1072:
	ldstub	[%l7 + 0x62],	%l6
	array8	%l4,	%l0,	%i4
	call	loop_1073
	edge16	%l3,	%g7,	%l5
	fbe,a	%fcc0,	loop_1074
	tsubcctv	%i7,	0x0E3E,	%i0
loop_1073:
	fpack16	%f0,	%f12
	movleu	%icc,	0x1D9,	%l1
loop_1074:
	call	loop_1075
	fzero	%f14
	movvs	%icc,	%g5,	%g6
	addccc	%o4,	%i6,	%g3
loop_1075:
	call	loop_1076
	fbuge,pn	%fcc0,	loop_1077
	tleu	%xcc,	0x0
	edge8l	%o0,	%l2,	%o1
loop_1076:
	andncc	%o3,	%o7,	%g4
loop_1077:
	umul	%i2,	0x12A7,	%i1
	call	loop_1078
	tpos	%xcc,	0x4
	fones	%f18
	fpadd32s	%f7,	%f23,	%f21
loop_1078:
	fbe,pt	%fcc2,	loop_1079
	fbuge,pt	%fcc3,	loop_1080
	call	loop_1081
	call	loop_1082
loop_1079:
	fbue,a	%fcc2,	loop_1083
loop_1080:
	xnor	%o6,	0x1885,	%g1
loop_1081:
	fone	%f28
loop_1082:
	call	loop_1084
loop_1083:
	array16	%i5,	%o2,	%o5
	addccc	%i3,	%g2,	%l6
	rdhpr	%htba,	%l0
loop_1084:
	siam	0x1
	call	loop_1085
	fcmped	%fcc3,	%f2,	%f26
	fand	%f0,	%f10,	%f14
	bcc	%icc,	loop_1086
loop_1085:
	brnz	%l4,	loop_1087
	nop
	setx	0xE3F9A309,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xF04B6AC9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f27,	%f0
	call	loop_1088
loop_1086:
	fcmpes	%fcc0,	%f23,	%f29
loop_1087:
	call	loop_1089
	st	%f12,	[%l7 + 0x78]
loop_1088:
	call	loop_1090
	edge16	%i4,	%g7,	%l5
loop_1089:
	fmovdul	%fcc3,	%f4,	%f12
	movrgz	%i7,	%i0,	%l3
loop_1090:
	call	loop_1091
	subc	%g5,	%l1,	%g6
	tge	%xcc,	0x0
	edge8	%i6,	%o4,	%o0
loop_1091:
	call	loop_1092
	fmovscc	%xcc,	%f3,	%f4
	movpos	%icc,	0x67C,	%g3
	fbl,pt	%fcc2,	loop_1093
loop_1092:
	popc	0x00D9,	%l2
	nop
	setx	0x1C7690D4D5886EDF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x611175EB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f22,	%f14
	nop
	setx	0xC4C3071690663361,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_1093:
	ldstub	[%l7 + 0x28],	%o3
	fmovrdlz	%o1,	%f14,	%f30
	call	loop_1094
	fcmpeq16	%f14,	%f2,	%o7
	bvs,a	%icc,	loop_1095
	flush	%l7 + 0x78
loop_1094:
	fbue,pt	%fcc1,	loop_1096
	call	loop_1097
loop_1095:
	call	loop_1098
	tle	%icc,	0x4
loop_1096:
	movle	%xcc,	%g4,	%i1
loop_1097:
	fmovrslez	%i2,	%f27,	%f26
loop_1098:
	movgu	%xcc,	%o6,	%g1
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f11
	movug	%fcc1,	0x5C3,	%i5
	call	loop_1099
	flush	%l7 + 0x48
	call	loop_1100
	call	loop_1101
loop_1099:
	bmask	%o5,	%o2,	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g2,	%l0
loop_1100:
	nop
	set	0x65, %i3
	lduba	[%l7 + %i3] 0x04,	%l6
loop_1101:
	fxnors	%f29,	%f11,	%f29
	udivcc	%i4,	%l4,	%g7
	edge32n	%l5,	%i7,	%l3
	call	loop_1102
	nop
	setx loop_1103, %l0, %l1
	jmpl %l1, %g5
	call	loop_1104
	nop
	set	0x20, %l3
	stx	%i0,	[%l7 + %l3]
loop_1102:
	fmul8ulx16	%f18,	%f18,	%f16
loop_1103:
	fmovdvs	%icc,	%f8,	%f14
loop_1104:
	fnors	%f8,	%f7,	%f19
	addcc	%g6,	0x030E,	%l1
	fmovdcc	%xcc,	%f14,	%f22
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x22] %asi,	%i6
	fpack16	%f10,	%f17
	call	loop_1105
	smulcc	%o0,	%o4,	%g3
	call	loop_1106
	call	loop_1107
loop_1105:
	call	loop_1108
	fpadd32s	%f22,	%f6,	%f21
loop_1106:
	fsrc2s	%f5,	%f23
loop_1107:
	bvc,a	%icc,	loop_1109
loop_1108:
	bneg	%xcc,	loop_1110
	fmovsule	%fcc2,	%f4,	%f30
	rdpr	%cansave,	%l2
loop_1109:
	fmovsne	%fcc3,	%f28,	%f12
loop_1110:
	fmovrsne	%o1,	%f27,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bge,pt	%xcc,	loop_1111
	stx	%fsr,	[%l7 + 0x38]
	call	loop_1112
	prefetch	[%l7 + 0x70],	 3
loop_1111:
	call	loop_1113
	popc	0x1692,	%i1
loop_1112:
	membar	0x7B
	call	loop_1114
loop_1113:
	fmovdpos	%xcc,	%f22,	%f8
	fone	%f30
	wrpr	%o7,	0x122B,	%cwp
loop_1114:
	call	loop_1115
	call	loop_1116
	call	loop_1117
	call	loop_1118
loop_1115:
	fble,pt	%fcc1,	loop_1119
loop_1116:
	wr	%o6,	%g1,	%ccr
loop_1117:
	call	loop_1120
loop_1118:
	call	loop_1121
loop_1119:
	call	loop_1122
	call	loop_1123
loop_1120:
	call	loop_1124
loop_1121:
	movre	%i5,	%i2,	%o2
loop_1122:
	fcmpne16	%f20,	%f30,	%i3
loop_1123:
	fmovsgu	%xcc,	%f3,	%f31
loop_1124:
	fbug	%fcc0,	loop_1125
	sllx	%g2,	%o5,	%l6
	subc	%i4,	%l0,	%g7
	nop
	setx	0xAF28AE3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x628FF8D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f31,	%f19
loop_1125:
	tgu	%icc,	0x2
	call	loop_1126
	fpsub16s	%f15,	%f29,	%f14
	fornot1s	%f24,	%f3,	%f8
	fmovrdne	%l5,	%f24,	%f28
loop_1126:
	faligndata	%f14,	%f10,	%f20
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f5
	alignaddr	%l4,	%l3,	%g5
	nop
	fitos	%f11,	%f4
	fstox	%f4,	%f6
	call	loop_1127
	fpsub16	%f18,	%f22,	%f14
	call	loop_1128
	fcmple16	%f10,	%f22,	%i7
loop_1127:
	add	%i0,	%g6,	%l1
	umul	%o0,	0x140E,	%i6
loop_1128:
	rd	%asi,	%g3
	fmovsge	%icc,	%f6,	%f7
	set	0x16, %l1
	stha	%o4,	[%l7 + %l1] 0x22
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g4,	0x00,	%i1
	fbuge,a,pn	%fcc1,	loop_1129
	movn	%icc,	%o7,	%o6
	umulcc	%l2,	%g1,	%i2
	call	loop_1130
loop_1129:
	or	%o2,	%i3,	%i5
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43B, 	%hsys_tick_cmpr
loop_1130:
	movle	%xcc,	0x649,	%g2
	edge8	%i4,	%l6,	%l0
	call	loop_1131
	fpadd16s	%f23,	%f5,	%f15
	bcs,a	%icc,	loop_1132
	fmul8ulx16	%f24,	%f8,	%f16
loop_1131:
	call	loop_1133
	for	%f12,	%f2,	%f26
loop_1132:
	fcmple16	%f2,	%f26,	%g7
	movleu	%icc,	0x4DC,	%l5
loop_1133:
	edge8	%l4,	%g5,	%l3
	te	%icc,	0x2
	fandnot1	%f6,	%f20,	%f28
	call	loop_1134
	fmovdo	%fcc2,	%f14,	%f8
	call	loop_1135
	fmuld8sux16	%f6,	%f30,	%f0
loop_1134:
	nop
	fitos	%f29,	%f16
	movg	%icc,	0x2E4,	%i0
loop_1135:
	call	loop_1136
	call	loop_1137
	call	loop_1138
	fmovdg	%icc,	%f12,	%f10
loop_1136:
	fxors	%f22,	%f4,	%f23
loop_1137:
	edge32l	%g6,	%l1,	%i7
loop_1138:
	rdhpr	%hpstate,	%i6
	movcs	%xcc,	%g3,	%o4
	edge16ln	%o0,	%o1,	%o3
	fbuge,a	%fcc3,	loop_1139
	call	loop_1140
	fcmple32	%f24,	%f30,	%i1
	move	%fcc1,	0x613,	%g4
loop_1139:
	array32	%o6,	%l2,	%o7
loop_1140:
	call	loop_1141
	fmovdule	%fcc3,	%f26,	%f28
	alignaddrl	%g1,	%i2,	%i3
	fmovda	%fcc1,	%f14,	%f20
loop_1141:
	call	loop_1142
	call	loop_1143
	rd	%ccr,	%o2
	movneg	%icc,	%i5,	%o5
loop_1142:
	call	loop_1144
loop_1143:
	wrpr	%i4,	%l6,	%tick
	nop
	fitos	%f0,	%f12
	fstod	%f12,	%f10
	fmovdo	%fcc1,	%f14,	%f28
loop_1144:
	call	loop_1145
	bshuffle	%f12,	%f6,	%f18
	call	loop_1146
	fmovsgu	%xcc,	%f26,	%f11
loop_1145:
	nop
	setx	0xDD2A31D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x949D6155,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f19,	%f7
	fcmple32	%f20,	%f30,	%l0
loop_1146:
	nop
	set	0x78, %g3
	stx	%fsr,	[%l7 + %g3]
	fmovduge	%fcc0,	%f26,	%f18
	fexpand	%f17,	%f26
	movrlz	%g7,	0x363,	%g2
	fbul,a	%fcc1,	loop_1147
	bmask	%l4,	%l5,	%g5
	fsrc2	%f26,	%f8
	call	loop_1148
loop_1147:
	call	loop_1149
	membar	0x7C
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%i0
loop_1148:
	andcc	%l3,	0x0A7C,	%l1
loop_1149:
	st	%f30,	[%l7 + 0x28]
	fsrc1	%f24,	%f14
	edge32ln	%g6,	%i7,	%g3
	rdhpr	%ver,	%o4
	call	loop_1150
	call	loop_1151
	call	loop_1152
	rdhpr	%ver,	%o0
loop_1150:
	call	loop_1153
loop_1151:
	xnor	%i6,	%o1,	%i1
loop_1152:
	fone	%f26
	fmovrslez	%o3,	%f15,	%f10
loop_1153:
	rdpr	%cleanwin,	%o6
	call	loop_1154
	andn	%g4,	%l2,	%o7
	fmovsle	%xcc,	%f13,	%f0
	call	loop_1155
loop_1154:
	nop
	set	0x44, %i7
	sth	%g1,	[%l7 + %i7]
	call	loop_1156
	fsrc1	%f0,	%f30
loop_1155:
	fmovsu	%fcc0,	%f8,	%f4
	movpos	%xcc,	%i2,	%o2
loop_1156:
	call	loop_1157
	call	loop_1158
	fornot2	%f0,	%f20,	%f4
	wr	%i3,	%o5,	%softint
loop_1157:
	subcc	%i4,	%l6,	%i5
loop_1158:
	fbg,a	%fcc3,	loop_1159
	flushw
	bvc,a	%xcc,	loop_1160
	bne,a	%xcc,	loop_1161
loop_1159:
	fsrc2	%f4,	%f30
	movle	%fcc0,	%l0,	%g2
loop_1160:
	siam	0x0
loop_1161:
	fmovdule	%fcc3,	%f16,	%f24
	tle	%icc,	0x1
	fones	%f7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x12] %asi,	%l4
	fbue	%fcc1,	loop_1162
	call	loop_1163
	call	loop_1164
	udiv	%g7,	%l5,	%i0
loop_1162:
	tcc	%icc,	0x2
loop_1163:
	ba,pn	%icc,	loop_1165
loop_1164:
	fxnors	%f2,	%f10,	%f25
	fmovdpos	%icc,	%f30,	%f0
	rdhpr	%hpstate,	%g5
loop_1165:
	nop
	fitos	%f7,	%f17
	fstox	%f17,	%f26
	fpsub32	%f30,	%f16,	%f26
	te	%icc,	0x3
	fcmpgt32	%f20,	%f12,	%l3
	fpack32	%f14,	%f0,	%f22
	call	loop_1166
	call	loop_1167
	movrlz	%l1,	%i7,	%g3
	fnegd	%f28,	%f8
loop_1166:
	tl	%icc,	0x1
loop_1167:
	nop
	setx	loop_1168,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014400001403,	%l0,	%l1
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
	nop
	fitos	%f10,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f16
	fmovso	%fcc2,	%f22,	%f29
	movrgz	%g6,	%o4,	%i6
loop_1168:
	movrlz	%o1,	0x22E,	%o0
	edge32ln	%i1,	%o6,	%g4
	call	loop_1169
	fmul8ulx16	%f0,	%f20,	%f18
	nop
	setx	0xAD8FEB0D2DC266B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x44CC9B2952660A6E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f14
	call	loop_1170
loop_1169:
	call	loop_1171
	brgez	%l2,	loop_1172
	tsubcc	%o7,	0x05F4,	%o3
loop_1170:
	call	loop_1173
loop_1171:
	tgu	%icc,	0x0
loop_1172:
	call	loop_1174
	movn	%fcc1,	0x7DF,	%i2
loop_1173:
	ldsb	[%l7 + 0x50],	%o2
	call	loop_1175
loop_1174:
	fandnot2	%f18,	%f10,	%f6
	fxnor	%f16,	%f2,	%f18
	fmovsge	%xcc,	%f15,	%f13
loop_1175:
	movo	%fcc0,	0x573,	%g1
	fpadd16s	%f28,	%f27,	%f6
	and	%o5,	%i4,	%l6
	fmovsul	%fcc1,	%f11,	%f12
	fnot2	%f18,	%f24
	wr	%i5,	%l0,	%sys_tick
	siam	0x4
	call	loop_1176
	call	loop_1177
	wr 	%g0, 	0x6, 	%fprs
	call	loop_1178
loop_1176:
	fmovsul	%fcc2,	%f8,	%f26
loop_1177:
	ba,a,pn	%icc,	loop_1179
	edge8	%l4,	%g7,	%l5
loop_1178:
	for	%f30,	%f30,	%f18
	nop
	setx	0xB4201A80AFF4D501,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f12
loop_1179:
	fabss	%f30,	%f1
	call	loop_1180
	tl	%icc,	0x5
	popc	0x0082,	%i3
	fnor	%f30,	%f10,	%f16
loop_1180:
	fcmpeq32	%f16,	%f8,	%i0
	fsrc2	%f26,	%f22
	bvs,a	%xcc,	loop_1181
	call	loop_1182
	movrgez	%l3,	%l1,	%g5
	swap	[%l7 + 0x1C],	%g3
loop_1181:
	fmovrdne	%i7,	%f10,	%f22
loop_1182:
	stw	%o4,	[%l7 + 0x20]
	rd	%fprs,	%i6
	xorcc	%g6,	%o0,	%i1
	call	loop_1183
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovso	%fcc0,	%f16,	%f5
	nop
	setx	0xDF41F73D7A8C3875,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x9B5AFE3516F15B34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f28,	%f24
loop_1183:
	call	loop_1184
	call	loop_1185
	fornot2s	%f9,	%f22,	%f1
	call	loop_1186
loop_1184:
	call	loop_1187
loop_1185:
	addccc	%o6,	0x0555,	%o1
	orcc	%l2,	0x1173,	%g4
loop_1186:
	fnands	%f25,	%f1,	%f26
loop_1187:
	call	loop_1188
	call	loop_1189
	call	loop_1190
	call	loop_1191
loop_1188:
	edge16l	%o7,	%i2,	%o2
loop_1189:
	call	loop_1192
loop_1190:
	call	loop_1193
loop_1191:
	rd	%ccr,	%o3
	fcmpne32	%f14,	%f2,	%o5
loop_1192:
	nop
	wr	%g0,	0x10,	%asi
	stda	%g0,	[%l7 + 0x38] %asi
loop_1193:
	call	loop_1194
	call	loop_1195
	call	loop_1196
	fpadd16	%f12,	%f26,	%f10
loop_1194:
	fmovsgu	%icc,	%f18,	%f7
loop_1195:
	fmovsug	%fcc0,	%f26,	%f24
loop_1196:
	call	loop_1197
	call	loop_1198
	fmovrslz	%l6,	%f19,	%f16
	fnor	%f6,	%f30,	%f0
loop_1197:
	fpadd16s	%f22,	%f31,	%f13
loop_1198:
	call	loop_1199
	call	loop_1200
	and	%i5,	%l0,	%i4
	udivcc	%l4,	%g2,	%g7
loop_1199:
	fnot1	%f26,	%f30
loop_1200:
	fmovsa	%xcc,	%f15,	%f14
	rdpr	%tba,	%i3
	call	loop_1201
	edge16l	%l5,	%i0,	%l3
	fbu,a	%fcc0,	loop_1202
	subccc	%l1,	0x1E26,	%g3
loop_1201:
	call	loop_1203
	movre	%i7,	0x18D,	%o4
loop_1202:
	and	%i6,	0x06F4,	%g6
	be,pn	%xcc,	loop_1204
loop_1203:
	edge32n	%g5,	%i1,	%o0
loop_1204:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 25
!	Type a   	: 26
!	Type x   	: 8
!	Type cti   	: 162
!	Type f   	: 154
!	Type i   	: 125
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x95882D53
.word 0x0C904B0A
.word 0xAE3DCE5F
.word 0x4F06FE5F
.word 0xEC1EEA1A
.word 0xD14292EF
.word 0xF7D743A7
.word 0x6600E0E5
.word 0x6EBA18F2
.word 0xF4E012D0
.word 0x8BCC946A
.word 0x9476B392
.word 0x7B35E23B
.word 0xC281522A
.word 0xAAFF4EAE
.word 0x141C4C01
.word 0x891CACFE
.word 0x5989E762
.word 0x81038700
.word 0xEAA819C5
.word 0xA523FCC5
.word 0x825B7F50
.word 0x485FC78D
.word 0x29344201
.word 0x0FAB27FA
.word 0x3809C43A
.word 0x0F429CC9
.word 0x40F6D961
.word 0x6E2298CF
.word 0xB22DF02C
.word 0x53620A1E
.word 0x11B50FB3
.word 0x2CB980A3
.word 0x0F4B7BBE
.word 0x556BF849
.word 0x73B3B042
.word 0xA6C19496
.word 0xD4C5DEBA
.word 0xFFFCEDE8
.word 0x3FD28CCF
.word 0x42669B5F
.word 0xF503296B
.word 0xCD89CD20
.word 0xAA624730
.word 0x1DE44A6A
.word 0xF1D01E62
.word 0x8607D850
.word 0x10EA1778
.word 0x23ECA78A
.word 0x9F7F0346
.word 0x933887CA
.word 0xC6BF5AAA
.word 0x30AB4BA5
.word 0x80C88F5A
.word 0x2B66A41B
.word 0x97B5397E
.word 0x62756906
.word 0x4217FC8B
.word 0x9F5137C1
.word 0x826AF6B7
.word 0x2FB03BD5
.word 0x78C870B0
.word 0xAD9D1124
.word 0xEC02733A
.end
